// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mmu_htd_dp.v
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
module mmu_htd_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  tcu_muxtest, 
  tcu_dectest, 
  scan_out, 
  htc_core_running, 
  htc_m1_clken, 
  htc_hw3_clken, 
  htc_hw4_clken, 
  asd0_tag_access, 
  asd1_tag_access, 
  htc_tsbrd_valid_m0, 
  asi_data_in_real, 
  ase_lsu_va_w, 
  lsu_context_b, 
  lsu_tlu_dsfsr_ct_b, 
  l15_spc_data1, 
  l15_mmu_cpkt, 
  l15_mmu_grant, 
  htc_zero_ctx_m2, 
  htc_ranotpa_hw4, 
  htc_pid0_m0, 
  htc_pid1_m0, 
  htc_thr_prevalid_hw3, 
  htc_va_rd_m2_in, 
  htc_l15_en, 
  htc_vld_tsbptr_m2, 
  trs_null_st, 
  htc_mra_sel_0, 
  htc_sel_mra_lo, 
  mra0_data, 
  mra1_data, 
  htc_conf_index_m2, 
  htc_upd_pred_idx_hw2, 
  htc_upd_grp, 
  htc_upd_grp_x, 
  htc_new_pred_bit, 
  htc_wrpred0_hw2, 
  htc_wrpred1_hw2, 
  htc_wrpred2_hw2, 
  htc_wrpred3_hw2, 
  htc_wr_q0new_nogrant, 
  htc_wr_q0new_grant, 
  htc_wr_q1new, 
  htc_shift_q1_grant, 
  htc_wr_m3new, 
  htc_wr_m3q0, 
  htc_rd_tteq, 
  tlu_iht_request, 
  tlu_dht_request, 
  tlu_mmu_tl_gt_0, 
  tlu_pc_0_w, 
  tlu_pc_1_w, 
  asd_i_p_ctx_0_0, 
  asd_i_p_ctx_0_1, 
  asd_i_p_ctx_0_2, 
  asd_i_p_ctx_0_3, 
  asd_i_p_ctx_0_4, 
  asd_i_p_ctx_0_5, 
  asd_i_p_ctx_0_6, 
  asd_i_p_ctx_0_7, 
  htd_range_en_hw4, 
  htd_zeroctx_hw1, 
  htd_usectx0_hw1, 
  htd_usectx1_hw1, 
  htd_ranotpa_hw1, 
  htd_ptr_hit0_hw1, 
  htd_ptr_hit1_hw1, 
  htd_ptr_hit2_hw1, 
  htd_ctx_hit_hw1, 
  htd_tte_ep_hw1, 
  htd_dmiss_hw1, 
  htd_ra2pa_lower_hit_hw4, 
  htd_ra2pa_upper_hit_hw4, 
  htd_razero_hw4, 
  htd_tagaccess_din, 
  htd_tlbdatain_din, 
  mmu_l15_addr, 
  htd_dmiss, 
  htd_sec_ctx, 
  htd_pred0_idx_m0, 
  htd_pred1_idx_m0, 
  htd_pred0_m0, 
  htd_pred1_m0, 
  htd_tsbptr, 
  htd_zeroctx_m0);
wire stop;
wire test;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire [7:0] tlu_mmu_tl_gt_0_;
wire [7:0] tlb_miss_m;
wire reg_tlbmiss_w30_scanin;
wire reg_tlbmiss_w30_scanout;
wire [7:0] va_rd_m2;
wire [7:0] tlb_miss_m0;
wire lsu_sec_ctx_w;
wire [12:0] lsu_context_w;
wire [12:0] i_context_0;
wire [12:0] i_context_1;
wire [12:0] i_context_2;
wire [12:0] i_context_3;
wire [12:0] i_context_4;
wire [12:0] i_context_5;
wire [12:0] i_context_6;
wire [12:0] i_context_7;
wire reg0_vactx_w50_scanin;
wire reg0_vactx_w50_scanout;
wire [47:13] thr0_va_ff;
wire [12:0] htd_thr0_ctx_ff;
wire reg1_vactx_w50_scanin;
wire reg1_vactx_w50_scanout;
wire [47:13] thr1_va_ff;
wire [12:0] htd_thr1_ctx_ff;
wire reg2_vactx_w50_scanin;
wire reg2_vactx_w50_scanout;
wire [47:13] thr2_va_ff;
wire [12:0] htd_thr2_ctx_ff;
wire reg3_vactx_w50_scanin;
wire reg3_vactx_w50_scanout;
wire [47:13] thr3_va_ff;
wire [12:0] htd_thr3_ctx_ff;
wire reg4_vactx_w50_scanin;
wire reg4_vactx_w50_scanout;
wire [47:13] thr4_va_ff;
wire [12:0] htd_thr4_ctx_ff;
wire reg5_vactx_w50_scanin;
wire reg5_vactx_w50_scanout;
wire [47:13] thr5_va_ff;
wire [12:0] htd_thr5_ctx_ff;
wire reg6_vactx_w50_scanin;
wire reg6_vactx_w50_scanout;
wire [47:13] thr6_va_ff;
wire [12:0] htd_thr6_ctx_ff;
wire reg7_vactx_w50_scanin;
wire reg7_vactx_w50_scanout;
wire [47:13] thr7_va_ff;
wire [12:0] htd_thr7_ctx_ff;
wire [7:0] htd_zeroctx_m0_prebuf;
wire [47:28] va0_m0;
wire [12:0] ctx0_m0;
wire [47:28] va1_m0;
wire [12:0] ctx1_m0;
wire [2:0] pid0_m0;
wire [2:0] pid1_m0;
wire prty0_5_1;
wire prty0_5_0;
wire prty0_4_1;
wire prty0_4_0;
wire prty0_3_1;
wire prty0_3_0;
wire prty0_2_1;
wire prty0_2_0;
wire prty0_1_1;
wire prty0_1_0;
wire prty0_0_1;
wire prty0_0_0;
wire prty1_5_1;
wire prty1_5_0;
wire prty1_4_1;
wire prty1_4_0;
wire prty1_3_1;
wire prty1_3_0;
wire prty1_2_1;
wire prty1_2_0;
wire prty1_1_1;
wire prty1_1_0;
wire prty1_0_1;
wire prty1_0_0;
wire [81:0] mra_data;
wire [63:0] tsb_conf;
wire reg_tsbconf_m2_w39_scanin;
wire reg_tsbconf_m2_w39_scanout;
wire [63:0] tsb_conf_m2;
wire sun4v_unused;
wire hwtwen_unused;
wire [6:0] cfg_ctlpkt_m2;
wire [6:0] thrx_cfg3_ctlpkt;
wire [6:0] thrx_cfg2_ctlpkt;
wire [6:0] thrx_cfg1_ctlpkt;
wire [6:0] thrx_cfg0_ctlpkt;
wire [6:0] thrx_cfg3_ctlpkt_in;
wire [6:0] thrx_cfg2_ctlpkt_in;
wire [6:0] thrx_cfg1_ctlpkt_in;
wire [6:0] thrx_cfg0_ctlpkt_in;
wire reg0_tsbcfg_w28_scanin;
wire reg0_tsbcfg_w28_scanout;
wire [6:0] thr0_cfg3_ctlpkt;
wire [6:0] thr0_cfg2_ctlpkt;
wire [6:0] thr0_cfg1_ctlpkt;
wire [6:0] thr0_cfg0_ctlpkt;
wire reg1_tsbcfg_w28_scanin;
wire reg1_tsbcfg_w28_scanout;
wire [6:0] thr1_cfg3_ctlpkt;
wire [6:0] thr1_cfg2_ctlpkt;
wire [6:0] thr1_cfg1_ctlpkt;
wire [6:0] thr1_cfg0_ctlpkt;
wire reg2_tsbcfg_w28_scanin;
wire reg2_tsbcfg_w28_scanout;
wire [6:0] thr2_cfg3_ctlpkt;
wire [6:0] thr2_cfg2_ctlpkt;
wire [6:0] thr2_cfg1_ctlpkt;
wire [6:0] thr2_cfg0_ctlpkt;
wire reg3_tsbcfg_w28_scanin;
wire reg3_tsbcfg_w28_scanout;
wire [6:0] thr3_cfg3_ctlpkt;
wire [6:0] thr3_cfg2_ctlpkt;
wire [6:0] thr3_cfg1_ctlpkt;
wire [6:0] thr3_cfg0_ctlpkt;
wire reg4_tsbcfg_w28_scanin;
wire reg4_tsbcfg_w28_scanout;
wire [6:0] thr4_cfg3_ctlpkt;
wire [6:0] thr4_cfg2_ctlpkt;
wire [6:0] thr4_cfg1_ctlpkt;
wire [6:0] thr4_cfg0_ctlpkt;
wire reg5_tsbcfg_w28_scanin;
wire reg5_tsbcfg_w28_scanout;
wire [6:0] thr5_cfg3_ctlpkt;
wire [6:0] thr5_cfg2_ctlpkt;
wire [6:0] thr5_cfg1_ctlpkt;
wire [6:0] thr5_cfg0_ctlpkt;
wire reg6_tsbcfg_w28_scanin;
wire reg6_tsbcfg_w28_scanout;
wire [6:0] thr6_cfg3_ctlpkt;
wire [6:0] thr6_cfg2_ctlpkt;
wire [6:0] thr6_cfg1_ctlpkt;
wire [6:0] thr6_cfg0_ctlpkt;
wire reg7_tsbcfg_w28_scanin;
wire reg7_tsbcfg_w28_scanout;
wire [6:0] thr7_cfg3_ctlpkt;
wire [6:0] thr7_cfg2_ctlpkt;
wire [6:0] thr7_cfg1_ctlpkt;
wire [6:0] thr7_cfg0_ctlpkt;
wire [47:13] htd_va_prebuf;
wire [47:13] htd_va;
wire [39:13] htd_cfg_tsbbase;
wire [6:4] htd_pgsz_m2;
wire [3:0] htd_tsbsz_m2;
wire [23:0] vpn_m2;
wire [35:0] tsbptr0;
wire [35:0] tsbptr1;
wire [35:0] htd_tsbptr_m2;
wire [39:4] l15_addr;
wire reg_q1addr_w36_scanin;
wire reg_q1addr_w36_scanout;
wire [39:4] q1_addr;
wire [39:4] q0_addr;
wire [39:4] q0_addr_in_nogrant;
wire reg_q0addr_ng_w36_scanin;
wire reg_q0addr_ng_w36_scanout;
wire [39:4] q0_addr_nogrant;
wire [39:4] q0_addr_in_grant;
wire reg_q0addr_g_w36_scanin;
wire reg_q0addr_g_w36_scanout;
wire l15_mmu_grant_lat;
wire [39:4] q0_addr_grant;
wire [39:4] mmu_l15_addr_in;
wire reg_l15addr_w36_scanin;
wire reg_l15addr_w36_scanout;
wire tcu_muxtest_rep0;
wire htd_dmiss_hw0;
wire [47:22] va_hw0;
wire [12:0] ctx_hw0;
wire reg_vpn_w40_scanin;
wire reg_vpn_w40_scanout;
wire [47:22] va_hw1;
wire [12:0] ctx_hw1;
wire tcu_muxtest_rep1;
wire [6:0] cfg3_ctlpkt_hw0;
wire [6:0] cfg2_ctlpkt_hw0;
wire [6:0] cfg1_ctlpkt_hw0;
wire [6:0] cfg0_ctlpkt_hw0;
wire reg_tsbcfg_hw1_w30_scanin;
wire reg_tsbcfg_hw1_w30_scanout;
wire [4:3] l15_mmu_cpkt_hw1;
wire [6:0] cfg3_ctlpkt_hw1;
wire [6:0] cfg2_ctlpkt_hw1;
wire [6:0] cfg1_ctlpkt_hw1;
wire [6:0] cfg0_ctlpkt_hw1;
wire tcu_muxtest_rep2;
wire [6:0] cfg_ctlpkt_hw1;
wire reg_l15vahw1_w36_scanin;
wire reg_l15vahw1_w36_scanout;
wire [63:0] htd_tte_data_hw1;
wire [63:22] htd_tte_tag_ptr_hw1;
wire reg_l15ctx_w34_scanin;
wire reg_l15ctx_w34_scanout;
wire [2:0] htd_tte_rsvd0_hw1;
wire [5:0] htd_tte_rsvd1_hw1;
wire [60:48] htd_tte_tag_ctx_hw1;
wire reg_l15data_w49_scanin;
wire reg_l15data_w49_scanout;
wire tte_data_valid;
wire [3:0] tte_pgsz_hw1;
wire [2:0] tsb_pgsz_hw1;
wire [38:0] tte_data_hw1;
wire [47:22] thrx_vpn_hw1;
wire [63:22] tte_tag_hw1;
wire [2:0] tte_rsvdx;
wire tte_rsvd;
wire [3:0] tte_pgsz_hw1_;
wire [2:2] pgsize_illegal_;
wire [2:0] pgsize_illegal;
wire pg_illegal_1_0;
wire pg_illegal_1_1;
wire pg_illegal_1_2;
wire pg_illegal_0_0;
wire pg_illegal_0_1;
wire htd_razero_hw1;
wire [38:0] minbuf_tte_data_hw1;
wire e0_tte_reg_w40_scanin;
wire e0_tte_reg_w40_scanout;
wire [39:0] thr0_tte_data_hw2;
wire e1_tte_reg_w40_scanin;
wire e1_tte_reg_w40_scanout;
wire [39:0] thr1_tte_data_hw2;
wire e2_tte_reg_w40_scanin;
wire e2_tte_reg_w40_scanout;
wire [39:0] thr2_tte_data_hw2;
wire e3_tte_reg_w40_scanin;
wire e3_tte_reg_w40_scanout;
wire [39:0] thr3_tte_data_hw2;
wire e4_tte_reg_w40_scanin;
wire e4_tte_reg_w40_scanout;
wire [39:0] thr4_tte_data_hw2;
wire e5_tte_reg_w40_scanin;
wire e5_tte_reg_w40_scanout;
wire [39:0] thr5_tte_data_hw2;
wire e6_tte_reg_w40_scanin;
wire e6_tte_reg_w40_scanout;
wire [39:0] thr6_tte_data_hw2;
wire e7_tte_reg_w40_scanin;
wire e7_tte_reg_w40_scanout;
wire [39:0] thr7_tte_data_hw2;
wire pred_row0_w32_scanin;
wire pred_row0_w32_scanout;
wire [31:0] htd_newpred_hw2;
wire [31:0] pred_row0;
wire pred_row1_w32_scanin;
wire pred_row1_w32_scanout;
wire [31:0] pred_row1;
wire pred_row2_w32_scanin;
wire pred_row2_w32_scanout;
wire [31:0] pred_row2;
wire pred_row3_w32_scanin;
wire pred_row3_w32_scanout;
wire [31:0] pred_row3;
wire [15:0] htd_pred0_m0_prebuf;
wire [15:0] htd_pred1_m0_prebuf;
wire [31:0] htd_pred_hw2;
wire [31:0] new_row;
wire [31:0] old_row;
wire [31:0] new_pred_row;
wire [39:0] tte_data_hw3;
wire [27:13] ra_mask_hw3;
wire reg_ramaskhw4_w15_scanin;
wire reg_ramaskhw4_w15_scanout;
wire [27:13] htc_ra_mask_hw4;
wire reg_ttedatahw4_w40_scanin;
wire reg_ttedatahw4_w40_scanout;
wire [39:0] tte_data_hw4;
wire reg_offsethw4_w27_scanin;
wire reg_offsethw4_w27_scanout;
wire [39:13] offset0_hw4;
wire reg_rangehw4_w55_scanin;
wire reg_rangehw4_w55_scanout;
wire [63:0] range0_hw4;
wire [39:13] ra_mask_hw4;
wire [39:13] ra_mask_hw4_;
wire [39:13] tte_lo;
wire [39:13] tte_hi;
wire ra_to_pa_upper_hit_;
wire [39:13] tte_lo_;
wire ra_to_pa_lower_hit_;
wire [39:13] rg0_hi_;
wire [39:13] rg0_lo;
wire [31:0] sum0_unused;
wire [31:0] sum1_unused;
wire cout0;
wire [39:13] pa_0_din;
wire carry0_unused;
wire sum_unused;
wire [34:8] htd_tlbdatain;
wire [38:0] htd_tlbdatain_hw4;
wire reg_tlbdatainhw5_w39_scanin;
wire reg_tlbdatainhw5_w39_scanout;
wire [38:0] htd_tlbdatain_hw5;
wire [47:0] htd_tagaccess_din_prebuf;
wire lsu_tlu_dsfsr_ct_b_1_unused;
wire [25:0] l15_spc_data1_unused;
wire l15_mmu_cpkt_unused;


input            l2clk;
input            scan_in;
input            tcu_pce_ov;               // scan signals
input		spc_aclk;
input		spc_bclk;
input		 tcu_scan_en;
input        tcu_muxtest;
input        tcu_dectest;

output           scan_out;

input [7:0]      htc_core_running;
input            htc_m1_clken;
input            htc_hw3_clken;
input            htc_hw4_clken;

// tsbptr rd interface
input [47:0]     asd0_tag_access;
input [47:0]     asd1_tag_access;
input [7:0]      htc_tsbrd_valid_m0;


input            asi_data_in_real;
input [47:13]    ase_lsu_va_w;
input [12:0]  lsu_context_b;
input [1:0]      lsu_tlu_dsfsr_ct_b;


input [127:0]  l15_spc_data1;   // 16 bytes of return data from L2
input [8:3]      l15_mmu_cpkt;    // Control part of cpx packet
input            l15_mmu_grant;

input            htc_zero_ctx_m2;
input            htc_ranotpa_hw4;

input [2:0]      htc_pid0_m0;
input [2:0]      htc_pid1_m0;


input [7:0]      htc_thr_prevalid_hw3;
input [7:0]      htc_va_rd_m2_in;



input            htc_l15_en;
input  [7:0] htc_vld_tsbptr_m2;
input  [7:0] trs_null_st;
input            htc_mra_sel_0;
input            htc_sel_mra_lo;
input [81:0]     mra0_data;
input [81:0]     mra1_data;
input [1:0]      htc_conf_index_m2;

input [5:3]      htc_upd_pred_idx_hw2;
input [7:0]      htc_upd_grp;
input [7:0]      htc_upd_grp_x;
input [1:0]      htc_new_pred_bit;



input            htc_wrpred0_hw2;
input            htc_wrpred1_hw2;
input            htc_wrpred2_hw2;
input            htc_wrpred3_hw2;



