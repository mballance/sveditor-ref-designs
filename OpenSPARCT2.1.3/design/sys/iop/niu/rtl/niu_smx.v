// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx.v
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
`timescale 1ns/1ns
`include "niu_smx_define.h"

module niu_smx(

  // VPERL: &PORTLIST;
  // VPERL: GENERATED_BEG
  niu_clk,
  iol2clk,
  niu_reset_l,
  niu_sii_hdr_vld,
  niu_sii_reqbypass,
  niu_sii_datareq,
  niu_sii_data,
  niu_sii_parity,
  sii_niu_oqdq,
  sii_niu_bqdq,
  sio_niu_hdr_vld,
  sio_niu_datareq,
  sio_niu_data,
  sio_niu_parity,
  niu_sio_dq,
  dmc_meta0_req,
  dmc_meta0_req_cmd,
  dmc_meta0_req_address,
  dmc_meta0_req_length,
  dmc_meta0_req_transID,
  dmc_meta0_req_port_num,
  dmc_meta0_req_dma_num,
  dmc_meta0_req_client,
  meta_dmc0_req_accept,
  meta_dmc0_req_errors,
  meta_dmc0_data_req,
  dmc_meta0_data_valid,
  dmc_meta0_data,
  dmc_meta0_req_byteenable,
  dmc_meta0_status,
  dmc_meta0_transfer_complete,
  dmc_meta1_req,
  dmc_meta1_req_cmd,
  dmc_meta1_req_address,
  dmc_meta1_req_length,
  dmc_meta1_req_transID,
  dmc_meta1_req_port_num,
  dmc_meta1_req_dma_num,
  dmc_meta1_req_client,
  meta_dmc1_req_accept,
  meta_dmc1_req_errors,
  meta_dmc_resp_ready,
  meta_dmc_resp_cmd,
  meta_dmc_resp_cmd_status,
  meta_dmc_resp_address,
  meta_dmc_resp_length,
  meta_dmc_resp_transID,
  meta_dmc_resp_port_num,
  meta_dmc_resp_dma_num,
  
  meta_dmc_resp_client_txc,  // cc
  meta_dmc_resp_client_tdmc, // cc
  meta_dmc_resp_client_rdmc, // cc

  meta_dmc_data_valid_txc,   // cc
  meta_dmc_data_valid_tdmc,  // cc
  meta_dmc_data_valid_rdmc,  // cc

  meta_dmc_resp_complete_txc,  // 1 cc
  meta_dmc_resp_complete_tdmc, // 2 cc
  meta_dmc_resp_complete_rdmc, // 5 cc

  meta_dmc_resp_transfer_cmpl_txc,  // cc
  meta_dmc_resp_transfer_cmpl_tdmc, // cc
  meta_dmc_resp_transfer_cmpl_rdmc, // cc

  meta_dmc_ack_client_tdmc,     // 2 cc
  meta_dmc_ack_client_rdmc,     // 4 cc

  rdmc_meta_resp_accept,
  txc_meta_resp_accept,
  tdmc_meta_resp_accept,

  meta_dmc_data,
  meta_dmc_resp_byteenable,
  meta_dmc_data_status,

  // meta_dmc_resp_client,
  // meta_dmc_data_valid, 
  // meta_dmc_resp_complete,
  // meta_dmc_ack_client,

  meta_dmc_resp_transfer_cmpl,

  meta_dmc_ack_ready,
  meta_dmc_ack_cmd,
  meta_dmc_ack_cmd_status,
  meta_dmc_ack_dma_num,
  meta_dmc_ack_transID,
  meta_dmc_ack_complete,
  meta_dmc_ack_transfer_cmpl,
  rdmc_meta_ack_accept,
  tdmc_meta_ack_accept,
  ncu_niu_ctag_uei,
  ncu_niu_ctag_cei,
  ncu_niu_d_pei,
  niu_ncu_ctag_ue,
  niu_ncu_ctag_ce,
  niu_ncu_d_pe,
  tcu_aclk,
  tcu_bclk,
  tcu_se_scancollar_in,
  tcu_array_wr_inhibit,
  tcu_mbist_user_mode,
  tds_smx_mbist_scan_in,
  tcu_tds_smx_mbist_start,
  tcu_mbist_bisi_en,
  tds_smx_tcu_mbist_fail,
  tds_smx_tcu_mbist_done,
  tds_smx_mbist_scan_out,
  pio_smx_cfg_data,
  smx_pio_intr,
  smx_pio_status,
  pio_smx_clear_intr,
  pio_smx_ctrl,
  pio_smx_debug_vector,
  dbg1_niu_stall,
  dbg1_niu_resume,
  niu_dbg1_stall_ack,
  smx_debug_port 
  // VPERL: GENERATED_END

);
input 		niu_clk;
input           iol2clk;
input 		niu_reset_l;

	// sii interface (req)
output         	niu_sii_hdr_vld;
output         	niu_sii_reqbypass;
output         	niu_sii_datareq;
output [127:0] 	niu_sii_data;
output [7:0]   	niu_sii_parity;

input 		sii_niu_oqdq;
input 		sii_niu_bqdq;

	// sio if (resp)	
input          	sio_niu_hdr_vld;
input          	sio_niu_datareq;
input [127:0]  	sio_niu_data;
input [7:0]    	sio_niu_parity;
output 		niu_sio_dq;

	// dmc wr req cmd if
input 		dmc_meta0_req;
input [7:0] 	dmc_meta0_req_cmd;
input [63:0] 	dmc_meta0_req_address;
input [13:0] 	dmc_meta0_req_length;
input [5:0] 	dmc_meta0_req_transID;
input [1:0] 	dmc_meta0_req_port_num;
input [4:0] 	dmc_meta0_req_dma_num;
input [7:0] 	dmc_meta0_req_client;
output 		meta_dmc0_req_accept;
output 		meta_dmc0_req_errors;  // ??? TBD

	// dmc wr req data if
output 		meta_dmc0_data_req;
input 		dmc_meta0_data_valid;
input [127:0] 	dmc_meta0_data;
input [15:0] 	dmc_meta0_req_byteenable;
input [3:0] 	dmc_meta0_status;
input 		dmc_meta0_transfer_complete;

	// dmc rd cmd if
input 		dmc_meta1_req;
input [7:0] 	dmc_meta1_req_cmd;
input [63:0] 	dmc_meta1_req_address;
input [13:0] 	dmc_meta1_req_length;
input [5:0] 	dmc_meta1_req_transID;
input [1:0] 	dmc_meta1_req_port_num;
input [4:0] 	dmc_meta1_req_dma_num;
input [7:0] 	dmc_meta1_req_client;
output 		meta_dmc1_req_accept;
output 		meta_dmc1_req_errors;  // ??? TBD

	// dmc resp cmd if
output 		meta_dmc_resp_ready;
output [7:0] 	meta_dmc_resp_cmd;
output [3:0] 	meta_dmc_resp_cmd_status;
output [63:0] 	meta_dmc_resp_address;
output [13:0] 	meta_dmc_resp_length;
output [5:0] 	meta_dmc_resp_transID;
output [1:0] 	meta_dmc_resp_port_num;
output [4:0] 	meta_dmc_resp_dma_num;

