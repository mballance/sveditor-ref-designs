// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pmu.v
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
module pmu (
  in_rngl_cdbus, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_bclk, 
  spc_aclk, 
  tcu_scan_en, 
  lsu_pmu_pmen, 
  lsu_asi_clken, 
  scan_out, 
  pmu_rngl_cdbus, 
  dec_pmu_instr0_type_d, 
  dec_pmu_instr1_type_d, 
  lsu_pmu_mem_type_b, 
  dec_br_taken_e, 
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
  dec_valid_e, 
  dec_flush_m, 
  dec_flush_b, 
  tlu_flush_pmu_b, 
  tlu_flush_pmu_w, 
  pmu_tlu_trap_m, 
  pmu_tlu_debug_event, 
  pmu_lsu_dcmiss_trap_m, 
  pmu_lsu_dtmiss_trap_m, 
  pmu_lsu_l2dmiss_trap_m);
wire pmu_pdp_dp_scanin;
wire pmu_pdp_dp_scanout;
wire pmu_pct_ctl_scanin;
wire pmu_pct_ctl_scanout;
wire [7:0] pct_rd_pic;
wire pct_rd_a_pic;
wire pct_rd_pic_pcr;
wire pct_bypass_asi;
wire [31:0] pct_pcr_data;
wire pct_exception;
wire [7:0] pct_pic_clken;
wire pct_pic07_w2_clken;
wire [7:0] pct_wr_pic_w2;
wire [6:0] pct_incr_pic_w1;
wire pct_incr_asi_w1;
wire [3:0] pct_pich07_add_w2;
wire [3:0] pct_picl07_add_w2;
wire pmu_asi_clken;
wire [31:0] pdp_asi_din_to_pctl;
wire [7:0] pdp_asi_ctlin_to_pctl_15_8;
wire [4:0] pdp_asi_ctlin_to_pctl_4_0;
wire pdp_pich_cout07;
wire pdp_picl_cout07;
wire [7:0] pdp_pich_wrap;
wire [7:0] pdp_picl_wrap;


input	[64:0]	in_rngl_cdbus;		// ASI local ring data in

input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input 		spc_bclk;
input 		spc_aclk;
input		tcu_scan_en;

// Power management
input		lsu_pmu_pmen;
input		lsu_asi_clken;

output		scan_out;

output	[64:0]  pmu_rngl_cdbus;		// ASI local ring data out 

// Instruction decode events
input	[12:0]	dec_pmu_instr0_type_d;	// {12 - valid; 11:10 - tid; 9:0 - {atomic_d, l2imiss, itmiss, icmiss, other, %sethi, store, load, FGU, branch}}
input	[12:0]	dec_pmu_instr1_type_d;
input	[5:0]	lsu_pmu_mem_type_b;	// {5:3 - tid (use for l2miss only); 2:0 - {l2 d-miss, dt_miss, d-cache miss}}
input	[1:0]	dec_br_taken_e;		// branch taken indicator
input		dec_lsu_sel0_d;		// select tg0 for LSU tid

// MMU activity (excluding ITLB/DTLB misses)
input 	        mmu_pmu_l2ret;          // indicates l2 data to MMU
input           mmu_pmu_l2miss;         // indicates the return pkt had l2 miss
input           mmu_pmu_dtlb;           // indicates that return pkt is for D-side table walk
input   [2:0]   mmu_pmu_tid;   		// thread id

// Crossbar activity
input	[6:0]	l15_pmu_xbar_optype;	// {6 - valid; 5:3 - tid; 2:0 - {111 - mastore; 110 - maload; 101 - ifetch; 100 - mmuld; 011 - cwqstore; 010 - cwqload; 001 - cpustore; 000 - cpuld}}

// SPU activity
input	[4:0]	spu_pmu_cwq_busy;	// CWQ busy {rc4,hash,des,crc,aes}
input	[2:0]	spu_pmu_cwq_tid;
input	[3:0]	spu_pmu_ma_busy;	// {3 - busy/idle; 2:0 - tid}

