// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mmu_htc_ctl.v
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
module mmu_htc_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  scan_out, 
  lsu_mmu_pmen, 
  spc_core_running_status, 
  l15_mmu_cpkt, 
  l15_mmu_valid, 
  asi_tsb_ptr_req_valid, 
  asi_tsb_ptr_req, 
  asi_tsb_ptr_number, 
  asd0_zero_context, 
  asd1_zero_context, 
  asi_wr_partition_id, 
  asi_wr_data, 
  asi_hwtw_config_0, 
  asi_hwtw_config_1, 
  asi_hwtw_config_2, 
  asi_hwtw_config_3, 
  asi_hwtw_config_4, 
  asi_hwtw_config_5, 
  asi_hwtw_config_6, 
  asi_hwtw_config_7, 
  asi_tsb_hwtw_enable_0, 
  asi_tsb_hwtw_enable_1, 
  htd_ra2pa_lower_hit_hw4, 
  htd_ra2pa_upper_hit_hw4, 
  htd_razero_hw4, 
  htd_range_en_hw4, 
  htd_zeroctx_m0, 
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
  htd_pred0_idx_m0, 
  htd_pred1_idx_m0, 
  htd_pred0_m0, 
  htd_pred1_m0, 
  htd_dmiss, 
  htd_sec_ctx, 
  tlu_iht_request, 
  tlu_dht_request, 
  l15_mmu_grant, 
  asi_mra_req_grant, 
  tsm_rqv, 
  tsm_tsb_miss_hw2, 
  trs_rqv, 
  trs_null_st, 
  trs_waitrr3_st, 
  trs_ecc_err, 
  trs_ep_err, 
  mel0_parity_err, 
  mel1_parity_err, 
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
  tlu_cerer_hwtwl2, 
  tlu_cerer_hwtwmu, 
  htc_core_running, 
  htc_m1_clken, 
  htc_hw3_clken, 
  htc_hw4_clken, 
  mmu_i_unauth_access, 
  mmu_i_tsb_miss, 
  mmu_d_tsb_miss, 
  mmu_reload_done, 
  mmu_use_context_0, 
  mmu_use_context_1, 
  mmu_sec_context, 
  htc_mra_addr_in, 
  htc_mra_rd_en, 
  htc_wr_itlb_data_in, 
  htc_wr_dtlb_data_in, 
  htc_dtlb_clken, 
  htc_itlb_clken, 
  htc_zero_ctx_m2, 
  htc_upd_pred_idx_hw2, 
  htc_upd_grp, 
  htc_upd_grp_x, 
  htc_new_pred_bit, 
  htc_wrpred0_hw2, 
  htc_wrpred1_hw2, 
  htc_wrpred2_hw2, 
  htc_wrpred3_hw2, 
  htc_tlb_miss_m, 
  mmu_l15_cpkt, 
  htc_l15_en, 
  mmu_l15_valid, 
  htc_wr_q0new_nogrant, 
  htc_wr_q0new_grant, 
  htc_wr_q1new, 
  htc_shift_q1_grant, 
  htc_wr_m3new, 
  htc_wr_m3q0, 
  htc_mra_sel_0, 
  htc_sel_mra_lo, 
  htc_conf_index_m2, 
  htc_vld_tsbptr_m2, 
  htc_rd_tteq, 
  htc_ra2pahit_hw5, 
  htc_ranotpax_hw5, 
  htc_cindex_bit0, 
  htc_cindex_bit1, 
  htc_rrindex_bit0, 
  htc_rrindex_bit1, 
  htc_pid0_m0, 
  htc_pid1_m0, 
  htc_tsbrd_valid_m0, 
  htc_thr_valid_hw3, 
  htc_thr_prevalid_hw3, 
  htc_va_rd_m2_in, 
  htc_ranotpa_hw4, 
  htc_data_rcvd_hw1, 
  htc_tsb_hit_hw1, 
  htc_tsb_done_hw2, 
  htc_thr_valid_m1, 
  htc_thr_valid_m0, 
  htc_hwtw_burst, 
  mmu_i_tte_outofrange, 
  mmu_d_tte_outofrange, 
  rr_ecc_err_type, 
  cfg_ecc_err_type, 
  l2_ecc_err_type, 
  rr_ecc_err_hw5, 
  cfg_ecc_err_m3, 
  l2_ecc_err_hw1, 
  htc_ep_miss_hw1, 
  cfg_ecc_err_index, 
  rr_ecc_err_index, 
  mmu_i_eccerr, 
  mmu_d_eccerr, 
  mmu_i_l2cerr, 
  mmu_d_l2cerr, 
  htc_thr0_err_type, 
  htc_thr1_err_type, 
  htc_thr2_err_type, 
  htc_thr3_err_type, 
  htc_thr4_err_type, 
  htc_thr5_err_type, 
  htc_thr6_err_type, 
  htc_thr7_err_type, 
  htc_thr0_err_index, 
  htc_thr1_err_index, 
  htc_thr2_err_index, 
  htc_thr3_err_index, 
  htc_thr4_err_index, 
  htc_thr5_err_index, 
  htc_thr6_err_index, 
  htc_thr7_err_index, 
  mmu_pmu_l2ret, 
  mmu_pmu_l2miss, 
  mmu_pmu_dtlb, 
  mmu_pmu_tid, 
  spc_aclk_wmr, 
  wmr_scan_in, 
  wmr_scan_out);
wire [7:0] htc_hwtw_mode_0;
wire [7:0] htc_hwtw_mode_1;
wire [7:0] htc_hwtw_pred;
wire l1clk;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire pmen_reg_scanin;
wire pmen_reg_scanout;
wire htc_mmu_pmen;
wire tlb_miss_lat_scanin;
wire tlb_miss_lat_scanout;
wire [7:0] htc_tlb_miss_m0;
wire [7:0] htd_dmiss_lat;
wire tlb_cerer_lat_scanin;
wire tlb_cerer_lat_scanout;
wire hwtwl2_en;
wire hwtwmu_en;
wire [2:0] pid0_in;
wire [2:0] pid0;
wire [2:0] pid1_in;
wire [2:0] pid1;
wire [2:0] pid2_in;
wire [2:0] pid2;
wire [2:0] pid3_in;
wire [2:0] pid3;
wire [2:0] pid4_in;
wire [2:0] pid4;
wire [2:0] pid5_in;
wire [2:0] pid5;
wire [2:0] pid6_in;
wire [2:0] pid6;
wire [2:0] pid7_in;
wire [2:0] pid7;
wire pid0_lat_wmr_scanin;
wire pid0_lat_wmr_scanout;
wire pid1_lat_wmr_scanin;
wire pid1_lat_wmr_scanout;
wire pid2_lat_wmr_scanin;
wire pid2_lat_wmr_scanout;
wire pid3_lat_wmr_scanin;
wire pid3_lat_wmr_scanout;
wire pid4_lat_wmr_scanin;
wire pid4_lat_wmr_scanout;
wire pid5_lat_wmr_scanin;
wire pid5_lat_wmr_scanout;
wire pid6_lat_wmr_scanin;
wire pid6_lat_wmr_scanout;
wire pid7_lat_wmr_scanin;
wire pid7_lat_wmr_scanout;
wire [7:0] tsm_sel;
wire [3:0] tsm_ptr0;
wire [7:4] tsm_ptr1;
wire tg0_valid;
wire tg1_valid;
wire sel_tg1;
wire favor_tg1;
wire [7:0] tsm_thrsel_m0;
wire [7:0] trs_thrsel_hw2;
wire tsm_thrsel_v;
wire trs_thrsel_v;
wire [7:0] tsm_valid_m0;
wire [7:0] trs_valid_hw2;
wire tsm_tg0_selected;
wire tsm_tg1_selected;
wire favor_tg1_in;
wire favour_bit_reg_scanin;
wire favour_bit_reg_scanout;
wire [3:0] tsm_ptr0_in;
wire [7:4] tsm_ptr1_in;
wire tsm_ptr0_in_0_;
wire tsm_ptr1_in_4_;
wire ptr0_reg_scanin;
wire ptr0_reg_scanout;
wire tsm_ptr0_0_;
wire ptr1_reg_scanin;
wire ptr1_reg_scanout;
wire tsm_ptr1_4_;
wire zero_ctx;
wire [7:0] incr_cindex_bit0;
wire [7:0] incr_cindex_bit1;
wire [7:0] next_cindex_bit0;
wire [7:0] next_cindex_bit1;
wire conf_idx_reg_scanin;
wire conf_idx_reg_scanout;
wire [7:0] incr_rrindex_bit0;
wire [7:0] incr_rrindex_bit1;
wire [7:0] next_rrindex_bit0;
wire [7:0] next_rrindex_bit1;
wire rr_idx_reg_scanin;
wire rr_idx_reg_scanout;
wire [1:0] conf_index;
wire [7:0] cfg_done_m1;
wire conf_rd_en;
wire [2:0] conf_rd_thr_id;
wire [4:0] conf_addr_in;
wire [1:0] conf_mra_rd_en;
wire [4:0] rr_addr_in;
wire rr_rd_en;
wire [1:0] rr_mra_rd_en;
wire thr_valid_miss_lo_m0;
wire thr_valid_miss_hi_m0;
wire tsbrd_valid_m0;
wire m1_stg_lat_scanin;
wire m1_stg_lat_scanout;
wire zero_ctx_m1;
wire [1:0] conf_index_m1;
wire [2:0] conf_addr_m1;
wire conf_prevalid_lat_scanin;
wire conf_prevalid_lat_scanout;
wire [7:0] thr_prevalid_m1;
wire tsbrd_z_m0;
wire tsbrd_nz_m0;
wire tsbptr_lat_scanin;
wire tsbptr_lat_scanout;
wire [0:0] tsbrd_tsbptr_m1;
wire tsbrd_z_m1;
wire tsbrd_nz_m1;
wire [7:0] htc_tsbrd_valid_m1;
wire asi_tsb_ptr_number_unused;
wire predrow0_lat_scanin;
wire predrow0_lat_scanout;
wire [5:0] htd_pred0_idx_m1;
wire [15:0] htd_pred0_m1;
wire predrow1_lat_scanin;
wire predrow1_lat_scanout;
wire [5:0] htd_pred1_idx_m1;
wire [15:0] htd_pred1_m1;
wire tlbmiss_lat_scanin;
wire tlbmiss_lat_scanout;
wire [7:0] htc_tlb_miss_m1;
wire tlbvalidmiss_lat_scanin;
wire tlbvalidmiss_lat_scanout;
wire thr_valid_miss_hi_m1;
wire thr_valid_miss_lo_m1;
wire [1:0] pred0_bit_m1;
wire [1:0] pred1_bit_m1;
wire [5:0] pred_idx0_in;
wire [5:0] pred_idx0;
wire [5:0] pred_idx1_in;
wire [5:0] pred_idx1;
wire [5:0] pred_idx2_in;
wire [5:0] pred_idx2;
wire [5:0] pred_idx3_in;
wire [5:0] pred_idx3;
wire [5:0] pred_idx4_in;
wire [5:0] pred_idx4;
wire [5:0] pred_idx5_in;
wire [5:0] pred_idx5;
wire [5:0] pred_idx6_in;
wire [5:0] pred_idx6;
wire [5:0] pred_idx7_in;
wire [5:0] pred_idx7;
wire [1:0] pred_bit0_in;
wire [1:0] pred_bit0;
wire [1:0] pred_bit1_in;
wire [1:0] pred_bit1;
wire [1:0] pred_bit2_in;
wire [1:0] pred_bit2;
wire [1:0] pred_bit3_in;
wire [1:0] pred_bit3;
wire [1:0] pred_bit4_in;
wire [1:0] pred_bit4;
wire [1:0] pred_bit5_in;
wire [1:0] pred_bit5;
wire [1:0] pred_bit6_in;
wire [1:0] pred_bit6;
wire [1:0] pred_bit7_in;
wire [1:0] pred_bit7;
wire pred0_lat_scanin;
wire pred0_lat_scanout;
wire pred1_lat_scanin;
wire pred1_lat_scanout;
wire pred2_lat_scanin;
wire pred2_lat_scanout;
wire pred3_lat_scanin;
wire pred3_lat_scanout;
wire pred4_lat_scanin;
wire pred4_lat_scanout;
wire pred5_lat_scanin;
wire pred5_lat_scanout;
wire pred6_lat_scanin;
wire pred6_lat_scanout;
wire pred7_lat_scanin;
wire pred7_lat_scanout;
wire room_avail_m1;
wire cfg_read_tg0_m1;
wire cfg_read_tg1_m1;
wire htc_valid_m1;
wire [7:0] thr_valid_m2_in;
wire tsbrd_valid_m1;
wire tsbrd_tg0_m1;
wire tsbrd_tg1_m1;
wire [1:0] htc_mra_sel;
wire rr_read_tg1_hw3;
wire rr_read_tg0_hw3;
wire pred_en;
wire [1:1] pred_bit_m1;
wire conf_sel_mra_lo;
wire conf_sel_mra_up;
wire tsbrd_sel_mra_lo;
wire tsbrd_sel_mra_up;
wire htc_sel_mra_up;
wire [1:0] conf_index_m2_in;
wire hwtw_en_tg0;
wire hwtw_en_tg1;
wire hwtw_en_m2_in;
wire m2_stg_lat2_scanin;
wire m2_stg_lat2_scanout;
wire hwtw_en_m2;
wire cfg_read_tg0_m2;
wire cfg_read_tg1_m2;
wire zero_ctx_m2;
wire [2:0] conf_addr_m2;
wire [7:0] htc_thr_valid_m2;
wire [2:0] vld_tsbptr_thr_id_m2;
wire vld_tsbptr_rdy_m2;
wire [7:0] htc_cfg_ecc_err_en_m2;
wire [2:0] cfg_ecc_err_index_m2;
wire m3_stg_lat1_scanin;
wire m3_stg_lat1_scanout;
wire cfg_read_tg0_m3;
wire cfg_read_tg1_m3;
wire [7:0] htc_cfg_ecc_err_en_m3;
wire mel0_parity_err_m3;
wire mel1_parity_err_m3;
wire mra0_ecc_err_lat;
wire mra1_ecc_err_lat;
wire [1:0] mra0_err_type_lat;
wire [1:0] mra1_err_type_lat;
wire req_m2;
wire [2:0] htc_l15_cpkt_15_13;
wire [1:0] htc_l15_cpkt_9_8;
wire [1:0] next_gkt_count;
wire gkt_grant;
wire mmu_l15_valid_int;
wire [1:0] gkt_count;
wire gkt_count_reg_scanin;
wire gkt_count_reg_scanout;
wire gkt_full;
wire v0_in;
wire v0;
wire v1;
wire v1_in;
wire qv_reg_scanin;
wire qv_reg_scanout;
wire q0_val;
wire q1_val;
wire htc_wr_q0new;
wire htc_shift_q1;
wire [4:0] q1_cpkt_in;
wire [4:0] q1_cpkt;
wire q1cpkt_reg_scanin;
wire q1cpkt_reg_scanout;
wire [4:0] q0_cpkt_in;
wire [4:0] q0_cpkt;
wire q0cpkt_reg_scanin;
wire q0cpkt_reg_scanout;
wire htc_l15_valid;
wire [2:0] mmu_l15_cpkt_in_15_13_in;
wire [1:0] mmu_l15_cpkt_in_9_8_in;
wire cpkt_reg_scanin;
wire cpkt_reg_scanout;
wire load_ret_hw0;
wire [7:0] ret_tid_hw0;
wire l2_err_hw0;
wire [1:0] l2_ecc_err_type_hw0;
wire [1:0] ret_tsbid_hw0;
wire l2miss_hw0;
wire l2_cerr_hw0;
wire gkt_hw0_lat0_scanin;
wire gkt_hw0_lat0_scanout;
wire l2_cerr_hw1;
wire l2_err_hw1;
wire load_ret_hw1;
wire [7:0] ret_tid_hw1;
wire [1:0] ret_tsbid_hw1;
wire l2miss_hw1;
wire [2:0] mmutid_hw1;
wire htd_ptr_hit_hw1;
wire ctx_hit;
wire ep_hit;
wire raw_tsb_hit_hw1;
wire raw_ep_miss_hw1;
wire [7:0] tsb_done_hw1;
wire [7:0] d_l2_cerr;
wire [7:0] i_l2_cerr;
wire final_l2_cerr_lat_scanin;
wire final_l2_cerr_lat_scanout;
wire tsb_hit_lat_scanin;
wire tsb_hit_lat_scanout;
wire [7:0] htc_tsb_hit_hw2;
wire ep_miss_lat_scanin;
wire ep_miss_lat_scanout;
wire [7:0] htc_ep_miss_hw2;
wire tsb_done_lat_scanin;
wire tsb_done_lat_scanout;
wire [7:0] tsb_done_nocfg_hw2;
wire cfg_ecc_lat_scanin;
wire cfg_ecc_lat_scanout;
wire [7:0] cfg_ecc_err_m4;
wire tsbid_lat_scanin;
wire tsbid_lat_scanout;
wire [1:0] ret_tsbid_hw2;
wire [7:0] htd_ranotpa_in;
wire [7:0] htd_ranotpa;
wire [7:0] htd_zeroctx_in;
wire [7:0] htd_zeroctx;
wire [7:0] htd_usectx0_in;
wire [7:0] htd_usectx0;
wire [7:0] htd_usectx1_in;
wire [7:0] htd_usectx1;
wire tsb0_lat_scanin;
wire tsb0_lat_scanout;
wire [1:0] rr_index;
wire [7:0] thr_valid_hw2;
wire [7:0] rr_done_hw3;
wire [2:0] rr_rd_thr_id;
wire [5:0] upd_pred_idx;
wire [1:0] upd_pred_bit;
wire [1:0] ret_tsbnum_hw2;
wire inc_pred;
wire dec_pred;
wire pred_upd_en;
wire rr_addr_hw2_lat_scanin;
wire rr_addr_hw2_lat_scanout;
wire [2:0] rr_addr_hw3;
wire rr_index_hw2_lat_scanin;
wire rr_index_hw2_lat_scanout;
wire [1:0] rr_index_hw3;
wire rr_prevalid_lat_scanin;
wire rr_prevalid_lat_scanout;
wire stg_hw3_lat_scanin;
wire stg_hw3_lat_scanout;
wire rr_read_tg0_hw4;
wire rr_read_tg1_hw4;
wire [2:0] rr_addr_hw4;
wire thr_valid_hw3_lat_scanin;
wire thr_valid_hw3_lat_scanout;
wire [7:0] htc_thr_valid_hw4;
wire ra2pahit_raw;
wire [7:0] htc_thr_ra_valid_hw4;
wire [7:0] ra2pahit_thr_hw4;
wire [7:0] disable_ra2pahit_st;
wire [7:0] htc_ranotpax_hw4;
wire [7:0] disable_ra2pahit_st_in;
wire htc_zeroctx_hw4;
wire htc_usectx0_hw4;
wire htc_usectx1_hw4;
wire htc_sec_ctx_hw4;
wire htc_new_use_ctx0_hw4;
wire htc_new_use_ctx1_hw4;
wire [2:0] rr_ecc_err_index_hw4;
wire [7:0] tlb_clken_hw4;
wire [7:0] htc_dtlb_clken_hw4;
wire [7:0] htc_itlb_clken_hw4;
wire rr_ranotpax_hw4_lat_scanin;
wire rr_ranotpax_hw4_lat_scanout;
wire [7:0] htc_thr_ra_valid_hw5;
wire ra2pahit_st_lat_scanin;
wire ra2pahit_st_lat_scanout;
wire ra2pahit_lat_scanin;
wire ra2pahit_lat_scanout;
wire [7:0] ra2pahit_hw5;
wire hw4_stg_lat1_scanin;
wire hw4_stg_lat1_scanout;
wire rr_read_tg0_hw5;
wire rr_read_tg1_hw5;
wire hw4_stg_lat2_scanin;
wire hw4_stg_lat2_scanout;
wire [7:0] tlb_wr_en;
wire [7:0] mmu_reload_done_din;
wire [7:0] i_tte_outofrange;
wire [7:0] d_tte_outofrange;
wire [7:0] final_ecc_err_hw5;
wire [7:0] i_ecc_err;
wire [7:0] d_ecc_err;
wire stg_hw5_lat_scanin;
wire stg_hw5_lat_scanout;
wire outofrangemiss_lat_scanin;
wire outofrangemiss_lat_scanout;
wire final_ecc_err_lat_scanin;
wire final_ecc_err_lat_scanout;
wire err_type_lat_scanin;
wire err_type_lat_scanout;
wire err_index_lat_scanin;
wire err_index_lat_scanout;
wire [7:0] i_unauth_access;
wire [7:0] i_tsb_miss;
wire [7:0] d_tsb_miss;
wire tsbmiss_lat_scanin;
wire tsbmiss_lat_scanout;
wire [5:0] l15_mmu_cpkt_unused;
wire spares_scanin;
wire spares_scanout;


