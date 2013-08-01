// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_i2cscd_ctl.v
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
module ncu_i2cscd_ctl (
  bounce_ack_packet, 
  bounce_ack_vld, 
  ccu_ncu_data, 
  ccu_ncu_vld, 
  dmu_ncu_data, 
  dmu_ncu_vld, 
  intman_tbl_dout, 
  intman_pchkf2i2c, 
  iobuf_head_f, 
  iol2clk, 
  lhs_intman_acc, 
  mcu0_ncu_data, 
  mcu0_ncu_vld, 
  mcu1_ncu_data, 
  mcu1_ncu_vld, 
  mcu2_ncu_data, 
  mcu2_ncu_vld, 
  mcu3_ncu_data, 
  mcu3_ncu_vld, 
  mondo_busy_vec_f, 
  mondoinvec, 
  ncu_int_ack_packet, 
  ncu_int_ack_vld, 
  ncu_man_ack_packet, 
  ncu_man_ack_vld, 
  ncu_man_int_packet, 
  ncu_man_int_vld, 
  niu_ncu_data, 
  niu_ncu_vld, 
  rcu_ncu_data, 
  rcu_ncu_vld, 
  rd_nack_packet, 
  rd_nack_vld, 
  dbg1_ncu_data, 
  dbg1_ncu_vld, 
  scan_in, 
  sii_ncu_dparity, 
  sii_ncu_data, 
  sii_ncu_req, 
  sii_ncu_syn_data, 
  sii_ncu_syn_vld, 
  srvc_wr_ack, 
  ssi_ncu_data, 
  ssi_ncu_vld, 
  tcu_clk_stop, 
  tcu_ncu_stall, 
  tcu_pce_ov, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_dbr_gateoff, 
  wr_ack_iopkt, 
  mb0_run, 
  mb0_iobuf_wr_en, 
  mb0_addr, 
  mb0_wdata, 
  dmupio_wack_iopkt, 
  dmupio_srvc_wack, 
  bounce_ack_rd, 
  iobuf_avail, 
  iobuf_din, 
  iobuf_tail_ptr, 
  iobuf_tail_s, 
  iobuf_wr, 
  io_intman_addr, 
  io_mondo_data0_din_s, 
  io_mondo_data1_din_s, 
  io_mondo_data_wr_addr_s, 
  io_mondo_data_wr_s, 
  ncu_ccu_stall, 
  ncu_dmu_mondo_ack, 
  ncu_dmu_mondo_id, 
  ncu_dmu_mondo_id_par, 
  ncu_dmu_mondo_nack, 
  ncu_dmu_stall, 
  ncu_int_ack_rd, 
  ncu_man_ack_rd, 
  ncu_man_int_rd, 
  ncu_mcu0_stall, 
  ncu_mcu1_stall, 
  ncu_mcu2_stall, 
  ncu_mcu3_stall, 
  ncu_niu_stall, 
  ncu_rcu_stall, 
  ncu_dbg1_stall, 
  ncu_sii_gnt, 
  ncu_ssi_stall, 
  ncu_tcu_data, 
  ncu_tcu_vld, 
  rd_nack_rd, 
  scan_out, 
  sii_cr_id_rtn, 
  sii_cr_id_rtn_vld, 
  raserrce, 
  raserrue, 
  io_rd_intman_d2, 
  siierrsyn, 
  siierrsyn_done, 
  ncudpsyn, 
  ncuctag_ue, 
  ncuctag_uei, 
  ncuctag_ce, 
  ncuctag_cei, 
  ncusiid_pe, 
  ncusiid_pei) ;
wire sii_mondo_rd;
wire ssi_int_rd;
wire mcu0_int_rd;
wire mcu1_int_rd;
wire mcu2_int_rd;
wire mcu3_int_rd;
wire niu_int_rd;
wire siipio_ack_rd;
wire dmucsr_ack_rd;
wire ccu_ack_rd;
wire mcu0_ack_rd;
wire mcu1_ack_rd;
wire mcu2_ack_rd;
wire mcu3_ack_rd;
wire ssi_ack_rd;
wire rcu_ack_rd;
wire dbg1_ack_rd;
wire niu_ack_rd;
wire iob_tap_packet_vld;
wire [6:0] int_sel;
wire [14:0] ack_sel;
wire mondo_srvcd_d1;
wire int_srvcd_d2;
wire ack_srvcd_d1;
wire ncu_i2csc_ctl_scanin;
wire ncu_i2csc_ctl_scanout;
wire sii_mondo_vld;
wire [5:0] sii_mondo_target;
wire sii_mondo_ctagerr;
wire ssi_int_vld;
wire mcu0_int_vld;
wire mcu1_int_vld;
wire mcu2_int_vld;
wire mcu3_int_vld;
wire niu_int_vld;
wire siipio_ack_vld;
wire dmucsr_ack_vld;
wire ccu_ack_vld;
wire mcu0_ack_vld;
wire mcu1_ack_vld;
wire mcu2_ack_vld;
wire mcu3_ack_vld;
wire ssi_ack_vld;
wire rcu_ack_vld;
wire dbg1_ack_vld;
wire niu_ack_vld;
wire tap_iob_busy;
wire [127:0] ucb_ack_packet_d1;
wire intman_dout_v;
wire [127:0] iob_tap_packet;
wire ncu_i2csd_ctl_scanin;
wire ncu_i2csd_ctl_scanout;
wire [63:0] sii_mondo_data0;
wire [63:0] sii_mondo_data1;
wire [24:0] ssi_int_packet;
wire [24:0] mcu0_int_packet;
wire [24:0] mcu1_int_packet;
wire [24:0] mcu2_int_packet;
wire [24:0] mcu3_int_packet;
wire [24:0] niu_int_packet;
wire [139:0] siipio_ack_packet;
wire [127:0] dmucsr_ack_packet;
wire [127:0] ccu_ack_packet;
wire [127:0] mcu0_ack_packet;
wire [127:0] mcu1_ack_packet;
wire [127:0] mcu2_ack_packet;
wire [127:0] mcu3_ack_packet;
wire [127:0] ssi_ack_packet;
wire [127:0] rcu_ack_packet;
wire [127:0] dbg1_ack_packet;
wire [127:0] niu_ack_packet;
wire tcu_ucb_buf_scanin;
wire tcu_ucb_buf_scanout;
wire sii_ucb_buf_scanin;
wire sii_ucb_buf_scanout;
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


input [127:0]		bounce_ack_packet;	// To ncu_i2csd_ctl of ncu_i2csd_ctl.v
input			bounce_ack_vld;		// To ncu_i2csc_ctl of ncu_i2csc_ctl.v
input [3:0]		ccu_ncu_data;		// To ccu_ucb_buf of ncu_i2cbuf4_ni_ctl.v
input			ccu_ncu_vld;		// To ccu_ucb_buf of ncu_i2cbuf4_ni_ctl.v
input [31:0]		dmu_ncu_data;		// To dmucsr_ucb_buf of ncu_i2cbuf32_ni_ctl.v
input			dmu_ncu_vld;		// To dmucsr_ucb_buf of ncu_i2cbuf32_ni_ctl.v
input [11:0]		intman_tbl_dout;	// To ncu_i2csd_ctl of ncu_i2csd_ctl.v
input			intman_pchkf2i2c;
input [5:0]		iobuf_head_f;		// To ncu_i2csc_ctl of ncu_i2csc_ctl.v
input			iol2clk;		// To ncu_i2csc_ctl of ncu_i2csc_ctl.v, ...
input			lhs_intman_acc;		// To ncu_i2csc_ctl of ncu_i2csc_ctl.v
input [3:0]		mcu0_ncu_data;		// To mcu0_ucb_buf of ncu_i2cbuf4_ctl.v
input			mcu0_ncu_vld;		// To mcu0_ucb_buf of ncu_i2cbuf4_ctl.v
input [3:0]		mcu1_ncu_data;		// To mcu1_ucb_buf of ncu_i2cbuf4_ctl.v
input			mcu1_ncu_vld;		// To mcu1_ucb_buf of ncu_i2cbuf4_ctl.v
input [3:0]		mcu2_ncu_data;		// To mcu2_ucb_buf of ncu_i2cbuf4_ctl.v
input			mcu2_ncu_vld;		// To mcu2_ucb_buf of ncu_i2cbuf4_ctl.v
input [3:0]		mcu3_ncu_data;		// To mcu3_ucb_buf of ncu_i2cbuf4_ctl.v
input			mcu3_ncu_vld;		// To mcu3_ucb_buf of ncu_i2cbuf4_ctl.v
input [63:0]		mondo_busy_vec_f;	// To ncu_i2csc_ctl of ncu_i2csc_ctl.v
input [5:0]		mondoinvec;		// To ncu_i2csd_ctl of ncu_i2csd_ctl.v
input [127:0]		ncu_int_ack_packet;	// To ncu_i2csd_ctl of ncu_i2csd_ctl.v
input			ncu_int_ack_vld;	// To ncu_i2csc_ctl of ncu_i2csc_ctl.v
input [127:0]		ncu_man_ack_packet;	// To ncu_i2csd_ctl of ncu_i2csd_ctl.v
input			ncu_man_ack_vld;	// To ncu_i2csc_ctl of ncu_i2csc_ctl.v
input [24:0]		ncu_man_int_packet;	// To ncu_i2csd_ctl of ncu_i2csd_ctl.v
input			ncu_man_int_vld;	// To ncu_i2csc_ctl of ncu_i2csc_ctl.v
input [31:0]		niu_ncu_data;		// To niu_ucb_buf of ncu_i2cbuf32_ctl.v
input			niu_ncu_vld;		// To niu_ucb_buf of ncu_i2cbuf32_ctl.v
input [3:0]		rcu_ncu_data;		// To rcu_ucb_buf of ncu_i2cbuf4_ni_ctl.v
input			rcu_ncu_vld;		// To rcu_ucb_buf of ncu_i2cbuf4_ni_ctl.v
input [63:0]		rd_nack_packet;		// To ncu_i2csd_ctl of ncu_i2csd_ctl.v
input			rd_nack_vld;		// To ncu_i2csc_ctl of ncu_i2csc_ctl.v
//input [3:0]             rng_ncu_data;           // To rng_ucb_buf of ncu_i2cbuf4_ni_ctl.v
//input                   rng_ncu_vld;            // To rng_ucb_buf of ncu_i2cbuf4_ni_ctl.v
input [3:0]		dbg1_ncu_data;		// To dbg1_ucb_buf of ncu_i2cbuf4_ni_ctl.v
input			dbg1_ncu_vld;		// To dbg1_ucb_buf of ncu_i2cbuf4_ni_ctl.v
input			scan_in;		// To ncu_i2csc_ctl of ncu_i2csc_ctl.v
input  [1:0]		sii_ncu_dparity;
input [31:0]		sii_ncu_data;		// To sii_ucb_buf of ncu_i2cbufsii_ctl.v
input			sii_ncu_req;		// To sii_ucb_buf of ncu_i2cbufsii_ctl.v
input [3:0]		sii_ncu_syn_data;
input			sii_ncu_syn_vld;
input			srvc_wr_ack;		// To ncu_i2csc_ctl of ncu_i2csc_ctl.v
input [3:0]		ssi_ncu_data;		// To ssi_ucb_buf of ncu_i2cbuf4_ctl.v
input			ssi_ncu_vld;		// To ssi_ucb_buf of ncu_i2cbuf4_ctl.v
input			tcu_clk_stop;		// To ncu_i2csc_ctl of ncu_i2csc_ctl.v, ...
input			tcu_ncu_stall;		// To tcu_ucb_buf of ncu_ucbbusout8_ctl.v
input			tcu_pce_ov;		// To ncu_i2csc_ctl of ncu_i2csc_ctl.v, ...
input			tcu_scan_en;		// To ncu_i2csc_ctl of ncu_i2csc_ctl.v, ...
input			tcu_aclk;		// To ncu_i2csc_ctl of ncu_i2csc_ctl.v, ...
input			tcu_bclk;		// To ncu_i2csc_ctl of ncu_i2csc_ctl.v, ...
input			tcu_dbr_gateoff;
input [152:0]		wr_ack_iopkt;	// To ncu_i2csd_ctl of ncu_i2csd_ctl.v
input			mb0_run;
input			mb0_iobuf_wr_en;
input [5:0]		mb0_addr;
input [7:0]		mb0_wdata;
input [152:0]		dmupio_wack_iopkt;
input 			dmupio_srvc_wack;

