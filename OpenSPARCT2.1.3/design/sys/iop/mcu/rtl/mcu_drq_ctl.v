// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_drq_ctl.v
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
module mcu_drq_ctl (
  drq_wrbuf_valids, 
  drq_pending_wr_req, 
  drq_write_queue_cnt, 
  drq_rdbuf_valids, 
  drq_read_queue_cnt, 
  drq_rdq_full, 
  drq_rdq_free, 
  drq_empty, 
  drq_rd_req, 
  drq_wr_req, 
  drq_rd_entry7_val, 
  drq_rd_entry6_val, 
  drq_rd_entry5_val, 
  drq_rd_entry4_val, 
  drq_rd_entry3_val, 
  drq_rd_entry2_val, 
  drq_rd_entry1_val, 
  drq_rd_entry0_val, 
  drq_rd_bank_val, 
  drq_rd_entry0_rank, 
  drq_rd_entry1_rank, 
  drq_rd_entry2_rank, 
  drq_rd_entry3_rank, 
  drq_rd_entry4_rank, 
  drq_rd_entry5_rank, 
  drq_rd_entry6_rank, 
  drq_rd_entry7_rank, 
  drq_rd_entry0_dimm, 
  drq_rd_entry1_dimm, 
  drq_rd_entry2_dimm, 
  drq_rd_entry3_dimm, 
  drq_rd_entry4_dimm, 
  drq_rd_entry5_dimm, 
  drq_rd_entry6_dimm, 
  drq_rd_entry7_dimm, 
  drq_wr_entry0_rank, 
  drq_wr_entry1_rank, 
  drq_wr_entry2_rank, 
  drq_wr_entry3_rank, 
  drq_wr_entry4_rank, 
  drq_wr_entry5_rank, 
  drq_wr_entry6_rank, 
  drq_wr_entry7_rank, 
  drq_wr_entry0_dimm, 
  drq_wr_entry1_dimm, 
  drq_wr_entry2_dimm, 
  drq_wr_entry3_dimm, 
  drq_wr_entry4_dimm, 
  drq_wr_entry5_dimm, 
  drq_wr_entry6_dimm, 
  drq_wr_entry7_dimm, 
  drq_wr_queue_ent0, 
  drq_wr_queue_ent1, 
  drq_wr_queue_ent2, 
  drq_wr_queue_ent3, 
  drq_wr_queue_ent4, 
  drq_wr_queue_ent5, 
  drq_wr_queue_ent6, 
  drq_wr_queue_ent7, 
  drq_wdq_valid, 
  drq_rd_index_picked, 
  drq_wr_index_picked, 
  drq_wr_id_picked, 
  drq_rd_addr_picked, 
  drq_pd_mode_rd_incr, 
  drq_pd_mode_rd_decr, 
  drq_pd_mode_wr_incr, 
  drq_rd_adr_queue7_en, 
  drq_rd_adr_queue6_en, 
  drq_rd_adr_queue5_en, 
  drq_rd_adr_queue4_en, 
  drq_rd_adr_queue3_en, 
  drq_rd_adr_queue2_en, 
  drq_rd_adr_queue1_en, 
  drq_rd_adr_queue0_en, 
  drq_wr_adr_queue7_en, 
  drq_wr_adr_queue6_en, 
  drq_wr_adr_queue5_en, 
  drq_wr_adr_queue4_en, 
  drq_wr_adr_queue3_en, 
  drq_wr_adr_queue2_en, 
  drq_wr_adr_queue1_en, 
  drq_wr_adr_queue0_en, 
  drq_rd_adr_queue_sel, 
  drq_req_rdwr_addr_sel, 
  l2b_rank_rd_adr, 
  l2b_dimm_rd_adr, 
  l2b_bank_rd_adr, 
  l2b_addr_rd_err, 
  l2b_addr_rd_par, 
  l2b_rank_wr_adr, 
  l2b_dimm_wr_adr, 
  l2b_bank_wr_adr, 
  l2b_addr_wr_err, 
  l2b_addr_wr_par, 
  l2if_wr_req, 
  l2if_rd_req, 
  drq_cpu_wr_addr, 
  l2if_wdq_in_cntr, 
  drif_init, 
  drif_init_mcu_done, 
  drif_mcu_state_1, 
  drif_mcu_state_2, 
  drif_mcu_state_4, 
  drif_cmd_picked, 
  drif_rd_entry_picked, 
  drif_wr_entry_picked, 
  drif_blk_new_openbank, 
  pdmc_rank_avail, 
  drif_dimm_rd_available, 
  drif_refresh_rank, 
  drif_rd_picked, 
  drif_wr_picked, 
  drif_raw_hazard, 
  rdpctl_drq_clear_ent, 
  woq_wrq_clear_ent, 
  drif_drq_clear_ent, 
  woq_wr_queue_clear, 
  woq_wr_entry_picked, 
  drif_eight_bank_mode, 
  drif_stacked_dimm, 
  l1clk, 
  scan_in, 
  scan_out, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en);
wire siclk;
wire soclk;
wire se;
wire ff_rd_wr_val_scanin;
wire ff_rd_wr_val_scanout;
wire [3:0] drq_wdq_in_cntr;
wire ff_rd_addr_scanin;
wire ff_rd_addr_scanout;
wire [8:0] drq_rd_addr0;
wire ff_wr_addr_scanin;
wire ff_wr_addr_scanout;
wire [8:0] drq_wr_addr0;
wire [7:0] drq_clear_ent;
wire drq_rdq_free_in;
wire ff_rdq_free_scanin;
wire ff_rdq_free_scanout;
wire [7:0] drq_rdq_ent7_index_dec;
wire [7:0] drq_rdq_ent6_index_dec;
wire [7:0] drq_rdq_ent5_index_dec;
wire [7:0] drq_rdq_ent4_index_dec;
wire [7:0] drq_rdq_ent3_index_dec;
wire [7:0] drq_rdq_ent2_index_dec;
wire [7:0] drq_rdq_ent1_index_dec;
wire [7:0] drq_rdq_ent0_index_dec;
wire drq_wrq_empty;
wire drq_rdq_empty;
wire [2:0] drq_rd_addr_in;
wire [2:0] drq_wr_addr_in;
wire [7:0] drq_rdbuf_valids_in;
wire ff_rdbuf_valids_scanin;
wire ff_rdbuf_valids_scanout;
wire [7:0] drq_wrq_clear_ent;
wire [7:0] drq_wrbuf_valids_in;
wire ff_wrbuf_valids_scanin;
wire ff_wrbuf_valids_scanout;
wire [7:0] drq_wrbuf_issued_in;
wire [7:0] drq_wrbuf_issued;
wire ff_wrbuf_issued_scanin;
wire ff_wrbuf_issued_scanout;
wire [11:0] drq_rd_entry;
wire drq_rdq_bank_bit2;
wire [7:0] drq_read_queue_clear_in;
wire ff_read_queue_clear_scanin;
wire ff_read_queue_clear_scanout;
wire [7:0] drq_read_queue_clear;
wire drq_rd_entry_en;
wire [3:0] drq_read_queue_cnt_in;
wire ff_rd_collapse_fifo_cnt_scanin;
wire ff_rd_collapse_fifo_cnt_scanout;
wire [7:0] drq_rd_queue_valid;
wire drq_rd_queue_ent0_en;
wire drq_rd_queue_ent1_en;
wire drq_rd_queue_ent2_en;
wire drq_rd_queue_ent3_en;
wire drq_rd_queue_ent4_en;
wire drq_rd_queue_ent5_en;
wire drq_rd_queue_ent6_en;
wire drq_rd_queue_ent7_en;
wire [11:0] drq_rd_queue_ent0_in;
wire [11:0] drq_rd_queue_ent1;
wire [11:0] drq_rd_queue_ent1_in;
wire [11:0] drq_rd_queue_ent2;
wire [11:0] drq_rd_queue_ent2_in;
wire [11:0] drq_rd_queue_ent3;
wire [11:0] drq_rd_queue_ent3_in;
wire [11:0] drq_rd_queue_ent4;
wire [11:0] drq_rd_queue_ent4_in;
wire [11:0] drq_rd_queue_ent5;
wire [11:0] drq_rd_queue_ent5_in;
wire [11:0] drq_rd_queue_ent6;
wire [11:0] drq_rd_queue_ent6_in;
wire [11:0] drq_rd_queue_ent7;
wire [11:0] drq_rd_queue_ent7_in;
wire ff_rd_collapse_fifo_ent0_scanin;
wire ff_rd_collapse_fifo_ent0_scanout;
wire [11:0] drq_rd_queue_ent0;
wire ff_rd_collapse_fifo_ent1_scanin;
wire ff_rd_collapse_fifo_ent1_scanout;
wire ff_rd_collapse_fifo_ent2_scanin;
wire ff_rd_collapse_fifo_ent2_scanout;
wire ff_rd_collapse_fifo_ent3_scanin;
wire ff_rd_collapse_fifo_ent3_scanout;
wire ff_rd_collapse_fifo_ent4_scanin;
wire ff_rd_collapse_fifo_ent4_scanout;
wire ff_rd_collapse_fifo_ent5_scanin;
wire ff_rd_collapse_fifo_ent5_scanout;
wire ff_rd_collapse_fifo_ent6_scanin;
wire ff_rd_collapse_fifo_ent6_scanout;
wire ff_rd_collapse_fifo_ent7_scanin;
wire ff_rd_collapse_fifo_ent7_scanout;
wire drq_wrq_full;
wire [14:0] drq_wr_entry;
wire drq_wrq_bank_bit2;
wire [7:0] drq_write_queue_clear;
wire drq_wr_entry_en;
wire [3:0] drq_write_queue_cnt_in;
wire ff_wr_collapse_fifo_cnt_scanin;
wire ff_wr_collapse_fifo_cnt_scanout;
wire [7:0] drq_wr_queue_valid;
wire drq_wr_queue_ent0_en;
wire drq_wr_queue_ent1_en;
wire drq_wr_queue_ent2_en;
wire drq_wr_queue_ent3_en;
wire drq_wr_queue_ent4_en;
wire drq_wr_queue_ent5_en;
wire drq_wr_queue_ent6_en;
wire drq_wr_queue_ent7_en;
wire [14:0] drq_wr_queue_ent0_in;
wire [14:0] drq_wr_queue_ent1_in;
wire [14:0] drq_wr_queue_ent2_in;
wire [14:0] drq_wr_queue_ent3_in;
wire [14:0] drq_wr_queue_ent4_in;
wire [14:0] drq_wr_queue_ent5_in;
wire [14:0] drq_wr_queue_ent6_in;
wire [14:0] drq_wr_queue_ent7_in;
wire ff_wr_collapse_fifo_ent0_scanin;
wire ff_wr_collapse_fifo_ent0_scanout;
wire ff_wr_collapse_fifo_ent1_scanin;
wire ff_wr_collapse_fifo_ent1_scanout;
wire ff_wr_collapse_fifo_ent2_scanin;
wire ff_wr_collapse_fifo_ent2_scanout;
wire ff_wr_collapse_fifo_ent3_scanin;
wire ff_wr_collapse_fifo_ent3_scanout;
wire ff_wr_collapse_fifo_ent4_scanin;
wire ff_wr_collapse_fifo_ent4_scanout;
wire ff_wr_collapse_fifo_ent5_scanin;
wire ff_wr_collapse_fifo_ent5_scanout;
wire ff_wr_collapse_fifo_ent6_scanin;
wire ff_wr_collapse_fifo_ent6_scanout;
wire ff_wr_collapse_fifo_ent7_scanin;
wire ff_wr_collapse_fifo_ent7_scanout;
wire [3:0] drq_wdq_out_cntr_in;
wire [3:0] drq_wdq_out_cntr;
wire drq_wdq_out_cntr_en;
wire ff_wdq_out_cntr_scanin;
wire ff_wdq_out_cntr_scanout;
wire [3:0] drq_wdq_cnt;
wire [3:0] drq_rdq_ent0_bnk;
wire [3:0] drq_rdq_ent1_bnk;
wire [3:0] drq_rdq_ent2_bnk;
wire [3:0] drq_rdq_ent3_bnk;
wire [3:0] drq_rdq_ent4_bnk;
wire [3:0] drq_rdq_ent5_bnk;
wire [3:0] drq_rdq_ent6_bnk;
wire [3:0] drq_rdq_ent7_bnk;
wire [15:0] drq_rd_banksel_addr0_dec;
wire [15:0] drq_rd_banksel_addr1_dec;
wire [15:0] drq_rd_banksel_addr2_dec;
wire [15:0] drq_rd_banksel_addr3_dec;
wire [15:0] drq_rd_banksel_addr4_dec;
wire [15:0] drq_rd_banksel_addr5_dec;
wire [15:0] drq_rd_banksel_addr6_dec;
wire [15:0] drq_rd_banksel_addr7_dec;
wire drq_rdq_ent7_rank_avail;
wire drq_rdq_ent6_rank_avail;
wire drq_rdq_ent5_rank_avail;
wire drq_rdq_ent4_rank_avail;
wire drq_rdq_ent3_rank_avail;
wire drq_rdq_ent2_rank_avail;
wire drq_rdq_ent1_rank_avail;
wire drq_rdq_ent0_rank_avail;
wire [6:0] drq_wr_addr_picked;
wire [15:0] drq_rdq_ent0_rank_dec;
wire [15:0] drq_rdq_ent1_rank_dec;
wire [15:0] drq_rdq_ent2_rank_dec;
wire [15:0] drq_rdq_ent3_rank_dec;
wire [15:0] drq_rdq_ent4_rank_dec;
wire [15:0] drq_rdq_ent5_rank_dec;
wire [15:0] drq_rdq_ent6_rank_dec;
wire [15:0] drq_rdq_ent7_rank_dec;
wire [15:0] drq_rank_avail;
wire [15:0] drq_pd_mode_rd_decr_in;
wire ff_pd_mode_rd_decr_scanin;
wire ff_pd_mode_rd_decr_scanout;


