// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: gkt.v
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
module  gkt (
  tcu_scan_en, 
  tcu_se_scancollar_out, 
  lbist_run, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  core_isolate, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
  slow_cmp_sync_en, 
  const_cpuid, 
  lsu_gkt_pmen, 
  ifu_l15_valid, 
  mmu_l15_valid, 
  lsu_l15_valid, 
  spu_l15_valid, 
  lsu_l15_lock, 
  ifu_l15_addr, 
  mmu_l15_addr, 
  lsu_l15_addr, 
  spu_l15_addr, 
  ifu_l15_cpkt, 
  mmu_l15_cpkt, 
  lsu_l15_cpkt, 
  spu_l15_cpkt, 
  lsu_l15_data, 
  spu_l15_data, 
  ncu_spc_pm, 
  ncu_spc_ba01, 
  ncu_spc_ba23, 
  ncu_spc_ba45, 
  ncu_spc_ba67, 
  ncu_spc_l2_idx_hash_en, 
  cpx_spc_data_cx, 
  pcx_spc_grant_px, 
  l15_spc_cpkt, 
  l15_spc_data1, 
  cpx_spc_data_cx_rep0, 
  l15_mmu_valid, 
  l15_spu_valid, 
  l15_ifu_grant, 
  l15_mmu_grant, 
  l15_lsu_grant, 
  l15_spu_grant, 
  gkt_ifu_legal, 
  gkt_ifu_flip_parity, 
  l15_pmu_xbar_optype, 
  spc_pcx_req_pq, 
  spc_pcx_atm_pq, 
  spc_pcx_data_pa);
wire ipc_v0_ifu_new;
wire ipc_v0_ifu_shft;
wire ipc_v0_ifu_hold;
wire ipc_v1_ifu_new;
wire ipc_v1_ifu_hold;
wire ipc_v0_mmu_new;
wire ipc_v0_mmu_shft;
wire ipc_v0_mmu_hold;
wire ipc_v1_mmu_new;
wire ipc_v1_mmu_hold;
wire ipc_v0_lsu_new;
wire ipc_v0_lsu_shft;
wire ipc_v0_lsu_hold;
wire ipc_v1_lsu_new;
wire ipc_v1_lsu_hold;
wire ipc_v0_spu_new;
wire ipc_v0_spu_shft;
wire ipc_v0_spu_hold;
wire ipc_v1_spu_new;
wire ipc_v1_spu_hold;
wire [3:0] ipc_dropreg_wen;
wire ipc_pq_clken;
wire ipc_scanin;
wire ipc_scanout;
wire [8:0] pcx_spc_grant_px_buf;
wire [8:0] ipd_optype;
wire ipd_scanin;
wire ipd_scanout;
wire ncu_pm_ff;
wire ncu_ba01_ff;
wire ncu_ba23_ff;
wire ncu_ba45_ff;
wire ncu_ba67_ff;
wire ipc_sel_ndrop_ifu_l1;
wire ipc_sel_ndrop_mmu_l1;
wire ipc_sel_ndrop_lsu_l1;
wire ipc_sel_ndrop_spu_l1;
wire ipc_sel_drop_ifu_l1;
wire ipc_sel_drop_mmu_l1;
wire ipc_sel_drop_lsu_l1;
wire ipc_sel_drop_spu_l1;
wire [8:0] ipc_op_req_li;
wire [8:0] ipc_atm_req_li;


// globals
input		tcu_scan_en;
input		tcu_se_scancollar_out;
input		lbist_run;
input       l2clk;
input       scan_in;
input       tcu_pce_ov;             // scan signals
input       core_isolate;

input       spc_aclk;
input       spc_bclk;
output      scan_out;
input       slow_cmp_sync_en;


input [2:0] const_cpuid;


input       lsu_gkt_pmen;

// inputs from core
input       ifu_l15_valid;
input       mmu_l15_valid;
input       lsu_l15_valid;
input       spu_l15_valid;


input       lsu_l15_lock;


input [39:0] ifu_l15_addr;
input [39:4] mmu_l15_addr;
input [39:0] lsu_l15_addr;
input [38:3] spu_l15_addr;


input [7:0]  ifu_l15_cpkt;
input [4:0]  mmu_l15_cpkt;
input [25:0] lsu_l15_cpkt;
input [12:0] spu_l15_cpkt;

input [63:0] lsu_l15_data;
input [63:0] spu_l15_data;

// inputs from ncu
input        ncu_spc_pm;
input        ncu_spc_ba01;
input        ncu_spc_ba23;
input        ncu_spc_ba45;
input        ncu_spc_ba67;
input        ncu_spc_l2_idx_hash_en;

// inputs from CPX crossbar
input [145:0] cpx_spc_data_cx;