// state bits to decide when counters should record
input	[7:0] 	tlu_pmu_pstate_priv;	// pstate.priv for each thread (bit 7 == thread 7)
input	[7:0]	tlu_pmu_hpstate_hpriv;	// hpstate.hpriv (ditto)

// PMU trap is taken, reset the counter if "-"ve.
input   [7:0]   tlu_pmu_trap_taken;
input	[1:0]	tlu_pmu_trap_mask_e;	// True if TLU enabled for PMU trap {1 - tg1; 0 - tg0}

// Flushes from IFU and TLU
input   [1:0]	dec_valid_e;		// bit 1 is for TG1, 0 for TG0; 
                                        //instr valid in the e-stage (taken flush_e into consideration?)

input	[1:0]	dec_flush_m;		// bit 1 is for TG1, 0 for TG0
input	[1:0]	dec_flush_b;		// bit 1 is for TG1, 0 for TG0
input	[1:0]	tlu_flush_pmu_b;	// bit 1 is for TG1, 0 for TG0
input	[1:0]	tlu_flush_pmu_w;	// bit 1 is for TG1, 0 for TG0

// Signals to tell TLU if we may/should trap due to counter overflow
output	[7:0]	pmu_tlu_trap_m;		// Sent at beginning of M to TLU
output	[7:0]	pmu_tlu_debug_event;	// Tell trap if a perf. monitor event occurred to soft/hard stop/trigger on

// Signals to LSU for trap on DCmiss, DTmiss, L2Dmiss
output		pmu_lsu_dcmiss_trap_m;
output		pmu_lsu_dtmiss_trap_m;
output	[7:0]	pmu_lsu_l2dmiss_trap_m;

