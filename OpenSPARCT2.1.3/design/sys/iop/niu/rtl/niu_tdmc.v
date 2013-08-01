// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_tdmc.v
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
/*********************************************************************
 *
 *  NIU TDMC  Top Module
 *
 *  Orignal Author(s):   Arvind Srinivasan
 *  Modifier(s):
 *  Project(s):          Neptune
 *
 *  Copyright (c) 2004   Sun Microsystems, Inc.
 *
 *  All Rights Reserved.
 *
 *  This verilog model is the confidential and proprietary property of
 *  Sun Microsystems, Inc., and the possession or use of this model
 *  requires a written license from Sun Microsystems, Inc.
 *
 **********************************************************************/


`include "niu_dmc_reg_defines.h"
module niu_tdmc(/*AUTOJUNK*/
		// N2 Membist/SRAM Interface
		// All ifdefs to this module
		`ifdef NEPTUNE
		`else
		tcu_aclk,
		tcu_bclk,
		tcu_se_scancollar_in,
		tcu_se_scancollar_out,
		tcu_array_wr_inhibit,
		tds_tdmc_mbist_scan_in,
		tds_tdmc_mbist_scan_out,
		tcu_mbist_bisi_en,
		tcu_mbist_user_mode,
		tcu_tds_tdmc_mbist_start,
		tds_tdmc_tcu_mbist_fail,
		tds_tdmc_tcu_mbist_done,
		tcu_scan_en,
		l2clk_2x,
		iol2clk,
		hdr_sram_rvalue_tdmc,
		hdr_sram_rid_tdmc,
		hdr_sram_wr_en_tdmc,
		hdr_sram_red_clr_tdmc,
		sram_hdr_read_data_tdmc,
		tds_tcu_dmo_data_out,
		`endif // !ifdef NEPTUNE		
		`ifdef NEPTUNE
		pio_clients_32b,
		`else
		`endif
		// Outputs
		tdmc_debug_port, tdmc_arb1_req, tdmc_arb1_req_port_num, 
		tdmc_arb1_req_dma_num, tdmc_arb1_req_cmd, tdmc_arb1_req_length, 
		tdmc_arb1_req_address, dmc_meta_resp_accept, tdmc_arb1_req_func_num,
		tdmc_arb0_data_valid, tdmc_arb0_req, tdmc_arb0_transfer_complete, 
		tdmc_arb0_req_port_num, tdmc_arb0_status, tdmc_arb0_req_dma_num, 
		tdmc_arb0_req_cmd, tdmc_arb0_req_length, tdmc_arb0_req_byteenable, 
		tdmc_arb0_req_address, tdmc_arb0_data, dmc_meta_ack_accept, tdmc_arb0_req_func_num,
		tdmc_pio_ack, tdmc_pio_err, tdmc_pio_rdata,  
		tdmc_pio_intr,  dmc_txc_dma0_active, 
		dmc_txc_dma0_eoflist, dmc_txc_dma0_error, dmc_txc_dma0_gotnxtdesc, 
		dmc_txc_dma0_cacheready, dmc_txc_dma0_partial, 
		dmc_txc_dma0_reset_scheduled, dmc_txc_dma0_page_handle, 
		dmc_txc_dma0_descriptor, dmc_txc_dma1_active, 
		dmc_txc_dma1_eoflist, dmc_txc_dma1_error, dmc_txc_dma1_gotnxtdesc, 
		dmc_txc_dma1_cacheready, dmc_txc_dma1_partial, 
		dmc_txc_dma1_reset_scheduled, dmc_txc_dma1_page_handle, 
		dmc_txc_dma1_descriptor, dmc_txc_dma2_active, 
		dmc_txc_dma2_eoflist, dmc_txc_dma2_error, dmc_txc_dma2_gotnxtdesc, 
		dmc_txc_dma2_cacheready, dmc_txc_dma2_partial, 
		dmc_txc_dma2_reset_scheduled, dmc_txc_dma2_page_handle, 
		dmc_txc_dma2_descriptor, dmc_txc_dma3_active, 
		dmc_txc_dma3_eoflist, dmc_txc_dma3_error, dmc_txc_dma3_gotnxtdesc, 
		dmc_txc_dma3_cacheready, dmc_txc_dma3_partial, 
		dmc_txc_dma3_reset_scheduled, dmc_txc_dma3_page_handle, 
		dmc_txc_dma3_descriptor, dmc_txc_dma4_active, 
		dmc_txc_dma4_eoflist, dmc_txc_dma4_error, dmc_txc_dma4_gotnxtdesc, 
		dmc_txc_dma4_cacheready, dmc_txc_dma4_partial, 
		dmc_txc_dma4_reset_scheduled, dmc_txc_dma4_page_handle, 
		dmc_txc_dma4_descriptor, dmc_txc_dma5_active, 
		dmc_txc_dma5_eoflist, dmc_txc_dma5_error, dmc_txc_dma5_gotnxtdesc, 
		dmc_txc_dma5_cacheready, dmc_txc_dma5_partial, 
		dmc_txc_dma5_reset_scheduled, dmc_txc_dma5_page_handle, 
		dmc_txc_dma5_descriptor, dmc_txc_dma6_active, 
		dmc_txc_dma6_eoflist, dmc_txc_dma6_error, dmc_txc_dma6_gotnxtdesc, 
		dmc_txc_dma6_cacheready, dmc_txc_dma6_partial, 
		dmc_txc_dma6_reset_scheduled, dmc_txc_dma6_page_handle, 
		dmc_txc_dma6_descriptor, dmc_txc_dma7_active, 
		dmc_txc_dma7_eoflist, dmc_txc_dma7_error, dmc_txc_dma7_gotnxtdesc, 
		dmc_txc_dma7_cacheready, dmc_txc_dma7_partial, 
		dmc_txc_dma7_reset_scheduled, dmc_txc_dma7_page_handle, 
		dmc_txc_dma7_descriptor, dmc_txc_dma8_active, 
		dmc_txc_dma8_eoflist, dmc_txc_dma8_error, dmc_txc_dma8_gotnxtdesc, 
		dmc_txc_dma8_cacheready, dmc_txc_dma8_partial, 
		dmc_txc_dma8_reset_scheduled, dmc_txc_dma8_page_handle, 
		dmc_txc_dma8_descriptor, dmc_txc_dma9_active, 
		dmc_txc_dma9_eoflist, dmc_txc_dma9_error, dmc_txc_dma9_gotnxtdesc, 
		dmc_txc_dma9_cacheready, dmc_txc_dma9_partial, 
		dmc_txc_dma9_reset_scheduled, dmc_txc_dma9_page_handle, 
		dmc_txc_dma9_descriptor, dmc_txc_dma10_active, 
		dmc_txc_dma10_eoflist, dmc_txc_dma10_error, 
		dmc_txc_dma10_gotnxtdesc, dmc_txc_dma10_cacheready, 
		dmc_txc_dma10_partial, dmc_txc_dma10_reset_scheduled, 
		dmc_txc_dma10_page_handle, dmc_txc_dma10_descriptor, 
		dmc_txc_dma11_active, dmc_txc_dma11_eoflist, dmc_txc_dma11_error, 
		dmc_txc_dma11_gotnxtdesc, dmc_txc_dma11_cacheready, 
		dmc_txc_dma11_partial, dmc_txc_dma11_reset_scheduled, 
		dmc_txc_dma11_page_handle, dmc_txc_dma11_descriptor, 
		dmc_txc_dma12_active, dmc_txc_dma12_eoflist, dmc_txc_dma12_error, 
		dmc_txc_dma12_gotnxtdesc, dmc_txc_dma12_cacheready, 
		dmc_txc_dma12_partial, dmc_txc_dma12_reset_scheduled, 
		dmc_txc_dma12_page_handle, dmc_txc_dma12_descriptor, 
		dmc_txc_dma13_active, dmc_txc_dma13_eoflist, dmc_txc_dma13_error, 
		dmc_txc_dma13_gotnxtdesc, dmc_txc_dma13_cacheready, 
		dmc_txc_dma13_partial, dmc_txc_dma13_reset_scheduled, 
		dmc_txc_dma13_page_handle, dmc_txc_dma13_descriptor, 
		dmc_txc_dma14_active, dmc_txc_dma14_eoflist, dmc_txc_dma14_error, 
		dmc_txc_dma14_gotnxtdesc, dmc_txc_dma14_cacheready, 
		dmc_txc_dma14_partial, dmc_txc_dma14_reset_scheduled, 
		dmc_txc_dma14_page_handle, dmc_txc_dma14_descriptor, 
		dmc_txc_dma15_active, dmc_txc_dma15_eoflist, dmc_txc_dma15_error, 
		dmc_txc_dma15_gotnxtdesc, dmc_txc_dma15_cacheready, 
		dmc_txc_dma15_partial, dmc_txc_dma15_reset_scheduled, 
		dmc_txc_dma15_page_handle, dmc_txc_dma15_descriptor, 
`ifdef NEPTUNE
		dmc_txc_dma16_active, dmc_txc_dma16_eoflist, dmc_txc_dma16_error, 
		dmc_txc_dma16_gotnxtdesc, dmc_txc_dma16_cacheready, 
		dmc_txc_dma16_partial, dmc_txc_dma16_reset_scheduled, 
		dmc_txc_dma16_page_handle, dmc_txc_dma16_descriptor, 
		dmc_txc_dma17_active, dmc_txc_dma17_eoflist, dmc_txc_dma17_error, 
		dmc_txc_dma17_gotnxtdesc, dmc_txc_dma17_cacheready, 
		dmc_txc_dma17_partial, dmc_txc_dma17_reset_scheduled, 
		dmc_txc_dma17_page_handle, dmc_txc_dma17_descriptor, 
		dmc_txc_dma18_active, dmc_txc_dma18_eoflist, dmc_txc_dma18_error, 
		dmc_txc_dma18_gotnxtdesc, dmc_txc_dma18_cacheready, 
		dmc_txc_dma18_partial, dmc_txc_dma18_reset_scheduled, 
		dmc_txc_dma18_page_handle, dmc_txc_dma18_descriptor, 
		dmc_txc_dma19_active, dmc_txc_dma19_eoflist, dmc_txc_dma19_error, 
		dmc_txc_dma19_gotnxtdesc, dmc_txc_dma19_cacheready, 
		dmc_txc_dma19_partial, dmc_txc_dma19_reset_scheduled, 
		dmc_txc_dma19_page_handle, dmc_txc_dma19_descriptor, 
		dmc_txc_dma20_active, dmc_txc_dma20_eoflist, dmc_txc_dma20_error, 
		dmc_txc_dma20_gotnxtdesc, dmc_txc_dma20_cacheready, 
		dmc_txc_dma20_partial, dmc_txc_dma20_reset_scheduled, 
		dmc_txc_dma20_page_handle, dmc_txc_dma20_descriptor, 
		dmc_txc_dma21_active, dmc_txc_dma21_eoflist, dmc_txc_dma21_error, 
		dmc_txc_dma21_gotnxtdesc, dmc_txc_dma21_cacheready, 
		dmc_txc_dma21_partial, dmc_txc_dma21_reset_scheduled, 
		dmc_txc_dma21_page_handle, dmc_txc_dma21_descriptor, 
		dmc_txc_dma22_active, dmc_txc_dma22_eoflist, dmc_txc_dma22_error, 
		dmc_txc_dma22_gotnxtdesc, dmc_txc_dma22_cacheready, 
		dmc_txc_dma22_partial, dmc_txc_dma22_reset_scheduled, 
		dmc_txc_dma22_page_handle, dmc_txc_dma22_descriptor, 
		dmc_txc_dma23_active, dmc_txc_dma23_eoflist, dmc_txc_dma23_error, 
		dmc_txc_dma23_gotnxtdesc, dmc_txc_dma23_cacheready, 
		dmc_txc_dma23_partial, dmc_txc_dma23_reset_scheduled, 
		dmc_txc_dma23_page_handle, dmc_txc_dma23_descriptor, 
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
		
		dmc_txc_tx_addr_md, 
		dmc_txc_dma0_func_num, dmc_txc_dma1_func_num, dmc_txc_dma2_func_num,
		dmc_txc_dma3_func_num, dmc_txc_dma4_func_num, dmc_txc_dma5_func_num,
		dmc_txc_dma6_func_num, dmc_txc_dma7_func_num, dmc_txc_dma8_func_num,
		dmc_txc_dma9_func_num, dmc_txc_dma10_func_num, dmc_txc_dma11_func_num,
		dmc_txc_dma12_func_num, dmc_txc_dma13_func_num, dmc_txc_dma14_func_num,
		dmc_txc_dma15_func_num, 
`ifdef NEPTUNE
		dmc_txc_dma16_func_num, dmc_txc_dma17_func_num,
		dmc_txc_dma18_func_num, dmc_txc_dma19_func_num, dmc_txc_dma20_func_num,
		dmc_txc_dma21_func_num, dmc_txc_dma22_func_num, dmc_txc_dma23_func_num,
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
		
		// Inputs
		niu_clk, niu_reset_l,  arb1_tdmc_req_accept, 
		meta_dmc_resp_ready, meta_dmc_resp_client, 
		meta_dmc_resp_complete, meta_dmc_resp_transfer_cmpl, 
		meta_dmc_data_valid, 
		meta_dmc_resp_dma_num, 
		meta_dmc_resp_length, meta_dmc_resp_byteenable, 
		meta_dmc_resp_address, meta_dmc_data, meta_dmc_resp_cmd, 
		meta_dmc_resp_cmd_status, meta_dmc_data_status,meta_dmc_ack_cmd_status,
		arb0_tdmc_data_req, arb0_tdmc_req_accept,  
		meta_dmc_ack_ready, meta_dmc_ack_client, meta_dmc_ack_complete, 
		meta_dmc_ack_dma_num, meta_dmc_ack_cmd, pio_clients_rd, 
		pio_tdmc_sel, pio_clients_addr, pio_clients_wdata, 
		txc_dmc_dma0_getnxtdesc, 
		txc_dmc_dma0_inc_head, txc_dmc_dma0_reset_done, 
		txc_dmc_dma0_mark_bit, txc_dmc_dma0_inc_pkt_cnt, 
		txc_dmc_dma1_getnxtdesc, 
		txc_dmc_dma1_inc_head, txc_dmc_dma1_reset_done, 
		txc_dmc_dma1_mark_bit, txc_dmc_dma1_inc_pkt_cnt, 
		txc_dmc_dma2_getnxtdesc, 
		txc_dmc_dma2_inc_head, txc_dmc_dma2_reset_done, 
		txc_dmc_dma2_mark_bit, txc_dmc_dma2_inc_pkt_cnt, 
		txc_dmc_dma3_getnxtdesc, 
		txc_dmc_dma3_inc_head, txc_dmc_dma3_reset_done, 
		txc_dmc_dma3_mark_bit, txc_dmc_dma3_inc_pkt_cnt, 
		txc_dmc_dma4_getnxtdesc, 
		txc_dmc_dma4_inc_head, txc_dmc_dma4_reset_done, 
		txc_dmc_dma4_mark_bit, txc_dmc_dma4_inc_pkt_cnt, 
		txc_dmc_dma5_getnxtdesc, 
		txc_dmc_dma5_inc_head, txc_dmc_dma5_reset_done, 
		txc_dmc_dma5_mark_bit, txc_dmc_dma5_inc_pkt_cnt, 
		txc_dmc_dma6_getnxtdesc, 
		txc_dmc_dma6_inc_head, txc_dmc_dma6_reset_done, 
		txc_dmc_dma6_mark_bit, txc_dmc_dma6_inc_pkt_cnt, 
		txc_dmc_dma7_getnxtdesc, 
		txc_dmc_dma7_inc_head, txc_dmc_dma7_reset_done, 
		txc_dmc_dma7_mark_bit, txc_dmc_dma7_inc_pkt_cnt, 
		txc_dmc_dma8_getnxtdesc, 
		txc_dmc_dma8_inc_head, txc_dmc_dma8_reset_done, 
		txc_dmc_dma8_mark_bit, txc_dmc_dma8_inc_pkt_cnt, 
		txc_dmc_dma9_getnxtdesc, 
		txc_dmc_dma9_inc_head, txc_dmc_dma9_reset_done, 
		txc_dmc_dma9_mark_bit, txc_dmc_dma9_inc_pkt_cnt, 
		txc_dmc_dma10_getnxtdesc, 
		txc_dmc_dma10_inc_head, txc_dmc_dma10_reset_done, 
		txc_dmc_dma10_mark_bit, txc_dmc_dma10_inc_pkt_cnt, 
		txc_dmc_dma11_getnxtdesc, 
		txc_dmc_dma11_inc_head, txc_dmc_dma11_reset_done, 
		txc_dmc_dma11_mark_bit, txc_dmc_dma11_inc_pkt_cnt, 
		txc_dmc_dma12_getnxtdesc, 
		txc_dmc_dma12_inc_head, txc_dmc_dma12_reset_done, 
		txc_dmc_dma12_mark_bit, txc_dmc_dma12_inc_pkt_cnt, 
		txc_dmc_dma13_getnxtdesc, 
		txc_dmc_dma13_inc_head, txc_dmc_dma13_reset_done, 
		txc_dmc_dma13_mark_bit, txc_dmc_dma13_inc_pkt_cnt, 
		txc_dmc_dma14_getnxtdesc, 
		txc_dmc_dma14_inc_head, txc_dmc_dma14_reset_done, 
		txc_dmc_dma14_mark_bit, txc_dmc_dma14_inc_pkt_cnt, 
		txc_dmc_dma15_getnxtdesc, 
		txc_dmc_dma15_inc_head, txc_dmc_dma15_reset_done, 
		txc_dmc_dma15_mark_bit, txc_dmc_dma15_inc_pkt_cnt, 
`ifdef NEPTUNE
		txc_dmc_dma16_getnxtdesc, 
		txc_dmc_dma16_inc_head, txc_dmc_dma16_reset_done, 
		txc_dmc_dma16_mark_bit, txc_dmc_dma16_inc_pkt_cnt, 
		txc_dmc_dma17_getnxtdesc, 
		txc_dmc_dma17_inc_head, txc_dmc_dma17_reset_done, 
		txc_dmc_dma17_mark_bit, txc_dmc_dma17_inc_pkt_cnt, 
		txc_dmc_dma18_getnxtdesc, 
		txc_dmc_dma18_inc_head, txc_dmc_dma18_reset_done, 
		txc_dmc_dma18_mark_bit, txc_dmc_dma18_inc_pkt_cnt, 
		txc_dmc_dma19_getnxtdesc, 
		txc_dmc_dma19_inc_head, txc_dmc_dma19_reset_done, 
		txc_dmc_dma19_mark_bit, txc_dmc_dma19_inc_pkt_cnt, 
		txc_dmc_dma20_getnxtdesc, 
		txc_dmc_dma20_inc_head, txc_dmc_dma20_reset_done, 
		txc_dmc_dma20_mark_bit, txc_dmc_dma20_inc_pkt_cnt, 
		txc_dmc_dma21_getnxtdesc, 
		txc_dmc_dma21_inc_head, txc_dmc_dma21_reset_done, 
		txc_dmc_dma21_mark_bit, txc_dmc_dma21_inc_pkt_cnt, 
		txc_dmc_dma22_getnxtdesc, 
		txc_dmc_dma22_inc_head, txc_dmc_dma22_reset_done, 
		txc_dmc_dma22_mark_bit, txc_dmc_dma22_inc_pkt_cnt, 
		txc_dmc_dma23_getnxtdesc, 
		txc_dmc_dma23_inc_head, txc_dmc_dma23_reset_done, 
		txc_dmc_dma23_mark_bit, txc_dmc_dma23_inc_pkt_cnt, 
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE

                txc_dmc_p0_pkt_size_err_addr, txc_dmc_p0_dma_pkt_size_err,
		txc_dmc_p0_pkt_size_err, 
                txc_dmc_p1_pkt_size_err_addr, txc_dmc_p1_dma_pkt_size_err,
		txc_dmc_p1_pkt_size_err, 
`ifdef NEPTUNE
		txc_dmc_p2_pkt_size_err_addr, txc_dmc_p2_dma_pkt_size_err,
		txc_dmc_p2_pkt_size_err, 
                txc_dmc_p3_pkt_size_err_addr, txc_dmc_p3_dma_pkt_size_err,
		txc_dmc_p3_pkt_size_err, 
`else
`endif

		txc_dmc_dma_nack_pkt_rd, txc_dmc_nack_pkt_rd_addr, 
		txc_dmc_nack_pkt_rd
		);
   // Global Signals
   input          niu_clk;
   input 	  niu_reset_l;
   output [31:0]  tdmc_debug_port;


   // Any ifdef in the ports --

   `ifdef NEPTUNE
   input 	  pio_clients_32b;
   `else
   `endif // !ifdef NEPTUNE
   
   `ifdef NEPTUNE
   `else
   input 	  tcu_aclk;
   input 	  tcu_bclk;
   input 	  tcu_se_scancollar_in;
   input 	  tcu_se_scancollar_out;
   input 	  tcu_array_wr_inhibit;
   input 	  tcu_scan_en;

   input 	  tds_tdmc_mbist_scan_in;
   output 	  tds_tdmc_mbist_scan_out;
   input 	  tcu_mbist_user_mode;


   input 	  tcu_tds_tdmc_mbist_start; 
   input 	  tcu_mbist_bisi_en;
   output 	  tds_tdmc_tcu_mbist_fail;
   output 	  tds_tdmc_tcu_mbist_done;
   input 	  l2clk_2x;
   input 	  iol2clk;

   input [6:0] 	  hdr_sram_rvalue_tdmc;
   input [1:0] 	  hdr_sram_rid_tdmc;
   input 	  hdr_sram_wr_en_tdmc;
   input 	  hdr_sram_red_clr_tdmc;
   output [6:0]   sram_hdr_read_data_tdmc;
   output [39:0]  tds_tcu_dmo_data_out;
   
   `endif // !ifdef NEPTUNE

   
   // TDMC Meta I/F Output

   output 	  tdmc_arb1_req;                      // Req Command Request
   output [1:0]   tdmc_arb1_req_port_num;                 // Port Number
   output [4:0]   tdmc_arb1_req_dma_num;                  // Channel Number
   output [7:0]   tdmc_arb1_req_cmd;                  // Command Request
   output [13:0]  tdmc_arb1_req_length;                   // Packet Length
   output [63:0]  tdmc_arb1_req_address;                  // Memory Address
   output 	  dmc_meta_resp_accept;
   output [1:0]   tdmc_arb1_req_func_num;

   input 	  arb1_tdmc_req_accept;               // Response to REQ
   input 	  meta_dmc_resp_ready;
   input 	  meta_dmc_resp_client;
   input 	  meta_dmc_resp_complete;
   input 	  meta_dmc_resp_transfer_cmpl;
   input 	  meta_dmc_data_valid;
   input [4:0] 	  meta_dmc_resp_dma_num;
   input [13:0]   meta_dmc_resp_length;
   input [15:0]   meta_dmc_resp_byteenable;
   input [63:0]   meta_dmc_resp_address;
   input [127:0]  meta_dmc_data;       
   input [7:0] 	  meta_dmc_resp_cmd;
   input [3:0] 	  meta_dmc_resp_cmd_status;
   input [3:0] 	  meta_dmc_data_status;


   output 	  tdmc_arb0_data_valid;         // Transfer Data Ack
   output 	  tdmc_arb0_req;                // Req Command Request
   output 	  tdmc_arb0_transfer_complete;  // Transfer Data Complete
   output [1:0]   tdmc_arb0_req_port_num;       // Port Number
   output [3:0]   tdmc_arb0_status;             // Transfer Data Status
   output [4:0]   tdmc_arb0_req_dma_num;        // Channel Number
   output [7:0]   tdmc_arb0_req_cmd;            // Command Request
   output [13:0]  tdmc_arb0_req_length;         // Packet Length
   output [15:0]  tdmc_arb0_req_byteenable;     // First/Last BE
   output [63:0]  tdmc_arb0_req_address;        // Memory Address
   output [127:0] tdmc_arb0_data;               // Transfer Data
   output [1:0]   tdmc_arb0_req_func_num;

   output 	  dmc_meta_ack_accept       ; 

   input 	  arb0_tdmc_data_req;           // Memory line request
   input 	  arb0_tdmc_req_accept;         // Response to REQ

   input 	  meta_dmc_ack_ready ;      
   input 	  meta_dmc_ack_client        ;
   input 	  meta_dmc_ack_complete      ;
   input [4:0] 	  meta_dmc_ack_dma_num ; 
   input [7:0] 	  meta_dmc_ack_cmd  ;

   input [3:0] 	  meta_dmc_ack_cmd_status;
   


   // PIO I/F Outputs
   output 	  tdmc_pio_ack;                        // pio read data ack
   output 	  tdmc_pio_err;                        // pio read data error
   output [63:0]  tdmc_pio_rdata;                      // pio read data
   output [63:0]  tdmc_pio_intr;
   // PIO I/F Inputs
   input 	  pio_clients_rd;                     // pio read
   input 	  pio_tdmc_sel;                        // pio DMC select
   input [19:0]   pio_clients_addr;                   // pio address
   input [63:0]   pio_clients_wdata;                  // pio write data





   // TXC Interface - 
   

   // DMA0 TXC Interface
   input 	  txc_dmc_dma0_getnxtdesc;
   input 	  txc_dmc_dma0_inc_head;
   input 	  txc_dmc_dma0_reset_done;
   input 	  txc_dmc_dma0_mark_bit;
   input 	  txc_dmc_dma0_inc_pkt_cnt; 

   output 	  dmc_txc_dma0_active;
   output 	  dmc_txc_dma0_eoflist;
   output 	  dmc_txc_dma0_error;
   output 	  dmc_txc_dma0_gotnxtdesc;
   output 	  dmc_txc_dma0_cacheready;
   output 	  dmc_txc_dma0_partial;
   output 	  dmc_txc_dma0_reset_scheduled;
   output [19:0]  dmc_txc_dma0_page_handle;
   output [63:0]  dmc_txc_dma0_descriptor;

   // DMA1 TXC Interface
   input 	  txc_dmc_dma1_getnxtdesc;
   input 	  txc_dmc_dma1_inc_head;
   input 	  txc_dmc_dma1_reset_done;
   input 	  txc_dmc_dma1_mark_bit;
   input 	  txc_dmc_dma1_inc_pkt_cnt; 

   output 	  dmc_txc_dma1_active;
   output 	  dmc_txc_dma1_eoflist;
   output 	  dmc_txc_dma1_error;
   output 	  dmc_txc_dma1_gotnxtdesc;
   output 	  dmc_txc_dma1_cacheready;
   output 	  dmc_txc_dma1_partial;
   output 	  dmc_txc_dma1_reset_scheduled;
   output [19:0]  dmc_txc_dma1_page_handle;
   output [63:0]  dmc_txc_dma1_descriptor;

   // DMA2 TXC Interface
   input 	  txc_dmc_dma2_getnxtdesc;
   input 	  txc_dmc_dma2_inc_head;
   input 	  txc_dmc_dma2_reset_done;
   input 	  txc_dmc_dma2_mark_bit;
   input 	  txc_dmc_dma2_inc_pkt_cnt; 

   output 	  dmc_txc_dma2_active;
   output 	  dmc_txc_dma2_eoflist;
   output 	  dmc_txc_dma2_error;
   output 	  dmc_txc_dma2_gotnxtdesc;
   output 	  dmc_txc_dma2_cacheready;
   output 	  dmc_txc_dma2_partial;
   output 	  dmc_txc_dma2_reset_scheduled;
   output [19:0]  dmc_txc_dma2_page_handle;
   output [63:0]  dmc_txc_dma2_descriptor;

   // DMA3 TXC Interface
   input 	  txc_dmc_dma3_getnxtdesc;
   input 	  txc_dmc_dma3_inc_head;
   input 	  txc_dmc_dma3_reset_done;
   input 	  txc_dmc_dma3_mark_bit;
   input 	  txc_dmc_dma3_inc_pkt_cnt; 

   output 	  dmc_txc_dma3_active;
   output 	  dmc_txc_dma3_eoflist;
   output 	  dmc_txc_dma3_error;
   output 	  dmc_txc_dma3_gotnxtdesc;
   output 	  dmc_txc_dma3_cacheready;
   output 	  dmc_txc_dma3_partial;
   output 	  dmc_txc_dma3_reset_scheduled;
   output [19:0]  dmc_txc_dma3_page_handle;
   output [63:0]  dmc_txc_dma3_descriptor;

   // DMA4 TXC Interface
   input 	  txc_dmc_dma4_getnxtdesc;
   input 	  txc_dmc_dma4_inc_head;
   input 	  txc_dmc_dma4_reset_done;
   input 	  txc_dmc_dma4_mark_bit;
   input 	  txc_dmc_dma4_inc_pkt_cnt; 

   output 	  dmc_txc_dma4_active;
   output 	  dmc_txc_dma4_eoflist;
   output 	  dmc_txc_dma4_error;
   output 	  dmc_txc_dma4_gotnxtdesc;
   output 	  dmc_txc_dma4_cacheready;
   output 	  dmc_txc_dma4_partial;
   output 	  dmc_txc_dma4_reset_scheduled;
   output [19:0]  dmc_txc_dma4_page_handle;
   output [63:0]  dmc_txc_dma4_descriptor;

   // DMA5 TXC Interface
   input 	  txc_dmc_dma5_getnxtdesc;
   input 	  txc_dmc_dma5_inc_head;
   input 	  txc_dmc_dma5_reset_done;
   input 	  txc_dmc_dma5_mark_bit;
   input 	  txc_dmc_dma5_inc_pkt_cnt; 

   output 	  dmc_txc_dma5_active;
   output 	  dmc_txc_dma5_eoflist;
   output 	  dmc_txc_dma5_error;
   output 	  dmc_txc_dma5_gotnxtdesc;
   output 	  dmc_txc_dma5_cacheready;
   output 	  dmc_txc_dma5_partial;
   output 	  dmc_txc_dma5_reset_scheduled;
   output [19:0]  dmc_txc_dma5_page_handle;
   output [63:0]  dmc_txc_dma5_descriptor;

   // DMA6 TXC Interface
   input 	  txc_dmc_dma6_getnxtdesc;
   input 	  txc_dmc_dma6_inc_head;
   input 	  txc_dmc_dma6_reset_done;
   input 	  txc_dmc_dma6_mark_bit;
   input 	  txc_dmc_dma6_inc_pkt_cnt; 

   output 	  dmc_txc_dma6_active;
   output 	  dmc_txc_dma6_eoflist;
   output 	  dmc_txc_dma6_error;
   output 	  dmc_txc_dma6_gotnxtdesc;
   output 	  dmc_txc_dma6_cacheready;
   output 	  dmc_txc_dma6_partial;
   output 	  dmc_txc_dma6_reset_scheduled;
   output [19:0]  dmc_txc_dma6_page_handle;
   output [63:0]  dmc_txc_dma6_descriptor;

   // DMA7 TXC Interface
   input 	  txc_dmc_dma7_getnxtdesc;
   input 	  txc_dmc_dma7_inc_head;
   input 	  txc_dmc_dma7_reset_done;
   input 	  txc_dmc_dma7_mark_bit;
   input 	  txc_dmc_dma7_inc_pkt_cnt; 

   output 	  dmc_txc_dma7_active;
   output 	  dmc_txc_dma7_eoflist;
   output 	  dmc_txc_dma7_error;
   output 	  dmc_txc_dma7_gotnxtdesc;
   output 	  dmc_txc_dma7_cacheready;
   output 	  dmc_txc_dma7_partial;
   output 	  dmc_txc_dma7_reset_scheduled;
   output [19:0]  dmc_txc_dma7_page_handle;
   output [63:0]  dmc_txc_dma7_descriptor;

   // DMA8 TXC Interface
   input 	  txc_dmc_dma8_getnxtdesc;
   input 	  txc_dmc_dma8_inc_head;
   input 	  txc_dmc_dma8_reset_done;
   input 	  txc_dmc_dma8_mark_bit;
   input 	  txc_dmc_dma8_inc_pkt_cnt; 

   output 	  dmc_txc_dma8_active;
   output 	  dmc_txc_dma8_eoflist;
   output 	  dmc_txc_dma8_error;
   output 	  dmc_txc_dma8_gotnxtdesc;
   output 	  dmc_txc_dma8_cacheready;
   output 	  dmc_txc_dma8_partial;
   output 	  dmc_txc_dma8_reset_scheduled;
   output [19:0]  dmc_txc_dma8_page_handle;
   output [63:0]  dmc_txc_dma8_descriptor;

   // DMA9 TXC Interface
   input 	  txc_dmc_dma9_getnxtdesc;
   input 	  txc_dmc_dma9_inc_head;
   input 	  txc_dmc_dma9_reset_done;
   input 	  txc_dmc_dma9_mark_bit;
   input 	  txc_dmc_dma9_inc_pkt_cnt; 

   output 	  dmc_txc_dma9_active;
   output 	  dmc_txc_dma9_eoflist;
   output 	  dmc_txc_dma9_error;
   output 	  dmc_txc_dma9_gotnxtdesc;
   output 	  dmc_txc_dma9_cacheready;
   output 	  dmc_txc_dma9_partial;
   output 	  dmc_txc_dma9_reset_scheduled;
   output [19:0]  dmc_txc_dma9_page_handle;
   output [63:0]  dmc_txc_dma9_descriptor;

   // DMA10 TXC Interface
   input 	  txc_dmc_dma10_getnxtdesc;
   input 	  txc_dmc_dma10_inc_head;
   input 	  txc_dmc_dma10_reset_done;
   input 	  txc_dmc_dma10_mark_bit;
   input 	  txc_dmc_dma10_inc_pkt_cnt; 

   output 	  dmc_txc_dma10_active;
   output 	  dmc_txc_dma10_eoflist;
   output 	  dmc_txc_dma10_error;
   output 	  dmc_txc_dma10_gotnxtdesc;
   output 	  dmc_txc_dma10_cacheready;
   output 	  dmc_txc_dma10_partial;
   output 	  dmc_txc_dma10_reset_scheduled;
   output [19:0]  dmc_txc_dma10_page_handle;
   output [63:0]  dmc_txc_dma10_descriptor;

   // DMA11 TXC Interface
   input 	  txc_dmc_dma11_getnxtdesc;
   input 	  txc_dmc_dma11_inc_head;
   input 	  txc_dmc_dma11_reset_done;
   input 	  txc_dmc_dma11_mark_bit;
   input 	  txc_dmc_dma11_inc_pkt_cnt; 

   output 	  dmc_txc_dma11_active;
   output 	  dmc_txc_dma11_eoflist;
   output 	  dmc_txc_dma11_error;
   output 	  dmc_txc_dma11_gotnxtdesc;
   output 	  dmc_txc_dma11_cacheready;
   output 	  dmc_txc_dma11_partial;
   output 	  dmc_txc_dma11_reset_scheduled;
   output [19:0]  dmc_txc_dma11_page_handle;
   output [63:0]  dmc_txc_dma11_descriptor;

   // DMA12 TXC Interface
   input 	  txc_dmc_dma12_getnxtdesc;
   input 	  txc_dmc_dma12_inc_head;
   input 	  txc_dmc_dma12_reset_done;
   input 	  txc_dmc_dma12_mark_bit;
   input 	  txc_dmc_dma12_inc_pkt_cnt; 

   output 	  dmc_txc_dma12_active;
   output 	  dmc_txc_dma12_eoflist;
   output 	  dmc_txc_dma12_error;
   output 	  dmc_txc_dma12_gotnxtdesc;
   output 	  dmc_txc_dma12_cacheready;
   output 	  dmc_txc_dma12_partial;
   output 	  dmc_txc_dma12_reset_scheduled;
   output [19:0]  dmc_txc_dma12_page_handle;
   output [63:0]  dmc_txc_dma12_descriptor;

   // DMA13 TXC Interface
   input 	  txc_dmc_dma13_getnxtdesc;
   input 	  txc_dmc_dma13_inc_head;
   input 	  txc_dmc_dma13_reset_done;
   input 	  txc_dmc_dma13_mark_bit;
   input 	  txc_dmc_dma13_inc_pkt_cnt; 

   output 	  dmc_txc_dma13_active;
   output 	  dmc_txc_dma13_eoflist;
   output 	  dmc_txc_dma13_error;
   output 	  dmc_txc_dma13_gotnxtdesc;
   output 	  dmc_txc_dma13_cacheready;
   output 	  dmc_txc_dma13_partial;
   output 	  dmc_txc_dma13_reset_scheduled;
   output [19:0]  dmc_txc_dma13_page_handle;
   output [63:0]  dmc_txc_dma13_descriptor;

   // DMA14 TXC Interface
   input 	  txc_dmc_dma14_getnxtdesc;
   input 	  txc_dmc_dma14_inc_head;
   input 	  txc_dmc_dma14_reset_done;
   input 	  txc_dmc_dma14_mark_bit;
   input 	  txc_dmc_dma14_inc_pkt_cnt; 

   output 	  dmc_txc_dma14_active;
   output 	  dmc_txc_dma14_eoflist;
   output 	  dmc_txc_dma14_error;
   output 	  dmc_txc_dma14_gotnxtdesc;
   output 	  dmc_txc_dma14_cacheready;
   output 	  dmc_txc_dma14_partial;
   output 	  dmc_txc_dma14_reset_scheduled;
   output [19:0]  dmc_txc_dma14_page_handle;
   output [63:0]  dmc_txc_dma14_descriptor;

   // DMA15 TXC Interface
   input 	  txc_dmc_dma15_getnxtdesc;
   input 	  txc_dmc_dma15_inc_head;
   input 	  txc_dmc_dma15_reset_done;
   input 	  txc_dmc_dma15_mark_bit;
   input 	  txc_dmc_dma15_inc_pkt_cnt; 

   output 	  dmc_txc_dma15_active;
   output 	  dmc_txc_dma15_eoflist;
   output 	  dmc_txc_dma15_error;
   output 	  dmc_txc_dma15_gotnxtdesc;
   output 	  dmc_txc_dma15_cacheready;
   output 	  dmc_txc_dma15_partial;
   output 	  dmc_txc_dma15_reset_scheduled;
   output [19:0]  dmc_txc_dma15_page_handle;
   output [63:0]  dmc_txc_dma15_descriptor;

`ifdef NEPTUNE
   // DMA16 TXC Interface
   input 	  txc_dmc_dma16_getnxtdesc;
   input 	  txc_dmc_dma16_inc_head;
   input 	  txc_dmc_dma16_reset_done;
   input 	  txc_dmc_dma16_mark_bit;
   input 	  txc_dmc_dma16_inc_pkt_cnt; 

   output 	  dmc_txc_dma16_active;
   output 	  dmc_txc_dma16_eoflist;
   output 	  dmc_txc_dma16_error;
   output 	  dmc_txc_dma16_gotnxtdesc;
   output 	  dmc_txc_dma16_cacheready;
   output 	  dmc_txc_dma16_partial;
   output 	  dmc_txc_dma16_reset_scheduled;
   output [19:0]  dmc_txc_dma16_page_handle;
   output [63:0]  dmc_txc_dma16_descriptor;

   // DMA17 TXC Interface
   input 	  txc_dmc_dma17_getnxtdesc;
   input 	  txc_dmc_dma17_inc_head;
   input 	  txc_dmc_dma17_reset_done;
   input 	  txc_dmc_dma17_mark_bit;
   input 	  txc_dmc_dma17_inc_pkt_cnt; 

   output 	  dmc_txc_dma17_active;
   output 	  dmc_txc_dma17_eoflist;
   output 	  dmc_txc_dma17_error;
   output 	  dmc_txc_dma17_gotnxtdesc;
   output 	  dmc_txc_dma17_cacheready;
   output 	  dmc_txc_dma17_partial;
   output 	  dmc_txc_dma17_reset_scheduled;
   output [19:0]  dmc_txc_dma17_page_handle;
   output [63:0]  dmc_txc_dma17_descriptor;

   // DMA18 TXC Interface
   input 	  txc_dmc_dma18_getnxtdesc;
   input 	  txc_dmc_dma18_inc_head;
   input 	  txc_dmc_dma18_reset_done;
   input 	  txc_dmc_dma18_mark_bit;
   input 	  txc_dmc_dma18_inc_pkt_cnt; 

   output 	  dmc_txc_dma18_active;
   output 	  dmc_txc_dma18_eoflist;
   output 	  dmc_txc_dma18_error;
   output 	  dmc_txc_dma18_gotnxtdesc;
   output 	  dmc_txc_dma18_cacheready;
   output 	  dmc_txc_dma18_partial;
   output 	  dmc_txc_dma18_reset_scheduled;
   output [19:0]  dmc_txc_dma18_page_handle;
   output [63:0]  dmc_txc_dma18_descriptor;

   // DMA19 TXC Interface
   input 	  txc_dmc_dma19_getnxtdesc;
   input 	  txc_dmc_dma19_inc_head;
   input 	  txc_dmc_dma19_reset_done;
   input 	  txc_dmc_dma19_mark_bit;
   input 	  txc_dmc_dma19_inc_pkt_cnt; 

   output 	  dmc_txc_dma19_active;
   output 	  dmc_txc_dma19_eoflist;
   output 	  dmc_txc_dma19_error;
   output 	  dmc_txc_dma19_gotnxtdesc;
   output 	  dmc_txc_dma19_cacheready;
   output 	  dmc_txc_dma19_partial;
   output 	  dmc_txc_dma19_reset_scheduled;
   output [19:0]  dmc_txc_dma19_page_handle;
   output [63:0]  dmc_txc_dma19_descriptor;

   // DMA20 TXC Interface
   input 	  txc_dmc_dma20_getnxtdesc;
   input 	  txc_dmc_dma20_inc_head;
   input 	  txc_dmc_dma20_reset_done;
   input 	  txc_dmc_dma20_mark_bit;
   input 	  txc_dmc_dma20_inc_pkt_cnt; 

   output 	  dmc_txc_dma20_active;
   output 	  dmc_txc_dma20_eoflist;
   output 	  dmc_txc_dma20_error;
   output 	  dmc_txc_dma20_gotnxtdesc;
   output 	  dmc_txc_dma20_cacheready;
   output 	  dmc_txc_dma20_partial;
   output 	  dmc_txc_dma20_reset_scheduled;
   output [19:0]  dmc_txc_dma20_page_handle;
   output [63:0]  dmc_txc_dma20_descriptor;

   // DMA21 TXC Interface
   input 	  txc_dmc_dma21_getnxtdesc;
   input 	  txc_dmc_dma21_inc_head;
   input 	  txc_dmc_dma21_reset_done;
   input 	  txc_dmc_dma21_mark_bit;
   input 	  txc_dmc_dma21_inc_pkt_cnt; 

   output 	  dmc_txc_dma21_active;
   output 	  dmc_txc_dma21_eoflist;
   output 	  dmc_txc_dma21_error;
   output 	  dmc_txc_dma21_gotnxtdesc;
   output 	  dmc_txc_dma21_cacheready;
   output 	  dmc_txc_dma21_partial;
   output 	  dmc_txc_dma21_reset_scheduled;
   output [19:0]  dmc_txc_dma21_page_handle;
   output [63:0]  dmc_txc_dma21_descriptor;

   // DMA22 TXC Interface
   input 	  txc_dmc_dma22_getnxtdesc;
   input 	  txc_dmc_dma22_inc_head;
   input 	  txc_dmc_dma22_reset_done;
   input 	  txc_dmc_dma22_mark_bit;
   input 	  txc_dmc_dma22_inc_pkt_cnt; 

   output 	  dmc_txc_dma22_active;
   output 	  dmc_txc_dma22_eoflist;
   output 	  dmc_txc_dma22_error;
   output 	  dmc_txc_dma22_gotnxtdesc;
   output 	  dmc_txc_dma22_cacheready;
   output 	  dmc_txc_dma22_partial;
   output 	  dmc_txc_dma22_reset_scheduled;
   output [19:0]  dmc_txc_dma22_page_handle;
   output [63:0]  dmc_txc_dma22_descriptor;

   // DMA23 TXC Interface
   input 	  txc_dmc_dma23_getnxtdesc;
   input 	  txc_dmc_dma23_inc_head;
   input 	  txc_dmc_dma23_reset_done;
   input 	  txc_dmc_dma23_mark_bit;
   input 	  txc_dmc_dma23_inc_pkt_cnt; 

   output 	  dmc_txc_dma23_active;
   output 	  dmc_txc_dma23_eoflist;
   output 	  dmc_txc_dma23_error;
   output 	  dmc_txc_dma23_gotnxtdesc;
   output 	  dmc_txc_dma23_cacheready;
   output 	  dmc_txc_dma23_partial;
   output 	  dmc_txc_dma23_reset_scheduled;
   output [19:0]  dmc_txc_dma23_page_handle;
   output [63:0]  dmc_txc_dma23_descriptor;


