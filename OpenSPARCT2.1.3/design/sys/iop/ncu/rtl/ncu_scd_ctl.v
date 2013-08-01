// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_scd_ctl.v
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
module ncu_scd_ctl (
  ccu_ncu_data, 
  ccu_ncu_stall, 
  ccu_ncu_vld, 
  core_running_status, 
  cpubuf_dout, 
  cpubuf_tail_f, 
  dmu_ncu_data, 
  dmu_ncu_stall, 
  dmu_ncu_vld, 
  dmu_ncu_wrack_tag, 
  dmu_ncu_wrack_vld, 
  dmu_ncu_wrack_par, 
  efu_ncu_bankavail_dshift, 
  efu_ncu_coreavail_dshift, 
  efu_ncu_fuse_data, 
  efu_ncu_fusestat_dshift, 
  efu_ncu_sernum0_dshift, 
  efu_ncu_sernum1_dshift, 
  efu_ncu_sernum2_dshift, 
  intman_tbl_dout, 
  iobuf_head_f, 
  iol2clk, 
  mcu0_ncu_data, 
  mcu0_ncu_stall, 
  mcu0_ncu_vld, 
  mcu1_ncu_data, 
  mcu1_ncu_stall, 
  mcu1_ncu_vld, 
  mcu2_ncu_data, 
  mcu2_ncu_stall, 
  mcu2_ncu_vld, 
  mcu3_ncu_data, 
  mcu3_ncu_stall, 
  mcu3_ncu_vld, 
  mondo_busy_vec_f, 
  niu_ncu_data, 
  niu_ncu_stall, 
  niu_ncu_vld, 
  rcu_ncu_data, 
  rcu_ncu_stall, 
  rcu_ncu_vld, 
  dbg1_ncu_data, 
  dbg1_ncu_stall, 
  dbg1_ncu_vld, 
  rst_ncu_unpark_thread, 
  rst_ncu_xir_, 
  scan_in, 
  sii_ncu_data, 
  sii_ncu_req, 
  sii_ncu_dparity, 
  ssi_ncu_data, 
  ssi_ncu_stall, 
  ssi_ncu_vld, 
  tap_mondo_acc_addr_invld_d2_f, 
  tap_mondo_acc_seq_d2_f, 
  tap_mondo_dout_d2_f, 
  tcu_clk_stop, 
  tcu_ncu_data, 
  tcu_ncu_stall, 
  tcu_ncu_vld, 
  tcu_pce_ov, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  dmubuf0_dout, 
  dmubuf1_dout, 
  mb0_run, 
  mb0_iobuf_wr_en, 
  mb0_addr, 
  mb0_wdata, 
  tcu_dbr_gateoff, 
  tcu_mbist_bisi_en, 
  mb1_run, 
  mb1_addr, 
  mb1_wdata, 
  mb1_cpubuf_wr_en, 
  mb1_scanout, 
  mb1_done, 
  mb1_fail, 
  mb1_start, 
  mb1_scanin, 
  tcu_mbist_user_mode, 
  ncu_spc_pm, 
  ncu_spc_ba67, 
  ncu_spc_ba45, 
  ncu_spc_ba23, 
  ncu_spc_ba01, 
  ncu_spc_l2_idx_hash_en, 
  ncu_sii_pm, 
  ncu_sii_ba67, 
  ncu_sii_ba45, 
  ncu_sii_ba23, 
  ncu_sii_ba01, 
  ncu_sii_l2_idx_hash_en, 
  ncu_l2t_pm, 
  ncu_l2t_ba67, 
  ncu_l2t_ba45, 
  ncu_l2t_ba23, 
  ncu_l2t_ba01, 
  ncu_mcu_pm, 
  ncu_mcu_ba67, 
  ncu_mcu_ba45, 
  ncu_mcu_ba23, 
  ncu_mcu_ba01, 
  cpubuf_mb0_data, 
  ncu_spc7_core_enable_status, 
  ncu_spc6_core_enable_status, 
  ncu_spc5_core_enable_status, 
  ncu_spc4_core_enable_status, 
  ncu_spc3_core_enable_status, 
  ncu_spc2_core_enable_status, 
  ncu_spc1_core_enable_status, 
  ncu_spc0_core_enable_status, 
  core_running, 
  coreavail, 
  cpubuf_head_ptr, 
  cpubuf_head_s, 
  cpubuf_rden, 
  intman_tbl_raddr, 
  intman_tbl_waddr, 
  intman_tbl_din, 
  intman_tbl_rden, 
  intman_tbl_wr, 
  iobuf_din, 
  iobuf_tail_ptr, 
  iobuf_tail_s, 
  iobuf_wr, 
  io_mondo_data0_din_s, 
  io_mondo_data1_din_s, 
  io_mondo_data_wr_addr_s, 
  io_mondo_data_wr_s, 
  ncu_ccu_data, 
  ncu_ccu_stall, 
  ncu_ccu_vld, 
  ncu_dmu_data, 
  ncu_dmu_mmu_addr_vld, 
  ncu_dmu_mondo_ack, 
  ncu_dmu_mondo_id, 
  ncu_dmu_mondo_id_par, 
  ncu_dmu_mondo_nack, 
  ncu_dmu_dpar, 
  ncu_dmu_pio_data, 
  ncu_dmu_pio_hdr_vld, 
  ncu_dmu_stall, 
  ncu_dmu_vld, 
  ncu_mcu0_data, 
  ncu_mcu0_stall, 
  ncu_mcu0_vld, 
  ncu_mcu1_data, 
  ncu_mcu1_stall, 
  ncu_mcu1_vld, 
  ncu_mcu2_data, 
  ncu_mcu2_stall, 
  ncu_mcu2_vld, 
  ncu_mcu3_data, 
  ncu_mcu3_stall, 
  ncu_mcu3_vld, 
  ncu_niu_data, 
  ncu_niu_stall, 
  ncu_niu_vld, 
  ncu_rcu_data, 
  ncu_rcu_stall, 
  ncu_rcu_vld, 
  ncu_dbg1_data, 
  ncu_dbg1_stall, 
  ncu_dbg1_vld, 
  ncu_rst_xir_done, 
  ncu_sii_gnt, 
  ncu_ssi_data, 
  ncu_ssi_stall, 
  ncu_ssi_vld, 
  ncu_tcu_data, 
  ncu_tcu_stall, 
  ncu_tcu_vld, 
  scan_out, 
  tap_mondo_acc_addr_s, 
  tap_mondo_acc_seq_s, 
  tap_mondo_din_s, 
  tap_mondo_wr_s, 
  dmubuf_din, 
  dmubuf_raddr, 
  dmubuf_waddr, 
  dmubuf0_wr, 
  dmubuf1_wr, 
  dmubuf_rden, 
  aclk_wmr, 
  wmr_protect, 
  dmu_ncu_d_pe, 
  ncu_dmu_d_pei, 
  dmu_ncu_siicr_pe, 
  ncu_dmu_siicr_pei, 
  dmu_ncu_ctag_ue, 
  ncu_dmu_ctag_uei, 
  dmu_ncu_ctag_ce, 
  ncu_dmu_ctag_cei, 
  dmu_ncu_ncucr_pe, 
  ncu_dmu_ncucr_pei, 
  dmu_ncu_ie, 
  ncu_dmu_iei, 
  niu_ncu_d_pe, 
  ncu_niu_d_pei, 
  niu_ncu_ctag_ue, 
  ncu_niu_ctag_uei, 
  niu_ncu_ctag_ce, 
  ncu_niu_ctag_cei, 
  sio_ncu_ctag_ce, 
  ncu_sio_ctag_cei, 
  sio_ncu_ctag_ue, 
  ncu_sio_ctag_uei, 
  ncu_sio_d_pei, 
  mcu0_ncu_ecc, 
  ncu_mcu0_ecci, 
  mcu0_ncu_fbr, 
  ncu_mcu0_fbri, 
  mcu0_ncu_fbu, 
  ncu_mcu0_fbui, 
  mcu1_ncu_ecc, 
  ncu_mcu1_ecci, 
  mcu1_ncu_fbr, 
  ncu_mcu1_fbri, 
  mcu1_ncu_fbu, 
  ncu_mcu1_fbui, 
  mcu2_ncu_ecc, 
  ncu_mcu2_ecci, 
  mcu2_ncu_fbr, 
  ncu_mcu2_fbri, 
  mcu2_ncu_fbu, 
  ncu_mcu2_fbui, 
  mcu3_ncu_ecc, 
  ncu_mcu3_ecci, 
  mcu3_ncu_fbr, 
  ncu_mcu3_fbri, 
  mcu3_ncu_fbu, 
  ncu_mcu3_fbui, 
  sii_ncu_syn_data, 
  sii_ncu_syn_vld, 
  sii_ncu_dmuctag_ce, 
  ncu_sii_dmuctag_cei, 
  sii_ncu_dmuctag_ue, 
  ncu_sii_dmuctag_uei, 
  sii_ncu_dmua_pe, 
  ncu_sii_dmua_pei, 
  sii_ncu_dmud_pe, 
  ncu_sii_dmud_pei, 
  sii_ncu_niuctag_ce, 
  ncu_sii_niuctag_cei, 
  sii_ncu_niuctag_ue, 
  ncu_sii_niuctag_uei, 
  sii_ncu_niua_pe, 
  ncu_sii_niua_pei, 
  sii_ncu_niud_pe, 
  ncu_sii_niud_pei, 
  ncu_rst_fatal_error, 
  ncu_tcu_soc_error, 
  ncu_tcu_bank_avail, 
  iobuf_ue_f, 
  iobuf_uei, 
  intbuf_ue_f, 
  intbuf_uei, 
  mondotbl_pe_f, 
  mondotbl_pei, 
  ncu_dbg1_error_event, 
  cmp_tick_enable, 
  tcu_wmr_vec_mask, 
  ncu_scksel) ;