// from mcu to cpu clk domain
output	[7:0] 	drq_wrbuf_valids;	// write request queue entries that are valid
output	[7:0]	drq_pending_wr_req;
output	[3:0]	drq_write_queue_cnt;	// count of write requests for performance counters

output	[7:0] 	drq_rdbuf_valids;	// read request queue entries that are valid
output	[3:0]	drq_read_queue_cnt;	// count of read requests for performance counters
output		drq_rdq_full;		// read reuest queue full
output		drq_rdq_free;		// indicates read queue enties has been freed up

output		drq_empty;
output		drq_rd_req;
output		drq_wr_req;

// bank indicator for read queue entries
output	[15:0]	drq_rd_entry7_val;
output	[15:0]	drq_rd_entry6_val;
output	[15:0]	drq_rd_entry5_val;
output	[15:0]	drq_rd_entry4_val;
output	[15:0]	drq_rd_entry3_val;
output	[15:0]	drq_rd_entry2_val;
output	[15:0]	drq_rd_entry1_val;
output	[15:0]	drq_rd_entry0_val;

output	[15:0]	drq_rd_bank_val;

// rank of read queue entries
output	 	drq_rd_entry0_rank;
output	 	drq_rd_entry1_rank;
output	 	drq_rd_entry2_rank;
output	 	drq_rd_entry3_rank;
output	 	drq_rd_entry4_rank;
output	 	drq_rd_entry5_rank;
output	 	drq_rd_entry6_rank;
output	 	drq_rd_entry7_rank;

// dimm of read queue entries
output	[2:0]	drq_rd_entry0_dimm;
output	[2:0] 	drq_rd_entry1_dimm;
output	[2:0] 	drq_rd_entry2_dimm;
output	[2:0] 	drq_rd_entry3_dimm;
output	[2:0] 	drq_rd_entry4_dimm;
output	[2:0] 	drq_rd_entry5_dimm;
output	[2:0] 	drq_rd_entry6_dimm;
output	[2:0] 	drq_rd_entry7_dimm;

// rank of write queue entries
output	 	drq_wr_entry0_rank;
output	 	drq_wr_entry1_rank;
output	 	drq_wr_entry2_rank;
output	 	drq_wr_entry3_rank;
output	 	drq_wr_entry4_rank;
output	 	drq_wr_entry5_rank;
output	 	drq_wr_entry6_rank;
output	 	drq_wr_entry7_rank;

// dimm of write queue entries
output	[2:0] 	drq_wr_entry0_dimm;
output	[2:0]	drq_wr_entry1_dimm;
output	[2:0]	drq_wr_entry2_dimm;
output	[2:0] 	drq_wr_entry3_dimm;
output	[2:0] 	drq_wr_entry4_dimm;
output	[2:0] 	drq_wr_entry5_dimm;
output	[2:0] 	drq_wr_entry6_dimm;
output	[2:0] 	drq_wr_entry7_dimm;

output	[14:0]	drq_wr_queue_ent0;
output	[14:0]	drq_wr_queue_ent1;
output	[14:0]	drq_wr_queue_ent2;
output	[14:0]	drq_wr_queue_ent3;
output	[14:0]	drq_wr_queue_ent4;
output	[14:0]	drq_wr_queue_ent5;
output	[14:0]	drq_wr_queue_ent6;
output	[14:0]	drq_wr_queue_ent7;
output	[7:0]	drq_wdq_valid;

output	[2:0]	drq_rd_index_picked;	// index in read request queue of picked read
output	[2:0]	drq_wr_index_picked;	// index in write request queue of picked write
output	[2:0]	drq_wr_id_picked;	// index in write data queue of picked write

output	[9:0]	drq_rd_addr_picked;	// bank, rank, parity, err for picked read

output	[15:0]	drq_pd_mode_rd_incr;
output	[15:0]	drq_pd_mode_rd_decr;
output	[15:0]	drq_pd_mode_wr_incr;

// load enables for read request queue entries
output		drq_rd_adr_queue7_en;
output		drq_rd_adr_queue6_en;
output		drq_rd_adr_queue5_en;
output		drq_rd_adr_queue4_en;
output		drq_rd_adr_queue3_en;
output		drq_rd_adr_queue2_en;
output		drq_rd_adr_queue1_en;
output		drq_rd_adr_queue0_en;

// load enables for write request queue entries
output		drq_wr_adr_queue7_en;
output		drq_wr_adr_queue6_en;
output		drq_wr_adr_queue5_en;
output		drq_wr_adr_queue4_en;
output		drq_wr_adr_queue3_en;
output		drq_wr_adr_queue2_en;
output		drq_wr_adr_queue1_en;
output		drq_wr_adr_queue0_en;

output	[7:0]	drq_rd_adr_queue_sel;	// output select for read request queue
output		drq_req_rdwr_addr_sel;	// select between read and write request queues

// bank, rank, parity, err for incoming read request
input	 	l2b_rank_rd_adr;
input	[2:0] 	l2b_dimm_rd_adr;
input	[2:0]  	l2b_bank_rd_adr;
input	        l2b_addr_rd_err;
input	        l2b_addr_rd_par;

// bank, rank, parity, err for incoming write request
input	   	l2b_rank_wr_adr;
input	[2:0]   l2b_dimm_wr_adr;
input	[2:0]   l2b_bank_wr_adr;
input		l2b_addr_wr_err;
input	        l2b_addr_wr_par;

// incoming request signals
input	        l2if_wr_req;
input	        l2if_rd_req;
input	[2:0]	drq_cpu_wr_addr;
input	[3:0]	l2if_wdq_in_cntr;

// state information from drif state machine
input		drif_init;
input		drif_init_mcu_done;
input		drif_mcu_state_1;
input		drif_mcu_state_2;
input		drif_mcu_state_4;

input		drif_cmd_picked;	// 0=read, 1=write picked
input	[7:0]	drif_rd_entry_picked;	// entry in read request queue that was picked
input	[7:0]	drif_wr_entry_picked;	// entry in write request queue that was picked

input		drif_blk_new_openbank;	// block new open banks when asserted for power throttling
input	[15:0]	pdmc_rank_avail;
input	[7:0]	drif_dimm_rd_available;
input	[3:0]	drif_refresh_rank;	// rank being refreshed; requests are blocked to this rank
					// during refresh
input		drif_rd_picked;		// read command picked, qualifies drif_cmd_picked
input		drif_wr_picked;		// write command picked, qualifies drif_cmd_picked
input		drif_raw_hazard;	// read after write hazard detected, don't dequeue read

input	[7:0]	rdpctl_drq_clear_ent;	// read request queue entry to clear
input	[7:0]	woq_wrq_clear_ent;	// write request queue entry to clear
input	[7:0]	drif_drq_clear_ent;	// read request queue entry to clear after error processing

input	[7:0]	woq_wr_queue_clear;
input	[7:0]	woq_wr_entry_picked;

// address mode information for using 8-bank scheduling algorithm when in 4-bank mode
input		drif_eight_bank_mode;	
input		drif_stacked_dimm;

input		l1clk;
input 		scan_in;
output		scan_out;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;

// Scan reassigns
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

