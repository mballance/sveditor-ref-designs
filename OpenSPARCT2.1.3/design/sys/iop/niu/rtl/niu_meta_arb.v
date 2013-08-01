// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_meta_arb.v
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
`include "niu_meta_arb_define.h"

// VPERL: PERL_BEG
//
// $VPERL_PORT_COMM = 1;
// $VPERL_INST_COMM = 2;
//
// &MODULE ("niu_meta_arb");
// &DECLARE ("input", niu_clk);
//
// &INSTANCE ("/vobs/neptune/design/niu/niu_meta_arb/rtl/niu_wr_meta_arb.v", "niu_wr_meta_arb");
// &INSTANCE ("/vobs/neptune/design/niu/niu_meta_arb/rtl/niu_rd_meta_arb.v", "niu_rd_meta_arb");
// &INSTANCE ("/vobs/neptune/design/niu/niu_meta_arb/rtl/niu_meta_arb_reset.v", "niu_meta_arb_reset");
// &INSTANCE ("/vobs/neptune/design/niu/niu_meta_arb/rtl/niu_meta_arb_dbg.v", "arb_debug");
// 
// &FORCE ("wire", "clk");
//
//# &FORCE ("wire", "clk_cts");
//# &CONNECT ("niu_wr_meta_arb.clk" , "clk_cts"); 
//# &CONNECT ("niu_rd_meta_arb.clk" , "clk_cts"); 
//# &CONNECT ("niu_meta_arb_reset.clk" , "clk_cts"); 
//# &CONNECT ("arb_debug.clk" , "clk_cts"); 
//
// VPERL: PERL_END
// VPERL: GENERATED_BEG

module niu_meta_arb (
    niu_clk,                        // input  () <= ()
    niu_reset_l,                        // input  (niu_meta_arb_reset) <= ()
`ifdef NEPTUNE
    zcp_arb1_req,                   // input  (niu_rd_meta_arb) <= ()
    zcp_arb1_req_address,           // input  (niu_rd_meta_arb) <= ()
    zcp_arb1_req_cmd,               // input  (niu_rd_meta_arb) <= ()
    zcp_arb1_req_dma_num,           // input  (niu_rd_meta_arb) <= ()
    zcp_arb1_req_func_num,          // input  (niu_rd_meta_arb) <= ()
    zcp_arb1_req_length,            // input  (niu_rd_meta_arb) <= ()
    zcp_arb1_req_port_num,          // input  (niu_rd_meta_arb) <= ()
    arb1_zcp_req_accept,            // output (niu_rd_meta_arb) => ()
    dmc_meta0_req_func_num,         // output (niu_wr_meta_arb) => ()
    dmc_meta1_req_func_num,         // output (niu_rd_meta_arb) => ()
    dmc_meta_ack_accept,            // input  (niu_wr_meta_arb) <= ()
    dmc_meta_resp_accept,           // input  (niu_rd_meta_arb) <= ()
