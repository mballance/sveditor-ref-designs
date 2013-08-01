// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mmu_trc_ctl.v
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
module mmu_trc_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  htc_tsb_hit_hw1, 
  htc_thr_valid_hw3, 
  htc_ra2pahit_hw5, 
  htc_ranotpax_hw5, 
  tsm_waitfortte, 
  htc_ep_miss_hw1, 
  htc_rrindex_bit0, 
  htc_rrindex_bit1, 
  l2_ecc_err_hw1, 
  cfg_ecc_err_m3, 
  rr_ecc_err_hw5, 
  l2_ecc_err_type, 
  cfg_ecc_err_type, 
  rr_ecc_err_type, 
  cfg_ecc_err_index, 
  rr_ecc_err_index, 
  trs_rqv, 
  trs_null_st, 
  trs_waitrr3_st, 
  trs_ep_err, 
  trs_ecc_err, 
  trs0_err_type, 
  trs1_err_type, 
  trs2_err_type, 
  trs3_err_type, 
  trs4_err_type, 
  trs5_err_type, 
  trs6_err_type, 
  trs7_err_type, 
  trs0_err_index, 
  trs1_err_index, 
  trs2_err_index, 
  trs3_err_index, 
  trs4_err_index, 
  trs5_err_index, 
  trs6_err_index, 
  trs7_err_index, 
  trs_eccerr_st, 
  trs_eperr_st, 
  scan_out);
wire pce_ov;
wire stop;
wire se;
wire siclk;
wire soclk;
wire l1clk;
wire trs0_scanin;
wire trs0_scanout;
wire trs1_scanin;
wire trs1_scanout;
wire trs2_scanin;
wire trs2_scanout;
wire trs3_scanin;
wire trs3_scanout;
wire trs4_scanin;
wire trs4_scanout;
wire trs5_scanin;
wire trs5_scanout;
wire trs6_scanin;
wire trs6_scanout;
wire trs7_scanin;
wire trs7_scanout;
wire spares_scanin;
wire spares_scanout;


input           l2clk;
input           scan_in;
input           tcu_pce_ov;               // scan signals
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;


input [7:0]     htc_tsb_hit_hw1;
input [7:0]     htc_thr_valid_hw3;
input [7:0]     htc_ra2pahit_hw5;
input [7:0]     htc_ranotpax_hw5;
input [7:0]     tsm_waitfortte;
input [7:0]     htc_ep_miss_hw1;
input [7:0]     htc_rrindex_bit0;
input [7:0]     htc_rrindex_bit1;


input [7:0]     l2_ecc_err_hw1;
input [7:0]     cfg_ecc_err_m3;
input [7:0]     rr_ecc_err_hw5;

input [1:0]     l2_ecc_err_type;
input [1:0]     cfg_ecc_err_type;
input [1:0]     rr_ecc_err_type;

input [2:0]     cfg_ecc_err_index;
input [2:0]     rr_ecc_err_index;



output [7:0]    trs_rqv;
output [7:0]    trs_null_st;
output [7:0]    trs_waitrr3_st;
output [7:0]    trs_ep_err;
output [7:0]    trs_ecc_err;
output [2:0]    trs0_err_type;
output [2:0]    trs1_err_type;
output [2:0]    trs2_err_type;
output [2:0]    trs3_err_type;
output [2:0]    trs4_err_type;
output [2:0]    trs5_err_type;
output [2:0]    trs6_err_type;
output [2:0]    trs7_err_type;
output [2:0]    trs0_err_index;
output [2:0]    trs1_err_index;
output [2:0]    trs2_err_index;
output [2:0]    trs3_err_index;
output [2:0]    trs4_err_index;
output [2:0]    trs5_err_index;
output [2:0]    trs6_err_index;
output [2:0]    trs7_err_index;

output [7:0]    trs_eccerr_st;
output [7:0]    trs_eperr_st;

output          scan_out;

assign pce_ov   = tcu_pce_ov;
assign stop = 1'b0;
assign se       = tcu_scan_en;

assign siclk	= spc_aclk;
assign soclk	= spc_bclk;


