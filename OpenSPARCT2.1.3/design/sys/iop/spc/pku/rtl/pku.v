// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pku.v
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
module pku (
  tlu_halted, 
  tcu_do_mode, 
  dec_block_store_stall, 
  dec_ierr_d, 
  lsu_spec_enable, 
  spc_core_running_status, 
  lsu_pku_pmen, 
  tlu_retry_state, 
  tlu_flush_ifu, 
  dec_true_valid_e, 
  dec_decode0_d, 
  dec_decode1_d, 
  dec_valid0_d, 
  dec_valid1_d, 
  lsu_sync, 
  lsu_complete, 
  dec_br_taken_e, 
  fgu_divide_completion, 
  ifu_ibuffer_write_c, 
  lsu_stb_alloc, 
  lsu_stb_dealloc, 
  lsu_block_store_kill, 
  ifu_buf0_inst0, 
  ifu_buf0_inst1, 
  ifu_buf0_inst2, 
  ifu_buf0_inst3, 
  ifu_buf0_inst4, 
  ifu_buf0_inst5, 
  ifu_buf0_inst6, 
  ifu_buf0_inst7, 
  ifu_buf0_valid_p, 
  ifu_upper_buffer_valid_p, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  pku_raw_pick0_p, 
  pku_raw_pick1_p, 
  pku_base_pick_p, 
  pku_pick_p, 
  pku_lsu_p, 
  pku_fgu_p, 
  pku_pdist_p, 
  pku_twocycle_p, 
  pku_idest_p, 
  pku_fdest_p, 
  pku_fsrc_rd_p, 
  pku_isrc_rs1_p, 
  pku_isrc_rs2_p, 
  pku_isrc_rd_p, 
  pku_valid_e, 
  pku_annul_ds_dcti_brtaken0_e, 
  pku_annul_ds_dcti_brtaken1_e, 
  pku_flush_f1, 
  pku_flush_f2, 
  pku_flush_lb, 
  pku_flush_lm, 
  pku_flush_m, 
  pku_flush_b, 
  pku_load_flush_w, 
  pku_ds_e, 
  pku_flush_upper_buffer, 
  pku_flush_buffer0, 
  pku_quiesce, 
  pku_inst_cnt_brtaken00, 
  pku_inst_cnt_brtaken01, 
  pku_inst_cnt_brtaken02, 
  pku_inst_cnt_brtaken03, 
  pku_inst_cnt_brtaken04, 
  pku_inst_cnt_brtaken05, 
  pku_inst_cnt_brtaken06, 
  pku_inst_cnt_brtaken07, 
  pku_inst_cnt_brtaken10, 
  pku_inst_cnt_brtaken11, 
  pku_inst_cnt_brtaken12, 
  pku_inst_cnt_brtaken13, 
  pku_inst_cnt_brtaken14, 
  pku_inst_cnt_brtaken15, 
  pku_inst_cnt_brtaken16, 
  pku_inst_cnt_brtaken17, 
  scan_out);
wire [7:0] swl_divide_wait;
wire swl0_scanin;
wire swl0_scanout;
wire [7:0] swl_ready_p;
wire [7:0] swl_spec_ready_p;
wire [7:0] swl_cancel_pick_p;
wire swl1_scanin;
wire swl1_scanout;
wire swl2_scanin;
wire swl2_scanout;
wire swl3_scanin;
wire swl3_scanout;
wire pck0_scanin;
wire pck0_scanout;
wire swl4_scanin;
wire swl4_scanout;
wire swl5_scanin;
wire swl5_scanout;
wire swl6_scanin;
wire swl6_scanout;
wire swl7_scanin;
wire swl7_scanout;
wire pck1_scanin;
wire pck1_scanout;


input [7:0] tlu_halted;			// thread is in halted state

input tcu_do_mode;

input [7:0] dec_block_store_stall;  	// prevent window ops from coming too early after a block store 
input [1:0] dec_ierr_d;  		// tell pku that an inst error has occurred: illegal, parity error or ifetch error

input [7:0] lsu_spec_enable;		// enable speculation; assume this is serializing (if not pipeline it)
input [7:0] spc_core_running_status;	// active bits for each of the threads

input lsu_pku_pmen;			// power management enable for pku

input [7:0] tlu_retry_state;		// IF the first part of a retry, must let it go even in dcti w/out DS (part of address optimization)
input [7:0] tlu_flush_ifu;		// flush this thread (traps)
input [1:0] dec_true_valid_e;		// instruction at e stage is valid taking exceptions into account
input dec_decode0_d;			// instruction at d stage is decoded this cycle (TG0)
input dec_decode1_d;			// instruction at d stage is decoded this cycle (TG1)
input dec_valid0_d;			// instruction at d stage is valid (TG0)
input dec_valid1_d;			// instruction at d stage is valid (TG1)
input [7:0] lsu_sync;			// lsu needs thread to resync due to dcache_miss, ASI register access, etc.
input [7:0] lsu_complete;		// completion of lsu sync event
input [1:0] dec_br_taken_e;		// br is taken for e stage (br mispredict)

input [7:0] fgu_divide_completion;	// divide completion for any thread
input [7:0] ifu_ibuffer_write_c;	// any write to the ibuffer (C stage)
input [7:0] lsu_stb_alloc;		// lsu has allocated store in stb; sent in b_stage; increment ccnt by 1
input [7:0] lsu_stb_dealloc;		// lsu is deallocating store in stb; decrement sscnt,ccnt by 1
input [7:0] lsu_block_store_kill;  	// error occured in block store sequence; use this to set scnt=ccnt=0

