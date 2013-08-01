// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: gkt_ipc_ctl.v
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
module  gkt_ipc_ctl (
  tcu_scan_en, 
  l2clk, 
  lbist_run, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
  lsu_gkt_pmen, 
  ifu_l15_valid, 
  mmu_l15_valid, 
  lsu_l15_valid, 
  spu_l15_valid, 
  ifu_l15_addr39_37, 
  ifu_l15_addr8_6, 
  mmu_l15_addr39_37, 
  mmu_l15_addr8_6, 
  lsu_l15_addr39_37, 
  lsu_l15_addr8_6, 
  spu_l15_addr39_37, 
  spu_l15_addr8_6, 
  lsu_l15_lock, 
  pcx_grant, 
  ipd_optype, 
  ncu_pm_ff, 
  ncu_ba01_ff, 
  ncu_ba23_ff, 
  ncu_ba45_ff, 
  ncu_ba67_ff, 
  ipc_v0_ifu_new, 
  ipc_v0_ifu_shft, 
  ipc_v0_ifu_hold, 
  ipc_v1_ifu_new, 
  ipc_v1_ifu_hold, 
  ipc_v0_mmu_new, 
  ipc_v0_mmu_shft, 
  ipc_v0_mmu_hold, 
  ipc_v1_mmu_new, 
  ipc_v1_mmu_hold, 
  ipc_v0_lsu_new, 
  ipc_v0_lsu_shft, 
  ipc_v0_lsu_hold, 
  ipc_v1_lsu_new, 
  ipc_v1_lsu_hold, 
  ipc_v0_spu_new, 
  ipc_v0_spu_shft, 
  ipc_v0_spu_hold, 
  ipc_v1_spu_new, 
  ipc_v1_spu_hold, 
  l15_ifu_grant, 
  l15_mmu_grant, 
  l15_lsu_grant, 
  l15_spu_grant, 
  ipc_sel_ndrop_ifu_l1, 
  ipc_sel_ndrop_mmu_l1, 
  ipc_sel_ndrop_lsu_l1, 
  ipc_sel_ndrop_spu_l1, 
  ipc_sel_drop_ifu_l1, 
  ipc_sel_drop_mmu_l1, 
  ipc_sel_drop_lsu_l1, 
  ipc_sel_drop_spu_l1, 
  ipc_dropreg_wen, 
  ipc_pq_clken, 
  ipc_op_req_li, 
  ipc_atm_req_li, 
  l15_pmu_xbar_optype);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire pmen_reg_scanin;
wire pmen_reg_scanout;
wire gkt_pmen;
wire dff_ncu_pb_scanin;
wire dff_ncu_pb_scanout;
wire pm;
wire ba01;
wire ba23;
wire ba45;
wire ba67;
wire sel8_pa8_in;
wire sel8_pa7_in;
wire sel8_1_in;
wire sel7_pa7_in;
wire sel7_pa7b_in;
wire sel7_1_in;
wire dff_pb_sel_scanin;
wire dff_pb_sel_scanout;
wire sel8_pa8;
wire sel8_pa7;
wire sel8_1;
wire sel7_pa7;
wire sel7_pa7b;
wire sel7_1;
wire v0_ifu_in;
wire v0_ifu;
wire ifu_shift;
wire v1_ifu;
wire v1_ifu_in;
wire ifu_eff_addr_8;
wire ifu_eff_addr_7;
wire ifu_l15_io;
wire [8:0] ifu_l15_bank;
wire [8:0] v0_ifu_req_in;
wire [8:0] v1_ifu_req;
wire [8:0] v0_ifu_req;
wire [8:0] v1_ifu_req_in;
wire dff_ifu_req_v0_scanin;
wire dff_ifu_req_v0_scanout;
wire dff_ifu_req_v1_scanin;
wire dff_ifu_req_v1_scanout;
wire dff_ifu_v0_scanin;
wire dff_ifu_v0_scanout;
wire dff_ifu_v1_scanin;
wire dff_ifu_v1_scanout;
wire v0_mmu_in;
wire v0_mmu;
wire mmu_shift;
wire v1_mmu;
wire v1_mmu_in;
wire mmu_eff_addr_8;
wire mmu_eff_addr_7;
wire mmu_l15_io;
wire [8:0] mmu_l15_bank;
wire [8:0] v0_mmu_req_in;
wire [8:0] v1_mmu_req;
wire [8:0] v0_mmu_req;
wire [8:0] v1_mmu_req_in;
wire dff_mmu_req_v0_scanin;
wire dff_mmu_req_v0_scanout;
wire dff_mmu_req_v1_scanin;
wire dff_mmu_req_v1_scanout;
wire dff_mmu_v0_scanin;
wire dff_mmu_v0_scanout;
wire dff_mmu_v1_scanin;
wire dff_mmu_v1_scanout;
wire v0_lsu_in;
wire v0_lsu;
wire lsu_shift;
wire v1_lsu;
wire v1_lsu_in;
wire v0_lsu_lock_in;
wire v1_lsu_lock;
wire v0_lsu_lock;
wire v1_lsu_lock_in;
wire lsu_eff_addr_8;
wire lsu_eff_addr_7;
wire lsu_l15_io;
wire [8:0] lsu_l15_bank;
wire [8:0] v0_lsu_req_in;
wire [8:0] v1_lsu_req;
wire [8:0] v0_lsu_req;
wire [8:0] v1_lsu_req_in;
wire dff_lsu_req_v0_scanin;
wire dff_lsu_req_v0_scanout;
wire dff_lsu_req_v1_scanin;
wire dff_lsu_req_v1_scanout;
wire dff_lsu_v0_scanin;
wire dff_lsu_v0_scanout;
wire dff_lsu_v1_scanin;
wire dff_lsu_v1_scanout;
wire dff_lsu_lock_v0_scanin;
wire dff_lsu_lock_v0_scanout;
wire dff_lsu_lock_v1_scanin;
wire dff_lsu_lock_v1_scanout;
wire v0_spu_in;
wire v0_spu;
wire spu_shift;
wire v1_spu;
wire v1_spu_in;
wire spu_eff_addr_8;
wire spu_eff_addr_7;
wire spu_l15_io;
wire [8:0] spu_l15_bank;
wire [8:0] v0_spu_req_in;
wire [8:0] v1_spu_req;
wire [8:0] v0_spu_req;
wire [8:0] v1_spu_req_in;
wire dff_spu_req_v0_scanin;
wire dff_spu_req_v0_scanout;
wire dff_spu_req_v1_scanin;
wire dff_spu_req_v1_scanout;
wire dff_spu_v0_scanin;
wire dff_spu_v0_scanout;
wire dff_spu_v1_scanin;
wire dff_spu_v1_scanout;
wire f_im_in;
wire f_im;
wire sel_ifu_l1;
wire sel_mmu_l1;
wire force_ifu;
wire force_mmu;
wire f_ls_in;
wire f_ls;
wire sel_lsu_l1;
wire sel_spu_l1;
wire force_lsu;
wire force_spu;
wire f_i_in;
wire f_i;
wire sel_ifu_mmu_l1;
wire sel_lsu_spu_l1;
wire force_ifu_mmu;
wire force_lsu_spu;
wire ifu_v;
wire [3:0] ipc_dropreg_valid;
wire mmu_v;
wire lsu_v;
wire spu_v;
wire ipc_sel_ifu;
wire lock_acc;
wire ipc_sel_mmu;
wire ipc_sel_lsu;
wire ipc_sel_spu;
wire ipc_sel_ifu_mmu;
wire ipc_sel_lsu_spu;
wire lock_acc_in;
wire [3:0] unit_sel_li;
wire [8:0] pcxbuf_empty;
wire [8:0] pqm_empty;
wire [8:0] op_req_l1;
wire [8:0] kill_lsu_atm_req;
wire kill_lsu_req;
wire [8:0] atm_req_li;
wire [3:0] ipc_unit_sel_l1;
wire sel_repeat_li;
wire sel_nrepeat_drop_li;
wire sel_nrepeat_ndrop_li;
wire sel_nrepeat_drop_unused;
wire sel_nrepeat_ndrop_unused;
wire [8:0] req_nrepeat_drop_li;
wire [8:0] dropreg0;
wire [8:0] dropreg1;
wire [8:0] dropreg2;
wire [8:0] dropreg3;
wire [8:0] req_nrepeat_ndrop_li;
wire [8:0] atm_pq;
wire [8:0] req_repeat_drop_li;
wire [8:0] req_repeat_ndrop_li;
wire ifu_grant_li;
wire mmu_grant_li;
wire lsu_grant_li;
wire spu_grant_li;
wire lock_reg_scanin;
wire lock_reg_scanout;
wire favori_reg_scanin;
wire favori_reg_scanout;
wire favorim_reg_scanin;
wire favorim_reg_scanout;
wire favorls_reg_scanin;
wire favorls_reg_scanout;
wire sel_reg_scanin;
wire sel_reg_scanout;
wire grant_reg_scanin;
wire grant_reg_scanout;
wire ifu_grant_l1;
wire mmu_grant_l1;
wire lsu_grant_l1;
wire spu_grant_l1;
wire l1_atm_req_reg_scanin;
wire l1_atm_req_reg_scanout;
wire [8:0] ipc_atm_l1;
wire req_nrepeat_drop_reg_scanin;
wire req_nrepeat_drop_reg_scanout;
wire [8:0] req_nrepeat_drop_l1;
wire req_nrepeat_ndrop_reg_scanin;
wire req_nrepeat_ndrop_reg_scanout;
wire [8:0] req_nrepeat_ndrop_l1;
wire req_repeat_drop_reg_scanin;
wire req_repeat_drop_reg_scanout;
wire [8:0] ipc_req_repeat_drop_l1;
wire req_repeat_ndrop_reg_scanin;
wire req_repeat_ndrop_reg_scanout;
wire [8:0] ipc_req_repeat_ndrop_l1;
wire ifu_ndropped_pa;
wire mmu_ndropped_pa;
wire lsu_ndropped_pa;
wire spu_ndropped_pa;
wire req_dropped;
wire [8:0] pqm_req_drop;
wire req_dropped_;
wire req_dropped_lat;
wire [3:0] ipc_unit_sel_pa;
wire [3:0] ipc_dropreg_valid_pa;
wire req_dropped_lat_;
wire [8:0] dropreg0_in;
wire [8:0] dropreg1_in;
wire [8:0] dropreg2_in;
wire [8:0] dropreg3_in;
wire [8:0] req_pq;
wire [8:0] atm_pa;
wire ipc_pq_valid;
wire ifu_ndropped_l1;
wire mmu_ndropped_l1;
wire lsu_ndropped_l1;
wire spu_ndropped_l1;
wire ifu_dropped_pa;
wire mmu_dropped_pa;
wire lsu_dropped_pa;
wire spu_dropped_pa;
wire ifu_success_pa;
wire mmu_success_pa;
wire lsu_success_pa;
wire spu_success_pa;
wire inc_ifu;
wire max_count_reached;
wire clear_ifu;
wire hold_ifu;
wire [2:0] ifu_drop_cnt;
wire [2:0] ifu_drop_cnt_lat;
wire inc_mmu;
wire clear_mmu;
wire hold_mmu;
wire [2:0] mmu_drop_cnt;
wire [2:0] mmu_drop_cnt_lat;
wire inc_lsu;
wire clear_lsu;
wire hold_lsu;
wire [2:0] lsu_drop_cnt;
wire [2:0] lsu_drop_cnt_lat;
wire inc_spu;
wire clear_spu;
wire hold_spu;
wire [2:0] spu_drop_cnt;
wire [2:0] spu_drop_cnt_lat;
wire max_count_reached_in;
wire force_ifu_in;
wire force_mmu_in;
wire force_lsu_in;
wire force_spu_in;
wire force_ifu_mmu_in;
wire force_lsu_spu_in;
wire drop_cnt_scanin;
wire drop_cnt_scanout;
wire force_req_scanin;
wire force_req_scanout;
wire ifetch_pkt;
wire dload_pkt;
wire dstore_pkt;
wire sload_pkt;
wire sstore_pkt;
wire mmu_pkt;
wire ma_pkt;
wire [2:0] pcx_pkt;
wire [2:0] tid_pkt;
wire valid_pkt;
wire [8:0] req_pa;
wire [6:0] xbar_optype;
wire dff_xbar_type_scanin;
wire dff_xbar_type_scanout;
wire dff_unit_sel_pa_type_scanin;
wire dff_unit_sel_pa_type_scanout;
wire dff_unit_ndrop_pa_scanin;
wire dff_unit_ndrop_pa_scanout;
wire dff_req_drop_lat_scanin;
wire dff_req_drop_lat_scanout;
wire dff_req_drop_latx_scanin;
wire dff_req_drop_latx_scanout;
wire dff_dropreg_valid_scanin;
wire dff_dropreg_valid_scanout;
wire dff_dropreg0_scanin;
wire dff_dropreg0_scanout;
wire dff_dropreg1_scanin;
wire dff_dropreg1_scanout;
wire dff_dropreg2_scanin;
wire dff_dropreg2_scanout;
wire dff_dropreg3_scanin;
wire dff_dropreg3_scanout;
wire dff_req_pa_scanin;
wire dff_req_pa_scanout;
wire dff_atm_pa_scanin;
wire dff_atm_pa_scanout;
wire [8:0] pcx_grant_lb;
wire pqm0_scanin;
wire pqm0_scanout;
wire pqm1_scanin;
wire pqm1_scanout;
wire pqm2_scanin;
wire pqm2_scanout;
wire pqm3_scanin;
wire pqm3_scanout;
wire pqm4_scanin;
wire pqm4_scanout;
wire pqm5_scanin;
wire pqm5_scanout;
wire pqm6_scanin;
wire pqm6_scanout;
wire pqm7_scanin;
wire pqm7_scanout;
wire pqm8_scanin;
wire pqm8_scanout;
wire spares_scanin;
wire spares_scanout;