output			bounce_ack_rd;		// From ncu_i2csc_ctl of ncu_i2csc_ctl.v
output			iobuf_avail;		// From ncu_i2csc_ctl of ncu_i2csc_ctl.v
output [175:0]		iobuf_din;		// From ncu_i2csd_ctl of ncu_i2csd_ctl.v
output [4:0]		iobuf_tail_ptr;	// From ncu_i2csc_ctl of ncu_i2csc_ctl.v
output [5:0]		iobuf_tail_s;		// From ncu_i2csc_ctl of ncu_i2csc_ctl.v
output			iobuf_wr;		// From ncu_i2csc_ctl of ncu_i2csc_ctl.v
output [6:0]		io_intman_addr;		// From ncu_i2csd_ctl of ncu_i2csd_ctl.v
output [63:0]		io_mondo_data0_din_s;	// From ncu_i2csd_ctl of ncu_i2csd_ctl.v
output [63:0]		io_mondo_data1_din_s;	// From ncu_i2csd_ctl of ncu_i2csd_ctl.v
output [5:0]		io_mondo_data_wr_addr_s;// From ncu_i2csd_ctl of ncu_i2csd_ctl.v
output			io_mondo_data_wr_s;	// From ncu_i2csc_ctl of ncu_i2csc_ctl.v
output			ncu_ccu_stall;		// From ccu_ucb_buf of ncu_i2cbuf4_ni_ctl.v
output			ncu_dmu_mondo_ack;	// From ncu_i2csc_ctl of ncu_i2csc_ctl.v
output [5:0]		ncu_dmu_mondo_id;	// From sii_ucb_buf of ncu_i2cbufsii_ctl.v
output			ncu_dmu_mondo_id_par;
output			ncu_dmu_mondo_nack;	// From ncu_i2csc_ctl of ncu_i2csc_ctl.v
output			ncu_dmu_stall;		// From dmucsr_ucb_buf of ncu_i2cbuf32_ni_ctl.v
output			ncu_int_ack_rd;		// From ncu_i2csc_ctl of ncu_i2csc_ctl.v
output			ncu_man_ack_rd;		// From ncu_i2csc_ctl of ncu_i2csc_ctl.v
output			ncu_man_int_rd;		// From ncu_i2csc_ctl of ncu_i2csc_ctl.v
output			ncu_mcu0_stall;		// From mcu0_ucb_buf of ncu_i2cbuf4_ctl.v
output			ncu_mcu1_stall;		// From mcu1_ucb_buf of ncu_i2cbuf4_ctl.v
output			ncu_mcu2_stall;		// From mcu2_ucb_buf of ncu_i2cbuf4_ctl.v
output			ncu_mcu3_stall;		// From mcu3_ucb_buf of ncu_i2cbuf4_ctl.v
output			ncu_niu_stall;		// From niu_ucb_buf of ncu_i2cbuf32_ctl.v
output			ncu_rcu_stall;		// From rcu_ucb_buf of ncu_i2cbuf4_ni_ctl.v
output			ncu_dbg1_stall;		// From dbg1_ucb_buf of ncu_i2cbuf4_ni_ctl.v
//output                  ncu_rng_stall;          // From rng_ucb_buf of ncu_i2cbuf4_ni_ctl.v
output			ncu_sii_gnt;		// From sii_ucb_buf of ncu_i2cbufsii_ctl.v
output			ncu_ssi_stall;		// From ssi_ucb_buf of ncu_i2cbuf4_ctl.v
output [7:0]		ncu_tcu_data;		// From tcu_ucb_buf of ncu_ucbbusout8_ctl.v
output			ncu_tcu_vld;		// From tcu_ucb_buf of ncu_ucbbusout8_ctl.v
output			rd_nack_rd;		// From ncu_i2csc_ctl of ncu_i2csc_ctl.v
output			scan_out;		// From niu_ucb_buf of ncu_i2cbuf32_ctl.v
output [3:0]		sii_cr_id_rtn;		// From sii_ucb_buf of ncu_i2cbufsii_ctl.v
output			sii_cr_id_rtn_vld;	// From sii_ucb_buf of ncu_i2cbufsii_ctl.v

// err ecc //
input			raserrce;
input			raserrue;
output			io_rd_intman_d2;		// From ncu_i2csc_ctl of ncu_i2csc_ctl.v
output [63:0]		siierrsyn;
output			siierrsyn_done;

output [15:0]		ncudpsyn;
output			ncuctag_ue;
input			ncuctag_uei;
output			ncuctag_ce;
input			ncuctag_cei;
output			ncusiid_pe;
input			ncusiid_pei;

/* autowire */


///* ncu_i2csc_ctl auto_template ( 
//  			    .scan_out() ); */
ncu_i2csc_ctl ncu_i2csc_ctl (/*AUTOINST*/
			     // Outputs
			     .sii_mondo_rd(sii_mondo_rd),
			     .ncu_dmu_mondo_ack(ncu_dmu_mondo_ack),
			     .ncu_dmu_mondo_nack(ncu_dmu_mondo_nack),
			     .ssi_int_rd(ssi_int_rd),
			     .mcu0_int_rd(mcu0_int_rd),
			     .mcu1_int_rd(mcu1_int_rd),
			     .mcu2_int_rd(mcu2_int_rd),
			     .mcu3_int_rd(mcu3_int_rd),
			     .niu_int_rd(niu_int_rd),
			     .ncu_man_int_rd(ncu_man_int_rd),
			     .siipio_ack_rd(siipio_ack_rd),
			     .dmucsr_ack_rd(dmucsr_ack_rd),
			     .ccu_ack_rd(ccu_ack_rd),
			     .mcu0_ack_rd(mcu0_ack_rd),
			     .mcu1_ack_rd(mcu1_ack_rd),
			     .mcu2_ack_rd(mcu2_ack_rd),
			     .mcu3_ack_rd(mcu3_ack_rd),
			     .ssi_ack_rd(ssi_ack_rd),
			     .rcu_ack_rd(rcu_ack_rd),
			     .dbg1_ack_rd(dbg1_ack_rd),
			     .niu_ack_rd(niu_ack_rd),
			     .ncu_man_ack_rd(ncu_man_ack_rd),
			     .ncu_int_ack_rd(ncu_int_ack_rd),
			     .bounce_ack_rd(bounce_ack_rd),
			     .rd_nack_rd(rd_nack_rd),
			     .iob_tap_packet_vld(iob_tap_packet_vld),
			     .int_sel	(int_sel[6:0]),
			     .ack_sel	(ack_sel[14:0]),
			     .mondo_srvcd_d1(mondo_srvcd_d1),
			     .int_srvcd_d2(int_srvcd_d2),
			     .ack_srvcd_d1(ack_srvcd_d1),
			     .iobuf_tail_s(iobuf_tail_s[5:0]),
			     .io_mondo_data_wr_s(io_mondo_data_wr_s),
			     .iobuf_avail(iobuf_avail),
			     .iobuf_wr	(iobuf_wr),
			     .iobuf_tail_ptr(iobuf_tail_ptr[4:0]),
			     // Inputs
			     .tcu_dbr_gateoff(tcu_dbr_gateoff),
			     .scan_in(ncu_i2csc_ctl_scanin),
			     .scan_out(ncu_i2csc_ctl_scanout),
			     .iol2clk	(iol2clk),
			     .tcu_pce_ov(tcu_pce_ov),
			     .tcu_clk_stop(tcu_clk_stop),
			     .tcu_scan_en(tcu_scan_en),
			     .tcu_aclk	(tcu_aclk),
			     .tcu_bclk	(tcu_bclk),
			     .sii_mondo_vld(sii_mondo_vld),
			     .sii_mondo_target(sii_mondo_target[5:0]),
			     .sii_mondo_ctagerr(sii_mondo_ctagerr),
			     .ssi_int_vld(ssi_int_vld),
			     .mcu0_int_vld(mcu0_int_vld),
			     .mcu1_int_vld(mcu1_int_vld),
			     .mcu2_int_vld(mcu2_int_vld),
			     .mcu3_int_vld(mcu3_int_vld),
			     .niu_int_vld(niu_int_vld),
			     .ncu_man_int_vld(ncu_man_int_vld),
			     .siipio_ack_vld(siipio_ack_vld),
			     .dmucsr_ack_vld(dmucsr_ack_vld),
			     .ccu_ack_vld(ccu_ack_vld),
			     .mcu0_ack_vld(mcu0_ack_vld),
			     .mcu1_ack_vld(mcu1_ack_vld),
			     .mcu2_ack_vld(mcu2_ack_vld),
			     .mcu3_ack_vld(mcu3_ack_vld),
			     .ssi_ack_vld(ssi_ack_vld),
			     .rcu_ack_vld(rcu_ack_vld),
			     .dbg1_ack_vld(dbg1_ack_vld),
			     .niu_ack_vld(niu_ack_vld),
			     .ncu_man_ack_vld(ncu_man_ack_vld),
			     .ncu_int_ack_vld(ncu_int_ack_vld),
			     .bounce_ack_vld(bounce_ack_vld),
			     .rd_nack_vld(rd_nack_vld),
			     .tap_iob_busy(tap_iob_busy),
			     .ucb_ack_packet_d1(ucb_ack_packet_d1[127:0]),
			     .iobuf_head_f(iobuf_head_f[5:0]),
			     .mondo_busy_vec_f(mondo_busy_vec_f[63:0]),
			     .srvc_wr_ack(srvc_wr_ack),
			     .dmupio_srvc_wack(dmupio_srvc_wack),
			     .lhs_intman_acc(lhs_intman_acc),
			     .intman_pchkf2i2c(intman_pchkf2i2c),
			     .intman_dout_v(intman_dout_v),
			     .mb0_waddr	(mb0_addr[5:0]),
			     .mb0_run(mb0_run),
			     .mb0_iobuf_wr_en(mb0_iobuf_wr_en));



