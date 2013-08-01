// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_c2iscd_ctl.v
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
module ncu_c2iscd_ctl (
  bounce_ack_rd, 
  ccu_ncu_stall, 
  core_running_status, 
  cpubuf_dout, 
  cpubuf_tail_f, 
  dmu_ncu_stall, 
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
  dmubuf0_dout, 
  dmubuf1_dout, 
  iobuf_avail, 
  io_intman_addr, 
  iol2clk, 
  mcu0_ncu_stall, 
  mcu1_ncu_stall, 
  mcu2_ncu_stall, 
  mcu3_ncu_stall, 
  ncu_int_ack_rd, 
  ncu_man_ack_rd, 
  ncu_man_int_rd, 
  niu_ncu_stall, 
  rcu_ncu_stall, 
  rd_nack_rd, 
  aclk_wmr, 
  wmr_protect, 
  dbg1_ncu_stall, 
  rst_ncu_unpark_thread, 
  rst_ncu_xir_, 
  scan_in, 
  sii_cr_id_rtn, 
  sii_cr_id_rtn_vld, 
  ssi_ncu_stall, 
  tap_mondo_acc_addr_invld_d2_f, 
  tap_mondo_acc_seq_d2_f, 
  tap_mondo_dout_d2_f, 
  tcu_ncu_data, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_clk_stop, 
  tcu_ncu_vld, 
  tcu_pce_ov, 
  tcu_scan_en, 
  tcu_dbr_gateoff, 
  mb0_addr, 
  mb0_wdata, 
  mb0_run, 
  mb0_iobuf_wr_en, 
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
  ncu_rst_fatal_error, 
  ncu_tcu_soc_error, 
  raserrce, 
  raserrue, 
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
  siierrsyn, 
  siierrsyn_done, 
  io_rd_intman_d2, 
  ncuctag_ue, 
  ncuctag_uei, 
  ncuctag_ce, 
  ncuctag_cei, 
  ncusiid_pe, 
  ncusiid_pei, 
  ncudpsyn, 
  iobuf_ue_f, 
  iobuf_uei, 
  intbuf_ue_f, 
  intbuf_uei, 
  mondotbl_pe_f, 
  mondotbl_pei, 
  bounce_ack_packet, 
  bounce_ack_vld, 
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
  intman_pchkf2i2c, 
  intman_tbl_raddr, 
  intman_tbl_waddr, 
  intman_tbl_din, 
  intman_tbl_rden, 
  intman_tbl_wr, 
  dmubuf_din, 
  dmubuf_raddr, 
  dmubuf_waddr, 
  dmubuf_rden, 
  dmubuf0_wr, 
  dmubuf1_wr, 
  l2pm, 
  ncu_spc_pm, 
  ncu_spc_ba01, 
  l2idxhs_en_status, 
  lhs_intman_acc, 
  mondoinvec, 
  ncu_ccu_data, 
  ncu_ccu_vld, 
  ncu_dmu_data, 
  ncu_dmu_mmu_addr_vld, 
  ncu_dmu_dpar, 
  ncu_dmu_pio_data, 
  ncu_dmu_pio_hdr_vld, 
  ncu_dmu_vld, 
  ncu_int_ack_packet, 
  ncu_int_ack_vld, 
  ncu_man_ack_packet, 
  ncu_man_ack_vld, 
  ncu_man_int_packet, 
  ncu_man_int_vld, 
  ncu_mcu0_data, 
  ncu_mcu0_vld, 
  ncu_mcu1_data, 
  ncu_mcu1_vld, 
  ncu_mcu2_data, 
  ncu_mcu2_vld, 
  ncu_mcu3_data, 
  ncu_mcu3_vld, 
  ncu_niu_data, 
  ncu_niu_vld, 
  ncu_rcu_data, 
  ncu_rcu_vld, 
  ncu_dbg1_data, 
  ncu_dbg1_vld, 
  ncu_rst_xir_done, 
  ncu_ssi_data, 
  ncu_ssi_vld, 
  ncu_tcu_stall, 
  ncu_tcu_bank_avail, 
  rd_nack_packet, 
  rd_nack_vld, 
  scan_out, 
  srvc_wr_ack, 
  tap_mondo_acc_addr_s, 
  tap_mondo_acc_seq_s, 
  tap_mondo_din_s, 
  tap_mondo_wr_s, 
  wr_ack_iopkt, 
  cpubuf_mb0_data, 
  dmupio_wack_iopkt, 
  dmupio_srvc_wack, 
  ncu_dbg1_error_event, 
  tcu_wmr_vec_mask, 
  cmp_tick_enable, 
  ncu_scksel) ;
wire pas;
wire pa_ld;
wire cpubuf_rd;
wire [3:0] cpu_packet_type;
wire [2:0] cpu_packet_size;
wire cpubuf_pe;
wire cpubuf_ue;
wire c2i_packet_vld;
wire c2i_packet_is_rd_req;
wire c2i_packet_is_wr_req;
wire dmupio_ucb_sel;
wire [1:0] com_map;
wire [11:0] dmupio_addr35to24;
wire dmucsr_ucb_sel;
wire ssi_ucb_sel;
wire mcu0_ucb_sel;
wire mcu1_ucb_sel;
wire mcu2_ucb_sel;
wire mcu3_ucb_sel;
wire ccu_ucb_sel;
wire rcu_ucb_sel;
wire dbg1_ucb_sel;
wire niu_ucb_sel;
wire ncu_man_ucb_sel;
wire ncu_int_ucb_sel;
wire bounce_ucb_sel;
wire rd_nack_ucb_sel;
wire iob_tap_busy;
wire tap_sel;
wire ncu_c2isc_ctl_scanin;
wire ncu_c2isc_ctl_scanout;
wire [128:0] pcx_packet;
wire pcx_packet_ue;
wire pcx_packet_pe;
wire [39:0] c2i_packet_addr;
wire [11:0] mem32_base;
wire [11:0] mem32_mask;
wire mem32_en;
wire [11:0] mem64_base;
wire [11:0] mem64_mask;
wire mem64_en;
wire [11:0] iocon_base;
wire [11:0] iocon_mask;
wire iocon_en;
wire dmupio_ucb_buf_acpt;
wire dmucsr_ucb_buf_acpt;
wire ssi_ucb_buf_acpt;
wire mcu0_ucb_buf_acpt;
wire mcu1_ucb_buf_acpt;
wire mcu2_ucb_buf_acpt;
wire mcu3_ucb_buf_acpt;
wire ccu_ucb_buf_acpt;
wire rcu_ucb_buf_acpt;
wire dbg1_ucb_buf_acpt;
wire niu_ucb_buf_acpt;
wire ncu_man_ucb_buf_acpt;
wire ncu_int_ucb_buf_acpt;
wire bounce_ucb_buf_acpt;
wire rd_nack_ucb_buf_acpt;
wire c2i_wait;
wire tap_iob_packet_vld;
wire [127:0] tap_iob_packet;
wire [63:0] mmufsh_data;
wire mmufsh_vld;
wire dmu_cr_id_rtn_erri;
wire dmubuf_pei;
wire cpubuf_uei;
wire cpubuf_pei;
wire ncu_ctrl_ctl_scanin;
wire ncu_ctrl_ctl_scanout;
wire [127:0] c2i_packet;
wire [63:0] c2i_rd_nack_packet;
wire mmu_ld;
wire mb1_intman_wr_en;
wire mb1_intman_rd_en;
wire dmu_cr_id_rtn_err;
wire dmubuf_pue;
wire [46:0] dmubufsyn;
wire [50:0] cpubufsyn;
wire mb1_dmubuf0_wr_en;
wire mb1_dmubuf0_rd_en;
wire mb1_dmubuf1_wr_en;
wire mb1_dmubuf1_rd_en;
wire mb1_cpubuf_rd_en;
wire ncu_c2isd_ctl_scanin;
wire ncu_c2isd_ctl_scanout;
wire dmupio_ucb_buf_scanin;
wire dmupio_ucb_buf_scanout;
wire dmucsr_ucb_buf_scanin;
wire dmucsr_ucb_buf_scanout;
wire ssi_ucb_buf_scanin;
wire ssi_ucb_buf_scanout;
wire mcu0_ucb_buf_scanin;
wire mcu0_ucb_buf_scanout;
wire mcu1_ucb_buf_scanin;
wire mcu1_ucb_buf_scanout;
wire mcu2_ucb_buf_scanin;
wire mcu2_ucb_buf_scanout;
wire mcu3_ucb_buf_scanin;
wire mcu3_ucb_buf_scanout;
wire ccu_ucb_buf_scanin;
wire ccu_ucb_buf_scanout;
wire rcu_ucb_buf_scanin;
wire rcu_ucb_buf_scanout;
wire dbg1_ucb_buf_scanin;
wire dbg1_ucb_buf_scanout;
wire niu_ucb_buf_scanin;
wire niu_ucb_buf_scanout;
wire tcu_ucb_buf_scanin;
wire tcu_ucb_buf_scanout;


