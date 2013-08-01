// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcx_dpsa.v
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
module pcx_dpsa (
  pcx_scache_data_x_, 
  arb_grant_l_a, 
  arb_q0_holdbar_l_a, 
  arb_qsel0_l_a, 
  arb_qsel1_l_a, 
  arb_shift_l_a, 
  arb_grant_r_a, 
  arb_q0_holdbar_r_a, 
  arb_qsel0_r_a, 
  arb_qsel1_r_a, 
  arb_shift_r_a, 
  spc0_pcx_data_a, 
  spc1_pcx_data_a, 
  spc2_pcx_data_a, 
  spc3_pcx_data_a, 
  spc4_pcx_data_a, 
  spc5_pcx_data_a, 
  spc6_pcx_data_a, 
  spc7_pcx_data_a, 
  tcu_scan_en, 
  l2clk, 
  tcu_pce_ov, 
  ccx_aclk, 
  ccx_bclk, 
  scan_in, 
  scan_out);
wire [129:0] all_ones;
wire [4:0] mac0_rep_in;
wire [3:0] arb_grant_l_a_rep;
wire [3:0] arb_qsel0_l_a_rep;
wire [3:0] arb_qsel1_l_a_rep;
wire [3:0] arb_shift_l_a_rep;
wire [3:0] arb_q0_holdbar_l_a_rep;
wire [4:0] mac0_rep_out;
wire [4:0] mac1_rep_in;
wire [4:0] mac1_rep_out;
wire [4:0] mac2_rep_in;
wire [4:0] mac2_rep_out;
wire [4:0] mac3_rep_in;
wire [4:0] mac3_rep_out;
wire [4:0] mac4_rep_in;
wire [7:4] arb_grant_r_a_rep;
wire [7:4] arb_q0_holdbar_r_a_rep;
wire [7:4] arb_qsel0_r_a_rep;
wire [7:4] arb_qsel1_r_a_rep;
wire [7:4] arb_shift_r_a_rep;
wire [4:0] mac4_rep_out;
wire [4:0] mac5_rep_in;
wire [4:0] mac5_rep_out;
wire [4:0] mac6_rep_in;
wire [4:0] mac6_rep_out;
wire scan_rep_in;
wire tcu_scan_en_out_0_unused;
wire tcu_pce_ov_out_0_unused;
wire ccx_aclk_out_0_unused;
wire ccx_bclk_out_0_unused;
wire [129:0] col1_data_x_;
wire pcx_mac0_scanin;
wire pcx_mac0_scanout;
wire [6:1] tcu_scan_en_out;
wire [6:1] tcu_pce_ov_out;
wire [6:1] ccx_aclk_out;
wire [6:1] ccx_bclk_out;
wire [129:0] col2_data_x_;
wire pcx_mac1_scanin;
wire pcx_mac1_scanout;
wire [129:0] col3_data_x_;
wire pcx_mac2_scanin;
wire pcx_mac2_scanout;
wire [129:0] col4_data_x_;
wire pcx_mac3_scanin;
wire pcx_mac3_scanout;
wire [129:0] col5_data_x_;
wire pcx_mac4_scanin;
wire pcx_mac4_scanout;
wire [129:0] col6_data_x_;
wire pcx_mac5_scanin;
wire pcx_mac5_scanout;
wire [129:0] col7_data_x_;
wire pcx_mac6_scanin;
wire pcx_mac6_scanout;
wire tcu_scan_en_out_7_unused;
wire tcu_pce_ov_out_7_unused;
wire ccx_aclk_out_7_unused;
wire ccx_bclk_out_7_unused;
wire pcx_mac7_scanin;
wire pcx_mac7_scanout;
wire [7:4] arb_grant_l_a_unused;
wire [7:4] arb_q0_holdbar_l_a_unused;
wire [7:4] arb_qsel0_l_a_unused;
wire [7:4] arb_qsel1_l_a_unused;
wire [7:4] arb_shift_l_a_unused;
wire [3:0] arb_grant_r_a_unused;
wire [3:0] arb_q0_holdbar_r_a_unused;
wire [3:0] arb_qsel0_r_a_unused;
wire [3:0] arb_qsel1_r_a_unused;
wire [3:0] arb_shift_r_a_unused;
wire scan_rep_out;


// Beginning of automatic outputs (from unused autoinst outputs)
output [129:0]          pcx_scache_data_x_;     // From mac3 of pcx_mcr_dp.v
// End of automatics

// Beginning of automatic inputs (from unused autoinst inputs)
input [7:0]             arb_grant_l_a;            // To mac0 of pcx_mar_dp.v, ...
input [7:0]             arb_q0_holdbar_l_a;          // To mac0 of pcx_mar_dp.v, ...
input [7:0]             arb_qsel0_l_a;            // To mac0 of pcx_mar_dp.v, ...
input [7:0]             arb_qsel1_l_a;            // To mac0 of pcx_mar_dp.v, ...
input [7:0]             arb_shift_l_a;            // To mac0 of pcx_mar_dp.v, ...
input [7:0]             arb_grant_r_a;            // To mac0 of pcx_mar_dp.v, ...
input [7:0]             arb_q0_holdbar_r_a;          // To mac0 of pcx_mar_dp.v, ...
input [7:0]             arb_qsel0_r_a;            // To mac0 of pcx_mar_dp.v, ...
input [7:0]             arb_qsel1_r_a;            // To mac0 of pcx_mar_dp.v, ...
input [7:0]             arb_shift_r_a;            // To mac0 of pcx_mar_dp.v, ...
input [129:0]           spc0_pcx_data_a;        // To mac0 of pcx_mar_dp.v
input [129:0]           spc1_pcx_data_a;        // To mac1 of pcx_mbr_dp.v
input [129:0]           spc2_pcx_data_a;        // To mac2 of pcx_mbr_dp.v
input [129:0]           spc3_pcx_data_a;        // To mac3 of pcx_mcr_dp.v
input [129:0]           spc4_pcx_data_a;        // To mac4 of pcx_mbl_dp.v
input [129:0]           spc5_pcx_data_a;        // To mac5 of pcx_mbl_dp.v
input [129:0]           spc6_pcx_data_a;        // To mac6 of pcx_mbl_dp.v
input [129:0]           spc7_pcx_data_a;        // To mac7 of pcx_mal_dp.v
// End of automatics
// globals
input tcu_scan_en ;
input           l2clk;
input           tcu_pce_ov;             // scan signals
input           ccx_aclk;
input           ccx_bclk;
input           scan_in;
output          scan_out;


//   sparc0 sparc2 sparc1 sparc3  sparc5  sparc7  sparc4  sparc6
//     |      |      |      |       |       |        |      |
//     v      v      v      v       v       v        v      v
//   mac0 -> mac1 ->mac2 ->mac3 <- mac4 <- mac5 <- mac6 <- mac7 
//    cl     br     br     br      br      br       br     ar
//    |
//    ---buf--
//            |
//            v
//          to sctag 

assign all_ones[129:0] = 130'h3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;


// mac0 arb inputs go through 1 buffer
assign mac0_rep_in[4:0] = {arb_grant_l_a[0],arb_qsel0_l_a[0],arb_qsel1_l_a[0],
                           arb_shift_l_a[0],arb_q0_holdbar_l_a[0]};

assign {arb_grant_l_a_rep[0],arb_qsel0_l_a_rep[0],arb_qsel1_l_a_rep[0],
        arb_shift_l_a_rep[0],arb_q0_holdbar_l_a_rep[0]} = mac0_rep_out[4:0];

// mac1 arb input go through 1 buffer
assign mac1_rep_in[4:0] = {arb_grant_l_a[2],arb_q0_holdbar_l_a[2],arb_qsel0_l_a[2],
                       arb_qsel1_l_a[2],arb_shift_l_a[2]};

