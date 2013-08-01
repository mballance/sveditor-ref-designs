// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: spc_mb0_ctl.v
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
module spc_mb0_ctl (
  scan_out, 
  mb0_done, 
  mb0_run, 
  mb0_addr, 
  mb0_cmpsel, 
  mb0_ict_read_en, 
  mb0_ict_write_en, 
  mb0_icd_read_en, 
  mb0_icd_write_en, 
  mb0_icv_read_en, 
  mb0_icv_write_en, 
  mb0_itb_read_en, 
  mb0_itb_write_en, 
  mb0_write_data, 
  mb0_dca_read_en, 
  mb0_dca_write_en, 
  mb0_dta_read_en, 
  mb0_dta_write_en, 
  mb0_dva_read_en, 
  mb0_dva_write_en, 
  mb0_lru_read_en, 
  mb0_lru_write_en, 
  mb0_dtb_read_en, 
  mb0_dtb_write_en, 
  mb0_stb_cam_read_en, 
  mb0_stb_cam_write_en, 
  mb0_stb_ram_read_en, 
  mb0_stb_ram_write_en, 
  mb0_cpq_read_en, 
  mb0_cpq_write_en, 
  mb0_mbist_fail, 
  mbi_cambist_run, 
  mbi_cambist_shift, 
  mbi_dis_clr_ubit, 
  mbi_init_to_zero, 
  mbi_dtb_cam_en_pre, 
  mbi_dtb_demap_en, 
  mbi_itb_cam_en_pre, 
  mbi_itb_demap_en, 
  mbi_repl_write, 
  mbi_demap_type, 
  mbi_ptag_data, 
  mbi_scm_cam_en_pre, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  lsu_misc_pmen, 
  mbist_start, 
  mbist_bisi_mode, 
  mbist_user_mode, 
  lsu_mbi_dca_fail, 
  lsu_mbi_dta_fail, 
  lsu_mbi_dva_fail, 
  lsu_mbi_lru_fail, 
  lsu_mbi_dtb_fail, 
  lsu_mbi_stb_cam_fail, 
  lsu_mbi_stb_ram_fail, 
  lsu_mbi_cpq_fail, 
  ftu_mbi_ict_fail, 
  ftu_mbi_icd_fail, 
  ftu_mbi_itb_fail, 
  ftu_mbi_icv_fail, 
  lsu_mbi_tlb_data_cmp, 
  lsu_mbi_tlb_cam_hit, 
  lsu_mbi_tlb_cam_mhit, 
  lsu_mbi_tlb_ctxt0_hit, 
  lsu_mbi_tlb_valid, 
  lsu_mbi_tlb_used, 
  lsu_mbi_scm_hit, 
  lsu_mbi_scm_mhit, 
  lsu_mbi_scm_hit_ptr, 
  lsu_mbi_scm_praw, 
  ftu_mbi_tlb_data_cmp, 
  ftu_mbi_tlb_cam_hit, 
  ftu_mbi_tlb_cam_mhit, 
  ftu_mbi_tlb_ctxt0_hit, 
  ftu_mbi_tlb_valid, 
  ftu_mbi_tlb_used, 
  mb1_mb0_fail, 
  mb2_mb0_fail, 
  mb1_mb0_done, 
  mb2_mb0_done);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire pmen_scanin;
wire pmen_scanout;
wire start_in;
wire misc_pmen_;
wire pmem_unused;
wire clock_enable;
wire l1clk_pm1;
wire array_usr_reg_scanin;
wire array_usr_reg_scanout;
wire [3:0] user_array_in;
wire [3:0] user_array;
wire user_addr_mode_reg_scanin;
wire user_addr_mode_reg_scanout;
wire user_addr_mode_in;
wire user_addr_mode;
wire user_start_addr_reg_scanin;
wire user_start_addr_reg_scanout;
wire [8:0] user_start_addr_in;
wire [8:0] user_start_addr;
wire user_stop_addr_reg_scanin;
wire user_stop_addr_reg_scanout;
wire [8:0] user_stop_addr_in;
wire [8:0] user_stop_addr;
wire user_incr_addr_reg_scanin;
wire user_incr_addr_reg_scanout;
wire [8:0] user_incr_addr_in;
wire [8:0] user_incr_addr;
wire user_data_mode_reg_scanin;
wire user_data_mode_reg_scanout;
wire user_data_mode_in;
wire user_data_mode;
wire user_data_reg_scanin;
wire user_data_reg_scanout;
wire [7:0] user_data_in;
wire [7:0] user_data;
wire user_cmpselinc_hold_reg_scanin;
wire user_cmpselinc_hold_reg_scanout;
wire user_cmpselinc_hold_in;
wire user_cmpselinc_hold;
wire user_cmpsel_reg_scanin;
wire user_cmpsel_reg_scanout;
wire [2:0] user_cmpsel_in;
wire [2:0] user_cmpsel;
wire user_loop_mode_reg_scanin;
wire user_loop_mode_reg_scanout;
wire user_loop_mode_in;
wire user_loop_mode;
wire ten_n_mode_reg_scanin;
wire ten_n_mode_reg_scanout;
wire ten_n_mode_in;
wire ten_n_mode;
wire user_cam_mode_reg_scanin;
wire user_cam_mode_reg_scanout;
wire user_cam_mode_in;
wire user_cam_mode;
wire user_cam_select_reg_scanin;
wire user_cam_select_reg_scanout;
wire [1:0] user_cam_sel_in;
wire [1:0] user_cam_sel;
wire user_cam_test_select_reg_scanin;
wire user_cam_test_select_reg_scanout;
wire [3:0] user_cam_test_sel_in;
wire [3:0] user_cam_test_sel;
wire user_bisi_wr_mode_reg_scanin;
wire user_bisi_wr_mode_reg_scanout;
wire user_bisi_wr_mode_in;
wire user_bisi_wr_mode;
wire user_bisi_rd_mode_reg_scanin;
wire user_bisi_rd_mode_reg_scanout;
wire user_bisi_rd_mode_in;
wire user_bisi_rd_mode;
wire mb_user_data_mode;
wire user_mode;
wire mb_user_addr_mode;
wire mb_user_cmpselinc_hold;
wire mb_ten_n_mode;
wire mb_user_loop_mode;
wire mb_user_cam_mode;
wire mb_user_ram_mode;
wire mb_user_bisi_wr_mode;
wire bisi_mode;
wire mb_user_bisi_rd_mode;
wire mb_user_bisi_rw_mode;
wire mb_default_bisi;
wire input_signals_reg_scanin;
wire input_signals_reg_scanout;
wire mb_enable_reg_scanin;
wire mb_enable_reg_scanout;
wire mb_enable;
wire mb_enable_out;
wire start;
wire config_reg_scanin;
wire config_reg_scanout;
wire [1:0] config_in;
wire [1:0] config_out;
wire start_transition;
wire end_transition;
wire reset_engine;
wire loop_again;
wire run;
wire loop_again_reg_scanin;
wire loop_again_reg_scanout;
wire stop_engine_l;
wire stop_engine_l_q;
wire cam_array_0;
wire [1:0] cam_sel;
wire cambist_d4;
wire run3;
wire cam_array_1;
wire cam_array_2;
wire cam_clear;
wire last_cam;
wire cambist;
wire cntl_msb;
wire cambist_delay_reg_scanin;
wire cambist_delay_reg_scanout;
wire cambist_d1;
wire cambist_d2;
wire cambist_d3;
wire cam_cntl_reg_scanin;
wire cam_cntl_reg_scanout;
wire [26:0] cam_in;
wire [26:0] cam_out;
wire cam_shift_reg_scanin;
wire cam_shift_reg_scanout;
wire cam_shift_val;
wire cam_shift;
wire cam_msb;
wire [1:0] cam_array_sel;
wire [3:0] cam_ctest;
wire sel_ctest_pass;
wire [2:0] cam_cseq;
wire sel_cseq_pass;
wire [14:0] cam_raw_addr;
wire ctest13;
wire cseq1;
wire ctest06;
wire cseq0;
wire ctest08;
wire ctest10;
wire [6:0] tlb_mhit_addr1;
wire [6:0] tlb_mhit_addr2;
wire tlb_same_addr;
wire mhit_begin;
wire [2:0] stb_mhit_addr1;
wire [2:0] stb_mhit_addr2;
wire stb_same_addr;
wire stb_cam_mhit_test;
wire [6:0] cam_addr;
wire crw0;
wire [1:0] cam_crw;
wire sel_crw_pass;
wire [2:0] cseq;
wire cseq2;
wire cseq3;
wire cseq4;
wire [1:0] crw;
wire crw1;
wire crw2;
wire crw3;
wire [6:0] tlb_addr;
wire [6:0] tlb_stb_addr;
wire stb_cam_pwk1_test;
wire cam_wr_en;
wire tlb_cam_gen_test;
wire tlb_cam_dmap_test;
wire tlb_cam_dmap2_test;
wire tlb_cam_walk1_test;
wire tlb_cam_rpwr_test;
wire tlb_cam_mhit_test;
wire stb_cam_gen_test;
wire ctest09;
wire stb_cam_bwk1_test;
wire stb_cam_bwk2_test;
wire cam_en_pre;
wire cam_zero;
wire end_shift;
wire dmap_en;
wire cam_rd_en;
wire tlb_rpwr_en;
wire tlb_dis_clr_bit;
wire mbist_dis_clr_ubit;
wire array_04;
wire array_08;
wire cam_en_reg_scanin;
wire cam_en_reg_scanout;
wire cam_en;
wire dmap_all;
wire dmap_real;
wire ctest07;
wire dmap_cntx;
wire dmap_page;
wire dmap_on;
wire [1:0] mbist_demap_type;
wire mbist_dtb_demap_en;
wire mbist_itb_demap_en;
wire mbist_stb_cam_en_pre;
wire mbist_dtb_cam_en_pre;
wire mbist_itb_cam_en_pre;
wire ctest00;
wire [3:0] ctest;
wire ctest01;
wire ctest02;
wire ctest03;
wire ctest04;
wire ctest05;
wire ctest11;
wire ctest12;
wire tlb;
wire stb;
wire cam_walk1;
wire mbist_ptag_data;
wire ptag_data;
wire [7:0] stb_data;
wire [7:0] walk1data;
wire [7:0] cam_data;
wire [7:0] tlb_data;
wire stb_cam_en;
wire stb_hit_cmp;
wire stb_hit_cmp_mhit_l;
wire exp_stb_cam_hit;
wire [2:0] exp_stb_hit_ptr;
wire exp_stb_mhit;
wire exp_stb_ld_partial_raw;
wire stb_hit_cmp_delay_scanin;
wire stb_hit_cmp_delay_scanout;
wire stb_hit_cmp_d1;
wire stb_hit_cmp_d2;
wire stb_hit_cmp_d3;
wire stb_hit_cmp_mhit_l_delay_scanin;
wire stb_hit_cmp_mhit_l_delay_scanout;
wire stb_hit_cmp_mhit_l_d1;
wire stb_hit_cmp_mhit_l_d2;
wire stb_hit_cmp_mhit_l_d3;
wire exp_stb_cam_hit_delay_scanin;
wire exp_stb_cam_hit_delay_scanout;
wire exp_stb_cam_hit_d1;
wire exp_stb_cam_hit_d2;
wire exp_stb_cam_hit_d3;
wire exp_stb_hit_ptr_delay_scanin;
wire exp_stb_hit_ptr_delay_scanout;
wire [2:0] exp_stb_hit_ptr_d1;
wire [2:0] exp_stb_hit_ptr_d2;
wire [2:0] exp_stb_hit_ptr_d3;
wire exp_stb_mhit_delay_scanin;
wire exp_stb_mhit_delay_scanout;
wire exp_stb_mhit_d1;
wire exp_stb_mhit_d2;
wire exp_stb_mhit_d3;
wire exp_stb_ld_partial_raw_delay_scanin;
wire exp_stb_ld_partial_raw_delay_scanout;
wire exp_stb_ld_partial_raw_d1;
wire exp_stb_ld_partial_raw_d2;
wire exp_stb_ld_partial_raw_d3;
wire stb_cam_hit_pass;
wire stb_hit_ptr_pass;
wire stb_mhit_pass;
wire stb_ld_partial_raw_pass;
wire cbist_stb_cam_fail;
wire cam_array_2_d3;
wire tlb_cam_en;
wire tlb_hit_cmp;
wire cam_valid_cmp;
wire cam_used_cmp;
wire tlb_cntx0_cmp;
wire exp_tlb_mhit;
wire tlb_data_cmp;
wire exp_cam_hit;
wire exp_valid;
wire exp_used;
wire exp_data_cmp;
wire exp_cntx0_hit;
wire cam_array_0_delay_scanin;
wire cam_array_0_delay_scanout;
wire cam_array_0_d1;
wire cam_array_0_d2;
wire cam_array_0_d3;
wire cam_array_0_d4;
wire cam_array_1_delay_scanin;
wire cam_array_1_delay_scanout;
wire cam_array_1_d1;
wire cam_array_1_d2;
wire cam_array_1_d3;
wire cam_array_1_d4;
wire cam_array_1_d5;
wire cam_array_2_delay_scanin;
wire cam_array_2_delay_scanout;
wire cam_array_2_d1;
wire cam_array_2_d2;
wire cam_hit_cmp_delay_scanin;
wire cam_hit_cmp_delay_scanout;
wire tlb_hit_cmp_d1;
wire tlb_hit_cmp_d2;
wire tlb_hit_cmp_d3;
wire tlb_hit_cmp_d4;
wire tlb_hit_cmp_d5;
wire tlb_hit_cmp_d6;
wire data_cmp_delay_scanin;
wire data_cmp_delay_scanout;
wire tlb_data_cmp_d1;
wire tlb_data_cmp_d2;
wire tlb_data_cmp_d3;
wire tlb_data_cmp_d4;
wire tlb_data_cmp_d5;
wire cam_valid_cmp_delay_scanin;
wire cam_valid_cmp_delay_scanout;
wire cam_valid_cmp_d1;
wire cam_valid_cmp_d2;
wire cam_valid_cmp_d3;
wire cam_valid_cmp_d4;
wire cam_valid_cmp_d5;
wire cam_used_cmp_delay_scanin;
wire cam_used_cmp_delay_scanout;
wire cam_used_cmp_d1;
wire cam_used_cmp_d2;
wire cam_used_cmp_d3;
wire cam_used_cmp_d4;
wire cam_used_cmp_d5;
wire exp_data_cmp_delay_scanin;
wire exp_data_cmp_delay_scanout;
wire exp_data_cmp_d1;
wire exp_data_cmp_d2;
wire exp_data_cmp_d3;
wire exp_data_cmp_d4;
wire exp_data_cmp_d5;
wire exp_valid_delay_scanin;
wire exp_valid_delay_scanout;
wire exp_valid_d1;
wire exp_valid_d2;
wire exp_valid_d3;
wire exp_valid_d4;
wire exp_valid_d5;
wire exp_used_delay_scanin;
wire exp_used_delay_scanout;
wire exp_used_d1;
wire exp_used_d2;
wire exp_used_d3;
wire exp_used_d4;
wire exp_used_d5;
wire tlb_cntx0_cmp_delay_scanin;
wire tlb_cntx0_cmp_delay_scanout;
wire tlb_cntx0_cmp_d1;
wire tlb_cntx0_cmp_d2;
wire tlb_cntx0_cmp_d3;
wire tlb_cntx0_cmp_d4;
wire tlb_cntx0_cmp_d5;
wire tlb_cntx0_cmp_d6;
wire exp_cam_hit_delay_scanin;
wire exp_cam_hit_delay_scanout;
wire exp_cam_hit_d1;
wire exp_cam_hit_d2;
wire exp_cam_hit_d3;
wire exp_cam_hit_d4;
wire exp_cam_hit_d5;
wire exp_cam_hit_d6;
wire exp_cntx0_hit_delay_scanin;
wire exp_cntx0_hit_delay_scanout;
wire exp_cntx0_hit_d1;
wire exp_cntx0_hit_d2;
wire exp_cntx0_hit_d3;
wire exp_cntx0_hit_d4;
wire exp_cntx0_hit_d5;
wire exp_cntx0_hit_d6;
wire exp_mhit_delay_scanin;
wire exp_mhit_delay_scanout;
wire exp_tlb_mhit_d1;
wire exp_tlb_mhit_d2;
wire exp_tlb_mhit_d3;
wire exp_tlb_mhit_d4;
wire exp_tlb_mhit_d5;
wire exp_tlb_mhit_d6;
wire dtlb_cam_hit_pass;
wire dtlb_cntx0_hit_pass;
wire dtlb_mhit_pass;
wire dtlb_valid_pass;
wire dtlb_used_pass;
wire dtlb_data_cmp_pass;
wire cbist_dtlb_cam_fail;
wire itlb_cam_hit_pass;
wire itlb_cntx0_hit_pass;
wire itlb_mhit_pass;
wire itlb_valid_pass;
wire itlb_used_pass;
wire itlb_data_cmp_pass;
wire cbist_itlb_cam_fail;
wire [26:0] qual_cam;
wire tlb_cam_intf_out_scanin;
wire tlb_cam_intf_out_scanout;
wire mbist_cambist_run;
wire mbist_cambist_shift;
wire mbist_init_to_zero;
wire mbist_repl_write;
wire cntl_reg_scanin;
wire cntl_reg_scanout;
wire [34:0] cntl_in;
wire [34:0] cntl_out;
wire [15:0] cntl_algr;
wire [15:0] next_algr;
wire sel_nextaddr_reset;
wire sel_nextaddr_restart;
wire overflow;
wire sel_nextaddr_incred;
wire cout_rw;
wire sel_nextaddr_same;
wire [8:0] start_addr;
wire [8:0] restart_addr;
wire [8:0] incred_addr;
wire [8:0] cntl_addr;
wire [2:0] cntl_rw;
wire [2:0] next_rw;
wire cntl_bisi;
wire [3:0] cntl_array_sel;
wire last_array;
wire [2:0] cntl_cmp_sel;
wire sel_cmp_pass;
wire [1:0] cntl_data_sel;
wire cntl_addr_mix;
wire addr_mix;
wire [3:0] cntl_march_element;
wire sel_march_1_pass;
wire cout_addr;
wire upaddr;
wire march_0;
wire march_1;
wire march_2;
wire march_6;
wire march_7;
wire [3:0] march_element_pre;
wire march_pre_0;
wire march_pre_1;
wire march_pre_2;
wire march_pre_6;
wire march_pre_7;
wire upaddr_pre;
wire [8:0] incr_addr;
wire [8:0] stop_addr;
wire sel_rw_pass;
wire one_cycle_march;
wire march_5;
wire five_cycle_march;
wire march_8;
wire two_cycle_march;
wire mem_wr_pbi;
wire march_3;
wire march_4;
wire rw_1;
wire rw_0;
wire rw_4;
wire mem_wr;
wire bisi_wr_mode;
wire bisi_rd_mode;
wire mem_rd_pbi;
wire mem_rd;
wire [8:0] adj_addr;
wire rw_3;
wire [8:0] mem_addr1;
wire true_data_l;
wire rw_2;
wire true_data;
wire [7:0] data_pat_sel;
wire [7:0] mem_data;
wire array_01;
wire array_02;
wire array_03;
wire array_05;
wire array_06;
wire array_07;
wire array_09;
wire array_10;
wire array_11;
wire array_12;
wire [8:0] mem_addr_mix0;
wire [8:0] mem_addr_mix1;
wire [8:0] mem_addr;
wire [3:0] array_sel;
wire cmp_0;
wire [2:0] cmp_sel;
wire cmp_1;
wire cmp_2;
wire cmp_3;
wire cmp_7;
wire [3:0] march_element;
wire [2:0] rw;
wire [1:0] cam_sel_cntl_out;
wire [3:0] ctest_cntl_out;
wire ctest_reg_scanin;
wire ctest_reg_scanout;
wire [3:0] ctest_out;
wire [2:0] cseq_cntl_out;
wire cseq_reg_scanin;
wire cseq_reg_scanout;
wire [2:0] cseq_out;
wire [3:0] array_sel_cntl_out;
wire array_sel_reg_scanin;
wire array_sel_reg_scanout;
wire [3:0] array_sel_out;
wire [2:0] cmp_sel_cntl_out;
wire cmp_sel_reg_scanin;
wire cmp_sel_reg_scanout;
wire [2:0] cmp_sel_out;
wire [3:0] march_element_cntl_out;
wire marche_element_reg_scanin;
wire marche_element_reg_scanout;
wire [3:0] march_element_out;
wire sel_rw_1_pass;
wire sel_rw_2_pass;
wire sel_rw_5_pass;
wire [2:0] mb_cmp_sel;
wire [8:0] mb_addr;
wire [7:0] mb_write_data;
wire mb_array_01_rd;
wire mb_array_02_rd;
wire mb_array_03_rd;
wire mb_array_04_rd;
wire mb_array_05_rd;
wire mb_array_06_rd;
wire mb_array_07_rd;
wire mb_array_08_rd;
wire mb_array_09_rd;
wire mb_array_10_rd;
wire mb_array_11_rd;
wire mb_array_12_rd;
wire mb_array_01_wr;
wire mb_array_02_wr;
wire mb_array_03_wr;
wire mb_array_04_wr;
wire mb_array_05_wr;
wire mb_array_06_wr;
wire mb_array_07_wr;
wire mb_array_08_wr;
wire mb_array_09_wr;
wire mb_array_10_wr;
wire mb_array_11_wr;
wire mb_array_12_wr;
wire mb_run;
wire msb_latch_scanin;
wire msb_latch_scanout;
wire msb_in;
wire msb_out;
wire mb_done;
wire [4:0] done_delay;
wire run3_transition_reg_scanin;
wire run3_transition_reg_scanout;
wire run3_out;
wire run3_transition;
wire done_delay_reg_scanin;
wire done_delay_reg_scanout;
wire [4:0] done_delay_in;
wire dca_fail;
wire lsu_mbi_dca_fail_sticky;
wire dta_fail;
wire lsu_mbi_dta_fail_sticky;
wire dva_fail;
wire lsu_mbi_dva_fail_sticky;
wire lru_fail;
wire lsu_mbi_lru_fail_sticky;
wire dtb_fail;
wire lsu_mbi_dtb_fail_sticky;
wire stb_cam_fail;
wire lsu_mbi_stb_cam_fail_sticky;
wire stb_ram_fail;
wire lsu_mbi_stb_ram_fail_sticky;
wire cpq_fail;
wire lsu_mbi_cpq_fail_sticky;
wire ict_fail;
wire ftu_mbi_ict_fail_sticky;
wire icd_fail;
wire ftu_mbi_icd_fail_sticky;
wire itb_fail;
wire ftu_mbi_itb_fail_sticky;
wire icv_fail;
wire ftu_mbi_icv_fail_sticky;
wire cbist_itlb_fail;
wire cbist_itlb_cam_fail_sticky;
wire cbist_dtlb_fail;
wire cbist_dtlb_cam_fail_sticky;
wire cbist_stb_fail;
wire cbist_stb_cam_fail_sticky;
wire fail_reg_scanin;
wire fail_reg_scanout;
wire mbist_fail_array;
wire mbist_fail_sticky;
wire valid_fail;
wire mb_fail;
wire out_mb_tcu_done_reg_scanin;
wire out_mb_tcu_done_reg_scanout;
wire mb_done_out;
wire out_mb_tcu_fail_reg_scanin;
wire out_mb_tcu_fail_reg_scanout;
wire mb_fail_out;
wire out_cmp_sel_reg_scanin;
wire out_cmp_sel_reg_scanout;
wire [2:0] mb_cmpsel_out;
wire out_run_mb_arrays_reg_scanin;
wire out_run_mb_arrays_reg_scanout;
wire mb_run_out;
wire out_data_mb_arrays_reg_scanin;
wire out_data_mb_arrays_reg_scanout;
wire [7:0] mb_write_data_out;
wire out_addr_mb_arrays_reg_scanin;
wire out_addr_mb_arrays_reg_scanout;
wire [8:0] mb_addr_out;
wire out_wr_mb_arrays_reg_scanin;
wire out_wr_mb_arrays_reg_scanout;
wire mb_array_01_wr_out;
wire mb_array_02_wr_out;
wire mb_array_03_wr_out;
wire mb_array_04_wr_out;
wire mb_array_05_wr_out;
wire mb_array_06_wr_out;
wire mb_array_07_wr_out;
wire mb_array_08_wr_out;
wire mb_array_09_wr_out;
wire mb_array_10_wr_out;
wire mb_array_11_wr_out;
wire mb_array_12_wr_out;
wire out_rd_mb_arrays_reg_scanin;
wire out_rd_mb_arrays_reg_scanout;
wire mb_array_01_rd_out;
wire mb_array_02_rd_out;
wire mb_array_03_rd_out;
wire mb_array_04_rd_out;
wire mb_array_05_rd_out;
wire mb_array_06_rd_out;
wire mb_array_07_rd_out;
wire mb_array_08_rd_out;
wire mb_array_09_rd_out;
wire mb_array_10_rd_out;
wire mb_array_11_rd_out;
wire mb_array_12_rd_out;
wire merged_fail_scanin;
wire merged_fail_scanout;
wire mb_fail_merged;
wire mb1_fail;
wire mb2_fail;
wire merged_done_scanin;
wire merged_done_scanout;
wire mb_done_merged;
wire mb1_done;
wire mb2_done;
wire mb0_fail;
wire spares_scanin;
wire spares_scanout;





