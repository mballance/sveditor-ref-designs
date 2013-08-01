// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_reqq_ctl.v
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
module mcu_reqq_ctl (
  woq_entry0, 
  woq_entry1, 
  woq_entry_valid, 
  woq_entry0_val, 
  woq_entry1_val, 
  woq_wr_bank_val, 
  woq_wdq_radr, 
  woq_io_wdata_sel, 
  woq1_wr_picked, 
  woq_wr_addr_picked, 
  woq_wr1_addr_picked, 
  woq_wr2_addr_picked, 
  woq_wr_index_picked, 
  woq_wr1_index_picked, 
  woq_wr2_index_picked, 
  woq_wr_wdq_index_picked, 
  woq_wr1_wdq_index_picked, 
  woq_wr2_wdq_index_picked, 
  woq_wr_adr_queue_sel, 
  woq_wr1_adr_queue_sel, 
  woq_wr2_adr_queue_sel, 
  woq_wadr_parity, 
  woq_wdata_wsn, 
  woq_err_st_wait_free, 
  woq_err_fifo_empty, 
  woq_wr_req_out, 
  woq_pd_mode_wr_decr, 
  woq_owr_empty, 
  woq_empty, 
  woq_wr_error_mode, 
  woq_wdata_send, 
  drq0_rd_adr_queue7_en, 
  drq0_rd_adr_queue6_en, 
  drq0_rd_adr_queue5_en, 
  drq0_rd_adr_queue4_en, 
  drq0_rd_adr_queue3_en, 
  drq0_rd_adr_queue2_en, 
  drq0_rd_adr_queue1_en, 
  drq0_rd_adr_queue0_en, 
  drq0_rd_adr_queue_sel, 
  drq0_wr_adr_queue7_en, 
  drq0_wr_adr_queue6_en, 
  drq0_wr_adr_queue5_en, 
  drq0_wr_adr_queue4_en, 
  drq0_wr_adr_queue3_en, 
  drq0_wr_adr_queue2_en, 
  drq0_wr_adr_queue1_en, 
  drq0_wr_adr_queue0_en, 
  drq0_req_rdwr_addr_sel, 
  drq0_rdbuf_valids, 
  drq0_wrbuf_valids, 
  drq0_pending_wr_req, 
  drq0_read_queue_cnt, 
  drq0_write_queue_cnt, 
  drq0_rd_entry0_val, 
  drq0_rd_entry1_val, 
  drq0_rd_entry2_val, 
  drq0_rd_entry3_val, 
  drq0_rd_entry4_val, 
  drq0_rd_entry5_val, 
  drq0_rd_entry6_val, 
  drq0_rd_entry7_val, 
  drq0_rd_bank_val, 
  drq0_rd_entry0_rank, 
  drq0_rd_entry1_rank, 
  drq0_rd_entry2_rank, 
  drq0_rd_entry3_rank, 
  drq0_rd_entry4_rank, 
  drq0_rd_entry5_rank, 
  drq0_rd_entry6_rank, 
  drq0_rd_entry7_rank, 
  drq0_wr_entry0_rank, 
  drq0_wr_entry1_rank, 
  drq0_wr_entry2_rank, 
  drq0_wr_entry3_rank, 
  drq0_wr_entry4_rank, 
  drq0_wr_entry5_rank, 
  drq0_wr_entry6_rank, 
  drq0_wr_entry7_rank, 
  drq0_rd_entry0_dimm, 
  drq0_rd_entry1_dimm, 
  drq0_rd_entry2_dimm, 
  drq0_rd_entry3_dimm, 
  drq0_rd_entry4_dimm, 
  drq0_rd_entry5_dimm, 
  drq0_rd_entry6_dimm, 
  drq0_rd_entry7_dimm, 
  drq0_wr_entry0_dimm, 
  drq0_wr_entry1_dimm, 
  drq0_wr_entry2_dimm, 
  drq0_wr_entry3_dimm, 
  drq0_wr_entry4_dimm, 
  drq0_wr_entry5_dimm, 
  drq0_wr_entry6_dimm, 
  drq0_wr_entry7_dimm, 
  drq0_rd_addr_picked, 
  drq0_rdq_free, 
  drq0_rdq_full, 
  drq0_empty, 
  drq0_rd_index_picked, 
  drq0_wr_index_picked, 
  drq0_wr_id_picked, 
  drq0_pd_mode_rd_incr, 
  drq0_pd_mode_rd_decr, 
  drq0_pd_mode_wr_incr, 
  woq0_wdq_rd, 
  woq0_wdq_entry_free, 
  drq0_rd_req, 
  drq0_wr_req, 
  drif0_raw_hazard, 
  l2if0_rd_req, 
  l2if0_wr_req, 
  drif0_cpu_wr_addr, 
  l2if0_wdq_in_cntr, 
  l2b0_rd_rank_adr, 
  l2b0_rd_dimm_adr, 
  l2b0_rd_bank_adr, 
  l2b0_rd_addr_err, 
  l2b0_rd_addr_par, 
  l2b0_wr_rank_adr, 
  l2b0_wr_dimm_adr, 
  l2b0_wr_bank_adr, 
  l2b0_wr_addr_err, 
  l2b0_wr_addr_par, 
  rdpctl_drq0_clear_ent, 
  drif_drq0_clear_ent, 
  drif0_rd_entry_picked, 
  drq1_rd_adr_queue7_en, 
  drq1_rd_adr_queue6_en, 
  drq1_rd_adr_queue5_en, 
  drq1_rd_adr_queue4_en, 
  drq1_rd_adr_queue3_en, 
  drq1_rd_adr_queue2_en, 
  drq1_rd_adr_queue1_en, 
  drq1_rd_adr_queue0_en, 
  drq1_rd_adr_queue_sel, 
  drq1_wr_adr_queue7_en, 
  drq1_wr_adr_queue6_en, 
  drq1_wr_adr_queue5_en, 
  drq1_wr_adr_queue4_en, 
  drq1_wr_adr_queue3_en, 
  drq1_wr_adr_queue2_en, 
  drq1_wr_adr_queue1_en, 
  drq1_wr_adr_queue0_en, 
  drq1_req_rdwr_addr_sel, 
  drq1_rdbuf_valids, 
  drq1_wrbuf_valids, 
  drq1_pending_wr_req, 
  drq1_read_queue_cnt, 
  drq1_write_queue_cnt, 
  drq1_rd_entry0_val, 
  drq1_rd_entry1_val, 
  drq1_rd_entry2_val, 
  drq1_rd_entry3_val, 
  drq1_rd_entry4_val, 
  drq1_rd_entry5_val, 
  drq1_rd_entry6_val, 
  drq1_rd_entry7_val, 
  drq1_rd_bank_val, 
  drq1_rd_entry0_rank, 
  drq1_rd_entry1_rank, 
  drq1_rd_entry2_rank, 
  drq1_rd_entry3_rank, 
  drq1_rd_entry4_rank, 
  drq1_rd_entry5_rank, 
  drq1_rd_entry6_rank, 
  drq1_rd_entry7_rank, 
  drq1_wr_entry0_rank, 
  drq1_wr_entry1_rank, 
  drq1_wr_entry2_rank, 
  drq1_wr_entry3_rank, 
  drq1_wr_entry4_rank, 
  drq1_wr_entry5_rank, 
  drq1_wr_entry6_rank, 
  drq1_wr_entry7_rank, 
  drq1_rd_entry0_dimm, 
  drq1_rd_entry1_dimm, 
  drq1_rd_entry2_dimm, 
  drq1_rd_entry3_dimm, 
  drq1_rd_entry4_dimm, 
  drq1_rd_entry5_dimm, 
  drq1_rd_entry6_dimm, 
  drq1_rd_entry7_dimm, 
  drq1_wr_entry0_dimm, 
  drq1_wr_entry1_dimm, 
  drq1_wr_entry2_dimm, 
  drq1_wr_entry3_dimm, 
  drq1_wr_entry4_dimm, 
  drq1_wr_entry5_dimm, 
  drq1_wr_entry6_dimm, 
  drq1_wr_entry7_dimm, 
  drq1_rd_addr_picked, 
  drq1_rdq_free, 
  woq1_wdq_entry_free, 
  drq1_rdq_full, 
  drq1_empty, 
  drq1_rd_index_picked, 
  drq1_wr_index_picked, 
  drq1_wr_id_picked, 
  drq1_pd_mode_rd_incr, 
  drq1_pd_mode_rd_decr, 
  drq1_pd_mode_wr_incr, 
  woq1_wdq_rd, 
  drq1_rd_req, 
  drq1_wr_req, 
  woq_err_pdm_wr_incr, 
  woq_err_pdm_wr_decr, 
  drif1_raw_hazard, 
  l2if1_rd_req, 
  l2if1_wr_req, 
  drif1_cpu_wr_addr, 
  l2if1_wdq_in_cntr, 
  l2b1_rd_rank_adr, 
  l2b1_rd_dimm_adr, 
  l2b1_rd_bank_adr, 
  l2b1_rd_addr_err, 
  l2b1_rd_addr_par, 
  l2b1_wr_rank_adr, 
  l2b1_wr_dimm_adr, 
  l2b1_wr_bank_adr, 
  l2b1_wr_addr_err, 
  l2b1_wr_addr_par, 
  rdpctl_drq1_clear_ent, 
  drif_drq1_clear_ent, 
  drif1_rd_entry_picked, 
  drif_wr_entry_picked, 
  drif_mcu_state_1, 
  drif_mcu_state_2, 
  drif_mcu_state_3, 
  drif_mcu_state_4, 
  drif_mcu_state_5, 
  drif_mcu_state_6, 
  drif_init, 
  drif_init_mcu_done, 
  drif_cmd_picked, 
  drif_blk_new_openbank, 
  drif_refresh_rank, 
  drif_rd_picked, 
  drif_wr_picked, 
  drif_eight_bank_mode, 
  drif_stacked_dimm, 
  drif_sync_frame_req_l, 
  drif_sync_frame_req_early3_l, 
  drif_single_channel_mode, 
  drif_pd_mode_pending, 
  drif_err_fifo_empty, 
  pdmc_rank_avail, 
  drif_dimm_rd_available, 
  drif_dimm_wr_available, 
  drif_wr_bc_stall, 
  drif_hw_selfrsh, 
  fbdic_l0_state, 
  fbdic_chnl_reset_error_mode, 
  drif_woq_free, 
  fbdic_clear_wrq_ent, 
  fbdic_scr_frame_req_d4, 
  fbdic_error_mode, 
  l1clk, 
  scan_in, 
  scan_out, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en);