input            htc_wr_q0new_nogrant;
input            htc_wr_q0new_grant;
input            htc_wr_q1new;
input            htc_shift_q1_grant;
input            htc_wr_m3new;
input            htc_wr_m3q0;


input  [7:0] htc_rd_tteq;

input [7:0]      tlu_iht_request;
input [7:0]      tlu_dht_request;
input [7:0]      tlu_mmu_tl_gt_0;   // zero context, TL > 0
input [47:13]    tlu_pc_0_w;        // PC for instruction in TG0
input [47:13]    tlu_pc_1_w;        // PC for instruction in TG1

input [12:0]   asd_i_p_ctx_0_0;     //Context register value per thread for Imiss
input [12:0]   asd_i_p_ctx_0_1;
input [12:0]   asd_i_p_ctx_0_2;
input [12:0]   asd_i_p_ctx_0_3;
input [12:0]   asd_i_p_ctx_0_4;
input [12:0]   asd_i_p_ctx_0_5;
input [12:0]   asd_i_p_ctx_0_6;
input [12:0]   asd_i_p_ctx_0_7;


//input            htc_thr0_tte_hw1;
//input            htc_thr1_tte_hw1;
//input            htc_thr2_tte_hw1;
//input            htc_thr3_tte_hw1;
//input            htc_thr4_tte_hw1;
//input            htc_thr5_tte_hw1;
//input            htc_thr6_tte_hw1;


output           htd_range_en_hw4;
output           htd_zeroctx_hw1;
output           htd_usectx0_hw1;
output           htd_usectx1_hw1;
output           htd_ranotpa_hw1;
output           htd_ptr_hit0_hw1;
output           htd_ptr_hit1_hw1;
output           htd_ptr_hit2_hw1;
output           htd_ctx_hit_hw1;
output           htd_tte_ep_hw1;
output           htd_dmiss_hw1;


output           htd_ra2pa_lower_hit_hw4;
output           htd_ra2pa_upper_hit_hw4;
output           htd_razero_hw4;
output [47:0] htd_tagaccess_din;
output [38:0] htd_tlbdatain_din;
output [39:4] mmu_l15_addr;
output [7:0]     htd_dmiss;
output [7:0]     htd_sec_ctx;


output [5:0]     htd_pred0_idx_m0;
output [5:0]     htd_pred1_idx_m0;

output [15:0]    htd_pred0_m0;         // read to predict
output [15:0]    htd_pred1_m0;         // read to predict

 

output [39:4]    htd_tsbptr;
output [7:0]     htd_zeroctx_m0;



//output           htd_ra2pa_lower_hit_1;
//output           htd_ra2pa_upper_hit_1;
//output [039:013] htd_pa_1;
//Notes:
//1). For a particular TSB_Size, with page size =5, setting tsb_size > 11
//    needs VA greater than 48 bits and is a programming error.
//2). For page size 4, setting TSB_Size to 5 needs 49 bit VA which is an 
//    error. Check whether page-size 4 is used or reserved.
//    Niagara PRM has only four page sizes (page-size = 2 and 4 are reserved)

assign stop	= 1'b0;
// assign muxtst = tcu_muxtest;
assign test   = tcu_dectest ;

mmu_htd_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 test_rep0   (
  .din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
  .dout({se,pce_ov,siclk,soclk})
);


/////////////////////////////////////////////////////////////////////
// TTE Request Queue (W)/M
// MUX the incoming TLB miss request and latch it in 8 entry queue
// For each thread
// i_context[12:0] = asd_i_p_ctx_0[12:0] & {13{~tlu_mmu_tl_gt_0}}
/////////////////////////////////////////////////////////////////////
mmu_htd_dp_inv_macro__width_8 inv_tgt_z_w8  
(
 .din (tlu_mmu_tl_gt_0[7:0]),
 .dout(tlu_mmu_tl_gt_0_[7:0])
 );

mmu_htd_dp_or_macro__ports_2__width_8 or1_w8   (
  .din0({tlu_iht_request[7:0]}),
  .din1({tlu_dht_request[7:0]}),
  .dout({tlb_miss_m[7:0]})
);

