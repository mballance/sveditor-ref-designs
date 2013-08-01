// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: cpx_mcl_dp.v
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
module cpx_mcl_dp (
  data_out_x_, 
  arb_grant_a, 
  arb_qsel0_a, 
  arb_qsel1_a, 
  arb_q0_holdbar_a, 
  arb_shift_a, 
  src_cpx_data_a, 
  data_crit_x_, 
  data_ncrit_x_, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  ccx_aclk, 
  ccx_bclk, 
  tcu_scan_en, 
  scan_out, 
  ccx_aclk_out, 
  ccx_bclk_out, 
  tcu_pce_ov_out, 
  tcu_scan_en_out);
wire pce_ov;
wire stop;
wire siclk_in;
wire soclk_in;
wire se;
wire [149:0] src_data_a;
wire l1clka;
wire l1clkb;
wire i0_scanin;
wire i0_scanout;
wire i1_scanin;
wire i1_scanout;
wire i2_scanin;
wire i2_scanout;
wire i3_scanin;
wire i3_scanout;
wire i4_scanin;
wire i4_scanout;
wire i5_scanin;
wire i5_scanout;
wire i6_scanin;
wire i6_scanout;
wire i7_scanin;
wire i7_scanout;
wire i8_scanin;
wire i8_scanout;
wire i9_scanin;
wire i9_scanout;
wire i10_scanin;
wire i10_scanout;
wire i11_scanin;
wire i11_scanout;
wire i12_scanin;
wire i12_scanout;
wire i13_scanin;
wire i13_scanout;
wire i14_scanin;
wire i14_scanout;


output [149:0] 	data_out_x_;

input           arb_grant_a;
input           arb_qsel0_a;
input           arb_qsel1_a;
input           arb_q0_holdbar_a;
input           arb_shift_a;


input [149:0]   src_cpx_data_a;
input [149:0]   data_crit_x_;
input [149:0]   data_ncrit_x_;

// globals
input           l2clk;
input           scan_in;
input           tcu_pce_ov;             // scan signals
input           ccx_aclk;
input           ccx_bclk;
input           tcu_scan_en;

output          scan_out;

// buffer the high fanout nets 
output          ccx_aclk_out;
output          ccx_bclk_out;
output          tcu_pce_ov_out;
output          tcu_scan_en_out;

// scan renames
assign pce_ov = tcu_pce_ov_out;
assign stop = 1'b0;
assign siclk_in = ccx_aclk_out;
assign soclk_in = ccx_bclk_out;
assign se = tcu_scan_en_out ;
// end scan

assign src_data_a[149:0] = src_cpx_data_a[149:0];

//cl_dp1_l1hdr_24x gkt_hdr (
//.l2clk(l2clk),
//.pce(1'b1),
//.aclk(siclk),
//.bclk(soclk),
//.siclk_out(siclk_out_unused),
//.soclk_out(soclk_out_unused),
//.l1clk(l1clk),
//.pce_ov(pce_ov),
//.stop(stop)
//);

//l1clkhdr_dp_macro gkt_hdra 
//  (
//   .l2clk  (l2clk),
//   .l1en   (1'b1 ),
//   .siclk_out (sia_unused),
//   .soclk_out (soa_unused),
//   .l1clk  (l1clka)
//   );
  
//l1clkhdr_dp_macro gkt_hdrb 
//  (
//   .l2clk  (l2clk),
//   .l1en   (1'b1 ),
//   .siclk_out (sib_unused),
//   .soclk_out (sob_unused),
//   .l1clk  (l1clkb)
//   );

cpx_mcl_dp_buff_macro__dbuff_8x__stack_none__vertical_1__width_4 buf_hfn     (
	.din	({ccx_aclk,ccx_bclk, tcu_pce_ov, tcu_scan_en}),
	.dout	({ccx_aclk_out,ccx_bclk_out,tcu_pce_ov_out,tcu_scan_en_out})
);