input			bounce_ack_rd;		// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input			ccu_ncu_stall;		// To ccu_ucb_buf of ncu_c2ibuf4_ctl.v
input [63:0]		core_running_status;	// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input [143:0]		cpubuf_dout;		// To ncu_c2isd_ctl of ncu_c2isd_ctl.v
input [5:0]		cpubuf_tail_f;		// To ncu_c2isc_ctl of ncu_c2isc_ctl.v
input			dmu_ncu_stall;		// To dmucsr_ucb_buf of ncu_c2ibuf32_ctl.v
input [3:0]		dmu_ncu_wrack_tag;	// To dmupio_ucb_buf of ncu_c2ibufpio_ctl.v
input			dmu_ncu_wrack_vld;	// To dmupio_ucb_buf of ncu_c2ibufpio_ctl.v
input 			dmu_ncu_wrack_par;	// to ncu_c2ibufpio_ctl.sv
input			efu_ncu_bankavail_dshift;// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input			efu_ncu_coreavail_dshift;// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
//input			efu_ncu_fuse_clk1;	// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input			efu_ncu_fuse_data;	// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input			efu_ncu_fusestat_dshift;// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input			efu_ncu_sernum0_dshift;	// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input			efu_ncu_sernum1_dshift;	// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input			efu_ncu_sernum2_dshift;	// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input [15:0]		intman_tbl_dout;	// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input [143:0]		dmubuf0_dout;	        // To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input [143:0]		dmubuf1_dout;	        // To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input			iobuf_avail;		// To ncu_c2isc_ctl of ncu_c2isc_ctl.v
input [6:0]		io_intman_addr;		// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input			iol2clk;		// To ncu_c2isc_ctl of ncu_c2isc_ctl.v, ...
input			mcu0_ncu_stall;		// To mcu0_ucb_buf of ncu_c2ibuf4_ctl.v
input			mcu1_ncu_stall;		// To mcu1_ucb_buf of ncu_c2ibuf4_ctl.v
input			mcu2_ncu_stall;		// To mcu2_ucb_buf of ncu_c2ibuf4_ctl.v
input			mcu3_ncu_stall;		// To mcu3_ucb_buf of ncu_c2ibuf4_ctl.v
input			ncu_int_ack_rd;		// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input			ncu_man_ack_rd;		// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input			ncu_man_int_rd;		// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input			niu_ncu_stall;		// To niu_ucb_buf of ncu_c2ibuf32_ctl.v
input			rcu_ncu_stall;		// To rcu_ucb_buf of ncu_c2ibuf4_ctl.v
input			rd_nack_rd;		// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
//input			rng_ncu_stall;		// To rng_ucb_buf of ncu_c2ibuf4_ctl.v
input			aclk_wmr;
input			wmr_protect;
input                   dbg1_ncu_stall;          // To dbg1_ucb_buf of ncu_c2ibuf4_ctl.v
input			rst_ncu_unpark_thread;	// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input			rst_ncu_xir_;		// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input			scan_in;		// To ncu_c2isc_ctl of ncu_c2isc_ctl.v
input [3:0]		sii_cr_id_rtn;		// To dmupio_ucb_buf of ncu_c2ibufpio_ctl.v
input			sii_cr_id_rtn_vld;	// To dmupio_ucb_buf of ncu_c2ibufpio_ctl.v
input			ssi_ncu_stall;		// To ssi_ucb_buf of ncu_c2ibuf4_ctl.v
input			tap_mondo_acc_addr_invld_d2_f;// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input			tap_mondo_acc_seq_d2_f;	// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input [63:0]		tap_mondo_dout_d2_f;	// To ncu_ctrl_ctl of ncu_ctrl_ctl.v
input [7:0]		tcu_ncu_data;		// To tcu_ucb_buf of ncu_ucbbusin8_ctl.v

input			tcu_aclk;		// To ncu_c2isc_ctl of ncu_c2isc_ctl.v, ...
input			tcu_bclk;		// To ncu_c2isc_ctl of ncu_c2isc_ctl.v, ...
input			tcu_clk_stop;		// To ncu_c2isc_ctl of ncu_c2isc_ctl.v, ...
input			tcu_ncu_vld;		// To tcu_ucb_buf of ncu_ucbbusin8_ctl.v
input			tcu_pce_ov;		// To ncu_c2isc_ctl of ncu_c2isc_ctl.v, ...
input			tcu_scan_en;		// To ncu_c2isc_ctl of ncu_c2isc_ctl.v, ...
input			tcu_dbr_gateoff;
//input  			mb0_cpubuf_wr_en;
input [5:0]		mb0_addr;
input [7:0]		mb0_wdata;
input			mb0_run;
input			mb0_iobuf_wr_en;
input			tcu_mbist_bisi_en;
output			mb1_run;
output [6:0]		mb1_addr;
output [7:0]		mb1_wdata;
output 			mb1_cpubuf_wr_en;

//mb1 connection from tcu//
output			mb1_scanout;
output			mb1_done;
output			mb1_fail;
input			mb1_start;
input			mb1_scanin;
input			tcu_mbist_user_mode;

// err ecc //
output		ncu_rst_fatal_error;
output		ncu_tcu_soc_error;
output		raserrce;
output		raserrue;

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


input	[63:0]	siierrsyn;
input		siierrsyn_done;

input		io_rd_intman_d2;
input		ncuctag_ue;
output		ncuctag_uei;
input		ncuctag_ce;
output		ncuctag_cei;
input		ncusiid_pe;
output		ncusiid_pei;
input  [15:0]	ncudpsyn;

input		iobuf_ue_f;
output		iobuf_uei;
input		intbuf_ue_f;
output		intbuf_uei;
input		mondotbl_pe_f;
output		mondotbl_pei;



output [127:0]		bounce_ack_packet;	// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output			bounce_ack_vld;		// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
//output [7:0]		core_enable_status;	// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output ncu_spc7_core_enable_status;
output ncu_spc6_core_enable_status;
output ncu_spc5_core_enable_status;
output ncu_spc4_core_enable_status;
output ncu_spc3_core_enable_status;
output ncu_spc2_core_enable_status;
output ncu_spc1_core_enable_status;
output ncu_spc0_core_enable_status;

output [63:0]		core_running;		// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output [7:0]		coreavail;		// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output [4:0]		cpubuf_head_ptr;	// From ncu_c2isc_ctl of ncu_c2isc_ctl.v
output [5:0]		cpubuf_head_s;		// From ncu_c2isc_ctl of ncu_c2isc_ctl.v
output			cpubuf_rden;		// From ncu_c2isc_ctl of ncu_c2isc_ctl.v
output			intman_pchkf2i2c;
output [6:0]		intman_tbl_raddr;	// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output [6:0]		intman_tbl_waddr;	// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output [15:0]		intman_tbl_din;		// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output			intman_tbl_rden;	// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output			intman_tbl_wr;		// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output [143:0]		dmubuf_din;
output [4:0]		dmubuf_raddr;
output [4:0]		dmubuf_waddr;
output			dmubuf_rden;
output			dmubuf0_wr;
output			dmubuf1_wr;
output [4:0]		l2pm;			// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output			ncu_spc_pm;
output			ncu_spc_ba01;
output			l2idxhs_en_status;
output			lhs_intman_acc;		// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output [5:0]		mondoinvec;		// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output [3:0]		ncu_ccu_data;		// From ccu_ucb_buf of ncu_c2ibuf4_ctl.v
output			ncu_ccu_vld;		// From ccu_ucb_buf of ncu_c2ibuf4_ctl.v
output [31:0]		ncu_dmu_data;		// From dmucsr_ucb_buf of ncu_c2ibuf32_ctl.v
output			ncu_dmu_mmu_addr_vld;	// From dmupio_ucb_buf of ncu_c2ibufpio_ctl.v
output [1:0]		ncu_dmu_dpar;		// From dmupio_ucb_buf of ncu_c2ibufpio_ctl.v
output [63:0]		ncu_dmu_pio_data;	// From dmupio_ucb_buf of ncu_c2ibufpio_ctl.v
output			ncu_dmu_pio_hdr_vld;	// From dmupio_ucb_buf of ncu_c2ibufpio_ctl.v
output			ncu_dmu_vld;		// From dmucsr_ucb_buf of ncu_c2ibuf32_ctl.v
output [127:0]		ncu_int_ack_packet;	// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output			ncu_int_ack_vld;	// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output [127:0]		ncu_man_ack_packet;	// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output			ncu_man_ack_vld;	// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output [24:0]		ncu_man_int_packet;	// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output			ncu_man_int_vld;	// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output [3:0]		ncu_mcu0_data;		// From mcu0_ucb_buf of ncu_c2ibuf4_ctl.v
output			ncu_mcu0_vld;		// From mcu0_ucb_buf of ncu_c2ibuf4_ctl.v
output [3:0]		ncu_mcu1_data;		// From mcu1_ucb_buf of ncu_c2ibuf4_ctl.v
output			ncu_mcu1_vld;		// From mcu1_ucb_buf of ncu_c2ibuf4_ctl.v
output [3:0]		ncu_mcu2_data;		// From mcu2_ucb_buf of ncu_c2ibuf4_ctl.v
output			ncu_mcu2_vld;		// From mcu2_ucb_buf of ncu_c2ibuf4_ctl.v
output [3:0]		ncu_mcu3_data;		// From mcu3_ucb_buf of ncu_c2ibuf4_ctl.v
output			ncu_mcu3_vld;		// From mcu3_ucb_buf of ncu_c2ibuf4_ctl.v
output [31:0]		ncu_niu_data;		// From niu_ucb_buf of ncu_c2ibuf32_ctl.v
output			ncu_niu_vld;		// From niu_ucb_buf of ncu_c2ibuf32_ctl.v
output [3:0]		ncu_rcu_data;		// From rcu_ucb_buf of ncu_c2ibuf4_ctl.v
output			ncu_rcu_vld;		// From rcu_ucb_buf of ncu_c2ibuf4_ctl.v
//output [3:0]		ncu_rng_data;		// From rng_ucb_buf of ncu_c2ibuf4_ctl.v
//output			ncu_rng_vld;		// From rng_ucb_buf of ncu_c2ibuf4_ctl.v
output [3:0]            ncu_dbg1_data;           // From dbg1_ucb_buf of ncu_c2ibuf4_ctl.v
output                  ncu_dbg1_vld;            // From dbg1_ucb_buf of ncu_c2ibuf4_ctl.v
output			ncu_rst_xir_done;	// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output [3:0]		ncu_ssi_data;		// From ssi_ucb_buf of ncu_c2ibuf4_ctl.v
output			ncu_ssi_vld;		// From ssi_ucb_buf of ncu_c2ibuf4_ctl.v
output			ncu_tcu_stall;		// From tcu_ucb_buf of ncu_ucbbusin8_ctl.v
output [7:0]		ncu_tcu_bank_avail;     // from ncu_ctrl_ctl
//output [3:0]		ncu_tcu_bank_en_status;  // from ncu_ctrl_ctl
output [63:0]		rd_nack_packet;		// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output			rd_nack_vld;		// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output			scan_out;		// From tcu_ucb_buf of ncu_ucbbusin8_ctl.v
output			srvc_wr_ack;		// From ncu_c2isc_ctl of ncu_c2isc_ctl.v
output [21:0]		tap_mondo_acc_addr_s;	// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output			tap_mondo_acc_seq_s;	// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output [63:0]		tap_mondo_din_s;	// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output			tap_mondo_wr_s;		// From ncu_ctrl_ctl of ncu_ctrl_ctl.v
output [152:0]		wr_ack_iopkt;	// From ncu_c2isd_ctl of ncu_c2isd_ctl.v
output [7:0]		cpubuf_mb0_data;
output [152:0]		dmupio_wack_iopkt;	// From dmupio_ucb_buf of ncu_c2ibufpio_ctl.v
output			dmupio_srvc_wack;	// From dmupio_ucb_buf of ncu_c2ibufpio_ctl.v
output			ncu_dbg1_error_event;  // from ncu_ctrl_ctl.sv
output			tcu_wmr_vec_mask;
output			cmp_tick_enable;
output [1:0] 		ncu_scksel;

