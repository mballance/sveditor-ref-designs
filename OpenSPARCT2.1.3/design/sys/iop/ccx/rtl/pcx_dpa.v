// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcx_dpa.v
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
module pcx_dpa (
  pcx_io_data_x_, 
  pcx_scache0_data_x_, 
  pcx_scache1_data_x_, 
  pcx_scache2_data_x_, 
  pcx_scache3_data_x_, 
  pcx_scache4_data_x_, 
  pcx_scache5_data_x_, 
  pcx_scache6_data_x_, 
  pcx_scache7_data_x_, 
  arb0_grant_l_a, 
  arb0_q0_holdbar_l_a, 
  arb0_qsel0_l_a, 
  arb0_qsel1_l_a, 
  arb0_shift_l_a, 
  arb1_grant_l_a, 
  arb1_q0_holdbar_l_a, 
  arb1_qsel0_l_a, 
  arb1_qsel1_l_a, 
  arb1_shift_l_a, 
  arb2_grant_l_a, 
  arb2_q0_holdbar_l_a, 
  arb2_qsel0_l_a, 
  arb2_qsel1_l_a, 
  arb2_shift_l_a, 
  arb3_grant_l_a, 
  arb3_q0_holdbar_l_a, 
  arb3_qsel0_l_a, 
  arb3_qsel1_l_a, 
  arb3_shift_l_a, 
  arb4_grant_l_a, 
  arb4_q0_holdbar_l_a, 
  arb4_qsel0_l_a, 
  arb4_qsel1_l_a, 
  arb4_shift_l_a, 
  arb5_grant_l_a, 
  arb5_q0_holdbar_l_a, 
  arb5_qsel0_l_a, 
  arb5_qsel1_l_a, 
  arb5_shift_l_a, 
  arb6_grant_l_a, 
  arb6_q0_holdbar_l_a, 
  arb6_qsel0_l_a, 
  arb6_qsel1_l_a, 
  arb6_shift_l_a, 
  arb7_grant_l_a, 
  arb7_q0_holdbar_l_a, 
  arb7_qsel0_l_a, 
  arb7_qsel1_l_a, 
  arb7_shift_l_a, 
  arb8_grant_l_a, 
  arb8_q0_holdbar_l_a, 
  arb8_qsel0_l_a, 
  arb8_qsel1_l_a, 
  arb8_shift_l_a, 
  arb0_grant_r_a, 
  arb0_q0_holdbar_r_a, 
  arb0_qsel0_r_a, 
  arb0_qsel1_r_a, 
  arb0_shift_r_a, 
  arb1_grant_r_a, 
  arb1_q0_holdbar_r_a, 
  arb1_qsel0_r_a, 
  arb1_qsel1_r_a, 
  arb1_shift_r_a, 
  arb2_grant_r_a, 
  arb2_q0_holdbar_r_a, 
  arb2_qsel0_r_a, 
  arb2_qsel1_r_a, 
  arb2_shift_r_a, 
  arb3_grant_r_a, 
  arb3_q0_holdbar_r_a, 
  arb3_qsel0_r_a, 
  arb3_qsel1_r_a, 
  arb3_shift_r_a, 
  arb4_grant_r_a, 
  arb4_q0_holdbar_r_a, 
  arb4_qsel0_r_a, 
  arb4_qsel1_r_a, 
  arb4_shift_r_a, 
  arb5_grant_r_a, 
  arb5_q0_holdbar_r_a, 
  arb5_qsel0_r_a, 
  arb5_qsel1_r_a, 
  arb5_shift_r_a, 
  arb6_grant_r_a, 
  arb6_q0_holdbar_r_a, 
  arb6_qsel0_r_a, 
  arb6_qsel1_r_a, 
  arb6_shift_r_a, 
  arb7_grant_r_a, 
  arb7_q0_holdbar_r_a, 
  arb7_qsel0_r_a, 
  arb7_qsel1_r_a, 
  arb7_shift_r_a, 
  arb8_grant_r_a, 
  arb8_q0_holdbar_r_a, 
  arb8_qsel0_r_a, 
  arb8_qsel1_r_a, 
  arb8_shift_r_a, 
  spc0_pcx_data_a, 
  spc1_pcx_data_a, 
  spc2_pcx_data_a, 
  spc3_pcx_data_a, 
  spc4_pcx_data_a, 
  spc5_pcx_data_a, 
  spc6_pcx_data_a, 
  spc7_pcx_data_a, 
  l2clk, 
  scan_in, 
  tcu_pce_ov_t, 
  tcu_scan_en_t, 
  ccx_aclk_t, 
  ccx_bclk_t, 
  tcu_pce_ov_b, 
  tcu_scan_en_b, 
  ccx_aclk_b, 
  ccx_bclk_b, 
  scan_out);
wire pcx_dps0_scanin;
wire pcx_dps0_scanout;
wire pcx_dps1_scanin;
wire pcx_dps1_scanout;
wire pcx_dps2_scanin;
wire pcx_dps2_scanout;
wire pcx_dps3_scanin;
wire pcx_dps3_scanout;
wire pcx_dps4_scanin;
wire pcx_dps4_scanout;
wire pcx_dps5_scanin;
wire pcx_dps5_scanout;
wire pcx_dps6_scanin;
wire pcx_dps6_scanout;
wire pcx_dps7_scanin;
wire pcx_dps7_scanout;
wire pcx_dps8_scanin;
wire pcx_dps8_scanout;



// Beginning of automatic outputs (from unused autoinst outputs)
output [129:0]          pcx_io_data_x_;         // From pcx_dp8 of pcx_dp.v
output [129:0]          pcx_scache0_data_x_;    // From pcx_dp0 of pcx_dp.v
output [129:0]          pcx_scache1_data_x_;    // From pcx_dp1 of pcx_dp.v
output [129:0]          pcx_scache2_data_x_;    // From pcx_dp2 of pcx_dp.v
output [129:0]          pcx_scache3_data_x_;    // From pcx_dp3 of pcx_dp.v
output [129:0]          pcx_scache4_data_x_;    // From pcx_dp4 of pcx_dp.v
output [129:0]          pcx_scache5_data_x_;    // From pcx_dp5 of pcx_dp.v
output [129:0]          pcx_scache6_data_x_;    // From pcx_dp6 of pcx_dp.v
output [129:0]          pcx_scache7_data_x_;    // From pcx_dp7 of pcx_dp.v
// End of automatics