`else
    rdmc_meta_ack_accept,            // input  (niu_wr_meta_arb) <= ()
    tdmc_meta_ack_accept,            // input  (niu_wr_meta_arb) <= ()
    rdmc_meta_resp_accept,           // input  (niu_rd_meta_arb) <= ()
    tdmc_meta_resp_accept,           // input  (niu_rd_meta_arb) <= ()
    txc_meta_resp_accept,           // input  (niu_rd_meta_arb) <= ()
`endif

    meta_dmc0_data_req,             // input  (niu_wr_meta_arb) <= ()
    meta_dmc0_req_accept,           // input  (niu_wr_meta_arb) <= ()
    meta_dmc0_req_errors,           // input  (niu_wr_meta_arb) <= ()
    meta_dmc1_req_accept,           // input  (niu_rd_meta_arb) <= ()
    meta_dmc1_req_errors,           // input  (niu_rd_meta_arb) <= ()
    meta_dmc_ack_cmd_status,        // input  (niu_wr_meta_arb) <= ()
    meta_dmc_ack_transID,           // input  (niu_wr_meta_arb) <= ()
    meta_dmc_ack_transfer_cmpl,     // input  (niu_wr_meta_arb) <= ()
    meta_dmc_resp_cmd_status,       // input  (niu_rd_meta_arb) <= ()
    meta_dmc_resp_transID,          // input  (niu_rd_meta_arb) <= ()
    meta_dmc_resp_transfer_cmpl,    // input  (niu_rd_meta_arb) <= ()
    pio_arb_ctrl,                   // input  (arb_debug) <= ()
    pio_arb_debug_vector,           // input  (arb_debug) <= ()
    pio_arb_dirtid_clr,             // input  (niu_rd_meta_arb,niu_wr_meta_arb) <= ()
    pio_arb_dirtid_enable,          // input  (niu_rd_meta_arb,niu_wr_meta_arb) <= ()
    pio_arb_np_threshold,           // input  (niu_wr_meta_arb) <= ()
    pio_arb_rd_threshold,           // input  (niu_rd_meta_arb) <= ()
    rbr_arb1_req,                   // input  (niu_rd_meta_arb) <= ()
    rbr_arb1_req_address,           // input  (niu_rd_meta_arb) <= ()
    rbr_arb1_req_cmd,               // input  (niu_rd_meta_arb) <= ()
    rbr_arb1_req_dma_num,           // input  (niu_rd_meta_arb) <= ()
    rbr_arb1_req_func_num,          // input  (niu_rd_meta_arb) <= ()
    rbr_arb1_req_length,            // input  (niu_rd_meta_arb) <= ()
    rbr_arb1_req_port_num,          // input  (niu_rd_meta_arb) <= ()
    rcr_arb0_data,                  // input  (niu_wr_meta_arb) <= ()
    rcr_arb0_data_valid,            // input  (niu_wr_meta_arb) <= ()
    rcr_arb0_req,                   // input  (niu_wr_meta_arb) <= ()
    rcr_arb0_req_address,           // input  (niu_wr_meta_arb) <= ()
    rcr_arb0_req_byteenable,        // input  (niu_wr_meta_arb) <= ()
    rcr_arb0_req_cmd,               // input  (niu_wr_meta_arb) <= ()
    rcr_arb0_req_dma_num,           // input  (niu_wr_meta_arb) <= ()
    rcr_arb0_req_func_num,          // input  (niu_wr_meta_arb) <= ()
    rcr_arb0_req_length,            // input  (niu_wr_meta_arb) <= ()
    rcr_arb0_req_port_num,          // input  (niu_wr_meta_arb) <= ()
    rcr_arb0_status,                // input  (niu_wr_meta_arb) <= ()
    rcr_arb0_transfer_complete,     // input  (niu_wr_meta_arb) <= ()
    rdc_arb0_data,                  // input  (niu_wr_meta_arb) <= ()
    rdc_arb0_data_valid,            // input  (niu_wr_meta_arb) <= ()
    rdc_arb0_req,                   // input  (niu_wr_meta_arb) <= ()
    rdc_arb0_req_address,           // input  (niu_wr_meta_arb) <= ()
    rdc_arb0_req_byteenable,        // input  (niu_wr_meta_arb) <= ()
    rdc_arb0_req_cmd,               // input  (niu_wr_meta_arb) <= ()
    rdc_arb0_req_dma_num,           // input  (niu_wr_meta_arb) <= ()
    rdc_arb0_req_func_num,          // input  (niu_wr_meta_arb) <= ()
    rdc_arb0_req_length,            // input  (niu_wr_meta_arb) <= ()
    rdc_arb0_req_port_num,          // input  (niu_wr_meta_arb) <= ()
    rdc_arb0_status,                // input  (niu_wr_meta_arb) <= ()
    rdc_arb0_transfer_complete,     // input  (niu_wr_meta_arb) <= ()
    tdmc_arb0_data,                 // input  (niu_wr_meta_arb) <= ()
    tdmc_arb0_data_valid,           // input  (niu_wr_meta_arb) <= ()
    tdmc_arb0_req,                  // input  (niu_wr_meta_arb) <= ()
    tdmc_arb0_req_address,          // input  (niu_wr_meta_arb) <= ()
    tdmc_arb0_req_byteenable,       // input  (niu_wr_meta_arb) <= ()
    tdmc_arb0_req_cmd,              // input  (niu_wr_meta_arb) <= ()
    tdmc_arb0_req_dma_num,          // input  (niu_wr_meta_arb) <= ()
    tdmc_arb0_req_func_num,         // input  (niu_wr_meta_arb) <= ()
    tdmc_arb0_req_length,           // input  (niu_wr_meta_arb) <= ()
    tdmc_arb0_req_port_num,         // input  (niu_wr_meta_arb) <= ()
    tdmc_arb0_status,               // input  (niu_wr_meta_arb) <= ()
    tdmc_arb0_transfer_complete,    // input  (niu_wr_meta_arb) <= ()
    tdmc_arb1_req,                  // input  (niu_rd_meta_arb) <= ()
    tdmc_arb1_req_address,          // input  (niu_rd_meta_arb) <= ()
    tdmc_arb1_req_cmd,              // input  (niu_rd_meta_arb) <= ()
    tdmc_arb1_req_dma_num,          // input  (niu_rd_meta_arb) <= ()
    tdmc_arb1_req_func_num,         // input  (niu_rd_meta_arb) <= ()
    tdmc_arb1_req_length,           // input  (niu_rd_meta_arb) <= ()
    tdmc_arb1_req_port_num,         // input  (niu_rd_meta_arb) <= ()
    txc_arb1_req,                   // input  (niu_rd_meta_arb) <= ()
    txc_arb1_req_address,           // input  (niu_rd_meta_arb) <= ()
    txc_arb1_req_cmd,               // input  (niu_rd_meta_arb) <= ()
    txc_arb1_req_dma_num,           // input  (niu_rd_meta_arb) <= ()
    txc_arb1_req_func_num,          // input  (niu_rd_meta_arb) <= ()
    txc_arb1_req_length,            // input  (niu_rd_meta_arb) <= ()
    txc_arb1_req_port_num,          // input  (niu_rd_meta_arb) <= ()
    arb0_rcr_data_req,              // output (niu_wr_meta_arb) => ()
    arb0_rcr_req_accept,            // output (niu_wr_meta_arb) => ()
    arb0_rdc_data_req,              // output (niu_wr_meta_arb) => ()
    arb0_rdc_req_accept,            // output (niu_wr_meta_arb) => ()
    arb0_tdmc_data_req,             // output (niu_wr_meta_arb) => ()
    arb0_tdmc_req_accept,           // output (niu_wr_meta_arb) => ()
    arb1_rbr_req_accept,            // output (niu_rd_meta_arb) => ()
    arb1_tdmc_req_accept,           // output (niu_rd_meta_arb) => ()
    arb1_txc_req_accept,            // output (niu_rd_meta_arb) => ()