wire drq0_scanin;
wire drq0_scanout;
wire [7:0] woq0_wrq_clear_ent;
wire [14:0] drq0_wr_queue_ent0;
wire [14:0] drq0_wr_queue_ent1;
wire [14:0] drq0_wr_queue_ent2;
wire [14:0] drq0_wr_queue_ent3;
wire [14:0] drq0_wr_queue_ent4;
wire [14:0] drq0_wr_queue_ent5;
wire [14:0] drq0_wr_queue_ent6;
wire [14:0] drq0_wr_queue_ent7;
wire [7:0] drq0_wdq_valid;
wire [7:0] woq0_wr_queue_clear;
wire [7:0] woq0_wr_entry_picked;
wire drq1_scanin;
wire drq1_scanout;
wire [7:0] woq1_wrq_clear_ent;
wire [14:0] drq1_wr_queue_ent0;
wire [14:0] drq1_wr_queue_ent1;
wire [14:0] drq1_wr_queue_ent2;
wire [14:0] drq1_wr_queue_ent3;
wire [14:0] drq1_wr_queue_ent4;
wire [14:0] drq1_wr_queue_ent5;
wire [14:0] drq1_wr_queue_ent6;
wire [14:0] drq1_wr_queue_ent7;
wire [7:0] drq1_wdq_valid;
wire [7:0] woq1_wr_queue_clear;
wire [7:0] woq1_wr_entry_picked;
wire woq_scanin;
wire woq_scanout;


output	[15:0]	woq_entry0;
output	[15:0]	woq_entry1;
output	[2:0]	woq_entry_valid;

output	[15:0]	woq_entry0_val;
output	[15:0]	woq_entry1_val;

output	[15:0]	woq_wr_bank_val;

output	[4:0]	woq_wdq_radr;
output	[1:0]	woq_io_wdata_sel;

output	[2:0]	woq1_wr_picked;

output	[9:0]	woq_wr_addr_picked;
output	[9:0]	woq_wr1_addr_picked;
output	[9:0]	woq_wr2_addr_picked;

output	[2:0]	woq_wr_index_picked;
output	[2:0]	woq_wr1_index_picked;
output	[2:0]	woq_wr2_index_picked;

output	[2:0]	woq_wr_wdq_index_picked;
output	[2:0]	woq_wr1_wdq_index_picked;
output	[2:0]	woq_wr2_wdq_index_picked;

output	[7:0]	woq_wr_adr_queue_sel;
output	[7:0]	woq_wr1_adr_queue_sel;
output	[7:0]	woq_wr2_adr_queue_sel;
output		woq_wadr_parity;