/*autowire*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
// End of automatics



/*****************************************************************
 * cpu-to-io slow control
 *****************************************************************/
///* ncu_c2isc_ctl auto_template ( 
//				.scan_in (ncu_c2isc_ctl_scanin),
// 			    	.scan_out(ncu_c2isc_ctl_scanout) ); */
ncu_c2isc_ctl ncu_c2isc_ctl ( /*AUTOINST*/
			     // Outputs
			     .pas	(pas),
			     .pa_ld	(pa_ld),
			     .cpubuf_rd	(cpubuf_rd),
			     .cpu_packet_type(cpu_packet_type[3:0]),
			     .cpu_packet_size(cpu_packet_size[2:0]),
			     .cpubuf_head_s(cpubuf_head_s[5:0]),
			     .cpubuf_head_ptr(cpubuf_head_ptr[4:0]),
			     .cpubuf_rden(cpubuf_rden),
			     .cpubuf_pe	(cpubuf_pe),
			     .cpubuf_ue	(cpubuf_ue),
			     .c2i_packet_vld(c2i_packet_vld),
			     .c2i_packet_is_rd_req(c2i_packet_is_rd_req),
			     .c2i_packet_is_wr_req(c2i_packet_is_wr_req),
			     .dmupio_ucb_sel(dmupio_ucb_sel),
			     .com_map	(com_map[1:0]),
			     .dmupio_addr35to24(dmupio_addr35to24[11:0]),
			     .dmucsr_ucb_sel(dmucsr_ucb_sel),
			     .ssi_ucb_sel(ssi_ucb_sel),
			     .mcu0_ucb_sel(mcu0_ucb_sel),
			     .mcu1_ucb_sel(mcu1_ucb_sel),
			     .mcu2_ucb_sel(mcu2_ucb_sel),
			     .mcu3_ucb_sel(mcu3_ucb_sel),
			     .ccu_ucb_sel(ccu_ucb_sel),
			     .rcu_ucb_sel(rcu_ucb_sel),
			     .dbg1_ucb_sel(dbg1_ucb_sel),
			     .niu_ucb_sel(niu_ucb_sel),
			     .ncu_man_ucb_sel(ncu_man_ucb_sel),
			     .ncu_int_ucb_sel(ncu_int_ucb_sel),
			     .bounce_ucb_sel(bounce_ucb_sel),
			     .rd_nack_ucb_sel(rd_nack_ucb_sel),
			     .srvc_wr_ack(srvc_wr_ack),
			     .iob_tap_busy(iob_tap_busy),
			     .tap_sel	(tap_sel),
			     // Inputs
			     .scan_in(ncu_c2isc_ctl_scanin),
			     .scan_out(ncu_c2isc_ctl_scanout),
			     .iol2clk	(iol2clk),
			     .tcu_scan_en(tcu_scan_en),
			     .tcu_pce_ov(tcu_pce_ov),
			     .tcu_clk_stop(tcu_clk_stop),
			     .tcu_aclk	(tcu_aclk),
			     .tcu_bclk	(tcu_bclk),
			     .pcx_packet(pcx_packet[128:0]),
			     .pcx_packet_ue(pcx_packet_ue),
			     .pcx_packet_pe(pcx_packet_pe),
			     .c2i_packet_addr(c2i_packet_addr[39:0]),
			     .cpubuf_tail_f(cpubuf_tail_f[5:0]),
			     .mem32_base(mem32_base[11:0]),
			     .mem32_mask(mem32_mask[11:0]),
			     .mem32_en	(mem32_en),
			     .mem64_base(mem64_base[11:0]),
			     .mem64_mask(mem64_mask[11:0]),
			     .mem64_en	(mem64_en),
			     .iocon_base(iocon_base[11:0]),
			     .iocon_mask(iocon_mask[11:0]),
			     .iocon_en	(iocon_en),
			     .mb0_raddr	(mb0_addr[5:0]),
			     //.mb0_cpubuf_sel(mb0_cpubuf_sel),
			     .dmupio_ucb_buf_acpt(dmupio_ucb_buf_acpt),
			     .dmucsr_ucb_buf_acpt(dmucsr_ucb_buf_acpt),
			     .ssi_ucb_buf_acpt(ssi_ucb_buf_acpt),
			     .mcu0_ucb_buf_acpt(mcu0_ucb_buf_acpt),
			     .mcu1_ucb_buf_acpt(mcu1_ucb_buf_acpt),
			     .mcu2_ucb_buf_acpt(mcu2_ucb_buf_acpt),
			     .mcu3_ucb_buf_acpt(mcu3_ucb_buf_acpt),
			     .ccu_ucb_buf_acpt(ccu_ucb_buf_acpt),
			     .rcu_ucb_buf_acpt(rcu_ucb_buf_acpt),
			     .dbg1_ucb_buf_acpt(dbg1_ucb_buf_acpt),
			     .niu_ucb_buf_acpt(niu_ucb_buf_acpt),
			     .ncu_man_ucb_buf_acpt(ncu_man_ucb_buf_acpt),
			     .ncu_int_ucb_buf_acpt(ncu_int_ucb_buf_acpt),
			     .bounce_ucb_buf_acpt(bounce_ucb_buf_acpt),
			     .rd_nack_ucb_buf_acpt(rd_nack_ucb_buf_acpt),
			     .iobuf_avail(iobuf_avail),
			     .c2i_wait	(c2i_wait),
			     .tap_iob_packet_vld(tap_iob_packet_vld),
			     .tap_iob_packet(tap_iob_packet[127:0]),
  .mb1_run(mb1_run),
  .mb1_addr(mb1_addr[5:0]),
  .mb1_cpubuf_rd_en(mb1_cpubuf_rd_en));