/*
    arb0_rcr_req_errors,            // output (niu_wr_meta_arb) => ()
    arb0_rdc_req_errors,            // output (niu_wr_meta_arb) => ()
    arb0_tdmc_req_errors,           // output (niu_wr_meta_arb) => ()
    arb1_tdmc_req_errors,           // output (niu_rd_meta_arb) => ()
    arb1_txc_req_errors,            // output (niu_rd_meta_arb) => ()
    arb1_zcp_req_errors,            // output (niu_rd_meta_arb) => ()
*/
    arb1_rbr_req_errors,            // output (niu_rd_meta_arb) => ()

    arb_pio_all_npwdirty,           // output (niu_wr_meta_arb) => ()
    arb_pio_all_rddirty,            // output (niu_rd_meta_arb) => ()
    arb_pio_dirtid_npwstatus,       // output (niu_wr_meta_arb) => ()
    arb_pio_dirtid_rdstatus,        // output (niu_rd_meta_arb) => ()
    dmc_meta0_data,                 // output (niu_wr_meta_arb) => ()
    dmc_meta0_data_valid,           // output (niu_wr_meta_arb) => ()
    dmc_meta0_req,                  // output (niu_wr_meta_arb) => ()
    dmc_meta0_req_address,          // output (niu_wr_meta_arb) => ()
    dmc_meta0_req_byteenable,       // output (niu_wr_meta_arb) => ()
    dmc_meta0_req_client,           // output (niu_wr_meta_arb) => ()
    dmc_meta0_req_cmd,              // output (niu_wr_meta_arb) => ()
    dmc_meta0_req_dma_num,          // output (niu_wr_meta_arb) => ()
    dmc_meta0_req_length,           // output (niu_wr_meta_arb) => ()
    dmc_meta0_req_port_num,         // output (niu_wr_meta_arb) => ()
    dmc_meta0_req_transID,          // output (niu_wr_meta_arb) => ()
    dmc_meta0_status,               // output (niu_wr_meta_arb) => ()
    dmc_meta0_transfer_complete,    // output (niu_wr_meta_arb) => ()
    dmc_meta1_req,                  // output (niu_rd_meta_arb) => ()
    dmc_meta1_req_address,          // output (niu_rd_meta_arb) => ()
    dmc_meta1_req_client,           // output (niu_rd_meta_arb) => ()
    dmc_meta1_req_cmd,              // output (niu_rd_meta_arb) => ()
    dmc_meta1_req_dma_num,          // output (niu_rd_meta_arb) => ()
    dmc_meta1_req_length,           // output (niu_rd_meta_arb) => ()
    dmc_meta1_req_port_num,         // output (niu_rd_meta_arb) => ()
    dmc_meta1_req_transID,          // output (niu_rd_meta_arb) => ()
    meta_arb_debug_port             // output (arb_debug) => ()
    );

input		meta_dmc0_data_req;           // Memory line request
input		meta_dmc0_req_accept;         // Response to REQ
input		meta_dmc0_req_errors;         // Error flag
input		meta_dmc1_req_accept;         // Response to REQ
input		meta_dmc1_req_errors;         // Error flag
input	[3:0]	meta_dmc_ack_cmd_status;      // status in command phase
input	[5:0]	meta_dmc_ack_transID;         // Free TransID
input	[7:0]	meta_dmc_ack_transfer_cmpl;   // Last trans of TransID
input	[3:0]	meta_dmc_resp_cmd_status;     // status in command phase
input	[5:0]	meta_dmc_resp_transID;        // Free TransID
input	[7:0]	meta_dmc_resp_transfer_cmpl;  // Last trans of TransID
input	[31:0]	pio_arb_ctrl;
input	[31:0]	pio_arb_debug_vector;
input		pio_arb_dirtid_clr;           // Clear all Dirty TID Entries
input		pio_arb_dirtid_enable;        // Enable Dirty TID logic
input	[5:0]	pio_arb_np_threshold;         // np write threshold
input	[5:0]	pio_arb_rd_threshold;         // read threshold
input		rbr_arb1_req;                 // Req Command Request
input	[63:0]	rbr_arb1_req_address;         // Memory Address
input	[7:0]	rbr_arb1_req_cmd;             // Command Request
input	[4:0]	rbr_arb1_req_dma_num;         // Channel Number
input	[1:0]	rbr_arb1_req_func_num;        // Channel Number
input	[13:0]	rbr_arb1_req_length;          // Packet Length
input	[1:0]	rbr_arb1_req_port_num;        // Port Number
input	[127:0]	rcr_arb0_data;                // Transfer Data
input		rcr_arb0_data_valid;          // Transfer Data Ack
input		rcr_arb0_req;                 // Req Command Request
input	[63:0]	rcr_arb0_req_address;         // Memory Address
input	[15:0]	rcr_arb0_req_byteenable;      // First/Last BE
input	[7:0]	rcr_arb0_req_cmd;             // Command Request
input	[4:0]	rcr_arb0_req_dma_num;         // Channel Number
input	[1:0]	rcr_arb0_req_func_num;        // Channel Number
input	[13:0]	rcr_arb0_req_length;          // Packet Length
input	[1:0]	rcr_arb0_req_port_num;        // Port Number
input	[3:0]	rcr_arb0_status;              // Transfer Data Status
input		rcr_arb0_transfer_complete;   // Transfer Data Complete
input	[127:0]	rdc_arb0_data;                // Transfer Data
input		rdc_arb0_data_valid;          // Transfer Data Ack
input		rdc_arb0_req;                 // Req Command Request
input	[63:0]	rdc_arb0_req_address;         // Memory Address
input	[15:0]	rdc_arb0_req_byteenable;      // First/Last BE
input	[7:0]	rdc_arb0_req_cmd;             // Command Request
input	[4:0]	rdc_arb0_req_dma_num;         // Channel Number
input	[1:0]	rdc_arb0_req_func_num;        // Channel Number
input	[13:0]	rdc_arb0_req_length;          // Packet Length
input	[1:0]	rdc_arb0_req_port_num;        // Port Number
input	[3:0]	rdc_arb0_status;              // Transfer Data Status
input		rdc_arb0_transfer_complete;   // Transfer Data Complete
input	[127:0]	tdmc_arb0_data;               // Transfer Data
input		tdmc_arb0_data_valid;         // Transfer Data Ack
input		tdmc_arb0_req;                // Req Command Request
input	[63:0]	tdmc_arb0_req_address;        // Memory Address
input	[15:0]	tdmc_arb0_req_byteenable;     // First/Last BE
input	[7:0]	tdmc_arb0_req_cmd;            // Command Request
input	[4:0]	tdmc_arb0_req_dma_num;        // Channel Number
input	[1:0]	tdmc_arb0_req_func_num;       // Func Number
input	[13:0]	tdmc_arb0_req_length;         // Packet Length
input	[1:0]	tdmc_arb0_req_port_num;       // Port Number
input	[3:0]	tdmc_arb0_status;             // Transfer Data Status
input		tdmc_arb0_transfer_complete;  // Transfer Data Complete
input		tdmc_arb1_req;                // Req Command Request
input	[63:0]	tdmc_arb1_req_address;        // Memory Address
input	[7:0]	tdmc_arb1_req_cmd;            // Command Request
input	[4:0]	tdmc_arb1_req_dma_num;        // Channel Number
input	[1:0]	tdmc_arb1_req_func_num;       // Channel Number
input	[13:0]	tdmc_arb1_req_length;         // Packet Length
input	[1:0]	tdmc_arb1_req_port_num;       // Port Number
input		txc_arb1_req;                 // Req Command Request
input	[63:0]	txc_arb1_req_address;         // Memory Address
input	[7:0]	txc_arb1_req_cmd;             // Command Request
input	[4:0]	txc_arb1_req_dma_num;         // Channel Number
input	[1:0]	txc_arb1_req_func_num;        // Channel Number
input	[13:0]	txc_arb1_req_length;          // Packet Length
input	[1:0]	txc_arb1_req_port_num;        // Port Number
output		arb0_rcr_data_req;            // Memory line request
output		arb0_rcr_req_accept;          // Response to REQ
output		arb0_rdc_data_req;            // Memory line request
output		arb0_rdc_req_accept;          // Response to REQ
output		arb0_tdmc_data_req;           // Memory line request
output		arb0_tdmc_req_accept;         // Response to REQ
output		arb1_rbr_req_accept;          // Response to REQ
output		arb1_tdmc_req_accept;         // Response to REQ
output		arb1_txc_req_accept;          // Response to REQ
/*
output		arb0_rcr_req_errors;          // Error flag
output		arb0_rdc_req_errors;          // Error flag
output		arb0_tdmc_req_errors;         // Error flag
output		arb1_tdmc_req_errors;         // Error flag
output		arb1_txc_req_errors;          // Error flag
output		arb1_zcp_req_errors;          // Error flag
*/