// globals
input		tcu_scan_en;
input           l2clk;
input		lbist_run;
input           scan_in;
input           tcu_pce_ov;             // scan signals
input           spc_aclk;
input           spc_bclk;
output          scan_out;


input           lsu_gkt_pmen;

input           ifu_l15_valid; // 0in known_driven
input           mmu_l15_valid; // 0in known_driven
input           lsu_l15_valid; // 0in known_driven
input           spu_l15_valid; // 0in known_driven

input [39:37]   ifu_l15_addr39_37;
input [8:6]     ifu_l15_addr8_6;
input [39:37]   mmu_l15_addr39_37;
input [8:6]     mmu_l15_addr8_6;
input [39:37]   lsu_l15_addr39_37;
input [8:6]     lsu_l15_addr8_6;
input [39:37]   spu_l15_addr39_37;
input [8:6]     spu_l15_addr8_6;

input           lsu_l15_lock; // 0in known_driven

input [8:0]     pcx_grant;

input [8:0]     ipd_optype;

input           ncu_pm_ff;
input           ncu_ba01_ff;
input           ncu_ba23_ff;
input           ncu_ba45_ff;
input           ncu_ba67_ff;



output          ipc_v0_ifu_new;
output          ipc_v0_ifu_shft;
output          ipc_v0_ifu_hold;

output          ipc_v1_ifu_new;
output          ipc_v1_ifu_hold;

output          ipc_v0_mmu_new;
output          ipc_v0_mmu_shft;
output          ipc_v0_mmu_hold;

output          ipc_v1_mmu_new;
output          ipc_v1_mmu_hold;

output          ipc_v0_lsu_new;
output          ipc_v0_lsu_shft;
output          ipc_v0_lsu_hold;

output          ipc_v1_lsu_new;
output          ipc_v1_lsu_hold;

output          ipc_v0_spu_new;
output          ipc_v0_spu_shft;
output          ipc_v0_spu_hold;

output          ipc_v1_spu_new;
output          ipc_v1_spu_hold;

output          l15_ifu_grant;
output          l15_mmu_grant;
output          l15_lsu_grant;
output          l15_spu_grant;

output          ipc_sel_ndrop_ifu_l1;
output          ipc_sel_ndrop_mmu_l1;
output          ipc_sel_ndrop_lsu_l1;
output          ipc_sel_ndrop_spu_l1;

output          ipc_sel_drop_ifu_l1;
output          ipc_sel_drop_mmu_l1;
output          ipc_sel_drop_lsu_l1;
output          ipc_sel_drop_spu_l1;

output [3:0]    ipc_dropreg_wen;
output          ipc_pq_clken;

output [8:0]    ipc_op_req_li;
output [8:0]    ipc_atm_req_li;





output [6:0]    l15_pmu_xbar_optype;



// scan renames
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;
assign se = tcu_scan_en ;
// end scan


////////////////////////////////////////////////////////
gkt_ipc_ctl_l1clkhdr_ctl_macro clkgen 
  (
   .l2clk(l2clk),
   .l1en (1'b1 ),
   .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));
////////////////////////////////////////////////////////
gkt_ipc_ctl_msff_ctl_macro__width_1 pmen_reg  
(
 .scan_in(pmen_reg_scanin),
 .scan_out(pmen_reg_scanout),
 .l1clk	(l1clk),
 .din	(lsu_gkt_pmen),
 .dout	(gkt_pmen),
  .siclk(siclk),
  .soclk(soclk)
 );

////////////////////////////////////////////////////////
// Partial bank support
// N2 supports partial L2 banks.
// Following truth table is used by all spc cores and sii to
// route the request to the correct bank
//
//PM          avaialble banks           req[2] req[1] req[0]
//        ba67 ba45 ba23 ba01
//-----------------------------------------------------------
//0        x   x   x   x                pa[8]  pa[7]  pa[6]
//1        0   0   0   0   illegal      0      0      pa[6]
//1        0   0   0   1                0      0      pa[6]
//1        0   0   1   0                0      1      pa[6]
//1        0   0   1   1                0      pa[7]  pa[6]
//1        0   1   0   0                1      0      pa[6]
//1        0   1   0   1                pa[7]  0      pa[6]
//1        0   1   1   0                pa[7] ~pa[7]  pa[6]
//1        0   1   1   1   illegal      0      pa[7]  pa[6]
//1        1   0   0   0                1      1      pa[6]
//1        1   0   0   1                pa[7]  pa[7]  pa[6]
//1        1   0   1   0                pa[7]  1      pa[6]
//1        1   0   1   1   illegal      0      pa[7]  pa[6]
//1        1   1   0   0                1      pa[7]  pa[6]
//1        1   1   0   1   illegal      1      pa[7]  pa[6]
//1        1   1   1   0   illegal      1      pa[7]  pa[6]
//1        1   1   1   1                pa[8]  pa[7]  pa[6]

//.i 5
//.o 8
//.ilb pm ba67 ba45 ba23 ba01 
//.olb sel8_pa8 sel8_pa7 sel8_1 sel8_0 sel7_pa7 sel_pa7b sel7_1 sel7_0
//.type fr
//0 - - - -     1 0 0 0    1 0 0 0
//1 0 0 0 0     0 0 0 1    0 0 0 1
//1 0 0 0 1     0 0 0 1    0 0 0 1
//1 0 0 1 0     0 0 0 1    0 0 1 0
//1 0 0 1 1     0 0 0 1    1 0 0 0
//1 0 1 0 0     0 0 1 0    0 0 0 1
//1 0 1 0 1     0 1 0 0    0 0 0 1
//1 0 1 1 0     0 1 0 0    0 1 0 0
//1 0 1 1 1     0 0 0 1    1 0 0 0
//1 1 0 0 0     0 0 1 0    0 0 1 0
//1 1 0 0 1     0 1 0 0    1 0 0 0
//1 1 0 1 0     0 1 0 0    0 0 1 0
//1 1 0 1 1     0 0 0 1    1 0 0 0
//1 1 1 0 0     0 0 1 0    1 0 0 0
//1 1 1 0 1     0 0 1 0    1 0 0 0
//1 1 1 1 0     0 0 1 0    1 0 0 0
//1 1 1 1 1     1 0 0 0    1 0 0 0
//v5.0 = (ba67&ba45&ba23&ba01) | (!pm);

//v5.1 = (pm&ba67&!ba45&ba23&!ba01) | (pm&!ba67&ba45&ba23&!ba01) | (pm&ba67
//    &!ba45&!ba23&ba01) | (pm&!ba67&ba45&!ba23&ba01);

//v5.2 = (pm&ba67&!ba23&!ba01) | (pm&ba45&!ba23&!ba01) | (pm&ba67&ba45&!ba01) | (
//    pm&ba67&ba45&!ba23);

//v5.3 = (pm&!ba67&!ba45) | (pm&!ba45&ba23&ba01) | (pm&!ba67&ba23&ba01);

//v5.4 = (ba67&ba45) | (ba23&ba01) | (ba67&ba01) | (!pm);

//v5.5 = (pm&!ba67&ba45&ba23&!ba01);

//v5.6 = (pm&ba67&!ba45&!ba01) | (pm&!ba45&ba23&!ba01);

//v5.7 = (pm&!ba67&!ba23);
gkt_ipc_ctl_msff_ctl_macro__width_5 dff_ncu_pb 
(
 .scan_in(dff_ncu_pb_scanin),
 .scan_out(dff_ncu_pb_scanout),
 .l1clk(l1clk),
 .din  ({ncu_pm_ff,ncu_ba01_ff,ncu_ba23_ff,ncu_ba45_ff,ncu_ba67_ff}),
 .dout ({pm,ba01,ba23,ba45,ba67}),
  .siclk(siclk),
  .soclk(soclk)
 );

assign sel8_pa8_in = (ba67 & ba45 & ba23 & ba01) | (!pm);

assign sel8_pa7_in = (pm & ba67 & !ba45 & ba23 & !ba01) | 
                      (pm & !ba67 & ba45 & ba23 & !ba01) | 
                      (pm & ba67 & !ba45 & !ba23 & ba01) | 
                      (pm & !ba67 & ba45 & !ba23 & ba01);

assign sel8_1_in = (pm & ba67 & !ba23 & !ba01) | 
                    (pm & ba45 & !ba23 & !ba01) | 
                    (pm & ba67 & ba45 & !ba01) | 
                    (pm & ba67 & ba45 & !ba23);

