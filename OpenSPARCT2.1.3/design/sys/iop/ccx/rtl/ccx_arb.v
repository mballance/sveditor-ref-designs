// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccx_arb.v
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
`ifndef FPGA
module ccx_arb (
  arb_grant_a, 
  arb_q0_holdbar_a, 
  arb_qsel0_a, 
  arb_qsel1_a, 
  arb_shift_a, 
  arb_src0_grant_a, 
  arb_src1_grant_a, 
  arb_src2_grant_a, 
  arb_src3_grant_a, 
  arb_src4_grant_a, 
  arb_src5_grant_a, 
  arb_src6_grant_a, 
  arb_src7_grant_a, 
  arb_src8_grant_a, 
  ccx_dest_atom_a, 
  ccx_dest_data_rdy_a, 
  src0_arb_atom_q, 
  src0_arb_req_q, 
  src1_arb_atom_q, 
  src1_arb_req_q, 
  src2_arb_atom_q, 
  src2_arb_req_q, 
  src3_arb_atom_q, 
  src3_arb_req_q, 
  src4_arb_atom_q, 
  src4_arb_req_q, 
  src5_arb_atom_q, 
  src5_arb_req_q, 
  src6_arb_atom_q, 
  src6_arb_req_q, 
  src7_arb_atom_q, 
  src7_arb_req_q, 
  src8_arb_atom_q, 
  src8_arb_req_q, 
  stall_q_d1, 
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  ccx_aclk, 
  ccx_bclk, 
  scan_out);
wire direction;
wire [17:0] write_fifo_a;
wire [2:0] fifo_rptr_a;
wire [1:0] fifo_read_select;
wire input_req_sel_a;
wire input_req_sel_a_;
wire fifo_req_sel_a;
wire [8:0] qfullbar_a;
wire [8:0] atom_x;
wire [8:0] grant_a;
wire req_pkt_empty_a;
wire arc_scanin;
wire arc_scanout;
wire tcu_pce_ov_out;
wire tcu_scan_en_out;
wire ccx_aclk_out;
wire ccx_bclk_out;
wire ard_scanin;
wire ard_scanout;
wire [8:0] atom_a;
wire [8:0] req_a;


// Beginning of automatic outputs (from unused autoinst outputs)
output [8:0]            arb_grant_a;            // From i_arbdp of ccx_ard_dp.v
output [8:0]            arb_q0_holdbar_a;          // From i_arbctl of ccx_arc_ctl.v
output [8:0]            arb_qsel0_a;            // From i_arbctl of ccx_arc_ctl.v
output [8:0]            arb_qsel1_a;            // From i_arbctl of ccx_arc_ctl.v
output [8:0]            arb_shift_a;            // From i_arbctl of ccx_arc_ctl.v
output                  arb_src0_grant_a;       // From i_arbdp of ccx_ard_dp.v
output                  arb_src1_grant_a;       // From i_arbdp of ccx_ard_dp.v
output                  arb_src2_grant_a;       // From i_arbdp of ccx_ard_dp.v
output                  arb_src3_grant_a;       // From i_arbdp of ccx_ard_dp.v
output                  arb_src4_grant_a;       // From i_arbdp of ccx_ard_dp.v
output                  arb_src5_grant_a;       // From i_arbdp of ccx_ard_dp.v
output                  arb_src6_grant_a;       // From i_arbdp of ccx_ard_dp.v
output                  arb_src7_grant_a;       // From i_arbdp of ccx_ard_dp.v
output                  arb_src8_grant_a;       // From i_arbdp of ccx_ard_dp.v
output                  ccx_dest_atom_a;        // From i_arbctl of ccx_arc_ctl.v
output                  ccx_dest_data_rdy_a;    // From i_arbctl of ccx_arc_ctl.v

// End of automatics


// Beginning of automatic inputs (from unused autoinst inputs)

input                   src0_arb_atom_q;        // To i_arbctl of ccx_arc_ctl.v, ...
input                   src0_arb_req_q;         // To i_arbctl of ccx_arc_ctl.v, ...
input                   src1_arb_atom_q;        // To i_arbctl of ccx_arc_ctl.v, ...
input                   src1_arb_req_q;         // To i_arbctl of ccx_arc_ctl.v, ...
input                   src2_arb_atom_q;        // To i_arbctl of ccx_arc_ctl.v, ...
input                   src2_arb_req_q;         // To i_arbctl of ccx_arc_ctl.v, ...
input                   src3_arb_atom_q;        // To i_arbctl of ccx_arc_ctl.v, ...
input                   src3_arb_req_q;         // To i_arbctl of ccx_arc_ctl.v, ...
input                   src4_arb_atom_q;        // To i_arbctl of ccx_arc_ctl.v, ...
input                   src4_arb_req_q;         // To i_arbctl of ccx_arc_ctl.v, ...
input                   src5_arb_atom_q;        // To i_arbctl of ccx_arc_ctl.v, ...
input                   src5_arb_req_q;         // To i_arbctl of ccx_arc_ctl.v, ...
input                   src6_arb_atom_q;        // To i_arbctl of ccx_arc_ctl.v, ...
input                   src6_arb_req_q;         // To i_arbctl of ccx_arc_ctl.v, ...
input                   src7_arb_atom_q;        // To i_arbctl of ccx_arc_ctl.v, ...
input                   src7_arb_req_q;         // To i_arbctl of ccx_arc_ctl.v, ...
input                   src8_arb_atom_q;        // To i_arbctl of ccx_arc_ctl.v, ...
input                   src8_arb_req_q;         // To i_arbctl of ccx_arc_ctl.v, ...
input                   stall_q_d1;                // To i_arbctl of ccx_arc_ctl.v
// End of automatics

//globals
input tcu_scan_en ;
input           l2clk;
input           scan_in;
input           tcu_pce_ov;             // scan signals
input           ccx_aclk;
input           ccx_bclk;
output          scan_out;

ccx_arc_ctl arc (
   /*AUTOINST*/
                 // Outputs
                 .direction             (direction),
                 .write_fifo_a          (write_fifo_a[17:0]),
                 .fifo_rptr_a           (fifo_rptr_a[2:0]),
                 .fifo_read_select      (fifo_read_select[1:0]),
                 .input_req_sel_a       (input_req_sel_a),
                 .input_req_sel_a_      (input_req_sel_a_),
                 .fifo_req_sel_a        (fifo_req_sel_a),
                 .qfullbar_a            (qfullbar_a[8:0]),
                 .atom_x                (atom_x[8:0]),
                 .arb_qsel0_a           (arb_qsel0_a[8:0]),
                 .arb_qsel1_a           (arb_qsel1_a[8:0]),
                 .arb_shift_a           (arb_shift_a[8:0]),
                 .arb_q0_holdbar_a      (arb_q0_holdbar_a[8:0]),
                 // Inputs
                 .grant_a               (grant_a[8:0]),
                 .req_pkt_empty_a       (req_pkt_empty_a),
                 .scan_in(arc_scanin),
                 .scan_out(arc_scanout),
                 .l2clk                 (l2clk),
                 .tcu_pce_ov            (tcu_pce_ov_out),
                 .tcu_scan_en           (tcu_scan_en_out),
                 .ccx_aclk           (ccx_aclk_out),
                 .ccx_bclk            (ccx_bclk_out),
  .atom_a(atom_a[8:0]),
  .req_a(req_a[8:0])
);

ccx_ard_dp ard (
   /*AUTOINST*/
                // Outputs
                .arb_grant_a            (arb_grant_a[8:0]),
                .arb_src8_grant_a       (arb_src8_grant_a),
                .arb_src7_grant_a       (arb_src7_grant_a),
                .arb_src6_grant_a       (arb_src6_grant_a),
                .arb_src5_grant_a       (arb_src5_grant_a),
                .arb_src4_grant_a       (arb_src4_grant_a),
                .arb_src3_grant_a       (arb_src3_grant_a),
                .arb_src2_grant_a       (arb_src2_grant_a),
                .arb_src1_grant_a       (arb_src1_grant_a),
                .arb_src0_grant_a       (arb_src0_grant_a),
                .ccx_dest_data_rdy_a   (ccx_dest_data_rdy_a),
                .ccx_dest_atom_a        (ccx_dest_atom_a),
                .req_pkt_empty_a        (req_pkt_empty_a),
                .grant_a                (grant_a[8:0]),
                // Inputs
                .src8_arb_atom_q        (src8_arb_atom_q),
                .src7_arb_atom_q        (src7_arb_atom_q),
                .src6_arb_atom_q        (src6_arb_atom_q),
                .src5_arb_atom_q        (src5_arb_atom_q),
                .src4_arb_atom_q        (src4_arb_atom_q),
                .src3_arb_atom_q        (src3_arb_atom_q),
                .src2_arb_atom_q        (src2_arb_atom_q),
                .src1_arb_atom_q        (src1_arb_atom_q),
                .src0_arb_atom_q        (src0_arb_atom_q),
                .src8_arb_req_q         (src8_arb_req_q),
                .src7_arb_req_q         (src7_arb_req_q),
                .src6_arb_req_q         (src6_arb_req_q),
                .src5_arb_req_q         (src5_arb_req_q),
                .src4_arb_req_q         (src4_arb_req_q),
                .src3_arb_req_q         (src3_arb_req_q),
                .src2_arb_req_q         (src2_arb_req_q),
                .src1_arb_req_q         (src1_arb_req_q),
                .src0_arb_req_q         (src0_arb_req_q),
                .qfullbar_a             (qfullbar_a[8:0]),
                .direction              (direction),
                .fifo_req_sel_a         (fifo_req_sel_a),
                .input_req_sel_a        (input_req_sel_a),
                .input_req_sel_a_       (input_req_sel_a_),
                .write_fifo_a           (write_fifo_a[17:0]),
                .fifo_rptr_a            (fifo_rptr_a[2:0]),
                .fifo_read_select       (fifo_read_select[1:0]),
                .atom_x                 (atom_x[8:0]),
                .stall_q_d1                (stall_q_d1),
                .scan_in(ard_scanin),
                .scan_out(ard_scanout),
                .l2clk                  (l2clk),
                .tcu_pce_ov             (tcu_pce_ov),
  .req_a(req_a[8:0]),
  .atom_a(atom_a[8:0]),
  .tcu_scan_en(tcu_scan_en),
  .ccx_aclk(ccx_aclk),
  .ccx_bclk(ccx_bclk),
  .tcu_pce_ov_out(tcu_pce_ov_out),
  .tcu_scan_en_out(tcu_scan_en_out),
  .ccx_aclk_out(ccx_aclk_out),
  .ccx_bclk_out(ccx_bclk_out));

			 
// fixscan start:
assign arc_scanin                = scan_in                  ;
assign ard_scanin                = arc_scanout              ;
assign scan_out                  = ard_scanout              ;
// fixscan end:
endmodule
   
// Local Variables:
// verilog-library-directories:("." "./v")
// End:




// any PARAMS parms go into naming of macro

module ccx_arb_l1clkhdr_ctl_macro (
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

module ccx_arb_msff_ctl_macro__width_5 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0];






dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ccx_arb_msff_ctl_macro (
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


module ccx_arb_spare_ctl_macro__num_10 (
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
wire si_3;
wire so_3;
wire spare3_flop_unused;
wire spare3_buf_32x_unused;
wire spare3_nand3_8x_unused;
wire spare3_inv_8x_unused;
wire spare3_aoi22_4x_unused;
wire spare3_buf_8x_unused;
wire spare3_oai22_4x_unused;
wire spare3_inv_16x_unused;
wire spare3_nand2_16x_unused;
wire spare3_nor3_4x_unused;
wire spare3_nand2_8x_unused;
wire spare3_buf_16x_unused;
wire spare3_nor2_16x_unused;
wire spare3_inv_32x_unused;
wire si_4;
wire so_4;
wire spare4_flop_unused;
wire spare4_buf_32x_unused;
wire spare4_nand3_8x_unused;
wire spare4_inv_8x_unused;
wire spare4_aoi22_4x_unused;
wire spare4_buf_8x_unused;
wire spare4_oai22_4x_unused;
wire spare4_inv_16x_unused;
wire spare4_nand2_16x_unused;
wire spare4_nor3_4x_unused;
wire spare4_nand2_8x_unused;
wire spare4_buf_16x_unused;
wire spare4_nor2_16x_unused;
wire spare4_inv_32x_unused;
wire si_5;
wire so_5;
wire spare5_flop_unused;
wire spare5_buf_32x_unused;
wire spare5_nand3_8x_unused;
wire spare5_inv_8x_unused;
wire spare5_aoi22_4x_unused;
wire spare5_buf_8x_unused;
wire spare5_oai22_4x_unused;
wire spare5_inv_16x_unused;
wire spare5_nand2_16x_unused;
wire spare5_nor3_4x_unused;
wire spare5_nand2_8x_unused;
wire spare5_buf_16x_unused;
wire spare5_nor2_16x_unused;
wire spare5_inv_32x_unused;
wire si_6;
wire so_6;
wire spare6_flop_unused;
wire spare6_buf_32x_unused;
wire spare6_nand3_8x_unused;
wire spare6_inv_8x_unused;
wire spare6_aoi22_4x_unused;
wire spare6_buf_8x_unused;
wire spare6_oai22_4x_unused;
wire spare6_inv_16x_unused;
wire spare6_nand2_16x_unused;
wire spare6_nor3_4x_unused;
wire spare6_nand2_8x_unused;
wire spare6_buf_16x_unused;
wire spare6_nor2_16x_unused;
wire spare6_inv_32x_unused;
wire si_7;
wire so_7;
wire spare7_flop_unused;
wire spare7_buf_32x_unused;
wire spare7_nand3_8x_unused;
wire spare7_inv_8x_unused;
wire spare7_aoi22_4x_unused;
wire spare7_buf_8x_unused;
wire spare7_oai22_4x_unused;
wire spare7_inv_16x_unused;
wire spare7_nand2_16x_unused;
wire spare7_nor3_4x_unused;
wire spare7_nand2_8x_unused;
wire spare7_buf_16x_unused;
wire spare7_nor2_16x_unused;
wire spare7_inv_32x_unused;
wire si_8;
wire so_8;
wire spare8_flop_unused;
wire spare8_buf_32x_unused;
wire spare8_nand3_8x_unused;
wire spare8_inv_8x_unused;
wire spare8_aoi22_4x_unused;
wire spare8_buf_8x_unused;
wire spare8_oai22_4x_unused;
wire spare8_inv_16x_unused;
wire spare8_nand2_16x_unused;
wire spare8_nor3_4x_unused;
wire spare8_nand2_8x_unused;
wire spare8_buf_16x_unused;
wire spare8_nor2_16x_unused;
wire spare8_inv_32x_unused;
wire si_9;
wire so_9;
wire spare9_flop_unused;
wire spare9_buf_32x_unused;
wire spare9_nand3_8x_unused;
wire spare9_inv_8x_unused;
wire spare9_aoi22_4x_unused;
wire spare9_buf_8x_unused;
wire spare9_oai22_4x_unused;
wire spare9_inv_16x_unused;
wire spare9_nand2_16x_unused;
wire spare9_nor3_4x_unused;
wire spare9_nand2_8x_unused;
wire spare9_buf_16x_unused;
wire spare9_nor2_16x_unused;
wire spare9_inv_32x_unused;


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

cl_sc1_msff_8x spare3_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_3),
                               .so(so_3),
                               .d(1'b0),
                               .q(spare3_flop_unused));
assign si_3 = so_2;

cl_u1_buf_32x   spare3_buf_32x (.in(1'b1),
                                   .out(spare3_buf_32x_unused));
cl_u1_nand3_8x spare3_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare3_nand3_8x_unused));
cl_u1_inv_8x    spare3_inv_8x (.in(1'b1),
                                  .out(spare3_inv_8x_unused));
cl_u1_aoi22_4x spare3_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_aoi22_4x_unused));
cl_u1_buf_8x    spare3_buf_8x (.in(1'b1),
                                  .out(spare3_buf_8x_unused));
cl_u1_oai22_4x spare3_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_oai22_4x_unused));
cl_u1_inv_16x   spare3_inv_16x (.in(1'b1),
                                   .out(spare3_inv_16x_unused));
cl_u1_nand2_16x spare3_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare3_nand2_16x_unused));
cl_u1_nor3_4x spare3_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare3_nor3_4x_unused));
cl_u1_nand2_8x spare3_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare3_nand2_8x_unused));
cl_u1_buf_16x   spare3_buf_16x (.in(1'b1),
                                   .out(spare3_buf_16x_unused));
cl_u1_nor2_16x spare3_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare3_nor2_16x_unused));
cl_u1_inv_32x   spare3_inv_32x (.in(1'b1),
                                   .out(spare3_inv_32x_unused));

cl_sc1_msff_8x spare4_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_4),
                               .so(so_4),
                               .d(1'b0),
                               .q(spare4_flop_unused));
assign si_4 = so_3;

cl_u1_buf_32x   spare4_buf_32x (.in(1'b1),
                                   .out(spare4_buf_32x_unused));
cl_u1_nand3_8x spare4_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare4_nand3_8x_unused));
cl_u1_inv_8x    spare4_inv_8x (.in(1'b1),
                                  .out(spare4_inv_8x_unused));
cl_u1_aoi22_4x spare4_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_aoi22_4x_unused));
cl_u1_buf_8x    spare4_buf_8x (.in(1'b1),
                                  .out(spare4_buf_8x_unused));
cl_u1_oai22_4x spare4_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_oai22_4x_unused));
cl_u1_inv_16x   spare4_inv_16x (.in(1'b1),
                                   .out(spare4_inv_16x_unused));
cl_u1_nand2_16x spare4_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare4_nand2_16x_unused));
cl_u1_nor3_4x spare4_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare4_nor3_4x_unused));
cl_u1_nand2_8x spare4_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare4_nand2_8x_unused));
cl_u1_buf_16x   spare4_buf_16x (.in(1'b1),
                                   .out(spare4_buf_16x_unused));
cl_u1_nor2_16x spare4_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare4_nor2_16x_unused));
cl_u1_inv_32x   spare4_inv_32x (.in(1'b1),
                                   .out(spare4_inv_32x_unused));

cl_sc1_msff_8x spare5_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_5),
                               .so(so_5),
                               .d(1'b0),
                               .q(spare5_flop_unused));
assign si_5 = so_4;

cl_u1_buf_32x   spare5_buf_32x (.in(1'b1),
                                   .out(spare5_buf_32x_unused));
cl_u1_nand3_8x spare5_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare5_nand3_8x_unused));
cl_u1_inv_8x    spare5_inv_8x (.in(1'b1),
                                  .out(spare5_inv_8x_unused));
cl_u1_aoi22_4x spare5_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_aoi22_4x_unused));
cl_u1_buf_8x    spare5_buf_8x (.in(1'b1),
                                  .out(spare5_buf_8x_unused));
cl_u1_oai22_4x spare5_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_oai22_4x_unused));
cl_u1_inv_16x   spare5_inv_16x (.in(1'b1),
                                   .out(spare5_inv_16x_unused));
cl_u1_nand2_16x spare5_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare5_nand2_16x_unused));
cl_u1_nor3_4x spare5_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare5_nor3_4x_unused));
cl_u1_nand2_8x spare5_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare5_nand2_8x_unused));
cl_u1_buf_16x   spare5_buf_16x (.in(1'b1),
                                   .out(spare5_buf_16x_unused));
cl_u1_nor2_16x spare5_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare5_nor2_16x_unused));
cl_u1_inv_32x   spare5_inv_32x (.in(1'b1),
                                   .out(spare5_inv_32x_unused));

cl_sc1_msff_8x spare6_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_6),
                               .so(so_6),
                               .d(1'b0),
                               .q(spare6_flop_unused));
assign si_6 = so_5;

cl_u1_buf_32x   spare6_buf_32x (.in(1'b1),
                                   .out(spare6_buf_32x_unused));
cl_u1_nand3_8x spare6_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare6_nand3_8x_unused));
cl_u1_inv_8x    spare6_inv_8x (.in(1'b1),
                                  .out(spare6_inv_8x_unused));
cl_u1_aoi22_4x spare6_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_aoi22_4x_unused));
cl_u1_buf_8x    spare6_buf_8x (.in(1'b1),
                                  .out(spare6_buf_8x_unused));
cl_u1_oai22_4x spare6_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_oai22_4x_unused));
cl_u1_inv_16x   spare6_inv_16x (.in(1'b1),
                                   .out(spare6_inv_16x_unused));
cl_u1_nand2_16x spare6_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare6_nand2_16x_unused));
cl_u1_nor3_4x spare6_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare6_nor3_4x_unused));
cl_u1_nand2_8x spare6_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare6_nand2_8x_unused));
cl_u1_buf_16x   spare6_buf_16x (.in(1'b1),
                                   .out(spare6_buf_16x_unused));
cl_u1_nor2_16x spare6_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare6_nor2_16x_unused));
cl_u1_inv_32x   spare6_inv_32x (.in(1'b1),
                                   .out(spare6_inv_32x_unused));

cl_sc1_msff_8x spare7_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_7),
                               .so(so_7),
                               .d(1'b0),
                               .q(spare7_flop_unused));
assign si_7 = so_6;

cl_u1_buf_32x   spare7_buf_32x (.in(1'b1),
                                   .out(spare7_buf_32x_unused));
cl_u1_nand3_8x spare7_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare7_nand3_8x_unused));
cl_u1_inv_8x    spare7_inv_8x (.in(1'b1),
                                  .out(spare7_inv_8x_unused));
cl_u1_aoi22_4x spare7_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_aoi22_4x_unused));
cl_u1_buf_8x    spare7_buf_8x (.in(1'b1),
                                  .out(spare7_buf_8x_unused));
cl_u1_oai22_4x spare7_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_oai22_4x_unused));
cl_u1_inv_16x   spare7_inv_16x (.in(1'b1),
                                   .out(spare7_inv_16x_unused));
cl_u1_nand2_16x spare7_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare7_nand2_16x_unused));
cl_u1_nor3_4x spare7_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare7_nor3_4x_unused));
cl_u1_nand2_8x spare7_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare7_nand2_8x_unused));
cl_u1_buf_16x   spare7_buf_16x (.in(1'b1),
                                   .out(spare7_buf_16x_unused));
cl_u1_nor2_16x spare7_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare7_nor2_16x_unused));
cl_u1_inv_32x   spare7_inv_32x (.in(1'b1),
                                   .out(spare7_inv_32x_unused));

cl_sc1_msff_8x spare8_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_8),
                               .so(so_8),
                               .d(1'b0),
                               .q(spare8_flop_unused));
assign si_8 = so_7;

cl_u1_buf_32x   spare8_buf_32x (.in(1'b1),
                                   .out(spare8_buf_32x_unused));
cl_u1_nand3_8x spare8_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare8_nand3_8x_unused));
cl_u1_inv_8x    spare8_inv_8x (.in(1'b1),
                                  .out(spare8_inv_8x_unused));
cl_u1_aoi22_4x spare8_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_aoi22_4x_unused));
cl_u1_buf_8x    spare8_buf_8x (.in(1'b1),
                                  .out(spare8_buf_8x_unused));
cl_u1_oai22_4x spare8_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_oai22_4x_unused));
cl_u1_inv_16x   spare8_inv_16x (.in(1'b1),
                                   .out(spare8_inv_16x_unused));
cl_u1_nand2_16x spare8_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare8_nand2_16x_unused));
cl_u1_nor3_4x spare8_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare8_nor3_4x_unused));
cl_u1_nand2_8x spare8_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare8_nand2_8x_unused));
cl_u1_buf_16x   spare8_buf_16x (.in(1'b1),
                                   .out(spare8_buf_16x_unused));
cl_u1_nor2_16x spare8_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare8_nor2_16x_unused));
cl_u1_inv_32x   spare8_inv_32x (.in(1'b1),
                                   .out(spare8_inv_32x_unused));

cl_sc1_msff_8x spare9_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_9),
                               .so(so_9),
                               .d(1'b0),
                               .q(spare9_flop_unused));
assign si_9 = so_8;

cl_u1_buf_32x   spare9_buf_32x (.in(1'b1),
                                   .out(spare9_buf_32x_unused));
cl_u1_nand3_8x spare9_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare9_nand3_8x_unused));
cl_u1_inv_8x    spare9_inv_8x (.in(1'b1),
                                  .out(spare9_inv_8x_unused));
cl_u1_aoi22_4x spare9_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_aoi22_4x_unused));
cl_u1_buf_8x    spare9_buf_8x (.in(1'b1),
                                  .out(spare9_buf_8x_unused));
cl_u1_oai22_4x spare9_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_oai22_4x_unused));
cl_u1_inv_16x   spare9_inv_16x (.in(1'b1),
                                   .out(spare9_inv_16x_unused));
cl_u1_nand2_16x spare9_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare9_nand2_16x_unused));
cl_u1_nor3_4x spare9_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare9_nor3_4x_unused));
cl_u1_nand2_8x spare9_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare9_nand2_8x_unused));
cl_u1_buf_16x   spare9_buf_16x (.in(1'b1),
                                   .out(spare9_buf_16x_unused));
cl_u1_nor2_16x spare9_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare9_nor2_16x_unused));
cl_u1_inv_32x   spare9_inv_32x (.in(1'b1),
                                   .out(spare9_inv_32x_unused));
assign scan_out = so_9;



endmodule



//
//   buff macro
//
//





module ccx_arb_buff_macro__dbuff_16x__stack_none__width_4 (
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

module ccx_arb_msff_macro__dmsff_16x__stack_10c__width_10 (
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
wire [8:0] so;

  input [9:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [9:0] dout;


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
dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);




















endmodule









//
//   nand macro for ports = 2,3,4
//
//





module ccx_arb_nand_macro__dnand_1x__ports_2__stack_10c__width_9 (
  din0, 
  din1, 
  dout);
  input [8:0] din0;
  input [8:0] din1;
  output [8:0] dout;






nand2 #(9)  d0_0 (
.in0(din0[8:0]),
.in1(din1[8:0]),
.out(dout[8:0])
);









endmodule





//
//   invert macro
//
//





module ccx_arb_inv_macro__dinv_24x__stack_10c__width_10 (
  din, 
  dout);
  input [9:0] din;
  output [9:0] dout;






inv #(10)  d0_0 (
.in(din[9:0]),
.out(dout[9:0])
);









endmodule





//
//   buff macro
//
//





module ccx_arb_buff_macro__dbuff_32x__minbuff_1__stack_none__width_19 (
  din, 
  dout);
  input [18:0] din;
  output [18:0] dout;






buff #(19)  d0_0 (
.in(din[18:0]),
.out(dout[18:0])
);








endmodule









// any PARAMS parms go into naming of macro

module ccx_arb_msff_macro__stack_10c__width_10 (
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
wire [8:0] so;

  input [9:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [9:0] dout;


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
dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ccx_arb_mux_macro__dbuff_8x__dmux_4x__mux_aope__ports_2__stack_10c__width_10 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [9:0] din0;
  input [9:0] din1;
  input sel0;
  output [9:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(10)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[9:0]),
  .in1(din1[9:0]),
.dout(dout[9:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ccx_arb_mux_macro__dbuff_8x__dmux_4x__mux_aodec__ports_8__stack_10c__width_10 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [9:0] din0;
  input [9:0] din1;
  input [9:0] din2;
  input [9:0] din3;
  input [9:0] din4;
  input [9:0] din5;
  input [9:0] din6;
  input [9:0] din7;
  input [2:0] sel;
  output [9:0] dout;





cl_dp1_pdec8_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7)
);

mux8s #(10)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[9:0]),
  .in1(din1[9:0]),
  .in2(din2[9:0]),
  .in3(din3[9:0]),
  .in4(din4[9:0]),
  .in5(din5[9:0]),
  .in6(din6[9:0]),
  .in7(din7[9:0]),
.dout(dout[9:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ccx_arb_mux_macro__dmux_1x__mux_aodec__ports_4__stack_10c__width_10 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [9:0] din0;
  input [9:0] din1;
  input [9:0] din2;
  input [9:0] din3;
  input [1:0] sel;
  output [9:0] dout;





cl_dp1_pdec4_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(10)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[9:0]),
  .in1(din1[9:0]),
  .in2(din2[9:0]),
  .in3(din3[9:0]),
.dout(dout[9:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ccx_arb_mux_macro__dmux_1x__mux_aonpe__ports_2__stack_10c__width_10 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [9:0] din0;
  input sel0;
  input [9:0] din1;
  input sel1;
  output [9:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(10)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[9:0]),
  .in1(din1[9:0]),
.dout(dout[9:0])
);









  



endmodule


//
//   buff macro
//
//





module ccx_arb_buff_macro__dbuff_8x__stack_10c__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_arb_nand_macro__dnand_4x__ports_3__stack_10c__width_10 (
  din0, 
  din1, 
  din2, 
  dout);
  input [9:0] din0;
  input [9:0] din1;
  input [9:0] din2;
  output [9:0] dout;






nand3 #(10)  d0_0 (
.in0(din0[9:0]),
.in1(din1[9:0]),
.in2(din2[9:0]),
.out(dout[9:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_arb_nand_macro__dnand_4x__ports_2__stack_10c__width_10 (
  din0, 
  din1, 
  dout);
  input [9:0] din0;
  input [9:0] din1;
  output [9:0] dout;






nand2 #(10)  d0_0 (
.in0(din0[9:0]),
.in1(din1[9:0]),
.out(dout[9:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_arb_nand_macro__dnand_12x__ports_2__stack_10c__width_10 (
  din0, 
  din1, 
  dout);
  input [9:0] din0;
  input [9:0] din1;
  output [9:0] dout;






nand2 #(10)  d0_0 (
.in0(din0[9:0]),
.in1(din1[9:0]),
.out(dout[9:0])
);









endmodule





//
//   invert macro
//
//





module ccx_arb_inv_macro__dinv_2x__stack_10c__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






inv #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ccx_arb_mux_macro__dmux_8x__mux_aope__ports_2__stack_10c__width_9 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [8:0] din0;
  input [8:0] din1;
  input sel0;
  output [8:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(9)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[8:0]),
  .in1(din1[8:0]),
.dout(dout[8:0])
);









  



endmodule


//
//   nand macro for ports = 2,3,4
//
//





module ccx_arb_nand_macro__dnand_4x__ports_3__stack_10c__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nand3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_arb_nand_macro__dnand_12x__ports_2__stack_10c__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nand2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   invert macro
//
//





module ccx_arb_inv_macro__dinv_4x__stack_10c__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//
//   invert macro
//
//





module ccx_arb_inv_macro__dinv_12x__stack_10c__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






inv #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module ccx_arb_and_macro__dinv_12x__dnand_4x__ports_4__stack_10c__width_2 (
  din0, 
  din1, 
  din2, 
  din3, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  input [1:0] din2;
  input [1:0] din3;
  output [1:0] dout;






and4 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.in2(din2[1:0]),
.in3(din3[1:0]),
.out(dout[1:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module ccx_arb_and_macro__dinv_8x__dnand_2x__ports_3__stack_10c__width_4 (
  din0, 
  din1, 
  din2, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  input [3:0] din2;
  output [3:0] dout;






and3 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.in2(din2[3:0]),
.out(dout[3:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module ccx_arb_nor_macro__dnor_8x__ports_2__stack_10c__width_3 (
  din0, 
  din1, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  output [2:0] dout;






nor2 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.out(dout[2:0])
);







endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_arb_nand_macro__dnand_2x__ports_2__stack_10c__width_5 (
  din0, 
  din1, 
  dout);
  input [4:0] din0;
  input [4:0] din1;
  output [4:0] dout;






nand2 #(5)  d0_0 (
.in0(din0[4:0]),
.in1(din1[4:0]),
.out(dout[4:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_arb_nand_macro__dnand_8x__ports_2__stack_10c__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nand2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   invert macro
//
//





module ccx_arb_inv_macro__dinv_4x__stack_10c__width_5 (
  din, 
  dout);
  input [4:0] din;
  output [4:0] dout;






inv #(5)  d0_0 (
.in(din[4:0]),
.out(dout[4:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_arb_nand_macro__dnand_8x__ports_3__stack_10c__width_8 (
  din0, 
  din1, 
  din2, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  input [7:0] din2;
  output [7:0] dout;






nand3 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.in2(din2[7:0]),
.out(dout[7:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_arb_nand_macro__dnand_32x__ports_2__stack_10c__width_9 (
  din0, 
  din1, 
  dout);
  input [8:0] din0;
  input [8:0] din1;
  output [8:0] dout;






nand2 #(9)  d0_0 (
.in0(din0[8:0]),
.in1(din1[8:0]),
.out(dout[8:0])
);









endmodule





//
//   buff macro
//
//





module ccx_arb_buff_macro__dbuff_48x__stack_10c__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






buff #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);








endmodule





//
//   buff macro
//
//





module ccx_arb_buff_macro__dbuff_32x__stack_10c__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






buff #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);








endmodule





//
//   buff macro
//
//





module ccx_arb_buff_macro__dbuff_16x__minbuff_1__stack_10c__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






buff #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);








endmodule





//
//   invert macro
//
//





module ccx_arb_inv_macro__dinv_8x__stack_10c__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






inv #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_arb_nand_macro__dnand_1x__ports_3__stack_10c__width_9 (
  din0, 
  din1, 
  din2, 
  dout);
  input [8:0] din0;
  input [8:0] din1;
  input [8:0] din2;
  output [8:0] dout;






nand3 #(9)  d0_0 (
.in0(din0[8:0]),
.in1(din1[8:0]),
.in2(din2[8:0]),
.out(dout[8:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_arb_nand_macro__dnand_1x__ports_2__stack_10c__width_10 (
  din0, 
  din1, 
  dout);
  input [9:0] din0;
  input [9:0] din1;
  output [9:0] dout;






nand2 #(10)  d0_0 (
.in0(din0[9:0]),
.in1(din1[9:0]),
.out(dout[9:0])
);









endmodule









// any PARAMS parms go into naming of macro

module ccx_arb_msff_macro__dmsff_8x__stack_10c__stack_10c__width_10 (
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
wire [8:0] so;

  input [9:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [9:0] dout;


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
dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);




















endmodule









//
//   nand macro for ports = 2,3,4
//
//





module ccx_arb_nand_macro__dnand_2x__ports_2__stack_10c__width_9 (
  din0, 
  din1, 
  dout);
  input [8:0] din0;
  input [8:0] din1;
  output [8:0] dout;






nand2 #(9)  d0_0 (
.in0(din0[8:0]),
.in1(din1[8:0]),
.out(dout[8:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_arb_nand_macro__dnand_4x__ports_3__stack_10c__width_9 (
  din0, 
  din1, 
  din2, 
  dout);
  input [8:0] din0;
  input [8:0] din1;
  input [8:0] din2;
  output [8:0] dout;






nand3 #(9)  d0_0 (
.in0(din0[8:0]),
.in1(din1[8:0]),
.in2(din2[8:0]),
.out(dout[8:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_arb_nand_macro__dnand_8x__ports_2__stack_10c__width_9 (
  din0, 
  din1, 
  dout);
  input [8:0] din0;
  input [8:0] din1;
  output [8:0] dout;






nand2 #(9)  d0_0 (
.in0(din0[8:0]),
.in1(din1[8:0]),
.out(dout[8:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module ccx_arb_nor_macro__dnor_4x__ports_3__stack_10c__width_6 (
  din0, 
  din1, 
  din2, 
  dout);
  input [5:0] din0;
  input [5:0] din1;
  input [5:0] din2;
  output [5:0] dout;






nor3 #(6)  d0_0 (
.in0(din0[5:0]),
.in1(din1[5:0]),
.in2(din2[5:0]),
.out(dout[5:0])
);







endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_arb_nand_macro__dnand_8x__ports_3__stack_10c__width_2 (
  din0, 
  din1, 
  din2, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  input [1:0] din2;
  output [1:0] dout;






nand3 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.in2(din2[1:0]),
.out(dout[1:0])
);









endmodule





//
//   invert macro
//
//





module ccx_arb_inv_macro__dinv_32x__stack_10c__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//
//   buff macro
//
//





module ccx_arb_buff_macro__dbuff_32x__stack_none__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_arb_nand_macro__dnand_1x__ports_3__stack_10c__width_3 (
  din0, 
  din1, 
  din2, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  input [2:0] din2;
  output [2:0] dout;






nand3 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.in2(din2[2:0]),
.out(dout[2:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module ccx_arb_nor_macro__dnor_4x__ports_3__stack_10c__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);







endmodule





//
//   buff macro
//
//





module ccx_arb_buff_macro__dbuff_8x__stack_none__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule



`endif // `ifndef FPGA

