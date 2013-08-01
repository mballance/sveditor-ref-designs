// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_tdmc_mbox.v
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
 *  NIU TDMC  MailBox Processing Block
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

module niu_tdmc_mbox (/*AUTOJUNK*/
   // Outputs
   tdmc_arb0_data, tdmc_arb0_data_valid, tdmc_arb0_req, 
   tdmc_arb0_req_address, tdmc_arb0_req_byteenable, 
   tdmc_arb0_req_cmd, tdmc_arb0_req_dma_num, tdmc_arb0_req_length, 
   tdmc_arb0_req_port_num, tdmc_arb0_status, 
   tdmc_arb0_transfer_complete, tdmc_arb0_req_func_num, 
   dmc_meta_ack_accept, mbox_ack_dma_err_received, mbox_err_received, 
   set_mbox_part_error_dma,mbox_debug_state,  clear_cfg_dma0_mb, set_cfg_dma0_mmk, 
   clear_cfg_dma1_mb, set_cfg_dma1_mmk, clear_cfg_dma2_mb, 
   set_cfg_dma2_mmk, clear_cfg_dma3_mb, set_cfg_dma3_mmk, 
   clear_cfg_dma4_mb, set_cfg_dma4_mmk, clear_cfg_dma5_mb, 
   set_cfg_dma5_mmk, clear_cfg_dma6_mb, set_cfg_dma6_mmk, 
   clear_cfg_dma7_mb, set_cfg_dma7_mmk, clear_cfg_dma8_mb, 
   set_cfg_dma8_mmk, clear_cfg_dma9_mb, set_cfg_dma9_mmk, 
   clear_cfg_dma10_mb, set_cfg_dma10_mmk, clear_cfg_dma11_mb, 
   set_cfg_dma11_mmk, clear_cfg_dma12_mb, set_cfg_dma12_mmk, 
   clear_cfg_dma13_mb, set_cfg_dma13_mmk, clear_cfg_dma14_mb, 
   set_cfg_dma14_mmk, clear_cfg_dma15_mb, set_cfg_dma15_mmk, 
`ifdef NEPTUNE
		      
   clear_cfg_dma16_mb, set_cfg_dma16_mmk, clear_cfg_dma17_mb, 
   set_cfg_dma17_mmk, clear_cfg_dma18_mb, set_cfg_dma18_mmk, 
   clear_cfg_dma19_mb, set_cfg_dma19_mmk, clear_cfg_dma20_mb, 
   set_cfg_dma20_mmk, clear_cfg_dma21_mb, set_cfg_dma21_mmk, 
   clear_cfg_dma22_mb, set_cfg_dma22_mmk, clear_cfg_dma23_mb, 
   set_cfg_dma23_mmk,  
`else
`endif // !ifdef CHANNELS_16

   set_cfg_dma0_mk, 
   set_cfg_dma1_mk, set_cfg_dma2_mk, set_cfg_dma3_mk, 
   set_cfg_dma4_mk, set_cfg_dma5_mk, set_cfg_dma6_mk, 
   set_cfg_dma7_mk, set_cfg_dma8_mk, set_cfg_dma9_mk, 
   set_cfg_dma10_mk, set_cfg_dma11_mk, set_cfg_dma12_mk, 
   set_cfg_dma13_mk, set_cfg_dma14_mk, set_cfg_dma15_mk, 
`ifdef NEPTUNE
   set_cfg_dma16_mk, set_cfg_dma17_mk, set_cfg_dma18_mk, 
   set_cfg_dma19_mk, set_cfg_dma20_mk, set_cfg_dma21_mk, 
   set_cfg_dma22_mk, set_cfg_dma23_mk, 
`else
`endif // !ifdef CHANNELS_16
		      
   // Inputs
   SysClk, Reset_L, arb0_tdmc_data_req, arb0_tdmc_req_accept, 
   meta_dmc_ack_ready, meta_dmc_ack_cmd, meta_dmc_ack_dma_num, 
   meta_dmc_ack_client, meta_dmc_ack_complete, 
   meta_dmc_ack_cmd_status, txc_dmc_dma0_mark_bit, tx_cfg_dma0_mk, 
   tx_cfg_dma0_mmk, tx_cfg_dma0_enable_mb, tx_cs_dma0, 
   tx_dma0_pre_st, tx_rng_head_dma0, tx_rng_tail_dma0, 
   tx_dma0_rng_err_logh, tx_dma0_rng_err_logl, 
   dmc_txc_dma0_page_handle, tx_dma_cfg_dma0_mbaddr, page0_mask_dma0, 
   page0_value_dma0, page0_reloc_dma0, page0_valid_dma0, 
   page1_mask_dma0, page1_value_dma0, page1_reloc_dma0, 
   page1_valid_dma0, txc_dmc_dma1_mark_bit, tx_cfg_dma1_mk, 
   tx_cfg_dma1_mmk, tx_cfg_dma1_enable_mb, tx_cs_dma1, 
   tx_dma1_pre_st, tx_rng_head_dma1, tx_rng_tail_dma1, 
   tx_dma1_rng_err_logh, tx_dma1_rng_err_logl, 
   dmc_txc_dma1_page_handle, tx_dma_cfg_dma1_mbaddr, page0_mask_dma1, 
   page0_value_dma1, page0_reloc_dma1, page0_valid_dma1, 
   page1_mask_dma1, page1_value_dma1, page1_reloc_dma1, 
   page1_valid_dma1, txc_dmc_dma2_mark_bit, tx_cfg_dma2_mk, 
   tx_cfg_dma2_mmk, tx_cfg_dma2_enable_mb, tx_cs_dma2, 
   tx_dma2_pre_st, tx_rng_head_dma2, tx_rng_tail_dma2, 
   tx_dma2_rng_err_logh, tx_dma2_rng_err_logl, 
   dmc_txc_dma2_page_handle, tx_dma_cfg_dma2_mbaddr, page0_mask_dma2, 
   page0_value_dma2, page0_reloc_dma2, page0_valid_dma2, 
   page1_mask_dma2, page1_value_dma2, page1_reloc_dma2, 
   page1_valid_dma2, txc_dmc_dma3_mark_bit, tx_cfg_dma3_mk, 
   tx_cfg_dma3_mmk, tx_cfg_dma3_enable_mb, tx_cs_dma3, 
   tx_dma3_pre_st, tx_rng_head_dma3, tx_rng_tail_dma3, 
   tx_dma3_rng_err_logh, tx_dma3_rng_err_logl, 
   dmc_txc_dma3_page_handle, tx_dma_cfg_dma3_mbaddr, page0_mask_dma3, 
   page0_value_dma3, page0_reloc_dma3, page0_valid_dma3, 
   page1_mask_dma3, page1_value_dma3, page1_reloc_dma3, 
   page1_valid_dma3, txc_dmc_dma4_mark_bit, tx_cfg_dma4_mk, 
   tx_cfg_dma4_mmk, tx_cfg_dma4_enable_mb, tx_cs_dma4, 
   tx_dma4_pre_st, tx_rng_head_dma4, tx_rng_tail_dma4, 
   tx_dma4_rng_err_logh, tx_dma4_rng_err_logl, 
   dmc_txc_dma4_page_handle, tx_dma_cfg_dma4_mbaddr, page0_mask_dma4, 
   page0_value_dma4, page0_reloc_dma4, page0_valid_dma4, 
   page1_mask_dma4, page1_value_dma4, page1_reloc_dma4, 
   page1_valid_dma4, txc_dmc_dma5_mark_bit, tx_cfg_dma5_mk, 
   tx_cfg_dma5_mmk, tx_cfg_dma5_enable_mb, tx_cs_dma5, 
   tx_dma5_pre_st, tx_rng_head_dma5, tx_rng_tail_dma5, 
   tx_dma5_rng_err_logh, tx_dma5_rng_err_logl, 
   dmc_txc_dma5_page_handle, tx_dma_cfg_dma5_mbaddr, page0_mask_dma5, 
   page0_value_dma5, page0_reloc_dma5, page0_valid_dma5, 
   page1_mask_dma5, page1_value_dma5, page1_reloc_dma5, 
   page1_valid_dma5, txc_dmc_dma6_mark_bit, tx_cfg_dma6_mk, 
   tx_cfg_dma6_mmk, tx_cfg_dma6_enable_mb, tx_cs_dma6, 
   tx_dma6_pre_st, tx_rng_head_dma6, tx_rng_tail_dma6, 
   tx_dma6_rng_err_logh, tx_dma6_rng_err_logl, 
   dmc_txc_dma6_page_handle, tx_dma_cfg_dma6_mbaddr, page0_mask_dma6, 
   page0_value_dma6, page0_reloc_dma6, page0_valid_dma6, 
   page1_mask_dma6, page1_value_dma6, page1_reloc_dma6, 
   page1_valid_dma6, txc_dmc_dma7_mark_bit, tx_cfg_dma7_mk, 
   tx_cfg_dma7_mmk, tx_cfg_dma7_enable_mb, tx_cs_dma7, 
   tx_dma7_pre_st, tx_rng_head_dma7, tx_rng_tail_dma7, 
   tx_dma7_rng_err_logh, tx_dma7_rng_err_logl, 
   dmc_txc_dma7_page_handle, tx_dma_cfg_dma7_mbaddr, page0_mask_dma7, 
   page0_value_dma7, page0_reloc_dma7, page0_valid_dma7, 
   page1_mask_dma7, page1_value_dma7, page1_reloc_dma7, 
   page1_valid_dma7, txc_dmc_dma8_mark_bit, tx_cfg_dma8_mk, 
   tx_cfg_dma8_mmk, tx_cfg_dma8_enable_mb, tx_cs_dma8, 
   tx_dma8_pre_st, tx_rng_head_dma8, tx_rng_tail_dma8, 
   tx_dma8_rng_err_logh, tx_dma8_rng_err_logl, 
   dmc_txc_dma8_page_handle, tx_dma_cfg_dma8_mbaddr, page0_mask_dma8, 
   page0_value_dma8, page0_reloc_dma8, page0_valid_dma8, 
   page1_mask_dma8, page1_value_dma8, page1_reloc_dma8, 
   page1_valid_dma8, txc_dmc_dma9_mark_bit, tx_cfg_dma9_mk, 
   tx_cfg_dma9_mmk, tx_cfg_dma9_enable_mb, tx_cs_dma9, 
   tx_dma9_pre_st, tx_rng_head_dma9, tx_rng_tail_dma9, 
   tx_dma9_rng_err_logh, tx_dma9_rng_err_logl, 
   dmc_txc_dma9_page_handle, tx_dma_cfg_dma9_mbaddr, page0_mask_dma9, 
   page0_value_dma9, page0_reloc_dma9, page0_valid_dma9, 
   page1_mask_dma9, page1_value_dma9, page1_reloc_dma9, 
   page1_valid_dma9, txc_dmc_dma10_mark_bit, tx_cfg_dma10_mk, 
   tx_cfg_dma10_mmk, tx_cfg_dma10_enable_mb, tx_cs_dma10, 
   tx_dma10_pre_st, tx_rng_head_dma10, tx_rng_tail_dma10, 
   tx_dma10_rng_err_logh, tx_dma10_rng_err_logl, 
   dmc_txc_dma10_page_handle, tx_dma_cfg_dma10_mbaddr, 
   page0_mask_dma10, page0_value_dma10, page0_reloc_dma10, 
   page0_valid_dma10, page1_mask_dma10, page1_value_dma10, 
   page1_reloc_dma10, page1_valid_dma10, txc_dmc_dma11_mark_bit, 
   tx_cfg_dma11_mk, tx_cfg_dma11_mmk, tx_cfg_dma11_enable_mb, 
   tx_cs_dma11, tx_dma11_pre_st, tx_rng_head_dma11, 
   tx_rng_tail_dma11, tx_dma11_rng_err_logh, tx_dma11_rng_err_logl, 
   dmc_txc_dma11_page_handle, tx_dma_cfg_dma11_mbaddr, 
   page0_mask_dma11, page0_value_dma11, page0_reloc_dma11, 
   page0_valid_dma11, page1_mask_dma11, page1_value_dma11, 
   page1_reloc_dma11, page1_valid_dma11, txc_dmc_dma12_mark_bit, 
   tx_cfg_dma12_mk, tx_cfg_dma12_mmk, tx_cfg_dma12_enable_mb, 
   tx_cs_dma12, tx_dma12_pre_st, tx_rng_head_dma12, 
   tx_rng_tail_dma12, tx_dma12_rng_err_logh, tx_dma12_rng_err_logl, 
   dmc_txc_dma12_page_handle, tx_dma_cfg_dma12_mbaddr, 
   page0_mask_dma12, page0_value_dma12, page0_reloc_dma12, 
   page0_valid_dma12, page1_mask_dma12, page1_value_dma12, 
   page1_reloc_dma12, page1_valid_dma12, txc_dmc_dma13_mark_bit, 
   tx_cfg_dma13_mk, tx_cfg_dma13_mmk, tx_cfg_dma13_enable_mb, 
   tx_cs_dma13, tx_dma13_pre_st, tx_rng_head_dma13, 
   tx_rng_tail_dma13, tx_dma13_rng_err_logh, tx_dma13_rng_err_logl, 
   dmc_txc_dma13_page_handle, tx_dma_cfg_dma13_mbaddr, 
   page0_mask_dma13, page0_value_dma13, page0_reloc_dma13, 
   page0_valid_dma13, page1_mask_dma13, page1_value_dma13, 
   page1_reloc_dma13, page1_valid_dma13, txc_dmc_dma14_mark_bit, 
   tx_cfg_dma14_mk, tx_cfg_dma14_mmk, tx_cfg_dma14_enable_mb, 
   tx_cs_dma14, tx_dma14_pre_st, tx_rng_head_dma14, 
   tx_rng_tail_dma14, tx_dma14_rng_err_logh, tx_dma14_rng_err_logl, 
   dmc_txc_dma14_page_handle, tx_dma_cfg_dma14_mbaddr, 
   page0_mask_dma14, page0_value_dma14, page0_reloc_dma14, 
   page0_valid_dma14, page1_mask_dma14, page1_value_dma14, 
   page1_reloc_dma14, page1_valid_dma14, txc_dmc_dma15_mark_bit, 
   tx_cfg_dma15_mk, tx_cfg_dma15_mmk, tx_cfg_dma15_enable_mb, 
   tx_cs_dma15, tx_dma15_pre_st, tx_rng_head_dma15, 
   tx_rng_tail_dma15, tx_dma15_rng_err_logh, tx_dma15_rng_err_logl, 
   dmc_txc_dma15_page_handle, tx_dma_cfg_dma15_mbaddr, 
   page0_mask_dma15, page0_value_dma15, page0_reloc_dma15, 
   page0_valid_dma15, page1_mask_dma15, page1_value_dma15, 
   page1_reloc_dma15, page1_valid_dma15,
`ifdef NEPTUNE
		      

   txc_dmc_dma16_mark_bit, 
   tx_cfg_dma16_mk, tx_cfg_dma16_mmk, tx_cfg_dma16_enable_mb, 
   tx_cs_dma16, tx_dma16_pre_st, tx_rng_head_dma16, 
   tx_rng_tail_dma16, tx_dma16_rng_err_logh, tx_dma16_rng_err_logl, 
   dmc_txc_dma16_page_handle, tx_dma_cfg_dma16_mbaddr, 
   page0_mask_dma16, page0_value_dma16, page0_reloc_dma16, 
   page0_valid_dma16, page1_mask_dma16, page1_value_dma16, 
   page1_reloc_dma16, page1_valid_dma16, txc_dmc_dma17_mark_bit, 
   tx_cfg_dma17_mk, tx_cfg_dma17_mmk, tx_cfg_dma17_enable_mb, 
   tx_cs_dma17, tx_dma17_pre_st, tx_rng_head_dma17, 
   tx_rng_tail_dma17, tx_dma17_rng_err_logh, tx_dma17_rng_err_logl, 
   dmc_txc_dma17_page_handle, tx_dma_cfg_dma17_mbaddr, 
   page0_mask_dma17, page0_value_dma17, page0_reloc_dma17, 
   page0_valid_dma17, page1_mask_dma17, page1_value_dma17, 
   page1_reloc_dma17, page1_valid_dma17, txc_dmc_dma18_mark_bit, 
   tx_cfg_dma18_mk, tx_cfg_dma18_mmk, tx_cfg_dma18_enable_mb, 
   tx_cs_dma18, tx_dma18_pre_st, tx_rng_head_dma18, 
   tx_rng_tail_dma18, tx_dma18_rng_err_logh, tx_dma18_rng_err_logl, 
   dmc_txc_dma18_page_handle, tx_dma_cfg_dma18_mbaddr, 
   page0_mask_dma18, page0_value_dma18, page0_reloc_dma18, 
   page0_valid_dma18, page1_mask_dma18, page1_value_dma18, 
   page1_reloc_dma18, page1_valid_dma18, txc_dmc_dma19_mark_bit, 
   tx_cfg_dma19_mk, tx_cfg_dma19_mmk, tx_cfg_dma19_enable_mb, 
   tx_cs_dma19, tx_dma19_pre_st, tx_rng_head_dma19, 
   tx_rng_tail_dma19, tx_dma19_rng_err_logh, tx_dma19_rng_err_logl, 
   dmc_txc_dma19_page_handle, tx_dma_cfg_dma19_mbaddr, 
   page0_mask_dma19, page0_value_dma19, page0_reloc_dma19, 
   page0_valid_dma19, page1_mask_dma19, page1_value_dma19, 
   page1_reloc_dma19, page1_valid_dma19, txc_dmc_dma20_mark_bit, 
   tx_cfg_dma20_mk, tx_cfg_dma20_mmk, tx_cfg_dma20_enable_mb, 
   tx_cs_dma20, tx_dma20_pre_st, tx_rng_head_dma20, 
   tx_rng_tail_dma20, tx_dma20_rng_err_logh, tx_dma20_rng_err_logl, 
   dmc_txc_dma20_page_handle, tx_dma_cfg_dma20_mbaddr, 
   page0_mask_dma20, page0_value_dma20, page0_reloc_dma20, 
   page0_valid_dma20, page1_mask_dma20, page1_value_dma20, 
   page1_reloc_dma20, page1_valid_dma20, txc_dmc_dma21_mark_bit, 
   tx_cfg_dma21_mk, tx_cfg_dma21_mmk, tx_cfg_dma21_enable_mb, 
   tx_cs_dma21, tx_dma21_pre_st, tx_rng_head_dma21, 
   tx_rng_tail_dma21, tx_dma21_rng_err_logh, tx_dma21_rng_err_logl, 
   dmc_txc_dma21_page_handle, tx_dma_cfg_dma21_mbaddr, 
   page0_mask_dma21, page0_value_dma21, page0_reloc_dma21, 
   page0_valid_dma21, page1_mask_dma21, page1_value_dma21, 
   page1_reloc_dma21, page1_valid_dma21, txc_dmc_dma22_mark_bit, 
   tx_cfg_dma22_mk, tx_cfg_dma22_mmk, tx_cfg_dma22_enable_mb, 
   tx_cs_dma22, tx_dma22_pre_st, tx_rng_head_dma22, 
   tx_rng_tail_dma22, tx_dma22_rng_err_logh, tx_dma22_rng_err_logl, 
   dmc_txc_dma22_page_handle, tx_dma_cfg_dma22_mbaddr, 
   page0_mask_dma22, page0_value_dma22, page0_reloc_dma22, 
   page0_valid_dma22, page1_mask_dma22, page1_value_dma22, 
   page1_reloc_dma22, page1_valid_dma22, txc_dmc_dma23_mark_bit, 
   tx_cfg_dma23_mk, tx_cfg_dma23_mmk, tx_cfg_dma23_enable_mb, 
   tx_cs_dma23, tx_dma23_pre_st, tx_rng_head_dma23, 
   tx_rng_tail_dma23, tx_dma23_rng_err_logh, tx_dma23_rng_err_logl, 
   dmc_txc_dma23_page_handle, tx_dma_cfg_dma23_mbaddr, 
   page0_mask_dma23, page0_value_dma23, page0_reloc_dma23, 
   page0_valid_dma23, page1_mask_dma23, page1_value_dma23, 
   page1_reloc_dma23, page1_valid_dma23,
`else
`endif // !ifdef CHANNELS_16
		      
   dmc_txc_dma0_func_num, 
   dmc_txc_dma1_func_num, dmc_txc_dma2_func_num, 
   dmc_txc_dma3_func_num, dmc_txc_dma4_func_num, 
   dmc_txc_dma5_func_num, dmc_txc_dma6_func_num, 
   dmc_txc_dma7_func_num, dmc_txc_dma8_func_num, 
   dmc_txc_dma9_func_num, dmc_txc_dma10_func_num, 
   dmc_txc_dma11_func_num, dmc_txc_dma12_func_num, 
   dmc_txc_dma13_func_num, dmc_txc_dma14_func_num, 
`ifdef NEPTUNE
   dmc_txc_dma15_func_num,
   dmc_txc_dma16_func_num, 
   dmc_txc_dma17_func_num, dmc_txc_dma18_func_num, 
   dmc_txc_dma19_func_num, dmc_txc_dma20_func_num, 
   dmc_txc_dma21_func_num, dmc_txc_dma22_func_num, 
   dmc_txc_dma23_func_num
`else // !ifdef NEPTUNE
   dmc_txc_dma15_func_num
`endif // !ifdef CHANNELS_16
		      
   );

   input SysClk;
   input Reset_L;
   
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
   input 	  meta_dmc_ack_ready ;      
   input [7:0] 	  meta_dmc_ack_cmd  ;
   input [4:0] 	  meta_dmc_ack_dma_num ; 
   input 	  meta_dmc_ack_client        ;
   input 	  meta_dmc_ack_complete      ;
   input [3:0]    meta_dmc_ack_cmd_status;

   output 	  dmc_meta_ack_accept;      

   // ERROR related signals
   output [`NO_OF_DMAS - 1:0]  mbox_ack_dma_err_received;
   output 	  mbox_err_received;
   output [`NO_OF_DMAS - 1:0]  set_mbox_part_error_dma;




