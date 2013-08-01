// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_zcp_debug.v
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
/*%W%	%G%*/

/*************************************************************************
 *
 * File Name    : niu_zcp_debug.v
 * Author Name  : John Lo
 * Description  : neptune debug port 
 * Parent Module:  
 * Child  Module: 
 * Interface Mod:
 * Date Created : 12/17/2004
 *
 * Design Notes : 
 * 
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

`include  "niu_zcp.h"

module niu_zcp_debug (
`ifdef NEPTUNE
/* ----- tt module ----- */
// error handling
va_ram_perr,
dn_ram_perr,
st_ram_perr,
// tt intf
tt_index_4va,
tt_index_4dn,
tt_index_4st,
// req ptr intf
credit_ok,
zcp_tt_index_err_lv,
tt_index,
buf_req,
wptr_HoQ_reg,
cross_q_end_reg,
cross_4KB_reg,
ring_size_reg,
ring_base_addr_reg,
reach_buf_end_reg,
total_num_buf_requested_reg,
// wb
wb_dn_reg,
wb_tt0,
//
tt_rd_en0,
tt_active,
// Zero copy specific
tcp_payld_len,
l2_hdr_len,
l3_hdr_len,
header_len,
tt_ok_reg,
buf_req_ok,
// MCP debug
TL,                     // MCP debug
S,                      // MCP debug
payload_len,            // MCP debug
header_delta,           // MCP debug
UE,                     // MCP debug
TL_bt_UE,               // MCP debug
TL_eq_UE,               // MCP debug
qual_ulp_end_fail_reg,  // MCP debug
running_anchor_seq,     // MCP debug
first_byte_buf,         // MCP debug
last_byte_buf,          // MCP debug
index0,                 // MCP debug
index1,                 // MCP debug
index2,                 // MCP debug
index3,                 // MCP debug
win_ok,                 // MCP debug
ulp_end_fail,           // MCP debug
mapped_in_fail,         // MCP debug
dmaw_threshold_fail,    // MCP debug
unmap_on_left_oc,       // MCP debug
/* ----- req_intf module ----- */
latch_rspfifo_dout,
zcp_arb1_req,
zcp_arb1_req_cmd,
zcp_arb1_req_address,
zcp_arb1_req_length,
zcp_arb1_req_port_num,
zcp_arb1_req_dma_num,
arb1_zcp_req_accept,
/* ----- rsp_intf module ----- */
rsp_accepted,
rsp_request,
rsp_ram_wr_en2,
rsp_ram_wr_data, // from barrel shifter/rotater
rsp_tt_index,
rsp_ram_mapped_in,
// req intf
rspfifo_ren3,
rspfifo_rp,
reqfifo_wp,
rrfifo_rd_data,
// META RESPONSE control info
meta_zcp_resp_ready,        // Resp Command Request
meta_zcp_resp_cmd,          // cmd
meta_zcp_resp_cmd_status,   // cmd
meta_zcp_resp_length,       // Packet Length
meta_zcp_resp_dma_num,      // Channel Number
meta_zcp_resp_client,       // bit 0
zcp_meta_resp_accept,       // bitwise client accept
// META RESPONSE data	  
meta_zcp_data,              // Transfer Data
meta_zcp_resp_byteenable,   // First/Last BE
meta_zcp_data_status,       // Transfer Data Status
meta_zcp_data_valid,        // Transfer Data Ack
meta_zcp_resp_complete,     // bitwise ZCP_CLIENT[0]
meta_zcp_resp_transfer_cmpl,// bitwise ZCP_CLIENT[0]
   /* ----- va ram module ----- */
va_dout,
va_ram_ren0,
va_ram_wen0,
va_ram_ren1,
va_ram_wen1,
va_ram_ren2,
va_ram_wen2,
va_ram_ren3,
va_ram_wen3,
va_ram_ren4,
va_ram_wen4,
va_ram_ren5,
va_ram_wen5,
va_ram_ren6,
va_ram_wen6,
va_ram_ren7,
va_ram_wen7,
   /* ----- dn ram module ----- */