`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
   

   output [1:0]   dmc_txc_dma0_func_num;
   output [1:0]  dmc_txc_dma1_func_num;
   output [1:0]  dmc_txc_dma2_func_num;
   output [1:0]  dmc_txc_dma3_func_num;
   output [1:0]  dmc_txc_dma4_func_num;
   output [1:0]  dmc_txc_dma5_func_num;
   output [1:0]  dmc_txc_dma6_func_num;
   output [1:0]  dmc_txc_dma7_func_num;
   output [1:0]  dmc_txc_dma8_func_num;
   output [1:0]  dmc_txc_dma9_func_num;
   output [1:0]  dmc_txc_dma10_func_num;
   output [1:0]  dmc_txc_dma11_func_num;
   output [1:0]  dmc_txc_dma12_func_num;
   output [1:0]  dmc_txc_dma13_func_num;
   output [1:0]  dmc_txc_dma14_func_num;
   output [1:0]  dmc_txc_dma15_func_num;
`ifdef NEPTUNE
   output [1:0]  dmc_txc_dma16_func_num;
   output [1:0]  dmc_txc_dma17_func_num;
   output [1:0]  dmc_txc_dma18_func_num;
   output [1:0]  dmc_txc_dma19_func_num;
   output [1:0]  dmc_txc_dma20_func_num;
   output [1:0]  dmc_txc_dma21_func_num;
   output [1:0]  dmc_txc_dma22_func_num;
   output [1:0]  dmc_txc_dma23_func_num;
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE




   output 	  dmc_txc_tx_addr_md; // 1 would indicate 32bit addressing mode
   
   // TXC- TDMC -Error Interface
   input [`NO_OF_DMAS - 1:0] txc_dmc_dma_nack_pkt_rd; 
   input [43:0] 	     txc_dmc_nack_pkt_rd_addr;
   input 		     txc_dmc_nack_pkt_rd; // pulse to indicate error

   
   input [`NO_OF_DMAS - 1:0] txc_dmc_p0_dma_pkt_size_err; // one-hot encoded
   input [43:0] 	     txc_dmc_p0_pkt_size_err_addr;
   input 		     txc_dmc_p0_pkt_size_err;  // pulse to indicate error
   
   
   input [`NO_OF_DMAS - 1:0] txc_dmc_p1_dma_pkt_size_err; // one-hot encoded
   input [43:0] 	     txc_dmc_p1_pkt_size_err_addr;
   input 		     txc_dmc_p1_pkt_size_err;  // pulse to indicate error
   
`ifdef NEPTUNE   
   input [`NO_OF_DMAS - 1:0] txc_dmc_p2_dma_pkt_size_err; // one-hot encoded
   input [43:0] 	     txc_dmc_p2_pkt_size_err_addr;
   input 		     txc_dmc_p2_pkt_size_err;  // pulse to indicate error
   
   
   input [`NO_OF_DMAS - 1:0] txc_dmc_p3_dma_pkt_size_err; // one-hot encoded
   input [43:0] 	     txc_dmc_p3_pkt_size_err_addr;
   input 		     txc_dmc_p3_pkt_size_err;  // pulse to indicate error
`else
`endif // !`ifdef NEPTUNE
   
   




 wire[31:0] dma0_debug_port;
  wire[31:0] dma1_debug_port;
  wire[31:0] dma2_debug_port;
  wire[31:0] dma3_debug_port;
  wire[31:0] dma4_debug_port;
  wire[31:0] dma5_debug_port;
  wire[31:0] dma6_debug_port;
  wire[31:0] dma7_debug_port;
  wire[31:0] dma8_debug_port;
  wire[31:0] dma9_debug_port;
  wire[31:0] dma10_debug_port;
  wire[31:0] dma11_debug_port;
  wire[31:0] dma12_debug_port;
  wire[31:0] dma13_debug_port;
  wire[31:0] dma14_debug_port;
  wire[31:0] dma15_debug_port;

`ifdef NEPTUNE
  wire[31:0] dma16_debug_port;
  wire[31:0] dma17_debug_port;
  wire[31:0] dma18_debug_port;
  wire[31:0] dma19_debug_port;
  wire[31:0] dma20_debug_port;
  wire[31:0] dma21_debug_port;
  wire[31:0] dma22_debug_port;
  wire[31:0] dma23_debug_port;
`else
`endif



   //*************//


   /*AUTOJUNK*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire 		     DMC_TxCache_SMX_Req;    // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [63:0] 		     DMC_TxCache_SMX_Req_Address;// From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [7:0] 		     DMC_TxCache_SMX_Req_Cmd;// From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [4:0] 		     DMC_TxCache_SMX_Req_DMA_Num;// From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [13:0] 		     DMC_TxCache_SMX_Req_Length;// From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [1:0] 		     DMC_TxCache_SMX_Req_Port_Num;// From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire 		     DMC_TxCache_SMX_Resp_Accept;// From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire 		     SMX_DMC_TxCache_Req_Ack;// From dmc_txarb of dmc_txarb.v
   wire [63:0] 		     SMX_DMC_TxCache_Resp_Address;// From dmc_txarb of dmc_txarb.v
   wire [15:0] 		     SMX_DMC_TxCache_Resp_ByteEnables;// From dmc_txarb of dmc_txarb.v
   wire 		     SMX_DMC_TxCache_Resp_Complete;// From dmc_txarb of dmc_txarb.v
   wire [4:0] 		     SMX_DMC_TxCache_Resp_DMA_Num;// From dmc_txarb of dmc_txarb.v
   wire [127:0] 	     SMX_DMC_TxCache_Resp_Data;// From dmc_txarb of dmc_txarb.v
   wire [13:0] 		     SMX_DMC_TxCache_Resp_Data_Length;// From dmc_txarb of dmc_txarb.v
   wire 		     SMX_DMC_TxCache_Resp_Data_Valid;// From dmc_txarb of dmc_txarb.v
   wire 		     SMX_DMC_TxCache_Resp_Rdy;// From dmc_txarb of dmc_txarb.v
   wire 		     SMX_DMC_TxCache_Trans_Complete;// From dmc_txarb of dmc_txarb.v

   wire [37:0] 		     tx_dma_cfg_dma0_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma0_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma0_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma0_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma0_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma0;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma0;	// From dmc_txpios of dmc_txpios.v

   wire [37:0] 		     tx_dma_cfg_dma1_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma1_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma1_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma1_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma1_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma1;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma1;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma2_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma2_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma2_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma2_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma2_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma2;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma2;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma3_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma3_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma3_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma3_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma3_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma3;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma3;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma4_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma4_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma4_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma4_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma4_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma4;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma4;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma5_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma5_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma5_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma5_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma5_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma5;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma5;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma6_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma6_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma6_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma6_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma6_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma6;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma6;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma7_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma7_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma7_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma7_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma7_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma7;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma7;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma8_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma8_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma8_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma8_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma8_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma8;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma8;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma9_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma9_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma9_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma9_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma9_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma9;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma9;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma10_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma10_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma10_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma10_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma10_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma10;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma10;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma11_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma11_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma11_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma11_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma11_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma11;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma11;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma12_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma12_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma12_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma12_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma12_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma12;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma12;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma13_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma13_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma13_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma13_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma13_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma13;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma13;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma14_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma14_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma14_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma14_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma14_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma14;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma14;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma15_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma15_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma15_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma15_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma15_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma15;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma15;	// From dmc_txpios of dmc_txpios.v
`ifdef NEPTUNE
   wire [37:0] 		     tx_dma_cfg_dma16_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma16_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma16_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma16_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma16_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma16;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma16;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma17_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma17_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma17_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma17_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma17_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma17;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma17;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma18_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma18_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma18_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma18_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma18_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma18;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma18;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma19_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma19_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma19_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma19_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma19_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma19;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma19;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma20_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma20_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma20_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma20_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma20_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma20;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma20;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma21_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma21_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma21_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma21_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma21_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma21;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma21;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma22_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma22_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma22_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma22_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma22_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma22;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma22;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_dma_cfg_dma23_mbaddr;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma23_rst;	// From dmc_txpios of dmc_txpios.v
   wire 		     tx_dma_cfg_dma23_stall;	// From dmc_txpios of dmc_txpios.v
   wire [`RNG_LENGTH_WIDTH -1:0] 		     tx_rng_cfg_dma23_len;	// From dmc_txpios of dmc_txpios.v
   wire [37:0] 		     tx_rng_cfg_dma23_staddr;	// From dmc_txpios of dmc_txpios.v
   wire [`PTR_WIDTH:0] 		     tx_rng_head_dma23;       // From dmc_cache_dataFetch of dmc_cache_dataFetch.v
   wire [`PTR_WIDTH:0] 		     tx_rng_tail_dma23;	// From dmc_txpios of dmc_txpios.v

`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
   
   // fzc signals
   

   wire [31:0] 		     page0_mask_dma0;
   wire [31:0] 		     page0_value_dma0;
   wire [31:0] 		     page0_reloc_dma0;
   wire 		     page0_valid_dma0;
   wire [31:0] 		     page1_mask_dma0;
   wire [31:0] 		     page1_value_dma0;
   wire [31:0] 		     page1_reloc_dma0;
   wire 		     page1_valid_dma0;
   wire [31:0] 		     page0_mask_dma1;
   wire [31:0] 		     page0_value_dma1;
   wire [31:0] 		     page0_reloc_dma1;
   wire 		     page0_valid_dma1;
   wire [31:0] 		     page1_mask_dma1;
   wire [31:0] 		     page1_value_dma1;
   wire [31:0] 		     page1_reloc_dma1;
   wire 		     page1_valid_dma1;
   wire [31:0] 		     page0_mask_dma2;
   wire [31:0] 		     page0_value_dma2;
   wire [31:0] 		     page0_reloc_dma2;
   wire 		     page0_valid_dma2;
   wire [31:0] 		     page1_mask_dma2;
   wire [31:0] 		     page1_value_dma2;
   wire [31:0] 		     page1_reloc_dma2;
   wire 		     page1_valid_dma2;
   wire [31:0] 		     page0_mask_dma3;
   wire [31:0] 		     page0_value_dma3;
   wire [31:0] 		     page0_reloc_dma3;
   wire 		     page0_valid_dma3;
   wire [31:0] 		     page1_mask_dma3;
   wire [31:0] 		     page1_value_dma3;
   wire [31:0] 		     page1_reloc_dma3;
   wire 		     page1_valid_dma3;
   wire [31:0] 		     page0_mask_dma4;
   wire [31:0] 		     page0_value_dma4;
   wire [31:0] 		     page0_reloc_dma4;
   wire 		     page0_valid_dma4;
   wire [31:0] 		     page1_mask_dma4;
   wire [31:0] 		     page1_value_dma4;
   wire [31:0] 		     page1_reloc_dma4;
   wire 		     page1_valid_dma4;
   wire [31:0] 		     page0_mask_dma5;
   wire [31:0] 		     page0_value_dma5;
   wire [31:0] 		     page0_reloc_dma5;
   wire 		     page0_valid_dma5;
   wire [31:0] 		     page1_mask_dma5;
   wire [31:0] 		     page1_value_dma5;
   wire [31:0] 		     page1_reloc_dma5;
   wire 		     page1_valid_dma5;
   wire [31:0] 		     page0_mask_dma6;
   wire [31:0] 		     page0_value_dma6;
   wire [31:0] 		     page0_reloc_dma6;
   wire 		     page0_valid_dma6;
   wire [31:0] 		     page1_mask_dma6;
   wire [31:0] 		     page1_value_dma6;
   wire [31:0] 		     page1_reloc_dma6;
   wire 		     page1_valid_dma6;
   wire [31:0] 		     page0_mask_dma7;
   wire [31:0] 		     page0_value_dma7;
   wire [31:0] 		     page0_reloc_dma7;
   wire 		     page0_valid_dma7;
   wire [31:0] 		     page1_mask_dma7;
   wire [31:0] 		     page1_value_dma7;
   wire [31:0] 		     page1_reloc_dma7;
   wire 		     page1_valid_dma7;
   wire [31:0] 		     page0_mask_dma8;
   wire [31:0] 		     page0_value_dma8;
   wire [31:0] 		     page0_reloc_dma8;
   wire 		     page0_valid_dma8;
   wire [31:0] 		     page1_mask_dma8;
   wire [31:0] 		     page1_value_dma8;
   wire [31:0] 		     page1_reloc_dma8;
   wire 		     page1_valid_dma8;
   wire [31:0] 		     page0_mask_dma9;
   wire [31:0] 		     page0_value_dma9;
   wire [31:0] 		     page0_reloc_dma9;
   wire 		     page0_valid_dma9;
   wire [31:0] 		     page1_mask_dma9;
   wire [31:0] 		     page1_value_dma9;
   wire [31:0] 		     page1_reloc_dma9;
   wire 		     page1_valid_dma9;
   wire [31:0] 		     page0_mask_dma10;
   wire [31:0] 		     page0_value_dma10;
   wire [31:0] 		     page0_reloc_dma10;
   wire 		     page0_valid_dma10;
   wire [31:0] 		     page1_mask_dma10;
   wire [31:0] 		     page1_value_dma10;
   wire [31:0] 		     page1_reloc_dma10;
   wire 		     page1_valid_dma10;
   wire [31:0] 		     page0_mask_dma11;
   wire [31:0] 		     page0_value_dma11;
   wire [31:0] 		     page0_reloc_dma11;
   wire 		     page0_valid_dma11;
   wire [31:0] 		     page1_mask_dma11;
   wire [31:0] 		     page1_value_dma11;
   wire [31:0] 		     page1_reloc_dma11;
   wire 		     page1_valid_dma11;
   wire [31:0] 		     page0_mask_dma12;
   wire [31:0] 		     page0_value_dma12;
   wire [31:0] 		     page0_reloc_dma12;
   wire 		     page0_valid_dma12;
   wire [31:0] 		     page1_mask_dma12;
   wire [31:0] 		     page1_value_dma12;
   wire [31:0] 		     page1_reloc_dma12;
   wire 		     page1_valid_dma12;
   wire [31:0] 		     page0_mask_dma13;
   wire [31:0] 		     page0_value_dma13;
   wire [31:0] 		     page0_reloc_dma13;
   wire 		     page0_valid_dma13;
   wire [31:0] 		     page1_mask_dma13;
   wire [31:0] 		     page1_value_dma13;
   wire [31:0] 		     page1_reloc_dma13;
   wire 		     page1_valid_dma13;
   wire [31:0] 		     page0_mask_dma14;
   wire [31:0] 		     page0_value_dma14;
   wire [31:0] 		     page0_reloc_dma14;
   wire 		     page0_valid_dma14;
   wire [31:0] 		     page1_mask_dma14;
   wire [31:0] 		     page1_value_dma14;
   wire [31:0] 		     page1_reloc_dma14;
   wire 		     page1_valid_dma14;
   wire [31:0] 		     page0_mask_dma15;
   wire [31:0] 		     page0_value_dma15;
   wire [31:0] 		     page0_reloc_dma15;
   wire 		     page0_valid_dma15;
   wire [31:0] 		     page1_mask_dma15;
   wire [31:0] 		     page1_value_dma15;
   wire [31:0] 		     page1_reloc_dma15;
   wire 		     page1_valid_dma15;
`ifdef NEPTUNE
   
   wire [31:0] 		     page0_mask_dma16;
   wire [31:0] 		     page0_value_dma16;
   wire [31:0] 		     page0_reloc_dma16;
   wire 		     page0_valid_dma16;
   wire [31:0] 		     page1_mask_dma16;
   wire [31:0] 		     page1_value_dma16;
   wire [31:0] 		     page1_reloc_dma16;
   wire 		     page1_valid_dma16;
   wire [31:0] 		     page0_mask_dma17;
   wire [31:0] 		     page0_value_dma17;
   wire [31:0] 		     page0_reloc_dma17;
   wire 		     page0_valid_dma17;
   wire [31:0] 		     page1_mask_dma17;
   wire [31:0] 		     page1_value_dma17;
   wire [31:0] 		     page1_reloc_dma17;
   wire 		     page1_valid_dma17;
   wire [31:0] 		     page0_mask_dma18;
   wire [31:0] 		     page0_value_dma18;
   wire [31:0] 		     page0_reloc_dma18;
   wire 		     page0_valid_dma18;
   wire [31:0] 		     page1_mask_dma18;
   wire [31:0] 		     page1_value_dma18;
   wire [31:0] 		     page1_reloc_dma18;
   wire 		     page1_valid_dma18;
   wire [31:0] 		     page0_mask_dma19;
   wire [31:0] 		     page0_value_dma19;
   wire [31:0] 		     page0_reloc_dma19;
   wire 		     page0_valid_dma19;
   wire [31:0] 		     page1_mask_dma19;
   wire [31:0] 		     page1_value_dma19;
   wire [31:0] 		     page1_reloc_dma19;
   wire 		     page1_valid_dma19;
   wire [31:0] 		     page0_mask_dma20;
   wire [31:0] 		     page0_value_dma20;
   wire [31:0] 		     page0_reloc_dma20;
   wire 		     page0_valid_dma20;
   wire [31:0] 		     page1_mask_dma20;
   wire [31:0] 		     page1_value_dma20;
   wire [31:0] 		     page1_reloc_dma20;
   wire 		     page1_valid_dma20;
   wire [31:0] 		     page0_mask_dma21;
   wire [31:0] 		     page0_value_dma21;
   wire [31:0] 		     page0_reloc_dma21;
   wire 		     page0_valid_dma21;
   wire [31:0] 		     page1_mask_dma21;
   wire [31:0] 		     page1_value_dma21;
   wire [31:0] 		     page1_reloc_dma21;
   wire 		     page1_valid_dma21;
   wire [31:0] 		     page0_mask_dma22;
   wire [31:0] 		     page0_value_dma22;
   wire [31:0] 		     page0_reloc_dma22;
   wire 		     page0_valid_dma22;
   wire [31:0] 		     page1_mask_dma22;
   wire [31:0] 		     page1_value_dma22;
   wire [31:0] 		     page1_reloc_dma22;
   wire 		     page1_valid_dma22;
   wire [31:0] 		     page0_mask_dma23;
   wire [31:0] 		     page0_value_dma23;
   wire [31:0] 		     page0_reloc_dma23;
   wire 		     page0_valid_dma23;
   wire [31:0] 		     page1_mask_dma23;
   wire [31:0] 		     page1_value_dma23;
   wire [31:0] 		     page1_reloc_dma23;
   wire 		     page1_valid_dma23;

`endif



 
   

   wire [63:0] 		     tx_cs_dma0;
   wire [63:0] 		     tx_dma0_pre_st;
   wire [63:0] 		     tx_dma0_rng_err_logh; 
   wire [63:0] 		     tx_dma0_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma1;
   wire [63:0] 		     tx_dma1_pre_st;
   wire [63:0] 		     tx_dma1_rng_err_logh; 
   wire [63:0] 		     tx_dma1_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma2;
   wire [63:0] 		     tx_dma2_pre_st;
   wire [63:0] 		     tx_dma2_rng_err_logh; 
   wire [63:0] 		     tx_dma2_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma3;
   wire [63:0] 		     tx_dma3_pre_st;
   wire [63:0] 		     tx_dma3_rng_err_logh; 
   wire [63:0] 		     tx_dma3_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma4;
   wire [63:0] 		     tx_dma4_pre_st;
   wire [63:0] 		     tx_dma4_rng_err_logh; 
   wire [63:0] 		     tx_dma4_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma5;
   wire [63:0] 		     tx_dma5_pre_st;
   wire [63:0] 		     tx_dma5_rng_err_logh; 
   wire [63:0] 		     tx_dma5_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma6;
   wire [63:0] 		     tx_dma6_pre_st;
   wire [63:0] 		     tx_dma6_rng_err_logh; 
   wire [63:0] 		     tx_dma6_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma7;
   wire [63:0] 		     tx_dma7_pre_st;
   wire [63:0] 		     tx_dma7_rng_err_logh; 
   wire [63:0] 		     tx_dma7_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma8;
   wire [63:0] 		     tx_dma8_pre_st;
   wire [63:0] 		     tx_dma8_rng_err_logh; 
   wire [63:0] 		     tx_dma8_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma9;
   wire [63:0] 		     tx_dma9_pre_st;
   wire [63:0] 		     tx_dma9_rng_err_logh; 
   wire [63:0] 		     tx_dma9_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma10;
   wire [63:0] 		     tx_dma10_pre_st;
   wire [63:0] 		     tx_dma10_rng_err_logh; 
   wire [63:0] 		     tx_dma10_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma11;
   wire [63:0] 		     tx_dma11_pre_st;
   wire [63:0] 		     tx_dma11_rng_err_logh; 
   wire [63:0] 		     tx_dma11_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma12;
   wire [63:0] 		     tx_dma12_pre_st;
   wire [63:0] 		     tx_dma12_rng_err_logh; 
   wire [63:0] 		     tx_dma12_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma13;
   wire [63:0] 		     tx_dma13_pre_st;
   wire [63:0] 		     tx_dma13_rng_err_logh; 
   wire [63:0] 		     tx_dma13_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma14;
   wire [63:0] 		     tx_dma14_pre_st;
   wire [63:0] 		     tx_dma14_rng_err_logh; 
   wire [63:0] 		     tx_dma14_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma15;
   wire [63:0] 		     tx_dma15_pre_st;
   wire [63:0] 		     tx_dma15_rng_err_logh; 
   wire [63:0] 		     tx_dma15_rng_err_logl; 
`ifdef NEPTUNE
   
   wire [63:0] 		     tx_cs_dma16;
   wire [63:0] 		     tx_dma16_pre_st;
   wire [63:0] 		     tx_dma16_rng_err_logh; 
   wire [63:0] 		     tx_dma16_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma17;
   wire [63:0] 		     tx_dma17_pre_st;
   wire [63:0] 		     tx_dma17_rng_err_logh; 
   wire [63:0] 		     tx_dma17_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma18;
   wire [63:0] 		     tx_dma18_pre_st;
   wire [63:0] 		     tx_dma18_rng_err_logh; 
   wire [63:0] 		     tx_dma18_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma19;
   wire [63:0] 		     tx_dma19_pre_st;
   wire [63:0] 		     tx_dma19_rng_err_logh; 
   wire [63:0] 		     tx_dma19_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma20;
   wire [63:0] 		     tx_dma20_pre_st;
   wire [63:0] 		     tx_dma20_rng_err_logh; 
   wire [63:0] 		     tx_dma20_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma21;
   wire [63:0] 		     tx_dma21_pre_st;
   wire [63:0] 		     tx_dma21_rng_err_logh; 
   wire [63:0] 		     tx_dma21_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma22;
   wire [63:0] 		     tx_dma22_pre_st;
   wire [63:0] 		     tx_dma22_rng_err_logh; 
   wire [63:0] 		     tx_dma22_rng_err_logl; 
   wire [63:0] 		     tx_cs_dma23;
   wire [63:0] 		     tx_dma23_pre_st;
   wire [63:0] 		     tx_dma23_rng_err_logh; 
   wire [63:0] 		     tx_dma23_rng_err_logl; 

`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
   
   // wires so that vlint doesnt complain
   wire Reset_L;

// dma0 wires
wire dma0_clear_reset;
wire tx_dma_cfg_dma0_stop_state;
wire tx_dma_cfg_dma0_stop;
wire tx_cfg_dma0_enable_mb;
wire tx_cfg_dma0_mk;
wire tx_cfg_dma0_mmk;
wire clear_cfg_dma0_mb;
wire set_cfg_dma0_mmk;
// dma1 wires
wire dma1_clear_reset;
wire tx_dma_cfg_dma1_stop_state;
wire tx_dma_cfg_dma1_stop;
wire tx_cfg_dma1_enable_mb;
wire tx_cfg_dma1_mk;
wire tx_cfg_dma1_mmk;
wire clear_cfg_dma1_mb;
wire set_cfg_dma1_mmk;
// dma2 wires
wire dma2_clear_reset;
wire tx_dma_cfg_dma2_stop_state;
wire tx_dma_cfg_dma2_stop;
wire tx_cfg_dma2_enable_mb;
wire tx_cfg_dma2_mk;
wire tx_cfg_dma2_mmk;
wire clear_cfg_dma2_mb;
wire set_cfg_dma2_mmk;
// dma3 wires
wire dma3_clear_reset;
wire tx_dma_cfg_dma3_stop_state;
wire tx_dma_cfg_dma3_stop;
wire tx_cfg_dma3_enable_mb;
wire tx_cfg_dma3_mk;
wire tx_cfg_dma3_mmk;
wire clear_cfg_dma3_mb;
wire set_cfg_dma3_mmk;
// dma4 wires
wire dma4_clear_reset;
wire tx_dma_cfg_dma4_stop_state;
wire tx_dma_cfg_dma4_stop;
wire tx_cfg_dma4_enable_mb;
wire tx_cfg_dma4_mk;
wire tx_cfg_dma4_mmk;
wire clear_cfg_dma4_mb;
wire set_cfg_dma4_mmk;
// dma5 wires
wire dma5_clear_reset;
wire tx_dma_cfg_dma5_stop_state;
wire tx_dma_cfg_dma5_stop;
wire tx_cfg_dma5_enable_mb;
wire tx_cfg_dma5_mk;
wire tx_cfg_dma5_mmk;
wire clear_cfg_dma5_mb;
wire set_cfg_dma5_mmk;
// dma6 wires
wire dma6_clear_reset;
wire tx_dma_cfg_dma6_stop_state;
wire tx_dma_cfg_dma6_stop;
wire tx_cfg_dma6_enable_mb;
wire tx_cfg_dma6_mk;
wire tx_cfg_dma6_mmk;
wire clear_cfg_dma6_mb;
wire set_cfg_dma6_mmk;
// dma7 wires
wire dma7_clear_reset;
wire tx_dma_cfg_dma7_stop_state;
wire tx_dma_cfg_dma7_stop;
wire tx_cfg_dma7_enable_mb;
wire tx_cfg_dma7_mk;
wire tx_cfg_dma7_mmk;
wire clear_cfg_dma7_mb;
wire set_cfg_dma7_mmk;
// dma8 wires
wire dma8_clear_reset;
wire tx_dma_cfg_dma8_stop_state;
wire tx_dma_cfg_dma8_stop;
wire tx_cfg_dma8_enable_mb;
wire tx_cfg_dma8_mk;
wire tx_cfg_dma8_mmk;
wire clear_cfg_dma8_mb;
wire set_cfg_dma8_mmk;
// dma9 wires
wire dma9_clear_reset;
wire tx_dma_cfg_dma9_stop_state;
wire tx_dma_cfg_dma9_stop;
wire tx_cfg_dma9_enable_mb;
wire tx_cfg_dma9_mk;
wire tx_cfg_dma9_mmk;
wire clear_cfg_dma9_mb;
wire set_cfg_dma9_mmk;
// dma10 wires
wire dma10_clear_reset;
wire tx_dma_cfg_dma10_stop_state;
wire tx_dma_cfg_dma10_stop;
wire tx_cfg_dma10_enable_mb;
wire tx_cfg_dma10_mk;
wire tx_cfg_dma10_mmk;
wire clear_cfg_dma10_mb;
wire set_cfg_dma10_mmk;
// dma11 wires
wire dma11_clear_reset;
wire tx_dma_cfg_dma11_stop_state;
wire tx_dma_cfg_dma11_stop;
wire tx_cfg_dma11_enable_mb;
wire tx_cfg_dma11_mk;
wire tx_cfg_dma11_mmk;
wire clear_cfg_dma11_mb;
wire set_cfg_dma11_mmk;
// dma12 wires
wire dma12_clear_reset;
wire tx_dma_cfg_dma12_stop_state;
wire tx_dma_cfg_dma12_stop;
wire tx_cfg_dma12_enable_mb;
wire tx_cfg_dma12_mk;
wire tx_cfg_dma12_mmk;
wire clear_cfg_dma12_mb;
wire set_cfg_dma12_mmk;
// dma13 wires
wire dma13_clear_reset;
wire tx_dma_cfg_dma13_stop_state;
wire tx_dma_cfg_dma13_stop;
wire tx_cfg_dma13_enable_mb;
wire tx_cfg_dma13_mk;
wire tx_cfg_dma13_mmk;
wire clear_cfg_dma13_mb;
wire set_cfg_dma13_mmk;
// dma14 wires
wire dma14_clear_reset;
wire tx_dma_cfg_dma14_stop_state;
wire tx_dma_cfg_dma14_stop;
wire tx_cfg_dma14_enable_mb;
wire tx_cfg_dma14_mk;
wire tx_cfg_dma14_mmk;
wire clear_cfg_dma14_mb;
wire set_cfg_dma14_mmk;
// dma15 wires
wire dma15_clear_reset;
wire tx_dma_cfg_dma15_stop_state;
wire tx_dma_cfg_dma15_stop;
wire tx_cfg_dma15_enable_mb;
wire tx_cfg_dma15_mk;
wire tx_cfg_dma15_mmk;
wire clear_cfg_dma15_mb;
wire set_cfg_dma15_mmk;
`ifdef NEPTUNE
   
// dma16 wires
wire dma16_clear_reset;
wire tx_dma_cfg_dma16_stop_state;
wire tx_dma_cfg_dma16_stop;
wire tx_cfg_dma16_enable_mb;
wire tx_cfg_dma16_mk;
wire tx_cfg_dma16_mmk;
wire clear_cfg_dma16_mb;
wire set_cfg_dma16_mmk;
// dma17 wires
wire dma17_clear_reset;
wire tx_dma_cfg_dma17_stop_state;
wire tx_dma_cfg_dma17_stop;
wire tx_cfg_dma17_enable_mb;
wire tx_cfg_dma17_mk;
wire tx_cfg_dma17_mmk;
wire clear_cfg_dma17_mb;
wire set_cfg_dma17_mmk;
// dma18 wires
wire dma18_clear_reset;
wire tx_dma_cfg_dma18_stop_state;
wire tx_dma_cfg_dma18_stop;
wire tx_cfg_dma18_enable_mb;
wire tx_cfg_dma18_mk;
wire tx_cfg_dma18_mmk;
wire clear_cfg_dma18_mb;
wire set_cfg_dma18_mmk;
// dma19 wires
wire dma19_clear_reset;
wire tx_dma_cfg_dma19_stop_state;
wire tx_dma_cfg_dma19_stop;
wire tx_cfg_dma19_enable_mb;
wire tx_cfg_dma19_mk;
wire tx_cfg_dma19_mmk;
wire clear_cfg_dma19_mb;
wire set_cfg_dma19_mmk;
// dma20 wires
wire dma20_clear_reset;
wire tx_dma_cfg_dma20_stop_state;
wire tx_dma_cfg_dma20_stop;
wire tx_cfg_dma20_enable_mb;
wire tx_cfg_dma20_mk;
wire tx_cfg_dma20_mmk;
wire clear_cfg_dma20_mb;
wire set_cfg_dma20_mmk;
// dma21 wires
wire dma21_clear_reset;
wire tx_dma_cfg_dma21_stop_state;
wire tx_dma_cfg_dma21_stop;
wire tx_cfg_dma21_enable_mb;
wire tx_cfg_dma21_mk;
wire tx_cfg_dma21_mmk;
wire clear_cfg_dma21_mb;
wire set_cfg_dma21_mmk;
// dma22 wires
wire dma22_clear_reset;
wire tx_dma_cfg_dma22_stop_state;
wire tx_dma_cfg_dma22_stop;
wire tx_cfg_dma22_enable_mb;
wire tx_cfg_dma22_mk;
wire tx_cfg_dma22_mmk;
wire clear_cfg_dma22_mb;
wire set_cfg_dma22_mmk;
// dma23 wires
wire dma23_clear_reset;
wire tx_dma_cfg_dma23_stop_state;
wire tx_dma_cfg_dma23_stop;
wire tx_cfg_dma23_enable_mb;
wire tx_cfg_dma23_mk;
wire tx_cfg_dma23_mmk;
wire clear_cfg_dma23_mb;
wire set_cfg_dma23_mmk;
`else // !ifdef NEPTUNE
   
`endif // ifdef NEPTUNE
   


   wire           set_cfg_dma0_mk;
   wire           set_cfg_dma1_mk;
   wire           set_cfg_dma2_mk;
   wire           set_cfg_dma3_mk;
   wire           set_cfg_dma4_mk;
   wire           set_cfg_dma5_mk;
   wire           set_cfg_dma6_mk;
   wire           set_cfg_dma7_mk;
   wire           set_cfg_dma8_mk;
   wire           set_cfg_dma9_mk;
   wire           set_cfg_dma10_mk;
   wire           set_cfg_dma11_mk;
   wire           set_cfg_dma12_mk;
   wire           set_cfg_dma13_mk;
   wire           set_cfg_dma14_mk;
   wire           set_cfg_dma15_mk;
`ifdef NEPTUNE
   wire           set_cfg_dma16_mk;
   wire           set_cfg_dma17_mk;
   wire           set_cfg_dma18_mk;
   wire           set_cfg_dma19_mk;
   wire           set_cfg_dma20_mk;
   wire           set_cfg_dma21_mk;
   wire           set_cfg_dma22_mk;
   wire           set_cfg_dma23_mk;

`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
   


   
   // End of automatics
   // Beginning of automatic regs (for this module's undeclared outputs)
   wire 		     dmc_txc_dma0_active;
   wire [63:0] 		     dmc_txc_dma0_descriptor;
   wire 		     dmc_txc_dma0_eoflist;
   wire 		     dmc_txc_dma0_error;
   wire 		     dmc_txc_dma0_gotnxtdesc;
   wire 		     dmc_txc_dma1_active;
   wire [63:0] 		     dmc_txc_dma1_descriptor;
   wire 		     dmc_txc_dma1_eoflist;
   wire 		     dmc_txc_dma1_error;
   wire 		     dmc_txc_dma1_gotnxtdesc;
   // End of automatics


   // Tx DMA Response Interface




   
   wire [127:0] 	     tdmc_arb0_data;
   wire 		     tdmc_arb0_data_valid ;
   wire 		     tdmc_arb0_req ;
   wire [63:0] 		     tdmc_arb0_req_address;
   wire [15:0] 		     tdmc_arb0_req_byteenable;
   wire [7:0] 		     tdmc_arb0_req_cmd;
   wire [4:0] 		     tdmc_arb0_req_dma_num;
   wire [13:0] 		     tdmc_arb0_req_length;
   wire [1:0] 		     tdmc_arb0_req_port_num ;
   wire [3:0] 		     tdmc_arb0_status ;
   wire 		     tdmc_arb0_transfer_complete;





   wire 		     dmc_txc_dma0_reset_scheduled;
   wire 		     dmc_txc_dma1_reset_scheduled;
   wire 		     dmc_txc_dma2_reset_scheduled;
   wire 		     dmc_txc_dma3_reset_scheduled;
   wire 		     dmc_txc_dma4_reset_scheduled;
   wire 		     dmc_txc_dma5_reset_scheduled;
   wire 		     dmc_txc_dma6_reset_scheduled;
   wire 		     dmc_txc_dma7_reset_scheduled;
   wire 		     dmc_txc_dma8_reset_scheduled;
   wire 		     dmc_txc_dma9_reset_scheduled;
   wire 		     dmc_txc_dma10_reset_scheduled;
   wire 		     dmc_txc_dma11_reset_scheduled;
   wire 		     dmc_txc_dma12_reset_scheduled;
   wire 		     dmc_txc_dma13_reset_scheduled;
   wire 		     dmc_txc_dma14_reset_scheduled;
   wire 		     dmc_txc_dma15_reset_scheduled;
`ifdef NEPTUNE
   wire 		     dmc_txc_dma16_reset_scheduled;
   wire 		     dmc_txc_dma17_reset_scheduled;
   wire 		     dmc_txc_dma18_reset_scheduled;
   wire 		     dmc_txc_dma19_reset_scheduled;
   wire 		     dmc_txc_dma20_reset_scheduled;
   wire 		     dmc_txc_dma21_reset_scheduled;
   wire 		     dmc_txc_dma22_reset_scheduled;
   wire 		     dmc_txc_dma23_reset_scheduled;
`endif


   wire 		     dmc_txc_dma0_partial;
   wire 		     dmc_txc_dma1_partial;
   wire 		     dmc_txc_dma2_partial;
   wire 		     dmc_txc_dma3_partial;
   wire 		     dmc_txc_dma4_partial;
   wire 		     dmc_txc_dma5_partial;
   wire 		     dmc_txc_dma6_partial;
   wire 		     dmc_txc_dma7_partial;
   wire 		     dmc_txc_dma8_partial;
   wire 		     dmc_txc_dma9_partial;
   wire 		     dmc_txc_dma10_partial;
   wire 		     dmc_txc_dma11_partial;
   wire 		     dmc_txc_dma12_partial;
   wire 		     dmc_txc_dma13_partial;
   wire 		     dmc_txc_dma14_partial;
   wire 		     dmc_txc_dma15_partial;
`ifdef NEPTUNE
   wire 		     dmc_txc_dma16_partial;
   wire 		     dmc_txc_dma17_partial;
   wire 		     dmc_txc_dma18_partial;
   wire 		     dmc_txc_dma19_partial;
   wire 		     dmc_txc_dma20_partial;
   wire 		     dmc_txc_dma21_partial;
   wire 		     dmc_txc_dma22_partial;
   wire 		     dmc_txc_dma23_partial;
`endif


   wire 		     set_pref_buf_par_err_dma0;
   wire 		     set_pkt_part_err_dma0;
   wire [43:0] 		     pkt_part_error_address_dma0;
   wire 		     set_conf_part_error_dma0;
   wire 		     set_tx_ring_oflow_dma0;
   


   wire 		     set_pref_buf_par_err_dma1;
   wire 		     set_pkt_part_err_dma1;
   wire [43:0] 		     pkt_part_error_address_dma1;
   wire 		     set_conf_part_error_dma1;
   wire 		     set_tx_ring_oflow_dma1;
   


   wire 		     set_pref_buf_par_err_dma2;
   wire 		     set_pkt_part_err_dma2;
   wire [43:0] 		     pkt_part_error_address_dma2;
   wire 		     set_conf_part_error_dma2;
   wire 		     set_tx_ring_oflow_dma2;
   


   wire 		     set_pref_buf_par_err_dma3;
   wire 		     set_pkt_part_err_dma3;
   wire [43:0] 		     pkt_part_error_address_dma3;
   wire 		     set_conf_part_error_dma3;
   wire 		     set_tx_ring_oflow_dma3;
   


   wire 		     set_pref_buf_par_err_dma4;
   wire 		     set_pkt_part_err_dma4;
   wire [43:0] 		     pkt_part_error_address_dma4;
   wire 		     set_conf_part_error_dma4;
   wire 		     set_tx_ring_oflow_dma4;
   


   wire 		     set_pref_buf_par_err_dma5;
   wire 		     set_pkt_part_err_dma5;
   wire [43:0] 		     pkt_part_error_address_dma5;
   wire 		     set_conf_part_error_dma5;
   wire 		     set_tx_ring_oflow_dma5;
   


   wire 		     set_pref_buf_par_err_dma6;
   wire 		     set_pkt_part_err_dma6;
   wire [43:0] 		     pkt_part_error_address_dma6;
   wire 		     set_conf_part_error_dma6;
   wire 		     set_tx_ring_oflow_dma6;
   


   wire 		     set_pref_buf_par_err_dma7;
   wire 		     set_pkt_part_err_dma7;
   wire [43:0] 		     pkt_part_error_address_dma7;
   wire 		     set_conf_part_error_dma7;
   wire 		     set_tx_ring_oflow_dma7;
   


   wire 		     set_pref_buf_par_err_dma8;
   wire 		     set_pkt_part_err_dma8;
   wire [43:0] 		     pkt_part_error_address_dma8;
   wire 		     set_conf_part_error_dma8;
   wire 		     set_tx_ring_oflow_dma8;
   


   wire 		     set_pref_buf_par_err_dma9;
   wire 		     set_pkt_part_err_dma9;
   wire [43:0] 		     pkt_part_error_address_dma9;
   wire 		     set_conf_part_error_dma9;
   wire 		     set_tx_ring_oflow_dma9;
   


   wire 		     set_pref_buf_par_err_dma10;
   wire 		     set_pkt_part_err_dma10;
   wire [43:0] 		     pkt_part_error_address_dma10;
   wire 		     set_conf_part_error_dma10;
   wire 		     set_tx_ring_oflow_dma10;
   


   wire 		     set_pref_buf_par_err_dma11;
   wire 		     set_pkt_part_err_dma11;
   wire [43:0] 		     pkt_part_error_address_dma11;
   wire 		     set_conf_part_error_dma11;
   wire 		     set_tx_ring_oflow_dma11;
   


   wire 		     set_pref_buf_par_err_dma12;
   wire 		     set_pkt_part_err_dma12;
   wire [43:0] 		     pkt_part_error_address_dma12;
   wire 		     set_conf_part_error_dma12;
   wire 		     set_tx_ring_oflow_dma12;
   


   wire 		     set_pref_buf_par_err_dma13;
   wire 		     set_pkt_part_err_dma13;
   wire [43:0] 		     pkt_part_error_address_dma13;
   wire 		     set_conf_part_error_dma13;
   wire 		     set_tx_ring_oflow_dma13;
   


   wire 		     set_pref_buf_par_err_dma14;
   wire 		     set_pkt_part_err_dma14;
   wire [43:0] 		     pkt_part_error_address_dma14;
   wire 		     set_conf_part_error_dma14;
   wire 		     set_tx_ring_oflow_dma14;
   


   wire 		     set_pref_buf_par_err_dma15;
   wire 		     set_pkt_part_err_dma15;
   wire [43:0] 		     pkt_part_error_address_dma15;
   wire 		     set_conf_part_error_dma15;
   wire 		     set_tx_ring_oflow_dma15;
   


`ifdef NEPTUNE
   wire 		     set_pref_buf_par_err_dma16;
   wire 		     set_pkt_part_err_dma16;
   wire [43:0] 		     pkt_part_error_address_dma16;
   wire 		     set_conf_part_error_dma16;
   wire 		     set_tx_ring_oflow_dma16;
   


   wire 		     set_pref_buf_par_err_dma17;
   wire 		     set_pkt_part_err_dma17;
   wire [43:0] 		     pkt_part_error_address_dma17;
   wire 		     set_conf_part_error_dma17;
   wire 		     set_tx_ring_oflow_dma17;
   


   wire 		     set_pref_buf_par_err_dma18;
   wire 		     set_pkt_part_err_dma18;
   wire [43:0] 		     pkt_part_error_address_dma18;
   wire 		     set_conf_part_error_dma18;
   wire 		     set_tx_ring_oflow_dma18;
   


   wire 		     set_pref_buf_par_err_dma19;
   wire 		     set_pkt_part_err_dma19;
   wire [43:0] 		     pkt_part_error_address_dma19;
   wire 		     set_conf_part_error_dma19;
   wire 		     set_tx_ring_oflow_dma19;
   


   wire 		     set_pref_buf_par_err_dma20;
   wire 		     set_pkt_part_err_dma20;
   wire [43:0] 		     pkt_part_error_address_dma20;
   wire 		     set_conf_part_error_dma20;
   wire 		     set_tx_ring_oflow_dma20;
   


   wire 		     set_pref_buf_par_err_dma21;
   wire 		     set_pkt_part_err_dma21;
   wire [43:0] 		     pkt_part_error_address_dma21;
   wire 		     set_conf_part_error_dma21;
   wire 		     set_tx_ring_oflow_dma21;
   


   wire 		     set_pref_buf_par_err_dma22;
   wire 		     set_pkt_part_err_dma22;
   wire [43:0] 		     pkt_part_error_address_dma22;
   wire 		     set_conf_part_error_dma22;
   wire 		     set_tx_ring_oflow_dma22;
   


   wire 		     set_pref_buf_par_err_dma23;
   wire 		     set_pkt_part_err_dma23;
   wire [43:0] 		     pkt_part_error_address_dma23;
   wire 		     set_conf_part_error_dma23;
   wire 		     set_tx_ring_oflow_dma23;
   
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
   

   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA0;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA1;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA2;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA3;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA4;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA5;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA6;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA7;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA8;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA9;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA10;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA11;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA12;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA13;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA14;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA15;
`ifdef NEPTUNE
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA16;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA17;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA18;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA19;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA20;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA21;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA22;
   wire [`PTR_WIDTH - 1:0] 		     ShadowRingCurrentPtr_DMA23;
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
   

   wire [`NO_OF_DMAS - 1:0]  set_mbox_part_error_dma;

   wire [63:0] 		     tdmc_pio_intr;

   
   wire [`NO_OF_DMAS - 1:0]  txpref_dma_nack_resp;
   wire 		     txpref_nack_resp ;
   wire [43:0] 		     txpref_nack_rd_addr;



   wire [`NO_OF_DMAS - 1:0]  mbox_ack_dma_err_received;
   wire 		     mbox_err_received;

   wire [31:0] 		     parity_corrupt_config;


      wire [1:0]  dmc_txc_dma0_func_num;
   wire [1:0]  dmc_txc_dma1_func_num;
   wire [1:0]  dmc_txc_dma2_func_num;
   wire [1:0]  dmc_txc_dma3_func_num;
   wire [1:0]  dmc_txc_dma4_func_num;
   wire [1:0]  dmc_txc_dma5_func_num;
   wire [1:0]  dmc_txc_dma6_func_num;
   wire [1:0]  dmc_txc_dma7_func_num;
   wire [1:0]  dmc_txc_dma8_func_num;
   wire [1:0]  dmc_txc_dma9_func_num;
   wire [1:0]  dmc_txc_dma10_func_num;
   wire [1:0]  dmc_txc_dma11_func_num;
   wire [1:0]  dmc_txc_dma12_func_num;
   wire [1:0]  dmc_txc_dma13_func_num;
   wire [1:0]  dmc_txc_dma14_func_num;
   wire [1:0]  dmc_txc_dma15_func_num;
`ifdef NEPTUNE
   wire [1:0]  dmc_txc_dma16_func_num;
   wire [1:0]  dmc_txc_dma17_func_num;
   wire [1:0]  dmc_txc_dma18_func_num;
   wire [1:0]  dmc_txc_dma19_func_num;
   wire [1:0]  dmc_txc_dma20_func_num;
   wire [1:0]  dmc_txc_dma21_func_num;
   wire [1:0]  dmc_txc_dma22_func_num;
   wire [1:0]  dmc_txc_dma23_func_num;
`endif // ifdef NEPTUNE
   

`ifdef NEPTUNE
`else
  wire sram_reset;
`endif






   
   
   

   
   // req path output
   assign tdmc_arb1_req_cmd =                 DMC_TxCache_SMX_Req_Cmd;
   assign tdmc_arb1_req_address =                 DMC_TxCache_SMX_Req_Address;
   assign tdmc_arb1_req_length  =                 DMC_TxCache_SMX_Req_Length;
   assign tdmc_arb1_req_port_num =                DMC_TxCache_SMX_Req_Port_Num;
   assign tdmc_arb1_req_dma_num  =                DMC_TxCache_SMX_Req_DMA_Num;
   assign tdmc_arb1_req      =                DMC_TxCache_SMX_Req;
   // req path input
   assign SMX_DMC_TxCache_Req_Ack =          arb1_tdmc_req_accept;
   
   
   
   
   
   
   
   // response path
   // inputs
   assign SMX_DMC_TxCache_Resp_Rdy                  =  meta_dmc_resp_ready & meta_dmc_resp_client;
   assign SMX_DMC_TxCache_Resp_Complete             =  meta_dmc_resp_complete;
   assign SMX_DMC_TxCache_Trans_Complete            =  meta_dmc_resp_transfer_cmpl;
   assign SMX_DMC_TxCache_Resp_Data_Valid           =  meta_dmc_data_valid;
   assign SMX_DMC_TxCache_Resp_DMA_Num              =  meta_dmc_resp_dma_num;
   assign SMX_DMC_TxCache_Resp_ByteEnables          =  meta_dmc_resp_byteenable;
   assign SMX_DMC_TxCache_Resp_Data_Length          =  meta_dmc_resp_length;
   assign SMX_DMC_TxCache_Resp_Address              =  meta_dmc_resp_address;
   assign SMX_DMC_TxCache_Resp_Data                 =  meta_dmc_data;       
   // outputs
   assign dmc_meta_resp_accept                      = DMC_TxCache_SMX_Resp_Accept;
   

   
   
   wire [5:0] debug_select;
   wire [31:0] training_vector;
   wire [3:0] 	  TxCacheFetchState;
   wire [11:0] mbox_debug_state;

   

   niu_tdmc_reset niu_tdmc_reset( /*AUTOJUNK*/
				  // Outputs
				  .Reset_L(Reset_L),
			   `ifdef NEPTUNE
			   `else
				  .sram_reset(sram_reset),
			   `endif
				  // Inputs
				  .SysClk(niu_clk),
				  .niu_reset_l(niu_reset_l)
			  	 );

   niu_tdmc_debug niu_tdmc_debug (/*AUTOJUNK*/
				  // Outputs
				  .tdmc_debug_port(tdmc_debug_port[31:0]),
				  // Inputs
				  .SysClk(niu_clk),
				  .Reset_L(Reset_L),

  .dma0_debug_port (dma0_debug_port),
  .dma1_debug_port (dma1_debug_port),
  .dma2_debug_port (dma2_debug_port),
  .dma3_debug_port (dma3_debug_port),
  .dma4_debug_port (dma4_debug_port),
  .dma5_debug_port (dma5_debug_port),
  .dma6_debug_port (dma6_debug_port),
  .dma7_debug_port (dma7_debug_port),
  .dma8_debug_port (dma8_debug_port),
  .dma9_debug_port (dma9_debug_port),
  .dma10_debug_port (dma10_debug_port),
  .dma11_debug_port (dma11_debug_port),
  .dma12_debug_port (dma12_debug_port),
  .dma13_debug_port (dma13_debug_port),
  .dma14_debug_port (dma14_debug_port),
  .dma15_debug_port (dma15_debug_port),

`ifdef NEPTUNE
  .dma16_debug_port (dma16_debug_port),
  .dma17_debug_port (dma17_debug_port),
  .dma18_debug_port (dma18_debug_port),
  .dma19_debug_port (dma19_debug_port),
  .dma20_debug_port (dma20_debug_port),
  .dma21_debug_port (dma21_debug_port),
  .dma22_debug_port (dma22_debug_port),
  .dma23_debug_port (dma23_debug_port),

`else
`endif
				  .training_vector(training_vector),
				  .TxCacheFetchState(TxCacheFetchState),
				  .mbox_debug_state(mbox_debug_state[11:0]),
				  .debug_select(debug_select[5:0]));
   

   niu_dmc_cache_dataFetch niu_dmc_cache_dataFetch(/*AUTOJUNK*/
						   `ifdef NEPTUNE
						   `else
						   .tcu_aclk                               (tcu_aclk),
						   .tcu_bclk                               (tcu_bclk),
						   .tcu_se_scancollar_in                   (tcu_se_scancollar_in),
						   .tcu_se_scancollar_out                  (tcu_se_scancollar_out),
						   .tcu_array_wr_inhibit                   (tcu_array_wr_inhibit),
						   .tds_tdmc_mbist_scan_in                 (tds_tdmc_mbist_scan_in),
						   .tds_tdmc_mbist_scan_out                (tds_tdmc_mbist_scan_out),
						   .tcu_mbist_bisi_en                      (tcu_mbist_bisi_en),
						   .tcu_tds_tdmc_mbist_start               (tcu_tds_tdmc_mbist_start),
						   .tds_tdmc_tcu_mbist_fail                (tds_tdmc_tcu_mbist_fail),
						   .tds_tdmc_tcu_mbist_done                (tds_tdmc_tcu_mbist_done),
						   .tcu_mbist_user_mode                    (tcu_mbist_user_mode),
						   .tcu_scan_en                            (tcu_scan_en                            ),
						   .l2clk_2x ( l2clk_2x ),
						   .iol2clk(iol2clk),

						   .hdr_sram_rvalue_tdmc            (hdr_sram_rvalue_tdmc),
						   .hdr_sram_rid_tdmc               (hdr_sram_rid_tdmc),
						   .hdr_sram_wr_en_tdmc             (hdr_sram_wr_en_tdmc),
						   .hdr_sram_red_clr_tdmc           (hdr_sram_red_clr_tdmc),
						   .sram_hdr_read_data_tdmc         (sram_hdr_read_data_tdmc),
						   .tds_tcu_dmo_data_out            (tds_tcu_dmo_data_out),
						   .sram_reset			    (sram_reset),
						   `endif	
						   // Outputs for debug
						   .TxCacheFetchState(TxCacheFetchState),

						   // Outputs
						   
						   .DMC_TxCache_SMX_Req(DMC_TxCache_SMX_Req),
						   .DMC_TxCache_SMX_Req_Port_Num(DMC_TxCache_SMX_Req_Port_Num[1:0]),
						   .DMC_TxCache_SMX_Req_DMA_Num(DMC_TxCache_SMX_Req_DMA_Num[4:0]),
						   .DMC_TxCache_SMX_Req_Cmd(DMC_TxCache_SMX_Req_Cmd[7:0]),
						   .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
						   .DMC_TxCache_SMX_Req_Address(DMC_TxCache_SMX_Req_Address[63:0]),
						   .DMC_TxCache_SMX_Resp_Accept(DMC_TxCache_SMX_Resp_Accept),
						   .tdmc_arb1_req_func_num(tdmc_arb1_req_func_num),
						   .dmc_txc_dma0_active(dmc_txc_dma0_active),
						   .dmc_txc_dma0_eoflist(dmc_txc_dma0_eoflist),
						   .dmc_txc_dma0_gotnxtdesc(dmc_txc_dma0_gotnxtdesc),
						   .dmc_txc_dma0_descriptor(dmc_txc_dma0_descriptor[63:0]),
						   .dmc_txc_dma0_cacheready(dmc_txc_dma0_cacheready),
						   .dmc_txc_dma0_partial(dmc_txc_dma0_partial),
						   .dmc_txc_dma0_reset_scheduled(dmc_txc_dma0_reset_scheduled),
						   .dmc_txc_dma1_active(dmc_txc_dma1_active),
						   .dmc_txc_dma1_eoflist(dmc_txc_dma1_eoflist),
						   .dmc_txc_dma1_gotnxtdesc(dmc_txc_dma1_gotnxtdesc),
						   .dmc_txc_dma1_descriptor(dmc_txc_dma1_descriptor[63:0]),
						   .dmc_txc_dma1_cacheready(dmc_txc_dma1_cacheready),
						   .dmc_txc_dma1_partial(dmc_txc_dma1_partial),
						   .dmc_txc_dma1_reset_scheduled(dmc_txc_dma1_reset_scheduled),
						   .dmc_txc_dma2_active(dmc_txc_dma2_active),
						   .dmc_txc_dma2_eoflist(dmc_txc_dma2_eoflist),
						   .dmc_txc_dma2_gotnxtdesc(dmc_txc_dma2_gotnxtdesc),
						   .dmc_txc_dma2_descriptor(dmc_txc_dma2_descriptor[63:0]),
						   .dmc_txc_dma2_cacheready(dmc_txc_dma2_cacheready),
						   .dmc_txc_dma2_partial(dmc_txc_dma2_partial),
						   .dmc_txc_dma2_reset_scheduled(dmc_txc_dma2_reset_scheduled),
						   .dmc_txc_dma3_active(dmc_txc_dma3_active),
						   .dmc_txc_dma3_eoflist(dmc_txc_dma3_eoflist),
						   .dmc_txc_dma3_gotnxtdesc(dmc_txc_dma3_gotnxtdesc),
						   .dmc_txc_dma3_descriptor(dmc_txc_dma3_descriptor[63:0]),
						   .dmc_txc_dma3_cacheready(dmc_txc_dma3_cacheready),
						   .dmc_txc_dma3_partial(dmc_txc_dma3_partial),
						   .dmc_txc_dma3_reset_scheduled(dmc_txc_dma3_reset_scheduled),
						   .dmc_txc_dma4_active(dmc_txc_dma4_active),
						   .dmc_txc_dma4_eoflist(dmc_txc_dma4_eoflist),
						   .dmc_txc_dma4_gotnxtdesc(dmc_txc_dma4_gotnxtdesc),
						   .dmc_txc_dma4_descriptor(dmc_txc_dma4_descriptor[63:0]),
						   .dmc_txc_dma4_cacheready(dmc_txc_dma4_cacheready),
						   .dmc_txc_dma4_partial(dmc_txc_dma4_partial),
						   .dmc_txc_dma4_reset_scheduled(dmc_txc_dma4_reset_scheduled),
						   .dmc_txc_dma5_active(dmc_txc_dma5_active),
						   .dmc_txc_dma5_eoflist(dmc_txc_dma5_eoflist),
						   .dmc_txc_dma5_gotnxtdesc(dmc_txc_dma5_gotnxtdesc),
						   .dmc_txc_dma5_descriptor(dmc_txc_dma5_descriptor[63:0]),
						   .dmc_txc_dma5_cacheready(dmc_txc_dma5_cacheready),
						   .dmc_txc_dma5_partial(dmc_txc_dma5_partial),
						   .dmc_txc_dma5_reset_scheduled(dmc_txc_dma5_reset_scheduled),
						   .dmc_txc_dma6_active(dmc_txc_dma6_active),
						   .dmc_txc_dma6_eoflist(dmc_txc_dma6_eoflist),
						   .dmc_txc_dma6_gotnxtdesc(dmc_txc_dma6_gotnxtdesc),
						   .dmc_txc_dma6_descriptor(dmc_txc_dma6_descriptor[63:0]),
						   .dmc_txc_dma6_cacheready(dmc_txc_dma6_cacheready),
						   .dmc_txc_dma6_partial(dmc_txc_dma6_partial),
						   .dmc_txc_dma6_reset_scheduled(dmc_txc_dma6_reset_scheduled),
						   .dmc_txc_dma7_active(dmc_txc_dma7_active),
						   .dmc_txc_dma7_eoflist(dmc_txc_dma7_eoflist),
						   .dmc_txc_dma7_gotnxtdesc(dmc_txc_dma7_gotnxtdesc),
						   .dmc_txc_dma7_descriptor(dmc_txc_dma7_descriptor[63:0]),
						   .dmc_txc_dma7_cacheready(dmc_txc_dma7_cacheready),
						   .dmc_txc_dma7_partial(dmc_txc_dma7_partial),
						   .dmc_txc_dma7_reset_scheduled(dmc_txc_dma7_reset_scheduled),
						   .dmc_txc_dma8_active(dmc_txc_dma8_active),
						   .dmc_txc_dma8_eoflist(dmc_txc_dma8_eoflist),
						   .dmc_txc_dma8_gotnxtdesc(dmc_txc_dma8_gotnxtdesc),
						   .dmc_txc_dma8_descriptor(dmc_txc_dma8_descriptor[63:0]),
						   .dmc_txc_dma8_cacheready(dmc_txc_dma8_cacheready),
						   .dmc_txc_dma8_partial(dmc_txc_dma8_partial),
						   .dmc_txc_dma8_reset_scheduled(dmc_txc_dma8_reset_scheduled),
						   .dmc_txc_dma9_active(dmc_txc_dma9_active),
						   .dmc_txc_dma9_eoflist(dmc_txc_dma9_eoflist),
						   .dmc_txc_dma9_gotnxtdesc(dmc_txc_dma9_gotnxtdesc),
						   .dmc_txc_dma9_descriptor(dmc_txc_dma9_descriptor[63:0]),
						   .dmc_txc_dma9_cacheready(dmc_txc_dma9_cacheready),
						   .dmc_txc_dma9_partial(dmc_txc_dma9_partial),
						   .dmc_txc_dma9_reset_scheduled(dmc_txc_dma9_reset_scheduled),
						   .dmc_txc_dma10_active(dmc_txc_dma10_active),
						   .dmc_txc_dma10_eoflist(dmc_txc_dma10_eoflist),
						   .dmc_txc_dma10_gotnxtdesc(dmc_txc_dma10_gotnxtdesc),
						   .dmc_txc_dma10_descriptor(dmc_txc_dma10_descriptor[63:0]),
						   .dmc_txc_dma10_cacheready(dmc_txc_dma10_cacheready),
						   .dmc_txc_dma10_partial(dmc_txc_dma10_partial),
						   .dmc_txc_dma10_reset_scheduled(dmc_txc_dma10_reset_scheduled),
						   .dmc_txc_dma11_active(dmc_txc_dma11_active),
						   .dmc_txc_dma11_eoflist(dmc_txc_dma11_eoflist),
						   .dmc_txc_dma11_gotnxtdesc(dmc_txc_dma11_gotnxtdesc),
						   .dmc_txc_dma11_descriptor(dmc_txc_dma11_descriptor[63:0]),
						   .dmc_txc_dma11_cacheready(dmc_txc_dma11_cacheready),
						   .dmc_txc_dma11_partial(dmc_txc_dma11_partial),
						   .dmc_txc_dma11_reset_scheduled(dmc_txc_dma11_reset_scheduled),
						   .dmc_txc_dma12_active(dmc_txc_dma12_active),
						   .dmc_txc_dma12_eoflist(dmc_txc_dma12_eoflist),
						   .dmc_txc_dma12_gotnxtdesc(dmc_txc_dma12_gotnxtdesc),
						   .dmc_txc_dma12_descriptor(dmc_txc_dma12_descriptor[63:0]),
						   .dmc_txc_dma12_cacheready(dmc_txc_dma12_cacheready),
						   .dmc_txc_dma12_partial(dmc_txc_dma12_partial),
						   .dmc_txc_dma12_reset_scheduled(dmc_txc_dma12_reset_scheduled),
						   .dmc_txc_dma13_active(dmc_txc_dma13_active),
						   .dmc_txc_dma13_eoflist(dmc_txc_dma13_eoflist),
						   .dmc_txc_dma13_gotnxtdesc(dmc_txc_dma13_gotnxtdesc),
						   .dmc_txc_dma13_descriptor(dmc_txc_dma13_descriptor[63:0]),
						   .dmc_txc_dma13_cacheready(dmc_txc_dma13_cacheready),
						   .dmc_txc_dma13_partial(dmc_txc_dma13_partial),
						   .dmc_txc_dma13_reset_scheduled(dmc_txc_dma13_reset_scheduled),
						   .dmc_txc_dma14_active(dmc_txc_dma14_active),
						   .dmc_txc_dma14_eoflist(dmc_txc_dma14_eoflist),
						   .dmc_txc_dma14_gotnxtdesc(dmc_txc_dma14_gotnxtdesc),
						   .dmc_txc_dma14_descriptor(dmc_txc_dma14_descriptor[63:0]),
						   .dmc_txc_dma14_cacheready(dmc_txc_dma14_cacheready),
						   .dmc_txc_dma14_partial(dmc_txc_dma14_partial),
						   .dmc_txc_dma14_reset_scheduled(dmc_txc_dma14_reset_scheduled),
						   .dmc_txc_dma15_active(dmc_txc_dma15_active),
						   .dmc_txc_dma15_eoflist(dmc_txc_dma15_eoflist),
						   .dmc_txc_dma15_gotnxtdesc(dmc_txc_dma15_gotnxtdesc),
						   .dmc_txc_dma15_descriptor(dmc_txc_dma15_descriptor[63:0]),
						   .dmc_txc_dma15_cacheready(dmc_txc_dma15_cacheready),
						   .dmc_txc_dma15_partial(dmc_txc_dma15_partial),
						   .dmc_txc_dma15_reset_scheduled(dmc_txc_dma15_reset_scheduled),
  .dma0_debug_port (dma0_debug_port),
  .dma1_debug_port (dma1_debug_port),
  .dma2_debug_port (dma2_debug_port),
  .dma3_debug_port (dma3_debug_port),
  .dma4_debug_port (dma4_debug_port),
  .dma5_debug_port (dma5_debug_port),
  .dma6_debug_port (dma6_debug_port),
  .dma7_debug_port (dma7_debug_port),
  .dma8_debug_port (dma8_debug_port),
  .dma9_debug_port (dma9_debug_port),
  .dma10_debug_port (dma10_debug_port),
  .dma11_debug_port (dma11_debug_port),
  .dma12_debug_port (dma12_debug_port),
  .dma13_debug_port (dma13_debug_port),
  .dma14_debug_port (dma14_debug_port),
  .dma15_debug_port (dma15_debug_port),

`ifdef NEPTUNE
						   .dmc_txc_dma16_active(dmc_txc_dma16_active),
						   .dmc_txc_dma16_eoflist(dmc_txc_dma16_eoflist),
						   .dmc_txc_dma16_gotnxtdesc(dmc_txc_dma16_gotnxtdesc),
						   .dmc_txc_dma16_descriptor(dmc_txc_dma16_descriptor[63:0]),
						   .dmc_txc_dma16_cacheready(dmc_txc_dma16_cacheready),
						   .dmc_txc_dma16_partial(dmc_txc_dma16_partial),
						   .dmc_txc_dma16_reset_scheduled(dmc_txc_dma16_reset_scheduled),
						   .dmc_txc_dma17_active(dmc_txc_dma17_active),
						   .dmc_txc_dma17_eoflist(dmc_txc_dma17_eoflist),
						   .dmc_txc_dma17_gotnxtdesc(dmc_txc_dma17_gotnxtdesc),
						   .dmc_txc_dma17_descriptor(dmc_txc_dma17_descriptor[63:0]),
						   .dmc_txc_dma17_cacheready(dmc_txc_dma17_cacheready),
						   .dmc_txc_dma17_partial(dmc_txc_dma17_partial),
						   .dmc_txc_dma17_reset_scheduled(dmc_txc_dma17_reset_scheduled),
						   .dmc_txc_dma18_active(dmc_txc_dma18_active),
						   .dmc_txc_dma18_eoflist(dmc_txc_dma18_eoflist),
						   .dmc_txc_dma18_gotnxtdesc(dmc_txc_dma18_gotnxtdesc),
						   .dmc_txc_dma18_descriptor(dmc_txc_dma18_descriptor[63:0]),
						   .dmc_txc_dma18_cacheready(dmc_txc_dma18_cacheready),
						   .dmc_txc_dma18_partial(dmc_txc_dma18_partial),
						   .dmc_txc_dma18_reset_scheduled(dmc_txc_dma18_reset_scheduled),
						   .dmc_txc_dma19_active(dmc_txc_dma19_active),
						   .dmc_txc_dma19_eoflist(dmc_txc_dma19_eoflist),
						   .dmc_txc_dma19_gotnxtdesc(dmc_txc_dma19_gotnxtdesc),
						   .dmc_txc_dma19_descriptor(dmc_txc_dma19_descriptor[63:0]),
						   .dmc_txc_dma19_cacheready(dmc_txc_dma19_cacheready),
						   .dmc_txc_dma19_partial(dmc_txc_dma19_partial),
						   .dmc_txc_dma19_reset_scheduled(dmc_txc_dma19_reset_scheduled),
						   .dmc_txc_dma20_active(dmc_txc_dma20_active),
						   .dmc_txc_dma20_eoflist(dmc_txc_dma20_eoflist),
						   .dmc_txc_dma20_gotnxtdesc(dmc_txc_dma20_gotnxtdesc),
						   .dmc_txc_dma20_descriptor(dmc_txc_dma20_descriptor[63:0]),
						   .dmc_txc_dma20_cacheready(dmc_txc_dma20_cacheready),
						   .dmc_txc_dma20_partial(dmc_txc_dma20_partial),
						   .dmc_txc_dma20_reset_scheduled(dmc_txc_dma20_reset_scheduled),
						   .dmc_txc_dma21_active(dmc_txc_dma21_active),
						   .dmc_txc_dma21_eoflist(dmc_txc_dma21_eoflist),
						   .dmc_txc_dma21_gotnxtdesc(dmc_txc_dma21_gotnxtdesc),
						   .dmc_txc_dma21_descriptor(dmc_txc_dma21_descriptor[63:0]),
						   .dmc_txc_dma21_cacheready(dmc_txc_dma21_cacheready),
						   .dmc_txc_dma21_partial(dmc_txc_dma21_partial),
						   .dmc_txc_dma21_reset_scheduled(dmc_txc_dma21_reset_scheduled),
						   .dmc_txc_dma22_active(dmc_txc_dma22_active),
						   .dmc_txc_dma22_eoflist(dmc_txc_dma22_eoflist),
						   .dmc_txc_dma22_gotnxtdesc(dmc_txc_dma22_gotnxtdesc),
						   .dmc_txc_dma22_descriptor(dmc_txc_dma22_descriptor[63:0]),
						   .dmc_txc_dma22_cacheready(dmc_txc_dma22_cacheready),
						   .dmc_txc_dma22_partial(dmc_txc_dma22_partial),
						   .dmc_txc_dma22_reset_scheduled(dmc_txc_dma22_reset_scheduled),
						   .dmc_txc_dma23_active(dmc_txc_dma23_active),
						   .dmc_txc_dma23_eoflist(dmc_txc_dma23_eoflist),
						   .dmc_txc_dma23_gotnxtdesc(dmc_txc_dma23_gotnxtdesc),
						   .dmc_txc_dma23_descriptor(dmc_txc_dma23_descriptor[63:0]),
						   .dmc_txc_dma23_cacheready(dmc_txc_dma23_cacheready),
						   .dmc_txc_dma23_partial(dmc_txc_dma23_partial),
						   .dmc_txc_dma23_reset_scheduled(dmc_txc_dma23_reset_scheduled),
  .dma16_debug_port (dma16_debug_port),
  .dma17_debug_port (dma17_debug_port),
  .dma18_debug_port (dma18_debug_port),
  .dma19_debug_port (dma19_debug_port),
  .dma20_debug_port (dma20_debug_port),
  .dma21_debug_port (dma21_debug_port),
  .dma22_debug_port (dma22_debug_port),
  .dma23_debug_port (dma23_debug_port),




`endif


						   
						   .tx_rng_head_dma0(tx_rng_head_dma0[`PTR_WIDTH:0]),
						   .dma0_clear_reset(dma0_clear_reset),
						   .tx_rng_head_dma1(tx_rng_head_dma1[`PTR_WIDTH:0]),
						   .dma1_clear_reset(dma1_clear_reset),
						   .tx_rng_head_dma2(tx_rng_head_dma2[`PTR_WIDTH:0]),
						   .dma2_clear_reset(dma2_clear_reset),
						   .tx_rng_head_dma3(tx_rng_head_dma3[`PTR_WIDTH:0]),
						   .dma3_clear_reset(dma3_clear_reset),
						   .tx_rng_head_dma4(tx_rng_head_dma4[`PTR_WIDTH:0]),
						   .dma4_clear_reset(dma4_clear_reset),
						   .tx_rng_head_dma5(tx_rng_head_dma5[`PTR_WIDTH:0]),
						   .dma5_clear_reset(dma5_clear_reset),
						   .tx_rng_head_dma6(tx_rng_head_dma6[`PTR_WIDTH:0]),
						   .dma6_clear_reset(dma6_clear_reset),
						   .tx_rng_head_dma7(tx_rng_head_dma7[`PTR_WIDTH:0]),
						   .dma7_clear_reset(dma7_clear_reset),
						   .tx_rng_head_dma8(tx_rng_head_dma8[`PTR_WIDTH:0]),
						   .dma8_clear_reset(dma8_clear_reset),
						   .tx_rng_head_dma9(tx_rng_head_dma9[`PTR_WIDTH:0]),
						   .dma9_clear_reset(dma9_clear_reset),
						   .tx_rng_head_dma10(tx_rng_head_dma10[`PTR_WIDTH:0]),
						   .dma10_clear_reset(dma10_clear_reset),
						   .tx_rng_head_dma11(tx_rng_head_dma11[`PTR_WIDTH:0]),
						   .dma11_clear_reset(dma11_clear_reset),
						   .tx_rng_head_dma12(tx_rng_head_dma12[`PTR_WIDTH:0]),
						   .dma12_clear_reset(dma12_clear_reset),
						   .tx_rng_head_dma13(tx_rng_head_dma13[`PTR_WIDTH:0]),
						   .dma13_clear_reset(dma13_clear_reset),
						   .tx_rng_head_dma14(tx_rng_head_dma14[`PTR_WIDTH:0]),
						   .dma14_clear_reset(dma14_clear_reset),
						   .tx_rng_head_dma15(tx_rng_head_dma15[`PTR_WIDTH:0]),
						   .dma15_clear_reset(dma15_clear_reset),
						   
`ifdef NEPTUNE
						   
						   .tx_rng_head_dma16(tx_rng_head_dma16[`PTR_WIDTH:0]),
						   .dma16_clear_reset(dma16_clear_reset),
						   .tx_rng_head_dma17(tx_rng_head_dma17[`PTR_WIDTH:0]),
						   .dma17_clear_reset(dma17_clear_reset),
						   .tx_rng_head_dma18(tx_rng_head_dma18[`PTR_WIDTH:0]),
						   .dma18_clear_reset(dma18_clear_reset),
						   .tx_rng_head_dma19(tx_rng_head_dma19[`PTR_WIDTH:0]),
						   .dma19_clear_reset(dma19_clear_reset),
						   .tx_rng_head_dma20(tx_rng_head_dma20[`PTR_WIDTH:0]),
						   .dma20_clear_reset(dma20_clear_reset),
						   .tx_rng_head_dma21(tx_rng_head_dma21[`PTR_WIDTH:0]),
						   .dma21_clear_reset(dma21_clear_reset),
						   .tx_rng_head_dma22(tx_rng_head_dma22[`PTR_WIDTH:0]),
						   .dma22_clear_reset(dma22_clear_reset),
						   .tx_rng_head_dma23(tx_rng_head_dma23[`PTR_WIDTH:0]),
						   .dma23_clear_reset(dma23_clear_reset),


`endif



						   
						   .set_pref_buf_par_err_dma0(set_pref_buf_par_err_dma0),
						   .set_pkt_part_err_dma0(set_pkt_part_err_dma0),
						   .pkt_part_error_address_dma0(pkt_part_error_address_dma0[43:0]),
						   .set_conf_part_error_dma0(set_conf_part_error_dma0),
						   .set_pref_buf_par_err_dma1(set_pref_buf_par_err_dma1),
						   .set_pkt_part_err_dma1(set_pkt_part_err_dma1),
						   .pkt_part_error_address_dma1(pkt_part_error_address_dma1[43:0]),
						   .set_conf_part_error_dma1(set_conf_part_error_dma1),
						   .set_pref_buf_par_err_dma2(set_pref_buf_par_err_dma2),
						   .set_pkt_part_err_dma2(set_pkt_part_err_dma2),
						   .pkt_part_error_address_dma2(pkt_part_error_address_dma2[43:0]),
						   .set_conf_part_error_dma2(set_conf_part_error_dma2),
						   .set_pref_buf_par_err_dma3(set_pref_buf_par_err_dma3),
						   .set_pkt_part_err_dma3(set_pkt_part_err_dma3),
						   .pkt_part_error_address_dma3(pkt_part_error_address_dma3[43:0]),
						   .set_conf_part_error_dma3(set_conf_part_error_dma3),
						   .set_pref_buf_par_err_dma4(set_pref_buf_par_err_dma4),
						   .set_pkt_part_err_dma4(set_pkt_part_err_dma4),
						   .pkt_part_error_address_dma4(pkt_part_error_address_dma4[43:0]),
						   .set_conf_part_error_dma4(set_conf_part_error_dma4),
						   .set_pref_buf_par_err_dma5(set_pref_buf_par_err_dma5),
						   .set_pkt_part_err_dma5(set_pkt_part_err_dma5),
						   .pkt_part_error_address_dma5(pkt_part_error_address_dma5[43:0]),
						   .set_conf_part_error_dma5(set_conf_part_error_dma5),
						   .set_pref_buf_par_err_dma6(set_pref_buf_par_err_dma6),
						   .set_pkt_part_err_dma6(set_pkt_part_err_dma6),
						   .pkt_part_error_address_dma6(pkt_part_error_address_dma6[43:0]),
						   .set_conf_part_error_dma6(set_conf_part_error_dma6),
						   .set_pref_buf_par_err_dma7(set_pref_buf_par_err_dma7),
						   .set_pkt_part_err_dma7(set_pkt_part_err_dma7),
						   .pkt_part_error_address_dma7(pkt_part_error_address_dma7[43:0]),
						   .set_conf_part_error_dma7(set_conf_part_error_dma7),
						   .set_pref_buf_par_err_dma8(set_pref_buf_par_err_dma8),
						   .set_pkt_part_err_dma8(set_pkt_part_err_dma8),
						   .pkt_part_error_address_dma8(pkt_part_error_address_dma8[43:0]),
						   .set_conf_part_error_dma8(set_conf_part_error_dma8),
						   .set_pref_buf_par_err_dma9(set_pref_buf_par_err_dma9),
						   .set_pkt_part_err_dma9(set_pkt_part_err_dma9),
						   .pkt_part_error_address_dma9(pkt_part_error_address_dma9[43:0]),
						   .set_conf_part_error_dma9(set_conf_part_error_dma9),
						   .set_pref_buf_par_err_dma10(set_pref_buf_par_err_dma10),
						   .set_pkt_part_err_dma10(set_pkt_part_err_dma10),
						   .pkt_part_error_address_dma10(pkt_part_error_address_dma10[43:0]),
						   .set_conf_part_error_dma10(set_conf_part_error_dma10),
						   .set_pref_buf_par_err_dma11(set_pref_buf_par_err_dma11),
						   .set_pkt_part_err_dma11(set_pkt_part_err_dma11),
						   .pkt_part_error_address_dma11(pkt_part_error_address_dma11[43:0]),
						   .set_conf_part_error_dma11(set_conf_part_error_dma11),
						   .set_pref_buf_par_err_dma12(set_pref_buf_par_err_dma12),
						   .set_pkt_part_err_dma12(set_pkt_part_err_dma12),
						   .pkt_part_error_address_dma12(pkt_part_error_address_dma12[43:0]),
						   .set_conf_part_error_dma12(set_conf_part_error_dma12),
						   .set_pref_buf_par_err_dma13(set_pref_buf_par_err_dma13),
						   .set_pkt_part_err_dma13(set_pkt_part_err_dma13),
						   .pkt_part_error_address_dma13(pkt_part_error_address_dma13[43:0]),
						   .set_conf_part_error_dma13(set_conf_part_error_dma13),
						   .set_pref_buf_par_err_dma14(set_pref_buf_par_err_dma14),
						   .set_pkt_part_err_dma14(set_pkt_part_err_dma14),
						   .pkt_part_error_address_dma14(pkt_part_error_address_dma14[43:0]),
						   .set_conf_part_error_dma14(set_conf_part_error_dma14),
						   .set_pref_buf_par_err_dma15(set_pref_buf_par_err_dma15),
						   .set_pkt_part_err_dma15(set_pkt_part_err_dma15),
						   .pkt_part_error_address_dma15(pkt_part_error_address_dma15[43:0]),
						   .set_conf_part_error_dma15(set_conf_part_error_dma15),
						   .set_tx_ring_oflow_dma0(set_tx_ring_oflow_dma0),
						   .set_tx_ring_oflow_dma1(set_tx_ring_oflow_dma1),
						   .set_tx_ring_oflow_dma2(set_tx_ring_oflow_dma2),
						   .set_tx_ring_oflow_dma3(set_tx_ring_oflow_dma3),
						   .set_tx_ring_oflow_dma4(set_tx_ring_oflow_dma4),
						   .set_tx_ring_oflow_dma5(set_tx_ring_oflow_dma5),
						   .set_tx_ring_oflow_dma6(set_tx_ring_oflow_dma6),
						   .set_tx_ring_oflow_dma7(set_tx_ring_oflow_dma7),
						   .set_tx_ring_oflow_dma8(set_tx_ring_oflow_dma8),
						   .set_tx_ring_oflow_dma9(set_tx_ring_oflow_dma9),
						   .set_tx_ring_oflow_dma10(set_tx_ring_oflow_dma10),
						   .set_tx_ring_oflow_dma11(set_tx_ring_oflow_dma11),
						   .set_tx_ring_oflow_dma12(set_tx_ring_oflow_dma12),
						   .set_tx_ring_oflow_dma13(set_tx_ring_oflow_dma13),
						   .set_tx_ring_oflow_dma14(set_tx_ring_oflow_dma14),
						   .set_tx_ring_oflow_dma15(set_tx_ring_oflow_dma15),


`ifdef NEPTUNE
						   .set_pref_buf_par_err_dma16(set_pref_buf_par_err_dma16),
						   .set_pkt_part_err_dma16(set_pkt_part_err_dma16),
						   .pkt_part_error_address_dma16(pkt_part_error_address_dma16[43:0]),
						   .set_conf_part_error_dma16(set_conf_part_error_dma16),
						   .set_pref_buf_par_err_dma17(set_pref_buf_par_err_dma17),
						   .set_pkt_part_err_dma17(set_pkt_part_err_dma17),
						   .pkt_part_error_address_dma17(pkt_part_error_address_dma17[43:0]),
						   .set_conf_part_error_dma17(set_conf_part_error_dma17),
						   .set_pref_buf_par_err_dma18(set_pref_buf_par_err_dma18),
						   .set_pkt_part_err_dma18(set_pkt_part_err_dma18),
						   .pkt_part_error_address_dma18(pkt_part_error_address_dma18[43:0]),
						   .set_conf_part_error_dma18(set_conf_part_error_dma18),
						   .set_pref_buf_par_err_dma19(set_pref_buf_par_err_dma19),
						   .set_pkt_part_err_dma19(set_pkt_part_err_dma19),
						   .pkt_part_error_address_dma19(pkt_part_error_address_dma19[43:0]),
						   .set_conf_part_error_dma19(set_conf_part_error_dma19),
						   .set_pref_buf_par_err_dma20(set_pref_buf_par_err_dma20),
						   .set_pkt_part_err_dma20(set_pkt_part_err_dma20),
						   .pkt_part_error_address_dma20(pkt_part_error_address_dma20[43:0]),
						   .set_conf_part_error_dma20(set_conf_part_error_dma20),
						   .set_pref_buf_par_err_dma21(set_pref_buf_par_err_dma21),
						   .set_pkt_part_err_dma21(set_pkt_part_err_dma21),
						   .pkt_part_error_address_dma21(pkt_part_error_address_dma21[43:0]),
						   .set_conf_part_error_dma21(set_conf_part_error_dma21),
						   .set_pref_buf_par_err_dma22(set_pref_buf_par_err_dma22),
						   .set_pkt_part_err_dma22(set_pkt_part_err_dma22),
						   .pkt_part_error_address_dma22(pkt_part_error_address_dma22[43:0]),
						   .set_conf_part_error_dma22(set_conf_part_error_dma22),
						   .set_pref_buf_par_err_dma23(set_pref_buf_par_err_dma23),
						   .set_pkt_part_err_dma23(set_pkt_part_err_dma23),
						   .pkt_part_error_address_dma23(pkt_part_error_address_dma23[43:0]),
						   .set_conf_part_error_dma23(set_conf_part_error_dma23),
						   .set_tx_ring_oflow_dma16(set_tx_ring_oflow_dma16),
						   .set_tx_ring_oflow_dma17(set_tx_ring_oflow_dma17),
						   .set_tx_ring_oflow_dma18(set_tx_ring_oflow_dma18),
						   .set_tx_ring_oflow_dma19(set_tx_ring_oflow_dma19),
						   .set_tx_ring_oflow_dma20(set_tx_ring_oflow_dma20),
						   .set_tx_ring_oflow_dma21(set_tx_ring_oflow_dma21),
						   .set_tx_ring_oflow_dma22(set_tx_ring_oflow_dma22),
						   .set_tx_ring_oflow_dma23(set_tx_ring_oflow_dma23),


`endif

						   
						   .txpref_dma_nack_resp(txpref_dma_nack_resp[`NO_OF_DMAS - 1:0]),
						   .txpref_nack_resp(txpref_nack_resp),
						   .txpref_nack_rd_addr(txpref_nack_rd_addr[43:0]),
						   .tx_dma_cfg_dma0_stop_state(tx_dma_cfg_dma0_stop_state),
						   .tx_dma_cfg_dma1_stop_state(tx_dma_cfg_dma1_stop_state),
						   .tx_dma_cfg_dma2_stop_state(tx_dma_cfg_dma2_stop_state),
						   .tx_dma_cfg_dma3_stop_state(tx_dma_cfg_dma3_stop_state),
						   .tx_dma_cfg_dma4_stop_state(tx_dma_cfg_dma4_stop_state),
						   .tx_dma_cfg_dma5_stop_state(tx_dma_cfg_dma5_stop_state),
						   .tx_dma_cfg_dma6_stop_state(tx_dma_cfg_dma6_stop_state),
						   .tx_dma_cfg_dma7_stop_state(tx_dma_cfg_dma7_stop_state),
						   .tx_dma_cfg_dma8_stop_state(tx_dma_cfg_dma8_stop_state),
						   .tx_dma_cfg_dma9_stop_state(tx_dma_cfg_dma9_stop_state),
						   .tx_dma_cfg_dma10_stop_state(tx_dma_cfg_dma10_stop_state),
						   .tx_dma_cfg_dma11_stop_state(tx_dma_cfg_dma11_stop_state),
						   .tx_dma_cfg_dma12_stop_state(tx_dma_cfg_dma12_stop_state),
						   .tx_dma_cfg_dma13_stop_state(tx_dma_cfg_dma13_stop_state),
						   .tx_dma_cfg_dma14_stop_state(tx_dma_cfg_dma14_stop_state),
						   .tx_dma_cfg_dma15_stop_state(tx_dma_cfg_dma15_stop_state),
`ifdef NEPTUNE
						   .tx_dma_cfg_dma16_stop_state(tx_dma_cfg_dma16_stop_state),
						   .tx_dma_cfg_dma17_stop_state(tx_dma_cfg_dma17_stop_state),
						   .tx_dma_cfg_dma18_stop_state(tx_dma_cfg_dma18_stop_state),
						   .tx_dma_cfg_dma19_stop_state(tx_dma_cfg_dma19_stop_state),
						   .tx_dma_cfg_dma20_stop_state(tx_dma_cfg_dma20_stop_state),
						   .tx_dma_cfg_dma21_stop_state(tx_dma_cfg_dma21_stop_state),
						   .tx_dma_cfg_dma22_stop_state(tx_dma_cfg_dma22_stop_state),
						   .tx_dma_cfg_dma23_stop_state(tx_dma_cfg_dma23_stop_state),





`endif
						   
						   .ShadowRingCurrentPtr_DMA0(ShadowRingCurrentPtr_DMA0),
						   .ShadowRingCurrentPtr_DMA1(ShadowRingCurrentPtr_DMA1),
						   .ShadowRingCurrentPtr_DMA2(ShadowRingCurrentPtr_DMA2),
						   .ShadowRingCurrentPtr_DMA3(ShadowRingCurrentPtr_DMA3),
						   .ShadowRingCurrentPtr_DMA4(ShadowRingCurrentPtr_DMA4),
						   .ShadowRingCurrentPtr_DMA5(ShadowRingCurrentPtr_DMA5),
						   .ShadowRingCurrentPtr_DMA6(ShadowRingCurrentPtr_DMA6),
						   .ShadowRingCurrentPtr_DMA7(ShadowRingCurrentPtr_DMA7),
						   .ShadowRingCurrentPtr_DMA8(ShadowRingCurrentPtr_DMA8),
						   .ShadowRingCurrentPtr_DMA9(ShadowRingCurrentPtr_DMA9),
						   .ShadowRingCurrentPtr_DMA10(ShadowRingCurrentPtr_DMA10),
						   .ShadowRingCurrentPtr_DMA11(ShadowRingCurrentPtr_DMA11),
						   .ShadowRingCurrentPtr_DMA12(ShadowRingCurrentPtr_DMA12),
						   .ShadowRingCurrentPtr_DMA13(ShadowRingCurrentPtr_DMA13),
						   .ShadowRingCurrentPtr_DMA14(ShadowRingCurrentPtr_DMA14),
						   .ShadowRingCurrentPtr_DMA15(ShadowRingCurrentPtr_DMA15),
`ifdef NEPTUNE
						   .ShadowRingCurrentPtr_DMA16(ShadowRingCurrentPtr_DMA16),
						   .ShadowRingCurrentPtr_DMA17(ShadowRingCurrentPtr_DMA17),
						   .ShadowRingCurrentPtr_DMA18(ShadowRingCurrentPtr_DMA18),
						   .ShadowRingCurrentPtr_DMA19(ShadowRingCurrentPtr_DMA19),
						   .ShadowRingCurrentPtr_DMA20(ShadowRingCurrentPtr_DMA20),
						   .ShadowRingCurrentPtr_DMA21(ShadowRingCurrentPtr_DMA21),
						   .ShadowRingCurrentPtr_DMA22(ShadowRingCurrentPtr_DMA22),
						   .ShadowRingCurrentPtr_DMA23(ShadowRingCurrentPtr_DMA23),

`endif
						   // Inputs
						   .SysClk(niu_clk),
						   .Reset_L(Reset_L),
						   .SMX_DMC_TxCache_Req_Ack(SMX_DMC_TxCache_Req_Ack),
						   .SMX_DMC_TxCache_Resp_Rdy(SMX_DMC_TxCache_Resp_Rdy),
						   .SMX_DMC_TxCache_Resp_Complete(SMX_DMC_TxCache_Resp_Complete),
						   .SMX_DMC_TxCache_Trans_Complete(SMX_DMC_TxCache_Trans_Complete),
						   .SMX_DMC_TxCache_Resp_Data_Valid(SMX_DMC_TxCache_Resp_Data_Valid),
						   .SMX_DMC_TxCache_Resp_DMA_Num(SMX_DMC_TxCache_Resp_DMA_Num[4:0]),
						   .SMX_DMC_TxCache_Resp_ByteEnables(SMX_DMC_TxCache_Resp_ByteEnables[15:0]),
						   .SMX_DMC_TxCache_Resp_Data_Length(SMX_DMC_TxCache_Resp_Data_Length[13:0]),
						   .SMX_DMC_TxCache_Resp_Address(SMX_DMC_TxCache_Resp_Address[63:0]),
						   .SMX_DMC_TxCache_Resp_Data(SMX_DMC_TxCache_Resp_Data[127:0]),
						   .meta_dmc_resp_cmd(meta_dmc_resp_cmd[7:0]),
						   .meta_dmc_resp_cmd_status(meta_dmc_resp_cmd_status[3:0]),
						   .meta_dmc_data_status(meta_dmc_data_status[3:0]),
						   .txc_dmc_dma0_getnxtdesc(txc_dmc_dma0_getnxtdesc),
						   .txc_dmc_dma0_inc_head(txc_dmc_dma0_inc_head),
						   .txc_dmc_dma0_reset_done(txc_dmc_dma0_reset_done),
						   .txc_dmc_dma1_getnxtdesc(txc_dmc_dma1_getnxtdesc),
						   .txc_dmc_dma1_inc_head(txc_dmc_dma1_inc_head),
						   .txc_dmc_dma1_reset_done(txc_dmc_dma1_reset_done),
						   .txc_dmc_dma2_getnxtdesc(txc_dmc_dma2_getnxtdesc),
						   .txc_dmc_dma2_inc_head(txc_dmc_dma2_inc_head),
						   .txc_dmc_dma2_reset_done(txc_dmc_dma2_reset_done),
						   .txc_dmc_dma3_getnxtdesc(txc_dmc_dma3_getnxtdesc),
						   .txc_dmc_dma3_inc_head(txc_dmc_dma3_inc_head),
						   .txc_dmc_dma3_reset_done(txc_dmc_dma3_reset_done),
						   .txc_dmc_dma4_getnxtdesc(txc_dmc_dma4_getnxtdesc),
						   .txc_dmc_dma4_inc_head(txc_dmc_dma4_inc_head),
						   .txc_dmc_dma4_reset_done(txc_dmc_dma4_reset_done),
						   .txc_dmc_dma5_getnxtdesc(txc_dmc_dma5_getnxtdesc),
						   .txc_dmc_dma5_inc_head(txc_dmc_dma5_inc_head),
						   .txc_dmc_dma5_reset_done(txc_dmc_dma5_reset_done),
						   .txc_dmc_dma6_getnxtdesc(txc_dmc_dma6_getnxtdesc),
						   .txc_dmc_dma6_inc_head(txc_dmc_dma6_inc_head),
						   .txc_dmc_dma6_reset_done(txc_dmc_dma6_reset_done),
						   .txc_dmc_dma7_getnxtdesc(txc_dmc_dma7_getnxtdesc),
						   .txc_dmc_dma7_inc_head(txc_dmc_dma7_inc_head),
						   .txc_dmc_dma7_reset_done(txc_dmc_dma7_reset_done),
						   .txc_dmc_dma8_getnxtdesc(txc_dmc_dma8_getnxtdesc),
						   .txc_dmc_dma8_inc_head(txc_dmc_dma8_inc_head),
						   .txc_dmc_dma8_reset_done(txc_dmc_dma8_reset_done),
						   .txc_dmc_dma9_getnxtdesc(txc_dmc_dma9_getnxtdesc),
						   .txc_dmc_dma9_inc_head(txc_dmc_dma9_inc_head),
						   .txc_dmc_dma9_reset_done(txc_dmc_dma9_reset_done),
						   .txc_dmc_dma10_getnxtdesc(txc_dmc_dma10_getnxtdesc),
						   .txc_dmc_dma10_inc_head(txc_dmc_dma10_inc_head),
						   .txc_dmc_dma10_reset_done(txc_dmc_dma10_reset_done),
						   .txc_dmc_dma11_getnxtdesc(txc_dmc_dma11_getnxtdesc),
						   .txc_dmc_dma11_inc_head(txc_dmc_dma11_inc_head),
						   .txc_dmc_dma11_reset_done(txc_dmc_dma11_reset_done),
						   .txc_dmc_dma12_getnxtdesc(txc_dmc_dma12_getnxtdesc),
						   .txc_dmc_dma12_inc_head(txc_dmc_dma12_inc_head),
						   .txc_dmc_dma12_reset_done(txc_dmc_dma12_reset_done),
						   .txc_dmc_dma13_getnxtdesc(txc_dmc_dma13_getnxtdesc),
						   .txc_dmc_dma13_inc_head(txc_dmc_dma13_inc_head),
						   .txc_dmc_dma13_reset_done(txc_dmc_dma13_reset_done),
						   .txc_dmc_dma14_getnxtdesc(txc_dmc_dma14_getnxtdesc),
						   .txc_dmc_dma14_inc_head(txc_dmc_dma14_inc_head),
						   .txc_dmc_dma14_reset_done(txc_dmc_dma14_reset_done),
						   .txc_dmc_dma15_getnxtdesc(txc_dmc_dma15_getnxtdesc),
						   .txc_dmc_dma15_inc_head(txc_dmc_dma15_inc_head),
						   .txc_dmc_dma15_reset_done(txc_dmc_dma15_reset_done),
`ifdef NEPTUNE
						   .txc_dmc_dma16_getnxtdesc(txc_dmc_dma16_getnxtdesc),
						   .txc_dmc_dma16_inc_head(txc_dmc_dma16_inc_head),
						   .txc_dmc_dma16_reset_done(txc_dmc_dma16_reset_done),
						   .txc_dmc_dma17_getnxtdesc(txc_dmc_dma17_getnxtdesc),
						   .txc_dmc_dma17_inc_head(txc_dmc_dma17_inc_head),
						   .txc_dmc_dma17_reset_done(txc_dmc_dma17_reset_done),
						   .txc_dmc_dma18_getnxtdesc(txc_dmc_dma18_getnxtdesc),
						   .txc_dmc_dma18_inc_head(txc_dmc_dma18_inc_head),
						   .txc_dmc_dma18_reset_done(txc_dmc_dma18_reset_done),
						   .txc_dmc_dma19_getnxtdesc(txc_dmc_dma19_getnxtdesc),
						   .txc_dmc_dma19_inc_head(txc_dmc_dma19_inc_head),
						   .txc_dmc_dma19_reset_done(txc_dmc_dma19_reset_done),
						   .txc_dmc_dma20_getnxtdesc(txc_dmc_dma20_getnxtdesc),
						   .txc_dmc_dma20_inc_head(txc_dmc_dma20_inc_head),
						   .txc_dmc_dma20_reset_done(txc_dmc_dma20_reset_done),
						   .txc_dmc_dma21_getnxtdesc(txc_dmc_dma21_getnxtdesc),
						   .txc_dmc_dma21_inc_head(txc_dmc_dma21_inc_head),
						   .txc_dmc_dma21_reset_done(txc_dmc_dma21_reset_done),
						   .txc_dmc_dma22_getnxtdesc(txc_dmc_dma22_getnxtdesc),
						   .txc_dmc_dma22_inc_head(txc_dmc_dma22_inc_head),
						   .txc_dmc_dma22_reset_done(txc_dmc_dma22_reset_done),
						   .txc_dmc_dma23_getnxtdesc(txc_dmc_dma23_getnxtdesc),
						   .txc_dmc_dma23_inc_head(txc_dmc_dma23_inc_head),
						   .txc_dmc_dma23_reset_done(txc_dmc_dma23_reset_done),




`endif

						   
						   .tx_rng_cfg_dma0_len(tx_rng_cfg_dma0_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma0_staddr(tx_rng_cfg_dma0_staddr[37:0]),
						   .tx_rng_tail_dma0(tx_rng_tail_dma0[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma0_rst(tx_dma_cfg_dma0_rst),
						   .tx_dma_cfg_dma0_stall(tx_dma_cfg_dma0_stall),
						   .page0_mask_dma0(page0_mask_dma0[31:0]),
						   .page0_value_dma0(page0_value_dma0[31:0]),
						   .page0_reloc_dma0(page0_reloc_dma0[31:0]),
						   .page0_valid_dma0(page0_valid_dma0),
						   .page1_mask_dma0(page1_mask_dma0[31:0]),
						   .page1_value_dma0(page1_value_dma0[31:0]),
						   .page1_reloc_dma0(page1_reloc_dma0[31:0]),
						   .page1_valid_dma0(page1_valid_dma0),
						   .dmc_txc_dma0_page_handle(dmc_txc_dma0_page_handle[19:0]),
						   .tx_rng_cfg_dma1_len(tx_rng_cfg_dma1_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma1_staddr(tx_rng_cfg_dma1_staddr[37:0]),
						   .tx_rng_tail_dma1(tx_rng_tail_dma1[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma1_rst(tx_dma_cfg_dma1_rst),
						   .tx_dma_cfg_dma1_stall(tx_dma_cfg_dma1_stall),
						   .page0_mask_dma1(page0_mask_dma1[31:0]),
						   .page0_value_dma1(page0_value_dma1[31:0]),
						   .page0_reloc_dma1(page0_reloc_dma1[31:0]),
						   .page0_valid_dma1(page0_valid_dma1),
						   .page1_mask_dma1(page1_mask_dma1[31:0]),
						   .page1_value_dma1(page1_value_dma1[31:0]),
						   .page1_reloc_dma1(page1_reloc_dma1[31:0]),
						   .page1_valid_dma1(page1_valid_dma1),
						   .dmc_txc_dma1_page_handle(dmc_txc_dma1_page_handle[19:0]),
						   .tx_rng_cfg_dma2_len(tx_rng_cfg_dma2_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma2_staddr(tx_rng_cfg_dma2_staddr[37:0]),
						   .tx_rng_tail_dma2(tx_rng_tail_dma2[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma2_rst(tx_dma_cfg_dma2_rst),
						   .tx_dma_cfg_dma2_stall(tx_dma_cfg_dma2_stall),
						   .page0_mask_dma2(page0_mask_dma2[31:0]),
						   .page0_value_dma2(page0_value_dma2[31:0]),
						   .page0_reloc_dma2(page0_reloc_dma2[31:0]),
						   .page0_valid_dma2(page0_valid_dma2),
						   .page1_mask_dma2(page1_mask_dma2[31:0]),
						   .page1_value_dma2(page1_value_dma2[31:0]),
						   .page1_reloc_dma2(page1_reloc_dma2[31:0]),
						   .page1_valid_dma2(page1_valid_dma2),
						   .dmc_txc_dma2_page_handle(dmc_txc_dma2_page_handle[19:0]),
						   .tx_rng_cfg_dma3_len(tx_rng_cfg_dma3_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma3_staddr(tx_rng_cfg_dma3_staddr[37:0]),
						   .tx_rng_tail_dma3(tx_rng_tail_dma3[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma3_rst(tx_dma_cfg_dma3_rst),
						   .tx_dma_cfg_dma3_stall(tx_dma_cfg_dma3_stall),
						   .page0_mask_dma3(page0_mask_dma3[31:0]),
						   .page0_value_dma3(page0_value_dma3[31:0]),
						   .page0_reloc_dma3(page0_reloc_dma3[31:0]),
						   .page0_valid_dma3(page0_valid_dma3),
						   .page1_mask_dma3(page1_mask_dma3[31:0]),
						   .page1_value_dma3(page1_value_dma3[31:0]),
						   .page1_reloc_dma3(page1_reloc_dma3[31:0]),
						   .page1_valid_dma3(page1_valid_dma3),
						   .dmc_txc_dma3_page_handle(dmc_txc_dma3_page_handle[19:0]),
						   .tx_rng_cfg_dma4_len(tx_rng_cfg_dma4_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma4_staddr(tx_rng_cfg_dma4_staddr[37:0]),
						   .tx_rng_tail_dma4(tx_rng_tail_dma4[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma4_rst(tx_dma_cfg_dma4_rst),
						   .tx_dma_cfg_dma4_stall(tx_dma_cfg_dma4_stall),
						   .page0_mask_dma4(page0_mask_dma4[31:0]),
						   .page0_value_dma4(page0_value_dma4[31:0]),
						   .page0_reloc_dma4(page0_reloc_dma4[31:0]),
						   .page0_valid_dma4(page0_valid_dma4),
						   .page1_mask_dma4(page1_mask_dma4[31:0]),
						   .page1_value_dma4(page1_value_dma4[31:0]),
						   .page1_reloc_dma4(page1_reloc_dma4[31:0]),
						   .page1_valid_dma4(page1_valid_dma4),
						   .dmc_txc_dma4_page_handle(dmc_txc_dma4_page_handle[19:0]),
						   .tx_rng_cfg_dma5_len(tx_rng_cfg_dma5_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma5_staddr(tx_rng_cfg_dma5_staddr[37:0]),
						   .tx_rng_tail_dma5(tx_rng_tail_dma5[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma5_rst(tx_dma_cfg_dma5_rst),
						   .tx_dma_cfg_dma5_stall(tx_dma_cfg_dma5_stall),
						   .page0_mask_dma5(page0_mask_dma5[31:0]),
						   .page0_value_dma5(page0_value_dma5[31:0]),
						   .page0_reloc_dma5(page0_reloc_dma5[31:0]),
						   .page0_valid_dma5(page0_valid_dma5),
						   .page1_mask_dma5(page1_mask_dma5[31:0]),
						   .page1_value_dma5(page1_value_dma5[31:0]),
						   .page1_reloc_dma5(page1_reloc_dma5[31:0]),
						   .page1_valid_dma5(page1_valid_dma5),
						   .dmc_txc_dma5_page_handle(dmc_txc_dma5_page_handle[19:0]),
						   .tx_rng_cfg_dma6_len(tx_rng_cfg_dma6_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma6_staddr(tx_rng_cfg_dma6_staddr[37:0]),
						   .tx_rng_tail_dma6(tx_rng_tail_dma6[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma6_rst(tx_dma_cfg_dma6_rst),
						   .tx_dma_cfg_dma6_stall(tx_dma_cfg_dma6_stall),
						   .page0_mask_dma6(page0_mask_dma6[31:0]),
						   .page0_value_dma6(page0_value_dma6[31:0]),
						   .page0_reloc_dma6(page0_reloc_dma6[31:0]),
						   .page0_valid_dma6(page0_valid_dma6),
						   .page1_mask_dma6(page1_mask_dma6[31:0]),
						   .page1_value_dma6(page1_value_dma6[31:0]),
						   .page1_reloc_dma6(page1_reloc_dma6[31:0]),
						   .page1_valid_dma6(page1_valid_dma6),
						   .dmc_txc_dma6_page_handle(dmc_txc_dma6_page_handle[19:0]),
						   .tx_rng_cfg_dma7_len(tx_rng_cfg_dma7_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma7_staddr(tx_rng_cfg_dma7_staddr[37:0]),
						   .tx_rng_tail_dma7(tx_rng_tail_dma7[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma7_rst(tx_dma_cfg_dma7_rst),
						   .tx_dma_cfg_dma7_stall(tx_dma_cfg_dma7_stall),
						   .page0_mask_dma7(page0_mask_dma7[31:0]),
						   .page0_value_dma7(page0_value_dma7[31:0]),
						   .page0_reloc_dma7(page0_reloc_dma7[31:0]),
						   .page0_valid_dma7(page0_valid_dma7),
						   .page1_mask_dma7(page1_mask_dma7[31:0]),
						   .page1_value_dma7(page1_value_dma7[31:0]),
						   .page1_reloc_dma7(page1_reloc_dma7[31:0]),
						   .page1_valid_dma7(page1_valid_dma7),
						   .dmc_txc_dma7_page_handle(dmc_txc_dma7_page_handle[19:0]),
						   .tx_rng_cfg_dma8_len(tx_rng_cfg_dma8_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma8_staddr(tx_rng_cfg_dma8_staddr[37:0]),
						   .tx_rng_tail_dma8(tx_rng_tail_dma8[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma8_rst(tx_dma_cfg_dma8_rst),
						   .tx_dma_cfg_dma8_stall(tx_dma_cfg_dma8_stall),
						   .page0_mask_dma8(page0_mask_dma8[31:0]),
						   .page0_value_dma8(page0_value_dma8[31:0]),
						   .page0_reloc_dma8(page0_reloc_dma8[31:0]),
						   .page0_valid_dma8(page0_valid_dma8),
						   .page1_mask_dma8(page1_mask_dma8[31:0]),
						   .page1_value_dma8(page1_value_dma8[31:0]),
						   .page1_reloc_dma8(page1_reloc_dma8[31:0]),
						   .page1_valid_dma8(page1_valid_dma8),
						   .dmc_txc_dma8_page_handle(dmc_txc_dma8_page_handle[19:0]),
						   .tx_rng_cfg_dma9_len(tx_rng_cfg_dma9_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma9_staddr(tx_rng_cfg_dma9_staddr[37:0]),
						   .tx_rng_tail_dma9(tx_rng_tail_dma9[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma9_rst(tx_dma_cfg_dma9_rst),
						   .tx_dma_cfg_dma9_stall(tx_dma_cfg_dma9_stall),
						   .page0_mask_dma9(page0_mask_dma9[31:0]),
						   .page0_value_dma9(page0_value_dma9[31:0]),
						   .page0_reloc_dma9(page0_reloc_dma9[31:0]),
						   .page0_valid_dma9(page0_valid_dma9),
						   .page1_mask_dma9(page1_mask_dma9[31:0]),
						   .page1_value_dma9(page1_value_dma9[31:0]),
						   .page1_reloc_dma9(page1_reloc_dma9[31:0]),
						   .page1_valid_dma9(page1_valid_dma9),
						   .dmc_txc_dma9_page_handle(dmc_txc_dma9_page_handle[19:0]),
						   .tx_rng_cfg_dma10_len(tx_rng_cfg_dma10_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma10_staddr(tx_rng_cfg_dma10_staddr[37:0]),
						   .tx_rng_tail_dma10(tx_rng_tail_dma10[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma10_rst(tx_dma_cfg_dma10_rst),
						   .tx_dma_cfg_dma10_stall(tx_dma_cfg_dma10_stall),
						   .page0_mask_dma10(page0_mask_dma10[31:0]),
						   .page0_value_dma10(page0_value_dma10[31:0]),
						   .page0_reloc_dma10(page0_reloc_dma10[31:0]),
						   .page0_valid_dma10(page0_valid_dma10),
						   .page1_mask_dma10(page1_mask_dma10[31:0]),
						   .page1_value_dma10(page1_value_dma10[31:0]),
						   .page1_reloc_dma10(page1_reloc_dma10[31:0]),
						   .page1_valid_dma10(page1_valid_dma10),
						   .dmc_txc_dma10_page_handle(dmc_txc_dma10_page_handle[19:0]),
						   .tx_rng_cfg_dma11_len(tx_rng_cfg_dma11_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma11_staddr(tx_rng_cfg_dma11_staddr[37:0]),
						   .tx_rng_tail_dma11(tx_rng_tail_dma11[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma11_rst(tx_dma_cfg_dma11_rst),
						   .tx_dma_cfg_dma11_stall(tx_dma_cfg_dma11_stall),
						   .page0_mask_dma11(page0_mask_dma11[31:0]),
						   .page0_value_dma11(page0_value_dma11[31:0]),
						   .page0_reloc_dma11(page0_reloc_dma11[31:0]),
						   .page0_valid_dma11(page0_valid_dma11),
						   .page1_mask_dma11(page1_mask_dma11[31:0]),
						   .page1_value_dma11(page1_value_dma11[31:0]),
						   .page1_reloc_dma11(page1_reloc_dma11[31:0]),
						   .page1_valid_dma11(page1_valid_dma11),
						   .dmc_txc_dma11_page_handle(dmc_txc_dma11_page_handle[19:0]),
						   .tx_rng_cfg_dma12_len(tx_rng_cfg_dma12_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma12_staddr(tx_rng_cfg_dma12_staddr[37:0]),
						   .tx_rng_tail_dma12(tx_rng_tail_dma12[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma12_rst(tx_dma_cfg_dma12_rst),
						   .tx_dma_cfg_dma12_stall(tx_dma_cfg_dma12_stall),
						   .page0_mask_dma12(page0_mask_dma12[31:0]),
						   .page0_value_dma12(page0_value_dma12[31:0]),
						   .page0_reloc_dma12(page0_reloc_dma12[31:0]),
						   .page0_valid_dma12(page0_valid_dma12),
						   .page1_mask_dma12(page1_mask_dma12[31:0]),
						   .page1_value_dma12(page1_value_dma12[31:0]),
						   .page1_reloc_dma12(page1_reloc_dma12[31:0]),
						   .page1_valid_dma12(page1_valid_dma12),
						   .dmc_txc_dma12_page_handle(dmc_txc_dma12_page_handle[19:0]),
						   .tx_rng_cfg_dma13_len(tx_rng_cfg_dma13_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma13_staddr(tx_rng_cfg_dma13_staddr[37:0]),
						   .tx_rng_tail_dma13(tx_rng_tail_dma13[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma13_rst(tx_dma_cfg_dma13_rst),
						   .tx_dma_cfg_dma13_stall(tx_dma_cfg_dma13_stall),
						   .page0_mask_dma13(page0_mask_dma13[31:0]),
						   .page0_value_dma13(page0_value_dma13[31:0]),
						   .page0_reloc_dma13(page0_reloc_dma13[31:0]),
						   .page0_valid_dma13(page0_valid_dma13),
						   .page1_mask_dma13(page1_mask_dma13[31:0]),
						   .page1_value_dma13(page1_value_dma13[31:0]),
						   .page1_reloc_dma13(page1_reloc_dma13[31:0]),
						   .page1_valid_dma13(page1_valid_dma13),
						   .dmc_txc_dma13_page_handle(dmc_txc_dma13_page_handle[19:0]),
						   .tx_rng_cfg_dma14_len(tx_rng_cfg_dma14_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma14_staddr(tx_rng_cfg_dma14_staddr[37:0]),
						   .tx_rng_tail_dma14(tx_rng_tail_dma14[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma14_rst(tx_dma_cfg_dma14_rst),
						   .tx_dma_cfg_dma14_stall(tx_dma_cfg_dma14_stall),
						   .page0_mask_dma14(page0_mask_dma14[31:0]),
						   .page0_value_dma14(page0_value_dma14[31:0]),
						   .page0_reloc_dma14(page0_reloc_dma14[31:0]),
						   .page0_valid_dma14(page0_valid_dma14),
						   .page1_mask_dma14(page1_mask_dma14[31:0]),
						   .page1_value_dma14(page1_value_dma14[31:0]),
						   .page1_reloc_dma14(page1_reloc_dma14[31:0]),
						   .page1_valid_dma14(page1_valid_dma14),
						   .dmc_txc_dma14_page_handle(dmc_txc_dma14_page_handle[19:0]),
						   .tx_rng_cfg_dma15_len(tx_rng_cfg_dma15_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma15_staddr(tx_rng_cfg_dma15_staddr[37:0]),
						   .tx_rng_tail_dma15(tx_rng_tail_dma15[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma15_rst(tx_dma_cfg_dma15_rst),
						   .tx_dma_cfg_dma15_stall(tx_dma_cfg_dma15_stall),
						   .page0_mask_dma15(page0_mask_dma15[31:0]),
						   .page0_value_dma15(page0_value_dma15[31:0]),
						   .page0_reloc_dma15(page0_reloc_dma15[31:0]),
						   .page0_valid_dma15(page0_valid_dma15),
						   .page1_mask_dma15(page1_mask_dma15[31:0]),
						   .page1_value_dma15(page1_value_dma15[31:0]),
						   .page1_reloc_dma15(page1_reloc_dma15[31:0]),
						   .page1_valid_dma15(page1_valid_dma15),
						   .dmc_txc_dma15_page_handle(dmc_txc_dma15_page_handle[19:0]),



`ifdef NEPTUNE
						   .tx_rng_cfg_dma16_len(tx_rng_cfg_dma16_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma16_staddr(tx_rng_cfg_dma16_staddr[37:0]),
						   .tx_rng_tail_dma16(tx_rng_tail_dma16[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma16_rst(tx_dma_cfg_dma16_rst),
						   .tx_dma_cfg_dma16_stall(tx_dma_cfg_dma16_stall),
						   .page0_mask_dma16(page0_mask_dma16[31:0]),
						   .page0_value_dma16(page0_value_dma16[31:0]),
						   .page0_reloc_dma16(page0_reloc_dma16[31:0]),
						   .page0_valid_dma16(page0_valid_dma16),
						   .page1_mask_dma16(page1_mask_dma16[31:0]),
						   .page1_value_dma16(page1_value_dma16[31:0]),
						   .page1_reloc_dma16(page1_reloc_dma16[31:0]),
						   .page1_valid_dma16(page1_valid_dma16),
						   .dmc_txc_dma16_page_handle(dmc_txc_dma16_page_handle[19:0]),
						   .tx_rng_cfg_dma17_len(tx_rng_cfg_dma17_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma17_staddr(tx_rng_cfg_dma17_staddr[37:0]),
						   .tx_rng_tail_dma17(tx_rng_tail_dma17[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma17_rst(tx_dma_cfg_dma17_rst),
						   .tx_dma_cfg_dma17_stall(tx_dma_cfg_dma17_stall),
						   .page0_mask_dma17(page0_mask_dma17[31:0]),
						   .page0_value_dma17(page0_value_dma17[31:0]),
						   .page0_reloc_dma17(page0_reloc_dma17[31:0]),
						   .page0_valid_dma17(page0_valid_dma17),
						   .page1_mask_dma17(page1_mask_dma17[31:0]),
						   .page1_value_dma17(page1_value_dma17[31:0]),
						   .page1_reloc_dma17(page1_reloc_dma17[31:0]),
						   .page1_valid_dma17(page1_valid_dma17),
						   .dmc_txc_dma17_page_handle(dmc_txc_dma17_page_handle[19:0]),
						   .tx_rng_cfg_dma18_len(tx_rng_cfg_dma18_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma18_staddr(tx_rng_cfg_dma18_staddr[37:0]),
						   .tx_rng_tail_dma18(tx_rng_tail_dma18[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma18_rst(tx_dma_cfg_dma18_rst),
						   .tx_dma_cfg_dma18_stall(tx_dma_cfg_dma18_stall),
						   .page0_mask_dma18(page0_mask_dma18[31:0]),
						   .page0_value_dma18(page0_value_dma18[31:0]),
						   .page0_reloc_dma18(page0_reloc_dma18[31:0]),
						   .page0_valid_dma18(page0_valid_dma18),
						   .page1_mask_dma18(page1_mask_dma18[31:0]),
						   .page1_value_dma18(page1_value_dma18[31:0]),
						   .page1_reloc_dma18(page1_reloc_dma18[31:0]),
						   .page1_valid_dma18(page1_valid_dma18),
						   .dmc_txc_dma18_page_handle(dmc_txc_dma18_page_handle[19:0]),
						   .tx_rng_cfg_dma19_len(tx_rng_cfg_dma19_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma19_staddr(tx_rng_cfg_dma19_staddr[37:0]),
						   .tx_rng_tail_dma19(tx_rng_tail_dma19[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma19_rst(tx_dma_cfg_dma19_rst),
						   .tx_dma_cfg_dma19_stall(tx_dma_cfg_dma19_stall),
						   .page0_mask_dma19(page0_mask_dma19[31:0]),
						   .page0_value_dma19(page0_value_dma19[31:0]),
						   .page0_reloc_dma19(page0_reloc_dma19[31:0]),
						   .page0_valid_dma19(page0_valid_dma19),
						   .page1_mask_dma19(page1_mask_dma19[31:0]),
						   .page1_value_dma19(page1_value_dma19[31:0]),
						   .page1_reloc_dma19(page1_reloc_dma19[31:0]),
						   .page1_valid_dma19(page1_valid_dma19),
						   .dmc_txc_dma19_page_handle(dmc_txc_dma19_page_handle[19:0]),
						   .tx_rng_cfg_dma20_len(tx_rng_cfg_dma20_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma20_staddr(tx_rng_cfg_dma20_staddr[37:0]),
						   .tx_rng_tail_dma20(tx_rng_tail_dma20[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma20_rst(tx_dma_cfg_dma20_rst),
						   .tx_dma_cfg_dma20_stall(tx_dma_cfg_dma20_stall),
						   .page0_mask_dma20(page0_mask_dma20[31:0]),
						   .page0_value_dma20(page0_value_dma20[31:0]),
						   .page0_reloc_dma20(page0_reloc_dma20[31:0]),
						   .page0_valid_dma20(page0_valid_dma20),
						   .page1_mask_dma20(page1_mask_dma20[31:0]),
						   .page1_value_dma20(page1_value_dma20[31:0]),
						   .page1_reloc_dma20(page1_reloc_dma20[31:0]),
						   .page1_valid_dma20(page1_valid_dma20),
						   .dmc_txc_dma20_page_handle(dmc_txc_dma20_page_handle[19:0]),
						   .tx_rng_cfg_dma21_len(tx_rng_cfg_dma21_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma21_staddr(tx_rng_cfg_dma21_staddr[37:0]),
						   .tx_rng_tail_dma21(tx_rng_tail_dma21[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma21_rst(tx_dma_cfg_dma21_rst),
						   .tx_dma_cfg_dma21_stall(tx_dma_cfg_dma21_stall),
						   .page0_mask_dma21(page0_mask_dma21[31:0]),
						   .page0_value_dma21(page0_value_dma21[31:0]),
						   .page0_reloc_dma21(page0_reloc_dma21[31:0]),
						   .page0_valid_dma21(page0_valid_dma21),
						   .page1_mask_dma21(page1_mask_dma21[31:0]),
						   .page1_value_dma21(page1_value_dma21[31:0]),
						   .page1_reloc_dma21(page1_reloc_dma21[31:0]),
						   .page1_valid_dma21(page1_valid_dma21),
						   .dmc_txc_dma21_page_handle(dmc_txc_dma21_page_handle[19:0]),
						   .tx_rng_cfg_dma22_len(tx_rng_cfg_dma22_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma22_staddr(tx_rng_cfg_dma22_staddr[37:0]),
						   .tx_rng_tail_dma22(tx_rng_tail_dma22[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma22_rst(tx_dma_cfg_dma22_rst),
						   .tx_dma_cfg_dma22_stall(tx_dma_cfg_dma22_stall),
						   .page0_mask_dma22(page0_mask_dma22[31:0]),
						   .page0_value_dma22(page0_value_dma22[31:0]),
						   .page0_reloc_dma22(page0_reloc_dma22[31:0]),
						   .page0_valid_dma22(page0_valid_dma22),
						   .page1_mask_dma22(page1_mask_dma22[31:0]),
						   .page1_value_dma22(page1_value_dma22[31:0]),
						   .page1_reloc_dma22(page1_reloc_dma22[31:0]),
						   .page1_valid_dma22(page1_valid_dma22),
						   .dmc_txc_dma22_page_handle(dmc_txc_dma22_page_handle[19:0]),
						   .tx_rng_cfg_dma23_len(tx_rng_cfg_dma23_len[`RNG_LENGTH_WIDTH -1:0]),
						   .tx_rng_cfg_dma23_staddr(tx_rng_cfg_dma23_staddr[37:0]),
						   .tx_rng_tail_dma23(tx_rng_tail_dma23[`PTR_WIDTH:0]),
						   .tx_dma_cfg_dma23_rst(tx_dma_cfg_dma23_rst),
						   .tx_dma_cfg_dma23_stall(tx_dma_cfg_dma23_stall),
						   .page0_mask_dma23(page0_mask_dma23[31:0]),
						   .page0_value_dma23(page0_value_dma23[31:0]),
						   .page0_reloc_dma23(page0_reloc_dma23[31:0]),
						   .page0_valid_dma23(page0_valid_dma23),
						   .page1_mask_dma23(page1_mask_dma23[31:0]),
						   .page1_value_dma23(page1_value_dma23[31:0]),
						   .page1_reloc_dma23(page1_reloc_dma23[31:0]),
						   .page1_valid_dma23(page1_valid_dma23),
						   .dmc_txc_dma23_page_handle(dmc_txc_dma23_page_handle[19:0]),



`endif


						   
						   .dmc_txc_tx_addr_md(dmc_txc_tx_addr_md),
						   .parity_corrupt_config(parity_corrupt_config),
						   .tx_dma_cfg_dma0_stop(tx_dma_cfg_dma0_stop),
						   .tx_dma_cfg_dma1_stop(tx_dma_cfg_dma1_stop),
						   .tx_dma_cfg_dma2_stop(tx_dma_cfg_dma2_stop),
						   .tx_dma_cfg_dma3_stop(tx_dma_cfg_dma3_stop),
						   .tx_dma_cfg_dma4_stop(tx_dma_cfg_dma4_stop),
						   .tx_dma_cfg_dma5_stop(tx_dma_cfg_dma5_stop),
						   .tx_dma_cfg_dma6_stop(tx_dma_cfg_dma6_stop),
						   .tx_dma_cfg_dma7_stop(tx_dma_cfg_dma7_stop),
						   .tx_dma_cfg_dma8_stop(tx_dma_cfg_dma8_stop),
						   .tx_dma_cfg_dma9_stop(tx_dma_cfg_dma9_stop),
						   .tx_dma_cfg_dma10_stop(tx_dma_cfg_dma10_stop),
						   .tx_dma_cfg_dma11_stop(tx_dma_cfg_dma11_stop),
						   .tx_dma_cfg_dma12_stop(tx_dma_cfg_dma12_stop),
						   .tx_dma_cfg_dma13_stop(tx_dma_cfg_dma13_stop),
						   .tx_dma_cfg_dma14_stop(tx_dma_cfg_dma14_stop),
						   .tx_dma_cfg_dma15_stop(tx_dma_cfg_dma15_stop),


`ifdef NEPTUNE
						   
						   .tx_dma_cfg_dma16_stop(tx_dma_cfg_dma16_stop),
						   .tx_dma_cfg_dma17_stop(tx_dma_cfg_dma17_stop),
						   .tx_dma_cfg_dma18_stop(tx_dma_cfg_dma18_stop),
						   .tx_dma_cfg_dma19_stop(tx_dma_cfg_dma19_stop),
						   .tx_dma_cfg_dma20_stop(tx_dma_cfg_dma20_stop),
						   .tx_dma_cfg_dma21_stop(tx_dma_cfg_dma21_stop),
						   .tx_dma_cfg_dma22_stop(tx_dma_cfg_dma22_stop),
						   .tx_dma_cfg_dma23_stop(tx_dma_cfg_dma23_stop),


`endif

						   
						   .dmc_txc_dma0_func_num(dmc_txc_dma0_func_num[1:0]),
						   .dmc_txc_dma1_func_num(dmc_txc_dma1_func_num[1:0]),
						   .dmc_txc_dma2_func_num(dmc_txc_dma2_func_num[1:0]),
						   .dmc_txc_dma3_func_num(dmc_txc_dma3_func_num[1:0]),
						   .dmc_txc_dma4_func_num(dmc_txc_dma4_func_num[1:0]),
						   .dmc_txc_dma5_func_num(dmc_txc_dma5_func_num[1:0]),
						   .dmc_txc_dma6_func_num(dmc_txc_dma6_func_num[1:0]),
						   .dmc_txc_dma7_func_num(dmc_txc_dma7_func_num[1:0]),
						   .dmc_txc_dma8_func_num(dmc_txc_dma8_func_num[1:0]),
						   .dmc_txc_dma9_func_num(dmc_txc_dma9_func_num[1:0]),
						   .dmc_txc_dma10_func_num(dmc_txc_dma10_func_num[1:0]),
						   .dmc_txc_dma11_func_num(dmc_txc_dma11_func_num[1:0]),
						   .dmc_txc_dma12_func_num(dmc_txc_dma12_func_num[1:0]),
						   .dmc_txc_dma13_func_num(dmc_txc_dma13_func_num[1:0]),
						   .dmc_txc_dma14_func_num(dmc_txc_dma14_func_num[1:0]),

`ifdef NEPTUNE
						   .dmc_txc_dma15_func_num(dmc_txc_dma15_func_num[1:0]),
						   .dmc_txc_dma16_func_num(dmc_txc_dma16_func_num[1:0]),
						   .dmc_txc_dma17_func_num(dmc_txc_dma17_func_num[1:0]),
						   .dmc_txc_dma18_func_num(dmc_txc_dma18_func_num[1:0]),
						   .dmc_txc_dma19_func_num(dmc_txc_dma19_func_num[1:0]),
						   .dmc_txc_dma20_func_num(dmc_txc_dma20_func_num[1:0]),
						   .dmc_txc_dma21_func_num(dmc_txc_dma21_func_num[1:0]),
						   .dmc_txc_dma22_func_num(dmc_txc_dma22_func_num[1:0]),
						   .dmc_txc_dma23_func_num(dmc_txc_dma23_func_num[1:0])
`else // !ifdef NEPTUNE
						   .dmc_txc_dma15_func_num(dmc_txc_dma15_func_num[1:0])					   
`endif
						   );
   
   
   niu_dmc_txpios niu_dmc_txpios(/*AUTOJUNK*/
				 // Outputs
				 .debug_select(debug_select[5:0]),
				 .training_vector(training_vector[31:0]),
				 .tdmc_pio_ack(tdmc_pio_ack),
				 .tdmc_pio_err(tdmc_pio_err),
				 .tdmc_pio_rdata(tdmc_pio_rdata[63:0]),
				 .page0_mask_dma0(page0_mask_dma0[31:0]),
				 .page0_value_dma0(page0_value_dma0[31:0]),
				 .page0_reloc_dma0(page0_reloc_dma0[31:0]),
				 .page0_valid_dma0(page0_valid_dma0),
				 .page1_mask_dma0(page1_mask_dma0[31:0]),
				 .page1_value_dma0(page1_value_dma0[31:0]),
				 .page1_reloc_dma0(page1_reloc_dma0[31:0]),
				 .page1_valid_dma0(page1_valid_dma0),
				 .dmc_txc_dma0_page_handle(dmc_txc_dma0_page_handle[19:0]),
				 .tx_rng_cfg_dma0_len(tx_rng_cfg_dma0_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma0_staddr(tx_rng_cfg_dma0_staddr[37:0]),
				 .tx_rng_tail_dma0(tx_rng_tail_dma0[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma0_rst(tx_dma_cfg_dma0_rst),
				 .tx_dma_cfg_dma0_stall(tx_dma_cfg_dma0_stall),
				 .tx_dma_cfg_dma0_mbaddr(tx_dma_cfg_dma0_mbaddr[37:0]),
				 .tx_cfg_dma0_enable_mb(tx_cfg_dma0_enable_mb),
				 .tx_cfg_dma0_mk(tx_cfg_dma0_mk),
				 .tx_cfg_dma0_mmk(tx_cfg_dma0_mmk),
				 .tx_cs_dma0(tx_cs_dma0[63:0]),
				 .tx_dma0_pre_st(tx_dma0_pre_st[63:0]),
				 .tx_dma0_rng_err_logh(tx_dma0_rng_err_logh[63:0]),
				 .tx_dma0_rng_err_logl(tx_dma0_rng_err_logl[63:0]),
				 .page0_mask_dma1(page0_mask_dma1[31:0]),
				 .page0_value_dma1(page0_value_dma1[31:0]),
				 .page0_reloc_dma1(page0_reloc_dma1[31:0]),
				 .page0_valid_dma1(page0_valid_dma1),
				 .page1_mask_dma1(page1_mask_dma1[31:0]),
				 .page1_value_dma1(page1_value_dma1[31:0]),
				 .page1_reloc_dma1(page1_reloc_dma1[31:0]),
				 .page1_valid_dma1(page1_valid_dma1),
				 .dmc_txc_dma1_page_handle(dmc_txc_dma1_page_handle[19:0]),
				 .tx_rng_cfg_dma1_len(tx_rng_cfg_dma1_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma1_staddr(tx_rng_cfg_dma1_staddr[37:0]),
				 .tx_rng_tail_dma1(tx_rng_tail_dma1[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma1_rst(tx_dma_cfg_dma1_rst),
				 .tx_dma_cfg_dma1_stall(tx_dma_cfg_dma1_stall),
				 .tx_dma_cfg_dma1_mbaddr(tx_dma_cfg_dma1_mbaddr[37:0]),
				 .tx_cfg_dma1_enable_mb(tx_cfg_dma1_enable_mb),
				 .tx_cfg_dma1_mk(tx_cfg_dma1_mk),
				 .tx_cfg_dma1_mmk(tx_cfg_dma1_mmk),
				 .tx_cs_dma1(tx_cs_dma1[63:0]),
				 .tx_dma1_pre_st(tx_dma1_pre_st[63:0]),
				 .tx_dma1_rng_err_logh(tx_dma1_rng_err_logh[63:0]),
				 .tx_dma1_rng_err_logl(tx_dma1_rng_err_logl[63:0]),
				 .page0_mask_dma2(page0_mask_dma2[31:0]),
				 .page0_value_dma2(page0_value_dma2[31:0]),
				 .page0_reloc_dma2(page0_reloc_dma2[31:0]),
				 .page0_valid_dma2(page0_valid_dma2),
				 .page1_mask_dma2(page1_mask_dma2[31:0]),
				 .page1_value_dma2(page1_value_dma2[31:0]),
				 .page1_reloc_dma2(page1_reloc_dma2[31:0]),
				 .page1_valid_dma2(page1_valid_dma2),
				 .dmc_txc_dma2_page_handle(dmc_txc_dma2_page_handle[19:0]),
				 .tx_rng_cfg_dma2_len(tx_rng_cfg_dma2_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma2_staddr(tx_rng_cfg_dma2_staddr[37:0]),
				 .tx_rng_tail_dma2(tx_rng_tail_dma2[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma2_rst(tx_dma_cfg_dma2_rst),
				 .tx_dma_cfg_dma2_stall(tx_dma_cfg_dma2_stall),
				 .tx_dma_cfg_dma2_mbaddr(tx_dma_cfg_dma2_mbaddr[37:0]),
				 .tx_cfg_dma2_enable_mb(tx_cfg_dma2_enable_mb),
				 .tx_cfg_dma2_mk(tx_cfg_dma2_mk),
				 .tx_cfg_dma2_mmk(tx_cfg_dma2_mmk),
				 .tx_cs_dma2(tx_cs_dma2[63:0]),
				 .tx_dma2_pre_st(tx_dma2_pre_st[63:0]),
				 .tx_dma2_rng_err_logh(tx_dma2_rng_err_logh[63:0]),
				 .tx_dma2_rng_err_logl(tx_dma2_rng_err_logl[63:0]),
				 .page0_mask_dma3(page0_mask_dma3[31:0]),
				 .page0_value_dma3(page0_value_dma3[31:0]),
				 .page0_reloc_dma3(page0_reloc_dma3[31:0]),
				 .page0_valid_dma3(page0_valid_dma3),
				 .page1_mask_dma3(page1_mask_dma3[31:0]),
				 .page1_value_dma3(page1_value_dma3[31:0]),
				 .page1_reloc_dma3(page1_reloc_dma3[31:0]),
				 .page1_valid_dma3(page1_valid_dma3),
				 .dmc_txc_dma3_page_handle(dmc_txc_dma3_page_handle[19:0]),
				 .tx_rng_cfg_dma3_len(tx_rng_cfg_dma3_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma3_staddr(tx_rng_cfg_dma3_staddr[37:0]),
				 .tx_rng_tail_dma3(tx_rng_tail_dma3[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma3_rst(tx_dma_cfg_dma3_rst),
				 .tx_dma_cfg_dma3_stall(tx_dma_cfg_dma3_stall),
				 .tx_dma_cfg_dma3_mbaddr(tx_dma_cfg_dma3_mbaddr[37:0]),
				 .tx_cfg_dma3_enable_mb(tx_cfg_dma3_enable_mb),
				 .tx_cfg_dma3_mk(tx_cfg_dma3_mk),
				 .tx_cfg_dma3_mmk(tx_cfg_dma3_mmk),
				 .tx_cs_dma3(tx_cs_dma3[63:0]),
				 .tx_dma3_pre_st(tx_dma3_pre_st[63:0]),
				 .tx_dma3_rng_err_logh(tx_dma3_rng_err_logh[63:0]),
				 .tx_dma3_rng_err_logl(tx_dma3_rng_err_logl[63:0]),
				 .page0_mask_dma4(page0_mask_dma4[31:0]),
				 .page0_value_dma4(page0_value_dma4[31:0]),
				 .page0_reloc_dma4(page0_reloc_dma4[31:0]),
				 .page0_valid_dma4(page0_valid_dma4),
				 .page1_mask_dma4(page1_mask_dma4[31:0]),
				 .page1_value_dma4(page1_value_dma4[31:0]),
				 .page1_reloc_dma4(page1_reloc_dma4[31:0]),
				 .page1_valid_dma4(page1_valid_dma4),
				 .dmc_txc_dma4_page_handle(dmc_txc_dma4_page_handle[19:0]),
				 .tx_rng_cfg_dma4_len(tx_rng_cfg_dma4_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma4_staddr(tx_rng_cfg_dma4_staddr[37:0]),
				 .tx_rng_tail_dma4(tx_rng_tail_dma4[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma4_rst(tx_dma_cfg_dma4_rst),
				 .tx_dma_cfg_dma4_stall(tx_dma_cfg_dma4_stall),
				 .tx_dma_cfg_dma4_mbaddr(tx_dma_cfg_dma4_mbaddr[37:0]),
				 .tx_cfg_dma4_enable_mb(tx_cfg_dma4_enable_mb),
				 .tx_cfg_dma4_mk(tx_cfg_dma4_mk),
				 .tx_cfg_dma4_mmk(tx_cfg_dma4_mmk),
				 .tx_cs_dma4(tx_cs_dma4[63:0]),
				 .tx_dma4_pre_st(tx_dma4_pre_st[63:0]),
				 .tx_dma4_rng_err_logh(tx_dma4_rng_err_logh[63:0]),
				 .tx_dma4_rng_err_logl(tx_dma4_rng_err_logl[63:0]),
				 .page0_mask_dma5(page0_mask_dma5[31:0]),
				 .page0_value_dma5(page0_value_dma5[31:0]),
				 .page0_reloc_dma5(page0_reloc_dma5[31:0]),
				 .page0_valid_dma5(page0_valid_dma5),
				 .page1_mask_dma5(page1_mask_dma5[31:0]),
				 .page1_value_dma5(page1_value_dma5[31:0]),
				 .page1_reloc_dma5(page1_reloc_dma5[31:0]),
				 .page1_valid_dma5(page1_valid_dma5),
				 .dmc_txc_dma5_page_handle(dmc_txc_dma5_page_handle[19:0]),
				 .tx_rng_cfg_dma5_len(tx_rng_cfg_dma5_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma5_staddr(tx_rng_cfg_dma5_staddr[37:0]),
				 .tx_rng_tail_dma5(tx_rng_tail_dma5[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma5_rst(tx_dma_cfg_dma5_rst),
				 .tx_dma_cfg_dma5_stall(tx_dma_cfg_dma5_stall),
				 .tx_dma_cfg_dma5_mbaddr(tx_dma_cfg_dma5_mbaddr[37:0]),
				 .tx_cfg_dma5_enable_mb(tx_cfg_dma5_enable_mb),
				 .tx_cfg_dma5_mk(tx_cfg_dma5_mk),
				 .tx_cfg_dma5_mmk(tx_cfg_dma5_mmk),
				 .tx_cs_dma5(tx_cs_dma5[63:0]),
				 .tx_dma5_pre_st(tx_dma5_pre_st[63:0]),
				 .tx_dma5_rng_err_logh(tx_dma5_rng_err_logh[63:0]),
				 .tx_dma5_rng_err_logl(tx_dma5_rng_err_logl[63:0]),
				 .page0_mask_dma6(page0_mask_dma6[31:0]),
				 .page0_value_dma6(page0_value_dma6[31:0]),
				 .page0_reloc_dma6(page0_reloc_dma6[31:0]),
				 .page0_valid_dma6(page0_valid_dma6),
				 .page1_mask_dma6(page1_mask_dma6[31:0]),
				 .page1_value_dma6(page1_value_dma6[31:0]),
				 .page1_reloc_dma6(page1_reloc_dma6[31:0]),
				 .page1_valid_dma6(page1_valid_dma6),
				 .dmc_txc_dma6_page_handle(dmc_txc_dma6_page_handle[19:0]),
				 .tx_rng_cfg_dma6_len(tx_rng_cfg_dma6_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma6_staddr(tx_rng_cfg_dma6_staddr[37:0]),
				 .tx_rng_tail_dma6(tx_rng_tail_dma6[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma6_rst(tx_dma_cfg_dma6_rst),
				 .tx_dma_cfg_dma6_stall(tx_dma_cfg_dma6_stall),
				 .tx_dma_cfg_dma6_mbaddr(tx_dma_cfg_dma6_mbaddr[37:0]),
				 .tx_cfg_dma6_enable_mb(tx_cfg_dma6_enable_mb),
				 .tx_cfg_dma6_mk(tx_cfg_dma6_mk),
				 .tx_cfg_dma6_mmk(tx_cfg_dma6_mmk),
				 .tx_cs_dma6(tx_cs_dma6[63:0]),
				 .tx_dma6_pre_st(tx_dma6_pre_st[63:0]),
				 .tx_dma6_rng_err_logh(tx_dma6_rng_err_logh[63:0]),
				 .tx_dma6_rng_err_logl(tx_dma6_rng_err_logl[63:0]),
				 .page0_mask_dma7(page0_mask_dma7[31:0]),
				 .page0_value_dma7(page0_value_dma7[31:0]),
				 .page0_reloc_dma7(page0_reloc_dma7[31:0]),
				 .page0_valid_dma7(page0_valid_dma7),
				 .page1_mask_dma7(page1_mask_dma7[31:0]),
				 .page1_value_dma7(page1_value_dma7[31:0]),
				 .page1_reloc_dma7(page1_reloc_dma7[31:0]),
				 .page1_valid_dma7(page1_valid_dma7),
				 .dmc_txc_dma7_page_handle(dmc_txc_dma7_page_handle[19:0]),
				 .tx_rng_cfg_dma7_len(tx_rng_cfg_dma7_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma7_staddr(tx_rng_cfg_dma7_staddr[37:0]),
				 .tx_rng_tail_dma7(tx_rng_tail_dma7[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma7_rst(tx_dma_cfg_dma7_rst),
				 .tx_dma_cfg_dma7_stall(tx_dma_cfg_dma7_stall),
				 .tx_dma_cfg_dma7_mbaddr(tx_dma_cfg_dma7_mbaddr[37:0]),
				 .tx_cfg_dma7_enable_mb(tx_cfg_dma7_enable_mb),
				 .tx_cfg_dma7_mk(tx_cfg_dma7_mk),
				 .tx_cfg_dma7_mmk(tx_cfg_dma7_mmk),
				 .tx_cs_dma7(tx_cs_dma7[63:0]),
				 .tx_dma7_pre_st(tx_dma7_pre_st[63:0]),
				 .tx_dma7_rng_err_logh(tx_dma7_rng_err_logh[63:0]),
				 .tx_dma7_rng_err_logl(tx_dma7_rng_err_logl[63:0]),
				 .page0_mask_dma8(page0_mask_dma8[31:0]),
				 .page0_value_dma8(page0_value_dma8[31:0]),
				 .page0_reloc_dma8(page0_reloc_dma8[31:0]),
				 .page0_valid_dma8(page0_valid_dma8),
				 .page1_mask_dma8(page1_mask_dma8[31:0]),
				 .page1_value_dma8(page1_value_dma8[31:0]),
				 .page1_reloc_dma8(page1_reloc_dma8[31:0]),
				 .page1_valid_dma8(page1_valid_dma8),
				 .dmc_txc_dma8_page_handle(dmc_txc_dma8_page_handle[19:0]),
				 .tx_rng_cfg_dma8_len(tx_rng_cfg_dma8_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma8_staddr(tx_rng_cfg_dma8_staddr[37:0]),
				 .tx_rng_tail_dma8(tx_rng_tail_dma8[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma8_rst(tx_dma_cfg_dma8_rst),
				 .tx_dma_cfg_dma8_stall(tx_dma_cfg_dma8_stall),
				 .tx_dma_cfg_dma8_mbaddr(tx_dma_cfg_dma8_mbaddr[37:0]),
				 .tx_cfg_dma8_enable_mb(tx_cfg_dma8_enable_mb),
				 .tx_cfg_dma8_mk(tx_cfg_dma8_mk),
				 .tx_cfg_dma8_mmk(tx_cfg_dma8_mmk),
				 .tx_cs_dma8(tx_cs_dma8[63:0]),
				 .tx_dma8_pre_st(tx_dma8_pre_st[63:0]),
				 .tx_dma8_rng_err_logh(tx_dma8_rng_err_logh[63:0]),
				 .tx_dma8_rng_err_logl(tx_dma8_rng_err_logl[63:0]),
				 .page0_mask_dma9(page0_mask_dma9[31:0]),
				 .page0_value_dma9(page0_value_dma9[31:0]),
				 .page0_reloc_dma9(page0_reloc_dma9[31:0]),
				 .page0_valid_dma9(page0_valid_dma9),
				 .page1_mask_dma9(page1_mask_dma9[31:0]),
				 .page1_value_dma9(page1_value_dma9[31:0]),
				 .page1_reloc_dma9(page1_reloc_dma9[31:0]),
				 .page1_valid_dma9(page1_valid_dma9),
				 .dmc_txc_dma9_page_handle(dmc_txc_dma9_page_handle[19:0]),
				 .tx_rng_cfg_dma9_len(tx_rng_cfg_dma9_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma9_staddr(tx_rng_cfg_dma9_staddr[37:0]),
				 .tx_rng_tail_dma9(tx_rng_tail_dma9[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma9_rst(tx_dma_cfg_dma9_rst),
				 .tx_dma_cfg_dma9_stall(tx_dma_cfg_dma9_stall),
				 .tx_dma_cfg_dma9_mbaddr(tx_dma_cfg_dma9_mbaddr[37:0]),
				 .tx_cfg_dma9_enable_mb(tx_cfg_dma9_enable_mb),
				 .tx_cfg_dma9_mk(tx_cfg_dma9_mk),
				 .tx_cfg_dma9_mmk(tx_cfg_dma9_mmk),
				 .tx_cs_dma9(tx_cs_dma9[63:0]),
				 .tx_dma9_pre_st(tx_dma9_pre_st[63:0]),
				 .tx_dma9_rng_err_logh(tx_dma9_rng_err_logh[63:0]),
				 .tx_dma9_rng_err_logl(tx_dma9_rng_err_logl[63:0]),
				 .page0_mask_dma10(page0_mask_dma10[31:0]),
				 .page0_value_dma10(page0_value_dma10[31:0]),
				 .page0_reloc_dma10(page0_reloc_dma10[31:0]),
				 .page0_valid_dma10(page0_valid_dma10),
				 .page1_mask_dma10(page1_mask_dma10[31:0]),
				 .page1_value_dma10(page1_value_dma10[31:0]),
				 .page1_reloc_dma10(page1_reloc_dma10[31:0]),
				 .page1_valid_dma10(page1_valid_dma10),
				 .dmc_txc_dma10_page_handle(dmc_txc_dma10_page_handle[19:0]),
				 .tx_rng_cfg_dma10_len(tx_rng_cfg_dma10_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma10_staddr(tx_rng_cfg_dma10_staddr[37:0]),
				 .tx_rng_tail_dma10(tx_rng_tail_dma10[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma10_rst(tx_dma_cfg_dma10_rst),
				 .tx_dma_cfg_dma10_stall(tx_dma_cfg_dma10_stall),
				 .tx_dma_cfg_dma10_mbaddr(tx_dma_cfg_dma10_mbaddr[37:0]),
				 .tx_cfg_dma10_enable_mb(tx_cfg_dma10_enable_mb),
				 .tx_cfg_dma10_mk(tx_cfg_dma10_mk),
				 .tx_cfg_dma10_mmk(tx_cfg_dma10_mmk),
				 .tx_cs_dma10(tx_cs_dma10[63:0]),
				 .tx_dma10_pre_st(tx_dma10_pre_st[63:0]),
				 .tx_dma10_rng_err_logh(tx_dma10_rng_err_logh[63:0]),
				 .tx_dma10_rng_err_logl(tx_dma10_rng_err_logl[63:0]),
				 .page0_mask_dma11(page0_mask_dma11[31:0]),
				 .page0_value_dma11(page0_value_dma11[31:0]),
				 .page0_reloc_dma11(page0_reloc_dma11[31:0]),
				 .page0_valid_dma11(page0_valid_dma11),
				 .page1_mask_dma11(page1_mask_dma11[31:0]),
				 .page1_value_dma11(page1_value_dma11[31:0]),
				 .page1_reloc_dma11(page1_reloc_dma11[31:0]),
				 .page1_valid_dma11(page1_valid_dma11),
				 .dmc_txc_dma11_page_handle(dmc_txc_dma11_page_handle[19:0]),
				 .tx_rng_cfg_dma11_len(tx_rng_cfg_dma11_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma11_staddr(tx_rng_cfg_dma11_staddr[37:0]),
				 .tx_rng_tail_dma11(tx_rng_tail_dma11[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma11_rst(tx_dma_cfg_dma11_rst),
				 .tx_dma_cfg_dma11_stall(tx_dma_cfg_dma11_stall),
				 .tx_dma_cfg_dma11_mbaddr(tx_dma_cfg_dma11_mbaddr[37:0]),
				 .tx_cfg_dma11_enable_mb(tx_cfg_dma11_enable_mb),
				 .tx_cfg_dma11_mk(tx_cfg_dma11_mk),
				 .tx_cfg_dma11_mmk(tx_cfg_dma11_mmk),
				 .tx_cs_dma11(tx_cs_dma11[63:0]),
				 .tx_dma11_pre_st(tx_dma11_pre_st[63:0]),
				 .tx_dma11_rng_err_logh(tx_dma11_rng_err_logh[63:0]),
				 .tx_dma11_rng_err_logl(tx_dma11_rng_err_logl[63:0]),
				 .page0_mask_dma12(page0_mask_dma12[31:0]),
				 .page0_value_dma12(page0_value_dma12[31:0]),
				 .page0_reloc_dma12(page0_reloc_dma12[31:0]),
				 .page0_valid_dma12(page0_valid_dma12),
				 .page1_mask_dma12(page1_mask_dma12[31:0]),
				 .page1_value_dma12(page1_value_dma12[31:0]),
				 .page1_reloc_dma12(page1_reloc_dma12[31:0]),
				 .page1_valid_dma12(page1_valid_dma12),
				 .dmc_txc_dma12_page_handle(dmc_txc_dma12_page_handle[19:0]),
				 .tx_rng_cfg_dma12_len(tx_rng_cfg_dma12_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma12_staddr(tx_rng_cfg_dma12_staddr[37:0]),
				 .tx_rng_tail_dma12(tx_rng_tail_dma12[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma12_rst(tx_dma_cfg_dma12_rst),
				 .tx_dma_cfg_dma12_stall(tx_dma_cfg_dma12_stall),
				 .tx_dma_cfg_dma12_mbaddr(tx_dma_cfg_dma12_mbaddr[37:0]),
				 .tx_cfg_dma12_enable_mb(tx_cfg_dma12_enable_mb),
				 .tx_cfg_dma12_mk(tx_cfg_dma12_mk),
				 .tx_cfg_dma12_mmk(tx_cfg_dma12_mmk),
				 .tx_cs_dma12(tx_cs_dma12[63:0]),
				 .tx_dma12_pre_st(tx_dma12_pre_st[63:0]),
				 .tx_dma12_rng_err_logh(tx_dma12_rng_err_logh[63:0]),
				 .tx_dma12_rng_err_logl(tx_dma12_rng_err_logl[63:0]),
				 .page0_mask_dma13(page0_mask_dma13[31:0]),
				 .page0_value_dma13(page0_value_dma13[31:0]),
				 .page0_reloc_dma13(page0_reloc_dma13[31:0]),
				 .page0_valid_dma13(page0_valid_dma13),
				 .page1_mask_dma13(page1_mask_dma13[31:0]),
				 .page1_value_dma13(page1_value_dma13[31:0]),
				 .page1_reloc_dma13(page1_reloc_dma13[31:0]),
				 .page1_valid_dma13(page1_valid_dma13),
				 .dmc_txc_dma13_page_handle(dmc_txc_dma13_page_handle[19:0]),
				 .tx_rng_cfg_dma13_len(tx_rng_cfg_dma13_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma13_staddr(tx_rng_cfg_dma13_staddr[37:0]),
				 .tx_rng_tail_dma13(tx_rng_tail_dma13[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma13_rst(tx_dma_cfg_dma13_rst),
				 .tx_dma_cfg_dma13_stall(tx_dma_cfg_dma13_stall),
				 .tx_dma_cfg_dma13_mbaddr(tx_dma_cfg_dma13_mbaddr[37:0]),
				 .tx_cfg_dma13_enable_mb(tx_cfg_dma13_enable_mb),
				 .tx_cfg_dma13_mk(tx_cfg_dma13_mk),
				 .tx_cfg_dma13_mmk(tx_cfg_dma13_mmk),
				 .tx_cs_dma13(tx_cs_dma13[63:0]),
				 .tx_dma13_pre_st(tx_dma13_pre_st[63:0]),
				 .tx_dma13_rng_err_logh(tx_dma13_rng_err_logh[63:0]),
				 .tx_dma13_rng_err_logl(tx_dma13_rng_err_logl[63:0]),
				 .page0_mask_dma14(page0_mask_dma14[31:0]),
				 .page0_value_dma14(page0_value_dma14[31:0]),
				 .page0_reloc_dma14(page0_reloc_dma14[31:0]),
				 .page0_valid_dma14(page0_valid_dma14),
				 .page1_mask_dma14(page1_mask_dma14[31:0]),
				 .page1_value_dma14(page1_value_dma14[31:0]),
				 .page1_reloc_dma14(page1_reloc_dma14[31:0]),
				 .page1_valid_dma14(page1_valid_dma14),
				 .dmc_txc_dma14_page_handle(dmc_txc_dma14_page_handle[19:0]),
				 .tx_rng_cfg_dma14_len(tx_rng_cfg_dma14_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma14_staddr(tx_rng_cfg_dma14_staddr[37:0]),
				 .tx_rng_tail_dma14(tx_rng_tail_dma14[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma14_rst(tx_dma_cfg_dma14_rst),
				 .tx_dma_cfg_dma14_stall(tx_dma_cfg_dma14_stall),
				 .tx_dma_cfg_dma14_mbaddr(tx_dma_cfg_dma14_mbaddr[37:0]),
				 .tx_cfg_dma14_enable_mb(tx_cfg_dma14_enable_mb),
				 .tx_cfg_dma14_mk(tx_cfg_dma14_mk),
				 .tx_cfg_dma14_mmk(tx_cfg_dma14_mmk),
				 .tx_cs_dma14(tx_cs_dma14[63:0]),
				 .tx_dma14_pre_st(tx_dma14_pre_st[63:0]),
				 .tx_dma14_rng_err_logh(tx_dma14_rng_err_logh[63:0]),
				 .tx_dma14_rng_err_logl(tx_dma14_rng_err_logl[63:0]),
				 .page0_mask_dma15(page0_mask_dma15[31:0]),
				 .page0_value_dma15(page0_value_dma15[31:0]),
				 .page0_reloc_dma15(page0_reloc_dma15[31:0]),
				 .page0_valid_dma15(page0_valid_dma15),
				 .page1_mask_dma15(page1_mask_dma15[31:0]),
				 .page1_value_dma15(page1_value_dma15[31:0]),
				 .page1_reloc_dma15(page1_reloc_dma15[31:0]),
				 .page1_valid_dma15(page1_valid_dma15),
				 .dmc_txc_dma15_page_handle(dmc_txc_dma15_page_handle[19:0]),
				 .tx_rng_cfg_dma15_len(tx_rng_cfg_dma15_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma15_staddr(tx_rng_cfg_dma15_staddr[37:0]),
				 .tx_rng_tail_dma15(tx_rng_tail_dma15[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma15_rst(tx_dma_cfg_dma15_rst),
				 .tx_dma_cfg_dma15_stall(tx_dma_cfg_dma15_stall),
				 .tx_dma_cfg_dma15_mbaddr(tx_dma_cfg_dma15_mbaddr[37:0]),
				 .tx_cfg_dma15_enable_mb(tx_cfg_dma15_enable_mb),
				 .tx_cfg_dma15_mk(tx_cfg_dma15_mk),
				 .tx_cfg_dma15_mmk(tx_cfg_dma15_mmk),
				 .tx_cs_dma15(tx_cs_dma15[63:0]),
				 .tx_dma15_pre_st(tx_dma15_pre_st[63:0]),
				 .tx_dma15_rng_err_logh(tx_dma15_rng_err_logh[63:0]),
				 .tx_dma15_rng_err_logl(tx_dma15_rng_err_logl[63:0]),
				 .dmc_txc_dma0_error(dmc_txc_dma0_error),
				 .dmc_txc_dma1_error(dmc_txc_dma1_error),
				 .dmc_txc_dma2_error(dmc_txc_dma2_error),
				 .dmc_txc_dma3_error(dmc_txc_dma3_error),
				 .dmc_txc_dma4_error(dmc_txc_dma4_error),
				 .dmc_txc_dma5_error(dmc_txc_dma5_error),
				 .dmc_txc_dma6_error(dmc_txc_dma6_error),
				 .dmc_txc_dma7_error(dmc_txc_dma7_error),
				 .dmc_txc_dma8_error(dmc_txc_dma8_error),
				 .dmc_txc_dma9_error(dmc_txc_dma9_error),
				 .dmc_txc_dma10_error(dmc_txc_dma10_error),
				 .dmc_txc_dma11_error(dmc_txc_dma11_error),
				 .dmc_txc_dma12_error(dmc_txc_dma12_error),
				 .dmc_txc_dma13_error(dmc_txc_dma13_error),
				 .dmc_txc_dma14_error(dmc_txc_dma14_error),
				 .dmc_txc_dma15_error(dmc_txc_dma15_error),

`ifdef NEPTUNE
				 
				 .page0_mask_dma16(page0_mask_dma16[31:0]),
				 .page0_value_dma16(page0_value_dma16[31:0]),
				 .page0_reloc_dma16(page0_reloc_dma16[31:0]),
				 .page0_valid_dma16(page0_valid_dma16),
				 .page1_mask_dma16(page1_mask_dma16[31:0]),
				 .page1_value_dma16(page1_value_dma16[31:0]),
				 .page1_reloc_dma16(page1_reloc_dma16[31:0]),
				 .page1_valid_dma16(page1_valid_dma16),
				 .dmc_txc_dma16_page_handle(dmc_txc_dma16_page_handle[19:0]),
				 .tx_rng_cfg_dma16_len(tx_rng_cfg_dma16_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma16_staddr(tx_rng_cfg_dma16_staddr[37:0]),
				 .tx_rng_tail_dma16(tx_rng_tail_dma16[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma16_rst(tx_dma_cfg_dma16_rst),
				 .tx_dma_cfg_dma16_stall(tx_dma_cfg_dma16_stall),
				 .tx_dma_cfg_dma16_mbaddr(tx_dma_cfg_dma16_mbaddr[37:0]),
				 .tx_cfg_dma16_enable_mb(tx_cfg_dma16_enable_mb),
				 .tx_cfg_dma16_mk(tx_cfg_dma16_mk),
				 .tx_cfg_dma16_mmk(tx_cfg_dma16_mmk),
				 .tx_cs_dma16(tx_cs_dma16[63:0]),
				 .tx_dma16_pre_st(tx_dma16_pre_st[63:0]),
				 .tx_dma16_rng_err_logh(tx_dma16_rng_err_logh[63:0]),
				 .tx_dma16_rng_err_logl(tx_dma16_rng_err_logl[63:0]),
				 .page0_mask_dma17(page0_mask_dma17[31:0]),
				 .page0_value_dma17(page0_value_dma17[31:0]),
				 .page0_reloc_dma17(page0_reloc_dma17[31:0]),
				 .page0_valid_dma17(page0_valid_dma17),
				 .page1_mask_dma17(page1_mask_dma17[31:0]),
				 .page1_value_dma17(page1_value_dma17[31:0]),
				 .page1_reloc_dma17(page1_reloc_dma17[31:0]),
				 .page1_valid_dma17(page1_valid_dma17),
				 .dmc_txc_dma17_page_handle(dmc_txc_dma17_page_handle[19:0]),
				 .tx_rng_cfg_dma17_len(tx_rng_cfg_dma17_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma17_staddr(tx_rng_cfg_dma17_staddr[37:0]),
				 .tx_rng_tail_dma17(tx_rng_tail_dma17[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma17_rst(tx_dma_cfg_dma17_rst),
				 .tx_dma_cfg_dma17_stall(tx_dma_cfg_dma17_stall),
				 .tx_dma_cfg_dma17_mbaddr(tx_dma_cfg_dma17_mbaddr[37:0]),
				 .tx_cfg_dma17_enable_mb(tx_cfg_dma17_enable_mb),
				 .tx_cfg_dma17_mk(tx_cfg_dma17_mk),
				 .tx_cfg_dma17_mmk(tx_cfg_dma17_mmk),
				 .tx_cs_dma17(tx_cs_dma17[63:0]),
				 .tx_dma17_pre_st(tx_dma17_pre_st[63:0]),
				 .tx_dma17_rng_err_logh(tx_dma17_rng_err_logh[63:0]),
				 .tx_dma17_rng_err_logl(tx_dma17_rng_err_logl[63:0]),
				 .page0_mask_dma18(page0_mask_dma18[31:0]),
				 .page0_value_dma18(page0_value_dma18[31:0]),
				 .page0_reloc_dma18(page0_reloc_dma18[31:0]),
				 .page0_valid_dma18(page0_valid_dma18),
				 .page1_mask_dma18(page1_mask_dma18[31:0]),
				 .page1_value_dma18(page1_value_dma18[31:0]),
				 .page1_reloc_dma18(page1_reloc_dma18[31:0]),
				 .page1_valid_dma18(page1_valid_dma18),
				 .dmc_txc_dma18_page_handle(dmc_txc_dma18_page_handle[19:0]),
				 .tx_rng_cfg_dma18_len(tx_rng_cfg_dma18_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma18_staddr(tx_rng_cfg_dma18_staddr[37:0]),
				 .tx_rng_tail_dma18(tx_rng_tail_dma18[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma18_rst(tx_dma_cfg_dma18_rst),
				 .tx_dma_cfg_dma18_stall(tx_dma_cfg_dma18_stall),
				 .tx_dma_cfg_dma18_mbaddr(tx_dma_cfg_dma18_mbaddr[37:0]),
				 .tx_cfg_dma18_enable_mb(tx_cfg_dma18_enable_mb),
				 .tx_cfg_dma18_mk(tx_cfg_dma18_mk),
				 .tx_cfg_dma18_mmk(tx_cfg_dma18_mmk),
				 .tx_cs_dma18(tx_cs_dma18[63:0]),
				 .tx_dma18_pre_st(tx_dma18_pre_st[63:0]),
				 .tx_dma18_rng_err_logh(tx_dma18_rng_err_logh[63:0]),
				 .tx_dma18_rng_err_logl(tx_dma18_rng_err_logl[63:0]),
				 .page0_mask_dma19(page0_mask_dma19[31:0]),
				 .page0_value_dma19(page0_value_dma19[31:0]),
				 .page0_reloc_dma19(page0_reloc_dma19[31:0]),
				 .page0_valid_dma19(page0_valid_dma19),
				 .page1_mask_dma19(page1_mask_dma19[31:0]),
				 .page1_value_dma19(page1_value_dma19[31:0]),
				 .page1_reloc_dma19(page1_reloc_dma19[31:0]),
				 .page1_valid_dma19(page1_valid_dma19),
				 .dmc_txc_dma19_page_handle(dmc_txc_dma19_page_handle[19:0]),
				 .tx_rng_cfg_dma19_len(tx_rng_cfg_dma19_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma19_staddr(tx_rng_cfg_dma19_staddr[37:0]),
				 .tx_rng_tail_dma19(tx_rng_tail_dma19[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma19_rst(tx_dma_cfg_dma19_rst),
				 .tx_dma_cfg_dma19_stall(tx_dma_cfg_dma19_stall),
				 .tx_dma_cfg_dma19_mbaddr(tx_dma_cfg_dma19_mbaddr[37:0]),
				 .tx_cfg_dma19_enable_mb(tx_cfg_dma19_enable_mb),
				 .tx_cfg_dma19_mk(tx_cfg_dma19_mk),
				 .tx_cfg_dma19_mmk(tx_cfg_dma19_mmk),
				 .tx_cs_dma19(tx_cs_dma19[63:0]),
				 .tx_dma19_pre_st(tx_dma19_pre_st[63:0]),
				 .tx_dma19_rng_err_logh(tx_dma19_rng_err_logh[63:0]),
				 .tx_dma19_rng_err_logl(tx_dma19_rng_err_logl[63:0]),
				 .page0_mask_dma20(page0_mask_dma20[31:0]),
				 .page0_value_dma20(page0_value_dma20[31:0]),
				 .page0_reloc_dma20(page0_reloc_dma20[31:0]),
				 .page0_valid_dma20(page0_valid_dma20),
				 .page1_mask_dma20(page1_mask_dma20[31:0]),
				 .page1_value_dma20(page1_value_dma20[31:0]),
				 .page1_reloc_dma20(page1_reloc_dma20[31:0]),
				 .page1_valid_dma20(page1_valid_dma20),
				 .dmc_txc_dma20_page_handle(dmc_txc_dma20_page_handle[19:0]),
				 .tx_rng_cfg_dma20_len(tx_rng_cfg_dma20_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma20_staddr(tx_rng_cfg_dma20_staddr[37:0]),
				 .tx_rng_tail_dma20(tx_rng_tail_dma20[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma20_rst(tx_dma_cfg_dma20_rst),
				 .tx_dma_cfg_dma20_stall(tx_dma_cfg_dma20_stall),
				 .tx_dma_cfg_dma20_mbaddr(tx_dma_cfg_dma20_mbaddr[37:0]),
				 .tx_cfg_dma20_enable_mb(tx_cfg_dma20_enable_mb),
				 .tx_cfg_dma20_mk(tx_cfg_dma20_mk),
				 .tx_cfg_dma20_mmk(tx_cfg_dma20_mmk),
				 .tx_cs_dma20(tx_cs_dma20[63:0]),
				 .tx_dma20_pre_st(tx_dma20_pre_st[63:0]),
				 .tx_dma20_rng_err_logh(tx_dma20_rng_err_logh[63:0]),
				 .tx_dma20_rng_err_logl(tx_dma20_rng_err_logl[63:0]),
				 .page0_mask_dma21(page0_mask_dma21[31:0]),
				 .page0_value_dma21(page0_value_dma21[31:0]),
				 .page0_reloc_dma21(page0_reloc_dma21[31:0]),
				 .page0_valid_dma21(page0_valid_dma21),
				 .page1_mask_dma21(page1_mask_dma21[31:0]),
				 .page1_value_dma21(page1_value_dma21[31:0]),
				 .page1_reloc_dma21(page1_reloc_dma21[31:0]),
				 .page1_valid_dma21(page1_valid_dma21),
				 .dmc_txc_dma21_page_handle(dmc_txc_dma21_page_handle[19:0]),
				 .tx_rng_cfg_dma21_len(tx_rng_cfg_dma21_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma21_staddr(tx_rng_cfg_dma21_staddr[37:0]),
				 .tx_rng_tail_dma21(tx_rng_tail_dma21[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma21_rst(tx_dma_cfg_dma21_rst),
				 .tx_dma_cfg_dma21_stall(tx_dma_cfg_dma21_stall),
				 .tx_dma_cfg_dma21_mbaddr(tx_dma_cfg_dma21_mbaddr[37:0]),
				 .tx_cfg_dma21_enable_mb(tx_cfg_dma21_enable_mb),
				 .tx_cfg_dma21_mk(tx_cfg_dma21_mk),
				 .tx_cfg_dma21_mmk(tx_cfg_dma21_mmk),
				 .tx_cs_dma21(tx_cs_dma21[63:0]),
				 .tx_dma21_pre_st(tx_dma21_pre_st[63:0]),
				 .tx_dma21_rng_err_logh(tx_dma21_rng_err_logh[63:0]),
				 .tx_dma21_rng_err_logl(tx_dma21_rng_err_logl[63:0]),
				 .page0_mask_dma22(page0_mask_dma22[31:0]),
				 .page0_value_dma22(page0_value_dma22[31:0]),
				 .page0_reloc_dma22(page0_reloc_dma22[31:0]),
				 .page0_valid_dma22(page0_valid_dma22),
				 .page1_mask_dma22(page1_mask_dma22[31:0]),
				 .page1_value_dma22(page1_value_dma22[31:0]),
				 .page1_reloc_dma22(page1_reloc_dma22[31:0]),
				 .page1_valid_dma22(page1_valid_dma22),
				 .dmc_txc_dma22_page_handle(dmc_txc_dma22_page_handle[19:0]),
				 .tx_rng_cfg_dma22_len(tx_rng_cfg_dma22_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma22_staddr(tx_rng_cfg_dma22_staddr[37:0]),
				 .tx_rng_tail_dma22(tx_rng_tail_dma22[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma22_rst(tx_dma_cfg_dma22_rst),
				 .tx_dma_cfg_dma22_stall(tx_dma_cfg_dma22_stall),
				 .tx_dma_cfg_dma22_mbaddr(tx_dma_cfg_dma22_mbaddr[37:0]),
				 .tx_cfg_dma22_enable_mb(tx_cfg_dma22_enable_mb),
				 .tx_cfg_dma22_mk(tx_cfg_dma22_mk),
				 .tx_cfg_dma22_mmk(tx_cfg_dma22_mmk),
				 .tx_cs_dma22(tx_cs_dma22[63:0]),
				 .tx_dma22_pre_st(tx_dma22_pre_st[63:0]),
				 .tx_dma22_rng_err_logh(tx_dma22_rng_err_logh[63:0]),
				 .tx_dma22_rng_err_logl(tx_dma22_rng_err_logl[63:0]),
				 .page0_mask_dma23(page0_mask_dma23[31:0]),
				 .page0_value_dma23(page0_value_dma23[31:0]),
				 .page0_reloc_dma23(page0_reloc_dma23[31:0]),
				 .page0_valid_dma23(page0_valid_dma23),
				 .page1_mask_dma23(page1_mask_dma23[31:0]),
				 .page1_value_dma23(page1_value_dma23[31:0]),
				 .page1_reloc_dma23(page1_reloc_dma23[31:0]),
				 .page1_valid_dma23(page1_valid_dma23),
				 .dmc_txc_dma23_page_handle(dmc_txc_dma23_page_handle[19:0]),
				 .tx_rng_cfg_dma23_len(tx_rng_cfg_dma23_len[`RNG_LENGTH_WIDTH -1:0]),
				 .tx_rng_cfg_dma23_staddr(tx_rng_cfg_dma23_staddr[37:0]),
				 .tx_rng_tail_dma23(tx_rng_tail_dma23[`PTR_WIDTH:0]),
				 .tx_dma_cfg_dma23_rst(tx_dma_cfg_dma23_rst),
				 .tx_dma_cfg_dma23_stall(tx_dma_cfg_dma23_stall),
				 .tx_dma_cfg_dma23_mbaddr(tx_dma_cfg_dma23_mbaddr[37:0]),
				 .tx_cfg_dma23_enable_mb(tx_cfg_dma23_enable_mb),
				 .tx_cfg_dma23_mk(tx_cfg_dma23_mk),
				 .tx_cfg_dma23_mmk(tx_cfg_dma23_mmk),
				 .tx_cs_dma23(tx_cs_dma23[63:0]),
				 .tx_dma23_pre_st(tx_dma23_pre_st[63:0]),
				 .tx_dma23_rng_err_logh(tx_dma23_rng_err_logh[63:0]),
				 .tx_dma23_rng_err_logl(tx_dma23_rng_err_logl[63:0]),
				 .dmc_txc_dma16_error(dmc_txc_dma16_error),
				 .dmc_txc_dma17_error(dmc_txc_dma17_error),
				 .dmc_txc_dma18_error(dmc_txc_dma18_error),
				 .dmc_txc_dma19_error(dmc_txc_dma19_error),
				 .dmc_txc_dma20_error(dmc_txc_dma20_error),
				 .dmc_txc_dma21_error(dmc_txc_dma21_error),
				 .dmc_txc_dma22_error(dmc_txc_dma22_error),
				 .dmc_txc_dma23_error(dmc_txc_dma23_error),
`else
`endif
				 .parity_corrupt_config(parity_corrupt_config[31:0]),
				 .dmc_txc_tx_addr_md(dmc_txc_tx_addr_md),
				 .tdmc_pio_intr(tdmc_pio_intr[63:0]),
				 .dmc_txc_dma0_func_num(dmc_txc_dma0_func_num[1:0]),
				 .dmc_txc_dma1_func_num(dmc_txc_dma1_func_num[1:0]),
				 .dmc_txc_dma2_func_num(dmc_txc_dma2_func_num[1:0]),
				 .dmc_txc_dma3_func_num(dmc_txc_dma3_func_num[1:0]),
				 .dmc_txc_dma4_func_num(dmc_txc_dma4_func_num[1:0]),
				 .dmc_txc_dma5_func_num(dmc_txc_dma5_func_num[1:0]),
				 .dmc_txc_dma6_func_num(dmc_txc_dma6_func_num[1:0]),
				 .dmc_txc_dma7_func_num(dmc_txc_dma7_func_num[1:0]),
				 .dmc_txc_dma8_func_num(dmc_txc_dma8_func_num[1:0]),
				 .dmc_txc_dma9_func_num(dmc_txc_dma9_func_num[1:0]),
				 .dmc_txc_dma10_func_num(dmc_txc_dma10_func_num[1:0]),
				 .dmc_txc_dma11_func_num(dmc_txc_dma11_func_num[1:0]),
				 .dmc_txc_dma12_func_num(dmc_txc_dma12_func_num[1:0]),
				 .dmc_txc_dma13_func_num(dmc_txc_dma13_func_num[1:0]),
				 .dmc_txc_dma14_func_num(dmc_txc_dma14_func_num[1:0]),
				 .dmc_txc_dma15_func_num(dmc_txc_dma15_func_num[1:0]),
`ifdef NEPTUNE
				 
				 .dmc_txc_dma16_func_num(dmc_txc_dma16_func_num[1:0]),
				 .dmc_txc_dma17_func_num(dmc_txc_dma17_func_num[1:0]),
				 .dmc_txc_dma18_func_num(dmc_txc_dma18_func_num[1:0]),
				 .dmc_txc_dma19_func_num(dmc_txc_dma19_func_num[1:0]),
				 .dmc_txc_dma20_func_num(dmc_txc_dma20_func_num[1:0]),
				 .dmc_txc_dma21_func_num(dmc_txc_dma21_func_num[1:0]),
				 .dmc_txc_dma22_func_num(dmc_txc_dma22_func_num[1:0]),
				 .dmc_txc_dma23_func_num(dmc_txc_dma23_func_num[1:0]),
`endif
				 .tx_dma_cfg_dma0_stop(tx_dma_cfg_dma0_stop),
				 .tx_dma_cfg_dma1_stop(tx_dma_cfg_dma1_stop),
				 .tx_dma_cfg_dma2_stop(tx_dma_cfg_dma2_stop),
				 .tx_dma_cfg_dma3_stop(tx_dma_cfg_dma3_stop),
				 .tx_dma_cfg_dma4_stop(tx_dma_cfg_dma4_stop),
				 .tx_dma_cfg_dma5_stop(tx_dma_cfg_dma5_stop),
				 .tx_dma_cfg_dma6_stop(tx_dma_cfg_dma6_stop),
				 .tx_dma_cfg_dma7_stop(tx_dma_cfg_dma7_stop),
				 .tx_dma_cfg_dma8_stop(tx_dma_cfg_dma8_stop),
				 .tx_dma_cfg_dma9_stop(tx_dma_cfg_dma9_stop),
				 .tx_dma_cfg_dma10_stop(tx_dma_cfg_dma10_stop),
				 .tx_dma_cfg_dma11_stop(tx_dma_cfg_dma11_stop),
				 .tx_dma_cfg_dma12_stop(tx_dma_cfg_dma12_stop),
				 .tx_dma_cfg_dma13_stop(tx_dma_cfg_dma13_stop),
				 .tx_dma_cfg_dma14_stop(tx_dma_cfg_dma14_stop),
				 .tx_dma_cfg_dma15_stop(tx_dma_cfg_dma15_stop),
`ifdef NEPTUNE
				 .tx_dma_cfg_dma16_stop(tx_dma_cfg_dma16_stop),
				 .tx_dma_cfg_dma17_stop(tx_dma_cfg_dma17_stop),
				 .tx_dma_cfg_dma18_stop(tx_dma_cfg_dma18_stop),
				 .tx_dma_cfg_dma19_stop(tx_dma_cfg_dma19_stop),
				 .tx_dma_cfg_dma20_stop(tx_dma_cfg_dma20_stop),
				 .tx_dma_cfg_dma21_stop(tx_dma_cfg_dma21_stop),
				 .tx_dma_cfg_dma22_stop(tx_dma_cfg_dma22_stop),
				 .tx_dma_cfg_dma23_stop(tx_dma_cfg_dma23_stop),
`endif

				   

				 // Inputs
				 .SysClk(niu_clk),
				 .Reset_L(Reset_L),
				 .pio_clients_rd(pio_clients_rd),
				 .pio_tdmc_sel(pio_tdmc_sel),
				 .pio_clients_addr(pio_clients_addr[19:0]),
				 .pio_clients_wdata(pio_clients_wdata[63:0]),
                                 `ifdef NEPTUNE
                                 .pio_clients_32b(pio_clients_32b),
                                 `else // !ifdef NEPTUNE
                                 .pio_clients_32b(1'b0),
                                 `endif // !ifdef NEPTUNE
				 .set_cfg_dma0_mk(set_cfg_dma0_mk),
				 .set_cfg_dma1_mk(set_cfg_dma1_mk),
				 .set_cfg_dma2_mk(set_cfg_dma2_mk),
				 .set_cfg_dma3_mk(set_cfg_dma3_mk),
				 .set_cfg_dma4_mk(set_cfg_dma4_mk),
				 .set_cfg_dma5_mk(set_cfg_dma5_mk),
				 .set_cfg_dma6_mk(set_cfg_dma6_mk),
				 .set_cfg_dma7_mk(set_cfg_dma7_mk),
				 .set_cfg_dma8_mk(set_cfg_dma8_mk),
				 .set_cfg_dma9_mk(set_cfg_dma9_mk),
				 .set_cfg_dma10_mk(set_cfg_dma10_mk),
				 .set_cfg_dma11_mk(set_cfg_dma11_mk),
				 .set_cfg_dma12_mk(set_cfg_dma12_mk),
				 .set_cfg_dma13_mk(set_cfg_dma13_mk),
				 .set_cfg_dma14_mk(set_cfg_dma14_mk),
				 .set_cfg_dma15_mk(set_cfg_dma15_mk),
`ifdef NEPTUNE
				 .set_cfg_dma16_mk(set_cfg_dma16_mk),
				 .set_cfg_dma17_mk(set_cfg_dma17_mk),
				 .set_cfg_dma18_mk(set_cfg_dma18_mk),
				 .set_cfg_dma19_mk(set_cfg_dma19_mk),
				 .set_cfg_dma20_mk(set_cfg_dma20_mk),
				 .set_cfg_dma21_mk(set_cfg_dma21_mk),
				 .set_cfg_dma22_mk(set_cfg_dma22_mk),
				 .set_cfg_dma23_mk(set_cfg_dma23_mk),

`endif
				 .tx_rng_head_dma0(tx_rng_head_dma0[`PTR_WIDTH:0]),
				 .dma0_clear_reset(dma0_clear_reset),
				 .set_cfg_dma0_mmk(set_cfg_dma0_mmk),
				 .clear_cfg_dma0_mb(clear_cfg_dma0_mb),
				 .tx_rng_head_dma1(tx_rng_head_dma1[`PTR_WIDTH:0]),
				 .dma1_clear_reset(dma1_clear_reset),
				 .set_cfg_dma1_mmk(set_cfg_dma1_mmk),
				 .clear_cfg_dma1_mb(clear_cfg_dma1_mb),
				 .tx_rng_head_dma2(tx_rng_head_dma2[`PTR_WIDTH:0]),
				 .dma2_clear_reset(dma2_clear_reset),
				 .set_cfg_dma2_mmk(set_cfg_dma2_mmk),
				 .clear_cfg_dma2_mb(clear_cfg_dma2_mb),
				 .tx_rng_head_dma3(tx_rng_head_dma3[`PTR_WIDTH:0]),
				 .dma3_clear_reset(dma3_clear_reset),
				 .set_cfg_dma3_mmk(set_cfg_dma3_mmk),
				 .clear_cfg_dma3_mb(clear_cfg_dma3_mb),
				 .tx_rng_head_dma4(tx_rng_head_dma4[`PTR_WIDTH:0]),
				 .dma4_clear_reset(dma4_clear_reset),
				 .set_cfg_dma4_mmk(set_cfg_dma4_mmk),
				 .clear_cfg_dma4_mb(clear_cfg_dma4_mb),
				 .tx_rng_head_dma5(tx_rng_head_dma5[`PTR_WIDTH:0]),
				 .dma5_clear_reset(dma5_clear_reset),
				 .set_cfg_dma5_mmk(set_cfg_dma5_mmk),
				 .clear_cfg_dma5_mb(clear_cfg_dma5_mb),
				 .tx_rng_head_dma6(tx_rng_head_dma6[`PTR_WIDTH:0]),
				 .dma6_clear_reset(dma6_clear_reset),
				 .set_cfg_dma6_mmk(set_cfg_dma6_mmk),
				 .clear_cfg_dma6_mb(clear_cfg_dma6_mb),
				 .tx_rng_head_dma7(tx_rng_head_dma7[`PTR_WIDTH:0]),
				 .dma7_clear_reset(dma7_clear_reset),
				 .set_cfg_dma7_mmk(set_cfg_dma7_mmk),
				 .clear_cfg_dma7_mb(clear_cfg_dma7_mb),
				 .tx_rng_head_dma8(tx_rng_head_dma8[`PTR_WIDTH:0]),
				 .dma8_clear_reset(dma8_clear_reset),
				 .set_cfg_dma8_mmk(set_cfg_dma8_mmk),
				 .clear_cfg_dma8_mb(clear_cfg_dma8_mb),
				 .tx_rng_head_dma9(tx_rng_head_dma9[`PTR_WIDTH:0]),
				 .dma9_clear_reset(dma9_clear_reset),
				 .set_cfg_dma9_mmk(set_cfg_dma9_mmk),
				 .clear_cfg_dma9_mb(clear_cfg_dma9_mb),
				 .tx_rng_head_dma10(tx_rng_head_dma10[`PTR_WIDTH:0]),
				 .dma10_clear_reset(dma10_clear_reset),
				 .set_cfg_dma10_mmk(set_cfg_dma10_mmk),
				 .clear_cfg_dma10_mb(clear_cfg_dma10_mb),
				 .tx_rng_head_dma11(tx_rng_head_dma11[`PTR_WIDTH:0]),
				 .dma11_clear_reset(dma11_clear_reset),
				 .set_cfg_dma11_mmk(set_cfg_dma11_mmk),
				 .clear_cfg_dma11_mb(clear_cfg_dma11_mb),
				 .tx_rng_head_dma12(tx_rng_head_dma12[`PTR_WIDTH:0]),
				 .dma12_clear_reset(dma12_clear_reset),
				 .set_cfg_dma12_mmk(set_cfg_dma12_mmk),
				 .clear_cfg_dma12_mb(clear_cfg_dma12_mb),
				 .tx_rng_head_dma13(tx_rng_head_dma13[`PTR_WIDTH:0]),
				 .dma13_clear_reset(dma13_clear_reset),
				 .set_cfg_dma13_mmk(set_cfg_dma13_mmk),
				 .clear_cfg_dma13_mb(clear_cfg_dma13_mb),
				 .tx_rng_head_dma14(tx_rng_head_dma14[`PTR_WIDTH:0]),
				 .dma14_clear_reset(dma14_clear_reset),
				 .set_cfg_dma14_mmk(set_cfg_dma14_mmk),
				 .clear_cfg_dma14_mb(clear_cfg_dma14_mb),
				 .tx_rng_head_dma15(tx_rng_head_dma15[`PTR_WIDTH:0]),
				 .dma15_clear_reset(dma15_clear_reset),
				 .set_cfg_dma15_mmk(set_cfg_dma15_mmk),
				 .clear_cfg_dma15_mb(clear_cfg_dma15_mb),
				 .txc_dmc_dma0_mark_bit(txc_dmc_dma0_mark_bit),
				 .txc_dmc_dma0_inc_pkt_cnt(txc_dmc_dma0_inc_pkt_cnt),
				 .txc_dmc_dma1_mark_bit(txc_dmc_dma1_mark_bit),
				 .txc_dmc_dma1_inc_pkt_cnt(txc_dmc_dma1_inc_pkt_cnt),
				 .txc_dmc_dma2_mark_bit(txc_dmc_dma2_mark_bit),
				 .txc_dmc_dma2_inc_pkt_cnt(txc_dmc_dma2_inc_pkt_cnt),
				 .txc_dmc_dma3_mark_bit(txc_dmc_dma3_mark_bit),
				 .txc_dmc_dma3_inc_pkt_cnt(txc_dmc_dma3_inc_pkt_cnt),
				 .txc_dmc_dma4_mark_bit(txc_dmc_dma4_mark_bit),
				 .txc_dmc_dma4_inc_pkt_cnt(txc_dmc_dma4_inc_pkt_cnt),
				 .txc_dmc_dma5_mark_bit(txc_dmc_dma5_mark_bit),
				 .txc_dmc_dma5_inc_pkt_cnt(txc_dmc_dma5_inc_pkt_cnt),
				 .txc_dmc_dma6_mark_bit(txc_dmc_dma6_mark_bit),
				 .txc_dmc_dma6_inc_pkt_cnt(txc_dmc_dma6_inc_pkt_cnt),
				 .txc_dmc_dma7_mark_bit(txc_dmc_dma7_mark_bit),
				 .txc_dmc_dma7_inc_pkt_cnt(txc_dmc_dma7_inc_pkt_cnt),
				 .txc_dmc_dma8_mark_bit(txc_dmc_dma8_mark_bit),
				 .txc_dmc_dma8_inc_pkt_cnt(txc_dmc_dma8_inc_pkt_cnt),
				 .txc_dmc_dma9_mark_bit(txc_dmc_dma9_mark_bit),
				 .txc_dmc_dma9_inc_pkt_cnt(txc_dmc_dma9_inc_pkt_cnt),
				 .txc_dmc_dma10_mark_bit(txc_dmc_dma10_mark_bit),
				 .txc_dmc_dma10_inc_pkt_cnt(txc_dmc_dma10_inc_pkt_cnt),
				 .txc_dmc_dma11_mark_bit(txc_dmc_dma11_mark_bit),
				 .txc_dmc_dma11_inc_pkt_cnt(txc_dmc_dma11_inc_pkt_cnt),
				 .txc_dmc_dma12_mark_bit(txc_dmc_dma12_mark_bit),
				 .txc_dmc_dma12_inc_pkt_cnt(txc_dmc_dma12_inc_pkt_cnt),
				 .txc_dmc_dma13_mark_bit(txc_dmc_dma13_mark_bit),
				 .txc_dmc_dma13_inc_pkt_cnt(txc_dmc_dma13_inc_pkt_cnt),
				 .txc_dmc_dma14_mark_bit(txc_dmc_dma14_mark_bit),
				 .txc_dmc_dma14_inc_pkt_cnt(txc_dmc_dma14_inc_pkt_cnt),
				 .txc_dmc_dma15_mark_bit(txc_dmc_dma15_mark_bit),
				 .txc_dmc_dma15_inc_pkt_cnt(txc_dmc_dma15_inc_pkt_cnt),

`ifdef NEPTUNE
				 
				 .tx_rng_head_dma16(tx_rng_head_dma16[`PTR_WIDTH:0]),
				 .dma16_clear_reset(dma16_clear_reset),
				 .set_cfg_dma16_mmk(set_cfg_dma16_mmk),
				 .clear_cfg_dma16_mb(clear_cfg_dma16_mb),
				 .tx_rng_head_dma17(tx_rng_head_dma17[`PTR_WIDTH:0]),
				 .dma17_clear_reset(dma17_clear_reset),
				 .set_cfg_dma17_mmk(set_cfg_dma17_mmk),
				 .clear_cfg_dma17_mb(clear_cfg_dma17_mb),
				 .tx_rng_head_dma18(tx_rng_head_dma18[`PTR_WIDTH:0]),
				 .dma18_clear_reset(dma18_clear_reset),
				 .set_cfg_dma18_mmk(set_cfg_dma18_mmk),
				 .clear_cfg_dma18_mb(clear_cfg_dma18_mb),
				 .tx_rng_head_dma19(tx_rng_head_dma19[`PTR_WIDTH:0]),
				 .dma19_clear_reset(dma19_clear_reset),
				 .set_cfg_dma19_mmk(set_cfg_dma19_mmk),
				 .clear_cfg_dma19_mb(clear_cfg_dma19_mb),
				 .tx_rng_head_dma20(tx_rng_head_dma20[`PTR_WIDTH:0]),
				 .dma20_clear_reset(dma20_clear_reset),
				 .set_cfg_dma20_mmk(set_cfg_dma20_mmk),
				 .clear_cfg_dma20_mb(clear_cfg_dma20_mb),
				 .tx_rng_head_dma21(tx_rng_head_dma21[`PTR_WIDTH:0]),
				 .dma21_clear_reset(dma21_clear_reset),
				 .set_cfg_dma21_mmk(set_cfg_dma21_mmk),
				 .clear_cfg_dma21_mb(clear_cfg_dma21_mb),
				 .tx_rng_head_dma22(tx_rng_head_dma22[`PTR_WIDTH:0]),
				 .dma22_clear_reset(dma22_clear_reset),
				 .set_cfg_dma22_mmk(set_cfg_dma22_mmk),
				 .clear_cfg_dma22_mb(clear_cfg_dma22_mb),
				 .tx_rng_head_dma23(tx_rng_head_dma23[`PTR_WIDTH:0]),
				 .dma23_clear_reset(dma23_clear_reset),
				 .set_cfg_dma23_mmk(set_cfg_dma23_mmk),
				 .clear_cfg_dma23_mb(clear_cfg_dma23_mb),
				 .txc_dmc_dma16_mark_bit(txc_dmc_dma16_mark_bit),
				 .txc_dmc_dma16_inc_pkt_cnt(txc_dmc_dma16_inc_pkt_cnt),
				 .txc_dmc_dma17_mark_bit(txc_dmc_dma17_mark_bit),
				 .txc_dmc_dma17_inc_pkt_cnt(txc_dmc_dma17_inc_pkt_cnt),
				 .txc_dmc_dma18_mark_bit(txc_dmc_dma18_mark_bit),
				 .txc_dmc_dma18_inc_pkt_cnt(txc_dmc_dma18_inc_pkt_cnt),
				 .txc_dmc_dma19_mark_bit(txc_dmc_dma19_mark_bit),
				 .txc_dmc_dma19_inc_pkt_cnt(txc_dmc_dma19_inc_pkt_cnt),
				 .txc_dmc_dma20_mark_bit(txc_dmc_dma20_mark_bit),
				 .txc_dmc_dma20_inc_pkt_cnt(txc_dmc_dma20_inc_pkt_cnt),
				 .txc_dmc_dma21_mark_bit(txc_dmc_dma21_mark_bit),
				 .txc_dmc_dma21_inc_pkt_cnt(txc_dmc_dma21_inc_pkt_cnt),
				 .txc_dmc_dma22_mark_bit(txc_dmc_dma22_mark_bit),
				 .txc_dmc_dma22_inc_pkt_cnt(txc_dmc_dma22_inc_pkt_cnt),
				 .txc_dmc_dma23_mark_bit(txc_dmc_dma23_mark_bit),
				 .txc_dmc_dma23_inc_pkt_cnt(txc_dmc_dma23_inc_pkt_cnt),

`endif // !ifdef CHANNELS_16
				 
				 .set_pref_buf_par_err_dma0(set_pref_buf_par_err_dma0),
				 .set_pkt_part_err_dma0(set_pkt_part_err_dma0),
				 .pkt_part_error_address_dma0(pkt_part_error_address_dma0[43:0]),
				 .set_conf_part_error_dma0(set_conf_part_error_dma0),
				 .set_pref_buf_par_err_dma1(set_pref_buf_par_err_dma1),
				 .set_pkt_part_err_dma1(set_pkt_part_err_dma1),
				 .pkt_part_error_address_dma1(pkt_part_error_address_dma1[43:0]),
				 .set_conf_part_error_dma1(set_conf_part_error_dma1),
				 .set_pref_buf_par_err_dma2(set_pref_buf_par_err_dma2),
				 .set_pkt_part_err_dma2(set_pkt_part_err_dma2),
				 .pkt_part_error_address_dma2(pkt_part_error_address_dma2[43:0]),
				 .set_conf_part_error_dma2(set_conf_part_error_dma2),
				 .set_pref_buf_par_err_dma3(set_pref_buf_par_err_dma3),
				 .set_pkt_part_err_dma3(set_pkt_part_err_dma3),
				 .pkt_part_error_address_dma3(pkt_part_error_address_dma3[43:0]),
				 .set_conf_part_error_dma3(set_conf_part_error_dma3),
				 .set_pref_buf_par_err_dma4(set_pref_buf_par_err_dma4),
				 .set_pkt_part_err_dma4(set_pkt_part_err_dma4),
				 .pkt_part_error_address_dma4(pkt_part_error_address_dma4[43:0]),
				 .set_conf_part_error_dma4(set_conf_part_error_dma4),
				 .set_pref_buf_par_err_dma5(set_pref_buf_par_err_dma5),
				 .set_pkt_part_err_dma5(set_pkt_part_err_dma5),
				 .pkt_part_error_address_dma5(pkt_part_error_address_dma5[43:0]),
				 .set_conf_part_error_dma5(set_conf_part_error_dma5),
				 .set_pref_buf_par_err_dma6(set_pref_buf_par_err_dma6),
				 .set_pkt_part_err_dma6(set_pkt_part_err_dma6),
				 .pkt_part_error_address_dma6(pkt_part_error_address_dma6[43:0]),
				 .set_conf_part_error_dma6(set_conf_part_error_dma6),
				 .set_pref_buf_par_err_dma7(set_pref_buf_par_err_dma7),
				 .set_pkt_part_err_dma7(set_pkt_part_err_dma7),
				 .pkt_part_error_address_dma7(pkt_part_error_address_dma7[43:0]),
				 .set_conf_part_error_dma7(set_conf_part_error_dma7),
				 .set_pref_buf_par_err_dma8(set_pref_buf_par_err_dma8),
				 .set_pkt_part_err_dma8(set_pkt_part_err_dma8),
				 .pkt_part_error_address_dma8(pkt_part_error_address_dma8[43:0]),
				 .set_conf_part_error_dma8(set_conf_part_error_dma8),
				 .set_pref_buf_par_err_dma9(set_pref_buf_par_err_dma9),
				 .set_pkt_part_err_dma9(set_pkt_part_err_dma9),
				 .pkt_part_error_address_dma9(pkt_part_error_address_dma9[43:0]),
				 .set_conf_part_error_dma9(set_conf_part_error_dma9),
				 .set_pref_buf_par_err_dma10(set_pref_buf_par_err_dma10),
				 .set_pkt_part_err_dma10(set_pkt_part_err_dma10),
				 .pkt_part_error_address_dma10(pkt_part_error_address_dma10[43:0]),
				 .set_conf_part_error_dma10(set_conf_part_error_dma10),
				 .set_pref_buf_par_err_dma11(set_pref_buf_par_err_dma11),
				 .set_pkt_part_err_dma11(set_pkt_part_err_dma11),
				 .pkt_part_error_address_dma11(pkt_part_error_address_dma11[43:0]),
				 .set_conf_part_error_dma11(set_conf_part_error_dma11),
				 .set_pref_buf_par_err_dma12(set_pref_buf_par_err_dma12),
				 .set_pkt_part_err_dma12(set_pkt_part_err_dma12),
				 .pkt_part_error_address_dma12(pkt_part_error_address_dma12[43:0]),
				 .set_conf_part_error_dma12(set_conf_part_error_dma12),
				 .set_pref_buf_par_err_dma13(set_pref_buf_par_err_dma13),
				 .set_pkt_part_err_dma13(set_pkt_part_err_dma13),
				 .pkt_part_error_address_dma13(pkt_part_error_address_dma13[43:0]),
				 .set_conf_part_error_dma13(set_conf_part_error_dma13),
				 .set_pref_buf_par_err_dma14(set_pref_buf_par_err_dma14),
				 .set_pkt_part_err_dma14(set_pkt_part_err_dma14),
				 .pkt_part_error_address_dma14(pkt_part_error_address_dma14[43:0]),
				 .set_conf_part_error_dma14(set_conf_part_error_dma14),
				 .set_pref_buf_par_err_dma15(set_pref_buf_par_err_dma15),
				 .set_pkt_part_err_dma15(set_pkt_part_err_dma15),
				 .pkt_part_error_address_dma15(pkt_part_error_address_dma15[43:0]),
				 .set_conf_part_error_dma15(set_conf_part_error_dma15),
				 .set_tx_ring_oflow_dma0(set_tx_ring_oflow_dma0),
				 .set_tx_ring_oflow_dma1(set_tx_ring_oflow_dma1),
				 .set_tx_ring_oflow_dma2(set_tx_ring_oflow_dma2),
				 .set_tx_ring_oflow_dma3(set_tx_ring_oflow_dma3),
				 .set_tx_ring_oflow_dma4(set_tx_ring_oflow_dma4),
				 .set_tx_ring_oflow_dma5(set_tx_ring_oflow_dma5),
				 .set_tx_ring_oflow_dma6(set_tx_ring_oflow_dma6),
				 .set_tx_ring_oflow_dma7(set_tx_ring_oflow_dma7),
				 .set_tx_ring_oflow_dma8(set_tx_ring_oflow_dma8),
				 .set_tx_ring_oflow_dma9(set_tx_ring_oflow_dma9),
				 .set_tx_ring_oflow_dma10(set_tx_ring_oflow_dma10),
				 .set_tx_ring_oflow_dma11(set_tx_ring_oflow_dma11),
				 .set_tx_ring_oflow_dma12(set_tx_ring_oflow_dma12),
				 .set_tx_ring_oflow_dma13(set_tx_ring_oflow_dma13),
				 .set_tx_ring_oflow_dma14(set_tx_ring_oflow_dma14),
				 .set_tx_ring_oflow_dma15(set_tx_ring_oflow_dma15),
`ifdef NEPTUNE
				 
				 .set_pref_buf_par_err_dma16(set_pref_buf_par_err_dma16),
				 .set_pkt_part_err_dma16(set_pkt_part_err_dma16),
				 .pkt_part_error_address_dma16(pkt_part_error_address_dma16[43:0]),
				 .set_conf_part_error_dma16(set_conf_part_error_dma16),
				 .set_pref_buf_par_err_dma17(set_pref_buf_par_err_dma17),
				 .set_pkt_part_err_dma17(set_pkt_part_err_dma17),
				 .pkt_part_error_address_dma17(pkt_part_error_address_dma17[43:0]),
				 .set_conf_part_error_dma17(set_conf_part_error_dma17),
				 .set_pref_buf_par_err_dma18(set_pref_buf_par_err_dma18),
				 .set_pkt_part_err_dma18(set_pkt_part_err_dma18),
				 .pkt_part_error_address_dma18(pkt_part_error_address_dma18[43:0]),
				 .set_conf_part_error_dma18(set_conf_part_error_dma18),
				 .set_pref_buf_par_err_dma19(set_pref_buf_par_err_dma19),
				 .set_pkt_part_err_dma19(set_pkt_part_err_dma19),
				 .pkt_part_error_address_dma19(pkt_part_error_address_dma19[43:0]),
				 .set_conf_part_error_dma19(set_conf_part_error_dma19),
				 .set_pref_buf_par_err_dma20(set_pref_buf_par_err_dma20),
				 .set_pkt_part_err_dma20(set_pkt_part_err_dma20),
				 .pkt_part_error_address_dma20(pkt_part_error_address_dma20[43:0]),
				 .set_conf_part_error_dma20(set_conf_part_error_dma20),
				 .set_pref_buf_par_err_dma21(set_pref_buf_par_err_dma21),
				 .set_pkt_part_err_dma21(set_pkt_part_err_dma21),
				 .pkt_part_error_address_dma21(pkt_part_error_address_dma21[43:0]),
				 .set_conf_part_error_dma21(set_conf_part_error_dma21),
				 .set_pref_buf_par_err_dma22(set_pref_buf_par_err_dma22),
				 .set_pkt_part_err_dma22(set_pkt_part_err_dma22),
				 .pkt_part_error_address_dma22(pkt_part_error_address_dma22[43:0]),
				 .set_conf_part_error_dma22(set_conf_part_error_dma22),
				 .set_pref_buf_par_err_dma23(set_pref_buf_par_err_dma23),
				 .set_pkt_part_err_dma23(set_pkt_part_err_dma23),
				 .pkt_part_error_address_dma23(pkt_part_error_address_dma23[43:0]),
				 .set_conf_part_error_dma23(set_conf_part_error_dma23),
				 .set_tx_ring_oflow_dma16(set_tx_ring_oflow_dma16),
				 .set_tx_ring_oflow_dma17(set_tx_ring_oflow_dma17),
				 .set_tx_ring_oflow_dma18(set_tx_ring_oflow_dma18),
				 .set_tx_ring_oflow_dma19(set_tx_ring_oflow_dma19),
				 .set_tx_ring_oflow_dma20(set_tx_ring_oflow_dma20),
				 .set_tx_ring_oflow_dma21(set_tx_ring_oflow_dma21),
				 .set_tx_ring_oflow_dma22(set_tx_ring_oflow_dma22),
				 .set_tx_ring_oflow_dma23(set_tx_ring_oflow_dma23),

`endif // !ifdef CHANNELS_16
				 
				 .ShadowRingCurrentPtr_DMA0(ShadowRingCurrentPtr_DMA0[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA1(ShadowRingCurrentPtr_DMA1[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA2(ShadowRingCurrentPtr_DMA2[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA3(ShadowRingCurrentPtr_DMA3[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA4(ShadowRingCurrentPtr_DMA4[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA5(ShadowRingCurrentPtr_DMA5[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA6(ShadowRingCurrentPtr_DMA6[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA7(ShadowRingCurrentPtr_DMA7[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA8(ShadowRingCurrentPtr_DMA8[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA9(ShadowRingCurrentPtr_DMA9[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA10(ShadowRingCurrentPtr_DMA10[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA11(ShadowRingCurrentPtr_DMA11[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA12(ShadowRingCurrentPtr_DMA12[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA13(ShadowRingCurrentPtr_DMA13[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA14(ShadowRingCurrentPtr_DMA14[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA15(ShadowRingCurrentPtr_DMA15[`PTR_WIDTH - 1:0]),
`ifdef NEPTUNE
				 
				 .ShadowRingCurrentPtr_DMA16(ShadowRingCurrentPtr_DMA16[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA17(ShadowRingCurrentPtr_DMA17[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA18(ShadowRingCurrentPtr_DMA18[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA19(ShadowRingCurrentPtr_DMA19[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA20(ShadowRingCurrentPtr_DMA20[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA21(ShadowRingCurrentPtr_DMA21[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA22(ShadowRingCurrentPtr_DMA22[`PTR_WIDTH - 1:0]),
				 .ShadowRingCurrentPtr_DMA23(ShadowRingCurrentPtr_DMA23[`PTR_WIDTH - 1:0]),
`endif // !ifdef CHANNELS_16
				 
				 .tx_dma_cfg_dma0_stop_state(tx_dma_cfg_dma0_stop_state),
				 .tx_dma_cfg_dma1_stop_state(tx_dma_cfg_dma1_stop_state),
				 .tx_dma_cfg_dma2_stop_state(tx_dma_cfg_dma2_stop_state),
				 .tx_dma_cfg_dma3_stop_state(tx_dma_cfg_dma3_stop_state),
				 .tx_dma_cfg_dma4_stop_state(tx_dma_cfg_dma4_stop_state),
				 .tx_dma_cfg_dma5_stop_state(tx_dma_cfg_dma5_stop_state),
				 .tx_dma_cfg_dma6_stop_state(tx_dma_cfg_dma6_stop_state),
				 .tx_dma_cfg_dma7_stop_state(tx_dma_cfg_dma7_stop_state),
				 .tx_dma_cfg_dma8_stop_state(tx_dma_cfg_dma8_stop_state),
				 .tx_dma_cfg_dma9_stop_state(tx_dma_cfg_dma9_stop_state),
				 .tx_dma_cfg_dma10_stop_state(tx_dma_cfg_dma10_stop_state),
				 .tx_dma_cfg_dma11_stop_state(tx_dma_cfg_dma11_stop_state),
				 .tx_dma_cfg_dma12_stop_state(tx_dma_cfg_dma12_stop_state),
				 .tx_dma_cfg_dma13_stop_state(tx_dma_cfg_dma13_stop_state),
				 .tx_dma_cfg_dma14_stop_state(tx_dma_cfg_dma14_stop_state),
				 .tx_dma_cfg_dma15_stop_state(tx_dma_cfg_dma15_stop_state),
`ifdef NEPTUNE
				 
				 .tx_dma_cfg_dma16_stop_state(tx_dma_cfg_dma16_stop_state),
				 .tx_dma_cfg_dma17_stop_state(tx_dma_cfg_dma17_stop_state),
				 .tx_dma_cfg_dma18_stop_state(tx_dma_cfg_dma18_stop_state),
				 .tx_dma_cfg_dma19_stop_state(tx_dma_cfg_dma19_stop_state),
				 .tx_dma_cfg_dma20_stop_state(tx_dma_cfg_dma20_stop_state),
				 .tx_dma_cfg_dma21_stop_state(tx_dma_cfg_dma21_stop_state),
				 .tx_dma_cfg_dma22_stop_state(tx_dma_cfg_dma22_stop_state),
				 .tx_dma_cfg_dma23_stop_state(tx_dma_cfg_dma23_stop_state),
`endif // !ifdef CHANNELS_16
				 
				 .set_mbox_part_error_dma(set_mbox_part_error_dma[`NO_OF_DMAS-1:0]),

				 .txc_dmc_dma_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[`NO_OF_DMAS-1:0]),
				 .txc_dmc_nack_pkt_rd_addr(txc_dmc_nack_pkt_rd_addr[43:0]),
				 .txc_dmc_nack_pkt_rd(txc_dmc_nack_pkt_rd),

				 .txc_dmc_p0_dma_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[`NO_OF_DMAS-1:0]),
				 .txc_dmc_p0_pkt_size_err_addr(txc_dmc_p0_pkt_size_err_addr[43:0]),
				 .txc_dmc_p0_pkt_size_err(txc_dmc_p0_pkt_size_err),

				 .txc_dmc_p1_dma_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[`NO_OF_DMAS-1:0]),
				 .txc_dmc_p1_pkt_size_err_addr(txc_dmc_p1_pkt_size_err_addr[43:0]),
				 .txc_dmc_p1_pkt_size_err(txc_dmc_p1_pkt_size_err),
				 

`ifdef NEPTUNE
				 .txc_dmc_p2_dma_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[`NO_OF_DMAS-1:0]),
				 .txc_dmc_p2_pkt_size_err_addr(txc_dmc_p2_pkt_size_err_addr[43:0]),
				 .txc_dmc_p2_pkt_size_err(txc_dmc_p2_pkt_size_err),


				 .txc_dmc_p3_dma_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[`NO_OF_DMAS-1:0]),
				 .txc_dmc_p3_pkt_size_err_addr(txc_dmc_p3_pkt_size_err_addr[43:0]),
				 .txc_dmc_p3_pkt_size_err(txc_dmc_p3_pkt_size_err),
`else // !`ifdef NEPTUNE
				 .txc_dmc_p2_dma_pkt_size_err(`NO_OF_DMAS'h0),
				 .txc_dmc_p2_pkt_size_err_addr(44'h0),
				 .txc_dmc_p2_pkt_size_err(1'h0),


				 .txc_dmc_p3_dma_pkt_size_err(`NO_OF_DMAS'h0),
				 .txc_dmc_p3_pkt_size_err_addr(44'h0),
				 .txc_dmc_p3_pkt_size_err(1'h0),
`endif // !`ifdef NEPTUNE
				 


				 
				 .txpref_dma_nack_resp(txpref_dma_nack_resp[`NO_OF_DMAS-1:0]),
				 .txpref_nack_resp(txpref_nack_resp),
				 .txpref_nack_rd_addr(txpref_nack_rd_addr[43:0]),
				 .mbox_ack_dma_err_received(mbox_ack_dma_err_received[`NO_OF_DMAS-1:0]),
				 .mbox_err_received(mbox_err_received));



   niu_tdmc_mbox niu_tdmc_mbox(/*AUTOJUNK*/
			       // Outputs
			       .tdmc_arb0_data(tdmc_arb0_data[127:0]),
			       .tdmc_arb0_data_valid(tdmc_arb0_data_valid),
			       .tdmc_arb0_req(tdmc_arb0_req),
			       .tdmc_arb0_req_address(tdmc_arb0_req_address[63:0]),
			       .tdmc_arb0_req_byteenable(tdmc_arb0_req_byteenable[15:0]),
			       .tdmc_arb0_req_cmd(tdmc_arb0_req_cmd[7:0]),
			       .tdmc_arb0_req_dma_num(tdmc_arb0_req_dma_num[4:0]),
			       .tdmc_arb0_req_length(tdmc_arb0_req_length[13:0]),
			       .tdmc_arb0_req_port_num(tdmc_arb0_req_port_num[1:0]),
			       .tdmc_arb0_status(tdmc_arb0_status[3:0]),
			       .tdmc_arb0_transfer_complete(tdmc_arb0_transfer_complete),
			       .tdmc_arb0_req_func_num(tdmc_arb0_req_func_num[1:0]),
			       .dmc_meta_ack_accept(dmc_meta_ack_accept),
			       .mbox_ack_dma_err_received(mbox_ack_dma_err_received[`NO_OF_DMAS-1:0]),
			       .mbox_err_received(mbox_err_received),
			       .set_mbox_part_error_dma(set_mbox_part_error_dma[`NO_OF_DMAS-1:0]),
			       .clear_cfg_dma0_mb(clear_cfg_dma0_mb),
			       .set_cfg_dma0_mmk(set_cfg_dma0_mmk),
			       .clear_cfg_dma1_mb(clear_cfg_dma1_mb),
			       .set_cfg_dma1_mmk(set_cfg_dma1_mmk),
			       .clear_cfg_dma2_mb(clear_cfg_dma2_mb),
			       .set_cfg_dma2_mmk(set_cfg_dma2_mmk),
			       .clear_cfg_dma3_mb(clear_cfg_dma3_mb),
			       .set_cfg_dma3_mmk(set_cfg_dma3_mmk),
			       .clear_cfg_dma4_mb(clear_cfg_dma4_mb),
			       .set_cfg_dma4_mmk(set_cfg_dma4_mmk),
			       .clear_cfg_dma5_mb(clear_cfg_dma5_mb),
			       .set_cfg_dma5_mmk(set_cfg_dma5_mmk),
			       .clear_cfg_dma6_mb(clear_cfg_dma6_mb),
			       .set_cfg_dma6_mmk(set_cfg_dma6_mmk),
			       .clear_cfg_dma7_mb(clear_cfg_dma7_mb),
			       .set_cfg_dma7_mmk(set_cfg_dma7_mmk),
			       .clear_cfg_dma8_mb(clear_cfg_dma8_mb),
			       .set_cfg_dma8_mmk(set_cfg_dma8_mmk),
			       .clear_cfg_dma9_mb(clear_cfg_dma9_mb),
			       .set_cfg_dma9_mmk(set_cfg_dma9_mmk),
			       .clear_cfg_dma10_mb(clear_cfg_dma10_mb),
			       .set_cfg_dma10_mmk(set_cfg_dma10_mmk),
			       .clear_cfg_dma11_mb(clear_cfg_dma11_mb),
			       .set_cfg_dma11_mmk(set_cfg_dma11_mmk),
			       .clear_cfg_dma12_mb(clear_cfg_dma12_mb),
			       .set_cfg_dma12_mmk(set_cfg_dma12_mmk),
			       .clear_cfg_dma13_mb(clear_cfg_dma13_mb),
			       .set_cfg_dma13_mmk(set_cfg_dma13_mmk),
			       .clear_cfg_dma14_mb(clear_cfg_dma14_mb),
			       .set_cfg_dma14_mmk(set_cfg_dma14_mmk),
			       .clear_cfg_dma15_mb(clear_cfg_dma15_mb),
			       .set_cfg_dma15_mmk(set_cfg_dma15_mmk),
`ifdef NEPTUNE
			       
			       .clear_cfg_dma16_mb(clear_cfg_dma16_mb),
			       .set_cfg_dma16_mmk(set_cfg_dma16_mmk),
			       .clear_cfg_dma17_mb(clear_cfg_dma17_mb),
			       .set_cfg_dma17_mmk(set_cfg_dma17_mmk),
			       .clear_cfg_dma18_mb(clear_cfg_dma18_mb),
			       .set_cfg_dma18_mmk(set_cfg_dma18_mmk),
			       .clear_cfg_dma19_mb(clear_cfg_dma19_mb),
			       .set_cfg_dma19_mmk(set_cfg_dma19_mmk),
			       .clear_cfg_dma20_mb(clear_cfg_dma20_mb),
			       .set_cfg_dma20_mmk(set_cfg_dma20_mmk),
			       .clear_cfg_dma21_mb(clear_cfg_dma21_mb),
			       .set_cfg_dma21_mmk(set_cfg_dma21_mmk),
			       .clear_cfg_dma22_mb(clear_cfg_dma22_mb),
			       .set_cfg_dma22_mmk(set_cfg_dma22_mmk),
			       .clear_cfg_dma23_mb(clear_cfg_dma23_mb),
			       .set_cfg_dma23_mmk(set_cfg_dma23_mmk),
`endif // !ifdef CHANNELS_16
			       
			       .mbox_debug_state(mbox_debug_state[11:0]),
			       .set_cfg_dma0_mk(set_cfg_dma0_mk),
			       .set_cfg_dma1_mk(set_cfg_dma1_mk),
			       .set_cfg_dma2_mk(set_cfg_dma2_mk),
			       .set_cfg_dma3_mk(set_cfg_dma3_mk),
			       .set_cfg_dma4_mk(set_cfg_dma4_mk),
			       .set_cfg_dma5_mk(set_cfg_dma5_mk),
			       .set_cfg_dma6_mk(set_cfg_dma6_mk),
			       .set_cfg_dma7_mk(set_cfg_dma7_mk),
			       .set_cfg_dma8_mk(set_cfg_dma8_mk),
			       .set_cfg_dma9_mk(set_cfg_dma9_mk),
			       .set_cfg_dma10_mk(set_cfg_dma10_mk),
			       .set_cfg_dma11_mk(set_cfg_dma11_mk),
			       .set_cfg_dma12_mk(set_cfg_dma12_mk),
			       .set_cfg_dma13_mk(set_cfg_dma13_mk),
			       .set_cfg_dma14_mk(set_cfg_dma14_mk),
			       .set_cfg_dma15_mk(set_cfg_dma15_mk),
`ifdef NEPTUNE
			       .set_cfg_dma16_mk(set_cfg_dma16_mk),
			       .set_cfg_dma17_mk(set_cfg_dma17_mk),
			       .set_cfg_dma18_mk(set_cfg_dma18_mk),
			       .set_cfg_dma19_mk(set_cfg_dma19_mk),
			       .set_cfg_dma20_mk(set_cfg_dma20_mk),
			       .set_cfg_dma21_mk(set_cfg_dma21_mk),
			       .set_cfg_dma22_mk(set_cfg_dma22_mk),
			       .set_cfg_dma23_mk(set_cfg_dma23_mk),
`endif
			       // Inputs
			       .SysClk	(niu_clk),
			       .Reset_L	(Reset_L),
			       .arb0_tdmc_data_req(arb0_tdmc_data_req),
			       .arb0_tdmc_req_accept(arb0_tdmc_req_accept),
			       .meta_dmc_ack_ready(meta_dmc_ack_ready),
			       .meta_dmc_ack_cmd(meta_dmc_ack_cmd[7:0]),
			       .meta_dmc_ack_dma_num(meta_dmc_ack_dma_num[4:0]),
			       .meta_dmc_ack_client(meta_dmc_ack_client),
			       .meta_dmc_ack_complete(meta_dmc_ack_complete),
			       .meta_dmc_ack_cmd_status(meta_dmc_ack_cmd_status[3:0]),
			       .txc_dmc_dma0_mark_bit(txc_dmc_dma0_mark_bit),
			       .tx_cfg_dma0_mk(tx_cfg_dma0_mk),
			       .tx_cfg_dma0_mmk(tx_cfg_dma0_mmk),
			       .tx_cfg_dma0_enable_mb(tx_cfg_dma0_enable_mb),
			       .tx_cs_dma0(tx_cs_dma0[63:0]),
			       .tx_dma0_pre_st(tx_dma0_pre_st[63:0]),
			       .tx_rng_head_dma0(tx_rng_head_dma0[`PTR_WIDTH:0]),
			       .tx_rng_tail_dma0(tx_rng_tail_dma0[`PTR_WIDTH :0]),
			       .tx_dma0_rng_err_logh(tx_dma0_rng_err_logh[63:0]),
			       .tx_dma0_rng_err_logl(tx_dma0_rng_err_logl[63:0]),
			       .dmc_txc_dma0_page_handle(dmc_txc_dma0_page_handle[19:0]),
			       .tx_dma_cfg_dma0_mbaddr(tx_dma_cfg_dma0_mbaddr[37:0]),
			       .page0_mask_dma0(page0_mask_dma0[31:0]),
			       .page0_value_dma0(page0_value_dma0[31:0]),
			       .page0_reloc_dma0(page0_reloc_dma0[31:0]),
			       .page0_valid_dma0(page0_valid_dma0),
			       .page1_mask_dma0(page1_mask_dma0[31:0]),
			       .page1_value_dma0(page1_value_dma0[31:0]),
			       .page1_reloc_dma0(page1_reloc_dma0[31:0]),
			       .page1_valid_dma0(page1_valid_dma0),
			       .txc_dmc_dma1_mark_bit(txc_dmc_dma1_mark_bit),
			       .tx_cfg_dma1_mk(tx_cfg_dma1_mk),
			       .tx_cfg_dma1_mmk(tx_cfg_dma1_mmk),
			       .tx_cfg_dma1_enable_mb(tx_cfg_dma1_enable_mb),
			       .tx_cs_dma1(tx_cs_dma1[63:0]),
			       .tx_dma1_pre_st(tx_dma1_pre_st[63:0]),
			       .tx_rng_head_dma1(tx_rng_head_dma1[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma1(tx_rng_tail_dma1[`PTR_WIDTH :0]),
			       .tx_dma1_rng_err_logh(tx_dma1_rng_err_logh[63:0]),
			       .tx_dma1_rng_err_logl(tx_dma1_rng_err_logl[63:0]),
			       .dmc_txc_dma1_page_handle(dmc_txc_dma1_page_handle[19:0]),
			       .tx_dma_cfg_dma1_mbaddr(tx_dma_cfg_dma1_mbaddr[37:0]),
			       .page0_mask_dma1(page0_mask_dma1[31:0]),
			       .page0_value_dma1(page0_value_dma1[31:0]),
			       .page0_reloc_dma1(page0_reloc_dma1[31:0]),
			       .page0_valid_dma1(page0_valid_dma1),
			       .page1_mask_dma1(page1_mask_dma1[31:0]),
			       .page1_value_dma1(page1_value_dma1[31:0]),
			       .page1_reloc_dma1(page1_reloc_dma1[31:0]),
			       .page1_valid_dma1(page1_valid_dma1),
			       .txc_dmc_dma2_mark_bit(txc_dmc_dma2_mark_bit),
			       .tx_cfg_dma2_mk(tx_cfg_dma2_mk),
			       .tx_cfg_dma2_mmk(tx_cfg_dma2_mmk),
			       .tx_cfg_dma2_enable_mb(tx_cfg_dma2_enable_mb),
			       .tx_cs_dma2(tx_cs_dma2[63:0]),
			       .tx_dma2_pre_st(tx_dma2_pre_st[63:0]),
			       .tx_rng_head_dma2(tx_rng_head_dma2[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma2(tx_rng_tail_dma2[`PTR_WIDTH :0]),
			       .tx_dma2_rng_err_logh(tx_dma2_rng_err_logh[63:0]),
			       .tx_dma2_rng_err_logl(tx_dma2_rng_err_logl[63:0]),
			       .dmc_txc_dma2_page_handle(dmc_txc_dma2_page_handle[19:0]),
			       .tx_dma_cfg_dma2_mbaddr(tx_dma_cfg_dma2_mbaddr[37:0]),
			       .page0_mask_dma2(page0_mask_dma2[31:0]),
			       .page0_value_dma2(page0_value_dma2[31:0]),
			       .page0_reloc_dma2(page0_reloc_dma2[31:0]),
			       .page0_valid_dma2(page0_valid_dma2),
			       .page1_mask_dma2(page1_mask_dma2[31:0]),
			       .page1_value_dma2(page1_value_dma2[31:0]),
			       .page1_reloc_dma2(page1_reloc_dma2[31:0]),
			       .page1_valid_dma2(page1_valid_dma2),
			       .txc_dmc_dma3_mark_bit(txc_dmc_dma3_mark_bit),
			       .tx_cfg_dma3_mk(tx_cfg_dma3_mk),
			       .tx_cfg_dma3_mmk(tx_cfg_dma3_mmk),
			       .tx_cfg_dma3_enable_mb(tx_cfg_dma3_enable_mb),
			       .tx_cs_dma3(tx_cs_dma3[63:0]),
			       .tx_dma3_pre_st(tx_dma3_pre_st[63:0]),
			       .tx_rng_head_dma3(tx_rng_head_dma3[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma3(tx_rng_tail_dma3[`PTR_WIDTH :0]),
			       .tx_dma3_rng_err_logh(tx_dma3_rng_err_logh[63:0]),
			       .tx_dma3_rng_err_logl(tx_dma3_rng_err_logl[63:0]),
			       .dmc_txc_dma3_page_handle(dmc_txc_dma3_page_handle[19:0]),
			       .tx_dma_cfg_dma3_mbaddr(tx_dma_cfg_dma3_mbaddr[37:0]),
			       .page0_mask_dma3(page0_mask_dma3[31:0]),
			       .page0_value_dma3(page0_value_dma3[31:0]),
			       .page0_reloc_dma3(page0_reloc_dma3[31:0]),
			       .page0_valid_dma3(page0_valid_dma3),
			       .page1_mask_dma3(page1_mask_dma3[31:0]),
			       .page1_value_dma3(page1_value_dma3[31:0]),
			       .page1_reloc_dma3(page1_reloc_dma3[31:0]),
			       .page1_valid_dma3(page1_valid_dma3),
			       .txc_dmc_dma4_mark_bit(txc_dmc_dma4_mark_bit),
			       .tx_cfg_dma4_mk(tx_cfg_dma4_mk),
			       .tx_cfg_dma4_mmk(tx_cfg_dma4_mmk),
			       .tx_cfg_dma4_enable_mb(tx_cfg_dma4_enable_mb),
			       .tx_cs_dma4(tx_cs_dma4[63:0]),
			       .tx_dma4_pre_st(tx_dma4_pre_st[63:0]),
			       .tx_rng_head_dma4(tx_rng_head_dma4[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma4(tx_rng_tail_dma4[`PTR_WIDTH :0]),
			       .tx_dma4_rng_err_logh(tx_dma4_rng_err_logh[63:0]),
			       .tx_dma4_rng_err_logl(tx_dma4_rng_err_logl[63:0]),
			       .dmc_txc_dma4_page_handle(dmc_txc_dma4_page_handle[19:0]),
			       .tx_dma_cfg_dma4_mbaddr(tx_dma_cfg_dma4_mbaddr[37:0]),
			       .page0_mask_dma4(page0_mask_dma4[31:0]),
			       .page0_value_dma4(page0_value_dma4[31:0]),
			       .page0_reloc_dma4(page0_reloc_dma4[31:0]),
			       .page0_valid_dma4(page0_valid_dma4),
			       .page1_mask_dma4(page1_mask_dma4[31:0]),
			       .page1_value_dma4(page1_value_dma4[31:0]),
			       .page1_reloc_dma4(page1_reloc_dma4[31:0]),
			       .page1_valid_dma4(page1_valid_dma4),
			       .txc_dmc_dma5_mark_bit(txc_dmc_dma5_mark_bit),
			       .tx_cfg_dma5_mk(tx_cfg_dma5_mk),
			       .tx_cfg_dma5_mmk(tx_cfg_dma5_mmk),
			       .tx_cfg_dma5_enable_mb(tx_cfg_dma5_enable_mb),
			       .tx_cs_dma5(tx_cs_dma5[63:0]),
			       .tx_dma5_pre_st(tx_dma5_pre_st[63:0]),
			       .tx_rng_head_dma5(tx_rng_head_dma5[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma5(tx_rng_tail_dma5[`PTR_WIDTH :0]),
			       .tx_dma5_rng_err_logh(tx_dma5_rng_err_logh[63:0]),
			       .tx_dma5_rng_err_logl(tx_dma5_rng_err_logl[63:0]),
			       .dmc_txc_dma5_page_handle(dmc_txc_dma5_page_handle[19:0]),
			       .tx_dma_cfg_dma5_mbaddr(tx_dma_cfg_dma5_mbaddr[37:0]),
			       .page0_mask_dma5(page0_mask_dma5[31:0]),
			       .page0_value_dma5(page0_value_dma5[31:0]),
			       .page0_reloc_dma5(page0_reloc_dma5[31:0]),
			       .page0_valid_dma5(page0_valid_dma5),
			       .page1_mask_dma5(page1_mask_dma5[31:0]),
			       .page1_value_dma5(page1_value_dma5[31:0]),
			       .page1_reloc_dma5(page1_reloc_dma5[31:0]),
			       .page1_valid_dma5(page1_valid_dma5),
			       .txc_dmc_dma6_mark_bit(txc_dmc_dma6_mark_bit),
			       .tx_cfg_dma6_mk(tx_cfg_dma6_mk),
			       .tx_cfg_dma6_mmk(tx_cfg_dma6_mmk),
			       .tx_cfg_dma6_enable_mb(tx_cfg_dma6_enable_mb),
			       .tx_cs_dma6(tx_cs_dma6[63:0]),
			       .tx_dma6_pre_st(tx_dma6_pre_st[63:0]),
			       .tx_rng_head_dma6(tx_rng_head_dma6[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma6(tx_rng_tail_dma6[`PTR_WIDTH :0]),
			       .tx_dma6_rng_err_logh(tx_dma6_rng_err_logh[63:0]),
			       .tx_dma6_rng_err_logl(tx_dma6_rng_err_logl[63:0]),
			       .dmc_txc_dma6_page_handle(dmc_txc_dma6_page_handle[19:0]),
			       .tx_dma_cfg_dma6_mbaddr(tx_dma_cfg_dma6_mbaddr[37:0]),
			       .page0_mask_dma6(page0_mask_dma6[31:0]),
			       .page0_value_dma6(page0_value_dma6[31:0]),
			       .page0_reloc_dma6(page0_reloc_dma6[31:0]),
			       .page0_valid_dma6(page0_valid_dma6),
			       .page1_mask_dma6(page1_mask_dma6[31:0]),
			       .page1_value_dma6(page1_value_dma6[31:0]),
			       .page1_reloc_dma6(page1_reloc_dma6[31:0]),
			       .page1_valid_dma6(page1_valid_dma6),
			       .txc_dmc_dma7_mark_bit(txc_dmc_dma7_mark_bit),
			       .tx_cfg_dma7_mk(tx_cfg_dma7_mk),
			       .tx_cfg_dma7_mmk(tx_cfg_dma7_mmk),
			       .tx_cfg_dma7_enable_mb(tx_cfg_dma7_enable_mb),
			       .tx_cs_dma7(tx_cs_dma7[63:0]),
			       .tx_dma7_pre_st(tx_dma7_pre_st[63:0]),
			       .tx_rng_head_dma7(tx_rng_head_dma7[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma7(tx_rng_tail_dma7[`PTR_WIDTH :0]),
			       .tx_dma7_rng_err_logh(tx_dma7_rng_err_logh[63:0]),
			       .tx_dma7_rng_err_logl(tx_dma7_rng_err_logl[63:0]),
			       .dmc_txc_dma7_page_handle(dmc_txc_dma7_page_handle[19:0]),
			       .tx_dma_cfg_dma7_mbaddr(tx_dma_cfg_dma7_mbaddr[37:0]),
			       .page0_mask_dma7(page0_mask_dma7[31:0]),
			       .page0_value_dma7(page0_value_dma7[31:0]),
			       .page0_reloc_dma7(page0_reloc_dma7[31:0]),
			       .page0_valid_dma7(page0_valid_dma7),
			       .page1_mask_dma7(page1_mask_dma7[31:0]),
			       .page1_value_dma7(page1_value_dma7[31:0]),
			       .page1_reloc_dma7(page1_reloc_dma7[31:0]),
			       .page1_valid_dma7(page1_valid_dma7),
			       .txc_dmc_dma8_mark_bit(txc_dmc_dma8_mark_bit),
			       .tx_cfg_dma8_mk(tx_cfg_dma8_mk),
			       .tx_cfg_dma8_mmk(tx_cfg_dma8_mmk),
			       .tx_cfg_dma8_enable_mb(tx_cfg_dma8_enable_mb),
			       .tx_cs_dma8(tx_cs_dma8[63:0]),
			       .tx_dma8_pre_st(tx_dma8_pre_st[63:0]),
			       .tx_rng_head_dma8(tx_rng_head_dma8[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma8(tx_rng_tail_dma8[`PTR_WIDTH :0]),
			       .tx_dma8_rng_err_logh(tx_dma8_rng_err_logh[63:0]),
			       .tx_dma8_rng_err_logl(tx_dma8_rng_err_logl[63:0]),
			       .dmc_txc_dma8_page_handle(dmc_txc_dma8_page_handle[19:0]),
			       .tx_dma_cfg_dma8_mbaddr(tx_dma_cfg_dma8_mbaddr[37:0]),
			       .page0_mask_dma8(page0_mask_dma8[31:0]),
			       .page0_value_dma8(page0_value_dma8[31:0]),
			       .page0_reloc_dma8(page0_reloc_dma8[31:0]),
			       .page0_valid_dma8(page0_valid_dma8),
			       .page1_mask_dma8(page1_mask_dma8[31:0]),
			       .page1_value_dma8(page1_value_dma8[31:0]),
			       .page1_reloc_dma8(page1_reloc_dma8[31:0]),
			       .page1_valid_dma8(page1_valid_dma8),
			       .txc_dmc_dma9_mark_bit(txc_dmc_dma9_mark_bit),
			       .tx_cfg_dma9_mk(tx_cfg_dma9_mk),
			       .tx_cfg_dma9_mmk(tx_cfg_dma9_mmk),
			       .tx_cfg_dma9_enable_mb(tx_cfg_dma9_enable_mb),
			       .tx_cs_dma9(tx_cs_dma9[63:0]),
			       .tx_dma9_pre_st(tx_dma9_pre_st[63:0]),
			       .tx_rng_head_dma9(tx_rng_head_dma9[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma9(tx_rng_tail_dma9[`PTR_WIDTH :0]),
			       .tx_dma9_rng_err_logh(tx_dma9_rng_err_logh[63:0]),
			       .tx_dma9_rng_err_logl(tx_dma9_rng_err_logl[63:0]),
			       .dmc_txc_dma9_page_handle(dmc_txc_dma9_page_handle[19:0]),
			       .tx_dma_cfg_dma9_mbaddr(tx_dma_cfg_dma9_mbaddr[37:0]),
			       .page0_mask_dma9(page0_mask_dma9[31:0]),
			       .page0_value_dma9(page0_value_dma9[31:0]),
			       .page0_reloc_dma9(page0_reloc_dma9[31:0]),
			       .page0_valid_dma9(page0_valid_dma9),
			       .page1_mask_dma9(page1_mask_dma9[31:0]),
			       .page1_value_dma9(page1_value_dma9[31:0]),
			       .page1_reloc_dma9(page1_reloc_dma9[31:0]),
			       .page1_valid_dma9(page1_valid_dma9),
			       .txc_dmc_dma10_mark_bit(txc_dmc_dma10_mark_bit),
			       .tx_cfg_dma10_mk(tx_cfg_dma10_mk),
			       .tx_cfg_dma10_mmk(tx_cfg_dma10_mmk),
			       .tx_cfg_dma10_enable_mb(tx_cfg_dma10_enable_mb),
			       .tx_cs_dma10(tx_cs_dma10[63:0]),
			       .tx_dma10_pre_st(tx_dma10_pre_st[63:0]),
			       .tx_rng_head_dma10(tx_rng_head_dma10[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma10(tx_rng_tail_dma10[`PTR_WIDTH :0]),
			       .tx_dma10_rng_err_logh(tx_dma10_rng_err_logh[63:0]),
			       .tx_dma10_rng_err_logl(tx_dma10_rng_err_logl[63:0]),
			       .dmc_txc_dma10_page_handle(dmc_txc_dma10_page_handle[19:0]),
			       .tx_dma_cfg_dma10_mbaddr(tx_dma_cfg_dma10_mbaddr[37:0]),
			       .page0_mask_dma10(page0_mask_dma10[31:0]),
			       .page0_value_dma10(page0_value_dma10[31:0]),
			       .page0_reloc_dma10(page0_reloc_dma10[31:0]),
			       .page0_valid_dma10(page0_valid_dma10),
			       .page1_mask_dma10(page1_mask_dma10[31:0]),
			       .page1_value_dma10(page1_value_dma10[31:0]),
			       .page1_reloc_dma10(page1_reloc_dma10[31:0]),
			       .page1_valid_dma10(page1_valid_dma10),
			       .txc_dmc_dma11_mark_bit(txc_dmc_dma11_mark_bit),
			       .tx_cfg_dma11_mk(tx_cfg_dma11_mk),
			       .tx_cfg_dma11_mmk(tx_cfg_dma11_mmk),
			       .tx_cfg_dma11_enable_mb(tx_cfg_dma11_enable_mb),
			       .tx_cs_dma11(tx_cs_dma11[63:0]),
			       .tx_dma11_pre_st(tx_dma11_pre_st[63:0]),
			       .tx_rng_head_dma11(tx_rng_head_dma11[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma11(tx_rng_tail_dma11[`PTR_WIDTH :0]),
			       .tx_dma11_rng_err_logh(tx_dma11_rng_err_logh[63:0]),
			       .tx_dma11_rng_err_logl(tx_dma11_rng_err_logl[63:0]),
			       .dmc_txc_dma11_page_handle(dmc_txc_dma11_page_handle[19:0]),
			       .tx_dma_cfg_dma11_mbaddr(tx_dma_cfg_dma11_mbaddr[37:0]),
			       .page0_mask_dma11(page0_mask_dma11[31:0]),
			       .page0_value_dma11(page0_value_dma11[31:0]),
			       .page0_reloc_dma11(page0_reloc_dma11[31:0]),
			       .page0_valid_dma11(page0_valid_dma11),
			       .page1_mask_dma11(page1_mask_dma11[31:0]),
			       .page1_value_dma11(page1_value_dma11[31:0]),
			       .page1_reloc_dma11(page1_reloc_dma11[31:0]),
			       .page1_valid_dma11(page1_valid_dma11),
			       .txc_dmc_dma12_mark_bit(txc_dmc_dma12_mark_bit),
			       .tx_cfg_dma12_mk(tx_cfg_dma12_mk),
			       .tx_cfg_dma12_mmk(tx_cfg_dma12_mmk),
			       .tx_cfg_dma12_enable_mb(tx_cfg_dma12_enable_mb),
			       .tx_cs_dma12(tx_cs_dma12[63:0]),
			       .tx_dma12_pre_st(tx_dma12_pre_st[63:0]),
			       .tx_rng_head_dma12(tx_rng_head_dma12[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma12(tx_rng_tail_dma12[`PTR_WIDTH :0]),
			       .tx_dma12_rng_err_logh(tx_dma12_rng_err_logh[63:0]),
			       .tx_dma12_rng_err_logl(tx_dma12_rng_err_logl[63:0]),
			       .dmc_txc_dma12_page_handle(dmc_txc_dma12_page_handle[19:0]),
			       .tx_dma_cfg_dma12_mbaddr(tx_dma_cfg_dma12_mbaddr[37:0]),
			       .page0_mask_dma12(page0_mask_dma12[31:0]),
			       .page0_value_dma12(page0_value_dma12[31:0]),
			       .page0_reloc_dma12(page0_reloc_dma12[31:0]),
			       .page0_valid_dma12(page0_valid_dma12),
			       .page1_mask_dma12(page1_mask_dma12[31:0]),
			       .page1_value_dma12(page1_value_dma12[31:0]),
			       .page1_reloc_dma12(page1_reloc_dma12[31:0]),
			       .page1_valid_dma12(page1_valid_dma12),
			       .txc_dmc_dma13_mark_bit(txc_dmc_dma13_mark_bit),
			       .tx_cfg_dma13_mk(tx_cfg_dma13_mk),
			       .tx_cfg_dma13_mmk(tx_cfg_dma13_mmk),
			       .tx_cfg_dma13_enable_mb(tx_cfg_dma13_enable_mb),
			       .tx_cs_dma13(tx_cs_dma13[63:0]),
			       .tx_dma13_pre_st(tx_dma13_pre_st[63:0]),
			       .tx_rng_head_dma13(tx_rng_head_dma13[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma13(tx_rng_tail_dma13[`PTR_WIDTH :0]),
			       .tx_dma13_rng_err_logh(tx_dma13_rng_err_logh[63:0]),
			       .tx_dma13_rng_err_logl(tx_dma13_rng_err_logl[63:0]),
			       .dmc_txc_dma13_page_handle(dmc_txc_dma13_page_handle[19:0]),
			       .tx_dma_cfg_dma13_mbaddr(tx_dma_cfg_dma13_mbaddr[37:0]),
			       .page0_mask_dma13(page0_mask_dma13[31:0]),
			       .page0_value_dma13(page0_value_dma13[31:0]),
			       .page0_reloc_dma13(page0_reloc_dma13[31:0]),
			       .page0_valid_dma13(page0_valid_dma13),
			       .page1_mask_dma13(page1_mask_dma13[31:0]),
			       .page1_value_dma13(page1_value_dma13[31:0]),
			       .page1_reloc_dma13(page1_reloc_dma13[31:0]),
			       .page1_valid_dma13(page1_valid_dma13),
			       .txc_dmc_dma14_mark_bit(txc_dmc_dma14_mark_bit),
			       .tx_cfg_dma14_mk(tx_cfg_dma14_mk),
			       .tx_cfg_dma14_mmk(tx_cfg_dma14_mmk),
			       .tx_cfg_dma14_enable_mb(tx_cfg_dma14_enable_mb),
			       .tx_cs_dma14(tx_cs_dma14[63:0]),
			       .tx_dma14_pre_st(tx_dma14_pre_st[63:0]),
			       .tx_rng_head_dma14(tx_rng_head_dma14[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma14(tx_rng_tail_dma14[`PTR_WIDTH :0]),
			       .tx_dma14_rng_err_logh(tx_dma14_rng_err_logh[63:0]),
			       .tx_dma14_rng_err_logl(tx_dma14_rng_err_logl[63:0]),
			       .dmc_txc_dma14_page_handle(dmc_txc_dma14_page_handle[19:0]),
			       .tx_dma_cfg_dma14_mbaddr(tx_dma_cfg_dma14_mbaddr[37:0]),
			       .page0_mask_dma14(page0_mask_dma14[31:0]),
			       .page0_value_dma14(page0_value_dma14[31:0]),
			       .page0_reloc_dma14(page0_reloc_dma14[31:0]),
			       .page0_valid_dma14(page0_valid_dma14),
			       .page1_mask_dma14(page1_mask_dma14[31:0]),
			       .page1_value_dma14(page1_value_dma14[31:0]),
			       .page1_reloc_dma14(page1_reloc_dma14[31:0]),
			       .page1_valid_dma14(page1_valid_dma14),
			       .txc_dmc_dma15_mark_bit(txc_dmc_dma15_mark_bit),
			       .tx_cfg_dma15_mk(tx_cfg_dma15_mk),
			       .tx_cfg_dma15_mmk(tx_cfg_dma15_mmk),
			       .tx_cfg_dma15_enable_mb(tx_cfg_dma15_enable_mb),
			       .tx_cs_dma15(tx_cs_dma15[63:0]),
			       .tx_dma15_pre_st(tx_dma15_pre_st[63:0]),
			       .tx_rng_head_dma15(tx_rng_head_dma15[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma15(tx_rng_tail_dma15[`PTR_WIDTH :0]),
			       .tx_dma15_rng_err_logh(tx_dma15_rng_err_logh[63:0]),
			       .tx_dma15_rng_err_logl(tx_dma15_rng_err_logl[63:0]),
			       .dmc_txc_dma15_page_handle(dmc_txc_dma15_page_handle[19:0]),
			       .tx_dma_cfg_dma15_mbaddr(tx_dma_cfg_dma15_mbaddr[37:0]),
			       .page0_mask_dma15(page0_mask_dma15[31:0]),
			       .page0_value_dma15(page0_value_dma15[31:0]),
			       .page0_reloc_dma15(page0_reloc_dma15[31:0]),
			       .page0_valid_dma15(page0_valid_dma15),
			       .page1_mask_dma15(page1_mask_dma15[31:0]),
			       .page1_value_dma15(page1_value_dma15[31:0]),
			       .page1_reloc_dma15(page1_reloc_dma15[31:0]),
			       .page1_valid_dma15(page1_valid_dma15),
`ifdef NEPTUNE
			       .txc_dmc_dma16_mark_bit(txc_dmc_dma16_mark_bit),
			       .tx_cfg_dma16_mk(tx_cfg_dma16_mk),
			       .tx_cfg_dma16_mmk(tx_cfg_dma16_mmk),
			       .tx_cfg_dma16_enable_mb(tx_cfg_dma16_enable_mb),
			       .tx_cs_dma16(tx_cs_dma16[63:0]),
			       .tx_dma16_pre_st(tx_dma16_pre_st[63:0]),
			       .tx_rng_head_dma16(tx_rng_head_dma16[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma16(tx_rng_tail_dma16[`PTR_WIDTH :0]),
			       .tx_dma16_rng_err_logh(tx_dma16_rng_err_logh[63:0]),
			       .tx_dma16_rng_err_logl(tx_dma16_rng_err_logl[63:0]),
			       .dmc_txc_dma16_page_handle(dmc_txc_dma16_page_handle[19:0]),
			       .tx_dma_cfg_dma16_mbaddr(tx_dma_cfg_dma16_mbaddr[37:0]),
			       .page0_mask_dma16(page0_mask_dma16[31:0]),
			       .page0_value_dma16(page0_value_dma16[31:0]),
			       .page0_reloc_dma16(page0_reloc_dma16[31:0]),
			       .page0_valid_dma16(page0_valid_dma16),
			       .page1_mask_dma16(page1_mask_dma16[31:0]),
			       .page1_value_dma16(page1_value_dma16[31:0]),
			       .page1_reloc_dma16(page1_reloc_dma16[31:0]),
			       .page1_valid_dma16(page1_valid_dma16),
			       .txc_dmc_dma17_mark_bit(txc_dmc_dma17_mark_bit),
			       .tx_cfg_dma17_mk(tx_cfg_dma17_mk),
			       .tx_cfg_dma17_mmk(tx_cfg_dma17_mmk),
			       .tx_cfg_dma17_enable_mb(tx_cfg_dma17_enable_mb),
			       .tx_cs_dma17(tx_cs_dma17[63:0]),
			       .tx_dma17_pre_st(tx_dma17_pre_st[63:0]),
			       .tx_rng_head_dma17(tx_rng_head_dma17[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma17(tx_rng_tail_dma17[`PTR_WIDTH :0]),
			       .tx_dma17_rng_err_logh(tx_dma17_rng_err_logh[63:0]),
			       .tx_dma17_rng_err_logl(tx_dma17_rng_err_logl[63:0]),
			       .dmc_txc_dma17_page_handle(dmc_txc_dma17_page_handle[19:0]),
			       .tx_dma_cfg_dma17_mbaddr(tx_dma_cfg_dma17_mbaddr[37:0]),
			       .page0_mask_dma17(page0_mask_dma17[31:0]),
			       .page0_value_dma17(page0_value_dma17[31:0]),
			       .page0_reloc_dma17(page0_reloc_dma17[31:0]),
			       .page0_valid_dma17(page0_valid_dma17),
			       .page1_mask_dma17(page1_mask_dma17[31:0]),
			       .page1_value_dma17(page1_value_dma17[31:0]),
			       .page1_reloc_dma17(page1_reloc_dma17[31:0]),
			       .page1_valid_dma17(page1_valid_dma17),
			       .txc_dmc_dma18_mark_bit(txc_dmc_dma18_mark_bit),
			       .tx_cfg_dma18_mk(tx_cfg_dma18_mk),
			       .tx_cfg_dma18_mmk(tx_cfg_dma18_mmk),
			       .tx_cfg_dma18_enable_mb(tx_cfg_dma18_enable_mb),
			       .tx_cs_dma18(tx_cs_dma18[63:0]),
			       .tx_dma18_pre_st(tx_dma18_pre_st[63:0]),
			       .tx_rng_head_dma18(tx_rng_head_dma18[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma18(tx_rng_tail_dma18[`PTR_WIDTH :0]),
			       .tx_dma18_rng_err_logh(tx_dma18_rng_err_logh[63:0]),
			       .tx_dma18_rng_err_logl(tx_dma18_rng_err_logl[63:0]),
			       .dmc_txc_dma18_page_handle(dmc_txc_dma18_page_handle[19:0]),
			       .tx_dma_cfg_dma18_mbaddr(tx_dma_cfg_dma18_mbaddr[37:0]),
			       .page0_mask_dma18(page0_mask_dma18[31:0]),
			       .page0_value_dma18(page0_value_dma18[31:0]),
			       .page0_reloc_dma18(page0_reloc_dma18[31:0]),
			       .page0_valid_dma18(page0_valid_dma18),
			       .page1_mask_dma18(page1_mask_dma18[31:0]),
			       .page1_value_dma18(page1_value_dma18[31:0]),
			       .page1_reloc_dma18(page1_reloc_dma18[31:0]),
			       .page1_valid_dma18(page1_valid_dma18),
			       .txc_dmc_dma19_mark_bit(txc_dmc_dma19_mark_bit),
			       .tx_cfg_dma19_mk(tx_cfg_dma19_mk),
			       .tx_cfg_dma19_mmk(tx_cfg_dma19_mmk),
			       .tx_cfg_dma19_enable_mb(tx_cfg_dma19_enable_mb),
			       .tx_cs_dma19(tx_cs_dma19[63:0]),
			       .tx_dma19_pre_st(tx_dma19_pre_st[63:0]),
			       .tx_rng_head_dma19(tx_rng_head_dma19[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma19(tx_rng_tail_dma19[`PTR_WIDTH :0]),
			       .tx_dma19_rng_err_logh(tx_dma19_rng_err_logh[63:0]),
			       .tx_dma19_rng_err_logl(tx_dma19_rng_err_logl[63:0]),
			       .dmc_txc_dma19_page_handle(dmc_txc_dma19_page_handle[19:0]),
			       .tx_dma_cfg_dma19_mbaddr(tx_dma_cfg_dma19_mbaddr[37:0]),
			       .page0_mask_dma19(page0_mask_dma19[31:0]),
			       .page0_value_dma19(page0_value_dma19[31:0]),
			       .page0_reloc_dma19(page0_reloc_dma19[31:0]),
			       .page0_valid_dma19(page0_valid_dma19),
			       .page1_mask_dma19(page1_mask_dma19[31:0]),
			       .page1_value_dma19(page1_value_dma19[31:0]),
			       .page1_reloc_dma19(page1_reloc_dma19[31:0]),
			       .page1_valid_dma19(page1_valid_dma19),
			       .txc_dmc_dma20_mark_bit(txc_dmc_dma20_mark_bit),
			       .tx_cfg_dma20_mk(tx_cfg_dma20_mk),
			       .tx_cfg_dma20_mmk(tx_cfg_dma20_mmk),
			       .tx_cfg_dma20_enable_mb(tx_cfg_dma20_enable_mb),
			       .tx_cs_dma20(tx_cs_dma20[63:0]),
			       .tx_dma20_pre_st(tx_dma20_pre_st[63:0]),
			       .tx_rng_head_dma20(tx_rng_head_dma20[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma20(tx_rng_tail_dma20[`PTR_WIDTH :0]),
			       .tx_dma20_rng_err_logh(tx_dma20_rng_err_logh[63:0]),
			       .tx_dma20_rng_err_logl(tx_dma20_rng_err_logl[63:0]),
			       .dmc_txc_dma20_page_handle(dmc_txc_dma20_page_handle[19:0]),
			       .tx_dma_cfg_dma20_mbaddr(tx_dma_cfg_dma20_mbaddr[37:0]),
			       .page0_mask_dma20(page0_mask_dma20[31:0]),
			       .page0_value_dma20(page0_value_dma20[31:0]),
			       .page0_reloc_dma20(page0_reloc_dma20[31:0]),
			       .page0_valid_dma20(page0_valid_dma20),
			       .page1_mask_dma20(page1_mask_dma20[31:0]),
			       .page1_value_dma20(page1_value_dma20[31:0]),
			       .page1_reloc_dma20(page1_reloc_dma20[31:0]),
			       .page1_valid_dma20(page1_valid_dma20),
			       .txc_dmc_dma21_mark_bit(txc_dmc_dma21_mark_bit),
			       .tx_cfg_dma21_mk(tx_cfg_dma21_mk),
			       .tx_cfg_dma21_mmk(tx_cfg_dma21_mmk),
			       .tx_cfg_dma21_enable_mb(tx_cfg_dma21_enable_mb),
			       .tx_cs_dma21(tx_cs_dma21[63:0]),
			       .tx_dma21_pre_st(tx_dma21_pre_st[63:0]),
			       .tx_rng_head_dma21(tx_rng_head_dma21[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma21(tx_rng_tail_dma21[`PTR_WIDTH :0]),
			       .tx_dma21_rng_err_logh(tx_dma21_rng_err_logh[63:0]),
			       .tx_dma21_rng_err_logl(tx_dma21_rng_err_logl[63:0]),
			       .dmc_txc_dma21_page_handle(dmc_txc_dma21_page_handle[19:0]),
			       .tx_dma_cfg_dma21_mbaddr(tx_dma_cfg_dma21_mbaddr[37:0]),
			       .page0_mask_dma21(page0_mask_dma21[31:0]),
			       .page0_value_dma21(page0_value_dma21[31:0]),
			       .page0_reloc_dma21(page0_reloc_dma21[31:0]),
			       .page0_valid_dma21(page0_valid_dma21),
			       .page1_mask_dma21(page1_mask_dma21[31:0]),
			       .page1_value_dma21(page1_value_dma21[31:0]),
			       .page1_reloc_dma21(page1_reloc_dma21[31:0]),
			       .page1_valid_dma21(page1_valid_dma21),
			       .txc_dmc_dma22_mark_bit(txc_dmc_dma22_mark_bit),
			       .tx_cfg_dma22_mk(tx_cfg_dma22_mk),
			       .tx_cfg_dma22_mmk(tx_cfg_dma22_mmk),
			       .tx_cfg_dma22_enable_mb(tx_cfg_dma22_enable_mb),
			       .tx_cs_dma22(tx_cs_dma22[63:0]),
			       .tx_dma22_pre_st(tx_dma22_pre_st[63:0]),
			       .tx_rng_head_dma22(tx_rng_head_dma22[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma22(tx_rng_tail_dma22[`PTR_WIDTH :0]),
			       .tx_dma22_rng_err_logh(tx_dma22_rng_err_logh[63:0]),
			       .tx_dma22_rng_err_logl(tx_dma22_rng_err_logl[63:0]),
			       .dmc_txc_dma22_page_handle(dmc_txc_dma22_page_handle[19:0]),
			       .tx_dma_cfg_dma22_mbaddr(tx_dma_cfg_dma22_mbaddr[37:0]),
			       .page0_mask_dma22(page0_mask_dma22[31:0]),
			       .page0_value_dma22(page0_value_dma22[31:0]),
			       .page0_reloc_dma22(page0_reloc_dma22[31:0]),
			       .page0_valid_dma22(page0_valid_dma22),
			       .page1_mask_dma22(page1_mask_dma22[31:0]),
			       .page1_value_dma22(page1_value_dma22[31:0]),
			       .page1_reloc_dma22(page1_reloc_dma22[31:0]),
			       .page1_valid_dma22(page1_valid_dma22),
			       .txc_dmc_dma23_mark_bit(txc_dmc_dma23_mark_bit),
			       .tx_cfg_dma23_mk(tx_cfg_dma23_mk),
			       .tx_cfg_dma23_mmk(tx_cfg_dma23_mmk),
			       .tx_cfg_dma23_enable_mb(tx_cfg_dma23_enable_mb),
			       .tx_cs_dma23(tx_cs_dma23[63:0]),
			       .tx_dma23_pre_st(tx_dma23_pre_st[63:0]),
			       .tx_rng_head_dma23(tx_rng_head_dma23[`PTR_WIDTH :0]),
			       .tx_rng_tail_dma23(tx_rng_tail_dma23[`PTR_WIDTH :0]),
			       .tx_dma23_rng_err_logh(tx_dma23_rng_err_logh[63:0]),
			       .tx_dma23_rng_err_logl(tx_dma23_rng_err_logl[63:0]),
			       .dmc_txc_dma23_page_handle(dmc_txc_dma23_page_handle[19:0]),
			       .tx_dma_cfg_dma23_mbaddr(tx_dma_cfg_dma23_mbaddr[37:0]),
			       .page0_mask_dma23(page0_mask_dma23[31:0]),
			       .page0_value_dma23(page0_value_dma23[31:0]),
			       .page0_reloc_dma23(page0_reloc_dma23[31:0]),
			       .page0_valid_dma23(page0_valid_dma23),
			       .page1_mask_dma23(page1_mask_dma23[31:0]),
			       .page1_value_dma23(page1_value_dma23[31:0]),
			       .page1_reloc_dma23(page1_reloc_dma23[31:0]),
			       .page1_valid_dma23(page1_valid_dma23),
`endif // !ifdef CHANNELS_16
			       
			       .dmc_txc_dma0_func_num(dmc_txc_dma0_func_num[1:0]),
			       .dmc_txc_dma1_func_num(dmc_txc_dma1_func_num[1:0]),
			       .dmc_txc_dma2_func_num(dmc_txc_dma2_func_num[1:0]),
			       .dmc_txc_dma3_func_num(dmc_txc_dma3_func_num[1:0]),
			       .dmc_txc_dma4_func_num(dmc_txc_dma4_func_num[1:0]),
			       .dmc_txc_dma5_func_num(dmc_txc_dma5_func_num[1:0]),
			       .dmc_txc_dma6_func_num(dmc_txc_dma6_func_num[1:0]),
			       .dmc_txc_dma7_func_num(dmc_txc_dma7_func_num[1:0]),
			       .dmc_txc_dma8_func_num(dmc_txc_dma8_func_num[1:0]),
			       .dmc_txc_dma9_func_num(dmc_txc_dma9_func_num[1:0]),
			       .dmc_txc_dma10_func_num(dmc_txc_dma10_func_num[1:0]),
			       .dmc_txc_dma11_func_num(dmc_txc_dma11_func_num[1:0]),
			       .dmc_txc_dma12_func_num(dmc_txc_dma12_func_num[1:0]),
			       .dmc_txc_dma13_func_num(dmc_txc_dma13_func_num[1:0]),
			       .dmc_txc_dma14_func_num(dmc_txc_dma14_func_num[1:0]),
`ifdef NEPTUNE
			       
			       .dmc_txc_dma15_func_num(dmc_txc_dma15_func_num[1:0]),
			       .dmc_txc_dma16_func_num(dmc_txc_dma16_func_num[1:0]),
			       .dmc_txc_dma17_func_num(dmc_txc_dma17_func_num[1:0]),
			       .dmc_txc_dma18_func_num(dmc_txc_dma18_func_num[1:0]),
			       .dmc_txc_dma19_func_num(dmc_txc_dma19_func_num[1:0]),
			       .dmc_txc_dma20_func_num(dmc_txc_dma20_func_num[1:0]),
			       .dmc_txc_dma21_func_num(dmc_txc_dma21_func_num[1:0]),
			       .dmc_txc_dma22_func_num(dmc_txc_dma22_func_num[1:0]),
			       .dmc_txc_dma23_func_num(dmc_txc_dma23_func_num[1:0])
`else // !ifdef NEPTUNE
			       .dmc_txc_dma15_func_num(dmc_txc_dma15_func_num[1:0])			       
`endif
			       );
   

   


// SPARE GATES FOR NEPTUNE - LSI





`ifdef NEPTUNE


  niu_tdmc_spare niu_tdmc_spare_0 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_1 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_2 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_3 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_4 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_5 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_6 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_7 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_8 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_9 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_10 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_11 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_12 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_13 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_14 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_15 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_16 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_17 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_18 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_19 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_20 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_21 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_22 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_23 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_24 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_25 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_26 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_27 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_28 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_29 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_30 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );


  niu_tdmc_spare niu_tdmc_spare_31 (
                             .rst        (Reset_L),
                             .clk        (niu_clk)
                            );

`else
`endif


endmodule // niu_tdmc

// Local Variables:
// verilog-library-directories:(".")
// End:
