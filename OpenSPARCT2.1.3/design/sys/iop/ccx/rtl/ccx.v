// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccx.v
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
module ccx (
  cmp_gclk_c2_ccx_left, 
  cmp_gclk_c2_ccx_right, 
  scan_in, 
  tcu_pce_ov, 
  gl_ccx_clk_stop_left, 
  gl_ccx_clk_stop_right, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  cluster_arst_l, 
  tcu_atpg_mode, 
  scan_out, 
  cpu_rep0_in, 
  cpu_rep0_out, 
  cpu_rep1_in, 
  cpu_rep1_out, 
  ccx_lstg_in, 
  ccx_lstg_out, 
  ccx_rstg_in, 
  ccx_rstg_out, 
  spc0_pcx_data_pa, 
  spc0_pcx_req_pq, 
  spc0_pcx_atm_pq, 
  spc1_pcx_data_pa, 
  spc1_pcx_req_pq, 
  spc1_pcx_atm_pq, 
  spc2_pcx_data_pa, 
  spc2_pcx_req_pq, 
  spc2_pcx_atm_pq, 
  spc3_pcx_data_pa, 
  spc3_pcx_req_pq, 
  spc3_pcx_atm_pq, 
  spc4_pcx_data_pa, 
  spc4_pcx_req_pq, 
  spc4_pcx_atm_pq, 
  spc5_pcx_data_pa, 
  spc5_pcx_req_pq, 
  spc5_pcx_atm_pq, 
  spc6_pcx_data_pa, 
  spc6_pcx_req_pq, 
  spc6_pcx_atm_pq, 
  spc7_pcx_data_pa, 
  spc7_pcx_req_pq, 
  spc7_pcx_atm_pq, 
  io_pcx_stall_pq, 
  sctag0_pcx_stall_pq, 
  sctag1_pcx_stall_pq, 
  sctag2_pcx_stall_pq, 
  sctag3_pcx_stall_pq, 
  sctag4_pcx_stall_pq, 
  sctag5_pcx_stall_pq, 
  sctag6_pcx_stall_pq, 
  sctag7_pcx_stall_pq, 
  pcx_spc0_grant_px, 
  pcx_spc1_grant_px, 
  pcx_spc2_grant_px, 
  pcx_spc3_grant_px, 
  pcx_spc4_grant_px, 
  pcx_spc5_grant_px, 
  pcx_spc6_grant_px, 
  pcx_spc7_grant_px, 
  pcx_fpio_data_px2, 
  pcx_fpio_data_rdy_px1, 
  pcx_sctag0_atm_px1, 
  pcx_sctag0_data_px2, 
  pcx_sctag0_data_rdy_px1, 
  pcx_sctag1_atm_px1, 
  pcx_sctag1_data_px2, 
  pcx_sctag1_data_rdy_px1, 
  pcx_sctag2_atm_px1, 
  pcx_sctag2_data_px2, 
  pcx_sctag2_data_rdy_px1, 
  pcx_sctag3_atm_px1, 
  pcx_sctag3_data_px2, 
  pcx_sctag3_data_rdy_px1, 
  pcx_sctag4_atm_px1, 
  pcx_sctag4_data_px2, 
  pcx_sctag4_data_rdy_px1, 
  pcx_sctag5_atm_px1, 
  pcx_sctag5_data_px2, 
  pcx_sctag5_data_rdy_px1, 
  pcx_sctag6_atm_px1, 
  pcx_sctag6_data_px2, 
  pcx_sctag6_data_rdy_px1, 
  pcx_sctag7_atm_px1, 
  pcx_sctag7_data_px2, 
  pcx_sctag7_data_rdy_px1, 
  io_cpx_data_ca, 
  io_cpx_req_cq, 
  sctag0_cpx_atom_cq, 
  sctag0_cpx_data_ca, 
  sctag0_cpx_req_cq, 
  sctag1_cpx_atom_cq, 
  sctag1_cpx_data_ca, 
  sctag1_cpx_req_cq, 
  sctag2_cpx_atom_cq, 
  sctag2_cpx_data_ca, 
  sctag2_cpx_req_cq, 
  sctag3_cpx_atom_cq, 
  sctag3_cpx_data_ca, 
  sctag3_cpx_req_cq, 
  sctag4_cpx_atom_cq, 
  sctag4_cpx_data_ca, 
  sctag4_cpx_req_cq, 
  sctag5_cpx_atom_cq, 
  sctag5_cpx_data_ca, 
  sctag5_cpx_req_cq, 
  sctag6_cpx_atom_cq, 
  sctag6_cpx_data_ca, 
  sctag6_cpx_req_cq, 
  sctag7_cpx_atom_cq, 
  sctag7_cpx_data_ca, 
  sctag7_cpx_req_cq, 
  cpx_io_grant_cx, 
  cpx_sctag0_grant_cx, 
  cpx_sctag1_grant_cx, 
  cpx_sctag2_grant_cx, 
  cpx_sctag3_grant_cx, 
  cpx_sctag4_grant_cx, 
  cpx_sctag5_grant_cx, 
  cpx_sctag6_grant_cx, 
  cpx_sctag7_grant_cx, 
  cpx_spc0_data_cx2, 
  cpx_spc1_data_cx2, 
  cpx_spc2_data_cx2, 
  cpx_spc3_data_cx2, 
  cpx_spc4_data_cx2, 
  cpx_spc5_data_cx2, 
  cpx_spc6_data_cx2, 
  cpx_spc7_data_cx2);
wire [1:0] scan_in_buf;
wire tcu_pce_ov_buf;
wire tcu_aclk_buf;
wire tcu_bclk_buf;
wire tcu_scan_en_buf;
wire cluster_arst_l_buf;
wire tcu_atpg_mode_buf;
wire array_wr_inhibit_unused;
wire l2clk;
wire ccx_aclk;
wire ccx_bclk;
wire clkgen_scanout;
wire tcu_pce_ov_r;
wire aclk_wmr_r_unused;
wire wmr_protect_r_unused;
wire wmr_r_unused;
wire por_r_unused;
wire cmp_slow_sync_en_r_unused;
wire slow_cmp_sync_en_r_unused;
wire scan_out_0;
wire pcx_scan_out;
wire tstgl_scan_out;
wire scan_out_1;


// globals
//input           gclk;                // PINDEF:RIGHT     
input           cmp_gclk_c2_ccx_left;                // PINDEF:RIGHT     
input           cmp_gclk_c2_ccx_right;                // PINDEF:RIGHT     
input  [1:0]         scan_in;              // PINDEF:RIGHT      arc=l2clk:30 cap=20
input           tcu_pce_ov;           // PINDEF:RIGHT      arc=l2clk:30 cap=20
//input           tcu_clk_stop;         // PINDEF:RIGHT      arc=l2clk:30 cap=20
input           gl_ccx_clk_stop_left;         // PINDEF:RIGHT      arc=l2clk:30 cap=20
input           gl_ccx_clk_stop_right;         // PINDEF:RIGHT      arc=l2clk:30 cap=20
input           tcu_aclk;         // PINDEF:RIGHT
input           tcu_bclk;         // PINDEF:RIGHT
input           tcu_scan_en;      // PINDEF:RIGHT
input           cluster_arst_l;	  // PINDEF:RIGHT	
input           tcu_atpg_mode;	  // PINDEF:RIGHT	
output [1:0]         scan_out;             // PINDEF:LEFT      arc=l2clk:30 cap=20

// top level repeater ports

input [191:0]   cpu_rep0_in;
output [191:0]  cpu_rep0_out;

input [191:0]   cpu_rep1_in;
output [191:0]  cpu_rep1_out;

// TOP LEVEL STAGING FLOPS
input [159:0]   ccx_lstg_in;
output [159:0]   ccx_lstg_out;

input [159:0]   ccx_rstg_in;
output [159:0]   ccx_rstg_out;