// tt r/w
dn_dout,
// slv r/w
dn_ram_wen,
dn_ram_ren,
   /* ----- st ram module ----- */
st_dout,
st_ram_wen,
st_ram_ren,
`else  // N2
`endif // !ifdef NEPTUNE
// shared section
kickoff_tt_reg,
ififo_state,
tt_state,
req_load_state,
req_unload_state,
rsp_load_state,
rsp_unload_state,
ram_access_state,
// fflp wr intf
wr_data,
wr_en0,
wr_en1,
wr_en2,
wr_en3,
default_rdc,
table_rdc,
zc_rdc,
fflp_data,
zcp_debug_sel,
training_vector,
clk,
reset,
zcp_debug_port
);

   
`ifdef NEPTUNE
   /* ----- tt module ----- */
                               // error handling
   input                       va_ram_perr;
   input                       dn_ram_perr;
   input                       st_ram_perr;
                               // tt intf
   input  [11:0] 	       tt_index_4va;
   input  [11:0] 	       tt_index_4dn;
   input  [11:0] 	       tt_index_4st;
                               // req ptr intf
   input 		       credit_ok;
   input 		       zcp_tt_index_err_lv;
   input  [11:0] 	       tt_index             ;
   input  		       buf_req              ;
   input  [15:0]               wptr_HoQ_reg         ;
   input  		       cross_q_end_reg      ;
   input 		       cross_4KB_reg        ;
   input  [3:0] 	       ring_size_reg        ;
   input  [38:0] 	       ring_base_addr_reg   ;
   input  		       reach_buf_end_reg    ;
   input  [5:0] 	       total_num_buf_requested_reg;
                               // wb
   input  [`DN_R] 	       wb_dn_reg;
   input  		       wb_tt0;
                               //
   input  		       tt_rd_en0;
   input  		       tt_active;
                               // Zero copy specific
   input  [15:0] 	       tcp_payld_len;
   input  [9:0] 	       l2_hdr_len;
   input  [9:0] 	       l3_hdr_len;
   input  [9:0] 	       header_len;
   input 		       tt_ok_reg;
   input 		       buf_req_ok;
                               // MCP debug
   input  [`XPAN_TCP_SEQ_SPACE]TL;                     // MCP debug
   input  [`XPAN_TCP_SEQ_SPACE]S;                      // MCP debug
   input  [`PKT_LEN_R]         payload_len;            // MCP debug
   input  [`PKT_LEN_R]         header_delta;           // MCP debug
   input  [`XPAN_TCP_SEQ_SPACE]UE;                     // MCP debug
   input                       TL_bt_UE;               // MCP debug
   input                       TL_eq_UE;               // MCP debug
   input                       qual_ulp_end_fail_reg;  // MCP debug
   input  [`TCP_SEQ_SPACE]     running_anchor_seq;     // MCP debug
   input  [5:0]                first_byte_buf;         // MCP debug
   input  [20:0]               last_byte_buf;          // MCP debug
   input  [5:0]                index0;                 // MCP debug
   input  [5:0]                index1;                 // MCP debug
   input  [5:0]                index2;                 // MCP debug
   input  [5:0]                index3;                 // MCP debug
   input                       win_ok;                 // MCP debug
   input                       ulp_end_fail;           // MCP debug
   input                       mapped_in_fail;         // MCP debug
   input                       dmaw_threshold_fail;    // MCP debug
   input                       unmap_on_left_oc;       // MCP debug
                               /* ----- req_intf module ----- */
   input 		       latch_rspfifo_dout;
   input  		       zcp_arb1_req;
   input  [7:0] 	       zcp_arb1_req_cmd;
   input  [63:0] 	       zcp_arb1_req_address;
   input  [13:0] 	       zcp_arb1_req_length;
   input  [1:0] 	       zcp_arb1_req_port_num;
   input  [4:0] 	       zcp_arb1_req_dma_num;
   input 		       arb1_zcp_req_accept;
                               /* ----- rsp_intf module ----- */
   input 		       rsp_accepted;
   input  		       rsp_request;
   input  		       rsp_ram_wr_en2;
   input  [127:0]              rsp_ram_wr_data; // from barrel shifter/rotater
   input  [11:0] 	       rsp_tt_index;
   input  [31:0] 	       rsp_ram_mapped_in;
                               // req intf
   input 		       rspfifo_ren3;
   input  [`VAFIFO_A_PTR]      rspfifo_rp;
   input  [`VAFIFO_A_PTR]      reqfifo_wp;
   input  [`RRFIFO_W_R]        rrfifo_rd_data;
                               // META RESPONSE control info
   input 		       meta_zcp_resp_ready;        // Resp Command Request
   input  [7:0] 	       meta_zcp_resp_cmd;          // cmd
   input  [3:0] 	       meta_zcp_resp_cmd_status;   // cmd status
   input  [11:0] 	       meta_zcp_resp_length;       // Packet Length
   input  [4:0] 	       meta_zcp_resp_dma_num;      // Channel Number
   input 		       meta_zcp_resp_client;       // bit 0
   input  		       zcp_meta_resp_accept;       // bitwise client accept
                               // META RESPONSE data	  
   input  [127:0] 	       meta_zcp_data;              // Transfer Data
   input  [15:0] 	       meta_zcp_resp_byteenable;   // First/Last BE
   input  [3:0] 	       meta_zcp_data_status;       // Transfer Data Status
   input 		       meta_zcp_data_valid;        // Transfer Data Ack
   input         	       meta_zcp_resp_complete;     // bitwise ZCP_CLIENT[0]
   input         	       meta_zcp_resp_transfer_cmpl;// bitwise ZCP_CLIENT[0]
                               /* ----- va ram module ----- */
   input  [127:0] 	       va_dout;
   input  		       va_ram_ren0;
   input  		       va_ram_wen0;
   input  		       va_ram_ren1;
   input  		       va_ram_wen1;
   input  		       va_ram_ren2;
   input  		       va_ram_wen2;
   input  		       va_ram_ren3;
   input  		       va_ram_wen3;
   input  		       va_ram_ren4;
   input  		       va_ram_wen4;
   input  		       va_ram_ren5;
   input  		       va_ram_wen5;
   input  		       va_ram_ren6;
   input  		       va_ram_wen6;
   input  		       va_ram_ren7;
   input  		       va_ram_wen7;
                               /* ----- dn ram module ----- */
                                // tt r/w
   input  [`DN_R]              dn_dout;
                               // slv r/w
   input 		       dn_ram_wen;
   input 		       dn_ram_ren;
                               /* ----- st ram module ----- */
   input  [`ST_R] 	       st_dout;
   input 		       st_ram_wen;
   input 		       st_ram_ren;
`else  // N2
`endif // !ifdef NEPTUNE
                               // shared section
   input  		       kickoff_tt_reg;
   input  [2:0] 	       ififo_state;
   input  [3:0]		       tt_state;
   input  [1:0] 	       req_load_state;
   input  [1:0] 	       req_unload_state;
   input  [3:0] 	       rsp_load_state;
   input  [3:0] 	       rsp_unload_state;
   input  [2:0] 	       ram_access_state;
                               // fflp wr intf
   input  [`CFIFO_W_R] 	       wr_data;
   input  		       wr_en0;
   input  		       wr_en1;
   input  		       wr_en2;
   input  		       wr_en3;
   input  [4:0] 	       default_rdc;
   input  [4:0] 	       table_rdc;
   input  [4:0] 	       zc_rdc;
   input  [`IFIFO_W_R] 	       fflp_data;
   input  [7:0]		       zcp_debug_sel;
   input  [31:0] 	       training_vector;
   input                       clk;
   input 		       reset;
   output [`DBUG_R] 	       zcp_debug_port;




