// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_woq_ctl.v
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
module mcu_woq_ctl (
  woq0_wdq_rd, 
  woq0_wr_queue_clear, 
  woq1_wdq_rd, 
  woq1_wr_queue_clear, 
  woq_wdq_radr, 
  woq_wadr_parity, 
  woq_io_wdata_sel, 
  woq_entry0, 
  woq_entry1, 
  woq_entry_valid, 
  woq_entry0_val, 
  woq_entry1_val, 
  woq_wr_bank_val, 
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
  woq0_wr_entry_picked, 
  woq1_wr_entry_picked, 
  woq1_wr_picked, 
  woq_wdata_wsn, 
  woq_err_st_wait_free, 
  woq_err_fifo_empty, 
  woq_wr_req_out, 
  woq_pd_mode_wr_decr, 
  woq0_wdq_entry_free, 
  woq1_wdq_entry_free, 
  woq0_wrq_clear_ent, 
  woq1_wrq_clear_ent, 
  woq_owr_empty, 
  woq_empty, 
  woq_wr_error_mode, 
  woq_wdata_send, 
  woq_err_pdm_wr_incr, 
  woq_err_pdm_wr_decr, 
  drq0_wr_queue_ent0, 
  drq0_wr_queue_ent1, 
  drq0_wr_queue_ent2, 
  drq0_wr_queue_ent3, 
  drq0_wr_queue_ent4, 
  drq0_wr_queue_ent5, 
  drq0_wr_queue_ent6, 
  drq0_wr_queue_ent7, 
  drq0_wdq_valid, 
  drq1_wr_queue_ent0, 
  drq1_wr_queue_ent1, 
  drq1_wr_queue_ent2, 
  drq1_wr_queue_ent3, 
  drq1_wr_queue_ent4, 
  drq1_wr_queue_ent5, 
  drq1_wr_queue_ent6, 
  drq1_wr_queue_ent7, 
  drq1_wdq_valid, 
  drif_wr_entry_picked, 
  drif_init, 
  drif_init_mcu_done, 
  drif_mcu_state_1, 
  drif_mcu_state_2, 
  drif_mcu_state_3, 
  drif_mcu_state_4, 
  drif_mcu_state_5, 
  drif_mcu_state_6, 
  drif_sync_frame_req_l, 
  drif_sync_frame_req_early3_l, 
  drif_single_channel_mode, 
  drif_pd_mode_pending, 
  drif_eight_bank_mode, 
  drif_stacked_dimm, 
  drif_blk_new_openbank, 
  drif_err_fifo_empty, 
  drif_wr_bc_stall, 
  drif_refresh_rank, 
  drif_hw_selfrsh, 
  fbdic_l0_state, 
  fbdic_chnl_reset_error_mode, 
  drif_woq_free, 
  fbdic_clear_wrq_ent, 
  fbdic_scr_frame_req_d4, 
  fbdic_error_mode, 
  pdmc_rank_avail, 
  drif_dimm_wr_available, 
  l1clk, 
  scan_in, 
  scan_out, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en);
wire siclk;
wire soclk;
wire se;
wire woq_priority_in;
wire [15:0] woq_wr_queue_reg;
wire woq_priority_en;
wire [2:0] woq_wdata_cnt;
wire woq_wdata_cnt_en;
wire ff_priority_scanin;
wire ff_priority_scanout;
wire woq_priority;
wire [2:0] woq_wdata_cnt_in;
wire [1:0] woq_io_wdata_sel_p2;
wire ff_io_wdata_sel_scanin;
wire ff_io_wdata_sel_scanout;
wire [1:0] woq_io_wdata_sel_p1;
wire woq_dimm_stall;
wire woq_dimm0_stall;
wire woq_dimm1_stall;
wire woq_dimm2_stall;
wire woq_dimm3_stall;
wire woq_dimm4_stall;
wire woq_dimm5_stall;
wire woq_dimm6_stall;
wire woq_dimm7_stall;
wire woq_err_st_data;
wire ff_wdata_cnt_scanin;
wire ff_wdata_cnt_scanout;
wire woq_wdata_l2bank_in;
wire woq_wdata_l2bank_en;
wire ff_wdata_l2bank_scanin;
wire ff_wdata_l2bank_scanout;
wire woq_wdata_l2bank_out;
wire woq_wdata_l2bank;
wire [15:0] woq_err_xact;
wire woq_last_wr_data;
wire woq_wr_addr_enq;
wire [7:0] woq_entry0_addrq;
wire [7:0] woq_entry1_addrq;
wire [3:0] woq_entry0_bnk;
wire [3:0] woq_entry1_bnk;
wire [7:0] woq_wrq_ent0_index_dec;
wire [7:0] woq_wrq_ent1_index_dec;
wire [15:0] woq_entry0_mux;
wire [4:0] raddr;
wire [15:0] reg0;
wire [15:0] reg1;
wire [15:0] reg2;
wire [15:0] reg3;
wire [15:0] reg4;
wire [15:0] reg5;
wire [15:0] reg6;
wire [15:0] reg7;
wire [15:0] reg8;
wire [15:0] reg9;
wire [15:0] reg10;
wire [15:0] reg11;
wire [15:0] reg12;
wire [15:0] reg13;
wire [15:0] reg14;
wire [15:0] reg15;
wire [15:0] woq_entry0_bank_dec;
wire woq_entry0_rank_avail;
wire [15:0] woq_ent0_rank_dec;
wire [15:0] woq_rank_avail;
wire [15:0] woq_entry1_bank_dec;
wire woq_entry1_rank_avail;
wire [15:0] woq_ent1_rank_dec;
wire [4:0] waddr_in;
wire [4:0] waddr;
wire ff_waddr_scanin;
wire ff_waddr_scanout;
wire [1:0] woq_deq_cnt;
wire [4:0] raddr_in;
wire ff_raddr_scanin;
wire ff_raddr_scanout;
wire woq_full;
wire woq_not_empty;
wire woq_err_st_wr_req;
wire [4:0] woq_entry_cnt;
wire woq_reg0_en;
wire ff_reg0_scanin;
wire ff_reg0_scanout;
wire woq_reg1_en;
wire ff_reg1_scanin;
wire ff_reg1_scanout;
wire woq_reg2_en;
wire ff_reg2_scanin;
wire ff_reg2_scanout;
wire woq_reg3_en;
wire ff_reg3_scanin;
wire ff_reg3_scanout;
wire woq_reg4_en;
wire ff_reg4_scanin;
wire ff_reg4_scanout;
wire woq_reg5_en;
wire ff_reg5_scanin;
wire ff_reg5_scanout;
wire woq_reg6_en;
wire ff_reg6_scanin;
wire ff_reg6_scanout;
wire woq_reg7_en;
wire ff_reg7_scanin;
wire ff_reg7_scanout;
wire woq_reg8_en;
wire ff_reg8_scanin;
wire ff_reg8_scanout;
wire woq_reg9_en;
wire ff_reg9_scanin;
wire ff_reg9_scanout;
wire woq_reg10_en;
wire ff_reg10_scanin;
wire ff_reg10_scanout;
wire woq_reg11_en;
wire ff_reg11_scanin;
wire ff_reg11_scanout;
wire woq_reg12_en;
wire ff_reg12_scanin;
wire ff_reg12_scanout;
wire woq_reg13_en;
wire ff_reg13_scanin;
wire ff_reg13_scanout;
wire woq_reg14_en;
wire ff_reg14_scanin;
wire ff_reg14_scanout;
wire woq_reg15_en;
wire ff_reg15_scanin;
wire ff_reg15_scanout;
wire [4:0] woq_owr_ptr_in;
wire [4:0] woq_owr_ptr;
wire ff_owr_ptr_scanin;
wire ff_owr_ptr_scanout;
wire [1:0] woq_wr_req_out_in;
wire ff_wr_req_out_scanin;
wire ff_wr_req_out_scanout;
wire [1:0] woq_owr_free;
wire [15:0] woq_owr_ent0;
wire [15:0] woq_owr_ent1;
wire [7:0] woq_owr_ent0_wdq_dec;
wire [7:0] woq_owr_ent1_wdq_dec;
wire [7:0] woq0_wdq_free;
wire woq_err_st_wait_clear;
wire [7:0] woq_err_wdq_dec;
wire [7:0] woq1_wdq_free;
wire ff_woq_free_d1_scanin;
wire ff_woq_free_d1_scanout;
wire [0:0] drif_woq_free_d1;
wire [7:0] woq0_wdq_free_accum_in;
wire [7:0] woq0_wdq_free_accum;
wire [7:0] woq1_wdq_free_accum_in;
wire [7:0] woq1_wdq_free_accum;
wire woq_wrq_wdq_entry_clr;
wire ff_wdq_free_accum_scanin;
wire ff_wdq_free_accum_scanout;
wire [7:0] woq0_wdq_entry_free_in;
wire [7:0] woq1_wdq_entry_free_in;
wire ff_wdq_entry_free_scanin;
wire ff_wdq_entry_free_scanout;
wire [7:0] woq_owr_ent0_wrq_dec;
wire [7:0] woq_owr_ent1_wrq_dec;
wire [7:0] woq0_wrq_clear;
wire [7:0] woq_err_wrq_dec;
wire [7:0] woq1_wrq_clear;
wire [7:0] woq0_wrq_clear_accum_in;
wire [7:0] woq0_wrq_clear_accum;
wire [7:0] woq1_wrq_clear_accum_in;
wire [7:0] woq1_wrq_clear_accum;
wire ff_wrq_clear_accum_scanin;
wire ff_wrq_clear_accum_scanout;
wire [15:0] woq_entry0_pd_mode_decr;
wire [15:0] woq_entry1_pd_mode_decr;
wire [15:0] woq_pd_mode_wr_decr_in;
wire ff_pd_mode_wr_decr_scanin;
wire ff_pd_mode_wr_decr_scanout;
wire woq_wr_error_mode_in;
wire ff_wr_error_mode_scanin;
wire ff_wr_error_mode_scanout;
wire [4:0] woq_error_ptr_in;
wire [4:0] woq_error_ptr;
wire ff_error_ptr_scanin;
wire ff_error_ptr_scanout;
wire [3:0] woq_wr_err_state;
wire inv_woq_err_st_data_next;
wire woq_err_st_data_next;
wire inv_woq_err_st_data;
wire ff_wr_err_state_scanin;
wire ff_wr_err_state_scanout;
wire woq_err_st_wait_free_next;
wire woq_wr_retry_error;
wire [15:0] woq_err_pdm_wr;
wire woq_dimm0_wrcnt_incr;
wire woq_dimm0_wrcnt_decr;
wire [2:0] woq_dimm0_wrcnt_in;
wire [2:0] woq_dimm0_wrcnt;
wire ff_dimm0_wrcnt_scanin;
wire ff_dimm0_wrcnt_scanout;
wire woq_dimm1_wrcnt_incr;
wire woq_dimm1_wrcnt_decr;
wire [2:0] woq_dimm1_wrcnt_in;
wire [2:0] woq_dimm1_wrcnt;
wire ff_dimm1_wrcnt_scanin;
wire ff_dimm1_wrcnt_scanout;
wire woq_dimm2_wrcnt_incr;
wire woq_dimm2_wrcnt_decr;
wire [2:0] woq_dimm2_wrcnt_in;
wire [2:0] woq_dimm2_wrcnt;
wire ff_dimm2_wrcnt_scanin;
wire ff_dimm2_wrcnt_scanout;
wire woq_dimm3_wrcnt_incr;
wire woq_dimm3_wrcnt_decr;
wire [2:0] woq_dimm3_wrcnt_in;
wire [2:0] woq_dimm3_wrcnt;
wire ff_dimm3_wrcnt_scanin;
wire ff_dimm3_wrcnt_scanout;
wire woq_dimm4_wrcnt_incr;
wire woq_dimm4_wrcnt_decr;
wire [2:0] woq_dimm4_wrcnt_in;
wire [2:0] woq_dimm4_wrcnt;
wire ff_dimm4_wrcnt_scanin;
wire ff_dimm4_wrcnt_scanout;
wire woq_dimm5_wrcnt_incr;
wire woq_dimm5_wrcnt_decr;
wire [2:0] woq_dimm5_wrcnt_in;
wire [2:0] woq_dimm5_wrcnt;
wire ff_dimm5_wrcnt_scanin;
wire ff_dimm5_wrcnt_scanout;
wire woq_dimm6_wrcnt_incr;
wire woq_dimm6_wrcnt_decr;
wire [2:0] woq_dimm6_wrcnt_in;
wire [2:0] woq_dimm6_wrcnt;
wire ff_dimm6_wrcnt_scanin;
wire ff_dimm6_wrcnt_scanout;
wire woq_dimm7_wrcnt_incr;
wire woq_dimm7_wrcnt_decr;
wire [2:0] woq_dimm7_wrcnt_in;
wire [2:0] woq_dimm7_wrcnt;
wire ff_dimm7_wrcnt_scanin;
wire ff_dimm7_wrcnt_scanout;


