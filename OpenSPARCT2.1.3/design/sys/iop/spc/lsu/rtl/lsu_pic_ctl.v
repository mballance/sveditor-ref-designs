// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_pic_ctl.v
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
module lsu_pic_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
  lmc_pcx_rq_vld, 
  lmc_asi_rq_vld, 
  lmc_ld_rq_p3, 
  lmc_ld_no_req_p4, 
  tlb_cache_hit_b, 
  dcc_early_ld_b, 
  sbc_asi_rq_p3, 
  sbc_pcx_rq_p3, 
  sbc_st_atomic_p2, 
  sbc_st_rq_p2, 
  sbc_pic_kill_store_p4_, 
  sbc_indet_block_p3, 
  sbs_stb_full, 
  asc_pid_ack, 
  dcc_asi_rtn_vld, 
  lsu_ring_ctl, 
  lsu_misc_pmen, 
  pic_ld_pcx_sel_p4, 
  pic_st_pcx_sel_p3, 
  pic_st_pcx_sel_p4, 
  pic_st_asi_sel_p3, 
  pic_st_asi_p4, 
  pic_ld_asi_p4, 
  pic_st_sel_p3, 
  pic_asi_sel_p4, 
  pic_asi_req, 
  pic_casa_squash_req, 
  pic_early_ld_b_sel_p3, 
  pic_no_load_p3, 
  pic_asi_busy, 
  l15_lsu_grant, 
  lsu_l15_valid, 
  lsu_l15_lock, 
  lsu_asi_clken);
wire se;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire l1clk;
wire stb_full_in;
wire dff_stb_full_scanin;
wire dff_stb_full_scanout;
wire stb_full;
wire [1:0] favor_count_inc;
wire [1:0] favor_count;
wire inc_count;
wire st_rq_p3;
wire no_ldst_p3;
wire asi_busy;
wire cancel_store_req_p3;
wire ld_pcx_sel_p3;
wire ld_asi_sel_p3;
wire clear_count;
wire [1:0] favor_count_in;
wire dff_st_favor_scanin;
wire dff_st_favor_scanout;
wire st_favor_p2;
wire st_block_ld_p2;
wire st_favor_p3;
wire st_block_ld_p3;
wire cancel_store_req_p2;
wire unqual_no_load_p2;
wire pcx_atm_p3;
wire block_casa_p3;
wire dff_pic_p2_scanin;
wire dff_pic_p2_scanout;
wire st_atomic_p3;
wire unqual_no_load_p3;
wire early_ld_miss_b;
wire pipe_load_req;
wire fifo_empty;
wire fifo_full;
wire pcx_atm_p4;
wire block_casa_p4;
wire ld_sel_p3;
wire st_sel_p3;
wire early_ld_b_sel_p3;
wire st_pcx_sel_p3;
wire st_asi_sel_p3;
wire any_pcx_sel_p3;
wire dff_pcx_p4_scanin;
wire dff_pcx_p4_scanout;
wire ld_pcx_sel_p4;
wire st_pcx_sel_p4;
wire early_ld_b_sel_pa;
wire cas2_select_p4;
wire cas2_select_p3;
wire dff_cas_select_scanin;
wire dff_cas_select_scanout;
wire last_early_inv;
wire [1:0] fifo_count_next;
wire [1:0] fifo_count;
wire dff_fifo_count_scanin;
wire dff_fifo_count_scanout;
wire dff_asi_ack_scanin;
wire dff_asi_ack_scanout;
wire asi_ack;
wire dff_asi_sel_pa_scanin;
wire dff_asi_sel_pa_scanout;
wire asi_req_ax;
wire kill_asi_st_p5;
wire asi_req_ax_next;
wire kill_asi_st_p4;
wire dff_asi_req_scanin;
wire dff_asi_req_scanout;
wire kill_store_p5_;
wire kill_store_p5__unused;
wire [1:0] asi_dec;
wire [4:0] asi_count_dec;
wire [4:0] asi_count;
wire [4:0] asi_count_in;
wire asi_clken_next;
wire dff_asi_pm_scanin;
wire dff_asi_pm_scanout;
wire spares_scanin;
wire spares_scanout;


input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input		tcu_scan_en;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;