// debug
   wire   [7:0]		       zcp_debug_sel;
   wire 		       kickoff_tt_reg;
   

   
////////////////////////////////////////////////////////////   
`ifdef NEPTUNE
////////////////////////////////////////////////////////////   
/* ----- neptune specific area ----- */
   /* ----- tt module ----- */
                               // error handling
   wire                        va_ram_perr;
   wire                        dn_ram_perr;
   wire                        st_ram_perr;
                               // tt intf
   wire   [11:0] 	       tt_index_4va;
   wire   [11:0] 	       tt_index_4dn;
   wire   [11:0] 	       tt_index_4st;
                               // req ptr intf
   wire  		       credit_ok;
   wire  		       zcp_tt_index_err_lv;
   wire   [11:0] 	       tt_index             ;
   wire   		       buf_req              ;
   wire   [15:0]               wptr_HoQ_reg         ;
   wire   		       cross_q_end_reg      ;
   wire   		       cross_4KB_reg        ;
   wire   [3:0] 	       ring_size_reg        ;
   wire   [38:0] 	       ring_base_addr_reg   ;
   wire   		       reach_buf_end_reg    ;
   wire   [5:0] 	       total_num_buf_requested_reg;
                               // wb
   wire   [`DN_R] 	       wb_dn_reg;
   wire   		       wb_tt0;
                               //
   wire   		       tt_rd_en0;
   wire   		       tt_active;
                               // Zero copy specific
   wire   [15:0] 	       tcp_payld_len;
   wire   [9:0] 	       l2_hdr_len;
   wire   [9:0] 	       l3_hdr_len;
   wire   [9:0] 	       header_len;
   wire 		       tt_ok_reg;
   wire   		       buf_req_ok;
                               // MCP debug
   wire   [`XPAN_TCP_SEQ_SPACE]TL;                     // MCP debug
   wire   [`XPAN_TCP_SEQ_SPACE]S;                      // MCP debug
   wire   [`PKT_LEN_R]         payload_len;            // MCP debug
   wire   [`PKT_LEN_R]         header_delta;           // MCP debug
   wire   [`XPAN_TCP_SEQ_SPACE]UE;                     // MCP debug
   wire                        TL_bt_UE;               // MCP debug
   wire                        TL_eq_UE;               // MCP debug
   wire                        qual_ulp_end_fail_reg;  // MCP debug
   wire   [`TCP_SEQ_SPACE]     running_anchor_seq;     // MCP debug
   wire   [5:0]                first_byte_buf;         // MCP debug
   wire   [20:0]               last_byte_buf;          // MCP debug
   wire   [5:0]                index0;                 // MCP debug
   wire   [5:0]                index1;                 // MCP debug
   wire   [5:0]                index2;                 // MCP debug
   wire   [5:0]                index3;                 // MCP debug
   wire                        win_ok;                 // MCP debug
   wire                        ulp_end_fail;           // MCP debug
   wire                        mapped_in_fail;         // MCP debug
   wire                        dmaw_threshold_fail;    // MCP debug
   wire                        unmap_on_left_oc;       // MCP debug
   /* ----- req_intf module ----- */
   wire  		       latch_rspfifo_dout;
   wire   		       zcp_arb1_req;
   wire   [7:0] 	       zcp_arb1_req_cmd;
   wire   [63:0] 	       zcp_arb1_req_address;
   wire   [13:0] 	       zcp_arb1_req_length;
   wire   [1:0] 	       zcp_arb1_req_port_num;
   wire   [4:0] 	       zcp_arb1_req_dma_num;
   wire  		       arb1_zcp_req_accept;
   /* ----- rsp_intf module ----- */
   wire  		       rsp_accepted;
   wire   		       rsp_request;
   wire   		       rsp_ram_wr_en2;
   wire   [127:0]              rsp_ram_wr_data; // from barrel shifter/rotater
   wire   [11:0] 	       rsp_tt_index;
   wire   [31:0] 	       rsp_ram_mapped_in;
                               // req intf
   wire  		       rspfifo_ren3;
   wire   [`VAFIFO_A_PTR]      rspfifo_rp;
   wire   [`VAFIFO_A_PTR]      reqfifo_wp;
   wire   [`RRFIFO_W_R]        rrfifo_rd_data;
                               // META RESPONSE control info
   wire  		       meta_zcp_resp_ready;        // Resp Command Request
   wire   [7:0] 	       meta_zcp_resp_cmd;          // cmd
   wire   [3:0] 	       meta_zcp_resp_cmd_status;   // cmd status
   wire   [11:0] 	       meta_zcp_resp_length;       // Packet Length
   wire   [4:0] 	       meta_zcp_resp_dma_num;      // Channel Number
   wire  		       meta_zcp_resp_client;       // bit 0
   wire   		       zcp_meta_resp_accept;       // bitwise client accept
                               // META RESPONSE data	  
   wire   [127:0] 	       meta_zcp_data;              // Transfer Data
   wire   [15:0] 	       meta_zcp_resp_byteenable;   // First/Last BE
   wire   [3:0] 	       meta_zcp_data_status;       // Transfer Data Status
   wire  		       meta_zcp_data_valid;        // Transfer Data Ack
   wire          	       meta_zcp_resp_complete;     // bitwise ZCP_CLIENT[0]
   wire          	       meta_zcp_resp_transfer_cmpl;// bitwise ZCP_CLIENT[0]
   /* ----- va ram module ----- */
   wire   [127:0] 	       va_dout;
   wire   		       va_ram_ren0;
   wire   		       va_ram_wen0;
   wire   		       va_ram_ren1;
   wire   		       va_ram_wen1;
   wire   		       va_ram_ren2;
   wire   		       va_ram_wen2;
   wire   		       va_ram_ren3;
   wire   		       va_ram_wen3;
   wire   		       va_ram_ren4;
   wire   		       va_ram_wen4;
   wire   		       va_ram_ren5;
   wire   		       va_ram_wen5;
   wire   		       va_ram_ren6;
   wire   		       va_ram_wen6;
   wire   		       va_ram_ren7;
   wire   		       va_ram_wen7;
   /* ----- dn ram module ----- */
                               // tt r/w
   wire   [`DN_R]              dn_dout;
                               // slv r/w
   wire  		       dn_ram_wen;
   wire  		       dn_ram_ren;
   /* ----- st ram module ----- */
   wire   [`ST_R] 	       st_dout;
   wire  		       st_ram_wen;
   wire  		       st_ram_ren;

// debug_bus0 is for mcp tt signals
   reg  [31:0] 		       nx_debug_bus0;
   wire [31:0] 		       debug_bus0;
   reg  [4:0] 		       debug_sel0;
   
always @ (posedge clk)
     debug_sel0[4:0] <= zcp_debug_sel[4:0];

always @ (/*AUTOSENSE*/S or TL or TL_bt_UE or TL_eq_UE or UE
	  or buf_req_ok or debug_sel0 or dmaw_threshold_fail
	  or first_byte_buf or header_delta or index0 or index1
	  or index2 or index3 or last_byte_buf or mapped_in_fail
	  or payload_len or qual_ulp_end_fail_reg
	  or running_anchor_seq or tt_ok_reg or ulp_end_fail
	  or unmap_on_left_oc or win_ok)
 case (debug_sel0[4:0])  // synopsys parallel_case full_case infer_mux
   5'h0:     nx_debug_bus0  = TL[31:0];
   5'h1:     nx_debug_bus0  = S[31:0];
   5'h2:     nx_debug_bus0  = {payload_len[15:0],header_delta[15:0]};
   5'h3:     nx_debug_bus0  = 32'hdead_beef;
   5'h4:     nx_debug_bus0  = UE[31:0];
   5'h5:     nx_debug_bus0  = running_anchor_seq[31:0];
   5'h6:     nx_debug_bus0  = {last_byte_buf[20:0],
                              TL[32],S[32],UE[32],TL_bt_UE,
                              TL_eq_UE,
                              qual_ulp_end_fail_reg,win_ok,
                              ulp_end_fail,mapped_in_fail,
                              dmaw_threshold_fail,
                              unmap_on_left_oc};
   5'h7:     nx_debug_bus0  = {buf_req_ok,tt_ok_reg,first_byte_buf[5:0],
                               index0[5:0],index1[5:0],
			       index2[5:0],index3[5:0]};
   5'h8:     nx_debug_bus0  = 32'hdead_beef;
   default:  nx_debug_bus0  = 32'hdead_beef;
 endcase // case(debug_sel0[4:0])
   
zcp_RegDff #(32) debug_bus0_RegDff(.din(nx_debug_bus0),.clk(clk),.qout(debug_bus0));

// debug_bus1 is for non-mcp tt signals
   reg [31:0] 		      debug_bus1;
   reg [4:0] 		      debug_sel1;
always @ (posedge clk)
     debug_sel1[4:0] <= zcp_debug_sel[4:0];

always @ (posedge clk)
 case (debug_sel1[4:0])  // synopsys parallel_case full_case infer_mux
   5'h0:     debug_bus1 <= {ring_size_reg[3:0],
                            va_ram_perr,dn_ram_perr,st_ram_perr,
                            zcp_tt_index_err_lv,
			    tt_index_4dn[11:0],tt_index_4va[11:0]};
			    
   5'h1:     debug_bus1 <= {5'b0,cross_4KB_reg,wb_tt0,
                            reach_buf_end_reg,
                            tt_index[11:0],tt_index_4st[11:0]};

   5'h2:     debug_bus1 <= {ring_base_addr_reg[38:32],
                            cross_q_end_reg,credit_ok,buf_req,
                            total_num_buf_requested_reg[5:0],
                            wptr_HoQ_reg[15:0]};

   5'h3:     debug_bus1 <=  ring_base_addr_reg[31:0];
   5'h4:     debug_bus1 <=  wb_dn_reg[`W32D0];
   5'h5:     debug_bus1 <=  wb_dn_reg[`W32D1];
   5'h6:     debug_bus1 <=  wb_dn_reg[`W32D2];
   5'h7:     debug_bus1 <=  wb_dn_reg[`W32D3];
   5'h8:     debug_bus1 <= {wb_dn_reg[135:128], // 8b
                            tt_active,tt_rd_en0,wb_tt0,
                            kickoff_tt_reg,
                            l2_hdr_len[9:0],l3_hdr_len[9:0]
                           };

   5'h9:     debug_bus1 <= {6'b0,
                            header_len[9:0],
                            tcp_payld_len[15:0]};
   5'ha:     debug_bus1 <= 32'hdead_beef;
   5'hb:     debug_bus1 <= 32'hdead_beef;
   5'hc:     debug_bus1 <= va_dout[`W32D0];
   5'hd:     debug_bus1 <= va_dout[`W32D1];
   5'he:     debug_bus1 <= va_dout[`W32D2];
   5'hf:     debug_bus1 <= va_dout[`W32D3];
   5'h10:    debug_bus1 <= {12'b0,
                            dn_ram_wen,
                            dn_ram_ren,
                            st_ram_wen,
                            st_ram_ren,
                            va_ram_ren0,va_ram_wen0,
                            va_ram_ren1,va_ram_wen1,
                            va_ram_ren2,va_ram_wen2,
                            va_ram_ren3,va_ram_wen3,
                            va_ram_ren4,va_ram_wen4,
                            va_ram_ren5,va_ram_wen5,
                            va_ram_ren6,va_ram_wen6,
                            va_ram_ren7,va_ram_wen7 
                           };
   5'h11:    debug_bus1 <= dn_dout[`W32D0];
   5'h12:    debug_bus1 <= dn_dout[`W32D1];
   5'h13:    debug_bus1 <= dn_dout[`W32D2];
   5'h14:    debug_bus1 <= dn_dout[`W32D3];
   5'h15:    debug_bus1 <= {8'b0,st_dout[111:96],dn_dout[135:128]};
   5'h16:    debug_bus1 <= st_dout[`W32D0];
   5'h17:    debug_bus1 <= st_dout[`W32D1];
   5'h18:    debug_bus1 <= st_dout[`W32D2];
   default:  debug_bus1 <= 32'hdead_beef;
 endcase // case(debug_sel1[4:0])
   
