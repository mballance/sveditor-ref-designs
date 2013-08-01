// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_tdmc_sendmbox.v
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
 *  NIU TDMC - Mailbox Write Interface to Meta 
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

`include "txc_defines.h"
`include "niu_dmc_reg_defines.h"

module niu_tdmc_sendmbox (/*AUTOJUNK*/
   // Outputs
   mbox_dma0_scheduled, done_mbox_dma0, mbox_ack_dma0_received, 
   mbox_dma1_scheduled, done_mbox_dma1, mbox_ack_dma1_received, 
   mbox_dma2_scheduled, done_mbox_dma2, mbox_ack_dma2_received, 
   mbox_dma3_scheduled, done_mbox_dma3, mbox_ack_dma3_received, 
   mbox_dma4_scheduled, done_mbox_dma4, mbox_ack_dma4_received, 
   mbox_dma5_scheduled, done_mbox_dma5, mbox_ack_dma5_received, 
   mbox_dma6_scheduled, done_mbox_dma6, mbox_ack_dma6_received, 
   mbox_dma7_scheduled, done_mbox_dma7, mbox_ack_dma7_received, 
   mbox_dma8_scheduled, done_mbox_dma8, mbox_ack_dma8_received, 
   mbox_dma9_scheduled, done_mbox_dma9, mbox_ack_dma9_received, 
   mbox_dma10_scheduled, done_mbox_dma10, mbox_ack_dma10_received, 
   mbox_dma11_scheduled, done_mbox_dma11, mbox_ack_dma11_received, 
   mbox_dma12_scheduled, done_mbox_dma12, mbox_ack_dma12_received, 
   mbox_dma13_scheduled, done_mbox_dma13, mbox_ack_dma13_received, 
   mbox_dma14_scheduled, done_mbox_dma14, mbox_ack_dma14_received, 
   mbox_dma15_scheduled, done_mbox_dma15, mbox_ack_dma15_received, 
`ifdef NEPTUNE
   mbox_dma16_scheduled, done_mbox_dma16, mbox_ack_dma16_received, 
   mbox_dma17_scheduled, done_mbox_dma17, mbox_ack_dma17_received, 
   mbox_dma18_scheduled, done_mbox_dma18, mbox_ack_dma18_received, 
   mbox_dma19_scheduled, done_mbox_dma19, mbox_ack_dma19_received, 
   mbox_dma20_scheduled, done_mbox_dma20, mbox_ack_dma20_received, 
   mbox_dma21_scheduled, done_mbox_dma21, mbox_ack_dma21_received, 
   mbox_dma22_scheduled, done_mbox_dma22, mbox_ack_dma22_received, 
   mbox_dma23_scheduled, done_mbox_dma23, mbox_ack_dma23_received, 
`else
`endif
   set_mbox_part_error_dma, mbox_ack_dma_err_received, 
   mbox_err_received, meta_data_req, tdmc_arb0_data, 
   tdmc_arb0_data_valid, tdmc_arb0_req, tdmc_arb0_req_address, 
   tdmc_arb0_req_byteenable, tdmc_arb0_req_cmd, 
   tdmc_arb0_req_dma_num, tdmc_arb0_req_length, 
   tdmc_arb0_req_port_num, tdmc_arb0_status, 
   tdmc_arb0_transfer_complete, tdmc_arb0_req_func_num, 
   dmc_meta_ack_accept, mbox_debug_state, 
   // Inputs
   SysClk, Reset_L, send_mbox_dma0, mbox_dma0_data_valid, 
   mbox_dma0_data_done, mbox_dma0_data, dmc_txc_dma0_page_handle, 
   tx_dma_cfg_dma0_mbaddr, page0_mask_dma0, page0_value_dma0, 
   page0_reloc_dma0, page0_valid_dma0, page1_mask_dma0, 
   page1_value_dma0, page1_reloc_dma0, page1_valid_dma0, 
   send_mbox_dma1, mbox_dma1_data_valid, mbox_dma1_data_done, 
   mbox_dma1_data, dmc_txc_dma1_page_handle, tx_dma_cfg_dma1_mbaddr, 
   page0_mask_dma1, page0_value_dma1, page0_reloc_dma1, 
   page0_valid_dma1, page1_mask_dma1, page1_value_dma1, 
   page1_reloc_dma1, page1_valid_dma1, send_mbox_dma2, 
   mbox_dma2_data_valid, mbox_dma2_data_done, mbox_dma2_data, 
   dmc_txc_dma2_page_handle, tx_dma_cfg_dma2_mbaddr, page0_mask_dma2, 
   page0_value_dma2, page0_reloc_dma2, page0_valid_dma2, 
   page1_mask_dma2, page1_value_dma2, page1_reloc_dma2, 
   page1_valid_dma2, send_mbox_dma3, mbox_dma3_data_valid, 
   mbox_dma3_data_done, mbox_dma3_data, dmc_txc_dma3_page_handle, 
   tx_dma_cfg_dma3_mbaddr, page0_mask_dma3, page0_value_dma3, 
   page0_reloc_dma3, page0_valid_dma3, page1_mask_dma3, 
   page1_value_dma3, page1_reloc_dma3, page1_valid_dma3, 
   send_mbox_dma4, mbox_dma4_data_valid, mbox_dma4_data_done, 
   mbox_dma4_data, dmc_txc_dma4_page_handle, tx_dma_cfg_dma4_mbaddr, 
   page0_mask_dma4, page0_value_dma4, page0_reloc_dma4, 
   page0_valid_dma4, page1_mask_dma4, page1_value_dma4, 
   page1_reloc_dma4, page1_valid_dma4, send_mbox_dma5, 
   mbox_dma5_data_valid, mbox_dma5_data_done, mbox_dma5_data, 
   dmc_txc_dma5_page_handle, tx_dma_cfg_dma5_mbaddr, page0_mask_dma5, 
   page0_value_dma5, page0_reloc_dma5, page0_valid_dma5, 
   page1_mask_dma5, page1_value_dma5, page1_reloc_dma5, 
   page1_valid_dma5, send_mbox_dma6, mbox_dma6_data_valid, 
   mbox_dma6_data_done, mbox_dma6_data, dmc_txc_dma6_page_handle, 
   tx_dma_cfg_dma6_mbaddr, page0_mask_dma6, page0_value_dma6, 
   page0_reloc_dma6, page0_valid_dma6, page1_mask_dma6, 
   page1_value_dma6, page1_reloc_dma6, page1_valid_dma6, 
   send_mbox_dma7, mbox_dma7_data_valid, mbox_dma7_data_done, 
   mbox_dma7_data, dmc_txc_dma7_page_handle, tx_dma_cfg_dma7_mbaddr, 
   page0_mask_dma7, page0_value_dma7, page0_reloc_dma7, 
   page0_valid_dma7, page1_mask_dma7, page1_value_dma7, 
   page1_reloc_dma7, page1_valid_dma7, send_mbox_dma8, 
   mbox_dma8_data_valid, mbox_dma8_data_done, mbox_dma8_data, 
   dmc_txc_dma8_page_handle, tx_dma_cfg_dma8_mbaddr, page0_mask_dma8, 
   page0_value_dma8, page0_reloc_dma8, page0_valid_dma8, 
   page1_mask_dma8, page1_value_dma8, page1_reloc_dma8, 
   page1_valid_dma8, send_mbox_dma9, mbox_dma9_data_valid, 
   mbox_dma9_data_done, mbox_dma9_data, dmc_txc_dma9_page_handle, 
   tx_dma_cfg_dma9_mbaddr, page0_mask_dma9, page0_value_dma9, 
   page0_reloc_dma9, page0_valid_dma9, page1_mask_dma9, 
   page1_value_dma9, page1_reloc_dma9, page1_valid_dma9, 
   send_mbox_dma10, mbox_dma10_data_valid, mbox_dma10_data_done, 
   mbox_dma10_data, dmc_txc_dma10_page_handle, 
   tx_dma_cfg_dma10_mbaddr, page0_mask_dma10, page0_value_dma10, 
   page0_reloc_dma10, page0_valid_dma10, page1_mask_dma10, 
   page1_value_dma10, page1_reloc_dma10, page1_valid_dma10, 
   send_mbox_dma11, mbox_dma11_data_valid, mbox_dma11_data_done, 
   mbox_dma11_data, dmc_txc_dma11_page_handle, 
   tx_dma_cfg_dma11_mbaddr, page0_mask_dma11, page0_value_dma11, 
   page0_reloc_dma11, page0_valid_dma11, page1_mask_dma11, 
   page1_value_dma11, page1_reloc_dma11, page1_valid_dma11, 
   send_mbox_dma12, mbox_dma12_data_valid, mbox_dma12_data_done, 
   mbox_dma12_data, dmc_txc_dma12_page_handle, 
   tx_dma_cfg_dma12_mbaddr, page0_mask_dma12, page0_value_dma12, 
   page0_reloc_dma12, page0_valid_dma12, page1_mask_dma12, 
   page1_value_dma12, page1_reloc_dma12, page1_valid_dma12, 
   send_mbox_dma13, mbox_dma13_data_valid, mbox_dma13_data_done, 
   mbox_dma13_data, dmc_txc_dma13_page_handle, 
   tx_dma_cfg_dma13_mbaddr, page0_mask_dma13, page0_value_dma13, 
   page0_reloc_dma13, page0_valid_dma13, page1_mask_dma13, 
   page1_value_dma13, page1_reloc_dma13, page1_valid_dma13, 
   send_mbox_dma14, mbox_dma14_data_valid, mbox_dma14_data_done, 
   mbox_dma14_data, dmc_txc_dma14_page_handle, 
   tx_dma_cfg_dma14_mbaddr, page0_mask_dma14, page0_value_dma14, 
   page0_reloc_dma14, page0_valid_dma14, page1_mask_dma14, 
   page1_value_dma14, page1_reloc_dma14, page1_valid_dma14, 
   send_mbox_dma15, mbox_dma15_data_valid, mbox_dma15_data_done, 
   mbox_dma15_data, dmc_txc_dma15_page_handle, 
   tx_dma_cfg_dma15_mbaddr, page0_mask_dma15, page0_value_dma15, 
   page0_reloc_dma15, page0_valid_dma15, page1_mask_dma15, 
   page1_value_dma15, page1_reloc_dma15, page1_valid_dma15, 
`ifdef NEPTUNE
   send_mbox_dma16, mbox_dma16_data_valid, mbox_dma16_data_done, 
   mbox_dma16_data, dmc_txc_dma16_page_handle, 
   tx_dma_cfg_dma16_mbaddr, page0_mask_dma16, page0_value_dma16, 
   page0_reloc_dma16, page0_valid_dma16, page1_mask_dma16, 
   page1_value_dma16, page1_reloc_dma16, page1_valid_dma16, 
   send_mbox_dma17, mbox_dma17_data_valid, mbox_dma17_data_done, 
   mbox_dma17_data, dmc_txc_dma17_page_handle, 
   tx_dma_cfg_dma17_mbaddr, page0_mask_dma17, page0_value_dma17, 
   page0_reloc_dma17, page0_valid_dma17, page1_mask_dma17, 
   page1_value_dma17, page1_reloc_dma17, page1_valid_dma17, 
   send_mbox_dma18, mbox_dma18_data_valid, mbox_dma18_data_done, 
   mbox_dma18_data, dmc_txc_dma18_page_handle, 
   tx_dma_cfg_dma18_mbaddr, page0_mask_dma18, page0_value_dma18, 
   page0_reloc_dma18, page0_valid_dma18, page1_mask_dma18, 
   page1_value_dma18, page1_reloc_dma18, page1_valid_dma18, 
   send_mbox_dma19, mbox_dma19_data_valid, mbox_dma19_data_done, 
   mbox_dma19_data, dmc_txc_dma19_page_handle, 
   tx_dma_cfg_dma19_mbaddr, page0_mask_dma19, page0_value_dma19, 
   page0_reloc_dma19, page0_valid_dma19, page1_mask_dma19, 
   page1_value_dma19, page1_reloc_dma19, page1_valid_dma19, 
   send_mbox_dma20, mbox_dma20_data_valid, mbox_dma20_data_done, 
   mbox_dma20_data, dmc_txc_dma20_page_handle, 
   tx_dma_cfg_dma20_mbaddr, page0_mask_dma20, page0_value_dma20, 
   page0_reloc_dma20, page0_valid_dma20, page1_mask_dma20, 
   page1_value_dma20, page1_reloc_dma20, page1_valid_dma20, 
   send_mbox_dma21, mbox_dma21_data_valid, mbox_dma21_data_done, 
   mbox_dma21_data, dmc_txc_dma21_page_handle, 
   tx_dma_cfg_dma21_mbaddr, page0_mask_dma21, page0_value_dma21, 
   page0_reloc_dma21, page0_valid_dma21, page1_mask_dma21, 
   page1_value_dma21, page1_reloc_dma21, page1_valid_dma21, 
   send_mbox_dma22, mbox_dma22_data_valid, mbox_dma22_data_done, 
   mbox_dma22_data, dmc_txc_dma22_page_handle, 
   tx_dma_cfg_dma22_mbaddr, page0_mask_dma22, page0_value_dma22, 
   page0_reloc_dma22, page0_valid_dma22, page1_mask_dma22, 
   page1_value_dma22, page1_reloc_dma22, page1_valid_dma22, 
   send_mbox_dma23, mbox_dma23_data_valid, mbox_dma23_data_done, 
   mbox_dma23_data, dmc_txc_dma23_page_handle, 
   tx_dma_cfg_dma23_mbaddr, page0_mask_dma23, page0_value_dma23, 
   page0_reloc_dma23, page0_valid_dma23, page1_mask_dma23, 
   page1_value_dma23, page1_reloc_dma23, page1_valid_dma23, 
`else
`endif
   dmc_txc_dma0_func_num, dmc_txc_dma1_func_num, 
   dmc_txc_dma2_func_num, dmc_txc_dma3_func_num, 
   dmc_txc_dma4_func_num, dmc_txc_dma5_func_num, 
   dmc_txc_dma6_func_num, dmc_txc_dma7_func_num, 
   dmc_txc_dma8_func_num, dmc_txc_dma9_func_num, 
   dmc_txc_dma10_func_num, dmc_txc_dma11_func_num, 
   dmc_txc_dma12_func_num, dmc_txc_dma13_func_num, 
   dmc_txc_dma14_func_num, dmc_txc_dma15_func_num, 
`ifdef NEPTUNE
   dmc_txc_dma16_func_num, dmc_txc_dma17_func_num, 
   dmc_txc_dma18_func_num, dmc_txc_dma19_func_num, 
   dmc_txc_dma20_func_num, dmc_txc_dma21_func_num, 
   dmc_txc_dma22_func_num, dmc_txc_dma23_func_num, 
`else
`endif
   arb0_tdmc_data_req, arb0_tdmc_req_accept, meta_dmc_ack_dma_num, 
   meta_dmc_ack_client, meta_dmc_ack_complete, meta_dmc_ack_ready, 
   meta_dmc_ack_cmd, meta_dmc_ack_cmd_status
   ) ;

   input 	 SysClk;
   input 	 Reset_L;

    input 	 send_mbox_dma0;
   input 	 mbox_dma0_data_valid;
   input 	 mbox_dma0_data_done;
   input [127:0] mbox_dma0_data;
   input [19:0] dmc_txc_dma0_page_handle;
   input [37:0] tx_dma_cfg_dma0_mbaddr;
 // page table information
   input [31:0] page0_mask_dma0;
   input [31:0] page0_value_dma0;
   input [31:0] page0_reloc_dma0;
   input 	page0_valid_dma0;
   input [31:0] page1_mask_dma0;
   input [31:0] page1_value_dma0;
   input [31:0] page1_reloc_dma0;
   input 	page1_valid_dma0 ;

   output        mbox_dma0_scheduled;
   output 	 done_mbox_dma0;
   output 	 mbox_ack_dma0_received;

   input 	 send_mbox_dma1;
   input 	 mbox_dma1_data_valid;
   input 	 mbox_dma1_data_done;
   input [127:0] mbox_dma1_data;
   input [19:0] dmc_txc_dma1_page_handle;
   input [37:0] tx_dma_cfg_dma1_mbaddr;
 // page table information
   input [31:0] page0_mask_dma1;
   input [31:0] page0_value_dma1;
   input [31:0] page0_reloc_dma1;
   input 	page0_valid_dma1;
   input [31:0] page1_mask_dma1;
   input [31:0] page1_value_dma1;
   input [31:0] page1_reloc_dma1;
   input 	page1_valid_dma1 ;

   output        mbox_dma1_scheduled;
   output 	 done_mbox_dma1;
   output 	 mbox_ack_dma1_received;

   input 	 send_mbox_dma2;
   input 	 mbox_dma2_data_valid;
   input 	 mbox_dma2_data_done;
   input [127:0] mbox_dma2_data;
   input [19:0] dmc_txc_dma2_page_handle;
   input [37:0] tx_dma_cfg_dma2_mbaddr;
 // page table information
   input [31:0] page0_mask_dma2;
   input [31:0] page0_value_dma2;
   input [31:0] page0_reloc_dma2;
   input 	page0_valid_dma2;
   input [31:0] page1_mask_dma2;
   input [31:0] page1_value_dma2;
   input [31:0] page1_reloc_dma2;
   input 	page1_valid_dma2 ;

   output        mbox_dma2_scheduled;
   output 	 done_mbox_dma2;
   output 	 mbox_ack_dma2_received;

   input 	 send_mbox_dma3;
   input 	 mbox_dma3_data_valid;
   input 	 mbox_dma3_data_done;
   input [127:0] mbox_dma3_data;
   input [19:0] dmc_txc_dma3_page_handle;
   input [37:0] tx_dma_cfg_dma3_mbaddr;
 // page table information
   input [31:0] page0_mask_dma3;
   input [31:0] page0_value_dma3;
   input [31:0] page0_reloc_dma3;
   input 	page0_valid_dma3;
   input [31:0] page1_mask_dma3;
   input [31:0] page1_value_dma3;
   input [31:0] page1_reloc_dma3;
   input 	page1_valid_dma3 ;

   output        mbox_dma3_scheduled;
   output 	 done_mbox_dma3;
   output 	 mbox_ack_dma3_received;

   input 	 send_mbox_dma4;
   input 	 mbox_dma4_data_valid;
   input 	 mbox_dma4_data_done;
   input [127:0] mbox_dma4_data;
   input [19:0] dmc_txc_dma4_page_handle;
   input [37:0] tx_dma_cfg_dma4_mbaddr;
 // page table information
   input [31:0] page0_mask_dma4;
   input [31:0] page0_value_dma4;
   input [31:0] page0_reloc_dma4;
   input 	page0_valid_dma4;
   input [31:0] page1_mask_dma4;
   input [31:0] page1_value_dma4;
   input [31:0] page1_reloc_dma4;
   input 	page1_valid_dma4 ;

   output        mbox_dma4_scheduled;
   output 	 done_mbox_dma4;
   output 	 mbox_ack_dma4_received;

   input 	 send_mbox_dma5;
   input 	 mbox_dma5_data_valid;
   input 	 mbox_dma5_data_done;
   input [127:0] mbox_dma5_data;
   input [19:0] dmc_txc_dma5_page_handle;
   input [37:0] tx_dma_cfg_dma5_mbaddr;
 // page table information
   input [31:0] page0_mask_dma5;
   input [31:0] page0_value_dma5;
   input [31:0] page0_reloc_dma5;
   input 	page0_valid_dma5;
   input [31:0] page1_mask_dma5;
   input [31:0] page1_value_dma5;
   input [31:0] page1_reloc_dma5;
   input 	page1_valid_dma5 ;

   output        mbox_dma5_scheduled;
   output 	 done_mbox_dma5;
   output 	 mbox_ack_dma5_received;

   input 	 send_mbox_dma6;
   input 	 mbox_dma6_data_valid;
   input 	 mbox_dma6_data_done;
   input [127:0] mbox_dma6_data;
   input [19:0] dmc_txc_dma6_page_handle;
   input [37:0] tx_dma_cfg_dma6_mbaddr;
 // page table information
   input [31:0] page0_mask_dma6;
   input [31:0] page0_value_dma6;
   input [31:0] page0_reloc_dma6;
   input 	page0_valid_dma6;
   input [31:0] page1_mask_dma6;
   input [31:0] page1_value_dma6;
   input [31:0] page1_reloc_dma6;
   input 	page1_valid_dma6 ;

   output        mbox_dma6_scheduled;
   output 	 done_mbox_dma6;
   output 	 mbox_ack_dma6_received;

   input 	 send_mbox_dma7;
   input 	 mbox_dma7_data_valid;
   input 	 mbox_dma7_data_done;
   input [127:0] mbox_dma7_data;
   input [19:0] dmc_txc_dma7_page_handle;
   input [37:0] tx_dma_cfg_dma7_mbaddr;
 // page table information
   input [31:0] page0_mask_dma7;
   input [31:0] page0_value_dma7;
   input [31:0] page0_reloc_dma7;
   input 	page0_valid_dma7;
   input [31:0] page1_mask_dma7;
   input [31:0] page1_value_dma7;
   input [31:0] page1_reloc_dma7;
   input 	page1_valid_dma7 ;

   output        mbox_dma7_scheduled;
   output 	 done_mbox_dma7;
   output 	 mbox_ack_dma7_received;

   input 	 send_mbox_dma8;
   input 	 mbox_dma8_data_valid;
   input 	 mbox_dma8_data_done;
   input [127:0] mbox_dma8_data;
   input [19:0] dmc_txc_dma8_page_handle;
   input [37:0] tx_dma_cfg_dma8_mbaddr;
 // page table information
   input [31:0] page0_mask_dma8;
   input [31:0] page0_value_dma8;
   input [31:0] page0_reloc_dma8;
   input 	page0_valid_dma8;
   input [31:0] page1_mask_dma8;
   input [31:0] page1_value_dma8;
   input [31:0] page1_reloc_dma8;
   input 	page1_valid_dma8 ;

   output        mbox_dma8_scheduled;
   output 	 done_mbox_dma8;
   output 	 mbox_ack_dma8_received;

   input 	 send_mbox_dma9;
   input 	 mbox_dma9_data_valid;
   input 	 mbox_dma9_data_done;
   input [127:0] mbox_dma9_data;
   input [19:0] dmc_txc_dma9_page_handle;
   input [37:0] tx_dma_cfg_dma9_mbaddr;
 // page table information
   input [31:0] page0_mask_dma9;
   input [31:0] page0_value_dma9;
   input [31:0] page0_reloc_dma9;
   input 	page0_valid_dma9;
   input [31:0] page1_mask_dma9;
   input [31:0] page1_value_dma9;
   input [31:0] page1_reloc_dma9;
   input 	page1_valid_dma9 ;

   output        mbox_dma9_scheduled;
   output 	 done_mbox_dma9;
   output 	 mbox_ack_dma9_received;

   input 	 send_mbox_dma10;
   input 	 mbox_dma10_data_valid;
   input 	 mbox_dma10_data_done;
   input [127:0] mbox_dma10_data;
   input [19:0] dmc_txc_dma10_page_handle;
   input [37:0] tx_dma_cfg_dma10_mbaddr;
 // page table information
   input [31:0] page0_mask_dma10;
   input [31:0] page0_value_dma10;
   input [31:0] page0_reloc_dma10;
   input 	page0_valid_dma10;
   input [31:0] page1_mask_dma10;
   input [31:0] page1_value_dma10;
   input [31:0] page1_reloc_dma10;
   input 	page1_valid_dma10 ;

   output        mbox_dma10_scheduled;
   output 	 done_mbox_dma10;
   output 	 mbox_ack_dma10_received;

   input 	 send_mbox_dma11;
   input 	 mbox_dma11_data_valid;
   input 	 mbox_dma11_data_done;
   input [127:0] mbox_dma11_data;
   input [19:0] dmc_txc_dma11_page_handle;
   input [37:0] tx_dma_cfg_dma11_mbaddr;
 // page table information
   input [31:0] page0_mask_dma11;
   input [31:0] page0_value_dma11;
   input [31:0] page0_reloc_dma11;
   input 	page0_valid_dma11;
   input [31:0] page1_mask_dma11;
   input [31:0] page1_value_dma11;
   input [31:0] page1_reloc_dma11;
   input 	page1_valid_dma11 ;

   output        mbox_dma11_scheduled;
   output 	 done_mbox_dma11;
   output 	 mbox_ack_dma11_received;

   input 	 send_mbox_dma12;
   input 	 mbox_dma12_data_valid;
   input 	 mbox_dma12_data_done;
   input [127:0] mbox_dma12_data;
   input [19:0] dmc_txc_dma12_page_handle;
   input [37:0] tx_dma_cfg_dma12_mbaddr;
 // page table information
   input [31:0] page0_mask_dma12;
   input [31:0] page0_value_dma12;
   input [31:0] page0_reloc_dma12;
   input 	page0_valid_dma12;
   input [31:0] page1_mask_dma12;
   input [31:0] page1_value_dma12;
   input [31:0] page1_reloc_dma12;
   input 	page1_valid_dma12 ;

   output        mbox_dma12_scheduled;
   output 	 done_mbox_dma12;
   output 	 mbox_ack_dma12_received;

   input 	 send_mbox_dma13;
   input 	 mbox_dma13_data_valid;
   input 	 mbox_dma13_data_done;
   input [127:0] mbox_dma13_data;
   input [19:0] dmc_txc_dma13_page_handle;
   input [37:0] tx_dma_cfg_dma13_mbaddr;
 // page table information
   input [31:0] page0_mask_dma13;
   input [31:0] page0_value_dma13;
   input [31:0] page0_reloc_dma13;
   input 	page0_valid_dma13;
   input [31:0] page1_mask_dma13;
   input [31:0] page1_value_dma13;
   input [31:0] page1_reloc_dma13;
   input 	page1_valid_dma13 ;

   output        mbox_dma13_scheduled;
   output 	 done_mbox_dma13;
   output 	 mbox_ack_dma13_received;

   input 	 send_mbox_dma14;
   input 	 mbox_dma14_data_valid;
   input 	 mbox_dma14_data_done;
   input [127:0] mbox_dma14_data;
   input [19:0] dmc_txc_dma14_page_handle;
   input [37:0] tx_dma_cfg_dma14_mbaddr;
 // page table information
   input [31:0] page0_mask_dma14;
   input [31:0] page0_value_dma14;
   input [31:0] page0_reloc_dma14;
   input 	page0_valid_dma14;
   input [31:0] page1_mask_dma14;
   input [31:0] page1_value_dma14;
   input [31:0] page1_reloc_dma14;
   input 	page1_valid_dma14 ;

   output        mbox_dma14_scheduled;
   output 	 done_mbox_dma14;
   output 	 mbox_ack_dma14_received;

   input 	 send_mbox_dma15;
   input 	 mbox_dma15_data_valid;
   input 	 mbox_dma15_data_done;
   input [127:0] mbox_dma15_data;
   input [19:0] dmc_txc_dma15_page_handle;
   input [37:0] tx_dma_cfg_dma15_mbaddr;
 // page table information
   input [31:0] page0_mask_dma15;
   input [31:0] page0_value_dma15;
   input [31:0] page0_reloc_dma15;
   input 	page0_valid_dma15;
   input [31:0] page1_mask_dma15;
   input [31:0] page1_value_dma15;
   input [31:0] page1_reloc_dma15;
   input 	page1_valid_dma15 ;

   output        mbox_dma15_scheduled;
   output 	 done_mbox_dma15;
   output 	 mbox_ack_dma15_received;


`ifdef NEPTUNE
   input 	 send_mbox_dma16;
   input 	 mbox_dma16_data_valid;
   input 	 mbox_dma16_data_done;
   input [127:0] mbox_dma16_data;
   input [19:0] dmc_txc_dma16_page_handle;
   input [37:0] tx_dma_cfg_dma16_mbaddr;
 // page table information
   input [31:0] page0_mask_dma16;
   input [31:0] page0_value_dma16;
   input [31:0] page0_reloc_dma16;
   input 	page0_valid_dma16;
   input [31:0] page1_mask_dma16;
   input [31:0] page1_value_dma16;
   input [31:0] page1_reloc_dma16;
   input 	page1_valid_dma16 ;

   output        mbox_dma16_scheduled;
   output 	 done_mbox_dma16;
   output 	 mbox_ack_dma16_received;

   input 	 send_mbox_dma17;
   input 	 mbox_dma17_data_valid;
   input 	 mbox_dma17_data_done;
   input [127:0] mbox_dma17_data;
   input [19:0] dmc_txc_dma17_page_handle;
   input [37:0] tx_dma_cfg_dma17_mbaddr;
 // page table information
   input [31:0] page0_mask_dma17;
   input [31:0] page0_value_dma17;
   input [31:0] page0_reloc_dma17;
   input 	page0_valid_dma17;
   input [31:0] page1_mask_dma17;
   input [31:0] page1_value_dma17;
   input [31:0] page1_reloc_dma17;
   input 	page1_valid_dma17 ;

   output        mbox_dma17_scheduled;
   output 	 done_mbox_dma17;
   output 	 mbox_ack_dma17_received;

   input 	 send_mbox_dma18;
   input 	 mbox_dma18_data_valid;
   input 	 mbox_dma18_data_done;
   input [127:0] mbox_dma18_data;
   input [19:0] dmc_txc_dma18_page_handle;
   input [37:0] tx_dma_cfg_dma18_mbaddr;
 // page table information
   input [31:0] page0_mask_dma18;
   input [31:0] page0_value_dma18;
   input [31:0] page0_reloc_dma18;
   input 	page0_valid_dma18;
   input [31:0] page1_mask_dma18;
   input [31:0] page1_value_dma18;
   input [31:0] page1_reloc_dma18;
   input 	page1_valid_dma18 ;

   output        mbox_dma18_scheduled;
   output 	 done_mbox_dma18;
   output 	 mbox_ack_dma18_received;

   input 	 send_mbox_dma19;
   input 	 mbox_dma19_data_valid;
   input 	 mbox_dma19_data_done;
   input [127:0] mbox_dma19_data;
   input [19:0] dmc_txc_dma19_page_handle;
   input [37:0] tx_dma_cfg_dma19_mbaddr;
 // page table information
   input [31:0] page0_mask_dma19;
   input [31:0] page0_value_dma19;
   input [31:0] page0_reloc_dma19;
   input 	page0_valid_dma19;
   input [31:0] page1_mask_dma19;
   input [31:0] page1_value_dma19;
   input [31:0] page1_reloc_dma19;
   input 	page1_valid_dma19 ;

   output        mbox_dma19_scheduled;
   output 	 done_mbox_dma19;
   output 	 mbox_ack_dma19_received;

   input 	 send_mbox_dma20;
   input 	 mbox_dma20_data_valid;
   input 	 mbox_dma20_data_done;
   input [127:0] mbox_dma20_data;
   input [19:0] dmc_txc_dma20_page_handle;
   input [37:0] tx_dma_cfg_dma20_mbaddr;
 // page table information
   input [31:0] page0_mask_dma20;
   input [31:0] page0_value_dma20;
   input [31:0] page0_reloc_dma20;
   input 	page0_valid_dma20;
   input [31:0] page1_mask_dma20;
   input [31:0] page1_value_dma20;
   input [31:0] page1_reloc_dma20;
   input 	page1_valid_dma20 ;

   output        mbox_dma20_scheduled;
   output 	 done_mbox_dma20;
   output 	 mbox_ack_dma20_received;

   input 	 send_mbox_dma21;
   input 	 mbox_dma21_data_valid;
   input 	 mbox_dma21_data_done;
   input [127:0] mbox_dma21_data;
   input [19:0] dmc_txc_dma21_page_handle;
   input [37:0] tx_dma_cfg_dma21_mbaddr;
 // page table information
   input [31:0] page0_mask_dma21;
   input [31:0] page0_value_dma21;
   input [31:0] page0_reloc_dma21;
   input 	page0_valid_dma21;
   input [31:0] page1_mask_dma21;
   input [31:0] page1_value_dma21;
   input [31:0] page1_reloc_dma21;
   input 	page1_valid_dma21 ;

   output        mbox_dma21_scheduled;
   output 	 done_mbox_dma21;
   output 	 mbox_ack_dma21_received;

   input 	 send_mbox_dma22;
   input 	 mbox_dma22_data_valid;
   input 	 mbox_dma22_data_done;
   input [127:0] mbox_dma22_data;
   input [19:0] dmc_txc_dma22_page_handle;
   input [37:0] tx_dma_cfg_dma22_mbaddr;
 // page table information
   input [31:0] page0_mask_dma22;
   input [31:0] page0_value_dma22;
   input [31:0] page0_reloc_dma22;
   input 	page0_valid_dma22;
   input [31:0] page1_mask_dma22;
   input [31:0] page1_value_dma22;
   input [31:0] page1_reloc_dma22;
   input 	page1_valid_dma22 ;

   output        mbox_dma22_scheduled;
   output 	 done_mbox_dma22;
   output 	 mbox_ack_dma22_received;

   input 	 send_mbox_dma23;
   input 	 mbox_dma23_data_valid;
   input 	 mbox_dma23_data_done;
   input [127:0] mbox_dma23_data;
   input [19:0] dmc_txc_dma23_page_handle;
   input [37:0] tx_dma_cfg_dma23_mbaddr;


   
 // page table information
   input [31:0] page0_mask_dma23;
   input [31:0] page0_value_dma23;
   input [31:0] page0_reloc_dma23;
   input 	page0_valid_dma23;
   input [31:0] page1_mask_dma23;
   input [31:0] page1_value_dma23;
   input [31:0] page1_reloc_dma23;
   input 	page1_valid_dma23 ;

   output        mbox_dma23_scheduled;
   output 	 done_mbox_dma23;
   output 	 mbox_ack_dma23_received;

`else
`endif
// function number for requests
   input [1:0]   dmc_txc_dma0_func_num;
   input [1:0]  dmc_txc_dma1_func_num;
   input [1:0]  dmc_txc_dma2_func_num;
   input [1:0]  dmc_txc_dma3_func_num;
   input [1:0]  dmc_txc_dma4_func_num;
   input [1:0]  dmc_txc_dma5_func_num;
   input [1:0]  dmc_txc_dma6_func_num;
   input [1:0]  dmc_txc_dma7_func_num;
   input [1:0]  dmc_txc_dma8_func_num;
   input [1:0]  dmc_txc_dma9_func_num;
   input [1:0]  dmc_txc_dma10_func_num;
   input [1:0]  dmc_txc_dma11_func_num;
   input [1:0]  dmc_txc_dma12_func_num;
   input [1:0]  dmc_txc_dma13_func_num;
   input [1:0]  dmc_txc_dma14_func_num;
   input [1:0]  dmc_txc_dma15_func_num;
`ifdef NEPTUNE
   input [1:0]  dmc_txc_dma16_func_num;
   input [1:0]  dmc_txc_dma17_func_num;
   input [1:0]  dmc_txc_dma18_func_num;
   input [1:0]  dmc_txc_dma19_func_num;
   input [1:0]  dmc_txc_dma20_func_num;
   input [1:0]  dmc_txc_dma21_func_num;
   input [1:0]  dmc_txc_dma22_func_num;
   input [1:0]  dmc_txc_dma23_func_num;
`else
`endif
   output [`NO_OF_DMAS - 1:0] set_mbox_part_error_dma;
   output [`NO_OF_DMAS - 1:0] mbox_ack_dma_err_received;
   output 	 mbox_err_received;
   
   output 	 meta_data_req;

   // Meta Signals
   output [127:0] tdmc_arb0_data;               // Transfer Data
   output 	  tdmc_arb0_data_valid;         // Transfer Data Ack
   output 	  tdmc_arb0_req;                // Req Command Request
   output [63:0]  tdmc_arb0_req_address;        // Memory Address
   output [15:0]  tdmc_arb0_req_byteenable;     // First/Last BE
   output [7:0]   tdmc_arb0_req_cmd;            // Command Request
   output [4:0]   tdmc_arb0_req_dma_num;        // Channel Number
   output [13:0]  tdmc_arb0_req_length;         // Packet Length
   output [1:0]   tdmc_arb0_req_port_num;       // Port Number
   output [3:0]   tdmc_arb0_status;             // Transfer Data Status
   output 	  tdmc_arb0_transfer_complete;  // Transfer Data Complete
   output [1:0]   tdmc_arb0_req_func_num;       // FUNCTION Number

   input 	  arb0_tdmc_data_req;           // Memory line request
   input 	  arb0_tdmc_req_accept;         // Response to REQ

   // Write Ack Signals

   input [4:0] 	  meta_dmc_ack_dma_num;
   input 	  meta_dmc_ack_client;
   input 	  meta_dmc_ack_complete;
   input 	  meta_dmc_ack_ready;
   input [7:0] 	  meta_dmc_ack_cmd;
   input [3:0]    meta_dmc_ack_cmd_status;
   output 	  dmc_meta_ack_accept;      
   
   output [11:0]  mbox_debug_state; // to debug port

   // Wires and Regs

   wire 	  mbox_dma0_scheduled;
   wire 	  done_mbox_dma0;
   wire 	  mbox_ack_dma0_received;
   wire 	  mbox_dma1_scheduled;
   wire 	  done_mbox_dma1;
   wire 	  mbox_ack_dma1_received;
   wire 	  mbox_dma2_scheduled;
   wire 	  done_mbox_dma2;
   wire 	  mbox_ack_dma2_received;
   wire 	  mbox_dma3_scheduled;
   wire 	  done_mbox_dma3;
   wire 	  mbox_ack_dma3_received;
   wire 	  mbox_dma4_scheduled;
   wire 	  done_mbox_dma4;
   wire 	  mbox_ack_dma4_received;
   wire 	  mbox_dma5_scheduled;
   wire 	  done_mbox_dma5;
   wire 	  mbox_ack_dma5_received;
   wire 	  mbox_dma6_scheduled;
   wire 	  done_mbox_dma6;
   wire 	  mbox_ack_dma6_received;
   wire 	  mbox_dma7_scheduled;
   wire 	  done_mbox_dma7;
   wire 	  mbox_ack_dma7_received;
   wire 	  mbox_dma8_scheduled;
   wire 	  done_mbox_dma8;
   wire 	  mbox_ack_dma8_received;
   wire 	  mbox_dma9_scheduled;
   wire 	  done_mbox_dma9;
   wire 	  mbox_ack_dma9_received;
   wire 	  mbox_dma10_scheduled;
   wire 	  done_mbox_dma10;
   wire 	  mbox_ack_dma10_received;
   wire 	  mbox_dma11_scheduled;
   wire 	  done_mbox_dma11;
   wire 	  mbox_ack_dma11_received;
   wire 	  mbox_dma12_scheduled;
   wire 	  done_mbox_dma12;
   wire 	  mbox_ack_dma12_received;
   wire 	  mbox_dma13_scheduled;
   wire 	  done_mbox_dma13;
   wire 	  mbox_ack_dma13_received;
   wire 	  mbox_dma14_scheduled;
   wire 	  done_mbox_dma14;
   wire 	  mbox_ack_dma14_received;
   wire 	  mbox_dma15_scheduled;
   wire 	  done_mbox_dma15;
   wire 	  mbox_ack_dma15_received;
`ifdef NEPTUNE
   wire 	  mbox_dma16_scheduled;
   wire 	  done_mbox_dma16;
   wire 	  mbox_ack_dma16_received;
   wire 	  mbox_dma17_scheduled;
   wire 	  done_mbox_dma17;
   wire 	  mbox_ack_dma17_received;
   wire 	  mbox_dma18_scheduled;
   wire 	  done_mbox_dma18;
   wire 	  mbox_ack_dma18_received;
   wire 	  mbox_dma19_scheduled;
   wire 	  done_mbox_dma19;
   wire 	  mbox_ack_dma19_received;
   wire 	  mbox_dma20_scheduled;
   wire 	  done_mbox_dma20;
   wire 	  mbox_ack_dma20_received;
   wire 	  mbox_dma21_scheduled;
   wire 	  done_mbox_dma21;
   wire 	  mbox_ack_dma21_received;
   wire 	  mbox_dma22_scheduled;
   wire 	  done_mbox_dma22;
   wire 	  mbox_ack_dma22_received;
   wire 	  mbox_dma23_scheduled;
   wire 	  done_mbox_dma23;
   wire 	  mbox_ack_dma23_received;

`else
`endif




   wire 	  ArbDone;
   wire [4:0] 	  mbox_dma_num;
   wire [31:0] dma_num_selected;
   wire [31:0] 	  dmas_available_for_mbox;
   wire 	  SendMbox;
   reg [3:0] 	  mbox_req_state;
   reg [`NO_OF_DMAS - 1:0] 	  done_mbox_update;
   reg [`NO_OF_DMAS - 1:0] 	  mbox_dma_scheduled;
   reg 		  choose_dmas_for_mbox;
   reg [37:0] 	  mbox_address;
   reg 		  mbox_send_data;
   wire 	  mbox_dma_data_done;

   reg 		  latch_mbox_contexts;
   reg [3:0] 	  mbox_ack_state ;
   reg [4:0] 	  resp_dma_num;
   reg 		  dmc_meta_ack_accept ;
   reg 		  send_ack_received ;
   reg [`NO_OF_DMAS - 1:0] 	  mbox_ack_dma_received;
   
   reg [127:0] 	  tdmc_arb0_data;               // Transfer Data
   reg 		  tdmc_arb0_data_valid;         // Transfer Data Ack
   reg 		  tdmc_arb0_req;                // Req Command Request
   reg [63:0] 	  tdmc_arb0_req_address;        // Memory Address
   reg [15:0] 	  tdmc_arb0_req_byteenable;     // First/Last BE
   reg [7:0] 	  tdmc_arb0_req_cmd;            // Command Request
   reg [4:0] 	  tdmc_arb0_req_dma_num;        // Channel Number
   reg [13:0] 	  tdmc_arb0_req_length;         // Packet Length
   reg [1:0] 	  tdmc_arb0_req_port_num;       // Port Number
   reg [1:0] 	  tdmc_arb0_req_func_num;       // Port Number
   reg [3:0] 	  tdmc_arb0_status;             // Transfer Data Status
   reg 		  tdmc_arb0_transfer_complete;  // Transfer Data Complete

   reg 		  meta_data_req;

   // Logic for Pagetable translation
   reg 		  xlate_done;
   reg 		  start_page_xlate;
   reg [43:0] 	  xlate_mbaddr;
   reg [3:0] 	  page_xlate_state;
   reg 		  page0_match;
   reg 		  page1_match;
   reg [19:0] 	  page_handle;
   reg [1:0] 	  func_num;
   
   reg [31:0] 	  page0_mask_dma;
   reg [31:0] 	  page0_value_dma;
   reg [31:0] 	  page0_reloc_dma;
   reg 		  page0_valid_dma;
   reg [31:0] 	  page1_mask_dma;
   reg [31:0] 	  page1_value_dma;
   reg [31:0] 	  page1_reloc_dma;
   reg 		  page1_valid_dma;
   reg [31:0] 	  page0_reloc_addr;
   reg [31:0] 	  page1_reloc_addr;

   reg 		  set_mbox_part_error;
   reg [`NO_OF_DMAS - 1:0] 	  set_mbox_part_error_dma;
   reg [`NO_OF_DMAS - 1:0] 	  mbox_ack_dma_err_received;
   reg 		  mbox_err_received;
   reg [7:0] 	  cmd_received;

   wire [11:0] mbox_debug_state;
   //
   // parameters
   parameter 	  ACK_IDLE   = 4'h0,
		  WAIT_FOR_COMPLETE = 4'h1;

   parameter 	  MBOX_REQ_IDLE = 4'h0,
		  MBOX_ARB_DMA = 4'h1,
		  MBOX_XLATE_ADDR = 4'h2,
		  MBOX_SEND_REQ = 4'h3,
		  MBOX_WAIT_FOR_ACCEPT = 4'h4,
		  MBOX_SEND_DATA = 4'h5,
		  MBOX_DONE = 4'h6,
		  MBOX_ERROR = 4'h7;


      parameter PAGE_XLATE_IDLE = 4'h0,
	     CHECK_PAGE_STATUS    = 4'h1,
	     PAGE_XLATE_ERROR = 4'h2,
	     PAGE_XLATE_DONE = 4'h3;
   //VCS coverage off
   // synopsys translate_off
    reg [192:1] ACK_STATE;
    always @(mbox_ack_state)
      begin
	 case(mbox_ack_state)
	   ACK_IDLE :  ACK_STATE  = "ACK_IDLE";
	   WAIT_FOR_COMPLETE:      ACK_STATE = "WAIT_FOR_COMPLETE";
	   default :          ACK_STATE = "UNKNOWN";
	 endcase
      end  
   
   reg [192:1] REQ_STATE;
   always@(mbox_req_state) begin
      case(mbox_req_state)
	MBOX_REQ_IDLE: REQ_STATE = "MBOX_REQ_IDLE";
	MBOX_ARB_DMA: REQ_STATE = "MBOX_ARB_DMA";
	MBOX_XLATE_ADDR: REQ_STATE = "MBOX_XLATE_ADDR";
	MBOX_SEND_REQ: REQ_STATE = "MBOX_SEND_REQ";
	MBOX_WAIT_FOR_ACCEPT: REQ_STATE = "MBOX_WAIT_FOR_ACCEPT";
	MBOX_SEND_DATA: REQ_STATE = "MBOX_SEND_DATA";
	MBOX_DONE: REQ_STATE = "MBOX_DONE";
	MBOX_ERROR: REQ_STATE = "MBOX_ERROR";
	default: REQ_STATE = "UNKNOWN";
      endcase
   end
     reg [192:1] 	 PAGE_XLATE_STATE;
   
   always @(page_xlate_state)
     begin
        case(page_xlate_state)
          PAGE_XLATE_IDLE :  PAGE_XLATE_STATE  = "PAGE_XLATE_IDLE";
          CHECK_PAGE_STATUS:      PAGE_XLATE_STATE = "CHECK_PAGE_STATUS";
	  PAGE_XLATE_ERROR : PAGE_XLATE_STATE = "PAGE_XLATE_ERROR";
	  PAGE_XLATE_DONE : PAGE_XLATE_STATE = "PAGE_XLATE_DONE";
          default :          PAGE_XLATE_STATE = "UNKNOWN";
        endcase
     end 
   // synopsys translate_on 
   //VCS coverage on
   


   assign mbox_debug_state = {page_xlate_state,mbox_req_state,mbox_ack_state};

   
   assign dmas_available_for_mbox = {   8'h0,
`ifdef NEPTUNE
					send_mbox_dma23, send_mbox_dma22, send_mbox_dma21, send_mbox_dma20,
					send_mbox_dma19, send_mbox_dma18, send_mbox_dma17, send_mbox_dma16,
`else
					8'h0,
`endif
					send_mbox_dma15, send_mbox_dma14, send_mbox_dma13, send_mbox_dma12,
					send_mbox_dma11, send_mbox_dma10, send_mbox_dma9, send_mbox_dma8,
					send_mbox_dma7, send_mbox_dma6, send_mbox_dma5, send_mbox_dma4,
					send_mbox_dma3, send_mbox_dma2, send_mbox_dma1, send_mbox_dma0 };
   assign mbox_dma_data_done = | {  8'h0,

`ifdef NEPTUNE
				    mbox_dma23_data_done, mbox_dma22_data_done, mbox_dma21_data_done, mbox_dma20_data_done, 
				    mbox_dma19_data_done, mbox_dma18_data_done, mbox_dma17_data_done, mbox_dma16_data_done, 
`else
				    8'h0,
`endif
				    mbox_dma15_data_done, mbox_dma14_data_done, mbox_dma13_data_done, mbox_dma12_data_done,
				    mbox_dma11_data_done, mbox_dma10_data_done, mbox_dma9_data_done, mbox_dma8_data_done, 
				    mbox_dma7_data_done, mbox_dma6_data_done, mbox_dma5_data_done, mbox_dma4_data_done, 
				    mbox_dma3_data_done, mbox_dma2_data_done, mbox_dma1_data_done, mbox_dma0_data_done };

   
   
   assign SendMbox = | dmas_available_for_mbox;
   
   // State Machine for Meta- 
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 mbox_req_state <= MBOX_REQ_IDLE;
	 done_mbox_update <= `NO_OF_DMAS'b0;
	 mbox_dma_scheduled <= `NO_OF_DMAS'h0;
	 choose_dmas_for_mbox <= 1'b0;
	 latch_mbox_contexts <= 1'b0;
	 tdmc_arb0_req  <= 1'b0;
	 meta_data_req <= 1'b0;
	 tdmc_arb0_req_byteenable <= 16'hffff;
	 tdmc_arb0_req_port_num <= 2'h0;
	 tdmc_arb0_req_func_num <= 2'h0;
	 tdmc_arb0_status <= 4'h0;
	 start_page_xlate <= 1'b0;
	 set_mbox_part_error_dma <= `NO_OF_DMAS'h0;
      end else begin
	 case(mbox_req_state) // synopsys full_case parallel_case
	   MBOX_REQ_IDLE: begin
	      done_mbox_update <= `NO_OF_DMAS'h0;
	      mbox_dma_scheduled <= `NO_OF_DMAS'h0;
	      set_mbox_part_error_dma <= `NO_OF_DMAS'h0;
	      meta_data_req <= 1'b0; // To check this???
	      if(SendMbox) begin
		 mbox_req_state <= MBOX_ARB_DMA;
		 choose_dmas_for_mbox <= 1'b1;
	      end
	   end // case: MBOX_REQ_IDLE
	   MBOX_ARB_DMA: begin
	      choose_dmas_for_mbox <= 1'b0;
	      if(ArbDone) begin
		 mbox_dma_scheduled <= dma_num_selected[`NO_OF_DMAS -1 :0] ;
		 mbox_req_state <= MBOX_XLATE_ADDR;
		 latch_mbox_contexts <= 1'b1;
	      end
	   end // case: MBOX_ARB_DMA
	   MBOX_XLATE_ADDR: begin
	      latch_mbox_contexts <= 1'b0;
	      start_page_xlate <= 1'b1;
	      if(set_mbox_part_error) begin
		 mbox_req_state <= MBOX_ERROR;
		 set_mbox_part_error_dma <= dma_num_selected[`NO_OF_DMAS -1 :0] ;
	      end else if(xlate_done) begin
		 start_page_xlate <= 1'b0;
		 mbox_req_state <= MBOX_SEND_REQ;
	      end // if (xlate_done)
	   end
	   MBOX_SEND_REQ: begin
	      tdmc_arb0_req  <= 1'b1;
	      tdmc_arb0_req_cmd <= 8'h19;
	      tdmc_arb0_req_address <= {page_handle,xlate_mbaddr};
	      tdmc_arb0_req_length <= 14'h40; // 64Bytes
	      tdmc_arb0_req_dma_num <= mbox_dma_num;
	      tdmc_arb0_req_func_num <= func_num;
	      mbox_req_state <= MBOX_WAIT_FOR_ACCEPT; 
	   end
	   MBOX_WAIT_FOR_ACCEPT: begin
	      if(arb0_tdmc_req_accept) begin
		 mbox_req_state <= MBOX_SEND_DATA;
		 mbox_send_data <= 1'b1;
		 tdmc_arb0_req  <= 1'b0;
	      end
	   end
	   MBOX_SEND_DATA: begin
	      meta_data_req <= arb0_tdmc_data_req; // To check this???
	      if(mbox_dma_data_done) begin
		 mbox_send_data <= 1'b0;
		 mbox_req_state <= MBOX_DONE;
	         meta_data_req <= 1'b0; // To check this???
		 done_mbox_update <= mbox_dma_scheduled;
		 mbox_dma_scheduled <= `NO_OF_DMAS'h0;
	      end
	   end
	   MBOX_DONE: begin
	      mbox_req_state <= MBOX_REQ_IDLE;
	   end
	   MBOX_ERROR: begin
	      // place holder
	      set_mbox_part_error_dma <= `NO_OF_DMAS'h0;
	      mbox_req_state <= MBOX_REQ_IDLE;
	   end
	   default: begin
	      mbox_req_state <= MBOX_REQ_IDLE;
	   end
	 endcase // case(mbox_req_state)
	 
      end // else: !if(!Reset_L)
   end // always@ (posedge SysClk)

   niu_dmc_dmaarb dma_req_arb ( .SysClk(SysClk),
				.Reset_L(Reset_L),
				.Choose_DMAs(choose_dmas_for_mbox),
				.DMA_Reqs(dmas_available_for_mbox),
				.ArbDone(ArbDone),
				.DMANum(mbox_dma_num),
				.DMAsGranted(dma_num_selected)
				);

 // synopsys infer_mux "mbox_send_mux"
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 tdmc_arb0_data <= 128'h0;
	 tdmc_arb0_data_valid <= 1'b0;
	 tdmc_arb0_transfer_complete <= 1'b0;
      end else begin
	 if(mbox_send_data) begin: mbox_send_mux
	    case(mbox_dma_num)  // synopsys full_case parallel_case

`ifdef NEPTUNE
	      `DMA_CHANNEL_TWENTYTHREE: begin 
		 tdmc_arb0_data <= mbox_dma23_data;
		 tdmc_arb0_data_valid <= mbox_dma23_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma23_data_done;
	      end
	      `DMA_CHANNEL_TWENTYTWO: begin 
		 tdmc_arb0_data <= mbox_dma22_data;
		 tdmc_arb0_data_valid <= mbox_dma22_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma22_data_done;
	      end
	      `DMA_CHANNEL_TWENTYONE: begin 
		 tdmc_arb0_data <= mbox_dma21_data;
		 tdmc_arb0_data_valid <= mbox_dma21_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma21_data_done;
	      end
	      `DMA_CHANNEL_TWENTY: begin 
		 tdmc_arb0_data <= mbox_dma20_data;
		 tdmc_arb0_data_valid <= mbox_dma20_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma20_data_done;
	      end
	      `DMA_CHANNEL_NINETEEN: begin 
		 tdmc_arb0_data <= mbox_dma19_data;
		 tdmc_arb0_data_valid <= mbox_dma19_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma19_data_done;
	      end
	      `DMA_CHANNEL_EIGHTEEN: begin 
		 tdmc_arb0_data <= mbox_dma18_data;
		 tdmc_arb0_data_valid <= mbox_dma18_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma18_data_done;
	      end
	      `DMA_CHANNEL_SEVENTEEN: begin 
		 tdmc_arb0_data <= mbox_dma17_data;
		 tdmc_arb0_data_valid <= mbox_dma17_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma17_data_done;
	      end
	      `DMA_CHANNEL_SIXTEEN: begin 
		 tdmc_arb0_data <= mbox_dma16_data;
		 tdmc_arb0_data_valid <= mbox_dma16_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma16_data_done;
	      end
`else
`endif // !ifdef CHANNELS_16
	      `DMA_CHANNEL_FIFTEEN: begin 
		 tdmc_arb0_data <= mbox_dma15_data;
		 tdmc_arb0_data_valid <= mbox_dma15_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma15_data_done;
	      end
	      `DMA_CHANNEL_FOURTEEN: begin 
		 tdmc_arb0_data <= mbox_dma14_data;
		 tdmc_arb0_data_valid <= mbox_dma14_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma14_data_done;
	      end
	      `DMA_CHANNEL_THIRTEEN: begin 
		 tdmc_arb0_data <= mbox_dma13_data;
		 tdmc_arb0_data_valid <= mbox_dma13_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma13_data_done;
	      end
	      `DMA_CHANNEL_TWELVE: begin 
		 tdmc_arb0_data <= mbox_dma12_data;
		 tdmc_arb0_data_valid <= mbox_dma12_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma12_data_done;
	      end
	      `DMA_CHANNEL_ELEVEN: begin 
		 tdmc_arb0_data <= mbox_dma11_data;
		 tdmc_arb0_data_valid <= mbox_dma11_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma11_data_done;
	      end
	      `DMA_CHANNEL_TEN: begin 
		 tdmc_arb0_data <= mbox_dma10_data;
		 tdmc_arb0_data_valid <= mbox_dma10_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma10_data_done;
	      end
	      `DMA_CHANNEL_NINE: begin 
		 tdmc_arb0_data <= mbox_dma9_data;
		 tdmc_arb0_data_valid <= mbox_dma9_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma9_data_done;
	      end
	      `DMA_CHANNEL_EIGHT: begin 
		 tdmc_arb0_data <= mbox_dma8_data;
		 tdmc_arb0_data_valid <= mbox_dma8_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma8_data_done;
	      end
	      `DMA_CHANNEL_SEVEN: begin 
		 tdmc_arb0_data <= mbox_dma7_data;
		 tdmc_arb0_data_valid <= mbox_dma7_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma7_data_done;
	      end
	      `DMA_CHANNEL_SIX: begin 
		 tdmc_arb0_data <= mbox_dma6_data;
		 tdmc_arb0_data_valid <= mbox_dma6_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma6_data_done;
	      end
	      `DMA_CHANNEL_FIVE: begin 
		 tdmc_arb0_data <= mbox_dma5_data;
		 tdmc_arb0_data_valid <= mbox_dma5_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma5_data_done;
	      end
	      `DMA_CHANNEL_FOUR: begin 
		 tdmc_arb0_data <= mbox_dma4_data;
		 tdmc_arb0_data_valid <= mbox_dma4_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma4_data_done;
	      end
	      `DMA_CHANNEL_THREE: begin 
		 tdmc_arb0_data <= mbox_dma3_data;
		 tdmc_arb0_data_valid <= mbox_dma3_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma3_data_done;
	      end
	      `DMA_CHANNEL_TWO: begin 
		 tdmc_arb0_data <= mbox_dma2_data;
		 tdmc_arb0_data_valid <= mbox_dma2_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma2_data_done;
	      end
	      `DMA_CHANNEL_ONE: begin 
		 tdmc_arb0_data <= mbox_dma1_data;
		 tdmc_arb0_data_valid <= mbox_dma1_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma1_data_done;
	      end
	      `DMA_CHANNEL_ZERO: begin 
		 tdmc_arb0_data <= mbox_dma0_data;
		 tdmc_arb0_data_valid <= mbox_dma0_data_valid;
		 tdmc_arb0_transfer_complete <= mbox_dma0_data_done;
	      end // case: `DMA_CHANNEL_ZERO
	      default begin
		 tdmc_arb0_data <= 128'h0;
		 tdmc_arb0_data_valid <= 1'b0;
		 tdmc_arb0_transfer_complete <= 1'b0;
	      end 
	    endcase // case(mbox_dma_num)
	 end // if (mbox_send_data)
	 else begin
	    tdmc_arb0_data <= 128'h0;
	    tdmc_arb0_data_valid <= 1'b0;
	    tdmc_arb0_transfer_complete <= 1'b0;
	 end // else: !if(mbox_send_data)
      end // else: !if(!Reset_L)
   end // always@ (posedge SysClk)
   
   
   
  // synopsys infer_mux "mbox_page_context_mux" 
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 mbox_address <= 38'h0;
	 page1_valid_dma <= 1'b0;
	 page0_valid_dma <= 1'b0;
	 page_handle <= 20'h0;
	 func_num <= 2'h0;
      end else begin
	 if(latch_mbox_contexts) begin : mbox_page_context_mux
	    case(mbox_dma_num) // synopsys full_case parallel_case
`ifdef NEPTUNE
 `DMA_CHANNEL_TWENTYTHREE: begin 
	     mbox_address <= tx_dma_cfg_dma23_mbaddr;
	     page_handle  <= dmc_txc_dma23_page_handle;
	     func_num  <= dmc_txc_dma23_func_num;
   	     page0_mask_dma  <=     page0_mask_dma23;
   	     page0_value_dma   <=   page0_value_dma23;
   	     page0_reloc_dma     <= page0_reloc_dma23;
   	     page0_valid_dma    <=  page0_valid_dma23;
   	     page1_mask_dma     <=  page1_mask_dma23;
   	     page1_value_dma    <=  page1_value_dma23;
   	     page1_reloc_dma    <=  page1_reloc_dma23;
   	     page1_valid_dma    <=  page1_valid_dma23;
	    end
 `DMA_CHANNEL_TWENTYTWO: begin 
	     mbox_address <= tx_dma_cfg_dma22_mbaddr;
	     page_handle  <= dmc_txc_dma22_page_handle;
	     func_num  <= dmc_txc_dma22_func_num;
   	     page0_mask_dma  <=     page0_mask_dma22;
   	     page0_value_dma   <=   page0_value_dma22;
   	     page0_reloc_dma     <= page0_reloc_dma22;
   	     page0_valid_dma    <=  page0_valid_dma22;
   	     page1_mask_dma     <=  page1_mask_dma22;
   	     page1_value_dma    <=  page1_value_dma22;
   	     page1_reloc_dma    <=  page1_reloc_dma22;
   	     page1_valid_dma    <=  page1_valid_dma22;
	    end
 `DMA_CHANNEL_TWENTYONE: begin 
	     mbox_address <= tx_dma_cfg_dma21_mbaddr;
	     page_handle  <= dmc_txc_dma21_page_handle;
	     func_num  <= dmc_txc_dma21_func_num;
   	     page0_mask_dma  <=     page0_mask_dma21;
   	     page0_value_dma   <=   page0_value_dma21;
   	     page0_reloc_dma     <= page0_reloc_dma21;
   	     page0_valid_dma    <=  page0_valid_dma21;
   	     page1_mask_dma     <=  page1_mask_dma21;
   	     page1_value_dma    <=  page1_value_dma21;
   	     page1_reloc_dma    <=  page1_reloc_dma21;
   	     page1_valid_dma    <=  page1_valid_dma21;
	    end
 `DMA_CHANNEL_TWENTY: begin 
	     mbox_address <= tx_dma_cfg_dma20_mbaddr;
	     page_handle  <= dmc_txc_dma20_page_handle;
	     func_num  <= dmc_txc_dma20_func_num;
   	     page0_mask_dma  <=     page0_mask_dma20;
   	     page0_value_dma   <=   page0_value_dma20;
   	     page0_reloc_dma     <= page0_reloc_dma20;
   	     page0_valid_dma    <=  page0_valid_dma20;
   	     page1_mask_dma     <=  page1_mask_dma20;
   	     page1_value_dma    <=  page1_value_dma20;
   	     page1_reloc_dma    <=  page1_reloc_dma20;
   	     page1_valid_dma    <=  page1_valid_dma20;
	    end
 `DMA_CHANNEL_NINETEEN: begin 
	     mbox_address <= tx_dma_cfg_dma19_mbaddr;
	     page_handle  <= dmc_txc_dma19_page_handle;
	     func_num  <= dmc_txc_dma19_func_num;
   	     page0_mask_dma  <=     page0_mask_dma19;
   	     page0_value_dma   <=   page0_value_dma19;
   	     page0_reloc_dma     <= page0_reloc_dma19;
   	     page0_valid_dma    <=  page0_valid_dma19;
   	     page1_mask_dma     <=  page1_mask_dma19;
   	     page1_value_dma    <=  page1_value_dma19;
   	     page1_reloc_dma    <=  page1_reloc_dma19;
   	     page1_valid_dma    <=  page1_valid_dma19;
	    end
 `DMA_CHANNEL_EIGHTEEN: begin 
	     mbox_address <= tx_dma_cfg_dma18_mbaddr;
	     page_handle  <= dmc_txc_dma18_page_handle;
	     func_num  <= dmc_txc_dma18_func_num;
   	     page0_mask_dma  <=     page0_mask_dma18;
   	     page0_value_dma   <=   page0_value_dma18;
   	     page0_reloc_dma     <= page0_reloc_dma18;
   	     page0_valid_dma    <=  page0_valid_dma18;
   	     page1_mask_dma     <=  page1_mask_dma18;
   	     page1_value_dma    <=  page1_value_dma18;
   	     page1_reloc_dma    <=  page1_reloc_dma18;
   	     page1_valid_dma    <=  page1_valid_dma18;
	    end
 `DMA_CHANNEL_SEVENTEEN: begin 
	     mbox_address <= tx_dma_cfg_dma17_mbaddr;
	     page_handle  <= dmc_txc_dma17_page_handle;
	     func_num  <= dmc_txc_dma17_func_num;
   	     page0_mask_dma  <=     page0_mask_dma17;
   	     page0_value_dma   <=   page0_value_dma17;
   	     page0_reloc_dma     <= page0_reloc_dma17;
   	     page0_valid_dma    <=  page0_valid_dma17;
   	     page1_mask_dma     <=  page1_mask_dma17;
   	     page1_value_dma    <=  page1_value_dma17;
   	     page1_reloc_dma    <=  page1_reloc_dma17;
   	     page1_valid_dma    <=  page1_valid_dma17;
	    end
 `DMA_CHANNEL_SIXTEEN: begin 
	     mbox_address <= tx_dma_cfg_dma16_mbaddr;
	     page_handle  <= dmc_txc_dma16_page_handle;
	     func_num  <= dmc_txc_dma16_func_num;
   	     page0_mask_dma  <=     page0_mask_dma16;
   	     page0_value_dma   <=   page0_value_dma16;
   	     page0_reloc_dma     <= page0_reloc_dma16;
   	     page0_valid_dma    <=  page0_valid_dma16;
   	     page1_mask_dma     <=  page1_mask_dma16;
   	     page1_value_dma    <=  page1_value_dma16;
   	     page1_reloc_dma    <=  page1_reloc_dma16;
   	     page1_valid_dma    <=  page1_valid_dma16;
	    end
`else
`endif // ifdef CHANNELS_16
 `DMA_CHANNEL_FIFTEEN: begin 
	     mbox_address <= tx_dma_cfg_dma15_mbaddr;
	     page_handle  <= dmc_txc_dma15_page_handle;
	     func_num  <= dmc_txc_dma15_func_num;
   	     page0_mask_dma  <=     page0_mask_dma15;
   	     page0_value_dma   <=   page0_value_dma15;
   	     page0_reloc_dma     <= page0_reloc_dma15;
   	     page0_valid_dma    <=  page0_valid_dma15;
   	     page1_mask_dma     <=  page1_mask_dma15;
   	     page1_value_dma    <=  page1_value_dma15;
   	     page1_reloc_dma    <=  page1_reloc_dma15;
   	     page1_valid_dma    <=  page1_valid_dma15;
	    end
 `DMA_CHANNEL_FOURTEEN: begin 
	     mbox_address <= tx_dma_cfg_dma14_mbaddr;
	     page_handle  <= dmc_txc_dma14_page_handle;
	     func_num  <= dmc_txc_dma14_func_num;
   	     page0_mask_dma  <=     page0_mask_dma14;
   	     page0_value_dma   <=   page0_value_dma14;
   	     page0_reloc_dma     <= page0_reloc_dma14;
   	     page0_valid_dma    <=  page0_valid_dma14;
   	     page1_mask_dma     <=  page1_mask_dma14;
   	     page1_value_dma    <=  page1_value_dma14;
   	     page1_reloc_dma    <=  page1_reloc_dma14;
   	     page1_valid_dma    <=  page1_valid_dma14;
	    end
 `DMA_CHANNEL_THIRTEEN: begin 
	     mbox_address <= tx_dma_cfg_dma13_mbaddr;
	     page_handle  <= dmc_txc_dma13_page_handle;
	     func_num  <= dmc_txc_dma13_func_num;
   	     page0_mask_dma  <=     page0_mask_dma13;
   	     page0_value_dma   <=   page0_value_dma13;
   	     page0_reloc_dma     <= page0_reloc_dma13;
   	     page0_valid_dma    <=  page0_valid_dma13;
   	     page1_mask_dma     <=  page1_mask_dma13;
   	     page1_value_dma    <=  page1_value_dma13;
   	     page1_reloc_dma    <=  page1_reloc_dma13;
   	     page1_valid_dma    <=  page1_valid_dma13;
	    end
 `DMA_CHANNEL_TWELVE: begin 
	     mbox_address <= tx_dma_cfg_dma12_mbaddr;
	     page_handle  <= dmc_txc_dma12_page_handle;
	     func_num  <= dmc_txc_dma12_func_num;
   	     page0_mask_dma  <=     page0_mask_dma12;
   	     page0_value_dma   <=   page0_value_dma12;
   	     page0_reloc_dma     <= page0_reloc_dma12;
   	     page0_valid_dma    <=  page0_valid_dma12;
   	     page1_mask_dma     <=  page1_mask_dma12;
   	     page1_value_dma    <=  page1_value_dma12;
   	     page1_reloc_dma    <=  page1_reloc_dma12;
   	     page1_valid_dma    <=  page1_valid_dma12;
	    end
 `DMA_CHANNEL_ELEVEN: begin 
	     mbox_address <= tx_dma_cfg_dma11_mbaddr;
	     page_handle  <= dmc_txc_dma11_page_handle;
	     func_num  <= dmc_txc_dma11_func_num;
   	     page0_mask_dma  <=     page0_mask_dma11;
   	     page0_value_dma   <=   page0_value_dma11;
   	     page0_reloc_dma     <= page0_reloc_dma11;
   	     page0_valid_dma    <=  page0_valid_dma11;
   	     page1_mask_dma     <=  page1_mask_dma11;
   	     page1_value_dma    <=  page1_value_dma11;
   	     page1_reloc_dma    <=  page1_reloc_dma11;
   	     page1_valid_dma    <=  page1_valid_dma11;
	    end
 `DMA_CHANNEL_TEN: begin 
	     mbox_address <= tx_dma_cfg_dma10_mbaddr;
	     page_handle  <= dmc_txc_dma10_page_handle;
	     func_num  <= dmc_txc_dma10_func_num;
   	     page0_mask_dma  <=     page0_mask_dma10;
   	     page0_value_dma   <=   page0_value_dma10;
   	     page0_reloc_dma     <= page0_reloc_dma10;
   	     page0_valid_dma    <=  page0_valid_dma10;
   	     page1_mask_dma     <=  page1_mask_dma10;
   	     page1_value_dma    <=  page1_value_dma10;
   	     page1_reloc_dma    <=  page1_reloc_dma10;
   	     page1_valid_dma    <=  page1_valid_dma10;
	    end
 `DMA_CHANNEL_NINE: begin 
	     mbox_address <= tx_dma_cfg_dma9_mbaddr;
	     page_handle  <= dmc_txc_dma9_page_handle;
	     func_num  <= dmc_txc_dma9_func_num;
   	     page0_mask_dma  <=     page0_mask_dma9;
   	     page0_value_dma   <=   page0_value_dma9;
   	     page0_reloc_dma     <= page0_reloc_dma9;
   	     page0_valid_dma    <=  page0_valid_dma9;
   	     page1_mask_dma     <=  page1_mask_dma9;
   	     page1_value_dma    <=  page1_value_dma9;
   	     page1_reloc_dma    <=  page1_reloc_dma9;
   	     page1_valid_dma    <=  page1_valid_dma9;
	    end
 `DMA_CHANNEL_EIGHT: begin 
	     mbox_address <= tx_dma_cfg_dma8_mbaddr;
	     page_handle  <= dmc_txc_dma8_page_handle;
	     func_num  <= dmc_txc_dma8_func_num;
   	     page0_mask_dma  <=     page0_mask_dma8;
   	     page0_value_dma   <=   page0_value_dma8;
   	     page0_reloc_dma     <= page0_reloc_dma8;
   	     page0_valid_dma    <=  page0_valid_dma8;
   	     page1_mask_dma     <=  page1_mask_dma8;
   	     page1_value_dma    <=  page1_value_dma8;
   	     page1_reloc_dma    <=  page1_reloc_dma8;
   	     page1_valid_dma    <=  page1_valid_dma8;
	    end
 `DMA_CHANNEL_SEVEN: begin 
	     mbox_address <= tx_dma_cfg_dma7_mbaddr;
	     page_handle  <= dmc_txc_dma7_page_handle;
	     func_num  <= dmc_txc_dma7_func_num;
   	     page0_mask_dma  <=     page0_mask_dma7;
   	     page0_value_dma   <=   page0_value_dma7;
   	     page0_reloc_dma     <= page0_reloc_dma7;
   	     page0_valid_dma    <=  page0_valid_dma7;
   	     page1_mask_dma     <=  page1_mask_dma7;
   	     page1_value_dma    <=  page1_value_dma7;
   	     page1_reloc_dma    <=  page1_reloc_dma7;
   	     page1_valid_dma    <=  page1_valid_dma7;
	    end
 `DMA_CHANNEL_SIX: begin 
	     mbox_address <= tx_dma_cfg_dma6_mbaddr;
	     page_handle  <= dmc_txc_dma6_page_handle;
	     func_num  <= dmc_txc_dma6_func_num;
   	     page0_mask_dma  <=     page0_mask_dma6;
   	     page0_value_dma   <=   page0_value_dma6;
   	     page0_reloc_dma     <= page0_reloc_dma6;
   	     page0_valid_dma    <=  page0_valid_dma6;
   	     page1_mask_dma     <=  page1_mask_dma6;
   	     page1_value_dma    <=  page1_value_dma6;
   	     page1_reloc_dma    <=  page1_reloc_dma6;
   	     page1_valid_dma    <=  page1_valid_dma6;
	    end
 `DMA_CHANNEL_FIVE: begin 
	     mbox_address <= tx_dma_cfg_dma5_mbaddr;
	     page_handle  <= dmc_txc_dma5_page_handle;
	     func_num  <= dmc_txc_dma5_func_num;
   	     page0_mask_dma  <=     page0_mask_dma5;
   	     page0_value_dma   <=   page0_value_dma5;
   	     page0_reloc_dma     <= page0_reloc_dma5;
   	     page0_valid_dma    <=  page0_valid_dma5;
   	     page1_mask_dma     <=  page1_mask_dma5;
   	     page1_value_dma    <=  page1_value_dma5;
   	     page1_reloc_dma    <=  page1_reloc_dma5;
   	     page1_valid_dma    <=  page1_valid_dma5;
	    end
 `DMA_CHANNEL_FOUR: begin 
	     mbox_address <= tx_dma_cfg_dma4_mbaddr;
	     page_handle  <= dmc_txc_dma4_page_handle;
	     func_num  <= dmc_txc_dma4_func_num;
   	     page0_mask_dma  <=     page0_mask_dma4;
   	     page0_value_dma   <=   page0_value_dma4;
   	     page0_reloc_dma     <= page0_reloc_dma4;
   	     page0_valid_dma    <=  page0_valid_dma4;
   	     page1_mask_dma     <=  page1_mask_dma4;
   	     page1_value_dma    <=  page1_value_dma4;
   	     page1_reloc_dma    <=  page1_reloc_dma4;
   	     page1_valid_dma    <=  page1_valid_dma4;
	    end
 `DMA_CHANNEL_THREE: begin 
	     mbox_address <= tx_dma_cfg_dma3_mbaddr;
	     page_handle  <= dmc_txc_dma3_page_handle;
	     func_num  <= dmc_txc_dma3_func_num;
   	     page0_mask_dma  <=     page0_mask_dma3;
   	     page0_value_dma   <=   page0_value_dma3;
   	     page0_reloc_dma     <= page0_reloc_dma3;
   	     page0_valid_dma    <=  page0_valid_dma3;
   	     page1_mask_dma     <=  page1_mask_dma3;
   	     page1_value_dma    <=  page1_value_dma3;
   	     page1_reloc_dma    <=  page1_reloc_dma3;
   	     page1_valid_dma    <=  page1_valid_dma3;
	    end
 `DMA_CHANNEL_TWO: begin 
	     mbox_address <= tx_dma_cfg_dma2_mbaddr;
	     page_handle  <= dmc_txc_dma2_page_handle;
	     func_num  <= dmc_txc_dma2_func_num;
   	     page0_mask_dma  <=     page0_mask_dma2;
   	     page0_value_dma   <=   page0_value_dma2;
   	     page0_reloc_dma     <= page0_reloc_dma2;
   	     page0_valid_dma    <=  page0_valid_dma2;
   	     page1_mask_dma     <=  page1_mask_dma2;
   	     page1_value_dma    <=  page1_value_dma2;
   	     page1_reloc_dma    <=  page1_reloc_dma2;
   	     page1_valid_dma    <=  page1_valid_dma2;
	    end
 `DMA_CHANNEL_ONE: begin 
	     mbox_address <= tx_dma_cfg_dma1_mbaddr;
	     page_handle  <= dmc_txc_dma1_page_handle;
	     func_num  <= dmc_txc_dma1_func_num;
   	     page0_mask_dma  <=     page0_mask_dma1;
   	     page0_value_dma   <=   page0_value_dma1;
   	     page0_reloc_dma     <= page0_reloc_dma1;
   	     page0_valid_dma    <=  page0_valid_dma1;
   	     page1_mask_dma     <=  page1_mask_dma1;
   	     page1_value_dma    <=  page1_value_dma1;
   	     page1_reloc_dma    <=  page1_reloc_dma1;
   	     page1_valid_dma    <=  page1_valid_dma1;
	    end
 `DMA_CHANNEL_ZERO: begin 
	     mbox_address <= tx_dma_cfg_dma0_mbaddr;
	     page_handle  <= dmc_txc_dma0_page_handle;
	     func_num  <= dmc_txc_dma0_func_num;
   	     page0_mask_dma  <=     page0_mask_dma0;
   	     page0_value_dma   <=   page0_value_dma0;
   	     page0_reloc_dma     <= page0_reloc_dma0;
   	     page0_valid_dma    <=  page0_valid_dma0;
   	     page1_mask_dma     <=  page1_mask_dma0;
   	     page1_value_dma    <=  page1_value_dma0;
   	     page1_reloc_dma    <=  page1_reloc_dma0;
   	     page1_valid_dma    <=  page1_valid_dma0;
	    end
	      default: begin
		 mbox_address <= 38'h0;
		 page1_valid_dma <= 1'b0;
		 page0_valid_dma <= 1'b0;
		 page_handle <= 20'h0;
		 func_num <= 2'h0;
	      end // case: default
	      
	    endcase // case(mbox_dma_num)
	 end
	 
      end // else: !if(!Reset_L)
      
   end

   // Write Ack State Machine



   reg cmd_err_status;
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 mbox_ack_state <= ACK_IDLE;
	 resp_dma_num <= 5'h0;
	 dmc_meta_ack_accept <= 1'b0;
	 send_ack_received <= 1'b0;
	 cmd_received <= 8'h0;
	 mbox_err_received <= 1'b0;
	 cmd_err_status <= 1'b0;
      end else begin
	 case(mbox_ack_state) // synopsys full_case parallel_case
	   ACK_IDLE: begin
	      send_ack_received <= 1'b0;
	      mbox_err_received <= 1'b0;
	      cmd_err_status <= 1'b0;
	      if(meta_dmc_ack_ready & meta_dmc_ack_client) begin
		 resp_dma_num <= meta_dmc_ack_dma_num;
		 dmc_meta_ack_accept <= 1'b1;
		 mbox_ack_state <= WAIT_FOR_COMPLETE;
		 cmd_received <= meta_dmc_ack_cmd;
		 cmd_err_status <= (meta_dmc_ack_cmd_status== 4'hf);
	      end // if (meta_ack_ready & meta_ack_client)
	   end
	   WAIT_FOR_COMPLETE: begin
	      dmc_meta_ack_accept <= 1'b0;
	      if(meta_dmc_ack_complete & meta_dmc_ack_client) begin
		 if(( cmd_received == 8'h6/*COMMAND FOR MBOX ACK*/) & ~cmd_err_status) begin
		    mbox_ack_state <= ACK_IDLE;
		    send_ack_received <= 1'b1;
		    mbox_err_received <= 1'b0;
		 end else if ( cmd_err_status) begin // FIX THIS
		    mbox_ack_state <= ACK_IDLE;
		    send_ack_received <= 1'b0;
		    mbox_err_received <= 1'b1;
		 end else begin 
		    mbox_ack_state <= ACK_IDLE;
		    send_ack_received <= 1'b1;
		    mbox_err_received <= 1'b1;
		 end // else: !if(cmd_received == `RESP_ERROR)
	      end // if (meta_ack_complete & meta_ack_client)
	   end
	   default: begin
		   mbox_ack_state <= ACK_IDLE;
	   end
	 endcase // case(mbox_ack_state)
      end // else: !if(!Reset_L)
   end // always@ (posedge SysClk)

   always@(resp_dma_num or mbox_err_received) begin
      if(mbox_err_received) begin
	 case(resp_dma_num) // synopsys full_case parallel_case
	   `DMA_CHANNEL_ZERO:mbox_ack_dma_err_received = `NO_OF_DMAS'h1;
	   `DMA_CHANNEL_ONE:mbox_ack_dma_err_received = `NO_OF_DMAS'h2;
	   `DMA_CHANNEL_TWO:mbox_ack_dma_err_received = `NO_OF_DMAS'h4;
	   `DMA_CHANNEL_THREE:mbox_ack_dma_err_received = `NO_OF_DMAS'h8;
	   `DMA_CHANNEL_FOUR:mbox_ack_dma_err_received = `NO_OF_DMAS'h10;
	   `DMA_CHANNEL_FIVE:mbox_ack_dma_err_received = `NO_OF_DMAS'h20;
	   `DMA_CHANNEL_SIX:mbox_ack_dma_err_received = `NO_OF_DMAS'h40;
	   `DMA_CHANNEL_SEVEN:mbox_ack_dma_err_received = `NO_OF_DMAS'h80;
	   `DMA_CHANNEL_EIGHT:mbox_ack_dma_err_received = `NO_OF_DMAS'h100;
	   `DMA_CHANNEL_NINE:mbox_ack_dma_err_received = `NO_OF_DMAS'h200;
	   `DMA_CHANNEL_TEN:mbox_ack_dma_err_received = `NO_OF_DMAS'h400;
	   `DMA_CHANNEL_ELEVEN:mbox_ack_dma_err_received = `NO_OF_DMAS'h800;
	   `DMA_CHANNEL_TWELVE:mbox_ack_dma_err_received = `NO_OF_DMAS'h1000;
	   `DMA_CHANNEL_THIRTEEN:mbox_ack_dma_err_received = `NO_OF_DMAS'h2000;
	   `DMA_CHANNEL_FOURTEEN:mbox_ack_dma_err_received = `NO_OF_DMAS'h4000;
	   `DMA_CHANNEL_FIFTEEN:mbox_ack_dma_err_received = `NO_OF_DMAS'h8000;
`ifdef NEPTUNE
	   `DMA_CHANNEL_SIXTEEN:mbox_ack_dma_err_received = `NO_OF_DMAS'h10000;
	   `DMA_CHANNEL_SEVENTEEN:mbox_ack_dma_err_received = `NO_OF_DMAS'h20000;
	   `DMA_CHANNEL_EIGHTEEN:mbox_ack_dma_err_received = `NO_OF_DMAS'h40000;
	   `DMA_CHANNEL_NINETEEN:mbox_ack_dma_err_received = `NO_OF_DMAS'h80000;
	   `DMA_CHANNEL_TWENTY:mbox_ack_dma_err_received = `NO_OF_DMAS'h100000;
	   `DMA_CHANNEL_TWENTYONE:mbox_ack_dma_err_received = `NO_OF_DMAS'h200000;
	   `DMA_CHANNEL_TWENTYTWO:mbox_ack_dma_err_received = `NO_OF_DMAS'h400000;
	   `DMA_CHANNEL_TWENTYTHREE:mbox_ack_dma_err_received =`NO_OF_DMAS'h800000 ;
`else
`endif
	   
	   default: mbox_ack_dma_err_received = `NO_OF_DMAS'h0;
	   // Add error status also
	 endcase // case(resp_dma_num)
      end else begin // if (mbox_err_received)
	 mbox_ack_dma_err_received = `NO_OF_DMAS'h0;
      end // else: !if(send_ack_received)
      
   end // always@ (resp_dma_num or send_ack_received)

     always@(resp_dma_num or send_ack_received) begin
      if(send_ack_received) begin
	 case(resp_dma_num) // synopsys full_case parallel_case
	   `DMA_CHANNEL_ZERO:mbox_ack_dma_received = `NO_OF_DMAS'h1;
	   `DMA_CHANNEL_ONE:mbox_ack_dma_received = `NO_OF_DMAS'h2;
	   `DMA_CHANNEL_TWO:mbox_ack_dma_received = `NO_OF_DMAS'h4;
	   `DMA_CHANNEL_THREE:mbox_ack_dma_received = `NO_OF_DMAS'h8;
	   `DMA_CHANNEL_FOUR:mbox_ack_dma_received = `NO_OF_DMAS'h10;
	   `DMA_CHANNEL_FIVE:mbox_ack_dma_received = `NO_OF_DMAS'h20;
	   `DMA_CHANNEL_SIX:mbox_ack_dma_received = `NO_OF_DMAS'h40;
	   `DMA_CHANNEL_SEVEN:mbox_ack_dma_received = `NO_OF_DMAS'h80;
	   `DMA_CHANNEL_EIGHT:mbox_ack_dma_received = `NO_OF_DMAS'h100;
	   `DMA_CHANNEL_NINE:mbox_ack_dma_received = `NO_OF_DMAS'h200;
	   `DMA_CHANNEL_TEN:mbox_ack_dma_received = `NO_OF_DMAS'h400;
	   `DMA_CHANNEL_ELEVEN:mbox_ack_dma_received = `NO_OF_DMAS'h800;
	   `DMA_CHANNEL_TWELVE:mbox_ack_dma_received = `NO_OF_DMAS'h1000;
	   `DMA_CHANNEL_THIRTEEN:mbox_ack_dma_received = `NO_OF_DMAS'h2000;
	   `DMA_CHANNEL_FOURTEEN:mbox_ack_dma_received = `NO_OF_DMAS'h4000;
	   `DMA_CHANNEL_FIFTEEN:mbox_ack_dma_received = `NO_OF_DMAS'h8000;
`ifdef NEPTUNE
	   `DMA_CHANNEL_SIXTEEN:mbox_ack_dma_received = `NO_OF_DMAS'h10000;
	   `DMA_CHANNEL_SEVENTEEN:mbox_ack_dma_received = `NO_OF_DMAS'h20000;
	   `DMA_CHANNEL_EIGHTEEN:mbox_ack_dma_received = `NO_OF_DMAS'h40000;
	   `DMA_CHANNEL_NINETEEN:mbox_ack_dma_received = `NO_OF_DMAS'h80000;
	   `DMA_CHANNEL_TWENTY:mbox_ack_dma_received = `NO_OF_DMAS'h100000;
	   `DMA_CHANNEL_TWENTYONE:mbox_ack_dma_received = `NO_OF_DMAS'h200000;
	   `DMA_CHANNEL_TWENTYTWO:mbox_ack_dma_received = `NO_OF_DMAS'h400000;
	   `DMA_CHANNEL_TWENTYTHREE:mbox_ack_dma_received =`NO_OF_DMAS'h800000 ;

`else
`endif
	   default: mbox_ack_dma_received = `NO_OF_DMAS'h0;
	   // Add error status also
	 endcase // case(resp_dma_num)
      end else begin // if (send_ack_received)
	 mbox_ack_dma_received = `NO_OF_DMAS'h0;
      end // else: !if(send_ack_received)
      
   end // always@ (resp_dma_num or send_ack_received)
   

`ifdef NEPTUNE 
   assign {
	   mbox_ack_dma23_received, mbox_ack_dma22_received, mbox_ack_dma21_received, mbox_ack_dma20_received,
           mbox_ack_dma19_received, mbox_ack_dma18_received, mbox_ack_dma17_received, mbox_ack_dma16_received,
	   mbox_ack_dma15_received, mbox_ack_dma14_received, mbox_ack_dma13_received, mbox_ack_dma12_received,
	   mbox_ack_dma11_received, mbox_ack_dma10_received, mbox_ack_dma9_received, mbox_ack_dma8_received,
	   mbox_ack_dma7_received, mbox_ack_dma6_received, mbox_ack_dma5_received, mbox_ack_dma4_received,
	   mbox_ack_dma3_received, mbox_ack_dma2_received, mbox_ack_dma1_received, mbox_ack_dma0_received } = mbox_ack_dma_received;
   
   assign {
	   mbox_dma23_scheduled, mbox_dma22_scheduled, mbox_dma21_scheduled, mbox_dma20_scheduled,
	   mbox_dma19_scheduled, mbox_dma18_scheduled, mbox_dma17_scheduled, mbox_dma16_scheduled,
	   mbox_dma15_scheduled, mbox_dma14_scheduled, mbox_dma13_scheduled, mbox_dma12_scheduled,
	   mbox_dma11_scheduled, mbox_dma10_scheduled, mbox_dma9_scheduled, mbox_dma8_scheduled,
	   mbox_dma7_scheduled, mbox_dma6_scheduled, mbox_dma5_scheduled, mbox_dma4_scheduled,
	   mbox_dma3_scheduled, mbox_dma2_scheduled, mbox_dma1_scheduled, mbox_dma0_scheduled } = mbox_dma_scheduled;
   
   
   assign {
	   done_mbox_dma23, done_mbox_dma22, done_mbox_dma21, done_mbox_dma20,
	   done_mbox_dma19, done_mbox_dma18, done_mbox_dma17, done_mbox_dma16,
	   done_mbox_dma15, done_mbox_dma14, done_mbox_dma13, done_mbox_dma12,
	   done_mbox_dma11, done_mbox_dma10, done_mbox_dma9, done_mbox_dma8,
	   done_mbox_dma7, done_mbox_dma6, done_mbox_dma5, done_mbox_dma4,
	   done_mbox_dma3, done_mbox_dma2, done_mbox_dma1, done_mbox_dma0 } = done_mbox_update;
`else // !ifdef NEPTUNE
     assign {
	   mbox_ack_dma15_received, mbox_ack_dma14_received, mbox_ack_dma13_received, mbox_ack_dma12_received,
	   mbox_ack_dma11_received, mbox_ack_dma10_received, mbox_ack_dma9_received, mbox_ack_dma8_received,
	   mbox_ack_dma7_received, mbox_ack_dma6_received, mbox_ack_dma5_received, mbox_ack_dma4_received,
	   mbox_ack_dma3_received, mbox_ack_dma2_received, mbox_ack_dma1_received, mbox_ack_dma0_received } = mbox_ack_dma_received;
   
   assign {
	   mbox_dma15_scheduled, mbox_dma14_scheduled, mbox_dma13_scheduled, mbox_dma12_scheduled,
	   mbox_dma11_scheduled, mbox_dma10_scheduled, mbox_dma9_scheduled, mbox_dma8_scheduled,
	   mbox_dma7_scheduled, mbox_dma6_scheduled, mbox_dma5_scheduled, mbox_dma4_scheduled,
	   mbox_dma3_scheduled, mbox_dma2_scheduled, mbox_dma1_scheduled, mbox_dma0_scheduled } = mbox_dma_scheduled;
   
   
   assign {
	   done_mbox_dma15, done_mbox_dma14, done_mbox_dma13, done_mbox_dma12,
	   done_mbox_dma11, done_mbox_dma10, done_mbox_dma9, done_mbox_dma8,
	   done_mbox_dma7, done_mbox_dma6, done_mbox_dma5, done_mbox_dma4,
	   done_mbox_dma3, done_mbox_dma2, done_mbox_dma1, done_mbox_dma0 } = done_mbox_update;

`endif


      // page translation logic -

   wire [43:0] dma_mbox_addr = {mbox_address,6'h0};
  
   always@(posedge SysClk) begin
      if (!Reset_L) begin
	 page_xlate_state <= PAGE_XLATE_IDLE;
	 xlate_done <= 1'b0;
	 page0_match <= 1'b0;
	 page1_match <= 1'b0;
	 set_mbox_part_error <= 1'b0;
      end else begin
	 case(page_xlate_state) // synopsys parallel_case
	   PAGE_XLATE_IDLE: begin
	      xlate_done <= 1'b0;
	      if(start_page_xlate) begin
		 xlate_mbaddr<= dma_mbox_addr;
		 if( ~page0_valid_dma & ~page1_valid_dma ) begin
		    // Set ERROR Flags?
		    set_mbox_part_error <= 1'b1;
		    page_xlate_state <= PAGE_XLATE_ERROR;  

		 end else begin // if ( ~page0_valid_dma & ~page1_valid_dma )
		    page_xlate_state <= CHECK_PAGE_STATUS;
		    page0_reloc_addr <=  ((dma_mbox_addr[43:12] & ~page0_mask_dma) | 
					  ( page0_reloc_dma & page0_mask_dma)) ;
		    page0_match <= page0_valid_dma & 
				   ((page0_mask_dma & dma_mbox_addr [43:12] ) ==  page0_value_dma );
		    
		    page1_reloc_addr <=  ((dma_mbox_addr[43:12] & ~page1_mask_dma) | 
					  ( page1_reloc_dma & page1_mask_dma)) ;
		    
		    page1_match <= page1_valid_dma & 
				   ((page1_mask_dma & dma_mbox_addr [43:12] ) ==  page1_value_dma ); 

		 end // else: !if( ~page0_valid_dma & ~page1_valid_dma )
	      end // if (start_page_xlate)
	   end // case: PAGE_XLATE_IDLE
	   CHECK_PAGE_STATUS: begin
	      if(page0_match) begin
		 xlate_done <= 1'b1;
		 xlate_mbaddr <= {page0_reloc_addr,dma_mbox_addr[11:0]};
		 page_xlate_state <= PAGE_XLATE_DONE;  
	      end else if(page1_match) begin
		 xlate_done <= 1'b1;
		 xlate_mbaddr <= {page1_reloc_addr,dma_mbox_addr[11:0]};
		 page_xlate_state <= PAGE_XLATE_DONE;  
	      end else begin
		 set_mbox_part_error <= 1'b1;
		 page_xlate_state <= PAGE_XLATE_ERROR;   
	      end
	   end // case: CHECK_PAGE_STATUS
	   PAGE_XLATE_ERROR: begin
	      // Go back to IDLE -- for now
	      set_mbox_part_error <= 1'b1;
	      xlate_done <= 1'b0;
	      page_xlate_state <= PAGE_XLATE_DONE;
	      // synopsys translate_off
	      $display(" %m: Warning-- Page translation failure Time - %t",$time);
	      // synopsys translate_on
	   end
	   PAGE_XLATE_DONE: begin
	      set_mbox_part_error <= 1'b0;
	      page_xlate_state <= PAGE_XLATE_IDLE;
	   end // case: PAGE_XLATE_DONE
	   // default: begin
	      // page_xlate_state <= 4'hx;
	      // xlate_mbaddr<= 44'hx;
	   // end
	 endcase // case(page_xlate_state)
      end // else: !if(!Reset_L)
   end // always@ (posedge SysClk)
    
   
endmodule // niu_tdmc_sendmbox


