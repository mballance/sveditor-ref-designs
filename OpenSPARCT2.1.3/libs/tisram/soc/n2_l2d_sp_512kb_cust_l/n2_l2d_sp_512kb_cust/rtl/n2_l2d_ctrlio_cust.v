// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_l2d_ctrlio_cust.v
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
module n2_l2d_ctrlio_cust (
  l2t_l2d_word_en_c2, 
  l2t_l2d_fbrd_c3, 
  l2t_l2d_col_offset_c2, 
  l2t_l2d_set_c2, 
  l2t_l2d_rd_wr_c3, 
  l2t_l2d_way_sel_c3, 
  l2t_l2d_fb_hit_c3, 
  l2clk, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  tcu_ce, 
  tcu_clk_stop, 
  array_wr_inhibit, 
  scan_in, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  wayerr_c3, 
  l2t_l2d_pwrsav_ov_stg, 
  scan_out, 
  cache_col_offset_all_c7, 
  aclk, 
  bclk, 
  scan_en_clsrhdr, 
  l2b_l2d_fbdecc_c5, 
  l2t_l2d_stdecc_c2, 
  cache_decc_out_c5b, 
  l2d_decc_out_c6, 
  cache_decc_in_c3b_l, 
  l2d_l2t_decc_c52_mux, 
  cache_way_sel_c3_00, 
  cache_way_sel_c3_01, 
  cache_way_sel_c3_10, 
  cache_way_sel_c3_11, 
  cache_way_sel_c3_20, 
  cache_way_sel_c3_21, 
  cache_way_sel_c3_30, 
  cache_way_sel_c3_31, 
  cache_wayerr_c3_00, 
  cache_wayerr_c3_01, 
  cache_wayerr_c3_10, 
  cache_wayerr_c3_11, 
  cache_wayerr_c3_20, 
  cache_wayerr_c3_21, 
  cache_wayerr_c3_30, 
  cache_wayerr_c3_31, 
  cache_set_c3_00, 
  cache_set_c3_01, 
  cache_set_c3_10, 
  cache_set_c3_11, 
  cache_set_c3_20, 
  cache_set_c3_21, 
  cache_set_c3_30, 
  cache_set_c3_31, 
  cache_col_offset_c3_00, 
  cache_col_offset_c3_01, 
  cache_col_offset_c3_10, 
  cache_col_offset_c3_11, 
  cache_col_offset_c3_20, 
  cache_col_offset_c3_21, 
  cache_col_offset_c3_30, 
  cache_col_offset_c3_31, 
  cache_col_offset_c4_l_00, 
  cache_col_offset_c4_l_01, 
  cache_col_offset_c4_l_10, 
  cache_col_offset_c4_l_11, 
  cache_col_offset_c4_l_20, 
  cache_col_offset_c4_l_21, 
  cache_col_offset_c4_l_30, 
  cache_col_offset_c4_l_31, 
  cache_col_offset_c5_00, 
  cache_col_offset_c5_01, 
  cache_col_offset_c5_10, 
  cache_col_offset_c5_11, 
  cache_col_offset_c5_20, 
  cache_col_offset_c5_21, 
  cache_col_offset_c5_30, 
  cache_col_offset_c5_31, 
  cache_rd_wr_c3_00, 
  cache_rd_wr_c3_01, 
  cache_rd_wr_c3_10, 
  cache_rd_wr_c3_11, 
  cache_rd_wr_c3_20, 
  cache_rd_wr_c3_21, 
  cache_rd_wr_c3_30, 
  cache_rd_wr_c3_31, 
  cache_readen_c5_00, 
  cache_readen_c5_01, 
  cache_readen_c5_10, 
  cache_readen_c5_11, 
  cache_readen_c5_20, 
  cache_readen_c5_21, 
  cache_readen_c5_30, 
  cache_readen_c5_31, 
  cache_word_en_c3_00, 
  cache_word_en_c3_01, 
  cache_word_en_c3_10, 
  cache_word_en_c3_11, 
  cache_word_en_c3_20, 
  cache_word_en_c3_21, 
  cache_word_en_c3_30, 
  cache_word_en_c3_31, 
  tcu_pce_ov_00, 
  tcu_pce_ov_01, 
  tcu_pce_ov_10, 
  tcu_pce_ov_11, 
  tcu_pce_ov_20, 
  tcu_pce_ov_21, 
  tcu_pce_ov_30, 
  tcu_pce_ov_31, 
  tcu_pce_00, 
  tcu_pce_01, 
  tcu_pce_10, 
  tcu_pce_11, 
  tcu_pce_20, 
  tcu_pce_21, 
  tcu_pce_30, 
  tcu_pce_31, 
  tcu_clk_stop_00, 
  tcu_clk_stop_01, 
  tcu_clk_stop_10, 
  tcu_clk_stop_11, 
  tcu_clk_stop_20, 
  tcu_clk_stop_21, 
  tcu_clk_stop_30, 
  tcu_clk_stop_31, 
  se_00, 
  se_01, 
  se_10, 
  se_11, 
  se_20, 
  se_21, 
  se_30, 
  se_31, 
  l2b_l2d_fuse_l2d_data_in_d, 
  l2b_l2d_fuse_rid_d, 
  l2b_l2d_fuse_reset_l, 
  l2b_l2d_fuse_l2d_wren_d, 
  efc_fuse_data, 
  fuse_l2d_data_in_131, 
  fuse_l2d_rid_131, 
  fuse_l2d_wren_131, 
  fuse_l2d_reset_131_l, 
  fdout_131, 
  fuse_l2d_data_in_031, 
  fuse_l2d_rid_031, 
  fuse_l2d_wren_031, 
  fuse_l2d_reset_031_l, 
  fdout_031, 
  fuse_l2d_data_in_130, 
  fuse_l2d_rid_130, 
  fuse_l2d_wren_130, 
  fuse_l2d_reset_130_l, 
  fdout_130, 
  fuse_l2d_data_in_030, 
  fuse_l2d_rid_030, 
  fuse_l2d_wren_030, 
  fuse_l2d_reset_030_l, 
  fdout_030, 
  fuse_l2d_data_in_111, 
  fuse_l2d_rid_111, 
  fuse_l2d_wren_111, 
  fuse_l2d_reset_111_l, 
  fdout_111, 
  fuse_l2d_data_in_011, 
  fuse_l2d_rid_011, 
  fuse_l2d_wren_011, 
  fuse_l2d_reset_011_l, 
  fdout_011, 
  fuse_l2d_data_in_110, 
  fuse_l2d_rid_110, 
  fuse_l2d_wren_110, 
  fuse_l2d_reset_110_l, 
  fdout_110, 
  fuse_l2d_data_in_010, 
  fuse_l2d_rid_010, 
  fuse_l2d_wren_010, 
  fuse_l2d_reset_010_l, 
  fdout_010, 
  fuse_l2d_data_in_121, 
  fuse_l2d_rid_121, 
  fuse_l2d_wren_121, 
  fuse_l2d_reset_121_l, 
  fdout_121, 
  fuse_l2d_data_in_021, 
  fuse_l2d_rid_021, 
  fuse_l2d_wren_021, 
  fuse_l2d_reset_021_l, 
  fdout_021, 
  fuse_l2d_data_in_120, 
  fuse_l2d_rid_120, 
  fuse_l2d_wren_120, 
  fuse_l2d_reset_120_l, 
  fdout_120, 
  fuse_l2d_data_in_020, 
  fuse_l2d_rid_020, 
  fuse_l2d_wren_020, 
  fuse_l2d_reset_020_l, 
  fdout_020, 
  fuse_l2d_data_in_101, 
  fuse_l2d_rid_101, 
  fuse_l2d_wren_101, 
  fuse_l2d_reset_101_l, 
  fdout_101, 
  fuse_l2d_data_in_001, 
  fuse_l2d_rid_001, 
  fuse_l2d_wren_001, 
  fuse_l2d_reset_001_l, 
  fdout_001, 
  fuse_l2d_data_in_100, 
  fuse_l2d_rid_100, 
  fuse_l2d_wren_100, 
  fuse_l2d_reset_100_l, 
  fdout_100, 
  fuse_l2d_data_in_000, 
  fuse_l2d_rid_000, 
  fuse_l2d_wren_000, 
  fuse_l2d_reset_000_l, 
  fdout_000, 
  siclk_peri, 
  soclk_peri, 
  pce_ov_peri, 
  pce_peri, 
  scan_collarin_peri, 
  scan_collarout_peri, 
  wr_inhibit_peri, 
  clk_stop_peri, 
  wee_l_q00, 
  wee_l_q01, 
  wee_l_q10, 
  wee_l_q11, 
  wee_l_q20, 
  wee_l_q21, 
  wee_l_q30, 
  wee_l_q31, 
  delout00, 
  delout01, 
  delout10, 
  delout11, 
  delout20, 
  delout21, 
  delout30, 
  delout31);
wire tcu_array_wr_inhibit;
wire l1clk_in;
wire l1clk_intnl;
wire evit_pce_c6;
wire l1clk_evict_c6;
wire [8:0] ff_cache_set_c3_scanin;
wire [8:0] ff_cache_set_c3_scanout;
wire [8:0] cache_set_c3;
wire [3:0] ff_cache_col_offset_c3_scanin;
wire [3:0] ff_cache_col_offset_c3_scanout;
wire [3:0] cache_col_offset_c3;
wire [3:0] ff_cache_col_offset_c4_scanin;
wire [3:0] ff_cache_col_offset_c4_scanout;
wire [3:0] cache_col_offset_c4_muxsel;
wire [3:0] ff_cache_col_offset_c5_muxsel_scanin;
wire [3:0] ff_cache_col_offset_c5_muxsel_scanout;
wire [3:0] cache_col_offset_c5_muxsel;
wire [1:0] ff_cache_col_offset_c52_scanin;
wire [1:0] ff_cache_col_offset_c52_scanout;
wire [3:2] cache_col_offset_c52;
wire cache_col_offset_c5_muxsel_3_or_1;
wire [0:0] ff_cache_col_offset_c52_topsel_scanin;
wire [0:0] ff_cache_col_offset_c52_topsel_scanout;
wire cache_col_offset_c52_topsel;
wire cache_col_offset_all_c3;
wire [0:0] ff_cache_col_offset_all_c4_scanin;
wire [0:0] ff_cache_col_offset_all_c4_scanout;
wire cache_col_offset_all_c4;
wire [0:0] ff_cache_col_offset_all_c5_scanin;
wire [0:0] ff_cache_col_offset_all_c5_scanout;
wire cache_col_offset_all_c5;
wire [0:0] ff_cache_col_offset_all_c6_scanin;
wire [0:0] ff_cache_col_offset_all_c6_scanout;
wire cache_col_offset_all_c6;
wire [0:0] ff_cache_col_offset_all_c7_scanin;
wire [0:0] ff_cache_col_offset_all_c7_scanout;
wire tcu_array_wr_inhibit_n;
wire cache_col_offset_c3_2_tcu_array_wr_inhibit_n;
wire cache_col_offset_c3_0_tcu_array_wr_inhibit_n;
wire cache_col_offset_c3_3_tcu_array_wr_inhibit_n;
wire cache_col_offset_c3_1_tcu_array_wr_inhibit_n;
wire cache_col_offset_c4_tog_001_0_n;
wire cache_col_offset_c4_tog_101_0_n;
wire cache_col_offset_c4_tog_001_1_n;
wire cache_col_offset_c4_tog_101_1_n;
wire cache_col_offset_c4_tog_023_0_n;
wire cache_col_offset_c4_tog_123_0_n;
wire cache_col_offset_c4_tog_023_1_n;
wire cache_col_offset_c4_tog_123_1_n;
wire [1:0] cache_col_offset_c4_tog_001;
wire [1:0] cache_col_offset_c4_tog_101;
wire [1:0] cache_col_offset_c4_tog_023;
wire [1:0] cache_col_offset_c4_tog_123;
wire [3:0] cache_col_offset_c3_n;
wire [3:0] wr_inhibit_cache_col_offset_c3_l;
wire [3:0] wr_inhibit_cache_col_offset_c3;
wire [1:0] cache_col_offset_c4_tog_001_n;
wire wayerr_c3_n;
wire [1:0] wayerr_cache_col_offset_c4_l_tog_001;
wire [1:0] cache_col_offset_c4_tog_101_n;
wire [1:0] wayerr_cache_col_offset_c4_l_tog_101;
wire [1:0] cache_col_offset_c4_tog_023_n;
wire [1:0] wayerr_cache_col_offset_c4_l_tog_023;
wire [1:0] cache_col_offset_c4_tog_123_n;
wire [1:0] wayerr_cache_col_offset_c4_l_tog_123;
wire cache_col_offset_c3_top;
wire cache_col_offset_c3_bot;
wire [1:0] cache_col_offset_c4_tog_in_001;
wire [1:0] cache_col_offset_c4_tog_in_101;
wire [1:0] cache_col_offset_c4_tog_in_023;
wire [1:0] cache_col_offset_c4_tog_in_123;
wire [1:0] ff_cache_col_offset_c4_tog_001_scanin;
wire [1:0] ff_cache_col_offset_c4_tog_001_scanout;
wire [1:0] ff_cache_col_offset_c4_tog_101_scanin;
wire [1:0] ff_cache_col_offset_c4_tog_101_scanout;
wire [1:0] ff_cache_col_offset_c4_tog_023_scanin;
wire [1:0] ff_cache_col_offset_c4_tog_023_scanout;
wire [1:0] ff_cache_col_offset_c4_tog_123_scanin;
wire [1:0] ff_cache_col_offset_c4_tog_123_scanout;
wire [3:0] ff_cache_col_offset_c4_001_scanin;
wire [3:0] ff_cache_col_offset_c4_001_scanout;
wire [3:0] cache_col_offset_c4_001;
wire [3:0] ff_cache_col_offset_c4_101_scanin;
wire [3:0] ff_cache_col_offset_c4_101_scanout;
wire [3:0] cache_col_offset_c4_101;
wire [3:0] ff_cache_col_offset_c4_023_scanin;
wire [3:0] ff_cache_col_offset_c4_023_scanout;
wire [3:0] cache_col_offset_c4_023;
wire [3:0] ff_cache_col_offset_c4_123_scanin;
wire [3:0] ff_cache_col_offset_c4_123_scanout;
wire [3:0] cache_col_offset_c4_123;
wire [3:0] cache_col_offset_c5_001_in;
wire [3:0] cache_col_offset_c5_101_in;
wire [3:0] cache_col_offset_c5_023_in;
wire [3:0] cache_col_offset_c5_123_in;
wire [3:0] ff_cache_col_offset_c5_001_scanin;
wire [3:0] ff_cache_col_offset_c5_001_scanout;
wire [3:0] cache_col_offset_c5_001;
wire [3:0] ff_cache_col_offset_c5_101_scanin;
wire [3:0] ff_cache_col_offset_c5_101_scanout;
wire [3:0] cache_col_offset_c5_101;
wire [3:0] ff_cache_col_offset_c5_023_scanin;
wire [3:0] ff_cache_col_offset_c5_023_scanout;
wire [3:0] cache_col_offset_c5_023;
wire [3:0] ff_cache_col_offset_c5_123_scanin;
wire [3:0] ff_cache_col_offset_c5_123_scanout;
wire [3:0] cache_col_offset_c5_123;
wire cache_rd_wr_c3_generic;
wire cache_rd_wr_c3_next_stage;
wire [0:0] ff_cache_cache_rd_wr_c4_scanin;
wire [0:0] ff_cache_cache_rd_wr_c4_scanout;
wire cache_rd_wr_c4;
wire [0:0] ff_cache_cache_rd_wr_c5_00_scanin;
wire [0:0] ff_cache_cache_rd_wr_c5_00_scanout;
wire cache_rd_wr_c5_00;
wire [0:0] ff_cache_cache_rd_wr_c5_01_scanin;
wire [0:0] ff_cache_cache_rd_wr_c5_01_scanout;
wire cache_rd_wr_c5_01;
wire [0:0] ff_cache_cache_rd_wr_c5_20_scanin;
wire [0:0] ff_cache_cache_rd_wr_c5_20_scanout;
wire cache_rd_wr_c5_20;
wire [0:0] ff_cache_cache_rd_wr_c5_21_scanin;
wire [0:0] ff_cache_cache_rd_wr_c5_21_scanout;
wire cache_rd_wr_c5_21;
wire [15:0] ff_cache_word_en_c3_scanin;
wire [15:0] ff_cache_word_en_c3_scanout;
wire [15:0] cache_word_en_c3;
wire [0:0] ff_cache_sel_fbdecc_c4_scanin;
wire [0:0] ff_cache_sel_fbdecc_c4_scanout;
wire cache_sel_fbdecc_c4;
wire [0:0] ff_cache_sel_fbdecc_c5_scanin;
wire [0:0] ff_cache_sel_fbdecc_c5_scanout;
wire cache_sel_fbdecc_c5;
wire cache_sel_fbdecc_c5_n;
wire [77:0] ff_l2t_l2d_stdecc_c3_scanin;
wire [77:0] ff_l2t_l2d_stdecc_c3_scanout;
wire [77:0] l2t_l2d_stdecc_c3;
wire [0:0] ff_cache_fb_hit_c4_scanin;
wire [0:0] ff_cache_fb_hit_c4_scanout;
wire cache_fb_hit_c4;
wire [0:0] ff_cache_fb_hit_c5_scanin;
wire [0:0] ff_cache_fb_hit_c5_scanout;
wire cache_fb_hit_c5;
wire [0:0] ff_cache_fb_hit_c52_scanin;
wire [0:0] ff_cache_fb_hit_c52_scanout;
wire cache_fb_hit_c52;
wire cache_fb_hit_c52_n;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo0_1_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo0_1_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo0_2_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo0_2_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi0_1_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi0_1_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi0_2_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi0_2_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo0_3_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo0_3_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo0_4_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo0_4_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi0_3_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi0_3_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi0_4_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi0_4_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo1_1_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo1_1_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo1_2_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo1_2_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi1_1_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi1_1_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi1_2_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi1_2_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo1_3_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo1_3_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo1_4_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_lo1_4_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi1_3_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi1_3_scanout;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi1_4_scanin;
wire [38:0] ff_l2b_l2d_fbdecc_c52_hi1_4_scanout;
wire [38:0] ff_l2d_decc_out_c6_lo0_1_scanin;
wire [38:0] ff_l2d_decc_out_c6_lo0_1_scanout;
wire [155:0] l2d_l2t_decc_c52_0;
wire [38:0] ff_l2d_decc_out_c6_lo0_2_scanin;
wire [38:0] ff_l2d_decc_out_c6_lo0_2_scanout;
wire [38:0] ff_l2d_decc_out_c6_hi0_1_scanin;
wire [38:0] ff_l2d_decc_out_c6_hi0_1_scanout;
wire [38:0] ff_l2d_decc_out_c6_hi0_2_scanin;
wire [38:0] ff_l2d_decc_out_c6_hi0_2_scanout;
wire [38:0] ff_l2d_decc_out_c6_lo0_3_scanin;
wire [38:0] ff_l2d_decc_out_c6_lo0_3_scanout;
wire [155:0] l2d_l2t_decc_c52_1;
wire [38:0] ff_l2d_decc_out_c6_lo0_4_scanin;
wire [38:0] ff_l2d_decc_out_c6_lo0_4_scanout;
wire [38:0] ff_l2d_decc_out_c6_hi0_3_scanin;
wire [38:0] ff_l2d_decc_out_c6_hi0_3_scanout;
wire [38:0] ff_l2d_decc_out_c6_hi0_4_scanin;
wire [38:0] ff_l2d_decc_out_c6_hi0_4_scanout;
wire [38:0] ff_l2d_decc_out_c6_lo1_1_scanin;
wire [38:0] ff_l2d_decc_out_c6_lo1_1_scanout;
wire [155:0] l2d_l2t_decc_c52_2;
wire [38:0] ff_l2d_decc_out_c6_lo1_2_scanin;
wire [38:0] ff_l2d_decc_out_c6_lo1_2_scanout;
wire [38:0] ff_l2d_decc_out_c6_hi1_1_scanin;
wire [38:0] ff_l2d_decc_out_c6_hi1_1_scanout;
wire [38:0] ff_l2d_decc_out_c6_hi1_2_scanin;
wire [38:0] ff_l2d_decc_out_c6_hi1_2_scanout;
wire [38:0] ff_l2d_decc_out_c6_lo1_3_scanin;
wire [38:0] ff_l2d_decc_out_c6_lo1_3_scanout;
wire [155:0] l2d_l2t_decc_c52_3;
wire [38:0] ff_l2d_decc_out_c6_lo1_4_scanin;
wire [38:0] ff_l2d_decc_out_c6_lo1_4_scanout;
wire [38:0] ff_l2d_decc_out_c6_hi1_3_scanin;
wire [38:0] ff_l2d_decc_out_c6_hi1_3_scanout;
wire [38:0] ff_l2d_decc_out_c6_hi1_4_scanin;
wire [38:0] ff_l2d_decc_out_c6_hi1_4_scanout;
wire [155:0] cache_decc_out_0_c52;
wire [155:0] cache_decc_out_1_c52;
wire [155:0] cache_decc_out_2_c52;
wire [155:0] cache_decc_out_3_c52;
wire [623:0] cache_decc_out_c52;
wire cache_rd_wr_c3;
wire [155:0] l2d_l2t_decc_c52_20;
wire [155:0] l2d_l2t_decc_c52_31;
wire itis0000;
wire itis0001;
wire itis0010;
wire itis0011;
wire itis0100;
wire itis0101;
wire itis0110;
wire itis0111;
wire itis1000;
wire itis1001;
wire itis1010;
wire itis1011;
wire itis1100;
wire itis1101;
wire itis1110;
wire itis1111;
wire l2b_l2d_fuse_rid_d_0n;
wire or_fuse_l2d_rid_131;
wire stage1_mux_sel0;
wire or_fuse_l2d_rid_121;
wire stage1_mux_sel1;
wire stage1_mux_sel2;
wire [9:0] fdout_stage1;
wire or_fuse_l2d_rid_031;
wire stage2_mux_sel0;
wire or_fuse_l2d_rid_021;
wire stage2_mux_sel1;
wire stage2_mux_sel2;
wire [9:0] fdout_stage2;
wire or_fuse_l2d_rid_130;
wire stage3_mux_sel0;
wire or_fuse_l2d_rid_120;
wire stage3_mux_sel1;
wire stage3_mux_sel2;
wire [9:0] fdout_stage3;
wire or_fuse_l2d_rid_030;
wire stage4_mux_sel0;
wire or_fuse_l2d_rid_020;
wire stage4_mux_sel1;
wire stage4_mux_sel2;
wire [9:0] fdout_stage4;
wire or_fuse_l2d_rid_010;
wire stage10_mux_sel0;
wire or_fuse_l2d_rid_000;
wire stage10_mux_sel1;
wire stage10_mux_sel2;
wire [9:0] fdout_stage10;
wire or_fuse_l2d_rid_110;
wire stage20_mux_sel0;
wire or_fuse_l2d_rid_100;
wire stage20_mux_sel1;
wire stage20_mux_sel2;
wire [9:0] fdout_stage20;
wire or_fuse_l2d_rid_011;
wire stage30_mux_sel0;
wire or_fuse_l2d_rid_001;
wire stage30_mux_sel1;
wire stage30_mux_sel2;
wire [9:0] fdout_stage30;
wire or_fuse_l2d_rid_111;
wire stage40_mux_sel0;
wire or_fuse_l2d_rid_101;
wire stage40_mux_sel1;
wire stage40_mux_sel2;
wire [9:0] fdout_stage40;
wire l2b_l2d_fuse_rid_d_6n;
wire delout20_rgt;
wire delout31_rgt;
wire delout20_lft;
wire delout31_lft;
wire so_q23;
wire so_tstmod;



input	[15:0]	l2t_l2d_word_en_c2;
input	        l2t_l2d_fbrd_c3;
input	[3:0]   l2t_l2d_col_offset_c2;
input	[8:0]   l2t_l2d_set_c2;
input	        l2t_l2d_rd_wr_c3;
input	[15:0]  l2t_l2d_way_sel_c3;
input	        l2t_l2d_fb_hit_c3;
input	        l2clk;
input	        tcu_aclk;
input	        tcu_bclk;
input	        tcu_scan_en;
input	        tcu_pce_ov;
input	        tcu_ce;
input	        tcu_clk_stop;
input	        array_wr_inhibit;
input	        scan_in;
input		tcu_se_scancollar_in;
input		tcu_se_scancollar_out;
input		wayerr_c3;
input		l2t_l2d_pwrsav_ov_stg;
output	        scan_out;
output		cache_col_offset_all_c7;
output		aclk;
output		bclk;
output		scan_en_clsrhdr;

// I/O from Quads

input	[623:0] l2b_l2d_fbdecc_c5;	// filbuf data 
input	[77:0]  l2t_l2d_stdecc_c2;	// store data input
// CHANGE 2
//input	[623:0] cache_decc_out_c52b_l;	// quad 0 read data
input	[623:0] cache_decc_out_c5b;	// quad 0 read data

output	[623:0] l2d_decc_out_c6; 	// evict data
output	[623:0]	cache_decc_in_c3b_l; 	// store data | fbdecc data getting piped to quad
//output	[155:0]	l2d_l2t_decc_c6;	// read data rtn to load 16B
output	[155:0]	l2d_l2t_decc_c52_mux;	// read data rtn to load 16B

output	[15:0]  cache_way_sel_c3_00;
output	[15:0]  cache_way_sel_c3_01;
output	[15:0]  cache_way_sel_c3_10;
output	[15:0]  cache_way_sel_c3_11;
output	[15:0]  cache_way_sel_c3_20;
output	[15:0]  cache_way_sel_c3_21;
output	[15:0]  cache_way_sel_c3_30;
output	[15:0]  cache_way_sel_c3_31;

output    	cache_wayerr_c3_00;
output    	cache_wayerr_c3_01;
output    	cache_wayerr_c3_10;
output    	cache_wayerr_c3_11;
output    	cache_wayerr_c3_20;
output    	cache_wayerr_c3_21;
output    	cache_wayerr_c3_30;
output    	cache_wayerr_c3_31;


output	[8:0]   cache_set_c3_00;	 
output	[8:0]   cache_set_c3_01;	 
output	[8:0]   cache_set_c3_10;	 
output	[8:0]   cache_set_c3_11;	 
output	[8:0]   cache_set_c3_20;	 
output	[8:0]   cache_set_c3_21;	 
output	[8:0]   cache_set_c3_30;	 
output	[8:0]   cache_set_c3_31;	 

output	   cache_col_offset_c3_00;
output	   cache_col_offset_c3_01;
output	   cache_col_offset_c3_10;
output	   cache_col_offset_c3_11;
output	   cache_col_offset_c3_20;
output	   cache_col_offset_c3_21;
output	   cache_col_offset_c3_30;
output	   cache_col_offset_c3_31;

output     cache_col_offset_c4_l_00;
output     cache_col_offset_c4_l_01;
output     cache_col_offset_c4_l_10;
output     cache_col_offset_c4_l_11;
output     cache_col_offset_c4_l_20;
output     cache_col_offset_c4_l_21;
output     cache_col_offset_c4_l_30;
output     cache_col_offset_c4_l_31;

output  [1:0]   cache_col_offset_c5_00;
output  [1:0]   cache_col_offset_c5_01;
output  [1:0]   cache_col_offset_c5_10;
output  [1:0]   cache_col_offset_c5_11;
output  [1:0]   cache_col_offset_c5_20;
output  [1:0]   cache_col_offset_c5_21;
output  [1:0]   cache_col_offset_c5_30;
output  [1:0]   cache_col_offset_c5_31;

output		cache_rd_wr_c3_00;
output		cache_rd_wr_c3_01;
output		cache_rd_wr_c3_10;
output		cache_rd_wr_c3_11;
output		cache_rd_wr_c3_20;
output		cache_rd_wr_c3_21;
output		cache_rd_wr_c3_30;
output		cache_rd_wr_c3_31;


output		cache_readen_c5_00;
output		cache_readen_c5_01;
output		cache_readen_c5_10;
output		cache_readen_c5_11;
output		cache_readen_c5_20;
output		cache_readen_c5_21;
output		cache_readen_c5_30;
output		cache_readen_c5_31;

output	[3:0]   cache_word_en_c3_00;    
output	[3:0]   cache_word_en_c3_01;    
output	[3:0]   cache_word_en_c3_10;    
output	[3:0]   cache_word_en_c3_11;    
output	[3:0]   cache_word_en_c3_20;    
output	[3:0]   cache_word_en_c3_21;    
output	[3:0]   cache_word_en_c3_30;    
output	[3:0]   cache_word_en_c3_31;    

output		tcu_pce_ov_00;
output		tcu_pce_ov_01;
output		tcu_pce_ov_10;
output		tcu_pce_ov_11;
output		tcu_pce_ov_20;
output		tcu_pce_ov_21;
output		tcu_pce_ov_30;
output		tcu_pce_ov_31;
output		tcu_pce_00;
output		tcu_pce_01;
output		tcu_pce_10;
output		tcu_pce_11;
output		tcu_pce_20;
output		tcu_pce_21;
output		tcu_pce_30;
output		tcu_pce_31;
output		tcu_clk_stop_00;
output		tcu_clk_stop_01;
output		tcu_clk_stop_10;
output		tcu_clk_stop_11;
output		tcu_clk_stop_20;
output		tcu_clk_stop_21;
output		tcu_clk_stop_30;
output		tcu_clk_stop_31;

output		se_00;
output		se_01;
output		se_10;
output		se_11;
output		se_20;
output		se_21;
output		se_30;
output		se_31;
// Redudancy

input   [9:0]   l2b_l2d_fuse_l2d_data_in_d;
input   [6:0]   l2b_l2d_fuse_rid_d;
input           l2b_l2d_fuse_reset_l;
input           l2b_l2d_fuse_l2d_wren_d;
output  [9:0]   efc_fuse_data;

// io to the ram
output	[9:0]	fuse_l2d_data_in_131;
output	[4:0]	fuse_l2d_rid_131;
output		fuse_l2d_wren_131;
output		fuse_l2d_reset_131_l;
input	[9:0]	fdout_131;

output	[9:0]	fuse_l2d_data_in_031;
output	[4:0]	fuse_l2d_rid_031;
output		fuse_l2d_wren_031;
output		fuse_l2d_reset_031_l;
input	[9:0]	fdout_031;

output	[9:0]	fuse_l2d_data_in_130;
output	[4:0]	fuse_l2d_rid_130;
output		fuse_l2d_wren_130;
output		fuse_l2d_reset_130_l;
input	[9:0]	fdout_130;

output	[9:0]	fuse_l2d_data_in_030;
output	[4:0]	fuse_l2d_rid_030;
output		fuse_l2d_wren_030;
output		fuse_l2d_reset_030_l;
input	[9:0]	fdout_030;

output	[9:0]	fuse_l2d_data_in_111;
output	[4:0]	fuse_l2d_rid_111;
output		fuse_l2d_wren_111;
output		fuse_l2d_reset_111_l;
input	[9:0]	fdout_111;



output  [9:0]   fuse_l2d_data_in_011;
output  [4:0]   fuse_l2d_rid_011;
output          fuse_l2d_wren_011;
output          fuse_l2d_reset_011_l;
input  [9:0]   fdout_011;


output	[9:0]	fuse_l2d_data_in_110;
output	[4:0]	fuse_l2d_rid_110;
output		fuse_l2d_wren_110;
output		fuse_l2d_reset_110_l;
input	[9:0]	fdout_110;


output	[9:0]	fuse_l2d_data_in_010;
output	[4:0]	fuse_l2d_rid_010;
output		fuse_l2d_wren_010;
output		fuse_l2d_reset_010_l;
input	[9:0]	fdout_010;

output	[9:0]	fuse_l2d_data_in_121;
output	[4:0]	fuse_l2d_rid_121;
output		fuse_l2d_wren_121;
output		fuse_l2d_reset_121_l;
input	[9:0]	fdout_121;


output	[9:0]	fuse_l2d_data_in_021;
output	[4:0]	fuse_l2d_rid_021;
output		fuse_l2d_wren_021;
output		fuse_l2d_reset_021_l;
input	[9:0]	fdout_021;

output	[9:0]	fuse_l2d_data_in_120;
output	[4:0]	fuse_l2d_rid_120;
output		fuse_l2d_wren_120;
output		fuse_l2d_reset_120_l;
input	[9:0]	fdout_120;

output	[9:0]	fuse_l2d_data_in_020;
output	[4:0]	fuse_l2d_rid_020;
output		fuse_l2d_wren_020;
output		fuse_l2d_reset_020_l;
input	[9:0]	fdout_020;

output	[9:0]	fuse_l2d_data_in_101;
output	[4:0]	fuse_l2d_rid_101;
output		fuse_l2d_wren_101;
output		fuse_l2d_reset_101_l;
input	[9:0]	fdout_101;

output	[9:0]	fuse_l2d_data_in_001;
output	[4:0]	fuse_l2d_rid_001;
output		fuse_l2d_wren_001;
output		fuse_l2d_reset_001_l;
input	[9:0]	fdout_001;

output	[9:0]	fuse_l2d_data_in_100;
output	[4:0]	fuse_l2d_rid_100;
output		fuse_l2d_wren_100;
output		fuse_l2d_reset_100_l;
input	[9:0]	fdout_100;

output	[9:0]	fuse_l2d_data_in_000;
output	[4:0]	fuse_l2d_rid_000;
output		fuse_l2d_wren_000;
output		fuse_l2d_reset_000_l;
input	[9:0]	fdout_000;

output		siclk_peri;
output		soclk_peri;
output		pce_ov_peri;
output		pce_peri;
output		scan_collarin_peri;
output		scan_collarout_peri;
output		wr_inhibit_peri;
output		clk_stop_peri;

output		wee_l_q00;
output		wee_l_q01;
output		wee_l_q10;
output		wee_l_q11;
output		wee_l_q20;
output		wee_l_q21;
output		wee_l_q30;
output		wee_l_q31;

output 		delout00;
output 		delout01;
output 		delout10;
output 		delout11;
output 		delout20;
output 		delout21;
output 		delout30;
output 		delout31;

//////////////////////////////////////////////////////////////////////////////
assign tcu_array_wr_inhibit = array_wr_inhibit;
wire pce_ov;
wire siclk;
wire soclk;
//wire scan_out;

//assign stop = tcu_clk_stop;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
//assign se = tcu_scan_en;
assign pce_ov = tcu_pce_ov;
assign aclk = tcu_aclk;
assign bclk = tcu_bclk;
assign scan_en_clsrhdr = tcu_scan_en;

assign siclk_peri = siclk;
assign soclk_peri = soclk;
assign pce_ov_peri = pce_ov;
assign pce_peri = tcu_ce;
assign scan_collarin_peri = tcu_se_scancollar_in;
assign scan_collarout_peri = tcu_se_scancollar_out;
assign wr_inhibit_peri = tcu_array_wr_inhibit;
assign clk_stop_peri = tcu_clk_stop;

assign wee_l_q00 = ~tcu_array_wr_inhibit;
assign wee_l_q01 = ~tcu_array_wr_inhibit;
assign wee_l_q10 = ~tcu_array_wr_inhibit;
assign wee_l_q11 = ~tcu_array_wr_inhibit;
assign wee_l_q20 = ~tcu_array_wr_inhibit;
assign wee_l_q21 = ~tcu_array_wr_inhibit;
assign wee_l_q30 = ~tcu_array_wr_inhibit;
assign wee_l_q31 = ~tcu_array_wr_inhibit;

//////////////////////////////////////////////////////////////////////////////

wire	[623:0] cache_decc_in_c3b_l;

wire	[623:0]	cache_decc_in_c3;
//wire	[623:0]	cache_decc_out_c52;
wire	[623:0]	concat_st_decc_out_c3;
wire	[623:0]	l2d_decc_out_c52;
wire	[155:0]	l2d_l2t_decc_c52;
wire	[155:0]	l2d_l2t_decc_c6;		// read data rtn to load 16B
wire	[623:0] l2b_l2d_fbdecc_c52; 
wire	[623:0] l2b_l2d_fbdecc_c5; 


n2_l2d_ctrlio_cust_l1clkhdr_ctl_macro l1_clk_in_hdr (
        .l2clk  (l2clk),
        .se     (tcu_se_scancollar_in),
        .l1en   (tcu_ce),
        .pce_ov (tcu_pce_ov),
        .stop   (tcu_clk_stop),
        .l1clk  (l1clk_in)
        );

n2_l2d_ctrlio_cust_l1clkhdr_ctl_macro l1_clk_intnl_hdr (
        .l2clk  (l2clk),
        .se     (tcu_scan_en),
        .l1en   (tcu_ce),
        .pce_ov (tcu_pce_ov),
        .stop   (tcu_clk_stop),
        .l1clk  (l1clk_intnl)
        );

n2_l2d_ctrlio_cust_l1clkhdr_ctl_macro l1_clk_evict_c6_hdr (
        .l2clk  (l2clk),
        .se     (tcu_scan_en),
        .l1en   (evit_pce_c6),
        .pce_ov (tcu_pce_ov),
        .stop   (tcu_clk_stop),
        .l1clk  (l1clk_evict_c6)
        );

assign cache_way_sel_c3_00[15:0] = l2t_l2d_way_sel_c3[15:0];
assign cache_way_sel_c3_01[15:0] = l2t_l2d_way_sel_c3[15:0];
assign cache_way_sel_c3_10[15:0] = l2t_l2d_way_sel_c3[15:0];
assign cache_way_sel_c3_11[15:0] = l2t_l2d_way_sel_c3[15:0];
assign cache_way_sel_c3_20[15:0] = l2t_l2d_way_sel_c3[15:0];
assign cache_way_sel_c3_21[15:0] = l2t_l2d_way_sel_c3[15:0];
assign cache_way_sel_c3_30[15:0] = l2t_l2d_way_sel_c3[15:0];
assign cache_way_sel_c3_31[15:0] = l2t_l2d_way_sel_c3[15:0];


//
// Way select when more than one is turned on
//


assign cache_wayerr_c3_00 = wayerr_c3;
assign cache_wayerr_c3_01 = wayerr_c3;
assign cache_wayerr_c3_10 = wayerr_c3;
assign cache_wayerr_c3_11 = wayerr_c3;
assign cache_wayerr_c3_20 = wayerr_c3;
assign cache_wayerr_c3_21 = wayerr_c3;
assign cache_wayerr_c3_30 = wayerr_c3;
assign cache_wayerr_c3_31 = wayerr_c3;

// set

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_9   ff_cache_set_c3   
     (
     .scan_in(ff_cache_set_c3_scanin[8:0]),
     .scan_out(ff_cache_set_c3_scanout[8:0]),
     .din	     (l2t_l2d_set_c2[8:0]),
     .l1clk	       (l1clk_in),
     .dout	     (cache_set_c3[8:0]),
  .siclk(siclk),
  .soclk(soclk)
     );

assign cache_set_c3_00[8:0] = cache_set_c3[8:0];         
assign cache_set_c3_01[8:0] = cache_set_c3[8:0];         
assign cache_set_c3_10[8:0] = cache_set_c3[8:0];         
assign cache_set_c3_11[8:0] = cache_set_c3[8:0];         
assign cache_set_c3_20[8:0] = cache_set_c3[8:0];         
assign cache_set_c3_21[8:0] = cache_set_c3[8:0];         
assign cache_set_c3_30[8:0] = cache_set_c3[8:0];         
assign cache_set_c3_31[8:0] = cache_set_c3[8:0];         

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c3   
     (
     .scan_in(ff_cache_col_offset_c3_scanin[3:0]),
     .scan_out(ff_cache_col_offset_c3_scanout[3:0]),
     .din	     (l2t_l2d_col_offset_c2[3:0]),
     .l1clk	       (l1clk_in),
     .dout	     (cache_col_offset_c3[3:0]),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c4   
                (
                .scan_in(ff_cache_col_offset_c4_scanin[3:0]),
                .scan_out(ff_cache_col_offset_c4_scanout[3:0]),
                .din            (cache_col_offset_c3[3:0]),
                .l1clk            (l1clk_intnl),
                .dout           (cache_col_offset_c4_muxsel[3:0]),
  .siclk(siclk),
  .soclk(soclk)
                );

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c5_muxsel   
                (
                .scan_in(ff_cache_col_offset_c5_muxsel_scanin[3:0]),
                .scan_out(ff_cache_col_offset_c5_muxsel_scanout[3:0]),
                .din            (cache_col_offset_c4_muxsel[3:0]),
                .l1clk            (l1clk_intnl),
                .dout           (cache_col_offset_c5_muxsel[3:0]),
  .siclk(siclk),
  .soclk(soclk)
                );



n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_2   ff_cache_col_offset_c52   
                (
                .scan_in(ff_cache_col_offset_c52_scanin[1:0]),
                .scan_out(ff_cache_col_offset_c52_scanout[1:0]),
                .din            (cache_col_offset_c5_muxsel[3:2]),
                .l1clk            (l1clk_intnl),
                .dout           (cache_col_offset_c52[3:2]),
  .siclk(siclk),
  .soclk(soclk)
                );

n2_l2d_ctrlio_cust_or_macro__width_1 slice_or_col_offset_c5_3_1 
	(
	.dout	(cache_col_offset_c5_muxsel_3_or_1),
	.din0	(cache_col_offset_c5_muxsel[3]),
	.din1	(cache_col_offset_c5_muxsel[1])
	);


n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_1   ff_cache_col_offset_c52_topsel   
     (
     .scan_in(ff_cache_col_offset_c52_topsel_scanin[0:0]),
     .scan_out(ff_cache_col_offset_c52_topsel_scanout[0:0]),
//     .din	     (cache_col_offset_c5_muxsel[3] | cache_col_offset_c5_muxsel[1]),
	.din	(cache_col_offset_c5_muxsel_3_or_1),
     .l1clk	       (l1clk_intnl),
     .dout	     (cache_col_offset_c52_topsel),
  .siclk(siclk),
  .soclk(soclk)
     );


//assign cache_col_offset_all_c3 = cache_col_offset_c3[3] & 
//		cache_col_offset_c3[2] & cache_col_offset_c3[1] & cache_col_offset_c3[0];

n2_l2d_ctrlio_cust_and_macro__ports_4__width_1 slice_and_cache_col_offset_all_c3 
	(
	.dout	(cache_col_offset_all_c3),
	.din3	(cache_col_offset_c3[3]),
	.din2	(cache_col_offset_c3[2]),
	.din1	(cache_col_offset_c3[1]),
	.din0	(cache_col_offset_c3[0])
	);


n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_1   ff_cache_col_offset_all_c4   
     (
     .scan_in(ff_cache_col_offset_all_c4_scanin[0:0]),
     .scan_out(ff_cache_col_offset_all_c4_scanout[0:0]),
     .din	     (cache_col_offset_all_c3),
     .l1clk	       (l1clk_intnl),
     .dout	     (cache_col_offset_all_c4),
  .siclk(siclk),
  .soclk(soclk)
     );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_1   ff_cache_col_offset_all_c5  
     (
     .scan_in(ff_cache_col_offset_all_c5_scanin[0:0]),
     .scan_out(ff_cache_col_offset_all_c5_scanout[0:0]),
     .din	     (cache_col_offset_all_c4),
     .l1clk	       (l1clk_intnl),
     .dout	     (cache_col_offset_all_c5),
  .siclk(siclk),
  .soclk(soclk)
     );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_1   ff_cache_col_offset_all_c6   
     (
     .scan_in(ff_cache_col_offset_all_c6_scanin[0:0]),
     .scan_out(ff_cache_col_offset_all_c6_scanout[0:0]),
     .din	     (cache_col_offset_all_c5),
     .l1clk	       (l1clk_intnl),
     .dout	     (cache_col_offset_all_c6),
  .siclk(siclk),
  .soclk(soclk)
     );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_1   ff_cache_col_offset_all_c7   
     (
     .scan_in(ff_cache_col_offset_all_c7_scanin[0:0]),
     .scan_out(ff_cache_col_offset_all_c7_scanout[0:0]),
     .din	     (cache_col_offset_all_c6),
     .l1clk	       (l1clk_intnl),
     .dout	     (cache_col_offset_all_c7),
  .siclk(siclk),
  .soclk(soclk)
     ); 	     
	

//assign evit_pce_c6 = cache_col_offset_all_c6 | l2t_l2d_pwrsav_ov_stg;

n2_l2d_ctrlio_cust_or_macro__width_1 or_slice_evit_pce_c6 
	(
	.dout	(evit_pce_c6),
	.din0	(cache_col_offset_all_c6),
	.din1	(l2t_l2d_pwrsav_ov_stg)
	);




//assign    cache_col_offset_c3_00 = |{cache_col_offset_c3[2],cache_col_offset_c3[0]};
//assign    cache_col_offset_c3_01 = |{cache_col_offset_c3[2],cache_col_offset_c3[0]};
//assign    cache_col_offset_c3_10 = |{cache_col_offset_c3[3],cache_col_offset_c3[1]};
//assign    cache_col_offset_c3_11 = |{cache_col_offset_c3[3],cache_col_offset_c3[1]};
//assign    cache_col_offset_c3_20 = |{cache_col_offset_c3[2],cache_col_offset_c3[0]};
//assign    cache_col_offset_c3_21 = |{cache_col_offset_c3[2],cache_col_offset_c3[0]};
//assign    cache_col_offset_c3_30 = |{cache_col_offset_c3[3],cache_col_offset_c3[1]};
//assign    cache_col_offset_c3_31 = |{cache_col_offset_c3[3],cache_col_offset_c3[1]};


n2_l2d_ctrlio_cust_inv_macro__width_1 inv_tcu_array_wr_inhibit 
	(
	.dout	(tcu_array_wr_inhibit_n),
	.din	(tcu_array_wr_inhibit)
	);

n2_l2d_ctrlio_cust_and_macro__width_1 and_slice_cache_col_offset_c3_00_0 
	(
	.dout	(cache_col_offset_c3_2_tcu_array_wr_inhibit_n),
	.din0	(tcu_array_wr_inhibit_n),
	.din1	(cache_col_offset_c3[2])
	);

n2_l2d_ctrlio_cust_and_macro__width_1 and_slice_cache_col_offset_c3_00_1 
        (
        .dout   (cache_col_offset_c3_0_tcu_array_wr_inhibit_n),
        .din0   (tcu_array_wr_inhibit_n),
        .din1   (cache_col_offset_c3[0])
        );

n2_l2d_ctrlio_cust_and_macro__width_1 and_slice_cache_col_offset_c3_10_0 
        (
        .dout   (cache_col_offset_c3_3_tcu_array_wr_inhibit_n),
        .din0    (tcu_array_wr_inhibit_n),
        .din1   (cache_col_offset_c3[3])
        );

n2_l2d_ctrlio_cust_and_macro__width_1 and_slice_cache_col_offset_c3_10_1 
        (
        .dout   (cache_col_offset_c3_1_tcu_array_wr_inhibit_n),
        .din0    (tcu_array_wr_inhibit_n),
        .din1   (cache_col_offset_c3[1])
        );


n2_l2d_ctrlio_cust_or_macro__width_1 or_cache_col_offset_c3_00 
        (
        .dout   (cache_col_offset_c3_00),
        .din0   (cache_col_offset_c3_2_tcu_array_wr_inhibit_n),
        .din1   (cache_col_offset_c3_0_tcu_array_wr_inhibit_n)
        );
n2_l2d_ctrlio_cust_or_macro__width_1 or_cache_col_offset_c3_10 
        (
        .dout   (cache_col_offset_c3_10),
//        .din0   (~tcu_array_wr_inhibit & cache_col_offset_c3[3]),
//        .din1   (~tcu_array_wr_inhibit & cache_col_offset_c3[1])
	.din0	(cache_col_offset_c3_3_tcu_array_wr_inhibit_n),
	.din1	(cache_col_offset_c3_1_tcu_array_wr_inhibit_n)
        );

n2_l2d_ctrlio_cust_or_macro__width_1 or_cache_col_offset_c3_20 
        (
        .dout   (cache_col_offset_c3_20),
//        .din0   (~tcu_array_wr_inhibit & cache_col_offset_c3[2]),
//        .din1   (~tcu_array_wr_inhibit & cache_col_offset_c3[0])
	.din0	(cache_col_offset_c3_2_tcu_array_wr_inhibit_n),
	.din1	(cache_col_offset_c3_0_tcu_array_wr_inhibit_n)
        );

n2_l2d_ctrlio_cust_or_macro__width_1 or_cache_col_offset_c3_30 
        (
        .dout   (cache_col_offset_c3_30),
//        .din0   (~tcu_array_wr_inhibit & cache_col_offset_c3[3]),
//        .din1   (~tcu_array_wr_inhibit & cache_col_offset_c3[1])
	.din0	(cache_col_offset_c3_3_tcu_array_wr_inhibit_n),
        .din1   (cache_col_offset_c3_1_tcu_array_wr_inhibit_n)
        );

assign cache_col_offset_c3_01 = cache_col_offset_c3_00;
assign cache_col_offset_c3_11 = cache_col_offset_c3_10;
assign cache_col_offset_c3_21 = cache_col_offset_c3_20;
assign cache_col_offset_c3_31 = cache_col_offset_c3_30;

//inv_macro    inv_cache_col_offset_c3	(width=4)
//	(
//	.dout	(cache_col_offset_c3_1[3:0]),
//	.din	(cache_col_offset_c3[3:0])
//	);

//msff_ctl_macro   ff_cache_col_offset_c4   (fs=1,width=4)
//     (
//     .scan_in(ff_cache_col_offset_c4_scanin[3:0]),
//     .scan_out(ff_cache_col_offset_c4_scanout[3:0]),
//     .din  (cache_col_offset_c4_l[3:0] & (cache_col_offset_c3[3:0] & {4{~tcu_array_wr_inhibit}})),
//     .l1clk	       (l1clk_intnl),
//     .dout	     (cache_col_offset_c4[3:0]),
//     );
//
//assign    cache_col_offset_c4_l_00 = (&{cache_col_offset_c4_l[2],cache_col_offset_c4_l[0]});
//assign    cache_col_offset_c4_l_01 = (&{cache_col_offset_c4_l[2],cache_col_offset_c4_l[0]});
//assign    cache_col_offset_c4_l_10 = (&{cache_col_offset_c4_l[3],cache_col_offset_c4_l[1]});
//assign    cache_col_offset_c4_l_11 = (&{cache_col_offset_c4_l[3],cache_col_offset_c4_l[1]});
//assign    cache_col_offset_c4_l_20 = (&{cache_col_offset_c4_l[2],cache_col_offset_c4_l[0]});
//assign    cache_col_offset_c4_l_21 = (&{cache_col_offset_c4_l[2],cache_col_offset_c4_l[0]});
//assign    cache_col_offset_c4_l_30 = (&{cache_col_offset_c4_l[3],cache_col_offset_c4_l[1]});
//assign    cache_col_offset_c4_l_31 = (&{cache_col_offset_c4_l[3],cache_col_offset_c4_l[1]});


n2_l2d_ctrlio_cust_inv_macro__width_8 inv_cache_col_offset_c4_tog_all 
	(
	.dout	( { cache_col_offset_c4_tog_001_0_n, cache_col_offset_c4_tog_101_0_n,
                    cache_col_offset_c4_tog_001_1_n, cache_col_offset_c4_tog_101_1_n,
                    cache_col_offset_c4_tog_023_0_n, cache_col_offset_c4_tog_123_0_n,
                    cache_col_offset_c4_tog_023_1_n, cache_col_offset_c4_tog_123_1_n } ),
	.din	( { cache_col_offset_c4_tog_001[0],  cache_col_offset_c4_tog_101[0],
                    cache_col_offset_c4_tog_001[1],  cache_col_offset_c4_tog_101[1],
                    cache_col_offset_c4_tog_023[0],  cache_col_offset_c4_tog_123[0],
                    cache_col_offset_c4_tog_023[1],  cache_col_offset_c4_tog_123[1] })
	);

//assign    cache_col_offset_c4_l_00 =  ~cache_col_offset_c4_tog_001[0] |tcu_array_wr_inhibit;
//assign    cache_col_offset_c4_l_01 =  ~cache_col_offset_c4_tog_101[0] |tcu_array_wr_inhibit;
//assign    cache_col_offset_c4_l_10 =  ~cache_col_offset_c4_tog_001[1] |tcu_array_wr_inhibit;
//assign    cache_col_offset_c4_l_11 =  ~cache_col_offset_c4_tog_101[1] |tcu_array_wr_inhibit;
//assign    cache_col_offset_c4_l_20 =  ~cache_col_offset_c4_tog_023[0] |tcu_array_wr_inhibit;
//assign    cache_col_offset_c4_l_21 =  ~cache_col_offset_c4_tog_123[0] |tcu_array_wr_inhibit;
//assign    cache_col_offset_c4_l_30 =  ~cache_col_offset_c4_tog_023[1] |tcu_array_wr_inhibit;
//assign    cache_col_offset_c4_l_31 =  ~cache_col_offset_c4_tog_123[1] |tcu_array_wr_inhibit;


n2_l2d_ctrlio_cust_or_macro__width_8 slice_or_cache_col_offset_c4_l_00_to31 
	(
	.dout	( {
		  cache_col_offset_c4_l_00,
                  cache_col_offset_c4_l_01,
                  cache_col_offset_c4_l_10,
                  cache_col_offset_c4_l_11,
                  cache_col_offset_c4_l_20,
                  cache_col_offset_c4_l_21,
                  cache_col_offset_c4_l_30,
                  cache_col_offset_c4_l_31
		 } ),
	.din0	( {
		cache_col_offset_c4_tog_001_0_n,
                cache_col_offset_c4_tog_101_0_n,
                cache_col_offset_c4_tog_001_1_n,
                cache_col_offset_c4_tog_101_1_n,
                cache_col_offset_c4_tog_023_0_n,
                cache_col_offset_c4_tog_123_0_n,
                cache_col_offset_c4_tog_023_1_n,
                cache_col_offset_c4_tog_123_1_n
		}),
	.din1	({8{tcu_array_wr_inhibit}})
	);



n2_l2d_ctrlio_cust_inv_macro__width_4 inv_slice_cache_col_offset_c3_x 
	(
	.dout	(cache_col_offset_c3_n[3:0]),
	.din	(cache_col_offset_c3[3:0])
	);


n2_l2d_ctrlio_cust_or_macro__width_4 or_wr_inhibit_cache_col_offset_c3 
        (
        .dout   (wr_inhibit_cache_col_offset_c3_l[3:0]),
//        .din0   (~cache_col_offset_c3[3:0]),
        .din0   (cache_col_offset_c3_n[3:0]),
        .din1   ({4{tcu_array_wr_inhibit}})
        );


n2_l2d_ctrlio_cust_inv_macro__width_4    inv_wr_inhibit_cache_col_offset_c3    
	(
	.dout	(wr_inhibit_cache_col_offset_c3[3:0]),
	.din	(wr_inhibit_cache_col_offset_c3_l[3:0])
	);

n2_l2d_ctrlio_cust_inv_macro__width_2 inv_slice_cache_col_offset_c4_tog_001_x 
        (
        .dout   (cache_col_offset_c4_tog_001_n[1:0]),
        .din    (cache_col_offset_c4_tog_001[1:0])
        );

n2_l2d_ctrlio_cust_inv_macro__width_1 inv_wayerr_c3 
	(
	.dout	(wayerr_c3_n),
	.din	(wayerr_c3)
	);

n2_l2d_ctrlio_cust_and_macro__width_2 and_wayerr_col_offset_c4_l_001 
        (
        .dout   (wayerr_cache_col_offset_c4_l_tog_001[1:0]),
        .din0   (cache_col_offset_c4_tog_001_n[1:0]),
        .din1   ({2{wayerr_c3_n}})
        );

n2_l2d_ctrlio_cust_inv_macro__width_2 inv_slice_cache_col_offset_c4_tog_101_x 
        (
        .dout   (cache_col_offset_c4_tog_101_n[1:0]),
        .din    (cache_col_offset_c4_tog_101[1:0])
        );

n2_l2d_ctrlio_cust_and_macro__width_2 and_wayerr_col_offset_c4_l_101 
        (
        .dout   (wayerr_cache_col_offset_c4_l_tog_101[1:0]),
//        .din0   (~cache_col_offset_c4_tog_101[1:0]),
        .din0   (cache_col_offset_c4_tog_101_n[1:0]),
        .din1   ({2{wayerr_c3_n}})
        );

n2_l2d_ctrlio_cust_inv_macro__width_2 inv_slice_cache_col_offset_c4_tog_023_x 
        (
        .dout   (cache_col_offset_c4_tog_023_n[1:0]),
        .din    (cache_col_offset_c4_tog_023[1:0])
        );


n2_l2d_ctrlio_cust_and_macro__width_2 and_wayerr_col_offset_c4_l_023 
        (
        .dout   (wayerr_cache_col_offset_c4_l_tog_023[1:0]),
        .din0   (cache_col_offset_c4_tog_023_n[1:0]),
        .din1   ({2{wayerr_c3_n}})
        );

n2_l2d_ctrlio_cust_inv_macro__width_2 inv_slice_cache_col_offset_c4_tog_123_x 
        (
        .dout   (cache_col_offset_c4_tog_123_n[1:0]),
        .din    (cache_col_offset_c4_tog_123[1:0])
        );

n2_l2d_ctrlio_cust_and_macro__width_2 and_wayerr_col_offset_c4_l_123 
        (
        .dout   (wayerr_cache_col_offset_c4_l_tog_123[1:0]),
//        .din0   (~cache_col_offset_c4_tog_123[1:0]),
        .din0   (cache_col_offset_c4_tog_123_n[1:0]),
        .din1   ({2{wayerr_c3_n}})
        );

n2_l2d_ctrlio_cust_or_macro__width_1 or_col_offset_c3_top 
        (
        .dout   (cache_col_offset_c3_top),
        .din0   (wr_inhibit_cache_col_offset_c3[3]),
        .din1   (wr_inhibit_cache_col_offset_c3[1])
        );

n2_l2d_ctrlio_cust_or_macro__width_1 or_col_offset_c3_bot 
        (
        .dout   (cache_col_offset_c3_bot),
        .din0   (wr_inhibit_cache_col_offset_c3[2]),
        .din1   (wr_inhibit_cache_col_offset_c3[0])
        );

n2_l2d_ctrlio_cust_and_macro__width_2 and_cache_col_offset_c4_tog_in_001 
        (
        .dout   (cache_col_offset_c4_tog_in_001[1:0]),
        .din0   (wayerr_cache_col_offset_c4_l_tog_001[1:0]),
        .din1   ({cache_col_offset_c3_top,cache_col_offset_c3_bot})
        );

n2_l2d_ctrlio_cust_and_macro__width_2 slice_cache_col_offset_c4_tog_in_101 
        (
        .dout   (cache_col_offset_c4_tog_in_101[1:0]),
        .din0   (wayerr_cache_col_offset_c4_l_tog_101[1:0]),
        .din1   ({cache_col_offset_c3_top,cache_col_offset_c3_bot})
        );
n2_l2d_ctrlio_cust_and_macro__width_2 slice_cache_col_offset_c4_tog_in_023 
        (
        .dout   (cache_col_offset_c4_tog_in_023[1:0]),
        .din0   (wayerr_cache_col_offset_c4_l_tog_023[1:0]),
        .din1   ({cache_col_offset_c3_top,cache_col_offset_c3_bot})
        );
n2_l2d_ctrlio_cust_and_macro__width_2 slice_cache_col_offset_c4_tog_in_123 
        (
        .dout   (cache_col_offset_c4_tog_in_123[1:0]),
        .din0   (wayerr_cache_col_offset_c4_l_tog_123[1:0]),
        .din1   ({cache_col_offset_c3_top,cache_col_offset_c3_bot})
        );		
	
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_2   ff_cache_col_offset_c4_tog_001   
     (
     .scan_in(ff_cache_col_offset_c4_tog_001_scanin[1:0]),
     .scan_out(ff_cache_col_offset_c4_tog_001_scanout[1:0]),
     .din     (cache_col_offset_c4_tog_in_001[1:0]),
     .l1clk   (l1clk_intnl),
     .dout    (cache_col_offset_c4_tog_001[1:0]),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_2   ff_cache_col_offset_c4_tog_101   
     (
     .scan_in(ff_cache_col_offset_c4_tog_101_scanin[1:0]),
     .scan_out(ff_cache_col_offset_c4_tog_101_scanout[1:0]),
     .din     (cache_col_offset_c4_tog_in_101[1:0]),
     .l1clk   (l1clk_intnl),
     .dout    (cache_col_offset_c4_tog_101[1:0]),
  .siclk(siclk),
  .soclk(soclk)
     );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_2   ff_cache_col_offset_c4_tog_023   
     (
     .scan_in(ff_cache_col_offset_c4_tog_023_scanin[1:0]),
     .scan_out(ff_cache_col_offset_c4_tog_023_scanout[1:0]),
      .din     (cache_col_offset_c4_tog_in_023[1:0]),
      .l1clk   (l1clk_intnl),
      .dout    (cache_col_offset_c4_tog_023[1:0]),
  .siclk(siclk),
  .soclk(soclk)
      );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_2   ff_cache_col_offset_c4_tog_123   
     (
     .scan_in(ff_cache_col_offset_c4_tog_123_scanin[1:0]),
     .scan_out(ff_cache_col_offset_c4_tog_123_scanout[1:0]),
     .din     (cache_col_offset_c4_tog_in_123[1:0]),
     .l1clk   (l1clk_intnl),
     .dout    (cache_col_offset_c4_tog_123[1:0]),
  .siclk(siclk),
  .soclk(soclk)
     );


n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c4_001   
     (
     .scan_in(ff_cache_col_offset_c4_001_scanin[3:0]),
     .scan_out(ff_cache_col_offset_c4_001_scanout[3:0]),
     .din     (wr_inhibit_cache_col_offset_c3[3:0]),
     .l1clk   (l1clk_intnl),
     .dout    (cache_col_offset_c4_001[3:0]),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c4_101   
     (
     .scan_in(ff_cache_col_offset_c4_101_scanin[3:0]),
     .scan_out(ff_cache_col_offset_c4_101_scanout[3:0]),
     .din     (wr_inhibit_cache_col_offset_c3[3:0]),
     .l1clk   (l1clk_intnl),
     .dout    (cache_col_offset_c4_101[3:0]),
  .siclk(siclk),
  .soclk(soclk)
     );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c4_023   
     (
     .scan_in(ff_cache_col_offset_c4_023_scanin[3:0]),
     .scan_out(ff_cache_col_offset_c4_023_scanout[3:0]),
      .din     (wr_inhibit_cache_col_offset_c3[3:0]),
      .l1clk   (l1clk_intnl),
      .dout    (cache_col_offset_c4_023[3:0]),
  .siclk(siclk),
  .soclk(soclk)
      );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c4_123   
     (
     .scan_in(ff_cache_col_offset_c4_123_scanin[3:0]),
     .scan_out(ff_cache_col_offset_c4_123_scanout[3:0]),
     .din     (wr_inhibit_cache_col_offset_c3[3:0]),
     .l1clk   (l1clk_intnl),
     .dout    (cache_col_offset_c4_123[3:0]),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_ctrlio_cust_and_macro__width_4  and_cache_col_offset_c5_001_in 
        (
        .dout   (cache_col_offset_c5_001_in[3:0]),
        .din0   ({cache_col_offset_c4_tog_001[1:0],cache_col_offset_c4_tog_001[1:0]}),
        .din1   (cache_col_offset_c4_001[3:0])
        );
	
n2_l2d_ctrlio_cust_and_macro__width_4  and_cache_col_offset_c5_101_in 
        (
        .dout   (cache_col_offset_c5_101_in[3:0]),
        .din0   ({cache_col_offset_c4_tog_101[1:0],cache_col_offset_c4_tog_101[1:0]}),
        .din1   (cache_col_offset_c4_101[3:0])
        );

n2_l2d_ctrlio_cust_and_macro__width_4  and_cache_col_offset_c5_023_in 
        (
        .dout   (cache_col_offset_c5_023_in[3:0]),
        .din0   ({cache_col_offset_c4_tog_023[1:0],cache_col_offset_c4_tog_023[1:0]}),
        .din1   (cache_col_offset_c4_023[3:0])
        );
	
n2_l2d_ctrlio_cust_and_macro__width_4  and_cache_col_offset_c5_123_in 
        (
        .dout   (cache_col_offset_c5_123_in[3:0]),
        .din0   ({cache_col_offset_c4_tog_123[1:0],cache_col_offset_c4_tog_123[1:0]}),
        .din1   (cache_col_offset_c4_123[3:0])
        );		

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c5_001   
     (
     .scan_in(ff_cache_col_offset_c5_001_scanin[3:0]),
     .scan_out(ff_cache_col_offset_c5_001_scanout[3:0]),
     .din     (cache_col_offset_c5_001_in[3:0]),
     .l1clk   (l1clk_intnl),
     .dout    (cache_col_offset_c5_001[3:0]),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c5_101   
     (
     .scan_in(ff_cache_col_offset_c5_101_scanin[3:0]),
     .scan_out(ff_cache_col_offset_c5_101_scanout[3:0]),
     .din     (cache_col_offset_c5_101_in[3:0]),
     .l1clk   (l1clk_intnl),
     .dout    (cache_col_offset_c5_101[3:0]),
  .siclk(siclk),
  .soclk(soclk)
     );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c5_023   
     (
     .scan_in(ff_cache_col_offset_c5_023_scanin[3:0]),
     .scan_out(ff_cache_col_offset_c5_023_scanout[3:0]),
      .din     (cache_col_offset_c5_023_in[3:0]),
      .l1clk   (l1clk_intnl),
      .dout    (cache_col_offset_c5_023[3:0]),
  .siclk(siclk),
  .soclk(soclk)
      );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_4   ff_cache_col_offset_c5_123   
     (
     .scan_in(ff_cache_col_offset_c5_123_scanin[3:0]),
     .scan_out(ff_cache_col_offset_c5_123_scanout[3:0]),
     .din     (cache_col_offset_c5_123_in[3:0]),
     .l1clk   (l1clk_intnl),
     .dout    (cache_col_offset_c5_123[3:0]),
  .siclk(siclk),
  .soclk(soclk)
     );

//assign    cache_col_offset_c4_l_00 = ~(|{cache_col_offset_c4[2],cache_col_offset_c4[0]});
//assign    cache_col_offset_c4_l_01 = ~(|{cache_col_offset_c4[2],cache_col_offset_c4[0]});
//assign    cache_col_offset_c4_l_10 = ~(|{cache_col_offset_c4[3],cache_col_offset_c4[1]});
//assign    cache_col_offset_c4_l_11 = ~(|{cache_col_offset_c4[3],cache_col_offset_c4[1]});
//assign    cache_col_offset_c4_l_20 = ~(|{cache_col_offset_c4[2],cache_col_offset_c4[0]});
//assign    cache_col_offset_c4_l_21 = ~(|{cache_col_offset_c4[2],cache_col_offset_c4[0]});
//assign    cache_col_offset_c4_l_30 = ~(|{cache_col_offset_c4[3],cache_col_offset_c4[1]});
//assign    cache_col_offset_c4_l_31 = ~(|{cache_col_offset_c4[3],cache_col_offset_c4[1]});

assign    cache_col_offset_c5_00[1:0] 	= {cache_col_offset_c5_001[2],cache_col_offset_c5_001[0]};
assign    cache_col_offset_c5_01[1:0] 	= {cache_col_offset_c5_101[2],cache_col_offset_c5_101[0]};
assign    cache_col_offset_c5_10[1:0] 	= {cache_col_offset_c5_001[3],cache_col_offset_c5_001[1]};
assign    cache_col_offset_c5_11[1:0] 	= {cache_col_offset_c5_101[3],cache_col_offset_c5_101[1]};
assign    cache_col_offset_c5_20[1:0] 	= {cache_col_offset_c5_023[2],cache_col_offset_c5_023[0]};
assign    cache_col_offset_c5_21[1:0] 	= {cache_col_offset_c5_123[2],cache_col_offset_c5_123[0]};
assign    cache_col_offset_c5_30[1:0] 	= {cache_col_offset_c5_023[3],cache_col_offset_c5_023[1]};
assign    cache_col_offset_c5_31[1:0] 	= {cache_col_offset_c5_123[3],cache_col_offset_c5_123[1]};


// read writes signals




//assign  cache_rd_wr_c3_00 = cache_rd_wr_c3 | tcu_array_wr_inhibit;
//assign  cache_rd_wr_c3_01 = cache_rd_wr_c3 | tcu_array_wr_inhibit;
//assign  cache_rd_wr_c3_10 = cache_rd_wr_c3 | tcu_array_wr_inhibit;
//assign  cache_rd_wr_c3_11 = cache_rd_wr_c3 | tcu_array_wr_inhibit;
//assign  cache_rd_wr_c3_20 = cache_rd_wr_c3 | tcu_array_wr_inhibit;
//assign  cache_rd_wr_c3_21 = cache_rd_wr_c3 | tcu_array_wr_inhibit;
//assign  cache_rd_wr_c3_30 = cache_rd_wr_c3 | tcu_array_wr_inhibit;
//assign  cache_rd_wr_c3_31 = cache_rd_wr_c3 | tcu_array_wr_inhibit;
//assign  cache_rd_wr_c3_next_stage = cache_rd_wr_c3 | tcu_array_wr_inhibit;

n2_l2d_ctrlio_cust_or_macro__width_1 or_x111 
	(
	.dout	(cache_rd_wr_c3_generic),
	.din0	(l2t_l2d_rd_wr_c3),
	.din1	(1'b0)
	);

n2_l2d_ctrlio_cust_or_macro__width_1 or_x112 
        (
        .dout   (cache_rd_wr_c3_next_stage),
        .din0   (l2t_l2d_rd_wr_c3),
        .din1   (1'b0)
        );


assign cache_rd_wr_c3_00 = cache_rd_wr_c3_generic;
assign cache_rd_wr_c3_01 = cache_rd_wr_c3_generic;
assign cache_rd_wr_c3_10 = cache_rd_wr_c3_generic;
assign cache_rd_wr_c3_11 = cache_rd_wr_c3_generic;
assign cache_rd_wr_c3_20 = cache_rd_wr_c3_generic;
assign cache_rd_wr_c3_21 = cache_rd_wr_c3_generic;
assign cache_rd_wr_c3_30 = cache_rd_wr_c3_generic;
assign cache_rd_wr_c3_31 = cache_rd_wr_c3_generic;

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_1   ff_cache_cache_rd_wr_c4   
     (
     .scan_in(ff_cache_cache_rd_wr_c4_scanin[0:0]),
     .scan_out(ff_cache_cache_rd_wr_c4_scanout[0:0]),
     .din	     (cache_rd_wr_c3_next_stage),
     .l1clk	     (l1clk_intnl),
     .dout	     (cache_rd_wr_c4),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_1   ff_cache_cache_rd_wr_c5_00   
     (
     .scan_in(ff_cache_cache_rd_wr_c5_00_scanin[0:0]),
     .scan_out(ff_cache_cache_rd_wr_c5_00_scanout[0:0]),
     .din	     (cache_rd_wr_c4),
     .l1clk	     (l1clk_intnl),
     .dout	     (cache_rd_wr_c5_00),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_1   ff_cache_cache_rd_wr_c5_01   
     (
     .scan_in(ff_cache_cache_rd_wr_c5_01_scanin[0:0]),
     .scan_out(ff_cache_cache_rd_wr_c5_01_scanout[0:0]),
     .din	     (cache_rd_wr_c4),
     .l1clk	     (l1clk_intnl),
     .dout	     (cache_rd_wr_c5_01),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_1   ff_cache_cache_rd_wr_c5_20   
     (
     .scan_in(ff_cache_cache_rd_wr_c5_20_scanin[0:0]),
     .scan_out(ff_cache_cache_rd_wr_c5_20_scanout[0:0]),
     .din	     (cache_rd_wr_c4),
     .l1clk	     (l1clk_intnl),
     .dout	     (cache_rd_wr_c5_20),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_1   ff_cache_cache_rd_wr_c5_21   
     (
     .scan_in(ff_cache_cache_rd_wr_c5_21_scanin[0:0]),
     .scan_out(ff_cache_cache_rd_wr_c5_21_scanout[0:0]),
     .din	     (cache_rd_wr_c4),
     .l1clk	     (l1clk_intnl),
     .dout	     (cache_rd_wr_c5_21),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_ctrlio_cust_and_macro__width_8 and_slice_cache_rd_wr_c5_x 
	(
	.dout	({cache_readen_c5_00,
                  cache_readen_c5_01,
                  cache_readen_c5_10,
                  cache_readen_c5_11,
                  cache_readen_c5_20,
                  cache_readen_c5_21,
                  cache_readen_c5_30,
                  cache_readen_c5_31
		}),
	.din0	({cache_rd_wr_c5_00,
                  cache_rd_wr_c5_01,
                  cache_rd_wr_c5_00,
                  cache_rd_wr_c5_01,
                  cache_rd_wr_c5_20,
                  cache_rd_wr_c5_21,
                  cache_rd_wr_c5_20,
                  cache_rd_wr_c5_21
		}),
	.din1	({8{tcu_array_wr_inhibit_n}})
	);


//assign cache_readen_c5_00 = cache_rd_wr_c5_00 & ~tcu_array_wr_inhibit;
//assign cache_readen_c5_01 = cache_rd_wr_c5_01 & ~tcu_array_wr_inhibit;
//assign cache_readen_c5_10 = cache_rd_wr_c5_00 & ~tcu_array_wr_inhibit;
//assign cache_readen_c5_11 = cache_rd_wr_c5_01 & ~tcu_array_wr_inhibit;
//assign cache_readen_c5_20 = cache_rd_wr_c5_20 & ~tcu_array_wr_inhibit;
//assign cache_readen_c5_21 = cache_rd_wr_c5_21 & ~tcu_array_wr_inhibit;
//assign cache_readen_c5_30 = cache_rd_wr_c5_20 & ~tcu_array_wr_inhibit;
//assign cache_readen_c5_31 = cache_rd_wr_c5_21 & ~tcu_array_wr_inhibit;


// word enables for writes
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_16   ff_cache_word_en_c3   
     (
     .scan_in(ff_cache_word_en_c3_scanin[15:0]),
     .scan_out(ff_cache_word_en_c3_scanout[15:0]),
     .din	     (l2t_l2d_word_en_c2[15:0]),
     .l1clk	       (l1clk_in),
     .dout	     (cache_word_en_c3[15:0]),
  .siclk(siclk),
  .soclk(soclk)
     );



//assign cache_word_en_c3_11[3:0]   = {cache_word_en_c3[4],cache_word_en_c3[6], cache_word_en_c3[12],cache_word_en_c3[14]};
//assign cache_word_en_c3_10[3:0]   = {cache_word_en_c3[14],cache_word_en_c3[12], cache_word_en_c3[6],cache_word_en_c3[4]};
//assign cache_word_en_c3_01[3:0]   = {cache_word_en_c3[0],cache_word_en_c3[2], cache_word_en_c3[8],cache_word_en_c3[10]};
//assign cache_word_en_c3_00[3:0]   = {cache_word_en_c3[10],cache_word_en_c3[8], cache_word_en_c3[2],cache_word_en_c3[0]};
//assign cache_word_en_c3_21[3:0]   = {cache_word_en_c3[1],cache_word_en_c3[3], cache_word_en_c3[9],cache_word_en_c3[11]};
//assign cache_word_en_c3_20[3:0]   = {cache_word_en_c3[11],cache_word_en_c3[9], cache_word_en_c3[3],cache_word_en_c3[1]};
//assign cache_word_en_c3_31[3:0]   = {cache_word_en_c3[5],cache_word_en_c3[7], cache_word_en_c3[13],cache_word_en_c3[15]};
//assign cache_word_en_c3_30[3:0]   = {cache_word_en_c3[15],cache_word_en_c3[13], cache_word_en_c3[7],cache_word_en_c3[5]};


assign cache_word_en_c3_01[3:0]   = {cache_word_en_c3[2], cache_word_en_c3[0],cache_word_en_c3[10],cache_word_en_c3[8]};
assign cache_word_en_c3_11[3:0]   = {cache_word_en_c3[6], cache_word_en_c3[4],cache_word_en_c3[14],cache_word_en_c3[12]};
assign cache_word_en_c3_21[3:0]   = {cache_word_en_c3[3], cache_word_en_c3[1],cache_word_en_c3[11],cache_word_en_c3[9] };
assign cache_word_en_c3_31[3:0]   = {cache_word_en_c3[7], cache_word_en_c3[5],cache_word_en_c3[15],cache_word_en_c3[13]};

assign cache_word_en_c3_00[3:0]   = {cache_word_en_c3[10],cache_word_en_c3[8], cache_word_en_c3[2],cache_word_en_c3[0]};
assign cache_word_en_c3_10[3:0]   = {cache_word_en_c3[14],cache_word_en_c3[12], cache_word_en_c3[6],cache_word_en_c3[4]};
assign cache_word_en_c3_20[3:0]   = {cache_word_en_c3[11],cache_word_en_c3[9], cache_word_en_c3[3],cache_word_en_c3[1]};
assign cache_word_en_c3_30[3:0]   = {cache_word_en_c3[15],cache_word_en_c3[13], cache_word_en_c3[7],cache_word_en_c3[5]};










// data going out
// sel fill data instead of store data.

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_1   ff_cache_sel_fbdecc_c4   
     (
     .scan_in(ff_cache_sel_fbdecc_c4_scanin[0:0]),
     .scan_out(ff_cache_sel_fbdecc_c4_scanout[0:0]),
     .din	     (l2t_l2d_fbrd_c3),
     .l1clk	       (l1clk_in),
     .dout	     (cache_sel_fbdecc_c4),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_1   ff_cache_sel_fbdecc_c5   
     (
     .scan_in(ff_cache_sel_fbdecc_c5_scanin[0:0]),
     .scan_out(ff_cache_sel_fbdecc_c5_scanout[0:0]),
     .din	     (cache_sel_fbdecc_c4),
     .l1clk	       (l1clk_intnl),
     .dout	     (cache_sel_fbdecc_c5),
  .siclk(siclk),
  .soclk(soclk)
     );


///
//	This portion will concat and prepare store data 
//	it will then mux fill dat awith store data and drive it to memory
//


n2_l2d_ctrlio_cust_inv_macro__width_1 cache_sel_fbdecc_c5_inv_slice   (
        .dout   (cache_sel_fbdecc_c5_n),
        .din    (cache_sel_fbdecc_c5)
        );

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_78   ff_l2t_l2d_stdecc_c3   
     (
     .scan_in(ff_l2t_l2d_stdecc_c3_scanin[77:0]),
     .scan_out(ff_l2t_l2d_stdecc_c3_scanout[77:0]),
     .din	     (l2t_l2d_stdecc_c2[77:0]),
     .l1clk	       (l1clk_in),
     .dout	     (l2t_l2d_stdecc_c3[77:0]),
  .siclk(siclk),
  .soclk(soclk)
     );



assign concat_st_decc_out_c3[623:0] = {l2t_l2d_stdecc_c3[77:0], l2t_l2d_stdecc_c3[77:0], 
	l2t_l2d_stdecc_c3[77:0], l2t_l2d_stdecc_c3[77:0], l2t_l2d_stdecc_c3[77:0], 
	l2t_l2d_stdecc_c3[77:0], l2t_l2d_stdecc_c3[77:0], l2t_l2d_stdecc_c3[77:0]};

n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_1  
	(
	.dout	(cache_decc_in_c3[38:0]),
	.din0	(concat_st_decc_out_c3[38:0]),
	.din1	(l2b_l2d_fbdecc_c5[38:0]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_2  
	(
	.dout	(cache_decc_in_c3[77:39]),
	.din0	(concat_st_decc_out_c3[77:39]),
	.din1	(l2b_l2d_fbdecc_c5[77:39]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_3  
	(
	.dout	(cache_decc_in_c3[116:78]),
	.din0	(concat_st_decc_out_c3[116:78]),
	.din1	(l2b_l2d_fbdecc_c5[116:78]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_4  
	(
	.dout	(cache_decc_in_c3[155:117]),
	.din0	(concat_st_decc_out_c3[155:117]),
	.din1	(l2b_l2d_fbdecc_c5[155:117]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_5  
	(
	.dout	(cache_decc_in_c3[194:156]),
	.din0	(concat_st_decc_out_c3[194:156]),
	.din1	(l2b_l2d_fbdecc_c5[194:156]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_6  
	(
	.dout	(cache_decc_in_c3[233:195]),
	.din0	(concat_st_decc_out_c3[233:195]),
	.din1	(l2b_l2d_fbdecc_c5[233:195]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_7  
	(
	.dout	(cache_decc_in_c3[272:234]),
	.din0	(concat_st_decc_out_c3[272:234]),
	.din1	(l2b_l2d_fbdecc_c5[272:234]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_8  
	(
	.dout	(cache_decc_in_c3[311:273]),
	.din0	(concat_st_decc_out_c3[311:273]),
	.din1	(l2b_l2d_fbdecc_c5[311:273]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_9  
	(
	.dout	(cache_decc_in_c3[350:312]),
	.din0	(concat_st_decc_out_c3[350:312]),
	.din1	(l2b_l2d_fbdecc_c5[350:312]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_10  
	(
	.dout	(cache_decc_in_c3[389:351]),
	.din0	(concat_st_decc_out_c3[389:351]),
	.din1	(l2b_l2d_fbdecc_c5[389:351]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_11  
	(
	.dout	(cache_decc_in_c3[428:390]),
	.din0	(concat_st_decc_out_c3[428:390]),
	.din1	(l2b_l2d_fbdecc_c5[428:390]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_12  
	(
	.dout	(cache_decc_in_c3[467:429]),
	.din0	(concat_st_decc_out_c3[467:429]),
	.din1	(l2b_l2d_fbdecc_c5[467:429]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_13  
	(
	.dout	(cache_decc_in_c3[506:468]),
	.din0	(concat_st_decc_out_c3[506:468]),
	.din1	(l2b_l2d_fbdecc_c5[506:468]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_14  
	(
	.dout	(cache_decc_in_c3[545:507]),
	.din0	(concat_st_decc_out_c3[545:507]),
	.din1	(l2b_l2d_fbdecc_c5[545:507]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_15  
	(
	.dout	(cache_decc_in_c3[584:546]),
	.din0	(concat_st_decc_out_c3[584:546]),
	.din1	(l2b_l2d_fbdecc_c5[584:546]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);
n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_39	mux_cache_decc_in_c3_16  
	(
	.dout	(cache_decc_in_c3[623:585]),
	.din0	(concat_st_decc_out_c3[623:585]),
	.din1	(l2b_l2d_fbdecc_c5[623:585]),
	.sel0	(cache_sel_fbdecc_c5_n),
	.sel1	(cache_sel_fbdecc_c5)
	);


// CHANGE 1
//always@(negedge l1clk)
//begin
//	cache_decc_in_c3b_l[623:0] <= ~cache_decc_in_c3[623:0];
//end
//

n2_l2d_ctrlio_cust_tisram_blbi_macro__width_624	j3		 
  (
  .l1clk ( l1clk_intnl),
  .d_a   (cache_decc_in_c3[623:0]),
  .q_b_l (cache_decc_in_c3b_l[623:0])
  );


//assign cache_decc_in_c3b_l[623:0] = ~cache_decc_in_c3b[623:0];

//
// This portion will bypass filldata 
// and send out read data from meory or filldata

// sel fill buffer data over l2$ data.

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_1   ff_cache_fb_hit_c4   
     (
     .scan_in(ff_cache_fb_hit_c4_scanin[0:0]),
     .scan_out(ff_cache_fb_hit_c4_scanout[0:0]),
     .din	     (l2t_l2d_fb_hit_c3),
     .l1clk	       (l1clk_in),
     .dout	     (cache_fb_hit_c4),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_1   ff_cache_fb_hit_c5   
     (
     .scan_in(ff_cache_fb_hit_c5_scanin[0:0]),
     .scan_out(ff_cache_fb_hit_c5_scanout[0:0]),
     .din	     (cache_fb_hit_c4),
     .l1clk	       (l1clk_intnl),
     .dout	     (cache_fb_hit_c5),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_1   ff_cache_fb_hit_c52   
     (
     .scan_in(ff_cache_fb_hit_c52_scanin[0:0]),
     .scan_out(ff_cache_fb_hit_c52_scanout[0:0]),
     .din	     (cache_fb_hit_c5),
     .l1clk	       (l1clk_intnl),
     .dout	     (cache_fb_hit_c52),
  .siclk(siclk),
  .soclk(soclk)
     );

n2_l2d_ctrlio_cust_inv_macro__width_1 cache_fb_hit_c52_inv_slice   (
        .dout   (cache_fb_hit_c52_n),
        .din    (cache_fb_hit_c52)
        );

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_lo0_1 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[38:0]),
     .din            (l2b_l2d_fbdecc_c5[38:0]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_lo0_2 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[77:39]),
     .din            (l2b_l2d_fbdecc_c5[77:39]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_hi0_1 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[116:78]),
     .din            (l2b_l2d_fbdecc_c5[116:78]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_hi0_2 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[155:117]),
     .din            (l2b_l2d_fbdecc_c5[155:117]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_lo0_3 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[194:156]),
     .din            (l2b_l2d_fbdecc_c5[194:156]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_lo0_4 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[233:195]),
     .din            (l2b_l2d_fbdecc_c5[233:195]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_hi0_3 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[272:234]),
     .din            (l2b_l2d_fbdecc_c5[272:234]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_hi0_4 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[311:273]),
     .din            (l2b_l2d_fbdecc_c5[311:273]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
	
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_lo1_1 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[350:312]),
     .din            (l2b_l2d_fbdecc_c5[350:312]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_lo1_2 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[389:351]),
     .din            (l2b_l2d_fbdecc_c5[389:351]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_hi1_1 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[428:390]),
     .din            (l2b_l2d_fbdecc_c5[428:390]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_hi1_2 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[467:429]),
     .din            (l2b_l2d_fbdecc_c5[467:429]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_lo1_3 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[506:468]),
     .din            (l2b_l2d_fbdecc_c5[506:468]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_lo1_4 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[545:507]),
     .din            (l2b_l2d_fbdecc_c5[545:507]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_hi1_3 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[584:546]),
     .din            (l2b_l2d_fbdecc_c5[584:546]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2b_l2d_fbdecc_c52_hi1_4 
     (
     .scan_in(ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[38:0]),
     .scan_out(ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[38:0]),
     .dout           (l2b_l2d_fbdecc_c52[623:585]),
     .din            (l2b_l2d_fbdecc_c5[623:585]),
     .l1clk            (l1clk_intnl),
  .siclk(siclk),
  .soclk(soclk)
        );
		
	
// CHECK 

//assign cache_decc_out_c52= {cache_decc_out_3_c52[155:0], cache_decc_out_2_c52[155:0],
//			cache_decc_out_1_c52[155:0],cache_decc_out_0_c52[155:0]};

//mux_macro	mux_rd_decc_out_c52_1  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[38:0]),
//	.din0	(cache_decc_out_c52[38:0]),
//	.din1	(l2b_l2d_fbdecc_c52[38:0]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_2  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[77:39]),
//	.din0	(cache_decc_out_c52[77:39]),
//	.din1	(l2b_l2d_fbdecc_c52[77:39]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_3  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[116:78]),
//	.din0	(cache_decc_out_c52[116:78]),
//	.din1	(l2b_l2d_fbdecc_c52[116:78]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_4  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[155:117]),
//	.din0	(cache_decc_out_c52[155:117]),
//	.din1	(l2b_l2d_fbdecc_c52[155:117]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_5  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[194:156]),
//	.din0	(cache_decc_out_c52[194:156]),
//	.din1	(l2b_l2d_fbdecc_c52[194:156]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_6  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[233:195]),
//	.din0	(cache_decc_out_c52[233:195]),
//	.din1	(l2b_l2d_fbdecc_c52[233:195]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_7  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[272:234]),
//	.din0	(cache_decc_out_c52[272:234]),
//	.din1	(l2b_l2d_fbdecc_c52[272:234]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_8  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[311:273]),
//	.din0	(cache_decc_out_c52[311:273]),
//	.din1	(l2b_l2d_fbdecc_c52[311:273]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_9  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[350:312]),
//	.din0	(cache_decc_out_c52[350:312]),
//	.din1	(l2b_l2d_fbdecc_c52[350:312]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_10  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[389:351]),
//	.din0	(cache_decc_out_c52[389:351]),
//	.din1	(l2b_l2d_fbdecc_c52[389:351]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_11  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[428:390]),
//	.din0	(cache_decc_out_c52[428:390]),
//	.din1	(l2b_l2d_fbdecc_c52[428:390]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_12  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[467:429]),
//	.din0	(cache_decc_out_c52[467:429]),
//	.din1	(l2b_l2d_fbdecc_c52[467:429]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_13  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[506:468]),
//	.din0	(cache_decc_out_c52[506:468]),
//	.din1	(l2b_l2d_fbdecc_c52[506:468]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_14  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[545:507]),
//	.din0	(cache_decc_out_c52[545:507]),
//	.din1	(l2b_l2d_fbdecc_c52[545:507]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_15  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[584:546]),
//	.din0	(cache_decc_out_c52[584:546]),
//	.din1	(l2b_l2d_fbdecc_c52[584:546]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);
//mux_macro	mux_rd_decc_out_c52_16  (width=39,ports=2,mux=aonpe)
//	(
//	.dout	(rd_decc_out_c52[623:585]),
//	.din0	(cache_decc_out_c52[623:585]),
//	.din1	(l2b_l2d_fbdecc_c52[623:585]),
//	.sel0	(cache_fb_hit_c52_n),
//	.sel1	(cache_fb_hit_c52)
//	);

//assign 	   l2d_decc_out_c52[623:0] = rd_decc_out_c52[623:0];

//split following bus into 39 chunk because of the scan connection
//msff_ctl_macro      ff_l2d_decc_out_c6_0  (width=156)
//        (
//        .scan_in(ff_l2d_decc_out_c6_0_scanin),
//        .scan_out(ff_l2d_decc_out_c6_0_scanout),
//        .dout           (l2d_decc_out_c6[155:0]),
//        .din            (l2d_l2t_decc_c52_0[155:0]),
//        .l1clk            (l1clk_evict_c6),
//        );
//
//msff_ctl_macro      ff_l2d_decc_out_c6_1  (width=156)
//        (
//        .scan_in(ff_l2d_decc_out_c6_1_scanin),
//        .scan_out(ff_l2d_decc_out_c6_1_scanout),
//        .dout           (l2d_decc_out_c6[311:156]),
//        .din            (l2d_l2t_decc_c52_1[155:0]),
//        .l1clk            (l1clk_evict_c6),
//        );
//
//msff_ctl_macro      ff_l2d_decc_out_c6_2  (width=156)
//        (
//        .scan_in(ff_l2d_decc_out_c6_2_scanin),
//        .scan_out(ff_l2d_decc_out_c6_2_scanout),
//        .dout           (l2d_decc_out_c6[467:312]),
//        .din            (l2d_l2t_decc_c52_2[155:0]),
//        .l1clk            (l1clk_evict_c6),
//        );
//
//msff_ctl_macro      ff_l2d_decc_out_c6_3  (width=156)
//        (
//        .scan_in(ff_l2d_decc_out_c6_3_scanin),
//        .scan_out(ff_l2d_decc_out_c6_3_scanout),
//        .dout           (l2d_decc_out_c6[623:468]),
//        .din            (l2d_l2t_decc_c52_3[155:0]),
//        .l1clk            (l1clk_evict_c6),
//        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_lo0_1 
     (
     .scan_in(ff_l2d_decc_out_c6_lo0_1_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_lo0_1_scanout[38:0]),
     .dout           (l2d_decc_out_c6[38:0]),
     .din            (l2d_l2t_decc_c52_0[38:0]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_lo0_2 
     (
     .scan_in(ff_l2d_decc_out_c6_lo0_2_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_lo0_2_scanout[38:0]),
     .dout           (l2d_decc_out_c6[77:39]),
     .din            (l2d_l2t_decc_c52_0[77:39]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_hi0_1 
     (
     .scan_in(ff_l2d_decc_out_c6_hi0_1_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_hi0_1_scanout[38:0]),
     .dout           (l2d_decc_out_c6[116:78]),
     .din            (l2d_l2t_decc_c52_0[116:78]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_hi0_2 
     (
     .scan_in(ff_l2d_decc_out_c6_hi0_2_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_hi0_2_scanout[38:0]),
     .dout           (l2d_decc_out_c6[155:117]),
     .din            (l2d_l2t_decc_c52_0[155:117]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_lo0_3 
     (
     .scan_in(ff_l2d_decc_out_c6_lo0_3_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_lo0_3_scanout[38:0]),
     .dout           (l2d_decc_out_c6[194:156]),
     .din            (l2d_l2t_decc_c52_1[38:0]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_lo0_4 
     (
     .scan_in(ff_l2d_decc_out_c6_lo0_4_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_lo0_4_scanout[38:0]),
     .dout           (l2d_decc_out_c6[233:195]),
     .din            (l2d_l2t_decc_c52_1[77:39]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_hi0_3 
     (
     .scan_in(ff_l2d_decc_out_c6_hi0_3_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_hi0_3_scanout[38:0]),
     .dout           (l2d_decc_out_c6[272:234]),
     .din            (l2d_l2t_decc_c52_1[116:78]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_hi0_4 
     (
     .scan_in(ff_l2d_decc_out_c6_hi0_4_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_hi0_4_scanout[38:0]),
     .dout           (l2d_decc_out_c6[311:273]),
     .din            (l2d_l2t_decc_c52_1[155:117]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
	
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_lo1_1 
     (
     .scan_in(ff_l2d_decc_out_c6_lo1_1_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_lo1_1_scanout[38:0]),
     .dout           (l2d_decc_out_c6[350:312]),
     .din            (l2d_l2t_decc_c52_2[38:0]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_lo1_2 
     (
     .scan_in(ff_l2d_decc_out_c6_lo1_2_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_lo1_2_scanout[38:0]),
     .dout           (l2d_decc_out_c6[389:351]),
     .din            (l2d_l2t_decc_c52_2[77:39]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_hi1_1 
     (
     .scan_in(ff_l2d_decc_out_c6_hi1_1_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_hi1_1_scanout[38:0]),
     .dout           (l2d_decc_out_c6[428:390]),
     .din            (l2d_l2t_decc_c52_2[116:78]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_hi1_2 
     (
     .scan_in(ff_l2d_decc_out_c6_hi1_2_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_hi1_2_scanout[38:0]),
     .dout           (l2d_decc_out_c6[467:429]),
     .din            (l2d_l2t_decc_c52_2[155:117]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_lo1_3 
     (
     .scan_in(ff_l2d_decc_out_c6_lo1_3_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_lo1_3_scanout[38:0]),
     .dout           (l2d_decc_out_c6[506:468]),
     .din            (l2d_l2t_decc_c52_3[38:0]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_lo1_4 
     (
     .scan_in(ff_l2d_decc_out_c6_lo1_4_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_lo1_4_scanout[38:0]),
     .dout           (l2d_decc_out_c6[545:507]),
     .din            (l2d_l2t_decc_c52_3[77:39]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_hi1_3 
     (
     .scan_in(ff_l2d_decc_out_c6_hi1_3_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_hi1_3_scanout[38:0]),
     .dout           (l2d_decc_out_c6[584:546]),
     .din            (l2d_l2t_decc_c52_3[116:78]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39      ff_l2d_decc_out_c6_hi1_4 
     (
     .scan_in(ff_l2d_decc_out_c6_hi1_4_scanin[38:0]),
     .scan_out(ff_l2d_decc_out_c6_hi1_4_scanout[38:0]),
     .dout           (l2d_decc_out_c6[623:585]),
     .din            (l2d_l2t_decc_c52_3[155:117]),
     .l1clk            (l1clk_evict_c6),
  .siclk(siclk),
  .soclk(soclk)
        );
		

////////////////////////////////////////////////////////////////////////
// The 64B-16B mux will be performed in the full custom data array.
// if the col offsets are non one hot, l2t will cause the hold signal
// to be high causing the output mux to hold its old value.
////////////////////////////////////////////////////////////////////////
//assign sel_top = cache_col_offset_c52[0] | cache_col_offset_c52[2];
//assign sel_bot = cache_col_offset_c52[1] | cache_col_offset_c52[3];
//
//assign l2d_l2t_decc_c52[155:0] = sel_top ? cache_decc_out_top_c52b[155:0] : 
//				cache_decc_out_bot_c52b[155:0];

//reg	[155:0] cache_decc_out_0_c52;
//reg	[155:0] cache_decc_out_1_c52;
//reg	[155:0] cache_decc_out_2_c52;
//reg	[155:0] cache_decc_out_3_c52;

//CHANGE 2
//always@(posedge l1clk)
//begin
//
//	cache_decc_out_0_c52_d[155:0] <= cache_decc_out_c52b_l[155:0];
//	cache_decc_out_1_c52_d[155:0] <= cache_decc_out_c52b_l[311:156];
//	cache_decc_out_2_c52_d[155:0] <= cache_decc_out_c52b_l[467:312];
//	cache_decc_out_3_c52_d[155:0] <= cache_decc_out_c52b_l[623:468];
//end

n2_l2d_ctrlio_cust_tisram_bla_macro__width_156	ff_cache_decc_out_0_c52_d 
	(
	.q_a		(cache_decc_out_0_c52[155:0]),
	.d_b		(cache_decc_out_c5b[155:0]),
	.l1clk		(l1clk_intnl)
	);

n2_l2d_ctrlio_cust_tisram_bla_macro__width_156      ff_cache_decc_out_1_c52_d 
        (
        .q_a           (cache_decc_out_1_c52[155:0]),
        .d_b            (cache_decc_out_c5b[311:156]),
        .l1clk            (l1clk_intnl)
        );


n2_l2d_ctrlio_cust_tisram_bla_macro__width_156      ff_cache_decc_out_2_c52_d 
        (
        .q_a           (cache_decc_out_2_c52[155:0]),
        .d_b            (cache_decc_out_c5b[467:312]),
        .l1clk            (l1clk_intnl)
        );

n2_l2d_ctrlio_cust_tisram_bla_macro__width_156      ff_cache_decc_out_3_c52_d 
        (
        .q_a           (cache_decc_out_3_c52[155:0]),
        .d_b            (cache_decc_out_c5b[623:468]),
        .l1clk            (l1clk_intnl)
        );


// The following portion of the code is used for verification
// synopsys translate_off
assign cache_decc_out_c52[623:0] = {cache_decc_out_3_c52[155:0],cache_decc_out_2_c52[155:0],
				    cache_decc_out_1_c52[155:0],cache_decc_out_0_c52[155:0]};

assign cache_rd_wr_c3 = l2t_l2d_rd_wr_c3;
// synopsys translate_on


// CHANGE 10
//always@(negedge l1clk)
//begin
//        cache_decc_out_0_c52b[155:0] <= cache_decc_out_0_c52[155:0];
//        cache_decc_out_1_c52b[155:0] <= cache_decc_out_1_c52[155:0];
//        cache_decc_out_2_c52b[155:0] <= cache_decc_out_2_c52[155:0];
//        cache_decc_out_3_c52b[155:0] <= cache_decc_out_3_c52[155:0];
//end
//


//always@(negedge l1clk)
//begin
//	//l2b_l2d_fbdecc_c52b[623:0] 	<= l2b_l2d_fbdecc_c52[623:0];
//	//cache_fb_hit_c52b 		<= cache_fb_hit_c52;
//	//cache_col_offset_c52b[3:0]	<= cache_col_offset_c52[3:0];
//end

//mux_macro       mux_cache_data_out_c52  (width=156,ports=4,mux=aonpe,stack=156c)
//        (
//        .dout   (cache_data_out_c52[155:0]),
//        .din0   (cache_decc_out_0_c52[155:0]),
//        .din1   (cache_decc_out_1_c52[155:0]),
//        .din2   (cache_decc_out_2_c52[155:0]),
//        .din3   (cache_decc_out_3_c52[155:0]),
//        .sel0   (cache_col_offset_c52[0]),
//        .sel1   (cache_col_offset_c52[1]),
//        .sel2   (cache_col_offset_c52[2]),
//        .sel3   (cache_col_offset_c52[3])
//        );

//always@(cache_decc_out_0_c52 or cache_decc_out_1_c52 or cache_decc_out_2_c52
//	or cache_decc_out_3_c52 or cache_col_offset_c52 or l2b_l2d_fbdecc_c52 or cache_fb_hit_c52)
//begin
//case(cache_col_offset_c52)
//4'b0001	:	begin
//		fill_bypass_data_c52[155:0] = l2b_l2d_fbdecc_c52[155:0];
//		end
//4'b0010	:	begin
//		fill_bypass_data_c52[155:0] = l2b_l2d_fbdecc_c52[311:156];
//		end
//4'b0100	:	begin
//		fill_bypass_data_c52[155:0] = l2b_l2d_fbdecc_c52[467:312];
//		end
//4'b1000	:	begin
//		fill_bypass_data_c52[155:0] = l2b_l2d_fbdecc_c52[623:468];
//		end
//default	:	begin
//		fill_bypass_data_c52[155:0] = 156'b0;
//		end
//endcase
//end

//mux_macro       mux_fill_bypass_data_c52  (width=156,ports=4,mux=aonpe,stack=156c)
//        (
//        .dout   (fill_bypass_data_c52[155:0]),
//        .din0   (l2b_l2d_fbdecc_c52[155:0]),
//        .din1   (l2b_l2d_fbdecc_c52[311:156]),
//        .din2   (l2b_l2d_fbdecc_c52[467:312]),
//        .din3   (l2b_l2d_fbdecc_c52[623:468]),
//        .sel0   (cache_col_offset_c52[0]),
//        .sel1   (cache_col_offset_c52[1]),
//        .sel2   (cache_col_offset_c52[2]),
//        .sel3   (cache_col_offset_c52[3])
//        );

//assign l2d_l2t_decc_c52[155:0] = cache_fb_hit_c52 ? 
//		fill_bypass_data_c52[155:0] : cache_data_out_c52[155:0] ;

//inv_macro inv_cache_fb_hit_c52 (width=1)
//	(
//	.dout 	(cache_fb_hit_c52_n),
//	.din	(cache_fb_hit_c52)
//	);

n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_156       mux_l2d_l2t_decc_c52_0  
        (
        .dout   (l2d_l2t_decc_c52_0[155:0]),
        .din0   (l2b_l2d_fbdecc_c52[155:0]),
        .din1   (cache_decc_out_0_c52[155:0]),
        .sel0   (cache_fb_hit_c52),
        .sel1   (cache_fb_hit_c52_n)
        );

n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_156       mux_l2d_l2t_decc_c52_1  
        (
        .dout   (l2d_l2t_decc_c52_1[155:0]),
        .din0   (l2b_l2d_fbdecc_c52[311:156]),
        .din1   (cache_decc_out_1_c52[155:0]),
        .sel0   (cache_fb_hit_c52),
        .sel1   (cache_fb_hit_c52_n)
        );


n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_156       mux_l2d_l2t_decc_c52_2  
        (
        .dout   (l2d_l2t_decc_c52_2[155:0]),
        .din0   (l2b_l2d_fbdecc_c52[467:312]),
        .din1   (cache_decc_out_2_c52[155:0]),
        .sel0   (cache_fb_hit_c52),
        .sel1   (cache_fb_hit_c52_n)
        );

n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_156       mux_l2d_l2t_decc_c52_3  
        (
        .dout   (l2d_l2t_decc_c52_3[155:0]),
        .din0   (l2b_l2d_fbdecc_c52[623:468]),
        .din1   (cache_decc_out_3_c52[155:0]),
        .sel0   (cache_fb_hit_c52),
        .sel1   (cache_fb_hit_c52_n)
        );

n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_156       mux_l2d_l2t_decc_c52_20  
        (
        .dout   (l2d_l2t_decc_c52_20[155:0]),
        .din0   (l2d_l2t_decc_c52_2[155:0]),
        .din1   (l2d_l2t_decc_c52_0[155:0]),
        .sel0   (cache_col_offset_c52[2]),
        .sel1   (~cache_col_offset_c52[2])
        );

n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_156       mux_l2d_l2t_decc_c52_31  
        (
        .dout   (l2d_l2t_decc_c52_31[155:0]),
        .din0   (l2d_l2t_decc_c52_3[155:0]),
        .din1   (l2d_l2t_decc_c52_1[155:0]),
        .sel0   (cache_col_offset_c52[3]),
        .sel1   (~cache_col_offset_c52[3])
        );

n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_156       mux_l2d_l2t_decc_c52_topsel  
        (
        .dout   (l2d_l2t_decc_c52_mux[155:0]),
        .din0   (l2d_l2t_decc_c52_31[155:0]),
        .din1   (l2d_l2t_decc_c52_20[155:0]),
        .sel0   (cache_col_offset_c52_topsel),
        .sel1   (~cache_col_offset_c52_topsel)
        );

//msff_ctl_macro      ff_l2d_l2t_decc_c6  (width=156)
//        (
//        .scan_in(ff_l2d_l2t_decc_c6_scanin),
//        .scan_out(ff_l2d_l2t_decc_c6_scanout),
//        .dout           (l2d_l2t_decc_c6[155:0]),
//        .din            (l2d_l2t_decc_c52_topsel[155:0]),
//        .l1clk            (l1clk_intnl),
//        );





// tcu signals

assign          tcu_pce_ov_00 = tcu_pce_ov;
assign          tcu_pce_ov_01 = tcu_pce_ov;
assign          tcu_pce_ov_10 = tcu_pce_ov;
assign          tcu_pce_ov_11 = tcu_pce_ov;
assign          tcu_pce_ov_20 = tcu_pce_ov;
assign          tcu_pce_ov_21 = tcu_pce_ov;
assign          tcu_pce_ov_30 = tcu_pce_ov;
assign          tcu_pce_ov_31 = tcu_pce_ov;
assign          tcu_pce_00 = tcu_ce;
assign          tcu_pce_01 = tcu_ce;
assign          tcu_pce_10 = tcu_ce;
assign          tcu_pce_11 = tcu_ce;
assign          tcu_pce_20 = tcu_ce;
assign          tcu_pce_21 = tcu_ce;
assign          tcu_pce_30 = tcu_ce;
assign          tcu_pce_31 = tcu_ce;
assign          tcu_clk_stop_00 = tcu_clk_stop;
assign          tcu_clk_stop_01 = tcu_clk_stop;
assign          tcu_clk_stop_10 = tcu_clk_stop;
assign          tcu_clk_stop_11 = tcu_clk_stop;
assign          tcu_clk_stop_20 = tcu_clk_stop;
assign          tcu_clk_stop_21 = tcu_clk_stop;
assign          tcu_clk_stop_30 = tcu_clk_stop;
assign          tcu_clk_stop_31 = tcu_clk_stop;


assign		se_00 = tcu_scan_en;
assign		se_01 = tcu_scan_en;
assign		se_10 = tcu_scan_en;
assign		se_11 = tcu_scan_en;
assign		se_20 = tcu_scan_en;
assign		se_21 = tcu_scan_en;
assign		se_30 = tcu_scan_en;
assign		se_31 = tcu_scan_en;

// Redudancy

wire  [4:0]      fuse_l2d_rid_100;
wire  [4:0]      fuse_l2d_rid_110;
wire  [4:0]      fuse_l2d_rid_101;
wire  [4:0]      fuse_l2d_rid_111;
wire  [4:0]      fuse_l2d_rid_120;
wire  [4:0]      fuse_l2d_rid_121;
wire  [4:0]      fuse_l2d_rid_130;
wire  [4:0]      fuse_l2d_rid_131;
wire  [4:0]      fuse_l2d_rid_000;
wire  [4:0]      fuse_l2d_rid_001;
wire  [4:0]      fuse_l2d_rid_010;
wire  [4:0]      fuse_l2d_rid_011;
wire  [4:0]      fuse_l2d_rid_020;
wire  [4:0]      fuse_l2d_rid_021;
wire  [4:0]      fuse_l2d_rid_030;
wire  [4:0]      fuse_l2d_rid_031;

//assign fuse_l2d_rid_111[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b0000),(l2b_l2d_fuse_rid_d[6:3] == 4'b0001),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_011[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b0000),(l2b_l2d_fuse_rid_d[6:3] == 4'b0001),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_101[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b0010),(l2b_l2d_fuse_rid_d[6:3] == 4'b0011),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_001[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b0010),(l2b_l2d_fuse_rid_d[6:3] == 4'b0011),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_110[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b0100),(l2b_l2d_fuse_rid_d[6:3] == 4'b0101),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_010[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b0100),(l2b_l2d_fuse_rid_d[6:3] == 4'b0101),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_100[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b0110),(l2b_l2d_fuse_rid_d[6:3] == 4'b0111),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_000[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b0110),(l2b_l2d_fuse_rid_d[6:3] == 4'b0111),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_131[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b1000),(l2b_l2d_fuse_rid_d[6:3] == 4'b1001),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_031[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b1000),(l2b_l2d_fuse_rid_d[6:3] == 4'b1001),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_121[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b1010),(l2b_l2d_fuse_rid_d[6:3] == 4'b1011),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_021[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b1010),(l2b_l2d_fuse_rid_d[6:3] == 4'b1011),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_130[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b1100),(l2b_l2d_fuse_rid_d[6:3] == 4'b1101),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_030[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b1100),(l2b_l2d_fuse_rid_d[6:3] == 4'b1101),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_120[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b1110),(l2b_l2d_fuse_rid_d[6:3] == 4'b1111),l2b_l2d_fuse_rid_d[2:0]};
//assign fuse_l2d_rid_020[4:0] = {(l2b_l2d_fuse_rid_d[6:3] == 4'b1110),(l2b_l2d_fuse_rid_d[6:3] == 4'b1111),l2b_l2d_fuse_rid_d[2:0]};



n2_l2d_ctrlio_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_0 
	(
	.dout	(itis0000),
	.din0	(4'b0000),
	.din1	(l2b_l2d_fuse_rid_d[6:3])
	);

n2_l2d_ctrlio_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_1 
        (
        .dout   (itis0001),
        .din0   (4'b0001),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_ctrlio_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_2 
        (
        .dout   (itis0010),
        .din0   (4'b0010),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_ctrlio_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_3 
        (
        .dout   (itis0011),
        .din0   (4'b0011),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_ctrlio_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_4 
        (
        .dout   (itis0100),
        .din0   (4'b0100),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_ctrlio_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_5 
        (
        .dout   (itis0101),
        .din0   (4'b0101),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_ctrlio_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_6 
        (
        .dout   (itis0110),
        .din0   (4'b0110),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );
n2_l2d_ctrlio_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_7 
        (
        .dout   (itis0111),
        .din0   (4'b0111),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_ctrlio_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_8 
        (
        .dout   (itis1000),
        .din0   (4'b1000),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_ctrlio_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_9 
        (
        .dout   (itis1001),
        .din0   (4'b1001),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_ctrlio_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_02 
        (
        .dout   (itis1010),
        .din0   (4'b1010),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_ctrlio_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_03 
        (
        .dout   (itis1011),
        .din0   (4'b1011),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_ctrlio_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_04 
        (
        .dout   (itis1100),
        .din0   (4'b1100),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_ctrlio_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_05 
        (
        .dout   (itis1101),
        .din0   (4'b1101),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );

n2_l2d_ctrlio_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_06 
        (
        .dout   (itis1110),
        .din0   (4'b1110),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );
n2_l2d_ctrlio_cust_cmp_macro__width_4 cmp_l2b_l2d_fuse_rid_d_07 
        (
        .dout   (itis1111),
        .din0   (4'b1111),
        .din1   (l2b_l2d_fuse_rid_d[6:3])
        );


assign fuse_l2d_rid_111[4:0] = {itis0000,itis0001,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_011[4:0] = {itis0000,itis0001,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_101[4:0] = {itis0010,itis0011,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_001[4:0] = {itis0010,itis0011,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_110[4:0] = {itis0100,itis0101,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_010[4:0] = {itis0100,itis0101,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_100[4:0] = {itis0110,itis0111,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_000[4:0] = {itis0110,itis0111,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_131[4:0] = {itis1000,itis1001,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_031[4:0] = {itis1000,itis1001,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_121[4:0] = {itis1010,itis1011,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_021[4:0] = {itis1010,itis1011,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_130[4:0] = {itis1100,itis1101,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_030[4:0] = {itis1100,itis1101,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_120[4:0] = {itis1110,itis1111,l2b_l2d_fuse_rid_d[2:0]};
assign fuse_l2d_rid_020[4:0] = {itis1110,itis1111,l2b_l2d_fuse_rid_d[2:0]};


assign fuse_l2d_data_in_100[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_110[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_101[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_111[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_120[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_121[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_130[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_131[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_000[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_001[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_010[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_011[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_020[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_021[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_030[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];
assign fuse_l2d_data_in_031[9:0] = l2b_l2d_fuse_l2d_data_in_d[9:0];

assign fuse_l2d_wren_100 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_110 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_101 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_111 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_120 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_121 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_130 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_131 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_000 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_001 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_010 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_011 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_020 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_021 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_030 = l2b_l2d_fuse_l2d_wren_d;
assign fuse_l2d_wren_031 = l2b_l2d_fuse_l2d_wren_d;

assign fuse_l2d_reset_000_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_001_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_010_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_011_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_020_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_021_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_030_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_031_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_100_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_101_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_110_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_111_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_120_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_121_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_130_l = l2b_l2d_fuse_reset_l;
assign fuse_l2d_reset_131_l = l2b_l2d_fuse_reset_l;
       

//assign stage1_mux_sel0 = |(fuse_l2d_rid_131[4:3]); 
//assign stage1_mux_sel1 = |(fuse_l2d_rid_121[4:3]); 
//assign stage1_mux_sel2 = ~(stage1_mux_sel0 | stage1_mux_sel1);

n2_l2d_ctrlio_cust_inv_macro__width_1 inv_l2b_l2d_fuse_rid_d_0n 
	(
	.dout	(l2b_l2d_fuse_rid_d_0n),
	.din	(l2b_l2d_fuse_rid_d[0])
	);

n2_l2d_ctrlio_cust_or_macro__width_1 or_rid_131 
	(
	.dout	(or_fuse_l2d_rid_131),
	.din0	(fuse_l2d_rid_131[4]),
	.din1	(fuse_l2d_rid_131[3])
	);
	
n2_l2d_ctrlio_cust_and_macro__width_1 and_rid_131 
	(
	.dout	(stage1_mux_sel0),
	.din0	(or_fuse_l2d_rid_131),
	.din1	(l2b_l2d_fuse_rid_d[0])
	);	

n2_l2d_ctrlio_cust_or_macro__width_1 or_rid_121 
        (
        .dout   (or_fuse_l2d_rid_121),
        .din0   (fuse_l2d_rid_121[4]),
        .din1   (fuse_l2d_rid_121[3])
        );
	
n2_l2d_ctrlio_cust_and_macro__width_1 and_rid_121 
	(
	.dout	(stage1_mux_sel1),
	.din0	(or_fuse_l2d_rid_121),
	.din1	(l2b_l2d_fuse_rid_d[0])
	);
		
n2_l2d_ctrlio_cust_nor_macro__width_1 or_stage1_mux_sel2 
        (
        .dout   (stage1_mux_sel2),
        .din0   (stage1_mux_sel0),
        .din1   (stage1_mux_sel1)
        );



n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_3__width_10       mux_fdout_stage1  
        (
        .dout   (fdout_stage1[9:0]),
        .din0   (fdout_131[9:0]),
        .din1   (fdout_121[9:0]),
        .din2   (10'b0),
        .sel0   (stage1_mux_sel0),
        .sel1   (stage1_mux_sel1),
        .sel2   (stage1_mux_sel2)
        );

//assign stage2_mux_sel0 = |(fuse_l2d_rid_031[4:3]);
//assign stage2_mux_sel1 = |(fuse_l2d_rid_021[4:3]);
//assign stage2_mux_sel2 = ~(stage2_mux_sel0 | stage2_mux_sel1);


n2_l2d_ctrlio_cust_or_macro__width_1 or_rid_031 
	(
	.dout	(or_fuse_l2d_rid_031),
	.din0	(fuse_l2d_rid_031[4]),
	.din1	(fuse_l2d_rid_031[3])
	);
	
n2_l2d_ctrlio_cust_and_macro__width_1 and_rid_031 
	(
	.dout	(stage2_mux_sel0),
	.din0	(or_fuse_l2d_rid_031),
	.din1	(l2b_l2d_fuse_rid_d_0n)
	);	

n2_l2d_ctrlio_cust_or_macro__width_1 or_rid_021 
        (
        .dout   (or_fuse_l2d_rid_021),
        .din0   (fuse_l2d_rid_021[4]),
        .din1   (fuse_l2d_rid_021[3])
        );
	
n2_l2d_ctrlio_cust_and_macro__width_1 and_rid_021 
	(
	.dout	(stage2_mux_sel1),
	.din0	(or_fuse_l2d_rid_021),
	.din1	(l2b_l2d_fuse_rid_d_0n)
	);	
	

n2_l2d_ctrlio_cust_nor_macro__width_1 or_stage2_mux_sel2 
        (
        .dout   (stage2_mux_sel2),
        .din0   (stage2_mux_sel0),
        .din1   (stage2_mux_sel1)
        );


n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_3__width_10       mux_fdout_stage2  
        (
        .dout   (fdout_stage2[9:0]),
        .din0   (fdout_031[9:0]),
        .din1   (fdout_021[9:0]),
        .din2   (fdout_stage1[9:0]),
        .sel0   (stage2_mux_sel0),
        .sel1   (stage2_mux_sel1),
        .sel2   (stage2_mux_sel2)
        );

//assign stage3_mux_sel0 = |(fuse_l2d_rid_130[4:3]);
//assign stage3_mux_sel1 = |(fuse_l2d_rid_120[4:3]);
//assign stage3_mux_sel2 = ~(stage3_mux_sel0 | stage3_mux_sel1);

n2_l2d_ctrlio_cust_or_macro__width_1 or_rid_130 
	(
	.dout	(or_fuse_l2d_rid_130),
	.din0	(fuse_l2d_rid_130[4]),
	.din1	(fuse_l2d_rid_130[3])
	);
	
n2_l2d_ctrlio_cust_and_macro__width_1 and_rid_130 
	(
	.dout	(stage3_mux_sel0),
	.din0	(or_fuse_l2d_rid_130),
	.din1	(l2b_l2d_fuse_rid_d[0])
	);	

n2_l2d_ctrlio_cust_or_macro__width_1 or_rid_120 
        (
        .dout   (or_fuse_l2d_rid_120),
        .din0   (fuse_l2d_rid_120[4]),
        .din1   (fuse_l2d_rid_120[3])
        );
	
n2_l2d_ctrlio_cust_and_macro__width_1 and_rid_120 
	(
	.dout	(stage3_mux_sel1),
	.din0	(or_fuse_l2d_rid_120),
	.din1	(l2b_l2d_fuse_rid_d[0])
	);
	
n2_l2d_ctrlio_cust_nor_macro__width_1 or_stage3_mux_sel2 
        (
        .dout   (stage3_mux_sel2),
        .din0   (stage3_mux_sel0),
        .din1   (stage3_mux_sel1)
        );


n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_3__width_10       mux_fdout_stage3  
        (
        .dout   (fdout_stage3[9:0]),
        .din0   (fdout_130[9:0]),
        .din1   (fdout_120[9:0]),
        .din2   (fdout_stage2[9:0]),
        .sel0   (stage3_mux_sel0),
        .sel1   (stage3_mux_sel1),
        .sel2   (stage3_mux_sel2)
        );

//assign stage4_mux_sel0 = |(fuse_l2d_rid_030[4:3]);
//assign stage4_mux_sel1 = |(fuse_l2d_rid_020[4:3]);
//assign stage4_mux_sel2 = ~(stage4_mux_sel0 | stage4_mux_sel1);

n2_l2d_ctrlio_cust_or_macro__width_1 or_rid_030 
	(
	.dout	(or_fuse_l2d_rid_030),
	.din0	(fuse_l2d_rid_030[4]),
	.din1	(fuse_l2d_rid_030[3])
	);
	
n2_l2d_ctrlio_cust_and_macro__width_1 and_rid_030 
	(
	.dout	(stage4_mux_sel0),
	.din0	(or_fuse_l2d_rid_030),
	.din1	(l2b_l2d_fuse_rid_d_0n)
	);	

n2_l2d_ctrlio_cust_or_macro__width_1 or_rid_020 
        (
        .dout   (or_fuse_l2d_rid_020),
        .din0   (fuse_l2d_rid_020[4]),
        .din1   (fuse_l2d_rid_020[3])
        );
	
n2_l2d_ctrlio_cust_and_macro__width_1 and_rid_020 
	(
	.dout	(stage4_mux_sel1),
	.din0	(or_fuse_l2d_rid_020),
	.din1	(l2b_l2d_fuse_rid_d_0n)
	);
	
n2_l2d_ctrlio_cust_nor_macro__width_1 or_stage4_mux_sel2 
        (
        .dout   (stage4_mux_sel2),
        .din0   (stage4_mux_sel0),
        .din1   (stage4_mux_sel1)
        );


n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_3__width_10       mux_fdout_stage4  
        (
        .dout   (fdout_stage4[9:0]),
        .din0   (fdout_030[9:0]),
        .din1   (fdout_020[9:0]),
        .din2   (fdout_stage3[9:0]),
        .sel0   (stage4_mux_sel0),
        .sel1   (stage4_mux_sel1),
        .sel2   (stage4_mux_sel2)
        );

// Right to left

//assign stage10_mux_sel0 = |(fuse_l2d_rid_010[4:3]);
//assign stage10_mux_sel1 = |(fuse_l2d_rid_000[4:3]);
//assign stage10_mux_sel2 = ~(stage10_mux_sel0 | stage10_mux_sel1);

n2_l2d_ctrlio_cust_or_macro__width_1 or_rid_010 
	(
	.dout	(or_fuse_l2d_rid_010),
	.din0	(fuse_l2d_rid_010[4]),
	.din1	(fuse_l2d_rid_010[3])
	);
	
n2_l2d_ctrlio_cust_and_macro__width_1 and_rid_010 
	(
	.dout	(stage10_mux_sel0),
	.din0	(or_fuse_l2d_rid_010),
	.din1	(l2b_l2d_fuse_rid_d_0n)
	);	

n2_l2d_ctrlio_cust_or_macro__width_1 or_rid_000 
        (
        .dout   (or_fuse_l2d_rid_000),
        .din0   (fuse_l2d_rid_000[4]),
        .din1   (fuse_l2d_rid_000[3])
        );
	
n2_l2d_ctrlio_cust_and_macro__width_1 and_rid_000 
	(
	.dout	(stage10_mux_sel1),
	.din0	(or_fuse_l2d_rid_000),
	.din1	(l2b_l2d_fuse_rid_d_0n)
	);
	
n2_l2d_ctrlio_cust_nor_macro__width_1 or_stage10_mux_sel2 
        (
        .dout   (stage10_mux_sel2),
        .din0   (stage10_mux_sel0),
        .din1   (stage10_mux_sel1)
        );




n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_3__width_10       mux_fdout_stage10  
        (
        .dout   (fdout_stage10[9:0]),
        .din0   (fdout_010[9:0]),
        .din1   (fdout_000[9:0]),
        .din2   (10'b0),
        .sel0   (stage10_mux_sel0),
        .sel1   (stage10_mux_sel1),
        .sel2   (stage10_mux_sel2)
        );

//assign stage20_mux_sel0 = |(fuse_l2d_rid_110[4:3]);
//assign stage20_mux_sel1 = |(fuse_l2d_rid_100[4:3]);
//assign stage20_mux_sel2 = ~(stage20_mux_sel0 | stage20_mux_sel1);

n2_l2d_ctrlio_cust_or_macro__width_1 or_rid_110 
	(
	.dout	(or_fuse_l2d_rid_110),
	.din0	(fuse_l2d_rid_110[4]),
	.din1	(fuse_l2d_rid_110[3])
	);
	
n2_l2d_ctrlio_cust_and_macro__width_1 and_rid_110 
	(
	.dout	(stage20_mux_sel0),
	.din0	(or_fuse_l2d_rid_110),
	.din1	(l2b_l2d_fuse_rid_d[0])
	);	

n2_l2d_ctrlio_cust_or_macro__width_1 or_rid_100 
        (
        .dout   (or_fuse_l2d_rid_100),
        .din0   (fuse_l2d_rid_100[4]),
        .din1   (fuse_l2d_rid_100[3])
        );
	
n2_l2d_ctrlio_cust_and_macro__width_1 and_rid_100 
	(
	.dout	(stage20_mux_sel1),
	.din0	(or_fuse_l2d_rid_100),
	.din1	(l2b_l2d_fuse_rid_d[0])
	);
	
n2_l2d_ctrlio_cust_nor_macro__width_1 or_stage20_mux_sel2 
        (
        .dout   (stage20_mux_sel2),
        .din0   (stage20_mux_sel0),
        .din1   (stage20_mux_sel1)
        );



n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_3__width_10       mux_fdout_stage20  
        (
        .dout   (fdout_stage20[9:0]),
        .din0   (fdout_110[9:0]),
        .din1   (fdout_100[9:0]),
        .din2   (fdout_stage10[9:0]),
        .sel0   (stage20_mux_sel0),
        .sel1   (stage20_mux_sel1),
        .sel2   (stage20_mux_sel2)
        );

//assign stage30_mux_sel0 = |(fuse_l2d_rid_011[4:3]);
//assign stage30_mux_sel1 = |(fuse_l2d_rid_001[4:3]);
//assign stage30_mux_sel2 = ~(stage30_mux_sel0 | stage30_mux_sel1);

n2_l2d_ctrlio_cust_or_macro__width_1 or_rid_011 
	(
	.dout	(or_fuse_l2d_rid_011),
	.din0	(fuse_l2d_rid_011[4]),
	.din1	(fuse_l2d_rid_011[3])
	);
	
n2_l2d_ctrlio_cust_and_macro__width_1 and_rid_011 
	(
	.dout	(stage30_mux_sel0),
	.din0	(or_fuse_l2d_rid_011),
	.din1	(l2b_l2d_fuse_rid_d_0n)
	);	

n2_l2d_ctrlio_cust_or_macro__width_1 or_rid_001 
        (
        .dout   (or_fuse_l2d_rid_001),
        .din0   (fuse_l2d_rid_001[4]),
        .din1   (fuse_l2d_rid_001[3])
        );
	
n2_l2d_ctrlio_cust_and_macro__width_1 and_rid_001 
	(
	.dout	(stage30_mux_sel1),
	.din0	(or_fuse_l2d_rid_001),
	.din1	(l2b_l2d_fuse_rid_d_0n)
	);
	
n2_l2d_ctrlio_cust_nor_macro__width_1 or_1stage20_mux_sel2 
        (
        .dout   (stage30_mux_sel2),
        .din0   (stage30_mux_sel0),
        .din1   (stage30_mux_sel1)
        );


n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_3__width_10       mux_fdout_stage30  
        (
        .dout   (fdout_stage30[9:0]),
        .din0   (fdout_011[9:0]),
        .din1   (fdout_001[9:0]),
        .din2   (fdout_stage20[9:0]),
        .sel0   (stage30_mux_sel0),
        .sel1   (stage30_mux_sel1),
        .sel2   (stage30_mux_sel2)
        );

//assign stage40_mux_sel0 = |(fuse_l2d_rid_111[4:3]);
//assign stage40_mux_sel1 = |(fuse_l2d_rid_101[4:3]);
//assign stage40_mux_sel2 = ~(stage40_mux_sel0 | stage40_mux_sel1);

n2_l2d_ctrlio_cust_or_macro__width_1 or_rid_111 
	(
	.dout	(or_fuse_l2d_rid_111),
	.din0	(fuse_l2d_rid_111[4]),
	.din1	(fuse_l2d_rid_111[3])
	);
	
n2_l2d_ctrlio_cust_and_macro__width_1 and_rid_111 
	(
	.dout	(stage40_mux_sel0),
	.din0	(or_fuse_l2d_rid_111),
	.din1	(l2b_l2d_fuse_rid_d[0])
	);	

n2_l2d_ctrlio_cust_or_macro__width_1 or_rid_101 
        (
        .dout   (or_fuse_l2d_rid_101),
        .din0   (fuse_l2d_rid_101[4]),
        .din1   (fuse_l2d_rid_101[3])
        );
	
n2_l2d_ctrlio_cust_and_macro__width_1 and_rid_101 
	(
	.dout	(stage40_mux_sel1),
	.din0	(or_fuse_l2d_rid_101),
	.din1	(l2b_l2d_fuse_rid_d[0])
	);
	
n2_l2d_ctrlio_cust_nor_macro__width_1 or_1stage40_mux_sel2 
        (
        .dout   (stage40_mux_sel2),
        .din0   (stage40_mux_sel0),
        .din1   (stage40_mux_sel1)
        );



n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_3__width_10       mux_fdout_stage40  
        (
        .dout   (fdout_stage40[9:0]),
        .din0   (fdout_111[9:0]),
        .din1   (fdout_101[9:0]),
        .din2   (fdout_stage30[9:0]),
        .sel0   (stage40_mux_sel0),
        .sel1   (stage40_mux_sel1),
        .sel2   (stage40_mux_sel2)
        );

n2_l2d_ctrlio_cust_inv_macro__width_1 inv_l2b_l2d_fuse_rid_d_6n 
	(
	.dout	(l2b_l2d_fuse_rid_d_6n),
	.din	(l2b_l2d_fuse_rid_d[6])
	);

n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_10       mux_fdout_fnl  
        (
        .dout   (efc_fuse_data[9:0]),
        .din0   (fdout_stage40[9:0]),
        .din1   (fdout_stage4[9:0]),
        .sel0   (l2b_l2d_fuse_rid_d_6n),
        .sel1   (l2b_l2d_fuse_rid_d[6])
        );

 
assign 		delout00 = delout20_rgt;
assign 		delout01 = delout20_rgt;
assign 		delout10 = delout31_rgt;
assign 		delout11 = delout31_rgt;
assign 		delout20 = delout20_lft;
assign 		delout21 = delout20_lft;
assign 		delout30 = delout31_lft;
assign 		delout31 = delout31_lft;

n2_l2d_tstmod_cust tstmod
      (
      .rd_wr_c3 	(l2t_l2d_rd_wr_c3),
      .wayerr_c3 	(wayerr_c3 ),
      .wr_inhibit 	(tcu_array_wr_inhibit ),
      .coloff_c3 	(cache_col_offset_c3[3:0]),
      .l2clk 		(l2clk),
      .scanen 		(tcu_scan_en),
      .si 		(so_q23 ),
      .siclk 		(tcu_aclk),
      .soclk 		(tcu_bclk),
      .so 		(so_tstmod ),
      .delout20_rgt 	(delout20_rgt ),
      .delout31_lft 	(delout31_lft ),
      .delout31_rgt 	(delout31_rgt ),
      .delout20_lft	(delout20_lft)
      ) ;

// scanorder start
//  ff_cache_cache_rd_wr_c4_scanin
//  ff_cache_set_c3_scanin[8]
//  ff_cache_set_c3_scanin[7]
//  ff_cache_set_c3_scanin[6]
//  ff_cache_set_c3_scanin[5]
//  ff_cache_set_c3_scanin[4]
//  ff_cache_set_c3_scanin[3]
//  ff_cache_set_c3_scanin[2]
//  ff_cache_set_c3_scanin[1]
//  ff_cache_set_c3_scanin[0]
//  ff_cache_word_en_c3_scanin[1]
//  ff_cache_word_en_c3_scanin[3]
//  ff_cache_word_en_c3_scanin[5]
//  ff_cache_word_en_c3_scanin[7]
//  ff_cache_word_en_c3_scanin[9]
//  ff_cache_word_en_c3_scanin[11]
//  ff_cache_word_en_c3_scanin[13]
//  ff_cache_word_en_c3_scanin[15]
//  ff_cache_col_offset_c3_scanin[0]
//  ff_cache_col_offset_c4_scanin[0]
//  ff_cache_col_offset_c5_muxsel_scanin[0]
//  ff_cache_col_offset_c5_muxsel_scanin[1]
//  ff_cache_col_offset_c4_scanin[1]
//  ff_cache_col_offset_c3_scanin[1]
//  ff_cache_col_offset_c3_scanin[2]
//  ff_cache_col_offset_c4_scanin[2]
//  ff_cache_col_offset_c5_muxsel_scanin[2]
//  ff_cache_col_offset_c5_muxsel_scanin[3]
//  ff_cache_col_offset_c4_scanin[3]
//  ff_cache_col_offset_c3_scanin[3]
//  ff_cache_col_offset_all_c4_scanin
//  ff_cache_col_offset_all_c5_scanin
//  ff_cache_col_offset_all_c6_scanin
//  ff_cache_col_offset_all_c7_scanin
//  ff_cache_word_en_c3_scanin[0]
//  ff_cache_word_en_c3_scanin[2]
//  ff_cache_word_en_c3_scanin[4]
//  ff_cache_word_en_c3_scanin[6]
//  ff_cache_word_en_c3_scanin[8]
//  ff_cache_word_en_c3_scanin[10]
//  ff_cache_word_en_c3_scanin[12]
//  ff_cache_word_en_c3_scanin[14]
//  ff_cache_col_offset_c52_scanin[1]	
//  ff_cache_col_offset_c52_scanin[0]	

//  ff_cache_col_offset_c52_topsel_scanin
//  ff_cache_fb_hit_c4_scanin
//  ff_cache_fb_hit_c5_scanin
//  ff_cache_fb_hit_c52_scanin
//  ff_cache_sel_fbdecc_c4_scanin
//  ff_cache_sel_fbdecc_c5_scanin

//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[4]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[4]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[4]

//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[4]

//  ff_l2t_l2d_stdecc_c3_scanin[77:39] 	
//  ff_cache_col_offset_c5_023_scanin[0]
//  ff_cache_col_offset_c5_023_scanin[2]
//  ff_cache_col_offset_c4_023_scanin[0]
//  ff_cache_col_offset_c4_023_scanin[2]
//  ff_cache_col_offset_c4_tog_023_scanin[0]
//  ff_cache_cache_rd_wr_c5_20_scanin
//  ff_cache_col_offset_c5_023_scanin[1]
//  ff_cache_col_offset_c5_023_scanin[3]
//  ff_cache_col_offset_c4_023_scanin[1]
//  ff_cache_col_offset_c4_023_scanin[3]
//  ff_cache_col_offset_c4_tog_023_scanin[1]

//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[14]

//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[14]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[14]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[14]

//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[14]

//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[14]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[14]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[14]


//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[4]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[4]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[4]


//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[4]


//  ff_l2d_decc_out_c6_lo0_2_scanin[0]
//  ff_l2d_decc_out_c6_lo0_4_scanin[0]
//  ff_l2d_decc_out_c6_hi0_2_scanin[0]
//  ff_l2d_decc_out_c6_hi0_4_scanin[0]
//  ff_l2d_decc_out_c6_lo1_2_scanin[0]
//  ff_l2d_decc_out_c6_lo1_4_scanin[0]
//  ff_l2d_decc_out_c6_hi1_2_scanin[0]
//  ff_l2d_decc_out_c6_hi1_4_scanin[0]
//  ff_l2d_decc_out_c6_lo0_2_scanin[1]
//  ff_l2d_decc_out_c6_lo0_4_scanin[1]
//  ff_l2d_decc_out_c6_hi0_2_scanin[1]
//  ff_l2d_decc_out_c6_hi0_4_scanin[1]
//  ff_l2d_decc_out_c6_lo1_2_scanin[1]
//  ff_l2d_decc_out_c6_lo1_4_scanin[1]
//  ff_l2d_decc_out_c6_hi1_2_scanin[1]
//  ff_l2d_decc_out_c6_hi1_4_scanin[1]
//  ff_l2d_decc_out_c6_lo0_2_scanin[2]
//  ff_l2d_decc_out_c6_lo0_4_scanin[2]
//  ff_l2d_decc_out_c6_hi0_2_scanin[2]
//  ff_l2d_decc_out_c6_hi0_4_scanin[2]
//  ff_l2d_decc_out_c6_lo1_2_scanin[2]
//  ff_l2d_decc_out_c6_lo1_4_scanin[2]
//  ff_l2d_decc_out_c6_hi1_2_scanin[2]
//  ff_l2d_decc_out_c6_hi1_4_scanin[2]
//  ff_l2d_decc_out_c6_lo0_2_scanin[3]
//  ff_l2d_decc_out_c6_lo0_4_scanin[3]
//  ff_l2d_decc_out_c6_hi0_2_scanin[3]
//  ff_l2d_decc_out_c6_hi0_4_scanin[3]
//  ff_l2d_decc_out_c6_lo1_2_scanin[3]
//  ff_l2d_decc_out_c6_lo1_4_scanin[3]
//  ff_l2d_decc_out_c6_hi1_2_scanin[3]
//  ff_l2d_decc_out_c6_hi1_4_scanin[3]
//  ff_l2d_decc_out_c6_lo0_2_scanin[4]
//  ff_l2d_decc_out_c6_lo0_4_scanin[4]
//  ff_l2d_decc_out_c6_hi0_2_scanin[4]
//  ff_l2d_decc_out_c6_hi0_4_scanin[4]
//  ff_l2d_decc_out_c6_lo1_2_scanin[4]
//  ff_l2d_decc_out_c6_lo1_4_scanin[4]
//  ff_l2d_decc_out_c6_hi1_2_scanin[4]
//  ff_l2d_decc_out_c6_hi1_4_scanin[4]
//  ff_l2d_decc_out_c6_lo0_2_scanin[5]
//  ff_l2d_decc_out_c6_lo0_4_scanin[5]
//  ff_l2d_decc_out_c6_hi0_2_scanin[5]
//  ff_l2d_decc_out_c6_hi0_4_scanin[5]
//  ff_l2d_decc_out_c6_lo1_2_scanin[5]
//  ff_l2d_decc_out_c6_lo1_4_scanin[5]
//  ff_l2d_decc_out_c6_hi1_2_scanin[5]
//  ff_l2d_decc_out_c6_hi1_4_scanin[5]
//  ff_l2d_decc_out_c6_lo0_2_scanin[6]
//  ff_l2d_decc_out_c6_lo0_4_scanin[6]
//  ff_l2d_decc_out_c6_hi0_2_scanin[6]
//  ff_l2d_decc_out_c6_hi0_4_scanin[6]
//  ff_l2d_decc_out_c6_lo1_2_scanin[6]
//  ff_l2d_decc_out_c6_lo1_4_scanin[6]
//  ff_l2d_decc_out_c6_hi1_2_scanin[6]
//  ff_l2d_decc_out_c6_hi1_4_scanin[6]
//  ff_l2d_decc_out_c6_lo0_2_scanin[7]
//  ff_l2d_decc_out_c6_lo0_4_scanin[7]
//  ff_l2d_decc_out_c6_hi0_2_scanin[7]
//  ff_l2d_decc_out_c6_hi0_4_scanin[7]
//  ff_l2d_decc_out_c6_lo1_2_scanin[7]
//  ff_l2d_decc_out_c6_lo1_4_scanin[7]
//  ff_l2d_decc_out_c6_hi1_2_scanin[7]
//  ff_l2d_decc_out_c6_hi1_4_scanin[7]
//  ff_l2d_decc_out_c6_lo0_2_scanin[8]
//  ff_l2d_decc_out_c6_lo0_4_scanin[8]
//  ff_l2d_decc_out_c6_hi0_2_scanin[8]
//  ff_l2d_decc_out_c6_hi0_4_scanin[8]
//  ff_l2d_decc_out_c6_lo1_2_scanin[8]
//  ff_l2d_decc_out_c6_lo1_4_scanin[8]
//  ff_l2d_decc_out_c6_hi1_2_scanin[8]
//  ff_l2d_decc_out_c6_hi1_4_scanin[8]
//  ff_l2d_decc_out_c6_lo0_2_scanin[9]
//  ff_l2d_decc_out_c6_lo0_4_scanin[9]
//  ff_l2d_decc_out_c6_hi0_2_scanin[9]
//  ff_l2d_decc_out_c6_hi0_4_scanin[9]
//  ff_l2d_decc_out_c6_lo1_2_scanin[9]
//  ff_l2d_decc_out_c6_lo1_4_scanin[9]
//  ff_l2d_decc_out_c6_hi1_2_scanin[9]
//  ff_l2d_decc_out_c6_hi1_4_scanin[9]

//  ff_l2d_decc_out_c6_lo0_2_scanin[10]
//  ff_l2d_decc_out_c6_lo0_4_scanin[10]
//  ff_l2d_decc_out_c6_hi0_2_scanin[10]
//  ff_l2d_decc_out_c6_hi0_4_scanin[10]
//  ff_l2d_decc_out_c6_lo1_2_scanin[10]
//  ff_l2d_decc_out_c6_lo1_4_scanin[10]
//  ff_l2d_decc_out_c6_hi1_2_scanin[10]
//  ff_l2d_decc_out_c6_hi1_4_scanin[10]
//  ff_l2d_decc_out_c6_lo0_2_scanin[11]
//  ff_l2d_decc_out_c6_lo0_4_scanin[11]
//  ff_l2d_decc_out_c6_hi0_2_scanin[11]
//  ff_l2d_decc_out_c6_hi0_4_scanin[11]
//  ff_l2d_decc_out_c6_lo1_2_scanin[11]
//  ff_l2d_decc_out_c6_lo1_4_scanin[11]
//  ff_l2d_decc_out_c6_hi1_2_scanin[11]
//  ff_l2d_decc_out_c6_hi1_4_scanin[11]
//  ff_l2d_decc_out_c6_lo0_2_scanin[12]
//  ff_l2d_decc_out_c6_lo0_4_scanin[12]
//  ff_l2d_decc_out_c6_hi0_2_scanin[12]
//  ff_l2d_decc_out_c6_hi0_4_scanin[12]
//  ff_l2d_decc_out_c6_lo1_2_scanin[12]
//  ff_l2d_decc_out_c6_lo1_4_scanin[12]
//  ff_l2d_decc_out_c6_hi1_2_scanin[12]
//  ff_l2d_decc_out_c6_hi1_4_scanin[12]
//  ff_l2d_decc_out_c6_lo0_2_scanin[13]
//  ff_l2d_decc_out_c6_lo0_4_scanin[13]
//  ff_l2d_decc_out_c6_hi0_2_scanin[13]
//  ff_l2d_decc_out_c6_hi0_4_scanin[13]
//  ff_l2d_decc_out_c6_lo1_2_scanin[13]
//  ff_l2d_decc_out_c6_lo1_4_scanin[13]
//  ff_l2d_decc_out_c6_hi1_2_scanin[13]
//  ff_l2d_decc_out_c6_hi1_4_scanin[13]
//  ff_l2d_decc_out_c6_lo0_2_scanin[14]
//  ff_l2d_decc_out_c6_lo0_4_scanin[14]
//  ff_l2d_decc_out_c6_hi0_2_scanin[14]
//  ff_l2d_decc_out_c6_hi0_4_scanin[14]
//  ff_l2d_decc_out_c6_lo1_2_scanin[14]
//  ff_l2d_decc_out_c6_lo1_4_scanin[14]
//  ff_l2d_decc_out_c6_hi1_2_scanin[14]
//  ff_l2d_decc_out_c6_hi1_4_scanin[14]
//  ff_l2d_decc_out_c6_lo0_2_scanin[15]
//  ff_l2d_decc_out_c6_lo0_4_scanin[15]
//  ff_l2d_decc_out_c6_hi0_2_scanin[15]
//  ff_l2d_decc_out_c6_hi0_4_scanin[15]
//  ff_l2d_decc_out_c6_lo1_2_scanin[15]
//  ff_l2d_decc_out_c6_lo1_4_scanin[15]
//  ff_l2d_decc_out_c6_hi1_2_scanin[15]
//  ff_l2d_decc_out_c6_hi1_4_scanin[15]
//  ff_l2d_decc_out_c6_lo0_2_scanin[16]
//  ff_l2d_decc_out_c6_lo0_4_scanin[16]
//  ff_l2d_decc_out_c6_hi0_2_scanin[16]
//  ff_l2d_decc_out_c6_hi0_4_scanin[16]
//  ff_l2d_decc_out_c6_lo1_2_scanin[16]
//  ff_l2d_decc_out_c6_lo1_4_scanin[16]
//  ff_l2d_decc_out_c6_hi1_2_scanin[16]
//  ff_l2d_decc_out_c6_hi1_4_scanin[16]
//  ff_l2d_decc_out_c6_lo0_2_scanin[17]
//  ff_l2d_decc_out_c6_lo0_4_scanin[17]
//  ff_l2d_decc_out_c6_hi0_2_scanin[17]
//  ff_l2d_decc_out_c6_hi0_4_scanin[17]
//  ff_l2d_decc_out_c6_lo1_2_scanin[17]
//  ff_l2d_decc_out_c6_lo1_4_scanin[17]
//  ff_l2d_decc_out_c6_hi1_2_scanin[17]
//  ff_l2d_decc_out_c6_hi1_4_scanin[17]
//  ff_l2d_decc_out_c6_lo0_2_scanin[18]
//  ff_l2d_decc_out_c6_lo0_4_scanin[18]
//  ff_l2d_decc_out_c6_hi0_2_scanin[18]
//  ff_l2d_decc_out_c6_hi0_4_scanin[18]
//  ff_l2d_decc_out_c6_lo1_2_scanin[18]
//  ff_l2d_decc_out_c6_lo1_4_scanin[18]
//  ff_l2d_decc_out_c6_hi1_2_scanin[18]
//  ff_l2d_decc_out_c6_hi1_4_scanin[18]
//  ff_l2d_decc_out_c6_lo0_2_scanin[19]
//  ff_l2d_decc_out_c6_lo0_4_scanin[19]
//  ff_l2d_decc_out_c6_hi0_2_scanin[19]
//  ff_l2d_decc_out_c6_hi0_4_scanin[19]

//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[24]


//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[24]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[24]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[24]

//  ff_cache_col_offset_c5_123_scanin[0]
//  ff_cache_col_offset_c5_123_scanin[2]
//  ff_cache_col_offset_c4_123_scanin[0]
//  ff_cache_col_offset_c4_123_scanin[2]
//  ff_cache_col_offset_c4_tog_123_scanin[0]
//  ff_cache_cache_rd_wr_c5_21_scanin
//  ff_cache_col_offset_c5_123_scanin[1]
//  ff_cache_col_offset_c5_123_scanin[3]
//  ff_cache_col_offset_c4_123_scanin[1]
//  ff_cache_col_offset_c4_123_scanin[3]
//  ff_cache_col_offset_c4_tog_123_scanin[1]

//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[34]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[34]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[34]

//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[34]

//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[34]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[34]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[34]

//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[34]

//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[24]


//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[24]
//  ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[24]
//  ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[24]

//  ff_l2d_decc_out_c6_lo1_2_scanin[19]
//  ff_l2d_decc_out_c6_lo1_4_scanin[19]
//  ff_l2d_decc_out_c6_hi1_2_scanin[19]
//  ff_l2d_decc_out_c6_hi1_4_scanin[19]
//  ff_l2d_decc_out_c6_lo0_2_scanin[20]
//  ff_l2d_decc_out_c6_lo0_4_scanin[20]
//  ff_l2d_decc_out_c6_hi0_2_scanin[20]
//  ff_l2d_decc_out_c6_hi0_4_scanin[20]
//  ff_l2d_decc_out_c6_lo1_2_scanin[20]
//  ff_l2d_decc_out_c6_lo1_4_scanin[20]
//  ff_l2d_decc_out_c6_hi1_2_scanin[20]
//  ff_l2d_decc_out_c6_hi1_4_scanin[20]
//  ff_l2d_decc_out_c6_lo0_2_scanin[21]
//  ff_l2d_decc_out_c6_lo0_4_scanin[21]
//  ff_l2d_decc_out_c6_hi0_2_scanin[21]
//  ff_l2d_decc_out_c6_hi0_4_scanin[21]
//  ff_l2d_decc_out_c6_lo1_2_scanin[21]
//  ff_l2d_decc_out_c6_lo1_4_scanin[21]
//  ff_l2d_decc_out_c6_hi1_2_scanin[21]
//  ff_l2d_decc_out_c6_hi1_4_scanin[21]
//  ff_l2d_decc_out_c6_lo0_2_scanin[22]
//  ff_l2d_decc_out_c6_lo0_4_scanin[22]
//  ff_l2d_decc_out_c6_hi0_2_scanin[22]
//  ff_l2d_decc_out_c6_hi0_4_scanin[22]
//  ff_l2d_decc_out_c6_lo1_2_scanin[22]
//  ff_l2d_decc_out_c6_lo1_4_scanin[22]
//  ff_l2d_decc_out_c6_hi1_2_scanin[22]
//  ff_l2d_decc_out_c6_hi1_4_scanin[22]
//  ff_l2d_decc_out_c6_lo0_2_scanin[23]
//  ff_l2d_decc_out_c6_lo0_4_scanin[23]
//  ff_l2d_decc_out_c6_hi0_2_scanin[23]
//  ff_l2d_decc_out_c6_hi0_4_scanin[23]
//  ff_l2d_decc_out_c6_lo1_2_scanin[23]
//  ff_l2d_decc_out_c6_lo1_4_scanin[23]
//  ff_l2d_decc_out_c6_hi1_2_scanin[23]
//  ff_l2d_decc_out_c6_hi1_4_scanin[23]
//  ff_l2d_decc_out_c6_lo0_2_scanin[24]
//  ff_l2d_decc_out_c6_lo0_4_scanin[24]
//  ff_l2d_decc_out_c6_hi0_2_scanin[24]
//  ff_l2d_decc_out_c6_hi0_4_scanin[24]
//  ff_l2d_decc_out_c6_lo1_2_scanin[24]
//  ff_l2d_decc_out_c6_lo1_4_scanin[24]
//  ff_l2d_decc_out_c6_hi1_2_scanin[24]
//  ff_l2d_decc_out_c6_hi1_4_scanin[24]
//  ff_l2d_decc_out_c6_lo0_2_scanin[25]
//  ff_l2d_decc_out_c6_lo0_4_scanin[25]
//  ff_l2d_decc_out_c6_hi0_2_scanin[25]
//  ff_l2d_decc_out_c6_hi0_4_scanin[25]
//  ff_l2d_decc_out_c6_lo1_2_scanin[25]
//  ff_l2d_decc_out_c6_lo1_4_scanin[25]
//  ff_l2d_decc_out_c6_hi1_2_scanin[25]
//  ff_l2d_decc_out_c6_hi1_4_scanin[25]
//  ff_l2d_decc_out_c6_lo0_2_scanin[26]
//  ff_l2d_decc_out_c6_lo0_4_scanin[26]
//  ff_l2d_decc_out_c6_hi0_2_scanin[26]
//  ff_l2d_decc_out_c6_hi0_4_scanin[26]
//  ff_l2d_decc_out_c6_lo1_2_scanin[26]
//  ff_l2d_decc_out_c6_lo1_4_scanin[26]
//  ff_l2d_decc_out_c6_hi1_2_scanin[26]
//  ff_l2d_decc_out_c6_hi1_4_scanin[26]
//  ff_l2d_decc_out_c6_lo0_2_scanin[27]
//  ff_l2d_decc_out_c6_lo0_4_scanin[27]
//  ff_l2d_decc_out_c6_hi0_2_scanin[27]
//  ff_l2d_decc_out_c6_hi0_4_scanin[27]
//  ff_l2d_decc_out_c6_lo1_2_scanin[27]
//  ff_l2d_decc_out_c6_lo1_4_scanin[27]
//  ff_l2d_decc_out_c6_hi1_2_scanin[27]
//  ff_l2d_decc_out_c6_hi1_4_scanin[27]
//  ff_l2d_decc_out_c6_lo0_2_scanin[28]
//  ff_l2d_decc_out_c6_lo0_4_scanin[28]
//  ff_l2d_decc_out_c6_hi0_2_scanin[28]
//  ff_l2d_decc_out_c6_hi0_4_scanin[28]
//  ff_l2d_decc_out_c6_lo1_2_scanin[28]
//  ff_l2d_decc_out_c6_lo1_4_scanin[28]
//  ff_l2d_decc_out_c6_hi1_2_scanin[28]
//  ff_l2d_decc_out_c6_hi1_4_scanin[28]
//  ff_l2d_decc_out_c6_lo0_2_scanin[29]
//  ff_l2d_decc_out_c6_lo0_4_scanin[29]

//  ff_l2d_decc_out_c6_hi0_2_scanin[29]
//  ff_l2d_decc_out_c6_hi0_4_scanin[29]
//  ff_l2d_decc_out_c6_lo1_2_scanin[29]
//  ff_l2d_decc_out_c6_lo1_4_scanin[29]
//  ff_l2d_decc_out_c6_hi1_2_scanin[29]
//  ff_l2d_decc_out_c6_hi1_4_scanin[29]
//  ff_l2d_decc_out_c6_lo0_2_scanin[30]
//  ff_l2d_decc_out_c6_lo0_4_scanin[30]
//  ff_l2d_decc_out_c6_hi0_2_scanin[30]
//  ff_l2d_decc_out_c6_hi0_4_scanin[30]
//  ff_l2d_decc_out_c6_lo1_2_scanin[30]
//  ff_l2d_decc_out_c6_lo1_4_scanin[30]
//  ff_l2d_decc_out_c6_hi1_2_scanin[30]
//  ff_l2d_decc_out_c6_hi1_4_scanin[30]
//  ff_l2d_decc_out_c6_lo0_2_scanin[31]
//  ff_l2d_decc_out_c6_lo0_4_scanin[31]
//  ff_l2d_decc_out_c6_hi0_2_scanin[31]
//  ff_l2d_decc_out_c6_hi0_4_scanin[31]
//  ff_l2d_decc_out_c6_lo1_2_scanin[31]
//  ff_l2d_decc_out_c6_lo1_4_scanin[31]
//  ff_l2d_decc_out_c6_hi1_2_scanin[31]
//  ff_l2d_decc_out_c6_hi1_4_scanin[31]
//  ff_l2d_decc_out_c6_lo0_2_scanin[32]
//  ff_l2d_decc_out_c6_lo0_4_scanin[32]
//  ff_l2d_decc_out_c6_hi0_2_scanin[32]
//  ff_l2d_decc_out_c6_hi0_4_scanin[32]
//  ff_l2d_decc_out_c6_lo1_2_scanin[32]
//  ff_l2d_decc_out_c6_lo1_4_scanin[32]
//  ff_l2d_decc_out_c6_hi1_2_scanin[32]
//  ff_l2d_decc_out_c6_hi1_4_scanin[32]
//  ff_l2d_decc_out_c6_lo0_2_scanin[33]
//  ff_l2d_decc_out_c6_lo0_4_scanin[33]
//  ff_l2d_decc_out_c6_hi0_2_scanin[33]
//  ff_l2d_decc_out_c6_hi0_4_scanin[33]
//  ff_l2d_decc_out_c6_lo1_2_scanin[33]
//  ff_l2d_decc_out_c6_lo1_4_scanin[33]
//  ff_l2d_decc_out_c6_hi1_2_scanin[33]
//  ff_l2d_decc_out_c6_hi1_4_scanin[33]
//  ff_l2d_decc_out_c6_lo0_2_scanin[34]
//  ff_l2d_decc_out_c6_lo0_4_scanin[34]
//  ff_l2d_decc_out_c6_hi0_2_scanin[34]
//  ff_l2d_decc_out_c6_hi0_4_scanin[34]
//  ff_l2d_decc_out_c6_lo1_2_scanin[34]
//  ff_l2d_decc_out_c6_lo1_4_scanin[34]
//  ff_l2d_decc_out_c6_hi1_2_scanin[34]
//  ff_l2d_decc_out_c6_hi1_4_scanin[34]
//  ff_l2d_decc_out_c6_lo0_2_scanin[35]
//  ff_l2d_decc_out_c6_lo0_4_scanin[35]
//  ff_l2d_decc_out_c6_hi0_2_scanin[35]
//  ff_l2d_decc_out_c6_hi0_4_scanin[35]
//  ff_l2d_decc_out_c6_lo1_2_scanin[35]
//  ff_l2d_decc_out_c6_lo1_4_scanin[35]
//  ff_l2d_decc_out_c6_hi1_2_scanin[35]
//  ff_l2d_decc_out_c6_hi1_4_scanin[35]
//  ff_l2d_decc_out_c6_lo0_2_scanin[36]
//  ff_l2d_decc_out_c6_lo0_4_scanin[36]
//  ff_l2d_decc_out_c6_hi0_2_scanin[36]
//  ff_l2d_decc_out_c6_hi0_4_scanin[36]
//  ff_l2d_decc_out_c6_lo1_2_scanin[36]
//  ff_l2d_decc_out_c6_lo1_4_scanin[36]
//  ff_l2d_decc_out_c6_hi1_2_scanin[36]
//  ff_l2d_decc_out_c6_hi1_4_scanin[36]
//  ff_l2d_decc_out_c6_lo0_2_scanin[37]
//  ff_l2d_decc_out_c6_lo0_4_scanin[37]
//  ff_l2d_decc_out_c6_hi0_2_scanin[37]
//  ff_l2d_decc_out_c6_hi0_4_scanin[37]
//  ff_l2d_decc_out_c6_lo1_2_scanin[37]
//  ff_l2d_decc_out_c6_lo1_4_scanin[37]
//  ff_l2d_decc_out_c6_hi1_2_scanin[37]
//  ff_l2d_decc_out_c6_hi1_4_scanin[37]
//  ff_l2d_decc_out_c6_lo0_2_scanin[38]
//  ff_l2d_decc_out_c6_lo0_4_scanin[38]
//  ff_l2d_decc_out_c6_hi0_2_scanin[38]
//  ff_l2d_decc_out_c6_hi0_4_scanin[38]
//  ff_l2d_decc_out_c6_lo1_2_scanin[38]
//  ff_l2d_decc_out_c6_lo1_4_scanin[38]
//  ff_l2d_decc_out_c6_hi1_2_scanin[38]
//  ff_l2d_decc_out_c6_hi1_4_scanin[38]
//  so_tstmod
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[24]


//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[24]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[24]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[24]

//  ff_cache_col_offset_c5_101_scanin[0]
//  ff_cache_col_offset_c5_101_scanin[2]
//  ff_cache_col_offset_c4_101_scanin[0]
//  ff_cache_col_offset_c4_101_scanin[2]
//  ff_cache_col_offset_c4_tog_101_scanin[0]
//  ff_cache_cache_rd_wr_c5_01_scanin
//  ff_cache_col_offset_c5_101_scanin[1]
//  ff_cache_col_offset_c5_101_scanin[3]
//  ff_cache_col_offset_c4_101_scanin[1]
//  ff_cache_col_offset_c4_101_scanin[3]
//  ff_cache_col_offset_c4_tog_101_scanin[1]

//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[34]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[34]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[34]

//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[34]

//  ff_l2t_l2d_stdecc_c3_scanin[0:38]

//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[38]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[37]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[36]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[35]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[34]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[34]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[34]

//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[30]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[31]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[32]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[33]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[34]

//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[20]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[21]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[22]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[23]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[24]


//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[29]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[28]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[27]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[26]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[25]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[24]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[24]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[24]

//  ff_l2d_decc_out_c6_lo1_1_scanin[19]
//  ff_l2d_decc_out_c6_lo1_3_scanin[19]
//  ff_l2d_decc_out_c6_hi1_1_scanin[19]
//  ff_l2d_decc_out_c6_hi1_3_scanin[19]
//  ff_l2d_decc_out_c6_lo0_1_scanin[20]
//  ff_l2d_decc_out_c6_lo0_3_scanin[20]
//  ff_l2d_decc_out_c6_hi0_1_scanin[20]
//  ff_l2d_decc_out_c6_hi0_3_scanin[20]
//  ff_l2d_decc_out_c6_lo1_1_scanin[20]
//  ff_l2d_decc_out_c6_lo1_3_scanin[20]
//  ff_l2d_decc_out_c6_hi1_1_scanin[20]
//  ff_l2d_decc_out_c6_hi1_3_scanin[20]
//  ff_l2d_decc_out_c6_lo0_1_scanin[21]
//  ff_l2d_decc_out_c6_lo0_3_scanin[21]
//  ff_l2d_decc_out_c6_hi0_1_scanin[21]
//  ff_l2d_decc_out_c6_hi0_3_scanin[21]
//  ff_l2d_decc_out_c6_lo1_1_scanin[21]
//  ff_l2d_decc_out_c6_lo1_3_scanin[21]
//  ff_l2d_decc_out_c6_hi1_1_scanin[21]
//  ff_l2d_decc_out_c6_hi1_3_scanin[21]
//  ff_l2d_decc_out_c6_lo0_1_scanin[22]
//  ff_l2d_decc_out_c6_lo0_3_scanin[22]
//  ff_l2d_decc_out_c6_hi0_1_scanin[22]
//  ff_l2d_decc_out_c6_hi0_3_scanin[22]
//  ff_l2d_decc_out_c6_lo1_1_scanin[22]
//  ff_l2d_decc_out_c6_lo1_3_scanin[22]
//  ff_l2d_decc_out_c6_hi1_1_scanin[22]
//  ff_l2d_decc_out_c6_hi1_3_scanin[22]
//  ff_l2d_decc_out_c6_lo0_1_scanin[23]
//  ff_l2d_decc_out_c6_lo0_3_scanin[23]
//  ff_l2d_decc_out_c6_hi0_1_scanin[23]
//  ff_l2d_decc_out_c6_hi0_3_scanin[23]
//  ff_l2d_decc_out_c6_lo1_1_scanin[23]
//  ff_l2d_decc_out_c6_lo1_3_scanin[23]
//  ff_l2d_decc_out_c6_hi1_1_scanin[23]
//  ff_l2d_decc_out_c6_hi1_3_scanin[23]
//  ff_l2d_decc_out_c6_lo0_1_scanin[24]
//  ff_l2d_decc_out_c6_lo0_3_scanin[24]
//  ff_l2d_decc_out_c6_hi0_1_scanin[24]
//  ff_l2d_decc_out_c6_hi0_3_scanin[24]
//  ff_l2d_decc_out_c6_lo1_1_scanin[24]
//  ff_l2d_decc_out_c6_lo1_3_scanin[24]
//  ff_l2d_decc_out_c6_hi1_1_scanin[24]
//  ff_l2d_decc_out_c6_hi1_3_scanin[24]
//  ff_l2d_decc_out_c6_lo0_1_scanin[25]
//  ff_l2d_decc_out_c6_lo0_3_scanin[25]
//  ff_l2d_decc_out_c6_hi0_1_scanin[25]
//  ff_l2d_decc_out_c6_hi0_3_scanin[25]
//  ff_l2d_decc_out_c6_lo1_1_scanin[25]
//  ff_l2d_decc_out_c6_lo1_3_scanin[25]
//  ff_l2d_decc_out_c6_hi1_1_scanin[25]
//  ff_l2d_decc_out_c6_hi1_3_scanin[25]
//  ff_l2d_decc_out_c6_lo0_1_scanin[26]
//  ff_l2d_decc_out_c6_lo0_3_scanin[26]
//  ff_l2d_decc_out_c6_hi0_1_scanin[26]
//  ff_l2d_decc_out_c6_hi0_3_scanin[26]
//  ff_l2d_decc_out_c6_lo1_1_scanin[26]
//  ff_l2d_decc_out_c6_lo1_3_scanin[26]
//  ff_l2d_decc_out_c6_hi1_1_scanin[26]
//  ff_l2d_decc_out_c6_hi1_3_scanin[26]
//  ff_l2d_decc_out_c6_lo0_1_scanin[27]
//  ff_l2d_decc_out_c6_lo0_3_scanin[27]
//  ff_l2d_decc_out_c6_hi0_1_scanin[27]
//  ff_l2d_decc_out_c6_hi0_3_scanin[27]
//  ff_l2d_decc_out_c6_lo1_1_scanin[27]
//  ff_l2d_decc_out_c6_lo1_3_scanin[27]
//  ff_l2d_decc_out_c6_hi1_1_scanin[27]
//  ff_l2d_decc_out_c6_hi1_3_scanin[27]
//  ff_l2d_decc_out_c6_lo0_1_scanin[28]
//  ff_l2d_decc_out_c6_lo0_3_scanin[28]
//  ff_l2d_decc_out_c6_hi0_1_scanin[28]
//  ff_l2d_decc_out_c6_hi0_3_scanin[28]
//  ff_l2d_decc_out_c6_lo1_1_scanin[28]
//  ff_l2d_decc_out_c6_lo1_3_scanin[28]
//  ff_l2d_decc_out_c6_hi1_1_scanin[28]
//  ff_l2d_decc_out_c6_hi1_3_scanin[28]
//  ff_l2d_decc_out_c6_lo0_1_scanin[29]
//  ff_l2d_decc_out_c6_lo0_3_scanin[29]

//  ff_l2d_decc_out_c6_hi0_1_scanin[29]
//  ff_l2d_decc_out_c6_hi0_3_scanin[29]
//  ff_l2d_decc_out_c6_lo1_1_scanin[29]
//  ff_l2d_decc_out_c6_lo1_3_scanin[29]
//  ff_l2d_decc_out_c6_hi1_1_scanin[29]
//  ff_l2d_decc_out_c6_hi1_3_scanin[29]
//  ff_l2d_decc_out_c6_lo0_1_scanin[30]
//  ff_l2d_decc_out_c6_lo0_3_scanin[30]
//  ff_l2d_decc_out_c6_hi0_1_scanin[30]
//  ff_l2d_decc_out_c6_hi0_3_scanin[30]
//  ff_l2d_decc_out_c6_lo1_1_scanin[30]
//  ff_l2d_decc_out_c6_lo1_3_scanin[30]
//  ff_l2d_decc_out_c6_hi1_1_scanin[30]
//  ff_l2d_decc_out_c6_hi1_3_scanin[30]
//  ff_l2d_decc_out_c6_lo0_1_scanin[31]
//  ff_l2d_decc_out_c6_lo0_3_scanin[31]
//  ff_l2d_decc_out_c6_hi0_1_scanin[31]
//  ff_l2d_decc_out_c6_hi0_3_scanin[31]
//  ff_l2d_decc_out_c6_lo1_1_scanin[31]
//  ff_l2d_decc_out_c6_lo1_3_scanin[31]
//  ff_l2d_decc_out_c6_hi1_1_scanin[31]
//  ff_l2d_decc_out_c6_hi1_3_scanin[31]
//  ff_l2d_decc_out_c6_lo0_1_scanin[32]
//  ff_l2d_decc_out_c6_lo0_3_scanin[32]
//  ff_l2d_decc_out_c6_hi0_1_scanin[32]
//  ff_l2d_decc_out_c6_hi0_3_scanin[32]
//  ff_l2d_decc_out_c6_lo1_1_scanin[32]
//  ff_l2d_decc_out_c6_lo1_3_scanin[32]
//  ff_l2d_decc_out_c6_hi1_1_scanin[32]
//  ff_l2d_decc_out_c6_hi1_3_scanin[32]
//  ff_l2d_decc_out_c6_lo0_1_scanin[33]
//  ff_l2d_decc_out_c6_lo0_3_scanin[33]
//  ff_l2d_decc_out_c6_hi0_1_scanin[33]
//  ff_l2d_decc_out_c6_hi0_3_scanin[33]
//  ff_l2d_decc_out_c6_lo1_1_scanin[33]
//  ff_l2d_decc_out_c6_lo1_3_scanin[33]
//  ff_l2d_decc_out_c6_hi1_1_scanin[33]
//  ff_l2d_decc_out_c6_hi1_3_scanin[33]
//  ff_l2d_decc_out_c6_lo0_1_scanin[34]
//  ff_l2d_decc_out_c6_lo0_3_scanin[34]
//  ff_l2d_decc_out_c6_hi0_1_scanin[34]
//  ff_l2d_decc_out_c6_hi0_3_scanin[34]
//  ff_l2d_decc_out_c6_lo1_1_scanin[34]
//  ff_l2d_decc_out_c6_lo1_3_scanin[34]
//  ff_l2d_decc_out_c6_hi1_1_scanin[34]
//  ff_l2d_decc_out_c6_hi1_3_scanin[34]
//  ff_l2d_decc_out_c6_lo0_1_scanin[35]
//  ff_l2d_decc_out_c6_lo0_3_scanin[35]
//  ff_l2d_decc_out_c6_hi0_1_scanin[35]
//  ff_l2d_decc_out_c6_hi0_3_scanin[35]
//  ff_l2d_decc_out_c6_lo1_1_scanin[35]
//  ff_l2d_decc_out_c6_lo1_3_scanin[35]
//  ff_l2d_decc_out_c6_hi1_1_scanin[35]
//  ff_l2d_decc_out_c6_hi1_3_scanin[35]
//  ff_l2d_decc_out_c6_lo0_1_scanin[36]
//  ff_l2d_decc_out_c6_lo0_3_scanin[36]
//  ff_l2d_decc_out_c6_hi0_1_scanin[36]
//  ff_l2d_decc_out_c6_hi0_3_scanin[36]
//  ff_l2d_decc_out_c6_lo1_1_scanin[36]
//  ff_l2d_decc_out_c6_lo1_3_scanin[36]
//  ff_l2d_decc_out_c6_hi1_1_scanin[36]
//  ff_l2d_decc_out_c6_hi1_3_scanin[36]
//  ff_l2d_decc_out_c6_lo0_1_scanin[37]
//  ff_l2d_decc_out_c6_lo0_3_scanin[37]
//  ff_l2d_decc_out_c6_hi0_1_scanin[37]
//  ff_l2d_decc_out_c6_hi0_3_scanin[37]
//  ff_l2d_decc_out_c6_lo1_1_scanin[37]
//  ff_l2d_decc_out_c6_lo1_3_scanin[37]
//  ff_l2d_decc_out_c6_hi1_1_scanin[37]
//  ff_l2d_decc_out_c6_hi1_3_scanin[37]
//  ff_l2d_decc_out_c6_lo0_1_scanin[38]
//  ff_l2d_decc_out_c6_lo0_3_scanin[38]
//  ff_l2d_decc_out_c6_hi0_1_scanin[38]
//  ff_l2d_decc_out_c6_hi0_3_scanin[38]
//  ff_l2d_decc_out_c6_lo1_1_scanin[38]
//  ff_l2d_decc_out_c6_lo1_3_scanin[38]
//  ff_l2d_decc_out_c6_hi1_1_scanin[38]
//  ff_l2d_decc_out_c6_hi1_3_scanin[38]

//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[4]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[4]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[4]

//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[4]

//  ff_cache_col_offset_c5_001_scanin[0]
//  ff_cache_col_offset_c5_001_scanin[2]
//  ff_cache_col_offset_c4_001_scanin[0]
//  ff_cache_col_offset_c4_001_scanin[2]
//  ff_cache_col_offset_c4_tog_001_scanin[0]
//  ff_cache_cache_rd_wr_c5_00_scanin
//  ff_cache_col_offset_c5_001_scanin[1]
//  ff_cache_col_offset_c5_001_scanin[3]
//  ff_cache_col_offset_c4_001_scanin[1]
//  ff_cache_col_offset_c4_001_scanin[3]
//  ff_cache_col_offset_c4_tog_001_scanin[1]

//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[14]

//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[14]
//  ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[14]
//  ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[14]

//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[19]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[18]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[17]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[16]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[15]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[14]

//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[10]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[11]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[12]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[13]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[14]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[14]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[14]


//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[0]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[1]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[2]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[3]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[4]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[4]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[4]



//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[9]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[8]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[7]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[6]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[5]
//  ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[4]


//  ff_l2d_decc_out_c6_lo0_1_scanin[0]
//  ff_l2d_decc_out_c6_lo0_3_scanin[0]
//  ff_l2d_decc_out_c6_hi0_1_scanin[0]
//  ff_l2d_decc_out_c6_hi0_3_scanin[0]
//  ff_l2d_decc_out_c6_lo1_1_scanin[0]
//  ff_l2d_decc_out_c6_lo1_3_scanin[0]
//  ff_l2d_decc_out_c6_hi1_1_scanin[0]
//  ff_l2d_decc_out_c6_hi1_3_scanin[0]
//  ff_l2d_decc_out_c6_lo0_1_scanin[1]
//  ff_l2d_decc_out_c6_lo0_3_scanin[1]
//  ff_l2d_decc_out_c6_hi0_1_scanin[1]
//  ff_l2d_decc_out_c6_hi0_3_scanin[1]
//  ff_l2d_decc_out_c6_lo1_1_scanin[1]
//  ff_l2d_decc_out_c6_lo1_3_scanin[1]
//  ff_l2d_decc_out_c6_hi1_1_scanin[1]
//  ff_l2d_decc_out_c6_hi1_3_scanin[1]
//  ff_l2d_decc_out_c6_lo0_1_scanin[2]
//  ff_l2d_decc_out_c6_lo0_3_scanin[2]
//  ff_l2d_decc_out_c6_hi0_1_scanin[2]
//  ff_l2d_decc_out_c6_hi0_3_scanin[2]
//  ff_l2d_decc_out_c6_lo1_1_scanin[2]
//  ff_l2d_decc_out_c6_lo1_3_scanin[2]
//  ff_l2d_decc_out_c6_hi1_1_scanin[2]
//  ff_l2d_decc_out_c6_hi1_3_scanin[2]
//  ff_l2d_decc_out_c6_lo0_1_scanin[3]
//  ff_l2d_decc_out_c6_lo0_3_scanin[3]
//  ff_l2d_decc_out_c6_hi0_1_scanin[3]
//  ff_l2d_decc_out_c6_hi0_3_scanin[3]
//  ff_l2d_decc_out_c6_lo1_1_scanin[3]
//  ff_l2d_decc_out_c6_lo1_3_scanin[3]
//  ff_l2d_decc_out_c6_hi1_1_scanin[3]
//  ff_l2d_decc_out_c6_hi1_3_scanin[3]
//  ff_l2d_decc_out_c6_lo0_1_scanin[4]
//  ff_l2d_decc_out_c6_lo0_3_scanin[4]
//  ff_l2d_decc_out_c6_hi0_1_scanin[4]
//  ff_l2d_decc_out_c6_hi0_3_scanin[4]
//  ff_l2d_decc_out_c6_lo1_1_scanin[4]
//  ff_l2d_decc_out_c6_lo1_3_scanin[4]
//  ff_l2d_decc_out_c6_hi1_1_scanin[4]
//  ff_l2d_decc_out_c6_hi1_3_scanin[4]
//  ff_l2d_decc_out_c6_lo0_1_scanin[5]
//  ff_l2d_decc_out_c6_lo0_3_scanin[5]
//  ff_l2d_decc_out_c6_hi0_1_scanin[5]
//  ff_l2d_decc_out_c6_hi0_3_scanin[5]
//  ff_l2d_decc_out_c6_lo1_1_scanin[5]
//  ff_l2d_decc_out_c6_lo1_3_scanin[5]
//  ff_l2d_decc_out_c6_hi1_1_scanin[5]
//  ff_l2d_decc_out_c6_hi1_3_scanin[5]
//  ff_l2d_decc_out_c6_lo0_1_scanin[6]
//  ff_l2d_decc_out_c6_lo0_3_scanin[6]
//  ff_l2d_decc_out_c6_hi0_1_scanin[6]
//  ff_l2d_decc_out_c6_hi0_3_scanin[6]
//  ff_l2d_decc_out_c6_lo1_1_scanin[6]
//  ff_l2d_decc_out_c6_lo1_3_scanin[6]
//  ff_l2d_decc_out_c6_hi1_1_scanin[6]
//  ff_l2d_decc_out_c6_hi1_3_scanin[6]
//  ff_l2d_decc_out_c6_lo0_1_scanin[7]
//  ff_l2d_decc_out_c6_lo0_3_scanin[7]
//  ff_l2d_decc_out_c6_hi0_1_scanin[7]
//  ff_l2d_decc_out_c6_hi0_3_scanin[7]
//  ff_l2d_decc_out_c6_lo1_1_scanin[7]
//  ff_l2d_decc_out_c6_lo1_3_scanin[7]
//  ff_l2d_decc_out_c6_hi1_1_scanin[7]
//  ff_l2d_decc_out_c6_hi1_3_scanin[7]
//  ff_l2d_decc_out_c6_lo0_1_scanin[8]
//  ff_l2d_decc_out_c6_lo0_3_scanin[8]
//  ff_l2d_decc_out_c6_hi0_1_scanin[8]
//  ff_l2d_decc_out_c6_hi0_3_scanin[8]
//  ff_l2d_decc_out_c6_lo1_1_scanin[8]
//  ff_l2d_decc_out_c6_lo1_3_scanin[8]
//  ff_l2d_decc_out_c6_hi1_1_scanin[8]
//  ff_l2d_decc_out_c6_hi1_3_scanin[8]
//  ff_l2d_decc_out_c6_lo0_1_scanin[9]
//  ff_l2d_decc_out_c6_lo0_3_scanin[9]
//  ff_l2d_decc_out_c6_hi0_1_scanin[9]
//  ff_l2d_decc_out_c6_hi0_3_scanin[9]
//  ff_l2d_decc_out_c6_lo1_1_scanin[9]
//  ff_l2d_decc_out_c6_lo1_3_scanin[9]
//  ff_l2d_decc_out_c6_hi1_1_scanin[9]
//  ff_l2d_decc_out_c6_hi1_3_scanin[9]

//  ff_l2d_decc_out_c6_lo0_1_scanin[10]
//  ff_l2d_decc_out_c6_lo0_3_scanin[10]
//  ff_l2d_decc_out_c6_hi0_1_scanin[10]
//  ff_l2d_decc_out_c6_hi0_3_scanin[10]
//  ff_l2d_decc_out_c6_lo1_1_scanin[10]
//  ff_l2d_decc_out_c6_lo1_3_scanin[10]
//  ff_l2d_decc_out_c6_hi1_1_scanin[10]
//  ff_l2d_decc_out_c6_hi1_3_scanin[10]
//  ff_l2d_decc_out_c6_lo0_1_scanin[11]
//  ff_l2d_decc_out_c6_lo0_3_scanin[11]
//  ff_l2d_decc_out_c6_hi0_1_scanin[11]
//  ff_l2d_decc_out_c6_hi0_3_scanin[11]
//  ff_l2d_decc_out_c6_lo1_1_scanin[11]
//  ff_l2d_decc_out_c6_lo1_3_scanin[11]
//  ff_l2d_decc_out_c6_hi1_1_scanin[11]
//  ff_l2d_decc_out_c6_hi1_3_scanin[11]
//  ff_l2d_decc_out_c6_lo0_1_scanin[12]
//  ff_l2d_decc_out_c6_lo0_3_scanin[12]
//  ff_l2d_decc_out_c6_hi0_1_scanin[12]
//  ff_l2d_decc_out_c6_hi0_3_scanin[12]
//  ff_l2d_decc_out_c6_lo1_1_scanin[12]
//  ff_l2d_decc_out_c6_lo1_3_scanin[12]
//  ff_l2d_decc_out_c6_hi1_1_scanin[12]
//  ff_l2d_decc_out_c6_hi1_3_scanin[12]
//  ff_l2d_decc_out_c6_lo0_1_scanin[13]
//  ff_l2d_decc_out_c6_lo0_3_scanin[13]
//  ff_l2d_decc_out_c6_hi0_1_scanin[13]
//  ff_l2d_decc_out_c6_hi0_3_scanin[13]
//  ff_l2d_decc_out_c6_lo1_1_scanin[13]
//  ff_l2d_decc_out_c6_lo1_3_scanin[13]
//  ff_l2d_decc_out_c6_hi1_1_scanin[13]
//  ff_l2d_decc_out_c6_hi1_3_scanin[13]
//  ff_l2d_decc_out_c6_lo0_1_scanin[14]
//  ff_l2d_decc_out_c6_lo0_3_scanin[14]
//  ff_l2d_decc_out_c6_hi0_1_scanin[14]
//  ff_l2d_decc_out_c6_hi0_3_scanin[14]
//  ff_l2d_decc_out_c6_lo1_1_scanin[14]
//  ff_l2d_decc_out_c6_lo1_3_scanin[14]
//  ff_l2d_decc_out_c6_hi1_1_scanin[14]
//  ff_l2d_decc_out_c6_hi1_3_scanin[14]
//  ff_l2d_decc_out_c6_lo0_1_scanin[15]
//  ff_l2d_decc_out_c6_lo0_3_scanin[15]
//  ff_l2d_decc_out_c6_hi0_1_scanin[15]
//  ff_l2d_decc_out_c6_hi0_3_scanin[15]
//  ff_l2d_decc_out_c6_lo1_1_scanin[15]
//  ff_l2d_decc_out_c6_lo1_3_scanin[15]
//  ff_l2d_decc_out_c6_hi1_1_scanin[15]
//  ff_l2d_decc_out_c6_hi1_3_scanin[15]
//  ff_l2d_decc_out_c6_lo0_1_scanin[16]
//  ff_l2d_decc_out_c6_lo0_3_scanin[16]
//  ff_l2d_decc_out_c6_hi0_1_scanin[16]
//  ff_l2d_decc_out_c6_hi0_3_scanin[16]
//  ff_l2d_decc_out_c6_lo1_1_scanin[16]
//  ff_l2d_decc_out_c6_lo1_3_scanin[16]
//  ff_l2d_decc_out_c6_hi1_1_scanin[16]
//  ff_l2d_decc_out_c6_hi1_3_scanin[16]
//  ff_l2d_decc_out_c6_lo0_1_scanin[17]
//  ff_l2d_decc_out_c6_lo0_3_scanin[17]
//  ff_l2d_decc_out_c6_hi0_1_scanin[17]
//  ff_l2d_decc_out_c6_hi0_3_scanin[17]
//  ff_l2d_decc_out_c6_lo1_1_scanin[17]
//  ff_l2d_decc_out_c6_lo1_3_scanin[17]
//  ff_l2d_decc_out_c6_hi1_1_scanin[17]
//  ff_l2d_decc_out_c6_hi1_3_scanin[17]
//  ff_l2d_decc_out_c6_lo0_1_scanin[18]
//  ff_l2d_decc_out_c6_lo0_3_scanin[18]
//  ff_l2d_decc_out_c6_hi0_1_scanin[18]
//  ff_l2d_decc_out_c6_hi0_3_scanin[18]
//  ff_l2d_decc_out_c6_lo1_1_scanin[18]
//  ff_l2d_decc_out_c6_lo1_3_scanin[18]
//  ff_l2d_decc_out_c6_hi1_1_scanin[18]
//  ff_l2d_decc_out_c6_hi1_3_scanin[18]
//  ff_l2d_decc_out_c6_lo0_1_scanin[19]
//  ff_l2d_decc_out_c6_lo0_3_scanin[19]
//  ff_l2d_decc_out_c6_hi0_1_scanin[19]
//  ff_l2d_decc_out_c6_hi0_3_scanin[19]
// scanorder end
// fixscan start
assign ff_cache_cache_rd_wr_c4_scanin=scan_in;
assign ff_cache_set_c3_scanin[8]=ff_cache_cache_rd_wr_c4_scanout;
assign ff_cache_set_c3_scanin[7]=ff_cache_set_c3_scanout[8];
assign ff_cache_set_c3_scanin[6]=ff_cache_set_c3_scanout[7];
assign ff_cache_set_c3_scanin[5]=ff_cache_set_c3_scanout[6];
assign ff_cache_set_c3_scanin[4]=ff_cache_set_c3_scanout[5];
assign ff_cache_set_c3_scanin[3]=ff_cache_set_c3_scanout[4];
assign ff_cache_set_c3_scanin[2]=ff_cache_set_c3_scanout[3];
assign ff_cache_set_c3_scanin[1]=ff_cache_set_c3_scanout[2];
assign ff_cache_set_c3_scanin[0]=ff_cache_set_c3_scanout[1];
assign ff_cache_word_en_c3_scanin[1]=ff_cache_set_c3_scanout[0];
assign ff_cache_word_en_c3_scanin[3]=ff_cache_word_en_c3_scanout[1];
assign ff_cache_word_en_c3_scanin[5]=ff_cache_word_en_c3_scanout[3];
assign ff_cache_word_en_c3_scanin[7]=ff_cache_word_en_c3_scanout[5];
assign ff_cache_word_en_c3_scanin[9]=ff_cache_word_en_c3_scanout[7];
assign ff_cache_word_en_c3_scanin[11]=ff_cache_word_en_c3_scanout[9];
assign ff_cache_word_en_c3_scanin[13]=ff_cache_word_en_c3_scanout[11];
assign ff_cache_word_en_c3_scanin[15]=ff_cache_word_en_c3_scanout[13];
assign ff_cache_col_offset_c3_scanin[0]=ff_cache_word_en_c3_scanout[15];
assign ff_cache_col_offset_c4_scanin[0]=ff_cache_col_offset_c3_scanout[0];
assign ff_cache_col_offset_c5_muxsel_scanin[0]=ff_cache_col_offset_c4_scanout[0];
assign ff_cache_col_offset_c5_muxsel_scanin[1]=ff_cache_col_offset_c5_muxsel_scanout[0];
assign ff_cache_col_offset_c4_scanin[1]=ff_cache_col_offset_c5_muxsel_scanout[1];
assign ff_cache_col_offset_c3_scanin[1]=ff_cache_col_offset_c4_scanout[1];
assign ff_cache_col_offset_c3_scanin[2]=ff_cache_col_offset_c3_scanout[1];
assign ff_cache_col_offset_c4_scanin[2]=ff_cache_col_offset_c3_scanout[2];
assign ff_cache_col_offset_c5_muxsel_scanin[2]=ff_cache_col_offset_c4_scanout[2];
assign ff_cache_col_offset_c5_muxsel_scanin[3]=ff_cache_col_offset_c5_muxsel_scanout[2];
assign ff_cache_col_offset_c4_scanin[3]=ff_cache_col_offset_c5_muxsel_scanout[3];
assign ff_cache_col_offset_c3_scanin[3]=ff_cache_col_offset_c4_scanout[3];
assign ff_cache_col_offset_all_c4_scanin=ff_cache_col_offset_c3_scanout[3];
assign ff_cache_col_offset_all_c5_scanin=ff_cache_col_offset_all_c4_scanout;
assign ff_cache_col_offset_all_c6_scanin=ff_cache_col_offset_all_c5_scanout;
assign ff_cache_col_offset_all_c7_scanin=ff_cache_col_offset_all_c6_scanout;
assign ff_cache_word_en_c3_scanin[0]=ff_cache_col_offset_all_c7_scanout;
assign ff_cache_word_en_c3_scanin[2]=ff_cache_word_en_c3_scanout[0];
assign ff_cache_word_en_c3_scanin[4]=ff_cache_word_en_c3_scanout[2];
assign ff_cache_word_en_c3_scanin[6]=ff_cache_word_en_c3_scanout[4];
assign ff_cache_word_en_c3_scanin[8]=ff_cache_word_en_c3_scanout[6];
assign ff_cache_word_en_c3_scanin[10]=ff_cache_word_en_c3_scanout[8];
assign ff_cache_word_en_c3_scanin[12]=ff_cache_word_en_c3_scanout[10];
assign ff_cache_word_en_c3_scanin[14]=ff_cache_word_en_c3_scanout[12];
assign ff_cache_col_offset_c52_scanin[1]=ff_cache_word_en_c3_scanout[14];
assign ff_cache_col_offset_c52_scanin[0]=ff_cache_col_offset_c52_scanout[1];
assign ff_cache_col_offset_c52_topsel_scanin=ff_cache_col_offset_c52_scanout[0];
assign ff_cache_fb_hit_c4_scanin=ff_cache_col_offset_c52_topsel_scanout;
assign ff_cache_fb_hit_c5_scanin=ff_cache_fb_hit_c4_scanout;
assign ff_cache_fb_hit_c52_scanin=ff_cache_fb_hit_c5_scanout;
assign ff_cache_sel_fbdecc_c4_scanin=ff_cache_fb_hit_c52_scanout;
assign ff_cache_sel_fbdecc_c5_scanin=ff_cache_sel_fbdecc_c4_scanout;
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[0]=ff_cache_sel_fbdecc_c5_scanout;
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[0]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[1]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[1]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[1]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[1]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[2]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[2]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[2]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[2]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[3]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[3]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[3]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[3]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[4]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[4]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[4]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[9]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[9]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[9]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[8]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[8]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[8]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[8]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[7]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[7]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[7]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[7]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[6]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[6]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[6]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[6]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[5]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[5]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[5]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[5]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[4]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[5];
assign ff_l2t_l2d_stdecc_c3_scanin[77]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[4];
assign ff_l2t_l2d_stdecc_c3_scanin[76]=ff_l2t_l2d_stdecc_c3_scanout[77];
assign ff_l2t_l2d_stdecc_c3_scanin[75]=ff_l2t_l2d_stdecc_c3_scanout[76];
assign ff_l2t_l2d_stdecc_c3_scanin[74]=ff_l2t_l2d_stdecc_c3_scanout[75];
assign ff_l2t_l2d_stdecc_c3_scanin[73]=ff_l2t_l2d_stdecc_c3_scanout[74];
assign ff_l2t_l2d_stdecc_c3_scanin[72]=ff_l2t_l2d_stdecc_c3_scanout[73];
assign ff_l2t_l2d_stdecc_c3_scanin[71]=ff_l2t_l2d_stdecc_c3_scanout[72];
assign ff_l2t_l2d_stdecc_c3_scanin[70]=ff_l2t_l2d_stdecc_c3_scanout[71];
assign ff_l2t_l2d_stdecc_c3_scanin[69]=ff_l2t_l2d_stdecc_c3_scanout[70];
assign ff_l2t_l2d_stdecc_c3_scanin[68]=ff_l2t_l2d_stdecc_c3_scanout[69];
assign ff_l2t_l2d_stdecc_c3_scanin[67]=ff_l2t_l2d_stdecc_c3_scanout[68];
assign ff_l2t_l2d_stdecc_c3_scanin[66]=ff_l2t_l2d_stdecc_c3_scanout[67];
assign ff_l2t_l2d_stdecc_c3_scanin[65]=ff_l2t_l2d_stdecc_c3_scanout[66];
assign ff_l2t_l2d_stdecc_c3_scanin[64]=ff_l2t_l2d_stdecc_c3_scanout[65];
assign ff_l2t_l2d_stdecc_c3_scanin[63]=ff_l2t_l2d_stdecc_c3_scanout[64];
assign ff_l2t_l2d_stdecc_c3_scanin[62]=ff_l2t_l2d_stdecc_c3_scanout[63];
assign ff_l2t_l2d_stdecc_c3_scanin[61]=ff_l2t_l2d_stdecc_c3_scanout[62];
assign ff_l2t_l2d_stdecc_c3_scanin[60]=ff_l2t_l2d_stdecc_c3_scanout[61];
assign ff_l2t_l2d_stdecc_c3_scanin[59]=ff_l2t_l2d_stdecc_c3_scanout[60];
assign ff_l2t_l2d_stdecc_c3_scanin[58]=ff_l2t_l2d_stdecc_c3_scanout[59];
assign ff_l2t_l2d_stdecc_c3_scanin[57]=ff_l2t_l2d_stdecc_c3_scanout[58];
assign ff_l2t_l2d_stdecc_c3_scanin[56]=ff_l2t_l2d_stdecc_c3_scanout[57];
assign ff_l2t_l2d_stdecc_c3_scanin[55]=ff_l2t_l2d_stdecc_c3_scanout[56];
assign ff_l2t_l2d_stdecc_c3_scanin[54]=ff_l2t_l2d_stdecc_c3_scanout[55];
assign ff_l2t_l2d_stdecc_c3_scanin[53]=ff_l2t_l2d_stdecc_c3_scanout[54];
assign ff_l2t_l2d_stdecc_c3_scanin[52]=ff_l2t_l2d_stdecc_c3_scanout[53];
assign ff_l2t_l2d_stdecc_c3_scanin[51]=ff_l2t_l2d_stdecc_c3_scanout[52];
assign ff_l2t_l2d_stdecc_c3_scanin[50]=ff_l2t_l2d_stdecc_c3_scanout[51];
assign ff_l2t_l2d_stdecc_c3_scanin[49]=ff_l2t_l2d_stdecc_c3_scanout[50];
assign ff_l2t_l2d_stdecc_c3_scanin[48]=ff_l2t_l2d_stdecc_c3_scanout[49];
assign ff_l2t_l2d_stdecc_c3_scanin[47]=ff_l2t_l2d_stdecc_c3_scanout[48];
assign ff_l2t_l2d_stdecc_c3_scanin[46]=ff_l2t_l2d_stdecc_c3_scanout[47];
assign ff_l2t_l2d_stdecc_c3_scanin[45]=ff_l2t_l2d_stdecc_c3_scanout[46];
assign ff_l2t_l2d_stdecc_c3_scanin[44]=ff_l2t_l2d_stdecc_c3_scanout[45];
assign ff_l2t_l2d_stdecc_c3_scanin[43]=ff_l2t_l2d_stdecc_c3_scanout[44];
assign ff_l2t_l2d_stdecc_c3_scanin[42]=ff_l2t_l2d_stdecc_c3_scanout[43];
assign ff_l2t_l2d_stdecc_c3_scanin[41]=ff_l2t_l2d_stdecc_c3_scanout[42];
assign ff_l2t_l2d_stdecc_c3_scanin[40]=ff_l2t_l2d_stdecc_c3_scanout[41];
assign ff_l2t_l2d_stdecc_c3_scanin[39]=ff_l2t_l2d_stdecc_c3_scanout[40];
assign ff_cache_col_offset_c5_023_scanin[0]=ff_l2t_l2d_stdecc_c3_scanout[39];
assign ff_cache_col_offset_c5_023_scanin[2]=ff_cache_col_offset_c5_023_scanout[0];
assign ff_cache_col_offset_c4_023_scanin[0]=ff_cache_col_offset_c5_023_scanout[2];
assign ff_cache_col_offset_c4_023_scanin[2]=ff_cache_col_offset_c4_023_scanout[0];
assign ff_cache_col_offset_c4_tog_023_scanin[0]=ff_cache_col_offset_c4_023_scanout[2];
assign ff_cache_cache_rd_wr_c5_20_scanin=ff_cache_col_offset_c4_tog_023_scanout[0];
assign ff_cache_col_offset_c5_023_scanin[1]=ff_cache_cache_rd_wr_c5_20_scanout;
assign ff_cache_col_offset_c5_023_scanin[3]=ff_cache_col_offset_c5_023_scanout[1];
assign ff_cache_col_offset_c4_023_scanin[1]=ff_cache_col_offset_c5_023_scanout[3];
assign ff_cache_col_offset_c4_023_scanin[3]=ff_cache_col_offset_c4_023_scanout[1];
assign ff_cache_col_offset_c4_tog_023_scanin[1]=ff_cache_col_offset_c4_023_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[19]=ff_cache_col_offset_c4_tog_023_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[19]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[18]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[18]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[18]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[18]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[17]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[17]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[17]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[17]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[16]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[16]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[16]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[16]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[15]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[15]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[15]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[15]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[14]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[9]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[10]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[10]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[10]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[10]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[11]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[11]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[11]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[11]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[12]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[12]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[12]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[12]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[13]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[13]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[13]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[13]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[14]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[14]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[14]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[19]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[19]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[18]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[18]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[18]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[18]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[17]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[17]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[17]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[17]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[16]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[16]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[16]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[16]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[15]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[15]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[15]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[15]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[14]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[9]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[10]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[10]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[10]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[10]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[11]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[11]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[11]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[11]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[12]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[12]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[12]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[12]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[13]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[13]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[13]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[13]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[14]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[14]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[14]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[0]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[1]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[1]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[1]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[1]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[2]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[2]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[2]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[2]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[3]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[3]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[3]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[3]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[4]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[4]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[4]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[9]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[9]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[9]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[8]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[8]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[8]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[8]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[7]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[7]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[7]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[7]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[6]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[6]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[6]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[6]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[5]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[5]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[5]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[5]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[4]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[5];
assign ff_l2d_decc_out_c6_lo0_2_scanin[0]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[4];
assign ff_l2d_decc_out_c6_lo0_4_scanin[0]=ff_l2d_decc_out_c6_lo0_2_scanout[0];
assign ff_l2d_decc_out_c6_hi0_2_scanin[0]=ff_l2d_decc_out_c6_lo0_4_scanout[0];
assign ff_l2d_decc_out_c6_hi0_4_scanin[0]=ff_l2d_decc_out_c6_hi0_2_scanout[0];
assign ff_l2d_decc_out_c6_lo1_2_scanin[0]=ff_l2d_decc_out_c6_hi0_4_scanout[0];
assign ff_l2d_decc_out_c6_lo1_4_scanin[0]=ff_l2d_decc_out_c6_lo1_2_scanout[0];
assign ff_l2d_decc_out_c6_hi1_2_scanin[0]=ff_l2d_decc_out_c6_lo1_4_scanout[0];
assign ff_l2d_decc_out_c6_hi1_4_scanin[0]=ff_l2d_decc_out_c6_hi1_2_scanout[0];
assign ff_l2d_decc_out_c6_lo0_2_scanin[1]=ff_l2d_decc_out_c6_hi1_4_scanout[0];
assign ff_l2d_decc_out_c6_lo0_4_scanin[1]=ff_l2d_decc_out_c6_lo0_2_scanout[1];
assign ff_l2d_decc_out_c6_hi0_2_scanin[1]=ff_l2d_decc_out_c6_lo0_4_scanout[1];
assign ff_l2d_decc_out_c6_hi0_4_scanin[1]=ff_l2d_decc_out_c6_hi0_2_scanout[1];
assign ff_l2d_decc_out_c6_lo1_2_scanin[1]=ff_l2d_decc_out_c6_hi0_4_scanout[1];
assign ff_l2d_decc_out_c6_lo1_4_scanin[1]=ff_l2d_decc_out_c6_lo1_2_scanout[1];
assign ff_l2d_decc_out_c6_hi1_2_scanin[1]=ff_l2d_decc_out_c6_lo1_4_scanout[1];
assign ff_l2d_decc_out_c6_hi1_4_scanin[1]=ff_l2d_decc_out_c6_hi1_2_scanout[1];
assign ff_l2d_decc_out_c6_lo0_2_scanin[2]=ff_l2d_decc_out_c6_hi1_4_scanout[1];
assign ff_l2d_decc_out_c6_lo0_4_scanin[2]=ff_l2d_decc_out_c6_lo0_2_scanout[2];
assign ff_l2d_decc_out_c6_hi0_2_scanin[2]=ff_l2d_decc_out_c6_lo0_4_scanout[2];
assign ff_l2d_decc_out_c6_hi0_4_scanin[2]=ff_l2d_decc_out_c6_hi0_2_scanout[2];
assign ff_l2d_decc_out_c6_lo1_2_scanin[2]=ff_l2d_decc_out_c6_hi0_4_scanout[2];
assign ff_l2d_decc_out_c6_lo1_4_scanin[2]=ff_l2d_decc_out_c6_lo1_2_scanout[2];
assign ff_l2d_decc_out_c6_hi1_2_scanin[2]=ff_l2d_decc_out_c6_lo1_4_scanout[2];
assign ff_l2d_decc_out_c6_hi1_4_scanin[2]=ff_l2d_decc_out_c6_hi1_2_scanout[2];
assign ff_l2d_decc_out_c6_lo0_2_scanin[3]=ff_l2d_decc_out_c6_hi1_4_scanout[2];
assign ff_l2d_decc_out_c6_lo0_4_scanin[3]=ff_l2d_decc_out_c6_lo0_2_scanout[3];
assign ff_l2d_decc_out_c6_hi0_2_scanin[3]=ff_l2d_decc_out_c6_lo0_4_scanout[3];
assign ff_l2d_decc_out_c6_hi0_4_scanin[3]=ff_l2d_decc_out_c6_hi0_2_scanout[3];
assign ff_l2d_decc_out_c6_lo1_2_scanin[3]=ff_l2d_decc_out_c6_hi0_4_scanout[3];
assign ff_l2d_decc_out_c6_lo1_4_scanin[3]=ff_l2d_decc_out_c6_lo1_2_scanout[3];
assign ff_l2d_decc_out_c6_hi1_2_scanin[3]=ff_l2d_decc_out_c6_lo1_4_scanout[3];
assign ff_l2d_decc_out_c6_hi1_4_scanin[3]=ff_l2d_decc_out_c6_hi1_2_scanout[3];
assign ff_l2d_decc_out_c6_lo0_2_scanin[4]=ff_l2d_decc_out_c6_hi1_4_scanout[3];
assign ff_l2d_decc_out_c6_lo0_4_scanin[4]=ff_l2d_decc_out_c6_lo0_2_scanout[4];
assign ff_l2d_decc_out_c6_hi0_2_scanin[4]=ff_l2d_decc_out_c6_lo0_4_scanout[4];
assign ff_l2d_decc_out_c6_hi0_4_scanin[4]=ff_l2d_decc_out_c6_hi0_2_scanout[4];
assign ff_l2d_decc_out_c6_lo1_2_scanin[4]=ff_l2d_decc_out_c6_hi0_4_scanout[4];
assign ff_l2d_decc_out_c6_lo1_4_scanin[4]=ff_l2d_decc_out_c6_lo1_2_scanout[4];
assign ff_l2d_decc_out_c6_hi1_2_scanin[4]=ff_l2d_decc_out_c6_lo1_4_scanout[4];
assign ff_l2d_decc_out_c6_hi1_4_scanin[4]=ff_l2d_decc_out_c6_hi1_2_scanout[4];
assign ff_l2d_decc_out_c6_lo0_2_scanin[5]=ff_l2d_decc_out_c6_hi1_4_scanout[4];
assign ff_l2d_decc_out_c6_lo0_4_scanin[5]=ff_l2d_decc_out_c6_lo0_2_scanout[5];
assign ff_l2d_decc_out_c6_hi0_2_scanin[5]=ff_l2d_decc_out_c6_lo0_4_scanout[5];
assign ff_l2d_decc_out_c6_hi0_4_scanin[5]=ff_l2d_decc_out_c6_hi0_2_scanout[5];
assign ff_l2d_decc_out_c6_lo1_2_scanin[5]=ff_l2d_decc_out_c6_hi0_4_scanout[5];
assign ff_l2d_decc_out_c6_lo1_4_scanin[5]=ff_l2d_decc_out_c6_lo1_2_scanout[5];
assign ff_l2d_decc_out_c6_hi1_2_scanin[5]=ff_l2d_decc_out_c6_lo1_4_scanout[5];
assign ff_l2d_decc_out_c6_hi1_4_scanin[5]=ff_l2d_decc_out_c6_hi1_2_scanout[5];
assign ff_l2d_decc_out_c6_lo0_2_scanin[6]=ff_l2d_decc_out_c6_hi1_4_scanout[5];
assign ff_l2d_decc_out_c6_lo0_4_scanin[6]=ff_l2d_decc_out_c6_lo0_2_scanout[6];
assign ff_l2d_decc_out_c6_hi0_2_scanin[6]=ff_l2d_decc_out_c6_lo0_4_scanout[6];
assign ff_l2d_decc_out_c6_hi0_4_scanin[6]=ff_l2d_decc_out_c6_hi0_2_scanout[6];
assign ff_l2d_decc_out_c6_lo1_2_scanin[6]=ff_l2d_decc_out_c6_hi0_4_scanout[6];
assign ff_l2d_decc_out_c6_lo1_4_scanin[6]=ff_l2d_decc_out_c6_lo1_2_scanout[6];
assign ff_l2d_decc_out_c6_hi1_2_scanin[6]=ff_l2d_decc_out_c6_lo1_4_scanout[6];
assign ff_l2d_decc_out_c6_hi1_4_scanin[6]=ff_l2d_decc_out_c6_hi1_2_scanout[6];
assign ff_l2d_decc_out_c6_lo0_2_scanin[7]=ff_l2d_decc_out_c6_hi1_4_scanout[6];
assign ff_l2d_decc_out_c6_lo0_4_scanin[7]=ff_l2d_decc_out_c6_lo0_2_scanout[7];
assign ff_l2d_decc_out_c6_hi0_2_scanin[7]=ff_l2d_decc_out_c6_lo0_4_scanout[7];
assign ff_l2d_decc_out_c6_hi0_4_scanin[7]=ff_l2d_decc_out_c6_hi0_2_scanout[7];
assign ff_l2d_decc_out_c6_lo1_2_scanin[7]=ff_l2d_decc_out_c6_hi0_4_scanout[7];
assign ff_l2d_decc_out_c6_lo1_4_scanin[7]=ff_l2d_decc_out_c6_lo1_2_scanout[7];
assign ff_l2d_decc_out_c6_hi1_2_scanin[7]=ff_l2d_decc_out_c6_lo1_4_scanout[7];
assign ff_l2d_decc_out_c6_hi1_4_scanin[7]=ff_l2d_decc_out_c6_hi1_2_scanout[7];
assign ff_l2d_decc_out_c6_lo0_2_scanin[8]=ff_l2d_decc_out_c6_hi1_4_scanout[7];
assign ff_l2d_decc_out_c6_lo0_4_scanin[8]=ff_l2d_decc_out_c6_lo0_2_scanout[8];
assign ff_l2d_decc_out_c6_hi0_2_scanin[8]=ff_l2d_decc_out_c6_lo0_4_scanout[8];
assign ff_l2d_decc_out_c6_hi0_4_scanin[8]=ff_l2d_decc_out_c6_hi0_2_scanout[8];
assign ff_l2d_decc_out_c6_lo1_2_scanin[8]=ff_l2d_decc_out_c6_hi0_4_scanout[8];
assign ff_l2d_decc_out_c6_lo1_4_scanin[8]=ff_l2d_decc_out_c6_lo1_2_scanout[8];
assign ff_l2d_decc_out_c6_hi1_2_scanin[8]=ff_l2d_decc_out_c6_lo1_4_scanout[8];
assign ff_l2d_decc_out_c6_hi1_4_scanin[8]=ff_l2d_decc_out_c6_hi1_2_scanout[8];
assign ff_l2d_decc_out_c6_lo0_2_scanin[9]=ff_l2d_decc_out_c6_hi1_4_scanout[8];
assign ff_l2d_decc_out_c6_lo0_4_scanin[9]=ff_l2d_decc_out_c6_lo0_2_scanout[9];
assign ff_l2d_decc_out_c6_hi0_2_scanin[9]=ff_l2d_decc_out_c6_lo0_4_scanout[9];
assign ff_l2d_decc_out_c6_hi0_4_scanin[9]=ff_l2d_decc_out_c6_hi0_2_scanout[9];
assign ff_l2d_decc_out_c6_lo1_2_scanin[9]=ff_l2d_decc_out_c6_hi0_4_scanout[9];
assign ff_l2d_decc_out_c6_lo1_4_scanin[9]=ff_l2d_decc_out_c6_lo1_2_scanout[9];
assign ff_l2d_decc_out_c6_hi1_2_scanin[9]=ff_l2d_decc_out_c6_lo1_4_scanout[9];
assign ff_l2d_decc_out_c6_hi1_4_scanin[9]=ff_l2d_decc_out_c6_hi1_2_scanout[9];
assign ff_l2d_decc_out_c6_lo0_2_scanin[10]=ff_l2d_decc_out_c6_hi1_4_scanout[9];
assign ff_l2d_decc_out_c6_lo0_4_scanin[10]=ff_l2d_decc_out_c6_lo0_2_scanout[10];
assign ff_l2d_decc_out_c6_hi0_2_scanin[10]=ff_l2d_decc_out_c6_lo0_4_scanout[10];
assign ff_l2d_decc_out_c6_hi0_4_scanin[10]=ff_l2d_decc_out_c6_hi0_2_scanout[10];
assign ff_l2d_decc_out_c6_lo1_2_scanin[10]=ff_l2d_decc_out_c6_hi0_4_scanout[10];
assign ff_l2d_decc_out_c6_lo1_4_scanin[10]=ff_l2d_decc_out_c6_lo1_2_scanout[10];
assign ff_l2d_decc_out_c6_hi1_2_scanin[10]=ff_l2d_decc_out_c6_lo1_4_scanout[10];
assign ff_l2d_decc_out_c6_hi1_4_scanin[10]=ff_l2d_decc_out_c6_hi1_2_scanout[10];
assign ff_l2d_decc_out_c6_lo0_2_scanin[11]=ff_l2d_decc_out_c6_hi1_4_scanout[10];
assign ff_l2d_decc_out_c6_lo0_4_scanin[11]=ff_l2d_decc_out_c6_lo0_2_scanout[11];
assign ff_l2d_decc_out_c6_hi0_2_scanin[11]=ff_l2d_decc_out_c6_lo0_4_scanout[11];
assign ff_l2d_decc_out_c6_hi0_4_scanin[11]=ff_l2d_decc_out_c6_hi0_2_scanout[11];
assign ff_l2d_decc_out_c6_lo1_2_scanin[11]=ff_l2d_decc_out_c6_hi0_4_scanout[11];
assign ff_l2d_decc_out_c6_lo1_4_scanin[11]=ff_l2d_decc_out_c6_lo1_2_scanout[11];
assign ff_l2d_decc_out_c6_hi1_2_scanin[11]=ff_l2d_decc_out_c6_lo1_4_scanout[11];
assign ff_l2d_decc_out_c6_hi1_4_scanin[11]=ff_l2d_decc_out_c6_hi1_2_scanout[11];
assign ff_l2d_decc_out_c6_lo0_2_scanin[12]=ff_l2d_decc_out_c6_hi1_4_scanout[11];
assign ff_l2d_decc_out_c6_lo0_4_scanin[12]=ff_l2d_decc_out_c6_lo0_2_scanout[12];
assign ff_l2d_decc_out_c6_hi0_2_scanin[12]=ff_l2d_decc_out_c6_lo0_4_scanout[12];
assign ff_l2d_decc_out_c6_hi0_4_scanin[12]=ff_l2d_decc_out_c6_hi0_2_scanout[12];
assign ff_l2d_decc_out_c6_lo1_2_scanin[12]=ff_l2d_decc_out_c6_hi0_4_scanout[12];
assign ff_l2d_decc_out_c6_lo1_4_scanin[12]=ff_l2d_decc_out_c6_lo1_2_scanout[12];
assign ff_l2d_decc_out_c6_hi1_2_scanin[12]=ff_l2d_decc_out_c6_lo1_4_scanout[12];
assign ff_l2d_decc_out_c6_hi1_4_scanin[12]=ff_l2d_decc_out_c6_hi1_2_scanout[12];
assign ff_l2d_decc_out_c6_lo0_2_scanin[13]=ff_l2d_decc_out_c6_hi1_4_scanout[12];
assign ff_l2d_decc_out_c6_lo0_4_scanin[13]=ff_l2d_decc_out_c6_lo0_2_scanout[13];
assign ff_l2d_decc_out_c6_hi0_2_scanin[13]=ff_l2d_decc_out_c6_lo0_4_scanout[13];
assign ff_l2d_decc_out_c6_hi0_4_scanin[13]=ff_l2d_decc_out_c6_hi0_2_scanout[13];
assign ff_l2d_decc_out_c6_lo1_2_scanin[13]=ff_l2d_decc_out_c6_hi0_4_scanout[13];
assign ff_l2d_decc_out_c6_lo1_4_scanin[13]=ff_l2d_decc_out_c6_lo1_2_scanout[13];
assign ff_l2d_decc_out_c6_hi1_2_scanin[13]=ff_l2d_decc_out_c6_lo1_4_scanout[13];
assign ff_l2d_decc_out_c6_hi1_4_scanin[13]=ff_l2d_decc_out_c6_hi1_2_scanout[13];
assign ff_l2d_decc_out_c6_lo0_2_scanin[14]=ff_l2d_decc_out_c6_hi1_4_scanout[13];
assign ff_l2d_decc_out_c6_lo0_4_scanin[14]=ff_l2d_decc_out_c6_lo0_2_scanout[14];
assign ff_l2d_decc_out_c6_hi0_2_scanin[14]=ff_l2d_decc_out_c6_lo0_4_scanout[14];
assign ff_l2d_decc_out_c6_hi0_4_scanin[14]=ff_l2d_decc_out_c6_hi0_2_scanout[14];
assign ff_l2d_decc_out_c6_lo1_2_scanin[14]=ff_l2d_decc_out_c6_hi0_4_scanout[14];
assign ff_l2d_decc_out_c6_lo1_4_scanin[14]=ff_l2d_decc_out_c6_lo1_2_scanout[14];
assign ff_l2d_decc_out_c6_hi1_2_scanin[14]=ff_l2d_decc_out_c6_lo1_4_scanout[14];
assign ff_l2d_decc_out_c6_hi1_4_scanin[14]=ff_l2d_decc_out_c6_hi1_2_scanout[14];
assign ff_l2d_decc_out_c6_lo0_2_scanin[15]=ff_l2d_decc_out_c6_hi1_4_scanout[14];
assign ff_l2d_decc_out_c6_lo0_4_scanin[15]=ff_l2d_decc_out_c6_lo0_2_scanout[15];
assign ff_l2d_decc_out_c6_hi0_2_scanin[15]=ff_l2d_decc_out_c6_lo0_4_scanout[15];
assign ff_l2d_decc_out_c6_hi0_4_scanin[15]=ff_l2d_decc_out_c6_hi0_2_scanout[15];
assign ff_l2d_decc_out_c6_lo1_2_scanin[15]=ff_l2d_decc_out_c6_hi0_4_scanout[15];
assign ff_l2d_decc_out_c6_lo1_4_scanin[15]=ff_l2d_decc_out_c6_lo1_2_scanout[15];
assign ff_l2d_decc_out_c6_hi1_2_scanin[15]=ff_l2d_decc_out_c6_lo1_4_scanout[15];
assign ff_l2d_decc_out_c6_hi1_4_scanin[15]=ff_l2d_decc_out_c6_hi1_2_scanout[15];
assign ff_l2d_decc_out_c6_lo0_2_scanin[16]=ff_l2d_decc_out_c6_hi1_4_scanout[15];
assign ff_l2d_decc_out_c6_lo0_4_scanin[16]=ff_l2d_decc_out_c6_lo0_2_scanout[16];
assign ff_l2d_decc_out_c6_hi0_2_scanin[16]=ff_l2d_decc_out_c6_lo0_4_scanout[16];
assign ff_l2d_decc_out_c6_hi0_4_scanin[16]=ff_l2d_decc_out_c6_hi0_2_scanout[16];
assign ff_l2d_decc_out_c6_lo1_2_scanin[16]=ff_l2d_decc_out_c6_hi0_4_scanout[16];
assign ff_l2d_decc_out_c6_lo1_4_scanin[16]=ff_l2d_decc_out_c6_lo1_2_scanout[16];
assign ff_l2d_decc_out_c6_hi1_2_scanin[16]=ff_l2d_decc_out_c6_lo1_4_scanout[16];
assign ff_l2d_decc_out_c6_hi1_4_scanin[16]=ff_l2d_decc_out_c6_hi1_2_scanout[16];
assign ff_l2d_decc_out_c6_lo0_2_scanin[17]=ff_l2d_decc_out_c6_hi1_4_scanout[16];
assign ff_l2d_decc_out_c6_lo0_4_scanin[17]=ff_l2d_decc_out_c6_lo0_2_scanout[17];
assign ff_l2d_decc_out_c6_hi0_2_scanin[17]=ff_l2d_decc_out_c6_lo0_4_scanout[17];
assign ff_l2d_decc_out_c6_hi0_4_scanin[17]=ff_l2d_decc_out_c6_hi0_2_scanout[17];
assign ff_l2d_decc_out_c6_lo1_2_scanin[17]=ff_l2d_decc_out_c6_hi0_4_scanout[17];
assign ff_l2d_decc_out_c6_lo1_4_scanin[17]=ff_l2d_decc_out_c6_lo1_2_scanout[17];
assign ff_l2d_decc_out_c6_hi1_2_scanin[17]=ff_l2d_decc_out_c6_lo1_4_scanout[17];
assign ff_l2d_decc_out_c6_hi1_4_scanin[17]=ff_l2d_decc_out_c6_hi1_2_scanout[17];
assign ff_l2d_decc_out_c6_lo0_2_scanin[18]=ff_l2d_decc_out_c6_hi1_4_scanout[17];
assign ff_l2d_decc_out_c6_lo0_4_scanin[18]=ff_l2d_decc_out_c6_lo0_2_scanout[18];
assign ff_l2d_decc_out_c6_hi0_2_scanin[18]=ff_l2d_decc_out_c6_lo0_4_scanout[18];
assign ff_l2d_decc_out_c6_hi0_4_scanin[18]=ff_l2d_decc_out_c6_hi0_2_scanout[18];
assign ff_l2d_decc_out_c6_lo1_2_scanin[18]=ff_l2d_decc_out_c6_hi0_4_scanout[18];
assign ff_l2d_decc_out_c6_lo1_4_scanin[18]=ff_l2d_decc_out_c6_lo1_2_scanout[18];
assign ff_l2d_decc_out_c6_hi1_2_scanin[18]=ff_l2d_decc_out_c6_lo1_4_scanout[18];
assign ff_l2d_decc_out_c6_hi1_4_scanin[18]=ff_l2d_decc_out_c6_hi1_2_scanout[18];
assign ff_l2d_decc_out_c6_lo0_2_scanin[19]=ff_l2d_decc_out_c6_hi1_4_scanout[18];
assign ff_l2d_decc_out_c6_lo0_4_scanin[19]=ff_l2d_decc_out_c6_lo0_2_scanout[19];
assign ff_l2d_decc_out_c6_hi0_2_scanin[19]=ff_l2d_decc_out_c6_lo0_4_scanout[19];
assign ff_l2d_decc_out_c6_hi0_4_scanin[19]=ff_l2d_decc_out_c6_hi0_2_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[19]=ff_l2d_decc_out_c6_hi0_4_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[19]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[20]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[20]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[20]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[20]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[21]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[21]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[21]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[21]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[22]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[22]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[22]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[22]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[23]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[23]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[23]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[23]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[24]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[29]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[24];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[28]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[28]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[28]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[28]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[27]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[27]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[27]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[27]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[26]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[26]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[26]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[26]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[25]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[25]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[25]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[25]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[24]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[24]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[24];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[24]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[24];
assign ff_cache_col_offset_c5_123_scanin[0]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[24];
assign ff_cache_col_offset_c5_123_scanin[2]=ff_cache_col_offset_c5_123_scanout[0];
assign ff_cache_col_offset_c4_123_scanin[0]=ff_cache_col_offset_c5_123_scanout[2];
assign ff_cache_col_offset_c4_123_scanin[2]=ff_cache_col_offset_c4_123_scanout[0];
assign ff_cache_col_offset_c4_tog_123_scanin[0]=ff_cache_col_offset_c4_123_scanout[2];
assign ff_cache_cache_rd_wr_c5_21_scanin=ff_cache_col_offset_c4_tog_123_scanout[0];
assign ff_cache_col_offset_c5_123_scanin[1]=ff_cache_cache_rd_wr_c5_21_scanout;
assign ff_cache_col_offset_c5_123_scanin[3]=ff_cache_col_offset_c5_123_scanout[1];
assign ff_cache_col_offset_c4_123_scanin[1]=ff_cache_col_offset_c5_123_scanout[3];
assign ff_cache_col_offset_c4_123_scanin[3]=ff_cache_col_offset_c4_123_scanout[1];
assign ff_cache_col_offset_c4_tog_123_scanin[1]=ff_cache_col_offset_c4_123_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[38]=ff_cache_col_offset_c4_tog_123_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[38]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[38]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[38]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[37]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[37]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[37]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[37]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[36]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[36]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[36]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[36]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[35]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[35]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[35]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[35]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[34]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[34]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[34]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[29]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[29]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[29]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[30]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[30]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[30]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[30]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[31]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[31]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[31]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[31]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[32]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[32]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[32]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[32]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[33]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_hi0_4_scanin[33]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo1_4_scanin[33]=ff_l2b_l2d_fbdecc_c52_hi0_4_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_hi1_4_scanin[33]=ff_l2b_l2d_fbdecc_c52_lo1_4_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo0_4_scanin[34]=ff_l2b_l2d_fbdecc_c52_hi1_4_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[38]=ff_l2b_l2d_fbdecc_c52_lo0_4_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[38]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[38]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[38]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[37]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[37]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[37]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[37]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[36]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[36]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[36]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[36]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[35]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[35]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[35]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[35]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[34]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[34]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[34]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[29]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[29]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[29]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[30]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[30]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[30]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[30]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[31]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[31]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[31]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[31]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[32]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[32]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[32]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[32]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[33]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[33]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[33]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[33]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[34]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[19]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[19]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[20]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[20]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[20]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[20]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[21]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[21]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[21]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[21]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[22]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[22]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[22]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[22]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[23]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[23]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[23]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[23]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[24]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[29]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[24];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[28]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[28]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[28]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[28]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[27]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[27]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[27]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[27]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[26]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[26]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[26]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[26]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[25]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[25]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[25]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_lo0_2_scanin[25]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_hi1_2_scanin[24]=ff_l2b_l2d_fbdecc_c52_lo0_2_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_lo1_2_scanin[24]=ff_l2b_l2d_fbdecc_c52_hi1_2_scanout[24];
assign ff_l2b_l2d_fbdecc_c52_hi0_2_scanin[24]=ff_l2b_l2d_fbdecc_c52_lo1_2_scanout[24];
assign ff_l2d_decc_out_c6_lo1_2_scanin[19]=ff_l2b_l2d_fbdecc_c52_hi0_2_scanout[24];
assign ff_l2d_decc_out_c6_lo1_4_scanin[19]=ff_l2d_decc_out_c6_lo1_2_scanout[19];
assign ff_l2d_decc_out_c6_hi1_2_scanin[19]=ff_l2d_decc_out_c6_lo1_4_scanout[19];
assign ff_l2d_decc_out_c6_hi1_4_scanin[19]=ff_l2d_decc_out_c6_hi1_2_scanout[19];
assign ff_l2d_decc_out_c6_lo0_2_scanin[20]=ff_l2d_decc_out_c6_hi1_4_scanout[19];
assign ff_l2d_decc_out_c6_lo0_4_scanin[20]=ff_l2d_decc_out_c6_lo0_2_scanout[20];
assign ff_l2d_decc_out_c6_hi0_2_scanin[20]=ff_l2d_decc_out_c6_lo0_4_scanout[20];
assign ff_l2d_decc_out_c6_hi0_4_scanin[20]=ff_l2d_decc_out_c6_hi0_2_scanout[20];
assign ff_l2d_decc_out_c6_lo1_2_scanin[20]=ff_l2d_decc_out_c6_hi0_4_scanout[20];
assign ff_l2d_decc_out_c6_lo1_4_scanin[20]=ff_l2d_decc_out_c6_lo1_2_scanout[20];
assign ff_l2d_decc_out_c6_hi1_2_scanin[20]=ff_l2d_decc_out_c6_lo1_4_scanout[20];
assign ff_l2d_decc_out_c6_hi1_4_scanin[20]=ff_l2d_decc_out_c6_hi1_2_scanout[20];
assign ff_l2d_decc_out_c6_lo0_2_scanin[21]=ff_l2d_decc_out_c6_hi1_4_scanout[20];
assign ff_l2d_decc_out_c6_lo0_4_scanin[21]=ff_l2d_decc_out_c6_lo0_2_scanout[21];
assign ff_l2d_decc_out_c6_hi0_2_scanin[21]=ff_l2d_decc_out_c6_lo0_4_scanout[21];
assign ff_l2d_decc_out_c6_hi0_4_scanin[21]=ff_l2d_decc_out_c6_hi0_2_scanout[21];
assign ff_l2d_decc_out_c6_lo1_2_scanin[21]=ff_l2d_decc_out_c6_hi0_4_scanout[21];
assign ff_l2d_decc_out_c6_lo1_4_scanin[21]=ff_l2d_decc_out_c6_lo1_2_scanout[21];
assign ff_l2d_decc_out_c6_hi1_2_scanin[21]=ff_l2d_decc_out_c6_lo1_4_scanout[21];
assign ff_l2d_decc_out_c6_hi1_4_scanin[21]=ff_l2d_decc_out_c6_hi1_2_scanout[21];
assign ff_l2d_decc_out_c6_lo0_2_scanin[22]=ff_l2d_decc_out_c6_hi1_4_scanout[21];
assign ff_l2d_decc_out_c6_lo0_4_scanin[22]=ff_l2d_decc_out_c6_lo0_2_scanout[22];
assign ff_l2d_decc_out_c6_hi0_2_scanin[22]=ff_l2d_decc_out_c6_lo0_4_scanout[22];
assign ff_l2d_decc_out_c6_hi0_4_scanin[22]=ff_l2d_decc_out_c6_hi0_2_scanout[22];
assign ff_l2d_decc_out_c6_lo1_2_scanin[22]=ff_l2d_decc_out_c6_hi0_4_scanout[22];
assign ff_l2d_decc_out_c6_lo1_4_scanin[22]=ff_l2d_decc_out_c6_lo1_2_scanout[22];
assign ff_l2d_decc_out_c6_hi1_2_scanin[22]=ff_l2d_decc_out_c6_lo1_4_scanout[22];
assign ff_l2d_decc_out_c6_hi1_4_scanin[22]=ff_l2d_decc_out_c6_hi1_2_scanout[22];
assign ff_l2d_decc_out_c6_lo0_2_scanin[23]=ff_l2d_decc_out_c6_hi1_4_scanout[22];
assign ff_l2d_decc_out_c6_lo0_4_scanin[23]=ff_l2d_decc_out_c6_lo0_2_scanout[23];
assign ff_l2d_decc_out_c6_hi0_2_scanin[23]=ff_l2d_decc_out_c6_lo0_4_scanout[23];
assign ff_l2d_decc_out_c6_hi0_4_scanin[23]=ff_l2d_decc_out_c6_hi0_2_scanout[23];
assign ff_l2d_decc_out_c6_lo1_2_scanin[23]=ff_l2d_decc_out_c6_hi0_4_scanout[23];
assign ff_l2d_decc_out_c6_lo1_4_scanin[23]=ff_l2d_decc_out_c6_lo1_2_scanout[23];
assign ff_l2d_decc_out_c6_hi1_2_scanin[23]=ff_l2d_decc_out_c6_lo1_4_scanout[23];
assign ff_l2d_decc_out_c6_hi1_4_scanin[23]=ff_l2d_decc_out_c6_hi1_2_scanout[23];
assign ff_l2d_decc_out_c6_lo0_2_scanin[24]=ff_l2d_decc_out_c6_hi1_4_scanout[23];
assign ff_l2d_decc_out_c6_lo0_4_scanin[24]=ff_l2d_decc_out_c6_lo0_2_scanout[24];
assign ff_l2d_decc_out_c6_hi0_2_scanin[24]=ff_l2d_decc_out_c6_lo0_4_scanout[24];
assign ff_l2d_decc_out_c6_hi0_4_scanin[24]=ff_l2d_decc_out_c6_hi0_2_scanout[24];
assign ff_l2d_decc_out_c6_lo1_2_scanin[24]=ff_l2d_decc_out_c6_hi0_4_scanout[24];
assign ff_l2d_decc_out_c6_lo1_4_scanin[24]=ff_l2d_decc_out_c6_lo1_2_scanout[24];
assign ff_l2d_decc_out_c6_hi1_2_scanin[24]=ff_l2d_decc_out_c6_lo1_4_scanout[24];
assign ff_l2d_decc_out_c6_hi1_4_scanin[24]=ff_l2d_decc_out_c6_hi1_2_scanout[24];
assign ff_l2d_decc_out_c6_lo0_2_scanin[25]=ff_l2d_decc_out_c6_hi1_4_scanout[24];
assign ff_l2d_decc_out_c6_lo0_4_scanin[25]=ff_l2d_decc_out_c6_lo0_2_scanout[25];
assign ff_l2d_decc_out_c6_hi0_2_scanin[25]=ff_l2d_decc_out_c6_lo0_4_scanout[25];
assign ff_l2d_decc_out_c6_hi0_4_scanin[25]=ff_l2d_decc_out_c6_hi0_2_scanout[25];
assign ff_l2d_decc_out_c6_lo1_2_scanin[25]=ff_l2d_decc_out_c6_hi0_4_scanout[25];
assign ff_l2d_decc_out_c6_lo1_4_scanin[25]=ff_l2d_decc_out_c6_lo1_2_scanout[25];
assign ff_l2d_decc_out_c6_hi1_2_scanin[25]=ff_l2d_decc_out_c6_lo1_4_scanout[25];
assign ff_l2d_decc_out_c6_hi1_4_scanin[25]=ff_l2d_decc_out_c6_hi1_2_scanout[25];
assign ff_l2d_decc_out_c6_lo0_2_scanin[26]=ff_l2d_decc_out_c6_hi1_4_scanout[25];
assign ff_l2d_decc_out_c6_lo0_4_scanin[26]=ff_l2d_decc_out_c6_lo0_2_scanout[26];
assign ff_l2d_decc_out_c6_hi0_2_scanin[26]=ff_l2d_decc_out_c6_lo0_4_scanout[26];
assign ff_l2d_decc_out_c6_hi0_4_scanin[26]=ff_l2d_decc_out_c6_hi0_2_scanout[26];
assign ff_l2d_decc_out_c6_lo1_2_scanin[26]=ff_l2d_decc_out_c6_hi0_4_scanout[26];
assign ff_l2d_decc_out_c6_lo1_4_scanin[26]=ff_l2d_decc_out_c6_lo1_2_scanout[26];
assign ff_l2d_decc_out_c6_hi1_2_scanin[26]=ff_l2d_decc_out_c6_lo1_4_scanout[26];
assign ff_l2d_decc_out_c6_hi1_4_scanin[26]=ff_l2d_decc_out_c6_hi1_2_scanout[26];
assign ff_l2d_decc_out_c6_lo0_2_scanin[27]=ff_l2d_decc_out_c6_hi1_4_scanout[26];
assign ff_l2d_decc_out_c6_lo0_4_scanin[27]=ff_l2d_decc_out_c6_lo0_2_scanout[27];
assign ff_l2d_decc_out_c6_hi0_2_scanin[27]=ff_l2d_decc_out_c6_lo0_4_scanout[27];
assign ff_l2d_decc_out_c6_hi0_4_scanin[27]=ff_l2d_decc_out_c6_hi0_2_scanout[27];
assign ff_l2d_decc_out_c6_lo1_2_scanin[27]=ff_l2d_decc_out_c6_hi0_4_scanout[27];
assign ff_l2d_decc_out_c6_lo1_4_scanin[27]=ff_l2d_decc_out_c6_lo1_2_scanout[27];
assign ff_l2d_decc_out_c6_hi1_2_scanin[27]=ff_l2d_decc_out_c6_lo1_4_scanout[27];
assign ff_l2d_decc_out_c6_hi1_4_scanin[27]=ff_l2d_decc_out_c6_hi1_2_scanout[27];
assign ff_l2d_decc_out_c6_lo0_2_scanin[28]=ff_l2d_decc_out_c6_hi1_4_scanout[27];
assign ff_l2d_decc_out_c6_lo0_4_scanin[28]=ff_l2d_decc_out_c6_lo0_2_scanout[28];
assign ff_l2d_decc_out_c6_hi0_2_scanin[28]=ff_l2d_decc_out_c6_lo0_4_scanout[28];
assign ff_l2d_decc_out_c6_hi0_4_scanin[28]=ff_l2d_decc_out_c6_hi0_2_scanout[28];
assign ff_l2d_decc_out_c6_lo1_2_scanin[28]=ff_l2d_decc_out_c6_hi0_4_scanout[28];
assign ff_l2d_decc_out_c6_lo1_4_scanin[28]=ff_l2d_decc_out_c6_lo1_2_scanout[28];
assign ff_l2d_decc_out_c6_hi1_2_scanin[28]=ff_l2d_decc_out_c6_lo1_4_scanout[28];
assign ff_l2d_decc_out_c6_hi1_4_scanin[28]=ff_l2d_decc_out_c6_hi1_2_scanout[28];
assign ff_l2d_decc_out_c6_lo0_2_scanin[29]=ff_l2d_decc_out_c6_hi1_4_scanout[28];
assign ff_l2d_decc_out_c6_lo0_4_scanin[29]=ff_l2d_decc_out_c6_lo0_2_scanout[29];
assign ff_l2d_decc_out_c6_hi0_2_scanin[29]=ff_l2d_decc_out_c6_lo0_4_scanout[29];
assign ff_l2d_decc_out_c6_hi0_4_scanin[29]=ff_l2d_decc_out_c6_hi0_2_scanout[29];
assign ff_l2d_decc_out_c6_lo1_2_scanin[29]=ff_l2d_decc_out_c6_hi0_4_scanout[29];
assign ff_l2d_decc_out_c6_lo1_4_scanin[29]=ff_l2d_decc_out_c6_lo1_2_scanout[29];
assign ff_l2d_decc_out_c6_hi1_2_scanin[29]=ff_l2d_decc_out_c6_lo1_4_scanout[29];
assign ff_l2d_decc_out_c6_hi1_4_scanin[29]=ff_l2d_decc_out_c6_hi1_2_scanout[29];
assign ff_l2d_decc_out_c6_lo0_2_scanin[30]=ff_l2d_decc_out_c6_hi1_4_scanout[29];
assign ff_l2d_decc_out_c6_lo0_4_scanin[30]=ff_l2d_decc_out_c6_lo0_2_scanout[30];
assign ff_l2d_decc_out_c6_hi0_2_scanin[30]=ff_l2d_decc_out_c6_lo0_4_scanout[30];
assign ff_l2d_decc_out_c6_hi0_4_scanin[30]=ff_l2d_decc_out_c6_hi0_2_scanout[30];
assign ff_l2d_decc_out_c6_lo1_2_scanin[30]=ff_l2d_decc_out_c6_hi0_4_scanout[30];
assign ff_l2d_decc_out_c6_lo1_4_scanin[30]=ff_l2d_decc_out_c6_lo1_2_scanout[30];
assign ff_l2d_decc_out_c6_hi1_2_scanin[30]=ff_l2d_decc_out_c6_lo1_4_scanout[30];
assign ff_l2d_decc_out_c6_hi1_4_scanin[30]=ff_l2d_decc_out_c6_hi1_2_scanout[30];
assign ff_l2d_decc_out_c6_lo0_2_scanin[31]=ff_l2d_decc_out_c6_hi1_4_scanout[30];
assign ff_l2d_decc_out_c6_lo0_4_scanin[31]=ff_l2d_decc_out_c6_lo0_2_scanout[31];
assign ff_l2d_decc_out_c6_hi0_2_scanin[31]=ff_l2d_decc_out_c6_lo0_4_scanout[31];
assign ff_l2d_decc_out_c6_hi0_4_scanin[31]=ff_l2d_decc_out_c6_hi0_2_scanout[31];
assign ff_l2d_decc_out_c6_lo1_2_scanin[31]=ff_l2d_decc_out_c6_hi0_4_scanout[31];
assign ff_l2d_decc_out_c6_lo1_4_scanin[31]=ff_l2d_decc_out_c6_lo1_2_scanout[31];
assign ff_l2d_decc_out_c6_hi1_2_scanin[31]=ff_l2d_decc_out_c6_lo1_4_scanout[31];
assign ff_l2d_decc_out_c6_hi1_4_scanin[31]=ff_l2d_decc_out_c6_hi1_2_scanout[31];
assign ff_l2d_decc_out_c6_lo0_2_scanin[32]=ff_l2d_decc_out_c6_hi1_4_scanout[31];
assign ff_l2d_decc_out_c6_lo0_4_scanin[32]=ff_l2d_decc_out_c6_lo0_2_scanout[32];
assign ff_l2d_decc_out_c6_hi0_2_scanin[32]=ff_l2d_decc_out_c6_lo0_4_scanout[32];
assign ff_l2d_decc_out_c6_hi0_4_scanin[32]=ff_l2d_decc_out_c6_hi0_2_scanout[32];
assign ff_l2d_decc_out_c6_lo1_2_scanin[32]=ff_l2d_decc_out_c6_hi0_4_scanout[32];
assign ff_l2d_decc_out_c6_lo1_4_scanin[32]=ff_l2d_decc_out_c6_lo1_2_scanout[32];
assign ff_l2d_decc_out_c6_hi1_2_scanin[32]=ff_l2d_decc_out_c6_lo1_4_scanout[32];
assign ff_l2d_decc_out_c6_hi1_4_scanin[32]=ff_l2d_decc_out_c6_hi1_2_scanout[32];
assign ff_l2d_decc_out_c6_lo0_2_scanin[33]=ff_l2d_decc_out_c6_hi1_4_scanout[32];
assign ff_l2d_decc_out_c6_lo0_4_scanin[33]=ff_l2d_decc_out_c6_lo0_2_scanout[33];
assign ff_l2d_decc_out_c6_hi0_2_scanin[33]=ff_l2d_decc_out_c6_lo0_4_scanout[33];
assign ff_l2d_decc_out_c6_hi0_4_scanin[33]=ff_l2d_decc_out_c6_hi0_2_scanout[33];
assign ff_l2d_decc_out_c6_lo1_2_scanin[33]=ff_l2d_decc_out_c6_hi0_4_scanout[33];
assign ff_l2d_decc_out_c6_lo1_4_scanin[33]=ff_l2d_decc_out_c6_lo1_2_scanout[33];
assign ff_l2d_decc_out_c6_hi1_2_scanin[33]=ff_l2d_decc_out_c6_lo1_4_scanout[33];
assign ff_l2d_decc_out_c6_hi1_4_scanin[33]=ff_l2d_decc_out_c6_hi1_2_scanout[33];
assign ff_l2d_decc_out_c6_lo0_2_scanin[34]=ff_l2d_decc_out_c6_hi1_4_scanout[33];
assign ff_l2d_decc_out_c6_lo0_4_scanin[34]=ff_l2d_decc_out_c6_lo0_2_scanout[34];
assign ff_l2d_decc_out_c6_hi0_2_scanin[34]=ff_l2d_decc_out_c6_lo0_4_scanout[34];
assign ff_l2d_decc_out_c6_hi0_4_scanin[34]=ff_l2d_decc_out_c6_hi0_2_scanout[34];
assign ff_l2d_decc_out_c6_lo1_2_scanin[34]=ff_l2d_decc_out_c6_hi0_4_scanout[34];
assign ff_l2d_decc_out_c6_lo1_4_scanin[34]=ff_l2d_decc_out_c6_lo1_2_scanout[34];
assign ff_l2d_decc_out_c6_hi1_2_scanin[34]=ff_l2d_decc_out_c6_lo1_4_scanout[34];
assign ff_l2d_decc_out_c6_hi1_4_scanin[34]=ff_l2d_decc_out_c6_hi1_2_scanout[34];
assign ff_l2d_decc_out_c6_lo0_2_scanin[35]=ff_l2d_decc_out_c6_hi1_4_scanout[34];
assign ff_l2d_decc_out_c6_lo0_4_scanin[35]=ff_l2d_decc_out_c6_lo0_2_scanout[35];
assign ff_l2d_decc_out_c6_hi0_2_scanin[35]=ff_l2d_decc_out_c6_lo0_4_scanout[35];
assign ff_l2d_decc_out_c6_hi0_4_scanin[35]=ff_l2d_decc_out_c6_hi0_2_scanout[35];
assign ff_l2d_decc_out_c6_lo1_2_scanin[35]=ff_l2d_decc_out_c6_hi0_4_scanout[35];
assign ff_l2d_decc_out_c6_lo1_4_scanin[35]=ff_l2d_decc_out_c6_lo1_2_scanout[35];
assign ff_l2d_decc_out_c6_hi1_2_scanin[35]=ff_l2d_decc_out_c6_lo1_4_scanout[35];
assign ff_l2d_decc_out_c6_hi1_4_scanin[35]=ff_l2d_decc_out_c6_hi1_2_scanout[35];
assign ff_l2d_decc_out_c6_lo0_2_scanin[36]=ff_l2d_decc_out_c6_hi1_4_scanout[35];
assign ff_l2d_decc_out_c6_lo0_4_scanin[36]=ff_l2d_decc_out_c6_lo0_2_scanout[36];
assign ff_l2d_decc_out_c6_hi0_2_scanin[36]=ff_l2d_decc_out_c6_lo0_4_scanout[36];
assign ff_l2d_decc_out_c6_hi0_4_scanin[36]=ff_l2d_decc_out_c6_hi0_2_scanout[36];
assign ff_l2d_decc_out_c6_lo1_2_scanin[36]=ff_l2d_decc_out_c6_hi0_4_scanout[36];
assign ff_l2d_decc_out_c6_lo1_4_scanin[36]=ff_l2d_decc_out_c6_lo1_2_scanout[36];
assign ff_l2d_decc_out_c6_hi1_2_scanin[36]=ff_l2d_decc_out_c6_lo1_4_scanout[36];
assign ff_l2d_decc_out_c6_hi1_4_scanin[36]=ff_l2d_decc_out_c6_hi1_2_scanout[36];
assign ff_l2d_decc_out_c6_lo0_2_scanin[37]=ff_l2d_decc_out_c6_hi1_4_scanout[36];
assign ff_l2d_decc_out_c6_lo0_4_scanin[37]=ff_l2d_decc_out_c6_lo0_2_scanout[37];
assign ff_l2d_decc_out_c6_hi0_2_scanin[37]=ff_l2d_decc_out_c6_lo0_4_scanout[37];
assign ff_l2d_decc_out_c6_hi0_4_scanin[37]=ff_l2d_decc_out_c6_hi0_2_scanout[37];
assign ff_l2d_decc_out_c6_lo1_2_scanin[37]=ff_l2d_decc_out_c6_hi0_4_scanout[37];
assign ff_l2d_decc_out_c6_lo1_4_scanin[37]=ff_l2d_decc_out_c6_lo1_2_scanout[37];
assign ff_l2d_decc_out_c6_hi1_2_scanin[37]=ff_l2d_decc_out_c6_lo1_4_scanout[37];
assign ff_l2d_decc_out_c6_hi1_4_scanin[37]=ff_l2d_decc_out_c6_hi1_2_scanout[37];
assign ff_l2d_decc_out_c6_lo0_2_scanin[38]=ff_l2d_decc_out_c6_hi1_4_scanout[37];
assign ff_l2d_decc_out_c6_lo0_4_scanin[38]=ff_l2d_decc_out_c6_lo0_2_scanout[38];
assign ff_l2d_decc_out_c6_hi0_2_scanin[38]=ff_l2d_decc_out_c6_lo0_4_scanout[38];
assign ff_l2d_decc_out_c6_hi0_4_scanin[38]=ff_l2d_decc_out_c6_hi0_2_scanout[38];
assign ff_l2d_decc_out_c6_lo1_2_scanin[38]=ff_l2d_decc_out_c6_hi0_4_scanout[38];
assign ff_l2d_decc_out_c6_lo1_4_scanin[38]=ff_l2d_decc_out_c6_lo1_2_scanout[38];
assign ff_l2d_decc_out_c6_hi1_2_scanin[38]=ff_l2d_decc_out_c6_lo1_4_scanout[38];
assign ff_l2d_decc_out_c6_hi1_4_scanin[38]=ff_l2d_decc_out_c6_hi1_2_scanout[38];
assign  so_q23=ff_l2d_decc_out_c6_hi1_4_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[19]=so_tstmod;
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[19]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[20]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[20]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[20]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[20]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[21]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[21]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[21]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[21]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[22]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[22]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[22]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[22]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[23]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[23]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[23]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[23]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[24]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[29]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[24];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[28]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[28]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[28]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[28]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[27]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[27]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[27]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[27]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[26]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[26]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[26]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[26]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[25]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[25]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[25]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[25]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[24]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[24]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[24];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[24]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[24];
assign ff_cache_col_offset_c5_101_scanin[0]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[24];
assign ff_cache_col_offset_c5_101_scanin[2]=ff_cache_col_offset_c5_101_scanout[0];
assign ff_cache_col_offset_c4_101_scanin[0]=ff_cache_col_offset_c5_101_scanout[2];
assign ff_cache_col_offset_c4_101_scanin[2]=ff_cache_col_offset_c4_101_scanout[0];
assign ff_cache_col_offset_c4_tog_101_scanin[0]=ff_cache_col_offset_c4_101_scanout[2];
assign ff_cache_cache_rd_wr_c5_01_scanin=ff_cache_col_offset_c4_tog_101_scanout[0];
assign ff_cache_col_offset_c5_101_scanin[1]=ff_cache_cache_rd_wr_c5_01_scanout;
assign ff_cache_col_offset_c5_101_scanin[3]=ff_cache_col_offset_c5_101_scanout[1];
assign ff_cache_col_offset_c4_101_scanin[1]=ff_cache_col_offset_c5_101_scanout[3];
assign ff_cache_col_offset_c4_101_scanin[3]=ff_cache_col_offset_c4_101_scanout[1];
assign ff_cache_col_offset_c4_tog_101_scanin[1]=ff_cache_col_offset_c4_101_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[38]=ff_cache_col_offset_c4_tog_101_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[38]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[38]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[38]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[37]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[37]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[37]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[37]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[36]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[36]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[36]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[36]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[35]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[35]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[35]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[35]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[34]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[34]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[34]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[29]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[29]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[29]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[30]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[30]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[30]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[30]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[31]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[31]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[31]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[31]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[32]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[32]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[32]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[32]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[33]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[33]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[33]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[33]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[34]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[33];
assign ff_l2t_l2d_stdecc_c3_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[34];
assign ff_l2t_l2d_stdecc_c3_scanin[1]=ff_l2t_l2d_stdecc_c3_scanout[0];
assign ff_l2t_l2d_stdecc_c3_scanin[2]=ff_l2t_l2d_stdecc_c3_scanout[1];
assign ff_l2t_l2d_stdecc_c3_scanin[3]=ff_l2t_l2d_stdecc_c3_scanout[2];
assign ff_l2t_l2d_stdecc_c3_scanin[4]=ff_l2t_l2d_stdecc_c3_scanout[3];
assign ff_l2t_l2d_stdecc_c3_scanin[5]=ff_l2t_l2d_stdecc_c3_scanout[4];
assign ff_l2t_l2d_stdecc_c3_scanin[6]=ff_l2t_l2d_stdecc_c3_scanout[5];
assign ff_l2t_l2d_stdecc_c3_scanin[7]=ff_l2t_l2d_stdecc_c3_scanout[6];
assign ff_l2t_l2d_stdecc_c3_scanin[8]=ff_l2t_l2d_stdecc_c3_scanout[7];
assign ff_l2t_l2d_stdecc_c3_scanin[9]=ff_l2t_l2d_stdecc_c3_scanout[8];
assign ff_l2t_l2d_stdecc_c3_scanin[10]=ff_l2t_l2d_stdecc_c3_scanout[9];
assign ff_l2t_l2d_stdecc_c3_scanin[11]=ff_l2t_l2d_stdecc_c3_scanout[10];
assign ff_l2t_l2d_stdecc_c3_scanin[12]=ff_l2t_l2d_stdecc_c3_scanout[11];
assign ff_l2t_l2d_stdecc_c3_scanin[13]=ff_l2t_l2d_stdecc_c3_scanout[12];
assign ff_l2t_l2d_stdecc_c3_scanin[14]=ff_l2t_l2d_stdecc_c3_scanout[13];
assign ff_l2t_l2d_stdecc_c3_scanin[15]=ff_l2t_l2d_stdecc_c3_scanout[14];
assign ff_l2t_l2d_stdecc_c3_scanin[16]=ff_l2t_l2d_stdecc_c3_scanout[15];
assign ff_l2t_l2d_stdecc_c3_scanin[17]=ff_l2t_l2d_stdecc_c3_scanout[16];
assign ff_l2t_l2d_stdecc_c3_scanin[18]=ff_l2t_l2d_stdecc_c3_scanout[17];
assign ff_l2t_l2d_stdecc_c3_scanin[19]=ff_l2t_l2d_stdecc_c3_scanout[18];
assign ff_l2t_l2d_stdecc_c3_scanin[20]=ff_l2t_l2d_stdecc_c3_scanout[19];
assign ff_l2t_l2d_stdecc_c3_scanin[21]=ff_l2t_l2d_stdecc_c3_scanout[20];
assign ff_l2t_l2d_stdecc_c3_scanin[22]=ff_l2t_l2d_stdecc_c3_scanout[21];
assign ff_l2t_l2d_stdecc_c3_scanin[23]=ff_l2t_l2d_stdecc_c3_scanout[22];
assign ff_l2t_l2d_stdecc_c3_scanin[24]=ff_l2t_l2d_stdecc_c3_scanout[23];
assign ff_l2t_l2d_stdecc_c3_scanin[25]=ff_l2t_l2d_stdecc_c3_scanout[24];
assign ff_l2t_l2d_stdecc_c3_scanin[26]=ff_l2t_l2d_stdecc_c3_scanout[25];
assign ff_l2t_l2d_stdecc_c3_scanin[27]=ff_l2t_l2d_stdecc_c3_scanout[26];
assign ff_l2t_l2d_stdecc_c3_scanin[28]=ff_l2t_l2d_stdecc_c3_scanout[27];
assign ff_l2t_l2d_stdecc_c3_scanin[29]=ff_l2t_l2d_stdecc_c3_scanout[28];
assign ff_l2t_l2d_stdecc_c3_scanin[30]=ff_l2t_l2d_stdecc_c3_scanout[29];
assign ff_l2t_l2d_stdecc_c3_scanin[31]=ff_l2t_l2d_stdecc_c3_scanout[30];
assign ff_l2t_l2d_stdecc_c3_scanin[32]=ff_l2t_l2d_stdecc_c3_scanout[31];
assign ff_l2t_l2d_stdecc_c3_scanin[33]=ff_l2t_l2d_stdecc_c3_scanout[32];
assign ff_l2t_l2d_stdecc_c3_scanin[34]=ff_l2t_l2d_stdecc_c3_scanout[33];
assign ff_l2t_l2d_stdecc_c3_scanin[35]=ff_l2t_l2d_stdecc_c3_scanout[34];
assign ff_l2t_l2d_stdecc_c3_scanin[36]=ff_l2t_l2d_stdecc_c3_scanout[35];
assign ff_l2t_l2d_stdecc_c3_scanin[37]=ff_l2t_l2d_stdecc_c3_scanout[36];
assign ff_l2t_l2d_stdecc_c3_scanin[38]=ff_l2t_l2d_stdecc_c3_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[38]=ff_l2t_l2d_stdecc_c3_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[38]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[38]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[38]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[37]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[37]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[37]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[37]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[36]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[37];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[36]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[36]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[36]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[35]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[36];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[35]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[35]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[35]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[34]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[35];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[34]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[34]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[29]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[29]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[29]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[30]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[30]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[30]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[30]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[31]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[30];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[31]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[31]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[31]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[32]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[31];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[32]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[32]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[32]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[33]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[32];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[33]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[33]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[33]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[34]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[33];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[19]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[34];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[19]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[20]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[20]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[20]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[20]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[21]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[20];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[21]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[21]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[21]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[22]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[21];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[22]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[22]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[22]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[23]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[22];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[23]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[23]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[23]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[24]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[23];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[29]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[24];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[28]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[29];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[28]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[28]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[28]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[27]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[28];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[27]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[27]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[27]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[26]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[27];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[26]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[26]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[26]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[25]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[26];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[25]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[25]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[25]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[24]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[25];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[24]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[24];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[24]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[24];
assign ff_l2d_decc_out_c6_lo1_1_scanin[19]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[24];
assign ff_l2d_decc_out_c6_lo1_3_scanin[19]=ff_l2d_decc_out_c6_lo1_1_scanout[19];
assign ff_l2d_decc_out_c6_hi1_1_scanin[19]=ff_l2d_decc_out_c6_lo1_3_scanout[19];
assign ff_l2d_decc_out_c6_hi1_3_scanin[19]=ff_l2d_decc_out_c6_hi1_1_scanout[19];
assign ff_l2d_decc_out_c6_lo0_1_scanin[20]=ff_l2d_decc_out_c6_hi1_3_scanout[19];
assign ff_l2d_decc_out_c6_lo0_3_scanin[20]=ff_l2d_decc_out_c6_lo0_1_scanout[20];
assign ff_l2d_decc_out_c6_hi0_1_scanin[20]=ff_l2d_decc_out_c6_lo0_3_scanout[20];
assign ff_l2d_decc_out_c6_hi0_3_scanin[20]=ff_l2d_decc_out_c6_hi0_1_scanout[20];
assign ff_l2d_decc_out_c6_lo1_1_scanin[20]=ff_l2d_decc_out_c6_hi0_3_scanout[20];
assign ff_l2d_decc_out_c6_lo1_3_scanin[20]=ff_l2d_decc_out_c6_lo1_1_scanout[20];
assign ff_l2d_decc_out_c6_hi1_1_scanin[20]=ff_l2d_decc_out_c6_lo1_3_scanout[20];
assign ff_l2d_decc_out_c6_hi1_3_scanin[20]=ff_l2d_decc_out_c6_hi1_1_scanout[20];
assign ff_l2d_decc_out_c6_lo0_1_scanin[21]=ff_l2d_decc_out_c6_hi1_3_scanout[20];
assign ff_l2d_decc_out_c6_lo0_3_scanin[21]=ff_l2d_decc_out_c6_lo0_1_scanout[21];
assign ff_l2d_decc_out_c6_hi0_1_scanin[21]=ff_l2d_decc_out_c6_lo0_3_scanout[21];
assign ff_l2d_decc_out_c6_hi0_3_scanin[21]=ff_l2d_decc_out_c6_hi0_1_scanout[21];
assign ff_l2d_decc_out_c6_lo1_1_scanin[21]=ff_l2d_decc_out_c6_hi0_3_scanout[21];
assign ff_l2d_decc_out_c6_lo1_3_scanin[21]=ff_l2d_decc_out_c6_lo1_1_scanout[21];
assign ff_l2d_decc_out_c6_hi1_1_scanin[21]=ff_l2d_decc_out_c6_lo1_3_scanout[21];
assign ff_l2d_decc_out_c6_hi1_3_scanin[21]=ff_l2d_decc_out_c6_hi1_1_scanout[21];
assign ff_l2d_decc_out_c6_lo0_1_scanin[22]=ff_l2d_decc_out_c6_hi1_3_scanout[21];
assign ff_l2d_decc_out_c6_lo0_3_scanin[22]=ff_l2d_decc_out_c6_lo0_1_scanout[22];
assign ff_l2d_decc_out_c6_hi0_1_scanin[22]=ff_l2d_decc_out_c6_lo0_3_scanout[22];
assign ff_l2d_decc_out_c6_hi0_3_scanin[22]=ff_l2d_decc_out_c6_hi0_1_scanout[22];
assign ff_l2d_decc_out_c6_lo1_1_scanin[22]=ff_l2d_decc_out_c6_hi0_3_scanout[22];
assign ff_l2d_decc_out_c6_lo1_3_scanin[22]=ff_l2d_decc_out_c6_lo1_1_scanout[22];
assign ff_l2d_decc_out_c6_hi1_1_scanin[22]=ff_l2d_decc_out_c6_lo1_3_scanout[22];
assign ff_l2d_decc_out_c6_hi1_3_scanin[22]=ff_l2d_decc_out_c6_hi1_1_scanout[22];
assign ff_l2d_decc_out_c6_lo0_1_scanin[23]=ff_l2d_decc_out_c6_hi1_3_scanout[22];
assign ff_l2d_decc_out_c6_lo0_3_scanin[23]=ff_l2d_decc_out_c6_lo0_1_scanout[23];
assign ff_l2d_decc_out_c6_hi0_1_scanin[23]=ff_l2d_decc_out_c6_lo0_3_scanout[23];
assign ff_l2d_decc_out_c6_hi0_3_scanin[23]=ff_l2d_decc_out_c6_hi0_1_scanout[23];
assign ff_l2d_decc_out_c6_lo1_1_scanin[23]=ff_l2d_decc_out_c6_hi0_3_scanout[23];
assign ff_l2d_decc_out_c6_lo1_3_scanin[23]=ff_l2d_decc_out_c6_lo1_1_scanout[23];
assign ff_l2d_decc_out_c6_hi1_1_scanin[23]=ff_l2d_decc_out_c6_lo1_3_scanout[23];
assign ff_l2d_decc_out_c6_hi1_3_scanin[23]=ff_l2d_decc_out_c6_hi1_1_scanout[23];
assign ff_l2d_decc_out_c6_lo0_1_scanin[24]=ff_l2d_decc_out_c6_hi1_3_scanout[23];
assign ff_l2d_decc_out_c6_lo0_3_scanin[24]=ff_l2d_decc_out_c6_lo0_1_scanout[24];
assign ff_l2d_decc_out_c6_hi0_1_scanin[24]=ff_l2d_decc_out_c6_lo0_3_scanout[24];
assign ff_l2d_decc_out_c6_hi0_3_scanin[24]=ff_l2d_decc_out_c6_hi0_1_scanout[24];
assign ff_l2d_decc_out_c6_lo1_1_scanin[24]=ff_l2d_decc_out_c6_hi0_3_scanout[24];
assign ff_l2d_decc_out_c6_lo1_3_scanin[24]=ff_l2d_decc_out_c6_lo1_1_scanout[24];
assign ff_l2d_decc_out_c6_hi1_1_scanin[24]=ff_l2d_decc_out_c6_lo1_3_scanout[24];
assign ff_l2d_decc_out_c6_hi1_3_scanin[24]=ff_l2d_decc_out_c6_hi1_1_scanout[24];
assign ff_l2d_decc_out_c6_lo0_1_scanin[25]=ff_l2d_decc_out_c6_hi1_3_scanout[24];
assign ff_l2d_decc_out_c6_lo0_3_scanin[25]=ff_l2d_decc_out_c6_lo0_1_scanout[25];
assign ff_l2d_decc_out_c6_hi0_1_scanin[25]=ff_l2d_decc_out_c6_lo0_3_scanout[25];
assign ff_l2d_decc_out_c6_hi0_3_scanin[25]=ff_l2d_decc_out_c6_hi0_1_scanout[25];
assign ff_l2d_decc_out_c6_lo1_1_scanin[25]=ff_l2d_decc_out_c6_hi0_3_scanout[25];
assign ff_l2d_decc_out_c6_lo1_3_scanin[25]=ff_l2d_decc_out_c6_lo1_1_scanout[25];
assign ff_l2d_decc_out_c6_hi1_1_scanin[25]=ff_l2d_decc_out_c6_lo1_3_scanout[25];
assign ff_l2d_decc_out_c6_hi1_3_scanin[25]=ff_l2d_decc_out_c6_hi1_1_scanout[25];
assign ff_l2d_decc_out_c6_lo0_1_scanin[26]=ff_l2d_decc_out_c6_hi1_3_scanout[25];
assign ff_l2d_decc_out_c6_lo0_3_scanin[26]=ff_l2d_decc_out_c6_lo0_1_scanout[26];
assign ff_l2d_decc_out_c6_hi0_1_scanin[26]=ff_l2d_decc_out_c6_lo0_3_scanout[26];
assign ff_l2d_decc_out_c6_hi0_3_scanin[26]=ff_l2d_decc_out_c6_hi0_1_scanout[26];
assign ff_l2d_decc_out_c6_lo1_1_scanin[26]=ff_l2d_decc_out_c6_hi0_3_scanout[26];
assign ff_l2d_decc_out_c6_lo1_3_scanin[26]=ff_l2d_decc_out_c6_lo1_1_scanout[26];
assign ff_l2d_decc_out_c6_hi1_1_scanin[26]=ff_l2d_decc_out_c6_lo1_3_scanout[26];
assign ff_l2d_decc_out_c6_hi1_3_scanin[26]=ff_l2d_decc_out_c6_hi1_1_scanout[26];
assign ff_l2d_decc_out_c6_lo0_1_scanin[27]=ff_l2d_decc_out_c6_hi1_3_scanout[26];
assign ff_l2d_decc_out_c6_lo0_3_scanin[27]=ff_l2d_decc_out_c6_lo0_1_scanout[27];
assign ff_l2d_decc_out_c6_hi0_1_scanin[27]=ff_l2d_decc_out_c6_lo0_3_scanout[27];
assign ff_l2d_decc_out_c6_hi0_3_scanin[27]=ff_l2d_decc_out_c6_hi0_1_scanout[27];
assign ff_l2d_decc_out_c6_lo1_1_scanin[27]=ff_l2d_decc_out_c6_hi0_3_scanout[27];
assign ff_l2d_decc_out_c6_lo1_3_scanin[27]=ff_l2d_decc_out_c6_lo1_1_scanout[27];
assign ff_l2d_decc_out_c6_hi1_1_scanin[27]=ff_l2d_decc_out_c6_lo1_3_scanout[27];
assign ff_l2d_decc_out_c6_hi1_3_scanin[27]=ff_l2d_decc_out_c6_hi1_1_scanout[27];
assign ff_l2d_decc_out_c6_lo0_1_scanin[28]=ff_l2d_decc_out_c6_hi1_3_scanout[27];
assign ff_l2d_decc_out_c6_lo0_3_scanin[28]=ff_l2d_decc_out_c6_lo0_1_scanout[28];
assign ff_l2d_decc_out_c6_hi0_1_scanin[28]=ff_l2d_decc_out_c6_lo0_3_scanout[28];
assign ff_l2d_decc_out_c6_hi0_3_scanin[28]=ff_l2d_decc_out_c6_hi0_1_scanout[28];
assign ff_l2d_decc_out_c6_lo1_1_scanin[28]=ff_l2d_decc_out_c6_hi0_3_scanout[28];
assign ff_l2d_decc_out_c6_lo1_3_scanin[28]=ff_l2d_decc_out_c6_lo1_1_scanout[28];
assign ff_l2d_decc_out_c6_hi1_1_scanin[28]=ff_l2d_decc_out_c6_lo1_3_scanout[28];
assign ff_l2d_decc_out_c6_hi1_3_scanin[28]=ff_l2d_decc_out_c6_hi1_1_scanout[28];
assign ff_l2d_decc_out_c6_lo0_1_scanin[29]=ff_l2d_decc_out_c6_hi1_3_scanout[28];
assign ff_l2d_decc_out_c6_lo0_3_scanin[29]=ff_l2d_decc_out_c6_lo0_1_scanout[29];
assign ff_l2d_decc_out_c6_hi0_1_scanin[29]=ff_l2d_decc_out_c6_lo0_3_scanout[29];
assign ff_l2d_decc_out_c6_hi0_3_scanin[29]=ff_l2d_decc_out_c6_hi0_1_scanout[29];
assign ff_l2d_decc_out_c6_lo1_1_scanin[29]=ff_l2d_decc_out_c6_hi0_3_scanout[29];
assign ff_l2d_decc_out_c6_lo1_3_scanin[29]=ff_l2d_decc_out_c6_lo1_1_scanout[29];
assign ff_l2d_decc_out_c6_hi1_1_scanin[29]=ff_l2d_decc_out_c6_lo1_3_scanout[29];
assign ff_l2d_decc_out_c6_hi1_3_scanin[29]=ff_l2d_decc_out_c6_hi1_1_scanout[29];
assign ff_l2d_decc_out_c6_lo0_1_scanin[30]=ff_l2d_decc_out_c6_hi1_3_scanout[29];
assign ff_l2d_decc_out_c6_lo0_3_scanin[30]=ff_l2d_decc_out_c6_lo0_1_scanout[30];
assign ff_l2d_decc_out_c6_hi0_1_scanin[30]=ff_l2d_decc_out_c6_lo0_3_scanout[30];
assign ff_l2d_decc_out_c6_hi0_3_scanin[30]=ff_l2d_decc_out_c6_hi0_1_scanout[30];
assign ff_l2d_decc_out_c6_lo1_1_scanin[30]=ff_l2d_decc_out_c6_hi0_3_scanout[30];
assign ff_l2d_decc_out_c6_lo1_3_scanin[30]=ff_l2d_decc_out_c6_lo1_1_scanout[30];
assign ff_l2d_decc_out_c6_hi1_1_scanin[30]=ff_l2d_decc_out_c6_lo1_3_scanout[30];
assign ff_l2d_decc_out_c6_hi1_3_scanin[30]=ff_l2d_decc_out_c6_hi1_1_scanout[30];
assign ff_l2d_decc_out_c6_lo0_1_scanin[31]=ff_l2d_decc_out_c6_hi1_3_scanout[30];
assign ff_l2d_decc_out_c6_lo0_3_scanin[31]=ff_l2d_decc_out_c6_lo0_1_scanout[31];
assign ff_l2d_decc_out_c6_hi0_1_scanin[31]=ff_l2d_decc_out_c6_lo0_3_scanout[31];
assign ff_l2d_decc_out_c6_hi0_3_scanin[31]=ff_l2d_decc_out_c6_hi0_1_scanout[31];
assign ff_l2d_decc_out_c6_lo1_1_scanin[31]=ff_l2d_decc_out_c6_hi0_3_scanout[31];
assign ff_l2d_decc_out_c6_lo1_3_scanin[31]=ff_l2d_decc_out_c6_lo1_1_scanout[31];
assign ff_l2d_decc_out_c6_hi1_1_scanin[31]=ff_l2d_decc_out_c6_lo1_3_scanout[31];
assign ff_l2d_decc_out_c6_hi1_3_scanin[31]=ff_l2d_decc_out_c6_hi1_1_scanout[31];
assign ff_l2d_decc_out_c6_lo0_1_scanin[32]=ff_l2d_decc_out_c6_hi1_3_scanout[31];
assign ff_l2d_decc_out_c6_lo0_3_scanin[32]=ff_l2d_decc_out_c6_lo0_1_scanout[32];
assign ff_l2d_decc_out_c6_hi0_1_scanin[32]=ff_l2d_decc_out_c6_lo0_3_scanout[32];
assign ff_l2d_decc_out_c6_hi0_3_scanin[32]=ff_l2d_decc_out_c6_hi0_1_scanout[32];
assign ff_l2d_decc_out_c6_lo1_1_scanin[32]=ff_l2d_decc_out_c6_hi0_3_scanout[32];
assign ff_l2d_decc_out_c6_lo1_3_scanin[32]=ff_l2d_decc_out_c6_lo1_1_scanout[32];
assign ff_l2d_decc_out_c6_hi1_1_scanin[32]=ff_l2d_decc_out_c6_lo1_3_scanout[32];
assign ff_l2d_decc_out_c6_hi1_3_scanin[32]=ff_l2d_decc_out_c6_hi1_1_scanout[32];
assign ff_l2d_decc_out_c6_lo0_1_scanin[33]=ff_l2d_decc_out_c6_hi1_3_scanout[32];
assign ff_l2d_decc_out_c6_lo0_3_scanin[33]=ff_l2d_decc_out_c6_lo0_1_scanout[33];
assign ff_l2d_decc_out_c6_hi0_1_scanin[33]=ff_l2d_decc_out_c6_lo0_3_scanout[33];
assign ff_l2d_decc_out_c6_hi0_3_scanin[33]=ff_l2d_decc_out_c6_hi0_1_scanout[33];
assign ff_l2d_decc_out_c6_lo1_1_scanin[33]=ff_l2d_decc_out_c6_hi0_3_scanout[33];
assign ff_l2d_decc_out_c6_lo1_3_scanin[33]=ff_l2d_decc_out_c6_lo1_1_scanout[33];
assign ff_l2d_decc_out_c6_hi1_1_scanin[33]=ff_l2d_decc_out_c6_lo1_3_scanout[33];
assign ff_l2d_decc_out_c6_hi1_3_scanin[33]=ff_l2d_decc_out_c6_hi1_1_scanout[33];
assign ff_l2d_decc_out_c6_lo0_1_scanin[34]=ff_l2d_decc_out_c6_hi1_3_scanout[33];
assign ff_l2d_decc_out_c6_lo0_3_scanin[34]=ff_l2d_decc_out_c6_lo0_1_scanout[34];
assign ff_l2d_decc_out_c6_hi0_1_scanin[34]=ff_l2d_decc_out_c6_lo0_3_scanout[34];
assign ff_l2d_decc_out_c6_hi0_3_scanin[34]=ff_l2d_decc_out_c6_hi0_1_scanout[34];
assign ff_l2d_decc_out_c6_lo1_1_scanin[34]=ff_l2d_decc_out_c6_hi0_3_scanout[34];
assign ff_l2d_decc_out_c6_lo1_3_scanin[34]=ff_l2d_decc_out_c6_lo1_1_scanout[34];
assign ff_l2d_decc_out_c6_hi1_1_scanin[34]=ff_l2d_decc_out_c6_lo1_3_scanout[34];
assign ff_l2d_decc_out_c6_hi1_3_scanin[34]=ff_l2d_decc_out_c6_hi1_1_scanout[34];
assign ff_l2d_decc_out_c6_lo0_1_scanin[35]=ff_l2d_decc_out_c6_hi1_3_scanout[34];
assign ff_l2d_decc_out_c6_lo0_3_scanin[35]=ff_l2d_decc_out_c6_lo0_1_scanout[35];
assign ff_l2d_decc_out_c6_hi0_1_scanin[35]=ff_l2d_decc_out_c6_lo0_3_scanout[35];
assign ff_l2d_decc_out_c6_hi0_3_scanin[35]=ff_l2d_decc_out_c6_hi0_1_scanout[35];
assign ff_l2d_decc_out_c6_lo1_1_scanin[35]=ff_l2d_decc_out_c6_hi0_3_scanout[35];
assign ff_l2d_decc_out_c6_lo1_3_scanin[35]=ff_l2d_decc_out_c6_lo1_1_scanout[35];
assign ff_l2d_decc_out_c6_hi1_1_scanin[35]=ff_l2d_decc_out_c6_lo1_3_scanout[35];
assign ff_l2d_decc_out_c6_hi1_3_scanin[35]=ff_l2d_decc_out_c6_hi1_1_scanout[35];
assign ff_l2d_decc_out_c6_lo0_1_scanin[36]=ff_l2d_decc_out_c6_hi1_3_scanout[35];
assign ff_l2d_decc_out_c6_lo0_3_scanin[36]=ff_l2d_decc_out_c6_lo0_1_scanout[36];
assign ff_l2d_decc_out_c6_hi0_1_scanin[36]=ff_l2d_decc_out_c6_lo0_3_scanout[36];
assign ff_l2d_decc_out_c6_hi0_3_scanin[36]=ff_l2d_decc_out_c6_hi0_1_scanout[36];
assign ff_l2d_decc_out_c6_lo1_1_scanin[36]=ff_l2d_decc_out_c6_hi0_3_scanout[36];
assign ff_l2d_decc_out_c6_lo1_3_scanin[36]=ff_l2d_decc_out_c6_lo1_1_scanout[36];
assign ff_l2d_decc_out_c6_hi1_1_scanin[36]=ff_l2d_decc_out_c6_lo1_3_scanout[36];
assign ff_l2d_decc_out_c6_hi1_3_scanin[36]=ff_l2d_decc_out_c6_hi1_1_scanout[36];
assign ff_l2d_decc_out_c6_lo0_1_scanin[37]=ff_l2d_decc_out_c6_hi1_3_scanout[36];
assign ff_l2d_decc_out_c6_lo0_3_scanin[37]=ff_l2d_decc_out_c6_lo0_1_scanout[37];
assign ff_l2d_decc_out_c6_hi0_1_scanin[37]=ff_l2d_decc_out_c6_lo0_3_scanout[37];
assign ff_l2d_decc_out_c6_hi0_3_scanin[37]=ff_l2d_decc_out_c6_hi0_1_scanout[37];
assign ff_l2d_decc_out_c6_lo1_1_scanin[37]=ff_l2d_decc_out_c6_hi0_3_scanout[37];
assign ff_l2d_decc_out_c6_lo1_3_scanin[37]=ff_l2d_decc_out_c6_lo1_1_scanout[37];
assign ff_l2d_decc_out_c6_hi1_1_scanin[37]=ff_l2d_decc_out_c6_lo1_3_scanout[37];
assign ff_l2d_decc_out_c6_hi1_3_scanin[37]=ff_l2d_decc_out_c6_hi1_1_scanout[37];
assign ff_l2d_decc_out_c6_lo0_1_scanin[38]=ff_l2d_decc_out_c6_hi1_3_scanout[37];
assign ff_l2d_decc_out_c6_lo0_3_scanin[38]=ff_l2d_decc_out_c6_lo0_1_scanout[38];
assign ff_l2d_decc_out_c6_hi0_1_scanin[38]=ff_l2d_decc_out_c6_lo0_3_scanout[38];
assign ff_l2d_decc_out_c6_hi0_3_scanin[38]=ff_l2d_decc_out_c6_hi0_1_scanout[38];
assign ff_l2d_decc_out_c6_lo1_1_scanin[38]=ff_l2d_decc_out_c6_hi0_3_scanout[38];
assign ff_l2d_decc_out_c6_lo1_3_scanin[38]=ff_l2d_decc_out_c6_lo1_1_scanout[38];
assign ff_l2d_decc_out_c6_hi1_1_scanin[38]=ff_l2d_decc_out_c6_lo1_3_scanout[38];
assign ff_l2d_decc_out_c6_hi1_3_scanin[38]=ff_l2d_decc_out_c6_hi1_1_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[0]=ff_l2d_decc_out_c6_hi1_3_scanout[38];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[0]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[1]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[1]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[1]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[1]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[2]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[2]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[2]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[2]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[3]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[3]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[3]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[3]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[4]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[4]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[4]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[9]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[9]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[9]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[8]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[8]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[8]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[8]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[7]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[7]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[7]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[7]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[6]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[6]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[6]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[6]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[5]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[5]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[5]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[5]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[4]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[5];
assign ff_cache_col_offset_c5_001_scanin[0]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[4];
assign ff_cache_col_offset_c5_001_scanin[2]=ff_cache_col_offset_c5_001_scanout[0];
assign ff_cache_col_offset_c4_001_scanin[0]=ff_cache_col_offset_c5_001_scanout[2];
assign ff_cache_col_offset_c4_001_scanin[2]=ff_cache_col_offset_c4_001_scanout[0];
assign ff_cache_col_offset_c4_tog_001_scanin[0]=ff_cache_col_offset_c4_001_scanout[2];
assign ff_cache_cache_rd_wr_c5_00_scanin=ff_cache_col_offset_c4_tog_001_scanout[0];
assign ff_cache_col_offset_c5_001_scanin[1]=ff_cache_cache_rd_wr_c5_00_scanout;
assign ff_cache_col_offset_c5_001_scanin[3]=ff_cache_col_offset_c5_001_scanout[1];
assign ff_cache_col_offset_c4_001_scanin[1]=ff_cache_col_offset_c5_001_scanout[3];
assign ff_cache_col_offset_c4_001_scanin[3]=ff_cache_col_offset_c4_001_scanout[1];
assign ff_cache_col_offset_c4_tog_001_scanin[1]=ff_cache_col_offset_c4_001_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[19]=ff_cache_col_offset_c4_tog_001_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[19]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[18]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[18]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[18]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[18]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[17]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[17]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[17]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[17]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[16]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[16]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[16]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[16]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[15]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[15]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[15]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[15]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[14]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[9]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[10]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[10]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[10]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[10]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[11]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[11]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[11]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[11]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[12]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[12]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[12]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[12]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[13]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[13]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[13]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_hi1_3_scanin[13]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_lo0_3_scanin[14]=ff_l2b_l2d_fbdecc_c52_hi1_3_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_hi0_3_scanin[14]=ff_l2b_l2d_fbdecc_c52_lo0_3_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo1_3_scanin[14]=ff_l2b_l2d_fbdecc_c52_hi0_3_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[19]=ff_l2b_l2d_fbdecc_c52_lo1_3_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[19]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[18]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[19];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[18]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[18]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[18]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[17]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[18];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[17]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[17]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[17]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[16]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[17];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[16]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[16]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[16]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[15]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[16];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[15]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[15]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[15]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[14]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[15];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[9]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[10]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[10]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[10]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[10]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[11]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[10];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[11]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[11]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[11]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[12]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[11];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[12]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[12]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[12]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[13]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[12];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[13]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[13]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[13]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[14]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[13];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[14]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[14]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[14];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[0]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[0]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[1]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[0];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[1]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[1]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[1]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[2]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[1];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[2]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[2]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[2]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[3]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[2];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[3]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[3]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[3]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[4]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[3];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[4]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[4]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[9]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[4];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[9]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[9]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[8]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[9];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[8]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[8]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[8]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[7]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[8];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[7]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[7]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[7]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[6]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[7];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[6]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[6]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[6]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[5]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[6];
assign ff_l2b_l2d_fbdecc_c52_lo1_1_scanin[5]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_hi0_1_scanin[5]=ff_l2b_l2d_fbdecc_c52_lo1_1_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_lo0_1_scanin[5]=ff_l2b_l2d_fbdecc_c52_hi0_1_scanout[5];
assign ff_l2b_l2d_fbdecc_c52_hi1_1_scanin[4]=ff_l2b_l2d_fbdecc_c52_lo0_1_scanout[5];
assign ff_l2d_decc_out_c6_lo0_1_scanin[0]=ff_l2b_l2d_fbdecc_c52_hi1_1_scanout[4];
assign ff_l2d_decc_out_c6_lo0_3_scanin[0]=ff_l2d_decc_out_c6_lo0_1_scanout[0];
assign ff_l2d_decc_out_c6_hi0_1_scanin[0]=ff_l2d_decc_out_c6_lo0_3_scanout[0];
assign ff_l2d_decc_out_c6_hi0_3_scanin[0]=ff_l2d_decc_out_c6_hi0_1_scanout[0];
assign ff_l2d_decc_out_c6_lo1_1_scanin[0]=ff_l2d_decc_out_c6_hi0_3_scanout[0];
assign ff_l2d_decc_out_c6_lo1_3_scanin[0]=ff_l2d_decc_out_c6_lo1_1_scanout[0];
assign ff_l2d_decc_out_c6_hi1_1_scanin[0]=ff_l2d_decc_out_c6_lo1_3_scanout[0];
assign ff_l2d_decc_out_c6_hi1_3_scanin[0]=ff_l2d_decc_out_c6_hi1_1_scanout[0];
assign ff_l2d_decc_out_c6_lo0_1_scanin[1]=ff_l2d_decc_out_c6_hi1_3_scanout[0];
assign ff_l2d_decc_out_c6_lo0_3_scanin[1]=ff_l2d_decc_out_c6_lo0_1_scanout[1];
assign ff_l2d_decc_out_c6_hi0_1_scanin[1]=ff_l2d_decc_out_c6_lo0_3_scanout[1];
assign ff_l2d_decc_out_c6_hi0_3_scanin[1]=ff_l2d_decc_out_c6_hi0_1_scanout[1];
assign ff_l2d_decc_out_c6_lo1_1_scanin[1]=ff_l2d_decc_out_c6_hi0_3_scanout[1];
assign ff_l2d_decc_out_c6_lo1_3_scanin[1]=ff_l2d_decc_out_c6_lo1_1_scanout[1];
assign ff_l2d_decc_out_c6_hi1_1_scanin[1]=ff_l2d_decc_out_c6_lo1_3_scanout[1];
assign ff_l2d_decc_out_c6_hi1_3_scanin[1]=ff_l2d_decc_out_c6_hi1_1_scanout[1];
assign ff_l2d_decc_out_c6_lo0_1_scanin[2]=ff_l2d_decc_out_c6_hi1_3_scanout[1];
assign ff_l2d_decc_out_c6_lo0_3_scanin[2]=ff_l2d_decc_out_c6_lo0_1_scanout[2];
assign ff_l2d_decc_out_c6_hi0_1_scanin[2]=ff_l2d_decc_out_c6_lo0_3_scanout[2];
assign ff_l2d_decc_out_c6_hi0_3_scanin[2]=ff_l2d_decc_out_c6_hi0_1_scanout[2];
assign ff_l2d_decc_out_c6_lo1_1_scanin[2]=ff_l2d_decc_out_c6_hi0_3_scanout[2];
assign ff_l2d_decc_out_c6_lo1_3_scanin[2]=ff_l2d_decc_out_c6_lo1_1_scanout[2];
assign ff_l2d_decc_out_c6_hi1_1_scanin[2]=ff_l2d_decc_out_c6_lo1_3_scanout[2];
assign ff_l2d_decc_out_c6_hi1_3_scanin[2]=ff_l2d_decc_out_c6_hi1_1_scanout[2];
assign ff_l2d_decc_out_c6_lo0_1_scanin[3]=ff_l2d_decc_out_c6_hi1_3_scanout[2];
assign ff_l2d_decc_out_c6_lo0_3_scanin[3]=ff_l2d_decc_out_c6_lo0_1_scanout[3];
assign ff_l2d_decc_out_c6_hi0_1_scanin[3]=ff_l2d_decc_out_c6_lo0_3_scanout[3];
assign ff_l2d_decc_out_c6_hi0_3_scanin[3]=ff_l2d_decc_out_c6_hi0_1_scanout[3];
assign ff_l2d_decc_out_c6_lo1_1_scanin[3]=ff_l2d_decc_out_c6_hi0_3_scanout[3];
assign ff_l2d_decc_out_c6_lo1_3_scanin[3]=ff_l2d_decc_out_c6_lo1_1_scanout[3];
assign ff_l2d_decc_out_c6_hi1_1_scanin[3]=ff_l2d_decc_out_c6_lo1_3_scanout[3];
assign ff_l2d_decc_out_c6_hi1_3_scanin[3]=ff_l2d_decc_out_c6_hi1_1_scanout[3];
assign ff_l2d_decc_out_c6_lo0_1_scanin[4]=ff_l2d_decc_out_c6_hi1_3_scanout[3];
assign ff_l2d_decc_out_c6_lo0_3_scanin[4]=ff_l2d_decc_out_c6_lo0_1_scanout[4];
assign ff_l2d_decc_out_c6_hi0_1_scanin[4]=ff_l2d_decc_out_c6_lo0_3_scanout[4];
assign ff_l2d_decc_out_c6_hi0_3_scanin[4]=ff_l2d_decc_out_c6_hi0_1_scanout[4];
assign ff_l2d_decc_out_c6_lo1_1_scanin[4]=ff_l2d_decc_out_c6_hi0_3_scanout[4];
assign ff_l2d_decc_out_c6_lo1_3_scanin[4]=ff_l2d_decc_out_c6_lo1_1_scanout[4];
assign ff_l2d_decc_out_c6_hi1_1_scanin[4]=ff_l2d_decc_out_c6_lo1_3_scanout[4];
assign ff_l2d_decc_out_c6_hi1_3_scanin[4]=ff_l2d_decc_out_c6_hi1_1_scanout[4];
assign ff_l2d_decc_out_c6_lo0_1_scanin[5]=ff_l2d_decc_out_c6_hi1_3_scanout[4];
assign ff_l2d_decc_out_c6_lo0_3_scanin[5]=ff_l2d_decc_out_c6_lo0_1_scanout[5];
assign ff_l2d_decc_out_c6_hi0_1_scanin[5]=ff_l2d_decc_out_c6_lo0_3_scanout[5];
assign ff_l2d_decc_out_c6_hi0_3_scanin[5]=ff_l2d_decc_out_c6_hi0_1_scanout[5];
assign ff_l2d_decc_out_c6_lo1_1_scanin[5]=ff_l2d_decc_out_c6_hi0_3_scanout[5];
assign ff_l2d_decc_out_c6_lo1_3_scanin[5]=ff_l2d_decc_out_c6_lo1_1_scanout[5];
assign ff_l2d_decc_out_c6_hi1_1_scanin[5]=ff_l2d_decc_out_c6_lo1_3_scanout[5];
assign ff_l2d_decc_out_c6_hi1_3_scanin[5]=ff_l2d_decc_out_c6_hi1_1_scanout[5];
assign ff_l2d_decc_out_c6_lo0_1_scanin[6]=ff_l2d_decc_out_c6_hi1_3_scanout[5];
assign ff_l2d_decc_out_c6_lo0_3_scanin[6]=ff_l2d_decc_out_c6_lo0_1_scanout[6];
assign ff_l2d_decc_out_c6_hi0_1_scanin[6]=ff_l2d_decc_out_c6_lo0_3_scanout[6];
assign ff_l2d_decc_out_c6_hi0_3_scanin[6]=ff_l2d_decc_out_c6_hi0_1_scanout[6];
assign ff_l2d_decc_out_c6_lo1_1_scanin[6]=ff_l2d_decc_out_c6_hi0_3_scanout[6];
assign ff_l2d_decc_out_c6_lo1_3_scanin[6]=ff_l2d_decc_out_c6_lo1_1_scanout[6];
assign ff_l2d_decc_out_c6_hi1_1_scanin[6]=ff_l2d_decc_out_c6_lo1_3_scanout[6];
assign ff_l2d_decc_out_c6_hi1_3_scanin[6]=ff_l2d_decc_out_c6_hi1_1_scanout[6];
assign ff_l2d_decc_out_c6_lo0_1_scanin[7]=ff_l2d_decc_out_c6_hi1_3_scanout[6];
assign ff_l2d_decc_out_c6_lo0_3_scanin[7]=ff_l2d_decc_out_c6_lo0_1_scanout[7];
assign ff_l2d_decc_out_c6_hi0_1_scanin[7]=ff_l2d_decc_out_c6_lo0_3_scanout[7];
assign ff_l2d_decc_out_c6_hi0_3_scanin[7]=ff_l2d_decc_out_c6_hi0_1_scanout[7];
assign ff_l2d_decc_out_c6_lo1_1_scanin[7]=ff_l2d_decc_out_c6_hi0_3_scanout[7];
assign ff_l2d_decc_out_c6_lo1_3_scanin[7]=ff_l2d_decc_out_c6_lo1_1_scanout[7];
assign ff_l2d_decc_out_c6_hi1_1_scanin[7]=ff_l2d_decc_out_c6_lo1_3_scanout[7];
assign ff_l2d_decc_out_c6_hi1_3_scanin[7]=ff_l2d_decc_out_c6_hi1_1_scanout[7];
assign ff_l2d_decc_out_c6_lo0_1_scanin[8]=ff_l2d_decc_out_c6_hi1_3_scanout[7];
assign ff_l2d_decc_out_c6_lo0_3_scanin[8]=ff_l2d_decc_out_c6_lo0_1_scanout[8];
assign ff_l2d_decc_out_c6_hi0_1_scanin[8]=ff_l2d_decc_out_c6_lo0_3_scanout[8];
assign ff_l2d_decc_out_c6_hi0_3_scanin[8]=ff_l2d_decc_out_c6_hi0_1_scanout[8];
assign ff_l2d_decc_out_c6_lo1_1_scanin[8]=ff_l2d_decc_out_c6_hi0_3_scanout[8];
assign ff_l2d_decc_out_c6_lo1_3_scanin[8]=ff_l2d_decc_out_c6_lo1_1_scanout[8];
assign ff_l2d_decc_out_c6_hi1_1_scanin[8]=ff_l2d_decc_out_c6_lo1_3_scanout[8];
assign ff_l2d_decc_out_c6_hi1_3_scanin[8]=ff_l2d_decc_out_c6_hi1_1_scanout[8];
assign ff_l2d_decc_out_c6_lo0_1_scanin[9]=ff_l2d_decc_out_c6_hi1_3_scanout[8];
assign ff_l2d_decc_out_c6_lo0_3_scanin[9]=ff_l2d_decc_out_c6_lo0_1_scanout[9];
assign ff_l2d_decc_out_c6_hi0_1_scanin[9]=ff_l2d_decc_out_c6_lo0_3_scanout[9];
assign ff_l2d_decc_out_c6_hi0_3_scanin[9]=ff_l2d_decc_out_c6_hi0_1_scanout[9];
assign ff_l2d_decc_out_c6_lo1_1_scanin[9]=ff_l2d_decc_out_c6_hi0_3_scanout[9];
assign ff_l2d_decc_out_c6_lo1_3_scanin[9]=ff_l2d_decc_out_c6_lo1_1_scanout[9];
assign ff_l2d_decc_out_c6_hi1_1_scanin[9]=ff_l2d_decc_out_c6_lo1_3_scanout[9];
assign ff_l2d_decc_out_c6_hi1_3_scanin[9]=ff_l2d_decc_out_c6_hi1_1_scanout[9];
assign ff_l2d_decc_out_c6_lo0_1_scanin[10]=ff_l2d_decc_out_c6_hi1_3_scanout[9];
assign ff_l2d_decc_out_c6_lo0_3_scanin[10]=ff_l2d_decc_out_c6_lo0_1_scanout[10];
assign ff_l2d_decc_out_c6_hi0_1_scanin[10]=ff_l2d_decc_out_c6_lo0_3_scanout[10];
assign ff_l2d_decc_out_c6_hi0_3_scanin[10]=ff_l2d_decc_out_c6_hi0_1_scanout[10];
assign ff_l2d_decc_out_c6_lo1_1_scanin[10]=ff_l2d_decc_out_c6_hi0_3_scanout[10];
assign ff_l2d_decc_out_c6_lo1_3_scanin[10]=ff_l2d_decc_out_c6_lo1_1_scanout[10];
assign ff_l2d_decc_out_c6_hi1_1_scanin[10]=ff_l2d_decc_out_c6_lo1_3_scanout[10];
assign ff_l2d_decc_out_c6_hi1_3_scanin[10]=ff_l2d_decc_out_c6_hi1_1_scanout[10];
assign ff_l2d_decc_out_c6_lo0_1_scanin[11]=ff_l2d_decc_out_c6_hi1_3_scanout[10];
assign ff_l2d_decc_out_c6_lo0_3_scanin[11]=ff_l2d_decc_out_c6_lo0_1_scanout[11];
assign ff_l2d_decc_out_c6_hi0_1_scanin[11]=ff_l2d_decc_out_c6_lo0_3_scanout[11];
assign ff_l2d_decc_out_c6_hi0_3_scanin[11]=ff_l2d_decc_out_c6_hi0_1_scanout[11];
assign ff_l2d_decc_out_c6_lo1_1_scanin[11]=ff_l2d_decc_out_c6_hi0_3_scanout[11];
assign ff_l2d_decc_out_c6_lo1_3_scanin[11]=ff_l2d_decc_out_c6_lo1_1_scanout[11];
assign ff_l2d_decc_out_c6_hi1_1_scanin[11]=ff_l2d_decc_out_c6_lo1_3_scanout[11];
assign ff_l2d_decc_out_c6_hi1_3_scanin[11]=ff_l2d_decc_out_c6_hi1_1_scanout[11];
assign ff_l2d_decc_out_c6_lo0_1_scanin[12]=ff_l2d_decc_out_c6_hi1_3_scanout[11];
assign ff_l2d_decc_out_c6_lo0_3_scanin[12]=ff_l2d_decc_out_c6_lo0_1_scanout[12];
assign ff_l2d_decc_out_c6_hi0_1_scanin[12]=ff_l2d_decc_out_c6_lo0_3_scanout[12];
assign ff_l2d_decc_out_c6_hi0_3_scanin[12]=ff_l2d_decc_out_c6_hi0_1_scanout[12];
assign ff_l2d_decc_out_c6_lo1_1_scanin[12]=ff_l2d_decc_out_c6_hi0_3_scanout[12];
assign ff_l2d_decc_out_c6_lo1_3_scanin[12]=ff_l2d_decc_out_c6_lo1_1_scanout[12];
assign ff_l2d_decc_out_c6_hi1_1_scanin[12]=ff_l2d_decc_out_c6_lo1_3_scanout[12];
assign ff_l2d_decc_out_c6_hi1_3_scanin[12]=ff_l2d_decc_out_c6_hi1_1_scanout[12];
assign ff_l2d_decc_out_c6_lo0_1_scanin[13]=ff_l2d_decc_out_c6_hi1_3_scanout[12];
assign ff_l2d_decc_out_c6_lo0_3_scanin[13]=ff_l2d_decc_out_c6_lo0_1_scanout[13];
assign ff_l2d_decc_out_c6_hi0_1_scanin[13]=ff_l2d_decc_out_c6_lo0_3_scanout[13];
assign ff_l2d_decc_out_c6_hi0_3_scanin[13]=ff_l2d_decc_out_c6_hi0_1_scanout[13];
assign ff_l2d_decc_out_c6_lo1_1_scanin[13]=ff_l2d_decc_out_c6_hi0_3_scanout[13];
assign ff_l2d_decc_out_c6_lo1_3_scanin[13]=ff_l2d_decc_out_c6_lo1_1_scanout[13];
assign ff_l2d_decc_out_c6_hi1_1_scanin[13]=ff_l2d_decc_out_c6_lo1_3_scanout[13];
assign ff_l2d_decc_out_c6_hi1_3_scanin[13]=ff_l2d_decc_out_c6_hi1_1_scanout[13];
assign ff_l2d_decc_out_c6_lo0_1_scanin[14]=ff_l2d_decc_out_c6_hi1_3_scanout[13];
assign ff_l2d_decc_out_c6_lo0_3_scanin[14]=ff_l2d_decc_out_c6_lo0_1_scanout[14];
assign ff_l2d_decc_out_c6_hi0_1_scanin[14]=ff_l2d_decc_out_c6_lo0_3_scanout[14];
assign ff_l2d_decc_out_c6_hi0_3_scanin[14]=ff_l2d_decc_out_c6_hi0_1_scanout[14];
assign ff_l2d_decc_out_c6_lo1_1_scanin[14]=ff_l2d_decc_out_c6_hi0_3_scanout[14];
assign ff_l2d_decc_out_c6_lo1_3_scanin[14]=ff_l2d_decc_out_c6_lo1_1_scanout[14];
assign ff_l2d_decc_out_c6_hi1_1_scanin[14]=ff_l2d_decc_out_c6_lo1_3_scanout[14];
assign ff_l2d_decc_out_c6_hi1_3_scanin[14]=ff_l2d_decc_out_c6_hi1_1_scanout[14];
assign ff_l2d_decc_out_c6_lo0_1_scanin[15]=ff_l2d_decc_out_c6_hi1_3_scanout[14];
assign ff_l2d_decc_out_c6_lo0_3_scanin[15]=ff_l2d_decc_out_c6_lo0_1_scanout[15];
assign ff_l2d_decc_out_c6_hi0_1_scanin[15]=ff_l2d_decc_out_c6_lo0_3_scanout[15];
assign ff_l2d_decc_out_c6_hi0_3_scanin[15]=ff_l2d_decc_out_c6_hi0_1_scanout[15];
assign ff_l2d_decc_out_c6_lo1_1_scanin[15]=ff_l2d_decc_out_c6_hi0_3_scanout[15];
assign ff_l2d_decc_out_c6_lo1_3_scanin[15]=ff_l2d_decc_out_c6_lo1_1_scanout[15];
assign ff_l2d_decc_out_c6_hi1_1_scanin[15]=ff_l2d_decc_out_c6_lo1_3_scanout[15];
assign ff_l2d_decc_out_c6_hi1_3_scanin[15]=ff_l2d_decc_out_c6_hi1_1_scanout[15];
assign ff_l2d_decc_out_c6_lo0_1_scanin[16]=ff_l2d_decc_out_c6_hi1_3_scanout[15];
assign ff_l2d_decc_out_c6_lo0_3_scanin[16]=ff_l2d_decc_out_c6_lo0_1_scanout[16];
assign ff_l2d_decc_out_c6_hi0_1_scanin[16]=ff_l2d_decc_out_c6_lo0_3_scanout[16];
assign ff_l2d_decc_out_c6_hi0_3_scanin[16]=ff_l2d_decc_out_c6_hi0_1_scanout[16];
assign ff_l2d_decc_out_c6_lo1_1_scanin[16]=ff_l2d_decc_out_c6_hi0_3_scanout[16];
assign ff_l2d_decc_out_c6_lo1_3_scanin[16]=ff_l2d_decc_out_c6_lo1_1_scanout[16];
assign ff_l2d_decc_out_c6_hi1_1_scanin[16]=ff_l2d_decc_out_c6_lo1_3_scanout[16];
assign ff_l2d_decc_out_c6_hi1_3_scanin[16]=ff_l2d_decc_out_c6_hi1_1_scanout[16];
assign ff_l2d_decc_out_c6_lo0_1_scanin[17]=ff_l2d_decc_out_c6_hi1_3_scanout[16];
assign ff_l2d_decc_out_c6_lo0_3_scanin[17]=ff_l2d_decc_out_c6_lo0_1_scanout[17];
assign ff_l2d_decc_out_c6_hi0_1_scanin[17]=ff_l2d_decc_out_c6_lo0_3_scanout[17];
assign ff_l2d_decc_out_c6_hi0_3_scanin[17]=ff_l2d_decc_out_c6_hi0_1_scanout[17];
assign ff_l2d_decc_out_c6_lo1_1_scanin[17]=ff_l2d_decc_out_c6_hi0_3_scanout[17];
assign ff_l2d_decc_out_c6_lo1_3_scanin[17]=ff_l2d_decc_out_c6_lo1_1_scanout[17];
assign ff_l2d_decc_out_c6_hi1_1_scanin[17]=ff_l2d_decc_out_c6_lo1_3_scanout[17];
assign ff_l2d_decc_out_c6_hi1_3_scanin[17]=ff_l2d_decc_out_c6_hi1_1_scanout[17];
assign ff_l2d_decc_out_c6_lo0_1_scanin[18]=ff_l2d_decc_out_c6_hi1_3_scanout[17];
assign ff_l2d_decc_out_c6_lo0_3_scanin[18]=ff_l2d_decc_out_c6_lo0_1_scanout[18];
assign ff_l2d_decc_out_c6_hi0_1_scanin[18]=ff_l2d_decc_out_c6_lo0_3_scanout[18];
assign ff_l2d_decc_out_c6_hi0_3_scanin[18]=ff_l2d_decc_out_c6_hi0_1_scanout[18];
assign ff_l2d_decc_out_c6_lo1_1_scanin[18]=ff_l2d_decc_out_c6_hi0_3_scanout[18];
assign ff_l2d_decc_out_c6_lo1_3_scanin[18]=ff_l2d_decc_out_c6_lo1_1_scanout[18];
assign ff_l2d_decc_out_c6_hi1_1_scanin[18]=ff_l2d_decc_out_c6_lo1_3_scanout[18];
assign ff_l2d_decc_out_c6_hi1_3_scanin[18]=ff_l2d_decc_out_c6_hi1_1_scanout[18];
assign ff_l2d_decc_out_c6_lo0_1_scanin[19]=ff_l2d_decc_out_c6_hi1_3_scanout[18];
assign ff_l2d_decc_out_c6_lo0_3_scanin[19]=ff_l2d_decc_out_c6_lo0_1_scanout[19];
assign ff_l2d_decc_out_c6_hi0_1_scanin[19]=ff_l2d_decc_out_c6_lo0_3_scanout[19];
assign ff_l2d_decc_out_c6_hi0_3_scanin[19]=ff_l2d_decc_out_c6_hi0_1_scanout[19];
assign scan_out=ff_l2d_decc_out_c6_hi0_3_scanout[19];
// fixscan end
endmodule






// any PARAMS parms go into naming of macro

module n2_l2d_ctrlio_cust_l1clkhdr_ctl_macro (
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

module n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;

  input [8:0] din;
  input l1clk;
  input [8:0] scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output [8:0] scan_out;
assign fdin[8:0] = din[8:0];






dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8:0]),
.si(scan_in[8:0]),
.so(scan_out[8:0]),
.q(dout[8:0])
);












endmodule













// any PARAMS parms go into naming of macro

module n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;

  input [3:0] din;
  input l1clk;
  input [3:0] scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output [3:0] scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si(scan_in[3:0]),
.so(scan_out[3:0]),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;

  input [1:0] din;
  input l1clk;
  input [1:0] scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output [1:0] scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si(scan_in[1:0]),
.so(scan_out[1:0]),
.q(dout[1:0])
);












endmodule









//  
//   or macro for ports = 2,3
//
//





module n2_l2d_ctrlio_cust_or_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule









// any PARAMS parms go into naming of macro

module n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_1 (
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
  input [0:0] scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output [0:0] scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in[0:0]),
.so(scan_out[0:0]),
.q(dout[0:0])
);












endmodule









//  
//   and macro for ports = 2,3,4
//
//





module n2_l2d_ctrlio_cust_and_macro__ports_4__width_1 (
  din0, 
  din1, 
  din2, 
  din3, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  input [0:0] din3;
  output [0:0] dout;






and4 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.in3(din3[0:0]),
.out(dout[0:0])
);









endmodule





//
//   invert macro
//
//





module n2_l2d_ctrlio_cust_inv_macro__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module n2_l2d_ctrlio_cust_and_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   invert macro
//
//





module n2_l2d_ctrlio_cust_inv_macro__width_8 (
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





module n2_l2d_ctrlio_cust_or_macro__width_8 (
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





//
//   invert macro
//
//





module n2_l2d_ctrlio_cust_inv_macro__width_4 (
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
//   or macro for ports = 2,3
//
//





module n2_l2d_ctrlio_cust_or_macro__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






or2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);









endmodule





//
//   invert macro
//
//





module n2_l2d_ctrlio_cust_inv_macro__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






inv #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module n2_l2d_ctrlio_cust_and_macro__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






and2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module n2_l2d_ctrlio_cust_and_macro__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






and2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module n2_l2d_ctrlio_cust_and_macro__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output [7:0] dout;






and2 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout[7:0])
);









endmodule









// any PARAMS parms go into naming of macro

module n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_16 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;

  input [15:0] din;
  input l1clk;
  input [15:0] scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output [15:0] scan_out;
assign fdin[15:0] = din[15:0];






dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15:0]),
.si(scan_in[15:0]),
.so(scan_out[15:0]),
.q(dout[15:0])
);












endmodule













// any PARAMS parms go into naming of macro

module n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_78 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [77:0] fdin;

  input [77:0] din;
  input l1clk;
  input [77:0] scan_in;


  input siclk;
  input soclk;

  output [77:0] dout;
  output [77:0] scan_out;
assign fdin[77:0] = din[77:0];






dff #(78)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[77:0]),
.si(scan_in[77:0]),
.so(scan_out[77:0]),
.q(dout[77:0])
);












endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_39 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [38:0] din0;
  input sel0;
  input [38:0] din1;
  input sel1;
  output [38:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(39)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[38:0]),
  .in1(din1[38:0]),
.dout(dout[38:0])
);









  



endmodule


//
//   macro for cl_mc1_tisram_blbi_8x flop
//
//





module n2_l2d_ctrlio_cust_tisram_blbi_macro__width_624 (
  d_a, 
  l1clk, 
  q_b_l);
input [623:0] d_a;
input l1clk;
output [623:0] q_b_l;






tisram_blb_inv #(624)  d0_0 (
.d(d_a[623:0]),
.l1clk(l1clk),
.latout_l(q_b_l[623:0])
);










//place::generic_place($width,$stack,$left);

endmodule









// any PARAMS parms go into naming of macro

module n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_39 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [38:0] fdin;

  input [38:0] din;
  input l1clk;
  input [38:0] scan_in;


  input siclk;
  input soclk;

  output [38:0] dout;
  output [38:0] scan_out;
assign fdin[38:0] = din[38:0];






dff #(39)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[38:0]),
.si(scan_in[38:0]),
.so(scan_out[38:0]),
.q(dout[38:0])
);












endmodule









//
//   macro for cl_mc1_tisram_bla_{4}x flops
//
//





module n2_l2d_ctrlio_cust_tisram_bla_macro__width_156 (
  d_b, 
  l1clk, 
  q_a);
input [155:0] d_b;
input l1clk;
output [155:0] q_a;






tisram_bla #(156)  d0_0 (
.d_b(d_b[155:0]),
.l1clk(l1clk),
.q_a(q_a[155:0])
);










//place::generic_place($width,$stack,$left);

endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_156 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [155:0] din0;
  input sel0;
  input [155:0] din1;
  input sel1;
  output [155:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(156)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[155:0]),
  .in1(din1[155:0]),
.dout(dout[155:0])
);









  



endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module n2_l2d_ctrlio_cust_cmp_macro__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output dout;






cmp #(4)  m0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout)
);










endmodule





//
//   nor macro for ports = 2,3
//
//





module n2_l2d_ctrlio_cust_nor_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_3__width_10 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;

  input [9:0] din0;
  input sel0;
  input [9:0] din1;
  input sel1;
  input [9:0] din2;
  input sel2;
  output [9:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(10)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[9:0]),
  .in1(din1[9:0]),
  .in2(din2[9:0]),
.dout(dout[9:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module n2_l2d_ctrlio_cust_mux_macro__mux_aonpe__ports_2__width_10 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [9:0] din0;
  input sel0;
  input [9:0] din1;
  input sel1;
  output [9:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(10)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[9:0]),
  .in1(din1[9:0]),
.dout(dout[9:0])
);









  



endmodule



module n2_l2d_tstmod_cust (
  rd_wr_c3, 
  wayerr_c3, 
  wr_inhibit, 
  coloff_c3, 
  l2clk, 
  scanen, 
  si, 
  siclk, 
  soclk, 
  so, 
  delout20_rgt, 
  delout31_lft, 
  delout31_rgt, 
  delout20_lft) ;
wire not_wayerr_c3;
wire coloff_c3_1_3;
wire coloff_c3_2_0;
wire [1:0] msff_read_c4_scanin;
wire [1:0] msff_read_c4_scanout;
wire msff_buf_out_top_scanin;
wire msff_buf_out_top_scanout;
wire msff_buf_out_bot_scanin;
wire msff_buf_out_bot_scanout;
wire [2:0] msff_buf_out_corse_scanin;
wire [2:0] msff_buf_out_corse_scanout;
wire [2:0] msff_buf_out_fine_scanin;
wire [2:0] msff_buf_out_fine_scanout;
wire wr_inhibit_n;
wire [2:0] ff_buf_out_corse_n;
wire [2:0] ff_buf_out_fine_n;

//-----------------------------------------------------------
//  I/O declarations
//-----------------------------------------------------------
input		rd_wr_c3;	// 
input		wayerr_c3;	// added 9/21/2005
input		wr_inhibit;	// 
//  coloff_c3<3:0>,           
input	[3:0]	coloff_c3;	// 
input		l2clk;		// 
input		scanen;		// 
input		si;		// 
input		siclk;		// 
input		soclk;		// 

output 		so;		// 
output		delout20_rgt;	// 
output 		delout31_lft;	// 
output 		delout31_rgt;	// 
output  	delout20_lft;	// 


//-----------------------------------------------------------------------------
//  Wire/reg declarations
//-----------------------------------------------------------------------------

// connecting between n2_l2d_tstmod_logic  &  n2_l2d_tstmod_delay_cust
wire		l1clk;
wire		tst_bnken31_setb;
wire		tst_bnken02_setb;
wire		tst_bnken31_rstb;
wire		tst_bnken02_rstb;
wire		tst_bnken31_rstb_n;
wire		tst_bnken02_rstb_n;
//wire		so_internal;
wire		tstmod_rst_l;
wire	[5:0]	corse_sel;
wire	[7:0]	fine_sel;


wire	[1:0]	tst_read_c3a;
//wire	[1:0]	tst_read_c3b;
//wire	[3:0]	tst_read_c4;
//wire	[3:0]	tst_so;
wire	[1:0]	tst_so;
wire	[2:0]	tst_so_corse;
wire	[2:0]	tst_so_fine;
wire		tst_so_en0;

wire		ff_buf_out_top;
wire	[2:0]	ff_buf_out_corse;
wire	[2:0]	ff_buf_out_fine;
wire		ff_buf_out_bot;


// start n2_l2d_tstmod_logic


n2_l2d_ctrlio_cust_l1clkhdr_ctl_macro l1_clk_hdr (
        .l2clk  (l2clk),
        .se     (scanen),
        .l1en   (1'b1),
        .pce_ov (1'b1),
        .stop   (1'b0),
        .l1clk  (l1clk)
        );



//assign tst_read_c3a[1] = (~wayerr_c3  &  rd_wr_c3  &  (coloff_c3[3] | coloff_c3[1]));
//assign tst_read_c3a[0] = (~wayerr_c3  &  rd_wr_c3  &  (coloff_c3[2] | coloff_c3[0]));


n2_l2d_ctrlio_cust_inv_macro__width_1 inv_wayerr_c3 
	(
	.dout	(not_wayerr_c3),
	.din	(wayerr_c3)
	);

n2_l2d_ctrlio_cust_or_macro__width_1 or_coloff_c3_1_3 
	(
	.din0	(coloff_c3[1]),
	.din1	(coloff_c3[3]),
	.dout	(coloff_c3_1_3)
	);


n2_l2d_ctrlio_cust_or_macro__width_1 or_coloff_c3_2_3 
        (
        .din0   (coloff_c3[2]),
        .din1   (coloff_c3[0]),
        .dout   (coloff_c3_2_0)
        );

n2_l2d_ctrlio_cust_and_macro__ports_3__width_1 and_tst_read_c3a_1 
	(
	.dout	(tst_read_c3a[1]),
	.din0	(not_wayerr_c3),
	.din1	(coloff_c3_1_3),
	.din2	(rd_wr_c3)
	);

n2_l2d_ctrlio_cust_and_macro__ports_3__width_1 and_tst_read_c3a_0 
        (
        .dout   (tst_read_c3a[0]),
        .din0   (not_wayerr_c3),
        .din1   (coloff_c3_2_0),
        .din2   (rd_wr_c3)
        );

n2_l2d_ctrlio_cust_tisram_blb_macro__dmsff_4x__width_1 blb_read_c3_1  
        (
        .l1clk  (l1clk),
        .d_a    (tst_read_c3a[1]),
        .q_b	(tst_bnken31_setb)
        );
n2_l2d_ctrlio_cust_tisram_blb_macro__dmsff_4x__width_1 blb_read_c3_0  
        (
        .l1clk  (l1clk),
        .d_a    (tst_read_c3a[0]),
        .q_b	(tst_bnken02_setb)
        );

//initialize
//assign tst_read_c4[3:0] = 4'b0;

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_2  msff_read_c4  
        ( 
        .scan_in    (msff_read_c4_scanin[1:0]),
	.scan_out   (msff_read_c4_scanout[1:0]), 
        .din   ( tst_read_c3a[1:0]  &  {~tst_bnken31_rstb_n,~tst_bnken02_rstb_n} ),
        .l1clk ( l1clk ),
        .dout   ( {tst_bnken31_rstb_n,tst_bnken02_rstb_n} ),
  .siclk(siclk),
  .soclk(soclk)
); 


//assign tst_bnken31_rstb = ~tst_bnken31_rstb_n;
//assign tst_bnken02_rstb = ~tst_bnken02_rstb_n;

n2_l2d_ctrlio_cust_inv_macro__width_1 inv_tst_bnken31_rstb 
	(
	.dout	(tst_bnken31_rstb),
	.din	(tst_bnken31_rstb_n)
	);

n2_l2d_ctrlio_cust_inv_macro__width_1 inv_tst_bnken02_rstb 
        (
        .dout   (tst_bnken02_rstb),
        .din    (tst_bnken02_rstb_n)
        );

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_1  msff_buf_out_top  
        ( 
        .scan_in    (msff_buf_out_top_scanin),
	.scan_out   (msff_buf_out_top_scanout), 
        .din     ( ff_buf_out_top ), 
        .l1clk   ( l1clk ), 
        .dout    ( ff_buf_out_top ),
  .siclk(siclk),
  .soclk(soclk) 
); 

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_1  msff_buf_out_bot  
        ( 
        .scan_in    (msff_buf_out_bot_scanin),
	.scan_out   (msff_buf_out_bot_scanout),  
        .din    ( ff_buf_out_bot ),
        .l1clk  ( l1clk ),
        .dout   ( ff_buf_out_bot ),
  .siclk(siclk),
  .soclk(soclk)
); 


n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_3  msff_buf_out_corse  
        ( 
        .scan_in    (msff_buf_out_corse_scanin[2:0]),
	.scan_out   (msff_buf_out_corse_scanout[2:0]),  
        .din   ( ff_buf_out_corse[2:0] ),
        .l1clk ( l1clk ),
        .dout  ( ff_buf_out_corse[2:0] ),
  .siclk(siclk),
  .soclk(soclk)
); 

n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_3  msff_buf_out_fine  
        ( 
        .scan_in    (msff_buf_out_fine_scanin[2:0]),
	.scan_out   (msff_buf_out_fine_scanout[2:0]),  
        .din   ( ff_buf_out_fine[2:0] ),
        .l1clk ( l1clk ),
        .dout  ( ff_buf_out_fine[2:0] ),
  .siclk(siclk),
  .soclk(soclk)
); 

//assign tstmod_rst_l = ff_buf_out_top  &  ff_buf_out_bot  &  ~wr_inhibit;


n2_l2d_ctrlio_cust_inv_macro__width_1 inv_wr_inhibit 
	(
	.dout	(wr_inhibit_n),
	.din	(wr_inhibit)
	);

n2_l2d_ctrlio_cust_and_macro__ports_3__width_1 and_tstmod_rst_l 
	(
	.dout	(tstmod_rst_l),
	.din0	(ff_buf_out_top),
	.din1	(ff_buf_out_bot),
	.din2	(wr_inhibit_n)
	);


n2_l2d_ctrlio_cust_inv_macro__width_3 inv_ff_buf_out_corse_012 
	(
	.dout	(ff_buf_out_corse_n[2:0]),
	.din	(ff_buf_out_corse[2:0])
	);





//decoding: 3-to-8. 2/3, 1/0 swapped
//assign corse_sel[5] = ff_buf_out_corse[2]  &  ~ff_buf_out_corse[1]  &  ~ff_buf_out_corse[0];

n2_l2d_ctrlio_cust_and_macro__ports_3__width_1 and_corse_sel_5 
        (
        .dout   (corse_sel[5]),
        .din0   (ff_buf_out_corse[2]),
        .din1   (ff_buf_out_corse_n[1]),
        .din2   (ff_buf_out_corse_n[0])
        );

//assign corse_sel[4] = ff_buf_out_corse[2]  &  ~ff_buf_out_corse[1]  &  ff_buf_out_corse[0];

n2_l2d_ctrlio_cust_and_macro__ports_3__width_1 and_corse_sel_4 
        (
        .dout   (corse_sel[4]),
        .din0   (ff_buf_out_corse[2]),
        .din1   (ff_buf_out_corse_n[1]),
        .din2   (ff_buf_out_corse[0])
        );

//assign corse_sel[3] = ~ff_buf_out_corse[2]  &  ff_buf_out_corse[1]  &  ~ff_buf_out_corse[0];

n2_l2d_ctrlio_cust_and_macro__ports_3__width_1 and_corse_sel_3 
        (
        .dout   (corse_sel[3]),
        .din0   (ff_buf_out_corse_n[2]),
        .din1   (ff_buf_out_corse[1]),
        .din2   (ff_buf_out_corse_n[0])
        );

//assign corse_sel[2] = ~ff_buf_out_corse[2]  &  ff_buf_out_corse[1]  &  ff_buf_out_corse[0];

n2_l2d_ctrlio_cust_and_macro__ports_3__width_1 and_corse_sel_2 
        (
        .dout   (corse_sel[2]),
        .din0   (ff_buf_out_corse_n[2]),
        .din1   (ff_buf_out_corse[1]),
        .din2   (ff_buf_out_corse[0])
        );

//assign corse_sel[1] = ~ff_buf_out_corse[2]  &  ~ff_buf_out_corse[1]  &  ~ff_buf_out_corse[0];

n2_l2d_ctrlio_cust_and_macro__ports_3__width_1 and_corse_sel_1 
        (
        .dout   (corse_sel[1]),
        .din0   (ff_buf_out_corse_n[2]),
        .din1   (ff_buf_out_corse_n[1]),
        .din2   (ff_buf_out_corse_n[0])
        );

//assign corse_sel[0] = ~ff_buf_out_corse[2]  &  ~ff_buf_out_corse[1]  &  ff_buf_out_corse[0];

n2_l2d_ctrlio_cust_and_macro__ports_3__width_1 and_corse_sel_0 
        (
        .dout   (corse_sel[0]),
        .din0   (ff_buf_out_corse_n[2]),
        .din1   (ff_buf_out_corse_n[1]),
        .din2   (ff_buf_out_corse[0])
        );

n2_l2d_ctrlio_cust_inv_macro__width_3 inv_ff_buf_out_fine_n 
	(
	.dout	(ff_buf_out_fine_n[2:0]),
	.din	(ff_buf_out_fine[2:0])
	);


//assign fine_sel[7] = ff_buf_out_fine[2]  &  ff_buf_out_fine[1]  &  ~ff_buf_out_fine[0];

n2_l2d_ctrlio_cust_and_macro__ports_3__width_1 and_fine_sel_7 
        (
        .dout   (fine_sel[7]),
        .din0   (ff_buf_out_fine[2]),
        .din1   (ff_buf_out_fine[1]),
        .din2   (ff_buf_out_fine_n[0])
        );

//assign fine_sel[6] = ff_buf_out_fine[2]  &  ff_buf_out_fine[1]  &  ff_buf_out_fine[0];


n2_l2d_ctrlio_cust_and_macro__ports_3__width_1 and_fine_sel_6 
        (
        .dout   (fine_sel[6]),
        .din0   (ff_buf_out_fine[2]),
        .din1   (ff_buf_out_fine[1]),
        .din2   (ff_buf_out_fine[0])
        );

//assign fine_sel[5] = ff_buf_out_fine[2]  &  ~ff_buf_out_fine[1]  &  ~ff_buf_out_fine[0];


n2_l2d_ctrlio_cust_and_macro__ports_3__width_1 and_fine_sel_5 
        (
        .dout   (fine_sel[5]),
        .din0   (ff_buf_out_fine[2]),
        .din1   (ff_buf_out_fine_n[1]),
        .din2   (ff_buf_out_fine_n[0])
        );

//assign fine_sel[4] = ff_buf_out_fine[2]  &  ~ff_buf_out_fine[1]  &  ff_buf_out_fine[0];


n2_l2d_ctrlio_cust_and_macro__ports_3__width_1 and_fine_sel_4 
        (
        .dout   (fine_sel[4]),
        .din0   (ff_buf_out_fine[2]),
        .din1   (ff_buf_out_fine_n[1]),
        .din2   (ff_buf_out_fine[0])
        );

//assign fine_sel[3] = ~ff_buf_out_fine[2]  &  ff_buf_out_fine[1]  &  ~ff_buf_out_fine[0];


n2_l2d_ctrlio_cust_and_macro__ports_3__width_1 and_fine_sel_3 
        (
        .dout   (fine_sel[3]),
        .din0   (ff_buf_out_fine_n[2]),
        .din1   (ff_buf_out_fine[1]),
        .din2   (ff_buf_out_fine_n[0])
        );

//assign fine_sel[2] = ~ff_buf_out_fine[2]  &  ff_buf_out_fine[1]  &  ff_buf_out_fine[0];


n2_l2d_ctrlio_cust_and_macro__ports_3__width_1 and_fine_sel_2 
        (
        .dout   (fine_sel[2]),
        .din0   (ff_buf_out_fine_n[2]),
        .din1   (ff_buf_out_fine[1]),
        .din2   (ff_buf_out_fine[0])
        );

//assign fine_sel[1] = ~ff_buf_out_fine[2]  &  ~ff_buf_out_fine[1]  &  ~ff_buf_out_fine[0];


n2_l2d_ctrlio_cust_and_macro__ports_3__width_1 and_fine_sel_1 
        (
        .dout   (fine_sel[1]),
        .din0   (ff_buf_out_fine_n[2]),
        .din1   (ff_buf_out_fine_n[1]),
        .din2   (ff_buf_out_fine_n[0])
        );

//assign fine_sel[0] = ~ff_buf_out_fine[2]  &  ~ff_buf_out_fine[1]  &  ff_buf_out_fine[0];


n2_l2d_ctrlio_cust_and_macro__ports_3__width_1 and_fine_sel_0 
        (
        .dout   (fine_sel[0]),
        .din0   (ff_buf_out_fine_n[2]),
        .din1   (ff_buf_out_fine_n[1]),
        .din2   (ff_buf_out_fine[0])
        );


//end of n2_l2d_tstmod_logic

n2_l2d_tstmod_delay_cust  tstmod_delay	// NOT ATPGABLE
       (
       .l1clk           (l1clk),
       .tstmod_rst_l    (tstmod_rst_l),
       .tst_bnken31_setb(tst_bnken31_setb),
       .tst_bnken02_setb(tst_bnken02_setb),
       .tst_bnken31_rstb(tst_bnken31_rstb),
       .tst_bnken02_rstb(tst_bnken02_rstb),
       .corse_sel       (corse_sel[5:0]),
       .fine_sel        (fine_sel[7:0]),
       .delout31_lft    (delout31_lft),
       .delout31_rgt    (delout31_rgt),
       .delout20_lft    (delout20_lft),
       .delout20_rgt    (delout20_rgt)
       );
       
       
       
// scanorder start
//msff_read_c4_scanin[1:0]
//msff_buf_out_top_scanin
//msff_buf_out_corse_scanin[0]
//msff_buf_out_corse_scanin[1]
//msff_buf_out_corse_scanin[2]
//msff_buf_out_fine_scanin[0]
//msff_buf_out_fine_scanin[1]
//msff_buf_out_fine_scanin[2]
//msff_buf_out_bot_scanin
// scanorder end281     // fixscan start
assign msff_read_c4_scanin[1]=si;
assign msff_read_c4_scanin[0]=msff_read_c4_scanout[1];
assign msff_buf_out_top_scanin=msff_read_c4_scanout[0];
assign msff_buf_out_corse_scanin[0]=msff_buf_out_top_scanout;
assign msff_buf_out_corse_scanin[1]=msff_buf_out_corse_scanout[0];
assign msff_buf_out_corse_scanin[2]=msff_buf_out_corse_scanout[1];
assign msff_buf_out_fine_scanin[0]=msff_buf_out_corse_scanout[2];
assign msff_buf_out_fine_scanin[1]=msff_buf_out_fine_scanout[0];
assign msff_buf_out_fine_scanin[2]=msff_buf_out_fine_scanout[1];
assign msff_buf_out_bot_scanin=msff_buf_out_fine_scanout[2];
assign so=msff_buf_out_bot_scanout;
// fixscan end
endmodule // main program

//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
// THE FOLLOWING MODULE IS BLACKBOX TO ATPG
//////////////////////////////////////////////

module n2_l2d_tstmod_delay_cust (
  l1clk, 
  tstmod_rst_l, 
  tst_bnken31_setb, 
  tst_bnken02_setb, 
  tst_bnken31_rstb, 
  tst_bnken02_rstb, 
  corse_sel, 
  fine_sel, 
  delout31_lft, 
  delout31_rgt, 
  delout20_lft, 
  delout20_rgt) ;

input   l1clk;   
input   tstmod_rst_l;   
input   tst_bnken31_setb;   
input   tst_bnken02_setb;   
input   tst_bnken31_rstb;   
input   tst_bnken02_rstb;   
input   [5:0] corse_sel;   
input   [7:0] fine_sel;   

output   delout31_lft;   
output   delout31_rgt;   
output   delout20_lft;   
output   delout20_rgt;   

wire    [5:0]   corse_sel_muxout;
wire    [7:1]   fine_sel_muxout;

wire 		delayline_en_31;
wire 		delayline_en_02;
wire 		fine_dout_31;
wire 		fine_dout_02;

assign corse_sel_muxout[5:0] = ( {1'b0,corse_sel_muxout[5:1]}  &  {~({5{tstmod_rst_l}} & corse_sel[5:1]),(tstmod_rst_l & ~corse_sel[0])}) | 
                               ({6{l1clk}}  &  {{{5{tstmod_rst_l}} & corse_sel[5:1]},(~(tstmod_rst_l & ~corse_sel[0])) & tstmod_rst_l});

//  
//assign fine_sel_muxout[7:1] = ( ({corse_sel_muxout[0],fine_sel_muxout[7:2]})  &  (~fine_sel[7:1]) )
// | ({&{corse_sel_muxout[0]}}  &  fine_sel[7:1]);


assign fine_sel_muxout[7:1] = ( ({corse_sel_muxout[0],fine_sel_muxout[7:2]})  &  (~fine_sel[7:1]) ) |
({7{corse_sel_muxout[0]}}  &  fine_sel[7:1]);


srlatch1	latch1_31
	(
	.setl (~(l1clk & tstmod_rst_l  &  tst_bnken31_setb)),
	.rstl1 (tstmod_rst_l),
	.rstl2 (l1clk|~tst_bnken31_rstb),
	.out (delayline_en_31)
	);

srlatch1	latch1_02
	(
	.setl (~(l1clk & tstmod_rst_l  &  tst_bnken02_setb)),
	.rstl1 (tstmod_rst_l),
	.rstl2 (l1clk|~tst_bnken02_rstb),
	.out (delayline_en_02)
	);

srlatch2	latch2_31
	(
	.setl1 (~(fine_sel_muxout[1] & delayline_en_31 & ~fine_sel[0])),
	.setl2 (~(corse_sel_muxout[0] & delayline_en_31 & fine_sel[0])),
	.rstl (delayline_en_31),
	.out (fine_dout_31)
	);

srlatch2	latch2_02
	(
	.setl1 (~(fine_sel_muxout[1] & delayline_en_02 & ~fine_sel[0])),
	.setl2 (~(corse_sel_muxout[0] & delayline_en_02 & fine_sel[0])),
	.rstl (delayline_en_02),
	.out (fine_dout_02)
	);

assign delout31_lft = ~fine_dout_31;
assign delout31_rgt = ~fine_dout_31;
assign delout20_lft = ~fine_dout_02;
assign delout20_rgt = ~fine_dout_02;
endmodule  //n2_l2d_tstmod_delay_cust


module srlatch1 (
  setl, 
  rstl1, 
  rstl2, 
  out) ;

  input setl;
  input rstl1;
  input rstl2;
  output out;

reg out;

        always @(setl or rstl1 or rstl2) 
        begin
           if(~setl)  out   =  1'b1;
           else if( ~(rstl1 & rstl2) )  out   =  1'b0;
        end
endmodule // srlatch1


module srlatch2 (
  setl1, 
  setl2, 
  rstl, 
  out) ;

  input setl1;
  input setl2;
  input rstl;
  output out;

reg out;

        always @(setl1 or setl2 or rstl) begin
          if( (setl1==0) || (setl2==0))  out   =  1'b1;
          else if(~rstl)  out   =  1'b0;
        end
endmodule // srlatch2


//  
//   and macro for ports = 2,3,4
//
//





module n2_l2d_ctrlio_cust_and_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






and3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





//
//   macro for cl_mc1_tisram_blb_{8,4}x flops
//
//





module n2_l2d_ctrlio_cust_tisram_blb_macro__dmsff_4x__width_1 (
  d_a, 
  l1clk, 
  q_b);
input [0:0] d_a;
input l1clk;
output [0:0] q_b;






tisram_blb #(1)  d0_0 (
.d(d_a[0:0]),
.l1clk(l1clk),
.latout_l(q_b[0:0])
);










//place::generic_place($width,$stack,$left);

endmodule









// any PARAMS parms go into naming of macro

module n2_l2d_ctrlio_cust_msff_ctl_macro__fs_1__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;

  input [2:0] din;
  input l1clk;
  input [2:0] scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output [2:0] scan_out;
assign fdin[2:0] = din[2:0];






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si(scan_in[2:0]),
.so(scan_out[2:0]),
.q(dout[2:0])
);












endmodule









//
//   invert macro
//
//





module n2_l2d_ctrlio_cust_inv_macro__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






inv #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);









endmodule




