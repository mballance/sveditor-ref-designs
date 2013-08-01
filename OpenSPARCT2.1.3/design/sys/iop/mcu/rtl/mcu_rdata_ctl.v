// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_rdata_ctl.v
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
module mcu_rdata_ctl (
  mcu_ucb_rd_request_out, 
  mcu_ucb_wr_req_out, 
  mcu_ucb_mecc_err, 
  mcu_ucb_secc_err, 
  mcu_ucb_fbd_err, 
  mcu_ucb_err_mode, 
  mcu_ucb_err_event, 
  ccu_mcu_cmp_io_sync_en, 
  mcu_l2t0_qword_id_r0, 
  mcu_l2t0_data_vld_r0, 
  mcu_l2t0_rd_req_id_r0, 
  mcu_l2t0_mecc_err_r3, 
  mcu_l2t0_secc_err_r3, 
  mcu_l2t0_scb_mecc_err, 
  mcu_l2t0_scb_secc_err, 
  mcu_l2t1_qword_id_r0, 
  mcu_l2t1_data_vld_r0, 
  mcu_l2t1_rd_req_id_r0, 
  mcu_l2t1_mecc_err_r3, 
  mcu_l2t1_secc_err_r3, 
  mcu_l2t1_scb_mecc_err, 
  mcu_l2t1_scb_secc_err, 
  rdata_drif_rd_req_vld, 
  rdata_drif_wr_req_vld, 
  rdata_drif_addr, 
  rdata_drif_data, 
  rdata_mcu_selfrsh, 
  rdata_err_ecci, 
  rdata_err_fbri, 
  rdata_err_fbui, 
  mcu_ucb_ack_vld, 
  mcu_ucb_nack_vld, 
  mcu_ucb_data, 
  rdata_err_intr, 
  rdata_err_fbr, 
  rdata_cmp_ddr_sync_en, 
  rdata_ddr_cmp_sync_en, 
  rdata_rddata_sel, 
  rdata_pa_err, 
  rdata_pm_1mcu, 
  rdata_pm_2mcu, 
  mbist_read_data, 
  rdata0_wdq_rd, 
  rdata1_wdq_rd, 
  rdata_wdq_radr, 
  mbist_run_d1, 
  mbist_run_d1_l, 
  mbist_sel_hiorlo_72bits_d1, 
  mbist_sel_bank0or1_d1, 
  rdata_serdes_dtm, 
  ccu_mcu_cmp_ddr_sync_en, 
  ccu_mcu_ddr_cmp_sync_en, 
  ccu_mcu_io_cmp_sync_en, 
  ucb_rdata_selfrsh, 
  ucb_mcu_rd_req_vld, 
  ucb_mcu_wr_req_vld, 
  ucb_mcu_addr, 
  ucb_mcu_data, 
  ucb_err_ecci, 
  ucb_err_fbri, 
  ucb_err_fbui, 
  drif_rdata_ack_vld, 
  drif_rdata_nack_vld, 
  drif_rdata_data, 
  fbdic_err_fbr, 
  rdpctl_l2t0_data_valid, 
  rdpctl_l2t1_data_valid, 
  rdpctl_qword_id, 
  rdpctl_rd_req_id, 
  rdpctl_pa_err, 
  rdpctl_scrb0_err_valid, 
  rdpctl_scrb1_err_valid, 
  rdpctl_fbd0_recov_err, 
  rdpctl_fbd1_recov_err, 
  rdpctl_fbd_unrecov_err, 
  rdpctl_secc_cnt_intr, 
  rdpctl_dbg_trig_enable, 
  fbdic_fbd_error, 
  drif_mcu_error_mode, 
  woq_wr_req_out, 
  ucb_pm, 
  ucb_pm_ba01, 
  ucb_pm_ba23, 
  ucb_pm_ba45, 
  ucb_pm_ba67, 
  readdp_l2_secc_err_dly1, 
  readdp_l2_mecc_err_dly1, 
  mbist_run, 
  mbist_addr, 
  mbist_sel_bank0or1, 
  mbist_sel_hiorlo_72bits, 
  mbist_wdqrf00_rd_en, 
  mbist_wdqrf01_rd_en, 
  mbist_wdqrf10_rd_en, 
  mbist_wdqrf11_rd_en, 
  drif0_wdq_rd, 
  drif1_wdq_rd, 
  drif_wdq_radr, 
  wdqrf00_data, 
  wdqrf01_data, 
  wdqrf10_data, 
  wdqrf11_data, 
  fbdic_srds_dtm_muxsel, 
  array_wr_inhibit, 
  cmp_array_wr_inhibit, 
  dr_array_wr_inhibit, 
  l2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en);
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire ff_mcu_sync_pulses_scanin;
wire ff_mcu_sync_pulses_scanout;
wire ff_io_sync_pulses_scanin;
wire ff_io_sync_pulses_scanout;
wire rdata_io_cmp_sync_en;
wire rdata_cmp_io_sync_en;
wire ff_mcu_sync_pulse_delays_scanin;
wire ff_mcu_sync_pulse_delays_scanout;
wire rdata_ddr_cmp_sync_en_d1;
wire rdata_ddr_cmp_sync_en_d2;
wire rdata_ddr_cmp_sync_en_d3;
wire rdata_io_cmp_sync_en_d1;
wire [1:0] rdata_data_word_cnt_in;
wire [1:0] rdata_data_word_cnt;
wire ff_data_word_cnt_scanin;
wire ff_data_word_cnt_scanout;
wire mcu_ucb_data_vld;
wire [4:0] mcu_ucb_rd_request_out_d1_in;
wire [4:0] mcu_ucb_rd_request_out_d1;
wire [2:0] rdata_rd_req_id;
wire ff_ucb_rdata_rd_req_id_scanin;
wire ff_ucb_rdata_rd_req_id_scanout;
wire ff_ucb_rdata_rd_req_id_d1_scanin;
wire ff_ucb_rdata_rd_req_id_d1_scanout;
wire mcu_ucb_any_mecc_err;
wire mcu_ucb_mecc_err_o;
wire mcu_ucb_mecc_err_d1;
wire ff_ucb_mecc_err_o_scanin;
wire ff_ucb_mecc_err_o_scanout;
wire ff_ucb_mecc_err_d1_scanin;
wire ff_ucb_mecc_err_d1_scanout;
wire mcu_ucb_any_secc_err;
wire mcu_ucb_secc_err_o;
wire mcu_ucb_secc_err_d1;
wire ff_ucb_secc_err_o_scanin;
wire ff_ucb_secc_err_o_scanout;
wire ff_ucb_secc_err_d1_scanin;
wire ff_ucb_secc_err_d1_scanout;
wire mcu_ucb_l1clk_err_event;
wire rdata_dbg_trig_enable;
wire mcu_ucb_err_event_o;
wire mcu_ucb_err_event_d1;
wire ff_ucb_err_event_d1_scanin;
wire ff_ucb_err_event_d1_scanout;
wire ff_ucb_err_event_scanin;
wire ff_ucb_err_event_scanout;
wire mcu_ucb_l1clk_fbd_error_o;
wire rdata_fbd_error;
wire mcu_ucb_fbd_error_d1;
wire ff_ucb_fbd_error_d1_scanin;
wire ff_ucb_fbd_error_d1_scanout;
wire ff_ucb_fbd_error_scanin;
wire ff_ucb_fbd_error_scanout;
wire ff_mcu_ucb_err_mode_scanin;
wire ff_mcu_ucb_err_mode_scanout;
wire rdata_mcu_error_mode;
wire rdata_wr_req_out_cnt_incr;
wire [1:0] rdata_wr_req_out;
wire [1:0] rdata_wr_req_out_cnt;
wire rdata_wr_req_out_cnt_decr;
wire [1:0] rdata_wr_req_out_cnt_in;
wire ff_wr_req_out_cnt_scanin;
wire ff_wr_req_out_cnt_scanout;
wire [1:1] mcu_ucb_l1clk_wr_req_out_o;
wire [1:0] mcu_ucb_wr_req_out_d1;
wire ff_ucb_wr_req_out1_d1_scanin;
wire ff_ucb_wr_req_out1_d1_scanout;
wire ff_ucb_wr_req_out1_scanin;
wire ff_ucb_wr_req_out1_scanout;
wire ff_ucb_wr_req_out0_scanin;
wire ff_ucb_wr_req_out0_scanout;
wire ff_ucb_test_signals_scanin;
wire ff_ucb_test_signals_scanout;
wire rdata_selfrsh;
wire ucb_rd_wr_vld_scanin;
wire ucb_rd_wr_vld_scanout;
wire rdata_ucb_rd_req_vld;
wire rdata_ucb_wr_req_vld;
wire ucb_addr_in_scanin;
wire ucb_addr_in_scanout;
wire [12:0] rdata_ucb_addr;
wire ucb_data_in_scanin;
wire ucb_data_in_scanout;
wire [63:0] rdata_ucb_data;
wire ff_ucb_err_inj_scanin;
wire ff_ucb_err_inj_scanout;
wire rdata_ucb_err_ecci;
wire rdata_ucb_err_fbri;
wire rdata_ucb_err_fbui;
wire ff_partial_bank_mode_scanin;
wire ff_partial_bank_mode_scanout;
wire rdata_pm;
wire rdata_pm_ba01;
wire rdata_pm_ba23;
wire rdata_pm_ba45;
wire rdata_pm_ba67;
wire rdata_ucb_wr_req_vld_en;
wire rdata_ucb_wr_req_reset;
wire rdata_ucb_wr_req_vld_cpu;
wire rdata_wr_vld_scanin;
wire rdata_wr_vld_scanout;
wire rdata_ucb_rd_req_vld_en;
wire rdata_ucb_rd_req_reset;
wire rdata_ucb_rd_req_vld_cpu;
wire rdata_rd_vld_scanin;
wire rdata_rd_vld_scanout;
wire rdata_ucb_addr_en;
wire ff_rdata_ucb_addr_cpu_scanin;
wire ff_rdata_ucb_addr_cpu_scanout;
wire [12:0] rdata_ucb_addr_cpu;
wire ff_rdata_ucb_data_cpu_scanin;
wire ff_rdata_ucb_data_cpu_scanout;
wire [63:0] rdata_ucb_data_cpu;
wire rdata_ucb_ack_en;
wire rdata_ucb_ack_vld;
wire rdata_ucb_nack_en;
wire rdata_ucb_nack_vld;
wire rdata_ucb_ack_reset;
wire rdata_ucb_ack_vld_cpu;
wire rdata_ucb_nack_reset;
wire rdata_ucb_nack_vld_cpu;
wire ucb_ack_scanin;
wire ucb_ack_scanout;
wire ucb_nack_scanin;
wire ucb_nack_scanout;
wire ucb_data_cpu_scanin;
wire ucb_data_cpu_scanout;
wire [63:0] rdata_ucb_drif_data;
wire [63:0] rdata_ucb_drif_data_cpu;
wire rdata_secc_intr_en;
wire rdata_secc_cnt_intr;
wire rdata_secc_intr_reset;
wire rdata_secc_cnt_intr_cpu;
wire ff_ecc_intr_scanin;
wire ff_ecc_intr_scanout;
wire rdata_fbr_intr_en;
wire rdata_fbr_intr;
wire rdata_fbr_intr_reset;
wire rdata_fbr_intr_cpu;
wire ff_fbr_intr_scanin;
wire ff_fbr_intr_scanout;
wire ucb_ack_nack_scanin;
wire ucb_ack_nack_scanout;
wire ucb_data_out_scanin;
wire ucb_data_out_scanout;
wire ff_ncu_intr_scanin;
wire ff_ncu_intr_scanout;
wire ff_serdes_dtm_scanin;
wire ff_serdes_dtm_scanout;
wire rdata_serdes_dtm_cpu;
wire ff_test_signals_scanin;
wire ff_test_signals_scanout;
wire rdata_ucb_rd_wr_vld_scanin;
wire rdata_ucb_rd_wr_vld_scanout;
wire rdata_ucb_addr_in_scanin;
wire rdata_ucb_addr_in_scanout;
wire rdata_ucb_data_in_scanin;
wire rdata_ucb_data_in_scanout;
wire ff_err_inj_scanin;
wire ff_err_inj_scanout;
wire rdata_pm_two_mcus;
wire rdata_pm_2mcu_in;
wire rdata_pm_1mcu_in;
wire ff_pm_mcus_scanin;
wire ff_pm_mcus_scanout;
wire rdata_ucb_ack_nack_scanin;
wire rdata_ucb_ack_nack_scanout;
wire ff_ucb_data_out_scanin;
wire ff_ucb_data_out_scanout;
wire ff_data_valid_scanin;
wire ff_data_valid_scanout;
wire rdata_l2t0_data_valid;
wire rdata_l2t1_data_valid;
wire ff_rd_req_id_scanin;
wire ff_rd_req_id_scanout;
wire ff_qword_id_scanin;
wire ff_qword_id_scanout;
wire rdata_qword_id;
wire ff_scrub_err_valid_scanin;
wire ff_scrub_err_valid_scanout;
wire rdata_scrb0_err_valid;
wire rdata_scrb1_err_valid;
wire rdata_fbd0_recov_err;
wire rdata_fbd1_recov_err;
wire ff_pa_err_p2_scanin;
wire ff_pa_err_p2_scanout;
wire rdata_pa_err_p2;
wire rdata_fbd_unrecov_err_p1_1;
wire rdata_fbd_unrecov_err_p2_0;
wire ff_dbg_trig_scanin;
wire ff_dbg_trig_scanout;
wire ff_debug_signals_scanin;
wire ff_debug_signals_scanout;
wire rdata_fbd_error_out;
wire [1:0] rdata_wr_req_out_out;
wire ff_rdata_intr_scanin;
wire ff_rdata_intr_scanout;
wire ff_serdes_dtm_cpu_scanin;
wire ff_serdes_dtm_cpu_scanout;
wire rdata_ddr_cmp_sync_en_d12;
wire rdata_ddr_cmp_sync_en_d12_in;
wire ff_ddr_cmp_sync_en_d12_scanin;
wire ff_ddr_cmp_sync_en_d12_scanout;
wire mcu_l2t0_scb_secc_err_in;
wire mcu_l2t0_scb_mecc_err_in;
wire mcu_l2t1_scb_secc_err_in;
wire mcu_l2t1_scb_mecc_err_in;
wire ff_l2_scb_mecc_secc_scanin;
wire ff_l2_scb_mecc_secc_scanout;
wire rdata_ddr_cmp_sync_en_d23_in;
wire ff_ddr_cmp_sync_en_d23_scanin;
wire ff_ddr_cmp_sync_en_d23_scanout;
wire rdata_ddr_cmp_sync_en_d23;
wire ff_data_valid_d1_scanin;
wire ff_data_valid_d1_scanout;
wire rdata_l2t0_data_valid_d1;
wire rdata_l2t1_data_valid_d1;
wire ff_pa_err_p1_scanin;
wire ff_pa_err_p1_scanout;
wire rdata_pa_err_p1;
wire rdata_fbd_unrecov_err_p1_0;
wire mcu_l2t0_mecc_err_r1;
wire mcu_l2t1_mecc_err_r1;
wire mcu_l2t0_secc_err_r1;
wire mcu_l2t1_secc_err_r1;
wire ff_l2_mecc_secc_r2_scanin;
wire ff_l2_mecc_secc_r2_scanout;
wire mcu_l2t0_mecc_err_r2;
wire mcu_l2t0_secc_err_r2;
wire mcu_l2t1_mecc_err_r2;
wire mcu_l2t1_secc_err_r2;
wire ff_l2_mecc_secc_r3_scanin;
wire ff_l2_mecc_secc_r3_scanout;
wire rdata_pa_err_in;
wire ff_pa_err_scanin;
wire ff_pa_err_scanout;
wire ff_mbist_data_scanin;
wire ff_mbist_data_scanout;
wire [7:0] wdqrf00_data_reg;
wire [7:0] wdqrf01_data_reg;
wire [7:0] wdqrf10_data_reg;
wire [7:0] wdqrf11_data_reg;
wire ff_mbist_addr_scanin;
wire ff_mbist_run_d1_scanout;
wire ff_mbist_addr_scanout;
wire [4:0] mbist_addr_d1;
wire mbist_wdqrf00_rd_en_d1;
wire mbist_wdqrf01_rd_en_d1;
wire mbist_wdqrf10_rd_en_d1;
wire mbist_wdqrf11_rd_en_d1;
wire spares_scanin;
wire spares_scanout;