// Beginning of automatic inputs (from unused autoinst inputs)
input [7:0]             arb0_grant_l_a;           // To pcx_dp0 of pcx_dp.v
input [7:0]             arb0_q0_holdbar_l_a;         // To pcx_dp0 of pcx_dp.v
input [7:0]             arb0_qsel0_l_a;           // To pcx_dp0 of pcx_dp.v
input [7:0]             arb0_qsel1_l_a;           // To pcx_dp0 of pcx_dp.v
input [7:0]             arb0_shift_l_a;           // To pcx_dp0 of pcx_dp.v
input [7:0]             arb1_grant_l_a;           // To pcx_dp1 of pcx_dp.v
input [7:0]             arb1_q0_holdbar_l_a;         // To pcx_dp1 of pcx_dp.v
input [7:0]             arb1_qsel0_l_a;           // To pcx_dp1 of pcx_dp.v
input [7:0]             arb1_qsel1_l_a;           // To pcx_dp1 of pcx_dp.v
input [7:0]             arb1_shift_l_a;           // To pcx_dp1 of pcx_dp.v
input [7:0]             arb2_grant_l_a;           // To pcx_dp2 of pcx_dp.v
input [7:0]             arb2_q0_holdbar_l_a;         // To pcx_dp2 of pcx_dp.v
input [7:0]             arb2_qsel0_l_a;           // To pcx_dp2 of pcx_dp.v
input [7:0]             arb2_qsel1_l_a;           // To pcx_dp2 of pcx_dp.v
input [7:0]             arb2_shift_l_a;           // To pcx_dp2 of pcx_dp.v
input [7:0]             arb3_grant_l_a;           // To pcx_dp3 of pcx_dp.v
input [7:0]             arb3_q0_holdbar_l_a;         // To pcx_dp3 of pcx_dp.v
input [7:0]             arb3_qsel0_l_a;           // To pcx_dp3 of pcx_dp.v
input [7:0]             arb3_qsel1_l_a;           // To pcx_dp3 of pcx_dp.v
input [7:0]             arb3_shift_l_a;           // To pcx_dp3 of pcx_dp.v
input [7:0]             arb4_grant_l_a;           // To pcx_dp4 of pcx_dp.v
input [7:0]             arb4_q0_holdbar_l_a;         // To pcx_dp4 of pcx_dp.v
input [7:0]             arb4_qsel0_l_a;           // To pcx_dp4 of pcx_dp.v
input [7:0]             arb4_qsel1_l_a;           // To pcx_dp4 of pcx_dp.v
input [7:0]             arb4_shift_l_a;           // To pcx_dp4 of pcx_dp.v
input [7:0]             arb5_grant_l_a;           // To pcx_dp5 of pcx_dp.v
input [7:0]             arb5_q0_holdbar_l_a;         // To pcx_dp5 of pcx_dp.v
input [7:0]             arb5_qsel0_l_a;           // To pcx_dp5 of pcx_dp.v
input [7:0]             arb5_qsel1_l_a;           // To pcx_dp5 of pcx_dp.v
input [7:0]             arb5_shift_l_a;           // To pcx_dp5 of pcx_dp.v
input [7:0]             arb6_grant_l_a;           // To pcx_dp6 of pcx_dp.v
input [7:0]             arb6_q0_holdbar_l_a;         // To pcx_dp6 of pcx_dp.v
input [7:0]             arb6_qsel0_l_a;           // To pcx_dp6 of pcx_dp.v
input [7:0]             arb6_qsel1_l_a;           // To pcx_dp6 of pcx_dp.v
input [7:0]             arb6_shift_l_a;           // To pcx_dp6 of pcx_dp.v
input [7:0]             arb7_grant_l_a;           // To pcx_dp7 of pcx_dp.v
input [7:0]             arb7_q0_holdbar_l_a;         // To pcx_dp7 of pcx_dp.v
input [7:0]             arb7_qsel0_l_a;           // To pcx_dp7 of pcx_dp.v
input [7:0]             arb7_qsel1_l_a;           // To pcx_dp7 of pcx_dp.v
input [7:0]             arb7_shift_l_a;           // To pcx_dp7 of pcx_dp.v
input [7:0]             arb8_grant_l_a;           // To pcx_dp8 of pcx_dp.v
input [7:0]             arb8_q0_holdbar_l_a;         // To pcx_dp8 of pcx_dp.v
input [7:0]             arb8_qsel0_l_a;           // To pcx_dp8 of pcx_dp.v
input [7:0]             arb8_qsel1_l_a;           // To pcx_dp8 of pcx_dp.v
input [7:0]             arb8_shift_l_a;           // To pcx_dp8 of pcx_dp.v
input [7:0]             arb0_grant_r_a;           // To pcx_dp0 of pcx_dp.v
input [7:0]             arb0_q0_holdbar_r_a;         // To pcx_dp0 of pcx_dp.v
input [7:0]             arb0_qsel0_r_a;           // To pcx_dp0 of pcx_dp.v
input [7:0]             arb0_qsel1_r_a;           // To pcx_dp0 of pcx_dp.v
input [7:0]             arb0_shift_r_a;           // To pcx_dp0 of pcx_dp.v
input [7:0]             arb1_grant_r_a;           // To pcx_dp1 of pcx_dp.v
input [7:0]             arb1_q0_holdbar_r_a;         // To pcx_dp1 of pcx_dp.v
input [7:0]             arb1_qsel0_r_a;           // To pcx_dp1 of pcx_dp.v
input [7:0]             arb1_qsel1_r_a;           // To pcx_dp1 of pcx_dp.v
input [7:0]             arb1_shift_r_a;           // To pcx_dp1 of pcx_dp.v
input [7:0]             arb2_grant_r_a;           // To pcx_dp2 of pcx_dp.v
input [7:0]             arb2_q0_holdbar_r_a;         // To pcx_dp2 of pcx_dp.v
input [7:0]             arb2_qsel0_r_a;           // To pcx_dp2 of pcx_dp.v
input [7:0]             arb2_qsel1_r_a;           // To pcx_dp2 of pcx_dp.v
input [7:0]             arb2_shift_r_a;           // To pcx_dp2 of pcx_dp.v
input [7:0]             arb3_grant_r_a;           // To pcx_dp3 of pcx_dp.v
input [7:0]             arb3_q0_holdbar_r_a;         // To pcx_dp3 of pcx_dp.v
input [7:0]             arb3_qsel0_r_a;           // To pcx_dp3 of pcx_dp.v
input [7:0]             arb3_qsel1_r_a;           // To pcx_dp3 of pcx_dp.v
input [7:0]             arb3_shift_r_a;           // To pcx_dp3 of pcx_dp.v
input [7:0]             arb4_grant_r_a;           // To pcx_dp4 of pcx_dp.v
input [7:0]             arb4_q0_holdbar_r_a;         // To pcx_dp4 of pcx_dp.v
input [7:0]             arb4_qsel0_r_a;           // To pcx_dp4 of pcx_dp.v
input [7:0]             arb4_qsel1_r_a;           // To pcx_dp4 of pcx_dp.v
input [7:0]             arb4_shift_r_a;           // To pcx_dp4 of pcx_dp.v
input [7:0]             arb5_grant_r_a;           // To pcx_dp5 of pcx_dp.v
input [7:0]             arb5_q0_holdbar_r_a;         // To pcx_dp5 of pcx_dp.v
input [7:0]             arb5_qsel0_r_a;           // To pcx_dp5 of pcx_dp.v
input [7:0]             arb5_qsel1_r_a;           // To pcx_dp5 of pcx_dp.v
input [7:0]             arb5_shift_r_a;           // To pcx_dp5 of pcx_dp.v
input [7:0]             arb6_grant_r_a;           // To pcx_dp6 of pcx_dp.v
input [7:0]             arb6_q0_holdbar_r_a;         // To pcx_dp6 of pcx_dp.v
input [7:0]             arb6_qsel0_r_a;           // To pcx_dp6 of pcx_dp.v
input [7:0]             arb6_qsel1_r_a;           // To pcx_dp6 of pcx_dp.v
input [7:0]             arb6_shift_r_a;           // To pcx_dp6 of pcx_dp.v
input [7:0]             arb7_grant_r_a;           // To pcx_dp7 of pcx_dp.v
input [7:0]             arb7_q0_holdbar_r_a;         // To pcx_dp7 of pcx_dp.v
input [7:0]             arb7_qsel0_r_a;           // To pcx_dp7 of pcx_dp.v
input [7:0]             arb7_qsel1_r_a;           // To pcx_dp7 of pcx_dp.v
input [7:0]             arb7_shift_r_a;           // To pcx_dp7 of pcx_dp.v
input [7:0]             arb8_grant_r_a;           // To pcx_dp8 of pcx_dp.v
input [7:0]             arb8_q0_holdbar_r_a;         // To pcx_dp8 of pcx_dp.v
input [7:0]             arb8_qsel0_r_a;           // To pcx_dp8 of pcx_dp.v
input [7:0]             arb8_qsel1_r_a;           // To pcx_dp8 of pcx_dp.v
input [7:0]             arb8_shift_r_a;           // To pcx_dp8 of pcx_dp.v
input [129:0]           spc0_pcx_data_a;        // To pcx_dp0 of pcx_dp.v, ...
input [129:0]           spc1_pcx_data_a;        // To pcx_dp0 of pcx_dp.v, ...
input [129:0]           spc2_pcx_data_a;        // To pcx_dp0 of pcx_dp.v, ...
input [129:0]           spc3_pcx_data_a;        // To pcx_dp0 of pcx_dp.v, ...
input [129:0]           spc4_pcx_data_a;        // To pcx_dp0 of pcx_dp.v, ...
input [129:0]           spc5_pcx_data_a;        // To pcx_dp0 of pcx_dp.v, ...
input [129:0]           spc6_pcx_data_a;        // To pcx_dp0 of pcx_dp.v, ...
input [129:0]           spc7_pcx_data_a;        // To pcx_dp0 of pcx_dp.v, ...
// End of automatics

// globals
input           l2clk;
input           scan_in;
input           tcu_pce_ov_t;             // scan signals
input           tcu_scan_en_t ;
input           ccx_aclk_t;
input           ccx_bclk_t;
input           tcu_pce_ov_b;             // scan signals
input           tcu_scan_en_b ;
input           ccx_aclk_b;
input           ccx_bclk_b;
output          scan_out;

// slices are placed in the following order
//
//@pcx_dps0(pcx_dpsa)
//@pcx_dps4(pcx_dpsg)
//@pcx_dps8(pcx_dpsa)
//@pcx_dps1(pcx_dpsc)
//@pcx_dps5(pcx_dpse)
//
//@pcx_dps3(pcx_dpsd)
//@pcx_dps7(pcx_dpsf)
//@pcx_dps2(pcx_dpsb)
//@pcx_dps6(pcx_dpsh)


//
// pcx_dps AUTO_TEMPLATE (
// .pcx_scache_data_x_ (pcx_scache@_data_x_[129:0]),
// .arb_grant_l_a  (arb@_grant_l_a[7:0]),
// .arb_q0_holdbar_l_a(arb@_q0_holdbar_l_a[7:0]),
// .arb_qsel0_l_a  (arb@_qsel0_l_a[7:0]),
// .arb_qsel1_l_a  (arb@_qsel1_l_a[7:0]),
// .arb_shift_l_a  (arb@_shift_l_a[7:0]),
// .arb_grant_r_a  (arb@_grant_r_a[7:0]),
// .arb_q0_holdbar_r_a(arb@_q0_holdbar_r_a[7:0]),
// .arb_qsel0_r_a  (arb@_qsel0_r_a[7:0]),
// .arb_qsel1_r_a  (arb@_qsel1_r_a[7:0]),
// .arb_shift_r_a  (arb@_shift_r_a[7:0]),
// );



//   sparc0 sparc2 sparc1 sparc3  sparc5  sparc7  sparc4  sparc6
//     |      |      |      |       |       |        |      |
//     v      v      v      v       v       v        v      v
//   mac0 -> mac1 ->mac2 ->mac3 <- mac4 <- mac5 <- mac6 <- mac7 
//    cl     br     br     br      br      br       br     ar
//     |
//      ---buf--
//              |
//              v
//           to sctag0 


// fixscan does not support "scan_in ());" syntax on last line of instantiation.
// For now, when making changes, turn on AUTOINST, C-x C-a,  turn off AUTOINST, fix last line,
// run fixscan.