input           l2clk;
input           scan_in;
input           tcu_pce_ov;               // scan signals
input		spc_aclk;
input		spc_bclk;
input           tcu_scan_en;
output          scan_out;


input           lsu_mmu_pmen;
input [7:0]     spc_core_running_status;



input [17:0]    l15_mmu_cpkt;
input           l15_mmu_valid;

// tsbptr requests
input           asi_tsb_ptr_req_valid;
input [2:0]     asi_tsb_ptr_req;
input [1:0]     asi_tsb_ptr_number;
input		asd0_zero_context;
input		asd1_zero_context;


// partition id
input [7:0]     asi_wr_partition_id;
input [2:0]     asi_wr_data;

// tsb prediction mode bits 00 - seq no pred, 01 - burst, 10 - seq with pred, 11 - burst
input [1:0]     asi_hwtw_config_0;
input [1:0]     asi_hwtw_config_1;
input [1:0]     asi_hwtw_config_2;
input [1:0]     asi_hwtw_config_3;
input [1:0]     asi_hwtw_config_4;
input [1:0]     asi_hwtw_config_5;
input [1:0]     asi_hwtw_config_6;
input [1:0]     asi_hwtw_config_7;

//input           mra0_data_38;
//input           mra1_data_38;
//input           mra0_data_77;
//input           mra1_data_77;

input [1:0]     asi_tsb_hwtw_enable_0;    // tg0 
input [1:0]     asi_tsb_hwtw_enable_1;    // tg1 



// *** HTC_DP Interface ***
input           htd_ra2pa_lower_hit_hw4;
input           htd_ra2pa_upper_hit_hw4;
input           htd_razero_hw4;
          

input           htd_range_en_hw4;

input [7:0]     htd_zeroctx_m0;            // zero context indicator


input           htd_zeroctx_hw1;           // ignore context on return data
input           htd_usectx0_hw1;           // ignore context on return data
input           htd_usectx1_hw1;           // ignore context on return data
input           htd_ranotpa_hw1;           
input           htd_ptr_hit0_hw1;             // partial VPN(37:22) of rcvd TTE matches with VPN of request recvd
input           htd_ptr_hit1_hw1;             // partial VPN(47:38) of rcvd TTE matches with VPN of request recvd
input           htd_ptr_hit2_hw1;             // VPN(47) of rcvd TTE matches with VPN[63:48]
input           htd_ctx_hit_hw1;              // CTX of  of rcvd TTE matches with CTX of request recvd
input           htd_tte_ep_hw1;               // EP bit from TTE
input           htd_dmiss_hw1;                // dmiss for the thread whose tte is being returned


input [5:0]     htd_pred0_idx_m0;
input [5:0]     htd_pred1_idx_m0;

input [15:0]    htd_pred0_m0;
input [15:0]    htd_pred1_m0;


input [7:0]      htd_dmiss;                  // Dmiss indicator from htd queue
input [7:0]      htd_sec_ctx;                // Secondary context indicator from htd queue



// *** TLU Interface for ITLB/DTLB Miss ***
input [7:0]   tlu_iht_request;
input [7:0]   tlu_dht_request;


// *** Gasket/L15 Interface ***
input           l15_mmu_grant;

input           asi_mra_req_grant;      

// TLB Miss State Machine & TLB Reg Control State Machine Interface
input [7:0]     tsm_rqv;
input [7:0]     tsm_tsb_miss_hw2;

input [7:0]     trs_rqv;
input [7:0]     trs_null_st;
input [7:0]     trs_waitrr3_st;
input [7:0]     trs_ecc_err;
input [7:0]     trs_ep_err;

// ECC interface
input           mel0_parity_err;
input           mel1_parity_err;


input [2:0]     trs0_err_type;
input [2:0]     trs1_err_type;
input [2:0]     trs2_err_type;
input [2:0]     trs3_err_type;
input [2:0]     trs4_err_type;
input [2:0]     trs5_err_type;
input [2:0]     trs6_err_type;
input [2:0]     trs7_err_type;

input [2:0]     trs0_err_index;
input [2:0]     trs1_err_index;
input [2:0]     trs2_err_index;
input [2:0]     trs3_err_index;
input [2:0]     trs4_err_index;
input [2:0]     trs5_err_index;
input [2:0]     trs6_err_index;
input [2:0]     trs7_err_index;


input           tlu_cerer_hwtwl2;    // record enable bit of L2 errors
input           tlu_cerer_hwtwmu;    // record enable bit for mra uncorrectable


output [7:0]    htc_core_running;
output          htc_m1_clken;
output          htc_hw3_clken;
output          htc_hw4_clken;


output [7:0]    mmu_i_unauth_access; // I-TSB has EP off, tsm goes to NULL
output [7:0]    mmu_i_tsb_miss;      // I-TSB Miss indication going to TLU, tsm goes to NULL
output [7:0]    mmu_d_tsb_miss;      // D-TSB Miss indication going to TLU, tsm goes to NULL
output [7:0]    mmu_reload_done;     //Successful write of TLB registers with correct TTE
                                     //Not asserted if TSB Miss occurs
output          mmu_use_context_0;   // new use_context_0 and 1 bits.
output          mmu_use_context_1;
output          mmu_sec_context;



// *** MMU Reg. Array Interface ***
output [4:0]    htc_mra_addr_in;       // Address for mra read
output [1:0]    htc_mra_rd_en;         // Read TSB Conf/RR,Offset Register

output [7:0]    htc_wr_itlb_data_in;   // Enable for writing to ITLB DATAIN register
output [7:0]    htc_wr_dtlb_data_in;   // Enable for writing to DTLB DATAIN register
output [7:0]    htc_dtlb_clken;
output [7:0]    htc_itlb_clken;


output          htc_zero_ctx_m2;             // ignore context of request recvd, saved in htd queue

output [5:3]    htc_upd_pred_idx_hw2;
output [7:0]    htc_upd_grp;
output [7:0]    htc_upd_grp_x;
output [1:0]    htc_new_pred_bit;



output          htc_wrpred0_hw2;
output          htc_wrpred1_hw2;
output          htc_wrpred2_hw2;
output          htc_wrpred3_hw2;



output [7:0]    htc_tlb_miss_m;



// pkt sent to gkt
output [4:0]    mmu_l15_cpkt;  
output          htc_l15_en;
output          mmu_l15_valid;


// buffer ctl signals
output          htc_wr_q0new_nogrant;           
output          htc_wr_q0new_grant;           
output          htc_wr_q1new;
output          htc_shift_q1_grant;
output          htc_wr_m3new;
output          htc_wr_m3q0;





output    htc_mra_sel_0;             
output    htc_sel_mra_lo;



output [1:0]    htc_conf_index_m2;      // conf_index used to latch tsb config data
output [7:0]    htc_vld_tsbptr_m2;      // valid tsbptr being sent to gkt
output [7:0]    htc_rd_tteq;        // used to mux out the data returned, which is saved in queue in htd


output [7:0]    htc_ra2pahit_hw5;
output [7:0]    htc_ranotpax_hw5;

// index signals to tsm/trs

output [7:0]    htc_cindex_bit0;
output [7:0]    htc_cindex_bit1;
output [7:0]    htc_rrindex_bit0;
output [7:0]    htc_rrindex_bit1;


// interface to htd


output [2:0]    htc_pid0_m0;
output [2:0]    htc_pid1_m0;

output [7:0]    htc_tsbrd_valid_m0;


output [7:0]    htc_thr_valid_hw3;
output [7:0]    htc_thr_prevalid_hw3;
output [7:0]    htc_va_rd_m2_in;
output          htc_ranotpa_hw4;

output [7:0]    htc_data_rcvd_hw1;

output [7:0]    htc_tsb_hit_hw1;
output [7:0]    htc_tsb_done_hw2;
output [7:0]    htc_thr_valid_m1;     // valid req in m1, which has asi_grant and gkt_room_avail
output [7:0]    htc_thr_valid_m0;     // valid req in m0

output [7:0]    htc_hwtw_burst;


output [7:0]    mmu_i_tte_outofrange;
output [7:0]    mmu_d_tte_outofrange;


output [1:0]    rr_ecc_err_type;
output [1:0]    cfg_ecc_err_type;
output [1:0]    l2_ecc_err_type;
output [7:0]    rr_ecc_err_hw5;
output [7:0]    cfg_ecc_err_m3;
output [7:0]    l2_ecc_err_hw1;

output [7:0]    htc_ep_miss_hw1;

output [2:0]    cfg_ecc_err_index;
output [2:0]    rr_ecc_err_index;



output [7:0]    mmu_i_eccerr;
output [7:0]    mmu_d_eccerr;

output [7:0]    mmu_i_l2cerr;
output [7:0]    mmu_d_l2cerr;

output [2:0]    htc_thr0_err_type;
output [2:0]    htc_thr1_err_type;
output [2:0]    htc_thr2_err_type;
output [2:0]    htc_thr3_err_type;
output [2:0]    htc_thr4_err_type;
output [2:0]    htc_thr5_err_type;
output [2:0]    htc_thr6_err_type;
output [2:0]    htc_thr7_err_type;

output [2:0]    htc_thr0_err_index;
output [2:0]    htc_thr1_err_index;
output [2:0]    htc_thr2_err_index;
output [2:0]    htc_thr3_err_index;
output [2:0]    htc_thr4_err_index;
output [2:0]    htc_thr5_err_index;
output [2:0]    htc_thr6_err_index;
output [2:0]    htc_thr7_err_index;

// output pmu signals

output          mmu_pmu_l2ret;
output          mmu_pmu_l2miss;
output          mmu_pmu_dtlb;
output [2:0]    mmu_pmu_tid;

input 		spc_aclk_wmr;		// Warm reset (non)scan
input		wmr_scan_in;

output		wmr_scan_out;		// Warm reset (non)scan





assign htc_hwtw_mode_0[7:0] = {asi_hwtw_config_7[0],asi_hwtw_config_6[0],asi_hwtw_config_5[0],asi_hwtw_config_4[0],
                               asi_hwtw_config_3[0],asi_hwtw_config_2[0],asi_hwtw_config_1[0],asi_hwtw_config_0[0]}; 
assign htc_hwtw_mode_1[7:0] = {asi_hwtw_config_7[1],asi_hwtw_config_6[1],asi_hwtw_config_5[1],asi_hwtw_config_4[1],
                               asi_hwtw_config_3[1],asi_hwtw_config_2[1],asi_hwtw_config_1[1],asi_hwtw_config_0[1]}; 

assign htc_hwtw_burst[7:0] =  htc_hwtw_mode_0[7:0];
assign htc_hwtw_pred[7:0] = ~htc_hwtw_mode_0[7:0] & htc_hwtw_mode_1[7:0];