// output [7:0] 	meta_dmc_resp_client;   // cc 
output          meta_dmc_resp_client_txc;
output          meta_dmc_resp_client_tdmc;
output          meta_dmc_resp_client_rdmc;


input 	rdmc_meta_resp_accept;
input 	txc_meta_resp_accept;
input 	tdmc_meta_resp_accept;

// wire [7:0] 	dmc_meta_resp_accept;

	// dmc resp data if
// output [7:0] 	meta_dmc_data_valid;  // cc
output          meta_dmc_data_valid_txc;
output          meta_dmc_data_valid_tdmc;
output          meta_dmc_data_valid_rdmc;

output [127:0] 	meta_dmc_data;
output [15:0] 	meta_dmc_resp_byteenable;
output [3:0] 	meta_dmc_data_status; // <- chg

// output [7:0] 	meta_dmc_resp_complete;  // cc
output          meta_dmc_resp_complete_txc;  // 1
output          meta_dmc_resp_complete_tdmc; // 2
output          meta_dmc_resp_complete_rdmc; // 5

output [7:0] 	meta_dmc_resp_transfer_cmpl; // chg cc
output          meta_dmc_resp_transfer_cmpl_txc;
output          meta_dmc_resp_transfer_cmpl_tdmc;
output          meta_dmc_resp_transfer_cmpl_rdmc;


output           meta_dmc_ack_ready;           // Resp Command Request  <--- all ack??
output   [7:0]   meta_dmc_ack_cmd;             // Command Request
output   [3:0]   meta_dmc_ack_cmd_status;      // Command Request
output   [4:0]   meta_dmc_ack_dma_num;         // Channel Number
output   [5:0]   meta_dmc_ack_transID;         // Transaction ID

// output   [7:0]   meta_dmc_ack_client;       // bitwise client  cc
output           meta_dmc_ack_client_tdmc;     // 2
output           meta_dmc_ack_client_rdmc;     // 4

output           meta_dmc_ack_complete;        // tdmc is the only client 
output   [7:0]   meta_dmc_ack_transfer_cmpl;   // Last trans of TransID

input  rdmc_meta_ack_accept;          // bitwise client accept
input  tdmc_meta_ack_accept;          // bitwise client accept

// wire  [7:0]   dmc_meta_ack_accept;          // bitwise client accept


input           ncu_niu_ctag_uei;
input           ncu_niu_ctag_cei;
input           ncu_niu_d_pei;

output          niu_ncu_ctag_ue;
output          niu_ncu_ctag_ce;
output          niu_ncu_d_pe;

// mbist if

input                   tcu_aclk;
input                   tcu_bclk;
input                   tcu_se_scancollar_in;
input                   tcu_array_wr_inhibit;
input	                tcu_mbist_user_mode;

input			tds_smx_mbist_scan_in;
input			tcu_tds_smx_mbist_start;
input			tcu_mbist_bisi_en;

output			tds_smx_tcu_mbist_fail;
output			tds_smx_tcu_mbist_done;
output			tds_smx_mbist_scan_out;


// pio if
input [31:0] 	pio_smx_cfg_data;  // static
output      	smx_pio_intr;   // level signal;
                                // once high stays high until clear by pio
output[31:0]    smx_pio_status;   // status info related to intr
input		pio_smx_clear_intr;  // a pulse          

input [31:0]    pio_smx_ctrl;
input [31:0]    pio_smx_debug_vector;

// n2 debug if
input		dbg1_niu_stall;
input		dbg1_niu_resume;
output		niu_dbg1_stall_ack;

// niu debug port
output  [31:0]   smx_debug_port;


wire    [7:0]   niu_mb0_wdata;
// wire    [5:0]   niu_mb0_addr;
wire            niu_mb0_smx_table_wr_en;
wire            niu_mb0_smx_table_rd_en;
wire            niu_mb0_run;

wire            niu_mb0_smx_store_wr_en;
wire            niu_mb0_smx_store_rd_en;

wire [145:0]	niu_mb0_smx_store_data_out;
wire [145:0]	niu_mb0_smx_table_data_out;


// meta interface not used by clients
// wire     [63:0]  meta_dmc_ack_address;         // Memory Address
// wire   	 [13:0]  meta_dmc_ack_length;          // Packet Length
// wire   	 [1:0]   meta_dmc_ack_port_num;        // Port Number
wire      meta_dmc_ack_complete;        // bitwise client


// VPERL: PERL_BEG
// &WIRES;
// &INSTANCE ("./niu_smx_rdreq_dmc.v", "rdreq_dmc");
// &INSTANCE ("./niu_smx_wreq_dmc.v", "wreq_dmc");
// &INSTANCE ("./niu_smx_req_sii.v", "req_sii");
// &INSTANCE ("./niu_smx_resp_sio.v", "resp_sio");
// &INSTANCE ("./niu_smx_resp_dmc.v", "resp_dmc");
// &INSTANCE ("./niu_smx_req_ff.v", "req_ff");
// &INSTANCE ("./niu_smx_resp_ff.v", "resp_ff");
// &INSTANCE ("./niu_smx_xtb.v", "xtb");
// &INSTANCE ("./niu_smx_status.v", "flag_status");
// &INSTANCE ("./niu_smx_timer.v", "timer");
// &INSTANCE ("./niu_smx_timeout_hdlr.v", "timeout_hdlr");
// &INSTANCE ("./niu_smx_stall_hdlr.v", "stall_hdlr");
// &INSTANCE ("./niu_smx_pio.v", "pio");
// &INSTANCE ("/vobs/neptune/design/niu/niu_mb0/rtl/niu_mb0.v niu_mb0", "niu_mb0");

// &CONNECT  ("resp_dmc.dmc_meta_resp_accept", "{1'b0, 1'b0, rdmc_meta_resp_accept, \
//				 	 1'b0, 1'b0, tdmc_meta_resp_accept, \
//					txc_meta_resp_accept, 1'b0}"); 
// &CONNECT  ("resp_dmc.dmc_meta_ack_accept", "{1'b0, 1'b0, 1'b0, rdmc_meta_ack_accept, \
//			 		1'b0, tdmc_meta_ack_accept, 1'b0, 1'b0}"); 
//
// &CONNECT  ("flag_status.resp_rcv_rd", "1'b0"); 
// &CONNECT  ("flag_status.resp_rcv_rdata",""); 
// &CONNECT  ("flag_status.resp_rcv_raddr","{6{1'b0}}"); 
// &CONNECT  ("flag_status.timeout_rd", "1'b0"); 
// &CONNECT  ("flag_status.timeout_rdata",""); 
// &CONNECT  ("flag_status.timeout_raddr","{6{1'b0}}"); 
// &CONNECT  ("flag_status.tid_newarr_rd", "1'b0"); 
// &CONNECT  ("flag_status.tid_newarr_rdata",""); 
// &CONNECT  ("flag_status.tid_newarr_raddr","{6{1'b0}}"); 

