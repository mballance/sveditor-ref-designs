// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_l2if_ctl.v
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
module mcu_l2if_ctl (
  mcu_ucb_rd_req_in, 
  mcu_ucb_wr_req_in, 
  mcu_l2t_rd_ack, 
  mcu_l2t_wr_ack, 
  l2if_mcu_data_mecc, 
  l2if_data_wr_addr, 
  l2if_wdq_rd_inh, 
  l2if_wdq_we, 
  l2if_wdq_wadr, 
  l2if_wdq_in_cntr, 
  l2if_wr_req, 
  l2if_rd_req, 
  l2if_rd_dummy_req, 
  l2if_rd_dummy_req_addr5, 
  l2if_rd_dummy_req_id, 
  l2if_rd_dummy_addr_err, 
  l2if_rd_rank_adr, 
  l2if_rd_dimm_adr, 
  l2if_rd_bank_adr, 
  l2if_rd_ras_adr, 
  l2if_rd_cas_adr, 
  l2if_rd_addr_err, 
  l2if_rd_addr_parity, 
  l2if_rd_req_id, 
  l2if_wr_rank_adr, 
  l2if_wr_dimm_adr, 
  l2if_wr_bank_adr, 
  l2if_wr_ras_adr, 
  l2if_wr_cas_adr, 
  l2if_wr_addr_err, 
  l2if_wr_addr_parity, 
  l2t_mcu_rd_req, 
  l2t_mcu_rd_dummy_req, 
  l2t_mcu_rd_req_id, 
  l2t_mcu_addr, 
  l2t_mcu_wr_req, 
  l2b_mcu_data_vld, 
  l2b_mcu_data_mecc, 
  drq_rdq_free, 
  woq_wdq_entry_free, 
  drif_stacked_dimm, 
  drif_addr_bank_low_sel, 
  drif_mem_type, 
  drif_num_dimms, 
  drif_single_channel_mode, 
  rdata_pm_1mcu, 
  rdata_pm_2mcu, 
  rdpctl_dummy_data_valid, 
  mbist_run, 
  mbist_addr, 
  mbist_wdata_0, 
  mbist_wdqrf0_wr_en, 
  mbist_wdqrf1_wr_en, 
  ccu_mcu_ddr_cmp_sync_en, 
  ccu_mcu_cmp_ddr_sync_en, 
  ccu_mcu_cmp_io_sync_en, 
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
wire l2if_ddr_cmp_sync_en;
wire l2if_cmp_ddr_sync_en;
wire l2if_ddr_cmp_sync_en_d1;
wire ff_mcu_iosync_pulse_scanin;
wire ff_mcu_iosync_pulse_scanout;
wire l2if_cmp_io_sync_en;
wire ff_wr_req_d1_scanin;
wire ff_wr_req_d1_scanout;
wire l2if_wr_req_d1;
wire ff_wr_req_cpu_scanin;
wire ff_wr_req_cpu_scanout;
wire l2if_wr_req_cpu;
wire l2if_wr_ack;
wire ff_rd_req_d1_scanin;
wire ff_rd_req_d1_scanout;
wire l2t_mcu_rd_req_d1;
wire l2t_mcu_rd_dummy_req_d1;
wire [2:0] l2t_mcu_rd_req_id_d1;
wire ff_addr_scanin;
wire ff_addr_scanout;
wire [39:5] l2if_addr;
wire l2if_pm_l_in;
wire ff_partial_mode_scanin;
wire ff_partial_mode_scanout;
wire l2if_pm_l;
wire l2if_pm_1mcu;
wire l2if_pm_2mcu;
wire ff_mbist_signals_scanin;
wire ff_mbist_run_d1_scanout;
wire mbist_run_d1;
wire ff_mbist_signals_scanout;
wire [4:0] mbist_addr_d1;
wire mbist_wdata_0_d1;
wire mbist_wdqrf0_wr_en_d1;
wire mbist_wdqrf1_wr_en_d1;
wire l2if_rd_dummy_req_en;
wire l2if_rd_dummy_req_clr;
wire l2if_rd_dummy_req_cpu;
wire ff_l2if_rd_dummy_req_scanin;
wire ff_l2if_rd_dummy_req_scanout;
wire ff_dummy_req_cpu_scanin;
wire ff_dummy_req_cpu_scanout;
wire adrgen_addr_err;
wire [2:0] l2if_rd_dummy_req_id_cpu;
wire l2if_rd_dummy_req_addr5_cpu;
wire l2if_rd_dummy_addr_err_cpu;
wire ff_dummy_req_data_scanin;
wire ff_dummy_req_data_scanout;
wire ff_dummy_data_valid_d1_scanin;
wire ff_dummy_data_valid_d1_scanout;
wire l2if_dummy_data_valid;
wire l2if_dummy_data_valid_d1;
wire l2if_rd_req_cpu;
wire [2:0] l2if_ibuf_state;
wire [3:0] l2if_rdq_cnt;
wire ff_l2wrreqflop_mcu_scanin;
wire ff_l2wrreqflop_mcu_scanout;
wire ff_wr_addr_scanin;
wire ff_wr_addr_scanout;
wire [5:0] l2if_wr_b0_data_addr;
wire ff_drq_free_scanin;
wire ff_drq_free_scanout;
wire l2if_rdq_free_cpu;
wire l2if_rdq_free;
wire ff_wdq_entry_free_scanin;
wire ff_wdq_entry_free_scanout;
wire [7:0] l2if_wdq_entry_free;
wire ff_dummy_data_valid_scanin;
wire ff_dummy_data_valid_scanout;
wire ff_addr_mode_scanin;
wire ff_addr_mode_scanout;
wire l2if_stacked_dimm;
wire l2if_addr_bank_low_sel;
wire [1:0] l2if_mem_type;
wire [2:0] l2if_num_dimms;
wire l2if_single_channel_mode;
wire [3:0] l2if_rdq_cnt_in;
wire l2if_mcu_rd_ack;
wire ff_rdq_cnt_scanin;
wire ff_rdq_cnt_scanout;
wire mcu_l2t_rd_ack_in;
wire mcu_l2t_rd_ack_p1;
wire ff_rd_ack0_scanin;
wire ff_rd_ack0_scanout;
wire l2if_wr_entry0;
wire l2if_wr_entry1;
wire l2if_wr_entry2;
wire l2if_wr_entry3;
wire l2if_wr_entry4;
wire l2if_wr_entry5;
wire l2if_wr_entry6;
wire l2if_wr_entry7;
wire ff_wr_ack_scanin;
wire ff_wr_ack_scanout;
wire [3:0] l2if_wdq_in_cntr_in;
wire l2if_wdq_in_cntr_en;
wire l2if_b0_data_vld_d1;
wire l2if_b0_data_vld;
wire ff_wdq_in_cntr_cpu_scanin;
wire ff_wdq_in_cntr_cpu_scanout;
wire [3:0] l2if_wdq_in_cntr_cpu;
wire ff_wdq_in_cntr_scanin;
wire ff_wdq_in_cntr_scanout;
wire l2if_mcu_data_mecc_out;
wire ff_data_vld_scanin;
wire ff_data_vld_scanout;
wire [5:0] l2if_wr_b0_data_addr_in;
wire [2:0] l2if_first_wdq_entry_free;
wire ff_b0_data_addr_scanin;
wire ff_b0_data_addr_scanout;
wire l2if_mem_rd_inh_in;
wire l2if_mem_rd_inh;
wire ff_mem_rd_inh_scanin;
wire ff_mem_rd_inh_scanout;
wire l2if_wdq_rd_inh_in;
wire ff_wdq_rd_inh_scanin;
wire ff_wdq_rd_inh_scanout;
wire l2if_wr_entry0_en;
wire l2if_wr_entry0_in;
wire ff_wr_ent0_scanin;
wire ff_wr_ent0_scanout;
wire l2if_wr_entry1_en;
wire l2if_wr_entry1_in;
wire ff_wr_ent1_scanin;
wire ff_wr_ent1_scanout;
wire l2if_wr_entry2_en;
wire l2if_wr_entry2_in;
wire ff_wr_ent2_scanin;
wire ff_wr_ent2_scanout;
wire l2if_wr_entry3_en;
wire l2if_wr_entry3_in;
wire ff_wr_ent3_scanin;
wire ff_wr_ent3_scanout;
wire l2if_wr_entry4_en;
wire l2if_wr_entry4_in;
wire ff_wr_ent4_scanin;
wire ff_wr_ent4_scanout;
wire l2if_wr_entry5_en;
wire l2if_wr_entry5_in;
wire ff_wr_ent5_scanin;
wire ff_wr_ent5_scanout;
wire l2if_wr_entry6_en;
wire l2if_wr_entry6_in;
wire ff_wr_ent6_scanin;
wire ff_wr_ent6_scanout;
wire l2if_wr_entry7_en;
wire l2if_wr_entry7_in;
wire ff_wr_ent7_scanin;
wire ff_wr_ent7_scanout;
wire [6:5] l2if_addr_6to5;
wire [39:9] l2if_addr_39to9;
wire adrgen_addr_err_out;
wire adrgen_scanin;
wire adrgen_scanout;
wire adrgen_rank_adr;
wire [2:0] adrgen_dimm_adr;
wire [2:0] adrgen_bank_adr;
wire [14:0] adrgen_ras_adr;
wire [10:0] adrgen_cas_adr;
wire adrgen_addr_parity;
wire [37:0] l2if_ibuf1_in;
wire ff_ibuf1_scanin;
wire ff_ibuf1_scanout;
wire [37:0] l2if_ibuf1;
wire l2if_rd_adr_qfifo1_en;
wire [37:0] l2if_ibuf0_in;
wire l2if_rd_adr_qfifo0_sel;
wire ff_ibuf0_scanin;
wire ff_ibuf0_scanout;
wire [37:0] l2if_ibuf0;
wire l2if_rd_adr_qfifo0_en;
wire [0:0] inv_next_l2if_ibuf_state;
wire [2:0] next_l2if_ibuf_state;
wire [0:0] inv_l2if_ibuf_state;
wire ff_ibuf_state_scanin;
wire ff_ibuf_state_scanout;
wire l2if_wr_adr_qfifo0_en;
wire l2if_mcu_rd_req;
wire [10:0] adrgen_wr_cas_adr;
wire ff_wraddr_scanin;
wire ff_wraddr_scanout;
wire ucb_l2t_mcu_rd_req_d1;
wire [3:0] mcu_ucb_rd_req_in_l1clk_o;
wire [2:0] ucb_l2t_mcu_rd_req_id_d1;
wire ff_ucb_rd_req_in_scanin;
wire ff_ucb_rd_req_in_scanout;
wire ff_ucb_sync_rd_req_in_scanin;
wire ff_ucb_sync_rd_req_in_scanout;
wire ucb_l2t_mcu_wr_req_d1;
wire mcu_ucb_wr_req_in_l1clk;
wire ff_ucb_wr_req_in_scanin;
wire ff_ucb_wr_req_in_scanout;
wire ff_ucb_sync_wr_req_in_scanin;
wire ff_ucb_sync_wr_req_in_scanout;
wire spares_scanin;
wire spares_scanout;


output [3:0]	mcu_ucb_rd_req_in; // signals to send to dbg via ucb
output		mcu_ucb_wr_req_in; // signals to dbg via ucb

output		mcu_l2t_rd_ack;		// read acknowledge to L2 cache
output		mcu_l2t_wr_ack;		// write acknowledge to L2 cache

output		l2if_mcu_data_mecc;	// To wdq for poisoning write data ecc

// write data queue address
output [2:0]	l2if_data_wr_addr;	// wdq write address to write request queue
output		l2if_wdq_rd_inh;
output [1:0]	l2if_wdq_we;		// write data queue bank write enables
output [4:0]	l2if_wdq_wadr;		// write data queue write address
output [3:0]	l2if_wdq_in_cntr;	// pointer is incremented when all data for a write
					//   has been written to wdq


// Going to mcu clk domain
output		l2if_wr_req;		// write request to drif
output		l2if_rd_req;		// read request to drif

output		l2if_rd_dummy_req;	// dummy request info to rdata
output		l2if_rd_dummy_req_addr5; // dummy request addr bit 5 for qword offset generation
output [2:0]	l2if_rd_dummy_req_id;	// dummy request id to rdata
output		l2if_rd_dummy_addr_err; // address error bit for mecc generation

output		l2if_rd_rank_adr;
output [2:0]	l2if_rd_dimm_adr;
output [2:0]	l2if_rd_bank_adr;
output [14:0]	l2if_rd_ras_adr;
output [10:0]	l2if_rd_cas_adr;
output		l2if_rd_addr_err;
output		l2if_rd_addr_parity;
output [2:0]	l2if_rd_req_id;

output		l2if_wr_rank_adr;
output [2:0]	l2if_wr_dimm_adr;
output [2:0]	l2if_wr_bank_adr;
output [14:0]	l2if_wr_ras_adr;
output [10:0]	l2if_wr_cas_adr;
output		l2if_wr_addr_err;
output		l2if_wr_addr_parity;

// rd interface
input		l2t_mcu_rd_req;		// incoming read request
input		l2t_mcu_rd_dummy_req;	// incoming dummy read request
input [2:0]     l2t_mcu_rd_req_id;	// incoming read request id
input [39:5]	l2t_mcu_addr;

// wr interface
input		l2t_mcu_wr_req;		// incoming write request
input		l2b_mcu_data_vld;	// data valid for write data
input		l2b_mcu_data_mecc;	// poison signal to flip ecc bits for write data

input 	 	drq_rdq_free;		// entry freed in read request queue
input [7:0]	woq_wdq_entry_free;	// write data queue entry to free 

// address mapping signals
input		drif_stacked_dimm;
input		drif_addr_bank_low_sel;
input [1:0]	drif_mem_type;
input [2:0]	drif_num_dimms;
input		drif_single_channel_mode;

input           rdata_pm_1mcu;
input           rdata_pm_2mcu;

input		rdpctl_dummy_data_valid;	// pending rdata_ctl dummy read request clear

input		mbist_run;
input [4:0]	mbist_addr;
input		mbist_wdata_0;
input		mbist_wdqrf0_wr_en;
input		mbist_wdqrf1_wr_en;

// SYNC Pulse
input 		ccu_mcu_ddr_cmp_sync_en; // clock synchonizing signal from mcu to cpu
input 		ccu_mcu_cmp_ddr_sync_en; // clock synchonizing signal from cpu to mcu
//##
input 		ccu_mcu_cmp_io_sync_en; // clock synchonizing signal from cpu to mcu

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

// 0in set_clock l2clk -default
mcu_l2if_ctl_l1clkhdr_ctl_macro clkgen (
 	.l2clk(l2clk),
 	.l1en (1'b1 ),
	.stop(1'b0),
 	.l1clk(l1clk),
  .pce_ov(pce_ov),
  .se(se));

//////////////////////////////////////////////////////////////////
// Flop L2 input requests
//////////////////////////////////////////////////////////////////

mcu_l2if_ctl_msff_ctl_macro__width_3 ff_mcu_sync_pulses  (
	.scan_in(ff_mcu_sync_pulses_scanin),
	.scan_out(ff_mcu_sync_pulses_scanout),
	.din ({ccu_mcu_ddr_cmp_sync_en, ccu_mcu_cmp_ddr_sync_en, l2if_ddr_cmp_sync_en}),
	.dout   ({l2if_ddr_cmp_sync_en, l2if_cmp_ddr_sync_en, l2if_ddr_cmp_sync_en_d1}),
	.l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk));
//## register the cmp_io_sync_en
mcu_l2if_ctl_msff_ctl_macro__width_1 ff_mcu_iosync_pulse  (
	.scan_in(ff_mcu_iosync_pulse_scanin),
	.scan_out(ff_mcu_iosync_pulse_scanout),
	.din    (ccu_mcu_cmp_io_sync_en),
	.dout   (l2if_cmp_io_sync_en),
	.l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_l2if_ctl_msff_ctl_macro__width_1 ff_wr_req_d1  (
	.scan_in(ff_wr_req_d1_scanin),
	.scan_out(ff_wr_req_d1_scanout),
	.din(l2t_mcu_wr_req),
	.dout(l2if_wr_req_d1),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_l2if_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_wr_req_cpu  (
	.scan_in(ff_wr_req_cpu_scanin),
	.scan_out(ff_wr_req_cpu_scanout),
	.din(l2if_wr_req_d1),
	.dout(l2if_wr_req_cpu),
	.en(l2if_wr_req_d1),
	.clr(l2if_wr_ack),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_l2if_ctl_msff_ctl_macro__width_5 ff_rd_req_d1  (
	.scan_in(ff_rd_req_d1_scanin),
	.scan_out(ff_rd_req_d1_scanout),
	.din({l2t_mcu_rd_req,l2t_mcu_rd_dummy_req,l2t_mcu_rd_req_id[2:0]}),
	.dout({l2t_mcu_rd_req_d1,l2t_mcu_rd_dummy_req_d1,l2t_mcu_rd_req_id_d1[2:0]}), .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//assign l2if_rd_req_id[2:0] = l2t_mcu_rd_req_id_d1[2:0];

mcu_l2if_ctl_msff_ctl_macro__width_35 ff_addr  (
	.scan_in(ff_addr_scanin),
	.scan_out(ff_addr_scanout),
	.din(l2t_mcu_addr[39:5]),
	.dout(l2if_addr[39:5]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign l2if_pm_l_in = ~(rdata_pm_1mcu | rdata_pm_2mcu);
mcu_l2if_ctl_msff_ctl_macro__width_3 ff_partial_mode  (
	.scan_in(ff_partial_mode_scanin),
	.scan_out(ff_partial_mode_scanout),
	.din({l2if_pm_l_in, rdata_pm_1mcu, rdata_pm_2mcu}),
	.dout({l2if_pm_l, l2if_pm_1mcu, l2if_pm_2mcu}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_l2if_ctl_msff_ctl_macro ff_mbist_run_d1 (
	.scan_in(ff_mbist_signals_scanin),
	.scan_out(ff_mbist_run_d1_scanout),
	.din(mbist_run),
	.dout(mbist_run_d1),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_l2if_ctl_msff_ctl_macro__en_1__width_8 ff_mbist_signals  (
	.scan_in(ff_mbist_run_d1_scanout),
	.scan_out(ff_mbist_signals_scanout),
	.din({mbist_addr[4:0],mbist_wdata_0,mbist_wdqrf0_wr_en,mbist_wdqrf1_wr_en}),
	.dout({mbist_addr_d1[4:0],mbist_wdata_0_d1,mbist_wdqrf0_wr_en_d1,mbist_wdqrf1_wr_en_d1}),
	.en(mbist_run),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


///////////////////////////////////////////////////////////////////
// dummy request: held until request response goes out; one outstanding
// 	dummy read permitted
///////////////////////////////////////////////////////////////////

assign l2if_rd_dummy_req_en = l2t_mcu_rd_req_d1 & l2t_mcu_rd_dummy_req_d1;
assign l2if_rd_dummy_req_clr = l2if_rd_dummy_req_cpu & l2if_cmp_ddr_sync_en;
mcu_l2if_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_l2if_rd_dummy_req  (
	.scan_in(ff_l2if_rd_dummy_req_scanin),
	.scan_out(ff_l2if_rd_dummy_req_scanout),
	.din(1'b1),
	.dout(l2if_rd_dummy_req_cpu),
	.en(l2if_rd_dummy_req_en),
	.clr(l2if_rd_dummy_req_clr),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_l2if_ctl_msff_ctl_macro__en_1__width_5 ff_dummy_req_cpu  (
	.scan_in(ff_dummy_req_cpu_scanin),
	.scan_out(ff_dummy_req_cpu_scanout),
	.din({l2t_mcu_rd_req_id_d1[2:0],l2if_addr[5],adrgen_addr_err}),
	.dout({l2if_rd_dummy_req_id_cpu[2:0],l2if_rd_dummy_req_addr5_cpu,l2if_rd_dummy_addr_err_cpu}),
	.en(l2if_rd_dummy_req_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_l2if_ctl_msff_ctl_macro__en_1__width_6 ff_dummy_req_data  (
	.scan_in(ff_dummy_req_data_scanin),
	.scan_out(ff_dummy_req_data_scanout),
	.din({l2if_rd_dummy_req_cpu,l2if_rd_dummy_req_id_cpu[2:0],l2if_rd_dummy_req_addr5_cpu,l2if_rd_dummy_addr_err_cpu}),
	.dout({l2if_rd_dummy_req,l2if_rd_dummy_req_id[2:0],l2if_rd_dummy_req_addr5,l2if_rd_dummy_addr_err}),
	.en(l2if_cmp_ddr_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_l2if_ctl_msff_ctl_macro ff_dummy_data_valid_d1 (
	.scan_in(ff_dummy_data_valid_d1_scanin),
	.scan_out(ff_dummy_data_valid_d1_scanout),
	.din(l2if_dummy_data_valid),
	.dout(l2if_dummy_data_valid_d1),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////////////////////
// SIGNALS FROM CPU CLK TO DRAM CLK
/////////////////////////////////////////////////

assign l2if_rd_req_cpu = ~l2if_ibuf_state[0] & ~l2if_rdq_cnt[3];

// write and read req valids
mcu_l2if_ctl_msff_ctl_macro__en_1__width_2 ff_l2wrreqflop_mcu  (
	.scan_in(ff_l2wrreqflop_mcu_scanin),
	.scan_out(ff_l2wrreqflop_mcu_scanout),
	.din({l2if_wr_ack,l2if_rd_req_cpu}),
	.dout({l2if_wr_req,l2if_rd_req}),
	.en(l2if_cmp_ddr_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// data write address into mem
mcu_l2if_ctl_msff_ctl_macro__en_1__width_3 ff_wr_addr  (
	.scan_in(ff_wr_addr_scanin),
	.scan_out(ff_wr_addr_scanout),
	.din(l2if_wr_b0_data_addr[5:3]),
	.dout(l2if_data_wr_addr[2:0]),
	.en(l2if_cmp_ddr_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////////////////////
// SIGNALS FROM DRAM CLK TO CPU CLK
/////////////////////////////////////////////////

// mcu to cpu clk domain of the buffer valids
mcu_l2if_ctl_msff_ctl_macro__en_1__width_1 ff_drq_free  (
	.scan_in(ff_drq_free_scanin),
	.scan_out(ff_drq_free_scanout),
	.din(drq_rdq_free),
	.dout(l2if_rdq_free_cpu),
	.en(l2if_ddr_cmp_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign l2if_rdq_free = l2if_rdq_free_cpu & l2if_ddr_cmp_sync_en_d1;

// flop write data entry free
mcu_l2if_ctl_msff_ctl_macro__en_1__width_8 ff_wdq_entry_free  (
	.scan_in(ff_wdq_entry_free_scanin),
	.scan_out(ff_wdq_entry_free_scanout),
	.din(woq_wdq_entry_free[7:0]),
	.dout(l2if_wdq_entry_free[7:0]),
	.en(l2if_ddr_cmp_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_l2if_ctl_msff_ctl_macro__en_1 ff_dummy_data_valid  (
	.scan_in(ff_dummy_data_valid_scanin),
	.scan_out(ff_dummy_data_valid_scanout),
	.din(rdpctl_dummy_data_valid),
	.dout(l2if_dummy_data_valid),
	.en(l2if_ddr_cmp_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_l2if_ctl_msff_ctl_macro__en_1__width_8 ff_addr_mode  (
	.scan_in(ff_addr_mode_scanin),
	.scan_out(ff_addr_mode_scanout),
	.din({drif_stacked_dimm,drif_addr_bank_low_sel,drif_mem_type[1:0],drif_num_dimms[2:0],drif_single_channel_mode}),
	.dout({l2if_stacked_dimm,l2if_addr_bank_low_sel,l2if_mem_type[1:0],l2if_num_dimms[2:0],l2if_single_channel_mode}),
	.en(l2if_ddr_cmp_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// Generate the ack for L2
//////////////////////////////////////////////////////////////////

// keep track of outstanding read requests; L2 may send another request before req id is cleared
// from read request queue
assign l2if_rdq_cnt_in[3:0] = l2if_mcu_rd_ack & ~l2if_rdq_free ? l2if_rdq_cnt[3:0] + 4'h1 :
			~l2if_mcu_rd_ack & l2if_rdq_free ? l2if_rdq_cnt[3:0] - 4'h1 : l2if_rdq_cnt[3:0];

mcu_l2if_ctl_msff_ctl_macro__width_4 ff_rdq_cnt  (
	.scan_in(ff_rdq_cnt_scanin),
	.scan_out(ff_rdq_cnt_scanout),
	.din(l2if_rdq_cnt_in[3:0]),
	.dout(l2if_rdq_cnt[3:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Read Ack 

// domain crossing ack - input to 2-deep read request buffer state machine
assign l2if_mcu_rd_ack = l2if_rd_req_cpu & l2if_cmp_ddr_sync_en;

// ack based on 2-deep buffer requests
assign mcu_l2t_rd_ack_in = mcu_l2t_rd_ack_p1 | l2if_dummy_data_valid & ~l2if_dummy_data_valid_d1;
mcu_l2if_ctl_msff_ctl_macro__width_1 ff_rd_ack0  (
	.scan_in(ff_rd_ack0_scanin),
	.scan_out(ff_rd_ack0_scanout),
	.din(mcu_l2t_rd_ack_in),
	.dout(mcu_l2t_rd_ack),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Write Ack logic
assign l2if_wr_ack = ~(l2if_wr_entry0 & l2if_wr_entry1 & l2if_wr_entry2 & l2if_wr_entry3 & 
			l2if_wr_entry4 & l2if_wr_entry5 & l2if_wr_entry6 & l2if_wr_entry7) & 
				l2if_wr_req_cpu & l2if_cmp_ddr_sync_en; 

mcu_l2if_ctl_msff_ctl_macro__width_1 ff_wr_ack  (
	.scan_in(ff_wr_ack_scanin),
	.scan_out(ff_wr_ack_scanout),
	.din(l2if_wr_ack),
	.dout(mcu_l2t_wr_ack),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Find falling edge of data valid signal to increment wdq pointer.  This counter 
// value is used by drq in mcu clock domain to know when all write data is in the 
// wdq.

assign l2if_wdq_in_cntr_in[3:0] = l2if_wdq_in_cntr[3:0] + 4'h1;
assign l2if_wdq_in_cntr_en = l2if_b0_data_vld_d1 & ~l2if_b0_data_vld & ~l2if_wr_addr_err;

mcu_l2if_ctl_msff_ctl_macro__en_1__width_4 ff_wdq_in_cntr_cpu  (
	.scan_in(ff_wdq_in_cntr_cpu_scanin),
	.scan_out(ff_wdq_in_cntr_cpu_scanout),
	.din(l2if_wdq_in_cntr_in[3:0]),
	.dout(l2if_wdq_in_cntr_cpu[3:0]),
	.en(l2if_wdq_in_cntr_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_l2if_ctl_msff_ctl_macro__en_1__width_4 ff_wdq_in_cntr  (
	.scan_in(ff_wdq_in_cntr_scanin),
	.scan_out(ff_wdq_in_cntr_scanout),
	.din(l2if_wdq_in_cntr_cpu[3:0]),
	.dout(l2if_wdq_in_cntr[3:0]),
	.en(l2if_cmp_ddr_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// Generate address and enable for writing data into arrays.
//////////////////////////////////////////////////////////////////

assign l2if_mcu_data_mecc = mbist_run_d1 ? mbist_wdata_0_d1 : l2if_mcu_data_mecc_out;

// stage data valid 
mcu_l2if_ctl_msff_ctl_macro__width_3 ff_data_vld   (
	.scan_in(ff_data_vld_scanin),
	.scan_out(ff_data_vld_scanout),
	.din({l2b_mcu_data_vld, l2if_b0_data_vld, l2b_mcu_data_mecc}),
	.dout({l2if_b0_data_vld, l2if_b0_data_vld_d1, l2if_mcu_data_mecc_out}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// generate enable for write
assign l2if_wdq_we[1:0] = mbist_run_d1 ? {mbist_wdqrf1_wr_en_d1, mbist_wdqrf0_wr_en_d1} : {2{l2if_b0_data_vld}} & {~l2if_wr_b0_data_addr[0],l2if_wr_b0_data_addr[0]};

// generate the index into the array
// When data valid is high just increment the address to write into that location.
// When its low, eval only when the data valid is just gone low and there is no pending req at that time
// and also tha there is some entry empty. If all entries are occupied, then check for entry that's
// getting free and make that as free entry. By default it will keep its old value.
assign l2if_wr_b0_data_addr_in[5:0] = l2if_b0_data_vld ? {l2if_wr_b0_data_addr[5:3], l2if_wr_b0_data_addr[2:0] + 3'h1} : 
		       (~l2if_wr_entry0 & ~l2if_wr_req_cpu & l2if_b0_data_vld_d1 ? 6'h0 :
			~l2if_wr_entry1 & ~l2if_wr_req_cpu & l2if_b0_data_vld_d1 ? 6'h8 :
			~l2if_wr_entry2 & ~l2if_wr_req_cpu & l2if_b0_data_vld_d1 ? 6'h10 :
			~l2if_wr_entry3 & ~l2if_wr_req_cpu & l2if_b0_data_vld_d1 ? 6'h18 :
			~l2if_wr_entry4 & ~l2if_wr_req_cpu & l2if_b0_data_vld_d1 ? 6'h20 :
			~l2if_wr_entry5 & ~l2if_wr_req_cpu & l2if_b0_data_vld_d1 ? 6'h28 :
			~l2if_wr_entry6 & ~l2if_wr_req_cpu & l2if_b0_data_vld_d1 ? 6'h30 : 
			~l2if_wr_entry7 & ~l2if_wr_req_cpu & l2if_b0_data_vld_d1 ? 6'h38 : 
		l2if_wr_entry0 & l2if_wr_entry1 & l2if_wr_entry2 & l2if_wr_entry3 & 
		l2if_wr_entry4 & l2if_wr_entry5 & l2if_wr_entry6 & l2if_wr_entry7 & 
		(|l2if_wdq_entry_free[7:0]) ? {l2if_first_wdq_entry_free[2:0],3'h0} : 
			l2if_wr_b0_data_addr[5:0]);

assign l2if_first_wdq_entry_free[2:0] = l2if_wdq_entry_free[1] ? 3'h1 :
					l2if_wdq_entry_free[2] ? 3'h2 :
					l2if_wdq_entry_free[3] ? 3'h3 :
					l2if_wdq_entry_free[4] ? 3'h4 :
					l2if_wdq_entry_free[5] ? 3'h5 :
					l2if_wdq_entry_free[6] ? 3'h6 :
					l2if_wdq_entry_free[7] ? 3'h7 : 3'h0;

mcu_l2if_ctl_msff_ctl_macro__width_6 ff_b0_data_addr   (
	.scan_in(ff_b0_data_addr_scanin),
	.scan_out(ff_b0_data_addr_scanout),
	.din(l2if_wr_b0_data_addr_in[5:0]),
	.dout(l2if_wr_b0_data_addr[5:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign l2if_wdq_wadr[4:0] = mbist_run_d1 ? mbist_addr_d1[4:0] : l2if_wr_b0_data_addr[5:1];

assign l2if_mem_rd_inh_in = l2if_wr_ack ? 1'b1 : l2if_wr_b0_data_addr[2:0] == 3'h7 ? 1'b0 : l2if_mem_rd_inh;

mcu_l2if_ctl_msff_ctl_macro ff_mem_rd_inh (
	.scan_in(ff_mem_rd_inh_scanin),
	.scan_out(ff_mem_rd_inh_scanout),
	.din(l2if_mem_rd_inh_in),
	.dout(l2if_mem_rd_inh),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign l2if_wdq_rd_inh_in = l2if_wr_ack | l2if_mem_rd_inh;
mcu_l2if_ctl_msff_ctl_macro__en_1 ff_wdq_rd_inh  (
	.scan_in(ff_wdq_rd_inh_scanin),
	.scan_out(ff_wdq_rd_inh_scanout),
	.din(l2if_wdq_rd_inh_in),
	.dout(l2if_wdq_rd_inh),
	.en(l2if_cmp_ddr_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Keep track of in use wdq entries. A 1 means its in use or else free.
// Keep it free if there was address error in write address. The write is silently dropped.
assign l2if_wr_entry0_en = l2if_wdq_entry_free[0] | ~l2if_wr_addr_err & l2if_b0_data_vld & ~l2if_b0_data_vld_d1 & 
				(l2if_wr_b0_data_addr[5:3] == 3'h0);
assign l2if_wr_entry0_in = ~l2if_wdq_entry_free[0];

mcu_l2if_ctl_msff_ctl_macro__en_1__width_1 ff_wr_ent0  (
	.scan_in(ff_wr_ent0_scanin),
	.scan_out(ff_wr_ent0_scanout),
	.din(l2if_wr_entry0_in),
	.dout(l2if_wr_entry0),
	.en(l2if_wr_entry0_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign l2if_wr_entry1_en = l2if_wdq_entry_free[1] | ~l2if_wr_addr_err & l2if_b0_data_vld & ~l2if_b0_data_vld_d1 & 
			(l2if_wr_b0_data_addr[5:3] == 3'h1);
assign l2if_wr_entry1_in = ~l2if_wdq_entry_free[1];

mcu_l2if_ctl_msff_ctl_macro__en_1__width_1 ff_wr_ent1  (
	.scan_in(ff_wr_ent1_scanin),
	.scan_out(ff_wr_ent1_scanout),
	.din(l2if_wr_entry1_in),
	.dout(l2if_wr_entry1),
	.en(l2if_wr_entry1_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign l2if_wr_entry2_en = l2if_wdq_entry_free[2] | ~l2if_wr_addr_err & l2if_b0_data_vld & ~l2if_b0_data_vld_d1 & 
			(l2if_wr_b0_data_addr[5:3] == 3'h2);
assign l2if_wr_entry2_in = ~l2if_wdq_entry_free[2];

mcu_l2if_ctl_msff_ctl_macro__en_1__width_1 ff_wr_ent2  (
	.scan_in(ff_wr_ent2_scanin),
	.scan_out(ff_wr_ent2_scanout),
	.din(l2if_wr_entry2_in),
	.dout(l2if_wr_entry2),
	.en(l2if_wr_entry2_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign l2if_wr_entry3_en = l2if_wdq_entry_free[3] | ~l2if_wr_addr_err & l2if_b0_data_vld & ~l2if_b0_data_vld_d1 & 
			(l2if_wr_b0_data_addr[5:3] == 3'h3);
assign l2if_wr_entry3_in = ~l2if_wdq_entry_free[3];

mcu_l2if_ctl_msff_ctl_macro__en_1__width_1 ff_wr_ent3  (
	.scan_in(ff_wr_ent3_scanin),
	.scan_out(ff_wr_ent3_scanout),
	.din(l2if_wr_entry3_in),
	.dout(l2if_wr_entry3),
	.en(l2if_wr_entry3_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign l2if_wr_entry4_en = l2if_wdq_entry_free[4] | ~l2if_wr_addr_err & l2if_b0_data_vld & ~l2if_b0_data_vld_d1 & 
			(l2if_wr_b0_data_addr[5:3] == 3'h4);
assign l2if_wr_entry4_in = ~l2if_wdq_entry_free[4];

mcu_l2if_ctl_msff_ctl_macro__en_1__width_1 ff_wr_ent4  (
	.scan_in(ff_wr_ent4_scanin),
	.scan_out(ff_wr_ent4_scanout),
	.din(l2if_wr_entry4_in),
	.dout(l2if_wr_entry4),
	.en(l2if_wr_entry4_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign l2if_wr_entry5_en = l2if_wdq_entry_free[5] | ~l2if_wr_addr_err & l2if_b0_data_vld & ~l2if_b0_data_vld_d1 & 
			(l2if_wr_b0_data_addr[5:3] == 3'h5);
assign l2if_wr_entry5_in = ~l2if_wdq_entry_free[5];

mcu_l2if_ctl_msff_ctl_macro__en_1__width_1 ff_wr_ent5  (
	.scan_in(ff_wr_ent5_scanin),
	.scan_out(ff_wr_ent5_scanout),
	.din(l2if_wr_entry5_in),
	.dout(l2if_wr_entry5),
	.en(l2if_wr_entry5_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign l2if_wr_entry6_en = l2if_wdq_entry_free[6] | ~l2if_wr_addr_err & l2if_b0_data_vld & ~l2if_b0_data_vld_d1 & 
			(l2if_wr_b0_data_addr[5:3] == 3'h6);
assign l2if_wr_entry6_in = ~l2if_wdq_entry_free[6];

mcu_l2if_ctl_msff_ctl_macro__en_1__width_1 ff_wr_ent6  (
	.scan_in(ff_wr_ent6_scanin),
	.scan_out(ff_wr_ent6_scanout),
	.din(l2if_wr_entry6_in),
	.dout(l2if_wr_entry6),
	.en(l2if_wr_entry6_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign l2if_wr_entry7_en = l2if_wdq_entry_free[7] | ~l2if_wr_addr_err & l2if_b0_data_vld & ~l2if_b0_data_vld_d1 & 
			(l2if_wr_b0_data_addr[5:3] == 3'h7);
assign l2if_wr_entry7_in = ~l2if_wdq_entry_free[7];

mcu_l2if_ctl_msff_ctl_macro__en_1__width_1 ff_wr_ent7  (
	.scan_in(ff_wr_ent7_scanin),
	.scan_out(ff_wr_ent7_scanout),
	.din(l2if_wr_entry7_in),
	.dout(l2if_wr_entry7),
	.en(l2if_wr_entry7_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////////
// Address mapping
//////////////////////////////////////////////////////////////////////

assign l2if_addr_6to5[6:5] = l2if_addr[6:5];
assign l2if_addr_39to9[39:9] =  {31{l2if_pm_l}}    & l2if_addr[39:9] |
				{31{l2if_pm_2mcu}} & l2if_addr[38:8] |
				{31{l2if_pm_1mcu}} & l2if_addr[37:7];

assign adrgen_addr_err = adrgen_addr_err_out | 
			l2if_addr[39] & (l2if_pm_2mcu | l2if_pm_1mcu | l2if_single_channel_mode) |
			l2if_addr[38] & (l2if_pm_1mcu | l2if_pm_2mcu & l2if_single_channel_mode) |
			l2if_addr[37] & l2if_pm_1mcu & l2if_single_channel_mode;

mcu_adrgen_ctl adrgen (
	.scan_in(adrgen_scanin),
	.scan_out(adrgen_scanout),
	.l1clk(l1clk),
	.adrgen_rank(adrgen_rank_adr),
	.adrgen_dimm(adrgen_dimm_adr[2:0]),
	.adrgen_bank(adrgen_bank_adr[2:0]),
	.adrgen_row_addr(adrgen_ras_adr[14:0]),
	.adrgen_col_addr(adrgen_cas_adr[10:0]),
	.adrgen_addr_err(adrgen_addr_err_out),
	.adrgen_addr_parity(adrgen_addr_parity),
	.addr_39to9(l2if_addr_39to9[39:9]),
	.addr_6to5(l2if_addr_6to5[6:5]),
	.stacked_dimm(l2if_stacked_dimm),
	.addr_bank_low_sel(l2if_addr_bank_low_sel),
	.mem_type(l2if_mem_type[1:0]),
	.sngl_chnl_mode(l2if_single_channel_mode),
	.num_dimms(l2if_num_dimms[2:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

//////////////////////////////////////////////////////////////////////
// Two-entry input fifo for read requests
//////////////////////////////////////////////////////////////////////

assign l2if_ibuf1_in[37:0] = {adrgen_addr_err,adrgen_addr_parity,adrgen_rank_adr,adrgen_dimm_adr[2:0],
		adrgen_bank_adr[2:0],adrgen_ras_adr[14:0],adrgen_cas_adr[10:0],l2t_mcu_rd_req_id_d1[2:0]};

mcu_l2if_ctl_msff_ctl_macro__en_1__width_38 ff_ibuf1  (
	.scan_in(ff_ibuf1_scanin),
	.scan_out(ff_ibuf1_scanout),
	.din(l2if_ibuf1_in[37:0]),
	.dout(l2if_ibuf1[37:0]),
	.en(l2if_rd_adr_qfifo1_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign l2if_ibuf0_in[37:0] = l2if_rd_adr_qfifo0_sel ? l2if_ibuf1[37:0] : l2if_ibuf1_in[37:0];

mcu_l2if_ctl_msff_ctl_macro__en_1__width_38 ff_ibuf0  (
	.scan_in(ff_ibuf0_scanin),
	.scan_out(ff_ibuf0_scanout),
	.din(l2if_ibuf0_in[37:0]),
	.dout(l2if_ibuf0[37:0]),
	.en(l2if_rd_adr_qfifo0_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign {l2if_rd_addr_err,l2if_rd_addr_parity,l2if_rd_rank_adr,l2if_rd_dimm_adr[2:0],l2if_rd_bank_adr[2:0],
	l2if_rd_ras_adr[14:0], l2if_rd_cas_adr[10:0],l2if_rd_req_id[2:0]} = l2if_ibuf0[37:0];

//////////////////////////////////////////////////////////////////////
// State machine to control the two-entry input fifo for read requests
//////////////////////////////////////////////////////////////////////

assign inv_next_l2if_ibuf_state[0] = ~next_l2if_ibuf_state[0];
assign l2if_ibuf_state[0] = ~inv_l2if_ibuf_state[0];

// 0in one_hot -var l2if_ibuf_state[2:0]
mcu_l2if_ctl_msff_ctl_macro__width_3 ff_ibuf_state  (
	.scan_in(ff_ibuf_state_scanin),
	.scan_out(ff_ibuf_state_scanout),
	.din({next_l2if_ibuf_state[2:1],inv_next_l2if_ibuf_state[0]}),
	.dout({l2if_ibuf_state[2:1],inv_l2if_ibuf_state[0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign l2if_wr_adr_qfifo0_en = l2if_wr_req_d1;
assign l2if_mcu_rd_req = l2t_mcu_rd_req_d1 & ~l2t_mcu_rd_dummy_req_d1;

assign mcu_l2t_rd_ack_p1 = l2if_ibuf_state[0] & l2if_mcu_rd_req |
				l2if_ibuf_state[1] & l2if_mcu_rd_ack & l2if_mcu_rd_req | 
				l2if_ibuf_state[2] & l2if_mcu_rd_ack;
assign l2if_rd_adr_qfifo0_en = mcu_l2t_rd_ack_p1;
assign l2if_rd_adr_qfifo0_sel = l2if_ibuf_state[2] & l2if_mcu_rd_ack;
assign l2if_rd_adr_qfifo1_en = l2if_ibuf_state[1] & l2if_mcu_rd_req & ~l2if_mcu_rd_ack;

assign next_l2if_ibuf_state[2] = l2if_ibuf_state[1] & l2if_mcu_rd_req & ~l2if_mcu_rd_ack | 
				 l2if_ibuf_state[2] & ~l2if_mcu_rd_ack;
assign next_l2if_ibuf_state[1] = l2if_ibuf_state[0] & l2if_mcu_rd_req |
				 l2if_ibuf_state[1] & (l2if_mcu_rd_ack & l2if_mcu_rd_req | ~l2if_mcu_rd_ack & ~l2if_mcu_rd_req) | 
				 l2if_ibuf_state[2] & l2if_mcu_rd_ack;
assign next_l2if_ibuf_state[0] = l2if_ibuf_state[1] & l2if_mcu_rd_ack & ~l2if_mcu_rd_req |
				 l2if_ibuf_state[0] & ~l2if_mcu_rd_req;

///////////////////////////////////////////////////////
// Input register for write address 
///////////////////////////////////////////////////////

// mask off bit 2 (32-byte alignment bit) if in single channel mode
// bits 1 and 0 are always 1'b0 for writes
assign adrgen_wr_cas_adr[10:0] = {adrgen_cas_adr[10:3], adrgen_cas_adr[2] & ~l2if_single_channel_mode, 2'h0};

mcu_l2if_ctl_msff_ctl_macro__en_1__width_35 ff_wraddr  (
	.scan_in(ff_wraddr_scanin),
	.scan_out(ff_wraddr_scanout),
	.din({adrgen_addr_err,adrgen_addr_parity,adrgen_rank_adr,adrgen_dimm_adr[2:0],
		adrgen_bank_adr[2:0],adrgen_ras_adr[14:0], adrgen_wr_cas_adr[10:0]}),
	.dout({l2if_wr_addr_err,l2if_wr_addr_parity,l2if_wr_rank_adr,l2if_wr_dimm_adr[2:0],
		l2if_wr_bank_adr[2:0],l2if_wr_ras_adr[14:0],l2if_wr_cas_adr[10:0]}),
	.en(l2if_wr_adr_qfifo0_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//always @(l2if_mcu_rd_req or l2if_mcu_rd_ack or l2if_ibuf_state) begin
//      next_l2if_ibuf_state[2:0] = l2if_ibuf_state[2:0];
//      l2if_rd_adr_qfifo0_en = 1'b0;
//      l2if_rd_adr_qfifo0_sel = 1'b0;
//      l2if_rd_adr_qfifo1_en = 1'b0;
//	mcu_l2t_rd_ack_p1 = 1'b0;
//
//	case (1'b1) // synopsys full_case parallel_case
//
//	// No entries used
//	l2if_ibuf_state[0]: if (l2if_mcu_rd_req) begin
//	   	next_l2if_ibuf_state[2:0] = 3'b010;
//	   	l2if_rd_adr_qfifo0_en = 1'b1;
//	   	l2if_rd_adr_qfifo0_sel = 1'b0;
//	   	mcu_l2t_rd_ack_p1 = 1'b1;
//	end 
//
//	// One entry used
//	l2if_ibuf_state[1]: if (l2if_mcu_rd_req & ~l2if_mcu_rd_ack) begin
//	   	next_l2if_ibuf_state[2:0] = 3'b100;
//	   	l2if_rd_adr_qfifo1_en = 1'b1;
//	end 
//	else if (l2if_mcu_rd_ack & ~l2if_mcu_rd_req) begin
//		next_l2if_ibuf_state[2:0] = 3'b001;
//	end
//	else if (l2if_mcu_rd_ack & l2if_mcu_rd_req) begin
//		next_l2if_ibuf_state[2:0] = 3'b010;
//		l2if_rd_adr_qfifo0_en = 1'b1;
//		l2if_rd_adr_qfifo0_sel = 1'b0;
//		mcu_l2t_rd_ack_p1 = 1'b1;
//	end
//
//	// Both entries used
//	l2if_ibuf_state[2]: if (l2if_mcu_rd_ack) begin
//	   	next_l2if_ibuf_state[2:0] = 3'b010;
//	   	l2if_rd_adr_qfifo0_en = 1'b1;
//	   	l2if_rd_adr_qfifo0_sel = 1'b1;
//	   	mcu_l2t_rd_ack_p1 = 1'b1;
//	end
//
//	default: ;
//
//	endcase
//end

//## implement the crossing domain logic
assign ucb_l2t_mcu_rd_req_d1 = l2t_mcu_rd_req_d1 ? 1'b1 : l2if_cmp_io_sync_en ? 1'b0 : mcu_ucb_rd_req_in_l1clk_o[3];
assign ucb_l2t_mcu_rd_req_id_d1[2:0] = l2t_mcu_rd_req_d1 ? l2t_mcu_rd_req_id_d1[2:0] : 
					l2if_cmp_io_sync_en ? 3'h0 : mcu_ucb_rd_req_in_l1clk_o[2:0];

mcu_l2if_ctl_msff_ctl_macro__width_4 ff_ucb_rd_req_in  (
        .scan_in(ff_ucb_rd_req_in_scanin),
        .scan_out(ff_ucb_rd_req_in_scanout),
        .din({ucb_l2t_mcu_rd_req_d1, ucb_l2t_mcu_rd_req_id_d1[2:0]}),
        .dout(mcu_ucb_rd_req_in_l1clk_o[3:0]),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));
mcu_l2if_ctl_msff_ctl_macro__en_1__width_4 ff_ucb_sync_rd_req_in   (
        .scan_in(ff_ucb_sync_rd_req_in_scanin),
        .scan_out(ff_ucb_sync_rd_req_in_scanout),
        .din (mcu_ucb_rd_req_in_l1clk_o[3:0]),
        .dout (mcu_ucb_rd_req_in[3:0]),
        .en (l2if_cmp_io_sync_en),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ucb_l2t_mcu_wr_req_d1 = l2if_wr_req_d1 ? 1'b1 : l2if_cmp_io_sync_en ? 1'b0 : mcu_ucb_wr_req_in_l1clk ;

mcu_l2if_ctl_msff_ctl_macro__width_1 ff_ucb_wr_req_in  (
        .scan_in(ff_ucb_wr_req_in_scanin),
        .scan_out(ff_ucb_wr_req_in_scanout),
        .din(ucb_l2t_mcu_wr_req_d1),
        .dout(mcu_ucb_wr_req_in_l1clk),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_l2if_ctl_msff_ctl_macro__en_1__width_1 ff_ucb_sync_wr_req_in   (
        .scan_in(ff_ucb_sync_wr_req_in_scanin),
        .scan_out(ff_ucb_sync_wr_req_in_scanout),
        .din(mcu_ucb_wr_req_in_l1clk),
        .dout(mcu_ucb_wr_req_in),
        .en (l2if_cmp_io_sync_en),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// spare gates 
mcu_l2if_ctl_spare_ctl_macro__num_4 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// fixscan start:
assign ff_mcu_sync_pulses_scanin = scan_in                  ;
assign ff_mcu_iosync_pulse_scanin = ff_mcu_sync_pulses_scanout;
assign ff_wr_req_d1_scanin       = ff_mcu_iosync_pulse_scanout;
assign ff_wr_req_cpu_scanin      = ff_wr_req_d1_scanout     ;
assign ff_rd_req_d1_scanin       = ff_wr_req_cpu_scanout    ;
assign ff_addr_scanin            = ff_rd_req_d1_scanout     ;
assign ff_partial_mode_scanin    = ff_addr_scanout          ;
assign ff_mbist_signals_scanin   = ff_partial_mode_scanout  ;
assign ff_l2if_rd_dummy_req_scanin = ff_mbist_signals_scanout ;
assign ff_dummy_req_cpu_scanin   = ff_l2if_rd_dummy_req_scanout;
assign ff_dummy_req_data_scanin  = ff_dummy_req_cpu_scanout ;
assign ff_dummy_data_valid_d1_scanin = ff_dummy_req_data_scanout;
assign ff_l2wrreqflop_mcu_scanin = ff_dummy_data_valid_d1_scanout;
assign ff_wr_addr_scanin         = ff_l2wrreqflop_mcu_scanout;
assign ff_drq_free_scanin        = ff_wr_addr_scanout       ;
assign ff_wdq_entry_free_scanin  = ff_drq_free_scanout      ;
assign ff_dummy_data_valid_scanin = ff_wdq_entry_free_scanout;
assign ff_addr_mode_scanin       = ff_dummy_data_valid_scanout;
assign ff_rdq_cnt_scanin         = ff_addr_mode_scanout     ;
assign ff_rd_ack0_scanin         = ff_rdq_cnt_scanout       ;
assign ff_wr_ack_scanin          = ff_rd_ack0_scanout       ;
assign ff_wdq_in_cntr_cpu_scanin = ff_wr_ack_scanout        ;
assign ff_wdq_in_cntr_scanin     = ff_wdq_in_cntr_cpu_scanout;
assign ff_data_vld_scanin        = ff_wdq_in_cntr_scanout   ;
assign ff_b0_data_addr_scanin    = ff_data_vld_scanout      ;
assign ff_mem_rd_inh_scanin      = ff_b0_data_addr_scanout  ;
assign ff_wdq_rd_inh_scanin      = ff_mem_rd_inh_scanout    ;
assign ff_wr_ent0_scanin         = ff_wdq_rd_inh_scanout    ;
assign ff_wr_ent1_scanin         = ff_wr_ent0_scanout       ;
assign ff_wr_ent2_scanin         = ff_wr_ent1_scanout       ;
assign ff_wr_ent3_scanin         = ff_wr_ent2_scanout       ;
assign ff_wr_ent4_scanin         = ff_wr_ent3_scanout       ;
assign ff_wr_ent5_scanin         = ff_wr_ent4_scanout       ;
assign ff_wr_ent6_scanin         = ff_wr_ent5_scanout       ;
assign ff_wr_ent7_scanin         = ff_wr_ent6_scanout       ;
assign adrgen_scanin             = ff_wr_ent7_scanout       ;
assign ff_ibuf1_scanin           = adrgen_scanout           ;
assign ff_ibuf0_scanin           = ff_ibuf1_scanout         ;
assign ff_ibuf_state_scanin      = ff_ibuf0_scanout         ;
assign ff_wraddr_scanin          = ff_ibuf_state_scanout    ;
assign ff_ucb_rd_req_in_scanin   = ff_wraddr_scanout        ;
assign ff_ucb_sync_rd_req_in_scanin = ff_ucb_rd_req_in_scanout ;
assign ff_ucb_wr_req_in_scanin   = ff_ucb_sync_rd_req_in_scanout;
assign ff_ucb_sync_wr_req_in_scanin = ff_ucb_wr_req_in_scanout ;
assign spares_scanin             = ff_ucb_sync_wr_req_in_scanout;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule // mcu_l2if 






// any PARAMS parms go into naming of macro

module mcu_l2if_ctl_l1clkhdr_ctl_macro (
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

module mcu_l2if_ctl_msff_ctl_macro__width_3 (
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

module mcu_l2if_ctl_msff_ctl_macro__width_1 (
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

module mcu_l2if_ctl_msff_ctl_macro__clr_1__en_1__width_1 (
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

module mcu_l2if_ctl_msff_ctl_macro__width_5 (
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

module mcu_l2if_ctl_msff_ctl_macro__width_35 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [34:0] fdin;
wire [33:0] so;

  input [34:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [34:0] dout;
  output scan_out;
assign fdin[34:0] = din[34:0];






dff #(35)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[34:0]),
.si({scan_in,so[33:0]}),
.so({so[33:0],scan_out}),
.q(dout[34:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_l2if_ctl_msff_ctl_macro (
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

module mcu_l2if_ctl_msff_ctl_macro__en_1__width_8 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = (din[7:0] & {8{en}}) | (dout[7:0] & ~{8{en}});






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

module mcu_l2if_ctl_msff_ctl_macro__en_1__width_5 (
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

module mcu_l2if_ctl_msff_ctl_macro__en_1__width_6 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = (din[5:0] & {6{en}}) | (dout[5:0] & ~{6{en}});






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

module mcu_l2if_ctl_msff_ctl_macro__en_1__width_2 (
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

module mcu_l2if_ctl_msff_ctl_macro__en_1__width_3 (
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

module mcu_l2if_ctl_msff_ctl_macro__en_1__width_1 (
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

module mcu_l2if_ctl_msff_ctl_macro__en_1 (
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

module mcu_l2if_ctl_msff_ctl_macro__width_4 (
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

module mcu_l2if_ctl_msff_ctl_macro__en_1__width_4 (
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

module mcu_l2if_ctl_msff_ctl_macro__width_6 (
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

module mcu_l2if_ctl_msff_ctl_macro__width_8 (
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

module mcu_l2if_ctl_msff_ctl_macro__width_9 (
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

module mcu_l2if_ctl_msff_ctl_macro__width_7 (
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

module mcu_l2if_ctl_msff_ctl_macro__en_1__width_38 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [37:0] fdin;
wire [36:0] so;

  input [37:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [37:0] dout;
  output scan_out;
assign fdin[37:0] = (din[37:0] & {38{en}}) | (dout[37:0] & ~{38{en}});






dff #(38)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[37:0]),
.si({scan_in,so[36:0]}),
.so({so[36:0],scan_out}),
.q(dout[37:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_l2if_ctl_msff_ctl_macro__en_1__width_35 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [34:0] fdin;
wire [33:0] so;

  input [34:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [34:0] dout;
  output scan_out;
assign fdin[34:0] = (din[34:0] & {35{en}}) | (dout[34:0] & ~{35{en}});






dff #(35)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[34:0]),
.si({scan_in,so[33:0]}),
.so({so[33:0],scan_out}),
.q(dout[34:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module mcu_l2if_ctl_spare_ctl_macro__num_4 (
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
assign scan_out = so_3;



endmodule