input [31:0] ifu_buf0_inst0;		// oldest instruction for each of the instruction buffers
input [31:0] ifu_buf0_inst1;
input [31:0] ifu_buf0_inst2;
input [31:0] ifu_buf0_inst3;
input [31:0] ifu_buf0_inst4;
input [31:0] ifu_buf0_inst5;
input [31:0] ifu_buf0_inst6;
input [31:0] ifu_buf0_inst7;

input [7:0] ifu_buf0_valid_p;		// instruction valid signals for each of the buffers (oldest instruction)
input [7:0] ifu_upper_buffer_valid_p;	// instruction after oldest instruction is valid for each buffer

input l2clk;
input scan_in;
input tcu_pce_ov;		// scan signals
input spc_aclk;
input spc_bclk;
input tcu_scan_en;

output [3:0] pku_raw_pick0_p;   // raw pick signals to ifu to mux pc addresses (no swl_cancel_pick or decode cancel)
output [7:4] pku_raw_pick1_p;   

output [7:0] pku_base_pick_p;   // base pick signals to dec (no decode cancel)

output [7:0] pku_pick_p;	// final pick signals (with everything)

output [7:0] pku_lsu_p;		// lsu op at pick
output [7:0] pku_fgu_p;		// fgu op at pick
output [7:0] pku_pdist_p;	// pdist inst at pick
output [7:0] pku_twocycle_p;	// twocycle op at pick (std or casa)
output [7:0] pku_idest_p;	// op has integer dest at pick
output [7:0] pku_fdest_p;	// op has fp dest at pick

output [7:0] pku_fsrc_rd_p;	// fgu sources rd
	
output [7:0] pku_isrc_rs1_p;    // int op has rs1 source
output [7:0] pku_isrc_rs2_p;	// int op has rs2 source
output [7:0] pku_isrc_rd_p;	// int op has rd dest

output [7:0] pku_valid_e;	// inst is valid at e stage
	
output [7:0] pku_annul_ds_dcti_brtaken0_e;    // DS of dcti at e stage is annulled
output [7:0] pku_annul_ds_dcti_brtaken1_e;    // DS of dcti at e stage is annulled

output [7:0] pku_flush_f1;	// flush inst at f1 pipe stage of the fgu
output [7:0] pku_flush_f2;	// flush inst at f2 pipe stage of the fgu

output [7:0] pku_flush_lb;	// flush inst at b pipe stage of the lsu
output [7:0] pku_flush_lm;	// flush inst at m pipe stage of the lsu

output [7:0] pku_flush_m;	// flush inst at m pipe stage of trap
output [7:0] pku_flush_b;	// flush inst at b pipe stage of trap

output [7:0] pku_load_flush_w;	// tell ifu to flush this thread and fetch the npc of inst at w stage (due to load mispredict)

output [7:0] pku_ds_e;		// inst at e stage is a DS
	
output [7:0] pku_flush_upper_buffer;	// flush upper instruction buffers
output [7:0] pku_flush_buffer0;		// flush buffer0 of instruction buffers (oldest)

output [7:0] pku_quiesce;	// quiesce signal for each thread to tlu

output [1:0] pku_inst_cnt_brtaken00;	// inst cnts at e,m,b pipe stages for each thread
output [1:0] pku_inst_cnt_brtaken01;
output [1:0] pku_inst_cnt_brtaken02;
output [1:0] pku_inst_cnt_brtaken03;
output [1:0] pku_inst_cnt_brtaken04;
output [1:0] pku_inst_cnt_brtaken05;
output [1:0] pku_inst_cnt_brtaken06;
output [1:0] pku_inst_cnt_brtaken07;
output [1:0] pku_inst_cnt_brtaken10;	// inst cnts at e,m,b pipe stages for each thread
output [1:0] pku_inst_cnt_brtaken11;
output [1:0] pku_inst_cnt_brtaken12;
output [1:0] pku_inst_cnt_brtaken13;
output [1:0] pku_inst_cnt_brtaken14;
output [1:0] pku_inst_cnt_brtaken15;
output [1:0] pku_inst_cnt_brtaken16;
output [1:0] pku_inst_cnt_brtaken17;

output scan_out;