output		woq_wdata_wsn;
output		woq_err_st_wait_free;
output		woq_err_fifo_empty;
output	[1:0]	woq_wr_req_out;
output	[15:0]	woq_pd_mode_wr_decr;
output		woq_owr_empty;
output		woq_empty;
output		woq_wr_error_mode;
output		woq_wdata_send;

output		drq0_rd_adr_queue7_en;
output		drq0_rd_adr_queue6_en;
output		drq0_rd_adr_queue5_en;
output		drq0_rd_adr_queue4_en;
output		drq0_rd_adr_queue3_en;
output		drq0_rd_adr_queue2_en;
output		drq0_rd_adr_queue1_en;
output		drq0_rd_adr_queue0_en;
output	[7:0]	drq0_rd_adr_queue_sel;
output		drq0_wr_adr_queue7_en;
output		drq0_wr_adr_queue6_en;
output		drq0_wr_adr_queue5_en;
output		drq0_wr_adr_queue4_en;
output		drq0_wr_adr_queue3_en;
output		drq0_wr_adr_queue2_en;
output		drq0_wr_adr_queue1_en;
output		drq0_wr_adr_queue0_en;
output		drq0_req_rdwr_addr_sel;
output	[7:0]	drq0_rdbuf_valids;
output	[7:0]	drq0_wrbuf_valids;
output 	[7:0]	drq0_pending_wr_req;
output	[3:0]	drq0_read_queue_cnt;
output	[3:0]	drq0_write_queue_cnt;
output	[15:0]	drq0_rd_entry0_val;
output	[15:0]	drq0_rd_entry1_val;
output	[15:0]	drq0_rd_entry2_val;
output	[15:0]	drq0_rd_entry3_val;
output	[15:0]	drq0_rd_entry4_val;
output	[15:0]	drq0_rd_entry5_val;
output	[15:0]	drq0_rd_entry6_val;
output	[15:0]	drq0_rd_entry7_val;
output	[15:0]	drq0_rd_bank_val;
output		drq0_rd_entry0_rank;
output		drq0_rd_entry1_rank;
output		drq0_rd_entry2_rank;
output		drq0_rd_entry3_rank;
output		drq0_rd_entry4_rank;
output		drq0_rd_entry5_rank;
output		drq0_rd_entry6_rank;
output		drq0_rd_entry7_rank;
output		drq0_wr_entry0_rank;
output		drq0_wr_entry1_rank;
output		drq0_wr_entry2_rank;
output		drq0_wr_entry3_rank;
output		drq0_wr_entry4_rank;
output		drq0_wr_entry5_rank;
output		drq0_wr_entry6_rank;
output		drq0_wr_entry7_rank;
output	[2:0]	drq0_rd_entry0_dimm;
output	[2:0] 	drq0_rd_entry1_dimm;
output	[2:0] 	drq0_rd_entry2_dimm;
output	[2:0] 	drq0_rd_entry3_dimm;
output	[2:0] 	drq0_rd_entry4_dimm;
output	[2:0] 	drq0_rd_entry5_dimm;
output	[2:0] 	drq0_rd_entry6_dimm;
output	[2:0] 	drq0_rd_entry7_dimm;
output	[2:0] 	drq0_wr_entry0_dimm;
output	[2:0]	drq0_wr_entry1_dimm;
output	[2:0]	drq0_wr_entry2_dimm;
output	[2:0] 	drq0_wr_entry3_dimm;
output	[2:0] 	drq0_wr_entry4_dimm;
output	[2:0] 	drq0_wr_entry5_dimm;
output	[2:0] 	drq0_wr_entry6_dimm;
output	[2:0] 	drq0_wr_entry7_dimm;
output	[9:0]	drq0_rd_addr_picked;
output		drq0_rdq_free;
output		drq0_rdq_full;
output		drq0_empty;
output	[2:0]	drq0_rd_index_picked;
output	[2:0]	drq0_wr_index_picked;
output	[2:0]	drq0_wr_id_picked;
output	[15:0]	drq0_pd_mode_rd_incr;
output	[15:0]	drq0_pd_mode_rd_decr;
output	[15:0]	drq0_pd_mode_wr_incr;
output 		woq0_wdq_rd;
output	[7:0]	woq0_wdq_entry_free;
output		drq0_rd_req;
output		drq0_wr_req;
input		drif0_raw_hazard;
input		l2if0_rd_req;
input		l2if0_wr_req;
input	[2:0]	drif0_cpu_wr_addr;
input	[3:0]	l2if0_wdq_in_cntr;		// incremented by l2if when all data for a write is in wdq
input		l2b0_rd_rank_adr;
input	[2:0]	l2b0_rd_dimm_adr;
input	[2:0]	l2b0_rd_bank_adr;
input		l2b0_rd_addr_err;
input		l2b0_rd_addr_par;
input		l2b0_wr_rank_adr;
input	[2:0]	l2b0_wr_dimm_adr;
input	[2:0]	l2b0_wr_bank_adr;
input		l2b0_wr_addr_err;
input		l2b0_wr_addr_par;
input	[7:0]	rdpctl_drq0_clear_ent;
input	[7:0]	drif_drq0_clear_ent;
input	[7:0]	drif0_rd_entry_picked;