output		woq0_wdq_rd;
output	[7:0]	woq0_wr_queue_clear;

output		woq1_wdq_rd;
output	[7:0]	woq1_wr_queue_clear;

output	[4:0]	woq_wdq_radr;
output		woq_wadr_parity;
output	[1:0]	woq_io_wdata_sel;

output	[15:0]	woq_entry0;
output	[15:0]	woq_entry1;
output	[2:0]	woq_entry_valid;

output	[15:0]	woq_entry0_val;
output	[15:0]	woq_entry1_val;

output	[15:0]	woq_wr_bank_val;

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

output	[7:0]	woq0_wr_entry_picked;
output	[7:0]	woq1_wr_entry_picked;

output	[2:0]	woq1_wr_picked;

output		woq_wdata_wsn;
output		woq_err_st_wait_free;
output		woq_err_fifo_empty;
output	[1:0]	woq_wr_req_out;
output	[15:0]	woq_pd_mode_wr_decr;

output	[7:0]	woq0_wdq_entry_free;
output	[7:0]	woq1_wdq_entry_free;
output	[7:0]	woq0_wrq_clear_ent;
output	[7:0]	woq1_wrq_clear_ent;

output		woq_owr_empty;
output		woq_empty;
output		woq_wr_error_mode;
output		woq_wdata_send;

output	[15:0]	woq_err_pdm_wr_incr;
output	[15:0]	woq_err_pdm_wr_decr;

input	[14:0]	drq0_wr_queue_ent0;
input	[14:0]	drq0_wr_queue_ent1;
input	[14:0]	drq0_wr_queue_ent2;
input	[14:0]	drq0_wr_queue_ent3;
input	[14:0]	drq0_wr_queue_ent4;
input	[14:0]	drq0_wr_queue_ent5;
input	[14:0]	drq0_wr_queue_ent6;
input	[14:0]	drq0_wr_queue_ent7;
input	[7:0]	drq0_wdq_valid;

input	[14:0]	drq1_wr_queue_ent0;
input	[14:0]	drq1_wr_queue_ent1;
input	[14:0]	drq1_wr_queue_ent2;
input	[14:0]	drq1_wr_queue_ent3;
input	[14:0]	drq1_wr_queue_ent4;
input	[14:0]	drq1_wr_queue_ent5;
input	[14:0]	drq1_wr_queue_ent6;
input	[14:0]	drq1_wr_queue_ent7;
input	[7:0]	drq1_wdq_valid;

input	[2:0]	drif_wr_entry_picked;
input		drif_init;
input		drif_init_mcu_done;
input		drif_mcu_state_1;
input		drif_mcu_state_2;
input		drif_mcu_state_3;
input		drif_mcu_state_4;
input		drif_mcu_state_5;
input		drif_mcu_state_6;
input		drif_sync_frame_req_l;
input		drif_sync_frame_req_early3_l;
input		drif_single_channel_mode;
input		drif_pd_mode_pending;
input		drif_eight_bank_mode;
input		drif_stacked_dimm;
input		drif_blk_new_openbank;
input		drif_err_fifo_empty;
input		drif_wr_bc_stall;
input	[3:0]	drif_refresh_rank;	// rank being refreshed; requests are blocked to this rank
					// during refresh
input		drif_hw_selfrsh;

input		fbdic_l0_state;
input		fbdic_chnl_reset_error_mode;
input	[1:0]	drif_woq_free;
input		fbdic_clear_wrq_ent;
input		fbdic_scr_frame_req_d4;
input		fbdic_error_mode;

input	[15:0]	pdmc_rank_avail;
input	[7:0]	drif_dimm_wr_available;

input  		l1clk;
input		scan_in;
output		scan_out;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;

// Scan reassigns
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

reg 	woq_err_st_wait_free_in;
reg 	woq_err_st_wait_clear_in;
reg	woq_err_st_wr_req_in;
reg	woq_err_st_data_in;

assign woq_priority_in = ~woq_wr_queue_reg[15];
assign woq_priority_en = drif_single_channel_mode ? woq_wdata_cnt[2:0] == 3'h7 & woq_wdata_cnt_en :
						    woq_wdata_cnt[1:0] == 2'h3 & woq_wdata_cnt_en;

