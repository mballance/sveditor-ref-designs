// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_pct_dp.v
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
module tlu_pct_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  tcu_dectest, 
  tcu_muxtest, 
  tcu_scan_en_wmr, 
  spc_aclk_wmr, 
  wmr_scan_in, 
  tcu_wmr_vec_mask, 
  dec_flush_b, 
  dec_inst_cnt, 
  dec_raw_pick_p, 
  exu_address_m, 
  exu_oor_va_m, 
  mmu_itte_tag_data, 
  asi_rd_pc, 
  asi_rd_iaw, 
  asi_wr_iaw, 
  asi_wr_data, 
  fls_tid_dec_b, 
  fls_tid_dec_w, 
  fls_pc_sel_npc, 
  fls_pc_sel_npc_plus_4, 
  fls_npc_sel_npc_plus_4, 
  fls_npc_sel_npc_plus_8, 
  fls_npc_sel_target, 
  fls_npc_b_sel_npc, 
  fls_pc_is_npc, 
  fls_pstate_am_d_, 
  fls_pstate_am_b_, 
  fls_pstate_am_w_, 
  fls_npc_if_cnt_eq_1_d, 
  fls_npc_if_cnt_eq_2_d, 
  fls_npc_if_cnt_eq_3_d, 
  fls_pct_pc_en, 
  fls_pct_npc_en, 
  trl_pc_sel_trap_pc, 
  trl_npc_sel_trap_npc, 
  trl_npc_sel_tnpc, 
  trl_trap_type, 
  trl_pc_thread_sel, 
  trl_pc_pstate_am_, 
  trl_pc_sel_pc, 
  trl_pc_sel_npc, 
  trl_pc_sel_trap, 
  trl_pc_sel_reset, 
  trl_pc_done, 
  trl_pc_retry, 
  trl_pc_tte, 
  trl_pct_trap_pc_en, 
  trl_pct_tnpc_en, 
  tsd_tba, 
  tsd_tpc, 
  tsd_tpc_oor_va, 
  tsd_tnpc, 
  tsd_tnpc_oor_va, 
  tsd_tnpc_nonseq, 
  tsd_asi_data_, 
  tsd_pstate_am, 
  scan_out, 
  wmr_scan_out, 
  pct_asi_data, 
  pct_npc_0_w, 
  pct_npc_1_w, 
  pct_npc_2_w, 
  pct_npc_3_w, 
  pct_tsa_pc, 
  pct_tsa_pc_oor_va, 
  pct_tsa_npc, 
  pct_tsa_npc_oor_va, 
  pct_tsa_npc_nonseq, 
  pct_npc_is_nonseq, 
  pct_pc_oor_va_e, 
  pct_iaw_exc_e, 
  pct_shadow_pc_d, 
  pct_npc_w, 
  pct_target_b, 
  pct_trl_wr_data, 
  tsd_pc_w, 
  tlu_pc_d, 
  tlu_pc_w, 
  tlu_trap_pc);
wire en;
wire clk;
wire stop;
wire test;
wire pce_ov;
wire se;
wire siclk;
wire soclk;
wire target_b_lat_scanin;
wire target_b_lat_scanout;
wire wmr_vec_mask;
wire oor_va_b;
wire [47:2] target_b;
wire flush_b;
wire pc_3_w_lat_scanin;
wire pc_3_w_lat_scanout;
wire trap_pc_oor_va;
wire [47:0] trap_pc;
wire pc_3_oor_va_w;
wire [47:2] pc_3_w;
wire [47:2] npc_plus_4_noncrit_b;
wire npc_oor_va_b;
wire [47:2] npc_noncrit_b;
wire pc_2_w_lat_scanin;
wire pc_2_w_lat_scanout;
wire pc_2_oor_va_w;
wire [47:2] pc_2_w;
wire pc_1_w_lat_scanin;
wire pc_1_w_lat_scanout;
wire pc_1_oor_va_w;
wire [47:2] pc_1_w;
wire pc_0_w_lat_scanin;
wire pc_0_w_lat_scanout;
wire pc_0_oor_va_w;
wire [47:2] pc_0_w;
wire tnpc_lat_scanin;
wire tnpc_lat_scanout;
wire tnpc_nonseq;
wire tnpc_oor_va;
wire [47:2] tnpc;
wire npc_3_w_lat_scanin;
wire npc_3_w_lat_scanout;
wire npc_3_nonseq;
wire npc_3_oor_va_w;
wire [47:2] npc_3_w;
wire [47:2] npc_plus_8_b;
wire [3:2] npc_3_crit_w;
wire npc_2_w_lat_scanin;
wire npc_2_w_lat_scanout;
wire npc_2_nonseq;
wire npc_2_oor_va_w;
wire [47:2] npc_2_w;
wire [3:2] npc_2_crit_w;
wire npc_1_w_lat_scanin;
wire npc_1_w_lat_scanout;
wire npc_1_nonseq;
wire npc_1_oor_va_w;
wire [47:2] npc_1_w;
wire [3:2] npc_1_crit_w;
wire npc_0_w_lat_scanin;
wire npc_0_w_lat_scanout;
wire npc_0_nonseq;
wire npc_0_oor_va_w;
wire [47:2] npc_0_w;
wire [3:2] npc_0_crit_w;
wire [47:2] npc_b;
wire [47:2] npc_plus_4_b;
wire npc_33_02_plus_4_cout_b;
wire [49:48] npc_plus_4_b_unused;
wire npc_49_34_plus_4_cout_b_unused;
wire npc_34_03_plus_8_cout_b;
wire [50:48] npc_plus_8_b_unused;
wire npc_50_35_plus_8_cout_b_unused;
wire npc_b_mux_scanin;
wire npc_b_mux_scanout;
wire tsa_pc_oor_va_w;
wire [47:2] tsa_pc_unmasked_w;
wire [47:32] tsa_pc_w;
wire npc_nonseq;
wire tsa_npc_oor_va_w;
wire [47:2] tsa_npc_unmasked_w;
wire [47:32] tsa_npc_w;
wire [47:2] any_trap_pc;
wire [4:0] wmr_vec_mask_;
wire [47:2] reset_pc;
wire trap_pc_lat_scanin;
wire trap_pc_lat_scanout;
wire [47:5] piped_pc_w;
wire [31:5] piped_pc_pre_buf_w;
wire [12:11] piped_pc_pre_buf_w_unused;
wire [12:11] piped_pc_w_unused;
wire [47:32] masked_pc_w;
wire [3:0] tid_dec_buf_d;
wire pre_pc_oor_va_d;
wire [47:2] pre_pc_d;
wire [3:0] pstate_am_;
wire rd_pc_pstate_am_in;
wire tid_d_lat_scanin;
wire tid_d_lat_scanout;
wire prd_pc_pstate_am;
wire rd_iaw;
wire [3:0] rd_pc;
wire [3:0] tid_dec_d;
wire rd_iaw_;
wire rd_pc_pstate_am_;
wire pre_npc_oor_va_d;
wire [47:2] pre_npc_d;
wire [47:2] pre_npc_noncrit_d;
wire [63:22] npc_inc_unused;
wire [47:2] npc_inc_d;
wire npc_inc_cout_d_unused;
wire inst_cnt_nz;
wire [1:0] inst_cnt_;
wire [4:2] npc_inc_0_d;
wire [4:2] npc_inc_1_d;
wire [4:2] npc_inc_2_d;
wire [4:2] npc_inc_3_d;
wire pc_4_carry_d;
wire tcu_muxtest_rep3;
wire pc_oor_va_d;
wire [47:2] pc_d;
wire [47:2] pc_noncrit_d;
wire masked_pc_oor_va_d;
wire [47:32] masked_pc_d;
wire pc_e_lat_scanin;
wire pc_e_lat_scanout;
wire pc_oor_va_e;
wire [47:2] pc_e;
wire iaw_lat_wmr_scanin;
wire iaw_lat_wmr_scanout;
wire iaw_en;
wire [47:2] iaw_va;
wire [48:2] asi_data;
wire [48:2] asi_data_0_;




input		l2clk;		
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;
input		tcu_dectest;
input		tcu_muxtest;

input		tcu_scan_en_wmr;
input 		spc_aclk_wmr;		// Warm reset (non)scan
input		wmr_scan_in;

// RSTVADDR (POR address) control
input 		tcu_wmr_vec_mask;	// PINDEF:BOT

