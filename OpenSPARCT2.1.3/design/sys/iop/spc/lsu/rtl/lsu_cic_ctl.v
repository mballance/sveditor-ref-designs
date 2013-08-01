// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_cic_ctl.v
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
module lsu_cic_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
  const_cpuid, 
  cpx_pkt_vld, 
  cid_d1_rtntyp, 
  cid_d1_wv, 
  cid_d1_tid, 
  cid_d1_rmo, 
  cid_d1_pref, 
  cid_d1_cpuid, 
  cid_d1_inval, 
  cid_tid, 
  cid_cpuid, 
  cid_pkt_type, 
  cid_xinval, 
  cid_pref, 
  cid_inv_vec, 
  cid_atomic, 
  cid_rmo_ack, 
  cid_set_inval, 
  cid_set_icinval, 
  cid_st_addr, 
  cid_st_vector, 
  cid_cpq_cmp_1, 
  cid_cpq_cmp_2, 
  cid_cpq_cmp_3, 
  dcc_cache_diag_wr_b, 
  dec_ld_inst_d, 
  fgu_fdiv_stall, 
  lmc_ldd_vld, 
  sbc_bst_sel, 
  mbi_run, 
  mbi_cpq_read_en, 
  mbi_cpq_write_en, 
  mbi_addr, 
  lbist_run, 
  cic_cpq_wptr, 
  cic_cpq_rptr, 
  cic_cpq_rd_en, 
  cic_cpq_wr_en, 
  cic_d1_sel, 
  cic_cpq_sel, 
  cic_fifo_sel, 
  cic_byp_sel, 
  cic_fifo_clken, 
  cic_l2fill_vld_e, 
  cic_cpq_ld_rdy, 
  cic_cpq_ld_rdy_, 
  cic_cpq_ld_sel, 
  cic_div_stall_d, 
  cic_st_update_e, 
  cic_rtn_cmplt, 
  cic_invalidate_e, 
  cic_xinval_e, 
  cic_set_inval, 
  cic_xinval, 
  cic_oddrd_e, 
  cic_st_dequeue, 
  cic_rmo_dequeue, 
  cic_st_ack, 
  cic_inv_wen_e, 
  cic_cpq_stall, 
  cic_diag_data_sel_e, 
  cic_ext_interrupt, 
  lsu_dcsoc_err_g, 
  lsu_ext_interrupt, 
  cic_mbi_run, 
  lsu_mbi_cpq_fail);
wire se;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire l1clk;
wire [7:0] dec_cpuid;
wire [7:0] cpq_tid;
wire cpq_atomic;
wire cpq_rmo_ack;
wire dff_cpq_state_scanin;
wire dff_cpq_state_scanout;
wire state_fifo;
wire fifo_dff_enable;
wire last_state_fifo;
wire fifo_clken_last;
wire state_d1;
wire lsu_type_d1;
wire sel_byp_last;
wire cpq_pkt_done;
wire state_cpq;
wire [5:0] cpq_rptr;
wire [5:0] cpq_wptr;
wire sel_d1_last;
wire mbi_run_local;
wire block_cpq_d;
wire dff_cpq_sel_scanin;
wire dff_cpq_sel_scanout;
wire cpq_wr_en;
wire [5:0] cpq_wptr_inc;
wire [5:0] cpq_wptr_new;
wire dff_cpq_wptr_scanin;
wire dff_cpq_wptr_scanout;
wire cpq_rd_adv;
wire dff_cpq_rptr_scanin;
wire dff_cpq_rptr_scanout;
wire [5:0] cpq_rptr_new;
wire [5:0] cpq_rptr_inc;
wire fifo_empty;
wire [5:0] cpq_count;
wire cpq_gte_15;
wire reset_ll_cnt;
wire [2:0] ll_cnt_in;
wire [2:0] ll_cnt;
wire dff_ll_cnt_scanin;
wire dff_ll_cnt_scanout;
wire cpq_set_inval;
wire cpq_xinval;
wire cpq_local_pkt;
wire cpq_ld_type;
wire cpq_inv_type;
wire cpq_st_update;
wire cpq_evict_type;
wire cpq_st_type;
wire cpq_su_type;
wire cpq_ldd_type;
wire cpq_nonlsu_type;
wire cpq_ld_vld;
wire block_cpq_e;
wire cpq_st_vld;
wire cpq_su_vld;
wire cpq_inv_vld;
wire cpq_evict;
wire cpq_ldd_vld;
wire dff_ld_inst_e_scanin;
wire dff_ld_inst_e_scanout;
wire ld_inst_e;
wire [1:0] div_stall_in;
wire div_stall_d;
wire dff_div_stall_scanin;
wire dff_div_stall_scanout;
wire div_stall_e;
wire dcfill_active_e;
wire cic_ignore_fill_e;
wire ldd_2nd_pass;
wire cic_st_atm_cmplt;
wire st_dequeue;
wire ldd_1st_pass;
wire [15:0] evict_inv_wen;
wire [15:0] store_inv_wen;
wire next_ldd_2nd_pass;
wire dff_ldd_2nd_pass_scanin;
wire dff_ldd_2nd_pass_scanout;
wire lsu_dcsoc_err_e;
wire dff_dcl2_err_scanin;
wire dff_dcl2_err_scanout;
wire dff_diag_block_scanin;
wire dff_diag_block_scanout;
wire cpq_fail;
wire bist_cpq_cmp_en;
wire dff_bist_scanin;
wire dff_bist_scanout;
wire bist_cpq_rd_1;
wire spares_scanin;
wire spares_scanout;