pku_swl_ctl swl0 (
    .tlu_halted(tlu_halted[0]),
    .dec_block_store_stall(dec_block_store_stall[0]),
    .dec_ierr_d(dec_ierr_d[0]),
    .ifu_ibuffer_write_c(ifu_ibuffer_write_c[0]),
    .ifu_buf0_inst(ifu_buf0_inst0[31:0]),
    .swl_divide_wait_all(swl_divide_wait[7:0]),
    .fgu_divide_completion(fgu_divide_completion[0]),
    .lsu_spec_enable(lsu_spec_enable[0]),
    .spc_core_running_status(spc_core_running_status[0]),
    .ifu_buf0_valid_p(ifu_buf0_valid_p[0]),
    .ifu_upper_buffer_valid_p(ifu_upper_buffer_valid_p[0]),
    .pku_raw_pick_p(pku_raw_pick0_p[0]),
    .tlu_flush_ifu(tlu_flush_ifu[0]),
    .dec_true_valid_e(dec_true_valid_e[0]),
    .dec_decode_d(dec_decode0_d),
    .dec_valid_d(dec_valid0_d),
    .tlu_retry_state(tlu_retry_state[0]),
    .lsu_stb_dealloc(lsu_stb_dealloc[0]),
    .lsu_stb_alloc(lsu_stb_alloc[0]),
    .lsu_block_store_kill(lsu_block_store_kill[0]),
    .lsu_sync(lsu_sync[0]),
    .lsu_complete(lsu_complete[0]),
    .dec_br_taken_e(dec_br_taken_e[0]),
    .scan_in(swl0_scanin),
    .scan_out(swl0_scanout),
    .l2clk(l2clk),
    .pku_quiesce(pku_quiesce[0]),
    .pku_lsu_p(pku_lsu_p[0]),
    .pku_fgu_p(pku_fgu_p[0]),
    .pku_pdist_p(pku_pdist_p[0]),
    .pku_twocycle_p(pku_twocycle_p[0]),
    .pku_idest_p(pku_idest_p[0]),
    .pku_fdest_p(pku_fdest_p[0]),
    .pku_isrc_rs1_p(pku_isrc_rs1_p[0]),
    .pku_isrc_rs2_p(pku_isrc_rs2_p[0]),
    .pku_isrc_rd_p(pku_isrc_rd_p[0]),
    .pku_fsrc_rd_p(pku_fsrc_rd_p[0]),
    .swl_ready_p(swl_ready_p[0]),
    .swl_spec_ready_p(swl_spec_ready_p[0]),
    .pku_load_flush_w(pku_load_flush_w[0]),
    .pku_flush_upper_buffer(pku_flush_upper_buffer[0]),
    .pku_flush_buffer0(pku_flush_buffer0[0]),
    .pku_valid_e(pku_valid_e[0]),
    .pku_annul_ds_dcti_brtaken0_e(pku_annul_ds_dcti_brtaken0_e[0]),
    .pku_annul_ds_dcti_brtaken1_e(pku_annul_ds_dcti_brtaken1_e[0]),
    .pku_flush_m(pku_flush_m[0]),
    .pku_flush_b(pku_flush_b[0]),
    .pku_flush_lm(pku_flush_lm[0]),
    .pku_flush_lb(pku_flush_lb[0]),
    .pku_flush_f1(pku_flush_f1[0]),
    .pku_flush_f2(pku_flush_f2[0]),
    .pku_inst_cnt_brtaken0(pku_inst_cnt_brtaken00[1:0]),
    .pku_inst_cnt_brtaken1(pku_inst_cnt_brtaken10[1:0]),
    .pku_ds_e(pku_ds_e[0]),
    .swl_divide_wait(swl_divide_wait[0]),
    .swl_cancel_pick_p(swl_cancel_pick_p[0]),
  .tcu_do_mode(tcu_do_mode),
  .lsu_pku_pmen(lsu_pku_pmen),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en)
);

pku_swl_ctl swl1 (
    .tlu_halted(tlu_halted[1]),
    .dec_block_store_stall(dec_block_store_stall[1]),
    .dec_ierr_d(dec_ierr_d[0]),
    .ifu_ibuffer_write_c(ifu_ibuffer_write_c[1]),
    .ifu_buf0_inst(ifu_buf0_inst1[31:0]),
    .swl_divide_wait_all(swl_divide_wait[7:0]),
    .fgu_divide_completion(fgu_divide_completion[1]),
    .lsu_spec_enable(lsu_spec_enable[1]),
    .spc_core_running_status(spc_core_running_status[1]),
    .ifu_buf0_valid_p(ifu_buf0_valid_p[1]),
    .ifu_upper_buffer_valid_p(ifu_upper_buffer_valid_p[1]),
    .pku_raw_pick_p(pku_raw_pick0_p[1]),
    .tlu_flush_ifu(tlu_flush_ifu[1]),
    .dec_true_valid_e(dec_true_valid_e[0]),
    .dec_decode_d(dec_decode0_d),
    .dec_valid_d(dec_valid0_d),
    .tlu_retry_state(tlu_retry_state[1]),
    .lsu_stb_dealloc(lsu_stb_dealloc[1]),
    .lsu_stb_alloc(lsu_stb_alloc[1]),
    .lsu_block_store_kill(lsu_block_store_kill[1]),
    .lsu_sync(lsu_sync[1]),
    .lsu_complete(lsu_complete[1]),
    .dec_br_taken_e(dec_br_taken_e[0]),
    .scan_in(swl1_scanin),
    .scan_out(swl1_scanout),
    .l2clk(l2clk),
    .pku_quiesce(pku_quiesce[1]),
    .pku_lsu_p(pku_lsu_p[1]),
    .pku_fgu_p(pku_fgu_p[1]),
    .pku_pdist_p(pku_pdist_p[1]),
    .pku_twocycle_p(pku_twocycle_p[1]),
    .pku_idest_p(pku_idest_p[1]),
    .pku_fdest_p(pku_fdest_p[1]),
    .pku_isrc_rs1_p(pku_isrc_rs1_p[1]),
    .pku_isrc_rs2_p(pku_isrc_rs2_p[1]),
    .pku_isrc_rd_p(pku_isrc_rd_p[1]),
    .pku_fsrc_rd_p(pku_fsrc_rd_p[1]),
    .swl_ready_p(swl_ready_p[1]),
    .swl_spec_ready_p(swl_spec_ready_p[1]),
    .pku_load_flush_w(pku_load_flush_w[1]),
    .pku_flush_upper_buffer(pku_flush_upper_buffer[1]),
    .pku_flush_buffer0(pku_flush_buffer0[1]),
    .pku_valid_e(pku_valid_e[1]),
    .pku_annul_ds_dcti_brtaken0_e(pku_annul_ds_dcti_brtaken0_e[1]),
    .pku_annul_ds_dcti_brtaken1_e(pku_annul_ds_dcti_brtaken1_e[1]),
    .pku_flush_m(pku_flush_m[1]),
    .pku_flush_b(pku_flush_b[1]),
    .pku_flush_lm(pku_flush_lm[1]),
    .pku_flush_lb(pku_flush_lb[1]),
    .pku_flush_f1(pku_flush_f1[1]),
    .pku_flush_f2(pku_flush_f2[1]),
    .pku_inst_cnt_brtaken0(pku_inst_cnt_brtaken01[1:0]),
    .pku_inst_cnt_brtaken1(pku_inst_cnt_brtaken11[1:0]),
    .pku_ds_e(pku_ds_e[1]),
    .swl_divide_wait(swl_divide_wait[1]),
    .swl_cancel_pick_p(swl_cancel_pick_p[1]),
  .tcu_do_mode(tcu_do_mode),
  .lsu_pku_pmen(lsu_pku_pmen),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en)
);