// inputs from sparc core to pcx
input [129:0]   spc0_pcx_data_pa;      // PINDEF:TOP      arc=l2clk:100 cap=20
input [8:0]     spc0_pcx_req_pq;       // PINDEF:TOP      arc=l2clk:50  cap=20
input [8:0]     spc0_pcx_atm_pq;       // PINDEF:TOP      arc=l2clk:50  cap=20
input [129:0]   spc1_pcx_data_pa;      // PINDEF:TOP      arc=l2clk:100 cap=20
input [8:0]     spc1_pcx_req_pq;       // PINDEF:TOP      arc=l2clk:50  cap=20
input [8:0]     spc1_pcx_atm_pq;       // PINDEF:TOP      arc=l2clk:50  cap=20
input [129:0]   spc2_pcx_data_pa;      // PINDEF:BOT      arc=l2clk:100 cap=20
input [8:0]     spc2_pcx_req_pq;       // PINDEF:BOT      arc=l2clk:50  cap=20
input [8:0]     spc2_pcx_atm_pq;       // PINDEF:BOT      arc=l2clk:50  cap=20
input [129:0]   spc3_pcx_data_pa;      // PINDEF:BOT      arc=l2clk:100 cap=20
input [8:0]     spc3_pcx_req_pq;       // PINDEF:BOT      arc=l2clk:50  cap=20
input [8:0]     spc3_pcx_atm_pq;       // PINDEF:BOT      arc=l2clk:50  cap=20
input [129:0]   spc4_pcx_data_pa;      // PINDEF:TOP      arc=l2clk:100 cap=20
input [8:0]     spc4_pcx_req_pq;       // PINDEF:TOP      arc=l2clk:50  cap=20
input [8:0]     spc4_pcx_atm_pq;       // PINDEF:TOP      arc=l2clk:50  cap=20
input [129:0]   spc5_pcx_data_pa;      // PINDEF:TOP      arc=l2clk:100 cap=20
input [8:0]     spc5_pcx_req_pq;       // PINDEF:TOP      arc=l2clk:50  cap=20
input [8:0]     spc5_pcx_atm_pq;       // PINDEF:TOP      arc=l2clk:50  cap=20
input [129:0]   spc6_pcx_data_pa;      // PINDEF:BOT      arc=l2clk:100 cap=20
input [8:0]     spc6_pcx_req_pq;       // PINDEF:BOT      arc=l2clk:50  cap=20
input [8:0]     spc6_pcx_atm_pq;       // PINDEF:BOT      arc=l2clk:50  cap=20
input [129:0]   spc7_pcx_data_pa;      // PINDEF:BOT      arc=l2clk:100 cap=20
input [8:0]     spc7_pcx_req_pq;       // PINDEF:BOT      arc=l2clk:50  cap=20
input [8:0]     spc7_pcx_atm_pq;       // PINDEF:BOT      arc=l2clk:50  cap=20

// inputs from l2 to pcx
input                   io_pcx_stall_pq;        // PINDEF:TOP      arc=l2clk:50 cap=20
input                   sctag0_pcx_stall_pq;    // PINDEF:TOP      arc=l2clk:50 cap=20
input                   sctag1_pcx_stall_pq;    // PINDEF:TOP      arc=l2clk:50 cap=20
input                   sctag2_pcx_stall_pq;    // PINDEF:BOT      arc=l2clk:50 cap=20
input                   sctag3_pcx_stall_pq;    // PINDEF:BOT      arc=l2clk:50 cap=20
input                   sctag4_pcx_stall_pq;    // PINDEF:TOP      arc=l2clk:50 cap=20
input                   sctag5_pcx_stall_pq;    // PINDEF:TOP      arc=l2clk:50 cap=20
input                   sctag6_pcx_stall_pq;    // PINDEF:BOT      arc=l2clk:50 cap=20
input                   sctag7_pcx_stall_pq;    // PINDEF:BOT      arc=l2clk:50 cap=20


// outputs from pcx to sparc core
output [8:0]            pcx_spc0_grant_px;      // PINDEF:TOP      arc=l2clk:100 drv=32x
output [8:0]            pcx_spc1_grant_px;      // PINDEF:TOP      arc=l2clk:100 drv=32x
output [8:0]            pcx_spc2_grant_px;      // PINDEF:BOT      arc=l2clk:100 drv=32x
output [8:0]            pcx_spc3_grant_px;      // PINDEF:BOT      arc=l2clk:100 drv=32x
output [8:0]            pcx_spc4_grant_px;      // PINDEF:TOP      arc=l2clk:100 drv=32x
output [8:0]            pcx_spc5_grant_px;      // PINDEF:TOP      arc=l2clk:100 drv=32x
output [8:0]            pcx_spc6_grant_px;      // PINDEF:BOT      arc=l2clk:100 drv=32x
output [8:0]            pcx_spc7_grant_px;      // PINDEF:BOT      arc=l2clk:100 drv=32x


// outputs from pcx to l2
output [129:0]          pcx_fpio_data_px2;              // PINDEF:TOP      arc=l2clk:100 drv=32x
output                  pcx_fpio_data_rdy_px1;          // PINDEF:TOP      arc=l2clk:100 drv=32x
output                  pcx_sctag0_atm_px1;             // PINDEF:TOP      arc=l2clk:100 drv=32x
output [129:0]          pcx_sctag0_data_px2;            // PINDEF:TOP      arc=l2clk:100 drv=32x
output                  pcx_sctag0_data_rdy_px1;        // PINDEF:TOP      arc=l2clk:100 drv=32x
output                  pcx_sctag1_atm_px1;             // PINDEF:TOP      arc=l2clk:100 drv=32x
output [129:0]          pcx_sctag1_data_px2;            // PINDEF:TOP      arc=l2clk:100 drv=32x
output                  pcx_sctag1_data_rdy_px1;        // PINDEF:TOP      arc=l2clk:100 drv=32x
output                  pcx_sctag2_atm_px1;             // PINDEF:BOT      arc=l2clk:100 drv=32x
output [129:0]          pcx_sctag2_data_px2;            // PINDEF:BOT      arc=l2clk:100 drv=32x
output                  pcx_sctag2_data_rdy_px1;        // PINDEF:BOT      arc=l2clk:100 drv=32x
output                  pcx_sctag3_atm_px1;             // PINDEF:BOT      arc=l2clk:100 drv=32x
output [129:0]          pcx_sctag3_data_px2;            // PINDEF:BOT      arc=l2clk:100 drv=32x
output                  pcx_sctag3_data_rdy_px1;        // PINDEF:BOT      arc=l2clk:100 drv=32x
output                  pcx_sctag4_atm_px1;             // PINDEF:TOP      arc=l2clk:100 drv=32x
output [129:0]          pcx_sctag4_data_px2;            // PINDEF:TOP      arc=l2clk:100 drv=32x
output                  pcx_sctag4_data_rdy_px1;        // PINDEF:TOP      arc=l2clk:100 drv=32x
output                  pcx_sctag5_atm_px1;             // PINDEF:TOP      arc=l2clk:100 drv=32x
output [129:0]          pcx_sctag5_data_px2;            // PINDEF:TOP      arc=l2clk:100 drv=32x
output                  pcx_sctag5_data_rdy_px1;        // PINDEF:TOP      arc=l2clk:100 drv=32x
output                  pcx_sctag6_atm_px1;             // PINDEF:BOT      arc=l2clk:100 drv=32x
output [129:0]          pcx_sctag6_data_px2;            // PINDEF:BOT      arc=l2clk:100 drv=32x
output                  pcx_sctag6_data_rdy_px1;        // PINDEF:BOT      arc=l2clk:100 drv=32x
output                  pcx_sctag7_atm_px1;             // PINDEF:BOT      arc=l2clk:100 drv=32x
output [129:0]          pcx_sctag7_data_px2;            // PINDEF:BOT      arc=l2clk:100 drv=32x
output                  pcx_sctag7_data_rdy_px1;        // PINDEF:BOT      arc=l2clk:100 drv=32x