// /////////////////////////////////////////////////////////////////////////////
// Outputs
// /////////////////////////////////////////////////////////////////////////////

   output		scan_out;

   output		mb0_done;
 

   output		mb0_run;
   output [15:0]	mb0_addr;
   output [2:0]		mb0_cmpsel;
   output		mb0_ict_read_en;
   output		mb0_ict_write_en;
   output		mb0_icd_read_en;
   output		mb0_icd_write_en;
   output		mb0_icv_read_en;
   output		mb0_icv_write_en;
   output		mb0_itb_read_en;
   output		mb0_itb_write_en;
   output [7:0]		mb0_write_data;

   output		mb0_dca_read_en;
   output		mb0_dca_write_en;
   output		mb0_dta_read_en;
   output		mb0_dta_write_en;
   output		mb0_dva_read_en;
   output		mb0_dva_write_en;
   output		mb0_lru_read_en;
   output		mb0_lru_write_en;
   output		mb0_dtb_read_en;
   output		mb0_dtb_write_en;
   output		mb0_stb_cam_read_en;
   output		mb0_stb_cam_write_en;
   output		mb0_stb_ram_read_en;
   output		mb0_stb_ram_write_en;
   output		mb0_cpq_read_en;
   output		mb0_cpq_write_en;

   output		mb0_mbist_fail;


   output		mbi_cambist_run;
   output		mbi_cambist_shift;
   output		mbi_dis_clr_ubit;
   output		mbi_init_to_zero;
   output		mbi_dtb_cam_en_pre;
   output		mbi_dtb_demap_en;
   output		mbi_itb_cam_en_pre;
   output		mbi_itb_demap_en;
   output		mbi_repl_write;

   output    [1:0]	mbi_demap_type;

// stb:   
   output		mbi_ptag_data;
   output		mbi_scm_cam_en_pre;

// /////////////////////////////////////////////////////////////////////////////
// Inputs
// /////////////////////////////////////////////////////////////////////////////

   input		l2clk;
   input		scan_in;
   input		tcu_pce_ov;             // scan signals
   input		tcu_clk_stop;
   input		tcu_aclk;
   input		tcu_bclk;
   input		tcu_scan_en;
   input		lsu_misc_pmen;		// Power management enable

   input		mbist_start;
   input		mbist_bisi_mode;
   input		mbist_user_mode;
 		


   input		lsu_mbi_dca_fail;
   input		lsu_mbi_dta_fail;
   input		lsu_mbi_dva_fail;
   input		lsu_mbi_lru_fail;
   input		lsu_mbi_dtb_fail;
   input		lsu_mbi_stb_cam_fail;
   input		lsu_mbi_stb_ram_fail;
   input		lsu_mbi_cpq_fail;
   input 		ftu_mbi_ict_fail;
   input 		ftu_mbi_icd_fail;
   input 		ftu_mbi_itb_fail;
   input 		ftu_mbi_icv_fail;
		

   input		lsu_mbi_tlb_data_cmp;
   input		lsu_mbi_tlb_cam_hit;
   input		lsu_mbi_tlb_cam_mhit;
   input		lsu_mbi_tlb_ctxt0_hit;
   input		lsu_mbi_tlb_valid;
   input		lsu_mbi_tlb_used;

   input		lsu_mbi_scm_hit;
   input		lsu_mbi_scm_mhit;
   input  [2:0]		lsu_mbi_scm_hit_ptr;
   input		lsu_mbi_scm_praw;


   input		ftu_mbi_tlb_data_cmp;
   input		ftu_mbi_tlb_cam_hit;
   input		ftu_mbi_tlb_cam_mhit;
   input		ftu_mbi_tlb_ctxt0_hit;
   input		ftu_mbi_tlb_valid;
   input		ftu_mbi_tlb_used;


   input		mb1_mb0_fail;
   input		mb2_mb0_fail;


   input		mb1_mb0_done;
   input		mb2_mb0_done;

   
// /////////////////////////////////////////////////////////////////////////////
// Scan Renames
// /////////////////////////////////////////////////////////////////////////////

assign pce_ov = tcu_pce_ov;
assign stop   = tcu_clk_stop;
assign siclk  = tcu_aclk;
assign soclk  = tcu_bclk;
assign se = tcu_scan_en;



////////////////////////////////////////////////////////////////////////////////
// Clock header
////////////////////////////////////////////////////////////////////////////////