assign sel7_pa7_in = (ba67 & ba45) | 
                      (ba23 & ba01) | 
                      (ba67 & ba01) | 
                      (!pm);

assign sel7_pa7b_in = (pm & !ba67 & ba45 & ba23 & !ba01);

assign sel7_1_in = (pm & ba67 & !ba45 & !ba01) | 
                    (pm & !ba45 & ba23 & !ba01);


gkt_ipc_ctl_msff_ctl_macro__width_6 dff_pb_sel 
(
 .scan_in(dff_pb_sel_scanin),
 .scan_out(dff_pb_sel_scanout),
 .l1clk(l1clk),
 .din  ({sel8_pa8_in, sel8_pa7_in, sel8_1_in, sel7_pa7_in, sel7_pa7b_in, sel7_1_in}),
 .dout ({sel8_pa8, sel8_pa7, sel8_1, sel7_pa7, sel7_pa7b, sel7_1}),
  .siclk(siclk),
  .soclk(soclk)
 );

////////////////////////////////////////////////////////



// Latch ifu data in 2-entry FIFO

assign v0_ifu_in = (v0_ifu & !ifu_shift) |  ifu_l15_valid | v1_ifu;
assign v1_ifu_in = (v1_ifu & !ifu_shift) | (v1_ifu & ifu_l15_valid) | (v0_ifu & ifu_l15_valid & !ifu_shift);

assign ipc_v0_ifu_new = (!v0_ifu) | (v0_ifu & !v1_ifu & ifu_shift);
assign ipc_v0_ifu_shft = v1_ifu & ifu_shift;
assign ipc_v0_ifu_hold = (v0_ifu & !ifu_shift);
// 0in one_hot -var {ipc_v0_ifu_new,ipc_v0_ifu_shft,ipc_v0_ifu_hold}

//assign ipc_v1_ifu_new = (~v1_ifu | ifu_shift);
//assign ipc_v1_ifu_hold = (v1_ifu & !ifu_shift);
// changed for power
assign ipc_v1_ifu_new = (~v1_ifu | ifu_shift) & v1_ifu_in;
assign ipc_v1_ifu_hold = (v1_ifu & !ifu_shift) | ~v1_ifu_in;

assign ifu_eff_addr_8 = (sel8_pa8 & ifu_l15_addr8_6[8]) |
                        (sel8_pa7 & ifu_l15_addr8_6[7]) |
                        (sel8_1);

assign ifu_eff_addr_7 = (sel7_pa7 & ifu_l15_addr8_6[7]) |
                        (sel7_pa7b & ~ifu_l15_addr8_6[7]) |
                        (sel7_1);

// determine bank being requested by ifu and latch it in two-entry fifo.
assign ifu_l15_io = ifu_l15_addr39_37[39] & ~(~ifu_l15_addr39_37[38] & ifu_l15_addr39_37[37]);
assign ifu_l15_bank[0] = ~ifu_l15_io & ~ifu_eff_addr_8 & ~ifu_eff_addr_7 & ~ifu_l15_addr8_6[6];
assign ifu_l15_bank[1] = ~ifu_l15_io & ~ifu_eff_addr_8 & ~ifu_eff_addr_7 &  ifu_l15_addr8_6[6];
assign ifu_l15_bank[2] = ~ifu_l15_io & ~ifu_eff_addr_8 &  ifu_eff_addr_7 & ~ifu_l15_addr8_6[6];
assign ifu_l15_bank[3] = ~ifu_l15_io & ~ifu_eff_addr_8 &  ifu_eff_addr_7 &  ifu_l15_addr8_6[6];
assign ifu_l15_bank[4] = ~ifu_l15_io &  ifu_eff_addr_8 & ~ifu_eff_addr_7 & ~ifu_l15_addr8_6[6];
assign ifu_l15_bank[5] = ~ifu_l15_io &  ifu_eff_addr_8 & ~ifu_eff_addr_7 &  ifu_l15_addr8_6[6];
assign ifu_l15_bank[6] = ~ifu_l15_io &  ifu_eff_addr_8 &  ifu_eff_addr_7 & ~ifu_l15_addr8_6[6];
assign ifu_l15_bank[7] = ~ifu_l15_io &  ifu_eff_addr_8 &  ifu_eff_addr_7 &  ifu_l15_addr8_6[6];
assign ifu_l15_bank[8] = ifu_l15_io;

assign v0_ifu_req_in[8:0] = ({9{ipc_v0_ifu_new & ifu_l15_valid}} & ifu_l15_bank[8:0]) |
                            ({9{ipc_v0_ifu_shft}} & v1_ifu_req[8:0]) |
                            ({9{ipc_v0_ifu_hold}} & v0_ifu_req[8:0]);

assign v1_ifu_req_in[8:0] = ({9{ipc_v1_ifu_new & ifu_l15_valid}} & ifu_l15_bank[8:0]) |
                            ({9{ipc_v1_ifu_hold}} & v1_ifu_req[8:0]);

gkt_ipc_ctl_msff_ctl_macro__width_9 dff_ifu_req_v0 
(
 .scan_in(dff_ifu_req_v0_scanin),
 .scan_out(dff_ifu_req_v0_scanout),
 .l1clk(l1clk),
 .din  (v0_ifu_req_in[8:0]),
 .dout (v0_ifu_req[8:0]),
  .siclk(siclk),
  .soclk(soclk)
 );
gkt_ipc_ctl_msff_ctl_macro__width_9 dff_ifu_req_v1 
(
 .scan_in(dff_ifu_req_v1_scanin),
 .scan_out(dff_ifu_req_v1_scanout),
 .l1clk(l1clk),
 .din  (v1_ifu_req_in[8:0]),
 .dout (v1_ifu_req[8:0]),
  .siclk(siclk),
  .soclk(soclk)
 );

gkt_ipc_ctl_msff_ctl_macro__width_1 dff_ifu_v0 
(
 .scan_in(dff_ifu_v0_scanin),
 .scan_out(dff_ifu_v0_scanout),
 .l1clk(l1clk),
 .din  (v0_ifu_in),
 .dout (v0_ifu),
  .siclk(siclk),
  .soclk(soclk)
 );
gkt_ipc_ctl_msff_ctl_macro__width_1 dff_ifu_v1 
(
 .scan_in(dff_ifu_v1_scanin),
 .scan_out(dff_ifu_v1_scanout),
 .l1clk(l1clk),
 .din  (v1_ifu_in),
 .dout (v1_ifu),
  .siclk(siclk),
  .soclk(soclk)
 );

////////////////////////////////////////////////////////
// Latch mmu data in 2-entry FIFO

assign v0_mmu_in = (v0_mmu & !mmu_shift) |  mmu_l15_valid | v1_mmu;
assign v1_mmu_in = (v1_mmu & !mmu_shift) | (v1_mmu & mmu_l15_valid) | (v0_mmu & mmu_l15_valid & !mmu_shift);

assign ipc_v0_mmu_new = (!v0_mmu) | (v0_mmu & !v1_mmu & mmu_shift);
assign ipc_v0_mmu_shft = v1_mmu & mmu_shift;
assign ipc_v0_mmu_hold = (v0_mmu & !mmu_shift);
// 0in one_hot -var {ipc_v0_mmu_new,ipc_v0_mmu_shft,ipc_v0_mmu_hold}

//assign ipc_v1_mmu_new = (~v1_mmu | mmu_shift);
//assign ipc_v1_mmu_hold = (v1_mmu & !mmu_shift);
// changed for power
assign ipc_v1_mmu_new = (~v1_mmu | mmu_shift) & v1_mmu_in;
assign ipc_v1_mmu_hold = (v1_mmu & !mmu_shift) | ~v1_mmu_in;

assign mmu_eff_addr_8 = (sel8_pa8 & mmu_l15_addr8_6[8]) |
                        (sel8_pa7 & mmu_l15_addr8_6[7]) |
                        (sel8_1);

assign mmu_eff_addr_7 = (sel7_pa7 & mmu_l15_addr8_6[7]) |
                        (sel7_pa7b & ~mmu_l15_addr8_6[7]) |
                        (sel7_1);

// determine bank being requested by mmu and latch it in two-entry fifo.
assign mmu_l15_io = mmu_l15_addr39_37[39] & ~(~mmu_l15_addr39_37[38] & mmu_l15_addr39_37[37]);
assign mmu_l15_bank[0] = ~mmu_l15_io & ~mmu_eff_addr_8 & ~mmu_eff_addr_7 & ~mmu_l15_addr8_6[6];
assign mmu_l15_bank[1] = ~mmu_l15_io & ~mmu_eff_addr_8 & ~mmu_eff_addr_7 &  mmu_l15_addr8_6[6];
assign mmu_l15_bank[2] = ~mmu_l15_io & ~mmu_eff_addr_8 &  mmu_eff_addr_7 & ~mmu_l15_addr8_6[6];
assign mmu_l15_bank[3] = ~mmu_l15_io & ~mmu_eff_addr_8 &  mmu_eff_addr_7 &  mmu_l15_addr8_6[6];
assign mmu_l15_bank[4] = ~mmu_l15_io &  mmu_eff_addr_8 & ~mmu_eff_addr_7 & ~mmu_l15_addr8_6[6];
assign mmu_l15_bank[5] = ~mmu_l15_io &  mmu_eff_addr_8 & ~mmu_eff_addr_7 &  mmu_l15_addr8_6[6];
assign mmu_l15_bank[6] = ~mmu_l15_io &  mmu_eff_addr_8 &  mmu_eff_addr_7 & ~mmu_l15_addr8_6[6];
assign mmu_l15_bank[7] = ~mmu_l15_io &  mmu_eff_addr_8 &  mmu_eff_addr_7 &  mmu_l15_addr8_6[6];
assign mmu_l15_bank[8] = mmu_l15_io;

assign v0_mmu_req_in[8:0] = ({9{ipc_v0_mmu_new & mmu_l15_valid}} & mmu_l15_bank[8:0]) |
                            ({9{ipc_v0_mmu_shft}} & v1_mmu_req[8:0]) |
                            ({9{ipc_v0_mmu_hold}} & v0_mmu_req[8:0]);

assign v1_mmu_req_in[8:0] = ({9{ipc_v1_mmu_new & mmu_l15_valid}} & mmu_l15_bank[8:0]) |
                            ({9{ipc_v1_mmu_hold}} & v1_mmu_req[8:0]);

gkt_ipc_ctl_msff_ctl_macro__width_9 dff_mmu_req_v0 
(
 .scan_in(dff_mmu_req_v0_scanin),
 .scan_out(dff_mmu_req_v0_scanout),
 .l1clk(l1clk),
 .din  (v0_mmu_req_in[8:0]),
 .dout (v0_mmu_req[8:0]),
  .siclk(siclk),
  .soclk(soclk)
 );
gkt_ipc_ctl_msff_ctl_macro__width_9 dff_mmu_req_v1 
(
 .scan_in(dff_mmu_req_v1_scanin),
 .scan_out(dff_mmu_req_v1_scanout),
 .l1clk(l1clk),
 .din  (v1_mmu_req_in[8:0]),
 .dout (v1_mmu_req[8:0]),
  .siclk(siclk),
  .soclk(soclk)
 );