`ifdef FPGA

/* Source file "ccx_arb_vj.v", line 2 */
// No timescale specified
module ccx_arb(arb_grant_a, arb_q0_holdbar_a, arb_qsel0_a, arb_qsel1_a, 
	arb_shift_a, arb_src0_grant_a, arb_src1_grant_a, arb_src2_grant_a, 
	arb_src3_grant_a, arb_src4_grant_a, arb_src5_grant_a, arb_src6_grant_a, 
	arb_src7_grant_a, arb_src8_grant_a, ccx_dest_atom_a, 
	ccx_dest_data_rdy_a, src0_arb_atom_q, src0_arb_req_q, src1_arb_atom_q, 
	src1_arb_req_q, src2_arb_atom_q, src2_arb_req_q, src3_arb_atom_q, 
	src3_arb_req_q, src4_arb_atom_q, src4_arb_req_q, src5_arb_atom_q, 
	src5_arb_req_q, src6_arb_atom_q, src6_arb_req_q, src7_arb_atom_q, 
	src7_arb_req_q, src8_arb_atom_q, src8_arb_req_q, stall_q_d1, 
	tcu_scan_en, l2clk, scan_in, tcu_pce_ov, ccx_aclk, ccx_bclk, scan_out);

	output	[8:0]		arb_grant_a;
	output	[8:0]		arb_q0_holdbar_a;
	output	[8:0]		arb_qsel0_a;
	output	[8:0]		arb_qsel1_a;
	output	[8:0]		arb_shift_a;
	output			arb_src0_grant_a;
	output			arb_src1_grant_a;
	output			arb_src2_grant_a;
	output			arb_src3_grant_a;
	output			arb_src4_grant_a;
	output			arb_src5_grant_a;
	output			arb_src6_grant_a;
	output			arb_src7_grant_a;
	output			arb_src8_grant_a;
	output			ccx_dest_atom_a;
	output			ccx_dest_data_rdy_a;
	input			src0_arb_atom_q;
	input			src0_arb_req_q;
	input			src1_arb_atom_q;
	input			src1_arb_req_q;
	input			src2_arb_atom_q;
	input			src2_arb_req_q;
	input			src3_arb_atom_q;
	input			src3_arb_req_q;
	input			src4_arb_atom_q;
	input			src4_arb_req_q;
	input			src5_arb_atom_q;
	input			src5_arb_req_q;
	input			src6_arb_atom_q;
	input			src6_arb_req_q;
	input			src7_arb_atom_q;
	input			src7_arb_req_q;
	input			src8_arb_atom_q;
	input			src8_arb_req_q;
	input			stall_q_d1;
	input			tcu_scan_en;
	input			l2clk;
	input			scan_in;
	input			tcu_pce_ov;
	input			ccx_aclk;
	input			ccx_bclk;
	output			scan_out;

	wire			direction;
	wire	[17:0]		write_fifo_a;
	wire	[2:0]		fifo_rptr_a;
	wire	[1:0]		fifo_read_select;
	wire			input_req_sel_a;
	wire			input_req_sel_a_;
	wire			fifo_req_sel_a;
	wire	[8:0]		qfullbar_a;
	wire	[8:0]		atom_x;
	wire	[8:0]		grant_a;
	wire			req_pkt_empty_a;
	wire			arc_scanin;
	wire			arc_scanout;
	wire			tcu_pce_ov_out;
	wire			tcu_scan_en_out;
	wire			ccx_aclk_out;
	wire			ccx_bclk_out;
	wire			ard_scanin;
	wire			ard_scanout;
	wire	[8:0]		atom_a;
	wire	[8:0]		req_a;

	assign arc_scanin = scan_in;
	assign ard_scanin = arc_scanout;
	assign scan_out = ard_scanout;

	ccx_arc_ctl arc(
		.direction			(direction), 
		.write_fifo_a			(write_fifo_a[17:0]), 
		.fifo_rptr_a			(fifo_rptr_a[2:0]), 
		.fifo_read_select		(fifo_read_select[1:0]), 
		.input_req_sel_a		(input_req_sel_a), 
		.input_req_sel_a_		(input_req_sel_a_), 
		.fifo_req_sel_a			(fifo_req_sel_a), 
		.qfullbar_a			(qfullbar_a[8:0]), 
		.atom_x				(atom_x[8:0]), 
		.arb_qsel0_a			(arb_qsel0_a[8:0]), 
		.arb_qsel1_a			(arb_qsel1_a[8:0]), 
		.arb_shift_a			(arb_shift_a[8:0]), 
		.arb_q0_holdbar_a		(arb_q0_holdbar_a[8:0]), 
		.grant_a			(grant_a[8:0]), 
		.req_pkt_empty_a		(req_pkt_empty_a), 
		.scan_in			(arc_scanin), 
		.scan_out			(arc_scanout), 
		.l2clk				(l2clk), 
		.tcu_pce_ov			(tcu_pce_ov_out), 
		.tcu_scan_en			(tcu_scan_en_out), 
		.ccx_aclk			(ccx_aclk_out), 
		.ccx_bclk			(ccx_bclk_out), 
		.atom_a				(atom_a[8:0]), 
		.req_a				(req_a[8:0]));
	ccx_ard_dp ard(
		.arb_grant_a			(arb_grant_a[8:0]), 
		.arb_src8_grant_a		(arb_src8_grant_a), 
		.arb_src7_grant_a		(arb_src7_grant_a), 
		.arb_src6_grant_a		(arb_src6_grant_a), 
		.arb_src5_grant_a		(arb_src5_grant_a), 
		.arb_src4_grant_a		(arb_src4_grant_a), 
		.arb_src3_grant_a		(arb_src3_grant_a), 
		.arb_src2_grant_a		(arb_src2_grant_a), 
		.arb_src1_grant_a		(arb_src1_grant_a), 
		.arb_src0_grant_a		(arb_src0_grant_a), 
		.ccx_dest_data_rdy_a		(ccx_dest_data_rdy_a), 
		.ccx_dest_atom_a		(ccx_dest_atom_a), 
		.req_pkt_empty_a		(req_pkt_empty_a), 
		.grant_a			(grant_a[8:0]), 
		.src8_arb_atom_q		(src8_arb_atom_q), 
		.src7_arb_atom_q		(src7_arb_atom_q), 
		.src6_arb_atom_q		(src6_arb_atom_q), 
		.src5_arb_atom_q		(src5_arb_atom_q), 
		.src4_arb_atom_q		(src4_arb_atom_q), 
		.src3_arb_atom_q		(src3_arb_atom_q), 
		.src2_arb_atom_q		(src2_arb_atom_q), 
		.src1_arb_atom_q		(src1_arb_atom_q), 
		.src0_arb_atom_q		(src0_arb_atom_q), 
		.src8_arb_req_q			(src8_arb_req_q), 
		.src7_arb_req_q			(src7_arb_req_q), 
		.src6_arb_req_q			(src6_arb_req_q), 
		.src5_arb_req_q			(src5_arb_req_q), 
		.src4_arb_req_q			(src4_arb_req_q), 
		.src3_arb_req_q			(src3_arb_req_q), 
		.src2_arb_req_q			(src2_arb_req_q), 
		.src1_arb_req_q			(src1_arb_req_q), 
		.src0_arb_req_q			(src0_arb_req_q), 
		.qfullbar_a			(qfullbar_a[8:0]), 
		.direction			(direction), 
		.fifo_req_sel_a			(fifo_req_sel_a), 
		.input_req_sel_a		(input_req_sel_a), 
		.input_req_sel_a_		(input_req_sel_a_), 
		.write_fifo_a			(write_fifo_a[17:0]), 
		.fifo_rptr_a			(fifo_rptr_a[2:0]), 
		.fifo_read_select		(fifo_read_select[1:0]), 
		.atom_x				(atom_x[8:0]), 
		.stall_q_d1			(stall_q_d1), 
		.scan_in			(ard_scanin), 
		.scan_out			(ard_scanout), 
		.l2clk				(l2clk), 
		.tcu_pce_ov			(tcu_pce_ov), 
		.req_a				(req_a[8:0]), 
		.atom_a				(atom_a[8:0]), 
		.tcu_scan_en			(tcu_scan_en), 
		.ccx_aclk			(ccx_aclk), 
		.ccx_bclk			(ccx_bclk), 
		.tcu_pce_ov_out			(tcu_pce_ov_out), 
		.tcu_scan_en_out		(tcu_scan_en_out), 
		.ccx_aclk_out			(ccx_aclk_out), 
		.ccx_bclk_out			(ccx_bclk_out));
endmodule

`endif // `ifdef FPGA