input		lmc_pcx_rq_vld;		// LMQ needs access to PCX
input		lmc_asi_rq_vld;		// LMQ needs access to PCX
input		lmc_ld_rq_p3;
input		lmc_ld_no_req_p4;

input		tlb_cache_hit_b;
input		dcc_early_ld_b;

input		sbc_asi_rq_p3;		// STB needs access to PCX
input		sbc_pcx_rq_p3;		// STB needs access to PCX
input		sbc_st_atomic_p2;
input		sbc_st_rq_p2;
input		sbc_pic_kill_store_p4_;
input		sbc_indet_block_p3;

input	[7:0]	sbs_stb_full;

input		asc_pid_ack;
input	[7:0]	dcc_asi_rtn_vld;

input		lsu_ring_ctl;
input		lsu_misc_pmen;

output		pic_ld_pcx_sel_p4;	
output		pic_st_pcx_sel_p3;		// store port has access
output		pic_st_pcx_sel_p4;
output		pic_st_asi_sel_p3;
output		pic_st_asi_p4;
output		pic_ld_asi_p4;
output		pic_st_sel_p3;
output		pic_asi_sel_p4;
output		pic_asi_req;
output		pic_casa_squash_req;
output		pic_early_ld_b_sel_p3;
output		pic_no_load_p3;			// load cannot issue
output		pic_asi_busy;