wire [4:0] l2pm;
wire l2idxhs_en_status;
wire tcu_dbr_gateoff_i;
wire raserrce;
wire raserrue;
wire ncuctag_uei;
wire ncuctag_cei;
wire ncusiid_pei;
wire [127:0] bounce_ack_packet;
wire bounce_ack_vld;
wire lhs_intman_acc;
wire [5:0] mondoinvec;
wire [127:0] ncu_int_ack_packet;
wire ncu_int_ack_vld;
wire [127:0] ncu_man_ack_packet;
wire ncu_man_ack_vld;
wire [24:0] ncu_man_int_packet;
wire ncu_man_int_vld;
wire [63:0] rd_nack_packet;
wire rd_nack_vld;
wire srvc_wr_ack;
wire [152:0] wr_ack_iopkt;
wire [152:0] dmupio_wack_iopkt;
wire dmupio_srvc_wack;
wire bounce_ack_rd;
wire intman_pchkf2i2c;
wire iobuf_avail;
wire [6:0] io_intman_addr;
wire ncu_c2iscd_ctl_scanin;
wire ncu_c2iscd_ctl_scanout;
wire ncu_int_ack_rd;
wire ncu_man_ack_rd;
wire ncu_man_int_rd;
wire rd_nack_rd;
wire [3:0] sii_cr_id_rtn;
wire sii_cr_id_rtn_vld;
wire [63:0] siierrsyn;
wire siierrsyn_done;
wire io_rd_intman_d2;
wire ncuctag_ue;
wire ncuctag_ce;
wire ncusiid_pe;
wire [15:0] ncudpsyn;
wire ncu_i2cscd_ctl_scanin;
wire ncu_i2cscd_ctl_scanout;


input [3:0]		ccu_ncu_data;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input			ccu_ncu_stall;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			ccu_ncu_vld;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input [63:0]		core_running_status;	// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input [143:0]		cpubuf_dout;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input [5:0]		cpubuf_tail_f;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input [31:0]		dmu_ncu_data;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input			dmu_ncu_stall;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			dmu_ncu_vld;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input [3:0]		dmu_ncu_wrack_tag;	// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			dmu_ncu_wrack_vld;	// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			dmu_ncu_wrack_par;	// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			efu_ncu_bankavail_dshift;// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			efu_ncu_coreavail_dshift;// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
//input			efu_ncu_fuse_clk1;	// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			efu_ncu_fuse_data;	// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			efu_ncu_fusestat_dshift;// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			efu_ncu_sernum0_dshift;	// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			efu_ncu_sernum1_dshift;	// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			efu_ncu_sernum2_dshift;	// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input [15:0]		intman_tbl_dout;	// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v, ...
input [5:0]		iobuf_head_f;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input			iol2clk;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v, ...
input [3:0]		mcu0_ncu_data;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input			mcu0_ncu_stall;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			mcu0_ncu_vld;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input [3:0]		mcu1_ncu_data;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input			mcu1_ncu_stall;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			mcu1_ncu_vld;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input [3:0]		mcu2_ncu_data;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input			mcu2_ncu_stall;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			mcu2_ncu_vld;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input [3:0]		mcu3_ncu_data;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input			mcu3_ncu_stall;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			mcu3_ncu_vld;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input [63:0]		mondo_busy_vec_f;	// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input [31:0]		niu_ncu_data;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input			niu_ncu_stall;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			niu_ncu_vld;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input [3:0]		rcu_ncu_data;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input			rcu_ncu_stall;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			rcu_ncu_vld;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
//input [3:0]		rng_ncu_data;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input [3:0]             dbg1_ncu_data;           // To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input			dbg1_ncu_stall;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			dbg1_ncu_vld;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
//input                   rng_ncu_stall;          // To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
//input                   rng_ncu_vld;            // To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input			rst_ncu_unpark_thread;	// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			rst_ncu_xir_;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			scan_in;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input [31:0]		sii_ncu_data;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input			sii_ncu_req;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input [1:0]		sii_ncu_dparity;
input [3:0]		ssi_ncu_data;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input			ssi_ncu_stall;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			ssi_ncu_vld;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input			tap_mondo_acc_addr_invld_d2_f;// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			tap_mondo_acc_seq_d2_f;	// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input [63:0]		tap_mondo_dout_d2_f;	// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			tcu_clk_stop;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v, ...
input [7:0]		tcu_ncu_data;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			tcu_ncu_stall;		// To ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
input			tcu_ncu_vld;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
input			tcu_pce_ov;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v, ...
input			tcu_scan_en;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v, ...
input			tcu_aclk;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v, ...
input			tcu_bclk;		// To ncu_c2iscd_ctl of ncu_c2iscd_ctl.v, ...
input [143:0]		dmubuf0_dout;
input [143:0]		dmubuf1_dout;
input			mb0_run;
input			mb0_iobuf_wr_en;
input [5:0]		mb0_addr;
input [7:0]		mb0_wdata;
input			tcu_dbr_gateoff;
input			tcu_mbist_bisi_en;
output 			mb1_run;
output [6:0]		mb1_addr;
output [7:0]		mb1_wdata;
output 			mb1_cpubuf_wr_en;

