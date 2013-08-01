// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pku_swl_ctl.v
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
module pku_swl_ctl (
  tlu_halted, 
  dec_block_store_stall, 
  dec_ierr_d, 
  tcu_do_mode, 
  lsu_pku_pmen, 
  spc_core_running_status, 
  lsu_spec_enable, 
  ifu_ibuffer_write_c, 
  ifu_buf0_inst, 
  lsu_stb_alloc, 
  lsu_stb_dealloc, 
  lsu_block_store_kill, 
  swl_divide_wait_all, 
  fgu_divide_completion, 
  ifu_buf0_valid_p, 
  ifu_upper_buffer_valid_p, 
  pku_raw_pick_p, 
  tlu_flush_ifu, 
  tlu_retry_state, 
  dec_valid_d, 
  dec_decode_d, 
  dec_true_valid_e, 
  lsu_sync, 
  lsu_complete, 
  dec_br_taken_e, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  swl_ready_p, 
  swl_spec_ready_p, 
  pku_inst_cnt_brtaken0, 
  pku_inst_cnt_brtaken1, 
  pku_annul_ds_dcti_brtaken0_e, 
  pku_annul_ds_dcti_brtaken1_e, 
  pku_load_flush_w, 
  pku_flush_upper_buffer, 
  pku_flush_buffer0, 
  pku_valid_e, 
  pku_flush_m, 
  pku_flush_b, 
  pku_flush_lm, 
  pku_flush_lb, 
  pku_flush_f1, 
  pku_flush_f2, 
  pku_ds_e, 
  swl_divide_wait, 
  swl_cancel_pick_p, 
  pku_quiesce, 
  scan_out, 
  pku_lsu_p, 
  pku_fgu_p, 
  pku_pdist_p, 
  pku_twocycle_p, 
  pku_idest_p, 
  pku_fdest_p, 
  pku_fsrc_rd_p, 
  pku_isrc_rs1_p, 
  pku_isrc_rs2_p, 
  pku_isrc_rd_p);
wire l1clk;
wire spares_scanin;
wire spares_scanout;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire illegal_p;
wire [31:0] i;
wire isrc_rs1_u;
wire isrc_rs2_u;
wire isrc_rd_u;
wire idest_u;
wire fsrc_rs1_u;
wire fsrc_rs2_u;
wire fsrc_rd_u;
wire fdest_u;
wire fgu_u;
wire dcti_u;
wire specbr_u;
wire specld_u;
wire specfp_u;
wire lsu_u;
wire postsync_u;
wire div_u;
wire pdist_u;
wire condbr_u;
wire callclass_u;
wire fccsrc_u;
wire fsrsync_u;
wire twocycle_u;
wire bkick_u;
wire fbkick_u;
wire fccdest_u;
wire fpdest_single_u;
wire fpdest_double_u;
wire fpsrc_single_u;
wire fpsrc_double_u;
wire store_u;
wire windowsync_u;
wire fsrc_rs1_p;
wire fsrc_rs2_p;
wire dcti_p;
wire specbr_p;
wire specld_p;
wire specfp_p;
wire postsync_p;
wire do_mode_f;
wire div_p;
wire condbr_p;
wire callclass_p;
wire fccsrc_p;
wire fsrsync_p;
wire bkick_p;
wire fbkick_p;
wire fccdest_p;
wire fpdest_single_p;
wire fpdest_double_p;
wire fpsrc_single_p;
wire fpsrc_double_p;
wire store_p;
wire windowsync_p;
wire do_modef_scanin;
wire do_modef_scanout;
wire l1clk_pm1;
wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;
wire annul;
wire vld_p;
wire vld_1;
wire valid;
wire vld_d;
wire vld_e;
wire vld_m;
wire vld_b;
wire vld_w;
wire vld_f4;
wire vld_f5;
wire vld_fb;
wire lsu_sync_wait;
wire pick_clken;
wire vldraw_d;
wire vldraw_e;
wire vldraw_m;
wire ext_flush;
wire thread_active;
wire l1clk_pm2;
wire active_clken;
wire external_flushf_scanin;
wire external_flushf_scanout;
wire lsu_ext_flush_in;
wire lsu_ext_flushf_scanin;
wire lsu_ext_flushf_scanout;
wire lsu_ext_flush_w;
wire divide_wait_outstanding;
wire fpdouble_wait;
wire fpdest_single_d;
wire fpdest_single_e;
wire fpdest_single_m;
wire lsu_b;
wire fpdest_single_b;
wire lsu_w;
wire fpdest_single_w;
wire lsu_f4;
wire fpdest_single_f4;
wire fpdouble_cancel;
wire lsu_f5;
wire fpdest_single_f5;
wire fpsingle_wait;
wire fpdest_double_d;
wire fpdest_double_e;
wire fpdest_double_m;
wire fpdest_double_b;
wire fpdest_double_w;
wire fpdest_double_f4;
wire fpsingle_cancel;
wire fpdest_double_f5;
wire fccdep_wait;
wire fccdest_d;
wire fccdest_e;
wire fccdest_m;
wire fccdep_cancel;
wire fccdest_b;
wire fsrsync_wait;
wire fgu_d;
wire fgu_e;
wire fgu_m;
wire fgu_b;
wire fgu_w;
wire fsrsync_cancel;
wire check_rs1_d;
wire idest_d;
wire specld_d;
wire fdest_d;
wire check_rs2_d;
wire check_rd_d;
wire check_rs1_e;
wire idest_e;
wire specld_e;
wire fdest_e;
wire check_rs2_e;
wire check_rd_e;
wire check_rs1_m;
wire fdest_m;
wire check_rs2_m;
wire check_rd_m;
wire check_rs1_b;
wire fdest_b;
wire check_rs2_b;
wire check_rd_b;
wire check_rs1_w;
wire fdest_w;
wire check_rs2_w;
wire check_rd_w;
wire cmp_rs1_rd_d;
wire [4:0] rd_d;
wire cmp_rs2_rd_d;
wire cmp_rd_rd_d;
wire cmp_rs1_rd_e;
wire [4:0] rd_e;
wire cmp_rs2_rd_e;
wire cmp_rd_rd_e;
wire cmp_rs1_rd_m;
wire [4:0] rd_m;
wire cmp_rs2_rd_m;
wire cmp_rd_rd_m;
wire cmp_rs1_rd_b;
wire [4:0] rd_b;
wire cmp_rs2_rd_b;
wire cmp_rd_rd_b;
wire cmp_rs1_rd_w;
wire [4:0] rd_w;
wire cmp_rs2_rd_w;
wire cmp_rd_rd_w;
wire dependent_cancel;
wire wait_rs1_d;
wire wait_rs2_d;
wire wait_rd_d;
wire wait_rs1_e;
wire wait_rs2_e;
wire wait_rd_e;
wire wait_rd_m;
wire wait_rd_b;
wire dependent_wait;
wire tlu_retryf_scanin;
wire tlu_retryf_scanout;
wire retry_state;
wire block_store_stallf_scanin;
wire block_store_stallf_scanout;
wire [1:0] block_store_stall;
wire full_scnt;
wire lsu_sync_raw_w;
wire dcti_d;
wire dcti_e;
wire any_twocycle_m;
wire divide_wait1;
wire stb_cancel;
wire ldst_sync_single;
wire ldst_sync_ldfsr;
wire restore_scnt;
wire pick_raw_p;
wire pick_p;
wire actual_pick_p;
wire flush_p;
wire actual_raw_pick_p;
wire rawflush_p;
wire set_postsync;
wire clear_postsync;
wire postsync_d;
wire flush_d;
wire postsync_e;
wire flush_e;
wire bkick_w;
wire fbkick_fb;
wire br_mispredict_m;
wire callclass_m;
wire bkick_m;
wire postsync_in;
wire post_sync;
wire post_syncf_scanin;
wire post_syncf_scanout;
wire spec_enf_scanin;
wire spec_enf_scanout;
wire spec_en;
wire active_threadf_scanin;
wire active_threadf_scanout;
wire set_postsync_ns;
wire clear_postsync_ns;
wire specbr_m;
wire specld_b;
wire fpvld_w2;
wire lsu_sync_w;
wire postsync_ns_in;
wire postsync_ns;
wire postsync_nsf_scanin;
wire postsync_nsf_scanout;
wire set_dep_wait;
wire clear_dep_wait;
wire dep_wait_in;
wire set_dcti_wait;
wire clear_dcti_wait;
wire dcti_wait_in;
wire set_dcti_couple_wait;
wire clear_dcti_couple_wait;
wire dcti_couple_wait_in;
wire flush_div;
wire div_d;
wire div_e;
wire set_divide_wait_in;
wire clear_divide_wait_in;
wire divide_wait_in;
wire divide_waitf_scanin;
wire divide_waitf_scanout;
wire divide_wait1f_scanin;
wire divide_wait1f_scanout;
wire otherdivide_wait_in;
wire lsu_completef_scanin;
wire lsu_completef_scanout;
wire lsu_complete_d1;
wire lsu_complete_d2;
wire set_lsu_sync_wait;
wire clear_lsu_sync_wait;
wire lsu_sync_wait_in;
wire lsu_sync_waitf_scanin;
wire lsu_sync_waitf_scanout;
wire clear_lsu_sync_single;
wire ldst_sync_single_in;
wire ldst_sync_singlef_scanin;
wire ldst_sync_singlef_scanout;
wire clear_lsu_sync_ldfsr;
wire fsrsync_w;
wire specld_w;
wire idest_w;
wire ldst_sync_ldfsr_in;
wire ldst_sync_ldfsrf_scanin;
wire ldst_sync_ldfsrf_scanout;
wire br_flush1_in;
wire br_mispredict_e;
wire brflush1_f_scanin;
wire brflush1_f_scanout;
wire br_flush1;
wire br_flush2_in;
wire brflush2_f_scanin;
wire brflush2_f_scanout;
wire brflush2;
wire not_annul_ds1_in;
wire annul_ds_dcti_e;
wire not_annul_ds1_f_scanin;
wire not_annul_ds1_f_scanout;
wire not_annul_ds1;
wire not_annul_ds2_in;
wire not_annul_ds2_f_scanin;
wire not_annul_ds2_f_scanout;
wire not_annul_ds2;
wire store_ds1_in;
wire pick_store_d;
wire store_ds1_f_scanin;
wire store_ds1_f_scanout;
wire store_ds1;
wire store_ds2_in;
wire store_ds2_f_scanin;
wire store_ds2_f_scanout;
wire store_ds2;
wire store_ds;
wire pick_store_p;
wire late_flush_p;
wire pickstoref_scanin;
wire pickstoref_scanout;
wire alloc_scnt;
wire dealloc_scnt;
wire inc_scnt_raw;
wire dec_scnt_raw;
wire hold_scnt_raw;
wire annul_store_in;
wire annul_store_f_scanin;
wire annul_store_f_scanout;
wire annul_store_d;
wire inc_scnt;
wire dec1_scnt;
wire hold_scnt;
wire dec2_scnt;
wire inc2_ccnt;
wire inc_ccnt_raw;
wire inc1_ccnt;
wire hold_ccnt_raw;
wire hold_ccnt;
wire dec_ccnt_raw;
wire dec1_ccnt;
wire [3:0] ccnt_in;
wire [3:0] ccnt;
wire [3:0] scnt_in;
wire [3:0] scnt;
wire scnt_f_scanin;
wire scnt_f_scanout;
wire alloc_ccnt;
wire dealloc_ccnt;
wire [3:0] ccnt_raw_in;
wire ccnt_f_scanin;
wire ccnt_f_scanout;
wire stb_wait_in;
wire rdy_in;
wire spec_in;
wire vld_d_in;
wire specbr_d_in;
wire specld_d_in;
wire vld_e_in;
wire specbr_e_in;
wire specld_e_in;
wire vld_m_in;
wire specld_m_in;
wire vld_b_in;
wire specld_b_in;
wire vld_w_in;
wire specld_w_in;
wire ready_in;
wire readyf_scanin;
wire readyf_scanout;
wire spec_ready_in;
wire spec_readyf_scanin;
wire spec_readyf_scanout;
wire allds_actual_p;
wire allds_p;
wire allds_is_p;
wire allds_actual_d;
wire allds_d;
wire allds_is_d;
wire allds_p_in;
wire allds_p_f_scanin;
wire allds_p_f_scanout;
wire allds_d_in;
wire allds_d_f_scanin;
wire allds_d_f_scanout;
wire allds_e_in;
wire allds_e_f_scanin;
wire allds_e_f_scanout;
wire set_vld_d;
wire clear_vld_d;
wire vld_df_scanin;
wire vld_df_scanout;
wire vld_ef_scanin;
wire vld_ef_scanout;
wire valid_e;
wire valid_e_in;
wire valid_ef_scanin;
wire valid_ef_scanout;
wire vld_mf_scanin;
wire vld_mf_scanout;
wire flush_m;
wire vld_bf_scanin;
wire vld_bf_scanout;
wire flush_b;
wire vld_wf_scanin;
wire vld_wf_scanout;
wire fpvld_w1_in;
wire specfp_w;
wire fpvld_w1f_scanin;
wire fpvld_w1f_scanout;
wire fpvld_w1;
wire fpvld_w2_in;
wire fpvld_w2f_scanin;
wire fpvld_w2f_scanout;
wire set_vldraw_d;
wire clear_vldraw_d;
wire rawflush_d;
wire vldraw_d_in;
wire vldraw_df_scanin;
wire vldraw_df_scanout;
wire vldraw_e_in;
wire vldraw_ef_scanin;
wire vldraw_ef_scanout;
wire vldraw_m_in;
wire vldraw_mf_scanin;
wire vldraw_mf_scanout;
wire annul_ds_dcti_mf_scanin;
wire annul_ds_dcti_mf_scanout;
wire annul_ds_dcti_m;
wire vldcnt_e_brtaken0_in;
wire vldcnt_e_brtaken1_in;
wire vldcnt_m_in;
wire vld_f4_in;
wire flush_w;
wire vld_f4f_scanin;
wire vld_f4f_scanout;
wire vld_f5_in;
wire flush_f4;
wire vld_f5f_scanin;
wire vld_f5f_scanout;
wire vld_fb_in;
wire flush_f5;
wire vld_fbf_scanin;
wire vld_fbf_scanout;
wire any_twocycle_p;
wire [23:0] data_d_in;
wire [23:0] data_d;
wire data_df_scanin;
wire data_df_scanout;
wire any_twocycle_d;
wire bkick_d;
wire lsu_d;
wire fbkick_d;
wire specfp_d;
wire condbr_d;
wire callclass_d;
wire annul_d;
wire specbr_d;
wire specld_m;
wire rdf_scanin;
wire rdf_scanout;
wire anytwocyclef_scanin;
wire anytwocyclef_scanout;
wire any_twocycle_e;
wire specldf_scanin;
wire specldf_scanout;
wire postsyncf_scanin;
wire postsyncf_scanout;
wire divf_scanin;
wire divf_scanout;
wire dctif_scanin;
wire dctif_scanout;
wire specbref_scanin;
wire specbref_scanout;
wire specbr_e;
wire specbrmf_scanin;
wire specbrmf_scanout;
wire annulf_scanin;
wire annulf_scanout;
wire annul_e;
wire callclassf_scanin;
wire callclassf_scanout;
wire callclass_e;
wire condbrf_scanin;
wire condbrf_scanout;
wire condbr_e;
wire idestf_scanin;
wire idestf_scanout;
wire idest_m;
wire idest_b;
wire fdestf_scanin;
wire fdestf_scanout;
wire specfpf_scanin;
wire specfpf_scanout;
wire specfp_e;
wire specfp_m;
wire specfp_b;
wire fbkickf_scanin;
wire fbkickf_scanout;
wire fbkick_e;
wire fbkick_m;
wire fbkick_b;
wire fbkick_w;
wire fbkick_f4;
wire fbkick_f5;
wire fgu_d_in;
wire fguf_scanin;
wire fguf_scanout;
wire bkickf_scanin;
wire bkickf_scanout;
wire bkick_e;
wire bkick_b;
wire fpdest_doublef_scanin;
wire fpdest_doublef_scanout;
wire fpdest_singlef_scanin;
wire fpdest_singlef_scanout;
wire fccdestf_scanin;
wire fccdestf_scanout;
wire lsu_d_in;
wire lsuf_scanin;
wire lsuf_scanout;
wire lsu_e;
wire lsu_m;
wire lsu_sync_early;
wire lsu_sync_in;
wire lsu_syncf_scanin;
wire lsu_syncf_scanout;
wire lsu_sync_raw_in;
wire lsu_sync_rawf_scanin;
wire lsu_sync_rawf_scanout;
wire flush_f3;
wire br_mispredict_m_in;
wire br_mispredict_mf_scanin;
wire br_mispredict_mf_scanout;
wire flush_m_in;
wire flush_mf_scanin;
wire flush_mf_scanout;
wire [6:0] i_unused;