pcx_dpsa pcx_dps0(
                  // /*AUTOINST*/
                  // Outputs
                  .pcx_scache_data_x_      (pcx_scache0_data_x_[129:0]),
                  // Inputs
                  .arb_grant_l_a             (arb0_grant_l_a[7:0]),
                  .arb_q0_holdbar_l_a        (arb0_q0_holdbar_l_a[7:0]),
                  .arb_qsel0_l_a             (arb0_qsel0_l_a[7:0]),
                  .arb_qsel1_l_a             (arb0_qsel1_l_a[7:0]),
                  .arb_shift_l_a             (arb0_shift_l_a[7:0]),
                  .arb_grant_r_a             (arb0_grant_r_a[7:0]),
                  .arb_q0_holdbar_r_a        (arb0_q0_holdbar_r_a[7:0]),
                  .arb_qsel0_r_a             (arb0_qsel0_r_a[7:0]),
                  .arb_qsel1_r_a             (arb0_qsel1_r_a[7:0]),
                  .arb_shift_r_a             (arb0_shift_r_a[7:0]),
                  .spc0_pcx_data_a         (spc0_pcx_data_a[129:0]),
                  .spc1_pcx_data_a         (spc1_pcx_data_a[129:0]),
                  .spc2_pcx_data_a         (spc2_pcx_data_a[129:0]),
                  .spc3_pcx_data_a         (spc3_pcx_data_a[129:0]),
                  .spc4_pcx_data_a         (spc4_pcx_data_a[129:0]),
                  .spc5_pcx_data_a         (spc5_pcx_data_a[129:0]),
                  .spc6_pcx_data_a         (spc6_pcx_data_a[129:0]),
                  .spc7_pcx_data_a         (spc7_pcx_data_a[129:0]),
                  .scan_in (pcx_dps0_scanin),
                  .scan_out (pcx_dps0_scanout),
                  .l2clk                   (l2clk),
                  .ccx_aclk                (ccx_aclk_t),
                  .ccx_bclk                (ccx_bclk_t),
                  .tcu_scan_en             (tcu_scan_en_t),
                  .tcu_pce_ov              (tcu_pce_ov_t)
                  );


// DATAPATH ORGANISATION(pcx_dps1)
//
//
//   sparc0 sparc2 sparc1 sparc3  sparc7  sparc5  sparc6  sparc4
//     |      |      |      |       |       |        |      |
//     v      v      v      v       v       v        v      v
//   mac0 -> mac1 ->mac2 <-mac3 <- mac4 <- mac5 <- mac6 <- mac7 
//    al     bl     cl     br      br      br       br     ar
//                  |
//            --buf--
//            |
//            v
//         to sctag1

pcx_dpsc pcx_dps1(
                  // /*AUTOINST*/
                  // Outputs
                  .pcx_scache_data_x_      (pcx_scache1_data_x_[129:0]),
                  // Inputs
                  .arb_grant_l_a             (arb1_grant_l_a[7:0]),
                  .arb_q0_holdbar_l_a        (arb1_q0_holdbar_l_a[7:0]),
                  .arb_qsel0_l_a             (arb1_qsel0_l_a[7:0]),
                  .arb_qsel1_l_a             (arb1_qsel1_l_a[7:0]),
                  .arb_shift_l_a             (arb1_shift_l_a[7:0]),
                  .arb_grant_r_a             (arb1_grant_r_a[7:0]),
                  .arb_q0_holdbar_r_a        (arb1_q0_holdbar_r_a[7:0]),
                  .arb_qsel0_r_a             (arb1_qsel0_r_a[7:0]),
                  .arb_qsel1_r_a             (arb1_qsel1_r_a[7:0]),
                  .arb_shift_r_a             (arb1_shift_r_a[7:0]),
                  .spc0_pcx_data_a         (spc0_pcx_data_a[129:0]),
                  .spc1_pcx_data_a         (spc1_pcx_data_a[129:0]),
                  .spc2_pcx_data_a         (spc2_pcx_data_a[129:0]),
                  .spc3_pcx_data_a         (spc3_pcx_data_a[129:0]),
                  .spc4_pcx_data_a         (spc4_pcx_data_a[129:0]),
                  .spc5_pcx_data_a         (spc5_pcx_data_a[129:0]),
                  .spc6_pcx_data_a         (spc6_pcx_data_a[129:0]),
                  .spc7_pcx_data_a         (spc7_pcx_data_a[129:0]),
                  .scan_in(pcx_dps1_scanin),
                  .scan_out(pcx_dps1_scanout),
                  .l2clk                   (l2clk),
                  .ccx_aclk                (ccx_aclk_t),
                  .ccx_bclk                (ccx_bclk_t),
                  .tcu_scan_en             (tcu_scan_en_t),
                  .tcu_pce_ov              (tcu_pce_ov_t)
                  );

// DATAPATH ORGANISATION(pcx_dps2)
//
//   sparc0 sparc2 sparc1 sparc3  sparc7  sparc5  sparc6  sparc4
//     |      |      |      |       |       |        |      |
//     v      v      v      v       v       v        v      v
//   mac0 -> mac1 ->mac2 <-mac3 <- mac4 <- mac5 <- mac6 <- mac7 
//    bl     cl     br     br      br      br       br     ar
//           |
//           buf
//            |
//            v
//         to sctag

pcx_dpsb pcx_dps2(
 // /*AUTOINST*/
                  // Outputs
                  .pcx_scache_data_x_      (pcx_scache2_data_x_[129:0]),
                  // Inputs
                  .arb_grant_l_a             (arb2_grant_l_a[7:0]),
                  .arb_q0_holdbar_l_a        (arb2_q0_holdbar_l_a[7:0]),
                  .arb_qsel0_l_a             (arb2_qsel0_l_a[7:0]),
                  .arb_qsel1_l_a             (arb2_qsel1_l_a[7:0]),
                  .arb_shift_l_a             (arb2_shift_l_a[7:0]),
                  .arb_grant_r_a             (arb2_grant_r_a[7:0]),
                  .arb_q0_holdbar_r_a        (arb2_q0_holdbar_r_a[7:0]),
                  .arb_qsel0_r_a             (arb2_qsel0_r_a[7:0]),
                  .arb_qsel1_r_a             (arb2_qsel1_r_a[7:0]),
                  .arb_shift_r_a             (arb2_shift_r_a[7:0]),
                  .spc0_pcx_data_a         (spc0_pcx_data_a[129:0]),
                  .spc1_pcx_data_a         (spc1_pcx_data_a[129:0]),
                  .spc2_pcx_data_a         (spc2_pcx_data_a[129:0]),
                  .spc3_pcx_data_a         (spc3_pcx_data_a[129:0]),
                  .spc4_pcx_data_a         (spc4_pcx_data_a[129:0]),
                  .spc5_pcx_data_a         (spc5_pcx_data_a[129:0]),
                  .spc6_pcx_data_a         (spc6_pcx_data_a[129:0]),
                  .spc7_pcx_data_a         (spc7_pcx_data_a[129:0]),
                  .scan_in(pcx_dps2_scanin),
                  .scan_out(pcx_dps2_scanout),
                  .l2clk                   (l2clk),
                  .ccx_aclk                (ccx_aclk_b),
                  .ccx_bclk                (ccx_bclk_b),
                  .tcu_scan_en             (tcu_scan_en_b),
                  .tcu_pce_ov              (tcu_pce_ov_b)
                  );



// DATAPATH ORGANISATION(pcx_dps3)
//
//   sparc0 sparc2 sparc1 sparc3  sparc7  sparc5  sparc6  sparc4
//     |      |      |      |       |       |        |      |
//     v      v      v      v       v       v        v      v
//   mac0 -> mac1 ->mac2 <-mac3 <- mac4 <- mac5 <- mac6 <- mac7 
//    al     bl     bl     cl      br      br       br     ar
//                         |
//                  --buf--
//                  |
//                  v
//               to sctag

pcx_dpsd pcx_dps3(
                  // /*AUTOINST*/
                  // Outputs
                  .pcx_scache_data_x_      (pcx_scache3_data_x_[129:0]),
                  // Inputs
                  .arb_grant_l_a             (arb3_grant_l_a[7:0]),
                  .arb_q0_holdbar_l_a        (arb3_q0_holdbar_l_a[7:0]),
                  .arb_qsel0_l_a             (arb3_qsel0_l_a[7:0]),
                  .arb_qsel1_l_a             (arb3_qsel1_l_a[7:0]),
                  .arb_shift_l_a             (arb3_shift_l_a[7:0]),
                  .arb_grant_r_a             (arb3_grant_r_a[7:0]),
                  .arb_q0_holdbar_r_a        (arb3_q0_holdbar_r_a[7:0]),
                  .arb_qsel0_r_a             (arb3_qsel0_r_a[7:0]),
                  .arb_qsel1_r_a             (arb3_qsel1_r_a[7:0]),
                  .arb_shift_r_a             (arb3_shift_r_a[7:0]),
                  .spc0_pcx_data_a         (spc0_pcx_data_a[129:0]),
                  .spc1_pcx_data_a         (spc1_pcx_data_a[129:0]),
                  .spc2_pcx_data_a         (spc2_pcx_data_a[129:0]),
                  .spc3_pcx_data_a         (spc3_pcx_data_a[129:0]),
                  .spc4_pcx_data_a         (spc4_pcx_data_a[129:0]),
                  .spc5_pcx_data_a         (spc5_pcx_data_a[129:0]),
                  .spc6_pcx_data_a         (spc6_pcx_data_a[129:0]),
                  .spc7_pcx_data_a         (spc7_pcx_data_a[129:0]),
                  .scan_in(pcx_dps3_scanin),
                  .scan_out(pcx_dps3_scanout),
                  .l2clk                   (l2clk),
                  .ccx_aclk                (ccx_aclk_b),
                  .ccx_bclk                (ccx_bclk_b),
                  .tcu_scan_en             (tcu_scan_en_b),
                  .tcu_pce_ov              (tcu_pce_ov_b)
                  );