cpx_mcl_dp_ccx_l1clkhdr_ctl_macro__dl1hdr_24x gkt_hdra 
  (
   .l2clk  (l2clk),
   .l1en   (1'b1 ),
   .l1clk  (l1clka),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
   );

cpx_mcl_dp_ccx_l1clkhdr_ctl_macro__dl1hdr_24x gkt_hdrb 
  (
   .l2clk  (l2clk),
   .l1en   (1'b1 ),
   .l1clk  (l1clkb),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
   );


//   ccx_new_macro_c AUTO_TEMPLATE
// (
//.l2clk    (l2clk),
//.l1clk    (l1clk),                       
//.pce0     (arb_q0_holdbar_a),
//.pce1     (arb_qsel1_a),
//.pce_ov   (pce_ov),
//.stop     (stop),
//.siclk_in (siclk_in),
//.soclk_in (soclk_in),
//.scan_in  (scan_in),
//.grant_a  (arb_grant_a),
//.qsel0    (arb_qsel0_a),
//.shift    (arb_shift_a),
//.data_a   (src_data_a[@"(+ 9 (* 10 @))":@"(* 10 @)"]),
//.data_crit_x_l   (data_crit_x_[@"(+ 9 (* 10 @))":@"(* 10 @)"]),
//.data_ncrit_x_l   (data_ncrit_x_[@"(+ 9 (* 10 @))":@"(* 10 @)"]),
//.data_x_l (data_out_x_[@"(+ 9 (* 10 @))":@"(* 10 @)"]),
//);


cpx_mcl_dp_ccx_new_macro__type_c_l i0  (
                // Outputs
                .data_x_l               (data_out_x_[9:0]),      // Templated
                // Inputs
                .scan_in(i0_scanin),
                .scan_out(i0_scanout),
                .l2clk                  (l2clk),                 // Templated
                .l1clk                  (l1clka),                 // Templated
                .pce0                   (arb_q0_holdbar_a),      // Templated
                .pce1                   (arb_qsel1_a),           // Templated
                .pce_ov                 (pce_ov),            // Templated
                .stop                   (stop),          // Templated
                .siclk_in               (siclk_in),          // Templated
                .soclk_in               (soclk_in),           // Templated
                .grant_a                (arb_grant_a),           // Templated
                .qsel0                  (arb_qsel0_a),           // Templated
                .shift                  (arb_shift_a),           // Templated
                .data_a                 (src_data_a[9:0]),   // Templated
                .data_crit_x_l          (data_crit_x_[9:0]),     // Templated
                .data_ncrit_x_l         (data_ncrit_x_[9:0]),
  .se(se));    // Templated

cpx_mcl_dp_ccx_new_macro__type_c_l i1  (
                // Outputs
                .data_x_l               (data_out_x_[19:10]),     // Templated
                // Inputs
                .scan_in(i1_scanin),
                .scan_out(i1_scanout),
                .l2clk                  (l2clk),                 // Templated
                .l1clk                  (l1clka),                 // Templated
                .pce0                   (arb_q0_holdbar_a),      // Templated
                .pce1                   (arb_qsel1_a),           // Templated
                .pce_ov                 (pce_ov),            // Templated
                .stop                   (stop),          // Templated
                .siclk_in               (siclk_in),          // Templated
                .soclk_in               (soclk_in),           // Templated
                .grant_a                (arb_grant_a),           // Templated
                .qsel0                  (arb_qsel0_a),           // Templated
                .shift                  (arb_shift_a),           // Templated
                .data_a                 (src_data_a[19:10]),  // Templated
                .data_crit_x_l          (data_crit_x_[19:10]),    // Templated
                .data_ncrit_x_l         (data_ncrit_x_[19:10]),
  .se(se));   // Templated

cpx_mcl_dp_ccx_new_macro__type_c_l i2  (
                // Outputs
                .data_x_l               (data_out_x_[29:20]),    // Templated
                // Inputs
                .scan_in(i2_scanin),
                .scan_out(i2_scanout),
                .l2clk                  (l2clk),                 // Templated
                .l1clk                  (l1clka),                 // Templated
                .pce0                   (arb_q0_holdbar_a),      // Templated
                .pce1                   (arb_qsel1_a),           // Templated
                .pce_ov                 (pce_ov),            // Templated
                .stop                   (stop),          // Templated
                .siclk_in               (siclk_in),          // Templated
                .soclk_in               (soclk_in),           // Templated
                .grant_a                (arb_grant_a),           // Templated
                .qsel0                  (arb_qsel0_a),           // Templated
                .shift                  (arb_shift_a),           // Templated
                .data_a                 (src_data_a[29:20]), // Templated
                .data_crit_x_l          (data_crit_x_[29:20]),   // Templated
                .data_ncrit_x_l         (data_ncrit_x_[29:20]),
  .se(se));  // Templated
cpx_mcl_dp_ccx_new_macro__type_c_l i3  (
                // Outputs
                .data_x_l               (data_out_x_[39:30]),    // Templated
                // Inputs
                .scan_in(i3_scanin),
                .scan_out(i3_scanout),
                .l2clk                  (l2clk),                 // Templated
                .l1clk                  (l1clka),                 // Templated
                .pce0                   (arb_q0_holdbar_a),      // Templated
                .pce1                   (arb_qsel1_a),           // Templated
                .pce_ov                 (pce_ov),            // Templated
                .stop                   (stop),          // Templated
                .siclk_in               (siclk_in),          // Templated
                .soclk_in               (soclk_in),           // Templated
                .grant_a                (arb_grant_a),           // Templated
                .qsel0                  (arb_qsel0_a),           // Templated
                .shift                  (arb_shift_a),           // Templated
                .data_a                 (src_data_a[39:30]), // Templated
                .data_crit_x_l          (data_crit_x_[39:30]),   // Templated
                .data_ncrit_x_l         (data_ncrit_x_[39:30]),
  .se(se));  // Templated
cpx_mcl_dp_ccx_new_macro__type_c_l i4  (
                // Outputs
                .data_x_l               (data_out_x_[49:40]),    // Templated
                // Inputs
                .scan_in(i4_scanin),
                .scan_out(i4_scanout),
                .l2clk                  (l2clk),                 // Templated
                .l1clk                  (l1clka),                 // Templated
                .pce0                   (arb_q0_holdbar_a),      // Templated
                .pce1                   (arb_qsel1_a),           // Templated
                .pce_ov                 (pce_ov),            // Templated
                .stop                   (stop),          // Templated
                .siclk_in               (siclk_in),          // Templated
                .soclk_in               (soclk_in),           // Templated
                .grant_a                (arb_grant_a),           // Templated
                .qsel0                  (arb_qsel0_a),           // Templated
                .shift                  (arb_shift_a),           // Templated
                .data_a                 (src_data_a[49:40]), // Templated
                .data_crit_x_l          (data_crit_x_[49:40]),   // Templated
                .data_ncrit_x_l         (data_ncrit_x_[49:40]),
  .se(se));  // Templated
cpx_mcl_dp_ccx_new_macro__type_c_l i5  (
                // Outputs
                .data_x_l               (data_out_x_[59:50]),    // Templated
                // Inputs
                .scan_in(i5_scanin),
                .scan_out(i5_scanout),
                .l2clk                  (l2clk),                 // Templated
                .l1clk                  (l1clka),                 // Templated
                .pce0                   (arb_q0_holdbar_a),      // Templated
                .pce1                   (arb_qsel1_a),           // Templated
                .pce_ov                 (pce_ov),            // Templated
                .stop                   (stop),          // Templated
                .siclk_in               (siclk_in),          // Templated
                .soclk_in               (soclk_in),           // Templated
                .grant_a                (arb_grant_a),           // Templated
                .qsel0                  (arb_qsel0_a),           // Templated
                .shift                  (arb_shift_a),           // Templated
                .data_a                 (src_data_a[59:50]), // Templated
                .data_crit_x_l          (data_crit_x_[59:50]),   // Templated
                .data_ncrit_x_l         (data_ncrit_x_[59:50]),
  .se(se));  // Templated
cpx_mcl_dp_ccx_new_macro__type_c_l i6  (
                // Outputs
                .data_x_l               (data_out_x_[69:60]),    // Templated
                // Inputs
                .scan_in(i6_scanin),
                .scan_out(i6_scanout),
                .l2clk                  (l2clk),                 // Templated
                .l1clk                  (l1clka),                 // Templated
                .pce0                   (arb_q0_holdbar_a),      // Templated
                .pce1                   (arb_qsel1_a),           // Templated
                .pce_ov                 (pce_ov),            // Templated
                .stop                   (stop),          // Templated
                .siclk_in               (siclk_in),          // Templated
                .soclk_in               (soclk_in),           // Templated
                .grant_a                (arb_grant_a),           // Templated
                .qsel0                  (arb_qsel0_a),           // Templated
                .shift                  (arb_shift_a),           // Templated
                .data_a                 (src_data_a[69:60]), // Templated
                .data_crit_x_l          (data_crit_x_[69:60]),   // Templated
                .data_ncrit_x_l         (data_ncrit_x_[69:60]),
  .se(se));  // Templated
cpx_mcl_dp_ccx_new_macro__type_c_l i7  (
                // Outputs
                .data_x_l               (data_out_x_[79:70]),    // Templated
                // Inputs
                .scan_in(i7_scanin),
                .scan_out(i7_scanout),
                .l2clk                  (l2clk),                 // Templated
                .l1clk                  (l1clka),                 // Templated
                .pce0                   (arb_q0_holdbar_a),      // Templated
                .pce1                   (arb_qsel1_a),           // Templated
                .pce_ov                 (pce_ov),            // Templated
                .stop                   (stop),          // Templated
                .siclk_in               (siclk_in),          // Templated
                .soclk_in               (soclk_in),           // Templated
                .grant_a                (arb_grant_a),           // Templated
                .qsel0                  (arb_qsel0_a),           // Templated
                .shift                  (arb_shift_a),           // Templated
                .data_a                 (src_data_a[79:70]), // Templated
                .data_crit_x_l          (data_crit_x_[79:70]),   // Templated
                .data_ncrit_x_l         (data_ncrit_x_[79:70]),
  .se(se));  // Templated
cpx_mcl_dp_ccx_new_macro__type_c_l i8  (
                // Outputs
                .data_x_l               (data_out_x_[89:80]),    // Templated
                // Inputs
                .scan_in(i8_scanin),
                .scan_out(i8_scanout),
                .l2clk                  (l2clk),                 // Templated
                .l1clk                  (l1clkb),                 // Templated
                .pce0                   (arb_q0_holdbar_a),      // Templated
                .pce1                   (arb_qsel1_a),           // Templated
                .pce_ov                 (pce_ov),            // Templated
                .stop                   (stop),          // Templated
                .siclk_in               (siclk_in),          // Templated
                .soclk_in               (soclk_in),           // Templated
                .grant_a                (arb_grant_a),           // Templated
                .qsel0                  (arb_qsel0_a),           // Templated
                .shift                  (arb_shift_a),           // Templated
                .data_a                 (src_data_a[89:80]), // Templated
                .data_crit_x_l          (data_crit_x_[89:80]),   // Templated
                .data_ncrit_x_l         (data_ncrit_x_[89:80]),
  .se(se));  // Templated
cpx_mcl_dp_ccx_new_macro__type_c_l i9  (
                // Outputs
                .data_x_l               (data_out_x_[99:90]),    // Templated
                // Inputs
                .scan_in(i9_scanin),
                .scan_out(i9_scanout),
                .l2clk                  (l2clk),                 // Templated
                .l1clk                  (l1clkb),                 // Templated
                .pce0                   (arb_q0_holdbar_a),      // Templated
                .pce1                   (arb_qsel1_a),           // Templated
                .pce_ov                 (pce_ov),            // Templated
                .stop                   (stop),          // Templated
                .siclk_in               (siclk_in),          // Templated
                .soclk_in               (soclk_in),           // Templated
                .grant_a                (arb_grant_a),           // Templated
                .qsel0                  (arb_qsel0_a),           // Templated
                .shift                  (arb_shift_a),           // Templated
                .data_a                 (src_data_a[99:90]), // Templated
                .data_crit_x_l          (data_crit_x_[99:90]),   // Templated
                .data_ncrit_x_l         (data_ncrit_x_[99:90]),
  .se(se));  // Templated
cpx_mcl_dp_ccx_new_macro__type_c_l i10  (
                 // Outputs
                 .data_x_l              (data_out_x_[109:100]),    // Templated
                 // Inputs
                 .scan_in(i10_scanin),
                 .scan_out(i10_scanout),
                 .l2clk                 (l2clk),                 // Templated
                 .l1clk                 (l1clkb),                 // Templated
                 .pce0                  (arb_q0_holdbar_a),      // Templated
                 .pce1                  (arb_qsel1_a),           // Templated
                 .pce_ov                (pce_ov),            // Templated
                 .stop                  (stop),          // Templated
                 .siclk_in              (siclk_in),          // Templated
                 .soclk_in              (soclk_in),           // Templated
                 .grant_a               (arb_grant_a),           // Templated
                 .qsel0                 (arb_qsel0_a),           // Templated
                 .shift                 (arb_shift_a),           // Templated
                 .data_a                (src_data_a[109:100]), // Templated
                 .data_crit_x_l         (data_crit_x_[109:100]),   // Templated
                 .data_ncrit_x_l        (data_ncrit_x_[109:100]),
  .se(se));  // Templated
cpx_mcl_dp_ccx_new_macro__type_c_l i11  (
                 // Outputs
                 .data_x_l              (data_out_x_[119:110]),    // Templated
                 // Inputs
                 .scan_in(i11_scanin),
                 .scan_out(i11_scanout),
                 .l2clk                 (l2clk),                 // Templated
                 .l1clk                 (l1clkb),                 // Templated
                 .pce0                  (arb_q0_holdbar_a),      // Templated
                 .pce1                  (arb_qsel1_a),           // Templated
                 .pce_ov                (pce_ov),            // Templated
                 .stop                  (stop),          // Templated
                 .siclk_in              (siclk_in),          // Templated
                 .soclk_in              (soclk_in),           // Templated
                 .grant_a               (arb_grant_a),           // Templated
                 .qsel0                 (arb_qsel0_a),           // Templated
                 .shift                 (arb_shift_a),           // Templated
                 .data_a                (src_data_a[119:110]), // Templated
                 .data_crit_x_l         (data_crit_x_[119:110]),   // Templated
                 .data_ncrit_x_l        (data_ncrit_x_[119:110]),
  .se(se));  // Templated
cpx_mcl_dp_ccx_new_macro__type_c_l i12  (
                 // Outputs
                 .data_x_l              (data_out_x_[129:120]),    // Templated
                 // Inputs
                 .scan_in(i12_scanin),
                 .scan_out(i12_scanout),
                 .l2clk                 (l2clk),                 // Templated
                 .l1clk                 (l1clkb),                 // Templated
                 .pce0                  (arb_q0_holdbar_a),      // Templated
                 .pce1                  (arb_qsel1_a),           // Templated
                 .pce_ov                (pce_ov),            // Templated
                 .stop                  (stop),          // Templated
                 .siclk_in              (siclk_in),          // Templated
                 .soclk_in              (soclk_in),           // Templated
                 .grant_a               (arb_grant_a),           // Templated
                 .qsel0                 (arb_qsel0_a),           // Templated
                 .shift                 (arb_shift_a),           // Templated
                 .data_a                (src_data_a[129:120]), // Templated
                 .data_crit_x_l         (data_crit_x_[129:120]),   // Templated
                 .data_ncrit_x_l        (data_ncrit_x_[129:120]),
  .se(se));  // Templated
cpx_mcl_dp_ccx_new_macro__type_c_l i13  (
                 // Outputs
                 .data_x_l              (data_out_x_[139:130]),    // Templated
                 // Inputs
                 .scan_in(i13_scanin),
                 .scan_out(i13_scanout),
                 .l2clk                 (l2clk),                 // Templated
                 .l1clk                 (l1clkb),                 // Templated
                 .pce0                  (arb_q0_holdbar_a),      // Templated
                 .pce1                  (arb_qsel1_a),           // Templated
                 .pce_ov                (pce_ov),            // Templated
                 .stop                  (stop),          // Templated
                 .siclk_in              (siclk_in),          // Templated
                 .soclk_in              (soclk_in),           // Templated
                 .grant_a               (arb_grant_a),           // Templated
                 .qsel0                 (arb_qsel0_a),           // Templated
                 .shift                 (arb_shift_a),           // Templated
                 .data_a                (src_data_a[139:130]), // Templated
                 .data_crit_x_l         (data_crit_x_[139:130]),   // Templated
                 .data_ncrit_x_l        (data_ncrit_x_[139:130]),
  .se(se));  // Templated
cpx_mcl_dp_ccx_new_macro__type_c_l i14  (
                 // Outputs
                 .data_x_l              (data_out_x_[149:140]),    // Templated
                 // Inputs
                 .scan_in(i14_scanin),
                 .scan_out(i14_scanout),
                 .l2clk                 (l2clk),                 // Templated
                 .l1clk                 (l1clkb),                 // Templated
                 .pce0                  (arb_q0_holdbar_a),      // Templated
                 .pce1                  (arb_qsel1_a),           // Templated
                 .pce_ov                (pce_ov),            // Templated
                 .stop                  (stop),          // Templated
                 .siclk_in              (siclk_in),          // Templated
                 .soclk_in              (soclk_in),           // Templated
                 .grant_a               (arb_grant_a),           // Templated
                 .qsel0                 (arb_qsel0_a),           // Templated
                 .shift                 (arb_shift_a),           // Templated
                 .data_a                (src_data_a[149:140]), // Templated
                 .data_crit_x_l         (data_crit_x_[149:140]),   // Templated
                 .data_ncrit_x_l        (data_ncrit_x_[149:140]),
  .se(se));  // Templated

// fixscan start:
assign i14_scanin                 = scan_in                  ;
assign i13_scanin                 = i14_scanout              ;
assign i12_scanin                 = i13_scanout              ;
assign i11_scanin                 = i12_scanout              ;
assign i10_scanin                 = i11_scanout              ;
assign i9_scanin                  = i10_scanout              ;
assign i8_scanin                  = i9_scanout               ;
assign i7_scanin                  = i8_scanout               ;
assign i6_scanin                  = i7_scanout               ;
assign i5_scanin                  = i6_scanout               ;
assign i4_scanin                  = i5_scanout               ;
assign i3_scanin                  = i4_scanout               ;
assign i2_scanin                  = i3_scanout               ;
assign i1_scanin                  = i2_scanout               ;
assign i0_scanin                  = i1_scanout               ;
assign scan_out                   = i0_scanout               ;
// fixscan end:
endmodule // cpx_mcl_dp

//// scan renames
//assign pce_ov = tcu_pce_ov;
//assign stop = tcu_clk_stop;
//assign siclk = tcu_aclk;
//assign soclk = tcu_bclk;
//// end scan
//
//// buffer the grant signal
//
//buff_macro i_buf_grant (width=1, stack=50c)
//(
// .din (arb_grant_a),
// .dout (grant_a),
// );
//
//msff_macro i_dff_grant_x (width=12, stack=50c) 
//(
// .scan_in(i_dff_grant_x_scanin),
// .scan_out(i_dff_grant_x_scanout),
// .clk	        (l2clk),
// .din           ({12{grant_a}}),
// .dout          (grant_x[11:0]),
// .en            (1'b1),
// );
//
//
//// DATAPATH SECTION
//
//msff_macro i_dff_q1_2 (width=50, stack=50c) 
//(
// .scan_in(i_dff_q1_2_scanin),
// .scan_out(i_dff_q1_2_scanout),
// .clk	        (l2clk),
// .din           (src_cpx_data_a[149:100]),
// .dout          (q1_dataout[149:100]),
// .en            (arb_qsel1_a),
// );
//
//msff_macro i_dff_q1_1 (width=50, stack=50c) 
//(
// .scan_in(i_dff_q1_1_scanin),
// .scan_out(i_dff_q1_1_scanout),
// .clk	        (l2clk),
// .din           (src_cpx_data_a[99:50]),
// .dout          (q1_dataout[99:50]),
// .en            (arb_qsel1_a),
// );
//
//msff_macro i_dff_q1_0 (width=50, stack=50c) 
//(
// .scan_in(i_dff_q1_0_scanin),
// .scan_out(i_dff_q1_0_scanout),
// .clk	        (l2clk),
// .din           (src_cpx_data_a[49:0]),
// .dout          (q1_dataout[49:0]),
// .en            (arb_qsel1_a),
// );
//
////assign q0_datain_ca[149:0] = 
////             (arb_cpxdp_qsel0_ca ? src_cpx_data_ca[149:0] : 150'd0) |
////	     (arb_cpxdp_shift_cx ? q1_dataout[149:0] : 150'd0) ;
//
//
//mux_macro i_mux_q0_2 (width=50, mux=aonpe, ports=2, stack=50c) 
//(
// .din0   (src_cpx_data_a[149:100]),
// .din1   (q1_dataout[149:100]),
// .sel0   (arb_qsel0_a),
// .sel1   (arb_shift_a),
// .dout   (q0_datain_a[149:100]),
// );
//
//mux_macro i_mux_q0_1 (width=50, mux=aonpe, ports=2, stack=50c) 
//(
// .din0   (src_cpx_data_a[99:50]),
// .din1   (q1_dataout[99:50]),
// .sel0   (arb_qsel0_a),
// .sel1   (arb_shift_a),
// .dout   (q0_datain_a[99:50]),
// );
//
//mux_macro i_mux_q0_0 (width=50, mux=aonpe, ports=2, stack=50c) 
//(
// .din0   (src_cpx_data_a[49:0]),
// .din1   (q1_dataout[49:0]),
// .sel0   (arb_qsel0_a),
// .sel1   (arb_shift_a),
// .dout   (q0_datain_a[49:0]),
// );
//
//msff_macro i_dff_q0_2 (width=50, stack=50c) 
//(
// .scan_in(i_dff_q0_2_scanin),
// .scan_out(i_dff_q0_2_scanout),
// .clk	        (l2clk),
// .din           (q0_datain_a[149:100]),
// .dout          (q0_dataout[149:100]),
// .en            (arb_q0_holdbar_a),
// );
//
//msff_macro i_dff_q0_1 (width=50, stack=50c) 
//(
// .scan_in(i_dff_q0_1_scanin),
// .scan_out(i_dff_q0_1_scanout),
// .clk	        (l2clk),
// .din           (q0_datain_a[99:50]),
// .dout          (q0_dataout[99:50]),
// .en            (arb_q0_holdbar_a),
// );
//
//msff_macro i_dff_q0_0 (width=50, stack=50c) 
//(
// .scan_in(i_dff_q0_0_scanin),
// .scan_out(i_dff_q0_0_scanout),
// .clk	        (l2clk),
// .din           (q0_datain_a[49:0]),
// .dout          (q0_dataout[49:0]),
// .en            (arb_q0_holdbar_a),
// );
//
////MUX
//
//nand_macro i_nand_data_g_2 (width=50, ports=2, stack=50c) 
//(
// .din0   (q0_dataout[149:100]),
// .din1   ({{10{grant_x[11]}},{15{grant_x[10]}},{15{grant_x[9]}},{10{grant_x[8]}}}),
// .dout   (data_x_[149:100]),
// );
// 	 
//nand_macro i_nand_data_g_1 (width=50, ports=2, stack=50c) 
//(
// .din0   (q0_dataout[99:50]),
// .din1   ({{10{grant_x[7]}},{15{grant_x[6]}},{15{grant_x[5]}},{10{grant_x[4]}}}),
// .dout   (data_x_[99:50]),
// );
// 	 
//nand_macro i_nand_data_g_0 (width=50, ports=2, stack=50c) 
//(
// .din0   (q0_dataout[49:0]),
// .din1   ({{10{grant_x[3]}},{15{grant_x[2]}},{15{grant_x[1]}},{10{grant_x[0]}}}),
// .dout   (data_x_[49:0]),
// );
// 	 
//nand_macro i_nand_data_crit_2 (width=50, ports=3, stack=50c) 
//(
// .din0	(data_x_[149:100]),
// .din1	(data_crit_x_[149:100]),
// .din2	(data_ncrit_x_[149:100]),
// .dout	(data_out_x[149:100])
//);
//
//nand_macro i_nand_data_crit_1 (width=50, ports=3, stack=50c) 
//(
// .din0	(data_x_[99:50]),
// .din1	(data_crit_x_[99:50]),
// .din2	(data_ncrit_x_[99:50]),
// .dout	(data_out_x[99:50])
//);
//
//nand_macro i_nand_data_crit_0 (width=50, ports=3, stack=50c) 
//(
// .din0	(data_x_[49:0]),
// .din1	(data_crit_x_[49:0]),
// .din2	(data_ncrit_x_[49:0]),
// .dout	(data_out_x[49:0])
//);
//
//inv_macro i_inv_data_out_2 (width=50, stack=50c) 
//(
// .din	(data_out_x[149:100]),
// .dout	(data_out_x_[149:100])
// );
//
//inv_macro i_inv_data_out_1 (width=50, stack=50c) 
//(
// .din	(data_out_x[99:50]),
// .dout	(data_out_x_[99:50])
// );
//
//inv_macro i_inv_data_out_0 (width=50, stack=50c) 
//(
// .din	(data_out_x[49:0]),
// .dout	(data_out_x_[49:0])
// );
//
//// fixscan start:
//assign i_dff_grant_x_scanin      = scan_in                  ;
//assign i_dff_q1_2_scanin         = i_dff_grant_x_scanout    ;
//assign i_dff_q1_1_scanin         = i_dff_q1_2_scanout       ;
//assign i_dff_q1_0_scanin         = i_dff_q1_1_scanout       ;
//assign i_dff_q0_2_scanin         = i_dff_q1_0_scanout       ;
//assign i_dff_q0_1_scanin         = i_dff_q0_2_scanout       ;
//assign i_dff_q0_0_scanin         = i_dff_q0_1_scanout       ;
//assign scan_out                  = i_dff_q0_0_scanout       ;
//// fixscan end:
//endmodule


//
//   buff macro
//
//





module cpx_mcl_dp_buff_macro__dbuff_8x__stack_none__vertical_1__width_4 (
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

module cpx_mcl_dp_ccx_l1clkhdr_ctl_macro__dl1hdr_24x (
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



 

cl_sc1_l1hdr_24x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);






endmodule









//
//   ccx macro
//
//





module cpx_mcl_dp_ccx_new_macro__type_c_l (
  l2clk, 
  l1clk, 
  pce0, 
  pce1, 
  pce_ov, 
  se, 
  stop, 
  siclk_in, 
  soclk_in, 
  scan_in, 
  grant_a, 
  qsel0, 
  shift, 
  data_a, 
  data_crit_x_l, 
  data_ncrit_x_l, 
  data_x_l, 
  scan_out);
wire so5;
wire siclk_out;
wire soclk_out;
wire l1clk0;
wire l1clk1;
wire grant_x;
wire qsel0_buf;
wire shift_buf;

input l2clk;
input l1clk;
input pce0;
input pce1;
input pce_ov;
input se;
input stop;
input siclk_in;
input soclk_in;
input scan_in;
input grant_a;
input qsel0;
input shift;
input [9:0] data_a;
input [9:0] data_crit_x_l;
input [9:0] data_ncrit_x_l;
output [9:0] data_x_l;
output       scan_out;
cl_dp1_ccxhdr c0 (			
.si(scan_in),    			
.so(so5),
  .l2clk(l2clk),
  .pce0(pce0),
  .pce1(pce1),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_in(siclk_in),
  .soclk_in(soclk_in),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out),
  .l1clk0(l1clk0),
  .l1clk1(l1clk1),
  .se(se),
  .l1clk(l1clk),
  .grant_a(grant_a),
  .grant_x(grant_x),
  .qsel0(qsel0),
  .qsel0_buf(qsel0_buf),
  .shift(shift),
  .shift_buf(shift_buf)    				
);					






ccx_mac_c #(10)  mac_c(
.siclk(siclk_out),			
.soclk(soclk_out),			
.data_a(data_a[9:0]),			
.data_crit_x_l(data_crit_x_l[9:0]),   
.data_ncrit_x_l(data_ncrit_x_l[9:0]),   
.data_x_l(data_x_l[9:0]),		
.si(so5),                         	
.so(scan_out),
  .l1clk0(l1clk0),
  .l1clk1(l1clk1),
  .grant_x(grant_x),
  .qsel0_buf(qsel0_buf),
  .shift_buf(shift_buf)		
);














endmodule



`endif // `ifndef FPGA

`ifdef FPGA

`timescale 1 ns / 100 ps
module cpx_mcl_dp(data_out_x_, arb_grant_a, arb_qsel0_a, arb_qsel1_a, 
	arb_q0_holdbar_a, arb_shift_a, src_cpx_data_a, data_crit_x_, 
	data_ncrit_x_, l2clk, scan_in, tcu_pce_ov, ccx_aclk, ccx_bclk, 
	tcu_scan_en, scan_out, ccx_aclk_out, ccx_bclk_out, tcu_pce_ov_out, 
	tcu_scan_en_out);

	output	[149:0]		data_out_x_;
	input			arb_grant_a;
	input			arb_qsel0_a;
	input			arb_qsel1_a;
	input			arb_q0_holdbar_a;
	input			arb_shift_a;
	input	[149:0]		src_cpx_data_a;
	input	[149:0]		data_crit_x_;
	input	[149:0]		data_ncrit_x_;
	input			l2clk;
	input			scan_in;
	input			tcu_pce_ov;
	input			ccx_aclk;
	input			ccx_bclk;
	input			tcu_scan_en;
	output			scan_out;
	output			ccx_aclk_out;
	output			ccx_bclk_out;
	output			tcu_pce_ov_out;
	output			tcu_scan_en_out;

	wire			pce_ov;
	wire			stop;
	wire			siclk_in;
	wire			soclk_in;
	wire			se;
	wire	[149:0]		src_data_a;
	wire			l1clka;
	wire			l1clkb;
	wire			i0_scanin;
	wire			i0_scanout;
	wire			i1_scanin;
	wire			i1_scanout;
	wire			i2_scanin;
	wire			i2_scanout;
	wire			i3_scanin;
	wire			i3_scanout;
	wire			i4_scanin;
	wire			i4_scanout;
	wire			i5_scanin;
	wire			i5_scanout;
	wire			i6_scanin;
	wire			i6_scanout;
	wire			i7_scanin;
	wire			i7_scanout;
	wire			i8_scanin;
	wire			i8_scanout;
	wire			i9_scanin;
	wire			i9_scanout;
	wire			i10_scanin;
	wire			i10_scanout;
	wire			i11_scanin;
	wire			i11_scanout;
	wire			i12_scanin;
	wire			i12_scanout;
	wire			i13_scanin;
	wire			i13_scanout;
	wire			i14_scanin;
	wire			i14_scanout;

	assign pce_ov = tcu_pce_ov_out;
	assign stop = 1'b0;
	assign siclk_in = ccx_aclk_out;
	assign soclk_in = ccx_bclk_out;
	assign se = tcu_scan_en_out;
	assign src_data_a[149:0] = src_cpx_data_a[149:0];
	assign i14_scanin = scan_in;
	assign i13_scanin = i14_scanout;
	assign i12_scanin = i13_scanout;
	assign i11_scanin = i12_scanout;
	assign i10_scanin = i11_scanout;
	assign i9_scanin = i10_scanout;
	assign i8_scanin = i9_scanout;
	assign i7_scanin = i8_scanout;
	assign i6_scanin = i7_scanout;
	assign i5_scanin = i6_scanout;
	assign i4_scanin = i5_scanout;
	assign i3_scanin = i4_scanout;
	assign i2_scanin = i3_scanout;
	assign i1_scanin = i2_scanout;
	assign i0_scanin = i1_scanout;
	assign scan_out = i0_scanout;

	buff_macro__dbuff_8x__stack_none__vertical_1__width_4 buf_hfn(
		.din				({ccx_aclk, ccx_bclk,
		tcu_pce_ov, tcu_scan_en}), 
		.dout				({ccx_aclk_out, ccx_bclk_out,
		tcu_pce_ov_out, tcu_scan_en_out}));
	ccx_l1clkhdr_ctl_macro__dl1hdr_24x gkt_hdra(
		.l2clk				(l2clk), 
		.l1en				(1'b1), 
		.l1clk				(l1clka), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.se				(se));
	ccx_l1clkhdr_ctl_macro__dl1hdr_24x gkt_hdrb(
		.l2clk				(l2clk), 
		.l1en				(1'b1), 
		.l1clk				(l1clkb), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.se				(se));
	ccx_new_macro__type_c_l i0(
		.data_x_l			(data_out_x_[9:0]), 
		.scan_in			(i0_scanin), 
		.scan_out			(i0_scanout), 
		.l2clk				(l2clk), 
		.l1clk				(l1clka), 
		.pce0				(arb_q0_holdbar_a), 
		.pce1				(arb_qsel1_a), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.siclk_in			(siclk_in), 
		.soclk_in			(soclk_in), 
		.grant_a			(arb_grant_a), 
		.qsel0				(arb_qsel0_a), 
		.shift				(arb_shift_a), 
		.data_a				(src_data_a[9:0]), 
		.data_crit_x_l			(data_crit_x_[9:0]), 
		.data_ncrit_x_l			(data_ncrit_x_[9:0]), 
		.se				(se));
	ccx_new_macro__type_c_l i1(
		.data_x_l			(data_out_x_[19:10]), 
		.scan_in			(i1_scanin), 
		.scan_out			(i1_scanout), 
		.l2clk				(l2clk), 
		.l1clk				(l1clka), 
		.pce0				(arb_q0_holdbar_a), 
		.pce1				(arb_qsel1_a), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.siclk_in			(siclk_in), 
		.soclk_in			(soclk_in), 
		.grant_a			(arb_grant_a), 
		.qsel0				(arb_qsel0_a), 
		.shift				(arb_shift_a), 
		.data_a				(src_data_a[19:10]), 
		.data_crit_x_l			(data_crit_x_[19:10]), 
		.data_ncrit_x_l			(data_ncrit_x_[19:10]), 
		.se				(se));
	ccx_new_macro__type_c_l i2(
		.data_x_l			(data_out_x_[29:20]), 
		.scan_in			(i2_scanin), 
		.scan_out			(i2_scanout), 
		.l2clk				(l2clk), 
		.l1clk				(l1clka), 
		.pce0				(arb_q0_holdbar_a), 
		.pce1				(arb_qsel1_a), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.siclk_in			(siclk_in), 
		.soclk_in			(soclk_in), 
		.grant_a			(arb_grant_a), 
		.qsel0				(arb_qsel0_a), 
		.shift				(arb_shift_a), 
		.data_a				(src_data_a[29:20]), 
		.data_crit_x_l			(data_crit_x_[29:20]), 
		.data_ncrit_x_l			(data_ncrit_x_[29:20]), 
		.se				(se));
	ccx_new_macro__type_c_l i3(
		.data_x_l			(data_out_x_[39:30]), 
		.scan_in			(i3_scanin), 
		.scan_out			(i3_scanout), 
		.l2clk				(l2clk), 
		.l1clk				(l1clka), 
		.pce0				(arb_q0_holdbar_a), 
		.pce1				(arb_qsel1_a), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.siclk_in			(siclk_in), 
		.soclk_in			(soclk_in), 
		.grant_a			(arb_grant_a), 
		.qsel0				(arb_qsel0_a), 
		.shift				(arb_shift_a), 
		.data_a				(src_data_a[39:30]), 
		.data_crit_x_l			(data_crit_x_[39:30]), 
		.data_ncrit_x_l			(data_ncrit_x_[39:30]), 
		.se				(se));
	ccx_new_macro__type_c_l i4(
		.data_x_l			(data_out_x_[49:40]), 
		.scan_in			(i4_scanin), 
		.scan_out			(i4_scanout), 
		.l2clk				(l2clk), 
		.l1clk				(l1clka), 
		.pce0				(arb_q0_holdbar_a), 
		.pce1				(arb_qsel1_a), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.siclk_in			(siclk_in), 
		.soclk_in			(soclk_in), 
		.grant_a			(arb_grant_a), 
		.qsel0				(arb_qsel0_a), 
		.shift				(arb_shift_a), 
		.data_a				(src_data_a[49:40]), 
		.data_crit_x_l			(data_crit_x_[49:40]), 
		.data_ncrit_x_l			(data_ncrit_x_[49:40]), 
		.se				(se));
	ccx_new_macro__type_c_l i5(
		.data_x_l			(data_out_x_[59:50]), 
		.scan_in			(i5_scanin), 
		.scan_out			(i5_scanout), 
		.l2clk				(l2clk), 
		.l1clk				(l1clka), 
		.pce0				(arb_q0_holdbar_a), 
		.pce1				(arb_qsel1_a), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.siclk_in			(siclk_in), 
		.soclk_in			(soclk_in), 
		.grant_a			(arb_grant_a), 
		.qsel0				(arb_qsel0_a), 
		.shift				(arb_shift_a), 
		.data_a				(src_data_a[59:50]), 
		.data_crit_x_l			(data_crit_x_[59:50]), 
		.data_ncrit_x_l			(data_ncrit_x_[59:50]), 
		.se				(se));
	ccx_new_macro__type_c_l i6(
		.data_x_l			(data_out_x_[69:60]), 
		.scan_in			(i6_scanin), 
		.scan_out			(i6_scanout), 
		.l2clk				(l2clk), 
		.l1clk				(l1clka), 
		.pce0				(arb_q0_holdbar_a), 
		.pce1				(arb_qsel1_a), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.siclk_in			(siclk_in), 
		.soclk_in			(soclk_in), 
		.grant_a			(arb_grant_a), 
		.qsel0				(arb_qsel0_a), 
		.shift				(arb_shift_a), 
		.data_a				(src_data_a[69:60]), 
		.data_crit_x_l			(data_crit_x_[69:60]), 
		.data_ncrit_x_l			(data_ncrit_x_[69:60]), 
		.se				(se));
	ccx_new_macro__type_c_l i7(
		.data_x_l			(data_out_x_[79:70]), 
		.scan_in			(i7_scanin), 
		.scan_out			(i7_scanout), 
		.l2clk				(l2clk), 
		.l1clk				(l1clka), 
		.pce0				(arb_q0_holdbar_a), 
		.pce1				(arb_qsel1_a), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.siclk_in			(siclk_in), 
		.soclk_in			(soclk_in), 
		.grant_a			(arb_grant_a), 
		.qsel0				(arb_qsel0_a), 
		.shift				(arb_shift_a), 
		.data_a				(src_data_a[79:70]), 
		.data_crit_x_l			(data_crit_x_[79:70]), 
		.data_ncrit_x_l			(data_ncrit_x_[79:70]), 
		.se				(se));
	ccx_new_macro__type_c_l i8(
		.data_x_l			(data_out_x_[89:80]), 
		.scan_in			(i8_scanin), 
		.scan_out			(i8_scanout), 
		.l2clk				(l2clk), 
		.l1clk				(l1clkb), 
		.pce0				(arb_q0_holdbar_a), 
		.pce1				(arb_qsel1_a), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.siclk_in			(siclk_in), 
		.soclk_in			(soclk_in), 
		.grant_a			(arb_grant_a), 
		.qsel0				(arb_qsel0_a), 
		.shift				(arb_shift_a), 
		.data_a				(src_data_a[89:80]), 
		.data_crit_x_l			(data_crit_x_[89:80]), 
		.data_ncrit_x_l			(data_ncrit_x_[89:80]), 
		.se				(se));
	ccx_new_macro__type_c_l i9(
		.data_x_l			(data_out_x_[99:90]), 
		.scan_in			(i9_scanin), 
		.scan_out			(i9_scanout), 
		.l2clk				(l2clk), 
		.l1clk				(l1clkb), 
		.pce0				(arb_q0_holdbar_a), 
		.pce1				(arb_qsel1_a), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.siclk_in			(siclk_in), 
		.soclk_in			(soclk_in), 
		.grant_a			(arb_grant_a), 
		.qsel0				(arb_qsel0_a), 
		.shift				(arb_shift_a), 
		.data_a				(src_data_a[99:90]), 
		.data_crit_x_l			(data_crit_x_[99:90]), 
		.data_ncrit_x_l			(data_ncrit_x_[99:90]), 
		.se				(se));
	ccx_new_macro__type_c_l i10(
		.data_x_l			(data_out_x_[109:100]), 
		.scan_in			(i10_scanin), 
		.scan_out			(i10_scanout), 
		.l2clk				(l2clk), 
		.l1clk				(l1clkb), 
		.pce0				(arb_q0_holdbar_a), 
		.pce1				(arb_qsel1_a), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.siclk_in			(siclk_in), 
		.soclk_in			(soclk_in), 
		.grant_a			(arb_grant_a), 
		.qsel0				(arb_qsel0_a), 
		.shift				(arb_shift_a), 
		.data_a				(src_data_a[109:100]), 
		.data_crit_x_l			(data_crit_x_[109:100]), 
		.data_ncrit_x_l			(data_ncrit_x_[109:100]), 
		.se				(se));
	ccx_new_macro__type_c_l i11(
		.data_x_l			(data_out_x_[119:110]), 
		.scan_in			(i11_scanin), 
		.scan_out			(i11_scanout), 
		.l2clk				(l2clk), 
		.l1clk				(l1clkb), 
		.pce0				(arb_q0_holdbar_a), 
		.pce1				(arb_qsel1_a), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.siclk_in			(siclk_in), 
		.soclk_in			(soclk_in), 
		.grant_a			(arb_grant_a), 
		.qsel0				(arb_qsel0_a), 
		.shift				(arb_shift_a), 
		.data_a				(src_data_a[119:110]), 
		.data_crit_x_l			(data_crit_x_[119:110]), 
		.data_ncrit_x_l			(data_ncrit_x_[119:110]), 
		.se				(se));
	ccx_new_macro__type_c_l i12(
		.data_x_l			(data_out_x_[129:120]), 
		.scan_in			(i12_scanin), 
		.scan_out			(i12_scanout), 
		.l2clk				(l2clk), 
		.l1clk				(l1clkb), 
		.pce0				(arb_q0_holdbar_a), 
		.pce1				(arb_qsel1_a), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.siclk_in			(siclk_in), 
		.soclk_in			(soclk_in), 
		.grant_a			(arb_grant_a), 
		.qsel0				(arb_qsel0_a), 
		.shift				(arb_shift_a), 
		.data_a				(src_data_a[129:120]), 
		.data_crit_x_l			(data_crit_x_[129:120]), 
		.data_ncrit_x_l			(data_ncrit_x_[129:120]), 
		.se				(se));
	ccx_new_macro__type_c_l i13(
		.data_x_l			(data_out_x_[139:130]), 
		.scan_in			(i13_scanin), 
		.scan_out			(i13_scanout), 
		.l2clk				(l2clk), 
		.l1clk				(l1clkb), 
		.pce0				(arb_q0_holdbar_a), 
		.pce1				(arb_qsel1_a), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.siclk_in			(siclk_in), 
		.soclk_in			(soclk_in), 
		.grant_a			(arb_grant_a), 
		.qsel0				(arb_qsel0_a), 
		.shift				(arb_shift_a), 
		.data_a				(src_data_a[139:130]), 
		.data_crit_x_l			(data_crit_x_[139:130]), 
		.data_ncrit_x_l			(data_ncrit_x_[139:130]), 
		.se				(se));
	ccx_new_macro__type_c_l i14(
		.data_x_l			(data_out_x_[149:140]), 
		.scan_in			(i14_scanin), 
		.scan_out			(i14_scanout), 
		.l2clk				(l2clk), 
		.l1clk				(l1clkb), 
		.pce0				(arb_q0_holdbar_a), 
		.pce1				(arb_qsel1_a), 
		.pce_ov				(pce_ov), 
		.stop				(stop), 
		.siclk_in			(siclk_in), 
		.soclk_in			(soclk_in), 
		.grant_a			(arb_grant_a), 
		.qsel0				(arb_qsel0_a), 
		.shift				(arb_shift_a), 
		.data_a				(src_data_a[149:140]), 
		.data_crit_x_l			(data_crit_x_[149:140]), 
		.data_ncrit_x_l			(data_ncrit_x_[149:140]), 
		.se				(se));
endmodule


module ccx_new_macro__type_c_l(l2clk, l1clk, pce0, pce1, pce_ov, se, stop,
        siclk_in, soclk_in, scan_in, grant_a, qsel0, shift, data_a,
        data_crit_x_l, data_ncrit_x_l, data_x_l, scan_out);

        input                   l2clk;
        input                   l1clk;
        input                   pce0;
        input                   pce1;
        input                   pce_ov;
        input                   se;
        input                   stop;
        input                   siclk_in;
        input                   soclk_in;
        input                   scan_in;
        input                   grant_a;
        input                   qsel0;
        input                   shift;
        input   [9:0]           data_a;
        input   [9:0]           data_crit_x_l;
        input   [9:0]           data_ncrit_x_l;
        output  [9:0]           data_x_l;
        output                  scan_out;

        wire                    so5;
        wire                    siclk_out;
        wire                    soclk_out;
        wire                    l1clk0;
        wire                    l1clk1;
        wire                    grant_x;
        wire                    qsel0_buf;
        wire                    shift_buf;

        cl_dp1_ccxhdr c0(
                .si                             (scan_in),
                .so                             (so5),
                .l2clk                          (l2clk),
                .pce0                           (pce0),
                .pce1                           (pce1),
                .pce_ov                         (pce_ov),
                .stop                           (stop),
                .siclk_in                       (siclk_in),
                .soclk_in                       (soclk_in),
                .siclk_out                      (siclk_out),
                .soclk_out                      (soclk_out),
                .l1clk0                         (l1clk0),
                .l1clk1                         (l1clk1),
                .se                             (se),
                .l1clk                          (l1clk),
                .grant_a                        (grant_a),
                .grant_x                        (grant_x),
                .qsel0                          (qsel0),
                .qsel0_buf                      (qsel0_buf),
                .shift                          (shift),
                .shift_buf                      (shift_buf));
        ccx_mac_c #(10) mac_c(
                .siclk                          (siclk_out),
                .soclk                          (soclk_out),
                .data_a                         (data_a[9:0]),
                .data_crit_x_l                  (data_crit_x_l[9:0]),
                .data_ncrit_x_l                 (data_ncrit_x_l[9:0]),
                .data_x_l                       (data_x_l[9:0]),
                .si                             (so5),
                .so                             (scan_out),
                .l1clk0                         (l1clk0),
                .l1clk1                         (l1clk1),
                .grant_x                        (grant_x),
                .qsel0_buf                      (qsel0_buf),
                .shift_buf                      (shift_buf));
endmodule

`endif // `ifdef FPGA