//mb1 tcu connection//
output			mb1_scanout;
output			mb1_done;
output			mb1_fail;
input			mb1_start;
input			mb1_scanin;
input			tcu_mbist_user_mode;

output			ncu_spc_pm;
output			ncu_spc_ba67;
output			ncu_spc_ba45;
output			ncu_spc_ba23;
output			ncu_spc_ba01;
output			ncu_spc_l2_idx_hash_en;
output			ncu_sii_pm;
output			ncu_sii_ba67;
output			ncu_sii_ba45;
output			ncu_sii_ba23;
output			ncu_sii_ba01;
output			ncu_sii_l2_idx_hash_en;
output			ncu_l2t_pm;
output			ncu_l2t_ba67;
output			ncu_l2t_ba45;
output			ncu_l2t_ba23;
output			ncu_l2t_ba01;
output			ncu_mcu_pm ;
output			ncu_mcu_ba67;
output			ncu_mcu_ba45;
output			ncu_mcu_ba23;
output			ncu_mcu_ba01;


output [7:0]		cpubuf_mb0_data;
//output [7:0]		core_enable_status;	// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output ncu_spc7_core_enable_status;
output ncu_spc6_core_enable_status;
output ncu_spc5_core_enable_status;
output ncu_spc4_core_enable_status;
output ncu_spc3_core_enable_status;
output ncu_spc2_core_enable_status;
output ncu_spc1_core_enable_status;
output ncu_spc0_core_enable_status;

output [63:0]		core_running;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [7:0]		coreavail;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [4:0]		cpubuf_head_ptr;	// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [5:0]		cpubuf_head_s;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			cpubuf_rden;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [6:0]		intman_tbl_raddr;	// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [6:0]		intman_tbl_waddr;	// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [15:0]		intman_tbl_din;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			intman_tbl_rden;	// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			intman_tbl_wr;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [175:0]		iobuf_din;		// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output [4:0]		iobuf_tail_ptr;	// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output [5:0]		iobuf_tail_s;		// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output			iobuf_wr;		// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output [63:0]		io_mondo_data0_din_s;	// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output [63:0]		io_mondo_data1_din_s;	// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output [5:0]		io_mondo_data_wr_addr_s;// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output			io_mondo_data_wr_s;	// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
//output [4:0]		l2pm;			// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
//output			l2idxhs_en_status;
output [3:0]		ncu_ccu_data;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			ncu_ccu_stall;		// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output			ncu_ccu_vld;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [31:0]		ncu_dmu_data;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			ncu_dmu_mmu_addr_vld;	// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			ncu_dmu_mondo_ack;	// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output [5:0]		ncu_dmu_mondo_id;	// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output			ncu_dmu_mondo_id_par;
output			ncu_dmu_mondo_nack;	// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output [1:0]		ncu_dmu_dpar;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [63:0]		ncu_dmu_pio_data;	// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			ncu_dmu_pio_hdr_vld;	// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			ncu_dmu_stall;		// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output			ncu_dmu_vld;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [3:0]		ncu_mcu0_data;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			ncu_mcu0_stall;		// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output			ncu_mcu0_vld;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [3:0]		ncu_mcu1_data;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			ncu_mcu1_stall;		// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output			ncu_mcu1_vld;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [3:0]		ncu_mcu2_data;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			ncu_mcu2_stall;		// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output			ncu_mcu2_vld;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [3:0]		ncu_mcu3_data;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			ncu_mcu3_stall;		// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output			ncu_mcu3_vld;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [31:0]		ncu_niu_data;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			ncu_niu_stall;		// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output			ncu_niu_vld;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [3:0]		ncu_rcu_data;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			ncu_rcu_stall;		// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output			ncu_rcu_vld;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
//output [3:0]		ncu_rng_data;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
//output			ncu_rng_stall;		// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
//output			ncu_rng_vld;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [3:0]            ncu_dbg1_data;           // From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output                  ncu_dbg1_stall;          // From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output                  ncu_dbg1_vld;            // From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			ncu_rst_xir_done;	// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			ncu_sii_gnt;		// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output [3:0]		ncu_ssi_data;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			ncu_ssi_stall;		// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output			ncu_ssi_vld;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [7:0]		ncu_tcu_data;		// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output			ncu_tcu_stall;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			ncu_tcu_vld;		// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output			scan_out;		// From ncu_i2cscd_ctl of ncu_i2cscd_ctl.v
output [21:0]		tap_mondo_acc_addr_s;	// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			tap_mondo_acc_seq_s;	// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [63:0]		tap_mondo_din_s;	// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			tap_mondo_wr_s;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [143:0]		dmubuf_din;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [4:0]		dmubuf_raddr;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output [4:0]		dmubuf_waddr;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			dmubuf0_wr;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			dmubuf1_wr;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v
output			dmubuf_rden;		// From ncu_c2iscd_ctl of ncu_c2iscd_ctl.v

//err ecc//
input 		aclk_wmr;
input		wmr_protect;
input		dmu_ncu_d_pe;
output		ncu_dmu_d_pei;
input		dmu_ncu_siicr_pe;
output		ncu_dmu_siicr_pei;
input		dmu_ncu_ctag_ue;
output		ncu_dmu_ctag_uei;
input		dmu_ncu_ctag_ce;
output		ncu_dmu_ctag_cei;
input		dmu_ncu_ncucr_pe;
output		ncu_dmu_ncucr_pei;
input		dmu_ncu_ie;
output		ncu_dmu_iei;

input		niu_ncu_d_pe;
output		ncu_niu_d_pei;
input		niu_ncu_ctag_ue;
output		ncu_niu_ctag_uei;
input		niu_ncu_ctag_ce;
output		ncu_niu_ctag_cei;

input		sio_ncu_ctag_ce;
output		ncu_sio_ctag_cei;
input		sio_ncu_ctag_ue;
output		ncu_sio_ctag_uei;
//input		sio_ncu_d_pe;
output		ncu_sio_d_pei;

input		mcu0_ncu_ecc;
output		ncu_mcu0_ecci;
input		mcu0_ncu_fbr;
output		ncu_mcu0_fbri;
input		mcu0_ncu_fbu;
output		ncu_mcu0_fbui;

input		mcu1_ncu_ecc;
output		ncu_mcu1_ecci;
input		mcu1_ncu_fbr;
output		ncu_mcu1_fbri;
input		mcu1_ncu_fbu;
output		ncu_mcu1_fbui;

input		mcu2_ncu_ecc;
output		ncu_mcu2_ecci;
input		mcu2_ncu_fbr;
output		ncu_mcu2_fbri;
input		mcu2_ncu_fbu;
output		ncu_mcu2_fbui;

input		mcu3_ncu_ecc;
output		ncu_mcu3_ecci;
input		mcu3_ncu_fbr;
output		ncu_mcu3_fbri;
input		mcu3_ncu_fbu;
output		ncu_mcu3_fbui;


input [3:0]	sii_ncu_syn_data;
input		sii_ncu_syn_vld;
input		sii_ncu_dmuctag_ce;
output		ncu_sii_dmuctag_cei;
input		sii_ncu_dmuctag_ue;
output		ncu_sii_dmuctag_uei;
input		sii_ncu_dmua_pe;
output		ncu_sii_dmua_pei;
input		sii_ncu_dmud_pe;
output		ncu_sii_dmud_pei;
input		sii_ncu_niuctag_ce;
output		ncu_sii_niuctag_cei;
input		sii_ncu_niuctag_ue;
output		ncu_sii_niuctag_uei;
input		sii_ncu_niua_pe;
output		ncu_sii_niua_pei;
input		sii_ncu_niud_pe;
output		ncu_sii_niud_pei;