///////////////////////////////////////////////////
// clock header
///////////////////////////////////////////////////
mmu_trc_ctl_l1clkhdr_ctl_macro clkgen (
 .l2clk(l2clk),
 .l1en (1'b1),
 .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);


/* 
// mmu_trs_ctl  AUTO_TEMPLATE
 (
 .ep_miss_hw1(htc_ep_miss_hw1[@]),
 .rrindex_bit0(htc_rrindex_bit0[@]),
 .rrindex_bit1(htc_rrindex_bit1[@]),
 .l2_ecc_err_hw1(l2_ecc_err_hw1[@]),
 .cfg_ecc_err_m3(cfg_ecc_err_m3[@]),
 .rr_ecc_err_hw5(rr_ecc_err_hw5[@]),
.tsb_hit_hw1(htc_tsb_hit_hw1[@]),
.thr_valid_hw3(htc_thr_valid_hw3[@]),
.tsm_waitfortte(tsm_waitfortte[@]),
.ra2pahit_hw5(htc_ra2pahit_hw5[@]),
.ranotpax_hw5(htc_ranotpax_hw5[@]),
.trs_null_st(trs_null_st[@]),
.trs_waitrr3_st(trs_waitrr3_st[@]),
.trs_rqv(trs_rqv[@]),
.trs_ecc_err(trs_ecc_err[@]),
.trs_ep_err(trs_ecc_err[@]),
.trs_err_type(trs@_err_type[2:0]),
.trs_err_index(trs@_err_index[2:0]),
.trs_eperr_st (trs_eperr_st[@]),
.trs_eccerr_st (trs_eccerr_st[@]),
);
 */

mmu_trs_ctl trs0 (
                  /*AUTOINST*/
                  // Outputs
                  .trs_rqv              (trs_rqv[0]),            // Templated
                  .trs_null_st          (trs_null_st[0]),        // Templated
                  .trs_waitrr3_st       (trs_waitrr3_st[0]),        // Templated
                  .trs_ecc_err          (trs_ecc_err[0]),        // Templated
                  .trs_err_type         (trs0_err_type[2:0]),    // Templated
                  .trs_err_index        (trs0_err_index[2:0]),   // Templated
                  .trs_ep_err           (trs_ep_err[0]),      // Templated
                  .trs_eperr_st         (trs_eperr_st[0]),      // Templated
                  .trs_eccerr_st        (trs_eccerr_st[0]),      // Templated
                  // Inputs
                  .scan_in(trs0_scanin),
                  .scan_out(trs0_scanout),
                  .l1clk                (l1clk),
                  .tsb_hit_hw1          (htc_tsb_hit_hw1[0]),    // Templated
                  .thr_valid_hw3         (htc_thr_valid_hw3[0]),   // Templated
                  .ra2pahit_hw5         (htc_ra2pahit_hw5[0]),   // Templated
                  .ranotpax_hw5         (htc_ranotpax_hw5[0]),   // Templated
                  .tsm_waitfortte       (tsm_waitfortte[0]),     // Templated
                  .ep_miss_hw1          (htc_ep_miss_hw1[0]),     // Templated
                  .rrindex_bit0         (htc_rrindex_bit0[0]),     // Templated
                  .rrindex_bit1         (htc_rrindex_bit1[0]),     // Templated
                  .l2_ecc_err_hw1       (l2_ecc_err_hw1[0]),     // Templated
                  .cfg_ecc_err_m3       (cfg_ecc_err_m3[0]),     // Templated
                  .rr_ecc_err_hw5       (rr_ecc_err_hw5[0]),     // Templated
                  .l2_ecc_err_type      (l2_ecc_err_type[1:0]),
                  .cfg_ecc_err_type     (cfg_ecc_err_type[1:0]),
                  .rr_ecc_err_type      (rr_ecc_err_type[1:0]),
                  .cfg_ecc_err_index    (cfg_ecc_err_index[2:0]),
                  .rr_ecc_err_index     (rr_ecc_err_index[2:0]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));

mmu_trs_ctl trs1 (/*AUTOINST*/
                  // Outputs
                  .trs_rqv              (trs_rqv[1]),            // Templated
                  .trs_null_st          (trs_null_st[1]),        // Templated
                  .trs_waitrr3_st       (trs_waitrr3_st[1]),        // Templated
                  .trs_ecc_err          (trs_ecc_err[1]),        // Templated
                  .trs_err_type         (trs1_err_type[2:0]),    // Templated
                  .trs_err_index        (trs1_err_index[2:0]),   // Templated
                  .trs_ep_err           (trs_ep_err[1]),      // Templated
                  .trs_eperr_st         (trs_eperr_st[1]),      // Templated
                  .trs_eccerr_st        (trs_eccerr_st[1]),      // Templated
                  // Inputs
                  .scan_in(trs1_scanin),
                  .scan_out(trs1_scanout),
                  .l1clk                (l1clk),
                  .tsb_hit_hw1          (htc_tsb_hit_hw1[1]),    // Templated
                  .thr_valid_hw3         (htc_thr_valid_hw3[1]),   // Templated
                  .ra2pahit_hw5         (htc_ra2pahit_hw5[1]),   // Templated
                  .ranotpax_hw5         (htc_ranotpax_hw5[1]),   // Templated
                  .tsm_waitfortte       (tsm_waitfortte[1]),     // Templated
                  .ep_miss_hw1          (htc_ep_miss_hw1[1]),     // Templated
                  .rrindex_bit0         (htc_rrindex_bit0[1]),     // Templated
                  .rrindex_bit1         (htc_rrindex_bit1[1]),     // Templated
                  .l2_ecc_err_hw1       (l2_ecc_err_hw1[1]),     // Templated
                  .cfg_ecc_err_m3       (cfg_ecc_err_m3[1]),     // Templated
                  .rr_ecc_err_hw5       (rr_ecc_err_hw5[1]),     // Templated
                  .l2_ecc_err_type      (l2_ecc_err_type[1:0]),
                  .cfg_ecc_err_type     (cfg_ecc_err_type[1:0]),
                  .rr_ecc_err_type      (rr_ecc_err_type[1:0]),
                  .cfg_ecc_err_index    (cfg_ecc_err_index[2:0]),
                  .rr_ecc_err_index     (rr_ecc_err_index[2:0]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));
mmu_trs_ctl trs2 (
                  /*AUTOINST*/
                  // Outputs
                  .trs_rqv              (trs_rqv[2]),            // Templated
                  .trs_null_st          (trs_null_st[2]),        // Templated
                  .trs_waitrr3_st       (trs_waitrr3_st[2]),        // Templated
                  .trs_ecc_err          (trs_ecc_err[2]),        // Templated
                  .trs_err_type         (trs2_err_type[2:0]),    // Templated
                  .trs_err_index        (trs2_err_index[2:0]),   // Templated
                  .trs_ep_err           (trs_ep_err[2]),      // Templated
                  .trs_eperr_st         (trs_eperr_st[2]),      // Templated
                  .trs_eccerr_st        (trs_eccerr_st[2]),      // Templated
                  // Inputs
                  .scan_in(trs2_scanin),
                  .scan_out(trs2_scanout),
                  .l1clk                (l1clk),
                  .tsb_hit_hw1          (htc_tsb_hit_hw1[2]),    // Templated
                  .thr_valid_hw3         (htc_thr_valid_hw3[2]),   // Templated
                  .ra2pahit_hw5         (htc_ra2pahit_hw5[2]),   // Templated
                  .ranotpax_hw5         (htc_ranotpax_hw5[2]),   // Templated
                  .tsm_waitfortte       (tsm_waitfortte[2]),     // Templated
                  .ep_miss_hw1          (htc_ep_miss_hw1[2]),     // Templated
                  .rrindex_bit0         (htc_rrindex_bit0[2]),     // Templated
                  .rrindex_bit1         (htc_rrindex_bit1[2]),     // Templated
                  .l2_ecc_err_hw1       (l2_ecc_err_hw1[2]),     // Templated
                  .cfg_ecc_err_m3       (cfg_ecc_err_m3[2]),     // Templated
                  .rr_ecc_err_hw5       (rr_ecc_err_hw5[2]),     // Templated
                  .l2_ecc_err_type      (l2_ecc_err_type[1:0]),
                  .cfg_ecc_err_type     (cfg_ecc_err_type[1:0]),
                  .rr_ecc_err_type      (rr_ecc_err_type[1:0]),
                  .cfg_ecc_err_index    (cfg_ecc_err_index[2:0]),
                  .rr_ecc_err_index     (rr_ecc_err_index[2:0]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));
mmu_trs_ctl trs3 (
                  /*AUTOINST*/
                  // Outputs
                  .trs_rqv              (trs_rqv[3]),            // Templated
                  .trs_null_st          (trs_null_st[3]),        // Templated
                  .trs_waitrr3_st       (trs_waitrr3_st[3]),        // Templated
                  .trs_ecc_err          (trs_ecc_err[3]),        // Templated
                  .trs_err_type         (trs3_err_type[2:0]),    // Templated
                  .trs_err_index        (trs3_err_index[2:0]),   // Templated
                  .trs_ep_err           (trs_ep_err[3]),      // Templated
                  .trs_eperr_st         (trs_eperr_st[3]),      // Templated
                  .trs_eccerr_st        (trs_eccerr_st[3]),      // Templated
                  // Inputs
                  .scan_in(trs3_scanin),
                  .scan_out(trs3_scanout),
                  .l1clk                (l1clk),
                  .tsb_hit_hw1          (htc_tsb_hit_hw1[3]),    // Templated
                  .thr_valid_hw3         (htc_thr_valid_hw3[3]),   // Templated
                  .ra2pahit_hw5         (htc_ra2pahit_hw5[3]),   // Templated
                  .ranotpax_hw5         (htc_ranotpax_hw5[3]),   // Templated
                  .tsm_waitfortte       (tsm_waitfortte[3]),     // Templated
                  .ep_miss_hw1          (htc_ep_miss_hw1[3]),     // Templated
                  .rrindex_bit0         (htc_rrindex_bit0[3]),     // Templated
                  .rrindex_bit1         (htc_rrindex_bit1[3]),     // Templated
                  .l2_ecc_err_hw1       (l2_ecc_err_hw1[3]),     // Templated
                  .cfg_ecc_err_m3       (cfg_ecc_err_m3[3]),     // Templated
                  .rr_ecc_err_hw5       (rr_ecc_err_hw5[3]),     // Templated
                  .l2_ecc_err_type      (l2_ecc_err_type[1:0]),
                  .cfg_ecc_err_type     (cfg_ecc_err_type[1:0]),
                  .rr_ecc_err_type      (rr_ecc_err_type[1:0]),
                  .cfg_ecc_err_index    (cfg_ecc_err_index[2:0]),
                  .rr_ecc_err_index     (rr_ecc_err_index[2:0]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));
mmu_trs_ctl trs4 (
                  /*AUTOINST*/
                  // Outputs
                  .trs_rqv              (trs_rqv[4]),            // Templated
                  .trs_null_st          (trs_null_st[4]),        // Templated
                  .trs_waitrr3_st       (trs_waitrr3_st[4]),        // Templated
                  .trs_ecc_err          (trs_ecc_err[4]),        // Templated
                  .trs_err_type         (trs4_err_type[2:0]),    // Templated
                  .trs_err_index        (trs4_err_index[2:0]),   // Templated
                  .trs_ep_err           (trs_ep_err[4]),      // Templated
                  .trs_eperr_st         (trs_eperr_st[4]),      // Templated
                  .trs_eccerr_st        (trs_eccerr_st[4]),      // Templated
                  // Inputs
                  .scan_in(trs4_scanin),
                  .scan_out(trs4_scanout),
                  .l1clk                (l1clk),
                  .tsb_hit_hw1          (htc_tsb_hit_hw1[4]),    // Templated
                  .thr_valid_hw3         (htc_thr_valid_hw3[4]),   // Templated
                  .ra2pahit_hw5         (htc_ra2pahit_hw5[4]),   // Templated
                  .ranotpax_hw5         (htc_ranotpax_hw5[4]),   // Templated
                  .tsm_waitfortte       (tsm_waitfortte[4]),     // Templated
                  .ep_miss_hw1          (htc_ep_miss_hw1[4]),     // Templated
                  .rrindex_bit0         (htc_rrindex_bit0[4]),     // Templated
                  .rrindex_bit1         (htc_rrindex_bit1[4]),     // Templated
                  .l2_ecc_err_hw1       (l2_ecc_err_hw1[4]),     // Templated
                  .cfg_ecc_err_m3       (cfg_ecc_err_m3[4]),     // Templated
                  .rr_ecc_err_hw5       (rr_ecc_err_hw5[4]),     // Templated
                  .l2_ecc_err_type      (l2_ecc_err_type[1:0]),
                  .cfg_ecc_err_type     (cfg_ecc_err_type[1:0]),
                  .rr_ecc_err_type      (rr_ecc_err_type[1:0]),
                  .cfg_ecc_err_index    (cfg_ecc_err_index[2:0]),
                  .rr_ecc_err_index     (rr_ecc_err_index[2:0]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));
mmu_trs_ctl trs5 (
                  /*AUTOINST*/
                  // Outputs
                  .trs_rqv              (trs_rqv[5]),            // Templated
                  .trs_null_st          (trs_null_st[5]),        // Templated
                  .trs_waitrr3_st       (trs_waitrr3_st[5]),        // Templated
                  .trs_ecc_err          (trs_ecc_err[5]),        // Templated
                  .trs_err_type         (trs5_err_type[2:0]),    // Templated
                  .trs_err_index        (trs5_err_index[2:0]),   // Templated
                  .trs_ep_err           (trs_ep_err[5]),      // Templated
                  .trs_eperr_st         (trs_eperr_st[5]),      // Templated
                  .trs_eccerr_st        (trs_eccerr_st[5]),      // Templated
                  // Inputs
                  .scan_in(trs5_scanin),
                  .scan_out(trs5_scanout),
                  .l1clk                (l1clk),
                  .tsb_hit_hw1          (htc_tsb_hit_hw1[5]),    // Templated
                  .thr_valid_hw3         (htc_thr_valid_hw3[5]),   // Templated
                  .ra2pahit_hw5         (htc_ra2pahit_hw5[5]),   // Templated
                  .ranotpax_hw5         (htc_ranotpax_hw5[5]),   // Templated
                  .tsm_waitfortte       (tsm_waitfortte[5]),     // Templated
                  .ep_miss_hw1          (htc_ep_miss_hw1[5]),     // Templated
                  .rrindex_bit0         (htc_rrindex_bit0[5]),     // Templated
                  .rrindex_bit1         (htc_rrindex_bit1[5]),     // Templated
                  .l2_ecc_err_hw1       (l2_ecc_err_hw1[5]),     // Templated
                  .cfg_ecc_err_m3       (cfg_ecc_err_m3[5]),     // Templated
                  .rr_ecc_err_hw5       (rr_ecc_err_hw5[5]),     // Templated
                  .l2_ecc_err_type      (l2_ecc_err_type[1:0]),
                  .cfg_ecc_err_type     (cfg_ecc_err_type[1:0]),
                  .rr_ecc_err_type      (rr_ecc_err_type[1:0]),
                  .cfg_ecc_err_index    (cfg_ecc_err_index[2:0]),
                  .rr_ecc_err_index     (rr_ecc_err_index[2:0]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));
mmu_trs_ctl trs6 (
                  /*AUTOINST*/
                  // Outputs
                  .trs_rqv              (trs_rqv[6]),            // Templated
                  .trs_null_st          (trs_null_st[6]),        // Templated
                  .trs_waitrr3_st       (trs_waitrr3_st[6]),        // Templated
                  .trs_ecc_err          (trs_ecc_err[6]),        // Templated
                  .trs_err_type         (trs6_err_type[2:0]),    // Templated
                  .trs_err_index        (trs6_err_index[2:0]),   // Templated
                  .trs_ep_err           (trs_ep_err[6]),      // Templated
                  .trs_eperr_st         (trs_eperr_st[6]),      // Templated
                  .trs_eccerr_st        (trs_eccerr_st[6]),      // Templated
                  // Inputs
                  .scan_in(trs6_scanin),
                  .scan_out(trs6_scanout),
                  .l1clk                (l1clk),
                  .tsb_hit_hw1          (htc_tsb_hit_hw1[6]),    // Templated
                  .thr_valid_hw3         (htc_thr_valid_hw3[6]),   // Templated
                  .ra2pahit_hw5         (htc_ra2pahit_hw5[6]),   // Templated
                  .ranotpax_hw5         (htc_ranotpax_hw5[6]),   // Templated
                  .tsm_waitfortte       (tsm_waitfortte[6]),     // Templated
                  .ep_miss_hw1          (htc_ep_miss_hw1[6]),     // Templated
                  .rrindex_bit0         (htc_rrindex_bit0[6]),     // Templated
                  .rrindex_bit1         (htc_rrindex_bit1[6]),     // Templated
                  .l2_ecc_err_hw1       (l2_ecc_err_hw1[6]),     // Templated
                  .cfg_ecc_err_m3       (cfg_ecc_err_m3[6]),     // Templated
                  .rr_ecc_err_hw5       (rr_ecc_err_hw5[6]),     // Templated
                  .l2_ecc_err_type      (l2_ecc_err_type[1:0]),
                  .cfg_ecc_err_type     (cfg_ecc_err_type[1:0]),
                  .rr_ecc_err_type      (rr_ecc_err_type[1:0]),
                  .cfg_ecc_err_index    (cfg_ecc_err_index[2:0]),
                  .rr_ecc_err_index     (rr_ecc_err_index[2:0]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));
mmu_trs_ctl trs7 (
                  /*AUTOINST*/
                  // Outputs
                  .trs_rqv              (trs_rqv[7]),            // Templated
                  .trs_null_st          (trs_null_st[7]),        // Templated
                  .trs_waitrr3_st       (trs_waitrr3_st[7]),        // Templated
                  .trs_ecc_err          (trs_ecc_err[7]),        // Templated
                  .trs_err_type         (trs7_err_type[2:0]),    // Templated
                  .trs_err_index        (trs7_err_index[2:0]),   // Templated
                  .trs_ep_err           (trs_ep_err[7]),      // Templated
                  .trs_eperr_st         (trs_eperr_st[7]),      // Templated
                  .trs_eccerr_st        (trs_eccerr_st[7]),      // Templated
                  // Inputs
                  .scan_in(trs7_scanin),
                  .scan_out(trs7_scanout),
                  .l1clk                (l1clk),
                  .tsb_hit_hw1          (htc_tsb_hit_hw1[7]),    // Templated
                  .thr_valid_hw3         (htc_thr_valid_hw3[7]),   // Templated
                  .ra2pahit_hw5         (htc_ra2pahit_hw5[7]),   // Templated
                  .ranotpax_hw5         (htc_ranotpax_hw5[7]),   // Templated
                  .tsm_waitfortte       (tsm_waitfortte[7]),     // Templated
                  .ep_miss_hw1          (htc_ep_miss_hw1[7]),     // Templated
                  .rrindex_bit0         (htc_rrindex_bit0[7]),     // Templated
                  .rrindex_bit1         (htc_rrindex_bit1[7]),     // Templated
                  .l2_ecc_err_hw1       (l2_ecc_err_hw1[7]),     // Templated
                  .cfg_ecc_err_m3       (cfg_ecc_err_m3[7]),     // Templated
                  .rr_ecc_err_hw5       (rr_ecc_err_hw5[7]),     // Templated
                  .l2_ecc_err_type      (l2_ecc_err_type[1:0]),
                  .cfg_ecc_err_type     (cfg_ecc_err_type[1:0]),
                  .rr_ecc_err_type      (rr_ecc_err_type[1:0]),
                  .cfg_ecc_err_index    (cfg_ecc_err_index[2:0]),
                  .rr_ecc_err_index     (rr_ecc_err_index[2:0]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));

////////////////////////////////////////////////////////
// SPARE CELLS
////////////////////////////////////////////////////////
mmu_trc_ctl_spare_ctl_macro__num_2 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
////////////////////////////////////////////////////////

// fixscan start:
assign trs0_scanin               = scan_in                  ;
assign trs1_scanin               = trs0_scanout             ;
assign trs2_scanin               = trs1_scanout             ;
assign trs3_scanin               = trs2_scanout             ;
assign trs4_scanin               = trs3_scanout             ;
assign trs5_scanin               = trs4_scanout             ;
assign trs6_scanin               = trs5_scanout             ;
assign trs7_scanin               = trs6_scanout             ;
assign spares_scanin             = trs7_scanout             ;
assign scan_out                  = spares_scanout           ;

// fixscan end:
endmodule

// Local Variables:
// verilog-library-directories:("." "v")
// End:






// any PARAMS parms go into naming of macro

module mmu_trc_ctl_l1clkhdr_ctl_macro (
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

module mmu_trc_ctl_msff_ctl_macro__width_1 (
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

module mmu_trc_ctl_msff_ctl_macro__width_3 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module mmu_trc_ctl_spare_ctl_macro__num_2 (
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
assign scan_out = so_1;



endmodule