// inputs from l2 to cpx
input [145:0]           io_cpx_data_ca;         // PINDEF:TOP      arc=l2clk:100 cap=20
input [7:0]             io_cpx_req_cq;          // PINDEF:TOP      arc=l2clk:50  cap=20
input                   sctag0_cpx_atom_cq;     // PINDEF:TOP      arc=l2clk:50  cap=20
input [145:0]           sctag0_cpx_data_ca;     // PINDEF:TOP      arc=l2clk:100 cap=20
input [7:0]             sctag0_cpx_req_cq;      // PINDEF:TOP      arc=l2clk:50  cap=20
input                   sctag1_cpx_atom_cq;     // PINDEF:TOP      arc=l2clk:50  cap=20
input [145:0]           sctag1_cpx_data_ca;     // PINDEF:TOP      arc=l2clk:100 cap=20
input [7:0]             sctag1_cpx_req_cq;      // PINDEF:BOT      arc=l2clk:50  cap=20
input                   sctag2_cpx_atom_cq;     // PINDEF:BOT      arc=l2clk:50  cap=20
input [145:0]           sctag2_cpx_data_ca;     // PINDEF:BOT      arc=l2clk:100 cap=20
input [7:0]             sctag2_cpx_req_cq;      // PINDEF:BOT      arc=l2clk:50  cap=20
input                   sctag3_cpx_atom_cq;     // PINDEF:BOT      arc=l2clk:50  cap=20
input [145:0]           sctag3_cpx_data_ca;     // PINDEF:BOT      arc=l2clk:100 cap=20
input [7:0]             sctag3_cpx_req_cq;      // PINDEF:TOP      arc=l2clk:50  cap=20
input                   sctag4_cpx_atom_cq;     // PINDEF:TOP      arc=l2clk:50  cap=20
input [145:0]           sctag4_cpx_data_ca;     // PINDEF:TOP      arc=l2clk:100 cap=20
input [7:0]             sctag4_cpx_req_cq;      // PINDEF:TOP      arc=l2clk:50  cap=20
input                   sctag5_cpx_atom_cq;     // PINDEF:TOP      arc=l2clk:50  cap=20
input [145:0]           sctag5_cpx_data_ca;     // PINDEF:TOP      arc=l2clk:100 cap=20
input [7:0]             sctag5_cpx_req_cq;      // PINDEF:TOP      arc=l2clk:50  cap=20
input                   sctag6_cpx_atom_cq;     // PINDEF:BOT      arc=l2clk:50  cap=20
input [145:0]           sctag6_cpx_data_ca;     // PINDEF:BOT      arc=l2clk:100 cap=20
input [7:0]             sctag6_cpx_req_cq;      // PINDEF:BOT      arc=l2clk:50  cap=20
input                   sctag7_cpx_atom_cq;     // PINDEF:BOT      arc=l2clk:50  cap=20
input [145:0]           sctag7_cpx_data_ca;     // PINDEF:BOT      arc=l2clk:100 cap=20
input [7:0]             sctag7_cpx_req_cq;      // PINDEF:BOT      arc=l2clk:50  cap=20


// outputs from cpx to l2
output [7:0]            cpx_io_grant_cx;        // PINDEF:TOP      arc=l2clk:100 drv=32x
output [7:0]            cpx_sctag0_grant_cx;    // PINDEF:TOP      arc=l2clk:100 drv=32x
output [7:0]            cpx_sctag1_grant_cx;    // PINDEF:TOP      arc=l2clk:100 drv=32x
output [7:0]            cpx_sctag2_grant_cx;    // PINDEF:BOT      arc=l2clk:100 drv=32x
output [7:0]            cpx_sctag3_grant_cx;    // PINDEF:BOT      arc=l2clk:100 drv=32x
output [7:0]            cpx_sctag4_grant_cx;    // PINDEF:TOP      arc=l2clk:100 drv=32x
output [7:0]            cpx_sctag5_grant_cx;    // PINDEF:TOP      arc=l2clk:100 drv=32x
output [7:0]            cpx_sctag6_grant_cx;    // PINDEF:BOT      arc=l2clk:100 drv=32x
output [7:0]            cpx_sctag7_grant_cx;    // PINDEF:BOT      arc=l2clk:100 drv=32x

// outputs from cpx to sparc core
output [145:0]          cpx_spc0_data_cx2;      // PINDEF:TOP      arc=l2clk:100 drv=32x
output [145:0]          cpx_spc1_data_cx2;      // PINDEF:TOP      arc=l2clk:100 drv=32x
output [145:0]          cpx_spc2_data_cx2;      // PINDEF:BOT      arc=l2clk:100 drv=32x
output [145:0]          cpx_spc3_data_cx2;      // PINDEF:BOT      arc=l2clk:100 drv=32x
output [145:0]          cpx_spc4_data_cx2;      // PINDEF:TOP      arc=l2clk:100 drv=32x
output [145:0]          cpx_spc5_data_cx2;      // PINDEF:TOP      arc=l2clk:100 drv=32x
output [145:0]          cpx_spc6_data_cx2;      // PINDEF:BOT      arc=l2clk:100 drv=32x
output [145:0]          cpx_spc7_data_cx2;      // PINDEF:BOT      arc=l2clk:100 drv=32x


// isolation buffer for test/scan/clk signals

ccx_buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_buf_test_r     (
	.din	({scan_in[1:0],tcu_pce_ov, tcu_aclk, 
              tcu_bclk, tcu_scan_en, cluster_arst_l,tcu_atpg_mode}),
	.dout	({scan_in_buf[1:0],tcu_pce_ov_buf,tcu_aclk_buf, 
              tcu_bclk_buf, tcu_scan_en_buf, cluster_arst_l_buf,tcu_atpg_mode_buf})
);