output		ncu_rst_fatal_error;
output		ncu_tcu_soc_error;
output [7:0]    ncu_tcu_bank_avail;
//output [3:0]    ncu_tcu_bank_en_status;

input		iobuf_ue_f;
output		iobuf_uei;
input		intbuf_ue_f;
output		intbuf_uei;
input		mondotbl_pe_f;
output		mondotbl_pei;
output		ncu_dbg1_error_event;
output		cmp_tick_enable;
output   	tcu_wmr_vec_mask;
output[1:0]	ncu_scksel;

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
// End of automatics
//
//assign	ncu_spc_pm    = l2pm[4];
assign	ncu_spc_ba67  = l2pm[3];
assign	ncu_spc_ba45  = l2pm[2];
assign	ncu_spc_ba23  = l2pm[1];
//assign	ncu_spc_ba01  = l2pm[0];
assign	ncu_spc_l2_idx_hash_en = l2idxhs_en_status;
//// sii ////
assign	ncu_sii_pm    = l2pm[4];
assign	ncu_sii_ba67  = l2pm[3];
assign	ncu_sii_ba45  = l2pm[2];
assign	ncu_sii_ba23  = l2pm[1];
assign	ncu_sii_ba01  = l2pm[0];
assign	ncu_sii_l2_idx_hash_en = l2idxhs_en_status;
//// l2t ////
assign	ncu_l2t_pm    = l2pm[4];
assign	ncu_l2t_ba67  = l2pm[3];
assign	ncu_l2t_ba45  = l2pm[2];
assign	ncu_l2t_ba23  = l2pm[1];
assign	ncu_l2t_ba01  = l2pm[0];
//// mcu ////
assign	ncu_mcu_pm    = l2pm[4];
assign	ncu_mcu_ba67  = l2pm[3];
assign	ncu_mcu_ba45  = l2pm[2];
assign	ncu_mcu_ba23  = l2pm[1];
assign	ncu_mcu_ba01  = l2pm[0];

assign  tcu_dbr_gateoff_i = ~tcu_dbr_gateoff;

