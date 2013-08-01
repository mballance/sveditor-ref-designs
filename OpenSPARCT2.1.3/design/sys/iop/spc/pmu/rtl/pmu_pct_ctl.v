// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pmu_pct_ctl.v
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
module pmu_pct_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  scan_out, 
  lsu_asi_clken, 
  lsu_pmu_pmen, 
  dec_pmu_instr0_type_d, 
  dec_pmu_instr1_type_d, 
  dec_br_taken_e, 
  lsu_pmu_mem_type_b, 
  dec_lsu_sel0_d, 
  mmu_pmu_l2ret, 
  mmu_pmu_l2miss, 
  mmu_pmu_dtlb, 
  mmu_pmu_tid, 
  l15_pmu_xbar_optype, 
  spu_pmu_cwq_busy, 
  spu_pmu_cwq_tid, 
  spu_pmu_ma_busy, 
  tlu_pmu_pstate_priv, 
  tlu_pmu_hpstate_hpriv, 
  tlu_pmu_trap_taken, 
  tlu_pmu_trap_mask_e, 
  tlu_flush_pmu_b, 
  tlu_flush_pmu_w, 
  dec_valid_e, 
  dec_flush_m, 
  dec_flush_b, 
  pdp_pich_cout07, 
  pdp_picl_cout07, 
  pdp_pich_wrap, 
  pdp_picl_wrap, 
  in_rngl_cdbus_ctl_ndata, 
  pdp_asi_ctlin_to_pctl_15_8, 
  pdp_asi_ctlin_to_pctl_4_0, 
  pdp_asi_din_to_pctl, 
  pmu_tlu_trap_m, 
  pmu_tlu_debug_event, 
  pct_pich07_add_w2, 
  pct_picl07_add_w2, 
  pmu_lsu_dcmiss_trap_m, 
  pmu_lsu_dtmiss_trap_m, 
  pmu_lsu_l2dmiss_trap_m, 
  pct_rd_pic, 
  pct_rd_a_pic, 
  pct_rd_pic_pcr, 
  pct_bypass_asi, 
  pct_pcr_data, 
  pct_rngl_cdbus_ctl_ndata, 
  pct_exception, 
  pct_wr_pic_w2, 
  pct_incr_pic_w1, 
  pct_incr_asi_w1, 
  pct_pic_clken, 
  pct_pic07_w2_clken, 
  pmu_asi_clken);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire pwrm_scanin;
wire pwrm_scanout;
wire pmu_pmen;
wire pmu_busy;
wire skip_wakeup_in;
wire pmu_pmen_del_1;
wire pmu_busy_del_1;
wire skip_wakeup;
wire [31:0] pcr7_dout;
wire [31:0] pcr6_dout;
wire [31:0] pcr5_dout;
wire [31:0] pcr4_dout;
wire [31:0] pcr3_dout;
wire [31:0] pcr2_dout;
wire [31:0] pcr1_dout;
wire [31:0] pcr0_dout;
wire wakeup;
wire p_wr;
wire [7:0] atid;
wire [7:0] pic_std_w2;
wire sleep;
wire sleep_cnt_scanin;
wire sleep_cnt_scanout;
wire [3:0] sleep_cntr_din;
wire [3:0] sleep_cntr;
wire wait_for_sleep;
wire l1b;
wire l1clk_pm1;
wire ov_busy;
wire [7:0] wr_pcr;
wire [7:0] rd_pcr;
wire l1clk_pm2;
wire hpstate_scanin;
wire hpstate_scanout;
wire [7:0] hpriv;
wire [7:0] priv;
wire [5:0] mmu_mtyp;
wire events_scanin;
wire events_scanout;
wire rc4;
wire hash;
wire des;
wire crc;
wire aes;
wire [3:0] ma;
wire [12:0] tg0_e;
wire [12:0] tg1_e;
wire [1:0] dec_br_taken_m;
wire [5:0] mm_mtyp;
wire [5:0] mem_typ_w;
wire [6:0] xbar;
wire [2:0] spu_tid;
wire rc4_d1;
wire hash_d1;
wire des_d1;
wire crc_d1;
wire aes_d1;
wire ma_3_d1;
wire dec_lsu_sel0_e;
wire [11:0] tg0_ityp_e;
wire [11:0] tg1_ityp_e;
wire [2:0] lsu_tid_e;
wire lsutid_scanin;
wire lsutid_scanout;
wire [2:0] lsu_tid_m;
wire [2:0] lsu_tid_b;
wire [2:0] lsu_tid_w;
wire all_idle_e;
wire [7:0] th;
wire [7:0] cwq_tid;
wire [7:0] desb;
wire [7:0] aesb;
wire [7:0] rc4b;
wire [7:0] hashb;
wire [7:0] crcb;
wire [7:0] ma_tid;
wire [7:0] mab;
wire [7:0] dcm;
wire [7:0] dtm;
wire [7:0] l2m;
wire [7:0] ov1;
wire [7:0] set_ovh_spec;
wire [7:0] ov0;
wire [7:0] set_ovl_spec;
wire [7:0] ht_in;
wire [29:0] pcr0_din;
wire [7:0] disable_h;
wire [7:0] disable_l;
wire l1clk_pm3;
wire pcr0_scanin;
wire pcr0_scanout;
wire bit63;
wire bit62;
wire [1:0] x0;
wire pcr0_ov_scanin;
wire pcr0_ov_scanout;
wire [29:0] pcr1_din;
wire pcr1_scanin;
wire pcr1_scanout;
wire [1:0] x1;
wire pcr1_ov_scanin;
wire pcr1_ov_scanout;
wire [29:0] pcr2_din;
wire pcr2_scanin;
wire pcr2_scanout;
wire [1:0] x2;
wire pcr2_ov_scanin;
wire pcr2_ov_scanout;
wire [29:0] pcr3_din;
wire pcr3_scanin;
wire pcr3_scanout;
wire [1:0] x3;
wire pcr3_ov_scanin;
wire pcr3_ov_scanout;
wire [29:0] pcr4_din;
wire pcr4_scanin;
wire pcr4_scanout;
wire [1:0] x4;
wire pcr4_ov_scanin;
wire pcr4_ov_scanout;
wire [29:0] pcr5_din;
wire pcr5_scanin;
wire pcr5_scanout;
wire [1:0] x5;
wire pcr5_ov_scanin;
wire pcr5_ov_scanout;
wire [29:0] pcr6_din;
wire pcr6_scanin;
wire pcr6_scanout;
wire [1:0] x6;
wire pcr6_ov_scanin;
wire pcr6_ov_scanout;
wire [29:0] pcr7_din;
wire pcr7_scanin;
wire pcr7_scanout;
wire [1:0] x7;
wire pcr7_ov_scanin;
wire pcr7_ov_scanout;
wire pcr_ov_del_scanin;
wire pcr_ov_del_scanout;
wire [1:0] x7_1;
wire [1:0] x6_1;
wire [1:0] x5_1;
wire [1:0] x4_1;
wire [1:0] x3_1;
wire [1:0] x2_1;
wire [1:0] x1_1;
wire [1:0] x0_1;
wire [7:0] p_cnt_en;
wire [7:0] ph_all_idle;
wire [7:0] ph_ig;
wire [7:0] ph_cg;
wire [7:0] ph_mm;
wire [7:0] ph_xb;
wire [7:0] ph_so;
wire [7:0] ph_sb;
wire [7:0] pl_all_idle;
wire [7:0] pl_ig;
wire [7:0] pl_cg;
wire [7:0] pl_mm;
wire [7:0] pl_xb;
wire [7:0] pl_so;
wire [7:0] pl_sb;
wire [7:0] dcm_h;
wire [7:0] dcm_l;
wire [7:0] pmu_lsu_dcmiss_trap_e;
wire [7:0] pich_wrap;
wire [7:0] picl_wrap;
wire [7:0] t;
wire pmu_lsu_dcm_trap_e;
wire [7:0] dtm_h;
wire [7:0] dtm_l;
wire [7:0] pmu_lsu_dtmiss_trap_e;
wire pmu_lsu_dtm_trap_e;
wire [7:0] l2dm_h;
wire [7:0] l2dm_l;
wire lsu_e2m_scanin;
wire lsu_e2m_scanout;
wire [7:0] l2dm_wrap_e;
wire [7:0] lsu_trap_mask_m_din;
wire [7:0] l2dm_wrap_m;
wire [7:0] lsu_trap_mask_m;
wire [7:0] th_m;
wire [1:0] tlu_pmu_trap_mask_m;
wire [7:0] lsu_tidm_update_m;
wire [1:0] dec_valid_m;
wire [7:0] ph_ai;
wire [7:0] pl_ai;
wire [7:0] ph_ige;
wire [7:0] pl_ige;
wire [7:0] ph_bre;
wire [7:0] pl_bre;
wire [7:0] dcm_he;
wire [7:0] dtm_he;
wire [7:0] l2m_he;
wire [7:0] dcm_le;
wire [7:0] dtm_le;
wire [7:0] l2m_le;
wire [7:0] ph_icge;
wire [7:0] pl_icge;
wire [7:0] mm_tid;
wire [3:0] mm_l2e;
wire [7:0] ph_mme;
wire [7:0] pl_mme;
wire [5:0] xb;
wire use_ma;
wire use_cwq;
wire [2:0] xbtid;
wire [7:0] ph_xbe;
wire [7:0] pl_xbe;
wire [7:0] spu_des;
wire [7:0] spu_aes;
wire [7:0] spu_rc4;
wire [7:0] spu_hash;
wire [7:0] spu_ma;
wire [7:0] spu_crc;
wire [7:0] ph_soe;
wire [7:0] pl_soe;
wire [7:0] ph_sbe;
wire [7:0] pl_sbe;
wire [7:0] ovh;
wire [7:0] ovl;
wire [7:0] pipeh_incr_e;
wire [7:0] pipel_incr_e;
wire [7:0] pipeh_incr_m;
wire [7:0] ph_brm;
wire [7:0] pipel_incr_m;
wire [7:0] pl_brm;
wire [7:0] pipeh_incr_w;
wire [7:0] pipel_incr_w;
wire [7:0] pipeh_async;
wire [7:0] pipel_async;
wire tp_scanin;
wire tp_scanout;
wire [7:0] trap_e;
wire [7:0] trap_b_in;
wire [7:0] trap_w_in;
wire [7:0] trap_w1_in;
wire [7:0] tpt;
wire [7:0] trap_m;
wire [7:0] trap_b;
wire [7:0] trap_w;
wire [7:0] trap_w1;
wire tp1_scanin;
wire tp1_scanout;
wire [7:0] trap_hold_in;
wire [7:0] trap_hold;
wire br_scanin;
wire br_scanout;
wire [7:0] ph_br_may_trap_m;
wire [1:0] ifu_fl_b;
wire [1:0] fl_w;
wire [7:0] trap_w1_final;
wire [1:0] tlu_fl_w1;
wire [7:0] async;
wire ti_e2m_scanin;
wire ti_e2m_scanout;
wire [7:0] ph_incr_m;
wire [7:0] pl_incr_m;
wire [7:0] ph_i_m;
wire [7:0] pl_i_m;
wire ti_m2b_scanin;
wire ti_m2b_scanout;
wire [7:0] ph_incr_b;
wire [7:0] pl_incr_b;
wire [7:0] ph_i_b;
wire [7:0] pl_i_b;
wire ti_b2w_scanin;
wire ti_b2w_scanout;
wire [7:0] ph_incr_w;
wire [7:0] pl_incr_w;
wire [7:0] ph_i_w;
wire [7:0] pl_i_w;
wire ti_w2w1_scanin;
wire ti_w2w1_scanout;
wire [7:0] ph_incr_w1;
wire [7:0] pl_incr_w1;
wire [7:0] flush_h;
wire [7:0] flush_l;
wire [7:0] ph_final_incr_w1;
wire [7:0] pl_final_incr_w1;
wire [7:0] pic_std_w1;
wire [7:0] pic_st_dout;
wire [7:0] pic_st_din;
wire pic_st_scanin;
wire pic_st_scanout;
wire [3:0] t0h_din;
wire [3:0] t0h_dout;
wire t0h_scanin;
wire t0h_scanout;
wire [3:0] t1h_din;
wire [3:0] t1h_dout;
wire t1h_scanin;
wire t1h_scanout;
wire [3:0] t2h_din;
wire [3:0] t2h_dout;
wire t2h_scanin;
wire t2h_scanout;
wire [3:0] t3h_din;
wire [3:0] t3h_dout;
wire t3h_scanin;
wire t3h_scanout;
wire [3:0] t4h_din;
wire [3:0] t4h_dout;
wire t4h_scanin;
wire t4h_scanout;
wire [3:0] t5h_din;
wire [3:0] t5h_dout;
wire t5h_scanin;
wire t5h_scanout;
wire [3:0] t6h_din;
wire [3:0] t6h_dout;
wire t6h_scanin;
wire t6h_scanout;
wire [3:0] t7h_din;
wire [3:0] t7h_dout;
wire t7h_scanin;
wire t7h_scanout;
wire [3:0] t0l_din;
wire [3:0] t0l_dout;
wire t0l_scanin;
wire t0l_scanout;
wire [3:0] t1l_din;
wire [3:0] t1l_dout;
wire t1l_scanin;
wire t1l_scanout;
wire [3:0] t2l_din;
wire [3:0] t2l_dout;
wire t2l_scanin;
wire t2l_scanout;
wire [3:0] t3l_din;
wire [3:0] t3l_dout;
wire t3l_scanin;
wire t3l_scanout;
wire [3:0] t4l_din;
wire [3:0] t4l_dout;
wire t4l_scanin;
wire t4l_scanout;
wire [3:0] t5l_din;
wire [3:0] t5l_dout;
wire t5l_scanin;
wire t5l_scanout;
wire [3:0] t6l_din;
wire [3:0] t6l_dout;
wire t6l_scanin;
wire t6l_scanout;
wire [3:0] t7l_din;
wire [3:0] t7l_dout;
wire t7l_scanin;
wire t7l_scanout;
wire [3:0] pich07_add_in_w1;
wire [7:0] incr_asi;
wire [3:0] picl07_add_in_w1;
wire accum_scanin;
wire accum_scanout;
wire [15:8] asi_cntrl_h;
wire [4:0] asi_cntrl;
wire asr;
wire asr_rd;
wire asi_ctl_ndata;
wire asr_wr;
wire pcr;
wire pic;
wire pic_rd;
wire pic_wr;
wire pcr_rd;
wire pcr_wr;
wire [7:0] tid;
wire [7:0] asr_priv;
wire priv_ex;
wire pmu_op;
wire l1clk_pm4;
wire asi_scanin;
wire asi_scanout;
wire p_rd;
wire pc_rd;
wire pc_wr;
wire [31:0] pcr0_read;
wire [31:0] pcr1_read;
wire [31:0] pcr2_read;
wire [31:0] pcr3_read;
wire [31:0] pcr4_read;
wire [31:0] pcr5_read;
wire [31:0] pcr6_read;
wire [31:0] pcr7_read;
wire spares_scanin;
wire spares_scanout;


// *** globals ***
input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input 		spc_aclk;
input 		spc_bclk;
input		tcu_scan_en;
output		scan_out;

// Power management for ASI ring...
input		lsu_asi_clken;
input		lsu_pmu_pmen;

// Instruction decode events
// if idle, then there is no pick, or other activity... valid would be off.
//input   [2:0]   lsu_pmu_tid_b;          // tid used by real lsu; for DC and DT misses
input	[12:0]	dec_pmu_instr0_type_d;	// {12 - valid; 11:10 - tid; 9:0 - {atomic_d, l2imiss, itmiss, icmiss, other, %sethi, store, load, FGU, branch}}
input	[12:0]	dec_pmu_instr1_type_d;
input	[1:0]	dec_br_taken_e;		// branch taken indicator
input	[5:0]	lsu_pmu_mem_type_b;	// {5:3 - tid (use for l2miss only); 2:0 - {l2 d-miss, dt_miss, d-cache miss}}
input		dec_lsu_sel0_d;		// select tg0 for lsu tid

// MMU activity (excluding ITLB/DTLB misses)
input 	        mmu_pmu_l2ret;          // indicates l2 data to MMU
input           mmu_pmu_l2miss;         // indicates the return pkt had l2 miss
input           mmu_pmu_dtlb;           // indicates that return pkt is for D-side table walk
input   [2:0]   mmu_pmu_tid;   		// thread id
//input	[5:0]	mmu_mtyp;		// {5 - valid; 4:2 - tid; 1 - D/~I; 0 - L2 hit/miss}

// Crossbar activity
//input	[9:0]	lsu_pmu_xbar_optype;	// {9 - valid; 8:6 - tid; 5:0 - {mmuld, cpustore, ifetch, cpuld, ststore, stload}}
input	[6:0]	l15_pmu_xbar_optype;	// {6 - valid; 5:3 - tid; 2:0 - {111 - mastore; 110 - maload; 101 - ifetch; 100 - mmuld; 011 - cwqstore; 010 - cwqload; 001 - cpustore; 000 - cpuld}}

// SPU activity
input	[4:0]	spu_pmu_cwq_busy;	// CWQ busy {rc4,hash,des,crc,aes}
input	[2:0]	spu_pmu_cwq_tid;
input	[3:0]	spu_pmu_ma_busy;

// state bits to decide when counters should record
input	[7:0] 	tlu_pmu_pstate_priv;	// pstate.priv for each thread (bit 7 == thread 7)
input	[7:0]	tlu_pmu_hpstate_hpriv;	// hpstate.hpriv (ditto)

// PMU trap is taken, reset the counter if "-"ve.
input   [7:0]   tlu_pmu_trap_taken;
input	[1:0]	tlu_pmu_trap_mask_e;	// True if TLU enabled for PMU trap {1 - tg1; 0 - tg0}

// Flush requests from TLU and IFU - bit 1 is for TG1, bit 0 for TG0
input	[1:0]	tlu_flush_pmu_b;	// kill what is in B now
input	[1:0]	tlu_flush_pmu_w;	// kill what is in W now

input   [1:0]	dec_valid_e;		// bit 1 is for TG1, 0 for TG0; instr valids in the e-stage

input	[1:0]	dec_flush_m;	// kill what is in M now
input	[1:0]	dec_flush_b;	// kill what is in B now

// Carry-out bits of incrementors to set OV bits in PCRs, valid in cycle W+1
input		pdp_pich_cout07;	
input		pdp_picl_cout07;		

// Near-overflow values (-16..-1) for each counter
input	[7:0]	pdp_pich_wrap;
input	[7:0]	pdp_picl_wrap;

// ASI read/write inputs
input		in_rngl_cdbus_ctl_ndata;// Bit 64 of input bus, register here
input	[7:0]   pdp_asi_ctlin_to_pctl_15_8;  // Bits 63:56 of registered data from PDP (save 8 flop bits)
input	[4:0]   pdp_asi_ctlin_to_pctl_4_0;   // Bits 52:48 of registered data from PDP (save 5 flop bits)
input	[31:0]	pdp_asi_din_to_pctl;	// control block needs lower 32 bits too for PCR data...

// Signals to tell TLU if we may/should trap due to counter overflow
output	[7:0]	pmu_tlu_trap_m;		// Sent at (near) beginning of M to TLU
output	[7:0]	pmu_tlu_debug_event;	// Tell trap if a perf. monitor event occurred to soft/hard stop/trigger on

// Event outputs
output	[3:0]	pct_pich07_add_w2;	// Add value for pich
output	[3:0]	pct_picl07_add_w2;	// Add value for picl

// Signals to LSU for trap on DCmiss, DTmiss, L2Dmiss
//input	[2:0]	dec_lsu_tid_e;		// TID of LSU instruction in E stage
output		pmu_lsu_dcmiss_trap_m;
output		pmu_lsu_dtmiss_trap_m;
output	[7:0]	pmu_lsu_l2dmiss_trap_m;

// ASI read controls
output   [7:0]	pct_rd_pic;		// ASI read of PIC (bit 7 == read PIC for tid 7)
output		pct_rd_a_pic;		// ASI read of any PIC
output		pct_rd_pic_pcr;         // ASI read of PIC or PCR (select PIC or PCR)
output		pct_bypass_asi;		// Flow this node's ASI data to the output
output	[31:0]	pct_pcr_data;		// PCR data on ASI read
output 		pct_rngl_cdbus_ctl_ndata; // Piped value of uppermost ASI ring ctl/data bus output
output		pct_exception;		// True if a privileged exception on ASR read or write to PIC or PCR

// ASI write controls
output	[7:0]	pct_wr_pic_w2;		// Write corresponding PICH/L from ASI (bit 7 == write PIC7)
output	[6:0]	pct_incr_pic_w1;	// increment PIC (PICL is enabled for counting) W+1 cycle, prior to adding in W+2
output		pct_incr_asi_w1;	// Select new ASI value to increment to deal with simultaneous ASI write and increment

// Clock gates to PICs in DP
output	[7:0]	pct_pic_clken;		// Only enable when pic configured to count
output		pct_pic07_w2_clken;	// Enable for pic_07 flop for ASI/PIC's selected to be added
 
// Pwr management for ASI ring in DP
output		pmu_asi_clken;
////////////////////////////////////////////////////////////////////////////////

// scan renames
assign pce_ov = tcu_pce_ov;
//assign stop = tcu_clk_stop;
assign stop = 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;
assign se	= tcu_scan_en;
// end scan