// DMA_0
   input txc_dmc_dma0_mark_bit;
   input tx_cfg_dma0_mk;
   input tx_cfg_dma0_mmk;
   input tx_cfg_dma0_enable_mb;
   input [63:0] tx_cs_dma0;
   input [63:0] tx_dma0_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma0;
   input [`PTR_WIDTH:0] tx_rng_tail_dma0;
   input [63:0] tx_dma0_rng_err_logh;
   input [63:0] tx_dma0_rng_err_logl;
   input [19:0] dmc_txc_dma0_page_handle;
   input [37:0] tx_dma_cfg_dma0_mbaddr;

   input [31:0]   page0_mask_dma0;
   input [31:0]   page0_value_dma0;
   input [31:0]   page0_reloc_dma0;
   input 	  page0_valid_dma0;
   input [31:0]   page1_mask_dma0;
   input [31:0]   page1_value_dma0;
   input [31:0]   page1_reloc_dma0;
   input 	  page1_valid_dma0;

   output 	  clear_cfg_dma0_mb;
   output 	  set_cfg_dma0_mmk;

// DMA_1
   input txc_dmc_dma1_mark_bit;
   input tx_cfg_dma1_mk;
   input tx_cfg_dma1_mmk;
   input tx_cfg_dma1_enable_mb;
   input [63:0] tx_cs_dma1;
   input [63:0] tx_dma1_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma1;
   input [`PTR_WIDTH:0] tx_rng_tail_dma1;
   input [63:0] tx_dma1_rng_err_logh;
   input [63:0] tx_dma1_rng_err_logl;
   input [19:0] dmc_txc_dma1_page_handle;
   input [37:0] tx_dma_cfg_dma1_mbaddr;

   input [31:0]   page0_mask_dma1;
   input [31:0]   page0_value_dma1;
   input [31:0]   page0_reloc_dma1;
   input 	  page0_valid_dma1;
   input [31:0]   page1_mask_dma1;
   input [31:0]   page1_value_dma1;
   input [31:0]   page1_reloc_dma1;
   input 	  page1_valid_dma1;

   output 	  clear_cfg_dma1_mb;
   output 	  set_cfg_dma1_mmk;