///*ncu_c2iscd_ctl auto_template ( 
// 				 .scan_out( ) ); */
ncu_c2iscd_ctl ncu_c2iscd_ctl ( /*AUTOINST*/
			       // Outputs
			       .mb1_run(mb1_run),
			       .mb1_scanout(mb1_scanout),
			       .mb1_fail(mb1_fail),
			       .mb1_done(mb1_done),
			       .mb1_addr(mb1_addr[6:0]),
			       .mb1_wdata(mb1_wdata[7:0]),
			       .ncu_rst_fatal_error(ncu_rst_fatal_error),
			       .ncu_tcu_soc_error(ncu_tcu_soc_error),
			       .raserrce(raserrce),
			       .raserrue(raserrue),
			       .ncu_dmu_d_pei(ncu_dmu_d_pei),
			       .ncu_dmu_siicr_pei(ncu_dmu_siicr_pei),
			       .ncu_dmu_ctag_uei(ncu_dmu_ctag_uei),
			       .ncu_dmu_ctag_cei(ncu_dmu_ctag_cei),
			       .ncu_dmu_ncucr_pei(ncu_dmu_ncucr_pei),
			       .ncu_dmu_iei(ncu_dmu_iei),
			       .ncu_niu_d_pei(ncu_niu_d_pei),
			       .ncu_niu_ctag_uei(ncu_niu_ctag_uei),
			       .ncu_niu_ctag_cei(ncu_niu_ctag_cei),
			       .ncu_sio_ctag_cei(ncu_sio_ctag_cei),
			       .ncu_sio_ctag_uei(ncu_sio_ctag_uei),
			       .ncu_sio_d_pei(ncu_sio_d_pei),
			       .ncu_sii_dmuctag_cei(ncu_sii_dmuctag_cei),
			       .ncu_sii_dmuctag_uei(ncu_sii_dmuctag_uei),
			       .ncu_sii_dmua_pei(ncu_sii_dmua_pei),
			       .ncu_sii_dmud_pei(ncu_sii_dmud_pei),
			       .ncu_sii_niuctag_cei(ncu_sii_niuctag_cei),
			       .ncu_sii_niuctag_uei(ncu_sii_niuctag_uei),
			       .ncu_sii_niua_pei(ncu_sii_niua_pei),
			       .ncu_sii_niud_pei(ncu_sii_niud_pei),
			       .ncu_mcu0_ecci(ncu_mcu0_ecci),
			       .ncu_mcu0_fbri(ncu_mcu0_fbri),
			       .ncu_mcu0_fbui(ncu_mcu0_fbui),
			       .ncu_mcu1_ecci(ncu_mcu1_ecci),
			       .ncu_mcu1_fbri(ncu_mcu1_fbri),
			       .ncu_mcu1_fbui(ncu_mcu1_fbui),
			       .ncu_mcu2_ecci(ncu_mcu2_ecci),
			       .ncu_mcu2_fbri(ncu_mcu2_fbri),
			       .ncu_mcu2_fbui(ncu_mcu2_fbui),
			       .ncu_mcu3_ecci(ncu_mcu3_ecci),
			       .ncu_mcu3_fbri(ncu_mcu3_fbri),
			       .ncu_mcu3_fbui(ncu_mcu3_fbui),
			       .ncuctag_uei(ncuctag_uei),
			       .ncuctag_cei(ncuctag_cei),
			       .ncusiid_pei(ncusiid_pei),
			       .iobuf_uei(iobuf_uei),
			       .intbuf_uei(intbuf_uei),
			       .mondotbl_pei(mondotbl_pei),
			       .bounce_ack_packet(bounce_ack_packet[127:0]),
			       .bounce_ack_vld(bounce_ack_vld),
			       //.core_enable_status(core_enable_status[7:0]),
			       .ncu_spc7_core_enable_status(ncu_spc7_core_enable_status),
                               .ncu_spc6_core_enable_status(ncu_spc6_core_enable_status),
                               .ncu_spc5_core_enable_status(ncu_spc5_core_enable_status),
                               .ncu_spc4_core_enable_status(ncu_spc4_core_enable_status),
                               .ncu_spc3_core_enable_status(ncu_spc3_core_enable_status),
                               .ncu_spc2_core_enable_status(ncu_spc2_core_enable_status),
                               .ncu_spc1_core_enable_status(ncu_spc1_core_enable_status),
                               .ncu_spc0_core_enable_status(ncu_spc0_core_enable_status),
			       .core_running(core_running[63:0]),
			       .coreavail(coreavail[7:0]),
			       .cpubuf_head_ptr(cpubuf_head_ptr[4:0]),
			       .cpubuf_head_s(cpubuf_head_s[5:0]),
			       .cpubuf_rden(cpubuf_rden),
			       .intman_tbl_raddr(intman_tbl_raddr[6:0]),
			       .intman_tbl_waddr(intman_tbl_waddr[6:0]),
			       .intman_tbl_din(intman_tbl_din[15:0]),
			       .intman_tbl_rden(intman_tbl_rden),
			       .intman_tbl_wr(intman_tbl_wr),
			       .dmubuf_din(dmubuf_din[143:0]),
			       .dmubuf_raddr(dmubuf_raddr[4:0]),
			       .dmubuf_waddr(dmubuf_waddr[4:0]),
			       .dmubuf_rden(dmubuf_rden),
			       .dmubuf0_wr(dmubuf0_wr),
			       .dmubuf1_wr(dmubuf1_wr),
			       .l2pm	(l2pm[4:0]),
			       .ncu_spc_pm(ncu_spc_pm),
			       .ncu_spc_ba01(ncu_spc_ba01),
			       .l2idxhs_en_status(l2idxhs_en_status),
			       .lhs_intman_acc(lhs_intman_acc),
			       .mondoinvec(mondoinvec[5:0]),
			       .ncu_ccu_data(ncu_ccu_data[3:0]),
			       .ncu_ccu_vld(ncu_ccu_vld),
			       .ncu_dmu_data(ncu_dmu_data[31:0]),
			       .ncu_dmu_mmu_addr_vld(ncu_dmu_mmu_addr_vld),
			       .ncu_dmu_dpar(ncu_dmu_dpar[1:0]),
			       .ncu_dmu_pio_data(ncu_dmu_pio_data[63:0]),
			       .ncu_dmu_pio_hdr_vld(ncu_dmu_pio_hdr_vld),
			       .ncu_dmu_vld(ncu_dmu_vld),
			       .ncu_int_ack_packet(ncu_int_ack_packet[127:0]),
			       .ncu_int_ack_vld(ncu_int_ack_vld),
			       .ncu_man_ack_packet(ncu_man_ack_packet[127:0]),
			       .ncu_man_ack_vld(ncu_man_ack_vld),
			       .ncu_man_int_packet(ncu_man_int_packet[24:0]),
			       .ncu_man_int_vld(ncu_man_int_vld),
			       .ncu_mcu0_data(ncu_mcu0_data[3:0]),
			       .ncu_mcu0_vld(ncu_mcu0_vld),
			       .ncu_mcu1_data(ncu_mcu1_data[3:0]),
			       .ncu_mcu1_vld(ncu_mcu1_vld),
			       .ncu_mcu2_data(ncu_mcu2_data[3:0]),
			       .ncu_mcu2_vld(ncu_mcu2_vld),
			       .ncu_mcu3_data(ncu_mcu3_data[3:0]),
			       .ncu_mcu3_vld(ncu_mcu3_vld),
			       .ncu_niu_data(ncu_niu_data[31:0]),
			       .ncu_niu_vld(ncu_niu_vld),
			       .ncu_rcu_data(ncu_rcu_data[3:0]),
			       .ncu_rcu_vld(ncu_rcu_vld),
			       .ncu_dbg1_data(ncu_dbg1_data[3:0]),
			       .ncu_dbg1_vld(ncu_dbg1_vld),
			       .ncu_rst_xir_done(ncu_rst_xir_done),
			       .ncu_ssi_data(ncu_ssi_data[3:0]),
			       .ncu_ssi_vld(ncu_ssi_vld),
			       .ncu_tcu_stall(ncu_tcu_stall),
			       .ncu_tcu_bank_avail(ncu_tcu_bank_avail[7:0]),
			       //.ncu_tcu_bank_en_status(ncu_tcu_bank_en_status[3:0]),
			       .rd_nack_packet(rd_nack_packet[63:0]),
			       .rd_nack_vld(rd_nack_vld),
			       .srvc_wr_ack(srvc_wr_ack),
			       .tap_mondo_acc_addr_s(tap_mondo_acc_addr_s[21:0]),
			       .tap_mondo_acc_seq_s(tap_mondo_acc_seq_s),
			       .tap_mondo_din_s(tap_mondo_din_s[63:0]),
			       .tap_mondo_wr_s(tap_mondo_wr_s),
			       .wr_ack_iopkt(wr_ack_iopkt[152:0]),
			       .cpubuf_mb0_data(cpubuf_mb0_data[7:0]),
			       .dmupio_wack_iopkt(dmupio_wack_iopkt[152:0]),
			       .dmupio_srvc_wack(dmupio_srvc_wack),
			       .cmp_tick_enable(cmp_tick_enable),
			       .tcu_wmr_vec_mask(tcu_wmr_vec_mask),
			       .ncu_dbg1_error_event(ncu_dbg1_error_event),
		               .ncu_scksel(ncu_scksel[1:0]),
			       // Inputs
			       .tcu_dbr_gateoff(tcu_dbr_gateoff_i),
			       .aclk_wmr(aclk_wmr),
			       .wmr_protect(wmr_protect),
			       .mb1_scanin(mb1_scanin),
			       .tcu_mbist_user_mode(tcu_mbist_user_mode),
			       .mb1_start(mb1_start),
			       .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
			       .bounce_ack_rd(bounce_ack_rd),
			       .ccu_ncu_stall(ccu_ncu_stall),
			       .core_running_status(core_running_status[63:0]),
			       .cpubuf_dout(cpubuf_dout[143:0]),
			       .cpubuf_tail_f(cpubuf_tail_f[5:0]),
			       .dmu_ncu_stall(dmu_ncu_stall),
			       .dmu_ncu_wrack_tag(dmu_ncu_wrack_tag[3:0]),
			       .dmu_ncu_wrack_vld(dmu_ncu_wrack_vld),
			       .dmu_ncu_wrack_par(dmu_ncu_wrack_par),
			       .efu_ncu_bankavail_dshift(efu_ncu_bankavail_dshift),
			       .efu_ncu_coreavail_dshift(efu_ncu_coreavail_dshift),
			       //.efu_ncu_fuse_clk1(efu_ncu_fuse_clk1),
			       .efu_ncu_fuse_data(efu_ncu_fuse_data),
			       .efu_ncu_fusestat_dshift(efu_ncu_fusestat_dshift),
			       .efu_ncu_sernum0_dshift(efu_ncu_sernum0_dshift),
			       .efu_ncu_sernum1_dshift(efu_ncu_sernum1_dshift),
			       .efu_ncu_sernum2_dshift(efu_ncu_sernum2_dshift),
			       .intman_pchkf2i2c(intman_pchkf2i2c),
			       .intman_tbl_dout(intman_tbl_dout[15:0]),
			       .dmubuf0_dout(dmubuf0_dout[143:0]),
			       .dmubuf1_dout(dmubuf1_dout[143:0]),
			       .iobuf_avail(iobuf_avail),
			       .io_intman_addr(io_intman_addr[6:0]),
			       .scan_in(ncu_c2iscd_ctl_scanin),
			       .scan_out(ncu_c2iscd_ctl_scanout),
			       .iol2clk	(iol2clk),
			       .mcu0_ncu_stall(mcu0_ncu_stall),
			       .mcu1_ncu_stall(mcu1_ncu_stall),
			       .mcu2_ncu_stall(mcu2_ncu_stall),
			       .mcu3_ncu_stall(mcu3_ncu_stall),
			       .ncu_int_ack_rd(ncu_int_ack_rd),
			       .ncu_man_ack_rd(ncu_man_ack_rd),
			       .ncu_man_int_rd(ncu_man_int_rd),
			       .niu_ncu_stall(niu_ncu_stall),
			       .rcu_ncu_stall(rcu_ncu_stall),
			       .rd_nack_rd(rd_nack_rd),
			       .dbg1_ncu_stall(dbg1_ncu_stall),
			       .rst_ncu_unpark_thread(rst_ncu_unpark_thread),
			       .rst_ncu_xir_(rst_ncu_xir_),
			       .sii_cr_id_rtn(sii_cr_id_rtn[3:0]),
			       .sii_cr_id_rtn_vld(sii_cr_id_rtn_vld),
			       .ssi_ncu_stall(ssi_ncu_stall),
			       .tap_mondo_acc_addr_invld_d2_f(tap_mondo_acc_addr_invld_d2_f),
			       .tap_mondo_acc_seq_d2_f(tap_mondo_acc_seq_d2_f),
			       .tap_mondo_dout_d2_f(tap_mondo_dout_d2_f[63:0]),
			       .tcu_aclk(tcu_aclk),
			       .tcu_bclk(tcu_bclk),
			       .tcu_clk_stop(tcu_clk_stop),
			       .tcu_ncu_data(tcu_ncu_data[7:0]),
			       .tcu_ncu_vld(tcu_ncu_vld),
			       .tcu_pce_ov(tcu_pce_ov),
			       .tcu_scan_en(tcu_scan_en),
			       //.mb0_raddr(mb0_addr[5:0]),
			       //.mb0_iobuf_wr_en(mb0_iobuf_wr_en),
			       .dmu_ncu_d_pe(dmu_ncu_d_pe),
			       .dmu_ncu_siicr_pe(dmu_ncu_siicr_pe),
			       .dmu_ncu_ctag_ue(dmu_ncu_ctag_ue),
			       .dmu_ncu_ctag_ce(dmu_ncu_ctag_ce),
			       .dmu_ncu_ncucr_pe(dmu_ncu_ncucr_pe),
			       .dmu_ncu_ie(dmu_ncu_ie),
			       .niu_ncu_d_pe(niu_ncu_d_pe),
			       .niu_ncu_ctag_ue(niu_ncu_ctag_ue),
			       .niu_ncu_ctag_ce(niu_ncu_ctag_ce),
			       .sio_ncu_ctag_ce(sio_ncu_ctag_ce),
			       .sio_ncu_ctag_ue(sio_ncu_ctag_ue),
			       //.sio_ncu_d_pe(sio_ncu_d_pe),
			       .sii_ncu_dmuctag_ce(sii_ncu_dmuctag_ce),
			       .sii_ncu_dmuctag_ue(sii_ncu_dmuctag_ue),
			       .sii_ncu_dmua_pe(sii_ncu_dmua_pe),
			       .sii_ncu_dmud_pe(sii_ncu_dmud_pe),
			       .sii_ncu_niuctag_ce(sii_ncu_niuctag_ce),
			       .sii_ncu_niuctag_ue(sii_ncu_niuctag_ue),
			       .sii_ncu_niua_pe(sii_ncu_niua_pe),
			       .sii_ncu_niud_pe(sii_ncu_niud_pe),
			       .mcu0_ncu_ecc(mcu0_ncu_ecc),
			       .mcu0_ncu_fbr(mcu0_ncu_fbr),
			       .mcu0_ncu_fbu(mcu0_ncu_fbu),
			       .mcu1_ncu_ecc(mcu1_ncu_ecc),
			       .mcu1_ncu_fbr(mcu1_ncu_fbr),
			       .mcu1_ncu_fbu(mcu1_ncu_fbu),
			       .mcu2_ncu_ecc(mcu2_ncu_ecc),
			       .mcu2_ncu_fbr(mcu2_ncu_fbr),
			       .mcu2_ncu_fbu(mcu2_ncu_fbu),
			       .mcu3_ncu_ecc(mcu3_ncu_ecc),
			       .mcu3_ncu_fbr(mcu3_ncu_fbr),
			       .mcu3_ncu_fbu(mcu3_ncu_fbu),
			       .siierrsyn(siierrsyn[63:0]),
			       .siierrsyn_done(siierrsyn_done),
			       .io_rd_intman_d2(io_rd_intman_d2),
			       .ncuctag_ue(ncuctag_ue),
			       .ncuctag_ce(ncuctag_ce),
			       .ncusiid_pe(ncusiid_pe),
			       .ncudpsyn(ncudpsyn[15:0]),
			       .iobuf_ue_f(iobuf_ue_f),
			       .intbuf_ue_f(intbuf_ue_f),
			       .mondotbl_pe_f(mondotbl_pe_f),
  .mb0_addr(mb0_addr[5:0]),
  .mb0_wdata(mb0_wdata[7:0]),
  .mb0_run(mb0_run),
  .mb0_iobuf_wr_en(mb0_iobuf_wr_en),
  .mb1_cpubuf_wr_en(mb1_cpubuf_wr_en));
			       // outputs