/////////////////////////////////////////////////////////////////////
// Flop inputs from LSU (B)
// => lsu VA and CTX are in B cycle, while I see tlu_dht_request in W cycle.
/////////////////////////////////////////////////////////////////////
mmu_htd_dp_msff_macro__stack_50c__width_30 reg_tlbmiss_w30   
(
 .scan_in(reg_tlbmiss_w30_scanin),
 .scan_out(reg_tlbmiss_w30_scanout),
 .clk (l2clk),
 .en  (1'b1),
 .din ({htc_va_rd_m2_in[7:0], tlb_miss_m[7:0],  lsu_tlu_dsfsr_ct_b[0], lsu_context_b[12:0]}),
 .dout ({va_rd_m2[7:0],       tlb_miss_m0[7:0], lsu_sec_ctx_w,        lsu_context_w[12:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
 );

                                                
mmu_htd_dp_and_macro__stack_50c__width_13 and_ictx0_w13 
(.din0(asd_i_p_ctx_0_0[12:0]),
 .din1({13{tlu_mmu_tl_gt_0_[0]}}),
 .dout(i_context_0[12:0])
 );

mmu_htd_dp_and_macro__stack_50c__width_13 and_ictx1_w13 
(.din0(asd_i_p_ctx_0_1[12:0]),
 .din1({13{tlu_mmu_tl_gt_0_[1]}}),
 .dout(i_context_1[12:0])
 );

mmu_htd_dp_and_macro__stack_50c__width_13 and_ictx2_w13 
(.din0(asd_i_p_ctx_0_2[12:0]),
 .din1({13{tlu_mmu_tl_gt_0_[2]}}),
 .dout(i_context_2[12:0])
 );

mmu_htd_dp_and_macro__stack_50c__width_13 and_ictx3_w13 
(.din0(asd_i_p_ctx_0_3[12:0]),
 .din1({13{tlu_mmu_tl_gt_0_[3]}}),
 .dout(i_context_3[12:0])
 );

mmu_htd_dp_and_macro__stack_50c__width_13 and_ictx4_w13 
(.din0(asd_i_p_ctx_0_4[12:0]),
 .din1({13{tlu_mmu_tl_gt_0_[4]}}),
 .dout(i_context_4[12:0])
 );

mmu_htd_dp_and_macro__stack_50c__width_13 and_ictx5_w13 
(.din0(asd_i_p_ctx_0_5[12:0]),
 .din1({13{tlu_mmu_tl_gt_0_[5]}}),
 .dout(i_context_5[12:0])
 );

mmu_htd_dp_and_macro__stack_50c__width_13 and_ictx6_w13 
(.din0(asd_i_p_ctx_0_6[12:0]),
 .din1({13{tlu_mmu_tl_gt_0_[6]}}),
 .dout(i_context_6[12:0])
 );

mmu_htd_dp_and_macro__stack_50c__width_13 and_ictx7_w13 
(.din0(asd_i_p_ctx_0_7[12:0]),
 .din1({13{tlu_mmu_tl_gt_0_[7]}}),
 .dout(i_context_7[12:0])
 );

// Mux ITLB/DTLB/TSBPTR read requests

mmu_htd_dp_msff_macro__mux_aope__ports_4__stack_50c__width_50 reg0_vactx_w50  (
    .scan_in(reg0_vactx_w50_scanin),
    .scan_out(reg0_vactx_w50_scanout),
    .clk (l2clk),
    .en  (htc_core_running[0]),
    .din0({1'b0,               1'b0,         tlu_pc_0_w[47:13],   i_context_0[12:0]}),
    .din1({lsu_sec_ctx_w,      1'b1,         ase_lsu_va_w[47:13], lsu_context_w[12:0]}),
    .din2({1'b0,               1'b0,         asd0_tag_access[47:0]}),
    .din3({htd_sec_ctx[0],     htd_dmiss[0], thr0_va_ff[47:13],   htd_thr0_ctx_ff[12:0]}), 
    .sel0({tlu_iht_request[0]}),
    .sel1({tlu_dht_request[0]}),
    .sel2({htc_tsbrd_valid_m0[0]}),
    .dout({htd_sec_ctx[0],     htd_dmiss[0], thr0_va_ff[47:13],   htd_thr0_ctx_ff[12:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__mux_aope__ports_4__stack_50c__width_50 reg1_vactx_w50  (
    .scan_in(reg1_vactx_w50_scanin),
    .scan_out(reg1_vactx_w50_scanout),
    .clk (l2clk),
    .en  (htc_core_running[1]),
    .din0({1'b0,               1'b0,         tlu_pc_0_w[47:13],   i_context_1[12:0]}),
    .din1({lsu_sec_ctx_w,      1'b1,         ase_lsu_va_w[47:13], lsu_context_w[12:0]}),
    .din2({1'b0,               1'b0,         asd0_tag_access[47:0]}),
    .din3({htd_sec_ctx[1],     htd_dmiss[1], thr1_va_ff[47:13],   htd_thr1_ctx_ff[12:0]}), 
    .sel0({tlu_iht_request[1]}),
    .sel1({tlu_dht_request[1]}),
    .sel2({htc_tsbrd_valid_m0[1]}),
    .dout({htd_sec_ctx[1],     htd_dmiss[1], thr1_va_ff[47:13],   htd_thr1_ctx_ff[12:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__mux_aope__ports_4__stack_50c__width_50 reg2_vactx_w50  (
    .scan_in(reg2_vactx_w50_scanin),
    .scan_out(reg2_vactx_w50_scanout),
    .clk (l2clk),
    .en  (htc_core_running[2]),
    .din0({1'b0,               1'b0,         tlu_pc_0_w[47:13],   i_context_2[12:0]}),
    .din1({lsu_sec_ctx_w,      1'b1,         ase_lsu_va_w[47:13], lsu_context_w[12:0]}),
    .din2({1'b0,               1'b0,         asd0_tag_access[47:0]}),
    .din3({htd_sec_ctx[2],     htd_dmiss[2], thr2_va_ff[47:13],   htd_thr2_ctx_ff[12:0]}), 
    .sel0({tlu_iht_request[2]}),
    .sel1({tlu_dht_request[2]}),
    .sel2({htc_tsbrd_valid_m0[2]}),
    .dout({htd_sec_ctx[2],     htd_dmiss[2], thr2_va_ff[47:13],   htd_thr2_ctx_ff[12:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__mux_aope__ports_4__stack_50c__width_50 reg3_vactx_w50  (
    .scan_in(reg3_vactx_w50_scanin),
    .scan_out(reg3_vactx_w50_scanout),
    .clk (l2clk),
    .en  (htc_core_running[3]),
    .din0({1'b0,               1'b0,         tlu_pc_0_w[47:13],   i_context_3[12:0]}),
    .din1({lsu_sec_ctx_w,      1'b1,         ase_lsu_va_w[47:13], lsu_context_w[12:0]}),
    .din2({1'b0,               1'b0,         asd0_tag_access[47:0]}),
    .din3({htd_sec_ctx[3],     htd_dmiss[3], thr3_va_ff[47:13],   htd_thr3_ctx_ff[12:0]}), 
    .sel0({tlu_iht_request[3]}),
    .sel1({tlu_dht_request[3]}),
    .sel2({htc_tsbrd_valid_m0[3]}),
    .dout({htd_sec_ctx[3],    htd_dmiss[3],  thr3_va_ff[47:13],   htd_thr3_ctx_ff[12:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__mux_aope__ports_4__stack_50c__width_50 reg4_vactx_w50  (
    .scan_in(reg4_vactx_w50_scanin),
    .scan_out(reg4_vactx_w50_scanout),
    .clk (l2clk),
    .en  (htc_core_running[4]),
    .din0({1'b0,               1'b0,         tlu_pc_1_w[47:13],   i_context_4[12:0]}),
    .din1({lsu_sec_ctx_w,      1'b1,         ase_lsu_va_w[47:13], lsu_context_w[12:0]}),
    .din2({1'b0,               1'b0,         asd1_tag_access[47:0]}),
    .din3({htd_sec_ctx[4],     htd_dmiss[4], thr4_va_ff[47:13],   htd_thr4_ctx_ff[12:0]}), 
    .sel0({tlu_iht_request[4]}),
    .sel1({tlu_dht_request[4]}),
    .sel2({htc_tsbrd_valid_m0[4]}),
    .dout({htd_sec_ctx[4],     htd_dmiss[4], thr4_va_ff[47:13],   htd_thr4_ctx_ff[12:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__mux_aope__ports_4__stack_50c__width_50 reg5_vactx_w50  (
    .scan_in(reg5_vactx_w50_scanin),
    .scan_out(reg5_vactx_w50_scanout),
    .clk (l2clk),
    .en  (htc_core_running[5]),
    .din0({1'b0,               1'b0,         tlu_pc_1_w[47:13],   i_context_5[12:0]}),
    .din1({lsu_sec_ctx_w,      1'b1,         ase_lsu_va_w[47:13], lsu_context_w[12:0]}),
    .din2({1'b0,               1'b0,         asd1_tag_access[47:0]}),
    .din3({htd_sec_ctx[5],     htd_dmiss[5], thr5_va_ff[47:13],   htd_thr5_ctx_ff[12:0]}), 
    .sel0({tlu_iht_request[5]}),
    .sel1({tlu_dht_request[5]}),
    .sel2({htc_tsbrd_valid_m0[5]}),
    .dout({htd_sec_ctx[5],     htd_dmiss[5], thr5_va_ff[47:13],   htd_thr5_ctx_ff[12:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__mux_aope__ports_4__stack_50c__width_50 reg6_vactx_w50  (
    .scan_in(reg6_vactx_w50_scanin),
    .scan_out(reg6_vactx_w50_scanout),
    .clk (l2clk),
    .en  (htc_core_running[6]),
    .din0({1'b0,               1'b0,         tlu_pc_1_w[47:13],   i_context_6[12:0]}),
    .din1({lsu_sec_ctx_w,      1'b1,         ase_lsu_va_w[47:13], lsu_context_w[12:0]}),
    .din2({1'b0,               1'b0,         asd1_tag_access[47:0]}),
    .din3({htd_sec_ctx[6],     htd_dmiss[6], thr6_va_ff[47:13],   htd_thr6_ctx_ff[12:0]}), 
    .sel0({tlu_iht_request[6]}),
    .sel1({tlu_dht_request[6]}),
    .sel2({htc_tsbrd_valid_m0[6]}),
    .dout({htd_sec_ctx[6],     htd_dmiss[6], thr6_va_ff[47:13], htd_thr6_ctx_ff[12:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__mux_aope__ports_4__stack_50c__width_50 reg7_vactx_w50  (
    .scan_in(reg7_vactx_w50_scanin),
    .scan_out(reg7_vactx_w50_scanout),
    .clk (l2clk),
    .en  (htc_core_running[7]),
    .din0({1'b0,               1'b0,         tlu_pc_1_w[47:13],   i_context_7[12:0]}),
    .din1({lsu_sec_ctx_w,      1'b1,         ase_lsu_va_w[47:13], lsu_context_w[12:0]}),
    .din2({1'b0,               1'b0,         asd1_tag_access[47:0]}),
    .din3({htd_sec_ctx[7],     htd_dmiss[7], thr7_va_ff[47:13],   htd_thr7_ctx_ff[12:0]}), 
    .sel0({tlu_iht_request[7]}),
    .sel1({tlu_dht_request[7]}),
    .sel2({htc_tsbrd_valid_m0[7]}),
    .dout({htd_sec_ctx[7],     htd_dmiss[7], thr7_va_ff[47:13],   htd_thr7_ctx_ff[12:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

/////////////////////////////////////////////////////////////////////
// zero detect the contexts and send them to htc in M0
//

mmu_htd_dp_zero_macro__dcmp_12x__width_16 ctx0_zd_cmp  (
    .din({3'b0,htd_thr0_ctx_ff[12:0]}),
    .dout(htd_zeroctx_m0_prebuf[0])
); 

mmu_htd_dp_zero_macro__dcmp_12x__width_16 ctx1_zd_cmp  (
    .din({3'b0,htd_thr1_ctx_ff[12:0]}),
    .dout(htd_zeroctx_m0_prebuf[1])
); 

mmu_htd_dp_zero_macro__dcmp_12x__width_16 ctx2_zd_cmp  (
    .din({3'b0,htd_thr2_ctx_ff[12:0]}),
    .dout(htd_zeroctx_m0_prebuf[2])
); 

mmu_htd_dp_zero_macro__dcmp_12x__width_16 ctx3_zd_cmp  (
    .din({3'b0,htd_thr3_ctx_ff[12:0]}),
    .dout(htd_zeroctx_m0_prebuf[3])
); 

mmu_htd_dp_zero_macro__dcmp_12x__width_16 ctx4_zd_cmp  (
    .din({3'b0,htd_thr4_ctx_ff[12:0]}),
    .dout(htd_zeroctx_m0_prebuf[4])
); 

mmu_htd_dp_zero_macro__dcmp_12x__width_16 ctx5_zd_cmp  (
    .din({3'b0,htd_thr5_ctx_ff[12:0]}),
    .dout(htd_zeroctx_m0_prebuf[5])
); 

mmu_htd_dp_zero_macro__dcmp_12x__width_16 ctx6_zd_cmp  (
    .din({3'b0,htd_thr6_ctx_ff[12:0]}),
    .dout(htd_zeroctx_m0_prebuf[6])
); 

mmu_htd_dp_zero_macro__dcmp_12x__width_16 ctx7_zd_cmp  (
    .din({3'b0,htd_thr7_ctx_ff[12:0]}),
    .dout(htd_zeroctx_m0_prebuf[7])
); 

mmu_htd_dp_buff_macro__stack_50c__width_8 buf_ctx0_w8   (
.din({htd_zeroctx_m0_prebuf[7:0]}),
.dout({htd_zeroctx_m0[7:0]})
);

/////////////////////////////////////////////////////////////////////
// GET TSB CONFIG DATA (M0)
// FORM HASHED ADDRESS to look up HWTWK PREDICTION REGISTERS
// Addressing into the table is calculated through the following hash.  The
// column headers specify which bit of the address the column calculates.  XOR
// the contents of the columns to calculate the address bit.
// cxt[12:0] = context of the request
// pid[2:0]  = partition ID of the request
// va[47:28] = Virtual Address bits 47 to 28 of request
// addr[5]   addr[4]   addr[3]   addr[2]   addr[1]   addr[0]
// -------   -------   -------   -------   -------   -------
// cxt[5]    cxt[4]    cxt[3]    cxt[2]    cxt[1]    cxt[0]
// cxt[6]    cxt[7]    cxt[8]    cxt[9]    cxt[10]   cxt[11]
// va[29]    va[28]    pid[2]    pid[1]    pid[0]    cxt[12]
// va[30]    va[31]    va[32]    va[33]    va[34]    va[35]
// va[41]    va[40]    va[39]    va[38]    va[37]    va[36]
// va[42]    va[43]    va[44]    va[45]    va[46]    va[47]

/////////////////////////////////////////////////////////////////////
// MUX out the VA and context in M0, to form the hashed index into
// prediction array
// There could be two tlb misses coming at same time for two thread groups


mmu_htd_dp_mux_macro__dmux_8x__mux_aonpe__ports_4__stack_58c__width_33 mux_va_m00_w33      (
    .din0({thr0_va_ff[47:28],htd_thr0_ctx_ff[12:0]}), 
    .din1({thr1_va_ff[47:28],htd_thr1_ctx_ff[12:0]}), 
    .din2({thr2_va_ff[47:28],htd_thr2_ctx_ff[12:0]}), 
    .din3({thr3_va_ff[47:28],htd_thr3_ctx_ff[12:0]}), 
    .sel0(tlb_miss_m0[0]),
    .sel1(tlb_miss_m0[1]),
    .sel2(tlb_miss_m0[2]),
    .sel3(tlb_miss_m0[3]),
    .dout({va0_m0[47:28], ctx0_m0[12:0]})
);

mmu_htd_dp_mux_macro__dmux_8x__mux_aonpe__ports_4__stack_58c__width_33 mux_va_m01_w33      (
    .din0({thr4_va_ff[47:28],htd_thr4_ctx_ff[12:0]}), 
    .din1({thr5_va_ff[47:28],htd_thr5_ctx_ff[12:0]}), 
    .din2({thr6_va_ff[47:28],htd_thr6_ctx_ff[12:0]}), 
    .din3({thr7_va_ff[47:28],htd_thr7_ctx_ff[12:0]}), 
    .sel0(tlb_miss_m0[4]),
    .sel1(tlb_miss_m0[5]),
    .sel2(tlb_miss_m0[6]),
    .sel3(tlb_miss_m0[7]),
    .dout({va1_m0[47:28], ctx1_m0[12:0]})
);


assign pid0_m0[2:0] = htc_pid0_m0[2:0];
assign pid1_m0[2:0] = htc_pid1_m0[2:0];


//prty_macro  prty0_0 (width=8) (
//                                  .din    ({1'b0,va0_m0[47],va0_m0[36],va0_m0[35],1'b0,ctx0_m0[12],ctx0_m0[11],ctx0_m0[00]}),
//                                  .dout   (htd_pred0_idx_m0[0]));

//prty_macro  prty0_1 (width=8) (
//                                  .din    ({1'b0,va0_m0[46],va0_m0[37],va0_m0[34],1'b0,pid0_m0[00],ctx0_m0[10],ctx0_m0[01]}),
//                                  .dout   (htd_pred0_idx_m0[1]));

//prty_macro  prty0_2 (width=8) (
//                                  .din    ({1'b0,va0_m0[45],va0_m0[38],va0_m0[33],1'b0,pid0_m0[01],ctx0_m0[09],ctx0_m0[02]}),
//                                  .dout   (htd_pred0_idx_m0[2]));

//prty_macro  prty0_3 (width=8) (
//                                  .din    ({1'b0,va0_m0[44],va0_m0[39],va0_m0[32],1'b0,pid0_m0[02],ctx0_m0[08],ctx0_m0[03]}),
//                                  .dout   (htd_pred0_idx_m0[3]));

//prty_macro  prty0_4 (width=8) (
//                                  .din    ({1'b0,va0_m0[43],va0_m0[40],va0_m0[31],1'b0, va0_m0[28],ctx0_m0[07],ctx0_m0[04]}),
//                                  .dout   (htd_pred0_idx_m0[4]));

//prty_macro  prty0_5 (width=8) (
//                                  .din    ({1'b0,va0_m0[42],va0_m0[41],va0_m0[30],1'b0, va0_m0[29],ctx0_m0[06],ctx0_m0[05]}),
//                                  .dout   (htd_pred0_idx_m0[5]));

mmu_htd_dp_xor_macro__ports_3__stack_64c__width_12 xor0_0_w12    (
.din0 ({va0_m0[30],ctx0_m0[5],va0_m0[31],ctx0_m0[4],va0_m0[32],ctx0_m0[3],va0_m0[33],ctx0_m0[2],va0_m0[34],ctx0_m0[1],va0_m0[35],ctx0_m0[0]}),
.din1 ({va0_m0[41],ctx0_m0[6],va0_m0[40],ctx0_m0[7],va0_m0[39],ctx0_m0[8],va0_m0[38],ctx0_m0[9],va0_m0[37],ctx0_m0[10],va0_m0[36],ctx0_m0[11]}),
.din2 ({va0_m0[42],va0_m0[29], va0_m0[43],va0_m0[28] ,va0_m0[44],pid0_m0[2],va0_m0[45],pid0_m0[1],va0_m0[46],pid0_m0[0],va0_m0[47],ctx0_m0[12]}),
.dout ({prty0_5_1,prty0_5_0,prty0_4_1,prty0_4_0,prty0_3_1,prty0_3_0,prty0_2_1,prty0_2_0,prty0_1_1,prty0_1_0,prty0_0_1,prty0_0_0})
);

mmu_htd_dp_xor_macro__ports_2__stack_64c__width_6 xor0_1_w6    (
.din0 ({prty0_5_0,prty0_4_0,prty0_3_0,prty0_2_0,prty0_1_0,prty0_0_0}),
.din1 ({prty0_5_1,prty0_4_1,prty0_3_1,prty0_2_1,prty0_1_1,prty0_0_1}),
.dout ({htd_pred0_idx_m0[5:0]})
);

//prty_macro  prty1_0 (width=8) (
//                                  .din    ({1'b0,va1_m0[47],va1_m0[36],va1_m0[35],1'b0,ctx1_m0[12],ctx1_m0[11],ctx1_m0[00]}),
//                                  .dout   (htd_pred1_idx_m0[0]));

//prty_macro  prty1_1 (width=8) (
//                                  .din    ({1'b0,va1_m0[46],va1_m0[37],va1_m0[34],1'b0,pid1_m0[00],ctx1_m0[10],ctx1_m0[01]}),
//                                  .dout   (htd_pred1_idx_m0[1]));

//prty_macro  prty1_2 (width=8) (
//                                  .din    ({1'b0,va1_m0[45],va1_m0[38],va1_m0[33],1'b0,pid1_m0[01],ctx1_m0[09],ctx1_m0[02]}),
//                                  .dout   (htd_pred1_idx_m0[2]));

//prty_macro  prty1_3 (width=8) (
//                                  .din    ({1'b0,va1_m0[44],va1_m0[39],va1_m0[32],1'b0,pid1_m0[02],ctx1_m0[08],ctx1_m0[03]}),
//                                  .dout   (htd_pred1_idx_m0[3]));

//prty_macro  prty1_4 (width=8) (
//                                  .din    ({1'b0,va1_m0[43],va1_m0[40],va1_m0[31],1'b0, va1_m0[28],ctx1_m0[07],ctx1_m0[04]}),
//                                  .dout   (htd_pred1_idx_m0[4]));

//prty_macro  prty1_5 (width=8) (
//                                  .din    ({1'b0,va1_m0[42],va1_m0[41],va1_m0[30],1'b0, va1_m0[29],ctx1_m0[06],ctx1_m0[05]}),
//                                  .dout   (htd_pred1_idx_m0[5]));

mmu_htd_dp_xor_macro__ports_3__stack_64c__width_12 xor1_0_w12    (
.din0 ({va1_m0[30],ctx1_m0[5],va1_m0[31],ctx1_m0[4],va1_m0[32],ctx1_m0[3],va1_m0[33],ctx1_m0[2],va1_m0[34],ctx1_m0[1],va1_m0[35],ctx1_m0[0]}),
.din1 ({va1_m0[41],ctx1_m0[6],va1_m0[40],ctx1_m0[7],va1_m0[39],ctx1_m0[8],va1_m0[38],ctx1_m0[9],va1_m0[37],ctx1_m0[10],va1_m0[36],ctx1_m0[11]}),
.din2 ({va1_m0[42],va1_m0[29], va1_m0[43],va1_m0[28] ,va1_m0[44],pid1_m0[2],va1_m0[45],pid1_m0[1],va1_m0[46],pid1_m0[0],va1_m0[47],ctx1_m0[12]}),
.dout ({prty1_5_1,prty1_5_0,prty1_4_1,prty1_4_0,prty1_3_1,prty1_3_0,prty1_2_1,prty1_2_0,prty1_1_1,prty1_1_0,prty1_0_1,prty1_0_0})
);

mmu_htd_dp_xor_macro__ports_2__stack_64c__width_6 xor1_1_w6    (
.din0 ({prty1_5_0,prty1_4_0,prty1_3_0,prty1_2_0,prty1_1_0,prty1_0_0}),
.din1 ({prty1_5_1,prty1_4_1,prty1_3_1,prty1_2_1,prty1_1_1,prty1_0_1}),
.dout ({htd_pred1_idx_m0[5:0]})
);
                                                    

/////////////////////////////////////////////////////////////////////
// GET TSB CONFIG DATA (M1)
// MRA data is returned in M1 and HW2 
/////////////////////////////////////////////////////////////////////

// MUX out MRA data based on TG0/1, in M1/HW2
mmu_htd_dp_mux_macro__mux_pgpe__ports_2__stack_58c__width_40 mux0_mra_data_w40  (
    .din0({mra0_data[39:0]}),
    .din1({mra1_data[39:0]}),
    .sel0({htc_mra_sel_0}), //TG0
//    .sel1({htc_mra_sel[1]}), //TG1
    .dout({mra_data[39:0]})
);

// MUX out MRA data based on TG0/1 in M1/HW2
mmu_htd_dp_mux_macro__mux_pgpe__ports_2__stack_58c__width_42 mux1_mra_data_w42  (
    .din0({mra0_data[81:40]}), 
    .din1({mra1_data[81:40]}),
    .sel0({htc_mra_sel_0}), //TG0
//    .sel1({htc_mra_sel[1]}), //TG1
    .dout({mra_data[81:40]})
);


// MRA Layout

// Bit 2 of tid[2:0] selects mra1/mra0
// Bit tid[1:0] form address[4:3] of MRA_ADDR
// MRA_ADDR[2:0]   Data
//                 
// 000             unused[3:0],z_tsb_conf_0[77:39],z_tsb_conf_1[38:0]
// 001             unused[3:0],z_tsb_conf_2[77:39],z_tsb_conf_3[38:0]
// 010             unused[3:0],nz_tsb_conf_0[77:39],nz_tsb_conf_1[38:0]
// 011             unused[3:0],nz_tsb_conf_2[77:39],nz_tsb_conf_3[38:0]
// 100             RR0[81:27],PhyOff0[25:0] 
// 101             RR1[81:27],PhyOff1[25:0]
// 110             RR2[81:27],PhyOff2[25:0]
// 111             RR3[81:27],PhyOff3[25:0]

mmu_htd_dp_mux_macro__mux_pgpe__ports_2__stack_58c__width_39 mux3_mra_data_w39  (
    .din0({mra_data[38:0]}), 
    .din1({mra_data[77:39]}),
    .sel0({htc_sel_mra_lo}), 
//    .sel1({htc_sel_mra_up}),
    .dout({tsb_conf[63:61], tsb_conf[39:13], tsb_conf[8:0]})

);

// Latch data coming from MRA due to a TSB config read in M1
// latch the data on TSB ptr gen or hwtwk tsb cfg rd.

mmu_htd_dp_msff_macro__stack_58c__width_39 reg_tsbconf_m2_w39   (
    .scan_in(reg_tsbconf_m2_w39_scanin),
    .scan_out(reg_tsbconf_m2_w39_scanout),
    .clk (l2clk),
    .en  (htc_m1_clken),
    .din ({tsb_conf[63:61], tsb_conf[39:13], tsb_conf[8:0]}),
    .dout ({tsb_conf_m2[63:61], tsb_conf_m2[39:13], tsb_conf_m2[8:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign sun4v_unused = tsb_conf_m2[7];
assign hwtwen_unused = tsb_conf_m2[63];


/////////////////////////////////////////////////////////////////////
// TSB Pointer Generation (M2)
/////////////////////////////////////////////////////////////////////
//
// send these tsb config bits to htc

// control bits from tsb config registers need to be saved.
// They will be used when tte data comes back.
// Each request can have upto 4 TSB config reads, and control bits from each have to be saved.
// control bits to be saved:
// cfg_ctlpkt_m2[8]   = tsb_conf_m2[63] = hwtw_en
// cfg_ctlpkt_m2[7]   = tsb_conf_m2[62] = use_context_0
// cfg_ctlpkt_m2[6]   = tsb_conf_m2[61] = use_context_1
// cfg_ctlpkt_m2[5]   = tsb_conf_m2[8]  = ranotpa
// cfg_ctlpkt_m2[4]   = tsb_conf_m2[7]  = sun4v
// cfg_ctlpkt_m2[3:1] = tsb_conf_m2[6:4] = pgsize
// cfg_ctlpkt_m2[0]   = htc_zero_ctx_m2
// cfg_ctlpkt[8:0] = { hwtw_en, use_context_0, use_context_1, ranotpa, sun4v, pgsize[6:4],zero_ctx}
// assign cfg_ctlpkt_m2[8:0] = {tsb_conf_m2[63:61], tsb_conf_m2[8:4], htc_zero_ctx_m2};


// 03/01/05  Only 7 bits need to be saved in cfg ctl packet.
// cfg_ctlpkt_m2[3]   = tsb_conf_m2[62] = use_context_0
// cfg_ctlpkt_m2[2]   = tsb_conf_m2[61] = use_context_1
// cfg_ctlpkt_m2[1]   = tsb_conf_m2[8]  = ranotpa
// cfg_ctlpkt_m2[3:1] = tsb_conf_m2[6:4] = pgsize
// cfg_ctlpkt_m2[0]   = htc_zero_ctx_m2
// cfg_ctlpkt_m2[3:0] = { use_context_0, use_context_1, ranotpa, tsb_conf_m2[6:4], zero_ctx}
assign cfg_ctlpkt_m2[6:0] = {tsb_conf_m2[62:61], tsb_conf_m2[8], tsb_conf_m2[6:4], htc_zero_ctx_m2};



// Each thread can read upto 4 tsb pointers. The control information from these registers
// are saved in a single flop.
mmu_htd_dp_mux_macro__mux_aodec__ports_4__stack_50c__width_28 mux_tsb_ctlpkt_w28     (
    .din0({thrx_cfg3_ctlpkt[6:0], thrx_cfg2_ctlpkt[6:0], thrx_cfg1_ctlpkt[6:0], cfg_ctlpkt_m2[6:0]   }), //tsbptr = 0
    .din1({thrx_cfg3_ctlpkt[6:0], thrx_cfg2_ctlpkt[6:0], cfg_ctlpkt_m2[6:0],    thrx_cfg0_ctlpkt[6:0]}), //tsbptr = 1
    .din2({thrx_cfg3_ctlpkt[6:0], cfg_ctlpkt_m2[6:0],    thrx_cfg1_ctlpkt[6:0], thrx_cfg0_ctlpkt[6:0]}), //tsbptr = 2
    .din3({cfg_ctlpkt_m2[6:0],    thrx_cfg2_ctlpkt[6:0], thrx_cfg1_ctlpkt[6:0], thrx_cfg0_ctlpkt[6:0]}), //tsbptr = 3
    .sel(htc_conf_index_m2[1:0]),
    .dout({thrx_cfg3_ctlpkt_in[6:0],thrx_cfg2_ctlpkt_in[6:0],thrx_cfg1_ctlpkt_in[6:0],thrx_cfg0_ctlpkt_in[6:0]})
);

mmu_htd_dp_msff_macro__stack_50c__width_28 reg0_tsbcfg_w28   (
    .scan_in(reg0_tsbcfg_w28_scanin),
    .scan_out(reg0_tsbcfg_w28_scanout),
    .clk (l2clk),
    .en  (htc_vld_tsbptr_m2[0]),
    .din  ({thrx_cfg3_ctlpkt_in[6:0],thrx_cfg2_ctlpkt_in[6:0],thrx_cfg1_ctlpkt_in[6:0],thrx_cfg0_ctlpkt_in[6:0]}),
    .dout ({thr0_cfg3_ctlpkt[6:0],   thr0_cfg2_ctlpkt[6:0],   thr0_cfg1_ctlpkt[6:0],   thr0_cfg0_ctlpkt[6:0]   }),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__stack_50c__width_28 reg1_tsbcfg_w28   (
    .scan_in(reg1_tsbcfg_w28_scanin),
    .scan_out(reg1_tsbcfg_w28_scanout),
    .clk (l2clk),
    .en  (htc_vld_tsbptr_m2[1]),
    .din  ({thrx_cfg3_ctlpkt_in[6:0],thrx_cfg2_ctlpkt_in[6:0],thrx_cfg1_ctlpkt_in[6:0],thrx_cfg0_ctlpkt_in[6:0]}),
    .dout ({thr1_cfg3_ctlpkt[6:0],   thr1_cfg2_ctlpkt[6:0],   thr1_cfg1_ctlpkt[6:0],   thr1_cfg0_ctlpkt[6:0]   }),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__stack_50c__width_28 reg2_tsbcfg_w28   (
    .scan_in(reg2_tsbcfg_w28_scanin),
    .scan_out(reg2_tsbcfg_w28_scanout),
    .clk (l2clk),
    .en  (htc_vld_tsbptr_m2[2]),
    .din  ({thrx_cfg3_ctlpkt_in[6:0],thrx_cfg2_ctlpkt_in[6:0],thrx_cfg1_ctlpkt_in[6:0],thrx_cfg0_ctlpkt_in[6:0]}),
    .dout ({thr2_cfg3_ctlpkt[6:0],   thr2_cfg2_ctlpkt[6:0],   thr2_cfg1_ctlpkt[6:0],   thr2_cfg0_ctlpkt[6:0]   }),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__stack_50c__width_28 reg3_tsbcfg_w28   (
    .scan_in(reg3_tsbcfg_w28_scanin),
    .scan_out(reg3_tsbcfg_w28_scanout),
    .clk (l2clk),
    .en  (htc_vld_tsbptr_m2[3]),
    .din  ({thrx_cfg3_ctlpkt_in[6:0],thrx_cfg2_ctlpkt_in[6:0],thrx_cfg1_ctlpkt_in[6:0],thrx_cfg0_ctlpkt_in[6:0]}),
    .dout ({thr3_cfg3_ctlpkt[6:0],   thr3_cfg2_ctlpkt[6:0],   thr3_cfg1_ctlpkt[6:0],   thr3_cfg0_ctlpkt[6:0]   }),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__stack_50c__width_28 reg4_tsbcfg_w28   (
    .scan_in(reg4_tsbcfg_w28_scanin),
    .scan_out(reg4_tsbcfg_w28_scanout),
    .clk (l2clk),
    .en  (htc_vld_tsbptr_m2[4]),
    .din  ({thrx_cfg3_ctlpkt_in[6:0],thrx_cfg2_ctlpkt_in[6:0],thrx_cfg1_ctlpkt_in[6:0],thrx_cfg0_ctlpkt_in[6:0]}),
    .dout ({thr4_cfg3_ctlpkt[6:0],   thr4_cfg2_ctlpkt[6:0],   thr4_cfg1_ctlpkt[6:0],   thr4_cfg0_ctlpkt[6:0]   }),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__stack_50c__width_28 reg5_tsbcfg_w28   (
    .scan_in(reg5_tsbcfg_w28_scanin),
    .scan_out(reg5_tsbcfg_w28_scanout),
    .clk (l2clk),
    .en  (htc_vld_tsbptr_m2[5]),
    .din  ({thrx_cfg3_ctlpkt_in[6:0],thrx_cfg2_ctlpkt_in[6:0],thrx_cfg1_ctlpkt_in[6:0],thrx_cfg0_ctlpkt_in[6:0]}),
    .dout ({thr5_cfg3_ctlpkt[6:0],   thr5_cfg2_ctlpkt[6:0],   thr5_cfg1_ctlpkt[6:0],   thr5_cfg0_ctlpkt[6:0]   }),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__stack_50c__width_28 reg6_tsbcfg_w28   (
    .scan_in(reg6_tsbcfg_w28_scanin),
    .scan_out(reg6_tsbcfg_w28_scanout),
    .clk (l2clk),
    .en  (htc_vld_tsbptr_m2[6]),
    .din  ({thrx_cfg3_ctlpkt_in[6:0],thrx_cfg2_ctlpkt_in[6:0],thrx_cfg1_ctlpkt_in[6:0],thrx_cfg0_ctlpkt_in[6:0]}),
    .dout ({thr6_cfg3_ctlpkt[6:0],   thr6_cfg2_ctlpkt[6:0],   thr6_cfg1_ctlpkt[6:0],   thr6_cfg0_ctlpkt[6:0]   }),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__stack_50c__width_28 reg7_tsbcfg_w28   (
    .scan_in(reg7_tsbcfg_w28_scanin),
    .scan_out(reg7_tsbcfg_w28_scanout),
    .clk (l2clk),
    .en  (htc_vld_tsbptr_m2[7]),
    .din  ({thrx_cfg3_ctlpkt_in[6:0],thrx_cfg2_ctlpkt_in[6:0],thrx_cfg1_ctlpkt_in[6:0],thrx_cfg0_ctlpkt_in[6:0]}),
    .dout ({thr7_cfg3_ctlpkt[6:0],   thr7_cfg2_ctlpkt[6:0],   thr7_cfg1_ctlpkt[6:0],   thr7_cfg0_ctlpkt[6:0]   }),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_mux_macro__mux_aonpe__ports_8__stack_50c__width_28 mux_tsbcfg_m2_w28     (
    .din0({thr0_cfg3_ctlpkt[6:0],thr0_cfg2_ctlpkt[6:0],thr0_cfg1_ctlpkt[6:0],thr0_cfg0_ctlpkt[6:0]}), 
    .din1({thr1_cfg3_ctlpkt[6:0],thr1_cfg2_ctlpkt[6:0],thr1_cfg1_ctlpkt[6:0],thr1_cfg0_ctlpkt[6:0]}), 
    .din2({thr2_cfg3_ctlpkt[6:0],thr2_cfg2_ctlpkt[6:0],thr2_cfg1_ctlpkt[6:0],thr2_cfg0_ctlpkt[6:0]}), 
    .din3({thr3_cfg3_ctlpkt[6:0],thr3_cfg2_ctlpkt[6:0],thr3_cfg1_ctlpkt[6:0],thr3_cfg0_ctlpkt[6:0]}), 
    .din4({thr4_cfg3_ctlpkt[6:0],thr4_cfg2_ctlpkt[6:0],thr4_cfg1_ctlpkt[6:0],thr4_cfg0_ctlpkt[6:0]}), 
    .din5({thr5_cfg3_ctlpkt[6:0],thr5_cfg2_ctlpkt[6:0],thr5_cfg1_ctlpkt[6:0],thr5_cfg0_ctlpkt[6:0]}), 
    .din6({thr6_cfg3_ctlpkt[6:0],thr6_cfg2_ctlpkt[6:0],thr6_cfg1_ctlpkt[6:0],thr6_cfg0_ctlpkt[6:0]}), 
    .din7({thr7_cfg3_ctlpkt[6:0],thr7_cfg2_ctlpkt[6:0],thr7_cfg1_ctlpkt[6:0],thr7_cfg0_ctlpkt[6:0]}), 
    .sel0(htc_vld_tsbptr_m2[0]),
    .sel1(htc_vld_tsbptr_m2[1]),
    .sel2(htc_vld_tsbptr_m2[2]),
    .sel3(htc_vld_tsbptr_m2[3]),
    .sel4(htc_vld_tsbptr_m2[4]),
    .sel5(htc_vld_tsbptr_m2[5]),
    .sel6(htc_vld_tsbptr_m2[6]),
    .sel7(htc_vld_tsbptr_m2[7]),
    .dout({thrx_cfg3_ctlpkt[6:0],thrx_cfg2_ctlpkt[6:0],thrx_cfg1_ctlpkt[6:0],thrx_cfg0_ctlpkt[6:0]})
);


// MUX out the VA in M2
mmu_htd_dp_mux_macro__left_13__mux_aonpe__ports_8__stack_50c__width_35 mux_va_m2_w35      (
    .din0(thr0_va_ff[47:13]), 
    .din1(thr1_va_ff[47:13]), 
    .din2(thr2_va_ff[47:13]), 
    .din3(thr3_va_ff[47:13]), 
    .din4(thr4_va_ff[47:13]), 
    .din5(thr5_va_ff[47:13]), 
    .din6(thr6_va_ff[47:13]), 
    .din7(thr7_va_ff[47:13]), 
    .sel0(va_rd_m2[0]),
    .sel1(va_rd_m2[1]),
    .sel2(va_rd_m2[2]),
    .sel3(va_rd_m2[3]),
    .sel4(va_rd_m2[4]),
    .sel5(va_rd_m2[5]),
    .sel6(va_rd_m2[6]),
    .sel7(va_rd_m2[7]),
    .dout(htd_va_prebuf[47:13])
);

mmu_htd_dp_buff_macro__left_13__stack_50c__width_35 buf_va_m2_w35    (
.din(htd_va_prebuf[47:13]),
.dout(htd_va[47:13])
);


////////////////////////////////////////////////////////////////////////////
// TSB POINTER GENERATION IN M2
////////////////////////////////////////////////////////////////////////////
// Old scheme:
//
//                tsb0-7                                tsb8-15
//                  |                                      |
//                  |                                      |
//      ----------------------                   ----------------------
//      |      |      |      |                   |      |      |      |    
//      |      |      |      |                   |      |      |      |    
//      pg0mx  pg1mx  pg3mx  pg5mx               pg0mx  pg1mx  pg3mx  pg5mx
//      8:1    8:1    8:1    8:1                 8:1    8:1    8:1    8:1
//      |      |      |      |                   |      |      |      |    
//      |      |      |      |                   |      |      |      |    
//      ----------------------                   ----------------------
//                  |                                      |
//                  |                                      |
//                  ---------------------------------------
//                                      |
//                                     2:1
//                                      |
//                                      |
//                                    tsbptr
//
//
// New Scheme:
//                     va[36:13] va[39:16] va[45:22] va[47:28]
//                         |          |         |         |
//                         |          |         |         |
//                         -------------------------------
//                                      |
//                                     4:1
//                                     vpn[23:0]
//                                      |
//                                      |
//                                      |
//                  ---------------------------------------
//                  |                                      |
//                  |                                      |
//                  |                                      |
//                pgmx                                    pgmx
//                 8:1                                     8:1
//                  |                                      |
//                  |                                      |
//                  ---------------------------------------
//                                      |
//                                     2:1
//                                      |
//                                      |
//                                    tsbptr

// use these bits for tsb pointer generation
assign htd_cfg_tsbbase[39:13] = tsb_conf_m2[39:13];
assign htd_pgsz_m2[6:4] = tsb_conf_m2[6:4];
assign htd_tsbsz_m2[3:0] = tsb_conf_m2[3:0];


// form the virtual page number
mmu_htd_dp_mux_macro__mux_aope__ports_4__stack_50c__width_24 mux_vpn_w24     (
    .din0({4'b0000,htd_va[47:28]}), //pgsz5, 256M
    .din1({htd_va[45:22]}),         //pgsz3, 4M
    .din2({htd_va[39:16]}),         //pgsz1, 64kb
    .din3({htd_va[36:13]}),         //pgsz0, 8kb
    .sel0(htd_pgsz_m2[6]),
    .sel1(htd_pgsz_m2[5]),
    .sel2(htd_pgsz_m2[4]),
    .dout({vpn_m2[23:0]})
);

// Form TSB pointer for TSB size 0-7
mmu_htd_dp_mux_macro__mux_aodec__ports_8__stack_50c__width_36 mux_tsb0_7_w36     (
    .din0({htd_cfg_tsbbase[39:13], vpn_m2[8:0]}),   //tsb_size = 0
    .din1({htd_cfg_tsbbase[39:14], vpn_m2[9:0]}),   //tsb_size = 1
    .din2({htd_cfg_tsbbase[39:15], vpn_m2[10:0]}),   //tsb_size = 2
    .din3({htd_cfg_tsbbase[39:16], vpn_m2[11:0]}),   //tsb_size = 3
    .din4({htd_cfg_tsbbase[39:17], vpn_m2[12:0]}),   //tsb_size = 4
    .din5({htd_cfg_tsbbase[39:18], vpn_m2[13:0]}),   //tsb_size = 5
    .din6({htd_cfg_tsbbase[39:19], vpn_m2[14:0]}),   //tsb_size = 6
    .din7({htd_cfg_tsbbase[39:20], vpn_m2[15:0]}),   //tsb_size = 7
    .sel(htd_tsbsz_m2[2:0]),
    .dout({tsbptr0[35:0]})
);

// Form TSB pointer for TSB size 0-7
mmu_htd_dp_mux_macro__mux_aodec__ports_8__stack_50c__width_36 mux_tsb8_15_w36     (
    .din0({htd_cfg_tsbbase[39:21], vpn_m2[16:0]}),   //tsb_size = 8
    .din1({htd_cfg_tsbbase[39:22], vpn_m2[17:0]}),   //tsb_size = 9
    .din2({htd_cfg_tsbbase[39:23], vpn_m2[18:0]}),   //tsb_size = 10
    .din3({htd_cfg_tsbbase[39:24], vpn_m2[19:0]}),   //tsb_size = 11
    .din4({htd_cfg_tsbbase[39:25], vpn_m2[20:0]}),   //tsb_size = 12
    .din5({htd_cfg_tsbbase[39:26], vpn_m2[21:0]}),   //tsb_size = 13
    .din6({htd_cfg_tsbbase[39:27], vpn_m2[22:0]}),   //tsb_size = 14
    .din7({htd_cfg_tsbbase[39:28], vpn_m2[23:0]}),   //tsb_size = 15
    .sel(htd_tsbsz_m2[2:0]),
    .dout({tsbptr1[35:0]})
);

mmu_htd_dp_mux_macro__mux_pgpe__ports_2__stack_50c__width_36 mux_tsb_w36     (
    .din0(tsbptr1[35:0]),  //tsbsz = 8 - 15
    .din1(tsbptr0[35:0]),  //tsbsz = 0 - 7
    .sel0(htd_tsbsz_m2[3]),
    .dout(htd_tsbptr_m2[35:0])
);

assign l15_addr[39:4] = htd_tsbptr_m2[35:0];
assign htd_tsbptr[39:4] = htd_tsbptr_m2[35:0];

// ********************************************************************************
// MMU-L15 Request Buffer (Size=2)
// ********************************************************************************
// ********************************************************************************
// q1
// ********************************************************************************

mmu_htd_dp_msff_macro__stack_50c__width_36 reg_q1addr_w36   (
    .scan_in(reg_q1addr_w36_scanin),
    .scan_out(reg_q1addr_w36_scanout),
    .clk (l2clk),
    .en  (htc_wr_q1new),
    .din (l15_addr[39:4]), 
    .dout ({q1_addr[39:4]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// ********************************************************************************
// q0
// to optimize use of grant, create two versions, q0_grant and q0_nogrant.
// mux between these the next cycle using flopped version of grant
// ********************************************************************************
//mux_macro mux_q0addr_w36 (width=36, ports=3, mux=aope, stack=50c) (
//    .din0(l15_addr[39:04]), 
//    .din1(q1_addr[39:04]), 
//    .din2(q0_addr[39:04]), 
//    .sel0(htc_wr_q0new),
//    .sel1(htc_shift_q1),
//    .dout(q0_addr_in[39:04])
//);
//
//msff_macro reg_q0addr_w36 (width=36, stack=50c) (
//    .scan_in(reg_q0addr_w36_scanin),
//    .scan_out(reg_q0addr_w36_scanout),
//    .clk (l2clk),
//    .en  (htc_q0_clken),
//    .din (q0_addr_in[39:04]), 
//    .dout ({q0_addr[39:04]}),
//);

mmu_htd_dp_mux_macro__mux_aope__ports_2__stack_50c__width_36 mux_q0addr_ng_w36     (
    .din0(l15_addr[39:4]), 
    .din1(q0_addr[39:4]), 
    .sel0(htc_wr_q0new_nogrant),
    .dout(q0_addr_in_nogrant[39:4])
);

mmu_htd_dp_msff_macro__stack_50c__width_36 reg_q0addr_ng_w36   (
    .scan_in(reg_q0addr_ng_w36_scanin),
    .scan_out(reg_q0addr_ng_w36_scanout),
    .clk (l2clk),
    .en  (1'b1),
    .din (q0_addr_in_nogrant[39:4]),
    .dout ({q0_addr_nogrant[39:4]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_mux_macro__mux_aope__ports_3__stack_50c__width_36 mux_q0addr_g_w36     (
    .din0(l15_addr[39:4]), 
    .din1(q1_addr[39:4]), 
    .din2(q0_addr[39:4]), 
    .sel0(htc_wr_q0new_grant),
    .sel1(htc_shift_q1_grant),
    .dout(q0_addr_in_grant[39:4])
);

mmu_htd_dp_msff_macro__stack_50c__width_37 reg_q0addr_g_w36   (
    .scan_in(reg_q0addr_g_w36_scanin),
    .scan_out(reg_q0addr_g_w36_scanout),
    .clk (l2clk),
    .en  (1'b1),
    .din ({l15_mmu_grant,q0_addr_in_grant[39:4]}), 
    .dout ({l15_mmu_grant_lat,q0_addr_grant[39:4]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_mux_macro__mux_aope__ports_2__stack_50c__width_36 mux_q0addr_w36     (
    .din0(q0_addr_grant[39:4]), 
    .din1(q0_addr_nogrant[39:4]), 
    .sel0(l15_mmu_grant_lat),
    .dout(q0_addr[39:4])
);

// ********************************************************************************
// output register M3
// ********************************************************************************

mmu_htd_dp_mux_macro__mux_aonpe__ports_2__stack_50c__width_36 mux_l15addr_w36     (
    .din0(l15_addr[39:4]), 
    .din1(q0_addr[39:4]), 
    .sel0(htc_wr_m3new),
    .sel1(htc_wr_m3q0),
    .dout(mmu_l15_addr_in[39:4])
);


mmu_htd_dp_msff_macro__stack_50c__width_36 reg_l15addr_w36   (
    .scan_in(reg_l15addr_w36_scanin),
    .scan_out(reg_l15addr_w36_scanout),
    .clk (l2clk),
    .en  (htc_l15_en),
    .din ({mmu_l15_addr_in[39:4]}),
    .dout ({mmu_l15_addr[39:4]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);





/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
// PROCESS RETURN DATA
// MUX out TSB and TTE REQUEST data (HW0)
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////

mmu_htd_dp_buff_macro__dbuff_48x__rep_1__width_1 tst_mux_rep0   (
 .din ( tcu_muxtest     ),
 .dout( tcu_muxtest_rep0     ));


mmu_htd_dp_mux_macro__mux_pgdec__ports_8__stack_50c__width_40 mux_vpn_hw0_w40     (
    .din0({htd_dmiss[0], thr0_va_ff[47:22], htd_thr0_ctx_ff[12:0]}), 
    .din1({htd_dmiss[1], thr1_va_ff[47:22], htd_thr1_ctx_ff[12:0]}), 
    .din2({htd_dmiss[2], thr2_va_ff[47:22], htd_thr2_ctx_ff[12:0]}), 
    .din3({htd_dmiss[3], thr3_va_ff[47:22], htd_thr3_ctx_ff[12:0]}), 
    .din4({htd_dmiss[4], thr4_va_ff[47:22], htd_thr4_ctx_ff[12:0]}), 
    .din5({htd_dmiss[5], thr5_va_ff[47:22], htd_thr5_ctx_ff[12:0]}), 
    .din6({htd_dmiss[6], thr6_va_ff[47:22], htd_thr6_ctx_ff[12:0]}), 
    .din7({htd_dmiss[7], thr7_va_ff[47:22], htd_thr7_ctx_ff[12:0]}), 
    .muxtst (tcu_muxtest_rep0),
    .sel({l15_mmu_cpkt[8:6]}),
    .dout({htd_dmiss_hw0, va_hw0[47:22], ctx_hw0[12:0]}),
  .test(test)
);


mmu_htd_dp_msff_macro__stack_50c__width_40 reg_vpn_w40   
(
 .scan_in(reg_vpn_w40_scanin),
 .scan_out(reg_vpn_w40_scanout),
 .clk (l2clk),
 .en  (1'b1),
 .din ({htd_dmiss_hw0, va_hw0[47:22], ctx_hw0[12:0]}),
 .dout ({htd_dmiss_hw1,va_hw1[47:22], ctx_hw1[12:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
 );


mmu_htd_dp_buff_macro__dbuff_32x__rep_1__width_1 tst_mux_rep1   (
 .din ( tcu_muxtest     ),
 .dout( tcu_muxtest_rep1     ));

mmu_htd_dp_mux_macro__mux_pgdec__ports_8__stack_50c__width_28 mux_tsbcfg_hw0_w28     (
    .din0({thr0_cfg3_ctlpkt[6:0],thr0_cfg2_ctlpkt[6:0],thr0_cfg1_ctlpkt[6:0],thr0_cfg0_ctlpkt[6:0]}), 
    .din1({thr1_cfg3_ctlpkt[6:0],thr1_cfg2_ctlpkt[6:0],thr1_cfg1_ctlpkt[6:0],thr1_cfg0_ctlpkt[6:0]}), 
    .din2({thr2_cfg3_ctlpkt[6:0],thr2_cfg2_ctlpkt[6:0],thr2_cfg1_ctlpkt[6:0],thr2_cfg0_ctlpkt[6:0]}), 
    .din3({thr3_cfg3_ctlpkt[6:0],thr3_cfg2_ctlpkt[6:0],thr3_cfg1_ctlpkt[6:0],thr3_cfg0_ctlpkt[6:0]}), 
    .din4({thr4_cfg3_ctlpkt[6:0],thr4_cfg2_ctlpkt[6:0],thr4_cfg1_ctlpkt[6:0],thr4_cfg0_ctlpkt[6:0]}), 
    .din5({thr5_cfg3_ctlpkt[6:0],thr5_cfg2_ctlpkt[6:0],thr5_cfg1_ctlpkt[6:0],thr5_cfg0_ctlpkt[6:0]}), 
    .din6({thr6_cfg3_ctlpkt[6:0],thr6_cfg2_ctlpkt[6:0],thr6_cfg1_ctlpkt[6:0],thr6_cfg0_ctlpkt[6:0]}), 
    .din7({thr7_cfg3_ctlpkt[6:0],thr7_cfg2_ctlpkt[6:0],thr7_cfg1_ctlpkt[6:0],thr7_cfg0_ctlpkt[6:0]}), 
    .muxtst (tcu_muxtest_rep1),
    .sel({l15_mmu_cpkt[8:6]}),
    .dout({cfg3_ctlpkt_hw0[6:0],cfg2_ctlpkt_hw0[6:0],cfg1_ctlpkt_hw0[6:0],cfg0_ctlpkt_hw0[6:0]}),
  .test(test) 
);

mmu_htd_dp_msff_macro__stack_50c__width_30 reg_tsbcfg_hw1_w30   (
    .scan_in(reg_tsbcfg_hw1_w30_scanin),
    .scan_out(reg_tsbcfg_hw1_w30_scanout),
    .clk (l2clk),
    .en  (1'b1),
    .din  ({l15_mmu_cpkt[4:3],    cfg3_ctlpkt_hw0[6:0],cfg2_ctlpkt_hw0[6:0],cfg1_ctlpkt_hw0[6:0],cfg0_ctlpkt_hw0[6:0]}),
    .dout ({l15_mmu_cpkt_hw1[4:3],cfg3_ctlpkt_hw1[6:0],cfg2_ctlpkt_hw1[6:0],cfg1_ctlpkt_hw1[6:0],cfg0_ctlpkt_hw1[6:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);


mmu_htd_dp_buff_macro__dbuff_32x__rep_1__width_1 tst_mux_rep2   (
 .din ( tcu_muxtest     ),
 .dout( tcu_muxtest_rep2     ));

// mux out the right tsb config data based on [4:3] of ret data. These bits serve as a tag.
mmu_htd_dp_mux_macro__mux_pgdec__ports_4__stack_50c__width_7 mux_tsbcfg_hw1_w7     (
    .din0({cfg0_ctlpkt_hw1[6:0]}),
    .din1({cfg1_ctlpkt_hw1[6:0]}),
    .din2({cfg2_ctlpkt_hw1[6:0]}),
    .din3({cfg3_ctlpkt_hw1[6:0]}),
    .muxtst (tcu_muxtest_rep2),
    .sel({l15_mmu_cpkt_hw1[4:3]}),
    .dout({cfg_ctlpkt_hw1[6:0]}),
  .test(test) 
);


// cfg_ctlpkt[6:0] = { use_context_0, use_context_1, ranotpa, pgsize[6:4],zero_ctx}

/////////////////////////////////////////////////////////////////////
// Staging Flops for data input from L15 (HW1) and for va
// L15 return data format
// l15_spc_data[63:0] = htd_tte_data_hw1[63:0]         
// l15_spc_data[89:64] = htd_tte_tag_ptr_hw1[47:22]    (VA[47:22])
// l15_spc_data[105:90] = htd_tte_tag_ptr_hw1[63:48]   (VA[63:48])
// l15_spc_data[111:106] = htd_tte_rsvd1_hw1[5:0]      (RSVD1[5:0])
// l15_spc_data[124:112] = htd_tte_tag_ctx_hw1[60:48]  (CONTEXT)
// l15_spc_data[127:125] = htd_tte_rsvd0_hw1[2:0]      (RSVD0[2:0])
/////////////////////////////////////////////////////////////////////
mmu_htd_dp_msff_macro__stack_50c__width_36 reg_l15vahw1_w36   (
    .scan_in(reg_l15vahw1_w36_scanin),
    .scan_out(reg_l15vahw1_w36_scanout),
    .clk (l2clk),
    .en  (1'b1),
    .din ({l15_spc_data1[3:0],    l15_spc_data1[105:90],       l15_spc_data1[79:64]}),  
    .dout({htd_tte_data_hw1[3:0], htd_tte_tag_ptr_hw1[63:48], htd_tte_tag_ptr_hw1[37:22]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)

);


mmu_htd_dp_msff_macro__stack_50c__width_34 reg_l15ctx_w34   (
    .scan_in(reg_l15ctx_w34_scanin),
    .scan_out(reg_l15ctx_w34_scanout),
    .clk (l2clk),
    .en  (1'b1),
    .din ( {l15_spc_data1[127:125], l15_spc_data1[111:106], l15_spc_data1[63:62]   , l15_spc_data1[124:112]    , l15_spc_data1[89:80]      }),  
    .dout ({htd_tte_rsvd0_hw1[2:0], htd_tte_rsvd1_hw1[5:0], htd_tte_data_hw1[63:62], htd_tte_tag_ctx_hw1[60:48], htd_tte_tag_ptr_hw1[47:38]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)

);

mmu_htd_dp_msff_macro__stack_50c__width_49 reg_l15data_w49   (
    .scan_in(reg_l15data_w49_scanin),
    .scan_out(reg_l15data_w49_scanout),
    .clk (l2clk),
    .en  (1'b1),
    .din  ({l15_spc_data1[12:10],    l15_spc_data1[55:13],    l15_spc_data1[8:6]    }),
    .dout ({htd_tte_data_hw1[12:10], htd_tte_data_hw1[55:13], htd_tte_data_hw1[8:6] }),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);


assign tte_data_valid = htd_tte_data_hw1[63];
assign tte_pgsz_hw1[3:0] = htd_tte_data_hw1[3:0];
assign htd_tte_ep_hw1 = htd_tte_data_hw1[7];
//assign sun4v_format_hw1 = cfg_ctlpkt_hw1[4];
assign htd_zeroctx_hw1 = cfg_ctlpkt_hw1[0];
assign tsb_pgsz_hw1[2:0] = cfg_ctlpkt_hw1[3:1];
assign htd_ranotpa_hw1 = cfg_ctlpkt_hw1[4];
assign htd_usectx1_hw1 = cfg_ctlpkt_hw1[5];
assign htd_usectx0_hw1 = cfg_ctlpkt_hw1[6];


// assign htd_hwtwen_hw1 = cfg_ctlpkt_hw1[8];
//assign htd_hwtwen_hw1_unused[1:0] = {cfg_ctlpkt_hw1[8],cfg_ctlpkt_hw1[4]};

//****************************************************
// 101904:
// NIAGARA2 WILL NOT SUPPORT SUN4U FORMAT
// REMOVING THE TTE MUX
//****************************************************

// MUX tte data based on sun4u/sun4v formats
//mux_macro mux_tte_hw1_w39 (width=39,ports=2,mux=aope,stack=58c) (
//                                                                            //Sun4V Format
//    .din0   ({htd_tte_data_hw1       [63   ],    // V                           
//              htd_tte_data_hw1       [62   ],    // NFO
//              asi_data_in_real         ,         // Real
//              htd_tte_data_hw1       [61   ],    // Locked
//              htd_tte_data_hw1       [39:13],    // RA[39:13]
//              htd_tte_data_hw1       [12   ],    // IE
//              htd_tte_data_hw1       [11   ],    // Side effect
//              htd_tte_data_hw1       [10   ],    // CP
//              htd_tte_data_hw1       [08   ],    // P
//              htd_tte_data_hw1       [06   ],    // W
//              htd_tte_data_hw1       [03:00   ]}),  //Size[3:0]   
//                                                                            //Sun4u Format
//    .din1   ({htd_tte_data_hw1       [63   ],    // V
//              htd_tte_data_hw1       [60   ],    // NFO
//              asi_data_in_real         ,         // Real
//              htd_tte_data_hw1       [06   ],    // Locked
//              htd_tte_data_hw1       [39:13],    // PA[39:13]
//              htd_tte_data_hw1       [59   ],    // IE
//              htd_tte_data_hw1       [03   ],    // Side-effect
//              htd_tte_data_hw1       [05   ],    // CP
//              htd_tte_data_hw1       [02   ],    // P
//              htd_tte_data_hw1       [01   ],    // Writable
//              htd_tte_data_hw1       [48   ],    // Size[2]
//              htd_tte_data_hw1       [62:61   ]}),    // Size[1:0]
//    .sel0   ({sun4v_format_hw1}),
//    .dout   ({tte_data_hw1          [38   ],    // V
//              tte_data_hw1          [37   ],    // NFO
//              tte_data_hw1          [36   ],    // Real
//              tte_data_hw1          [35   ],    // Locked
//              tte_data_hw1          [34:08],    // RA/PA[39:13]
//              tte_data_hw1          [07   ],    // IE
//              tte_data_hw1          [06   ],    // Side Effect
//              tte_data_hw1          [05   ],    // CP
//              tte_data_hw1          [04   ],    // P
//              tte_data_hw1          [03   ],    // W
//              tte_data_hw1          [02:00]    // Size[2:0]
//            })
//);

assign tte_data_hw1[38:0] = (
                            {htd_tte_data_hw1       [63   ],    // [38]   V                           
                             htd_tte_data_hw1       [62   ],    // [37]   NFO
                             asi_data_in_real              ,    // [36]   Real
                             1'b0                          ,    // [35]   Locked
                             htd_tte_data_hw1       [39:13],    // [34:8] RA[39:13]
                             htd_tte_data_hw1       [12   ],    // [7]    IE
                             htd_tte_data_hw1       [11   ],    // [6]    Side effect
                             htd_tte_data_hw1       [10   ],    // [5]    CP
                             htd_tte_data_hw1       [8   ],    // [4]    P
                             htd_tte_data_hw1       [6   ],    // [3]    W
                             htd_tte_data_hw1       [2:0   ]} // [2:0]  Size[2:0] // pass only 3 bits of page size
                                                                //                  // bit 3 is always 0
                             );

                                                  
/////////////////////////////////////////////////////////////////////
// TSB hit/miss (HW1)
/////////////////////////////////////////////////////////////////////
// MUX out compare data from TTE Request and TTE Return queues

// TAG compare
// Minimum tsb page size is 8k, so bits 12:0 are offset into page.
// Minimum tsb size is 512 bytes, so next 9 bits of va need not be compared.
// So bits 21:0 of VA need not be used for tag compare.
// Any bits above bit 21 which are part of page offset should not be used for tag compare.

// For pgsz=8k, 12:0 page offset,  use 63:22 for tag compare
// For pgsz=64k, 15:0 page offset, use 63:22 for tag compare
// For pgsz=4M, 21:0 page offset,  use 63:22 for tag compare
// For pgsz=256M, 27:0 page offset, use 63:28 for tag compare 


mmu_htd_dp_mux_macro__mux_aope__ports_2__stack_50c__width_32 mux1_vpn_hw1_w32     (
    .din0({va_hw1[37:28], 6'b000000   , htd_tte_tag_ptr_hw1[37:28], 6'b000000	}),	     //pgsz5, 256Mb
    .din1({va_hw1[37:22]			  , htd_tte_tag_ptr_hw1[37:22]				}),      //pgsz0-8kb, pgsz1-64k, pgsz3-4M
    .sel0(tte_data_hw1[2]), 
    .dout({thrx_vpn_hw1[37:22], tte_tag_hw1[37:22]})
);


assign thrx_vpn_hw1[47:38] = va_hw1[47:38];
assign tte_tag_hw1[63:38] = htd_tte_tag_ptr_hw1[63:38];


mmu_htd_dp_cmp_macro__dcmp_8x__width_16 ptr_cmp0  (
    .din1({tte_tag_hw1[37:22]}),
    .din0({thrx_vpn_hw1[37:22]}),
    .dout(htd_ptr_hit0_hw1)
); 

// compare the context
mmu_htd_dp_cmp_macro__dcmp_8x__width_16 ctx_cmp  (
    .din1({3'b0, htd_tte_tag_ctx_hw1[60:48]}),
    .din0({3'b0, ctx_hw1[12:0]}),
    .dout(htd_ctx_hit_hw1)
);

// The reserved bits in tte tag should be all zero
// (|({htd_tte_rsvd0_hw1[2:0], htd_tte_rsvd1_hw1[5:0]})) = 0

mmu_htd_dp_nor_macro__ports_3__width_3 rsvd_nor1   (
    .din0 (htd_tte_rsvd0_hw1[2:0]),
    .din1 (htd_tte_rsvd1_hw1[2:0]),
    .din2 (htd_tte_rsvd1_hw1[5:3]),
    .dout (tte_rsvdx[2:0])
);

mmu_htd_dp_nand_macro__ports_3__width_1 rsvd_nand1   (
    .din0 (tte_rsvdx[0]),
    .din1 (tte_rsvdx[1]),
    .din2 (tte_rsvdx[2]),
    .dout (tte_rsvd)
);

// tte pagesize should be legal (0000, 0001, 0011 or 0101)
// Also tsbsize should be less than the tte size
// If these two conditions are not satisfied, then we consider it to be a illegal page size and
// treat it as a TSB MISS.
//

// Truth table for illegal page size
// # 
// # to run /home/rg131678/bin/espresso -Dso -oeqntott legalpage.pla
// #
// .i 7
// .o 1
// .ilb tsb2 tsb1 tsb0 tte3 tte2 tte1 tte0
// .olb illglpgsz
// .p 0
// .type fd
// 
// - - - 1 - - -  1
// 
// - - - 0 0 1 0  1
// - - - 0 1 0 0  1
// - - - 0 1 1 0  1
// - - - 0 1 1 1  1
// 0 0 1 0 0 0 0  1
// 
// 0 1 0 0 0 0 0  -
// 0 1 0 0 0 0 1  -
//        
// 0 1 1 0 0 0 0  1
// 0 1 1 0 0 0 1  1
// 
// 1 0 0 0 0 0 0  -
// 1 0 0 0 0 0 1  -
// 1 0 0 0 0 1 1  -
// 1 0 0 0 1 0 1  -
//        
// 1 0 1 0 0 0 0  1
// 1 0 1 0 0 0 1  1
// 1 0 1 0 0 1 1  1
//        
// 1 1 0 0 0 0 0  -
// 1 1 0 0 0 0 1  -
// 1 1 0 0 0 1 1  -
// 1 1 0 0 1 0 1  -
//        
// 1 1 1 0 0 0 0  - 
// 1 1 1 0 0 0 1  -
// 1 1 1 0 0 1 1  -
// 1 1 1 0 1 0 1  -
//
//
// .olb illglpgsz
// v7.0 = (tsb1&!tte2&!tte1) | (tsb2&!tte2) | (tsb0&!tte0) | (tte2&tte1) | (
//     tte2&!tte0) | (tte1&!tte0) | (tte3);
//
//
// reduce this to 3 OR terms
// pgsize_illegal[2] = tsb1&!tte2&!tte1
// pgsize_illegal[1] = (tsb2&!tte2) | (tsb0&!tte0) | (tte2&tte1)
// pgsize_illegal[0] = (tte2&!tte0) | (tte1&!tte0) | (tte3)

// illegal page size = pgsize_illegal[2] | pgsize_illegal[1] | pgsize_illegal[0]


mmu_htd_dp_inv_macro__width_4 pgsz_inv1  (
    .din ({tte_pgsz_hw1[3:0]}),
    .dout (tte_pgsz_hw1_[3:0])
);
                              
mmu_htd_dp_nand_macro__ports_3__width_1 pgsz_nand1   (
    .din0 (tte_pgsz_hw1_[2]),
    .din1 (tte_pgsz_hw1_[1]),
    .din2 (tsb_pgsz_hw1[1]),
    .dout (pgsize_illegal_[2])
);

mmu_htd_dp_inv_macro__width_1 pgsz_inv2  (
    .din ({pgsize_illegal_[2]}),
    .dout (pgsize_illegal[2])
);
mmu_htd_dp_nand_macro__ports_2__width_5 pgsz_nand2   (
    .din0 ({tte_pgsz_hw1_[2], tte_pgsz_hw1_[0], tte_pgsz_hw1[2], tte_pgsz_hw1_[0],  tte_pgsz_hw1_[0]}),
    .din1 ({tsb_pgsz_hw1[2],  tsb_pgsz_hw1[0],  tte_pgsz_hw1[1], tte_pgsz_hw1[2],   tte_pgsz_hw1[1]}),
    .dout ({pg_illegal_1_0, pg_illegal_1_1, pg_illegal_1_2, pg_illegal_0_0, pg_illegal_0_1})
);

mmu_htd_dp_nand_macro__ports_3__width_2 pgsz_nand3   (
    .din0 ({pg_illegal_1_0, pg_illegal_0_0}),
    .din1 ({pg_illegal_1_1, pg_illegal_0_1}),
    .din2 ({pg_illegal_1_2, tte_pgsz_hw1_[3]}),
    .dout ({pgsize_illegal[1], pgsize_illegal[0]})
);

                              
//compare tag 
// tte entry should be valid.
// pgsize should be legal
mmu_htd_dp_cmp_macro__dcmp_8x__width_16 ptr_cmp1  (
    .din1({pgsize_illegal[2:0], 1'b0, tte_rsvd, tte_data_valid, tte_tag_hw1[47:38]  }),
    .din0({3'b000,              1'b0, 1'b0,     1'b1,           thrx_vpn_hw1[47:38] }),
    .dout(htd_ptr_hit1_hw1)
); 

// On Niagara2, virtual address VA[63:0] is assumed to be sign extended VA[47:0]. So bit 47 of TTE tag needs to
// match 63:48 of VA.
mmu_htd_dp_cmp_macro__dcmp_8x__width_16 ptr_cmp2  (
    .din1({tte_tag_hw1[63:48] }),
    .din0({16{tte_tag_hw1[47]}}),
    .dout(htd_ptr_hit2_hw1)
); 


// On Niagara2, bits 55:40 of RA should be 0 (when the tte entry holds RA and not PA).
// If the bits are not 0, then a the OutOfRange error will be signalled (again only for RA and not PA)
mmu_htd_dp_zero_macro__dcmp_12x__width_16 ra_zero   (
    .din({htd_tte_data_hw1[55:40] }),
    .dout(htd_razero_hw1)
); 
                                         


/////////////////////////////////////////////////////////////////////
// TTE RETURN QUEUE (HW2)
// Queue it only if TSB hit
// Holding Registers for TTE Data per thread (HW2)
/////////////////////////////////////////////////////////////////////
// insert buffer for mintime fix on tte_data_hw1
mmu_htd_dp_buff_macro__minbuff_1__stack_50c__width_39 minbuf_tte_data_w39    (
.din (tte_data_hw1[38:0]),
.dout (minbuf_tte_data_hw1[38:0])                                                          
);

                                                          
mmu_htd_dp_msff_macro__stack_50c__width_40 e0_tte_reg_w40   (
    .scan_in(e0_tte_reg_w40_scanin),
    .scan_out(e0_tte_reg_w40_scanout),
    .clk (l2clk),
    .en  (trs_null_st[0]),
    .din  ({htd_razero_hw1,minbuf_tte_data_hw1[38:0]}),
    .dout ({thr0_tte_data_hw2[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__stack_50c__width_40 e1_tte_reg_w40   (
    .scan_in(e1_tte_reg_w40_scanin),
    .scan_out(e1_tte_reg_w40_scanout),
    .clk (l2clk),
    .en  (trs_null_st[1]),
    .din  ({htd_razero_hw1,minbuf_tte_data_hw1[38:0]}),
    .dout ({thr1_tte_data_hw2[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__stack_50c__width_40 e2_tte_reg_w40   (
    .scan_in(e2_tte_reg_w40_scanin),
    .scan_out(e2_tte_reg_w40_scanout),
    .clk (l2clk),
    .en  (trs_null_st[2]),
    .din  ({htd_razero_hw1,minbuf_tte_data_hw1[38:0]}),
    .dout ({thr2_tte_data_hw2[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__stack_50c__width_40 e3_tte_reg_w40   (
    .scan_in(e3_tte_reg_w40_scanin),
    .scan_out(e3_tte_reg_w40_scanout),
    .clk (l2clk),
    .en  (trs_null_st[3]),
    .din  ({htd_razero_hw1,minbuf_tte_data_hw1[38:0]}),
    .dout ({thr3_tte_data_hw2[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__stack_50c__width_40 e4_tte_reg_w40   (
    .scan_in(e4_tte_reg_w40_scanin),
    .scan_out(e4_tte_reg_w40_scanout),
    .clk (l2clk),
    .en  (trs_null_st[4]),
    .din  ({htd_razero_hw1,minbuf_tte_data_hw1[38:0]}),
    .dout ({thr4_tte_data_hw2[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__stack_50c__width_40 e5_tte_reg_w40   (
    .scan_in(e5_tte_reg_w40_scanin),
    .scan_out(e5_tte_reg_w40_scanout),
    .clk (l2clk),
    .en  (trs_null_st[5]),
    .din  ({htd_razero_hw1,minbuf_tte_data_hw1[38:0]}),
    .dout ({thr5_tte_data_hw2[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__stack_50c__width_40 e6_tte_reg_w40   (
    .scan_in(e6_tte_reg_w40_scanin),
    .scan_out(e6_tte_reg_w40_scanout),
    .clk (l2clk),
    .en  (trs_null_st[6]),
    .din  ({htd_razero_hw1,minbuf_tte_data_hw1[38:0]}),
    .dout ({thr6_tte_data_hw2[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__stack_50c__width_40 e7_tte_reg_w40   (
    .scan_in(e7_tte_reg_w40_scanin),
    .scan_out(e7_tte_reg_w40_scanout),
    .clk (l2clk),
    .en  (trs_null_st[7]),
    .din  ({htd_razero_hw1,minbuf_tte_data_hw1[38:0]}),
    .dout ({thr7_tte_data_hw2[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// cfg_ctlpkt[8:0] = { hwtw_en, use_context_0, use_context_1, ranotpa, sun4v, pgsize[6:4],zero_ctx}

//assign htd_ranotpa[7:0] = {thr7_cfg_pkt_hw2[5],thr6_cfg_pkt_hw2[5],thr5_cfg_pkt_hw2[5],thr4_cfg_pkt_hw2[5],
//                           thr3_cfg_pkt_hw2[5],thr2_cfg_pkt_hw2[5],thr1_cfg_pkt_hw2[5],thr0_cfg_pkt_hw2[5]};
//assign htd_zeroctx[7:0] = {thr7_cfg_pkt_hw2[0],thr6_cfg_pkt_hw2[0],thr5_cfg_pkt_hw2[0],thr4_cfg_pkt_hw2[0],
//                           thr3_cfg_pkt_hw2[0],thr2_cfg_pkt_hw2[0],thr1_cfg_pkt_hw2[0],thr0_cfg_pkt_hw2[0]};
//assign htd_usectx0[7:0] = {thr7_cfg_pkt_hw2[7],thr6_cfg_pkt_hw2[7],thr5_cfg_pkt_hw2[7],thr4_cfg_pkt_hw2[7],
//                           thr3_cfg_pkt_hw2[7],thr2_cfg_pkt_hw2[7],thr1_cfg_pkt_hw2[7],thr0_cfg_pkt_hw2[7]};
//assign htd_usectx1[7:0] = {thr7_cfg_pkt_hw2[6],thr6_cfg_pkt_hw2[6],thr5_cfg_pkt_hw2[6],thr4_cfg_pkt_hw2[6],
//                           thr3_cfg_pkt_hw2[6],thr2_cfg_pkt_hw2[6],thr1_cfg_pkt_hw2[6],thr0_cfg_pkt_hw2[6]};

/////////////////////////////////////////////////////////////////////
// Update TSB prediction array on a tsb hit in hw2
// Prediction array consists of 64 entries of 2 bits each, accessed
// by 6 bit prediction index pred_idx[5:0].
// This array is organized as 4 registers, each of 32 bits.
// pred_idx[5:4] select one of the 4 registers, and pred_idx[3:0] select
// 2 bits out of the selected 32 bit.
// Prediction array is read and written in hw2 for updates.
// Prediction array is read in M1 to predict tsb access.
/////////////////////////////////////////////////////////////////////
mmu_htd_dp_msff_macro__stack_50c__width_32 pred_row0_w32   
(
 .scan_in(pred_row0_w32_scanin),
 .scan_out(pred_row0_w32_scanout),
 .clk (l2clk),
 .en  (htc_wrpred0_hw2),
 .din (htd_newpred_hw2[31:0]),
 .dout (pred_row0[31:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__stack_50c__width_32 pred_row1_w32   
(
 .scan_in(pred_row1_w32_scanin),
 .scan_out(pred_row1_w32_scanout),
 .clk (l2clk),
 .en  (htc_wrpred1_hw2),
 .din (htd_newpred_hw2[31:0]),
 .dout (pred_row1[31:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__stack_50c__width_32 pred_row2_w32   
(
 .scan_in(pred_row2_w32_scanin),
 .scan_out(pred_row2_w32_scanout),
 .clk (l2clk),
 .en  (htc_wrpred2_hw2),
 .din (htd_newpred_hw2[31:0]),
 .dout (pred_row2[31:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__stack_50c__width_32 pred_row3_w32   
(
 .scan_in(pred_row3_w32_scanin),
 .scan_out(pred_row3_w32_scanout),
 .clk (l2clk),
 .en  (htc_wrpred3_hw2),
 .din (htd_newpred_hw2[31:0]),
 .dout (pred_row3[31:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_mux_macro__mux_aodec__ports_8__stack_50c__width_16 mux_pred0_m0_w16     
(
 .din0(pred_row0[15:0]),
 .din1(pred_row0[31:16]),
 .din2(pred_row1[15:0]),
 .din3(pred_row1[31:16]),
 .din4(pred_row2[15:0]),
 .din5(pred_row2[31:16]),
 .din6(pred_row3[15:0]),
 .din7(pred_row3[31:16]),
 .sel(htd_pred0_idx_m0[5:3]),
 .dout(htd_pred0_m0_prebuf[15:0])
);

mmu_htd_dp_buff_macro__stack_50c__width_16 buf_pred0_m0_w16   
(
 .din(htd_pred0_m0_prebuf[15:0]),
 .dout(htd_pred0_m0[15:0])
 );


mmu_htd_dp_mux_macro__mux_aodec__ports_8__stack_50c__width_16 mux_pred1_m0_w16     
(
 .din0(pred_row0[15:0]),
 .din1(pred_row0[31:16]),
 .din2(pred_row1[15:0]),
 .din3(pred_row1[31:16]),
 .din4(pred_row2[15:0]),
 .din5(pred_row2[31:16]),
 .din6(pred_row3[15:0]),
 .din7(pred_row3[31:16]),
 .sel(htd_pred1_idx_m0[5:3]),
 .dout(htd_pred1_m0_prebuf[15:0])
);

mmu_htd_dp_buff_macro__stack_50c__width_16 buf_pred1_m0_w16   
(
 .din(htd_pred1_m0_prebuf[15:0]),
 .dout(htd_pred1_m0[15:0])
 );

mmu_htd_dp_mux_macro__mux_aodec__ports_4__stack_50c__width_32 mux_predhw2_w32     
(
 .din0(pred_row0[31:0]),
 .din1(pred_row1[31:0]),
 .din2(pred_row2[31:0]),
 .din3(pred_row3[31:0]),
 .sel(htc_upd_pred_idx_hw2[5:4]),
 .dout(htd_pred_hw2[31:0])
);

//assign new_pred_rowlo[15:0] = {
//                             (({2{htc_upd_grp[7]}} & new_pred_bit[1:0]) | ({2{~htc_upd_grp[7]}} & htd_pred_hw2[15:14])),
//                             (({2{htc_upd_grp[6]}} & new_pred_bit[1:0]) | ({2{~htc_upd_grp[6]}} & htd_pred_hw2[13:12])),
//                             (({2{htc_upd_grp[5]}} & new_pred_bit[1:0]) | ({2{~htc_upd_grp[5]}} & htd_pred_hw2[11:10])),
//                             (({2{htc_upd_grp[4]}} & new_pred_bit[1:0]) | ({2{~htc_upd_grp[4]}} & htd_pred_hw2[9:8])),
//                             (({2{htc_upd_grp[3]}} & new_pred_bit[1:0]) | ({2{~htc_upd_grp[3]}} & htd_pred_hw2[7:6])),
//                             (({2{htc_upd_grp[2]}} & new_pred_bit[1:0]) | ({2{~htc_upd_grp[2]}} & htd_pred_hw2[5:4])),
//                             (({2{htc_upd_grp[1]}} & new_pred_bit[1:0]) | ({2{~htc_upd_grp[1]}} & htd_pred_hw2[3:2])),
//                             (({2{htc_upd_grp[0]}} & new_pred_bit[1:0]) | ({2{~htc_upd_grp[0]}} & htd_pred_hw2[1:0]))
//                             };
//



//assign new_pred_rowhi[15:0] = {
//                             (({2{htc_upd_grp[7]}} & new_pred_bit[1:0]) | ({2{~htc_upd_grp[7]}} & htd_pred_hw2[31:30])),
//                             (({2{htc_upd_grp[6]}} & new_pred_bit[1:0]) | ({2{~htc_upd_grp[6]}} & htd_pred_hw2[29:28])),
//                             (({2{htc_upd_grp[5]}} & new_pred_bit[1:0]) | ({2{~htc_upd_grp[5]}} & htd_pred_hw2[27:26])),
//                             (({2{htc_upd_grp[4]}} & new_pred_bit[1:0]) | ({2{~htc_upd_grp[4]}} & htd_pred_hw2[25:24])),
//                             (({2{htc_upd_grp[3]}} & new_pred_bit[1:0]) | ({2{~htc_upd_grp[3]}} & htd_pred_hw2[23:22])),
//                             (({2{htc_upd_grp[2]}} & new_pred_bit[1:0]) | ({2{~htc_upd_grp[2]}} & htd_pred_hw2[21:20])),
//                             (({2{htc_upd_grp[1]}} & new_pred_bit[1:0]) | ({2{~htc_upd_grp[1]}} & htd_pred_hw2[19:18])),
//                             (({2{htc_upd_grp[0]}} & new_pred_bit[1:0]) | ({2{~htc_upd_grp[0]}} & htd_pred_hw2[17:16]))
//                             };
//
//assign htc_newpred_hw2[31:0] = {
//                                (({16{upd_pred_idx[3]}} & new_pred_rowhi[15:0]) | 
//                                 ({16{~upd_pred_idx[3]}} & htd_pred_hw2[31:16])),
//                                (({16{~upd_pred_idx[3]}} & new_pred_rowlo[15:0]) | 
//                                 ({16{upd_pred_idx[3]}} & htd_pred_hw2[15:0]))
//                                };


mmu_htd_dp_nand_macro__ports_2__stack_50c__width_32 nand_newpredrow_w32    (
.din0 ({16{htc_new_pred_bit[1:0]}}),
.din1 ({{2{htc_upd_grp[7]}},{2{htc_upd_grp[6]}},{2{htc_upd_grp[5]}},{2{htc_upd_grp[4]}},
       {2{htc_upd_grp[3]}},{2{htc_upd_grp[2]}},{2{htc_upd_grp[1]}},{2{htc_upd_grp[0]}},
       {2{htc_upd_grp[7]}},{2{htc_upd_grp[6]}},{2{htc_upd_grp[5]}},{2{htc_upd_grp[4]}},
       {2{htc_upd_grp[3]}},{2{htc_upd_grp[2]}},{2{htc_upd_grp[1]}},{2{htc_upd_grp[0]}}}),
.dout (new_row[31:0])
);

mmu_htd_dp_nand_macro__ports_2__stack_50c__width_32 nand_oldpredrow_w32    (
.din0 ({htd_pred_hw2[31:0]}),
.din1 ({{2{htc_upd_grp_x[7]}},{2{htc_upd_grp_x[6]}},{2{htc_upd_grp_x[5]}},{2{htc_upd_grp_x[4]}},
       {2{htc_upd_grp_x[3]}},{2{htc_upd_grp_x[2]}},{2{htc_upd_grp_x[1]}},{2{htc_upd_grp_x[0]}},
       {2{htc_upd_grp_x[7]}},{2{htc_upd_grp_x[6]}},{2{htc_upd_grp_x[5]}},{2{htc_upd_grp_x[4]}},
       {2{htc_upd_grp_x[3]}},{2{htc_upd_grp_x[2]}},{2{htc_upd_grp_x[1]}},{2{htc_upd_grp_x[0]}}}),
.dout (old_row[31:0])
);

mmu_htd_dp_nand_macro__ports_2__stack_50c__width_32 nand_predrow_w32    (
.din0 (new_row[31:0]),
.din1 (old_row[31:0]),
.dout (new_pred_row[31:0])
);

mmu_htd_dp_mux_macro__mux_aope__ports_2__stack_50c__width_32 mux_predrow_w32  (
    .din0   ({new_pred_row[31:16],htd_pred_hw2[15:0]}),
    .din1   ({htd_pred_hw2[31:16],new_pred_row[15:0]}),
    .sel0   ({htc_upd_pred_idx_hw2[3]}),
    .dout   ({htd_newpred_hw2[31:0]})
);



/////////////////////////////////////////////////////////////////////
// MRA Access Cycle 
// => Conf. Register (M1)
// => Read Range/Offset (HW3)
// => Muxing TTE data for thread whose RR values are available
/////////////////////////////////////////////////////////////////////
// MUX out RA/PA of return tte queue, prepare for RR check and RA2PA
mmu_htd_dp_mux_macro__mux_aonpe__ports_8__stack_50c__width_40  mux_ttedata_hw3_w40     (
    .din0({thr0_tte_data_hw2[39:0]}), 
    .din1({thr1_tte_data_hw2[39:0]}), 
    .din2({thr2_tte_data_hw2[39:0]}), 
    .din3({thr3_tte_data_hw2[39:0]}), 
    .din4({thr4_tte_data_hw2[39:0]}), 
    .din5({thr5_tte_data_hw2[39:0]}), 
    .din6({thr6_tte_data_hw2[39:0]}), 
    .din7({thr7_tte_data_hw2[39:0]}), 
    .sel0(htc_thr_prevalid_hw3[0]),
    .sel1(htc_thr_prevalid_hw3[1]),
    .sel2(htc_thr_prevalid_hw3[2]),
    .sel3(htc_thr_prevalid_hw3[3]),
    .sel4(htc_thr_prevalid_hw3[4]),
    .sel5(htc_thr_prevalid_hw3[5]),
    .sel6(htc_thr_prevalid_hw3[6]),
    .sel7(htc_thr_prevalid_hw3[7]),
    .dout({tte_data_hw3[39:0]})
);

                                                      


//assign htd_pgsz_hw3[2:0] = tte_data_hw3[2:0];


//generate the ramask

//mux_macro  mux_ramask_w18 (width=18, ports=8, mux=aodec, stack=36r) (
//    .din0(18'b000000000000000), 
//    .din1(18'b000000000000111), 
//    .din2(18'b000000000111111), 
//    .din3(18'b000000111111111), 
//    .din4(18'b000111111111111), 
//    .din5(18'b111111111111111), 
//    .din6(18'b111111111111111), 
//    .din7(18'b111111111111111), 
//    .sel(tte_data_hw2[2:0]),
//    .dout(ra_mask_hw3[30:13])
//);


// Use aope mux, because the selects are not one-hot
mmu_htd_dp_mux_macro__mux_aope__ports_4__stack_16r__width_15 mux_ramask_w15     (
    .din0({15'b111111111111111}),         //pgsz5
    .din1({15'b000000111111111}),         //pgsz3
    .din2({15'b000000000000111}),         //pgsz1
    .din3({15'b000000000000000}),         //pgsz0
    .sel0(tte_data_hw3[2]),
    .sel1(tte_data_hw3[1]),
    .sel2(tte_data_hw3[0]),
    .dout({ra_mask_hw3[27:13]})
);


mmu_htd_dp_msff_macro__stack_16r__width_15 reg_ramaskhw4_w15   (
    .scan_in(reg_ramaskhw4_w15_scanin),
    .scan_out(reg_ramaskhw4_w15_scanout),
    .clk (l2clk),
    .en  (htc_hw3_clken),
    .din ({ra_mask_hw3[27:13]}),
    .dout ({htc_ra_mask_hw4[27:13]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);



mmu_htd_dp_msff_macro__stack_50c__width_40 reg_ttedatahw4_w40   (
    .scan_in(reg_ttedatahw4_w40_scanin),
    .scan_out(reg_ttedatahw4_w40_scanout),
    .clk (l2clk),
    .en  (htc_hw3_clken),
    .din ({tte_data_hw3[39:0]}),
    .dout ({tte_data_hw4[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);


// Range and offset are returned from mra in HW3

mmu_htd_dp_msff_macro__stack_58c__width_27 reg_offsethw4_w27   
(
 .scan_in(reg_offsethw4_w27_scanin),
 .scan_out(reg_offsethw4_w27_scanout),
 .clk (l2clk),
 .en  (htc_hw3_clken),
 .din  ({mra_data[26:0]}),
 .dout ({offset0_hw4[39:13]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_htd_dp_msff_macro__stack_58c__width_55 reg_rangehw4_w55   
(
 .scan_in(reg_rangehw4_w55_scanin),
 .scan_out(reg_rangehw4_w55_scanout),
 .clk (l2clk),
 .en  (htc_hw3_clken),
 .din ({mra_data[81:27]}),
 .dout ({range0_hw4[63],range0_hw4[53:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

/////////////////////////////////////////////////////////////////////
// Real Address to Physical Address (HW4)
/////////////////////////////////////////////////////////////////////


assign ra_mask_hw4[39:13] = {12'b0,htc_ra_mask_hw4[27:13]};


/////////////////////////////////////////////////////////////////////
// Range Window Checking
// Check whether TTE is within real range
// Cout = A + (~B) + (cin=1'b1);
// If Cout == 1, then A >=B
// If Cout == 0, then A < B
// Here A = TTE_DATA
//  and B = Lower Range or Upper Range


// We need to check for A>B
// So modify the above check to not add cin=1
// In this case Cout is generated only if A>B
// Cout = A + (~B) + (cin=0)
// In other words, a cout from a subtractor can give us A>=B, but
// we need A>B information.  A>B, implies A-1>=B, This is detected by doing (A-1) -B,
// which in 2's comp is (A-1) + (~B) + (cin=1) = A + (~B).
//
// For upper range check, A = TTE OR'd with MASK (upper address on page), B = range_hi,
//                        A>B indicates out of range
// For lower range check, A = range_lo, B = TTE And'd with ~MASK (lower address on page)
//                        A>B indicates in range.
/////////////////////////////////////////////////////////////////////
// range_en bit is physically located in bit 54.
// It is bit 63 in software visible real range register
assign htd_range_en_hw4 = range0_hw4[63];



// Clear W bit in TTE if W_mask==1 in offset register

mmu_htd_dp_inv_macro__stack_36r__width_27 inv1_w27   (
  .din({ra_mask_hw4[39:13]}),
  .dout({ra_mask_hw4_[39:13]})
);

// generate the lower bound for the page pointed to by tte
mmu_htd_dp_and_macro__ports_2__stack_36r__width_27 and1_w27    (
  .din0({tte_data_hw4[34:8]}),                   //PA
  .din1({ra_mask_hw4_[39:13]}),
  .dout({tte_lo[39:13]})
);

// generate the upper bound for the page pointed to by tte
mmu_htd_dp_or_macro__ports_2__stack_36r__width_27 or1_w27    (
  .din0({tte_data_hw4[34:8]}),
  .din1({ra_mask_hw4[39:13]}),
  .dout({tte_hi[39:13]})
);

/////////////////////////////////////////////////////////////////////
//Real Range Checking (0)
// lower range : range0[26:0]
// upper range : range0[53:27]

/////////////////////////////////////////////////////////////////////
mmu_htd_dp_inv_macro__stack_36r__width_28 inv2_w28   (
  .din({ra_to_pa_upper_hit_, tte_lo[39:13]}),
  .dout({htd_ra2pa_upper_hit_hw4, tte_lo_[39:13]})
);

mmu_htd_dp_inv_macro__stack_36r__width_28 inv3_w28   (
  .din({ ra_to_pa_lower_hit_,      range0_hw4[53:27]}),
  .dout({htd_ra2pa_lower_hit_hw4, rg0_hi_[39:13]})
);

assign rg0_lo[39:13] = range0_hw4[26:0];

assign htd_razero_hw4 = tte_data_hw4[39];

// lower limit check,
// range_lo > tte_lo => ~ra2pa_lower_hit
mmu_htd_dp_cla_macro__width_32	gt_lb_cla_rg0	 (
  .din0({rg0_lo[39:13], 5'b00000}),
  .din1({tte_lo_[39:13], 5'b11111}),
  .cin (1'b0),
  .cout(ra_to_pa_lower_hit_),
  .dout(sum0_unused[31:0])
);

// uppe limit check
// tte_hi > range_hi => ~ra2pa_upper_hit
mmu_htd_dp_cla_macro__width_32	lt_ub_cla_rg0	 (
  .din0({tte_hi[39:13], 5'b00000}),     
  .din1({rg0_hi_[39:13], 5'b11111}),
  .cin (1'b0),
  .cout(ra_to_pa_upper_hit_),
  .dout(sum1_unused[31:0])
);

// conver ra to pa, by adding offset to ra
mmu_htd_dp_cla_macro__width_12	cla0_ratopa	 (
  .din0(offset0_hw4[24:13]),
  .din1(tte_data_hw4[19:8]),
  .cin (1'b0),
  .cout(cout0),
  .dout(pa_0_din[24:13])
);

mmu_htd_dp_cla_macro__width_16	cla1_ratopa	 (
  .din0({1'b0, offset0_hw4[39:25]}),
  .din1({1'b0, tte_data_hw4[34:20]}),
  .cin (cout0),
  .cout(carry0_unused),
  .dout({sum_unused, pa_0_din[39:25]})
);
//assign pa_0_din[39:30] = offset0[39:30];


// Prepare to write to I/D TLB registers
// 
mmu_htd_dp_mux_macro__mux_aope__ports_2__stack_36r__width_27 mux_tlbdatainhw4_w27  (
    .din0   ({pa_0_din[39:13]}),       // RA       
    .din1   (tte_data_hw4[34:8]),                                               //PA
    .sel0   ({htc_ranotpa_hw4}),
    .dout   ({htd_tlbdatain[34:8]})
);


assign htd_tlbdatain_hw4[38:0] = {tte_data_hw4[38:35], htd_tlbdatain[34:8], tte_data_hw4[7:0]};


mmu_htd_dp_msff_macro__stack_50c__width_39 reg_tlbdatainhw5_w39   (
    .scan_in(reg_tlbdatainhw5_w39_scanin),
    .scan_out(reg_tlbdatainhw5_w39_scanout),
    .clk (l2clk),
    .en  (htc_hw4_clken),
    .din ({htd_tlbdatain_hw4[38:0]}),
    .dout ({htd_tlbdatain_hw5[38:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign htd_tlbdatain_din[38:0] = htd_tlbdatain_hw5[38:0];

                                               

// tag access mux
mmu_htd_dp_mux_macro__mux_aonpe__ports_8__stack_50c__width_48  mux_vactx_w48     (
    .din0({thr0_va_ff[47:13], htd_thr0_ctx_ff[12:0]}),
    .din1({thr1_va_ff[47:13], htd_thr1_ctx_ff[12:0]}),
    .din2({thr2_va_ff[47:13], htd_thr2_ctx_ff[12:0]}),
    .din3({thr3_va_ff[47:13], htd_thr3_ctx_ff[12:0]}),
    .din4({thr4_va_ff[47:13], htd_thr4_ctx_ff[12:0]}),
    .din5({thr5_va_ff[47:13], htd_thr5_ctx_ff[12:0]}),
    .din6({thr6_va_ff[47:13], htd_thr6_ctx_ff[12:0]}),
    .din7({thr7_va_ff[47:13], htd_thr7_ctx_ff[12:0]}),
    .sel0(htc_rd_tteq[0]),
    .sel1(htc_rd_tteq[1]),
    .sel2(htc_rd_tteq[2]),
    .sel3(htc_rd_tteq[3]),
    .sel4(htc_rd_tteq[4]),
    .sel5(htc_rd_tteq[5]),
    .sel6(htc_rd_tteq[6]),
    .sel7(htc_rd_tteq[7]),
    .dout({htd_tagaccess_din_prebuf[47:0]})
);

mmu_htd_dp_buff_macro__stack_50c__width_48 buf_vactx_w48   (
.din({htd_tagaccess_din_prebuf[47:0]}),
.dout({htd_tagaccess_din[47:0]})
);

assign lsu_tlu_dsfsr_ct_b_1_unused = lsu_tlu_dsfsr_ct_b[1];
assign l15_spc_data1_unused[25:0] = {l15_spc_data1[105:90], 
                                   l15_spc_data1[61:56],l15_spc_data1[9],l15_spc_data1[5:3]};
assign l15_mmu_cpkt_unused = l15_mmu_cpkt[5];




// fixscan start:
assign reg_tlbmiss_w30_scanin    = scan_in                  ;
assign reg0_vactx_w50_scanin     = reg_tlbmiss_w30_scanout  ;
assign reg1_vactx_w50_scanin     = reg0_vactx_w50_scanout   ;
assign reg2_vactx_w50_scanin     = reg1_vactx_w50_scanout   ;
assign reg3_vactx_w50_scanin     = reg2_vactx_w50_scanout   ;
assign reg4_vactx_w50_scanin     = reg3_vactx_w50_scanout   ;
assign reg5_vactx_w50_scanin     = reg4_vactx_w50_scanout   ;
assign reg6_vactx_w50_scanin     = reg5_vactx_w50_scanout   ;
assign reg7_vactx_w50_scanin     = reg6_vactx_w50_scanout   ;
assign reg_tsbconf_m2_w39_scanin = reg7_vactx_w50_scanout   ;
assign reg0_tsbcfg_w28_scanin    = reg_tsbconf_m2_w39_scanout;
assign reg1_tsbcfg_w28_scanin    = reg0_tsbcfg_w28_scanout  ;
assign reg2_tsbcfg_w28_scanin    = reg1_tsbcfg_w28_scanout  ;
assign reg3_tsbcfg_w28_scanin    = reg2_tsbcfg_w28_scanout  ;
assign reg4_tsbcfg_w28_scanin    = reg3_tsbcfg_w28_scanout  ;
assign reg5_tsbcfg_w28_scanin    = reg4_tsbcfg_w28_scanout  ;
assign reg6_tsbcfg_w28_scanin    = reg5_tsbcfg_w28_scanout  ;
assign reg7_tsbcfg_w28_scanin    = reg6_tsbcfg_w28_scanout  ;
assign reg_q1addr_w36_scanin     = reg7_tsbcfg_w28_scanout  ;
assign reg_q0addr_ng_w36_scanin  = reg_q1addr_w36_scanout   ;
assign reg_q0addr_g_w36_scanin   = reg_q0addr_ng_w36_scanout;
assign reg_l15addr_w36_scanin    = reg_q0addr_g_w36_scanout ;
assign reg_vpn_w40_scanin        = reg_l15addr_w36_scanout  ;
assign reg_tsbcfg_hw1_w30_scanin = reg_vpn_w40_scanout      ;
assign reg_l15vahw1_w36_scanin   = reg_tsbcfg_hw1_w30_scanout;
assign reg_l15ctx_w34_scanin     = reg_l15vahw1_w36_scanout ;
assign reg_l15data_w49_scanin    = reg_l15ctx_w34_scanout   ;
assign e0_tte_reg_w40_scanin     = reg_l15data_w49_scanout  ;
assign e1_tte_reg_w40_scanin     = e0_tte_reg_w40_scanout   ;
assign e2_tte_reg_w40_scanin     = e1_tte_reg_w40_scanout   ;
assign e3_tte_reg_w40_scanin     = e2_tte_reg_w40_scanout   ;
assign e4_tte_reg_w40_scanin     = e3_tte_reg_w40_scanout   ;
assign e5_tte_reg_w40_scanin     = e4_tte_reg_w40_scanout   ;
assign e6_tte_reg_w40_scanin     = e5_tte_reg_w40_scanout   ;
assign e7_tte_reg_w40_scanin     = e6_tte_reg_w40_scanout   ;
assign pred_row0_w32_scanin      = e7_tte_reg_w40_scanout   ;
assign pred_row1_w32_scanin      = pred_row0_w32_scanout    ;
assign pred_row2_w32_scanin      = pred_row1_w32_scanout    ;
assign pred_row3_w32_scanin      = pred_row2_w32_scanout    ;
assign reg_ramaskhw4_w15_scanin  = pred_row3_w32_scanout    ;
assign reg_ttedatahw4_w40_scanin = reg_ramaskhw4_w15_scanout;
assign reg_offsethw4_w27_scanin  = reg_ttedatahw4_w40_scanout;
assign reg_rangehw4_w55_scanin   = reg_offsethw4_w27_scanout;
assign reg_tlbdatainhw5_w39_scanin = reg_rangehw4_w55_scanout ;
assign scan_out                  = reg_tlbdatainhw5_w39_scanout;
// fixscan end:
endmodule


//
//   buff macro
//
//





module mmu_htd_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule





//
//   invert macro
//
//





module mmu_htd_dp_inv_macro__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






inv #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module mmu_htd_dp_or_macro__ports_2__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output [7:0] dout;






or2 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout[7:0])
);









endmodule









// any PARAMS parms go into naming of macro

module mmu_htd_dp_msff_macro__stack_50c__width_30 (
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
wire [28:0] so;

  input [29:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [29:0] dout;


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
dff #(30)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[29:0]),
.si({scan_in,so[28:0]}),
.so({so[28:0],scan_out}),
.q(dout[29:0])
);




















endmodule









//  
//   and macro for ports = 2,3,4
//
//





module mmu_htd_dp_and_macro__stack_50c__width_13 (
  din0, 
  din1, 
  dout);
  input [12:0] din0;
  input [12:0] din1;
  output [12:0] dout;






and2 #(13)  d0_0 (
.in0(din0[12:0]),
.in1(din1[12:0]),
.out(dout[12:0])
);









endmodule









// any PARAMS parms go into naming of macro

module mmu_htd_dp_msff_macro__mux_aope__ports_4__stack_50c__width_50 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel0, 
  sel1, 
  sel2, 
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
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire [49:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [48:0] so;

  input [49:0] din0;
  input [49:0] din1;
  input [49:0] din2;
  input [49:0] din3;
  input sel0;
  input sel1;
  input sel2;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [49:0] dout;


  output scan_out;




cl_dp1_penc4_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(50)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[49:0]),
  .in1(din1[49:0]),
  .in2(din2[49:0]),
  .in3(din3[49:0]),
.dout(muxout[49:0])
);
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
dff #(50)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[49:0]),
.si({scan_in,so[48:0]}),
.so({so[48:0],scan_out}),
.q(dout[49:0])
);




















endmodule









//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module mmu_htd_dp_zero_macro__dcmp_12x__width_16 (
  din, 
  dout);
  input [15:0] din;
  output dout;






zero #(16)  m0_0 (
.in(din[15:0]),
.out(dout)
);










endmodule





//
//   buff macro
//
//





module mmu_htd_dp_buff_macro__stack_50c__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






buff #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__dmux_8x__mux_aonpe__ports_4__stack_58c__width_33 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;

  input [32:0] din0;
  input sel0;
  input [32:0] din1;
  input sel1;
  input [32:0] din2;
  input sel2;
  input [32:0] din3;
  input sel3;
  output [32:0] dout;





cl_dp1_muxbuff4_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(33)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[32:0]),
  .in1(din1[32:0]),
  .in2(din2[32:0]),
  .in3(din3[32:0]),
.dout(dout[32:0])
);









  



endmodule


//
//   xor macro for ports = 2,3
//
//





module mmu_htd_dp_xor_macro__ports_3__stack_64c__width_12 (
  din0, 
  din1, 
  din2, 
  dout);
  input [11:0] din0;
  input [11:0] din1;
  input [11:0] din2;
  output [11:0] dout;





xor3 #(12)  d0_0 (
.in0(din0[11:0]),
.in1(din1[11:0]),
.in2(din2[11:0]),
.out(dout[11:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module mmu_htd_dp_xor_macro__ports_2__stack_64c__width_6 (
  din0, 
  din1, 
  dout);
  input [5:0] din0;
  input [5:0] din1;
  output [5:0] dout;





xor2 #(6)  d0_0 (
.in0(din0[5:0]),
.in1(din1[5:0]),
.out(dout[5:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_pgpe__ports_2__stack_58c__width_40 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [39:0] din0;
  input [39:0] din1;
  input sel0;
  output [39:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(40)  d0_0 (
  .sel(psel1),
  .in0(din0[39:0]),
  .in1(din1[39:0]),
.dout(dout[39:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_pgpe__ports_2__stack_58c__width_42 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [41:0] din0;
  input [41:0] din1;
  input sel0;
  output [41:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(42)  d0_0 (
  .sel(psel1),
  .in0(din0[41:0]),
  .in1(din1[41:0]),
.dout(dout[41:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_pgpe__ports_2__stack_58c__width_39 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [38:0] din0;
  input [38:0] din1;
  input sel0;
  output [38:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(39)  d0_0 (
  .sel(psel1),
  .in0(din0[38:0]),
  .in1(din1[38:0]),
.dout(dout[38:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module mmu_htd_dp_msff_macro__stack_58c__width_39 (
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
wire [37:0] so;

  input [38:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [38:0] dout;


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
dff #(39)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[38:0]),
.si({scan_in,so[37:0]}),
.so({so[37:0],scan_out}),
.q(dout[38:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_aodec__ports_4__stack_50c__width_28 (
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

  input [27:0] din0;
  input [27:0] din1;
  input [27:0] din2;
  input [27:0] din3;
  input [1:0] sel;
  output [27:0] dout;





cl_dp1_pdec4_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(28)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[27:0]),
  .in1(din1[27:0]),
  .in2(din2[27:0]),
  .in3(din3[27:0]),
.dout(dout[27:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module mmu_htd_dp_msff_macro__stack_50c__width_28 (
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
wire [26:0] so;

  input [27:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [27:0] dout;


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
dff #(28)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[27:0]),
.si({scan_in,so[26:0]}),
.so({so[26:0],scan_out}),
.q(dout[27:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_aonpe__ports_8__stack_50c__width_28 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  din5, 
  sel5, 
  din6, 
  sel6, 
  din7, 
  sel7, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;
wire buffout7;

  input [27:0] din0;
  input sel0;
  input [27:0] din1;
  input sel1;
  input [27:0] din2;
  input sel2;
  input [27:0] din3;
  input sel3;
  input [27:0] din4;
  input sel4;
  input [27:0] din5;
  input sel5;
  input [27:0] din6;
  input sel6;
  input [27:0] din7;
  input sel7;
  output [27:0] dout;





cl_dp1_muxbuff8_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .in7(sel7),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6),
 .out7(buffout7)
);
mux8s #(28)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[27:0]),
  .in1(din1[27:0]),
  .in2(din2[27:0]),
  .in3(din3[27:0]),
  .in4(din4[27:0]),
  .in5(din5[27:0]),
  .in6(din6[27:0]),
  .in7(din7[27:0]),
.dout(dout[27:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__left_13__mux_aonpe__ports_8__stack_50c__width_35 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  din5, 
  sel5, 
  din6, 
  sel6, 
  din7, 
  sel7, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;
wire buffout7;

  input [34:0] din0;
  input sel0;
  input [34:0] din1;
  input sel1;
  input [34:0] din2;
  input sel2;
  input [34:0] din3;
  input sel3;
  input [34:0] din4;
  input sel4;
  input [34:0] din5;
  input sel5;
  input [34:0] din6;
  input sel6;
  input [34:0] din7;
  input sel7;
  output [34:0] dout;





cl_dp1_muxbuff8_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .in7(sel7),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6),
 .out7(buffout7)
);
mux8s #(35)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[34:0]),
  .in1(din1[34:0]),
  .in2(din2[34:0]),
  .in3(din3[34:0]),
  .in4(din4[34:0]),
  .in5(din5[34:0]),
  .in6(din6[34:0]),
  .in7(din7[34:0]),
.dout(dout[34:0])
);









  



endmodule


//
//   buff macro
//
//





module mmu_htd_dp_buff_macro__left_13__stack_50c__width_35 (
  din, 
  dout);
  input [34:0] din;
  output [34:0] dout;






buff #(35)  d0_0 (
.in(din[34:0]),
.out(dout[34:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_aope__ports_4__stack_50c__width_24 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel0, 
  sel1, 
  sel2, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [23:0] din0;
  input [23:0] din1;
  input [23:0] din2;
  input [23:0] din3;
  input sel0;
  input sel1;
  input sel2;
  output [23:0] dout;





cl_dp1_penc4_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(24)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[23:0]),
  .in1(din1[23:0]),
  .in2(din2[23:0]),
  .in3(din3[23:0]),
.dout(dout[23:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_aodec__ports_8__stack_50c__width_36 (
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

  input [35:0] din0;
  input [35:0] din1;
  input [35:0] din2;
  input [35:0] din3;
  input [35:0] din4;
  input [35:0] din5;
  input [35:0] din6;
  input [35:0] din7;
  input [2:0] sel;
  output [35:0] dout;





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

mux8s #(36)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[35:0]),
  .in1(din1[35:0]),
  .in2(din2[35:0]),
  .in3(din3[35:0]),
  .in4(din4[35:0]),
  .in5(din5[35:0]),
  .in6(din6[35:0]),
  .in7(din7[35:0]),
.dout(dout[35:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_pgpe__ports_2__stack_50c__width_36 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [35:0] din0;
  input [35:0] din1;
  input sel0;
  output [35:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(36)  d0_0 (
  .sel(psel1),
  .in0(din0[35:0]),
  .in1(din1[35:0]),
.dout(dout[35:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module mmu_htd_dp_msff_macro__stack_50c__width_36 (
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
wire [34:0] so;

  input [35:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [35:0] dout;


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
dff #(36)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[35:0]),
.si({scan_in,so[34:0]}),
.so({so[34:0],scan_out}),
.q(dout[35:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_aope__ports_2__stack_50c__width_36 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [35:0] din0;
  input [35:0] din1;
  input sel0;
  output [35:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(36)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[35:0]),
  .in1(din1[35:0]),
.dout(dout[35:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_aope__ports_3__stack_50c__width_36 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [35:0] din0;
  input [35:0] din1;
  input [35:0] din2;
  input sel0;
  input sel1;
  output [35:0] dout;





cl_dp1_penc3_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(36)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[35:0]),
  .in1(din1[35:0]),
  .in2(din2[35:0]),
.dout(dout[35:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module mmu_htd_dp_msff_macro__stack_50c__width_37 (
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
wire [35:0] so;

  input [36:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [36:0] dout;


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
dff #(37)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[36:0]),
.si({scan_in,so[35:0]}),
.so({so[35:0],scan_out}),
.q(dout[36:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_aonpe__ports_2__stack_50c__width_36 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [35:0] din0;
  input sel0;
  input [35:0] din1;
  input sel1;
  output [35:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(36)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[35:0]),
  .in1(din1[35:0]),
.dout(dout[35:0])
);









  



endmodule


//
//   buff macro
//
//





module mmu_htd_dp_buff_macro__dbuff_48x__rep_1__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_pgdec__ports_8__stack_50c__width_40 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [39:0] din0;
  input [39:0] din1;
  input [39:0] din2;
  input [39:0] din3;
  input [39:0] din4;
  input [39:0] din5;
  input [39:0] din6;
  input [39:0] din7;
  input [2:0] sel;
  input muxtst;
  input test;
  output [39:0] dout;





cl_dp1_pdec8_8x  c0_0 (
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
 .psel7(psel7),
  .test(test)
);

mux8 #(40)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[39:0]),
  .in1(din1[39:0]),
  .in2(din2[39:0]),
  .in3(din3[39:0]),
  .in4(din4[39:0]),
  .in5(din5[39:0]),
  .in6(din6[39:0]),
  .in7(din7[39:0]),
.dout(dout[39:0]),
  .muxtst(muxtst)
);









  



endmodule






// any PARAMS parms go into naming of macro

module mmu_htd_dp_msff_macro__stack_50c__width_40 (
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
wire [38:0] so;

  input [39:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [39:0] dout;


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
dff #(40)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[39:0]),
.si({scan_in,so[38:0]}),
.so({so[38:0],scan_out}),
.q(dout[39:0])
);




















endmodule









//
//   buff macro
//
//





module mmu_htd_dp_buff_macro__dbuff_32x__rep_1__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_pgdec__ports_8__stack_50c__width_28 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [27:0] din0;
  input [27:0] din1;
  input [27:0] din2;
  input [27:0] din3;
  input [27:0] din4;
  input [27:0] din5;
  input [27:0] din6;
  input [27:0] din7;
  input [2:0] sel;
  input muxtst;
  input test;
  output [27:0] dout;





cl_dp1_pdec8_8x  c0_0 (
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
 .psel7(psel7),
  .test(test)
);

mux8 #(28)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[27:0]),
  .in1(din1[27:0]),
  .in2(din2[27:0]),
  .in3(din3[27:0]),
  .in4(din4[27:0]),
  .in5(din5[27:0]),
  .in6(din6[27:0]),
  .in7(din7[27:0]),
.dout(dout[27:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_pgdec__ports_4__stack_50c__width_7 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [6:0] din0;
  input [6:0] din1;
  input [6:0] din2;
  input [6:0] din3;
  input [1:0] sel;
  input muxtst;
  input test;
  output [6:0] dout;





cl_dp1_pdec4_8x  c0_0 (
 .sel0(sel[0]),
 .sel1(sel[1]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
  .test(test)
);

mux4 #(7)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[6:0]),
  .in1(din1[6:0]),
  .in2(din2[6:0]),
  .in3(din3[6:0]),
.dout(dout[6:0]),
  .muxtst(muxtst)
);









  



endmodule






// any PARAMS parms go into naming of macro

module mmu_htd_dp_msff_macro__stack_50c__width_34 (
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
wire [32:0] so;

  input [33:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [33:0] dout;


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
dff #(34)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[33:0]),
.si({scan_in,so[32:0]}),
.so({so[32:0],scan_out}),
.q(dout[33:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module mmu_htd_dp_msff_macro__stack_50c__width_49 (
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
wire [47:0] so;

  input [48:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [48:0] dout;


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
dff #(49)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[48:0]),
.si({scan_in,so[47:0]}),
.so({so[47:0],scan_out}),
.q(dout[48:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_aope__ports_2__stack_50c__width_32 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [31:0] din0;
  input [31:0] din1;
  input sel0;
  output [31:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(32)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
.dout(dout[31:0])
);









  



endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module mmu_htd_dp_cmp_macro__dcmp_8x__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output dout;






cmp #(16)  m0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout)
);










endmodule





//
//   nor macro for ports = 2,3
//
//





module mmu_htd_dp_nor_macro__ports_3__width_3 (
  din0, 
  din1, 
  din2, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  input [2:0] din2;
  output [2:0] dout;






nor3 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.in2(din2[2:0]),
.out(dout[2:0])
);







endmodule





//
//   nand macro for ports = 2,3,4
//
//





module mmu_htd_dp_nand_macro__ports_3__width_1 (
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
//   invert macro
//
//





module mmu_htd_dp_inv_macro__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






inv #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);









endmodule





//
//   invert macro
//
//





module mmu_htd_dp_inv_macro__width_1 (
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
//   nand macro for ports = 2,3,4
//
//





module mmu_htd_dp_nand_macro__ports_2__width_5 (
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





module mmu_htd_dp_nand_macro__ports_3__width_2 (
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
//   buff macro
//
//





module mmu_htd_dp_buff_macro__minbuff_1__stack_50c__width_39 (
  din, 
  dout);
  input [38:0] din;
  output [38:0] dout;






buff #(39)  d0_0 (
.in(din[38:0]),
.out(dout[38:0])
);








endmodule









// any PARAMS parms go into naming of macro

module mmu_htd_dp_msff_macro__stack_50c__width_32 (
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
wire [30:0] so;

  input [31:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [31:0] dout;


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
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_aodec__ports_8__stack_50c__width_16 (
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

  input [15:0] din0;
  input [15:0] din1;
  input [15:0] din2;
  input [15:0] din3;
  input [15:0] din4;
  input [15:0] din5;
  input [15:0] din6;
  input [15:0] din7;
  input [2:0] sel;
  output [15:0] dout;





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

mux8s #(16)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[15:0]),
  .in1(din1[15:0]),
  .in2(din2[15:0]),
  .in3(din3[15:0]),
  .in4(din4[15:0]),
  .in5(din5[15:0]),
  .in6(din6[15:0]),
  .in7(din7[15:0]),
.dout(dout[15:0])
);









  



endmodule


//
//   buff macro
//
//





module mmu_htd_dp_buff_macro__stack_50c__width_16 (
  din, 
  dout);
  input [15:0] din;
  output [15:0] dout;






buff #(16)  d0_0 (
.in(din[15:0]),
.out(dout[15:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_aodec__ports_4__stack_50c__width_32 (
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

  input [31:0] din0;
  input [31:0] din1;
  input [31:0] din2;
  input [31:0] din3;
  input [1:0] sel;
  output [31:0] dout;





cl_dp1_pdec4_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(32)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
  .in3(din3[31:0]),
.dout(dout[31:0])
);









  



endmodule


//
//   nand macro for ports = 2,3,4
//
//





module mmu_htd_dp_nand_macro__ports_2__stack_50c__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output [31:0] dout;






nand2 #(32)  d0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout[31:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_aonpe__ports_8__stack_50c__width_40 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  din5, 
  sel5, 
  din6, 
  sel6, 
  din7, 
  sel7, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;
wire buffout7;

  input [39:0] din0;
  input sel0;
  input [39:0] din1;
  input sel1;
  input [39:0] din2;
  input sel2;
  input [39:0] din3;
  input sel3;
  input [39:0] din4;
  input sel4;
  input [39:0] din5;
  input sel5;
  input [39:0] din6;
  input sel6;
  input [39:0] din7;
  input sel7;
  output [39:0] dout;





cl_dp1_muxbuff8_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .in7(sel7),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6),
 .out7(buffout7)
);
mux8s #(40)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[39:0]),
  .in1(din1[39:0]),
  .in2(din2[39:0]),
  .in3(din3[39:0]),
  .in4(din4[39:0]),
  .in5(din5[39:0]),
  .in6(din6[39:0]),
  .in7(din7[39:0]),
.dout(dout[39:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_aope__ports_4__stack_16r__width_15 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel0, 
  sel1, 
  sel2, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [14:0] din0;
  input [14:0] din1;
  input [14:0] din2;
  input [14:0] din3;
  input sel0;
  input sel1;
  input sel2;
  output [14:0] dout;





cl_dp1_penc4_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(15)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[14:0]),
  .in1(din1[14:0]),
  .in2(din2[14:0]),
  .in3(din3[14:0]),
.dout(dout[14:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module mmu_htd_dp_msff_macro__stack_16r__width_15 (
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
wire [13:0] so;

  input [14:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [14:0] dout;


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
dff #(15)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[14:0]),
.si({scan_in,so[13:0]}),
.so({so[13:0],scan_out}),
.q(dout[14:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module mmu_htd_dp_msff_macro__stack_58c__width_27 (
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
wire [25:0] so;

  input [26:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [26:0] dout;


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
dff #(27)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[26:0]),
.si({scan_in,so[25:0]}),
.so({so[25:0],scan_out}),
.q(dout[26:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module mmu_htd_dp_msff_macro__stack_58c__width_55 (
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
wire [53:0] so;

  input [54:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [54:0] dout;


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
dff #(55)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[54:0]),
.si({scan_in,so[53:0]}),
.so({so[53:0],scan_out}),
.q(dout[54:0])
);




















endmodule









//
//   invert macro
//
//





module mmu_htd_dp_inv_macro__stack_36r__width_27 (
  din, 
  dout);
  input [26:0] din;
  output [26:0] dout;






inv #(27)  d0_0 (
.in(din[26:0]),
.out(dout[26:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module mmu_htd_dp_and_macro__ports_2__stack_36r__width_27 (
  din0, 
  din1, 
  dout);
  input [26:0] din0;
  input [26:0] din1;
  output [26:0] dout;






and2 #(27)  d0_0 (
.in0(din0[26:0]),
.in1(din1[26:0]),
.out(dout[26:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module mmu_htd_dp_or_macro__ports_2__stack_36r__width_27 (
  din0, 
  din1, 
  dout);
  input [26:0] din0;
  input [26:0] din1;
  output [26:0] dout;






or2 #(27)  d0_0 (
.in0(din0[26:0]),
.in1(din1[26:0]),
.out(dout[26:0])
);









endmodule





//
//   invert macro
//
//





module mmu_htd_dp_inv_macro__stack_36r__width_28 (
  din, 
  dout);
  input [27:0] din;
  output [27:0] dout;






inv #(28)  d0_0 (
.in(din[27:0]),
.out(dout[27:0])
);









endmodule





//
//   cla macro
//
//





module mmu_htd_dp_cla_macro__width_32 (
  cin, 
  din0, 
  din1, 
  dout, 
  cout);
  input cin;
  input [31:0] din0;
  input [31:0] din1;
  output [31:0] dout;
  output cout;







cla #(32)  m0_0 (
.cin(cin),
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout[31:0]),
.cout(cout)
);












endmodule





//
//   cla macro
//
//





module mmu_htd_dp_cla_macro__width_12 (
  cin, 
  din0, 
  din1, 
  dout, 
  cout);
  input cin;
  input [11:0] din0;
  input [11:0] din1;
  output [11:0] dout;
  output cout;







cla #(12)  m0_0 (
.cin(cin),
.in0(din0[11:0]),
.in1(din1[11:0]),
.out(dout[11:0]),
.cout(cout)
);












endmodule





//
//   cla macro
//
//





module mmu_htd_dp_cla_macro__width_16 (
  cin, 
  din0, 
  din1, 
  dout, 
  cout);
  input cin;
  input [15:0] din0;
  input [15:0] din1;
  output [15:0] dout;
  output cout;







cla #(16)  m0_0 (
.cin(cin),
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout[15:0]),
.cout(cout)
);












endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_aope__ports_2__stack_36r__width_27 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [26:0] din0;
  input [26:0] din1;
  input sel0;
  output [26:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(27)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[26:0]),
  .in1(din1[26:0]),
.dout(dout[26:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module mmu_htd_dp_msff_macro__stack_50c__width_39 (
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
wire [37:0] so;

  input [38:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [38:0] dout;


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
dff #(39)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[38:0]),
.si({scan_in,so[37:0]}),
.so({so[37:0],scan_out}),
.q(dout[38:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_htd_dp_mux_macro__mux_aonpe__ports_8__stack_50c__width_48 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  din5, 
  sel5, 
  din6, 
  sel6, 
  din7, 
  sel7, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;
wire buffout7;

  input [47:0] din0;
  input sel0;
  input [47:0] din1;
  input sel1;
  input [47:0] din2;
  input sel2;
  input [47:0] din3;
  input sel3;
  input [47:0] din4;
  input sel4;
  input [47:0] din5;
  input sel5;
  input [47:0] din6;
  input sel6;
  input [47:0] din7;
  input sel7;
  output [47:0] dout;





cl_dp1_muxbuff8_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .in7(sel7),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6),
 .out7(buffout7)
);
mux8s #(48)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[47:0]),
  .in1(din1[47:0]),
  .in2(din2[47:0]),
  .in3(din3[47:0]),
  .in4(din4[47:0]),
  .in5(din5[47:0]),
  .in6(din6[47:0]),
  .in7(din7[47:0]),
.dout(dout[47:0])
);









  



endmodule


//
//   buff macro
//
//





module mmu_htd_dp_buff_macro__stack_50c__width_48 (
  din, 
  dout);
  input [47:0] din;
  output [47:0] dout;






buff #(48)  d0_0 (
.in(din[47:0]),
.out(dout[47:0])
);








endmodule