gkt_ipc_ctl_msff_ctl_macro__width_1 dff_mmu_v0 
(
 .scan_in(dff_mmu_v0_scanin),
 .scan_out(dff_mmu_v0_scanout),
 .l1clk(l1clk),
 .din  (v0_mmu_in),
 .dout (v0_mmu),
  .siclk(siclk),
  .soclk(soclk)
 );
gkt_ipc_ctl_msff_ctl_macro__width_1 dff_mmu_v1 
(
 .scan_in(dff_mmu_v1_scanin),
 .scan_out(dff_mmu_v1_scanout),
 .l1clk(l1clk),
 .din  (v1_mmu_in),
 .dout (v1_mmu),
  .siclk(siclk),
  .soclk(soclk)
 );

////////////////////////////////////////////////////////
// Latch lsu data in 2-entry FIFO
assign v0_lsu_in = (v0_lsu & ~lsu_shift) | lsu_l15_valid | v1_lsu ;
assign v1_lsu_in = (v1_lsu & ~lsu_shift) | (v1_lsu & lsu_l15_valid) | (v0_lsu & lsu_l15_valid & ~lsu_shift);

assign ipc_v0_lsu_new = (~v0_lsu) | (v0_lsu & ~v1_lsu & lsu_shift);
assign ipc_v0_lsu_shft = v1_lsu & lsu_shift;
assign ipc_v0_lsu_hold = (v0_lsu & ~lsu_shift);
// 0in one_hot -var {ipc_v0_lsu_new,ipc_v0_lsu_shft,ipc_v0_lsu_hold}


//assign ipc_v1_lsu_new = (~v1_lsu | lsu_shift);
//assign ipc_v1_lsu_hold = (v1_lsu & !lsu_shift);
//changed for power saving 
assign ipc_v1_lsu_new = (~v1_lsu | lsu_shift) & v1_lsu_in;
assign ipc_v1_lsu_hold = (v1_lsu & !lsu_shift) | ~v1_lsu_in;


assign v0_lsu_lock_in = (ipc_v0_lsu_new & lsu_l15_lock & lsu_l15_valid) | 
                        (ipc_v0_lsu_shft & v1_lsu_lock) | 
                        (ipc_v0_lsu_hold & v0_lsu_lock);

assign v1_lsu_lock_in = (ipc_v1_lsu_new & lsu_l15_lock & lsu_l15_valid) | 
                        (ipc_v1_lsu_hold & v1_lsu_lock);

assign lsu_eff_addr_8 = (sel8_pa8 & lsu_l15_addr8_6[8]) |
                        (sel8_pa7 & lsu_l15_addr8_6[7]) |
                        (sel8_1);

assign lsu_eff_addr_7 = (sel7_pa7 & lsu_l15_addr8_6[7]) |
                        (sel7_pa7b & ~lsu_l15_addr8_6[7]) |
                        (sel7_1);

// determine bank being requested by lsu and latch it in two-entry fifo.
assign lsu_l15_io = lsu_l15_addr39_37[39] & ~(~lsu_l15_addr39_37[38] & lsu_l15_addr39_37[37]);
assign lsu_l15_bank[0] = ~lsu_l15_io & ~lsu_eff_addr_8 & ~lsu_eff_addr_7 & ~lsu_l15_addr8_6[6];
assign lsu_l15_bank[1] = ~lsu_l15_io & ~lsu_eff_addr_8 & ~lsu_eff_addr_7 &  lsu_l15_addr8_6[6];
assign lsu_l15_bank[2] = ~lsu_l15_io & ~lsu_eff_addr_8 &  lsu_eff_addr_7 & ~lsu_l15_addr8_6[6];
assign lsu_l15_bank[3] = ~lsu_l15_io & ~lsu_eff_addr_8 &  lsu_eff_addr_7 &  lsu_l15_addr8_6[6];
assign lsu_l15_bank[4] = ~lsu_l15_io &  lsu_eff_addr_8 & ~lsu_eff_addr_7 & ~lsu_l15_addr8_6[6];
assign lsu_l15_bank[5] = ~lsu_l15_io &  lsu_eff_addr_8 & ~lsu_eff_addr_7 &  lsu_l15_addr8_6[6];
assign lsu_l15_bank[6] = ~lsu_l15_io &  lsu_eff_addr_8 &  lsu_eff_addr_7 & ~lsu_l15_addr8_6[6];
assign lsu_l15_bank[7] = ~lsu_l15_io &  lsu_eff_addr_8 &  lsu_eff_addr_7 &  lsu_l15_addr8_6[6];
assign lsu_l15_bank[8] = lsu_l15_io;

assign v0_lsu_req_in[8:0] = ({9{ipc_v0_lsu_new & lsu_l15_valid}} & lsu_l15_bank[8:0]) |
                            ({9{ipc_v0_lsu_shft}} & v1_lsu_req[8:0]) |
                            ({9{ipc_v0_lsu_hold}} & v0_lsu_req[8:0]);

assign v1_lsu_req_in[8:0] = ({9{ipc_v1_lsu_new & lsu_l15_valid}} & lsu_l15_bank[8:0]) |
                            ({9{ipc_v1_lsu_hold}} & v1_lsu_req[8:0]);

gkt_ipc_ctl_msff_ctl_macro__width_9 dff_lsu_req_v0 
(
 .scan_in(dff_lsu_req_v0_scanin),
 .scan_out(dff_lsu_req_v0_scanout),
 .l1clk(l1clk),
 .din  (v0_lsu_req_in[8:0]),
 .dout (v0_lsu_req[8:0]),
  .siclk(siclk),
  .soclk(soclk)
 );
gkt_ipc_ctl_msff_ctl_macro__width_9 dff_lsu_req_v1 
(
 .scan_in(dff_lsu_req_v1_scanin),
 .scan_out(dff_lsu_req_v1_scanout),
 .l1clk(l1clk),
 .din  (v1_lsu_req_in[8:0]),
 .dout (v1_lsu_req[8:0]),
  .siclk(siclk),
  .soclk(soclk)
 );

gkt_ipc_ctl_msff_ctl_macro__width_1 dff_lsu_v0 
(
 .scan_in(dff_lsu_v0_scanin),
 .scan_out(dff_lsu_v0_scanout),
 .l1clk(l1clk),
 .din  (v0_lsu_in),
 .dout (v0_lsu),
  .siclk(siclk),
  .soclk(soclk)
 );
gkt_ipc_ctl_msff_ctl_macro__width_1 dff_lsu_v1 
(
 .scan_in(dff_lsu_v1_scanin),
 .scan_out(dff_lsu_v1_scanout),
 .l1clk(l1clk),
 .din  (v1_lsu_in),
 .dout (v1_lsu),
  .siclk(siclk),
  .soclk(soclk)
 );

gkt_ipc_ctl_msff_ctl_macro__width_1 dff_lsu_lock_v0 
(
 .scan_in(dff_lsu_lock_v0_scanin),
 .scan_out(dff_lsu_lock_v0_scanout),
 .l1clk(l1clk),
 .din  (v0_lsu_lock_in),
 .dout (v0_lsu_lock),
  .siclk(siclk),
  .soclk(soclk)
 );
gkt_ipc_ctl_msff_ctl_macro__width_1 dff_lsu_lock_v1 
(
 .scan_in(dff_lsu_lock_v1_scanin),
 .scan_out(dff_lsu_lock_v1_scanout),
 .l1clk(l1clk),
 .din  (v1_lsu_lock_in),
 .dout (v1_lsu_lock),
  .siclk(siclk),
  .soclk(soclk)
 );

////////////////////////////////////////////////////////
// Latch spu data in 2-entry FIFO

assign v0_spu_in = (v0_spu & !spu_shift) |  spu_l15_valid | v1_spu;
assign v1_spu_in = (v1_spu & !spu_shift) | (v1_spu & spu_l15_valid) | (v0_spu & spu_l15_valid & !spu_shift);

assign ipc_v0_spu_new = (!v0_spu) | (v0_spu & !v1_spu & spu_shift);
assign ipc_v0_spu_shft = v1_spu & spu_shift;
assign ipc_v0_spu_hold = (v0_spu & !spu_shift);
// 0in one_hot -var {ipc_v0_spu_new,ipc_v0_spu_shft,ipc_v0_spu_hold}

//assign ipc_v1_spu_new = (~v1_spu | spu_shift);
//assign ipc_v1_spu_hold = (v1_spu & !spu_shift);
// changed for power
assign ipc_v1_spu_new = (~v1_spu | spu_shift) & v1_spu_in;
assign ipc_v1_spu_hold = (v1_spu & !spu_shift) | ~v1_spu_in;

assign spu_eff_addr_8 = (sel8_pa8 & spu_l15_addr8_6[8]) |
                        (sel8_pa7 & spu_l15_addr8_6[7]) |
                        (sel8_1);

assign spu_eff_addr_7 = (sel7_pa7 & spu_l15_addr8_6[7]) |
                        (sel7_pa7b & ~spu_l15_addr8_6[7]) |
                        (sel7_1);

// determine bank being requested by spu and latch it in two-entry fifo.
assign spu_l15_io = spu_l15_addr39_37[39] & ~(~spu_l15_addr39_37[38] & spu_l15_addr39_37[37]);
assign spu_l15_bank[0] = ~spu_l15_io & ~spu_eff_addr_8 & ~spu_eff_addr_7 & ~spu_l15_addr8_6[6];
assign spu_l15_bank[1] = ~spu_l15_io & ~spu_eff_addr_8 & ~spu_eff_addr_7 &  spu_l15_addr8_6[6];
assign spu_l15_bank[2] = ~spu_l15_io & ~spu_eff_addr_8 &  spu_eff_addr_7 & ~spu_l15_addr8_6[6];
assign spu_l15_bank[3] = ~spu_l15_io & ~spu_eff_addr_8 &  spu_eff_addr_7 &  spu_l15_addr8_6[6];
assign spu_l15_bank[4] = ~spu_l15_io &  spu_eff_addr_8 & ~spu_eff_addr_7 & ~spu_l15_addr8_6[6];
assign spu_l15_bank[5] = ~spu_l15_io &  spu_eff_addr_8 & ~spu_eff_addr_7 &  spu_l15_addr8_6[6];
assign spu_l15_bank[6] = ~spu_l15_io &  spu_eff_addr_8 &  spu_eff_addr_7 & ~spu_l15_addr8_6[6];
assign spu_l15_bank[7] = ~spu_l15_io &  spu_eff_addr_8 &  spu_eff_addr_7 &  spu_l15_addr8_6[6];
assign spu_l15_bank[8] = spu_l15_io;

assign v0_spu_req_in[8:0] = ({9{ipc_v0_spu_new & spu_l15_valid}} & spu_l15_bank[8:0]) |
                            ({9{ipc_v0_spu_shft}} & v1_spu_req[8:0]) |
                            ({9{ipc_v0_spu_hold}} & v0_spu_req[8:0]);

assign v1_spu_req_in[8:0] = ({9{ipc_v1_spu_new & spu_l15_valid}} & spu_l15_bank[8:0]) |
                            ({9{ipc_v1_spu_hold}} & v1_spu_req[8:0]);