// debug_bus2 is for req and rsp interface signals
   reg [31:0] 		      debug_bus2;
   reg [4:0] 		      debug_sel2;
always @ (posedge clk)
     debug_sel2[4:0] <= zcp_debug_sel[4:0];

always @ (posedge clk)
 case (debug_sel2[4:0])  // synopsys parallel_case full_case infer_mux
   5'h0:     debug_bus2 <= {
                            latch_rspfifo_dout,zcp_arb1_req,
			    zcp_arb1_req_cmd[7:0],
                            zcp_arb1_req_length[13:0],
                            zcp_arb1_req_port_num[1:0],
                            zcp_arb1_req_dma_num[4:0],
			    arb1_zcp_req_accept
                           };
   5'h1:     debug_bus2 <= zcp_arb1_req_address[31:0];
   5'h2:     debug_bus2 <= zcp_arb1_req_address[63:32];
   5'h3:     debug_bus2 <= 32'hdead_beef;
   5'h4:     debug_bus2 <= 32'hdead_beef;
   5'h5:     debug_bus2 <= {6'b0,
                            rsp_accepted,rsp_request,
			    rsp_ram_wr_en2,
                            rsp_tt_index[11:0],
                            rspfifo_ren3,
                            rspfifo_rp[`VAFIFO_A_PTR],
                            reqfifo_wp[`VAFIFO_A_PTR]
                           };
   5'h6:     debug_bus2 <=  rsp_ram_wr_data[`W32D0];
   5'h7:     debug_bus2 <=  rsp_ram_wr_data[`W32D1];
   5'h8:     debug_bus2 <=  rsp_ram_wr_data[`W32D2];
   5'h9:     debug_bus2 <=  rsp_ram_wr_data[`W32D3];
   5'ha:     debug_bus2 <=  rsp_ram_mapped_in[31:0];
   5'hb:     debug_bus2 <=  {9'b0,rrfifo_rd_data[`RRFIFO_W_R]};
   5'hc:     debug_bus2 <= {meta_zcp_resp_ready,
			    meta_zcp_resp_cmd[7:0],
			    meta_zcp_resp_cmd_status[3:0],
			    meta_zcp_resp_length[11:0],
			    meta_zcp_resp_dma_num[4:0],
			    meta_zcp_resp_client,
			    zcp_meta_resp_accept
			   };
   5'hd:     debug_bus2 <=  meta_zcp_data[`W32D0];
   5'he:     debug_bus2 <=  meta_zcp_data[`W32D1];
   5'hf:     debug_bus2 <=  meta_zcp_data[`W32D2];
   5'h10:    debug_bus2 <=  meta_zcp_data[`W32D3];
   5'h11:    debug_bus2 <= {9'b0,
                            meta_zcp_data_valid,
			    meta_zcp_resp_byteenable[15:0],
			    meta_zcp_data_status[3:0],
			    meta_zcp_resp_complete,
			    meta_zcp_resp_transfer_cmpl
			   };
   5'h1f:    debug_bus2 <=  32'hdead_beef;
   default:  debug_bus2 <=  32'hdead_beef;
 endcase // case(debug_sel2[4:0])
   