pku_swl_ctl swl2 (
    .tlu_halted(tlu_halted[2]),
    .dec_block_store_stall(dec_block_store_stall[2]),
    .dec_ierr_d(dec_ierr_d[0]),
    .ifu_ibuffer_write_c(ifu_ibuffer_write_c[2]),
    .ifu_buf0_inst(ifu_buf0_inst2[31:0]),
    .swl_divide_wait_all(swl_divide_wait[7:0]),
    .fgu_divide_completion(fgu_divide_completion[2]),
    .lsu_spec_enable(lsu_spec_enable[2]),
    .spc_core_running_status(spc_core_running_status[2]),
    .ifu_buf0_valid_p(ifu_buf0_valid_p[2]),
    .ifu_upper_buffer_valid_p(ifu_upper_buffer_valid_p[2]),
    .pku_raw_pick_p(pku_raw_pick0_p[2]),
    .tlu_flush_ifu(tlu_flush_ifu[2]),
    .dec_true_valid_e(dec_true_valid_e[0]),
    .dec_decode_d(dec_decode0_d),
    .dec_valid_d(dec_valid0_d),
    .tlu_retry_state(tlu_retry_state[2]),
    .lsu_stb_dealloc(lsu_stb_dealloc[2]),
    .lsu_stb_alloc(lsu_stb_alloc[2]),
    .lsu_block_store_kill(lsu_block_store_kill[2]),
    .lsu_sync(lsu_sync[2]),
    .lsu_complete(lsu_complete[2]),
    .dec_br_taken_e(dec_br_taken_e[0]),
    .scan_in(swl2_scanin),
    .scan_out(swl2_scanout),
    .l2clk(l2clk),
    .pku_quiesce(pku_quiesce[2]),
    .pku_lsu_p(pku_lsu_p[2]),
    .pku_fgu_p(pku_fgu_p[2]),
    .pku_pdist_p(pku_pdist_p[2]),
    .pku_twocycle_p(pku_twocycle_p[2]),
    .pku_idest_p(pku_idest_p[2]),
    .pku_fdest_p(pku_fdest_p[2]),
    .pku_isrc_rs1_p(pku_isrc_rs1_p[2]),
    .pku_isrc_rs2_p(pku_isrc_rs2_p[2]),
    .pku_isrc_rd_p(pku_isrc_rd_p[2]),
    .pku_fsrc_rd_p(pku_fsrc_rd_p[2]),
    .swl_ready_p(swl_ready_p[2]),
    .swl_spec_ready_p(swl_spec_ready_p[2]),
    .pku_load_flush_w(pku_load_flush_w[2]),
    .pku_flush_upper_buffer(pku_flush_upper_buffer[2]),
    .pku_flush_buffer0(pku_flush_buffer0[2]),
    .pku_valid_e(pku_valid_e[2]),
    .pku_annul_ds_dcti_brtaken0_e(pku_annul_ds_dcti_brtaken0_e[2]),
    .pku_annul_ds_dcti_brtaken1_e(pku_annul_ds_dcti_brtaken1_e[2]),
    .pku_flush_m(pku_flush_m[2]),
    .pku_flush_b(pku_flush_b[2]),
    .pku_flush_lm(pku_flush_lm[2]),
    .pku_flush_lb(pku_flush_lb[2]),
    .pku_flush_f1(pku_flush_f1[2]),
    .pku_flush_f2(pku_flush_f2[2]),
    .pku_inst_cnt_brtaken0(pku_inst_cnt_brtaken02[1:0]),
    .pku_inst_cnt_brtaken1(pku_inst_cnt_brtaken12[1:0]),
    .pku_ds_e(pku_ds_e[2]),
    .swl_divide_wait(swl_divide_wait[2]),
    .swl_cancel_pick_p(swl_cancel_pick_p[2]),
  .tcu_do_mode(tcu_do_mode),
  .lsu_pku_pmen(lsu_pku_pmen),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en)
);