//////////////////////////////////////////////////////////////////
// Flopping the cpu domain signals to mcu domain
//////////////////////////////////////////////////////////////////
mcu_drq_ctl_msff_ctl_macro__width_6 ff_rd_wr_val  (
        .scan_in(ff_rd_wr_val_scanin),
        .scan_out(ff_rd_wr_val_scanout),
        .din({l2if_wr_req, l2if_rd_req, l2if_wdq_in_cntr[3:0]}),
        .dout({drq_wr_req, drq_rd_req, drq_wdq_in_cntr[3:0]}),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// read address information for scheduling
mcu_drq_ctl_msff_ctl_macro__width_9 ff_rd_addr  (
        .scan_in(ff_rd_addr_scanin),
        .scan_out(ff_rd_addr_scanout),
        .din({l2b_addr_rd_par,l2b_addr_rd_err,l2b_rank_rd_adr,l2b_dimm_rd_adr[2:0],l2b_bank_rd_adr[2:0]}),
        .dout(drq_rd_addr0[8:0]),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// write address information for scheduling
mcu_drq_ctl_msff_ctl_macro__width_9 ff_wr_addr  (
        .scan_in(ff_wr_addr_scanin),
        .scan_out(ff_wr_addr_scanout),
        .din({l2b_addr_wr_par,l2b_addr_wr_err,l2b_rank_wr_adr,l2b_dimm_wr_adr[2:0],l2b_bank_wr_adr[2:0]}),
        .dout(drq_wr_addr0[8:0]),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// clearing an entry from read queue
// drif_drq_clear_ent - for clearing after error retries
// rdpctl_drq_clear_ent - for clearing when no error has occurred
assign drq_clear_ent[7:0] = drif_drq_clear_ent[7:0] | rdpctl_drq_clear_ent[7:0];

// let l2if know that a read request queue entry was cleared
assign drq_rdq_free_in = |drq_clear_ent[7:0];

mcu_drq_ctl_msff_ctl_macro__width_1 ff_rdq_free  (
        .scan_in(ff_rdq_free_scanin),
        .scan_out(ff_rdq_free_scanout),
        .din(drq_rdq_free_in),
        .dout(drq_rdq_free),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// select for read address queue entry
// 0in one_hot -var drq_rd_adr_queue_sel[7:0]
assign drq_rd_adr_queue_sel[7:0] =      {8{drif_rd_entry_picked[7]}} & drq_rdq_ent7_index_dec[7:0] |
                                	{8{drif_rd_entry_picked[6]}} & drq_rdq_ent6_index_dec[7:0] |
                                	{8{drif_rd_entry_picked[5]}} & drq_rdq_ent5_index_dec[7:0] | 
					{8{drif_rd_entry_picked[4]}} & drq_rdq_ent4_index_dec[7:0] |
					{8{drif_rd_entry_picked[3]}} & drq_rdq_ent3_index_dec[7:0] |
					{8{drif_rd_entry_picked[2]}} & drq_rdq_ent2_index_dec[7:0] |
                                	{8{drif_rd_entry_picked[1]}} & drq_rdq_ent1_index_dec[7:0] | 
                                	{8{drif_rd_entry_picked[0]}} & drq_rdq_ent0_index_dec[7:0] |
					{7'h0,~(|drif_rd_entry_picked[7:0])};

// select between read and write address queues
// 0 = read, 1 = write
assign drq_req_rdwr_addr_sel = ~(|drif_rd_entry_picked[7:0]);

assign drq_empty = drq_wrq_empty & drq_rdq_empty;

//////////////////////////////////////////////////////////////////
// Determine which read address queue entry to load 
//////////////////////////////////////////////////////////////////

// Assertions to ensure valid entries are not overwritten
//    nor empty entries cleared
// 0in req_ack -req drq_rd_adr_queue0_en -ack drq_clear_ent[0]
// 0in req_ack -req drq_rd_adr_queue1_en -ack drq_clear_ent[1]
// 0in req_ack -req drq_rd_adr_queue2_en -ack drq_clear_ent[2]
// 0in req_ack -req drq_rd_adr_queue3_en -ack drq_clear_ent[3]
// 0in req_ack -req drq_rd_adr_queue4_en -ack drq_clear_ent[4]
// 0in req_ack -req drq_rd_adr_queue5_en -ack drq_clear_ent[5]
// 0in req_ack -req drq_rd_adr_queue6_en -ack drq_clear_ent[6]
// 0in req_ack -req drq_rd_adr_queue7_en -ack drq_clear_ent[7]

assign drq_rd_adr_queue0_en =  ~drq_rdbuf_valids[0] & drq_rd_req; 
assign drq_rd_adr_queue1_en =  ~drq_rdbuf_valids[1] & drq_rdbuf_valids[0] & drq_rd_req;
assign drq_rd_adr_queue2_en =  ~drq_rdbuf_valids[2] & (&drq_rdbuf_valids[1:0]) & drq_rd_req; 
assign drq_rd_adr_queue3_en =  ~drq_rdbuf_valids[3] & (&drq_rdbuf_valids[2:0]) & drq_rd_req; 
assign drq_rd_adr_queue4_en =  ~drq_rdbuf_valids[4] & (&drq_rdbuf_valids[3:0]) & drq_rd_req;
assign drq_rd_adr_queue5_en =  ~drq_rdbuf_valids[5] & (&drq_rdbuf_valids[4:0]) & drq_rd_req;
assign drq_rd_adr_queue6_en =  ~drq_rdbuf_valids[6] & (&drq_rdbuf_valids[5:0]) & drq_rd_req;
assign drq_rd_adr_queue7_en =  ~drq_rdbuf_valids[7] & (&drq_rdbuf_valids[6:0]) & drq_rd_req;

assign drq_rd_addr_in[2:0] = {drq_rd_adr_queue4_en | drq_rd_adr_queue5_en | drq_rd_adr_queue6_en | drq_rd_adr_queue7_en, 
			drq_rd_adr_queue2_en | drq_rd_adr_queue3_en | drq_rd_adr_queue6_en | drq_rd_adr_queue7_en, 
			drq_rd_adr_queue1_en | drq_rd_adr_queue3_en | drq_rd_adr_queue5_en | drq_rd_adr_queue7_en};

//////////////////////////////////////////////////////////////////
// Determine which write address queue entry to load.
// Silently drop req if address is out of range. 
//    so AND it with address error bit (drq_wr_addr0[7])
//////////////////////////////////////////////////////////////////

// Assertions to ensure valid entries are not overwritten
//    nor empty entries cleared
// 0in req_ack -req drq_wr_adr_queue0_en -ack drq_wrq_clear_ent[0]
// 0in req_ack -req drq_wr_adr_queue1_en -ack drq_wrq_clear_ent[1]
// 0in req_ack -req drq_wr_adr_queue2_en -ack drq_wrq_clear_ent[2]
// 0in req_ack -req drq_wr_adr_queue3_en -ack drq_wrq_clear_ent[3]
// 0in req_ack -req drq_wr_adr_queue4_en -ack drq_wrq_clear_ent[4]
// 0in req_ack -req drq_wr_adr_queue5_en -ack drq_wrq_clear_ent[5]
// 0in req_ack -req drq_wr_adr_queue6_en -ack drq_wrq_clear_ent[6]
// 0in req_ack -req drq_wr_adr_queue7_en -ack drq_wrq_clear_ent[7]

assign drq_wr_adr_queue0_en =  ~drq_wrbuf_valids[0] & drq_wr_req & ~drq_wr_addr0[7];
assign drq_wr_adr_queue1_en =  ~drq_wrbuf_valids[1] & drq_wrbuf_valids[0] & drq_wr_req & ~drq_wr_addr0[7]; 
assign drq_wr_adr_queue2_en =  ~drq_wrbuf_valids[2] & (&drq_wrbuf_valids[1:0]) & drq_wr_req & ~drq_wr_addr0[7]; 
assign drq_wr_adr_queue3_en =  ~drq_wrbuf_valids[3] & (&drq_wrbuf_valids[2:0]) & drq_wr_req & ~drq_wr_addr0[7];
assign drq_wr_adr_queue4_en =  ~drq_wrbuf_valids[4] & (&drq_wrbuf_valids[3:0]) & drq_wr_req & ~drq_wr_addr0[7];
assign drq_wr_adr_queue5_en =  ~drq_wrbuf_valids[5] & (&drq_wrbuf_valids[4:0]) & drq_wr_req & ~drq_wr_addr0[7];
assign drq_wr_adr_queue6_en =  ~drq_wrbuf_valids[6] & (&drq_wrbuf_valids[5:0]) & drq_wr_req & ~drq_wr_addr0[7];
assign drq_wr_adr_queue7_en =  ~drq_wrbuf_valids[7] & (&drq_wrbuf_valids[6:0]) & drq_wr_req & ~drq_wr_addr0[7];

assign drq_wr_addr_in[2:0] = {drq_wr_adr_queue4_en | drq_wr_adr_queue5_en | drq_wr_adr_queue6_en | drq_wr_adr_queue7_en, 
			drq_wr_adr_queue2_en | drq_wr_adr_queue3_en | drq_wr_adr_queue6_en | drq_wr_adr_queue7_en, 
			drq_wr_adr_queue1_en | drq_wr_adr_queue3_en | drq_wr_adr_queue5_en | drq_wr_adr_queue7_en};

//////////////////////////////////////////////////////////////////
// Valids for address queue entries
//////////////////////////////////////////////////////////////////

// Valids for address queue entries

assign drq_rdbuf_valids_in[0] = drq_rd_adr_queue0_en ? 1'b1 : drq_clear_ent[0] ? 1'b0 : drq_rdbuf_valids[0];
assign drq_rdbuf_valids_in[1] = drq_rd_adr_queue1_en ? 1'b1 : drq_clear_ent[1] ? 1'b0 : drq_rdbuf_valids[1];
assign drq_rdbuf_valids_in[2] = drq_rd_adr_queue2_en ? 1'b1 : drq_clear_ent[2] ? 1'b0 : drq_rdbuf_valids[2];
assign drq_rdbuf_valids_in[3] = drq_rd_adr_queue3_en ? 1'b1 : drq_clear_ent[3] ? 1'b0 : drq_rdbuf_valids[3];
assign drq_rdbuf_valids_in[4] = drq_rd_adr_queue4_en ? 1'b1 : drq_clear_ent[4] ? 1'b0 : drq_rdbuf_valids[4];
assign drq_rdbuf_valids_in[5] = drq_rd_adr_queue5_en ? 1'b1 : drq_clear_ent[5] ? 1'b0 : drq_rdbuf_valids[5];
assign drq_rdbuf_valids_in[6] = drq_rd_adr_queue6_en ? 1'b1 : drq_clear_ent[6] ? 1'b0 : drq_rdbuf_valids[6];
assign drq_rdbuf_valids_in[7] = drq_rd_adr_queue7_en ? 1'b1 : drq_clear_ent[7] ? 1'b0 : drq_rdbuf_valids[7];

mcu_drq_ctl_msff_ctl_macro__width_8 ff_rdbuf_valids  (
	.scan_in(ff_rdbuf_valids_scanin),
	.scan_out(ff_rdbuf_valids_scanout),
	.din(drq_rdbuf_valids_in[7:0]),
	.dout(drq_rdbuf_valids[7:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// Writes Address queue entry valids
//////////////////////////////////////////////////////////////////

// Valids for write address queue entries

assign drq_wrq_clear_ent[7:0] = woq_wrq_clear_ent[7:0];
assign drq_wrbuf_valids_in[0] = drq_wr_adr_queue0_en ? 1'b1 : drq_wrq_clear_ent[0] ? 1'b0 : drq_wrbuf_valids[0];
assign drq_wrbuf_valids_in[1] = drq_wr_adr_queue1_en ? 1'b1 : drq_wrq_clear_ent[1] ? 1'b0 : drq_wrbuf_valids[1];
assign drq_wrbuf_valids_in[2] = drq_wr_adr_queue2_en ? 1'b1 : drq_wrq_clear_ent[2] ? 1'b0 : drq_wrbuf_valids[2];
assign drq_wrbuf_valids_in[3] = drq_wr_adr_queue3_en ? 1'b1 : drq_wrq_clear_ent[3] ? 1'b0 : drq_wrbuf_valids[3];
assign drq_wrbuf_valids_in[4] = drq_wr_adr_queue4_en ? 1'b1 : drq_wrq_clear_ent[4] ? 1'b0 : drq_wrbuf_valids[4];
assign drq_wrbuf_valids_in[5] = drq_wr_adr_queue5_en ? 1'b1 : drq_wrq_clear_ent[5] ? 1'b0 : drq_wrbuf_valids[5];
assign drq_wrbuf_valids_in[6] = drq_wr_adr_queue6_en ? 1'b1 : drq_wrq_clear_ent[6] ? 1'b0 : drq_wrbuf_valids[6];
assign drq_wrbuf_valids_in[7] = drq_wr_adr_queue7_en ? 1'b1 : drq_wrq_clear_ent[7] ? 1'b0 : drq_wrbuf_valids[7];

mcu_drq_ctl_msff_ctl_macro__width_8 ff_wrbuf_valids  (
	.scan_in(ff_wrbuf_valids_scanin),
	.scan_out(ff_wrbuf_valids_scanout),
	.din(drq_wrbuf_valids_in[7:0]),
	.dout(drq_wrbuf_valids[7:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// CLEANUP - write retiring
// set when write transaction is issued from woq; used for RAW hazard detection
assign drq_wrbuf_issued_in[0] = woq_wr_entry_picked[0] ? 1'b1 : drq_wrq_clear_ent[0] ? 1'b0 : drq_wrbuf_issued[0];
assign drq_wrbuf_issued_in[1] = woq_wr_entry_picked[1] ? 1'b1 : drq_wrq_clear_ent[1] ? 1'b0 : drq_wrbuf_issued[1];
assign drq_wrbuf_issued_in[2] = woq_wr_entry_picked[2] ? 1'b1 : drq_wrq_clear_ent[2] ? 1'b0 : drq_wrbuf_issued[2];
assign drq_wrbuf_issued_in[3] = woq_wr_entry_picked[3] ? 1'b1 : drq_wrq_clear_ent[3] ? 1'b0 : drq_wrbuf_issued[3];
assign drq_wrbuf_issued_in[4] = woq_wr_entry_picked[4] ? 1'b1 : drq_wrq_clear_ent[4] ? 1'b0 : drq_wrbuf_issued[4];
assign drq_wrbuf_issued_in[5] = woq_wr_entry_picked[5] ? 1'b1 : drq_wrq_clear_ent[5] ? 1'b0 : drq_wrbuf_issued[5];
assign drq_wrbuf_issued_in[6] = woq_wr_entry_picked[6] ? 1'b1 : drq_wrq_clear_ent[6] ? 1'b0 : drq_wrbuf_issued[6];
assign drq_wrbuf_issued_in[7] = woq_wr_entry_picked[7] ? 1'b1 : drq_wrq_clear_ent[7] ? 1'b0 : drq_wrbuf_issued[7];

mcu_drq_ctl_msff_ctl_macro__width_8 ff_wrbuf_issued  (
	.scan_in(ff_wrbuf_issued_scanin),
	.scan_out(ff_wrbuf_issued_scanout),
	.din(drq_wrbuf_issued_in[7:0]),
	.dout(drq_wrbuf_issued[7:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drq_pending_wr_req[7:0] = drq_wrbuf_valids[7:0] & ~drq_wrbuf_issued[7:0];

//////////////////////////////////////////////////////////////////
// Collapsing queue for reads
//	This queue allows requests to be pulled from any location.
//	The newest request is always added at the tail.  The oldest
//	entry is in the queue always at ent0.
//////////////////////////////////////////////////////////////////
assign drq_rdq_full = &drq_rdbuf_valids[7:0];
assign drq_rdq_empty = ~(|drq_rdbuf_valids[7:0]);

// read request queue entry contents
// 11:9 - index into address queue
// 8 - parity
// 7 - address error
// 6 - rank
// 5:3 - dimm
// 2:0 - bank for scheduling
assign drq_rd_entry[11:0] = {drq_rd_addr_in[2:0], drq_rd_addr0[8:3], drq_rdq_bank_bit2, drq_rd_addr0[1:0]};

// when in 4-bank mode, use rank information for bank bit 2 when scheduling requests
assign drq_rdq_bank_bit2 = drif_eight_bank_mode ? drq_rd_addr0[2] : 
			   drif_stacked_dimm ? drq_rd_addr0[6] : drq_rd_addr0[3];

// reset request queue entry's valid bit once it gets scheduled
assign drq_read_queue_clear_in[7:0] = drif_rd_entry_picked[7:0] & {8{~drif_raw_hazard}};
mcu_drq_ctl_msff_ctl_macro__width_8 ff_read_queue_clear  (
	.scan_in(ff_read_queue_clear_scanin),
	.scan_out(ff_read_queue_clear_scanout),
	.din(drq_read_queue_clear_in[7:0]),
	.dout(drq_read_queue_clear[7:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// keep track of entry count 
assign drq_rd_entry_en = drq_rd_req & ~drq_rdq_full;
assign drq_read_queue_cnt_in[3:0] = drq_rd_entry_en & ~(|drq_read_queue_clear[7:0]) ? drq_read_queue_cnt[3:0] + 4'h1 : 
					(|drq_read_queue_clear[7:0]) & ~drq_rd_entry_en ? drq_read_queue_cnt[3:0] - 4'h1 : 
					drq_read_queue_cnt[3:0];

mcu_drq_ctl_msff_ctl_macro__width_4 ff_rd_collapse_fifo_cnt  (
	.scan_in(ff_rd_collapse_fifo_cnt_scanin),
	.scan_out(ff_rd_collapse_fifo_cnt_scanout),
	.din(drq_read_queue_cnt_in[3:0]),
	.dout(drq_read_queue_cnt[3:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// set the valids in the request queue based on the entry count
assign drq_rd_queue_valid[7:0] = {7'h0,   drq_read_queue_cnt[3:0] == 4'h1}   | 
				   {6'h0,{2{drq_read_queue_cnt[3:0] == 4'h2}}} |
				   {5'h0,{3{drq_read_queue_cnt[3:0] == 4'h3}}} |
				   {4'h0,{4{drq_read_queue_cnt[3:0] == 4'h4}}} |
				   {3'h0,{5{drq_read_queue_cnt[3:0] == 4'h5}}} |
				   {2'h0,{6{drq_read_queue_cnt[3:0] == 4'h6}}} |
				   {1'h0,{7{drq_read_queue_cnt[3:0] == 4'h7}}} |
					 {8{drq_read_queue_cnt[3:0] == 4'h8}};

// 0in fifo -enq drq_rd_entry_en -deq (|drq_read_queue_clear[7:0]) -depth 8
assign drq_rd_queue_ent0_en = (drq_read_queue_cnt[3:0] == 4'h0) & drq_rd_entry_en | drq_read_queue_clear[0];
assign drq_rd_queue_ent1_en = ~drq_rd_queue_valid[1] & drq_rd_entry_en | (|drq_read_queue_clear[1:0]);
assign drq_rd_queue_ent2_en = ~drq_rd_queue_valid[2] & drq_rd_entry_en | (|drq_read_queue_clear[2:0]);
assign drq_rd_queue_ent3_en = ~drq_rd_queue_valid[3] & drq_rd_entry_en | (|drq_read_queue_clear[3:0]);
assign drq_rd_queue_ent4_en = ~drq_rd_queue_valid[4] & drq_rd_entry_en | (|drq_read_queue_clear[4:0]);
assign drq_rd_queue_ent5_en = ~drq_rd_queue_valid[5] & drq_rd_entry_en | (|drq_read_queue_clear[5:0]);
assign drq_rd_queue_ent6_en = ~drq_rd_queue_valid[6] & drq_rd_entry_en | (|drq_read_queue_clear[6:0]);
assign drq_rd_queue_ent7_en = ~drq_rd_queue_valid[7] & drq_rd_entry_en | (|drq_read_queue_clear[7:0]);

assign drq_rd_queue_ent0_in[11:0] = drq_rd_queue_valid[1] ? drq_rd_queue_ent1[11:0] : drq_rd_entry[11:0];
assign drq_rd_queue_ent1_in[11:0] = drq_rd_queue_valid[2] ? drq_rd_queue_ent2[11:0] : drq_rd_entry[11:0];
assign drq_rd_queue_ent2_in[11:0] = drq_rd_queue_valid[3] ? drq_rd_queue_ent3[11:0] : drq_rd_entry[11:0];
assign drq_rd_queue_ent3_in[11:0] = drq_rd_queue_valid[4] ? drq_rd_queue_ent4[11:0] : drq_rd_entry[11:0];
assign drq_rd_queue_ent4_in[11:0] = drq_rd_queue_valid[5] ? drq_rd_queue_ent5[11:0] : drq_rd_entry[11:0];
assign drq_rd_queue_ent5_in[11:0] = drq_rd_queue_valid[6] ? drq_rd_queue_ent6[11:0] : drq_rd_entry[11:0];
assign drq_rd_queue_ent6_in[11:0] = drq_rd_queue_valid[7] ? drq_rd_queue_ent7[11:0] : drq_rd_entry[11:0];
assign drq_rd_queue_ent7_in[11:0] = drq_rd_entry[11:0];

mcu_drq_ctl_msff_ctl_macro__en_1__width_12 ff_rd_collapse_fifo_ent0  (
	.scan_in(ff_rd_collapse_fifo_ent0_scanin),
	.scan_out(ff_rd_collapse_fifo_ent0_scanout),
	.din(drq_rd_queue_ent0_in[11:0]),
	.dout(drq_rd_queue_ent0[11:0]),
	.en(drq_rd_queue_ent0_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drq_ctl_msff_ctl_macro__en_1__width_12 ff_rd_collapse_fifo_ent1  (
	.scan_in(ff_rd_collapse_fifo_ent1_scanin),
	.scan_out(ff_rd_collapse_fifo_ent1_scanout),
	.din(drq_rd_queue_ent1_in[11:0]),
	.dout(drq_rd_queue_ent1[11:0]),
	.en(drq_rd_queue_ent1_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drq_ctl_msff_ctl_macro__en_1__width_12 ff_rd_collapse_fifo_ent2  (
	.scan_in(ff_rd_collapse_fifo_ent2_scanin),
	.scan_out(ff_rd_collapse_fifo_ent2_scanout),
	.din(drq_rd_queue_ent2_in[11:0]),
	.dout(drq_rd_queue_ent2[11:0]),
	.en(drq_rd_queue_ent2_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drq_ctl_msff_ctl_macro__en_1__width_12 ff_rd_collapse_fifo_ent3  (
	.scan_in(ff_rd_collapse_fifo_ent3_scanin),
	.scan_out(ff_rd_collapse_fifo_ent3_scanout),
	.din(drq_rd_queue_ent3_in[11:0]),
	.dout(drq_rd_queue_ent3[11:0]),
	.en(drq_rd_queue_ent3_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drq_ctl_msff_ctl_macro__en_1__width_12 ff_rd_collapse_fifo_ent4  (
	.scan_in(ff_rd_collapse_fifo_ent4_scanin),
	.scan_out(ff_rd_collapse_fifo_ent4_scanout),
	.din(drq_rd_queue_ent4_in[11:0]),
	.dout(drq_rd_queue_ent4[11:0]),
	.en(drq_rd_queue_ent4_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drq_ctl_msff_ctl_macro__en_1__width_12 ff_rd_collapse_fifo_ent5  (
	.scan_in(ff_rd_collapse_fifo_ent5_scanin),
	.scan_out(ff_rd_collapse_fifo_ent5_scanout),
	.din(drq_rd_queue_ent5_in[11:0]),
	.dout(drq_rd_queue_ent5[11:0]),
	.en(drq_rd_queue_ent5_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drq_ctl_msff_ctl_macro__en_1__width_12 ff_rd_collapse_fifo_ent6  (
	.scan_in(ff_rd_collapse_fifo_ent6_scanin),
	.scan_out(ff_rd_collapse_fifo_ent6_scanout),
	.din(drq_rd_queue_ent6_in[11:0]),
	.dout(drq_rd_queue_ent6[11:0]),
	.en(drq_rd_queue_ent6_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drq_ctl_msff_ctl_macro__en_1__width_12 ff_rd_collapse_fifo_ent7  (
	.scan_in(ff_rd_collapse_fifo_ent7_scanin),
	.scan_out(ff_rd_collapse_fifo_ent7_scanout),
	.din(drq_rd_queue_ent7_in[11:0]),
	.dout(drq_rd_queue_ent7[11:0]),
	.en(drq_rd_queue_ent7_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// read request rank information for scheduler - this allows scheduler to 
//	keep scheduling to the same rank if possible so as not to lose a 
//	cycle when switching ranks
assign drq_rd_entry0_rank = drq_rd_queue_ent0[6];
assign drq_rd_entry1_rank = drq_rd_queue_ent1[6];
assign drq_rd_entry2_rank = drq_rd_queue_ent2[6];
assign drq_rd_entry3_rank = drq_rd_queue_ent3[6];
assign drq_rd_entry4_rank = drq_rd_queue_ent4[6];
assign drq_rd_entry5_rank = drq_rd_queue_ent5[6];
assign drq_rd_entry6_rank = drq_rd_queue_ent6[6];
assign drq_rd_entry7_rank = drq_rd_queue_ent7[6];

assign drq_rd_entry0_dimm[2:0] = drq_rd_queue_ent0[5:3];
assign drq_rd_entry1_dimm[2:0] = drq_rd_queue_ent1[5:3];
assign drq_rd_entry2_dimm[2:0] = drq_rd_queue_ent2[5:3];
assign drq_rd_entry3_dimm[2:0] = drq_rd_queue_ent3[5:3];
assign drq_rd_entry4_dimm[2:0] = drq_rd_queue_ent4[5:3];
assign drq_rd_entry5_dimm[2:0] = drq_rd_queue_ent5[5:3];
assign drq_rd_entry6_dimm[2:0] = drq_rd_queue_ent6[5:3];
assign drq_rd_entry7_dimm[2:0] = drq_rd_queue_ent7[5:3];

//////////////////////////////////////////////////////////////////
// Collapsing queue for writes
//	This queue allows requests to be pulled from any location.
//	The newest request is always added at the tail
//////////////////////////////////////////////////////////////////
assign drq_wrq_full = &drq_wrbuf_valids[7:0];
assign drq_wrq_empty = ~(|drq_wrbuf_valids[7:0]);

// write request queue entry contents
// 14:12 - index into wdq for write data
// 11:9 - index into address queue
// 8 - parity
// 7 - addr error
// 6 - rank
// 5:3 - dimm
// 2:0 - bank for scheduling
assign drq_wr_entry[14:0] = {drq_cpu_wr_addr[2:0],  drq_wr_addr_in[2:0], drq_wr_addr0[8:3], drq_wrq_bank_bit2, drq_wr_addr0[1:0]};

// when in 4-bank mode, use rank information for bank bit 2 when scheduling requests
assign drq_wrq_bank_bit2 = drif_eight_bank_mode ? drq_wr_addr0[2] : 
			   drif_stacked_dimm ? drq_wr_addr0[6] : drq_wr_addr0[3];

// reset request queue entry's valid bit once it gets scheduled
assign drq_write_queue_clear[7:0] = woq_wr_queue_clear[7:0];

// keep track of entry count 
assign drq_wr_entry_en = drq_wr_req & ~drq_wr_addr0[7] & ~drq_wrq_full; 
assign drq_write_queue_cnt_in[3:0] = drq_wr_entry_en & ~(|drq_write_queue_clear[7:0]) ? drq_write_queue_cnt[3:0] + 4'h1 : 
					(|drq_write_queue_clear[7:0]) & ~drq_wr_entry_en ? drq_write_queue_cnt[3:0] - 4'h1 : 
					drq_write_queue_cnt[3:0];

mcu_drq_ctl_msff_ctl_macro__width_4 ff_wr_collapse_fifo_cnt  (
	.scan_in(ff_wr_collapse_fifo_cnt_scanin),
	.scan_out(ff_wr_collapse_fifo_cnt_scanout),
	.din(drq_write_queue_cnt_in[3:0]),
	.dout(drq_write_queue_cnt[3:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// set the valids in the request queue based on the entry count
assign drq_wr_queue_valid[7:0] = {7'h0,   drq_write_queue_cnt[3:0] == 4'h1}   |
				    {6'h0,{2{drq_write_queue_cnt[3:0] == 4'h2}}} |
				    {5'h0,{3{drq_write_queue_cnt[3:0] == 4'h3}}} |
				    {4'h0,{4{drq_write_queue_cnt[3:0] == 4'h4}}} |
				    {3'h0,{5{drq_write_queue_cnt[3:0] == 4'h5}}} |
				    {2'h0,{6{drq_write_queue_cnt[3:0] == 4'h6}}} |
				    {1'h0,{7{drq_write_queue_cnt[3:0] == 4'h7}}} |
					  {8{drq_write_queue_cnt[3:0] == 4'h8}};

// 0in fifo -enq drq_wr_entry_en -deq (|drq_write_queue_clear[7:0]) -depth 8
assign drq_wr_queue_ent0_en = (drq_write_queue_cnt[3:0] == 4'h0) & drq_wr_entry_en | drq_write_queue_clear[0];
assign drq_wr_queue_ent1_en = ~drq_wr_queue_valid[1] & drq_wr_entry_en | (|drq_write_queue_clear[1:0]);
assign drq_wr_queue_ent2_en = ~drq_wr_queue_valid[2] & drq_wr_entry_en | (|drq_write_queue_clear[2:0]);
assign drq_wr_queue_ent3_en = ~drq_wr_queue_valid[3] & drq_wr_entry_en | (|drq_write_queue_clear[3:0]);
assign drq_wr_queue_ent4_en = ~drq_wr_queue_valid[4] & drq_wr_entry_en | (|drq_write_queue_clear[4:0]);
assign drq_wr_queue_ent5_en = ~drq_wr_queue_valid[5] & drq_wr_entry_en | (|drq_write_queue_clear[5:0]);
assign drq_wr_queue_ent6_en = ~drq_wr_queue_valid[6] & drq_wr_entry_en | (|drq_write_queue_clear[6:0]);
assign drq_wr_queue_ent7_en = ~drq_wr_queue_valid[7] & drq_wr_entry_en | (|drq_write_queue_clear[7:0]);

assign drq_wr_queue_ent0_in[14:0] = drq_wr_queue_valid[1] ? drq_wr_queue_ent1[14:0] : drq_wr_entry[14:0];
assign drq_wr_queue_ent1_in[14:0] = drq_wr_queue_valid[2] ? drq_wr_queue_ent2[14:0] : drq_wr_entry[14:0];
assign drq_wr_queue_ent2_in[14:0] = drq_wr_queue_valid[3] ? drq_wr_queue_ent3[14:0] : drq_wr_entry[14:0];
assign drq_wr_queue_ent3_in[14:0] = drq_wr_queue_valid[4] ? drq_wr_queue_ent4[14:0] : drq_wr_entry[14:0];
assign drq_wr_queue_ent4_in[14:0] = drq_wr_queue_valid[5] ? drq_wr_queue_ent5[14:0] : drq_wr_entry[14:0];
assign drq_wr_queue_ent5_in[14:0] = drq_wr_queue_valid[6] ? drq_wr_queue_ent6[14:0] : drq_wr_entry[14:0];
assign drq_wr_queue_ent6_in[14:0] = drq_wr_queue_valid[7] ? drq_wr_queue_ent7[14:0] : drq_wr_entry[14:0];
assign drq_wr_queue_ent7_in[14:0] = drq_wr_entry[14:0];

mcu_drq_ctl_msff_ctl_macro__en_1__width_15 ff_wr_collapse_fifo_ent0  (
	.scan_in(ff_wr_collapse_fifo_ent0_scanin),
	.scan_out(ff_wr_collapse_fifo_ent0_scanout),
	.din(drq_wr_queue_ent0_in[14:0]),
	.dout(drq_wr_queue_ent0[14:0]),
	.en(drq_wr_queue_ent0_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drq_ctl_msff_ctl_macro__en_1__width_15 ff_wr_collapse_fifo_ent1  (
	.scan_in(ff_wr_collapse_fifo_ent1_scanin),
	.scan_out(ff_wr_collapse_fifo_ent1_scanout),
	.din(drq_wr_queue_ent1_in[14:0]),
	.dout(drq_wr_queue_ent1[14:0]),
	.en(drq_wr_queue_ent1_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drq_ctl_msff_ctl_macro__en_1__width_15 ff_wr_collapse_fifo_ent2  (
	.scan_in(ff_wr_collapse_fifo_ent2_scanin),
	.scan_out(ff_wr_collapse_fifo_ent2_scanout),
	.din(drq_wr_queue_ent2_in[14:0]),
	.dout(drq_wr_queue_ent2[14:0]),
	.en(drq_wr_queue_ent2_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drq_ctl_msff_ctl_macro__en_1__width_15 ff_wr_collapse_fifo_ent3  (
	.scan_in(ff_wr_collapse_fifo_ent3_scanin),
	.scan_out(ff_wr_collapse_fifo_ent3_scanout),
	.din(drq_wr_queue_ent3_in[14:0]),
	.dout(drq_wr_queue_ent3[14:0]),
	.en(drq_wr_queue_ent3_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drq_ctl_msff_ctl_macro__en_1__width_15 ff_wr_collapse_fifo_ent4  (
	.scan_in(ff_wr_collapse_fifo_ent4_scanin),
	.scan_out(ff_wr_collapse_fifo_ent4_scanout),
	.din(drq_wr_queue_ent4_in[14:0]),
	.dout(drq_wr_queue_ent4[14:0]),
	.en(drq_wr_queue_ent4_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drq_ctl_msff_ctl_macro__en_1__width_15 ff_wr_collapse_fifo_ent5  (
	.scan_in(ff_wr_collapse_fifo_ent5_scanin),
	.scan_out(ff_wr_collapse_fifo_ent5_scanout),
	.din(drq_wr_queue_ent5_in[14:0]),
	.dout(drq_wr_queue_ent5[14:0]),
	.en(drq_wr_queue_ent5_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drq_ctl_msff_ctl_macro__en_1__width_15 ff_wr_collapse_fifo_ent6  (
	.scan_in(ff_wr_collapse_fifo_ent6_scanin),
	.scan_out(ff_wr_collapse_fifo_ent6_scanout),
	.din(drq_wr_queue_ent6_in[14:0]),
	.dout(drq_wr_queue_ent6[14:0]),
	.en(drq_wr_queue_ent6_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drq_ctl_msff_ctl_macro__en_1__width_15 ff_wr_collapse_fifo_ent7  (
	.scan_in(ff_wr_collapse_fifo_ent7_scanin),
	.scan_out(ff_wr_collapse_fifo_ent7_scanout),
	.din(drq_wr_queue_ent7_in[14:0]),
	.dout(drq_wr_queue_ent7[14:0]),
	.en(drq_wr_queue_ent7_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// valids for wdq
assign drq_wdq_out_cntr_in[3:0] = drq_wdq_out_cntr[3:0] + 4'h1;
assign drq_wdq_out_cntr_en = |drq_write_queue_clear[7:0];

mcu_drq_ctl_msff_ctl_macro__en_1__width_4 ff_wdq_out_cntr  (
	.scan_in(ff_wdq_out_cntr_scanin),
	.scan_out(ff_wdq_out_cntr_scanout),
	.din(drq_wdq_out_cntr_in[3:0]),
	.dout(drq_wdq_out_cntr[3:0]),
	.en(drq_wdq_out_cntr_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drq_wdq_cnt[3:0] = drq_wdq_in_cntr[3:0] >= drq_wdq_out_cntr[3:0] ? drq_wdq_in_cntr[3:0] - drq_wdq_out_cntr[3:0] :
									  ~(drq_wdq_out_cntr[3:0] - drq_wdq_in_cntr[3:0]) + 4'h1;

assign drq_wdq_valid[7:0] =  drq_wr_queue_valid[7:0] & 
			       ({7'h0,   drq_wdq_cnt[3:0] == 4'h1}   |
				{6'h0,{2{drq_wdq_cnt[3:0] == 4'h2}}} |
				{5'h0,{3{drq_wdq_cnt[3:0] == 4'h3}}} |
				{4'h0,{4{drq_wdq_cnt[3:0] == 4'h4}}} |
				{3'h0,{5{drq_wdq_cnt[3:0] == 4'h5}}} |
				{2'h0,{6{drq_wdq_cnt[3:0] == 4'h6}}} |
				{1'h0,{7{drq_wdq_cnt[3:0] == 4'h7}}} |
				      {8{drq_wdq_cnt[3:0] == 4'h8}});

// write request rank information for scheduler - this allows scheduler to keep 
//	scheduling to the same rank if possible so as not to lose a cycle when 
//	switching ranks
assign drq_wr_entry0_rank = drq_wr_queue_ent0[6];
assign drq_wr_entry1_rank = drq_wr_queue_ent1[6];
assign drq_wr_entry2_rank = drq_wr_queue_ent2[6];
assign drq_wr_entry3_rank = drq_wr_queue_ent3[6];
assign drq_wr_entry4_rank = drq_wr_queue_ent4[6];
assign drq_wr_entry5_rank = drq_wr_queue_ent5[6];
assign drq_wr_entry6_rank = drq_wr_queue_ent6[6];
assign drq_wr_entry7_rank = drq_wr_queue_ent7[6];

assign drq_wr_entry0_dimm[2:0] = drq_wr_queue_ent0[5:3];
assign drq_wr_entry1_dimm[2:0] = drq_wr_queue_ent1[5:3];
assign drq_wr_entry2_dimm[2:0] = drq_wr_queue_ent2[5:3];
assign drq_wr_entry3_dimm[2:0] = drq_wr_queue_ent3[5:3];
assign drq_wr_entry4_dimm[2:0] = drq_wr_queue_ent4[5:3];
assign drq_wr_entry5_dimm[2:0] = drq_wr_queue_ent5[5:3];
assign drq_wr_entry6_dimm[2:0] = drq_wr_queue_ent6[5:3];
assign drq_wr_entry7_dimm[2:0] = drq_wr_queue_ent7[5:3];

//////////////////////////////////////////////////////////////////
// Generate bank valids for the read scheduler
//////////////////////////////////////////////////////////////////
assign drq_rdq_ent0_bnk[3:0] = {drif_eight_bank_mode ? (drif_stacked_dimm ? drq_rd_queue_ent0[6] :
							drq_rd_queue_ent0[3]) :
						    (drif_stacked_dimm ? drq_rd_queue_ent0[3] :
							drq_rd_queue_ent0[4]), drq_rd_queue_ent0[2:0]};
assign drq_rdq_ent1_bnk[3:0] = {drif_eight_bank_mode ? (drif_stacked_dimm ? drq_rd_queue_ent1[6] :
							drq_rd_queue_ent1[3]) :
						    (drif_stacked_dimm ? drq_rd_queue_ent1[3] :
							drq_rd_queue_ent1[4]), drq_rd_queue_ent1[2:0]};
assign drq_rdq_ent2_bnk[3:0] = {drif_eight_bank_mode ? (drif_stacked_dimm ? drq_rd_queue_ent2[6] :
							drq_rd_queue_ent2[3]) :
						    (drif_stacked_dimm ? drq_rd_queue_ent2[3] :
							drq_rd_queue_ent2[4]), drq_rd_queue_ent2[2:0]};
assign drq_rdq_ent3_bnk[3:0] = {drif_eight_bank_mode ? (drif_stacked_dimm ? drq_rd_queue_ent3[6] :
							drq_rd_queue_ent3[3]) :
						    (drif_stacked_dimm ? drq_rd_queue_ent3[3] :
							drq_rd_queue_ent3[4]), drq_rd_queue_ent3[2:0]};
assign drq_rdq_ent4_bnk[3:0] = {drif_eight_bank_mode ? (drif_stacked_dimm ? drq_rd_queue_ent4[6] :
							drq_rd_queue_ent4[3]) :
						    (drif_stacked_dimm ? drq_rd_queue_ent4[3] :
							drq_rd_queue_ent4[4]), drq_rd_queue_ent4[2:0]};
assign drq_rdq_ent5_bnk[3:0] = {drif_eight_bank_mode ? (drif_stacked_dimm ? drq_rd_queue_ent5[6] :
							drq_rd_queue_ent5[3]) :
						    (drif_stacked_dimm ? drq_rd_queue_ent5[3] :
							drq_rd_queue_ent5[4]), drq_rd_queue_ent5[2:0]};
assign drq_rdq_ent6_bnk[3:0] = {drif_eight_bank_mode ? (drif_stacked_dimm ? drq_rd_queue_ent6[6] :
							drq_rd_queue_ent6[3]) :
						    (drif_stacked_dimm ? drq_rd_queue_ent6[3] :
							drq_rd_queue_ent6[4]), drq_rd_queue_ent6[2:0]};
assign drq_rdq_ent7_bnk[3:0] = {drif_eight_bank_mode ? (drif_stacked_dimm ? drq_rd_queue_ent7[6] :
							drq_rd_queue_ent7[3]) :
						    (drif_stacked_dimm ? drq_rd_queue_ent7[3] :
							drq_rd_queue_ent7[4]), drq_rd_queue_ent7[2:0]};

assign drq_rd_banksel_addr0_dec[15:0] = {(drq_rdq_ent0_bnk[3:0] == 4'hf), (drq_rdq_ent0_bnk[3:0] == 4'he),
                                        (drq_rdq_ent0_bnk[3:0] == 4'hd), (drq_rdq_ent0_bnk[3:0] == 4'hc),
					(drq_rdq_ent0_bnk[3:0] == 4'hb), (drq_rdq_ent0_bnk[3:0] == 4'ha),
                                        (drq_rdq_ent0_bnk[3:0] == 4'h9), (drq_rdq_ent0_bnk[3:0] == 4'h8),
					(drq_rdq_ent0_bnk[3:0] == 4'h7), (drq_rdq_ent0_bnk[3:0] == 4'h6),
                                        (drq_rdq_ent0_bnk[3:0] == 4'h5), (drq_rdq_ent0_bnk[3:0] == 4'h4),
					(drq_rdq_ent0_bnk[3:0] == 4'h3), (drq_rdq_ent0_bnk[3:0] == 4'h2),
                                        (drq_rdq_ent0_bnk[3:0] == 4'h1), (drq_rdq_ent0_bnk[3:0] == 4'h0)};

assign drq_rd_banksel_addr1_dec[15:0] = {(drq_rdq_ent1_bnk[3:0] == 4'hf), (drq_rdq_ent1_bnk[3:0] == 4'he),
                                        (drq_rdq_ent1_bnk[3:0] == 4'hd), (drq_rdq_ent1_bnk[3:0] == 4'hc),
                                        (drq_rdq_ent1_bnk[3:0] == 4'hb), (drq_rdq_ent1_bnk[3:0] == 4'ha),
                                        (drq_rdq_ent1_bnk[3:0] == 4'h9), (drq_rdq_ent1_bnk[3:0] == 4'h8),
					(drq_rdq_ent1_bnk[3:0] == 4'h7), (drq_rdq_ent1_bnk[3:0] == 4'h6),
                                        (drq_rdq_ent1_bnk[3:0] == 4'h5), (drq_rdq_ent1_bnk[3:0] == 4'h4),
                                        (drq_rdq_ent1_bnk[3:0] == 4'h3), (drq_rdq_ent1_bnk[3:0] == 4'h2),
                                        (drq_rdq_ent1_bnk[3:0] == 4'h1), (drq_rdq_ent1_bnk[3:0] == 4'h0)};

assign drq_rd_banksel_addr2_dec[15:0] = {(drq_rdq_ent2_bnk[3:0] == 4'hf), (drq_rdq_ent2_bnk[3:0] == 4'he),
                                        (drq_rdq_ent2_bnk[3:0] == 4'hd), (drq_rdq_ent2_bnk[3:0] == 4'hc),
                                        (drq_rdq_ent2_bnk[3:0] == 4'hb), (drq_rdq_ent2_bnk[3:0] == 4'ha),
                                        (drq_rdq_ent2_bnk[3:0] == 4'h9), (drq_rdq_ent2_bnk[3:0] == 4'h8),
                                        (drq_rdq_ent2_bnk[3:0] == 4'h7), (drq_rdq_ent2_bnk[3:0] == 4'h6),
                                        (drq_rdq_ent2_bnk[3:0] == 4'h5), (drq_rdq_ent2_bnk[3:0] == 4'h4),
                                        (drq_rdq_ent2_bnk[3:0] == 4'h3), (drq_rdq_ent2_bnk[3:0] == 4'h2),
                                        (drq_rdq_ent2_bnk[3:0] == 4'h1), (drq_rdq_ent2_bnk[3:0] == 4'h0)};

assign drq_rd_banksel_addr3_dec[15:0] = {(drq_rdq_ent3_bnk[3:0] == 4'hf), (drq_rdq_ent3_bnk[3:0] == 4'he),
                                        (drq_rdq_ent3_bnk[3:0] == 4'hd), (drq_rdq_ent3_bnk[3:0] == 4'hc),
                                        (drq_rdq_ent3_bnk[3:0] == 4'hb), (drq_rdq_ent3_bnk[3:0] == 4'ha),
                                        (drq_rdq_ent3_bnk[3:0] == 4'h9), (drq_rdq_ent3_bnk[3:0] == 4'h8),
                                        (drq_rdq_ent3_bnk[3:0] == 4'h7), (drq_rdq_ent3_bnk[3:0] == 4'h6),
                                        (drq_rdq_ent3_bnk[3:0] == 4'h5), (drq_rdq_ent3_bnk[3:0] == 4'h4),
                                        (drq_rdq_ent3_bnk[3:0] == 4'h3), (drq_rdq_ent3_bnk[3:0] == 4'h2),
                                        (drq_rdq_ent3_bnk[3:0] == 4'h1), (drq_rdq_ent3_bnk[3:0] == 4'h0)};

assign drq_rd_banksel_addr4_dec[15:0] = {(drq_rdq_ent4_bnk[3:0] == 4'hf), (drq_rdq_ent4_bnk[3:0] == 4'he),
                                        (drq_rdq_ent4_bnk[3:0] == 4'hd), (drq_rdq_ent4_bnk[3:0] == 4'hc),
                                        (drq_rdq_ent4_bnk[3:0] == 4'hb), (drq_rdq_ent4_bnk[3:0] == 4'ha),
                                        (drq_rdq_ent4_bnk[3:0] == 4'h9), (drq_rdq_ent4_bnk[3:0] == 4'h8),
                                        (drq_rdq_ent4_bnk[3:0] == 4'h7), (drq_rdq_ent4_bnk[3:0] == 4'h6),
                                        (drq_rdq_ent4_bnk[3:0] == 4'h5), (drq_rdq_ent4_bnk[3:0] == 4'h4),
                                        (drq_rdq_ent4_bnk[3:0] == 4'h3), (drq_rdq_ent4_bnk[3:0] == 4'h2),
                                        (drq_rdq_ent4_bnk[3:0] == 4'h1), (drq_rdq_ent4_bnk[3:0] == 4'h0)};

assign drq_rd_banksel_addr5_dec[15:0] = {(drq_rdq_ent5_bnk[3:0] == 4'hf), (drq_rdq_ent5_bnk[3:0] == 4'he),
                                        (drq_rdq_ent5_bnk[3:0] == 4'hd), (drq_rdq_ent5_bnk[3:0] == 4'hc),
                                        (drq_rdq_ent5_bnk[3:0] == 4'hb), (drq_rdq_ent5_bnk[3:0] == 4'ha),
                                        (drq_rdq_ent5_bnk[3:0] == 4'h9), (drq_rdq_ent5_bnk[3:0] == 4'h8),
                                        (drq_rdq_ent5_bnk[3:0] == 4'h7), (drq_rdq_ent5_bnk[3:0] == 4'h6),
                                        (drq_rdq_ent5_bnk[3:0] == 4'h5), (drq_rdq_ent5_bnk[3:0] == 4'h4),
                                        (drq_rdq_ent5_bnk[3:0] == 4'h3), (drq_rdq_ent5_bnk[3:0] == 4'h2),
                                        (drq_rdq_ent5_bnk[3:0] == 4'h1), (drq_rdq_ent5_bnk[3:0] == 4'h0)};

assign drq_rd_banksel_addr6_dec[15:0] = {(drq_rdq_ent6_bnk[3:0] == 4'hf), (drq_rdq_ent6_bnk[3:0] == 4'he),
                                        (drq_rdq_ent6_bnk[3:0] == 4'hd), (drq_rdq_ent6_bnk[3:0] == 4'hc),
                                        (drq_rdq_ent6_bnk[3:0] == 4'hb), (drq_rdq_ent6_bnk[3:0] == 4'ha),
                                        (drq_rdq_ent6_bnk[3:0] == 4'h9), (drq_rdq_ent6_bnk[3:0] == 4'h8),
                                        (drq_rdq_ent6_bnk[3:0] == 4'h7), (drq_rdq_ent6_bnk[3:0] == 4'h6),
                                        (drq_rdq_ent6_bnk[3:0] == 4'h5), (drq_rdq_ent6_bnk[3:0] == 4'h4),
                                        (drq_rdq_ent6_bnk[3:0] == 4'h3), (drq_rdq_ent6_bnk[3:0] == 4'h2),
                                        (drq_rdq_ent6_bnk[3:0] == 4'h1), (drq_rdq_ent6_bnk[3:0] == 4'h0)};

assign drq_rd_banksel_addr7_dec[15:0] = {(drq_rdq_ent7_bnk[3:0] == 4'hf), (drq_rdq_ent7_bnk[3:0] == 4'he),
                                       	(drq_rdq_ent7_bnk[3:0] == 4'hd), (drq_rdq_ent7_bnk[3:0] == 4'hc),
                                        (drq_rdq_ent7_bnk[3:0] == 4'hb), (drq_rdq_ent7_bnk[3:0] == 4'ha),
                                        (drq_rdq_ent7_bnk[3:0] == 4'h9), (drq_rdq_ent7_bnk[3:0] == 4'h8),
					(drq_rdq_ent7_bnk[3:0] == 4'h7), (drq_rdq_ent7_bnk[3:0] == 4'h6),
                                       	(drq_rdq_ent7_bnk[3:0] == 4'h5), (drq_rdq_ent7_bnk[3:0] == 4'h4),
                                        (drq_rdq_ent7_bnk[3:0] == 4'h3), (drq_rdq_ent7_bnk[3:0] == 4'h2),
                                        (drq_rdq_ent7_bnk[3:0] == 4'h1), (drq_rdq_ent7_bnk[3:0] == 4'h0)};

// Qualify the read's decoded bank address with queue entry valid signal
assign drq_rd_entry7_val[15:0] = {16{drq_rd_queue_valid[7] & drq_rdq_ent7_rank_avail}} & drq_rd_banksel_addr7_dec[15:0] &
				{16{(((drif_refresh_rank[3:0] != drq_rd_queue_ent7[6:3]) & 
				(drif_mcu_state_2 | drif_mcu_state_4) & ~drif_init) | drif_mcu_state_1)}}; 
assign drq_rd_entry6_val[15:0] = {16{drq_rd_queue_valid[6] & drq_rdq_ent6_rank_avail}} & drq_rd_banksel_addr6_dec[15:0] &
				{16{(((drif_refresh_rank[3:0] != drq_rd_queue_ent6[6:3]) & 
				(drif_mcu_state_2 | drif_mcu_state_4) & ~drif_init) | drif_mcu_state_1)}}; 
assign drq_rd_entry5_val[15:0] = {16{drq_rd_queue_valid[5] & drq_rdq_ent5_rank_avail}} & drq_rd_banksel_addr5_dec[15:0] &
				{16{(((drif_refresh_rank[3:0] != drq_rd_queue_ent5[6:3]) & 
				(drif_mcu_state_2 | drif_mcu_state_4) & ~drif_init) | drif_mcu_state_1)}}; 
assign drq_rd_entry4_val[15:0] = {16{drq_rd_queue_valid[4] & drq_rdq_ent4_rank_avail}} & drq_rd_banksel_addr4_dec[15:0] &
				{16{(((drif_refresh_rank[3:0] != drq_rd_queue_ent4[6:3]) & 
				(drif_mcu_state_2 | drif_mcu_state_4) & ~drif_init) | drif_mcu_state_1)}}; 
assign drq_rd_entry3_val[15:0] = {16{drq_rd_queue_valid[3] & drq_rdq_ent3_rank_avail}} & drq_rd_banksel_addr3_dec[15:0] &
				{16{(((drif_refresh_rank[3:0] != drq_rd_queue_ent3[6:3]) & 
				(drif_mcu_state_2 | drif_mcu_state_4) & ~drif_init) | drif_mcu_state_1)}}; 
assign drq_rd_entry2_val[15:0] = {16{drq_rd_queue_valid[2] & drq_rdq_ent2_rank_avail}} & drq_rd_banksel_addr2_dec[15:0] &
				{16{(((drif_refresh_rank[3:0] != drq_rd_queue_ent2[6:3]) & 
				(drif_mcu_state_2 | drif_mcu_state_4) & ~drif_init) | drif_mcu_state_1)}}; 
assign drq_rd_entry1_val[15:0] = {16{drq_rd_queue_valid[1] & drq_rdq_ent1_rank_avail}} & drq_rd_banksel_addr1_dec[15:0] &
				{16{(((drif_refresh_rank[3:0] != drq_rd_queue_ent1[6:3]) & 
				(drif_mcu_state_2 | drif_mcu_state_4) & ~drif_init) | drif_mcu_state_1)}}; 
assign drq_rd_entry0_val[15:0] = {16{drq_rd_queue_valid[0] & drq_rdq_ent0_rank_avail}} & drq_rd_banksel_addr0_dec[15:0] &
				{16{(((drif_refresh_rank[3:0] != drq_rd_queue_ent0[6:3]) & 
				(drif_mcu_state_2 | drif_mcu_state_4) & ~drif_init) | drif_mcu_state_1)}}; 

// OR bank valids together so scheduler can know which banks have requests
assign drq_rd_bank_val[15:0] = (drq_rd_banksel_addr0_dec[15:0] & {16{drq_rd_queue_valid[0]}} | 
			drq_rd_banksel_addr1_dec[15:0] & {16{drq_rd_queue_valid[1]}} | 
			drq_rd_banksel_addr2_dec[15:0] & {16{drq_rd_queue_valid[2]}} | 
			drq_rd_banksel_addr3_dec[15:0] & {16{drq_rd_queue_valid[3]}} | 
			drq_rd_banksel_addr4_dec[15:0] & {16{drq_rd_queue_valid[4]}} | 
			drq_rd_banksel_addr5_dec[15:0] & {16{drq_rd_queue_valid[5]}} | 
			drq_rd_banksel_addr6_dec[15:0] & {16{drq_rd_queue_valid[6]}} | 
			drq_rd_banksel_addr7_dec[15:0] & {16{drq_rd_queue_valid[7]}}) & {16{drif_init_mcu_done}};

//////////////////////////////////////////////////////////////////
// Select info from request queues based on which entry was picked
//////////////////////////////////////////////////////////////////

// index into read address queue
assign drq_rd_index_picked[2:0] = {3{drif_rd_entry_picked[7]}} & drq_rd_queue_ent7[11:9] |
                                  {3{drif_rd_entry_picked[6]}} & drq_rd_queue_ent6[11:9] |
                                  {3{drif_rd_entry_picked[5]}} & drq_rd_queue_ent5[11:9] |
				  {3{drif_rd_entry_picked[4]}} & drq_rd_queue_ent4[11:9] |
				  {3{drif_rd_entry_picked[3]}} & drq_rd_queue_ent3[11:9] |
				  {3{drif_rd_entry_picked[2]}} & drq_rd_queue_ent2[11:9] |
                                  {3{drif_rd_entry_picked[1]}} & drq_rd_queue_ent1[11:9] |
                                  {3{drif_rd_entry_picked[0]}} & drq_rd_queue_ent0[11:9];

// error, parity, rank, dimm, and bank information
assign {drq_rd_addr_picked[9:4],drq_rd_addr_picked[2:0]} = 
				 {9{drif_rd_entry_picked[7]}} & drq_rd_queue_ent7[8:0] |
                                 {9{drif_rd_entry_picked[6]}} & drq_rd_queue_ent6[8:0] |
                                 {9{drif_rd_entry_picked[5]}} & drq_rd_queue_ent5[8:0] | 
				 {9{drif_rd_entry_picked[4]}} & drq_rd_queue_ent4[8:0] |
				 {9{drif_rd_entry_picked[3]}} & drq_rd_queue_ent3[8:0] |
				 {9{drif_rd_entry_picked[2]}} & drq_rd_queue_ent2[8:0] |
                                 {9{drif_rd_entry_picked[1]}} & drq_rd_queue_ent1[8:0] | 
                                 {9{drif_rd_entry_picked[0]}} & drq_rd_queue_ent0[8:0];

assign drq_rd_addr_picked[3] = drif_eight_bank_mode ? (drif_stacked_dimm ? drq_rd_addr_picked[7] :
							drq_rd_addr_picked[4]) :
						    (drif_stacked_dimm ? drq_rd_addr_picked[4] :
							drq_rd_addr_picked[5]);

// index into write address queue
assign drq_wr_index_picked[2:0] = {3{drif_wr_entry_picked[7]}} & drq_wr_queue_ent7[11:9] |
                                  {3{drif_wr_entry_picked[6]}} & drq_wr_queue_ent6[11:9] |
                                  {3{drif_wr_entry_picked[5]}} & drq_wr_queue_ent5[11:9] |
                                  {3{drif_wr_entry_picked[4]}} & drq_wr_queue_ent4[11:9] |
                                  {3{drif_wr_entry_picked[3]}} & drq_wr_queue_ent3[11:9] |
                                  {3{drif_wr_entry_picked[2]}} & drq_wr_queue_ent2[11:9] |
                                  {3{drif_wr_entry_picked[1]}} & drq_wr_queue_ent1[11:9] | 
                                  {3{drif_wr_entry_picked[0]}} & drq_wr_queue_ent0[11:9];

// rank, bank, and parity information
assign drq_wr_addr_picked[6:0] = {7{drif_wr_entry_picked[7]}} & {drq_wr_queue_ent7[12],drq_wr_queue_ent7[8:6],drq_wr_queue_ent7[2:0]} |
                                 {7{drif_wr_entry_picked[6]}} & {drq_wr_queue_ent6[12],drq_wr_queue_ent6[8:6],drq_wr_queue_ent6[2:0]} |
                                 {7{drif_wr_entry_picked[5]}} & {drq_wr_queue_ent5[12],drq_wr_queue_ent5[8:6],drq_wr_queue_ent5[2:0]} |
                                 {7{drif_wr_entry_picked[4]}} & {drq_wr_queue_ent4[12],drq_wr_queue_ent4[8:6],drq_wr_queue_ent4[2:0]} |
                                 {7{drif_wr_entry_picked[3]}} & {drq_wr_queue_ent3[12],drq_wr_queue_ent3[8:6],drq_wr_queue_ent3[2:0]} |
                                 {7{drif_wr_entry_picked[2]}} & {drq_wr_queue_ent2[12],drq_wr_queue_ent2[8:6],drq_wr_queue_ent2[2:0]} |
                                 {7{drif_wr_entry_picked[1]}} & {drq_wr_queue_ent1[12],drq_wr_queue_ent1[8:6],drq_wr_queue_ent1[2:0]} | 
                                 {7{drif_wr_entry_picked[0]}} & {drq_wr_queue_ent0[12],drq_wr_queue_ent0[8:6],drq_wr_queue_ent0[2:0]}; 

// write data queue (wdq) index
assign drq_wr_id_picked[2:0] =  {3{drif_wr_entry_picked[7]}} & drq_wr_queue_ent7[11:9] |
                                {3{drif_wr_entry_picked[6]}} & drq_wr_queue_ent6[11:9] |
                                {3{drif_wr_entry_picked[5]}} & drq_wr_queue_ent5[11:9] |
                                {3{drif_wr_entry_picked[4]}} & drq_wr_queue_ent4[11:9] |
                                {3{drif_wr_entry_picked[3]}} & drq_wr_queue_ent3[11:9] |
                                {3{drif_wr_entry_picked[2]}} & drq_wr_queue_ent2[11:9] |
                                {3{drif_wr_entry_picked[1]}} & drq_wr_queue_ent1[11:9] | 
                                {3{drif_wr_entry_picked[0]}} & drq_wr_queue_ent0[11:9];

//////////////////////////////////////////////////////////////////
// Decode index for address queue entry selection
//////////////////////////////////////////////////////////////////

// decoded read index for accessing read address queue
assign drq_rdq_ent0_index_dec[7:0] = { (drq_rd_queue_ent0[11:9] == 3'h7), (drq_rd_queue_ent0[11:9] == 3'h6),
                                        (drq_rd_queue_ent0[11:9] == 3'h5), (drq_rd_queue_ent0[11:9] == 3'h4),
					(drq_rd_queue_ent0[11:9] == 3'h3), (drq_rd_queue_ent0[11:9] == 3'h2),
                                        (drq_rd_queue_ent0[11:9] == 3'h1), (drq_rd_queue_ent0[11:9] == 3'h0) };

assign drq_rdq_ent1_index_dec[7:0] = { (drq_rd_queue_ent1[11:9] == 3'h7), (drq_rd_queue_ent1[11:9] == 3'h6),
                                       	(drq_rd_queue_ent1[11:9] == 3'h5), (drq_rd_queue_ent1[11:9] == 3'h4),
                                        (drq_rd_queue_ent1[11:9] == 3'h3), (drq_rd_queue_ent1[11:9] == 3'h2),
                                        (drq_rd_queue_ent1[11:9] == 3'h1), (drq_rd_queue_ent1[11:9] == 3'h0) };

assign drq_rdq_ent2_index_dec[7:0] = { (drq_rd_queue_ent2[11:9] == 3'h7), (drq_rd_queue_ent2[11:9] == 3'h6),
                                        (drq_rd_queue_ent2[11:9] == 3'h5), (drq_rd_queue_ent2[11:9] == 3'h4),
                                        (drq_rd_queue_ent2[11:9] == 3'h3), (drq_rd_queue_ent2[11:9] == 3'h2),
                                        (drq_rd_queue_ent2[11:9] == 3'h1), (drq_rd_queue_ent2[11:9] == 3'h0) };

assign drq_rdq_ent3_index_dec[7:0] = { (drq_rd_queue_ent3[11:9] == 3'h7), (drq_rd_queue_ent3[11:9] == 3'h6),
                                       	(drq_rd_queue_ent3[11:9] == 3'h5), (drq_rd_queue_ent3[11:9] == 3'h4),
                                        (drq_rd_queue_ent3[11:9] == 3'h3), (drq_rd_queue_ent3[11:9] == 3'h2),
                                        (drq_rd_queue_ent3[11:9] == 3'h1), (drq_rd_queue_ent3[11:9] == 3'h0) };

assign drq_rdq_ent4_index_dec[7:0] = { (drq_rd_queue_ent4[11:9] == 3'h7), (drq_rd_queue_ent4[11:9] == 3'h6),
                                        (drq_rd_queue_ent4[11:9] == 3'h5), (drq_rd_queue_ent4[11:9] == 3'h4),
                                        (drq_rd_queue_ent4[11:9] == 3'h3), (drq_rd_queue_ent4[11:9] == 3'h2),
                                        (drq_rd_queue_ent4[11:9] == 3'h1), (drq_rd_queue_ent4[11:9] == 3'h0) };

assign drq_rdq_ent5_index_dec[7:0] = { (drq_rd_queue_ent5[11:9] == 3'h7), (drq_rd_queue_ent5[11:9] == 3'h6),
                                        (drq_rd_queue_ent5[11:9] == 3'h5), (drq_rd_queue_ent5[11:9] == 3'h4),
                                        (drq_rd_queue_ent5[11:9] == 3'h3), (drq_rd_queue_ent5[11:9] == 3'h2),
                                        (drq_rd_queue_ent5[11:9] == 3'h1), (drq_rd_queue_ent5[11:9] == 3'h0) };

assign drq_rdq_ent6_index_dec[7:0] = { (drq_rd_queue_ent6[11:9] == 3'h7), (drq_rd_queue_ent6[11:9] == 3'h6),
                                        (drq_rd_queue_ent6[11:9] == 3'h5), (drq_rd_queue_ent6[11:9] == 3'h4),
                                        (drq_rd_queue_ent6[11:9] == 3'h3), (drq_rd_queue_ent6[11:9] == 3'h2),
                                       	(drq_rd_queue_ent6[11:9] == 3'h1), (drq_rd_queue_ent6[11:9] == 3'h0) };

assign drq_rdq_ent7_index_dec[7:0] = { (drq_rd_queue_ent7[11:9] == 3'h7), (drq_rd_queue_ent7[11:9] == 3'h6),
                                       	(drq_rd_queue_ent7[11:9] == 3'h5), (drq_rd_queue_ent7[11:9] == 3'h4),
                                        (drq_rd_queue_ent7[11:9] == 3'h3), (drq_rd_queue_ent7[11:9] == 3'h2),
                                        (drq_rd_queue_ent7[11:9] == 3'h1), (drq_rd_queue_ent7[11:9] == 3'h0) };

// Rank/DIMM decodes for power down mode
assign drq_rdq_ent0_rank_dec[15:0] = {drq_rd_queue_ent0[6:3] == 4'hf, drq_rd_queue_ent0[6:3] == 4'he,
					drq_rd_queue_ent0[6:3] == 4'hd, drq_rd_queue_ent0[6:3] == 4'hc,
					drq_rd_queue_ent0[6:3] == 4'hb, drq_rd_queue_ent0[6:3] == 4'ha,
					drq_rd_queue_ent0[6:3] == 4'h9, drq_rd_queue_ent0[6:3] == 4'h8,
					drq_rd_queue_ent0[6:3] == 4'h7, drq_rd_queue_ent0[6:3] == 4'h6,
					drq_rd_queue_ent0[6:3] == 4'h5, drq_rd_queue_ent0[6:3] == 4'h4,
					drq_rd_queue_ent0[6:3] == 4'h3, drq_rd_queue_ent0[6:3] == 4'h2,
					drq_rd_queue_ent0[6:3] == 4'h1, drq_rd_queue_ent0[6:3] == 4'h0};
assign drq_rdq_ent1_rank_dec[15:0] = {drq_rd_queue_ent1[6:3] == 4'hf, drq_rd_queue_ent1[6:3] == 4'he,
					drq_rd_queue_ent1[6:3] == 4'hd, drq_rd_queue_ent1[6:3] == 4'hc,
					drq_rd_queue_ent1[6:3] == 4'hb, drq_rd_queue_ent1[6:3] == 4'ha,
					drq_rd_queue_ent1[6:3] == 4'h9, drq_rd_queue_ent1[6:3] == 4'h8,
					drq_rd_queue_ent1[6:3] == 4'h7, drq_rd_queue_ent1[6:3] == 4'h6,
					drq_rd_queue_ent1[6:3] == 4'h5, drq_rd_queue_ent1[6:3] == 4'h4,
					drq_rd_queue_ent1[6:3] == 4'h3, drq_rd_queue_ent1[6:3] == 4'h2,
					drq_rd_queue_ent1[6:3] == 4'h1, drq_rd_queue_ent1[6:3] == 4'h0};
assign drq_rdq_ent2_rank_dec[15:0] = {drq_rd_queue_ent2[6:3] == 4'hf, drq_rd_queue_ent2[6:3] == 4'he,
					drq_rd_queue_ent2[6:3] == 4'hd, drq_rd_queue_ent2[6:3] == 4'hc,
					drq_rd_queue_ent2[6:3] == 4'hb, drq_rd_queue_ent2[6:3] == 4'ha,
					drq_rd_queue_ent2[6:3] == 4'h9, drq_rd_queue_ent2[6:3] == 4'h8,
					drq_rd_queue_ent2[6:3] == 4'h7, drq_rd_queue_ent2[6:3] == 4'h6,
					drq_rd_queue_ent2[6:3] == 4'h5, drq_rd_queue_ent2[6:3] == 4'h4,
					drq_rd_queue_ent2[6:3] == 4'h3, drq_rd_queue_ent2[6:3] == 4'h2,
					drq_rd_queue_ent2[6:3] == 4'h1, drq_rd_queue_ent2[6:3] == 4'h0};
assign drq_rdq_ent3_rank_dec[15:0] = {drq_rd_queue_ent3[6:3] == 4'hf, drq_rd_queue_ent3[6:3] == 4'he,
					drq_rd_queue_ent3[6:3] == 4'hd, drq_rd_queue_ent3[6:3] == 4'hc,
					drq_rd_queue_ent3[6:3] == 4'hb, drq_rd_queue_ent3[6:3] == 4'ha,
					drq_rd_queue_ent3[6:3] == 4'h9, drq_rd_queue_ent3[6:3] == 4'h8,
					drq_rd_queue_ent3[6:3] == 4'h7, drq_rd_queue_ent3[6:3] == 4'h6,
					drq_rd_queue_ent3[6:3] == 4'h5, drq_rd_queue_ent3[6:3] == 4'h4,
					drq_rd_queue_ent3[6:3] == 4'h3, drq_rd_queue_ent3[6:3] == 4'h2,
					drq_rd_queue_ent3[6:3] == 4'h1, drq_rd_queue_ent3[6:3] == 4'h0};
assign drq_rdq_ent4_rank_dec[15:0] = {drq_rd_queue_ent4[6:3] == 4'hf, drq_rd_queue_ent4[6:3] == 4'he,
					drq_rd_queue_ent4[6:3] == 4'hd, drq_rd_queue_ent4[6:3] == 4'hc,
					drq_rd_queue_ent4[6:3] == 4'hb, drq_rd_queue_ent4[6:3] == 4'ha,
					drq_rd_queue_ent4[6:3] == 4'h9, drq_rd_queue_ent4[6:3] == 4'h8,
					drq_rd_queue_ent4[6:3] == 4'h7, drq_rd_queue_ent4[6:3] == 4'h6,
					drq_rd_queue_ent4[6:3] == 4'h5, drq_rd_queue_ent4[6:3] == 4'h4,
					drq_rd_queue_ent4[6:3] == 4'h3, drq_rd_queue_ent4[6:3] == 4'h2,
					drq_rd_queue_ent4[6:3] == 4'h1, drq_rd_queue_ent4[6:3] == 4'h0};
assign drq_rdq_ent5_rank_dec[15:0] = {drq_rd_queue_ent5[6:3] == 4'hf, drq_rd_queue_ent5[6:3] == 4'he,
					drq_rd_queue_ent5[6:3] == 4'hd, drq_rd_queue_ent5[6:3] == 4'hc,
					drq_rd_queue_ent5[6:3] == 4'hb, drq_rd_queue_ent5[6:3] == 4'ha,
					drq_rd_queue_ent5[6:3] == 4'h9, drq_rd_queue_ent5[6:3] == 4'h8,
					drq_rd_queue_ent5[6:3] == 4'h7, drq_rd_queue_ent5[6:3] == 4'h6,
					drq_rd_queue_ent5[6:3] == 4'h5, drq_rd_queue_ent5[6:3] == 4'h4,
					drq_rd_queue_ent5[6:3] == 4'h3, drq_rd_queue_ent5[6:3] == 4'h2,
					drq_rd_queue_ent5[6:3] == 4'h1, drq_rd_queue_ent5[6:3] == 4'h0};
assign drq_rdq_ent6_rank_dec[15:0] = {drq_rd_queue_ent6[6:3] == 4'hf, drq_rd_queue_ent6[6:3] == 4'he,
					drq_rd_queue_ent6[6:3] == 4'hd, drq_rd_queue_ent6[6:3] == 4'hc,
					drq_rd_queue_ent6[6:3] == 4'hb, drq_rd_queue_ent6[6:3] == 4'ha,
					drq_rd_queue_ent6[6:3] == 4'h9, drq_rd_queue_ent6[6:3] == 4'h8,
					drq_rd_queue_ent6[6:3] == 4'h7, drq_rd_queue_ent6[6:3] == 4'h6,
					drq_rd_queue_ent6[6:3] == 4'h5, drq_rd_queue_ent6[6:3] == 4'h4,
					drq_rd_queue_ent6[6:3] == 4'h3, drq_rd_queue_ent6[6:3] == 4'h2,
					drq_rd_queue_ent6[6:3] == 4'h1, drq_rd_queue_ent6[6:3] == 4'h0};
assign drq_rdq_ent7_rank_dec[15:0] = {drq_rd_queue_ent7[6:3] == 4'hf, drq_rd_queue_ent7[6:3] == 4'he,
					drq_rd_queue_ent7[6:3] == 4'hd, drq_rd_queue_ent7[6:3] == 4'hc,
					drq_rd_queue_ent7[6:3] == 4'hb, drq_rd_queue_ent7[6:3] == 4'ha,
					drq_rd_queue_ent7[6:3] == 4'h9, drq_rd_queue_ent7[6:3] == 4'h8,
					drq_rd_queue_ent7[6:3] == 4'h7, drq_rd_queue_ent7[6:3] == 4'h6,
					drq_rd_queue_ent7[6:3] == 4'h5, drq_rd_queue_ent7[6:3] == 4'h4,
					drq_rd_queue_ent7[6:3] == 4'h3, drq_rd_queue_ent7[6:3] == 4'h2,
					drq_rd_queue_ent7[6:3] == 4'h1, drq_rd_queue_ent7[6:3] == 4'h0};

assign drq_rank_avail[15:0] = pdmc_rank_avail[15:0] & {drif_dimm_rd_available[7:0],drif_dimm_rd_available[7:0]};

assign drq_rdq_ent0_rank_avail = |(drq_rdq_ent0_rank_dec[15:0] & drq_rank_avail[15:0]);
assign drq_rdq_ent1_rank_avail = |(drq_rdq_ent1_rank_dec[15:0] & drq_rank_avail[15:0]);
assign drq_rdq_ent2_rank_avail = |(drq_rdq_ent2_rank_dec[15:0] & drq_rank_avail[15:0]);
assign drq_rdq_ent3_rank_avail = |(drq_rdq_ent3_rank_dec[15:0] & drq_rank_avail[15:0]);
assign drq_rdq_ent4_rank_avail = |(drq_rdq_ent4_rank_dec[15:0] & drq_rank_avail[15:0]);
assign drq_rdq_ent5_rank_avail = |(drq_rdq_ent5_rank_dec[15:0] & drq_rank_avail[15:0]);
assign drq_rdq_ent6_rank_avail = |(drq_rdq_ent6_rank_dec[15:0] & drq_rank_avail[15:0]);
assign drq_rdq_ent7_rank_avail = |(drq_rdq_ent7_rank_dec[15:0] & drq_rank_avail[15:0]);

// Power Down mode counter increments
assign drq_pd_mode_rd_incr[15:0] = {16{drq_rd_req}} &
				   {drq_rd_addr0[6:3] == 4'hf, drq_rd_addr0[6:3] == 4'he,
				    drq_rd_addr0[6:3] == 4'hd, drq_rd_addr0[6:3] == 4'hc,
				    drq_rd_addr0[6:3] == 4'hb, drq_rd_addr0[6:3] == 4'ha,
				    drq_rd_addr0[6:3] == 4'h9, drq_rd_addr0[6:3] == 4'h8,
				    drq_rd_addr0[6:3] == 4'h7, drq_rd_addr0[6:3] == 4'h6,
				    drq_rd_addr0[6:3] == 4'h5, drq_rd_addr0[6:3] == 4'h4,
				    drq_rd_addr0[6:3] == 4'h3, drq_rd_addr0[6:3] == 4'h2,
				    drq_rd_addr0[6:3] == 4'h1, drq_rd_addr0[6:3] == 4'h0};

assign drq_pd_mode_wr_incr[15:0] = {16{drq_wr_req}} & 
				   {drq_wr_addr0[6:3] == 4'hf, drq_wr_addr0[6:3] == 4'he,
				    drq_wr_addr0[6:3] == 4'hd, drq_wr_addr0[6:3] == 4'hc,
				    drq_wr_addr0[6:3] == 4'hb, drq_wr_addr0[6:3] == 4'ha,
				    drq_wr_addr0[6:3] == 4'h9, drq_wr_addr0[6:3] == 4'h8,
				    drq_wr_addr0[6:3] == 4'h7, drq_wr_addr0[6:3] == 4'h6,
				    drq_wr_addr0[6:3] == 4'h5, drq_wr_addr0[6:3] == 4'h4,
				    drq_wr_addr0[6:3] == 4'h3, drq_wr_addr0[6:3] == 4'h2,
				    drq_wr_addr0[6:3] == 4'h1, drq_wr_addr0[6:3] == 4'h0};

assign drq_pd_mode_rd_decr_in[15:0] = {16{(|drif_rd_entry_picked[7:0]) & ~drif_raw_hazard}} & 
				   {drq_rd_addr_picked[7:4] == 4'hf, drq_rd_addr_picked[7:4] == 4'he,
				    drq_rd_addr_picked[7:4] == 4'hd, drq_rd_addr_picked[7:4] == 4'hc,
				    drq_rd_addr_picked[7:4] == 4'hb, drq_rd_addr_picked[7:4] == 4'ha,
				    drq_rd_addr_picked[7:4] == 4'h9, drq_rd_addr_picked[7:4] == 4'h8,
				    drq_rd_addr_picked[7:4] == 4'h7, drq_rd_addr_picked[7:4] == 4'h6,
				    drq_rd_addr_picked[7:4] == 4'h5, drq_rd_addr_picked[7:4] == 4'h4,
				    drq_rd_addr_picked[7:4] == 4'h3, drq_rd_addr_picked[7:4] == 4'h2,
				    drq_rd_addr_picked[7:4] == 4'h1, drq_rd_addr_picked[7:4] == 4'h0};

mcu_drq_ctl_msff_ctl_macro__width_16 ff_pd_mode_rd_decr  (
	.scan_in(ff_pd_mode_rd_decr_scanin),
	.scan_out(ff_pd_mode_rd_decr_scanout),
	.din(drq_pd_mode_rd_decr_in[15:0]),
	.dout(drq_pd_mode_rd_decr[15:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// CLEANUP

// fixscan start:
assign ff_rd_wr_val_scanin       = scan_in                  ;
assign ff_rd_addr_scanin         = ff_rd_wr_val_scanout     ;
assign ff_wr_addr_scanin         = ff_rd_addr_scanout       ;
assign ff_rdq_free_scanin        = ff_wr_addr_scanout       ;
assign ff_rdbuf_valids_scanin    = ff_rdq_free_scanout      ;
assign ff_wrbuf_valids_scanin    = ff_rdbuf_valids_scanout  ;
assign ff_wrbuf_issued_scanin    = ff_wrbuf_valids_scanout  ;
assign ff_read_queue_clear_scanin = ff_wrbuf_issued_scanout  ;
assign ff_rd_collapse_fifo_cnt_scanin = ff_read_queue_clear_scanout;
assign ff_rd_collapse_fifo_ent0_scanin = ff_rd_collapse_fifo_cnt_scanout;
assign ff_rd_collapse_fifo_ent1_scanin = ff_rd_collapse_fifo_ent0_scanout;
assign ff_rd_collapse_fifo_ent2_scanin = ff_rd_collapse_fifo_ent1_scanout;
assign ff_rd_collapse_fifo_ent3_scanin = ff_rd_collapse_fifo_ent2_scanout;
assign ff_rd_collapse_fifo_ent4_scanin = ff_rd_collapse_fifo_ent3_scanout;
assign ff_rd_collapse_fifo_ent5_scanin = ff_rd_collapse_fifo_ent4_scanout;
assign ff_rd_collapse_fifo_ent6_scanin = ff_rd_collapse_fifo_ent5_scanout;
assign ff_rd_collapse_fifo_ent7_scanin = ff_rd_collapse_fifo_ent6_scanout;
assign ff_wr_collapse_fifo_cnt_scanin = ff_rd_collapse_fifo_ent7_scanout;
assign ff_wr_collapse_fifo_ent0_scanin = ff_wr_collapse_fifo_cnt_scanout;
assign ff_wr_collapse_fifo_ent1_scanin = ff_wr_collapse_fifo_ent0_scanout;
assign ff_wr_collapse_fifo_ent2_scanin = ff_wr_collapse_fifo_ent1_scanout;
assign ff_wr_collapse_fifo_ent3_scanin = ff_wr_collapse_fifo_ent2_scanout;
assign ff_wr_collapse_fifo_ent4_scanin = ff_wr_collapse_fifo_ent3_scanout;
assign ff_wr_collapse_fifo_ent5_scanin = ff_wr_collapse_fifo_ent4_scanout;
assign ff_wr_collapse_fifo_ent6_scanin = ff_wr_collapse_fifo_ent5_scanout;
assign ff_wr_collapse_fifo_ent7_scanin = ff_wr_collapse_fifo_ent6_scanout;
assign ff_wdq_out_cntr_scanin    = ff_wr_collapse_fifo_ent7_scanout;
assign ff_pd_mode_rd_decr_scanin = ff_wdq_out_cntr_scanout  ;
assign scan_out                  = ff_pd_mode_rd_decr_scanout;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module mcu_drq_ctl_msff_ctl_macro__width_6 (
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

module mcu_drq_ctl_msff_ctl_macro__width_9 (
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

module mcu_drq_ctl_msff_ctl_macro__width_1 (
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

module mcu_drq_ctl_msff_ctl_macro__width_8 (
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

module mcu_drq_ctl_msff_ctl_macro__width_4 (
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

module mcu_drq_ctl_msff_ctl_macro__en_1__width_12 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [11:0] fdin;
wire [10:0] so;

  input [11:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [11:0] dout;
  output scan_out;
assign fdin[11:0] = (din[11:0] & {12{en}}) | (dout[11:0] & ~{12{en}});






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













// any PARAMS parms go into naming of macro

module mcu_drq_ctl_msff_ctl_macro__en_1__width_15 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [14:0] fdin;
wire [13:0] so;

  input [14:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [14:0] dout;
  output scan_out;
assign fdin[14:0] = (din[14:0] & {15{en}}) | (dout[14:0] & ~{15{en}});






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

module mcu_drq_ctl_msff_ctl_macro__en_1__width_4 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = (din[3:0] & {4{en}}) | (dout[3:0] & ~{4{en}});






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

module mcu_drq_ctl_msff_ctl_macro__width_16 (
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