///*ncu_i2csd_ctl auto_template ( 
//  			  .scan_out() ); */
ncu_i2csd_ctl ncu_i2csd_ctl (/*AUTOINST*/
			     // Outputs
			     .io_mondo_data_wr_addr_s(io_mondo_data_wr_addr_s[5:0]),
			     .io_mondo_data0_din_s(io_mondo_data0_din_s[63:0]),
			     .io_mondo_data1_din_s(io_mondo_data1_din_s[63:0]),
			     .io_intman_addr(io_intman_addr[6:0]),
			     .ucb_ack_packet_d1(ucb_ack_packet_d1[127:0]),
			     .iobuf_din	(iobuf_din[175:0]),
			     .iob_tap_packet(iob_tap_packet[127:0]),
			     .io_rd_intman_d2(io_rd_intman_d2),
			     .intman_dout_v(intman_dout_v),
			     // Inputs
			     .scan_in(ncu_i2csd_ctl_scanin),
			     .scan_out(ncu_i2csd_ctl_scanout),
			     .iol2clk	(iol2clk),
			     .tcu_pce_ov(tcu_pce_ov),
			     .tcu_clk_stop(tcu_clk_stop),
			     .tcu_scan_en(tcu_scan_en),
			     .tcu_aclk	(tcu_aclk),
			     .tcu_bclk	(tcu_bclk),
			     .sii_mondo_data0(sii_mondo_data0[63:0]),
			     .sii_mondo_data1(sii_mondo_data1[63:0]),
			     .sii_mondo_target(sii_mondo_target[5:0]),
			     .sii_mondo_ctagerr(sii_mondo_ctagerr),
			     .ssi_int_packet(ssi_int_packet[24:0]),
			     .mcu0_int_packet(mcu0_int_packet[24:0]),
			     .mcu1_int_packet(mcu1_int_packet[24:0]),
			     .mcu2_int_packet(mcu2_int_packet[24:0]),
			     .mcu3_int_packet(mcu3_int_packet[24:0]),
			     .niu_int_packet(niu_int_packet[24:0]),
			     .ncu_man_int_packet(ncu_man_int_packet[24:0]),
			     .siipio_ack_packet(siipio_ack_packet[139:0]),
			     .dmucsr_ack_packet(dmucsr_ack_packet[127:0]),
			     .ccu_ack_packet(ccu_ack_packet[127:0]),
			     .mcu0_ack_packet(mcu0_ack_packet[127:0]),
			     .mcu1_ack_packet(mcu1_ack_packet[127:0]),
			     .mcu2_ack_packet(mcu2_ack_packet[127:0]),
			     .mcu3_ack_packet(mcu3_ack_packet[127:0]),
			     .ssi_ack_packet(ssi_ack_packet[127:0]),
			     .rcu_ack_packet(rcu_ack_packet[127:0]),
			     .dbg1_ack_packet(dbg1_ack_packet[127:0]),
			     .niu_ack_packet(niu_ack_packet[127:0]),
			     .ncu_man_ack_packet(ncu_man_ack_packet[127:0]),
			     .ncu_int_ack_packet(ncu_int_ack_packet[127:0]),
			     .bounce_ack_packet(bounce_ack_packet[127:0]),
			     .rd_nack_packet(rd_nack_packet[63:0]),
			     .intman_tbl_dout(intman_tbl_dout[11:0]),
			     .int_sel	(int_sel[6:0]),
			     .ack_sel	(ack_sel[14:0]),
			     .mondo_srvcd_d1(mondo_srvcd_d1),
			     .int_srvcd_d2(int_srvcd_d2),
			     .ack_srvcd_d1(ack_srvcd_d1),
			     .raserrce(raserrce),
			     .raserrue(raserrue),
			     .mb0_addr(mb0_addr[5:0]),
			     .mb0_wdata(mb0_wdata[7:0]),
			     .mb0_run(mb0_run),
			     .mb0_iobuf_wr_en(mb0_iobuf_wr_en),
			     .wr_ack_iopkt(wr_ack_iopkt[152:0]),
			     .dmupio_wack_iopkt(dmupio_wack_iopkt[152:0]),
			     .srvc_wr_ack(srvc_wr_ack),
			     .mondoinvec(mondoinvec[5:0]));



/*****************************************************************
 * outbound to TAP
 *****************************************************************/
///* ncu_i2cbuftcu_ctl auto_template (
//    .scan_out		(),
//    .vld                (ncu_tcu_vld),
//    .data               (ncu_tcu_data[7:0]),
//    .stall              (tcu_ncu_stall) ) ; */
ncu_i2cbuftcu_ctl tcu_ucb_buf (/*AUTOINST*/
			       // Outputs
			       .vld	(ncu_tcu_vld),		 // Templated
			       .data	(ncu_tcu_data[7:0]),	 // Templated
			       .tap_iob_busy(tap_iob_busy),
			       // Inputs
			       .scan_in(tcu_ucb_buf_scanin),
			       .scan_out(tcu_ucb_buf_scanout),
			       .iol2clk	(iol2clk),
			       .tcu_pce_ov(tcu_pce_ov),
			       .tcu_clk_stop(tcu_clk_stop),
			       .tcu_scan_en(tcu_scan_en),
			       .tcu_aclk(tcu_aclk),
			       .tcu_bclk(tcu_bclk),
			       .stall	(tcu_ncu_stall),	 // Templated
			       .iob_tap_packet(iob_tap_packet[127:0]),
			       .iob_tap_packet_vld(iob_tap_packet_vld));




/*****************************************************************
 * inbound sii ucb buffers
 *****************************************************************/
///* ncu_i2cbufsii_ctl auto_template (
//		.scan_out	(),
//    		.req_ack_obj        (siipio_ack_packet[139:0]),
//    		.req_ack_vld        (siipio_ack_vld),
//    		.rd_req_ack_dbl_buf (siipio_ack_rd)); */
ncu_i2cbufsii_ctl  sii_ucb_buf (/*AUTOINST*/
				// Outputs
				.ncu_sii_gnt(ncu_sii_gnt),
				.sii_mondo_vld(sii_mondo_vld),
				.sii_mondo_data0(sii_mondo_data0[63:0]),
				.sii_mondo_data1(sii_mondo_data1[63:0]),
				.sii_mondo_target(sii_mondo_target[5:0]),
				.sii_mondo_ctagerr(sii_mondo_ctagerr),
				.ncu_dmu_mondo_id(ncu_dmu_mondo_id[5:0]),
				.ncu_dmu_mondo_id_par(ncu_dmu_mondo_id_par),
				.sii_cr_id_rtn(sii_cr_id_rtn[3:0]),
				.sii_cr_id_rtn_vld(sii_cr_id_rtn_vld),
				.req_ack_obj(siipio_ack_packet[139:0]), // Templated
				.req_ack_vld(siipio_ack_vld),	 // Templated
				.ncuctag_ue(ncuctag_ue),
				.ncuctag_ce(ncuctag_ce),
				.ncusiid_pe(ncusiid_pe),
				.ncudpsyn(ncudpsyn[15:0]),
				.siierrsyn(siierrsyn[63:0]),
				.siierrsyn_done(siierrsyn_done),
				// Inputs
				.scan_in(sii_ucb_buf_scanin),
				.scan_out(sii_ucb_buf_scanout),
				.iol2clk(iol2clk),
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(tcu_clk_stop),
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(tcu_aclk),
				.tcu_bclk(tcu_bclk),
				.sii_ncu_data(sii_ncu_data[31:0]),
				.sii_ncu_dparity(sii_ncu_dparity[1:0]),
				.sii_ncu_req(sii_ncu_req),
				.sii_ncu_syn_data(sii_ncu_syn_data[3:0]),
				.sii_ncu_syn_vld(sii_ncu_syn_vld),
				.sii_mondo_rd(sii_mondo_rd),
				.rd_req_ack_dbl_buf(siipio_ack_rd), // Templated
				.ncuctag_uei(ncuctag_uei),
				.ncuctag_cei(ncuctag_cei),
				.ncusiid_pei(ncusiid_pei));



/*****************************************************************
 * inbound dmucsr ucb buffers (no support to int)
 *****************************************************************/
///* ncu_i2cbuf32_ni_ctl auto_template 
//     		(
//		.scan_out	(),
//    		.ucb_iob_vld        (dmu_ncu_vld),
//    		.ucb_iob_data       (dmu_ncu_data[31:0]),
//    		.iob_ucb_stall      (ncu_dmu_stall),
//		////
//    		.req_ack_obj        (dmucsr_ack_packet[127:0]),
//    		.req_ack_vld        (dmucsr_ack_vld),
//    		.rd_req_ack_dbl_buf (dmucsr_ack_rd),); */
ncu_i2cbuf32_ni_ctl dmucsr_ucb_buf (/*AUTOINST*/
				    // Outputs
				    .iob_ucb_stall(ncu_dmu_stall), // Templated
				    .req_ack_obj(dmucsr_ack_packet[127:0]), // Templated
				    .req_ack_vld(dmucsr_ack_vld), // Templated
				    // Inputs
				    .tcu_dbr_gateoff(tcu_dbr_gateoff),
				    .scan_in(dmucsr_ucb_buf_scanin),
				    .scan_out(dmucsr_ucb_buf_scanout),
				    .iol2clk(iol2clk),
				    .tcu_pce_ov(tcu_pce_ov),
				    .tcu_clk_stop(tcu_clk_stop),
				    .tcu_scan_en(tcu_scan_en),
				    .tcu_aclk(tcu_aclk),
				    .tcu_bclk(tcu_bclk),
				    .ucb_iob_vld(dmu_ncu_vld),	 // Templated
				    .ucb_iob_data(dmu_ncu_data[31:0]), // Templated
				    .rd_req_ack_dbl_buf(dmucsr_ack_rd)); // Templated



/*****************************************************************
 * inbound ssi ucb buffers
 *****************************************************************/
///* ncu_i2cbuf4_ctl auto_template (
//		.scan_out	(),
//    		.ucb_iob_vld        (ssi_ncu_vld),
//    		.ucb_iob_data       (ssi_ncu_data[3:0]),
//    		.iob_ucb_stall      (ncu_ssi_stall),
//    		.req_ack_obj        (ssi_ack_packet[127:0]),
//    		.req_ack_vld        (ssi_ack_vld),
//    		.rd_req_ack_dbl_buf (ssi_ack_rd),
//    		.int_obj            (ssi_int_packet[24:0]),
//    		.int_vld            (ssi_int_vld),
//    		.rd_int_dbl_buf     (ssi_int_rd)); */
ncu_i2cbuf4_ctl ssi_ucb_buf (/*AUTOINST*/
			     // Outputs
			     .iob_ucb_stall(ncu_ssi_stall),	 // Templated
			     .req_ack_obj(ssi_ack_packet[127:0]), // Templated
			     .req_ack_vld(ssi_ack_vld),		 // Templated
			     .int_obj	(ssi_int_packet[24:0]),	 // Templated
			     .int_vld	(ssi_int_vld),		 // Templated
			     // Inputs
			     .scan_in(ssi_ucb_buf_scanin),
			     .scan_out(ssi_ucb_buf_scanout),
			     .iol2clk	(iol2clk),
			     .tcu_pce_ov(tcu_pce_ov),
			     .tcu_clk_stop(tcu_clk_stop),
			     .tcu_scan_en(tcu_scan_en),
			     .tcu_aclk	(tcu_aclk),
			     .tcu_bclk	(tcu_bclk),
			     .ucb_iob_vld(ssi_ncu_vld),		 // Templated
			     .ucb_iob_data(ssi_ncu_data[3:0]),	 // Templated
			     .rd_req_ack_dbl_buf(ssi_ack_rd),	 // Templated
			     .rd_int_dbl_buf(ssi_int_rd));	 // Templated



/*****************************************************************
 * inbound mcu0 ucb buffers
 *****************************************************************/