pku_swl_ctl swl3 (
    .tlu_halted(tlu_halted[3]),
    .dec_block_store_stall(dec_block_store_stall[3]),
    .dec_ierr_d(dec_ierr_d[0]),
    .ifu_ibuffer_write_c(ifu_ibuffer_write_c[3]),
    .ifu_buf0_inst(ifu_buf0_inst3[31:0]),
    .swl_divide_wait_all(swl_divide_wait[7:0]),
    .fgu_divide_completion(fgu_divide_completion[3]),
    .lsu_spec_enable(lsu_spec_enable[3]),
    .spc_core_running_status(spc_core_running_status[3]),
    .ifu_buf0_valid_p(ifu_buf0_valid_p[3]),
    .ifu_upper_buffer_valid_p(ifu_upper_buffer_valid_p[3]),
    .pku_raw_pick_p(pku_raw_pick0_p[3]),
    .tlu_flush_ifu(tlu_flush_ifu[3]),
    .dec_true_valid_e(dec_true_valid_e[0]),
    .dec_decode_d(dec_decode0_d),
    .dec_valid_d(dec_valid0_d),
    .tlu_retry_state(tlu_retry_state[3]),
    .lsu_stb_dealloc(lsu_stb_dealloc[3]),
    .lsu_stb_alloc(lsu_stb_alloc[3]),
    .lsu_block_store_kill(lsu_block_store_kill[3]),
    .lsu_sync(lsu_sync[3]),
    .lsu_complete(lsu_complete[3]),
    .dec_br_taken_e(dec_br_taken_e[0]),
    .scan_in(swl3_scanin),
    .scan_out(swl3_scanout),
    .l2clk(l2clk),
    .pku_quiesce(pku_quiesce[3]),
    .pku_lsu_p(pku_lsu_p[3]),
    .pku_fgu_p(pku_fgu_p[3]),
    .pku_pdist_p(pku_pdist_p[3]),
    .pku_twocycle_p(pku_twocycle_p[3]),
    .pku_idest_p(pku_idest_p[3]),
    .pku_fdest_p(pku_fdest_p[3]),
    .pku_isrc_rs1_p(pku_isrc_rs1_p[3]),
    .pku_isrc_rs2_p(pku_isrc_rs2_p[3]),
    .pku_isrc_rd_p(pku_isrc_rd_p[3]),
    .pku_fsrc_rd_p(pku_fsrc_rd_p[3]),
    .swl_ready_p(swl_ready_p[3]),
    .swl_spec_ready_p(swl_spec_ready_p[3]),
    .pku_load_flush_w(pku_load_flush_w[3]),
    .pku_flush_upper_buffer(pku_flush_upper_buffer[3]),
    .pku_flush_buffer0(pku_flush_buffer0[3]),
    .pku_annul_ds_dcti_brtaken0_e(pku_annul_ds_dcti_brtaken0_e[3]),
    .pku_annul_ds_dcti_brtaken1_e(pku_annul_ds_dcti_brtaken1_e[3]),
    .pku_valid_e(pku_valid_e[3]),
    .pku_flush_m(pku_flush_m[3]),
    .pku_flush_b(pku_flush_b[3]),
    .pku_flush_lm(pku_flush_lm[3]),
    .pku_flush_lb(pku_flush_lb[3]),
    .pku_flush_f1(pku_flush_f1[3]),
    .pku_flush_f2(pku_flush_f2[3]),
    .pku_inst_cnt_brtaken0(pku_inst_cnt_brtaken03[1:0]),
    .pku_inst_cnt_brtaken1(pku_inst_cnt_brtaken13[1:0]),
    .pku_ds_e(pku_ds_e[3]),
    .swl_divide_wait(swl_divide_wait[3]),
    .swl_cancel_pick_p(swl_cancel_pick_p[3]),
  .tcu_do_mode(tcu_do_mode),
  .lsu_pku_pmen(lsu_pku_pmen),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en)
);

pku_pkd_dp pkd0 (
    .pku_raw_pick_p(pku_raw_pick0_p[3:0]),
    .dec_decode_d(dec_decode0_d),
    .dec_valid_d(dec_valid0_d),
    .swl_cancel_pick_p(swl_cancel_pick_p[3:0]),
    .pku_flush_buffer0(pku_flush_buffer0[3:0]),
    .pku_pick_p(pku_pick_p[3:0]),
    .pku_base_pick_p(pku_base_pick_p[3:0])
);

pku_pck_ctl pck0 (
    .pku_pick_p(pku_pick_p[3:0]),
    .swl_ready_p(swl_ready_p[3:0]),
    .swl_spec_ready_p(swl_spec_ready_p[3:0]),
    .ifu_buf0_valid_p(ifu_buf0_valid_p[3:0]),
    .scan_in(pck0_scanin),
    .scan_out(pck0_scanout),
    .l2clk(l2clk),
    .pku_raw_pick_p(pku_raw_pick0_p[3:0]),
  .lsu_pku_pmen(lsu_pku_pmen),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en)
);


