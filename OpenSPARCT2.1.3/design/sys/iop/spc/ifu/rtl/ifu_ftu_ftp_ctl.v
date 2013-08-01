// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_ftu_ftp_ctl.v
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
module ifu_ftu_ftp_ctl (
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  spc_core_running_status, 
  tlu_pstate_am, 
  tlu_flush_ifu, 
  tlu_itlb_bypass, 
  tlu_trap_0_tid, 
  tlu_trap_1_tid, 
  tlu_trap_pc_0_valid, 
  tlu_trap_pc_1_valid, 
  dec_br_taken_e, 
  dec_valid_e, 
  dec_tid0_d, 
  dec_tid1_d, 
  itc_demap_next, 
  mbi_run, 
  mbi_itb_cam_en_pre, 
  mbi_cmpsel, 
  mbi_ict_read_en, 
  mbi_ict_write_en, 
  mbi_icd_read_en, 
  mbi_icd_write_en, 
  mbi_icv_read_en, 
  mbi_icv_write_en, 
  cmu_thr0_data_ready, 
  cmu_thr1_data_ready, 
  cmu_thr2_data_ready, 
  cmu_thr3_data_ready, 
  cmu_thr4_data_ready, 
  cmu_thr5_data_ready, 
  cmu_thr6_data_ready, 
  cmu_thr7_data_ready, 
  tsm_thr0_ignore_by_pass, 
  tsm_thr1_ignore_by_pass, 
  tsm_thr2_ignore_by_pass, 
  tsm_thr3_ignore_by_pass, 
  tsm_thr4_ignore_by_pass, 
  tsm_thr5_ignore_by_pass, 
  tsm_thr6_ignore_by_pass, 
  tsm_thr7_ignore_by_pass, 
  dec_load_flush_w, 
  tsm_thr0_ready_hp_bf_in, 
  tsm_thr1_ready_hp_bf_in, 
  tsm_thr2_ready_hp_bf_in, 
  tsm_thr3_ready_hp_bf_in, 
  tsm_thr4_ready_hp_bf_in, 
  tsm_thr5_ready_hp_bf_in, 
  tsm_thr6_ready_hp_bf_in, 
  tsm_thr7_ready_hp_bf_in, 
  tsm_thr0_fill_rdy0, 
  tsm_thr1_fill_rdy0, 
  tsm_thr2_fill_rdy0, 
  tsm_thr3_fill_rdy0, 
  tsm_thr4_fill_rdy0, 
  tsm_thr5_fill_rdy0, 
  tsm_thr6_fill_rdy0, 
  tsm_thr7_fill_rdy0, 
  cmu_icache_invalidate, 
  cmu_any_un_cacheable, 
  cmu_any_data_ready, 
  ibu_empty, 
  ibu_room_4ormore, 
  agc_by_pass_update_lru_bf, 
  agc_invalidation_req_ff, 
  agc_kill_fetch_cv_c, 
  agc_thr0_micro_flush_unq_c, 
  agc_thr1_micro_flush_unq_c, 
  agc_thr2_micro_flush_unq_c, 
  agc_thr3_micro_flush_unq_c, 
  agc_thr4_micro_flush_unq_c, 
  agc_thr5_micro_flush_unq_c, 
  agc_thr6_micro_flush_unq_c, 
  agc_thr7_micro_flush_unq_c, 
  agc_thr0_sf_valid_f, 
  agc_thr1_sf_valid_f, 
  agc_thr2_sf_valid_f, 
  agc_thr3_sf_valid_f, 
  agc_thr4_sf_valid_f, 
  agc_thr5_sf_valid_f, 
  agc_thr6_sf_valid_f, 
  agc_thr7_sf_valid_f, 
  asi_sel_cntx_0, 
  asi_ic_wr_req, 
  asi_ic_rd_req, 
  asi_tg_wr_req, 
  asi_tg_rd_req, 
  asi_itd_rd_req, 
  asi_itt_rd_req, 
  asi_ith_det_req, 
  asi_tid, 
  agd_address0_m, 
  agd_address1_m, 
  agd_thr0_pc_4_2_f, 
  agd_thr1_pc_4_2_f, 
  agd_thr2_pc_4_2_f, 
  agd_thr3_pc_4_2_f, 
  agd_thr4_pc_4_2_f, 
  agd_thr5_pc_4_2_f, 
  agd_thr6_pc_4_2_f, 
  agd_thr7_pc_4_2_f, 
  ifu_agd_pc_f, 
  asi_addr_bf, 
  lsu_ifu_ftu_pmen, 
  lsu_ic_pmen, 
  lsu_ifu_wr_pid, 
  lsu_ifu_tid_w, 
  lsu_ifu_pid_data, 
  ftp_asi_rd_done, 
  ftp_asi_wr_done, 
  ftp_reset_fill_wait, 
  ftp_ic_rd_req_bf, 
  ftp_ic_wr_ps_en_bf, 
  ftp_ic_wr_req_bf, 
  ftp_tg_rd_req_bf, 
  ftp_tg_wr_req_bf, 
  ftp_iv_rd_req_bf, 
  ftp_itt_rd_req_bf, 
  ftp_itd_rd_req_bf, 
  ftp_itlb_cam_vld_bf, 
  ftp_itlb_cam_vld_f, 
  ftp_ith_det_req_bf, 
  ftp_itlb_probe_req_l, 
  ftp_sel_icv_mbist_addr, 
  ftp_sel_mbist_itb_cycle0, 
  ftp_sel_mbist_itb_cycle1, 
  ftp_sel_mbist_itb_cycle2, 
  ftp_sel_mbist_itb_cycle3, 
  ftp_sel_itlb_tag_cntx0_c, 
  ftp_sel_itlb_tag_cntx1_c, 
  ftp_sel_itlb_data_c, 
  ftp_sel_itlb_pa_c, 
  ftp_asi_mbist_access_bf, 
  ftp_asi_it_rd_done, 
  ftp_asi_ic_rd_done, 
  ftp_asi_ic_wr_done, 
  ftp_asi_tg_rd_done, 
  ftp_asi_tg_wr_done, 
  ftp_asi_tg_wr_req_hold, 
  ftp_thr0_room_is_less_t_3, 
  ftp_thr1_room_is_less_t_3, 
  ftp_thr2_room_is_less_t_3, 
  ftp_thr3_room_is_less_t_3, 
  ftp_thr4_room_is_less_t_3, 
  ftp_thr5_room_is_less_t_3, 
  ftp_thr6_room_is_less_t_3, 
  ftp_thr7_room_is_less_t_3, 
  ftp_thr0_go_to_sf_wait, 
  ftp_thr1_go_to_sf_wait, 
  ftp_thr2_go_to_sf_wait, 
  ftp_thr3_go_to_sf_wait, 
  ftp_thr4_go_to_sf_wait, 
  ftp_thr5_go_to_sf_wait, 
  ftp_thr6_go_to_sf_wait, 
  ftp_thr7_go_to_sf_wait, 
  ftp_thr0_trprdpc_sel_bf, 
  ftp_thr1_trprdpc_sel_bf, 
  ftp_thr2_trprdpc_sel_bf, 
  ftp_thr3_trprdpc_sel_bf, 
  ftp_thr4_trprdpc_sel_bf, 
  ftp_thr5_trprdpc_sel_bf, 
  ftp_thr6_trprdpc_sel_bf, 
  ftp_thr7_trprdpc_sel_bf, 
  ftp_thr0_sel_br_bf, 
  ftp_thr1_sel_br_bf, 
  ftp_thr2_sel_br_bf, 
  ftp_thr3_sel_br_bf, 
  ftp_thr4_sel_br_bf, 
  ftp_thr5_sel_br_bf, 
  ftp_thr6_sel_br_bf, 
  ftp_thr7_sel_br_bf, 
  ftp_icd_quad_0_en_bf, 
  ftp_icd_quad_1_en_bf, 
  ftp_icd_quad_2_en_bf, 
  ftp_icd_quad_3_en_bf, 
  ftp_tg_clk_en, 
  ftp_pc_sel_am, 
  ftp_pc_sel_tag_part1, 
  ftp_pc_sel_tag_part2, 
  ftp_pc_sel_tag_pc_bot, 
  ftp_pc_sel_tag_pc_top, 
  ftp_icaddr_sel_first_mux, 
  ftp_itb_fetch_thr_bf, 
  ftp_new_thr_sel_bf, 
  ftu_curr_fetch_thr_f, 
  ftp_curr_fetch_thr_f, 
  ftp_fetch_thr_q_f, 
  ftp_tid0_e, 
  ftp_tid1_e, 
  ftp_fetch_v_f, 
  ftp_fill_req_q_bf, 
  ftp_mbi_icd_read_en_bf, 
  ftp_mbi_ict_read_en_bf, 
  ftp_ict_data_sel_bf, 
  ftp_any_thr_clken, 
  scan_out, 
  ftp_curr_pid_bf, 
  ftp_thr7_pid_data, 
  ftp_thr6_pid_data, 
  ftp_thr5_pid_data, 
  ftp_thr4_pid_data, 
  ftp_thr3_pid_data, 
  ftp_thr2_pid_data, 
  ftp_thr1_pid_data, 
  ftp_thr0_pid_data);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire l1clk;
wire l1clk_pm1;
wire br_reg_scanin;
wire br_reg_scanout;
wire br0_matches_curr;
wire br1_matches_curr;
wire [1:0] dec_br_taken_m;
wire [1:0] dec_valid_m;
wire br0_matches_curr_f;
wire br1_matches_curr_f;
wire [1:0] br_taken_ff;
wire tlu_flush_ifu_req_scanin;
wire tlu_flush_ifu_req_scanout;
wire [7:0] ftp_tlu_flush_f;
wire br_tid_reg_scanin;
wire br_tid_reg_scanout;
wire [1:0] tid1_m;
wire [1:0] tid0_m;
wire [1:0] tid1_b;
wire [1:0] tid0_b;
wire [7:0] next_tid_dec_b;
wire tid_dec_w_reg_scanin;
wire tid_dec_w_reg_scanout;
wire [7:0] tid_dec_w;
wire ftp_any_thread_ready;
wire [7:0] ready_hp_bf;
wire [7:0] fpick;
wire [7:0] hp_pick;
wire [7:0] ftp_curr_fetch_thr_bf;
wire [7:0] next_ith_det_thr_id;
wire [7:0] ith_det_thr_id;
wire it_rd_req_done_f;
wire tid_bf_reg_scanin;
wire tid_bf_reg_scanout;
wire [7:0] ftp_itb_fetch_thr_dup_bf;
wire [3:0] top_hp_ready;
wire [7:0] enabled_threads;
wire [3:0] bot_hp_ready;
wire top_hp_pickready;
wire bot_hp_pickready;
wire hp_pickready;
wire [3:0] bot_hp_pick;
wire [7:0] bot_lru;
wire [3:0] top_hp_pick;
wire [7:0] top_lru;
wire sel_top_hp;
wire favor_top;
wire [3:0] top_fpick;
wire [3:0] bot_fpick;
wire [7:0] ntop_lru;
wire [7:0] ntop_lru_in;
wire top_lruf_scanin;
wire top_lruf_scanout;
wire [7:0] top_lru_out;
wire [7:0] nbot_lru;
wire [7:0] nbot_lru_in;
wire bot_lruf_scanin;
wire bot_lruf_scanout;
wire [7:0] bot_lru_out;
wire set_favor_top;
wire reset_favor_top;
wire next_favor_top;
wire favor_top_reg_scanin;
wire favor_top_reg_scanout;
wire [7:0] next_curr_fetch_f_bf;
wire curr_fetch_thr_f_reg_scanin;
wire curr_fetch_thr_f_reg_scanout;
wire curr_fetch_thr_c_reg_scanin;
wire curr_fetch_thr_c_reg_scanout;
wire [7:0] ftp_curr_fetch_thr_c;
wire ftp_fetch_v_dup_f;
wire next_ftp_fill_req_q;
wire inv_line_reg_scanin;
wire inv_line_reg_scanout;
wire inv_line_bf;
wire next_fill_req;
wire fill_req_bf_reg_scanin;
wire fill_req_bf_reg_scanout;
wire ftp_fill_req_bf;
wire asi_rd_request;
wire next_rd_is_first;
wire wr_request_pending;
wire rd_request_pending;
wire asi_rd_is_first;
wire rd_is_first_reg_scanin;
wire rd_is_first_reg_scanout;
wire asi_wr_request;
wire next_wr_request_pending;
wire asi_wr_done_in;
wire next_rd_request_pending;
wire wr_request_pending_reg_scanin;
wire wr_request_pending_reg_scanout;
wire asi_rd_ok;
wire asi_wr_ok;
wire next_ic_wr_req;
wire ic_wr_req_ff;
wire ic_wr_req_ff_reg_scanin;
wire ic_wr_req_ff_reg_scanout;
wire next_ic_rd_req;
wire ic_rd_req_ff;
wire ic_rd_req_ff_reg_scanin;
wire ic_rd_req_ff_reg_scanout;
wire next_tg_wr_req;
wire tg_wr_req_ff;
wire tg_wr_req_ff_reg_scanin;
wire tg_wr_req_ff_reg_scanout;
wire next_tg_rd_req;
wire tg_rd_req_ff;
wire tg_rd_req_ff_reg_scanin;
wire tg_rd_req_ff_reg_scanout;
wire next_itt_rd_req;
wire itt_rd_req_ff;
wire reload;
wire reload_last;
wire itt_rd_req_ff_reg_scanin;
wire itt_rd_req_ff_reg_scanout;
wire next_itd_rd_req;
wire itd_rd_req_ff;
wire itd_rd_req_ff_reg_scanin;
wire itd_rd_req_ff_reg_scanout;
wire next_ith_det_req;
wire ith_det_req_ff;
wire ith_det_req_ff_reg_scanin;
wire ith_det_req_ff_reg_scanout;
wire next_itlb_probe_req_l;
wire itlb_probe_l_reg_scanin;
wire itlb_probe_l_reg_scanout;
wire fill_req_bf_q_reg_scanin;
wire fill_req_bf_q_reg_scanout;
wire mbist_in_reg_scanin;
wire mbist_in_reg_scanout;
wire ftp_itb_cam_en_1;
wire mbi_run_bf;
wire mbi_icd_write_en_bf;
wire mbi_ict_write_en_bf;
wire [1:0] mbi_cmpsel_bf;
wire ftp_mbi_icv_read_en_bf;
wire ftp_mbi_icv_write_en_bf;
wire ftp_itb_cam_en_2;
wire ftp_fetch_v_bf;
wire ifu_ic_pmen;
wire ftp_bypass_bf;
wire itlb_cam_vld_reg_scanin;
wire itlb_cam_vld_reg_scanout;
wire itlb_bypass_lat_scanin;
wire itlb_bypass_lat_scanout;
wire [7:0] itlb_bypass;
wire [7:0] pre_bypass_bf;
wire ic_rd_req_done_in;
wire ic_rd_done_f_reg_scanin;
wire ic_rd_done_f_reg_scanout;
wire ic_rd_req_done_f;
wire ic_rd_done_c_reg_scanin;
wire ic_rd_done_c_reg_scanout;
wire ic_rd_req_done_c;
wire ic_rd_done_p_reg_scanin;
wire ic_rd_done_p_reg_scanout;
wire ic_rd_req_done_p;
wire ic_wr_req_done_in;
wire ic_wr_done_f_reg_scanin;
wire ic_wr_done_f_reg_scanout;
wire ic_wr_req_done_f;
wire tg_rd_req_done_in;
wire tg_rd_done_f_reg_scanin;
wire tg_rd_done_f_reg_scanout;
wire tg_rd_req_done_f;
wire tg_rd_done_c_reg_scanin;
wire tg_rd_done_c_reg_scanout;
wire tg_rd_req_done_c;
wire tg_wr_req_done_in;
wire tg_wr_done_f_reg_scanin;
wire tg_wr_done_f_reg_scanout;
wire tg_wr_req_done_f;
wire it_rd_req_done_in;
wire it_rd_done_f_reg_scanin;
wire it_rd_done_f_reg_scanout;
wire it_rd_done_c_reg_scanin;
wire it_rd_done_c_reg_scanout;
wire it_rd_req_done_c;
wire asi_rd_done_in;
wire ftp_asi_it_rd_done_p;
wire asi_rd_done_reg_scanin;
wire asi_rd_done_reg_scanout;
wire asi_wr_done_reg_scanin;
wire asi_wr_done_reg_scanout;
wire asi_it_rd_done_reg_scanin;
wire asi_it_rd_done_reg_scanout;
wire next_sel_mbist_itb_cycle0;
wire next_sel_mbist_itb_cycle1;
wire next_sel_mbist_itb_cycle2;
wire next_sel_mbist_itb_cycle3;
wire next_sel_itlb_tag;
wire itlb_sel_tag_f_reg_scanin;
wire itlb_sel_tag_f_reg_scanout;
wire ftp_sel_itlb_tag_f;
wire next_sel_itlb_data;
wire itlb_sel_data_f_reg_scanin;
wire itlb_sel_data_f_reg_scanout;
wire ftp_sel_itlb_data_f;
wire next_sel_itlb_pa;
wire itlb_sel_pa_f_reg_scanin;
wire itlb_sel_pa_f_reg_scanout;
wire ftp_sel_itlb_pa_f;
wire sel_itlb_tag_cntx0_f;
wire sel_itlb_tag_cntx1_f;
wire itlb_sel_c_reg_scanin;
wire itlb_sel_c_reg_scanout;
wire [3:0] trap_thread_g0;
wire [3:0] trap_thread_g1;
wire thr0_trap_pcaddr_is_valid_bf;
wire thr1_trap_pcaddr_is_valid_bf;
wire thr2_trap_pcaddr_is_valid_bf;
wire thr3_trap_pcaddr_is_valid_bf;
wire thr4_trap_pcaddr_is_valid_bf;
wire thr5_trap_pcaddr_is_valid_bf;
wire thr6_trap_pcaddr_is_valid_bf;
wire thr7_trap_pcaddr_is_valid_bf;
wire [7:0] load_flush_w;
wire thr0_red_no_br_bf;
wire thr1_red_no_br_bf;
wire thr2_red_no_br_bf;
wire thr3_red_no_br_bf;
wire thr4_red_no_br_bf;
wire thr5_red_no_br_bf;
wire thr6_red_no_br_bf;
wire thr7_red_no_br_bf;
wire thrx_redirect_reg_scanin;
wire thrx_redirect_reg_scanout;
wire thr7_redirect_part_bf;
wire thr6_redirect_part_bf;
wire thr5_redirect_part_bf;
wire thr4_redirect_part_bf;
wire thr3_redirect_part_bf;
wire thr2_redirect_part_bf;
wire thr1_redirect_part_bf;
wire thr0_redirect_part_bf;
wire thr0_redirect_bf;
wire thr0_br_taken_ff;
wire thr1_redirect_bf;
wire thr1_br_taken_ff;
wire thr2_redirect_bf;
wire thr2_br_taken_ff;
wire thr3_redirect_bf;
wire thr3_br_taken_ff;
wire thr4_redirect_bf;
wire thr4_br_taken_ff;
wire thr5_redirect_bf;
wire thr5_br_taken_ff;
wire thr6_redirect_bf;
wire thr6_br_taken_ff;
wire thr7_redirect_bf;
wire thr7_br_taken_ff;
wire kill_fetch_fv_bf;
wire next_fetch_fv_unq_bf;
wire fetch_v_f_reg_scanin;
wire fetch_v_f_reg_scanout;
wire ftp_fetch_v_unq_f;
wire fetch_v_f_dup_reg_scanin;
wire fetch_v_f_dup_reg_scanout;
wire ftp_fetch_v_unq_dup_f;
wire br_redirect_disqual;
wire br_redirect_dup_disqual;
wire next_fetch_v_c_f;
wire fetch_v_c_reg_scanin;
wire fetch_v_c_reg_scanout;
wire ftp_fetch_v_c_unq;
wire ftp_fetch_v_c;
wire [7:0] next_enabled_thread;
wire enabled_thr_reg_scanin;
wire enabled_thr_reg_scanout;
wire ifu_ftu_pmen;
wire [7:0] br_room_reset;
wire ftp_thr0_fetch_v_wo_br_bf;
wire thr0_by_pass_2_cycles_at_c;
wire ftp_thr1_fetch_v_wo_br_bf;
wire thr1_by_pass_2_cycles_at_c;
wire ftp_thr2_fetch_v_wo_br_bf;
wire thr2_by_pass_2_cycles_at_c;
wire ftp_thr3_fetch_v_wo_br_bf;
wire thr3_by_pass_2_cycles_at_c;
wire ftp_thr4_fetch_v_wo_br_bf;
wire thr4_by_pass_2_cycles_at_c;
wire ftp_thr5_fetch_v_wo_br_bf;
wire thr5_by_pass_2_cycles_at_c;
wire ftp_thr6_fetch_v_wo_br_bf;
wire thr6_by_pass_2_cycles_at_c;
wire ftp_thr7_fetch_v_wo_br_bf;
wire thr7_by_pass_2_cycles_at_c;
wire ftp_thr0_fetch_v_f;
wire thr0_by_pass_next_cycle_at_c;
wire ftp_thr1_fetch_v_f;
wire thr1_by_pass_next_cycle_at_c;
wire ftp_thr2_fetch_v_f;
wire thr2_by_pass_next_cycle_at_c;
wire ftp_thr3_fetch_v_f;
wire thr3_by_pass_next_cycle_at_c;
wire ftp_thr4_fetch_v_f;
wire thr4_by_pass_next_cycle_at_c;
wire ftp_thr5_fetch_v_f;
wire thr5_by_pass_next_cycle_at_c;
wire ftp_thr6_fetch_v_f;
wire thr6_by_pass_next_cycle_at_c;
wire ftp_thr7_fetch_v_f;
wire thr7_by_pass_next_cycle_at_c;
wire ftp_thr0_fetch_v_c;
wire thr0_by_pass_is_at_c;
wire ftp_thr1_fetch_v_c;
wire thr1_by_pass_is_at_c;
wire ftp_thr2_fetch_v_c;
wire thr2_by_pass_is_at_c;
wire ftp_thr3_fetch_v_c;
wire thr3_by_pass_is_at_c;
wire ftp_thr4_fetch_v_c;
wire thr4_by_pass_is_at_c;
wire ftp_thr5_fetch_v_c;
wire thr5_by_pass_is_at_c;
wire ftp_thr6_fetch_v_c;
wire thr6_by_pass_is_at_c;
wire ftp_thr7_fetch_v_c;
wire thr7_by_pass_is_at_c;
wire thr0_is_empty_c;
wire thr1_is_empty_c;
wire thr2_is_empty_c;
wire thr3_is_empty_c;
wire thr4_is_empty_c;
wire thr5_is_empty_c;
wire thr6_is_empty_c;
wire thr7_is_empty_c;
wire thr0_room_4ormore;
wire thr1_room_4ormore;
wire thr2_room_4ormore;
wire thr3_room_4ormore;
wire thr4_room_4ormore;
wire thr5_room_4ormore;
wire thr6_room_4ormore;
wire thr7_room_4ormore;
wire [7:0] ready_hp_in;
wire tsm_thr0_ready_hp_bf;
wire tsm_thr1_ready_hp_bf;
wire tsm_thr2_ready_hp_bf;
wire tsm_thr3_ready_hp_bf;
wire tsm_thr4_ready_hp_bf;
wire tsm_thr5_ready_hp_bf;
wire tsm_thr6_ready_hp_bf;
wire tsm_thr7_ready_hp_bf;
wire [7:0] ftp_unused;
wire ready_fp_reg_scanin;
wire ready_fp_reg_scanout;
wire [7:0] next_by_pass_sel_bbf;
wire cmu_fill_byp_thread_reg_scanin;
wire cmu_fill_byp_thread_reg_scanout;
wire [7:0] by_pass_sel_bf;
wire by_pass_sel_f_reg_scanin;
wire by_pass_sel_f_reg_scanout;
wire [7:0] by_pass_sel_f;
wire by_pass_sel_c_reg_scanin;
wire by_pass_sel_c_reg_scanout;
wire [7:0] by_pass_sel_c;
wire thr0_kill_by_pass_bbf;
wire thr1_kill_by_pass_bbf;
wire thr2_kill_by_pass_bbf;
wire thr3_kill_by_pass_bbf;
wire thr4_kill_by_pass_bbf;
wire thr5_kill_by_pass_bbf;
wire thr6_kill_by_pass_bbf;
wire thr7_kill_by_pass_bbf;
wire byp_valid_in;
wire byp_valid_reg_scanin;
wire byp_valid_reg_scanout;
wire ftp_byp_valid;
wire thrx_kill_by_pass_reg_scanin;
wire thrx_kill_by_pass_reg_scanout;
wire thr7_kill_by_pass_bf;
wire thr6_kill_by_pass_bf;
wire thr5_kill_by_pass_bf;
wire thr4_kill_by_pass_bf;
wire thr3_kill_by_pass_bf;
wire thr2_kill_by_pass_bf;
wire thr1_kill_by_pass_bf;
wire thr0_kill_by_pass_bf;
wire kill2_by_pass_bf;
wire bypass_thread_killed;
wire by_pass_valid_bf;
wire prev_by_pass_at_cycle_1;
wire cycle_2_by_pass_ok_f;
wire cycle_3_by_pass_ok_c;
wire prev_by_pass_at_cycle_2;
wire cycle_3_by_pass_ok_f;
wire cycle_2_by_pass_ok_bf;
wire cycle_3_by_pass_ok_bf;
wire cycle_2_by_pass_f_reg_scanin;
wire cycle_2_by_pass_f_reg_scanout;
wire cycle_3_by_pass_f_reg_scanin;
wire cycle_3_by_pass_f_reg_scanout;
wire cycle_3_by_pass_c_reg_scanin;
wire cycle_3_by_pass_c_reg_scanout;
wire by_pass_v_f_reg_scanin;
wire by_pass_v_f_reg_scanout;
wire by_pass_valid_unq_f;
wire by_pass_valid_f;
wire bypass_thread_redirected_p_f;
wire bypass_thread_redirected_f;
wire next_by_pass_c_valid;
wire by_pass_v_c_reg_scanin;
wire by_pass_v_c_reg_scanout;
wire by_pass_valid_c;
wire sel_by_pass_cycle_2_int_f;
wire sel_by_pass_cycle_3_int_c;
wire thr0_by_pass_valid_bf;
wire thr1_by_pass_valid_bf;
wire thr2_by_pass_valid_bf;
wire thr3_by_pass_valid_bf;
wire thr4_by_pass_valid_bf;
wire thr5_by_pass_valid_bf;
wire thr6_by_pass_valid_bf;
wire thr7_by_pass_valid_bf;
wire thr0_by_pass_valid_f;
wire thr1_by_pass_valid_f;
wire thr2_by_pass_valid_f;
wire thr3_by_pass_valid_f;
wire thr4_by_pass_valid_f;
wire thr5_by_pass_valid_f;
wire thr6_by_pass_valid_f;
wire thr7_by_pass_valid_f;
wire thr0_by_pass_valid_c;
wire thr1_by_pass_valid_c;
wire thr2_by_pass_valid_c;
wire thr3_by_pass_valid_c;
wire thr4_by_pass_valid_c;
wire thr5_by_pass_valid_c;
wire thr6_by_pass_valid_c;
wire thr7_by_pass_valid_c;
wire thr0_by_pass_cycle_2_bf;
wire thr0_by_pass_cycle_3_f;
wire thr1_by_pass_cycle_2_bf;
wire thr1_by_pass_cycle_3_f;
wire thr2_by_pass_cycle_2_bf;
wire thr2_by_pass_cycle_3_f;
wire thr3_by_pass_cycle_2_bf;
wire thr3_by_pass_cycle_3_f;
wire thr4_by_pass_cycle_2_bf;
wire thr4_by_pass_cycle_3_f;
wire thr5_by_pass_cycle_2_bf;
wire thr5_by_pass_cycle_3_f;
wire thr6_by_pass_cycle_2_bf;
wire thr6_by_pass_cycle_3_f;
wire thr7_by_pass_cycle_2_bf;
wire thr7_by_pass_cycle_3_f;
wire fetch_same_thr_again_bf;
wire ftp_curr_pstate_am_bf_;
wire select_itc_va;
wire sel_am_5;
wire [7:0] next_pstate_am_;
wire pstate_am_reg_scanin;
wire pstate_am_reg_scanout;
wire [7:0] ftp_pstate_am_bf_;
wire reload_in;
wire reload_latch_scanin;
wire reload_latch_scanout;
wire next_ftp_ith_det_req_bf;
wire next_select_itc_va;
wire next_sel_am_5;
wire pre_sel_am_reg_scanin;
wire pre_sel_am_reg_scanout;
wire [2:0] next_thr0_pid_data;
wire [2:0] thr0_pid_data;
wire [2:0] next_thr1_pid_data;
wire [2:0] thr1_pid_data;
wire [2:0] next_thr2_pid_data;
wire [2:0] thr2_pid_data;
wire [2:0] next_thr3_pid_data;
wire [2:0] thr3_pid_data;
wire [2:0] next_thr4_pid_data;
wire [2:0] thr4_pid_data;
wire [2:0] next_thr5_pid_data;
wire [2:0] thr5_pid_data;
wire [2:0] next_thr6_pid_data;
wire [2:0] thr6_pid_data;
wire [2:0] next_thr7_pid_data;
wire [2:0] thr7_pid_data;
wire thr0_pid_reg_scanin;
wire thr0_pid_reg_scanout;
wire thr1_pid_reg_scanin;
wire thr1_pid_reg_scanout;
wire thr2_pid_reg_scanin;
wire thr2_pid_reg_scanout;
wire thr3_pid_reg_scanin;
wire thr3_pid_reg_scanout;
wire thr4_pid_reg_scanin;
wire thr4_pid_reg_scanout;
wire thr5_pid_reg_scanin;
wire thr5_pid_reg_scanout;
wire thr6_pid_reg_scanin;
wire thr6_pid_reg_scanout;
wire thr7_pid_reg_scanin;
wire thr7_pid_reg_scanout;
wire invalidation_req_f;
wire spares_scanin;
wire spares_scanout;
wire [4:2] curr_thr_pc_bf;
wire [2:0] ic_pwr_sel_index;
wire [4:2] thr0_pc_muxed_f;
wire [4:2] thr1_pc_muxed_f;
wire [4:2] thr2_pc_muxed_f;
wire [4:2] thr3_pc_muxed_f;
wire [4:2] thr4_pc_muxed_f;
wire [4:2] thr5_pc_muxed_f;
wire [4:2] thr6_pc_muxed_f;
wire [4:2] thr7_pc_muxed_f;
wire [4:2] new_thr_pc_bf;
wire [4:2] ic_index_bf;
wire se;