pmu_pdp_dp pmu_pdp_dp( 	
	.scan_in(pmu_pdp_dp_scanin),
	.scan_out(pmu_pdp_dp_scanout),
	.l2clk(l2clk),
	.pmu_rngl_cdbus(pmu_rngl_cdbus[63:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .in_rngl_cdbus(in_rngl_cdbus[63:0]),
  .pct_rd_pic(pct_rd_pic[7:0]),
  .pct_rd_a_pic(pct_rd_a_pic),
  .pct_rd_pic_pcr(pct_rd_pic_pcr),
  .pct_bypass_asi(pct_bypass_asi),
  .pct_pcr_data(pct_pcr_data[31:0]),
  .pct_exception(pct_exception),
  .pct_pic_clken(pct_pic_clken[7:0]),
  .pct_pic07_w2_clken(pct_pic07_w2_clken),
  .pct_wr_pic_w2(pct_wr_pic_w2[7:0]),
  .pct_incr_pic_w1(pct_incr_pic_w1[6:0]),
  .pct_incr_asi_w1(pct_incr_asi_w1),
  .pct_pich07_add_w2(pct_pich07_add_w2[3:0]),
  .pct_picl07_add_w2(pct_picl07_add_w2[3:0]),
  .pmu_asi_clken(pmu_asi_clken),
  .pdp_asi_din_to_pctl(pdp_asi_din_to_pctl[31:0]),
  .pdp_asi_ctlin_to_pctl_15_8(pdp_asi_ctlin_to_pctl_15_8[7:0]),
  .pdp_asi_ctlin_to_pctl_4_0(pdp_asi_ctlin_to_pctl_4_0[4:0]),
  .pdp_pich_cout07(pdp_pich_cout07),
  .pdp_picl_cout07(pdp_picl_cout07),
  .pdp_pich_wrap(pdp_pich_wrap[7:0]),
  .pdp_picl_wrap(pdp_picl_wrap[7:0])
	);

pmu_pct_ctl pmu_pct_ctl( 
	.in_rngl_cdbus_ctl_ndata(in_rngl_cdbus[64]),
        .pct_rngl_cdbus_ctl_ndata(pmu_rngl_cdbus[64]),                        
        .scan_in(pmu_pct_ctl_scanin),
        .scan_out(pmu_pct_ctl_scanout),
        .l2clk(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .lsu_asi_clken(lsu_asi_clken),
  .lsu_pmu_pmen(lsu_pmu_pmen),
  .dec_pmu_instr0_type_d(dec_pmu_instr0_type_d[12:0]),
  .dec_pmu_instr1_type_d(dec_pmu_instr1_type_d[12:0]),
  .dec_br_taken_e(dec_br_taken_e[1:0]),
  .lsu_pmu_mem_type_b(lsu_pmu_mem_type_b[5:0]),
  .dec_lsu_sel0_d(dec_lsu_sel0_d),
  .mmu_pmu_l2ret(mmu_pmu_l2ret),
  .mmu_pmu_l2miss(mmu_pmu_l2miss),
  .mmu_pmu_dtlb(mmu_pmu_dtlb),
  .mmu_pmu_tid(mmu_pmu_tid[2:0]),
  .l15_pmu_xbar_optype(l15_pmu_xbar_optype[6:0]),
  .spu_pmu_cwq_busy(spu_pmu_cwq_busy[4:0]),
  .spu_pmu_cwq_tid(spu_pmu_cwq_tid[2:0]),
  .spu_pmu_ma_busy(spu_pmu_ma_busy[3:0]),
  .tlu_pmu_pstate_priv(tlu_pmu_pstate_priv[7:0]),
  .tlu_pmu_hpstate_hpriv(tlu_pmu_hpstate_hpriv[7:0]),
  .tlu_pmu_trap_taken(tlu_pmu_trap_taken[7:0]),
  .tlu_pmu_trap_mask_e(tlu_pmu_trap_mask_e[1:0]),
  .tlu_flush_pmu_b(tlu_flush_pmu_b[1:0]),
  .tlu_flush_pmu_w(tlu_flush_pmu_w[1:0]),
  .dec_valid_e(dec_valid_e[1:0]),
  .dec_flush_m(dec_flush_m[1:0]),
  .dec_flush_b(dec_flush_b[1:0]),
  .pdp_pich_cout07(pdp_pich_cout07),
  .pdp_picl_cout07(pdp_picl_cout07),
  .pdp_pich_wrap(pdp_pich_wrap[7:0]),
  .pdp_picl_wrap(pdp_picl_wrap[7:0]),
  .pdp_asi_ctlin_to_pctl_15_8(pdp_asi_ctlin_to_pctl_15_8[7:0]),
  .pdp_asi_ctlin_to_pctl_4_0(pdp_asi_ctlin_to_pctl_4_0[4:0]),
  .pdp_asi_din_to_pctl(pdp_asi_din_to_pctl[31:0]),
  .pmu_tlu_trap_m(pmu_tlu_trap_m[7:0]),
  .pmu_tlu_debug_event(pmu_tlu_debug_event[7:0]),
  .pct_pich07_add_w2(pct_pich07_add_w2[3:0]),
  .pct_picl07_add_w2(pct_picl07_add_w2[3:0]),
  .pmu_lsu_dcmiss_trap_m(pmu_lsu_dcmiss_trap_m),
  .pmu_lsu_dtmiss_trap_m(pmu_lsu_dtmiss_trap_m),
  .pmu_lsu_l2dmiss_trap_m(pmu_lsu_l2dmiss_trap_m[7:0]),
  .pct_rd_pic(pct_rd_pic[7:0]),
  .pct_rd_a_pic(pct_rd_a_pic),
  .pct_rd_pic_pcr(pct_rd_pic_pcr),
  .pct_bypass_asi(pct_bypass_asi),
  .pct_pcr_data(pct_pcr_data[31:0]),
  .pct_exception(pct_exception),
  .pct_wr_pic_w2(pct_wr_pic_w2[7:0]),
  .pct_incr_pic_w1(pct_incr_pic_w1[6:0]),
  .pct_incr_asi_w1(pct_incr_asi_w1),
  .pct_pic_clken(pct_pic_clken[7:0]),
  .pct_pic07_w2_clken(pct_pic07_w2_clken),
  .pmu_asi_clken(pmu_asi_clken)
	);

// fixscan start:
assign pmu_pdp_dp_scanin         = scan_in                  ;
assign pmu_pct_ctl_scanin        = pmu_pdp_dp_scanout       ;
assign scan_out                  = pmu_pct_ctl_scanout      ;
// fixscan end:
endmodule