gkt_ipc_ctl_msff_ctl_macro__width_9 dff_spu_req_v0 
(
 .scan_in(dff_spu_req_v0_scanin),
 .scan_out(dff_spu_req_v0_scanout),
 .l1clk(l1clk),
 .din  (v0_spu_req_in[8:0]),
 .dout (v0_spu_req[8:0]),
  .siclk(siclk),
  .soclk(soclk)
 );
gkt_ipc_ctl_msff_ctl_macro__width_9 dff_spu_req_v1 
(
 .scan_in(dff_spu_req_v1_scanin),
 .scan_out(dff_spu_req_v1_scanout),
 .l1clk(l1clk),
 .din  (v1_spu_req_in[8:0]),
 .dout (v1_spu_req[8:0]),
  .siclk(siclk),
  .soclk(soclk)
 );


gkt_ipc_ctl_msff_ctl_macro__width_1 dff_spu_v0 
(
 .scan_in(dff_spu_v0_scanin),
 .scan_out(dff_spu_v0_scanout),
 .l1clk(l1clk),
 .din  (v0_spu_in),
 .dout (v0_spu),
  .siclk(siclk),
  .soclk(soclk)
 );
gkt_ipc_ctl_msff_ctl_macro__width_1 dff_spu_v1 
(
 .scan_in(dff_spu_v1_scanin),
 .scan_out(dff_spu_v1_scanout),
 .l1clk(l1clk),
 .din  (v1_spu_in),
 .dout (v1_spu),
  .siclk(siclk),
  .soclk(soclk)
 );


////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// generate selects for mux feeding input flop
// 3 favor bits
// f_im selects between ifu and mmu
// f_ls selects between lsu and spu
// f_i selects between ifu/mmu and lsu/spu

assign f_im_in = (((f_im & ~sel_ifu_l1) | sel_mmu_l1) | force_ifu) & ~force_mmu;
assign f_ls_in = (((f_ls & ~sel_lsu_l1) | sel_spu_l1) | force_lsu) & ~force_spu;
assign f_i_in = (((f_i & ~sel_ifu_mmu_l1) | sel_lsu_spu_l1) | force_ifu_mmu) & ~force_lsu_spu;

//If a request from a unit A  gets dropped, and no other unit has a valid request,
//(including unit A), then the dropped req will not be tried for 1 clk. i.e there
// will be a one cycle hole because the unit_v will not be set.

assign ifu_v = v0_ifu_in | ipc_dropreg_valid[0];
assign mmu_v = v0_mmu_in | ipc_dropreg_valid[1];
assign lsu_v = v0_lsu_in | ipc_dropreg_valid[2];
assign spu_v = v0_spu_in | ipc_dropreg_valid[3];

assign ipc_sel_ifu = (ifu_v&!mmu_v&!lsu_v&!spu_v&!lock_acc) | 
                     (f_im_in&ifu_v&!lsu_v&!spu_v&!lock_acc) | 
                     (f_i_in&ifu_v&!mmu_v&!lock_acc) | 
                     (f_i_in&f_im_in&ifu_v&!lock_acc);

assign ipc_sel_mmu = (!ifu_v&mmu_v&!lsu_v&!spu_v&!lock_acc) | 
                     (!f_im_in&mmu_v&!lsu_v&!spu_v&!lock_acc) | 
                     (f_i_in&!ifu_v&mmu_v&!lock_acc) | 
                     (f_i_in&!f_im_in&mmu_v&!lock_acc);

assign ipc_sel_lsu = (!ifu_v&!mmu_v&lsu_v&!spu_v) | 
                     (f_ls_in&!ifu_v&!mmu_v&lsu_v) | 
                     (!f_i_in&lsu_v&!spu_v) | 
                     (!f_i_in&f_ls_in&lsu_v) |  (lsu_v&lock_acc);

assign ipc_sel_spu = (!ifu_v&!mmu_v&!lsu_v&spu_v&!lock_acc) | 
                     (!f_ls_in&!ifu_v&!mmu_v&spu_v&!lock_acc) | 
                     (!f_i_in&!lsu_v&spu_v&!lock_acc) | 
                     (!f_i_in&!f_ls_in&spu_v&!lock_acc);
                     
// 0in bits_on -var {ipc_sel_ifu,ipc_sel_mmu,ipc_sel_lsu,ipc_sel_spu} -max 1 

assign ipc_sel_ifu_mmu = ipc_sel_ifu | ipc_sel_mmu;
assign ipc_sel_lsu_spu = ipc_sel_lsu | ipc_sel_spu;

// set lock access when lsu selected and lock bit is set.
// it remains set until the next time lsu is selected with lock bit not set.
assign lock_acc_in = ((ipc_sel_lsu & v0_lsu_lock_in) | (lock_acc)) & ~(ipc_sel_lsu & ~v0_lsu_lock_in);
assign unit_sel_li[3:0] = {ipc_sel_spu,ipc_sel_lsu,ipc_sel_mmu,ipc_sel_ifu};


// pcxbuf is empty if pqm_empty and no request in flight
assign pcxbuf_empty[8:0] = pqm_empty[8:0] & ~op_req_l1[8:0];

// kill the lsu request if it is atomic and the buffers are not empty in pcx
assign kill_lsu_atm_req[8:0] = ({9{v0_lsu_lock_in}} & v0_lsu_req_in[8:0] & ~pcxbuf_empty[8:0]);
assign kill_lsu_req = |(kill_lsu_atm_req[8:0]);


assign atm_req_li[8:0] =  ({9{ipc_sel_lsu & v0_lsu_lock_in & ~(ipc_dropreg_valid[2] & ~ipc_unit_sel_l1[2])}} & v0_lsu_req_in[8:0] & pcxbuf_empty[8:0]);

// 0in bits_on -var {sel_nrepeat_drop_li, sel_nrepeat_ndrop_li, (sel_repeat_li & req_dropped), (sel_repeat_li & ~req_dropped)} -max 1 

assign sel_repeat_li = unit_sel_li[0] & ipc_unit_sel_l1[0] |
                       unit_sel_li[1] & ipc_unit_sel_l1[1] |
                       unit_sel_li[2] & ipc_unit_sel_l1[2] |
                       unit_sel_li[3] & ipc_unit_sel_l1[3];

//assign sel_repeat_drop_li = sel_repeat_li & req_dropped;
//assign sel_repeat_ndrop_li = sel_repeat_li & ~req_dropped;


assign sel_nrepeat_drop_li = unit_sel_li[0] & ~ipc_unit_sel_l1[0] & ipc_dropreg_valid[0] |
                             unit_sel_li[1] & ~ipc_unit_sel_l1[1] & ipc_dropreg_valid[1] |
                             unit_sel_li[2] & ~ipc_unit_sel_l1[2] & ipc_dropreg_valid[2] |
                             unit_sel_li[3] & ~ipc_unit_sel_l1[3] & ipc_dropreg_valid[3];

assign sel_nrepeat_ndrop_li = unit_sel_li[0] & ~ipc_unit_sel_l1[0] & ~ipc_dropreg_valid[0] |
                              unit_sel_li[1] & ~ipc_unit_sel_l1[1] & ~ipc_dropreg_valid[1] |
                              unit_sel_li[2] & ~ipc_unit_sel_l1[2] & ~ipc_dropreg_valid[2] |
                              unit_sel_li[3] & ~ipc_unit_sel_l1[3] & ~ipc_dropreg_valid[3];

assign sel_nrepeat_drop_unused = sel_nrepeat_drop_li;
assign sel_nrepeat_ndrop_unused = sel_nrepeat_ndrop_li;


// fold the select into the request so that the mux is simplified

assign req_nrepeat_drop_li[8:0] = ({9{unit_sel_li[0] & ~ipc_unit_sel_l1[0] & ipc_dropreg_valid[0]}} & dropreg0[8:0]) | 
                                  ({9{unit_sel_li[1] & ~ipc_unit_sel_l1[1] & ipc_dropreg_valid[1]}} & dropreg1[8:0]) |
                                  ({9{unit_sel_li[2] & ~ipc_unit_sel_l1[2] & ipc_dropreg_valid[2]}} & dropreg2[8:0]) |
                                  ({9{unit_sel_li[3] & ~ipc_unit_sel_l1[3] & ipc_dropreg_valid[3]}} & dropreg3[8:0]);

assign req_nrepeat_ndrop_li[8:0] = ({9{unit_sel_li[0] & ~ipc_unit_sel_l1[0] & ~ipc_dropreg_valid[0]}} & v0_ifu_req_in[8:0]) | 
                                   ({9{unit_sel_li[1] & ~ipc_unit_sel_l1[1] & ~ipc_dropreg_valid[1]}} & v0_mmu_req_in[8:0]) |
                                   ({9{unit_sel_li[2] & ~ipc_unit_sel_l1[2] & ~ipc_dropreg_valid[2]}} & v0_lsu_req_in[8:0] & ~kill_lsu_atm_req[8:0] & ~atm_pq[8:0]) |
                                   ({9{unit_sel_li[3] & ~ipc_unit_sel_l1[3] & ~ipc_dropreg_valid[3]}} & v0_spu_req_in[8:0]);


// this still needs to be qualified by req_dropped in next cycle
assign req_repeat_drop_li[8:0] = ({9{sel_repeat_li}} & op_req_l1[8:0]);

// this still needs to be qualified by req_dropped in next cycle
assign req_repeat_ndrop_li[8:0] = ({9{unit_sel_li[0] & ipc_unit_sel_l1[0]}} & v0_ifu_req_in[8:0]) | 
                                  ({9{unit_sel_li[1] & ipc_unit_sel_l1[1]}} & v0_mmu_req_in[8:0]) |
                                  ({9{unit_sel_li[2] & ipc_unit_sel_l1[2]}} & v0_lsu_req_in[8:0] & ~kill_lsu_atm_req[8:0] & ~atm_pq[8:0]) |
                                  ({9{unit_sel_li[3] & ipc_unit_sel_l1[3]}} & v0_spu_req_in[8:0]);


// optimize generation of grant
// l15_ifu_grant = sel_ifu_l1 & v0_ifu & ~ipc_dropreg_valid[0]
// l15_lsu_grant = sel_lsu_l1 & v0_lsu & ~ipc_dropreg_valid[2] & ~kill_lsu_req_l1;

assign ifu_grant_li = ipc_sel_ifu & v0_ifu_in & ~(ipc_dropreg_valid[0] & ~ipc_unit_sel_l1[0]);
assign mmu_grant_li = ipc_sel_mmu & v0_mmu_in & ~(ipc_dropreg_valid[1] & ~ipc_unit_sel_l1[1]);
assign lsu_grant_li = ipc_sel_lsu & v0_lsu_in & ~kill_lsu_req & ~(ipc_dropreg_valid[2] & ~ipc_unit_sel_l1[2]);
assign spu_grant_li = ipc_sel_spu & v0_spu_in & ~(ipc_dropreg_valid[3] & ~ipc_unit_sel_l1[3]);


gkt_ipc_ctl_msff_ctl_macro__width_1 lock_reg  
(
 .scan_in(lock_reg_scanin),
 .scan_out(lock_reg_scanout),
 .l1clk	(l1clk),
 .din	(lock_acc_in),
 .dout	(lock_acc),
  .siclk(siclk),
  .soclk(soclk)
 );