// &CONNECT  ("resp_ff.niu_mb0_smx_store_32x146_wdata","niu_mb0_wdata[7:0]"); 
// &CONNECT  ("resp_ff.niu_mb0_smx_store_32x146_rd_addr","niu_mb0_addr[4:0]"); 
// &CONNECT  ("resp_ff.niu_mb0_smx_store_32x146_wr_addr","niu_mb0_addr[4:0]"); 
// &CONNECT  ("resp_ff.niu_mb0_smx_store_32x146_wr_en","niu_mb0_smx_store_wr_en"); 
// &CONNECT  ("resp_ff.niu_mb0_smx_store_32x146_rd_en","niu_mb0_smx_store_rd_en"); 

// &CONNECT  ("xtb.niu_mb0_smx_table_64x146_wdata","niu_mb0_wdata[7:0]"); 
// &CONNECT  ("xtb.niu_mb0_smx_table_64x146_rd_addr","niu_mb0_addr[5:0]"); 
// &CONNECT  ("xtb.niu_mb0_smx_table_64x146_wr_addr","niu_mb0_addr[5:0]"); 
// &CONNECT  ("xtb.niu_mb0_smx_table_64x146_wr_en","niu_mb0_smx_table_wr_en"); 
// &CONNECT  ("xtb.niu_mb0_smx_table_64x146_rd_en","niu_mb0_smx_table_rd_en"); 

// &CONNECT ("niu_mb0.mb0_scan_in", "tds_smx_mbist_scan_in");
// &CONNECT ("niu_mb0.mb0_scan_out", "tds_smx_mbist_scan_out");
// &CONNECT ("niu_mb0.tcu_niu_mbist_start_0", "tcu_tds_smx_mbist_start");
// &CONNECT ("niu_mb0.niu_tcu_mbist_done_0", "tds_smx_tcu_mbist_done");
// &CONNECT ("niu_mb0.niu_tcu_mbist_fail_0", "tds_smx_tcu_mbist_fail");
// &CONNECT ("niu_mb0.l1clk", "niu_clk");
// &CONNECT ("niu_mb0.rst_l", "niu_reset_l");
// &CONNECT ("niu_mb0.tcu_mbist_user_mode", "tcu_mbist_user_mode");
// &CONNECT ("rdreq_dmc.clk", "niu_clk");
// &CONNECT ("wreq_dmc.clk", "niu_clk");
// &CONNECT ("req_sii.clk", "niu_clk");
// &CONNECT ("resp_sio.clk", "niu_clk");
// &CONNECT ("resp_dmc.clk", "niu_clk");
// &CONNECT ("req_ff.clk", "niu_clk");
// &CONNECT ("resp_ff.clk", "niu_clk");
// &CONNECT ("xtb.clk", "niu_clk");
// &CONNECT ("flag_status.clk", "niu_clk");
// &CONNECT ("timer.clk", "niu_clk");
// &CONNECT ("timeout_hdlr.clk", "niu_clk");
// &CONNECT ("stall_hdlr.clk", "niu_clk");
// &CONNECT ("pio.clk", "niu_clk");
// &CONNECT ("rdreq_dmc.reset_l", "niu_reset_l");
// &CONNECT ("wreq_dmc.reset_l", "niu_reset_l");
// &CONNECT ("req_sii.reset_l", "niu_reset_l");
// &CONNECT ("resp_sio.reset_l", "niu_reset_l");
// &CONNECT ("resp_dmc.reset_l", "niu_reset_l");
// &CONNECT ("req_ff.reset_l", "niu_reset_l");
// &CONNECT ("resp_ff.reset_l", "niu_reset_l");
// &CONNECT ("xtb.reset_l", "niu_reset_l");
// &CONNECT ("flag_status.reset_l", "niu_reset_l");
// &CONNECT ("timer.reset_l", "niu_reset_l");
// &CONNECT ("timeout_hdlr.reset_l", "niu_reset_l");
// &CONNECT ("stall_hdlr.reset_l", "niu_reset_l");
// &CONNECT ("pio.reset_l", "niu_reset_l");

// # ??? need to bring this out when pio avail???
//# &CONNECT  ("pio.pio_ld", "1'b0"); 
// &CONNECT  ("pio.pio_data", "pio_smx_cfg_data"); 
// VPERL: PERL_END
// VPERL: GENERATED_BEG

wire	[65:0]	rdreq_cmdff_rdata;
wire	[65:0]	rdreq_cmdff_wdata;
wire	[127:0]	rdreq_xtb_wdata;
wire	[31:0]	reg_timer_cfg;
wire	[21:0]	resp_cmdff_rdata;
wire	[21:0]	resp_cmdff_wdata;
wire	[143:0]	resp_dataff_rdata;
wire	[143:0]	resp_dataff_wdata;
wire	[63:0]	resp_rcv_rdata_bus;
wire	[63:0]	tid_newarr_rdata_bus;
wire	[63:0]	tid_valid_rdata_bus;
wire	[63:0]	tid_dirty_rdata_bus;
wire	[63:0]	timeout_rdata_bus;
wire	[63:0]	tohdl_cmdl_addr;
wire	[118:0]	tohdl_xtb_rdata;
wire	[65:0]	wreq_cmdff_rdata;
wire	[65:0]	wreq_cmdff_wdata;
wire	[127:0]	wreq_dataff_rdata;
wire	[127:0]	wreq_dataff_wdata;
wire	[127:0]	wreq_xtb_wdata;
wire	[128:0]	xtb_rdata;
wire	[1:0]	arb_cs;
wire	[2:0]	cmdl_cs;
wire		cmdl_tohdl_ack;
wire	[2:0]	dreq_cs;
wire	[2:0]	dv_cs;
wire	[5:0]	niu_mb0_addr;
wire		niu_mb0_smx_store_scan_out; // vlint
wire		niu_mb0_smx_table_scan_out; // vlint
wire	[2:0]	pio_resp_err_inject_cfg;
wire	[2:0]	pio_xtb_err_inject_cfg;
wire	[1:0]	proc_cs;
wire	[2:0]	rdreq_cmd_cs;
wire		rdreq_cmdff_empty;
wire		rdreq_cmdff_full;
wire		rdreq_cmdff_rd;
wire		rdreq_cmdff_wr;
wire		rdreq_cmdreq_idle;
wire		rdreq_rst_xtb_wr;
wire	[5:0]	rdreq_xtb_waddr;
wire		rdreq_xtb_wr;
wire	[1:0]	reg_ras_cfg;
wire		resp_cmdff_empty;
wire		resp_cmdff_full;
wire		resp_cmdff_rd;
wire		resp_cmdff_wr;
wire		resp_dataff_empty;
wire		resp_dataff_full;
wire		resp_dataff_rd;
wire		resp_dataff_wr;
wire		resp_rcv_rst;
wire	[5:0]	resp_rcv_rst_addr;
wire		resp_rcv_set;
wire	[5:0]	resp_rcv_set_addr;
wire	[1:0]	sii_cs;
wire		siireq_idle;
wire		smx_nc_err;
wire		stall_enable;
wire		tid_newarr_rst;
wire	[5:0]	tid_newarr_rst_addr;
wire		tid_newarr_set;
wire	[5:0]	tid_newarr_set_addr;
wire	[5:0]	tid_valid_raddr;
wire		tid_valid_rd;
wire		tid_valid_rdata;
wire		tid_valid_rst0;
wire		tid_valid_rst1;
wire	[5:0]	tid_valid_rst_addr0;
wire	[5:0]	tid_valid_rst_addr1;
wire		tid_valid_set;
wire	[5:0]	tid_valid_set_addr;
wire		timeout_rst;
wire	[5:0]	timeout_rst_addr;
wire		timeout_set;
wire	[5:0]	timeout_set_addr;
wire	[7:0]	tohdl_cmdl_client;
wire	[7:0]	tohdl_cmdl_cmd;
wire	[4:0]	tohdl_cmdl_dma;
wire	[13:0]	tohdl_cmdl_len;
wire	[1:0]	tohdl_cmdl_port;
wire		tohdl_cmdl_req;
wire	[5:0]	tohdl_cmdl_xid;
wire	[5:0]	tohdl_intr_status;
wire		tohdl_set_intr;
wire	[5:0]	tohdl_xtb_raddr;
wire		tohdl_xtb_rd;
wire		tohdl_xtb_rd_ack;
wire		tohdl_xtb_rdata_err;
wire	[2:0]	wreq_cmd_cs;
wire		wreq_cmdff_empty;
wire		wreq_cmdff_full;
wire		wreq_cmdff_rd;
wire		wreq_cmdff_wr;
wire		wreq_cmdreq_idle;
wire		wreq_dataff_empty;
wire		wreq_dataff_full;
wire		wreq_dataff_rd;
wire		wreq_dataff_wr;
wire	[1:0]	wreq_dv_cs;
wire		wreq_pcmd_ff_empty;
wire		wreq_pcmd_ff_full;
wire		wreq_pcmd_ff_rd;
wire	[3:0]	wreq_pcmd_ff_rdata;
wire	[3:0]	wreq_pcmd_ff_wdata;
wire		wreq_pcmd_ff_wr;
wire		wreq_rst_xtb_wr;
wire	[5:0]	wreq_xtb_waddr;
wire		wreq_xtb_wr;
wire	[5:0]	xtb_raddr;
wire		xtb_rcvfile_update;
wire	[5:0]	xtb_rcvfile_update_addr;
wire		xtb_rd;
wire		xtb_rd_ack;
wire		xtb_rdata_err;
wire  [63:0]	tid_xmited_rdata_bus;
wire  [5:0]	tid_xmited_set_addr;
wire            tid_xmited_set;