// DATAPATH ORGANISATION(pcx_dps4)
//
//   sparc0 sparc2 sparc1 sparc3  sparc5  sparc7  sparc4  sparc6
//     |      |      |      |       |       |        |      |
//     v      v      v      v       v       v        v      v
//   mac0 -> mac1 ->mac2 ->mac3 <- mac4 <- mac5 <- mac6 <- mac7 
//    al     bl     bl     bl      bl      bl       cr     br
//                                                  |
//                                                  --buf--
//                                                        |     
//                                                        v     
//                                                      to sctag4


pcx_dpsg pcx_dps4(
                  // /*AUTOINST*/
                  // Outputs
                  .pcx_scache_data_x_      (pcx_scache4_data_x_[129:0]),
                  // Inputs
                  .arb_grant_l_a             (arb4_grant_l_a[7:0]),
                  .arb_q0_holdbar_l_a        (arb4_q0_holdbar_l_a[7:0]),
                  .arb_qsel0_l_a             (arb4_qsel0_l_a[7:0]),
                  .arb_qsel1_l_a             (arb4_qsel1_l_a[7:0]),
                  .arb_shift_l_a             (arb4_shift_l_a[7:0]),
                  .arb_grant_r_a             (arb4_grant_r_a[7:0]),
                  .arb_q0_holdbar_r_a        (arb4_q0_holdbar_r_a[7:0]),
                  .arb_qsel0_r_a             (arb4_qsel0_r_a[7:0]),
                  .arb_qsel1_r_a             (arb4_qsel1_r_a[7:0]),
                  .arb_shift_r_a             (arb4_shift_r_a[7:0]),
                  .spc0_pcx_data_a         (spc0_pcx_data_a[129:0]),
                  .spc1_pcx_data_a         (spc1_pcx_data_a[129:0]),
                  .spc2_pcx_data_a         (spc2_pcx_data_a[129:0]),
                  .spc3_pcx_data_a         (spc3_pcx_data_a[129:0]),
                  .spc4_pcx_data_a         (spc4_pcx_data_a[129:0]),
                  .spc5_pcx_data_a         (spc5_pcx_data_a[129:0]),
                  .spc6_pcx_data_a         (spc6_pcx_data_a[129:0]),
                  .spc7_pcx_data_a         (spc7_pcx_data_a[129:0]),
                  .scan_in(pcx_dps4_scanin),
                  .scan_out(pcx_dps4_scanout),
                  .l2clk                   (l2clk),
                  .ccx_aclk                (ccx_aclk_t),
                  .ccx_bclk                (ccx_bclk_t),
                  .tcu_scan_en             (tcu_scan_en_t),
                  .tcu_pce_ov              (tcu_pce_ov_t)
                  );





// DATAPATH ORGANISATION(pcx_dps5)
//
//   sparc0 sparc2 sparc1 sparc3  sparc7  sparc5  sparc6  sparc4
//     |      |      |      |       |       |        |      |
//     v      v      v      v       v       v        v      v
//   mac0 -> mac1 ->mac2 ->mac3 -> mac4 <- mac5 <- mac6 <- mac7 
//    al     bl     bl     bl      cr      br       br     ar
//                                 |
//                                 ------buf------
//                                                |     
//                                                v     
//                                             to sctag5

pcx_dpse pcx_dps5(
                  // /*AUTOINST*/
                  // Outputs
                  .pcx_scache_data_x_      (pcx_scache5_data_x_[129:0]),
                  // Inputs
                  .arb_grant_l_a             (arb5_grant_l_a[7:0]),
                  .arb_q0_holdbar_l_a        (arb5_q0_holdbar_l_a[7:0]),
                  .arb_qsel0_l_a             (arb5_qsel0_l_a[7:0]),
                  .arb_qsel1_l_a             (arb5_qsel1_l_a[7:0]),
                  .arb_shift_l_a             (arb5_shift_l_a[7:0]),
                  .arb_grant_r_a             (arb5_grant_r_a[7:0]),
                  .arb_q0_holdbar_r_a        (arb5_q0_holdbar_r_a[7:0]),
                  .arb_qsel0_r_a             (arb5_qsel0_r_a[7:0]),
                  .arb_qsel1_r_a             (arb5_qsel1_r_a[7:0]),
                  .arb_shift_r_a             (arb5_shift_r_a[7:0]),
                  .spc0_pcx_data_a         (spc0_pcx_data_a[129:0]),
                  .spc1_pcx_data_a         (spc1_pcx_data_a[129:0]),
                  .spc2_pcx_data_a         (spc2_pcx_data_a[129:0]),
                  .spc3_pcx_data_a         (spc3_pcx_data_a[129:0]),
                  .spc4_pcx_data_a         (spc4_pcx_data_a[129:0]),
                  .spc5_pcx_data_a         (spc5_pcx_data_a[129:0]),
                  .spc6_pcx_data_a         (spc6_pcx_data_a[129:0]),
                  .spc7_pcx_data_a         (spc7_pcx_data_a[129:0]),
                  .scan_in(pcx_dps5_scanin),
                  .scan_out(pcx_dps5_scanout),
                  .l2clk                   (l2clk),
                  .ccx_aclk                (ccx_aclk_t),
                  .ccx_bclk                (ccx_bclk_t),
                  .tcu_scan_en             (tcu_scan_en_t),
                  .tcu_pce_ov              (tcu_pce_ov_t)
                  );


// DATAPATH ORGANISATION(pcx_dps6)
//
//   sparc0 sparc2 sparc1 sparc3  sparc7  sparc5  sparc6  sparc4
//     |      |      |      |       |       |        |      |
//     v      v      v      v       v       v        v      v
//   mac0 -> mac1 ->mac2 ->mac3 -> mac4 -> mac5 <- mac6 <- mac7 
//    al     bl     bl     bl      bl      bl       bl     cr
//                                                         |
//                                                       buf
//                                                         |    
//                                                         v    
//                                                      to sctag6

pcx_dpsh pcx_dps6(
                  // /*AUTOINST*/
                  // Outputs
                  .pcx_scache_data_x_      (pcx_scache6_data_x_[129:0]),
                  // Inputs
                  .arb_grant_l_a             (arb6_grant_l_a[7:0]),
                  .arb_q0_holdbar_l_a        (arb6_q0_holdbar_l_a[7:0]),
                  .arb_qsel0_l_a             (arb6_qsel0_l_a[7:0]),
                  .arb_qsel1_l_a             (arb6_qsel1_l_a[7:0]),
                  .arb_shift_l_a             (arb6_shift_l_a[7:0]),
                  .arb_grant_r_a             (arb6_grant_r_a[7:0]),
                  .arb_q0_holdbar_r_a        (arb6_q0_holdbar_r_a[7:0]),
                  .arb_qsel0_r_a             (arb6_qsel0_r_a[7:0]),
                  .arb_qsel1_r_a             (arb6_qsel1_r_a[7:0]),
                  .arb_shift_r_a             (arb6_shift_r_a[7:0]),
                  .spc0_pcx_data_a         (spc0_pcx_data_a[129:0]),
                  .spc1_pcx_data_a         (spc1_pcx_data_a[129:0]),
                  .spc2_pcx_data_a         (spc2_pcx_data_a[129:0]),
                  .spc3_pcx_data_a         (spc3_pcx_data_a[129:0]),
                  .spc4_pcx_data_a         (spc4_pcx_data_a[129:0]),
                  .spc5_pcx_data_a         (spc5_pcx_data_a[129:0]),
                  .spc6_pcx_data_a         (spc6_pcx_data_a[129:0]),
                  .spc7_pcx_data_a         (spc7_pcx_data_a[129:0]),
                  .scan_in(pcx_dps6_scanin),
                  .scan_out(pcx_dps6_scanout),
                  .l2clk                   (l2clk),
                  .ccx_aclk                (ccx_aclk_b),
                  .ccx_bclk                (ccx_bclk_b),
                  .tcu_scan_en             (tcu_scan_en_b),
                  .tcu_pce_ov              (tcu_pce_ov_b)
                  );


// DATAPATH ORGANISATION(pcx_dps7)
//
//   sparc0 sparc2 sparc1 sparc3  sparc7  sparc5  sparc6  sparc4
//     |      |      |      |       |       |        |      |
//     v      v      v      v       v       v        v      v
//   mac0 -> mac1 ->mac2 ->mac3 -> mac4 -> mac5 <- mac6 <- mac7 
//    al     bl     bl     bl      bl      cr       br     ar
//                                          |
//                                         buf----
//                                               |    
//                                               v    
//                                            to sctag7