pku_swl_ctl swl4 (
    .tlu_halted(tlu_halted[4]),
    .dec_block_store_stall(dec_block_store_stall[4]),
    .dec_ierr_d(dec_ierr_d[1]),
    .ifu_ibuffer_write_c(ifu_ibuffer_write_c[4]),
    .ifu_buf0_inst(ifu_buf0_inst4[31:0]),
    .swl_divide_wait_all(swl_divide_wait[7:0]),
    .fgu_divide_completion(fgu_divide_completion[4]),
    .lsu_spec_enable(lsu_spec_enable[4]),
    .spc_core_running_status(spc_core_running_status[4]),
    .ifu_buf0_valid_p(ifu_buf0_valid_p[4]),
    .ifu_upper_buffer_valid_p(ifu_upper_buffer_valid_p[4]),
    .pku_raw_pick_p(pku_raw_pick1_p[4]),
    .tlu_flush_ifu(tlu_flush_ifu[4]),
    .dec_true_valid_e(dec_true_valid_e[1]),
    .dec_decode_d(dec_decode1_d),
    .dec_valid_d(dec_valid1_d),
    .tlu_retry_state(tlu_retry_state[4]),
    .lsu_stb_dealloc(lsu_stb_dealloc[4]),
    .lsu_stb_alloc(lsu_stb_alloc[4]),
    .lsu_block_store_kill(lsu_block_store_kill[4]),
    .lsu_sync(lsu_sync[4]),
    .lsu_complete(lsu_complete[4]),
    .dec_br_taken_e(dec_br_taken_e[1]),
    .scan_in(swl4_scanin),
    .scan_out(swl4_scanout),
    .l2clk(l2clk),
    .pku_quiesce(pku_quiesce[4]),
    .pku_lsu_p(pku_lsu_p[4]),
    .pku_fgu_p(pku_fgu_p[4]),
    .pku_pdist_p(pku_pdist_p[4]),
    .pku_twocycle_p(pku_twocycle_p[4]),
    .pku_idest_p(pku_idest_p[4]),
    .pku_fdest_p(pku_fdest_p[4]),
    .pku_isrc_rs1_p(pku_isrc_rs1_p[4]),
    .pku_isrc_rs2_p(pku_isrc_rs2_p[4]),
    .pku_isrc_rd_p(pku_isrc_rd_p[4]),
    .pku_fsrc_rd_p(pku_fsrc_rd_p[4]),
    .swl_ready_p(swl_ready_p[4]),
    .swl_spec_ready_p(swl_spec_ready_p[4]),
    .pku_load_flush_w(pku_load_flush_w[4]),
    .pku_flush_upper_buffer(pku_flush_upper_buffer[4]),
    .pku_flush_buffer0(pku_flush_buffer0[4]),
    .pku_annul_ds_dcti_brtaken0_e(pku_annul_ds_dcti_brtaken0_e[4]),
    .pku_annul_ds_dcti_brtaken1_e(pku_annul_ds_dcti_brtaken1_e[4]),
    .pku_valid_e(pku_valid_e[4]),
    .pku_flush_m(pku_flush_m[4]),
    .pku_flush_b(pku_flush_b[4]),
    .pku_flush_lm(pku_flush_lm[4]),
    .pku_flush_lb(pku_flush_lb[4]),
    .pku_flush_f1(pku_flush_f1[4]),
    .pku_flush_f2(pku_flush_f2[4]),
    .pku_inst_cnt_brtaken0(pku_inst_cnt_brtaken04[1:0]),
    .pku_inst_cnt_brtaken1(pku_inst_cnt_brtaken14[1:0]),
    .pku_ds_e(pku_ds_e[4]),
    .swl_divide_wait(swl_divide_wait[4]),
    .swl_cancel_pick_p(swl_cancel_pick_p[4]),
  .tcu_do_mode(tcu_do_mode),
  .lsu_pku_pmen(lsu_pku_pmen),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en)
);

pku_swl_ctl swl5 (
    .tlu_halted(tlu_halted[5]),
    .dec_block_store_stall(dec_block_store_stall[5]),
    .dec_ierr_d(dec_ierr_d[1]),
    .ifu_ibuffer_write_c(ifu_ibuffer_write_c[5]),
    .ifu_buf0_inst(ifu_buf0_inst5[31:0]),
    .swl_divide_wait_all(swl_divide_wait[7:0]),
    .fgu_divide_completion(fgu_divide_completion[5]),
    .lsu_spec_enable(lsu_spec_enable[5]),
    .spc_core_running_status(spc_core_running_status[5]),
    .ifu_buf0_valid_p(ifu_buf0_valid_p[5]),
    .ifu_upper_buffer_valid_p(ifu_upper_buffer_valid_p[5]),
    .pku_raw_pick_p(pku_raw_pick1_p[5]),
    .tlu_flush_ifu(tlu_flush_ifu[5]),
    .dec_true_valid_e(dec_true_valid_e[1]),
    .dec_decode_d(dec_decode1_d),
    .dec_valid_d(dec_valid1_d),
    .tlu_retry_state(tlu_retry_state[5]),
    .lsu_stb_dealloc(lsu_stb_dealloc[5]),
    .lsu_stb_alloc(lsu_stb_alloc[5]),
    .lsu_block_store_kill(lsu_block_store_kill[5]),
    .lsu_sync(lsu_sync[5]),
    .lsu_complete(lsu_complete[5]),
    .dec_br_taken_e(dec_br_taken_e[1]),
    .scan_in(swl5_scanin),
    .scan_out(swl5_scanout),
    .l2clk(l2clk),
    .pku_quiesce(pku_quiesce[5]),
    .pku_lsu_p(pku_lsu_p[5]),
    .pku_fgu_p(pku_fgu_p[5]),
    .pku_pdist_p(pku_pdist_p[5]),
    .pku_twocycle_p(pku_twocycle_p[5]),
    .pku_idest_p(pku_idest_p[5]),
    .pku_fdest_p(pku_fdest_p[5]),
    .pku_isrc_rs1_p(pku_isrc_rs1_p[5]),
    .pku_isrc_rs2_p(pku_isrc_rs2_p[5]),
    .pku_isrc_rd_p(pku_isrc_rd_p[5]),
    .pku_fsrc_rd_p(pku_fsrc_rd_p[5]),
    .swl_ready_p(swl_ready_p[5]),
    .swl_spec_ready_p(swl_spec_ready_p[5]),
    .pku_load_flush_w(pku_load_flush_w[5]),
    .pku_flush_upper_buffer(pku_flush_upper_buffer[5]),
    .pku_flush_buffer0(pku_flush_buffer0[5]),
    .pku_valid_e(pku_valid_e[5]),
    .pku_annul_ds_dcti_brtaken0_e(pku_annul_ds_dcti_brtaken0_e[5]),
    .pku_annul_ds_dcti_brtaken1_e(pku_annul_ds_dcti_brtaken1_e[5]),
    .pku_flush_m(pku_flush_m[5]),
    .pku_flush_b(pku_flush_b[5]),
    .pku_flush_lm(pku_flush_lm[5]),
    .pku_flush_lb(pku_flush_lb[5]),
    .pku_flush_f1(pku_flush_f1[5]),
    .pku_flush_f2(pku_flush_f2[5]),
    .pku_inst_cnt_brtaken0(pku_inst_cnt_brtaken05[1:0]),
    .pku_inst_cnt_brtaken1(pku_inst_cnt_brtaken15[1:0]),
    .pku_ds_e(pku_ds_e[5]),
    .swl_divide_wait(swl_divide_wait[5]),
    .swl_cancel_pick_p(swl_cancel_pick_p[5]),
  .tcu_do_mode(tcu_do_mode),
  .lsu_pku_pmen(lsu_pku_pmen),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en)
);