assign {arb_grant_l_a_rep[2],arb_q0_holdbar_l_a_rep[2],arb_qsel0_l_a_rep[2],
        arb_qsel1_l_a_rep[2],arb_shift_l_a_rep[2]} = mac1_rep_out[4:0];

// mac2 arb inputs go through 2 buffers
assign mac2_rep_in[4:0] = {arb_grant_l_a[1],arb_q0_holdbar_l_a[1],arb_qsel0_l_a[1],
                       arb_qsel1_l_a[1],arb_shift_l_a[1]};

assign {arb_grant_l_a_rep[1],arb_q0_holdbar_l_a_rep[1],arb_qsel0_l_a_rep[1],
        arb_qsel1_l_a_rep[1],arb_shift_l_a_rep[1]} = mac2_rep_out[4:0];

// mac3 inputs go through 2 buffers
assign mac3_rep_in[4:0] = {arb_grant_l_a[3],arb_q0_holdbar_l_a[3],arb_qsel0_l_a[3],
                       arb_qsel1_l_a[3],arb_shift_l_a[3]};

assign {arb_grant_l_a_rep[3],arb_q0_holdbar_l_a_rep[3],arb_qsel0_l_a_rep[3],
        arb_qsel1_l_a_rep[3],arb_shift_l_a_rep[3]} = mac3_rep_out[4:0];

// mac4 inputs go through 2 buffers
assign mac4_rep_in[4:0] = {arb_grant_r_a[5],arb_q0_holdbar_r_a[5],arb_qsel0_r_a[5],
                       arb_qsel1_r_a[5],arb_shift_r_a[5]};

assign {arb_grant_r_a_rep[5],arb_q0_holdbar_r_a_rep[5],arb_qsel0_r_a_rep[5],
        arb_qsel1_r_a_rep[5],arb_shift_r_a_rep[5]} = mac4_rep_out[4:0];

// mac5 inputs go through 1 buffer
assign mac5_rep_in[4:0] = {arb_grant_r_a[7],arb_q0_holdbar_r_a[7],arb_qsel0_r_a[7],
                       arb_qsel1_r_a[7],arb_shift_r_a[7]};

assign {arb_grant_r_a_rep[7],arb_q0_holdbar_r_a_rep[7],arb_qsel0_r_a_rep[7],
        arb_qsel1_r_a_rep[7],arb_shift_r_a_rep[7]} = mac5_rep_out[4:0];

// mac6 inputs go through 1 buffer
assign mac6_rep_in[4:0] = {arb_grant_r_a[4],arb_q0_holdbar_r_a[4],arb_qsel0_r_a[4],
                       arb_qsel1_r_a[4],arb_shift_r_a[4]};

assign {arb_grant_r_a_rep[4],arb_q0_holdbar_r_a_rep[4],arb_qsel0_r_a_rep[4],
        arb_qsel1_r_a_rep[4],arb_shift_r_a_rep[4]} = mac6_rep_out[4:0];

assign scan_rep_in = scan_in;


pcx_rep_dp pcx_rep(.mac0_rep_out(mac0_rep_out[4:0]),
  .mac1_rep_out(mac1_rep_out[4:0]),
  .mac2_rep_out(mac2_rep_out[4:0]),
  .mac3_rep_out(mac3_rep_out[4:0]),
  .mac4_rep_out(mac4_rep_out[4:0]),
  .mac5_rep_out(mac5_rep_out[4:0]),
  .mac6_rep_out(mac6_rep_out[4:0]),
  .scan_rep_out(scan_rep_out),
  .mac0_rep_in(mac0_rep_in[4:0]),
  .mac1_rep_in(mac1_rep_in[4:0]),
  .mac2_rep_in(mac2_rep_in[4:0]),
  .mac3_rep_in(mac3_rep_in[4:0]),
  .mac4_rep_in(mac4_rep_in[4:0]),
  .mac5_rep_in(mac5_rep_in[4:0]),
  .mac6_rep_in(mac6_rep_in[4:0]),
  .scan_rep_in(scan_rep_in)
                   );


// input from spc0
pcx_mcl_dp pcx_mac0(
                    // Outputs
                    .data_out_x_        (pcx_scache_data_x_[129:0]), // Templated
                    .tcu_scan_en_out (tcu_scan_en_out_0_unused),
                    .tcu_pce_ov_out (tcu_pce_ov_out_0_unused),
                    .ccx_aclk_out (ccx_aclk_out_0_unused),
                    .ccx_bclk_out (ccx_bclk_out_0_unused),
                    // Inputs
                    .arb_grant_a        (arb_grant_l_a_rep[0]),        // Templated
                    .arb_qsel0_a        (arb_qsel0_l_a_rep[0]),        // Templated
                    .arb_qsel1_a        (arb_qsel1_l_a_rep[0]),        // Templated
                    .arb_q0_holdbar_a   (arb_q0_holdbar_l_a_rep[0]),   // Templated
                    .arb_shift_a        (arb_shift_l_a_rep[0]),        // Templated
                    .src_pcx_data_a     (spc0_pcx_data_a[129:0]), // Templated
                    .data_crit_x_       (col1_data_x_[129:0]),   // Templated
                    .data_ncrit_x_      (all_ones[129:0]),   // Templated
                    .scan_in(pcx_mac0_scanin),
                    .scan_out(pcx_mac0_scanout),
                    .l2clk              (l2clk),
                    .tcu_scan_en (tcu_scan_en_out[1]),
                    .tcu_pce_ov (tcu_pce_ov_out[1]),
                    .ccx_aclk (ccx_aclk_out[1]),
                    .ccx_bclk (ccx_bclk_out[1])
                    );


/*
   pcx_mbr_dp AUTO_TEMPLATE
 (
 // Outputs
 .data_out_x_	(col@_data_x_[129:0]),
 // Inputs
 .arb_grant_a(arb_grant_r_a[@]),
 .arb_qsel0_a(arb_qsel0_r_a[@]),
 .arb_qsel1_a(arb_qsel1_r_a[@]),
 .arb_q0_holdbar_a(arb_q0_holdbar_r_a[@]),
 .arb_shift_a(arb_shift_r_a[@]),
 .src_pcx_data_a(spc@_pcx_data_a[129:0]),
 .data_prev_x_(col@"(+ @ 1)"_data_x_[129:0]),
 .l2clk		(l2clk))
 */

// do not use autoinstancing.
// connections have been modified to match the cpu floorplan
// src_pcx_data_a has to be manually connected.


// input from spc2
pcx_mbr_dp pcx_mac1(
                    // Outputs
                    .data_out_x_        (col1_data_x_[129:0]),   // Templated
                    .tcu_scan_en_out (tcu_scan_en_out[1]),
                    .tcu_pce_ov_out (tcu_pce_ov_out[1]),
                    .ccx_aclk_out (ccx_aclk_out[1]),
                    .ccx_bclk_out (ccx_bclk_out[1]),
                    // Inputs
                    .arb_grant_a        (arb_grant_l_a_rep[2]),        // Templated
                    .arb_qsel0_a        (arb_qsel0_l_a_rep[2]),        // Templated
                    .arb_qsel1_a        (arb_qsel1_l_a_rep[2]),        // Templated
                    .arb_q0_holdbar_a   (arb_q0_holdbar_l_a_rep[2]),   // Templated
                    .arb_shift_a        (arb_shift_l_a_rep[2]),        // Templated
                    .src_pcx_data_a     (spc2_pcx_data_a[129:0]), // Templated
                    .data_prev_x_       (col2_data_x_[129:0]),   // Templated
                    .scan_in(pcx_mac1_scanin),
                    .scan_out(pcx_mac1_scanout),
                    .l2clk              (l2clk),
                    .tcu_scan_en (tcu_scan_en_out[2]),
                    .tcu_pce_ov (tcu_pce_ov_out[2]),
                    .ccx_aclk (ccx_aclk_out[2]),
                    .ccx_bclk (ccx_bclk_out[2])
                    );


 