pcx_dpsf pcx_dps7(
                  // /*AUTOINST*/
                  // Outputs
                  .pcx_scache_data_x_      (pcx_scache7_data_x_[129:0]),
                  // Inputs
                  .arb_grant_l_a             (arb7_grant_l_a[7:0]),
                  .arb_q0_holdbar_l_a        (arb7_q0_holdbar_l_a[7:0]),
                  .arb_qsel0_l_a             (arb7_qsel0_l_a[7:0]),
                  .arb_qsel1_l_a             (arb7_qsel1_l_a[7:0]),
                  .arb_shift_l_a             (arb7_shift_l_a[7:0]),
                  .arb_grant_r_a             (arb7_grant_r_a[7:0]),
                  .arb_q0_holdbar_r_a        (arb7_q0_holdbar_r_a[7:0]),
                  .arb_qsel0_r_a             (arb7_qsel0_r_a[7:0]),
                  .arb_qsel1_r_a             (arb7_qsel1_r_a[7:0]),
                  .arb_shift_r_a             (arb7_shift_r_a[7:0]),
                  .spc0_pcx_data_a         (spc0_pcx_data_a[129:0]),
                  .spc1_pcx_data_a         (spc1_pcx_data_a[129:0]),
                  .spc2_pcx_data_a         (spc2_pcx_data_a[129:0]),
                  .spc3_pcx_data_a         (spc3_pcx_data_a[129:0]),
                  .spc4_pcx_data_a         (spc4_pcx_data_a[129:0]),
                  .spc5_pcx_data_a         (spc5_pcx_data_a[129:0]),
                  .spc6_pcx_data_a         (spc6_pcx_data_a[129:0]),
                  .spc7_pcx_data_a         (spc7_pcx_data_a[129:0]),
                  .scan_in(pcx_dps7_scanin),
                  .scan_out(pcx_dps7_scanout),
                  .l2clk                   (l2clk),
                  .ccx_aclk                (ccx_aclk_b),
                  .ccx_bclk                (ccx_bclk_b),
                  .tcu_scan_en             (tcu_scan_en_b),
                  .tcu_pce_ov              (tcu_pce_ov_b)
                  );



// DATAPATH ORGANISATION(pcx_dps8)
//
//   sparc0 sparc2 sparc1 sparc3  sparc7  sparc5  sparc6  sparc4
//     |      |      |      |       |       |        |      |
//     v      v      v      v       v       v        v      v
//   mac0 <- mac1 <-mac2 <-mac3 <- mac4 <- mac5 <- mac6 <- mac7 
//    cl     br     br     br      br      br       br     ar
//     |
//     buf
//      |
//      v
//   to IOBRIDGE


pcx_dpsa pcx_dps8(
                  // /*AUTOINST*/
                  // Outputs
                  .pcx_scache_data_x_      (pcx_io_data_x_[129:0]),
                  // Inputs
                  .arb_grant_l_a             (arb8_grant_l_a[7:0]),
                  .arb_q0_holdbar_l_a        (arb8_q0_holdbar_l_a[7:0]),
                  .arb_qsel0_l_a             (arb8_qsel0_l_a[7:0]),
                  .arb_qsel1_l_a             (arb8_qsel1_l_a[7:0]),
                  .arb_shift_l_a             (arb8_shift_l_a[7:0]),
                  .arb_grant_r_a             (arb8_grant_r_a[7:0]),
                  .arb_q0_holdbar_r_a        (arb8_q0_holdbar_r_a[7:0]),
                  .arb_qsel0_r_a             (arb8_qsel0_r_a[7:0]),
                  .arb_qsel1_r_a             (arb8_qsel1_r_a[7:0]),
                  .arb_shift_r_a             (arb8_shift_r_a[7:0]),
                  .spc0_pcx_data_a         (spc0_pcx_data_a[129:0]),
                  .spc1_pcx_data_a         (spc1_pcx_data_a[129:0]),
                  .spc2_pcx_data_a         (spc2_pcx_data_a[129:0]),
                  .spc3_pcx_data_a         (spc3_pcx_data_a[129:0]),
                  .spc4_pcx_data_a         (spc4_pcx_data_a[129:0]),
                  .spc5_pcx_data_a         (spc5_pcx_data_a[129:0]),
                  .spc6_pcx_data_a         (spc6_pcx_data_a[129:0]),
                  .spc7_pcx_data_a         (spc7_pcx_data_a[129:0]),
                  .scan_in(pcx_dps8_scanin),
                  .scan_out(pcx_dps8_scanout),
                  .l2clk                   (l2clk),
                  .ccx_aclk                (ccx_aclk_t),
                  .ccx_bclk                (ccx_bclk_t),
                  .tcu_scan_en             (tcu_scan_en_t),
                  .tcu_pce_ov              (tcu_pce_ov_t)
                  );




// fixscan start:
assign pcx_dps0_scanin           = scan_in                  ;
assign pcx_dps4_scanin           = pcx_dps0_scanout         ;
assign pcx_dps8_scanin           = pcx_dps4_scanout         ;
assign pcx_dps1_scanin           = pcx_dps8_scanout         ;
assign pcx_dps5_scanin           = pcx_dps1_scanout         ;
assign pcx_dps3_scanin           = pcx_dps5_scanout         ;
assign pcx_dps7_scanin           = pcx_dps3_scanout         ;
assign pcx_dps2_scanin           = pcx_dps7_scanout         ;
assign pcx_dps6_scanin           = pcx_dps2_scanout         ;
assign scan_out                  = pcx_dps6_scanout         ;
// fixscan end:
endmodule 


// Local Variables:
// verilog-library-directories:("." "v")
// End:



//
//   buff macro
//
//