///* ncu_ctrl_ctl auto_template ( .scan_in  (ncu_ctrl_ctl_scanin),
// 			.scan_out (ncu_ctrl_ctl_scanout) ); */
ncu_ctrl_ctl ncu_ctrl_ctl ( /*AUTOINST*/
			   // Outputs
			   .ncu_man_ucb_buf_acpt(ncu_man_ucb_buf_acpt),
			   .ncu_int_ucb_buf_acpt(ncu_int_ucb_buf_acpt),
			   .bounce_ucb_buf_acpt(bounce_ucb_buf_acpt),
			   .rd_nack_ucb_buf_acpt(rd_nack_ucb_buf_acpt),
			   .tap_mondo_acc_addr_s(tap_mondo_acc_addr_s[21:0]),
			   .tap_mondo_acc_seq_s(tap_mondo_acc_seq_s),
			   .tap_mondo_wr_s(tap_mondo_wr_s),
			   .tap_mondo_din_s(tap_mondo_din_s[63:0]),
			   .mmufsh_data	(mmufsh_data[63:0]),
			   .mmufsh_vld	(mmufsh_vld),
			   .mem32_mask	(mem32_mask[11:0]),
			   .mem32_base	(mem32_base[11:0]),
			   .mem32_en	(mem32_en),
			   .mem64_mask	(mem64_mask[11:0]),
			   .mem64_base	(mem64_base[11:0]),
			   .mem64_en	(mem64_en),
			   .iocon_mask	(iocon_mask[11:0]),
			   .iocon_base	(iocon_base[11:0]),
			   .iocon_en	(iocon_en),
			   .ncu_man_int_vld(ncu_man_int_vld),
			   .ncu_man_int_packet(ncu_man_int_packet[24:0]),
			   .ncu_man_ack_vld(ncu_man_ack_vld),
			   .ncu_man_ack_packet(ncu_man_ack_packet[127:0]),
			   .ncu_int_ack_vld(ncu_int_ack_vld),
			   .ncu_int_ack_packet(ncu_int_ack_packet[127:0]),
			   .bounce_ack_vld(bounce_ack_vld),
			   .bounce_ack_packet(bounce_ack_packet[127:0]),
			   .rd_nack_vld	(rd_nack_vld),
			   .rd_nack_packet(rd_nack_packet[63:0]),
			   .mondoinvec	(mondoinvec[5:0]),
			   .lhs_intman_acc(lhs_intman_acc),
			   .ncu_rst_xir_done(ncu_rst_xir_done),
			   .ncu_spc7_core_enable_status(ncu_spc7_core_enable_status),
			   .ncu_spc6_core_enable_status(ncu_spc6_core_enable_status),
			   .ncu_spc5_core_enable_status(ncu_spc5_core_enable_status),
			   .ncu_spc4_core_enable_status(ncu_spc4_core_enable_status),
			   .ncu_spc3_core_enable_status(ncu_spc3_core_enable_status),
			   .ncu_spc2_core_enable_status(ncu_spc2_core_enable_status),
			   .ncu_spc1_core_enable_status(ncu_spc1_core_enable_status),
			   .ncu_spc0_core_enable_status(ncu_spc0_core_enable_status),
			   //.core_enable_status(core_enable_status[7:0]),
			   .core_running(core_running[63:0]),
			   .coreavail	(coreavail[7:0]),
			   .l2pm	(l2pm[4:0]),
			   .ncu_spc_pm(ncu_spc_pm),
			   .ncu_spc_ba01(ncu_spc_ba01),
			   .l2idxhs_en_status(l2idxhs_en_status),
			   .intman_tbl_raddr(intman_tbl_raddr[6:0]),
			   .intman_tbl_waddr(intman_tbl_waddr[6:0]),
			   .intman_tbl_wr(intman_tbl_wr),
			   .intman_tbl_rden(intman_tbl_rden),
			   .intman_tbl_din(intman_tbl_din[15:0]),
			   .intman_pchkf2i2c(intman_pchkf2i2c),
			   .ncu_rst_fatal_error(ncu_rst_fatal_error),
			   .ncu_tcu_soc_error(ncu_tcu_soc_error),
			   .raserrce(raserrce),
			   .raserrue(raserrue),
			   .ncu_tcu_bank_avail(ncu_tcu_bank_avail[7:0]),
			   //.ncu_tcu_bank_en_status(ncu_tcu_bank_en_status[3:0]),
			   .dmu_cr_id_rtn_erri(dmu_cr_id_rtn_erri),
			   .ncu_niu_d_pei(ncu_niu_d_pei),
			   .ncu_niu_ctag_uei(ncu_niu_ctag_uei),
			   .ncu_niu_ctag_cei(ncu_niu_ctag_cei),
			   .ncu_sio_ctag_cei(ncu_sio_ctag_cei),
			   .ncu_sio_ctag_uei(ncu_sio_ctag_uei),
			   .ncu_sio_d_pei(ncu_sio_d_pei),
			   .ncu_dmu_d_pei(ncu_dmu_d_pei),
			   .ncu_dmu_siicr_pei(ncu_dmu_siicr_pei),
			   .ncu_dmu_ctag_uei(ncu_dmu_ctag_uei),
			   .ncu_dmu_ctag_cei(ncu_dmu_ctag_cei),
			   .ncu_dmu_ncucr_pei(ncu_dmu_ncucr_pei),
			   .ncu_dmu_iei	(ncu_dmu_iei),
			   .ncu_sii_dmua_pei(ncu_sii_dmua_pei),
			   .ncu_sii_niud_pei(ncu_sii_niud_pei),
			   .ncu_sii_dmud_pei(ncu_sii_dmud_pei),
			   .ncu_sii_niua_pei(ncu_sii_niua_pei),
			   .ncu_sii_dmuctag_cei(ncu_sii_dmuctag_cei),
			   .ncu_sii_niuctag_cei(ncu_sii_niuctag_cei),
			   .ncu_sii_dmuctag_uei(ncu_sii_dmuctag_uei),
			   .ncu_sii_niuctag_uei(ncu_sii_niuctag_uei),
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
			   .ncuctag_cei	(ncuctag_cei),
			   .ncuctag_uei	(ncuctag_uei),
			   .ncusiid_pei	(ncusiid_pei),
			   .dmubuf_pei	(dmubuf_pei),
			   .iobuf_uei	(iobuf_uei),
			   .cpubuf_uei	(cpubuf_uei),
			   .cpubuf_pei	(cpubuf_pei),
			   .intbuf_uei	(intbuf_uei),
			   .mondotbl_pei(mondotbl_pei),
			   .ncu_scksel_sh(ncu_scksel[1:0]),
			   // Inputs
			   .tcu_dbr_gateoff(tcu_dbr_gateoff),
			   .aclk_wmr(aclk_wmr),
			   .wmr_protect(wmr_protect),
			   .scan_in(ncu_ctrl_ctl_scanin),
			   .scan_out(ncu_ctrl_ctl_scanout),
			   .iol2clk	(iol2clk),
			   .tcu_pce_ov	(tcu_pce_ov),
			   .tcu_clk_stop(tcu_clk_stop),
			   .tcu_scan_en	(tcu_scan_en),
			   .tcu_aclk	(tcu_aclk),
			   .tcu_bclk	(tcu_bclk),
			   .ncu_man_ucb_sel(ncu_man_ucb_sel),
			   .ncu_int_ucb_sel(ncu_int_ucb_sel),
			   .bounce_ucb_sel(bounce_ucb_sel),
			   .c2i_packet_vld(c2i_packet_vld),
			   .c2i_packet_is_rd_req(c2i_packet_is_rd_req),
			   .c2i_packet_is_wr_req(c2i_packet_is_wr_req),
			   .c2i_packet	(c2i_packet[127:0]),
			   .rd_nack_ucb_sel(rd_nack_ucb_sel),
			   .c2i_rd_nack_packet(c2i_rd_nack_packet[63:0]),
			   .tap_mondo_acc_seq_d2_f(tap_mondo_acc_seq_d2_f),
			   .tap_mondo_acc_addr_invld_d2_f(tap_mondo_acc_addr_invld_d2_f),
			   .tap_mondo_dout_d2_f(tap_mondo_dout_d2_f[63:0]),
			   .mmu_ld	(mmu_ld),
			   .ncu_man_int_rd(ncu_man_int_rd),
			   .ncu_man_ack_rd(ncu_man_ack_rd),
			   .ncu_int_ack_rd(ncu_int_ack_rd),
			   .bounce_ack_rd(bounce_ack_rd),
			   .rd_nack_rd	(rd_nack_rd),
			   .io_intman_addr(io_intman_addr[6:0]),
			   //.efu_ncu_fuse_clk1(efu_ncu_fuse_clk1),
			   .efu_ncu_fuse_data(efu_ncu_fuse_data),
			   .efu_ncu_coreavail_dshift(efu_ncu_coreavail_dshift),
			   .efu_ncu_bankavail_dshift(efu_ncu_bankavail_dshift),
			   .efu_ncu_fusestat_dshift(efu_ncu_fusestat_dshift),
			   .efu_ncu_sernum0_dshift(efu_ncu_sernum0_dshift),
			   .efu_ncu_sernum1_dshift(efu_ncu_sernum1_dshift),
			   .efu_ncu_sernum2_dshift(efu_ncu_sernum2_dshift),
			   .rst_ncu_unpark_thread(rst_ncu_unpark_thread),
			   .rst_ncu_xir_inv(rst_ncu_xir_),
			   .core_running_status(core_running_status[63:0]),
			   .intman_tbl_dout(intman_tbl_dout[15:0]),
			   .mb1_raddr	(mb1_addr[6:0]),
			   .mb1_waddr	(mb1_addr[6:0]),
			   .mb1_wdata	(mb1_wdata[7:0]),
			   .mb1_intman_wr_en(mb1_intman_wr_en),
			   .mb1_intman_rd_en(mb1_intman_rd_en),
			   .mb1_run(mb1_run),
			   .niu_ncu_d_pe(niu_ncu_d_pe),
			   .niu_ncu_ctag_ue(niu_ncu_ctag_ue),
			   .niu_ncu_ctag_ce(niu_ncu_ctag_ce),
			   .sio_ncu_ctag_ce(sio_ncu_ctag_ce),
			   .sio_ncu_ctag_ue(sio_ncu_ctag_ue),
			   //.sio_ncu_d_pe(sio_ncu_d_pe),
			   .dmu_cr_id_rtn_err(dmu_cr_id_rtn_err),
			   .dmu_ncu_d_pe(dmu_ncu_d_pe),
			   .dmu_ncu_siicr_pe(dmu_ncu_siicr_pe),
			   .dmu_ncu_ctag_ue(dmu_ncu_ctag_ue),
			   .dmu_ncu_ctag_ce(dmu_ncu_ctag_ce),
			   .dmu_ncu_ncucr_pe(dmu_ncu_ncucr_pe),
			   .dmu_ncu_ie	(dmu_ncu_ie),
			   .sii_ncu_dmua_pe(sii_ncu_dmua_pe),
			   .sii_ncu_niud_pe(sii_ncu_niud_pe),
			   .sii_ncu_dmud_pe(sii_ncu_dmud_pe),
			   .sii_ncu_niua_pe(sii_ncu_niua_pe),
			   .sii_ncu_dmuctag_ce(sii_ncu_dmuctag_ce),
			   .sii_ncu_niuctag_ce(sii_ncu_niuctag_ce),
			   .sii_ncu_dmuctag_ue(sii_ncu_dmuctag_ue),
			   .sii_ncu_niuctag_ue(sii_ncu_niuctag_ue),
			   .mcu0_ncu_ecc	(mcu0_ncu_ecc),
			   .mcu0_ncu_fbr	(mcu0_ncu_fbr),
			   .mcu0_ncu_fbu	(mcu0_ncu_fbu),
			   .mcu1_ncu_ecc	(mcu1_ncu_ecc),
			   .mcu1_ncu_fbr	(mcu1_ncu_fbr),
			   .mcu1_ncu_fbu	(mcu1_ncu_fbu),
			   .mcu2_ncu_ecc	(mcu2_ncu_ecc),
			   .mcu2_ncu_fbr	(mcu2_ncu_fbr),
			   .mcu2_ncu_fbu	(mcu2_ncu_fbu),
			   .mcu3_ncu_ecc	(mcu3_ncu_ecc),
			   .mcu3_ncu_fbr	(mcu3_ncu_fbr),
			   .mcu3_ncu_fbu	(mcu3_ncu_fbu),
			   .siierrsyn	(siierrsyn[63:0]),
			   .siierrsyn_done(siierrsyn_done),
			   .ncuctag_ce	(ncuctag_ce),
			   .ncuctag_ue	(ncuctag_ue),
			   .ncusiid_pe	(ncusiid_pe),
			   .ncudpsyn	(ncudpsyn[15:0]),
			   .dmubuf_pue	(dmubuf_pue),
			   .iobuf_ue_f	(iobuf_ue_f),
			   .cpubuf_ue	(cpubuf_ue),
			   .cpubuf_pe	(cpubuf_pe),
			   .intbuf_ue_f	(intbuf_ue_f),
			   .mondotbl_pe_f(mondotbl_pe_f),
			   .io_rd_intman_d2(io_rd_intman_d2),
			   .dmubufsyn	(dmubufsyn[46:0]),
			   .cpubufsyn	(cpubufsyn[50:0]),
			   // outputs
			   .tcu_wmr_vec_mask(tcu_wmr_vec_mask),
			   .cmp_tick_enable(cmp_tick_enable),
			   .ncu_dbg1_error_event (ncu_dbg1_error_event));