clkgen_ccx_cmp clk_ccx
(
 .array_wr_inhibit(array_wr_inhibit_unused),
 .tcu_atpg_mode(tcu_atpg_mode_buf),
 .tcu_wr_inhibit(1'b0),
 .l2clk(l2clk),
 .aclk(ccx_aclk),
 .bclk(ccx_bclk),
 .scan_out(clkgen_scanout),
 .pce_ov(tcu_pce_ov_r),
 .aclk_wmr(aclk_wmr_r_unused),
 .wmr_protect(wmr_protect_r_unused),
 .wmr_(wmr_r_unused),
 .por_(por_r_unused),
 .cmp_slow_sync_en(cmp_slow_sync_en_r_unused),
 .slow_cmp_sync_en(slow_cmp_sync_en_r_unused),
 .tcu_clk_stop_left(gl_ccx_clk_stop_left),
 .tcu_clk_stop_right(gl_ccx_clk_stop_right),
 .tcu_pce_ov(tcu_pce_ov_buf),
 .rst_wmr_protect(1'b0),
 .rst_wmr_(1'b1),
 .rst_por_(1'b1),
 .ccu_cmp_slow_sync_en(1'b0),
 .ccu_slow_cmp_sync_en(1'b0),
 .tcu_div_bypass_left(1'b0),
 .tcu_div_bypass_right(1'b0),
 .ccu_div_ph(1'b1),
 .cluster_div_en(1'b0),
 .gclk_left(cmp_gclk_c2_ccx_left),
 .gclk_right(cmp_gclk_c2_ccx_right),
 .cluster_arst_l_left(cluster_arst_l_buf),
 .cluster_arst_l_right(cluster_arst_l_buf),
 .clk_ext(1'b0),
 .ccu_serdes_dtm(1'b0),
 .tcu_aclk(tcu_aclk_buf),
 .tcu_bclk(tcu_bclk_buf),
 .scan_en(tcu_scan_en_buf),
 .scan_in(scan_in_buf[0]) 
 );
                       
//assign cmp_gclk_c2_ccx_left_unused = cmp_gclk_c2_ccx_left;
//assign gl_ccx_clk_stop_left_unused = gl_ccx_clk_stop_left;


/*
 cpx AUTO_TEMPLATE(
 .cpx_spc0_data_cx2 (spc0_data_cx2[149:0]),
 .cpx_spc1_data_cx2 (spc1_data_cx2[149:0]),
 .cpx_spc2_data_cx2 (spc2_data_cx2[149:0]),
 .cpx_spc3_data_cx2 (spc3_data_cx2[149:0]),
 .cpx_spc4_data_cx2 (spc4_data_cx2[149:0]),
 .cpx_spc5_data_cx2 (spc5_data_cx2[149:0]),
 .cpx_spc6_data_cx2 (spc6_data_cx2[149:0]),
 .cpx_spc7_data_cx2 (spc7_data_cx2[149:0]));
 */
cpx cpx (/*AUTOINST*/
         // Outputs
         .cpx_io_grant_cx               (cpx_io_grant_cx[7:0]),
         .cpx_sctag0_grant_cx           (cpx_sctag0_grant_cx[7:0]),
         .cpx_sctag1_grant_cx           (cpx_sctag1_grant_cx[7:0]),
         .cpx_sctag2_grant_cx           (cpx_sctag2_grant_cx[7:0]),
         .cpx_sctag3_grant_cx           (cpx_sctag3_grant_cx[7:0]),
         .cpx_sctag4_grant_cx           (cpx_sctag4_grant_cx[7:0]),
         .cpx_sctag5_grant_cx           (cpx_sctag5_grant_cx[7:0]),
         .cpx_sctag6_grant_cx           (cpx_sctag6_grant_cx[7:0]),
         .cpx_sctag7_grant_cx           (cpx_sctag7_grant_cx[7:0]),
         .cpx_spc0_data_cx2             (cpx_spc0_data_cx2[145:0]),  // Templated
         .cpx_spc1_data_cx2             (cpx_spc1_data_cx2[145:0]),  // Templated
         .cpx_spc2_data_cx2             (cpx_spc2_data_cx2[145:0]),  // Templated
         .cpx_spc3_data_cx2             (cpx_spc3_data_cx2[145:0]),  // Templated
         .cpx_spc4_data_cx2             (cpx_spc4_data_cx2[145:0]),  // Templated
         .cpx_spc5_data_cx2             (cpx_spc5_data_cx2[145:0]),  // Templated
         .cpx_spc6_data_cx2             (cpx_spc6_data_cx2[145:0]),  // Templated
         .cpx_spc7_data_cx2             (cpx_spc7_data_cx2[145:0]),  // Templated
         // Inputs
         .io_cpx_data_ca                (io_cpx_data_ca[145:0]),
         .io_cpx_req_cq                 (io_cpx_req_cq[7:0]),
         .sctag0_cpx_atom_cq            (sctag0_cpx_atom_cq),
         .sctag0_cpx_data_ca            (sctag0_cpx_data_ca[145:0]),
         .sctag0_cpx_req_cq             (sctag0_cpx_req_cq[7:0]),
         .sctag1_cpx_atom_cq            (sctag1_cpx_atom_cq),
         .sctag1_cpx_data_ca            (sctag1_cpx_data_ca[145:0]),
         .sctag1_cpx_req_cq             (sctag1_cpx_req_cq[7:0]),
         .sctag2_cpx_atom_cq            (sctag2_cpx_atom_cq),
         .sctag2_cpx_data_ca            (sctag2_cpx_data_ca[145:0]),
         .sctag2_cpx_req_cq             (sctag2_cpx_req_cq[7:0]),
         .sctag3_cpx_atom_cq            (sctag3_cpx_atom_cq),
         .sctag3_cpx_data_ca            (sctag3_cpx_data_ca[145:0]),
         .sctag3_cpx_req_cq             (sctag3_cpx_req_cq[7:0]),
         .sctag4_cpx_atom_cq            (sctag4_cpx_atom_cq),
         .sctag4_cpx_data_ca            (sctag4_cpx_data_ca[145:0]),
         .sctag4_cpx_req_cq             (sctag4_cpx_req_cq[7:0]),
         .sctag5_cpx_atom_cq            (sctag5_cpx_atom_cq),
         .sctag5_cpx_data_ca            (sctag5_cpx_data_ca[145:0]),
         .sctag5_cpx_req_cq             (sctag5_cpx_req_cq[7:0]),
         .sctag6_cpx_atom_cq            (sctag6_cpx_atom_cq),
         .sctag6_cpx_data_ca            (sctag6_cpx_data_ca[145:0]),
         .sctag6_cpx_req_cq             (sctag6_cpx_req_cq[7:0]),
         .sctag7_cpx_atom_cq            (sctag7_cpx_atom_cq),
         .sctag7_cpx_data_ca            (sctag7_cpx_data_ca[145:0]),
         .sctag7_cpx_req_cq             (sctag7_cpx_req_cq[7:0]),
         .scan_in(clkgen_scanout),
         .scan_out(scan_out_0),
         .l2clk                         (l2clk),
         .ccx_aclk (ccx_aclk),
         .ccx_bclk (ccx_bclk),
         .tcu_scan_en                   (tcu_scan_en_buf),
         .tcu_pce_ov                    (tcu_pce_ov_r));

pcx pcx (/*AUTOINST*/
         // Outputs
         .pcx_fpio_data_px2             (pcx_fpio_data_px2[129:0]),
         .pcx_fpio_data_rdy_px1         (pcx_fpio_data_rdy_px1),
         .pcx_sctag0_atm_px1            (pcx_sctag0_atm_px1),
         .pcx_sctag0_data_px2           (pcx_sctag0_data_px2[129:0]),
         .pcx_sctag0_data_rdy_px1       (pcx_sctag0_data_rdy_px1),
         .pcx_sctag1_atm_px1            (pcx_sctag1_atm_px1),
         .pcx_sctag1_data_px2           (pcx_sctag1_data_px2[129:0]),
         .pcx_sctag1_data_rdy_px1       (pcx_sctag1_data_rdy_px1),
         .pcx_sctag2_atm_px1            (pcx_sctag2_atm_px1),
         .pcx_sctag2_data_px2           (pcx_sctag2_data_px2[129:0]),
         .pcx_sctag2_data_rdy_px1       (pcx_sctag2_data_rdy_px1),
         .pcx_sctag3_atm_px1            (pcx_sctag3_atm_px1),
         .pcx_sctag3_data_px2           (pcx_sctag3_data_px2[129:0]),
         .pcx_sctag3_data_rdy_px1       (pcx_sctag3_data_rdy_px1),
         .pcx_sctag4_atm_px1            (pcx_sctag4_atm_px1),
         .pcx_sctag4_data_px2           (pcx_sctag4_data_px2[129:0]),
         .pcx_sctag4_data_rdy_px1       (pcx_sctag4_data_rdy_px1),
         .pcx_sctag5_atm_px1            (pcx_sctag5_atm_px1),
         .pcx_sctag5_data_px2           (pcx_sctag5_data_px2[129:0]),
         .pcx_sctag5_data_rdy_px1       (pcx_sctag5_data_rdy_px1),
         .pcx_sctag6_atm_px1            (pcx_sctag6_atm_px1),
         .pcx_sctag6_data_px2           (pcx_sctag6_data_px2[129:0]),
         .pcx_sctag6_data_rdy_px1       (pcx_sctag6_data_rdy_px1),
         .pcx_sctag7_atm_px1            (pcx_sctag7_atm_px1),
         .pcx_sctag7_data_px2           (pcx_sctag7_data_px2[129:0]),
         .pcx_sctag7_data_rdy_px1       (pcx_sctag7_data_rdy_px1),
         .pcx_spc0_grant_px             (pcx_spc0_grant_px[8:0]),
         .pcx_spc1_grant_px             (pcx_spc1_grant_px[8:0]),
         .pcx_spc2_grant_px             (pcx_spc2_grant_px[8:0]),
         .pcx_spc3_grant_px             (pcx_spc3_grant_px[8:0]),
         .pcx_spc4_grant_px             (pcx_spc4_grant_px[8:0]),
         .pcx_spc5_grant_px             (pcx_spc5_grant_px[8:0]),
         .pcx_spc6_grant_px             (pcx_spc6_grant_px[8:0]),
         .pcx_spc7_grant_px             (pcx_spc7_grant_px[8:0]),
         // Inputs
         .io_pcx_stall_pq               (io_pcx_stall_pq),
         .sctag0_pcx_stall_pq           (sctag0_pcx_stall_pq),
         .sctag1_pcx_stall_pq           (sctag1_pcx_stall_pq),
         .sctag2_pcx_stall_pq           (sctag2_pcx_stall_pq),
         .sctag3_pcx_stall_pq           (sctag3_pcx_stall_pq),
         .sctag4_pcx_stall_pq           (sctag4_pcx_stall_pq),
         .sctag5_pcx_stall_pq           (sctag5_pcx_stall_pq),
         .sctag6_pcx_stall_pq           (sctag6_pcx_stall_pq),
         .sctag7_pcx_stall_pq           (sctag7_pcx_stall_pq),
         .spc0_pcx_data_pa              (spc0_pcx_data_pa[129:0]),
         .spc0_pcx_req_pq               (spc0_pcx_req_pq[8:0]),
         .spc0_pcx_atm_pq               (spc0_pcx_atm_pq[8:0]),
         .spc1_pcx_data_pa              (spc1_pcx_data_pa[129:0]),
         .spc1_pcx_req_pq               (spc1_pcx_req_pq[8:0]),
         .spc1_pcx_atm_pq               (spc1_pcx_atm_pq[8:0]),
         .spc2_pcx_data_pa              (spc2_pcx_data_pa[129:0]),
         .spc2_pcx_req_pq               (spc2_pcx_req_pq[8:0]),
         .spc2_pcx_atm_pq               (spc2_pcx_atm_pq[8:0]),
         .spc3_pcx_data_pa              (spc3_pcx_data_pa[129:0]),
         .spc3_pcx_req_pq               (spc3_pcx_req_pq[8:0]),
         .spc3_pcx_atm_pq               (spc3_pcx_atm_pq[8:0]),
         .spc4_pcx_data_pa              (spc4_pcx_data_pa[129:0]),
         .spc4_pcx_req_pq               (spc4_pcx_req_pq[8:0]),
         .spc4_pcx_atm_pq               (spc4_pcx_atm_pq[8:0]),
         .spc5_pcx_data_pa              (spc5_pcx_data_pa[129:0]),
         .spc5_pcx_req_pq               (spc5_pcx_req_pq[8:0]),
         .spc5_pcx_atm_pq               (spc5_pcx_atm_pq[8:0]),
         .spc6_pcx_data_pa              (spc6_pcx_data_pa[129:0]),
         .spc6_pcx_req_pq               (spc6_pcx_req_pq[8:0]),
         .spc6_pcx_atm_pq               (spc6_pcx_atm_pq[8:0]),
         .spc7_pcx_data_pa              (spc7_pcx_data_pa[129:0]),
         .spc7_pcx_req_pq               (spc7_pcx_req_pq[8:0]),
         .spc7_pcx_atm_pq               (spc7_pcx_atm_pq[8:0]),
         .scan_in(scan_in_buf[1]),
         .scan_out(pcx_scan_out),
         .l2clk                         (l2clk),
         .ccx_aclk (ccx_aclk),
         .ccx_bclk (ccx_bclk),
         .tcu_scan_en                   (tcu_scan_en_buf),
         .tcu_pce_ov                    (tcu_pce_ov_r));


// top level repeaters

ccx_trep trep0(
              .cpu_rep_in (cpu_rep0_in[191:0]),
              .cpu_rep_out (cpu_rep0_out[191:0]));

ccx_trep trep1(
              .cpu_rep_in (cpu_rep1_in[191:0]),
              .cpu_rep_out (cpu_rep1_out[191:0]));


// top level staging flops

ccx_tstg tstgl (
	.din	(ccx_lstg_in[159:0]),
	.dout	(ccx_lstg_out[159:0]),
        .local_stop (1'b0),
         .scan_in(pcx_scan_out),
         .scan_out(tstgl_scan_out),
         .l2clk                         (l2clk),
         .tcu_aclk (ccx_aclk),
         .tcu_bclk (ccx_bclk),
         .tcu_scan_en                   (tcu_scan_en_buf),
         .tcu_pce_ov                    (tcu_pce_ov_r));

ccx_tstg tstgr (
	.din	(ccx_rstg_in[159:0]),
	.dout	(ccx_rstg_out[159:0]),
        .local_stop (1'b0),
         .scan_in(tstgl_scan_out),
         .scan_out(scan_out_1),
         .l2clk                         (l2clk),
         .tcu_aclk (ccx_aclk),
         .tcu_bclk (ccx_bclk),
         .tcu_scan_en                   (tcu_scan_en_buf),
         .tcu_pce_ov                    (tcu_pce_ov_r));

// buffer scanout

ccx_buff_macro__dbuff_32x__rep_1__stack_none__width_2 i_buf_scan     (
	.din	({scan_out_1, scan_out_0}),
	.dout	({scan_out[1:0]})
);
                                                               
              

endmodule // ccx

//
//   buff macro
//
//





module ccx_buff_macro__dbuff_32x__rep_1__stack_none__width_8 (
  din,
  dout);
  input [7:0] din;
  output [7:0] dout;






buff #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);


endmodule



//
//   invert macro
//
//



/*

module ccx_inv_macro__dinv_32x__stack_150c__width_150 (
  din, 
  dout);
  input [149:0] din;
  output [149:0] dout;






inv #(150)  d0_0 (
.in(din[149:0]),
.out(dout[149:0])
);









endmodule

*/


//
//   buff macro
//
//





module ccx_buff_macro__dbuff_32x__rep_1__stack_none__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






buff #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);








endmodule

`endif // `ifndef FPGA

`ifdef FPGA
`timescale 1 ns / 100 ps
module ccx(cmp_gclk_c2_ccx_left, cmp_gclk_c2_ccx_right, scan_in, tcu_pce_ov, 
	gl_ccx_clk_stop_left, gl_ccx_clk_stop_right, tcu_aclk, tcu_bclk, 
	tcu_scan_en, cluster_arst_l, tcu_atpg_mode, scan_out, cpu_rep0_in, 
	cpu_rep0_out, cpu_rep1_in, cpu_rep1_out, ccx_lstg_in, ccx_lstg_out, 
	ccx_rstg_in, ccx_rstg_out, spc0_pcx_data_pa, spc0_pcx_req_pq, 
	spc0_pcx_atm_pq, spc1_pcx_data_pa, spc1_pcx_req_pq, spc1_pcx_atm_pq, 
	spc2_pcx_data_pa, spc2_pcx_req_pq, spc2_pcx_atm_pq, spc3_pcx_data_pa, 
	spc3_pcx_req_pq, spc3_pcx_atm_pq, spc4_pcx_data_pa, spc4_pcx_req_pq, 
	spc4_pcx_atm_pq, spc5_pcx_data_pa, spc5_pcx_req_pq, spc5_pcx_atm_pq, 
	spc6_pcx_data_pa, spc6_pcx_req_pq, spc6_pcx_atm_pq, spc7_pcx_data_pa, 
	spc7_pcx_req_pq, spc7_pcx_atm_pq, io_pcx_stall_pq, sctag0_pcx_stall_pq, 
	sctag1_pcx_stall_pq, sctag2_pcx_stall_pq, sctag3_pcx_stall_pq, 
	sctag4_pcx_stall_pq, sctag5_pcx_stall_pq, sctag6_pcx_stall_pq, 
	sctag7_pcx_stall_pq, pcx_spc0_grant_px, pcx_spc1_grant_px, 
	pcx_spc2_grant_px, pcx_spc3_grant_px, pcx_spc4_grant_px, 
	pcx_spc5_grant_px, pcx_spc6_grant_px, pcx_spc7_grant_px, 
	pcx_fpio_data_px2, pcx_fpio_data_rdy_px1, pcx_sctag0_atm_px1, 
	pcx_sctag0_data_px2, pcx_sctag0_data_rdy_px1, pcx_sctag1_atm_px1, 
	pcx_sctag1_data_px2, pcx_sctag1_data_rdy_px1, pcx_sctag2_atm_px1, 
	pcx_sctag2_data_px2, pcx_sctag2_data_rdy_px1, pcx_sctag3_atm_px1, 
	pcx_sctag3_data_px2, pcx_sctag3_data_rdy_px1, pcx_sctag4_atm_px1, 
	pcx_sctag4_data_px2, pcx_sctag4_data_rdy_px1, pcx_sctag5_atm_px1, 
	pcx_sctag5_data_px2, pcx_sctag5_data_rdy_px1, pcx_sctag6_atm_px1, 
	pcx_sctag6_data_px2, pcx_sctag6_data_rdy_px1, pcx_sctag7_atm_px1, 
	pcx_sctag7_data_px2, pcx_sctag7_data_rdy_px1, io_cpx_data_ca, 
	io_cpx_req_cq, sctag0_cpx_atom_cq, sctag0_cpx_data_ca, 
	sctag0_cpx_req_cq, sctag1_cpx_atom_cq, sctag1_cpx_data_ca, 
	sctag1_cpx_req_cq, sctag2_cpx_atom_cq, sctag2_cpx_data_ca, 
	sctag2_cpx_req_cq, sctag3_cpx_atom_cq, sctag3_cpx_data_ca, 
	sctag3_cpx_req_cq, sctag4_cpx_atom_cq, sctag4_cpx_data_ca, 
	sctag4_cpx_req_cq, sctag5_cpx_atom_cq, sctag5_cpx_data_ca, 
	sctag5_cpx_req_cq, sctag6_cpx_atom_cq, sctag6_cpx_data_ca, 
	sctag6_cpx_req_cq, sctag7_cpx_atom_cq, sctag7_cpx_data_ca, 
	sctag7_cpx_req_cq, cpx_io_grant_cx, cpx_sctag0_grant_cx, 
	cpx_sctag1_grant_cx, cpx_sctag2_grant_cx, cpx_sctag3_grant_cx, 
	cpx_sctag4_grant_cx, cpx_sctag5_grant_cx, cpx_sctag6_grant_cx, 
	cpx_sctag7_grant_cx, cpx_spc0_data_cx2, cpx_spc1_data_cx2, 
	cpx_spc2_data_cx2, cpx_spc3_data_cx2, cpx_spc4_data_cx2, 
	cpx_spc5_data_cx2, cpx_spc6_data_cx2, cpx_spc7_data_cx2);

	input			cmp_gclk_c2_ccx_left;
	input			cmp_gclk_c2_ccx_right;
	input	[1:0]		scan_in;
	input			tcu_pce_ov;
	input			gl_ccx_clk_stop_left;
	input			gl_ccx_clk_stop_right;
	input			tcu_aclk;
	input			tcu_bclk;
	input			tcu_scan_en;
	input			cluster_arst_l;
	input			tcu_atpg_mode;
	output	[1:0]		scan_out;
	input	[191:0]		cpu_rep0_in;
	output	[191:0]		cpu_rep0_out;
	input	[191:0]		cpu_rep1_in;
	output	[191:0]		cpu_rep1_out;
	input	[159:0]		ccx_lstg_in;
	output	[159:0]		ccx_lstg_out;
	input	[159:0]		ccx_rstg_in;
	output	[159:0]		ccx_rstg_out;
	input	[129:0]		spc0_pcx_data_pa;
	input	[8:0]		spc0_pcx_req_pq;
	input	[8:0]		spc0_pcx_atm_pq;
	input	[129:0]		spc1_pcx_data_pa;
	input	[8:0]		spc1_pcx_req_pq;
	input	[8:0]		spc1_pcx_atm_pq;
	input	[129:0]		spc2_pcx_data_pa;
	input	[8:0]		spc2_pcx_req_pq;
	input	[8:0]		spc2_pcx_atm_pq;
	input	[129:0]		spc3_pcx_data_pa;
	input	[8:0]		spc3_pcx_req_pq;
	input	[8:0]		spc3_pcx_atm_pq;
	input	[129:0]		spc4_pcx_data_pa;
	input	[8:0]		spc4_pcx_req_pq;
	input	[8:0]		spc4_pcx_atm_pq;
	input	[129:0]		spc5_pcx_data_pa;
	input	[8:0]		spc5_pcx_req_pq;
	input	[8:0]		spc5_pcx_atm_pq;
	input	[129:0]		spc6_pcx_data_pa;
	input	[8:0]		spc6_pcx_req_pq;
	input	[8:0]		spc6_pcx_atm_pq;
	input	[129:0]		spc7_pcx_data_pa;
	input	[8:0]		spc7_pcx_req_pq;
	input	[8:0]		spc7_pcx_atm_pq;
	input			io_pcx_stall_pq;
	input			sctag0_pcx_stall_pq;
	input			sctag1_pcx_stall_pq;
	input			sctag2_pcx_stall_pq;
	input			sctag3_pcx_stall_pq;
	input			sctag4_pcx_stall_pq;
	input			sctag5_pcx_stall_pq;
	input			sctag6_pcx_stall_pq;
	input			sctag7_pcx_stall_pq;
	output	[8:0]		pcx_spc0_grant_px;
	output	[8:0]		pcx_spc1_grant_px;
	output	[8:0]		pcx_spc2_grant_px;
	output	[8:0]		pcx_spc3_grant_px;
	output	[8:0]		pcx_spc4_grant_px;
	output	[8:0]		pcx_spc5_grant_px;
	output	[8:0]		pcx_spc6_grant_px;
	output	[8:0]		pcx_spc7_grant_px;
	output	[129:0]		pcx_fpio_data_px2;
	output			pcx_fpio_data_rdy_px1;
	output			pcx_sctag0_atm_px1;
	output	[129:0]		pcx_sctag0_data_px2;
	output			pcx_sctag0_data_rdy_px1;
	output			pcx_sctag1_atm_px1;
	output	[129:0]		pcx_sctag1_data_px2;
	output			pcx_sctag1_data_rdy_px1;
	output			pcx_sctag2_atm_px1;
	output	[129:0]		pcx_sctag2_data_px2;
	output			pcx_sctag2_data_rdy_px1;
	output			pcx_sctag3_atm_px1;
	output	[129:0]		pcx_sctag3_data_px2;
	output			pcx_sctag3_data_rdy_px1;
	output			pcx_sctag4_atm_px1;
	output	[129:0]		pcx_sctag4_data_px2;
	output			pcx_sctag4_data_rdy_px1;
	output			pcx_sctag5_atm_px1;
	output	[129:0]		pcx_sctag5_data_px2;
	output			pcx_sctag5_data_rdy_px1;
	output			pcx_sctag6_atm_px1;
	output	[129:0]		pcx_sctag6_data_px2;
	output			pcx_sctag6_data_rdy_px1;
	output			pcx_sctag7_atm_px1;
	output	[129:0]		pcx_sctag7_data_px2;
	output			pcx_sctag7_data_rdy_px1;
	input	[145:0]		io_cpx_data_ca;
	input	[7:0]		io_cpx_req_cq;
	input			sctag0_cpx_atom_cq;
	input	[145:0]		sctag0_cpx_data_ca;
	input	[7:0]		sctag0_cpx_req_cq;
	input			sctag1_cpx_atom_cq;
	input	[145:0]		sctag1_cpx_data_ca;
	input	[7:0]		sctag1_cpx_req_cq;
	input			sctag2_cpx_atom_cq;
	input	[145:0]		sctag2_cpx_data_ca;
	input	[7:0]		sctag2_cpx_req_cq;
	input			sctag3_cpx_atom_cq;
	input	[145:0]		sctag3_cpx_data_ca;
	input	[7:0]		sctag3_cpx_req_cq;
	input			sctag4_cpx_atom_cq;
	input	[145:0]		sctag4_cpx_data_ca;
	input	[7:0]		sctag4_cpx_req_cq;
	input			sctag5_cpx_atom_cq;
	input	[145:0]		sctag5_cpx_data_ca;
	input	[7:0]		sctag5_cpx_req_cq;
	input			sctag6_cpx_atom_cq;
	input	[145:0]		sctag6_cpx_data_ca;
	input	[7:0]		sctag6_cpx_req_cq;
	input			sctag7_cpx_atom_cq;
	input	[145:0]		sctag7_cpx_data_ca;
	input	[7:0]		sctag7_cpx_req_cq;
	output	[7:0]		cpx_io_grant_cx;
	output	[7:0]		cpx_sctag0_grant_cx;
	output	[7:0]		cpx_sctag1_grant_cx;
	output	[7:0]		cpx_sctag2_grant_cx;
	output	[7:0]		cpx_sctag3_grant_cx;
	output	[7:0]		cpx_sctag4_grant_cx;
	output	[7:0]		cpx_sctag5_grant_cx;
	output	[7:0]		cpx_sctag6_grant_cx;
	output	[7:0]		cpx_sctag7_grant_cx;
	output	[145:0]		cpx_spc0_data_cx2;
	output	[145:0]		cpx_spc1_data_cx2;
	output	[145:0]		cpx_spc2_data_cx2;
	output	[145:0]		cpx_spc3_data_cx2;
	output	[145:0]		cpx_spc4_data_cx2;
	output	[145:0]		cpx_spc5_data_cx2;
	output	[145:0]		cpx_spc6_data_cx2;
	output	[145:0]		cpx_spc7_data_cx2;

	wire	[1:0]		scan_in_buf;
	wire			tcu_pce_ov_buf;
	wire			tcu_aclk_buf;
	wire			tcu_bclk_buf;
	wire			tcu_scan_en_buf;
	wire			cluster_arst_l_buf;
	wire			tcu_atpg_mode_buf;
	wire			array_wr_inhibit_unused;
	wire			l2clk;
	wire			ccx_aclk;
	wire			ccx_bclk;
	wire			clkgen_scanout;
	wire			tcu_pce_ov_r;
	wire			aclk_wmr_r_unused;
	wire			wmr_protect_r_unused;
	wire			wmr_r_unused;
	wire			por_r_unused;
	wire			cmp_slow_sync_en_r_unused;
	wire			slow_cmp_sync_en_r_unused;
	wire			scan_out_0;
	wire			pcx_scan_out;
	wire			tstgl_scan_out;
	wire			scan_out_1;

	buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_buf_test_r(
		.din				({scan_in[1:0], tcu_pce_ov,
		tcu_aclk, tcu_bclk, tcu_scan_en, cluster_arst_l,
		tcu_atpg_mode}), 
		.dout				({scan_in_buf[1:0],
		tcu_pce_ov_buf, tcu_aclk_buf, tcu_bclk_buf, tcu_scan_en_buf,
		cluster_arst_l_buf, tcu_atpg_mode_buf}));
	clkgen_ccx_cmp clk_ccx(
		.array_wr_inhibit		(array_wr_inhibit_unused), 
		.tcu_atpg_mode			(tcu_atpg_mode_buf), 
		.tcu_wr_inhibit			(1'b0), 
		.l2clk				(l2clk), 
		.aclk				(ccx_aclk), 
		.bclk				(ccx_bclk), 
		.scan_out			(clkgen_scanout), 
		.pce_ov				(tcu_pce_ov_r), 
		.aclk_wmr			(aclk_wmr_r_unused), 
		.wmr_protect			(wmr_protect_r_unused), 
		.wmr_				(wmr_r_unused), 
		.por_				(por_r_unused), 
		.cmp_slow_sync_en		(cmp_slow_sync_en_r_unused), 
		.slow_cmp_sync_en		(slow_cmp_sync_en_r_unused), 
		.tcu_clk_stop_left		(gl_ccx_clk_stop_left), 
		.tcu_clk_stop_right		(gl_ccx_clk_stop_right), 
		.tcu_pce_ov			(tcu_pce_ov_buf), 
		.rst_wmr_protect		(1'b0), 
		.rst_wmr_			(1'b1), 
		.rst_por_			(1'b1), 
		.ccu_cmp_slow_sync_en		(1'b0), 
		.ccu_slow_cmp_sync_en		(1'b0), 
		.tcu_div_bypass_left		(1'b0), 
		.tcu_div_bypass_right		(1'b0), 
		.ccu_div_ph			(1'b1), 
		.cluster_div_en			(1'b0), 
		.gclk_left			(cmp_gclk_c2_ccx_left), 
		.gclk_right			(cmp_gclk_c2_ccx_right), 
		.cluster_arst_l_left		(cluster_arst_l_buf), 
		.cluster_arst_l_right		(cluster_arst_l_buf), 
		.clk_ext			(1'b0), 
		.ccu_serdes_dtm			(1'b0), 
		.tcu_aclk			(tcu_aclk_buf), 
		.tcu_bclk			(tcu_bclk_buf), 
		.scan_en			(tcu_scan_en_buf), 
		.scan_in			(scan_in_buf[0]));
	cpx cpx(
		.cpx_io_grant_cx		(cpx_io_grant_cx[7:0]), 
		.cpx_sctag0_grant_cx		(cpx_sctag0_grant_cx[7:0]), 
		.cpx_sctag1_grant_cx		(cpx_sctag1_grant_cx[7:0]), 
		.cpx_sctag2_grant_cx		(cpx_sctag2_grant_cx[7:0]), 
		.cpx_sctag3_grant_cx		(cpx_sctag3_grant_cx[7:0]), 
		.cpx_sctag4_grant_cx		(cpx_sctag4_grant_cx[7:0]), 
		.cpx_sctag5_grant_cx		(cpx_sctag5_grant_cx[7:0]), 
		.cpx_sctag6_grant_cx		(cpx_sctag6_grant_cx[7:0]), 
		.cpx_sctag7_grant_cx		(cpx_sctag7_grant_cx[7:0]), 
		.cpx_spc0_data_cx2		(cpx_spc0_data_cx2[145:0]), 
		.cpx_spc1_data_cx2		(cpx_spc1_data_cx2[145:0]), 
		.cpx_spc2_data_cx2		(cpx_spc2_data_cx2[145:0]), 
		.cpx_spc3_data_cx2		(cpx_spc3_data_cx2[145:0]), 
		.cpx_spc4_data_cx2		(cpx_spc4_data_cx2[145:0]), 
		.cpx_spc5_data_cx2		(cpx_spc5_data_cx2[145:0]), 
		.cpx_spc6_data_cx2		(cpx_spc6_data_cx2[145:0]), 
		.cpx_spc7_data_cx2		(cpx_spc7_data_cx2[145:0]), 
		.io_cpx_data_ca			(io_cpx_data_ca[145:0]), 
		.io_cpx_req_cq			(io_cpx_req_cq[7:0]), 
		.sctag0_cpx_atom_cq		(sctag0_cpx_atom_cq), 
		.sctag0_cpx_data_ca		(sctag0_cpx_data_ca[145:0]), 
		.sctag0_cpx_req_cq		(sctag0_cpx_req_cq[7:0]), 
		.sctag1_cpx_atom_cq		(sctag1_cpx_atom_cq), 
		.sctag1_cpx_data_ca		(sctag1_cpx_data_ca[145:0]), 
		.sctag1_cpx_req_cq		(sctag1_cpx_req_cq[7:0]), 
		.sctag2_cpx_atom_cq		(sctag2_cpx_atom_cq), 
		.sctag2_cpx_data_ca		(sctag2_cpx_data_ca[145:0]), 
		.sctag2_cpx_req_cq		(sctag2_cpx_req_cq[7:0]), 
		.sctag3_cpx_atom_cq		(sctag3_cpx_atom_cq), 
		.sctag3_cpx_data_ca		(sctag3_cpx_data_ca[145:0]), 
		.sctag3_cpx_req_cq		(sctag3_cpx_req_cq[7:0]), 
		.sctag4_cpx_atom_cq		(sctag4_cpx_atom_cq), 
		.sctag4_cpx_data_ca		(sctag4_cpx_data_ca[145:0]), 
		.sctag4_cpx_req_cq		(sctag4_cpx_req_cq[7:0]), 
		.sctag5_cpx_atom_cq		(sctag5_cpx_atom_cq), 
		.sctag5_cpx_data_ca		(sctag5_cpx_data_ca[145:0]), 
		.sctag5_cpx_req_cq		(sctag5_cpx_req_cq[7:0]), 
		.sctag6_cpx_atom_cq		(sctag6_cpx_atom_cq), 
		.sctag6_cpx_data_ca		(sctag6_cpx_data_ca[145:0]), 
		.sctag6_cpx_req_cq		(sctag6_cpx_req_cq[7:0]), 
		.sctag7_cpx_atom_cq		(sctag7_cpx_atom_cq), 
		.sctag7_cpx_data_ca		(sctag7_cpx_data_ca[145:0]), 
		.sctag7_cpx_req_cq		(sctag7_cpx_req_cq[7:0]), 
		.scan_in			(clkgen_scanout), 
		.scan_out			(scan_out_0), 
		.l2clk				(l2clk), 
		.ccx_aclk			(ccx_aclk), 
		.ccx_bclk			(ccx_bclk), 
		.tcu_scan_en			(tcu_scan_en_buf), 
		.tcu_pce_ov			(tcu_pce_ov_r));
	pcx pcx(
		.pcx_fpio_data_px2		(pcx_fpio_data_px2[129:0]), 
		.pcx_fpio_data_rdy_px1		(pcx_fpio_data_rdy_px1), 
		.pcx_sctag0_atm_px1		(pcx_sctag0_atm_px1), 
		.pcx_sctag0_data_px2		(pcx_sctag0_data_px2[129:0]), 
		.pcx_sctag0_data_rdy_px1	(pcx_sctag0_data_rdy_px1), 
		.pcx_sctag1_atm_px1		(pcx_sctag1_atm_px1), 
		.pcx_sctag1_data_px2		(pcx_sctag1_data_px2[129:0]), 
		.pcx_sctag1_data_rdy_px1	(pcx_sctag1_data_rdy_px1), 
		.pcx_sctag2_atm_px1		(pcx_sctag2_atm_px1), 
		.pcx_sctag2_data_px2		(pcx_sctag2_data_px2[129:0]), 
		.pcx_sctag2_data_rdy_px1	(pcx_sctag2_data_rdy_px1), 
		.pcx_sctag3_atm_px1		(pcx_sctag3_atm_px1), 
		.pcx_sctag3_data_px2		(pcx_sctag3_data_px2[129:0]), 
		.pcx_sctag3_data_rdy_px1	(pcx_sctag3_data_rdy_px1), 
		.pcx_sctag4_atm_px1		(pcx_sctag4_atm_px1), 
		.pcx_sctag4_data_px2		(pcx_sctag4_data_px2[129:0]), 
		.pcx_sctag4_data_rdy_px1	(pcx_sctag4_data_rdy_px1), 
		.pcx_sctag5_atm_px1		(pcx_sctag5_atm_px1), 
		.pcx_sctag5_data_px2		(pcx_sctag5_data_px2[129:0]), 
		.pcx_sctag5_data_rdy_px1	(pcx_sctag5_data_rdy_px1), 
		.pcx_sctag6_atm_px1		(pcx_sctag6_atm_px1), 
		.pcx_sctag6_data_px2		(pcx_sctag6_data_px2[129:0]), 
		.pcx_sctag6_data_rdy_px1	(pcx_sctag6_data_rdy_px1), 
		.pcx_sctag7_atm_px1		(pcx_sctag7_atm_px1), 
		.pcx_sctag7_data_px2		(pcx_sctag7_data_px2[129:0]), 
		.pcx_sctag7_data_rdy_px1	(pcx_sctag7_data_rdy_px1), 
		.pcx_spc0_grant_px		(pcx_spc0_grant_px[8:0]), 
		.pcx_spc1_grant_px		(pcx_spc1_grant_px[8:0]), 
		.pcx_spc2_grant_px		(pcx_spc2_grant_px[8:0]), 
		.pcx_spc3_grant_px		(pcx_spc3_grant_px[8:0]), 
		.pcx_spc4_grant_px		(pcx_spc4_grant_px[8:0]), 
		.pcx_spc5_grant_px		(pcx_spc5_grant_px[8:0]), 
		.pcx_spc6_grant_px		(pcx_spc6_grant_px[8:0]), 
		.pcx_spc7_grant_px		(pcx_spc7_grant_px[8:0]), 
		.io_pcx_stall_pq		(io_pcx_stall_pq), 
		.sctag0_pcx_stall_pq		(sctag0_pcx_stall_pq), 
		.sctag1_pcx_stall_pq		(sctag1_pcx_stall_pq), 
		.sctag2_pcx_stall_pq		(sctag2_pcx_stall_pq), 
		.sctag3_pcx_stall_pq		(sctag3_pcx_stall_pq), 
		.sctag4_pcx_stall_pq		(sctag4_pcx_stall_pq), 
		.sctag5_pcx_stall_pq		(sctag5_pcx_stall_pq), 
		.sctag6_pcx_stall_pq		(sctag6_pcx_stall_pq), 
		.sctag7_pcx_stall_pq		(sctag7_pcx_stall_pq), 
		.spc0_pcx_data_pa		(spc0_pcx_data_pa[129:0]), 
		.spc0_pcx_req_pq		(spc0_pcx_req_pq[8:0]), 
		.spc0_pcx_atm_pq		(spc0_pcx_atm_pq[8:0]), 
		.spc1_pcx_data_pa		(spc1_pcx_data_pa[129:0]), 
		.spc1_pcx_req_pq		(spc1_pcx_req_pq[8:0]), 
		.spc1_pcx_atm_pq		(spc1_pcx_atm_pq[8:0]), 
		.spc2_pcx_data_pa		(spc2_pcx_data_pa[129:0]), 
		.spc2_pcx_req_pq		(spc2_pcx_req_pq[8:0]), 
		.spc2_pcx_atm_pq		(spc2_pcx_atm_pq[8:0]), 
		.spc3_pcx_data_pa		(spc3_pcx_data_pa[129:0]), 
		.spc3_pcx_req_pq		(spc3_pcx_req_pq[8:0]), 
		.spc3_pcx_atm_pq		(spc3_pcx_atm_pq[8:0]), 
		.spc4_pcx_data_pa		(spc4_pcx_data_pa[129:0]), 
		.spc4_pcx_req_pq		(spc4_pcx_req_pq[8:0]), 
		.spc4_pcx_atm_pq		(spc4_pcx_atm_pq[8:0]), 
		.spc5_pcx_data_pa		(spc5_pcx_data_pa[129:0]), 
		.spc5_pcx_req_pq		(spc5_pcx_req_pq[8:0]), 
		.spc5_pcx_atm_pq		(spc5_pcx_atm_pq[8:0]), 
		.spc6_pcx_data_pa		(spc6_pcx_data_pa[129:0]), 
		.spc6_pcx_req_pq		(spc6_pcx_req_pq[8:0]), 
		.spc6_pcx_atm_pq		(spc6_pcx_atm_pq[8:0]), 
		.spc7_pcx_data_pa		(spc7_pcx_data_pa[129:0]), 
		.spc7_pcx_req_pq		(spc7_pcx_req_pq[8:0]), 
		.spc7_pcx_atm_pq		(spc7_pcx_atm_pq[8:0]), 
		.scan_in			(scan_in_buf[1]), 
		.scan_out			(pcx_scan_out), 
		.l2clk				(l2clk), 
		.ccx_aclk			(ccx_aclk), 
		.ccx_bclk			(ccx_bclk), 
		.tcu_scan_en			(tcu_scan_en_buf), 
		.tcu_pce_ov			(tcu_pce_ov_r));
	ccx_trep trep0(
		.cpu_rep_in			(cpu_rep0_in[191:0]), 
		.cpu_rep_out			(cpu_rep0_out[191:0]));
	ccx_trep trep1(
		.cpu_rep_in			(cpu_rep1_in[191:0]), 
		.cpu_rep_out			(cpu_rep1_out[191:0]));
	ccx_tstg tstgl(
		.din				(ccx_lstg_in[159:0]), 
		.dout				(ccx_lstg_out[159:0]), 
		.local_stop			(1'b0), 
		.scan_in			(pcx_scan_out), 
		.scan_out			(tstgl_scan_out), 
		.l2clk				(l2clk), 
		.tcu_aclk			(ccx_aclk), 
		.tcu_bclk			(ccx_bclk), 
		.tcu_scan_en			(tcu_scan_en_buf), 
		.tcu_pce_ov			(tcu_pce_ov_r));
	ccx_tstg tstgr(
		.din				(ccx_rstg_in[159:0]), 
		.dout				(ccx_rstg_out[159:0]), 
		.local_stop			(1'b0), 
		.scan_in			(tstgl_scan_out), 
		.scan_out			(scan_out_1), 
		.l2clk				(l2clk), 
		.tcu_aclk			(ccx_aclk), 
		.tcu_bclk			(ccx_bclk), 
		.tcu_scan_en			(tcu_scan_en_buf), 
		.tcu_pce_ov			(tcu_pce_ov_r));
	buff_macro__dbuff_32x__rep_1__stack_none__width_2 i_buf_scan(
		.din				({scan_out_1, scan_out_0}), 
		.dout				({scan_out[1:0]}));
endmodule


`endif // `ifdef FPGA