gkt_ipc_ctl_msff_ctl_macro__width_1 favori_reg  
(
 .scan_in(favori_reg_scanin),
 .scan_out(favori_reg_scanout),
 .l1clk	(l1clk),
	.din	(f_i_in),
 .dout	(f_i),
  .siclk(siclk),
  .soclk(soclk)
);

gkt_ipc_ctl_msff_ctl_macro__width_1 favorim_reg  
(
 .scan_in(favorim_reg_scanin),
 .scan_out(favorim_reg_scanout),
 .l1clk	(l1clk),
 .din	(f_im_in),
 .dout	(f_im),
  .siclk(siclk),
  .soclk(soclk)
 );

gkt_ipc_ctl_msff_ctl_macro__width_1 favorls_reg  
(
 .scan_in(favorls_reg_scanin),
 .scan_out(favorls_reg_scanout),
 .l1clk	(l1clk),
 .din	(f_ls_in),
 .dout	(f_ls),
  .siclk(siclk),
  .soclk(soclk)
 );

gkt_ipc_ctl_msff_ctl_macro__width_6 sel_reg  
(
 .scan_in(sel_reg_scanin),
 .scan_out(sel_reg_scanout),
 .l1clk	(l1clk),
 .din	({ipc_sel_ifu,ipc_sel_mmu,ipc_sel_lsu,ipc_sel_spu,ipc_sel_ifu_mmu, ipc_sel_lsu_spu}),
 .dout	({sel_ifu_l1,sel_mmu_l1,sel_lsu_l1,sel_spu_l1,sel_ifu_mmu_l1,sel_lsu_spu_l1}),
  .siclk(siclk),
  .soclk(soclk)
 );

gkt_ipc_ctl_msff_ctl_macro__width_4 grant_reg  
(
 .scan_in(grant_reg_scanin),
 .scan_out(grant_reg_scanout),
 .l1clk	(l1clk),
 .din	({ifu_grant_li,mmu_grant_li,lsu_grant_li,spu_grant_li}),
 .dout	({ifu_grant_l1,mmu_grant_l1,lsu_grant_l1,spu_grant_l1}),
  .siclk(siclk),
  .soclk(soclk)
 );

gkt_ipc_ctl_msff_ctl_macro__width_9 l1_atm_req_reg  
(
 .scan_in(l1_atm_req_reg_scanin),
 .scan_out(l1_atm_req_reg_scanout),
 .l1clk	(l1clk),
 .din	(atm_req_li[8:0]),
 .dout	(ipc_atm_l1[8:0]),
  .siclk(siclk),
  .soclk(soclk)
 );


gkt_ipc_ctl_msff_ctl_macro__width_9 req_nrepeat_drop_reg  
(
 .scan_in(req_nrepeat_drop_reg_scanin),
 .scan_out(req_nrepeat_drop_reg_scanout),
 .l1clk	(l1clk),
 .din	(req_nrepeat_drop_li[8:0]),
 .dout	(req_nrepeat_drop_l1[8:0]),
  .siclk(siclk),
  .soclk(soclk)
 );

gkt_ipc_ctl_msff_ctl_macro__width_9 req_nrepeat_ndrop_reg  
(
 .scan_in(req_nrepeat_ndrop_reg_scanin),
 .scan_out(req_nrepeat_ndrop_reg_scanout),
 .l1clk	(l1clk),
 .din	(req_nrepeat_ndrop_li[8:0]),
 .dout	(req_nrepeat_ndrop_l1[8:0]),
  .siclk(siclk),
  .soclk(soclk)
 );

gkt_ipc_ctl_msff_ctl_macro__width_9 req_repeat_drop_reg  
(
 .scan_in(req_repeat_drop_reg_scanin),
 .scan_out(req_repeat_drop_reg_scanout),
 .l1clk	(l1clk),
 .din	(req_repeat_drop_li[8:0]),
 .dout	(ipc_req_repeat_drop_l1[8:0]),
  .siclk(siclk),
  .soclk(soclk)
 );

gkt_ipc_ctl_msff_ctl_macro__width_9 req_repeat_ndrop_reg  
(
 .scan_in(req_repeat_ndrop_reg_scanin),
 .scan_out(req_repeat_ndrop_reg_scanout),
 .l1clk	(l1clk),
 .din	(req_repeat_ndrop_li[8:0]),
 .dout	(ipc_req_repeat_ndrop_l1[8:0]),
  .siclk(siclk),
  .soclk(soclk)
 );


assign l15_ifu_grant = ifu_grant_l1 & ifu_ndropped_pa;
assign l15_mmu_grant = mmu_grant_l1 & mmu_ndropped_pa;
assign l15_lsu_grant = lsu_grant_l1 & lsu_ndropped_pa;
assign l15_spu_grant = spu_grant_l1 & spu_ndropped_pa;


assign ifu_shift = l15_ifu_grant;
assign mmu_shift = l15_mmu_grant;
assign lsu_shift = l15_lsu_grant;
assign spu_shift = l15_spu_grant;

// do not use sel_lsu_l1 &~kill_lsu_req_l1 over here. If there are any lsu requests
// in the drop registers we want them to empty out.

assign ipc_unit_sel_l1[3:0] = {sel_spu_l1,sel_lsu_l1,sel_mmu_l1,sel_ifu_l1};



/////////////////////////////////////////////////////////////////////////
// PQ cycle
////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// requests are sent speculatively to PCX. They can get dropped by PCX if it does
// not have room.
assign req_dropped = (|(pqm_req_drop[8:0]));
assign req_dropped_ = ~(|(pqm_req_drop[8:0]));



// atomic request should never be dropped. They are sent only when there is room for
// two entries.
// 0in bits_on -var {req_dropped, (|atm_pq[8:0])} -max 1

// dropped requests are saved off in drop registers.
// They are cleared when the corresponding unit gets sent out and not dropped.

assign ipc_dropreg_valid[0]  = (req_dropped_lat & ipc_unit_sel_pa[0]) | 
                               (ipc_dropreg_valid_pa[0] & ~(ipc_unit_sel_pa[0] & req_dropped_lat_));

assign ipc_dropreg_valid[1]  = (req_dropped_lat & ipc_unit_sel_pa[1]) | 
                               (ipc_dropreg_valid_pa[1] & ~(ipc_unit_sel_pa[1] & req_dropped_lat_));

assign ipc_dropreg_valid[2]  = (req_dropped_lat & ipc_unit_sel_pa[2]) | 
                               (ipc_dropreg_valid_pa[2] & ~(ipc_unit_sel_pa[2] & req_dropped_lat_));

assign ipc_dropreg_valid[3]  = (req_dropped_lat & ipc_unit_sel_pa[3]) | 
                               (ipc_dropreg_valid_pa[3] & ~(ipc_unit_sel_pa[3] & req_dropped_lat_));


// enables for writing into drop regs
// write into drop regs when they are not valid. If valid then we need to hold their values, until
// the req is sent out and not dropped

assign ipc_dropreg_wen[3:0] = ~ipc_dropreg_valid[3:0];

assign dropreg0_in[8:0] = ({9{ipc_unit_sel_l1[0]}} & op_req_l1[8:0]) |
                          ({9{~ipc_unit_sel_l1[0]}} & dropreg0[8:0]);

assign dropreg1_in[8:0] = ({9{ipc_unit_sel_l1[1]}} & op_req_l1[8:0]) |
                          ({9{~ipc_unit_sel_l1[1]}} & dropreg1[8:0]);

assign dropreg2_in[8:0] = ({9{ipc_unit_sel_l1[2]}} & op_req_l1[8:0]) |
                          ({9{~ipc_unit_sel_l1[2]}} & dropreg2[8:0]);

assign dropreg3_in[8:0] = ({9{ipc_unit_sel_l1[3]}} & op_req_l1[8:0]) |
                          ({9{~ipc_unit_sel_l1[3]}} & dropreg3[8:0]);

// generate the request to PCX. This get latched in PCX before being used.


//assign op_req_l1[8:0] = ({9{sel_repeat_drop_l1}} & req_pa[8:0]) |
//                     ({9{sel_repeat_ndrop_l1}} & req_l1[8:0]) |
//                     ({9{sel_nrepeat_drop_l1}} & req_nrepeat_drop_l1[8:0]) |
//                     ({9{sel_nrepeat_ndrop_l1}} & req_nrepeat_ndrop_l1[8:0]);

assign op_req_l1[8:0] = ({9{req_dropped_lat}} & ipc_req_repeat_drop_l1[8:0]) |
                     ({9{req_dropped_lat_}} & ipc_req_repeat_ndrop_l1[8:0]) |
                     (req_nrepeat_drop_l1[8:0]) |
                     (req_nrepeat_ndrop_l1[8:0]);

// for timing reasons, generate an early version of op_req_l1 in li stage, send to dp where it is latched and
// sent to ccx.
assign ipc_op_req_li[8:0] = ({9{req_dropped}} & req_repeat_drop_li[8:0]) |
                            ({9{req_dropped_}} & req_repeat_ndrop_li[8:0]) |
                            (req_nrepeat_drop_li[8:0]) |
                            (req_nrepeat_ndrop_li[8:0]);

assign atm_pq[8:0] = ipc_atm_l1[8:0] & {9{~(ipc_unit_sel_pa[2] & req_dropped_lat)}};

// for timing reasons, generate an early version of atm_pq in li stage, send to dp where it is latched and
// sent to ccx.

assign ipc_atm_req_li[8:0] = atm_req_li[8:0] & {9{~(ipc_unit_sel_l1[2] & req_dropped)}};


// on an atomic request, the second packet is sent out without req_pq.
// l15_pqm_ctl still needs to know about this request.
assign req_pq[8:0] = op_req_l1[8:0] | atm_pa[8:0];


// enable for sending data out in PA, for power saving
assign ipc_pq_valid = |(req_pq[8:0]);
assign ipc_pq_clken = ipc_pq_valid | ~gkt_pmen;


// determine requests being dropped in l1.

assign ifu_ndropped_l1 = ~(ipc_unit_sel_l1[0] & req_dropped);
assign mmu_ndropped_l1 = ~(ipc_unit_sel_l1[1] & req_dropped);
assign lsu_ndropped_l1 = ~(ipc_unit_sel_l1[2] & req_dropped);
assign spu_ndropped_l1 = ~(ipc_unit_sel_l1[3] & req_dropped);


// drive selects to ipd datapath

assign ipc_sel_ndrop_ifu_l1 = ipc_unit_sel_l1[0] & ~ipc_dropreg_valid[0];
assign ipc_sel_ndrop_mmu_l1 = ipc_unit_sel_l1[1] & ~ipc_dropreg_valid[1];
assign ipc_sel_ndrop_lsu_l1 = ipc_unit_sel_l1[2] & ~ipc_dropreg_valid[2];
assign ipc_sel_ndrop_spu_l1 = ipc_unit_sel_l1[3] & ~ipc_dropreg_valid[3];
assign ipc_sel_drop_ifu_l1 = ipc_unit_sel_l1[0] & ipc_dropreg_valid[0];
assign ipc_sel_drop_mmu_l1 = ipc_unit_sel_l1[1] & ipc_dropreg_valid[1];
assign ipc_sel_drop_lsu_l1 = ipc_unit_sel_l1[2] & ipc_dropreg_valid[2];
assign ipc_sel_drop_spu_l1 = ipc_unit_sel_l1[3] & ipc_dropreg_valid[3];

