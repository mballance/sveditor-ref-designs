// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_sbs_ctl.v
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
module lsu_sbs_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
  sbc_cam_wvld_m, 
  sbc_st_sel_p3, 
  sbc_bst_sel, 
  sbc_rmo_st_b, 
  sbc_st_addr_new, 
  sbc_bst_b, 
  sbc_bst_in_prog_b, 
  sbc_fgu_ecc_b, 
  sbc_bst_rd_err, 
  sbc_sbs_kill_store_p4_, 
  sbc_tte_vld_b, 
  sbc_blk_inst_b, 
  dec_flush_lm, 
  dec_flush_lb, 
  tlu_flush_lsu_b, 
  spd_st_line_match, 
  dcc_asi_store_b, 
  dcc_asi_iomap_b, 
  dcc_asi_rngf_b, 
  dcc_asi_indet_b, 
  dcc_sync_inst_w, 
  dcc_casa_inst_b, 
  dcc_pst_asi_b, 
  dcc_st_rq_type_w, 
  dcc_exception_flush_b, 
  tlb_tte_ie_b, 
  cic_st_ack, 
  cic_st_dequeue, 
  cic_rmo_dequeue, 
  pic_st_sel_p3, 
  dcc_asi_rtn_vld, 
  dcc_asi_rtn_excp, 
  dcc_asi_rtn_rd, 
  lsu_lsu_pmen_, 
  sbs_stb_wptr_m, 
  sbs_stb_rptr, 
  sbs_pcx_rq_vld, 
  sbs_atm_rq_vld, 
  sbs_asi_rq_vld, 
  sbs_state_vld, 
  sbs_state_ced, 
  sbs_state_asi_rngf, 
  sbs_pcx_pst_ie_p4, 
  sbs_all_commited, 
  sbs_stb_empty, 
  sbs_stb_full, 
  sbs_bst_req, 
  sbs_sync, 
  sbs_asi_indet_req, 
  sbs_asi_indet_retire, 
  sbs_rmo_st_p4, 
  sbs_blk_st_p4, 
  sbs_st_type, 
  lsu_stb_alloc, 
  lsu_stb_dealloc, 
  lsu_block_store_kill, 
  lsu_stb_empty);
wire se;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire sbs_clken;
wire stb_cam_wvld_b;
wire stb_alloc_w;
wire bst_pend;
wire l1clk;
wire l1clk_pm1;
wire dff_flush_b_scanin;
wire dff_flush_b_scanout;
wire pipe_flush_b;
wire flush_b;
wire dff_flush_w_scanin;
wire dff_flush_w_scanout;
wire flush_w;
wire dff_cam_wvld_b_scanin;
wire dff_cam_wvld_b_scanout;
wire kill_store_p4;
wire st_commit_p4;
wire dff_st_dq_scanin;
wire dff_st_dq_scanout;
wire block_store_kill;
wire st_dequeue_d1;
wire kill_store_p5;
wire [7:0] dec_rptr_pcx;
wire [7:0] dec_stb_rptr;
wire [7:0] stb_state_vld;
wire [7:0] stb_state_ced;
wire [7:0] stb_state_ack;
wire [7:0] stb_state_mem;
wire [7:0] stb_state_rmo;
wire [7:0] stb_state_asi;
wire [7:0] dec_dqptr;
wire [4:0] rmo_count;
wire sbs_rmo_st;
wire bst_err;
wire [7:0] stb_state_cas;
wire [3:0] stb_rptr_inc;
wire [3:0] stb_rptr;
wire [3:0] stb_rptr_in;
wire stb_commit_entry;
wire flush_bst_inst;
wire bst_kill;
wire dff_rptr_scanin;
wire dff_rptr_scanout;
wire [3:0] stb_wptr_incr;
wire [3:0] stb_wptr;
wire flush_st_w;
wire [3:0] stb_wptr_decr;
wire [3:0] stb_wptr_in;
wire dff_wptr_scanin;
wire dff_wptr_scanout;
wire dff_wptr_b_scanin;
wire dff_wptr_b_scanout;
wire [2:0] stb_wptr_b;
wire [7:0] dec_wptr_b;
wire dff_wptr_w_scanin;
wire dff_wptr_w_scanout;
wire [2:0] stb_wptr_w;
wire [7:0] dec_wptr_w;
wire stb_empty;
wire rmo_st_commit_p4;
wire sbs_last_entry;
wire stb_flush_state;
wire [2:0] dqptr_in;
wire stb_flush_done;
wire [2:0] dqptr;
wire dff_dqptr_scanin;
wire dff_dqptr_scanout;
wire [7:0] stb_state_rst;
wire rmo_st_commit_p3;
wire set_valid_b;
wire [7:0] stb_state_vld_set;
wire [7:0] stb_state_vld_din;
wire dff_stb_vld_scanin;
wire dff_stb_vld_scanout;
wire [7:0] stb_state_vld_out;
wire set_valid_w;
wire [7:0] misc_state_wr;
wire stb_alloc_b;
wire dff_stb_alloc_w_scanin;
wire dff_stb_alloc_w_scanout;
wire st_commit_p3;
wire dff_st_commit_p4_scanin;
wire dff_st_commit_p4_scanout;
wire [7:0] stb_state_ced_set;
wire [7:0] stb_state_ced_din;
wire dff_stb_ced_scanin;
wire dff_stb_ced_scanout;
wire [2:0] ackptr_in;
wire [2:0] ackptr;
wire dff_ackptr_scanin;
wire dff_ackptr_scanout;
wire [7:0] dec_ackptr;
wire [7:0] stb_state_ack_set;
wire pipe_store_w;
wire [7:0] stb_state_ack_rst;
wire [7:0] stb_state_ack_din;
wire dff_stb_ack_scanin;
wire dff_stb_ack_scanout;
wire dff_asi_w_scanin;
wire dff_asi_w_scanout;
wire asi_store_w;
wire asi_rngf_w;
wire rmo_st_w;
wire last_st_asi;
wire last_st_asi_d1;
wire last_asi_ring;
wire last_asi_ring_d1;
wire last_st_rmo;
wire last_st_rmo_d1;
wire dff_asi_pipe_scanin;
wire dff_asi_pipe_scanout;
wire pipe_store_b;
wire [2:0] sbs_state_in;
wire [2:0] stb_state_0_din;
wire [2:0] sbs_state_0;
wire [2:0] stb_state_1_din;
wire [2:0] sbs_state_1;
wire [2:0] stb_state_2_din;
wire [2:0] sbs_state_2;
wire [2:0] stb_state_3_din;
wire [2:0] sbs_state_3;
wire [2:0] stb_state_4_din;
wire [2:0] sbs_state_4;
wire [2:0] stb_state_5_din;
wire [2:0] sbs_state_5;
wire [2:0] stb_state_6_din;
wire [2:0] sbs_state_6;
wire [2:0] stb_state_7_din;
wire [2:0] sbs_state_7;
wire dff_state_0_scanin;
wire dff_state_0_scanout;
wire dff_state_1_scanin;
wire dff_state_1_scanout;
wire dff_state_2_scanin;
wire dff_state_2_scanout;
wire dff_state_3_scanin;
wire dff_state_3_scanout;
wire dff_state_4_scanin;
wire dff_state_4_scanout;
wire dff_state_5_scanin;
wire dff_state_5_scanout;
wire dff_state_6_scanin;
wire dff_state_6_scanout;
wire dff_state_7_scanin;
wire dff_state_7_scanout;
wire sbs_blk_st;
wire [7:0] stb_state_indet;
wire asi_error;
wire sync_state;
wire sync_state_out;
wire sync_state_rst;
wire sync_state_in;
wire dff_sync_state_scanin;
wire dff_sync_state_scanout;
wire trap_sync;
wire dff_sbs_sync_scanin;
wire dff_sbs_sync_scanout;
wire bst_pend_in;
wire bst_w;
wire dff_bst_pend_scanin;
wire dff_bst_pend_scanout;
wire bst_pend_out;
wire blk_inst_w;
wire dff_bst_err_scanin;
wire dff_bst_err_scanout;
wire bst_err_next;
wire [4:0] rmo_count_dec;
wire [4:0] rmo_count_in;
wire blk_st_commit_p3;
wire dff_rmo_count_scanin;
wire dff_rmo_count_scanout;
wire [4:0] rmo_count_out;
wire blk_st_commit_p4;
wire dff_rmo_commit_scanin;
wire dff_rmo_commit_scanout;
wire rmo_st_commit_p5;
wire rmo_commit_p5;
wire pst_ie_b;
wire dff_pst_ie_scanin;
wire dff_pst_ie_scanout;
wire pst_ie_in;
wire pst_ie_w;
wire pst_ie;
wire [1:0] st_type_in;
wire [1:0] st_type;
wire dff_st_type_scanin;
wire dff_st_type_scanout;
wire stb_flush_set;
wire stb_flush_clr;
wire stb_flush_in;
wire dff_stb_flush_scanin;
wire dff_stb_flush_scanout;
wire spares_scanin;
wire spares_scanout;