wire            wire_zero;

wire    [7:0]   meta_dmc_resp_client;
wire    [7:0]   meta_dmc_data_valid;
wire    [7:0]   meta_dmc_resp_complete;
wire    [7:0]   meta_dmc_resp_transfer_cmpl;
wire    [7:0]   meta_dmc_ack_client;

assign meta_dmc_resp_client_txc  = meta_dmc_resp_client[1];
assign meta_dmc_resp_client_tdmc = meta_dmc_resp_client[2];
assign meta_dmc_resp_client_rdmc = meta_dmc_resp_client[5];

assign meta_dmc_data_valid_txc   = meta_dmc_data_valid[1];
assign meta_dmc_data_valid_tdmc  = meta_dmc_data_valid[2];
assign meta_dmc_data_valid_rdmc  = meta_dmc_data_valid[5];

assign meta_dmc_resp_complete_txc  =  meta_dmc_resp_complete[1];
assign meta_dmc_resp_complete_tdmc =  meta_dmc_resp_complete[2];
assign meta_dmc_resp_complete_rdmc =  meta_dmc_resp_complete[5];

assign meta_dmc_resp_transfer_cmpl_txc  =  meta_dmc_resp_transfer_cmpl[1];
assign meta_dmc_resp_transfer_cmpl_tdmc =  meta_dmc_resp_transfer_cmpl[2];
assign meta_dmc_resp_transfer_cmpl_rdmc =  meta_dmc_resp_transfer_cmpl[5];