///*ncu_i2cscd_ctl auto_template ( 
// 				 .scan_out( ) ); */
ncu_i2cscd_ctl ncu_i2cscd_ctl ( /*AUTOINST*/
			       // Outputs
			       .bounce_ack_rd(bounce_ack_rd),
			       .iobuf_avail(iobuf_avail),
			       .iobuf_din(iobuf_din[175:0]),
			       .iobuf_tail_ptr(iobuf_tail_ptr[4:0]),
			       .iobuf_tail_s(iobuf_tail_s[5:0]),
			       .iobuf_wr(iobuf_wr),
			       .io_intman_addr(io_intman_addr[6:0]),
			       .io_mondo_data0_din_s(io_mondo_data0_din_s[63:0]),
			       .io_mondo_data1_din_s(io_mondo_data1_din_s[63:0]),
			       .io_mondo_data_wr_addr_s(io_mondo_data_wr_addr_s[5:0]),
			       .io_mondo_data_wr_s(io_mondo_data_wr_s),
			       .intman_pchkf2i2c(intman_pchkf2i2c),
			       .ncu_ccu_stall(ncu_ccu_stall),
			       .ncu_dmu_mondo_ack(ncu_dmu_mondo_ack),
			       .ncu_dmu_mondo_id(ncu_dmu_mondo_id[5:0]),
			       .ncu_dmu_mondo_id_par(ncu_dmu_mondo_id_par),
			       .ncu_dmu_mondo_nack(ncu_dmu_mondo_nack),
			       .ncu_dmu_stall(ncu_dmu_stall),
			       .ncu_int_ack_rd(ncu_int_ack_rd),
			       .ncu_man_ack_rd(ncu_man_ack_rd),
			       .ncu_man_int_rd(ncu_man_int_rd),
			       .ncu_mcu0_stall(ncu_mcu0_stall),
			       .ncu_mcu1_stall(ncu_mcu1_stall),
			       .ncu_mcu2_stall(ncu_mcu2_stall),
			       .ncu_mcu3_stall(ncu_mcu3_stall),
			       .ncu_niu_stall(ncu_niu_stall),
			       .ncu_rcu_stall(ncu_rcu_stall),
			       .ncu_dbg1_stall(ncu_dbg1_stall),
			       .ncu_sii_gnt(ncu_sii_gnt),
			       .ncu_ssi_stall(ncu_ssi_stall),
			       .ncu_tcu_data(ncu_tcu_data[7:0]),
			       .ncu_tcu_vld(ncu_tcu_vld),
			       .rd_nack_rd(rd_nack_rd),
			       .sii_cr_id_rtn(sii_cr_id_rtn[3:0]),
			       .sii_cr_id_rtn_vld(sii_cr_id_rtn_vld),
			       .io_rd_intman_d2(io_rd_intman_d2),
			       .siierrsyn(siierrsyn[63:0]),
			       .siierrsyn_done(siierrsyn_done),
			       .ncudpsyn(ncudpsyn[15:0]),
			       .ncuctag_ue(ncuctag_ue),
			       .ncuctag_ce(ncuctag_ce),
			       .ncusiid_pe(ncusiid_pe),
			       // Inputs
			       .tcu_dbr_gateoff(tcu_dbr_gateoff_i),
			       .bounce_ack_packet(bounce_ack_packet[127:0]),
			       .bounce_ack_vld(bounce_ack_vld),
			       .ccu_ncu_data(ccu_ncu_data[3:0]),
			       .ccu_ncu_vld(ccu_ncu_vld),
			       .dmu_ncu_data(dmu_ncu_data[31:0]),
			       .dmu_ncu_vld(dmu_ncu_vld),
			       .intman_tbl_dout(intman_tbl_dout[11:0]),
			       .iobuf_head_f(iobuf_head_f[5:0]),
			       .scan_in(ncu_i2cscd_ctl_scanin),
			       .scan_out(ncu_i2cscd_ctl_scanout),
			       .iol2clk	(iol2clk),
			       .lhs_intman_acc(lhs_intman_acc),
			       .mcu0_ncu_data(mcu0_ncu_data[3:0]),
			       .mcu0_ncu_vld(mcu0_ncu_vld),
			       .mcu1_ncu_data(mcu1_ncu_data[3:0]),
			       .mcu1_ncu_vld(mcu1_ncu_vld),
			       .mcu2_ncu_data(mcu2_ncu_data[3:0]),
			       .mcu2_ncu_vld(mcu2_ncu_vld),
			       .mcu3_ncu_data(mcu3_ncu_data[3:0]),
			       .mcu3_ncu_vld(mcu3_ncu_vld),
			       .mondo_busy_vec_f(mondo_busy_vec_f[63:0]),
			       .mondoinvec(mondoinvec[5:0]),
			       .ncu_int_ack_packet(ncu_int_ack_packet[127:0]),
			       .ncu_int_ack_vld(ncu_int_ack_vld),
			       .ncu_man_ack_packet(ncu_man_ack_packet[127:0]),
			       .ncu_man_ack_vld(ncu_man_ack_vld),
			       .ncu_man_int_packet(ncu_man_int_packet[24:0]),
			       .ncu_man_int_vld(ncu_man_int_vld),
			       .niu_ncu_data(niu_ncu_data[31:0]),
			       .niu_ncu_vld(niu_ncu_vld),
			       .rcu_ncu_data(rcu_ncu_data[3:0]),
			       .rcu_ncu_vld(rcu_ncu_vld),
			       .rd_nack_packet(rd_nack_packet[63:0]),
			       .rd_nack_vld(rd_nack_vld),
			       .dbg1_ncu_data(dbg1_ncu_data[3:0]),
			       .dbg1_ncu_vld(dbg1_ncu_vld),
			       .sii_ncu_dparity(sii_ncu_dparity[1:0]),
			       .sii_ncu_data(sii_ncu_data[31:0]),
			       .sii_ncu_req(sii_ncu_req),
			       .sii_ncu_syn_data(sii_ncu_syn_data[3:0]),
			       .sii_ncu_syn_vld(sii_ncu_syn_vld),
			       .srvc_wr_ack(srvc_wr_ack),
			       .ssi_ncu_data(ssi_ncu_data[3:0]),
			       .ssi_ncu_vld(ssi_ncu_vld),
			       .tcu_clk_stop(tcu_clk_stop),
			       .tcu_ncu_stall(tcu_ncu_stall),
			       .tcu_pce_ov(tcu_pce_ov),
			       .tcu_scan_en(tcu_scan_en),
			       .tcu_aclk(tcu_aclk),
			       .tcu_bclk(tcu_bclk),
			       .wr_ack_iopkt(wr_ack_iopkt[152:0]),
			       .raserrce(raserrce),
			       .raserrue(raserrue),
			       .mb0_addr(mb0_addr[5:0]),
			       .mb0_wdata(mb0_wdata[7:0]),
			       .mb0_run(mb0_run),
			       .mb0_iobuf_wr_en(mb0_iobuf_wr_en),
			       .dmupio_wack_iopkt(dmupio_wack_iopkt[152:0]),
			       .dmupio_srvc_wack(dmupio_srvc_wack),
			       .ncuctag_uei(ncuctag_uei),
			       .ncuctag_cei(ncuctag_cei),
			       .ncusiid_pei(ncusiid_pei));