input tlu_halted;		// put thread in halt state by gating off ready signals

input dec_block_store_stall;	// there is a block store stall in effect at the d stage for this thread

input dec_ierr_d;		// an inst error has occured at d stage: illegal, parity or ifetch error

input tcu_do_mode;

input lsu_pku_pmen;		// power management enable for pku

input spc_core_running_status;	// thread is active
input lsu_spec_enable;    	// enable speculation; assume this is serializing (if not pipeline it)

input ifu_ibuffer_write_c;	// ifu is writing 1 or more instructions into the ibuffers
input [31:0] ifu_buf0_inst;	// oldest instruction at pick 

input lsu_stb_alloc;	  	// lsu has allocated store in stb; sent in b_stage; increment ccnt by 1
input lsu_stb_dealloc;    	// lsu is deallocating store in stb; decrement sscnt,ccnt by 1
input lsu_block_store_kill;  	// error occured during block store; use this to set scnt=ccnt=0

input [7:0] swl_divide_wait_all;  // divide block for all threads (cycle detected) 

input fgu_divide_completion;	  // divide completion for any thread


//input ibuffer_write;		// any write to the ibuffer (C stage)  - REMOVED because it didn't make timing

input ifu_buf0_valid_p;		// ifu_buf0_valid_p for instruction buffer
input ifu_upper_buffer_valid_p;	// ifu_upper_buffer_valid_p for instruction buffer


input pku_raw_pick_p;  		// unqualified pick for this thread
input tlu_flush_ifu;		// flush this thread (traps)

input tlu_retry_state;		// IF the first part of a retry, must let it go even in dcti w/out DS (part of address optimization)
input dec_valid_d;		// inst is valid at decode for relevant TG
input dec_decode_d;		// decoded inst at decode for relevant TG

input dec_true_valid_e;		// take illegals and other exceptions into account

input lsu_sync;			// lsu needs thread to resync due to dcache_miss, ASI register access, etc.
input lsu_complete;	        // completion of lsu sync event

input dec_br_taken_e;		// br is taken for e stage (br mispredict)

input l2clk;
input scan_in;
input tcu_pce_ov;		// scan signals
input spc_aclk;
input spc_bclk;
input tcu_scan_en;

output swl_ready_p;		// non-speculative ready state
output swl_spec_ready_p;	// speculative ready state, past a br or load


output [1:0] pku_inst_cnt_brtaken0; 	// count of inst at e,m,b pipe stages (to dec)
output [1:0] pku_inst_cnt_brtaken1; 	// count of inst at e,m,b pipe stages (to dec)

output pku_annul_ds_dcti_brtaken0_e;	// the DS of the dcti at e stage is annulled
output pku_annul_ds_dcti_brtaken1_e;	// the DS of the dcti at e stage is annulled

output pku_load_flush_w; 	// lsu flush to fetch (fetch the npc of the load)

output pku_flush_upper_buffer;	// flush signals directly off a flop to IB's
output pku_flush_buffer0;       // kill valid for buffer 0 ALSO force shift of IB's

output pku_valid_e;		// this thread has a valid instruction at the e stage (to dec)

output pku_flush_m;		// tell trap to flush m
output pku_flush_b;		// tell trap to flush b

output pku_flush_lm;		// flush signals unique to the lsu
output pku_flush_lb;

output pku_flush_f1;		// flush signals unique to the fgu
output pku_flush_f2;

output pku_ds_e;		// the instruction at e stage is a DS

output swl_divide_wait; 	// this thread is waiting on divide; send out to all other threads

output swl_cancel_pick_p; 	// cancel pick of this thread due to hazard

output pku_quiesce;		// quiesce signal for tlu

output scan_out;


output pku_lsu_p;		// predecodes for the decode unit (for timing)
output pku_fgu_p;
output pku_pdist_p;
output pku_twocycle_p;
output pku_idest_p;
output pku_fdest_p;
output pku_fsrc_rd_p;
output pku_isrc_rs1_p;
output pku_isrc_rs2_p;
output pku_isrc_rd_p;

// l1clk: no power management; clock always runs