//##dbg signal
output [4:0]    mcu_ucb_rd_request_out ; // sent to dbg
output [1:0]	mcu_ucb_wr_req_out ;     // sent to dbg
output		mcu_ucb_mecc_err ;       // sent to dbg
output		mcu_ucb_secc_err ;       // sent to dbg
output		mcu_ucb_fbd_err ;        // sent to dbg
output		mcu_ucb_err_mode ;       // sent to dbg
output		mcu_ucb_err_event ;      // sent to dbg
input		ccu_mcu_cmp_io_sync_en;	 // clock synchronization signal from cpu to io

// mcu to l2 cache signals accompanying read data
output [1:0]  	mcu_l2t0_qword_id_r0;	// quad word id to l2 cache bank 0
output        	mcu_l2t0_data_vld_r0;	// data valid to l2 cache bank 0
output [2:0]  	mcu_l2t0_rd_req_id_r0;	// read request id to l2 cache bank 0
output		mcu_l2t0_mecc_err_r3;	// multi-bit ecc error
output		mcu_l2t0_secc_err_r3;	// single-bit ecc error
output		mcu_l2t0_scb_mecc_err;	// multi-bit ecc error on scrubbing request
output		mcu_l2t0_scb_secc_err;	// single-bit ecc error on scrubbing request

output [1:0]  	mcu_l2t1_qword_id_r0;	// quad word id to l2 cache bank 1
output        	mcu_l2t1_data_vld_r0;	// data valid to l2 cache bank 1
output [2:0]  	mcu_l2t1_rd_req_id_r0;	// read request id to l2 cache bank 1
output		mcu_l2t1_mecc_err_r3;	// multi-bit ecc error
output		mcu_l2t1_secc_err_r3;	// single-bit ecc error
output		mcu_l2t1_scb_mecc_err;	// multi-bit ecc error on scrubbing request
output		mcu_l2t1_scb_secc_err;	// single-bit ecc error on scrubbing request