// Globals
input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input		tcu_scan_en;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;

input	[2:0]	const_cpuid;		// 0in const -message "const_cpuid changed!"

input		cpx_pkt_vld;

input	[4:0]	cid_d1_rtntyp;
input		cid_d1_wv;
input	[2:0]	cid_d1_tid;
input		cid_d1_rmo;
input		cid_d1_pref;
input	[2:0]	cid_d1_cpuid;
input	[1:0]	cid_d1_inval;

input	[2:0]	cid_tid;
input	[2:0]	cid_cpuid;
input	[4:0]	cid_pkt_type;
input		cid_xinval;
input		cid_pref;
input	[17:0]	cid_inv_vec;		// Invalidation vector
input		cid_atomic;
input		cid_rmo_ack;
input		cid_set_inval;
input		cid_set_icinval;
input	[5:4]	cid_st_addr;
input	[15:0]	cid_st_vector;
input		cid_cpq_cmp_1;
input		cid_cpq_cmp_2;
input		cid_cpq_cmp_3;

input		dcc_cache_diag_wr_b;	// must block returns for diag write
input		dec_ld_inst_d;

input		fgu_fdiv_stall;		// divide write to FRF W2 port pending

input	[7:0]	lmc_ldd_vld;		// LDD flags for each thread

input	[7:0]	sbc_bst_sel;

input		mbi_run;
input		mbi_cpq_read_en;
input		mbi_cpq_write_en;
input	[4:0]	mbi_addr;
input		lbist_run;

// CPQ control
output	[4:0]	cic_cpq_wptr;
output	[4:0]	cic_cpq_rptr;
output		cic_cpq_rd_en;
output		cic_cpq_wr_en;
output		cic_d1_sel;
output		cic_cpq_sel;
output		cic_fifo_sel;
output		cic_byp_sel;
output		cic_fifo_clken;

output		cic_l2fill_vld_e;	// Fill/bypass from L2 is proceeding
output		cic_cpq_ld_rdy;		// Fill/bypass is ready (but not necessarily happening)
output		cic_cpq_ld_rdy_;	// Fill/bypass is ready (but not necessarily happening)
output		cic_cpq_ld_sel;		// Load return is at head of queue
output		cic_div_stall_d;	// Divide is blocking the path to the regfiles
output		cic_st_update_e;	// Store update to D$ is happening
output		cic_rtn_cmplt;		// Load or atomic is complete
output		cic_invalidate_e;	// Invalidation is occuring
output		cic_xinval_e;		// Cross invalidate
output		cic_set_inval;
output	[7:0]	cic_xinval;		// xinval arrived on cpx
output		cic_oddrd_e;		// Second pass of a 2 pass load
output	[7:0]	cic_st_dequeue;		// Dequeue the store from the stb
output	[7:0]	cic_rmo_dequeue;
output	[7:0]	cic_st_ack;		// Store acks to each thread's stb
output	[15:0]	cic_inv_wen_e;		// Invalidation information
output		cic_cpq_stall;
output		cic_diag_data_sel_e;
output		cic_ext_interrupt;

output		lsu_dcsoc_err_g;
output		lsu_ext_interrupt;

output		cic_mbi_run;
output		lsu_mbi_cpq_fail;

// scan renames
assign se = tcu_scan_en;
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;
// end scan

//////////////////////////////
// Clock header
//////////////////////////////