pku_swl_ctl_l1clkhdr_ctl_macro clkgen (
 .l1en (1'b1 ),
 .l1clk(l1clk),
  .l2clk(l2clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

pku_swl_ctl_spare_ctl_macro__num_4 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// scan renames
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;
assign se = tcu_scan_en;
// end scan

// all illegals are mapped to this before they are written into the icache
assign illegal_p = ~i[31] & ~i[30] & ~i[24] & ~i[23] & ~i[22];

// --- autogenerated by n2decode view=pku Wed Aug 10 15:04:21 CDT 2005

assign isrc_rs1_u = (i[31]&!i[21]&i[20]&!i[19]) | (i[31]&!i[21]&!i[17]&i[16]) | (
    i[31]&!i[21]&!i[19]&!i[16]&!i[13]) | (i[31]&!i[22]&!i[20]&!i[19]
    &!i[13]&!i[12]&!i[6]&!i[5]) | (i[31]&!i[22]&i[20]&!i[12]&!i[11]&!i[10]) | (
    i[31]&!i[28]&!i[22]&!i[19]&i[13]) | (i[31]&!i[26]&!i[22]&!i[19]&i[13]) | (
    !i[30]&!i[24]&i[23]&i[22]) | (i[31]&i[21]&i[20]&i[19]) | (i[31]&i[22]
    &!i[20]&i[19]) | (i[31]&i[23]&!i[21]&i[20]) | (!i[30]&i[23]&i[22]
    &!i[20]) | (i[31]&!i[23]&!i[22]) | (i[31]&!i[24]) | (i[31]&i[30]) | (
    i[31]&i[19]&!i[9]&i[7]);

assign isrc_rs2_u = (i[31]&i[30]&i[24]&i[22]&!i[19]) | (i[31]&!i[22]&!i[21]
    &!i[19]&!i[13]) | (i[31]&i[23]&i[22]&!i[21]&!i[13]) | (i[31]&i[23]
    &i[22]&!i[20]&!i[13]) | (i[31]&!i[22]&i[20]&!i[13]&!i[12]&!i[11]
    &!i[10]) | (i[31]&!i[23]&i[21]&!i[13]) | (i[31]&i[30]&!i[13]) | (
    i[31]&!i[24]&!i[13]) | (i[31]&!i[23]&!i[22]&!i[13]);

assign isrc_rd_u = (i[31]&i[30]&i[22]&i[21]&i[20]) | (i[31]&i[30]&i[22]&i[21]
    &!i[19]) | (i[31]&i[30]&!i[24]&!i[22]&i[21]);

assign idest_u = (i[31]&!i[30]&!i[23]&i[20]&!i[19]) | (i[31]&!i[30]&!i[23]&!i[19]
    &!i[17]) | (i[31]&!i[30]&!i[23]&!i[20]&i[19]) | (i[31]&!i[30]&!i[13]
    &!i[11]&!i[10]&i[9]) | (i[31]&!i[30]&!i[22]&i[21]&i[20]&!i[12]&!i[11]
    &!i[9]) | (i[31]&!i[30]&i[22]&i[21]&i[16]) | (i[30]&i[24]&i[22]&!i[19]) | (
    i[30]&!i[24]&i[22]&i[19]) | (i[31]&!i[30]&!i[23]&!i[19]&!i[16]) | (
    i[30]&!i[24]&!i[21]) | (i[24]&i[23]&i[22]&!i[20]&!i[19]) | (i[31]
    &!i[30]&i[22]&i[21]&i[19]) | (!i[30]&!i[23]&!i[22]) | (i[31]&!i[30]
    &!i[24]) | (!i[31]&i[30]);

assign fsrc_rs1_u = (i[31]&!i[30]&!i[13]&!i[11]&i[10]&i[9]&!i[7]&!i[6]) | (
    i[31]&!i[30]&!i[13]&!i[12]&i[9]&!i[8]&i[5]) | (i[31]&!i[30]&i[20]
    &!i[13]&i[10]&!i[9]&i[8]) | (i[31]&!i[30]&i[20]&!i[13]&i[11]&!i[9]
    &i[8]&!i[5]) | (i[31]&!i[30]&!i[19]&!i[13]&i[11]&i[10]&i[7]&!i[6]) | (
    i[31]&!i[30]&i[20]&!i[13]&i[11]&!i[7]&i[6]) | (i[31]&!i[30]&i[20]
    &!i[19]&!i[13]&!i[11]&i[10]&!i[5]) | (i[31]&!i[30]&!i[22]&!i[20]
    &!i[19]&!i[13]&!i[12]&i[11]) | (i[31]&!i[30]&!i[13]&!i[12]&i[11]&i[9]
    &!i[8]);

assign fsrc_rs2_u = (i[31]&!i[30]&!i[13]&i[11]&i[8]&!i[6]) | (i[31]&!i[30]&!i[13]
    &i[11]&!i[8]&i[6]) | (i[31]&!i[30]&!i[13]&i[11]&i[9]&!i[7]) | (i[31]
    &!i[30]&!i[13]&i[11]&!i[9]&i[7]) | (i[31]&!i[30]&!i[22]&!i[13]&i[11]
    &!i[10]) | (i[31]&!i[30]&!i[19]&!i[13]&!i[11]&i[10]) | (i[31]&!i[30]
    &i[24]&i[23]&!i[22]&i[21]&!i[20]);

assign fsrc_rd_u = (i[31]&i[30]&i[24]&!i[22]&i[21]&!i[19]) | (i[31]&i[30]&i[24]
    &i[21]&i[20]&i[19]);

assign fdest_u = (i[31]&!i[30]&!i[13]&i[10]&i[9]) | (i[31]&!i[30]&i[24]&i[23]
    &!i[22]&i[21]&!i[20]&!i[9]) | (i[31]&!i[30]&!i[22]&!i[19]&!i[13]
    &i[11]) | (i[31]&i[30]&i[24]&!i[21]&i[20]) | (i[31]&i[30]&i[24]&!i[21]
    &!i[19]);

assign fgu_u = (i[31]&!i[30]&!i[13]&i[12]&i[5]) | (i[31]&!i[30]&!i[13]&i[9]&i[8]) | (
    i[31]&i[24]&!i[23]&i[22]&i[21]&i[20]&!i[19]) | (i[31]&!i[30]&!i[22]
    &!i[13]&i[11]) | (i[31]&!i[30]&!i[22]&!i[13]&i[10]) | (i[31]&!i[30]
    &i[22]&i[21]&!i[20]&i[19]) | (i[31]&!i[30]&i[24]&i[23]&i[21]&!i[20]) | (
    i[31]&i[30]&i[24]&!i[22]&i[21]) | (i[31]&!i[30]&!i[24]&i[22]&i[19]) | (
    i[31]&!i[30]&!i[24]&i[22]&i[20]) | (i[31]&i[24]&!i[22]&i[21]&!i[20]
    &!i[19]);

assign dcti_u = (i[24]&i[23]&i[22]&!i[21]&!i[20]) | (!i[31]&i[23]) | (!i[31]
    &i[22]) | (!i[31]&i[30]);

assign specbr_u = (!i[31]&!i[30]&i[22]) | (!i[31]&!i[30]&i[23]);

assign specld_u = (i[31]&i[30]&!i[21]);

assign specfp_u = (i[31]&!i[30]&!i[13]&i[12]&i[5]) | (i[31]&!i[30]&!i[13]&i[10]
    &i[9]) | (i[31]&!i[30]&!i[22]&!i[13]&i[11]) | (i[31]&!i[30]&i[24]
    &i[23]&!i[22]&i[21]&!i[20]);

assign lsu_u = (i[31]&i[24]&!i[23]&i[22]&i[20]&!i[19]&i[16]) | (i[31]&i[24]
    &!i[23]&i[22]&!i[21]&!i[17]&i[16]) | (i[31]&i[24]&!i[23]&i[22]&!i[21]
    &!i[20]&i[19]) | (i[31]&i[24]&!i[23]&i[22]&!i[21]&!i[19]&!i[16]) | (
    i[31]&i[24]&i[23]&!i[22]&!i[21]&i[20]) | (i[31]&!i[28]&i[24]&i[23]
    &!i[22]&!i[21]&!i[19]) | (i[31]&i[24]&i[23]&i[20]&i[19]) | (i[31]
    &i[29]&i[24]&i[23]&!i[22]&!i[21]) | (i[31]&i[24]&!i[23]&i[22]&!i[21]
    &i[1]) | (i[31]&i[24]&!i[23]&i[22]&!i[21]&i[5]) | (i[31]&i[24]&!i[23]
    &i[22]&!i[21]&i[6]) | (i[31]&i[30]);

assign postsync_u = (i[31]&i[24]&i[22]&!i[21]&!i[20]&i[6]) | (i[31]&i[24]&i[22]
    &!i[21]&!i[20]&i[5]) | (i[31]&i[24]&i[22]&!i[21]&!i[20]&i[1]) | (
    i[31]&i[24]&i[22]&!i[21]&!i[20]&!i[17]) | (i[31]&i[24]&i[22]&!i[21]
    &!i[20]&!i[15]) | (i[31]&i[24]&i[20]&!i[19]&!i[13]&!i[11]&i[10]&!i[9]) | (
    i[31]&!i[30]&!i[28]&i[24]&i[23]&!i[21]&!i[20]) | (i[24]&i[23]&i[22]
    &i[21]) | (i[31]&!i[30]&!i[26]&i[24]&i[23]&!i[21]&!i[20]) | (i[31]
    &!i[30]&i[24]&!i[23]&!i[22]&i[21]&!i[20]&!i[19]) | (i[31]&!i[30]
    &i[24]&i[23]&!i[22]&!i[21]&i[20]) | (i[31]&i[24]&!i[23]&i[22]&i[20]
    &!i[19]) | (i[24]&i[23]&i[22]&!i[20]) | (i[31]&!i[30]&i[22]&!i[21]
    &i[19]) | (i[30]&i[24]&!i[20]&i[19]) | (i[30]&i[22]&i[21]&i[19]) | (
    i[31]&!i[30]&!i[24]&i[22]&!i[21]&i[20]) | (!i[31]&i[30]);

assign div_u = (i[31]&!i[30]&!i[20]&!i[19]&!i[13]&!i[11]&i[10]) | (i[31]&!i[30]
    &!i[20]&!i[13]&i[8]&i[7]) | (i[31]&!i[30]&!i[23]&i[22]&i[21]&!i[20]
    &i[19]) | (i[31]&!i[30]&!i[24]&i[22]&i[21]&i[20]);

assign pdist_u = (i[31]&!i[30]&!i[13]&!i[11]&i[9]&i[8]&i[7]&!i[5]);

assign condbr_u = (!i[31]&!i[30]&i[27]&i[22]) | (!i[31]&!i[30]&i[25]&i[22]) | (
    !i[31]&!i[30]&i[26]&i[22]) | (!i[31]&!i[30]&i[27]&i[23]) | (!i[31]
    &!i[30]&i[25]&i[23]) | (!i[31]&!i[30]&i[26]&i[23]);

assign callclass_u = (i[24]&i[23]&i[22]&!i[21]&!i[20]) | (!i[31]&i[30]);

assign fccsrc_u = (!i[30]&i[24]&i[23]&!i[22]&i[21]&i[19]&!i[13]&!i[9]&!i[7]) | (
    !i[30]&i[24]&!i[23]&i[22]&i[21]&!i[20]&!i[19]&!i[18]) | (!i[31]&!i[30]
    &i[24]&i[23]) | (!i[31]&!i[30]&i[24]&i[22]);

assign fsrsync_u = (i[31]&!i[30]&!i[13]&!i[11]&i[9]&i[8]&i[7]&!i[5]) | (i[31]
    &i[30]&i[24]&!i[22]&!i[20]&i[19]);

assign twocycle_u = (i[31]&i[30]&i[24]&i[22]&!i[19]) | (i[31]&i[30]&!i[24]&!i[22]
    &i[21]&i[20]&i[19]);

assign bkick_u = (i[31]&i[24]&!i[23]&i[22]&!i[21]&i[20]&i[19]) | (i[31]&i[24]
    &i[23]&!i[21]&!i[20]&i[19]) | (i[31]&i[30]&i[24]&!i[22]&!i[20]&i[19]);

assign fbkick_u = (i[31]&!i[30]&i[20]&!i[19]&!i[13]&!i[11]&i[10]&!i[9]) | (
    i[31]&i[24]&!i[23]&i[22]&i[21]&i[20]&!i[19]) | (i[31]&!i[30]&i[24]
    &!i[23]&!i[22]&i[21]&!i[20]&!i[19]) | (!i[30]&i[24]&i[23]&i[22]&i[21]
    &!i[20]) | (i[31]&!i[30]&!i[24]&i[22]&!i[21]&i[19]) | (i[31]&!i[30]
    &!i[24]&i[22]&!i[21]&i[20]);

assign fccdest_u = (i[31]&!i[30]&i[19]&!i[13]&i[9]);

assign fpdest_single_u = (i[31]&!i[30]&!i[19]&!i[13]&i[12]&i[7]) | (i[31]&!i[30]
    &!i[13]&i[9]&i[8]&i[6]&i[5]) | (i[31]&!i[30]&!i[13]&i[9]&i[8]&i[7]
    &i[5]) | (i[31]&!i[30]&!i[20]&!i[13]&!i[11]&i[10]&i[5]) | (i[31]
    &!i[30]&!i[22]&!i[19]&!i[13]&i[12]&i[11]&!i[8]) | (i[31]&!i[30]&!i[19]
    &!i[13]&i[11]&!i[8]&i[5]) | (i[31]&i[24]&i[23]&!i[22]&!i[20]&i[19]
    &!i[9]&i[5]) | (i[31]&!i[30]&!i[20]&!i[19]&!i[13]&!i[12]&!i[10]&i[5]) | (
    i[31]&!i[30]&i[20]&!i[13]&i[11]&i[10]&i[5]) | (i[31]&i[30]&i[24]
    &!i[22]&!i[19]);

assign fpdest_double_u = (i[31]&!i[30]&!i[22]&!i[20]&!i[19]&!i[13]&i[12]&!i[9]
    &!i[7]) | (i[31]&!i[30]&i[19]&!i[13]&i[9]) | (i[31]&!i[30]&!i[20]
    &!i[19]&!i[13]&i[11]&i[10]) | (i[31]&i[24]&!i[22]&i[19]&!i[13]&i[6]) | (
    i[31]&!i[30]&!i[13]&i[10]&i[9]&!i[5]) | (i[31]&!i[30]&!i[13]&!i[11]
    &i[10]&i[9]&!i[7]&!i[6]) | (i[31]&!i[30]&i[20]&!i[13]&i[11]&!i[10]
    &i[8]) | (i[31]&!i[30]&!i[13]&!i[11]&i[10]&i[9]&!i[8]) | (i[31]&!i[30]
    &i[24]&i[23]&!i[22]&i[21]&!i[20]&!i[11]&i[6]) | (i[31]&i[30]&i[24]
    &i[20]&i[19]) | (i[31]&!i[30]&!i[22]&!i[13]&!i[12]&i[11]&!i[5]);

assign fpsrc_single_u = (i[31]&!i[30]&!i[22]&!i[13]&i[12]&i[11]&!i[6]) | (i[31]
    &!i[30]&!i[13]&!i[11]&i[10]&i[9]&!i[6]&!i[5]) | (i[31]&!i[30]&!i[13]
    &i[10]&i[8]&!i[7]&!i[6]&i[5]) | (i[31]&!i[30]&!i[13]&i[11]&!i[8]&i[6]
    &i[5]) | (i[31]&!i[30]&!i[13]&i[11]&!i[7]&i[6]&i[5]) | (i[31]&!i[30]
    &!i[13]&i[10]&!i[8]&i[7]&!i[6]&i[5]) | (i[31]&!i[30]&!i[13]&i[11]
    &i[7]&!i[6]&i[5]) | (i[31]&!i[30]&!i[13]&i[11]&!i[9]&i[8]&i[5]) | (
    i[31]&!i[30]&!i[13]&i[9]&!i[8]&!i[7]&i[5]) | (i[31]&i[24]&i[23]&!i[22]
    &i[21]&!i[20]&i[5]) | (i[31]&i[30]&i[24]&!i[22]&!i[19]);

assign fpsrc_double_u = (i[31]&!i[30]&!i[13]&!i[11]&i[8]&i[7]) | (i[31]&!i[30]
    &!i[13]&!i[11]&i[10]&i[8]&i[6]) | (i[31]&!i[30]&!i[13]&i[10]&!i[9]
    &i[8]&!i[5]) | (i[31]&!i[30]&!i[22]&!i[13]&!i[11]&i[10]&!i[8]&!i[7]
    &!i[6]) | (i[31]&!i[30]&!i[13]&i[10]&i[7]&!i[6]&!i[5]) | (i[31]&!i[30]
    &i[20]&!i[13]&i[11]&i[8]&!i[6]&!i[5]) | (i[31]&!i[30]&!i[13]&!i[11]
    &i[10]&i[7]&i[6]) | (i[31]&!i[30]&!i[13]&i[10]&!i[7]&i[6]&!i[5]) | (
    i[31]&!i[30]&!i[13]&i[11]&i[9]&!i[8]&!i[5]) | (i[31]&!i[30]&!i[13]
    &i[11]&!i[9]&i[6]&!i[5]) | (i[31]&!i[30]&i[24]&i[23]&!i[22]&i[21]
    &!i[20]&!i[11]&!i[5]) | (i[31]&i[30]&i[24]&i[20]&i[19]);

assign store_u = (i[31]&!i[30]&!i[26]&i[24]&i[23]&!i[22]&!i[21]&!i[19]) | (
    i[31]&i[30]&i[21]&!i[19]) | (i[31]&!i[30]&!i[28]&i[24]&i[23]&!i[22]
    &!i[21]&!i[19]) | (i[31]&!i[30]&i[24]&i[23]&!i[22]&!i[21]&i[20]) | (
    i[31]&i[30]&!i[22]&i[21]) | (i[31]&i[30]&!i[24]&i[21]);

assign windowsync_u = (i[31]&i[24]&!i[23]&i[22]&!i[21]&i[20]&i[19]) | (!i[30]
    &i[24]&i[23]&i[22]&i[21]&!i[20]) | (!i[30]&i[24]&i[23]&i[22]&!i[20]
    &i[19]);

// end autogeneration


assign pku_isrc_rs1_p  = isrc_rs1_u      & ~illegal_p;	
assign pku_isrc_rs2_p  = isrc_rs2_u      & ~illegal_p;	
assign pku_isrc_rd_p   = isrc_rd_u       & ~illegal_p;	
assign pku_idest_p     = idest_u         & ~illegal_p;	
assign fsrc_rs1_p      = fsrc_rs1_u      & ~illegal_p;	
assign fsrc_rs2_p      = fsrc_rs2_u      & ~illegal_p;	
assign pku_fsrc_rd_p   = fsrc_rd_u       & ~illegal_p;	
assign pku_fdest_p     = fdest_u         & ~illegal_p;	
assign pku_fgu_p       = fgu_u           & ~illegal_p;	
assign dcti_p          = dcti_u          & ~illegal_p;	
assign specbr_p        = specbr_u        & ~illegal_p;	
assign specld_p        = specld_u        & ~illegal_p;	
assign specfp_p        = specfp_u        & ~illegal_p;	
assign pku_lsu_p       = lsu_u           & ~illegal_p;	
assign postsync_p      = postsync_u      & ~do_mode_f & ~illegal_p;	
assign div_p           = div_u           & ~illegal_p;	
assign pku_pdist_p     = pdist_u         & ~illegal_p;	
assign condbr_p        = condbr_u        & ~illegal_p;	
assign callclass_p     = callclass_u     & ~illegal_p;	
assign fccsrc_p        = fccsrc_u        & ~illegal_p;	
assign fsrsync_p       = fsrsync_u       & ~illegal_p;	
assign pku_twocycle_p  = twocycle_u      & ~illegal_p;	
assign bkick_p         = bkick_u         & ~illegal_p;	
assign fbkick_p        = fbkick_u        & ~illegal_p;	
assign fccdest_p       = fccdest_u       & ~illegal_p;	
assign fpdest_single_p = fpdest_single_u & ~fsrc_rd_u & ~illegal_p;	// store-floats don't have a fpdest
assign fpdest_double_p = fpdest_double_u & ~fsrc_rd_u & ~illegal_p;	
assign fpsrc_single_p  = fpsrc_single_u  & ~illegal_p;	
assign fpsrc_double_p  = fpsrc_double_u  & ~illegal_p;	
assign store_p         = store_u         & ~illegal_p;	
assign windowsync_p    = windowsync_u    & ~illegal_p;	

pku_swl_ctl_msff_ctl_macro__width_1 do_modef  (
 .scan_in(do_modef_scanin),
 .scan_out(do_modef_scanout),
 .l1clk(l1clk_pm1),
 .din  (tcu_do_mode),
 .dout (do_mode_f),
  .siclk(siclk),
  .soclk(soclk)
);



assign i[31:0] = ifu_buf0_inst[31:0];

assign rs1[4:0] = i[18:14];
assign rs2[4:0] = i[4:0];
assign rd[4:0] = i[29:25];

assign annul = i[29];

// instruction buffers will be flushing this cycle; qualify input valids for this flush cycle
assign vld_p = ifu_buf0_valid_p & ~pku_flush_buffer0;
assign vld_1 = ifu_upper_buffer_valid_p & ~pku_flush_upper_buffer;

// quiesce signal

assign valid = (ifu_buf0_valid_p | vld_d | vld_e | vld_m | vld_b | vld_w | 
		vld_f4 | vld_f5 | vld_fb |
		swl_divide_wait | lsu_sync_wait);

assign pku_quiesce = ~valid;

// l1clk_pm2: fine grain power management; shut down clocks whenver pick is idle

assign pick_clken = (((ifu_buf0_valid_p & (swl_ready_p | swl_spec_ready_p)) |  // valid inst and ready to pick
	             vldraw_d | vldraw_e | vldraw_m |		               // must get inst cnts right
		     vld_d | vld_e | vld_m | vld_b | vld_w | 
		     vld_f4 | vld_f5 | vld_fb |   		               // clock fgu ops down the pipe 
		     ext_flush) & thread_active) | ~lsu_pku_pmen;

pku_swl_ctl_l1clkhdr_ctl_macro clkgenpm (
 .l1en (pick_clken ),
 .l1clk(l1clk_pm2),
  .l2clk(l2clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

// l1clk_pm1: coarse grain power management; shut down clocks if thread is not active

assign active_clken = thread_active | ~lsu_pku_pmen;

pku_swl_ctl_l1clkhdr_ctl_macro clkgenactive (
 .l1en (active_clken ),
 .l1clk(l1clk_pm1),
  .l2clk(l2clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);


pku_swl_ctl_msff_ctl_macro__width_1 external_flushf  (
 .scan_in(external_flushf_scanin),
 .scan_out(external_flushf_scanout),
 .l1clk(l1clk_pm1),
 .din  (tlu_flush_ifu),
 .dout (ext_flush),
  .siclk(siclk),
  .soclk(soclk)
);

assign lsu_ext_flush_in = tlu_flush_ifu | lsu_sync;

pku_swl_ctl_msff_ctl_macro__width_1 lsu_ext_flushf  (
 .scan_in(lsu_ext_flushf_scanin),
 .scan_out(lsu_ext_flushf_scanout),
 .l1clk(l1clk_pm1),
 .din  (lsu_ext_flush_in),
 .dout (lsu_ext_flush_w),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in bits_on -var swl_divide_wait_all[7:0] -max 2
assign divide_wait_outstanding = |swl_divide_wait_all[7:0];


// dependency logic to prevent fpdest_single followed by fpsrc_double
// no way to bypass partial result

assign fpdouble_wait =  (fpsrc_double_p & vld_d & fpdest_single_d) |
			(fpsrc_double_p & vld_e & fpdest_single_e) |
			(fpsrc_double_p & vld_m & fpdest_single_m) |
			(fpsrc_double_p & vld_b & ~lsu_b & fpdest_single_b) |     // no lsu hazards past b
			(fpsrc_double_p & vld_w & ~lsu_w & fpdest_single_w) |
			(fpsrc_double_p & vld_f4 & ~lsu_f4 & fpdest_single_f4);

assign fpdouble_cancel =  fpdouble_wait |
			(fpsrc_double_p & vld_b & lsu_b & fpdest_single_b) |     // if fpdest is load at b, cancel
			(fpsrc_double_p & vld_f5 & ~lsu_f5 & fpdest_single_f5);
	
// dependency logic to prevent fpdest_double followed by fpsrc_single
// don't want to deal with unscrambling the FP sources and destinations

assign fpsingle_wait =  (fpsrc_single_p & vld_d & fpdest_double_d) |
			(fpsrc_single_p & vld_e & fpdest_double_e) |
			(fpsrc_single_p & vld_m & fpdest_double_m) |
			(fpsrc_single_p & vld_b & ~lsu_b & fpdest_double_b) |     // no lsu hazards past b
			(fpsrc_single_p & vld_w & ~lsu_w & fpdest_double_w) |
			(fpsrc_single_p & vld_f4 & ~lsu_f4 & fpdest_double_f4);

assign fpsingle_cancel =  fpsingle_wait |
			(fpsrc_single_p & vld_b & lsu_b & fpdest_double_b) |     // if fpdest is load at b, cancel
			(fpsrc_single_p & vld_f5 & ~lsu_f5 & fpdest_double_f5);

// dependency logic for fcc : fbfcc, movcc, fmovcc
// FGU sends fcc's during F3/W stage; decode has 2 flop stages before E stage
assign fccdep_wait =   (fccsrc_p & vld_d & fccdest_d) |
		       (fccsrc_p & vld_e & fccdest_e) |
		       (fccsrc_p & vld_m & fccdest_m);

assign fccdep_cancel = fccdep_wait |
		       (fccsrc_p & vld_b & fccdest_b);

// presync logic for ldfsr, stfsr (wait for all fgu op to advance past f5)
// ldfsr has same presync timing as stfsr
assign fsrsync_wait = (fsrsync_p & vld_d & fgu_d) |  // wait on all fgus (including loads, fgu ints)
		     (fsrsync_p & vld_e & fgu_e) |
		     (fsrsync_p & vld_m & fgu_m) |
		     (fsrsync_p & vld_b & fgu_b) |
		     (fsrsync_p & vld_w & fgu_w) |
		     (fsrsync_p & vld_f4);

assign fsrsync_cancel = fsrsync_wait |
		     (fsrsync_p & vld_f5);

// fgu_op with dest { fgu fdest }
// load-int { lsu specld }
// load-float or fgu_op { fdest }

// integer sources (rs1,rs2,rd) check against integer loads
// float sources (rs1,rs2,rd) check against float-loads and fgu_ops
// float loads have WAW hazard with prior fgu ops

// dependency checking for integer and floats
assign check_rs1_d =  (idest_d & specld_d & pku_isrc_rs1_p) |   // check int rs1 VS int_load_d
		      (fdest_d & fsrc_rs1_p);		        // check fp rs1 VS fgu_op_d OR fgu_load_d
assign check_rs2_d = (idest_d & specld_d & pku_isrc_rs2_p) |	// rs2 same as rs1
		     (fdest_d & fsrc_rs2_p);
assign check_rd_d = (idest_d & specld_d & pku_isrc_rd_p) |	 // check int store VS prior int load 
		    (fdest_d & pku_fsrc_rd_p) |			 // check fp store VS prior fgu_op OR fgu_load
		    (fdest_d & fgu_d & pku_fdest_p & pku_lsu_p); // check float-load VS prior fgu_op WAW

assign check_rs1_e = (idest_e & specld_e & pku_isrc_rs1_p) | 	// check int rs1 VS int_load_e
		     (fdest_e & fgu_e & fsrc_rs1_p );	        // check fp rs1 VS fgu_op_e
assign check_rs2_e = (idest_e & specld_e & pku_isrc_rs2_p) |
		     (fdest_e & fgu_e & fsrc_rs2_p );
assign check_rd_e = (idest_e & specld_e & pku_isrc_rd_p) |
		    (fdest_e & fgu_e & pku_fsrc_rd_p) |		// check fp store VS prior fgu_op
		    (fdest_e & fgu_e & pku_fdest_p & pku_lsu_p);  // WAW

assign check_rs1_m = (fdest_m & fgu_m & fsrc_rs1_p);	  // check fp rs1 VS fgu_op_m
assign check_rs2_m = (fdest_m & fgu_m & fsrc_rs2_p);
assign check_rd_m =  (fdest_m & fgu_m & pku_fsrc_rd_p) |
		     (fdest_m & fgu_m & pku_fdest_p & pku_lsu_p);  // WAW, load-float write delay one cycle so release after m stage

assign check_rs1_b = (fdest_b & fgu_b & fsrc_rs1_p);	  // check fp rs1 VS fgu_op_b
assign check_rs2_b = (fdest_b & fgu_b & fsrc_rs2_p);
assign check_rd_b =  (fdest_b & fgu_b & pku_fsrc_rd_p);          
 
assign check_rs1_w = (fdest_w & fgu_w & fsrc_rs1_p);	  // check fp rs1 VS fgu_op_w
assign check_rs2_w = (fdest_w & fgu_w & fsrc_rs2_p);
assign check_rd_w =  (fdest_w & fgu_w & pku_fsrc_rd_p);

assign cmp_rs1_rd_d = (rs1[4:0] == rd_d[4:0]);
assign cmp_rs2_rd_d = (rs2[4:0] == rd_d[4:0]);
assign cmp_rd_rd_d =  ( rd[4:0] == rd_d[4:0]);
assign cmp_rs1_rd_e = (rs1[4:0] == rd_e[4:0]);
assign cmp_rs2_rd_e = (rs2[4:0] == rd_e[4:0]);
assign cmp_rd_rd_e =  ( rd[4:0] == rd_e[4:0]);
assign cmp_rs1_rd_m = (rs1[4:0] == rd_m[4:0]);
assign cmp_rs2_rd_m = (rs2[4:0] == rd_m[4:0]);
assign cmp_rd_rd_m =  ( rd[4:0] == rd_m[4:0]);
assign cmp_rs1_rd_b = (rs1[4:0] == rd_b[4:0]);
assign cmp_rs2_rd_b = (rs2[4:0] == rd_b[4:0]);
assign cmp_rd_rd_b =  ( rd[4:0] == rd_b[4:0]);
assign cmp_rs1_rd_w = (rs1[4:0] == rd_w[4:0]);
assign cmp_rs2_rd_w = (rs2[4:0] == rd_w[4:0]);
assign cmp_rd_rd_w =  ( rd[4:0] == rd_w[4:0]);

// dependency checking is independent of enable/disable of speculation
assign dependent_cancel = ((cmp_rs1_rd_d & vld_d & check_rs1_d) |
		       (cmp_rs2_rd_d & vld_d & check_rs2_d) |
		       (cmp_rd_rd_d  & vld_d & check_rd_d) |
		       (cmp_rs1_rd_e & vld_e & check_rs1_e) |
		       (cmp_rs2_rd_e & vld_e & check_rs2_e) |
		       (cmp_rd_rd_e  & vld_e & check_rd_e) |
		       (cmp_rs1_rd_m & vld_m & check_rs1_m) |
		       (cmp_rs2_rd_m & vld_m & check_rs2_m) |
		       (cmp_rd_rd_m  & vld_m & check_rd_m) |
		       (cmp_rs1_rd_b & vld_b & check_rs1_b) |
		       (cmp_rs2_rd_b & vld_b & check_rs2_b) |
		       (cmp_rd_rd_b  & vld_b & check_rd_b) |
		       (cmp_rs1_rd_w & vld_w & check_rs1_w) |
		       (cmp_rs2_rd_w & vld_w & check_rs2_w) |
		       (cmp_rd_rd_w  & vld_w & check_rd_w));

// wait exits 1 pipe stage earlier than the dependency logic
// * is the differences
// 
// assign check_rs1_d =  (idest_d & specld_d & pku_isrc_rs1_p) |   
// 			 (fdest_d & *fgu_d & fsrc_rs1_p);	
// assign check_rs2_d = (idest_d & specld_d & pku_isrc_rs2_p) |	
// 			(fdest_d & *fgu_d & fsrc_rs2_p);	
// assign check_rd_d = (idest_d & specld_d & pku_isrc_rd_p) |	
//		       (fdest_d & *fgu_d & pku_fsrc_rd_p) |	
// 		       (fdest_d & fgu_d & pku_fdest_p & pku_lsu_p);
// 								   
// assign check_rs1_e = *						
// 			(fdest_e & fgu_e & fsrc_rs1_p );	
// assign check_rs2_e = *						
// 			(fdest_e & fgu_e & fsrc_rs2_p );	
// assign check_rd_e =  *						
// 		       (fdest_e & fgu_e & pku_fsrc_rd_p) |	
// 		       (fdest_e & fgu_e & pku_fdest_p & pku_lsu_p);
// 								   
// assign check_rs1_m = (fdest_m & fgu_m & fsrc_rs1_p);	
// assign check_rs2_m = (fdest_m & fgu_m & fsrc_rs2_p);	
// assign check_rd_m =  (fdest_m & fgu_m & pku_fsrc_rd_p) |
//			*
// 								   
// assign check_rs1_b = (fdest_b & fgu_b & fsrc_rs1_p);	
// assign check_rs2_b = (fdest_b & fgu_b & fsrc_rs2_p);
// assign check_rd_b = (fdest_b & fgu_b & pku_fsrc_rd_p);
//			
// 
// assign check_rs1_w = *
// assign check_rs2_w = *
// assign check_rd_w = *

// fgu loads don't goto wait
// integer loads don't look at E stage to stay in wait
// fgus dont look at W stage to stay in wait 
// fgu WAW dont look at B stage

assign wait_rs1_d = (idest_d & specld_d & pku_isrc_rs1_p) |
		    (fdest_d & fgu_d & fsrc_rs1_p);
assign wait_rs2_d = (idest_d & specld_d & pku_isrc_rs2_p) |
		    (fdest_d & fgu_d & fsrc_rs2_p);
assign wait_rd_d =  (idest_d & specld_d & pku_isrc_rd_p) |	
		    (fdest_d & fgu_d & pku_fsrc_rd_p) |	
 		    (fdest_d & fgu_d & pku_fdest_p & pku_lsu_p);

assign wait_rs1_e = (fdest_e & fgu_e & fsrc_rs1_p);
assign wait_rs2_e = (fdest_e & fgu_e & fsrc_rs2_p);
assign wait_rd_e =  (fdest_e & fgu_e & pku_fsrc_rd_p) |	
		    (fdest_e & fgu_e & pku_fdest_p & pku_lsu_p);

assign wait_rd_m =  (fdest_m & fgu_m & pku_fsrc_rd_p);

assign wait_rd_b = (fdest_b & fgu_b & pku_fsrc_rd_p);

assign dependent_wait = 
                       (cmp_rs1_rd_d & vld_d & wait_rs1_d) |
		       (cmp_rs2_rd_d & vld_d & wait_rs2_d) |
		       (cmp_rd_rd_d  & vld_d & wait_rd_d) |
		       (cmp_rs1_rd_e & vld_e & wait_rs1_e) |
		       (cmp_rs2_rd_e & vld_e & wait_rs2_e) |
		       (cmp_rd_rd_e  & vld_e & wait_rd_e) |
		       (cmp_rs1_rd_m & vld_m & check_rs1_m) |
		       (cmp_rs2_rd_m & vld_m & check_rs2_m) |
		       (cmp_rd_rd_m  & vld_m & wait_rd_m) |
		       (cmp_rs1_rd_b & vld_b & check_rs1_b) |
		       (cmp_rs2_rd_b & vld_b & check_rs2_b) |
		       (cmp_rd_rd_b  & vld_b & wait_rd_b);


pku_swl_ctl_msff_ctl_macro__width_1 tlu_retryf  (
 .scan_in(tlu_retryf_scanin),
 .scan_out(tlu_retryf_scanout),
 .l1clk(l1clk_pm1),
 .din  (tlu_retry_state),
 .dout (retry_state),
  .siclk(siclk),
  .soclk(soclk)
);


// block_store_stall

pku_swl_ctl_msff_ctl_macro__width_2 block_store_stallf  (
 .scan_in(block_store_stallf_scanin),
 .scan_out(block_store_stallf_scanout),
 .l1clk(l1clk_pm1),
 .din  ({dec_block_store_stall,block_store_stall[1]}),
 .dout (block_store_stall[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);
   
// on leading edge of block_store_stall set scnt to full state (4'b1000)

assign full_scnt = ~block_store_stall[0] & block_store_stall[1];

// vld_p is not needed since pick cannot occur unless vld_p	
// illegals are treated as normal instructions wrt cancel_pick

assign swl_cancel_pick_p =   (lsu_sync_raw_w) |			  // cycle lsu sync don't pick since lsu_sync_wait is not in effect yet 
			     (dcti_p & ~vld_1 & ~retry_state) |   // IF retry_state, let the DCTI go
			     (dcti_p & vld_d & dcti_d) |          // for a DCTI pair, make sure we know the real DS
			     (dcti_p & ~vld_d & vld_e & dcti_e) |
			     (pku_twocycle_p & vld_d & specld_d & idest_d) |  // can't let twocycle go if int load at decode stage
									      // we do NO dependency checking on second half of twocycle (e.g. STD)
			     (dependent_cancel) |		  // dependency checking

			    // window ops needs at least 2 holes in front of them
			    // if an ecc error can be generated in the hole, it doesn't count as a hole (no flush_b for window_ops)
			     (windowsync_p & (vld_d | vld_e | (vld_m & any_twocycle_m) | divide_wait1 | block_store_stall[0])) |  

			     (fpsingle_cancel) |
			     (fpdouble_cancel) |
			     (fccdep_cancel) |
			     (fsrsync_cancel) |
			     (stb_cancel) |
			     (div_p & divide_wait_outstanding) |
			     (ldst_sync_single & fpsrc_double_p) |  // can't let double go if single missed
			     (ldst_sync_ldfsr) |		    // wait one cycle on ldfsr that misses the cache
			     (restore_scnt & store_p);   // cancel pick in this case; assume pick is too late to put into logic updating scnt

// this is "early" version of the pick signal (pku_flush_buffer0 is cycle AFTER branch mispredict)
assign pick_raw_p = pku_raw_pick_p & ~swl_cancel_pick_p & ~(~dec_decode_d & dec_valid_d);

assign pick_p = pick_raw_p & ~pku_flush_buffer0;

// this is the final version of the pick signal taking DS into account (flush_p is SAME cycle as branch mispredict)
assign actual_pick_p = pick_p & ~flush_p;  
     
// this is for the address logic (dont include annuling)
assign actual_raw_pick_p = vld_p & pick_raw_p & ~rawflush_p;

   
// postsync wait conditions
assign set_postsync = actual_pick_p & postsync_p;  

assign clear_postsync = (postsync_d & flush_d) |       // if postsync is flushed then clear
			(postsync_e & flush_e) |
		        (vld_w & bkick_w) |                                   // ldfsr,stfsr,save,restore,saved,restored,return
	                (vld_fb & fbkick_fb) |                                // all integer ops in fgu exit here
		        (br_mispredict_m & callclass_m & ~bkick_m) |          // clear out JMPS,CALLS (but not RETURNS)
		        lsu_sync_raw_w | ext_flush;                           // done, retries will exit via ext_flush

assign postsync_in = (post_sync & ~clear_postsync) | set_postsync;  // priority set 
		 
pku_swl_ctl_msff_ctl_macro__width_1 post_syncf  (
 .scan_in(post_syncf_scanin),
 .scan_out(post_syncf_scanout),
 .l1clk(l1clk_pm2),
 .din  (postsync_in),
 .dout (post_sync),
  .siclk(siclk),
  .soclk(soclk)
);
   
// lsu_spec_enable is static

pku_swl_ctl_msff_ctl_macro__width_1 spec_enf  (
 .scan_in(spec_enf_scanin),
 .scan_out(spec_enf_scanout),
 .l1clk(l1clk_pm1),
 .din  (lsu_spec_enable),
 .dout (spec_en),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_1 active_threadf  (
 .scan_in(active_threadf_scanin),
 .scan_out(active_threadf_scanout),
 .l1clk(l1clk),
 .din  (spc_core_running_status),
 .dout (thread_active),
  .siclk(siclk),
  .soclk(soclk)
);

// fgu asked that in non-spec mode we wait 1 more cycle before sending next op down pipe

assign set_postsync_ns = actual_pick_p & ((specbr_p | specld_p | specfp_p) & ~spec_en); 

assign clear_postsync_ns = (vld_m & specbr_m) | 
		           (vld_b & specld_b) |
		            fpvld_w2 | 
			    ext_flush | br_mispredict_m | lsu_sync_w;

assign postsync_ns_in = (postsync_ns | set_postsync_ns) & ~clear_postsync_ns; 

pku_swl_ctl_msff_ctl_macro__width_1 postsync_nsf  (
 .scan_in(postsync_nsf_scanin),
 .scan_out(postsync_nsf_scanout),
 .l1clk(l1clk_pm2),
 .din  (postsync_ns_in),
 .dout (postsync_ns),
  .siclk(siclk),
  .soclk(soclk)
);


// any instruction that has dependency on prior instruction is not allowed into machine
// includes int and FP ops
// dep_wait is independent of spec_en
// fccdep_wait checks fcc dependencies
// fsrsync checks for fsr hazards
// fpdouble wait doesn't allow fpsrc_double to go if prior fpdest_single
assign set_dep_wait = vld_p & (dependent_wait | fccdep_wait | fsrsync_wait | fpdouble_wait | fpsingle_wait);

assign clear_dep_wait = flush_p;

assign dep_wait_in = set_dep_wait & ~clear_dep_wait;

// dcti wait conditions (has delay slot)

assign set_dcti_wait = dcti_p & vld_p & ~vld_1 & ~retry_state;

assign clear_dcti_wait = ifu_ibuffer_write_c | flush_p;

assign dcti_wait_in = set_dcti_wait & ~clear_dcti_wait;

// dcti couple conditions (two dctis with delay slots)
// for this case, will be in wait state for dcti_e

assign set_dcti_couple_wait = dcti_d & vld_d & dcti_p & vld_p;

assign clear_dcti_couple_wait = flush_p;

assign dcti_couple_wait_in = set_dcti_couple_wait & ~clear_dcti_couple_wait;

// divide wait (as soon as you pick a divide goto wait)
// keep track of whether the divide is flushed or not

assign flush_div = (((flush_d & div_d) | (flush_e & div_e)) & swl_divide_wait) | lsu_sync_w | ext_flush;

assign set_divide_wait_in = actual_pick_p & div_p;  

assign clear_divide_wait_in = fgu_divide_completion | flush_div;

assign divide_wait_in = (set_divide_wait_in | swl_divide_wait) & ~clear_divide_wait_in;

pku_swl_ctl_msff_ctl_macro__width_1 divide_waitf  (
 .scan_in(divide_waitf_scanin),
 .scan_out(divide_waitf_scanout),
 .l1clk(l1clk_pm1),
 .din  (divide_wait_in),
 .dout (swl_divide_wait),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_1 divide_wait1f  (
 .scan_in(divide_wait1f_scanin),
 .scan_out(divide_wait1f_scanout),
 .l1clk(l1clk_pm1),
 .din  (swl_divide_wait),
 .dout (divide_wait1),
  .siclk(siclk),
  .soclk(soclk)
);

// wait for other divide to finish before you try to pick this divide
assign otherdivide_wait_in = div_p & vld_p & divide_wait_outstanding & ~flush_p;

pku_swl_ctl_msff_ctl_macro__width_2 lsu_completef  (
 .scan_in(lsu_completef_scanin),
 .scan_out(lsu_completef_scanout),
 .l1clk(l1clk_pm1),
 .din  ({lsu_complete,lsu_complete_d1}),
 .dout ({lsu_complete_d1,lsu_complete_d2}),
  .siclk(siclk),
  .soclk(soclk)
);

// lsu_sync has happened; wait for lsu_complete or thread is flushed (can't commit out-of-order)
assign set_lsu_sync_wait = lsu_sync_raw_w;

assign clear_lsu_sync_wait = ext_flush | lsu_complete;

assign lsu_sync_wait_in = (set_lsu_sync_wait | lsu_sync_wait) & ~clear_lsu_sync_wait;

pku_swl_ctl_msff_ctl_macro__width_1 lsu_sync_waitf  (
 .scan_in(lsu_sync_waitf_scanin),
 .scan_out(lsu_sync_waitf_scanout),
 .l1clk(l1clk_pm1),
 .din  (lsu_sync_wait_in),
 .dout (lsu_sync_wait),
  .siclk(siclk),
  .soclk(soclk)
);

// FGU handles case where double is followed by single
// pick handles single followed by double
// wait a cycle to clear to make sure hazard free with subsequent fp double
assign clear_lsu_sync_single = ext_flush | lsu_complete_d2;

assign ldst_sync_single_in = (lsu_sync_raw_w & ~clear_lsu_sync_single & fpdest_single_w) |
		             (~lsu_sync_raw_w & ~clear_lsu_sync_single & ldst_sync_single);

pku_swl_ctl_msff_ctl_macro__width_1 ldst_sync_singlef  (
 .scan_in(ldst_sync_singlef_scanin),
 .scan_out(ldst_sync_singlef_scanout),
 .l1clk(l1clk_pm1),
 .din  (ldst_sync_single_in),
 .dout (ldst_sync_single),
  .siclk(siclk),
  .soclk(soclk)
);


// wait a cycle if a ldfsr misses to make sure ccr's are updated correctly
assign clear_lsu_sync_ldfsr = ext_flush | lsu_complete_d2;

// NOTE: load with no fdest and no idest MUST be ldfsr
assign fsrsync_w = specld_w & ~fdest_w & ~idest_w;

assign ldst_sync_ldfsr_in = (lsu_sync_raw_w & ~clear_lsu_sync_ldfsr & fsrsync_w) |
		           (~lsu_sync_raw_w & ~clear_lsu_sync_ldfsr & ldst_sync_ldfsr);

pku_swl_ctl_msff_ctl_macro__width_1 ldst_sync_ldfsrf  (
 .scan_in(ldst_sync_ldfsrf_scanin),
 .scan_out(ldst_sync_ldfsrf_scanout),
 .l1clk(l1clk_pm1),
 .din  (ldst_sync_ldfsr_in),
 .dout (ldst_sync_ldfsr),
  .siclk(siclk),
  .soclk(soclk)
);

// track stores down the pipe to the store buffer

assign br_flush1_in = br_mispredict_e & ~(lsu_sync_w | ext_flush);
pku_swl_ctl_msff_ctl_macro__width_1 brflush1_f  (
 .scan_in(brflush1_f_scanin),
 .scan_out(brflush1_f_scanout),
 .l1clk(l1clk_pm2),
 .din  (br_flush1_in),
 .dout (br_flush1),
  .siclk(siclk),
  .soclk(soclk)
);

assign br_flush2_in = br_flush1 &  ~(lsu_sync_w | ext_flush);
pku_swl_ctl_msff_ctl_macro__width_1 brflush2_f  (
 .scan_in(brflush2_f_scanin),
 .scan_out(brflush2_f_scanout),
 .l1clk(l1clk_pm2),
 .din  (br_flush2_in),
 .dout (brflush2),
  .siclk(siclk),
  .soclk(soclk)	
);

assign not_annul_ds1_in = ~annul_ds_dcti_e;
pku_swl_ctl_msff_ctl_macro__width_1 not_annul_ds1_f  (
 .scan_in(not_annul_ds1_f_scanin),
 .scan_out(not_annul_ds1_f_scanout),
 .l1clk(l1clk_pm2),
 .din  (not_annul_ds1_in),
 .dout (not_annul_ds1),
  .siclk(siclk),
  .soclk(soclk)
);

assign not_annul_ds2_in = not_annul_ds1;
pku_swl_ctl_msff_ctl_macro__width_1 not_annul_ds2_f  (
 .scan_in(not_annul_ds2_f_scanin),
 .scan_out(not_annul_ds2_f_scanout),
 .l1clk(l1clk_pm2),
 .din  (not_annul_ds2_in),
 .dout (not_annul_ds2),
  .siclk(siclk),
  .soclk(soclk)
);


//assign store_ds1_in = (br_mispredict_e & ~annul_ds_dcti_e & vld_d & pick_store_d) & ~(lsu_sync_w | ext_flush);

assign store_ds1_in = (~annul_ds_dcti_e & vld_d & pick_store_d) & ~(lsu_sync_w | ext_flush);

pku_swl_ctl_msff_ctl_macro__width_1 store_ds1_f  (
 .scan_in(store_ds1_f_scanin),
 .scan_out(store_ds1_f_scanout),
 .l1clk(l1clk_pm2),
 .din  (store_ds1_in),
 .dout (store_ds1),
  .siclk(siclk),
  .soclk(soclk)
);

assign store_ds2_in = (store_ds1 | (not_annul_ds1 & vld_d & pick_store_d)) & ~(lsu_sync_w | ext_flush);

pku_swl_ctl_msff_ctl_macro__width_1 store_ds2_f  (
 .scan_in(store_ds2_f_scanin),
 .scan_out(store_ds2_f_scanout),
 .l1clk(l1clk_pm2),
 .din  (store_ds2_in),
 .dout (store_ds2),
  .siclk(siclk),
  .soclk(soclk)
);

assign store_ds = (store_ds2 | (not_annul_ds2 & vld_d & pick_store_d)) & ~(lsu_sync_w | ext_flush);

assign restore_scnt = (brflush2 | lsu_sync_w | ext_flush);

// delay allocation of store into the scnt for timing
assign pick_store_p = (pick_p & ~late_flush_p & store_p);

pku_swl_ctl_msff_ctl_macro__width_1 pickstoref  (
 .scan_in(pickstoref_scanin),
 .scan_out(pickstoref_scanout),
 .l1clk(l1clk_pm2),
 .din  (pick_store_p),
 .dout (pick_store_d),
  .siclk(siclk),
  .soclk(soclk)
);

assign alloc_scnt = pick_store_d;

assign dealloc_scnt = lsu_stb_dealloc;

// take everything into account except for annuling stores   
assign inc_scnt_raw = alloc_scnt & ~dealloc_scnt;
assign dec_scnt_raw = ~alloc_scnt & dealloc_scnt;
assign hold_scnt_raw = ~inc_scnt_raw & ~dec_scnt_raw;

// take annuling into account
// if you annul a store then you need to decrement scnt by 1
assign annul_store_in = annul_ds_dcti_e & vld_d & pick_store_d & ~restore_scnt & ~full_scnt;

pku_swl_ctl_msff_ctl_macro__width_1 annul_store_f  (
 .scan_in(annul_store_f_scanin),
 .scan_out(annul_store_f_scanout),
 .l1clk(l1clk_pm1),
 .din  (annul_store_in),
 .dout (annul_store_d),
  .siclk(siclk),
  .soclk(soclk)
);

// take into account that the store may be annuled

assign inc_scnt =  (inc_scnt_raw & ~annul_store_d);
assign dec1_scnt = (dec_scnt_raw & ~annul_store_d) | (hold_scnt_raw & annul_store_d);
assign hold_scnt = (hold_scnt_raw & ~annul_store_d) | (inc_scnt_raw & annul_store_d);
assign dec2_scnt = (dec_scnt_raw & annul_store_d);
    
// on a restore_scnt, pick must keep track of the DS is a store and whether it is annuled or not
   
assign inc2_ccnt = (inc_ccnt_raw & store_ds);
assign inc1_ccnt = (inc_ccnt_raw & ~store_ds) | (hold_ccnt_raw & store_ds);
assign hold_ccnt = (hold_ccnt_raw & ~store_ds) | (dec_ccnt_raw & store_ds);
assign dec1_ccnt = (dec_ccnt_raw & ~store_ds);
   

assign ccnt_in[3:0] = ({4{hold_ccnt}} & ccnt[3:0]) |
	              ({4{inc2_ccnt}} & (ccnt[3:0]+4'b0010)) |
		      ({4{inc1_ccnt}} & (ccnt[3:0]+4'b0001)) |
		      ({4{dec1_ccnt}} & (ccnt[3:0]-4'b0001));

// 0in bits_on -var {hold_ccnt,inc2_ccnt,inc1_ccnt,dec1_ccnt} -max 1 -message "bad ccnt update"

// compute scnt
assign scnt_in[3:0] = (({4{~restore_scnt & hold_scnt & ~full_scnt}} & scnt[3:0]) |
	               ({4{~restore_scnt & inc_scnt & ~full_scnt}} & (scnt[3:0]+4'b0001)) |
		       ({4{~restore_scnt & dec1_scnt & ~full_scnt}} & (scnt[3:0]-4'b0001)) |
		       ({4{~restore_scnt & dec2_scnt & ~full_scnt}} & (scnt[3:0]-4'b0010)) |
		       ({4{restore_scnt & ~full_scnt}} & ccnt_in[3:0]) |
                       ({4{full_scnt}} & 4'b1000)) & {4{~lsu_block_store_kill}};

// 0in bits_on -var {hold_scnt,inc_scnt,dec1_scnt} -max 1 -message "scnt selects not mutually exclusive"

// 0in value -var scnt[3:0] -val 4'b0000 4'b0001 4'b0010 4'b0011 4'b0100 4'b0101 4'b0110 4'b0111 4'b1000 -message "scnt[3:0] illegal state"

pku_swl_ctl_msff_ctl_macro__width_4 scnt_f  (
 .scan_in(scnt_f_scanin),
 .scan_out(scnt_f_scanout),
 .l1clk(l1clk_pm1),
 .din  (scnt_in[3:0]),
 .dout (scnt[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign alloc_ccnt = lsu_stb_alloc;
assign dealloc_ccnt = lsu_stb_dealloc;

assign inc_ccnt_raw = alloc_ccnt & ~dealloc_ccnt;
assign dec_ccnt_raw = ~alloc_ccnt & dealloc_ccnt;
assign hold_ccnt_raw = ~inc_ccnt_raw & ~dec_ccnt_raw;

assign ccnt_raw_in[3:0] = (({4{hold_ccnt_raw}} & ccnt[3:0]) |
		           ({4{inc_ccnt_raw}} & (ccnt[3:0]+4'b0001)) |
		           ({4{dec_ccnt_raw}} & (ccnt[3:0]-4'b0001))) & {4{~lsu_block_store_kill}};


// 0in value -var ccnt[3:0] -val 4'b0000 4'b0001 4'b0010 4'b0011 4'b0100 4'b0101 4'b0110 4'b0111 4'b1000 -message "ccnt[3:0] illegal state"

// 0in assert -var (~(ccnt[3:0]>scnt[3:0])) -message "unexpected ccnt[3:0] > scnt[3:0]"

pku_swl_ctl_msff_ctl_macro__width_4 ccnt_f  (
 .scan_in(ccnt_f_scanin),
 .scan_out(ccnt_f_scanout),
 .l1clk(l1clk_pm1),
 .din  (ccnt_raw_in[3:0]),
 .dout (ccnt[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// stb is full; cancel pick
//assign stb_cancel = (scnt[3] & store_p) | (scnt[2] & scnt[1] & scnt[0] & pick_store_d);

assign stb_cancel = (scnt[3] | (scnt[2] & scnt[1] & scnt[0] & pick_store_d)) & store_p;

assign stb_wait_in = stb_cancel;

assign rdy_in = ~( 	lsu_sync_wait_in |
			otherdivide_wait_in  |
			divide_wait_in | 
			postsync_in |
			postsync_ns_in |
			dep_wait_in |			// wait due to dependency
			stb_wait_in |
		        dcti_wait_in |
			dcti_couple_wait_in );

// in multithread mode, added w stage to give load flush a chance before transitioning from spec to ready

assign spec_in = (spec_en & vld_d_in & (specbr_d_in | specld_d_in)) |
	         (spec_en & vld_e_in & (specbr_e_in | specld_e_in)) |
	         (spec_en & vld_m_in & specld_m_in) |
	         (spec_en & vld_b_in & specld_b_in) |
	         (spec_en & vld_w_in & specld_w_in);   


// 0in assert -var (~(tlu_halted & spec_in)) -message "spec_in must be 0 if tlu_halted is a 1"

assign ready_in = rdy_in & ~tlu_halted & ~spec_in;

pku_swl_ctl_msff_ctl_macro__width_1 readyf  (
 .scan_in(readyf_scanin),
 .scan_out(readyf_scanout),
 .l1clk(l1clk_pm1),
 .din  (ready_in),
 .dout (swl_ready_p),
  .siclk(siclk),
  .soclk(soclk)
);

// remove tlu_halted since spec_in must be 0 if tlu_halted is asserted
assign spec_ready_in = rdy_in & spec_in;

pku_swl_ctl_msff_ctl_macro__width_1 spec_readyf  (
 .scan_in(spec_readyf_scanin),
 .scan_out(spec_readyf_scanout),
 .l1clk(l1clk_pm1),
 .din  (spec_ready_in),
 .dout (swl_spec_ready_p),
  .siclk(siclk),
  .soclk(soclk)
);


// track all delay slots down the pipe for tlu

assign allds_actual_p = (allds_p | allds_is_p) & ~(lsu_sync_w | ext_flush);
assign allds_actual_d = (allds_d | allds_is_d) & ~(lsu_sync_w | ext_flush);

assign allds_p_in = ~actual_pick_p & allds_actual_p;

pku_swl_ctl_msff_ctl_macro__width_1 allds_p_f  (
 .scan_in(allds_p_f_scanin),
 .scan_out(allds_p_f_scanout),
 .l1clk(l1clk_pm2),
 .din  (allds_p_in),
 .dout (allds_p),
  .siclk(siclk),
  .soclk(soclk)
);

assign allds_d_in = (actual_pick_p & allds_actual_p) |
   	  	    (~dec_decode_d & allds_actual_d);
		   
pku_swl_ctl_msff_ctl_macro__width_1 allds_d_f  (
 .scan_in(allds_d_f_scanin),
 .scan_out(allds_d_f_scanout),
 .l1clk(l1clk_pm2),
 .din  (allds_d_in),
 .dout (allds_d),
  .siclk(siclk),
  .soclk(soclk)
);

assign allds_e_in = dec_decode_d & allds_actual_d;

pku_swl_ctl_msff_ctl_macro__width_1 allds_e_f  (
 .scan_in(allds_e_f_scanin),
 .scan_out(allds_e_f_scanout),
 .l1clk(l1clk_pm2),
 .din  (allds_e_in),
 .dout (pku_ds_e),
  .siclk(siclk),
  .soclk(soclk)
);

// pipeline tracking
// decode, execute, memory(dcache access), writeback (hit/miss determination)

// any flush will clear the proper valids the next cycle

assign set_vld_d = actual_pick_p;

assign clear_vld_d = dec_decode_d | flush_d;

assign vld_d_in = (vld_d & ~clear_vld_d) | set_vld_d;

pku_swl_ctl_msff_ctl_macro__width_1 vld_df  (
 .scan_in(vld_df_scanin),
 .scan_out(vld_df_scanout),
 .l1clk(l1clk_pm2),
 .din  (vld_d_in),
 .dout (vld_d),
  .siclk(siclk),
  .soclk(soclk)
);


assign vld_e_in = vld_d & dec_decode_d & ~flush_d;

pku_swl_ctl_msff_ctl_macro__width_1 vld_ef  (
 .scan_in(vld_ef_scanin),
 .scan_out(vld_ef_scanout),
 .l1clk(l1clk_pm2),
 .din  (vld_e_in),
 .dout (vld_e),
  .siclk(siclk),
  .soclk(soclk)
);

assign valid_e = vld_e & dec_true_valid_e;  // final valid e taking exceptions into account

assign valid_e_in = vld_e_in & ~lsu_sync & ~tlu_flush_ifu & ~annul_ds_dcti_e;

pku_swl_ctl_msff_ctl_macro__width_1 valid_ef  (
 .scan_in(valid_ef_scanin),
 .scan_out(valid_ef_scanout),
 .l1clk(l1clk_pm2),
 .din  (valid_e_in),
 .dout (pku_valid_e),
  .siclk(siclk),
  .soclk(soclk)
);

assign vld_m_in = vld_e & ~flush_e;

pku_swl_ctl_msff_ctl_macro__width_1 vld_mf  (
 .scan_in(vld_mf_scanin),
 .scan_out(vld_mf_scanout),
 .l1clk(l1clk_pm2),
 .din  (vld_m_in),
 .dout (vld_m),
  .siclk(siclk),
  .soclk(soclk)
);

assign vld_b_in = vld_m & ~flush_m;

pku_swl_ctl_msff_ctl_macro__width_1 vld_bf  (
 .scan_in(vld_bf_scanin),
 .scan_out(vld_bf_scanout),
 .l1clk(l1clk_pm2),
 .din  (vld_b_in),
 .dout (vld_b),
  .siclk(siclk),
  .soclk(soclk)
);

assign vld_w_in = vld_b & ~flush_b;

pku_swl_ctl_msff_ctl_macro__width_1 vld_wf  (
 .scan_in(vld_wf_scanin),
 .scan_out(vld_wf_scanout),
 .l1clk(l1clk_pm2),
 .din  (vld_w_in),
 .dout (vld_w),
  .siclk(siclk),
  .soclk(soclk)
);

assign fpvld_w1_in = vld_w & specfp_w & ~ext_flush;

pku_swl_ctl_msff_ctl_macro__width_1 fpvld_w1f  (
 .scan_in(fpvld_w1f_scanin),
 .scan_out(fpvld_w1f_scanout),
 .l1clk(l1clk_pm2),
 .din  (fpvld_w1_in),
 .dout (fpvld_w1),
  .siclk(siclk),
  .soclk(soclk)
);

assign fpvld_w2_in = fpvld_w1 & ~ext_flush;

pku_swl_ctl_msff_ctl_macro__width_1 fpvld_w2f  (
 .scan_in(fpvld_w2f_scanin),
 .scan_out(fpvld_w2f_scanout),
 .l1clk(l1clk_pm2),
 .din  (fpvld_w2_in),
 .dout (fpvld_w2),
  .siclk(siclk),
  .soclk(soclk)
);

// seperate pipeline for address tracking with no DS flushing

assign set_vldraw_d = actual_raw_pick_p; 

assign clear_vldraw_d = dec_decode_d | rawflush_d;

assign vldraw_d_in = (vldraw_d & ~clear_vldraw_d) | set_vldraw_d;

pku_swl_ctl_msff_ctl_macro__width_1 vldraw_df  (
 .scan_in(vldraw_df_scanin),
 .scan_out(vldraw_df_scanout),
 .l1clk(l1clk_pm2),
 .din  (vldraw_d_in),
 .dout (vldraw_d),
  .siclk(siclk),
  .soclk(soclk)
);

assign vldraw_e_in = dec_decode_d & vldraw_d;

pku_swl_ctl_msff_ctl_macro__width_1 vldraw_ef  (
 .scan_in(vldraw_ef_scanin),
 .scan_out(vldraw_ef_scanout),
 .l1clk(l1clk_pm2),
 .din  (vldraw_e_in),
 .dout (vldraw_e),
  .siclk(siclk),
  .soclk(soclk)
);

assign vldraw_m_in = vldraw_e;

pku_swl_ctl_msff_ctl_macro__width_1 vldraw_mf  (
 .scan_in(vldraw_mf_scanin),
 .scan_out(vldraw_mf_scanout),
 .l1clk(l1clk_pm2),
 .din  (vldraw_m_in),
 .dout (vldraw_m),
  .siclk(siclk),
  .soclk(soclk)
);

// Include annulled instructions until branch is in W
// Since cnt is calculated a cycle ahead, count annulled until branch exits M

pku_swl_ctl_msff_ctl_macro__width_1 annul_ds_dcti_mf  (
 .scan_in(annul_ds_dcti_mf_scanin),
 .scan_out(annul_ds_dcti_mf_scanout),
 .l1clk(l1clk_pm2),
 .din  (annul_ds_dcti_e),
 .dout (    annul_ds_dcti_m),
  .siclk(siclk),
  .soclk(soclk)
);

assign vldcnt_e_brtaken0_in = 
       ( pku_annul_ds_dcti_brtaken0_e & vldraw_e_in) | 
       ( annul_ds_dcti_m & vldraw_e_in) |
       (~pku_annul_ds_dcti_brtaken0_e & ~annul_ds_dcti_m & vld_d & dec_decode_d);  // dont need flush_d here

assign vldcnt_e_brtaken1_in = 
       ( pku_annul_ds_dcti_brtaken1_e & vldraw_e_in) | 
       ( annul_ds_dcti_m & vldraw_e_in) |
       (~pku_annul_ds_dcti_brtaken1_e & ~annul_ds_dcti_m & vld_d & dec_decode_d);  // dont need flush_d here
	     
assign vldcnt_m_in = 
       ( annul_ds_dcti_m & vldraw_m_in) |
       (~annul_ds_dcti_m & vld_m_in);
	     
assign pku_inst_cnt_brtaken0[1:0] = ({1'b0,vldcnt_e_brtaken0_in} + {1'b0,vldcnt_m_in} + {1'b0,vld_b_in});

assign pku_inst_cnt_brtaken1[1:0] = ({1'b0,vldcnt_e_brtaken1_in} + {1'b0,vldcnt_m_in} + {1'b0,vld_b_in});

// end address logic


// track down to fb to flush inst in the fgu on a trap

assign vld_f4_in = vld_w & fgu_w & ~flush_w;

pku_swl_ctl_msff_ctl_macro__width_1 vld_f4f  (
 .scan_in(vld_f4f_scanin),
 .scan_out(vld_f4f_scanout),
 .l1clk(l1clk_pm2),
 .din  (vld_f4_in),
 .dout (vld_f4),
  .siclk(siclk),
  .soclk(soclk)
);

assign vld_f5_in = vld_f4 & ~flush_f4;

pku_swl_ctl_msff_ctl_macro__width_1 vld_f5f  (
 .scan_in(vld_f5f_scanin),
 .scan_out(vld_f5f_scanout),
 .l1clk(l1clk_pm2),
 .din  (vld_f5_in),
 .dout (vld_f5),
  .siclk(siclk),
  .soclk(soclk)
);

assign vld_fb_in = vld_f5 & ~flush_f5;

pku_swl_ctl_msff_ctl_macro__width_1 vld_fbf  (
 .scan_in(vld_fbf_scanin),
 .scan_out(vld_fbf_scanout),
 .l1clk(l1clk_pm2),
 .din  (vld_fb_in),
 .dout (vld_fb),
  .siclk(siclk),
  .soclk(soclk)
);

// pipe raw data down the pipe
// speculate decode to avoid loading
// must qualify with vld's before using

// anytwocycle - inst is twocycle or pdist
// postsync - inst is a postsync
// div   - inst is a divide inst
// bkick - inst should be kicked out of wait a b stage
// fpdest_double - fp dest double precision
// fpdest_single - fp dest single precision
// fccdest - inst will modify fcc 
// lsu - inst executed by lsu
// fgu - inst executed by fgu
// fbkick - inst should be kicked out of wait at fb stage
// specfp - inst is fgu that is speculated on
// fdest - inst has FP dest
// idest - inst has integer dest
// div - any divide (int or fpu)
// condbr_p - conditional branch
// callclass_p - one of call, jmp or return 
// annul - annul bit
// specbr - branch that is speculated on if spec_en==1
// dcti - has delay slot
// specld - integer load that is speculated on if spec_en==1
// rd[4:0] - destination of load

assign any_twocycle_p = pku_twocycle_p | pku_pdist_p;

assign data_d_in[23:0] = ({24{pick_p}} & {any_twocycle_p,postsync_p,div_p,bkick_p,fpdest_double_p,fpdest_single_p,fccdest_p,pku_lsu_p,pku_fgu_p,fbkick_p,specfp_p,pku_fdest_p,pku_idest_p,condbr_p,callclass_p,annul,specbr_p,dcti_p,specld_p,rd[4:0]}) |
			 ({24{~pick_p}} & data_d[23:0]);

assign specld_d_in = data_d_in[5];
assign specbr_d_in = data_d_in[7];

pku_swl_ctl_msff_ctl_macro__width_24 data_df  (
 .scan_in(data_df_scanin),
 .scan_out(data_df_scanout),
 .l1clk(l1clk_pm2),
 .din  (data_d_in[23:0]),
 .dout (data_d[23:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign {any_twocycle_d,postsync_d,div_d,bkick_d,fpdest_double_d,fpdest_single_d,fccdest_d,lsu_d,
        fgu_d,fbkick_d,
        specfp_d,fdest_d,idest_d,condbr_d,callclass_d,annul_d, 
        specbr_d,dcti_d,specld_d,rd_d[4:0]} = data_d[23:0];

assign specbr_e_in = specbr_d;

assign specld_e_in = specld_d;
assign specld_m_in = specld_e;
assign specld_b_in = specld_m;
assign specld_w_in = specld_b;


pku_swl_ctl_msff_ctl_macro__width_20 rdf  (
 .scan_in(rdf_scanin),
 .scan_out(rdf_scanout),
 .l1clk(l1clk_pm2),
 .din  ({rd_d[4:0],rd_e[4:0],rd_m[4:0],rd_b[4:0]}),
 .dout ({rd_e[4:0],rd_m[4:0],rd_b[4:0],rd_w[4:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_2 anytwocyclef  (
 .scan_in(anytwocyclef_scanin),
 .scan_out(anytwocyclef_scanout),
 .l1clk(l1clk_pm2),
 .din  ({any_twocycle_d,any_twocycle_e}),
 .dout ({any_twocycle_e,any_twocycle_m}),
  .siclk(siclk),
  .soclk(soclk)
);


pku_swl_ctl_msff_ctl_macro__width_4 specldf  (
 .scan_in(specldf_scanin),
 .scan_out(specldf_scanout),
 .l1clk(l1clk_pm2),
 .din  ({specld_d,specld_e,specld_m,specld_b}),
 .dout ({specld_e,specld_m,specld_b,specld_w}),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_1 postsyncf  (
 .scan_in(postsyncf_scanin),
 .scan_out(postsyncf_scanout),
 .l1clk(l1clk_pm2),
 .din  (postsync_d),
 .dout (postsync_e),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_1 divf  (
 .scan_in(divf_scanin),
 .scan_out(divf_scanout),
 .l1clk(l1clk_pm2),
 .din  (div_d),
 .dout (div_e),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_1 dctif  (
 .scan_in(dctif_scanin),
 .scan_out(dctif_scanout),
 .l1clk(l1clk_pm2),
 .din  (dcti_d),
 .dout (dcti_e),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_1 specbref  (
 .scan_in(specbref_scanin),
 .scan_out(specbref_scanout),
 .l1clk(l1clk_pm2),
 .din  (specbr_d),
 .dout (specbr_e),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_1 specbrmf  (
 .scan_in(specbrmf_scanin),
 .scan_out(specbrmf_scanout),
 .l1clk(l1clk_pm2),
 .din  (specbr_e),
 .dout (specbr_m),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_1 annulf  (
 .scan_in(annulf_scanin),
 .scan_out(annulf_scanout),
 .l1clk(l1clk_pm2),
 .din  (annul_d),
 .dout (annul_e),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_2 callclassf  (
 .scan_in(callclassf_scanin),
 .scan_out(callclassf_scanout),
 .l1clk(l1clk_pm2),
 .din  ({callclass_d,callclass_e}),
 .dout ({callclass_e,callclass_m}),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_1 condbrf  (
 .scan_in(condbrf_scanin),
 .scan_out(condbrf_scanout),
 .l1clk(l1clk_pm2),
 .din  (condbr_d),
 .dout (condbr_e),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_4 idestf  (
 .scan_in(idestf_scanin),
 .scan_out(idestf_scanout),
 .l1clk(l1clk_pm2),
 .din  ({idest_d,idest_e,idest_m,idest_b}),
 .dout ({idest_e,idest_m,idest_b,idest_w}),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_4 fdestf  (
 .scan_in(fdestf_scanin),
 .scan_out(fdestf_scanout),
 .l1clk(l1clk_pm2),
 .din  ({fdest_d,fdest_e,fdest_m,fdest_b}),
 .dout ({fdest_e,fdest_m,fdest_b,fdest_w}),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_4 specfpf  (
 .scan_in(specfpf_scanin),
 .scan_out(specfpf_scanout),
 .l1clk(l1clk_pm2),
 .din  ({specfp_d,specfp_e,specfp_m,specfp_b}),
 .dout ({specfp_e,specfp_m,specfp_b,specfp_w}),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_7 fbkickf  (
 .scan_in(fbkickf_scanin),
 .scan_out(fbkickf_scanout),
 .l1clk(l1clk_pm2),
 .din  ({fbkick_d,fbkick_e,fbkick_m,fbkick_b,fbkick_w,fbkick_f4,fbkick_f5}),
 .dout ({fbkick_e,fbkick_m,fbkick_b,fbkick_w,fbkick_f4,fbkick_f5,fbkick_fb}),
  .siclk(siclk),
  .soclk(soclk)
);

// on an inst error dec forces all decodes to zero; make pku forget fgu if there is one

assign fgu_d_in = fgu_d & ~dec_ierr_d & vld_d;


pku_swl_ctl_msff_ctl_macro__width_4 fguf  (
 .scan_in(fguf_scanin),
 .scan_out(fguf_scanout),
 .l1clk(l1clk_pm2),
 .din  ({fgu_d_in,fgu_e,fgu_m,fgu_b}),
 .dout ({fgu_e,fgu_m,fgu_b,fgu_w}),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_4 bkickf  (
 .scan_in(bkickf_scanin),
 .scan_out(bkickf_scanout),
 .l1clk(l1clk_pm2),
 .din  ({bkick_d,bkick_e,bkick_m,bkick_b}),
 .dout ({bkick_e,bkick_m,bkick_b,bkick_w}),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_6 fpdest_doublef  (
 .scan_in(fpdest_doublef_scanin),
 .scan_out(fpdest_doublef_scanout),
 .l1clk(l1clk_pm2),
 .din  ({fpdest_double_d,fpdest_double_e,fpdest_double_m,fpdest_double_b,fpdest_double_w,fpdest_double_f4}),
 .dout ({fpdest_double_e,fpdest_double_m,fpdest_double_b,fpdest_double_w,fpdest_double_f4,fpdest_double_f5}),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_6 fpdest_singlef  (
 .scan_in(fpdest_singlef_scanin),
 .scan_out(fpdest_singlef_scanout),
 .l1clk(l1clk_pm2),
 .din  ({fpdest_single_d,fpdest_single_e,fpdest_single_m,fpdest_single_b,fpdest_single_w,fpdest_single_f4}),
 .dout ({fpdest_single_e,fpdest_single_m,fpdest_single_b,fpdest_single_w,fpdest_single_f4,fpdest_single_f5}),
  .siclk(siclk),
  .soclk(soclk)
);

pku_swl_ctl_msff_ctl_macro__width_3 fccdestf  (
 .scan_in(fccdestf_scanin),
 .scan_out(fccdestf_scanout),
 .l1clk(l1clk_pm2),
 .din  ({fccdest_d,fccdest_e,fccdest_m}),
 .dout ({fccdest_e,fccdest_m,fccdest_b}),
  .siclk(siclk),
  .soclk(soclk)
);

// on an inst error dec forces all decodes to zero; make pku forget a load if there is one

assign lsu_d_in = lsu_d & ~dec_ierr_d & vld_d;

pku_swl_ctl_msff_ctl_macro__width_6 lsuf  (
 .scan_in(lsuf_scanin),
 .scan_out(lsuf_scanout),
 .l1clk(l1clk_pm2),
 .din  ({lsu_d_in,lsu_e,lsu_m,lsu_b,lsu_w,lsu_f4}),
 .dout ({lsu_e,lsu_m,lsu_b,lsu_w,lsu_f4,lsu_f5}),
  .siclk(siclk),
  .soclk(soclk)
);

// logic to generate internal flushes
// on a flush, all vld latches and wait states clear out the same cycle
// externally, the flush happens 1 cycle later off flop

// this signal will be late, flop before using
// only sync if something actually went down the pipe after the load 

assign lsu_sync_early = ~pku_flush_lb & (vld_d_in | vld_e_in | vld_m_in | vld_b_in);

assign lsu_sync_in = lsu_sync & lsu_sync_early;

pku_swl_ctl_msff_ctl_macro__width_1 lsu_syncf  (
 .scan_in(lsu_syncf_scanin),
 .scan_out(lsu_syncf_scanout),
 .l1clk(l1clk_pm2),
 .din  (lsu_sync_in),
 .dout (lsu_sync_w),
  .siclk(siclk),
  .soclk(soclk)
);

assign lsu_sync_raw_in = lsu_sync & ~pku_flush_lb;

pku_swl_ctl_msff_ctl_macro__width_1 lsu_sync_rawf  (
 .scan_in(lsu_sync_rawf_scanin),
 .scan_out(lsu_sync_rawf_scanout),
 .l1clk(l1clk_pm2),
 .din  (lsu_sync_raw_in),
 .dout (lsu_sync_raw_w),
  .siclk(siclk),
  .soclk(soclk)
);

// all branches that are taken are cti's

assign br_mispredict_e = valid_e & dec_br_taken_e;

// callclass = { call, jmpl, return } for which delay slot is never annuled
// for condbr's only not-taken can be annuled
// all unconditional branches can be annuled

// rework for timing
// assign annul_ds_dcti_e = ((valid_e & annul_e & condbr_e & ~dec_br_taken_e) |            // condbr not taken with a==1
//	  		     (valid_e & dcti_e & annul_e & ~condbr_e & ~callclass_e));	// branch always with a==1		

assign pku_annul_ds_dcti_brtaken0_e = ((valid_e & annul_e & condbr_e) |
				       (valid_e & dcti_e & annul_e & ~condbr_e & ~callclass_e));

assign pku_annul_ds_dcti_brtaken1_e = (valid_e & dcti_e & annul_e & ~condbr_e & ~callclass_e);

assign annul_ds_dcti_e = (~dec_br_taken_e & pku_annul_ds_dcti_brtaken0_e) |
		         ( dec_br_taken_e & pku_annul_ds_dcti_brtaken1_e);


assign allds_is_p = valid_e & dec_br_taken_e & ~annul_ds_dcti_e & ~vld_d;
assign allds_is_d = valid_e & dec_br_taken_e & ~annul_ds_dcti_e & vld_d;

// generate flush signals

// flush internally and externally 1 cycle after event

// pick can occur in a flush_p situation
// ideally, squash it but dcache_miss or dec_br_taken_e is probably too late ... lru is updated in this case

// annul_ds_dcti_e flushes the delay slot as needed
// br_mispredict_e flushes everything but the delay slot
// lsu_sync_w flushes everything


// late flush using the late br_mispredict and br annul signals
assign late_flush_p =  (br_mispredict_e & vld_d) |
		       (annul_ds_dcti_e & ~vld_d) |
                       (lsu_sync_w) |
		       (ext_flush);


assign flush_p =  (br_mispredict_m & (vld_d | vld_e)) |
		  (annul_ds_dcti_m & ~vld_d & ~vld_e) |
                  (lsu_sync_w) |
		  (ext_flush);

// for the address logic; no annuling
assign rawflush_p =  (br_mispredict_m & (vld_d | vld_e)) |
                     (lsu_sync_w) |
	   	     (ext_flush);
			
// all br's that can mispredict are dcti's

// annul covers br_mispredict_e as well since all branches that mispredict are dctis & annul has precedence over br_mispredict_e

assign flush_d =  (br_mispredict_m & vld_d & vld_e) |
		  (annul_ds_dcti_m & vld_d & ~vld_e) |  
                  (lsu_sync_w) |	
		  (ext_flush);		

assign rawflush_d = (lsu_sync_w) |	
		    (ext_flush);

assign flush_e = lsu_ext_flush_w | (annul_ds_dcti_m & vld_e);
assign flush_m = lsu_ext_flush_w;
assign flush_b = lsu_ext_flush_w;

assign flush_w = ext_flush;

assign flush_f3 = ext_flush;  // internal flush signals
assign flush_f4 = flush_f3;
assign flush_f5 = flush_f3;


// external flush signals to IFU
// prioritize so only 1 can fire at a time
// IFU will get trap flush separately

assign pku_load_flush_w = lsu_sync_w;

// external flush signals to the instruction buffers


// change this logic to always flush the buffers the cycle after the flush event occurs

assign br_mispredict_m_in = br_mispredict_e;

pku_swl_ctl_msff_ctl_macro__width_1 br_mispredict_mf  (
 .scan_in(br_mispredict_mf_scanin),
 .scan_out(br_mispredict_mf_scanout),
 .l1clk(l1clk_pm2),
 .din  (br_mispredict_m_in),
 .dout (br_mispredict_m),
  .siclk(siclk),
  .soclk(soclk)
);

assign pku_flush_upper_buffer = br_mispredict_m | lsu_sync_w | ext_flush;

assign pku_flush_buffer0 = flush_p;

// on trap will clear out thread in trap unit 

assign flush_m_in = (vld_m_in & tlu_flush_ifu) |
	            (vld_m_in & lsu_sync);

// generate right off flop for timing
pku_swl_ctl_msff_ctl_macro__width_1 flush_mf  (
 .scan_in(flush_mf_scanin),
 .scan_out(flush_mf_scanout),
 .l1clk(l1clk_pm2),
 .din  (flush_m_in),
 .dout (pku_flush_m),
  .siclk(siclk),
  .soclk(soclk)
);

assign pku_flush_b = vld_b & lsu_ext_flush_w;

// trap handles w stage
assign pku_flush_lm = vld_m & lsu_m & lsu_ext_flush_w;
assign pku_flush_lb = vld_b & lsu_b & lsu_ext_flush_w;

// flush signals to the fgu; trap handles f3 which is w stage
assign pku_flush_f1 = vld_m & fgu_m & lsu_ext_flush_w;
assign pku_flush_f2 = vld_b & fgu_b & lsu_ext_flush_w;


// unused bits 
assign i_unused[6:0]        = {i[15],i[14],i[4:0]};

supply0 vss;
supply1 vdd;

// fixscan start:
assign spares_scanin             = scan_in                  ;
assign do_modef_scanin           = spares_scanout           ;
assign external_flushf_scanin    = do_modef_scanout         ;
assign lsu_ext_flushf_scanin     = external_flushf_scanout  ;
assign tlu_retryf_scanin         = lsu_ext_flushf_scanout   ;
assign block_store_stallf_scanin = tlu_retryf_scanout       ;
assign post_syncf_scanin         = block_store_stallf_scanout;
assign spec_enf_scanin           = post_syncf_scanout       ;
assign active_threadf_scanin     = spec_enf_scanout         ;
assign postsync_nsf_scanin       = active_threadf_scanout   ;
assign divide_waitf_scanin       = postsync_nsf_scanout     ;
assign divide_wait1f_scanin      = divide_waitf_scanout     ;
assign lsu_completef_scanin      = divide_wait1f_scanout    ;
assign lsu_sync_waitf_scanin     = lsu_completef_scanout    ;
assign ldst_sync_singlef_scanin  = lsu_sync_waitf_scanout   ;
assign ldst_sync_ldfsrf_scanin   = ldst_sync_singlef_scanout;
assign brflush1_f_scanin         = ldst_sync_ldfsrf_scanout ;
assign brflush2_f_scanin         = brflush1_f_scanout       ;
assign not_annul_ds1_f_scanin    = brflush2_f_scanout       ;
assign not_annul_ds2_f_scanin    = not_annul_ds1_f_scanout  ;
assign store_ds1_f_scanin        = not_annul_ds2_f_scanout  ;
assign store_ds2_f_scanin        = store_ds1_f_scanout      ;
assign pickstoref_scanin         = store_ds2_f_scanout      ;
assign annul_store_f_scanin      = pickstoref_scanout       ;
assign scnt_f_scanin             = annul_store_f_scanout    ;
assign ccnt_f_scanin             = scnt_f_scanout           ;
assign readyf_scanin             = ccnt_f_scanout           ;
assign spec_readyf_scanin        = readyf_scanout           ;
assign allds_p_f_scanin          = spec_readyf_scanout      ;
assign allds_d_f_scanin          = allds_p_f_scanout        ;
assign allds_e_f_scanin          = allds_d_f_scanout        ;
assign vld_df_scanin             = allds_e_f_scanout        ;
assign vld_ef_scanin             = vld_df_scanout           ;
assign valid_ef_scanin           = vld_ef_scanout           ;
assign vld_mf_scanin             = valid_ef_scanout         ;
assign vld_bf_scanin             = vld_mf_scanout           ;
assign vld_wf_scanin             = vld_bf_scanout           ;
assign fpvld_w1f_scanin          = vld_wf_scanout           ;
assign fpvld_w2f_scanin          = fpvld_w1f_scanout        ;
assign vldraw_df_scanin          = fpvld_w2f_scanout        ;
assign vldraw_ef_scanin          = vldraw_df_scanout        ;
assign vldraw_mf_scanin          = vldraw_ef_scanout        ;
assign annul_ds_dcti_mf_scanin   = vldraw_mf_scanout        ;
assign vld_f4f_scanin            = annul_ds_dcti_mf_scanout ;
assign vld_f5f_scanin            = vld_f4f_scanout          ;
assign vld_fbf_scanin            = vld_f5f_scanout          ;
assign data_df_scanin            = vld_fbf_scanout          ;
assign rdf_scanin                = data_df_scanout          ;
assign anytwocyclef_scanin       = rdf_scanout              ;
assign specldf_scanin            = anytwocyclef_scanout     ;
assign postsyncf_scanin          = specldf_scanout          ;
assign divf_scanin               = postsyncf_scanout        ;
assign dctif_scanin              = divf_scanout             ;
assign specbref_scanin           = dctif_scanout            ;
assign specbrmf_scanin           = specbref_scanout         ;
assign annulf_scanin             = specbrmf_scanout         ;
assign callclassf_scanin         = annulf_scanout           ;
assign condbrf_scanin            = callclassf_scanout       ;
assign idestf_scanin             = condbrf_scanout          ;
assign fdestf_scanin             = idestf_scanout           ;
assign specfpf_scanin            = fdestf_scanout           ;
assign fbkickf_scanin            = specfpf_scanout          ;
assign fguf_scanin               = fbkickf_scanout          ;
assign bkickf_scanin             = fguf_scanout             ;
assign fpdest_doublef_scanin     = bkickf_scanout           ;
assign fpdest_singlef_scanin     = fpdest_doublef_scanout   ;
assign fccdestf_scanin           = fpdest_singlef_scanout   ;
assign lsuf_scanin               = fccdestf_scanout         ;
assign lsu_syncf_scanin          = lsuf_scanout             ;
assign lsu_sync_rawf_scanin      = lsu_syncf_scanout        ;
assign br_mispredict_mf_scanin   = lsu_sync_rawf_scanout    ;
assign flush_mf_scanin           = br_mispredict_mf_scanout ;
assign scan_out                  = flush_mf_scanout         ;
// fixscan end:
endmodule







// any PARAMS parms go into naming of macro

module pku_swl_ctl_l1clkhdr_ctl_macro (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module pku_swl_ctl_spare_ctl_macro__num_4 (
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
assign scan_out = so_3;



endmodule






// any PARAMS parms go into naming of macro

module pku_swl_ctl_msff_ctl_macro__width_1 (
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

module pku_swl_ctl_msff_ctl_macro__width_2 (
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

module pku_swl_ctl_msff_ctl_macro__width_4 (
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

module pku_swl_ctl_msff_ctl_macro__width_24 (
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













// any PARAMS parms go into naming of macro

module pku_swl_ctl_msff_ctl_macro__width_20 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [19:0] fdin;
wire [18:0] so;

  input [19:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [19:0] dout;
  output scan_out;
assign fdin[19:0] = din[19:0];






dff #(20)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[19:0]),
.si({scan_in,so[18:0]}),
.so({so[18:0],scan_out}),
.q(dout[19:0])
);












endmodule













// any PARAMS parms go into naming of macro

module pku_swl_ctl_msff_ctl_macro__width_7 (
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

module pku_swl_ctl_msff_ctl_macro__width_6 (
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

module pku_swl_ctl_msff_ctl_macro__width_3 (
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