// input from spc1
pcx_mbr_dp pcx_mac2(
                    // Outputs
                    .data_out_x_        (col2_data_x_[129:0]),   // Templated
                    .tcu_scan_en_out (tcu_scan_en_out[2]),
                    .tcu_pce_ov_out (tcu_pce_ov_out[2]),
                    .ccx_aclk_out (ccx_aclk_out[2]),
                    .ccx_bclk_out (ccx_bclk_out[2]),
                    // Inputs
                    .arb_grant_a        (arb_grant_l_a_rep[1]),        // Templated
                    .arb_qsel0_a        (arb_qsel0_l_a_rep[1]),        // Templated
                    .arb_qsel1_a        (arb_qsel1_l_a_rep[1]),        // Templated
                    .arb_q0_holdbar_a   (arb_q0_holdbar_l_a_rep[1]),   // Templated
                    .arb_shift_a        (arb_shift_l_a_rep[1]),        // Templated
                    .src_pcx_data_a     (spc1_pcx_data_a[129:0]), // Templated
                    .data_prev_x_       (col3_data_x_[129:0]),   // Templated
                    .scan_in(pcx_mac2_scanin),
                    .scan_out(pcx_mac2_scanout),
                    .l2clk              (l2clk),
                    .tcu_scan_en (tcu_scan_en_out[3]),
                    .tcu_pce_ov (tcu_pce_ov_out[3]),
                    .ccx_aclk (ccx_aclk_out[3]),
                    .ccx_bclk (ccx_bclk_out[3])
                    );
 
// input from spc3
pcx_mbr_dp pcx_mac3(
                    // Outputs
                    .data_out_x_        (col3_data_x_[129:0]),   // Templated
                    .tcu_scan_en_out (tcu_scan_en_out[3]),
                    .tcu_pce_ov_out (tcu_pce_ov_out[3]),
                    .ccx_aclk_out (ccx_aclk_out[3]),
                    .ccx_bclk_out (ccx_bclk_out[3]),
                    // Inputs
                    .arb_grant_a        (arb_grant_l_a_rep[3]),        // Templated
                    .arb_qsel0_a        (arb_qsel0_l_a_rep[3]),        // Templated
                    .arb_qsel1_a        (arb_qsel1_l_a_rep[3]),        // Templated
                    .arb_q0_holdbar_a   (arb_q0_holdbar_l_a_rep[3]),   // Templated
                    .arb_shift_a        (arb_shift_l_a_rep[3]),        // Templated
                    .src_pcx_data_a     (spc3_pcx_data_a[129:0]), // Templated
                    .data_prev_x_       (col4_data_x_[129:0]),   // Templated
                    .scan_in(pcx_mac3_scanin),
                    .scan_out(pcx_mac3_scanout),
                    .l2clk              (l2clk),
                    .tcu_scan_en (tcu_scan_en),
                    .tcu_pce_ov (tcu_pce_ov),
                    .ccx_aclk (ccx_aclk),
                    .ccx_bclk (ccx_bclk)
                    );

 
// input from spc5
pcx_mbr_dp pcx_mac4(
                    // Outputs
                    .data_out_x_        (col4_data_x_[129:0]),   // Templated
                    .tcu_scan_en_out (tcu_scan_en_out[4]),
                    .tcu_pce_ov_out (tcu_pce_ov_out[4]),
                    .ccx_aclk_out (ccx_aclk_out[4]),
                    .ccx_bclk_out (ccx_bclk_out[4]),
                    // Inputs
                    .arb_grant_a        (arb_grant_r_a_rep[5]),        // Templated
                    .arb_qsel0_a        (arb_qsel0_r_a_rep[5]),        // Templated
                    .arb_qsel1_a        (arb_qsel1_r_a_rep[5]),        // Templated
                    .arb_q0_holdbar_a   (arb_q0_holdbar_r_a_rep[5]),   // Templated
                    .arb_shift_a        (arb_shift_r_a_rep[5]),        // Templated
                    .src_pcx_data_a     (spc5_pcx_data_a[129:0]), // Templated
                    .data_prev_x_       (col5_data_x_[129:0]),   // Templated
                    .scan_in(pcx_mac4_scanin),
                    .scan_out(pcx_mac4_scanout),
                    .l2clk              (l2clk),
                    .tcu_scan_en (tcu_scan_en_out[3]),
                    .tcu_pce_ov (tcu_pce_ov_out[3]),
                    .ccx_aclk (ccx_aclk_out[3]),
                    .ccx_bclk (ccx_bclk_out[3])
                    );

// input from spc7
pcx_mbr_dp pcx_mac5(
                    // Outputs
                    .data_out_x_        (col5_data_x_[129:0]),   // Templated
                    .tcu_scan_en_out (tcu_scan_en_out[5]),
                    .tcu_pce_ov_out (tcu_pce_ov_out[5]),
                    .ccx_aclk_out (ccx_aclk_out[5]),
                    .ccx_bclk_out (ccx_bclk_out[5]),
                    // Inputs
                    .arb_grant_a        (arb_grant_r_a_rep[7]),        // Templated
                    .arb_qsel0_a        (arb_qsel0_r_a_rep[7]),        // Templated
                    .arb_qsel1_a        (arb_qsel1_r_a_rep[7]),        // Templated
                    .arb_q0_holdbar_a   (arb_q0_holdbar_r_a_rep[7]),   // Templated
                    .arb_shift_a        (arb_shift_r_a_rep[7]),        // Templated
                    .src_pcx_data_a     (spc7_pcx_data_a[129:0]), // Templated
                    .data_prev_x_       (col6_data_x_[129:0]),   // Templated
                    .scan_in(pcx_mac5_scanin),
                    .scan_out(pcx_mac5_scanout),
                    .l2clk              (l2clk),
                    .tcu_scan_en (tcu_scan_en_out[4]),
                    .tcu_pce_ov (tcu_pce_ov_out[4]),
                    .ccx_aclk (ccx_aclk_out[4]),
                    .ccx_bclk (ccx_bclk_out[4])
                    );

 
// input from spc4
pcx_mbr_dp pcx_mac6(
                    // Outputs
                    .data_out_x_        (col6_data_x_[129:0]),   // Templated
                    .tcu_scan_en_out (tcu_scan_en_out[6]),
                    .tcu_pce_ov_out (tcu_pce_ov_out[6]),
                    .ccx_aclk_out (ccx_aclk_out[6]),
                    .ccx_bclk_out (ccx_bclk_out[6]),
                    // Inputs
                    .arb_grant_a        (arb_grant_r_a_rep[4]),        // Templated
                    .arb_qsel0_a        (arb_qsel0_r_a_rep[4]),        // Templated
                    .arb_qsel1_a        (arb_qsel1_r_a_rep[4]),        // Templated
                    .arb_q0_holdbar_a   (arb_q0_holdbar_r_a_rep[4]),   // Templated
                    .arb_shift_a        (arb_shift_r_a_rep[4]),        // Templated
                    .src_pcx_data_a     (spc4_pcx_data_a[129:0]), // Templated
                    .data_prev_x_       (col7_data_x_[129:0]),   // Templated
                    .scan_in(pcx_mac6_scanin),
                    .scan_out(pcx_mac6_scanout),
                    .l2clk              (l2clk),
                    .tcu_scan_en (tcu_scan_en_out[5]),
                    .tcu_pce_ov (tcu_pce_ov_out[5]),
                    .ccx_aclk (ccx_aclk_out[5]),
                    .ccx_bclk (ccx_bclk_out[5])
                    );
 