// DMA_2
   input txc_dmc_dma2_mark_bit;
   input tx_cfg_dma2_mk;
   input tx_cfg_dma2_mmk;
   input tx_cfg_dma2_enable_mb;
   input [63:0] tx_cs_dma2;
   input [63:0] tx_dma2_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma2;
   input [`PTR_WIDTH:0] tx_rng_tail_dma2;
   input [63:0] tx_dma2_rng_err_logh;
   input [63:0] tx_dma2_rng_err_logl;
   input [19:0] dmc_txc_dma2_page_handle;
   input [37:0] tx_dma_cfg_dma2_mbaddr;

   input [31:0]   page0_mask_dma2;
   input [31:0]   page0_value_dma2;
   input [31:0]   page0_reloc_dma2;
   input 	  page0_valid_dma2;
   input [31:0]   page1_mask_dma2;
   input [31:0]   page1_value_dma2;
   input [31:0]   page1_reloc_dma2;
   input 	  page1_valid_dma2;

   output 	  clear_cfg_dma2_mb;
   output 	  set_cfg_dma2_mmk;

// DMA_3
   input txc_dmc_dma3_mark_bit;
   input tx_cfg_dma3_mk;
   input tx_cfg_dma3_mmk;
   input tx_cfg_dma3_enable_mb;
   input [63:0] tx_cs_dma3;
   input [63:0] tx_dma3_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma3;
   input [`PTR_WIDTH:0] tx_rng_tail_dma3;
   input [63:0] tx_dma3_rng_err_logh;
   input [63:0] tx_dma3_rng_err_logl;
   input [19:0] dmc_txc_dma3_page_handle;
   input [37:0] tx_dma_cfg_dma3_mbaddr;

   input [31:0]   page0_mask_dma3;
   input [31:0]   page0_value_dma3;
   input [31:0]   page0_reloc_dma3;
   input 	  page0_valid_dma3;
   input [31:0]   page1_mask_dma3;
   input [31:0]   page1_value_dma3;
   input [31:0]   page1_reloc_dma3;
   input 	  page1_valid_dma3;

   output 	  clear_cfg_dma3_mb;
   output 	  set_cfg_dma3_mmk;

// DMA_4
   input txc_dmc_dma4_mark_bit;
   input tx_cfg_dma4_mk;
   input tx_cfg_dma4_mmk;
   input tx_cfg_dma4_enable_mb;
   input [63:0] tx_cs_dma4;
   input [63:0] tx_dma4_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma4;
   input [`PTR_WIDTH:0] tx_rng_tail_dma4;
   input [63:0] tx_dma4_rng_err_logh;
   input [63:0] tx_dma4_rng_err_logl;
   input [19:0] dmc_txc_dma4_page_handle;
   input [37:0] tx_dma_cfg_dma4_mbaddr;

   input [31:0]   page0_mask_dma4;
   input [31:0]   page0_value_dma4;
   input [31:0]   page0_reloc_dma4;
   input 	  page0_valid_dma4;
   input [31:0]   page1_mask_dma4;
   input [31:0]   page1_value_dma4;
   input [31:0]   page1_reloc_dma4;
   input 	  page1_valid_dma4;

   output 	  clear_cfg_dma4_mb;
   output 	  set_cfg_dma4_mmk;

// DMA_5
   input txc_dmc_dma5_mark_bit;
   input tx_cfg_dma5_mk;
   input tx_cfg_dma5_mmk;
   input tx_cfg_dma5_enable_mb;
   input [63:0] tx_cs_dma5;
   input [63:0] tx_dma5_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma5;
   input [`PTR_WIDTH:0] tx_rng_tail_dma5;
   input [63:0] tx_dma5_rng_err_logh;
   input [63:0] tx_dma5_rng_err_logl;
   input [19:0] dmc_txc_dma5_page_handle;
   input [37:0] tx_dma_cfg_dma5_mbaddr;

   input [31:0]   page0_mask_dma5;
   input [31:0]   page0_value_dma5;
   input [31:0]   page0_reloc_dma5;
   input 	  page0_valid_dma5;
   input [31:0]   page1_mask_dma5;
   input [31:0]   page1_value_dma5;
   input [31:0]   page1_reloc_dma5;
   input 	  page1_valid_dma5;

   output 	  clear_cfg_dma5_mb;
   output 	  set_cfg_dma5_mmk;

// DMA_6
   input txc_dmc_dma6_mark_bit;
   input tx_cfg_dma6_mk;
   input tx_cfg_dma6_mmk;
   input tx_cfg_dma6_enable_mb;
   input [63:0] tx_cs_dma6;
   input [63:0] tx_dma6_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma6;
   input [`PTR_WIDTH:0] tx_rng_tail_dma6;
   input [63:0] tx_dma6_rng_err_logh;
   input [63:0] tx_dma6_rng_err_logl;
   input [19:0] dmc_txc_dma6_page_handle;
   input [37:0] tx_dma_cfg_dma6_mbaddr;

   input [31:0]   page0_mask_dma6;
   input [31:0]   page0_value_dma6;
   input [31:0]   page0_reloc_dma6;
   input 	  page0_valid_dma6;
   input [31:0]   page1_mask_dma6;
   input [31:0]   page1_value_dma6;
   input [31:0]   page1_reloc_dma6;
   input 	  page1_valid_dma6;

   output 	  clear_cfg_dma6_mb;
   output 	  set_cfg_dma6_mmk;

// DMA_7
   input txc_dmc_dma7_mark_bit;
   input tx_cfg_dma7_mk;
   input tx_cfg_dma7_mmk;
   input tx_cfg_dma7_enable_mb;
   input [63:0] tx_cs_dma7;
   input [63:0] tx_dma7_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma7;
   input [`PTR_WIDTH:0] tx_rng_tail_dma7;
   input [63:0] tx_dma7_rng_err_logh;
   input [63:0] tx_dma7_rng_err_logl;
   input [19:0] dmc_txc_dma7_page_handle;
   input [37:0] tx_dma_cfg_dma7_mbaddr;

   input [31:0]   page0_mask_dma7;
   input [31:0]   page0_value_dma7;
   input [31:0]   page0_reloc_dma7;
   input 	  page0_valid_dma7;
   input [31:0]   page1_mask_dma7;
   input [31:0]   page1_value_dma7;
   input [31:0]   page1_reloc_dma7;
   input 	  page1_valid_dma7;

   output 	  clear_cfg_dma7_mb;
   output 	  set_cfg_dma7_mmk;

// DMA_8
   input txc_dmc_dma8_mark_bit;
   input tx_cfg_dma8_mk;
   input tx_cfg_dma8_mmk;
   input tx_cfg_dma8_enable_mb;
   input [63:0] tx_cs_dma8;
   input [63:0] tx_dma8_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma8;
   input [`PTR_WIDTH:0] tx_rng_tail_dma8;
   input [63:0] tx_dma8_rng_err_logh;
   input [63:0] tx_dma8_rng_err_logl;
   input [19:0] dmc_txc_dma8_page_handle;
   input [37:0] tx_dma_cfg_dma8_mbaddr;

   input [31:0]   page0_mask_dma8;
   input [31:0]   page0_value_dma8;
   input [31:0]   page0_reloc_dma8;
   input 	  page0_valid_dma8;
   input [31:0]   page1_mask_dma8;
   input [31:0]   page1_value_dma8;
   input [31:0]   page1_reloc_dma8;
   input 	  page1_valid_dma8;

   output 	  clear_cfg_dma8_mb;
   output 	  set_cfg_dma8_mmk;

// DMA_9
   input txc_dmc_dma9_mark_bit;
   input tx_cfg_dma9_mk;
   input tx_cfg_dma9_mmk;
   input tx_cfg_dma9_enable_mb;
   input [63:0] tx_cs_dma9;
   input [63:0] tx_dma9_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma9;
   input [`PTR_WIDTH:0] tx_rng_tail_dma9;
   input [63:0] tx_dma9_rng_err_logh;
   input [63:0] tx_dma9_rng_err_logl;
   input [19:0] dmc_txc_dma9_page_handle;
   input [37:0] tx_dma_cfg_dma9_mbaddr;

   input [31:0]   page0_mask_dma9;
   input [31:0]   page0_value_dma9;
   input [31:0]   page0_reloc_dma9;
   input 	  page0_valid_dma9;
   input [31:0]   page1_mask_dma9;
   input [31:0]   page1_value_dma9;
   input [31:0]   page1_reloc_dma9;
   input 	  page1_valid_dma9;

   output 	  clear_cfg_dma9_mb;
   output 	  set_cfg_dma9_mmk;

// DMA_10
   input txc_dmc_dma10_mark_bit;
   input tx_cfg_dma10_mk;
   input tx_cfg_dma10_mmk;
   input tx_cfg_dma10_enable_mb;
   input [63:0] tx_cs_dma10;
   input [63:0] tx_dma10_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma10;
   input [`PTR_WIDTH:0] tx_rng_tail_dma10;
   input [63:0] tx_dma10_rng_err_logh;
   input [63:0] tx_dma10_rng_err_logl;
   input [19:0] dmc_txc_dma10_page_handle;
   input [37:0] tx_dma_cfg_dma10_mbaddr;

   input [31:0]   page0_mask_dma10;
   input [31:0]   page0_value_dma10;
   input [31:0]   page0_reloc_dma10;
   input 	  page0_valid_dma10;
   input [31:0]   page1_mask_dma10;
   input [31:0]   page1_value_dma10;
   input [31:0]   page1_reloc_dma10;
   input 	  page1_valid_dma10;

   output 	  clear_cfg_dma10_mb;
   output 	  set_cfg_dma10_mmk;

// DMA_11
   input txc_dmc_dma11_mark_bit;
   input tx_cfg_dma11_mk;
   input tx_cfg_dma11_mmk;
   input tx_cfg_dma11_enable_mb;
   input [63:0] tx_cs_dma11;
   input [63:0] tx_dma11_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma11;
   input [`PTR_WIDTH:0] tx_rng_tail_dma11;
   input [63:0] tx_dma11_rng_err_logh;
   input [63:0] tx_dma11_rng_err_logl;
   input [19:0] dmc_txc_dma11_page_handle;
   input [37:0] tx_dma_cfg_dma11_mbaddr;

   input [31:0]   page0_mask_dma11;
   input [31:0]   page0_value_dma11;
   input [31:0]   page0_reloc_dma11;
   input 	  page0_valid_dma11;
   input [31:0]   page1_mask_dma11;
   input [31:0]   page1_value_dma11;
   input [31:0]   page1_reloc_dma11;
   input 	  page1_valid_dma11;

   output 	  clear_cfg_dma11_mb;
   output 	  set_cfg_dma11_mmk;