input 		dec_flush_b;
input	[1:0]	dec_inst_cnt;		// Count of instructions in E, M, B
input	[3:0]	dec_raw_pick_p;		// Decoded TID at P

input	[47:2]	exu_address_m;		// Target for taken branches
input		exu_oor_va_m;

input	[47:0]	mmu_itte_tag_data;

input	[3:0]	asi_rd_pc;
input		asi_rd_iaw;
input		asi_wr_iaw;
input	[47:0]	asi_wr_data;

input 	[3:0]	fls_tid_dec_b;
input 	[3:0]	fls_tid_dec_w;
input 	[3:0]	fls_pc_sel_npc;		// Sequential flow
input 	[3:0]	fls_pc_sel_npc_plus_4;	// Branch taken or(not taken with annul)
input 	[3:0]	fls_npc_sel_npc_plus_4;	// Sequential flow
input 	[3:0]	fls_npc_sel_npc_plus_8;	// Branch not taken with annul
input 	[3:0]	fls_npc_sel_target;	// Branch taken
input 		fls_npc_b_sel_npc;	// NPC is invalid (but going valid)
input		fls_pc_is_npc;		// PC reg actually holds NPC, not PC
input		fls_pstate_am_d_;	// For instruction watchpoint
input		fls_pstate_am_b_;	// For dsfar
input		fls_pstate_am_w_;	// For itlb_tag_access
input	[4:2]	fls_npc_if_cnt_eq_1_d;
input	[4:2]	fls_npc_if_cnt_eq_2_d;
input	[4:2]	fls_npc_if_cnt_eq_3_d;
input	[3:0]	fls_pct_pc_en;		// Power managment for PC flops
input	[3:0]	fls_pct_npc_en;		// Power managment for NPC flops

input 	[3:0]	trl_pc_sel_trap_pc;	// Trap, retry, or done taken; update PC
input 	[3:0]	trl_npc_sel_trap_npc;	// Trap taken; update NPC
input 	[3:0]	trl_npc_sel_tnpc;	// Retry or done taken; update NPC
input	[8:0] trl_trap_type;		// Trap type
input	[3:0]	trl_pc_thread_sel;	// Which thread is trapping
input 		trl_pc_pstate_am_;
input		trl_pc_sel_pc;		// Retry the excepting instruction
input		trl_pc_sel_npc;		// Advance to the next instruction
input		trl_pc_sel_trap;	// Select the trap PC
input		trl_pc_sel_reset;	// Select the reset PC
input		trl_pc_done;		// Select the NPC from the stack
input		trl_pc_retry;		// Select the PC from the stack
input		trl_pc_tte;		// Select the TTE for ITLB write
input		trl_pct_trap_pc_en;	// Power management
input		trl_pct_tnpc_en;

input	[47:14]	tsd_tba;		// Trap Base Address 
input	[47:2]	tsd_tpc;
input		tsd_tpc_oor_va;
input	[47:2] tsd_tnpc;
input		tsd_tnpc_oor_va;
input		tsd_tnpc_nonseq;
input	[47:2]	tsd_asi_data_;
input	[3:0]	tsd_pstate_am;


output		scan_out;		

output		wmr_scan_out;		// Warm reset (non)scan

output	[48:2]	pct_asi_data;

output	[3:2]	pct_npc_0_w;
output	[3:2]	pct_npc_1_w;
output	[3:2]	pct_npc_2_w;
output	[3:2]	pct_npc_3_w;

output	[47:2]	pct_tsa_pc;
output 		pct_tsa_pc_oor_va;
output	[47:2]	pct_tsa_npc;
output 		pct_tsa_npc_oor_va;
output 		pct_tsa_npc_nonseq;
output	[3:0]	pct_npc_is_nonseq;
output		pct_pc_oor_va_e;

output	[1:0]	pct_iaw_exc_e;

output	[47:2]	pct_shadow_pc_d;

output	[47:2]	pct_npc_w;

output	[47:2]	pct_target_b;

output	[16:0]	pct_trl_wr_data;

output	[10:5]	tsd_pc_w;

output	[47:2]	tlu_pc_d;
output	[47:13]	tlu_pc_w;
output	[47:0] tlu_trap_pc;



////////////////////////////////////////////////////////////////////////////////

assign en 	= 1'b1;
assign clk 	= l2clk;
assign stop	= 1'b0;
assign test	= tcu_dectest;

tlu_pct_dp_buff_macro__width_4 clk_control_buf  (
	.din	({tcu_pce_ov		       ,
		  tcu_scan_en		       ,
		  spc_aclk		       ,
		  spc_bclk		       }),
	.dout	({pce_ov		       ,
		  se			       ,
		  siclk			       ,
		  soclk			       })
);



////////////////////////////////////////////////////////////////////////////////
// Pass target from M to B