// ucb rd/wr request 
output          rdata_drif_rd_req_vld;
output          rdata_drif_wr_req_vld;
output [12:0]	rdata_drif_addr;
output [63:0]	rdata_drif_data;

output		rdata_mcu_selfrsh;	// put mcu in self refresh mode

output		rdata_err_ecci;
output		rdata_err_fbri;
output		rdata_err_fbui;

// register rd/wr reply to ucb
output          mcu_ucb_ack_vld;
output          mcu_ucb_nack_vld;
output [63:0]   mcu_ucb_data;

output          rdata_err_intr;		// interrupt signal to ucb module
output		rdata_err_fbr;

output		rdata_cmp_ddr_sync_en;	// clock synchronization signal from cpu to mcu for dp blocks
output		rdata_ddr_cmp_sync_en;	// clock synchronization signal from mcu to cpu for dp blocks

output [1:0]	rdata_rddata_sel;	// dummy data vs. upper/lower word select to readdp
output		rdata_pa_err;		// physical address error bit to readdp to corrupt L2 ECC

output		rdata_pm_1mcu;
output		rdata_pm_2mcu;

output	[7:0]	mbist_read_data;
output	[1:0]	rdata0_wdq_rd;
output	[1:0]	rdata1_wdq_rd;
output	[4:0]	rdata_wdq_radr;

// delayed versions of mbist signals for wrdp 
output		mbist_run_d1;
output		mbist_run_d1_l;
output		mbist_sel_hiorlo_72bits_d1;
output		mbist_sel_bank0or1_d1;

output		rdata_serdes_dtm;

input		ccu_mcu_cmp_ddr_sync_en; // clock synchronization signal from cpu to mcu
input		ccu_mcu_ddr_cmp_sync_en; // clock synchronization signal from mcu to cpu
input		ccu_mcu_io_cmp_sync_en;	// clock synchronization signal from io to cpu

input		ucb_rdata_selfrsh;	// put mcu in self refresh mode

// register rd/wr request from ucb
input           ucb_mcu_rd_req_vld;
input           ucb_mcu_wr_req_vld;
input [12:0]    ucb_mcu_addr;
input [63:0]    ucb_mcu_data;

input		ucb_err_ecci;
input		ucb_err_fbri;
input		ucb_err_fbui;

// register rd reply to ucb
input          	drif_rdata_ack_vld;
input          	drif_rdata_nack_vld;
input [63:0]   	drif_rdata_data;

input		fbdic_err_fbr;

input		rdpctl_l2t0_data_valid;	// data valid for returning l2t0 read data
input		rdpctl_l2t1_data_valid;	// data valid for returning l2t1 read data
input 		rdpctl_qword_id;	// qword id for returning transaction
input [2:0]	rdpctl_rd_req_id;	// read request id for returning transaction
input		rdpctl_pa_err;		// physical address error to OR with mecc

input		rdpctl_scrb0_err_valid;	// scrub error valid for l2t0 
input		rdpctl_scrb1_err_valid;	// scrub error valid for l2t1

input		rdpctl_fbd0_recov_err;
input		rdpctl_fbd1_recov_err;
input	[1:0]	rdpctl_fbd_unrecov_err;

input		rdpctl_secc_cnt_intr;	// secc error count interrupt to NCU 
input		rdpctl_dbg_trig_enable;	// debug trigger 

input		fbdic_fbd_error;
input		drif_mcu_error_mode;
input	[1:0]	woq_wr_req_out;

input           ucb_pm;			// partial bank mode signals
input           ucb_pm_ba01;
input           ucb_pm_ba23;
input           ucb_pm_ba45;
input           ucb_pm_ba67;

// ecc error signals
input		readdp_l2_secc_err_dly1;
input		readdp_l2_mecc_err_dly1;

// mbist signals
input		mbist_run;
input	[4:0]	mbist_addr;
input		mbist_sel_bank0or1;
input		mbist_sel_hiorlo_72bits;
input		mbist_wdqrf00_rd_en;
input		mbist_wdqrf01_rd_en;
input		mbist_wdqrf10_rd_en;
input		mbist_wdqrf11_rd_en;

input		drif0_wdq_rd;
input		drif1_wdq_rd;
input	[4:0]	drif_wdq_radr;

input	[7:0]	wdqrf00_data;
input	[7:0]	wdqrf01_data;
input	[7:0]	wdqrf10_data;
input	[7:0]	wdqrf11_data;

input		fbdic_srds_dtm_muxsel;

output		array_wr_inhibit;
input		cmp_array_wr_inhibit;
input		dr_array_wr_inhibit;

// Global Signals
input 		l2clk;
input 		scan_in;
output		scan_out;
input		tcu_pce_ov;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;

// Code
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

assign array_wr_inhibit = cmp_array_wr_inhibit & dr_array_wr_inhibit;