// input from PCX crossbar
input [8:0]   pcx_spc_grant_px;


// output to SPARC core
output [17:0] l15_spc_cpkt;

output [127:0] l15_spc_data1;
output [145:0]  cpx_spc_data_cx_rep0;



output        l15_mmu_valid;
output        l15_spu_valid;

output        l15_ifu_grant;
output        l15_mmu_grant;
output        l15_lsu_grant;
output        l15_spu_grant;

// output legal opcode decode and flip parity

output [3:0]  gkt_ifu_legal;
output [3:0]  gkt_ifu_flip_parity;


// output to pmu
output [6:0]  l15_pmu_xbar_optype;

// output to PCX crossbar
output [8:0]  spc_pcx_req_pq;
output [8:0]  spc_pcx_atm_pq;
output [129:0] spc_pcx_data_pa;


// assertions
// lock has to be asserted only on CAS1 packet
/* 0in assert_together -leader (lsu_l15_valid & (lsu_l15_cpkt[24:20] == 5'b0010)) -follower lsu_l15_lock
 -message "l1g: CAS1 packet does not have lock asserted" */
/* 0in assert_together -leader (~lsu_l15_valid  | (lsu_l15_cpkt[24:20] != 5'b0010)) -follower !lsu_l15_lock
 -message "l1g: Non CAS1 packet has lock asserted" */
/* 0in assert_follower -leader lsu_l15_lock -follower !lsu_l15_lock -max 1 
 -message "l1g: lsu_l15_lock asserted for more than one cycle"*/

////////////////////////////////////////////////////////////////////////////////
/* 
 gkt_ipc_ctl AUTO_TEMPLATE
 (
 .pcx_grant (pcx_spc_grant_px_buf[8:0]),
 .ifu_l15_addr39_37 (ifu_l15_addr[39:37]),
 .mmu_l15_addr39_37 (mmu_l15_addr[39:37]),
 .lsu_l15_addr39_37 (lsu_l15_addr[39:37]),
 .spu_l15_addr39_37 (spu_l15_addr[39:37]),
 .ifu_l15_addr8_6 (ifu_l15_addr[8:6]),
 .mmu_l15_addr8_6 (mmu_l15_addr[8:6]),
 .lsu_l15_addr8_6 (lsu_l15_addr[8:6]),
 .spu_l15_addr8_6 (spu_l15_addr[8:6]),
 )
 */