assign meta_dmc_ack_client_tdmc = meta_dmc_ack_client[2];
assign meta_dmc_ack_client_rdmc = meta_dmc_ack_client[4] | (wire_zero & 1'b0) ;

assign wire_zero = (&meta_dmc_resp_client[7:0])        & (1'b0) &
	           (&meta_dmc_data_valid[7:0])         & (1'b0) &
                   (&meta_dmc_resp_complete[7:0])      & (1'b0) &
	           (&meta_dmc_ack_client[7:0])         & (1'b0);

niu_smx_rdreq_dmc rdreq_dmc (
    .clk                    (niu_clk),
    .reset_l                (niu_reset_l),
    .dmc_meta1_req          (dmc_meta1_req),
    .dmc_meta1_req_cmd      (dmc_meta1_req_cmd[7:0]),
    .dmc_meta1_req_address  (dmc_meta1_req_address[63:0]),
    .dmc_meta1_req_length   (dmc_meta1_req_length[13:0]),
    .dmc_meta1_req_transID  (dmc_meta1_req_transID[5:0]),
    .dmc_meta1_req_port_num (dmc_meta1_req_port_num[1:0]),
    .dmc_meta1_req_dma_num  (dmc_meta1_req_dma_num[4:0]),
    .dmc_meta1_req_client   (dmc_meta1_req_client[7:0]),
    .meta_dmc1_req_accept   (meta_dmc1_req_accept),
    .rdreq_cmdff_wr         (rdreq_cmdff_wr),
    .rdreq_cmdff_wdata      (rdreq_cmdff_wdata[65:0]),
    .rdreq_cmdff_full       (rdreq_cmdff_full),
    .rdreq_xtb_wr           (rdreq_xtb_wr),
    .rdreq_xtb_waddr        (rdreq_xtb_waddr[5:0]),
    .rdreq_xtb_wdata        (rdreq_xtb_wdata[127:0]),
    .rdreq_rst_xtb_wr       (rdreq_rst_xtb_wr),
    .stall_enable           (stall_enable),
    .rdreq_cmdreq_idle      (rdreq_cmdreq_idle),
    .rdreq_cmd_cs           (rdreq_cmd_cs[2:0]),
    .tid_valid_rdata_bus    (tid_valid_rdata_bus[63:0])
    );

niu_smx_wreq_dmc wreq_dmc (
    .clk                         (niu_clk),
    .reset_l                     (niu_reset_l),
    .dmc_meta0_req               (dmc_meta0_req),
    .dmc_meta0_req_cmd           (dmc_meta0_req_cmd[7:0]),
    .dmc_meta0_req_address       (dmc_meta0_req_address[63:0]),
    .dmc_meta0_req_length        (dmc_meta0_req_length[13:0]),
    .dmc_meta0_req_transID       (dmc_meta0_req_transID[5:0]),
    .dmc_meta0_req_port_num      (dmc_meta0_req_port_num[1:0]),
    .dmc_meta0_req_dma_num       (dmc_meta0_req_dma_num[4:0]),
    .dmc_meta0_req_client        (dmc_meta0_req_client[7:0]),
    .meta_dmc0_req_accept        (meta_dmc0_req_accept),
    .meta_dmc0_data_req          (meta_dmc0_data_req),
    .dmc_meta0_data_valid        (dmc_meta0_data_valid),
    .dmc_meta0_data              (dmc_meta0_data[127:0]),
    .dmc_meta0_req_byteenable    (dmc_meta0_req_byteenable[15:0]),
    .dmc_meta0_status            (dmc_meta0_status[3:0]),
    .dmc_meta0_transfer_complete (dmc_meta0_transfer_complete),
    .wreq_cmdff_wr               (wreq_cmdff_wr),
    .wreq_cmdff_wdata            (wreq_cmdff_wdata[65:0]),
    .wreq_cmdff_full             (wreq_cmdff_full),
    .wreq_dataff_wr              (wreq_dataff_wr),
    .wreq_dataff_wdata           (wreq_dataff_wdata[127:0]),
    .wreq_dataff_full            (wreq_dataff_full),
    .wreq_pcmd_ff_wr             (wreq_pcmd_ff_wr),
    .wreq_pcmd_ff_wdata          (wreq_pcmd_ff_wdata[3:0]),
    .wreq_pcmd_ff_full           (wreq_pcmd_ff_full),
    .wreq_xtb_wr                 (wreq_xtb_wr),
    .wreq_xtb_waddr              (wreq_xtb_waddr[5:0]),
    .wreq_xtb_wdata              (wreq_xtb_wdata[127:0]),
    .wreq_rst_xtb_wr             (wreq_rst_xtb_wr),
    .stall_enable                (stall_enable),
    .wreq_cmdreq_idle            (wreq_cmdreq_idle),
    .wreq_cmd_cs                 (wreq_cmd_cs[2:0]),
    .dreq_cs                     (dreq_cs[2:0]),
    .wreq_dv_cs                  (wreq_dv_cs[1:0])
    );

niu_smx_req_sii req_sii (
    .clk                (niu_clk),
    .reset_l            (niu_reset_l),
    .niu_sii_hdr_vld    (niu_sii_hdr_vld),
    .niu_sii_reqbypass  (niu_sii_reqbypass),
    .niu_sii_datareq    (niu_sii_datareq),
    .niu_sii_data       (niu_sii_data[127:0]),
    .niu_sii_parity     (niu_sii_parity[7:0]),
    .sii_niu_oqdq       (sii_niu_oqdq),
    .sii_niu_bqdq       (sii_niu_bqdq),
    .wreq_cmdff_rd      (wreq_cmdff_rd),
    .wreq_cmdff_rdata   (wreq_cmdff_rdata[65:0]),
    .wreq_cmdff_empty   (wreq_cmdff_empty),
    .wreq_pcmd_ff_rd    (wreq_pcmd_ff_rd),
    .wreq_pcmd_ff_rdata (wreq_pcmd_ff_rdata[3:0]),
    .wreq_pcmd_ff_empty (wreq_pcmd_ff_empty),
    .rdreq_cmdff_rd     (rdreq_cmdff_rd),
    .rdreq_cmdff_rdata  (rdreq_cmdff_rdata[65:0]),
    .rdreq_cmdff_empty  (rdreq_cmdff_empty),
    .wreq_dataff_rd     (wreq_dataff_rd),
    .wreq_dataff_rdata  (wreq_dataff_rdata[127:0]),
    .wreq_dataff_empty  (wreq_dataff_empty),
    .siireq_idle        (siireq_idle),
    .sii_cs             (sii_cs[1:0]),
    .arb_cs             (arb_cs[1:0]),
    .tid_valid_rdata_bus (tid_valid_rdata_bus[63:0]),
    .tid_xmited_set     (tid_xmited_set),     
    .tid_xmited_set_addr  (tid_xmited_set_addr[5:0]) 
    );

niu_smx_resp_sio resp_sio (
    .clk               (niu_clk),
    .reset_l           (niu_reset_l),
    .sio_niu_hdr_vld   (sio_niu_hdr_vld),
    .sio_niu_datareq   (sio_niu_datareq),
    .sio_niu_data      (sio_niu_data[127:0]),
    .sio_niu_parity    (sio_niu_parity[7:0]),
    .resp_cmdff_wr     (resp_cmdff_wr),
    .resp_cmdff_wdata  (resp_cmdff_wdata[21:0]),
    .resp_cmdff_full   (resp_cmdff_full),
    .resp_dataff_wr    (resp_dataff_wr),
    .resp_dataff_wdata (resp_dataff_wdata[143:0]),
    .resp_dataff_full  (resp_dataff_full),
    .ncu_niu_ctag_uei  (ncu_niu_ctag_uei),
    .ncu_niu_ctag_cei  (ncu_niu_ctag_cei),
    .ncu_niu_d_pei     (ncu_niu_d_pei),
    .niu_ncu_ctag_ue   (niu_ncu_ctag_ue),
    .niu_ncu_ctag_ce   (niu_ncu_ctag_ce),
    .niu_ncu_d_pe      (niu_ncu_d_pe),
    .reg_ras_cfg       (reg_ras_cfg[1:0])
    );

niu_smx_resp_dmc resp_dmc (
    .clk                         (niu_clk),
    .reset_l                     (niu_reset_l),
    .meta_dmc_resp_ready         (meta_dmc_resp_ready),
    .meta_dmc_resp_cmd           (meta_dmc_resp_cmd[7:0]),
    .meta_dmc_resp_cmd_status    (meta_dmc_resp_cmd_status[3:0]),
    .meta_dmc_resp_address       (meta_dmc_resp_address[63:0]),
    .meta_dmc_resp_length        (meta_dmc_resp_length[13:0]),
    .meta_dmc_resp_transID       (meta_dmc_resp_transID[5:0]),
    .meta_dmc_resp_port_num      (meta_dmc_resp_port_num[1:0]),
    .meta_dmc_resp_dma_num       (meta_dmc_resp_dma_num[4:0]),
    .meta_dmc_resp_client        (meta_dmc_resp_client[7:0]),
    .dmc_meta_resp_accept        ({1'b0, 1'b0, rdmc_meta_resp_accept, 
				 	 1'b0, 1'b0, tdmc_meta_resp_accept, 
					txc_meta_resp_accept, 1'b0}),
    .meta_dmc_data_valid         (meta_dmc_data_valid[7:0]),
    .meta_dmc_data               (meta_dmc_data[127:0]),
    .meta_dmc_resp_byteenable    (meta_dmc_resp_byteenable[15:0]),
    .meta_dmc_data_status        (meta_dmc_data_status[3:0]),
    .meta_dmc_resp_complete      (meta_dmc_resp_complete[7:0]),
    .meta_dmc_resp_transfer_cmpl (meta_dmc_resp_transfer_cmpl[7:0]),
    .meta_dmc_ack_ready          (meta_dmc_ack_ready),
    .meta_dmc_ack_cmd            (meta_dmc_ack_cmd[7:0]),
    .meta_dmc_ack_cmd_status     (meta_dmc_ack_cmd_status[3:0]),
    .meta_dmc_ack_transID        (meta_dmc_ack_transID[5:0]),
    .meta_dmc_ack_dma_num        (meta_dmc_ack_dma_num[4:0]),
    .meta_dmc_ack_client         (meta_dmc_ack_client[7:0]),
    .dmc_meta_ack_accept         ({1'b0, 1'b0, 1'b0, rdmc_meta_ack_accept, 
			 		1'b0, tdmc_meta_ack_accept, 1'b0, 1'b0}),
    .meta_dmc_ack_complete       (meta_dmc_ack_complete),
    .meta_dmc_ack_transfer_cmpl  (meta_dmc_ack_transfer_cmpl[7:0]),
    .niu_sio_dq                  (niu_sio_dq),
    .xtb_rd                      (xtb_rd),
    .xtb_raddr                   (xtb_raddr[5:0]),
    .xtb_rdata                   (xtb_rdata[128:0]),
    .xtb_rd_ack                  (xtb_rd_ack),
    .xtb_rdata_err               (xtb_rdata_err),
    .xtb_rcvfile_update          (xtb_rcvfile_update),
    .xtb_rcvfile_update_addr     (xtb_rcvfile_update_addr[5:0]),
    .resp_cmdff_empty            (resp_cmdff_empty),
    .resp_cmdff_rdata            (resp_cmdff_rdata[21:0]),
    .resp_cmdff_rd               (resp_cmdff_rd),
    .resp_dataff_empty           (resp_dataff_empty),
    .resp_dataff_rdata           (resp_dataff_rdata[143:0]),
    .resp_dataff_rd              (resp_dataff_rd),
    .tid_valid_rst0              (tid_valid_rst0),
    .tid_valid_rst_addr0         (tid_valid_rst_addr0[5:0]),
    .tid_valid_rd                (tid_valid_rd),
    .tid_valid_raddr             (tid_valid_raddr[5:0]),
    .tid_valid_rdata             (tid_valid_rdata),
    .resp_rcv_set                (resp_rcv_set),
    .resp_rcv_set_addr           (resp_rcv_set_addr[5:0]),
    .tohdl_cmdl_req              (tohdl_cmdl_req),
    .tohdl_cmdl_cmd              (tohdl_cmdl_cmd[7:0]),
    .tohdl_cmdl_addr             (tohdl_cmdl_addr[63:0]),
    .tohdl_cmdl_len              (tohdl_cmdl_len[13:0]),
    .tohdl_cmdl_xid              (tohdl_cmdl_xid[5:0]),
    .tohdl_cmdl_port             (tohdl_cmdl_port[1:0]),
    .tohdl_cmdl_dma              (tohdl_cmdl_dma[4:0]),
    .tohdl_cmdl_client           (tohdl_cmdl_client[7:0]),
    .cmdl_tohdl_ack              (cmdl_tohdl_ack),
    .pio_resp_err_inject_cfg     (pio_resp_err_inject_cfg[2:0]),
    .cmdl_cs                     (cmdl_cs[2:0]),
    .dv_cs                       (dv_cs[2:0]),
    .proc_cs                     (proc_cs[1:0]),
    .tid_dirty_rdata_bus	 (tid_dirty_rdata_bus[63:0])
    );

niu_smx_req_ff req_ff (
    .clk                (niu_clk),
    .reset_l            (niu_reset_l),
    .rdreq_cmdff_wr     (rdreq_cmdff_wr),
    .rdreq_cmdff_wdata  (rdreq_cmdff_wdata[65:0]),
    .rdreq_cmdff_full   (rdreq_cmdff_full),
    .rdreq_cmdff_rd     (rdreq_cmdff_rd),
    .rdreq_cmdff_rdata  (rdreq_cmdff_rdata[65:0]),
    .rdreq_cmdff_empty  (rdreq_cmdff_empty),
    .wreq_cmdff_wr      (wreq_cmdff_wr),
    .wreq_cmdff_wdata   (wreq_cmdff_wdata[65:0]),
    .wreq_cmdff_full    (wreq_cmdff_full),
    .wreq_cmdff_rd      (wreq_cmdff_rd),
    .wreq_cmdff_rdata   (wreq_cmdff_rdata[65:0]),
    .wreq_cmdff_empty   (wreq_cmdff_empty),
    .wreq_dataff_wr     (wreq_dataff_wr),
    .wreq_dataff_wdata  (wreq_dataff_wdata[127:0]),
    .wreq_dataff_full   (wreq_dataff_full),
    .wreq_dataff_rd     (wreq_dataff_rd),
    .wreq_dataff_rdata  (wreq_dataff_rdata[127:0]),
    .wreq_dataff_empty  (wreq_dataff_empty),
    .wreq_pcmd_ff_wr    (wreq_pcmd_ff_wr),
    .wreq_pcmd_ff_wdata (wreq_pcmd_ff_wdata[3:0]),
    .wreq_pcmd_ff_full  (wreq_pcmd_ff_full),
    .wreq_pcmd_ff_rd    (wreq_pcmd_ff_rd),
    .wreq_pcmd_ff_rdata (wreq_pcmd_ff_rdata[3:0]),
    .wreq_pcmd_ff_empty (wreq_pcmd_ff_empty)
    );

niu_smx_resp_ff resp_ff (
    .clk                              (niu_clk),
    .iol2clk                          (iol2clk),
    .reset_l                          (niu_reset_l),
    .resp_cmdff_wr                    (resp_cmdff_wr),
    .resp_cmdff_wdata                 (resp_cmdff_wdata[21:0]),
    .resp_cmdff_full                  (resp_cmdff_full),
    .resp_cmdff_rd                    (resp_cmdff_rd),
    .resp_cmdff_rdata                 (resp_cmdff_rdata[21:0]),
    .resp_cmdff_empty                 (resp_cmdff_empty),
    .resp_dataff_wr                   (resp_dataff_wr),
    .resp_dataff_wdata                (resp_dataff_wdata[143:0]),
    .resp_dataff_full                 (resp_dataff_full),
    .resp_dataff_rd                   (resp_dataff_rd),
    .resp_dataff_rdata                (resp_dataff_rdata[143:0]),
    .resp_dataff_empty                (resp_dataff_empty),
    .tcu_aclk                         (tcu_aclk),
    .tcu_bclk                         (tcu_bclk),
    .tcu_se_scancollar_in             (tcu_se_scancollar_in),
    .tcu_array_wr_inhibit             (tcu_array_wr_inhibit),
    .mb0_smx_store_32x146_scan_in     (1'b0),
    .mb0_smx_store_32x146_scan_out    (niu_mb0_smx_store_scan_out),
    .niu_mb0_smx_store_32x146_wdata   (niu_mb0_wdata[7:0]),
    .niu_mb0_smx_store_32x146_rd_addr (niu_mb0_addr[4:0]),
    .niu_mb0_smx_store_32x146_wr_addr (niu_mb0_addr[4:0]),
    .niu_mb0_smx_store_32x146_wr_en   (niu_mb0_smx_store_wr_en),
    .niu_mb0_smx_store_32x146_rd_en   (niu_mb0_smx_store_rd_en),
    .niu_mb0_run                      (niu_mb0_run),
    .niu_mb0_smx_store_data_out       (niu_mb0_smx_store_data_out[145:0])
    );

niu_smx_xtb xtb (
    .clk                              (niu_clk),
    .iol2clk                          (iol2clk),
    .reset_l                          (niu_reset_l),
    .rdreq_xtb_wr                     (rdreq_xtb_wr),
    .rdreq_xtb_waddr                  (rdreq_xtb_waddr[5:0]),
    .rdreq_xtb_wdata                  (rdreq_xtb_wdata[127:0]),
    .rdreq_rst_xtb_wr                 (rdreq_rst_xtb_wr),
    .wreq_xtb_wr                      (wreq_xtb_wr),
    .wreq_xtb_waddr                   (wreq_xtb_waddr[5:0]),
    .wreq_xtb_wdata                   (wreq_xtb_wdata[127:0]),
    .wreq_rst_xtb_wr                  (wreq_rst_xtb_wr),
    .xtb_rd                           (xtb_rd),
    .xtb_raddr                        (xtb_raddr[5:0]),
    .xtb_rdata                        (xtb_rdata[128:0]),
    .xtb_rd_ack                       (xtb_rd_ack),
    .xtb_rdata_err                    (xtb_rdata_err),
    .xtb_rcvfile_update               (xtb_rcvfile_update),
    .xtb_rcvfile_update_addr          (xtb_rcvfile_update_addr[5:0]),
    .tid_valid_set                    (tid_valid_set),
    .tid_valid_set_addr               (tid_valid_set_addr[5:0]),
    .tid_newarr_set                   (tid_newarr_set),
    .tid_newarr_set_addr              (tid_newarr_set_addr[5:0]),
    .tohdl_xtb_rd                     (tohdl_xtb_rd),
    .tohdl_xtb_raddr                  (tohdl_xtb_raddr[5:0]),
    .tohdl_xtb_rdata                  (tohdl_xtb_rdata[118:0]),
    .tohdl_xtb_rd_ack                 (tohdl_xtb_rd_ack),
    .tohdl_xtb_rdata_err              (tohdl_xtb_rdata_err),
    .tcu_aclk                         (tcu_aclk),
    .tcu_bclk                         (tcu_bclk),
    .tcu_se_scancollar_in             (tcu_se_scancollar_in),
    .tcu_array_wr_inhibit             (tcu_array_wr_inhibit),
    .mb0_smx_table_64x146_scan_in     (1'b0),
    .mb0_smx_table_64x146_scan_out    (niu_mb0_smx_table_scan_out),
    .niu_mb0_smx_table_64x146_wdata   (niu_mb0_wdata[7:0]),
    .niu_mb0_smx_table_64x146_rd_addr (niu_mb0_addr[5:0]),
    .niu_mb0_smx_table_64x146_wr_addr (niu_mb0_addr[5:0]),
    .niu_mb0_smx_table_64x146_wr_en   (niu_mb0_smx_table_wr_en),
    .niu_mb0_smx_table_64x146_rd_en   (niu_mb0_smx_table_rd_en),
    .niu_mb0_run                      (niu_mb0_run),
    .niu_mb0_smx_table_data_out       (niu_mb0_smx_table_data_out[145:0]),
    .pio_xtb_err_inject_cfg           (pio_xtb_err_inject_cfg[2:0])
    );

niu_smx_status flag_status (
    .clk                  (niu_clk),
    .reset_l              (niu_reset_l),
    .tid_valid_rst0       (tid_valid_rst0),
    .tid_valid_rst1       (tid_valid_rst1),
    .tid_valid_rst_addr0  (tid_valid_rst_addr0[5:0]),
    .tid_valid_rst_addr1  (tid_valid_rst_addr1[5:0]),
    .tid_valid_set        (tid_valid_set),
    .tid_valid_set_addr   (tid_valid_set_addr[5:0]),
    .tid_valid_rd         (tid_valid_rd),
    .tid_valid_raddr      (tid_valid_raddr[5:0]),
    .tid_valid_rdata      (tid_valid_rdata),
    .tid_valid_rdata_bus  (tid_valid_rdata_bus[63:0]),
    .tid_newarr_rst       (tid_newarr_rst),
    .tid_newarr_rst_addr  (tid_newarr_rst_addr[5:0]),
    .tid_newarr_set       (tid_newarr_set),
    .tid_newarr_set_addr  (tid_newarr_set_addr[5:0]),
    .tid_newarr_rd        (1'b0),
    .tid_newarr_raddr     ({6{1'b0}}),
    .tid_newarr_rdata     (),
    .tid_newarr_rdata_bus (tid_newarr_rdata_bus[63:0]),
    .resp_rcv_rst         (resp_rcv_rst),
    .resp_rcv_rst_addr    (resp_rcv_rst_addr[5:0]),
    .resp_rcv_set         (resp_rcv_set),
    .resp_rcv_set_addr    (resp_rcv_set_addr[5:0]),
    .resp_rcv_rd          (1'b0),
    .resp_rcv_raddr       ({6{1'b0}}),
    .resp_rcv_rdata       (),
    .resp_rcv_rdata_bus   (resp_rcv_rdata_bus[63:0]),
    .timeout_set          (timeout_set),
    .timeout_rst          (timeout_rst),
    .timeout_set_addr     (timeout_set_addr[5:0]),
    .timeout_rst_addr     (timeout_rst_addr[5:0]),
    .timeout_rd           (1'b0),
    .timeout_raddr        ({6{1'b0}}),
    .timeout_rdata        (),
    .timeout_rdata_bus    (timeout_rdata_bus[63:0]),
    .tid_xmited_set	  (tid_xmited_set),
    .tid_xmited_set_addr  (tid_xmited_set_addr[5:0]),
    .tid_xmited_rdata_bus (tid_xmited_rdata_bus[63:0]),
    .tid_dirty_rdata_bus  (tid_dirty_rdata_bus[63:0])
    );

niu_smx_timer timer (
    .clk                  (niu_clk),
    .reset_l              (niu_reset_l),
    .reg_timer_cfg        (reg_timer_cfg[31:0]),
    .resp_rcv_rdata_bus   (resp_rcv_rdata_bus[63:0]),
    .resp_rcv_rst         (resp_rcv_rst),
    .resp_rcv_rst_addr    (resp_rcv_rst_addr[5:0]),
    .tid_valid_rdata_bus  (tid_valid_rdata_bus[63:0]),
    .tid_valid_rst1       (tid_valid_rst1),
    .tid_valid_rst_addr1  (tid_valid_rst_addr1[5:0]),
    .tid_newarr_rdata_bus (tid_newarr_rdata_bus[63:0]),
    .tid_newarr_rst       (tid_newarr_rst),
    .tid_newarr_rst_addr  (tid_newarr_rst_addr[5:0]),
    .timeout_set          (timeout_set),
    .timeout_set_addr     (timeout_set_addr[5:0]),
    .tid_xmited_rdata_bus (tid_xmited_rdata_bus[63:0])
    );

niu_smx_timeout_hdlr timeout_hdlr (
    .clk                 (niu_clk),
    .reset_l             (niu_reset_l),
    .timeout_rdata_bus   (timeout_rdata_bus[63:0]),
    .timeout_rst         (timeout_rst),
    .timeout_rst_addr    (timeout_rst_addr[5:0]),
    .tohdl_cmdl_req      (tohdl_cmdl_req),
    .tohdl_cmdl_cmd      (tohdl_cmdl_cmd[7:0]),
    .tohdl_cmdl_addr     (tohdl_cmdl_addr[63:0]),
    .tohdl_cmdl_len      (tohdl_cmdl_len[13:0]),
    .tohdl_cmdl_xid      (tohdl_cmdl_xid[5:0]),
    .tohdl_cmdl_port     (tohdl_cmdl_port[1:0]),
    .tohdl_cmdl_dma      (tohdl_cmdl_dma[4:0]),
    .tohdl_cmdl_client   (tohdl_cmdl_client[7:0]),
    .cmdl_tohdl_ack      (cmdl_tohdl_ack),
    .tohdl_xtb_rd        (tohdl_xtb_rd),
    .tohdl_xtb_raddr     (tohdl_xtb_raddr[5:0]),
    .tohdl_xtb_rdata     (tohdl_xtb_rdata[118:0]),
    .tohdl_xtb_rd_ack    (tohdl_xtb_rd_ack),
    .tohdl_xtb_rdata_err (tohdl_xtb_rdata_err),
    .smx_nc_err          (smx_nc_err),
    .tohdl_set_intr      (tohdl_set_intr),
    .tohdl_intr_status   (tohdl_intr_status[5:0])
    );

niu_smx_stall_hdlr stall_hdlr (
    .clk                 (niu_clk),
    .reset_l             (niu_reset_l),
    .dbg1_niu_stall      (dbg1_niu_stall),
    .dbg1_niu_resume     (dbg1_niu_resume),
    .niu_dbg1_stall_ack  (niu_dbg1_stall_ack),
    .tid_valid_rdata_bus (tid_valid_rdata_bus[63:0]),
    .stall_enable        (stall_enable),
    .wreq_cmdreq_idle    (wreq_cmdreq_idle),
    .rdreq_cmdreq_idle   (rdreq_cmdreq_idle),
    .wreq_cmdff_empty    (wreq_cmdff_empty),
    .rdreq_cmdff_empty   (rdreq_cmdff_empty),
    .siireq_idle         (siireq_idle),
    .smx_nc_err          (smx_nc_err)
    );

niu_smx_pio pio (
    .clk                     (niu_clk),
    .reset_l                 (niu_reset_l),
    .reg_timer_cfg           (reg_timer_cfg[31:0]),
    .reg_ras_cfg             (reg_ras_cfg[1:0]),
    .pio_data                (pio_smx_cfg_data),
    .smx_pio_intr            (smx_pio_intr),
    .smx_pio_status          (smx_pio_status[31:0]),
    .pio_smx_clear_intr      (pio_smx_clear_intr),
    .pio_smx_ctrl            (pio_smx_ctrl[31:0]),
    .pio_smx_debug_vector    (pio_smx_debug_vector[31:0]),
    .smx_debug_port          (smx_debug_port[31:0]),
    .tohdl_set_intr          (tohdl_set_intr),
    .tohdl_intr_status       (tohdl_intr_status[5:0]),
    .pio_xtb_err_inject_cfg  (pio_xtb_err_inject_cfg[2:0]),
    .pio_resp_err_inject_cfg (pio_resp_err_inject_cfg[2:0]),
    .niu_sii_hdr_vld         (niu_sii_hdr_vld),
    .niu_sii_reqbypass       (niu_sii_reqbypass),
    .niu_sii_datareq         (niu_sii_datareq),
    .sii_niu_oqdq            (sii_niu_oqdq),
    .sii_niu_bqdq            (sii_niu_bqdq),
    .wreq_cmdff_rd           (wreq_cmdff_rd),
    .rdreq_cmdff_rd          (rdreq_cmdff_rd),
    .wreq_dataff_rd          (wreq_dataff_rd),
    .wreq_cmdff_wr           (wreq_cmdff_wr),
    .rdreq_cmdff_wr          (rdreq_cmdff_wr),
    .wreq_dataff_wr          (wreq_dataff_wr),
    .sio_niu_hdr_vld         (sio_niu_hdr_vld),
    .sio_niu_datareq         (sio_niu_datareq),
    .niu_sio_dq              (niu_sio_dq),
    .resp_cmdff_wr           (resp_cmdff_wr),
    .resp_dataff_wr          (resp_dataff_wr),
    .resp_cmdff_rd           (resp_cmdff_rd),
    .resp_dataff_rd          (resp_dataff_rd),
    .meta_dmc_resp_ready     (meta_dmc_resp_ready),
    .meta_dmc_ack_ready      (meta_dmc_ack_ready),
    .dmc_meta0_req           (dmc_meta0_req),
    .meta_dmc1_req_accept    (meta_dmc1_req_accept),
    .dmc_meta1_req           (dmc_meta1_req),
    .meta_dmc0_req_accept    (meta_dmc0_req_accept),
    .meta_dmc0_data_req      (meta_dmc0_data_req),
    .dmc_meta0_data_valid    (dmc_meta0_data_valid),
    .sii_cs                  (sii_cs[1:0]),
    .arb_cs                  (arb_cs[1:0]),
    .rdreq_cmd_cs            (rdreq_cmd_cs[2:0]),
    .wreq_cmd_cs             (wreq_cmd_cs[2:0]),
    .wreq_dv_cs              (wreq_dv_cs[1:0]),
    .dreq_cs                 (dreq_cs[2:0]),
    .proc_cs                 (proc_cs[1:0]),
    .cmdl_cs                 (cmdl_cs[2:0]),
    .dv_cs                   (dv_cs[2:0])
    );

niu_mb0 niu_mb0 (
    .niu_mb0_smx_table_rd_en    (niu_mb0_smx_table_rd_en),
    .niu_mb0_smx_table_wr_en    (niu_mb0_smx_table_wr_en),
    .niu_mb0_smx_store_rd_en    (niu_mb0_smx_store_rd_en),
    .niu_mb0_smx_store_wr_en    (niu_mb0_smx_store_wr_en),
    .niu_mb0_addr               (niu_mb0_addr[5:0]),
    .niu_mb0_wdata              (niu_mb0_wdata[7:0]),
    .niu_mb0_run                (niu_mb0_run),
    .niu_tcu_mbist_fail_0       (tds_smx_tcu_mbist_fail),
    .niu_tcu_mbist_done_0       (tds_smx_tcu_mbist_done),
    .mb0_scan_out               (tds_smx_mbist_scan_out),
    .l1clk                      (niu_clk),
    .rst_l                      (niu_reset_l),
    .tcu_mbist_user_mode        (tcu_mbist_user_mode),
    .mb0_scan_in                (tds_smx_mbist_scan_in),
    .tcu_aclk                   (tcu_aclk),
    .tcu_bclk                   (tcu_bclk),
    .tcu_niu_mbist_start_0      (tcu_tds_smx_mbist_start),
    .niu_mb0_smx_table_data_out (niu_mb0_smx_table_data_out[145:0]),
    .niu_mb0_smx_store_data_out (niu_mb0_smx_store_data_out[145:0]),
    .tcu_mbist_bisi_en          (tcu_mbist_bisi_en)
    );
// VPERL: GENERATED_END

// &CONNECT  ("rm.rmreset", "buf_reset_r"); 
// niu_smx_rdreq_dmc
// niu_smx_wreq_dmc
// niu_smx_resp_dmc
// niu_smx_req_sii
// niu_smx_resp_sio
// niu_smx_req_ff
// niu_smx_resp_ff
// niu_smx_xtb



assign meta_dmc0_req_errors= 1'b0;  // ??? not use by anyone
assign meta_dmc1_req_errors= 1'b0;  // ??? not use by anyone


endmodule