output		drq1_rd_adr_queue7_en;
output		drq1_rd_adr_queue6_en;
output		drq1_rd_adr_queue5_en;
output		drq1_rd_adr_queue4_en;
output		drq1_rd_adr_queue3_en;
output		drq1_rd_adr_queue2_en;
output		drq1_rd_adr_queue1_en;
output		drq1_rd_adr_queue0_en;
output	[7:0]	drq1_rd_adr_queue_sel;
output		drq1_wr_adr_queue7_en;
output		drq1_wr_adr_queue6_en;
output		drq1_wr_adr_queue5_en;
output		drq1_wr_adr_queue4_en;
output		drq1_wr_adr_queue3_en;
output		drq1_wr_adr_queue2_en;
output		drq1_wr_adr_queue1_en;
output		drq1_wr_adr_queue0_en;
output		drq1_req_rdwr_addr_sel;
output	[7:0]	drq1_rdbuf_valids;
output	[7:0]	drq1_wrbuf_valids;
output 	[7:0]	drq1_pending_wr_req;
output	[3:0]	drq1_read_queue_cnt;
output	[3:0]	drq1_write_queue_cnt;
output	[15:0]	drq1_rd_entry0_val;
output	[15:0]	drq1_rd_entry1_val;
output	[15:0]	drq1_rd_entry2_val;
output	[15:0]	drq1_rd_entry3_val;
output	[15:0]	drq1_rd_entry4_val;
output	[15:0]	drq1_rd_entry5_val;
output	[15:0]	drq1_rd_entry6_val;
output	[15:0]	drq1_rd_entry7_val;
output	[15:0]	drq1_rd_bank_val;
output		drq1_rd_entry0_rank;
output		drq1_rd_entry1_rank;
output		drq1_rd_entry2_rank;
output		drq1_rd_entry3_rank;
output		drq1_rd_entry4_rank;
output		drq1_rd_entry5_rank;
output		drq1_rd_entry6_rank;
output		drq1_rd_entry7_rank;
output		drq1_wr_entry0_rank;
output		drq1_wr_entry1_rank;
output		drq1_wr_entry2_rank;
output		drq1_wr_entry3_rank;
output		drq1_wr_entry4_rank;
output		drq1_wr_entry5_rank;
output		drq1_wr_entry6_rank;
output		drq1_wr_entry7_rank;
output	[2:0]	drq1_rd_entry0_dimm;
output	[2:0] 	drq1_rd_entry1_dimm;
output	[2:0] 	drq1_rd_entry2_dimm;
output	[2:0] 	drq1_rd_entry3_dimm;
output	[2:0] 	drq1_rd_entry4_dimm;
output	[2:0] 	drq1_rd_entry5_dimm;
output	[2:0] 	drq1_rd_entry6_dimm;
output	[2:0] 	drq1_rd_entry7_dimm;
output	[2:0] 	drq1_wr_entry0_dimm;
output	[2:0]	drq1_wr_entry1_dimm;
output	[2:0]	drq1_wr_entry2_dimm;
output	[2:0] 	drq1_wr_entry3_dimm;
output	[2:0] 	drq1_wr_entry4_dimm;
output	[2:0] 	drq1_wr_entry5_dimm;
output	[2:0] 	drq1_wr_entry6_dimm;
output	[2:0] 	drq1_wr_entry7_dimm;
output	[9:0]	drq1_rd_addr_picked;
output		drq1_rdq_free;
output	[7:0]	woq1_wdq_entry_free;
output		drq1_rdq_full;
output		drq1_empty;
output	[2:0]	drq1_rd_index_picked;
output	[2:0]	drq1_wr_index_picked;
output	[2:0]	drq1_wr_id_picked;
output	[15:0]	drq1_pd_mode_rd_incr;
output	[15:0]	drq1_pd_mode_rd_decr;
output	[15:0]	drq1_pd_mode_wr_incr;
output 		woq1_wdq_rd;
output		drq1_rd_req;
output		drq1_wr_req;

output	[15:0]	woq_err_pdm_wr_incr;
output	[15:0]	woq_err_pdm_wr_decr;

input		drif1_raw_hazard;
input		l2if1_rd_req;
input		l2if1_wr_req;
input	[2:0]	drif1_cpu_wr_addr;
input 	[3:0]	l2if1_wdq_in_cntr;		// incremented by l2if when all data for a write is in wdq
input		l2b1_rd_rank_adr;
input	[2:0]	l2b1_rd_dimm_adr;
input	[2:0]	l2b1_rd_bank_adr;
input		l2b1_rd_addr_err;
input		l2b1_rd_addr_par;
input		l2b1_wr_rank_adr;
input	[2:0]	l2b1_wr_dimm_adr;
input	[2:0]	l2b1_wr_bank_adr;
input		l2b1_wr_addr_err;
input		l2b1_wr_addr_par;
input	[7:0]	rdpctl_drq1_clear_ent;
input	[7:0]	drif_drq1_clear_ent;
input	[7:0]	drif1_rd_entry_picked;

input	[2:0]	drif_wr_entry_picked;
input		drif_mcu_state_1;
input		drif_mcu_state_2;
input		drif_mcu_state_3;
input		drif_mcu_state_4;
input		drif_mcu_state_5;
input		drif_mcu_state_6;
input		drif_init;
input		drif_init_mcu_done;
input		drif_cmd_picked;
input		drif_blk_new_openbank;
input	[3:0]	drif_refresh_rank;
input		drif_rd_picked;
input		drif_wr_picked;
input		drif_eight_bank_mode;
input		drif_stacked_dimm;
input		drif_sync_frame_req_l;
input		drif_sync_frame_req_early3_l;
input		drif_single_channel_mode;
input		drif_pd_mode_pending;
input		drif_err_fifo_empty;
input	[15:0]	pdmc_rank_avail;
input	[7:0]	drif_dimm_rd_available;
input	[7:0]	drif_dimm_wr_available;
input		drif_wr_bc_stall;
input		drif_hw_selfrsh;

input		fbdic_l0_state;
input		fbdic_chnl_reset_error_mode;
input	[1:0]	drif_woq_free;
input		fbdic_clear_wrq_ent;
input		fbdic_scr_frame_req_d4;
input		fbdic_error_mode;

input  		l1clk;
input		scan_in;
output		scan_out;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;