input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input		tcu_scan_en;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;

input		sbc_cam_wvld_m;		// CAM is writing for this thread
input		sbc_st_sel_p3;		// This thread was selected (not ld/st P3 qualified)
input		sbc_bst_sel;
input		sbc_rmo_st_b;
input		sbc_st_addr_new;
input		sbc_bst_b;		// signals block store for this thread
input		sbc_bst_in_prog_b;	// signals block store for any thread
input		sbc_fgu_ecc_b;		// FRF ECC error in B (only used for block store)
input		sbc_bst_rd_err;		// FRF ECC error in B (only used for block store)
input		sbc_sbs_kill_store_p4_;
input		sbc_tte_vld_b;		// tlb_miss not accounted for 
input		sbc_blk_inst_b;

input		dec_flush_lm;
input		dec_flush_lb;
input		tlu_flush_lsu_b;

input		spd_st_line_match;	// Store in B is to same line as previous

input		dcc_asi_store_b;
input		dcc_asi_iomap_b;
input		dcc_asi_rngf_b;
input		dcc_asi_indet_b;
input		dcc_sync_inst_w;
input		dcc_casa_inst_b;
input		dcc_pst_asi_b;
input	[1:0]	dcc_st_rq_type_w;
input		dcc_exception_flush_b;

input		tlb_tte_ie_b;

input		cic_st_ack;		// Store from this thread is acked
input		cic_st_dequeue;		// Dequeue the store from this thread.
input		cic_rmo_dequeue;	// RMO ack received

input		pic_st_sel_p3;		// Store wins ld/st arbitration in P3

input		dcc_asi_rtn_vld;
input		dcc_asi_rtn_excp;
input		dcc_asi_rtn_rd;

input		lsu_lsu_pmen_;

output	[2:0]	sbs_stb_wptr_m;	
output	[2:0]	sbs_stb_rptr;	
output		sbs_pcx_rq_vld;
output		sbs_atm_rq_vld;
output		sbs_asi_rq_vld;
output	[7:0]	sbs_state_vld;
output	[7:0]	sbs_state_ced;
output		sbs_state_asi_rngf;
output		sbs_pcx_pst_ie_p4;
output		sbs_all_commited;
output		sbs_stb_empty;
output		sbs_stb_full;
output		sbs_bst_req;
output		sbs_sync;
output		sbs_asi_indet_req;	// Indeterminate ASI store selected for issue
output		sbs_asi_indet_retire;	// Indeterminate ASI store retired
output		sbs_rmo_st_p4;
output		sbs_blk_st_p4;
output	[1:0]	sbs_st_type;

output		lsu_stb_alloc;
output		lsu_stb_dealloc;
output		lsu_block_store_kill;
output		lsu_stb_empty;

// scan renames
assign se = tcu_scan_en;
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;
// end scan

//////////////////////////////////////////
// Clock header and power mangagement
//////////////////////////////////////////

// Clocks run when a store is in M/B/W of the pipe and anytime the store buffer is not empty
assign sbs_clken = sbc_cam_wvld_m | stb_cam_wvld_b | stb_alloc_w | bst_pend | ~sbs_stb_empty | lsu_lsu_pmen_;