// DMA_12
   input txc_dmc_dma12_mark_bit;
   input tx_cfg_dma12_mk;
   input tx_cfg_dma12_mmk;
   input tx_cfg_dma12_enable_mb;
   input [63:0] tx_cs_dma12;
   input [63:0] tx_dma12_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma12;
   input [`PTR_WIDTH:0] tx_rng_tail_dma12;
   input [63:0] tx_dma12_rng_err_logh;
   input [63:0] tx_dma12_rng_err_logl;
   input [19:0] dmc_txc_dma12_page_handle;
   input [37:0] tx_dma_cfg_dma12_mbaddr;

   input [31:0]   page0_mask_dma12;
   input [31:0]   page0_value_dma12;
   input [31:0]   page0_reloc_dma12;
   input 	  page0_valid_dma12;
   input [31:0]   page1_mask_dma12;
   input [31:0]   page1_value_dma12;
   input [31:0]   page1_reloc_dma12;
   input 	  page1_valid_dma12;

   output 	  clear_cfg_dma12_mb;
   output 	  set_cfg_dma12_mmk;

// DMA_13
   input txc_dmc_dma13_mark_bit;
   input tx_cfg_dma13_mk;
   input tx_cfg_dma13_mmk;
   input tx_cfg_dma13_enable_mb;
   input [63:0] tx_cs_dma13;
   input [63:0] tx_dma13_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma13;
   input [`PTR_WIDTH:0] tx_rng_tail_dma13;
   input [63:0] tx_dma13_rng_err_logh;
   input [63:0] tx_dma13_rng_err_logl;
   input [19:0] dmc_txc_dma13_page_handle;
   input [37:0] tx_dma_cfg_dma13_mbaddr;

   input [31:0]   page0_mask_dma13;
   input [31:0]   page0_value_dma13;
   input [31:0]   page0_reloc_dma13;
   input 	  page0_valid_dma13;
   input [31:0]   page1_mask_dma13;
   input [31:0]   page1_value_dma13;
   input [31:0]   page1_reloc_dma13;
   input 	  page1_valid_dma13;

   output 	  clear_cfg_dma13_mb;
   output 	  set_cfg_dma13_mmk;

// DMA_14
   input txc_dmc_dma14_mark_bit;
   input tx_cfg_dma14_mk;
   input tx_cfg_dma14_mmk;
   input tx_cfg_dma14_enable_mb;
   input [63:0] tx_cs_dma14;
   input [63:0] tx_dma14_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma14;
   input [`PTR_WIDTH:0] tx_rng_tail_dma14;
   input [63:0] tx_dma14_rng_err_logh;
   input [63:0] tx_dma14_rng_err_logl;
   input [19:0] dmc_txc_dma14_page_handle;
   input [37:0] tx_dma_cfg_dma14_mbaddr;

   input [31:0]   page0_mask_dma14;
   input [31:0]   page0_value_dma14;
   input [31:0]   page0_reloc_dma14;
   input 	  page0_valid_dma14;
   input [31:0]   page1_mask_dma14;
   input [31:0]   page1_value_dma14;
   input [31:0]   page1_reloc_dma14;
   input 	  page1_valid_dma14;

   output 	  clear_cfg_dma14_mb;
   output 	  set_cfg_dma14_mmk;

// DMA_15
   input txc_dmc_dma15_mark_bit;
   input tx_cfg_dma15_mk;
   input tx_cfg_dma15_mmk;
   input tx_cfg_dma15_enable_mb;
   input [63:0] tx_cs_dma15;
   input [63:0] tx_dma15_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma15;
   input [`PTR_WIDTH:0] tx_rng_tail_dma15;
   input [63:0] tx_dma15_rng_err_logh;
   input [63:0] tx_dma15_rng_err_logl;
   input [19:0] dmc_txc_dma15_page_handle;
   input [37:0] tx_dma_cfg_dma15_mbaddr;

   input [31:0]   page0_mask_dma15;
   input [31:0]   page0_value_dma15;
   input [31:0]   page0_reloc_dma15;
   input 	  page0_valid_dma15;
   input [31:0]   page1_mask_dma15;
   input [31:0]   page1_value_dma15;
   input [31:0]   page1_reloc_dma15;
   input 	  page1_valid_dma15;

   output 	  clear_cfg_dma15_mb;
   output 	  set_cfg_dma15_mmk;
`ifdef NEPTUNE
// DMA_16
   input txc_dmc_dma16_mark_bit;
   input tx_cfg_dma16_mk;
   input tx_cfg_dma16_mmk;
   input tx_cfg_dma16_enable_mb;
   input [63:0] tx_cs_dma16;
   input [63:0] tx_dma16_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma16;
   input [`PTR_WIDTH:0] tx_rng_tail_dma16;
   input [63:0] tx_dma16_rng_err_logh;
   input [63:0] tx_dma16_rng_err_logl;
   input [19:0] dmc_txc_dma16_page_handle;
   input [37:0] tx_dma_cfg_dma16_mbaddr;

   input [31:0]   page0_mask_dma16;
   input [31:0]   page0_value_dma16;
   input [31:0]   page0_reloc_dma16;
   input 	  page0_valid_dma16;
   input [31:0]   page1_mask_dma16;
   input [31:0]   page1_value_dma16;
   input [31:0]   page1_reloc_dma16;
   input 	  page1_valid_dma16;

   output 	  clear_cfg_dma16_mb;
   output 	  set_cfg_dma16_mmk;

// DMA_17
   input txc_dmc_dma17_mark_bit;
   input tx_cfg_dma17_mk;
   input tx_cfg_dma17_mmk;
   input tx_cfg_dma17_enable_mb;
   input [63:0] tx_cs_dma17;
   input [63:0] tx_dma17_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma17;
   input [`PTR_WIDTH:0] tx_rng_tail_dma17;
   input [63:0] tx_dma17_rng_err_logh;
   input [63:0] tx_dma17_rng_err_logl;
   input [19:0] dmc_txc_dma17_page_handle;
   input [37:0] tx_dma_cfg_dma17_mbaddr;

   input [31:0]   page0_mask_dma17;
   input [31:0]   page0_value_dma17;
   input [31:0]   page0_reloc_dma17;
   input 	  page0_valid_dma17;
   input [31:0]   page1_mask_dma17;
   input [31:0]   page1_value_dma17;
   input [31:0]   page1_reloc_dma17;
   input 	  page1_valid_dma17;

   output 	  clear_cfg_dma17_mb;
   output 	  set_cfg_dma17_mmk;

// DMA_18
   input txc_dmc_dma18_mark_bit;
   input tx_cfg_dma18_mk;
   input tx_cfg_dma18_mmk;
   input tx_cfg_dma18_enable_mb;
   input [63:0] tx_cs_dma18;
   input [63:0] tx_dma18_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma18;
   input [`PTR_WIDTH:0] tx_rng_tail_dma18;
   input [63:0] tx_dma18_rng_err_logh;
   input [63:0] tx_dma18_rng_err_logl;
   input [19:0] dmc_txc_dma18_page_handle;
   input [37:0] tx_dma_cfg_dma18_mbaddr;

   input [31:0]   page0_mask_dma18;
   input [31:0]   page0_value_dma18;
   input [31:0]   page0_reloc_dma18;
   input 	  page0_valid_dma18;
   input [31:0]   page1_mask_dma18;
   input [31:0]   page1_value_dma18;
   input [31:0]   page1_reloc_dma18;
   input 	  page1_valid_dma18;

   output 	  clear_cfg_dma18_mb;
   output 	  set_cfg_dma18_mmk;

// DMA_19
   input txc_dmc_dma19_mark_bit;
   input tx_cfg_dma19_mk;
   input tx_cfg_dma19_mmk;
   input tx_cfg_dma19_enable_mb;
   input [63:0] tx_cs_dma19;
   input [63:0] tx_dma19_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma19;
   input [`PTR_WIDTH:0] tx_rng_tail_dma19;
   input [63:0] tx_dma19_rng_err_logh;
   input [63:0] tx_dma19_rng_err_logl;
   input [19:0] dmc_txc_dma19_page_handle;
   input [37:0] tx_dma_cfg_dma19_mbaddr;

   input [31:0]   page0_mask_dma19;
   input [31:0]   page0_value_dma19;
   input [31:0]   page0_reloc_dma19;
   input 	  page0_valid_dma19;
   input [31:0]   page1_mask_dma19;
   input [31:0]   page1_value_dma19;
   input [31:0]   page1_reloc_dma19;
   input 	  page1_valid_dma19;

   output 	  clear_cfg_dma19_mb;
   output 	  set_cfg_dma19_mmk;

// DMA_20
   input txc_dmc_dma20_mark_bit;
   input tx_cfg_dma20_mk;
   input tx_cfg_dma20_mmk;
   input tx_cfg_dma20_enable_mb;
   input [63:0] tx_cs_dma20;
   input [63:0] tx_dma20_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma20;
   input [`PTR_WIDTH:0] tx_rng_tail_dma20;
   input [63:0] tx_dma20_rng_err_logh;
   input [63:0] tx_dma20_rng_err_logl;
   input [19:0] dmc_txc_dma20_page_handle;
   input [37:0] tx_dma_cfg_dma20_mbaddr;

   input [31:0]   page0_mask_dma20;
   input [31:0]   page0_value_dma20;
   input [31:0]   page0_reloc_dma20;
   input 	  page0_valid_dma20;
   input [31:0]   page1_mask_dma20;
   input [31:0]   page1_value_dma20;
   input [31:0]   page1_reloc_dma20;
   input 	  page1_valid_dma20;

   output 	  clear_cfg_dma20_mb;
   output 	  set_cfg_dma20_mmk;

// DMA_21
   input txc_dmc_dma21_mark_bit;
   input tx_cfg_dma21_mk;
   input tx_cfg_dma21_mmk;
   input tx_cfg_dma21_enable_mb;
   input [63:0] tx_cs_dma21;
   input [63:0] tx_dma21_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma21;
   input [`PTR_WIDTH:0] tx_rng_tail_dma21;
   input [63:0] tx_dma21_rng_err_logh;
   input [63:0] tx_dma21_rng_err_logl;
   input [19:0] dmc_txc_dma21_page_handle;
   input [37:0] tx_dma_cfg_dma21_mbaddr;

   input [31:0]   page0_mask_dma21;
   input [31:0]   page0_value_dma21;
   input [31:0]   page0_reloc_dma21;
   input 	  page0_valid_dma21;
   input [31:0]   page1_mask_dma21;
   input [31:0]   page1_value_dma21;
   input [31:0]   page1_reloc_dma21;
   input 	  page1_valid_dma21;

   output 	  clear_cfg_dma21_mb;
   output 	  set_cfg_dma21_mmk;

// DMA_22
   input txc_dmc_dma22_mark_bit;
   input tx_cfg_dma22_mk;
   input tx_cfg_dma22_mmk;
   input tx_cfg_dma22_enable_mb;
   input [63:0] tx_cs_dma22;
   input [63:0] tx_dma22_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma22;
   input [`PTR_WIDTH:0] tx_rng_tail_dma22;
   input [63:0] tx_dma22_rng_err_logh;
   input [63:0] tx_dma22_rng_err_logl;
   input [19:0] dmc_txc_dma22_page_handle;
   input [37:0] tx_dma_cfg_dma22_mbaddr;

   input [31:0]   page0_mask_dma22;
   input [31:0]   page0_value_dma22;
   input [31:0]   page0_reloc_dma22;
   input 	  page0_valid_dma22;
   input [31:0]   page1_mask_dma22;
   input [31:0]   page1_value_dma22;
   input [31:0]   page1_reloc_dma22;
   input 	  page1_valid_dma22;

   output 	  clear_cfg_dma22_mb;
   output 	  set_cfg_dma22_mmk;