spc_mb0_ctll1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk 		),
        .l1en   (1'b1		),
        .l1clk  (l1clk		),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

spc_mb0_ctlmsff_ctl_macro__width_3 pmen  (
	.scan_in(pmen_scanin),
	.scan_out(pmen_scanout),
	.l1clk    ( l1clk					),	// Must be connected to a free running clock
	.din      ({mbist_start, ~lsu_misc_pmen , 1'b0}		),
	.dout     ({start_in   ,  misc_pmen_    , pmem_unused}	),
  .siclk(siclk),
  .soclk(soclk));


assign clock_enable	= start_in | mb0_done | mb0_run | mb0_mbist_fail | misc_pmen_;

spc_mb0_ctll1clkhdr_ctl_macro clkgen_pm1 (
        .l2clk  (l2clk 		),
        .l1en   (clock_enable	),
        .l1clk  (l1clk_pm1	),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));


// /////////////////////////////////////////////////////////////////////////////
//
// user mode resgisters   
// MBIST PGM Control Register
//
// /////////////////////////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// user control registers
//                         size
// -  user_array            4
// -  user_addr_mode        1
// -  user_start_addr      15
// -  user_stop_addr       15
// -  user_inc_addr        15
// -  user_data_mode        1
// -  user_data             8
// -  user_cmpselinc_mode   1
// -  user_cmpselinc        3
// -  user_loop_mode        1
// -  user_cam_select       2
// -  user_cam_test_sel     4
////////////////////////////////////////////////////////////////////////////////


   spc_mb0_ctlmsff_ctl_macro__width_4 array_usr_reg  (
                  .scan_in(array_usr_reg_scanin),
                  .scan_out(array_usr_reg_scanout),
                  .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_array_in[3:0]   ),
  		  .dout     ( user_array[3:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_array_in[3:0]=user_array[3:0];


   // user address mode

   spc_mb0_ctlmsff_ctl_macro__width_1 user_addr_mode_reg  (
                  .scan_in(user_addr_mode_reg_scanin),
                  .scan_out(user_addr_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	            ),
  	          .din      ( user_addr_mode_in     ),
  		  .dout     ( user_addr_mode        ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_addr_mode_in=user_addr_mode;
   

   //  user start address
   
  spc_mb0_ctlmsff_ctl_macro__width_9 user_start_addr_reg  (
                 .scan_in(user_start_addr_reg_scanin),
                 .scan_out(user_start_addr_reg_scanout),
                 .l1clk    ( l1clk_pm1	               ),
                 .din      ( user_start_addr_in[8:0]   ),
                 .dout     ( user_start_addr[8:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_start_addr_in[8:0]=user_start_addr[8:0];

   //  user stop address
   
  spc_mb0_ctlmsff_ctl_macro__width_9 user_stop_addr_reg  (
                 .scan_in(user_stop_addr_reg_scanin),
                 .scan_out(user_stop_addr_reg_scanout),
                 .l1clk    ( l1clk_pm1	              ),
                 .din      ( user_stop_addr_in[8:0]   ),
                 .dout     ( user_stop_addr[8:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_stop_addr_in[8:0]=user_stop_addr[8:0];
   

  //  user increment address
   
  spc_mb0_ctlmsff_ctl_macro__width_9 user_incr_addr_reg  (
                 .scan_in(user_incr_addr_reg_scanin),
                 .scan_out(user_incr_addr_reg_scanout),
                 .l1clk    ( l1clk_pm1	              ),
                 .din      ( user_incr_addr_in[8:0]   ),
                 .dout     ( user_incr_addr[8:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_incr_addr_in[8:0]=user_incr_addr[8:0];

   // user data mode

   spc_mb0_ctlmsff_ctl_macro__width_1 user_data_mode_reg  (
                  .scan_in(user_data_mode_reg_scanin),
                  .scan_out(user_data_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	            ),
  	          .din      ( user_data_mode_in     ),
   		  .dout     ( user_data_mode        ),
  .siclk(siclk),
  .soclk(soclk));

							 
   assign user_data_mode_in=user_data_mode;

   //  user data select
   
   spc_mb0_ctlmsff_ctl_macro__width_8 user_data_reg  (
                 .scan_in(user_data_reg_scanin),
                 .scan_out(user_data_reg_scanout),
                 .l1clk    ( l1clk_pm1	         ),
                 .din      ( user_data_in[7:0]   ),
                 .dout     ( user_data[7:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_data_in[7:0]    =    user_data[7:0];

   // user cmp sel inc
   // if its one, user need to program the cmpselinc register
   // otherwise it will loop all cmpsel

   spc_mb0_ctlmsff_ctl_macro__width_1 user_cmpselinc_hold_reg  (
                  .scan_in(user_cmpselinc_hold_reg_scanin),
                  .scan_out(user_cmpselinc_hold_reg_scanout),
                  .l1clk    ( l1clk_pm1	               ),
  	          .din      ( user_cmpselinc_hold_in   ),
   		  .dout     ( user_cmpselinc_hold      ),
  .siclk(siclk),
  .soclk(soclk));

							 
   assign user_cmpselinc_hold_in=user_cmpselinc_hold;



   // user cmp sel reg
   
   spc_mb0_ctlmsff_ctl_macro__width_3 user_cmpsel_reg  (
                  .scan_in(user_cmpsel_reg_scanin),
                  .scan_out(user_cmpsel_reg_scanout),
                  .l1clk    ( l1clk_pm1	            ),
  	          .din      ( user_cmpsel_in[2:0]   ),
  		  .dout     ( user_cmpsel[2:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_cmpsel_in[2:0]=user_cmpsel[2:0];


   // user loop mode

   spc_mb0_ctlmsff_ctl_macro__width_1 user_loop_mode_reg  (
                  .scan_in(user_loop_mode_reg_scanin),
                  .scan_out(user_loop_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	            ),
  	          .din      ( user_loop_mode_in     ),
  		  .dout     ( user_loop_mode        ),
  .siclk(siclk),
  .soclk(soclk));

  
   assign user_loop_mode_in=user_loop_mode;

   
   // 10N Algorithm for bit mapping

   spc_mb0_ctlmsff_ctl_macro__width_1 ten_n_mode_reg  (
                  .scan_in(ten_n_mode_reg_scanin),
                  .scan_out(ten_n_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	        ),
  	          .din      ( ten_n_mode_in     ),
  		  .dout     ( ten_n_mode        ),
  .siclk(siclk),
  .soclk(soclk));

  
   assign ten_n_mode_in=ten_n_mode;





   // cambist: user array select

   spc_mb0_ctlmsff_ctl_macro__width_1 user_cam_mode_reg  (
                  .scan_in(user_cam_mode_reg_scanin),
                  .scan_out(user_cam_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	         ),
  	          .din      ( user_cam_mode_in   ),
  		  .dout     ( user_cam_mode      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_cam_mode_in=user_cam_mode;


   spc_mb0_ctlmsff_ctl_macro__width_2 user_cam_select_reg  (
                  .scan_in(user_cam_select_reg_scanin),
                  .scan_out(user_cam_select_reg_scanout),
                  .l1clk    ( l1clk_pm1	             ),
  	          .din      ( user_cam_sel_in[1:0]   ),
  		  .dout     ( user_cam_sel[1:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_cam_sel_in[1:0]=user_cam_sel[1:0];


   spc_mb0_ctlmsff_ctl_macro__width_4 user_cam_test_select_reg  (
                  .scan_in(user_cam_test_select_reg_scanin),
                  .scan_out(user_cam_test_select_reg_scanout),
                  .l1clk    ( l1clk_pm1	                  ),
  	          .din      ( user_cam_test_sel_in[3:0]   ),
  		  .dout     ( user_cam_test_sel[3:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_cam_test_sel_in[3:0]=user_cam_test_sel[3:0];


   spc_mb0_ctlmsff_ctl_macro__width_1 user_bisi_wr_mode_reg  (
                  .scan_in(user_bisi_wr_mode_reg_scanin),
                  .scan_out(user_bisi_wr_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	                  ),
  	          .din      ( user_bisi_wr_mode_in   ),
  		  .dout     ( user_bisi_wr_mode      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_bisi_wr_mode_in=user_bisi_wr_mode;

   spc_mb0_ctlmsff_ctl_macro__width_1 user_bisi_rd_mode_reg  (
                  .scan_in(user_bisi_rd_mode_reg_scanin),
                  .scan_out(user_bisi_rd_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	                  ),
  	          .din      ( user_bisi_rd_mode_in   ),
  		  .dout     ( user_bisi_rd_mode      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_bisi_rd_mode_in=user_bisi_rd_mode;


   assign mb_user_data_mode = user_mode & user_data_mode;
   assign mb_user_addr_mode = user_mode & user_addr_mode;
   assign mb_user_cmpselinc_hold = user_mode & user_cmpselinc_hold;
   assign mb_ten_n_mode     = user_mode & ten_n_mode;
   assign mb_user_loop_mode      = user_mode & user_loop_mode;
   assign mb_user_cam_mode      = user_mode & user_cam_mode;
   assign mb_user_ram_mode = user_mode & ~user_cam_mode;



   assign mb_user_bisi_wr_mode   = user_mode & user_bisi_wr_mode & bisi_mode;
   assign mb_user_bisi_rd_mode   = user_mode & user_bisi_rd_mode & bisi_mode;

   assign mb_user_bisi_rw_mode   = ((~user_bisi_wr_mode & ~user_bisi_rd_mode) | (user_bisi_wr_mode & user_bisi_rd_mode)) & bisi_mode;

   assign mb_default_bisi = bisi_mode & ~user_mode;


// /////////////////////////////////////////////////////////////////////////////
//
// MBIST Config Register
//
// /////////////////////////////////////////////////////////////////////////////
//
// A low to high transition on mbist_start will reset and start the engine.  
// mbist_start must remain active high for the duration of MBIST.  
// If mbist_start deasserts the engine will stop but not reset.
// Once MBIST has completed mb0_done will assert and the fail status
// signals will be valid.  
// To run MBIST again the mbist_start signal must transition low then high.
//
// Loop on Address will disable the address mix function.
//
// /////////////////////////////////////////////////////////////////////////////

  // flop incoming signals:

  spc_mb0_ctlmsff_ctl_macro__width_2 input_signals_reg  (
                .scan_in(input_signals_reg_scanin),
                .scan_out(input_signals_reg_scanout),
                .l1clk   ( l1clk	                                 ),
               .din      ( {mbist_bisi_mode,mbist_user_mode} ),
               .dout     ( {bisi_mode      ,user_mode}       ),
  .siclk(siclk),
  .soclk(soclk));
  


  // default   : mb_enable=0
  // bisi      : mb_enable=0
  // user_mode : mb_enable=depend on programmed value

  spc_mb0_ctlmsff_ctl_macro__width_1 mb_enable_reg  (
               .scan_in(mb_enable_reg_scanin),
               .scan_out(mb_enable_reg_scanout),
               .l1clk    ( l1clk_pm1	       ),
               .din      ( mb_enable           ),
               .dout     ( mb_enable_out       ),
  .siclk(siclk),
  .soclk(soclk));

//assign mb_enable = user_mode ? mb_enable_out : 1'b0;
  assign mb_enable = mb_enable_out;

 
  assign start = user_mode ? (mb_enable_out & start_in) :
                              start_in;




  spc_mb0_ctlmsff_ctl_macro__width_2 config_reg  (
               .scan_in(config_reg_scanin),
               .scan_out(config_reg_scanout),
               .l1clk    ( l1clk_pm1	        ),
               .din      ( config_in[1:0]       ),
               .dout     ( config_out[1:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   
  assign config_in[0]        =    start;
  assign config_in[1]        =    config_out[0];
  assign start_transition    =    config_out[0] & ~config_out[1];
  assign end_transition      =   ~config_out[0] &  config_out[1];
  assign reset_engine        =    start_transition | loop_again  | end_transition;
  assign run                 =    config_out[1] ;



  spc_mb0_ctlmsff_ctl_macro__width_1 loop_again_reg  (
               .scan_in(loop_again_reg_scanin),
               .scan_out(loop_again_reg_scanout),
               .l1clk    ( l1clk_pm1	    ),
               .din      ( stop_engine_l    ),
               .dout     ( stop_engine_l_q  ),
  .siclk(siclk),
  .soclk(soclk));


assign loop_again=mb_user_loop_mode ? stop_engine_l & ~stop_engine_l_q:  1'b0;


// config



   // cam selection

   assign cam_array_0   = (cam_sel[1:0]==2'b00) & (cambist_d4 & run3);
   assign cam_array_1   = (cam_sel[1:0]==2'b01) & (cambist_d4 & run3);
   assign cam_array_2   = (cam_sel[1:0]==2'b10) & (cambist_d4 & run3);
   assign cam_clear     = (cam_sel[1:0]==2'b11) & (cambist_d4 & run3);

   assign last_cam = cam_clear;

  //  default   mode   :  cambist = cntl_msb
  //  mb_user_cam_mode :  cambist = 1
  //  mbist_bisi_mode  :  cambist = 0



  assign cambist=((mb_user_cam_mode | (cntl_msb & ~bisi_mode)) & run3 );

   


   spc_mb0_ctlmsff_ctl_macro__width_4 cambist_delay_reg  (
                  .scan_in(cambist_delay_reg_scanin),
                  .scan_out(cambist_delay_reg_scanout),
                  .l1clk    ( l1clk_pm1	         ),
  	          .din      ( {cambist,cambist_d1,cambist_d2,cambist_d3}  ),
  		  .dout     ( {cambist_d1,cambist_d2,cambist_d3,cambist_d4}  ),
  .siclk(siclk),
  .soclk(soclk));


   
// /////////////////////////////////////////////////////////////////////////////
//
// CAM BIST:
//
// /////////////////////////////////////////////////////////////////////////////




   spc_mb0_ctlmsff_ctl_macro__width_27 cam_cntl_reg  (
                 .scan_in(cam_cntl_reg_scanin),
                 .scan_out(cam_cntl_reg_scanout),
                 .l1clk    ( l1clk_pm1	        ),
                 .din      ( cam_in[26:0]       ),
                 .dout     ( cam_out[26:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   spc_mb0_ctlmsff_ctl_macro__width_1 cam_shift_reg  (
                 .scan_in(cam_shift_reg_scanin),
                 .scan_out(cam_shift_reg_scanout),
                 .l1clk    ( l1clk_pm1	        ),
                 .din      ( cam_shift_val      ),
                 .dout     ( cam_shift          ),
  .siclk(siclk),
  .soclk(soclk));




   // stbcam

   // 
  

   // tlb_op
   //              000   - tlb cam
   //              001   - demap page
   //              010   - demap real
   //              011   - demap context
   //              100   - demap all
   //              101   - replacement write
   //              110   - multiple hit
   //              111   - used bit 
   //              
   
   
   // clear 0       0    - clear
   // ^(W1CmRdW0)   1    - test
   // work


   // test0:
   //
   // ^(W0);
   // ^(W1C1RvW0);
   // seq0
   //   crw0
   // seq1
   //   crw0
   //   crw1
   //   crw2
   //   crw2

   assign cam_msb                 =     ~start_in ? 1'b0 : cam_out[26];    //

   assign cam_array_sel[1:0]        =   (user_mode | last_cam  ) ? 2'b11:
                                                                    cam_out[25:24];    // 2 bits

   assign cam_ctest[3:0]             =   sel_ctest_pass | user_mode? 4'b1111:
                                                     cam_out[23:20];    //   




   assign cam_cseq[2:0]                =   sel_cseq_pass  ? 3'b111 :  cam_out[19:17];   


//   assign stb_bwk2_cseq3 = cam_array_0 & stb_cam_bwk2_test & cseq3 ;
//   assign stb_pwk1_cseq3 = cam_array_0 & (~stb_cam_pwk1_test & cseq3);
//   assign stb_mhit_cseq3 = cam_array_0 & (stb_cam_mhit_test & cseq3);
//   assign dtb_mhit_cseq3 = cam_array_0 & (tlb_cam_mhit_test & cseq3);
//   assign itb_mhit_cseq3 = cam_array_2 & (tlb_cam_mhit_test & cseq3);

   assign cam_raw_addr[14:0] =  (cam_array_0 & ctest13 & cseq1) ? { 1'b1, cam_out[15:9],cam_out[8:2]}:
                                (cam_array_1 & ctest13 & cseq1) ? { 2'b11,cam_out[14:9],1'b1,cam_out[7:2]}:
//                                (cam_array_2 & ctest10 & cseq1) ? { 2'b11,cam_out[14:9],1'b1,cam_out[7:2]}:
                                 cam_array_0 | cam_clear          ? { 8'b1111_1111   ,cam_out[8:2]}:
                                (cam_array_2 & ctest06 & ~cseq0)  ? { 6'b1111_11,   cam_out[10:2]}:
                                (cam_array_2 & ctest08 & ~cseq0)  ? { 6'b1111_11,   cam_out[10:2]}:
                                (cam_array_2 & ctest10 & ~cseq0)  ? { 6'b1111_11,   cam_out[10:2]}:
                                (cam_array_1 | cam_array_2)       ? { 9'b1111_1111_1 ,cam_out[7:2]}:
                                                                   cam_out[16:2];

//   assign cam_raw_addr[14:0] =  stb_bwk2_cseq3    ?  { 9'b1111_1111_1 ,cam_out[7:5],3'b111}:  
//                                stb_mhit_cseq3    ?  { 5'b1111_1      ,cam_out[11:2]}:
//                                stb_pwk1_cseq3    ?  { 9'b1111_1111_1,cam_out[7:2]}:
// 	                            dtb_mhit_cseq3    ?                    cam_out[16:2]:
// 	                            itb_mhit_cseq3    ?  {1'b1,cam_out[15:9],1'b1,cam_out[7:2]}:
//                                  cam_array_1    ?  { 9'b1111_1111_1,cam_out[7:2]}:     
//                                  cam_array_0    ?  { 8'b1111_1111 ,cam_out[8:2]}:

// 	                                                                   cam_out[16:2];

   // tlb mhit addressing
   assign tlb_mhit_addr1[6:0]=cam_raw_addr[13:7];
   assign tlb_mhit_addr2[6:0]=cam_raw_addr[6:0];
   assign tlb_same_addr=tlb_mhit_addr1[6:0]==tlb_mhit_addr2[6:0];

   assign mhit_begin= (cseq1 & ctest13 & ((cam_array_0 & ~(|tlb_mhit_addr2[6:0]) | (cam_array_1 & ~(|tlb_mhit_addr2[5:0]))))) |
                      (cseq1 & ctest10 & (cam_array_2 & ~(|tlb_mhit_addr2[2:0]))) ;

   // stb mhit addressing

   assign stb_mhit_addr1[2:0]=cam_raw_addr[5:3];
   assign stb_mhit_addr2[2:0]=cam_raw_addr[2:0];
//   assign stb_mhit_clear=cam_raw_addr[3];
   assign stb_same_addr=(stb_mhit_addr1[2:0] == stb_mhit_addr2[2:0]) & stb_cam_mhit_test & cseq1;


   assign cam_addr[6:0] = (cam_array_2 & mhit_begin & crw0)               ? {cam_raw_addr[6:3],stb_mhit_addr1[2:0]} :
                          ((cam_array_1|cam_array_0) & mhit_begin & crw0) ? tlb_mhit_addr1[6:0] : 
                          (cam_array_2)                                   ? {1'b0,cam_raw_addr[5:0]} :
                                                                            cam_raw_addr[6:0];


   // read write control:


   assign cam_crw[1:0]               =  sel_crw_pass ?  2'b11 : cam_out[1:0];    // read write control


   // decoding of control signals

   assign cseq0 = cseq[2:0]==3'b000;
   assign cseq1 = cseq[2:0]==3'b001;
   assign cseq2 = cseq[2:0]==3'b010;
   assign cseq3 = cseq[2:0]==3'b011;
   assign cseq4 = cseq[2:0]==3'b100;


   assign crw0 = ~( crw[1] |  crw[0]);
   assign crw1 = ~( crw[1] | ~crw[0]);
   assign crw2 = ~(~crw[1] |  crw[0]);
   assign crw3 = ~(~crw[1] | ~crw[0]);
   



   assign tlb_addr[6:0]= stb_cam_mhit_test & cseq1 ? {1'b0,cam_raw_addr[8:6],cam_addr[2:0]} :
                                                     cam_addr[6:0];

   assign tlb_stb_addr[6:0]= (stb_cam_pwk1_test & cseq1) ? {1'b0,cam_raw_addr[8:6],3'b000} : tlb_addr[6:0];

   assign cam_wr_en  =  (tlb_cam_gen_test & cseq0 & crw0) |
                        (tlb_cam_gen_test & cseq1 & (crw0 | crw3)) |
                        (tlb_cam_dmap_test & cseq0 & crw0 ) |
                        (tlb_cam_dmap2_test & cseq0 & crw0 ) |
                        (tlb_cam_walk1_test & cseq0 & crw0 ) |
                        (tlb_cam_rpwr_test & cseq0 & crw0 ) |
                        (tlb_cam_rpwr_test & cseq1 & crw0 ) |
                        (tlb_cam_rpwr_test & cseq3 & crw0 ) |
                        (tlb_cam_rpwr_test & cseq4 & (crw0 | crw2) ) |
                        (tlb_cam_mhit_test & cseq0 & crw0 ) |
//                        (tlb_cam_mhit_test & cseq2 & crw0 ) |
                        (tlb_cam_mhit_test & cseq1 & ((crw1 | crw3) & ~tlb_same_addr)) |
                        (tlb_cam_mhit_test & cseq1 & (crw0 & mhit_begin)) |

                        (stb_cam_mhit_test & cseq0 & crw0 ) |
                        (stb_cam_mhit_test & cseq1 & ((crw1 | crw3) & ~stb_same_addr)) |
                        (stb_cam_mhit_test & cseq1 & (crw0 & mhit_begin)) |
                        (stb_cam_gen_test  & cseq0 & crw0) |
                        (stb_cam_gen_test  & ~ctest09 & cseq1 & (crw0 | crw2)) |
//                        (stb_cam_mhit_test  & cseq2 & crw0) |
                        (stb_cam_pwk1_test  & cseq0 & crw0) |
                        (stb_cam_bwk1_test  & cseq0 & crw0) |
                        (stb_cam_bwk2_test  & cseq0 & crw0) |
                        (stb_cam_bwk2_test  & cseq1 & (crw0 | crw2)) |
                        (cam_clear  & cseq1) ;

   assign cam_en_pre     =  (tlb_cam_gen_test & cseq1 & crw0) |
                            (cam_array_0 & tlb_cam_walk1_test & cseq1 & (cam_zero | (cam_shift & ~(end_shift) ) | (cam_addr[6:0]==7'd0))) |
                            (cam_array_1 & tlb_cam_walk1_test & cseq1 & (cam_zero | (cam_shift & ~(end_shift) ) | (cam_addr[5:0]==6'd0))) |
                            (tlb_cam_mhit_test & cseq1 & crw1 & ~tlb_same_addr) |
                            (stb_cam_mhit_test & cseq1 & crw1 & ~stb_same_addr) |
                            (stb_cam_gen_test  & cseq1 & crw0) |
                            (stb_cam_pwk1_test & cseq1 & crw0 &         (cam_zero | (cam_shift & ~(end_shift) ) | (cam_addr[5:0]==6'd0))) |
                            (stb_cam_bwk2_test & cseq1 & crw0) |
                            (stb_cam_bwk1_test & (((cam_addr[5:0]==6'd63) & cseq0) | (~(cam_addr[5:0]==6'd63) & cseq1))) ;

   // can't have dmap and cam_en on at same time

   assign dmap_en       =   (cam_array_0 & tlb_cam_dmap_test & cseq1 & crw0 & (~|cam_addr[6:0])) |
                            (cam_array_0 & tlb_cam_dmap2_test & cseq1 & (~|cam_addr[6:0])) |
                            (cam_array_1 & tlb_cam_dmap_test & cseq1 & (~|cam_addr[5:0])) |
                            (cam_array_1 & tlb_cam_dmap2_test & cseq1 & ~|cam_addr[5:0]);


   assign cam_rd_en  =  (tlb_cam_gen_test & cseq1 & crw2) |
                        (tlb_cam_dmap_test & cseq2 & crw0) |
                        (tlb_cam_dmap2_test & cseq2 & crw0) |
                        (tlb_cam_rpwr_test & cseq1 & crw1) |
                        (tlb_cam_rpwr_test & cseq3 & crw1) |
                        (tlb_cam_rpwr_test & cseq4 & crw3);

   assign tlb_rpwr_en =    (tlb_cam_rpwr_test  & cseq1 & crw0) |
                           (tlb_cam_rpwr_test  & cseq3 & crw0) |
                           (tlb_cam_rpwr_test  & cseq4 & crw2) ;

   assign tlb_dis_clr_bit = (tlb_cam_rpwr_test & (cseq0 | cseq3 | cseq4)) | 
                                                 tlb_cam_gen_test |
                                                 tlb_cam_dmap_test |
                                                 tlb_cam_dmap2_test |
                                                 tlb_cam_walk1_test |
                                                 tlb_cam_mhit_test ;

   assign mbist_dis_clr_ubit=(tlb_dis_clr_bit | array_04 | array_08);




   spc_mb0_ctlmsff_ctl_macro__width_1 cam_en_reg  (
                 .scan_in(cam_en_reg_scanin),
                 .scan_out(cam_en_reg_scanout),
                 .l1clk    ( l1clk_pm1	    ),
                 .din      ( cam_en_pre     ),
                 .dout     ( cam_en         ),
  .siclk(siclk),
  .soclk(soclk));




   assign dmap_all  = ((ctest09 | (ctest10 & crw0)) & dmap_en);
   assign dmap_real = ((ctest07 | (ctest10 & crw3)) & dmap_en);
   assign dmap_cntx = ((ctest08 | (ctest10 & crw1)) & dmap_en);
   assign dmap_page = ((ctest06 | (ctest10 & crw2)) & dmap_en);



   assign dmap_on  = dmap_page | dmap_real | dmap_cntx | dmap_all;



   assign mbist_demap_type[1:0] = ({2{dmap_page}} & 2'b00) |
                                  ({2{dmap_real}} & 2'b01) |
                                  ({2{dmap_cntx}} & 2'b10) |
                                  ({2{dmap_all}}   & 2'b11);


  assign mbist_dtb_demap_en = dmap_on & cam_array_0;  // active only when dtlb is on
  assign mbist_itb_demap_en = dmap_on & cam_array_1;  // active only when itlb is on

  assign mbist_stb_cam_en_pre  = cam_array_2 & cam_en_pre;
  assign mbist_dtb_cam_en_pre  = cam_array_0 & cam_en_pre;
  assign mbist_itb_cam_en_pre  = cam_array_1 & cam_en_pre;

   // tcam   
   assign ctest00  =  ctest[3:0]==4'h0 & cambist;
   assign ctest01  =  ctest[3:0]==4'h1;
   assign ctest02  =  ctest[3:0]==4'h2;
   assign ctest03  =  ctest[3:0]==4'h3;
   assign ctest04  =  ctest[3:0]==4'h4;
   assign ctest05  =  ctest[3:0]==4'h5;

   // demap
   assign ctest06  =  ctest[3:0]==4'h6;
   assign ctest07  =  ctest[3:0]==4'h7;
   assign ctest08  =  ctest[3:0]==4'h8;
   assign ctest09  =  ctest[3:0]==4'h9;
   assign ctest10  =  ctest[3:0]==4'hA;

 
   assign ctest11  =  ctest[3:0]==4'hB;
   assign ctest12  =  ctest[3:0]==4'hC;
   assign ctest13  =  ctest[3:0]==4'hD;
//   assign ctest14  =  ctest[3:0]==4'hE;
//   assign ctest15  =  ~(~ctest[3] | ~ctest[2] | ~ctest[1] |  ctest[0]);
//   assign ctest16  =  ~(~ctest[3] | ~ctest[2] | ~ctest[1] | ~ctest[0]);



   assign tlb = cam_array_0 | cam_array_1;
   assign stb = cam_array_2;


   // stb generic cam test
   //     ^(W);^(----);
   //     seq2;seq3
   // 
   assign stb_cam_gen_test = stb &
                              (ctest00 |
                              ctest01 |
                              ctest02 |
                              ctest03 |
                              ctest04 |
                              ctest05 |
                              ctest09 );
                              

   assign stb_cam_pwk1_test = stb & (ctest06);


   // stb walking 1 byte_match
   // 



   // stb walking 1 ptag

   assign stb_cam_bwk1_test = stb & ctest07;                                


   assign stb_cam_bwk2_test = stb & ctest08;

//   assign stb_cam_misc_test = stb & ctest09;                                

   assign stb_cam_mhit_test = stb & ctest10;

   ////// TLB  

   assign tlb_cam_gen_test =  tlb &
                              (ctest00 |
                               ctest01 |
                               ctest02 |
                               ctest03 |
                               ctest04 |
                               ctest05) ;



   assign tlb_cam_dmap_test = tlb & 
                              (ctest06 | 
                               ctest07 | 
                               ctest08 | 
                               ctest09 );

   assign tlb_cam_dmap2_test = tlb & (ctest10);



   assign tlb_cam_walk1_test = tlb & ctest11;

   assign tlb_cam_rpwr_test =  tlb & ctest12;

   assign tlb_cam_mhit_test =  tlb & ctest13;


   assign cam_walk1 = (tlb_cam_walk1_test & cseq1) | (stb_cam_pwk1_test | stb_cam_bwk1_test | stb_cam_bwk2_test) ;


//   assign end_shift_pre =  ((cam_array_0 | cam_array_1) & tlb_cam_walk1_test) ?  cam_walk1 & (tlb_addr[5:0]==6'd51) :
//                            cam_array_2 & stb_cam_pwk1_test ?  cam_walk1 & (tlb_addr[5:0]==6'd36) :
//                                                               cam_walk1 & (tlb_addr[2:0]==3'd7) ;


   assign end_shift = cam_array_0 ? cam_walk1 & (tlb_addr[6:0]==7'd52) :
                      cam_array_1 ? cam_walk1 & (tlb_addr[5:0]==6'd52) :
                      cam_array_2 & stb_cam_pwk1_test ?  cam_walk1 & (tlb_addr[5:0]==6'd37) :
                                                         cam_walk1 & (tlb_addr[2:0]==3'd7) ;



   assign cam_zero  = (cam_array_0 & tlb_cam_walk1_test & cseq1 & (cam_addr[6:0]==7'b0000001)) |
                      (cam_array_1 & tlb_cam_walk1_test & cseq1 & (cam_addr[5:0]==6'b000001)) |
                      (cam_array_2 & stb_cam_pwk1_test & cseq1 &  (cam_addr[5:0]==6'b000001)) |
                      (cam_array_2 & stb_cam_bwk1_test & cseq1 & ~|cam_addr[2:0]) ;
                     


  
  assign cam_shift_val =   ~cambist | end_shift  ? 1'b0 :
                           cam_zero & (cseq1 | cseq3)   ? 1'b1 :
                                                  cam_shift;
                                           


   

   // data assignments

  assign mbist_ptag_data = ptag_data;

   // cam data assignment

  assign ptag_data     = (ctest00 & cseq1 & (crw0 |crw1)) |
                         (ctest01 & cseq0)        |
                         (ctest01 & cseq1 & crw2) |
                         (ctest02 & cseq1 & (crw0 | crw1)) |
                         (ctest03 & cseq1 & (crw0 | crw1)) |
                         (ctest04 & cseq1 & (crw0 | crw1)) |
                         (ctest05 & cseq1 & (crw0 | crw1)) |
                         (ctest07 ) |
                         (ctest09 ) |
                         (ctest10 & cseq1 & (crw1 | crw2) ) |
                         (ctest10 & cseq1 & crw0 & mhit_begin ) ;


  assign stb_data[7:0] = ({8{(ctest00 & cseq0)        }} & 8'b00000000) |
                         ({8{(ctest00 & cseq1 & crw0 )}} & 8'b11111111) |
                         ({8{(ctest00 & cseq1 & crw1 )}} & 8'b11111111) |
                         ({8{(ctest00 & cseq1 & crw3 )}} & 8'b00000000) |
                         ({8{(ctest01 & cseq0)        }} & 8'b00000000) |
                         ({8{(ctest01 & cseq1 & crw0 )}} & 8'b11111111) |
                         ({8{(ctest01 & cseq1 & crw1 )}} & 8'b11111111) |
                         ({8{(ctest01 & cseq1 & crw3 )}} & 8'b00000000) |
                         ({8{(ctest02 & cseq0)        }} & 8'h00) |
                         ({8{(ctest02 & cseq1 & crw0 )}} & 8'hAA) |
                         ({8{(ctest02 & cseq1 & crw1 )}} & 8'hFF) |
                         ({8{(ctest02 & cseq1 & crw3 )}} & 8'h00) |
                         ({8{(ctest03 & cseq0)        }} & 8'h00) |
                         ({8{(ctest03 & cseq1 & crw0 )}} & 8'h55) |
                         ({8{(ctest03 & cseq1 & crw1 )}} & 8'hFF) |
                         ({8{(ctest03 & cseq1 & crw3 )}} & 8'h00) |
                         ({8{(ctest04 & cseq0)        }} & 8'h00) |
                         ({8{(ctest04 & cseq1 & crw0 )}} & 8'h55) |
                         ({8{(ctest04 & cseq1 & crw1 )}} & 8'h55) |
                         ({8{(ctest04 & cseq1 & crw3 )}} & 8'h00) |
                         ({8{(ctest05 & cseq0)        }} & 8'h00) |
                         ({8{(ctest05 & cseq1 & crw0 )}} & 8'hAA) |
                         ({8{(ctest05 & cseq1 & crw1 )}} & 8'hAA) |
                         ({8{(ctest05 & cseq1 & crw3 )}} & 8'h00) |
                         ({8{(ctest06 & cseq0)        }} & 8'hFF) |
                         ({8{(ctest06 & cseq1 & crw0 )}} & 8'hFF) |
                         ({8{(ctest07 & cseq0)        }} & 8'h00) |
                         ({8{(ctest07 & cam_zero     )}} & 8'h01) |
                         ({8{(ctest07 & cam_shift     )}} & {mb0_write_data[6:0],1'b0}) |
                         ({8{(ctest08 & cseq0         )}} & 8'h00) |
                         ({8{(ctest08 & cseq1 & crw0  )}} & 8'hFF) |
                         ({8{(ctest08 & cseq1 & crw1  )}} & walk1data[7:0]) |
                         ({8{(ctest08 & cseq1 & crw2  )}} & 8'h00) |
                         ({8{(ctest10 & cseq1 & crw1  )}} & 8'hFF) |
                         ({8{(ctest10 & cseq1 & crw2  )}} & 8'hFF) |
                         ({8{(ctest10 & cseq0 & crw0  )}} & 8'h00) |
                         ({8{(ctest10 & cseq1 & mhit_begin & crw0  )}} & 8'hFF) ;

  assign walk1data[7:0] = ({8{cam_raw_addr[8:6]==3'b000}} & 8'b0000_0001) |
                          ({8{cam_raw_addr[8:6]==3'b001}} & 8'b0000_0010) |
                          ({8{cam_raw_addr[8:6]==3'b010}} & 8'b0000_0100) |
                          ({8{cam_raw_addr[8:6]==3'b011}} & 8'b0000_1000) |
                          ({8{cam_raw_addr[8:6]==3'b100}} & 8'b0001_0000) |
                          ({8{cam_raw_addr[8:6]==3'b101}} & 8'b0010_0000) |
                          ({8{cam_raw_addr[8:6]==3'b110}} & 8'b0100_0000) |
                          ({8{cam_raw_addr[8:6]==3'b111}} & 8'b1000_0000) ;
                         
  assign cam_data[7:0] = cam_clear   ? 8'h00 :
                         cam_array_2 ? stb_data[7:0] : 
                                       tlb_data[7:0];



   // 7 ( nothing)
   // 6 used
   // 5 real
   // 4 valid
   // 3 context0
   // 2 context1
   // 1 PID
   // 0 oter (va)

                         
  assign tlb_data[7:0] = ({8{(ctest00 & cseq0)        }} & 8'b10101111) | // ^(W0)
                         ({8{(ctest00 & cseq1 & crw0 )}} & 8'b10111111) | // W1
                         ({8{(ctest00 & cseq1 & crw1 )}} & 8'b10110011) | // C1
                         ({8{(ctest00 & cseq1 & crw3 )}} & 8'b10101111) | // W0

                         ({8{(ctest01 & cseq0)        }} & 8'b00100000) |
                         ({8{(ctest01 & cseq1 & crw0 )}} & 8'b00110000) | // W1
                         ({8{(ctest01 & cseq1 & crw1 )}} & 8'b00101100) | // C1
                         ({8{(ctest01 & cseq1 & crw3 )}} & 8'b00100000) | // W0

                         ({8{(ctest02 & cseq0)        }} & 8'b10001111) |
                         ({8{(ctest02 & cseq1 & crw0 )}} & 8'b10011111) | // W1
                         ({8{(ctest02 & cseq1 & crw1 )}} & 8'b10010111) | // C1
                         ({8{(ctest02 & cseq1 & crw3 )}} & 8'b10001111) | // W0

                         ({8{(ctest03 & cseq0)        }} & 8'b10001111) |
                         ({8{(ctest03 & cseq1 & crw0 )}} & 8'b10011111) | // W1
                         ({8{(ctest03 & cseq1 & crw1 )}} & 8'b10011011) | // C1
                         ({8{(ctest03 & cseq1 & crw3 )}} & 8'b10001111) | // W0

                         ({8{(ctest04 & cseq0)        }} & 8'b00000000) |
                         ({8{(ctest04 & cseq1 & crw0 )}} & 8'b00010000) | // W1
                         ({8{(ctest04 & cseq1 & crw1 )}} & 8'b00001000) | // C1
                         ({8{(ctest04 & cseq1 & crw3 )}} & 8'b00000000) | // W0

                         ({8{(ctest05 & cseq0)        }} & 8'b00000000) |
                         ({8{(ctest05 & cseq1 & crw0 )}} & 8'b00010000) | // W1
                         ({8{(ctest05 & cseq1 & crw1 )}} & 8'b00000100) | // C1
                         ({8{(ctest05 & cseq1 & crw3 )}} & 8'b00000000) | // W0

                         ({8{(ctest06 & cseq0)        }} & 8'b00010000) |
                         ({8{(ctest06 & cseq1 )}}        & 8'b00001000) |

                         ({8{(ctest07 & cseq0)        }} & 8'b10111111) |
                         ({8{(ctest07 & cseq1 )}}        & 8'b00100010) |

                         ({8{(ctest08 & cseq0)        }} & 8'b00010000) |
                         ({8{(ctest08 & cseq1 )}}        & 8'b10010101) |

                         ({8{(ctest09 & cseq0)        }} & 8'b10111111) |
                         ({8{(ctest09 & cseq1 )}}        & 8'b00000010) |

                         ({8{(ctest10 & cseq0)        }} & 8'b00010000) |
                         ({8{(ctest10 & cseq1 & crw0 )}} & 8'b00000010) |
                         ({8{(ctest10 & cseq1 & crw1 )}} & 8'b00001100) |
                         ({8{(ctest10 & cseq1 & crw2 )}} & 8'b00001100) |
                         ({8{(ctest10 & cseq1 & crw3 )}} & 8'b00100000) |

                         ({8{(ctest11 & cseq0 & crw0 )}} & 8'b00010000) |

                         ({8{(ctest12 & cseq0 & crw0 )}} & 8'b00000000) |
                         ({8{(ctest12 & cseq1 & crw0 )}} & 8'b01010000) |
                         ({8{(ctest12 & cseq3 & crw0 )}} & 8'b01010000) |
                         ({8{(ctest12 & cseq4 & crw0 )}} & 8'b01000000) |
                         ({8{(ctest12 & cseq4 & crw2 )}} & 8'b01010000) |

                         ({8{(ctest13 & cseq0 & crw0 )}} & 8'b00000000) |
                         ({8{(ctest13 & cseq1 & crw0 )}} & 8'b10111111) |
                         ({8{(ctest13 & cseq1 & crw1 )}} & 8'b10111111) |
                         ({8{(ctest13 & cseq1 & crw2 )}} & 8'b10111111) |
                         ({8{(ctest13 & cseq1 & crw3 )}} & 8'b00000000) ;




//  assign tlb_sb_mhit      =(tlb_cam_gen_test   & cseq1 & crw1) |
//                           (tlb_cam_walk1_test & cseq1 & crw0) |
//                           (tlb_cam_mhit_test  & cseq1 & crw1) ;

//  assign tlb_sb_camhit    =(tlb_cam_gen_test   & cseq1 & crw1) |
//                           (tlb_cam_walk1_test & cseq1 & crw0) |
//                           (tlb_cam_mhit_test  & cseq1 & crw1) ;

//  assign tlb_sb_data_cmp  =(tlb_cam_gen_test   & cseq1 & crw1) |
//                           (tlb_cam_rpwr_test  & cseq1 & crw1) |
//                           (tlb_cam_rpwr_test  & cseq2 & crw1) |
//                           (tlb_cam_rpwr_test  & cseq3 & crw2);

//  assign tlb_sb_cntx0_hit =(ctest02  & cseq1 & crw1) |
//                           (ctest03  & cseq1 & crw1) |
//                           (ctest04  & cseq1 & crw1) |
//                           (ctest05  & cseq1 & crw1) ;


  
//  assign tlb_sb_valid     =(tlb_cam_gen_test   & cseq1 & crw2) |
//                           (tlb_cam_dmap_test  & cseq2 & crw0) |
//                           (tlb_cam_dmap2_test & cseq2 & crw0) ;

//  assign tlb_sb_ubit      =(tlb_cam_gen_test   & cseq1 & crw2) |
//                           (tlb_cam_walk1_test & cseq2 & crw0) ;

    // stb
    assign stb_cam_en             = cam_en & cam_array_2;
    assign stb_hit_cmp            = stb_cam_en;
    assign stb_hit_cmp_mhit_l     = stb_cam_en & ~ctest10;
    assign exp_stb_cam_hit        = ~(ctest06 | ctest07 | ctest09);
    assign exp_stb_hit_ptr[2:0]   = (ctest07 | ctest09) ? 3'b000: mb0_addr[2:0];
    assign exp_stb_mhit           = ctest10;
    assign exp_stb_ld_partial_raw = (ctest02 | ctest03);


   spc_mb0_ctlmsff_ctl_macro__width_3 stb_hit_cmp_delay  (
                 .scan_in(stb_hit_cmp_delay_scanin),
                 .scan_out(stb_hit_cmp_delay_scanout),
                 .l1clk    ( l1clk_pm1	                                    ),
                 .din      ({stb_hit_cmp,   stb_hit_cmp_d1, stb_hit_cmp_d2} ),
                 .dout     ({stb_hit_cmp_d1,stb_hit_cmp_d2, stb_hit_cmp_d3}),
  .siclk(siclk),
  .soclk(soclk));



   spc_mb0_ctlmsff_ctl_macro__width_3 stb_hit_cmp_mhit_l_delay  (
                 .scan_in(stb_hit_cmp_mhit_l_delay_scanin),
                 .scan_out(stb_hit_cmp_mhit_l_delay_scanout),
                 .l1clk    ( l1clk_pm1	                                    ),
                 .din      ({stb_hit_cmp_mhit_l,   stb_hit_cmp_mhit_l_d1, stb_hit_cmp_mhit_l_d2} ),
                 .dout     ({stb_hit_cmp_mhit_l_d1,stb_hit_cmp_mhit_l_d2, stb_hit_cmp_mhit_l_d3}),
  .siclk(siclk),
  .soclk(soclk));

   spc_mb0_ctlmsff_ctl_macro__width_3 exp_stb_cam_hit_delay  (
                 .scan_in(exp_stb_cam_hit_delay_scanin),
                 .scan_out(exp_stb_cam_hit_delay_scanout),
                 .l1clk    ( l1clk_pm1	                                                ),
                 .din      ({exp_stb_cam_hit,   exp_stb_cam_hit_d1, exp_stb_cam_hit_d2} ),
                 .dout     ({exp_stb_cam_hit_d1,exp_stb_cam_hit_d2, exp_stb_cam_hit_d3}),
  .siclk(siclk),
  .soclk(soclk));


   spc_mb0_ctlmsff_ctl_macro__width_9 exp_stb_hit_ptr_delay  (
                 .scan_in(exp_stb_hit_ptr_delay_scanin),
                 .scan_out(exp_stb_hit_ptr_delay_scanout),
                 .l1clk    ( l1clk_pm1	                                                               ),
                 .din      ({exp_stb_hit_ptr[2:0],   exp_stb_hit_ptr_d1[2:0], exp_stb_hit_ptr_d2[2:0]} ),
                 .dout     ({exp_stb_hit_ptr_d1[2:0],exp_stb_hit_ptr_d2[2:0], exp_stb_hit_ptr_d3[2:0]}),
  .siclk(siclk),
  .soclk(soclk));


   spc_mb0_ctlmsff_ctl_macro__width_3 exp_stb_mhit_delay  (
                 .scan_in(exp_stb_mhit_delay_scanin),
                 .scan_out(exp_stb_mhit_delay_scanout),
                 .l1clk    ( l1clk_pm1	                                       ),
                 .din      ({exp_stb_mhit,   exp_stb_mhit_d1, exp_stb_mhit_d2} ),
                 .dout     ({exp_stb_mhit_d1,exp_stb_mhit_d2, exp_stb_mhit_d3}),
  .siclk(siclk),
  .soclk(soclk));


   spc_mb0_ctlmsff_ctl_macro__width_3 exp_stb_ld_partial_raw_delay  (
                 .scan_in(exp_stb_ld_partial_raw_delay_scanin),
                 .scan_out(exp_stb_ld_partial_raw_delay_scanout),
                 .l1clk    ( l1clk_pm1	                                                                     ),
                 .din      ({exp_stb_ld_partial_raw,   exp_stb_ld_partial_raw_d1, exp_stb_ld_partial_raw_d2} ),
                 .dout     ({exp_stb_ld_partial_raw_d1,exp_stb_ld_partial_raw_d2, exp_stb_ld_partial_raw_d3}),
  .siclk(siclk),
  .soclk(soclk));


     assign stb_cam_hit_pass             = (~stb_hit_cmp_d3)        | (stb_hit_cmp_d3          & (exp_stb_cam_hit_d3 == lsu_mbi_scm_hit));
     assign stb_hit_ptr_pass             = (~stb_hit_cmp_mhit_l_d3) | (stb_hit_cmp_mhit_l_d3   & (exp_stb_hit_ptr_d3[2:0] == lsu_mbi_scm_hit_ptr[2:0]));
     assign stb_mhit_pass                = (~stb_hit_cmp_d3)        | (stb_hit_cmp_d3          & (exp_stb_mhit_d3 == lsu_mbi_scm_mhit));
     assign stb_ld_partial_raw_pass      = (~stb_hit_cmp_mhit_l_d3) | (stb_hit_cmp_mhit_l_d3   & (exp_stb_ld_partial_raw_d3 == lsu_mbi_scm_praw));

     assign cbist_stb_cam_fail = ~(stb_cam_hit_pass &
                             stb_hit_ptr_pass &
                             stb_mhit_pass &
                             stb_ld_partial_raw_pass ) & cam_array_2_d3;
                             
    // tlb
    assign tlb_cam_en    = (cam_en & (cam_array_0 | cam_array_1));
    assign tlb_hit_cmp   = tlb_cam_en;
//    assign cam_rd_cmp   = cam_rd_en;
    assign cam_valid_cmp   = cam_rd_en;
    assign cam_used_cmp    = cam_rd_en & (~cseq1 & tlb_cam_rpwr_test);
    assign tlb_cntx0_cmp = (ctest02 | ctest03 | ctest04 | ctest05 | ctest06 | ctest05) & (cam_array_0 | cam_array_1) & cam_en;
    assign exp_tlb_mhit = (tlb_cam_mhit_test);
    assign tlb_data_cmp = (~ctest13 | ~ctest12) ? 1'b0 : tlb_hit_cmp;

    assign exp_cam_hit  = (tlb_cam_gen_test | tlb_cam_mhit_test & cseq1);
    assign exp_valid    = (tlb_cam_gen_test | tlb_cam_dmap2_test | tlb_cam_rpwr_test) ;
    assign exp_used     = (tlb_cam_gen_test | tlb_cam_walk1_test | tlb_cam_rpwr_test);
    assign exp_data_cmp = (tlb_cam_gen_test);
    

    assign exp_cntx0_hit= (ctest03 | ctest05) & (cam_array_0 | cam_array_1);

   spc_mb0_ctlmsff_ctl_macro__width_4 cam_array_0_delay  (
                 .scan_in(cam_array_0_delay_scanin),
                 .scan_out(cam_array_0_delay_scanout),
                 .l1clk    ( l1clk_pm1	                                    ),
                 .din      ({cam_array_0,   cam_array_0_d1, cam_array_0_d2,cam_array_0_d3} ),
                 .dout     ({cam_array_0_d1,cam_array_0_d2, cam_array_0_d3,cam_array_0_d4}),
  .siclk(siclk),
  .soclk(soclk));

   spc_mb0_ctlmsff_ctl_macro__width_5 cam_array_1_delay  (
                 .scan_in(cam_array_1_delay_scanin),
                 .scan_out(cam_array_1_delay_scanout),
                 .l1clk    ( l1clk_pm1	                                    ),
                 .din      ({cam_array_1,   cam_array_1_d1, cam_array_1_d2, cam_array_1_d3,cam_array_1_d4} ),
                 .dout     ({cam_array_1_d1,cam_array_1_d2, cam_array_1_d3, cam_array_1_d4,cam_array_1_d5}),
  .siclk(siclk),
  .soclk(soclk));

   spc_mb0_ctlmsff_ctl_macro__width_3 cam_array_2_delay  (
                 .scan_in(cam_array_2_delay_scanin),
                 .scan_out(cam_array_2_delay_scanout),
                 .l1clk    ( l1clk_pm1	                                    ),
                 .din      ({cam_array_2,   cam_array_2_d1, cam_array_2_d2} ),
                 .dout     ({cam_array_2_d1,cam_array_2_d2, cam_array_2_d3}),
  .siclk(siclk),
  .soclk(soclk));



   spc_mb0_ctlmsff_ctl_macro__width_6 cam_hit_cmp_delay  (
                 .scan_in(cam_hit_cmp_delay_scanin),
                 .scan_out(cam_hit_cmp_delay_scanout),
                 .l1clk    ( l1clk_pm1	                                    ),
                 .din      ({tlb_hit_cmp,   tlb_hit_cmp_d1, tlb_hit_cmp_d2,tlb_hit_cmp_d3,tlb_hit_cmp_d4,tlb_hit_cmp_d5} ),
                 .dout     ({tlb_hit_cmp_d1,tlb_hit_cmp_d2, tlb_hit_cmp_d3,tlb_hit_cmp_d4,tlb_hit_cmp_d5,tlb_hit_cmp_d6}),
  .siclk(siclk),
  .soclk(soclk));


   spc_mb0_ctlmsff_ctl_macro__width_5 data_cmp_delay  (
                 .scan_in(data_cmp_delay_scanin),
                 .scan_out(data_cmp_delay_scanout),
                 .l1clk    ( l1clk_pm1	                                    ),
                 .din      ({tlb_data_cmp,   tlb_data_cmp_d1, tlb_data_cmp_d2,tlb_data_cmp_d3,tlb_data_cmp_d4} ),
                 .dout     ({tlb_data_cmp_d1,tlb_data_cmp_d2, tlb_data_cmp_d3,tlb_data_cmp_d4,tlb_data_cmp_d5}),
  .siclk(siclk),
  .soclk(soclk));


//   msff_ctl_macro cam_rd_cmp_delay (width=3) (
//                 .scan_in(cam_rd_cmp_delay_scanin),
//                 .scan_out(cam_rd_cmp_delay_scanout),
//                 .l1clk    ( l1clk_pm1	                           ),
//                 .din      ({cam_rd_cmp,   cam_rd_cmp_d1, cam_rd_cmp_d2} ),
//                 .dout     ({cam_rd_cmp_d1,cam_rd_cmp_d2, cam_rd_cmp_d3}));



   spc_mb0_ctlmsff_ctl_macro__width_5 cam_valid_cmp_delay  (
                 .scan_in(cam_valid_cmp_delay_scanin),
                 .scan_out(cam_valid_cmp_delay_scanout),
                 .l1clk    ( l1clk_pm1	                                                         ),
                 .din      ({cam_valid_cmp,   
                             cam_valid_cmp_d1, 
                             cam_valid_cmp_d2,
                             cam_valid_cmp_d3,
                             cam_valid_cmp_d4} ),
                 .dout     ({cam_valid_cmp_d1,
                             cam_valid_cmp_d2, 
                             cam_valid_cmp_d3,
                             cam_valid_cmp_d4,
                             cam_valid_cmp_d5}),
  .siclk(siclk),
  .soclk(soclk));


   spc_mb0_ctlmsff_ctl_macro__width_5 cam_used_cmp_delay  (
                 .scan_in(cam_used_cmp_delay_scanin),
                 .scan_out(cam_used_cmp_delay_scanout),
                 .l1clk    ( l1clk_pm1	                                                         ),
                 .din      ({cam_used_cmp,   
                             cam_used_cmp_d1, 
                             cam_used_cmp_d2,
                             cam_used_cmp_d3,
                             cam_used_cmp_d4} ),
                 .dout     ({cam_used_cmp_d1,
                             cam_used_cmp_d2, 
                             cam_used_cmp_d3,
                             cam_used_cmp_d4,
                             cam_used_cmp_d5}),
  .siclk(siclk),
  .soclk(soclk));



   spc_mb0_ctlmsff_ctl_macro__width_5 exp_data_cmp_delay  (
                 .scan_in(exp_data_cmp_delay_scanin),
                 .scan_out(exp_data_cmp_delay_scanout),
                 .l1clk    ( l1clk_pm1	                              ),
                 .din      ({exp_data_cmp,   exp_data_cmp_d1, exp_data_cmp_d2,exp_data_cmp_d3, exp_data_cmp_d4} ),
                 .dout     ({exp_data_cmp_d1,exp_data_cmp_d2, exp_data_cmp_d3,exp_data_cmp_d4, exp_data_cmp_d5}),
  .siclk(siclk),
  .soclk(soclk));

   spc_mb0_ctlmsff_ctl_macro__width_5 exp_valid_delay  (
                 .scan_in(exp_valid_delay_scanin),
                 .scan_out(exp_valid_delay_scanout),
                 .l1clk    ( l1clk_pm1	                              ),
                 .din      ({exp_valid,   exp_valid_d1, exp_valid_d2,exp_valid_d3,exp_valid_d4} ),
                 .dout     ({exp_valid_d1,exp_valid_d2, exp_valid_d3,exp_valid_d4,exp_valid_d5}),
  .siclk(siclk),
  .soclk(soclk));


   spc_mb0_ctlmsff_ctl_macro__width_5 exp_used_delay  (
                 .scan_in(exp_used_delay_scanin),
                 .scan_out(exp_used_delay_scanout),
                 .l1clk    ( l1clk_pm1	                           ),
                 .din      ({exp_used,   exp_used_d1, exp_used_d2,exp_used_d3,exp_used_d4} ),
                 .dout     ({exp_used_d1,exp_used_d2, exp_used_d3,exp_used_d4,exp_used_d5}),
  .siclk(siclk),
  .soclk(soclk));


   spc_mb0_ctlmsff_ctl_macro__width_6 tlb_cntx0_cmp_delay  (
                 .scan_in(tlb_cntx0_cmp_delay_scanin),
                 .scan_out(tlb_cntx0_cmp_delay_scanout),
                 .l1clk    ( l1clk_pm1	                                          ),
                 .din      ({tlb_cntx0_cmp,   tlb_cntx0_cmp_d1, tlb_cntx0_cmp_d2, tlb_cntx0_cmp_d3,tlb_cntx0_cmp_d4,tlb_cntx0_cmp_d5} ),
                 .dout     ({tlb_cntx0_cmp_d1,tlb_cntx0_cmp_d2, tlb_cntx0_cmp_d3, tlb_cntx0_cmp_d4,tlb_cntx0_cmp_d5,tlb_cntx0_cmp_d6}),
  .siclk(siclk),
  .soclk(soclk));


   spc_mb0_ctlmsff_ctl_macro__width_6 exp_cam_hit_delay  (
                 .scan_in(exp_cam_hit_delay_scanin),
                 .scan_out(exp_cam_hit_delay_scanout),
                 .l1clk    ( l1clk_pm1	                                    ),
                 .din      ({exp_cam_hit,   exp_cam_hit_d1, exp_cam_hit_d2,exp_cam_hit_d3,exp_cam_hit_d4,exp_cam_hit_d5} ),
                 .dout     ({exp_cam_hit_d1,exp_cam_hit_d2, exp_cam_hit_d3,exp_cam_hit_d4,exp_cam_hit_d5,exp_cam_hit_d6}),
  .siclk(siclk),
  .soclk(soclk));

   spc_mb0_ctlmsff_ctl_macro__width_6 exp_cntx0_hit_delay  (
                 .scan_in(exp_cntx0_hit_delay_scanin),
                 .scan_out(exp_cntx0_hit_delay_scanout),
                 .l1clk    ( l1clk_pm1	                                          ),
                 .din      ({exp_cntx0_hit,   exp_cntx0_hit_d1, exp_cntx0_hit_d2, exp_cntx0_hit_d3,exp_cntx0_hit_d4,exp_cntx0_hit_d5} ),
                 .dout     ({exp_cntx0_hit_d1,exp_cntx0_hit_d2, exp_cntx0_hit_d3, exp_cntx0_hit_d4,exp_cntx0_hit_d5,exp_cntx0_hit_d6}),
  .siclk(siclk),
  .soclk(soclk));


   spc_mb0_ctlmsff_ctl_macro__width_6 exp_mhit_delay  (
                 .scan_in(exp_mhit_delay_scanin),
                 .scan_out(exp_mhit_delay_scanout),
                 .l1clk    ( l1clk_pm1	                                       ),
                 .din      ({exp_tlb_mhit,   exp_tlb_mhit_d1, exp_tlb_mhit_d2, exp_tlb_mhit_d3,exp_tlb_mhit_d4,exp_tlb_mhit_d5} ),
                 .dout     ({exp_tlb_mhit_d1,exp_tlb_mhit_d2, exp_tlb_mhit_d3, exp_tlb_mhit_d4,exp_tlb_mhit_d5,exp_tlb_mhit_d6}),
  .siclk(siclk),
  .soclk(soclk));


   assign dtlb_cam_hit_pass   = (~tlb_hit_cmp_d4)        | (tlb_hit_cmp_d4   & (exp_cam_hit_d4 == lsu_mbi_tlb_cam_hit));
   assign dtlb_cntx0_hit_pass = (~tlb_cntx0_cmp_d4)      | (tlb_cntx0_cmp_d4 & (exp_cntx0_hit_d4 == lsu_mbi_tlb_ctxt0_hit));
   assign dtlb_mhit_pass      = (~tlb_hit_cmp_d4)        | (tlb_hit_cmp_d4   & (exp_tlb_mhit_d4 == lsu_mbi_tlb_cam_mhit));
   assign dtlb_valid_pass     = (~cam_valid_cmp_d4)      | (cam_valid_cmp_d4    & (exp_valid_d4 == lsu_mbi_tlb_valid));
   assign dtlb_used_pass      = (~cam_used_cmp_d4)       | (cam_used_cmp_d4    & (exp_used_d4 == lsu_mbi_tlb_used));
   assign dtlb_data_cmp_pass  = (~tlb_data_cmp_d4)       | (tlb_data_cmp_d4    & (exp_data_cmp_d4 == lsu_mbi_tlb_data_cmp));

   assign cbist_dtlb_cam_fail = ~(dtlb_cam_hit_pass & 
                            dtlb_cntx0_hit_pass & 
                            dtlb_mhit_pass & 
                            dtlb_valid_pass & 
                            dtlb_used_pass & 
                            dtlb_data_cmp_pass ) & cam_array_0_d4;




   assign itlb_cam_hit_pass   = (~tlb_hit_cmp_d6)        | (tlb_hit_cmp_d6   & (exp_cam_hit_d6 == ftu_mbi_tlb_cam_hit));
   assign itlb_cntx0_hit_pass = (~tlb_cntx0_cmp_d6)      | (tlb_cntx0_cmp_d6 & (exp_cntx0_hit_d6 == ftu_mbi_tlb_ctxt0_hit));
   assign itlb_mhit_pass      = (~tlb_hit_cmp_d6)        | (tlb_hit_cmp_d6   & (exp_tlb_mhit_d6 == ftu_mbi_tlb_cam_mhit));
   assign itlb_valid_pass     = (~cam_valid_cmp_d5)      | (cam_valid_cmp_d5 & (exp_valid_d5 == ftu_mbi_tlb_valid));
   assign itlb_used_pass      = (~cam_used_cmp_d5)       | (cam_used_cmp_d5  & (exp_used_d5 == ftu_mbi_tlb_used));
   assign itlb_data_cmp_pass  = (~tlb_data_cmp_d5)       | (tlb_data_cmp_d5  & (exp_data_cmp_d5 == ftu_mbi_tlb_data_cmp));


   assign cbist_itlb_cam_fail = ~(itlb_cam_hit_pass & 
                            itlb_cntx0_hit_pass & 
                            itlb_mhit_pass & 
                            itlb_valid_pass & 
                            itlb_used_pass & 
                            itlb_data_cmp_pass ) & cam_array_1_d5;




   assign qual_cam[26:0]={cam_msb,            //  1  27
              			  cam_array_sel[1:0], //  2	 26		  
              			  cam_ctest[3:0],     //  4  24
              			  cam_cseq[2:0],          //  2  19
                          cam_raw_addr[14:0], // 15  17
			              cam_crw[1:0]};          //  2  
   

   
   assign cam_in[26:0]=((~cambist | ~cambist_d4) & run3) | reset_engine ? 27'b0: 
                       (cambist_d4 & run3)     ?      qual_cam[26:0]+27'h1:
	                                           qual_cam[26:0];
	                                      
   

/////////////////////////////////////////////////////////////////////////////////
//
// Mbist fail signals
//
// /////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////   
// Interface signal for cambist
// 
//
//
//////////////////////////////////////////////////////////////////////////////



spc_mb0_ctlmsff_ctl_macro__width_13		tlb_cam_intf_out  (
                   .scan_in(tlb_cam_intf_out_scanin),
                   .scan_out(tlb_cam_intf_out_scanout),
                   .l1clk( l1clk_pm1				),
                   .din  ({ mbist_cambist_run			,
                            mbist_cambist_shift			,
                            mbist_dis_clr_ubit			,
                            mbist_demap_type[1:0]		,
                            mbist_init_to_zero			,
                            mbist_stb_cam_en_pre		,
                            mbist_ptag_data			,
                            mbist_dtb_cam_en_pre		,
                            mbist_dtb_demap_en			,
                            mbist_itb_demap_en			,
                            mbist_itb_cam_en_pre		,
                            mbist_repl_write}			),
                   .dout ({ mbi_cambist_run			,
                            mbi_cambist_shift			,
                            mbi_dis_clr_ubit			,
                            mbi_demap_type[1:0]			,
                            mbi_init_to_zero			,
                            mbi_scm_cam_en_pre			,
                            mbi_ptag_data			,
                            mbi_dtb_cam_en_pre			,
                            mbi_dtb_demap_en			,
                            mbi_itb_demap_en			,
                            mbi_itb_cam_en_pre			,
                            mbi_repl_write}			),
  .siclk(siclk),
  .soclk(soclk));



//////////////////////////////////////////////////////////////////////
///  cam comparator:
//////////////////////////////////////////////////////////////////////



//assign cam_fail=~cam_pass;

assign mbist_cambist_run=(cambist & ~cam_clear) | cam_msb;
assign mbist_cambist_shift=(stb_cam_bwk1_test | stb_cam_bwk2_test) ? 1'b0 : cam_shift;
assign mbist_init_to_zero=(stb_cam_bwk1_test | stb_cam_bwk2_test) ? 1'b0 : cam_zero;
assign mbist_repl_write=tlb_rpwr_en;



// /////////////////////////////////////////////////////////////////////////////
//
// MBIST Control Register
//
// /////////////////////////////////////////////////////////////////////////////
// standard membist
// /////////////////////////////////////////////////////////////////////////////
//   0       1       2       3      4      5          6         7        8
// ^(W0);^(R0W1);^(R1W0);v(R0W1);v(R1W0);v(R0);^(W1W0*R1R0W0);v(W1);^(W0W1*R0R1W1);
//   
// - there are 9 march elements in the engine
//   march_0 - march_8 indicate which march element it's in
//
// - for each march element, there are write and read sequences and for some
//   just write or just read
// 
// - for each march element, it can move upaddr (0-max) or downaddr (max-0)
//
//       march      rw       upaddr                    truedata
// --------------------------------------------------------------------------------
//    -  march_0    w          1    one_cycle_march       rw_0        ^(W0)
//    -  march_1    rw         1    two_cycle_march       rw_0        ^(R0W1)
//    -  march_2    rw         1    two_cycle_march       rw_1        ^(R1W0)
//    -  march_3    rw         0    two_cycle_march       rw_0        v(R0W1)
//    -  march_4    rw         0    two_cycle_march       rw_1        v(R1W0)
//    -  march_5    r          0    one_cycle_march       rw_0        v(R0)
//    -  march_6    wwrrw      1    five_cycle_march      rw_1,3,4    ^(W1W0*R1R0W0)
//    -  march_7    w          0    one_cycle_march       --          v(W1)
//    -  march_8    wwrrw      1    five_cycle_march      rw_0,2      ^(W0W1*R0R1W1)
// mbist address:
//    one_cycle_march  : march_0 | march_5 | march_7
//    five_cycle_march : march_6 | march_8
//    two_cycle_march  : ~(one_cycle_march | five_cycle_march)

   ////////////////////////////////////////////////////////////////////////////////
   //////  user mode signals

// the different between cntl_march and march is that march is before mux and
// and cntl_march is after mux

// /////////////////////////////////////////////////////////////////////////////
//
// MBIST Control Register
//
// /////////////////////////////////////////////////////////////////////////////
// standard membist
// /////////////////////////////////////////////////////////////////////////////
//   0       1       2       3      4      5          6         7        8
// ^(W0);^(R0W1);^(R1W0);v(R0W1);v(R1W0);v(R0);^(W1W0*R1R0W0);v(W1);^(W0W1*R0R1W1);
//   
// - there are 9 march elements in the engine
//   march_0 - march_8 indicate which march element it's in
//
// - for each march element, there are write and read sequences and for some
//   just write or just read
// 
// - for each march element, it can move upaddr (0-max) or downaddr (max-0)
//
//       march      rw       upaddr                    truedata
// --------------------------------------------------------------------------------
//    -  march_0    w          1    one_cycle_march       rw_0        ^(W0)
//    -  march_1    rw         1    two_cycle_march       rw_0        ^(R0W1)
//    -  march_2    rw         1    two_cycle_march       rw_1        ^(R1W0)
//    -  march_3    rw         0    two_cycle_march       rw_0        v(R0W1)
//    -  march_4    rw         0    two_cycle_march       rw_1        v(R1W0)
//    -  march_5    r          0    one_cycle_march       rw_0        v(R0)
//    -  march_6    wwrrw      1    five_cycle_march      rw_1,3,4    ^(W1W0*R1R0W0)
//    -  march_7    w          0    one_cycle_march       --          v(W1)
//    -  march_8    wwrrw      1    five_cycle_march      rw_0,2      ^(W0W1*R0R1W1)
// mbist address:
//    one_cycle_march  : march_0 | march_5 | march_7
//    five_cycle_march : march_6 | march_8
//    two_cycle_march  : ~(one_cycle_march | five_cycle_march)

   ////////////////////////////////////////////////////////////////////////////////
   //////  user mode signals

// the different between cntl_march and march is that march is before mux and
// and cntl_march is after mux

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////   ////////////////////////////////////
//  CONTROL REG:
////////////////////////////////////   ////////////////////////////////////


   spc_mb0_ctlmsff_ctl_macro__width_28 cntl_reg  (
                 .scan_in(cntl_reg_scanin),
                 .scan_out(cntl_reg_scanout),
                 .l1clk    ( l1clk_pm1	                      ),
                 .din      ({cntl_in[34:19] ,cntl_in[11:0]}   ),
                 .dout     ({cntl_out[34:19],cntl_out[11:0]}  ),
  .siclk(siclk),
  .soclk(soclk));


   assign cntl_in[34:19]   = reset_engine      ? {16'b00000_0000000000}:
     	                     ~run3 | cambist   ? cntl_algr[15:0]:	  
	                                          next_algr[15:0];

   
   // reset_engine   run3    overflow   cout_rw    output
   // ---------------------------------------------------------
   //    1             x        x          x       start_addr
   //    0             0        x          x       cntl_addr
   //    0             1        1          x       restart_addr
   //    0             1        0          1       incred_addr
   //    0             1        0          0       cntl_addr                                     


   assign sel_nextaddr_reset    = reset_engine;
   assign sel_nextaddr_restart  = ~reset_engine & run3 & overflow;
   assign sel_nextaddr_incred   = ~reset_engine & run3 & ~overflow & cout_rw & ~cambist;
   assign sel_nextaddr_same     = ~(sel_nextaddr_reset | sel_nextaddr_restart | sel_nextaddr_incred) | cambist;

   assign cntl_in[11:3] = ({9{sel_nextaddr_reset}} & start_addr[8:0]) |
                          ({9{sel_nextaddr_restart}} & restart_addr[8:0]) |
                          ({9{sel_nextaddr_incred}} & incred_addr[8:0]) |
                          ({9{sel_nextaddr_same}} & cntl_addr[8:0]);  
   

   
   assign cntl_in[2:0]     = reset_engine  ? 3'b000 : 
                             (~run3 | cambist)          ? cntl_rw[2:0]:
                                             next_rw[2:0];



////////////////////////////////////   ////////////////////////////////////
//  NEXT ALGR
////////////////////////////////////   ////////////////////////////////////

   // msb
   assign cntl_msb                    =       start_in & cntl_out[34];    // done selection


   assign cntl_bisi                    =       mb_default_bisi | mb_user_bisi_rw_mode ? cntl_out[33] :
                                                                                        1'b1;

   // array
   assign cntl_array_sel[3:0]        =       (last_array | user_mode) ? 4'b1111:
                                                        cntl_out[32:29];    // array selection 
   // cmp
   assign cntl_cmp_sel[2:0]  = sel_cmp_pass ? {3'b111} :
                                              cntl_out[28:26];

   // data
   assign cntl_data_sel[1:0]          =   (bisi_mode | mb_user_data_mode)  ? 2'b11 :    cntl_out[25:24];    // data selection

   // address mix
   assign cntl_addr_mix               =   (bisi_mode | mb_user_addr_mode) ? 1'b1  : cntl_out[23];    // address mix
   assign addr_mix                    =   (bisi_mode | mb_user_addr_mode) ? 1'b0  : cntl_out[23];

   assign cntl_march_element[3:0]     =   sel_march_1_pass  ? 4'b1111:
                                                              cntl_out[22:19];    // march element


   assign cntl_algr[15:0] =       {cntl_msb,
                                   cntl_bisi,
                                   cntl_array_sel[3:0],
			           cntl_cmp_sel[2:0],
			           cntl_data_sel[1:0],
			           cntl_addr_mix,
			           cntl_march_element[3:0]};

   assign next_algr[15:0] = cout_addr ? cntl_algr[15:0] + 16'h1 : cntl_algr[15:0];         // mbist control



////////////////////////////////////   ////////////////////////////////////
//  NEXT ADDR
////////////////////////////////////   ////////////////////////////////////


   /////////////////////////
   // address engine
   /////////////////////////


   assign upaddr           =    march_0 | march_1 | march_2 | march_6 | march_7 | bisi_mode ;
                                

   assign march_element_pre[3:0]=next_algr[3:0];

   assign march_pre_0   = march_element_pre[3:0]==4'h0;
   assign march_pre_1   = march_element_pre[3:0]==4'h1;
   assign march_pre_2   = march_element_pre[3:0]==4'h2;
   assign march_pre_6   = march_element_pre[3:0]==4'h6;
   assign march_pre_7   = march_element_pre[3:0]==4'h7;

   assign upaddr_pre =     march_pre_0 | march_pre_1 | march_pre_2 | march_pre_6 | march_pre_7;


   assign incr_addr[8:0]  = mb_user_addr_mode ? user_incr_addr[8:0] :  9'b000000001;

   assign start_addr[8:0] = mb_user_addr_mode ? user_start_addr[8:0] : 9'b000000000;
   
   
//   assign next_addr_out[8:0] = cout_rw ? cntl_addr[8:0] + incr_addr[8:0] : cntl_addr[8:0];    // next address


   assign incred_addr[8:0] = cntl_addr[8:0] + incr_addr[8:0];


   assign overflow   = upaddr   ? ( cntl_addr[8:0] == stop_addr[8:0])  & (cntl_rw[2:0]==3'b111):
                                  (~cntl_addr[8:0] == start_addr[8:0]) & (cntl_rw[2:0]==3'b111);


//   assign next_addr[8:0]= overflow ? restart_addr[8:0] : next_addr_out[8:0];
  
   assign restart_addr[8:0] = upaddr_pre ? start_addr[8:0] : ~stop_addr[8:0];
      
   assign cout_addr =  overflow;



////////////////////////////////////   ////////////////////////////////////
//  NEXT RW
////////////////////////////////////   ////////////////////////////////////


   assign cntl_rw[2:0]                =   sel_rw_pass      ? 3'b111: 
                                                               cntl_out[ 2: 0];    // read write control

   assign next_rw[2:0] = cntl_rw[2:0]+3'b001 ;              
   
   assign cout_rw = &cntl_rw[2:0];     // carry over for rw 



////////////////////////////////////   ////////////////////////////////////
//  MBIST CONTROL SIGNAL
//  - mem_wr
////////////////////////////////////   ////////////////////////////////////


   assign one_cycle_march  =  march_0 | march_5 | march_7;
   assign five_cycle_march =  march_6 | march_8;
   assign two_cycle_march  = ~(one_cycle_march | five_cycle_march);


   /////////////////////////
   // membist write enable
   /////////////////////////


    assign mem_wr_pbi     = run3 & (
                               march_0  |
                               ((march_1 | march_2 | march_3 | march_4 ) & rw_1) |
                               (march_6 & (rw_0 | rw_1 | rw_4)) |
                               march_7 |
                               (march_8 & (rw_0 | rw_1 | rw_4))
                               );  

   assign mem_wr = bisi_wr_mode ? 1'b1 :
                   bisi_rd_mode ? 1'b0 :
                                  mem_wr_pbi;
   /////////////////////////
   // membist read enable
   /////////////////////////

                                            

   assign mem_rd_pbi         =     run3   &      ~mem_wr;  

   assign mem_rd= bisi_rd_mode ? 1'b1 : mem_rd_pbi;
   /////////////////////
   // membist address:
   ////////////////////

   assign cntl_addr[8:0]   = cntl_out[11:3];

   assign adj_addr          = (five_cycle_march & (rw_1 | rw_3)) ? {cntl_addr[8:1],~cntl_addr[0]}:
                                                                      cntl_addr[8:0] ;

   assign mem_addr1[8:0]    = upaddr   ?  adj_addr[8:0]:  ~adj_addr[8:0];



   /////////////////////
   // true data
   ////////////////////

   assign true_data_l     =    bisi_mode |
                             march_0   |
                             (march_1 & rw_0)   |
                             (march_2 & rw_1)   |
                             (march_3 & rw_0)   |
                             (march_4 & rw_1)   |
                             (march_5)   |
                             (march_6 & (rw_1 | rw_3 | rw_4))   |
                             (march_8 & (rw_0 | rw_2));

   assign true_data=~true_data_l;

   /////////////////////
   // membist data:
   ////////////////////

   assign data_pat_sel[7:0]        =     (mb_user_data_mode & bisi_mode)     ?   ~user_data[7:0]:
                                         (mb_user_data_mode)                 ?    user_data[7:0]:
                                         bisi_mode                           ?    8'hFF:              
                                         (cntl_data_sel[1:0] == 2'h0)        ?    8'hAA:
                                         (cntl_data_sel[1:0] == 2'h1)        ?    8'h99:
                                         (cntl_data_sel[1:0] == 2'h2)        ?    8'hCC:
                                                                                  8'h00;
   assign mem_data[7:0]         = true_data ? data_pat_sel[7:0] : ~data_pat_sel[7:0];


////////////////////////////////////   ////////////////////////////////////
//  STOP ADDR
////////////////////////////////////   ////////////////////////////////////


   assign stop_addr[8:0]  = mb_user_addr_mode ? user_stop_addr[8:0]  : 
                                                   //               8_7654_3210
                                                   array_01   ?  9'b1_1111_1111:  // ict
                                                   array_02   ?  9'b1_1111_1111:  // icd
                                                   array_03   ?  9'b0_0001_1111:  // icv
                                                   array_04   ?  9'b0_0011_1111:  // itb
                                                   array_05   ?  9'b1_1111_1111:  // dca
                                                   array_06   ?  9'b1_1111_1111:  // dta
                                                   array_07   ?  9'b0_0001_1111:  // dva
                                                   array_08   ?  9'b0_0111_1111:  // dtlb
                                                   array_09   ?  9'b0_0001_1111:  // cpq
                                                   array_10   ?  9'b0_0011_1111:  // stbcam
                                                   array_11   ?  9'b0_0011_1111:  // stbram
                                                   array_12   ?  9'b0_0111_1111:  // lru
                                                                 9'b1_1111_1111;


////////////////////////////////////   ////////////////////////////////////
//  ADDR MIX
////////////////////////////////////   ////////////////////////////////////


   assign mem_addr_mix0[8:0]   =   (array_06) ? { mem_addr1[8:7],mem_addr1[5:0],mem_addr1[6]} :	// DTA fixed
                                                  mem_addr1[8:0];


   assign mem_addr_mix1[8:0]   =   (array_01) ? { mem_addr1[2:0],mem_addr1[8:3]}              :	// ICT fixed circuit
                                   (array_02) ? { mem_addr1[2:0],mem_addr1[8:3]}              :	// ICD fixed circuit
                                   (array_03) ? { mem_addr1[8:5],mem_addr1[3:0],mem_addr1[4]} :	// ICV
                                   (array_04) ? { mem_addr1[8:6],mem_addr1[4:0],mem_addr1[5]} :	// ITLB
                                   (array_05) ? { mem_addr1[1:0],mem_addr1[8:2]}              :	// DCA fixed circuit
                                   (array_06) ? { mem_addr1[2:1],mem_addr1[8:3],mem_addr1[0]} :	// DTA fixed circuit
                                   (array_07) ? { mem_addr1[8:5],mem_addr1[3:0],mem_addr1[4]} :	// DVA
                                   (array_08) ? { mem_addr1[8:7],mem_addr1[5:0],mem_addr1[6]} :	// DTLB
                                   (array_09) ? { mem_addr1[8:5],mem_addr1[0],mem_addr1[4:1]} :	// CPQ
                                   (array_10) ? { mem_addr1[8:6],mem_addr1[2:0],mem_addr1[5:3]} :	// STBCAM
                                   (array_11) ? { mem_addr1[8:6],mem_addr1[1:0],mem_addr1[5:2]} :	// STBRAM
                                   (array_12) ? { mem_addr1[8:5],mem_addr1[0],mem_addr1[4:1]} :	// LRU
                                                            mem_addr1[8:0];



    assign mem_addr[8:0] = addr_mix ? mem_addr_mix1[8:0] : mem_addr_mix0[8:0];

////////////////////////////////////   ////////////////////////////////////
//  SEQ selection
////////////////////////////////////   ////////////////////////////////////

    // array

    assign array_01     = array_sel[3:0]==4'h0 & (~cambist & run3);
    assign array_02     = array_sel[3:0]==4'h1 & (~cambist & run3);
    assign array_03     = array_sel[3:0]==4'h2 & (~cambist & run3);
    assign array_04     = array_sel[3:0]==4'h3 & (~cambist & run3);
    assign array_05     = array_sel[3:0]==4'h4 & (~cambist & run3);
    assign array_06     = array_sel[3:0]==4'h5 & (~cambist & run3);
    assign array_07     = array_sel[3:0]==4'h6 & (~cambist & run3);
    assign array_08     = array_sel[3:0]==4'h7 & (~cambist & run3);
    assign array_09     = array_sel[3:0]==4'h8 & (~cambist & run3);
    assign array_10     = array_sel[3:0]==4'h9 & (~cambist & run3);
    assign array_11     = array_sel[3:0]==4'hA & (~cambist & run3);
    assign array_12     = array_sel[3:0]==4'hB & (~cambist & run3);


   assign last_array= array_12;

   // cmp
   assign cmp_0      = cmp_sel[2:0]==3'b000;
   assign cmp_1      = cmp_sel[2:0]==3'b001;
   assign cmp_2      = cmp_sel[2:0]==3'b010;
   assign cmp_3      = cmp_sel[2:0]==3'b011;
//   assign cmp_4      = cmp_sel[2:0]==3'b100;
//   assign cmp_5      = cmp_sel[2:0]==3'b101;
//   assign cmp_6      = cmp_sel[2:0]==3'b110;
   assign cmp_7      = cmp_sel[2:0]==3'b111;

   // march

   assign march_0   = (march_element[3:0]==4'h0);
   assign march_1   = (march_element[3:0]==4'h1);
   assign march_2   = (march_element[3:0]==4'h2);
   assign march_3   = (march_element[3:0]==4'h3);
   assign march_4   = (march_element[3:0]==4'h4);
   assign march_5   = (march_element[3:0]==4'h5);
   assign march_6   = (march_element[3:0]==4'h6);
   assign march_7   = (march_element[3:0]==4'h7);
   assign march_8   = (march_element[3:0]==4'h8);

   // rw

   assign rw_0           =  (rw[2:0]==3'b000);
   assign rw_1           =  (rw[2:0]==3'b001);
   assign rw_2           =  (rw[2:0]==3'b010);
   assign rw_3           =  (rw[2:0]==3'b011);
   assign rw_4           =  (rw[2:0]==3'b100);
//   assign rw_5           =  (rw[2:0]==3'b101);
//   assign rw_6           =  (rw[2:0]==3'b110);
//   assign rw_7           =  (rw[2:0]==3'b111);


////////////////////////////////////   ////////////////////////////////////
//  SEQ logic
////////////////////////////////////   ////////////////////////////////////
   

   // cam sel logic

  assign cam_sel_cntl_out[1:0]=cam_out[25:24];


   assign cam_sel[1:0]=   mb_user_cam_mode   ?  user_cam_sel[1:0] :
                                                cam_sel_cntl_out[1:0];


  // ctest logic

  assign ctest_cntl_out[3:0]=cam_out[23:20];


  spc_mb0_ctlmsff_ctl_macro__width_4 ctest_reg  (
               .scan_in(ctest_reg_scanin),
               .scan_out(ctest_reg_scanout),
               .l1clk    ( l1clk_pm1	   ),
               .din      ( ctest[3:0]      ),
               .dout     ( ctest_out[3:0] ),
  .siclk(siclk),
  .soclk(soclk));

   assign ctest[3:0]=(&ctest_cntl_out[3:0]) ? ctest_out[3:0] :
                          mb_user_cam_mode      ? user_cam_test_sel[3:0] :
                                                  ctest_cntl_out[3:0];


  // cseq


  assign cseq_cntl_out[2:0]=cam_out[19:17];


  spc_mb0_ctlmsff_ctl_macro__width_3 cseq_reg  (
               .scan_in(cseq_reg_scanin),
               .scan_out(cseq_reg_scanout),
               .l1clk    ( l1clk_pm1	  ),
               .din      ( cseq[2:0]      ),
               .dout     ( cseq_out[2:0] ),
  .siclk(siclk),
  .soclk(soclk));

   assign cseq[2:0]=(&cseq_cntl_out[2:0]) ? cseq_out[2:0] :
                                            cseq_cntl_out[2:0];



   assign crw[1:0]=cam_out[1:0];


   // array logic

  assign array_sel_cntl_out[3:0]=cntl_out[32:29];


  spc_mb0_ctlmsff_ctl_macro__width_4 array_sel_reg  (
               .scan_in(array_sel_reg_scanin),
               .scan_out(array_sel_reg_scanout),
               .l1clk    ( l1clk_pm1	       ),
               .din      ( array_sel[3:0]      ),
               .dout     ( array_sel_out[3:0] ),
  .siclk(siclk),
  .soclk(soclk));

   assign array_sel[3:0]=(&array_sel_cntl_out[3:0]) ? array_sel_out[3:0] :
                          user_mode                 ? user_array[3:0] :
                                                      array_sel_cntl_out[3:0];


  
   // cmp logic

   assign cmp_sel_cntl_out[2:0] = cntl_out[28:26];

   spc_mb0_ctlmsff_ctl_macro__width_3 cmp_sel_reg  (
               .scan_in(cmp_sel_reg_scanin),
               .scan_out(cmp_sel_reg_scanout),
               .l1clk    ( l1clk_pm1	     ),
               .din      ( cmp_sel[2:0]      ),
               .dout     ( cmp_sel_out[2:0] ),
  .siclk(siclk),
  .soclk(soclk));

   assign cmp_sel[2:0]=  (&cmp_sel_cntl_out[2:0] & ~array_02) | bisi_wr_mode ? cmp_sel_out[2:0] :
                               mb_user_cmpselinc_hold         ? user_cmpsel[2:0] :
                                                                cmp_sel_cntl_out[2:0];
   

 // march logic                                          

  assign march_element_cntl_out[3:0]=cntl_out[22:19];


  spc_mb0_ctlmsff_ctl_macro__width_4 marche_element_reg  (
               .scan_in(marche_element_reg_scanin),
               .scan_out(marche_element_reg_scanout),
               .l1clk    ( l1clk_pm1	      ),
               .din      ( march_element[3:0] ),
               .dout     ( march_element_out ),
  .siclk(siclk),
  .soclk(soclk));

   assign march_element[3:0]=(&march_element_cntl_out[3:0]) ? march_element_out[3:0] :
                                                              march_element_cntl_out[3:0];


   // rw
   assign rw[2:0]=cntl_out[2:0];



//////////////////////////////////////////////////////////////////
// SEL_PASS LOGIC
//////////////////////////////////////////////////////////////////
   // sel_ctest_pass
   assign sel_ctest_pass=(cam_array_0 & ctest13) |
                         (cam_array_1 & ctest13) |
                         (cam_array_2 & ctest10) |
                         (cam_clear   & ctest00) ;


   // sel_cseq_pass 

   assign sel_cseq_pass=(tlb_cam_gen_test   & cseq1)  |  // cseq0, cseq1
                        (tlb_cam_dmap_test  & cseq2)  |  // cseq0, cseq1, cseq2
                        (tlb_cam_dmap2_test & cseq2) | // cseq0, cseq1, cseq2
                        (tlb_cam_walk1_test & cseq2) |  // cseq0, cseq1, cseq2
                        (tlb_cam_mhit_test  & cseq1) |  // cseq0, cseq1, cseq2
                        (tlb_cam_rpwr_test  & cseq4) |  // cseq0, cseq1, cseq2
                        (stb_cam_gen_test   & cseq1) |  // cseq0, cseq1, cseq2
                        (stb_cam_pwk1_test  & cseq1) |  // cseq0, cseq1, cseq2
                        (stb_cam_bwk1_test  & cseq1) |  // cseq0, cseq1, cseq2
                        (stb_cam_bwk2_test  & cseq1) |  // cseq0, cseq1, cseq2
                        (stb_cam_mhit_test  & cseq1) |  // cseq0, cseq1, cseq2
                        (cam_clear  & cseq1) ;  // cseq0, cseq1, cseq2


   // sel_crw_pass 

   assign sel_crw_pass= (tlb_cam_gen_test & cseq0 & crw0) |  
                        (tlb_cam_dmap_test  & (cseq0 | cseq1 | cseq2) & crw0) | 
                        (tlb_cam_dmap2_test & (cseq0 | cseq2 ) & crw0) |
                        (tlb_cam_dmap2_test & (cseq1 ) & crw3) |
                        (tlb_cam_walk1_test  & crw0) |
                        (tlb_cam_mhit_test  & cseq0 & crw0) |
                        (tlb_cam_mhit_test  & cseq1 & crw3) |
//                        (tlb_cam_mhit_test  & cseq2 & crw0) |
                        (tlb_cam_rpwr_test  & cseq0 & crw0) | 
                        (tlb_cam_rpwr_test  & cseq1 & crw1) | 
                        (tlb_cam_rpwr_test  & cseq2 & crw0) | 
                        (tlb_cam_rpwr_test  & cseq3 & crw1) | 
                        (tlb_cam_rpwr_test  & cseq4 & crw3) |
                        (stb_cam_gen_test   & cseq0 & crw0) | 
                        (stb_cam_gen_test   & ~ctest09  & cseq1 & crw2) |
                        (stb_cam_gen_test   & ctest09  & cseq1 & crw1) |
                        (stb_cam_pwk1_test   & cseq0 & crw0) |
                        (stb_cam_pwk1_test   & cseq1 & crw0) | 
                        (stb_cam_bwk1_test   & cseq0 & crw0) |
                        (stb_cam_bwk1_test   & cseq1 & crw0) | 
                        (stb_cam_bwk2_test   & cseq0 & crw0) |
                        (stb_cam_bwk2_test   & cseq1 & crw2) |
                        (stb_cam_mhit_test   & cseq0) | 
//                        (stb_cam_mhit_test   & cseq2 & crw0) | 
                        (stb_cam_mhit_test   & cseq1 & cseq3) |
                        (cam_clear   & (cseq0 | cseq1)) ; 



   // march
   assign sel_march_1_pass = bisi_mode | (mb_ten_n_mode & march_5) | march_8;
 
   // cmp

   assign bisi_wr_mode = mb_default_bisi | mb_user_bisi_rw_mode ?  ~cntl_bisi & run3 :
                                                                   mb_user_bisi_wr_mode & run3;
                         
   assign bisi_rd_mode  =mb_default_bisi | mb_user_bisi_rw_mode ?  cntl_bisi & run3 :
                                                                   mb_user_bisi_rd_mode & run3;
                          

   assign sel_cmp_pass= (mb_user_cmpselinc_hold | bisi_wr_mode) |
                             (array_01 & cmp_0) |  // 
  	                         (array_02 & cmp_7) |  // icd 8
                             (array_03 & cmp_0) |  // 
                             (array_04 & cmp_3) |  // itb 4
                             (array_05 & cmp_1) |  // dca 2
                             (array_06 & cmp_0) |  // 
                             (array_07 & cmp_0) |  // 
                             (array_08 & cmp_1) |  // dtb 2
  	                         (array_09 & cmp_1) |  // cpq 2
                             (array_10 & cmp_0) |  // 
                             (array_11 & cmp_2) |  // stbram 3
                             (array_12 & cmp_0) ;




   // rw
   assign sel_rw_1_pass = bisi_mode | one_cycle_march ;

   assign sel_rw_2_pass = two_cycle_march;
   assign sel_rw_5_pass = five_cycle_march;

   assign sel_rw_pass = (run3 & sel_rw_1_pass & rw_0) |
                        (run3 & sel_rw_2_pass & rw_1) |
                        (run3 & sel_rw_5_pass & rw_4) ;






////////////////////////////////////   ////////////////////////////////////
//  membist control assignment
////////////////////////////////////   ////////////////////////////////////

			       
   assign mb_cmp_sel[2:0] = cmp_sel[2:0];
 
   assign mb_addr[8:0]=cambist ? {2'b00,tlb_stb_addr[6:0]}: mem_addr[8:0];  // ??
   assign mb_write_data[7:0]= cambist ? cam_data[7:0] : mem_data[7:0];


   // only one array read signal should be active   

   assign  mb_array_01_rd = array_01  & mem_rd;
   assign  mb_array_02_rd = array_02  & mem_rd;
   assign  mb_array_03_rd = array_03  & mem_rd;
   assign  mb_array_04_rd = (array_04  & mem_rd) | (cam_array_1 & cam_rd_en);
   assign  mb_array_05_rd = array_05  & mem_rd;
   assign  mb_array_06_rd = array_06  & mem_rd;
   assign  mb_array_07_rd = array_07  & mem_rd;
   assign  mb_array_08_rd = (array_08  & mem_rd) | (cam_array_0 & cam_rd_en);
   assign  mb_array_09_rd = array_09  & mem_rd;
   assign  mb_array_10_rd= array_10  & mem_rd;
   assign  mb_array_11_rd= array_11  & mem_rd;
   assign  mb_array_12_rd= array_12  & mem_rd;

   // only one array write signal should be active

   assign  mb_array_01_wr  = array_01  & mem_wr;
   assign  mb_array_02_wr  = array_02  & mem_wr;
   assign  mb_array_03_wr  = array_03  & mem_wr;
   assign  mb_array_04_wr  =(array_04  & mem_wr) |  ((cam_array_1 | cam_clear) & cam_wr_en);
   assign  mb_array_05_wr  = array_05  & mem_wr;
   assign  mb_array_06_wr  = array_06  & mem_wr;
   assign  mb_array_07_wr  = array_07  & mem_wr;
   assign  mb_array_08_wr  =(array_08  & mem_wr) |  ((cam_array_0 | cam_clear) & cam_wr_en);
   assign  mb_array_09_wr  = array_09  & mem_wr;
   assign  mb_array_10_wr =(array_10 & mem_wr)   |  ((cam_array_2 | cam_clear) & cam_wr_en);
   assign  mb_array_11_wr = array_11 & mem_wr;
   assign  mb_array_12_wr = array_12 & mem_wr;


   assign mb_run = run;



   ////////////////////////////////////   ////////////////////////////////////
   //  DONE LOGIC
   ////////////////////////////////////   ////////////////////////////////////

   

  spc_mb0_ctlmsff_ctl_macro__width_1  msb_latch  (
               .scan_in(msb_latch_scanin),
               .scan_out(msb_latch_scanout),
               .l1clk    ( l1clk_pm1	    ),
               .din      ( msb_in    ),
               .dout     ( msb_out  ),
  .siclk(siclk),
  .soclk(soclk));
   
   assign msb_in= (~start_in ) | (mb_user_loop_mode & mb_done) ? 1'b0 :
                   (cntl_msb | cam_msb)                        ? 1'b1 :
                                                                 msb_out;

   assign stop_engine_l     =  ~start_in ? 1'b0 :
                               mb_user_cam_mode                 ? cam_msb :
                               mb_user_loop_mode                ? cntl_msb :
                               (mb_user_ram_mode | bisi_mode)   ? cntl_msb :
                                                                  cam_msb;

   assign mb_done=  ~start_in ? 1'b0 :
                     bisi_mode | mb_user_loop_mode | mb_user_ram_mode ? msb_out & (done_delay[4:0]==5'b11110): 
                                       cam_msb & (done_delay[4:0]==5'b11110) ;
 
  assign  run3   = &done_delay[4:1] & ~stop_engine_l & start_in;


   spc_mb0_ctlmsff_ctl_macro__width_1 run3_transition_reg  (
                  .scan_in(run3_transition_reg_scanin),
                  .scan_out(run3_transition_reg_scanout),
                  .l1clk    ( l1clk_pm1	          ),
                  .din      ( run3  ),
                  .dout     ( run3_out    ),
  .siclk(siclk),
  .soclk(soclk));

   assign run3_transition = run3 & ~run3_out;

   spc_mb0_ctlmsff_ctl_macro__width_5 done_delay_reg  (
                  .scan_in(done_delay_reg_scanin),
                  .scan_out(done_delay_reg_scanout),
                  .l1clk    ( l1clk_pm1	          ),
                  .din      ( done_delay_in[4:0]  ),
                  .dout     ( done_delay[4:0]    ),
  .siclk(siclk),
  .soclk(soclk));


   assign done_delay_in[4:0] = ~start_in    ?  5'b00000 :
                               run3         ?  5'b11111 :
                               mb_done      ?  5'b11110 :
                              (run & ~run3) ? done_delay[4:0] + 5'b00001 : 
                                                   5'b00000;


   

////////////////////////////////////   ////////////////////////////////////
//  FAIL LOGIC
////////////////////////////////////   ////////////////////////////////////




assign   dca_fail     = run3_transition ? 1'b0 : (lsu_mbi_dca_fail     | lsu_mbi_dca_fail_sticky);
assign	 dta_fail     = run3_transition ? 1'b0 : (lsu_mbi_dta_fail     | lsu_mbi_dta_fail_sticky);
assign	 dva_fail     = run3_transition ? 1'b0 : (lsu_mbi_dva_fail     | lsu_mbi_dva_fail_sticky);
assign	 lru_fail     = run3_transition ? 1'b0 : (lsu_mbi_lru_fail     | lsu_mbi_lru_fail_sticky);
assign	 dtb_fail     = run3_transition ? 1'b0 : (lsu_mbi_dtb_fail     | lsu_mbi_dtb_fail_sticky);
assign	 stb_cam_fail = run3_transition ? 1'b0 : (lsu_mbi_stb_cam_fail | lsu_mbi_stb_cam_fail_sticky);
assign	 stb_ram_fail = run3_transition ? 1'b0 : (lsu_mbi_stb_ram_fail | lsu_mbi_stb_ram_fail_sticky);
assign	 cpq_fail     = run3_transition ? 1'b0 : (lsu_mbi_cpq_fail     | lsu_mbi_cpq_fail_sticky);
assign	 ict_fail     = run3_transition ? 1'b0 : (ftu_mbi_ict_fail     | ftu_mbi_ict_fail_sticky);
assign	 icd_fail     = run3_transition ? 1'b0 : (ftu_mbi_icd_fail     | ftu_mbi_icd_fail_sticky);
assign	 itb_fail     = run3_transition ? 1'b0 : (ftu_mbi_itb_fail     | ftu_mbi_itb_fail_sticky);
assign	 icv_fail     = run3_transition ? 1'b0 : (ftu_mbi_icv_fail     | ftu_mbi_icv_fail_sticky);

assign	 cbist_itlb_fail     = run3_transition ? 1'b0 : (cbist_itlb_cam_fail     | cbist_itlb_cam_fail_sticky);
assign	 cbist_dtlb_fail     = run3_transition ? 1'b0 : (cbist_dtlb_cam_fail     | cbist_dtlb_cam_fail_sticky);
assign	 cbist_stb_fail      = run3_transition ? 1'b0 : (cbist_stb_cam_fail      | cbist_stb_cam_fail_sticky);




spc_mb0_ctlmsff_ctl_macro__width_15		fail_reg		 (
 .scan_in(fail_reg_scanin),
 .scan_out(fail_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ({dca_fail                       ,
	 dta_fail                       ,
	 dva_fail                       ,
	 lru_fail                       ,
	 dtb_fail                       ,
	 stb_cam_fail                   ,
	 stb_ram_fail                   ,
	 cpq_fail                       ,
	 ict_fail                       ,
	 icd_fail                       ,
	 itb_fail                       ,
	 icv_fail,
     cbist_itlb_fail,
     cbist_dtlb_fail,
     cbist_stb_fail}			),
 .dout ({lsu_mbi_dca_fail_sticky    	,
	 lsu_mbi_dta_fail_sticky        ,
	 lsu_mbi_dva_fail_sticky        ,
	 lsu_mbi_lru_fail_sticky        ,
	 lsu_mbi_dtb_fail_sticky        ,
	 lsu_mbi_stb_cam_fail_sticky    ,
	 lsu_mbi_stb_ram_fail_sticky    ,
	 lsu_mbi_cpq_fail_sticky        ,
	 ftu_mbi_ict_fail_sticky        ,
	 ftu_mbi_icd_fail_sticky        ,
	 ftu_mbi_itb_fail_sticky        ,
	 ftu_mbi_icv_fail_sticky,
     cbist_itlb_cam_fail_sticky,
     cbist_dtlb_cam_fail_sticky,
     cbist_stb_cam_fail_sticky}	),
  .siclk(siclk),
  .soclk(soclk));
   

assign mbist_fail_array =  lsu_mbi_dca_fail |
                           lsu_mbi_dta_fail |
                           lsu_mbi_dva_fail |
                           lsu_mbi_lru_fail |
                           lsu_mbi_dtb_fail |
                           lsu_mbi_stb_cam_fail |
                           lsu_mbi_stb_ram_fail |
                           lsu_mbi_cpq_fail |
                           ftu_mbi_ict_fail |
                           ftu_mbi_icd_fail |
                           ftu_mbi_itb_fail |
                           ftu_mbi_icv_fail |
                           cbist_itlb_cam_fail |
                           cbist_dtlb_cam_fail |
                           cbist_stb_cam_fail  ;


assign mbist_fail_sticky = lsu_mbi_dca_fail_sticky |
			   lsu_mbi_dta_fail_sticky |
			   lsu_mbi_dva_fail_sticky |
			   lsu_mbi_lru_fail_sticky |
			   lsu_mbi_dtb_fail_sticky |
			   lsu_mbi_stb_cam_fail_sticky |
			   lsu_mbi_stb_ram_fail_sticky |
			   lsu_mbi_cpq_fail_sticky |
			   ftu_mbi_ict_fail_sticky |
			   ftu_mbi_icd_fail_sticky |
			   ftu_mbi_itb_fail_sticky |
			   ftu_mbi_icv_fail_sticky |
               cbist_itlb_cam_fail_sticky |
               cbist_dtlb_cam_fail_sticky |
               cbist_stb_cam_fail_sticky  ;


assign valid_fail=run3 | (stop_engine_l & ~mb_done);
assign mb_fail = mb_done ? (mbist_fail_sticky) : (mbist_fail_array & valid_fail);


//////////////////////////////////////////////////////////////////
// OUTPUT FLOP:
//////////////////////////////////////////////////////////////////

// mb_done


spc_mb0_ctlmsff_ctl_macro__width_1  out_mb_tcu_done_reg  (
               .scan_in(out_mb_tcu_done_reg_scanin),
               .scan_out(out_mb_tcu_done_reg_scanout),
               .l1clk    ( l1clk_pm1     ),
               .din      ( mb_done       ),
               .dout     ( mb_done_out  ),
  .siclk(siclk),
  .soclk(soclk));


// mb_fail


spc_mb0_ctlmsff_ctl_macro__width_1 out_mb_tcu_fail_reg  (
               .scan_in(out_mb_tcu_fail_reg_scanin),
               .scan_out(out_mb_tcu_fail_reg_scanout),
               .l1clk    ( l1clk_pm1     ),
               .din      ( mb_fail       ),
               .dout     ( mb_fail_out  ),
  .siclk(siclk),
  .soclk(soclk));




// out cmpsel


spc_mb0_ctlmsff_ctl_macro__width_3		out_cmp_sel_reg		 (
 .scan_in(out_cmp_sel_reg_scanin),
 .scan_out(out_cmp_sel_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ( mb_cmp_sel[2:0]		),
 .dout ( mb_cmpsel_out[2:0]		),
  .siclk(siclk),
  .soclk(soclk));


// thes are all the output flops to arrays
// for the following signals:
//
// - run
// - data
// - address


spc_mb0_ctlmsff_ctl_macro__width_1		out_run_mb_arrays_reg		 (
 .scan_in(out_run_mb_arrays_reg_scanin),
 .scan_out(out_run_mb_arrays_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ( mb_run				),
 .dout ( mb_run_out			),
  .siclk(siclk),
  .soclk(soclk));

// data 8 bits

spc_mb0_ctlmsff_ctl_macro__width_8		out_data_mb_arrays_reg		 (
 .scan_in(out_data_mb_arrays_reg_scanin),
 .scan_out(out_data_mb_arrays_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ( mb_write_data[7:0]		),
 .dout ( mb_write_data_out[7:0]		),
  .siclk(siclk),
  .soclk(soclk));


// address 16 bits


spc_mb0_ctlmsff_ctl_macro__width_9		out_addr_mb_arrays_reg		 (
 .scan_in(out_addr_mb_arrays_reg_scanin),
 .scan_out(out_addr_mb_arrays_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ( mb_addr[8:0]			),
 .dout ( mb_addr_out[8:0]		),
  .siclk(siclk),
  .soclk(soclk));



//
// write enable

spc_mb0_ctlmsff_ctl_macro__width_12		out_wr_mb_arrays_reg		 (
 .scan_in(out_wr_mb_arrays_reg_scanin),
 .scan_out(out_wr_mb_arrays_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ( {
          mb_array_01_wr,
          mb_array_02_wr,
          mb_array_03_wr,
          mb_array_04_wr,
          mb_array_05_wr,
          mb_array_06_wr,
          mb_array_07_wr,
          mb_array_08_wr,
          mb_array_09_wr,
          mb_array_10_wr,
          mb_array_11_wr,
          mb_array_12_wr
          }		),
 .dout ({ 
          mb_array_01_wr_out,
          mb_array_02_wr_out,
          mb_array_03_wr_out,
          mb_array_04_wr_out,
          mb_array_05_wr_out,
          mb_array_06_wr_out,
          mb_array_07_wr_out,
          mb_array_08_wr_out,
          mb_array_09_wr_out,
          mb_array_10_wr_out,
          mb_array_11_wr_out,
          mb_array_12_wr_out
        }		),
  .siclk(siclk),
  .soclk(soclk));



// read enable
 
spc_mb0_ctlmsff_ctl_macro__width_12		out_rd_mb_arrays_reg		 (
 .scan_in(out_rd_mb_arrays_reg_scanin),
 .scan_out(out_rd_mb_arrays_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ( {
          mb_array_01_rd,
          mb_array_02_rd,
          mb_array_03_rd,
          mb_array_04_rd,
          mb_array_05_rd,
          mb_array_06_rd,
          mb_array_07_rd,
          mb_array_08_rd,
          mb_array_09_rd,
          mb_array_10_rd,
          mb_array_11_rd,
          mb_array_12_rd
          }		),
 .dout ({ 
          mb_array_01_rd_out,
          mb_array_02_rd_out,
          mb_array_03_rd_out,
          mb_array_04_rd_out,
          mb_array_05_rd_out,
          mb_array_06_rd_out,
          mb_array_07_rd_out,
          mb_array_08_rd_out,
          mb_array_09_rd_out,
          mb_array_10_rd_out,
          mb_array_11_rd_out,
          mb_array_12_rd_out
        }		),
  .siclk(siclk),
  .soclk(soclk));

// merge fail and done signals:

   spc_mb0_ctlmsff_ctl_macro__width_3 merged_fail  (
                  .scan_in(merged_fail_scanin),
                  .scan_out(merged_fail_scanout),
                  .l1clk    ( l1clk_pm1                                  ),
  	          .din      ( {mb1_mb0_fail,mb2_mb0_fail,mb_fail_merged} ),
  		  .dout     ( {mb1_fail    ,mb2_fail    ,mb0_mbist_fail} ),
  .siclk(siclk),
  .soclk(soclk));

   spc_mb0_ctlmsff_ctl_macro__width_3 merged_done  (
                  .scan_in(merged_done_scanin),
                  .scan_out(merged_done_scanout),
                  .l1clk    ( l1clk_pm1                                  ),
  	          .din      ( {mb1_mb0_done,mb2_mb0_done,mb_done_merged} ),
  		  .dout     ( {mb1_done    ,mb2_done    ,mb0_done}       ),
  .siclk(siclk),
  .soclk(soclk));


   assign mb_fail_merged=mb1_fail | mb2_fail | mb0_fail;

   assign mb_done_merged= user_mode ? (mb1_done | mb2_done | mb_done_out) : (mb1_done & mb2_done & mb_done_out);


// port name re-assignment


   assign mb0_run             =mb_run_out;
   assign mb0_write_data[7:0] =mb_write_data_out[7:0];
   assign mb0_addr[15:0]      ={7'b0000000,mb_addr_out[8:0]};
   assign mb0_cmpsel[2:0]     =mb_cmpsel_out[2:0];
   assign mb0_fail           =mb_fail_out;
//   assign mb0_done         =mb_done_out;

   assign mb0_ict_write_en   =mb_array_01_wr_out;
   assign mb0_icd_write_en   =mb_array_02_wr_out;
   assign mb0_icv_write_en   =mb_array_03_wr_out;
   assign mb0_itb_write_en   =mb_array_04_wr_out;
   assign mb0_dca_write_en   =mb_array_05_wr_out;
   assign mb0_dta_write_en   =mb_array_06_wr_out;
   assign mb0_dva_write_en   =mb_array_07_wr_out;
   assign mb0_dtb_write_en  =mb_array_08_wr_out;
   assign mb0_cpq_write_en   =mb_array_09_wr_out;
   assign mb0_stb_cam_write_en=mb_array_10_wr_out;
   assign mb0_stb_ram_write_en=mb_array_11_wr_out;
   assign mb0_lru_write_en   =mb_array_12_wr_out;

   assign mb0_ict_read_en   =mb_array_01_rd_out;
   assign mb0_icd_read_en   =mb_array_02_rd_out;
   assign mb0_icv_read_en   =mb_array_03_rd_out;
   assign mb0_itb_read_en   =mb_array_04_rd_out;
   assign mb0_dca_read_en   =mb_array_05_rd_out;
   assign mb0_dta_read_en   =mb_array_06_rd_out;
   assign mb0_dva_read_en   =mb_array_07_rd_out;
   assign mb0_dtb_read_en  =mb_array_08_rd_out;
   assign mb0_cpq_read_en   =mb_array_09_rd_out;
   assign mb0_stb_cam_read_en=mb_array_10_rd_out;
   assign mb0_stb_ram_read_en=mb_array_11_rd_out;
   assign mb0_lru_read_en   =mb_array_12_rd_out;



// spare gates:


spc_mb0_ctlspare_ctl_macro__num_6 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk_pm1),
  .siclk(siclk),
  .soclk(soclk)
);


supply0 vss; // <- port for ground
supply1 vdd; // <- port for power 


// /////////////////////////////////////////////////////////////////////////////

// /////////////////////////////////////////////////////////////////////////////

// fixscan start:
assign pmen_scanin               = scan_in                  ;
assign array_usr_reg_scanin      = pmen_scanout             ;
assign user_addr_mode_reg_scanin = array_usr_reg_scanout    ;
assign user_start_addr_reg_scanin = user_addr_mode_reg_scanout;
assign user_stop_addr_reg_scanin = user_start_addr_reg_scanout;
assign user_incr_addr_reg_scanin = user_stop_addr_reg_scanout;
assign user_data_mode_reg_scanin = user_incr_addr_reg_scanout;
assign user_data_reg_scanin      = user_data_mode_reg_scanout;
assign user_cmpselinc_hold_reg_scanin = user_data_reg_scanout    ;
assign user_cmpsel_reg_scanin    = user_cmpselinc_hold_reg_scanout;
assign user_loop_mode_reg_scanin = user_cmpsel_reg_scanout  ;
assign ten_n_mode_reg_scanin     = user_loop_mode_reg_scanout;
assign user_cam_mode_reg_scanin  = ten_n_mode_reg_scanout   ;
assign user_cam_select_reg_scanin = user_cam_mode_reg_scanout;
assign user_cam_test_select_reg_scanin = user_cam_select_reg_scanout;
assign user_bisi_wr_mode_reg_scanin = user_cam_test_select_reg_scanout;
assign user_bisi_rd_mode_reg_scanin = user_bisi_wr_mode_reg_scanout;
assign input_signals_reg_scanin  = user_bisi_rd_mode_reg_scanout;
assign mb_enable_reg_scanin      = input_signals_reg_scanout;
assign config_reg_scanin         = mb_enable_reg_scanout    ;
assign loop_again_reg_scanin     = config_reg_scanout       ;
assign cambist_delay_reg_scanin  = loop_again_reg_scanout   ;
assign cam_cntl_reg_scanin       = cambist_delay_reg_scanout;
assign cam_shift_reg_scanin      = cam_cntl_reg_scanout     ;
assign cam_en_reg_scanin         = cam_shift_reg_scanout    ;
assign stb_hit_cmp_delay_scanin  = cam_en_reg_scanout       ;
assign stb_hit_cmp_mhit_l_delay_scanin = stb_hit_cmp_delay_scanout;
assign exp_stb_cam_hit_delay_scanin = stb_hit_cmp_mhit_l_delay_scanout;
assign exp_stb_hit_ptr_delay_scanin = exp_stb_cam_hit_delay_scanout;
assign exp_stb_mhit_delay_scanin = exp_stb_hit_ptr_delay_scanout;
assign exp_stb_ld_partial_raw_delay_scanin = exp_stb_mhit_delay_scanout;
assign cam_array_0_delay_scanin  = exp_stb_ld_partial_raw_delay_scanout;
assign cam_array_1_delay_scanin  = cam_array_0_delay_scanout;
assign cam_array_2_delay_scanin  = cam_array_1_delay_scanout;
assign cam_hit_cmp_delay_scanin  = cam_array_2_delay_scanout;
assign data_cmp_delay_scanin     = cam_hit_cmp_delay_scanout;
assign cam_valid_cmp_delay_scanin = data_cmp_delay_scanout   ;
assign cam_used_cmp_delay_scanin = cam_valid_cmp_delay_scanout;
assign exp_data_cmp_delay_scanin = cam_used_cmp_delay_scanout;
assign exp_valid_delay_scanin    = exp_data_cmp_delay_scanout;
assign exp_used_delay_scanin     = exp_valid_delay_scanout  ;
assign tlb_cntx0_cmp_delay_scanin = exp_used_delay_scanout   ;
assign exp_cam_hit_delay_scanin  = tlb_cntx0_cmp_delay_scanout;
assign exp_cntx0_hit_delay_scanin = exp_cam_hit_delay_scanout;
assign exp_mhit_delay_scanin     = exp_cntx0_hit_delay_scanout;
assign tlb_cam_intf_out_scanin   = exp_mhit_delay_scanout   ;
assign cntl_reg_scanin           = tlb_cam_intf_out_scanout ;
assign ctest_reg_scanin          = cntl_reg_scanout         ;
assign cseq_reg_scanin           = ctest_reg_scanout        ;
assign array_sel_reg_scanin      = cseq_reg_scanout         ;
assign cmp_sel_reg_scanin        = array_sel_reg_scanout    ;
assign marche_element_reg_scanin = cmp_sel_reg_scanout      ;
assign msb_latch_scanin          = marche_element_reg_scanout;
assign run3_transition_reg_scanin = msb_latch_scanout        ;
assign done_delay_reg_scanin     = run3_transition_reg_scanout;
assign fail_reg_scanin           = done_delay_reg_scanout   ;
assign out_mb_tcu_done_reg_scanin = fail_reg_scanout         ;
assign out_mb_tcu_fail_reg_scanin = out_mb_tcu_done_reg_scanout;
assign out_cmp_sel_reg_scanin    = out_mb_tcu_fail_reg_scanout;
assign out_run_mb_arrays_reg_scanin = out_cmp_sel_reg_scanout  ;
assign out_data_mb_arrays_reg_scanin = out_run_mb_arrays_reg_scanout;
assign out_addr_mb_arrays_reg_scanin = out_data_mb_arrays_reg_scanout;
assign out_wr_mb_arrays_reg_scanin = out_addr_mb_arrays_reg_scanout;
assign out_rd_mb_arrays_reg_scanin = out_wr_mb_arrays_reg_scanout;
assign merged_fail_scanin        = out_rd_mb_arrays_reg_scanout;
assign merged_done_scanin        = merged_fail_scanout      ;
assign spares_scanin             = merged_done_scanout      ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module spc_mb0_ctll1clkhdr_ctl_macro (
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

module spc_mb0_ctlmsff_ctl_macro__width_3 (
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

module spc_mb0_ctlmsff_ctl_macro__width_4 (
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

module spc_mb0_ctlmsff_ctl_macro__width_1 (
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

module spc_mb0_ctlmsff_ctl_macro__width_9 (
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

module spc_mb0_ctlmsff_ctl_macro__width_8 (
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

module spc_mb0_ctlmsff_ctl_macro__width_2 (
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

module spc_mb0_ctlmsff_ctl_macro__width_27 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [26:0] fdin;
wire [25:0] so;

  input [26:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [26:0] dout;
  output scan_out;
assign fdin[26:0] = din[26:0];






dff #(27)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[26:0]),
.si({scan_in,so[25:0]}),
.so({so[25:0],scan_out}),
.q(dout[26:0])
);












endmodule













// any PARAMS parms go into naming of macro

module spc_mb0_ctlmsff_ctl_macro__width_5 (
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

module spc_mb0_ctlmsff_ctl_macro__width_6 (
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

module spc_mb0_ctlmsff_ctl_macro__width_13 (
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

module spc_mb0_ctlmsff_ctl_macro__width_28 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [27:0] fdin;
wire [26:0] so;

  input [27:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [27:0] dout;
  output scan_out;
assign fdin[27:0] = din[27:0];






dff #(28)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[27:0]),
.si({scan_in,so[26:0]}),
.so({so[26:0],scan_out}),
.q(dout[27:0])
);












endmodule













// any PARAMS parms go into naming of macro

module spc_mb0_ctlmsff_ctl_macro__width_15 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [14:0] fdin;
wire [13:0] so;

  input [14:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [14:0] dout;
  output scan_out;
assign fdin[14:0] = din[14:0];






dff #(15)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[14:0]),
.si({scan_in,so[13:0]}),
.so({so[13:0],scan_out}),
.q(dout[14:0])
);












endmodule













// any PARAMS parms go into naming of macro

module spc_mb0_ctlmsff_ctl_macro__width_12 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module spc_mb0_ctlspare_ctl_macro__num_6 (
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
assign scan_out = so_5;



endmodule