lsu_sbs_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk),
        .l1en   (1'b1 ),
        .l1clk  (l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

lsu_sbs_ctl_l1clkhdr_ctl_macro clkgenpm (
        .l2clk  (l2clk    ),
        .l1en   (sbs_clken),
        .l1clk  (l1clk_pm1 ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

//////////////////////////////
// Flush logic
//////////////////////////////

lsu_sbs_ctl_msff_ctl_macro__width_1 dff_flush_b  (
	.scan_in(dff_flush_b_scanin),
	.scan_out(dff_flush_b_scanout),
	.din	(dec_flush_lm),
	.dout	(pipe_flush_b),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign flush_b = tlu_flush_lsu_b | dec_flush_lb | pipe_flush_b | dcc_exception_flush_b;

lsu_sbs_ctl_msff_ctl_macro__width_1 dff_flush_w  (
	.scan_in(dff_flush_w_scanin),
	.scan_out(dff_flush_w_scanout),
	.din	(flush_b),
	.dout	(flush_w),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////

lsu_sbs_ctl_msff_ctl_macro__width_1 dff_cam_wvld_b  (
	.scan_in(dff_cam_wvld_b_scanin),
	.scan_out(dff_cam_wvld_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	(sbc_cam_wvld_m),
	.dout	(stb_cam_wvld_b),
  .siclk(siclk),
  .soclk(soclk)
);

assign kill_store_p4 = st_commit_p4 & ~sbc_sbs_kill_store_p4_;

lsu_sbs_ctl_msff_ctl_macro__width_3 dff_st_dq  (
	.scan_in(dff_st_dq_scanin),
	.scan_out(dff_st_dq_scanout),
	.din	({(cic_st_dequeue | dcc_asi_rtn_vld & ~dcc_asi_rtn_rd),kill_store_p4,block_store_kill}),
	.dout	({st_dequeue_d1,                                       kill_store_p5,lsu_block_store_kill}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// Assertion to check for STB overflow
// 0in multi_enq_deq_fifo -enq stb_cam_wvld_b -deq flush_st_w lsu_stb_dealloc bst_kill bst_kill bst_kill bst_kill bst_kill bst_kill bst_kill bst_kill (kill_store_p4 & ~(rmo_st_commit_p4 & ~stb_flush_state) & ~sbc_bst_sel) flush_bst_inst -depth 8

////////////////////////////////////////////////////////////////////////////////
// STB Read Pointer
////////////////////////////////////////////////////////////////////////////////
// A store can be sent to the pcx if the previous entry has been acked, or if 
// the it is addressed to the same L2 cache line (addr[39:6]) as the previous
// store.  Stores to IO cannot be pipelined.  Conditions for release are
// (1) Entry is valid and not already sent to pcx. AND
// (2) Previous entry is invalid or
// (3) Previous entry is valid and 
//  (a) mem store - prev. entry is acked OR (non-rmo only)
//  (b) asi store - prev. entry is asi and acked
//     If a store can be pipelined, the ack for the previous store will be set.
// The dec_dqptr term at the end is to prevent a deadlock condition where
// all entries are valid but none have been committed.

// Timing : this is very critical.  Some improvement could be made by
// decoding dec_stb_rptr and/or dec_dqptr in the previous cycle.
assign dec_rptr_pcx[7:0] =
         dec_stb_rptr[7:0] & stb_state_vld[7:0] & ~stb_state_ced[7:0] &		// --> (1)
          (~{stb_state_vld[6:0],stb_state_vld[7]} |				// --> (2)
           ({stb_state_vld[6:0],stb_state_vld[7]} &				// --> (3)
            {stb_state_ack[6:0],stb_state_ack[7]} &
            (stb_state_mem[7:0] & ~stb_state_rmo[7:0]) |			// --> (3a)
            (stb_state_asi[7:0] & {stb_state_asi[6:0],stb_state_asi[7]}) 	// --> (3b)
           ) |		
            dec_dqptr[7:0]);

// Max number of RMO stores outstanding is 8.  When 8 are out, rmo stores are blocked.
assign sbs_pcx_rq_vld = |(dec_rptr_pcx[7:0] & stb_state_mem[7:0]) & ~(rmo_count[4] & sbs_rmo_st) & ~bst_err;
assign sbs_atm_rq_vld = |(dec_rptr_pcx[7:0] & stb_state_cas[7:0]);
assign sbs_asi_rq_vld = |(dec_rptr_pcx[7:0] & stb_state_asi[7:0]);

assign stb_rptr_inc[3:0] = stb_rptr[3:0] + 4'b0001;

// Bit 3 must "wrap" when the buffer is flushed on a bst_kill error
assign stb_rptr_in[3] = ((stb_commit_entry | flush_bst_inst) ? stb_rptr_inc[3] : stb_rptr[3]) ^ bst_kill;
assign stb_rptr_in[2:0] = (stb_commit_entry | flush_bst_inst) ? stb_rptr_inc[2:0] : stb_rptr[2:0];

lsu_sbs_ctl_msff_ctl_macro__width_4 dff_rptr  (
	.scan_in(dff_rptr_scanin),
	.scan_out(dff_rptr_scanout),
	.l1clk	(l1clk_pm1),
	.din	(stb_rptr_in[3:0]),
	.dout	(stb_rptr[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign sbs_stb_rptr[2:0] = stb_rptr[2:0];

assign dec_stb_rptr[0] = ~stb_rptr[2] & ~stb_rptr[1] & ~stb_rptr[0];
assign dec_stb_rptr[1] = ~stb_rptr[2] & ~stb_rptr[1] &  stb_rptr[0];
assign dec_stb_rptr[2] = ~stb_rptr[2] &  stb_rptr[1] & ~stb_rptr[0];
assign dec_stb_rptr[3] = ~stb_rptr[2] &  stb_rptr[1] &  stb_rptr[0];
assign dec_stb_rptr[4] =  stb_rptr[2] & ~stb_rptr[1] & ~stb_rptr[0];
assign dec_stb_rptr[5] =  stb_rptr[2] & ~stb_rptr[1] &  stb_rptr[0];
assign dec_stb_rptr[6] =  stb_rptr[2] &  stb_rptr[1] & ~stb_rptr[0];
assign dec_stb_rptr[7] =  stb_rptr[2] &  stb_rptr[1] &  stb_rptr[0];

////////////////////////////////////////////////////////////////////////////////
// STB Write Pointer
////////////////////////////////////////////////////////////////////////////////

// A valid entry causes the pointer to increment.
// A flushed store instruction decrements the pointer.

assign stb_wptr_incr[3:0] = stb_wptr[3:0] + {3'b000,~flush_st_w};
assign stb_wptr_decr[3:0] = stb_wptr[3:0] - {3'b000,flush_st_w};

assign stb_wptr_in[3:0] = sbc_cam_wvld_m ? stb_wptr_incr[3:0] : stb_wptr_decr[3:0];

lsu_sbs_ctl_msff_ctl_macro__width_4 dff_wptr  (
	.scan_in(dff_wptr_scanin),
	.scan_out(dff_wptr_scanout),
	.l1clk	(l1clk_pm1),
	.din	(stb_wptr_in[3:0]),
	.dout	(stb_wptr[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign sbs_stb_wptr_m[2:0] = stb_wptr[2:0];

lsu_sbs_ctl_msff_ctl_macro__width_3 dff_wptr_b  (
	.scan_in(dff_wptr_b_scanin),
	.scan_out(dff_wptr_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	(stb_wptr[2:0]),
	.dout	(stb_wptr_b[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign dec_wptr_b[0] = ~stb_wptr_b[2] & ~stb_wptr_b[1] & ~stb_wptr_b[0];
assign dec_wptr_b[1] = ~stb_wptr_b[2] & ~stb_wptr_b[1] &  stb_wptr_b[0];
assign dec_wptr_b[2] = ~stb_wptr_b[2] &  stb_wptr_b[1] & ~stb_wptr_b[0];
assign dec_wptr_b[3] = ~stb_wptr_b[2] &  stb_wptr_b[1] &  stb_wptr_b[0];
assign dec_wptr_b[4] =  stb_wptr_b[2] & ~stb_wptr_b[1] & ~stb_wptr_b[0];
assign dec_wptr_b[5] =  stb_wptr_b[2] & ~stb_wptr_b[1] &  stb_wptr_b[0];
assign dec_wptr_b[6] =  stb_wptr_b[2] &  stb_wptr_b[1] & ~stb_wptr_b[0];
assign dec_wptr_b[7] =  stb_wptr_b[2] &  stb_wptr_b[1] &  stb_wptr_b[0];

lsu_sbs_ctl_msff_ctl_macro__width_3 dff_wptr_w  (
	.scan_in(dff_wptr_w_scanin),
	.scan_out(dff_wptr_w_scanout),
	.l1clk	(l1clk_pm1),
	.din	(stb_wptr_b[2:0]),
	.dout	(stb_wptr_w[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign dec_wptr_w[0] = ~stb_wptr_w[2] & ~stb_wptr_w[1] & ~stb_wptr_w[0];
assign dec_wptr_w[1] = ~stb_wptr_w[2] & ~stb_wptr_w[1] &  stb_wptr_w[0];
assign dec_wptr_w[2] = ~stb_wptr_w[2] &  stb_wptr_w[1] & ~stb_wptr_w[0];
assign dec_wptr_w[3] = ~stb_wptr_w[2] &  stb_wptr_w[1] &  stb_wptr_w[0];
assign dec_wptr_w[4] =  stb_wptr_w[2] & ~stb_wptr_w[1] & ~stb_wptr_w[0];
assign dec_wptr_w[5] =  stb_wptr_w[2] & ~stb_wptr_w[1] &  stb_wptr_w[0];
assign dec_wptr_w[6] =  stb_wptr_w[2] &  stb_wptr_w[1] & ~stb_wptr_w[0];
assign dec_wptr_w[7] =  stb_wptr_w[2] &  stb_wptr_w[1] &  stb_wptr_w[0];

assign stb_empty = ~|(stb_state_vld[7:0]) & (rmo_count[4:0] == 5'd0) & ~rmo_st_commit_p4;
assign sbs_stb_empty = stb_empty & ~bst_pend & ~(sbc_cam_wvld_m | stb_cam_wvld_b | stb_alloc_w);
assign lsu_stb_empty = stb_empty & ~bst_pend;

// Might be able to speed this up by comparing stb_wptr_decr == stb_rptr_inc
// in previous cycle and flopping down.  I'd still have to deal with the
// stb_flush_done part though.
assign sbs_last_entry = (stb_wptr[3:0] == stb_rptr[3:0]);

assign sbs_stb_full = &(stb_state_vld[7:0]);

////////////////////////////////////////////////////////////////////////////////
// Control state
////////////////////////////////////////////////////////////////////////////////

// State is reset when an entry is dequeued and when a store gets flushed.
// 0in bits_on -var {st_dequeue_d1,(rmo_st_commit_p4 & ~stb_flush_state)} -max 1 -message "multiple stores retiring simultaneously"
assign lsu_stb_dealloc = st_dequeue_d1 | (rmo_st_commit_p4 & ~stb_flush_state); 

assign dqptr_in[2:0] = stb_flush_done ? stb_wptr[2:0] : (dqptr[2:0] + {2'b00, lsu_stb_dealloc});

lsu_sbs_ctl_msff_ctl_macro__width_3 dff_dqptr  (
	.scan_in(dff_dqptr_scanin),
	.scan_out(dff_dqptr_scanout),
	.din	(dqptr_in[2:0]),
	.dout	(dqptr[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
assign dec_dqptr[0] = ~dqptr[2] & ~dqptr[1] & ~dqptr[0];
assign dec_dqptr[1] = ~dqptr[2] & ~dqptr[1] &  dqptr[0];
assign dec_dqptr[2] = ~dqptr[2] &  dqptr[1] & ~dqptr[0];
assign dec_dqptr[3] = ~dqptr[2] &  dqptr[1] &  dqptr[0];
assign dec_dqptr[4] =  dqptr[2] & ~dqptr[1] & ~dqptr[0];
assign dec_dqptr[5] =  dqptr[2] & ~dqptr[1] &  dqptr[0];
assign dec_dqptr[6] =  dqptr[2] &  dqptr[1] & ~dqptr[0];
assign dec_dqptr[7] =  dqptr[2] &  dqptr[1] &  dqptr[0];

assign stb_state_rst[7:0] = ({8{st_dequeue_d1}}                  & dec_dqptr[7:0]) | 
                            ({8{rmo_st_commit_p3}}               & dec_stb_rptr[7:0]) | 
                            ({dec_stb_rptr[0],dec_stb_rptr[7:1]} & {8{kill_store_p5}}) |
                            (dec_wptr_w[7:0]                     & {8{flush_st_w}}) |
                            {8{bst_kill}};

// Valid state. Set when a store is written to the STB.  Cleared when the store
//		updates the cache.  The valid state is set in W.  If the store
//              in W must be flushed, disqualify the valid bit and reset the state.

assign set_valid_b = stb_cam_wvld_b & ~sbc_blk_inst_b;

assign stb_state_vld_set[7:0] = dec_wptr_b[7:0] & {8{set_valid_b}};

assign stb_state_vld_din[7:0] = stb_state_vld_set[7:0] |
				 (~stb_state_rst[7:0] & stb_state_vld[7:0]);

lsu_sbs_ctl_msff_ctl_macro__width_9 dff_stb_vld  (
	.scan_in(dff_stb_vld_scanin),
	.scan_out(dff_stb_vld_scanout),
	.l1clk	(l1clk_pm1),
	.din	({stb_state_vld_din[7:0],set_valid_b}),
	.dout	({stb_state_vld_out[7:0],    set_valid_w}),
  .siclk(siclk),
  .soclk(soclk)
);
assign stb_state_vld[7:0] = stb_state_vld_out[7:0] & ~({8{flush_st_w}} & dec_wptr_w[7:0]);

// Used for enabling CAM lookup on the next cycle
assign sbs_state_vld[7:0] = stb_state_mem[7:0] | (misc_state_wr[7:0] & {8{~dcc_asi_store_b}});

assign stb_alloc_b = stb_cam_wvld_b;

lsu_sbs_ctl_msff_ctl_macro__width_1 dff_stb_alloc_w  (
	.scan_in(dff_stb_alloc_w_scanin),
	.scan_out(dff_stb_alloc_w_scanout),
	.l1clk	(l1clk_pm1),
	.din	(stb_alloc_b),
	.dout	(stb_alloc_w),
  .siclk(siclk),
  .soclk(soclk)
);
assign lsu_stb_alloc = stb_alloc_w & ~flush_w;
assign flush_st_w = stb_alloc_w & flush_w;


// Commited State. Set when a store is issued to the pcx.

// 0in bits_on -var {(sbc_st_sel_p3 & pic_st_sel_p3),sbc_bst_sel,flush_bst_inst} -max 1 -message "multiple stores commiting"

assign flush_bst_inst = bst_pend & stb_flush_state & stb_empty & ~(sbc_cam_wvld_m | stb_cam_wvld_b | stb_alloc_w);

assign stb_commit_entry = (sbc_st_sel_p3 & pic_st_sel_p3) | sbc_bst_sel;

assign st_commit_p3 = sbc_st_sel_p3 & pic_st_sel_p3;
lsu_sbs_ctl_msff_ctl_macro__width_1 dff_st_commit_p4  (
	.scan_in(dff_st_commit_p4_scanin),
	.scan_out(dff_st_commit_p4_scanout),
	.l1clk	(l1clk_pm1),
	.din	(st_commit_p3),
	.dout	(st_commit_p4),
  .siclk(siclk),
  .soclk(soclk)
);


assign stb_state_ced_set[7:0] = dec_stb_rptr[7:0] & {8{stb_commit_entry}};

assign stb_state_ced_din[7:0] = ~stb_state_rst[7:0] &
                                  (stb_state_ced_set[7:0] | stb_state_ced[7:0]);

lsu_sbs_ctl_msff_ctl_macro__width_8 dff_stb_ced  (
	.scan_in(dff_stb_ced_scanin),
	.scan_out(dff_stb_ced_scanout),
	.l1clk	(l1clk_pm1),
	.din	(stb_state_ced_din[7:0]),
	.dout	(stb_state_ced[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign sbs_state_ced[7:0] = stb_state_ced[7:0];
assign sbs_all_commited = &(~stb_state_vld[7:0] | stb_state_ced[7:0]);

// Acked State. Set when a store ack is received from the CPX.  We do not have
//              to wait for the ack to reach the head of the CPQ since the
//              arrival on the CPX means the L2 has the store and will enforce
//              ordering requirements.
//		Ack state is automatically set when the "next" store can
//		be pipelined.  Ack state is cleared when a store is first
//		written to prevent stray acks.

// 0in bits_on -var {cic_st_ack,sbc_bst_sel,(rmo_st_commit_p4 & ~stb_flush_state),(dcc_asi_rtn_vld & ~dcc_asi_rtn_rd)} -max 1 -message "multiple acks received"
assign ackptr_in[2:0] = stb_flush_done ? stb_wptr[2:0] : 
             (ackptr[2:0] + {2'b00, (cic_st_ack | (dcc_asi_rtn_vld & ~dcc_asi_rtn_rd) | sbc_bst_sel | rmo_st_commit_p4)});

lsu_sbs_ctl_msff_ctl_macro__width_3 dff_ackptr  (
	.scan_in(dff_ackptr_scanin),
	.scan_out(dff_ackptr_scanout),
	.din	(ackptr_in[2:0]),
	.dout	(ackptr[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign dec_ackptr[0] = ~ackptr[2] & ~ackptr[1] & ~ackptr[0];
assign dec_ackptr[1] = ~ackptr[2] & ~ackptr[1] &  ackptr[0];
assign dec_ackptr[2] = ~ackptr[2] &  ackptr[1] & ~ackptr[0];
assign dec_ackptr[3] = ~ackptr[2] &  ackptr[1] &  ackptr[0];
assign dec_ackptr[4] =  ackptr[2] & ~ackptr[1] & ~ackptr[0];
assign dec_ackptr[5] =  ackptr[2] & ~ackptr[1] &  ackptr[0];
assign dec_ackptr[6] =  ackptr[2] &  ackptr[1] & ~ackptr[0];
assign dec_ackptr[7] =  ackptr[2] &  ackptr[1] &  ackptr[0];

assign stb_state_ack_set[7:0] = (dec_ackptr[7:0] & {8{cic_st_ack | (dcc_asi_rtn_vld & ~dcc_asi_rtn_rd)}}) |
                                ({dec_wptr_w[0],dec_wptr_w[7:1]} & {8{pipe_store_w & set_valid_w & ~flush_w}});

assign stb_state_ack_rst[7:0] = stb_state_rst[7:0] | (dec_wptr_b[7:0] & {8{stb_cam_wvld_b}});

assign stb_state_ack_din[7:0] = ~stb_state_ack_rst[7:0] & (stb_state_ack_set[7:0] | stb_state_ack[7:0]);

lsu_sbs_ctl_msff_ctl_macro__width_8 dff_stb_ack  (
	.scan_in(dff_stb_ack_scanin),
	.scan_out(dff_stb_ack_scanout),
	.l1clk	(l1clk_pm1),
	.din	(stb_state_ack_din[7:0]),
	.dout	(stb_state_ack[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// Stores are pipelinable if they are to the same L2 cache line,
// to the same ring for ASI stores, and they are not IO stores.

lsu_sbs_ctl_msff_ctl_macro__width_3 dff_asi_w  (
	.scan_in(dff_asi_w_scanin),
	.scan_out(dff_asi_w_scanout),
	.l1clk	(l1clk_pm1),
	.din	({dcc_asi_store_b,dcc_asi_rngf_b,sbc_rmo_st_b}),
	.dout	({asi_store_w,    asi_rngf_w,    rmo_st_w}),
  .siclk(siclk),
  .soclk(soclk)
);

assign last_st_asi   = sbc_st_addr_new ? asi_store_w : last_st_asi_d1  ;
assign last_asi_ring = sbc_st_addr_new ? asi_rngf_w  : last_asi_ring_d1;
assign last_st_rmo   = sbc_st_addr_new ? rmo_st_w    : last_st_rmo_d1  ;

lsu_sbs_ctl_msff_ctl_macro__width_4 dff_asi_pipe  (
	.scan_in(dff_asi_pipe_scanin),
	.scan_out(dff_asi_pipe_scanout),
	.l1clk	(l1clk_pm1),
	.din	({last_st_asi,last_asi_ring,      last_st_rmo,   pipe_store_b}),
	.dout	({last_st_asi_d1,last_asi_ring_d1,last_st_rmo_d1,pipe_store_w}),
  .siclk(siclk),
  .soclk(soclk)
);

assign pipe_store_b = (dcc_asi_store_b ~^ last_st_asi) &			// asi/non-asi must match
                      (sbc_rmo_st_b ~^ last_st_rmo) &				// rmo must match
                      ~dcc_asi_indet_b &					// indeterminate ASI's never pipeline
                      ~dcc_asi_iomap_b &					// iomapped ASI's never pipeline
                      ((~dcc_asi_store_b & spd_st_line_match) |			// non-asi must be same L2 line
                       (dcc_asi_store_b & (last_asi_ring ~^ dcc_asi_rngf_b)));	// asi must be same ring

////////////////////////////////////////////////////////////////////////////////
// Misc information. The information differs between asi and non-asi stores
//              2      1     0
// ASI     |   1'b0 | ind | fast |
//
//              2      1     0
// non-ASI |   1'b1 | CAS | rmo  |
//
// Use [2:0] = 111 to signal a block store type
////////////////////////////////////////////////////////////////////////////////

assign misc_state_wr[7:0] = dec_wptr_b[7:0] & {8{stb_cam_wvld_b & ~sbc_blk_inst_b}};

assign sbs_state_in[2:0] = (dcc_asi_store_b & ~dcc_asi_iomap_b) ? 
     {1'b0,dcc_asi_indet_b,dcc_asi_rngf_b} :
     {1'b1,(dcc_casa_inst_b | sbc_bst_b),sbc_rmo_st_b};

assign stb_state_0_din[2:0] = {3{~stb_state_rst[0]}} & (misc_state_wr[0] ? sbs_state_in[2:0] : sbs_state_0[2:0]);
assign stb_state_1_din[2:0] = {3{~stb_state_rst[1]}} & (misc_state_wr[1] ? sbs_state_in[2:0] : sbs_state_1[2:0]);
assign stb_state_2_din[2:0] = {3{~stb_state_rst[2]}} & (misc_state_wr[2] ? sbs_state_in[2:0] : sbs_state_2[2:0]);
assign stb_state_3_din[2:0] = {3{~stb_state_rst[3]}} & (misc_state_wr[3] ? sbs_state_in[2:0] : sbs_state_3[2:0]);
assign stb_state_4_din[2:0] = {3{~stb_state_rst[4]}} & (misc_state_wr[4] ? sbs_state_in[2:0] : sbs_state_4[2:0]);
assign stb_state_5_din[2:0] = {3{~stb_state_rst[5]}} & (misc_state_wr[5] ? sbs_state_in[2:0] : sbs_state_5[2:0]);
assign stb_state_6_din[2:0] = {3{~stb_state_rst[6]}} & (misc_state_wr[6] ? sbs_state_in[2:0] : sbs_state_6[2:0]);
assign stb_state_7_din[2:0] = {3{~stb_state_rst[7]}} & (misc_state_wr[7] ? sbs_state_in[2:0] : sbs_state_7[2:0]);

lsu_sbs_ctl_msff_ctl_macro__width_3 dff_state_0  (
	.scan_in(dff_state_0_scanin),
	.scan_out(dff_state_0_scanout),
	.l1clk	(l1clk_pm1),
	.din	(stb_state_0_din[2:0]),
	.dout	(sbs_state_0[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);
lsu_sbs_ctl_msff_ctl_macro__width_3 dff_state_1  (
	.scan_in(dff_state_1_scanin),
	.scan_out(dff_state_1_scanout),
	.l1clk	(l1clk_pm1),
	.din	(stb_state_1_din[2:0]),
	.dout	(sbs_state_1[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);
lsu_sbs_ctl_msff_ctl_macro__width_3 dff_state_2  (
	.scan_in(dff_state_2_scanin),
	.scan_out(dff_state_2_scanout),
	.l1clk	(l1clk_pm1),
	.din	(stb_state_2_din[2:0]),
	.dout	(sbs_state_2[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);
lsu_sbs_ctl_msff_ctl_macro__width_3 dff_state_3  (
	.scan_in(dff_state_3_scanin),
	.scan_out(dff_state_3_scanout),
	.l1clk	(l1clk_pm1),
	.din	(stb_state_3_din[2:0]),
	.dout	(sbs_state_3[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);
lsu_sbs_ctl_msff_ctl_macro__width_3 dff_state_4  (
	.scan_in(dff_state_4_scanin),
	.scan_out(dff_state_4_scanout),
	.l1clk	(l1clk_pm1),
	.din	(stb_state_4_din[2:0]),
	.dout	(sbs_state_4[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);
lsu_sbs_ctl_msff_ctl_macro__width_3 dff_state_5  (
	.scan_in(dff_state_5_scanin),
	.scan_out(dff_state_5_scanout),
	.l1clk	(l1clk_pm1),
	.din	(stb_state_5_din[2:0]),
	.dout	(sbs_state_5[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);
lsu_sbs_ctl_msff_ctl_macro__width_3 dff_state_6  (
	.scan_in(dff_state_6_scanin),
	.scan_out(dff_state_6_scanout),
	.l1clk	(l1clk_pm1),
	.din	(stb_state_6_din[2:0]),
	.dout	(sbs_state_6[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);
lsu_sbs_ctl_msff_ctl_macro__width_3 dff_state_7  (
	.scan_in(dff_state_7_scanin),
	.scan_out(dff_state_7_scanout),
	.l1clk	(l1clk_pm1),
	.din	(stb_state_7_din[2:0]),
	.dout	(sbs_state_7[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign stb_state_mem[7:0] = {sbs_state_7[2],sbs_state_6[2],sbs_state_5[2],sbs_state_4[2],
                             sbs_state_3[2],sbs_state_2[2],sbs_state_1[2],sbs_state_0[2]};
assign stb_state_asi[7:0] = ~stb_state_mem[7:0];

assign sbs_state_asi_rngf = (dec_stb_rptr[0] & sbs_state_0[0]) |
                            (dec_stb_rptr[1] & sbs_state_1[0]) |
                            (dec_stb_rptr[2] & sbs_state_2[0]) |
                            (dec_stb_rptr[3] & sbs_state_3[0]) |
                            (dec_stb_rptr[4] & sbs_state_4[0]) |
                            (dec_stb_rptr[5] & sbs_state_5[0]) |
                            (dec_stb_rptr[6] & sbs_state_6[0]) |
                            (dec_stb_rptr[7] & sbs_state_7[0]);

assign sbs_rmo_st = (dec_stb_rptr[0] & stb_state_mem[0] & sbs_state_0[0]) |
                    (dec_stb_rptr[1] & stb_state_mem[1] & sbs_state_1[0]) |
                    (dec_stb_rptr[2] & stb_state_mem[2] & sbs_state_2[0]) |
                    (dec_stb_rptr[3] & stb_state_mem[3] & sbs_state_3[0]) |
                    (dec_stb_rptr[4] & stb_state_mem[4] & sbs_state_4[0]) |
                    (dec_stb_rptr[5] & stb_state_mem[5] & sbs_state_5[0]) |
                    (dec_stb_rptr[6] & stb_state_mem[6] & sbs_state_6[0]) |
                    (dec_stb_rptr[7] & stb_state_mem[7] & sbs_state_7[0]) ;

assign stb_state_rmo[7:0] = {sbs_state_7[0],sbs_state_6[0],sbs_state_5[0],sbs_state_4[0],
                             sbs_state_3[0],sbs_state_2[0],sbs_state_1[0],sbs_state_0[0]};

assign sbs_blk_st = (dec_stb_rptr[0] & stb_state_mem[0] & sbs_state_0[1] & sbs_state_0[0]) |
                    (dec_stb_rptr[1] & stb_state_mem[1] & sbs_state_1[1] & sbs_state_1[0]) |
                    (dec_stb_rptr[2] & stb_state_mem[2] & sbs_state_2[1] & sbs_state_2[0]) |
                    (dec_stb_rptr[3] & stb_state_mem[3] & sbs_state_3[1] & sbs_state_3[0]) |
                    (dec_stb_rptr[4] & stb_state_mem[4] & sbs_state_4[1] & sbs_state_4[0]) |
                    (dec_stb_rptr[5] & stb_state_mem[5] & sbs_state_5[1] & sbs_state_5[0]) |
                    (dec_stb_rptr[6] & stb_state_mem[6] & sbs_state_6[1] & sbs_state_6[0]) |
                    (dec_stb_rptr[7] & stb_state_mem[7] & sbs_state_7[1] & sbs_state_7[0]) ;

assign stb_state_indet[7:0] = {sbs_state_7[1] & stb_state_asi[7],
                               sbs_state_6[1] & stb_state_asi[6],
                               sbs_state_5[1] & stb_state_asi[5],
                               sbs_state_4[1] & stb_state_asi[4],
                               sbs_state_3[1] & stb_state_asi[3],
                               sbs_state_2[1] & stb_state_asi[2],
                               sbs_state_1[1] & stb_state_asi[1],
                               sbs_state_0[1] & stb_state_asi[0]
};

assign sbs_asi_indet_req = |(stb_state_indet[7:0] & dec_stb_rptr[7:0]);
assign sbs_asi_indet_retire = |(stb_state_indet[7:0] & dec_dqptr[7:0]) & st_dequeue_d1;

assign stb_state_cas[7:0] = {sbs_state_7[1] & ~sbs_state_7[0],
                             sbs_state_6[1] & ~sbs_state_6[0],
                             sbs_state_5[1] & ~sbs_state_5[0],
                             sbs_state_4[1] & ~sbs_state_4[0],
                             sbs_state_3[1] & ~sbs_state_3[0],
                             sbs_state_2[1] & ~sbs_state_2[0],
                             sbs_state_1[1] & ~sbs_state_1[0],
                             sbs_state_0[1] & ~sbs_state_0[0]};

////////////////////////////////////////////////////////////////////////////////
// Synchronizing instruction (flush/membar/stbar) tracking
// The thread will postsync on one of these instructions.  Once the store
// buffer is empty, a trap flush will restart the thread.
////////////////////////////////////////////////////////////////////////////////

assign asi_error = dcc_asi_rtn_vld & dcc_asi_rtn_excp;

assign sync_state = dcc_sync_inst_w | sync_state_out;

assign sync_state_rst = (sync_state & sbs_stb_empty) | asi_error;

assign sync_state_in = (dcc_sync_inst_w | sync_state_out) & ~sync_state_rst;

lsu_sbs_ctl_msff_ctl_macro__width_1 dff_sync_state  (
	.scan_in(dff_sync_state_scanin),
	.scan_out(dff_sync_state_scanout),
	.din	(sync_state_in),
	.dout	(sync_state_out),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trap_sync = sync_state_rst & ~asi_error;

lsu_sbs_ctl_msff_ctl_macro__width_1 dff_sbs_sync  (
	.scan_in(dff_sbs_sync_scanin),
	.scan_out(dff_sbs_sync_scanout),
	.din	(trap_sync),
	.dout	(sbs_sync),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////////////
// Block stores
////////////////////////////////////////////////////////////////////////////////

// Simultaneous set and reset could be a problem so check for it.
// 0in bits_on -var {(stb_alloc_w & blk_inst_w & ~flush_w),(bst_w & ~sbc_bst_b)} -max 1
assign bst_pend_in = (bst_pend & ~(bst_w & ~sbc_bst_b)) & ~flush_bst_inst;

lsu_sbs_ctl_msff_ctl_macro__width_3 dff_bst_pend  (
	.scan_in(dff_bst_pend_scanin),
	.scan_out(dff_bst_pend_scanout),
	.l1clk	(l1clk_pm1),
	.din	({bst_pend_in, sbc_bst_b,sbc_blk_inst_b}),
	.dout	({bst_pend_out,bst_w,        blk_inst_w}),
  .siclk(siclk),
  .soclk(soclk)
);

assign bst_pend = (stb_alloc_w & blk_inst_w & ~flush_w) | bst_pend_out;

assign sbs_bst_req = bst_pend & ~bst_w & ~|(stb_state_vld[7:0]);
//assign sbs_bst_req = |(dec_stb_rptr[7:0] & ~stb_state_vld[7:0] & ~{stb_state_vld[6:0],stb_state_vld[7]} & stb_state_mem[7:0] & stb_state_cas[7:0]); 

// If an error occurs on any one of the 8 FRF reads, kill the entire bst
lsu_sbs_ctl_msff_ctl_macro__width_1 dff_bst_err  (
	.scan_in(dff_bst_err_scanin),
	.scan_out(dff_bst_err_scanout),
	.l1clk	(l1clk_pm1),
	.din	(bst_err_next),
	.dout	(bst_err),
  .siclk(siclk),
  .soclk(soclk)
);

assign bst_err_next = sbc_bst_b & (bst_err | sbc_fgu_ecc_b | sbc_bst_rd_err);
assign bst_kill = bst_w & ~sbc_bst_in_prog_b & bst_err;

////////////////////////////////////////////////////////////////////////////////
// RMO store counting
// Count the number of RMO stores outstanding to the L2.  The store buffer is
// not considered empty until all entries are dequeued AND there are no outstanding
// RMO stores.
// The counter is incremented in P5 when an RMO store is selected for issue
// The counter is decremented when the ack comes back from L2
////////////////////////////////////////////////////////////////////////////////

assign rmo_count_dec[4:0] = rmo_count[4:0] - 5'b00001;

assign rmo_st_commit_p3 = sbs_rmo_st & (sbc_st_sel_p3 & pic_st_sel_p3);

assign rmo_count_in[4:0] = cic_rmo_dequeue ? rmo_count_dec[4:0] : rmo_count[4:0];

assign blk_st_commit_p3 = sbs_blk_st & (sbc_st_sel_p3 & pic_st_sel_p3);

lsu_sbs_ctl_msff_ctl_macro__width_7 dff_rmo_count  (
	.scan_in(dff_rmo_count_scanin),
	.scan_out(dff_rmo_count_scanout),
	.l1clk	(l1clk_pm1),
	.din	({rmo_count_in[4:0], rmo_st_commit_p3,blk_st_commit_p3}),
	.dout	({rmo_count_out[4:0],rmo_st_commit_p4,blk_st_commit_p4}),
  .siclk(siclk),
  .soclk(soclk)
);

lsu_sbs_ctl_msff_ctl_macro__width_1 dff_rmo_commit  (
	.scan_in(dff_rmo_commit_scanin),
	.scan_out(dff_rmo_commit_scanout),
	.din	(rmo_st_commit_p4),
	.dout	(rmo_st_commit_p5),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign rmo_commit_p5 = rmo_st_commit_p5 & ~kill_store_p5;
assign rmo_count[4:0] = rmo_count_out[4:0] + {4'b0000,rmo_commit_p5};

// 0in overflow -var rmo_count[4:0] -message "rmo counter overflow"
// 0in underflow -var rmo_count[4:0] -message "rmo counter underflow"

assign sbs_rmo_st_p4 = rmo_st_commit_p4;
assign sbs_blk_st_p4 = blk_st_commit_p4;

////////////////////////////////////////////////////////////////////////////////
// Tracking of partial stores with TTE.IE=1
// Because the byte mask is written to the CAM in B, but the TTE is not read until
// B, a partial store instruction with TTE.IE=1 will have it's stored byte mask
// with the wrong endianess.  We need to indicate when this store is issuing so
// that the mask can be reversed.
////////////////////////////////////////////////////////////////////////////////

assign pst_ie_b = dcc_pst_asi_b & stb_cam_wvld_b & tlb_tte_ie_b & sbc_tte_vld_b;

lsu_sbs_ctl_msff_ctl_macro__width_2 dff_pst_ie  (
	.scan_in(dff_pst_ie_scanin),
	.scan_out(dff_pst_ie_scanout),
	.l1clk	(l1clk_pm1),
	.din	({pst_ie_b,pst_ie_in}),
	.dout	({pst_ie_w,pst_ie}),
  .siclk(siclk),
  .soclk(soclk)
);

assign pst_ie_in = (pst_ie_w & ~flush_w) | (pst_ie & ~sbs_pcx_pst_ie_p4);

assign sbs_pcx_pst_ie_p4 = pst_ie & sbs_last_entry & st_commit_p4;

////////////////////////////////////////////////////////////////////////////////
// Instruction type storage
// The type of store is held here.  All "non-standard" stores are synchronizing,
// so this value is only valid when reading the last entry in the stb
// ASI - 00=ASI, 01=SR, 10=PR, 11=HPR
// mem - 00=store, 01=CAS, 10=unused, 11=SWAP

assign st_type_in[1:0] = lsu_stb_alloc ? dcc_st_rq_type_w[1:0] : st_type[1:0];

lsu_sbs_ctl_msff_ctl_macro__width_2 dff_st_type  (
	.scan_in(dff_st_type_scanin),
	.scan_out(dff_st_type_scanout),
	.l1clk	(l1clk_pm1),
	.din	(st_type_in[1:0]),
	.dout	(st_type[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign sbs_st_type[1:0] = st_type[1:0] & {2{sbs_last_entry}};

////////////////////////////////////////////////////////////////////////////////
// Cleanup for store buffer flush
// Once all stores have been killed due to a fatal error, the pick counters
// must be cleared and the dqptr reset.

assign stb_flush_set = kill_store_p5;
assign stb_flush_clr = stb_empty & ~bst_pend & ~(sbc_cam_wvld_m | stb_cam_wvld_b | stb_alloc_w);
assign stb_flush_in = (stb_flush_set | stb_flush_state) & ~stb_flush_clr;

lsu_sbs_ctl_msff_ctl_macro__width_2 dff_stb_flush  (
	.scan_in(dff_stb_flush_scanin),
	.scan_out(dff_stb_flush_scanout),
	.din	({stb_flush_in   ,((stb_flush_state | stb_flush_set) & stb_flush_clr)}),
	.dout	({stb_flush_state,stb_flush_done}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign block_store_kill = bst_kill | stb_flush_done;


lsu_sbs_ctl_spare_ctl_macro__num_3 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

supply0 vss;
supply1 vdd;
// fixscan start:
assign dff_flush_b_scanin        = scan_in                  ;
assign dff_flush_w_scanin        = dff_flush_b_scanout      ;
assign dff_cam_wvld_b_scanin     = dff_flush_w_scanout      ;
assign dff_st_dq_scanin          = dff_cam_wvld_b_scanout   ;
assign dff_rptr_scanin           = dff_st_dq_scanout        ;
assign dff_wptr_scanin           = dff_rptr_scanout         ;
assign dff_wptr_b_scanin         = dff_wptr_scanout         ;
assign dff_wptr_w_scanin         = dff_wptr_b_scanout       ;
assign dff_dqptr_scanin          = dff_wptr_w_scanout       ;
assign dff_stb_vld_scanin        = dff_dqptr_scanout        ;
assign dff_stb_alloc_w_scanin    = dff_stb_vld_scanout      ;
assign dff_st_commit_p4_scanin   = dff_stb_alloc_w_scanout  ;
assign dff_stb_ced_scanin        = dff_st_commit_p4_scanout ;
assign dff_ackptr_scanin         = dff_stb_ced_scanout      ;
assign dff_stb_ack_scanin        = dff_ackptr_scanout       ;
assign dff_asi_w_scanin          = dff_stb_ack_scanout      ;
assign dff_asi_pipe_scanin       = dff_asi_w_scanout        ;
assign dff_state_0_scanin        = dff_asi_pipe_scanout     ;
assign dff_state_1_scanin        = dff_state_0_scanout      ;
assign dff_state_2_scanin        = dff_state_1_scanout      ;
assign dff_state_3_scanin        = dff_state_2_scanout      ;
assign dff_state_4_scanin        = dff_state_3_scanout      ;
assign dff_state_5_scanin        = dff_state_4_scanout      ;
assign dff_state_6_scanin        = dff_state_5_scanout      ;
assign dff_state_7_scanin        = dff_state_6_scanout      ;
assign dff_sync_state_scanin     = dff_state_7_scanout      ;
assign dff_sbs_sync_scanin       = dff_sync_state_scanout   ;
assign dff_bst_pend_scanin       = dff_sbs_sync_scanout     ;
assign dff_bst_err_scanin        = dff_bst_pend_scanout     ;
assign dff_rmo_count_scanin      = dff_bst_err_scanout      ;
assign dff_rmo_commit_scanin     = dff_rmo_count_scanout    ;
assign dff_pst_ie_scanin         = dff_rmo_commit_scanout   ;
assign dff_st_type_scanin        = dff_pst_ie_scanout       ;
assign dff_stb_flush_scanin      = dff_st_type_scanout      ;
assign spares_scanin             = dff_stb_flush_scanout    ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module lsu_sbs_ctl_l1clkhdr_ctl_macro (
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

module lsu_sbs_ctl_msff_ctl_macro__width_1 (
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

module lsu_sbs_ctl_msff_ctl_macro__width_3 (
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

module lsu_sbs_ctl_msff_ctl_macro__width_4 (
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

module lsu_sbs_ctl_msff_ctl_macro__width_9 (
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

module lsu_sbs_ctl_msff_ctl_macro__width_8 (
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

module lsu_sbs_ctl_msff_ctl_macro__width_7 (
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

module lsu_sbs_ctl_msff_ctl_macro__width_2 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module lsu_sbs_ctl_spare_ctl_macro__num_3 (
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
assign scan_out = so_2;



endmodule