mcu_woq_ctl_msff_ctl_macro__en_1 ff_priority  (
	.scan_in(ff_priority_scanin),
	.scan_out(ff_priority_scanout),
	.din(woq_priority_in),	
	.dout(woq_priority),
	.en(woq_priority_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_wdata_cnt_in[2:0] = drif_single_channel_mode ? woq_wdata_cnt[2:0] + 3'h1 : {1'b0, woq_wdata_cnt[1:0] + 2'h1};

// select between upper and lower double words when in single channel mode
assign woq_io_wdata_sel_p2[1:0] = drif_single_channel_mode ? {woq_wdata_cnt[0],~woq_wdata_cnt[0]} : 2'h1;

mcu_woq_ctl_msff_ctl_macro__width_4 ff_io_wdata_sel  (
	.scan_in(ff_io_wdata_sel_scanin),
	.scan_out(ff_io_wdata_sel_scanout),
	.din({woq_io_wdata_sel_p2[1:0],woq_io_wdata_sel_p1[1:0]}),
	.dout({woq_io_wdata_sel_p1[1:0],woq_io_wdata_sel[1:0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_dimm_stall = woq_dimm0_stall | woq_dimm1_stall | woq_dimm2_stall | woq_dimm3_stall | 
			woq_dimm4_stall | woq_dimm5_stall | woq_dimm6_stall | woq_dimm7_stall;
assign woq_wdata_cnt_en = (fbdic_l0_state | fbdic_chnl_reset_error_mode) & drif_sync_frame_req_early3_l & 
			~woq_dimm_stall & ~drif_wr_bc_stall & ~drif_mcu_state_3 & ~drif_mcu_state_5 & ~drif_mcu_state_6 &
			((~woq_priority | ~(|drq1_wdq_valid[7:0])) & (|drq0_wdq_valid[7:0]) & ~woq_wr_error_mode | 
			(woq_priority | ~(|drq0_wdq_valid[7:0])) & (|drq1_wdq_valid[7:0]) & ~woq_wr_error_mode | 
				~woq_err_fifo_empty & woq_wr_error_mode & woq_err_st_data) &
			(woq_wdata_cnt[2:0] != 3'h0 | woq_wdata_cnt[2:0] == 3'h0 & ~drif_pd_mode_pending &
				~drif_blk_new_openbank & (drif_err_fifo_empty | woq_wr_error_mode) & ~fbdic_error_mode &
				~drif_mcu_state_2 & ~drif_hw_selfrsh);

mcu_woq_ctl_msff_ctl_macro__en_1__width_3 ff_wdata_cnt  (
	.scan_in(ff_wdata_cnt_scanin),
	.scan_out(ff_wdata_cnt_scanout),
	.din(woq_wdata_cnt_in[2:0]),
	.dout(woq_wdata_cnt[2:0]),
	.en(woq_wdata_cnt_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// used to stall error reads until all write data has been sent
assign woq_wdata_send = woq_wdata_cnt_en | woq_wdata_cnt[2:0] != 3'h0;

// Select which L2 bank request is from
assign woq_wdata_l2bank_in = (woq_priority | ~(|drq0_wdq_valid[7:0])) & (|drq1_wdq_valid[7:0]);
assign woq_wdata_l2bank_en = woq_wdata_cnt_en & woq_wdata_cnt[2:0] == 3'h0;

mcu_woq_ctl_msff_ctl_macro__en_1 ff_wdata_l2bank  (
	.scan_in(ff_wdata_l2bank_scanin),
	.scan_out(ff_wdata_l2bank_scanout),
	.din(woq_wdata_l2bank_in),
	.dout(woq_wdata_l2bank_out),
	.en(woq_wdata_l2bank_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_wdata_l2bank = woq_wdata_l2bank_en ? woq_wdata_l2bank_in : woq_wdata_l2bank_out;

// Entry to write into WOQ
assign woq_wr_queue_reg[14:0] = woq_wr_error_mode ? woq_err_xact[14:0] : 
				woq_wdata_l2bank ? drq1_wr_queue_ent0[14:0] : drq0_wr_queue_ent0[14:0];
assign woq_wr_queue_reg[15] = woq_wr_error_mode ? woq_err_xact[15] : woq_wdata_l2bank;

assign woq_wdata_wsn =  (woq_wdata_cnt[1:0] == 2'h1) & woq_wr_queue_reg[3] |
			(woq_wdata_cnt[1:0] == 2'h2) & woq_wr_queue_reg[4] |
			(woq_wdata_cnt[1:0] == 2'h3) & woq_wr_queue_reg[5];

// pull off address parity to XOR with ECC 
assign woq_wadr_parity = woq_wr_queue_reg[8];

// Check that entry is cleared from DRQ at same time entry is placed in WOQ
// 0in custom -fire (woq_wr_addr_enq ^ (woq0_wr_queue_clear[0] | woq1_wr_queue_clear[0]))

// clear entry from drq once data has been sent to DIMM
assign woq0_wr_queue_clear[0] = ~woq_wdata_l2bank & woq_wdata_cnt_en & ~woq_wr_error_mode &
				(drif_single_channel_mode ? (woq_wdata_cnt[2:0] == 3'h7) : (woq_wdata_cnt[1:0] == 2'h3));
assign woq1_wr_queue_clear[0] = woq_wdata_l2bank & woq_wdata_cnt_en & ~woq_wr_error_mode &
				(drif_single_channel_mode ? (woq_wdata_cnt[2:0] == 3'h7) : (woq_wdata_cnt[1:0] == 2'h3));
assign woq0_wr_queue_clear[7:1] = 7'h0;
assign woq1_wr_queue_clear[7:1] = 7'h0;

// WDQ read address
assign woq_wdq_radr[4:0] = drif_single_channel_mode ? {woq_wr_queue_reg[14:12],woq_wdata_cnt[2:1]} : 
							{woq_wr_queue_reg[14:12],woq_wdata_cnt[1:0]};
assign woq0_wdq_rd = woq_wdata_cnt_en & (woq_wr_error_mode ? ~woq_err_xact[15] : ~woq_wdata_l2bank);
assign woq1_wdq_rd = woq_wdata_cnt_en & (woq_wr_error_mode ? woq_err_xact[15] : woq_wdata_l2bank);

// Write Ordering Queue RAM
assign woq_last_wr_data = (drif_single_channel_mode ? woq_wdata_cnt[2:0] == 3'h7 & woq_wdata_cnt_en : 
							woq_wdata_cnt[1:0] == 2'h3 & woq_wdata_cnt_en);
assign woq_wr_addr_enq = ~woq_wr_error_mode & woq_last_wr_data;

// decoded bank of write entry picked
assign woq1_wr_picked[2:0] = drif_wr_entry_picked[2:0] & {woq_entry1[15],woq_entry0[15],woq_entry0[15]};

assign woq0_wr_entry_picked[7:0] = {8{drif_wr_entry_picked[0] & ~woq_entry0[15]}} & woq_entry0_addrq[7:0] |
				   {8{drif_wr_entry_picked[1] & ~woq_entry0[15]}} & woq_entry0_addrq[7:0] |
				   {8{drif_wr_entry_picked[2] & ~woq_entry1[15]}} & woq_entry1_addrq[7:0];
assign woq1_wr_entry_picked[7:0] = {8{drif_wr_entry_picked[0] &  woq_entry0[15]}} & woq_entry0_addrq[7:0] |
				   {8{drif_wr_entry_picked[1] &  woq_entry0[15]}} & woq_entry0_addrq[7:0] |
				   {8{drif_wr_entry_picked[2] &  woq_entry1[15]}} & woq_entry1_addrq[7:0];

// address picked
assign woq_wr_addr_picked[9:0] = {woq_entry0[8:3],woq_entry0_bnk[3],woq_entry0[2:0]};
assign woq_wr1_addr_picked[9:0] = {woq_entry0[8:3],woq_entry0_bnk[3],woq_entry0[2:0]};
assign woq_wr2_addr_picked[9:0] = {woq_entry1[8:3],woq_entry1_bnk[3],woq_entry1[2:0]};

// address queue entry location
assign woq_wr_index_picked[2:0] = woq_entry0[11:9];
assign woq_wr1_index_picked[2:0] = woq_entry0[11:9];
assign woq_wr2_index_picked[2:0] = woq_entry1[11:9];

// wdq queue entry location
assign woq_wr_wdq_index_picked[2:0] = woq_entry0[14:12];
assign woq_wr1_wdq_index_picked[2:0] = woq_entry0[14:12];
assign woq_wr2_wdq_index_picked[2:0] = woq_entry1[14:12];

// select for write address queue entry
assign woq_wr_adr_queue_sel[7:0] = {8{drif_wr_entry_picked[0]}} & woq_wrq_ent0_index_dec[7:0];
assign woq_wr1_adr_queue_sel[7:0] = {8{drif_wr_entry_picked[1]}} & woq_wrq_ent0_index_dec[7:0];
assign woq_wr2_adr_queue_sel[7:0] = {8{drif_wr_entry_picked[2]}} & woq_wrq_ent1_index_dec[7:0];

// Entry 0,1 selection
assign {woq_entry0_mux[15:0],woq_entry1[15:0]} = 
			{32{raddr[3:0] == 4'h0}} & {reg0[15:0], reg1[15:0]} |
			{32{raddr[3:0] == 4'h1}} & {reg1[15:0], reg2[15:0]} |
			{32{raddr[3:0] == 4'h2}} & {reg2[15:0], reg3[15:0]} |
			{32{raddr[3:0] == 4'h3}} & {reg3[15:0], reg4[15:0]} |
			{32{raddr[3:0] == 4'h4}} & {reg4[15:0], reg5[15:0]} |
			{32{raddr[3:0] == 4'h5}} & {reg5[15:0], reg6[15:0]} |
			{32{raddr[3:0] == 4'h6}} & {reg6[15:0], reg7[15:0]} |
			{32{raddr[3:0] == 4'h7}} & {reg7[15:0], reg8[15:0]} |
			{32{raddr[3:0] == 4'h8}} & {reg8[15:0], reg9[15:0]} |
			{32{raddr[3:0] == 4'h9}} & {reg9[15:0], reg10[15:0]} |
			{32{raddr[3:0] == 4'ha}} & {reg10[15:0],reg11[15:0]} |
			{32{raddr[3:0] == 4'hb}} & {reg11[15:0],reg12[15:0]} |
			{32{raddr[3:0] == 4'hc}} & {reg12[15:0],reg13[15:0]} |
			{32{raddr[3:0] == 4'hd}} & {reg13[15:0],reg14[15:0]} |
			{32{raddr[3:0] == 4'he}} & {reg14[15:0],reg15[15:0]}|
			{32{raddr[3:0] == 4'hf}} & {reg15[15:0],reg0[15:0]};

assign woq_entry0[15:0] = woq_wr_error_mode ? woq_err_xact[15:0] : woq_entry0_mux[15:0];

// Entry 0 decodes
assign woq_entry0_bnk[3:0] = {drif_eight_bank_mode ? (drif_stacked_dimm ? woq_entry0[6] :
							woq_entry0[3]) :
						    (drif_stacked_dimm ? woq_entry0[3] :
							woq_entry0[4]), woq_entry0[2:0]};

assign woq_entry0_val[15:0] = woq_entry0_bank_dec[15:0] & {16{woq_entry_valid[0] & woq_entry0_rank_avail & 
				((drif_mcu_state_2 | drif_mcu_state_4) & ~drif_init &
				woq_entry0[6:3] != drif_refresh_rank[3:0] | drif_mcu_state_1)}};
assign woq_entry0_bank_dec[15:0] = 
			{woq_entry0_bnk[3:0] == 4'hf, woq_entry0_bnk[3:0] == 4'he,
			woq_entry0_bnk[3:0] == 4'hd, woq_entry0_bnk[3:0] == 4'hc,
			woq_entry0_bnk[3:0] == 4'hb, woq_entry0_bnk[3:0] == 4'ha,
			woq_entry0_bnk[3:0] == 4'h9, woq_entry0_bnk[3:0] == 4'h8,
			woq_entry0_bnk[3:0] == 4'h7, woq_entry0_bnk[3:0] == 4'h6,
			woq_entry0_bnk[3:0] == 4'h5, woq_entry0_bnk[3:0] == 4'h4,
			woq_entry0_bnk[3:0] == 4'h3, woq_entry0_bnk[3:0] == 4'h2,
			woq_entry0_bnk[3:0] == 4'h1, woq_entry0_bnk[3:0] == 4'h0};

assign woq_ent0_rank_dec[15:0] = {woq_entry0[6:3] == 4'hf, woq_entry0[6:3] == 4'he,
				  woq_entry0[6:3] == 4'hd, woq_entry0[6:3] == 4'hc,
				  woq_entry0[6:3] == 4'hb, woq_entry0[6:3] == 4'ha,
				  woq_entry0[6:3] == 4'h9, woq_entry0[6:3] == 4'h8,
				  woq_entry0[6:3] == 4'h7, woq_entry0[6:3] == 4'h6,
				  woq_entry0[6:3] == 4'h5, woq_entry0[6:3] == 4'h4,
				  woq_entry0[6:3] == 4'h3, woq_entry0[6:3] == 4'h2,
				  woq_entry0[6:3] == 4'h1, woq_entry0[6:3] == 4'h0};
assign woq_entry0_rank_avail = |(woq_ent0_rank_dec[15:0] & woq_rank_avail[15:0]);

assign woq_entry0_addrq[7:0] = {woq_entry0[11:9] == 3'h7,
			woq_entry0[11:9] == 3'h6,
			woq_entry0[11:9] == 3'h5,
			woq_entry0[11:9] == 3'h4,
			woq_entry0[11:9] == 3'h3,
			woq_entry0[11:9] == 3'h2,
			woq_entry0[11:9] == 3'h1,
			woq_entry0[11:9] == 3'h0};

assign woq_wrq_ent0_index_dec[7:0] = { (woq_entry0[11:9] == 3'h7), (woq_entry0[11:9] == 3'h6),
                                        (woq_entry0[11:9] == 3'h5), (woq_entry0[11:9] == 3'h4),
					(woq_entry0[11:9] == 3'h3), (woq_entry0[11:9] == 3'h2),
                                        (woq_entry0[11:9] == 3'h1), (woq_entry0[11:9] == 3'h0) };

// Entry 1 decodes
assign woq_entry1_bnk[3:0] = {drif_eight_bank_mode ? (drif_stacked_dimm ? woq_entry1[6] :
							woq_entry1[3]) :
						    (drif_stacked_dimm ? woq_entry1[3] :
							woq_entry1[4]), woq_entry1[2:0]};

assign woq_entry1_val[15:0] = woq_entry1_bank_dec[15:0] & {16{woq_entry_valid[1] & woq_entry1_rank_avail & 
				((drif_mcu_state_2 | drif_mcu_state_4) & ~drif_init & 
				woq_entry1[6:3] != drif_refresh_rank[3:0] | drif_mcu_state_1)}};
assign woq_entry1_bank_dec[15:0] = 
			{woq_entry1_bnk[3:0] == 4'hf, woq_entry1_bnk[3:0] == 4'he,
			woq_entry1_bnk[3:0] == 4'hd, woq_entry1_bnk[3:0] == 4'hc,
			woq_entry1_bnk[3:0] == 4'hb, woq_entry1_bnk[3:0] == 4'ha,
			woq_entry1_bnk[3:0] == 4'h9, woq_entry1_bnk[3:0] == 4'h8,
			woq_entry1_bnk[3:0] == 4'h7, woq_entry1_bnk[3:0] == 4'h6,
			woq_entry1_bnk[3:0] == 4'h5, woq_entry1_bnk[3:0] == 4'h4,
			woq_entry1_bnk[3:0] == 4'h3, woq_entry1_bnk[3:0] == 4'h2,
			woq_entry1_bnk[3:0] == 4'h1, woq_entry1_bnk[3:0] == 4'h0};

assign woq_ent1_rank_dec[15:0] = {woq_entry1[6:3] == 4'hf, woq_entry1[6:3] == 4'he,
				  woq_entry1[6:3] == 4'hd, woq_entry1[6:3] == 4'hc,
				  woq_entry1[6:3] == 4'hb, woq_entry1[6:3] == 4'ha,
				  woq_entry1[6:3] == 4'h9, woq_entry1[6:3] == 4'h8,
				  woq_entry1[6:3] == 4'h7, woq_entry1[6:3] == 4'h6,
				  woq_entry1[6:3] == 4'h5, woq_entry1[6:3] == 4'h4,
				  woq_entry1[6:3] == 4'h3, woq_entry1[6:3] == 4'h2,
				  woq_entry1[6:3] == 4'h1, woq_entry1[6:3] == 4'h0};
assign woq_entry1_rank_avail = |(woq_ent1_rank_dec[15:0] & woq_rank_avail[15:0]);

assign woq_entry1_addrq[7:0] = {woq_entry1[11:9] == 3'h7,
			woq_entry1[11:9] == 3'h6,
			woq_entry1[11:9] == 3'h5,
			woq_entry1[11:9] == 3'h4,
			woq_entry1[11:9] == 3'h3,
			woq_entry1[11:9] == 3'h2,
			woq_entry1[11:9] == 3'h1,
			woq_entry1[11:9] == 3'h0};

assign woq_wrq_ent1_index_dec[7:0] = { (woq_entry1[11:9] == 3'h7), (woq_entry1[11:9] == 3'h6),
                                        (woq_entry1[11:9] == 3'h5), (woq_entry1[11:9] == 3'h4),
                                        (woq_entry1[11:9] == 3'h3), (woq_entry1[11:9] == 3'h2),
                                        (woq_entry1[11:9] == 3'h1), (woq_entry1[11:9] == 3'h0) };

// decoded bank so scheduler will know which banks have pending write requests
assign woq_wr_bank_val[15:0] = woq_entry0_bank_dec[15:0] & {16{woq_entry_valid[0]}}
				 | woq_entry1_bank_dec[15:0] & {16{woq_entry_valid[1]}};

// Queue read and write pointers
assign waddr_in[4:0] = woq_wr_addr_enq ? waddr[4:0] + 5'h1 : waddr[4:0];
mcu_woq_ctl_msff_ctl_macro__width_5 ff_waddr  (
	.scan_in(ff_waddr_scanin),
	.scan_out(ff_waddr_scanout),
	.din(waddr_in[4:0]),
	.dout(waddr[4:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_deq_cnt[1:0] = {2{~woq_wr_error_mode}} & (drif_wr_entry_picked[2:0] == 3'h1 ? 2'h1 :
						     drif_wr_entry_picked[2:0] == 3'h2 ? 2'h1 : 
						     drif_wr_entry_picked[2:0] == 3'h6 ? 2'h2 : 2'h0);

assign raddr_in[4:0] = woq_wr_error_mode ? waddr[4:0] : raddr[4:0] + {3'h0,woq_deq_cnt[1:0]};
mcu_woq_ctl_msff_ctl_macro__width_5 ff_raddr  (
	.scan_in(ff_raddr_scanin),
	.scan_out(ff_raddr_scanout),
	.din(raddr_in[4:0]),
	.dout(raddr[4:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_full = waddr[4:0] == {~raddr[4],raddr[3:0]};
assign woq_not_empty = (waddr[4:0] != raddr[4:0]) & ~woq_wr_error_mode | woq_err_st_wr_req;
assign woq_empty = ~woq_not_empty;

// woq entry count
assign woq_entry_cnt[4:0] = waddr[4:0] > raddr[4:0] ? waddr[4:0] - raddr[4:0] : ~(raddr[4:0] - waddr[4:0]) + 5'h1;
assign woq_entry_valid[2:0] = woq_wr_error_mode & woq_err_st_wr_req ? 3'h1 :
				woq_wr_error_mode & ~woq_err_st_wr_req ? 3'h0 :
				{woq_entry_cnt[4:0] >= 5'h3, woq_entry_cnt[4:0] >= 5'h2, ~woq_empty};

// Queue storage

assign woq_reg0_en = woq_wr_addr_enq & waddr[3:0] == 4'h0;

mcu_woq_ctl_msff_ctl_macro__en_1__width_16 ff_reg0  (
	.scan_in(ff_reg0_scanin),
	.scan_out(ff_reg0_scanout),
	.din(woq_wr_queue_reg[15:0]),
	.dout(reg0[15:0]),
	.en(woq_reg0_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_reg1_en = woq_wr_addr_enq & waddr[3:0] == 4'h1;

mcu_woq_ctl_msff_ctl_macro__en_1__width_16 ff_reg1  (
	.scan_in(ff_reg1_scanin),
	.scan_out(ff_reg1_scanout),
	.din(woq_wr_queue_reg[15:0]),
	.dout(reg1[15:0]),
	.en(woq_reg1_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_reg2_en = woq_wr_addr_enq & waddr[3:0] == 4'h2;

mcu_woq_ctl_msff_ctl_macro__en_1__width_16 ff_reg2  (
	.scan_in(ff_reg2_scanin),
	.scan_out(ff_reg2_scanout),
	.din(woq_wr_queue_reg[15:0]),
	.dout(reg2[15:0]),
	.en(woq_reg2_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_reg3_en = woq_wr_addr_enq & waddr[3:0] == 4'h3;

mcu_woq_ctl_msff_ctl_macro__en_1__width_16 ff_reg3  (
	.scan_in(ff_reg3_scanin),
	.scan_out(ff_reg3_scanout),
	.din(woq_wr_queue_reg[15:0]),
	.dout(reg3[15:0]),
	.en(woq_reg3_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_reg4_en = woq_wr_addr_enq & waddr[3:0] == 4'h4;

mcu_woq_ctl_msff_ctl_macro__en_1__width_16 ff_reg4  (
	.scan_in(ff_reg4_scanin),
	.scan_out(ff_reg4_scanout),
	.din(woq_wr_queue_reg[15:0]),
	.dout(reg4[15:0]),
	.en(woq_reg4_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_reg5_en = woq_wr_addr_enq & waddr[3:0] == 4'h5;

mcu_woq_ctl_msff_ctl_macro__en_1__width_16 ff_reg5  (
	.scan_in(ff_reg5_scanin),
	.scan_out(ff_reg5_scanout),
	.din(woq_wr_queue_reg[15:0]),
	.dout(reg5[15:0]),
	.en(woq_reg5_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_reg6_en = woq_wr_addr_enq & waddr[3:0] == 4'h6;

mcu_woq_ctl_msff_ctl_macro__en_1__width_16 ff_reg6  (
	.scan_in(ff_reg6_scanin),
	.scan_out(ff_reg6_scanout),
	.din(woq_wr_queue_reg[15:0]),
	.dout(reg6[15:0]),
	.en(woq_reg6_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_reg7_en = woq_wr_addr_enq & waddr[3:0] == 4'h7;

mcu_woq_ctl_msff_ctl_macro__en_1__width_16 ff_reg7  (
	.scan_in(ff_reg7_scanin),
	.scan_out(ff_reg7_scanout),
	.din(woq_wr_queue_reg[15:0]),
	.dout(reg7[15:0]),
	.en(woq_reg7_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_reg8_en = woq_wr_addr_enq & waddr[3:0] == 4'h8;

mcu_woq_ctl_msff_ctl_macro__en_1__width_16 ff_reg8  (
	.scan_in(ff_reg8_scanin),
	.scan_out(ff_reg8_scanout),
	.din(woq_wr_queue_reg[15:0]),
	.dout(reg8[15:0]),
	.en(woq_reg8_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_reg9_en = woq_wr_addr_enq & waddr[3:0] == 4'h9;

mcu_woq_ctl_msff_ctl_macro__en_1__width_16 ff_reg9  (
	.scan_in(ff_reg9_scanin),
	.scan_out(ff_reg9_scanout),
	.din(woq_wr_queue_reg[15:0]),
	.dout(reg9[15:0]),
	.en(woq_reg9_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_reg10_en = woq_wr_addr_enq & waddr[3:0] == 4'ha;

mcu_woq_ctl_msff_ctl_macro__en_1__width_16 ff_reg10  (
	.scan_in(ff_reg10_scanin),
	.scan_out(ff_reg10_scanout),
	.din(woq_wr_queue_reg[15:0]),
	.dout(reg10[15:0]),
	.en(woq_reg10_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_reg11_en = woq_wr_addr_enq & waddr[3:0] == 4'hb;

mcu_woq_ctl_msff_ctl_macro__en_1__width_16 ff_reg11  (
	.scan_in(ff_reg11_scanin),
	.scan_out(ff_reg11_scanout),
	.din(woq_wr_queue_reg[15:0]),
	.dout(reg11[15:0]),
	.en(woq_reg11_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_reg12_en = woq_wr_addr_enq & waddr[3:0] == 4'hc;

mcu_woq_ctl_msff_ctl_macro__en_1__width_16 ff_reg12  (
	.scan_in(ff_reg12_scanin),
	.scan_out(ff_reg12_scanout),
	.din(woq_wr_queue_reg[15:0]),
	.dout(reg12[15:0]),
	.en(woq_reg12_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_reg13_en = woq_wr_addr_enq & waddr[3:0] == 4'hd;

mcu_woq_ctl_msff_ctl_macro__en_1__width_16 ff_reg13  (
	.scan_in(ff_reg13_scanin),
	.scan_out(ff_reg13_scanout),
	.din(woq_wr_queue_reg[15:0]),
	.dout(reg13[15:0]),
	.en(woq_reg13_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_reg14_en = woq_wr_addr_enq & waddr[3:0] == 4'he;

mcu_woq_ctl_msff_ctl_macro__en_1__width_16 ff_reg14  (
	.scan_in(ff_reg14_scanin),
	.scan_out(ff_reg14_scanout),
	.din(woq_wr_queue_reg[15:0]),
	.dout(reg14[15:0]),
	.en(woq_reg14_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_reg15_en = woq_wr_addr_enq & waddr[3:0] == 4'hf;

mcu_woq_ctl_msff_ctl_macro__en_1__width_16 ff_reg15  (
	.scan_in(ff_reg15_scanin),
	.scan_out(ff_reg15_scanout),
	.din(woq_wr_queue_reg[15:0]),
	.dout(reg15[15:0]),
	.en(woq_reg15_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Outstanding write request pointer - points to first transaction that hasn't completed
assign woq_owr_ptr_in[4:0] = woq_wr_error_mode ? waddr[4:0] : woq_owr_ptr[4:0] + {3'h0,drif_woq_free[1:0]};
mcu_woq_ctl_msff_ctl_macro__width_5 ff_owr_ptr  (
	.scan_in(ff_owr_ptr_scanin),
	.scan_out(ff_owr_ptr_scanout),
	.din(woq_owr_ptr_in[4:0]),
	.dout(woq_owr_ptr[4:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_owr_empty = (woq_owr_ptr[4:0] == waddr[4:0]);

// For debug bus: number of writes completing
assign woq_wr_req_out_in[1:0] = drif_woq_free[1:0];
mcu_woq_ctl_msff_ctl_macro__width_2 ff_wr_req_out  (
	.scan_in(ff_wr_req_out_scanin),
	.scan_out(ff_wr_req_out_scanout),
	.din(woq_wr_req_out_in[1:0]),
	.dout(woq_wr_req_out[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_owr_free[1:0] = woq_wr_error_mode ? 2'h0 : {drif_woq_free[1],|drif_woq_free[1:0]};


// 
assign {woq_owr_ent0[15:0], woq_owr_ent1[15:0]} = 
				{32{woq_owr_ptr[3:0] == 4'h0}} & {reg0[15:0],  reg1[15:0]} |
				{32{woq_owr_ptr[3:0] == 4'h1}} & {reg1[15:0],  reg2[15:0]} |
				{32{woq_owr_ptr[3:0] == 4'h2}} & {reg2[15:0],  reg3[15:0]} |
				{32{woq_owr_ptr[3:0] == 4'h3}} & {reg3[15:0],  reg4[15:0]} |
				{32{woq_owr_ptr[3:0] == 4'h4}} & {reg4[15:0],  reg5[15:0]} |
				{32{woq_owr_ptr[3:0] == 4'h5}} & {reg5[15:0],  reg6[15:0]} |
				{32{woq_owr_ptr[3:0] == 4'h6}} & {reg6[15:0],  reg7[15:0]} |
				{32{woq_owr_ptr[3:0] == 4'h7}} & {reg7[15:0],  reg8[15:0]} |
				{32{woq_owr_ptr[3:0] == 4'h8}} & {reg8[15:0],  reg9[15:0]} |
				{32{woq_owr_ptr[3:0] == 4'h9}} & {reg9[15:0],  reg10[15:0]} |
				{32{woq_owr_ptr[3:0] == 4'ha}} & {reg10[15:0], reg11[15:0]} |
				{32{woq_owr_ptr[3:0] == 4'hb}} & {reg11[15:0], reg12[15:0]} |
				{32{woq_owr_ptr[3:0] == 4'hc}} & {reg12[15:0], reg13[15:0]} |
				{32{woq_owr_ptr[3:0] == 4'hd}} & {reg13[15:0], reg14[15:0]} |
				{32{woq_owr_ptr[3:0] == 4'he}} & {reg14[15:0], reg15[15:0]} |
				{32{woq_owr_ptr[3:0] == 4'hf}} & {reg15[15:0], reg0[15:0]};

// Free write data queue entries in l2if's
assign woq_owr_ent0_wdq_dec[7:0] = {woq_owr_ent0[14:12] == 3'h7, woq_owr_ent0[14:12] == 3'h6, 
				    woq_owr_ent0[14:12] == 3'h5, woq_owr_ent0[14:12] == 3'h4, 
				    woq_owr_ent0[14:12] == 3'h3, woq_owr_ent0[14:12] == 3'h2, 
				    woq_owr_ent0[14:12] == 3'h1, woq_owr_ent0[14:12] == 3'h0};
assign woq_owr_ent1_wdq_dec[7:0] = {woq_owr_ent1[14:12] == 3'h7, woq_owr_ent1[14:12] == 3'h6, 
				    woq_owr_ent1[14:12] == 3'h5, woq_owr_ent1[14:12] == 3'h4, 
				    woq_owr_ent1[14:12] == 3'h3, woq_owr_ent1[14:12] == 3'h2, 
				    woq_owr_ent1[14:12] == 3'h1, woq_owr_ent1[14:12] == 3'h0};

assign woq0_wdq_free[7:0] = {8{~woq_owr_ent0[15] & woq_owr_free[0] & ~woq_wr_error_mode}} & woq_owr_ent0_wdq_dec[7:0] |
			    {8{~woq_owr_ent1[15] & woq_owr_free[1] & ~woq_wr_error_mode}} & woq_owr_ent1_wdq_dec[7:0] |
			    {8{~woq_err_xact[15] & fbdic_clear_wrq_ent & woq_err_st_wait_clear}} & woq_err_wdq_dec[7:0];
assign woq1_wdq_free[7:0] = {8{ woq_owr_ent0[15] & woq_owr_free[0] & ~woq_wr_error_mode}} & woq_owr_ent0_wdq_dec[7:0] |
				     {8{ woq_owr_ent1[15] & woq_owr_free[1] & ~woq_wr_error_mode}} & woq_owr_ent1_wdq_dec[7:0] |
				     {8{ woq_err_xact[15] & fbdic_clear_wrq_ent & woq_err_st_wait_clear}} & woq_err_wdq_dec[7:0];

mcu_woq_ctl_msff_ctl_macro ff_woq_free_d1 (
	.scan_in(ff_woq_free_d1_scanin),
	.scan_out(ff_woq_free_d1_scanout),
	.din(drif_woq_free[0]),
	.dout(drif_woq_free_d1[0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq0_wdq_free_accum_in[7:0] = woq0_wdq_free_accum[7:0] | woq0_wdq_free[7:0];
assign woq1_wdq_free_accum_in[7:0] = woq1_wdq_free_accum[7:0] | woq1_wdq_free[7:0];

assign woq_wrq_wdq_entry_clr = fbdic_clear_wrq_ent | fbdic_scr_frame_req_d4 | fbdic_chnl_reset_error_mode |
				~fbdic_l0_state;

mcu_woq_ctl_msff_ctl_macro__clr_1__width_16 ff_wdq_free_accum  (
	.scan_in(ff_wdq_free_accum_scanin),
	.scan_out(ff_wdq_free_accum_scanout),
	.din({woq0_wdq_free_accum_in[7:0],woq1_wdq_free_accum_in[7:0]}),
	.dout({woq0_wdq_free_accum[7:0],woq1_wdq_free_accum[7:0]}),
	.clr(woq_wrq_wdq_entry_clr),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq0_wdq_entry_free_in[7:0] = fbdic_clear_wrq_ent | fbdic_chnl_reset_error_mode ? 
								woq0_wdq_free_accum_in[7:0] : 8'h0;
assign woq1_wdq_entry_free_in[7:0] = fbdic_clear_wrq_ent | fbdic_chnl_reset_error_mode ? 
								woq1_wdq_free_accum_in[7:0] : 8'h0;

mcu_woq_ctl_msff_ctl_macro__width_16 ff_wdq_entry_free  (
	.scan_in(ff_wdq_entry_free_scanin),
	.scan_out(ff_wdq_entry_free_scanout),
	.din({woq0_wdq_entry_free_in[7:0],woq1_wdq_entry_free_in[7:0]}),
	.dout({woq0_wdq_entry_free[7:0],woq1_wdq_entry_free[7:0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// free write address queue entries in drq's
assign woq_owr_ent0_wrq_dec[7:0] = {woq_owr_ent0[11:9] == 3'h7, woq_owr_ent0[11:9] == 3'h6, 
				    woq_owr_ent0[11:9] == 3'h5, woq_owr_ent0[11:9] == 3'h4, 
				    woq_owr_ent0[11:9] == 3'h3, woq_owr_ent0[11:9] == 3'h2, 
				    woq_owr_ent0[11:9] == 3'h1, woq_owr_ent0[11:9] == 3'h0};
assign woq_owr_ent1_wrq_dec[7:0] = {woq_owr_ent1[11:9] == 3'h7, woq_owr_ent1[11:9] == 3'h6, 
				    woq_owr_ent1[11:9] == 3'h5, woq_owr_ent1[11:9] == 3'h4, 
				    woq_owr_ent1[11:9] == 3'h3, woq_owr_ent1[11:9] == 3'h2, 
				    woq_owr_ent1[11:9] == 3'h1, woq_owr_ent1[11:9] == 3'h0};

assign woq0_wrq_clear[7:0] = {8{~woq_owr_ent0[15] & woq_owr_free[0] & ~woq_wr_error_mode}} & woq_owr_ent0_wrq_dec[7:0] |
			     {8{~woq_owr_ent1[15] & woq_owr_free[1] & ~woq_wr_error_mode}} & woq_owr_ent1_wrq_dec[7:0] |
			     {8{~woq_err_xact[15] & fbdic_clear_wrq_ent & woq_err_st_wait_clear}} & woq_err_wrq_dec[7:0];
assign woq1_wrq_clear[7:0] = {8{ woq_owr_ent0[15] & woq_owr_free[0] & ~woq_wr_error_mode}} & woq_owr_ent0_wrq_dec[7:0] |
			     {8{ woq_owr_ent1[15] & woq_owr_free[1] & ~woq_wr_error_mode}} & woq_owr_ent1_wrq_dec[7:0] |
			     {8{ woq_err_xact[15] & fbdic_clear_wrq_ent & woq_err_st_wait_clear}} & woq_err_wrq_dec[7:0];

assign woq0_wrq_clear_accum_in[7:0] = woq0_wrq_clear_accum[7:0] | woq0_wrq_clear[7:0];
assign woq1_wrq_clear_accum_in[7:0] = woq1_wrq_clear_accum[7:0] | woq1_wrq_clear[7:0];

mcu_woq_ctl_msff_ctl_macro__clr_1__width_16 ff_wrq_clear_accum  (
	.scan_in(ff_wrq_clear_accum_scanin),
	.scan_out(ff_wrq_clear_accum_scanout),
	.din({woq0_wrq_clear_accum_in[7:0],woq1_wrq_clear_accum_in[7:0]}),
	.dout({woq0_wrq_clear_accum[7:0],woq1_wrq_clear_accum[7:0]}),
	.clr(woq_wrq_wdq_entry_clr),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq0_wrq_clear_ent[7:0] = fbdic_clear_wrq_ent | fbdic_chnl_reset_error_mode ? 
							woq0_wrq_clear_accum_in[7:0] : 8'h0;
assign woq1_wrq_clear_ent[7:0] = fbdic_clear_wrq_ent | fbdic_chnl_reset_error_mode ? 
							woq1_wrq_clear_accum_in[7:0] : 8'h0;

// Decrement signals for power down mode counters
assign woq_entry0_pd_mode_decr[15:0] =   {woq_entry0[6:3] == 4'hf, woq_entry0[6:3] == 4'he,
					  woq_entry0[6:3] == 4'hd, woq_entry0[6:3] == 4'hc,
					  woq_entry0[6:3] == 4'hb, woq_entry0[6:3] == 4'ha,
					  woq_entry0[6:3] == 4'h9, woq_entry0[6:3] == 4'h8,
					  woq_entry0[6:3] == 4'h7, woq_entry0[6:3] == 4'h6,
					  woq_entry0[6:3] == 4'h5, woq_entry0[6:3] == 4'h4,
					  woq_entry0[6:3] == 4'h3, woq_entry0[6:3] == 4'h2,
					  woq_entry0[6:3] == 4'h1, woq_entry0[6:3] == 4'h0};
assign woq_entry1_pd_mode_decr[15:0] =   {woq_entry1[6:3] == 4'hf, woq_entry1[6:3] == 4'he,
					  woq_entry1[6:3] == 4'hd, woq_entry1[6:3] == 4'hc,
					  woq_entry1[6:3] == 4'hb, woq_entry1[6:3] == 4'ha,
					  woq_entry1[6:3] == 4'h9, woq_entry1[6:3] == 4'h8,
					  woq_entry1[6:3] == 4'h7, woq_entry1[6:3] == 4'h6,
					  woq_entry1[6:3] == 4'h5, woq_entry1[6:3] == 4'h4,
					  woq_entry1[6:3] == 4'h3, woq_entry1[6:3] == 4'h2,
					  woq_entry1[6:3] == 4'h1, woq_entry1[6:3] == 4'h0};
assign woq_pd_mode_wr_decr_in[15:0] = {16{drif_wr_entry_picked[0] & ~woq_wr_error_mode}} & woq_entry0_pd_mode_decr[15:0] |
				      {16{drif_wr_entry_picked[1]}} & woq_entry0_pd_mode_decr[15:0] |
				      {16{drif_wr_entry_picked[2]}} & woq_entry1_pd_mode_decr[15:0];

mcu_woq_ctl_msff_ctl_macro__width_16 ff_pd_mode_wr_decr  (
	.scan_in(ff_pd_mode_wr_decr_scanin),
	.scan_out(ff_pd_mode_wr_decr_scanout),
	.din(woq_pd_mode_wr_decr_in[15:0]),
	.dout(woq_pd_mode_wr_decr[15:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// set error mode to resend writes after channel error
assign woq_wr_error_mode_in = fbdic_scr_frame_req_d4 ? 1'b1 : woq_err_fifo_empty ? 1'b0 : woq_wr_error_mode;

mcu_woq_ctl_msff_ctl_macro ff_wr_error_mode (
	.scan_in(ff_wr_error_mode_scanin),
	.scan_out(ff_wr_error_mode_scanout),
	.din(woq_wr_error_mode_in),
	.dout(woq_wr_error_mode),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Error request pointer - points to first write transaction whose completion hasn't been verified.
// If an southbound channel error occurs, start reissuing writes here
assign woq_error_ptr_in[4:0] = fbdic_clear_wrq_ent & ~woq_wr_error_mode ? woq_owr_ptr[4:0] : 
				woq_err_st_wait_clear & fbdic_clear_wrq_ent ? woq_error_ptr[4:0] + 5'h1 : woq_error_ptr[4:0];
mcu_woq_ctl_msff_ctl_macro__width_5 ff_error_ptr  (
	.scan_in(ff_error_ptr_scanin),
	.scan_out(ff_error_ptr_scanout),
	.din(woq_error_ptr_in[4:0]),
	.dout(woq_error_ptr[4:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_err_xact[15:0] = {16{woq_error_ptr[3:0] == 4'h0}} & reg0[15:0] | 
				 {16{woq_error_ptr[3:0] == 4'h1}} & reg1[15:0] | 
				 {16{woq_error_ptr[3:0] == 4'h2}} & reg2[15:0] | 
				 {16{woq_error_ptr[3:0] == 4'h3}} & reg3[15:0] | 
				 {16{woq_error_ptr[3:0] == 4'h4}} & reg4[15:0] | 
				 {16{woq_error_ptr[3:0] == 4'h5}} & reg5[15:0] | 
				 {16{woq_error_ptr[3:0] == 4'h6}} & reg6[15:0] | 
				 {16{woq_error_ptr[3:0] == 4'h7}} & reg7[15:0] | 
				 {16{woq_error_ptr[3:0] == 4'h8}} & reg8[15:0] | 
				 {16{woq_error_ptr[3:0] == 4'h9}} & reg9[15:0] | 
				 {16{woq_error_ptr[3:0] == 4'ha}} & reg10[15:0] | 
				 {16{woq_error_ptr[3:0] == 4'hb}} & reg11[15:0] | 
				 {16{woq_error_ptr[3:0] == 4'hc}} & reg12[15:0] | 
				 {16{woq_error_ptr[3:0] == 4'hd}} & reg13[15:0] | 
				 {16{woq_error_ptr[3:0] == 4'he}} & reg14[15:0] | 
				 {16{woq_error_ptr[3:0] == 4'hf}} & reg15[15:0];

assign woq_err_fifo_empty = woq_error_ptr[4:0] == waddr[4:0];

assign woq_err_wdq_dec[7:0] = { woq_err_xact[14:12] == 3'h7, woq_err_xact[14:12] == 3'h6, 
				woq_err_xact[14:12] == 3'h5, woq_err_xact[14:12] == 3'h4, 
				woq_err_xact[14:12] == 3'h3, woq_err_xact[14:12] == 3'h2, 
				woq_err_xact[14:12] == 3'h1, woq_err_xact[14:12] == 3'h0};

assign woq_err_wrq_dec[7:0] = { woq_err_xact[11:9] == 3'h7, woq_err_xact[11:9] == 3'h6, 
				woq_err_xact[11:9] == 3'h5, woq_err_xact[11:9] == 3'h4, 
				woq_err_xact[11:9] == 3'h3, woq_err_xact[11:9] == 3'h2, 
				woq_err_xact[11:9] == 3'h1, woq_err_xact[11:9] == 3'h0};

// 0in one_hot -var woq_wr_err_state[3:0]
assign woq_wr_err_state[3:0] = {woq_err_st_wait_clear,woq_err_st_wait_free,woq_err_st_wr_req,woq_err_st_data};

assign inv_woq_err_st_data_next = ~woq_err_st_data_next;
assign woq_err_st_data = ~inv_woq_err_st_data;
mcu_woq_ctl_msff_ctl_macro__width_4 ff_wr_err_state  (
	.scan_in(ff_wr_err_state_scanin),
	.scan_out(ff_wr_err_state_scanout),
	.din({inv_woq_err_st_data_next, woq_err_st_wr_req_in, woq_err_st_wait_free_next, woq_err_st_wait_clear_in}),
	.dout({inv_woq_err_st_data, woq_err_st_wr_req, woq_err_st_wait_free, woq_err_st_wait_clear}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_wr_retry_error = woq_err_st_wr_req & ~drif_wr_entry_picked[0] &
				(fbdic_scr_frame_req_d4 | ~fbdic_l0_state);

assign woq_err_st_data_next = woq_err_st_data_in | woq_wr_retry_error;
assign woq_err_st_wait_free_next = woq_err_st_wait_free_in & ~woq_wr_retry_error;

always @(woq_wr_error_mode or woq_last_wr_data or drif_wr_entry_picked or drif_woq_free or
	 woq_err_st_data or woq_err_st_wr_req or woq_err_st_wait_free or woq_err_st_wait_clear or
	fbdic_clear_wrq_ent or fbdic_error_mode or fbdic_scr_frame_req_d4 or fbdic_l0_state) 
begin
	woq_err_st_data_in = 1'b0;
	woq_err_st_wr_req_in = 1'b0;
	woq_err_st_wait_free_in = 1'b0;
	woq_err_st_wait_clear_in = 1'b0;

	case (1'b1)
	woq_err_st_data: begin
		if (woq_wr_error_mode & woq_last_wr_data)
			woq_err_st_wr_req_in = 1'b1;
		else
			woq_err_st_data_in = 1'b1;
	end

	woq_err_st_wr_req: begin
		if (drif_wr_entry_picked[0] | fbdic_scr_frame_req_d4 | ~fbdic_l0_state)
			woq_err_st_wait_free_in = 1'b1;
		else
			woq_err_st_wr_req_in = 1'b1;
	end
	
	woq_err_st_wait_free: begin
		if (drif_woq_free[0])
			woq_err_st_wait_clear_in = 1'b1;
		else
			woq_err_st_wait_free_in = 1'b1;
	end
	
	woq_err_st_wait_clear: begin
		if (fbdic_clear_wrq_ent | fbdic_error_mode)
			woq_err_st_data_in = 1'b1;
		else
			woq_err_st_wait_clear_in = 1'b1;
	end
	
	default: ;
	endcase
end

assign woq_err_pdm_wr[15:0] = {woq_err_xact[6:3] == 4'hf, woq_err_xact[6:3] == 4'he,
			       woq_err_xact[6:3] == 4'hd, woq_err_xact[6:3] == 4'hc,
			       woq_err_xact[6:3] == 4'hb, woq_err_xact[6:3] == 4'ha,
			       woq_err_xact[6:3] == 4'h9, woq_err_xact[6:3] == 4'h8,
			       woq_err_xact[6:3] == 4'h7, woq_err_xact[6:3] == 4'h6,
			       woq_err_xact[6:3] == 4'h5, woq_err_xact[6:3] == 4'h4,
			       woq_err_xact[6:3] == 4'h3, woq_err_xact[6:3] == 4'h2,
			       woq_err_xact[6:3] == 4'h1, woq_err_xact[6:3] == 4'h0};

assign woq_err_pdm_wr_incr[15:0] = {16{woq_err_st_data & woq_last_wr_data & woq_wr_error_mode}} & woq_err_pdm_wr[15:0];
assign woq_err_pdm_wr_decr[15:0] = {16{woq_err_st_wr_req & 
					(drif_wr_entry_picked[0] | fbdic_scr_frame_req_d4 | ~fbdic_l0_state)}} & 
						woq_err_pdm_wr[15:0];

// Counters for outstanding write data to each dimm, limit to 7 for dual-channel mode
//	and 3 for single-channel mode
assign woq_dimm0_wrcnt_incr = woq_wr_addr_enq & woq_wr_queue_reg[5:3] == 3'h0;
assign woq_dimm0_wrcnt_decr = (|drif_wr_entry_picked[1:0]) & woq_entry0[5:3] == 3'h0 | 
					drif_wr_entry_picked[2] & woq_entry1[5:3] == 3'h0;
assign woq_dimm0_wrcnt_in[2:0] = woq_dimm0_wrcnt_incr & ~woq_dimm0_wrcnt_decr ? woq_dimm0_wrcnt[2:0] + 3'h1 :
					~woq_dimm0_wrcnt_incr & woq_dimm0_wrcnt_decr ? woq_dimm0_wrcnt[2:0] - 3'h1 : 
					woq_dimm0_wrcnt[2:0];

// 0in overflow -var woq_dimm0_wrcnt[2:0] -active ~woq_wr_error_mode
// 0in underflow -var woq_dimm0_wrcnt[2:0] -active ~woq_wr_error_mode
mcu_woq_ctl_msff_ctl_macro__clr_1__width_3 ff_dimm0_wrcnt  (
	.scan_in(ff_dimm0_wrcnt_scanin),
	.scan_out(ff_dimm0_wrcnt_scanout),
	.din(woq_dimm0_wrcnt_in[2:0]),
	.dout(woq_dimm0_wrcnt[2:0]),
	.clr(woq_wr_error_mode),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_dimm0_stall = drif_single_channel_mode ? &woq_dimm0_wrcnt[1:0] : &woq_dimm0_wrcnt[2:0];

//
assign woq_dimm1_wrcnt_incr = woq_wr_addr_enq & woq_wr_queue_reg[5:3] == 3'h1;
assign woq_dimm1_wrcnt_decr = (|drif_wr_entry_picked[1:0]) & woq_entry0[5:3] == 3'h1 | 
					drif_wr_entry_picked[2] & woq_entry1[5:3] == 3'h1;
assign woq_dimm1_wrcnt_in[2:0] = woq_dimm1_wrcnt_incr & ~woq_dimm1_wrcnt_decr ? woq_dimm1_wrcnt[2:0] + 3'h1 :
					~woq_dimm1_wrcnt_incr & woq_dimm1_wrcnt_decr ? woq_dimm1_wrcnt[2:0] - 3'h1 : 
					woq_dimm1_wrcnt[2:0];

// 0in overflow -var woq_dimm1_wrcnt[2:0] -active ~woq_wr_error_mode
// 0in underflow -var woq_dimm1_wrcnt[2:0] -active ~woq_wr_error_mode
mcu_woq_ctl_msff_ctl_macro__clr_1__width_3 ff_dimm1_wrcnt  (
	.scan_in(ff_dimm1_wrcnt_scanin),
	.scan_out(ff_dimm1_wrcnt_scanout),
	.din(woq_dimm1_wrcnt_in[2:0]),
	.dout(woq_dimm1_wrcnt[2:0]),
	.clr(woq_wr_error_mode),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_dimm1_stall = drif_single_channel_mode ? &woq_dimm1_wrcnt[1:0] : &woq_dimm1_wrcnt[2:0];
		  		 
//
assign woq_dimm2_wrcnt_incr = woq_wr_addr_enq & woq_wr_queue_reg[5:3] == 3'h2;
assign woq_dimm2_wrcnt_decr = (|drif_wr_entry_picked[1:0]) & woq_entry0[5:3] == 3'h2 | 
					drif_wr_entry_picked[2] & woq_entry1[5:3] == 3'h2;
assign woq_dimm2_wrcnt_in[2:0] = woq_dimm2_wrcnt_incr & ~woq_dimm2_wrcnt_decr ? woq_dimm2_wrcnt[2:0] + 3'h1 :
					~woq_dimm2_wrcnt_incr & woq_dimm2_wrcnt_decr ? woq_dimm2_wrcnt[2:0] - 3'h1 : 
					woq_dimm2_wrcnt[2:0];

// 0in overflow -var woq_dimm2_wrcnt[2:0] -active ~woq_wr_error_mode
// 0in underflow -var woq_dimm2_wrcnt[2:0] -active ~woq_wr_error_mode
mcu_woq_ctl_msff_ctl_macro__clr_1__width_3 ff_dimm2_wrcnt  (
	.scan_in(ff_dimm2_wrcnt_scanin),
	.scan_out(ff_dimm2_wrcnt_scanout),
	.din(woq_dimm2_wrcnt_in[2:0]),
	.dout(woq_dimm2_wrcnt[2:0]),
	.clr(woq_wr_error_mode),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_dimm2_stall = drif_single_channel_mode ? &woq_dimm2_wrcnt[1:0] : &woq_dimm2_wrcnt[2:0];
				 
//
assign woq_dimm3_wrcnt_incr = woq_wr_addr_enq & woq_wr_queue_reg[5:3] == 3'h3;
assign woq_dimm3_wrcnt_decr = (|drif_wr_entry_picked[1:0]) & woq_entry0[5:3] == 3'h3 | 
					drif_wr_entry_picked[2] & woq_entry1[5:3] == 3'h3;
assign woq_dimm3_wrcnt_in[2:0] = woq_dimm3_wrcnt_incr & ~woq_dimm3_wrcnt_decr ? woq_dimm3_wrcnt[2:0] + 3'h1 :
					~woq_dimm3_wrcnt_incr & woq_dimm3_wrcnt_decr ? woq_dimm3_wrcnt[2:0] - 3'h1 : 
					woq_dimm3_wrcnt[2:0];

// 0in overflow -var woq_dimm3_wrcnt[2:0] -active ~woq_wr_error_mode
// 0in underflow -var woq_dimm3_wrcnt[2:0] -active ~woq_wr_error_mode
mcu_woq_ctl_msff_ctl_macro__clr_1__width_3 ff_dimm3_wrcnt  (
	.scan_in(ff_dimm3_wrcnt_scanin),
	.scan_out(ff_dimm3_wrcnt_scanout),
	.din(woq_dimm3_wrcnt_in[2:0]),
	.dout(woq_dimm3_wrcnt[2:0]),
	.clr(woq_wr_error_mode),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_dimm3_stall = drif_single_channel_mode ? &woq_dimm3_wrcnt[1:0] : &woq_dimm3_wrcnt[2:0];
				 
//
assign woq_dimm4_wrcnt_incr = woq_wr_addr_enq & woq_wr_queue_reg[5:3] == 3'h4;
assign woq_dimm4_wrcnt_decr = (|drif_wr_entry_picked[1:0]) & woq_entry0[5:3] == 3'h4 | 
					drif_wr_entry_picked[2] & woq_entry1[5:3] == 3'h4;
assign woq_dimm4_wrcnt_in[2:0] = woq_dimm4_wrcnt_incr & ~woq_dimm4_wrcnt_decr ? woq_dimm4_wrcnt[2:0] + 3'h1 :
					~woq_dimm4_wrcnt_incr & woq_dimm4_wrcnt_decr ? woq_dimm4_wrcnt[2:0] - 3'h1 : 
					woq_dimm4_wrcnt[2:0];

// 0in overflow -var woq_dimm4_wrcnt[2:0] -active ~woq_wr_error_mode
// 0in underflow -var woq_dimm4_wrcnt[2:0] -active ~woq_wr_error_mode
mcu_woq_ctl_msff_ctl_macro__clr_1__width_3 ff_dimm4_wrcnt  (
	.scan_in(ff_dimm4_wrcnt_scanin),
	.scan_out(ff_dimm4_wrcnt_scanout),
	.din(woq_dimm4_wrcnt_in[2:0]),
	.dout(woq_dimm4_wrcnt[2:0]),
	.clr(woq_wr_error_mode),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_dimm4_stall = drif_single_channel_mode ? &woq_dimm4_wrcnt[1:0] : &woq_dimm4_wrcnt[2:0];
				 
//
assign woq_dimm5_wrcnt_incr = woq_wr_addr_enq & woq_wr_queue_reg[5:3] == 3'h5;
assign woq_dimm5_wrcnt_decr = (|drif_wr_entry_picked[1:0]) & woq_entry0[5:3] == 3'h5 | 
					drif_wr_entry_picked[2] & woq_entry1[5:3] == 3'h5;
assign woq_dimm5_wrcnt_in[2:0] = woq_dimm5_wrcnt_incr & ~woq_dimm5_wrcnt_decr ? woq_dimm5_wrcnt[2:0] + 3'h1 :
					~woq_dimm5_wrcnt_incr & woq_dimm5_wrcnt_decr ? woq_dimm5_wrcnt[2:0] - 3'h1 : 
					woq_dimm5_wrcnt[2:0];

// 0in overflow -var woq_dimm5_wrcnt[2:0] -active ~woq_wr_error_mode
// 0in underflow -var woq_dimm5_wrcnt[2:0] -active ~woq_wr_error_mode
mcu_woq_ctl_msff_ctl_macro__clr_1__width_3 ff_dimm5_wrcnt  (
	.scan_in(ff_dimm5_wrcnt_scanin),
	.scan_out(ff_dimm5_wrcnt_scanout),
	.din(woq_dimm5_wrcnt_in[2:0]),
	.dout(woq_dimm5_wrcnt[2:0]),
	.clr(woq_wr_error_mode),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_dimm5_stall = drif_single_channel_mode ? &woq_dimm5_wrcnt[1:0] : &woq_dimm5_wrcnt[2:0];
				 
//
assign woq_dimm6_wrcnt_incr = woq_wr_addr_enq & woq_wr_queue_reg[5:3] == 3'h6;
assign woq_dimm6_wrcnt_decr = (|drif_wr_entry_picked[1:0]) & woq_entry0[5:3] == 3'h6 | 
					drif_wr_entry_picked[2] & woq_entry1[5:3] == 3'h6;
assign woq_dimm6_wrcnt_in[2:0] = woq_dimm6_wrcnt_incr & ~woq_dimm6_wrcnt_decr ? woq_dimm6_wrcnt[2:0] + 3'h1 :
					~woq_dimm6_wrcnt_incr & woq_dimm6_wrcnt_decr ? woq_dimm6_wrcnt[2:0] - 3'h1 : 
					woq_dimm6_wrcnt[2:0];

// 0in overflow -var woq_dimm6_wrcnt[2:0] -active ~woq_wr_error_mode
// 0in underflow -var woq_dimm6_wrcnt[2:0] -active ~woq_wr_error_mode
mcu_woq_ctl_msff_ctl_macro__clr_1__width_3 ff_dimm6_wrcnt  (
	.scan_in(ff_dimm6_wrcnt_scanin),
	.scan_out(ff_dimm6_wrcnt_scanout),
	.din(woq_dimm6_wrcnt_in[2:0]),
	.dout(woq_dimm6_wrcnt[2:0]),
	.clr(woq_wr_error_mode),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_dimm6_stall = drif_single_channel_mode ? &woq_dimm6_wrcnt[1:0] : &woq_dimm6_wrcnt[2:0];
				 
//
assign woq_dimm7_wrcnt_incr = woq_wr_addr_enq & woq_wr_queue_reg[5:3] == 3'h7;
assign woq_dimm7_wrcnt_decr = (|drif_wr_entry_picked[1:0]) & woq_entry0[5:3] == 3'h7 | 
					drif_wr_entry_picked[2] & woq_entry1[5:3] == 3'h7;
assign woq_dimm7_wrcnt_in[2:0] = woq_dimm7_wrcnt_incr & ~woq_dimm7_wrcnt_decr ? woq_dimm7_wrcnt[2:0] + 3'h1 :
					~woq_dimm7_wrcnt_incr & woq_dimm7_wrcnt_decr ? woq_dimm7_wrcnt[2:0] - 3'h1 : 
					woq_dimm7_wrcnt[2:0];

// 0in overflow -var woq_dimm7_wrcnt[2:0] -active ~woq_wr_error_mode
// 0in underflow -var woq_dimm7_wrcnt[2:0] -active ~woq_wr_error_mode
mcu_woq_ctl_msff_ctl_macro__clr_1__width_3 ff_dimm7_wrcnt  (
	.scan_in(ff_dimm7_wrcnt_scanin),
	.scan_out(ff_dimm7_wrcnt_scanout),
	.din(woq_dimm7_wrcnt_in[2:0]),
	.dout(woq_dimm7_wrcnt[2:0]),
	.clr(woq_wr_error_mode),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign woq_dimm7_stall = drif_single_channel_mode ? &woq_dimm7_wrcnt[1:0] : &woq_dimm7_wrcnt[2:0];

// rank available
assign woq_rank_avail[15:0] = pdmc_rank_avail[15:0] & {drif_dimm_wr_available[7:0],drif_dimm_wr_available[7:0]};
				 
// fixscan start:
assign ff_priority_scanin        = scan_in                  ;
assign ff_io_wdata_sel_scanin    = ff_priority_scanout      ;
assign ff_wdata_cnt_scanin       = ff_io_wdata_sel_scanout  ;
assign ff_wdata_l2bank_scanin    = ff_wdata_cnt_scanout     ;
assign ff_waddr_scanin           = ff_wdata_l2bank_scanout  ;
assign ff_raddr_scanin           = ff_waddr_scanout         ;
assign ff_reg0_scanin            = ff_raddr_scanout         ;
assign ff_reg1_scanin            = ff_reg0_scanout          ;
assign ff_reg2_scanin            = ff_reg1_scanout          ;
assign ff_reg3_scanin            = ff_reg2_scanout          ;
assign ff_reg4_scanin            = ff_reg3_scanout          ;
assign ff_reg5_scanin            = ff_reg4_scanout          ;
assign ff_reg6_scanin            = ff_reg5_scanout          ;
assign ff_reg7_scanin            = ff_reg6_scanout          ;
assign ff_reg8_scanin            = ff_reg7_scanout          ;
assign ff_reg9_scanin            = ff_reg8_scanout          ;
assign ff_reg10_scanin           = ff_reg9_scanout          ;
assign ff_reg11_scanin           = ff_reg10_scanout         ;
assign ff_reg12_scanin           = ff_reg11_scanout         ;
assign ff_reg13_scanin           = ff_reg12_scanout         ;
assign ff_reg14_scanin           = ff_reg13_scanout         ;
assign ff_reg15_scanin           = ff_reg14_scanout         ;
assign ff_owr_ptr_scanin         = ff_reg15_scanout         ;
assign ff_wr_req_out_scanin      = ff_owr_ptr_scanout       ;
assign ff_woq_free_d1_scanin     = ff_wr_req_out_scanout    ;
assign ff_wdq_free_accum_scanin  = ff_woq_free_d1_scanout   ;
assign ff_wdq_entry_free_scanin  = ff_wdq_free_accum_scanout;
assign ff_wrq_clear_accum_scanin = ff_wdq_entry_free_scanout;
assign ff_pd_mode_wr_decr_scanin = ff_wrq_clear_accum_scanout;
assign ff_wr_error_mode_scanin   = ff_pd_mode_wr_decr_scanout;
assign ff_error_ptr_scanin       = ff_wr_error_mode_scanout ;
assign ff_wr_err_state_scanin    = ff_error_ptr_scanout     ;
assign ff_dimm0_wrcnt_scanin     = ff_wr_err_state_scanout  ;
assign ff_dimm1_wrcnt_scanin     = ff_dimm0_wrcnt_scanout   ;
assign ff_dimm2_wrcnt_scanin     = ff_dimm1_wrcnt_scanout   ;
assign ff_dimm3_wrcnt_scanin     = ff_dimm2_wrcnt_scanout   ;
assign ff_dimm4_wrcnt_scanin     = ff_dimm3_wrcnt_scanout   ;
assign ff_dimm5_wrcnt_scanin     = ff_dimm4_wrcnt_scanout   ;
assign ff_dimm6_wrcnt_scanin     = ff_dimm5_wrcnt_scanout   ;
assign ff_dimm7_wrcnt_scanin     = ff_dimm6_wrcnt_scanout   ;
assign scan_out                  = ff_dimm7_wrcnt_scanout   ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module mcu_woq_ctl_msff_ctl_macro__en_1 (
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

module mcu_woq_ctl_msff_ctl_macro__width_4 (
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

module mcu_woq_ctl_msff_ctl_macro__en_1__width_3 (
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

module mcu_woq_ctl_msff_ctl_macro__width_5 (
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

module mcu_woq_ctl_msff_ctl_macro__en_1__width_16 (
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

module mcu_woq_ctl_msff_ctl_macro__width_2 (
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

module mcu_woq_ctl_msff_ctl_macro (
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

module mcu_woq_ctl_msff_ctl_macro__clr_1__width_16 (
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

module mcu_woq_ctl_msff_ctl_macro__width_16 (
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

module mcu_woq_ctl_msff_ctl_macro__clr_1__width_3 (
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