mcu_rdata_ctl_l1clkhdr_ctl_macro clkgen (
 	.l2clk(l2clk),
 	.l1en(1'b1 ),
	.stop(1'b0),
 	.l1clk(l1clk),
  .pce_ov(pce_ov),
  .se(se));

// sync pulses to transfer data between clock domains
mcu_rdata_ctl_msff_ctl_macro__width_2 ff_mcu_sync_pulses  (
        .scan_in(ff_mcu_sync_pulses_scanin),
        .scan_out(ff_mcu_sync_pulses_scanout),
        .din({ccu_mcu_ddr_cmp_sync_en, ccu_mcu_cmp_ddr_sync_en}),
        .dout({rdata_ddr_cmp_sync_en, rdata_cmp_ddr_sync_en}),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_rdata_ctl_msff_ctl_macro__width_2 ff_io_sync_pulses  (
        .scan_in(ff_io_sync_pulses_scanin),
        .scan_out(ff_io_sync_pulses_scanout),
        .din({ccu_mcu_io_cmp_sync_en, ccu_mcu_cmp_io_sync_en}),
        .dout({rdata_io_cmp_sync_en, rdata_cmp_io_sync_en}),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_rdata_ctl_msff_ctl_macro__width_4 ff_mcu_sync_pulse_delays  (
        .scan_in(ff_mcu_sync_pulse_delays_scanin),
        .scan_out(ff_mcu_sync_pulse_delays_scanout),
        .din({rdata_ddr_cmp_sync_en, rdata_ddr_cmp_sync_en_d1, rdata_ddr_cmp_sync_en_d2, rdata_io_cmp_sync_en}),
        .dout({rdata_ddr_cmp_sync_en_d1, rdata_ddr_cmp_sync_en_d2, rdata_ddr_cmp_sync_en_d3, rdata_io_cmp_sync_en_d1}),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));
//////////////////////////////////////////////////////////////////
//## SIGNALS from l1clk to ioclk then send to dbg module
//////////////////////////////////////////////////////////////////
assign rdata_data_word_cnt_in[1:0] = (mcu_l2t0_data_vld_r0 | mcu_l2t1_data_vld_r0) ? rdata_data_word_cnt[1:0] + 2'h1 : 
										     rdata_data_word_cnt[1:0];
mcu_rdata_ctl_msff_ctl_macro__width_2 ff_data_word_cnt  (
	.scan_in(ff_data_word_cnt_scanin),
	.scan_out(ff_data_word_cnt_scanout),
	.din(rdata_data_word_cnt_in[1:0]),
	.dout(rdata_data_word_cnt[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mcu_ucb_data_vld = (mcu_l2t0_data_vld_r0 | mcu_l2t1_data_vld_r0) & rdata_data_word_cnt[1:0] == 2'h0;

assign mcu_ucb_rd_request_out_d1_in[4] = mcu_ucb_data_vld ? 1'b1 : 
						rdata_cmp_io_sync_en ? 1'b0 : mcu_ucb_rd_request_out_d1[4];
assign mcu_ucb_rd_request_out_d1_in[3] = mcu_ucb_data_vld ? mcu_l2t1_data_vld_r0 : 
						rdata_cmp_io_sync_en ? 1'b0 : mcu_ucb_rd_request_out_d1[3];
assign mcu_ucb_rd_request_out_d1_in[2:0] = mcu_ucb_data_vld ? rdata_rd_req_id[2:0] : 
						rdata_cmp_io_sync_en ? 3'h0 : mcu_ucb_rd_request_out_d1[2:0];

mcu_rdata_ctl_msff_ctl_macro__width_5 ff_ucb_rdata_rd_req_id  (
        .scan_in(ff_ucb_rdata_rd_req_id_scanin),
        .scan_out(ff_ucb_rdata_rd_req_id_scanout),
        .din (mcu_ucb_rd_request_out_d1_in[4:0]),
        .dout (mcu_ucb_rd_request_out_d1[4:0]),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_rdata_ctl_msff_ctl_macro__en_1__width_5 ff_ucb_rdata_rd_req_id_d1   (
        .scan_in(ff_ucb_rdata_rd_req_id_d1_scanin),
        .scan_out(ff_ucb_rdata_rd_req_id_d1_scanout),
        .din (mcu_ucb_rd_request_out_d1[4:0]),
        .dout (mcu_ucb_rd_request_out[4:0]),
        .en (rdata_cmp_io_sync_en),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk));
//## or all mecc and secc signals before sync to cross clock domains
assign mcu_ucb_any_mecc_err = mcu_l2t0_mecc_err_r3 | mcu_l2t0_scb_mecc_err | mcu_l2t1_mecc_err_r3 | mcu_l2t1_scb_mecc_err ;
assign mcu_ucb_mecc_err_o = mcu_ucb_any_mecc_err ? 1'b1 : rdata_cmp_io_sync_en ? 1'b0 : mcu_ucb_mecc_err_d1 ;
mcu_rdata_ctl_msff_ctl_macro__width_1 ff_ucb_mecc_err_o   (
        .scan_in(ff_ucb_mecc_err_o_scanin),
        .scan_out(ff_ucb_mecc_err_o_scanout),
        .din ( mcu_ucb_mecc_err_o ) ,
        .dout ( mcu_ucb_mecc_err_d1 ) ,
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk));
mcu_rdata_ctl_msff_ctl_macro__en_1__width_1 ff_ucb_mecc_err_d1    (
        .scan_in(ff_ucb_mecc_err_d1_scanin),
        .scan_out(ff_ucb_mecc_err_d1_scanout),
        .din ( mcu_ucb_mecc_err_d1 ) ,
        .dout ( mcu_ucb_mecc_err ) ,
        .en ( rdata_cmp_io_sync_en ) ,
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mcu_ucb_any_secc_err = mcu_l2t0_secc_err_r3 | mcu_l2t0_scb_secc_err | mcu_l2t1_secc_err_r3 | mcu_l2t1_scb_secc_err ;
assign mcu_ucb_secc_err_o = mcu_ucb_any_secc_err ? 1'b1 : rdata_cmp_io_sync_en ? 1'b0 : mcu_ucb_secc_err_d1 ;
mcu_rdata_ctl_msff_ctl_macro__width_1 ff_ucb_secc_err_o   (
        .scan_in(ff_ucb_secc_err_o_scanin),
        .scan_out(ff_ucb_secc_err_o_scanout),
        .din ( mcu_ucb_secc_err_o ) ,
        .dout ( mcu_ucb_secc_err_d1 ) ,
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk));
mcu_rdata_ctl_msff_ctl_macro__en_1__width_1 ff_ucb_secc_err_d1    (
        .scan_in(ff_ucb_secc_err_d1_scanin),
        .scan_out(ff_ucb_secc_err_d1_scanout),
        .din ( mcu_ucb_secc_err_d1 ) ,
        .dout ( mcu_ucb_secc_err ) ,
        .en ( rdata_cmp_io_sync_en ) ,
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mcu_ucb_l1clk_err_event = rdata_dbg_trig_enable & (mcu_ucb_any_secc_err | mcu_ucb_any_mecc_err);
assign mcu_ucb_err_event_o = mcu_ucb_l1clk_err_event ? 1'b1 : rdata_cmp_io_sync_en ? 1'b0 : mcu_ucb_err_event_d1 ;
mcu_rdata_ctl_msff_ctl_macro__width_1 ff_ucb_err_event_d1   (
        .scan_in(ff_ucb_err_event_d1_scanin),
        .scan_out(ff_ucb_err_event_d1_scanout),
        .din ( mcu_ucb_err_event_o ) ,
        .dout ( mcu_ucb_err_event_d1 ) ,
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk));
mcu_rdata_ctl_msff_ctl_macro__en_1__width_1 ff_ucb_err_event    (
        .scan_in(ff_ucb_err_event_scanin),
        .scan_out(ff_ucb_err_event_scanout),
        .din ( mcu_ucb_err_event_d1 ) ,
        .dout ( mcu_ucb_err_event ) ,
        .en ( rdata_cmp_io_sync_en ) ,
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk));
//###
//assign mcu_ucb_fbd_err = rdata_fbd_error ;

//###
assign mcu_ucb_l1clk_fbd_error_o = rdata_fbd_error ? 1'b1 : rdata_cmp_io_sync_en ? 1'b0 : mcu_ucb_fbd_error_d1 ;
mcu_rdata_ctl_msff_ctl_macro__width_1 ff_ucb_fbd_error_d1   (
        .scan_in(ff_ucb_fbd_error_d1_scanin),
        .scan_out(ff_ucb_fbd_error_d1_scanout),
        .din ( mcu_ucb_l1clk_fbd_error_o ) ,
        .dout ( mcu_ucb_fbd_error_d1 ) ,
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk));
mcu_rdata_ctl_msff_ctl_macro__en_1__width_1 ff_ucb_fbd_error    (
        .scan_in(ff_ucb_fbd_error_scanin),
        .scan_out(ff_ucb_fbd_error_scanout),
        .din ( mcu_ucb_fbd_error_d1 ) ,
        .dout ( mcu_ucb_fbd_err ) ,
        .en ( rdata_cmp_io_sync_en ) ,
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk));
//
mcu_rdata_ctl_msff_ctl_macro__en_1 ff_mcu_ucb_err_mode  (
	.scan_in(ff_mcu_ucb_err_mode_scanin),
	.scan_out(ff_mcu_ucb_err_mode_scanout),
	.din(rdata_mcu_error_mode),
	.dout(mcu_ucb_err_mode),
	.en(rdata_cmp_io_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


// 0in overflow -var rdata_wr_req_out_cnt[1:0]
// 0in underflow -var rdata_wr_req_out_cnt[1:0]
assign rdata_wr_req_out_cnt_incr = rdata_wr_req_out[0] & (~rdata_cmp_io_sync_en & (|rdata_wr_req_out_cnt[1:0]) |  
					~(|rdata_wr_req_out_cnt[1:0]));
assign rdata_wr_req_out_cnt_decr = rdata_cmp_io_sync_en & (|rdata_wr_req_out_cnt[1:0]) & ~rdata_wr_req_out[0];

assign rdata_wr_req_out_cnt_in[1:0] = rdata_wr_req_out_cnt_incr ? rdata_wr_req_out_cnt[1:0] + 2'h1 : 
				      rdata_wr_req_out_cnt_decr ? rdata_wr_req_out_cnt[1:0] - 2'h1 : rdata_wr_req_out_cnt[1:0];

mcu_rdata_ctl_msff_ctl_macro__width_2 ff_wr_req_out_cnt  (
	.scan_in(ff_wr_req_out_cnt_scanin),
	.scan_out(ff_wr_req_out_cnt_scanout),
	.din(rdata_wr_req_out_cnt_in[1:0]),
	.dout(rdata_wr_req_out_cnt[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mcu_ucb_l1clk_wr_req_out_o[1] = rdata_wr_req_out[1] ? 1'b1 : 
				       rdata_cmp_io_sync_en ? 1'b0 : mcu_ucb_wr_req_out_d1[1] ;
mcu_rdata_ctl_msff_ctl_macro__width_1 ff_ucb_wr_req_out1_d1   (
        .scan_in(ff_ucb_wr_req_out1_d1_scanin),
        .scan_out(ff_ucb_wr_req_out1_d1_scanout),
        .din ( mcu_ucb_l1clk_wr_req_out_o[1] ) ,
        .dout ( mcu_ucb_wr_req_out_d1[1] ) ,
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_rdata_ctl_msff_ctl_macro__en_1__width_1 ff_ucb_wr_req_out1    (
        .scan_in(ff_ucb_wr_req_out1_scanin),
        .scan_out(ff_ucb_wr_req_out1_scanout),
        .din ( mcu_ucb_wr_req_out_d1[1] ) ,
        .dout ( mcu_ucb_wr_req_out[1] ) ,
        .en ( rdata_cmp_io_sync_en ) ,
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign  mcu_ucb_wr_req_out_d1[0] = |rdata_wr_req_out_cnt[1:0];

mcu_rdata_ctl_msff_ctl_macro__en_1__width_1 ff_ucb_wr_req_out0    (
        .scan_in(ff_ucb_wr_req_out0_scanin),
        .scan_out(ff_ucb_wr_req_out0_scanout),
        .din ( mcu_ucb_wr_req_out_d1[0] ) ,
        .dout ( mcu_ucb_wr_req_out[0] ) ,
        .en ( rdata_cmp_io_sync_en ) ,
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk));



//////////////////////////////////////////////////////////////////
// SIGNALS FROM IO TO CPU CLK
//////////////////////////////////////////////////////////////////

// Test signals
mcu_rdata_ctl_msff_ctl_macro__en_1__width_1 ff_ucb_test_signals  (
        .scan_in(ff_ucb_test_signals_scanin),
        .scan_out(ff_ucb_test_signals_scanout),
        .din	(ucb_rdata_selfrsh),
        .dout	(rdata_selfrsh),
	.en	(rdata_io_cmp_sync_en),
        .l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// flop ucb write and read valid
mcu_rdata_ctl_msff_ctl_macro__en_1__width_2 ucb_rd_wr_vld  (
        .scan_in(ucb_rd_wr_vld_scanin),
        .scan_out(ucb_rd_wr_vld_scanout),
        .din	({ucb_mcu_rd_req_vld, ucb_mcu_wr_req_vld}),
        .dout	({rdata_ucb_rd_req_vld, rdata_ucb_wr_req_vld}),
	.en	(rdata_io_cmp_sync_en),
        .l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// flop ucb addr in
mcu_rdata_ctl_msff_ctl_macro__en_1__width_13 ucb_addr_in  (
        .scan_in(ucb_addr_in_scanin),
        .scan_out(ucb_addr_in_scanout),
        .din	(ucb_mcu_addr[12:0]),
        .dout	(rdata_ucb_addr[12:0]),
	.en	(rdata_io_cmp_sync_en),
        .l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// flop ucb data in
mcu_rdata_ctl_msff_ctl_macro__en_1__width_64 ucb_data_in  (
        .scan_in(ucb_data_in_scanin),
        .scan_out(ucb_data_in_scanout),
        .din(ucb_mcu_data[63:0]),
        .dout(rdata_ucb_data[63:0]),
	.en(rdata_io_cmp_sync_en),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// error injection signals
mcu_rdata_ctl_msff_ctl_macro__en_1__width_3 ff_ucb_err_inj  (
	.scan_in(ff_ucb_err_inj_scanin),
	.scan_out(ff_ucb_err_inj_scanout),
	.din({ucb_err_ecci,ucb_err_fbri,ucb_err_fbui}),
	.dout({rdata_ucb_err_ecci,rdata_ucb_err_fbri,rdata_ucb_err_fbui}),
	.en(rdata_io_cmp_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_rdata_ctl_msff_ctl_macro__en_1__width_5 ff_partial_bank_mode  (
	.scan_in(ff_partial_bank_mode_scanin),
	.scan_out(ff_partial_bank_mode_scanout),
	.din({ucb_pm, ucb_pm_ba01, ucb_pm_ba23, ucb_pm_ba45, ucb_pm_ba67}),
	.dout({rdata_pm, rdata_pm_ba01, rdata_pm_ba23, rdata_pm_ba45, rdata_pm_ba67}),
	.en(rdata_io_cmp_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////
// Flop enables so that they are reset on mcu sync pulse
////////////////////////

// flop write valid
assign rdata_ucb_wr_req_vld_en = rdata_io_cmp_sync_en_d1 & rdata_ucb_wr_req_vld;
assign rdata_ucb_wr_req_reset = rdata_cmp_ddr_sync_en & rdata_ucb_wr_req_vld_cpu;

mcu_rdata_ctl_msff_ctl_macro__clr_1__en_1__width_1 rdata_wr_vld  (
        .scan_in(rdata_wr_vld_scanin),
        .scan_out(rdata_wr_vld_scanout),
        .din(rdata_ucb_wr_req_vld),
        .dout(rdata_ucb_wr_req_vld_cpu),
        .en(rdata_ucb_wr_req_vld_en),
	.clr(rdata_ucb_wr_req_reset),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// flop read valid
assign rdata_ucb_rd_req_vld_en = rdata_io_cmp_sync_en_d1 & rdata_ucb_rd_req_vld;
assign rdata_ucb_rd_req_reset = rdata_cmp_ddr_sync_en & rdata_ucb_rd_req_vld_cpu;

mcu_rdata_ctl_msff_ctl_macro__clr_1__en_1__width_1 rdata_rd_vld  (
        .scan_in(rdata_rd_vld_scanin),
        .scan_out(rdata_rd_vld_scanout),
        .din(rdata_ucb_rd_req_vld),
        .dout(rdata_ucb_rd_req_vld_cpu),
        .en(rdata_ucb_rd_req_vld_en),
	.clr(rdata_ucb_rd_req_reset),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rdata_ucb_addr_en = rdata_ucb_wr_req_vld_en | rdata_ucb_rd_req_vld_en;

// flop addr in
mcu_rdata_ctl_msff_ctl_macro__en_1__width_13 ff_rdata_ucb_addr_cpu  (
        .scan_in(ff_rdata_ucb_addr_cpu_scanin),
        .scan_out(ff_rdata_ucb_addr_cpu_scanout),
        .din(rdata_ucb_addr[12:0]),
        .dout(rdata_ucb_addr_cpu[12:0]),
        .en(rdata_ucb_addr_en),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// flop data in
mcu_rdata_ctl_msff_ctl_macro__en_1__width_64 ff_rdata_ucb_data_cpu  (
        .scan_in(ff_rdata_ucb_data_cpu_scanin),
        .scan_out(ff_rdata_ucb_data_cpu_scanout),
        .din(rdata_ucb_data[63:0]),
        .dout(rdata_ucb_data_cpu[63:0]),
        .en(rdata_ucb_wr_req_vld),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////
// Flop enable so that its reset on io sync pulse
////////////////////////////////////////

assign rdata_ucb_ack_en = rdata_ddr_cmp_sync_en_d1 & rdata_ucb_ack_vld;
assign rdata_ucb_nack_en = rdata_ddr_cmp_sync_en_d1 & rdata_ucb_nack_vld;
assign rdata_ucb_ack_reset = rdata_cmp_io_sync_en & rdata_ucb_ack_vld_cpu;
assign rdata_ucb_nack_reset = rdata_cmp_io_sync_en & rdata_ucb_nack_vld_cpu;

// flop ack 
mcu_rdata_ctl_msff_ctl_macro__clr_1__en_1__width_1 ucb_ack  (
        .scan_in(ucb_ack_scanin),
        .scan_out(ucb_ack_scanout),
        .din(rdata_ucb_ack_vld),
        .dout(rdata_ucb_ack_vld_cpu),
        .en(rdata_ucb_ack_en),
	.clr(rdata_ucb_ack_reset),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// flop nack 
mcu_rdata_ctl_msff_ctl_macro__clr_1__en_1__width_1 ucb_nack  (
        .scan_in(ucb_nack_scanin),
        .scan_out(ucb_nack_scanout),
        .din(rdata_ucb_nack_vld),
        .dout(rdata_ucb_nack_vld_cpu),
        .en(rdata_ucb_nack_en),
	.clr(rdata_ucb_nack_reset),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// flop data
mcu_rdata_ctl_msff_ctl_macro__en_1__width_64 ucb_data_cpu  (
        .scan_in(ucb_data_cpu_scanin),
        .scan_out(ucb_data_cpu_scanout),
        .din(rdata_ucb_drif_data[63:0]),
        .dout(rdata_ucb_drif_data_cpu[63:0]),
        .en(rdata_ucb_ack_en),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// secc counter interrupt for NCU
assign rdata_secc_intr_en = rdata_ddr_cmp_sync_en_d1 & rdata_secc_cnt_intr;
assign rdata_secc_intr_reset = rdata_cmp_io_sync_en & rdata_secc_cnt_intr_cpu;

mcu_rdata_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_ecc_intr  (
	.scan_in(ff_ecc_intr_scanin),
	.scan_out(ff_ecc_intr_scanout),
	.din(rdata_secc_cnt_intr),
	.dout(rdata_secc_cnt_intr_cpu),
	.en(rdata_secc_intr_en),
	.clr(rdata_secc_intr_reset),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// fbdimm channel recoverable error interrupt for NCU
assign rdata_fbr_intr_en = rdata_ddr_cmp_sync_en_d1 & rdata_fbr_intr;
assign rdata_fbr_intr_reset = rdata_cmp_io_sync_en & rdata_fbr_intr_cpu;

mcu_rdata_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_fbr_intr  (
	.scan_in(ff_fbr_intr_scanin),
	.scan_out(ff_fbr_intr_scanout),
	.din(rdata_fbr_intr),
	.dout(rdata_fbr_intr_cpu),
	.en(rdata_fbr_intr_en),
	.clr(rdata_fbr_intr_reset),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


//////////////////////////////////////////////////////////////////
// SIGNALS FROM CPU TO IO CLK
//////////////////////////////////////////////////////////////////

// flop ack and nack 
mcu_rdata_ctl_msff_ctl_macro__en_1__width_2 ucb_ack_nack  (
        .scan_in(ucb_ack_nack_scanin),
        .scan_out(ucb_ack_nack_scanout),
        .din({rdata_ucb_ack_vld_cpu, rdata_ucb_nack_vld_cpu}),
        .dout({mcu_ucb_ack_vld, mcu_ucb_nack_vld}),
	.en(rdata_cmp_io_sync_en),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// flop data
mcu_rdata_ctl_msff_ctl_macro__en_1__width_64 ucb_data_out  (
        .scan_in(ucb_data_out_scanin),
        .scan_out(ucb_data_out_scanout),
        .din(rdata_ucb_drif_data_cpu[63:0]),
        .dout(mcu_ucb_data[63:0]),
	.en(rdata_cmp_io_sync_en),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// flop secc counter interrupt
mcu_rdata_ctl_msff_ctl_macro__en_1__width_2 ff_ncu_intr  (
        .scan_in(ff_ncu_intr_scanin),
        .scan_out(ff_ncu_intr_scanout),
        .din({rdata_secc_cnt_intr_cpu,rdata_fbr_intr_cpu}),
        .dout({rdata_err_intr,rdata_err_fbr}),
	.en(rdata_cmp_io_sync_en),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// 
mcu_rdata_ctl_msff_ctl_macro__en_1 ff_serdes_dtm  (
	.scan_in(ff_serdes_dtm_scanin),
	.scan_out(ff_serdes_dtm_scanout),
	.din(rdata_serdes_dtm_cpu),
	.dout(rdata_serdes_dtm),
	.en(rdata_cmp_io_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////////////////////
// SIGNALS FROM CPU CLK TO DRAM CLK
/////////////////////////////////////////////////
mcu_rdata_ctl_msff_ctl_macro__en_1__width_1 ff_test_signals  (
        .scan_in(ff_test_signals_scanin),
        .scan_out(ff_test_signals_scanout),
        .din({rdata_selfrsh}),
        .dout({rdata_mcu_selfrsh}),
        .en(rdata_cmp_ddr_sync_en),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// flop write and read valid
mcu_rdata_ctl_msff_ctl_macro__en_1__width_2 rdata_ucb_rd_wr_vld  (
        .scan_in(rdata_ucb_rd_wr_vld_scanin),
        .scan_out(rdata_ucb_rd_wr_vld_scanout),
        .din({rdata_ucb_rd_req_vld_cpu, rdata_ucb_wr_req_vld_cpu}),
        .dout({rdata_drif_rd_req_vld, rdata_drif_wr_req_vld}),
        .en(rdata_cmp_ddr_sync_en),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// flop addr in
mcu_rdata_ctl_msff_ctl_macro__en_1__width_13 rdata_ucb_addr_in  (
        .scan_in(rdata_ucb_addr_in_scanin),
        .scan_out(rdata_ucb_addr_in_scanout),
        .din(rdata_ucb_addr_cpu[12:0]),
        .dout(rdata_drif_addr[12:0]),
        .en(rdata_cmp_ddr_sync_en),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// flop data in
mcu_rdata_ctl_msff_ctl_macro__en_1__width_64 rdata_ucb_data_in  (
        .scan_in(rdata_ucb_data_in_scanin),
        .scan_out(rdata_ucb_data_in_scanout),
        .din(rdata_ucb_data_cpu[63:0]),
        .dout(rdata_drif_data[63:0]),
        .en(rdata_cmp_ddr_sync_en),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// error injection signals
mcu_rdata_ctl_msff_ctl_macro__en_1__width_3 ff_err_inj  (
	.scan_in(ff_err_inj_scanin),
	.scan_out(ff_err_inj_scanout),
	.din({rdata_ucb_err_ecci,rdata_ucb_err_fbri,rdata_ucb_err_fbui}),
	.dout({rdata_err_ecci,rdata_err_fbri,rdata_err_fbui}),
	.en(rdata_cmp_ddr_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rdata_pm_two_mcus = rdata_pm_ba01 & rdata_pm_ba23 |
			    rdata_pm_ba01 & rdata_pm_ba45 |
			    rdata_pm_ba01 & rdata_pm_ba67 |
			    rdata_pm_ba23 & rdata_pm_ba45 |
			    rdata_pm_ba23 & rdata_pm_ba67 |
			    rdata_pm_ba45 & rdata_pm_ba67; 

assign rdata_pm_2mcu_in = rdata_pm &  rdata_pm_two_mcus;
assign rdata_pm_1mcu_in = rdata_pm & ~rdata_pm_two_mcus;

mcu_rdata_ctl_msff_ctl_macro__en_1__width_2 ff_pm_mcus  (
	.scan_in(ff_pm_mcus_scanin),
	.scan_out(ff_pm_mcus_scanout),
	.din({rdata_pm_1mcu_in,rdata_pm_2mcu_in}),
	.dout({rdata_pm_1mcu,rdata_pm_2mcu}),
	.en(rdata_cmp_ddr_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////////////////////
// SIGNALS FROM MCU CLK TO CPU CLK
/////////////////////////////////////////////////
// flop ucb read ack and nack
mcu_rdata_ctl_msff_ctl_macro__en_1__width_2 rdata_ucb_ack_nack  (
        .scan_in(rdata_ucb_ack_nack_scanin),
        .scan_out(rdata_ucb_ack_nack_scanout),
        .din({drif_rdata_ack_vld, drif_rdata_nack_vld}),
        .dout({rdata_ucb_ack_vld, rdata_ucb_nack_vld}),
        .en(rdata_ddr_cmp_sync_en),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// flop ucb read data
mcu_rdata_ctl_msff_ctl_macro__en_1__width_64 ff_ucb_data_out  (
        .scan_in(ff_ucb_data_out_scanin),
        .scan_out(ff_ucb_data_out_scanout),
        .din(drif_rdata_data[63:0]),
        .dout(rdata_ucb_drif_data[63:0]),
        .en(rdata_ddr_cmp_sync_en),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////
// incoming signals from rdpctl
//////////////////////////////////////////////////////

// data valids for l2 cache
mcu_rdata_ctl_msff_ctl_macro__en_1__width_2 ff_data_valid  (
	.scan_in(ff_data_valid_scanin),
	.scan_out(ff_data_valid_scanout),
	.din({rdpctl_l2t0_data_valid,rdpctl_l2t1_data_valid}),
	.dout({rdata_l2t0_data_valid,rdata_l2t1_data_valid}),
	.en(rdata_ddr_cmp_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// read request id's for l2 cache
mcu_rdata_ctl_msff_ctl_macro__en_1__width_3 ff_rd_req_id  (
	.scan_in(ff_rd_req_id_scanin),
	.scan_out(ff_rd_req_id_scanout),
	.din(rdpctl_rd_req_id[2:0]),
	.dout(rdata_rd_req_id[2:0]),
	.en(rdata_ddr_cmp_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// quad word id's for l2 cache
mcu_rdata_ctl_msff_ctl_macro__en_1__width_1 ff_qword_id  (
	.scan_in(ff_qword_id_scanin),
	.scan_out(ff_qword_id_scanout),
	.din(rdpctl_qword_id),
	.dout(rdata_qword_id),
	.en(rdata_ddr_cmp_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// error flags for l2 cache
mcu_rdata_ctl_msff_ctl_macro__en_1__width_4 ff_scrub_err_valid  (
	.scan_in(ff_scrub_err_valid_scanin),
	.scan_out(ff_scrub_err_valid_scanout),
	.din({rdpctl_scrb0_err_valid, rdpctl_scrb1_err_valid, rdpctl_fbd0_recov_err, rdpctl_fbd1_recov_err}),
	.dout({rdata_scrb0_err_valid, rdata_scrb1_err_valid, rdata_fbd0_recov_err, rdata_fbd1_recov_err}),
	.en(rdata_ddr_cmp_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_rdata_ctl_msff_ctl_macro__en_1__width_3 ff_pa_err_p2  (
	.scan_in(ff_pa_err_p2_scanin),
	.scan_out(ff_pa_err_p2_scanout),
	.din({rdpctl_pa_err, rdpctl_fbd_unrecov_err[1:0]}),
	.dout({rdata_pa_err_p2, rdata_fbd_unrecov_err_p1_1, rdata_fbd_unrecov_err_p2_0}),
	.en(rdata_ddr_cmp_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// debug trigger enable
mcu_rdata_ctl_msff_ctl_macro__en_1__width_1 ff_dbg_trig  (
	.scan_in(ff_dbg_trig_scanin),
	.scan_out(ff_dbg_trig_scanout),
	.din(rdpctl_dbg_trig_enable),
	.dout(rdata_dbg_trig_enable),
	.en(rdata_ddr_cmp_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_rdata_ctl_msff_ctl_macro__en_1__width_4 ff_debug_signals  (
	.scan_in(ff_debug_signals_scanin),
	.scan_out(ff_debug_signals_scanout),
	.din({fbdic_fbd_error,drif_mcu_error_mode,woq_wr_req_out[1:0]}),
	.dout({rdata_fbd_error_out,rdata_mcu_error_mode,rdata_wr_req_out_out[1:0]}),
	.en(rdata_ddr_cmp_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rdata_fbd_error = rdata_fbd_error_out & rdata_ddr_cmp_sync_en_d1;
assign rdata_wr_req_out[1:0] = rdata_wr_req_out_out[1:0] & {2{rdata_ddr_cmp_sync_en_d1}};

// interrupts for NCU
mcu_rdata_ctl_msff_ctl_macro__en_1__width_2 ff_rdata_intr  (
	.scan_in(ff_rdata_intr_scanin),
	.scan_out(ff_rdata_intr_scanout),
	.din({rdpctl_secc_cnt_intr,fbdic_err_fbr}),
	.dout({rdata_secc_cnt_intr,rdata_fbr_intr}),
	.en(rdata_ddr_cmp_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// SERDES DTM mux select for ucb
mcu_rdata_ctl_msff_ctl_macro__en_1 ff_serdes_dtm_cpu  (
	.scan_in(ff_serdes_dtm_cpu_scanin),
	.scan_out(ff_serdes_dtm_cpu_scanout),
	.din(fbdic_srds_dtm_muxsel),
	.dout(rdata_serdes_dtm_cpu),
	.en(rdata_ddr_cmp_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// Generate L2 response for read requests
//////////////////////////////////////////////////////////////////

assign mcu_l2t0_data_vld_r0 = rdata_l2t0_data_valid & rdata_ddr_cmp_sync_en_d12;
assign mcu_l2t1_data_vld_r0 = rdata_l2t1_data_valid & rdata_ddr_cmp_sync_en_d12;
assign mcu_l2t0_rd_req_id_r0[2:0] = rdata_rd_req_id[2:0];
assign mcu_l2t1_rd_req_id_r0[2:0] = rdata_rd_req_id[2:0];
assign mcu_l2t0_qword_id_r0[1:0] = {rdata_qword_id, rdata_ddr_cmp_sync_en_d2 & rdata_l2t0_data_valid};
assign mcu_l2t1_qword_id_r0[1:0] = {rdata_qword_id, rdata_ddr_cmp_sync_en_d2 & rdata_l2t1_data_valid};

assign rdata_ddr_cmp_sync_en_d12_in = rdata_ddr_cmp_sync_en | rdata_ddr_cmp_sync_en_d1;
mcu_rdata_ctl_msff_ctl_macro ff_ddr_cmp_sync_en_d12 (
	.scan_in(ff_ddr_cmp_sync_en_d12_scanin),
	.scan_out(ff_ddr_cmp_sync_en_d12_scanout),
	.din(rdata_ddr_cmp_sync_en_d12_in),
	.dout(rdata_ddr_cmp_sync_en_d12),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// select signal to force data and l2ecc to zero for dummy reads
assign rdata_rddata_sel[1:0] = rdata_ddr_cmp_sync_en_d1 ? 2'h2 : 2'h1;

/////////////////////////////////////////////////
// ECC Detect and Correct data
/////////////////////////////////////////////////

// scrubbing ecc error signals
assign mcu_l2t0_scb_secc_err_in = readdp_l2_secc_err_dly1 & rdata_scrb0_err_valid & rdata_ddr_cmp_sync_en_d12 |
					rdata_fbd0_recov_err & rdata_ddr_cmp_sync_en_d1;
assign mcu_l2t0_scb_mecc_err_in = readdp_l2_mecc_err_dly1 & rdata_scrb0_err_valid & rdata_ddr_cmp_sync_en_d12 |
					rdata_fbd_unrecov_err_p1_1 & rdata_ddr_cmp_sync_en_d1;
assign mcu_l2t1_scb_secc_err_in = readdp_l2_secc_err_dly1 & rdata_scrb1_err_valid & rdata_ddr_cmp_sync_en_d12 |
					rdata_fbd1_recov_err & rdata_ddr_cmp_sync_en_d1;
assign mcu_l2t1_scb_mecc_err_in = readdp_l2_mecc_err_dly1 & rdata_scrb1_err_valid & rdata_ddr_cmp_sync_en_d12;

mcu_rdata_ctl_msff_ctl_macro__width_4 ff_l2_scb_mecc_secc  (
        .scan_in(ff_l2_scb_mecc_secc_scanin),
        .scan_out(ff_l2_scb_mecc_secc_scanout),
        .din({ mcu_l2t0_scb_mecc_err_in, mcu_l2t0_scb_secc_err_in, mcu_l2t1_scb_mecc_err_in, mcu_l2t1_scb_secc_err_in}),
        .dout({mcu_l2t0_scb_mecc_err,    mcu_l2t0_scb_secc_err,    mcu_l2t1_scb_mecc_err,    mcu_l2t1_scb_secc_err}),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// L2 read ecc error signals
assign rdata_ddr_cmp_sync_en_d23_in = rdata_ddr_cmp_sync_en_d1 | rdata_ddr_cmp_sync_en_d2;
mcu_rdata_ctl_msff_ctl_macro ff_ddr_cmp_sync_en_d23 (
	.scan_in(ff_ddr_cmp_sync_en_d23_scanin),
	.scan_out(ff_ddr_cmp_sync_en_d23_scanout),
	.din(rdata_ddr_cmp_sync_en_d23_in),
	.dout(rdata_ddr_cmp_sync_en_d23),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_rdata_ctl_msff_ctl_macro__width_2 ff_data_valid_d1  (
	.scan_in(ff_data_valid_d1_scanin),
	.scan_out(ff_data_valid_d1_scanout),
	.din({rdata_l2t0_data_valid,rdata_l2t1_data_valid}),
	.dout({rdata_l2t0_data_valid_d1,rdata_l2t1_data_valid_d1}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_rdata_ctl_msff_ctl_macro__width_2 ff_pa_err_p1  (
	.scan_in(ff_pa_err_p1_scanin),
	.scan_out(ff_pa_err_p1_scanout),
	.din({rdata_pa_err_p2, rdata_fbd_unrecov_err_p2_0}),
	.dout({rdata_pa_err_p1, rdata_fbd_unrecov_err_p1_0}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mcu_l2t0_mecc_err_r1 = (readdp_l2_mecc_err_dly1 | rdata_pa_err_p1 | rdata_fbd_unrecov_err_p1_0) & 
				rdata_l2t0_data_valid_d1 & rdata_ddr_cmp_sync_en_d23;
assign mcu_l2t1_mecc_err_r1 = (readdp_l2_mecc_err_dly1 | rdata_pa_err_p1 | rdata_fbd_unrecov_err_p1_0) & 
				rdata_l2t1_data_valid_d1 & rdata_ddr_cmp_sync_en_d23;

assign mcu_l2t0_secc_err_r1 = readdp_l2_secc_err_dly1 & rdata_l2t0_data_valid_d1 & rdata_ddr_cmp_sync_en_d23;
assign mcu_l2t1_secc_err_r1 = readdp_l2_secc_err_dly1 & rdata_l2t1_data_valid_d1 & rdata_ddr_cmp_sync_en_d23; 

// delay the error bits to match up with the data
mcu_rdata_ctl_msff_ctl_macro__width_4 ff_l2_mecc_secc_r2  (
        .scan_in(ff_l2_mecc_secc_r2_scanin),
        .scan_out(ff_l2_mecc_secc_r2_scanout),
        .din({mcu_l2t0_mecc_err_r1, mcu_l2t0_secc_err_r1, mcu_l2t1_mecc_err_r1, mcu_l2t1_secc_err_r1}),
        .dout({mcu_l2t0_mecc_err_r2, mcu_l2t0_secc_err_r2, mcu_l2t1_mecc_err_r2, mcu_l2t1_secc_err_r2}),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_rdata_ctl_msff_ctl_macro__width_4 ff_l2_mecc_secc_r3  (
        .scan_in(ff_l2_mecc_secc_r3_scanin),
        .scan_out(ff_l2_mecc_secc_r3_scanout),
        .din({mcu_l2t0_mecc_err_r2, mcu_l2t0_secc_err_r2, mcu_l2t1_mecc_err_r2, mcu_l2t1_secc_err_r2}),
        .dout({mcu_l2t0_mecc_err_r3, mcu_l2t0_secc_err_r3, mcu_l2t1_mecc_err_r3, mcu_l2t1_secc_err_r3}),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rdata_pa_err_in = (rdata_pa_err_p1 | rdata_fbd_unrecov_err_p1_0) & 
				(rdata_l2t0_data_valid_d1 | rdata_l2t1_data_valid_d1) & rdata_ddr_cmp_sync_en_d23;
mcu_rdata_ctl_msff_ctl_macro ff_pa_err (
	.scan_in(ff_pa_err_scanin),
	.scan_out(ff_pa_err_scanout),
	.din(rdata_pa_err_in),
	.dout(rdata_pa_err),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// MBIST read data

mcu_rdata_ctl_msff_ctl_macro__width_32 ff_mbist_data  (
	.scan_in(ff_mbist_data_scanin),
	.scan_out(ff_mbist_data_scanout),
	.din({wdqrf00_data[7:0],wdqrf01_data[7:0],wdqrf10_data[7:0],wdqrf11_data[7:0]}),
	.dout({wdqrf00_data_reg[7:0],wdqrf01_data_reg[7:0],wdqrf10_data_reg[7:0],wdqrf11_data_reg[7:0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mbist_read_data[7:0] = 
			wdqrf00_data_reg[7:0] & {8{~mbist_sel_bank0or1_d1 & ~mbist_sel_hiorlo_72bits_d1 & mbist_run_d1}} | 
			wdqrf01_data_reg[7:0] & {8{~mbist_sel_bank0or1_d1 &  mbist_sel_hiorlo_72bits_d1 & mbist_run_d1}} | 
			wdqrf10_data_reg[7:0] & {8{ mbist_sel_bank0or1_d1 & ~mbist_sel_hiorlo_72bits_d1 & mbist_run_d1}} | 
			wdqrf11_data_reg[7:0] & {8{ mbist_sel_bank0or1_d1 &  mbist_sel_hiorlo_72bits_d1 & mbist_run_d1}};

// MBIST read enable and address
mcu_rdata_ctl_msff_ctl_macro ff_mbist_run_d1 (
	.scan_in(ff_mbist_addr_scanin),
	.scan_out(ff_mbist_run_d1_scanout),
	.din(mbist_run),
	.dout(mbist_run_d1),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_rdata_ctl_msff_ctl_macro__en_1__width_11 ff_mbist_addr  (
	.scan_in(ff_mbist_run_d1_scanout),
	.scan_out(ff_mbist_addr_scanout),
	.din({mbist_addr[4:0],mbist_sel_bank0or1,mbist_sel_hiorlo_72bits,
		mbist_wdqrf00_rd_en,mbist_wdqrf01_rd_en,mbist_wdqrf10_rd_en,mbist_wdqrf11_rd_en}),
	.dout({mbist_addr_d1[4:0],mbist_sel_bank0or1_d1,mbist_sel_hiorlo_72bits_d1,
		mbist_wdqrf00_rd_en_d1,mbist_wdqrf01_rd_en_d1,mbist_wdqrf10_rd_en_d1,mbist_wdqrf11_rd_en_d1}),
	.en(mbist_run),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mbist_run_d1_l = ~mbist_run_d1;

assign rdata_wdq_radr[4:0] = mbist_run_d1 ? mbist_addr_d1[4:0] : drif_wdq_radr[4:0];
assign rdata0_wdq_rd[0] = mbist_run_d1 ? mbist_wdqrf00_rd_en_d1 : drif0_wdq_rd;
assign rdata0_wdq_rd[1] = mbist_run_d1 ? mbist_wdqrf01_rd_en_d1 : drif0_wdq_rd;
assign rdata1_wdq_rd[0] = mbist_run_d1 ? mbist_wdqrf10_rd_en_d1 : drif1_wdq_rd;
assign rdata1_wdq_rd[1] = mbist_run_d1 ? mbist_wdqrf11_rd_en_d1 : drif1_wdq_rd;

// spare gates 
mcu_rdata_ctl_spare_ctl_macro__num_5 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// fixscan start:
assign ff_mcu_sync_pulses_scanin = scan_in                  ;
assign ff_io_sync_pulses_scanin  = ff_mcu_sync_pulses_scanout;
assign ff_mcu_sync_pulse_delays_scanin = ff_io_sync_pulses_scanout;
assign ff_data_word_cnt_scanin   = ff_mcu_sync_pulse_delays_scanout;
assign ff_ucb_rdata_rd_req_id_scanin = ff_data_word_cnt_scanout ;
assign ff_ucb_rdata_rd_req_id_d1_scanin = ff_ucb_rdata_rd_req_id_scanout;
assign ff_ucb_mecc_err_o_scanin  = ff_ucb_rdata_rd_req_id_d1_scanout;
assign ff_ucb_mecc_err_d1_scanin = ff_ucb_mecc_err_o_scanout;
assign ff_ucb_secc_err_o_scanin  = ff_ucb_mecc_err_d1_scanout;
assign ff_ucb_secc_err_d1_scanin = ff_ucb_secc_err_o_scanout;
assign ff_ucb_err_event_d1_scanin = ff_ucb_secc_err_d1_scanout;
assign ff_ucb_err_event_scanin   = ff_ucb_err_event_d1_scanout;
assign ff_ucb_fbd_error_d1_scanin = ff_ucb_err_event_scanout ;
assign ff_ucb_fbd_error_scanin   = ff_ucb_fbd_error_d1_scanout;
assign ff_mcu_ucb_err_mode_scanin = ff_ucb_fbd_error_scanout ;
assign ff_wr_req_out_cnt_scanin  = ff_mcu_ucb_err_mode_scanout;
assign ff_ucb_wr_req_out1_d1_scanin = ff_wr_req_out_cnt_scanout;
assign ff_ucb_wr_req_out1_scanin = ff_ucb_wr_req_out1_d1_scanout;
assign ff_ucb_wr_req_out0_scanin = ff_ucb_wr_req_out1_scanout;
assign ff_ucb_test_signals_scanin = ff_ucb_wr_req_out0_scanout;
assign ucb_rd_wr_vld_scanin      = ff_ucb_test_signals_scanout;
assign ucb_addr_in_scanin        = ucb_rd_wr_vld_scanout    ;
assign ucb_data_in_scanin        = ucb_addr_in_scanout      ;
assign ff_ucb_err_inj_scanin     = ucb_data_in_scanout      ;
assign ff_partial_bank_mode_scanin = ff_ucb_err_inj_scanout   ;
assign rdata_wr_vld_scanin       = ff_partial_bank_mode_scanout;
assign rdata_rd_vld_scanin       = rdata_wr_vld_scanout     ;
assign ff_rdata_ucb_addr_cpu_scanin = rdata_rd_vld_scanout     ;
assign ff_rdata_ucb_data_cpu_scanin = ff_rdata_ucb_addr_cpu_scanout;
assign ucb_ack_scanin            = ff_rdata_ucb_data_cpu_scanout;
assign ucb_nack_scanin           = ucb_ack_scanout          ;
assign ucb_data_cpu_scanin       = ucb_nack_scanout         ;
assign ff_ecc_intr_scanin        = ucb_data_cpu_scanout     ;
assign ff_fbr_intr_scanin        = ff_ecc_intr_scanout      ;
assign ucb_ack_nack_scanin       = ff_fbr_intr_scanout      ;
assign ucb_data_out_scanin       = ucb_ack_nack_scanout     ;
assign ff_ncu_intr_scanin        = ucb_data_out_scanout     ;
assign ff_serdes_dtm_scanin      = ff_ncu_intr_scanout      ;
assign ff_test_signals_scanin    = ff_serdes_dtm_scanout    ;
assign rdata_ucb_rd_wr_vld_scanin = ff_test_signals_scanout  ;
assign rdata_ucb_addr_in_scanin  = rdata_ucb_rd_wr_vld_scanout;
assign rdata_ucb_data_in_scanin  = rdata_ucb_addr_in_scanout;
assign ff_err_inj_scanin         = rdata_ucb_data_in_scanout;
assign ff_pm_mcus_scanin         = ff_err_inj_scanout       ;
assign rdata_ucb_ack_nack_scanin = ff_pm_mcus_scanout       ;
assign ff_ucb_data_out_scanin    = rdata_ucb_ack_nack_scanout;
assign ff_data_valid_scanin      = ff_ucb_data_out_scanout  ;
assign ff_rd_req_id_scanin       = ff_data_valid_scanout    ;
assign ff_qword_id_scanin        = ff_rd_req_id_scanout     ;
assign ff_scrub_err_valid_scanin = ff_qword_id_scanout      ;
assign ff_pa_err_p2_scanin       = ff_scrub_err_valid_scanout;
assign ff_dbg_trig_scanin        = ff_pa_err_p2_scanout     ;
assign ff_debug_signals_scanin   = ff_dbg_trig_scanout      ;
assign ff_rdata_intr_scanin      = ff_debug_signals_scanout ;
assign ff_serdes_dtm_cpu_scanin  = ff_rdata_intr_scanout    ;
assign ff_ddr_cmp_sync_en_d12_scanin = ff_serdes_dtm_cpu_scanout;
assign ff_l2_scb_mecc_secc_scanin = ff_ddr_cmp_sync_en_d12_scanout;
assign ff_ddr_cmp_sync_en_d23_scanin = ff_l2_scb_mecc_secc_scanout;
assign ff_data_valid_d1_scanin   = ff_ddr_cmp_sync_en_d23_scanout;
assign ff_pa_err_p1_scanin       = ff_data_valid_d1_scanout ;
assign ff_l2_mecc_secc_r2_scanin = ff_pa_err_p1_scanout     ;
assign ff_l2_mecc_secc_r3_scanin = ff_l2_mecc_secc_r2_scanout;
assign ff_pa_err_scanin          = ff_l2_mecc_secc_r3_scanout;
assign ff_mbist_data_scanin      = ff_pa_err_scanout        ;
assign ff_mbist_addr_scanin      = ff_mbist_data_scanout    ;
assign spares_scanin             = ff_mbist_addr_scanout    ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module mcu_rdata_ctl_l1clkhdr_ctl_macro (
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

module mcu_rdata_ctl_msff_ctl_macro__width_2 (
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

module mcu_rdata_ctl_msff_ctl_macro__width_4 (
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

module mcu_rdata_ctl_msff_ctl_macro__width_5 (
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

module mcu_rdata_ctl_msff_ctl_macro__en_1__width_5 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = (din[4:0] & {5{en}}) | (dout[4:0] & ~{5{en}});






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

module mcu_rdata_ctl_msff_ctl_macro__width_1 (
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

module mcu_rdata_ctl_msff_ctl_macro__en_1__width_1 (
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

module mcu_rdata_ctl_msff_ctl_macro__en_1 (
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

module mcu_rdata_ctl_msff_ctl_macro__en_1__width_2 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = (din[1:0] & {2{en}}) | (dout[1:0] & ~{2{en}});






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

module mcu_rdata_ctl_msff_ctl_macro__en_1__width_13 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [12:0] fdin;
wire [11:0] so;

  input [12:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [12:0] dout;
  output scan_out;
assign fdin[12:0] = (din[12:0] & {13{en}}) | (dout[12:0] & ~{13{en}});






dff #(13)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[12:0]),
.si({scan_in,so[11:0]}),
.so({so[11:0],scan_out}),
.q(dout[12:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_rdata_ctl_msff_ctl_macro__en_1__width_64 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = (din[63:0] & {64{en}}) | (dout[63:0] & ~{64{en}});






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_rdata_ctl_msff_ctl_macro__en_1__width_3 (
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

module mcu_rdata_ctl_msff_ctl_macro__clr_1__en_1__width_1 (
  din, 
  en, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}} & ~{1{clr}}) | (dout[0:0] & ~{1{en}} & ~{1{clr}});






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

module mcu_rdata_ctl_msff_ctl_macro__en_1__width_4 (
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

module mcu_rdata_ctl_msff_ctl_macro (
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

module mcu_rdata_ctl_msff_ctl_macro__width_32 (
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

module mcu_rdata_ctl_msff_ctl_macro__en_1__width_11 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [10:0] fdin;
wire [9:0] so;

  input [10:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [10:0] dout;
  output scan_out;
assign fdin[10:0] = (din[10:0] & {11{en}}) | (dout[10:0] & ~{11{en}});






dff #(11)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[10:0]),
.si({scan_in,so[9:0]}),
.so({so[9:0],scan_out}),
.q(dout[10:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module mcu_rdata_ctl_spare_ctl_macro__num_5 (
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
assign scan_out = so_4;



endmodule