// DMA_23
   input txc_dmc_dma23_mark_bit;
   input tx_cfg_dma23_mk;
   input tx_cfg_dma23_mmk;
   input tx_cfg_dma23_enable_mb;
   input [63:0] tx_cs_dma23;
   input [63:0] tx_dma23_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma23;
   input [`PTR_WIDTH:0] tx_rng_tail_dma23;
   input [63:0] tx_dma23_rng_err_logh;
   input [63:0] tx_dma23_rng_err_logl;
   input [19:0] dmc_txc_dma23_page_handle;
   input [37:0] tx_dma_cfg_dma23_mbaddr;

   input [31:0]   page0_mask_dma23;
   input [31:0]   page0_value_dma23;
   input [31:0]   page0_reloc_dma23;
   input 	  page0_valid_dma23;
   input [31:0]   page1_mask_dma23;
   input [31:0]   page1_value_dma23;
   input [31:0]   page1_reloc_dma23;
   input 	  page1_valid_dma23;

   output 	  clear_cfg_dma23_mb;
   output 	  set_cfg_dma23_mmk;

`else
`endif

   output [11:0]  mbox_debug_state; // to debug port

// function number for requests
   input [1:0] 	  dmc_txc_dma0_func_num;
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
   output 	set_cfg_dma0_mk;
   output 	set_cfg_dma1_mk;
   output 	set_cfg_dma2_mk;
   output 	set_cfg_dma3_mk;
   output 	set_cfg_dma4_mk;
   output 	set_cfg_dma5_mk;
   output 	set_cfg_dma6_mk;
   output 	set_cfg_dma7_mk;
   output 	set_cfg_dma8_mk;
   output 	set_cfg_dma9_mk;
   output 	set_cfg_dma10_mk;
   output 	set_cfg_dma11_mk;
   output 	set_cfg_dma12_mk;
   output 	set_cfg_dma13_mk;
   output 	set_cfg_dma14_mk;
   output 	set_cfg_dma15_mk;
`ifdef NEPTUNE
   output 	set_cfg_dma16_mk;
   output 	set_cfg_dma17_mk;
   output 	set_cfg_dma18_mk;
   output 	set_cfg_dma19_mk;
   output 	set_cfg_dma20_mk;
   output 	set_cfg_dma21_mk;
   output 	set_cfg_dma22_mk;
   output 	set_cfg_dma23_mk;

`else
`endif
// Wires --
   wire [`NO_OF_DMAS - 1:0] 	  set_mbox_part_error_dma;
   wire [`NO_OF_DMAS - 1:0] 	  mbox_ack_dma_err_received;
   wire 	  mbox_err_received;
// DMA_0
   wire 	mbox_ack_dma0_received;
   wire 	send_mbox_dma0;
   wire 	done_mbox_dma0; 
   wire 	mbox_dma0_scheduled;
   wire [127:0] mbox_dma0_data;
   wire 	  mbox_dma0_data_valid;
   wire 	  mbox_dma0_data_done;
   wire 	  clear_cfg_dma0_mb;
   wire 	  set_cfg_dma0_mmk;

  
// DMA_1
   wire 	mbox_ack_dma1_received;
   wire 	send_mbox_dma1;
   wire 	done_mbox_dma1; 
   wire 	mbox_dma1_scheduled;
   wire [127:0] mbox_dma1_data;
   wire 	  mbox_dma1_data_valid;
   wire 	  mbox_dma1_data_done;
   wire 	  clear_cfg_dma1_mb;
   wire 	  set_cfg_dma1_mmk;

  
// DMA_2
   wire 	mbox_ack_dma2_received;
   wire 	send_mbox_dma2;
   wire 	done_mbox_dma2; 
   wire 	mbox_dma2_scheduled;
   wire [127:0] mbox_dma2_data;
   wire 	  mbox_dma2_data_valid;
   wire 	  mbox_dma2_data_done;
   wire 	  clear_cfg_dma2_mb;
   wire 	  set_cfg_dma2_mmk;

  
// DMA_3
   wire 	mbox_ack_dma3_received;
   wire 	send_mbox_dma3;
   wire 	done_mbox_dma3; 
   wire 	mbox_dma3_scheduled;
   wire [127:0] mbox_dma3_data;
   wire 	  mbox_dma3_data_valid;
   wire 	  mbox_dma3_data_done;
   wire 	  clear_cfg_dma3_mb;
   wire 	  set_cfg_dma3_mmk;

  
// DMA_4
   wire 	mbox_ack_dma4_received;
   wire 	send_mbox_dma4;
   wire 	done_mbox_dma4; 
   wire 	mbox_dma4_scheduled;
   wire [127:0] mbox_dma4_data;
   wire 	  mbox_dma4_data_valid;
   wire 	  mbox_dma4_data_done;
   wire 	  clear_cfg_dma4_mb;
   wire 	  set_cfg_dma4_mmk;

  
// DMA_5
   wire 	mbox_ack_dma5_received;
   wire 	send_mbox_dma5;
   wire 	done_mbox_dma5; 
   wire 	mbox_dma5_scheduled;
   wire [127:0] mbox_dma5_data;
   wire 	  mbox_dma5_data_valid;
   wire 	  mbox_dma5_data_done;
   wire 	  clear_cfg_dma5_mb;
   wire 	  set_cfg_dma5_mmk;

  
// DMA_6
   wire 	mbox_ack_dma6_received;
   wire 	send_mbox_dma6;
   wire 	done_mbox_dma6; 
   wire 	mbox_dma6_scheduled;
   wire [127:0] mbox_dma6_data;
   wire 	  mbox_dma6_data_valid;
   wire 	  mbox_dma6_data_done;
   wire 	  clear_cfg_dma6_mb;
   wire 	  set_cfg_dma6_mmk;

  
// DMA_7
   wire 	mbox_ack_dma7_received;
   wire 	send_mbox_dma7;
   wire 	done_mbox_dma7; 
   wire 	mbox_dma7_scheduled;
   wire [127:0] mbox_dma7_data;
   wire 	  mbox_dma7_data_valid;
   wire 	  mbox_dma7_data_done;
   wire 	  clear_cfg_dma7_mb;
   wire 	  set_cfg_dma7_mmk;

  
// DMA_8
   wire 	mbox_ack_dma8_received;
   wire 	send_mbox_dma8;
   wire 	done_mbox_dma8; 
   wire 	mbox_dma8_scheduled;
   wire [127:0] mbox_dma8_data;
   wire 	  mbox_dma8_data_valid;
   wire 	  mbox_dma8_data_done;
   wire 	  clear_cfg_dma8_mb;
   wire 	  set_cfg_dma8_mmk;

  
// DMA_9
   wire 	mbox_ack_dma9_received;
   wire 	send_mbox_dma9;
   wire 	done_mbox_dma9; 
   wire 	mbox_dma9_scheduled;
   wire [127:0] mbox_dma9_data;
   wire 	  mbox_dma9_data_valid;
   wire 	  mbox_dma9_data_done;
   wire 	  clear_cfg_dma9_mb;
   wire 	  set_cfg_dma9_mmk;

  
// DMA_10
   wire 	mbox_ack_dma10_received;
   wire 	send_mbox_dma10;
   wire 	done_mbox_dma10; 
   wire 	mbox_dma10_scheduled;
   wire [127:0] mbox_dma10_data;
   wire 	  mbox_dma10_data_valid;
   wire 	  mbox_dma10_data_done;
   wire 	  clear_cfg_dma10_mb;
   wire 	  set_cfg_dma10_mmk;

  
// DMA_11
   wire 	mbox_ack_dma11_received;
   wire 	send_mbox_dma11;
   wire 	done_mbox_dma11; 
   wire 	mbox_dma11_scheduled;
   wire [127:0] mbox_dma11_data;
   wire 	  mbox_dma11_data_valid;
   wire 	  mbox_dma11_data_done;
   wire 	  clear_cfg_dma11_mb;
   wire 	  set_cfg_dma11_mmk;

  
// DMA_12
   wire 	mbox_ack_dma12_received;
   wire 	send_mbox_dma12;
   wire 	done_mbox_dma12; 
   wire 	mbox_dma12_scheduled;
   wire [127:0] mbox_dma12_data;
   wire 	  mbox_dma12_data_valid;
   wire 	  mbox_dma12_data_done;
   wire 	  clear_cfg_dma12_mb;
   wire 	  set_cfg_dma12_mmk;

  
// DMA_13
   wire 	mbox_ack_dma13_received;
   wire 	send_mbox_dma13;
   wire 	done_mbox_dma13; 
   wire 	mbox_dma13_scheduled;
   wire [127:0] mbox_dma13_data;
   wire 	  mbox_dma13_data_valid;
   wire 	  mbox_dma13_data_done;
   wire 	  clear_cfg_dma13_mb;
   wire 	  set_cfg_dma13_mmk;

  
// DMA_14
   wire 	mbox_ack_dma14_received;
   wire 	send_mbox_dma14;
   wire 	done_mbox_dma14; 
   wire 	mbox_dma14_scheduled;
   wire [127:0] mbox_dma14_data;
   wire 	  mbox_dma14_data_valid;
   wire 	  mbox_dma14_data_done;
   wire 	  clear_cfg_dma14_mb;
   wire 	  set_cfg_dma14_mmk;

  
// DMA_15
   wire 	mbox_ack_dma15_received;
   wire 	send_mbox_dma15;
   wire 	done_mbox_dma15; 
   wire 	mbox_dma15_scheduled;
   wire [127:0] mbox_dma15_data;
   wire 	  mbox_dma15_data_valid;
   wire 	  mbox_dma15_data_done;
   wire 	  clear_cfg_dma15_mb;
   wire 	  set_cfg_dma15_mmk;

  
`ifdef NEPTUNE
   
// DMA_16
   wire 	mbox_ack_dma16_received;
   wire 	send_mbox_dma16;
   wire 	done_mbox_dma16; 
   wire 	mbox_dma16_scheduled;
   wire [127:0] mbox_dma16_data;
   wire 	  mbox_dma16_data_valid;
   wire 	  mbox_dma16_data_done;
   wire 	  clear_cfg_dma16_mb;
   wire 	  set_cfg_dma16_mmk;

  
// DMA_17
   wire 	mbox_ack_dma17_received;
   wire 	send_mbox_dma17;
   wire 	done_mbox_dma17; 
   wire 	mbox_dma17_scheduled;
   wire [127:0] mbox_dma17_data;
   wire 	  mbox_dma17_data_valid;
   wire 	  mbox_dma17_data_done;
   wire 	  clear_cfg_dma17_mb;
   wire 	  set_cfg_dma17_mmk;

  
// DMA_18
   wire 	mbox_ack_dma18_received;
   wire 	send_mbox_dma18;
   wire 	done_mbox_dma18; 
   wire 	mbox_dma18_scheduled;
   wire [127:0] mbox_dma18_data;
   wire 	  mbox_dma18_data_valid;
   wire 	  mbox_dma18_data_done;
   wire 	  clear_cfg_dma18_mb;
   wire 	  set_cfg_dma18_mmk;

  
// DMA_19
   wire 	mbox_ack_dma19_received;
   wire 	send_mbox_dma19;
   wire 	done_mbox_dma19; 
   wire 	mbox_dma19_scheduled;
   wire [127:0] mbox_dma19_data;
   wire 	  mbox_dma19_data_valid;
   wire 	  mbox_dma19_data_done;
   wire 	  clear_cfg_dma19_mb;
   wire 	  set_cfg_dma19_mmk;

  
// DMA_20
   wire 	mbox_ack_dma20_received;
   wire 	send_mbox_dma20;
   wire 	done_mbox_dma20; 
   wire 	mbox_dma20_scheduled;
   wire [127:0] mbox_dma20_data;
   wire 	  mbox_dma20_data_valid;
   wire 	  mbox_dma20_data_done;
   wire 	  clear_cfg_dma20_mb;
   wire 	  set_cfg_dma20_mmk;

  
// DMA_21
   wire 	mbox_ack_dma21_received;
   wire 	send_mbox_dma21;
   wire 	done_mbox_dma21; 
   wire 	mbox_dma21_scheduled;
   wire [127:0] mbox_dma21_data;
   wire 	  mbox_dma21_data_valid;
   wire 	  mbox_dma21_data_done;
   wire 	  clear_cfg_dma21_mb;
   wire 	  set_cfg_dma21_mmk;

  
// DMA_22
   wire 	mbox_ack_dma22_received;
   wire 	send_mbox_dma22;
   wire 	done_mbox_dma22; 
   wire 	mbox_dma22_scheduled;
   wire [127:0] mbox_dma22_data;
   wire 	  mbox_dma22_data_valid;
   wire 	  mbox_dma22_data_done;
   wire 	  clear_cfg_dma22_mb;
   wire 	  set_cfg_dma22_mmk;

  
// DMA_23
   wire 	mbox_ack_dma23_received;
   wire 	send_mbox_dma23;
   wire 	done_mbox_dma23; 
   wire 	mbox_dma23_scheduled;
   wire [127:0] mbox_dma23_data;
   wire 	  mbox_dma23_data_valid;
   wire 	  mbox_dma23_data_done;
   wire 	  clear_cfg_dma23_mb;
   wire 	  set_cfg_dma23_mmk;

`else
`endif
  
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

`else
`endif

   wire 	meta_data_req;


// DMA_0
niu_tdmc_mbox_context niu_tdmc_mbox_context_0 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma0),
					    .mbox_dma_data(mbox_dma0_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma0_data_valid),
					    .mbox_dma_data_done(mbox_dma0_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma0_mb),
					    .set_cfg_dma_mmk(set_cfg_dma0_mmk),
					    .set_cfg_dma_mk(set_cfg_dma0_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma0_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma0_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma0_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma0_enable_mb),
					    .tx_cs_dma(tx_cs_dma0[63:0]),
					    .tx_dma_pre_st(tx_dma0_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma0[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma0[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma0_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma0_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma0_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[0]),
					    .done_mbox_dma(done_mbox_dma0),
					    .mbox_dma_scheduled(mbox_dma0_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_1
niu_tdmc_mbox_context niu_tdmc_mbox_context_1 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma1),
					    .mbox_dma_data(mbox_dma1_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma1_data_valid),
					    .mbox_dma_data_done(mbox_dma1_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma1_mb),
					    .set_cfg_dma_mmk(set_cfg_dma1_mmk),
					    .set_cfg_dma_mk(set_cfg_dma1_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma1_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma1_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma1_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma1_enable_mb),
					    .tx_cs_dma(tx_cs_dma1[63:0]),
					    .tx_dma_pre_st(tx_dma1_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma1[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma1[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma1_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma1_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma1_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[1]),
					    .done_mbox_dma(done_mbox_dma1),
					    .mbox_dma_scheduled(mbox_dma1_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_2
niu_tdmc_mbox_context niu_tdmc_mbox_context_2 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma2),
					    .mbox_dma_data(mbox_dma2_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma2_data_valid),
					    .mbox_dma_data_done(mbox_dma2_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma2_mb),
					    .set_cfg_dma_mmk(set_cfg_dma2_mmk),
					    .set_cfg_dma_mk(set_cfg_dma2_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma2_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma2_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma2_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma2_enable_mb),
					    .tx_cs_dma(tx_cs_dma2[63:0]),
					    .tx_dma_pre_st(tx_dma2_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma2[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma2[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma2_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma2_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma2_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[2]),
					    .done_mbox_dma(done_mbox_dma2),
					    .mbox_dma_scheduled(mbox_dma2_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_3
niu_tdmc_mbox_context niu_tdmc_mbox_context_3 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma3),
					    .mbox_dma_data(mbox_dma3_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma3_data_valid),
					    .mbox_dma_data_done(mbox_dma3_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma3_mb),
					    .set_cfg_dma_mmk(set_cfg_dma3_mmk),
					    .set_cfg_dma_mk(set_cfg_dma3_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma3_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma3_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma3_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma3_enable_mb),
					    .tx_cs_dma(tx_cs_dma3[63:0]),
					    .tx_dma_pre_st(tx_dma3_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma3[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma3[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma3_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma3_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma3_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[3]),
					    .done_mbox_dma(done_mbox_dma3),
					    .mbox_dma_scheduled(mbox_dma3_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_4
niu_tdmc_mbox_context niu_tdmc_mbox_context_4 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma4),
					    .mbox_dma_data(mbox_dma4_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma4_data_valid),
					    .mbox_dma_data_done(mbox_dma4_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma4_mb),
					    .set_cfg_dma_mmk(set_cfg_dma4_mmk),
					    .set_cfg_dma_mk(set_cfg_dma4_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma4_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma4_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma4_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma4_enable_mb),
					    .tx_cs_dma(tx_cs_dma4[63:0]),
					    .tx_dma_pre_st(tx_dma4_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma4[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma4[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma4_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma4_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma4_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[4]),
					    .done_mbox_dma(done_mbox_dma4),
					    .mbox_dma_scheduled(mbox_dma4_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_5
niu_tdmc_mbox_context niu_tdmc_mbox_context_5 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma5),
					    .mbox_dma_data(mbox_dma5_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma5_data_valid),
					    .mbox_dma_data_done(mbox_dma5_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma5_mb),
					    .set_cfg_dma_mmk(set_cfg_dma5_mmk),
					    .set_cfg_dma_mk(set_cfg_dma5_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma5_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma5_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma5_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma5_enable_mb),
					    .tx_cs_dma(tx_cs_dma5[63:0]),
					    .tx_dma_pre_st(tx_dma5_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma5[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma5[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma5_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma5_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma5_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[5]),
					    .done_mbox_dma(done_mbox_dma5),
					    .mbox_dma_scheduled(mbox_dma5_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_6
niu_tdmc_mbox_context niu_tdmc_mbox_context_6 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma6),
					    .mbox_dma_data(mbox_dma6_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma6_data_valid),
					    .mbox_dma_data_done(mbox_dma6_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma6_mb),
					    .set_cfg_dma_mmk(set_cfg_dma6_mmk),
					    .set_cfg_dma_mk(set_cfg_dma6_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma6_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma6_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma6_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma6_enable_mb),
					    .tx_cs_dma(tx_cs_dma6[63:0]),
					    .tx_dma_pre_st(tx_dma6_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma6[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma6[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma6_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma6_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma6_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[6]),
					    .done_mbox_dma(done_mbox_dma6),
					    .mbox_dma_scheduled(mbox_dma6_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_7
niu_tdmc_mbox_context niu_tdmc_mbox_context_7 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma7),
					    .mbox_dma_data(mbox_dma7_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma7_data_valid),
					    .mbox_dma_data_done(mbox_dma7_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma7_mb),
					    .set_cfg_dma_mmk(set_cfg_dma7_mmk),
					    .set_cfg_dma_mk(set_cfg_dma7_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma7_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma7_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma7_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma7_enable_mb),
					    .tx_cs_dma(tx_cs_dma7[63:0]),
					    .tx_dma_pre_st(tx_dma7_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma7[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma7[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma7_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma7_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma7_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[7]),
					    .done_mbox_dma(done_mbox_dma7),
					    .mbox_dma_scheduled(mbox_dma7_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_8
niu_tdmc_mbox_context niu_tdmc_mbox_context_8 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma8),
					    .mbox_dma_data(mbox_dma8_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma8_data_valid),
					    .mbox_dma_data_done(mbox_dma8_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma8_mb),
					    .set_cfg_dma_mmk(set_cfg_dma8_mmk),
					    .set_cfg_dma_mk(set_cfg_dma8_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma8_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma8_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma8_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma8_enable_mb),
					    .tx_cs_dma(tx_cs_dma8[63:0]),
					    .tx_dma_pre_st(tx_dma8_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma8[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma8[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma8_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma8_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma8_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[8]),
					    .done_mbox_dma(done_mbox_dma8),
					    .mbox_dma_scheduled(mbox_dma8_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_9
niu_tdmc_mbox_context niu_tdmc_mbox_context_9 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma9),
					    .mbox_dma_data(mbox_dma9_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma9_data_valid),
					    .mbox_dma_data_done(mbox_dma9_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma9_mb),
					    .set_cfg_dma_mmk(set_cfg_dma9_mmk),
					    .set_cfg_dma_mk(set_cfg_dma9_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma9_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma9_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma9_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma9_enable_mb),
					    .tx_cs_dma(tx_cs_dma9[63:0]),
					    .tx_dma_pre_st(tx_dma9_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma9[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma9[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma9_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma9_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma9_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[9]),
					    .done_mbox_dma(done_mbox_dma9),
					    .mbox_dma_scheduled(mbox_dma9_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_10
niu_tdmc_mbox_context niu_tdmc_mbox_context_10 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma10),
					    .mbox_dma_data(mbox_dma10_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma10_data_valid),
					    .mbox_dma_data_done(mbox_dma10_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma10_mb),
					    .set_cfg_dma_mmk(set_cfg_dma10_mmk),
					    .set_cfg_dma_mk(set_cfg_dma10_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma10_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma10_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma10_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma10_enable_mb),
					    .tx_cs_dma(tx_cs_dma10[63:0]),
					    .tx_dma_pre_st(tx_dma10_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma10[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma10[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma10_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma10_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma10_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[10]),
					    .done_mbox_dma(done_mbox_dma10),
					    .mbox_dma_scheduled(mbox_dma10_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_11
niu_tdmc_mbox_context niu_tdmc_mbox_context_11 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma11),
					    .mbox_dma_data(mbox_dma11_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma11_data_valid),
					    .mbox_dma_data_done(mbox_dma11_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma11_mb),
					    .set_cfg_dma_mmk(set_cfg_dma11_mmk),
					    .set_cfg_dma_mk(set_cfg_dma11_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma11_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma11_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma11_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma11_enable_mb),
					    .tx_cs_dma(tx_cs_dma11[63:0]),
					    .tx_dma_pre_st(tx_dma11_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma11[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma11[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma11_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma11_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma11_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[11]),
					    .done_mbox_dma(done_mbox_dma11),
					    .mbox_dma_scheduled(mbox_dma11_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_12
niu_tdmc_mbox_context niu_tdmc_mbox_context_12 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma12),
					    .mbox_dma_data(mbox_dma12_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma12_data_valid),
					    .mbox_dma_data_done(mbox_dma12_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma12_mb),
					    .set_cfg_dma_mmk(set_cfg_dma12_mmk),
					    .set_cfg_dma_mk(set_cfg_dma12_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma12_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma12_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma12_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma12_enable_mb),
					    .tx_cs_dma(tx_cs_dma12[63:0]),
					    .tx_dma_pre_st(tx_dma12_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma12[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma12[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma12_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma12_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma12_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[12]),
					    .done_mbox_dma(done_mbox_dma12),
					    .mbox_dma_scheduled(mbox_dma12_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_13
niu_tdmc_mbox_context niu_tdmc_mbox_context_13 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma13),
					    .mbox_dma_data(mbox_dma13_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma13_data_valid),
					    .mbox_dma_data_done(mbox_dma13_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma13_mb),
					    .set_cfg_dma_mmk(set_cfg_dma13_mmk),
					    .set_cfg_dma_mk(set_cfg_dma13_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma13_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma13_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma13_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma13_enable_mb),
					    .tx_cs_dma(tx_cs_dma13[63:0]),
					    .tx_dma_pre_st(tx_dma13_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma13[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma13[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma13_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma13_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma13_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[13]),
					    .done_mbox_dma(done_mbox_dma13),
					    .mbox_dma_scheduled(mbox_dma13_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_14
niu_tdmc_mbox_context niu_tdmc_mbox_context_14 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma14),
					    .mbox_dma_data(mbox_dma14_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma14_data_valid),
					    .mbox_dma_data_done(mbox_dma14_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma14_mb),
					    .set_cfg_dma_mmk(set_cfg_dma14_mmk),
					    .set_cfg_dma_mk(set_cfg_dma14_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma14_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma14_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma14_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma14_enable_mb),
					    .tx_cs_dma(tx_cs_dma14[63:0]),
					    .tx_dma_pre_st(tx_dma14_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma14[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma14[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma14_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma14_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma14_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[14]),
					    .done_mbox_dma(done_mbox_dma14),
					    .mbox_dma_scheduled(mbox_dma14_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_15
niu_tdmc_mbox_context niu_tdmc_mbox_context_15 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma15),
					    .mbox_dma_data(mbox_dma15_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma15_data_valid),
					    .mbox_dma_data_done(mbox_dma15_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma15_mb),
					    .set_cfg_dma_mmk(set_cfg_dma15_mmk),
					    .set_cfg_dma_mk(set_cfg_dma15_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma15_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma15_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma15_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma15_enable_mb),
					    .tx_cs_dma(tx_cs_dma15[63:0]),
					    .tx_dma_pre_st(tx_dma15_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma15[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma15[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma15_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma15_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma15_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[15]),
					    .done_mbox_dma(done_mbox_dma15),
					    .mbox_dma_scheduled(mbox_dma15_scheduled),
					    .meta_data_req(meta_data_req));

`ifdef NEPTUNE
// DMA_16
niu_tdmc_mbox_context niu_tdmc_mbox_context_16 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma16),
					    .mbox_dma_data(mbox_dma16_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma16_data_valid),
					    .mbox_dma_data_done(mbox_dma16_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma16_mb),
					    .set_cfg_dma_mmk(set_cfg_dma16_mmk),
					    .set_cfg_dma_mk(set_cfg_dma16_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma16_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma16_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma16_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma16_enable_mb),
					    .tx_cs_dma(tx_cs_dma16[63:0]),
					    .tx_dma_pre_st(tx_dma16_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma16[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma16[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma16_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma16_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma16_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[16]),
					    .done_mbox_dma(done_mbox_dma16),
					    .mbox_dma_scheduled(mbox_dma16_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_17
niu_tdmc_mbox_context niu_tdmc_mbox_context_17 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma17),
					    .mbox_dma_data(mbox_dma17_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma17_data_valid),
					    .mbox_dma_data_done(mbox_dma17_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma17_mb),
					    .set_cfg_dma_mmk(set_cfg_dma17_mmk),
					    .set_cfg_dma_mk(set_cfg_dma17_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma17_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma17_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma17_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma17_enable_mb),
					    .tx_cs_dma(tx_cs_dma17[63:0]),
					    .tx_dma_pre_st(tx_dma17_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma17[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma17[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma17_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma17_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma17_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[17]),
					    .done_mbox_dma(done_mbox_dma17),
					    .mbox_dma_scheduled(mbox_dma17_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_18
niu_tdmc_mbox_context niu_tdmc_mbox_context_18 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma18),
					    .mbox_dma_data(mbox_dma18_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma18_data_valid),
					    .mbox_dma_data_done(mbox_dma18_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma18_mb),
					    .set_cfg_dma_mmk(set_cfg_dma18_mmk),
					    .set_cfg_dma_mk(set_cfg_dma18_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma18_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma18_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma18_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma18_enable_mb),
					    .tx_cs_dma(tx_cs_dma18[63:0]),
					    .tx_dma_pre_st(tx_dma18_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma18[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma18[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma18_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma18_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma18_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[18]),
					    .done_mbox_dma(done_mbox_dma18),
					    .mbox_dma_scheduled(mbox_dma18_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_19
niu_tdmc_mbox_context niu_tdmc_mbox_context_19 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma19),
					    .mbox_dma_data(mbox_dma19_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma19_data_valid),
					    .mbox_dma_data_done(mbox_dma19_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma19_mb),
					    .set_cfg_dma_mmk(set_cfg_dma19_mmk),
					    .set_cfg_dma_mk(set_cfg_dma19_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma19_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma19_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma19_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma19_enable_mb),
					    .tx_cs_dma(tx_cs_dma19[63:0]),
					    .tx_dma_pre_st(tx_dma19_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma19[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma19[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma19_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma19_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma19_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[19]),
					    .done_mbox_dma(done_mbox_dma19),
					    .mbox_dma_scheduled(mbox_dma19_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_20
niu_tdmc_mbox_context niu_tdmc_mbox_context_20 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma20),
					    .mbox_dma_data(mbox_dma20_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma20_data_valid),
					    .mbox_dma_data_done(mbox_dma20_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma20_mb),
					    .set_cfg_dma_mmk(set_cfg_dma20_mmk),
					    .set_cfg_dma_mk(set_cfg_dma20_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma20_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma20_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma20_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma20_enable_mb),
					    .tx_cs_dma(tx_cs_dma20[63:0]),
					    .tx_dma_pre_st(tx_dma20_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma20[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma20[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma20_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma20_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma20_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[20]),
					    .done_mbox_dma(done_mbox_dma20),
					    .mbox_dma_scheduled(mbox_dma20_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_21
niu_tdmc_mbox_context niu_tdmc_mbox_context_21 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma21),
					    .mbox_dma_data(mbox_dma21_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma21_data_valid),
					    .mbox_dma_data_done(mbox_dma21_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma21_mb),
					    .set_cfg_dma_mmk(set_cfg_dma21_mmk),
					    .set_cfg_dma_mk(set_cfg_dma21_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma21_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma21_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma21_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma21_enable_mb),
					    .tx_cs_dma(tx_cs_dma21[63:0]),
					    .tx_dma_pre_st(tx_dma21_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma21[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma21[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma21_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma21_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma21_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[21]),
					    .done_mbox_dma(done_mbox_dma21),
					    .mbox_dma_scheduled(mbox_dma21_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_22
niu_tdmc_mbox_context niu_tdmc_mbox_context_22 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma22),
					    .mbox_dma_data(mbox_dma22_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma22_data_valid),
					    .mbox_dma_data_done(mbox_dma22_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma22_mb),
					    .set_cfg_dma_mmk(set_cfg_dma22_mmk),
					    .set_cfg_dma_mk(set_cfg_dma22_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma22_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma22_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma22_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma22_enable_mb),
					    .tx_cs_dma(tx_cs_dma22[63:0]),
					    .tx_dma_pre_st(tx_dma22_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma22[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma22[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma22_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma22_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma22_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[22]),
					    .done_mbox_dma(done_mbox_dma22),
					    .mbox_dma_scheduled(mbox_dma22_scheduled),
					    .meta_data_req(meta_data_req));

// DMA_23
niu_tdmc_mbox_context niu_tdmc_mbox_context_23 (/**/
					    // Outputs
					    .send_mbox_dma(send_mbox_dma23),
					    .mbox_dma_data(mbox_dma23_data[127:0]),
					    .mbox_dma_data_valid(mbox_dma23_data_valid),
					    .mbox_dma_data_done(mbox_dma23_data_done),
					    .clear_cfg_dma_mb(clear_cfg_dma23_mb),
					    .set_cfg_dma_mmk(set_cfg_dma23_mmk),
					    .set_cfg_dma_mk(set_cfg_dma23_mk),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .txc_dmc_dma_mark_bit(txc_dmc_dma23_mark_bit),
					    .tx_cfg_dma_mk(tx_cfg_dma23_mk),
					    .tx_cfg_dma_mmk(tx_cfg_dma23_mmk),
					    .tx_cfg_dma_enable_mb(tx_cfg_dma23_enable_mb),
					    .tx_cs_dma(tx_cs_dma23[63:0]),
					    .tx_dma_pre_st(tx_dma23_pre_st[63:0]),
					    .tx_rng_head_dma(tx_rng_head_dma23[`PTR_WIDTH:0]),
					    .tx_rng_tail_dma(tx_rng_tail_dma23[`PTR_WIDTH:0]),
					    .tx_dma_rng_err_logh(tx_dma23_rng_err_logh),				
					    .tx_dma_rng_err_logl(tx_dma23_rng_err_logl),				
					    .mbox_ack_dma_received(mbox_ack_dma23_received),
					    .mbox_ack_dma_received_error(mbox_ack_dma_err_received[23]),
					    .done_mbox_dma(done_mbox_dma23),
					    .mbox_dma_scheduled(mbox_dma23_scheduled),
					    .meta_data_req(meta_data_req));

`else
`endif

   

   niu_tdmc_sendmbox niu_tdmc_sendmbox(/*AUTOJUNK*/
				       // Outputs
				       .mbox_dma0_scheduled(mbox_dma0_scheduled),
				       .done_mbox_dma0(done_mbox_dma0),
				       .mbox_ack_dma0_received(mbox_ack_dma0_received),
				       .mbox_dma1_scheduled(mbox_dma1_scheduled),
				       .done_mbox_dma1(done_mbox_dma1),
				       .mbox_ack_dma1_received(mbox_ack_dma1_received),
				       .mbox_dma2_scheduled(mbox_dma2_scheduled),
				       .done_mbox_dma2(done_mbox_dma2),
				       .mbox_ack_dma2_received(mbox_ack_dma2_received),
				       .mbox_dma3_scheduled(mbox_dma3_scheduled),
				       .done_mbox_dma3(done_mbox_dma3),
				       .mbox_ack_dma3_received(mbox_ack_dma3_received),
				       .mbox_dma4_scheduled(mbox_dma4_scheduled),
				       .done_mbox_dma4(done_mbox_dma4),
				       .mbox_ack_dma4_received(mbox_ack_dma4_received),
				       .mbox_dma5_scheduled(mbox_dma5_scheduled),
				       .done_mbox_dma5(done_mbox_dma5),
				       .mbox_ack_dma5_received(mbox_ack_dma5_received),
				       .mbox_dma6_scheduled(mbox_dma6_scheduled),
				       .done_mbox_dma6(done_mbox_dma6),
				       .mbox_ack_dma6_received(mbox_ack_dma6_received),
				       .mbox_dma7_scheduled(mbox_dma7_scheduled),
				       .done_mbox_dma7(done_mbox_dma7),
				       .mbox_ack_dma7_received(mbox_ack_dma7_received),
				       .mbox_dma8_scheduled(mbox_dma8_scheduled),
				       .done_mbox_dma8(done_mbox_dma8),
				       .mbox_ack_dma8_received(mbox_ack_dma8_received),
				       .mbox_dma9_scheduled(mbox_dma9_scheduled),
				       .done_mbox_dma9(done_mbox_dma9),
				       .mbox_ack_dma9_received(mbox_ack_dma9_received),
				       .mbox_dma10_scheduled(mbox_dma10_scheduled),
				       .done_mbox_dma10(done_mbox_dma10),
				       .mbox_ack_dma10_received(mbox_ack_dma10_received),
				       .mbox_dma11_scheduled(mbox_dma11_scheduled),
				       .done_mbox_dma11(done_mbox_dma11),
				       .mbox_ack_dma11_received(mbox_ack_dma11_received),
				       .mbox_dma12_scheduled(mbox_dma12_scheduled),
				       .done_mbox_dma12(done_mbox_dma12),
				       .mbox_ack_dma12_received(mbox_ack_dma12_received),
				       .mbox_dma13_scheduled(mbox_dma13_scheduled),
				       .done_mbox_dma13(done_mbox_dma13),
				       .mbox_ack_dma13_received(mbox_ack_dma13_received),
				       .mbox_dma14_scheduled(mbox_dma14_scheduled),
				       .done_mbox_dma14(done_mbox_dma14),
				       .mbox_ack_dma14_received(mbox_ack_dma14_received),
				       .mbox_dma15_scheduled(mbox_dma15_scheduled),
				       .done_mbox_dma15(done_mbox_dma15),
				       .mbox_ack_dma15_received(mbox_ack_dma15_received),
`ifdef NEPTUNE
				       .mbox_dma16_scheduled(mbox_dma16_scheduled),
				       .done_mbox_dma16(done_mbox_dma16),
				       .mbox_ack_dma16_received(mbox_ack_dma16_received),
				       .mbox_dma17_scheduled(mbox_dma17_scheduled),
				       .done_mbox_dma17(done_mbox_dma17),
				       .mbox_ack_dma17_received(mbox_ack_dma17_received),
				       .mbox_dma18_scheduled(mbox_dma18_scheduled),
				       .done_mbox_dma18(done_mbox_dma18),
				       .mbox_ack_dma18_received(mbox_ack_dma18_received),
				       .mbox_dma19_scheduled(mbox_dma19_scheduled),
				       .done_mbox_dma19(done_mbox_dma19),
				       .mbox_ack_dma19_received(mbox_ack_dma19_received),
				       .mbox_dma20_scheduled(mbox_dma20_scheduled),
				       .done_mbox_dma20(done_mbox_dma20),
				       .mbox_ack_dma20_received(mbox_ack_dma20_received),
				       .mbox_dma21_scheduled(mbox_dma21_scheduled),
				       .done_mbox_dma21(done_mbox_dma21),
				       .mbox_ack_dma21_received(mbox_ack_dma21_received),
				       .mbox_dma22_scheduled(mbox_dma22_scheduled),
				       .done_mbox_dma22(done_mbox_dma22),
				       .mbox_ack_dma22_received(mbox_ack_dma22_received),
				       .mbox_dma23_scheduled(mbox_dma23_scheduled),
				       .done_mbox_dma23(done_mbox_dma23),
				       .mbox_ack_dma23_received(mbox_ack_dma23_received),
`else
`endif
				       .set_mbox_part_error_dma(set_mbox_part_error_dma[`NO_OF_DMAS-1:0]),
				       .mbox_ack_dma_err_received(mbox_ack_dma_err_received[`NO_OF_DMAS-1:0]),
				       .mbox_err_received(mbox_err_received),
				       .meta_data_req(meta_data_req),
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
				       .mbox_debug_state(mbox_debug_state[11:0]),
				       // Inputs
				       .SysClk(SysClk),
				       .Reset_L(Reset_L),
				       .send_mbox_dma0(send_mbox_dma0),
				       .mbox_dma0_data_valid(mbox_dma0_data_valid),
				       .mbox_dma0_data_done(mbox_dma0_data_done),
				       .mbox_dma0_data(mbox_dma0_data[127:0]),
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
				       .send_mbox_dma1(send_mbox_dma1),
				       .mbox_dma1_data_valid(mbox_dma1_data_valid),
				       .mbox_dma1_data_done(mbox_dma1_data_done),
				       .mbox_dma1_data(mbox_dma1_data[127:0]),
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
				       .send_mbox_dma2(send_mbox_dma2),
				       .mbox_dma2_data_valid(mbox_dma2_data_valid),
				       .mbox_dma2_data_done(mbox_dma2_data_done),
				       .mbox_dma2_data(mbox_dma2_data[127:0]),
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
				       .send_mbox_dma3(send_mbox_dma3),
				       .mbox_dma3_data_valid(mbox_dma3_data_valid),
				       .mbox_dma3_data_done(mbox_dma3_data_done),
				       .mbox_dma3_data(mbox_dma3_data[127:0]),
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
				       .send_mbox_dma4(send_mbox_dma4),
				       .mbox_dma4_data_valid(mbox_dma4_data_valid),
				       .mbox_dma4_data_done(mbox_dma4_data_done),
				       .mbox_dma4_data(mbox_dma4_data[127:0]),
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
				       .send_mbox_dma5(send_mbox_dma5),
				       .mbox_dma5_data_valid(mbox_dma5_data_valid),
				       .mbox_dma5_data_done(mbox_dma5_data_done),
				       .mbox_dma5_data(mbox_dma5_data[127:0]),
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
				       .send_mbox_dma6(send_mbox_dma6),
				       .mbox_dma6_data_valid(mbox_dma6_data_valid),
				       .mbox_dma6_data_done(mbox_dma6_data_done),
				       .mbox_dma6_data(mbox_dma6_data[127:0]),
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
				       .send_mbox_dma7(send_mbox_dma7),
				       .mbox_dma7_data_valid(mbox_dma7_data_valid),
				       .mbox_dma7_data_done(mbox_dma7_data_done),
				       .mbox_dma7_data(mbox_dma7_data[127:0]),
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
				       .send_mbox_dma8(send_mbox_dma8),
				       .mbox_dma8_data_valid(mbox_dma8_data_valid),
				       .mbox_dma8_data_done(mbox_dma8_data_done),
				       .mbox_dma8_data(mbox_dma8_data[127:0]),
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
				       .send_mbox_dma9(send_mbox_dma9),
				       .mbox_dma9_data_valid(mbox_dma9_data_valid),
				       .mbox_dma9_data_done(mbox_dma9_data_done),
				       .mbox_dma9_data(mbox_dma9_data[127:0]),
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
				       .send_mbox_dma10(send_mbox_dma10),
				       .mbox_dma10_data_valid(mbox_dma10_data_valid),
				       .mbox_dma10_data_done(mbox_dma10_data_done),
				       .mbox_dma10_data(mbox_dma10_data[127:0]),
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
				       .send_mbox_dma11(send_mbox_dma11),
				       .mbox_dma11_data_valid(mbox_dma11_data_valid),
				       .mbox_dma11_data_done(mbox_dma11_data_done),
				       .mbox_dma11_data(mbox_dma11_data[127:0]),
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
				       .send_mbox_dma12(send_mbox_dma12),
				       .mbox_dma12_data_valid(mbox_dma12_data_valid),
				       .mbox_dma12_data_done(mbox_dma12_data_done),
				       .mbox_dma12_data(mbox_dma12_data[127:0]),
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
				       .send_mbox_dma13(send_mbox_dma13),
				       .mbox_dma13_data_valid(mbox_dma13_data_valid),
				       .mbox_dma13_data_done(mbox_dma13_data_done),
				       .mbox_dma13_data(mbox_dma13_data[127:0]),
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
				       .send_mbox_dma14(send_mbox_dma14),
				       .mbox_dma14_data_valid(mbox_dma14_data_valid),
				       .mbox_dma14_data_done(mbox_dma14_data_done),
				       .mbox_dma14_data(mbox_dma14_data[127:0]),
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
				       .send_mbox_dma15(send_mbox_dma15),
				       .mbox_dma15_data_valid(mbox_dma15_data_valid),
				       .mbox_dma15_data_done(mbox_dma15_data_done),
				       .mbox_dma15_data(mbox_dma15_data[127:0]),
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
				       .send_mbox_dma16(send_mbox_dma16),
				       .mbox_dma16_data_valid(mbox_dma16_data_valid),
				       .mbox_dma16_data_done(mbox_dma16_data_done),
				       .mbox_dma16_data(mbox_dma16_data[127:0]),
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
				       .send_mbox_dma17(send_mbox_dma17),
				       .mbox_dma17_data_valid(mbox_dma17_data_valid),
				       .mbox_dma17_data_done(mbox_dma17_data_done),
				       .mbox_dma17_data(mbox_dma17_data[127:0]),
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
				       .send_mbox_dma18(send_mbox_dma18),
				       .mbox_dma18_data_valid(mbox_dma18_data_valid),
				       .mbox_dma18_data_done(mbox_dma18_data_done),
				       .mbox_dma18_data(mbox_dma18_data[127:0]),
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
				       .send_mbox_dma19(send_mbox_dma19),
				       .mbox_dma19_data_valid(mbox_dma19_data_valid),
				       .mbox_dma19_data_done(mbox_dma19_data_done),
				       .mbox_dma19_data(mbox_dma19_data[127:0]),
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
				       .send_mbox_dma20(send_mbox_dma20),
				       .mbox_dma20_data_valid(mbox_dma20_data_valid),
				       .mbox_dma20_data_done(mbox_dma20_data_done),
				       .mbox_dma20_data(mbox_dma20_data[127:0]),
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
				       .send_mbox_dma21(send_mbox_dma21),
				       .mbox_dma21_data_valid(mbox_dma21_data_valid),
				       .mbox_dma21_data_done(mbox_dma21_data_done),
				       .mbox_dma21_data(mbox_dma21_data[127:0]),
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
				       .send_mbox_dma22(send_mbox_dma22),
				       .mbox_dma22_data_valid(mbox_dma22_data_valid),
				       .mbox_dma22_data_done(mbox_dma22_data_done),
				       .mbox_dma22_data(mbox_dma22_data[127:0]),
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
				       .send_mbox_dma23(send_mbox_dma23),
				       .mbox_dma23_data_valid(mbox_dma23_data_valid),
				       .mbox_dma23_data_done(mbox_dma23_data_done),
				       .mbox_dma23_data(mbox_dma23_data[127:0]),
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
`else
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
`else
`endif
				       .arb0_tdmc_data_req(arb0_tdmc_data_req),
				       .arb0_tdmc_req_accept(arb0_tdmc_req_accept),
				       .meta_dmc_ack_dma_num(meta_dmc_ack_dma_num[4:0]),
				       .meta_dmc_ack_client(meta_dmc_ack_client),
				       .meta_dmc_ack_complete(meta_dmc_ack_complete),
				       .meta_dmc_ack_ready(meta_dmc_ack_ready),
				       .meta_dmc_ack_cmd(meta_dmc_ack_cmd[7:0]),
				       .meta_dmc_ack_cmd_status(meta_dmc_ack_cmd_status[3:0]));	
   

   
endmodule