///////////////////////////////////////////////////
// clock header
///////////////////////////////////////////////////
mmu_htc_ctl_l1clkhdr_ctl_macro clkgen 
  (
   .l2clk(l2clk),
   .l1en (1'b1 ),
   .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
   );

// scan renames
assign pce_ov = tcu_pce_ov;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;
assign se = tcu_scan_en;

// end scan

mmu_htc_ctl_msff_ctl_macro__width_9 pmen_reg  
(
 .scan_in(pmen_reg_scanin),
 .scan_out(pmen_reg_scanout),
 .l1clk	(l1clk),
 .din	({lsu_mmu_pmen,spc_core_running_status[7:0]}),
 .dout	({htc_mmu_pmen,htc_core_running[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
 );


// flop htd_dmiss
mmu_htc_ctl_msff_ctl_macro__width_16 tlb_miss_lat  
(
 .scan_in(tlb_miss_lat_scanin),
 .scan_out(tlb_miss_lat_scanout),
 .l1clk( l1clk ),
 .din  ({htc_tlb_miss_m[7:0], htd_dmiss[7:0]}),
 .dout ({htc_tlb_miss_m0[7:0], htd_dmiss_lat[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
 );


mmu_htc_ctl_msff_ctl_macro__width_2 tlb_cerer_lat  
(
 .scan_in(tlb_cerer_lat_scanin),
 .scan_out(tlb_cerer_lat_scanout),
 .l1clk( l1clk ),
 .din  ({tlu_cerer_hwtwl2,tlu_cerer_hwtwmu}),
 .dout ({hwtwl2_en, hwtwmu_en}),
  .siclk(siclk),
  .soclk(soclk)
 );


// latch the partition id for each thread.
assign pid0_in[2:0] = ({3{asi_wr_partition_id[0]}} & asi_wr_data[2:0]) |
                      ({3{~asi_wr_partition_id[0]}} & pid0[2:0]);

assign pid1_in[2:0] = ({3{asi_wr_partition_id[1]}} & asi_wr_data[2:0]) |
                      ({3{~asi_wr_partition_id[1]}} & pid1[2:0]);

assign pid2_in[2:0] = ({3{asi_wr_partition_id[2]}} & asi_wr_data[2:0]) |
                      ({3{~asi_wr_partition_id[2]}} & pid2[2:0]);

assign pid3_in[2:0] = ({3{asi_wr_partition_id[3]}} & asi_wr_data[2:0]) |
                      ({3{~asi_wr_partition_id[3]}} & pid3[2:0]);

assign pid4_in[2:0] = ({3{asi_wr_partition_id[4]}} & asi_wr_data[2:0]) |
                      ({3{~asi_wr_partition_id[4]}} & pid4[2:0]);

assign pid5_in[2:0] = ({3{asi_wr_partition_id[5]}} & asi_wr_data[2:0]) |
                      ({3{~asi_wr_partition_id[5]}} & pid5[2:0]);

assign pid6_in[2:0] = ({3{asi_wr_partition_id[6]}} & asi_wr_data[2:0]) |
                      ({3{~asi_wr_partition_id[6]}} & pid6[2:0]);

assign pid7_in[2:0] = ({3{asi_wr_partition_id[7]}} & asi_wr_data[2:0]) |
                      ({3{~asi_wr_partition_id[7]}} & pid7[2:0]);

mmu_htc_ctl_msff_ctl_macro__width_3 pid0_lat  (// FS:wmr_protect
 .scan_in(pid0_lat_wmr_scanin),
 .scan_out(pid0_lat_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk( l1clk),
 .din  ({pid0_in[2:0]}),
 .dout ({pid0[2:0]}),
  .soclk(soclk)
 );

mmu_htc_ctl_msff_ctl_macro__width_3 pid1_lat  (// FS:wmr_protect
 .scan_in(pid1_lat_wmr_scanin),
 .scan_out(pid1_lat_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk( l1clk),
 .din  ({pid1_in[2:0]}),
 .dout ({pid1[2:0]}),
  .soclk(soclk)
);

mmu_htc_ctl_msff_ctl_macro__width_3 pid2_lat  (// FS:wmr_protect
 .scan_in(pid2_lat_wmr_scanin),
 .scan_out(pid2_lat_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk( l1clk),
 .din  ({pid2_in[2:0]}),
 .dout ({pid2[2:0]}),
  .soclk(soclk)
 );

mmu_htc_ctl_msff_ctl_macro__width_3 pid3_lat  (// FS:wmr_protect
 .scan_in(pid3_lat_wmr_scanin),
 .scan_out(pid3_lat_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk( l1clk),
 .din  ({pid3_in[2:0]}),
 .dout ({pid3[2:0]}),
  .soclk(soclk)
 );

mmu_htc_ctl_msff_ctl_macro__width_3 pid4_lat  (// FS:wmr_protect
 .scan_in(pid4_lat_wmr_scanin),
 .scan_out(pid4_lat_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk( l1clk),
 .din  ({pid4_in[2:0]}),
 .dout ({pid4[2:0]}),
  .soclk(soclk)
 );

mmu_htc_ctl_msff_ctl_macro__width_3 pid5_lat  (// FS:wmr_protect
 .scan_in(pid5_lat_wmr_scanin),
 .scan_out(pid5_lat_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk( l1clk),
 .din  ({pid5_in[2:0]}),
 .dout ({pid5[2:0]}),
  .soclk(soclk)
 );

mmu_htc_ctl_msff_ctl_macro__width_3 pid6_lat  (// FS:wmr_protect
 .scan_in(pid6_lat_wmr_scanin),
 .scan_out(pid6_lat_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk( l1clk),
 .din  ({pid6_in[2:0]}),
 .dout ({pid6[2:0]}),
  .soclk(soclk)
 );

mmu_htc_ctl_msff_ctl_macro__width_3 pid7_lat  (// FS:wmr_protect
 .scan_in(pid7_lat_wmr_scanin),
 .scan_out(pid7_lat_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk( l1clk),
 .din  ({pid7_in[2:0]}),
 .dout ({pid7[2:0]}),
  .soclk(soclk)
 );
                             

// mra ecc errors
///////////////////////////////////////////////////
// Set the ECC ERROR TYPE
// 110 MRA Correctable
// 101 MRA Uncorrectable
// 001 L2 correctable
// 010 L2 uncorrectable
// 011 L2 Not Data
// latch the first ecc error and hold it.
///////////////////////////////////////////////////
//assign mra0_ecc_err = (med0_cecc & hwtwmc_en) | (med0_uecc & hwtwmu_en);
//assign mra1_ecc_err = (med1_cecc & hwtwmc_en) | (med1_uecc & hwtwmu_en);
//assign mra0_err_type[1:0] = {(med0_cecc & hwtwmc_en),(med0_uecc & hwtwmu_en)};
//assign mra1_err_type[1:0] = {(med1_cecc & hwtwmc_en),(med1_uecc & hwtwmu_en)};



/////////////////////////////////////////////////////////////////////
//
// | Update TTE | Req. Arb. | MRA Access | TSB Ptr Gen. | TTE Req to LSU |
// | Request Q  | Cfg. Rd.  |   Cycle    |              |                |
// |            | to MRA    |            |              |                |
// |            |           |            |              |                |
// |    M       |    M0     |    M1      |      M2      |       M3       |
//
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// TTE Request Queue Controls (M)
/////////////////////////////////////////////////////////////////////
assign htc_tlb_miss_m[7:0] = tlu_iht_request[7:0] | tlu_dht_request[7:0];

// mux out the pid for two thread groups in M0

assign htc_pid0_m0[2:0] = ({3{htc_tlb_miss_m0[0]}} & pid0[2:0]) |
                          ({3{htc_tlb_miss_m0[1]}} & pid1[2:0]) |
                          ({3{htc_tlb_miss_m0[2]}} & pid2[2:0]) |
                          ({3{htc_tlb_miss_m0[3]}} & pid3[2:0]);

assign htc_pid1_m0[2:0] = ({3{htc_tlb_miss_m0[4]}} & pid4[2:0]) |
                          ({3{htc_tlb_miss_m0[5]}} & pid5[2:0]) |
                          ({3{htc_tlb_miss_m0[6]}} & pid6[2:0]) |
                          ({3{htc_tlb_miss_m0[7]}} & pid7[2:0]);


/////////////////////////////////////////////////////////////////////
// Request Arbitration (M0)
// Confg. Reg. Read Req to MRA
/////////////////////////////////////////////////////////////////////
// ARBITRATION logic
// Every cycle, at most one thread is selected for accessing MRA.
// Threads could be accessing MRA for TSB config read on tlb miss, or
// Range register read when tte comes back.

// Threads requesting range register read are (trs_reqv) are given higher priority
// than threads requesting tsb config (tsm_rqv).

// Threads requesting range register read are prioritized statically with thread
// 0 having highest priority and thread 7 having least. There is no issue about
// live lock, because all threads requesting RR would have to be completed before
// a new thread can request a tsb. And a thread cannot request a RR until it has
// gone through the process of reading TSB and fetching TTE from L2.

// Threads requesting TSB config cannot be statically prioritized because it can
// lead to a potential live lock. If all threads are missing in TLB at all times,
// Thread 0 can read TSB, get TTE, read RR, and get another TLB miss, before THR 7
// has had a chance to go out and read its TSB config. So we cannot use static priority
// for TSB config reads.

// TSB config reads will be prioritized by dividing the threads into 2 groups.
// A single favor bit will select alternatingly between the 2 groups.
// Within a group, the threads will be prioritized based on a 4-bit rotating pointer.
// The pointer always points to the thread with highest priority, and it gets updated
// when a thread gets selected. The pointer updates such that the selected thread will
// have the least priority.

assign tsm_sel[0] = (tsm_ptr0[1] & ~tsm_rqv[1] & ~tsm_rqv[2] & ~tsm_rqv[3] & tsm_rqv[0]) |
                    (tsm_ptr0[2] &               ~tsm_rqv[2] & ~tsm_rqv[3] & tsm_rqv[0]) |
                    (tsm_ptr0[3] &                             ~tsm_rqv[3] & tsm_rqv[0]) |
                    (tsm_ptr0[0] &                                           tsm_rqv[0]);

                    

assign tsm_sel[1] = (tsm_ptr0[2] & ~tsm_rqv[2] & ~tsm_rqv[3] & ~tsm_rqv[0] & tsm_rqv[1]) |
                    (tsm_ptr0[3] &               ~tsm_rqv[3] & ~tsm_rqv[0] & tsm_rqv[1]) |
                    (tsm_ptr0[0] &                             ~tsm_rqv[0] & tsm_rqv[1]) |
                    (tsm_ptr0[1] &                                           tsm_rqv[1]);

                    
assign tsm_sel[2] = (tsm_ptr0[3] & ~tsm_rqv[3] & ~tsm_rqv[0] & ~tsm_rqv[1] & tsm_rqv[2]) |
                    (tsm_ptr0[0] &               ~tsm_rqv[0] & ~tsm_rqv[1] & tsm_rqv[2]) |
                    (tsm_ptr0[1] &                             ~tsm_rqv[1] & tsm_rqv[2]) |
                    (tsm_ptr0[2] &                                           tsm_rqv[2]);
                    
assign tsm_sel[3] = (tsm_ptr0[0] & ~tsm_rqv[0] & ~tsm_rqv[1] & ~tsm_rqv[2] & tsm_rqv[3]) |
                    (tsm_ptr0[1] &               ~tsm_rqv[1] & ~tsm_rqv[2] & tsm_rqv[3]) |
                    (tsm_ptr0[2] &                             ~tsm_rqv[2] & tsm_rqv[3]) |
                    (tsm_ptr0[3] &                                           tsm_rqv[3]);


                    
assign tsm_sel[4] = (tsm_ptr1[5] & ~tsm_rqv[5] & ~tsm_rqv[6] & ~tsm_rqv[7] & tsm_rqv[4]) |
                    (tsm_ptr1[6] &               ~tsm_rqv[6] & ~tsm_rqv[7] & tsm_rqv[4]) |
                    (tsm_ptr1[7] &                             ~tsm_rqv[7] & tsm_rqv[4]) |
                    (tsm_ptr1[4] &                                           tsm_rqv[4]);

assign tsm_sel[5] = (tsm_ptr1[6] & ~tsm_rqv[6] & ~tsm_rqv[7] & ~tsm_rqv[4] & tsm_rqv[5]) |
                    (tsm_ptr1[7] &               ~tsm_rqv[7] & ~tsm_rqv[4] & tsm_rqv[5]) |
                    (tsm_ptr1[4] &                             ~tsm_rqv[4] & tsm_rqv[5]) |
                    (tsm_ptr1[5] &                                           tsm_rqv[5]);

assign tsm_sel[6] = (tsm_ptr1[7] & ~tsm_rqv[7] & ~tsm_rqv[4] & ~tsm_rqv[5] & tsm_rqv[6]) |
                    (tsm_ptr1[4] &               ~tsm_rqv[4] & ~tsm_rqv[5] & tsm_rqv[6]) |
                    (tsm_ptr1[5] &                             ~tsm_rqv[5] & tsm_rqv[6]) |
                    (tsm_ptr1[6] &                                           tsm_rqv[6]);
                    
assign tsm_sel[7] = (tsm_ptr1[4] & ~tsm_rqv[4] & ~tsm_rqv[5] & ~tsm_rqv[6] & tsm_rqv[7]) |
                    (tsm_ptr1[5] &               ~tsm_rqv[5] & ~tsm_rqv[6] & tsm_rqv[7]) |
                    (tsm_ptr1[6] &                             ~tsm_rqv[6] & tsm_rqv[7]) |
                    (tsm_ptr1[7] &                                           tsm_rqv[7]);

assign tg0_valid = |(tsm_rqv[3:0]);
assign tg1_valid = |(tsm_rqv[7:4]);

assign sel_tg1 = (favor_tg1 & tg1_valid) | ~tg0_valid;

assign tsm_thrsel_m0[7:0] = sel_tg1? ({tsm_sel[7:4],4'b0000}): ({4'b0000,tsm_sel[3:0]});


assign trs_thrsel_hw2[0] = trs_rqv[0];
assign trs_thrsel_hw2[1] = trs_rqv[1] & ~trs_rqv[0];
assign trs_thrsel_hw2[2] = trs_rqv[2] & ~trs_rqv[1] & ~trs_rqv[0];
assign trs_thrsel_hw2[3] = trs_rqv[3] & ~trs_rqv[2] & ~trs_rqv[1] & ~trs_rqv[0];
assign trs_thrsel_hw2[4] = trs_rqv[4] & ~trs_rqv[3] & ~trs_rqv[2] & ~trs_rqv[1] & ~trs_rqv[0];
assign trs_thrsel_hw2[5] = trs_rqv[5] & ~trs_rqv[4] & ~trs_rqv[3] & ~trs_rqv[2] & ~trs_rqv[1] & ~trs_rqv[0];
assign trs_thrsel_hw2[6] = trs_rqv[6] & ~trs_rqv[5] & ~trs_rqv[4] & ~trs_rqv[3] & ~trs_rqv[2] & ~trs_rqv[1] & ~trs_rqv[0];
assign trs_thrsel_hw2[7] = trs_rqv[7] & ~trs_rqv[6] & ~trs_rqv[5] & ~trs_rqv[4] & ~trs_rqv[3] & ~trs_rqv[2] & ~trs_rqv[1] & ~trs_rqv[0];

assign tsm_thrsel_v = |(tsm_rqv[7:0]) & ~|(trs_rqv[7:0]);
assign trs_thrsel_v = |(trs_rqv[7:0]);

assign tsm_valid_m0[7:0] = tsm_thrsel_m0[7:0] & ({8{tsm_thrsel_v}});
assign trs_valid_hw2[7:0] = trs_thrsel_hw2[7:0] & ({8{trs_thrsel_v}});



//0in bits_on -var {tsm_valid_m0[7:0],trs_valid_hw2[7:0]} -max 1
//0in bits_on -var {tsm_sel[3:0]} -max 1
//0in bits_on -var {tsm_sel[7:4]} -max 1

// update the favor bit based on the thread group selected
// it is possible that none of the thread groups got selected

assign tsm_tg0_selected = |(tsm_valid_m0[3:0]);
assign tsm_tg1_selected = |(tsm_valid_m0[7:4]);

assign favor_tg1_in = (favor_tg1 & ~tsm_tg1_selected) | tsm_tg0_selected;

mmu_htc_ctl_msff_ctl_macro__width_1 favour_bit_reg  (
 .scan_in(favour_bit_reg_scanin),
 .scan_out(favour_bit_reg_scanout),
 .l1clk( l1clk ),
 .din  (favor_tg1_in),
 .dout (favor_tg1),
  .siclk(siclk),
  .soclk(soclk)
);

// update the tg0/tg1 pointers
assign tsm_ptr0_in[3:0] = tsm_tg0_selected ? ({tsm_valid_m0[2:0],tsm_valid_m0[3]}): tsm_ptr0[3:0];
assign tsm_ptr1_in[7:4] = tsm_tg1_selected ? ({tsm_valid_m0[6:4],tsm_valid_m0[7]}): tsm_ptr1[7:4];

assign tsm_ptr0_in_0_ = ~tsm_ptr0_in[0];
assign tsm_ptr1_in_4_ = ~tsm_ptr1_in[4];

mmu_htc_ctl_msff_ctl_macro__width_4 ptr0_reg  (
 .scan_in(ptr0_reg_scanin),
 .scan_out(ptr0_reg_scanout),
 .l1clk( l1clk ),
 .din  ({tsm_ptr0_in[3:1],tsm_ptr0_in_0_}),
 .dout ({tsm_ptr0[3:1],tsm_ptr0_0_}),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_htc_ctl_msff_ctl_macro__width_4 ptr1_reg  (
 .scan_in(ptr1_reg_scanin),
 .scan_out(ptr1_reg_scanout),
 .l1clk( l1clk ),
 .din  ({tsm_ptr1_in[7:5],tsm_ptr1_in_4_}),
 .dout ({tsm_ptr1[7:5],tsm_ptr1_4_}),
  .siclk(siclk),
  .soclk(soclk)
);

assign tsm_ptr0[0] = ~tsm_ptr0_0_;
assign tsm_ptr1[4] = ~tsm_ptr1_4_;


// *************************************************************** //
// Context Value Decode 
// *************************************************************** //
//assign zero_ctx = ~|htd_ctx_sel_m0[12:00];

assign zero_ctx = |(tsm_thrsel_m0[7:0] & htd_zeroctx_m0[7:0]);

//********************************************************************************
// Configuration Register Index
// Increment the index on  every grant, else hold.
//********************************************************************************

//assign incr_cindex0[1:0] =({2{~cindex0[01] & ~cindex0[00]}} & 2'b01) |
//                          ({2{~cindex0[01] &  cindex0[00]}} & 2'b10) |
//                          ({2{ cindex0[01] & ~cindex0[00]}} & 2'b11) |
//                          ({2{ cindex0[01] &  cindex0[00]}} & 2'b00) ;
                                                                                          
//assign next_cindex0[1:0] = ({2{thr_valid_m1[0]}} & incr_cindex0[1:0]) |
//                           ({2{tlb_miss_m0[0]}} & 2'b00) |
//                           ({2{(~tlb_miss_m0[0] & ~thr_valid_m1[0])}} & cindex0[1:0]);

assign incr_cindex_bit0[7:0] = ~htc_cindex_bit0[7:0];
assign incr_cindex_bit1[7:0] = htc_cindex_bit1[7:0] ^ htc_cindex_bit0[7:0];

assign next_cindex_bit0[7:0] = (htc_thr_valid_m1[7:0] & incr_cindex_bit0[7:0]) |
                               (htc_tlb_miss_m0[7:0] & 8'b0) |
                               (~htc_thr_valid_m1[7:0] & ~htc_tlb_miss_m0[7:0] & htc_cindex_bit0[7:0]);

assign next_cindex_bit1[7:0] = (htc_thr_valid_m1[7:0] & incr_cindex_bit1[7:0]) |
                               (htc_tlb_miss_m0[7:0] & 8'b0) |
                               (~htc_thr_valid_m1[7:0] & ~htc_tlb_miss_m0[7:0] & htc_cindex_bit1[7:0]);



mmu_htc_ctl_msff_ctl_macro__width_16 conf_idx_reg  (
 .scan_in(conf_idx_reg_scanin),
 .scan_out(conf_idx_reg_scanout),
 .l1clk(l1clk),
 .din  ({next_cindex_bit0[7:0],next_cindex_bit1[7:0]}),
 .dout ({htc_cindex_bit0[7:0],htc_cindex_bit1[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);


//********************************************************************************
// RealRange Register Index
//********************************************************************************
//assign incr_index[1:0] = ({2{~rrindex[01] & ~rrindex[00]}} & 2'b01) |
//                         ({2{~rrindex[01] &  rrindex[00]}} & 2'b10) |
//                         ({2{ rrindex[01] & ~rrindex[00]}} & 2'b11) |
//                         ({2{ rrindex[01] &  rrindex[00]}} & 2'b00) ;
//
//assign next_rrindex[1:0] = ({2{thr_valid_hw3}} & incr_index[1:0]) |
//                           ({2{null_state}} & 2'b00) |
//                           ({2{(~null_state & ~thr_valid_hw3)}} & rrindex[1:0]);


assign incr_rrindex_bit0[7:0] = ~htc_rrindex_bit0[7:0];
assign incr_rrindex_bit1[7:0] = htc_rrindex_bit1[7:0] ^ htc_rrindex_bit0[7:0];

assign next_rrindex_bit0[7:0] = (htc_thr_valid_hw3[7:0] & incr_rrindex_bit0[7:0]) |
                                (trs_null_st[7:0] & 8'b0) |
                                (~htc_thr_valid_hw3[7:0] & ~trs_null_st[7:0] & htc_rrindex_bit0[7:0]);

assign next_rrindex_bit1[7:0] = (htc_thr_valid_hw3[7:0] & incr_rrindex_bit1[7:0]) |
                                (trs_null_st[7:0] & 8'b0) |
                                (~htc_thr_valid_hw3[7:0] & ~trs_null_st[7:0] & htc_rrindex_bit1[7:0]);



mmu_htc_ctl_msff_ctl_macro__width_16 rr_idx_reg  (
 .scan_in(rr_idx_reg_scanin),
 .scan_out(rr_idx_reg_scanout),
 .l1clk(l1clk),
 .din  ({next_rrindex_bit0[7:0],next_rrindex_bit1[7:0]}),
 .dout ({htc_rrindex_bit0[7:0],htc_rrindex_bit1[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);



//********************************************************************************
// Read Configuration Register (M0)
//********************************************************************************
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

assign conf_index[1:0] = ({next_cindex_bit1[0],next_cindex_bit0[0]} & {2{tsm_thrsel_m0[0]}}) |
                         ({next_cindex_bit1[1],next_cindex_bit0[1]} & {2{tsm_thrsel_m0[1]}}) |
                         ({next_cindex_bit1[2],next_cindex_bit0[2]} & {2{tsm_thrsel_m0[2]}}) |
                         ({next_cindex_bit1[3],next_cindex_bit0[3]} & {2{tsm_thrsel_m0[3]}}) |
                         ({next_cindex_bit1[4],next_cindex_bit0[4]} & {2{tsm_thrsel_m0[4]}}) |
                         ({next_cindex_bit1[5],next_cindex_bit0[5]} & {2{tsm_thrsel_m0[5]}}) |
                         ({next_cindex_bit1[6],next_cindex_bit0[6]} & {2{tsm_thrsel_m0[6]}}) |
                         ({next_cindex_bit1[7],next_cindex_bit0[7]} & {2{tsm_thrsel_m0[7]}}) ;


assign htc_thr_valid_m0[7:0] = (tsm_valid_m0[7:0] & ~htc_tsb_done_hw2[7:0] & ~cfg_done_m1[7:0]);
assign conf_rd_en = |(htc_thr_valid_m0[7:0]);

assign conf_rd_thr_id[0] = tsm_thrsel_m0[1] | tsm_thrsel_m0[3] | tsm_thrsel_m0[5] | tsm_thrsel_m0[7];
assign conf_rd_thr_id[1] = tsm_thrsel_m0[2] | tsm_thrsel_m0[3] | tsm_thrsel_m0[6] | tsm_thrsel_m0[7];
assign conf_rd_thr_id[2] = tsm_thrsel_m0[4] | tsm_thrsel_m0[5] | tsm_thrsel_m0[6] | tsm_thrsel_m0[7];

// conf_addr_in[4:0]
// 4:3 - tid in a TG
// 2:0 - tsb conf reg id
assign conf_addr_in[4:3] = conf_rd_thr_id[1:0];
assign conf_addr_in[2] = 1'b0;
assign conf_addr_in[1] = ~zero_ctx;
assign conf_addr_in[0] = conf_index[1];
// mra_rd_en = 01 for TG0, mra_rd_en=10 for TG1
assign conf_mra_rd_en[1:0] = {conf_rd_thr_id[2],~conf_rd_thr_id[2]};


//0in bits_on -var {conf_rd_en, rr_rd_en} -max 1
assign htc_mra_addr_in[4:0] = (conf_addr_in[4:0] & {5{conf_rd_en}}) |  
                              (rr_addr_in[4:0] & {5{rr_rd_en}});
assign htc_mra_rd_en[1:0] = (conf_mra_rd_en[1:0] & {2{conf_rd_en}}) |  
                            (rr_mra_rd_en[1:0] & {2{rr_rd_en}});

// detect the condition where the thread selected is the same as the one which has tlbmiss
assign thr_valid_miss_lo_m0 = (htc_thr_valid_m0[3:0] == htc_tlb_miss_m0[3:0]) & |(htc_thr_valid_m0[3:0]);
assign thr_valid_miss_hi_m0 = (htc_thr_valid_m0[7:4] == htc_tlb_miss_m0[7:4]) & |(htc_thr_valid_m0[7:4]);



//********************************************************************************
// PROCESS TSBPTR READ REQUEST (M0)
//********************************************************************************
assign tsbrd_valid_m0 = asi_tsb_ptr_req_valid;

// decode tsbptr request
assign htc_tsbrd_valid_m0[0] = ~asi_tsb_ptr_req[2] & ~asi_tsb_ptr_req[1] & ~asi_tsb_ptr_req[0] & tsbrd_valid_m0;
assign htc_tsbrd_valid_m0[1] = ~asi_tsb_ptr_req[2] & ~asi_tsb_ptr_req[1] &  asi_tsb_ptr_req[0] & tsbrd_valid_m0;
assign htc_tsbrd_valid_m0[2] = ~asi_tsb_ptr_req[2] &  asi_tsb_ptr_req[1] & ~asi_tsb_ptr_req[0] & tsbrd_valid_m0;
assign htc_tsbrd_valid_m0[3] = ~asi_tsb_ptr_req[2] &  asi_tsb_ptr_req[1] &  asi_tsb_ptr_req[0] & tsbrd_valid_m0;
assign htc_tsbrd_valid_m0[4] =  asi_tsb_ptr_req[2] & ~asi_tsb_ptr_req[1] & ~asi_tsb_ptr_req[0] & tsbrd_valid_m0;
assign htc_tsbrd_valid_m0[5] =  asi_tsb_ptr_req[2] & ~asi_tsb_ptr_req[1] &  asi_tsb_ptr_req[0] & tsbrd_valid_m0;
assign htc_tsbrd_valid_m0[6] =  asi_tsb_ptr_req[2] &  asi_tsb_ptr_req[1] & ~asi_tsb_ptr_req[0] & tsbrd_valid_m0;
assign htc_tsbrd_valid_m0[7] =  asi_tsb_ptr_req[2] &  asi_tsb_ptr_req[1] &  asi_tsb_ptr_req[0] & tsbrd_valid_m0;


mmu_htc_ctl_msff_ctl_macro__width_6 m1_stg_lat  
(
 .scan_in(m1_stg_lat_scanin),
 .scan_out(m1_stg_lat_scanout),
 .l1clk( l1clk ),
 .din  ({zero_ctx, conf_index[1:0], conf_addr_in[2:0]}),
 .dout ({zero_ctx_m1, conf_index_m1[1:0], conf_addr_m1[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
 );

mmu_htc_ctl_msff_ctl_macro__width_8 conf_prevalid_lat  
(
 .scan_in(conf_prevalid_lat_scanin),
 .scan_out(conf_prevalid_lat_scanout),
 .l1clk		( l1clk ),
 .din  		(htc_thr_valid_m0[7:0]),
 .dout 		(thr_prevalid_m1[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign tsbrd_z_m0 = 
       ( asd0_zero_context & ~asi_tsb_ptr_req[2] & tsbrd_valid_m0) | 
       ( asd1_zero_context &  asi_tsb_ptr_req[2] & tsbrd_valid_m0) ;

assign tsbrd_nz_m0 = 
       (~asd0_zero_context & ~asi_tsb_ptr_req[2] & tsbrd_valid_m0) | 
       (~asd1_zero_context &  asi_tsb_ptr_req[2] & tsbrd_valid_m0) ;

// latch tsbptr read requests
mmu_htc_ctl_msff_ctl_macro__width_11 tsbptr_lat  
(
 .scan_in(tsbptr_lat_scanin),
 .scan_out(tsbptr_lat_scanout),
 .l1clk		( l1clk ),
 .din  		({asi_tsb_ptr_number[0], tsbrd_z_m0, tsbrd_nz_m0, htc_tsbrd_valid_m0[7:0]}),
 .dout 		({tsbrd_tsbptr_m1[0], tsbrd_z_m1, tsbrd_nz_m1, htc_tsbrd_valid_m1[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);


assign asi_tsb_ptr_number_unused =asi_tsb_ptr_number[1];


//********************************************************************************
// LATCH THE PREDICTION ROW READ OUT in mmu_htd_dp (M0)
// ALSO LATCH THE INDEX
//********************************************************************************
mmu_htc_ctl_msff_ctl_macro__width_22 predrow0_lat  
(
 .scan_in(predrow0_lat_scanin),
 .scan_out(predrow0_lat_scanout),
 .l1clk		( l1clk ),
 .din  		({htd_pred0_idx_m0[5:0],htd_pred0_m0[15:0]}),
 .dout 		({htd_pred0_idx_m1[5:0],htd_pred0_m1[15:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_htc_ctl_msff_ctl_macro__width_22 predrow1_lat  
(
 .scan_in(predrow1_lat_scanin),
 .scan_out(predrow1_lat_scanout),
 .l1clk		( l1clk ),
 .din  		({htd_pred1_idx_m0[5:0],htd_pred1_m0[15:0]}),
 .dout 		({htd_pred1_idx_m1[5:0],htd_pred1_m1[15:0]}),
  .siclk(siclk),
  .soclk(soclk)
);


mmu_htc_ctl_msff_ctl_macro__width_8 tlbmiss_lat  
(
 .scan_in(tlbmiss_lat_scanin),
 .scan_out(tlbmiss_lat_scanout),
 .l1clk		( l1clk ),
 .din  		({htc_tlb_miss_m0[7:0]}),
 .dout 		({htc_tlb_miss_m1[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_htc_ctl_msff_ctl_macro__width_2 tlbvalidmiss_lat  
(
 .scan_in(tlbvalidmiss_lat_scanin),
 .scan_out(tlbvalidmiss_lat_scanout),
 .l1clk		( l1clk ),
 .din  		({thr_valid_miss_hi_m0,thr_valid_miss_lo_m0}),
 .dout 		({thr_valid_miss_hi_m1,thr_valid_miss_lo_m1}),
  .siclk(siclk),
  .soclk(soclk)
);

//0in bits_on -var {thr_valid_miss_hi_m1, thr_valid_miss_lo_m1} -max 1



//********************************************************************************
// READ OUT PREDICTION TABLE AND STORE THE INDEX AND PREDICTION HISTORY IN
// A TABLE (M1)
//********************************************************************************
// Read out the TSB prediction table for the two tlb misses,
// and write them to a register

// Logically prediction table has 64 entries, each entry is 2 bits.
// If MSB=1, then predict TSB 1, else predict TSB 0.
// The table is arranged as 4 registers, each 32 bits wide, in htd
// Bits [5:4] of pred_idx select, 1 of 4 registers in htd (htd_pred_m1[31:0]), 
// and bits [3:0] select 2 bits out of the 32 bits.


// thread group 0
assign pred0_bit_m1[1:0] = ({2{~htd_pred0_idx_m1[2] & ~htd_pred0_idx_m1[1] & ~htd_pred0_idx_m1[0]}} & htd_pred0_m1[1:0])   |
                           ({2{~htd_pred0_idx_m1[2] & ~htd_pred0_idx_m1[1] &  htd_pred0_idx_m1[0]}} & htd_pred0_m1[3:2])   |
                           ({2{~htd_pred0_idx_m1[2] &  htd_pred0_idx_m1[1] & ~htd_pred0_idx_m1[0]}} & htd_pred0_m1[5:4])   |
                           ({2{~htd_pred0_idx_m1[2] &  htd_pred0_idx_m1[1] &  htd_pred0_idx_m1[0]}} & htd_pred0_m1[7:6])   |
                           ({2{ htd_pred0_idx_m1[2] & ~htd_pred0_idx_m1[1] & ~htd_pred0_idx_m1[0]}} & htd_pred0_m1[9:8])   |
                           ({2{ htd_pred0_idx_m1[2] & ~htd_pred0_idx_m1[1] &  htd_pred0_idx_m1[0]}} & htd_pred0_m1[11:10]) |
                           ({2{ htd_pred0_idx_m1[2] &  htd_pred0_idx_m1[1] & ~htd_pred0_idx_m1[0]}} & htd_pred0_m1[13:12]) |
                           ({2{ htd_pred0_idx_m1[2] &  htd_pred0_idx_m1[1] &  htd_pred0_idx_m1[0]}} & htd_pred0_m1[15:14]);

//thread group1
assign pred1_bit_m1[1:0] = ({2{~htd_pred1_idx_m1[2] & ~htd_pred1_idx_m1[1] & ~htd_pred1_idx_m1[0]}} & htd_pred1_m1[1:0])   |
                           ({2{~htd_pred1_idx_m1[2] & ~htd_pred1_idx_m1[1] &  htd_pred1_idx_m1[0]}} & htd_pred1_m1[3:2])   |
                           ({2{~htd_pred1_idx_m1[2] &  htd_pred1_idx_m1[1] & ~htd_pred1_idx_m1[0]}} & htd_pred1_m1[5:4])   |
                           ({2{~htd_pred1_idx_m1[2] &  htd_pred1_idx_m1[1] &  htd_pred1_idx_m1[0]}} & htd_pred1_m1[7:6])   |
                           ({2{ htd_pred1_idx_m1[2] & ~htd_pred1_idx_m1[1] & ~htd_pred1_idx_m1[0]}} & htd_pred1_m1[9:8])   |
                           ({2{ htd_pred1_idx_m1[2] & ~htd_pred1_idx_m1[1] &  htd_pred1_idx_m1[0]}} & htd_pred1_m1[11:10]) |
                           ({2{ htd_pred1_idx_m1[2] &  htd_pred1_idx_m1[1] & ~htd_pred1_idx_m1[0]}} & htd_pred1_m1[13:12]) |
                           ({2{ htd_pred1_idx_m1[2] &  htd_pred1_idx_m1[1] &  htd_pred1_idx_m1[0]}} & htd_pred1_m1[15:14]);


// use tlb_miss_m1 to latch the prediction address and prediction bits for the thread whose
// request is being sent out. This will be used to predict the TSB and will be used to update the prediction
// table on a tsb hit.
assign pred_idx0_in[5:0] = ({6{htc_tlb_miss_m1[0]}} & htd_pred0_idx_m1[5:0]) |
                           ({6{~htc_tlb_miss_m1[0]}} & pred_idx0[5:0]);
assign pred_idx1_in[5:0] = ({6{htc_tlb_miss_m1[1]}} & htd_pred0_idx_m1[5:0]) |
                           ({6{~htc_tlb_miss_m1[1]}} & pred_idx1[5:0]);
assign pred_idx2_in[5:0] = ({6{htc_tlb_miss_m1[2]}} & htd_pred0_idx_m1[5:0]) |
                           ({6{~htc_tlb_miss_m1[2]}} & pred_idx2[5:0]);
assign pred_idx3_in[5:0] = ({6{htc_tlb_miss_m1[3]}} & htd_pred0_idx_m1[5:0]) |
                           ({6{~htc_tlb_miss_m1[3]}} & pred_idx3[5:0]);
assign pred_idx4_in[5:0] = ({6{htc_tlb_miss_m1[4]}} & htd_pred1_idx_m1[5:0]) |
                           ({6{~htc_tlb_miss_m1[4]}} & pred_idx4[5:0]);
assign pred_idx5_in[5:0] = ({6{htc_tlb_miss_m1[5]}} & htd_pred1_idx_m1[5:0]) |
                           ({6{~htc_tlb_miss_m1[5]}} & pred_idx5[5:0]);
assign pred_idx6_in[5:0] = ({6{htc_tlb_miss_m1[6]}} & htd_pred1_idx_m1[5:0]) |
                           ({6{~htc_tlb_miss_m1[6]}} & pred_idx6[5:0]);
assign pred_idx7_in[5:0] = ({6{htc_tlb_miss_m1[7]}} & htd_pred1_idx_m1[5:0]) |
                           ({6{~htc_tlb_miss_m1[7]}} & pred_idx7[5:0]);

assign pred_bit0_in[1:0] = ({2{htc_tlb_miss_m1[0]}} & pred0_bit_m1[1:0]) |
                           ({2{~htc_tlb_miss_m1[0]}} & pred_bit0[1:0]);
assign pred_bit1_in[1:0] = ({2{htc_tlb_miss_m1[1]}} & pred0_bit_m1[1:0]) |
                           ({2{~htc_tlb_miss_m1[1]}} & pred_bit1[1:0]);
assign pred_bit2_in[1:0] = ({2{htc_tlb_miss_m1[2]}} & pred0_bit_m1[1:0]) |
                           ({2{~htc_tlb_miss_m1[2]}} & pred_bit2[1:0]);
assign pred_bit3_in[1:0] = ({2{htc_tlb_miss_m1[3]}} & pred0_bit_m1[1:0]) |
                           ({2{~htc_tlb_miss_m1[3]}} & pred_bit3[1:0]);
assign pred_bit4_in[1:0] = ({2{htc_tlb_miss_m1[4]}} & pred1_bit_m1[1:0]) |
                           ({2{~htc_tlb_miss_m1[4]}} & pred_bit4[1:0]);
assign pred_bit5_in[1:0] = ({2{htc_tlb_miss_m1[5]}} & pred1_bit_m1[1:0]) |
                           ({2{~htc_tlb_miss_m1[5]}} & pred_bit5[1:0]);
assign pred_bit6_in[1:0] = ({2{htc_tlb_miss_m1[6]}} & pred1_bit_m1[1:0]) |
                           ({2{~htc_tlb_miss_m1[6]}} & pred_bit6[1:0]);
assign pred_bit7_in[1:0] = ({2{htc_tlb_miss_m1[7]}} & pred1_bit_m1[1:0]) |
                           ({2{~htc_tlb_miss_m1[7]}} & pred_bit7[1:0]);

mmu_htc_ctl_msff_ctl_macro__width_8 pred0_lat 
(
 .scan_in(pred0_lat_scanin),
 .scan_out(pred0_lat_scanout),
 .l1clk( l1clk),
 .din  ({pred_idx0_in[5:0], pred_bit0_in[1:0]}),
 .dout ({pred_idx0[5:0], pred_bit0[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
 );

mmu_htc_ctl_msff_ctl_macro__width_8 pred1_lat 
(
 .scan_in(pred1_lat_scanin),
 .scan_out(pred1_lat_scanout),
 .l1clk( l1clk),
 .din  ({pred_idx1_in[5:0], pred_bit1_in[1:0]}),
 .dout ({pred_idx1[5:0], pred_bit1[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_htc_ctl_msff_ctl_macro__width_8 pred2_lat 
(
 .scan_in(pred2_lat_scanin),
 .scan_out(pred2_lat_scanout),
 .l1clk( l1clk),
 .din  ({pred_idx2_in[5:0], pred_bit2_in[1:0]}),
 .dout ({pred_idx2[5:0], pred_bit2[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
 );

mmu_htc_ctl_msff_ctl_macro__width_8 pred3_lat 
(
 .scan_in(pred3_lat_scanin),
 .scan_out(pred3_lat_scanout),
 .l1clk( l1clk),
 .din  ({pred_idx3_in[5:0], pred_bit3_in[1:0]}),
 .dout ({pred_idx3[5:0], pred_bit3[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
 );

mmu_htc_ctl_msff_ctl_macro__width_8 pred4_lat 
(
 .scan_in(pred4_lat_scanin),
 .scan_out(pred4_lat_scanout),
 .l1clk( l1clk),
 .din  ({pred_idx4_in[5:0], pred_bit4_in[1:0]}),
 .dout ({pred_idx4[5:0], pred_bit4[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
 );

mmu_htc_ctl_msff_ctl_macro__width_8 pred5_lat 
(
 .scan_in(pred5_lat_scanin),
 .scan_out(pred5_lat_scanout),
 .l1clk( l1clk),
 .din  ({pred_idx5_in[5:0], pred_bit5_in[1:0]}),
 .dout ({pred_idx5[5:0], pred_bit5[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
 );

mmu_htc_ctl_msff_ctl_macro__width_8 pred6_lat 
(
 .scan_in(pred6_lat_scanin),
 .scan_out(pred6_lat_scanout),
 .l1clk( l1clk),
 .din  ({pred_idx6_in[5:0], pred_bit6_in[1:0]}),
 .dout ({pred_idx6[5:0], pred_bit6[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
 );

mmu_htc_ctl_msff_ctl_macro__width_8 pred7_lat 
(
 .scan_in(pred7_lat_scanin),
 .scan_out(pred7_lat_scanout),
 .l1clk( l1clk),
 .din  ({pred_idx7_in[5:0], pred_bit7_in[1:0]}),
 .dout ({pred_idx7[5:0], pred_bit7[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
 );
                             

/////////////////////////////////////////////////////////////////////
// MRA Access Cycle (M1)
/////////////////////////////////////////////////////////////////////
assign htc_thr_valid_m1[7:0] =  ({8{asi_mra_req_grant & room_avail_m1}} & thr_prevalid_m1[7:0]);
// cfg_done comes on for 1 cycle after the last cfg is read.
assign cfg_done_m1[7:0] = {8{conf_index_m1[1] & conf_index_m1[0]}} & htc_thr_valid_m1[7:0];

assign cfg_read_tg0_m1 = |(htc_thr_valid_m1[3:0]);
assign cfg_read_tg1_m1 = |(htc_thr_valid_m1[7:4]);
assign htc_valid_m1 = |(htc_thr_valid_m1[7:0]);


assign thr_valid_m2_in[7:0] = htc_thr_valid_m1[7:0] & ~htc_tsb_done_hw2[7:0];


assign tsbrd_valid_m1 = tsbrd_z_m1 | tsbrd_nz_m1;
assign tsbrd_tg0_m1 = ~(|(htc_tsbrd_valid_m1[7:4])) & tsbrd_valid_m1;
assign tsbrd_tg1_m1 =  (|(htc_tsbrd_valid_m1[7:4])) & tsbrd_valid_m1;

//assign htc_va_rd_m2_in[7:0] = thr_valid_m2_in[7:0] | htc_tsbrd_valid_m1[7:0];
assign htc_va_rd_m2_in[7:0] = htc_thr_valid_m1[7:0] | htc_tsbrd_valid_m1[7:0];

assign htc_m1_clken = (|(htc_va_rd_m2_in[7:0])) | ~htc_mmu_pmen;

//0in bits_on -var {cfg_read_tg0_m1, cfg_read_tg1_m1, rr_read_tg0_hw3, rr_read_tg1_hw3, tsbrd_tg0_m1, tsbrd_tg1_m1} -max 1
assign htc_mra_sel[1] = (cfg_read_tg1_m1 | rr_read_tg1_hw3 | tsbrd_tg1_m1 );
assign htc_mra_sel[0] = (cfg_read_tg0_m1 | rr_read_tg0_hw3 | tsbrd_tg0_m1 );


// If prediction is disabled, then
// if conf_index == 00                  then read tsb0 => sel_mra_up
// if conf_index == 01                  then read tsb1 => sel_mra_lo
// if conf_index == 10                  then read tsb2 => sel_mra_up
// if conf_index == 11                  then read tsb3 => sel_mra_lo

// If prediction is enabled, then
// if conf_index == 00 and ~pred_bit[1] then read tsb0 => sel_mra_up
// if conf_index == 00 and  pred_bit[1] then read tsb1 => sel_mra_lo
// if conf_index == 01 and ~pred_bit[1] then read tsb1 => sel_mra_lo
// if conf_index == 01 and  pred_bit[1] then read tsb0 => sel_mra_up
// if conf_index == 10                  then read tsb2 => sel_mra_up
// if conf_index == 11                  then read tsb3 => sel_mra_lo



//0in bits_on -var {conf_sel_mra_lo, conf_sel_mra_up} -max 1

assign pred_en = |(htc_hwtw_pred[7:0] & htc_thr_valid_m1[7:0]);

// read out prediction bits
// If thr_prevalid is same as the one which had a tlbmiss in m0 (thr_valid_miss_lo or thr_valid_miss_hi),
// then use pred0_bit_m1 or pred1_bit_m1, else get the prediction information from latched data (pred_bit7-0)
assign pred_bit_m1[1] = (thr_valid_miss_lo_m1 & pred0_bit_m1[1]) |
                        (thr_valid_miss_hi_m1 & pred1_bit_m1[1]) |
                        (thr_prevalid_m1[0] & ~thr_valid_miss_lo_m1 & pred_bit0[1]) |
                        (thr_prevalid_m1[1] & ~thr_valid_miss_lo_m1 & pred_bit1[1]) |
                        (thr_prevalid_m1[2] & ~thr_valid_miss_lo_m1 & pred_bit2[1]) |
                        (thr_prevalid_m1[3] & ~thr_valid_miss_lo_m1 & pred_bit3[1]) |
                        (thr_prevalid_m1[4] & ~thr_valid_miss_hi_m1 & pred_bit4[1]) |
                        (thr_prevalid_m1[5] & ~thr_valid_miss_hi_m1 & pred_bit5[1]) |
                        (thr_prevalid_m1[6] & ~thr_valid_miss_hi_m1 & pred_bit6[1]) |
                        (thr_prevalid_m1[7] & ~thr_valid_miss_hi_m1 & pred_bit7[1]);


assign conf_sel_mra_lo = ((~pred_en & conf_index_m1[0]) |                
                         (conf_index_m1[1] & conf_index_m1[0]) |
                         (pred_en & ~pred_bit_m1[1] & ~conf_index_m1[1] &  conf_index_m1[0]) |
                         (pred_en &  pred_bit_m1[1] & ~conf_index_m1[1] & ~conf_index_m1[0])) & htc_valid_m1;

assign conf_sel_mra_up = ((~pred_en & ~conf_index_m1[0]) |                
                         (conf_index_m1[1] & ~conf_index_m1[0]) |
                         (pred_en & ~pred_bit_m1[1] & ~conf_index_m1[1] & ~conf_index_m1[0]) |
                         (pred_en &  pred_bit_m1[1] & ~conf_index_m1[1] &  conf_index_m1[0])) & htc_valid_m1;



assign tsbrd_sel_mra_lo =  tsbrd_tsbptr_m1[0] & tsbrd_valid_m1;
assign tsbrd_sel_mra_up =  ~tsbrd_tsbptr_m1[0] & tsbrd_valid_m1;

assign htc_sel_mra_lo = conf_sel_mra_lo | tsbrd_sel_mra_lo;
assign htc_sel_mra_up = conf_sel_mra_up | tsbrd_sel_mra_up;

//0in bits_on -var {conf_sel_mra_lo, conf_sel_mra_up, tsbrd_sel_mra_lo, tsbrd_sel_mra_up} -max 1

// conf_index_m2 should reflect the real tsb ptr being read.
// It is used to  keep track of tsb ptrs being returned out of order.
// it is the function of tsb prediction and conf_index_m1.
assign conf_index_m2_in[1:0] = {2{htc_valid_m1}} & conf_index_m1[1:0];


//asi_tsb_hwtw_en_0[0] : hwtw_en for tg0, tsb0,tsb2
//asi_tsb_hwtw_en_0[1] : hwtw_en for tg0, tsb1,tsb3

assign hwtw_en_tg0 = (htc_sel_mra_lo & asi_tsb_hwtw_enable_0[1]) |
                     (htc_sel_mra_up & asi_tsb_hwtw_enable_0[0]);

assign hwtw_en_tg1 = (htc_sel_mra_lo & asi_tsb_hwtw_enable_1[1]) |
                     (htc_sel_mra_up & asi_tsb_hwtw_enable_1[0]);

//assign mra_data_38 = (htc_mra_sel[0] & mra0_data_38) |
//                     (htc_mra_sel[1] & mra1_data_38);

//assign mra_data_77 = (htc_mra_sel[0] & mra0_data_77) |
//                     (htc_mra_sel[1] & mra1_data_77);

                     
assign hwtw_en_m2_in = (htc_mra_sel[0] & hwtw_en_tg0) |
                       (htc_mra_sel[1] & hwtw_en_tg1);

assign htc_mra_sel_0 = htc_mra_sel[0];

//assign hwtw_en_m2_in = asi_tsb_hwtw_enable;



mmu_htc_ctl_msff_ctl_macro__width_17 m2_stg_lat2  (
 .scan_in(m2_stg_lat2_scanin),
 .scan_out(m2_stg_lat2_scanout),
 .l1clk( l1clk ),
 .din ({hwtw_en_m2_in, cfg_read_tg0_m1, cfg_read_tg1_m1, zero_ctx_m1, conf_index_m2_in[1:0], conf_addr_m1[2:0], thr_valid_m2_in[7:0]}),
 .dout({hwtw_en_m2,    cfg_read_tg0_m2, cfg_read_tg1_m2, zero_ctx_m2, htc_conf_index_m2[1:0], conf_addr_m2[2:0], htc_thr_valid_m2[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);



/////////////////////////////////////////////////////////////////////
// TSB Pointer Generation (M2)
/////////////////////////////////////////////////////////////////////

assign htc_zero_ctx_m2 = zero_ctx_m2;

//assign htc_ignore_ctx_m2 = ~zero_ctx_m2 & (htd_cfg_usc0_m2 | htd_cfg_usc1_m2) ;

// Valid tsbptr exists if 
// => thr_valid_m2
// => no tsb_hit in m2 cycle
// => & hwtw is enable (else we don't need to send the request to gasket)

// cancel tsbptr if tsb_hit_hw2
assign htc_vld_tsbptr_m2[0] = htc_thr_valid_m2[0] & ~htc_tsb_done_hw2[0] & hwtw_en_m2;
assign htc_vld_tsbptr_m2[1] = htc_thr_valid_m2[1] & ~htc_tsb_done_hw2[1] & hwtw_en_m2;
assign htc_vld_tsbptr_m2[2] = htc_thr_valid_m2[2] & ~htc_tsb_done_hw2[2] & hwtw_en_m2;
assign htc_vld_tsbptr_m2[3] = htc_thr_valid_m2[3] & ~htc_tsb_done_hw2[3] & hwtw_en_m2;
assign htc_vld_tsbptr_m2[4] = htc_thr_valid_m2[4] & ~htc_tsb_done_hw2[4] & hwtw_en_m2;
assign htc_vld_tsbptr_m2[5] = htc_thr_valid_m2[5] & ~htc_tsb_done_hw2[5] & hwtw_en_m2;
assign htc_vld_tsbptr_m2[6] = htc_thr_valid_m2[6] & ~htc_tsb_done_hw2[6] & hwtw_en_m2;
assign htc_vld_tsbptr_m2[7] = htc_thr_valid_m2[7] & ~htc_tsb_done_hw2[7] & hwtw_en_m2;

assign vld_tsbptr_thr_id_m2[0] = htc_vld_tsbptr_m2[1] | htc_vld_tsbptr_m2[3] | htc_vld_tsbptr_m2[5] | htc_vld_tsbptr_m2[7] ; 
assign vld_tsbptr_thr_id_m2[1] = htc_vld_tsbptr_m2[2] | htc_vld_tsbptr_m2[3] | htc_vld_tsbptr_m2[6] | htc_vld_tsbptr_m2[7] ; 
assign vld_tsbptr_thr_id_m2[2] = htc_vld_tsbptr_m2[4] | htc_vld_tsbptr_m2[5] | htc_vld_tsbptr_m2[6] | htc_vld_tsbptr_m2[7] ; 

assign vld_tsbptr_rdy_m2 = |(htc_vld_tsbptr_m2[7:0]);


// for ecc_err on MRA read, we need to report the error even if hwtw is not enabled in the tsb.
// 
// Do not enable cfg_ecc_err if tsb_miss has already been signalled.
// This can happen if the last cfg read has hwtw disabled, and all prior cfg reads have completed and
// have resulted in tsb miss. In this case we signal a tsbmiss without waiting for the parity error
// check on the last cfg read.
assign htc_cfg_ecc_err_en_m2[7:0] = htc_thr_valid_m2[7:0] & ~htc_tsb_done_hw2[7:0] & ~tsm_tsb_miss_hw2[7:0];

assign cfg_ecc_err_index_m2[2:0] = conf_addr_m2[2:0];


mmu_htc_ctl_msff_ctl_macro__width_13 m3_stg_lat1  
(
 .scan_in(m3_stg_lat1_scanin),
 .scan_out(m3_stg_lat1_scanout),
 .l1clk( l1clk ),
 .din  ({cfg_read_tg0_m2, cfg_read_tg1_m2, htc_cfg_ecc_err_en_m2[7:0],
         cfg_ecc_err_index_m2[2:0]}),
 .dout ({cfg_read_tg0_m3, cfg_read_tg1_m3, htc_cfg_ecc_err_en_m3[7:0],
         cfg_ecc_err_index[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
 );

assign mel0_parity_err_m3 = mel0_parity_err;
assign mel1_parity_err_m3 = mel1_parity_err;


assign mra0_ecc_err_lat = (mel0_parity_err_m3 & hwtwmu_en);
assign mra1_ecc_err_lat = (mel1_parity_err_m3 & hwtwmu_en);
assign mra0_err_type_lat[1:0] = {(mel0_parity_err_m3 & hwtwmu_en), 1'b0};
assign mra1_err_type_lat[1:0] = {(mel1_parity_err_m3 & hwtwmu_en), 1'b0};

assign cfg_ecc_err_m3[7:0] = {8{((cfg_read_tg0_m3 & mra0_ecc_err_lat) | (cfg_read_tg1_m3 & mra1_ecc_err_lat))}} &
                             htc_cfg_ecc_err_en_m3[7:0] & ~htc_tsb_done_hw2[7:0] & ~tsm_tsb_miss_hw2[7:0];

assign cfg_ecc_err_type[1:0] = ({2{cfg_read_tg0_m3}} & mra0_err_type_lat[1:0]) |
                               ({2{cfg_read_tg1_m3}} & mra1_err_type_lat[1:0]);

/////////////////////////////////////////////////////////////////////
// TTE Req to Gasket (M3)
// tte read request is sent to gasket in M3. This is when the tsbptr is
// available.
// When a request is M0 in cycle 0, a grant for it will not be available
// until late in cycle 4.
// MMU has a two entry FIFO, q0 and q1,  where requests are queued if they cannot be
// sent to gasket.
// Once two requests have been sent to gkt and q0 and q1 are full, no more
// requests can come down the pipe until gkt gives a grant. The cycle after grant,
// a new req can be valid in M1.
/////////////////////////////////////////////////////////////////////
//-------------------------------------------------------------------
//        | 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   |     |
//-------------------------------------------------------------------
// M0     |RQA  |RQB  |RQC  |RQD  |RQE  |RQE  |RQE  |RQE  | RQF | RQG | RQH |
//        |     |     |     |     |     |     |     |     |     |     |     |     |
//------------------------------------------------------------------------------------
// M1     |IN   |RQA  |RQB  |RQC  |RQD  |     |     |     |RQE  | RQF | RQG | RQH |     
//        |     |     |     |     |     |     |     |     |     |     |     |     |
//------------------------------------------------------------------------------------
// M2     |     |     |RQA  |RQB  |RQC  |RQD  |     |     |     |RQE  | RQF | RQG | RQH |
//        |     |     |     |     |     |     |     |     |     |     |     |     |
//------------------------------------------------------------------------------------
// M3     |     |     |     |RQA  |RQB  |RQC  |RQD  |     |     |     | RQE | RQF | RQG | RQH |
//        |     |     |     |     |     |     |     |     |     |     |     |     |
//-----------------------------------------------------------------------------------------------
// mmu_l15|     |     |     |RQA  |RQB  |     |     |     |RQC  |RQD  | RQE | RQF | RQG | RQH |
// _valid |     |     |     |     |     |     |     |     |     |     |     |     |
//-----------------------------------------------------------------------------------------------
// grant  |     |     |     |     |     |     |     | A   | B   | C   | D   | E   |        
//        |     |     |     |     |     |     |     |     |     |     |     |     |
//-----------------------------------------------------------------------------------------------
//        |     |     |     |     |     |     |     |     |     |     |     |     |
//FIFO    |     |     |     |ct =0|ct =1|ct =2|ct =2|ct =2|ct =2|ct =2|ct =2|ct =1|ct =0|
//        |     |     |     |q0=0 |q0=0 |q0=C |q0=C |q0=C |q0=D |q0=E |q0=0 |q0=0 |q0=0 |
//        |     |     |     |q1=0 |q1=0 |q1=0 |q1=D |q1=D |q1=0 |q1=0 |q1=0 |q1=0 |q1=0 |
//-----------------------------------------------------------------------------------------------
// room   |  1  | 1   | 1   | 1   | 1   | 0   | 0   | 0   | 1   | 1   | 1   | 1   | 1
//        |     |     |     |     |     |     |     |     |     |     |     |     |
//-----------------------------------------------------------------------------------------------

//----------------------------------------------------------------------------------------------------
// M0     |RQA  |RQB  |RQC  |RQD  | RQE | RQF | RQG | RQH | RQI | RQI |
//        |     |     |     |     |     |     |     |     |     |     |     |     |
//----------------------------------------------------------------------------------------------------------
// M1     |     |RQA  |RQB  |RQC  |RQD  |RQE  | RQF | RQG | RQH |     | RQI | RQJ |
//        |     |     |     |     |     |     |     |     |     |     |     |     |     |
//----------------------------------------------------------------------------------------------------------
// M2     |     |     |RQA  |RQB  |RQC  |RQD  |RQE  | RQF | RQG | RQH |     | RQI | RQJ |
//        |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
//----------------------------------------------------------------------------------------------------------
// M3     |     |     |     |RQA  |RQB  |RQC  |RQD  |RQE  | RQF | RQG | RQH |     | RQI | RQJ |
//        |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
//----------------------------------------------------------------------------------------------------------
// mmu_l15|     |     |     |RQA  |RQB  |RQC  |RQD  |RQE  | RQF | RQG | RQH |     | RQI | RQJ |
// _valid |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
//----------------------------------------------------------------------------------------------------------
// grant  |     |     |     |     |A    | B   | C   | D   |     | E   | F   | G   | H   |     | I   | J
//        |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
//----------------------------------------------------------------------------------------------------------
//FIFO    |     |     |     | ct=0| ct=1| ct=1| ct=1| ct=1| ct=1| ct=2| ct=2| ct=2| ct=1| ct=1| ct=2|
//        |     |     |     |q0=0 |q0=0 |q0=0 |q0=0 |q0=0 |q0=0 |q0=0 |q0=0 |q0=0 |q0=0 |q0=0 |q0=0 |
//        |     |     |     |q1=0 |q1=0 |q1=0 |q1=0 |q1=0 |q1=0 |q1=0 |q1=0 |q1=0 |q1=0 |q1=0 |q1=0 |
//----------------------------------------------------------------------------------------------------------
// room   |  1  | 1   | 1   | 1   | 1   | 1   | 1   | 1   | 1   | 0   | 1   | 1   | 1   | 1
//        |     |     |     |     |     |     |     |     |     |     |     |     |
//----------------------------------------------------------------------------------------------------------

assign req_m2 = vld_tsbptr_rdy_m2;
assign htc_l15_cpkt_15_13[2:0] = vld_tsbptr_thr_id_m2[2:0];   //tid
assign htc_l15_cpkt_9_8[1:0] = htc_conf_index_m2[1:0];        //tag

/////////////////////////////////////////////////////////////////////
// Tracking GKT buffers
// to be able to send a new request out in the cycle after grant, use
// next_gkt_count.
/////////////////////////////////////////////////////////////////////
assign next_gkt_count[1:0] = ({2{~gkt_grant & ~mmu_l15_valid_int}} & gkt_count[1:0]) |
                             ({2{ gkt_grant &  mmu_l15_valid_int}} & gkt_count[1:0]) |
                             ({2{~gkt_grant &  mmu_l15_valid_int}} & (gkt_count[1:0]+2'b01)) |
                             ({2{ gkt_grant & ~mmu_l15_valid_int}} & (gkt_count[1:0]-2'b01));

mmu_htc_ctl_msff_ctl_macro__width_2 gkt_count_reg  (
 .scan_in(gkt_count_reg_scanin),
 .scan_out(gkt_count_reg_scanout),
 .l1clk( l1clk ),
 .din (next_gkt_count[1:0]),
 .dout(gkt_count[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign gkt_full = next_gkt_count[1];

/////////////////////////////////////////////////////////////////////
// q0 and q1 valids
/////////////////////////////////////////////////////////////////////
assign v0_in = (gkt_full & req_m2 ) |                     //new
               (v0 & ~v1 & gkt_grant & req_m2) |  //new
               (v0 & ~gkt_grant) |                //hold
               (v1 & gkt_grant);                  //shft

assign v1_in = (v0 & req_m2 & ~gkt_grant) |       //new
               (v1 & req_m2) |                            //new
               (v1 & ~gkt_grant);                 //hold

mmu_htc_ctl_msff_ctl_macro__width_2 qv_reg  (
 .scan_in(qv_reg_scanin),
 .scan_out(qv_reg_scanout),
 .l1clk( l1clk ),
 .din ({v0_in, v1_in}),
 .dout({v0,v1}),
  .siclk(siclk),
  .soclk(soclk)
);

assign q0_val = v0;
assign q1_val = v1;

/////////////////////////////////////////////////////////////////////
// q0 and q1 buffer ctl
// optimize to make minimum use of grant
/////////////////////////////////////////////////////////////////////
assign htc_wr_q1new = req_m2;

assign htc_wr_q0new = (~v0 & req_m2) |                           
                      (v0 & ~v1 & gkt_grant & req_m2);
assign htc_wr_q0new_nogrant = (~v0 & req_m2);

assign htc_wr_q0new_grant = (~v0 & req_m2) |                           
                            (v0 & ~v1 & req_m2);

// shift from q1 to q0 if q1 is valid and we get grant.
assign htc_shift_q1 = v1 & gkt_grant;
//assign htc_shift_q1_nogrant = 1'b0;

assign htc_shift_q1_grant = v1;

//0in bits_on -var {htc_wr_q0new_grant, htc_shift_q1_grant} -max 1
//0in bits_on -var {htc_wr_q0new, htc_shift_q1} -max 1


// (htc_wr_q0new | htc_shift_q1) is very late to be used as an enable for q0
// Instead used htc_q0_en which is an early signal but does not get
// use grant
//assign htc_q0_clken = v0 | v1 | req_m2 | ~htc_mmu_pmen;


// implement q0 and q1 for cpkt
assign q1_cpkt_in[4:0] = ({5{htc_wr_q1new}} & {htc_l15_cpkt_15_13[2:0],htc_l15_cpkt_9_8[1:0]}) |
                          ({5{~htc_wr_q1new}} & q1_cpkt[4:0]);

mmu_htc_ctl_msff_ctl_macro__width_5 q1cpkt_reg  (
 .scan_in(q1cpkt_reg_scanin),
 .scan_out(q1cpkt_reg_scanout),
 .l1clk( l1clk ),
 .din (q1_cpkt_in[4:0]),
 .dout(q1_cpkt[4:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign q0_cpkt_in[4:0] = ({5{htc_wr_q0new}} & {htc_l15_cpkt_15_13[2:0],htc_l15_cpkt_9_8[1:0]}) |
                          ({5{htc_shift_q1}} & q1_cpkt[4:0]) |
                          ({5{~htc_wr_q0new & ~htc_shift_q1}} & q0_cpkt[4:0]) ;

mmu_htc_ctl_msff_ctl_macro__width_5 q0cpkt_reg  (
 .scan_in(q0cpkt_reg_scanin),
 .scan_out(q0cpkt_reg_scanout),
 .l1clk( l1clk ),
 .din (q0_cpkt_in[4:0]),
 .dout(q0_cpkt[4:0]),
  .siclk(siclk),
  .soclk(soclk)
);
/////////////////////////////////////////////////////////////////////
// output valid control and output buffer control (m3reg)
/////////////////////////////////////////////////////////////////////
// htc_l15_valid is flopped and sent out as mmu_l15_valid
assign htc_l15_valid = ((req_m2 | q0_val) & ~gkt_full);

// htc_l15_valid is very late to be used as an enable to htd output flop.
// Instead used htc_l15_en which is an early signal but does not get
// turned off if gkt is full
assign htc_l15_en = req_m2 | q0_val;

assign htc_wr_m3new = ~q0_val & req_m2;
assign htc_wr_m3q0 = q0_val;

assign {mmu_l15_cpkt_in_15_13_in[2:0],mmu_l15_cpkt_in_9_8_in[1:0]} = ({5{htc_wr_m3new}} & {htc_l15_cpkt_15_13[2:0],htc_l15_cpkt_9_8[1:0]}) |
                                                                     ({5{htc_wr_m3q0}} & q0_cpkt[4:0]);
mmu_htc_ctl_msff_ctl_macro__width_7 cpkt_reg  (
 .scan_in(cpkt_reg_scanin),
 .scan_out(cpkt_reg_scanout),
 .l1clk( l1clk ),
 .din ({htc_l15_valid, htc_l15_valid, mmu_l15_cpkt_in_15_13_in[2:0],mmu_l15_cpkt_in_9_8_in[1:0]}),
 .dout({mmu_l15_valid, mmu_l15_valid_int, mmu_l15_cpkt[2:0],mmu_l15_cpkt[4:3]}),
  .siclk(siclk),
  .soclk(soclk)
);


// actual mmu pkt format:
//assign mmu_l15_cpkt[25] = mmu_l15_valid;
//assign mmu_l15_cpkt[24:20] = 5'b01000;                    //rqtyp
//assign mmu_l15_cpkt[19] = 1'b1;                           //nc
//assign mmu_l15_cpkt[18:16] = cpuid[2:0];                  //cpuid
//assign mmu_l15_cpkt[15:13] = tid 
//assign mmu_l15_cpkt[12:10] = 3'b000;                      //inv,pf,bis
//assign mmu_l15_cpkt[9:7] =  mmuid
//assign mmu_l15_cpkt[7:0] = 8'b0;                          //size

// since only tid and mmuid need to be sent to the gkt, they are compressed to form a 5 bit mmu pkt
// gkt will form the final mmu pkt


//msff_ctl_macro grant_lat (width=8) 
//(
// .scan_in(grant_lat_scanin),
// .scan_out(grant_lat_scanout),
// .l1clk( l1clk ),
// .din ({grant_del[6:0],l15_mmu_grant}),
// .dout({grant_del[7:0]})
//);

assign gkt_grant = l15_mmu_grant;
//assign gkt_grant = grant_del[5];


/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
// ROOM AVAILABLE SIGNAL
// If room is not available, then the request is killed in M1 stage.
// i.e thr_valid_m1 will not come on.
// Also, cindex will not be incremented.
// room is available for a request in m1 in following cases:
// 1. gkt is not full
// 2. gkt is full, q0 is empty, and there is no request either in m3 or m2
// 3. gkt is full, q1 is empty, and there is no request in m3 and m2
/////////////////////////////////////////////////////////////////////
assign room_avail_m1 = (~gkt_count[1]) | 
                       (~q0_val & (~mmu_l15_valid_int | ~req_m2)) |
                       (~q1_val & ~mmu_l15_valid_int & ~req_m2);

/////////////////////////////////////////////////////////////////////
                        

/////////////////////////////////////////////////////////////////////
// L15 to MMU Interface
/////////////////////////////////////////////////////////////////////
//
/////////////////////////////////////////////////////////////////////
// TRS STATE:   |    NULL      |    VREQ  |    VREQ     |  WAITRR2  |   WAITRR3  |
// |    HW0     |    HW1       |    HW2   |    HW3      |  HW4      |   HW5      | HW6
// |            |              |          |             |           |            |
// | L15 Return | CAM VPN &    | arb      | MRA Access  | RangeCheck|  ra2pahit  | WriteTLB
// |    Data    | Context      | RR rd_en | asi_grant   |           |            |
// |            | TSB hit/Miss |          |             |           |  outofrange| mmu_outofrange
// |            |              |          |             |           |            | mmu_ecc_err
// |            |              | tsb_miss |mmu_tsb_miss |           |            |
// |            |              |          |             |           |            |
//
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// HW0
/////////////////////////////////////////////////////////////////////

assign load_ret_hw0 = l15_mmu_valid & (l15_mmu_cpkt[17:14] == 4'b0101);
assign ret_tid_hw0[7:0] = {(l15_mmu_cpkt[8] &   l15_mmu_cpkt[7] &  l15_mmu_cpkt[6]),
                           (l15_mmu_cpkt[8] &   l15_mmu_cpkt[7] & ~l15_mmu_cpkt[6]),
                           (l15_mmu_cpkt[8] &  ~l15_mmu_cpkt[7] &  l15_mmu_cpkt[6]),
                           (l15_mmu_cpkt[8] &  ~l15_mmu_cpkt[7] & ~l15_mmu_cpkt[6]),
                           (~l15_mmu_cpkt[8] &  l15_mmu_cpkt[7] &  l15_mmu_cpkt[6]),
                           (~l15_mmu_cpkt[8] &  l15_mmu_cpkt[7] & ~l15_mmu_cpkt[6]),
                           (~l15_mmu_cpkt[8] & ~l15_mmu_cpkt[7] &  l15_mmu_cpkt[6]),
                           (~l15_mmu_cpkt[8] & ~l15_mmu_cpkt[7] & ~l15_mmu_cpkt[6])};

// only flag uncorrectable and not data errors. In case of correctable errors,
// just report them asynchronously to tlu.
assign l2_err_hw0 = l15_mmu_cpkt[11] & hwtwl2_en;
assign l2_ecc_err_type_hw0[1:0] = {l15_mmu_cpkt[11],l15_mmu_cpkt[10]};
assign ret_tsbid_hw0[1:0] = l15_mmu_cpkt[4:3];
assign l2miss_hw0 = l15_mmu_cpkt[13];

assign l2_cerr_hw0 = ~l15_mmu_cpkt[11] & l15_mmu_cpkt[10] & hwtwl2_en;


// latch data coming from gkt
mmu_htc_ctl_msff_ctl_macro__width_19 gkt_hw0_lat0  
(
 .scan_in(gkt_hw0_lat0_scanin),
 .scan_out(gkt_hw0_lat0_scanout),
 .l1clk		( l1clk ),
 .din  		({l2_cerr_hw0, l2_err_hw0,l2_ecc_err_type_hw0[1:0],load_ret_hw0,ret_tid_hw0[7:0],ret_tsbid_hw0[1:0],l2miss_hw0, l15_mmu_cpkt[8:6]}),
 .dout 		({l2_cerr_hw1, l2_err_hw1,l2_ecc_err_type[1:0],load_ret_hw1,ret_tid_hw1[7:0],ret_tsbid_hw1[1:0],l2miss_hw1, mmutid_hw1[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
 );


/////////////////////////////////////////////////////////////////////
// TSB Hit/Miss Logic (HW1)
/////////////////////////////////////////////////////////////////////
assign htd_ptr_hit_hw1 = htd_ptr_hit2_hw1 & htd_ptr_hit1_hw1 & htd_ptr_hit0_hw1;
//assign ctx_hit = htd_ignore_ctx_hw1 | htd_ctx_hit_hw1;
assign ctx_hit = (~htd_zeroctx_hw1 & (htd_usectx0_hw1 | htd_usectx1_hw1)) | htd_ctx_hit_hw1;

// an I side tablewalk can hit only if EP bit is set.
assign ep_hit = htd_dmiss_hw1 | htd_tte_ep_hw1;


assign raw_tsb_hit_hw1 = ctx_hit & htd_ptr_hit_hw1 & ep_hit;
assign raw_ep_miss_hw1 = ctx_hit & htd_ptr_hit_hw1 & ~ep_hit;

assign htc_data_rcvd_hw1[7:0] = ret_tid_hw1[7:0] & {8{load_ret_hw1}};

// qualify tsb_hit with no l2err
assign htc_tsb_hit_hw1[7:0] = (htc_data_rcvd_hw1[7:0]  & {8{raw_tsb_hit_hw1 & ~l2_err_hw1}});
assign htc_ep_miss_hw1[7:0] = (htc_data_rcvd_hw1[7:0]  & {8{raw_ep_miss_hw1 & ~l2_err_hw1}});
assign l2_ecc_err_hw1[7:0] = (htc_data_rcvd_hw1[7:0] & {8{l2_err_hw1}});


// tsb processing is done if tsb_hit, or ep_miss, or l2_err

assign tsb_done_hw1[7:0] = (htc_data_rcvd_hw1[7:0] & {8{raw_tsb_hit_hw1 | raw_ep_miss_hw1 | l2_err_hw1}});

assign d_l2_cerr[7:0] = htc_data_rcvd_hw1[7:0] & {8{l2_cerr_hw1}} & htd_dmiss_lat[7:0];
assign i_l2_cerr[7:0] = htc_data_rcvd_hw1[7:0] & {8{l2_cerr_hw1}} & ~htd_dmiss_lat[7:0];


// Form signals for pmu
assign mmu_pmu_l2ret = load_ret_hw1;
assign mmu_pmu_l2miss = l2miss_hw1;
assign mmu_pmu_dtlb = htd_dmiss_hw1;
assign mmu_pmu_tid[2:0] = mmutid_hw1[2:0];


mmu_htc_ctl_msff_ctl_macro__width_16 final_l2_cerr_lat  (
 .scan_in(final_l2_cerr_lat_scanin),
 .scan_out(final_l2_cerr_lat_scanout),
 .l1clk( l1clk ),
 .din ({i_l2_cerr[7:0], d_l2_cerr[7:0]}),
 .dout({mmu_i_l2cerr[7:0], mmu_d_l2cerr[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);


mmu_htc_ctl_msff_ctl_macro__width_8 tsb_hit_lat  (
 .scan_in(tsb_hit_lat_scanin),
 .scan_out(tsb_hit_lat_scanout),
 .l1clk		( l1clk ),
 .din  		({htc_tsb_hit_hw1[7:0]}),
 .dout 		({htc_tsb_hit_hw2[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_htc_ctl_msff_ctl_macro__width_8 ep_miss_lat  (
 .scan_in(ep_miss_lat_scanin),
 .scan_out(ep_miss_lat_scanout),
 .l1clk		( l1clk ),
 .din  		({htc_ep_miss_hw1[7:0]}),
 .dout 		({htc_ep_miss_hw2[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_htc_ctl_msff_ctl_macro__width_8 tsb_done_lat  (
 .scan_in(tsb_done_lat_scanin),
 .scan_out(tsb_done_lat_scanout),
 .l1clk		( l1clk ),
 .din  		({tsb_done_hw1[7:0]}),
 .dout 		({tsb_done_nocfg_hw2[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_htc_ctl_msff_ctl_macro__width_8 cfg_ecc_lat  (
 .scan_in(cfg_ecc_lat_scanin),
 .scan_out(cfg_ecc_lat_scanout),
 .l1clk		( l1clk ),
 .din  		({cfg_ecc_err_m3[7:0]}),
 .dout 		({cfg_ecc_err_m4[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign htc_tsb_done_hw2[7:0] = tsb_done_nocfg_hw2[7:0] | cfg_ecc_err_m4[7:0];


mmu_htc_ctl_msff_ctl_macro__width_2 tsbid_lat  
(
 .scan_in(tsbid_lat_scanin),
 .scan_out(tsbid_lat_scanout),
 .l1clk		( l1clk ),
 .din  		(ret_tsbid_hw1[1:0]),
 .dout 		(ret_tsbid_hw2[1:0]),
  .siclk(siclk),
  .soclk(soclk)
 );


// latch the tsb config values on a tsb hit

assign htd_ranotpa_in[0] = (trs_null_st[0] & htd_ranotpa_hw1) | (~trs_null_st[0] & htd_ranotpa[0]);
assign htd_ranotpa_in[1] = (trs_null_st[1] & htd_ranotpa_hw1) | (~trs_null_st[1] & htd_ranotpa[1]);
assign htd_ranotpa_in[2] = (trs_null_st[2] & htd_ranotpa_hw1) | (~trs_null_st[2] & htd_ranotpa[2]);
assign htd_ranotpa_in[3] = (trs_null_st[3] & htd_ranotpa_hw1) | (~trs_null_st[3] & htd_ranotpa[3]);
assign htd_ranotpa_in[4] = (trs_null_st[4] & htd_ranotpa_hw1) | (~trs_null_st[4] & htd_ranotpa[4]);
assign htd_ranotpa_in[5] = (trs_null_st[5] & htd_ranotpa_hw1) | (~trs_null_st[5] & htd_ranotpa[5]);
assign htd_ranotpa_in[6] = (trs_null_st[6] & htd_ranotpa_hw1) | (~trs_null_st[6] & htd_ranotpa[6]);
assign htd_ranotpa_in[7] = (trs_null_st[7] & htd_ranotpa_hw1) | (~trs_null_st[7] & htd_ranotpa[7]);

assign htd_zeroctx_in[0] = (trs_null_st[0] & htd_zeroctx_hw1) | (~trs_null_st[0] & htd_zeroctx[0]);
assign htd_zeroctx_in[1] = (trs_null_st[1] & htd_zeroctx_hw1) | (~trs_null_st[1] & htd_zeroctx[1]);
assign htd_zeroctx_in[2] = (trs_null_st[2] & htd_zeroctx_hw1) | (~trs_null_st[2] & htd_zeroctx[2]);
assign htd_zeroctx_in[3] = (trs_null_st[3] & htd_zeroctx_hw1) | (~trs_null_st[3] & htd_zeroctx[3]);
assign htd_zeroctx_in[4] = (trs_null_st[4] & htd_zeroctx_hw1) | (~trs_null_st[4] & htd_zeroctx[4]);
assign htd_zeroctx_in[5] = (trs_null_st[5] & htd_zeroctx_hw1) | (~trs_null_st[5] & htd_zeroctx[5]);
assign htd_zeroctx_in[6] = (trs_null_st[6] & htd_zeroctx_hw1) | (~trs_null_st[6] & htd_zeroctx[6]);
assign htd_zeroctx_in[7] = (trs_null_st[7] & htd_zeroctx_hw1) | (~trs_null_st[7] & htd_zeroctx[7]);

assign htd_usectx0_in[0] = (trs_null_st[0] & htd_usectx0_hw1) | (~trs_null_st[0] & htd_usectx0[0]);
assign htd_usectx0_in[1] = (trs_null_st[1] & htd_usectx0_hw1) | (~trs_null_st[1] & htd_usectx0[1]);
assign htd_usectx0_in[2] = (trs_null_st[2] & htd_usectx0_hw1) | (~trs_null_st[2] & htd_usectx0[2]);
assign htd_usectx0_in[3] = (trs_null_st[3] & htd_usectx0_hw1) | (~trs_null_st[3] & htd_usectx0[3]);
assign htd_usectx0_in[4] = (trs_null_st[4] & htd_usectx0_hw1) | (~trs_null_st[4] & htd_usectx0[4]);
assign htd_usectx0_in[5] = (trs_null_st[5] & htd_usectx0_hw1) | (~trs_null_st[5] & htd_usectx0[5]);
assign htd_usectx0_in[6] = (trs_null_st[6] & htd_usectx0_hw1) | (~trs_null_st[6] & htd_usectx0[6]);
assign htd_usectx0_in[7] = (trs_null_st[7] & htd_usectx0_hw1) | (~trs_null_st[7] & htd_usectx0[7]);

assign htd_usectx1_in[0] = (trs_null_st[0] & htd_usectx1_hw1) | (~trs_null_st[0] & htd_usectx1[0]);
assign htd_usectx1_in[1] = (trs_null_st[1] & htd_usectx1_hw1) | (~trs_null_st[1] & htd_usectx1[1]);
assign htd_usectx1_in[2] = (trs_null_st[2] & htd_usectx1_hw1) | (~trs_null_st[2] & htd_usectx1[2]);
assign htd_usectx1_in[3] = (trs_null_st[3] & htd_usectx1_hw1) | (~trs_null_st[3] & htd_usectx1[3]);
assign htd_usectx1_in[4] = (trs_null_st[4] & htd_usectx1_hw1) | (~trs_null_st[4] & htd_usectx1[4]);
assign htd_usectx1_in[5] = (trs_null_st[5] & htd_usectx1_hw1) | (~trs_null_st[5] & htd_usectx1[5]);
assign htd_usectx1_in[6] = (trs_null_st[6] & htd_usectx1_hw1) | (~trs_null_st[6] & htd_usectx1[6]);
assign htd_usectx1_in[7] = (trs_null_st[7] & htd_usectx1_hw1) | (~trs_null_st[7] & htd_usectx1[7]);


mmu_htc_ctl_msff_ctl_macro__width_32 tsb0_lat 
(
 .scan_in(tsb0_lat_scanin),
 .scan_out(tsb0_lat_scanout),
 .l1clk( l1clk),
 .din  ({htd_ranotpa_in[7:0], htd_zeroctx_in[7:0], htd_usectx0_in[7:0], htd_usectx1_in[7:0]}),
 .dout ({htd_ranotpa[7:0],  htd_zeroctx[7:0],  htd_usectx0[7:0],  htd_usectx1[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
 );



//********************************************************************************
// Real Range Register & Physical Offset Register Read (HW2)
//********************************************************************************

assign rr_index[1:0] = ({next_rrindex_bit1[0],next_rrindex_bit0[0]} & {2{trs_thrsel_hw2[0]}}) |
                         ({next_rrindex_bit1[1],next_rrindex_bit0[1]} & {2{trs_thrsel_hw2[1]}}) |
                         ({next_rrindex_bit1[2],next_rrindex_bit0[2]} & {2{trs_thrsel_hw2[2]}}) |
                         ({next_rrindex_bit1[3],next_rrindex_bit0[3]} & {2{trs_thrsel_hw2[3]}}) |
                         ({next_rrindex_bit1[4],next_rrindex_bit0[4]} & {2{trs_thrsel_hw2[4]}}) |
                         ({next_rrindex_bit1[5],next_rrindex_bit0[5]} & {2{trs_thrsel_hw2[5]}}) |
                         ({next_rrindex_bit1[6],next_rrindex_bit0[6]} & {2{trs_thrsel_hw2[6]}}) |
                         ({next_rrindex_bit1[7],next_rrindex_bit0[7]} & {2{trs_thrsel_hw2[7]}}) ;

assign thr_valid_hw2[7:0] = (trs_valid_hw2[7:0] & ~rr_done_hw3[7:0]);
assign rr_rd_en = |(thr_valid_hw2[7:0]);

assign rr_rd_thr_id[0] = trs_thrsel_hw2[1] | trs_thrsel_hw2[3] | trs_thrsel_hw2[5] | trs_thrsel_hw2[7];
assign rr_rd_thr_id[1] = trs_thrsel_hw2[2] | trs_thrsel_hw2[3] | trs_thrsel_hw2[6] | trs_thrsel_hw2[7];
assign rr_rd_thr_id[2] = trs_thrsel_hw2[4] | trs_thrsel_hw2[5] | trs_thrsel_hw2[6] | trs_thrsel_hw2[7];
assign rr_addr_in[4:0] = {rr_rd_thr_id[1:0], 1'b1, rr_index[1:0]};
// mra_rd_en = 01 for TG0, mra_rd_en=10 for TG1
assign rr_mra_rd_en[1:0] = {rr_rd_thr_id[2],~rr_rd_thr_id[2]};


//********************************************************************************
// Update TSB Predciton bits based on tsbhit_hw2 (HW2)
//********************************************************************************

// mux out the index and prediction bits saved for each thread on tsb hit
assign upd_pred_idx[5:0] = ({6{htc_tsb_hit_hw2[0]}} & pred_idx0[5:0]) |
                           ({6{htc_tsb_hit_hw2[1]}} & pred_idx1[5:0]) |
                           ({6{htc_tsb_hit_hw2[2]}} & pred_idx2[5:0]) |
                           ({6{htc_tsb_hit_hw2[3]}} & pred_idx3[5:0]) |
                           ({6{htc_tsb_hit_hw2[4]}} & pred_idx4[5:0]) |
                           ({6{htc_tsb_hit_hw2[5]}} & pred_idx5[5:0]) |
                           ({6{htc_tsb_hit_hw2[6]}} & pred_idx6[5:0]) |
                           ({6{htc_tsb_hit_hw2[7]}} & pred_idx7[5:0]);

assign htc_upd_pred_idx_hw2[5:3] = upd_pred_idx[5:3];


assign upd_pred_bit[1:0] = ({2{htc_tsb_hit_hw2[0]}} & pred_bit0[1:0]) |
                           ({2{htc_tsb_hit_hw2[1]}} & pred_bit1[1:0]) |
                           ({2{htc_tsb_hit_hw2[2]}} & pred_bit2[1:0]) |
                           ({2{htc_tsb_hit_hw2[3]}} & pred_bit3[1:0]) |
                           ({2{htc_tsb_hit_hw2[4]}} & pred_bit4[1:0]) |
                           ({2{htc_tsb_hit_hw2[5]}} & pred_bit5[1:0]) |
                           ({2{htc_tsb_hit_hw2[6]}} & pred_bit6[1:0]) |
                           ({2{htc_tsb_hit_hw2[7]}} & pred_bit7[1:0]);


// determine the config reg corresponding to tsb_hit. The return id is not
// sufficient because in case of prediction, the ID does not identify the
// tsb config reg.

// if (tsbnum[1]) {tsbnum[1:0] = tsbid[1:0]}
// else if (pred_bit[1] == 0) { tsbnum[1:0]  = tsbid[1:0] }
// else if ((pred_bit[1] == 1) && (tsbid[1:0] == 2'b00) {tsbnum[1:0] = 2'b01}
// else if ((pred_bit[1] == 1) && (tsbid[1:0] == 2'b01) {tsbnum[1:0] = 2'b00}

assign ret_tsbnum_hw2[1:0] = ({2{~upd_pred_bit[1] | ret_tsbid_hw2[1]}} & ret_tsbid_hw2[1:0]) |
                             ({2{upd_pred_bit[1] & ~ret_tsbid_hw2[1] & ~ret_tsbid_hw2[0]}} & 2'b01) |
                             ({2{upd_pred_bit[1] & ~ret_tsbid_hw2[1] &  ret_tsbid_hw2[0]}} & 2'b00);


assign inc_pred = (ret_tsbnum_hw2[1:0] == 2'b01) & (upd_pred_bit[1:0] != 2'b11);        // inc pred count if tsb hit on tsbptr1, saturate at 3
assign dec_pred = (ret_tsbnum_hw2[1:0] == 2'b00) & (upd_pred_bit[1:0] != 2'b00);        // dec pred count if tsb hit on tsbptr0, saturate at 0

assign htc_new_pred_bit[1:0] = ({2{inc_pred}} & (upd_pred_bit[1:0] + 2'b01)) |
                           ({2{dec_pred}} & (upd_pred_bit[1:0] - 2'b01)) |
                           ({2{~inc_pred & ~dec_pred}} & (upd_pred_bit[1:0]));

// create the new prediction row
assign htc_upd_grp[0] = ~upd_pred_idx[2] & ~upd_pred_idx[1] & ~upd_pred_idx[0];
assign htc_upd_grp[1] = ~upd_pred_idx[2] & ~upd_pred_idx[1] &  upd_pred_idx[0];
assign htc_upd_grp[2] = ~upd_pred_idx[2] &  upd_pred_idx[1] & ~upd_pred_idx[0];
assign htc_upd_grp[3] = ~upd_pred_idx[2] &  upd_pred_idx[1] &  upd_pred_idx[0];
assign htc_upd_grp[4] =  upd_pred_idx[2] & ~upd_pred_idx[1] & ~upd_pred_idx[0];
assign htc_upd_grp[5] =  upd_pred_idx[2] & ~upd_pred_idx[1] &  upd_pred_idx[0];
assign htc_upd_grp[6] =  upd_pred_idx[2] &  upd_pred_idx[1] & ~upd_pred_idx[0];
assign htc_upd_grp[7] =  upd_pred_idx[2] &  upd_pred_idx[1] &  upd_pred_idx[0];

assign htc_upd_grp_x[7:0] = ~htc_upd_grp[7:0];



assign pred_upd_en = |(htc_tsb_hit_hw2[7:0] & htc_hwtw_pred[7:0]);

assign htc_wrpred0_hw2 = ~upd_pred_idx[5] & ~upd_pred_idx[4] & pred_upd_en;
assign htc_wrpred1_hw2 = ~upd_pred_idx[5] &  upd_pred_idx[4] & pred_upd_en;
assign htc_wrpred2_hw2 =  upd_pred_idx[5] & ~upd_pred_idx[4] & pred_upd_en;
assign htc_wrpred3_hw2 =  upd_pred_idx[5] &  upd_pred_idx[4] & pred_upd_en;



mmu_htc_ctl_msff_ctl_macro__width_3 rr_addr_hw2_lat  
(
 .scan_in(rr_addr_hw2_lat_scanin),
 .scan_out(rr_addr_hw2_lat_scanout),
 .l1clk		( l1clk ),
 .din  		(rr_addr_in[2:0]),
 .dout 		(rr_addr_hw3[2:0]),
  .siclk(siclk),
  .soclk(soclk)
 );

mmu_htc_ctl_msff_ctl_macro__width_2 rr_index_hw2_lat  
(
 .scan_in(rr_index_hw2_lat_scanin),
 .scan_out(rr_index_hw2_lat_scanout),
 .l1clk		( l1clk ),
 .din  		(rr_index[1:0]),
 .dout 		(rr_index_hw3[1:0]),
  .siclk(siclk),
  .soclk(soclk)
 );

mmu_htc_ctl_msff_ctl_macro__width_8 rr_prevalid_lat  
(
 .scan_in(rr_prevalid_lat_scanin),
 .scan_out(rr_prevalid_lat_scanout),
 .l1clk		( l1clk ),
 .din  		(thr_valid_hw2[7:0]),
 .dout 		(htc_thr_prevalid_hw3[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

/////////////////////////////////////////////////////////////////////
// MRA Access Cycle - For RR and Physical Offset(HW3)
/////////////////////////////////////////////////////////////////////
// real range valid
assign htc_thr_valid_hw3[7:0] = ({8{asi_mra_req_grant}} & htc_thr_prevalid_hw3[7:0]);
assign rr_done_hw3[7:0] = {8{rr_index_hw3[1] & rr_index_hw3[0]}} & htc_thr_valid_hw3[7:0];

assign rr_read_tg0_hw3 = |(htc_thr_valid_hw3[3:0]);
assign rr_read_tg1_hw3 = |(htc_thr_valid_hw3[7:4]);
assign htc_hw3_clken = (|(htc_thr_valid_hw3[7:0])) | ~htc_mmu_pmen;


mmu_htc_ctl_msff_ctl_macro__width_5 stg_hw3_lat  (
 .scan_in(stg_hw3_lat_scanin),
 .scan_out(stg_hw3_lat_scanout),
 .l1clk		( l1clk ),
 .din  		({rr_read_tg0_hw3, rr_read_tg1_hw3, rr_addr_hw3[2:0]}),
 .dout 		({rr_read_tg0_hw4, rr_read_tg1_hw4, rr_addr_hw4[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// should be free running
mmu_htc_ctl_msff_ctl_macro__width_8 thr_valid_hw3_lat  (
 .scan_in(thr_valid_hw3_lat_scanin),
 .scan_out(thr_valid_hw3_lat_scanout),
 .l1clk		( l1clk ),
 .din  		({htc_thr_valid_hw3[7:0]}),
 .dout 		({htc_thr_valid_hw4[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

/////////////////////////////////////////////////////////////////////
//  Range Checking & RA --> PA (HW4)
//  Perform RA --> PA for Sun4u format
//  Check if RA is within Real Range for give thread
/////////////////////////////////////////////////////////////////////
// do not generate a ra2pahit if ep_mask=0 for I side twalk
assign ra2pahit_raw = htd_ra2pa_lower_hit_hw4 & htd_ra2pa_upper_hit_hw4 & htd_razero_hw4 & htd_range_en_hw4;

// signal ra2pahit if
// ranotpa is set
// no ecc err on mra read
// allow only one ra2pahit per thread

//0in bits_on -var {ra2pahit_thr_hw4[7:0]} -max 1

assign htc_thr_ra_valid_hw4[7:0] = htc_thr_valid_hw4[7:0] & htd_ranotpa[7:0];


assign ra2pahit_thr_hw4[7:0] = htc_thr_valid_hw4[7:0] & htd_ranotpa[7:0] & {8{ra2pahit_raw}} & 
                               ~rr_ecc_err_hw5[7:0] & ~disable_ra2pahit_st[7:0];

assign htc_ranotpax_hw4[7:0] = (~htd_ranotpa[7:0] & htc_thr_valid_hw4[7:0] & ~disable_ra2pahit_st[7:0] & ~rr_ecc_err_hw5[7:0]);

// disable ra2pahit after the first hit, or eccerr, or ~ranotpa
assign disable_ra2pahit_st_in[7:0] = (ra2pahit_thr_hw4[7:0] | htc_ranotpax_hw4[7:0] | disable_ra2pahit_st[7:0] | rr_ecc_err_hw5[7:0]) & ~trs_null_st[7:0];


assign htc_ranotpa_hw4 = |(htd_ranotpa[7:0] & htc_thr_valid_hw4[7:0]);
assign htc_zeroctx_hw4 = |(htd_zeroctx[7:0] & htc_thr_valid_hw4[7:0]);
assign htc_usectx0_hw4 = |(htd_usectx0[7:0] & htc_thr_valid_hw4[7:0]);
assign htc_usectx1_hw4 = |(htd_usectx1[7:0] & htc_thr_valid_hw4[7:0]);
assign htc_sec_ctx_hw4 = |(htd_sec_ctx[7:0] & htc_thr_valid_hw4[7:0]);
// from prm
// hwtalk ignores use_ctx0 and use_ctx1 if it is a zero context.
// If it is a non-zero context, and use_ctx_0 is 1, hw twalk writes the value of context reg 0 to tlb.
// If it is a non-zero context, and use_ctx_0 is 0, and use_ctx_1 is 1, hw twalk writes the
// value of context reg 1 to tlb.

assign htc_new_use_ctx0_hw4 = ~htc_zeroctx_hw4 & htc_usectx0_hw4;
assign htc_new_use_ctx1_hw4 = ~htc_zeroctx_hw4 & ~htc_usectx0_hw4 & htc_usectx1_hw4;


//assign rr_ecc_err = (rr_read_tg0_hw4 & mra0_ecc_err) |
//                    (rr_read_tg1_hw4 & mra1_ecc_err);

//assign rr_ecc_err_hw4[7:0] = ({8{rr_ecc_err}} & htc_thr_valid_hw4[7:0] & htd_ranotpa[7:0]);
//assign rr_ecc_err_type_hw4[1:0] = ({2{rr_read_tg0_hw4}} & mra0_err_type[1:0]) |
//                              ({2{rr_read_tg1_hw4}} & mra1_err_type[1:0]);

assign rr_ecc_err_index_hw4[2:0] = rr_addr_hw4[2:0];

assign htc_hw4_clken = (|(htc_thr_valid_hw4[7:0])) | ~htc_mmu_pmen;

// create a speculative tlb write signal for power management
// use flopped version of htd_dmiss. 
assign tlb_clken_hw4[7:0]  = ra2pahit_thr_hw4[7:0] | htc_ranotpax_hw4[7:0];
assign htc_dtlb_clken_hw4[7:0] = (tlb_clken_hw4[7:0] & htd_dmiss_lat[7:0]) | {8{~htc_mmu_pmen}};
assign htc_itlb_clken_hw4[7:0] = (tlb_clken_hw4[7:0] & ~htd_dmiss_lat[7:0]) | {8{~htc_mmu_pmen}};

mmu_htc_ctl_msff_ctl_macro__width_16 rr_ranotpax_hw4_lat  (
 .scan_in(rr_ranotpax_hw4_lat_scanin),
 .scan_out(rr_ranotpax_hw4_lat_scanout),
 .l1clk( l1clk ),
 .din  ({htc_ranotpax_hw4[7:0], htc_thr_ra_valid_hw4[7:0]}),
 .dout ({htc_ranotpax_hw5[7:0], htc_thr_ra_valid_hw5[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_htc_ctl_msff_ctl_macro__width_8 ra2pahit_st_lat  (
 .scan_in(ra2pahit_st_lat_scanin),
 .scan_out(ra2pahit_st_lat_scanout),
 .l1clk( l1clk ),
 .din  ({disable_ra2pahit_st_in[7:0]}),
 .dout ({disable_ra2pahit_st[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_htc_ctl_msff_ctl_macro__width_8 ra2pahit_lat  (
 .scan_in(ra2pahit_lat_scanin),
 .scan_out(ra2pahit_lat_scanout),
 .l1clk( l1clk ),
 .din  ({ra2pahit_thr_hw4[7:0]}),
 .dout ({ra2pahit_hw5[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_htc_ctl_msff_ctl_macro__width_8 hw4_stg_lat1  
(
 .scan_in(hw4_stg_lat1_scanin),
 .scan_out(hw4_stg_lat1_scanout),
 .l1clk( l1clk ),
 .din  ({rr_read_tg0_hw4, rr_read_tg1_hw4, rr_ecc_err_index_hw4[2:0], htc_new_use_ctx0_hw4, htc_new_use_ctx1_hw4, htc_sec_ctx_hw4}),
 .dout ({rr_read_tg0_hw5, rr_read_tg1_hw5, rr_ecc_err_index[2:0], mmu_use_context_0, mmu_use_context_1, mmu_sec_context}),
  .siclk(siclk),
  .soclk(soclk)
 );

mmu_htc_ctl_msff_ctl_macro__width_16 hw4_stg_lat2  
(
 .scan_in(hw4_stg_lat2_scanin),
 .scan_out(hw4_stg_lat2_scanout),
 .l1clk( l1clk ),
 .din  ({htc_dtlb_clken_hw4[7:0],htc_itlb_clken_hw4[7:0]}),
 .dout ({htc_dtlb_clken[7:0],htc_itlb_clken[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
 );

//assign rr_ecc_err = (rr_read_tg0_hw4 & mra0_ecc_err) |
//                    (rr_read_tg1_hw4 & mra1_ecc_err);

assign rr_ecc_err_hw5[7:0] = ({8{((rr_read_tg0_hw5 & mra0_ecc_err_lat) | (rr_read_tg1_hw5 & mra1_ecc_err_lat))}} & 
                              htc_thr_ra_valid_hw5[7:0]);
assign rr_ecc_err_type[1:0] = ({2{rr_read_tg0_hw5}} & mra0_err_type_lat[1:0]) |
                              ({2{rr_read_tg1_hw5}} & mra1_err_type_lat[1:0]);

/////////////////////////////////////////////////////////////////////
// => generate tlb write enable (HW5)
// => write into I/D TLB DataIn and Tag Access Register
// => generate out of range signals, ecc err signals
/////////////////////////////////////////////////////////////////////

//0in bits_on -var {tlb_wr_en[7:0]} -max 1

assign htc_ra2pahit_hw5[7:0] = ra2pahit_hw5[7:0] & ~rr_ecc_err_hw5[7:0];

assign tlb_wr_en[7:0] = (htc_ra2pahit_hw5[7:0]) | 
                        (htc_ranotpax_hw5[7:0]);

assign htc_rd_tteq[7:0] = tlb_wr_en[7:0];


assign htc_wr_itlb_data_in[7:0] = ~htd_dmiss_lat[7:0]  & tlb_wr_en[7:0];
assign htc_wr_dtlb_data_in[7:0] =  htd_dmiss_lat[7:0]  & tlb_wr_en[7:0];

assign mmu_reload_done_din[7:0] = tlb_wr_en[7:0];


// Out of range is qualified with ranotpa  and ~ecc_err in trs.

assign i_tte_outofrange[7:0] = trs_waitrr3_st[7:0] & ~ra2pahit_hw5[7:0] & ~rr_ecc_err_hw5[7:0] & ~htd_dmiss_lat[7:0];
assign d_tte_outofrange[7:0] = trs_waitrr3_st[7:0] & ~ra2pahit_hw5[7:0] & ~rr_ecc_err_hw5[7:0] & htd_dmiss_lat[7:0];



assign final_ecc_err_hw5[7:0] = trs_ecc_err[7:0];


assign i_ecc_err[7:0] = final_ecc_err_hw5[7:0] & ~htd_dmiss_lat[7:0];
assign d_ecc_err[7:0] = final_ecc_err_hw5[7:0] &  htd_dmiss_lat[7:0];


// should be free running latch
mmu_htc_ctl_msff_ctl_macro__width_8 stg_hw5_lat  (
 .scan_in(stg_hw5_lat_scanin),
 .scan_out(stg_hw5_lat_scanout),
 .l1clk( l1clk ),
 .din  ({mmu_reload_done_din[7:0]}),
 .dout ({mmu_reload_done[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// should be free running latch
mmu_htc_ctl_msff_ctl_macro__width_16 outofrangemiss_lat  (
 .scan_in(outofrangemiss_lat_scanin),
 .scan_out(outofrangemiss_lat_scanout),
 .l1clk( l1clk ),
 .din ({i_tte_outofrange[7:0], d_tte_outofrange[7:0]}),
 .dout({mmu_i_tte_outofrange[7:0], mmu_d_tte_outofrange[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// should be free running latch
mmu_htc_ctl_msff_ctl_macro__width_16 final_ecc_err_lat  (
 .scan_in(final_ecc_err_lat_scanin),
 .scan_out(final_ecc_err_lat_scanout),
 .l1clk( l1clk ),
 .din ({i_ecc_err[7:0], d_ecc_err[7:0]}),
 .dout({mmu_i_eccerr[7:0], mmu_d_eccerr[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_htc_ctl_msff_ctl_macro__width_24 err_type_lat  (
 .scan_in(err_type_lat_scanin),
 .scan_out(err_type_lat_scanout),
 .l1clk( l1clk),
 .din ({trs0_err_type[2:0],
        trs1_err_type[2:0],
        trs2_err_type[2:0],
        trs3_err_type[2:0],
        trs4_err_type[2:0],
        trs5_err_type[2:0],
        trs6_err_type[2:0],
        trs7_err_type[2:0]}),
 .dout({htc_thr0_err_type[2:0],
        htc_thr1_err_type[2:0],
        htc_thr2_err_type[2:0],
        htc_thr3_err_type[2:0],
        htc_thr4_err_type[2:0],
        htc_thr5_err_type[2:0],
        htc_thr6_err_type[2:0],
        htc_thr7_err_type[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_htc_ctl_msff_ctl_macro__width_24 err_index_lat  (
 .scan_in(err_index_lat_scanin),
 .scan_out(err_index_lat_scanout),
 .l1clk( l1clk),
 .din ({trs0_err_index[2:0],
        trs1_err_index[2:0],
        trs2_err_index[2:0],
        trs3_err_index[2:0],
        trs4_err_index[2:0],
        trs5_err_index[2:0],
        trs6_err_index[2:0],
        trs7_err_index[2:0]}),
 .dout({htc_thr0_err_index[2:0],
        htc_thr1_err_index[2:0],
        htc_thr2_err_index[2:0],
        htc_thr3_err_index[2:0],
        htc_thr4_err_index[2:0],
        htc_thr5_err_index[2:0],
        htc_thr6_err_index[2:0],
        htc_thr7_err_index[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
);
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
// report exception due to ep miss
assign i_unauth_access[7:0] = trs_ep_err[7:0];


                              
///////////////////////////////////////////////////////////////////////
// Signal tsb_miss in hw2
/////////////////////////////////////////////////////////////////////
assign i_tsb_miss[7:0] = tsm_tsb_miss_hw2[7:0] & ~htd_dmiss_lat[7:0] & ~htc_ep_miss_hw2[7:0];
assign d_tsb_miss[7:0] = tsm_tsb_miss_hw2[7:0] &  htd_dmiss_lat[7:0];



mmu_htc_ctl_msff_ctl_macro__width_24 tsbmiss_lat  (
 .scan_in(tsbmiss_lat_scanin),
 .scan_out(tsbmiss_lat_scanout),
 .l1clk( l1clk ),
 .din ({i_unauth_access[7:0], i_tsb_miss[7:0], d_tsb_miss[7:0]}),
 .dout({mmu_i_unauth_access[7:0], mmu_i_tsb_miss[7:0], mmu_d_tsb_miss[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);



assign l15_mmu_cpkt_unused[5:0] = {l15_mmu_cpkt[2:0],l15_mmu_cpkt[5],l15_mmu_cpkt[9],l15_mmu_cpkt[12]};

////////////////////////////////////////////////////////
// SPARE CELLS
////////////////////////////////////////////////////////
mmu_htc_ctl_spare_ctl_macro__num_7 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
////////////////////////////////////////////////////////

supply0 vss;
supply1 vdd;

// fixscan start:
assign pmen_reg_scanin           = scan_in                  ;
assign tlb_miss_lat_scanin       = pmen_reg_scanout         ;
assign tlb_cerer_lat_scanin      = tlb_miss_lat_scanout     ;
assign favour_bit_reg_scanin     = tlb_cerer_lat_scanout    ;
assign ptr0_reg_scanin           = favour_bit_reg_scanout   ;
assign ptr1_reg_scanin           = ptr0_reg_scanout         ;
assign conf_idx_reg_scanin       = ptr1_reg_scanout         ;
assign rr_idx_reg_scanin         = conf_idx_reg_scanout     ;
assign m1_stg_lat_scanin         = rr_idx_reg_scanout       ;
assign conf_prevalid_lat_scanin  = m1_stg_lat_scanout       ;
assign tsbptr_lat_scanin         = conf_prevalid_lat_scanout;
assign predrow0_lat_scanin       = tsbptr_lat_scanout       ;
assign predrow1_lat_scanin       = predrow0_lat_scanout     ;
assign tlbmiss_lat_scanin        = predrow1_lat_scanout     ;
assign tlbvalidmiss_lat_scanin   = tlbmiss_lat_scanout      ;
assign pred0_lat_scanin          = tlbvalidmiss_lat_scanout ;
assign pred1_lat_scanin          = pred0_lat_scanout        ;
assign pred2_lat_scanin          = pred1_lat_scanout        ;
assign pred3_lat_scanin          = pred2_lat_scanout        ;
assign pred4_lat_scanin          = pred3_lat_scanout        ;
assign pred5_lat_scanin          = pred4_lat_scanout        ;
assign pred6_lat_scanin          = pred5_lat_scanout        ;
assign pred7_lat_scanin          = pred6_lat_scanout        ;
assign m2_stg_lat2_scanin        = pred7_lat_scanout        ;
assign m3_stg_lat1_scanin        = m2_stg_lat2_scanout      ;
assign gkt_count_reg_scanin      = m3_stg_lat1_scanout      ;
assign qv_reg_scanin             = gkt_count_reg_scanout    ;
assign q1cpkt_reg_scanin         = qv_reg_scanout           ;
assign q0cpkt_reg_scanin         = q1cpkt_reg_scanout       ;
assign cpkt_reg_scanin           = q0cpkt_reg_scanout       ;
assign gkt_hw0_lat0_scanin       = cpkt_reg_scanout         ;
assign final_l2_cerr_lat_scanin  = gkt_hw0_lat0_scanout     ;
assign tsb_hit_lat_scanin        = final_l2_cerr_lat_scanout;
assign ep_miss_lat_scanin        = tsb_hit_lat_scanout      ;
assign tsb_done_lat_scanin       = ep_miss_lat_scanout      ;
assign cfg_ecc_lat_scanin        = tsb_done_lat_scanout     ;
assign tsbid_lat_scanin          = cfg_ecc_lat_scanout      ;
assign tsb0_lat_scanin           = tsbid_lat_scanout        ;
assign rr_addr_hw2_lat_scanin    = tsb0_lat_scanout         ;
assign rr_index_hw2_lat_scanin   = rr_addr_hw2_lat_scanout  ;
assign rr_prevalid_lat_scanin    = rr_index_hw2_lat_scanout ;
assign stg_hw3_lat_scanin        = rr_prevalid_lat_scanout  ;
assign thr_valid_hw3_lat_scanin  = stg_hw3_lat_scanout      ;
assign rr_ranotpax_hw4_lat_scanin = thr_valid_hw3_lat_scanout;
assign ra2pahit_st_lat_scanin    = rr_ranotpax_hw4_lat_scanout;
assign ra2pahit_lat_scanin       = ra2pahit_st_lat_scanout  ;
assign hw4_stg_lat1_scanin       = ra2pahit_lat_scanout     ;
assign hw4_stg_lat2_scanin       = hw4_stg_lat1_scanout     ;
assign stg_hw5_lat_scanin        = hw4_stg_lat2_scanout     ;
assign outofrangemiss_lat_scanin = stg_hw5_lat_scanout      ;
assign final_ecc_err_lat_scanin  = outofrangemiss_lat_scanout;
assign err_type_lat_scanin       = final_ecc_err_lat_scanout;
assign err_index_lat_scanin      = err_type_lat_scanout     ;
assign tsbmiss_lat_scanin        = err_index_lat_scanout    ;
assign spares_scanin             = tsbmiss_lat_scanout      ;
assign scan_out                  = spares_scanout           ;

assign pid0_lat_wmr_scanin       = wmr_scan_in              ;
assign pid1_lat_wmr_scanin       = pid0_lat_wmr_scanout     ;
assign pid2_lat_wmr_scanin       = pid1_lat_wmr_scanout     ;
assign pid3_lat_wmr_scanin       = pid2_lat_wmr_scanout     ;
assign pid4_lat_wmr_scanin       = pid3_lat_wmr_scanout     ;
assign pid5_lat_wmr_scanin       = pid4_lat_wmr_scanout     ;
assign pid6_lat_wmr_scanin       = pid5_lat_wmr_scanout     ;
assign pid7_lat_wmr_scanin       = pid6_lat_wmr_scanout     ;
assign wmr_scan_out              = pid7_lat_wmr_scanout     ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module mmu_htc_ctl_l1clkhdr_ctl_macro (
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

module mmu_htc_ctl_msff_ctl_macro__width_9 (
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

module mmu_htc_ctl_msff_ctl_macro__width_16 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = din[15:0];






dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mmu_htc_ctl_msff_ctl_macro__width_2 (
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













// any PARAMS parms go into naming of macro

module mmu_htc_ctl_msff_ctl_macro__width_3 (
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













// any PARAMS parms go into naming of macro

module mmu_htc_ctl_msff_ctl_macro__width_1 (
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

module mmu_htc_ctl_msff_ctl_macro__width_4 (
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

module mmu_htc_ctl_msff_ctl_macro__width_6 (
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

module mmu_htc_ctl_msff_ctl_macro__width_8 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0];






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mmu_htc_ctl_msff_ctl_macro__width_11 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [10:0] fdin;
wire [9:0] so;

  input [10:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [10:0] dout;
  output scan_out;
assign fdin[10:0] = din[10:0];






dff #(11)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[10:0]),
.si({scan_in,so[9:0]}),
.so({so[9:0],scan_out}),
.q(dout[10:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mmu_htc_ctl_msff_ctl_macro__width_22 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [21:0] fdin;
wire [20:0] so;

  input [21:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [21:0] dout;
  output scan_out;
assign fdin[21:0] = din[21:0];






dff #(22)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[21:0]),
.si({scan_in,so[20:0]}),
.so({so[20:0],scan_out}),
.q(dout[21:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mmu_htc_ctl_msff_ctl_macro__width_17 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [16:0] fdin;
wire [15:0] so;

  input [16:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [16:0] dout;
  output scan_out;
assign fdin[16:0] = din[16:0];






dff #(17)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[16:0]),
.si({scan_in,so[15:0]}),
.so({so[15:0],scan_out}),
.q(dout[16:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mmu_htc_ctl_msff_ctl_macro__width_13 (
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

module mmu_htc_ctl_msff_ctl_macro__width_5 (
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

module mmu_htc_ctl_msff_ctl_macro__width_7 (
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

module mmu_htc_ctl_msff_ctl_macro__width_19 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [18:0] fdin;
wire [17:0] so;

  input [18:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [18:0] dout;
  output scan_out;
assign fdin[18:0] = din[18:0];






dff #(19)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[18:0]),
.si({scan_in,so[17:0]}),
.so({so[17:0],scan_out}),
.q(dout[18:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mmu_htc_ctl_msff_ctl_macro__width_32 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = din[31:0];






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mmu_htc_ctl_msff_ctl_macro__width_24 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [23:0] fdin;
wire [22:0] so;

  input [23:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [23:0] dout;
  output scan_out;
assign fdin[23:0] = din[23:0];






dff #(24)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[23:0]),
.si({scan_in,so[22:0]}),
.so({so[22:0],scan_out}),
.q(dout[23:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module mmu_htc_ctl_spare_ctl_macro__num_7 (
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
assign scan_out = so_6;



endmodule