///* ncu_i2cbuf4_ctl auto_template (
//		.scan_out	(),
//    		.ucb_iob_vld        (mcu0_ncu_vld),
//    		.ucb_iob_data       (mcu0_ncu_data[3:0]),
//    		.iob_ucb_stall      (ncu_mcu0_stall),
//    		.req_ack_obj        (mcu0_ack_packet[127:0]),
//    		.req_ack_vld        (mcu0_ack_vld),
//    		.rd_req_ack_dbl_buf (mcu0_ack_rd),
//    		.int_obj            (mcu0_int_packet[24:0]),
//    		.int_vld            (mcu0_int_vld),
//    		.rd_int_dbl_buf     (mcu0_int_rd)); */
ncu_i2cbuf4_ctl mcu0_ucb_buf (/*AUTOINST*/
			      // Outputs
			      .iob_ucb_stall(ncu_mcu0_stall),	 // Templated
			      .req_ack_obj(mcu0_ack_packet[127:0]), // Templated
			      .req_ack_vld(mcu0_ack_vld),	 // Templated
			      .int_obj	(mcu0_int_packet[24:0]), // Templated
			      .int_vld	(mcu0_int_vld),		 // Templated
			      // Inputs
			      .scan_in(mcu0_ucb_buf_scanin),
			      .scan_out(mcu0_ucb_buf_scanout),
			      .iol2clk	(iol2clk),
			      .tcu_pce_ov(tcu_pce_ov),
			      .tcu_clk_stop(tcu_clk_stop),
			      .tcu_scan_en(tcu_scan_en),
			      .tcu_aclk	(tcu_aclk),
			      .tcu_bclk	(tcu_bclk),
			      .ucb_iob_vld(mcu0_ncu_vld),	 // Templated
			      .ucb_iob_data(mcu0_ncu_data[3:0]), // Templated
			      .rd_req_ack_dbl_buf(mcu0_ack_rd),	 // Templated
			      .rd_int_dbl_buf(mcu0_int_rd));	 // Templated



/*****************************************************************
 * inbound mcu1 ucb buffers
 *****************************************************************/
///* ncu_i2cbuf4_ctl auto_template (
//		.scan_out	(),
//    		.ucb_iob_vld        (mcu1_ncu_vld),
//    		.ucb_iob_data       (mcu1_ncu_data[3:0]),
//    		.iob_ucb_stall      (ncu_mcu1_stall),
//    		.req_ack_obj        (mcu1_ack_packet[127:0]),
//    		.req_ack_vld        (mcu1_ack_vld),
//    		.rd_req_ack_dbl_buf (mcu1_ack_rd),
//    		.int_obj            (mcu1_int_packet[24:0]),
//    		.int_vld            (mcu1_int_vld),
//    		.rd_int_dbl_buf     (mcu1_int_rd),); */
ncu_i2cbuf4_ctl mcu1_ucb_buf (/*AUTOINST*/
			      // Outputs
			      .iob_ucb_stall(ncu_mcu1_stall),	 // Templated
			      .req_ack_obj(mcu1_ack_packet[127:0]), // Templated
			      .req_ack_vld(mcu1_ack_vld),	 // Templated
			      .int_obj	(mcu1_int_packet[24:0]), // Templated
			      .int_vld	(mcu1_int_vld),		 // Templated
			      // Inputs
			      .scan_in(mcu1_ucb_buf_scanin),
			      .scan_out(mcu1_ucb_buf_scanout),
			      .iol2clk	(iol2clk),
			      .tcu_pce_ov(tcu_pce_ov),
			      .tcu_clk_stop(tcu_clk_stop),
			      .tcu_scan_en(tcu_scan_en),
			      .tcu_aclk	(tcu_aclk),
			      .tcu_bclk	(tcu_bclk),
			      .ucb_iob_vld(mcu1_ncu_vld),	 // Templated
			      .ucb_iob_data(mcu1_ncu_data[3:0]), // Templated
			      .rd_req_ack_dbl_buf(mcu1_ack_rd),	 // Templated
			      .rd_int_dbl_buf(mcu1_int_rd));	 // Templated



/*****************************************************************
 * inbound mcu2 ucb buffers
 *****************************************************************/
///* ncu_i2cbuf4_ctl auto_template (
//		.scan_out	(),
//    		.ucb_iob_vld        (mcu2_ncu_vld),
//    		.ucb_iob_data       (mcu2_ncu_data[3:0]),
//    		.iob_ucb_stall      (ncu_mcu2_stall),
//    		.req_ack_obj        (mcu2_ack_packet[127:0]),
//    		.req_ack_vld        (mcu2_ack_vld),
//    		.rd_req_ack_dbl_buf (mcu2_ack_rd),
//    		.int_obj            (mcu2_int_packet[24:0]),
//    		.int_vld            (mcu2_int_vld),
//    		.rd_int_dbl_buf     (mcu2_int_rd),); */
ncu_i2cbuf4_ctl mcu2_ucb_buf (/*AUTOINST*/
			      // Outputs
			      .iob_ucb_stall(ncu_mcu2_stall),	 // Templated
			      .req_ack_obj(mcu2_ack_packet[127:0]), // Templated
			      .req_ack_vld(mcu2_ack_vld),	 // Templated
			      .int_obj	(mcu2_int_packet[24:0]), // Templated
			      .int_vld	(mcu2_int_vld),		 // Templated
			      // Inputs
			      .scan_in(mcu2_ucb_buf_scanin),
			      .scan_out(mcu2_ucb_buf_scanout),
			      .iol2clk	(iol2clk),
			      .tcu_pce_ov(tcu_pce_ov),
			      .tcu_clk_stop(tcu_clk_stop),
			      .tcu_scan_en(tcu_scan_en),
			      .tcu_aclk	(tcu_aclk),
			      .tcu_bclk	(tcu_bclk),
			      .ucb_iob_vld(mcu2_ncu_vld),	 // Templated
			      .ucb_iob_data(mcu2_ncu_data[3:0]), // Templated
			      .rd_req_ack_dbl_buf(mcu2_ack_rd),	 // Templated
			      .rd_int_dbl_buf(mcu2_int_rd));	 // Templated



/*****************************************************************
 * inbound mcu3 ucb buffers
 *****************************************************************/
///* ncu_i2cbuf4_ctl auto_template (
//		.scan_out	(),
//    		.ucb_iob_vld        (mcu3_ncu_vld),
//    		.ucb_iob_data       (mcu3_ncu_data[3:0]),
//    		.iob_ucb_stall      (ncu_mcu3_stall),
//    		.req_ack_obj        (mcu3_ack_packet[127:0]),
//    		.req_ack_vld        (mcu3_ack_vld),
//    		.rd_req_ack_dbl_buf (mcu3_ack_rd),
//    		.int_obj            (mcu3_int_packet[24:0]),
//    		.int_vld            (mcu3_int_vld),
//    		.rd_int_dbl_buf     (mcu3_int_rd)); */
ncu_i2cbuf4_ctl mcu3_ucb_buf (/*AUTOINST*/
			      // Outputs
			      .iob_ucb_stall(ncu_mcu3_stall),	 // Templated
			      .req_ack_obj(mcu3_ack_packet[127:0]), // Templated
			      .req_ack_vld(mcu3_ack_vld),	 // Templated
			      .int_obj	(mcu3_int_packet[24:0]), // Templated
			      .int_vld	(mcu3_int_vld),		 // Templated
			      // Inputs
			      .scan_in(mcu3_ucb_buf_scanin),
			      .scan_out(mcu3_ucb_buf_scanout),
			      .iol2clk	(iol2clk),
			      .tcu_pce_ov(tcu_pce_ov),
			      .tcu_clk_stop(tcu_clk_stop),
			      .tcu_scan_en(tcu_scan_en),
			      .tcu_aclk	(tcu_aclk),
			      .tcu_bclk	(tcu_bclk),
			      .ucb_iob_vld(mcu3_ncu_vld),	 // Templated
			      .ucb_iob_data(mcu3_ncu_data[3:0]), // Templated
			      .rd_req_ack_dbl_buf(mcu3_ack_rd),	 // Templated
			      .rd_int_dbl_buf(mcu3_int_rd));	 // Templated



/*****************************************************************
 * inbound ccu ucb buffers (no int support)
 *****************************************************************/
///* ncu_i2cbuf4_ni_ctl auto_template (
//		.scan_out	(),
//    		.ucb_iob_vld        (ccu_ncu_vld),
//    		.ucb_iob_data       (ccu_ncu_data[3:0]),
//    		.iob_ucb_stall      (ncu_ccu_stall),
//    		.req_ack_obj        (ccu_ack_packet[127:0]),
//    		.req_ack_vld        (ccu_ack_vld),
//    		.rd_req_ack_dbl_buf (ccu_ack_rd));  */
ncu_i2cbuf4_ni_ctl  ccu_ucb_buf (/*AUTOINST*/
				 // Outputs
				 .iob_ucb_stall(ncu_ccu_stall),	 // Templated
				 .req_ack_obj(ccu_ack_packet[127:0]), // Templated
				 .req_ack_vld(ccu_ack_vld),	 // Templated
				 // Inputs
				 .scan_in(ccu_ucb_buf_scanin),
				 .scan_out(ccu_ucb_buf_scanout),
				 .iol2clk(iol2clk),
				 .tcu_pce_ov(tcu_pce_ov),
				 .tcu_clk_stop(tcu_clk_stop),
				 .tcu_scan_en(tcu_scan_en),
				 .tcu_aclk(tcu_aclk),
				 .tcu_bclk(tcu_bclk),
				 .ucb_iob_vld(ccu_ncu_vld),	 // Templated
				 .ucb_iob_data(ccu_ncu_data[3:0]), // Templated
				 .rd_req_ack_dbl_buf(ccu_ack_rd)); // Templated



/*****************************************************************
 * inbound rcu ucb buffers (no int support)
 *****************************************************************/
///* ncu_i2cbuf4_ni_ctl auto_template (
//		.scan_out	(),
//    		.ucb_iob_vld        (rcu_ncu_vld),
//    		.ucb_iob_data       (rcu_ncu_data[3:0]),
//    		.iob_ucb_stall      (ncu_rcu_stall),
//    		.req_ack_obj        (rcu_ack_packet[127:0]),
//    		.req_ack_vld        (rcu_ack_vld),
//    		.rd_req_ack_dbl_buf (rcu_ack_rd)); */
ncu_i2cbuf4_ni_ctl rcu_ucb_buf (/*AUTOINST*/
				// Outputs
				.iob_ucb_stall(ncu_rcu_stall),	 // Templated
				.req_ack_obj(rcu_ack_packet[127:0]), // Templated
				.req_ack_vld(rcu_ack_vld),	 // Templated
				// Inputs
				.scan_in(rcu_ucb_buf_scanin),
				.scan_out(rcu_ucb_buf_scanout),
				.iol2clk(iol2clk),
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(tcu_clk_stop),
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(tcu_aclk),
				.tcu_bclk(tcu_bclk),
				.ucb_iob_vld(rcu_ncu_vld),	 // Templated
				.ucb_iob_data(rcu_ncu_data[3:0]), // Templated
				.rd_req_ack_dbl_buf(rcu_ack_rd)); // Templated



/*****************************************************************
 * inbound rng ucb buffers (no int support)
 *****************************************************************/
///* ncu_i2cbuf4_ni_ctl auto_template 
//     		(
//		.scan_out	(),
//    		.ucb_iob_vld        (rng_ncu_vld),
//    		.ucb_iob_data       (rng_ncu_data[3:0]),
//    		.iob_ucb_stall      (ncu_rng_stall),
//    		.req_ack_obj        (rng_ack_packet[127:0]),
//    		.req_ack_vld        (rng_ack_vld),
//    		.rd_req_ack_dbl_buf (rng_ack_rd)); */
ncu_i2cbuf4_ni_ctl dbg1_ucb_buf (/*AUTOINST*/
				// Outputs
				.iob_ucb_stall(ncu_dbg1_stall),	 // Templated
				.req_ack_obj(dbg1_ack_packet[127:0]), // Templated
				.req_ack_vld(dbg1_ack_vld),	 // Templated
				// Inputs
				.scan_in(dbg1_ucb_buf_scanin),
				.scan_out(dbg1_ucb_buf_scanout),
				.iol2clk(iol2clk),
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(tcu_clk_stop),
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(tcu_aclk),
				.tcu_bclk(tcu_bclk),
				.ucb_iob_vld(dbg1_ncu_vld),	 // Templated
				.ucb_iob_data(dbg1_ncu_data[3:0]), // Templated
				.rd_req_ack_dbl_buf(dbg1_ack_rd)); // Templated