pku_swl_ctl swl6 (
    .tlu_halted(tlu_halted[6]),
    .dec_block_store_stall(dec_block_store_stall[6]),
    .dec_ierr_d(dec_ierr_d[1]),
    .ifu_ibuffer_write_c(ifu_ibuffer_write_c[6]),
    .ifu_buf0_inst(ifu_buf0_inst6[31:0]),
    .swl_divide_wait_all(swl_divide_wait[7:0]),
    .fgu_divide_completion(fgu_divide_completion[6]),
    .lsu_spec_enable(lsu_spec_enable[6]),
    .spc_core_running_status(spc_core_running_status[6]),
    .ifu_buf0_valid_p(ifu_buf0_valid_p[6]),
    .ifu_upper_buffer_valid_p(ifu_upper_buffer_valid_p[6]),
    .pku_raw_pick_p(pku_raw_pick1_p[6]),
    .tlu_flush_ifu(tlu_flush_ifu[6]),
    .dec_true_valid_e(dec_true_valid_e[1]),
    .dec_decode_d(dec_decode1_d),
    .dec_valid_d(dec_valid1_d),
    .tlu_retry_state(tlu_retry_state[6]),
    .lsu_stb_dealloc(lsu_stb_dealloc[6]),
    .lsu_stb_alloc(lsu_stb_alloc[6]),
    .lsu_block_store_kill(lsu_block_store_kill[6]),
    .lsu_sync(lsu_sync[6]),
    .lsu_complete(lsu_complete[6]),
    .dec_br_taken_e(dec_br_taken_e[1]),
    .scan_in(swl6_scanin),
    .scan_out(swl6_scanout),
    .l2clk(l2clk),
    .pku_quiesce(pku_quiesce[6]),
    .pku_lsu_p(pku_lsu_p[6]),
    .pku_fgu_p(pku_fgu_p[6]),
    .pku_pdist_p(pku_pdist_p[6]),
    .pku_twocycle_p(pku_twocycle_p[6]),
    .pku_idest_p(pku_idest_p[6]),
    .pku_fdest_p(pku_fdest_p[6]),
    .pku_isrc_rs1_p(pku_isrc_rs1_p[6]),
    .pku_isrc_rs2_p(pku_isrc_rs2_p[6]),
    .pku_isrc_rd_p(pku_isrc_rd_p[6]),
    .pku_fsrc_rd_p(pku_fsrc_rd_p[6]),
    .swl_ready_p(swl_ready_p[6]),
    .swl_spec_ready_p(swl_spec_ready_p[6]),
    .pku_load_flush_w(pku_load_flush_w[6]),
    .pku_flush_upper_buffer(pku_flush_upper_buffer[6]),
    .pku_flush_buffer0(pku_flush_buffer0[6]),
    .pku_valid_e(pku_valid_e[6]),
    .pku_annul_ds_dcti_brtaken0_e(pku_annul_ds_dcti_brtaken0_e[6]),
    .pku_annul_ds_dcti_brtaken1_e(pku_annul_ds_dcti_brtaken1_e[6]),
    .pku_flush_m(pku_flush_m[6]),
    .pku_flush_b(pku_flush_b[6]),
    .pku_flush_lm(pku_flush_lm[6]),
    .pku_flush_lb(pku_flush_lb[6]),
    .pku_flush_f1(pku_flush_f1[6]),
    .pku_flush_f2(pku_flush_f2[6]),
    .pku_inst_cnt_brtaken0(pku_inst_cnt_brtaken06[1:0]),
    .pku_inst_cnt_brtaken1(pku_inst_cnt_brtaken16[1:0]),
    .pku_ds_e(pku_ds_e[6]),
    .swl_divide_wait(swl_divide_wait[6]),
    .swl_cancel_pick_p(swl_cancel_pick_p[6]),
  .tcu_do_mode(tcu_do_mode),
  .lsu_pku_pmen(lsu_pku_pmen),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en)
);