module pcx_dpa_buff_macro__dbuff_32x__stack_6l__width_5 (
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





module pcx_dpa_buff_macro__dbuff_32x__stack_none__width_1 (
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
//nand_macro i_nand_data_crit_2 (width=40, ports=3, stack=50c) 
//(
// .din0	(data_x_[129:90]),
// .din1	(data_crit_x_[129:90]),
// .din2	(data_ncrit_x_[129:90]),
// .dout	(data_out_x[129:90])
//);
//
//nand_macro i_nand_data_crit_1 (width=50, ports=3, stack=50c) 
//(
// .din0	(data_x_[89:40]),
// .din1	(data_crit_x_[89:40]),
// .din2	(data_ncrit_x_[89:40]),
// .dout	(data_out_x[89:40])
//);
//
//nand_macro i_nand_data_crit_0 (width=40, ports=3, stack=50c) 
//(
// .din0	(data_x_[39:0]),
// .din1	(data_crit_x_[39:0]),
// .din2	(data_ncrit_x_[39:0]),
// .dout	(data_out_x[39:0])
//);
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
// Local Variables:
// verilog-library-directories:("." "v")
// verilog-library-files:("./v/ccx_new_macro.v")
// End:
//


//
//   buff macro
//
//





module pcx_dpa_buff_macro__dbuff_8x__stack_none__vertical_1__width_4 (
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

module pcx_dpa_ccx_l1clkhdr_ctl_macro__dl1hdr_24x (
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





module pcx_dpa_ccx_new_macro__type_c_l (
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





module pcx_dpa_ccx_new_macro__type_b_r (
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





module pcx_dpa_ccx_new_macro__type_a (
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


//
//// scan renames
//assign pce_ov = tcu_pce_ov;
//assign stop = tcu_clk_stop;
//assign siclk = tcu_aclk;
//assign soclk = tcu_bclk;
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





module pcx_dpa_ccx_new_macro__type_b_l (
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
//   ccx macro
//
//





module pcx_dpa_ccx_new_macro__type_c_r (
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
module pcx_dpa(pcx_io_data_x_, pcx_scache0_data_x_, pcx_scache1_data_x_, 
	pcx_scache2_data_x_, pcx_scache3_data_x_, pcx_scache4_data_x_, 
	pcx_scache5_data_x_, pcx_scache6_data_x_, pcx_scache7_data_x_, 
	arb0_grant_l_a, arb0_q0_holdbar_l_a, arb0_qsel0_l_a, arb0_qsel1_l_a, 
	arb0_shift_l_a, arb1_grant_l_a, arb1_q0_holdbar_l_a, arb1_qsel0_l_a, 
	arb1_qsel1_l_a, arb1_shift_l_a, arb2_grant_l_a, arb2_q0_holdbar_l_a, 
	arb2_qsel0_l_a, arb2_qsel1_l_a, arb2_shift_l_a, arb3_grant_l_a, 
	arb3_q0_holdbar_l_a, arb3_qsel0_l_a, arb3_qsel1_l_a, arb3_shift_l_a, 
	arb4_grant_l_a, arb4_q0_holdbar_l_a, arb4_qsel0_l_a, arb4_qsel1_l_a, 
	arb4_shift_l_a, arb5_grant_l_a, arb5_q0_holdbar_l_a, arb5_qsel0_l_a, 
	arb5_qsel1_l_a, arb5_shift_l_a, arb6_grant_l_a, arb6_q0_holdbar_l_a, 
	arb6_qsel0_l_a, arb6_qsel1_l_a, arb6_shift_l_a, arb7_grant_l_a, 
	arb7_q0_holdbar_l_a, arb7_qsel0_l_a, arb7_qsel1_l_a, arb7_shift_l_a, 
	arb8_grant_l_a, arb8_q0_holdbar_l_a, arb8_qsel0_l_a, arb8_qsel1_l_a, 
	arb8_shift_l_a, arb0_grant_r_a, arb0_q0_holdbar_r_a, arb0_qsel0_r_a, 
	arb0_qsel1_r_a, arb0_shift_r_a, arb1_grant_r_a, arb1_q0_holdbar_r_a, 
	arb1_qsel0_r_a, arb1_qsel1_r_a, arb1_shift_r_a, arb2_grant_r_a, 
	arb2_q0_holdbar_r_a, arb2_qsel0_r_a, arb2_qsel1_r_a, arb2_shift_r_a, 
	arb3_grant_r_a, arb3_q0_holdbar_r_a, arb3_qsel0_r_a, arb3_qsel1_r_a, 
	arb3_shift_r_a, arb4_grant_r_a, arb4_q0_holdbar_r_a, arb4_qsel0_r_a, 
	arb4_qsel1_r_a, arb4_shift_r_a, arb5_grant_r_a, arb5_q0_holdbar_r_a, 
	arb5_qsel0_r_a, arb5_qsel1_r_a, arb5_shift_r_a, arb6_grant_r_a, 
	arb6_q0_holdbar_r_a, arb6_qsel0_r_a, arb6_qsel1_r_a, arb6_shift_r_a, 
	arb7_grant_r_a, arb7_q0_holdbar_r_a, arb7_qsel0_r_a, arb7_qsel1_r_a, 
	arb7_shift_r_a, arb8_grant_r_a, arb8_q0_holdbar_r_a, arb8_qsel0_r_a, 
	arb8_qsel1_r_a, arb8_shift_r_a, spc0_pcx_data_a, spc1_pcx_data_a, 
	spc2_pcx_data_a, spc3_pcx_data_a, spc4_pcx_data_a, spc5_pcx_data_a, 
	spc6_pcx_data_a, spc7_pcx_data_a, l2clk, scan_in, tcu_pce_ov_t, 
	tcu_scan_en_t, ccx_aclk_t, ccx_bclk_t, tcu_pce_ov_b, tcu_scan_en_b, 
	ccx_aclk_b, ccx_bclk_b, scan_out);

	output	[129:0]		pcx_io_data_x_;
	output	[129:0]		pcx_scache0_data_x_;
	output	[129:0]		pcx_scache1_data_x_;
	output	[129:0]		pcx_scache2_data_x_;
	output	[129:0]		pcx_scache3_data_x_;
	output	[129:0]		pcx_scache4_data_x_;
	output	[129:0]		pcx_scache5_data_x_;
	output	[129:0]		pcx_scache6_data_x_;
	output	[129:0]		pcx_scache7_data_x_;
	input	[7:0]		arb0_grant_l_a;
	input	[7:0]		arb0_q0_holdbar_l_a;
	input	[7:0]		arb0_qsel0_l_a;
	input	[7:0]		arb0_qsel1_l_a;
	input	[7:0]		arb0_shift_l_a;
	input	[7:0]		arb1_grant_l_a;
	input	[7:0]		arb1_q0_holdbar_l_a;
	input	[7:0]		arb1_qsel0_l_a;
	input	[7:0]		arb1_qsel1_l_a;
	input	[7:0]		arb1_shift_l_a;
	input	[7:0]		arb2_grant_l_a;
	input	[7:0]		arb2_q0_holdbar_l_a;
	input	[7:0]		arb2_qsel0_l_a;
	input	[7:0]		arb2_qsel1_l_a;
	input	[7:0]		arb2_shift_l_a;
	input	[7:0]		arb3_grant_l_a;
	input	[7:0]		arb3_q0_holdbar_l_a;
	input	[7:0]		arb3_qsel0_l_a;
	input	[7:0]		arb3_qsel1_l_a;
	input	[7:0]		arb3_shift_l_a;
	input	[7:0]		arb4_grant_l_a;
	input	[7:0]		arb4_q0_holdbar_l_a;
	input	[7:0]		arb4_qsel0_l_a;
	input	[7:0]		arb4_qsel1_l_a;
	input	[7:0]		arb4_shift_l_a;
	input	[7:0]		arb5_grant_l_a;
	input	[7:0]		arb5_q0_holdbar_l_a;
	input	[7:0]		arb5_qsel0_l_a;
	input	[7:0]		arb5_qsel1_l_a;
	input	[7:0]		arb5_shift_l_a;
	input	[7:0]		arb6_grant_l_a;
	input	[7:0]		arb6_q0_holdbar_l_a;
	input	[7:0]		arb6_qsel0_l_a;
	input	[7:0]		arb6_qsel1_l_a;
	input	[7:0]		arb6_shift_l_a;
	input	[7:0]		arb7_grant_l_a;
	input	[7:0]		arb7_q0_holdbar_l_a;
	input	[7:0]		arb7_qsel0_l_a;
	input	[7:0]		arb7_qsel1_l_a;
	input	[7:0]		arb7_shift_l_a;
	input	[7:0]		arb8_grant_l_a;
	input	[7:0]		arb8_q0_holdbar_l_a;
	input	[7:0]		arb8_qsel0_l_a;
	input	[7:0]		arb8_qsel1_l_a;
	input	[7:0]		arb8_shift_l_a;
	input	[7:0]		arb0_grant_r_a;
	input	[7:0]		arb0_q0_holdbar_r_a;
	input	[7:0]		arb0_qsel0_r_a;
	input	[7:0]		arb0_qsel1_r_a;
	input	[7:0]		arb0_shift_r_a;
	input	[7:0]		arb1_grant_r_a;
	input	[7:0]		arb1_q0_holdbar_r_a;
	input	[7:0]		arb1_qsel0_r_a;
	input	[7:0]		arb1_qsel1_r_a;
	input	[7:0]		arb1_shift_r_a;
	input	[7:0]		arb2_grant_r_a;
	input	[7:0]		arb2_q0_holdbar_r_a;
	input	[7:0]		arb2_qsel0_r_a;
	input	[7:0]		arb2_qsel1_r_a;
	input	[7:0]		arb2_shift_r_a;
	input	[7:0]		arb3_grant_r_a;
	input	[7:0]		arb3_q0_holdbar_r_a;
	input	[7:0]		arb3_qsel0_r_a;
	input	[7:0]		arb3_qsel1_r_a;
	input	[7:0]		arb3_shift_r_a;
	input	[7:0]		arb4_grant_r_a;
	input	[7:0]		arb4_q0_holdbar_r_a;
	input	[7:0]		arb4_qsel0_r_a;
	input	[7:0]		arb4_qsel1_r_a;
	input	[7:0]		arb4_shift_r_a;
	input	[7:0]		arb5_grant_r_a;
	input	[7:0]		arb5_q0_holdbar_r_a;
	input	[7:0]		arb5_qsel0_r_a;
	input	[7:0]		arb5_qsel1_r_a;
	input	[7:0]		arb5_shift_r_a;
	input	[7:0]		arb6_grant_r_a;
	input	[7:0]		arb6_q0_holdbar_r_a;
	input	[7:0]		arb6_qsel0_r_a;
	input	[7:0]		arb6_qsel1_r_a;
	input	[7:0]		arb6_shift_r_a;
	input	[7:0]		arb7_grant_r_a;
	input	[7:0]		arb7_q0_holdbar_r_a;
	input	[7:0]		arb7_qsel0_r_a;
	input	[7:0]		arb7_qsel1_r_a;
	input	[7:0]		arb7_shift_r_a;
	input	[7:0]		arb8_grant_r_a;
	input	[7:0]		arb8_q0_holdbar_r_a;
	input	[7:0]		arb8_qsel0_r_a;
	input	[7:0]		arb8_qsel1_r_a;
	input	[7:0]		arb8_shift_r_a;
	input	[129:0]		spc0_pcx_data_a;
	input	[129:0]		spc1_pcx_data_a;
	input	[129:0]		spc2_pcx_data_a;
	input	[129:0]		spc3_pcx_data_a;
	input	[129:0]		spc4_pcx_data_a;
	input	[129:0]		spc5_pcx_data_a;
	input	[129:0]		spc6_pcx_data_a;
	input	[129:0]		spc7_pcx_data_a;
	input			l2clk;
	input			scan_in;
	input			tcu_pce_ov_t;
	input			tcu_scan_en_t;
	input			ccx_aclk_t;
	input			ccx_bclk_t;
	input			tcu_pce_ov_b;
	input			tcu_scan_en_b;
	input			ccx_aclk_b;
	input			ccx_bclk_b;
	output			scan_out;

	wire			pcx_dps0_scanin;
	wire			pcx_dps0_scanout;
	wire			pcx_dps1_scanin;
	wire			pcx_dps1_scanout;
	wire			pcx_dps2_scanin;
	wire			pcx_dps2_scanout;
	wire			pcx_dps3_scanin;
	wire			pcx_dps3_scanout;
	wire			pcx_dps4_scanin;
	wire			pcx_dps4_scanout;
	wire			pcx_dps5_scanin;
	wire			pcx_dps5_scanout;
	wire			pcx_dps6_scanin;
	wire			pcx_dps6_scanout;
	wire			pcx_dps7_scanin;
	wire			pcx_dps7_scanout;
	wire			pcx_dps8_scanin;
	wire			pcx_dps8_scanout;

	assign pcx_dps0_scanin = scan_in;
	assign pcx_dps4_scanin = pcx_dps0_scanout;
	assign pcx_dps8_scanin = pcx_dps4_scanout;
	assign pcx_dps1_scanin = pcx_dps8_scanout;
	assign pcx_dps5_scanin = pcx_dps1_scanout;
	assign pcx_dps3_scanin = pcx_dps5_scanout;
	assign pcx_dps7_scanin = pcx_dps3_scanout;
	assign pcx_dps2_scanin = pcx_dps7_scanout;
	assign pcx_dps6_scanin = pcx_dps2_scanout;
	assign scan_out = pcx_dps6_scanout;

	pcx_dpsa pcx_dps0(
		.pcx_scache_data_x_		(pcx_scache0_data_x_[129:0]), 
		.arb_grant_l_a			(arb0_grant_l_a[7:0]), 
		.arb_q0_holdbar_l_a		(arb0_q0_holdbar_l_a[7:0]), 
		.arb_qsel0_l_a			(arb0_qsel0_l_a[7:0]), 
		.arb_qsel1_l_a			(arb0_qsel1_l_a[7:0]), 
		.arb_shift_l_a			(arb0_shift_l_a[7:0]), 
		.arb_grant_r_a			(arb0_grant_r_a[7:0]), 
		.arb_q0_holdbar_r_a		(arb0_q0_holdbar_r_a[7:0]), 
		.arb_qsel0_r_a			(arb0_qsel0_r_a[7:0]), 
		.arb_qsel1_r_a			(arb0_qsel1_r_a[7:0]), 
		.arb_shift_r_a			(arb0_shift_r_a[7:0]), 
		.spc0_pcx_data_a		(spc0_pcx_data_a[129:0]), 
		.spc1_pcx_data_a		(spc1_pcx_data_a[129:0]), 
		.spc2_pcx_data_a		(spc2_pcx_data_a[129:0]), 
		.spc3_pcx_data_a		(spc3_pcx_data_a[129:0]), 
		.spc4_pcx_data_a		(spc4_pcx_data_a[129:0]), 
		.spc5_pcx_data_a		(spc5_pcx_data_a[129:0]), 
		.spc6_pcx_data_a		(spc6_pcx_data_a[129:0]), 
		.spc7_pcx_data_a		(spc7_pcx_data_a[129:0]), 
		.scan_in			(pcx_dps0_scanin), 
		.scan_out			(pcx_dps0_scanout), 
		.l2clk				(l2clk), 
		.ccx_aclk			(ccx_aclk_t), 
		.ccx_bclk			(ccx_bclk_t), 
		.tcu_scan_en			(tcu_scan_en_t), 
		.tcu_pce_ov			(tcu_pce_ov_t));
	pcx_dpsc pcx_dps1(
		.pcx_scache_data_x_		(pcx_scache1_data_x_[129:0]), 
		.arb_grant_l_a			(arb1_grant_l_a[7:0]), 
		.arb_q0_holdbar_l_a		(arb1_q0_holdbar_l_a[7:0]), 
		.arb_qsel0_l_a			(arb1_qsel0_l_a[7:0]), 
		.arb_qsel1_l_a			(arb1_qsel1_l_a[7:0]), 
		.arb_shift_l_a			(arb1_shift_l_a[7:0]), 
		.arb_grant_r_a			(arb1_grant_r_a[7:0]), 
		.arb_q0_holdbar_r_a		(arb1_q0_holdbar_r_a[7:0]), 
		.arb_qsel0_r_a			(arb1_qsel0_r_a[7:0]), 
		.arb_qsel1_r_a			(arb1_qsel1_r_a[7:0]), 
		.arb_shift_r_a			(arb1_shift_r_a[7:0]), 
		.spc0_pcx_data_a		(spc0_pcx_data_a[129:0]), 
		.spc1_pcx_data_a		(spc1_pcx_data_a[129:0]), 
		.spc2_pcx_data_a		(spc2_pcx_data_a[129:0]), 
		.spc3_pcx_data_a		(spc3_pcx_data_a[129:0]), 
		.spc4_pcx_data_a		(spc4_pcx_data_a[129:0]), 
		.spc5_pcx_data_a		(spc5_pcx_data_a[129:0]), 
		.spc6_pcx_data_a		(spc6_pcx_data_a[129:0]), 
		.spc7_pcx_data_a		(spc7_pcx_data_a[129:0]), 
		.scan_in			(pcx_dps1_scanin), 
		.scan_out			(pcx_dps1_scanout), 
		.l2clk				(l2clk), 
		.ccx_aclk			(ccx_aclk_t), 
		.ccx_bclk			(ccx_bclk_t), 
		.tcu_scan_en			(tcu_scan_en_t), 
		.tcu_pce_ov			(tcu_pce_ov_t));
	pcx_dpsb pcx_dps2(
		.pcx_scache_data_x_		(pcx_scache2_data_x_[129:0]), 
		.arb_grant_l_a			(arb2_grant_l_a[7:0]), 
		.arb_q0_holdbar_l_a		(arb2_q0_holdbar_l_a[7:0]), 
		.arb_qsel0_l_a			(arb2_qsel0_l_a[7:0]), 
		.arb_qsel1_l_a			(arb2_qsel1_l_a[7:0]), 
		.arb_shift_l_a			(arb2_shift_l_a[7:0]), 
		.arb_grant_r_a			(arb2_grant_r_a[7:0]), 
		.arb_q0_holdbar_r_a		(arb2_q0_holdbar_r_a[7:0]), 
		.arb_qsel0_r_a			(arb2_qsel0_r_a[7:0]), 
		.arb_qsel1_r_a			(arb2_qsel1_r_a[7:0]), 
		.arb_shift_r_a			(arb2_shift_r_a[7:0]), 
		.spc0_pcx_data_a		(spc0_pcx_data_a[129:0]), 
		.spc1_pcx_data_a		(spc1_pcx_data_a[129:0]), 
		.spc2_pcx_data_a		(spc2_pcx_data_a[129:0]), 
		.spc3_pcx_data_a		(spc3_pcx_data_a[129:0]), 
		.spc4_pcx_data_a		(spc4_pcx_data_a[129:0]), 
		.spc5_pcx_data_a		(spc5_pcx_data_a[129:0]), 
		.spc6_pcx_data_a		(spc6_pcx_data_a[129:0]), 
		.spc7_pcx_data_a		(spc7_pcx_data_a[129:0]), 
		.scan_in			(pcx_dps2_scanin), 
		.scan_out			(pcx_dps2_scanout), 
		.l2clk				(l2clk), 
		.ccx_aclk			(ccx_aclk_b), 
		.ccx_bclk			(ccx_bclk_b), 
		.tcu_scan_en			(tcu_scan_en_b), 
		.tcu_pce_ov			(tcu_pce_ov_b));
	pcx_dpsd pcx_dps3(
		.pcx_scache_data_x_		(pcx_scache3_data_x_[129:0]), 
		.arb_grant_l_a			(arb3_grant_l_a[7:0]), 
		.arb_q0_holdbar_l_a		(arb3_q0_holdbar_l_a[7:0]), 
		.arb_qsel0_l_a			(arb3_qsel0_l_a[7:0]), 
		.arb_qsel1_l_a			(arb3_qsel1_l_a[7:0]), 
		.arb_shift_l_a			(arb3_shift_l_a[7:0]), 
		.arb_grant_r_a			(arb3_grant_r_a[7:0]), 
		.arb_q0_holdbar_r_a		(arb3_q0_holdbar_r_a[7:0]), 
		.arb_qsel0_r_a			(arb3_qsel0_r_a[7:0]), 
		.arb_qsel1_r_a			(arb3_qsel1_r_a[7:0]), 
		.arb_shift_r_a			(arb3_shift_r_a[7:0]), 
		.spc0_pcx_data_a		(spc0_pcx_data_a[129:0]), 
		.spc1_pcx_data_a		(spc1_pcx_data_a[129:0]), 
		.spc2_pcx_data_a		(spc2_pcx_data_a[129:0]), 
		.spc3_pcx_data_a		(spc3_pcx_data_a[129:0]), 
		.spc4_pcx_data_a		(spc4_pcx_data_a[129:0]), 
		.spc5_pcx_data_a		(spc5_pcx_data_a[129:0]), 
		.spc6_pcx_data_a		(spc6_pcx_data_a[129:0]), 
		.spc7_pcx_data_a		(spc7_pcx_data_a[129:0]), 
		.scan_in			(pcx_dps3_scanin), 
		.scan_out			(pcx_dps3_scanout), 
		.l2clk				(l2clk), 
		.ccx_aclk			(ccx_aclk_b), 
		.ccx_bclk			(ccx_bclk_b), 
		.tcu_scan_en			(tcu_scan_en_b), 
		.tcu_pce_ov			(tcu_pce_ov_b));
	pcx_dpsg pcx_dps4(
		.pcx_scache_data_x_		(pcx_scache4_data_x_[129:0]), 
		.arb_grant_l_a			(arb4_grant_l_a[7:0]), 
		.arb_q0_holdbar_l_a		(arb4_q0_holdbar_l_a[7:0]), 
		.arb_qsel0_l_a			(arb4_qsel0_l_a[7:0]), 
		.arb_qsel1_l_a			(arb4_qsel1_l_a[7:0]), 
		.arb_shift_l_a			(arb4_shift_l_a[7:0]), 
		.arb_grant_r_a			(arb4_grant_r_a[7:0]), 
		.arb_q0_holdbar_r_a		(arb4_q0_holdbar_r_a[7:0]), 
		.arb_qsel0_r_a			(arb4_qsel0_r_a[7:0]), 
		.arb_qsel1_r_a			(arb4_qsel1_r_a[7:0]), 
		.arb_shift_r_a			(arb4_shift_r_a[7:0]), 
		.spc0_pcx_data_a		(spc0_pcx_data_a[129:0]), 
		.spc1_pcx_data_a		(spc1_pcx_data_a[129:0]), 
		.spc2_pcx_data_a		(spc2_pcx_data_a[129:0]), 
		.spc3_pcx_data_a		(spc3_pcx_data_a[129:0]), 
		.spc4_pcx_data_a		(spc4_pcx_data_a[129:0]), 
		.spc5_pcx_data_a		(spc5_pcx_data_a[129:0]), 
		.spc6_pcx_data_a		(spc6_pcx_data_a[129:0]), 
		.spc7_pcx_data_a		(spc7_pcx_data_a[129:0]), 
		.scan_in			(pcx_dps4_scanin), 
		.scan_out			(pcx_dps4_scanout), 
		.l2clk				(l2clk), 
		.ccx_aclk			(ccx_aclk_t), 
		.ccx_bclk			(ccx_bclk_t), 
		.tcu_scan_en			(tcu_scan_en_t), 
		.tcu_pce_ov			(tcu_pce_ov_t));
	pcx_dpse pcx_dps5(
		.pcx_scache_data_x_		(pcx_scache5_data_x_[129:0]), 
		.arb_grant_l_a			(arb5_grant_l_a[7:0]), 
		.arb_q0_holdbar_l_a		(arb5_q0_holdbar_l_a[7:0]), 
		.arb_qsel0_l_a			(arb5_qsel0_l_a[7:0]), 
		.arb_qsel1_l_a			(arb5_qsel1_l_a[7:0]), 
		.arb_shift_l_a			(arb5_shift_l_a[7:0]), 
		.arb_grant_r_a			(arb5_grant_r_a[7:0]), 
		.arb_q0_holdbar_r_a		(arb5_q0_holdbar_r_a[7:0]), 
		.arb_qsel0_r_a			(arb5_qsel0_r_a[7:0]), 
		.arb_qsel1_r_a			(arb5_qsel1_r_a[7:0]), 
		.arb_shift_r_a			(arb5_shift_r_a[7:0]), 
		.spc0_pcx_data_a		(spc0_pcx_data_a[129:0]), 
		.spc1_pcx_data_a		(spc1_pcx_data_a[129:0]), 
		.spc2_pcx_data_a		(spc2_pcx_data_a[129:0]), 
		.spc3_pcx_data_a		(spc3_pcx_data_a[129:0]), 
		.spc4_pcx_data_a		(spc4_pcx_data_a[129:0]), 
		.spc5_pcx_data_a		(spc5_pcx_data_a[129:0]), 
		.spc6_pcx_data_a		(spc6_pcx_data_a[129:0]), 
		.spc7_pcx_data_a		(spc7_pcx_data_a[129:0]), 
		.scan_in			(pcx_dps5_scanin), 
		.scan_out			(pcx_dps5_scanout), 
		.l2clk				(l2clk), 
		.ccx_aclk			(ccx_aclk_t), 
		.ccx_bclk			(ccx_bclk_t), 
		.tcu_scan_en			(tcu_scan_en_t), 
		.tcu_pce_ov			(tcu_pce_ov_t));
	pcx_dpsh pcx_dps6(
		.pcx_scache_data_x_		(pcx_scache6_data_x_[129:0]), 
		.arb_grant_l_a			(arb6_grant_l_a[7:0]), 
		.arb_q0_holdbar_l_a		(arb6_q0_holdbar_l_a[7:0]), 
		.arb_qsel0_l_a			(arb6_qsel0_l_a[7:0]), 
		.arb_qsel1_l_a			(arb6_qsel1_l_a[7:0]), 
		.arb_shift_l_a			(arb6_shift_l_a[7:0]), 
		.arb_grant_r_a			(arb6_grant_r_a[7:0]), 
		.arb_q0_holdbar_r_a		(arb6_q0_holdbar_r_a[7:0]), 
		.arb_qsel0_r_a			(arb6_qsel0_r_a[7:0]), 
		.arb_qsel1_r_a			(arb6_qsel1_r_a[7:0]), 
		.arb_shift_r_a			(arb6_shift_r_a[7:0]), 
		.spc0_pcx_data_a		(spc0_pcx_data_a[129:0]), 
		.spc1_pcx_data_a		(spc1_pcx_data_a[129:0]), 
		.spc2_pcx_data_a		(spc2_pcx_data_a[129:0]), 
		.spc3_pcx_data_a		(spc3_pcx_data_a[129:0]), 
		.spc4_pcx_data_a		(spc4_pcx_data_a[129:0]), 
		.spc5_pcx_data_a		(spc5_pcx_data_a[129:0]), 
		.spc6_pcx_data_a		(spc6_pcx_data_a[129:0]), 
		.spc7_pcx_data_a		(spc7_pcx_data_a[129:0]), 
		.scan_in			(pcx_dps6_scanin), 
		.scan_out			(pcx_dps6_scanout), 
		.l2clk				(l2clk), 
		.ccx_aclk			(ccx_aclk_b), 
		.ccx_bclk			(ccx_bclk_b), 
		.tcu_scan_en			(tcu_scan_en_b), 
		.tcu_pce_ov			(tcu_pce_ov_b));
	pcx_dpsf pcx_dps7(
		.pcx_scache_data_x_		(pcx_scache7_data_x_[129:0]), 
		.arb_grant_l_a			(arb7_grant_l_a[7:0]), 
		.arb_q0_holdbar_l_a		(arb7_q0_holdbar_l_a[7:0]), 
		.arb_qsel0_l_a			(arb7_qsel0_l_a[7:0]), 
		.arb_qsel1_l_a			(arb7_qsel1_l_a[7:0]), 
		.arb_shift_l_a			(arb7_shift_l_a[7:0]), 
		.arb_grant_r_a			(arb7_grant_r_a[7:0]), 
		.arb_q0_holdbar_r_a		(arb7_q0_holdbar_r_a[7:0]), 
		.arb_qsel0_r_a			(arb7_qsel0_r_a[7:0]), 
		.arb_qsel1_r_a			(arb7_qsel1_r_a[7:0]), 
		.arb_shift_r_a			(arb7_shift_r_a[7:0]), 
		.spc0_pcx_data_a		(spc0_pcx_data_a[129:0]), 
		.spc1_pcx_data_a		(spc1_pcx_data_a[129:0]), 
		.spc2_pcx_data_a		(spc2_pcx_data_a[129:0]), 
		.spc3_pcx_data_a		(spc3_pcx_data_a[129:0]), 
		.spc4_pcx_data_a		(spc4_pcx_data_a[129:0]), 
		.spc5_pcx_data_a		(spc5_pcx_data_a[129:0]), 
		.spc6_pcx_data_a		(spc6_pcx_data_a[129:0]), 
		.spc7_pcx_data_a		(spc7_pcx_data_a[129:0]), 
		.scan_in			(pcx_dps7_scanin), 
		.scan_out			(pcx_dps7_scanout), 
		.l2clk				(l2clk), 
		.ccx_aclk			(ccx_aclk_b), 
		.ccx_bclk			(ccx_bclk_b), 
		.tcu_scan_en			(tcu_scan_en_b), 
		.tcu_pce_ov			(tcu_pce_ov_b));
	pcx_dpsa pcx_dps8(
		.pcx_scache_data_x_		(pcx_io_data_x_[129:0]), 
		.arb_grant_l_a			(arb8_grant_l_a[7:0]), 
		.arb_q0_holdbar_l_a		(arb8_q0_holdbar_l_a[7:0]), 
		.arb_qsel0_l_a			(arb8_qsel0_l_a[7:0]), 
		.arb_qsel1_l_a			(arb8_qsel1_l_a[7:0]), 
		.arb_shift_l_a			(arb8_shift_l_a[7:0]), 
		.arb_grant_r_a			(arb8_grant_r_a[7:0]), 
		.arb_q0_holdbar_r_a		(arb8_q0_holdbar_r_a[7:0]), 
		.arb_qsel0_r_a			(arb8_qsel0_r_a[7:0]), 
		.arb_qsel1_r_a			(arb8_qsel1_r_a[7:0]), 
		.arb_shift_r_a			(arb8_shift_r_a[7:0]), 
		.spc0_pcx_data_a		(spc0_pcx_data_a[129:0]), 
		.spc1_pcx_data_a		(spc1_pcx_data_a[129:0]), 
		.spc2_pcx_data_a		(spc2_pcx_data_a[129:0]), 
		.spc3_pcx_data_a		(spc3_pcx_data_a[129:0]), 
		.spc4_pcx_data_a		(spc4_pcx_data_a[129:0]), 
		.spc5_pcx_data_a		(spc5_pcx_data_a[129:0]), 
		.spc6_pcx_data_a		(spc6_pcx_data_a[129:0]), 
		.spc7_pcx_data_a		(spc7_pcx_data_a[129:0]), 
		.scan_in			(pcx_dps8_scanin), 
		.scan_out			(pcx_dps8_scanout), 
		.l2clk				(l2clk), 
		.ccx_aclk			(ccx_aclk_t), 
		.ccx_bclk			(ccx_bclk_t), 
		.tcu_scan_en			(tcu_scan_en_t), 
		.tcu_pce_ov			(tcu_pce_ov_t));
endmodule


`endif // `ifdef FPGA