input		l15_lsu_grant;
output		lsu_l15_valid;
output		lsu_l15_lock;
output		lsu_asi_clken;

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
lsu_pic_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk                          ),
        .l1en   (1'b1                           ),
        .l1clk  (l1clk                          ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

assign stb_full_in = |(sbs_stb_full[7:0]);

lsu_pic_ctl_msff_ctl_macro__width_1 dff_stb_full  (
	.scan_in(dff_stb_full_scanin),
	.scan_out(dff_stb_full_scanout),
	.din	(stb_full_in),
	.dout	(stb_full),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////////////
// Source arbitration
// Loads and stores must arbitrate against each other for pcx/asi access
// Loads are generally favored over stores unless
// (i)  stores get favor every 4 cycles if they've been waiting
// (ii) stores get favor every 2 cycles if they've been waiting and a store
//      buffer is full
//  * - CAS second packet (from LMQ) must always follow the first packet
//  * - when a CAS is pending, ALL requests must wait until the FIFO is empty
//      to avoid starving the CAS
//  * - to avoid various potential store livelock cases, if a store request
//      is rejected while the st_favor condition is true, loads requests will
//      be suppressed until the store can be issued
////////////////////////////////////////////////////////////////////////////////

assign favor_count_inc[1:0] = favor_count[1:0] + 2'b01;
assign inc_count = (st_rq_p3 & ~pic_st_sel_p3 & ~no_ldst_p3 & ~(sbc_asi_rq_p3 & asi_busy & (pic_st_asi_p4 | lmc_asi_rq_vld))) | 
                   (cancel_store_req_p3 & (ld_pcx_sel_p3 | ld_asi_sel_p3));
assign clear_count = st_rq_p3 & pic_st_sel_p3;
assign favor_count_in[1:0] = {2{~clear_count}} & (inc_count ? favor_count_inc[1:0] : favor_count[1:0]);

lsu_pic_ctl_msff_ctl_macro__width_4 dff_st_favor  (
	.scan_in(dff_st_favor_scanin),
	.scan_out(dff_st_favor_scanout),
	.din	({st_favor_p2,st_block_ld_p2,favor_count_in[1:0]}),
	.dout	({st_favor_p3,st_block_ld_p3,favor_count[1:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign st_favor_p2 = ((&favor_count[1:0] | (favor_count[0] & (stb_full | sbc_st_atomic_p2))) & inc_count) |
                     (st_favor_p3 & ~pic_st_sel_p3);

assign st_block_ld_p2 = (st_favor_p3 & st_rq_p3 & ~pic_st_sel_p3) | (st_block_ld_p3 & ~pic_st_sel_p3);

//////////
// P2 - early signals for ld/st arb
//////////

// Still must be qualified with fifo_full in P3
// Loads never win when
// Stores have favor and are requesting OR
// CASA was picked last cycle OR
// CASA was blocked last cycle

// If a store requests but doesn't win arbitration, then stores can't win in the next
// cycle either.  Otherwise, we create a livelock possibility where ST0 wins thread arb
// in p2, but loses ld/st arb in P3.  Meanwhile, ST1 wins thread arb in the next P2, and
// wins ld/st arb in it's P3.  This can continue indefinitely.

assign cancel_store_req_p2 = st_rq_p3 & ~pic_st_sel_p3 & ~cancel_store_req_p3;

assign unqual_no_load_p2 = (st_favor_p2 & sbc_st_rq_p2 & ~cancel_store_req_p2) |
                           st_block_ld_p2 | pcx_atm_p3 | block_casa_p3;

lsu_pic_ctl_msff_ctl_macro__width_4 dff_pic_p2  (
	.scan_in(dff_pic_p2_scanin),
	.scan_out(dff_pic_p2_scanout),
	.din	({sbc_st_atomic_p2,unqual_no_load_p2,sbc_st_rq_p2,cancel_store_req_p2}),
	.dout	({    st_atomic_p3,unqual_no_load_p3,    st_rq_p3,cancel_store_req_p3}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

//////////
// P3 - ld/st arb
//////////

assign early_ld_miss_b = dcc_early_ld_b & ~tlb_cache_hit_b;

assign pipe_load_req = early_ld_miss_b & ~lmc_ld_rq_p3;
assign block_casa_p3 = st_atomic_p3 & ~cancel_store_req_p3 & ~fifo_empty;
assign pic_no_load_p3 = unqual_no_load_p3 | fifo_full | block_casa_p3 | sbc_indet_block_p3; 


// Don't select anything if CASA selected last cycle (CAS2 must go) or fifo is full
assign no_ldst_p3 = pcx_atm_p4 | fifo_full | block_casa_p4 | sbc_indet_block_p3;

assign ld_sel_p3 = (lmc_ld_rq_p3 | early_ld_miss_b) & ~pic_no_load_p3;
assign st_sel_p3 = st_rq_p3 & (st_favor_p3 | ~(lmc_ld_rq_p3 | early_ld_miss_b)) & ~block_casa_p3 &
                   ~no_ldst_p3 & ~cancel_store_req_p3;

// 0in bits_on -var {st_sel_p3,ld_sel_p3} -max 1 -message "load and store selected for pcx"

assign early_ld_b_sel_p3 = ld_sel_p3 & ~lmc_ld_rq_p3 & early_ld_miss_b;

// 0in bits_on -var {ld_pcx_sel_p3,ld_asi_sel_p3} -max 1 -message "asi and pcx loads selected"
// 0in bits_on -var {st_pcx_sel_p3,st_asi_sel_p3} -max 1 -message "asi and pcx stores selected"

assign ld_pcx_sel_p3 = ld_sel_p3 & (lmc_pcx_rq_vld | pipe_load_req);
assign st_pcx_sel_p3 = st_sel_p3 & sbc_pcx_rq_p3;

assign ld_asi_sel_p3 = ld_sel_p3 & lmc_asi_rq_vld & ~asi_busy;
assign st_asi_sel_p3 = st_sel_p3 & sbc_asi_rq_p3 & ~asi_busy;

assign pic_st_asi_sel_p3 = st_asi_sel_p3;

assign pic_st_sel_p3 = st_pcx_sel_p3 | st_asi_sel_p3;

assign pic_st_pcx_sel_p3 = st_pcx_sel_p3;
assign pic_early_ld_b_sel_p3 = early_ld_b_sel_p3;	// to lmc


assign any_pcx_sel_p3 = ld_pcx_sel_p3 | st_pcx_sel_p3 | pcx_atm_p4;

assign pcx_atm_p3 = st_pcx_sel_p3 & st_atomic_p3;



lsu_pic_ctl_msff_ctl_macro__width_5 dff_pcx_p4  (
	.scan_in(dff_pcx_p4_scanin),
	.scan_out(dff_pcx_p4_scanout),
	.din	({ld_pcx_sel_p3,st_pcx_sel_p3,early_ld_b_sel_p3,pcx_atm_p3,block_casa_p3}),
	.dout	({ld_pcx_sel_p4,st_pcx_sel_p4,early_ld_b_sel_pa,pcx_atm_p4,block_casa_p4}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

//////////
// P4 - drive packets to l1g
//////////

assign pic_ld_pcx_sel_p4 = ld_pcx_sel_p4 | cas2_select_p4;
assign pic_st_pcx_sel_p4 = st_pcx_sel_p4;

assign lsu_l15_valid = (ld_pcx_sel_p4 & ~lmc_ld_no_req_p4) | cas2_select_p4 | pic_st_pcx_sel_p4;

assign pic_casa_squash_req = pcx_atm_p4;

assign lsu_l15_lock = pcx_atm_p4;	// lock for atomic packets

// CAS2 packet comes from LMQ.
assign cas2_select_p3 = pcx_atm_p4;

lsu_pic_ctl_msff_ctl_macro__width_1 dff_cas_select  (
	.scan_in(dff_cas_select_scanin),
	.scan_out(dff_cas_select_scanout),
	.din	(cas2_select_p3),
	.dout	(cas2_select_p4),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////////////
// Gasket FIFO Queue Tracking
// The gasket contains a two-entry FIFO.  It's the LSU's responsibility to not
// overflow this fifo.  Keep track of requests and grants to maintain the count.
// This count needs to be maintained based on the P3 cycle so that arbitration
// is halted if the FIFO is full.
// Increment the count for each ld/st sent (any_pcx_sel_p3)
// Decrement the count for each grant received (l15_lsu_grant) 
// Decrement the count for a load sent, but invalidated in P4 (last_early_inv)
////////////////////////////////////////////////////////////////////////////////

//assign fifo_count_inc[1:0] = fifo_count[1:0] + 2'b01;
//assign fifo_count_dec[1:0] = fifo_count[1:0] - 2'b01;
//assign fifo_count_dec2[1:0] = fifo_count[1:0] - 2'b10;

assign last_early_inv = early_ld_b_sel_pa & ~lsu_l15_valid;

assign fifo_count_next[1] = (fifo_count[1] & ~last_early_inv & (any_pcx_sel_p3 | ~l15_lsu_grant)) |
                            (fifo_count[0] & any_pcx_sel_p3 & ~l15_lsu_grant & ~last_early_inv) ;

assign fifo_count_next[0] = (fifo_count[0] & ~last_early_inv & (any_pcx_sel_p3 ~^ l15_lsu_grant)) |	// 1->1
                            (~fifo_count[0] & any_pcx_sel_p3 & ~l15_lsu_grant) |			// 0->1
                            (~fifo_count[0] & last_early_inv & (~l15_lsu_grant | any_pcx_sel_p3)) | 	// 2->1
                            (~fifo_count[0] & ~any_pcx_sel_p3 & l15_lsu_grant & ~last_early_inv) | 	// 2->1
                            (any_pcx_sel_p3 & ~l15_lsu_grant & last_early_inv);				// 1->1

lsu_pic_ctl_msff_ctl_macro__width_2 dff_fifo_count  (
	.scan_in(dff_fifo_count_scanin),
	.scan_out(dff_fifo_count_scanout),
	.din	(fifo_count_next[1:0]),
	.dout	(fifo_count[1:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in underflow -var fifo_count[1:0] 
// 0in maximum 2 -var fifo_count[1:0]  

assign fifo_full = fifo_count[1] & ~l15_lsu_grant;
assign fifo_empty = ~fifo_count[1] & (~fifo_count[0] | l15_lsu_grant);

////////
// P4 - ASI
////////

// asc_pid_ack returns (best case) on the same cycle as the packet is sent
lsu_pic_ctl_msff_ctl_macro__width_1 dff_asi_ack  (
	.scan_in(dff_asi_ack_scanin),
	.scan_out(dff_asi_ack_scanout),
	.din	(asc_pid_ack),
	.dout	(asi_ack),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

lsu_pic_ctl_msff_ctl_macro__width_2 dff_asi_sel_pa  (
	.scan_in(dff_asi_sel_pa_scanin),
	.scan_out(dff_asi_sel_pa_scanout),
	.din	({ld_asi_sel_p3,st_asi_sel_p3}),
	.dout	({pic_ld_asi_p4,pic_st_asi_p4}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign pic_asi_sel_p4 = pic_ld_asi_p4 | pic_st_asi_p4;

assign pic_asi_req = (pic_asi_sel_p4 | asi_req_ax) & ~kill_asi_st_p5;

assign asi_req_ax_next = (pic_asi_sel_p4 | (asi_req_ax & ~asi_ack)) & ~kill_asi_st_p5;

assign kill_asi_st_p4 = pic_st_asi_p4 & ~sbc_pic_kill_store_p4_;

lsu_pic_ctl_msff_ctl_macro__width_3 dff_asi_req  (
	.scan_in(dff_asi_req_scanin),
	.scan_out(dff_asi_req_scanout),
	.din	({asi_req_ax_next,sbc_pic_kill_store_p4_,kill_asi_st_p4}),
	.dout	({asi_req_ax,     kill_store_p5_,        kill_asi_st_p5}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
assign kill_store_p5__unused = kill_store_p5_;

// ASI interface will be busy in the cycle following a request until the request is acked
assign asi_busy = (pic_asi_sel_p4 | asi_req_ax) & ~asi_ack;
assign pic_asi_busy = asi_busy;

////////////////////////////////////////////////////////////////////////////////
// ASI ring power management
// Keep count of number of ring transactions outstanding.  If >0, enable the ring.
// Increment each time an ASI request is selected (watch for errors)
// Decrement each time it returns from the ring
// Shut down the ring so that bit[64] is held low.
////////////////////////////////////////////////////////////////////////////////

assign asi_dec[1:0] = {1'b0,|(dcc_asi_rtn_vld[7:0])} + {1'b0,kill_asi_st_p5};
assign asi_count_dec[4:0] = asi_count[4:0] - {3'b000,asi_dec[1:0]};

assign asi_count_in[4:0] = asi_count_dec[4:0] + {4'b0000,(ld_asi_sel_p3 | st_asi_sel_p3)};

assign asi_clken_next = ~lsu_misc_pmen | ld_asi_sel_p3 | st_asi_sel_p3 | (|(asi_count[4:0])) |
                        (lsu_asi_clken & ~lsu_ring_ctl);

lsu_pic_ctl_msff_ctl_macro__width_6 dff_asi_pm  (
	.scan_in(dff_asi_pm_scanin),
	.scan_out(dff_asi_pm_scanout),
	.din	({asi_clken_next,asi_count_in[4:0]}),
	.dout	({lsu_asi_clken, asi_count[4:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
// 0in underflow -var asi_count[4:0] 
// 0in overflow -var asi_count[4:0] 


lsu_pic_ctl_spare_ctl_macro__num_1 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

supply0 vss;
supply1 vdd;
// fixscan start:
assign dff_stb_full_scanin       = scan_in                  ;
assign dff_st_favor_scanin       = dff_stb_full_scanout     ;
assign dff_pic_p2_scanin         = dff_st_favor_scanout     ;
assign dff_pcx_p4_scanin         = dff_pic_p2_scanout       ;
assign dff_cas_select_scanin     = dff_pcx_p4_scanout       ;
assign dff_fifo_count_scanin     = dff_cas_select_scanout   ;
assign dff_asi_ack_scanin        = dff_fifo_count_scanout   ;
assign dff_asi_sel_pa_scanin     = dff_asi_ack_scanout      ;
assign dff_asi_req_scanin        = dff_asi_sel_pa_scanout   ;
assign dff_asi_pm_scanin         = dff_asi_req_scanout      ;
assign spares_scanin             = dff_asi_pm_scanout       ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module lsu_pic_ctl_l1clkhdr_ctl_macro (
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

module lsu_pic_ctl_msff_ctl_macro__width_1 (
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

module lsu_pic_ctl_msff_ctl_macro__width_4 (
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

module lsu_pic_ctl_msff_ctl_macro__width_5 (
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

module lsu_pic_ctl_msff_ctl_macro__width_2 (
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

module lsu_pic_ctl_msff_ctl_macro__width_3 (
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

module lsu_pic_ctl_msff_ctl_macro__width_6 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module lsu_pic_ctl_spare_ctl_macro__num_1 (
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
assign scan_out = so_0;



endmodule