output		arb1_rbr_req_errors;          // Error flag

output		arb_pio_all_npwdirty;         // all dirty bin entries are dirty
output		arb_pio_all_rddirty;          // all dirty bin entries are dirty
output	[5:0]	arb_pio_dirtid_npwstatus;     //  count for number of np write TID's dirty
output	[5:0]	arb_pio_dirtid_rdstatus;      // count for number of read TID's dirty
output	[127:0]	dmc_meta0_data;               // Transfer Data
output		dmc_meta0_data_valid;         // Transfer Data Ack
output		dmc_meta0_req;                // Req Command Request
output	[63:0]	dmc_meta0_req_address;        // Memory Address
output	[15:0]	dmc_meta0_req_byteenable;     // First/Last BE
output	[7:0]	dmc_meta0_req_client;         // Client [vector]
output	[7:0]	dmc_meta0_req_cmd;            // Command Request
output	[4:0]	dmc_meta0_req_dma_num;        // Channel Number
output	[13:0]	dmc_meta0_req_length;         // Packet Length
output	[1:0]	dmc_meta0_req_port_num;       // Port Number
output	[5:0]	dmc_meta0_req_transID;        // Transaction ID
output	[3:0]	dmc_meta0_status;             // Transfer Data Status
output		dmc_meta0_transfer_complete;  // Transfer Data Complete
output		dmc_meta1_req;                // Req Command Request
output	[63:0]	dmc_meta1_req_address;        // Memory Address
output	[7:0]	dmc_meta1_req_client;         // Client [vector]
output	[7:0]	dmc_meta1_req_cmd;            // Command Request
output	[4:0]	dmc_meta1_req_dma_num;        // Channel Number
output	[13:0]	dmc_meta1_req_length;         // Packet Length
output	[1:0]	dmc_meta1_req_port_num;       // Port Number
output	[5:0]	dmc_meta1_req_transID;        // Transaction ID
output	[31:0]	meta_arb_debug_port;


input		niu_clk;
input		niu_reset_l;

`ifdef NEPTUNE
input		zcp_arb1_req;                 // Req Command Request
input	[63:0]	zcp_arb1_req_address;         // Memory Address
input	[7:0]	zcp_arb1_req_cmd;             // Command Request
input	[4:0]	zcp_arb1_req_dma_num;         // Channel Number
input	[1:0]	zcp_arb1_req_func_num;        // Channel Number
input	[13:0]	zcp_arb1_req_length;          // Packet Length
input	[1:0]	zcp_arb1_req_port_num;        // Port Number
output		arb1_zcp_req_accept;          // Response to REQ
output	[1:0]	dmc_meta0_req_func_num;       // Channel Number
output	[1:0]	dmc_meta1_req_func_num;       // Channel Number
input	[7:0]	dmc_meta_ack_accept;          // Valid TransID
input	[7:0]	dmc_meta_resp_accept;         // Valid TransID
`else
input		rdmc_meta_ack_accept;          // Valid TransID
input		tdmc_meta_ack_accept;          // Valid TransID
input		rdmc_meta_resp_accept;         // Valid TransID
input		tdmc_meta_resp_accept;         // Valid TransID
input		txc_meta_resp_accept;         // Valid TransID
wire		zcp_arb1_req= 1'b0;                 // Req Command Request
wire	[63:0]	zcp_arb1_req_address= 64'h0;         // Memory Address
wire	[7:0]	zcp_arb1_req_cmd= 8'h0;             // Command Request
wire	[4:0]	zcp_arb1_req_dma_num= 5'h0;         // Channel Number
wire	[1:0]	zcp_arb1_req_func_num= 2'h0;        // Channel Number
wire	[13:0]	zcp_arb1_req_length= 14'h0;          // Packet Length
wire	[1:0]	zcp_arb1_req_port_num= 2'h0;        // Port Number
wire		arb1_zcp_req_accept;          // Response to REQ
wire	[1:0]	dmc_meta0_req_func_num;       // Channel Number
wire	[1:0]	dmc_meta1_req_func_num;       // Channel Number
wire	[7:0]	dmc_meta_ack_accept= {1'b0, 1'b0, 1'b0, 
				      rdmc_meta_ack_accept, 1'b0, 
				      tdmc_meta_ack_accept, 1'b0, 1'b0};          