pmu_pct_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk          	),
        .l1en   (1'b1			),
        .l1clk  (l1clk			),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

// Flop ASI clken
pmu_pct_ctl_msff_ctl_macro__width_5 pwrm  (
	.scan_in(pwrm_scanin),
	.scan_out(pwrm_scanout),
	.l1clk	(l1clk),
	.din	({lsu_pmu_pmen, pmu_pmen, lsu_asi_clken, pmu_busy, skip_wakeup_in}),
	.dout	({pmu_pmen, pmu_pmen_del_1, pmu_asi_clken, pmu_busy_del_1, skip_wakeup}),
  .siclk(siclk),
  .soclk(soclk)
);

// Generally busy if any PCR is enabled to count in at least one mode
assign pmu_busy = (|pcr7_dout[3:1]) | (|pcr6_dout[3:1]) | (|pcr5_dout[3:1]) | (|pcr4_dout[3:1]) | 
                  (|pcr3_dout[3:1]) | (|pcr2_dout[3:1]) | (|pcr1_dout[3:1]) | (|pcr0_dout[3:1]);

// exposed a bug. The PMU was being power-managed, and when the last clock fired, counter 0
// was scheduled to be updated (in W2). However, while the PMU was powered-down, PIC0 was written to. Then,
// PCR0 was written to, waking up the PMU. Since PIC0 was being updated in W2 (from the stale PIC value in 
// pic07_w2 flop), it proceeded to overwrite the newly-written PIC value. To fix this the following was done.

// We record the fact that the PIC which will be updated upon wakeup has been
// written to in the interim, so the value in the W+2 add stage is incorrect. We then prevent the update 
// in that case, using the skip_wakeup flop.

assign skip_wakeup_in = ~wakeup & (skip_wakeup | 
                                   (~pmu_busy & pmu_pmen & (|({8 {p_wr}} & atid[7:0] & pic_std_w2[7:0])))
                                  );

assign wakeup = pmu_busy & ~pmu_busy_del_1;

// Sleep when: a) are power managed and pmu goes not busy, or b) pmu is not busy and we become power managed
assign sleep = (~pmu_busy & pmu_busy_del_1 & pmu_pmen) | (pmu_pmen & ~pmu_pmen_del_1 & ~pmu_busy);

// If events flop was stopped due to power management, then there is junk in it...we let the pipe drain
// to prevent spurious events on startup
// When sleep starts, let pipe drain...run for 13 cycles (== time from E->W2 + 7 cycles to account for 
// last possible update of a PIC due to the rotating counter. But we can subtract 1 since the counter is
// loaded 1 cycle after sleep.
pmu_pct_ctl_msff_ctl_macro__width_4 sleep_cnt  (
	.scan_in(sleep_cnt_scanin),
	.scan_out(sleep_cnt_scanout),
	.l1clk	(l1clk),
	.din	(sleep_cntr_din[3:0]),
	.dout	(sleep_cntr[3:0]),
  .siclk(siclk),
  .soclk(soclk) 
);

assign wait_for_sleep = |sleep_cntr[3:0];

assign sleep_cntr_din[3:0] = ({4 {sleep}} & 4'b1100) |
                             ({4 {~sleep & wait_for_sleep}} & (sleep_cntr[3:0] - 4'b0001));

// l1clk_pm1 = pmu_busy_l1clk...

assign l1b = pmu_busy | sleep | wait_for_sleep | ~pmu_pmen;

pmu_pct_ctl_l1clkhdr_ctl_macro pmu_busy_clkgen (
        .l2clk  (l2clk          	),
        .l1en   (l1b	),
        .l1clk  (l1clk_pm1		),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

// power manage OV bits; enable during ASI write to PCR, or when any flop is recording
assign ov_busy = |wr_pcr[7:0] | (|rd_pcr[7:0]) | pmu_busy | sleep | wait_for_sleep;

pmu_pct_ctl_l1clkhdr_ctl_macro ov_busy_clkgen (
        .l2clk  (l2clk          	),
        .l1en   (ov_busy | ~pmu_pmen	),
//        .l1clk  (ov_busy_l1clk		)
        .l1clk  (l1clk_pm2		),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

// register state input bits
// these bits are used to 1) check for priv exceptions due to read/writes of pic or pcr, as well as qualifying counting events
// simplest thing is to keep running all the time (was l1clk_pm1 but 
// this broke priv exception check since asi ring busy not included (bug 86773))
// attempt to use pmu_busy | asi_clken (PMU is not first on ASI ring)
// Change to keep busy all the time...not ideal, but need this clock to save pwr for pcr's
//l1clkhdr_ctl_macro priv_busy_clkgen (
//        .l2clk  (l2clk          	),
//        .l1en   (pmu_busy | pmu_asi_clken | ~pmu_pmen	),
//        .l1clk  (priv_busy_l1clk		)
//        .l1clk  (l1clk_pm3		)
//);

pmu_pct_ctl_msff_ctl_macro__width_16 hpstate  (
//	.l1clk	(priv_busy_l1clk),
	.scan_in(hpstate_scanin),
	.scan_out(hpstate_scanout),
	.l1clk	(l1clk),
	.din	({tlu_pmu_hpstate_hpriv[7:0], tlu_pmu_pstate_priv[7:0]}),
	.dout	({hpriv[7:0], priv[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// register event inputs
// Make sure only one of the CWQ events is active at a time...
// 0in bits_on -var (spu_pmu_cwq_busy[4:0]) -message "spu_pmu_cwq_busy[4:0] not mutex"

assign mmu_mtyp[5:0] = {mmu_pmu_l2ret, mmu_pmu_tid[2:0], mmu_pmu_dtlb, mmu_pmu_l2miss};

// delay rc4, hash, des, crc, aes, ma_busy 1 clock to avoid timing problem  - edge-detect 
// from flopped version - costs 6 flops
pmu_pct_ctl_msff_ctl_macro__width_66 events  (
	.scan_in(events_scanin),
	.scan_out(events_scanout),
	.l1clk	(l1clk_pm1),
	.din	({dec_pmu_instr0_type_d[12:0], dec_pmu_instr1_type_d[12:0], 
                  dec_br_taken_e[1:0], mmu_mtyp[5:0],
                  lsu_pmu_mem_type_b[5:0], l15_pmu_xbar_optype[6:0], spu_pmu_cwq_busy[4:0],
                  spu_pmu_cwq_tid[2:0], spu_pmu_ma_busy[3:0], rc4, hash, des, crc, aes, ma[3], dec_lsu_sel0_d}),
	.dout	({tg0_e[12:0], tg1_e[12:0], 
                  dec_br_taken_m[1:0], mm_mtyp[5:0],
                  mem_typ_w[5:0], xbar[6:0], rc4, hash, des, crc, aes, 
                  spu_tid[2:0], ma[3:0], rc4_d1, hash_d1, des_d1, crc_d1, aes_d1, ma_3_d1, dec_lsu_sel0_e}),
  .siclk(siclk),
  .soclk(soclk)
);

assign tg0_ityp_e[11:0] = {12 {tg0_e[12]}} & tg0_e[11:0];
assign tg1_ityp_e[11:0] = {12 {tg1_e[12]}} & tg1_e[11:0];

// Use dec signal for below
assign lsu_tid_e[2:0] = {~dec_lsu_sel0_e, ({2 { dec_lsu_sel0_e}} & tg0_ityp_e[11:10]) |
                                          ({2 {~dec_lsu_sel0_e}} & tg1_ityp_e[11:10]) };

pmu_pct_ctl_msff_ctl_macro__width_9 lsutid  (
	.scan_in(lsutid_scanin),
	.scan_out(lsutid_scanout),
	.l1clk	(l1clk_pm1),
	.din	({lsu_tid_e[2:0], lsu_tid_m[2:0], lsu_tid_b[2:0]}),
	.dout	({lsu_tid_m[2:0], lsu_tid_b[2:0], lsu_tid_w[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// Decode the events

assign all_idle_e = ~tg0_e[12] & ~tg1_e[12];

// What thread is instruction event for
//             11:10 - tid;            
assign th[0] = ~tg0_ityp_e[11] & ~tg0_ityp_e[10];
assign th[1] = ~tg0_ityp_e[11] &  tg0_ityp_e[10];
assign th[2] =  tg0_ityp_e[11] & ~tg0_ityp_e[10];
assign th[3] =  tg0_ityp_e[11] &  tg0_ityp_e[10];
assign th[4] = ~tg1_ityp_e[11] & ~tg1_ityp_e[10];
assign th[5] = ~tg1_ityp_e[11] &  tg1_ityp_e[10];
assign th[6] =  tg1_ityp_e[11] & ~tg1_ityp_e[10];
assign th[7] =  tg1_ityp_e[11] &  tg1_ityp_e[10];

// DES/3DES busy event
// 3 - busy/idle; 2:0 - tid;
assign cwq_tid[0] = ~spu_tid[2] & ~spu_tid[1] & ~spu_tid[0];
assign cwq_tid[1] = ~spu_tid[2] & ~spu_tid[1] &  spu_tid[0];
assign cwq_tid[2] = ~spu_tid[2] &  spu_tid[1] & ~spu_tid[0];
assign cwq_tid[3] = ~spu_tid[2] &  spu_tid[1] &  spu_tid[0];
assign cwq_tid[4] =  spu_tid[2] & ~spu_tid[1] & ~spu_tid[0];
assign cwq_tid[5] =  spu_tid[2] & ~spu_tid[1] &  spu_tid[0];
assign cwq_tid[6] =  spu_tid[2] &  spu_tid[1] & ~spu_tid[0];
assign cwq_tid[7] =  spu_tid[2] &  spu_tid[1] &  spu_tid[0];

assign desb[7:0] = {8 {des}} & cwq_tid[7:0];

// AES busy event
assign aesb[7:0] = {8 {aes}} & cwq_tid[7:0];

// RC4 busy event
assign rc4b[7:0] = {8 {rc4}} & cwq_tid[7:0];

// SHA-1/SHA-256/MD5 busy event
assign hashb[7:0] = {8 {hash}} & cwq_tid[7:0];

// CRC busy event
assign crcb[7:0] = {8 {crc}} & cwq_tid[7:0];

// MA busy event
assign ma_tid[0] = ~ma[2] & ~ma[1] & ~ma[0];
assign ma_tid[1] = ~ma[2] & ~ma[1] &  ma[0];
assign ma_tid[2] = ~ma[2] &  ma[1] & ~ma[0];
assign ma_tid[3] = ~ma[2] &  ma[1] &  ma[0];
assign ma_tid[4] =  ma[2] & ~ma[1] & ~ma[0];
assign ma_tid[5] =  ma[2] & ~ma[1] &  ma[0];
assign ma_tid[6] =  ma[2] &  ma[1] & ~ma[0];
assign ma_tid[7] =  ma[2] &  ma[1] &  ma[0];

assign mab[7:0] = {8 {ma[3]}} & ma_tid[7:0];

// register spu_ops to detect edges
// Fundamentally, only need to detect edges on ma[3], des, aes, rc4, crc, hash individually except
// iff the TID can change from one cycle to the next any busy bit stays high...
// CWQ can't do this - put in assertions to make sure
// MA can't do this by design
// 0in assert -var ~(|(spu_pmu_cwq_busy[4:0] & {rc4,hash,des,crc,aes}) & (spu_pmu_cwq_tid[2:0] != spu_tid[2:0]) & l1clk_pm1) -message "spu_pmu_cwq_busy[4:0] busy but spu_pmu_cwq_tid[2:0] changes"

// dcmiss, dtmiss, l2miss from lsu in previous cycle
assign dcm[0] = ~lsu_tid_w[2] & ~lsu_tid_w[1] & ~lsu_tid_w[0] & mem_typ_w[0];
assign dcm[1] = ~lsu_tid_w[2] & ~lsu_tid_w[1] &  lsu_tid_w[0] & mem_typ_w[0];
assign dcm[2] = ~lsu_tid_w[2] &  lsu_tid_w[1] & ~lsu_tid_w[0] & mem_typ_w[0];
assign dcm[3] = ~lsu_tid_w[2] &  lsu_tid_w[1] &  lsu_tid_w[0] & mem_typ_w[0];
assign dcm[4] =  lsu_tid_w[2] & ~lsu_tid_w[1] & ~lsu_tid_w[0] & mem_typ_w[0];
assign dcm[5] =  lsu_tid_w[2] & ~lsu_tid_w[1] &  lsu_tid_w[0] & mem_typ_w[0];
assign dcm[6] =  lsu_tid_w[2] &  lsu_tid_w[1] & ~lsu_tid_w[0] & mem_typ_w[0];
assign dcm[7] =  lsu_tid_w[2] &  lsu_tid_w[1] &  lsu_tid_w[0] & mem_typ_w[0];

assign dtm[0] = ~lsu_tid_w[2] & ~lsu_tid_w[1] & ~lsu_tid_w[0] & mem_typ_w[1];
assign dtm[1] = ~lsu_tid_w[2] & ~lsu_tid_w[1] &  lsu_tid_w[0] & mem_typ_w[1];
assign dtm[2] = ~lsu_tid_w[2] &  lsu_tid_w[1] & ~lsu_tid_w[0] & mem_typ_w[1];
assign dtm[3] = ~lsu_tid_w[2] &  lsu_tid_w[1] &  lsu_tid_w[0] & mem_typ_w[1];
assign dtm[4] =  lsu_tid_w[2] & ~lsu_tid_w[1] & ~lsu_tid_w[0] & mem_typ_w[1];
assign dtm[5] =  lsu_tid_w[2] & ~lsu_tid_w[1] &  lsu_tid_w[0] & mem_typ_w[1];
assign dtm[6] =  lsu_tid_w[2] &  lsu_tid_w[1] & ~lsu_tid_w[0] & mem_typ_w[1];
assign dtm[7] =  lsu_tid_w[2] &  lsu_tid_w[1] &  lsu_tid_w[0] & mem_typ_w[1];

//              5:3 - tid;	    2:0 - {l2 d-miss, dt_miss, d-cache miss}
assign l2m[0] = ~mem_typ_w[5] & ~mem_typ_w[4] & ~mem_typ_w[3] & mem_typ_w[2];
assign l2m[1] = ~mem_typ_w[5] & ~mem_typ_w[4] &  mem_typ_w[3] & mem_typ_w[2];
assign l2m[2] = ~mem_typ_w[5] &  mem_typ_w[4] & ~mem_typ_w[3] & mem_typ_w[2];
assign l2m[3] = ~mem_typ_w[5] &  mem_typ_w[4] &  mem_typ_w[3] & mem_typ_w[2];
assign l2m[4] =  mem_typ_w[5] & ~mem_typ_w[4] & ~mem_typ_w[3] & mem_typ_w[2];
assign l2m[5] =  mem_typ_w[5] & ~mem_typ_w[4] &  mem_typ_w[3] & mem_typ_w[2];
assign l2m[6] =  mem_typ_w[5] &  mem_typ_w[4] & ~mem_typ_w[3] & mem_typ_w[2];
assign l2m[7] =  mem_typ_w[5] &  mem_typ_w[4] &  mem_typ_w[3] & mem_typ_w[2];

// NEED to HANDLE the potential of a Dmiss and a L2Dmiss at the same time

// PCR's for each thread
// PCR format is:
// 31    - OV1
// 30:27 - SL1
// 26:19 - Mask1
// 18    - OV0
// 17:14 - SL0
// 13:6  - Mask0
// 5:4   - TOE
// 3     - HT
// 2     - UT
// 1     - ST
// 0     - Priv 

// where each SL field decoding is:
// 0 - all idle (async)
// 1 - unused
// 2 - instruction group (sync)
// 3 - cache/tlb group (sync)
// 4 - unused
// 5 - xbar group (async)
// 6 - spu ops (async) -- ops derived from spu busy
// 7 - spu busy (async)

// generate OV bits for all PCR's
assign ov1[7:0] = {8 {pdp_pich_cout07}} & {pic_std_w2[7:0]} | set_ovh_spec[7:0];
assign ov0[7:0] = {8 {pdp_picl_cout07}} & {pic_std_w2[7:0]} | set_ovl_spec[7:0];

// generate clk enables for all PICs; keep it simple for now (enable only when a PIC is configured to count)
assign pct_pic_clken[7:0] = pct_wr_pic_w2[7:0] | (pic_std_w2[7:0] & ~{8 {skip_wakeup}} &
                            {|pcr7_dout[3:1],|pcr6_dout[3:1],|pcr5_dout[3:1],|pcr4_dout[3:1],
                             |pcr3_dout[3:1],|pcr2_dout[3:1],|pcr1_dout[3:1],|pcr0_dout[3:1]});

// writing to a PCR kills any pending OV updates

// PCR0

// In case of not writing to a PCR, keep the OV state.
// qualify the pcr0_din with ov1[0]; 
// Except! reset OV bits when PCR read...bug!

// Don't write to HT unless in hyperpriv mode...
assign ht_in[7:0] = ( hpriv[7:0] & {8 {pdp_asi_din_to_pctl[3]}}) |
                    (~hpriv[7:0] & {pcr7_dout[3], pcr6_dout[3], pcr5_dout[3], pcr4_dout[3],
                                    pcr3_dout[3], pcr2_dout[3], pcr1_dout[3], pcr0_dout[3]});

assign pcr0_din[29:0] = ({30 { wr_pcr[0]}} & {pdp_asi_din_to_pctl[30:19],pdp_asi_din_to_pctl[17:4],ht_in[0],pdp_asi_din_to_pctl[2:0]}) |
                        ({30 {~wr_pcr[0]}} & {disable_h[0],pcr0_dout[29:19],disable_l[0],pcr0_dout[16:0]});

// Now use one header to control write clocks for all pcr's - still need mux for individual flops
pmu_pct_ctl_l1clkhdr_ctl_macro wr_pcr_clkgen (
        .l2clk  (l2clk          ),
        .l1en   (|wr_pcr[7:0] 	),
        .l1clk  (l1clk_pm3	),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

pmu_pct_ctl_msff_ctl_macro__width_30 pcr0  (
	.scan_in(pcr0_scanin),
	.scan_out(pcr0_scanout),
	.l1clk	(l1clk_pm3),
	.din	(pcr0_din[29:0]),
	.dout	({disable_h[0],pcr0_dout[29:19],disable_l[0],pcr0_dout[16:0]}),
  .siclk(siclk),
  .soclk(soclk)
);
assign pcr0_dout[30] = 1'b0;
assign pcr0_dout[17] = 1'b0;

// For selective write to OV:
// Write OV0 iff bit 62 not set - use negative active to keep compatibility with pre-existing DV tests
// Write OV1 iff bit 63 not set - use negative active to keep compatibility with pre-existing DV tests

assign bit63 = pdp_asi_ctlin_to_pctl_15_8[7]; // bit 63 of ring data cycle
assign bit62 = pdp_asi_ctlin_to_pctl_15_8[6]; // bit 62 of ring data cycle

assign x0[1:0] = ( ({2 {wr_pcr[0]}} & {~bit63,~bit62}) & {pdp_asi_din_to_pctl[31], pdp_asi_din_to_pctl[18]}) |
                 (~({2 {wr_pcr[0]}} & {~bit63,~bit62}) & {(ov1[0] | pcr0_dout[31]), (ov0[0] | pcr0_dout[18])});

pmu_pct_ctl_msff_ctl_macro__width_2 pcr0_ov  (
	.scan_in(pcr0_ov_scanin),
	.scan_out(pcr0_ov_scanout),
	.l1clk	(l1clk_pm2),
	.din	(x0[1:0]),
	.dout	({pcr0_dout[31],pcr0_dout[18]}),
  .siclk(siclk),
  .soclk(soclk)
);

// PCR1
assign pcr1_din[29:0] = ({30 { wr_pcr[1]}} & {pdp_asi_din_to_pctl[30:19],pdp_asi_din_to_pctl[17:4],ht_in[1],pdp_asi_din_to_pctl[2:0]}) |
                        ({30 {~wr_pcr[1]}} & {disable_h[1],pcr1_dout[29:19],disable_l[1],pcr1_dout[16:0]});

pmu_pct_ctl_msff_ctl_macro__width_30 pcr1  (
	.scan_in(pcr1_scanin),
	.scan_out(pcr1_scanout),
	.l1clk	(l1clk_pm3),
	.din	(pcr1_din[29:0]),
	.dout	({disable_h[1],pcr1_dout[29:19],disable_l[1],pcr1_dout[16:0]}),
  .siclk(siclk),
  .soclk(soclk)
);
assign pcr1_dout[30] = 1'b0;
assign pcr1_dout[17] = 1'b0;

assign x1[1:0] = ( ({2 {wr_pcr[1]}} & {~bit63,~bit62}) & {pdp_asi_din_to_pctl[31], pdp_asi_din_to_pctl[18]}) |
                 (~({2 {wr_pcr[1]}} & {~bit63,~bit62}) & {(ov1[1] | pcr1_dout[31]), (ov0[1] | pcr1_dout[18])});

pmu_pct_ctl_msff_ctl_macro__width_2 pcr1_ov  (
	.scan_in(pcr1_ov_scanin),
	.scan_out(pcr1_ov_scanout),
	.l1clk	(l1clk_pm2),
	.din	(x1[1:0]),
	.dout	({pcr1_dout[31],pcr1_dout[18]}),
  .siclk(siclk),
  .soclk(soclk)
);

// PCR2
assign pcr2_din[29:0] = ({30 { wr_pcr[2]}} & {pdp_asi_din_to_pctl[30:19],pdp_asi_din_to_pctl[17:4],ht_in[2],pdp_asi_din_to_pctl[2:0]}) |
                        ({30 {~wr_pcr[2]}} & {disable_h[2],pcr2_dout[29:19],disable_l[2],pcr2_dout[16:0]});

pmu_pct_ctl_msff_ctl_macro__width_30 pcr2  (
	.scan_in(pcr2_scanin),
	.scan_out(pcr2_scanout),
	.l1clk	(l1clk_pm3),
	.din	(pcr2_din[29:0]),
	.dout	({disable_h[2],pcr2_dout[29:19],disable_l[2],pcr2_dout[16:0]}),
  .siclk(siclk),
  .soclk(soclk)
);
assign pcr2_dout[30] = 1'b0;
assign pcr2_dout[17] = 1'b0;

assign x2[1:0] = ( ({2 {wr_pcr[2]}} & {~bit63,~bit62}) & {pdp_asi_din_to_pctl[31], pdp_asi_din_to_pctl[18]}) |
                 (~({2 {wr_pcr[2]}} & {~bit63,~bit62}) & {(ov1[2] | pcr2_dout[31]), (ov0[2] | pcr2_dout[18])});

pmu_pct_ctl_msff_ctl_macro__width_2 pcr2_ov  (
	.scan_in(pcr2_ov_scanin),
	.scan_out(pcr2_ov_scanout),
	.l1clk	(l1clk_pm2),
	.din	(x2[1:0]),
	.dout	({pcr2_dout[31],pcr2_dout[18]}),
  .siclk(siclk),
  .soclk(soclk)
);

// PCR3
assign pcr3_din[29:0] = ({30 { wr_pcr[3]}} & {pdp_asi_din_to_pctl[30:19],pdp_asi_din_to_pctl[17:4],ht_in[3],pdp_asi_din_to_pctl[2:0]}) |
                        ({30 {~wr_pcr[3]}} & {disable_h[3],pcr3_dout[29:19],disable_l[3],pcr3_dout[16:0]});

pmu_pct_ctl_msff_ctl_macro__width_30 pcr3  (
	.scan_in(pcr3_scanin),
	.scan_out(pcr3_scanout),
	.l1clk	(l1clk_pm3),
	.din	(pcr3_din[29:0]),
	.dout	({disable_h[3],pcr3_dout[29:19],disable_l[3],pcr3_dout[16:0]}),
  .siclk(siclk),
  .soclk(soclk)
);
assign pcr3_dout[30] = 1'b0;
assign pcr3_dout[17] = 1'b0;

assign x3[1:0] = ( ({2 {wr_pcr[3]}} & {~bit63,~bit62}) & {pdp_asi_din_to_pctl[31], pdp_asi_din_to_pctl[18]}) |
                 (~({2 {wr_pcr[3]}} & {~bit63,~bit62}) & {(ov1[3] | pcr3_dout[31]), (ov0[3] | pcr3_dout[18])});

pmu_pct_ctl_msff_ctl_macro__width_2 pcr3_ov  (
	.scan_in(pcr3_ov_scanin),
	.scan_out(pcr3_ov_scanout),
	.l1clk	(l1clk_pm2),
	.din	(x3[1:0]),
	.dout	({pcr3_dout[31],pcr3_dout[18]}),
  .siclk(siclk),
  .soclk(soclk)
);

// PCR4
assign pcr4_din[29:0] = ({30 { wr_pcr[4]}} & {pdp_asi_din_to_pctl[30:19],pdp_asi_din_to_pctl[17:4],ht_in[4],pdp_asi_din_to_pctl[2:0]}) |
                        ({30 {~wr_pcr[4]}} & {disable_h[4],pcr4_dout[29:19],disable_l[4],pcr4_dout[16:0]});

pmu_pct_ctl_msff_ctl_macro__width_30 pcr4  (
	.scan_in(pcr4_scanin),
	.scan_out(pcr4_scanout),
	.l1clk	(l1clk_pm3),
	.din	(pcr4_din[29:0]),
	.dout	({disable_h[4],pcr4_dout[29:19],disable_l[4],pcr4_dout[16:0]}),
  .siclk(siclk),
  .soclk(soclk)
);
assign pcr4_dout[30] = 1'b0;
assign pcr4_dout[17] = 1'b0;

assign x4[1:0] = ( ({2 {wr_pcr[4]}} & {~bit63,~bit62}) & {pdp_asi_din_to_pctl[31], pdp_asi_din_to_pctl[18]}) |
                 (~({2 {wr_pcr[4]}} & {~bit63,~bit62}) & {(ov1[4] | pcr4_dout[31]), (ov0[4] | pcr4_dout[18])});

pmu_pct_ctl_msff_ctl_macro__width_2 pcr4_ov  (
	.scan_in(pcr4_ov_scanin),
	.scan_out(pcr4_ov_scanout),
	.l1clk	(l1clk_pm2),
	.din	(x4[1:0]),
	.dout	({pcr4_dout[31],pcr4_dout[18]}),
  .siclk(siclk),
  .soclk(soclk)
);

// PCR5
assign pcr5_din[29:0] = ({30 { wr_pcr[5]}} & {pdp_asi_din_to_pctl[30:19],pdp_asi_din_to_pctl[17:4],ht_in[5],pdp_asi_din_to_pctl[2:0]}) |
                        ({30 {~wr_pcr[5]}} & {disable_h[5],pcr5_dout[29:19],disable_l[5],pcr5_dout[16:0]});

pmu_pct_ctl_msff_ctl_macro__width_30 pcr5  (
	.scan_in(pcr5_scanin),
	.scan_out(pcr5_scanout),
	.l1clk	(l1clk_pm3),
	.din	(pcr5_din[29:0]),
	.dout	({disable_h[5],pcr5_dout[29:19],disable_l[5],pcr5_dout[16:0]}),
  .siclk(siclk),
  .soclk(soclk)
);
assign pcr5_dout[30] = 1'b0;
assign pcr5_dout[17] = 1'b0;

assign x5[1:0] = ( ({2 {wr_pcr[5]}} & {~bit63,~bit62}) & {pdp_asi_din_to_pctl[31], pdp_asi_din_to_pctl[18]}) |
                 (~({2 {wr_pcr[5]}} & {~bit63,~bit62}) & {(ov1[5] | pcr5_dout[31]), (ov0[5] | pcr5_dout[18])});

pmu_pct_ctl_msff_ctl_macro__width_2 pcr5_ov  (
	.scan_in(pcr5_ov_scanin),
	.scan_out(pcr5_ov_scanout),
	.l1clk	(l1clk_pm2),
	.din	(x5[1:0]),
	.dout	({pcr5_dout[31],pcr5_dout[18]}),
  .siclk(siclk),
  .soclk(soclk)
);

// PCR6
assign pcr6_din[29:0] = ({30 { wr_pcr[6]}} & {pdp_asi_din_to_pctl[30:19],pdp_asi_din_to_pctl[17:4],ht_in[6],pdp_asi_din_to_pctl[2:0]}) |
                        ({30 {~wr_pcr[6]}} & {disable_h[6],pcr6_dout[29:19],disable_l[6],pcr6_dout[16:0]});

pmu_pct_ctl_msff_ctl_macro__width_30 pcr6  (
	.scan_in(pcr6_scanin),
	.scan_out(pcr6_scanout),
	.l1clk	(l1clk_pm3),
	.din	(pcr6_din[29:0]),
	.dout	({disable_h[6],pcr6_dout[29:19],disable_l[6],pcr6_dout[16:0]}),
  .siclk(siclk),
  .soclk(soclk)
);
assign pcr6_dout[30] = 1'b0;
assign pcr6_dout[17] = 1'b0;

assign x6[1:0] = ( ({2 {wr_pcr[6]}} & {~bit63,~bit62}) & {pdp_asi_din_to_pctl[31], pdp_asi_din_to_pctl[18]}) |
                 (~({2 {wr_pcr[6]}} & {~bit63,~bit62}) & {(ov1[6] | pcr6_dout[31]), (ov0[6] | pcr6_dout[18])});

pmu_pct_ctl_msff_ctl_macro__width_2 pcr6_ov  (
	.scan_in(pcr6_ov_scanin),
	.scan_out(pcr6_ov_scanout),
	.l1clk	(l1clk_pm2),
	.din	(x6[1:0]),
	.dout	({pcr6_dout[31],pcr6_dout[18]}),
  .siclk(siclk),
  .soclk(soclk)
);

// PCR7
assign pcr7_din[29:0] = ({30 { wr_pcr[7]}} & {pdp_asi_din_to_pctl[30:19],pdp_asi_din_to_pctl[17:4],ht_in[7],pdp_asi_din_to_pctl[2:0]}) |
                        ({30 {~wr_pcr[7]}} & {disable_h[7],pcr7_dout[29:19],disable_l[7],pcr7_dout[16:0]});

pmu_pct_ctl_msff_ctl_macro__width_30 pcr7  (
	.scan_in(pcr7_scanin),
	.scan_out(pcr7_scanout),
	.l1clk	(l1clk_pm3),
	.din	(pcr7_din[29:0]),
	.dout	({disable_h[7],pcr7_dout[29:19],disable_l[7],pcr7_dout[16:0]}),
  .siclk(siclk),
  .soclk(soclk)
);
assign pcr7_dout[30] = 1'b0;
assign pcr7_dout[17] = 1'b0;

assign x7[1:0] = ( ({2 {wr_pcr[7]}} & {~bit63,~bit62}) & {pdp_asi_din_to_pctl[31], pdp_asi_din_to_pctl[18]}) |
                 (~({2 {wr_pcr[7]}} & {~bit63,~bit62}) & {(ov1[7] | pcr7_dout[31]), (ov0[7] | pcr7_dout[18])});

pmu_pct_ctl_msff_ctl_macro__width_2 pcr7_ov  (
	.scan_in(pcr7_ov_scanin),
	.scan_out(pcr7_ov_scanout),
	.l1clk	(l1clk_pm2),
	.din	(x7[1:0]),
	.dout	({pcr7_dout[31],pcr7_dout[18]}),
  .siclk(siclk),
  .soclk(soclk)
);

// can't power manage x*_1 signals, otherwise can't do edge detect - need free running l1clk

pmu_pct_ctl_msff_ctl_macro__width_16 pcr_ov_del  (
	.scan_in(pcr_ov_del_scanin),
	.scan_out(pcr_ov_del_scanout),
	.l1clk	(l1clk),
	.din	({pcr7_dout[31],pcr7_dout[18],pcr6_dout[31],pcr6_dout[18],pcr5_dout[31],pcr5_dout[18],pcr4_dout[31],pcr4_dout[18],
                  pcr3_dout[31],pcr3_dout[18],pcr2_dout[31],pcr2_dout[18],pcr1_dout[31],pcr1_dout[18],pcr0_dout[31],pcr0_dout[18]}),
	.dout	({x7_1[1:0],x6_1[1:0],x5_1[1:0],x4_1[1:0],x3_1[1:0],x2_1[1:0],x1_1[1:0],x0_1[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// Count only if in correct state (HT, UT, ST)
assign p_cnt_en[0] = (pcr0_dout[3] & hpriv[0]) | (pcr0_dout[1] & ~hpriv[0] & priv[0]) | (pcr0_dout[2] & ~hpriv[0] & ~priv[0]);
assign p_cnt_en[1] = (pcr1_dout[3] & hpriv[1]) | (pcr1_dout[1] & ~hpriv[1] & priv[1]) | (pcr1_dout[2] & ~hpriv[1] & ~priv[1]);
assign p_cnt_en[2] = (pcr2_dout[3] & hpriv[2]) | (pcr2_dout[1] & ~hpriv[2] & priv[2]) | (pcr2_dout[2] & ~hpriv[2] & ~priv[2]);
assign p_cnt_en[3] = (pcr3_dout[3] & hpriv[3]) | (pcr3_dout[1] & ~hpriv[3] & priv[3]) | (pcr3_dout[2] & ~hpriv[3] & ~priv[3]);
assign p_cnt_en[4] = (pcr4_dout[3] & hpriv[4]) | (pcr4_dout[1] & ~hpriv[4] & priv[4]) | (pcr4_dout[2] & ~hpriv[4] & ~priv[4]);
assign p_cnt_en[5] = (pcr5_dout[3] & hpriv[5]) | (pcr5_dout[1] & ~hpriv[5] & priv[5]) | (pcr5_dout[2] & ~hpriv[5] & ~priv[5]);
assign p_cnt_en[6] = (pcr6_dout[3] & hpriv[6]) | (pcr6_dout[1] & ~hpriv[6] & priv[6]) | (pcr6_dout[2] & ~hpriv[6] & ~priv[6]);
assign p_cnt_en[7] = (pcr7_dout[3] & hpriv[7]) | (pcr7_dout[1] & ~hpriv[7] & priv[7]) | (pcr7_dout[2] & ~hpriv[7] & ~priv[7]);

// Decode upper counter events

// SL[3:0] = 4'b0000
assign ph_all_idle[0]= ~|pcr0_dout[30:27] & p_cnt_en[0]; 
assign ph_all_idle[1]= ~|pcr1_dout[30:27] & p_cnt_en[1]; 
assign ph_all_idle[2]= ~|pcr2_dout[30:27] & p_cnt_en[2]; 
assign ph_all_idle[3]= ~|pcr3_dout[30:27] & p_cnt_en[3]; 
assign ph_all_idle[4]= ~|pcr4_dout[30:27] & p_cnt_en[4]; 
assign ph_all_idle[5]= ~|pcr5_dout[30:27] & p_cnt_en[5]; 
assign ph_all_idle[6]= ~|pcr6_dout[30:27] & p_cnt_en[6]; 
assign ph_all_idle[7]= ~|pcr7_dout[30:27] & p_cnt_en[7]; 

// SL[3:0] = 4'b0010 - instruction events
assign ph_ig[0] = ~pcr0_dout[30] & ~pcr0_dout[29] &  pcr0_dout[28] & ~pcr0_dout[27] & p_cnt_en[0];
assign ph_ig[1] = ~pcr1_dout[30] & ~pcr1_dout[29] &  pcr1_dout[28] & ~pcr1_dout[27] & p_cnt_en[1];
assign ph_ig[2] = ~pcr2_dout[30] & ~pcr2_dout[29] &  pcr2_dout[28] & ~pcr2_dout[27] & p_cnt_en[2];
assign ph_ig[3] = ~pcr3_dout[30] & ~pcr3_dout[29] &  pcr3_dout[28] & ~pcr3_dout[27] & p_cnt_en[3];
assign ph_ig[4] = ~pcr4_dout[30] & ~pcr4_dout[29] &  pcr4_dout[28] & ~pcr4_dout[27] & p_cnt_en[4];
assign ph_ig[5] = ~pcr5_dout[30] & ~pcr5_dout[29] &  pcr5_dout[28] & ~pcr5_dout[27] & p_cnt_en[5];
assign ph_ig[6] = ~pcr6_dout[30] & ~pcr6_dout[29] &  pcr6_dout[28] & ~pcr6_dout[27] & p_cnt_en[6];
assign ph_ig[7] = ~pcr7_dout[30] & ~pcr7_dout[29] &  pcr7_dout[28] & ~pcr7_dout[27] & p_cnt_en[7];

// SL[3:0] = 4'b0011 - cache events
assign ph_cg[0] = ~pcr0_dout[30] & ~pcr0_dout[29] &  pcr0_dout[28] &  pcr0_dout[27] & p_cnt_en[0];
assign ph_cg[1] = ~pcr1_dout[30] & ~pcr1_dout[29] &  pcr1_dout[28] &  pcr1_dout[27] & p_cnt_en[1];
assign ph_cg[2] = ~pcr2_dout[30] & ~pcr2_dout[29] &  pcr2_dout[28] &  pcr2_dout[27] & p_cnt_en[2];
assign ph_cg[3] = ~pcr3_dout[30] & ~pcr3_dout[29] &  pcr3_dout[28] &  pcr3_dout[27] & p_cnt_en[3];
assign ph_cg[4] = ~pcr4_dout[30] & ~pcr4_dout[29] &  pcr4_dout[28] &  pcr4_dout[27] & p_cnt_en[4];
assign ph_cg[5] = ~pcr5_dout[30] & ~pcr5_dout[29] &  pcr5_dout[28] &  pcr5_dout[27] & p_cnt_en[5];
assign ph_cg[6] = ~pcr6_dout[30] & ~pcr6_dout[29] &  pcr6_dout[28] &  pcr6_dout[27] & p_cnt_en[6];
assign ph_cg[7] = ~pcr7_dout[30] & ~pcr7_dout[29] &  pcr7_dout[28] &  pcr7_dout[27] & p_cnt_en[7];

// SL[3:0] = 4'b0100 - L2 mmu events
assign ph_mm[0] = ~pcr0_dout[30] &  pcr0_dout[29] & ~pcr0_dout[28] & ~pcr0_dout[27] & p_cnt_en[0];
assign ph_mm[1] = ~pcr1_dout[30] &  pcr1_dout[29] & ~pcr1_dout[28] & ~pcr1_dout[27] & p_cnt_en[1];
assign ph_mm[2] = ~pcr2_dout[30] &  pcr2_dout[29] & ~pcr2_dout[28] & ~pcr2_dout[27] & p_cnt_en[2];
assign ph_mm[3] = ~pcr3_dout[30] &  pcr3_dout[29] & ~pcr3_dout[28] & ~pcr3_dout[27] & p_cnt_en[3];
assign ph_mm[4] = ~pcr4_dout[30] &  pcr4_dout[29] & ~pcr4_dout[28] & ~pcr4_dout[27] & p_cnt_en[4];
assign ph_mm[5] = ~pcr5_dout[30] &  pcr5_dout[29] & ~pcr5_dout[28] & ~pcr5_dout[27] & p_cnt_en[5];
assign ph_mm[6] = ~pcr6_dout[30] &  pcr6_dout[29] & ~pcr6_dout[28] & ~pcr6_dout[27] & p_cnt_en[6];
assign ph_mm[7] = ~pcr7_dout[30] &  pcr7_dout[29] & ~pcr7_dout[28] & ~pcr7_dout[27] & p_cnt_en[7];

// SL[3:0] = 4'b0101 - crossbar events
assign ph_xb[0] = ~pcr0_dout[30] &  pcr0_dout[29] & ~pcr0_dout[28] &  pcr0_dout[27] & p_cnt_en[0];
assign ph_xb[1] = ~pcr1_dout[30] &  pcr1_dout[29] & ~pcr1_dout[28] &  pcr1_dout[27] & p_cnt_en[1];
assign ph_xb[2] = ~pcr2_dout[30] &  pcr2_dout[29] & ~pcr2_dout[28] &  pcr2_dout[27] & p_cnt_en[2];
assign ph_xb[3] = ~pcr3_dout[30] &  pcr3_dout[29] & ~pcr3_dout[28] &  pcr3_dout[27] & p_cnt_en[3];
assign ph_xb[4] = ~pcr4_dout[30] &  pcr4_dout[29] & ~pcr4_dout[28] &  pcr4_dout[27] & p_cnt_en[4];
assign ph_xb[5] = ~pcr5_dout[30] &  pcr5_dout[29] & ~pcr5_dout[28] &  pcr5_dout[27] & p_cnt_en[5];
assign ph_xb[6] = ~pcr6_dout[30] &  pcr6_dout[29] & ~pcr6_dout[28] &  pcr6_dout[27] & p_cnt_en[6];
assign ph_xb[7] = ~pcr7_dout[30] &  pcr7_dout[29] & ~pcr7_dout[28] &  pcr7_dout[27] & p_cnt_en[7];

// SL[3:0] = 4'b0110 - spu operation events
assign ph_so[0] = ~pcr0_dout[30] &  pcr0_dout[29] &  pcr0_dout[28] & ~pcr0_dout[27] & p_cnt_en[0];
assign ph_so[1] = ~pcr1_dout[30] &  pcr1_dout[29] &  pcr1_dout[28] & ~pcr1_dout[27] & p_cnt_en[1];
assign ph_so[2] = ~pcr2_dout[30] &  pcr2_dout[29] &  pcr2_dout[28] & ~pcr2_dout[27] & p_cnt_en[2];
assign ph_so[3] = ~pcr3_dout[30] &  pcr3_dout[29] &  pcr3_dout[28] & ~pcr3_dout[27] & p_cnt_en[3];
assign ph_so[4] = ~pcr4_dout[30] &  pcr4_dout[29] &  pcr4_dout[28] & ~pcr4_dout[27] & p_cnt_en[4];
assign ph_so[5] = ~pcr5_dout[30] &  pcr5_dout[29] &  pcr5_dout[28] & ~pcr5_dout[27] & p_cnt_en[5];
assign ph_so[6] = ~pcr6_dout[30] &  pcr6_dout[29] &  pcr6_dout[28] & ~pcr6_dout[27] & p_cnt_en[6];
assign ph_so[7] = ~pcr7_dout[30] &  pcr7_dout[29] &  pcr7_dout[28] & ~pcr7_dout[27] & p_cnt_en[7];

// SL[3:0] = 4'b0111 - spu busy cycles
assign ph_sb[0] = ~pcr0_dout[30] &  pcr0_dout[29] &  pcr0_dout[28] &  pcr0_dout[27] & p_cnt_en[0];
assign ph_sb[1] = ~pcr1_dout[30] &  pcr1_dout[29] &  pcr1_dout[28] &  pcr1_dout[27] & p_cnt_en[1];
assign ph_sb[2] = ~pcr2_dout[30] &  pcr2_dout[29] &  pcr2_dout[28] &  pcr2_dout[27] & p_cnt_en[2];
assign ph_sb[3] = ~pcr3_dout[30] &  pcr3_dout[29] &  pcr3_dout[28] &  pcr3_dout[27] & p_cnt_en[3];
assign ph_sb[4] = ~pcr4_dout[30] &  pcr4_dout[29] &  pcr4_dout[28] &  pcr4_dout[27] & p_cnt_en[4];
assign ph_sb[5] = ~pcr5_dout[30] &  pcr5_dout[29] &  pcr5_dout[28] &  pcr5_dout[27] & p_cnt_en[5];
assign ph_sb[6] = ~pcr6_dout[30] &  pcr6_dout[29] &  pcr6_dout[28] &  pcr6_dout[27] & p_cnt_en[6];
assign ph_sb[7] = ~pcr7_dout[30] &  pcr7_dout[29] &  pcr7_dout[28] &  pcr7_dout[27] & p_cnt_en[7];

// Decode lower counter events

// SL[3:0] = 4'b0000
assign pl_all_idle[0] = ~|pcr0_dout[17:14] & p_cnt_en[0]; 
assign pl_all_idle[1] = ~|pcr1_dout[17:14] & p_cnt_en[1]; 
assign pl_all_idle[2] = ~|pcr2_dout[17:14] & p_cnt_en[2]; 
assign pl_all_idle[3] = ~|pcr3_dout[17:14] & p_cnt_en[3]; 
assign pl_all_idle[4] = ~|pcr4_dout[17:14] & p_cnt_en[4]; 
assign pl_all_idle[5] = ~|pcr5_dout[17:14] & p_cnt_en[5]; 
assign pl_all_idle[6] = ~|pcr6_dout[17:14] & p_cnt_en[6]; 
assign pl_all_idle[7] = ~|pcr7_dout[17:14] & p_cnt_en[7]; 

// SL[3:0] = 4'b0010 - instruction events
assign pl_ig[0] = ~pcr0_dout[17] & ~pcr0_dout[16] &  pcr0_dout[15] & ~pcr0_dout[14] & p_cnt_en[0];
assign pl_ig[1] = ~pcr1_dout[17] & ~pcr1_dout[16] &  pcr1_dout[15] & ~pcr1_dout[14] & p_cnt_en[1];
assign pl_ig[2] = ~pcr2_dout[17] & ~pcr2_dout[16] &  pcr2_dout[15] & ~pcr2_dout[14] & p_cnt_en[2];
assign pl_ig[3] = ~pcr3_dout[17] & ~pcr3_dout[16] &  pcr3_dout[15] & ~pcr3_dout[14] & p_cnt_en[3];
assign pl_ig[4] = ~pcr4_dout[17] & ~pcr4_dout[16] &  pcr4_dout[15] & ~pcr4_dout[14] & p_cnt_en[4];
assign pl_ig[5] = ~pcr5_dout[17] & ~pcr5_dout[16] &  pcr5_dout[15] & ~pcr5_dout[14] & p_cnt_en[5];
assign pl_ig[6] = ~pcr6_dout[17] & ~pcr6_dout[16] &  pcr6_dout[15] & ~pcr6_dout[14] & p_cnt_en[6];
assign pl_ig[7] = ~pcr7_dout[17] & ~pcr7_dout[16] &  pcr7_dout[15] & ~pcr7_dout[14] & p_cnt_en[7];

// SL[3:0] = 4'b0011 - cache events
assign pl_cg[0] = ~pcr0_dout[17] & ~pcr0_dout[16] &  pcr0_dout[15] &  pcr0_dout[14] & p_cnt_en[0];
assign pl_cg[1] = ~pcr1_dout[17] & ~pcr1_dout[16] &  pcr1_dout[15] &  pcr1_dout[14] & p_cnt_en[1];
assign pl_cg[2] = ~pcr2_dout[17] & ~pcr2_dout[16] &  pcr2_dout[15] &  pcr2_dout[14] & p_cnt_en[2];
assign pl_cg[3] = ~pcr3_dout[17] & ~pcr3_dout[16] &  pcr3_dout[15] &  pcr3_dout[14] & p_cnt_en[3];
assign pl_cg[4] = ~pcr4_dout[17] & ~pcr4_dout[16] &  pcr4_dout[15] &  pcr4_dout[14] & p_cnt_en[4];
assign pl_cg[5] = ~pcr5_dout[17] & ~pcr5_dout[16] &  pcr5_dout[15] &  pcr5_dout[14] & p_cnt_en[5];
assign pl_cg[6] = ~pcr6_dout[17] & ~pcr6_dout[16] &  pcr6_dout[15] &  pcr6_dout[14] & p_cnt_en[6];
assign pl_cg[7] = ~pcr7_dout[17] & ~pcr7_dout[16] &  pcr7_dout[15] &  pcr7_dout[14] & p_cnt_en[7];

// SL[3:0] = 4'b0100 - L2 mmu events
assign pl_mm[0] = ~pcr0_dout[17] &  pcr0_dout[16] & ~pcr0_dout[15] & ~pcr0_dout[14] & p_cnt_en[0];
assign pl_mm[1] = ~pcr1_dout[17] &  pcr1_dout[16] & ~pcr1_dout[15] & ~pcr1_dout[14] & p_cnt_en[1];
assign pl_mm[2] = ~pcr2_dout[17] &  pcr2_dout[16] & ~pcr2_dout[15] & ~pcr2_dout[14] & p_cnt_en[2];
assign pl_mm[3] = ~pcr3_dout[17] &  pcr3_dout[16] & ~pcr3_dout[15] & ~pcr3_dout[14] & p_cnt_en[3];
assign pl_mm[4] = ~pcr4_dout[17] &  pcr4_dout[16] & ~pcr4_dout[15] & ~pcr4_dout[14] & p_cnt_en[4];
assign pl_mm[5] = ~pcr5_dout[17] &  pcr5_dout[16] & ~pcr5_dout[15] & ~pcr5_dout[14] & p_cnt_en[5];
assign pl_mm[6] = ~pcr6_dout[17] &  pcr6_dout[16] & ~pcr6_dout[15] & ~pcr6_dout[14] & p_cnt_en[6];
assign pl_mm[7] = ~pcr7_dout[17] &  pcr7_dout[16] & ~pcr7_dout[15] & ~pcr7_dout[14] & p_cnt_en[7];

// SL[3:0] = 4'b0101 - crossbar events
assign pl_xb[0] = ~pcr0_dout[17] &  pcr0_dout[16] & ~pcr0_dout[15] &  pcr0_dout[14] & p_cnt_en[0];
assign pl_xb[1] = ~pcr1_dout[17] &  pcr1_dout[16] & ~pcr1_dout[15] &  pcr1_dout[14] & p_cnt_en[1];
assign pl_xb[2] = ~pcr2_dout[17] &  pcr2_dout[16] & ~pcr2_dout[15] &  pcr2_dout[14] & p_cnt_en[2];
assign pl_xb[3] = ~pcr3_dout[17] &  pcr3_dout[16] & ~pcr3_dout[15] &  pcr3_dout[14] & p_cnt_en[3];
assign pl_xb[4] = ~pcr4_dout[17] &  pcr4_dout[16] & ~pcr4_dout[15] &  pcr4_dout[14] & p_cnt_en[4];
assign pl_xb[5] = ~pcr5_dout[17] &  pcr5_dout[16] & ~pcr5_dout[15] &  pcr5_dout[14] & p_cnt_en[5];
assign pl_xb[6] = ~pcr6_dout[17] &  pcr6_dout[16] & ~pcr6_dout[15] &  pcr6_dout[14] & p_cnt_en[6];
assign pl_xb[7] = ~pcr7_dout[17] &  pcr7_dout[16] & ~pcr7_dout[15] &  pcr7_dout[14] & p_cnt_en[7];

// SL[3:0] = 4'b0110 - spu operation events
assign pl_so[0] = ~pcr0_dout[17] &  pcr0_dout[16] &  pcr0_dout[15] & ~pcr0_dout[14] & p_cnt_en[0];
assign pl_so[1] = ~pcr1_dout[17] &  pcr1_dout[16] &  pcr1_dout[15] & ~pcr1_dout[14] & p_cnt_en[1];
assign pl_so[2] = ~pcr2_dout[17] &  pcr2_dout[16] &  pcr2_dout[15] & ~pcr2_dout[14] & p_cnt_en[2];
assign pl_so[3] = ~pcr3_dout[17] &  pcr3_dout[16] &  pcr3_dout[15] & ~pcr3_dout[14] & p_cnt_en[3];
assign pl_so[4] = ~pcr4_dout[17] &  pcr4_dout[16] &  pcr4_dout[15] & ~pcr4_dout[14] & p_cnt_en[4];
assign pl_so[5] = ~pcr5_dout[17] &  pcr5_dout[16] &  pcr5_dout[15] & ~pcr5_dout[14] & p_cnt_en[5];
assign pl_so[6] = ~pcr6_dout[17] &  pcr6_dout[16] &  pcr6_dout[15] & ~pcr6_dout[14] & p_cnt_en[6];
assign pl_so[7] = ~pcr7_dout[17] &  pcr7_dout[16] &  pcr7_dout[15] & ~pcr7_dout[14] & p_cnt_en[7];

// SL[3:0] = 4'b0111 - spu busy events
assign pl_sb[0] = ~pcr0_dout[17] &  pcr0_dout[16] &  pcr0_dout[15] &  pcr0_dout[14] & p_cnt_en[0];
assign pl_sb[1] = ~pcr1_dout[17] &  pcr1_dout[16] &  pcr1_dout[15] &  pcr1_dout[14] & p_cnt_en[1];
assign pl_sb[2] = ~pcr2_dout[17] &  pcr2_dout[16] &  pcr2_dout[15] &  pcr2_dout[14] & p_cnt_en[2];
assign pl_sb[3] = ~pcr3_dout[17] &  pcr3_dout[16] &  pcr3_dout[15] &  pcr3_dout[14] & p_cnt_en[3];
assign pl_sb[4] = ~pcr4_dout[17] &  pcr4_dout[16] &  pcr4_dout[15] &  pcr4_dout[14] & p_cnt_en[4];
assign pl_sb[5] = ~pcr5_dout[17] &  pcr5_dout[16] &  pcr5_dout[15] &  pcr5_dout[14] & p_cnt_en[5];
assign pl_sb[6] = ~pcr6_dout[17] &  pcr6_dout[16] &  pcr6_dout[15] &  pcr6_dout[14] & p_cnt_en[6];
assign pl_sb[7] = ~pcr7_dout[17] &  pcr7_dout[16] &  pcr7_dout[15] &  pcr7_dout[14] & p_cnt_en[7];

// Generate outputs to let LSU know if we are about to trap on a dcache/dt/l2d/store miss
// pdp_pich_wrap need to be qualified with pct_wr_pic_w2? (e.g. PIC gets overwritten with a near overflow value and cause trap?)
// Must use flopped wrap signals to avoid a timing path now that PMU is at the upper left and LSU at lower right...
// New design - take TID of what is in LSU in E from DEC; mux down PMU signals internally; send 1 bit to LSU for 
// each one of dcmiss & icmiss trap indicator; still send 8 bits for L2miss since there is no equivalent TID.

assign dcm_h[7:0] = ph_cg[7:0] & {pcr7_dout[20], pcr6_dout[20], pcr5_dout[20], pcr4_dout[20],
                                  pcr3_dout[20], pcr2_dout[20], pcr1_dout[20], pcr0_dout[20]};

assign dcm_l[7:0] = pl_cg[7:0] & {pcr7_dout[ 7], pcr6_dout[7], pcr5_dout[7], pcr4_dout[7],
                                  pcr3_dout[7], pcr2_dout[7], pcr1_dout[7], pcr0_dout[7]};

assign pmu_lsu_dcmiss_trap_e[7:0] = (dcm_h[7:0] & pich_wrap[7:0]) | (dcm_l & picl_wrap[7:0]);

// Decode TID from DEC
assign t[0] = ~lsu_tid_e[2] & ~lsu_tid_e[1] & ~lsu_tid_e[0];
assign t[1] = ~lsu_tid_e[2] & ~lsu_tid_e[1] &  lsu_tid_e[0];
assign t[2] = ~lsu_tid_e[2] &  lsu_tid_e[1] & ~lsu_tid_e[0];
assign t[3] = ~lsu_tid_e[2] &  lsu_tid_e[1] &  lsu_tid_e[0];
assign t[4] =  lsu_tid_e[2] & ~lsu_tid_e[1] & ~lsu_tid_e[0];
assign t[5] =  lsu_tid_e[2] & ~lsu_tid_e[1] &  lsu_tid_e[0];
assign t[6] =  lsu_tid_e[2] &  lsu_tid_e[1] & ~lsu_tid_e[0];
assign t[7] =  lsu_tid_e[2] &  lsu_tid_e[1] &  lsu_tid_e[0];

assign pmu_lsu_dcm_trap_e = |(t[7:0] & pmu_lsu_dcmiss_trap_e[7:0] & { {4 {tlu_pmu_trap_mask_e[1]}}, {4 {tlu_pmu_trap_mask_e[0]}} });

assign dtm_h[7:0] = ph_cg[7:0] & {pcr7_dout[22], pcr6_dout[22], pcr5_dout[22], pcr4_dout[22],
                                  pcr3_dout[22], pcr2_dout[22], pcr1_dout[22], pcr0_dout[22]};

assign dtm_l[7:0] = pl_cg[7:0] & {pcr7_dout[9], pcr6_dout[9], pcr5_dout[9], pcr4_dout[9],
                                  pcr3_dout[9], pcr2_dout[9], pcr1_dout[9], pcr0_dout[9]};

assign pmu_lsu_dtmiss_trap_e[7:0] = (dtm_h[7:0] & pich_wrap[7:0]) | (dtm_l & picl_wrap[7:0]);

assign pmu_lsu_dtm_trap_e = |(t[7:0] & pmu_lsu_dtmiss_trap_e[7:0] & { {4 {tlu_pmu_trap_mask_e[1]}}, {4 {tlu_pmu_trap_mask_e[0]}} });

assign l2dm_h[7:0] = ph_cg[7:0] & {pcr7_dout[24], pcr6_dout[24], pcr5_dout[24], pcr4_dout[24],
                                   pcr3_dout[24], pcr2_dout[24], pcr1_dout[24], pcr0_dout[24]};

assign l2dm_l[7:0] = pl_cg[7:0] & {pcr7_dout[11], pcr6_dout[11], pcr5_dout[11], pcr4_dout[11],
                                   pcr3_dout[11], pcr2_dout[11], pcr1_dout[11], pcr0_dout[11]};

// Need to do L2 misses on an individual TID basis, as out-of-pipe!
//assign pmu_lsu_l2dmiss_trap_e[7:0] = ((l2dm_h[7:0] & pich_wrap[7:0]) | (l2dm_l & picl_wrap[7:0])) & { {4 {tlu_pmu_trap_mask_e[1]}}, {4 {tlu_pmu_trap_mask_e[0]}} };

// Must accumulate current value of trap mask for all threads; update when valid tid in E
// TLU gives PMU a trap mask per TG; must update trap mask based upon TID of each TG's instruction.
// Each cycle a valid instruction comes down the pipe, update the current value of the the lsu trap mask for that thread
// Flop to M, then compute for timing reasons (dec_valid_e late)

// Flop from E to M
pmu_pct_ctl_msff_ctl_macro__width_28 lsu_e2m  (
	.scan_in(lsu_e2m_scanin),
	.scan_out(lsu_e2m_scanout),
	.l1clk	(l1clk_pm1),
	.din	({pmu_lsu_dcm_trap_e, pmu_lsu_dtm_trap_e, l2dm_wrap_e[7:0], lsu_trap_mask_m_din[7:0], th[7:0], tlu_pmu_trap_mask_e[1:0]}),
	.dout	({pmu_lsu_dcmiss_trap_m, pmu_lsu_dtmiss_trap_m, l2dm_wrap_m[7:0], lsu_trap_mask_m[7:0], th_m[7:0], tlu_pmu_trap_mask_m[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// At most 2 bits should be on in this mask
// 0in bits_on -var (lsu_tidm_update_m[7:0]) -max 2 -message "Too many bits on in lsu_tidm_update_m[7:0]"
assign lsu_tidm_update_m[7:0] = {{4 {dec_valid_m[1]}}, {4 {dec_valid_m[0]}}} & th_m[7:0];

assign lsu_trap_mask_m_din[7:0] = ( ~lsu_tidm_update_m[7:0] & lsu_trap_mask_m[7:0]) |
                                  (  lsu_tidm_update_m[7:0] & {{4 {tlu_pmu_trap_mask_m[1]}}, {4 {tlu_pmu_trap_mask_m[0]}}});

assign l2dm_wrap_e[7:0] = (l2dm_h[7:0] & pich_wrap[7:0]) | (l2dm_l[7:0] & picl_wrap[7:0]);

assign pmu_lsu_l2dmiss_trap_m[7:0] = l2dm_wrap_m[7:0] & lsu_trap_mask_m_din[7:0];

// Generate increment values
// All idle
assign ph_ai[7:0] = ph_all_idle[7:0] & {8 {all_idle_e}};
assign pl_ai[7:0] = pl_all_idle[7:0] & {8 {all_idle_e}};

// Generate actual increment events (counter is configured and event occurs)

// First do instruction group events

// For SL[3:0] = 4'b0010... tg0_ityp_e[9:0]: atomic, l2i, it, ic, other, %sethi, store, load, FGU, branch
// 0x01, 0x02, 0x04, 0x08, 0x10 and 0x20

// taken branch event for TLU is done in M stage... th & dec_br_taken_e[1:0]

// High counters
assign ph_ige[0] = |({7 {ph_ig[0] & th[0]}} & {tg0_ityp_e[9], tg0_ityp_e[5:0]} & {pcr0_dout[26:21], pcr0_dout[19]});
assign ph_ige[1] = |({7 {ph_ig[1] & th[1]}} & {tg0_ityp_e[9], tg0_ityp_e[5:0]} & {pcr1_dout[26:21], pcr1_dout[19]});
assign ph_ige[2] = |({7 {ph_ig[2] & th[2]}} & {tg0_ityp_e[9], tg0_ityp_e[5:0]} & {pcr2_dout[26:21], pcr2_dout[19]});
assign ph_ige[3] = |({7 {ph_ig[3] & th[3]}} & {tg0_ityp_e[9], tg0_ityp_e[5:0]} & {pcr3_dout[26:21], pcr3_dout[19]});
assign ph_ige[4] = |({7 {ph_ig[4] & th[4]}} & {tg1_ityp_e[9], tg1_ityp_e[5:0]} & {pcr4_dout[26:21], pcr4_dout[19]});
assign ph_ige[5] = |({7 {ph_ig[5] & th[5]}} & {tg1_ityp_e[9], tg1_ityp_e[5:0]} & {pcr5_dout[26:21], pcr5_dout[19]});
assign ph_ige[6] = |({7 {ph_ig[6] & th[6]}} & {tg1_ityp_e[9], tg1_ityp_e[5:0]} & {pcr6_dout[26:21], pcr6_dout[19]});
assign ph_ige[7] = |({7 {ph_ig[7] & th[7]}} & {tg1_ityp_e[9], tg1_ityp_e[5:0]} & {pcr7_dout[26:21], pcr7_dout[19]});

// Low counters
assign pl_ige[0] = |({7 {pl_ig[0] & th[0]}} & {tg0_ityp_e[9], tg0_ityp_e[5:0]} & {pcr0_dout[13:8], pcr0_dout[6]});
assign pl_ige[1] = |({7 {pl_ig[1] & th[1]}} & {tg0_ityp_e[9], tg0_ityp_e[5:0]} & {pcr1_dout[13:8], pcr1_dout[6]});
assign pl_ige[2] = |({7 {pl_ig[2] & th[2]}} & {tg0_ityp_e[9], tg0_ityp_e[5:0]} & {pcr2_dout[13:8], pcr2_dout[6]});
assign pl_ige[3] = |({7 {pl_ig[3] & th[3]}} & {tg0_ityp_e[9], tg0_ityp_e[5:0]} & {pcr3_dout[13:8], pcr3_dout[6]});
assign pl_ige[4] = |({7 {pl_ig[4] & th[4]}} & {tg1_ityp_e[9], tg1_ityp_e[5:0]} & {pcr4_dout[13:8], pcr4_dout[6]});
assign pl_ige[5] = |({7 {pl_ig[5] & th[5]}} & {tg1_ityp_e[9], tg1_ityp_e[5:0]} & {pcr5_dout[13:8], pcr5_dout[6]});
assign pl_ige[6] = |({7 {pl_ig[6] & th[6]}} & {tg1_ityp_e[9], tg1_ityp_e[5:0]} & {pcr6_dout[13:8], pcr6_dout[6]});
assign pl_ige[7] = |({7 {pl_ig[7] & th[7]}} & {tg1_ityp_e[9], tg1_ityp_e[5:0]} & {pcr7_dout[13:8], pcr7_dout[6]});

// qualifier for dec_br_taken
assign ph_bre[0] = ph_ig[0] & th[0] & pcr0_dout[20];
assign ph_bre[1] = ph_ig[1] & th[1] & pcr1_dout[20];
assign ph_bre[2] = ph_ig[2] & th[2] & pcr2_dout[20];
assign ph_bre[3] = ph_ig[3] & th[3] & pcr3_dout[20];
assign ph_bre[4] = ph_ig[4] & th[4] & pcr4_dout[20];
assign ph_bre[5] = ph_ig[5] & th[5] & pcr5_dout[20];
assign ph_bre[6] = ph_ig[6] & th[6] & pcr6_dout[20];
assign ph_bre[7] = ph_ig[7] & th[7] & pcr7_dout[20];

assign pl_bre[0] = pl_ig[0] & th[0] & pcr0_dout[7];
assign pl_bre[1] = pl_ig[1] & th[1] & pcr1_dout[7];
assign pl_bre[2] = pl_ig[2] & th[2] & pcr2_dout[7];
assign pl_bre[3] = pl_ig[3] & th[3] & pcr3_dout[7];
assign pl_bre[4] = pl_ig[4] & th[4] & pcr4_dout[7];
assign pl_bre[5] = pl_ig[5] & th[5] & pcr5_dout[7];
assign pl_bre[6] = pl_ig[6] & th[6] & pcr6_dout[7];
assign pl_bre[7] = pl_ig[7] & th[7] & pcr7_dout[7];

// High and low counters for cache group events
// For SL[3:0] = 4'b0011...
// 0x02 
assign dcm_he[0] = ph_cg[0] & pcr0_dout[20] & dcm[0];
assign dcm_he[1] = ph_cg[1] & pcr1_dout[20] & dcm[1];
assign dcm_he[2] = ph_cg[2] & pcr2_dout[20] & dcm[2];
assign dcm_he[3] = ph_cg[3] & pcr3_dout[20] & dcm[3];
assign dcm_he[4] = ph_cg[4] & pcr4_dout[20] & dcm[4];
assign dcm_he[5] = ph_cg[5] & pcr5_dout[20] & dcm[5];
assign dcm_he[6] = ph_cg[6] & pcr6_dout[20] & dcm[6];
assign dcm_he[7] = ph_cg[7] & pcr7_dout[20] & dcm[7];

// 0x08
assign dtm_he[0] = ph_cg[0] & pcr0_dout[22] & dtm[0];
assign dtm_he[1] = ph_cg[1] & pcr1_dout[22] & dtm[1];
assign dtm_he[2] = ph_cg[2] & pcr2_dout[22] & dtm[2];
assign dtm_he[3] = ph_cg[3] & pcr3_dout[22] & dtm[3];
assign dtm_he[4] = ph_cg[4] & pcr4_dout[22] & dtm[4];
assign dtm_he[5] = ph_cg[5] & pcr5_dout[22] & dtm[5];
assign dtm_he[6] = ph_cg[6] & pcr6_dout[22] & dtm[6];
assign dtm_he[7] = ph_cg[7] & pcr7_dout[22] & dtm[7];

// 0x20
assign l2m_he[0] = ph_cg[0] & pcr0_dout[24] & l2m[0];
assign l2m_he[1] = ph_cg[1] & pcr1_dout[24] & l2m[1];
assign l2m_he[2] = ph_cg[2] & pcr2_dout[24] & l2m[2];
assign l2m_he[3] = ph_cg[3] & pcr3_dout[24] & l2m[3];
assign l2m_he[4] = ph_cg[4] & pcr4_dout[24] & l2m[4];
assign l2m_he[5] = ph_cg[5] & pcr5_dout[24] & l2m[5];
assign l2m_he[6] = ph_cg[6] & pcr6_dout[24] & l2m[6];
assign l2m_he[7] = ph_cg[7] & pcr7_dout[24] & l2m[7];

// 0x02 
assign dcm_le[0] = pl_cg[0] & pcr0_dout[7] & dcm[0];
assign dcm_le[1] = pl_cg[1] & pcr1_dout[7] & dcm[1];
assign dcm_le[2] = pl_cg[2] & pcr2_dout[7] & dcm[2];
assign dcm_le[3] = pl_cg[3] & pcr3_dout[7] & dcm[3];
assign dcm_le[4] = pl_cg[4] & pcr4_dout[7] & dcm[4];
assign dcm_le[5] = pl_cg[5] & pcr5_dout[7] & dcm[5];
assign dcm_le[6] = pl_cg[6] & pcr6_dout[7] & dcm[6];
assign dcm_le[7] = pl_cg[7] & pcr7_dout[7] & dcm[7];

// 0x08
assign dtm_le[0] = pl_cg[0] & pcr0_dout[9] & dtm[0];
assign dtm_le[1] = pl_cg[1] & pcr1_dout[9] & dtm[1];
assign dtm_le[2] = pl_cg[2] & pcr2_dout[9] & dtm[2];
assign dtm_le[3] = pl_cg[3] & pcr3_dout[9] & dtm[3];
assign dtm_le[4] = pl_cg[4] & pcr4_dout[9] & dtm[4];
assign dtm_le[5] = pl_cg[5] & pcr5_dout[9] & dtm[5];
assign dtm_le[6] = pl_cg[6] & pcr6_dout[9] & dtm[6];
assign dtm_le[7] = pl_cg[7] & pcr7_dout[9] & dtm[7];

// 0x20
assign l2m_le[0] = pl_cg[0] & pcr0_dout[11] & l2m[0];
assign l2m_le[1] = pl_cg[1] & pcr1_dout[11] & l2m[1];
assign l2m_le[2] = pl_cg[2] & pcr2_dout[11] & l2m[2];
assign l2m_le[3] = pl_cg[3] & pcr3_dout[11] & l2m[3];
assign l2m_le[4] = pl_cg[4] & pcr4_dout[11] & l2m[4];
assign l2m_le[5] = pl_cg[5] & pcr5_dout[11] & l2m[5];
assign l2m_le[6] = pl_cg[6] & pcr6_dout[11] & l2m[6];
assign l2m_le[7] = pl_cg[7] & pcr7_dout[11] & l2m[7];

// Split cache group events into I & D side misses, since they need to get piped in
// at different stages...
assign ph_icge[0] = |({3 {ph_cg[0] & th[0]}} & tg0_ityp_e[8:6] & {pcr0_dout[23],pcr0_dout[21],pcr0_dout[19]});   // l2i, it, ic miss
assign ph_icge[1] = |({3 {ph_cg[1] & th[1]}} & tg0_ityp_e[8:6] & {pcr1_dout[23],pcr1_dout[21],pcr1_dout[19]});   // l2i, it, ic miss
assign ph_icge[2] = |({3 {ph_cg[2] & th[2]}} & tg0_ityp_e[8:6] & {pcr2_dout[23],pcr2_dout[21],pcr2_dout[19]});   // l2i, it, ic miss
assign ph_icge[3] = |({3 {ph_cg[3] & th[3]}} & tg0_ityp_e[8:6] & {pcr3_dout[23],pcr3_dout[21],pcr3_dout[19]});   // l2i, it, ic miss
assign ph_icge[4] = |({3 {ph_cg[4] & th[4]}} & tg1_ityp_e[8:6] & {pcr4_dout[23],pcr4_dout[21],pcr4_dout[19]});   // l2i, it, ic miss
assign ph_icge[5] = |({3 {ph_cg[5] & th[5]}} & tg1_ityp_e[8:6] & {pcr5_dout[23],pcr5_dout[21],pcr5_dout[19]});   // l2i, it, ic miss
assign ph_icge[6] = |({3 {ph_cg[6] & th[6]}} & tg1_ityp_e[8:6] & {pcr6_dout[23],pcr6_dout[21],pcr6_dout[19]});   // l2i, it, ic miss
assign ph_icge[7] = |({3 {ph_cg[7] & th[7]}} & tg1_ityp_e[8:6] & {pcr7_dout[23],pcr7_dout[21],pcr7_dout[19]});   // l2i, it, ic miss

//assign ph_dcge[7:0] = dcm_he[7:0] | dtm_he[7:0] | l2m_he[7:0];

assign pl_icge[0] = |({3 {pl_cg[0] & th[0]}} & tg0_ityp_e[8:6] & {pcr0_dout[10],pcr0_dout[8],pcr0_dout[6]});   // l2i, it, ic miss
assign pl_icge[1] = |({3 {pl_cg[1] & th[1]}} & tg0_ityp_e[8:6] & {pcr1_dout[10],pcr1_dout[8],pcr1_dout[6]});   // l2i, it, ic miss
assign pl_icge[2] = |({3 {pl_cg[2] & th[2]}} & tg0_ityp_e[8:6] & {pcr2_dout[10],pcr2_dout[8],pcr2_dout[6]});   // l2i, it, ic miss
assign pl_icge[3] = |({3 {pl_cg[3] & th[3]}} & tg0_ityp_e[8:6] & {pcr3_dout[10],pcr3_dout[8],pcr3_dout[6]});   // l2i, it, ic miss
assign pl_icge[4] = |({3 {pl_cg[4] & th[4]}} & tg1_ityp_e[8:6] & {pcr4_dout[10],pcr4_dout[8],pcr4_dout[6]});   // l2i, it, ic miss
assign pl_icge[5] = |({3 {pl_cg[5] & th[5]}} & tg1_ityp_e[8:6] & {pcr5_dout[10],pcr5_dout[8],pcr5_dout[6]});   // l2i, it, ic miss
assign pl_icge[6] = |({3 {pl_cg[6] & th[6]}} & tg1_ityp_e[8:6] & {pcr6_dout[10],pcr6_dout[8],pcr6_dout[6]});   // l2i, it, ic miss
assign pl_icge[7] = |({3 {pl_cg[7] & th[7]}} & tg1_ityp_e[8:6] & {pcr7_dout[10],pcr7_dout[8],pcr7_dout[6]});   // l2i, it, ic miss

//assign pl_dcge[7:0] = dcm_le[7:0] | dtm_le[7:0] | l2m_le[7:0];

// High and low MMU events
// first decode MMU tid...
assign mm_tid[0] = ~mm_mtyp[4] & ~mm_mtyp[3] & ~mm_mtyp[2];
assign mm_tid[1] = ~mm_mtyp[4] & ~mm_mtyp[3] &  mm_mtyp[2];
assign mm_tid[2] = ~mm_mtyp[4] &  mm_mtyp[3] & ~mm_mtyp[2];
assign mm_tid[3] = ~mm_mtyp[4] &  mm_mtyp[3] &  mm_mtyp[2];
assign mm_tid[4] =  mm_mtyp[4] & ~mm_mtyp[3] & ~mm_mtyp[2];
assign mm_tid[5] =  mm_mtyp[4] & ~mm_mtyp[3] &  mm_mtyp[2];
assign mm_tid[6] =  mm_mtyp[4] &  mm_mtyp[3] & ~mm_mtyp[2];
assign mm_tid[7] =  mm_mtyp[4] &  mm_mtyp[3] &  mm_mtyp[2];

// Now decode what actually happened {l2dtm, l2itm, l2dtr, l2itr}
assign mm_l2e[3:0] = {4 {mm_mtyp[5]}} & 
                     {mm_mtyp[1] & mm_mtyp[0], ~mm_mtyp[1] &  mm_mtyp[0],  mm_mtyp[1], ~mm_mtyp[1]};

assign ph_mme[0] = ph_mm[0] & mm_tid[0] & |(mm_l2e[3:0] & pcr0_dout[24:21]);
assign ph_mme[1] = ph_mm[1] & mm_tid[1] & |(mm_l2e[3:0] & pcr1_dout[24:21]);
assign ph_mme[2] = ph_mm[2] & mm_tid[2] & |(mm_l2e[3:0] & pcr2_dout[24:21]);
assign ph_mme[3] = ph_mm[3] & mm_tid[3] & |(mm_l2e[3:0] & pcr3_dout[24:21]);
assign ph_mme[4] = ph_mm[4] & mm_tid[4] & |(mm_l2e[3:0] & pcr4_dout[24:21]);
assign ph_mme[5] = ph_mm[5] & mm_tid[5] & |(mm_l2e[3:0] & pcr5_dout[24:21]);
assign ph_mme[6] = ph_mm[6] & mm_tid[6] & |(mm_l2e[3:0] & pcr6_dout[24:21]);
assign ph_mme[7] = ph_mm[7] & mm_tid[7] & |(mm_l2e[3:0] & pcr7_dout[24:21]);

assign pl_mme[0] = pl_mm[0] & mm_tid[0] & |(mm_l2e[3:0] & pcr0_dout[11:8]);
assign pl_mme[1] = pl_mm[1] & mm_tid[1] & |(mm_l2e[3:0] & pcr1_dout[11:8]);
assign pl_mme[2] = pl_mm[2] & mm_tid[2] & |(mm_l2e[3:0] & pcr2_dout[11:8]);
assign pl_mme[3] = pl_mm[3] & mm_tid[3] & |(mm_l2e[3:0] & pcr3_dout[11:8]);
assign pl_mme[4] = pl_mm[4] & mm_tid[4] & |(mm_l2e[3:0] & pcr4_dout[11:8]);
assign pl_mme[5] = pl_mm[5] & mm_tid[5] & |(mm_l2e[3:0] & pcr5_dout[11:8]);
assign pl_mme[6] = pl_mm[6] & mm_tid[6] & |(mm_l2e[3:0] & pcr6_dout[11:8]);
assign pl_mme[7] = pl_mm[7] & mm_tid[7] & |(mm_l2e[3:0] & pcr7_dout[11:8]);

// High and low xbar events
//assign xb[7] =  xbar[2] &  xbar[1] &  xbar[0]; // ma st
//assign xb[6] =  xbar[2] &  xbar[1] & ~xbar[0]; // ma ld
assign xb[5] =  xbar[2] & ~xbar[1] & ~xbar[0]; // mmuld
assign xb[4] = ~xbar[2] & ~xbar[1] &  xbar[0]; // cpust
assign xb[3] =  xbar[2] & ~xbar[1] &  xbar[0]; // ifetch
assign xb[2] = ~xbar[2] & ~xbar[1] & ~xbar[0]; // cpuld
assign xb[1] = (~xbar[2] &  xbar[1] &  xbar[0]) | (xbar[2] & xbar[1] & xbar[0]); // cwq st or ma st
assign xb[0] = (~xbar[2] &  xbar[1] & ~xbar[0]) | (xbar[2] & xbar[1] & ~xbar[0]); // cwq ld or ma ld

// For stream lds/stores, must munge tid, as xbar tid not accurate

assign use_ma =  xbar[2] & xbar[1];
assign use_cwq = ~xbar[2] & xbar[1];

assign xbtid[2:0] = ({3 { use_ma}} & ma[2:0]) |
                    ({3 { use_cwq}} & spu_tid[2:0]) |
                    ({3 { ~use_ma & ~use_cwq}} & xbar[5:3]);

// SL[3:0] = 4'b0101
assign ph_xbe[0] = ph_xb[0] & xbar[6] & ~xbtid[2] & ~xbtid[1] & ~xbtid[0] & |(xb[5:0] & pcr0_dout[24:19]);
assign ph_xbe[1] = ph_xb[1] & xbar[6] & ~xbtid[2] & ~xbtid[1] &  xbtid[0] & |(xb[5:0] & pcr1_dout[24:19]);
assign ph_xbe[2] = ph_xb[2] & xbar[6] & ~xbtid[2] &  xbtid[1] & ~xbtid[0] & |(xb[5:0] & pcr2_dout[24:19]);
assign ph_xbe[3] = ph_xb[3] & xbar[6] & ~xbtid[2] &  xbtid[1] &  xbtid[0] & |(xb[5:0] & pcr3_dout[24:19]);
assign ph_xbe[4] = ph_xb[4] & xbar[6] &  xbtid[2] & ~xbtid[1] & ~xbtid[0] & |(xb[5:0] & pcr4_dout[24:19]);
assign ph_xbe[5] = ph_xb[5] & xbar[6] &  xbtid[2] & ~xbtid[1] &  xbtid[0] & |(xb[5:0] & pcr5_dout[24:19]);
assign ph_xbe[6] = ph_xb[6] & xbar[6] &  xbtid[2] &  xbtid[1] & ~xbtid[0] & |(xb[5:0] & pcr6_dout[24:19]);
assign ph_xbe[7] = ph_xb[7] & xbar[6] &  xbtid[2] &  xbtid[1] &  xbtid[0] & |(xb[5:0] & pcr7_dout[24:19]);

assign pl_xbe[0] = pl_xb[0] & xbar[6] & ~xbtid[2] & ~xbtid[1] & ~xbtid[0] & |(xb[5:0] & pcr0_dout[11:6]);
assign pl_xbe[1] = pl_xb[1] & xbar[6] & ~xbtid[2] & ~xbtid[1] &  xbtid[0] & |(xb[5:0] & pcr1_dout[11:6]);
assign pl_xbe[2] = pl_xb[2] & xbar[6] & ~xbtid[2] &  xbtid[1] & ~xbtid[0] & |(xb[5:0] & pcr2_dout[11:6]);
assign pl_xbe[3] = pl_xb[3] & xbar[6] & ~xbtid[2] &  xbtid[1] &  xbtid[0] & |(xb[5:0] & pcr3_dout[11:6]);
assign pl_xbe[4] = pl_xb[4] & xbar[6] &  xbtid[2] & ~xbtid[1] & ~xbtid[0] & |(xb[5:0] & pcr4_dout[11:6]);
assign pl_xbe[5] = pl_xb[5] & xbar[6] &  xbtid[2] & ~xbtid[1] &  xbtid[0] & |(xb[5:0] & pcr5_dout[11:6]);
assign pl_xbe[6] = pl_xb[6] & xbar[6] &  xbtid[2] &  xbtid[1] & ~xbtid[0] & |(xb[5:0] & pcr6_dout[11:6]);
assign pl_xbe[7] = pl_xb[7] & xbar[6] &  xbtid[2] &  xbtid[1] &  xbtid[0] & |(xb[5:0] & pcr7_dout[11:6]);

// High and low SPU ops

// SL[3:0] = 4'b0110
// increment spu_op only when the current des/aes/rc4/hash/ma/crc is busy and was not the previous cycle.
assign spu_des[7:0] = {8 {des & ~des_d1}} & cwq_tid[7:0];
assign spu_aes[7:0] = {8 {aes & ~aes_d1}} & cwq_tid[7:0];
assign spu_rc4[7:0] = {8 {rc4 & ~rc4_d1}} & cwq_tid[7:0];
assign spu_hash[7:0] = {8 {hash & ~hash_d1}} & cwq_tid[7:0];
assign spu_ma[7:0] = {8 {ma[3] & ~ma_3_d1}} & ma_tid[7:0];
assign spu_crc[7:0] = {8 {crc & ~crc_d1}} & cwq_tid[7:0];

assign ph_soe[0] = ph_so[0] & |({spu_crc[0], spu_ma[0], spu_hash[0], spu_rc4[0], spu_aes[0], spu_des[0]} & pcr0_dout[24:19]);
assign ph_soe[1] = ph_so[1] & |({spu_crc[1], spu_ma[1], spu_hash[1], spu_rc4[1], spu_aes[1], spu_des[1]} & pcr1_dout[24:19]);
assign ph_soe[2] = ph_so[2] & |({spu_crc[2], spu_ma[2], spu_hash[2], spu_rc4[2], spu_aes[2], spu_des[2]} & pcr2_dout[24:19]);
assign ph_soe[3] = ph_so[3] & |({spu_crc[3], spu_ma[3], spu_hash[3], spu_rc4[3], spu_aes[3], spu_des[3]} & pcr3_dout[24:19]);
assign ph_soe[4] = ph_so[4] & |({spu_crc[4], spu_ma[4], spu_hash[4], spu_rc4[4], spu_aes[4], spu_des[4]} & pcr4_dout[24:19]);
assign ph_soe[5] = ph_so[5] & |({spu_crc[5], spu_ma[5], spu_hash[5], spu_rc4[5], spu_aes[5], spu_des[5]} & pcr5_dout[24:19]);
assign ph_soe[6] = ph_so[6] & |({spu_crc[6], spu_ma[6], spu_hash[6], spu_rc4[6], spu_aes[6], spu_des[6]} & pcr6_dout[24:19]);
assign ph_soe[7] = ph_so[7] & |({spu_crc[7], spu_ma[7], spu_hash[7], spu_rc4[7], spu_aes[7], spu_des[7]} & pcr7_dout[24:19]);

assign pl_soe[0] = pl_so[0] & |({spu_crc[0], spu_ma[0], spu_hash[0], spu_rc4[0], spu_aes[0], spu_des[0]} & pcr0_dout[11:6]);
assign pl_soe[1] = pl_so[1] & |({spu_crc[1], spu_ma[1], spu_hash[1], spu_rc4[1], spu_aes[1], spu_des[1]} & pcr1_dout[11:6]);
assign pl_soe[2] = pl_so[2] & |({spu_crc[2], spu_ma[2], spu_hash[2], spu_rc4[2], spu_aes[2], spu_des[2]} & pcr2_dout[11:6]);
assign pl_soe[3] = pl_so[3] & |({spu_crc[3], spu_ma[3], spu_hash[3], spu_rc4[3], spu_aes[3], spu_des[3]} & pcr3_dout[11:6]);
assign pl_soe[4] = pl_so[4] & |({spu_crc[4], spu_ma[4], spu_hash[4], spu_rc4[4], spu_aes[4], spu_des[4]} & pcr4_dout[11:6]);
assign pl_soe[5] = pl_so[5] & |({spu_crc[5], spu_ma[5], spu_hash[5], spu_rc4[5], spu_aes[5], spu_des[5]} & pcr5_dout[11:6]);
assign pl_soe[6] = pl_so[6] & |({spu_crc[6], spu_ma[6], spu_hash[6], spu_rc4[6], spu_aes[6], spu_des[6]} & pcr6_dout[11:6]);
assign pl_soe[7] = pl_so[7] & |({spu_crc[7], spu_ma[7], spu_hash[7], spu_rc4[7], spu_aes[7], spu_des[7]} & pcr7_dout[11:6]);

// High and low SPU busy cycles
// SL[3:0] = 4'b0111
assign ph_sbe[0] = ph_sb[0] & |({crcb[0], mab[0], hashb[0], rc4b[0], aesb[0], desb[0]} & pcr0_dout[24:19]);
assign ph_sbe[1] = ph_sb[1] & |({crcb[1], mab[1], hashb[1], rc4b[1], aesb[1], desb[1]} & pcr1_dout[24:19]);
assign ph_sbe[2] = ph_sb[2] & |({crcb[2], mab[2], hashb[2], rc4b[2], aesb[2], desb[2]} & pcr2_dout[24:19]);
assign ph_sbe[3] = ph_sb[3] & |({crcb[3], mab[3], hashb[3], rc4b[3], aesb[3], desb[3]} & pcr3_dout[24:19]);
assign ph_sbe[4] = ph_sb[4] & |({crcb[4], mab[4], hashb[4], rc4b[4], aesb[4], desb[4]} & pcr4_dout[24:19]);
assign ph_sbe[5] = ph_sb[5] & |({crcb[5], mab[5], hashb[5], rc4b[5], aesb[5], desb[5]} & pcr5_dout[24:19]);
assign ph_sbe[6] = ph_sb[6] & |({crcb[6], mab[6], hashb[6], rc4b[6], aesb[6], desb[6]} & pcr6_dout[24:19]);
assign ph_sbe[7] = ph_sb[7] & |({crcb[7], mab[7], hashb[7], rc4b[7], aesb[7], desb[7]} & pcr7_dout[24:19]);

assign pl_sbe[0] = pl_sb[0] & |({crcb[0], mab[0], hashb[0], rc4b[0], aesb[0], desb[0]} & pcr0_dout[11:6]);
assign pl_sbe[1] = pl_sb[1] & |({crcb[1], mab[1], hashb[1], rc4b[1], aesb[1], desb[1]} & pcr1_dout[11:6]);
assign pl_sbe[2] = pl_sb[2] & |({crcb[2], mab[2], hashb[2], rc4b[2], aesb[2], desb[2]} & pcr2_dout[11:6]);
assign pl_sbe[3] = pl_sb[3] & |({crcb[3], mab[3], hashb[3], rc4b[3], aesb[3], desb[3]} & pcr3_dout[11:6]);
assign pl_sbe[4] = pl_sb[4] & |({crcb[4], mab[4], hashb[4], rc4b[4], aesb[4], desb[4]} & pcr4_dout[11:6]);
assign pl_sbe[5] = pl_sb[5] & |({crcb[5], mab[5], hashb[5], rc4b[5], aesb[5], desb[5]} & pcr5_dout[11:6]);
assign pl_sbe[6] = pl_sb[6] & |({crcb[6], mab[6], hashb[6], rc4b[6], aesb[6], desb[6]} & pcr6_dout[11:6]);
assign pl_sbe[7] = pl_sb[7] & |({crcb[7], mab[7], hashb[7], rc4b[7], aesb[7], desb[7]} & pcr7_dout[11:6]);

// qualify wrap with whether we should trap 
assign pich_wrap[0] = pdp_pich_wrap[0] & pcr0_dout[5];
assign pich_wrap[1] = pdp_pich_wrap[1] & pcr1_dout[5];
assign pich_wrap[2] = pdp_pich_wrap[2] & pcr2_dout[5];
assign pich_wrap[3] = pdp_pich_wrap[3] & pcr3_dout[5];
assign pich_wrap[4] = pdp_pich_wrap[4] & pcr4_dout[5];
assign pich_wrap[5] = pdp_pich_wrap[5] & pcr5_dout[5];
assign pich_wrap[6] = pdp_pich_wrap[6] & pcr6_dout[5];
assign pich_wrap[7] = pdp_pich_wrap[7] & pcr7_dout[5];

assign picl_wrap[0] = pdp_picl_wrap[0] & pcr0_dout[4];
assign picl_wrap[1] = pdp_picl_wrap[1] & pcr1_dout[4];
assign picl_wrap[2] = pdp_picl_wrap[2] & pcr2_dout[4];
assign picl_wrap[3] = pdp_picl_wrap[3] & pcr3_dout[4];
assign picl_wrap[4] = pdp_picl_wrap[4] & pcr4_dout[4];
assign picl_wrap[5] = pdp_picl_wrap[5] & pcr5_dout[4];
assign picl_wrap[6] = pdp_picl_wrap[6] & pcr6_dout[4];
assign picl_wrap[7] = pdp_picl_wrap[7] & pcr7_dout[4];

// Generate traps if OV bit set (obviously don't increment the counters in this case!)
assign ovh[7:0] = {pcr7_dout[31] & pcr7_dout[5], 
                   pcr6_dout[31] & pcr6_dout[5], 
                   pcr5_dout[31] & pcr5_dout[5], 
                   pcr4_dout[31] & pcr4_dout[5],
                   pcr3_dout[31] & pcr3_dout[5], 
                   pcr2_dout[31] & pcr2_dout[5], 
                   pcr1_dout[31] & pcr1_dout[5], 
                   pcr0_dout[31] & pcr0_dout[5]};

assign ovl[7:0] = {pcr7_dout[18] & pcr7_dout[4], 
                   pcr6_dout[18] & pcr6_dout[4], 
                   pcr5_dout[18] & pcr5_dout[4], 
                   pcr4_dout[18] & pcr4_dout[4],
                   pcr3_dout[18] & pcr3_dout[4], 
                   pcr2_dout[18] & pcr2_dout[4], 
                   pcr1_dout[18] & pcr1_dout[4], 
                   pcr0_dout[18] & pcr0_dout[4]};

// According to dec_del_ctl.sv
// we don't need to clear the valid_d's for br_mispredict, trap flush or load flush
// we will never get a dec_valid_e for these cases
// flush means NOT valid... ifu_fl_e[1] = ~tg0_ityp_e[12]; qualified in th[7:0];

// There are 3 distinct types of signals.
// 1) ige/icge - can get killed by ifu at m/b or tlu at b/w. In either case the kill actually happens
//    one cycle later since the flush signals are flopped for timing reasons.
// 2) the dcge - can get killed by tlu at w (again, 1 cycle later).
// 3) the rest - which can't get killed.
// So, we have to do 2 things:
// A) for the trap signal to TLU, we have to generate a trap request and hold it until TLU acks it
//    via the tlu_pmu_trap_taken signal. This implies that we have a pipe from e2m, m2b, b2w, and w2w1
//    where we kill events appropriately, otherwise OR the flops together. All reqs are killed when
//    the trap_taken signal occurs.
// B) for incrementing the counters, a similar pipe holds. Except that group 1) is piped from e2m, m2b,
//    b2w, w2w1, group 2) is piped from w2w1, and the rest are jammed in during w1.

// Must clip off spurious events during wakeup cycle: during that cycle, events flop has junk in it; and 1 pcr is now valid and counting.
// So one thread can generate spurious events.
assign pipeh_incr_e[7:0] = (ph_ige[7:0] | ph_icge[7:0]) & ~{8 {wakeup}};
assign pipel_incr_e[7:0] = (pl_ige[7:0] | pl_icge[7:0]) & ~{8 {wakeup}};

// Since dec_br_taken[1:0] is late, flop in E, generate br_taken event in W...
assign pipeh_incr_m[7:0] = ph_brm[7:0] & {{4{dec_br_taken_m[1]&dec_valid_m[1]}}, {4 {dec_br_taken_m[0]&dec_valid_m[0]}}};
assign pipel_incr_m[7:0] = pl_brm[7:0] & {{4{dec_br_taken_m[1]&dec_valid_m[1]}}, {4 {dec_br_taken_m[0]&dec_valid_m[0]}}};

// 9/16/05
// Don't consider L2 dcache misses as "flushable" events. If they were supposed to be flushed, they wouldn't
// have made it to L2. So OR them in as "async" events.
assign pipeh_incr_w[7:0] = (dcm_he[7:0] | dtm_he[7:0]) & ~{8 {wakeup}};
assign pipel_incr_w[7:0] = (dcm_le[7:0] | dtm_le[7:0]) & ~{8 {wakeup}};

assign pipeh_async[7:0] = (ph_ai[7:0] | ph_xbe[7:0] | ph_soe[7:0] | ph_sbe[7:0] | ph_mme[7:0] | l2m_he[7:0]) & ~{8 {wait_for_sleep | wakeup}};
assign pipel_async[7:0] = (pl_ai[7:0] | pl_xbe[7:0] | pl_soe[7:0] | pl_sbe[7:0] | pl_mme[7:0] | l2m_le[7:0]) & ~{8 {wait_for_sleep | wakeup}};

// Setup trap pipeline...
// Sample ige/icge events during e using pich/picl_wrap, then pipe to w1, kill with appropriate flushes along the way
// Sample dcge during w using pich/picl_wrap, pipe to w1, kill in w1 with appropriate flushes
// Async sampled at w1 using pich/picl; ov also sampled at w1, but not using pich/picl_wrap
// 0in assert -var ~(((|trap_m[7:0]) | (|trap_b[7:0]) | (|trap_w[7:0]) | (|trap_w1[7:0])) & ~l1b) -message "trap_m or trap_b or trap_w or trap_w1 not 0 when clock stopped!"
pmu_pct_ctl_msff_ctl_macro__width_32 tp  (
	.scan_in(tp_scanin),
	.scan_out(tp_scanout),
	.l1clk	(l1clk_pm1),
	.din	({trap_e[7:0], trap_b_in[7:0], trap_w_in[7:0], trap_w1_in[7:0]} & ~{4 {tpt[7:0]}}),
	.dout	({trap_m[7:0], trap_b[7:0], trap_w[7:0], trap_w1[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// Don't power-manage this flop - wait_for_sleep is long enough to get any trap to this flop, 
pmu_pct_ctl_msff_ctl_macro__width_8 tp1  (
	.scan_in(tp1_scanin),
	.scan_out(tp1_scanout),
	.l1clk	(l1clk),
	.din	(trap_hold_in[7:0]),
	.dout	(trap_hold[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in assert -var ~(((|ph_brm[7:0]) | (|pl_brm[7:0]) | (|ph_br_may_trap_m[7:0])) & ~l1b) -message "ph_brm or pl_brm or ph_br_may_trap_m not 0 when clock stopped!"
pmu_pct_ctl_msff_ctl_macro__width_24 br  (
	.scan_in(br_scanin),
	.scan_out(br_scanout),
	.l1clk	(l1clk_pm1),
	.din	(~{24 {wakeup}} & {ph_bre[7:0], pl_bre[7:0], (ph_bre[7:0] & pich_wrap[7:0]) | (pl_bre[7:0] & picl_wrap[7:0])}),
	.dout	({ph_brm[7:0], pl_brm[7:0], ph_br_may_trap_m[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// for safety, clear everything when tlu takes a pmu trap for a thread
assign tpt[7:0] = tlu_pmu_trap_taken[7:0];

assign trap_e[7:0] = (pipeh_incr_e[7:0] & pich_wrap[7:0]) |
                     (pipel_incr_e[7:0] & picl_wrap[7:0]);

// Since dec_br_taken[1:0] is late, flop in E, generate br_taken event in W...

//assign trap_b_in[7:0] = trap_m[7:0] & {{4 {dec_valid_m[1]}}, {4 {dec_valid_m[0]}}};
assign trap_b_in[7:0] = (trap_m[7:0] | 
                          (ph_br_may_trap_m[7:0] & {{4 {dec_br_taken_m[1]}}, {4 {dec_br_taken_m[0]}}}))
                        & {{4 {dec_valid_m[1]}}, {4 {dec_valid_m[0]}}};

assign trap_w_in[7:0] = trap_b[7:0] & ~{{4 {ifu_fl_b[1]}}, {4 {ifu_fl_b[0]}}};

assign trap_w1_in[7:0] = trap_w[7:0] & ~{{4 {fl_w[1]}}, {4 {fl_w[0]}}};

assign trap_w1_final[7:0] = (trap_w1 & ~{{4 {tlu_fl_w1[1]}}, {4 {tlu_fl_w1[0]}}});

assign async[7:0] = (pipeh_async[7:0] & pich_wrap[7:0]) |
                    (pipel_async[7:0] & picl_wrap[7:0]);

// Remove ovh & ovl since these will drive the interrupt request directly; also remove trap_hold since
// OV will be set. Use "trap_hold" only to pipeline async requests...
//assign trap_hold_in[7:0] = async[7:0] | ovh[7:0] | ovl[7:0] | trap_w1_final[7:0] | trap_hold[7:0];
assign trap_hold_in[7:0] = async[7:0];

// Deal with the trap signal now...
// Use trap_hold flop output to avoid timing problem w/async req's
// Need to OR in OV bits for the true "hold" function (actually OR the AND of OV & TOE)
assign pmu_tlu_trap_m[7:0] = trap_b_in[7:0] | trap_w_in[7:0] | trap_w1_in[7:0] | trap_w1_final[7:0] | trap_hold[7:0] | ovh[7:0] | ovl[7:0];

// Now for the increment pipeline

// Flop increment signals signals to M stage
// Also register kill signals from IFU and TLU, and gate off increment signals appropriately
// Don't pipe in precise DCmiss, DTmiss, L2Dmiss until W stage!
// Don't gate off "imprecise" events with trap signals, pipe in at "last minute"...
// Inject "0" when wait_for_sleep starts, pipe down...
// 0in assert -var ~(((|ph_incr_m[7:0]) | (|pl_incr_m[7:0])) & ~l1b) -message "ph_incr_m or pl_incr_m not 0 when clock stopped!"
pmu_pct_ctl_msff_ctl_macro__width_18 ti_e2m  (
	.scan_in(ti_e2m_scanin),
	.scan_out(ti_e2m_scanout),
	.l1clk	(l1clk_pm1),
	.din	({(~{16 {wait_for_sleep}} & {pipeh_incr_e[7:0], pipel_incr_e[7:0]}), dec_valid_e[1:0]}),
	.dout	({ph_incr_m[7:0], pl_incr_m[7:0], dec_valid_m[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// Kill off if was a flush from ifu for E last cycle
// Also need to kill off increment signals as events flop and/or these ti_* flops stopped with junk in them...
// so need 1 clock to clear out to sync up to pipeline again after restart

// Equivalent to flush from D last cycle
assign ph_i_m[7:0] = (ph_incr_m[7:0] | pipeh_incr_m[7:0]) & {{4 {dec_valid_m[1]}}, {4 {dec_valid_m[0]}}};
assign pl_i_m[7:0] = (pl_incr_m[7:0] | pipel_incr_m[7:0]) & {{4 {dec_valid_m[1]}}, {4 {dec_valid_m[0]}}};

// Pipe increment signals to B stage to wait for possible trap
// 0in assert -var ~(((|ph_incr_b[7:0]) | (|pl_incr_b[7:0])) & ~l1b) -message "ph_incr_b or pl_incr_b not 0 when clock stopped!"
pmu_pct_ctl_msff_ctl_macro__width_18 ti_m2b  (
	.scan_in(ti_m2b_scanin),
	.scan_out(ti_m2b_scanout),
	.l1clk	(l1clk_pm1),
	.din	({ph_i_m[7:0], pl_i_m[7:0], dec_flush_m[1:0]}),
	.dout	({ph_incr_b[7:0], pl_incr_b[7:0], ifu_fl_b[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// Kill off if was a flush from ifu for M last cycle
assign ph_i_b[7:0] = ph_incr_b[7:0] & ~{{4 {ifu_fl_b[1]}}, {4 {ifu_fl_b[0]}}};
assign pl_i_b[7:0] = pl_incr_b[7:0] & ~{{4 {ifu_fl_b[1]}}, {4 {ifu_fl_b[0]}}};

// Pipe to W stage, grab trap flush request from IFU or TLU
// 0in assert -var ~(((|ph_incr_w[7:0]) | (|pl_incr_w[7:0])) & ~l1b) -message "ph_incr_w or pl_incr_w not 0 when clock stopped!"
pmu_pct_ctl_msff_ctl_macro__width_18 ti_b2w  (
	.scan_in(ti_b2w_scanin),
	.scan_out(ti_b2w_scanout),
	.l1clk	(l1clk_pm1),
	.din	({ph_i_b[7:0], pl_i_b[7:0], tlu_flush_pmu_b[1:0] | dec_flush_b[1:0]}),
	.dout	({ph_incr_w[7:0], pl_incr_w[7:0], fl_w[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// Add in DCmiss, DTmiss, L2Dmiss events from B
// Must be exlusive between thread groups, since each thread can only monitor one event group
// at a time. Within an event group, the only possibility is for the cache events to
// happen on the same instruction (e.g., ICmiss on a load which also DCmisses).
// But the event mask field forces them to be counted as one event.

assign ph_i_w[7:0] = (ph_incr_w[7:0] | pipeh_incr_w[7:0]) & ~{{4 {fl_w[1]}}, {4 {fl_w[0]}}};
assign pl_i_w[7:0] = (pl_incr_w[7:0] | pipel_incr_w[7:0]) & ~{{4 {fl_w[1]}}, {4 {fl_w[0]}}};

// Pipe to W+1 stage, grab trap flush request from TLU for W
// 0in assert -var ~(((|ph_incr_w1[7:0]) | (|pl_incr_w1[7:0])) & ~l1b) -message "ph_incr_w1 or pl_incr_w1 not 0 when clock stopped!"
pmu_pct_ctl_msff_ctl_macro__width_18 ti_w2w1  (
	.scan_in(ti_w2w1_scanin),
	.scan_out(ti_w2w1_scanout),
	.l1clk	(l1clk_pm1),
	.din	({ph_i_w[7:0], pl_i_w[7:0], tlu_flush_pmu_w[1:0]}),
	.dout	({ph_incr_w1[7:0], pl_incr_w1[7:0], tlu_fl_w1[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// The counter increment pipeline is as follows:
// (Needed to delay this by 1 cycle compared to original design since flush signal
// for trapping op, which should not increment counters, comes in W, not B)
// In the W+1 stage, generate the final increment signals by gating with trap signals
// Add these increment signals to the 4-bit accumulators for each PIC. Meanwhile mux the
// accumulators (8:1) and PICs for high, low, and each thread group, then flop. The ST (select thread)
// register determines which thread is selected for adding in cycle W+2.
// In the W+2 stage, add the flopped accumulator value to the proper PIC. 
// during W+2 to save another 64-bit register per TG. So critical dataflow path is flopped data ->
// -> adder -> incrementor -> incrementor -> PIC mux flop which should be about
// 500 pS total.

// Generate final increment sums during W1 stage; gate off if tlu flush
// check to make sure async events never intersect with non-async (better if the decoding
// is done correctly)
// 0in assert -var (~|(ph_incr_w1[7:0]&pipeh_async[7:0])) -message "high instruction event and async event not mutex"
// 0in assert -var (~|(pl_incr_w1[7:0]&pipel_async[7:0])) -message "low instruction event and async event not mutex"

// ECOxxx: For tlb misses must not allow tlu to flush the incr signals
//assign ph_final_incr_w1[7:0] = (ph_incr_w1[7:0] & ~{{4 {tlu_fl_w1[1]}}, {4 {tlu_fl_w1[0]}}}) | pipeh_async[7:0];
//assign pl_final_incr_w1[7:0] = (pl_incr_w1[7:0] & ~{{4 {tlu_fl_w1[1]}}, {4 {tlu_fl_w1[0]}}}) | pipel_async[7:0];

assign flush_h[7:0] = (~disable_h[7:0] & { {4{tlu_fl_w1[1]}}, {4{tlu_fl_w1[0]}} });
assign flush_l[7:0] = (~disable_l[7:0] & { {4{tlu_fl_w1[1]}}, {4{tlu_fl_w1[0]}} });

assign ph_final_incr_w1[7:0] = (ph_incr_w1[7:0] & ~flush_h[7:0]) | pipeh_async[7:0];
assign pl_final_incr_w1[7:0] = (pl_incr_w1[7:0] & ~flush_l[7:0]) | pipel_async[7:0];

// Send final increment signals to Trap for debug event (soft/hard stop/trigger)
// Fix below so that event only sent to PMU when a counter wraps (actually the OV bit is set)
// So we are going to do an edge detection (send a pulse whenever the OV bit transitions from 0 to 1)
// assign pmu_tlu_debug_event[7:0] = ph_final_incr_w1[7:0] | pl_final_incr_w1[7:0];
assign pmu_tlu_debug_event[7:0] = {|({pcr7_dout[31],pcr7_dout[18]} & ~x7_1[1:0]), |({pcr6_dout[31],pcr6_dout[18]} & ~x6_1[1:0]), 
                                   |({pcr5_dout[31],pcr5_dout[18]} & ~x5_1[1:0]), |({pcr4_dout[31],pcr4_dout[18]} & ~x4_1[1:0]),
                                   |({pcr3_dout[31],pcr3_dout[18]} & ~x3_1[1:0]), |({pcr2_dout[31],pcr2_dout[18]} & ~x2_1[1:0]),
                                   |({pcr1_dout[31],pcr1_dout[18]} & ~x1_1[1:0]), |({pcr0_dout[31],pcr0_dout[18]} & ~x0_1[1:0])};

// Fix oversight ( - set OV bits when we are within range and a trap occurs...
// Assume that if we are going to increment, and we are within range, and TOE is set,
// there must already be a trap request. Since the trap is disrupting, the trap may
// not occur for some time, but in the meantime we set the OV bit.
assign set_ovh_spec[7:0] = ph_final_incr_w1[7:0] & pich_wrap[7:0];
assign set_ovl_spec[7:0] = pl_final_incr_w1[7:0] & picl_wrap[7:0];

// Now for the increment controls...ST register
// ST runs "asynchronously" to the pipeline
// Cycle through each TG's PICs every 4th cycle
// Logically reset pic_std_w1 to 0x1
// Consider having 1 incrementor for all 8 threads...

// NEW scheme -- Cycle through each TG's PICs every 8th cycle
// Let pct_incr_pic_w1 = 8'h01 => 8'h02  => 8'h04 => 8'h08 => 8'h10 => 8'h20  => 8'h40 => 8'h80

// 0in one_hot -var pic_std_w1[7:0]
assign pic_std_w1[7:0] = {pic_st_dout[7:1], ~pic_st_dout[0]};
assign pic_st_din[7:0] = {pic_std_w1[6:0], ~pic_std_w1[7]};

assign pct_incr_pic_w1[6:0] = pic_std_w1[6:0];

pmu_pct_ctl_msff_ctl_macro__width_8 pic_st  (
      .scan_in(pic_st_scanin),
      .scan_out(pic_st_scanout),
      .l1clk  (l1clk_pm1),
      .din    (pic_st_din[7:0]),
      .dout   (pic_st_dout[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// Have 16 4-bit accumulators, one per thread counter
// assert - need to make sure counters never get above 8 (e.g., should be <= 0x8 at all times)
// Increment, but reset to 0 when read (set to 1 if an instruction completes same cycle as accumulator being read)
// If write to PCR, reset accumulator values to 0, under the assumption that accumulated events are leftovers from
// previous event in PCR (this doesn't work if the event/mask are not changed...)

// This bug is especially apparent when idle is being counted...
// find out whether the SL has changed on wr_pcr = 1;
// pdp_asi_din_to_pctl[31:27] and pdp_asi_din_to_pctl[17:14]

// thread 0 high
assign t0h_din[3:0] = (({4 {~pic_std_w1[0]}} & t0h_dout[3:0]) + {3'b0, ph_final_incr_w1[0]}) & 
                       ~{4 {wr_pcr[0] & {pdp_asi_din_to_pctl[30:27] != pcr0_dout[30:27]}}};

pmu_pct_ctl_msff_ctl_macro__width_4 t0h  (
	.scan_in(t0h_scanin),
	.scan_out(t0h_scanout),
	.l1clk	(l1clk_pm1),
	.din	(t0h_din[3:0]),
	.dout	(t0h_dout[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in maximum -var t0h_dout[3:0] -val 8 -message "t0h accumulator overflow"
// 0in assert -var ~((|t0h_dout[3:0]) & ~l1b) -message "t0h accumulator non-zero when clocks off!"

// thread 1 high
assign t1h_din[3:0] = (({4 {~pic_std_w1[1]}} & t1h_dout[3:0]) + {3'b0, ph_final_incr_w1[1]}) & 
                       ~{4 {wr_pcr[1] & {pdp_asi_din_to_pctl[30:27] != pcr1_dout[30:27]}}};

pmu_pct_ctl_msff_ctl_macro__width_4 t1h  (
	.scan_in(t1h_scanin),
	.scan_out(t1h_scanout),
	.l1clk	(l1clk_pm1),
	.din	(t1h_din[3:0]),
	.dout	(t1h_dout[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in maximum -var t1h_dout[3:0] -val 8 -message "t1h accumulator overflow"
// 0in assert -var ~((|t1h_dout[3:0]) & ~l1b) -message "t1h accumulator non-zero when clocks off!"

// thread 2 high
assign t2h_din[3:0] = (({4 {~pic_std_w1[2]}} & t2h_dout[3:0]) + {3'b0, ph_final_incr_w1[2]}) & 
                       ~{4 {wr_pcr[2] & {pdp_asi_din_to_pctl[30:27] != pcr2_dout[30:27]}}};
pmu_pct_ctl_msff_ctl_macro__width_4 t2h  (
	.scan_in(t2h_scanin),
	.scan_out(t2h_scanout),
	.l1clk	(l1clk_pm1),
	.din	(t2h_din[3:0]),
	.dout	(t2h_dout[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in maximum -var t2h_dout[3:0] -val 8 -message "t2h accumulator overflow"
// 0in assert -var ~((|t2h_dout[3:0]) & ~l1b) -message "t2h accumulator non-zero when clocks off!"

// thread 3 high
assign t3h_din[3:0] = (({4 {~pic_std_w1[3]}} & t3h_dout[3:0]) + {3'b0, ph_final_incr_w1[3]}) & 
                       ~{4 {wr_pcr[3] & {pdp_asi_din_to_pctl[30:27] != pcr3_dout[30:27]}}};
pmu_pct_ctl_msff_ctl_macro__width_4 t3h  (
	.scan_in(t3h_scanin),
	.scan_out(t3h_scanout),
	.l1clk	(l1clk_pm1),
	.din	(t3h_din[3:0]),
	.dout	(t3h_dout[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in maximum -var t3h_dout[3:0] -val 8 -message "t3h accumulator overflow"
// 0in assert -var ~((|t3h_dout[3:0]) & ~l1b) -message "t3h accumulator non-zero when clocks off!"

// thread 4 high
assign t4h_din[3:0] = (({4 {~pic_std_w1[4]}} & t4h_dout[3:0]) + {3'b0, ph_final_incr_w1[4]}) &  
                       ~{4 {wr_pcr[4] & {pdp_asi_din_to_pctl[30:27] != pcr4_dout[30:27]}}};
pmu_pct_ctl_msff_ctl_macro__width_4 t4h  (
	.scan_in(t4h_scanin),
	.scan_out(t4h_scanout),
	.l1clk	(l1clk_pm1),
	.din	(t4h_din[3:0]),
	.dout	(t4h_dout[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in maximum -var t4h_dout[3:0] -val 8 -message "t4h accumulator overflow"
// 0in assert -var ~((|t4h_dout[3:0]) & ~l1b) -message "t4h accumulator non-zero when clocks off!"

// thread 5 high
assign t5h_din[3:0] = (({4 {~pic_std_w1[5]}} & t5h_dout[3:0]) + {3'b0, ph_final_incr_w1[5]}) & 
                       ~{4 {wr_pcr[5] & {pdp_asi_din_to_pctl[30:27] != pcr5_dout[30:27]}}};
pmu_pct_ctl_msff_ctl_macro__width_4 t5h  (
	.scan_in(t5h_scanin),
	.scan_out(t5h_scanout),
	.l1clk	(l1clk_pm1),
	.din	(t5h_din[3:0]),
	.dout	(t5h_dout[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in maximum -var t5h_dout[3:0] -val 8 -message "t5h accumulator overflow"
// 0in assert -var ~((|t5h_dout[3:0]) & ~l1b) -message "t5h accumulator non-zero when clocks off!"

// thread 6 high
assign t6h_din[3:0] = (({4 {~pic_std_w1[6]}} & t6h_dout[3:0]) + {3'b0, ph_final_incr_w1[6]}) & 
                       ~{4 {wr_pcr[6] & {pdp_asi_din_to_pctl[30:27] != pcr6_dout[30:27]}}};
pmu_pct_ctl_msff_ctl_macro__width_4 t6h  (
	.scan_in(t6h_scanin),
	.scan_out(t6h_scanout),
	.l1clk	(l1clk_pm1),
	.din	(t6h_din[3:0]),
	.dout	(t6h_dout[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in maximum -var t6h_dout[3:0] -val 8 -message "t6h accumulator overflow"
// 0in assert -var ~((|t6h_dout[3:0]) & ~l1b) -message "t6h accumulator non-zero when clocks off!"

// thread 7 high
assign t7h_din[3:0] = (({4 {~pic_std_w1[7]}} & t7h_dout[3:0]) + {3'b0, ph_final_incr_w1[7]}) & 
                       ~{4 {wr_pcr[7] & {pdp_asi_din_to_pctl[30:27] != pcr7_dout[30:27]}}};
pmu_pct_ctl_msff_ctl_macro__width_4 t7h  (
	.scan_in(t7h_scanin),
	.scan_out(t7h_scanout),
	.l1clk	(l1clk_pm1),
	.din	(t7h_din[3:0]),
	.dout	(t7h_dout[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in maximum -var t7h_dout[3:0] -val 8 -message "t7h accumulator overflow"
// 0in assert -var ~((|t7h_dout[3:0]) & ~l1b) -message "t7h accumulator non-zero when clocks off!"

// thread 0 low
assign t0l_din[3:0] = (({4 {~pic_std_w1[0]}} & t0l_dout[3:0]) + {3'b0, pl_final_incr_w1[0]}) & 
                       ~{4 {wr_pcr[0] & {pdp_asi_din_to_pctl[17:14] != pcr0_dout[17:14]}}};
pmu_pct_ctl_msff_ctl_macro__width_4 t0l  (
	.scan_in(t0l_scanin),
	.scan_out(t0l_scanout),
	.l1clk	(l1clk_pm1),
	.din	(t0l_din[3:0]),
	.dout	(t0l_dout[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in maximum -var t0l_dout[3:0] -val 8 -message "t0l accumulator overflow"
// 0in assert -var ~((|t0l_dout[3:0]) & ~l1b) -message "t0l accumulator non-zero when clocks off!"

// thread 1 low
assign t1l_din[3:0] = (({4 {~pic_std_w1[1]}} & t1l_dout[3:0]) + {3'b0, pl_final_incr_w1[1]}) & 
                       ~{4 {wr_pcr[1] & {pdp_asi_din_to_pctl[17:14] != pcr1_dout[17:14]}}};
pmu_pct_ctl_msff_ctl_macro__width_4 t1l  (
	.scan_in(t1l_scanin),
	.scan_out(t1l_scanout),
	.l1clk	(l1clk_pm1),
	.din	(t1l_din[3:0]),
	.dout	(t1l_dout[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in maximum -var t1l_dout[3:0] -val 8 -message "t1l accumulator overflow"
// 0in assert -var ~((|t1l_dout[3:0]) & ~l1b) -message "t1l accumulator non-zero when clocks off!"

// thread 2 low
assign t2l_din[3:0] = (({4 {~pic_std_w1[2]}} & t2l_dout[3:0]) + {3'b0, pl_final_incr_w1[2]}) & 
                       ~{4 {wr_pcr[2] & {pdp_asi_din_to_pctl[17:14] != pcr2_dout[17:14]}}};
pmu_pct_ctl_msff_ctl_macro__width_4 t2l  (
	.scan_in(t2l_scanin),
	.scan_out(t2l_scanout),
	.l1clk	(l1clk_pm1),
	.din	(t2l_din[3:0]),
	.dout	(t2l_dout[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in maximum -var t2l_dout[3:0] -val 8 -message "t2l accumulator overflow"
// 0in assert -var ~((|t2l_dout[3:0]) & ~l1b) -message "t2l accumulator non-zero when clocks off!"

// thread 3 low
assign t3l_din[3:0] = (({4 {~pic_std_w1[3]}} & t3l_dout[3:0]) + {3'b0, pl_final_incr_w1[3]}) & 
                       ~{4 {wr_pcr[3] & {pdp_asi_din_to_pctl[17:14] != pcr3_dout[17:14]}}};
pmu_pct_ctl_msff_ctl_macro__width_4 t3l  (
	.scan_in(t3l_scanin),
	.scan_out(t3l_scanout),
	.l1clk	(l1clk_pm1),
	.din	(t3l_din[3:0]),
	.dout	(t3l_dout[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in maximum -var t3l_dout[3:0] -val 8 -message "t3l accumulator overflow"
// 0in assert -var ~((|t3l_dout[3:0]) & ~l1b) -message "t3l accumulator non-zero when clocks off!"

// thread 4 low
assign t4l_din[3:0] = (({4 {~pic_std_w1[4]}} & t4l_dout[3:0]) + {3'b0, pl_final_incr_w1[4]}) & 
                       ~{4 {wr_pcr[4] & {pdp_asi_din_to_pctl[17:14] != pcr4_dout[17:14]}}};
pmu_pct_ctl_msff_ctl_macro__width_4 t4l  (
	.scan_in(t4l_scanin),
	.scan_out(t4l_scanout),
	.l1clk	(l1clk_pm1),
	.din	(t4l_din[3:0]),
	.dout	(t4l_dout[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in maximum -var t4l_dout[3:0] -val 8 -message "t4l accumulator overflow"
// 0in assert -var ~((|t4l_dout[3:0]) & ~l1b) -message "t4l accumulator non-zero when clocks off!"

// thread 5 low
assign t5l_din[3:0] = (({4 {~pic_std_w1[5]}} & t5l_dout[3:0]) + {3'b0, pl_final_incr_w1[5]}) & 
                       ~{4 {wr_pcr[5] & {pdp_asi_din_to_pctl[17:14] != pcr5_dout[17:14]}}};
pmu_pct_ctl_msff_ctl_macro__width_4 t5l  (
	.scan_in(t5l_scanin),
	.scan_out(t5l_scanout),
	.l1clk	(l1clk_pm1),
	.din	(t5l_din[3:0]),
	.dout	(t5l_dout[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in maximum -var t5l_dout[3:0] -val 8 -message "t5l accumulator overflow"
// 0in assert -var ~((|t5l_dout[3:0]) & ~l1b) -message "t0l accumulator non-zero when clocks off!"

// thread 6 low
assign t6l_din[3:0] = (({4 {~pic_std_w1[6]}} & t6l_dout[3:0]) + {3'b0, pl_final_incr_w1[6]}) & 
                       ~{4 {wr_pcr[6] & {pdp_asi_din_to_pctl[17:14] != pcr6_dout[17:14]}}};
pmu_pct_ctl_msff_ctl_macro__width_4 t6l  (
	.scan_in(t6l_scanin),
	.scan_out(t6l_scanout),
	.l1clk	(l1clk_pm1),
	.din	(t6l_din[3:0]),
	.dout	(t6l_dout[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in maximum -var t6l_dout[3:0] -val 8 -message "t6l accumulator overflow"
// 0in assert -var ~((|t6l_dout[3:0]) & ~l1b) -message "t6l accumulator non-zero when clocks off!"

// thread 7 low
assign t7l_din[3:0] = (({4 {~pic_std_w1[7]}} & t7l_dout[3:0]) + {3'b0, pl_final_incr_w1[7]}) & 
                       ~{4 {wr_pcr[7] & {pdp_asi_din_to_pctl[17:14] != pcr7_dout[17:14]}}};
pmu_pct_ctl_msff_ctl_macro__width_4 t7l  (
	.scan_in(t7l_scanin),
	.scan_out(t7l_scanout),
	.l1clk	(l1clk_pm1),
	.din	(t7l_din[3:0]),
	.dout	(t7l_dout[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in maximum -var t7l_dout[3:0] -val 8 -message "t7l accumulator overflow"
// 0in assert -var ~((|t7l_dout[3:0]) & ~l1b) -message "t7l accumulator non-zero when clocks off!"

// Mux during W1
// Force a zero value iff are writing to the PIC from the ASI this cycle,
// to prevent overwriting the PIC with the previous PIC + accum. value
// Instead we write the PIC in 2 successive cycles...to save 8 flop bits

assign pich07_add_in_w1[3:0] = ({4 {pic_std_w1[7] & ~incr_asi[7]}} & t7h_dout[3:0]) |
                               ({4 {pic_std_w1[6] & ~incr_asi[6]}} & t6h_dout[3:0]) | 
                               ({4 {pic_std_w1[5] & ~incr_asi[5]}} & t5h_dout[3:0]) | 
                               ({4 {pic_std_w1[4] & ~incr_asi[4]}} & t4h_dout[3:0]) |
			       ({4 {pic_std_w1[3] & ~incr_asi[3]}} & t3h_dout[3:0]) |
                               ({4 {pic_std_w1[2] & ~incr_asi[2]}} & t2h_dout[3:0]) | 
                               ({4 {pic_std_w1[1] & ~incr_asi[1]}} & t1h_dout[3:0]) | 
                               ({4 {pic_std_w1[0] & ~incr_asi[0]}} & t0h_dout[3:0]);

assign picl07_add_in_w1[3:0] = ({4 {pic_std_w1[7] & ~incr_asi[7]}} & t7l_dout[3:0]) |
                               ({4 {pic_std_w1[6] & ~incr_asi[6]}} & t6l_dout[3:0]) | 
                               ({4 {pic_std_w1[5] & ~incr_asi[5]}} & t5l_dout[3:0]) | 
                               ({4 {pic_std_w1[4] & ~incr_asi[4]}} & t4l_dout[3:0]) |
			       ({4 {pic_std_w1[3] & ~incr_asi[3]}} & t3l_dout[3:0]) |
                               ({4 {pic_std_w1[2] & ~incr_asi[2]}} & t2l_dout[3:0]) | 
                               ({4 {pic_std_w1[1] & ~incr_asi[1]}} & t1l_dout[3:0]) | 
                               ({4 {pic_std_w1[0] & ~incr_asi[0]}} & t0l_dout[3:0]);


// Now register and drive to datapath adder during W+1;
// also register the ST signals to drive the PIC muxes during W+1
pmu_pct_ctl_msff_ctl_macro__width_8 accum  (
	.scan_in(accum_scanin),
	.scan_out(accum_scanout),
	.l1clk	(l1clk_pm1),
	.din	({pich07_add_in_w1[3:0], picl07_add_in_w1[3:0]}),
	.dout	({pct_pich07_add_w2[3:0], pct_picl07_add_w2[3:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// w2 is w1 from the previous cycle; e.g., rotate w1 right
assign pic_std_w2[7:0] = {pic_std_w1[0], pic_std_w1[7:1]};

// ASI write timing:
// 1st cycle: decode ASI data bus (contains address) & control field;
//            pipe ASI to output flop; flop if request for us & which op to do
// 2nd cycle: if ASI not for us, pipe ASI input flop to output flop; else
//            for ASI write, write ASI data into selected PIC or PCR; else for
//            ASI read, drive mux controls and select PIC/PCR at ASI output flop

// Format of ASI data in bus:
// 64    - ctl/data
// 63    - valid/hole
// 62    - ack/nack
// 61:60 - 00-ASI, 01-ASR, 10-PR, 11-HPR   
// 59    - rd/wr
// 58:56 - Thread ID
// 55:48 - ASI field/exception: if illegal opcode, set bit 48; if privileged operation, set bit 49
// 47:0  - Virtual Address

// PCR ASR = 16 (decimal), PIC = 17 decimal 
// PCR is privileged, PIC is privileged if PCR.PRIV is set...
  
// 1st cycle decode
// See if this op is for us
assign asi_cntrl_h[15:8] = pdp_asi_ctlin_to_pctl_15_8[7:0];
assign asi_cntrl[4:0] = pdp_asi_ctlin_to_pctl_4_0[4:0];

assign asr = ~asi_cntrl_h[13] & asi_cntrl_h[12];
assign asr_rd = asi_ctl_ndata & asi_cntrl_h[15] & ~asi_cntrl_h[14] & asr & asi_cntrl_h[11];
assign asr_wr = asi_ctl_ndata & asi_cntrl_h[15] & ~asi_cntrl_h[14] & asr & ~asi_cntrl_h[11];
assign pcr = asi_cntrl[4] & ~asi_cntrl[3] & ~asi_cntrl[2] & ~asi_cntrl[1] & ~asi_cntrl[0]; // 16
assign pic = asi_cntrl[4] & ~asi_cntrl[3] & ~asi_cntrl[2] & ~asi_cntrl[1] &  asi_cntrl[0]; // 17

assign pic_rd = asr_rd & pic;
assign pic_wr = asr_wr & pic;
assign pcr_rd = asr_rd & pcr;
assign pcr_wr = asr_wr & pcr;

// If this op is for us, make sure the ack bit is not set...otherwise there is a decode conflict on
// the local ring; this actually isn't a full check unless the pmu is the last link on the ring before 
// returning to the lsu
// 0in assert -var (~((pic | pcr) & asr & asi_ctl_ndata & asi_cntrl_h[15] & asi_cntrl_h[14])) -message "ack set for pic or pcr operation"

assign tid[7:0] = {
   asi_cntrl_h[10] &  asi_cntrl_h[9] &  asi_cntrl_h[8],  
   asi_cntrl_h[10] &  asi_cntrl_h[9] & ~asi_cntrl_h[8],  
   asi_cntrl_h[10] & ~asi_cntrl_h[9] &  asi_cntrl_h[8],  
   asi_cntrl_h[10] & ~asi_cntrl_h[9] & ~asi_cntrl_h[8],  
  ~asi_cntrl_h[10] &  asi_cntrl_h[9] &  asi_cntrl_h[8],  
  ~asi_cntrl_h[10] &  asi_cntrl_h[9] & ~asi_cntrl_h[8],  
  ~asi_cntrl_h[10] & ~asi_cntrl_h[9] &  asi_cntrl_h[8],  
  ~asi_cntrl_h[10] & ~asi_cntrl_h[9] & ~asi_cntrl_h[8]
                  };  

// Check for exceptions...if no exception set ack bit
assign asr_priv[7:0] = tid[7:0] & ~(hpriv[7:0] | priv[7:0]) & (
                                                               ({8 {pcr_rd | pcr_wr}}) |
                                                               ({8 {pic_rd | pic_wr}} & {pcr7_dout[0], pcr6_dout[0],
                                                                                         pcr5_dout[0], pcr4_dout[0], 
                                                                                         pcr3_dout[0], pcr2_dout[0], 
                                                                                         pcr1_dout[0], pcr0_dout[0]})
                                                              );

assign priv_ex = |asr_priv[7:0];
assign pmu_op = pic_rd | pic_wr | pcr_rd | pcr_wr;
assign pct_exception = priv_ex;

pmu_pct_ctl_l1clkhdr_ctl_macro asi_busy_clkgen (
        .l2clk  (l2clk          	),
        .l1en   (pmu_asi_clken 		),
//        .l1clk  (asi_busy_l1clk		)
        .l1clk  (l1clk_pm4		),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

pmu_pct_ctl_msff_ctl_macro__width_14 asi  (
	.scan_in(asi_scanin),
	.scan_out(asi_scanout),
	.l1clk	(l1clk_pm4),
	.din	({pic_rd & ~priv_ex, pic_wr & ~priv_ex, pcr_rd & ~priv_ex, pcr_wr & ~priv_ex, tid[7:0], 
                  in_rngl_cdbus_ctl_ndata, asi_ctl_ndata}),
	.dout	({p_rd, p_wr, pc_rd, pc_wr, atid[7:0], 
                  asi_ctl_ndata, pct_rngl_cdbus_ctl_ndata}),
  .siclk(siclk),
  .soclk(soclk)
);

// Mux down PCR for read
// save power at expense of time if can by gating with pc_rd
// Restore read of bits 30 and 17
assign pcr0_read[31:0] = {pcr0_dout[31], disable_h[0], pcr0_dout[29:18], disable_l[0], pcr0_dout[16:0]};
assign pcr1_read[31:0] = {pcr1_dout[31], disable_h[1], pcr1_dout[29:18], disable_l[1], pcr1_dout[16:0]};
assign pcr2_read[31:0] = {pcr2_dout[31], disable_h[2], pcr2_dout[29:18], disable_l[2], pcr2_dout[16:0]};
assign pcr3_read[31:0] = {pcr3_dout[31], disable_h[3], pcr3_dout[29:18], disable_l[3], pcr3_dout[16:0]};
assign pcr4_read[31:0] = {pcr4_dout[31], disable_h[4], pcr4_dout[29:18], disable_l[4], pcr4_dout[16:0]};
assign pcr5_read[31:0] = {pcr5_dout[31], disable_h[5], pcr5_dout[29:18], disable_l[5], pcr5_dout[16:0]};
assign pcr6_read[31:0] = {pcr6_dout[31], disable_h[6], pcr6_dout[29:18], disable_l[6], pcr6_dout[16:0]};
assign pcr7_read[31:0] = {pcr7_dout[31], disable_h[7], pcr7_dout[29:18], disable_l[7], pcr7_dout[16:0]};

assign pct_pcr_data[31:0] = ({32 {pc_rd & atid[0]}} & pcr0_read[31:0]) | 
                            ({32 {pc_rd & atid[1]}} & pcr1_read[31:0]) |   
                            ({32 {pc_rd & atid[2]}} & pcr2_read[31:0]) |   
                            ({32 {pc_rd & atid[3]}} & pcr3_read[31:0]) |   
                            ({32 {pc_rd & atid[4]}} & pcr4_read[31:0]) |   
                            ({32 {pc_rd & atid[5]}} & pcr5_read[31:0]) |   
                            ({32 {pc_rd & atid[6]}} & pcr6_read[31:0]) |   
                            ({32 {pc_rd & atid[7]}} & pcr7_read[31:0]);   

assign pct_rd_pic_pcr = p_rd | pc_rd;

// Generate PIC mux selects for read
assign pct_rd_pic[7:0] = {8 {p_rd}} & atid[7:0];
assign pct_rd_a_pic = p_rd;

// Always bypass unless doing an ASR/PR read for this node
assign pct_bypass_asi = ~(p_rd | pc_rd | pmu_op);

// There is a 2 cycle pipeline for writing to a PIC
// In cycle 1 (which corresponds to W+1), pic_std_w1 selects a thread for adding the next cycle;
// the thread's PIC is muxed into a staging register in pdp. The accumulator has also been selected
// and is flopped in pct_pic*_add_w1 above.
// In cycle 2, the PIC and the accumulator value are added in the DP block.

// Simple enough but we have to consider the case of writing to a PIC from the ASI and doing an
// increment the same cycle...We consider this architecturally undefined, but we would like
// to have a predictable value for validation purposes. The cleanest solution is to always
// select the ASI value.

// Note: At the current time, wr %pic is post-syncing...and there is a 5-cycle delay between
// the pic update in W+2 and the ASI write to the PIC. The delay will increase when the FGU is
// added in the local ring ahead of the PMU. Due to the post-syncing, there isn't a way to
// keep the PIC counting events past a wr %pic...so we can't test a simultaneous write to
// an incrementing PIC using instructions. This has to be tested via async. events.

// Since there is a 2-cycle pipeline, there are 4 cases:
// 1. Write to ASI in W+2 and add PIC in W+2. Here we should overwrite the updated PIC with the new ASI value. Note:
//    we may lose counts due to this. The only way to fix this is to put a mux in front of the adder during W+2.
// 2. Write to ASI in W+1 and add PIC in W+2. Here we should select the ASI value, otherwise,
//    we will lose the ASI data by overwriting it with the previous PIC + accumulator value.
// 3. Write to ASI in W+3 and add PIC in W+2. This works fine.
// 4. Write to ASI in W and add PIC in W+2. This works fine.
// We could disable the write during case 2) above which would guarantee that the ASI value always wins 
// over a current update. We could handle this either by forcing an add of 0 to the ASI value, or disabling writing the
// PIC with the ASI+accumulator in W+2. For now we choose the former, to avoid having 8 flops to degate pct_incr_pic_w2
// (below) if incr_asi was set the previous cycle.

// Decode for PIC write; force ASI over increment value if both happen during W2
assign pct_wr_pic_w2[7:0] = {8 {p_wr}} & atid[7:0];
//assign pct_incr_pic_w2[7:0] = {pic_std_w2[7:0]} & ~pct_wr_pic_w2[7:0];

// Selects for pre-add flop port...select asi if incrementing and writing
assign incr_asi[7:0] = pic_std_w1[7:0] & {8 {p_wr}} & atid[7:0];
assign pct_incr_asi_w1 = {|incr_asi[7:0]};

// Clock enable for pic07_w2 flop (adder for PIC incrementors)
//assign pct_pic07_w2_clken = pct_incr_asi_w1 | (|pct_pic_clken[7:0]);
// add in wr_pcr below - if pcr is not active now, but will be next cycle, need to make sure we
// select the proper pic value this cycle; else may add in wrong pic value (e.g., leftover from a previous thread)
assign pct_pic07_w2_clken = ~pmu_pmen | pct_incr_asi_w1 | (|(pic_std_w1[7:0] & (wr_pcr[7:0] | (
                            {|pcr7_dout[3:1],|pcr6_dout[3:1],|pcr5_dout[3:1],|pcr4_dout[3:1],
                             |pcr3_dout[3:1],|pcr2_dout[3:1],|pcr1_dout[3:1],|pcr0_dout[3:1]}))));


// Update PCR on write
assign wr_pcr[7:0] = {8 {pc_wr}} & atid[7:0];

// Clear PCR OV bits on read...
assign rd_pcr[7:0] = {8 {pc_rd}} & atid[7:0];

supply0 vss;
supply1 vdd;

pmu_pct_ctl_spare_ctl_macro__num_12 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// fixscan start:
assign pwrm_scanin               = scan_in                  ;
assign sleep_cnt_scanin          = pwrm_scanout             ;
assign hpstate_scanin            = sleep_cnt_scanout        ;
assign events_scanin             = hpstate_scanout          ;
assign lsutid_scanin             = events_scanout           ;
assign pcr0_scanin               = lsutid_scanout           ;
assign pcr0_ov_scanin            = pcr0_scanout             ;
assign pcr1_scanin               = pcr0_ov_scanout          ;
assign pcr1_ov_scanin            = pcr1_scanout             ;
assign pcr2_scanin               = pcr1_ov_scanout          ;
assign pcr2_ov_scanin            = pcr2_scanout             ;
assign pcr3_scanin               = pcr2_ov_scanout          ;
assign pcr3_ov_scanin            = pcr3_scanout             ;
assign pcr4_scanin               = pcr3_ov_scanout          ;
assign pcr4_ov_scanin            = pcr4_scanout             ;
assign pcr5_scanin               = pcr4_ov_scanout          ;
assign pcr5_ov_scanin            = pcr5_scanout             ;
assign pcr6_scanin               = pcr5_ov_scanout          ;
assign pcr6_ov_scanin            = pcr6_scanout             ;
assign pcr7_scanin               = pcr6_ov_scanout          ;
assign pcr7_ov_scanin            = pcr7_scanout             ;
assign pcr_ov_del_scanin         = pcr7_ov_scanout          ;
assign lsu_e2m_scanin            = pcr_ov_del_scanout       ;
assign tp_scanin                 = lsu_e2m_scanout          ;
assign tp1_scanin                = tp_scanout               ;
assign br_scanin                 = tp1_scanout              ;
assign ti_e2m_scanin             = br_scanout               ;
assign ti_m2b_scanin             = ti_e2m_scanout           ;
assign ti_b2w_scanin             = ti_m2b_scanout           ;
assign ti_w2w1_scanin            = ti_b2w_scanout           ;
assign pic_st_scanin             = ti_w2w1_scanout          ;
assign t0h_scanin                = pic_st_scanout           ;
assign t1h_scanin                = t0h_scanout              ;
assign t2h_scanin                = t1h_scanout              ;
assign t3h_scanin                = t2h_scanout              ;
assign t4h_scanin                = t3h_scanout              ;
assign t5h_scanin                = t4h_scanout              ;
assign t6h_scanin                = t5h_scanout              ;
assign t7h_scanin                = t6h_scanout              ;
assign t0l_scanin                = t7h_scanout              ;
assign t1l_scanin                = t0l_scanout              ;
assign t2l_scanin                = t1l_scanout              ;
assign t3l_scanin                = t2l_scanout              ;
assign t4l_scanin                = t3l_scanout              ;
assign t5l_scanin                = t4l_scanout              ;
assign t6l_scanin                = t5l_scanout              ;
assign t7l_scanin                = t6l_scanout              ;
assign accum_scanin              = t7l_scanout              ;
assign asi_scanin                = accum_scanout            ;
assign spares_scanin             = asi_scanout              ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module pmu_pct_ctl_l1clkhdr_ctl_macro (
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

module pmu_pct_ctl_msff_ctl_macro__width_5 (
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

module pmu_pct_ctl_msff_ctl_macro__width_4 (
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

module pmu_pct_ctl_msff_ctl_macro__width_16 (
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

module pmu_pct_ctl_msff_ctl_macro__width_66 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [65:0] fdin;
wire [64:0] so;

  input [65:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [65:0] dout;
  output scan_out;
assign fdin[65:0] = din[65:0];






dff #(66)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[65:0]),
.si({scan_in,so[64:0]}),
.so({so[64:0],scan_out}),
.q(dout[65:0])
);












endmodule













// any PARAMS parms go into naming of macro

module pmu_pct_ctl_msff_ctl_macro__width_9 (
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

module pmu_pct_ctl_msff_ctl_macro__width_30 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [29:0] fdin;
wire [28:0] so;

  input [29:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [29:0] dout;
  output scan_out;
assign fdin[29:0] = din[29:0];






dff #(30)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[29:0]),
.si({scan_in,so[28:0]}),
.so({so[28:0],scan_out}),
.q(dout[29:0])
);












endmodule













// any PARAMS parms go into naming of macro

module pmu_pct_ctl_msff_ctl_macro__width_2 (
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

module pmu_pct_ctl_msff_ctl_macro__width_28 (
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

module pmu_pct_ctl_msff_ctl_macro__width_32 (
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

module pmu_pct_ctl_msff_ctl_macro__width_8 (
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

module pmu_pct_ctl_msff_ctl_macro__width_24 (
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

module pmu_pct_ctl_msff_ctl_macro__width_18 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [17:0] fdin;
wire [16:0] so;

  input [17:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [17:0] dout;
  output scan_out;
assign fdin[17:0] = din[17:0];






dff #(18)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[17:0]),
.si({scan_in,so[16:0]}),
.so({so[16:0],scan_out}),
.q(dout[17:0])
);












endmodule













// any PARAMS parms go into naming of macro

module pmu_pct_ctl_msff_ctl_macro__width_14 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [13:0] fdin;
wire [12:0] so;

  input [13:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [13:0] dout;
  output scan_out;
assign fdin[13:0] = din[13:0];






dff #(14)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[13:0]),
.si({scan_in,so[12:0]}),
.so({so[12:0],scan_out}),
.q(dout[13:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module pmu_pct_ctl_spare_ctl_macro__num_12 (
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
wire si_7;
wire so_7;
wire spare7_flop_unused;
wire spare7_buf_32x_unused;
wire spare7_nand3_8x_unused;
wire spare7_inv_8x_unused;
wire spare7_aoi22_4x_unused;
wire spare7_buf_8x_unused;
wire spare7_oai22_4x_unused;
wire spare7_inv_16x_unused;
wire spare7_nand2_16x_unused;
wire spare7_nor3_4x_unused;
wire spare7_nand2_8x_unused;
wire spare7_buf_16x_unused;
wire spare7_nor2_16x_unused;
wire spare7_inv_32x_unused;
wire si_8;
wire so_8;
wire spare8_flop_unused;
wire spare8_buf_32x_unused;
wire spare8_nand3_8x_unused;
wire spare8_inv_8x_unused;
wire spare8_aoi22_4x_unused;
wire spare8_buf_8x_unused;
wire spare8_oai22_4x_unused;
wire spare8_inv_16x_unused;
wire spare8_nand2_16x_unused;
wire spare8_nor3_4x_unused;
wire spare8_nand2_8x_unused;
wire spare8_buf_16x_unused;
wire spare8_nor2_16x_unused;
wire spare8_inv_32x_unused;
wire si_9;
wire so_9;
wire spare9_flop_unused;
wire spare9_buf_32x_unused;
wire spare9_nand3_8x_unused;
wire spare9_inv_8x_unused;
wire spare9_aoi22_4x_unused;
wire spare9_buf_8x_unused;
wire spare9_oai22_4x_unused;
wire spare9_inv_16x_unused;
wire spare9_nand2_16x_unused;
wire spare9_nor3_4x_unused;
wire spare9_nand2_8x_unused;
wire spare9_buf_16x_unused;
wire spare9_nor2_16x_unused;
wire spare9_inv_32x_unused;
wire si_10;
wire so_10;
wire spare10_flop_unused;
wire spare10_buf_32x_unused;
wire spare10_nand3_8x_unused;
wire spare10_inv_8x_unused;
wire spare10_aoi22_4x_unused;
wire spare10_buf_8x_unused;
wire spare10_oai22_4x_unused;
wire spare10_inv_16x_unused;
wire spare10_nand2_16x_unused;
wire spare10_nor3_4x_unused;
wire spare10_nand2_8x_unused;
wire spare10_buf_16x_unused;
wire spare10_nor2_16x_unused;
wire spare10_inv_32x_unused;
wire si_11;
wire so_11;
wire spare11_flop_unused;
wire spare11_buf_32x_unused;
wire spare11_nand3_8x_unused;
wire spare11_inv_8x_unused;
wire spare11_aoi22_4x_unused;
wire spare11_buf_8x_unused;
wire spare11_oai22_4x_unused;
wire spare11_inv_16x_unused;
wire spare11_nand2_16x_unused;
wire spare11_nor3_4x_unused;
wire spare11_nand2_8x_unused;
wire spare11_buf_16x_unused;
wire spare11_nor2_16x_unused;
wire spare11_inv_32x_unused;


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

cl_sc1_msff_8x spare7_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_7),
                               .so(so_7),
                               .d(1'b0),
                               .q(spare7_flop_unused));
assign si_7 = so_6;

cl_u1_buf_32x   spare7_buf_32x (.in(1'b1),
                                   .out(spare7_buf_32x_unused));
cl_u1_nand3_8x spare7_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare7_nand3_8x_unused));
cl_u1_inv_8x    spare7_inv_8x (.in(1'b1),
                                  .out(spare7_inv_8x_unused));
cl_u1_aoi22_4x spare7_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_aoi22_4x_unused));
cl_u1_buf_8x    spare7_buf_8x (.in(1'b1),
                                  .out(spare7_buf_8x_unused));
cl_u1_oai22_4x spare7_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_oai22_4x_unused));
cl_u1_inv_16x   spare7_inv_16x (.in(1'b1),
                                   .out(spare7_inv_16x_unused));
cl_u1_nand2_16x spare7_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare7_nand2_16x_unused));
cl_u1_nor3_4x spare7_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare7_nor3_4x_unused));
cl_u1_nand2_8x spare7_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare7_nand2_8x_unused));
cl_u1_buf_16x   spare7_buf_16x (.in(1'b1),
                                   .out(spare7_buf_16x_unused));
cl_u1_nor2_16x spare7_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare7_nor2_16x_unused));
cl_u1_inv_32x   spare7_inv_32x (.in(1'b1),
                                   .out(spare7_inv_32x_unused));

cl_sc1_msff_8x spare8_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_8),
                               .so(so_8),
                               .d(1'b0),
                               .q(spare8_flop_unused));
assign si_8 = so_7;

cl_u1_buf_32x   spare8_buf_32x (.in(1'b1),
                                   .out(spare8_buf_32x_unused));
cl_u1_nand3_8x spare8_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare8_nand3_8x_unused));
cl_u1_inv_8x    spare8_inv_8x (.in(1'b1),
                                  .out(spare8_inv_8x_unused));
cl_u1_aoi22_4x spare8_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_aoi22_4x_unused));
cl_u1_buf_8x    spare8_buf_8x (.in(1'b1),
                                  .out(spare8_buf_8x_unused));
cl_u1_oai22_4x spare8_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_oai22_4x_unused));
cl_u1_inv_16x   spare8_inv_16x (.in(1'b1),
                                   .out(spare8_inv_16x_unused));
cl_u1_nand2_16x spare8_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare8_nand2_16x_unused));
cl_u1_nor3_4x spare8_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare8_nor3_4x_unused));
cl_u1_nand2_8x spare8_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare8_nand2_8x_unused));
cl_u1_buf_16x   spare8_buf_16x (.in(1'b1),
                                   .out(spare8_buf_16x_unused));
cl_u1_nor2_16x spare8_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare8_nor2_16x_unused));
cl_u1_inv_32x   spare8_inv_32x (.in(1'b1),
                                   .out(spare8_inv_32x_unused));

cl_sc1_msff_8x spare9_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_9),
                               .so(so_9),
                               .d(1'b0),
                               .q(spare9_flop_unused));
assign si_9 = so_8;

cl_u1_buf_32x   spare9_buf_32x (.in(1'b1),
                                   .out(spare9_buf_32x_unused));
cl_u1_nand3_8x spare9_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare9_nand3_8x_unused));
cl_u1_inv_8x    spare9_inv_8x (.in(1'b1),
                                  .out(spare9_inv_8x_unused));
cl_u1_aoi22_4x spare9_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_aoi22_4x_unused));
cl_u1_buf_8x    spare9_buf_8x (.in(1'b1),
                                  .out(spare9_buf_8x_unused));
cl_u1_oai22_4x spare9_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_oai22_4x_unused));
cl_u1_inv_16x   spare9_inv_16x (.in(1'b1),
                                   .out(spare9_inv_16x_unused));
cl_u1_nand2_16x spare9_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare9_nand2_16x_unused));
cl_u1_nor3_4x spare9_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare9_nor3_4x_unused));
cl_u1_nand2_8x spare9_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare9_nand2_8x_unused));
cl_u1_buf_16x   spare9_buf_16x (.in(1'b1),
                                   .out(spare9_buf_16x_unused));
cl_u1_nor2_16x spare9_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare9_nor2_16x_unused));
cl_u1_inv_32x   spare9_inv_32x (.in(1'b1),
                                   .out(spare9_inv_32x_unused));

cl_sc1_msff_8x spare10_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_10),
                               .so(so_10),
                               .d(1'b0),
                               .q(spare10_flop_unused));
assign si_10 = so_9;

cl_u1_buf_32x   spare10_buf_32x (.in(1'b1),
                                   .out(spare10_buf_32x_unused));
cl_u1_nand3_8x spare10_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare10_nand3_8x_unused));
cl_u1_inv_8x    spare10_inv_8x (.in(1'b1),
                                  .out(spare10_inv_8x_unused));
cl_u1_aoi22_4x spare10_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare10_aoi22_4x_unused));
cl_u1_buf_8x    spare10_buf_8x (.in(1'b1),
                                  .out(spare10_buf_8x_unused));
cl_u1_oai22_4x spare10_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare10_oai22_4x_unused));
cl_u1_inv_16x   spare10_inv_16x (.in(1'b1),
                                   .out(spare10_inv_16x_unused));
cl_u1_nand2_16x spare10_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare10_nand2_16x_unused));
cl_u1_nor3_4x spare10_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare10_nor3_4x_unused));
cl_u1_nand2_8x spare10_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare10_nand2_8x_unused));
cl_u1_buf_16x   spare10_buf_16x (.in(1'b1),
                                   .out(spare10_buf_16x_unused));
cl_u1_nor2_16x spare10_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare10_nor2_16x_unused));
cl_u1_inv_32x   spare10_inv_32x (.in(1'b1),
                                   .out(spare10_inv_32x_unused));

cl_sc1_msff_8x spare11_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_11),
                               .so(so_11),
                               .d(1'b0),
                               .q(spare11_flop_unused));
assign si_11 = so_10;

cl_u1_buf_32x   spare11_buf_32x (.in(1'b1),
                                   .out(spare11_buf_32x_unused));
cl_u1_nand3_8x spare11_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare11_nand3_8x_unused));
cl_u1_inv_8x    spare11_inv_8x (.in(1'b1),
                                  .out(spare11_inv_8x_unused));
cl_u1_aoi22_4x spare11_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare11_aoi22_4x_unused));
cl_u1_buf_8x    spare11_buf_8x (.in(1'b1),
                                  .out(spare11_buf_8x_unused));
cl_u1_oai22_4x spare11_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare11_oai22_4x_unused));
cl_u1_inv_16x   spare11_inv_16x (.in(1'b1),
                                   .out(spare11_inv_16x_unused));
cl_u1_nand2_16x spare11_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare11_nand2_16x_unused));
cl_u1_nor3_4x spare11_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare11_nor3_4x_unused));
cl_u1_nand2_8x spare11_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare11_nand2_8x_unused));
cl_u1_buf_16x   spare11_buf_16x (.in(1'b1),
                                   .out(spare11_buf_16x_unused));
cl_u1_nor2_16x spare11_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare11_nor2_16x_unused));
cl_u1_inv_32x   spare11_inv_32x (.in(1'b1),
                                   .out(spare11_inv_32x_unused));
assign scan_out = so_11;



endmodule