///*ncu_mb1_ctl auto_template ( 
//			 .l2clk	(iol2clk),
// 			 .scan_out(mb1_scanout), 
//			 .scan_in(mb1_scanin),
//			 .mbist_start	(mb1_start),
//			 .mbist_done	(mb1_done),
//			 .mbist_icache_fail(mb1_fail),
//			 .mbist_userdata_mode(1'b0),
//			 .mbist_bisi_mode(1'b0),
//			 .mbist_loop_mode(1'b0),
//			 .mbist_loop_on_address(1'b0),
//			 .mbist_stop_on_fail(1'b0),
//			 .mbist_stop_on_next_fail(1'b0),
//			 .mbist_dcache_fail_in(1'b0),
//			 .mbist_icache_fail_in(1'b0),
//			 .mbist_icache_way({mb1_intman_sel,mb1_dmubuf_sel}),
//			 .mbist_dcache_index(mb1_raddr[6:0]),
//			 .mbist_icache_index(mb1_waddr[7:0]),
//		         .mbist_write_data(mb1_wdata[7:0])); */
//ncu_mb1_ctl ncu_mb1_ctl ( /*AUTOINST*/
			 // Outputs
			 //.mbist_dcache_read(mbist_dcache_read),
			 //.mbist_dcache_write(mbist_dcache_write),
			 //.mbist_dcache_index(mb1_raddr[6:0]),	 // Templated
			 //.mbist_dcache_way(mbist_dcache_way[1:0]),
			 //.mbist_icache_read(mbist_icache_read),
			 //.mbist_icache_write(mbist_icache_write),
			 //.mbist_icache_index(mb1_waddr[7:0]),	 // Templated
			 //.mbist_icache_word(mbist_icache_word),
			 //.mbist_icache_way({mb1_intman_sel,mb1_dmubuf_sel}), // Templated
			 //.mbist_write_data(mb1_wdata[7:0]),	 // Templated
			 //.mbist_dcache_fail(mbist_dcache_fail),
			 //.mbist_done	(mb1_done),
			 //.mbist_icache_fail(mb1_fail),
			 //.scan_out(mb1_scanout),
			 // Inputs
			 //.scan_in(mb1_scanin),
			 //.mbist_start	(mb1_start),		 // Templated
			 //.l2clk		(iol2clk),		 // Templated
			 //.tcu_pce_ov	(tcu_pce_ov),
			 //.tcu_clk_stop	(tcu_clk_stop),
			 //.tcu_aclk	(tcu_aclk),
			 //.tcu_bclk	(tcu_bclk),
			 //.tcu_scan_en	(tcu_scan_en),
			 //.mbist_userdata_mode(1'b0),		 // Templated
			 //.mbist_bisi_mode(1'b0),		 // Templated
			 //.mbist_loop_mode(1'b0),		 // Templated
			 //.mbist_loop_on_address(1'b0),		 // Templated
			 //.mbist_stop_on_fail(1'b0),		 // Templated
			 //.mbist_stop_on_next_fail(1'b0),	 // Templated
			 //.mbist_dcache_fail_in(1'b0),		 // Templated
			 //.mbist_icache_fail_in(1'b0),		 // Templated
			 //.dmubuf0_dout	(dmubuf0_dout[143:0]),
			 //.dmubuf1_dout	(dmubuf1_dout[143:0]),
			 //.intman_tbl_dout(intman_tbl_dout[11:0]));


ncu_mb1_ctl ncu_mb1_ctl ( 
			 // Outputs
		 	.mb1_run(mb1_run),
   	  	     	.mb1_addr(mb1_addr[6:0]),
         		.mb1_wdata(mb1_wdata[7:0]),
    	         	.mb1_intman_wr_en(mb1_intman_wr_en),
    	         	.mb1_intman_rd_en(mb1_intman_rd_en),
			.mb1_dmubuf0_wr_en(mb1_dmubuf0_wr_en),
    	         	.mb1_dmubuf0_rd_en(mb1_dmubuf0_rd_en),
    	         	.mb1_dmubuf1_wr_en(mb1_dmubuf1_wr_en),
    	         	.mb1_dmubuf1_rd_en(mb1_dmubuf1_rd_en),
    	         	.mb1_cpubuf_wr_en(mb1_cpubuf_wr_en),
    	         	.mb1_cpubuf_rd_en(mb1_cpubuf_rd_en),
               		.mb1_done(mb1_done),
               		.mb1_fail(mb1_fail),
               		.scan_out(mb1_scanout),
			// inputs
                	.l2clk(iol2clk),
                	.scan_in(mb1_scanin),
                	.tcu_pce_ov(tcu_pce_ov),             // scan signals
                	.tcu_clk_stop(tcu_clk_stop),
                	.tcu_aclk(tcu_aclk),
                	.tcu_bclk(tcu_bclk),
   	         	.tcu_scan_en(tcu_scan_en),
               		.mb1_start(mb1_start),
                	//.mb1_userdata_mode(1'b0),
                	.mb1_bisi_mode(tcu_mbist_bisi_en),
                	//.mb1_loop_mode(1'b0),
                	//.mb1_loop_on_address(1'b0),
                	//.mb1_stop_on_fail(1'b0),
                	//.mb1_stop_on_next_fail(1'b0),
			.mb1_user_mode(tcu_mbist_user_mode),
    			.intman_dout(intman_tbl_dout[15:0]),
    			.cpubuf_dout(cpubuf_dout[143:0]),
     			.dmubuf0_dout(dmubuf0_dout[143:0]),
     			.dmubuf1_dout(dmubuf1_dout[143:0]));