/*****************************************************************
 * inbound niu ucb buffers
 *****************************************************************/
///* ncu_i2cbuf32_ctl auto_template (
//		.scan_out	(),
//    		.ucb_iob_vld        (niu_ncu_vld),
//    		.ucb_iob_data       (niu_ncu_data[31:0]),
//    		.iob_ucb_stall      (ncu_niu_stall),
//    		.req_ack_obj        (niu_ack_packet[127:0]),
//    		.req_ack_vld        (niu_ack_vld),
//    		.rd_req_ack_dbl_buf (niu_ack_rd),
//    		.int_obj            (niu_int_packet[24:0]),
//    		.int_vld            (niu_int_vld),
//    		.rd_int_dbl_buf     (niu_int_rd)); */
ncu_i2cbuf32_ctl niu_ucb_buf (/*AUTOINST*/
			      // Outputs
			      .iob_ucb_stall(ncu_niu_stall),	 // Templated
			      .req_ack_obj(niu_ack_packet[127:0]), // Templated
			      .req_ack_vld(niu_ack_vld),	 // Templated
			      .int_obj	(niu_int_packet[24:0]),	 // Templated
			      .int_vld	(niu_int_vld),		 // Templated
			      // Inputs
			      .tcu_dbr_gateoff(tcu_dbr_gateoff),
			      .scan_in(niu_ucb_buf_scanin),
			      .scan_out(niu_ucb_buf_scanout),
			      .iol2clk	(iol2clk),
			      .tcu_pce_ov(tcu_pce_ov),
			      .tcu_clk_stop(tcu_clk_stop),
			      .tcu_scan_en(tcu_scan_en),
			      .tcu_aclk	(tcu_aclk),
			      .tcu_bclk	(tcu_bclk),
			      .ucb_iob_vld(niu_ncu_vld),	 // Templated
			      .ucb_iob_data(niu_ncu_data[31:0]), // Templated
			      .rd_req_ack_dbl_buf(niu_ack_rd),	 // Templated
			      .rd_int_dbl_buf(niu_int_rd));	 // Templated






// fixscan start:
assign ncu_i2csc_ctl_scanin      = scan_in                  ;
assign ncu_i2csd_ctl_scanin      = ncu_i2csc_ctl_scanout    ;
assign tcu_ucb_buf_scanin        = ncu_i2csd_ctl_scanout    ;
assign sii_ucb_buf_scanin        = tcu_ucb_buf_scanout      ;
assign dmucsr_ucb_buf_scanin     = sii_ucb_buf_scanout      ;
assign ssi_ucb_buf_scanin        = dmucsr_ucb_buf_scanout   ;
assign mcu0_ucb_buf_scanin       = ssi_ucb_buf_scanout      ;
assign mcu1_ucb_buf_scanin       = mcu0_ucb_buf_scanout     ;
assign mcu2_ucb_buf_scanin       = mcu1_ucb_buf_scanout     ;
assign mcu3_ucb_buf_scanin       = mcu2_ucb_buf_scanout     ;
assign ccu_ucb_buf_scanin        = mcu3_ucb_buf_scanout     ;
assign rcu_ucb_buf_scanin        = ccu_ucb_buf_scanout      ;
assign dbg1_ucb_buf_scanin        = rcu_ucb_buf_scanout      ;
assign niu_ucb_buf_scanin        = dbg1_ucb_buf_scanout      ;
assign scan_out                  = niu_ucb_buf_scanout      ;
// fixscan end:
endmodule








`define RF_RDEN_OFFSTATE            1'b1

//====================================
`define NCU_INTMANRF_DEPTH         128
`define NCU_INTMANRF_DATAWIDTH      16
`define NCU_INTMANRF_ADDRWIDTH       7
//====================================

//====================================
`define NCU_MONDORF_DEPTH           64
`define NCU_MONDORF_DATAWIDTH       72
`define NCU_MONDORF_ADDRWIDTH        6
//====================================

//====================================
`define NCU_CPUBUFRF_DEPTH          32
`define NCU_CPUBUFRF_DATAWIDTH     144
`define NCU_CPUBUFRF_ADDRWIDTH       5
//====================================

//====================================
`define NCU_IOBUFRF_DEPTH          32
`define NCU_IOBUFRF_DATAWIDTH     144
`define NCU_IOBUFRF_ADDRWIDTH       5
//====================================

//====================================
`define NCU_IOBUF1RF_DEPTH          32
`define NCU_IOBUF1RF_DATAWIDTH      32
`define NCU_IOBUF1RF_ADDRWIDTH       5
//====================================

//====================================
`define NCU_INTBUFRF_DEPTH          32
`define NCU_INTBUFRF_DATAWIDTH     144
`define NCU_INTBUFRF_ADDRWIDTH       5
//====================================

//== fix me : need to remove when warm //
//== becomes available //
`define WMR_LENGTH		10'd999
`define WMR_LENGTH_P1		10'd1000

//// NCU CSR_MAN address   80_0000_xxxx ////
`define NCU_CSR_MAN			16'h0000
`define NCU_CREG_INTMAN			16'h0000
//`define NCU_CREG_INTVECDISP		16'h0800
`define NCU_CREG_MONDOINVEC		16'h0a00
`define NCU_CREG_SERNUM			16'h1000
`define NCU_CREG_FUSESTAT		16'h1008
`define NCU_CREG_COREAVAIL		16'h1010
`define NCU_CREG_BANKAVAIL		16'h1018
`define NCU_CREG_BANK_ENABLE		16'h1020
`define NCU_CREG_BANK_ENABLE_STATUS 	16'h1028
`define NCU_CREG_L2_HASH_ENABLE		16'h1030
`define NCU_CREG_L2_HASH_ENABLE_STATUS	16'h1038


`define NCU_CREG_MEM32_BASE	16'h2000
`define NCU_CREG_MEM32_MASK	16'h2008
`define NCU_CREG_MEM64_BASE	16'h2010
`define NCU_CREG_MEM64_MASK	16'h2018
`define NCU_CREG_IOCON_BASE	16'h2020
`define NCU_CREG_IOCON_MASK	16'h2028
`define NCU_CREG_MMUFSH		16'h2030

`define NCU_CREG_ESR		16'h3000
`define NCU_CREG_ELE		16'h3008
`define NCU_CREG_EIE		16'h3010
`define NCU_CREG_EJR		16'h3018
`define NCU_CREG_FEE		16'h3020
`define NCU_CREG_PER		16'h3028
`define NCU_CREG_SIISYN		16'h3030
`define NCU_CREG_NCUSYN		16'h3038
`define NCU_CREG_SCKSEL         16'h3040
`define NCU_CREG_DBGTRIG_EN     16'h4000

//// NUC CSR_MONDO address 80_0004_xxxx ////
`define NCU_CSR_MONDO		16'h0004
`define NCU_CREG_MDATA0  	16'h0000 
`define NCU_CREG_MDATA1  	16'h0200 
`define NCU_CREG_MDATA0_ALIAS	16'h0400 
`define NCU_CREG_MDATA1_ALIAS	16'h0600 
`define NCU_CREG_MBUSY		16'h0800 
`define NCU_CREG_MBUSY_ALIAS	16'h0a00 



// ASI shared reg 90_xxxx_xxxx//
`define NCU_ASI_A_HIT			10'h104 // 6-bits cpuid and thread id are "x"
`define NCU_ASI_B_HIT			10'h1CC // 6-bits cpuid and thread id are "x"
`define NCU_ASI_C_HIT			10'h114	// 6-bits cpuid and thread id are "x"
`define NCU_ASI_COREAVAIL		16'h0000
`define NCU_ASI_CORE_ENABLE_STATUS	16'h0010
`define NCU_ASI_CORE_ENABLE		16'h0020
`define NCU_ASI_XIR_STEERING		16'h0030
`define NCU_ASI_CORE_RUNNINGRW		16'h0050
`define NCU_ASI_CORE_RUNNING_STATUS	16'h0058
`define NCU_ASI_CORE_RUNNING_W1S	16'h0060
`define NCU_ASI_CORE_RUNNING_W1C	16'h0068
`define NCU_ASI_INTVECDISP		16'h0000
`define NCU_ASI_ERR_STR                 16'h1000
`define NCU_ASI_WMR_VEC_MASK            16'h0018
`define NCU_ASI_CMP_TICK_ENABLE		16'h0038


//// UCB packet type ////
`define UCB_READ_NACK	4'b0000    // ack/nack types
`define UCB_READ_ACK	4'b0001
`define UCB_WRITE_ACK	4'b0010
`define UCB_IFILL_ACK	4'b0011
`define UCB_IFILL_NACK	4'b0111

`define UCB_READ_REQ	4'b0100    // req types
`define UCB_WRITE_REQ	4'b0101
`define UCB_IFILL_REQ	4'b0110

`define UCB_INT		4'b1000    // plain interrupt
`define UCB_INT_VEC	4'b1100    // interrupt with vector
`define UCB_INT_SOC_UE	4'b1001    // soc interrup ue
`define UCB_INT_SOC_CE  4'b1010    // soc interrup ce
`define UCB_RESET_VEC	4'b0101    // reset with vector
`define UCB_IDLE_VEC	4'b1110    // idle with vector
`define UCB_RESUME_VEC	4'b1111    // resume with vector

`define UCB_INT_SOC 	4'b1101    // soc interrup ce


//// PCX packet type ////
`define	PCX_LOAD_RQ	5'b00000
`define	PCX_IMISS_RQ	5'b10000
`define	PCX_STORE_RQ	5'b00001
`define PCX_FWD_RQs	5'b01101
`define PCX_FWD_RPYs	5'b01110

//// CPX packet type ////
//`define CPX_LOAD_RET	4'b0000
`define CPX_LOAD_RET	4'b1000
`define CPX_ST_ACK	4'b0100
//`define CPX_IFILL_RET	4'b0001
`define CPX_IFILL_RET	4'b1001
`define CPX_INT_RET	4'b0111
`define CPX_INT_SOC	4'b1101
//`define CPX_FWD_RQ_RET	4'b1010
//`define CPX_FWD_RPY_RET	4'b1011




//// Global CSR decode ////
`define NCU_CSR		8'h80
`define NIU_CSR		8'h81
//`define RNG_CSR		8'h82
`define DBG1_CSR               8'h86
`define CCU_CSR		8'h83
`define MCU_CSR		8'h84
`define TCU_CSR		8'h85
`define DMU_CSR		8'h88
`define RCU_CSR		8'h89
`define NCU_ASI		8'h90
			/////8'h91 ~ 9F reserved
			/////8'hA0 ~ BF L2 CSR////
`define DMU_PIO		4'hC   // C0 ~ CF
			/////8'hB0 ~ FE reserved
`define SSI_CSR		8'hFF


//// NCU_SSI ////
`define SSI_ADDR 	 	12'hFF_F
`define SSI_ADDR_TIMEOUT_REG	40'hFF_0001_0088
`define SSI_ADDR_LOG_REG	40'hFF_0000_0018