///////////////////////////////////////////////////////////////////////
// PA CYCLE
///////////////////////////////////////////////////////////////////////
// count number of dropped requests for each unit

// increment the counter on every dropped request,
// clear the counter when the requests succeeds  (not dropped),
// hold the counter when not incrementing or not clearing
assign ifu_dropped_pa = (ipc_unit_sel_pa[0] & req_dropped_lat);
assign mmu_dropped_pa = (ipc_unit_sel_pa[1] & req_dropped_lat);
assign lsu_dropped_pa = (ipc_unit_sel_pa[2] & req_dropped_lat);
assign spu_dropped_pa = (ipc_unit_sel_pa[3] & req_dropped_lat);

assign ifu_success_pa = (ipc_unit_sel_pa[0] & ~req_dropped_lat);
assign mmu_success_pa = (ipc_unit_sel_pa[1] & ~req_dropped_lat);
assign lsu_success_pa = (ipc_unit_sel_pa[2] & ~req_dropped_lat);
assign spu_success_pa = (ipc_unit_sel_pa[3] & ~req_dropped_lat);


assign inc_ifu = ifu_dropped_pa & ~max_count_reached;
assign clear_ifu = ifu_success_pa;
assign hold_ifu = ~inc_ifu & ~clear_ifu;


assign ifu_drop_cnt[2:0] = ({3{inc_ifu}} & (ifu_drop_cnt_lat[2:0] + 3'b001)) |
                           ({3{clear_ifu}} & 3'b000) |
                           ({3{hold_ifu}} & ifu_drop_cnt_lat[2:0]);

assign inc_mmu = mmu_dropped_pa & ~max_count_reached;
assign clear_mmu = mmu_success_pa;
assign hold_mmu = ~inc_mmu & ~clear_mmu;


assign mmu_drop_cnt[2:0] = ({3{inc_mmu}} & (mmu_drop_cnt_lat[2:0] + 3'b001)) |
                           ({3{clear_mmu}} & 3'b000) |
                           ({3{hold_mmu}} & mmu_drop_cnt_lat[2:0]);

assign inc_lsu = lsu_dropped_pa & ~max_count_reached;
assign clear_lsu = lsu_success_pa;
assign hold_lsu = ~inc_lsu & ~clear_lsu;


assign lsu_drop_cnt[2:0] = ({3{inc_lsu}} & (lsu_drop_cnt_lat[2:0] + 3'b001)) |
                           ({3{clear_lsu}} & 3'b000) |
                           ({3{hold_lsu}} & lsu_drop_cnt_lat[2:0]);

assign inc_spu = spu_dropped_pa & ~max_count_reached;
assign clear_spu = spu_success_pa;
assign hold_spu = ~inc_spu & ~clear_spu;


assign spu_drop_cnt[2:0] = ({3{inc_spu}} & (spu_drop_cnt_lat[2:0] + 3'b001)) |
                           ({3{clear_spu}} & 3'b000) |
                           ({3{hold_spu}} & spu_drop_cnt_lat[2:0]);


assign max_count_reached_in = (ifu_drop_cnt[2:0] == 3'b111) |
                              (mmu_drop_cnt[2:0] == 3'b111) |
                              (lsu_drop_cnt[2:0] == 3'b111) |
                              (spu_drop_cnt[2:0] == 3'b111);

                              
assign force_ifu_in = ifu_drop_cnt[2:0] == 3'b111;
assign force_mmu_in = mmu_drop_cnt[2:0] == 3'b111;
assign force_lsu_in = lsu_drop_cnt[2:0] == 3'b111;
assign force_spu_in = spu_drop_cnt[2:0] == 3'b111;

assign force_ifu_mmu_in = force_ifu_in | force_mmu_in;
assign force_lsu_spu_in = force_lsu_in | force_spu_in;



gkt_ipc_ctl_msff_ctl_macro__width_13 drop_cnt
  (
   .scan_in(drop_cnt_scanin),
   .scan_out(drop_cnt_scanout),
   .din     ({max_count_reached_in, ifu_drop_cnt[2:0],mmu_drop_cnt[2:0],lsu_drop_cnt[2:0],spu_drop_cnt[2:0]}),
   .dout    ({max_count_reached, ifu_drop_cnt_lat[2:0], mmu_drop_cnt_lat[2:0], lsu_drop_cnt_lat[2:0], spu_drop_cnt_lat[2:0]}),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

gkt_ipc_ctl_msff_ctl_macro__width_6 force_req
  (
   .scan_in(force_req_scanin),
   .scan_out(force_req_scanout),
   .din     ({force_ifu_in, force_mmu_in, force_lsu_in, force_spu_in, force_ifu_mmu_in, force_lsu_spu_in}),
   .dout    ({force_ifu, force_mmu, force_lsu, force_spu, force_ifu_mmu, force_lsu_spu}),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// At any time, only one unit can reach max drop count, and so only one unit can be forced.
// 0in bits_on -var {force_ifu, force_mmu, force_lsu, force_spu} -max 1 





///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
// PERFORMANCE MONITOR COUNTER SIGNALS
// {8 - valid; 7:5 - tid; 4:0 - { mmu_pkt, dstore_pkt, ifetch_pkt, dload_pkt, sstore_pkt, sload_pkt}
/////////////////////////////////////////////////////////////////////
// decode the pcx packet
assign ifetch_pkt = ipd_optype[7];
assign dload_pkt = ~ipd_optype[7] & ~ipd_optype[6] & ~ipd_optype[5] & ~ipd_optype[4] & ~ipd_optype[3];
assign dstore_pkt = ~ipd_optype[7] & ~ipd_optype[6] & ~ipd_optype[5] & ~ipd_optype[4] & ipd_optype[3];
assign sload_pkt =  ~ipd_optype[7] & ~ipd_optype[6] & ipd_optype[5] & ~ipd_optype[4] & ~ipd_optype[3];
assign sstore_pkt =  ~ipd_optype[7] & ~ipd_optype[6] & ipd_optype[5] & ~ipd_optype[4] & ipd_optype[3];
assign mmu_pkt = ipd_optype[6] & ~ipd_optype[3];
assign ma_pkt = ipd_optype[8];



// encode the packet type into 3 bits

assign pcx_pkt[2:0] = ({3{dload_pkt}}  & 3'b000) |
                      ({3{dstore_pkt}} & 3'b001) |
                      ({3{sload_pkt & ~ma_pkt}}  & 3'b010) |
                      ({3{sstore_pkt & ~ma_pkt}} & 3'b011) |
                      ({3{mmu_pkt}}    & 3'b100) |
                      ({3{ifetch_pkt}} & 3'b101) |
                      ({3{sload_pkt & ma_pkt}}  & 3'b110) |
                      ({3{sstore_pkt & ma_pkt}} & 3'b111);




assign tid_pkt[2:0] = ipd_optype[2:0];
assign valid_pkt = (|req_pa[8:0]) & ~req_dropped_lat;
assign xbar_optype[6:0] = {valid_pkt, tid_pkt[2:0], pcx_pkt[2:0]};



 
gkt_ipc_ctl_msff_ctl_macro__width_7 dff_xbar_type
  (
   .scan_in(dff_xbar_type_scanin),
   .scan_out(dff_xbar_type_scanout),
   .din           (xbar_optype[6:0]),
   .dout             (l15_pmu_xbar_optype[6:0]),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

gkt_ipc_ctl_msff_ctl_macro__width_4 dff_unit_sel_pa_type
  (
   .scan_in(dff_unit_sel_pa_type_scanin),
   .scan_out(dff_unit_sel_pa_type_scanout),
   .din           (ipc_unit_sel_l1[3:0]),
   .dout             (ipc_unit_sel_pa[3:0]),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

gkt_ipc_ctl_msff_ctl_macro__width_4 dff_unit_ndrop_pa
  (
   .scan_in(dff_unit_ndrop_pa_scanin),
   .scan_out(dff_unit_ndrop_pa_scanout),
   .din           ({ifu_ndropped_l1, mmu_ndropped_l1, lsu_ndropped_l1, spu_ndropped_l1}),
   .dout          ({ifu_ndropped_pa, mmu_ndropped_pa, lsu_ndropped_pa, spu_ndropped_pa}),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


gkt_ipc_ctl_msff_ctl_macro__width_1 dff_req_drop_lat
  (
   .scan_in(dff_req_drop_lat_scanin),
   .scan_out(dff_req_drop_lat_scanout),
   .din           (req_dropped),
   .dout             (req_dropped_lat),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


gkt_ipc_ctl_msff_ctl_macro__width_1 dff_req_drop_latx
  (
   .scan_in(dff_req_drop_latx_scanin),
   .scan_out(dff_req_drop_latx_scanout),
   .din           (req_dropped_),
   .dout             (req_dropped_lat_),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

gkt_ipc_ctl_msff_ctl_macro__width_4 dff_dropreg_valid
  (
   .scan_in(dff_dropreg_valid_scanin),
   .scan_out(dff_dropreg_valid_scanout),
   .din           (ipc_dropreg_valid[3:0]),
   .dout             (ipc_dropreg_valid_pa[3:0]),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

gkt_ipc_ctl_msff_ctl_macro__width_9 dff_dropreg0
  (
   .scan_in(dff_dropreg0_scanin),
   .scan_out(dff_dropreg0_scanout),
   .din           (dropreg0_in[8:0]),
   .dout             (dropreg0[8:0]),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

gkt_ipc_ctl_msff_ctl_macro__width_9 dff_dropreg1
  (
   .scan_in(dff_dropreg1_scanin),
   .scan_out(dff_dropreg1_scanout),
   .din           (dropreg1_in[8:0]),
   .dout             (dropreg1[8:0]),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
gkt_ipc_ctl_msff_ctl_macro__width_9 dff_dropreg2
  (
   .scan_in(dff_dropreg2_scanin),
   .scan_out(dff_dropreg2_scanout),
   .din           (dropreg2_in[8:0]),
   .dout             (dropreg2[8:0]),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
gkt_ipc_ctl_msff_ctl_macro__width_9 dff_dropreg3
  (
   .scan_in(dff_dropreg3_scanin),
   .scan_out(dff_dropreg3_scanout),
   .din           (dropreg3_in[8:0]),
   .dout             (dropreg3[8:0]),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

gkt_ipc_ctl_msff_ctl_macro__width_9 dff_req_pa
  (
   .scan_in(dff_req_pa_scanin),
   .scan_out(dff_req_pa_scanout),
   .din           (op_req_l1[8:0]),
   .dout             (req_pa[8:0]),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

gkt_ipc_ctl_msff_ctl_macro__width_9 dff_atm_pa
  (
   .scan_in(dff_atm_pa_scanin),
   .scan_out(dff_atm_pa_scanout),
   .din           (atm_pq[8:0]),
   .dout             (atm_pa[8:0]),
   .l1clk         (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign pcx_grant_lb[8:0] = {9{~lbist_run}} & pcx_grant[8:0];


///*
//gkt_pqm_ctl AUTO_TEMPLATE
//  (
//   // Outputs
//   .scan_in(AUTO_TEMPLATE_scanin),
//   .scan_out(AUTO_TEMPLATE_scanout),
//   .pqm_req_drop (pqm_req_drop[@]),
//   .pqm_empty (pqm_empty[@]),
//   // Inputs
//   .spc_pcx_req_pq (req_pq[@]),
//   .pcx_grant (pcx_grant_lb[@]));
//*/

gkt_pqm_ctl pqm0 (/*AUTOINST*/ 
                  // Outputs
                  .pqm_req_drop         (pqm_req_drop[0]),       // Templated
                  .pqm_empty            (pqm_empty[0]),          // Templated
                  // Inputs
                  .scan_in(pqm0_scanin),
                  .scan_out(pqm0_scanout),
                  .l1clk                (l1clk),
                  .spc_pcx_req_pq       (req_pq[0]),             // Templated
                  .pcx_grant            (pcx_grant_lb[0]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));      // Templated

gkt_pqm_ctl pqm1 (/*AUTOINST*/ 
                  // Outputs
                  .pqm_req_drop         (pqm_req_drop[1]),       // Templated
                  .pqm_empty            (pqm_empty[1]),          // Templated
                  // Inputs
                  .scan_in(pqm1_scanin),
                  .scan_out(pqm1_scanout),
                  .l1clk                (l1clk),
                  .spc_pcx_req_pq       (req_pq[1]),             // Templated
                  .pcx_grant            (pcx_grant_lb[1]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));      // Templated

gkt_pqm_ctl pqm2 (/*AUTOINST*/ 
                  // Outputs
                  .pqm_req_drop         (pqm_req_drop[2]),       // Templated
                  .pqm_empty            (pqm_empty[2]),          // Templated
                  // Inputs
                  .scan_in(pqm2_scanin),
                  .scan_out(pqm2_scanout),
                  .l1clk                (l1clk),
                  .spc_pcx_req_pq       (req_pq[2]),             // Templated
                  .pcx_grant            (pcx_grant_lb[2]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));      // Templated

gkt_pqm_ctl pqm3  (/*AUTOINST*/ 
                   // Outputs
                   .pqm_req_drop        (pqm_req_drop[3]),       // Templated
                   .pqm_empty           (pqm_empty[3]),          // Templated
                   // Inputs
                   .scan_in(pqm3_scanin),
                   .scan_out(pqm3_scanout),
                   .l1clk               (l1clk),
                   .spc_pcx_req_pq      (req_pq[3]),             // Templated
                   .pcx_grant           (pcx_grant_lb[3]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));      // Templated

gkt_pqm_ctl pqm4 (/*AUTOINST*/ 
                  // Outputs
                  .pqm_req_drop         (pqm_req_drop[4]),       // Templated
                  .pqm_empty            (pqm_empty[4]),          // Templated
                  // Inputs
                  .scan_in(pqm4_scanin),
                  .scan_out(pqm4_scanout),
                  .l1clk                (l1clk),
                  .spc_pcx_req_pq       (req_pq[4]),             // Templated
                  .pcx_grant            (pcx_grant_lb[4]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));      // Templated

gkt_pqm_ctl pqm5 (/*AUTOINST*/ 
                  // Outputs
                  .pqm_req_drop         (pqm_req_drop[5]),       // Templated
                  .pqm_empty            (pqm_empty[5]),          // Templated
                  // Inputs
                  .scan_in(pqm5_scanin),
                  .scan_out(pqm5_scanout),
                  .l1clk                (l1clk),
                  .spc_pcx_req_pq       (req_pq[5]),             // Templated
                  .pcx_grant            (pcx_grant_lb[5]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));      // Templated

gkt_pqm_ctl pqm6 (/*AUTOINST*/ 
                  // Outputs
                  .pqm_req_drop         (pqm_req_drop[6]),       // Templated
                  .pqm_empty            (pqm_empty[6]),          // Templated
                  // Inputs
                  .scan_in(pqm6_scanin),
                  .scan_out(pqm6_scanout),
                  .l1clk                (l1clk),
                  .spc_pcx_req_pq       (req_pq[6]),             // Templated
                  .pcx_grant            (pcx_grant_lb[6]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));      // Templated

gkt_pqm_ctl pqm7 (/*AUTOINST*/ 
                  // Outputs
                  .pqm_req_drop         (pqm_req_drop[7]),       // Templated
                  .pqm_empty            (pqm_empty[7]),          // Templated
                  // Inputs
                  .scan_in(pqm7_scanin),
                  .scan_out(pqm7_scanout),
                  .l1clk                (l1clk),
                  .spc_pcx_req_pq       (req_pq[7]),             // Templated
                  .pcx_grant            (pcx_grant_lb[7]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));      // Templated

gkt_pqm_ctl pqm8 (/*AUTOINST*/ 
                  // Outputs
                  .pqm_req_drop         (pqm_req_drop[8]),       // Templated
                  .pqm_empty            (pqm_empty[8]),          // Templated
                  // Inputs
                  .scan_in(pqm8_scanin),
                  .scan_out(pqm8_scanout),
                  .l1clk                (l1clk),
                  .spc_pcx_req_pq       (req_pq[8]),             // Templated
                  .pcx_grant            (pcx_grant_lb[8]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));      // Templated


////////////////////////////////////////////////////////
// SPARE CELLS
////////////////////////////////////////////////////////
gkt_ipc_ctl_spare_ctl_macro__num_5 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
////////////////////////////////////////////////////////

// fixscan start:
assign pmen_reg_scanin           = scan_in                  ;
assign dff_ncu_pb_scanin         = pmen_reg_scanout         ;
assign dff_pb_sel_scanin         = dff_ncu_pb_scanout       ;
assign dff_ifu_req_v0_scanin     = dff_pb_sel_scanout       ;
assign dff_ifu_req_v1_scanin     = dff_ifu_req_v0_scanout   ;
assign dff_ifu_v0_scanin         = dff_ifu_req_v1_scanout   ;
assign dff_ifu_v1_scanin         = dff_ifu_v0_scanout       ;
assign dff_mmu_req_v0_scanin     = dff_ifu_v1_scanout       ;
assign dff_mmu_req_v1_scanin     = dff_mmu_req_v0_scanout   ;
assign dff_mmu_v0_scanin         = dff_mmu_req_v1_scanout   ;
assign dff_mmu_v1_scanin         = dff_mmu_v0_scanout       ;
assign dff_lsu_req_v0_scanin     = dff_mmu_v1_scanout       ;
assign dff_lsu_req_v1_scanin     = dff_lsu_req_v0_scanout   ;
assign dff_lsu_v0_scanin         = dff_lsu_req_v1_scanout   ;
assign dff_lsu_v1_scanin         = dff_lsu_v0_scanout       ;
assign dff_lsu_lock_v0_scanin    = dff_lsu_v1_scanout       ;
assign dff_lsu_lock_v1_scanin    = dff_lsu_lock_v0_scanout  ;
assign dff_spu_req_v0_scanin     = dff_lsu_lock_v1_scanout  ;
assign dff_spu_req_v1_scanin     = dff_spu_req_v0_scanout   ;
assign dff_spu_v0_scanin         = dff_spu_req_v1_scanout   ;
assign dff_spu_v1_scanin         = dff_spu_v0_scanout       ;
assign lock_reg_scanin           = dff_spu_v1_scanout       ;
assign favori_reg_scanin         = lock_reg_scanout         ;
assign favorim_reg_scanin        = favori_reg_scanout       ;
assign favorls_reg_scanin        = favorim_reg_scanout      ;
assign sel_reg_scanin            = favorls_reg_scanout      ;
assign grant_reg_scanin          = sel_reg_scanout          ;
assign l1_atm_req_reg_scanin     = grant_reg_scanout        ;
assign req_nrepeat_drop_reg_scanin = l1_atm_req_reg_scanout   ;
assign req_nrepeat_ndrop_reg_scanin = req_nrepeat_drop_reg_scanout;
assign req_repeat_drop_reg_scanin = req_nrepeat_ndrop_reg_scanout;
assign req_repeat_ndrop_reg_scanin = req_repeat_drop_reg_scanout;
assign drop_cnt_scanin             = req_repeat_ndrop_reg_scanout;
assign force_req_scanin            = drop_cnt_scanout;
assign dff_xbar_type_scanin      = force_req_scanout;
assign dff_unit_sel_pa_type_scanin = dff_xbar_type_scanout    ;
assign dff_unit_ndrop_pa_scanin = dff_unit_sel_pa_type_scanout;
assign dff_req_drop_lat_scanin   = dff_unit_ndrop_pa_scanout;
assign dff_req_drop_latx_scanin  = dff_req_drop_lat_scanout ;
assign dff_dropreg_valid_scanin  = dff_req_drop_latx_scanout;
assign dff_dropreg0_scanin       = dff_dropreg_valid_scanout;
assign dff_dropreg1_scanin       = dff_dropreg0_scanout     ;
assign dff_dropreg2_scanin       = dff_dropreg1_scanout     ;
assign dff_dropreg3_scanin       = dff_dropreg2_scanout     ;
assign dff_req_pa_scanin         = dff_dropreg3_scanout     ;
assign dff_atm_pa_scanin         = dff_req_pa_scanout       ;
assign pqm0_scanin               = dff_atm_pa_scanout       ;
assign pqm1_scanin               = pqm0_scanout             ;
assign pqm2_scanin               = pqm1_scanout             ;
assign pqm3_scanin               = pqm2_scanout             ;
assign pqm4_scanin               = pqm3_scanout             ;
assign pqm5_scanin               = pqm4_scanout             ;
assign pqm6_scanin               = pqm5_scanout             ;
assign pqm7_scanin               = pqm6_scanout             ;
assign pqm8_scanin               = pqm7_scanout             ;

assign spares_scanin             = pqm8_scanout             ;
assign scan_out                  = spares_scanout           ;


// fixscan end:
endmodule







// any PARAMS parms go into naming of macro

module gkt_ipc_ctl_l1clkhdr_ctl_macro (
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

module gkt_ipc_ctl_msff_ctl_macro__width_1 (
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

module gkt_ipc_ctl_msff_ctl_macro__width_5 (
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

module gkt_ipc_ctl_msff_ctl_macro__width_6 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0];






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module gkt_ipc_ctl_msff_ctl_macro__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [7:0] so;

  input [8:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output scan_out;
assign fdin[8:0] = din[8:0];






dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);












endmodule













// any PARAMS parms go into naming of macro

module gkt_ipc_ctl_msff_ctl_macro__width_4 (
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













// any PARAMS parms go into naming of macro

module gkt_ipc_ctl_msff_ctl_macro__width_13 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [12:0] fdin;
wire [11:0] so;

  input [12:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [12:0] dout;
  output scan_out;
assign fdin[12:0] = din[12:0];






dff #(13)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[12:0]),
.si({scan_in,so[11:0]}),
.so({so[11:0],scan_out}),
.q(dout[12:0])
);












endmodule













// any PARAMS parms go into naming of macro

module gkt_ipc_ctl_msff_ctl_macro__width_7 (
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

module gkt_ipc_ctl_msff_ctl_macro__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module gkt_ipc_ctl_spare_ctl_macro__num_5 (
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
assign scan_out = so_4;



endmodule