/*
   pcx_mar_dp AUTO_TEMPLATE
 (
 // Outputs
 .data_out_x_	(col@_data_x_[129:0]),
 // Inputs
 .arb_grant_a(arb_grant_r_a[@]),
 .arb_qsel0_a(arb_qsel0_r_a[@]),
 .arb_qsel1_a(arb_qsel1_r_a[@]),
 .arb_q0_holdbar_a(arb_q0_holdbar_r_a[@]),
 .arb_shift_a(arb_shift_r_a[@]),
 .src_pcx_data_a(spc@_pcx_data_a[129:0]),
 .l2clk		(l2clk));
*/

// do not use autoinstancing.
// connections have been modified to match the cpu floorplan
// src_pcx_data_a has to be manually connected.

// input from spc6
pcx_mar_dp pcx_mac7 (
                     // Outputs
                     .data_out_x_       (col7_data_x_[129:0]),   // Templated
                     .tcu_scan_en_out (tcu_scan_en_out_7_unused),
                     .tcu_pce_ov_out (tcu_pce_ov_out_7_unused),
                     .ccx_aclk_out (ccx_aclk_out_7_unused),
                     .ccx_bclk_out (ccx_bclk_out_7_unused),
                     // Inputs
                     .arb_grant_a       (arb_grant_r_a[6]),        // Templated
                     .arb_qsel0_a       (arb_qsel0_r_a[6]),        // Templated
                     .arb_qsel1_a       (arb_qsel1_r_a[6]),        // Templated
                     .arb_q0_holdbar_a  (arb_q0_holdbar_r_a[6]),   // Templated
                     .arb_shift_a       (arb_shift_r_a[6]),        // Templated
                     .src_pcx_data_a    (spc6_pcx_data_a[129:0]), // Templated
                     .scan_in(pcx_mac7_scanin),
                     .scan_out(pcx_mac7_scanout),
                     .l2clk             (l2clk),                 // Templated
                     .tcu_scan_en (tcu_scan_en_out[6]),
                     .tcu_pce_ov (tcu_pce_ov_out[6]),
                     .ccx_aclk (ccx_aclk_out[6]),
                     .ccx_bclk (ccx_bclk_out[6])
                     );


assign arb_grant_l_a_unused[7:4] = arb_grant_l_a[7:4];
assign arb_q0_holdbar_l_a_unused[7:4] = arb_q0_holdbar_l_a[7:4];
assign arb_qsel0_l_a_unused[7:4] = arb_qsel0_l_a[7:4];
assign arb_qsel1_l_a_unused[7:4] = arb_qsel1_l_a[7:4];
assign arb_shift_l_a_unused[7:4] = arb_shift_l_a[7:4];

assign arb_grant_r_a_unused[3:0] = arb_grant_r_a[3:0];
assign arb_q0_holdbar_r_a_unused[3:0] = arb_q0_holdbar_r_a[3:0];
assign arb_qsel0_r_a_unused[3:0] = arb_qsel0_r_a[3:0];
assign arb_qsel1_r_a_unused[3:0] = arb_qsel1_r_a[3:0];
assign arb_shift_r_a_unused[3:0] = arb_shift_r_a[3:0];

// fixscan start:
assign pcx_mac0_scanin           = scan_rep_out             ;
assign pcx_mac1_scanin           = pcx_mac0_scanout         ;
assign pcx_mac2_scanin           = pcx_mac1_scanout         ;
assign pcx_mac3_scanin           = pcx_mac2_scanout         ;
assign pcx_mac4_scanin           = pcx_mac3_scanout         ;
assign pcx_mac5_scanin           = pcx_mac4_scanout         ;
assign pcx_mac6_scanin           = pcx_mac5_scanout         ;
assign pcx_mac7_scanin           = pcx_mac6_scanout         ;
assign scan_out                  = pcx_mac7_scanout         ;
// fixscan end:
endmodule

// Local Variables:
// verilog-library-directories:("." "v")
// End:



//
//   buff macro
//
//





module pcx_dpsa_buff_macro__dbuff_32x__stack_6l__width_5 (
  din, 
  dout);
  input [4:0] din;
  output [4:0] dout;






buff #(5)  d0_0 (
.in(din[4:0]),
.out(dout[4:0])
);








endmodule





//
//   buff macro
//
//