/* spare gate, 58957 cells/450 = 132 spare gate */

/*
spare_ctl_macro spares (num=132) (
                .scan_in(spares_scanin),
                .scan_out(spares_scanout),
                .l1clk  (l1clk)
        );
*/


// fixscan start:
assign ncu_c2iscd_ctl_scanin     = scan_in                  ;
assign ncu_i2cscd_ctl_scanin     = ncu_c2iscd_ctl_scanout   ;
//assign spares_scanin             = ncu_i2cscd_ctl_scanout   ;
//assign scan_out                  = spares_scanout           ;
assign scan_out = ncu_i2cscd_ctl_scanout   ;
// fixscan end:
endmodule





// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__width_6 (
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

module ncu_scd_ctl_msff_ctl_macro__width_1 (
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

module ncu_scd_ctl_msff_ctl_macro__en_1__width_1 (
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

module ncu_scd_ctl_l1clkhdr_ctl_macro (
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

module ncu_scd_ctl_msff_ctl_macro__en_1__width_64 (
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

module ncu_scd_ctl_msff_ctl_macro__en_1__width_40 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [39:0] fdin;
wire [38:0] so;

  input [39:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [39:0] dout;
  output scan_out;
assign fdin[39:0] = (din[39:0] & {40{en}}) | (dout[39:0] & ~{40{en}});






dff #(40)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[39:0]),
.si({scan_in,so[38:0]}),
.so({so[38:0],scan_out}),
.q(dout[39:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__en_1__width_2 (
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

module ncu_scd_ctl_msff_ctl_macro__en_1__width_6 (
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

module ncu_scd_ctl_msff_ctl_macro__en_1__width_25 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [24:0] fdin;
wire [23:0] so;

  input [24:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [24:0] dout;
  output scan_out;
assign fdin[24:0] = (din[24:0] & {25{en}}) | (dout[24:0] & ~{25{en}});






dff #(25)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[24:0]),
.si({scan_in,so[23:0]}),
.so({so[23:0],scan_out}),
.q(dout[24:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__en_1__width_128 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = (din[127:0] & {128{en}}) | (dout[127:0] & ~{128{en}});






dff #(128)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127:0]),
.si({scan_in,so[126:0]}),
.so({so[126:0],scan_out}),
.q(dout[127:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__en_1__width_55 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [54:0] fdin;
wire [53:0] so;

  input [54:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [54:0] dout;
  output scan_out;
assign fdin[54:0] = (din[54:0] & {55{en}}) | (dout[54:0] & ~{55{en}});






dff #(55)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[54:0]),
.si({scan_in,so[53:0]}),
.so({so[53:0],scan_out}),
.q(dout[54:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__en_1__width_22 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [21:0] fdin;
wire [20:0] so;

  input [21:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [21:0] dout;
  output scan_out;
assign fdin[21:0] = (din[21:0] & {22{en}}) | (dout[21:0] & ~{22{en}});






dff #(22)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[21:0]),
.si({scan_in,so[20:0]}),
.so({so[20:0],scan_out}),
.q(dout[21:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__en_1__width_20 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [19:0] fdin;
wire [18:0] so;

  input [19:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [19:0] dout;
  output scan_out;
assign fdin[19:0] = (din[19:0] & {20{en}}) | (dout[19:0] & ~{20{en}});






dff #(20)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[19:0]),
.si({scan_in,so[18:0]}),
.so({so[18:0],scan_out}),
.q(dout[19:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__en_1__width_8 (
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

module ncu_scd_ctl_msff_ctl_macro__en_1__width_12 (
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

module ncu_scd_ctl_msff_ctl_macro__en_1__width_24 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [23:0] fdin;
wire [22:0] so;

  input [23:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [23:0] dout;
  output scan_out;
assign fdin[23:0] = (din[23:0] & {24{en}}) | (dout[23:0] & ~{24{en}});






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

module ncu_scd_ctl_msff_ctl_macro__width_64 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = din[63:0];






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

module ncu_scd_ctl_msff_ctl_macro__width_8 (
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

module ncu_scd_ctl_msffi_ctl_macro__width_1 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  q_l, 
  scan_out);
  input [0:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] q_l;
  output scan_out;






msffi #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(din[0:0]),
.si(scan_in),
.so(scan_out),
.q_l(q_l[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__width_56 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [55:0] fdin;
wire [54:0] so;

  input [55:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [55:0] dout;
  output scan_out;
assign fdin[55:0] = din[55:0];






dff #(56)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[55:0]),
.si({scan_in,so[54:0]}),
.so({so[54:0],scan_out}),
.q(dout[55:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__en_1__width_3 (
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

module ncu_scd_ctl_msff_ctl_macro__width_63 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [62:0] fdin;
wire [61:0] so;

  input [62:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [62:0] dout;
  output scan_out;
assign fdin[62:0] = din[62:0];






dff #(63)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[62:0]),
.si({scan_in,so[61:0]}),
.so({so[61:0],scan_out}),
.q(dout[62:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__width_5 (
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

module ncu_scd_ctl_msff_ctl_macro__en_1__width_5 (
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

module ncu_scd_ctl_msff_ctl_macro__width_43 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [42:0] fdin;
wire [41:0] so;

  input [42:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [42:0] dout;
  output scan_out;
assign fdin[42:0] = din[42:0];






dff #(43)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[42:0]),
.si({scan_in,so[41:0]}),
.so({so[41:0],scan_out}),
.q(dout[42:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__en_1__width_43 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [42:0] fdin;
wire [41:0] so;

  input [42:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [42:0] dout;
  output scan_out;
assign fdin[42:0] = (din[42:0] & {43{en}}) | (dout[42:0] & ~{43{en}});






dff #(43)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[42:0]),
.si({scan_in,so[41:0]}),
.so({so[41:0],scan_out}),
.q(dout[42:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__en_1__width_59 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [58:0] fdin;
wire [57:0] so;

  input [58:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [58:0] dout;
  output scan_out;
assign fdin[58:0] = (din[58:0] & {59{en}}) | (dout[58:0] & ~{59{en}});






dff #(59)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[58:0]),
.si({scan_in,so[57:0]}),
.so({so[57:0],scan_out}),
.q(dout[58:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__en_1__width_61 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [60:0] fdin;
wire [59:0] so;

  input [60:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [60:0] dout;
  output scan_out;
assign fdin[60:0] = (din[60:0] & {61{en}}) | (dout[60:0] & ~{61{en}});






dff #(61)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[60:0]),
.si({scan_in,so[59:0]}),
.so({so[59:0],scan_out}),
.q(dout[60:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__width_2 (
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

module ncu_scd_ctl_msff_ctl_macro__width_9 (
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

module ncu_scd_ctl_msff_ctl_macro__width_7 (
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

module ncu_scd_ctl_msff_ctl_macro__width_4 (
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

module ncu_scd_ctl_msff_ctl_macro__width_40 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [39:0] fdin;
wire [38:0] so;

  input [39:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [39:0] dout;
  output scan_out;
assign fdin[39:0] = din[39:0];






dff #(40)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[39:0]),
.si({scan_in,so[38:0]}),
.so({so[38:0],scan_out}),
.q(dout[39:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__width_23 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [22:0] fdin;
wire [21:0] so;

  input [22:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [22:0] dout;
  output scan_out;
assign fdin[22:0] = din[22:0];






dff #(23)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[22:0]),
.si({scan_in,so[21:0]}),
.so({so[21:0],scan_out}),
.q(dout[22:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__width_3 (
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




// Local Variables:
// verilog-auto-sense-defines-constant:t
// End:









// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__en_1__width_144 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [143:0] fdin;
wire [142:0] so;

  input [143:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [143:0] dout;
  output scan_out;
assign fdin[143:0] = (din[143:0] & {144{en}}) | (dout[143:0] & ~{144{en}});






dff #(144)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[143:0]),
.si({scan_in,so[142:0]}),
.so({so[142:0],scan_out}),
.q(dout[143:0])
);












endmodule








// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__en_1__width_129 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [128:0] fdin;
wire [127:0] so;

  input [128:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [128:0] dout;
  output scan_out;
assign fdin[128:0] = (din[128:0] & {129{en}}) | (dout[128:0] & ~{129{en}});






dff #(129)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[128:0]),
.si({scan_in,so[127:0]}),
.so({so[127:0],scan_out}),
.q(dout[128:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__en_1__width_51 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [50:0] fdin;
wire [49:0] so;

  input [50:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [50:0] dout;
  output scan_out;
assign fdin[50:0] = (din[50:0] & {51{en}}) | (dout[50:0] & ~{51{en}});






dff #(51)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[50:0]),
.si({scan_in,so[49:0]}),
.so({so[49:0],scan_out}),
.q(dout[50:0])
);












endmodule






// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__en_1__width_127 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [126:0] fdin;
wire [125:0] so;

  input [126:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [126:0] dout;
  output scan_out;
assign fdin[126:0] = (din[126:0] & {127{en}}) | (dout[126:0] & ~{127{en}});






dff #(127)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[126:0]),
.si({scan_in,so[125:0]}),
.so({so[125:0],scan_out}),
.q(dout[126:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__en_1__width_47 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [46:0] fdin;
wire [45:0] so;

  input [46:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [46:0] dout;
  output scan_out;
assign fdin[46:0] = (din[46:0] & {47{en}}) | (dout[46:0] & ~{47{en}});






dff #(47)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[46:0]),
.si({scan_in,so[45:0]}),
.so({so[45:0],scan_out}),
.q(dout[46:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__width_16 (
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

module ncu_scd_ctl_msff_ctl_macro__width_128 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = din[127:0];






dff #(128)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127:0]),
.si({scan_in,so[126:0]}),
.so({so[126:0],scan_out}),
.q(dout[127:0])
);












endmodule




// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__width_32 (
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

module ncu_scd_ctl_msff_ctl_macro__en_1__width_16 (
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


// Local Variables:
// verilog-auto-sense-defines-constant:t
// End:






// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__width_15 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [14:0] fdin;
wire [13:0] so;

  input [14:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [14:0] dout;
  output scan_out;
assign fdin[14:0] = din[14:0];






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





//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module ncu_scd_ctl_spare_ctl_macro__num_11 (
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
assign scan_out = so_10;



endmodule




// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__en_1__width_32 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = (din[31:0] & {32{en}}) | (dout[31:0] & ~{32{en}});






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

module ncu_scd_ctl_msff_ctl_macro__en_1__width_140 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [139:0] fdin;
wire [138:0] so;

  input [139:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [139:0] dout;
  output scan_out;
assign fdin[139:0] = (din[139:0] & {140{en}}) | (dout[139:0] & ~{140{en}});






dff #(140)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[139:0]),
.si({scan_in,so[138:0]}),
.so({so[138:0],scan_out}),
.q(dout[139:0])
);












endmodule






// any PARAMS parms go into naming of macro

module ncu_scd_ctl_msff_ctl_macro__en_1__width_4 (
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