////////////////////////////////////////////////////////////   
`else  // N2
`endif // !ifdef NEPTUNE
////////////////////////////////////////////////////////////   


/* ----- common area ----- */   
   reg [31:0] 		      debug_bus3;
   reg [4:0] 		      debug_sel3;
always @ (posedge clk)
     debug_sel3[4:0] <= zcp_debug_sel[4:0];

always @ (posedge clk)
 case (debug_sel3[4:0])  // synopsys parallel_case full_case infer_mux
   5'h0:     debug_bus3 <= {10'b0,
			    ififo_state[2:0],
			    ram_access_state[2:0],  //  2b
                            rsp_unload_state[3:0],  //  4b
                            rsp_load_state[3:0],    //  4b
                            req_unload_state[1:0],  //  2b
                            req_load_state[1:0],    //  2b
                            tt_state[3:0]};         //  4b
   5'h1:     debug_bus3 <= 32'hdead_beef; // reserved
   5'h2:     debug_bus3 <= {fflp_data[`W32D0]};
   5'h3:     debug_bus3 <= {fflp_data[`W32D1]};
   5'h4:     debug_bus3 <= {fflp_data[`W32D2]};
   5'h5:     debug_bus3 <= {fflp_data[`W32D3]};
   5'h6:     debug_bus3 <= {fflp_data[`W32D4]};
   5'h7:     debug_bus3 <= {fflp_data[`W32D5]};
   5'h8:     debug_bus3 <= {7'b0,kickoff_tt_reg,fflp_data[215:192]};
   5'h9:     debug_bus3 <= {17'b0,default_rdc[4:0],table_rdc[4:0],zc_rdc[4:0]};
   5'ha:     debug_bus3 <= 32'hdead_beef; // reserved
   5'hb:     debug_bus3 <= 32'hdead_beef; // reserved
   5'he:     debug_bus3 <= 32'hdead_beef; // reserved
   5'hf:     debug_bus3 <= {wr_data[`W32D0]};  // cfifo wr_data
   5'h10:    debug_bus3 <= {wr_data[`W32D1]};  
   5'h11:    debug_bus3 <= {wr_data[`W32D2]};  
   5'h12:    debug_bus3 <= {wr_data[`W32D3]};  
   5'h13:    debug_bus3 <= {26'b0,
                            wr_data[129:128],
                            wr_en3,wr_en2,wr_en1,wr_en0};
   5'h14:    debug_bus3 <= 32'hdead_beef;  
   5'h15:    debug_bus3 <= 32'hdead_beef;  
   5'h16:    debug_bus3 <= 32'hdead_beef;  
   5'h17:    debug_bus3 <= 32'hdead_beef;  
   5'h18:    debug_bus3 <= 32'hdead_beef;  
   5'h19:    debug_bus3 <= 32'hdead_beef;  
   5'h1a:    debug_bus3 <= 32'hdead_beef;  
   5'h1b:    debug_bus3 <= 32'hdead_beef;  
   5'h1c:    debug_bus3 <= 32'hdead_beef;  
   5'h1d:    debug_bus3 <= 32'hdead_beef;  
   5'h1e:    debug_bus3 <= 32'hdead_beef;  
   5'h1f:    debug_bus3 <= 32'hdead_beef; // reserved
   default:  debug_bus3 <= 32'hdead_beef;
 endcase // case(debug_sel3[4:0])
   

////////////////////////////////////////////////
// Final Stage assembly
////////////////////////////////////////////////

   reg [31:0] 		      zcp_debug_port;

always @ (posedge clk)
  if (reset)
                zcp_debug_port <= 32'b0;
  else
    case (zcp_debug_sel[7:5])  // synopsys parallel_case full_case infer_mux
      `ifdef NEPTUNE
      3'h0:     zcp_debug_port <= debug_bus0;
      3'h1:     zcp_debug_port <= debug_bus1;
      3'h2:     zcp_debug_port <= debug_bus2;
      `else // !ifdef NEPTUNE
      `endif
      3'h3:     zcp_debug_port <= debug_bus3;
      3'h4:     zcp_debug_port <= training_vector;
      3'h5:     zcp_debug_port <=~zcp_debug_port;
      3'h6:     zcp_debug_port <= 32'hdead_beef;
      3'h7:     zcp_debug_port <= 32'hdead_beef;
      default:  zcp_debug_port <= 32'hdead_beef;
    endcase // casex(zcp_debug_sel)


endmodule // niu_zcp_debug

   