mcu_drq_ctl drq0 (
	.scan_in(drq0_scanin),
	.scan_out(drq0_scanout),
	.l1clk(l1clk),
	.l2if_rd_req(l2if0_rd_req),
	.l2if_wr_req(l2if0_wr_req),
	.drq_cpu_wr_addr(drif0_cpu_wr_addr[2:0]),
	.l2if_wdq_in_cntr(l2if0_wdq_in_cntr[3:0]),
	.l2b_rank_rd_adr(l2b0_rd_rank_adr),
	.l2b_dimm_rd_adr(l2b0_rd_dimm_adr[2:0]),
	.l2b_bank_rd_adr(l2b0_rd_bank_adr[2:0]),
	.l2b_addr_rd_err(l2b0_rd_addr_err),
	.l2b_addr_rd_par(l2b0_rd_addr_par),
	.l2b_rank_wr_adr(l2b0_wr_rank_adr),
	.l2b_dimm_wr_adr(l2b0_wr_dimm_adr[2:0]),
	.l2b_bank_wr_adr(l2b0_wr_bank_adr[2:0]),
	.l2b_addr_wr_err(l2b0_wr_addr_err),
	.l2b_addr_wr_par(l2b0_wr_addr_par),
	.rdpctl_drq_clear_ent(rdpctl_drq0_clear_ent[7:0]),
	.woq_wrq_clear_ent(woq0_wrq_clear_ent[7:0]),
	.drif_drq_clear_ent(drif_drq0_clear_ent[7:0]),
	.drq_rd_adr_queue7_en(drq0_rd_adr_queue7_en),
	.drq_rd_adr_queue6_en(drq0_rd_adr_queue6_en),
	.drq_rd_adr_queue5_en(drq0_rd_adr_queue5_en),
	.drq_rd_adr_queue4_en(drq0_rd_adr_queue4_en),
	.drq_rd_adr_queue3_en(drq0_rd_adr_queue3_en),
	.drq_rd_adr_queue2_en(drq0_rd_adr_queue2_en),
	.drq_rd_adr_queue1_en(drq0_rd_adr_queue1_en),
	.drq_rd_adr_queue0_en(drq0_rd_adr_queue0_en),
	.drq_rd_adr_queue_sel(drq0_rd_adr_queue_sel[7:0]),
	.drq_wr_adr_queue7_en(drq0_wr_adr_queue7_en),
	.drq_wr_adr_queue6_en(drq0_wr_adr_queue6_en),
	.drq_wr_adr_queue5_en(drq0_wr_adr_queue5_en),
	.drq_wr_adr_queue4_en(drq0_wr_adr_queue4_en),
	.drq_wr_adr_queue3_en(drq0_wr_adr_queue3_en),
	.drq_wr_adr_queue2_en(drq0_wr_adr_queue2_en),
	.drq_wr_adr_queue1_en(drq0_wr_adr_queue1_en),
	.drq_wr_adr_queue0_en(drq0_wr_adr_queue0_en),
	.drq_req_rdwr_addr_sel(drq0_req_rdwr_addr_sel),
	.drif_rd_entry_picked(drif0_rd_entry_picked[7:0]),
	.drif_wr_entry_picked(8'h0),
	.drq_rdbuf_valids(drq0_rdbuf_valids[7:0]),
	.drq_wrbuf_valids(drq0_wrbuf_valids[7:0]),
	.drq_pending_wr_req(drq0_pending_wr_req[7:0]),
	.drq_read_queue_cnt(drq0_read_queue_cnt[3:0]),
	.drq_write_queue_cnt(drq0_write_queue_cnt[3:0]),
	.drq_rd_entry0_val(drq0_rd_entry0_val[15:0]),
	.drq_rd_entry1_val(drq0_rd_entry1_val[15:0]),
	.drq_rd_entry2_val(drq0_rd_entry2_val[15:0]),
	.drq_rd_entry3_val(drq0_rd_entry3_val[15:0]),
	.drq_rd_entry4_val(drq0_rd_entry4_val[15:0]),
	.drq_rd_entry5_val(drq0_rd_entry5_val[15:0]),
	.drq_rd_entry6_val(drq0_rd_entry6_val[15:0]),
	.drq_rd_entry7_val(drq0_rd_entry7_val[15:0]),
	.drq_rd_bank_val(drq0_rd_bank_val[15:0]),
	.drq_rd_entry0_rank(drq0_rd_entry0_rank),
	.drq_rd_entry1_rank(drq0_rd_entry1_rank),
	.drq_rd_entry2_rank(drq0_rd_entry2_rank),
	.drq_rd_entry3_rank(drq0_rd_entry3_rank),
	.drq_rd_entry4_rank(drq0_rd_entry4_rank),
	.drq_rd_entry5_rank(drq0_rd_entry5_rank),
	.drq_rd_entry6_rank(drq0_rd_entry6_rank),
	.drq_rd_entry7_rank(drq0_rd_entry7_rank),
	.drq_wr_entry0_rank(drq0_wr_entry0_rank),
	.drq_wr_entry1_rank(drq0_wr_entry1_rank),
	.drq_wr_entry2_rank(drq0_wr_entry2_rank),
	.drq_wr_entry3_rank(drq0_wr_entry3_rank),
	.drq_wr_entry4_rank(drq0_wr_entry4_rank),
	.drq_wr_entry5_rank(drq0_wr_entry5_rank),
	.drq_wr_entry6_rank(drq0_wr_entry6_rank),
	.drq_wr_entry7_rank(drq0_wr_entry7_rank),
	.drq_rd_entry0_dimm(drq0_rd_entry0_dimm[2:0]),
	.drq_rd_entry1_dimm(drq0_rd_entry1_dimm[2:0]),
	.drq_rd_entry2_dimm(drq0_rd_entry2_dimm[2:0]),
	.drq_rd_entry3_dimm(drq0_rd_entry3_dimm[2:0]),
	.drq_rd_entry4_dimm(drq0_rd_entry4_dimm[2:0]),
	.drq_rd_entry5_dimm(drq0_rd_entry5_dimm[2:0]),
	.drq_rd_entry6_dimm(drq0_rd_entry6_dimm[2:0]),
	.drq_rd_entry7_dimm(drq0_rd_entry7_dimm[2:0]),
	.drq_wr_entry0_dimm(drq0_wr_entry0_dimm[2:0]),
	.drq_wr_entry1_dimm(drq0_wr_entry1_dimm[2:0]),
	.drq_wr_entry2_dimm(drq0_wr_entry2_dimm[2:0]),
	.drq_wr_entry3_dimm(drq0_wr_entry3_dimm[2:0]),
	.drq_wr_entry4_dimm(drq0_wr_entry4_dimm[2:0]),
	.drq_wr_entry5_dimm(drq0_wr_entry5_dimm[2:0]),
	.drq_wr_entry6_dimm(drq0_wr_entry6_dimm[2:0]),
	.drq_wr_entry7_dimm(drq0_wr_entry7_dimm[2:0]),
	.drq_wr_queue_ent0(drq0_wr_queue_ent0[14:0]),
	.drq_wr_queue_ent1(drq0_wr_queue_ent1[14:0]),
	.drq_wr_queue_ent2(drq0_wr_queue_ent2[14:0]),
	.drq_wr_queue_ent3(drq0_wr_queue_ent3[14:0]),
	.drq_wr_queue_ent4(drq0_wr_queue_ent4[14:0]),
	.drq_wr_queue_ent5(drq0_wr_queue_ent5[14:0]),
	.drq_wr_queue_ent6(drq0_wr_queue_ent6[14:0]),
	.drq_wr_queue_ent7(drq0_wr_queue_ent7[14:0]),
	.drq_wdq_valid(drq0_wdq_valid[7:0]),
	.woq_wr_queue_clear(woq0_wr_queue_clear[7:0]),
	.woq_wr_entry_picked(woq0_wr_entry_picked[7:0]),
	.drq_rd_addr_picked(drq0_rd_addr_picked[9:0]),
	.drq_rdq_free(drq0_rdq_free),
	.drq_rdq_full(drq0_rdq_full),
	.drq_empty(drq0_empty),
	.drq_rd_index_picked(drq0_rd_index_picked[2:0]),
	.drq_wr_index_picked(drq0_wr_index_picked[2:0]),
	.drq_wr_id_picked(drq0_wr_id_picked[2:0]),
	.drif_raw_hazard(drif0_raw_hazard),
	.drq_pd_mode_rd_incr(drq0_pd_mode_rd_incr[15:0]),
	.drq_pd_mode_rd_decr(drq0_pd_mode_rd_decr[15:0]),
	.drq_pd_mode_wr_incr(drq0_pd_mode_wr_incr[15:0]),
	.drq_rd_req(drq0_rd_req),
	.drq_wr_req(drq0_wr_req),
  .drif_init(drif_init),
  .drif_init_mcu_done(drif_init_mcu_done),
  .drif_mcu_state_1(drif_mcu_state_1),
  .drif_mcu_state_2(drif_mcu_state_2),
  .drif_mcu_state_4(drif_mcu_state_4),
  .drif_cmd_picked(drif_cmd_picked),
  .drif_blk_new_openbank(drif_blk_new_openbank),
  .pdmc_rank_avail(pdmc_rank_avail[15:0]),
  .drif_dimm_rd_available(drif_dimm_rd_available[7:0]),
  .drif_refresh_rank(drif_refresh_rank[3:0]),
  .drif_rd_picked(drif_rd_picked),
  .drif_wr_picked(drif_wr_picked),
  .drif_eight_bank_mode(drif_eight_bank_mode),
  .drif_stacked_dimm(drif_stacked_dimm),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_drq_ctl drq1 (
	.scan_in(drq1_scanin),
	.scan_out(drq1_scanout),
	.l1clk(l1clk),
	.l2if_rd_req(l2if1_rd_req),
	.l2if_wr_req(l2if1_wr_req),
	.drq_cpu_wr_addr(drif1_cpu_wr_addr[2:0]),
	.l2if_wdq_in_cntr(l2if1_wdq_in_cntr[3:0]),
	.l2b_rank_rd_adr(l2b1_rd_rank_adr),
	.l2b_dimm_rd_adr(l2b1_rd_dimm_adr[2:0]),
	.l2b_bank_rd_adr(l2b1_rd_bank_adr[2:0]),
	.l2b_addr_rd_err(l2b1_rd_addr_err),
	.l2b_addr_rd_par(l2b1_rd_addr_par),
	.l2b_rank_wr_adr(l2b1_wr_rank_adr),
	.l2b_dimm_wr_adr(l2b1_wr_dimm_adr[2:0]),
	.l2b_bank_wr_adr(l2b1_wr_bank_adr[2:0]),
	.l2b_addr_wr_err(l2b1_wr_addr_err),
	.l2b_addr_wr_par(l2b1_wr_addr_par),
	.rdpctl_drq_clear_ent(rdpctl_drq1_clear_ent[7:0]),
	.woq_wrq_clear_ent(woq1_wrq_clear_ent[7:0]),
	.drif_drq_clear_ent(drif_drq1_clear_ent[7:0]),
	.drq_rd_adr_queue7_en(drq1_rd_adr_queue7_en),
	.drq_rd_adr_queue6_en(drq1_rd_adr_queue6_en),
	.drq_rd_adr_queue5_en(drq1_rd_adr_queue5_en),
	.drq_rd_adr_queue4_en(drq1_rd_adr_queue4_en),
	.drq_rd_adr_queue3_en(drq1_rd_adr_queue3_en),
	.drq_rd_adr_queue2_en(drq1_rd_adr_queue2_en),
	.drq_rd_adr_queue1_en(drq1_rd_adr_queue1_en),
	.drq_rd_adr_queue0_en(drq1_rd_adr_queue0_en),
	.drq_rd_adr_queue_sel(drq1_rd_adr_queue_sel[7:0]),
	.drq_wr_adr_queue7_en(drq1_wr_adr_queue7_en),
	.drq_wr_adr_queue6_en(drq1_wr_adr_queue6_en),
	.drq_wr_adr_queue5_en(drq1_wr_adr_queue5_en),
	.drq_wr_adr_queue4_en(drq1_wr_adr_queue4_en),
	.drq_wr_adr_queue3_en(drq1_wr_adr_queue3_en),
	.drq_wr_adr_queue2_en(drq1_wr_adr_queue2_en),
	.drq_wr_adr_queue1_en(drq1_wr_adr_queue1_en),
	.drq_wr_adr_queue0_en(drq1_wr_adr_queue0_en),
	.drq_req_rdwr_addr_sel(drq1_req_rdwr_addr_sel),
	.drif_rd_entry_picked(drif1_rd_entry_picked[7:0]),
	.drif_wr_entry_picked(8'h0),
	.drq_rdbuf_valids(drq1_rdbuf_valids[7:0]),
	.drq_wrbuf_valids(drq1_wrbuf_valids[7:0]),
	.drq_pending_wr_req(drq1_pending_wr_req[7:0]),
	.drq_read_queue_cnt(drq1_read_queue_cnt[3:0]),
	.drq_write_queue_cnt(drq1_write_queue_cnt[3:0]),
	.drq_rd_entry0_val(drq1_rd_entry0_val[15:0]),
	.drq_rd_entry1_val(drq1_rd_entry1_val[15:0]),
	.drq_rd_entry2_val(drq1_rd_entry2_val[15:0]),
	.drq_rd_entry3_val(drq1_rd_entry3_val[15:0]),
	.drq_rd_entry4_val(drq1_rd_entry4_val[15:0]),
	.drq_rd_entry5_val(drq1_rd_entry5_val[15:0]),
	.drq_rd_entry6_val(drq1_rd_entry6_val[15:0]),
	.drq_rd_entry7_val(drq1_rd_entry7_val[15:0]),
	.drq_rd_bank_val(drq1_rd_bank_val[15:0]),
	.drq_rd_entry0_rank(drq1_rd_entry0_rank),
	.drq_rd_entry1_rank(drq1_rd_entry1_rank),
	.drq_rd_entry2_rank(drq1_rd_entry2_rank),
	.drq_rd_entry3_rank(drq1_rd_entry3_rank),
	.drq_rd_entry4_rank(drq1_rd_entry4_rank),
	.drq_rd_entry5_rank(drq1_rd_entry5_rank),
	.drq_rd_entry6_rank(drq1_rd_entry6_rank),
	.drq_rd_entry7_rank(drq1_rd_entry7_rank),
	.drq_wr_entry0_rank(drq1_wr_entry0_rank),
	.drq_wr_entry1_rank(drq1_wr_entry1_rank),
	.drq_wr_entry2_rank(drq1_wr_entry2_rank),
	.drq_wr_entry3_rank(drq1_wr_entry3_rank),
	.drq_wr_entry4_rank(drq1_wr_entry4_rank),
	.drq_wr_entry5_rank(drq1_wr_entry5_rank),
	.drq_wr_entry6_rank(drq1_wr_entry6_rank),
	.drq_wr_entry7_rank(drq1_wr_entry7_rank),
	.drq_rd_entry0_dimm(drq1_rd_entry0_dimm[2:0]),
	.drq_rd_entry1_dimm(drq1_rd_entry1_dimm[2:0]),
	.drq_rd_entry2_dimm(drq1_rd_entry2_dimm[2:0]),
	.drq_rd_entry3_dimm(drq1_rd_entry3_dimm[2:0]),
	.drq_rd_entry4_dimm(drq1_rd_entry4_dimm[2:0]),
	.drq_rd_entry5_dimm(drq1_rd_entry5_dimm[2:0]),
	.drq_rd_entry6_dimm(drq1_rd_entry6_dimm[2:0]),
	.drq_rd_entry7_dimm(drq1_rd_entry7_dimm[2:0]),
	.drq_wr_entry0_dimm(drq1_wr_entry0_dimm[2:0]),
	.drq_wr_entry1_dimm(drq1_wr_entry1_dimm[2:0]),
	.drq_wr_entry2_dimm(drq1_wr_entry2_dimm[2:0]),
	.drq_wr_entry3_dimm(drq1_wr_entry3_dimm[2:0]),
	.drq_wr_entry4_dimm(drq1_wr_entry4_dimm[2:0]),
	.drq_wr_entry5_dimm(drq1_wr_entry5_dimm[2:0]),
	.drq_wr_entry6_dimm(drq1_wr_entry6_dimm[2:0]),
	.drq_wr_entry7_dimm(drq1_wr_entry7_dimm[2:0]),
	.drq_wr_queue_ent0(drq1_wr_queue_ent0[14:0]),
	.drq_wr_queue_ent1(drq1_wr_queue_ent1[14:0]),
	.drq_wr_queue_ent2(drq1_wr_queue_ent2[14:0]),
	.drq_wr_queue_ent3(drq1_wr_queue_ent3[14:0]),
	.drq_wr_queue_ent4(drq1_wr_queue_ent4[14:0]),
	.drq_wr_queue_ent5(drq1_wr_queue_ent5[14:0]),
	.drq_wr_queue_ent6(drq1_wr_queue_ent6[14:0]),
	.drq_wr_queue_ent7(drq1_wr_queue_ent7[14:0]),
	.drq_wdq_valid(drq1_wdq_valid[7:0]),
	.woq_wr_queue_clear(woq1_wr_queue_clear[7:0]),
	.woq_wr_entry_picked(woq1_wr_entry_picked[7:0]),
	.drq_rd_addr_picked(drq1_rd_addr_picked[9:0]),
	.drq_rdq_free(drq1_rdq_free),
	.drq_rdq_full(drq1_rdq_full),
	.drq_empty(drq1_empty),
	.drq_rd_index_picked(drq1_rd_index_picked[2:0]),
	.drq_wr_index_picked(drq1_wr_index_picked[2:0]),
	.drq_wr_id_picked(drq1_wr_id_picked[2:0]),
	.drif_raw_hazard(drif1_raw_hazard),
	.drq_pd_mode_rd_incr(drq1_pd_mode_rd_incr[15:0]),
	.drq_pd_mode_rd_decr(drq1_pd_mode_rd_decr[15:0]),
	.drq_pd_mode_wr_incr(drq1_pd_mode_wr_incr[15:0]),
	.drq_rd_req(drq1_rd_req),
	.drq_wr_req(drq1_wr_req),
  .drif_init(drif_init),
  .drif_init_mcu_done(drif_init_mcu_done),
  .drif_mcu_state_1(drif_mcu_state_1),
  .drif_mcu_state_2(drif_mcu_state_2),
  .drif_mcu_state_4(drif_mcu_state_4),
  .drif_cmd_picked(drif_cmd_picked),
  .drif_blk_new_openbank(drif_blk_new_openbank),
  .pdmc_rank_avail(pdmc_rank_avail[15:0]),
  .drif_dimm_rd_available(drif_dimm_rd_available[7:0]),
  .drif_refresh_rank(drif_refresh_rank[3:0]),
  .drif_rd_picked(drif_rd_picked),
  .drif_wr_picked(drif_wr_picked),
  .drif_eight_bank_mode(drif_eight_bank_mode),
  .drif_stacked_dimm(drif_stacked_dimm),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_woq_ctl woq (
	.scan_in(woq_scanin),
	.scan_out(woq_scanout),
	.l1clk(l1clk),
  .woq0_wdq_rd(woq0_wdq_rd),
  .woq0_wr_queue_clear(woq0_wr_queue_clear[7:0]),
  .woq1_wdq_rd(woq1_wdq_rd),
  .woq1_wr_queue_clear(woq1_wr_queue_clear[7:0]),
  .woq_wdq_radr(woq_wdq_radr[4:0]),
  .woq_wadr_parity(woq_wadr_parity),
  .woq_io_wdata_sel(woq_io_wdata_sel[1:0]),
  .woq_entry0(woq_entry0[15:0]),
  .woq_entry1(woq_entry1[15:0]),
  .woq_entry_valid(woq_entry_valid[2:0]),
  .woq_entry0_val(woq_entry0_val[15:0]),
  .woq_entry1_val(woq_entry1_val[15:0]),
  .woq_wr_bank_val(woq_wr_bank_val[15:0]),
  .woq_wr_addr_picked(woq_wr_addr_picked[9:0]),
  .woq_wr1_addr_picked(woq_wr1_addr_picked[9:0]),
  .woq_wr2_addr_picked(woq_wr2_addr_picked[9:0]),
  .woq_wr_index_picked(woq_wr_index_picked[2:0]),
  .woq_wr1_index_picked(woq_wr1_index_picked[2:0]),
  .woq_wr2_index_picked(woq_wr2_index_picked[2:0]),
  .woq_wr_wdq_index_picked(woq_wr_wdq_index_picked[2:0]),
  .woq_wr1_wdq_index_picked(woq_wr1_wdq_index_picked[2:0]),
  .woq_wr2_wdq_index_picked(woq_wr2_wdq_index_picked[2:0]),
  .woq_wr_adr_queue_sel(woq_wr_adr_queue_sel[7:0]),
  .woq_wr1_adr_queue_sel(woq_wr1_adr_queue_sel[7:0]),
  .woq_wr2_adr_queue_sel(woq_wr2_adr_queue_sel[7:0]),
  .woq0_wr_entry_picked(woq0_wr_entry_picked[7:0]),
  .woq1_wr_entry_picked(woq1_wr_entry_picked[7:0]),
  .woq1_wr_picked(woq1_wr_picked[2:0]),
  .woq_wdata_wsn(woq_wdata_wsn),
  .woq_err_st_wait_free(woq_err_st_wait_free),
  .woq_err_fifo_empty(woq_err_fifo_empty),
  .woq_wr_req_out(woq_wr_req_out[1:0]),
  .woq_pd_mode_wr_decr(woq_pd_mode_wr_decr[15:0]),
  .woq0_wdq_entry_free(woq0_wdq_entry_free[7:0]),
  .woq1_wdq_entry_free(woq1_wdq_entry_free[7:0]),
  .woq0_wrq_clear_ent(woq0_wrq_clear_ent[7:0]),
  .woq1_wrq_clear_ent(woq1_wrq_clear_ent[7:0]),
  .woq_owr_empty(woq_owr_empty),
  .woq_empty(woq_empty),
  .woq_wr_error_mode(woq_wr_error_mode),
  .woq_wdata_send(woq_wdata_send),
  .woq_err_pdm_wr_incr(woq_err_pdm_wr_incr[15:0]),
  .woq_err_pdm_wr_decr(woq_err_pdm_wr_decr[15:0]),
  .drq0_wr_queue_ent0(drq0_wr_queue_ent0[14:0]),
  .drq0_wr_queue_ent1(drq0_wr_queue_ent1[14:0]),
  .drq0_wr_queue_ent2(drq0_wr_queue_ent2[14:0]),
  .drq0_wr_queue_ent3(drq0_wr_queue_ent3[14:0]),
  .drq0_wr_queue_ent4(drq0_wr_queue_ent4[14:0]),
  .drq0_wr_queue_ent5(drq0_wr_queue_ent5[14:0]),
  .drq0_wr_queue_ent6(drq0_wr_queue_ent6[14:0]),
  .drq0_wr_queue_ent7(drq0_wr_queue_ent7[14:0]),
  .drq0_wdq_valid(drq0_wdq_valid[7:0]),
  .drq1_wr_queue_ent0(drq1_wr_queue_ent0[14:0]),
  .drq1_wr_queue_ent1(drq1_wr_queue_ent1[14:0]),
  .drq1_wr_queue_ent2(drq1_wr_queue_ent2[14:0]),
  .drq1_wr_queue_ent3(drq1_wr_queue_ent3[14:0]),
  .drq1_wr_queue_ent4(drq1_wr_queue_ent4[14:0]),
  .drq1_wr_queue_ent5(drq1_wr_queue_ent5[14:0]),
  .drq1_wr_queue_ent6(drq1_wr_queue_ent6[14:0]),
  .drq1_wr_queue_ent7(drq1_wr_queue_ent7[14:0]),
  .drq1_wdq_valid(drq1_wdq_valid[7:0]),
  .drif_wr_entry_picked(drif_wr_entry_picked[2:0]),
  .drif_init(drif_init),
  .drif_init_mcu_done(drif_init_mcu_done),
  .drif_mcu_state_1(drif_mcu_state_1),
  .drif_mcu_state_2(drif_mcu_state_2),
  .drif_mcu_state_3(drif_mcu_state_3),
  .drif_mcu_state_4(drif_mcu_state_4),
  .drif_mcu_state_5(drif_mcu_state_5),
  .drif_mcu_state_6(drif_mcu_state_6),
  .drif_sync_frame_req_l(drif_sync_frame_req_l),
  .drif_sync_frame_req_early3_l(drif_sync_frame_req_early3_l),
  .drif_single_channel_mode(drif_single_channel_mode),
  .drif_pd_mode_pending(drif_pd_mode_pending),
  .drif_eight_bank_mode(drif_eight_bank_mode),
  .drif_stacked_dimm(drif_stacked_dimm),
  .drif_blk_new_openbank(drif_blk_new_openbank),
  .drif_err_fifo_empty(drif_err_fifo_empty),
  .drif_wr_bc_stall(drif_wr_bc_stall),
  .drif_refresh_rank(drif_refresh_rank[3:0]),
  .drif_hw_selfrsh(drif_hw_selfrsh),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_chnl_reset_error_mode(fbdic_chnl_reset_error_mode),
  .drif_woq_free(drif_woq_free[1:0]),
  .fbdic_clear_wrq_ent(fbdic_clear_wrq_ent),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .fbdic_error_mode(fbdic_error_mode),
  .pdmc_rank_avail(pdmc_rank_avail[15:0]),
  .drif_dimm_wr_available(drif_dimm_wr_available[7:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

// fixscan start:
assign drq0_scanin               = scan_in                  ;
assign drq1_scanin               = drq0_scanout             ;
assign woq_scanin                = drq1_scanout             ;
assign scan_out                  = woq_scanout              ;
// fixscan end:
endmodule



// any PARAMS parms go into naming of macro

module mcu_reqq_ctl_msff_ctl_macro__width_6 (
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

module mcu_reqq_ctl_msff_ctl_macro__width_9 (
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

module mcu_reqq_ctl_msff_ctl_macro__width_1 (
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

module mcu_reqq_ctl_msff_ctl_macro__width_8 (
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

module mcu_reqq_ctl_msff_ctl_macro__width_4 (
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

module mcu_reqq_ctl_msff_ctl_macro__en_1__width_12 (
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

module mcu_reqq_ctl_msff_ctl_macro__en_1__width_15 (
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

module mcu_reqq_ctl_msff_ctl_macro__en_1__width_4 (
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

module mcu_reqq_ctl_msff_ctl_macro__width_16 (
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

module mcu_reqq_ctl_msff_ctl_macro__en_1 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}}) | (dout[0:0] & ~{1{en}});






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

module mcu_reqq_ctl_msff_ctl_macro__en_1__width_3 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = (din[2:0] & {3{en}}) | (dout[2:0] & ~{3{en}});






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

module mcu_reqq_ctl_msff_ctl_macro__width_5 (
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

module mcu_reqq_ctl_msff_ctl_macro__en_1__width_16 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = (din[15:0] & {16{en}}) | (dout[15:0] & ~{16{en}});






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

module mcu_reqq_ctl_msff_ctl_macro__width_2 (
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

module mcu_reqq_ctl_msff_ctl_macro (
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

module mcu_reqq_ctl_msff_ctl_macro__clr_1__width_16 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = din[15:0] & ~{16{clr}};






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

module mcu_reqq_ctl_msff_ctl_macro__clr_1__width_3 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0] & ~{3{clr}};






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