wire	[7:0]	dmc_meta_resp_accept= {1'b0, 1'b0, 
				      rdmc_meta_resp_accept, 1'b0, 1'b0,
				      tdmc_meta_resp_accept, 
				      txc_meta_resp_accept, 1'b0}; 
`endif

// wire		clk;
wire		reset;
wire		arb0_rcr_req_errors;          // Error flag
wire		arb0_rdc_req_errors;          // Error flag
wire		arb0_tdmc_req_errors;         // Error flag
wire		arb1_tdmc_req_errors;         // Error flag
wire		arb1_txc_req_errors;          // Error flag
wire		arb1_zcp_req_errors;          // Error flag

reg		pio_arb_dirtid_clr_r;           // Clear all Dirty TID Entries
reg		pio_arb_dirtid_enable_r;        // Enable Dirty TID logic
reg	[5:0]	pio_arb_np_threshold_r;         // np write threshold
reg	[5:0]	pio_arb_rd_threshold_r;         // read threshold

wire  [31:0] int_debug_port;

niu_wr_meta_arb niu_wr_meta_arb (
    .dmc_meta0_req_cmd           (dmc_meta0_req_cmd[7:0]),          // output (niu_wr_meta_arb) => ()
    .dmc_meta0_req_address       (dmc_meta0_req_address[63:0]),     // output (niu_wr_meta_arb) => ()
    .dmc_meta0_req_length        (dmc_meta0_req_length[13:0]),      // output (niu_wr_meta_arb) => ()
    .dmc_meta0_req_transID       (dmc_meta0_req_transID[5:0]),      // output (niu_wr_meta_arb) => ()
    .dmc_meta0_req_port_num      (dmc_meta0_req_port_num[1:0]),     // output (niu_wr_meta_arb) => ()
    .dmc_meta0_req_dma_num       (dmc_meta0_req_dma_num[4:0]),      // output (niu_wr_meta_arb) => ()
    .dmc_meta0_req_func_num      (dmc_meta0_req_func_num[1:0]),     // output (niu_wr_meta_arb) => ()
    .dmc_meta0_req_client        (dmc_meta0_req_client[7:0]),       // output (niu_wr_meta_arb) => ()
    .dmc_meta0_req               (dmc_meta0_req),                   // output (niu_wr_meta_arb) => ()
    .dmc_meta0_transfer_complete (dmc_meta0_transfer_complete),     // output (niu_wr_meta_arb) => ()
    .dmc_meta0_data              (dmc_meta0_data[127:0]),           // output (niu_wr_meta_arb) => ()
    .dmc_meta0_req_byteenable    (dmc_meta0_req_byteenable[15:0]),  // output (niu_wr_meta_arb) => ()
    .dmc_meta0_status            (dmc_meta0_status[3:0]),           // output (niu_wr_meta_arb) => ()
    .dmc_meta0_data_valid        (dmc_meta0_data_valid),            // output (niu_wr_meta_arb) => ()
    .arb0_tdmc_req_accept        (arb0_tdmc_req_accept),            // output (niu_wr_meta_arb) => ()
    .arb0_tdmc_data_req          (arb0_tdmc_data_req),              // output (niu_wr_meta_arb) => ()
    .arb0_tdmc_req_errors        (arb0_tdmc_req_errors),            // output (niu_wr_meta_arb) => ()
    .arb0_rdc_req_accept         (arb0_rdc_req_accept),             // output (niu_wr_meta_arb) => ()
    .arb0_rdc_data_req           (arb0_rdc_data_req),               // output (niu_wr_meta_arb) => ()
    .arb0_rdc_req_errors         (arb0_rdc_req_errors),             // output (niu_wr_meta_arb) => ()
    .arb0_rcr_req_accept         (arb0_rcr_req_accept),             // output (niu_wr_meta_arb) => ()
    .arb0_rcr_data_req           (arb0_rcr_data_req),               // output (niu_wr_meta_arb) => ()
    .arb0_rcr_req_errors         (arb0_rcr_req_errors),             // output (niu_wr_meta_arb) => ()
    .arb_pio_dirtid_npwstatus    (arb_pio_dirtid_npwstatus[5:0]),   // output (niu_wr_meta_arb) => ()
    .arb_pio_all_npwdirty        (arb_pio_all_npwdirty),            // output (niu_wr_meta_arb) => ()
    .meta_dmc0_req_accept        (meta_dmc0_req_accept),            // input  (niu_wr_meta_arb) <= ()
    .meta_dmc0_data_req          (meta_dmc0_data_req),              // input  (niu_wr_meta_arb) <= ()
    .meta_dmc0_req_errors        (meta_dmc0_req_errors),            // input  (niu_wr_meta_arb) <= ()
    .tdmc_arb0_req_cmd           (tdmc_arb0_req_cmd[7:0]),          // input  (niu_wr_meta_arb) <= ()
    .tdmc_arb0_req_address       (tdmc_arb0_req_address[63:0]),     // input  (niu_wr_meta_arb) <= ()
    .tdmc_arb0_req_length        (tdmc_arb0_req_length[13:0]),      // input  (niu_wr_meta_arb) <= ()
    .tdmc_arb0_req_port_num      (tdmc_arb0_req_port_num[1:0]),     // input  (niu_wr_meta_arb) <= ()
    .tdmc_arb0_req_dma_num       (tdmc_arb0_req_dma_num[4:0]),      // input  (niu_wr_meta_arb) <= ()
    .tdmc_arb0_req_func_num      (tdmc_arb0_req_func_num[1:0]),     // input  (niu_wr_meta_arb) <= ()
    .tdmc_arb0_req               (tdmc_arb0_req),                   // input  (niu_wr_meta_arb) <= ()
    .tdmc_arb0_transfer_complete (tdmc_arb0_transfer_complete),     // input  (niu_wr_meta_arb) <= ()
    .tdmc_arb0_data              (tdmc_arb0_data[127:0]),           // input  (niu_wr_meta_arb) <= ()
    .tdmc_arb0_req_byteenable    (tdmc_arb0_req_byteenable[15:0]),  // input  (niu_wr_meta_arb) <= ()
    .tdmc_arb0_status            (tdmc_arb0_status[3:0]),           // input  (niu_wr_meta_arb) <= ()
    .tdmc_arb0_data_valid        (tdmc_arb0_data_valid),            // input  (niu_wr_meta_arb) <= ()
    .rdc_arb0_req_cmd            (rdc_arb0_req_cmd[7:0]),           // input  (niu_wr_meta_arb) <= ()
    .rdc_arb0_req_address        (rdc_arb0_req_address[63:0]),      // input  (niu_wr_meta_arb) <= ()
    .rdc_arb0_req_length         (rdc_arb0_req_length[13:0]),       // input  (niu_wr_meta_arb) <= ()
    .rdc_arb0_req_port_num       (rdc_arb0_req_port_num[1:0]),      // input  (niu_wr_meta_arb) <= ()
    .rdc_arb0_req_dma_num        (rdc_arb0_req_dma_num[4:0]),       // input  (niu_wr_meta_arb) <= ()
    .rdc_arb0_req_func_num       (rdc_arb0_req_func_num[1:0]),      // input  (niu_wr_meta_arb) <= ()
    .rdc_arb0_req                (rdc_arb0_req),                    // input  (niu_wr_meta_arb) <= ()
    .rdc_arb0_transfer_complete  (rdc_arb0_transfer_complete),      // input  (niu_wr_meta_arb) <= ()
    .rdc_arb0_data               (rdc_arb0_data[127:0]),            // input  (niu_wr_meta_arb) <= ()
    .rdc_arb0_req_byteenable     (rdc_arb0_req_byteenable[15:0]),   // input  (niu_wr_meta_arb) <= ()
    .rdc_arb0_status             (rdc_arb0_status[3:0]),            // input  (niu_wr_meta_arb) <= ()
    .rdc_arb0_data_valid         (rdc_arb0_data_valid),             // input  (niu_wr_meta_arb) <= ()
    .rcr_arb0_req_cmd            (rcr_arb0_req_cmd[7:0]),           // input  (niu_wr_meta_arb) <= ()
    .rcr_arb0_req_address        (rcr_arb0_req_address[63:0]),      // input  (niu_wr_meta_arb) <= ()
    .rcr_arb0_req_length         (rcr_arb0_req_length[13:0]),       // input  (niu_wr_meta_arb) <= ()
    .rcr_arb0_req_port_num       (rcr_arb0_req_port_num[1:0]),      // input  (niu_wr_meta_arb) <= ()
    .rcr_arb0_req_dma_num        (rcr_arb0_req_dma_num[4:0]),       // input  (niu_wr_meta_arb) <= ()
    .rcr_arb0_req_func_num       (rcr_arb0_req_func_num[1:0]),      // input  (niu_wr_meta_arb) <= ()
    .rcr_arb0_req                (rcr_arb0_req),                    // input  (niu_wr_meta_arb) <= ()
    .rcr_arb0_transfer_complete  (rcr_arb0_transfer_complete),      // input  (niu_wr_meta_arb) <= ()
    .rcr_arb0_data               (rcr_arb0_data[127:0]),            // input  (niu_wr_meta_arb) <= ()
    .rcr_arb0_req_byteenable     (rcr_arb0_req_byteenable[15:0]),   // input  (niu_wr_meta_arb) <= ()
    .rcr_arb0_status             (rcr_arb0_status[3:0]),            // input  (niu_wr_meta_arb) <= ()
    .rcr_arb0_data_valid         (rcr_arb0_data_valid),             // input  (niu_wr_meta_arb) <= ()
    .meta_dmc_ack_transID        (meta_dmc_ack_transID[5:0]),       // input  (niu_wr_meta_arb) <= ()
    .dmc_meta_ack_accept         (dmc_meta_ack_accept[7:0]),        // input  (niu_wr_meta_arb) <= ()
    .meta_dmc_ack_transfer_cmpl  (meta_dmc_ack_transfer_cmpl[7:0]), // input  (niu_wr_meta_arb) <= ()
    .meta_dmc_ack_cmd_status     (meta_dmc_ack_cmd_status[3:0]),    // input  (niu_wr_meta_arb) <= ()
    .pio_arb_dirtid_enable       (pio_arb_dirtid_enable_r),           // input  (niu_rd_meta_arb,niu_wr_meta_arb) <= ()
    .pio_arb_dirtid_clr          (pio_arb_dirtid_clr_r),              // input  (niu_rd_meta_arb,niu_wr_meta_arb) <= ()
    .pio_arb_np_threshold        (pio_arb_np_threshold_r[5:0]),       // input  (niu_wr_meta_arb) <= ()
    .clk                         (niu_clk),                             // input  (arb_debug,niu_meta_arb_reset,niu_rd_meta_arb,niu_wr_meta_arb) <= ()
    .reset                       (reset)                            // input  (niu_rd_meta_arb,niu_wr_meta_arb) <= (niu_meta_arb_reset)
    );

niu_rd_meta_arb niu_rd_meta_arb (
    .dmc_meta1_req_cmd           (dmc_meta1_req_cmd[7:0]),           // output (niu_rd_meta_arb) => ()
    .dmc_meta1_req_address       (dmc_meta1_req_address[63:0]),      // output (niu_rd_meta_arb) => ()
    .dmc_meta1_req_length        (dmc_meta1_req_length[13:0]),       // output (niu_rd_meta_arb) => ()
    .dmc_meta1_req_transID       (dmc_meta1_req_transID[5:0]),       // output (niu_rd_meta_arb) => ()
    .dmc_meta1_req_port_num      (dmc_meta1_req_port_num[1:0]),      // output (niu_rd_meta_arb) => ()
    .dmc_meta1_req_dma_num       (dmc_meta1_req_dma_num[4:0]),       // output (niu_rd_meta_arb) => ()
    .dmc_meta1_req_func_num      (dmc_meta1_req_func_num[1:0]),      // output (niu_rd_meta_arb) => ()
    .dmc_meta1_req_client        (dmc_meta1_req_client[7:0]),        // output (niu_rd_meta_arb) => ()
    .dmc_meta1_req               (dmc_meta1_req),                    // output (niu_rd_meta_arb) => ()
    .arb1_zcp_req_accept         (arb1_zcp_req_accept),              // output (niu_rd_meta_arb) => ()
    .arb1_zcp_req_errors         (arb1_zcp_req_errors),              // output (niu_rd_meta_arb) => ()
    .arb1_txc_req_accept         (arb1_txc_req_accept),              // output (niu_rd_meta_arb) => ()
    .arb1_txc_req_errors         (arb1_txc_req_errors),              // output (niu_rd_meta_arb) => ()
    .arb1_tdmc_req_accept        (arb1_tdmc_req_accept),             // output (niu_rd_meta_arb) => ()
    .arb1_tdmc_req_errors        (arb1_tdmc_req_errors),             // output (niu_rd_meta_arb) => ()
    .arb1_rbr_req_accept         (arb1_rbr_req_accept),              // output (niu_rd_meta_arb) => ()
    .arb1_rbr_req_errors         (arb1_rbr_req_errors),              // output (niu_rd_meta_arb) => ()
    .arb_pio_dirtid_rdstatus     (arb_pio_dirtid_rdstatus[5:0]),     // output (niu_rd_meta_arb) => ()
    .arb_pio_all_rddirty         (arb_pio_all_rddirty),              // output (niu_rd_meta_arb) => ()
    .meta_dmc1_req_accept        (meta_dmc1_req_accept),             // input  (niu_rd_meta_arb) <= ()
    .meta_dmc1_req_errors        (meta_dmc1_req_errors),             // input  (niu_rd_meta_arb) <= ()
    .zcp_arb1_req_cmd            (zcp_arb1_req_cmd[7:0]),            // input  (niu_rd_meta_arb) <= ()
    .zcp_arb1_req_address        (zcp_arb1_req_address[63:0]),       // input  (niu_rd_meta_arb) <= ()
    .zcp_arb1_req_length         (zcp_arb1_req_length[13:0]),        // input  (niu_rd_meta_arb) <= ()
    .zcp_arb1_req_port_num       (zcp_arb1_req_port_num[1:0]),       // input  (niu_rd_meta_arb) <= ()
    .zcp_arb1_req_dma_num        (zcp_arb1_req_dma_num[4:0]),        // input  (niu_rd_meta_arb) <= ()
    .zcp_arb1_req_func_num       (zcp_arb1_req_func_num[1:0]),       // input  (niu_rd_meta_arb) <= ()
    .zcp_arb1_req                (zcp_arb1_req),                     // input  (niu_rd_meta_arb) <= ()
    .txc_arb1_req_cmd            (txc_arb1_req_cmd[7:0]),            // input  (niu_rd_meta_arb) <= ()
    .txc_arb1_req_address        (txc_arb1_req_address[63:0]),       // input  (niu_rd_meta_arb) <= ()
    .txc_arb1_req_length         (txc_arb1_req_length[13:0]),        // input  (niu_rd_meta_arb) <= ()
    .txc_arb1_req_port_num       (txc_arb1_req_port_num[1:0]),       // input  (niu_rd_meta_arb) <= ()
    .txc_arb1_req_dma_num        (txc_arb1_req_dma_num[4:0]),        // input  (niu_rd_meta_arb) <= ()
    .txc_arb1_req_func_num       (txc_arb1_req_func_num[1:0]),       // input  (niu_rd_meta_arb) <= ()
    .txc_arb1_req                (txc_arb1_req),                     // input  (niu_rd_meta_arb) <= ()
    .tdmc_arb1_req_cmd           (tdmc_arb1_req_cmd[7:0]),           // input  (niu_rd_meta_arb) <= ()
    .tdmc_arb1_req_address       (tdmc_arb1_req_address[63:0]),      // input  (niu_rd_meta_arb) <= ()
    .tdmc_arb1_req_length        (tdmc_arb1_req_length[13:0]),       // input  (niu_rd_meta_arb) <= ()
    .tdmc_arb1_req_port_num      (tdmc_arb1_req_port_num[1:0]),      // input  (niu_rd_meta_arb) <= ()
    .tdmc_arb1_req_dma_num       (tdmc_arb1_req_dma_num[4:0]),       // input  (niu_rd_meta_arb) <= ()
    .tdmc_arb1_req_func_num      (tdmc_arb1_req_func_num[1:0]),      // input  (niu_rd_meta_arb) <= ()
    .tdmc_arb1_req               (tdmc_arb1_req),                    // input  (niu_rd_meta_arb) <= ()
    .rbr_arb1_req_cmd            (rbr_arb1_req_cmd[7:0]),            // input  (niu_rd_meta_arb) <= ()
    .rbr_arb1_req_address        (rbr_arb1_req_address[63:0]),       // input  (niu_rd_meta_arb) <= ()
    .rbr_arb1_req_length         (rbr_arb1_req_length[13:0]),        // input  (niu_rd_meta_arb) <= ()
    .rbr_arb1_req_port_num       (rbr_arb1_req_port_num[1:0]),       // input  (niu_rd_meta_arb) <= ()
    .rbr_arb1_req_dma_num        (rbr_arb1_req_dma_num[4:0]),        // input  (niu_rd_meta_arb) <= ()
    .rbr_arb1_req_func_num       (rbr_arb1_req_func_num[1:0]),       // input  (niu_rd_meta_arb) <= ()
    .rbr_arb1_req                (rbr_arb1_req),                     // input  (niu_rd_meta_arb) <= ()
    .meta_dmc_resp_transID       (meta_dmc_resp_transID[5:0]),       // input  (niu_rd_meta_arb) <= ()
    .dmc_meta_resp_accept        (dmc_meta_resp_accept[7:0]),        // input  (niu_rd_meta_arb) <= ()
    .meta_dmc_resp_transfer_cmpl (meta_dmc_resp_transfer_cmpl[7:0]), // input  (niu_rd_meta_arb) <= ()
    .meta_dmc_resp_cmd_status    (meta_dmc_resp_cmd_status[3:0]),    // input  (niu_rd_meta_arb) <= ()
    .pio_arb_dirtid_enable       (pio_arb_dirtid_enable_r),            // input  (niu_rd_meta_arb,niu_wr_meta_arb) <= ()
    .pio_arb_dirtid_clr          (pio_arb_dirtid_clr_r),               // input  (niu_rd_meta_arb,niu_wr_meta_arb) <= ()
    .pio_arb_rd_threshold        (pio_arb_rd_threshold_r[5:0]),        // input  (niu_rd_meta_arb) <= ()
    .clk                         (niu_clk),                              // input  (arb_debug,niu_meta_arb_reset,niu_rd_meta_arb,niu_wr_meta_arb) <= ()
    .reset                       (reset)                             // input  (niu_rd_meta_arb,niu_wr_meta_arb) <= (niu_meta_arb_reset)
    );

niu_meta_arb_reset niu_meta_arb_reset (
    .clk       (niu_clk),       // input  (arb_debug,niu_meta_arb_reset,niu_rd_meta_arb,niu_wr_meta_arb) <= ()
    .reset_l   (niu_reset_l),   // input  (niu_meta_arb_reset) <= ()
    .reset     (reset)      // output (niu_meta_arb_reset) => (niu_rd_meta_arb,niu_wr_meta_arb)
    );

niu_meta_arb_dbg arb_debug (
    .clk                  (niu_clk),                        // input  (arb_debug,niu_meta_arb_reset,niu_rd_meta_arb,niu_wr_meta_arb) <= ()
    .pio_arb_ctrl         (pio_arb_ctrl[31:0]),         // input  (arb_debug) <= ()
    .pio_arb_debug_vector (pio_arb_debug_vector[31:0]), // input  (arb_debug) <= ()
    .meta_arb_debug_port  (meta_arb_debug_port[31:0]),   // output (arb_debug) => ()
    .int_debug_port	  (int_debug_port[31:0])
    );
// VPERL: GENERATED_END



// add flop in for pio signals to fix timing
// do this on top as a kludge :<
always @(posedge niu_clk) begin
  if(reset) begin
    pio_arb_dirtid_clr_r<= 1'b0;
    pio_arb_dirtid_enable_r<= 1'b0;
    pio_arb_np_threshold_r<= 6'd31;
    pio_arb_rd_threshold_r<= 6'd32;
  end
  else begin
    pio_arb_dirtid_clr_r<= pio_arb_dirtid_clr;
    pio_arb_dirtid_enable_r<= pio_arb_dirtid_enable;
    pio_arb_np_threshold_r<= pio_arb_np_threshold;
    pio_arb_rd_threshold_r<= pio_arb_rd_threshold;         
  end
end

assign int_debug_port= {
	   2'h0,	
           tdmc_arb0_req,                // Req Command Request
           rcr_arb0_req,                 // Req Command Request
           rdc_arb0_req,                 // Req Command Request
           tdmc_arb1_req,                // Req Command Request
           txc_arb1_req,                 // Req Command Request
           rbr_arb1_req,                 // Req Command Request
           arb0_tdmc_data_req,           // Memory line request
           arb0_rcr_data_req,            // Memory line request
           arb0_rdc_data_req,            // Memory line request
           dmc_meta0_req,                // Req Command Request
           dmc_meta1_req,                // Req Command Request
           meta_dmc0_data_req,           // Memory line request
	   meta_dmc_ack_transfer_cmpl[2],   // Last trans of TransID
	   meta_dmc_ack_transfer_cmpl[3],   // Last trans of TransID
 	   meta_dmc_ack_transfer_cmpl[4],   // Last trans of TransID
	   meta_dmc_resp_transfer_cmpl[1],  // Last trans of TransID
	   meta_dmc_resp_transfer_cmpl[2],  // Last trans of TransID
	   meta_dmc_resp_transfer_cmpl[5],  // Last trans of TransID
           rcr_arb0_data_valid,          // Transfer Data Ack
           rdc_arb0_data_valid,          // Transfer Data Ack
           tdmc_arb0_data_valid,         // Transfer Data Ack
           dmc_meta0_data_valid,         // Transfer Data Ack
           rcr_arb0_transfer_complete,   // Transfer Data Complete
           rdc_arb0_transfer_complete,   // Transfer Data Complete
           tdmc_arb0_transfer_complete,  // Transfer Data Complete
           dmc_meta0_transfer_complete,  // Transfer Data Complete
	   meta_dmc_resp_cmd_status[3:2],     // status in command phase
	   meta_dmc_ack_cmd_status[3:2]      // status in command phase
		};


`ifdef NEPTUNE
wire      [3:0] do_nad;
wire      [3:0] do_nor;
wire      [3:0] do_inv;
wire      [3:0] do_mux;
wire      [3:0] do_q;
wire            so;

  nep_spare_meta_arb spare_0 (
                             .di_nd3     ({1'h1, 1'h1, do_q[3]}),
                             .di_nd2     ({1'h1, 1'h1, do_q[2]}),
                             .di_nd1     ({1'h1, 1'h1, do_q[1]}),
                             .di_nd0     ({1'h1, 1'h1, do_q[0]}),
                             .di_nr3     ({1'h0, 1'h0}),
                             .di_nr2     ({1'h0, 1'h0}),
                             .di_nr1     ({1'h0, 1'h0}),
                             .di_nr0     ({1'h0, 1'h0}),
                             .di_inv     (do_nad[3:0]),
                             .di_mx3     ({1'h0, 1'h0}),
                             .di_mx2     ({1'h0, 1'h0}),
                             .di_mx1     ({1'h0, 1'h0}),
                             .di_mx0     ({1'h0, 1'h0}),
                             .mx_sel     (do_nor[3:0]),
                             .di_reg     (do_inv[3:0]),
                             .wt_ena     (do_mux[3:0]),
                             .rst        ({reset,reset,reset,reset}),
                             .si         (1'h0),
                             .se         (1'h0),
                             .clk        (niu_clk),
                             .do_nad     (do_nad[3:0]),
                             .do_nor     (do_nor[3:0]),
                             .do_inv     (do_inv[3:0]),
                             .do_mux     (do_mux[3:0]),
                             .do_q       (do_q[3:0]),
                             .so         (so)
                            );
`endif

endmodule