`define IF_IDLE 2'b00
`define IF_ACPT 2'b01
`define IF_DROP 2'b10

`define SSI_IDLE     3'b000
`define	SSI_REQ      3'b001
`define	SSI_WDATA    3'b011
`define	SSI_REQ_PAR  3'b101
`define	SSI_ACK      3'b111
`define	SSI_RDATA    3'b110
`define	SSI_ACK_PAR  3'b010










module ncu_i2csc_ctl (
  iol2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_dbr_gateoff, 
  sii_mondo_vld, 
  sii_mondo_target, 
  sii_mondo_ctagerr, 
  sii_mondo_rd, 
  ncu_dmu_mondo_ack, 
  ncu_dmu_mondo_nack, 
  ssi_int_vld, 
  mcu0_int_vld, 
  mcu1_int_vld, 
  mcu2_int_vld, 
  mcu3_int_vld, 
  niu_int_vld, 
  ncu_man_int_vld, 
  ssi_int_rd, 
  mcu0_int_rd, 
  mcu1_int_rd, 
  mcu2_int_rd, 
  mcu3_int_rd, 
  niu_int_rd, 
  ncu_man_int_rd, 
  siipio_ack_vld, 
  dmucsr_ack_vld, 
  ccu_ack_vld, 
  mcu0_ack_vld, 
  mcu1_ack_vld, 
  mcu2_ack_vld, 
  mcu3_ack_vld, 
  ssi_ack_vld, 
  rcu_ack_vld, 
  dbg1_ack_vld, 
  niu_ack_vld, 
  ncu_man_ack_vld, 
  ncu_int_ack_vld, 
  bounce_ack_vld, 
  rd_nack_vld, 
  siipio_ack_rd, 
  dmucsr_ack_rd, 
  ccu_ack_rd, 
  mcu0_ack_rd, 
  mcu1_ack_rd, 
  mcu2_ack_rd, 
  mcu3_ack_rd, 
  ssi_ack_rd, 
  rcu_ack_rd, 
  dbg1_ack_rd, 
  niu_ack_rd, 
  ncu_man_ack_rd, 
  ncu_int_ack_rd, 
  bounce_ack_rd, 
  rd_nack_rd, 
  iob_tap_packet_vld, 
  tap_iob_busy, 
  int_sel, 
  ack_sel, 
  mondo_srvcd_d1, 
  int_srvcd_d2, 
  ack_srvcd_d1, 
  ucb_ack_packet_d1, 
  iobuf_head_f, 
  iobuf_tail_s, 
  io_mondo_data_wr_s, 
  mondo_busy_vec_f, 
  iobuf_avail, 
  srvc_wr_ack, 
  dmupio_srvc_wack, 
  lhs_intman_acc, 
  intman_pchkf2i2c, 
  intman_dout_v, 
  mb0_waddr, 
  mb0_iobuf_wr_en, 
  mb0_run, 
  iobuf_wr, 
  iobuf_tail_ptr) ;
wire avail_mondo_vec;
wire [6:0] avail_int_vec;
wire [14:0] avail_ack_vec;
wire snap_now;
wire mondo_vld;
wire int_vld;
wire ack_vld;
wire snapd_mondo_vec_next;
wire mondo_srvcd;
wire snapd_mondo_vec;
wire snapd_mondo_vec_ff_scanin;
wire snapd_mondo_vec_ff_scanout;
wire l1clk;
wire iobuf_hit_hwm;
wire mondo_srvcd_d1_ff_scanin;
wire mondo_srvcd_d1_ff_scanout;
wire [6:0] srvcd_int_vec;
wire [6:0] snapd_int_vec;
wire [6:0] snapd_int_vec_next;
wire int_srvcd;
wire snapd_int_vec_ff_scanin;
wire snapd_int_vec_ff_scanout;
wire int_srvcd_d1_ff_scanin;
wire int_srvcd_d1_ff_scanout;
wire int_srvcd_d1;
wire int_srvcd_d2_ff_scanin;
wire int_srvcd_d2_ff_scanout;
wire [14:0] srvcd_ack_vec;
wire [14:0] snapd_ack_vec;
wire [14:0] snapd_ack_vec_next;
wire ack_srvcd;
wire snapd_ack_vec_ff_scanin;
wire snapd_ack_vec_ff_scanout;
wire ack_to_tap_d1;
wire ack_srvcd_d1_ff_scanin;
wire ack_srvcd_d1_ff_scanout;
wire ack_to_cpx_d1;
wire io_mondo_data_wr_s_ff_scanin;
wire io_mondo_data_wr_s_ff_scanout;
wire mondo_busy;
wire mondo_busy_vec_ff_scanin;
wire mondo_busy_vec_ff_scanout;
wire [63:0] mondo_busy_vec;
wire mondo_flu_hit;
wire mondo_busy_d1_ff_scanin;
wire mondo_busy_d1_ff_scanout;
wire mondo_busy_d1;
wire ncu_dmu_mondo_ack_a1;
wire ncu_dmu_mondo_nack_a1;
wire ncu_dmu_mondo_ack_f;
wire ncu_dmu_mondo_ack_ff_scanin;
wire ncu_dmu_mondo_ack_ff_scanout;
wire ncu_dmu_mondo_nack_f;
wire ncu_dmu_mondo_nack_ff_scanin;
wire ncu_dmu_mondo_nack_ff_scanout;
wire mondo_flu_vld;
wire mondo_flu_vld_d1;
wire [5:0] mondo_target_prev;
wire mondo_flu_vld_pre_ff_scanin;
wire mondo_flu_vld_pre_ff_scanout;
wire mondo_flu_vld_pre;
wire mondo_flu_vld_d1_ff_scanin;
wire mondo_flu_vld_d1_ff_scanout;
wire mondo_flu_vld_ff_scanin;
wire mondo_flu_vld_ff_scanout;
wire mondo_target_prev_ff_scanin;
wire mondo_target_prev_ff_scanout;
wire int_srvcd_mask;
wire iobuf_wr_f;
wire [5:0] iobuf_tail_plus;
wire [5:0] iobuf_tail;
wire iobuf_tail_ff_scanin;
wire iobuf_tail_ff_scanout;
wire iobuf_tail_s_ff_scanin;
wire iobuf_tail_s_ff_scanout;
wire iobuf_head_ff_scanin;
wire iobuf_head_ff_scanout;
wire [5:0] iobuf_head;
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;



////////////////////////////////////////////////////////////////////////
// Signal declarations
////////////////////////////////////////////////////////////////////////


   // Global interface
input		iol2clk;
input		scan_in;
output		scan_out;
input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_scan_en;
input		tcu_aclk;
input		tcu_bclk;
input		tcu_dbr_gateoff;

//mondo input
input		sii_mondo_vld;
input [5:0]	sii_mondo_target;
input		sii_mondo_ctagerr;
output		sii_mondo_rd;

output		ncu_dmu_mondo_ack;
output		ncu_dmu_mondo_nack;

//int vld//
input		ssi_int_vld;
input		mcu0_int_vld;
input		mcu1_int_vld;
input		mcu2_int_vld;
input		mcu3_int_vld;
input		niu_int_vld;
input		ncu_man_int_vld;

output		ssi_int_rd;       
output		mcu0_int_rd;     
output		mcu1_int_rd;
output		mcu2_int_rd;
output		mcu3_int_rd;
output		niu_int_rd;       
output		ncu_man_int_rd;

//ack vld//
input		siipio_ack_vld;
input		dmucsr_ack_vld;
input		ccu_ack_vld;
input		mcu0_ack_vld;
input		mcu1_ack_vld;
input		mcu2_ack_vld;
input		mcu3_ack_vld;
input		ssi_ack_vld;
input		rcu_ack_vld;
input		dbg1_ack_vld;
input		niu_ack_vld;
input		ncu_man_ack_vld;
input		ncu_int_ack_vld;
input		bounce_ack_vld;
input		rd_nack_vld;

output		siipio_ack_rd;
output		dmucsr_ack_rd;
output		ccu_ack_rd;
output		mcu0_ack_rd;
output		mcu1_ack_rd;
output		mcu2_ack_rd;
output		mcu3_ack_rd;
output		ssi_ack_rd;
output		rcu_ack_rd;
output		dbg1_ack_rd;
output		niu_ack_rd;
output		ncu_man_ack_rd;
output		ncu_int_ack_rd;
output		bounce_ack_rd;
output		rd_nack_rd;

// TAP ucb interface
output		iob_tap_packet_vld;
input		tap_iob_busy;

		       
//i2c slow datapath interface   
output [6:0]	int_sel;
output [14:0]	ack_sel;
output		mondo_srvcd_d1;
output		int_srvcd_d2;
output		ack_srvcd_d1;

input [127:0]	ucb_ack_packet_d1;

//i2c fast control interface
input [5:0]	iobuf_head_f;
output [5:0]	iobuf_tail_s;

//mondo
//c2i fast control interface   
//Mondo data/busy table interface
//Interrupt status table interface
output		io_mondo_data_wr_s;
input [63:0]	mondo_busy_vec_f;

//c2i slow control interface
output		iobuf_avail;
input		srvc_wr_ack;
input		dmupio_srvc_wack;

//IOB control interface
input		lhs_intman_acc;
input		intman_pchkf2i2c;
input		intman_dout_v;


//mb0 signals//
input [5:0]	mb0_waddr;
input 		mb0_iobuf_wr_en;
input		mb0_run;


 // IO buffer interface
output		iobuf_wr;
output [4:0]	iobuf_tail_ptr;


   // Internal signals


reg [6:0]	int_sel;  // 0in bits_on -var int_sel -max 1

reg [14:0]	ack_sel; // 0in bits_on -var ack_sel -max 1






////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
   /************************************************************
    * Assemble availibility vectors
    ************************************************************/

assign	avail_mondo_vec = sii_mondo_vld;

assign	avail_int_vec[6:0] = {	ssi_int_vld,	//[6]
				mcu0_int_vld,	//[5]
				mcu1_int_vld,	//[4]
				mcu2_int_vld,	//[3]
				mcu3_int_vld,	//[2]
				niu_int_vld,	//[1]
				ncu_man_int_vld } ;//[0]

assign	avail_ack_vec[14:0] = { siipio_ack_vld,//[14]
				dmucsr_ack_vld,	//[13]
				ccu_ack_vld,	//[12]
				mcu0_ack_vld,	//[11]
				mcu1_ack_vld,	//[10]
				mcu2_ack_vld,	//[9]
				mcu3_ack_vld,	//[8]
				ssi_ack_vld,	//[7]
				rcu_ack_vld,	//[6]
				dbg1_ack_vld,	//[5]
				niu_ack_vld,	//[4]
				ncu_man_ack_vld,//[3]
				ncu_int_ack_vld,//[2]
				bounce_ack_vld,	//[1]
				rd_nack_vld };	//[0]


   /************************************************************
    * Handle mondo interrupts here
    ************************************************************/
   // Snap the availibility vector if all previous interrupts and acks
   // have been serviced.
   // jimmy : need to ignore ack_vld during tap_iob_busy because can't
   // jimmy :  serve ack_vld during tap_iob_busy, but int is okay to serve
//assign	snap_now = ~mondo_vld & ~int_vld & (~ack_vld|tap_iob_busy) ;
assign	snap_now = ~mondo_vld & ~int_vld & (~ack_vld) ;

assign	snapd_mondo_vec_next = snap_now ? avail_mondo_vec  :
		            mondo_srvcd ? 1'b0 : snapd_mondo_vec;