module pcx_dpsa_buff_macro__dbuff_32x__stack_none__width_1 (
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
//   buff macro
//
//





module pcx_dpsa_buff_macro__dbuff_8x__stack_none__vertical_1__width_4 (
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

module pcx_dpsa_ccx_l1clkhdr_ctl_macro__dl1hdr_24x (
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





module pcx_dpsa_ccx_new_macro__type_c_l (
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


//
//// scan renames
//assign pce_ov = tcu_pce_ov;
//assign stop = tcu_clk_stop;
//assign siclk = tcu_aclk;
//assign soclk = tcu_bclk;
//// end scan
//
//buff_macro i_buf_grant (width=1, stack=30c)
//(
// .din (arb_grant_a),
// .dout (grant_a),
// );
//
//msff_macro i_dff_grant_x (width=12, stack=30c) 
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
//msff_macro i_dff_q1_2 (width=40, stack=50c) 
//(
// .scan_in(i_dff_q1_2_scanin),
// .scan_out(i_dff_q1_2_scanout),
// .clk	        (l2clk),
// .din           (src_pcx_data_a[129:90]),
// .dout          (q1_dataout[129:90]),
// .en            (arb_qsel1_a),
// );
//
//msff_macro i_dff_q1_1 (width=50, stack=50c) 
//(
// .scan_in(i_dff_q1_1_scanin),
// .scan_out(i_dff_q1_1_scanout),
// .clk	        (l2clk),
// .din           (src_pcx_data_a[89:40]),
// .dout          (q1_dataout[89:40]),
// .en            (arb_qsel1_a),
// );
//
//msff_macro i_dff_q1_0 (width=40, stack=50c) 
//(
// .scan_in(i_dff_q1_0_scanin),
// .scan_out(i_dff_q1_0_scanout),
// .clk	        (l2clk),
// .din           (src_pcx_data_a[39:0]),
// .dout          (q1_dataout[39:0]),
// .en            (arb_qsel1_a),
// );
//
////assign q0_datain_ca[149:0] = 
////             (arb_pcxdp_qsel0_ca ? src_pcx_data_ca[149:0] : 150'd0) |
////	     (arb_pcxdp_shift_cx ? q1_dataout[149:0] : 150'd0) ;
//
//
//mux_macro i_mux_q0_2 (width=40, mux=aonpe, ports=2, stack=50c) 
//(
// .din0   (src_pcx_data_a[129:90]),
// .din1   (q1_dataout[129:90]),
// .sel0   (arb_qsel0_a),
// .sel1   (arb_shift_a),
// .dout   (q0_datain_a[129:90]),
// );
//
//mux_macro i_mux_q0_1 (width=50, mux=aonpe, ports=2, stack=50c) 
//(
// .din0   (src_pcx_data_a[89:40]),
// .din1   (q1_dataout[89:40]),
// .sel0   (arb_qsel0_a),
// .sel1   (arb_shift_a),
// .dout   (q0_datain_a[89:40]),
// );
//
//mux_macro i_mux_q0_0 (width=40, mux=aonpe, ports=2, stack=50c) 
//(
// .din0   (src_pcx_data_a[39:0]),
// .din1   (q1_dataout[39:0]),
// .sel0   (arb_qsel0_a),
// .sel1   (arb_shift_a),
// .dout   (q0_datain_a[39:0]),
// );
//
//msff_macro i_dff_q0_2 (width=40, stack=50c) 
//(
// .scan_in(i_dff_q0_2_scanin),
// .scan_out(i_dff_q0_2_scanout),
// .clk	        (l2clk),
// .din           (q0_datain_a[129:90]),
// .dout          (q0_dataout[129:90]),
// .en            (arb_q0_holdbar_a),
// );
//
//msff_macro i_dff_q0_1 (width=50, stack=50c) 
//(
// .scan_in(i_dff_q0_1_scanin),
// .scan_out(i_dff_q0_1_scanout),
// .clk	        (l2clk),
// .din           (q0_datain_a[89:40]),
// .dout          (q0_dataout[89:40]),
// .en            (arb_q0_holdbar_a),
// );
//
//msff_macro i_dff_q0_0 (width=40, stack=50c) 
//(
// .scan_in(i_dff_q0_0_scanin),
// .scan_out(i_dff_q0_0_scanout),
// .clk	        (l2clk),
// .din           (q0_datain_a[39:0]),
// .dout          (q0_dataout[39:0]),
// .en            (arb_q0_holdbar_a),
// );
//
////MUX
//
//nand_macro i_nand_data_g_2 (width=40, ports=2, stack=50c) 
//(
// .din0   (q0_dataout[129:90]),
// .din1   ({{10{grant_x[11]}},{10{grant_x[10]}},{10{grant_x[9]}},{10{grant_x[8]}}}),
// .dout   (data_x_[129:90]),
// );
// 	 
//nand_macro i_nand_data_g_1 (width=50, ports=2, stack=50c) 
//(
// .din0   (q0_dataout[89:40]),
// .din1   ({{10{grant_x[7]}},{15{grant_x[6]}},{15{grant_x[5]}},{10{grant_x[4]}}}),
// .dout   (data_x_[89:40]),
// );
// 	 
//nand_macro i_nand_data_g_0 (width=40, ports=2, stack=50c) 
//(
// .din0   (q0_dataout[39:0]),
// .din1   ({{10{grant_x[3]}},{10{grant_x[2]}},{10{grant_x[1]}},{10{grant_x[0]}}}),
// .dout   (data_x_[39:0]),
// );
// 	 
//
//nand_macro i_nand_data_prev_2 (width=40, ports=2, stack=50c) 
//(
// .din0	(data_x_[129:90]),
// .din1	(data_prev_x_[129:90]),
// .dout	(data_out_x[129:90])
// );
//
//nand_macro i_nand_data_prev_1 (width=50, ports=2, stack=50c) 
//(
// .din0	(data_x_[89:40]),
// .din1	(data_prev_x_[89:40]),
// .dout	(data_out_x[89:40])
// );
//
//nand_macro i_nand_data_prev_0 (width=40, ports=2, stack=50c) 
//(
// .din0	(data_x_[39:0]),
// .din1	(data_prev_x_[39:0]),
// .dout	(data_out_x[39:0])
// );
//
//inv_macro i_inv_data_out_2 (width=40, stack=50c) 
//(
// .din	(data_out_x[129:90]),
// .dout	(data_out_x_[129:90])
// );
//
//inv_macro i_inv_data_out_1 (width=50, stack=50c) 
//(
// .din	(data_out_x[89:40]),
// .dout	(data_out_x_[89:40])
// );
//
//inv_macro i_inv_data_out_0 (width=40, stack=50c) 
//(
// .din	(data_out_x[39:0]),
// .dout	(data_out_x_[39:0])
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
// Local Variables:
// verilog-library-directories:("." "v")
// verilog-library-files:("./v/ccx_new_macro.v")
// End:
//


//
//   ccx macro
//
//





module pcx_dpsa_ccx_new_macro__type_b_r (
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
  data_prev_x_l, 
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
input [9:0] data_prev_x_l;
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






ccx_mac_b #(10)  mac_b(
.siclk(siclk_out),			
.soclk(soclk_out),			
.data_a(data_a[9:0]),			
.data_prev_x_l(data_prev_x_l[9:0]),   
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


//
//// scan renames
//assign pce_ov = tcu_pce_ov;
//assign stop = tcu_clk_stop;
//assign siclk = ccx_aclk;
//assign soclk = ccx_bclk;
//// end scan
//
//// buffer the grant signal
//
//buff_macro i_buf_grant (width=1, stack=30c)
//(
// .din (arb_grant_a),
// .dout (grant_a),
// );
//
//msff_macro i_dff_grant_x (width=12, stack=30c) 
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
//msff_macro i_dff_q1_2 (width=40, stack=50c) 
//(
// .scan_in(i_dff_q1_2_scanin),
// .scan_out(i_dff_q1_2_scanout),
// .clk	        (l2clk),
// .din           (src_pcx_data_a[129:90]),
// .dout          (q1_dataout[129:90]),
// .en            (arb_qsel1_a),
// );
//
//msff_macro i_dff_q1_1 (width=50, stack=50c) 
//(
// .scan_in(i_dff_q1_1_scanin),
// .scan_out(i_dff_q1_1_scanout),
// .clk	        (l2clk),
// .din           (src_pcx_data_a[89:40]),
// .dout          (q1_dataout[89:40]),
// .en            (arb_qsel1_a),
// );
//
//msff_macro i_dff_q1_0 (width=40, stack=50c) 
//(
// .scan_in(i_dff_q1_0_scanin),
// .scan_out(i_dff_q1_0_scanout),
// .clk	        (l2clk),
// .din           (src_pcx_data_a[39:0]),
// .dout          (q1_dataout[39:0]),
// .en            (arb_qsel1_a),
// );
//
////assign q0_datain_ca[129:0] = 
////             (arb_pcxdp_qsel0_ca ? src_pcx_data_ca[129:0] : 150'd0) |
////	     (arb_pcxdp_shift_cx ? q1_dataout[129:0] : 150'd0) ;
//
//
//mux_macro i_mux_q0_2 (width=40, mux=aonpe, ports=2, stack=50c) 
//(
// .din0   (src_pcx_data_a[129:90]),
// .din1   (q1_dataout[129:90]),
// .sel0   (arb_qsel0_a),
// .sel1   (arb_shift_a),
// .dout   (q0_datain_a[129:90]),
// );
//
//mux_macro i_mux_q0_1 (width=50, mux=aonpe, ports=2, stack=50c) 
//(
// .din0   (src_pcx_data_a[89:40]),
// .din1   (q1_dataout[89:40]),
// .sel0   (arb_qsel0_a),
// .sel1   (arb_shift_a),
// .dout   (q0_datain_a[89:40]),
// );
//
//mux_macro i_mux_q0_0 (width=40, mux=aonpe, ports=2, stack=50c) 
//(
// .din0   (src_pcx_data_a[39:0]),
// .din1   (q1_dataout[39:0]),
// .sel0   (arb_qsel0_a),
// .sel1   (arb_shift_a),
// .dout   (q0_datain_a[39:0]),
// );
//
//msff_macro i_dff_q0_2 (width=40, stack=50c) 
//(
// .scan_in(i_dff_q0_2_scanin),
// .scan_out(i_dff_q0_2_scanout),
// .clk	        (l2clk),
// .din           (q0_datain_a[129:90]),
// .dout          (q0_dataout[129:90]),
// .en            (arb_q0_holdbar_a),
// );
//
//msff_macro i_dff_q0_1 (width=50, stack=50c) 
//(
// .scan_in(i_dff_q0_1_scanin),
// .scan_out(i_dff_q0_1_scanout),
// .clk	        (l2clk),
// .din           (q0_datain_a[89:40]),
// .dout          (q0_dataout[89:40]),
// .en            (arb_q0_holdbar_a),
// );
//
//msff_macro i_dff_q0_0 (width=40, stack=50c) 
//(
// .scan_in(i_dff_q0_0_scanin),
// .scan_out(i_dff_q0_0_scanout),
// .clk	        (l2clk),
// .din           (q0_datain_a[39:0]),
// .dout          (q0_dataout[39:0]),
// .en            (arb_q0_holdbar_a),
// );
//
//// MUX
//nand_macro i_nand_data_g_2 (width=40, ports=2, stack=50c) 
//(
// .din0   (q0_dataout[129:90]),
// .din1   ({{10{grant_x[11]}},{10{grant_x[10]}},{10{grant_x[9]}},{10{grant_x[8]}}}),
// .dout   (data_out_x_[129:90]),
// );
// 	 
//nand_macro i_nand_data_g_1 (width=50, ports=2, stack=50c) 
//(
// .din0   (q0_dataout[89:40]),
// .din1   ({{10{grant_x[7]}},{15{grant_x[6]}},{15{grant_x[5]}},{10{grant_x[4]}}}),
// .dout   (data_out_x_[89:40]),
// );
// 	 
//nand_macro i_nand_data_g_0 (width=40, ports=2, stack=50c) 
//(
// .din0   (q0_dataout[39:0]),
// .din1   ({{10{grant_x[3]}},{10{grant_x[2]}},{10{grant_x[1]}},{10{grant_x[0]}}}),
// .dout   (data_out_x_[39:0]),
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
// Local Variables:
// verilog-library-directories:("." "v")
// verilog-library-files:("./v/ccx_new_macro.v")
// End:
//



//
//   ccx macro
//
//





module pcx_dpsa_ccx_new_macro__type_a (
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






ccx_mac_a #(10)  mac_a(
.siclk(siclk_out),			
.soclk(soclk_out),			
.data_a(data_a[9:0]),			
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
module pcx_dpsa(pcx_scache_data_x_, arb_grant_l_a, arb_q0_holdbar_l_a, 
	arb_qsel0_l_a, arb_qsel1_l_a, arb_shift_l_a, arb_grant_r_a, 
	arb_q0_holdbar_r_a, arb_qsel0_r_a, arb_qsel1_r_a, arb_shift_r_a, 
	spc0_pcx_data_a, spc1_pcx_data_a, spc2_pcx_data_a, spc3_pcx_data_a, 
	spc4_pcx_data_a, spc5_pcx_data_a, spc6_pcx_data_a, spc7_pcx_data_a, 
	tcu_scan_en, l2clk, tcu_pce_ov, ccx_aclk, ccx_bclk, scan_in, scan_out);

	output	[129:0]		pcx_scache_data_x_;
	input	[7:0]		arb_grant_l_a;
	input	[7:0]		arb_q0_holdbar_l_a;
	input	[7:0]		arb_qsel0_l_a;
	input	[7:0]		arb_qsel1_l_a;
	input	[7:0]		arb_shift_l_a;
	input	[7:0]		arb_grant_r_a;
	input	[7:0]		arb_q0_holdbar_r_a;
	input	[7:0]		arb_qsel0_r_a;
	input	[7:0]		arb_qsel1_r_a;
	input	[7:0]		arb_shift_r_a;
	input	[129:0]		spc0_pcx_data_a;
	input	[129:0]		spc1_pcx_data_a;
	input	[129:0]		spc2_pcx_data_a;
	input	[129:0]		spc3_pcx_data_a;
	input	[129:0]		spc4_pcx_data_a;
	input	[129:0]		spc5_pcx_data_a;
	input	[129:0]		spc6_pcx_data_a;
	input	[129:0]		spc7_pcx_data_a;
	input			tcu_scan_en;
	input			l2clk;
	input			tcu_pce_ov;
	input			ccx_aclk;
	input			ccx_bclk;
	input			scan_in;
	output			scan_out;

	wire	[129:0]		all_ones;
	wire	[4:0]		mac0_rep_in;
	wire	[3:0]		arb_grant_l_a_rep;
	wire	[3:0]		arb_qsel0_l_a_rep;
	wire	[3:0]		arb_qsel1_l_a_rep;
	wire	[3:0]		arb_shift_l_a_rep;
	wire	[3:0]		arb_q0_holdbar_l_a_rep;
	wire	[4:0]		mac0_rep_out;
	wire	[4:0]		mac1_rep_in;
	wire	[4:0]		mac1_rep_out;
	wire	[4:0]		mac2_rep_in;
	wire	[4:0]		mac2_rep_out;
	wire	[4:0]		mac3_rep_in;
	wire	[4:0]		mac3_rep_out;
	wire	[4:0]		mac4_rep_in;
	wire	[7:4]		arb_grant_r_a_rep;
	wire	[7:4]		arb_q0_holdbar_r_a_rep;
	wire	[7:4]		arb_qsel0_r_a_rep;
	wire	[7:4]		arb_qsel1_r_a_rep;
	wire	[7:4]		arb_shift_r_a_rep;
	wire	[4:0]		mac4_rep_out;
	wire	[4:0]		mac5_rep_in;
	wire	[4:0]		mac5_rep_out;
	wire	[4:0]		mac6_rep_in;
	wire	[4:0]		mac6_rep_out;
	wire			scan_rep_in;
	wire			tcu_scan_en_out_0_unused;
	wire			tcu_pce_ov_out_0_unused;
	wire			ccx_aclk_out_0_unused;
	wire			ccx_bclk_out_0_unused;
	wire	[129:0]		col1_data_x_;
	wire			pcx_mac0_scanin;
	wire			pcx_mac0_scanout;
	wire	[6:1]		tcu_scan_en_out;
	wire	[6:1]		tcu_pce_ov_out;
	wire	[6:1]		ccx_aclk_out;
	wire	[6:1]		ccx_bclk_out;
	wire	[129:0]		col2_data_x_;
	wire			pcx_mac1_scanin;
	wire			pcx_mac1_scanout;
	wire	[129:0]		col3_data_x_;
	wire			pcx_mac2_scanin;
	wire			pcx_mac2_scanout;
	wire	[129:0]		col4_data_x_;
	wire			pcx_mac3_scanin;
	wire			pcx_mac3_scanout;
	wire	[129:0]		col5_data_x_;
	wire			pcx_mac4_scanin;
	wire			pcx_mac4_scanout;
	wire	[129:0]		col6_data_x_;
	wire			pcx_mac5_scanin;
	wire			pcx_mac5_scanout;
	wire	[129:0]		col7_data_x_;
	wire			pcx_mac6_scanin;
	wire			pcx_mac6_scanout;
	wire			tcu_scan_en_out_7_unused;
	wire			tcu_pce_ov_out_7_unused;
	wire			ccx_aclk_out_7_unused;
	wire			ccx_bclk_out_7_unused;
	wire			pcx_mac7_scanin;
	wire			pcx_mac7_scanout;
	wire	[7:4]		arb_grant_l_a_unused;
	wire	[7:4]		arb_q0_holdbar_l_a_unused;
	wire	[7:4]		arb_qsel0_l_a_unused;
	wire	[7:4]		arb_qsel1_l_a_unused;
	wire	[7:4]		arb_shift_l_a_unused;
	wire	[3:0]		arb_grant_r_a_unused;
	wire	[3:0]		arb_q0_holdbar_r_a_unused;
	wire	[3:0]		arb_qsel0_r_a_unused;
	wire	[3:0]		arb_qsel1_r_a_unused;
	wire	[3:0]		arb_shift_r_a_unused;
	wire			scan_rep_out;

	assign all_ones[129:0] = 130'h3ffffffffffffffffffffffffffffffff;
	assign mac0_rep_in[4:0] = {arb_grant_l_a[0], arb_qsel0_l_a[0], 
		arb_qsel1_l_a[0], arb_shift_l_a[0], arb_q0_holdbar_l_a[0]};
	assign {arb_grant_l_a_rep[0], arb_qsel0_l_a_rep[0], 
		arb_qsel1_l_a_rep[0], arb_shift_l_a_rep[0], 
		arb_q0_holdbar_l_a_rep[0]} = mac0_rep_out[4:0];
	assign mac1_rep_in[4:0] = {arb_grant_l_a[2], arb_q0_holdbar_l_a[2], 
		arb_qsel0_l_a[2], arb_qsel1_l_a[2], arb_shift_l_a[2]};
	assign {arb_grant_l_a_rep[2], arb_q0_holdbar_l_a_rep[2], 
		arb_qsel0_l_a_rep[2], arb_qsel1_l_a_rep[2], arb_shift_l_a_rep[2]
		} = mac1_rep_out[4:0];
	assign mac2_rep_in[4:0] = {arb_grant_l_a[1], arb_q0_holdbar_l_a[1], 
		arb_qsel0_l_a[1], arb_qsel1_l_a[1], arb_shift_l_a[1]};
	assign {arb_grant_l_a_rep[1], arb_q0_holdbar_l_a_rep[1], 
		arb_qsel0_l_a_rep[1], arb_qsel1_l_a_rep[1], arb_shift_l_a_rep[1]
		} = mac2_rep_out[4:0];
	assign mac3_rep_in[4:0] = {arb_grant_l_a[3], arb_q0_holdbar_l_a[3], 
		arb_qsel0_l_a[3], arb_qsel1_l_a[3], arb_shift_l_a[3]};
	assign {arb_grant_l_a_rep[3], arb_q0_holdbar_l_a_rep[3], 
		arb_qsel0_l_a_rep[3], arb_qsel1_l_a_rep[3], arb_shift_l_a_rep[3]
		} = mac3_rep_out[4:0];
	assign mac4_rep_in[4:0] = {arb_grant_r_a[5], arb_q0_holdbar_r_a[5], 
		arb_qsel0_r_a[5], arb_qsel1_r_a[5], arb_shift_r_a[5]};
	assign {arb_grant_r_a_rep[5], arb_q0_holdbar_r_a_rep[5], 
		arb_qsel0_r_a_rep[5], arb_qsel1_r_a_rep[5], arb_shift_r_a_rep[5]
		} = mac4_rep_out[4:0];
	assign mac5_rep_in[4:0] = {arb_grant_r_a[7], arb_q0_holdbar_r_a[7], 
		arb_qsel0_r_a[7], arb_qsel1_r_a[7], arb_shift_r_a[7]};
	assign {arb_grant_r_a_rep[7], arb_q0_holdbar_r_a_rep[7], 
		arb_qsel0_r_a_rep[7], arb_qsel1_r_a_rep[7], arb_shift_r_a_rep[7]
		} = mac5_rep_out[4:0];
	assign mac6_rep_in[4:0] = {arb_grant_r_a[4], arb_q0_holdbar_r_a[4], 
		arb_qsel0_r_a[4], arb_qsel1_r_a[4], arb_shift_r_a[4]};
	assign {arb_grant_r_a_rep[4], arb_q0_holdbar_r_a_rep[4], 
		arb_qsel0_r_a_rep[4], arb_qsel1_r_a_rep[4], arb_shift_r_a_rep[4]
		} = mac6_rep_out[4:0];
	assign scan_rep_in = scan_in;
	assign arb_grant_l_a_unused[7:4] = arb_grant_l_a[7:4];
	assign arb_q0_holdbar_l_a_unused[7:4] = arb_q0_holdbar_l_a[7:4];
	assign arb_qsel0_l_a_unused[7:4] = arb_qsel0_l_a[7:4];
	assign arb_qsel1_l_a_unused[7:4] = arb_qsel1_l_a[7:4];
	assign arb_shift_l_a_unused[7:4] = arb_shift_l_a[7:4];
	assign arb_grant_r_a_unused[3:0] = arb_grant_r_a[3:0];
	assign arb_q0_holdbar_r_a_unused[3:0] = arb_q0_holdbar_r_a[3:0];
	assign arb_qsel0_r_a_unused[3:0] = arb_qsel0_r_a[3:0];
	assign arb_qsel1_r_a_unused[3:0] = arb_qsel1_r_a[3:0];
	assign arb_shift_r_a_unused[3:0] = arb_shift_r_a[3:0];
	assign pcx_mac0_scanin = scan_rep_out;
	assign pcx_mac1_scanin = pcx_mac0_scanout;
	assign pcx_mac2_scanin = pcx_mac1_scanout;
	assign pcx_mac3_scanin = pcx_mac2_scanout;
	assign pcx_mac4_scanin = pcx_mac3_scanout;
	assign pcx_mac5_scanin = pcx_mac4_scanout;
	assign pcx_mac6_scanin = pcx_mac5_scanout;
	assign pcx_mac7_scanin = pcx_mac6_scanout;
	assign scan_out = pcx_mac7_scanout;

	pcx_rep_dp pcx_rep(
		.mac0_rep_out			(mac0_rep_out[4:0]), 
		.mac1_rep_out			(mac1_rep_out[4:0]), 
		.mac2_rep_out			(mac2_rep_out[4:0]), 
		.mac3_rep_out			(mac3_rep_out[4:0]), 
		.mac4_rep_out			(mac4_rep_out[4:0]), 
		.mac5_rep_out			(mac5_rep_out[4:0]), 
		.mac6_rep_out			(mac6_rep_out[4:0]), 
		.scan_rep_out			(scan_rep_out), 
		.mac0_rep_in			(mac0_rep_in[4:0]), 
		.mac1_rep_in			(mac1_rep_in[4:0]), 
		.mac2_rep_in			(mac2_rep_in[4:0]), 
		.mac3_rep_in			(mac3_rep_in[4:0]), 
		.mac4_rep_in			(mac4_rep_in[4:0]), 
		.mac5_rep_in			(mac5_rep_in[4:0]), 
		.mac6_rep_in			(mac6_rep_in[4:0]), 
		.scan_rep_in			(scan_rep_in));
	pcx_mcl_dp pcx_mac0(
		.data_out_x_			(pcx_scache_data_x_[129:0]), 
		.tcu_scan_en_out		(tcu_scan_en_out_0_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_out_0_unused), 
		.ccx_aclk_out			(ccx_aclk_out_0_unused), 
		.ccx_bclk_out			(ccx_bclk_out_0_unused), 
		.arb_grant_a			(arb_grant_l_a_rep[0]), 
		.arb_qsel0_a			(arb_qsel0_l_a_rep[0]), 
		.arb_qsel1_a			(arb_qsel1_l_a_rep[0]), 
		.arb_q0_holdbar_a		(arb_q0_holdbar_l_a_rep[0]), 
		.arb_shift_a			(arb_shift_l_a_rep[0]), 
		.src_pcx_data_a			(spc0_pcx_data_a[129:0]), 
		.data_crit_x_			(col1_data_x_[129:0]), 
		.data_ncrit_x_			(all_ones[129:0]), 
		.scan_in			(pcx_mac0_scanin), 
		.scan_out			(pcx_mac0_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_out[1]), 
		.tcu_pce_ov			(tcu_pce_ov_out[1]), 
		.ccx_aclk			(ccx_aclk_out[1]), 
		.ccx_bclk			(ccx_bclk_out[1]));
	pcx_mbr_dp pcx_mac1(
		.data_out_x_			(col1_data_x_[129:0]), 
		.tcu_scan_en_out		(tcu_scan_en_out[1]), 
		.tcu_pce_ov_out			(tcu_pce_ov_out[1]), 
		.ccx_aclk_out			(ccx_aclk_out[1]), 
		.ccx_bclk_out			(ccx_bclk_out[1]), 
		.arb_grant_a			(arb_grant_l_a_rep[2]), 
		.arb_qsel0_a			(arb_qsel0_l_a_rep[2]), 
		.arb_qsel1_a			(arb_qsel1_l_a_rep[2]), 
		.arb_q0_holdbar_a		(arb_q0_holdbar_l_a_rep[2]), 
		.arb_shift_a			(arb_shift_l_a_rep[2]), 
		.src_pcx_data_a			(spc2_pcx_data_a[129:0]), 
		.data_prev_x_			(col2_data_x_[129:0]), 
		.scan_in			(pcx_mac1_scanin), 
		.scan_out			(pcx_mac1_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_out[2]), 
		.tcu_pce_ov			(tcu_pce_ov_out[2]), 
		.ccx_aclk			(ccx_aclk_out[2]), 
		.ccx_bclk			(ccx_bclk_out[2]));
	pcx_mbr_dp pcx_mac2(
		.data_out_x_			(col2_data_x_[129:0]), 
		.tcu_scan_en_out		(tcu_scan_en_out[2]), 
		.tcu_pce_ov_out			(tcu_pce_ov_out[2]), 
		.ccx_aclk_out			(ccx_aclk_out[2]), 
		.ccx_bclk_out			(ccx_bclk_out[2]), 
		.arb_grant_a			(arb_grant_l_a_rep[1]), 
		.arb_qsel0_a			(arb_qsel0_l_a_rep[1]), 
		.arb_qsel1_a			(arb_qsel1_l_a_rep[1]), 
		.arb_q0_holdbar_a		(arb_q0_holdbar_l_a_rep[1]), 
		.arb_shift_a			(arb_shift_l_a_rep[1]), 
		.src_pcx_data_a			(spc1_pcx_data_a[129:0]), 
		.data_prev_x_			(col3_data_x_[129:0]), 
		.scan_in			(pcx_mac2_scanin), 
		.scan_out			(pcx_mac2_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_out[3]), 
		.tcu_pce_ov			(tcu_pce_ov_out[3]), 
		.ccx_aclk			(ccx_aclk_out[3]), 
		.ccx_bclk			(ccx_bclk_out[3]));
	pcx_mbr_dp pcx_mac3(
		.data_out_x_			(col3_data_x_[129:0]), 
		.tcu_scan_en_out		(tcu_scan_en_out[3]), 
		.tcu_pce_ov_out			(tcu_pce_ov_out[3]), 
		.ccx_aclk_out			(ccx_aclk_out[3]), 
		.ccx_bclk_out			(ccx_bclk_out[3]), 
		.arb_grant_a			(arb_grant_l_a_rep[3]), 
		.arb_qsel0_a			(arb_qsel0_l_a_rep[3]), 
		.arb_qsel1_a			(arb_qsel1_l_a_rep[3]), 
		.arb_q0_holdbar_a		(arb_q0_holdbar_l_a_rep[3]), 
		.arb_shift_a			(arb_shift_l_a_rep[3]), 
		.src_pcx_data_a			(spc3_pcx_data_a[129:0]), 
		.data_prev_x_			(col4_data_x_[129:0]), 
		.scan_in			(pcx_mac3_scanin), 
		.scan_out			(pcx_mac3_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en), 
		.tcu_pce_ov			(tcu_pce_ov), 
		.ccx_aclk			(ccx_aclk), 
		.ccx_bclk			(ccx_bclk));
	pcx_mbr_dp pcx_mac4(
		.data_out_x_			(col4_data_x_[129:0]), 
		.tcu_scan_en_out		(tcu_scan_en_out[4]), 
		.tcu_pce_ov_out			(tcu_pce_ov_out[4]), 
		.ccx_aclk_out			(ccx_aclk_out[4]), 
		.ccx_bclk_out			(ccx_bclk_out[4]), 
		.arb_grant_a			(arb_grant_r_a_rep[5]), 
		.arb_qsel0_a			(arb_qsel0_r_a_rep[5]), 
		.arb_qsel1_a			(arb_qsel1_r_a_rep[5]), 
		.arb_q0_holdbar_a		(arb_q0_holdbar_r_a_rep[5]), 
		.arb_shift_a			(arb_shift_r_a_rep[5]), 
		.src_pcx_data_a			(spc5_pcx_data_a[129:0]), 
		.data_prev_x_			(col5_data_x_[129:0]), 
		.scan_in			(pcx_mac4_scanin), 
		.scan_out			(pcx_mac4_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_out[3]), 
		.tcu_pce_ov			(tcu_pce_ov_out[3]), 
		.ccx_aclk			(ccx_aclk_out[3]), 
		.ccx_bclk			(ccx_bclk_out[3]));
	pcx_mbr_dp pcx_mac5(
		.data_out_x_			(col5_data_x_[129:0]), 
		.tcu_scan_en_out		(tcu_scan_en_out[5]), 
		.tcu_pce_ov_out			(tcu_pce_ov_out[5]), 
		.ccx_aclk_out			(ccx_aclk_out[5]), 
		.ccx_bclk_out			(ccx_bclk_out[5]), 
		.arb_grant_a			(arb_grant_r_a_rep[7]), 
		.arb_qsel0_a			(arb_qsel0_r_a_rep[7]), 
		.arb_qsel1_a			(arb_qsel1_r_a_rep[7]), 
		.arb_q0_holdbar_a		(arb_q0_holdbar_r_a_rep[7]), 
		.arb_shift_a			(arb_shift_r_a_rep[7]), 
		.src_pcx_data_a			(spc7_pcx_data_a[129:0]), 
		.data_prev_x_			(col6_data_x_[129:0]), 
		.scan_in			(pcx_mac5_scanin), 
		.scan_out			(pcx_mac5_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_out[4]), 
		.tcu_pce_ov			(tcu_pce_ov_out[4]), 
		.ccx_aclk			(ccx_aclk_out[4]), 
		.ccx_bclk			(ccx_bclk_out[4]));
	pcx_mbr_dp pcx_mac6(
		.data_out_x_			(col6_data_x_[129:0]), 
		.tcu_scan_en_out		(tcu_scan_en_out[6]), 
		.tcu_pce_ov_out			(tcu_pce_ov_out[6]), 
		.ccx_aclk_out			(ccx_aclk_out[6]), 
		.ccx_bclk_out			(ccx_bclk_out[6]), 
		.arb_grant_a			(arb_grant_r_a_rep[4]), 
		.arb_qsel0_a			(arb_qsel0_r_a_rep[4]), 
		.arb_qsel1_a			(arb_qsel1_r_a_rep[4]), 
		.arb_q0_holdbar_a		(arb_q0_holdbar_r_a_rep[4]), 
		.arb_shift_a			(arb_shift_r_a_rep[4]), 
		.src_pcx_data_a			(spc4_pcx_data_a[129:0]), 
		.data_prev_x_			(col7_data_x_[129:0]), 
		.scan_in			(pcx_mac6_scanin), 
		.scan_out			(pcx_mac6_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_out[5]), 
		.tcu_pce_ov			(tcu_pce_ov_out[5]), 
		.ccx_aclk			(ccx_aclk_out[5]), 
		.ccx_bclk			(ccx_bclk_out[5]));
	pcx_mar_dp pcx_mac7(
		.data_out_x_			(col7_data_x_[129:0]), 
		.tcu_scan_en_out		(tcu_scan_en_out_7_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_out_7_unused), 
		.ccx_aclk_out			(ccx_aclk_out_7_unused), 
		.ccx_bclk_out			(ccx_bclk_out_7_unused), 
		.arb_grant_a			(arb_grant_r_a[6]), 
		.arb_qsel0_a			(arb_qsel0_r_a[6]), 
		.arb_qsel1_a			(arb_qsel1_r_a[6]), 
		.arb_q0_holdbar_a		(arb_q0_holdbar_r_a[6]), 
		.arb_shift_a			(arb_shift_r_a[6]), 
		.src_pcx_data_a			(spc6_pcx_data_a[129:0]), 
		.scan_in			(pcx_mac7_scanin), 
		.scan_out			(pcx_mac7_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_out[6]), 
		.tcu_pce_ov			(tcu_pce_ov_out[6]), 
		.ccx_aclk			(ccx_aclk_out[6]), 
		.ccx_bclk			(ccx_bclk_out[6]));
endmodule



`endif // `ifdef FPGA