//assign intman_dout[15:0] = 16'b0;


/**********************************************************
 * cpu-to-io slow datapath
 *****************************************************************/
///* ncu_c2isd_ctl auto_template ( .scan_in (ncu_c2isd_ctl_scanin),
// 			  	.scan_out(ncu_c2isd_ctl_scanout) ); */
ncu_c2isd_ctl ncu_c2isd_ctl ( /*AUTOINST*/
			     // Outputs
			     .pcx_packet(pcx_packet[128:0]),
			     .pcx_packet_ue(pcx_packet_ue),
			     .pcx_packet_pe(pcx_packet_pe),
			     .c2i_packet_addr(c2i_packet_addr[39:0]),
			     .c2i_packet(c2i_packet[127:0]),
			     .c2i_rd_nack_packet(c2i_rd_nack_packet[63:0]),
			     .wr_ack_iopkt(wr_ack_iopkt[152:0]),
			     .cpubuf_mb0_data(cpubuf_mb0_data[7:0]),
			     .cpubufsyn	(cpubufsyn[50:0]),
			     // Inputs
			     .scan_in(ncu_c2isd_ctl_scanin),
			     .scan_out(ncu_c2isd_ctl_scanout),
			     .iol2clk	(iol2clk),
			     .tcu_scan_en(tcu_scan_en),
			     .tcu_pce_ov(tcu_pce_ov),
			     .tcu_clk_stop(tcu_clk_stop),
			     .tcu_aclk	(tcu_aclk),
			     .tcu_bclk	(tcu_bclk),
			     .tap_iob_packet(tap_iob_packet[127:0]),
			     .cpubuf_dout(cpubuf_dout[143:0]),
			     .cpubuf_rd	(cpubuf_rd),
			     .pas	(pas),
			     .pa_ld	(pa_ld),
			     .cpubuf_uei(cpubuf_uei),
			     .cpubuf_pei(cpubuf_pei),
			     .tap_sel	(tap_sel),
			     .cpu_packet_type(cpu_packet_type[3:0]),
			     .cpu_packet_size(cpu_packet_size[2:0]),
			     .mb0_cpubuf_bus_sel(5'b0000));


/************************
 ** dmupio
 ***********************/
///* ncu_c2ibufpio_ctl auto_template (
//	 .scan_in	(dmupio_ucb_buf_scanin),
//	 .scan_out	(dmupio_ucb_buf_scanout),
//	 .ucb_sel	(dmupio_ucb_sel),
//	 .ucb_buf_acpt	(dmupio_ucb_buf_acpt) ); */
ncu_c2ibufpio_ctl dmupio_ucb_buf (/*AUTOINST*/
				  // Outputs
				  .ucb_buf_acpt(dmupio_ucb_buf_acpt), // Templated
				  .mmu_ld(mmu_ld),
				  .dmubuf_din(dmubuf_din[143:0]),
				  .dmubuf0_wr(dmubuf0_wr),
				  .dmubuf1_wr(dmubuf1_wr),
				  .dmubuf_waddr(dmubuf_waddr[4:0]),
				  .dmubuf_raddr(dmubuf_raddr[4:0]),
				  .dmubuf_rden(dmubuf_rden),
				  .dmupio_wack_iopkt(dmupio_wack_iopkt[152:0]),
				  .dmupio_srvc_wack(dmupio_srvc_wack),
				  .c2i_wait(c2i_wait),
				  .ncu_dmu_pio_data(ncu_dmu_pio_data[63:0]),
				  .ncu_dmu_pio_hdr_vld(ncu_dmu_pio_hdr_vld),
				  .ncu_dmu_mmu_addr_vld(ncu_dmu_mmu_addr_vld),
				  .ncu_dmu_dpar(ncu_dmu_dpar[1:0]),
				  .dmubufsyn(dmubufsyn[46:0]),
				  .dmubuf_pue(dmubuf_pue),
				  .dmu_cr_id_rtn_err(dmu_cr_id_rtn_err),
				  // Inputs
				  .tcu_dbr_gateoff(tcu_dbr_gateoff),
				  .mb1_run(mb1_run),
				  .mb1_dmubuf0_wr_en(mb1_dmubuf0_wr_en),
				  .mb1_dmubuf1_wr_en(mb1_dmubuf1_wr_en),
				  .mb1_dmubuf0_rd_en(mb1_dmubuf0_rd_en),
				  .mb1_dmubuf1_rd_en(mb1_dmubuf1_rd_en),
				  .mb1_addr(mb1_addr[4:0]),
				  .mb1_wdata(mb1_wdata[7:0]),
				  .scan_in(dmupio_ucb_buf_scanin),
				  .scan_out(dmupio_ucb_buf_scanout),
				  .iol2clk(iol2clk),
				  .tcu_scan_en(tcu_scan_en),
				  .tcu_pce_ov(tcu_pce_ov),
				  .tcu_clk_stop(tcu_clk_stop),
				  .tcu_aclk(tcu_aclk),
				  .tcu_bclk(tcu_bclk),
				  .dmupio_addr35to24(dmupio_addr35to24[11:0]),
				  .c2i_packet(c2i_packet[127:0]),
				  .c2i_packet_vld(c2i_packet_vld),
				  .ucb_sel(dmupio_ucb_sel),	 // Templated
				  .com_map(com_map[1:0]),
				  .mmufsh_data(mmufsh_data[63:0]),
				  .mmufsh_vld(mmufsh_vld),
				  .dmu_ncu_wrack_vld(dmu_ncu_wrack_vld),
				  .dmu_ncu_wrack_tag(dmu_ncu_wrack_tag[3:0]),
				  .dmu_ncu_wrack_par(dmu_ncu_wrack_par),
				  .dmu_cr_id_rtn_erri(dmu_cr_id_rtn_erri),
				  .sii_cr_id_rtn_vld(sii_cr_id_rtn_vld),
				  .sii_cr_id_rtn(sii_cr_id_rtn[3:0]),
				  .dmubuf0_dout(dmubuf0_dout[143:0]),
				  .dmubuf1_dout(dmubuf1_dout[143:0]),
				  .iobuf_avail(iobuf_avail),
				  .dmubuf_pei(dmubuf_pei));



/************************
 ** dmucsr
 ***********************/
///* ncu_c2ibuf32_ctl auto_template ( 
//	.scan_in 	(dmucsr_ucb_buf_scanin),
//	.scan_out	(dmucsr_ucb_buf_scanout),
//   	.iob_ucb_vld	(ncu_dmu_vld),
//   	.iob_ucb_data	(ncu_dmu_data[31:0]),
//   	.ucb_iob_stall	(dmu_ncu_stall),
//   	.ucb_buf_acpt	(dmucsr_ucb_buf_acpt),
//   	.ucb_sel	(dmucsr_ucb_sel) ); */
ncu_c2ibuf32_ctl dmucsr_ucb_buf (/*AUTOINST*/
				 // Outputs
				 .ucb_buf_acpt(dmucsr_ucb_buf_acpt), // Templated
				 .iob_ucb_vld(ncu_dmu_vld),	 // Templated
				 .iob_ucb_data(ncu_dmu_data[31:0]), // Templated
				 // Inputs
				 .tcu_dbr_gateoff(tcu_dbr_gateoff),
				 .scan_in(dmucsr_ucb_buf_scanin),
				 .scan_out(dmucsr_ucb_buf_scanout),
				 .iol2clk(iol2clk),
				 .tcu_scan_en(tcu_scan_en),
				 .tcu_pce_ov(tcu_pce_ov),
				 .tcu_clk_stop(tcu_clk_stop),
				 .tcu_aclk(tcu_aclk),
				 .tcu_bclk(tcu_bclk),
				 .c2i_packet_vld(c2i_packet_vld),
				 .ucb_sel(dmucsr_ucb_sel),	 // Templated
				 .c2i_packet(c2i_packet[127:0]),
				 .ucb_iob_stall(dmu_ncu_stall));	 // Templated



/************************
 ** ssi ucb
 ***********************/
///* ncu_c2ibuf4_ctl auto_template ( 
//	.scan_in 	(ssi_ucb_buf_scanin),
//	.scan_out	(ssi_ucb_buf_scanout),
//   	.iob_ucb_vld	(ncu_ssi_vld),
//   	.iob_ucb_data	(ncu_ssi_data[3:0]),
//   	.ucb_iob_stall	(ssi_ncu_stall),
//   	.ucb_buf_acpt	(ssi_ucb_buf_acpt),
//   	.ucb_sel	(ssi_ucb_sel) ); */
ncu_c2ibuf4_ctl  ssi_ucb_buf (/*AUTOINST*/
			      // Outputs
			      .ucb_buf_acpt(ssi_ucb_buf_acpt),	 // Templated
			      .iob_ucb_vld(ncu_ssi_vld),	 // Templated
			      .iob_ucb_data(ncu_ssi_data[3:0]),	 // Templated
			      // Inputs
			      .scan_in(ssi_ucb_buf_scanin),
			      .scan_out(ssi_ucb_buf_scanout),
			      .iol2clk	(iol2clk),
			      .tcu_scan_en(tcu_scan_en),
			      .tcu_pce_ov(tcu_pce_ov),
			      .tcu_clk_stop(tcu_clk_stop),
			      .tcu_aclk	(tcu_aclk),
			      .tcu_bclk	(tcu_bclk),
			      .c2i_packet_vld(c2i_packet_vld),
			      .ucb_sel	(ssi_ucb_sel),		 // Templated
			      .c2i_packet(c2i_packet[127:0]),
			      .ucb_iob_stall(ssi_ncu_stall));	 // Templated



/************************
 ** mcu0 ucb
 ***********************/
///* ncu_c2ibuf4_ctl auto_template ( 
//	.scan_in 	(mcu0_ucb_buf_scanin),
//	.scan_out	(mcu0_ucb_buf_scanout),
//   	.iob_ucb_vld	(ncu_mcu0_vld),
//   	.iob_ucb_data	(ncu_mcu0_data[3:0]),
//   	.ucb_iob_stall	(mcu0_ncu_stall),
//   	.ucb_buf_acpt	(mcu0_ucb_buf_acpt),
//   	.ucb_sel	(mcu0_ucb_sel) ); */
ncu_c2ibuf4_ctl mcu0_ucb_buf (/*AUTOINST*/
			      // Outputs
			      .ucb_buf_acpt(mcu0_ucb_buf_acpt),	 // Templated
			      .iob_ucb_vld(ncu_mcu0_vld),	 // Templated
			      .iob_ucb_data(ncu_mcu0_data[3:0]), // Templated
			      // Inputs
			      .scan_in(mcu0_ucb_buf_scanin),
			      .scan_out(mcu0_ucb_buf_scanout),
			      .iol2clk	(iol2clk),
			      .tcu_scan_en(tcu_scan_en),
			      .tcu_pce_ov(tcu_pce_ov),
			      .tcu_clk_stop(tcu_clk_stop),
			      .tcu_aclk	(tcu_aclk),
			      .tcu_bclk	(tcu_bclk),
			      .c2i_packet_vld(c2i_packet_vld),
			      .ucb_sel	(mcu0_ucb_sel),		 // Templated
			      .c2i_packet(c2i_packet[127:0]),
			      .ucb_iob_stall(mcu0_ncu_stall));	 // Templated



/************************
 ** mcu1 ucb
 ***********************/
///* ncu_c2ibuf4_ctl auto_template ( 
//	.scan_in 	(mcu1_ucb_buf_scanin),
//	.scan_out	(mcu1_ucb_buf_scanout),
//   	.iob_ucb_vld	(ncu_mcu1_vld),
//   	.iob_ucb_data	(ncu_mcu1_data[3:0]),
//   	.ucb_iob_stall	(mcu1_ncu_stall),
//   	.ucb_buf_acpt	(mcu1_ucb_buf_acpt),
//   	.ucb_sel	(mcu1_ucb_sel) ); */
ncu_c2ibuf4_ctl mcu1_ucb_buf (/*AUTOINST*/
			      // Outputs
			      .ucb_buf_acpt(mcu1_ucb_buf_acpt),	 // Templated
			      .iob_ucb_vld(ncu_mcu1_vld),	 // Templated
			      .iob_ucb_data(ncu_mcu1_data[3:0]), // Templated
			      // Inputs
			      .scan_in(mcu1_ucb_buf_scanin),
			      .scan_out(mcu1_ucb_buf_scanout),
			      .iol2clk	(iol2clk),
			      .tcu_scan_en(tcu_scan_en),
			      .tcu_pce_ov(tcu_pce_ov),
			      .tcu_clk_stop(tcu_clk_stop),
			      .tcu_aclk	(tcu_aclk),
			      .tcu_bclk	(tcu_bclk),
			      .c2i_packet_vld(c2i_packet_vld),
			      .ucb_sel	(mcu1_ucb_sel),		 // Templated
			      .c2i_packet(c2i_packet[127:0]),
			      .ucb_iob_stall(mcu1_ncu_stall));	 // Templated



/************************
 ** mcu2 ucb
 ***********************/
///* ncu_c2ibuf4_ctl auto_template ( 
//	.scan_in 	(mcu2_ucb_buf_scanin),
//	.scan_out	(mcu2_ucb_buf_scanout),
//   	.iob_ucb_vld	(ncu_mcu2_vld),
//   	.iob_ucb_data	(ncu_mcu2_data[3:0]),
//   	.ucb_iob_stall	(mcu2_ncu_stall),
//   	.ucb_buf_acpt	(mcu2_ucb_buf_acpt),
//   	.ucb_sel	(mcu2_ucb_sel) ); */
ncu_c2ibuf4_ctl mcu2_ucb_buf (/*AUTOINST*/
			      // Outputs
			      .ucb_buf_acpt(mcu2_ucb_buf_acpt),	 // Templated
			      .iob_ucb_vld(ncu_mcu2_vld),	 // Templated
			      .iob_ucb_data(ncu_mcu2_data[3:0]), // Templated
			      // Inputs
			      .scan_in(mcu2_ucb_buf_scanin),
			      .scan_out(mcu2_ucb_buf_scanout),
			      .iol2clk	(iol2clk),
			      .tcu_scan_en(tcu_scan_en),
			      .tcu_pce_ov(tcu_pce_ov),
			      .tcu_clk_stop(tcu_clk_stop),
			      .tcu_aclk	(tcu_aclk),
			      .tcu_bclk	(tcu_bclk),
			      .c2i_packet_vld(c2i_packet_vld),
			      .ucb_sel	(mcu2_ucb_sel),		 // Templated
			      .c2i_packet(c2i_packet[127:0]),
			      .ucb_iob_stall(mcu2_ncu_stall));	 // Templated



/************************
 ** mcu3 ucb
 ***********************/
///* ncu_c2ibuf4_ctl auto_template ( 
//	.scan_in 	(mcu3_ucb_buf_scanin),
//	.scan_out	(mcu3_ucb_buf_scanout),
//   	.iob_ucb_vld	(ncu_mcu3_vld),
//   	.iob_ucb_data	(ncu_mcu3_data[3:0]),
//   	.ucb_iob_stall	(mcu3_ncu_stall),
//   	.ucb_buf_acpt	(mcu3_ucb_buf_acpt),
//   	.ucb_sel	(mcu3_ucb_sel) ); */
ncu_c2ibuf4_ctl mcu3_ucb_buf (/*AUTOINST*/
			      // Outputs
			      .ucb_buf_acpt(mcu3_ucb_buf_acpt),	 // Templated
			      .iob_ucb_vld(ncu_mcu3_vld),	 // Templated
			      .iob_ucb_data(ncu_mcu3_data[3:0]), // Templated
			      // Inputs
			      .scan_in(mcu3_ucb_buf_scanin),
			      .scan_out(mcu3_ucb_buf_scanout),
			      .iol2clk	(iol2clk),
			      .tcu_scan_en(tcu_scan_en),
			      .tcu_pce_ov(tcu_pce_ov),
			      .tcu_clk_stop(tcu_clk_stop),
			      .tcu_aclk	(tcu_aclk),
			      .tcu_bclk	(tcu_bclk),
			      .c2i_packet_vld(c2i_packet_vld),
			      .ucb_sel	(mcu3_ucb_sel),		 // Templated
			      .c2i_packet(c2i_packet[127:0]),
			      .ucb_iob_stall(mcu3_ncu_stall));	 // Templated



/************************
 ** ccu ucb
 ***********************/
///* ncu_c2ibuf4_ctl auto_template ( 
//	.scan_in 	(ccu_ucb_buf_scanin),
//	.scan_out	(ccu_ucb_buf_scanout),
//   	.iob_ucb_vld	(ncu_ccu_vld),
//   	.iob_ucb_data	(ncu_ccu_data[3:0]),
//   	.ucb_iob_stall	(ccu_ncu_stall),
//   	.ucb_buf_acpt	(ccu_ucb_buf_acpt),
//   	.ucb_sel	(ccu_ucb_sel) ); */
ncu_c2ibuf4_ctl ccu_ucb_buf (/*AUTOINST*/
			     // Outputs
			     .ucb_buf_acpt(ccu_ucb_buf_acpt),	 // Templated
			     .iob_ucb_vld(ncu_ccu_vld),		 // Templated
			     .iob_ucb_data(ncu_ccu_data[3:0]),	 // Templated
			     // Inputs
			     .scan_in(ccu_ucb_buf_scanin),
			     .scan_out(ccu_ucb_buf_scanout),
			     .iol2clk	(iol2clk),
			     .tcu_scan_en(tcu_scan_en),
			     .tcu_pce_ov(tcu_pce_ov),
			     .tcu_clk_stop(tcu_clk_stop),
			     .tcu_aclk	(tcu_aclk),
			     .tcu_bclk	(tcu_bclk),
			     .c2i_packet_vld(c2i_packet_vld),
			     .ucb_sel	(ccu_ucb_sel),		 // Templated
			     .c2i_packet(c2i_packet[127:0]),
			     .ucb_iob_stall(ccu_ncu_stall));	 // Templated



/************************
 ** rcu ucb
 ***********************/
///* ncu_c2ibuf4_ctl auto_template ( 
//	.scan_in 	(rcu_ucb_buf_scanin),
//	.scan_out	(rcu_ucb_buf_scanout),
//   	.iob_ucb_vld	(ncu_rcu_vld),
//   	.iob_ucb_data	(ncu_rcu_data[3:0]),
//   	.ucb_iob_stall	(rcu_ncu_stall),
//   	.ucb_buf_acpt	(rcu_ucb_buf_acpt),
//   	.ucb_sel	(rcu_ucb_sel) ); */
ncu_c2ibuf4_ctl rcu_ucb_buf (/*AUTOINST*/
			     // Outputs
			     .ucb_buf_acpt(rcu_ucb_buf_acpt),	 // Templated
			     .iob_ucb_vld(ncu_rcu_vld),		 // Templated
			     .iob_ucb_data(ncu_rcu_data[3:0]),	 // Templated
			     // Inputs
			     .scan_in(rcu_ucb_buf_scanin),
			     .scan_out(rcu_ucb_buf_scanout),
			     .iol2clk	(iol2clk),
			     .tcu_scan_en(tcu_scan_en),
			     .tcu_pce_ov(tcu_pce_ov),
			     .tcu_clk_stop(tcu_clk_stop),
			     .tcu_aclk	(tcu_aclk),
			     .tcu_bclk	(tcu_bclk),
			     .c2i_packet_vld(c2i_packet_vld),
			     .ucb_sel	(rcu_ucb_sel),		 // Templated
			     .c2i_packet(c2i_packet[127:0]),
			     .ucb_iob_stall(rcu_ncu_stall));	 // Templated



/************************
 ** rng ucb
 ***********************/
///* ncu_c2ibuf4_ctl auto_template ( 
//	.scan_in 	(rng_ucb_buf_scanin),
//	.scan_out	(rng_ucb_buf_scanout),
//   	.iob_ucb_vld	(ncu_rng_vld),
//   	.iob_ucb_data	(ncu_rng_data[3:0]),
//   	.ucb_iob_stall	(rng_ncu_stall),
//   	.ucb_buf_acpt	(rng_ucb_buf_acpt),
//   	.ucb_sel	(rng_ucb_sel) ); */
ncu_c2ibuf4_ctl dbg1_ucb_buf (/*AUTOINST*/
			     // Outputs
			     .ucb_buf_acpt(dbg1_ucb_buf_acpt),	 // Templated
			     .iob_ucb_vld(ncu_dbg1_vld),		 // Templated
			     .iob_ucb_data(ncu_dbg1_data[3:0]),	 // Templated
			     // Inputs
			     .scan_in(dbg1_ucb_buf_scanin),
			     .scan_out(dbg1_ucb_buf_scanout),
			     .iol2clk	(iol2clk),
			     .tcu_scan_en(tcu_scan_en),
			     .tcu_pce_ov(tcu_pce_ov),
			     .tcu_clk_stop(tcu_clk_stop),
			     .tcu_aclk	(tcu_aclk),
			     .tcu_bclk	(tcu_bclk),
			     .c2i_packet_vld(c2i_packet_vld),
			     .ucb_sel	(dbg1_ucb_sel),		 // Templated
			     .c2i_packet(c2i_packet[127:0]),
			     .ucb_iob_stall(dbg1_ncu_stall));	 // Templated



/************************
 ** niu ucb
 ***********************/
///* ncu_c2ibuf32_ctl auto_template ( 
//	.scan_in 	(niu_ucb_buf_scanin),
//	.scan_out	(niu_ucb_buf_scanout),
//   	.iob_ucb_vld	(ncu_niu_vld),
//   	.iob_ucb_data	(ncu_niu_data[31:0]),
//   	.ucb_iob_stall	(niu_ncu_stall),
//   	.ucb_buf_acpt	(niu_ucb_buf_acpt),
//   	.ucb_sel	(niu_ucb_sel) ); */
ncu_c2ibuf32_ctl niu_ucb_buf (/*AUTOINST*/
			      // Outputs
			      .ucb_buf_acpt(niu_ucb_buf_acpt),	 // Templated
			      .iob_ucb_vld(ncu_niu_vld),	 // Templated
			      .iob_ucb_data(ncu_niu_data[31:0]), // Templated
			      // Inputs
			      .tcu_dbr_gateoff(tcu_dbr_gateoff),
			      .scan_in(niu_ucb_buf_scanin),
			      .scan_out(niu_ucb_buf_scanout),
			      .iol2clk	(iol2clk),
			      .tcu_scan_en(tcu_scan_en),
			      .tcu_pce_ov(tcu_pce_ov),
			      .tcu_clk_stop(tcu_clk_stop),
			      .tcu_aclk	(tcu_aclk),
			      .tcu_bclk	(tcu_bclk),
			      .c2i_packet_vld(c2i_packet_vld),
			      .ucb_sel	(niu_ucb_sel),		 // Templated
			      .c2i_packet(c2i_packet[127:0]),
			      .ucb_iob_stall(niu_ncu_stall));	 // Templated



///* ncu_ucbbusin8_ctl auto_template (
//	.scan_in 	(tcu_ucb_buf_scanin),
//	.scan_out	(tcu_ucb_buf_scanout),
//   	.vld		(tcu_ncu_vld),
//   	.data		(tcu_ncu_data[7:0]),
//   	.stall		(ncu_tcu_stall),
//   	.indata_buf	(tap_iob_packet[127:0]),
//   	.indata_buf_vld	(tap_iob_packet_vld),
//   	.stall_a1	(iob_tap_busy)); */
ncu_ucbbusin8_ctl tcu_ucb_buf (/*AUTOINST*/
			       // Outputs
			       .stall	(ncu_tcu_stall),	 // Templated
			       .indata_buf_vld(tap_iob_packet_vld), // Templated
			       .indata_buf(tap_iob_packet[127:0]), // Templated
			       // Inputs
			       .scan_in(tcu_ucb_buf_scanin),
			       .scan_out(tcu_ucb_buf_scanout),
			       .iol2clk	(iol2clk),
			       .tcu_pce_ov(tcu_pce_ov),
			       .tcu_clk_stop(tcu_clk_stop),
			       .tcu_scan_en(tcu_scan_en),
			       .tcu_aclk(tcu_aclk),
			       .tcu_bclk(tcu_bclk),
			       .vld	(tcu_ncu_vld),		 // Templated
			       .data	(tcu_ncu_data[7:0]),	 // Templated
			       .stall_a1(iob_tap_busy));		 // Templated









// fixscan start:
assign ncu_c2isc_ctl_scanin      = scan_in                  ;
assign ncu_ctrl_ctl_scanin       = ncu_c2isc_ctl_scanout    ;
assign ncu_c2isd_ctl_scanin      = ncu_ctrl_ctl_scanout     ;
assign dmupio_ucb_buf_scanin     = ncu_c2isd_ctl_scanout    ;
assign dmucsr_ucb_buf_scanin     = dmupio_ucb_buf_scanout   ;
assign ssi_ucb_buf_scanin        = dmucsr_ucb_buf_scanout   ;
assign mcu0_ucb_buf_scanin       = ssi_ucb_buf_scanout      ;
assign mcu1_ucb_buf_scanin       = mcu0_ucb_buf_scanout     ;
assign mcu2_ucb_buf_scanin       = mcu1_ucb_buf_scanout     ;
assign mcu3_ucb_buf_scanin       = mcu2_ucb_buf_scanout     ;
assign ccu_ucb_buf_scanin        = mcu3_ucb_buf_scanout     ;
assign rcu_ucb_buf_scanin        = ccu_ucb_buf_scanout      ;
assign dbg1_ucb_buf_scanin        = rcu_ucb_buf_scanout      ;
assign niu_ucb_buf_scanin        = dbg1_ucb_buf_scanout      ;
assign tcu_ucb_buf_scanin        = niu_ucb_buf_scanout      ;
assign scan_out                  = tcu_ucb_buf_scanout      ;
// fixscan end:
endmodule

// Local Variables:
// verilog-library-directories:("." "../common")
// End:



// Local Variables:
// verilog-auto-sense-defines-constant:t
// End:






// any PARAMS parms go into naming of macro

module ncu_c2iscd_ctl_msff_ctl_macro__width_6 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__width_1 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_1 (
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

module ncu_c2iscd_ctl_l1clkhdr_ctl_macro (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_64 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_40 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_2 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_6 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_25 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_128 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_55 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_22 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_20 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_8 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_12 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_24 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__width_64 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__width_8 (
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

module ncu_c2iscd_ctl_msffi_ctl_macro__width_1 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__width_56 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_3 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__width_63 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__width_5 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_5 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__width_43 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_43 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_59 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_61 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__width_2 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__width_9 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__width_7 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__width_4 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__width_40 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__width_23 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__width_3 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_144 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_129 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_51 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_127 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_47 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__width_16 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__width_128 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__width_32 (
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

module ncu_c2iscd_ctl_msff_ctl_macro__en_1__width_16 (
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