ncu_i2cscd_ctl_msff_ctl_macro__width_1 snapd_mondo_vec_ff 
				(
				.scan_in(snapd_mondo_vec_ff_scanin),
				.scan_out(snapd_mondo_vec_ff_scanout),
				.dout		(snapd_mondo_vec),
				.l1clk		(l1clk),
				.din		(snapd_mondo_vec_next),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	mondo_vld = snapd_mondo_vec;

   // Mondo is serviced only if the IO buffer is not full and
   // CPU is not accessing the Mondo tables
assign	mondo_srvcd = mondo_vld & ~iobuf_hit_hwm;

ncu_i2cscd_ctl_msff_ctl_macro__width_1 mondo_srvcd_d1_ff 
				(
				.scan_in(mondo_srvcd_d1_ff_scanin),
				.scan_out(mondo_srvcd_d1_ff_scanout),
				.dout		(mondo_srvcd_d1),
				.l1clk		(l1clk),
				.din		(mondo_srvcd),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	sii_mondo_rd = mondo_srvcd;


   /************************************************************
    * Handle on-chip interrupts here
    ************************************************************/
// 0in req_ack -req snapd_int_vec -ack int_sel -req_until_ack -deassert 0
assign 	 srvcd_int_vec[6:0] = snapd_int_vec[6:0] & ~int_sel[6:0];
	 
assign 	 snapd_int_vec_next[6:0] = snap_now  ? avail_int_vec[6:0] :
		                   int_srvcd ? srvcd_int_vec[6:0] : snapd_int_vec[6:0];

ncu_i2cscd_ctl_msff_ctl_macro__width_7 snapd_int_vec_ff 
				(
				.scan_in(snapd_int_vec_ff_scanin),
				.scan_out(snapd_int_vec_ff_scanout),
				.dout		(snapd_int_vec[6:0]),
				.l1clk		(l1clk),
				.din		(snapd_int_vec_next[6:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	 int_vld = |snapd_int_vec[6:0];

always@(snapd_int_vec) begin
    int_sel[6:0]=7'b0;
    casex(snapd_int_vec[6:0]) // 0in case -parallel -full
    7'b1xx_xxxx : int_sel[6:0] = 7'b100_0000;
    7'b01x_xxxx : int_sel[6:0] = 7'b010_0000;
    7'b001_xxxx : int_sel[6:0] = 7'b001_0000;
    7'b000_1xxx : int_sel[6:0] = 7'b000_1000;
    7'b000_01xx : int_sel[6:0] = 7'b000_0100;
    7'b000_001x : int_sel[6:0] = 7'b000_0010;
    7'b000_0001 : int_sel[6:0] = 7'b000_0001;
        default : int_sel[6:0] = 7'b000_0000;
    endcase
end

   // Int is serviced only if no mondo is serviced and the IO buffer is not full and
   // CPU is not accessing the Interrupt Management table
assign	int_srvcd = int_vld & ~mondo_vld & ~iobuf_hit_hwm & ~lhs_intman_acc ;
			     //~cpu_intman_acc & ~cpu_intctrl_acc;

ncu_i2cscd_ctl_msff_ctl_macro__width_1 int_srvcd_d1_ff 
				(
				.scan_in(int_srvcd_d1_ff_scanin),
				.scan_out(int_srvcd_d1_ff_scanout),
				.dout		(int_srvcd_d1),
				.l1clk		(l1clk),
				.din		(int_srvcd),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_i2cscd_ctl_msff_ctl_macro__width_1 int_srvcd_d2_ff 
				(
				.scan_in(int_srvcd_d2_ff_scanin),
				.scan_out(int_srvcd_d2_ff_scanout),
				.dout		(int_srvcd_d2),
				.l1clk		(l1clk),
				.din		(int_srvcd_d1),
  .siclk(siclk),
  .soclk(soclk)
				);

   // Generate read singals to the double buffer
assign 	 ssi_int_rd       = int_srvcd & int_sel[6];
assign 	 mcu0_int_rd      = int_srvcd & int_sel[5];
assign 	 mcu1_int_rd      = int_srvcd & int_sel[4];
assign 	 mcu2_int_rd      = int_srvcd & int_sel[3];
assign 	 mcu3_int_rd      = int_srvcd & int_sel[2];
assign 	 niu_int_rd       = int_srvcd & int_sel[1];
assign 	 ncu_man_int_rd   = int_srvcd & int_sel[0];


   /************************************************************
    * Handle acks here
    ************************************************************/
// 0in req_ack -req snapd_ack_vec -ack ack_sel -req_until_ack -deassert 0
assign 	 srvcd_ack_vec[14:0] = snapd_ack_vec[14:0] & ~ack_sel[14:0];
	 
assign 	 snapd_ack_vec_next[14:0] = snap_now  ? avail_ack_vec[14:0] :
		                    ack_srvcd ? srvcd_ack_vec[14:0] : snapd_ack_vec[14:0];

ncu_i2cscd_ctl_msff_ctl_macro__width_15 snapd_ack_vec_ff 
				(
				.scan_in(snapd_ack_vec_ff_scanin),
				.scan_out(snapd_ack_vec_ff_scanout),
				.dout		(snapd_ack_vec[14:0]),
				.l1clk		(l1clk),
				.din		(snapd_ack_vec_next[14:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	 ack_vld = |snapd_ack_vec[14:0];

always@(snapd_ack_vec) begin
    casex(snapd_ack_vec[14:0]) // 0in case -parallel -full
    15'b1xx_xxxx_xxxx_xxxx : ack_sel[14:0] = 15'b100_0000_0000_0000 ;
    15'b01x_xxxx_xxxx_xxxx : ack_sel[14:0] = 15'b010_0000_0000_0000 ;
    15'b001_xxxx_xxxx_xxxx : ack_sel[14:0] = 15'b001_0000_0000_0000 ;
    15'b000_1xxx_xxxx_xxxx : ack_sel[14:0] = 15'b000_1000_0000_0000 ;
    15'b000_01xx_xxxx_xxxx : ack_sel[14:0] = 15'b000_0100_0000_0000 ;
    15'b000_001x_xxxx_xxxx : ack_sel[14:0] = 15'b000_0010_0000_0000 ;
    15'b000_0001_xxxx_xxxx : ack_sel[14:0] = 15'b000_0001_0000_0000 ;
    15'b000_0000_1xxx_xxxx : ack_sel[14:0] = 15'b000_0000_1000_0000 ;
    15'b000_0000_01xx_xxxx : ack_sel[14:0] = 15'b000_0000_0100_0000 ;
    15'b000_0000_001x_xxxx : ack_sel[14:0] = 15'b000_0000_0010_0000 ;
    15'b000_0000_0001_xxxx : ack_sel[14:0] = 15'b000_0000_0001_0000 ;
    15'b000_0000_0000_1xxx : ack_sel[14:0] = 15'b000_0000_0000_1000 ;
    15'b000_0000_0000_01xx : ack_sel[14:0] = 15'b000_0000_0000_0100 ;
    15'b000_0000_0000_001x : ack_sel[14:0] = 15'b000_0000_0000_0010 ;
    15'b000_0000_0000_0001 : ack_sel[14:0] = 15'b000_0000_0000_0001 ;
                   default : ack_sel[14:0] = 15'b000_0000_0000_0000 ;
    endcase
end


   // Ack is serviced only if no mondo or interrupt is serviced and the
   // IO buffer/TAP buffer is not full.
assign	ack_srvcd = ack_vld & ~mondo_vld & ~int_vld & ~iobuf_hit_hwm & ~int_srvcd_d1 &
			     ~tap_iob_busy & ~(ack_srvcd_d1 & ack_to_tap_d1);

ncu_i2cscd_ctl_msff_ctl_macro__width_1 ack_srvcd_d1_ff 
				(
				.scan_in(ack_srvcd_d1_ff_scanin),
				.scan_out(ack_srvcd_d1_ff_scanout),
				.dout		(ack_srvcd_d1),
				.l1clk		(l1clk),
				.din		(ack_srvcd),
  .siclk(siclk),
  .soclk(soclk)
				);

// Generate read singals to the double buffer
assign	siipio_ack_rd	= ack_srvcd & ack_sel[14];
assign	dmucsr_ack_rd	= ack_srvcd & ack_sel[13];
assign	ccu_ack_rd	= ack_srvcd & ack_sel[12];
assign	mcu0_ack_rd 	= ack_srvcd & ack_sel[11];
assign	mcu1_ack_rd 	= ack_srvcd & ack_sel[10];
assign	mcu2_ack_rd 	= ack_srvcd & ack_sel[9];
assign	mcu3_ack_rd 	= ack_srvcd & ack_sel[8];
assign	ssi_ack_rd 	= ack_srvcd & ack_sel[7];
assign	rcu_ack_rd 	= ack_srvcd & ack_sel[6];
assign	dbg1_ack_rd 	= ack_srvcd & ack_sel[5];
assign	niu_ack_rd 	= ack_srvcd & ack_sel[4];
assign	ncu_man_ack_rd 	= ack_srvcd & ack_sel[3];
assign	ncu_int_ack_rd 	= ack_srvcd & ack_sel[2];
assign	bounce_ack_rd 	= ack_srvcd & ack_sel[1];
assign	rd_nack_rd 	= ack_srvcd & ack_sel[0];


// Determine destination of req/ack

assign 	 ack_to_cpx_d1 =
	((((ucb_ack_packet_d1[3:0] == `UCB_READ_NACK) | (ucb_ack_packet_d1[3:0] == `UCB_READ_ACK) |
	   (ucb_ack_packet_d1[3:0] == `UCB_IFILL_NACK) | (ucb_ack_packet_d1[3:0] == `UCB_IFILL_ACK)) &
	  (ucb_ack_packet_d1[11:10] == 2'b00)) ) ;


assign 	 ack_to_tap_d1 =
		 ((((ucb_ack_packet_d1[3:0] == `UCB_READ_NACK) | 
		    (ucb_ack_packet_d1[3:0] == `UCB_READ_ACK) | 
		    (ucb_ack_packet_d1[3:0] == `UCB_WRITE_ACK) |
	    	    (ucb_ack_packet_d1[3:0] == `UCB_IFILL_ACK) |
	    	    (ucb_ack_packet_d1[3:0] == `UCB_IFILL_NACK) ) &
		   (ucb_ack_packet_d1[11:10] == 2'b01)) | //buffer id check
		  (((ucb_ack_packet_d1[3:0] == `UCB_READ_REQ) |
		    (ucb_ack_packet_d1[3:0] == `UCB_WRITE_REQ)) &
		   (ucb_ack_packet_d1[54:47] == `TCU_CSR)));

//assign	iob_tap_vec_in[15:0] = (ucb_ack_packet_d1[3:0] == `UCB_READ_NACK) ? 16'h00ff : 16'hffff ;

/************************************************************
 * Write mondo data table and busy table
 ************************************************************/
ncu_i2cscd_ctl_msff_ctl_macro__width_1 io_mondo_data_wr_s_ff 
				(
				.scan_in(io_mondo_data_wr_s_ff_scanin),
				.scan_out(io_mondo_data_wr_s_ff_scanout),
				.dout		(io_mondo_data_wr_s),
				.l1clk		(l1clk),
				.din		(mondo_srvcd & ~mondo_busy),
  .siclk(siclk),
  .soclk(soclk)
				);

// Busy vector from Mondo Busy Table
ncu_i2cscd_ctl_msff_ctl_macro__width_64 mondo_busy_vec_ff 
				(
				.scan_in(mondo_busy_vec_ff_scanin),
				.scan_out(mondo_busy_vec_ff_scanout),
				.dout		(mondo_busy_vec[63:0]),
				.l1clk		(l1clk),
				.din		(mondo_busy_vec_f[63:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	 mondo_busy = (|(mondo_busy_vec[63:0]&(64'h0000_0000_0000_0001<<sii_mondo_target[5:0]))) | mondo_flu_hit;

ncu_i2cscd_ctl_msff_ctl_macro__width_1 mondo_busy_d1_ff 
				(
				.scan_in(mondo_busy_d1_ff_scanin),
				.scan_out(mondo_busy_d1_ff_scanout),
				.dout		(mondo_busy_d1),
				.l1clk		(l1clk),
				.din		(mondo_busy),
  .siclk(siclk),
  .soclk(soclk)
				);

// Send ack/nack to dmu
assign 	 ncu_dmu_mondo_ack_a1 = mondo_srvcd & ~mondo_busy & ~sii_mondo_ctagerr;
assign 	 ncu_dmu_mondo_nack_a1 = mondo_srvcd & mondo_busy & ~sii_mondo_ctagerr;

assign ncu_dmu_mondo_ack = ncu_dmu_mondo_ack_f & tcu_dbr_gateoff;
ncu_i2cscd_ctl_msff_ctl_macro__width_1 ncu_dmu_mondo_ack_ff 
				(
				.scan_in(ncu_dmu_mondo_ack_ff_scanin),
				.scan_out(ncu_dmu_mondo_ack_ff_scanout),
				.dout		(ncu_dmu_mondo_ack_f),
				.l1clk		(l1clk),
				.din		(ncu_dmu_mondo_ack_a1),
  .siclk(siclk),
  .soclk(soclk)
				);

assign ncu_dmu_mondo_nack = ncu_dmu_mondo_nack_f & tcu_dbr_gateoff;
ncu_i2cscd_ctl_msff_ctl_macro__width_1 ncu_dmu_mondo_nack_ff 
				(
				.scan_in(ncu_dmu_mondo_nack_ff_scanin),
				.scan_out(ncu_dmu_mondo_nack_ff_scanout),
				.dout		(ncu_dmu_mondo_nack_f),
				.l1clk		(l1clk),
				.din		(ncu_dmu_mondo_nack_a1),
  .siclk(siclk),
  .soclk(soclk)
				);


// do fast lookup only in the 2nd cycle after each mondo ack to see
// if the last ack is for the same cputhr_id. no need to do fast
// lookup if the last mondo was a nack.
assign   mondo_flu_hit = (mondo_flu_vld | mondo_flu_vld_d1) & (sii_mondo_target[5:0]==mondo_target_prev[5:0]) ;
ncu_i2cscd_ctl_msff_ctl_macro__width_1 mondo_flu_vld_pre_ff 
				(
				.scan_in(mondo_flu_vld_pre_ff_scanin),
				.scan_out(mondo_flu_vld_pre_ff_scanout),
				.dout		(mondo_flu_vld_pre),
				.l1clk		(l1clk),
				.din		(ncu_dmu_mondo_ack_a1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cscd_ctl_msff_ctl_macro__width_1 mondo_flu_vld_d1_ff 
				(
				.scan_in(mondo_flu_vld_d1_ff_scanin),
				.scan_out(mondo_flu_vld_d1_ff_scanout),
				.dout		(mondo_flu_vld_d1),
				.l1clk		(l1clk),
				.din		(mondo_flu_vld),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_i2cscd_ctl_msff_ctl_macro__width_1 mondo_flu_vld_ff 
				(
				.scan_in(mondo_flu_vld_ff_scanin),
				.scan_out(mondo_flu_vld_ff_scanout),
				.dout		(mondo_flu_vld),
				.l1clk		(l1clk),
				.din		(mondo_flu_vld_pre),
  .siclk(siclk),
  .soclk(soclk)
				);
ncu_i2cscd_ctl_msff_ctl_macro__en_1__width_6 mondo_target_prev_ff  
				(
				.scan_in(mondo_target_prev_ff_scanin),
				.scan_out(mondo_target_prev_ff_scanout),
				.dout		(mondo_target_prev[5:0]),
				.l1clk		(l1clk),
				.en		(mondo_srvcd),
				.din		(sii_mondo_target[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

/************************************************************
 * Let c2i logic know that the IO buffer is ready to accept
 * a write ack.
 ************************************************************/
assign	iobuf_avail = ~iobuf_hit_hwm & ~mondo_srvcd_d1 & ~int_srvcd_d2 & ~ack_srvcd_d1;

/************************************************************
 * Send transaction to IO buffer
 ************************************************************/
assign  int_srvcd_mask = intman_pchkf2i2c & intman_dout_v;
assign	iobuf_wr_f = 	(mondo_srvcd_d1 & ~mondo_busy_d1) |
			(int_srvcd_d2&~int_srvcd_mask) |
			(ack_srvcd_d1 & ack_to_cpx_d1) |
			srvc_wr_ack|dmupio_srvc_wack ;
assign iobuf_wr = mb0_run ? mb0_iobuf_wr_en : iobuf_wr_f;

assign	iobuf_tail_plus[5:0] = iobuf_tail[5:0] + 6'd1;
// Tail pointer to io buffer
ncu_i2cscd_ctl_msff_ctl_macro__en_1__width_6 iobuf_tail_ff  
				(
				.scan_in(iobuf_tail_ff_scanin),
				.scan_out(iobuf_tail_ff_scanout),
				.dout		(iobuf_tail[5:0]),
				.l1clk		(l1clk),
				.en		(iobuf_wr_f),
				.din		(iobuf_tail_plus[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// Have to flop tail one more time before sending to cpu clock domain
// to guarantee content has been written to memory
ncu_i2cscd_ctl_msff_ctl_macro__width_6 iobuf_tail_s_ff 
				(
				.scan_in(iobuf_tail_s_ff_scanin),
				.scan_out(iobuf_tail_s_ff_scanout),
				.dout		(iobuf_tail_s[5:0]),
				.l1clk		(l1clk),
				.din		(iobuf_tail[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	iobuf_tail_ptr[4:0] = mb0_run ? mb0_waddr[4:0] : iobuf_tail[4:0];


// Flop head pointer once to convert to bsc clock domain
ncu_i2cscd_ctl_msff_ctl_macro__width_6 iobuf_head_ff 
				(
				.scan_in(iobuf_head_ff_scanin),
				.scan_out(iobuf_head_ff_scanout),
				.dout		(iobuf_head[5:0]),
				.l1clk		(l1clk),
				.din		(iobuf_head_f[5:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// Determine if the io buffer is full
assign	iobuf_hit_hwm = ((iobuf_tail_plus[5] != iobuf_head[5]) &
			(iobuf_tail_plus[4:0] >= iobuf_head[4:0])) |
			((iobuf_tail_plus[5] == iobuf_head[5]) &
			(iobuf_tail_plus[4:0] <= iobuf_head[4:0]));


/************************************************************
 * Send transaction to TAP
 ************************************************************/
assign	iob_tap_packet_vld = ack_srvcd_d1 & ack_to_tap_d1;


/**** adding clock header ****/
ncu_i2cscd_ctl_l1clkhdr_ctl_macro clkgen (
				.l2clk	(iol2clk),
				.l1en	(1'b1),
				.l1clk	(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
				);

/*** building tcu port ***/
assign	siclk = tcu_aclk;
assign	soclk = tcu_bclk;
assign	   se = tcu_scan_en;
assign	pce_ov = tcu_pce_ov;
assign	stop = tcu_clk_stop;

// fixscan start:
assign snapd_mondo_vec_ff_scanin = scan_in                  ;
assign mondo_srvcd_d1_ff_scanin  = snapd_mondo_vec_ff_scanout;
assign snapd_int_vec_ff_scanin   = mondo_srvcd_d1_ff_scanout;
assign int_srvcd_d1_ff_scanin    = snapd_int_vec_ff_scanout ;
assign int_srvcd_d2_ff_scanin    = int_srvcd_d1_ff_scanout  ;
assign snapd_ack_vec_ff_scanin   = int_srvcd_d2_ff_scanout  ;
assign ack_srvcd_d1_ff_scanin    = snapd_ack_vec_ff_scanout ;
assign io_mondo_data_wr_s_ff_scanin = ack_srvcd_d1_ff_scanout  ;
assign mondo_busy_vec_ff_scanin  = io_mondo_data_wr_s_ff_scanout;
assign mondo_busy_d1_ff_scanin   = mondo_busy_vec_ff_scanout;
assign ncu_dmu_mondo_ack_ff_scanin = mondo_busy_d1_ff_scanout ;
assign ncu_dmu_mondo_nack_ff_scanin = ncu_dmu_mondo_ack_ff_scanout;
assign mondo_flu_vld_pre_ff_scanin = ncu_dmu_mondo_nack_ff_scanout;
assign mondo_flu_vld_ff_scanin   = mondo_flu_vld_pre_ff_scanout;
assign mondo_flu_vld_d1_ff_scanin = mondo_flu_vld_ff_scanout ;
assign mondo_target_prev_ff_scanin = mondo_flu_vld_d1_ff_scanout ;
assign iobuf_tail_ff_scanin      = mondo_target_prev_ff_scanout;
assign iobuf_tail_s_ff_scanin    = iobuf_tail_ff_scanout    ;
assign iobuf_head_ff_scanin      = iobuf_tail_s_ff_scanout  ;
assign scan_out                  = iobuf_head_ff_scanout    ;
// fixscan end:
endmodule // i2c_sctrl
			       

// Local Variables:
// verilog-auto-sense-defines-constant:t
// End:






// any PARAMS parms go into naming of macro

module ncu_i2cscd_ctl_msff_ctl_macro__width_1 (
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

module ncu_i2cscd_ctl_msff_ctl_macro__width_7 (
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

module ncu_i2cscd_ctl_msff_ctl_macro__width_15 (
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













// any PARAMS parms go into naming of macro

module ncu_i2cscd_ctl_msff_ctl_macro__width_64 (
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

module ncu_i2cscd_ctl_msff_ctl_macro__en_1__width_6 (
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

module ncu_i2cscd_ctl_msff_ctl_macro__width_6 (
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

module ncu_i2cscd_ctl_l1clkhdr_ctl_macro (
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

module ncu_i2cscd_ctl_msff_ctl_macro__width_4 (
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

module ncu_i2cscd_ctl_msff_ctl_macro__width_128 (
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




//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module ncu_i2cscd_ctl_spare_ctl_macro__num_11 (
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

module ncu_i2cscd_ctl_msff_ctl_macro__en_1__width_128 (
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

module ncu_i2cscd_ctl_msff_ctl_macro__en_1__width_1 (
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

module ncu_i2cscd_ctl_msff_ctl_macro__width_16 (
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

module ncu_i2cscd_ctl_msff_ctl_macro__width_32 (
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

module ncu_i2cscd_ctl_msff_ctl_macro__width_2 (
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

module ncu_i2cscd_ctl_msff_ctl_macro__en_1__width_32 (
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

module ncu_i2cscd_ctl_msff_ctl_macro__en_1__width_16 (
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

module ncu_i2cscd_ctl_msff_ctl_macro__en_1__width_64 (
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

module ncu_i2cscd_ctl_msff_ctl_macro__en_1__width_140 (
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

module ncu_i2cscd_ctl_msff_ctl_macro__en_1__width_4 (
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

module ncu_i2cscd_ctl_msff_ctl_macro__en_1__width_25 (
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