input tcu_scan_en ;
input   l2clk;
input  	scan_in;
input  	tcu_pce_ov;		// scan signals
input  	spc_aclk;
input  	spc_bclk;

input [7:0] spc_core_running_status;
input [7:0] tlu_pstate_am;
input [7:0] tlu_flush_ifu;
input [7:0] tlu_itlb_bypass;

input [1:0] tlu_trap_0_tid;
input [1:0] tlu_trap_1_tid;
input       tlu_trap_pc_0_valid;
input       tlu_trap_pc_1_valid;

input [1:0]  dec_br_taken_e;
input [1:0]  dec_valid_e;
// input [1:0]  dec_br_reg_taken_e;
// input [1:0]  dec_br_noreg_taken_e;
input [1:0]  dec_tid0_d;
input [1:0]  dec_tid1_d;

input 	     itc_demap_next;
input        mbi_run;
input        mbi_itb_cam_en_pre	;
input  [1:0] mbi_cmpsel;
input        mbi_ict_read_en;
input        mbi_ict_write_en;
input        mbi_icd_read_en;
input        mbi_icd_write_en;
input        mbi_icv_read_en;
input        mbi_icv_write_en;


input		cmu_thr0_data_ready  ; 
input		cmu_thr1_data_ready  ;
input		cmu_thr2_data_ready  ;
input		cmu_thr3_data_ready  ;
input		cmu_thr4_data_ready  ;
input		cmu_thr5_data_ready  ;
input		cmu_thr6_data_ready  ;
input		cmu_thr7_data_ready  ;


input		tsm_thr0_ignore_by_pass  ;  
input		tsm_thr1_ignore_by_pass  ;
input		tsm_thr2_ignore_by_pass  ;
input		tsm_thr3_ignore_by_pass  ;
input		tsm_thr4_ignore_by_pass  ;
input		tsm_thr5_ignore_by_pass  ;
input		tsm_thr6_ignore_by_pass  ;
input		tsm_thr7_ignore_by_pass  ;


// input        agc_ld_flush_hi_pr_bf ;
// input  [2:0] agc_ld_flush_tid_bf ;
input  [1:0] dec_load_flush_w;



input   tsm_thr0_ready_hp_bf_in;
input   tsm_thr1_ready_hp_bf_in;
input   tsm_thr2_ready_hp_bf_in;
input   tsm_thr3_ready_hp_bf_in;
input   tsm_thr4_ready_hp_bf_in;
input   tsm_thr5_ready_hp_bf_in;
input   tsm_thr6_ready_hp_bf_in;
input   tsm_thr7_ready_hp_bf_in;





input   tsm_thr0_fill_rdy0;
input   tsm_thr1_fill_rdy0;
input   tsm_thr2_fill_rdy0;
input   tsm_thr3_fill_rdy0;
input   tsm_thr4_fill_rdy0;
input   tsm_thr5_fill_rdy0;
input   tsm_thr6_fill_rdy0;
input   tsm_thr7_fill_rdy0;


input       cmu_icache_invalidate   ;
input       cmu_any_un_cacheable    ;

input       cmu_any_data_ready      ;

input [7:0]   ibu_empty;
input [7:0]   ibu_room_4ormore;


input [7:0] agc_by_pass_update_lru_bf;
input [7:0] agc_invalidation_req_ff;
// input [2:0] itd_tid;

input   agc_kill_fetch_cv_c;

input   agc_thr0_micro_flush_unq_c ; 
input   agc_thr1_micro_flush_unq_c ; 
input   agc_thr2_micro_flush_unq_c ; 
input   agc_thr3_micro_flush_unq_c ; 
input   agc_thr4_micro_flush_unq_c ; 
input   agc_thr5_micro_flush_unq_c ; 
input   agc_thr6_micro_flush_unq_c ; 
input   agc_thr7_micro_flush_unq_c ; 

input   agc_thr0_sf_valid_f;
input   agc_thr1_sf_valid_f;
input   agc_thr2_sf_valid_f;
input   agc_thr3_sf_valid_f;
input   agc_thr4_sf_valid_f;
input   agc_thr5_sf_valid_f;
input   agc_thr6_sf_valid_f;
input   agc_thr7_sf_valid_f;

input   asi_sel_cntx_0;
input   asi_ic_wr_req;
input   asi_ic_rd_req;
input   asi_tg_wr_req;
input   asi_tg_rd_req;
input   asi_itd_rd_req;
input   asi_itt_rd_req;
input   asi_ith_det_req;

input [2:0] asi_tid ;

input [4:2]  agd_address0_m ;
input [4:2]  agd_address1_m ;
input [4:2]  agd_thr0_pc_4_2_f ;
input [4:2]  agd_thr1_pc_4_2_f ;
input [4:2]  agd_thr2_pc_4_2_f ;
input [4:2]  agd_thr3_pc_4_2_f ;
input [4:2]  agd_thr4_pc_4_2_f ;
input [4:2]  agd_thr5_pc_4_2_f ;
input [4:2]  agd_thr6_pc_4_2_f ;
input [4:2]  agd_thr7_pc_4_2_f ;
input [4:2]  ifu_agd_pc_f ;
input [5:3]  asi_addr_bf ;



// input        agc_sel_by_pass_cycle_2_int_f  ;
// input        agc_sel_by_pass_cycle_3_int_c  ;
input        lsu_ifu_ftu_pmen;              // enable power management.
input        lsu_ic_pmen;                   // enable power management for the ICD and ICT.
input        lsu_ifu_wr_pid  ; 
input [2:0]  lsu_ifu_tid_w ;   
input [2:0]  lsu_ifu_pid_data ;


// output        ftp_sel_flush_ld_flush;
output        ftp_asi_rd_done;
output        ftp_asi_wr_done;

output        ftp_reset_fill_wait;
output        ftp_ic_rd_req_bf;
output        ftp_ic_wr_ps_en_bf;
output        ftp_ic_wr_req_bf;
output        ftp_tg_rd_req_bf;
output        ftp_tg_wr_req_bf;
output        ftp_iv_rd_req_bf;
output        ftp_itt_rd_req_bf;
output        ftp_itd_rd_req_bf;
output        ftp_itlb_cam_vld_bf ;
output        ftp_itlb_cam_vld_f ;
output        ftp_ith_det_req_bf ;

output        ftp_itlb_probe_req_l ;

output        ftp_sel_icv_mbist_addr ;

output        ftp_sel_mbist_itb_cycle0 ;
output        ftp_sel_mbist_itb_cycle1 ;
output        ftp_sel_mbist_itb_cycle2 ;
output        ftp_sel_mbist_itb_cycle3 ;

output        ftp_sel_itlb_tag_cntx0_c;
output        ftp_sel_itlb_tag_cntx1_c;
output        ftp_sel_itlb_data_c;
output        ftp_sel_itlb_pa_c;
output        ftp_asi_mbist_access_bf;

output        ftp_asi_it_rd_done;
output        ftp_asi_ic_rd_done;
output        ftp_asi_ic_wr_done;
output        ftp_asi_tg_rd_done;
output        ftp_asi_tg_wr_done;
output        ftp_asi_tg_wr_req_hold;

output        ftp_thr0_room_is_less_t_3; 
output        ftp_thr1_room_is_less_t_3; 
output        ftp_thr2_room_is_less_t_3; 
output        ftp_thr3_room_is_less_t_3; 
output        ftp_thr4_room_is_less_t_3; 
output        ftp_thr5_room_is_less_t_3; 
output        ftp_thr6_room_is_less_t_3; 
output        ftp_thr7_room_is_less_t_3; 

output        ftp_thr0_go_to_sf_wait;
output        ftp_thr1_go_to_sf_wait;
output        ftp_thr2_go_to_sf_wait;
output        ftp_thr3_go_to_sf_wait;
output        ftp_thr4_go_to_sf_wait;
output        ftp_thr5_go_to_sf_wait;
output        ftp_thr6_go_to_sf_wait;
output        ftp_thr7_go_to_sf_wait;

output [2:0]  ftp_thr0_trprdpc_sel_bf;
output [2:0]  ftp_thr1_trprdpc_sel_bf;
output [2:0]  ftp_thr2_trprdpc_sel_bf;
output [2:0]  ftp_thr3_trprdpc_sel_bf;
output [2:0]  ftp_thr4_trprdpc_sel_bf;
output [2:0]  ftp_thr5_trprdpc_sel_bf;
output [2:0]  ftp_thr6_trprdpc_sel_bf;
output [2:0]  ftp_thr7_trprdpc_sel_bf;

output        ftp_thr0_sel_br_bf;
output        ftp_thr1_sel_br_bf;
output        ftp_thr2_sel_br_bf;
output        ftp_thr3_sel_br_bf;
output        ftp_thr4_sel_br_bf;
output        ftp_thr5_sel_br_bf;
output        ftp_thr6_sel_br_bf;
output        ftp_thr7_sel_br_bf;

output        ftp_icd_quad_0_en_bf;
output        ftp_icd_quad_1_en_bf;
output        ftp_icd_quad_2_en_bf;
output        ftp_icd_quad_3_en_bf;

output        ftp_tg_clk_en;

// output  [1:0] ftp_pc_sel_nb0_nb1;
// output  [2:0] ftp_pc_sel_b0_nb1;
// output  [2:0] ftp_pc_sel_nb0_b1;
// output  [1:0] ftp_pc_sel_b0_b1;

output  [5:0] ftp_pc_sel_am;
output  [2:0] ftp_pc_sel_tag_part1;
output  [3:0] ftp_pc_sel_tag_part2;
output  [1:0] ftp_pc_sel_tag_pc_bot;
output  [1:0] ftp_pc_sel_tag_pc_top;


output  [4:0] ftp_icaddr_sel_first_mux;

// output  [4:0] ftp_icaddr_sel_nb0_nb1;
// output  [4:0] ftp_icaddr_sel_b0_nb1;
// output  [4:0] ftp_icaddr_sel_nb0_b1;
// output  [4:0] ftp_icaddr_sel_b0_b1;

output  [7:0] ftp_itb_fetch_thr_bf;
// output  [7:0] ftp_ctx_fetch_thr_bf;
output  [7:0] ftp_new_thr_sel_bf;
output  [7:0] ftu_curr_fetch_thr_f;
output  [7:0] ftp_curr_fetch_thr_f;
output  [7:0] ftp_fetch_thr_q_f;
output  [1:0] ftp_tid0_e;
output  [1:0] ftp_tid1_e;
// output        ftp_go_to_fill_wait;

// output        ftp_thr0_go_to_fill_wait;
// output        ftp_thr1_go_to_fill_wait;
// output        ftp_thr2_go_to_fill_wait;
// output        ftp_thr3_go_to_fill_wait;
// output        ftp_thr4_go_to_fill_wait;
// output        ftp_thr5_go_to_fill_wait;
// output        ftp_thr6_go_to_fill_wait;
// output        ftp_thr7_go_to_fill_wait;

output        ftp_fetch_v_f;

// output        ftp_fill_req_bf;
output        ftp_fill_req_q_bf;
output        ftp_mbi_icd_read_en_bf;
output        ftp_mbi_ict_read_en_bf;
output [2:0]  ftp_ict_data_sel_bf;
output        ftp_any_thr_clken;				
output        scan_out;

output [2:0]  ftp_curr_pid_bf;
output [2:0]  ftp_thr7_pid_data;
output [2:0]  ftp_thr6_pid_data;
output [2:0]  ftp_thr5_pid_data;
output [2:0]  ftp_thr4_pid_data;
output [2:0]  ftp_thr3_pid_data;
output [2:0]  ftp_thr2_pid_data;
output [2:0]  ftp_thr1_pid_data;
output [2:0]  ftp_thr0_pid_data;



// scan renames
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;
// end scan


// assign br_reg_taken_e[1:0]   = dec_br_reg_taken_e[1:0]   & dec_valid_e[1:0];
// assign br_noreg_taken_e[1:0] = dec_br_noreg_taken_e[1:0] & dec_valid_e[1:0];