pku_swl_ctl swl7 (
    .tlu_halted(tlu_halted[7]),
    .dec_block_store_stall(dec_block_store_stall[7]),
    .dec_ierr_d(dec_ierr_d[1]),
    .ifu_ibuffer_write_c(ifu_ibuffer_write_c[7]),
    .ifu_buf0_inst(ifu_buf0_inst7[31:0]),
    .swl_divide_wait_all(swl_divide_wait[7:0]),
    .fgu_divide_completion(fgu_divide_completion[7]),
    .lsu_spec_enable(lsu_spec_enable[7]),
    .spc_core_running_status(spc_core_running_status[7]),
    .ifu_buf0_valid_p(ifu_buf0_valid_p[7]),
    .ifu_upper_buffer_valid_p(ifu_upper_buffer_valid_p[7]),
    .pku_raw_pick_p(pku_raw_pick1_p[7]),
    .tlu_flush_ifu(tlu_flush_ifu[7]),
    .dec_true_valid_e(dec_true_valid_e[1]),
    .dec_decode_d(dec_decode1_d),
    .dec_valid_d(dec_valid1_d),
    .tlu_retry_state(tlu_retry_state[7]),
    .lsu_stb_dealloc(lsu_stb_dealloc[7]),
    .lsu_stb_alloc(lsu_stb_alloc[7]),
    .lsu_block_store_kill(lsu_block_store_kill[7]),
    .lsu_sync(lsu_sync[7]),
    .lsu_complete(lsu_complete[7]),
    .dec_br_taken_e(dec_br_taken_e[1]),
    .scan_in(swl7_scanin),
    .scan_out(swl7_scanout),
    .l2clk(l2clk),
    .pku_quiesce(pku_quiesce[7]),
    .pku_lsu_p(pku_lsu_p[7]),
    .pku_fgu_p(pku_fgu_p[7]),
    .pku_pdist_p(pku_pdist_p[7]),
    .pku_twocycle_p(pku_twocycle_p[7]),
    .pku_idest_p(pku_idest_p[7]),
    .pku_fdest_p(pku_fdest_p[7]),
    .pku_isrc_rs1_p(pku_isrc_rs1_p[7]),
    .pku_isrc_rs2_p(pku_isrc_rs2_p[7]),
    .pku_isrc_rd_p(pku_isrc_rd_p[7]),
    .pku_fsrc_rd_p(pku_fsrc_rd_p[7]),
    .swl_ready_p(swl_ready_p[7]),
    .swl_spec_ready_p(swl_spec_ready_p[7]),
    .pku_load_flush_w(pku_load_flush_w[7]),
    .pku_flush_upper_buffer(pku_flush_upper_buffer[7]),
    .pku_flush_buffer0(pku_flush_buffer0[7]),
    .pku_valid_e(pku_valid_e[7]),
    .pku_annul_ds_dcti_brtaken0_e(pku_annul_ds_dcti_brtaken0_e[7]),
    .pku_annul_ds_dcti_brtaken1_e(pku_annul_ds_dcti_brtaken1_e[7]),
    .pku_flush_m(pku_flush_m[7]),
    .pku_flush_b(pku_flush_b[7]),
    .pku_flush_lm(pku_flush_lm[7]),
    .pku_flush_lb(pku_flush_lb[7]),
    .pku_flush_f1(pku_flush_f1[7]),
    .pku_flush_f2(pku_flush_f2[7]),
    .pku_inst_cnt_brtaken0(pku_inst_cnt_brtaken07[1:0]),
    .pku_inst_cnt_brtaken1(pku_inst_cnt_brtaken17[1:0]),
    .pku_ds_e(pku_ds_e[7]),
    .swl_divide_wait(swl_divide_wait[7]),
    .swl_cancel_pick_p(swl_cancel_pick_p[7]),
  .tcu_do_mode(tcu_do_mode),
  .lsu_pku_pmen(lsu_pku_pmen),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en)
);


pku_pkd_dp pkd1 (
    .pku_raw_pick_p(pku_raw_pick1_p[7:4]),
    .dec_decode_d(dec_decode1_d),
    .dec_valid_d(dec_valid1_d),
    .swl_cancel_pick_p(swl_cancel_pick_p[7:4]),
    .pku_flush_buffer0(pku_flush_buffer0[7:4]),
    .pku_pick_p(pku_pick_p[7:4]),
    .pku_base_pick_p(pku_base_pick_p[7:4])
);

pku_pck_ctl pck1 (
    .pku_pick_p(pku_pick_p[7:4]),
    .swl_ready_p(swl_ready_p[7:4]),
    .swl_spec_ready_p(swl_spec_ready_p[7:4]),
    .ifu_buf0_valid_p(ifu_buf0_valid_p[7:4]),
    .scan_in(pck1_scanin),
    .scan_out(pck1_scanout),
    .l2clk(l2clk),
    .pku_raw_pick_p(pku_raw_pick1_p[7:4]),
  .lsu_pku_pmen(lsu_pku_pmen),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en)
);

// fixscan start:
assign swl0_scanin               = scan_in                  ;
assign swl1_scanin               = swl0_scanout             ;
assign swl2_scanin               = swl1_scanout             ;
assign swl3_scanin               = swl2_scanout             ;
assign pck0_scanin               = swl3_scanout             ;
assign swl4_scanin               = pck0_scanout             ;
assign swl5_scanin               = swl4_scanout             ;
assign swl6_scanin               = swl5_scanout             ;
assign swl7_scanin               = swl6_scanout             ;
assign pck1_scanin               = swl7_scanout             ;
assign scan_out                  = pck1_scanout             ;
// fixscan end:
endmodule