gkt_ipc_ctl ipc (/*AUTOINST*/
                 // Outputs
                 .ipc_v0_ifu_new        (ipc_v0_ifu_new),
                 .ipc_v0_ifu_shft       (ipc_v0_ifu_shft),
                 .ipc_v0_ifu_hold       (ipc_v0_ifu_hold),
                 .ipc_v1_ifu_new        (ipc_v1_ifu_new),
                 .ipc_v1_ifu_hold       (ipc_v1_ifu_hold),
                 .ipc_v0_mmu_new        (ipc_v0_mmu_new),
                 .ipc_v0_mmu_shft       (ipc_v0_mmu_shft),
                 .ipc_v0_mmu_hold       (ipc_v0_mmu_hold),
                 .ipc_v1_mmu_new        (ipc_v1_mmu_new),
                 .ipc_v1_mmu_hold       (ipc_v1_mmu_hold),
                 .ipc_v0_lsu_new        (ipc_v0_lsu_new),
                 .ipc_v0_lsu_shft       (ipc_v0_lsu_shft),
                 .ipc_v0_lsu_hold       (ipc_v0_lsu_hold),
                 .ipc_v1_lsu_new        (ipc_v1_lsu_new),
                 .ipc_v1_lsu_hold       (ipc_v1_lsu_hold),
                 .ipc_v0_spu_new        (ipc_v0_spu_new),
                 .ipc_v0_spu_shft       (ipc_v0_spu_shft),
                 .ipc_v0_spu_hold       (ipc_v0_spu_hold),
                 .ipc_v1_spu_new        (ipc_v1_spu_new),
                 .ipc_v1_spu_hold       (ipc_v1_spu_hold),
                 .l15_ifu_grant         (l15_ifu_grant),
                 .l15_mmu_grant         (l15_mmu_grant),
                 .l15_lsu_grant         (l15_lsu_grant),
                 .l15_spu_grant         (l15_spu_grant),
                 .ipc_dropreg_wen       (ipc_dropreg_wen[3:0]),
                 .ipc_pq_clken          (ipc_pq_clken),
                 // Inputs
                 .scan_in(ipc_scanin),
                 .scan_out(ipc_scanout),
                 .l2clk                 (l2clk),
                 .ifu_l15_valid         (ifu_l15_valid),
                 .mmu_l15_valid         (mmu_l15_valid),
                 .lsu_l15_valid         (lsu_l15_valid),
                 .spu_l15_valid         (spu_l15_valid),
                 .ifu_l15_addr39_37     (ifu_l15_addr[39:37]),   // Templated
                 .ifu_l15_addr8_6       (ifu_l15_addr[8:6]),     // Templated
                 .mmu_l15_addr39_37     (mmu_l15_addr[39:37]),   // Templated
                 .mmu_l15_addr8_6       (mmu_l15_addr[8:6]),     // Templated
                 .lsu_l15_addr39_37     (lsu_l15_addr[39:37]),   // Templated
                 .lsu_l15_addr8_6       (lsu_l15_addr[8:6]),     // Templated
                 .spu_l15_addr39_37     ({1'b0,spu_l15_addr[38:37]}),   // Templated
                 .spu_l15_addr8_6       (spu_l15_addr[8:6]),     // Templated
                 .lsu_l15_lock          (lsu_l15_lock),
                 .pcx_grant             (pcx_spc_grant_px_buf[8:0]), // Templated
                 .ipd_optype            (ipd_optype[8:0]),
  .tcu_scan_en(tcu_scan_en),
  .lbist_run(lbist_run),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .lsu_gkt_pmen(lsu_gkt_pmen),
  .ncu_pm_ff(ncu_pm_ff),
  .ncu_ba01_ff(ncu_ba01_ff),
  .ncu_ba23_ff(ncu_ba23_ff),
  .ncu_ba45_ff(ncu_ba45_ff),
  .ncu_ba67_ff(ncu_ba67_ff),
  .ipc_sel_ndrop_ifu_l1(ipc_sel_ndrop_ifu_l1),
  .ipc_sel_ndrop_mmu_l1(ipc_sel_ndrop_mmu_l1),
  .ipc_sel_ndrop_lsu_l1(ipc_sel_ndrop_lsu_l1),
  .ipc_sel_ndrop_spu_l1(ipc_sel_ndrop_spu_l1),
  .ipc_sel_drop_ifu_l1(ipc_sel_drop_ifu_l1),
  .ipc_sel_drop_mmu_l1(ipc_sel_drop_mmu_l1),
  .ipc_sel_drop_lsu_l1(ipc_sel_drop_lsu_l1),
  .ipc_sel_drop_spu_l1(ipc_sel_drop_spu_l1),
  .ipc_op_req_li(ipc_op_req_li[8:0]),
  .ipc_atm_req_li(ipc_atm_req_li[8:0]),
  .l15_pmu_xbar_optype(l15_pmu_xbar_optype[6:0]));

/* 
 gkt_ipd_dp AUTO_TEMPLATE 
 (
 .l15_spc_cpkt (l15_spu_cpkt[17:0]),
 .l15_spc_valid (l15_spu_valid),
 );
 */

gkt_ipd_dp ipd (/*AUTOINST*/
                // Outputs
                .spc_pcx_req_pq        (spc_pcx_req_pq[8:0]),
                .spc_pcx_atm_pq        (spc_pcx_atm_pq[8:0]),
                .spc_pcx_data_pa        (spc_pcx_data_pa[129:0]),
                .l15_spc_data1          (l15_spc_data1[127:0]),
                .l15_spc_cpkt           (l15_spc_cpkt[17:0]),
                .l15_mmu_valid          (l15_mmu_valid),
                .l15_spu_valid          (l15_spu_valid),
                .ipd_optype             (ipd_optype[8:0]),
                // Inputs
                .scan_in(ipd_scanin),
                .scan_out(ipd_scanout),
                .l2clk                  (l2clk),
                .ipc_v0_ifu_new         (ipc_v0_ifu_new),
                .ipc_v0_ifu_shft        (ipc_v0_ifu_shft),
                .ipc_v0_ifu_hold        (ipc_v0_ifu_hold),
                .ipc_v1_ifu_new         (ipc_v1_ifu_new),
                .ipc_v1_ifu_hold        (ipc_v1_ifu_hold),
                .ipc_v0_mmu_new         (ipc_v0_mmu_new),
                .ipc_v0_mmu_shft        (ipc_v0_mmu_shft),
                .ipc_v0_mmu_hold        (ipc_v0_mmu_hold),
                .ipc_v1_mmu_new         (ipc_v1_mmu_new),
                .ipc_v1_mmu_hold        (ipc_v1_mmu_hold),
                .ipc_v0_lsu_new         (ipc_v0_lsu_new),
                .ipc_v0_lsu_shft        (ipc_v0_lsu_shft),
                .ipc_v0_lsu_hold        (ipc_v0_lsu_hold),
                .ipc_v1_lsu_new         (ipc_v1_lsu_new),
                .ipc_v1_lsu_hold        (ipc_v1_lsu_hold),
                .ipc_v0_spu_new         (ipc_v0_spu_new),
                .ipc_v0_spu_shft        (ipc_v0_spu_shft),
                .ipc_v0_spu_hold        (ipc_v0_spu_hold),
                .ipc_v1_spu_new         (ipc_v1_spu_new),
                .ipc_v1_spu_hold        (ipc_v1_spu_hold),
                .ipc_pq_clken           (ipc_pq_clken),
                .ipc_dropreg_wen        (ipc_dropreg_wen[3:0]),
  .tcu_scan_en(tcu_scan_en),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_pce_ov(tcu_pce_ov),
  .core_isolate(core_isolate),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .slow_cmp_sync_en(slow_cmp_sync_en),
  .const_cpuid(const_cpuid[2:0]),
  .ncu_spc_pm(ncu_spc_pm),
  .ncu_spc_ba01(ncu_spc_ba01),
  .ncu_spc_ba23(ncu_spc_ba23),
  .ncu_spc_ba45(ncu_spc_ba45),
  .ncu_spc_ba67(ncu_spc_ba67),
  .ncu_pm_ff(ncu_pm_ff),
  .ncu_ba01_ff(ncu_ba01_ff),
  .ncu_ba23_ff(ncu_ba23_ff),
  .ncu_ba45_ff(ncu_ba45_ff),
  .ncu_ba67_ff(ncu_ba67_ff),
  .cpx_spc_data_cx_rep0(cpx_spc_data_cx_rep0[145:0]),
  .pcx_spc_grant_px_buf(pcx_spc_grant_px_buf[8:0]),
  .cpx_spc_data_cx(cpx_spc_data_cx[145:0]),
  .pcx_spc_grant_px(pcx_spc_grant_px[8:0]),
  .ifu_l15_addr(ifu_l15_addr[39:0]),
  .mmu_l15_addr(mmu_l15_addr[39:4]),
  .lsu_l15_addr(lsu_l15_addr[39:0]),
  .spu_l15_addr(spu_l15_addr[38:3]),
  .ifu_l15_valid(ifu_l15_valid),
  .mmu_l15_valid(mmu_l15_valid),
  .spu_l15_valid(spu_l15_valid),
  .ifu_l15_cpkt(ifu_l15_cpkt[7:0]),
  .mmu_l15_cpkt(mmu_l15_cpkt[4:0]),
  .lsu_l15_cpkt(lsu_l15_cpkt[25:0]),
  .spu_l15_cpkt(spu_l15_cpkt[12:0]),
  .lsu_l15_data(lsu_l15_data[63:0]),
  .spu_l15_data(spu_l15_data[63:0]),
  .ipc_sel_ndrop_ifu_l1(ipc_sel_ndrop_ifu_l1),
  .ipc_sel_ndrop_mmu_l1(ipc_sel_ndrop_mmu_l1),
  .ipc_sel_ndrop_lsu_l1(ipc_sel_ndrop_lsu_l1),
  .ipc_sel_ndrop_spu_l1(ipc_sel_ndrop_spu_l1),
  .ipc_sel_drop_ifu_l1(ipc_sel_drop_ifu_l1),
  .ipc_sel_drop_mmu_l1(ipc_sel_drop_mmu_l1),
  .ipc_sel_drop_lsu_l1(ipc_sel_drop_lsu_l1),
  .ipc_sel_drop_spu_l1(ipc_sel_drop_spu_l1),
  .ipc_op_req_li(ipc_op_req_li[8:0]),
  .ipc_atm_req_li(ipc_atm_req_li[8:0]),
  .ncu_spc_l2_idx_hash_en(ncu_spc_l2_idx_hash_en));


gkt_leg_ctl leg0 (
                  .instr (l15_spc_data1[31:0]),
                  .legal (gkt_ifu_legal[0]),
                  .flip_parity (gkt_ifu_flip_parity[0])
                  );

gkt_leg_ctl leg1 (
                  .instr (l15_spc_data1[63:32]),
                  .legal (gkt_ifu_legal[1]),
                  .flip_parity (gkt_ifu_flip_parity[1])
                  );

gkt_leg_ctl leg2 (
                  .instr (l15_spc_data1[95:64]),
                  .legal (gkt_ifu_legal[2]),
                  .flip_parity (gkt_ifu_flip_parity[2])
                  );

gkt_leg_ctl leg3 (
                  .instr (l15_spc_data1[127:96]),
                  .legal (gkt_ifu_legal[3]),
                  .flip_parity (gkt_ifu_flip_parity[3])
                  );


// fixscan start:
assign ipc_scanin                = scan_in                  ;
assign ipd_scanin                = ipc_scanout              ;
assign scan_out                  = ipd_scanout              ;
// fixscan end:
endmodule