ifu_ftu_ftp_ctl_l1clkhdr_ctl_macro clkgen (
 .l2clk(l2clk),
 .l1en (1'b1 ),
 .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

ifu_ftu_ftp_ctl_l1clkhdr_ctl_macro clkgen_pm (
 .l2clk(l2clk),
 .l1en (ftp_any_thr_clken),
 .l1clk(l1clk_pm1),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));




////////////////////////////////////////////////////////////////


ifu_ftu_ftp_ctl_msff_ctl_macro__width_6 br_reg  (
 .scan_in(br_reg_scanin),
 .scan_out(br_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  ({dec_br_taken_e[1:0],   dec_valid_e[1:0] , br0_matches_curr  , br1_matches_curr}),
 .dout ({dec_br_taken_m[1:0],   dec_valid_m[1:0] , br0_matches_curr_f, br1_matches_curr_f}),
  .siclk(siclk),
  .soclk(soclk)
);

assign br_taken_ff[0] = dec_br_taken_m[0] & dec_valid_m[0] ;
assign br_taken_ff[1] = dec_br_taken_m[1] & dec_valid_m[1] ;

ifu_ftu_ftp_ctl_msff_ctl_macro__width_8 tlu_flush_ifu_req  (
 .scan_in(tlu_flush_ifu_req_scanin),
 .scan_out(tlu_flush_ifu_req_scanout),
 .l1clk(l1clk),
 .din  (tlu_flush_ifu[7:0]),
 .dout (ftp_tlu_flush_f[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_ftu_ftp_ctl_msff_ctl_macro__width_12 br_tid_reg  (
 .scan_in(br_tid_reg_scanin),
 .scan_out(br_tid_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  ({dec_tid1_d[1:0],dec_tid0_d[1:0], ftp_tid1_e[1:0], ftp_tid0_e[1:0], tid1_m[1:0], tid0_m[1:0]}),
 .dout ({ftp_tid1_e[1:0],ftp_tid0_e[1:0], tid1_m[1:0], tid0_m[1:0], tid1_b[1:0], tid0_b[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign next_tid_dec_b[0] = ~tid0_b[1] & ~tid0_b[0] ;
assign next_tid_dec_b[1] = ~tid0_b[1] &  tid0_b[0] ;
assign next_tid_dec_b[2] =  tid0_b[1] & ~tid0_b[0] ;
assign next_tid_dec_b[3] =  tid0_b[1] &  tid0_b[0] ;
assign next_tid_dec_b[4] = ~tid1_b[1] & ~tid1_b[0] ;
assign next_tid_dec_b[5] = ~tid1_b[1] &  tid1_b[0] ;
assign next_tid_dec_b[6] =  tid1_b[1] & ~tid1_b[0] ;
assign next_tid_dec_b[7] =  tid1_b[1] &  tid1_b[0] ;

ifu_ftu_ftp_ctl_msff_ctl_macro__width_8 tid_dec_w_reg  (
 .scan_in(tid_dec_w_reg_scanin),
 .scan_out(tid_dec_w_reg_scanout),
 .l1clk(l1clk),
 .din  (next_tid_dec_b[7:0]),
 .dout (tid_dec_w[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);



assign ftp_any_thread_ready       = |ready_hp_bf[7:0] ;
assign fpick[7:0]                 =  hp_pick[7:0] | agc_by_pass_update_lru_bf[7:0] ; 
assign ftp_curr_fetch_thr_bf[7:0] =  hp_pick[7:0] ;
assign ftp_new_thr_sel_bf[7:1] = hp_pick[7:1] ;
assign ftp_new_thr_sel_bf[0]   = hp_pick[0] | ~ftp_any_thread_ready ;

assign next_ith_det_thr_id[0]          =  asi_ith_det_req ? (~asi_tid[2] & ~asi_tid[1] & ~asi_tid[0]) : (ith_det_thr_id[0] & ~it_rd_req_done_f);
assign next_ith_det_thr_id[1]          =  asi_ith_det_req ? (~asi_tid[2] & ~asi_tid[1] &  asi_tid[0]) : (ith_det_thr_id[1] & ~it_rd_req_done_f);
assign next_ith_det_thr_id[2]          =  asi_ith_det_req ? (~asi_tid[2] &  asi_tid[1] & ~asi_tid[0]) : (ith_det_thr_id[2] & ~it_rd_req_done_f);
assign next_ith_det_thr_id[3]          =  asi_ith_det_req ? (~asi_tid[2] &  asi_tid[1] &  asi_tid[0]) : (ith_det_thr_id[3] & ~it_rd_req_done_f);
assign next_ith_det_thr_id[4]          =  asi_ith_det_req ? ( asi_tid[2] & ~asi_tid[1] & ~asi_tid[0]) : (ith_det_thr_id[4] & ~it_rd_req_done_f);
assign next_ith_det_thr_id[5]          =  asi_ith_det_req ? ( asi_tid[2] & ~asi_tid[1] &  asi_tid[0]) : (ith_det_thr_id[5] & ~it_rd_req_done_f);
assign next_ith_det_thr_id[6]          =  asi_ith_det_req ? ( asi_tid[2] &  asi_tid[1] & ~asi_tid[0]) : (ith_det_thr_id[6] & ~it_rd_req_done_f);
assign next_ith_det_thr_id[7]          =  asi_ith_det_req ? ( asi_tid[2] &  asi_tid[1] &  asi_tid[0]) : (ith_det_thr_id[7] & ~it_rd_req_done_f);


 ifu_ftu_ftp_ctl_msff_ctl_macro__width_8 tid_bf_reg  (
      .scan_in(tid_bf_reg_scanin),
      .scan_out(tid_bf_reg_scanout),
      .l1clk  (l1clk),
      .din    (next_ith_det_thr_id[7:0]),
      .dout   (ith_det_thr_id[7:0]),
  .siclk(siclk),
  .soclk(soclk)
 );




   assign ftp_itb_fetch_thr_bf[7:0]     = ftp_ith_det_req_bf ? ith_det_thr_id[7:0] :  hp_pick[7:0] ;
   assign ftp_itb_fetch_thr_dup_bf[7:0] = ftp_ith_det_req_bf ? ith_det_thr_id[7:0] :  hp_pick[7:0] ;
// assign ftp_itb_fetch_thr_bf[7:0] = ith_det_thr_id[7:0]     |  hp_pick[7:0] ;
// assign ftp_itb_fetch_thr_dup_bf[7:0] = ith_det_thr_id[7:0] |  hp_pick[7:0] ;
// assign ftp_ctx_fetch_thr_bf[7:0] = ftp_select_itc_ctx ? tlb_wr_thr_id[7:0]  :   ftp_itb_fetch_thr_bf[7:0] ; 

assign top_hp_ready[3:0] = ready_hp_bf[7:4]  & enabled_threads[7:4];
assign bot_hp_ready[3:0] = ready_hp_bf[3:0]  & enabled_threads[3:0];

assign top_hp_pickready  = (|top_hp_ready[3:0]) ;
assign bot_hp_pickready  = (|bot_hp_ready[3:0]) ;
assign hp_pickready = top_hp_pickready | bot_hp_pickready  ;

assign bot_hp_pick[3] = (bot_hp_ready[3]&!bot_hp_ready[1]&!bot_hp_ready[0]&bot_lru[1]&!bot_lru[0]) | 
                        (bot_hp_ready[3]&!bot_hp_ready[2]&!bot_hp_ready[0]&!bot_lru[1]&bot_lru[0]) | 
                        (bot_hp_ready[3]&!bot_hp_ready[1]&!bot_lru[2]&!bot_lru[0]) | 
                        (bot_hp_ready[3]&!bot_hp_ready[2]&!bot_lru[3]&!bot_lru[1]) | 
                        (bot_hp_ready[3]&!bot_hp_ready[2]&!bot_hp_ready[1]&!bot_lru[1]&!bot_lru[0]) | 
                        (bot_hp_ready[3]&!bot_hp_ready[0]&!bot_lru[7]&!bot_lru[6]&bot_lru[5]&bot_lru[4]) | 
                        (bot_hp_ready[3]&bot_lru[7]&bot_lru[6]) | 
                        (bot_hp_ready[3]&!bot_hp_ready[2]&!bot_hp_ready[1]&!bot_hp_ready[0]);

assign bot_hp_pick[2] = (!bot_hp_ready[3]&bot_hp_ready[2]&!bot_hp_ready[1]&!bot_lru[1]&!bot_lru[0]) | 
                        (bot_hp_ready[2]&!bot_hp_ready[1]&!bot_hp_ready[0]&bot_lru[1]&bot_lru[0]) | 
                        (bot_hp_ready[2]&!bot_hp_ready[0]&bot_lru[2]&bot_lru[0]) | 
                        (!bot_hp_ready[3]&bot_hp_ready[2]&!bot_lru[3]&!bot_lru[1]) | 
                        (!bot_hp_ready[3]&bot_hp_ready[2]&!bot_hp_ready[0]&!bot_lru[1]&bot_lru[0]) | 
                        (bot_hp_ready[2]&!bot_hp_ready[1]&!bot_lru[7]&bot_lru[6]&bot_lru[5]&!bot_lru[4]) | 
                        (bot_hp_ready[2]&bot_lru[7]&!bot_lru[6]) | 
                        (!bot_hp_ready[3]&bot_hp_ready[2]&!bot_hp_ready[1]&!bot_hp_ready[0]);

assign bot_hp_pick[1] = (!bot_hp_ready[3]&!bot_hp_ready[2]&bot_hp_ready[1]&!bot_lru[1]&!bot_lru[0]) | 
                        (!bot_hp_ready[2]&bot_hp_ready[1]&!bot_hp_ready[0]&bot_lru[1]&bot_lru[0]) | 
                        (!bot_hp_ready[3]&bot_hp_ready[1]&!bot_lru[2]&!bot_lru[0]) | 
                        (bot_hp_ready[1]&!bot_hp_ready[0]&bot_lru[3]&bot_lru[1]) | 
                        (!bot_hp_ready[3]&bot_hp_ready[1]&!bot_hp_ready[0]&bot_lru[1]&!bot_lru[0]) | 
                        (!bot_hp_ready[2]&bot_hp_ready[1]&bot_lru[7]&!bot_lru[6]&!bot_lru[5]&bot_lru[4]) | 
                        (bot_hp_ready[1]&!bot_lru[7]&bot_lru[6]) | 
                        (!bot_hp_ready[3]&!bot_hp_ready[2]&bot_hp_ready[1]&!bot_hp_ready[0]);

assign bot_hp_pick[0] = (!bot_hp_ready[3]&!bot_hp_ready[1]&bot_hp_ready[0]&bot_lru[1]&!bot_lru[0]) | 
                        (!bot_hp_ready[3]&!bot_hp_ready[2]&bot_hp_ready[0]&!bot_lru[1]&bot_lru[0]) | 
                        (!bot_hp_ready[2]&bot_hp_ready[0]&bot_lru[2]&bot_lru[0]) | 
                        (!bot_hp_ready[1]&bot_hp_ready[0]&bot_lru[3]&bot_lru[1]) | 
                        (!bot_hp_ready[2]&!bot_hp_ready[1]&bot_hp_ready[0]&bot_lru[1]&bot_lru[0]) | 
                        (!bot_hp_ready[3]&bot_hp_ready[0]&bot_lru[7]&bot_lru[6]&!bot_lru[5]&!bot_lru[4]) | 
                        (bot_hp_ready[0]&!bot_lru[7]&!bot_lru[6]) | 
                        (!bot_hp_ready[3]&!bot_hp_ready[2]&!bot_hp_ready[1]&bot_hp_ready[0]);

assign top_hp_pick[3] = (top_hp_ready[3]&!top_hp_ready[1]&!top_hp_ready[0]&top_lru[1]&!top_lru[0]) | 
                        (top_hp_ready[3]
    &!top_hp_ready[2]&!top_hp_ready[0]&!top_lru[1]&top_lru[0]) | 
                        (top_hp_ready[3]&!top_hp_ready[1]&!top_lru[2]
    &!top_lru[0]) | 
                        (top_hp_ready[3]&!top_hp_ready[2]&!top_lru[3]&!top_lru[1]) | 
                        (top_hp_ready[3]&!top_hp_ready[2]
    &!top_hp_ready[1]&!top_lru[1]&!top_lru[0]) | 
                        (top_hp_ready[3]&!top_hp_ready[0]&!top_lru[7]&!top_lru[6]
    &top_lru[5]&top_lru[4]) | 
                        (top_hp_ready[3]&top_lru[7]&top_lru[6]) | 
                        (top_hp_ready[3]&!top_hp_ready[2]
    &!top_hp_ready[1]&!top_hp_ready[0]);

assign top_hp_pick[2] = (!top_hp_ready[3]&top_hp_ready[2]&!top_hp_ready[1]&!top_lru[1]&!top_lru[0]) | 
                        (top_hp_ready[2]&!top_hp_ready[1]&!top_hp_ready[0]&top_lru[1]&top_lru[0]) |
                       (top_hp_ready[2]&!top_hp_ready[0]&top_lru[2]&top_lru[0]) |
                       (!top_hp_ready[3]&top_hp_ready[2]&!top_lru[3]&!top_lru[1]) | 
                       (!top_hp_ready[3]&top_hp_ready[2]&!top_hp_ready[0]&!top_lru[1]&top_lru[0]) |
                       (top_hp_ready[2]&!top_hp_ready[1]&!top_lru[7]&top_lru[6]&top_lru[5]&!top_lru[4]) |
                       (top_hp_ready[2]&top_lru[7]&!top_lru[6]) | 
                       (!top_hp_ready[3]&top_hp_ready[2]&!top_hp_ready[1]&!top_hp_ready[0]);

assign top_hp_pick[1] = (!top_hp_ready[3]&!top_hp_ready[2]&top_hp_ready[1]&!top_lru[1]&!top_lru[0]) |
                       (!top_hp_ready[2]&top_hp_ready[1]&!top_hp_ready[0]&top_lru[1]&top_lru[0]) |
                       (!top_hp_ready[3]&top_hp_ready[1]&!top_lru[2]&!top_lru[0]) |
                       (top_hp_ready[1]&!top_hp_ready[0]&top_lru[3]&top_lru[1]) | 
                       (!top_hp_ready[3]&top_hp_ready[1]&!top_hp_ready[0]&top_lru[1]&!top_lru[0]) |
                       (!top_hp_ready[2]&top_hp_ready[1]&top_lru[7]&!top_lru[6]&!top_lru[5]&top_lru[4]) |
                       (top_hp_ready[1]&!top_lru[7]&top_lru[6]) | 
                       (!top_hp_ready[3]&!top_hp_ready[2]&top_hp_ready[1]&!top_hp_ready[0]);

assign top_hp_pick[0] = (!top_hp_ready[3]&!top_hp_ready[1]&top_hp_ready[0]&top_lru[1]&!top_lru[0]) |
                       (!top_hp_ready[3]&!top_hp_ready[2]&top_hp_ready[0]&!top_lru[1]&top_lru[0]) |
                       (!top_hp_ready[2]&top_hp_ready[0]&top_lru[2]&top_lru[0]) |
                       (!top_hp_ready[1]&top_hp_ready[0]&top_lru[3]&top_lru[1]) | 
                       (!top_hp_ready[2]&!top_hp_ready[1]&top_hp_ready[0]&top_lru[1]&top_lru[0]) |
                       (!top_hp_ready[3]&top_hp_ready[0]&top_lru[7]&top_lru[6]&!top_lru[5]&!top_lru[4]) |
                       (top_hp_ready[0]&!top_lru[7]&!top_lru[6]) | 
                       (!top_hp_ready[3]&!top_hp_ready[2]&!top_hp_ready[1]&top_hp_ready[0]);
assign sel_top_hp   = (~favor_top  &  top_hp_pickready & ~bot_hp_pickready) |
                      ( favor_top  & ~top_hp_pickready & ~bot_hp_pickready) | 
                      ( favor_top  &  top_hp_pickready) ;

assign hp_pick[7:0] = ({8{sel_top_hp}}  & {top_hp_pick[3:0],4'b0000}) |
                      ({8{~sel_top_hp}} & {4'b0000,bot_hp_pick[3:0]}) ;


 

assign top_fpick[3:0] = fpick[7:4] ;
assign bot_fpick[3:0] = fpick[3:0] ;

// lru is msb pair of the lru vector
assign ntop_lru[7] = (top_fpick[0]&!top_lru[6]&top_lru[5]) |
                        (top_fpick[1]&top_lru[6]&top_lru[5]) |
                        (!top_lru[3]&!top_lru[1]) |
                        (!top_fpick[2]&top_lru[7]&!top_lru[6]) |
                        (!top_fpick[3]&top_lru[7]&top_lru[6]);

assign ntop_lru[6] = (top_fpick[0]&!top_lru[7]&top_lru[4]) |
                        (top_fpick[2]&top_lru[7]&top_lru[4]) |
                        (!top_lru[2]&!top_lru[0]) |
                        (!top_fpick[1]&!top_lru[7]&top_lru[6]) |
                        (!top_fpick[3]&top_lru[7]&top_lru[6]);

assign ntop_lru[5] = (!top_fpick[3]&!top_fpick[0]&top_lru[5]&top_lru[4]&top_lru[2]&top_lru[1]) |
                        (top_fpick[0]&!top_lru[1]&top_lru[0]) |
                        (top_fpick[1]&top_lru[3]&top_lru[1]) |
                        (top_fpick[3]&top_lru[3]&!top_lru[2]&!top_lru[1]) |
                        (top_fpick[0]&!top_lru[7]&top_lru[3]) |
                        (top_fpick[2]&top_lru[3]&top_lru[2]&!top_lru[1]) |
                        (top_fpick[1]&top_lru[3]&!top_lru[0]) |
                        (!top_fpick[2]&!top_fpick[0]&!top_lru[7]&top_lru[5]&!top_lru[4]&top_lru[2]) |
                        (!top_fpick[3]&!top_fpick[1]&!top_lru[7]&top_lru[5]&top_lru[4]&!top_lru[2]) |
                        (!top_fpick[2]&!top_fpick[1]&!top_lru[7]&top_lru[5]&!top_lru[2]&top_lru[0]) |
                        (!top_fpick[3]&!top_fpick[2]&top_lru[5]&!top_lru[1]);

assign ntop_lru[4] = (top_fpick[0]&top_lru[1]&!top_lru[0]) |
                        (top_fpick[2]&top_lru[2]&top_lru[0]) |
                        (!top_fpick[3]&!top_fpick[2]&top_lru[4]&!top_lru[3]&!top_lru[1]) |
                        (top_fpick[3]&!top_lru[3]&top_lru[2]&!top_lru[0]) |
                        (top_fpick[0]&!top_lru[6]&top_lru[2]) |
                        (top_fpick[1]&top_lru[3]&top_lru[2]&!top_lru[0]) |
                        (top_fpick[2]&top_lru[2]&!top_lru[1]) |
                        (!top_fpick[3]&!top_fpick[0]&!top_lru[7]&!top_lru[6]&top_lru[5]&top_lru[4]) |
                        (!top_fpick[1]&!top_fpick[0]&!top_lru[6]&!top_lru[5]&top_lru[4]&top_lru[3]) |
                        (!top_fpick[2]&!top_fpick[1]&!top_lru[6]&top_lru[4]&!top_lru[3]&top_lru[1]) |
                        (!top_fpick[3]&!top_fpick[1]&top_lru[4]&!top_lru[0]);

assign ntop_lru[3] = (top_fpick[3]&top_lru[1]&!top_lru[0]) |
                        (top_fpick[2]&top_lru[1]&top_lru[0]) |
                        (!top_fpick[3]&!top_fpick[2]&!top_fpick[1]&top_lru[3]&!top_lru[0]) |
                        (!top_fpick[3]&!top_fpick[2]&!top_fpick[0]&top_lru[3]&top_lru[0]) |
                        (top_fpick[1]&top_lru[1]) |
                        (top_fpick[0]&top_lru[1]) |
                        (top_lru[3]&top_lru[1]);

assign ntop_lru[2] = (top_fpick[3]&!top_lru[1]&top_lru[0]) |
                        (top_fpick[1]&top_lru[1]&top_lru[0]) |
                        (top_lru[2]&top_lru[0]) |
                        (!top_fpick[3]&!top_fpick[2]&!top_fpick[1]&top_lru[2]&!top_lru[1]) |
                        (!top_fpick[3]&!top_fpick[1]&!top_fpick[0]&top_lru[2]&top_lru[1]) |
                        (top_fpick[2]&top_lru[0]) |
                        (top_fpick[0]&top_lru[0]);

assign ntop_lru[1] = (!top_fpick[1]&!top_fpick[0]&top_lru[1]) |
                        (top_fpick[3]) |
                        (top_fpick[2]);

assign ntop_lru[0] = (!top_fpick[2]&!top_fpick[0]&top_lru[0]) |
                        (top_fpick[3]) |
                        (top_fpick[1]);
assign ntop_lru_in[7:0] = {ntop_lru[7],ntop_lru[6], ntop_lru[5],~ntop_lru[4],
                          ~ntop_lru[3],ntop_lru[2],~ntop_lru[1],~ntop_lru[0]};

ifu_ftu_ftp_ctl_msff_ctl_macro__width_8 top_lruf  (
 .scan_in(top_lruf_scanin),
 .scan_out(top_lruf_scanout),
 .l1clk(l1clk_pm1),
 .din  (ntop_lru_in[7:0]),
 .dout (top_lru_out[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign top_lru[7:0] =  {top_lru_out[7],top_lru_out[6], top_lru_out[5],~top_lru_out[4],
                       ~top_lru_out[3],top_lru_out[2],~top_lru_out[1],~top_lru_out[0]};

assign nbot_lru[7] = (bot_fpick[0]&!bot_lru[6]&bot_lru[5]) |
                        (bot_fpick[1]&bot_lru[6]&bot_lru[5]) |
                        (!bot_lru[3]&!bot_lru[1]) |
                        (!bot_fpick[2]&bot_lru[7]&!bot_lru[6]) |
                        (!bot_fpick[3]&bot_lru[7]&bot_lru[6]);

assign nbot_lru[6] = (bot_fpick[0]&!bot_lru[7]&bot_lru[4]) |
                        (bot_fpick[2]&bot_lru[7]&bot_lru[4]) |
                        (!bot_lru[2]&!bot_lru[0]) |
                        (!bot_fpick[1]&!bot_lru[7]&bot_lru[6]) |
                        (!bot_fpick[3]&bot_lru[7]&bot_lru[6]);

assign nbot_lru[5] = (!bot_fpick[3]&!bot_fpick[0]&bot_lru[5]&bot_lru[4]&bot_lru[2]&bot_lru[1]) |
                        (bot_fpick[0]&!bot_lru[1]&bot_lru[0]) |
                        (bot_fpick[1]&bot_lru[3]&bot_lru[1]) |
                        (bot_fpick[3]&bot_lru[3]&!bot_lru[2]&!bot_lru[1]) |
                        (bot_fpick[0]&!bot_lru[7]&bot_lru[3]) |
                        (bot_fpick[2]&bot_lru[3]&bot_lru[2]&!bot_lru[1]) |
                        (bot_fpick[1]&bot_lru[3]&!bot_lru[0]) |
                        (!bot_fpick[2]&!bot_fpick[0]&!bot_lru[7]&bot_lru[5]&!bot_lru[4]&bot_lru[2]) |
                        (!bot_fpick[3]&!bot_fpick[1]&!bot_lru[7]&bot_lru[5]&bot_lru[4]&!bot_lru[2]) |
                        (!bot_fpick[2]&!bot_fpick[1]&!bot_lru[7]&bot_lru[5]&!bot_lru[2]&bot_lru[0]) |
                        (!bot_fpick[3]&!bot_fpick[2]&bot_lru[5]&!bot_lru[1]);

assign nbot_lru[4] = (bot_fpick[0]&bot_lru[1]&!bot_lru[0]) |
                        (bot_fpick[2]&bot_lru[2]&bot_lru[0]) |
                        (!bot_fpick[3]&!bot_fpick[2]&bot_lru[4]&!bot_lru[3]&!bot_lru[1]) |
                        (bot_fpick[3]&!bot_lru[3]&bot_lru[2]&!bot_lru[0]) |
                        (bot_fpick[0]&!bot_lru[6]&bot_lru[2]) |
                        (bot_fpick[1]&bot_lru[3]&bot_lru[2]&!bot_lru[0]) |
                        (bot_fpick[2]&bot_lru[2]&!bot_lru[1]) |
                        (!bot_fpick[3]&!bot_fpick[0]&!bot_lru[7]&!bot_lru[6]&bot_lru[5]&bot_lru[4]) |
                        (!bot_fpick[1]&!bot_fpick[0]&!bot_lru[6]&!bot_lru[5]&bot_lru[4]&bot_lru[3]) |
                        (!bot_fpick[2]&!bot_fpick[1]&!bot_lru[6]&bot_lru[4]&!bot_lru[3]&bot_lru[1]) |
                        (!bot_fpick[3]&!bot_fpick[1]&bot_lru[4]&!bot_lru[0]);

assign nbot_lru[3] = (bot_fpick[3]&bot_lru[1]&!bot_lru[0]) |
                        (bot_fpick[2]&bot_lru[1]&bot_lru[0]) |
                        (!bot_fpick[3]&!bot_fpick[2]&!bot_fpick[1]&bot_lru[3]&!bot_lru[0]) |
                        (!bot_fpick[3]&!bot_fpick[2]&!bot_fpick[0]&bot_lru[3]&bot_lru[0]) |
                        (bot_fpick[1]&bot_lru[1]) |
                        (bot_fpick[0]&bot_lru[1]) |
                        (bot_lru[3]&bot_lru[1]);

assign nbot_lru[2] = (bot_fpick[3]&!bot_lru[1]&bot_lru[0]) |
                        (bot_fpick[1]&bot_lru[1]&bot_lru[0]) |
                        (bot_lru[2]&bot_lru[0]) |
                        (!bot_fpick[3]&!bot_fpick[2]&!bot_fpick[1]&bot_lru[2]&!bot_lru[1]) |
                        (!bot_fpick[3]&!bot_fpick[1]&!bot_fpick[0]&bot_lru[2]&bot_lru[1]) |
                        (bot_fpick[2]&bot_lru[0]) |
                        (bot_fpick[0]&bot_lru[0]);

assign nbot_lru[1] = (!bot_fpick[1]&!bot_fpick[0]&bot_lru[1]) | (bot_fpick[3]) | (bot_fpick[2]);

assign nbot_lru[0] = (!bot_fpick[2]&!bot_fpick[0]&bot_lru[0]) | (bot_fpick[3]) | (bot_fpick[1]);

assign nbot_lru_in[7:0] = {nbot_lru[7],nbot_lru[6], nbot_lru[5],~nbot_lru[4],
                          ~nbot_lru[3],nbot_lru[2],~nbot_lru[1],~nbot_lru[0]}; 
ifu_ftu_ftp_ctl_msff_ctl_macro__width_8 bot_lruf  (
 .scan_in(bot_lruf_scanin),
 .scan_out(bot_lruf_scanout),
 .l1clk(l1clk_pm1),
 .din  (nbot_lru_in[7:0]),
 .dout (bot_lru_out[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign bot_lru[7:0] = {bot_lru_out[7],bot_lru_out[6], bot_lru_out[5],~bot_lru_out[4],
                      ~bot_lru_out[3],bot_lru_out[2],~bot_lru_out[1],~bot_lru_out[0]};
////////////////////////////////////////////////////////////
// Manage the favor bit.                                  //
////////////////////////////////////////////////////////////
assign set_favor_top = |bot_fpick[3:0] | favor_top ; 
assign reset_favor_top = |top_fpick[3:0] ;
assign next_favor_top = set_favor_top & ~reset_favor_top ;

ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 favor_top_reg  (
 .scan_in(favor_top_reg_scanin),
 .scan_out(favor_top_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (next_favor_top),
 .dout (favor_top),
  .siclk(siclk),
  .soclk(soclk)
);



assign next_curr_fetch_f_bf[7:0]  =  hp_pick[7:0]  ;


ifu_ftu_ftp_ctl_msff_ctl_macro__width_8 curr_fetch_thr_f_reg  (
 .scan_in(curr_fetch_thr_f_reg_scanin),
 .scan_out(curr_fetch_thr_f_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (next_curr_fetch_f_bf[7:0]),
 .dout (ftp_curr_fetch_thr_f[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);
 
assign ftu_curr_fetch_thr_f[7:0] = ftp_curr_fetch_thr_f[7:0] ;


ifu_ftu_ftp_ctl_msff_ctl_macro__width_8 curr_fetch_thr_c_reg  (
 .scan_in(curr_fetch_thr_c_reg_scanin),
 .scan_out(curr_fetch_thr_c_reg_scanout),
 .l1clk(l1clk),
 .din  (ftp_curr_fetch_thr_f[7:0]),
 .dout (ftp_curr_fetch_thr_c[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);


assign ftp_fetch_thr_q_f[0] = ftp_curr_fetch_thr_f[0] & ftp_fetch_v_dup_f; 
assign ftp_fetch_thr_q_f[1] = ftp_curr_fetch_thr_f[1] & ftp_fetch_v_dup_f; 
assign ftp_fetch_thr_q_f[2] = ftp_curr_fetch_thr_f[2] & ftp_fetch_v_dup_f; 
assign ftp_fetch_thr_q_f[3] = ftp_curr_fetch_thr_f[3] & ftp_fetch_v_dup_f; 
assign ftp_fetch_thr_q_f[4] = ftp_curr_fetch_thr_f[4] & ftp_fetch_v_dup_f; 
assign ftp_fetch_thr_q_f[5] = ftp_curr_fetch_thr_f[5] & ftp_fetch_v_dup_f; 
assign ftp_fetch_thr_q_f[6] = ftp_curr_fetch_thr_f[6] & ftp_fetch_v_dup_f; 
assign ftp_fetch_thr_q_f[7] = ftp_curr_fetch_thr_f[7] & ftp_fetch_v_dup_f; 

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

assign next_ftp_fill_req_q = (cmu_any_data_ready & ~cmu_any_un_cacheable ) ;

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 inv_line_reg  (
 .scan_in(inv_line_reg_scanin),
 .scan_out(inv_line_reg_scanout),
 .l1clk( l1clk                                                            ),
 .din  (cmu_icache_invalidate),
 .dout (inv_line_bf),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
// Generate valid fetch signals.                                      //
////////////////////////////////////////////////////////////////////////
assign next_fill_req =  cmu_any_data_ready ; 
ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 fill_req_bf_reg  (
 .scan_in(fill_req_bf_reg_scanin),
 .scan_out(fill_req_bf_reg_scanout),
 .l1clk(l1clk),
 .din  (next_fill_req),
 .dout (ftp_fill_req_bf),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
assign asi_rd_request = asi_ic_rd_req |    asi_tg_rd_req  | asi_itd_rd_req |   
                       asi_itt_rd_req |    asi_ith_det_req;

assign next_rd_is_first = (asi_rd_request     & ~wr_request_pending)  |
                          (rd_request_pending & ~wr_request_pending & ~ftp_asi_rd_done)	 |
                          (asi_rd_is_first    & ~ftp_asi_rd_done);

ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 rd_is_first_reg  (
        .scan_in(rd_is_first_reg_scanin),
        .scan_out(rd_is_first_reg_scanout),
        .l1clk  (l1clk),
        .din    (next_rd_is_first),
        .dout   (asi_rd_is_first),
  .siclk(siclk),
  .soclk(soclk)
);


assign asi_wr_request = asi_ic_wr_req | asi_tg_wr_req ;
assign next_wr_request_pending = asi_wr_request   | (wr_request_pending    & ~asi_wr_done_in);
assign next_rd_request_pending = asi_rd_request	  | (rd_request_pending	   & ~ftp_asi_rd_done);

ifu_ftu_ftp_ctl_msff_ctl_macro__width_2 wr_request_pending_reg  (
        .scan_in(wr_request_pending_reg_scanin),
        .scan_out(wr_request_pending_reg_scanout),
        .l1clk  (l1clk),
        .din    ({next_wr_request_pending,next_rd_request_pending}),
        .dout   ({wr_request_pending,rd_request_pending}),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_rd_ok =  !wr_request_pending |  asi_rd_is_first;
assign asi_wr_ok =   wr_request_pending & !asi_rd_is_first;


assign next_ic_wr_req = asi_ic_wr_req | (ic_wr_req_ff  & (ftp_fill_req_q_bf | !asi_wr_ok) ) ;
ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 ic_wr_req_ff_reg  (
 .scan_in(ic_wr_req_ff_reg_scanin),
 .scan_out(ic_wr_req_ff_reg_scanout),
 .l1clk(l1clk),
 .din  (next_ic_wr_req),
 .dout (ic_wr_req_ff),
  .siclk(siclk),
  .soclk(soclk)
);


assign next_ic_rd_req = asi_ic_rd_req | (ic_rd_req_ff  & (ftp_fill_req_q_bf | !asi_rd_ok)) ;
ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 ic_rd_req_ff_reg  (
 .scan_in(ic_rd_req_ff_reg_scanin),
 .scan_out(ic_rd_req_ff_reg_scanout),
 .l1clk(l1clk),
 .din  (next_ic_rd_req),
 .dout (ic_rd_req_ff),
  .siclk(siclk),
  .soclk(soclk)
);


assign next_tg_wr_req = asi_tg_wr_req | (tg_wr_req_ff  & (ftp_fill_req_q_bf | inv_line_bf | !asi_wr_ok)) ;
ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 tg_wr_req_ff_reg  (
 .scan_in(tg_wr_req_ff_reg_scanin),
 .scan_out(tg_wr_req_ff_reg_scanout),
 .l1clk(l1clk),
 .din  (next_tg_wr_req),
 .dout (tg_wr_req_ff),
  .siclk(siclk),
  .soclk(soclk)
);


assign next_tg_rd_req = asi_tg_rd_req | (tg_rd_req_ff  & (ftp_fill_req_q_bf | !asi_rd_ok)) ;
ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 tg_rd_req_ff_reg  (
 .scan_in(tg_rd_req_ff_reg_scanin),
 .scan_out(tg_rd_req_ff_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (next_tg_rd_req),
 .dout (tg_rd_req_ff),
  .siclk(siclk),
  .soclk(soclk)
);


assign next_itt_rd_req = asi_itt_rd_req | (itt_rd_req_ff  & (reload | reload_last | !asi_rd_ok)) ;
ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 itt_rd_req_ff_reg  (
 .scan_in(itt_rd_req_ff_reg_scanin),
 .scan_out(itt_rd_req_ff_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (next_itt_rd_req),
 .dout (itt_rd_req_ff),
  .siclk(siclk),
  .soclk(soclk)
);


assign next_itd_rd_req = asi_itd_rd_req | (itd_rd_req_ff  & (reload | reload_last | !asi_rd_ok)) ;
ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 itd_rd_req_ff_reg  (
 .scan_in(itd_rd_req_ff_reg_scanin),
 .scan_out(itd_rd_req_ff_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (next_itd_rd_req),
 .dout (itd_rd_req_ff),
  .siclk(siclk),
  .soclk(soclk)
);

assign next_ith_det_req = asi_ith_det_req | (ith_det_req_ff  & (reload | reload_last | !asi_rd_ok)) ;
ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 ith_det_req_ff_reg  (
 .scan_in(ith_det_req_ff_reg_scanin),
 .scan_out(ith_det_req_ff_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (next_ith_det_req),
 .dout (ith_det_req_ff),
  .siclk(siclk),
  .soclk(soclk)
);


assign next_itlb_probe_req_l = ~(asi_ith_det_req | (ith_det_req_ff  & (reload | reload_last | !asi_rd_ok))) ;
ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 itlb_probe_l_reg  (
 .scan_in(itlb_probe_l_reg_scanin),
 .scan_out(itlb_probe_l_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (next_itlb_probe_req_l),
 .dout (ftp_itlb_probe_req_l),
  .siclk(siclk),
  .soclk(soclk)
);


ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 fill_req_bf_q_reg  (
 .scan_in(fill_req_bf_q_reg_scanin),
 .scan_out(fill_req_bf_q_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (next_ftp_fill_req_q),
 .dout (ftp_fill_req_q_bf),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_ftu_ftp_ctl_msff_ctl_macro__width_11 mbist_in_reg  (
 .scan_in(mbist_in_reg_scanin),
 .scan_out(mbist_in_reg_scanout),
 .l1clk(l1clk),
 .din  ({mbi_run, mbi_icd_read_en, mbi_ict_read_en, 
         mbi_icd_write_en ,  mbi_ict_write_en,
         mbi_cmpsel[1:0] ,
         mbi_icv_read_en, mbi_icv_write_en, mbi_itb_cam_en_pre,ftp_itb_cam_en_1}),
 .dout ({mbi_run_bf, ftp_mbi_icd_read_en_bf,ftp_mbi_ict_read_en_bf,
         mbi_icd_write_en_bf,mbi_ict_write_en_bf,
         mbi_cmpsel_bf[1:0],
         ftp_mbi_icv_read_en_bf, ftp_mbi_icv_write_en_bf, ftp_itb_cam_en_1,ftp_itb_cam_en_2}),
  .siclk(siclk),
  .soclk(soclk));

assign ftp_sel_icv_mbist_addr = ftp_mbi_icv_read_en_bf | ftp_mbi_icv_write_en_bf ;
assign ftp_ict_data_sel_bf[0] =  ftp_fill_req_q_bf & ~mbi_run_bf; 
assign ftp_ict_data_sel_bf[1] = ~ftp_fill_req_q_bf & ~mbi_run_bf; 
assign ftp_ict_data_sel_bf[2] =  mbi_run_bf ; 

assign ftp_ic_rd_req_bf = mbi_run_bf ? ftp_mbi_icd_read_en_bf  : (ftp_fetch_v_bf | (ic_rd_req_ff & ~ftp_fill_req_q_bf & asi_rd_ok)) ; 
assign ftp_ic_wr_req_bf = mbi_run_bf ? mbi_icd_write_en_bf     : (ftp_fill_req_q_bf | (ic_wr_req_ff & asi_wr_ok)) ; 
assign ftp_ic_wr_ps_en_bf = (mbi_run_bf & mbi_icd_write_en_bf) | (~mbi_run_bf & (ftp_fill_req_q_bf | ic_wr_req_ff)) | ~ifu_ic_pmen; 

assign ftp_tg_rd_req_bf = mbi_run_bf ? ftp_mbi_ict_read_en_bf  : (ftp_fetch_v_bf | (tg_rd_req_ff & ~ftp_fill_req_q_bf & asi_rd_ok)) ;
assign ftp_tg_wr_req_bf = mbi_run_bf ? mbi_ict_write_en_bf     : (ftp_fill_req_q_bf | (tg_wr_req_ff  & asi_wr_ok & ~inv_line_bf)) ; 
assign ftp_iv_rd_req_bf = mbi_run_bf ? ftp_mbi_icv_read_en_bf  : (ftp_fetch_v_bf | (tg_rd_req_ff & asi_rd_ok & ~ftp_fill_req_q_bf)) ;

assign ftp_tg_clk_en   = mbi_run_bf | tg_rd_req_ff | tg_wr_req_ff | ftp_fill_req_q_bf | ftp_fetch_v_bf | ~ifu_ic_pmen;
 
assign ftp_itt_rd_req_bf  = itt_rd_req_ff  & ~(reload | reload_last) & asi_rd_ok;
assign ftp_itd_rd_req_bf  = itd_rd_req_ff  & ~(reload | reload_last) & asi_rd_ok;
assign ftp_ith_det_req_bf = ith_det_req_ff & ~(reload | reload_last) & asi_rd_ok;
// assign ftp_itlb_probe_req_l = ~ith_det_req_ff ;
assign ftp_itlb_cam_vld_bf = (ftp_fetch_v_bf     & ~ftp_bypass_bf & ~mbi_run_bf) | 
                             (ftp_ith_det_req_bf                  & ~mbi_run_bf) | 
                             (ftp_itb_cam_en_2                    &  mbi_run_bf) ;

ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 itlb_cam_vld_reg  (
        .scan_in(itlb_cam_vld_reg_scanin),
        .scan_out(itlb_cam_vld_reg_scanout),
        .din    (ftp_itlb_cam_vld_bf ),
        .dout   (ftp_itlb_cam_vld_f ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

//////////////////////////////////////////////////////////////////////
// ITLB bypass control

ifu_ftu_ftp_ctl_msff_ctl_macro__width_8 itlb_bypass_lat  (
        .scan_in(itlb_bypass_lat_scanin),
        .scan_out(itlb_bypass_lat_scanout),
        .din    (tlu_itlb_bypass        [7:0] ),
        .dout   (itlb_bypass            [7:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign pre_bypass_bf[7:0] = ftp_ith_det_req_bf ? 8'h00 :
       itlb_bypass[7:0];


assign ftp_bypass_bf = (| (ftp_itb_fetch_thr_bf[7:0] & pre_bypass_bf[7:0]));
/////////////////////////////////////////////////////////////////////


assign ic_rd_req_done_in = (ic_rd_req_ff & ~ftp_fill_req_q_bf & asi_rd_ok);
ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 ic_rd_done_f_reg  (
 .scan_in(ic_rd_done_f_reg_scanin),
 .scan_out(ic_rd_done_f_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (ic_rd_req_done_in),
 .dout (ic_rd_req_done_f),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 ic_rd_done_c_reg  (
 .scan_in(ic_rd_done_c_reg_scanin),
 .scan_out(ic_rd_done_c_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (ic_rd_req_done_f),
 .dout (ic_rd_req_done_c),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 ic_rd_done_p_reg  (
 .scan_in(ic_rd_done_p_reg_scanin),
 .scan_out(ic_rd_done_p_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (ic_rd_req_done_c),
 .dout (ic_rd_req_done_p),
  .siclk(siclk),
  .soclk(soclk)
);

assign ic_wr_req_done_in = (ic_wr_req_ff & ~ftp_fill_req_q_bf & asi_wr_ok);
ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 ic_wr_done_f_reg  (
 .scan_in(ic_wr_done_f_reg_scanin),
 .scan_out(ic_wr_done_f_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (ic_wr_req_done_in),
 .dout (ic_wr_req_done_f),
  .siclk(siclk),
  .soclk(soclk)
);

assign ftp_asi_ic_rd_done     = ic_rd_req_done_p ;
assign ftp_asi_ic_wr_done     = ic_wr_req_done_f ;  

assign tg_rd_req_done_in = (tg_rd_req_ff & ~ftp_fill_req_q_bf & asi_rd_ok);
ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 tg_rd_done_f_reg  (
 .scan_in(tg_rd_done_f_reg_scanin),
 .scan_out(tg_rd_done_f_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (tg_rd_req_done_in),
 .dout (tg_rd_req_done_f),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 tg_rd_done_c_reg  (
 .scan_in(tg_rd_done_c_reg_scanin),
 .scan_out(tg_rd_done_c_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (tg_rd_req_done_f),
 .dout (tg_rd_req_done_c),
  .siclk(siclk),
  .soclk(soclk)
);


assign tg_wr_req_done_in = (tg_wr_req_ff & ~(ftp_fill_req_q_bf | inv_line_bf) & asi_wr_ok);
ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 tg_wr_done_f_reg  (
 .scan_in(tg_wr_done_f_reg_scanin),
 .scan_out(tg_wr_done_f_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (tg_wr_req_done_in),
 .dout (tg_wr_req_done_f),
  .siclk(siclk),
  .soclk(soclk)
);

assign ftp_asi_tg_rd_done     = tg_rd_req_done_c ;
assign ftp_asi_tg_wr_done     = tg_wr_req_done_f ;  
assign ftp_asi_tg_wr_req_hold = tg_wr_req_ff ;  

assign it_rd_req_done_in = ((itt_rd_req_ff | itd_rd_req_ff | ith_det_req_ff) & ~(reload | reload_last) & asi_rd_ok);
ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 it_rd_done_f_reg  (
 .scan_in(it_rd_done_f_reg_scanin),
 .scan_out(it_rd_done_f_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (it_rd_req_done_in),
 .dout (it_rd_req_done_f),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 it_rd_done_c_reg  (
 .scan_in(it_rd_done_c_reg_scanin),
 .scan_out(it_rd_done_c_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (it_rd_req_done_f),
 .dout (it_rd_req_done_c),
  .siclk(siclk),
  .soclk(soclk)
);
                           
assign asi_rd_done_in = ftp_asi_ic_rd_done | ftp_asi_tg_rd_done | ftp_asi_it_rd_done_p ;
assign asi_wr_done_in = ftp_asi_ic_wr_done | ftp_asi_tg_wr_done;


ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 asi_rd_done_reg  (
        .scan_in(asi_rd_done_reg_scanin),
        .scan_out(asi_rd_done_reg_scanout),
        .l1clk  (l1clk),
        .din( asi_rd_done_in),
        .dout( ftp_asi_rd_done),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 asi_wr_done_reg  (
        .scan_in(asi_wr_done_reg_scanin),
        .scan_out(asi_wr_done_reg_scanout),
        .l1clk  (l1clk),
        .din( asi_wr_done_in),
        .dout( ftp_asi_wr_done),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 asi_it_rd_done_reg  (
        .scan_in(asi_it_rd_done_reg_scanin),
        .scan_out(asi_it_rd_done_reg_scanout),
        .l1clk  (l1clk),
        .din    (ftp_asi_it_rd_done),
        .dout   (ftp_asi_it_rd_done_p),
  .siclk(siclk),
  .soclk(soclk)
);


////////////////////////////////////////////////////////////////////////////////////
assign next_sel_mbist_itb_cycle0 = mbi_run_bf & ~mbi_cmpsel_bf[1] & ~mbi_cmpsel_bf[0];
assign next_sel_mbist_itb_cycle1 = mbi_run_bf & ~mbi_cmpsel_bf[1] &  mbi_cmpsel_bf[0];
assign next_sel_mbist_itb_cycle2 = mbi_run_bf &  mbi_cmpsel_bf[1] & ~mbi_cmpsel_bf[0];
assign next_sel_mbist_itb_cycle3 = mbi_run_bf &  mbi_cmpsel_bf[1] &  mbi_cmpsel_bf[0];

assign next_sel_itlb_tag = (itt_rd_req_ff  & ~(reload | reload_last) & asi_rd_ok) ; 
ifu_ftu_ftp_ctl_msff_ctl_macro__width_5 itlb_sel_tag_f_reg  (
 .scan_in(itlb_sel_tag_f_reg_scanin),
 .scan_out(itlb_sel_tag_f_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  ({next_sel_itlb_tag,next_sel_mbist_itb_cycle0,next_sel_mbist_itb_cycle1,
         next_sel_mbist_itb_cycle2, next_sel_mbist_itb_cycle3}),
 .dout ({ftp_sel_itlb_tag_f,ftp_sel_mbist_itb_cycle0,ftp_sel_mbist_itb_cycle1,
         ftp_sel_mbist_itb_cycle2,ftp_sel_mbist_itb_cycle3}),
  .siclk(siclk),
  .soclk(soclk)
);
assign next_sel_itlb_data = (itd_rd_req_ff  & ~(reload | reload_last) & asi_rd_ok) ;
ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 itlb_sel_data_f_reg  (
 .scan_in(itlb_sel_data_f_reg_scanin),
 .scan_out(itlb_sel_data_f_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (next_sel_itlb_data),
 .dout (ftp_sel_itlb_data_f),
  .siclk(siclk),
  .soclk(soclk)
);
assign next_sel_itlb_pa = (ith_det_req_ff  & ~(reload | reload_last)  & asi_rd_ok) ;
ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 itlb_sel_pa_f_reg  (
 .scan_in(itlb_sel_pa_f_reg_scanin),
 .scan_out(itlb_sel_pa_f_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (next_sel_itlb_pa),
 .dout (ftp_sel_itlb_pa_f),
  .siclk(siclk),
  .soclk(soclk)
);

assign sel_itlb_tag_cntx0_f = ftp_sel_itlb_tag_f &  asi_sel_cntx_0 ;
assign sel_itlb_tag_cntx1_f = ftp_sel_itlb_tag_f & ~asi_sel_cntx_0 ;
ifu_ftu_ftp_ctl_msff_ctl_macro__width_4 itlb_sel_c_reg  (
 .scan_in(itlb_sel_c_reg_scanin),
 .scan_out(itlb_sel_c_reg_scanout),
 .l1clk(l1clk_pm1 ),
 .din  ({sel_itlb_tag_cntx0_f,sel_itlb_tag_cntx1_f,ftp_sel_itlb_data_f,ftp_sel_itlb_pa_f}),
 .dout ({ftp_sel_itlb_tag_cntx0_c,ftp_sel_itlb_tag_cntx1_c, ftp_sel_itlb_data_c,ftp_sel_itlb_pa_c}),
  .siclk(siclk),
  .soclk(soclk)
);

assign ftp_asi_it_rd_done     = it_rd_req_done_c ;

assign ftp_asi_mbist_access_bf = ic_wr_req_done_in | ic_rd_req_done_in | mbi_run_bf;

////////////////////////////////////////////////////////////////////////////////////
/// Killing the instructions can be moved to F and C stage for timing reasons later
////////////////////////////////////////////////////////////////////////////////////

assign trap_thread_g0[0] = ~tlu_trap_0_tid[1] & ~tlu_trap_0_tid[0] ;
assign trap_thread_g0[1] = ~tlu_trap_0_tid[1] &  tlu_trap_0_tid[0] ;
assign trap_thread_g0[2] =  tlu_trap_0_tid[1] & ~tlu_trap_0_tid[0] ;
assign trap_thread_g0[3] =  tlu_trap_0_tid[1] &  tlu_trap_0_tid[0] ;

assign trap_thread_g1[0] = ~tlu_trap_1_tid[1] & ~tlu_trap_1_tid[0] ;
assign trap_thread_g1[1] = ~tlu_trap_1_tid[1] &  tlu_trap_1_tid[0] ;
assign trap_thread_g1[2] =  tlu_trap_1_tid[1] & ~tlu_trap_1_tid[0] ;
assign trap_thread_g1[3] =  tlu_trap_1_tid[1] &  tlu_trap_1_tid[0] ;

assign thr0_trap_pcaddr_is_valid_bf  = tlu_trap_pc_0_valid  & trap_thread_g0[0] ;
assign thr1_trap_pcaddr_is_valid_bf  = tlu_trap_pc_0_valid  & trap_thread_g0[1] ;
assign thr2_trap_pcaddr_is_valid_bf  = tlu_trap_pc_0_valid  & trap_thread_g0[2] ;
assign thr3_trap_pcaddr_is_valid_bf  = tlu_trap_pc_0_valid  & trap_thread_g0[3] ;

assign thr4_trap_pcaddr_is_valid_bf  = tlu_trap_pc_1_valid  & trap_thread_g1[0] ;
assign thr5_trap_pcaddr_is_valid_bf  = tlu_trap_pc_1_valid  & trap_thread_g1[1] ;
assign thr6_trap_pcaddr_is_valid_bf  = tlu_trap_pc_1_valid  & trap_thread_g1[2] ;
assign thr7_trap_pcaddr_is_valid_bf  = tlu_trap_pc_1_valid  & trap_thread_g1[3] ;

assign load_flush_w[0] = dec_load_flush_w[0] & tid_dec_w[0] ;
assign load_flush_w[1] = dec_load_flush_w[0] & tid_dec_w[1] ;
assign load_flush_w[2] = dec_load_flush_w[0] & tid_dec_w[2] ;
assign load_flush_w[3] = dec_load_flush_w[0] & tid_dec_w[3] ;
assign load_flush_w[4] = dec_load_flush_w[1] & tid_dec_w[4] ;
assign load_flush_w[5] = dec_load_flush_w[1] & tid_dec_w[5] ;
assign load_flush_w[6] = dec_load_flush_w[1] & tid_dec_w[6] ;
assign load_flush_w[7] = dec_load_flush_w[1] & tid_dec_w[7] ;

assign ftp_thr0_trprdpc_sel_bf[0] =  thr0_trap_pcaddr_is_valid_bf ;
assign ftp_thr0_trprdpc_sel_bf[1] =  load_flush_w[0] & ~thr0_trap_pcaddr_is_valid_bf;
assign ftp_thr0_trprdpc_sel_bf[2] = ~load_flush_w[0] & ~thr0_trap_pcaddr_is_valid_bf ;

assign ftp_thr1_trprdpc_sel_bf[0] =  thr1_trap_pcaddr_is_valid_bf ;
assign ftp_thr1_trprdpc_sel_bf[1] =  load_flush_w[1] & ~thr1_trap_pcaddr_is_valid_bf;
assign ftp_thr1_trprdpc_sel_bf[2] = ~load_flush_w[1] & ~thr1_trap_pcaddr_is_valid_bf ;

assign ftp_thr2_trprdpc_sel_bf[0] =  thr2_trap_pcaddr_is_valid_bf ;
assign ftp_thr2_trprdpc_sel_bf[1] =  load_flush_w[2] & ~thr2_trap_pcaddr_is_valid_bf;
assign ftp_thr2_trprdpc_sel_bf[2] = ~load_flush_w[2] & ~thr2_trap_pcaddr_is_valid_bf ;

assign ftp_thr3_trprdpc_sel_bf[0] =  thr3_trap_pcaddr_is_valid_bf ;
assign ftp_thr3_trprdpc_sel_bf[1] =  load_flush_w[3] & ~thr3_trap_pcaddr_is_valid_bf;
assign ftp_thr3_trprdpc_sel_bf[2] = ~load_flush_w[3] & ~thr3_trap_pcaddr_is_valid_bf ;


assign ftp_thr4_trprdpc_sel_bf[0] =  thr4_trap_pcaddr_is_valid_bf ;
assign ftp_thr4_trprdpc_sel_bf[1] =  load_flush_w[4] & ~thr4_trap_pcaddr_is_valid_bf;
assign ftp_thr4_trprdpc_sel_bf[2] = ~load_flush_w[4] & ~thr4_trap_pcaddr_is_valid_bf ;

assign ftp_thr5_trprdpc_sel_bf[0] =  thr5_trap_pcaddr_is_valid_bf ;
assign ftp_thr5_trprdpc_sel_bf[1] =  load_flush_w[5] & ~thr5_trap_pcaddr_is_valid_bf;
assign ftp_thr5_trprdpc_sel_bf[2] = ~load_flush_w[5] & ~thr5_trap_pcaddr_is_valid_bf ;

assign ftp_thr6_trprdpc_sel_bf[0] =  thr6_trap_pcaddr_is_valid_bf ;
assign ftp_thr6_trprdpc_sel_bf[1] =  load_flush_w[6] & ~thr6_trap_pcaddr_is_valid_bf;
assign ftp_thr6_trprdpc_sel_bf[2] = ~load_flush_w[6] & ~thr6_trap_pcaddr_is_valid_bf ;

assign ftp_thr7_trprdpc_sel_bf[0] =  thr7_trap_pcaddr_is_valid_bf ;
assign ftp_thr7_trprdpc_sel_bf[1] =  load_flush_w[7] & ~thr7_trap_pcaddr_is_valid_bf;
assign ftp_thr7_trprdpc_sel_bf[2] = ~load_flush_w[7] & ~thr7_trap_pcaddr_is_valid_bf ;



assign thr0_red_no_br_bf = thr0_trap_pcaddr_is_valid_bf | load_flush_w[0]  ;
assign thr1_red_no_br_bf = thr1_trap_pcaddr_is_valid_bf | load_flush_w[1]  ;
assign thr2_red_no_br_bf = thr2_trap_pcaddr_is_valid_bf | load_flush_w[2]  ;
assign thr3_red_no_br_bf = thr3_trap_pcaddr_is_valid_bf | load_flush_w[3]  ;
assign thr4_red_no_br_bf = thr4_trap_pcaddr_is_valid_bf | load_flush_w[4]  ;
assign thr5_red_no_br_bf = thr5_trap_pcaddr_is_valid_bf | load_flush_w[5]  ;
assign thr6_red_no_br_bf = thr6_trap_pcaddr_is_valid_bf | load_flush_w[6]  ;
assign thr7_red_no_br_bf = thr7_trap_pcaddr_is_valid_bf | load_flush_w[7]  ;





ifu_ftu_ftp_ctl_msff_ctl_macro__width_8 thrx_redirect_reg  (
 .scan_in(thrx_redirect_reg_scanin),
 .scan_out(thrx_redirect_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  ({thr7_red_no_br_bf,thr6_red_no_br_bf,thr5_red_no_br_bf,thr4_red_no_br_bf,
         thr3_red_no_br_bf,thr2_red_no_br_bf,thr1_red_no_br_bf,thr0_red_no_br_bf}),
 .dout ({thr7_redirect_part_bf,thr6_redirect_part_bf,thr5_redirect_part_bf,thr4_redirect_part_bf,
         thr3_redirect_part_bf,thr2_redirect_part_bf,thr1_redirect_part_bf,thr0_redirect_part_bf}),
  .siclk(siclk),
  .soclk(soclk));

assign thr0_redirect_bf = thr0_redirect_part_bf | ftp_tlu_flush_f[0] | thr0_br_taken_ff ;
assign thr1_redirect_bf = thr1_redirect_part_bf | ftp_tlu_flush_f[1] | thr1_br_taken_ff ;
assign thr2_redirect_bf = thr2_redirect_part_bf | ftp_tlu_flush_f[2] | thr2_br_taken_ff ;
assign thr3_redirect_bf = thr3_redirect_part_bf | ftp_tlu_flush_f[3] | thr3_br_taken_ff ;
assign thr4_redirect_bf = thr4_redirect_part_bf | ftp_tlu_flush_f[4] | thr4_br_taken_ff ;
assign thr5_redirect_bf = thr5_redirect_part_bf | ftp_tlu_flush_f[5] | thr5_br_taken_ff ;
assign thr6_redirect_bf = thr6_redirect_part_bf | ftp_tlu_flush_f[6] | thr6_br_taken_ff ;
assign thr7_redirect_bf = thr7_redirect_part_bf | ftp_tlu_flush_f[7] | thr7_br_taken_ff ;


assign kill_fetch_fv_bf     =  (((thr0_red_no_br_bf | agc_thr0_micro_flush_unq_c  )
                                                    & ftp_curr_fetch_thr_bf[0])|
                                ((thr1_red_no_br_bf | agc_thr1_micro_flush_unq_c  )
                                                    & ftp_curr_fetch_thr_bf[1])|
                                ((thr2_red_no_br_bf | agc_thr2_micro_flush_unq_c  )
                                                    & ftp_curr_fetch_thr_bf[2])|
                                ((thr3_red_no_br_bf | agc_thr3_micro_flush_unq_c  )
                                                    & ftp_curr_fetch_thr_bf[3])|
                                ((thr4_red_no_br_bf | agc_thr4_micro_flush_unq_c  )
                                                    & ftp_curr_fetch_thr_bf[4])|
                                ((thr5_red_no_br_bf | agc_thr5_micro_flush_unq_c  )
                                                    & ftp_curr_fetch_thr_bf[5])|
                                ((thr6_red_no_br_bf | agc_thr6_micro_flush_unq_c  )
                                                    & ftp_curr_fetch_thr_bf[6])|
                                ((thr7_red_no_br_bf | agc_thr7_micro_flush_unq_c  )
                                                    & ftp_curr_fetch_thr_bf[7])) ;

assign ftp_fetch_v_bf         = (hp_pickready  )  ; 


assign next_fetch_fv_unq_bf = ((hp_pickready  & ~kill_fetch_fv_bf)  );


ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 fetch_v_f_reg  (
 .scan_in(fetch_v_f_reg_scanin),
 .scan_out(fetch_v_f_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (next_fetch_fv_unq_bf),
 .dout (ftp_fetch_v_unq_f),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 fetch_v_f_dup_reg  (
 .scan_in(fetch_v_f_dup_reg_scanin),
 .scan_out(fetch_v_f_dup_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (next_fetch_fv_unq_bf),
 .dout (ftp_fetch_v_unq_dup_f),
  .siclk(siclk),
  .soclk(soclk)
);


assign br_redirect_disqual = (br_taken_ff[0]  & br0_matches_curr_f)     | 
                             (br_taken_ff[1]  & br1_matches_curr_f)     ; 

assign br_redirect_dup_disqual = (br_taken_ff[0]  & br0_matches_curr_f)     | 
                             (br_taken_ff[1]  & br1_matches_curr_f)     ; 

assign ftp_fetch_v_dup_f = ftp_fetch_v_unq_dup_f & ~br_redirect_dup_disqual; 
assign ftp_fetch_v_f     = ftp_fetch_v_unq_f & ~br_redirect_disqual; 

assign next_fetch_v_c_f = ftp_fetch_v_dup_f ; // 
ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 fetch_v_c_reg  (
 .scan_in(fetch_v_c_reg_scanin),
 .scan_out(fetch_v_c_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (next_fetch_v_c_f),
 .dout (ftp_fetch_v_c_unq),
  .siclk(siclk),
  .soclk(soclk)
);

assign ftp_fetch_v_c = ftp_fetch_v_c_unq & ~agc_kill_fetch_cv_c ;
assign next_enabled_thread[7:0] =  spc_core_running_status[7:0] ;  
ifu_ftu_ftp_ctl_msff_ctl_macro__width_10 enabled_thr_reg  (
 .scan_in(enabled_thr_reg_scanin),
 .scan_out(enabled_thr_reg_scanout),
 .l1clk(l1clk),
 .din  ({next_enabled_thread[7:0],lsu_ifu_ftu_pmen,lsu_ic_pmen}),
 .dout ({enabled_threads[7:0],ifu_ftu_pmen,ifu_ic_pmen}),
  .siclk(siclk),
  .soclk(soclk)
);


assign ftp_any_thr_clken = |enabled_threads[7:0] | (~ifu_ftu_pmen) | mbi_run_bf;

 

 
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
assign thr0_br_taken_ff = br_taken_ff[0] & ~tid0_m[1] & ~tid0_m[0] ; 
assign thr1_br_taken_ff = br_taken_ff[0] & ~tid0_m[1] &  tid0_m[0] ; 
assign thr2_br_taken_ff = br_taken_ff[0] &  tid0_m[1] & ~tid0_m[0] ; 
assign thr3_br_taken_ff = br_taken_ff[0] &  tid0_m[1] &  tid0_m[0] ; 
assign thr4_br_taken_ff = br_taken_ff[1] & ~tid1_m[1] & ~tid1_m[0] ; 
assign thr5_br_taken_ff = br_taken_ff[1] & ~tid1_m[1] &  tid1_m[0] ; 
assign thr6_br_taken_ff = br_taken_ff[1] &  tid1_m[1] & ~tid1_m[0] ; 
assign thr7_br_taken_ff = br_taken_ff[1] &  tid1_m[1] &  tid1_m[0] ; 


assign ftp_thr0_sel_br_bf = br_taken_ff[0] & ~tid0_m[1] & ~tid0_m[0] ; 
assign ftp_thr1_sel_br_bf = br_taken_ff[0] & ~tid0_m[1] &  tid0_m[0] ; 
assign ftp_thr2_sel_br_bf = br_taken_ff[0] &  tid0_m[1] & ~tid0_m[0] ; 
assign ftp_thr3_sel_br_bf = br_taken_ff[0] &  tid0_m[1] &  tid0_m[0] ; 

assign ftp_thr4_sel_br_bf = br_taken_ff[1] & ~tid1_m[1] & ~tid1_m[0] ; 
assign ftp_thr5_sel_br_bf = br_taken_ff[1] & ~tid1_m[1] &  tid1_m[0] ; 
assign ftp_thr6_sel_br_bf = br_taken_ff[1] &  tid1_m[1] & ~tid1_m[0] ; 
assign ftp_thr7_sel_br_bf = br_taken_ff[1] &  tid1_m[1] &  tid1_m[0] ; 


assign br_room_reset[0] = thr0_br_taken_ff & ~ftp_curr_fetch_thr_bf[0]; 
assign br_room_reset[1] = thr1_br_taken_ff & ~ftp_curr_fetch_thr_bf[1]; 
assign br_room_reset[2] = thr2_br_taken_ff & ~ftp_curr_fetch_thr_bf[2]; 
assign br_room_reset[3] = thr3_br_taken_ff & ~ftp_curr_fetch_thr_bf[3]; 
assign br_room_reset[4] = thr4_br_taken_ff & ~ftp_curr_fetch_thr_bf[4]; 
assign br_room_reset[5] = thr5_br_taken_ff & ~ftp_curr_fetch_thr_bf[5]; 
assign br_room_reset[6] = thr6_br_taken_ff & ~ftp_curr_fetch_thr_bf[6]; 
assign br_room_reset[7] = thr7_br_taken_ff & ~ftp_curr_fetch_thr_bf[7]; 
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
// Generate buffer space available, taking into consideration any     //
// fetches in progress.                                               //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
// Room should refelect the actual data in flight including by_pass  that will be at C//
// two cycles from now.                                                               //
////////////////////////////////////////////////////////////////////////////////////////
assign ftp_thr0_fetch_v_wo_br_bf =  ftp_curr_fetch_thr_bf[0] | thr0_by_pass_2_cycles_at_c;
assign ftp_thr1_fetch_v_wo_br_bf =  ftp_curr_fetch_thr_bf[1] | thr1_by_pass_2_cycles_at_c;
assign ftp_thr2_fetch_v_wo_br_bf =  ftp_curr_fetch_thr_bf[2] | thr2_by_pass_2_cycles_at_c;
assign ftp_thr3_fetch_v_wo_br_bf =  ftp_curr_fetch_thr_bf[3] | thr3_by_pass_2_cycles_at_c;
assign ftp_thr4_fetch_v_wo_br_bf =  ftp_curr_fetch_thr_bf[4] | thr4_by_pass_2_cycles_at_c;
assign ftp_thr5_fetch_v_wo_br_bf =  ftp_curr_fetch_thr_bf[5] | thr5_by_pass_2_cycles_at_c;
assign ftp_thr6_fetch_v_wo_br_bf =  ftp_curr_fetch_thr_bf[6] | thr6_by_pass_2_cycles_at_c;
assign ftp_thr7_fetch_v_wo_br_bf =  ftp_curr_fetch_thr_bf[7] | thr7_by_pass_2_cycles_at_c;



////////////////////////////////////////////////////////////////////////////////////////
// Room should refelect the actual data in flight including by_pass  that will be at C//
// next cycle.                                                                        //
////////////////////////////////////////////////////////////////////////////////////////
assign ftp_thr0_fetch_v_f = (ftp_curr_fetch_thr_f[0] & ftp_fetch_v_dup_f ) | (thr0_by_pass_next_cycle_at_c); 
assign ftp_thr1_fetch_v_f = (ftp_curr_fetch_thr_f[1] & ftp_fetch_v_dup_f ) | (thr1_by_pass_next_cycle_at_c); 
assign ftp_thr2_fetch_v_f = (ftp_curr_fetch_thr_f[2] & ftp_fetch_v_dup_f ) | (thr2_by_pass_next_cycle_at_c);
assign ftp_thr3_fetch_v_f = (ftp_curr_fetch_thr_f[3] & ftp_fetch_v_dup_f ) | (thr3_by_pass_next_cycle_at_c);
assign ftp_thr4_fetch_v_f = (ftp_curr_fetch_thr_f[4] & ftp_fetch_v_dup_f ) | (thr4_by_pass_next_cycle_at_c);
assign ftp_thr5_fetch_v_f = (ftp_curr_fetch_thr_f[5] & ftp_fetch_v_dup_f ) | (thr5_by_pass_next_cycle_at_c);
assign ftp_thr6_fetch_v_f = (ftp_curr_fetch_thr_f[6] & ftp_fetch_v_dup_f ) | (thr6_by_pass_next_cycle_at_c);
assign ftp_thr7_fetch_v_f = (ftp_curr_fetch_thr_f[7] & ftp_fetch_v_dup_f ) | (thr7_by_pass_next_cycle_at_c);
////////////////////////////////////////////////////////////////////////////////////////
// Room should refelect the actual data in flight including by_pass at C              //
////////////////////////////////////////////////////////////////////////////////////////
assign ftp_thr0_fetch_v_c = (ftp_curr_fetch_thr_c[0] & ftp_fetch_v_c & ~ftp_tlu_flush_f[0]) | thr0_by_pass_is_at_c ; 
assign ftp_thr1_fetch_v_c = (ftp_curr_fetch_thr_c[1] & ftp_fetch_v_c & ~ftp_tlu_flush_f[1]) | thr1_by_pass_is_at_c ;
assign ftp_thr2_fetch_v_c = (ftp_curr_fetch_thr_c[2] & ftp_fetch_v_c & ~ftp_tlu_flush_f[2]) | thr2_by_pass_is_at_c ;
assign ftp_thr3_fetch_v_c = (ftp_curr_fetch_thr_c[3] & ftp_fetch_v_c & ~ftp_tlu_flush_f[3]) | thr3_by_pass_is_at_c ;
assign ftp_thr4_fetch_v_c = (ftp_curr_fetch_thr_c[4] & ftp_fetch_v_c & ~ftp_tlu_flush_f[4]) | thr4_by_pass_is_at_c ;
assign ftp_thr5_fetch_v_c = (ftp_curr_fetch_thr_c[5] & ftp_fetch_v_c & ~ftp_tlu_flush_f[5]) | thr5_by_pass_is_at_c ;
assign ftp_thr6_fetch_v_c = (ftp_curr_fetch_thr_c[6] & ftp_fetch_v_c & ~ftp_tlu_flush_f[6]) | thr6_by_pass_is_at_c ;
assign ftp_thr7_fetch_v_c = (ftp_curr_fetch_thr_c[7] & ftp_fetch_v_c & ~ftp_tlu_flush_f[7]) | thr7_by_pass_is_at_c ;


assign thr0_is_empty_c = ibu_empty[0] ;
assign thr1_is_empty_c = ibu_empty[1] ;
assign thr2_is_empty_c = ibu_empty[2] ;
assign thr3_is_empty_c = ibu_empty[3] ;
assign thr4_is_empty_c = ibu_empty[4] ;
assign thr5_is_empty_c = ibu_empty[5] ;
assign thr6_is_empty_c = ibu_empty[6] ;
assign thr7_is_empty_c = ibu_empty[7] ;



assign thr0_room_4ormore    = ibu_room_4ormore[0] ;
assign thr1_room_4ormore    = ibu_room_4ormore[1] ;
assign thr2_room_4ormore    = ibu_room_4ormore[2] ;
assign thr3_room_4ormore    = ibu_room_4ormore[3] ;
assign thr4_room_4ormore    = ibu_room_4ormore[4] ;
assign thr5_room_4ormore    = ibu_room_4ormore[5] ;
assign thr6_room_4ormore    = ibu_room_4ormore[6] ;
assign thr7_room_4ormore    = ibu_room_4ormore[7] ;



assign ftp_thr0_room_is_less_t_3 = ((!thr0_is_empty_c     & !thr0_room_4ormore)  | 
                                    ( ftp_thr0_fetch_v_wo_br_bf     &  ftp_thr0_fetch_v_f & ftp_thr0_fetch_v_c) |
                                    ( ftp_thr0_fetch_v_wo_br_bf     &  ftp_thr0_fetch_v_f & thr0_is_empty_c ) | 
                                    ( ftp_thr0_fetch_v_wo_br_bf     &  ftp_thr0_fetch_v_c & thr0_is_empty_c ) | 
                                    ( ftp_thr0_fetch_v_f  &  ftp_thr0_fetch_v_c & thr0_is_empty_c ) | 
                                    (!thr0_is_empty_c     &  thr0_room_4ormore   &  (ftp_thr0_fetch_v_wo_br_bf ))| 
                                    (!thr0_is_empty_c     &  thr0_room_4ormore   &  ftp_thr0_fetch_v_f) | 
                                    (!thr0_is_empty_c     &  thr0_room_4ormore   &  ftp_thr0_fetch_v_c)) & ~load_flush_w[0] & ~br_room_reset[0];



assign ftp_thr1_room_is_less_t_3 = ((!thr1_is_empty_c     & !thr1_room_4ormore)  | 
                                    ( ftp_thr1_fetch_v_wo_br_bf          &  ftp_thr1_fetch_v_f  & ftp_thr1_fetch_v_c) |
                                    ( ftp_thr1_fetch_v_wo_br_bf          &  ftp_thr1_fetch_v_f  & thr1_is_empty_c ) | 
                                    ( ftp_thr1_fetch_v_wo_br_bf          &  ftp_thr1_fetch_v_c  & thr1_is_empty_c ) | 
                                    ( ftp_thr1_fetch_v_f  &  ftp_thr1_fetch_v_c  & thr1_is_empty_c ) | 
                                    (!thr1_is_empty_c     &  thr1_room_4ormore   & (ftp_thr1_fetch_v_wo_br_bf ))| 
                                    (!thr1_is_empty_c     &  thr1_room_4ormore   & ftp_thr1_fetch_v_f) | 
                                    (!thr1_is_empty_c     &  thr1_room_4ormore   & ftp_thr1_fetch_v_c)) & ~load_flush_w[1] & ~br_room_reset[1];


assign ftp_thr2_room_is_less_t_3 = ((!thr2_is_empty_c    & !thr2_room_4ormore)  | 
                                   ( ftp_thr2_fetch_v_wo_br_bf          &  ftp_thr2_fetch_v_f & ftp_thr2_fetch_v_c) |
                                   ( ftp_thr2_fetch_v_wo_br_bf          &  ftp_thr2_fetch_v_f & thr2_is_empty_c ) | 
                                   ( ftp_thr2_fetch_v_wo_br_bf          &  ftp_thr2_fetch_v_c & thr2_is_empty_c ) | 
                                   ( ftp_thr2_fetch_v_f  &  ftp_thr2_fetch_v_c & thr2_is_empty_c ) | 
                                   ( !thr2_is_empty_c    & thr2_room_4ormore  &  (ftp_thr2_fetch_v_wo_br_bf ))| 
                                   ( !thr2_is_empty_c    & thr2_room_4ormore  &  ftp_thr2_fetch_v_f) | 
                                   ( !thr2_is_empty_c    & thr2_room_4ormore  &  ftp_thr2_fetch_v_c)) & ~load_flush_w[2] & ~br_room_reset[2];


assign ftp_thr3_room_is_less_t_3 = ((!thr3_is_empty_c    & !thr3_room_4ormore)  | 
                                   ( ftp_thr3_fetch_v_wo_br_bf          &  ftp_thr3_fetch_v_f & ftp_thr3_fetch_v_c) |
                                   ( ftp_thr3_fetch_v_wo_br_bf          &  ftp_thr3_fetch_v_f & thr3_is_empty_c ) | 
                                   ( ftp_thr3_fetch_v_wo_br_bf          &  ftp_thr3_fetch_v_c & thr3_is_empty_c ) | 
                                   ( ftp_thr3_fetch_v_f  &  ftp_thr3_fetch_v_c & thr3_is_empty_c ) | 
                                   ( !thr3_is_empty_c    & thr3_room_4ormore  &  (ftp_thr3_fetch_v_wo_br_bf ))| 
                                   ( !thr3_is_empty_c    & thr3_room_4ormore  &  ftp_thr3_fetch_v_f) | 
                                   ( !thr3_is_empty_c    & thr3_room_4ormore  &  ftp_thr3_fetch_v_c)) & ~load_flush_w[3] & ~br_room_reset[3];


assign ftp_thr4_room_is_less_t_3 = ((!thr4_is_empty_c    & !thr4_room_4ormore)  | 
                                   ( ftp_thr4_fetch_v_wo_br_bf          &  ftp_thr4_fetch_v_f & ftp_thr4_fetch_v_c) |
                                   ( ftp_thr4_fetch_v_wo_br_bf          &  ftp_thr4_fetch_v_f & thr4_is_empty_c ) | 
                                   ( ftp_thr4_fetch_v_wo_br_bf          &  ftp_thr4_fetch_v_c & thr4_is_empty_c ) | 
                                   ( ftp_thr4_fetch_v_f  &  ftp_thr4_fetch_v_c & thr4_is_empty_c ) | 
                                   ( !thr4_is_empty_c    & thr4_room_4ormore  &  (ftp_thr4_fetch_v_wo_br_bf ))| 
                                   ( !thr4_is_empty_c    & thr4_room_4ormore  &  ftp_thr4_fetch_v_f) | 
                                   ( !thr4_is_empty_c    & thr4_room_4ormore  &  ftp_thr4_fetch_v_c)) & ~load_flush_w[4] & ~br_room_reset[4];


assign ftp_thr5_room_is_less_t_3 = ((!thr5_is_empty_c    & !thr5_room_4ormore)  | 
                                   ( ftp_thr5_fetch_v_wo_br_bf          &  ftp_thr5_fetch_v_f & ftp_thr5_fetch_v_c) |
                                   ( ftp_thr5_fetch_v_wo_br_bf          &  ftp_thr5_fetch_v_f & thr5_is_empty_c ) | 
                                   ( ftp_thr5_fetch_v_wo_br_bf          &  ftp_thr5_fetch_v_c & thr5_is_empty_c ) | 
                                   ( ftp_thr5_fetch_v_f  &  ftp_thr5_fetch_v_c & thr5_is_empty_c ) | 
                                   ( !thr5_is_empty_c    & thr5_room_4ormore  &  (ftp_thr5_fetch_v_wo_br_bf ))| 
                                   ( !thr5_is_empty_c    & thr5_room_4ormore  &  ftp_thr5_fetch_v_f) | 
                                   ( !thr5_is_empty_c    & thr5_room_4ormore  &  ftp_thr5_fetch_v_c)) & ~load_flush_w[5] & ~br_room_reset[5];


assign ftp_thr6_room_is_less_t_3 = ((!thr6_is_empty_c    & !thr6_room_4ormore)  | 
                                   ( ftp_thr6_fetch_v_wo_br_bf          &  ftp_thr6_fetch_v_f & ftp_thr6_fetch_v_c) |
                                   ( ftp_thr6_fetch_v_wo_br_bf          &  ftp_thr6_fetch_v_f & thr6_is_empty_c ) | 
                                   ( ftp_thr6_fetch_v_wo_br_bf          &  ftp_thr6_fetch_v_c & thr6_is_empty_c ) | 
                                   ( ftp_thr6_fetch_v_f  &  ftp_thr6_fetch_v_c & thr6_is_empty_c ) | 
                                   ( !thr6_is_empty_c    & thr6_room_4ormore  &  (ftp_thr6_fetch_v_wo_br_bf ))| 
                                   ( !thr6_is_empty_c    & thr6_room_4ormore  &  ftp_thr6_fetch_v_f) | 
                                   ( !thr6_is_empty_c    & thr6_room_4ormore  &  ftp_thr6_fetch_v_c)) & ~load_flush_w[6] & ~br_room_reset[6];


assign ftp_thr7_room_is_less_t_3 = ((!thr7_is_empty_c    & !thr7_room_4ormore)  | 
                                   ( ftp_thr7_fetch_v_wo_br_bf          &  ftp_thr7_fetch_v_f & ftp_thr7_fetch_v_c) |
                                   ( ftp_thr7_fetch_v_wo_br_bf          &  ftp_thr7_fetch_v_f & thr7_is_empty_c ) | 
                                   ( ftp_thr7_fetch_v_wo_br_bf          &  ftp_thr7_fetch_v_c & thr7_is_empty_c ) | 
                                   ( ftp_thr7_fetch_v_f  &  ftp_thr7_fetch_v_c & thr7_is_empty_c ) | 
                                   ( !thr7_is_empty_c    & thr7_room_4ormore  & (ftp_thr7_fetch_v_wo_br_bf ))| 
                                   ( !thr7_is_empty_c    & thr7_room_4ormore  & ftp_thr7_fetch_v_f) | 
                                   ( !thr7_is_empty_c    & thr7_room_4ormore  & ftp_thr7_fetch_v_c)) & ~load_flush_w[7] & ~br_room_reset[7];




assign ready_hp_in[0] = tsm_thr0_ready_hp_bf_in & ~ftp_thr0_room_is_less_t_3 ; 
assign ready_hp_in[1] = tsm_thr1_ready_hp_bf_in & ~ftp_thr1_room_is_less_t_3 ; 
assign ready_hp_in[2] = tsm_thr2_ready_hp_bf_in & ~ftp_thr2_room_is_less_t_3 ; 
assign ready_hp_in[3] = tsm_thr3_ready_hp_bf_in & ~ftp_thr3_room_is_less_t_3 ; 
assign ready_hp_in[4] = tsm_thr4_ready_hp_bf_in & ~ftp_thr4_room_is_less_t_3 ; 
assign ready_hp_in[5] = tsm_thr5_ready_hp_bf_in & ~ftp_thr5_room_is_less_t_3 ; 
assign ready_hp_in[6] = tsm_thr6_ready_hp_bf_in & ~ftp_thr6_room_is_less_t_3 ; 
assign ready_hp_in[7] = tsm_thr7_ready_hp_bf_in & ~ftp_thr7_room_is_less_t_3 ; 

/// To keep old zero_in files happy
assign tsm_thr0_ready_hp_bf = ready_hp_bf[0];
assign tsm_thr1_ready_hp_bf = ready_hp_bf[1];
assign tsm_thr2_ready_hp_bf = ready_hp_bf[2];
assign tsm_thr3_ready_hp_bf = ready_hp_bf[3];
assign tsm_thr4_ready_hp_bf = ready_hp_bf[4];
assign tsm_thr5_ready_hp_bf = ready_hp_bf[5];
assign tsm_thr6_ready_hp_bf = ready_hp_bf[6];
assign tsm_thr7_ready_hp_bf = ready_hp_bf[7];

assign ftp_unused[7:0] = {tsm_thr7_ready_hp_bf, tsm_thr6_ready_hp_bf,
                          tsm_thr5_ready_hp_bf, tsm_thr4_ready_hp_bf,
                          tsm_thr3_ready_hp_bf, tsm_thr2_ready_hp_bf,
                          tsm_thr1_ready_hp_bf, tsm_thr0_ready_hp_bf} ;

ifu_ftu_ftp_ctl_msff_ctl_macro__width_8 ready_fp_reg  (
 .scan_in(ready_fp_reg_scanin),
 .scan_out(ready_fp_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (ready_hp_in[7:0]),
 .dout (ready_hp_bf[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);


assign ftp_reset_fill_wait = tsm_thr0_fill_rdy0 |
                       tsm_thr1_fill_rdy0 | 
                       tsm_thr2_fill_rdy0 | 
                       tsm_thr3_fill_rdy0 | 
                       tsm_thr4_fill_rdy0 | 
                       tsm_thr5_fill_rdy0 | 
                       tsm_thr6_fill_rdy0 | 
                       tsm_thr7_fill_rdy0 ; 



///////////////////////////////////////////////////////////
// By_pass for each thread should be included in the room 
// calculations.
///////////////////////////////////////////////////////////
assign next_by_pass_sel_bbf[0] = cmu_thr0_data_ready;
assign next_by_pass_sel_bbf[1] = cmu_thr1_data_ready;
assign next_by_pass_sel_bbf[2] = cmu_thr2_data_ready;
assign next_by_pass_sel_bbf[3] = cmu_thr3_data_ready;
assign next_by_pass_sel_bbf[4] = cmu_thr4_data_ready;
assign next_by_pass_sel_bbf[5] = cmu_thr5_data_ready;
assign next_by_pass_sel_bbf[6] = cmu_thr6_data_ready;
assign next_by_pass_sel_bbf[7] = cmu_thr7_data_ready;

ifu_ftu_ftp_ctl_msff_ctl_macro__width_8 cmu_fill_byp_thread_reg  (
 .scan_in(cmu_fill_byp_thread_reg_scanin),
 .scan_out(cmu_fill_byp_thread_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (next_by_pass_sel_bbf[7:0]),
 .dout (by_pass_sel_bf[7:0]),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_ftp_ctl_msff_ctl_macro__width_8 by_pass_sel_f_reg  (
 .scan_in(by_pass_sel_f_reg_scanin),
 .scan_out(by_pass_sel_f_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (by_pass_sel_bf[7:0]),
 .dout (by_pass_sel_f[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_ftu_ftp_ctl_msff_ctl_macro__width_8 by_pass_sel_c_reg  (
 .scan_in(by_pass_sel_c_reg_scanin),
 .scan_out(by_pass_sel_c_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (by_pass_sel_f[7:0]),
 .dout (by_pass_sel_c[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////////////////////////////////////////////////
// Generate by_pass signals                                                                  //
///////////////////////////////////////////////////////////////////////////////////////////////
assign thr0_kill_by_pass_bbf = cmu_thr0_data_ready & (tsm_thr0_ignore_by_pass | thr0_redirect_bf) ;
assign thr1_kill_by_pass_bbf = cmu_thr1_data_ready & (tsm_thr1_ignore_by_pass | thr1_redirect_bf) ;
assign thr2_kill_by_pass_bbf = cmu_thr2_data_ready & (tsm_thr2_ignore_by_pass | thr2_redirect_bf) ;
assign thr3_kill_by_pass_bbf = cmu_thr3_data_ready & (tsm_thr3_ignore_by_pass | thr3_redirect_bf) ;
assign thr4_kill_by_pass_bbf = cmu_thr4_data_ready & (tsm_thr4_ignore_by_pass | thr4_redirect_bf) ;
assign thr5_kill_by_pass_bbf = cmu_thr5_data_ready & (tsm_thr5_ignore_by_pass | thr5_redirect_bf) ;
assign thr6_kill_by_pass_bbf = cmu_thr6_data_ready & (tsm_thr6_ignore_by_pass | thr6_redirect_bf) ;
assign thr7_kill_by_pass_bbf = cmu_thr7_data_ready & (tsm_thr7_ignore_by_pass | thr7_redirect_bf) ;

assign byp_valid_in = cmu_any_data_ready & ~( thr0_kill_by_pass_bbf |
                                              thr1_kill_by_pass_bbf |
                                              thr2_kill_by_pass_bbf |
                                              thr3_kill_by_pass_bbf |
                                              thr4_kill_by_pass_bbf |
                                              thr5_kill_by_pass_bbf |
                                              thr6_kill_by_pass_bbf |
                                              thr7_kill_by_pass_bbf ) ;

ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 byp_valid_reg  (
  .scan_in(byp_valid_reg_scanin),
  .scan_out(byp_valid_reg_scanout),
  .l1clk( l1clk_pm1  ),
  .din  (byp_valid_in),
  .dout (ftp_byp_valid),
  .siclk(siclk),
  .soclk(soclk));


 ifu_ftu_ftp_ctl_msff_ctl_macro__width_8 thrx_kill_by_pass_reg  (
  .scan_in(thrx_kill_by_pass_reg_scanin),
  .scan_out(thrx_kill_by_pass_reg_scanout),
  .l1clk( l1clk  ),
  .din  ({thr7_kill_by_pass_bbf,thr6_kill_by_pass_bbf,thr5_kill_by_pass_bbf,thr4_kill_by_pass_bbf,
          thr3_kill_by_pass_bbf,thr2_kill_by_pass_bbf,thr1_kill_by_pass_bbf,thr0_kill_by_pass_bbf}),
  .dout ({thr7_kill_by_pass_bf,thr6_kill_by_pass_bf,thr5_kill_by_pass_bf,thr4_kill_by_pass_bf,
          thr3_kill_by_pass_bf,thr2_kill_by_pass_bf,thr1_kill_by_pass_bf,thr0_kill_by_pass_bf}),
  .siclk(siclk),
  .soclk(soclk));

assign kill2_by_pass_bf  = (by_pass_sel_bf[0] & thr0_redirect_bf) |
                           (by_pass_sel_bf[1] & thr1_redirect_bf) |
                           (by_pass_sel_bf[2] & thr2_redirect_bf) |
                           (by_pass_sel_bf[3] & thr3_redirect_bf) |
                           (by_pass_sel_bf[4] & thr4_redirect_bf) |
                           (by_pass_sel_bf[5] & thr5_redirect_bf) |
                           (by_pass_sel_bf[6] & thr6_redirect_bf) |
                           (by_pass_sel_bf[7] & thr7_redirect_bf) ;

assign bypass_thread_killed = thr7_kill_by_pass_bf | thr6_kill_by_pass_bf | thr5_kill_by_pass_bf |
                              thr4_kill_by_pass_bf | thr3_kill_by_pass_bf | thr2_kill_by_pass_bf |
                              thr1_kill_by_pass_bf | thr0_kill_by_pass_bf | kill2_by_pass_bf     ;

assign by_pass_valid_bf = ftp_byp_valid & ~bypass_thread_killed ;

assign prev_by_pass_at_cycle_1 = cycle_2_by_pass_ok_f | cycle_3_by_pass_ok_c ;
assign prev_by_pass_at_cycle_2 = cycle_3_by_pass_ok_f ;

assign cycle_2_by_pass_ok_bf=  ((ftp_fetch_v_c_unq | prev_by_pass_at_cycle_1)  & ~(ftp_fetch_v_dup_f | prev_by_pass_at_cycle_2) & by_pass_valid_bf);
assign cycle_3_by_pass_ok_bf=  ((ftp_fetch_v_c_unq | prev_by_pass_at_cycle_1)  &  (ftp_fetch_v_dup_f | prev_by_pass_at_cycle_2) & by_pass_valid_bf) ;

// Cycle_2
 ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 cycle_2_by_pass_f_reg  (
  .scan_in(cycle_2_by_pass_f_reg_scanin),
  .scan_out(cycle_2_by_pass_f_reg_scanout),
  .l1clk( l1clk_pm1  ),
  .din  (cycle_2_by_pass_ok_bf),
  .dout (cycle_2_by_pass_ok_f),
  .siclk(siclk),
  .soclk(soclk));

// Cycle_3
 ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 cycle_3_by_pass_f_reg  (
  .scan_in(cycle_3_by_pass_f_reg_scanin),
  .scan_out(cycle_3_by_pass_f_reg_scanout),
  .l1clk( l1clk_pm1  ),
  .din  (cycle_3_by_pass_ok_bf),
  .dout (cycle_3_by_pass_ok_f),
  .siclk(siclk),
  .soclk(soclk));

 ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 cycle_3_by_pass_c_reg  (
  .scan_in(cycle_3_by_pass_c_reg_scanin),
  .scan_out(cycle_3_by_pass_c_reg_scanout),
  .l1clk( l1clk_pm1  ),
  .din  (cycle_3_by_pass_ok_f),
  .dout (cycle_3_by_pass_ok_c),
  .siclk(siclk),
  .soclk(soclk));

///////////////////////////////////////////////////////////////////////////////////////////////

ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 by_pass_v_f_reg  (
 .scan_in(by_pass_v_f_reg_scanin),
 .scan_out(by_pass_v_f_reg_scanout),
 .l1clk( l1clk_pm1  ),
 .din  (by_pass_valid_bf),
 .dout (by_pass_valid_unq_f),
  .siclk(siclk),
  .soclk(soclk));


assign by_pass_valid_f = by_pass_valid_unq_f & ~bypass_thread_redirected_p_f ;
assign bypass_thread_redirected_p_f = ((thr0_redirect_bf) & by_pass_sel_f[0]) |
                                      ((thr1_redirect_bf) & by_pass_sel_f[1]) |
                                      ((thr2_redirect_bf) & by_pass_sel_f[2]) |
                                      ((thr3_redirect_bf) & by_pass_sel_f[3]) |
                                      ((thr4_redirect_bf) & by_pass_sel_f[4]) |
                                      ((thr5_redirect_bf) & by_pass_sel_f[5]) |
                                      ((thr6_redirect_bf) & by_pass_sel_f[6]) |
                                      ((thr7_redirect_bf) & by_pass_sel_f[7]) ;


assign bypass_thread_redirected_f = ((thr0_red_no_br_bf | thr0_redirect_bf) & by_pass_sel_f[0]) |
                                    ((thr1_red_no_br_bf | thr1_redirect_bf) & by_pass_sel_f[1]) |
                                    ((thr2_red_no_br_bf | thr2_redirect_bf) & by_pass_sel_f[2]) |
                                    ((thr3_red_no_br_bf | thr3_redirect_bf) & by_pass_sel_f[3]) |
                                    ((thr4_red_no_br_bf | thr4_redirect_bf) & by_pass_sel_f[4]) |
                                    ((thr5_red_no_br_bf | thr5_redirect_bf) & by_pass_sel_f[5]) |
                                    ((thr6_red_no_br_bf | thr6_redirect_bf) & by_pass_sel_f[6]) |
                                    ((thr7_red_no_br_bf | thr7_redirect_bf) & by_pass_sel_f[7]) ;


 assign next_by_pass_c_valid = by_pass_valid_f & ~bypass_thread_redirected_f ;
 ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 by_pass_v_c_reg  (
  .scan_in(by_pass_v_c_reg_scanin),
  .scan_out(by_pass_v_c_reg_scanout),
  .l1clk( l1clk_pm1  ),
  .din  (next_by_pass_c_valid),
  .dout (by_pass_valid_c),
  .siclk(siclk),
  .soclk(soclk));



// assign sel_by_pass_cycle_1_int_bf = (cycle_1_by_pass_ok_bf & by_pass_valid_bf)    ;
assign sel_by_pass_cycle_2_int_f  = (cycle_2_by_pass_ok_f  & by_pass_valid_f) ;
assign sel_by_pass_cycle_3_int_c  = (cycle_3_by_pass_ok_c  & by_pass_valid_c) ;



///////////////////////////////////////////////////////////////////////////////////////////////
// Generate signals that show which thread is by_passing at C this cycle. (equivalent to C   //
// stage in normal fetching.                                                                 //
///////////////////////////////////////////////////////////////////////////////////////////////
// thr0 is by_passing the cycle after cmu_by_pass_valid                                      //
// DO NOT OVER QUALIFY with actual bypass when calculating room.                             // 
// It does not matter for performance and it is a timing path.                               //
///////////////////////////////////////////////////////////////////////////////////////////////
assign thr0_by_pass_valid_bf = by_pass_sel_bf[0] ; // &  agc_sel_by_pass_cycle_1_int_bf ;
assign thr1_by_pass_valid_bf = by_pass_sel_bf[1] ; // &  agc_sel_by_pass_cycle_1_int_bf ;
assign thr2_by_pass_valid_bf = by_pass_sel_bf[2] ; // &  agc_sel_by_pass_cycle_1_int_bf ;
assign thr3_by_pass_valid_bf = by_pass_sel_bf[3] ; // &  agc_sel_by_pass_cycle_1_int_bf ;
assign thr4_by_pass_valid_bf = by_pass_sel_bf[4] ; // &  agc_sel_by_pass_cycle_1_int_bf ;
assign thr5_by_pass_valid_bf = by_pass_sel_bf[5] ; // &  agc_sel_by_pass_cycle_1_int_bf ;
assign thr6_by_pass_valid_bf = by_pass_sel_bf[6] ; // &  agc_sel_by_pass_cycle_1_int_bf ;
assign thr7_by_pass_valid_bf = by_pass_sel_bf[7] ; // &  agc_sel_by_pass_cycle_1_int_bf ;

///////////////////////////////////////////////////////////////////////////////////////////////
// thr0 is by_passing the 2 cycles after cmu_by_pass_valid                                   //
///////////////////////////////////////////////////////////////////////////////////////////////
assign thr0_by_pass_valid_f = by_pass_sel_f[0] &  sel_by_pass_cycle_2_int_f ;
assign thr1_by_pass_valid_f = by_pass_sel_f[1] &  sel_by_pass_cycle_2_int_f ;
assign thr2_by_pass_valid_f = by_pass_sel_f[2] &  sel_by_pass_cycle_2_int_f ;
assign thr3_by_pass_valid_f = by_pass_sel_f[3] &  sel_by_pass_cycle_2_int_f ;
assign thr4_by_pass_valid_f = by_pass_sel_f[4] &  sel_by_pass_cycle_2_int_f ;
assign thr5_by_pass_valid_f = by_pass_sel_f[5] &  sel_by_pass_cycle_2_int_f ;
assign thr6_by_pass_valid_f = by_pass_sel_f[6] &  sel_by_pass_cycle_2_int_f ;
assign thr7_by_pass_valid_f = by_pass_sel_f[7] &  sel_by_pass_cycle_2_int_f ;

///////////////////////////////////////////////////////////////////////////////////////////////
// thr0 is by_passing the 3 cycles after cmu_by_pass_valid                                   //
///////////////////////////////////////////////////////////////////////////////////////////////
assign thr0_by_pass_valid_c = by_pass_sel_c[0] &  sel_by_pass_cycle_3_int_c ;
assign thr1_by_pass_valid_c = by_pass_sel_c[1] &  sel_by_pass_cycle_3_int_c ;
assign thr2_by_pass_valid_c = by_pass_sel_c[2] &  sel_by_pass_cycle_3_int_c ;
assign thr3_by_pass_valid_c = by_pass_sel_c[3] &  sel_by_pass_cycle_3_int_c ;
assign thr4_by_pass_valid_c = by_pass_sel_c[4] &  sel_by_pass_cycle_3_int_c ;
assign thr5_by_pass_valid_c = by_pass_sel_c[5] &  sel_by_pass_cycle_3_int_c ;
assign thr6_by_pass_valid_c = by_pass_sel_c[6] &  sel_by_pass_cycle_3_int_c ;
assign thr7_by_pass_valid_c = by_pass_sel_c[7] &  sel_by_pass_cycle_3_int_c ;

assign thr0_by_pass_is_at_c = thr0_by_pass_valid_bf | thr0_by_pass_valid_f | thr0_by_pass_valid_c ;
assign thr1_by_pass_is_at_c = thr1_by_pass_valid_bf | thr1_by_pass_valid_f | thr1_by_pass_valid_c ;
assign thr2_by_pass_is_at_c = thr2_by_pass_valid_bf | thr2_by_pass_valid_f | thr2_by_pass_valid_c ;
assign thr3_by_pass_is_at_c = thr3_by_pass_valid_bf | thr3_by_pass_valid_f | thr3_by_pass_valid_c ;
assign thr4_by_pass_is_at_c = thr4_by_pass_valid_bf | thr4_by_pass_valid_f | thr4_by_pass_valid_c ;
assign thr5_by_pass_is_at_c = thr5_by_pass_valid_bf | thr5_by_pass_valid_f | thr5_by_pass_valid_c ;
assign thr6_by_pass_is_at_c = thr6_by_pass_valid_bf | thr6_by_pass_valid_f | thr6_by_pass_valid_c ;
assign thr7_by_pass_is_at_c = thr7_by_pass_valid_bf | thr7_by_pass_valid_f | thr7_by_pass_valid_c ;
 
///////////////////////////////////////////////////////////////////////////////////////////////
// Generate signals that show which thread is by_passing at C next cycle. (equivalent to F   //
// stage in normal fetching.                                                                 //
///////////////////////////////////////////////////////////////////////////////////////////////
assign thr0_by_pass_cycle_2_bf = by_pass_sel_bf[0] & cycle_2_by_pass_ok_bf ;  
assign thr0_by_pass_cycle_3_f  = by_pass_sel_f[0]  & cycle_3_by_pass_ok_f ;  

assign thr1_by_pass_cycle_2_bf = by_pass_sel_bf[1] & cycle_2_by_pass_ok_bf ;  
assign thr1_by_pass_cycle_3_f  = by_pass_sel_f[1]  & cycle_3_by_pass_ok_f ;  

assign thr2_by_pass_cycle_2_bf = by_pass_sel_bf[2] & cycle_2_by_pass_ok_bf ;  
assign thr2_by_pass_cycle_3_f  = by_pass_sel_f[2]  & cycle_3_by_pass_ok_f ;  

assign thr3_by_pass_cycle_2_bf = by_pass_sel_bf[3] & cycle_2_by_pass_ok_bf ;  
assign thr3_by_pass_cycle_3_f  = by_pass_sel_f[3]  & cycle_3_by_pass_ok_f ;  

assign thr4_by_pass_cycle_2_bf = by_pass_sel_bf[4] & cycle_2_by_pass_ok_bf ;  
assign thr4_by_pass_cycle_3_f  = by_pass_sel_f[4]  & cycle_3_by_pass_ok_f ;  

assign thr5_by_pass_cycle_2_bf = by_pass_sel_bf[5] & cycle_2_by_pass_ok_bf ;  
assign thr5_by_pass_cycle_3_f = by_pass_sel_f[5]  & cycle_3_by_pass_ok_f ;  

assign thr6_by_pass_cycle_2_bf = by_pass_sel_bf[6] & cycle_2_by_pass_ok_bf ;  
assign thr6_by_pass_cycle_3_f  = by_pass_sel_f[6]  & cycle_3_by_pass_ok_f ;  

assign thr7_by_pass_cycle_2_bf = by_pass_sel_bf[7] & cycle_2_by_pass_ok_bf ;  
assign thr7_by_pass_cycle_3_f  = by_pass_sel_f[7]  & cycle_3_by_pass_ok_f ;  


assign thr0_by_pass_next_cycle_at_c = thr0_by_pass_cycle_2_bf | thr0_by_pass_cycle_3_f ;
assign thr1_by_pass_next_cycle_at_c = thr1_by_pass_cycle_2_bf | thr1_by_pass_cycle_3_f ;
assign thr2_by_pass_next_cycle_at_c = thr2_by_pass_cycle_2_bf | thr2_by_pass_cycle_3_f ;
assign thr3_by_pass_next_cycle_at_c = thr3_by_pass_cycle_2_bf | thr3_by_pass_cycle_3_f ;
assign thr4_by_pass_next_cycle_at_c = thr4_by_pass_cycle_2_bf | thr4_by_pass_cycle_3_f ;
assign thr5_by_pass_next_cycle_at_c = thr5_by_pass_cycle_2_bf | thr5_by_pass_cycle_3_f ;
assign thr6_by_pass_next_cycle_at_c = thr6_by_pass_cycle_2_bf | thr6_by_pass_cycle_3_f ;
assign thr7_by_pass_next_cycle_at_c = thr7_by_pass_cycle_2_bf | thr7_by_pass_cycle_3_f ;

assign thr0_by_pass_2_cycles_at_c   = by_pass_sel_bf[0]   & cycle_3_by_pass_ok_bf ;
assign thr1_by_pass_2_cycles_at_c   = by_pass_sel_bf[1]   & cycle_3_by_pass_ok_bf ;
assign thr2_by_pass_2_cycles_at_c   = by_pass_sel_bf[2]   & cycle_3_by_pass_ok_bf ;
assign thr3_by_pass_2_cycles_at_c   = by_pass_sel_bf[3]   & cycle_3_by_pass_ok_bf ;
assign thr4_by_pass_2_cycles_at_c   = by_pass_sel_bf[4]   & cycle_3_by_pass_ok_bf ;
assign thr5_by_pass_2_cycles_at_c   = by_pass_sel_bf[5]   & cycle_3_by_pass_ok_bf ;
assign thr6_by_pass_2_cycles_at_c   = by_pass_sel_bf[6]   & cycle_3_by_pass_ok_bf ;
assign thr7_by_pass_2_cycles_at_c   = by_pass_sel_bf[7]   & cycle_3_by_pass_ok_bf ;

////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
// Generate a signal to show if fetching the thread again or not     //
///////////////////////////////////////////////////////////////////////
assign fetch_same_thr_again_bf = ((ftp_curr_fetch_thr_bf[0] & ftp_curr_fetch_thr_f[0]) |
                                  (ftp_curr_fetch_thr_bf[1] & ftp_curr_fetch_thr_f[1]) |
                                  (ftp_curr_fetch_thr_bf[2] & ftp_curr_fetch_thr_f[2]) |
                                  (ftp_curr_fetch_thr_bf[3] & ftp_curr_fetch_thr_f[3]) |
                                  (ftp_curr_fetch_thr_bf[4] & ftp_curr_fetch_thr_f[4]) |
                                  (ftp_curr_fetch_thr_bf[5] & ftp_curr_fetch_thr_f[5]) |
                                  (ftp_curr_fetch_thr_bf[6] & ftp_curr_fetch_thr_f[6]) |
                                  (ftp_curr_fetch_thr_bf[7] & ftp_curr_fetch_thr_f[7])) &
                                  ftp_fetch_v_dup_f;


////////////////////////////////////////////////////////////////////////
// current fetch thread matches the branch redirection thread
////////////////////////////////////////////////////////////////////////

assign br0_matches_curr = ((~ftp_tid0_e[1] & ~ftp_tid0_e[0] &
                                   ftp_curr_fetch_thr_bf[0]   ) |
                                  (~ftp_tid0_e[1] & ftp_tid0_e[0] &
                                   ftp_curr_fetch_thr_bf[1]   ) |
                                  (ftp_tid0_e[1] & ~ftp_tid0_e[0] &
                                   ftp_curr_fetch_thr_bf[2]   ) |
                                  (ftp_tid0_e[1] & ftp_tid0_e[0] &
                                   ftp_curr_fetch_thr_bf[3]   )) ;

assign br1_matches_curr  = ((~ftp_tid1_e[1] & ~ftp_tid1_e[0] &
                                   ftp_curr_fetch_thr_bf[4]   ) |
                                  (~ftp_tid1_e[1] & ftp_tid1_e[0] &
                                   ftp_curr_fetch_thr_bf[5]   ) |
                                  (ftp_tid1_e[1] & ~ftp_tid1_e[0] &
                                   ftp_curr_fetch_thr_bf[6]   ) |
                                  (ftp_tid1_e[1] & ftp_tid1_e[0] &
                                   ftp_curr_fetch_thr_bf[7]   )) ;

 // assign br_tid_matches_curr = br0_matches_curr | br1_matches_curr ;
///////////////////////////////////////////////////////////////////////
// Final mux for the PC_F                                            //
///////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
// assuming dec_br_taken_e[0] = 0 and dec_br_taken_e[0] = 0 
/////////////////////////////////////////////////////////
// assign ftp_pc_sel_nb0_nb1[0] = ~fetch_same_thr_again_bf ;
// assign ftp_pc_sel_nb0_nb1[1] =  fetch_same_thr_again_bf ;
                          
/////////////////////////////////////////////////////////
// assuming dec_br_taken_e[0] = 1 and dec_br_taken_e[0] = 0 
/////////////////////////////////////////////////////////
// assign ftp_pc_sel_b0_nb1[0] =  ftp_any_thread_ready & ~fetch_same_thr_again_bf & ~single_thread_active;
// assign ftp_pc_sel_b0_nb1[1] =  ftp_any_thread_ready &  fetch_same_thr_again_bf & ~single_thread_active;
// assign ftp_pc_sel_b0_nb1[2] =  single_thread_active ; // 

/////////////////////////////////////////////////////////
// assuming dec_br_taken_e[0] = 0 and dec_br_taken_e[0] = 1 
/////////////////////////////////////////////////////////
// assign ftp_pc_sel_nb0_b1[0] =  ftp_any_thread_ready & ~fetch_same_thr_again_bf & ~single_thread_active;
// assign ftp_pc_sel_nb0_b1[1] =  ftp_any_thread_ready &  fetch_same_thr_again_bf & ~single_thread_active;
// assign ftp_pc_sel_nb0_b1[2] =  single_thread_active ; 

/////////////////////////////////////////////////////////
// assuming dec_br_taken_e[0] = 1 and dec_br_taken_e[0] = 1 
/////////////////////////////////////////////////////////
// assign ftp_pc_sel_b0_b1[0] =  ftp_any_thread_ready & ~fetch_same_thr_again_bf & ~br1_matches_curr & ~br0_matches_curr;
// assign ftp_pc_sel_b0_b1[1] =  ftp_any_thread_ready &  fetch_same_thr_again_bf & ~br1_matches_curr & ~br0_matches_curr;
// assign ftp_pc_sel_b0_b1[2] =  ( ~(ftp_any_thread_ready | br1_matches_curr) | br0_matches_curr)  ;
// assign ftp_pc_sel_b0_b1[3] =  br1_matches_curr ;
// Note: In single thread mode this case is NOT possible. In MT mode, we do NOT care what is selected this
//       this cycle because we DO not force the branch address in BF stage.
///////////////////////////////////////////////////////////////////////////////////////////////
// assign ftp_pc_sel_b0_b1[0] = ~fetch_same_thr_again_bf ;
// assign ftp_pc_sel_b0_b1[1] =  fetch_same_thr_again_bf ;
                          
/////////////////////////////////////////////////////////
// assuming dec_br_taken_e[0] = 0 and dec_br_taken_e[0] = 0 
/////////////////////////////////////////////////////////
//assign ftp_pc_sel_am_nb0_nb1[0] = ~fetch_same_thr_again_bf &  ftp_curr_pstate_am_bf_ & ~select_itc_va;
//assign ftp_pc_sel_am_nb0_nb1[1] =  fetch_same_thr_again_bf &  ftp_curr_pstate_am_bf_ & ~select_itc_va;
//assign ftp_pc_sel_am_nb0_nb1[2] = ~fetch_same_thr_again_bf & ~ftp_curr_pstate_am_bf_ & ~select_itc_va;
//assign ftp_pc_sel_am_nb0_nb1[3] =  fetch_same_thr_again_bf & ~ftp_curr_pstate_am_bf_ & ~select_itc_va;
//assign ftp_pc_sel_am_nb0_nb1[4] =  select_itc_va ;
//                          
/////////////////////////////////////////////////////////
// assuming dec_br_taken_e[0] = 1 and dec_br_taken_e[0] = 0 
/////////////////////////////////////////////////////////
 assign ftp_pc_sel_am[0] =  ftp_any_thread_ready & ~fetch_same_thr_again_bf &  ftp_curr_pstate_am_bf_ & ~select_itc_va &
                           ~sel_am_5; 

 assign ftp_pc_sel_am[1] =  ftp_any_thread_ready &  fetch_same_thr_again_bf &  ftp_curr_pstate_am_bf_ & ~select_itc_va &
                           ~sel_am_5; 

 assign ftp_pc_sel_am[2] =  ftp_any_thread_ready & ~fetch_same_thr_again_bf & ~ftp_curr_pstate_am_bf_ & ~select_itc_va &
                           ~sel_am_5;

 assign ftp_pc_sel_am[3] =  ftp_any_thread_ready &  fetch_same_thr_again_bf & ~ftp_curr_pstate_am_bf_ & ~select_itc_va & 
                           ~sel_am_5; 

 assign ftp_pc_sel_am[4] =  select_itc_va & ~sel_am_5;
 assign ftp_pc_sel_am[5] =  sel_am_5 | (~ftp_any_thread_ready & ~select_itc_va)     ;


assign  ftp_pc_sel_tag_part1[0] =  ftp_any_thread_ready & ~select_itc_va & ~sel_am_5;
assign  ftp_pc_sel_tag_part1[1] =  select_itc_va & ~sel_am_5 ;
assign  ftp_pc_sel_tag_part1[2] =  ~ftp_pc_sel_tag_part1[1] & ~ftp_pc_sel_tag_part1[0];

assign  ftp_pc_sel_tag_part2[0] =  ftp_any_thread_ready & ~select_itc_va & ftp_curr_pstate_am_bf_ & ~sel_am_5;
assign  ftp_pc_sel_tag_part2[1] =  select_itc_va & ~sel_am_5;
assign  ftp_pc_sel_tag_part2[2] =  ~ftp_pc_sel_tag_part2[0] & ~ftp_pc_sel_tag_part2[1] & ~ ftp_pc_sel_tag_part2[3] ; 
assign  ftp_pc_sel_tag_part2[3] =  ftp_any_thread_ready & ~select_itc_va & ~ftp_curr_pstate_am_bf_ & ~sel_am_5 ;

assign  ftp_pc_sel_tag_pc_bot[0]  =  ftp_any_thread_ready & ~fetch_same_thr_again_bf & ~select_itc_va;
assign  ftp_pc_sel_tag_pc_bot[1]  = ~( ftp_any_thread_ready & ~fetch_same_thr_again_bf & ~select_itc_va);

assign  ftp_pc_sel_tag_pc_top[0]  =  ftp_any_thread_ready & ~fetch_same_thr_again_bf & ftp_curr_pstate_am_bf_ & ~select_itc_va;
assign  ftp_pc_sel_tag_pc_top[1]  = ~( ftp_any_thread_ready & ~fetch_same_thr_again_bf & ftp_curr_pstate_am_bf_ & ~select_itc_va);

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
// Final mux for the ICADDR                                          //
///////////////////////////////////////////////////////////////////////

assign ftp_icaddr_sel_first_mux[0] = ~fetch_same_thr_again_bf & ~ftp_fill_req_q_bf & ~ic_rd_req_ff & ~ic_wr_req_ff & ~mbi_run_bf & 
                                      ~tg_rd_req_ff & ~tg_wr_req_ff;
assign ftp_icaddr_sel_first_mux[1] =  fetch_same_thr_again_bf & ~ftp_fill_req_q_bf & ~ic_rd_req_ff & ~ic_wr_req_ff & ~mbi_run_bf &
                                      ~tg_rd_req_ff & ~tg_wr_req_ff; 
assign ftp_icaddr_sel_first_mux[2] =  ftp_fill_req_q_bf & ~mbi_run_bf;
assign ftp_icaddr_sel_first_mux[3] =  (ic_rd_req_ff | ic_wr_req_ff | tg_rd_req_ff | tg_wr_req_ff) & ~ftp_fill_req_q_bf & ~mbi_run_bf;
assign ftp_icaddr_sel_first_mux[4] =  mbi_run_bf ;



assign next_pstate_am_[7:0]  = ~tlu_pstate_am[7:0] ;

ifu_ftu_ftp_ctl_msff_ctl_macro__width_8 pstate_am_reg  (
 .scan_in(pstate_am_reg_scanin),
 .scan_out(pstate_am_reg_scanout),
 .l1clk( l1clk_pm1),
 .din  (next_pstate_am_[7:0]),
 .dout (ftp_pstate_am_bf_[7:0]),
  .siclk(siclk),
  .soclk(soclk));


assign ftp_curr_pstate_am_bf_ =  (ftp_curr_fetch_thr_bf[0] & ftp_pstate_am_bf_[0]) | 
                                (ftp_curr_fetch_thr_bf[1] & ftp_pstate_am_bf_[1]) |
                                (ftp_curr_fetch_thr_bf[2] & ftp_pstate_am_bf_[2]) |
                                (ftp_curr_fetch_thr_bf[3] & ftp_pstate_am_bf_[3]) |
                                (ftp_curr_fetch_thr_bf[4] & ftp_pstate_am_bf_[4]) |
                                (ftp_curr_fetch_thr_bf[5] & ftp_pstate_am_bf_[5]) |
                                (ftp_curr_fetch_thr_bf[6] & ftp_pstate_am_bf_[6]) |
                                (ftp_curr_fetch_thr_bf[7] & ftp_pstate_am_bf_[7]) ;


assign reload_in = itc_demap_next;


//flop reload

ifu_ftu_ftp_ctl_msff_ctl_macro__width_2 reload_latch  (
	.scan_in(reload_latch_scanin),
	.scan_out(reload_latch_scanout),
	.din	({reload_in,
		  reload}),
	.dout	({reload,
		  reload_last}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// assign select_itc_va      =  (reload | reload_last) | mbi_run_bf ;

assign next_ftp_ith_det_req_bf =   next_ith_det_req & ~(reload_in | reload) ;
assign next_select_itc_va      =   reload_in        |      reload | mbi_run_bf ; 
assign next_sel_am_5           =   next_ftp_ith_det_req_bf & ~next_select_itc_va ; 

ifu_ftu_ftp_ctl_msff_ctl_macro__width_2 pre_sel_am_reg  (
	.scan_in(pre_sel_am_reg_scanin),
	.scan_out(pre_sel_am_reg_scanout),
	.din	({next_select_itc_va,
		  next_sel_am_5}),
	.dout	({select_itc_va,
		  sel_am_5}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// assign ftp_select_itc_ctx =  (reload | reload_last);


assign next_thr0_pid_data[2:0] =  (lsu_ifu_wr_pid  & (lsu_ifu_tid_w[2:0] == 3'b000)) ?   lsu_ifu_pid_data:
                                   thr0_pid_data[2:0] ;
assign next_thr1_pid_data[2:0] =  (lsu_ifu_wr_pid  & (lsu_ifu_tid_w[2:0] == 3'b001)) ?   lsu_ifu_pid_data:
                                   thr1_pid_data[2:0] ;
assign next_thr2_pid_data[2:0] =  (lsu_ifu_wr_pid  & (lsu_ifu_tid_w[2:0] == 3'b010)) ?   lsu_ifu_pid_data:
                                   thr2_pid_data[2:0] ;
assign next_thr3_pid_data[2:0] =  (lsu_ifu_wr_pid  & (lsu_ifu_tid_w[2:0] == 3'b011)) ?   lsu_ifu_pid_data:
                                   thr3_pid_data[2:0] ;
assign next_thr4_pid_data[2:0] =  (lsu_ifu_wr_pid  & (lsu_ifu_tid_w[2:0] == 3'b100)) ?   lsu_ifu_pid_data:
                                   thr4_pid_data[2:0] ;
assign next_thr5_pid_data[2:0] =  (lsu_ifu_wr_pid  & (lsu_ifu_tid_w[2:0] == 3'b101)) ?   lsu_ifu_pid_data:
                                   thr5_pid_data[2:0] ;
assign next_thr6_pid_data[2:0] =  (lsu_ifu_wr_pid  & (lsu_ifu_tid_w[2:0] == 3'b110)) ?   lsu_ifu_pid_data:
                                   thr6_pid_data[2:0] ;
assign next_thr7_pid_data[2:0] =  (lsu_ifu_wr_pid  & (lsu_ifu_tid_w[2:0] == 3'b111)) ?   lsu_ifu_pid_data:
                                   thr7_pid_data[2:0] ;

ifu_ftu_ftp_ctl_msff_ctl_macro__width_3 thr0_pid_reg  (
 .scan_in(thr0_pid_reg_scanin),
 .scan_out(thr0_pid_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (next_thr0_pid_data[2:0]),
 .dout (thr0_pid_data[2:0]),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_ftp_ctl_msff_ctl_macro__width_3 thr1_pid_reg  (
 .scan_in(thr1_pid_reg_scanin),
 .scan_out(thr1_pid_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (next_thr1_pid_data[2:0]),
 .dout (thr1_pid_data[2:0]),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_ftp_ctl_msff_ctl_macro__width_3 thr2_pid_reg  (
 .scan_in(thr2_pid_reg_scanin),
 .scan_out(thr2_pid_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (next_thr2_pid_data[2:0]),
 .dout (thr2_pid_data[2:0]),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_ftp_ctl_msff_ctl_macro__width_3 thr3_pid_reg  (
 .scan_in(thr3_pid_reg_scanin),
 .scan_out(thr3_pid_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (next_thr3_pid_data[2:0]),
 .dout (thr3_pid_data[2:0]),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_ftp_ctl_msff_ctl_macro__width_3 thr4_pid_reg  (
 .scan_in(thr4_pid_reg_scanin),
 .scan_out(thr4_pid_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (next_thr4_pid_data[2:0]),
 .dout (thr4_pid_data[2:0]),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_ftp_ctl_msff_ctl_macro__width_3 thr5_pid_reg  (
 .scan_in(thr5_pid_reg_scanin),
 .scan_out(thr5_pid_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (next_thr5_pid_data[2:0]),
 .dout (thr5_pid_data[2:0]),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_ftp_ctl_msff_ctl_macro__width_3 thr6_pid_reg  (
 .scan_in(thr6_pid_reg_scanin),
 .scan_out(thr6_pid_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (next_thr6_pid_data[2:0]),
 .dout (thr6_pid_data[2:0]),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_ftp_ctl_msff_ctl_macro__width_3 thr7_pid_reg  (
 .scan_in(thr7_pid_reg_scanin),
 .scan_out(thr7_pid_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (next_thr7_pid_data[2:0]),
 .dout (thr7_pid_data[2:0]),
  .siclk(siclk),
  .soclk(soclk));

assign ftp_curr_pid_bf[2:0] = ({3{ftp_itb_fetch_thr_dup_bf[7]}} & thr7_pid_data[2:0]) | 
                              ({3{ftp_itb_fetch_thr_dup_bf[6]}} & thr6_pid_data[2:0]) |
                              ({3{ftp_itb_fetch_thr_dup_bf[5]}} & thr5_pid_data[2:0]) |
                              ({3{ftp_itb_fetch_thr_dup_bf[4]}} & thr4_pid_data[2:0]) |
                              ({3{ftp_itb_fetch_thr_dup_bf[3]}} & thr3_pid_data[2:0]) |
                              ({3{ftp_itb_fetch_thr_dup_bf[2]}} & thr2_pid_data[2:0]) |
                              ({3{ftp_itb_fetch_thr_dup_bf[1]}} & thr1_pid_data[2:0]) |
                              ({3{ftp_itb_fetch_thr_dup_bf[0]}} & thr0_pid_data[2:0]) ;

assign ftp_thr7_pid_data[2:0] = thr7_pid_data[2:0] ;
assign ftp_thr6_pid_data[2:0] = thr6_pid_data[2:0] ;
assign ftp_thr5_pid_data[2:0] = thr5_pid_data[2:0] ;
assign ftp_thr4_pid_data[2:0] = thr4_pid_data[2:0] ;
assign ftp_thr3_pid_data[2:0] = thr3_pid_data[2:0] ;
assign ftp_thr2_pid_data[2:0] = thr2_pid_data[2:0] ;
assign ftp_thr1_pid_data[2:0] = thr1_pid_data[2:0] ;
assign ftp_thr0_pid_data[2:0] = thr0_pid_data[2:0] ;

assign ftp_thr0_go_to_sf_wait = (((ftp_fetch_thr_q_f[0] & ~invalidation_req_f) | (by_pass_valid_bf & by_pass_sel_bf[0])) & agc_thr0_sf_valid_f) ;
assign ftp_thr1_go_to_sf_wait = (((ftp_fetch_thr_q_f[1] & ~invalidation_req_f) | (by_pass_valid_bf & by_pass_sel_bf[1])) & agc_thr1_sf_valid_f) ;
assign ftp_thr2_go_to_sf_wait = (((ftp_fetch_thr_q_f[2] & ~invalidation_req_f) | (by_pass_valid_bf & by_pass_sel_bf[2])) & agc_thr2_sf_valid_f) ;
assign ftp_thr3_go_to_sf_wait = (((ftp_fetch_thr_q_f[3] & ~invalidation_req_f) | (by_pass_valid_bf & by_pass_sel_bf[3])) & agc_thr3_sf_valid_f) ;
assign ftp_thr4_go_to_sf_wait = (((ftp_fetch_thr_q_f[4] & ~invalidation_req_f) | (by_pass_valid_bf & by_pass_sel_bf[4])) & agc_thr4_sf_valid_f) ;
assign ftp_thr5_go_to_sf_wait = (((ftp_fetch_thr_q_f[5] & ~invalidation_req_f) | (by_pass_valid_bf & by_pass_sel_bf[5])) & agc_thr5_sf_valid_f) ;
assign ftp_thr6_go_to_sf_wait = (((ftp_fetch_thr_q_f[6] & ~invalidation_req_f) | (by_pass_valid_bf & by_pass_sel_bf[6])) & agc_thr6_sf_valid_f) ;
assign ftp_thr7_go_to_sf_wait = (((ftp_fetch_thr_q_f[7] & ~invalidation_req_f) | (by_pass_valid_bf & by_pass_sel_bf[7])) & agc_thr7_sf_valid_f) ;

assign invalidation_req_f =  (ftp_fetch_thr_q_f[0] & agc_invalidation_req_ff[0]) |
                             (ftp_fetch_thr_q_f[1] & agc_invalidation_req_ff[1]) |
                             (ftp_fetch_thr_q_f[2] & agc_invalidation_req_ff[2]) |
                             (ftp_fetch_thr_q_f[3] & agc_invalidation_req_ff[3]) |
                             (ftp_fetch_thr_q_f[4] & agc_invalidation_req_ff[4]) |
                             (ftp_fetch_thr_q_f[5] & agc_invalidation_req_ff[5]) |
                             (ftp_fetch_thr_q_f[6] & agc_invalidation_req_ff[6]) |
                             (ftp_fetch_thr_q_f[7] & agc_invalidation_req_ff[7]) ;
 

///////////////////////////////////////////////////////////////////////
// Spare circuits                                                    //
///////////////////////////////////////////////////////////////////////
ifu_ftu_ftp_ctl_spare_ctl_macro__num_5 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////////////////////////////
// Power management for ICD                                                                   //
////////////////////////////////////////////////////////////////////////////////////////////////

assign curr_thr_pc_bf[4] = ~ifu_agd_pc_f[4] ;
assign curr_thr_pc_bf[3] = ~ifu_agd_pc_f[4] & ifu_agd_pc_f[3] ;
assign curr_thr_pc_bf[2] = ~ifu_agd_pc_f[4] & ifu_agd_pc_f[2] ;

assign ic_pwr_sel_index[0] = ~fetch_same_thr_again_bf & ~ic_rd_req_ff & ~ic_wr_req_ff & ~tg_rd_req_ff & ~tg_wr_req_ff;
assign ic_pwr_sel_index[1] =  fetch_same_thr_again_bf & ~ic_rd_req_ff & ~ic_wr_req_ff & ~tg_rd_req_ff & ~tg_wr_req_ff; 
assign ic_pwr_sel_index[2] =  (ic_rd_req_ff | ic_wr_req_ff | tg_rd_req_ff | tg_wr_req_ff) ;

assign thr0_pc_muxed_f[4:2] = ftp_thr0_sel_br_bf ? agd_address0_m[4:2] : agd_thr0_pc_4_2_f[4:2] ;
assign thr1_pc_muxed_f[4:2] = ftp_thr1_sel_br_bf ? agd_address0_m[4:2] : agd_thr1_pc_4_2_f[4:2] ;
assign thr2_pc_muxed_f[4:2] = ftp_thr2_sel_br_bf ? agd_address0_m[4:2] : agd_thr2_pc_4_2_f[4:2] ;
assign thr3_pc_muxed_f[4:2] = ftp_thr3_sel_br_bf ? agd_address0_m[4:2] : agd_thr3_pc_4_2_f[4:2] ;
assign thr4_pc_muxed_f[4:2] = ftp_thr4_sel_br_bf ? agd_address1_m[4:2] : agd_thr4_pc_4_2_f[4:2] ;
assign thr5_pc_muxed_f[4:2] = ftp_thr5_sel_br_bf ? agd_address1_m[4:2] : agd_thr5_pc_4_2_f[4:2] ;
assign thr6_pc_muxed_f[4:2] = ftp_thr6_sel_br_bf ? agd_address1_m[4:2] : agd_thr6_pc_4_2_f[4:2] ;
assign thr7_pc_muxed_f[4:2] = ftp_thr7_sel_br_bf ? agd_address1_m[4:2] : agd_thr7_pc_4_2_f[4:2] ;

assign new_thr_pc_bf[4:2]   = ({3{ftp_curr_fetch_thr_bf[0]}} & thr0_pc_muxed_f[4:2]) |
                              ({3{ftp_curr_fetch_thr_bf[1]}} & thr1_pc_muxed_f[4:2]) |
                              ({3{ftp_curr_fetch_thr_bf[2]}} & thr2_pc_muxed_f[4:2]) |
                              ({3{ftp_curr_fetch_thr_bf[3]}} & thr3_pc_muxed_f[4:2]) |
                              ({3{ftp_curr_fetch_thr_bf[4]}} & thr4_pc_muxed_f[4:2]) |
                              ({3{ftp_curr_fetch_thr_bf[5]}} & thr5_pc_muxed_f[4:2]) |
                              ({3{ftp_curr_fetch_thr_bf[6]}} & thr6_pc_muxed_f[4:2]) |
                              ({3{ftp_curr_fetch_thr_bf[7]}} & thr7_pc_muxed_f[4:2]) ;

assign ic_index_bf[4:2]    = ({3{ic_pwr_sel_index[0]}} & new_thr_pc_bf[4:2])  | 
                             ({3{ic_pwr_sel_index[1]}} & curr_thr_pc_bf[4:2]) | 
                             ({3{ic_pwr_sel_index[2]}} & asi_addr_bf[5:3])    ; 

assign ftp_icd_quad_3_en_bf =   (hp_pickready        |
                                ic_pwr_sel_index[2] |
                                ftp_fill_req_q_bf) | ~ifu_ic_pmen  | mbi_run_bf;

assign ftp_icd_quad_2_en_bf = (~(ic_index_bf[4:2] == 3'b111) & (hp_pickready | ic_pwr_sel_index[2])) |
                                ftp_fill_req_q_bf  | ~ifu_ic_pmen  | mbi_run_bf;
          
assign ftp_icd_quad_1_en_bf = (~(ic_index_bf[4:3] == 2'b11) & (hp_pickready | ic_pwr_sel_index[2])) |
                                ftp_fill_req_q_bf  | ~ifu_ic_pmen  | mbi_run_bf;

assign ftp_icd_quad_0_en_bf = (~(ic_index_bf[4:3] == 2'b11)                 & (hp_pickready | ic_pwr_sel_index[2])) |
                              (~({ic_index_bf[4],ic_index_bf[2]} == 2'b11) & (hp_pickready | ic_pwr_sel_index[2])) |
                                ftp_fill_req_q_bf  | ~ifu_ic_pmen  | mbi_run_bf;
          
          
          
          
 
supply0 vss;
supply1 vdd;
assign se = tcu_scan_en ;
// fixscan start:
assign br_reg_scanin             = scan_in                  ;
assign tlu_flush_ifu_req_scanin  = br_reg_scanout           ;
assign br_tid_reg_scanin         = tlu_flush_ifu_req_scanout;
assign tid_dec_w_reg_scanin      = br_tid_reg_scanout       ;
assign tid_bf_reg_scanin         = tid_dec_w_reg_scanout    ;
assign top_lruf_scanin           = tid_bf_reg_scanout       ;
assign bot_lruf_scanin           = top_lruf_scanout         ;
assign favor_top_reg_scanin      = bot_lruf_scanout         ;
assign curr_fetch_thr_f_reg_scanin = favor_top_reg_scanout    ;
assign curr_fetch_thr_c_reg_scanin = curr_fetch_thr_f_reg_scanout;
assign inv_line_reg_scanin       = curr_fetch_thr_c_reg_scanout;
assign fill_req_bf_reg_scanin    = inv_line_reg_scanout     ;
assign rd_is_first_reg_scanin    = fill_req_bf_reg_scanout  ;
assign wr_request_pending_reg_scanin = rd_is_first_reg_scanout  ;
assign ic_wr_req_ff_reg_scanin   = wr_request_pending_reg_scanout;
assign ic_rd_req_ff_reg_scanin   = ic_wr_req_ff_reg_scanout ;
assign tg_wr_req_ff_reg_scanin   = ic_rd_req_ff_reg_scanout ;
assign tg_rd_req_ff_reg_scanin   = tg_wr_req_ff_reg_scanout ;
assign itt_rd_req_ff_reg_scanin  = tg_rd_req_ff_reg_scanout ;
assign itd_rd_req_ff_reg_scanin  = itt_rd_req_ff_reg_scanout;
assign ith_det_req_ff_reg_scanin = itd_rd_req_ff_reg_scanout;
assign itlb_probe_l_reg_scanin   = ith_det_req_ff_reg_scanout;
assign fill_req_bf_q_reg_scanin  = itlb_probe_l_reg_scanout ;
assign mbist_in_reg_scanin       = fill_req_bf_q_reg_scanout;
assign itlb_cam_vld_reg_scanin   = mbist_in_reg_scanout     ;
assign itlb_bypass_lat_scanin    = itlb_cam_vld_reg_scanout ;
assign ic_rd_done_f_reg_scanin   = itlb_bypass_lat_scanout  ;
assign ic_rd_done_c_reg_scanin   = ic_rd_done_f_reg_scanout ;
assign ic_rd_done_p_reg_scanin   = ic_rd_done_c_reg_scanout ;
assign ic_wr_done_f_reg_scanin   = ic_rd_done_p_reg_scanout ;
assign tg_rd_done_f_reg_scanin   = ic_wr_done_f_reg_scanout ;
assign tg_rd_done_c_reg_scanin   = tg_rd_done_f_reg_scanout ;
assign tg_wr_done_f_reg_scanin   = tg_rd_done_c_reg_scanout ;
assign it_rd_done_f_reg_scanin   = tg_wr_done_f_reg_scanout ;
assign it_rd_done_c_reg_scanin   = it_rd_done_f_reg_scanout ;
assign asi_rd_done_reg_scanin    = it_rd_done_c_reg_scanout ;
assign asi_wr_done_reg_scanin    = asi_rd_done_reg_scanout  ;
assign asi_it_rd_done_reg_scanin = asi_wr_done_reg_scanout  ;
assign itlb_sel_tag_f_reg_scanin = asi_it_rd_done_reg_scanout;
assign itlb_sel_data_f_reg_scanin = itlb_sel_tag_f_reg_scanout;
assign itlb_sel_pa_f_reg_scanin  = itlb_sel_data_f_reg_scanout;
assign itlb_sel_c_reg_scanin     = itlb_sel_pa_f_reg_scanout;
assign thrx_redirect_reg_scanin  = itlb_sel_c_reg_scanout   ;
assign fetch_v_f_reg_scanin      = thrx_redirect_reg_scanout;
assign fetch_v_f_dup_reg_scanin  = fetch_v_f_reg_scanout    ;
assign fetch_v_c_reg_scanin      = fetch_v_f_dup_reg_scanout;
assign enabled_thr_reg_scanin    = fetch_v_c_reg_scanout    ;
assign ready_fp_reg_scanin       = enabled_thr_reg_scanout  ;
assign cmu_fill_byp_thread_reg_scanin = ready_fp_reg_scanout     ;
assign by_pass_sel_f_reg_scanin  = cmu_fill_byp_thread_reg_scanout;
assign by_pass_sel_c_reg_scanin  = by_pass_sel_f_reg_scanout;
assign byp_valid_reg_scanin      = by_pass_sel_c_reg_scanout;
assign thrx_kill_by_pass_reg_scanin = byp_valid_reg_scanout    ;
assign cycle_2_by_pass_f_reg_scanin = thrx_kill_by_pass_reg_scanout;
assign cycle_3_by_pass_f_reg_scanin = cycle_2_by_pass_f_reg_scanout;
assign cycle_3_by_pass_c_reg_scanin = cycle_3_by_pass_f_reg_scanout;
assign by_pass_v_f_reg_scanin    = cycle_3_by_pass_c_reg_scanout;
assign by_pass_v_c_reg_scanin    = by_pass_v_f_reg_scanout  ;
assign pstate_am_reg_scanin      = by_pass_v_c_reg_scanout  ;
assign reload_latch_scanin       = pstate_am_reg_scanout    ;
assign pre_sel_am_reg_scanin     = reload_latch_scanout     ;
assign thr0_pid_reg_scanin       = pre_sel_am_reg_scanout   ;
assign thr1_pid_reg_scanin       = thr0_pid_reg_scanout     ;
assign thr2_pid_reg_scanin       = thr1_pid_reg_scanout     ;
assign thr3_pid_reg_scanin       = thr2_pid_reg_scanout     ;
assign thr4_pid_reg_scanin       = thr3_pid_reg_scanout     ;
assign thr5_pid_reg_scanin       = thr4_pid_reg_scanout     ;
assign thr6_pid_reg_scanin       = thr5_pid_reg_scanout     ;
assign thr7_pid_reg_scanin       = thr6_pid_reg_scanout     ;
assign spares_scanin             = thr7_pid_reg_scanout     ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule







// any PARAMS parms go into naming of macro

module ifu_ftu_ftp_ctl_l1clkhdr_ctl_macro (
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

module ifu_ftu_ftp_ctl_msff_ctl_macro__width_6 (
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

module ifu_ftu_ftp_ctl_msff_ctl_macro__width_8 (
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

module ifu_ftu_ftp_ctl_msff_ctl_macro__width_12 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [11:0] fdin;
wire [10:0] so;

  input [11:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [11:0] dout;
  output scan_out;
assign fdin[11:0] = din[11:0];






dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[11:0]),
.si({scan_in,so[10:0]}),
.so({so[10:0],scan_out}),
.q(dout[11:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ifu_ftu_ftp_ctl_msff_ctl_macro__width_1 (
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

module ifu_ftu_ftp_ctl_msff_ctl_macro__width_2 (
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

module ifu_ftu_ftp_ctl_msff_ctl_macro__width_11 (
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

module ifu_ftu_ftp_ctl_msff_ctl_macro__width_5 (
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

module ifu_ftu_ftp_ctl_msff_ctl_macro__width_4 (
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

module ifu_ftu_ftp_ctl_msff_ctl_macro__width_10 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [9:0] fdin;
wire [8:0] so;

  input [9:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [9:0] dout;
  output scan_out;
assign fdin[9:0] = din[9:0];






dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ifu_ftu_ftp_ctl_msff_ctl_macro__width_3 (
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


module ifu_ftu_ftp_ctl_spare_ctl_macro__num_5 (
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