tlu_pct_dp_msff_macro__stack_48c__width_48 target_b_lat   (
	.scan_in(target_b_lat_scanin),
	.scan_out(target_b_lat_scanout),
	.din	({tcu_wmr_vec_mask	       ,
		  exu_oor_va_m		       ,
		  exu_address_m		[47:2]}),
	.dout	({wmr_vec_mask		       ,
		  oor_va_b		       ,
		  target_b		[47:2]}),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_pct_dp_and_macro__ports_2__stack_48c__width_46 target_b_buf    (
	.din0	(target_b		[47:2]	),
	.din1	({{16 {fls_pstate_am_b_}}      ,
		  {30 {1'b1}}		       }),
	.dout	(pct_target_b		[47:2]	)
);



////////////////////////////////////////////////////////////////////////////////
// Save each thread's PC and NPC

// Have to use trap_pc because it merges any_trap_pc and reset_trap_pc
//  Also already has TPC and TNPC merged in...
// PC update to trap vector value should happen concurrently with TSA update

tlu_pct_dp_buff_macro__stack_48c__width_1 flush_b_buf   (
	.din	(dec_flush_b			),
	.dout	(flush_b			)
);

tlu_pct_dp_msff_macro__mux_aope__ports_5__stack_48c__width_47 pc_3_w_lat     (
	.scan_in(pc_3_w_lat_scanin),
	.scan_out(pc_3_w_lat_scanout),
	.din0	({trap_pc_oor_va	       ,
		  trap_pc		[47:2]}),
	.din1	({pc_3_oor_va_w		       ,
		  pc_3_w		[47:2]}),
	.din2	({1'b0			       ,
		  npc_plus_4_noncrit_b	[47:2]}),
	.din3	({npc_oor_va_b		       ,
		  npc_noncrit_b		[47:2]}),
	.din4	({pc_3_oor_va_w		       ,
		  pc_3_w		[47:2]}),
	.sel0	(trl_pc_sel_trap_pc	[3   ]	),
	.sel1	(flush_b			),
	.sel2	(fls_pc_sel_npc_plus_4	[3   ]	),
	.sel3	(fls_pc_sel_npc		[3   ]	),
	.en	(fls_pct_pc_en		[3   ]	),
	.dout	({pc_3_oor_va_w		       ,
		  pc_3_w		[47:2]}),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_pct_dp_msff_macro__mux_aope__ports_5__stack_48c__width_47 pc_2_w_lat     (
	.scan_in(pc_2_w_lat_scanin),
	.scan_out(pc_2_w_lat_scanout),
	.din0	({trap_pc_oor_va	       ,
		  trap_pc		[47:2]}),
	.din1	({pc_2_oor_va_w		       ,
		  pc_2_w		[47:2]}),
	.din2	({1'b0			       ,
		  npc_plus_4_noncrit_b	[47:2]}),
	.din3	({npc_oor_va_b		       ,
		  npc_noncrit_b		[47:2]}),
	.din4	({pc_2_oor_va_w		       ,
		  pc_2_w		[47:2]}),
	.sel0	(trl_pc_sel_trap_pc	[2   ]	),
	.sel1	(flush_b			),
	.sel2	(fls_pc_sel_npc_plus_4	[2   ]	),
	.sel3	(fls_pc_sel_npc		[2   ]	),
	.en	(fls_pct_pc_en		[2   ]	),
	.dout	({pc_2_oor_va_w		       ,
		  pc_2_w		[47:2]}),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_pct_dp_msff_macro__mux_aope__ports_5__stack_48c__width_47 pc_1_w_lat     (
	.scan_in(pc_1_w_lat_scanin),
	.scan_out(pc_1_w_lat_scanout),
	.din0	({trap_pc_oor_va	       ,
		  trap_pc		[47:2]}),
	.din1	({pc_1_oor_va_w		       ,
		  pc_1_w		[47:2]}),
	.din2	({1'b0			       ,
		  npc_plus_4_noncrit_b	[47:2]}),
	.din3	({npc_oor_va_b		       ,
		  npc_noncrit_b		[47:2]}),
	.din4	({pc_1_oor_va_w		       ,
		  pc_1_w		[47:2]}),
	.sel0	(trl_pc_sel_trap_pc	[1   ]	),
	.sel1	(flush_b			),
	.sel2	(fls_pc_sel_npc_plus_4	[1   ]	),
	.sel3	(fls_pc_sel_npc		[1   ]	),
	.en	(fls_pct_pc_en		[1   ]	),
	.dout	({pc_1_oor_va_w		       ,
		  pc_1_w		[47:2]}),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_pct_dp_msff_macro__mux_aope__ports_5__stack_48c__width_47 pc_0_w_lat     (
	.scan_in(pc_0_w_lat_scanin),
	.scan_out(pc_0_w_lat_scanout),
	.din0	({trap_pc_oor_va	       ,
		  trap_pc		[47:2]}),
	.din1	({pc_0_oor_va_w		       ,
		  pc_0_w		[47:2]}),
	.din2	({1'b0			       ,
		  npc_plus_4_noncrit_b	[47:2]}),
	.din3	({npc_oor_va_b		       ,
		  npc_noncrit_b		[47:2]}),
	.din4	({pc_0_oor_va_w		       ,
		  pc_0_w		[47:2]}),
	.sel0	(trl_pc_sel_trap_pc	[0   ]	),
	.sel1	(flush_b			),
	.sel2	(fls_pc_sel_npc_plus_4	[0   ]	),
	.sel3	(fls_pc_sel_npc		[0   ]	),
	.en	(fls_pct_pc_en		[0   ]	),
	.dout	({pc_0_oor_va_w		       ,
		  pc_0_w		[47:2]}),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// Hold tsd_tnpc for one cycle to allow for ECC check of TSA
tlu_pct_dp_msff_macro__minbuff_1__stack_48c__width_48 tnpc_lat    (
	.scan_in(tnpc_lat_scanin),
	.scan_out(tnpc_lat_scanout),
	.din	({tsd_tnpc_nonseq	       ,
		  tsd_tnpc_oor_va	       ,
		  tsd_tnpc		[47:2]}),
	.en	(trl_pct_tnpc_en	       	),
	.dout	({tnpc_nonseq		       ,
		  tnpc_oor_va		       ,
		  tnpc			[47:2]}),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_pct_dp_msff_macro__mux_aope__ports_7__stack_48c__width_48 npc_3_w_lat     (
	.scan_in(npc_3_w_lat_scanin),
	.scan_out(npc_3_w_lat_scanout),
	.din0	({1'b0			       ,
		  trap_pc_oor_va	       ,
		  trap_pc		[47:3],
		  1'b1			       }),
	.din1	({tnpc_nonseq		       ,
		  tnpc_oor_va		       ,
		  tnpc			[47:2]}),
	.din2	({npc_3_nonseq		       ,
		  npc_3_oor_va_w	       ,
		  npc_3_w		[47:2]}),
	.din3	({1'b1			       ,
		  oor_va_b		       ,
		  target_b		[47:2]}),
	.din4	({{2 {1'b0}}		       ,
		  npc_plus_8_b		[47:2]}),
	.din5	({{2 {1'b0}}		       ,
		  npc_plus_4_noncrit_b	[47:2]}),
	.din6	({npc_3_nonseq		       ,
		  npc_3_oor_va_w	       ,
		  npc_3_w		[47:2]}),
        .sel0	(trl_npc_sel_trap_npc	[3   ]	),
        .sel1	(trl_npc_sel_tnpc	[3   ]	),
	.sel2	(flush_b			),
	.sel3	(fls_npc_sel_target	[3   ]	),
	.sel4	(fls_npc_sel_npc_plus_8	[3   ]	),
	.sel5	(fls_npc_sel_npc_plus_4	[3   ]	),
	.en	(fls_pct_npc_en		[3   ]	),
	.dout	({npc_3_nonseq		       ,
		  npc_3_oor_va_w	       ,
		  npc_3_w		[47:4],
		  npc_3_crit_w		[3:2]}),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_pct_dp_buff_macro__stack_48c__width_2 npc_3_w_buf   (
	.din	(npc_3_crit_w		[3:2]	),
	.dout	(npc_3_w		[3:2]	)
);

tlu_pct_dp_msff_macro__mux_aope__ports_7__stack_48c__width_48 npc_2_w_lat     (
	.scan_in(npc_2_w_lat_scanin),
	.scan_out(npc_2_w_lat_scanout),
	.din0	({1'b0			       ,
		  trap_pc_oor_va	       ,
		  trap_pc		[47:3],
		  1'b1			       }),
	.din1	({tnpc_nonseq		       ,
		  tnpc_oor_va		       ,
		  tnpc			[47:2]}),
	.din2	({npc_2_nonseq		       ,
		  npc_2_oor_va_w	       ,
		  npc_2_w		[47:2]}),
	.din3	({1'b1			       ,
		  oor_va_b		       ,
		  target_b		[47:2]}),
	.din4	({{2 {1'b0}}		       ,
		  npc_plus_8_b		[47:2]}),
	.din5	({{2 {1'b0}}		       ,
		  npc_plus_4_noncrit_b	[47:2]}),
	.din6	({npc_2_nonseq		       ,
		  npc_2_oor_va_w	       ,
		  npc_2_w		[47:2]}),
        .sel0	(trl_npc_sel_trap_npc	[2   ]	),
        .sel1	(trl_npc_sel_tnpc	[2   ]	),
	.sel2	(flush_b			),
	.sel3	(fls_npc_sel_target	[2   ]	),
	.sel4	(fls_npc_sel_npc_plus_8	[2   ]	),
	.sel5	(fls_npc_sel_npc_plus_4	[2   ]	),
	.en	(fls_pct_npc_en		[2   ]	),
	.dout	({npc_2_nonseq		       ,
		  npc_2_oor_va_w	       ,
		  npc_2_w		[47:4],
		  npc_2_crit_w		[3:2]}),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_pct_dp_buff_macro__stack_48c__width_2 npc_2_w_buf   (
	.din	(npc_2_crit_w		[3:2]	),
	.dout	(npc_2_w		[3:2]	)
);

tlu_pct_dp_msff_macro__mux_aope__ports_7__stack_48c__width_48 npc_1_w_lat     (
	.scan_in(npc_1_w_lat_scanin),
	.scan_out(npc_1_w_lat_scanout),
	.din0	({1'b0			       ,
		  trap_pc_oor_va	       ,
		  trap_pc		[47:3],
		  1'b1			       }),
	.din1	({tnpc_nonseq		       ,
		  tnpc_oor_va		       ,
		  tnpc			[47:2]}),
	.din2	({npc_1_nonseq		       ,
		  npc_1_oor_va_w	       ,
		  npc_1_w		[47:2]}),
	.din3	({1'b1			       ,
		  oor_va_b		       ,
		  target_b		[47:2]}),
	.din4	({{2 {1'b0}}		       ,
		  npc_plus_8_b		[47:2]}),
	.din5	({{2 {1'b0}}		       ,
		  npc_plus_4_noncrit_b	[47:2]}),
	.din6	({npc_1_nonseq		       ,
		  npc_1_oor_va_w	       ,
		  npc_1_w		[47:2]}),
        .sel0	(trl_npc_sel_trap_npc	[1   ]	),
        .sel1	(trl_npc_sel_tnpc	[1   ]	),
	.sel2	(flush_b			),
	.sel3	(fls_npc_sel_target	[1   ]	),
	.sel4	(fls_npc_sel_npc_plus_8	[1   ]	),
	.sel5	(fls_npc_sel_npc_plus_4	[1   ]	),
	.en	(fls_pct_npc_en		[1   ]	),
	.dout	({npc_1_nonseq		       ,
		  npc_1_oor_va_w	       ,
		  npc_1_w		[47:4],
		  npc_1_crit_w		[3:2]}),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_pct_dp_buff_macro__stack_48c__width_2 npc_1_w_buf   (
	.din	(npc_1_crit_w		[3:2]	),
	.dout	(npc_1_w		[3:2]	)
);

tlu_pct_dp_msff_macro__mux_aope__ports_7__stack_48c__width_48 npc_0_w_lat     (
	.scan_in(npc_0_w_lat_scanin),
	.scan_out(npc_0_w_lat_scanout),
	.din0	({1'b0			       ,
		  trap_pc_oor_va	       ,
		  trap_pc		[47:3],
		  1'b1			       }),
	.din1	({tnpc_nonseq		       ,
		  tnpc_oor_va		       ,
		  tnpc			[47:2]}),
	.din2	({npc_0_nonseq		       ,
		  npc_0_oor_va_w	       ,
		  npc_0_w		[47:2]}),
	.din3	({1'b1			       ,
		  oor_va_b		       ,
		  target_b		[47:2]}),
	.din4	({{2 {1'b0}}		       ,
		  npc_plus_8_b		[47:2]}),
	.din5	({{2 {1'b0}}		       ,
		  npc_plus_4_noncrit_b	[47:2]}),
	.din6	({npc_0_nonseq		       ,
		  npc_0_oor_va_w	       ,
		  npc_0_w		[47:2]}),
        .sel0	(trl_npc_sel_trap_npc	[0   ]	),
        .sel1	(trl_npc_sel_tnpc	[0   ]	),
	.sel2	(flush_b			),
	.sel3	(fls_npc_sel_target	[0   ]	),
	.sel4	(fls_npc_sel_npc_plus_8	[0   ]	),
	.sel5	(fls_npc_sel_npc_plus_4	[0   ]	),
	.en	(fls_pct_npc_en		[0   ]	),
	.dout	({npc_0_nonseq		       ,
		  npc_0_oor_va_w	       ,
		  npc_0_w		[47:4],
		  npc_0_crit_w		[3:2]}),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_pct_dp_buff_macro__stack_48c__width_2 npc_0_w_buf   (
	.din	(npc_0_crit_w		[3:2]	),
	.dout	(npc_0_w		[3:2]	)
);


assign pct_npc_is_nonseq[3:0] =
       {npc_3_nonseq, npc_2_nonseq, npc_1_nonseq, npc_0_nonseq};



////////////////////////////////////////////////////////////////////////////////
// Generate NPC

tlu_pct_dp_mux_macro__dmux_8x__mux_aonpe__ports_4__stack_48c__width_47 npc_incr_mux      (
	.din0	({npc_0_oor_va_w	       ,
		  npc_0_w		[47:2]}),
	.din1	({npc_1_oor_va_w	       ,
		  npc_1_w		[47:2]}),
	.din2	({npc_2_oor_va_w	       ,
		  npc_2_w		[47:2]}),
	.din3	({npc_3_oor_va_w	       ,
		  npc_3_w		[47:2]}),
	.sel0	(fls_tid_dec_b		[0   ]	),
	.sel1	(fls_tid_dec_b		[1   ]	),
	.sel2	(fls_tid_dec_b		[2   ]	),
	.sel3	(fls_tid_dec_b		[3   ]	),
	.dout	({npc_oor_va_b		       ,
		  npc_b			[47:2]})
);

tlu_pct_dp_buff_macro__stack_48c__width_46 npc_buf   (
	.din	(npc_b			[47:2] ),
	.dout	(npc_noncrit_b		[47:2] )
);

tlu_pct_dp_increment_macro__width_32 npc_33_02_plus_4_b_inc  (
	.din	(npc_b			[33:2]	),
	.cin	(1'b1				),
	.dout	(npc_plus_4_b		[33:2]	),
	.cout	(npc_33_02_plus_4_cout_b	)
);

tlu_pct_dp_increment_macro__width_16 npc_plus_4_u_b_inc  (
	.din	({2'b00			       ,
		  npc_b			[47:34]}),
	.cin	(npc_33_02_plus_4_cout_b	),
	.dout	({npc_plus_4_b_unused	[49:48],
		  npc_plus_4_b		[47:34]}),
	.cout	(npc_49_34_plus_4_cout_b_unused	)
);

tlu_pct_dp_buff_macro__stack_48c__width_46 npc_plus_4_noncrit_b_buf   (
	.din	(npc_plus_4_b		[47:2]	),
	.dout	(npc_plus_4_noncrit_b	[47:2]	)
);

tlu_pct_dp_increment_macro__width_32 npc_34_03_plus_8_b_inc  (
	.din	(npc_b			[34:3]	),
	.cin	(1'b1				),
	.dout	(npc_plus_8_b		[34:3]	),
	.cout	(npc_34_03_plus_8_cout_b	)
);

assign npc_plus_8_b[2] = npc_noncrit_b[2];

tlu_pct_dp_increment_macro__width_16 npc_47_35_plus_8_b_inc  (
	.din	({3'b000		       ,
		  npc_b			[47:35]}),
	.cin	(npc_34_03_plus_8_cout_b	),
	.dout	({npc_plus_8_b_unused	[50:48],
		  npc_plus_8_b		[47:35]}),
	.cout	(npc_50_35_plus_8_cout_b_unused	)
);

// Generate NPC for instruction in W for load sync case for fetch
// Only has to be correct for loads that are not flushed
tlu_pct_dp_msff_macro__mux_pgpe__ports_2__stack_48c__width_46 npc_w_lat     (
	.scan_in(npc_b_mux_scanin),
	.scan_out(npc_b_mux_scanout),
	.din0	(npc_noncrit_b		[47:2]	),
	.din1	(npc_plus_4_b		[47:2]	),
	.sel0	(fls_npc_b_sel_npc		),
	.dout	(pct_npc_w		[47:2]	),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);




////////////////////////////////////////////////////////////////////////////////
// Generate trap PC, NPC

tlu_pct_dp_mux_macro__mux_aonpe__ports_4__stack_48c__width_47 pc_mux     (
	.din0	({pc_0_oor_va_w		       ,
		  pc_0_w		[47:2]}),
	.din1	({pc_1_oor_va_w		       ,
		  pc_1_w		[47:2]}),
	.din2	({pc_2_oor_va_w		       ,
		  pc_2_w		[47:2]}),
	.din3	({pc_3_oor_va_w		       ,
		  pc_3_w		[47:2]}),
	.sel0	(trl_pc_thread_sel	[0   ]	),
	.sel1	(trl_pc_thread_sel	[1   ]	),
	.sel2	(trl_pc_thread_sel	[2   ]	),
	.sel3	(trl_pc_thread_sel	[3   ]	),
	.dout	({tsa_pc_oor_va_w	       ,
		  tsa_pc_unmasked_w	[47:2]})
);

tlu_pct_dp_and_macro__left_30__ports_2__stack_48c__width_16 tsa_pc_w_and     (
	.din0	(tsa_pc_unmasked_w	[47:32]	),
	.din1	({16 {trl_pc_pstate_am_}}	),
	.dout	(tsa_pc_w		[47:32]	)
);

assign pct_tsa_pc[47:2] =
       {tsa_pc_w		[47:32],
	tsa_pc_unmasked_w	[31:2]};

assign pct_tsa_pc_oor_va =
       tsa_pc_oor_va_w;

tlu_pct_dp_mux_macro__mux_aonpe__ports_4__stack_48c__width_48 npc_mux     (
	.din0	({npc_0_nonseq		       ,
		  npc_0_oor_va_w	       ,
		  npc_0_w		[47:2]}),
	.din1	({npc_1_nonseq		       ,
		  npc_1_oor_va_w	       ,
		  npc_1_w		[47:2]}),
	.din2	({npc_2_nonseq		       ,
		  npc_2_oor_va_w	       ,
		  npc_2_w		[47:2]}),
	.din3	({npc_3_nonseq		       ,
		  npc_3_oor_va_w	       ,
		  npc_3_w		[47:2]}),
	.sel0	(trl_pc_thread_sel	[0   ]	),
	.sel1	(trl_pc_thread_sel	[1   ]	),
	.sel2	(trl_pc_thread_sel	[2   ]	),
	.sel3	(trl_pc_thread_sel	[3   ]	),
	.dout	({npc_nonseq		       ,
		  tsa_npc_oor_va_w	       ,
		  tsa_npc_unmasked_w	[47:2]})
);

tlu_pct_dp_and_macro__left_30__ports_2__stack_48c__width_16 tsa_npc_w_and     (
	.din0	(tsa_npc_unmasked_w	[47:32]	),
	.din1	({16 {trl_pc_pstate_am_}}	),
	.dout	(tsa_npc_w		[47:32]	)
);

assign pct_tsa_npc[47:2] =
       {tsa_npc_w		[47:32],
	tsa_npc_unmasked_w	[31:2]};

assign pct_tsa_npc_oor_va =
       tsa_npc_oor_va_w;

assign pct_tsa_npc_nonseq =
       npc_nonseq;

assign any_trap_pc[47:14] = 
	tsd_tba[47:14];

assign any_trap_pc[13:5] = 
	trl_trap_type[8:0];

assign any_trap_pc[4:2] = 
	3'b000;

// Select RSTVADDR == 48'hfffff0000000 or == 0
// Create a tree to prevent overloading of flop

tlu_pct_dp_inv_macro__stack_48c__width_5 reset_pc_inv   (
	.din	({5 {wmr_vec_mask}}		),
	.dout	(wmr_vec_mask_		[4:0]	)
);

assign reset_pc[47:8] =
	{{ 4 {wmr_vec_mask_[4]}},
	 { 4 {wmr_vec_mask_[3]}},
	 { 4 {wmr_vec_mask_[2]}},
	 { 4 {wmr_vec_mask_[1]}},
	 { 4 {wmr_vec_mask_[0]}},
	 {20 {1'b0}}};

assign reset_pc[7:5] = 
	trl_trap_type[2:0];

assign reset_pc[4:2] = 
	3'b000;

// Selects are checked with 0in inside trl
tlu_pct_dp_msff_macro__mux_aope__ports_8__stack_48c__width_48 trap_pc_lat     (
	.scan_in(trap_pc_lat_scanin),
	.scan_out(trap_pc_lat_scanout),
	.din0	({tsa_pc_unmasked_w	[47:2],
		  tsa_pc_oor_va_w	       ,
		  {1 {1'b0}}		       }),
	.din1	({tsa_npc_unmasked_w	[47:2],
		  tsa_npc_oor_va_w	       ,
		  {1 {1'b0}}		       }),
	.din2	({any_trap_pc		[47:2],
		  {2 {1'b0}}		       }),
	.din3	({reset_pc		[47:2],
		  {2 {1'b0}}		       }),
	.din4	({tsd_tpc		[47:2],
		  tsd_tpc_oor_va	       ,
		  {1 {1'b0}}		       }),
	.din5	({tsd_tnpc		[47:2],
		  tsd_tnpc_oor_va	       ,
		  {1 {1'b0}}		       }),
	.din6	(mmu_itte_tag_data	[47:0]	),
	.din7	(trap_pc		[47:0]	),
	.sel0	(trl_pc_sel_pc			),
	.sel1	(trl_pc_sel_npc			),
	.sel2	(trl_pc_sel_trap		),
	.sel3	(trl_pc_sel_reset		),
	.sel4	(trl_pc_retry			),
	.sel5	(trl_pc_done			),
	.sel6	(trl_pc_tte			),
	.en	(trl_pct_trap_pc_en		),
	.dout	(trap_pc		[47:0] ),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);


assign tlu_trap_pc[47:0] = 
       trap_pc[47:0];

assign trap_pc_oor_va =
       trap_pc[1];



////////////////////////////////////////////////////////////////////////////////
// Pass PC in W for tag_access reg
// and for DESR

tlu_pct_dp_mux_macro__left_3__mux_aonpe__ports_4__stack_48c__width_43 piped_pc_w_mux      (
	.din0	(pc_0_w			[47:5]	),
	.din1	(pc_1_w			[47:5]	),
	.din2	(pc_2_w			[47:5]	),
	.din3	(pc_3_w			[47:5]	),
	.sel0	(fls_tid_dec_w		[0   ]	),
	.sel1	(fls_tid_dec_w		[1   ]	),
	.sel2	(fls_tid_dec_w		[2   ]	),
	.sel3	(fls_tid_dec_w		[3   ]	),
	.dout	({piped_pc_w		[47:32],
		  piped_pc_pre_buf_w	[31:5]})
);

tlu_pct_dp_buff_macro__left_3__rep_1__stack_48c__width_27 piped_pc_w_buf     (
	.din	(piped_pc_pre_buf_w	[31:5]	),
	.dout	(piped_pc_w		[31:5]	)
);

assign tsd_pc_w[10:5] =
       piped_pc_w[10:5];

assign piped_pc_pre_buf_w_unused[12:11] =
       piped_pc_pre_buf_w[12:11];

assign piped_pc_w_unused[12:11] =
       piped_pc_w[12:11];
	
tlu_pct_dp_and_macro__left_30__ports_2__stack_48c__width_16 masked_pc_w_and     (
	.din0	(piped_pc_w		[47:32]	),
	.din1	({16 {fls_pstate_am_w_}}	),
	.dout	(masked_pc_w		[47:32]	)
);

assign tlu_pc_w[47:13] = 
       {masked_pc_w[47:32], piped_pc_w[31:13]};



////////////////////////////////////////////////////////////////////////////////
// Mux PC for shadow scan



////////////////////////////////////////////////////////////////////////////////
// Generate PC for instruction in D

assign pct_npc_3_w[3:2] =
       npc_3_crit_w[3:2];
assign pct_npc_2_w[3:2] =
       npc_2_crit_w[3:2];
assign pct_npc_1_w[3:2] =
       npc_1_crit_w[3:2];
assign pct_npc_0_w[3:2] =
       npc_0_crit_w[3:2];

tlu_pct_dp_mux_macro__dmux_8x__mux_aonpe__ports_4__stack_48c__width_47 pre_pc_d_mux      (
	.din0	({pc_0_oor_va_w		       ,
		  pc_0_w		[47:2]}),
	.din1	({pc_1_oor_va_w		       ,
		  pc_1_w		[47:2]}),
	.din2	({pc_2_oor_va_w		       ,
		  pc_2_w		[47:2]}),
	.din3	({pc_3_oor_va_w		       ,
		  pc_3_w		[47:2]}),
	.sel0	(tid_dec_buf_d		[0]	),
	.sel1	(tid_dec_buf_d		[1]	),
	.sel2	(tid_dec_buf_d		[2]	),
	.sel3	(tid_dec_buf_d		[3]	),
	.dout	({pre_pc_oor_va_d	       ,
		  pre_pc_d		[47:2]})
);

// Muxing down PSTATE.am for PC reads.  However, if reading 
// instruction VA watchpoint, then masking must NOT occur

tlu_pct_dp_nand_macro__ports_2__width_4 pstate_am_b_nand   (
	.din0	(asi_rd_pc		[3:0]	),
	.din1	(tsd_pstate_am		[3:0]	),
	.dout	(pstate_am_		[3:0]	)
);

tlu_pct_dp_nand_macro__ports_4__width_1 rd_pc_pstate_am_in_nand   (
	.din0	(pstate_am_		[0   ]	),
	.din1	(pstate_am_		[1   ]	),
	.din2	(pstate_am_		[2   ]	),
	.din3	(pstate_am_		[3   ]	),
	.dout	(rd_pc_pstate_am_in		)
);

tlu_pct_dp_msff_macro__left_20__stack_48c__width_10 tid_d_lat    (
	.scan_in(tid_d_lat_scanin),
	.scan_out(tid_d_lat_scanout),
	.din	({rd_pc_pstate_am_in	       ,
		  asi_rd_iaw		       ,
		  asi_rd_pc		[3:0],
		  dec_raw_pick_p	[3:0]}),
	.dout	({prd_pc_pstate_am	       ,
		  rd_iaw		       ,
		  rd_pc			[3:0],
		  tid_dec_d		[3:0]}),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_pct_dp_inv_macro__width_1 rd_iaw_b_inv  (
	.din	(rd_iaw				),
	.dout	(rd_iaw_			)
);

tlu_pct_dp_nand_macro__ports_2__width_1 rd_pc_pstate_am_b_nand   (
	.din0	(rd_iaw_			),
	.din1	(prd_pc_pstate_am		),
	.dout	(rd_pc_pstate_am_		)
);

tlu_pct_dp_buff_macro__stack_48c__width_4 tid_d_buf   (
	.din	(tid_dec_d		[3:0]	),
	.dout	(tid_dec_buf_d		[3:0]	)
);

tlu_pct_dp_mux_macro__dmux_8x__mux_aonpe__ports_4__stack_48c__width_47 pre_npc_d_mux      (
	.din0	({npc_0_oor_va_w	       ,
		  npc_0_w		[47:2]}),
	.din1	({npc_1_oor_va_w	       ,
		  npc_1_w		[47:2]}),
	.din2	({npc_2_oor_va_w	       ,
		  npc_2_w		[47:2]}),
	.din3	({npc_3_oor_va_w	       ,
		  npc_3_w		[47:2]}),
	.sel0	(tid_dec_d		[0]	),
	.sel1	(tid_dec_d		[1]	),
	.sel2	(tid_dec_d		[2]	),
	.sel3	(tid_dec_d		[3]	),
	.dout	({pre_npc_oor_va_d	       ,
		  pre_npc_d		[47:2]})
);

tlu_pct_dp_buff_macro__stack_48c__width_46 pre_npc_noncrit_d_buf   (
	.din	(pre_npc_d		[47:2]	),
	.dout	(pre_npc_noncrit_d	[47:2]	)
);

// The increment can be before the mux because you have to use the
// NPC if the count is nonzero
// Bits are separated to account for alignment with 48c stack and
// that the lower two bits are not used
tlu_pct_dp_increment_macro__width_64 pc_d_47_04_inc  (
	.cin	(1'b1				),
	.din	({12'h000		       ,
		  pre_npc_d		[47:26],
		  8'hff			       ,
		  pre_npc_d		[25:4]}),
	.dout	({npc_inc_unused	[63:52],
		  npc_inc_d		[47:26],
		  npc_inc_unused	[29:22],
		  npc_inc_d		[25:4]}),
	.cout	(npc_inc_cout_d_unused		)
);

// Must take PC if PC actually holds NPC
// If a branch in the delay slot of another branch is at decode 
//  (signified by dec_inst_cnt[01:00] being nonzero), then the PC is no longer 
//  the NPC.

tlu_pct_dp_or_macro__stack_48c__width_1 inst_cnt_nz_or   (
	.din0	(dec_inst_cnt		[1   ]	),
	.din1	(dec_inst_cnt		[0   ]	),
	.dout	(inst_cnt_nz			)
);

tlu_pct_dp_inv_macro__width_2 inst_cnt_inv_inv  (
	.din	(dec_inst_cnt		[1:0]	),
	.dout	(inst_cnt_		[1:0]	)
);

tlu_pct_dp_nand_macro__ports_3__width_3 npc_inc_0_d_nand   (
	.din0	({1'b0			       ,
		  pre_npc_d		[3:2]}),
	.din1	({3 {inst_cnt_[1]}}		),
	.din2	({3 {inst_cnt_[0]}}		),
	.dout	(npc_inc_0_d		[4:2]	)
);

tlu_pct_dp_nand_macro__ports_3__width_3 npc_inc_1_d_nand   (
	.din0	(fls_npc_if_cnt_eq_1_d	[4:2]	),
	.din1	({3 {inst_cnt_[1]}}		),
	.din2	({3 {dec_inst_cnt[0]}}		),
	.dout	(npc_inc_1_d		[4:2]	)
);

tlu_pct_dp_nand_macro__ports_3__width_3 npc_inc_2_d_nand   (
	.din0	(fls_npc_if_cnt_eq_2_d	[4:2]	),
	.din1	({3 {dec_inst_cnt[1]}}		),
	.din2	({3 {inst_cnt_[0]}}		),
	.dout	(npc_inc_2_d		[4:2]	)
);

tlu_pct_dp_nand_macro__ports_3__width_3 npc_inc_3_d_nand   (
	.din0	(fls_npc_if_cnt_eq_3_d	[4:2]	),
	.din1	({3 {dec_inst_cnt[1]}}		),
	.din2	({3 {dec_inst_cnt[0]}}		),
	.dout	(npc_inc_3_d		[4:2]	)
);

tlu_pct_dp_nand_macro__ports_4__width_3 npc_inc_d_nand   (
	.din0	(npc_inc_0_d		[4:2]	),
	.din1	(npc_inc_1_d		[4:2]	),
	.din2	(npc_inc_2_d		[4:2]	),
	.din3	(npc_inc_3_d		[4:2]	),
	.dout	({pc_4_carry_d		       ,
		  npc_inc_d		[3:2]})
);


tlu_pct_dp_buff_macro__dbuff_48x__width_1 tst_mux_rep3   (
	.din	(tcu_muxtest			),
	.dout	(tcu_muxtest_rep3		)
);

tlu_pct_dp_mux_macro__mux_pgpe__ports_4__stack_48c__width_47 pc_d_mux     (
	.din0	({pre_npc_oor_va_d	       ,
		  npc_inc_d		[47:2]}),
	.din1	({pre_npc_oor_va_d	       ,
		  pre_npc_noncrit_d	[47:4],
		  npc_inc_d		[3:2]}),
	.din2	({pre_pc_oor_va_d	       ,
		  pre_pc_d		[47:2]}),
	.din3	({pre_npc_oor_va_d	       ,
		  pre_npc_noncrit_d	[47:2]}),
	.sel0	(pc_4_carry_d			),
	.sel1	(inst_cnt_nz			),
	.sel2	(fls_pc_is_npc			),
	.muxtst	(tcu_muxtest_rep3		),
	.dout	({pc_oor_va_d		       ,
		  pc_d			[47:2]}),
  .test(test)
);

assign tlu_pc_d[47:2] =
       pc_d[47:2];

tlu_pct_dp_buff_macro__rep_1__stack_48c__width_46 pc_noncrit_d_buf    (
	.din	(pc_d			[47:2]	),
	.dout	(pc_noncrit_d		[47:2]	)
);

assign pct_shadow_pc_d[47:2] =
       pc_noncrit_d[47:2];



////////////////////////////////////////////////////////////////////////////////
// Compare instruction watchpoint in E

tlu_pct_dp_and_macro__left_30__ports_2__stack_48c__width_17 am_and     (
	.din0	({pc_oor_va_d		       ,
		  pc_noncrit_d		[47:32]}),
	.din1	({17 {fls_pstate_am_d_}}	),
	.dout	({masked_pc_oor_va_d	       ,
		  masked_pc_d		[47:32]})
);

tlu_pct_dp_msff_macro__stack_48c__width_47 pc_e_lat   (
	.scan_in(pc_e_lat_scanin),
	.scan_out(pc_e_lat_scanout),
	.din	({masked_pc_oor_va_d	       ,
		  masked_pc_d		[47:32],
		  pc_noncrit_d		[31:2]}),
	.dout	({pc_oor_va_e		       ,
		  pc_e			[47:2]}),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign pct_pc_oor_va_e =
       pc_oor_va_e;

tlu_pct_dp_msff_macro__stack_48c__width_47 iaw_lat   ( // FS:wmr_protect
	.scan_in(iaw_lat_wmr_scanin),
	.scan_out(iaw_lat_wmr_scanout),
	.se	(tcu_scan_en_wmr		),
	.siclk	(spc_aclk_wmr			),
	.en	(asi_wr_iaw			),
	.din	({asi_wr_data		[0   ],
		  asi_wr_data		[47:2]}),
	.dout	({iaw_en		       ,
		  iaw_va		[47:2]}),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_pct_dp_buff_macro__rep_1__stack_48c__width_17 wr_data_buf    (
	.din	({asi_wr_data		[1:0],
		  asi_wr_data		[16:2]}),
	.dout	({pct_trl_wr_data	[1:0],
		  pct_trl_wr_data	[16:2]})
);

tlu_pct_dp_cmp_macro__width_16 iaw_47_34_cmp  (
	.din0	({1'b0			       ,
		  1'b1			       ,
		  pc_e			[47:34]}),
	.din1	({1'b0			       ,
		  iaw_en		       ,
		  iaw_va		[47:34]}),
	.dout	(pct_iaw_exc_e		[1   ]	)
);

tlu_pct_dp_cmp_macro__width_32 iaw_33_02_cmp  (
	.din0	(pc_e			[33:2]	),
	.din1	(iaw_va			[33:2]	),
	.dout	(pct_iaw_exc_e		[0   ]	)
);



////////////////////////////////////////////////////////////////////////////////
// Mux PC for ASI reads

tlu_pct_dp_mux_macro__mux_aonpe__ports_5__stack_48c__width_47 asi_pc_mux     (
	.din0	({1'b0, pc_0_w		[47:2]}),
	.din1	({1'b0, pc_1_w		[47:2]}),
	.din2	({1'b0, pc_2_w		[47:2]}),
	.din3	({1'b0, pc_3_w		[47:2]}),
	.din4	({iaw_en, iaw_va	[47:2]}),
	.sel0	(rd_pc			[0   ]	),
	.sel1	(rd_pc			[1   ]	),
	.sel2	(rd_pc			[2   ]	),
	.sel3	(rd_pc			[3   ]	),
	.sel4	(rd_iaw				),
	.dout	(asi_data		[48:2]	)
);

tlu_pct_dp_nand_macro__ports_2__stack_48c__width_47 asi_data_0_b_nand    (
        .din0	({{17 {rd_pc_pstate_am_}}      ,
		  {30 {1'b1}}		       }),
	.din1	(asi_data		[48:2]	),
	.dout	(asi_data_0_		[48:2]	)
);

tlu_pct_dp_nand_macro__ports_2__stack_48c__width_47 asi_data_nand    (
	.din0	({1'b1, tsd_asi_data_	[47:2]}),
	.din1	(asi_data_0_		[48:2]	),
	.dout	(pct_asi_data		[48:2]	)
);





// fixscan start:
assign target_b_lat_scanin       = scan_in                  ;
assign pc_3_w_lat_scanin         = target_b_lat_scanout     ;
assign pc_2_w_lat_scanin         = pc_3_w_lat_scanout       ;
assign pc_1_w_lat_scanin         = pc_2_w_lat_scanout       ;
assign pc_0_w_lat_scanin         = pc_1_w_lat_scanout       ;
assign tnpc_lat_scanin           = pc_0_w_lat_scanout       ;
assign npc_3_w_lat_scanin        = tnpc_lat_scanout         ;
assign npc_2_w_lat_scanin        = npc_3_w_lat_scanout      ;
assign npc_1_w_lat_scanin        = npc_2_w_lat_scanout      ;
assign npc_0_w_lat_scanin        = npc_1_w_lat_scanout      ;
assign npc_b_mux_scanin          = npc_0_w_lat_scanout      ;
assign trap_pc_lat_scanin        = npc_b_mux_scanout        ;
assign tid_d_lat_scanin          = trap_pc_lat_scanout      ;
assign pc_e_lat_scanin           = tid_d_lat_scanout        ;
assign scan_out                  = pc_e_lat_scanout         ;

assign iaw_lat_wmr_scanin        = wmr_scan_in              ;
assign wmr_scan_out              = iaw_lat_wmr_scanout      ;
// fixscan end:
endmodule


//
//   buff macro
//
//





module tlu_pct_dp_buff_macro__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule









// any PARAMS parms go into naming of macro

module tlu_pct_dp_msff_macro__stack_48c__width_48 (
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
wire [46:0] so;

  input [47:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [47:0] dout;


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
dff #(48)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[47:0]),
.si({scan_in,so[46:0]}),
.so({so[46:0],scan_out}),
.q(dout[47:0])
);




















endmodule









//  
//   and macro for ports = 2,3,4
//
//





module tlu_pct_dp_and_macro__ports_2__stack_48c__width_46 (
  din0, 
  din1, 
  dout);
  input [45:0] din0;
  input [45:0] din1;
  output [45:0] dout;






and2 #(46)  d0_0 (
.in0(din0[45:0]),
.in1(din1[45:0]),
.out(dout[45:0])
);









endmodule





//
//   buff macro
//
//





module tlu_pct_dp_buff_macro__stack_48c__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule









// any PARAMS parms go into naming of macro

module tlu_pct_dp_msff_macro__mux_aope__ports_5__stack_48c__width_47 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
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
wire psel4;
wire [46:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [45:0] so;

  input [46:0] din0;
  input [46:0] din1;
  input [46:0] din2;
  input [46:0] din3;
  input [46:0] din4;
  input sel0;
  input sel1;
  input sel2;
  input sel3;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [46:0] dout;


  output scan_out;




cl_dp1_penc5_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4)
);

mux5s #(47)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .in0(din0[46:0]),
  .in1(din1[46:0]),
  .in2(din2[46:0]),
  .in3(din3[46:0]),
  .in4(din4[46:0]),
.dout(muxout[46:0])
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
dff #(47)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[46:0]),
.si({scan_in,so[45:0]}),
.so({so[45:0],scan_out}),
.q(dout[46:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module tlu_pct_dp_msff_macro__minbuff_1__stack_48c__width_48 (
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
wire [46:0] so;

  input [47:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [47:0] dout;


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
dff #(48)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[47:0]),
.si({scan_in,so[46:0]}),
.so({so[46:0],scan_out}),
.q(dout[47:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module tlu_pct_dp_msff_macro__mux_aope__ports_7__stack_48c__width_48 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  sel4, 
  sel5, 
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
wire psel4;
wire psel5;
wire psel6;
wire [47:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [46:0] so;

  input [47:0] din0;
  input [47:0] din1;
  input [47:0] din2;
  input [47:0] din3;
  input [47:0] din4;
  input [47:0] din5;
  input [47:0] din6;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input sel5;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [47:0] dout;


  output scan_out;




cl_dp1_penc7_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .sel4(sel4),
 .sel5(sel5),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6)
);

mux7s #(48)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .in0(din0[47:0]),
  .in1(din1[47:0]),
  .in2(din2[47:0]),
  .in3(din3[47:0]),
  .in4(din4[47:0]),
  .in5(din5[47:0]),
  .in6(din6[47:0]),
.dout(muxout[47:0])
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
dff #(48)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[47:0]),
.si({scan_in,so[46:0]}),
.so({so[46:0],scan_out}),
.q(dout[47:0])
);




















endmodule









//
//   buff macro
//
//





module tlu_pct_dp_buff_macro__stack_48c__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






buff #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_pct_dp_mux_macro__dmux_8x__mux_aonpe__ports_4__stack_48c__width_47 (
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

  input [46:0] din0;
  input sel0;
  input [46:0] din1;
  input sel1;
  input [46:0] din2;
  input sel2;
  input [46:0] din3;
  input sel3;
  output [46:0] dout;





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
mux4s #(47)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[46:0]),
  .in1(din1[46:0]),
  .in2(din2[46:0]),
  .in3(din3[46:0]),
.dout(dout[46:0])
);









  



endmodule


//
//   buff macro
//
//





module tlu_pct_dp_buff_macro__stack_48c__width_46 (
  din, 
  dout);
  input [45:0] din;
  output [45:0] dout;






buff #(46)  d0_0 (
.in(din[45:0]),
.out(dout[45:0])
);








endmodule





//
//   increment macro 
//
//





module tlu_pct_dp_increment_macro__width_32 (
  din, 
  cin, 
  dout, 
  cout);
  input [31:0] din;
  input cin;
  output [31:0] dout;
  output cout;






incr #(32)  m0_0 (
.cin(cin),
.in(din[31:0]),
.out(dout[31:0]),
.cout(cout)
);











endmodule





//
//   increment macro 
//
//





module tlu_pct_dp_increment_macro__width_16 (
  din, 
  cin, 
  dout, 
  cout);
  input [15:0] din;
  input cin;
  output [15:0] dout;
  output cout;






incr #(16)  m0_0 (
.cin(cin),
.in(din[15:0]),
.out(dout[15:0]),
.cout(cout)
);











endmodule









// any PARAMS parms go into naming of macro

module tlu_pct_dp_msff_macro__mux_pgpe__ports_2__stack_48c__width_46 (
  din0, 
  din1, 
  sel0, 
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
wire psel0_unused;
wire psel1;
wire [45:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [44:0] so;

  input [45:0] din0;
  input [45:0] din1;
  input sel0;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [45:0] dout;


  output scan_out;




cl_dp1_penc2_8x  c1_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(46)  d1_0 (
  .sel(psel1),
  .in0(din0[45:0]),
  .in1(din1[45:0]),
.dout(muxout[45:0])
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
dff #(46)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[45:0]),
.si({scan_in,so[44:0]}),
.so({so[44:0],scan_out}),
.q(dout[45:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_pct_dp_mux_macro__mux_aonpe__ports_4__stack_48c__width_47 (
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

  input [46:0] din0;
  input sel0;
  input [46:0] din1;
  input sel1;
  input [46:0] din2;
  input sel2;
  input [46:0] din3;
  input sel3;
  output [46:0] dout;





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
mux4s #(47)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[46:0]),
  .in1(din1[46:0]),
  .in2(din2[46:0]),
  .in3(din3[46:0]),
.dout(dout[46:0])
);









  



endmodule


//  
//   and macro for ports = 2,3,4
//
//





module tlu_pct_dp_and_macro__left_30__ports_2__stack_48c__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output [15:0] dout;






and2 #(16)  d0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout[15:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_pct_dp_mux_macro__mux_aonpe__ports_4__stack_48c__width_48 (
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

  input [47:0] din0;
  input sel0;
  input [47:0] din1;
  input sel1;
  input [47:0] din2;
  input sel2;
  input [47:0] din3;
  input sel3;
  output [47:0] dout;





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
mux4s #(48)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[47:0]),
  .in1(din1[47:0]),
  .in2(din2[47:0]),
  .in3(din3[47:0]),
.dout(dout[47:0])
);









  



endmodule


//
//   invert macro
//
//





module tlu_pct_dp_inv_macro__stack_48c__width_5 (
  din, 
  dout);
  input [4:0] din;
  output [4:0] dout;






inv #(5)  d0_0 (
.in(din[4:0]),
.out(dout[4:0])
);









endmodule









// any PARAMS parms go into naming of macro

module tlu_pct_dp_msff_macro__mux_aope__ports_8__stack_48c__width_48 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  sel4, 
  sel5, 
  sel6, 
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
wire psel4;
wire psel5;
wire psel6;
wire psel7;
wire [47:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [46:0] so;

  input [47:0] din0;
  input [47:0] din1;
  input [47:0] din2;
  input [47:0] din3;
  input [47:0] din4;
  input [47:0] din5;
  input [47:0] din6;
  input [47:0] din7;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input sel5;
  input sel6;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [47:0] dout;


  output scan_out;




cl_dp1_penc8_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .sel4(sel4),
 .sel5(sel5),
 .sel6(sel6),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7)
);

mux8s #(48)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[47:0]),
  .in1(din1[47:0]),
  .in2(din2[47:0]),
  .in3(din3[47:0]),
  .in4(din4[47:0]),
  .in5(din5[47:0]),
  .in6(din6[47:0]),
  .in7(din7[47:0]),
.dout(muxout[47:0])
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
dff #(48)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[47:0]),
.si({scan_in,so[46:0]}),
.so({so[46:0],scan_out}),
.q(dout[47:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_pct_dp_mux_macro__left_3__mux_aonpe__ports_4__stack_48c__width_43 (
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

  input [42:0] din0;
  input sel0;
  input [42:0] din1;
  input sel1;
  input [42:0] din2;
  input sel2;
  input [42:0] din3;
  input sel3;
  output [42:0] dout;





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
mux4s #(43)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[42:0]),
  .in1(din1[42:0]),
  .in2(din2[42:0]),
  .in3(din3[42:0]),
.dout(dout[42:0])
);









  



endmodule


//
//   buff macro
//
//





module tlu_pct_dp_buff_macro__left_3__rep_1__stack_48c__width_27 (
  din, 
  dout);
  input [26:0] din;
  output [26:0] dout;






buff #(27)  d0_0 (
.in(din[26:0]),
.out(dout[26:0])
);








endmodule





//
//   nand macro for ports = 2,3,4
//
//





module tlu_pct_dp_nand_macro__ports_2__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






nand2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module tlu_pct_dp_nand_macro__ports_4__width_1 (
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






nand4 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.in3(din3[0:0]),
.out(dout[0:0])
);









endmodule









// any PARAMS parms go into naming of macro

module tlu_pct_dp_msff_macro__left_20__stack_48c__width_10 (
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
wire [8:0] so;

  input [9:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [9:0] dout;


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
dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);




















endmodule









//
//   invert macro
//
//





module tlu_pct_dp_inv_macro__width_1 (
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





module tlu_pct_dp_nand_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nand2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   buff macro
//
//





module tlu_pct_dp_buff_macro__stack_48c__width_4 (
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
//   increment macro 
//
//





module tlu_pct_dp_increment_macro__width_64 (
  din, 
  cin, 
  dout, 
  cout);
  input [63:0] din;
  input cin;
  output [63:0] dout;
  output cout;






incr #(64)  m0_0 (
.cin(cin),
.in(din[63:0]),
.out(dout[63:0]),
.cout(cout)
);











endmodule





//  
//   or macro for ports = 2,3
//
//





module tlu_pct_dp_or_macro__stack_48c__width_1 (
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





//
//   invert macro
//
//





module tlu_pct_dp_inv_macro__width_2 (
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
//   nand macro for ports = 2,3,4
//
//





module tlu_pct_dp_nand_macro__ports_3__width_3 (
  din0, 
  din1, 
  din2, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  input [2:0] din2;
  output [2:0] dout;






nand3 #(3)  d0_0 (
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





module tlu_pct_dp_nand_macro__ports_4__width_3 (
  din0, 
  din1, 
  din2, 
  din3, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  input [2:0] din2;
  input [2:0] din3;
  output [2:0] dout;






nand4 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.in2(din2[2:0]),
.in3(din3[2:0]),
.out(dout[2:0])
);









endmodule





//
//   buff macro
//
//





module tlu_pct_dp_buff_macro__dbuff_48x__width_1 (
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

module tlu_pct_dp_mux_macro__mux_pgpe__ports_4__stack_48c__width_47 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel0, 
  sel1, 
  sel2, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [46:0] din0;
  input [46:0] din1;
  input [46:0] din2;
  input [46:0] din3;
  input sel0;
  input sel1;
  input sel2;
  input muxtst;
  input test;
  output [46:0] dout;





cl_dp1_penc4_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
  .test(test)
);

mux4 #(47)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[46:0]),
  .in1(din1[46:0]),
  .in2(din2[46:0]),
  .in3(din3[46:0]),
.dout(dout[46:0]),
  .muxtst(muxtst)
);









  



endmodule


//
//   buff macro
//
//





module tlu_pct_dp_buff_macro__rep_1__stack_48c__width_46 (
  din, 
  dout);
  input [45:0] din;
  output [45:0] dout;






buff #(46)  d0_0 (
.in(din[45:0]),
.out(dout[45:0])
);








endmodule





//  
//   and macro for ports = 2,3,4
//
//





module tlu_pct_dp_and_macro__left_30__ports_2__stack_48c__width_17 (
  din0, 
  din1, 
  dout);
  input [16:0] din0;
  input [16:0] din1;
  output [16:0] dout;






and2 #(17)  d0_0 (
.in0(din0[16:0]),
.in1(din1[16:0]),
.out(dout[16:0])
);









endmodule









// any PARAMS parms go into naming of macro

module tlu_pct_dp_msff_macro__stack_48c__width_47 (
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
wire [45:0] so;

  input [46:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [46:0] dout;


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
dff #(47)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[46:0]),
.si({scan_in,so[45:0]}),
.so({so[45:0],scan_out}),
.q(dout[46:0])
);




















endmodule









//
//   buff macro
//
//





module tlu_pct_dp_buff_macro__rep_1__stack_48c__width_17 (
  din, 
  dout);
  input [16:0] din;
  output [16:0] dout;






buff #(17)  d0_0 (
.in(din[16:0]),
.out(dout[16:0])
);








endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module tlu_pct_dp_cmp_macro__width_16 (
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
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module tlu_pct_dp_cmp_macro__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output dout;






cmp #(32)  m0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout)
);










endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_pct_dp_mux_macro__mux_aonpe__ports_5__stack_48c__width_47 (
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
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;

  input [46:0] din0;
  input sel0;
  input [46:0] din1;
  input sel1;
  input [46:0] din2;
  input sel2;
  input [46:0] din3;
  input sel3;
  input [46:0] din4;
  input sel4;
  output [46:0] dout;





cl_dp1_muxbuff5_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4)
);
mux5s #(47)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .in0(din0[46:0]),
  .in1(din1[46:0]),
  .in2(din2[46:0]),
  .in3(din3[46:0]),
  .in4(din4[46:0]),
.dout(dout[46:0])
);









  



endmodule


//
//   nand macro for ports = 2,3,4
//
//





module tlu_pct_dp_nand_macro__ports_2__stack_48c__width_47 (
  din0, 
  din1, 
  dout);
  input [46:0] din0;
  input [46:0] din1;
  output [46:0] dout;






nand2 #(47)  d0_0 (
.in0(din0[46:0]),
.in1(din1[46:0]),
.out(dout[46:0])
);









endmodule