lsu_cic_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk                          ),
        .l1en   (1'b1                           ),
        .l1clk  (l1clk                          ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

assign dec_cpuid[0] = ~const_cpuid[2] & ~const_cpuid[1] & ~const_cpuid[0];
assign dec_cpuid[1] = ~const_cpuid[2] & ~const_cpuid[1] &  const_cpuid[0];
assign dec_cpuid[2] = ~const_cpuid[2] &  const_cpuid[1] & ~const_cpuid[0];
assign dec_cpuid[3] = ~const_cpuid[2] &  const_cpuid[1] &  const_cpuid[0];
assign dec_cpuid[4] =  const_cpuid[2] & ~const_cpuid[1] & ~const_cpuid[0];
assign dec_cpuid[5] =  const_cpuid[2] & ~const_cpuid[1] &  const_cpuid[0];
assign dec_cpuid[6] =  const_cpuid[2] &  const_cpuid[1] & ~const_cpuid[0];
assign dec_cpuid[7] =  const_cpuid[2] &  const_cpuid[1] &  const_cpuid[0];

assign cpq_tid[0] = ~cid_tid[2] & ~cid_tid[1] & ~cid_tid[0];
assign cpq_tid[1] = ~cid_tid[2] & ~cid_tid[1] &  cid_tid[0];
assign cpq_tid[2] = ~cid_tid[2] &  cid_tid[1] & ~cid_tid[0];
assign cpq_tid[3] = ~cid_tid[2] &  cid_tid[1] &  cid_tid[0];
assign cpq_tid[4] =  cid_tid[2] & ~cid_tid[1] & ~cid_tid[0];
assign cpq_tid[5] =  cid_tid[2] & ~cid_tid[1] &  cid_tid[0];
assign cpq_tid[6] =  cid_tid[2] &  cid_tid[1] & ~cid_tid[0];
assign cpq_tid[7] =  cid_tid[2] &  cid_tid[1] &  cid_tid[0];

assign cpq_atomic  = cid_atomic;
assign cpq_rmo_ack = cid_rmo_ack;

////////////////////////////////////////////////////////////////////////////////
// The CPX interface is built around a 32 entry FIFO (the CPQ).  Incoming
// packets queue in the FIFO (or bypass if the FIFO is empty).  Only the packet
// at the head of the FIFO can be dequeued. Packets which
// cause the dcache to update (cacheable loads from L2 and stores which update)
// must wait until there is no load instruction in the pipeline because the
// cache arrays are single ported.  Only packets processed by the LSU are 
// handled by this interface.  Ifill, SPU load, and MMU packets are ignored.
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// FIFO and bypass management
// A packet can come from one of four sources:
// cpx  - direct bypass if fifo and bypass stages are empty
// d1   - 1st bypass stage (fifo written during this stage)
// cpq  - read data from fifo RAM
// fifo - data from fifo flop
////////////////////////////////////////////////////////////////////////////////

// FIFO/bypass state.  An asserted state bit indicates a valid, unprocessed
// packet exists in the respective stage.  If all are deasserted, packets bypass
// directly from the cpx.
lsu_cic_ctl_msff_ctl_macro__width_2 dff_cpq_state  (
	.scan_in(dff_cpq_state_scanin),
	.scan_out(dff_cpq_state_scanout),
	.din	({state_fifo, fifo_dff_enable}),
	.dout	({last_state_fifo,fifo_clken_last}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign state_d1 = lsu_type_d1 & ~(sel_byp_last & cpq_pkt_done);
assign state_cpq = (cpq_rptr[5:0] != cpq_wptr[5:0]) & ~(sel_d1_last & cpq_pkt_done);
assign state_fifo = (fifo_clken_last | last_state_fifo) & ~cpq_pkt_done;

assign fifo_dff_enable = state_cpq & ~state_fifo;
assign cic_fifo_clken = mbi_run_local | fifo_dff_enable;

// These are priority encoded versions used to mux return packets
// The aomux must output zeros for blocked packets and when in BIST mode.
assign cic_fifo_sel = state_fifo & ~block_cpq_d & ~mbi_run_local;
assign cic_cpq_sel  = state_cpq & ~state_fifo & ~block_cpq_d & ~mbi_run_local;
assign cic_d1_sel   = state_d1 & ~state_cpq & ~state_fifo & ~block_cpq_d & ~mbi_run_local;
assign cic_byp_sel  = ~state_d1 & ~state_cpq & ~state_fifo & ~block_cpq_d & ~mbi_run_local;

// 0in bits_on -var {cic_fifo_sel,cic_cpq_sel,cic_d1_sel,cic_byp_sel} -max 1 

lsu_cic_ctl_msff_ctl_macro__width_2 dff_cpq_sel  (
	.scan_in(dff_cpq_sel_scanin),
	.scan_out(dff_cpq_sel_scanout),
	.din	({cic_byp_sel, cic_d1_sel}),
	.dout	({sel_byp_last,sel_d1_last}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////////////
// CPQ write pointer and write enable
// All valid packets write into the fifo array.  (If timing allows for a predecode,
// I could supress the write of non-LSU packets.) In cycle d1, the packet will be decoded.
// If it wasn't an LSU type, the write pointer will not advance and the entry will be
// overwritten.

assign cpq_wr_en = cpx_pkt_vld;
assign cic_cpq_wr_en = (mbi_run_local | lbist_run) ? mbi_cpq_write_en : cpq_wr_en;

assign lsu_type_d1  = (cid_d1_rtntyp[4] & (cid_d1_rtntyp[2:0] == 3'b000) & ~cid_d1_pref)|	// loads
                      (cid_d1_rtntyp[4:0] == 5'b10100)					|	// store ack
                      ((cid_d1_rtntyp[4:0] == 5'b10001) & cid_d1_wv)			|	// ifill with inval
                      (cid_d1_rtntyp[4:0] == 5'b10011)					|	// eviction
                      (cid_d1_rtntyp[4:0] == 5'b10110)					|	// stream store ack
                      (cid_d1_rtntyp[4:0] == 5'b10111)					;	// interrupt return

assign cpq_wptr_inc[5:0] = cpq_wptr[5:0] + {6'b000001};
assign cpq_wptr_new[5:0] = lsu_type_d1 ? cpq_wptr_inc[5:0] : cpq_wptr[5:0];
assign cic_cpq_wptr[4:0] = mbi_run_local ? mbi_addr[4:0] : cpq_wptr_new[4:0];

lsu_cic_ctl_msff_ctl_macro__width_6 dff_cpq_wptr  (
	.scan_in(dff_cpq_wptr_scanin),
	.scan_out(dff_cpq_wptr_scanout),
	.din	(cpq_wptr_new[5:0]),
	.dout	(cpq_wptr[5:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

//////////////////////////////////////////////////////////////////////////////////
// CPQ read pointer generation
// The read pointer increments if the a packet from a bypass stage is used or
// when the fifo_dff pops an entry.

assign cpq_rd_adv = (cpq_pkt_done & (sel_byp_last | sel_d1_last)) | fifo_dff_enable;

lsu_cic_ctl_msff_ctl_macro__width_6 dff_cpq_rptr  (
	.scan_in(dff_cpq_rptr_scanin),
	.scan_out(dff_cpq_rptr_scanout),
	.din	(cpq_rptr_new[5:0]),
	.dout	(cpq_rptr[5:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign cpq_rptr_inc[5:0] = cpq_rptr[5:0] + {6'b000001};
assign cpq_rptr_new[5:0] = cpq_rd_adv ? cpq_rptr_inc[5:0] : cpq_rptr[5:0];
assign cic_cpq_rptr[4:0] = mbi_run_local ? mbi_addr[4:0] : cpq_rptr_new[4:0];

/// CPQ will be read whenever there is a valid entry.
assign fifo_empty = (cpq_wptr_new[5:0] == cpq_rptr_new[5:0]);

assign cic_cpq_rd_en = mbi_run_local ? mbi_cpq_read_en : ~fifo_empty;

// Block the decode of any LSU op so the CPQ can drain.
// The CPQ cannot be allowed to rise above 16 entries used so that seven outstanding
// block loads can be accomodated.
 
assign cpq_count[5:0] = (cpq_wptr[5:0] - cpq_rptr[5:0]);

assign cpq_gte_15 = (cpq_count[5:0] >= 6'd15);

// To prevent livelock, request a stall if a packet is held at the head
// of the queue for 8 cycles.

assign reset_ll_cnt = cpq_pkt_done | ~(cic_d1_sel | cic_cpq_sel | cic_fifo_sel);

assign ll_cnt_in[2:0] = {3{~reset_ll_cnt}} & {ll_cnt[2:0] + 3'b001};
lsu_cic_ctl_msff_ctl_macro__width_3 dff_ll_cnt  (
	.scan_in(dff_ll_cnt_scanin),
	.scan_out(dff_ll_cnt_scanout),
	.din	(ll_cnt_in[2:0]),
	.dout	(ll_cnt[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign cic_cpq_stall = cpq_gte_15 | (&ll_cnt[2:0]);

// Assertion to check for cpq overflow
// 0in fifo -enq lsu_type_d1 -deq cpq_rd_adv -depth 32 -pass -registered 

////////////////////////////////////////////////////////////////////////////////
// Process the ready packet 
////////////////////////////////////////////////////////////////////////////////

assign cpq_set_inval = (cid_pkt_type[4:0] == 5'b10100) & cid_set_inval;
assign cpq_xinval    = (cid_pkt_type[4:0] == 5'b10001) & cid_xinval;			// ifill xinval
assign cpq_local_pkt = (cid_cpuid[2:0] == const_cpuid[2:0]);
assign cpq_ld_type   = cid_pkt_type[4] & (cid_pkt_type[2:0] == 3'b000) & ~cid_pref;	// load; no prefetch
assign cpq_inv_type  = (cid_pkt_type[4:0] == 5'b10011) | 				// eviction
                       ((cid_pkt_type[4:0] == 5'b10110) & cpq_st_update) |		// stream store ack
                       cpq_set_inval |							// set invalidate
                       ((cid_pkt_type[4:0] == 5'b10100) &
                         (~cpq_local_pkt | 						// non-local store ack
                           (cid_atomic & cpq_st_update) |				// atomic
                           (cid_rmo_ack & cpq_st_update)));				// BIS
assign cpq_evict_type= (cid_pkt_type[4:0] == 5'b10011);
assign cpq_st_type   = (cid_pkt_type[4:0] == 5'b10100 & cpq_local_pkt) &		// store ack
                       ~(cid_set_inval | cid_set_icinval);
assign cpq_su_type   = (cid_pkt_type[4:0] == 5'b10100) & cpq_local_pkt & 
                       cpq_st_update & ~(cid_set_icinval | cid_set_inval) &
                        ~cid_atomic & ~cid_rmo_ack;

assign cpq_st_update = (dec_cpuid[7] & cid_st_vector[15] & ~cid_st_vector[14]) |
                       (dec_cpuid[6] & cid_st_vector[13] & ~cid_st_vector[12]) |
                       (dec_cpuid[5] & cid_st_vector[11] & ~cid_st_vector[10]) |
                       (dec_cpuid[4] & cid_st_vector[9] & ~cid_st_vector[8]) |
                       (dec_cpuid[3] & cid_st_vector[7] & ~cid_st_vector[6]) |
                       (dec_cpuid[2] & cid_st_vector[5] & ~cid_st_vector[4]) |
                       (dec_cpuid[1] & cid_st_vector[3] & ~cid_st_vector[2]) |
                       (dec_cpuid[0] & cid_st_vector[1] & ~cid_st_vector[0]);

assign cpq_ldd_type = (cid_tid[2:0] == 3'b000) & cpq_ld_type & lmc_ldd_vld[0] |
                      (cid_tid[2:0] == 3'b001) & cpq_ld_type & lmc_ldd_vld[1] |
                      (cid_tid[2:0] == 3'b010) & cpq_ld_type & lmc_ldd_vld[2] |
                      (cid_tid[2:0] == 3'b011) & cpq_ld_type & lmc_ldd_vld[3] |
                      (cid_tid[2:0] == 3'b100) & cpq_ld_type & lmc_ldd_vld[4] |
                      (cid_tid[2:0] == 3'b101) & cpq_ld_type & lmc_ldd_vld[5] |
                      (cid_tid[2:0] == 3'b110) & cpq_ld_type & lmc_ldd_vld[6] |
                      (cid_tid[2:0] == 3'b111) & cpq_ld_type & lmc_ldd_vld[7] ;

assign cic_ext_interrupt = (cid_pkt_type[4:0] == 5'b10111);

// Because some packets may have been put into the queue that aren't interesting to the LSU,
// they need to be thrown away.
assign cpq_nonlsu_type = cid_pkt_type[4] & ~(cpq_ld_type | cpq_st_type | cpq_inv_type | cpq_evict_type | cpq_xinval);

// Operations must be qualifed with cpq blocks

assign cpq_ld_vld  = cpq_ld_type & ~block_cpq_e;
assign cpq_st_vld  = cpq_st_type & ~block_cpq_e;
assign cpq_su_vld  = cpq_su_type & ~block_cpq_e;
assign cpq_inv_vld = cpq_inv_type & ~block_cpq_e;
assign cpq_evict   = cpq_evict_type & ~block_cpq_e;
assign cpq_ldd_vld = cpq_ldd_type;

// This just blocks lmq load bypass and enables the data flop (for PM)
assign cic_cpq_ld_rdy = cpq_ld_vld;
assign cic_cpq_ld_rdy_ = ~cpq_ld_vld;

assign cic_set_inval = cpq_set_inval;

// This differentiates between load type and store/inv type.  It can
// only be used for mux selects because there is no guarantee that
// the operation will actually happen.
// NOTE: Further qualification with mbi_run and diag writes may be
//       required by the block(s) using this signal.
assign cic_cpq_ld_sel = ~cid_pkt_type[2] & ~cid_pkt_type[0];

// Invalidates can always be processed.  Invalidates come from evict and
// stream store packets and from non-local store acks.
assign cic_invalidate_e = cpq_inv_vld;
assign cic_xinval_e = cpq_xinval & ~block_cpq_e;

// The load instruction in D might get flushed in E, but because ldst_complete
// needs to go to pick in E, I don't have time to qualify it.  Therefore, a
// dcfill will only occur when there is no load instruction - flushed or not -
// coming down the pipe.

lsu_cic_ctl_msff_ctl_macro__width_1 dff_ld_inst_e  (
	.scan_in(dff_ld_inst_e_scanin),
	.scan_out(dff_ld_inst_e_scanout),
	.din	(dec_ld_inst_d),
	.dout	(ld_inst_e),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// Divide results have highest priority to the W2 ports of the FRF.
// FGU will signal a stall to indicate that a result will be written in the
// future.  Fills cannot proceed when the result is being written.
// The timing is as below.  Use a shift register to track the stall.
//
//      |  D  |  E  |  M  
//  fdiv|     |     |  
// stall|     |     |  
//      |     |     |  

assign div_stall_in[1:0] = {fgu_fdiv_stall,div_stall_d}; 
lsu_cic_ctl_msff_ctl_macro__width_2 dff_div_stall  (
	.scan_in(dff_div_stall_scanin),
	.scan_out(dff_div_stall_scanout),
	.din	(div_stall_in[1:0]),
	.dout	({div_stall_d,div_stall_e}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
assign cic_div_stall_d = div_stall_d;		// send to lmc to block bypass

// The dcache can fill when the pipe is not blocked by a load or divide
assign dcfill_active_e = cpq_ld_vld & ~ld_inst_e & ~div_stall_e & ~block_cpq_e;
assign cic_l2fill_vld_e = dcfill_active_e;

// Don't restart the thread on the 1st pass of ldd or an atomic load
assign cic_ignore_fill_e = (cpq_ldd_vld & ~ldd_2nd_pass) | cpq_atomic;

assign cic_rtn_cmplt = (dcfill_active_e & ~cic_ignore_fill_e) | cic_st_atm_cmplt;

// Store updates follow the same rules to write to the cache as load fills;
// i.e. can't write if a load is coming down the pipe
assign cic_st_update_e = cpq_su_vld & ~ld_inst_e;

// Dequeue stores
assign st_dequeue = (cpq_su_vld & ~ld_inst_e) | (cpq_st_vld & ~cpq_su_vld);

assign cic_st_atm_cmplt = (cid_pkt_type[4:0] == 5'b10100 & cpq_local_pkt) & cid_atomic & ~block_cpq_e;

// Store deqeueing
// 0in bits_on -var {(cpq_tid[0] & st_dequeue & ~cpq_rmo_ack),sbc_bst_sel[0]} -max 1 -message "multiple dequeue in STB0"
// 0in bits_on -var {(cpq_tid[1] & st_dequeue & ~cpq_rmo_ack),sbc_bst_sel[1]} -max 1 -message "multiple dequeue in STB1"
// 0in bits_on -var {(cpq_tid[2] & st_dequeue & ~cpq_rmo_ack),sbc_bst_sel[2]} -max 1 -message "multiple dequeue in STB2"
// 0in bits_on -var {(cpq_tid[3] & st_dequeue & ~cpq_rmo_ack),sbc_bst_sel[3]} -max 1 -message "multiple dequeue in STB3"
// 0in bits_on -var {(cpq_tid[4] & st_dequeue & ~cpq_rmo_ack),sbc_bst_sel[4]} -max 1 -message "multiple dequeue in STB4"
// 0in bits_on -var {(cpq_tid[5] & st_dequeue & ~cpq_rmo_ack),sbc_bst_sel[5]} -max 1 -message "multiple dequeue in STB5"
// 0in bits_on -var {(cpq_tid[6] & st_dequeue & ~cpq_rmo_ack),sbc_bst_sel[6]} -max 1 -message "multiple dequeue in STB6"
// 0in bits_on -var {(cpq_tid[7] & st_dequeue & ~cpq_rmo_ack),sbc_bst_sel[7]} -max 1 -message "multiple dequeue in STB7"

assign cic_st_dequeue[7:0] = (cpq_tid[7:0] & {8{(st_dequeue & ~cpq_rmo_ack)}}) | sbc_bst_sel[7:0];
assign cic_rmo_dequeue[7:0] = cpq_tid[7:0] & {8{(cpq_st_vld & cpq_rmo_ack)}};

// store acks to respective store buffers - this is done when the packet is received
assign cic_st_ack[0] = ((cid_d1_rtntyp[4:0] == 5'b10100) & (cid_d1_cpuid[2:0] == const_cpuid[2:0]) &
                        ~cid_d1_rmo & (cid_d1_tid[2:0] == 3'd0) & ~(|cid_d1_inval[1:0]));
assign cic_st_ack[1] = ((cid_d1_rtntyp[4:0] == 5'b10100) & (cid_d1_cpuid[2:0] == const_cpuid[2:0]) &
                        ~cid_d1_rmo & (cid_d1_tid[2:0] == 3'd1) & ~(|cid_d1_inval[1:0]));
assign cic_st_ack[2] = ((cid_d1_rtntyp[4:0] == 5'b10100) & (cid_d1_cpuid[2:0] == const_cpuid[2:0]) &
                        ~cid_d1_rmo & (cid_d1_tid[2:0] == 3'd2) & ~(|cid_d1_inval[1:0]));
assign cic_st_ack[3] = ((cid_d1_rtntyp[4:0] == 5'b10100) & (cid_d1_cpuid[2:0] == const_cpuid[2:0]) &
                        ~cid_d1_rmo & (cid_d1_tid[2:0] == 3'd3) & ~(|cid_d1_inval[1:0]));
assign cic_st_ack[4] = ((cid_d1_rtntyp[4:0] == 5'b10100) & (cid_d1_cpuid[2:0] == const_cpuid[2:0]) &
                        ~cid_d1_rmo & (cid_d1_tid[2:0] == 3'd4) & ~(|cid_d1_inval[1:0]));
assign cic_st_ack[5] = ((cid_d1_rtntyp[4:0] == 5'b10100) & (cid_d1_cpuid[2:0] == const_cpuid[2:0]) &
                        ~cid_d1_rmo & (cid_d1_tid[2:0] == 3'd5) & ~(|cid_d1_inval[1:0]));
assign cic_st_ack[6] = ((cid_d1_rtntyp[4:0] == 5'b10100) & (cid_d1_cpuid[2:0] == const_cpuid[2:0]) &
                        ~cid_d1_rmo & (cid_d1_tid[2:0] == 3'd6) & ~(|cid_d1_inval[1:0]));
assign cic_st_ack[7] = ((cid_d1_rtntyp[4:0] == 5'b10100) & (cid_d1_cpuid[2:0] == const_cpuid[2:0]) &
                        ~cid_d1_rmo & (cid_d1_tid[2:0] == 3'd7) & ~(|cid_d1_inval[1:0]));

// The packet is done when it gets accepted into the pipeline.
assign cpq_pkt_done = ((dcfill_active_e & ~ldd_1st_pass) | cic_st_update_e) | (st_dequeue & ~cic_st_update_e) | 
                      cpq_inv_vld | cic_xinval_e | (cpq_nonlsu_type & (~sel_byp_last | lsu_type_d1));

//////////////////////////////////////////////////////////////////////////////
// Invalidation vector decoding
//////////////////////////////////////////////////////////////////////////////
// For evict inval. [13:0] = {A11[2:0],A10[3:0],A01[2:0],A00[3:0]}
// For store inval. [17:14] = {A[3:0]};

assign evict_inv_wen[15] = cid_inv_vec[11] & (cid_inv_vec[13:12] == 2'b11);
assign evict_inv_wen[14] = cid_inv_vec[11] & (cid_inv_vec[13:12] == 2'b10);
assign evict_inv_wen[13] = cid_inv_vec[11] & (cid_inv_vec[13:12] == 2'b01);
assign evict_inv_wen[12] = cid_inv_vec[11] & (cid_inv_vec[13:12] == 2'b00);

assign evict_inv_wen[11] = cid_inv_vec[8] & ~cid_inv_vec[7] & (cid_inv_vec[10:9] == 2'b11);
assign evict_inv_wen[10] = cid_inv_vec[8] & ~cid_inv_vec[7] & (cid_inv_vec[10:9] == 2'b10);
assign evict_inv_wen[9]  = cid_inv_vec[8] & ~cid_inv_vec[7] & (cid_inv_vec[10:9] == 2'b01);
assign evict_inv_wen[8]  = cid_inv_vec[8] & ~cid_inv_vec[7] & (cid_inv_vec[10:9] == 2'b00);

assign evict_inv_wen[7]  = cid_inv_vec[4] & (cid_inv_vec[6:5] == 2'b11);
assign evict_inv_wen[6]  = cid_inv_vec[4] & (cid_inv_vec[6:5] == 2'b10);
assign evict_inv_wen[5]  = cid_inv_vec[4] & (cid_inv_vec[6:5] == 2'b01);
assign evict_inv_wen[4]  = cid_inv_vec[4] & (cid_inv_vec[6:5] == 2'b00);

assign evict_inv_wen[3]  = cid_inv_vec[1] & ~cid_inv_vec[0] & (cid_inv_vec[3:2] == 2'b11);
assign evict_inv_wen[2]  = cid_inv_vec[1] & ~cid_inv_vec[0] & (cid_inv_vec[3:2] == 2'b10);
assign evict_inv_wen[1]  = cid_inv_vec[1] & ~cid_inv_vec[0] & (cid_inv_vec[3:2] == 2'b01);
assign evict_inv_wen[0]  = cid_inv_vec[1] & ~cid_inv_vec[0] & (cid_inv_vec[3:2] == 2'b00);

assign store_inv_wen[15] = ((cid_inv_vec[17:14] == 4'b1110) | cid_set_inval) & (cid_st_addr[5:4] == 2'b11);
assign store_inv_wen[14] = ((cid_inv_vec[17:14] == 4'b1010) | cid_set_inval) & (cid_st_addr[5:4] == 2'b11);
assign store_inv_wen[13] = ((cid_inv_vec[17:14] == 4'b0110) | cid_set_inval) & (cid_st_addr[5:4] == 2'b11);
assign store_inv_wen[12] = ((cid_inv_vec[17:14] == 4'b0010) | cid_set_inval) & (cid_st_addr[5:4] == 2'b11);

assign store_inv_wen[11] = ((cid_inv_vec[17:14] == 4'b1110) | cid_set_inval) & (cid_st_addr[5:4] == 2'b10);
assign store_inv_wen[10] = ((cid_inv_vec[17:14] == 4'b1010) | cid_set_inval) & (cid_st_addr[5:4] == 2'b10);
assign store_inv_wen[9]  = ((cid_inv_vec[17:14] == 4'b0110) | cid_set_inval) & (cid_st_addr[5:4] == 2'b10);
assign store_inv_wen[8]  = ((cid_inv_vec[17:14] == 4'b0010) | cid_set_inval) & (cid_st_addr[5:4] == 2'b10);

assign store_inv_wen[7]  = ((cid_inv_vec[17:14] == 4'b1110) | cid_set_inval) & (cid_st_addr[5:4] == 2'b01);
assign store_inv_wen[6]  = ((cid_inv_vec[17:14] == 4'b1010) | cid_set_inval) & (cid_st_addr[5:4] == 2'b01);
assign store_inv_wen[5]  = ((cid_inv_vec[17:14] == 4'b0110) | cid_set_inval) & (cid_st_addr[5:4] == 2'b01);
assign store_inv_wen[4]  = ((cid_inv_vec[17:14] == 4'b0010) | cid_set_inval) & (cid_st_addr[5:4] == 2'b01);

assign store_inv_wen[3]  = ((cid_inv_vec[17:14] == 4'b1110) | cid_set_inval) & (cid_st_addr[5:4] == 2'b00);
assign store_inv_wen[2]  = ((cid_inv_vec[17:14] == 4'b1010) | cid_set_inval) & (cid_st_addr[5:4] == 2'b00);
assign store_inv_wen[1]  = ((cid_inv_vec[17:14] == 4'b0110) | cid_set_inval) & (cid_st_addr[5:4] == 2'b00);
assign store_inv_wen[0]  = ((cid_inv_vec[17:14] == 4'b0010) | cid_set_inval) & (cid_st_addr[5:4] == 2'b00);

assign cic_inv_wen_e[15:0] = cpq_evict ? evict_inv_wen[15:0] : store_inv_wen[15:0];

//////////////////////////////////////////////////////////////////////////////
// LDD/QUAD/BLD control
//////////////////////////////////////////////////////////////////////////////

// 1st pass of ldd type instructions should not retire the packet or signal
// lsu_complete.  The load return of atomics should not signal complete either.
assign ldd_1st_pass = dcfill_active_e & cpq_ldd_vld & ~ldd_2nd_pass;

assign next_ldd_2nd_pass= (cpq_ldd_vld & (dcfill_active_e ^ ldd_2nd_pass)) | (ldd_2nd_pass & block_cpq_e);

lsu_cic_ctl_msff_ctl_macro__width_1 dff_ldd_2nd_pass  (
	.scan_in(dff_ldd_2nd_pass_scanin),
	.scan_out(dff_ldd_2nd_pass_scanout),
	.din	(next_ldd_2nd_pass),
	.dout	(ldd_2nd_pass),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign cic_oddrd_e = ldd_2nd_pass & dcfill_active_e;

//////////////////////////////////////////////////////////////////////////////
// xinval control
// Because the IFU does not queue incoming packets, there is the possibility
// that they process an ifill which requires D$ invalidation much earlier than
// the LSU.  This causes a problem because the fill will occur and the thread
// could miss again before the D$ inval occurs.  I will signal when an inval
// is pending.  During this time, the I$ will not service a miss from that thread.
//////////////////////////////////////////////////////////////////////////////

assign cic_xinval[0] = (cid_d1_rtntyp[4:0] == 5'b10001) & cid_d1_wv & (cid_d1_tid[2:0] == 3'b000);
assign cic_xinval[1] = (cid_d1_rtntyp[4:0] == 5'b10001) & cid_d1_wv & (cid_d1_tid[2:0] == 3'b001);
assign cic_xinval[2] = (cid_d1_rtntyp[4:0] == 5'b10001) & cid_d1_wv & (cid_d1_tid[2:0] == 3'b010);
assign cic_xinval[3] = (cid_d1_rtntyp[4:0] == 5'b10001) & cid_d1_wv & (cid_d1_tid[2:0] == 3'b011);
assign cic_xinval[4] = (cid_d1_rtntyp[4:0] == 5'b10001) & cid_d1_wv & (cid_d1_tid[2:0] == 3'b100);
assign cic_xinval[5] = (cid_d1_rtntyp[4:0] == 5'b10001) & cid_d1_wv & (cid_d1_tid[2:0] == 3'b101);
assign cic_xinval[6] = (cid_d1_rtntyp[4:0] == 5'b10001) & cid_d1_wv & (cid_d1_tid[2:0] == 3'b110);
assign cic_xinval[7] = (cid_d1_rtntyp[4:0] == 5'b10001) & cid_d1_wv & (cid_d1_tid[2:0] == 3'b111);


//////////////////////////////////////////////////////////////////////////////
// Must indicate to TLU whether a load error was L2 or SOC
//////////////////////////////////////////////////////////////////////////////

assign lsu_dcsoc_err_e = cid_pkt_type[3];

lsu_cic_ctl_msff_ctl_macro__width_2 dff_dcl2_err  (
	.scan_in(dff_dcl2_err_scanin),
	.scan_out(dff_dcl2_err_scanout),
	.din	({lsu_dcsoc_err_e,cic_ext_interrupt}),
	.dout	({lsu_dcsoc_err_g,lsu_ext_interrupt}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

//////////////////////////////////////////////////////////////////////////////
// cpq must be blocked to accomodate diagnostic cache writes

assign block_cpq_d = dcc_cache_diag_wr_b;

lsu_cic_ctl_msff_ctl_macro__width_2 dff_diag_block  (
	.scan_in(dff_diag_block_scanin),
	.scan_out(dff_diag_block_scanout),
	.din	({block_cpq_d,block_cpq_d}),
	.dout	({block_cpq_e,cic_diag_data_sel_e}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// BIST
assign cpq_fail = bist_cpq_cmp_en & 
                          (~cid_cpq_cmp_1 | ~cid_cpq_cmp_2 | ~cid_cpq_cmp_3);

lsu_cic_ctl_msff_ctl_macro__width_4 dff_bist  (
	.scan_in(dff_bist_scanin),
	.scan_out(dff_bist_scanout),
	.din	({mbi_run,      mbi_cpq_read_en,bist_cpq_rd_1,  cpq_fail}),
	.dout	({mbi_run_local,bist_cpq_rd_1,  bist_cpq_cmp_en,lsu_mbi_cpq_fail}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// This drives to the cpq write mux.  BIST data must be selected during lbist mode to block
// the path from the cpx input pins.
assign cic_mbi_run = mbi_run_local | lbist_run;

//// Store ack packet should never have bits 125(BIS) and 129(atomic) asserted - move these to LSU
//// 0in custom -fire ((cpx_spc_data_cx[145:141] == 5'b10100) & cpx_spc_data_cx[125] & cpx_spc_data_cx[129]) -message "BIS and ATOMIC both set for store_ack packet"
//// Load rtn packet should never have bits 128(pf) and 129(atomic) asserted
//// 0in custom -fire ((cpx_spc_data_cx[145:141] == 5'b10000) & cpx_spc_data_cx[128] & cpx_spc_data_cx[129]) -message "PF and ATOMIC both set for load rtn packet"
//// Load rtn packet should have bit 137(nc) asserted if 129(atomic) asserted
//// 0in custom -fire ((cpx_spc_data_cx[145:141] == 5'b10000) & cpx_spc_data_cx[129] & ~cpx_spc_data_cx[137]) -message "ATOMIC load rtn packet expects NC=1"
//

lsu_cic_ctl_spare_ctl_macro__num_2 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

supply0 vss;
supply1 vdd;
// fixscan start:
assign dff_cpq_state_scanin      = scan_in                  ;
assign dff_cpq_sel_scanin        = dff_cpq_state_scanout    ;
assign dff_cpq_wptr_scanin       = dff_cpq_sel_scanout      ;
assign dff_cpq_rptr_scanin       = dff_cpq_wptr_scanout     ;
assign dff_ll_cnt_scanin         = dff_cpq_rptr_scanout     ;
assign dff_ld_inst_e_scanin      = dff_ll_cnt_scanout       ;
assign dff_div_stall_scanin      = dff_ld_inst_e_scanout    ;
assign dff_ldd_2nd_pass_scanin   = dff_div_stall_scanout    ;
assign dff_dcl2_err_scanin       = dff_ldd_2nd_pass_scanout ;
assign dff_diag_block_scanin     = dff_dcl2_err_scanout     ;
assign dff_bist_scanin           = dff_diag_block_scanout   ;
assign spares_scanin             = dff_bist_scanout         ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule







// any PARAMS parms go into naming of macro

module lsu_cic_ctl_l1clkhdr_ctl_macro (
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

module lsu_cic_ctl_msff_ctl_macro__width_2 (
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

module lsu_cic_ctl_msff_ctl_macro__width_6 (
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

module lsu_cic_ctl_msff_ctl_macro__width_3 (
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

module lsu_cic_ctl_msff_ctl_macro__width_1 (
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

module lsu_cic_ctl_msff_ctl_macro__width_4 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module lsu_cic_ctl_spare_ctl_macro__num_2 (
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
assign scan_out = so_1;



endmodule

