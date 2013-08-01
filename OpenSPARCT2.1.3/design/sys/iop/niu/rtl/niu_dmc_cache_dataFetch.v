// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_dmc_cache_dataFetch.v
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

module niu_dmc_cache_dataFetch ( /*AUTOJUNK*/
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
			sram_reset,
				 
`endif // !ifdef NEPTUNE
   // Outputs
   TxCacheFetchState, DMC_TxCache_SMX_Req, 
   DMC_TxCache_SMX_Req_Port_Num, DMC_TxCache_SMX_Req_DMA_Num, 
   DMC_TxCache_SMX_Req_Cmd, DMC_TxCache_SMX_Req_Length, 
   DMC_TxCache_SMX_Req_Address, tdmc_arb1_req_func_num, 
   DMC_TxCache_SMX_Resp_Accept, txpref_dma_nack_resp, 
   txpref_nack_resp, txpref_nack_rd_addr, dmc_txc_dma0_active, 
   dmc_txc_dma0_eoflist,  dmc_txc_dma0_gotnxtdesc, 
   dmc_txc_dma0_descriptor, dmc_txc_dma0_cacheready, 
   dmc_txc_dma0_partial, dmc_txc_dma0_reset_scheduled, 
   tx_rng_head_dma0, 
   dma0_clear_reset, tx_dma_cfg_dma0_stop_state, 
   ShadowRingCurrentPtr_DMA0, set_pref_buf_par_err_dma0, 
   set_pkt_part_err_dma0, pkt_part_error_address_dma0, 
   set_conf_part_error_dma0, dmc_txc_dma1_active, 
   dmc_txc_dma1_eoflist,  dmc_txc_dma1_gotnxtdesc, 
   dmc_txc_dma1_descriptor, dmc_txc_dma1_cacheready, 
   dmc_txc_dma1_partial, dmc_txc_dma1_reset_scheduled, 
   tx_rng_head_dma1, 
   dma1_clear_reset, tx_dma_cfg_dma1_stop_state, 
   ShadowRingCurrentPtr_DMA1, set_pref_buf_par_err_dma1, 
   set_pkt_part_err_dma1, pkt_part_error_address_dma1, 
   set_conf_part_error_dma1, dmc_txc_dma2_active, 
   dmc_txc_dma2_eoflist, dmc_txc_dma2_gotnxtdesc, 
   dmc_txc_dma2_descriptor, dmc_txc_dma2_cacheready, 
   dmc_txc_dma2_partial, dmc_txc_dma2_reset_scheduled, 
   tx_rng_head_dma2, 
   dma2_clear_reset, tx_dma_cfg_dma2_stop_state, 
   ShadowRingCurrentPtr_DMA2, set_pref_buf_par_err_dma2, 
   set_pkt_part_err_dma2, pkt_part_error_address_dma2, 
   set_conf_part_error_dma2, dmc_txc_dma3_active, 
   dmc_txc_dma3_eoflist, dmc_txc_dma3_gotnxtdesc, 
   dmc_txc_dma3_descriptor, dmc_txc_dma3_cacheready, 
   dmc_txc_dma3_partial, dmc_txc_dma3_reset_scheduled, 
   tx_rng_head_dma3, 
   dma3_clear_reset, tx_dma_cfg_dma3_stop_state, 
   ShadowRingCurrentPtr_DMA3, set_pref_buf_par_err_dma3, 
   set_pkt_part_err_dma3, pkt_part_error_address_dma3, 
   set_conf_part_error_dma3, dmc_txc_dma4_active, 
   dmc_txc_dma4_eoflist, dmc_txc_dma4_gotnxtdesc, 
   dmc_txc_dma4_descriptor, dmc_txc_dma4_cacheready, 
   dmc_txc_dma4_partial, dmc_txc_dma4_reset_scheduled, 
   tx_rng_head_dma4, 
   dma4_clear_reset, tx_dma_cfg_dma4_stop_state, 
   ShadowRingCurrentPtr_DMA4, set_pref_buf_par_err_dma4, 
   set_pkt_part_err_dma4, pkt_part_error_address_dma4, 
   set_conf_part_error_dma4, dmc_txc_dma5_active, 
   dmc_txc_dma5_eoflist, dmc_txc_dma5_gotnxtdesc, 
   dmc_txc_dma5_descriptor, dmc_txc_dma5_cacheready, 
   dmc_txc_dma5_partial, dmc_txc_dma5_reset_scheduled, 
   tx_rng_head_dma5, 
   dma5_clear_reset, tx_dma_cfg_dma5_stop_state, 
   ShadowRingCurrentPtr_DMA5, set_pref_buf_par_err_dma5, 
   set_pkt_part_err_dma5, pkt_part_error_address_dma5, 
   set_conf_part_error_dma5, dmc_txc_dma6_active, 
   dmc_txc_dma6_eoflist, dmc_txc_dma6_gotnxtdesc, 
   dmc_txc_dma6_descriptor, dmc_txc_dma6_cacheready, 
   dmc_txc_dma6_partial, dmc_txc_dma6_reset_scheduled, 
   tx_rng_head_dma6, 
   dma6_clear_reset, tx_dma_cfg_dma6_stop_state, 
   ShadowRingCurrentPtr_DMA6, set_pref_buf_par_err_dma6, 
   set_pkt_part_err_dma6, pkt_part_error_address_dma6, 
   set_conf_part_error_dma6, dmc_txc_dma7_active, 
   dmc_txc_dma7_eoflist, dmc_txc_dma7_gotnxtdesc, 
   dmc_txc_dma7_descriptor, dmc_txc_dma7_cacheready, 
   dmc_txc_dma7_partial, dmc_txc_dma7_reset_scheduled, 
   tx_rng_head_dma7, 
   dma7_clear_reset, tx_dma_cfg_dma7_stop_state, 
   ShadowRingCurrentPtr_DMA7, set_pref_buf_par_err_dma7, 
   set_pkt_part_err_dma7, pkt_part_error_address_dma7, 
   set_conf_part_error_dma7, dmc_txc_dma8_active, 
   dmc_txc_dma8_eoflist, dmc_txc_dma8_gotnxtdesc, 
   dmc_txc_dma8_descriptor, dmc_txc_dma8_cacheready, 
   dmc_txc_dma8_partial, dmc_txc_dma8_reset_scheduled, 
   tx_rng_head_dma8, 
   dma8_clear_reset, tx_dma_cfg_dma8_stop_state, 
   ShadowRingCurrentPtr_DMA8, set_pref_buf_par_err_dma8, 
   set_pkt_part_err_dma8, pkt_part_error_address_dma8, 
   set_conf_part_error_dma8, dmc_txc_dma9_active, 
   dmc_txc_dma9_eoflist, dmc_txc_dma9_gotnxtdesc, 
   dmc_txc_dma9_descriptor, dmc_txc_dma9_cacheready, 
   dmc_txc_dma9_partial, dmc_txc_dma9_reset_scheduled, 
   tx_rng_head_dma9, 
   dma9_clear_reset, tx_dma_cfg_dma9_stop_state, 
   ShadowRingCurrentPtr_DMA9, set_pref_buf_par_err_dma9, 
   set_pkt_part_err_dma9, pkt_part_error_address_dma9, 
   set_conf_part_error_dma9, dmc_txc_dma10_active, 
   dmc_txc_dma10_eoflist, 
   dmc_txc_dma10_gotnxtdesc, dmc_txc_dma10_descriptor, 
   dmc_txc_dma10_cacheready, dmc_txc_dma10_partial, 
   dmc_txc_dma10_reset_scheduled,  
   tx_rng_head_dma10, dma10_clear_reset, 
   tx_dma_cfg_dma10_stop_state, ShadowRingCurrentPtr_DMA10, 
   set_pref_buf_par_err_dma10, set_pkt_part_err_dma10, 
   pkt_part_error_address_dma10, set_conf_part_error_dma10, 
   dmc_txc_dma11_active, dmc_txc_dma11_eoflist, 
   dmc_txc_dma11_gotnxtdesc, dmc_txc_dma11_descriptor, 
   dmc_txc_dma11_cacheready, dmc_txc_dma11_partial, 
   dmc_txc_dma11_reset_scheduled, 
   tx_rng_head_dma11, dma11_clear_reset, 
   tx_dma_cfg_dma11_stop_state, ShadowRingCurrentPtr_DMA11, 
   set_pref_buf_par_err_dma11, set_pkt_part_err_dma11, 
   pkt_part_error_address_dma11, set_conf_part_error_dma11, 
   dmc_txc_dma12_active, dmc_txc_dma12_eoflist, 
   dmc_txc_dma12_gotnxtdesc, dmc_txc_dma12_descriptor, 
   dmc_txc_dma12_cacheready, dmc_txc_dma12_partial, 
   dmc_txc_dma12_reset_scheduled, 
   tx_rng_head_dma12, dma12_clear_reset, 
   tx_dma_cfg_dma12_stop_state, ShadowRingCurrentPtr_DMA12, 
   set_pref_buf_par_err_dma12, set_pkt_part_err_dma12, 
   pkt_part_error_address_dma12, set_conf_part_error_dma12, 
   dmc_txc_dma13_active, dmc_txc_dma13_eoflist, 
   dmc_txc_dma13_gotnxtdesc, dmc_txc_dma13_descriptor, 
   dmc_txc_dma13_cacheready, dmc_txc_dma13_partial, 
   dmc_txc_dma13_reset_scheduled,  
   tx_rng_head_dma13, dma13_clear_reset, 
   tx_dma_cfg_dma13_stop_state, ShadowRingCurrentPtr_DMA13, 
   set_pref_buf_par_err_dma13, set_pkt_part_err_dma13, 
   pkt_part_error_address_dma13, set_conf_part_error_dma13, 
   dmc_txc_dma14_active, dmc_txc_dma14_eoflist, 
   dmc_txc_dma14_gotnxtdesc, dmc_txc_dma14_descriptor, 
   dmc_txc_dma14_cacheready, dmc_txc_dma14_partial, 
   dmc_txc_dma14_reset_scheduled,  
   tx_rng_head_dma14, dma14_clear_reset, 
   tx_dma_cfg_dma14_stop_state, ShadowRingCurrentPtr_DMA14, 
   set_pref_buf_par_err_dma14, set_pkt_part_err_dma14, 
   pkt_part_error_address_dma14, set_conf_part_error_dma14, 
   dmc_txc_dma15_active, dmc_txc_dma15_eoflist, 
   dmc_txc_dma15_gotnxtdesc, dmc_txc_dma15_descriptor, 
   dmc_txc_dma15_cacheready, dmc_txc_dma15_partial, 
   dmc_txc_dma15_reset_scheduled,  
   tx_rng_head_dma15, dma15_clear_reset, 
   tx_dma_cfg_dma15_stop_state, ShadowRingCurrentPtr_DMA15, 
   set_pref_buf_par_err_dma15, set_pkt_part_err_dma15, 
   pkt_part_error_address_dma15, set_conf_part_error_dma15, 
   set_tx_ring_oflow_dma0, set_tx_ring_oflow_dma1, set_tx_ring_oflow_dma2,
   set_tx_ring_oflow_dma3, set_tx_ring_oflow_dma4, set_tx_ring_oflow_dma5,
   set_tx_ring_oflow_dma6, set_tx_ring_oflow_dma7, set_tx_ring_oflow_dma8,
   set_tx_ring_oflow_dma9, set_tx_ring_oflow_dma10, set_tx_ring_oflow_dma11,
   set_tx_ring_oflow_dma12, set_tx_ring_oflow_dma13, set_tx_ring_oflow_dma14,
   set_tx_ring_oflow_dma15,

   dma0_debug_port, dma1_debug_port, dma2_debug_port, dma3_debug_port,
   dma4_debug_port, dma5_debug_port, dma6_debug_port, dma7_debug_port,
   dma8_debug_port, dma9_debug_port, dma10_debug_port, dma11_debug_port,
   dma12_debug_port, dma13_debug_port, dma14_debug_port, dma15_debug_port,

`ifdef NEPTUNE
				 
   dmc_txc_dma16_active, dmc_txc_dma16_eoflist, 
   dmc_txc_dma16_gotnxtdesc, dmc_txc_dma16_descriptor, 
   dmc_txc_dma16_cacheready, dmc_txc_dma16_partial, 
   dmc_txc_dma16_reset_scheduled,  
   tx_rng_head_dma16, dma16_clear_reset, 
   tx_dma_cfg_dma16_stop_state, ShadowRingCurrentPtr_DMA16, 
   set_pref_buf_par_err_dma16, set_pkt_part_err_dma16, 
   pkt_part_error_address_dma16, set_conf_part_error_dma16, 
   dmc_txc_dma17_active, dmc_txc_dma17_eoflist, 
   dmc_txc_dma17_gotnxtdesc, dmc_txc_dma17_descriptor, 
   dmc_txc_dma17_cacheready, dmc_txc_dma17_partial, 
   dmc_txc_dma17_reset_scheduled,  
   tx_rng_head_dma17, dma17_clear_reset, 
   tx_dma_cfg_dma17_stop_state, ShadowRingCurrentPtr_DMA17, 
   set_pref_buf_par_err_dma17, set_pkt_part_err_dma17, 
   pkt_part_error_address_dma17, set_conf_part_error_dma17, 
   dmc_txc_dma18_active, dmc_txc_dma18_eoflist, 
   dmc_txc_dma18_gotnxtdesc, dmc_txc_dma18_descriptor, 
   dmc_txc_dma18_cacheready, dmc_txc_dma18_partial, 
   dmc_txc_dma18_reset_scheduled, 
   tx_rng_head_dma18, dma18_clear_reset, 
   tx_dma_cfg_dma18_stop_state, ShadowRingCurrentPtr_DMA18, 
   set_pref_buf_par_err_dma18, set_pkt_part_err_dma18, 
   pkt_part_error_address_dma18, set_conf_part_error_dma18, 
   dmc_txc_dma19_active, dmc_txc_dma19_eoflist, 
   dmc_txc_dma19_gotnxtdesc, dmc_txc_dma19_descriptor, 
   dmc_txc_dma19_cacheready, dmc_txc_dma19_partial, 
   dmc_txc_dma19_reset_scheduled, 
   tx_rng_head_dma19, dma19_clear_reset, 
   tx_dma_cfg_dma19_stop_state, ShadowRingCurrentPtr_DMA19, 
   set_pref_buf_par_err_dma19, set_pkt_part_err_dma19, 
   pkt_part_error_address_dma19, set_conf_part_error_dma19, 
   dmc_txc_dma20_active, dmc_txc_dma20_eoflist, 
   dmc_txc_dma20_gotnxtdesc, dmc_txc_dma20_descriptor, 
   dmc_txc_dma20_cacheready, dmc_txc_dma20_partial, 
   dmc_txc_dma20_reset_scheduled, 
   tx_rng_head_dma20, dma20_clear_reset, 
   tx_dma_cfg_dma20_stop_state, ShadowRingCurrentPtr_DMA20, 
   set_pref_buf_par_err_dma20, set_pkt_part_err_dma20, 
   pkt_part_error_address_dma20, set_conf_part_error_dma20, 
   dmc_txc_dma21_active, dmc_txc_dma21_eoflist, 
   dmc_txc_dma21_gotnxtdesc, dmc_txc_dma21_descriptor, 
   dmc_txc_dma21_cacheready, dmc_txc_dma21_partial, 
   dmc_txc_dma21_reset_scheduled, 
   tx_rng_head_dma21, dma21_clear_reset, 
   tx_dma_cfg_dma21_stop_state, ShadowRingCurrentPtr_DMA21, 
   set_pref_buf_par_err_dma21, set_pkt_part_err_dma21, 
   pkt_part_error_address_dma21, set_conf_part_error_dma21, 
   dmc_txc_dma22_active, dmc_txc_dma22_eoflist, 
   dmc_txc_dma22_gotnxtdesc, dmc_txc_dma22_descriptor, 
   dmc_txc_dma22_cacheready, dmc_txc_dma22_partial, 
   dmc_txc_dma22_reset_scheduled, 
   tx_rng_head_dma22, dma22_clear_reset, 
   tx_dma_cfg_dma22_stop_state, ShadowRingCurrentPtr_DMA22, 
   set_pref_buf_par_err_dma22, set_pkt_part_err_dma22, 
   pkt_part_error_address_dma22, set_conf_part_error_dma22, 
   dmc_txc_dma23_active, dmc_txc_dma23_eoflist, 
   dmc_txc_dma23_gotnxtdesc, dmc_txc_dma23_descriptor, 
   dmc_txc_dma23_cacheready, dmc_txc_dma23_partial, 
   dmc_txc_dma23_reset_scheduled, 
   tx_rng_head_dma23, dma23_clear_reset, 
   tx_dma_cfg_dma23_stop_state, ShadowRingCurrentPtr_DMA23, 
   set_pref_buf_par_err_dma23, set_pkt_part_err_dma23, 
   pkt_part_error_address_dma23, set_conf_part_error_dma23, 
   set_tx_ring_oflow_dma16, set_tx_ring_oflow_dma17, set_tx_ring_oflow_dma18,
   set_tx_ring_oflow_dma19, set_tx_ring_oflow_dma20, set_tx_ring_oflow_dma21,
   set_tx_ring_oflow_dma22, set_tx_ring_oflow_dma23,

   dma16_debug_port, dma17_debug_port, dma18_debug_port, dma19_debug_port,
   dma20_debug_port, dma21_debug_port, dma22_debug_port, dma23_debug_port,

`endif // ifdef NEPTUNE
				 
   // Inputs
   SMX_DMC_TxCache_Req_Ack, SMX_DMC_TxCache_Resp_Rdy, 
   SMX_DMC_TxCache_Resp_Complete, SMX_DMC_TxCache_Trans_Complete, 
   SMX_DMC_TxCache_Resp_Data_Valid, SMX_DMC_TxCache_Resp_DMA_Num, 
   SMX_DMC_TxCache_Resp_ByteEnables, 
   SMX_DMC_TxCache_Resp_Data_Length, SMX_DMC_TxCache_Resp_Address, 
   SMX_DMC_TxCache_Resp_Data, meta_dmc_resp_cmd, 
   meta_dmc_resp_cmd_status, meta_dmc_data_status, 
   parity_corrupt_config, dmc_txc_tx_addr_md, 
   txc_dmc_dma0_getnxtdesc,  txc_dmc_dma0_inc_head, 
   txc_dmc_dma0_reset_done, tx_rng_cfg_dma0_len, 
   tx_rng_cfg_dma0_staddr, tx_rng_tail_dma0, tx_dma_cfg_dma0_rst, 
   tx_dma_cfg_dma0_stall, tx_dma_cfg_dma0_stop, page0_mask_dma0, 
   page0_value_dma0, page0_reloc_dma0, page0_valid_dma0, 
   page1_mask_dma0, page1_value_dma0, page1_reloc_dma0, 
   page1_valid_dma0, dmc_txc_dma0_page_handle, dmc_txc_dma0_func_num, 
   txc_dmc_dma1_getnxtdesc,  txc_dmc_dma1_inc_head, 
   txc_dmc_dma1_reset_done, tx_rng_cfg_dma1_len, 
   tx_rng_cfg_dma1_staddr, tx_rng_tail_dma1, tx_dma_cfg_dma1_rst, 
   tx_dma_cfg_dma1_stall, tx_dma_cfg_dma1_stop, page0_mask_dma1, 
   page0_value_dma1, page0_reloc_dma1, page0_valid_dma1, 
   page1_mask_dma1, page1_value_dma1, page1_reloc_dma1, 
   page1_valid_dma1, dmc_txc_dma1_page_handle, dmc_txc_dma1_func_num, 
   txc_dmc_dma2_getnxtdesc,  txc_dmc_dma2_inc_head, 
   txc_dmc_dma2_reset_done, tx_rng_cfg_dma2_len, 
   tx_rng_cfg_dma2_staddr, tx_rng_tail_dma2, tx_dma_cfg_dma2_rst, 
   tx_dma_cfg_dma2_stall, tx_dma_cfg_dma2_stop, page0_mask_dma2, 
   page0_value_dma2, page0_reloc_dma2, page0_valid_dma2, 
   page1_mask_dma2, page1_value_dma2, page1_reloc_dma2, 
   page1_valid_dma2, dmc_txc_dma2_page_handle, dmc_txc_dma2_func_num, 
   txc_dmc_dma3_getnxtdesc,  txc_dmc_dma3_inc_head, 
   txc_dmc_dma3_reset_done, tx_rng_cfg_dma3_len, 
   tx_rng_cfg_dma3_staddr, tx_rng_tail_dma3, tx_dma_cfg_dma3_rst, 
   tx_dma_cfg_dma3_stall, tx_dma_cfg_dma3_stop, page0_mask_dma3, 
   page0_value_dma3, page0_reloc_dma3, page0_valid_dma3, 
   page1_mask_dma3, page1_value_dma3, page1_reloc_dma3, 
   page1_valid_dma3, dmc_txc_dma3_page_handle, dmc_txc_dma3_func_num, 
   txc_dmc_dma4_getnxtdesc,  txc_dmc_dma4_inc_head, 
   txc_dmc_dma4_reset_done, tx_rng_cfg_dma4_len, 
   tx_rng_cfg_dma4_staddr, tx_rng_tail_dma4, tx_dma_cfg_dma4_rst, 
   tx_dma_cfg_dma4_stall, tx_dma_cfg_dma4_stop, page0_mask_dma4, 
   page0_value_dma4, page0_reloc_dma4, page0_valid_dma4, 
   page1_mask_dma4, page1_value_dma4, page1_reloc_dma4, 
   page1_valid_dma4, dmc_txc_dma4_page_handle, dmc_txc_dma4_func_num, 
   txc_dmc_dma5_getnxtdesc,  txc_dmc_dma5_inc_head, 
   txc_dmc_dma5_reset_done, tx_rng_cfg_dma5_len, 
   tx_rng_cfg_dma5_staddr, tx_rng_tail_dma5, tx_dma_cfg_dma5_rst, 
   tx_dma_cfg_dma5_stall, tx_dma_cfg_dma5_stop, page0_mask_dma5, 
   page0_value_dma5, page0_reloc_dma5, page0_valid_dma5, 
   page1_mask_dma5, page1_value_dma5, page1_reloc_dma5, 
   page1_valid_dma5, dmc_txc_dma5_page_handle, dmc_txc_dma5_func_num, 
   txc_dmc_dma6_getnxtdesc,  txc_dmc_dma6_inc_head, 
   txc_dmc_dma6_reset_done, tx_rng_cfg_dma6_len, 
   tx_rng_cfg_dma6_staddr, tx_rng_tail_dma6, tx_dma_cfg_dma6_rst, 
   tx_dma_cfg_dma6_stall, tx_dma_cfg_dma6_stop, page0_mask_dma6, 
   page0_value_dma6, page0_reloc_dma6, page0_valid_dma6, 
   page1_mask_dma6, page1_value_dma6, page1_reloc_dma6, 
   page1_valid_dma6, dmc_txc_dma6_page_handle, dmc_txc_dma6_func_num, 
   txc_dmc_dma7_getnxtdesc,  txc_dmc_dma7_inc_head, 
   txc_dmc_dma7_reset_done, tx_rng_cfg_dma7_len, 
   tx_rng_cfg_dma7_staddr, tx_rng_tail_dma7, tx_dma_cfg_dma7_rst, 
   tx_dma_cfg_dma7_stall, tx_dma_cfg_dma7_stop, page0_mask_dma7, 
   page0_value_dma7, page0_reloc_dma7, page0_valid_dma7, 
   page1_mask_dma7, page1_value_dma7, page1_reloc_dma7, 
   page1_valid_dma7, dmc_txc_dma7_page_handle, dmc_txc_dma7_func_num, 
   txc_dmc_dma8_getnxtdesc,  txc_dmc_dma8_inc_head, 
   txc_dmc_dma8_reset_done, tx_rng_cfg_dma8_len, 
   tx_rng_cfg_dma8_staddr, tx_rng_tail_dma8, tx_dma_cfg_dma8_rst, 
   tx_dma_cfg_dma8_stall, tx_dma_cfg_dma8_stop, page0_mask_dma8, 
   page0_value_dma8, page0_reloc_dma8, page0_valid_dma8, 
   page1_mask_dma8, page1_value_dma8, page1_reloc_dma8, 
   page1_valid_dma8, dmc_txc_dma8_page_handle, dmc_txc_dma8_func_num, 
   txc_dmc_dma9_getnxtdesc,  txc_dmc_dma9_inc_head, 
   txc_dmc_dma9_reset_done, tx_rng_cfg_dma9_len, 
   tx_rng_cfg_dma9_staddr, tx_rng_tail_dma9, tx_dma_cfg_dma9_rst, 
   tx_dma_cfg_dma9_stall, tx_dma_cfg_dma9_stop, page0_mask_dma9, 
   page0_value_dma9, page0_reloc_dma9, page0_valid_dma9, 
   page1_mask_dma9, page1_value_dma9, page1_reloc_dma9, 
   page1_valid_dma9, dmc_txc_dma9_page_handle, dmc_txc_dma9_func_num, 
   txc_dmc_dma10_getnxtdesc,  txc_dmc_dma10_inc_head, 
   txc_dmc_dma10_reset_done, tx_rng_cfg_dma10_len, 
   tx_rng_cfg_dma10_staddr, tx_rng_tail_dma10, tx_dma_cfg_dma10_rst, 
   tx_dma_cfg_dma10_stall, tx_dma_cfg_dma10_stop, page0_mask_dma10, 
   page0_value_dma10, page0_reloc_dma10, page0_valid_dma10, 
   page1_mask_dma10, page1_value_dma10, page1_reloc_dma10, 
   page1_valid_dma10, dmc_txc_dma10_page_handle, 
   dmc_txc_dma10_func_num, txc_dmc_dma11_getnxtdesc, 
   txc_dmc_dma11_inc_head, txc_dmc_dma11_reset_done, 
   tx_rng_cfg_dma11_len, tx_rng_cfg_dma11_staddr, tx_rng_tail_dma11, 
   tx_dma_cfg_dma11_rst, tx_dma_cfg_dma11_stall, 
   tx_dma_cfg_dma11_stop, page0_mask_dma11, page0_value_dma11, 
   page0_reloc_dma11, page0_valid_dma11, page1_mask_dma11, 
   page1_value_dma11, page1_reloc_dma11, page1_valid_dma11, 
   dmc_txc_dma11_page_handle, dmc_txc_dma11_func_num, 
   txc_dmc_dma12_getnxtdesc,  txc_dmc_dma12_inc_head, 
   txc_dmc_dma12_reset_done, tx_rng_cfg_dma12_len, 
   tx_rng_cfg_dma12_staddr, tx_rng_tail_dma12, tx_dma_cfg_dma12_rst, 
   tx_dma_cfg_dma12_stall, tx_dma_cfg_dma12_stop, page0_mask_dma12, 
   page0_value_dma12, page0_reloc_dma12, page0_valid_dma12, 
   page1_mask_dma12, page1_value_dma12, page1_reloc_dma12, 
   page1_valid_dma12, dmc_txc_dma12_page_handle, 
   dmc_txc_dma12_func_num, txc_dmc_dma13_getnxtdesc, 
   txc_dmc_dma13_inc_head, txc_dmc_dma13_reset_done, 
   tx_rng_cfg_dma13_len, tx_rng_cfg_dma13_staddr, tx_rng_tail_dma13, 
   tx_dma_cfg_dma13_rst, tx_dma_cfg_dma13_stall, 
   tx_dma_cfg_dma13_stop, page0_mask_dma13, page0_value_dma13, 
   page0_reloc_dma13, page0_valid_dma13, page1_mask_dma13, 
   page1_value_dma13, page1_reloc_dma13, page1_valid_dma13, 
   dmc_txc_dma13_page_handle, dmc_txc_dma13_func_num, 
   txc_dmc_dma14_getnxtdesc,  txc_dmc_dma14_inc_head, 
   txc_dmc_dma14_reset_done, tx_rng_cfg_dma14_len, 
   tx_rng_cfg_dma14_staddr, tx_rng_tail_dma14, tx_dma_cfg_dma14_rst, 
   tx_dma_cfg_dma14_stall, tx_dma_cfg_dma14_stop, page0_mask_dma14, 
   page0_value_dma14, page0_reloc_dma14, page0_valid_dma14, 
   page1_mask_dma14, page1_value_dma14, page1_reloc_dma14, 
   page1_valid_dma14, dmc_txc_dma14_page_handle, 
   dmc_txc_dma14_func_num, txc_dmc_dma15_getnxtdesc, 
   txc_dmc_dma15_inc_head, txc_dmc_dma15_reset_done, 
   tx_rng_cfg_dma15_len, tx_rng_cfg_dma15_staddr, tx_rng_tail_dma15, 
   tx_dma_cfg_dma15_rst, tx_dma_cfg_dma15_stall, 
   tx_dma_cfg_dma15_stop, page0_mask_dma15, page0_value_dma15, 
   page0_reloc_dma15, page0_valid_dma15, page1_mask_dma15, 
   page1_value_dma15, page1_reloc_dma15, page1_valid_dma15, 
   dmc_txc_dma15_page_handle, dmc_txc_dma15_func_num, 

`ifdef NEPTUNE
				 
   txc_dmc_dma16_getnxtdesc,  txc_dmc_dma16_inc_head, 
   txc_dmc_dma16_reset_done, tx_rng_cfg_dma16_len, 
   tx_rng_cfg_dma16_staddr, tx_rng_tail_dma16, tx_dma_cfg_dma16_rst, 
   tx_dma_cfg_dma16_stall, tx_dma_cfg_dma16_stop, page0_mask_dma16, 
   page0_value_dma16, page0_reloc_dma16, page0_valid_dma16, 
   page1_mask_dma16, page1_value_dma16, page1_reloc_dma16, 
   page1_valid_dma16, dmc_txc_dma16_page_handle, 
   dmc_txc_dma16_func_num, txc_dmc_dma17_getnxtdesc, 
   txc_dmc_dma17_inc_head, txc_dmc_dma17_reset_done, 
   tx_rng_cfg_dma17_len, tx_rng_cfg_dma17_staddr, tx_rng_tail_dma17, 
   tx_dma_cfg_dma17_rst, tx_dma_cfg_dma17_stall, 
   tx_dma_cfg_dma17_stop, page0_mask_dma17, page0_value_dma17, 
   page0_reloc_dma17, page0_valid_dma17, page1_mask_dma17, 
   page1_value_dma17, page1_reloc_dma17, page1_valid_dma17, 
   dmc_txc_dma17_page_handle, dmc_txc_dma17_func_num, 
   txc_dmc_dma18_getnxtdesc,  txc_dmc_dma18_inc_head, 
   txc_dmc_dma18_reset_done, tx_rng_cfg_dma18_len, 
   tx_rng_cfg_dma18_staddr, tx_rng_tail_dma18, tx_dma_cfg_dma18_rst, 
   tx_dma_cfg_dma18_stall, tx_dma_cfg_dma18_stop, page0_mask_dma18, 
   page0_value_dma18, page0_reloc_dma18, page0_valid_dma18, 
   page1_mask_dma18, page1_value_dma18, page1_reloc_dma18, 
   page1_valid_dma18, dmc_txc_dma18_page_handle, 
   dmc_txc_dma18_func_num, txc_dmc_dma19_getnxtdesc, 
   txc_dmc_dma19_inc_head, txc_dmc_dma19_reset_done, 
   tx_rng_cfg_dma19_len, tx_rng_cfg_dma19_staddr, tx_rng_tail_dma19, 
   tx_dma_cfg_dma19_rst, tx_dma_cfg_dma19_stall, 
   tx_dma_cfg_dma19_stop, page0_mask_dma19, page0_value_dma19, 
   page0_reloc_dma19, page0_valid_dma19, page1_mask_dma19, 
   page1_value_dma19, page1_reloc_dma19, page1_valid_dma19, 
   dmc_txc_dma19_page_handle, dmc_txc_dma19_func_num, 
   txc_dmc_dma20_getnxtdesc,  txc_dmc_dma20_inc_head, 
   txc_dmc_dma20_reset_done, tx_rng_cfg_dma20_len, 
   tx_rng_cfg_dma20_staddr, tx_rng_tail_dma20, tx_dma_cfg_dma20_rst, 
   tx_dma_cfg_dma20_stall, tx_dma_cfg_dma20_stop, page0_mask_dma20, 
   page0_value_dma20, page0_reloc_dma20, page0_valid_dma20, 
   page1_mask_dma20, page1_value_dma20, page1_reloc_dma20, 
   page1_valid_dma20, dmc_txc_dma20_page_handle, 
   dmc_txc_dma20_func_num, txc_dmc_dma21_getnxtdesc, 
   txc_dmc_dma21_inc_head, txc_dmc_dma21_reset_done, 
   tx_rng_cfg_dma21_len, tx_rng_cfg_dma21_staddr, tx_rng_tail_dma21, 
   tx_dma_cfg_dma21_rst, tx_dma_cfg_dma21_stall, 
   tx_dma_cfg_dma21_stop, page0_mask_dma21, page0_value_dma21, 
   page0_reloc_dma21, page0_valid_dma21, page1_mask_dma21, 
   page1_value_dma21, page1_reloc_dma21, page1_valid_dma21, 
   dmc_txc_dma21_page_handle, dmc_txc_dma21_func_num, 
   txc_dmc_dma22_getnxtdesc,  txc_dmc_dma22_inc_head, 
   txc_dmc_dma22_reset_done, tx_rng_cfg_dma22_len, 
   tx_rng_cfg_dma22_staddr, tx_rng_tail_dma22, tx_dma_cfg_dma22_rst, 
   tx_dma_cfg_dma22_stall, tx_dma_cfg_dma22_stop, page0_mask_dma22, 
   page0_value_dma22, page0_reloc_dma22, page0_valid_dma22, 
   page1_mask_dma22, page1_value_dma22, page1_reloc_dma22, 
   page1_valid_dma22, dmc_txc_dma22_page_handle, 
   dmc_txc_dma22_func_num, txc_dmc_dma23_getnxtdesc, 
   txc_dmc_dma23_inc_head, txc_dmc_dma23_reset_done, 
   tx_rng_cfg_dma23_len, tx_rng_cfg_dma23_staddr, tx_rng_tail_dma23, 
   tx_dma_cfg_dma23_rst, tx_dma_cfg_dma23_stall, 
   tx_dma_cfg_dma23_stop, page0_mask_dma23, page0_value_dma23, 
   page0_reloc_dma23, page0_valid_dma23, page1_mask_dma23, 
   page1_value_dma23, page1_reloc_dma23, page1_valid_dma23, 
   dmc_txc_dma23_page_handle, dmc_txc_dma23_func_num,
`endif // ifdef NEPTUNE
				 
	// clocks etc
				 // 			 
   SysClk, Reset_L
   );
   

   // Global Signals
   input          SysClk;
   input 	  Reset_L;


`ifdef NEPTUNE
`else
     // mbist if
   input 	  tcu_aclk;
   input 	  tcu_bclk;
   input 	  tcu_se_scancollar_in;
   input 	  tcu_se_scancollar_out;
   input 	  tcu_array_wr_inhibit;
   input 	  tcu_scan_en;
   input          tcu_mbist_user_mode;

   input 	  tds_tdmc_mbist_scan_in;
   output 	  tds_tdmc_mbist_scan_out;


   input 	  tcu_tds_tdmc_mbist_start; 
   input 	  tcu_mbist_bisi_en;
   output 	  tds_tdmc_tcu_mbist_fail;
   output 	  tds_tdmc_tcu_mbist_done;

   input          l2clk_2x;
   input          iol2clk;

   input [6:0] 	  hdr_sram_rvalue_tdmc;
   input [1:0] 	  hdr_sram_rid_tdmc;
   input 	  hdr_sram_wr_en_tdmc;
   input 	  hdr_sram_red_clr_tdmc;
   output [6:0]   sram_hdr_read_data_tdmc;
   output [39:0] tds_tcu_dmo_data_out;
   input          sram_reset;
   
`endif // !ifdef NEPTUNE

// debug output
   output [3:0]  TxCacheFetchState;

   // Tx DMA Request Interface
   input 	  SMX_DMC_TxCache_Req_Ack;
   output 	  DMC_TxCache_SMX_Req;
   output [1:0]   DMC_TxCache_SMX_Req_Port_Num;
   output [4:0]   DMC_TxCache_SMX_Req_DMA_Num;
   output [7:0]   DMC_TxCache_SMX_Req_Cmd;
   output [13:0]  DMC_TxCache_SMX_Req_Length;
   output [63:0]  DMC_TxCache_SMX_Req_Address;
   output [1:0]   tdmc_arb1_req_func_num;


   // Tx DMA Response Interface
   input 	  SMX_DMC_TxCache_Resp_Rdy;
   input 	  SMX_DMC_TxCache_Resp_Complete;
   input 	  SMX_DMC_TxCache_Trans_Complete;
   input 	  SMX_DMC_TxCache_Resp_Data_Valid;
   input [4:0] 	  SMX_DMC_TxCache_Resp_DMA_Num;
   input [15:0]   SMX_DMC_TxCache_Resp_ByteEnables;
   input [13:0]   SMX_DMC_TxCache_Resp_Data_Length;
   input [63:0]   SMX_DMC_TxCache_Resp_Address;
   input [127:0]  SMX_DMC_TxCache_Resp_Data;
   output 	  DMC_TxCache_SMX_Resp_Accept;
   input [7:0] 	  meta_dmc_resp_cmd;

   input [3:0]    meta_dmc_resp_cmd_status;
   input [3:0]    meta_dmc_data_status;

   // Tx DMA Cache

   // Signals for corrupting the parity of cache
   input [31:0] 	      parity_corrupt_config;
   input 	 dmc_txc_tx_addr_md;
   output [`NO_OF_DMAS - 1 :0] txpref_dma_nack_resp;
   output        txpref_nack_resp ;
   output [43:0] txpref_nack_rd_addr;


 // DMA0 TXC Interface
   output 	  dmc_txc_dma0_active;
   output 	  dmc_txc_dma0_eoflist;
   output 	  dmc_txc_dma0_gotnxtdesc;
   output [63:0]  dmc_txc_dma0_descriptor;
   output 	  dmc_txc_dma0_cacheready;
   output         dmc_txc_dma0_partial;
   output 	  dmc_txc_dma0_reset_scheduled;
   input 	  txc_dmc_dma0_getnxtdesc;
   input 	  txc_dmc_dma0_inc_head;
   input 	  txc_dmc_dma0_reset_done;

// DMA0 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma0_len;
   input [37:0]   tx_rng_cfg_dma0_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma0 ;
   input 	  tx_dma_cfg_dma0_rst;
   input 	  tx_dma_cfg_dma0_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma0 ;
   output 	  dma0_clear_reset;
   output  tx_dma_cfg_dma0_stop_state;
   input  tx_dma_cfg_dma0_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA0;


 // DMA0 -FZC signals
   input [31:0]   page0_mask_dma0;
   input [31:0]   page0_value_dma0;
   input [31:0]   page0_reloc_dma0;
   input 	  page0_valid_dma0;
   input [31:0]   page1_mask_dma0;
   input [31:0]   page1_value_dma0;
   input [31:0]   page1_reloc_dma0;
   input 	  page1_valid_dma0;
   input [19:0]   dmc_txc_dma0_page_handle;
   input [1:0]   dmc_txc_dma0_func_num;




// DMA0 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma0;
   output 	 set_pkt_part_err_dma0;
   output [43:0] pkt_part_error_address_dma0;
   output set_conf_part_error_dma0;
   output set_tx_ring_oflow_dma0;



 // DMA1 TXC Interface
   output 	  dmc_txc_dma1_active;
   output 	  dmc_txc_dma1_eoflist;
   output 	  dmc_txc_dma1_gotnxtdesc;
   output [63:0]  dmc_txc_dma1_descriptor;
   output 	  dmc_txc_dma1_cacheready;
   output         dmc_txc_dma1_partial;
   output 	  dmc_txc_dma1_reset_scheduled;
   input 	  txc_dmc_dma1_getnxtdesc;
   input 	  txc_dmc_dma1_inc_head;
   input 	  txc_dmc_dma1_reset_done;

// DMA1 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma1_len;
   input [37:0]   tx_rng_cfg_dma1_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma1 ;
   input 	  tx_dma_cfg_dma1_rst;
   input 	  tx_dma_cfg_dma1_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma1 ;
   output 	  dma1_clear_reset;
   output  tx_dma_cfg_dma1_stop_state;
   input  tx_dma_cfg_dma1_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA1;


 // DMA1 -FZC signals
   input [31:0]   page0_mask_dma1;
   input [31:0]   page0_value_dma1;
   input [31:0]   page0_reloc_dma1;
   input 	  page0_valid_dma1;
   input [31:0]   page1_mask_dma1;
   input [31:0]   page1_value_dma1;
   input [31:0]   page1_reloc_dma1;
   input 	  page1_valid_dma1;
   input [19:0]   dmc_txc_dma1_page_handle;
   input [1:0]   dmc_txc_dma1_func_num;




// DMA1 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma1;
   output 	 set_pkt_part_err_dma1;
   output [43:0] pkt_part_error_address_dma1;
   output set_conf_part_error_dma1;
   output set_tx_ring_oflow_dma1;


 // DMA2 TXC Interface
   output 	  dmc_txc_dma2_active;
   output 	  dmc_txc_dma2_eoflist;
   output 	  dmc_txc_dma2_gotnxtdesc;
   output [63:0]  dmc_txc_dma2_descriptor;
   output 	  dmc_txc_dma2_cacheready;
   output         dmc_txc_dma2_partial;
   output 	  dmc_txc_dma2_reset_scheduled;
   input 	  txc_dmc_dma2_getnxtdesc;
   input 	  txc_dmc_dma2_inc_head;
   input 	  txc_dmc_dma2_reset_done;

// DMA2 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma2_len;
   input [37:0]   tx_rng_cfg_dma2_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma2 ;
   input 	  tx_dma_cfg_dma2_rst;
   input 	  tx_dma_cfg_dma2_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma2 ;
   output 	  dma2_clear_reset;
   output  tx_dma_cfg_dma2_stop_state;
   input  tx_dma_cfg_dma2_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA2;


 // DMA2 -FZC signals
   input [31:0]   page0_mask_dma2;
   input [31:0]   page0_value_dma2;
   input [31:0]   page0_reloc_dma2;
   input 	  page0_valid_dma2;
   input [31:0]   page1_mask_dma2;
   input [31:0]   page1_value_dma2;
   input [31:0]   page1_reloc_dma2;
   input 	  page1_valid_dma2;
   input [19:0]   dmc_txc_dma2_page_handle;
   input [1:0]   dmc_txc_dma2_func_num;




// DMA2 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma2;
   output 	 set_pkt_part_err_dma2;
   output [43:0] pkt_part_error_address_dma2;
   output set_conf_part_error_dma2;
   output set_tx_ring_oflow_dma2;


 // DMA3 TXC Interface
   output 	  dmc_txc_dma3_active;
   output 	  dmc_txc_dma3_eoflist;
   output 	  dmc_txc_dma3_gotnxtdesc;
   output [63:0]  dmc_txc_dma3_descriptor;
   output 	  dmc_txc_dma3_cacheready;
   output         dmc_txc_dma3_partial;
   output 	  dmc_txc_dma3_reset_scheduled;
   input 	  txc_dmc_dma3_getnxtdesc;
   input 	  txc_dmc_dma3_inc_head;
   input 	  txc_dmc_dma3_reset_done;

// DMA3 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma3_len;
   input [37:0]   tx_rng_cfg_dma3_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma3 ;
   input 	  tx_dma_cfg_dma3_rst;
   input 	  tx_dma_cfg_dma3_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma3 ;
   output 	  dma3_clear_reset;
   output  tx_dma_cfg_dma3_stop_state;
   input  tx_dma_cfg_dma3_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA3;


 // DMA3 -FZC signals
   input [31:0]   page0_mask_dma3;
   input [31:0]   page0_value_dma3;
   input [31:0]   page0_reloc_dma3;
   input 	  page0_valid_dma3;
   input [31:0]   page1_mask_dma3;
   input [31:0]   page1_value_dma3;
   input [31:0]   page1_reloc_dma3;
   input 	  page1_valid_dma3;
   input [19:0]   dmc_txc_dma3_page_handle;
   input [1:0]   dmc_txc_dma3_func_num;




// DMA3 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma3;
   output 	 set_pkt_part_err_dma3;
   output [43:0] pkt_part_error_address_dma3;
   output set_conf_part_error_dma3;
   output set_tx_ring_oflow_dma3;


 // DMA4 TXC Interface
   output 	  dmc_txc_dma4_active;
   output 	  dmc_txc_dma4_eoflist;
   output 	  dmc_txc_dma4_gotnxtdesc;
   output [63:0]  dmc_txc_dma4_descriptor;
   output 	  dmc_txc_dma4_cacheready;
   output         dmc_txc_dma4_partial;
   output 	  dmc_txc_dma4_reset_scheduled;
   input 	  txc_dmc_dma4_getnxtdesc;
   input 	  txc_dmc_dma4_inc_head;
   input 	  txc_dmc_dma4_reset_done;

// DMA4 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma4_len;
   input [37:0]   tx_rng_cfg_dma4_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma4 ;
   input 	  tx_dma_cfg_dma4_rst;
   input 	  tx_dma_cfg_dma4_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma4 ;
   output 	  dma4_clear_reset;
   output  tx_dma_cfg_dma4_stop_state;
   input  tx_dma_cfg_dma4_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA4;


 // DMA4 -FZC signals
   input [31:0]   page0_mask_dma4;
   input [31:0]   page0_value_dma4;
   input [31:0]   page0_reloc_dma4;
   input 	  page0_valid_dma4;
   input [31:0]   page1_mask_dma4;
   input [31:0]   page1_value_dma4;
   input [31:0]   page1_reloc_dma4;
   input 	  page1_valid_dma4;
   input [19:0]   dmc_txc_dma4_page_handle;
   input [1:0]   dmc_txc_dma4_func_num;




// DMA4 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma4;
   output 	 set_pkt_part_err_dma4;
   output [43:0] pkt_part_error_address_dma4;
   output set_conf_part_error_dma4;
   output set_tx_ring_oflow_dma4;


 // DMA5 TXC Interface
   output 	  dmc_txc_dma5_active;
   output 	  dmc_txc_dma5_eoflist;
   output 	  dmc_txc_dma5_gotnxtdesc;
   output [63:0]  dmc_txc_dma5_descriptor;
   output 	  dmc_txc_dma5_cacheready;
   output         dmc_txc_dma5_partial;
   output 	  dmc_txc_dma5_reset_scheduled;
   input 	  txc_dmc_dma5_getnxtdesc;
   input 	  txc_dmc_dma5_inc_head;
   input 	  txc_dmc_dma5_reset_done;

// DMA5 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma5_len;
   input [37:0]   tx_rng_cfg_dma5_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma5 ;
   input 	  tx_dma_cfg_dma5_rst;
   input 	  tx_dma_cfg_dma5_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma5 ;
   output 	  dma5_clear_reset;
   output  tx_dma_cfg_dma5_stop_state;
   input  tx_dma_cfg_dma5_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA5;


 // DMA5 -FZC signals
   input [31:0]   page0_mask_dma5;
   input [31:0]   page0_value_dma5;
   input [31:0]   page0_reloc_dma5;
   input 	  page0_valid_dma5;
   input [31:0]   page1_mask_dma5;
   input [31:0]   page1_value_dma5;
   input [31:0]   page1_reloc_dma5;
   input 	  page1_valid_dma5;
   input [19:0]   dmc_txc_dma5_page_handle;
   input [1:0]   dmc_txc_dma5_func_num;




// DMA5 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma5;
   output 	 set_pkt_part_err_dma5;
   output [43:0] pkt_part_error_address_dma5;
   output set_conf_part_error_dma5;
   output set_tx_ring_oflow_dma5;


 // DMA6 TXC Interface
   output 	  dmc_txc_dma6_active;
   output 	  dmc_txc_dma6_eoflist;
   output 	  dmc_txc_dma6_gotnxtdesc;
   output [63:0]  dmc_txc_dma6_descriptor;
   output 	  dmc_txc_dma6_cacheready;
   output         dmc_txc_dma6_partial;
   output 	  dmc_txc_dma6_reset_scheduled;
   input 	  txc_dmc_dma6_getnxtdesc;
   input 	  txc_dmc_dma6_inc_head;
   input 	  txc_dmc_dma6_reset_done;

// DMA6 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma6_len;
   input [37:0]   tx_rng_cfg_dma6_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma6 ;
   input 	  tx_dma_cfg_dma6_rst;
   input 	  tx_dma_cfg_dma6_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma6 ;
   output 	  dma6_clear_reset;
   output  tx_dma_cfg_dma6_stop_state;
   input  tx_dma_cfg_dma6_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA6;


 // DMA6 -FZC signals
   input [31:0]   page0_mask_dma6;
   input [31:0]   page0_value_dma6;
   input [31:0]   page0_reloc_dma6;
   input 	  page0_valid_dma6;
   input [31:0]   page1_mask_dma6;
   input [31:0]   page1_value_dma6;
   input [31:0]   page1_reloc_dma6;
   input 	  page1_valid_dma6;
   input [19:0]   dmc_txc_dma6_page_handle;
   input [1:0]   dmc_txc_dma6_func_num;




// DMA6 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma6;
   output 	 set_pkt_part_err_dma6;
   output [43:0] pkt_part_error_address_dma6;
   output set_conf_part_error_dma6;
   output set_tx_ring_oflow_dma6;


 // DMA7 TXC Interface
   output 	  dmc_txc_dma7_active;
   output 	  dmc_txc_dma7_eoflist;
   output 	  dmc_txc_dma7_gotnxtdesc;
   output [63:0]  dmc_txc_dma7_descriptor;
   output 	  dmc_txc_dma7_cacheready;
   output         dmc_txc_dma7_partial;
   output 	  dmc_txc_dma7_reset_scheduled;
   input 	  txc_dmc_dma7_getnxtdesc;
   input 	  txc_dmc_dma7_inc_head;
   input 	  txc_dmc_dma7_reset_done;

// DMA7 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma7_len;
   input [37:0]   tx_rng_cfg_dma7_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma7 ;
   input 	  tx_dma_cfg_dma7_rst;
   input 	  tx_dma_cfg_dma7_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma7 ;
   output 	  dma7_clear_reset;
   output  tx_dma_cfg_dma7_stop_state;
   input  tx_dma_cfg_dma7_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA7;


 // DMA7 -FZC signals
   input [31:0]   page0_mask_dma7;
   input [31:0]   page0_value_dma7;
   input [31:0]   page0_reloc_dma7;
   input 	  page0_valid_dma7;
   input [31:0]   page1_mask_dma7;
   input [31:0]   page1_value_dma7;
   input [31:0]   page1_reloc_dma7;
   input 	  page1_valid_dma7;
   input [19:0]   dmc_txc_dma7_page_handle;
   input [1:0]   dmc_txc_dma7_func_num;




// DMA7 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma7;
   output 	 set_pkt_part_err_dma7;
   output [43:0] pkt_part_error_address_dma7;
   output set_conf_part_error_dma7;
   output set_tx_ring_oflow_dma7;


 // DMA8 TXC Interface
   output 	  dmc_txc_dma8_active;
   output 	  dmc_txc_dma8_eoflist;
   output 	  dmc_txc_dma8_gotnxtdesc;
   output [63:0]  dmc_txc_dma8_descriptor;
   output 	  dmc_txc_dma8_cacheready;
   output         dmc_txc_dma8_partial;
   output 	  dmc_txc_dma8_reset_scheduled;
   input 	  txc_dmc_dma8_getnxtdesc;
   input 	  txc_dmc_dma8_inc_head;
   input 	  txc_dmc_dma8_reset_done;

// DMA8 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma8_len;
   input [37:0]   tx_rng_cfg_dma8_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma8 ;
   input 	  tx_dma_cfg_dma8_rst;
   input 	  tx_dma_cfg_dma8_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma8 ;
   output 	  dma8_clear_reset;
   output  tx_dma_cfg_dma8_stop_state;
   input  tx_dma_cfg_dma8_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA8;


 // DMA8 -FZC signals
   input [31:0]   page0_mask_dma8;
   input [31:0]   page0_value_dma8;
   input [31:0]   page0_reloc_dma8;
   input 	  page0_valid_dma8;
   input [31:0]   page1_mask_dma8;
   input [31:0]   page1_value_dma8;
   input [31:0]   page1_reloc_dma8;
   input 	  page1_valid_dma8;
   input [19:0]   dmc_txc_dma8_page_handle;
   input [1:0]   dmc_txc_dma8_func_num;




// DMA8 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma8;
   output 	 set_pkt_part_err_dma8;
   output [43:0] pkt_part_error_address_dma8;
   output set_conf_part_error_dma8;
   output set_tx_ring_oflow_dma8;


 // DMA9 TXC Interface
   output 	  dmc_txc_dma9_active;
   output 	  dmc_txc_dma9_eoflist;
   output 	  dmc_txc_dma9_gotnxtdesc;
   output [63:0]  dmc_txc_dma9_descriptor;
   output 	  dmc_txc_dma9_cacheready;
   output         dmc_txc_dma9_partial;
   output 	  dmc_txc_dma9_reset_scheduled;
   input 	  txc_dmc_dma9_getnxtdesc;
   input 	  txc_dmc_dma9_inc_head;
   input 	  txc_dmc_dma9_reset_done;

// DMA9 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma9_len;
   input [37:0]   tx_rng_cfg_dma9_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma9 ;
   input 	  tx_dma_cfg_dma9_rst;
   input 	  tx_dma_cfg_dma9_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma9 ;
   output 	  dma9_clear_reset;
   output  tx_dma_cfg_dma9_stop_state;
   input  tx_dma_cfg_dma9_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA9;


 // DMA9 -FZC signals
   input [31:0]   page0_mask_dma9;
   input [31:0]   page0_value_dma9;
   input [31:0]   page0_reloc_dma9;
   input 	  page0_valid_dma9;
   input [31:0]   page1_mask_dma9;
   input [31:0]   page1_value_dma9;
   input [31:0]   page1_reloc_dma9;
   input 	  page1_valid_dma9;
   input [19:0]   dmc_txc_dma9_page_handle;
   input [1:0]   dmc_txc_dma9_func_num;




// DMA9 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma9;
   output 	 set_pkt_part_err_dma9;
   output [43:0] pkt_part_error_address_dma9;
   output set_conf_part_error_dma9;
   output set_tx_ring_oflow_dma9;


 // DMA10 TXC Interface
   output 	  dmc_txc_dma10_active;
   output 	  dmc_txc_dma10_eoflist;
   output 	  dmc_txc_dma10_gotnxtdesc;
   output [63:0]  dmc_txc_dma10_descriptor;
   output 	  dmc_txc_dma10_cacheready;
   output         dmc_txc_dma10_partial;
   output 	  dmc_txc_dma10_reset_scheduled;
   input 	  txc_dmc_dma10_getnxtdesc;
   input 	  txc_dmc_dma10_inc_head;
   input 	  txc_dmc_dma10_reset_done;

// DMA10 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma10_len;
   input [37:0]   tx_rng_cfg_dma10_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma10 ;
   input 	  tx_dma_cfg_dma10_rst;
   input 	  tx_dma_cfg_dma10_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma10 ;
   output 	  dma10_clear_reset;
   output  tx_dma_cfg_dma10_stop_state;
   input  tx_dma_cfg_dma10_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA10;


 // DMA10 -FZC signals
   input [31:0]   page0_mask_dma10;
   input [31:0]   page0_value_dma10;
   input [31:0]   page0_reloc_dma10;
   input 	  page0_valid_dma10;
   input [31:0]   page1_mask_dma10;
   input [31:0]   page1_value_dma10;
   input [31:0]   page1_reloc_dma10;
   input 	  page1_valid_dma10;
   input [19:0]   dmc_txc_dma10_page_handle;
   input [1:0]   dmc_txc_dma10_func_num;




// DMA10 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma10;
   output 	 set_pkt_part_err_dma10;
   output [43:0] pkt_part_error_address_dma10;
   output set_conf_part_error_dma10;
   output set_tx_ring_oflow_dma10;


 // DMA11 TXC Interface
   output 	  dmc_txc_dma11_active;
   output 	  dmc_txc_dma11_eoflist;
   output 	  dmc_txc_dma11_gotnxtdesc;
   output [63:0]  dmc_txc_dma11_descriptor;
   output 	  dmc_txc_dma11_cacheready;
   output         dmc_txc_dma11_partial;
   output 	  dmc_txc_dma11_reset_scheduled;
   input 	  txc_dmc_dma11_getnxtdesc;
   input 	  txc_dmc_dma11_inc_head;
   input 	  txc_dmc_dma11_reset_done;

// DMA11 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma11_len;
   input [37:0]   tx_rng_cfg_dma11_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma11 ;
   input 	  tx_dma_cfg_dma11_rst;
   input 	  tx_dma_cfg_dma11_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma11 ;
   output 	  dma11_clear_reset;
   output  tx_dma_cfg_dma11_stop_state;
   input  tx_dma_cfg_dma11_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA11;


 // DMA11 -FZC signals
   input [31:0]   page0_mask_dma11;
   input [31:0]   page0_value_dma11;
   input [31:0]   page0_reloc_dma11;
   input 	  page0_valid_dma11;
   input [31:0]   page1_mask_dma11;
   input [31:0]   page1_value_dma11;
   input [31:0]   page1_reloc_dma11;
   input 	  page1_valid_dma11;
   input [19:0]   dmc_txc_dma11_page_handle;
   input [1:0]   dmc_txc_dma11_func_num;




// DMA11 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma11;
   output 	 set_pkt_part_err_dma11;
   output [43:0] pkt_part_error_address_dma11;
   output set_conf_part_error_dma11;
   output set_tx_ring_oflow_dma11;


 // DMA12 TXC Interface
   output 	  dmc_txc_dma12_active;
   output 	  dmc_txc_dma12_eoflist;
   output 	  dmc_txc_dma12_gotnxtdesc;
   output [63:0]  dmc_txc_dma12_descriptor;
   output 	  dmc_txc_dma12_cacheready;
   output         dmc_txc_dma12_partial;
   output 	  dmc_txc_dma12_reset_scheduled;
   input 	  txc_dmc_dma12_getnxtdesc;
   input 	  txc_dmc_dma12_inc_head;
   input 	  txc_dmc_dma12_reset_done;

// DMA12 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma12_len;
   input [37:0]   tx_rng_cfg_dma12_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma12 ;
   input 	  tx_dma_cfg_dma12_rst;
   input 	  tx_dma_cfg_dma12_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma12 ;
   output 	  dma12_clear_reset;
   output  tx_dma_cfg_dma12_stop_state;
   input  tx_dma_cfg_dma12_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA12;


 // DMA12 -FZC signals
   input [31:0]   page0_mask_dma12;
   input [31:0]   page0_value_dma12;
   input [31:0]   page0_reloc_dma12;
   input 	  page0_valid_dma12;
   input [31:0]   page1_mask_dma12;
   input [31:0]   page1_value_dma12;
   input [31:0]   page1_reloc_dma12;
   input 	  page1_valid_dma12;
   input [19:0]   dmc_txc_dma12_page_handle;
   input [1:0]   dmc_txc_dma12_func_num;




// DMA12 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma12;
   output 	 set_pkt_part_err_dma12;
   output [43:0] pkt_part_error_address_dma12;
   output set_conf_part_error_dma12;
   output set_tx_ring_oflow_dma12;


 // DMA13 TXC Interface
   output 	  dmc_txc_dma13_active;
   output 	  dmc_txc_dma13_eoflist;
   output 	  dmc_txc_dma13_gotnxtdesc;
   output [63:0]  dmc_txc_dma13_descriptor;
   output 	  dmc_txc_dma13_cacheready;
   output         dmc_txc_dma13_partial;
   output 	  dmc_txc_dma13_reset_scheduled;
   input 	  txc_dmc_dma13_getnxtdesc;
   input 	  txc_dmc_dma13_inc_head;
   input 	  txc_dmc_dma13_reset_done;

// DMA13 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma13_len;
   input [37:0]   tx_rng_cfg_dma13_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma13 ;
   input 	  tx_dma_cfg_dma13_rst;
   input 	  tx_dma_cfg_dma13_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma13 ;
   output 	  dma13_clear_reset;
   output  tx_dma_cfg_dma13_stop_state;
   input  tx_dma_cfg_dma13_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA13;


 // DMA13 -FZC signals
   input [31:0]   page0_mask_dma13;
   input [31:0]   page0_value_dma13;
   input [31:0]   page0_reloc_dma13;
   input 	  page0_valid_dma13;
   input [31:0]   page1_mask_dma13;
   input [31:0]   page1_value_dma13;
   input [31:0]   page1_reloc_dma13;
   input 	  page1_valid_dma13;
   input [19:0]   dmc_txc_dma13_page_handle;
   input [1:0]   dmc_txc_dma13_func_num;




// DMA13 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma13;
   output 	 set_pkt_part_err_dma13;
   output [43:0] pkt_part_error_address_dma13;
   output set_conf_part_error_dma13;
   output set_tx_ring_oflow_dma13;


 // DMA14 TXC Interface
   output 	  dmc_txc_dma14_active;
   output 	  dmc_txc_dma14_eoflist;
   output 	  dmc_txc_dma14_gotnxtdesc;
   output [63:0]  dmc_txc_dma14_descriptor;
   output 	  dmc_txc_dma14_cacheready;
   output         dmc_txc_dma14_partial;
   output 	  dmc_txc_dma14_reset_scheduled;
   input 	  txc_dmc_dma14_getnxtdesc;
   input 	  txc_dmc_dma14_inc_head;
   input 	  txc_dmc_dma14_reset_done;

// DMA14 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma14_len;
   input [37:0]   tx_rng_cfg_dma14_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma14 ;
   input 	  tx_dma_cfg_dma14_rst;
   input 	  tx_dma_cfg_dma14_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma14 ;
   output 	  dma14_clear_reset;
   output  tx_dma_cfg_dma14_stop_state;
   input  tx_dma_cfg_dma14_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA14;


 // DMA14 -FZC signals
   input [31:0]   page0_mask_dma14;
   input [31:0]   page0_value_dma14;
   input [31:0]   page0_reloc_dma14;
   input 	  page0_valid_dma14;
   input [31:0]   page1_mask_dma14;
   input [31:0]   page1_value_dma14;
   input [31:0]   page1_reloc_dma14;
   input 	  page1_valid_dma14;
   input [19:0]   dmc_txc_dma14_page_handle;
   input [1:0]   dmc_txc_dma14_func_num;




// DMA14 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma14;
   output 	 set_pkt_part_err_dma14;
   output [43:0] pkt_part_error_address_dma14;
   output set_conf_part_error_dma14;
   output set_tx_ring_oflow_dma14;


 // DMA15 TXC Interface
   output 	  dmc_txc_dma15_active;
   output 	  dmc_txc_dma15_eoflist;
   output 	  dmc_txc_dma15_gotnxtdesc;
   output [63:0]  dmc_txc_dma15_descriptor;
   output 	  dmc_txc_dma15_cacheready;
   output         dmc_txc_dma15_partial;
   output 	  dmc_txc_dma15_reset_scheduled;
   input 	  txc_dmc_dma15_getnxtdesc;
   input 	  txc_dmc_dma15_inc_head;
   input 	  txc_dmc_dma15_reset_done;

// DMA15 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma15_len;
   input [37:0]   tx_rng_cfg_dma15_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma15 ;
   input 	  tx_dma_cfg_dma15_rst;
   input 	  tx_dma_cfg_dma15_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma15 ;
   output 	  dma15_clear_reset;
   output  tx_dma_cfg_dma15_stop_state;
   input  tx_dma_cfg_dma15_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA15;


 // DMA15 -FZC signals
   input [31:0]   page0_mask_dma15;
   input [31:0]   page0_value_dma15;
   input [31:0]   page0_reloc_dma15;
   input 	  page0_valid_dma15;
   input [31:0]   page1_mask_dma15;
   input [31:0]   page1_value_dma15;
   input [31:0]   page1_reloc_dma15;
   input 	  page1_valid_dma15;
   input [19:0]   dmc_txc_dma15_page_handle;
   input [1:0]   dmc_txc_dma15_func_num;




// DMA15 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma15;
   output 	 set_pkt_part_err_dma15;
   output [43:0] pkt_part_error_address_dma15;
   output set_conf_part_error_dma15;
   output set_tx_ring_oflow_dma15;


`ifdef NEPTUNE
 // DMA16 TXC Interface
   output 	  dmc_txc_dma16_active;
   output 	  dmc_txc_dma16_eoflist;
   output 	  dmc_txc_dma16_gotnxtdesc;
   output [63:0]  dmc_txc_dma16_descriptor;
   output 	  dmc_txc_dma16_cacheready;
   output         dmc_txc_dma16_partial;
   output 	  dmc_txc_dma16_reset_scheduled;
   input 	  txc_dmc_dma16_getnxtdesc;
   input 	  txc_dmc_dma16_inc_head;
   input 	  txc_dmc_dma16_reset_done;

// DMA16 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma16_len;
   input [37:0]   tx_rng_cfg_dma16_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma16 ;
   input 	  tx_dma_cfg_dma16_rst;
   input 	  tx_dma_cfg_dma16_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma16 ;
   output 	  dma16_clear_reset;
   output  tx_dma_cfg_dma16_stop_state;
   input  tx_dma_cfg_dma16_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA16;


 // DMA16 -FZC signals
   input [31:0]   page0_mask_dma16;
   input [31:0]   page0_value_dma16;
   input [31:0]   page0_reloc_dma16;
   input 	  page0_valid_dma16;
   input [31:0]   page1_mask_dma16;
   input [31:0]   page1_value_dma16;
   input [31:0]   page1_reloc_dma16;
   input 	  page1_valid_dma16;
   input [19:0]   dmc_txc_dma16_page_handle;
   input [1:0]   dmc_txc_dma16_func_num;




// DMA16 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma16;
   output 	 set_pkt_part_err_dma16;
   output [43:0] pkt_part_error_address_dma16;
   output set_conf_part_error_dma16;
   output set_tx_ring_oflow_dma16;


 // DMA17 TXC Interface
   output 	  dmc_txc_dma17_active;
   output 	  dmc_txc_dma17_eoflist;
   output 	  dmc_txc_dma17_gotnxtdesc;
   output [63:0]  dmc_txc_dma17_descriptor;
   output 	  dmc_txc_dma17_cacheready;
   output         dmc_txc_dma17_partial;
   output 	  dmc_txc_dma17_reset_scheduled;
   input 	  txc_dmc_dma17_getnxtdesc;
   input 	  txc_dmc_dma17_inc_head;
   input 	  txc_dmc_dma17_reset_done;

// DMA17 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma17_len;
   input [37:0]   tx_rng_cfg_dma17_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma17 ;
   input 	  tx_dma_cfg_dma17_rst;
   input 	  tx_dma_cfg_dma17_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma17 ;
   output 	  dma17_clear_reset;
   output  tx_dma_cfg_dma17_stop_state;
   input  tx_dma_cfg_dma17_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA17;


 // DMA17 -FZC signals
   input [31:0]   page0_mask_dma17;
   input [31:0]   page0_value_dma17;
   input [31:0]   page0_reloc_dma17;
   input 	  page0_valid_dma17;
   input [31:0]   page1_mask_dma17;
   input [31:0]   page1_value_dma17;
   input [31:0]   page1_reloc_dma17;
   input 	  page1_valid_dma17;
   input [19:0]   dmc_txc_dma17_page_handle;
   input [1:0]   dmc_txc_dma17_func_num;




// DMA17 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma17;
   output 	 set_pkt_part_err_dma17;
   output [43:0] pkt_part_error_address_dma17;
   output set_conf_part_error_dma17;
   output set_tx_ring_oflow_dma17;


 // DMA18 TXC Interface
   output 	  dmc_txc_dma18_active;
   output 	  dmc_txc_dma18_eoflist;
   output 	  dmc_txc_dma18_gotnxtdesc;
   output [63:0]  dmc_txc_dma18_descriptor;
   output 	  dmc_txc_dma18_cacheready;
   output         dmc_txc_dma18_partial;
   output 	  dmc_txc_dma18_reset_scheduled;
   input 	  txc_dmc_dma18_getnxtdesc;
   input 	  txc_dmc_dma18_inc_head;
   input 	  txc_dmc_dma18_reset_done;

// DMA18 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma18_len;
   input [37:0]   tx_rng_cfg_dma18_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma18 ;
   input 	  tx_dma_cfg_dma18_rst;
   input 	  tx_dma_cfg_dma18_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma18 ;
   output 	  dma18_clear_reset;
   output  tx_dma_cfg_dma18_stop_state;
   input  tx_dma_cfg_dma18_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA18;


 // DMA18 -FZC signals
   input [31:0]   page0_mask_dma18;
   input [31:0]   page0_value_dma18;
   input [31:0]   page0_reloc_dma18;
   input 	  page0_valid_dma18;
   input [31:0]   page1_mask_dma18;
   input [31:0]   page1_value_dma18;
   input [31:0]   page1_reloc_dma18;
   input 	  page1_valid_dma18;
   input [19:0]   dmc_txc_dma18_page_handle;
   input [1:0]   dmc_txc_dma18_func_num;




// DMA18 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma18;
   output 	 set_pkt_part_err_dma18;
   output [43:0] pkt_part_error_address_dma18;
   output set_conf_part_error_dma18;
   output set_tx_ring_oflow_dma18;


 // DMA19 TXC Interface
   output 	  dmc_txc_dma19_active;
   output 	  dmc_txc_dma19_eoflist;
   output 	  dmc_txc_dma19_gotnxtdesc;
   output [63:0]  dmc_txc_dma19_descriptor;
   output 	  dmc_txc_dma19_cacheready;
   output         dmc_txc_dma19_partial;
   output 	  dmc_txc_dma19_reset_scheduled;
   input 	  txc_dmc_dma19_getnxtdesc;
   input 	  txc_dmc_dma19_inc_head;
   input 	  txc_dmc_dma19_reset_done;

// DMA19 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma19_len;
   input [37:0]   tx_rng_cfg_dma19_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma19 ;
   input 	  tx_dma_cfg_dma19_rst;
   input 	  tx_dma_cfg_dma19_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma19 ;
   output 	  dma19_clear_reset;
   output  tx_dma_cfg_dma19_stop_state;
   input  tx_dma_cfg_dma19_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA19;


 // DMA19 -FZC signals
   input [31:0]   page0_mask_dma19;
   input [31:0]   page0_value_dma19;
   input [31:0]   page0_reloc_dma19;
   input 	  page0_valid_dma19;
   input [31:0]   page1_mask_dma19;
   input [31:0]   page1_value_dma19;
   input [31:0]   page1_reloc_dma19;
   input 	  page1_valid_dma19;
   input [19:0]   dmc_txc_dma19_page_handle;
   input [1:0]   dmc_txc_dma19_func_num;




// DMA19 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma19;
   output 	 set_pkt_part_err_dma19;
   output [43:0] pkt_part_error_address_dma19;
   output set_conf_part_error_dma19;
   output set_tx_ring_oflow_dma19;


 // DMA20 TXC Interface
   output 	  dmc_txc_dma20_active;
   output 	  dmc_txc_dma20_eoflist;
   output 	  dmc_txc_dma20_gotnxtdesc;
   output [63:0]  dmc_txc_dma20_descriptor;
   output 	  dmc_txc_dma20_cacheready;
   output         dmc_txc_dma20_partial;
   output 	  dmc_txc_dma20_reset_scheduled;
   input 	  txc_dmc_dma20_getnxtdesc;
   input 	  txc_dmc_dma20_inc_head;
   input 	  txc_dmc_dma20_reset_done;

// DMA20 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma20_len;
   input [37:0]   tx_rng_cfg_dma20_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma20 ;
   input 	  tx_dma_cfg_dma20_rst;
   input 	  tx_dma_cfg_dma20_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma20 ;
   output 	  dma20_clear_reset;
   output  tx_dma_cfg_dma20_stop_state;
   input  tx_dma_cfg_dma20_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA20;


 // DMA20 -FZC signals
   input [31:0]   page0_mask_dma20;
   input [31:0]   page0_value_dma20;
   input [31:0]   page0_reloc_dma20;
   input 	  page0_valid_dma20;
   input [31:0]   page1_mask_dma20;
   input [31:0]   page1_value_dma20;
   input [31:0]   page1_reloc_dma20;
   input 	  page1_valid_dma20;
   input [19:0]   dmc_txc_dma20_page_handle;
   input [1:0]   dmc_txc_dma20_func_num;




// DMA20 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma20;
   output 	 set_pkt_part_err_dma20;
   output [43:0] pkt_part_error_address_dma20;
   output set_conf_part_error_dma20;
   output set_tx_ring_oflow_dma20;


 // DMA21 TXC Interface
   output 	  dmc_txc_dma21_active;
   output 	  dmc_txc_dma21_eoflist;
   output 	  dmc_txc_dma21_gotnxtdesc;
   output [63:0]  dmc_txc_dma21_descriptor;
   output 	  dmc_txc_dma21_cacheready;
   output         dmc_txc_dma21_partial;
   output 	  dmc_txc_dma21_reset_scheduled;
   input 	  txc_dmc_dma21_getnxtdesc;
   input 	  txc_dmc_dma21_inc_head;
   input 	  txc_dmc_dma21_reset_done;

// DMA21 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma21_len;
   input [37:0]   tx_rng_cfg_dma21_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma21 ;
   input 	  tx_dma_cfg_dma21_rst;
   input 	  tx_dma_cfg_dma21_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma21 ;
   output 	  dma21_clear_reset;
   output  tx_dma_cfg_dma21_stop_state;
   input  tx_dma_cfg_dma21_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA21;


 // DMA21 -FZC signals
   input [31:0]   page0_mask_dma21;
   input [31:0]   page0_value_dma21;
   input [31:0]   page0_reloc_dma21;
   input 	  page0_valid_dma21;
   input [31:0]   page1_mask_dma21;
   input [31:0]   page1_value_dma21;
   input [31:0]   page1_reloc_dma21;
   input 	  page1_valid_dma21;
   input [19:0]   dmc_txc_dma21_page_handle;
   input [1:0]   dmc_txc_dma21_func_num;




// DMA21 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma21;
   output 	 set_pkt_part_err_dma21;
   output [43:0] pkt_part_error_address_dma21;
   output set_conf_part_error_dma21;
   output set_tx_ring_oflow_dma21;


 // DMA22 TXC Interface
   output 	  dmc_txc_dma22_active;
   output 	  dmc_txc_dma22_eoflist;
   output 	  dmc_txc_dma22_gotnxtdesc;
   output [63:0]  dmc_txc_dma22_descriptor;
   output 	  dmc_txc_dma22_cacheready;
   output         dmc_txc_dma22_partial;
   output 	  dmc_txc_dma22_reset_scheduled;
   input 	  txc_dmc_dma22_getnxtdesc;
   input 	  txc_dmc_dma22_inc_head;
   input 	  txc_dmc_dma22_reset_done;

// DMA22 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma22_len;
   input [37:0]   tx_rng_cfg_dma22_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma22 ;
   input 	  tx_dma_cfg_dma22_rst;
   input 	  tx_dma_cfg_dma22_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma22 ;
   output 	  dma22_clear_reset;
   output  tx_dma_cfg_dma22_stop_state;
   input  tx_dma_cfg_dma22_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA22;


 // DMA22 -FZC signals
   input [31:0]   page0_mask_dma22;
   input [31:0]   page0_value_dma22;
   input [31:0]   page0_reloc_dma22;
   input 	  page0_valid_dma22;
   input [31:0]   page1_mask_dma22;
   input [31:0]   page1_value_dma22;
   input [31:0]   page1_reloc_dma22;
   input 	  page1_valid_dma22;
   input [19:0]   dmc_txc_dma22_page_handle;
   input [1:0]   dmc_txc_dma22_func_num;




// DMA22 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma22;
   output 	 set_pkt_part_err_dma22;
   output [43:0] pkt_part_error_address_dma22;
   output set_conf_part_error_dma22;
   output set_tx_ring_oflow_dma22;


 // DMA23 TXC Interface
   output 	  dmc_txc_dma23_active;
   output 	  dmc_txc_dma23_eoflist;
   output 	  dmc_txc_dma23_gotnxtdesc;
   output [63:0]  dmc_txc_dma23_descriptor;
   output 	  dmc_txc_dma23_cacheready;
   output         dmc_txc_dma23_partial;
   output 	  dmc_txc_dma23_reset_scheduled;
   input 	  txc_dmc_dma23_getnxtdesc;
   input 	  txc_dmc_dma23_inc_head;
   input 	  txc_dmc_dma23_reset_done;

// DMA23 - PIO Interface

   input [`RNG_LENGTH_WIDTH -1 :0]   tx_rng_cfg_dma23_len;
   input [37:0]   tx_rng_cfg_dma23_staddr;
   input [`PTR_WIDTH:0]   tx_rng_tail_dma23 ;
   input 	  tx_dma_cfg_dma23_rst;
   input 	  tx_dma_cfg_dma23_stall;
   output [`PTR_WIDTH:0]  tx_rng_head_dma23 ;
   output 	  dma23_clear_reset;
   output  tx_dma_cfg_dma23_stop_state;
   input  tx_dma_cfg_dma23_stop;
   output [`PTR_WIDTH - 1 :0] ShadowRingCurrentPtr_DMA23;


 // DMA23 -FZC signals
   input [31:0]   page0_mask_dma23;
   input [31:0]   page0_value_dma23;
   input [31:0]   page0_reloc_dma23;
   input 	  page0_valid_dma23;
   input [31:0]   page1_mask_dma23;
   input [31:0]   page1_value_dma23;
   input [31:0]   page1_reloc_dma23;
   input 	  page1_valid_dma23;
   input [19:0]   dmc_txc_dma23_page_handle;
   input [1:0]   dmc_txc_dma23_func_num;




// DMA23 ERROR related signals to PIO block
   
   output 	 set_pref_buf_par_err_dma23;
   output 	 set_pkt_part_err_dma23;
   output [43:0] pkt_part_error_address_dma23;
   output set_conf_part_error_dma23;
   output set_tx_ring_oflow_dma23;

`endif // ifdef NEPTUNE
   
   
/*debug port*/
  output[31:0] dma0_debug_port;
  output[31:0] dma1_debug_port;
  output[31:0] dma2_debug_port;
  output[31:0] dma3_debug_port;
  output[31:0] dma4_debug_port;
  output[31:0] dma5_debug_port;
  output[31:0] dma6_debug_port;
  output[31:0] dma7_debug_port;
  output[31:0] dma8_debug_port;
  output[31:0] dma9_debug_port;
  output[31:0] dma10_debug_port;
  output[31:0] dma11_debug_port;
  output[31:0] dma12_debug_port;
  output[31:0] dma13_debug_port;
  output[31:0] dma14_debug_port;
  output[31:0] dma15_debug_port;

`ifdef NEPTUNE
  output[31:0] dma16_debug_port;
  output[31:0] dma17_debug_port;
  output[31:0] dma18_debug_port;
  output[31:0] dma19_debug_port;
  output[31:0] dma20_debug_port;
  output[31:0] dma21_debug_port;
  output[31:0] dma22_debug_port;
  output[31:0] dma23_debug_port;
`else
`endif





   
   wire 	  DMC_TxCache_SMX_Resp_Accept;
   wire [1:0] 	  tdmc_arb1_req_func_num;

   // TMP Wires

   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma1_len;
   wire [37:0] 	  tx_rng_cfg_dma1_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma1 ;
   wire 	  tx_dma_cfg_dma1_rst;
   wire 	  tx_dma_cfg_dma1_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma2_len;
   wire [37:0] 	  tx_rng_cfg_dma2_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma2 ;
   wire 	  tx_dma_cfg_dma2_rst;
   wire 	  tx_dma_cfg_dma2_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma3_len;
   wire [37:0] 	  tx_rng_cfg_dma3_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma3 ;
   wire 	  tx_dma_cfg_dma3_rst;
   wire 	  tx_dma_cfg_dma3_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma4_len;
   wire [37:0] 	  tx_rng_cfg_dma4_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma4 ;
   wire 	  tx_dma_cfg_dma4_rst;
   wire 	  tx_dma_cfg_dma4_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma5_len;
   wire [37:0] 	  tx_rng_cfg_dma5_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma5 ;
   wire 	  tx_dma_cfg_dma5_rst;
   wire 	  tx_dma_cfg_dma5_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma6_len;
   wire [37:0] 	  tx_rng_cfg_dma6_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma6 ;
   wire 	  tx_dma_cfg_dma6_rst;
   wire 	  tx_dma_cfg_dma6_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma7_len;
   wire [37:0] 	  tx_rng_cfg_dma7_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma7 ;
   wire 	  tx_dma_cfg_dma7_rst;
   wire 	  tx_dma_cfg_dma7_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma8_len;
   wire [37:0] 	  tx_rng_cfg_dma8_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma8 ;
   wire 	  tx_dma_cfg_dma8_rst;
   wire 	  tx_dma_cfg_dma8_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma9_len;
   wire [37:0] 	  tx_rng_cfg_dma9_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma9 ;
   wire 	  tx_dma_cfg_dma9_rst;
   wire 	  tx_dma_cfg_dma9_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma10_len;
   wire [37:0] 	  tx_rng_cfg_dma10_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma10 ;
   wire 	  tx_dma_cfg_dma10_rst;
   wire 	  tx_dma_cfg_dma10_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma11_len;
   wire [37:0] 	  tx_rng_cfg_dma11_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma11 ;
   wire 	  tx_dma_cfg_dma11_rst;
   wire 	  tx_dma_cfg_dma11_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma12_len;
   wire [37:0] 	  tx_rng_cfg_dma12_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma12 ;
   wire 	  tx_dma_cfg_dma12_rst;
   wire 	  tx_dma_cfg_dma12_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma13_len;
   wire [37:0] 	  tx_rng_cfg_dma13_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma13 ;
   wire 	  tx_dma_cfg_dma13_rst;
   wire 	  tx_dma_cfg_dma13_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma14_len;
   wire [37:0] 	  tx_rng_cfg_dma14_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma14 ;
   wire 	  tx_dma_cfg_dma14_rst;
   wire 	  tx_dma_cfg_dma14_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma15_len;
   wire [37:0] 	  tx_rng_cfg_dma15_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma15 ;
   wire 	  tx_dma_cfg_dma15_rst;
   wire 	  tx_dma_cfg_dma15_stall;
`ifdef NEPTUNE
   
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma16_len;
   wire [37:0] 	  tx_rng_cfg_dma16_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma16 ;
   wire 	  tx_dma_cfg_dma16_rst;
   wire 	  tx_dma_cfg_dma16_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma17_len;
   wire [37:0] 	  tx_rng_cfg_dma17_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma17 ;
   wire 	  tx_dma_cfg_dma17_rst;
   wire 	  tx_dma_cfg_dma17_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma18_len;
   wire [37:0] 	  tx_rng_cfg_dma18_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma18 ;
   wire 	  tx_dma_cfg_dma18_rst;
   wire 	  tx_dma_cfg_dma18_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma19_len;
   wire [37:0] 	  tx_rng_cfg_dma19_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma19 ;
   wire 	  tx_dma_cfg_dma19_rst;
   wire 	  tx_dma_cfg_dma19_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma20_len;
   wire [37:0] 	  tx_rng_cfg_dma20_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma20 ;
   wire 	  tx_dma_cfg_dma20_rst;
   wire 	  tx_dma_cfg_dma20_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma21_len;
   wire [37:0] 	  tx_rng_cfg_dma21_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma21 ;
   wire 	  tx_dma_cfg_dma21_rst;
   wire 	  tx_dma_cfg_dma21_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma22_len;
   wire [37:0] 	  tx_rng_cfg_dma22_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma22 ;
   wire 	  tx_dma_cfg_dma22_rst;
   wire 	  tx_dma_cfg_dma22_stall;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma23_len;
   wire [37:0] 	  tx_rng_cfg_dma23_staddr;
   wire [`PTR_WIDTH:0] 	  tx_rng_tail_dma23 ;
   wire 	  tx_dma_cfg_dma23_rst;
   wire 	  tx_dma_cfg_dma23_stall;
`endif // ifdef NEPTUNE

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
   
   




   /*--------------------------------------------------------------*/
   // Wires & Registers
   /*--------------------------------------------------------------*/

   wire [31:0] 	  DMAs_AvailableFor_Fetch;
   


   wire [3:0] 	  TxCacheFetchState;

   wire [4:0] 	  meta_resp_dma_num;
   wire [4:0] 	  DMANumToReq;
   wire [4:0] 	  DMANumToReqArbOut;
   
   wire [`NO_OF_DMAS - 1 :0] 	  updateCacheWritePtrs;
   wire [`NO_OF_DMAS - 1 :0] 	  receivedErrorResp;
   
   wire [3:0] 	  NoOfCacheWritesDispatched; // Max of 2 CacheLines- - 8 entries in the local cache

   wire 	  ArbDone;
   wire 	  choose_available_dmas;
   wire [`NO_OF_DMAS - 1 :0] 	  updateCacheContext;
   
   wire 	  DMC_TxCache_SMX_Req;
   wire [63:0] 	  DMC_TxCache_SMX_Req_Address;
   wire [7:0] 	  DMC_TxCache_SMX_Req_Cmd;
   wire [4:0] 	  DMC_TxCache_SMX_Req_DMA_Num;
   wire [13:0] 	  DMC_TxCache_SMX_Req_Length;
   wire [1:0] 	  DMC_TxCache_SMX_Req_Port_Num;


   
   wire [63:0] 	  dmc_txc_dma0_descriptor;
   wire [63:0] 	  dmc_txc_dma1_descriptor;
   wire [63:0] 	  dmc_txc_dma2_descriptor;
   wire [63:0] 	  dmc_txc_dma3_descriptor;
   wire [63:0] 	  dmc_txc_dma4_descriptor;
   wire [63:0] 	  dmc_txc_dma5_descriptor;
   wire [63:0] 	  dmc_txc_dma6_descriptor;
   wire [63:0] 	  dmc_txc_dma7_descriptor;
   wire [63:0] 	  dmc_txc_dma8_descriptor;
   wire [63:0] 	  dmc_txc_dma9_descriptor;
   wire [63:0] 	  dmc_txc_dma10_descriptor;
   wire [63:0] 	  dmc_txc_dma11_descriptor;
   wire [63:0] 	  dmc_txc_dma12_descriptor;
   wire [63:0] 	  dmc_txc_dma13_descriptor;
   wire [63:0] 	  dmc_txc_dma14_descriptor;
   wire [63:0] 	  dmc_txc_dma15_descriptor;
`ifdef NEPTUNE
   
   wire [63:0] 	  dmc_txc_dma16_descriptor;
   wire [63:0] 	  dmc_txc_dma17_descriptor;
   wire [63:0] 	  dmc_txc_dma18_descriptor;
   wire [63:0] 	  dmc_txc_dma19_descriptor;
   wire [63:0] 	  dmc_txc_dma20_descriptor;
   wire [63:0] 	  dmc_txc_dma21_descriptor;
   wire [63:0] 	  dmc_txc_dma22_descriptor;
   wire [63:0] 	  dmc_txc_dma23_descriptor;
`endif // ifdef NEPTUNE
   
   

   

   
   

   // Check the exact size of the cache
   wire [7:0] 	  DMA_TxCacheReadPtr;
   wire [7:0] 	  DMA_TxCacheWritePtr; 
   wire 	  DMA_TxCacheWrite;
   wire 	  DMA_TxCacheRead;
   wire [4:0] 	  NoOfValidEntries ; // No Of valid descriptors written into the cache -  a max of 16 
   wire [127:0]   DMA_TxCacheWriteData;// ???
   wire [127:0]   DMA_TxCacheReadData;// ???
   wire [3:0] 	  DMA_TxCacheTags;// ???
   wire [3:0] 	  DMA_TxCacheWriteEntriesValid;



   wire 	  LatchDMAPtrs;

   

   wire [4:0] 	  NoOfFreeSpaceInCache;
   wire 	  ShadowRingWrap;

   // new regs for REORDER
   wire [3:0] 	  meta_resp_address;

   

   /*--------------------------------------------------------------*/
   // Parameters and Defines
   /*--------------------------------------------------------------*/
   
   
   wire [63:0] 	  DMA_AddressToReq_ff ;

   // DMA0
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA0;
   wire [63:0] 	  DMA0_Address;
   wire 	  DMA0_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA0_RingLength;
   wire 	  DMA0CacheEntryValid;
   wire 	  dmc_txc_dma0_active;
   wire 	  dmc_txc_dma0_eoflist;
   wire [3:0] 	  DMA0_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma0;
   wire 	  DMA0_AvailableFor_Fetch;
   wire 	  DMA0_ReqPending;
   wire [4:0] 	  DMA0_EntriesValid;
   wire 	  DMA0_CacheEmpty;
   wire [3:0] 	  DMA0_CacheReadPtr;
   wire [3:0] 	  DMA0_CacheWritePtrReOrder;
   wire 	  IncrDMA0RdPtr;
   wire 	  inc_DMA0HeadShadow;
   wire 	  ResetDMA0RdPtr;
   wire 	  DMA0_CacheReadReq;
   wire 	  DMA0_CacheReadGnt;


   // DMA1
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA1;
   wire [63:0] 	  DMA1_Address;
   wire 	  DMA1_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA1_RingLength;
   wire 	  DMA1CacheEntryValid;
   wire 	  dmc_txc_dma1_active;
   wire 	  dmc_txc_dma1_eoflist;
   wire [3:0] 	  DMA1_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma1;
   wire 	  DMA1_AvailableFor_Fetch;
   wire 	  DMA1_ReqPending;
   wire [4:0] 	  DMA1_EntriesValid;
   wire 	  DMA1_CacheEmpty;
   wire [3:0] 	  DMA1_CacheReadPtr;
   wire [3:0] 	  DMA1_CacheWritePtrReOrder;
   wire 	  IncrDMA1RdPtr;
   wire 	  inc_DMA1HeadShadow;
   wire 	  ResetDMA1RdPtr;
   wire 	  DMA1_CacheReadReq;
   wire 	  DMA1_CacheReadGnt;


   // DMA2
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA2;
   wire [63:0] 	  DMA2_Address;
   wire 	  DMA2_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA2_RingLength;
   wire 	  DMA2CacheEntryValid;
   wire 	  dmc_txc_dma2_active;
   wire 	  dmc_txc_dma2_eoflist;
   wire [3:0] 	  DMA2_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma2;
   wire 	  DMA2_AvailableFor_Fetch;
   wire 	  DMA2_ReqPending;
   wire [4:0] 	  DMA2_EntriesValid;
   wire 	  DMA2_CacheEmpty;
   wire [3:0] 	  DMA2_CacheReadPtr;
   wire [3:0] 	  DMA2_CacheWritePtrReOrder;
   wire 	  IncrDMA2RdPtr;
   wire 	  inc_DMA2HeadShadow;
   wire 	  ResetDMA2RdPtr;
   wire 	  DMA2_CacheReadReq;
   wire 	  DMA2_CacheReadGnt;


   // DMA3
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA3;
   wire [63:0] 	  DMA3_Address;
   wire 	  DMA3_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA3_RingLength;
   wire 	  DMA3CacheEntryValid;
   wire 	  dmc_txc_dma3_active;
   wire 	  dmc_txc_dma3_eoflist;
   wire [3:0] 	  DMA3_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma3;
   wire 	  DMA3_AvailableFor_Fetch;
   wire 	  DMA3_ReqPending;
   wire [4:0] 	  DMA3_EntriesValid;
   wire 	  DMA3_CacheEmpty;
   wire [3:0] 	  DMA3_CacheReadPtr;
   wire [3:0] 	  DMA3_CacheWritePtrReOrder;
   wire 	  IncrDMA3RdPtr;
   wire 	  inc_DMA3HeadShadow;
   wire 	  ResetDMA3RdPtr;
   wire 	  DMA3_CacheReadReq;
   wire 	  DMA3_CacheReadGnt;


   // DMA4
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA4;
   wire [63:0] 	  DMA4_Address;
   wire 	  DMA4_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA4_RingLength;
   wire 	  DMA4CacheEntryValid;
   wire 	  dmc_txc_dma4_active;
   wire 	  dmc_txc_dma4_eoflist;
   wire [3:0] 	  DMA4_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma4;
   wire 	  DMA4_AvailableFor_Fetch;
   wire 	  DMA4_ReqPending;
   wire [4:0] 	  DMA4_EntriesValid;
   wire 	  DMA4_CacheEmpty;
   wire [3:0] 	  DMA4_CacheReadPtr;
   wire [3:0] 	  DMA4_CacheWritePtrReOrder;
   wire 	  IncrDMA4RdPtr;
   wire 	  inc_DMA4HeadShadow;
   wire 	  ResetDMA4RdPtr;
   wire 	  DMA4_CacheReadReq;
   wire 	  DMA4_CacheReadGnt;


   // DMA5
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA5;
   wire [63:0] 	  DMA5_Address;
   wire 	  DMA5_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA5_RingLength;
   wire 	  DMA5CacheEntryValid;
   wire 	  dmc_txc_dma5_active;
   wire 	  dmc_txc_dma5_eoflist;
   wire [3:0] 	  DMA5_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma5;
   wire 	  DMA5_AvailableFor_Fetch;
   wire 	  DMA5_ReqPending;
   wire [4:0] 	  DMA5_EntriesValid;
   wire 	  DMA5_CacheEmpty;
   wire [3:0] 	  DMA5_CacheReadPtr;
   wire [3:0] 	  DMA5_CacheWritePtrReOrder;
   wire 	  IncrDMA5RdPtr;
   wire 	  inc_DMA5HeadShadow;
   wire 	  ResetDMA5RdPtr;
   wire 	  DMA5_CacheReadReq;
   wire 	  DMA5_CacheReadGnt;


   // DMA6
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA6;
   wire [63:0] 	  DMA6_Address;
   wire 	  DMA6_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA6_RingLength;
   wire 	  DMA6CacheEntryValid;
   wire 	  dmc_txc_dma6_active;
   wire 	  dmc_txc_dma6_eoflist;
   wire [3:0] 	  DMA6_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma6;
   wire 	  DMA6_AvailableFor_Fetch;
   wire 	  DMA6_ReqPending;
   wire [4:0] 	  DMA6_EntriesValid;
   wire 	  DMA6_CacheEmpty;
   wire [3:0] 	  DMA6_CacheReadPtr;
   wire [3:0] 	  DMA6_CacheWritePtrReOrder;
   wire 	  IncrDMA6RdPtr;
   wire 	  inc_DMA6HeadShadow;
   wire 	  ResetDMA6RdPtr;
   wire 	  DMA6_CacheReadReq;
   wire 	  DMA6_CacheReadGnt;


   // DMA7
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA7;
   wire [63:0] 	  DMA7_Address;
   wire 	  DMA7_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA7_RingLength;
   wire 	  DMA7CacheEntryValid;
   wire 	  dmc_txc_dma7_active;
   wire 	  dmc_txc_dma7_eoflist;
   wire [3:0] 	  DMA7_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma7;
   wire 	  DMA7_AvailableFor_Fetch;
   wire 	  DMA7_ReqPending;
   wire [4:0] 	  DMA7_EntriesValid;
   wire 	  DMA7_CacheEmpty;
   wire [3:0] 	  DMA7_CacheReadPtr;
   wire [3:0] 	  DMA7_CacheWritePtrReOrder;
   wire 	  IncrDMA7RdPtr;
   wire 	  inc_DMA7HeadShadow;
   wire 	  ResetDMA7RdPtr;
   wire 	  DMA7_CacheReadReq;
   wire 	  DMA7_CacheReadGnt;


   // DMA8
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA8;
   wire [63:0] 	  DMA8_Address;
   wire 	  DMA8_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA8_RingLength;
   wire 	  DMA8CacheEntryValid;
   wire 	  dmc_txc_dma8_active;
   wire 	  dmc_txc_dma8_eoflist;
   wire [3:0] 	  DMA8_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma8;
   wire 	  DMA8_AvailableFor_Fetch;
   wire 	  DMA8_ReqPending;
   wire [4:0] 	  DMA8_EntriesValid;
   wire 	  DMA8_CacheEmpty;
   wire [3:0] 	  DMA8_CacheReadPtr;
   wire [3:0] 	  DMA8_CacheWritePtrReOrder;
   wire 	  IncrDMA8RdPtr;
   wire 	  inc_DMA8HeadShadow;
   wire 	  ResetDMA8RdPtr;
   wire 	  DMA8_CacheReadReq;
   wire 	  DMA8_CacheReadGnt;


   // DMA9
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA9;
   wire [63:0] 	  DMA9_Address;
   wire 	  DMA9_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA9_RingLength;
   wire 	  DMA9CacheEntryValid;
   wire 	  dmc_txc_dma9_active;
   wire 	  dmc_txc_dma9_eoflist;
   wire [3:0] 	  DMA9_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma9;
   wire 	  DMA9_AvailableFor_Fetch;
   wire 	  DMA9_ReqPending;
   wire [4:0] 	  DMA9_EntriesValid;
   wire 	  DMA9_CacheEmpty;
   wire [3:0] 	  DMA9_CacheReadPtr;
   wire [3:0] 	  DMA9_CacheWritePtrReOrder;
   wire 	  IncrDMA9RdPtr;
   wire 	  inc_DMA9HeadShadow;
   wire 	  ResetDMA9RdPtr;
   wire 	  DMA9_CacheReadReq;
   wire 	  DMA9_CacheReadGnt;


   // DMA10
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA10;
   wire [63:0] 	  DMA10_Address;
   wire 	  DMA10_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA10_RingLength;
   wire 	  DMA10CacheEntryValid;
   wire 	  dmc_txc_dma10_active;
   wire 	  dmc_txc_dma10_eoflist;
   wire [3:0] 	  DMA10_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma10;
   wire 	  DMA10_AvailableFor_Fetch;
   wire 	  DMA10_ReqPending;
   wire [4:0] 	  DMA10_EntriesValid;
   wire 	  DMA10_CacheEmpty;
   wire [3:0] 	  DMA10_CacheReadPtr;
   wire [3:0] 	  DMA10_CacheWritePtrReOrder;
   wire 	  IncrDMA10RdPtr;
   wire 	  inc_DMA10HeadShadow;
   wire 	  ResetDMA10RdPtr;
   wire 	  DMA10_CacheReadReq;
   wire 	  DMA10_CacheReadGnt;


   // DMA11
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA11;
   wire [63:0] 	  DMA11_Address;
   wire 	  DMA11_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA11_RingLength;
   wire 	  DMA11CacheEntryValid;
   wire 	  dmc_txc_dma11_active;
   wire 	  dmc_txc_dma11_eoflist;
   wire [3:0] 	  DMA11_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma11;
   wire 	  DMA11_AvailableFor_Fetch;
   wire 	  DMA11_ReqPending;
   wire [4:0] 	  DMA11_EntriesValid;
   wire 	  DMA11_CacheEmpty;
   wire [3:0] 	  DMA11_CacheReadPtr;
   wire [3:0] 	  DMA11_CacheWritePtrReOrder;
   wire 	  IncrDMA11RdPtr;
   wire 	  inc_DMA11HeadShadow;
   wire 	  ResetDMA11RdPtr;
   wire 	  DMA11_CacheReadReq;
   wire 	  DMA11_CacheReadGnt;


   // DMA12
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA12;
   wire [63:0] 	  DMA12_Address;
   wire 	  DMA12_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA12_RingLength;
   wire 	  DMA12CacheEntryValid;
   wire 	  dmc_txc_dma12_active;
   wire 	  dmc_txc_dma12_eoflist;
   wire [3:0] 	  DMA12_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma12;
   wire 	  DMA12_AvailableFor_Fetch;
   wire 	  DMA12_ReqPending;
   wire [4:0] 	  DMA12_EntriesValid;
   wire 	  DMA12_CacheEmpty;
   wire [3:0] 	  DMA12_CacheReadPtr;
   wire [3:0] 	  DMA12_CacheWritePtrReOrder;
   wire 	  IncrDMA12RdPtr;
   wire 	  inc_DMA12HeadShadow;
   wire 	  ResetDMA12RdPtr;
   wire 	  DMA12_CacheReadReq;
   wire 	  DMA12_CacheReadGnt;


   // DMA13
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA13;
   wire [63:0] 	  DMA13_Address;
   wire 	  DMA13_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA13_RingLength;
   wire 	  DMA13CacheEntryValid;
   wire 	  dmc_txc_dma13_active;
   wire 	  dmc_txc_dma13_eoflist;
   wire [3:0] 	  DMA13_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma13;
   wire 	  DMA13_AvailableFor_Fetch;
   wire 	  DMA13_ReqPending;
   wire [4:0] 	  DMA13_EntriesValid;
   wire 	  DMA13_CacheEmpty;
   wire [3:0] 	  DMA13_CacheReadPtr;
   wire [3:0] 	  DMA13_CacheWritePtrReOrder;
   wire 	  IncrDMA13RdPtr;
   wire 	  inc_DMA13HeadShadow;
   wire 	  ResetDMA13RdPtr;
   wire 	  DMA13_CacheReadReq;
   wire 	  DMA13_CacheReadGnt;


   // DMA14
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA14;
   wire [63:0] 	  DMA14_Address;
   wire 	  DMA14_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA14_RingLength;
   wire 	  DMA14CacheEntryValid;
   wire 	  dmc_txc_dma14_active;
   wire 	  dmc_txc_dma14_eoflist;
   wire [3:0] 	  DMA14_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma14;
   wire 	  DMA14_AvailableFor_Fetch;
   wire 	  DMA14_ReqPending;
   wire [4:0] 	  DMA14_EntriesValid;
   wire 	  DMA14_CacheEmpty;
   wire [3:0] 	  DMA14_CacheReadPtr;
   wire [3:0] 	  DMA14_CacheWritePtrReOrder;
   wire 	  IncrDMA14RdPtr;
   wire 	  inc_DMA14HeadShadow;
   wire 	  ResetDMA14RdPtr;
   wire 	  DMA14_CacheReadReq;
   wire 	  DMA14_CacheReadGnt;


   // DMA15
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA15;
   wire [63:0] 	  DMA15_Address;
   wire 	  DMA15_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA15_RingLength;
   wire 	  DMA15CacheEntryValid;
   wire 	  dmc_txc_dma15_active;
   wire 	  dmc_txc_dma15_eoflist;
   wire [3:0] 	  DMA15_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma15;
   wire 	  DMA15_AvailableFor_Fetch;
   wire 	  DMA15_ReqPending;
   wire [4:0] 	  DMA15_EntriesValid;
   wire 	  DMA15_CacheEmpty;
   wire [3:0] 	  DMA15_CacheReadPtr;
   wire [3:0] 	  DMA15_CacheWritePtrReOrder;
   wire 	  IncrDMA15RdPtr;
   wire 	  inc_DMA15HeadShadow;
   wire 	  ResetDMA15RdPtr;
   wire 	  DMA15_CacheReadReq;
   wire 	  DMA15_CacheReadGnt;


`ifdef NEPTUNE
   
   // DMA16
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA16;
   wire [63:0] 	  DMA16_Address;
   wire 	  DMA16_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA16_RingLength;
   wire 	  DMA16CacheEntryValid;
   wire 	  dmc_txc_dma16_active;
   wire 	  dmc_txc_dma16_eoflist;
   wire [3:0] 	  DMA16_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma16;
   wire 	  DMA16_AvailableFor_Fetch;
   wire 	  DMA16_ReqPending;
   wire [4:0] 	  DMA16_EntriesValid;
   wire 	  DMA16_CacheEmpty;
   wire [3:0] 	  DMA16_CacheReadPtr;
   wire [3:0] 	  DMA16_CacheWritePtrReOrder;
   wire 	  IncrDMA16RdPtr;
   wire 	  inc_DMA16HeadShadow;
   wire 	  ResetDMA16RdPtr;
   wire 	  DMA16_CacheReadReq;
   wire 	  DMA16_CacheReadGnt;


   // DMA17
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA17;
   wire [63:0] 	  DMA17_Address;
   wire 	  DMA17_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA17_RingLength;
   wire 	  DMA17CacheEntryValid;
   wire 	  dmc_txc_dma17_active;
   wire 	  dmc_txc_dma17_eoflist;
   wire [3:0] 	  DMA17_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma17;
   wire 	  DMA17_AvailableFor_Fetch;
   wire 	  DMA17_ReqPending;
   wire [4:0] 	  DMA17_EntriesValid;
   wire 	  DMA17_CacheEmpty;
   wire [3:0] 	  DMA17_CacheReadPtr;
   wire [3:0] 	  DMA17_CacheWritePtrReOrder;
   wire 	  IncrDMA17RdPtr;
   wire 	  inc_DMA17HeadShadow;
   wire 	  ResetDMA17RdPtr;
   wire 	  DMA17_CacheReadReq;
   wire 	  DMA17_CacheReadGnt;


   // DMA18
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA18;
   wire [63:0] 	  DMA18_Address;
   wire 	  DMA18_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA18_RingLength;
   wire 	  DMA18CacheEntryValid;
   wire 	  dmc_txc_dma18_active;
   wire 	  dmc_txc_dma18_eoflist;
   wire [3:0] 	  DMA18_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma18;
   wire 	  DMA18_AvailableFor_Fetch;
   wire 	  DMA18_ReqPending;
   wire [4:0] 	  DMA18_EntriesValid;
   wire 	  DMA18_CacheEmpty;
   wire [3:0] 	  DMA18_CacheReadPtr;
   wire [3:0] 	  DMA18_CacheWritePtrReOrder;
   wire 	  IncrDMA18RdPtr;
   wire 	  inc_DMA18HeadShadow;
   wire 	  ResetDMA18RdPtr;
   wire 	  DMA18_CacheReadReq;
   wire 	  DMA18_CacheReadGnt;


   // DMA19
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA19;
   wire [63:0] 	  DMA19_Address;
   wire 	  DMA19_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA19_RingLength;
   wire 	  DMA19CacheEntryValid;
   wire 	  dmc_txc_dma19_active;
   wire 	  dmc_txc_dma19_eoflist;
   wire [3:0] 	  DMA19_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma19;
   wire 	  DMA19_AvailableFor_Fetch;
   wire 	  DMA19_ReqPending;
   wire [4:0] 	  DMA19_EntriesValid;
   wire 	  DMA19_CacheEmpty;
   wire [3:0] 	  DMA19_CacheReadPtr;
   wire [3:0] 	  DMA19_CacheWritePtrReOrder;
   wire 	  IncrDMA19RdPtr;
   wire 	  inc_DMA19HeadShadow;
   wire 	  ResetDMA19RdPtr;
   wire 	  DMA19_CacheReadReq;
   wire 	  DMA19_CacheReadGnt;


   // DMA20
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA20;
   wire [63:0] 	  DMA20_Address;
   wire 	  DMA20_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA20_RingLength;
   wire 	  DMA20CacheEntryValid;
   wire 	  dmc_txc_dma20_active;
   wire 	  dmc_txc_dma20_eoflist;
   wire [3:0] 	  DMA20_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma20;
   wire 	  DMA20_AvailableFor_Fetch;
   wire 	  DMA20_ReqPending;
   wire [4:0] 	  DMA20_EntriesValid;
   wire 	  DMA20_CacheEmpty;
   wire [3:0] 	  DMA20_CacheReadPtr;
   wire [3:0] 	  DMA20_CacheWritePtrReOrder;
   wire 	  IncrDMA20RdPtr;
   wire 	  inc_DMA20HeadShadow;
   wire 	  ResetDMA20RdPtr;
   wire 	  DMA20_CacheReadReq;
   wire 	  DMA20_CacheReadGnt;


   // DMA21
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA21;
   wire [63:0] 	  DMA21_Address;
   wire 	  DMA21_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA21_RingLength;
   wire 	  DMA21CacheEntryValid;
   wire 	  dmc_txc_dma21_active;
   wire 	  dmc_txc_dma21_eoflist;
   wire [3:0] 	  DMA21_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma21;
   wire 	  DMA21_AvailableFor_Fetch;
   wire 	  DMA21_ReqPending;
   wire [4:0] 	  DMA21_EntriesValid;
   wire 	  DMA21_CacheEmpty;
   wire [3:0] 	  DMA21_CacheReadPtr;
   wire [3:0] 	  DMA21_CacheWritePtrReOrder;
   wire 	  IncrDMA21RdPtr;
   wire 	  inc_DMA21HeadShadow;
   wire 	  ResetDMA21RdPtr;
   wire 	  DMA21_CacheReadReq;
   wire 	  DMA21_CacheReadGnt;


   // DMA22
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA22;
   wire [63:0] 	  DMA22_Address;
   wire 	  DMA22_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA22_RingLength;
   wire 	  DMA22CacheEntryValid;
   wire 	  dmc_txc_dma22_active;
   wire 	  dmc_txc_dma22_eoflist;
   wire [3:0] 	  DMA22_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma22;
   wire 	  DMA22_AvailableFor_Fetch;
   wire 	  DMA22_ReqPending;
   wire [4:0] 	  DMA22_EntriesValid;
   wire 	  DMA22_CacheEmpty;
   wire [3:0] 	  DMA22_CacheReadPtr;
   wire [3:0] 	  DMA22_CacheWritePtrReOrder;
   wire 	  IncrDMA22RdPtr;
   wire 	  inc_DMA22HeadShadow;
   wire 	  ResetDMA22RdPtr;
   wire 	  DMA22_CacheReadReq;
   wire 	  DMA22_CacheReadGnt;


   // DMA23
   wire [`PTR_WIDTH - 1 :0] 	  ShadowRingCurrentPtr_DMA23;
   wire [63:0] 	  DMA23_Address;
   wire 	  DMA23_Ring_Wrapped;
   wire [`PTR_WIDTH - 1 :0] 	  DMA23_RingLength;
   wire 	  DMA23CacheEntryValid;
   wire 	  dmc_txc_dma23_active;
   wire 	  dmc_txc_dma23_eoflist;
   wire [3:0] 	  DMA23_EmptySpace   ;
   wire [`PTR_WIDTH:0] 	  tx_rng_head_dma23;
   wire 	  DMA23_AvailableFor_Fetch;
   wire 	  DMA23_ReqPending;
   wire [4:0] 	  DMA23_EntriesValid;
   wire 	  DMA23_CacheEmpty;
   wire [3:0] 	  DMA23_CacheReadPtr;
   wire [3:0] 	  DMA23_CacheWritePtrReOrder;
   wire 	  IncrDMA23RdPtr;
   wire 	  inc_DMA23HeadShadow;
   wire 	  ResetDMA23RdPtr;
   wire 	  DMA23_CacheReadReq;
   wire 	  DMA23_CacheReadGnt;

`endif // ifdef NEPTUNE
   
   

   
   wire [31:0] 	  DMANumToUpdate;

   wire [43:0] 	  DMA_UpdateAddress;
   wire 	  ParityStatus;


   // Error related wires
   


   wire        set_pref_buf_par_err_dma0;
   wire        set_pkt_part_err_dma0;
   wire [43:0] pkt_part_error_address_dma0;
   wire set_conf_part_error_dma0;

   wire        set_pref_buf_par_err_dma1;
   wire        set_pkt_part_err_dma1;
   wire [43:0] pkt_part_error_address_dma1;
   wire set_conf_part_error_dma1;

   wire        set_pref_buf_par_err_dma2;
   wire        set_pkt_part_err_dma2;
   wire [43:0] pkt_part_error_address_dma2;
   wire set_conf_part_error_dma2;

   wire        set_pref_buf_par_err_dma3;
   wire        set_pkt_part_err_dma3;
   wire [43:0] pkt_part_error_address_dma3;
   wire set_conf_part_error_dma3;

   wire        set_pref_buf_par_err_dma4;
   wire        set_pkt_part_err_dma4;
   wire [43:0] pkt_part_error_address_dma4;
   wire set_conf_part_error_dma4;

   wire        set_pref_buf_par_err_dma5;
   wire        set_pkt_part_err_dma5;
   wire [43:0] pkt_part_error_address_dma5;
   wire set_conf_part_error_dma5;

   wire        set_pref_buf_par_err_dma6;
   wire        set_pkt_part_err_dma6;
   wire [43:0] pkt_part_error_address_dma6;
   wire set_conf_part_error_dma6;

   wire        set_pref_buf_par_err_dma7;
   wire        set_pkt_part_err_dma7;
   wire [43:0] pkt_part_error_address_dma7;
   wire set_conf_part_error_dma7;

   wire        set_pref_buf_par_err_dma8;
   wire        set_pkt_part_err_dma8;
   wire [43:0] pkt_part_error_address_dma8;
   wire set_conf_part_error_dma8;

   wire        set_pref_buf_par_err_dma9;
   wire        set_pkt_part_err_dma9;
   wire [43:0] pkt_part_error_address_dma9;
   wire set_conf_part_error_dma9;

   wire        set_pref_buf_par_err_dma10;
   wire        set_pkt_part_err_dma10;
   wire [43:0] pkt_part_error_address_dma10;
   wire set_conf_part_error_dma10;

   wire        set_pref_buf_par_err_dma11;
   wire        set_pkt_part_err_dma11;
   wire [43:0] pkt_part_error_address_dma11;
   wire set_conf_part_error_dma11;

   wire        set_pref_buf_par_err_dma12;
   wire        set_pkt_part_err_dma12;
   wire [43:0] pkt_part_error_address_dma12;
   wire set_conf_part_error_dma12;

   wire        set_pref_buf_par_err_dma13;
   wire        set_pkt_part_err_dma13;
   wire [43:0] pkt_part_error_address_dma13;
   wire set_conf_part_error_dma13;

   wire        set_pref_buf_par_err_dma14;
   wire        set_pkt_part_err_dma14;
   wire [43:0] pkt_part_error_address_dma14;
   wire set_conf_part_error_dma14;

   wire        set_pref_buf_par_err_dma15;
   wire        set_pkt_part_err_dma15;
   wire [43:0] pkt_part_error_address_dma15;
   wire set_conf_part_error_dma15;

`ifdef NEPTUNE
   
   wire        set_pref_buf_par_err_dma16;
   wire        set_pkt_part_err_dma16;
   wire [43:0] pkt_part_error_address_dma16;
   wire set_conf_part_error_dma16;

   wire        set_pref_buf_par_err_dma17;
   wire        set_pkt_part_err_dma17;
   wire [43:0] pkt_part_error_address_dma17;
   wire set_conf_part_error_dma17;

   wire        set_pref_buf_par_err_dma18;
   wire        set_pkt_part_err_dma18;
   wire [43:0] pkt_part_error_address_dma18;
   wire set_conf_part_error_dma18;

   wire        set_pref_buf_par_err_dma19;
   wire        set_pkt_part_err_dma19;
   wire [43:0] pkt_part_error_address_dma19;
   wire set_conf_part_error_dma19;

   wire        set_pref_buf_par_err_dma20;
   wire        set_pkt_part_err_dma20;
   wire [43:0] pkt_part_error_address_dma20;
   wire set_conf_part_error_dma20;

   wire        set_pref_buf_par_err_dma21;
   wire        set_pkt_part_err_dma21;
   wire [43:0] pkt_part_error_address_dma21;
   wire set_conf_part_error_dma21;

   wire        set_pref_buf_par_err_dma22;
   wire        set_pkt_part_err_dma22;
   wire [43:0] pkt_part_error_address_dma22;
   wire set_conf_part_error_dma22;

   wire        set_pref_buf_par_err_dma23;
   wire        set_pkt_part_err_dma23;
   wire [43:0] pkt_part_error_address_dma23;
   wire set_conf_part_error_dma23;

`endif // ifdef NEPTUNE
   
   

   wire [`NO_OF_DMAS - 1 :0] txpref_dma_nack_resp;
   wire        txpref_nack_resp ;
   wire [43:0] txpref_nack_rd_addr;
 

wire [4:0]  meta_entries_requested_dma0;
wire [4:0]  meta_entries_requested_dma1;
wire [4:0]  meta_entries_requested_dma2;
wire [4:0]  meta_entries_requested_dma3;
wire [4:0]  meta_entries_requested_dma4;
wire [4:0]  meta_entries_requested_dma5;
wire [4:0]  meta_entries_requested_dma6;
wire [4:0]  meta_entries_requested_dma7;
wire [4:0]  meta_entries_requested_dma8;
wire [4:0]  meta_entries_requested_dma9;
wire [4:0]  meta_entries_requested_dma10;
wire [4:0]  meta_entries_requested_dma11;
wire [4:0]  meta_entries_requested_dma12;
wire [4:0]  meta_entries_requested_dma13;
wire [4:0]  meta_entries_requested_dma14;
wire [4:0]  meta_entries_requested_dma15;
`ifdef NEPTUNE
   
wire [4:0]  meta_entries_requested_dma16;
wire [4:0]  meta_entries_requested_dma17;
wire [4:0]  meta_entries_requested_dma18;
wire [4:0]  meta_entries_requested_dma19;
wire [4:0]  meta_entries_requested_dma20;
wire [4:0]  meta_entries_requested_dma21;
wire [4:0]  meta_entries_requested_dma22;
wire [4:0]  meta_entries_requested_dma23;
`endif // ifdef NEPTUNE
   
   
// dma0 wires
wire dma0_reset_scheduled;
wire dma0_reset_done_hold;
// dma1 wires
wire dma1_reset_scheduled;
wire dma1_reset_done_hold;
// dma2 wires
wire dma2_reset_scheduled;
wire dma2_reset_done_hold;
// dma3 wires
wire dma3_reset_scheduled;
wire dma3_reset_done_hold;
// dma4 wires
wire dma4_reset_scheduled;
wire dma4_reset_done_hold;
// dma5 wires
wire dma5_reset_scheduled;
wire dma5_reset_done_hold;
// dma6 wires
wire dma6_reset_scheduled;
wire dma6_reset_done_hold;
// dma7 wires
wire dma7_reset_scheduled;
wire dma7_reset_done_hold;
// dma8 wires
wire dma8_reset_scheduled;
wire dma8_reset_done_hold;
// dma9 wires
wire dma9_reset_scheduled;
wire dma9_reset_done_hold;
// dma10 wires
wire dma10_reset_scheduled;
wire dma10_reset_done_hold;
// dma11 wires
wire dma11_reset_scheduled;
wire dma11_reset_done_hold;
// dma12 wires
wire dma12_reset_scheduled;
wire dma12_reset_done_hold;
// dma13 wires
wire dma13_reset_scheduled;
wire dma13_reset_done_hold;
// dma14 wires
wire dma14_reset_scheduled;
wire dma14_reset_done_hold;
// dma15 wires
wire dma15_reset_scheduled;
wire dma15_reset_done_hold;
`ifdef NEPTUNE
   
// dma16 wires
wire dma16_reset_scheduled;
wire dma16_reset_done_hold;
// dma17 wires
wire dma17_reset_scheduled;
wire dma17_reset_done_hold;
// dma18 wires
wire dma18_reset_scheduled;
wire dma18_reset_done_hold;
// dma19 wires
wire dma19_reset_scheduled;
wire dma19_reset_done_hold;
// dma20 wires
wire dma20_reset_scheduled;
wire dma20_reset_done_hold;
// dma21 wires
wire dma21_reset_scheduled;
wire dma21_reset_done_hold;
// dma22 wires
wire dma22_reset_scheduled;
wire dma22_reset_done_hold;
// dma23 wires
wire dma23_reset_scheduled;
wire dma23_reset_done_hold;

`endif // ifdef NEPTUNE
   
   

   wire [`NO_OF_DMAS - 1:0] parity_corrupt_dma_match;
   wire [`PTR_WIDTH - 1 :0] NoOfDescInMem;
   wire [`PTR_WIDTH - 1 :0] NoOfDescLeft;
   
`ifdef NEPTUNE
`else
   wire [6:0]  sram_hdr_read_data_tdmc;
`endif // ifdef NEPTUNE
   
   


// DMA0
niu_tdmc_dmacontext  niu_tdmc_dmacontext_0 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA0[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA0_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA0_Ring_Wrapped),
                                         .DMA_RingLength(DMA0_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA0CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma0_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma0_eoflist),
                                         .DMA_EmptySpace(DMA0_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma0[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA0_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA0_ReqPending),
                                         .DMA_EntriesValid(DMA0_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA0_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA0_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA0_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma0_reset_scheduled ),
					 .dma_clear_reset ( dma0_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma0),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma0),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma0_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma0),
					 .dma_debug_port (dma0_debug_port),
                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma0 ),
					  .page0_value_dma( page0_value_dma0 ),
					  .page0_reloc_dma( page0_reloc_dma0 ),
					  .page0_valid_dma( page0_valid_dma0 ),
					  .page1_mask_dma ( page1_mask_dma0 ),
					  .page1_value_dma( page1_value_dma0 ),
					  .page1_reloc_dma( page1_reloc_dma0 ),
					  .page1_valid_dma( page1_valid_dma0 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma0_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma0_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma0_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA0HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[0] ),
					 .receivedErrorResp(receivedErrorResp[0]),
                                         .ResetDMARdPtr(ResetDMA0RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[0]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma0_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma0_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma0[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma0_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma0_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma0_stop), 
					 .dma_reset_done_hold (dma0_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma0_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA0RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA1
niu_tdmc_dmacontext niu_tdmc_dmacontext_1 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA1[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA1_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA1_Ring_Wrapped),
                                         .DMA_RingLength(DMA1_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA1CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma1_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma1_eoflist),
                                         .DMA_EmptySpace(DMA1_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma1[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA1_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA1_ReqPending),
                                         .DMA_EntriesValid(DMA1_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA1_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA1_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA1_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma1_reset_scheduled ),
					 .dma_clear_reset ( dma1_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma1),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma1),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma1_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma1),
					 .dma_debug_port (dma1_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma1 ),
					  .page0_value_dma( page0_value_dma1 ),
					  .page0_reloc_dma( page0_reloc_dma1 ),
					  .page0_valid_dma( page0_valid_dma1 ),
					  .page1_mask_dma ( page1_mask_dma1 ),
					  .page1_value_dma( page1_value_dma1 ),
					  .page1_reloc_dma( page1_reloc_dma1 ),
					  .page1_valid_dma( page1_valid_dma1 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma1_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma1_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma1_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA1HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[1] ),
					 .receivedErrorResp(receivedErrorResp[1]),
                                         .ResetDMARdPtr(ResetDMA1RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[1]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma1_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma1_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma1[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma1_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma1_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma1_stop), 
					 .dma_reset_done_hold (dma1_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma1_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA1RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA2
niu_tdmc_dmacontext niu_tdmc_dmacontext_2 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA2[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA2_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA2_Ring_Wrapped),
                                         .DMA_RingLength(DMA2_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA2CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma2_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma2_eoflist),
                                         .DMA_EmptySpace(DMA2_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma2[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA2_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA2_ReqPending),
                                         .DMA_EntriesValid(DMA2_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA2_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA2_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA2_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma2_reset_scheduled ),
					 .dma_clear_reset ( dma2_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma2),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma2),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma2_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma2),
					  .dma_debug_port (dma2_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma2 ),
					  .page0_value_dma( page0_value_dma2 ),
					  .page0_reloc_dma( page0_reloc_dma2 ),
					  .page0_valid_dma( page0_valid_dma2 ),
					  .page1_mask_dma ( page1_mask_dma2 ),
					  .page1_value_dma( page1_value_dma2 ),
					  .page1_reloc_dma( page1_reloc_dma2 ),
					  .page1_valid_dma( page1_valid_dma2 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma2_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma2_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma2_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA2HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[2] ),
					 .receivedErrorResp(receivedErrorResp[2]),
                                         .ResetDMARdPtr(ResetDMA2RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[2]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma2_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma2_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma2[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma2_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma2_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma2_stop), 
					 .dma_reset_done_hold (dma2_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma2_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA2RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA3
niu_tdmc_dmacontext niu_tdmc_dmacontext_3 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA3[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA3_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA3_Ring_Wrapped),
                                         .DMA_RingLength(DMA3_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA3CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma3_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma3_eoflist),
                                         .DMA_EmptySpace(DMA3_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma3[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA3_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA3_ReqPending),
                                         .DMA_EntriesValid(DMA3_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA3_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA3_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA3_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma3_reset_scheduled ),
					 .dma_clear_reset ( dma3_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma3),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma3),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma3_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma3),
					   .dma_debug_port (dma3_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma3 ),
					  .page0_value_dma( page0_value_dma3 ),
					  .page0_reloc_dma( page0_reloc_dma3 ),
					  .page0_valid_dma( page0_valid_dma3 ),
					  .page1_mask_dma ( page1_mask_dma3 ),
					  .page1_value_dma( page1_value_dma3 ),
					  .page1_reloc_dma( page1_reloc_dma3 ),
					  .page1_valid_dma( page1_valid_dma3 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma3_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma3_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma3_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA3HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[3] ),
					 .receivedErrorResp(receivedErrorResp[3]),
                                         .ResetDMARdPtr(ResetDMA3RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[3]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma3_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma3_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma3[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma3_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma3_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma3_stop), 
					 .dma_reset_done_hold (dma3_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma3_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA3RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA4
niu_tdmc_dmacontext niu_tdmc_dmacontext_4 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA4[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA4_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA4_Ring_Wrapped),
                                         .DMA_RingLength(DMA4_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA4CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma4_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma4_eoflist),
                                         .DMA_EmptySpace(DMA4_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma4[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA4_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA4_ReqPending),
                                         .DMA_EntriesValid(DMA4_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA4_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA4_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA4_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma4_reset_scheduled ),
					 .dma_clear_reset ( dma4_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma4),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma4),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma4_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma4),
					   .dma_debug_port (dma4_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma4 ),
					  .page0_value_dma( page0_value_dma4 ),
					  .page0_reloc_dma( page0_reloc_dma4 ),
					  .page0_valid_dma( page0_valid_dma4 ),
					  .page1_mask_dma ( page1_mask_dma4 ),
					  .page1_value_dma( page1_value_dma4 ),
					  .page1_reloc_dma( page1_reloc_dma4 ),
					  .page1_valid_dma( page1_valid_dma4 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma4_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma4_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma4_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA4HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[4] ),
					 .receivedErrorResp(receivedErrorResp[4]),
                                         .ResetDMARdPtr(ResetDMA4RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[4]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma4_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma4_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma4[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma4_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma4_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma4_stop), 
					 .dma_reset_done_hold (dma4_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma4_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA4RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA5
niu_tdmc_dmacontext niu_tdmc_dmacontext_5 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA5[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA5_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA5_Ring_Wrapped),
                                         .DMA_RingLength(DMA5_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA5CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma5_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma5_eoflist),
                                         .DMA_EmptySpace(DMA5_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma5[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA5_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA5_ReqPending),
                                         .DMA_EntriesValid(DMA5_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA5_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA5_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA5_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma5_reset_scheduled ),
					 .dma_clear_reset ( dma5_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma5),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma5),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma5_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma5),
					   .dma_debug_port (dma5_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma5 ),
					  .page0_value_dma( page0_value_dma5 ),
					  .page0_reloc_dma( page0_reloc_dma5 ),
					  .page0_valid_dma( page0_valid_dma5 ),
					  .page1_mask_dma ( page1_mask_dma5 ),
					  .page1_value_dma( page1_value_dma5 ),
					  .page1_reloc_dma( page1_reloc_dma5 ),
					  .page1_valid_dma( page1_valid_dma5 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma5_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma5_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma5_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA5HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[5] ),
					 .receivedErrorResp(receivedErrorResp[5]),
                                         .ResetDMARdPtr(ResetDMA5RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[5]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma5_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma5_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma5[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma5_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma5_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma5_stop), 
					 .dma_reset_done_hold (dma5_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma5_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA5RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA6
niu_tdmc_dmacontext niu_tdmc_dmacontext_6 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA6[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA6_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA6_Ring_Wrapped),
                                         .DMA_RingLength(DMA6_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA6CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma6_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma6_eoflist),
                                         .DMA_EmptySpace(DMA6_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma6[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA6_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA6_ReqPending),
                                         .DMA_EntriesValid(DMA6_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA6_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA6_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA6_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma6_reset_scheduled ),
					 .dma_clear_reset ( dma6_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma6),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma6),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma6_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma6),
					   .dma_debug_port (dma6_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma6 ),
					  .page0_value_dma( page0_value_dma6 ),
					  .page0_reloc_dma( page0_reloc_dma6 ),
					  .page0_valid_dma( page0_valid_dma6 ),
					  .page1_mask_dma ( page1_mask_dma6 ),
					  .page1_value_dma( page1_value_dma6 ),
					  .page1_reloc_dma( page1_reloc_dma6 ),
					  .page1_valid_dma( page1_valid_dma6 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma6_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma6_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma6_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA6HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[6] ),
					 .receivedErrorResp(receivedErrorResp[6]),
                                         .ResetDMARdPtr(ResetDMA6RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[6]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma6_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma6_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma6[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma6_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma6_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma6_stop), 
					 .dma_reset_done_hold (dma6_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma6_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA6RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA7
niu_tdmc_dmacontext niu_tdmc_dmacontext_7 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA7[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA7_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA7_Ring_Wrapped),
                                         .DMA_RingLength(DMA7_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA7CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma7_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma7_eoflist),
                                         .DMA_EmptySpace(DMA7_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma7[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA7_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA7_ReqPending),
                                         .DMA_EntriesValid(DMA7_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA7_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA7_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA7_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma7_reset_scheduled ),
					 .dma_clear_reset ( dma7_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma7),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma7),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma7_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma7),
					   .dma_debug_port (dma7_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma7 ),
					  .page0_value_dma( page0_value_dma7 ),
					  .page0_reloc_dma( page0_reloc_dma7 ),
					  .page0_valid_dma( page0_valid_dma7 ),
					  .page1_mask_dma ( page1_mask_dma7 ),
					  .page1_value_dma( page1_value_dma7 ),
					  .page1_reloc_dma( page1_reloc_dma7 ),
					  .page1_valid_dma( page1_valid_dma7 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma7_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma7_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma7_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA7HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[7] ),
					 .receivedErrorResp(receivedErrorResp[7]),
                                         .ResetDMARdPtr(ResetDMA7RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[7]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma7_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma7_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma7[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma7_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma7_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma7_stop), 
					 .dma_reset_done_hold (dma7_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma7_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA7RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA8
niu_tdmc_dmacontext niu_tdmc_dmacontext_8 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA8[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA8_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA8_Ring_Wrapped),
                                         .DMA_RingLength(DMA8_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA8CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma8_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma8_eoflist),
                                         .DMA_EmptySpace(DMA8_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma8[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA8_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA8_ReqPending),
                                         .DMA_EntriesValid(DMA8_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA8_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA8_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA8_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma8_reset_scheduled ),
					 .dma_clear_reset ( dma8_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma8),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma8),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma8_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma8),
					   .dma_debug_port (dma8_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma8 ),
					  .page0_value_dma( page0_value_dma8 ),
					  .page0_reloc_dma( page0_reloc_dma8 ),
					  .page0_valid_dma( page0_valid_dma8 ),
					  .page1_mask_dma ( page1_mask_dma8 ),
					  .page1_value_dma( page1_value_dma8 ),
					  .page1_reloc_dma( page1_reloc_dma8 ),
					  .page1_valid_dma( page1_valid_dma8 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma8_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma8_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma8_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA8HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[8] ),
					 .receivedErrorResp(receivedErrorResp[8]),
                                         .ResetDMARdPtr(ResetDMA8RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[8]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma8_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma8_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma8[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma8_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma8_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma8_stop), 
					 .dma_reset_done_hold (dma8_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma8_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA8RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA9
niu_tdmc_dmacontext niu_tdmc_dmacontext_9 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA9[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA9_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA9_Ring_Wrapped),
                                         .DMA_RingLength(DMA9_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA9CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma9_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma9_eoflist),
                                         .DMA_EmptySpace(DMA9_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma9[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA9_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA9_ReqPending),
                                         .DMA_EntriesValid(DMA9_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA9_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA9_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA9_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma9_reset_scheduled ),
					 .dma_clear_reset ( dma9_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma9),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma9),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma9_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma9),
					   .dma_debug_port (dma9_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma9 ),
					  .page0_value_dma( page0_value_dma9 ),
					  .page0_reloc_dma( page0_reloc_dma9 ),
					  .page0_valid_dma( page0_valid_dma9 ),
					  .page1_mask_dma ( page1_mask_dma9 ),
					  .page1_value_dma( page1_value_dma9 ),
					  .page1_reloc_dma( page1_reloc_dma9 ),
					  .page1_valid_dma( page1_valid_dma9 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma9_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma9_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma9_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA9HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[9] ),
					 .receivedErrorResp(receivedErrorResp[9]),
                                         .ResetDMARdPtr(ResetDMA9RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[9]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma9_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma9_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma9[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma9_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma9_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma9_stop), 
					 .dma_reset_done_hold (dma9_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma9_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA9RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA10
niu_tdmc_dmacontext niu_tdmc_dmacontext_10 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA10[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA10_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA10_Ring_Wrapped),
                                         .DMA_RingLength(DMA10_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA10CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma10_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma10_eoflist),
                                         .DMA_EmptySpace(DMA10_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma10[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA10_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA10_ReqPending),
                                         .DMA_EntriesValid(DMA10_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA10_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA10_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA10_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma10_reset_scheduled ),
					 .dma_clear_reset ( dma10_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma10),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma10),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma10_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma10),
					   .dma_debug_port (dma10_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma10 ),
					  .page0_value_dma( page0_value_dma10 ),
					  .page0_reloc_dma( page0_reloc_dma10 ),
					  .page0_valid_dma( page0_valid_dma10 ),
					  .page1_mask_dma ( page1_mask_dma10 ),
					  .page1_value_dma( page1_value_dma10 ),
					  .page1_reloc_dma( page1_reloc_dma10 ),
					  .page1_valid_dma( page1_valid_dma10 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma10_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma10_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma10_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA10HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[10] ),
					 .receivedErrorResp(receivedErrorResp[10]),
                                         .ResetDMARdPtr(ResetDMA10RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[10]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma10_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma10_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma10[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma10_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma10_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma10_stop), 
					 .dma_reset_done_hold (dma10_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma10_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA10RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA11
niu_tdmc_dmacontext niu_tdmc_dmacontext_11 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA11[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA11_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA11_Ring_Wrapped),
                                         .DMA_RingLength(DMA11_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA11CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma11_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma11_eoflist),
                                         .DMA_EmptySpace(DMA11_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma11[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA11_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA11_ReqPending),
                                         .DMA_EntriesValid(DMA11_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA11_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA11_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA11_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma11_reset_scheduled ),
					 .dma_clear_reset ( dma11_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma11),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma11),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma11_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma11),
					   .dma_debug_port (dma11_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma11 ),
					  .page0_value_dma( page0_value_dma11 ),
					  .page0_reloc_dma( page0_reloc_dma11 ),
					  .page0_valid_dma( page0_valid_dma11 ),
					  .page1_mask_dma ( page1_mask_dma11 ),
					  .page1_value_dma( page1_value_dma11 ),
					  .page1_reloc_dma( page1_reloc_dma11 ),
					  .page1_valid_dma( page1_valid_dma11 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma11_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma11_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma11_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA11HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[11] ),
					 .receivedErrorResp(receivedErrorResp[11]),
                                         .ResetDMARdPtr(ResetDMA11RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[11]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma11_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma11_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma11[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma11_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma11_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma11_stop), 
					 .dma_reset_done_hold (dma11_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma11_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA11RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA12
niu_tdmc_dmacontext niu_tdmc_dmacontext_12 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA12[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA12_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA12_Ring_Wrapped),
                                         .DMA_RingLength(DMA12_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA12CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma12_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma12_eoflist),
                                         .DMA_EmptySpace(DMA12_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma12[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA12_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA12_ReqPending),
                                         .DMA_EntriesValid(DMA12_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA12_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA12_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA12_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma12_reset_scheduled ),
					 .dma_clear_reset ( dma12_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma12),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma12),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma12_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma12),
					   .dma_debug_port (dma12_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma12 ),
					  .page0_value_dma( page0_value_dma12 ),
					  .page0_reloc_dma( page0_reloc_dma12 ),
					  .page0_valid_dma( page0_valid_dma12 ),
					  .page1_mask_dma ( page1_mask_dma12 ),
					  .page1_value_dma( page1_value_dma12 ),
					  .page1_reloc_dma( page1_reloc_dma12 ),
					  .page1_valid_dma( page1_valid_dma12 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma12_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma12_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma12_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA12HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[12] ),
					 .receivedErrorResp(receivedErrorResp[12]),
                                         .ResetDMARdPtr(ResetDMA12RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[12]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma12_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma12_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma12[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma12_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma12_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma12_stop), 
					 .dma_reset_done_hold (dma12_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma12_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA12RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA13
niu_tdmc_dmacontext niu_tdmc_dmacontext_13 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA13[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA13_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA13_Ring_Wrapped),
                                         .DMA_RingLength(DMA13_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA13CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma13_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma13_eoflist),
                                         .DMA_EmptySpace(DMA13_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma13[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA13_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA13_ReqPending),
                                         .DMA_EntriesValid(DMA13_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA13_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA13_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA13_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma13_reset_scheduled ),
					 .dma_clear_reset ( dma13_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma13),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma13),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma13_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma13),
					   .dma_debug_port (dma13_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma13 ),
					  .page0_value_dma( page0_value_dma13 ),
					  .page0_reloc_dma( page0_reloc_dma13 ),
					  .page0_valid_dma( page0_valid_dma13 ),
					  .page1_mask_dma ( page1_mask_dma13 ),
					  .page1_value_dma( page1_value_dma13 ),
					  .page1_reloc_dma( page1_reloc_dma13 ),
					  .page1_valid_dma( page1_valid_dma13 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma13_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma13_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma13_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA13HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[13] ),
					 .receivedErrorResp(receivedErrorResp[13]),
                                         .ResetDMARdPtr(ResetDMA13RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[13]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma13_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma13_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma13[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma13_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma13_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma13_stop), 
					 .dma_reset_done_hold (dma13_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma13_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA13RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA14
niu_tdmc_dmacontext niu_tdmc_dmacontext_14 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA14[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA14_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA14_Ring_Wrapped),
                                         .DMA_RingLength(DMA14_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA14CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma14_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma14_eoflist),
                                         .DMA_EmptySpace(DMA14_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma14[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA14_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA14_ReqPending),
                                         .DMA_EntriesValid(DMA14_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA14_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA14_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA14_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma14_reset_scheduled ),
					 .dma_clear_reset ( dma14_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma14),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma14),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma14_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma14),
					   .dma_debug_port (dma14_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma14 ),
					  .page0_value_dma( page0_value_dma14 ),
					  .page0_reloc_dma( page0_reloc_dma14 ),
					  .page0_valid_dma( page0_valid_dma14 ),
					  .page1_mask_dma ( page1_mask_dma14 ),
					  .page1_value_dma( page1_value_dma14 ),
					  .page1_reloc_dma( page1_reloc_dma14 ),
					  .page1_valid_dma( page1_valid_dma14 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma14_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma14_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma14_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA14HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[14] ),
					 .receivedErrorResp(receivedErrorResp[14]),
                                         .ResetDMARdPtr(ResetDMA14RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[14]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma14_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma14_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma14[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma14_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma14_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma14_stop), 
					 .dma_reset_done_hold (dma14_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma14_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA14RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA15
niu_tdmc_dmacontext niu_tdmc_dmacontext_15 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA15[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA15_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA15_Ring_Wrapped),
                                         .DMA_RingLength(DMA15_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA15CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma15_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma15_eoflist),
                                         .DMA_EmptySpace(DMA15_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma15[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA15_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA15_ReqPending),
                                         .DMA_EntriesValid(DMA15_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA15_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA15_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA15_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma15_reset_scheduled ),
					 .dma_clear_reset ( dma15_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma15),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma15),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma15_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma15),
					   .dma_debug_port (dma15_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma15 ),
					  .page0_value_dma( page0_value_dma15 ),
					  .page0_reloc_dma( page0_reloc_dma15 ),
					  .page0_valid_dma( page0_valid_dma15 ),
					  .page1_mask_dma ( page1_mask_dma15 ),
					  .page1_value_dma( page1_value_dma15 ),
					  .page1_reloc_dma( page1_reloc_dma15 ),
					  .page1_valid_dma( page1_valid_dma15 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma15_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma15_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma15_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA15HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[15] ),
					 .receivedErrorResp(receivedErrorResp[15]),
                                         .ResetDMARdPtr(ResetDMA15RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[15]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma15_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma15_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma15[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma15_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma15_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma15_stop), 
					 .dma_reset_done_hold (dma15_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma15_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA15RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

`ifdef NEPTUNE
   
// DMA16
niu_tdmc_dmacontext niu_tdmc_dmacontext_16 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA16[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA16_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA16_Ring_Wrapped),
                                         .DMA_RingLength(DMA16_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA16CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma16_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma16_eoflist),
                                         .DMA_EmptySpace(DMA16_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma16[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA16_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA16_ReqPending),
                                         .DMA_EntriesValid(DMA16_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA16_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA16_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA16_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma16_reset_scheduled ),
					 .dma_clear_reset ( dma16_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma16),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma16),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma16_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma16),
					   .dma_debug_port (dma16_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma16 ),
					  .page0_value_dma( page0_value_dma16 ),
					  .page0_reloc_dma( page0_reloc_dma16 ),
					  .page0_valid_dma( page0_valid_dma16 ),
					  .page1_mask_dma ( page1_mask_dma16 ),
					  .page1_value_dma( page1_value_dma16 ),
					  .page1_reloc_dma( page1_reloc_dma16 ),
					  .page1_valid_dma( page1_valid_dma16 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma16_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma16_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma16_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA16HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[16] ),
					 .receivedErrorResp(receivedErrorResp[16]),
                                         .ResetDMARdPtr(ResetDMA16RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[16]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma16_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma16_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma16[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma16_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma16_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma16_stop), 
					 .dma_reset_done_hold (dma16_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma16_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA16RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA17
niu_tdmc_dmacontext niu_tdmc_dmacontext_17 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA17[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA17_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA17_Ring_Wrapped),
                                         .DMA_RingLength(DMA17_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA17CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma17_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma17_eoflist),
                                         .DMA_EmptySpace(DMA17_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma17[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA17_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA17_ReqPending),
                                         .DMA_EntriesValid(DMA17_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA17_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA17_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA17_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma17_reset_scheduled ),
					 .dma_clear_reset ( dma17_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma17),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma17),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma17_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma17),
					   .dma_debug_port (dma17_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma17 ),
					  .page0_value_dma( page0_value_dma17 ),
					  .page0_reloc_dma( page0_reloc_dma17 ),
					  .page0_valid_dma( page0_valid_dma17 ),
					  .page1_mask_dma ( page1_mask_dma17 ),
					  .page1_value_dma( page1_value_dma17 ),
					  .page1_reloc_dma( page1_reloc_dma17 ),
					  .page1_valid_dma( page1_valid_dma17 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma17_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma17_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma17_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA17HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[17] ),
					 .receivedErrorResp(receivedErrorResp[17]),
                                         .ResetDMARdPtr(ResetDMA17RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[17]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma17_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma17_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma17[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma17_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma17_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma17_stop), 
					 .dma_reset_done_hold (dma17_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma17_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA17RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA18
niu_tdmc_dmacontext niu_tdmc_dmacontext_18 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA18[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA18_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA18_Ring_Wrapped),
                                         .DMA_RingLength(DMA18_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA18CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma18_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma18_eoflist),
                                         .DMA_EmptySpace(DMA18_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma18[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA18_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA18_ReqPending),
                                         .DMA_EntriesValid(DMA18_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA18_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA18_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA18_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma18_reset_scheduled ),
					 .dma_clear_reset ( dma18_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma18),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma18),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma18_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma18),
					   .dma_debug_port (dma18_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma18 ),
					  .page0_value_dma( page0_value_dma18 ),
					  .page0_reloc_dma( page0_reloc_dma18 ),
					  .page0_valid_dma( page0_valid_dma18 ),
					  .page1_mask_dma ( page1_mask_dma18 ),
					  .page1_value_dma( page1_value_dma18 ),
					  .page1_reloc_dma( page1_reloc_dma18 ),
					  .page1_valid_dma( page1_valid_dma18 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma18_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma18_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma18_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA18HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[18] ),
					 .receivedErrorResp(receivedErrorResp[18]),
                                         .ResetDMARdPtr(ResetDMA18RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[18]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma18_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma18_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma18[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma18_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma18_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma18_stop), 
					 .dma_reset_done_hold (dma18_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma18_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA18RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA19
niu_tdmc_dmacontext niu_tdmc_dmacontext_19 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA19[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA19_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA19_Ring_Wrapped),
                                         .DMA_RingLength(DMA19_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA19CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma19_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma19_eoflist),
                                         .DMA_EmptySpace(DMA19_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma19[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA19_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA19_ReqPending),
                                         .DMA_EntriesValid(DMA19_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA19_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA19_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA19_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma19_reset_scheduled ),
					 .dma_clear_reset ( dma19_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma19),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma19),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma19_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma19),
					   .dma_debug_port (dma19_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma19 ),
					  .page0_value_dma( page0_value_dma19 ),
					  .page0_reloc_dma( page0_reloc_dma19 ),
					  .page0_valid_dma( page0_valid_dma19 ),
					  .page1_mask_dma ( page1_mask_dma19 ),
					  .page1_value_dma( page1_value_dma19 ),
					  .page1_reloc_dma( page1_reloc_dma19 ),
					  .page1_valid_dma( page1_valid_dma19 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma19_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma19_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma19_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA19HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[19] ),
					 .receivedErrorResp(receivedErrorResp[19]),
                                         .ResetDMARdPtr(ResetDMA19RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[19]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma19_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma19_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma19[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma19_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma19_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma19_stop), 
					 .dma_reset_done_hold (dma19_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma19_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA19RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA20
niu_tdmc_dmacontext niu_tdmc_dmacontext_20 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA20[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA20_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA20_Ring_Wrapped),
                                         .DMA_RingLength(DMA20_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA20CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma20_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma20_eoflist),
                                         .DMA_EmptySpace(DMA20_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma20[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA20_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA20_ReqPending),
                                         .DMA_EntriesValid(DMA20_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA20_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA20_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA20_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma20_reset_scheduled ),
					 .dma_clear_reset ( dma20_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma20),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma20),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma20_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma20),
					   .dma_debug_port (dma20_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma20 ),
					  .page0_value_dma( page0_value_dma20 ),
					  .page0_reloc_dma( page0_reloc_dma20 ),
					  .page0_valid_dma( page0_valid_dma20 ),
					  .page1_mask_dma ( page1_mask_dma20 ),
					  .page1_value_dma( page1_value_dma20 ),
					  .page1_reloc_dma( page1_reloc_dma20 ),
					  .page1_valid_dma( page1_valid_dma20 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma20_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma20_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma20_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA20HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[20] ),
					 .receivedErrorResp(receivedErrorResp[20]),
                                         .ResetDMARdPtr(ResetDMA20RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[20]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma20_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma20_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma20[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma20_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma20_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma20_stop), 
					 .dma_reset_done_hold (dma20_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma20_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA20RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA21
niu_tdmc_dmacontext niu_tdmc_dmacontext_21 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA21[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA21_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA21_Ring_Wrapped),
                                         .DMA_RingLength(DMA21_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA21CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma21_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma21_eoflist),
                                         .DMA_EmptySpace(DMA21_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma21[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA21_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA21_ReqPending),
                                         .DMA_EntriesValid(DMA21_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA21_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA21_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA21_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma21_reset_scheduled ),
					 .dma_clear_reset ( dma21_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma21),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma21),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma21_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma21),
					   .dma_debug_port (dma21_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma21 ),
					  .page0_value_dma( page0_value_dma21 ),
					  .page0_reloc_dma( page0_reloc_dma21 ),
					  .page0_valid_dma( page0_valid_dma21 ),
					  .page1_mask_dma ( page1_mask_dma21 ),
					  .page1_value_dma( page1_value_dma21 ),
					  .page1_reloc_dma( page1_reloc_dma21 ),
					  .page1_valid_dma( page1_valid_dma21 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma21_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma21_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma21_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA21HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[21] ),
					 .receivedErrorResp(receivedErrorResp[21]),
                                         .ResetDMARdPtr(ResetDMA21RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[21]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma21_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma21_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma21[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma21_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma21_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma21_stop), 
					 .dma_reset_done_hold (dma21_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma21_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA21RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA22
niu_tdmc_dmacontext niu_tdmc_dmacontext_22 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA22[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA22_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA22_Ring_Wrapped),
                                         .DMA_RingLength(DMA22_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA22CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma22_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma22_eoflist),
                                         .DMA_EmptySpace(DMA22_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma22[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA22_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA22_ReqPending),
                                         .DMA_EntriesValid(DMA22_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA22_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA22_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA22_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma22_reset_scheduled ),
					 .dma_clear_reset ( dma22_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma22),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma22),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma22_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma22),
					   .dma_debug_port (dma22_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma22 ),
					  .page0_value_dma( page0_value_dma22 ),
					  .page0_reloc_dma( page0_reloc_dma22 ),
					  .page0_valid_dma( page0_valid_dma22 ),
					  .page1_mask_dma ( page1_mask_dma22 ),
					  .page1_value_dma( page1_value_dma22 ),
					  .page1_reloc_dma( page1_reloc_dma22 ),
					  .page1_valid_dma( page1_valid_dma22 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma22_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma22_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma22_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA22HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[22] ),
					 .receivedErrorResp(receivedErrorResp[22]),
                                         .ResetDMARdPtr(ResetDMA22RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[22]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma22_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma22_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma22[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma22_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma22_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma22_stop), 
					 .dma_reset_done_hold (dma22_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma22_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA22RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));

// DMA23
niu_tdmc_dmacontext niu_tdmc_dmacontext_23 (/*AUTOJUNK*/
                                         // Outputs
                                         .ShadowRingCurrentPtr_DMA(ShadowRingCurrentPtr_DMA23[`PTR_WIDTH - 1 :0]),
                                         .DMA_Address(DMA23_Address[63:0]),
                                         .DMA_Ring_Wrapped(DMA23_Ring_Wrapped),
                                         .DMA_RingLength(DMA23_RingLength[`PTR_WIDTH - 1 :0]),
                                         .DMACacheEntryValid(DMA23CacheEntryValid),
                                         .dmc_txc_dma_active(dmc_txc_dma23_active),
                                         .dmc_txc_dma_eoflist(dmc_txc_dma23_eoflist),
                                         .DMA_EmptySpace(DMA23_EmptySpace[3:0]),
                                         .tx_rng_head_dma(tx_rng_head_dma23[`PTR_WIDTH:0]),
                                         .DMA_AvailableFor_Fetch(DMA23_AvailableFor_Fetch),
                                         .DMA_ReqPending(DMA23_ReqPending),
                                         .DMA_EntriesValid(DMA23_EntriesValid[4:0]),
                                         .DMA_CacheEmpty(DMA23_CacheEmpty),
                                         .DMA_CacheReadPtr(DMA23_CacheReadPtr[3:0]),
                                         .DMA_CacheWritePtrReOrder(DMA23_CacheWritePtrReOrder[3:0]),
					 .dma_reset_scheduled ( dma23_reset_scheduled ),
					 .dma_clear_reset ( dma23_clear_reset ),
					 .set_conf_part_error_dma(set_conf_part_error_dma23),
					 .set_tx_ring_oflow_dma(set_tx_ring_oflow_dma23),
					 .tx_dma_cfg_dma_stop_state(tx_dma_cfg_dma23_stop_state),
					 .meta_entries_requested_dma(meta_entries_requested_dma23),
					   .dma_debug_port (dma23_debug_port),

                                         // Inputs
					  .page0_mask_dma ( page0_mask_dma23 ),
					  .page0_value_dma( page0_value_dma23 ),
					  .page0_reloc_dma( page0_reloc_dma23 ),
					  .page0_valid_dma( page0_valid_dma23 ),
					  .page1_mask_dma ( page1_mask_dma23 ),
					  .page1_value_dma( page1_value_dma23 ),
					  .page1_reloc_dma( page1_reloc_dma23 ),
					  .page1_valid_dma( page1_valid_dma23 ),
					  .dmc_txc_dma_page_handle( dmc_txc_dma23_page_handle ),
					  .txc_dmc_dma_inc_head(txc_dmc_dma23_inc_head),
					  .dmc_txc_dma_partial ( dmc_txc_dma23_partial ),
					  .NoOfValidEntries ( NoOfValidEntries),
                                         .inc_DMAHeadShadow(inc_DMA23HeadShadow),
                                         .updateCacheWritePtrs(updateCacheWritePtrs[23] ),
					 .receivedErrorResp(receivedErrorResp[23]),
                                         .ResetDMARdPtr(ResetDMA23RdPtr),
                                         .meta_resp_address(meta_resp_address[2:0]),
                                         .updateCacheContext(updateCacheContext[23]),
                                         .tx_rng_cfg_dma_staddr(tx_rng_cfg_dma23_staddr[37:0]),
                                         .meta_req_address(DMC_TxCache_SMX_Req_Address[7:0]),
                                         .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					 .DMA_UpdateAddress ( DMA_UpdateAddress ),
                                         .tx_rng_cfg_dma_len(tx_rng_cfg_dma23_len[`RNG_LENGTH_WIDTH -1 :0]),
                                         .tx_rng_tail_dma(tx_rng_tail_dma23[`PTR_WIDTH:0]),
                                         .tx_dma_cfg_dma_stall(tx_dma_cfg_dma23_stall),
					 .tx_dma_cfg_dma_rst (tx_dma_cfg_dma23_rst ),
					 .tx_dma_cfg_dma_stop(tx_dma_cfg_dma23_stop), 
					 .dma_reset_done_hold (dma23_reset_done_hold),
                                         .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
                                         .DMANumToReq(DMANumToReq[4:0]),
                                         .dmc_txc_dma_cacheready(dmc_txc_dma23_cacheready),
                                         .meta_resp_dma_num(meta_resp_dma_num[4:0]),
                                         .IncrDMARdPtr(IncrDMA23RdPtr),
                                         .SysClk(SysClk),
                                         .Reset_L(Reset_L));


`endif // ifdef NEPTUNE
   

   niu_dmc_dmaarb dma_req_arb ( .SysClk(SysClk),
				.Reset_L(Reset_L),
				.Choose_DMAs(choose_available_dmas),
				.DMA_Reqs(DMAs_AvailableFor_Fetch),
				.ArbDone(ArbDone),
				.DMANum(DMANumToReqArbOut),
				.DMAsGranted(DMANumToUpdate)
      
				);

   // this will change to accomodate new ptr manipulations
   
   niu_tdmc_addrcalc niu_tdmc_addrcalc (/*AUTOJUNK*/
					// Outputs
					.NoOfDescInMem(NoOfDescInMem[`PTR_WIDTH - 1 :0]),
					.NoOfDescLeft(NoOfDescLeft[`PTR_WIDTH - 1 :0]),
					.NoOfFreeSpaceInCache(NoOfFreeSpaceInCache[4:0]),
					.ShadowRingWrap(ShadowRingWrap),
					.DMA_AddressToReq_ff(DMA_AddressToReq_ff[63:0]),
					// Inputs
					.LatchDMAPtrs(LatchDMAPtrs),
					.DMANumToReq(DMANumToReq[4:0]),
					.tx_rng_tail_dma0(tx_rng_tail_dma0[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA0(ShadowRingCurrentPtr_DMA0[`PTR_WIDTH - 1 :0]),
					.DMA0_EmptySpace(DMA0_EmptySpace[3:0]),
					.DMA0_RingLength(DMA0_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA0_Ring_Wrapped(DMA0_Ring_Wrapped),
					.DMA0_Address(DMA0_Address[63:0]),
					.tx_rng_tail_dma1(tx_rng_tail_dma1[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA1(ShadowRingCurrentPtr_DMA1[`PTR_WIDTH - 1 :0]),
					.DMA1_EmptySpace(DMA1_EmptySpace[3:0]),
					.DMA1_RingLength(DMA1_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA1_Ring_Wrapped(DMA1_Ring_Wrapped),
					.DMA1_Address(DMA1_Address[63:0]),
					.tx_rng_tail_dma2(tx_rng_tail_dma2[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA2(ShadowRingCurrentPtr_DMA2[`PTR_WIDTH - 1 :0]),
					.DMA2_EmptySpace(DMA2_EmptySpace[3:0]),
					.DMA2_RingLength(DMA2_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA2_Ring_Wrapped(DMA2_Ring_Wrapped),
					.DMA2_Address(DMA2_Address[63:0]),
					.tx_rng_tail_dma3(tx_rng_tail_dma3[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA3(ShadowRingCurrentPtr_DMA3[`PTR_WIDTH - 1 :0]),
					.DMA3_EmptySpace(DMA3_EmptySpace[3:0]),
					.DMA3_RingLength(DMA3_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA3_Ring_Wrapped(DMA3_Ring_Wrapped),
					.DMA3_Address(DMA3_Address[63:0]),
					.tx_rng_tail_dma4(tx_rng_tail_dma4[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA4(ShadowRingCurrentPtr_DMA4[`PTR_WIDTH - 1 :0]),
					.DMA4_EmptySpace(DMA4_EmptySpace[3:0]),
					.DMA4_RingLength(DMA4_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA4_Ring_Wrapped(DMA4_Ring_Wrapped),
					.DMA4_Address(DMA4_Address[63:0]),
					.tx_rng_tail_dma5(tx_rng_tail_dma5[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA5(ShadowRingCurrentPtr_DMA5[`PTR_WIDTH - 1 :0]),
					.DMA5_EmptySpace(DMA5_EmptySpace[3:0]),
					.DMA5_RingLength(DMA5_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA5_Ring_Wrapped(DMA5_Ring_Wrapped),
					.DMA5_Address(DMA5_Address[63:0]),
					.tx_rng_tail_dma6(tx_rng_tail_dma6[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA6(ShadowRingCurrentPtr_DMA6[`PTR_WIDTH - 1 :0]),
					.DMA6_EmptySpace(DMA6_EmptySpace[3:0]),
					.DMA6_RingLength(DMA6_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA6_Ring_Wrapped(DMA6_Ring_Wrapped),
					.DMA6_Address(DMA6_Address[63:0]),
					.tx_rng_tail_dma7(tx_rng_tail_dma7[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA7(ShadowRingCurrentPtr_DMA7[`PTR_WIDTH - 1 :0]),
					.DMA7_EmptySpace(DMA7_EmptySpace[3:0]),
					.DMA7_RingLength(DMA7_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA7_Ring_Wrapped(DMA7_Ring_Wrapped),
					.DMA7_Address(DMA7_Address[63:0]),
					.tx_rng_tail_dma8(tx_rng_tail_dma8[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA8(ShadowRingCurrentPtr_DMA8[`PTR_WIDTH - 1 :0]),
					.DMA8_EmptySpace(DMA8_EmptySpace[3:0]),
					.DMA8_RingLength(DMA8_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA8_Ring_Wrapped(DMA8_Ring_Wrapped),
					.DMA8_Address(DMA8_Address[63:0]),
					.tx_rng_tail_dma9(tx_rng_tail_dma9[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA9(ShadowRingCurrentPtr_DMA9[`PTR_WIDTH - 1 :0]),
					.DMA9_EmptySpace(DMA9_EmptySpace[3:0]),
					.DMA9_RingLength(DMA9_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA9_Ring_Wrapped(DMA9_Ring_Wrapped),
					.DMA9_Address(DMA9_Address[63:0]),
					.tx_rng_tail_dma10(tx_rng_tail_dma10[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA10(ShadowRingCurrentPtr_DMA10[`PTR_WIDTH - 1 :0]),
					.DMA10_EmptySpace(DMA10_EmptySpace[3:0]),
					.DMA10_RingLength(DMA10_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA10_Ring_Wrapped(DMA10_Ring_Wrapped),
					.DMA10_Address(DMA10_Address[63:0]),
					.tx_rng_tail_dma11(tx_rng_tail_dma11[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA11(ShadowRingCurrentPtr_DMA11[`PTR_WIDTH - 1 :0]),
					.DMA11_EmptySpace(DMA11_EmptySpace[3:0]),
					.DMA11_RingLength(DMA11_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA11_Ring_Wrapped(DMA11_Ring_Wrapped),
					.DMA11_Address(DMA11_Address[63:0]),
					.tx_rng_tail_dma12(tx_rng_tail_dma12[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA12(ShadowRingCurrentPtr_DMA12[`PTR_WIDTH - 1 :0]),
					.DMA12_EmptySpace(DMA12_EmptySpace[3:0]),
					.DMA12_RingLength(DMA12_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA12_Ring_Wrapped(DMA12_Ring_Wrapped),
					.DMA12_Address(DMA12_Address[63:0]),
					.tx_rng_tail_dma13(tx_rng_tail_dma13[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA13(ShadowRingCurrentPtr_DMA13[`PTR_WIDTH - 1 :0]),
					.DMA13_EmptySpace(DMA13_EmptySpace[3:0]),
					.DMA13_RingLength(DMA13_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA13_Ring_Wrapped(DMA13_Ring_Wrapped),
					.DMA13_Address(DMA13_Address[63:0]),
					.tx_rng_tail_dma14(tx_rng_tail_dma14[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA14(ShadowRingCurrentPtr_DMA14[`PTR_WIDTH - 1 :0]),
					.DMA14_EmptySpace(DMA14_EmptySpace[3:0]),
					.DMA14_RingLength(DMA14_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA14_Ring_Wrapped(DMA14_Ring_Wrapped),
					.DMA14_Address(DMA14_Address[63:0]),
					.tx_rng_tail_dma15(tx_rng_tail_dma15[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA15(ShadowRingCurrentPtr_DMA15[`PTR_WIDTH - 1 :0]),
					.DMA15_EmptySpace(DMA15_EmptySpace[3:0]),
					.DMA15_RingLength(DMA15_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA15_Ring_Wrapped(DMA15_Ring_Wrapped),
					.DMA15_Address(DMA15_Address[63:0]),
`ifdef NEPTUNE
					
					.tx_rng_tail_dma16(tx_rng_tail_dma16[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA16(ShadowRingCurrentPtr_DMA16[`PTR_WIDTH - 1 :0]),
					.DMA16_EmptySpace(DMA16_EmptySpace[3:0]),
					.DMA16_RingLength(DMA16_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA16_Ring_Wrapped(DMA16_Ring_Wrapped),
					.DMA16_Address(DMA16_Address[63:0]),
					.tx_rng_tail_dma17(tx_rng_tail_dma17[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA17(ShadowRingCurrentPtr_DMA17[`PTR_WIDTH - 1 :0]),
					.DMA17_EmptySpace(DMA17_EmptySpace[3:0]),
					.DMA17_RingLength(DMA17_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA17_Ring_Wrapped(DMA17_Ring_Wrapped),
					.DMA17_Address(DMA17_Address[63:0]),
					.tx_rng_tail_dma18(tx_rng_tail_dma18[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA18(ShadowRingCurrentPtr_DMA18[`PTR_WIDTH - 1 :0]),
					.DMA18_EmptySpace(DMA18_EmptySpace[3:0]),
					.DMA18_RingLength(DMA18_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA18_Ring_Wrapped(DMA18_Ring_Wrapped),
					.DMA18_Address(DMA18_Address[63:0]),
					.tx_rng_tail_dma19(tx_rng_tail_dma19[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA19(ShadowRingCurrentPtr_DMA19[`PTR_WIDTH - 1 :0]),
					.DMA19_EmptySpace(DMA19_EmptySpace[3:0]),
					.DMA19_RingLength(DMA19_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA19_Ring_Wrapped(DMA19_Ring_Wrapped),
					.DMA19_Address(DMA19_Address[63:0]),
					.tx_rng_tail_dma20(tx_rng_tail_dma20[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA20(ShadowRingCurrentPtr_DMA20[`PTR_WIDTH - 1 :0]),
					.DMA20_EmptySpace(DMA20_EmptySpace[3:0]),
					.DMA20_RingLength(DMA20_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA20_Ring_Wrapped(DMA20_Ring_Wrapped),
					.DMA20_Address(DMA20_Address[63:0]),
					.tx_rng_tail_dma21(tx_rng_tail_dma21[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA21(ShadowRingCurrentPtr_DMA21[`PTR_WIDTH - 1 :0]),
					.DMA21_EmptySpace(DMA21_EmptySpace[3:0]),
					.DMA21_RingLength(DMA21_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA21_Ring_Wrapped(DMA21_Ring_Wrapped),
					.DMA21_Address(DMA21_Address[63:0]),
					.tx_rng_tail_dma22(tx_rng_tail_dma22[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA22(ShadowRingCurrentPtr_DMA22[`PTR_WIDTH - 1 :0]),
					.DMA22_EmptySpace(DMA22_EmptySpace[3:0]),
					.DMA22_RingLength(DMA22_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA22_Ring_Wrapped(DMA22_Ring_Wrapped),
					.DMA22_Address(DMA22_Address[63:0]),
					.tx_rng_tail_dma23(tx_rng_tail_dma23[`PTR_WIDTH:0]),
					.ShadowRingCurrentPtr_DMA23(ShadowRingCurrentPtr_DMA23[`PTR_WIDTH - 1 :0]),
					.DMA23_EmptySpace(DMA23_EmptySpace[3:0]),
					.DMA23_RingLength(DMA23_RingLength[`PTR_WIDTH - 1 :0]),
					.DMA23_Ring_Wrapped(DMA23_Ring_Wrapped),
					.DMA23_Address(DMA23_Address[63:0]),
`endif // ifdef NEPTUNE
   
					
					.SysClk(SysClk),
					.Reset_L(Reset_L));
   

   niu_tdmc_cachefetch niu_tdmc_cachefetch (/*AUTOJUNK*/
					    // Outputs
					    .choose_available_dmas(choose_available_dmas),
					    .TxCacheFetchState(TxCacheFetchState),
					    .updateCacheContext(updateCacheContext[`NO_OF_DMAS - 1 :0]),
					    .DMC_TxCache_SMX_Req(DMC_TxCache_SMX_Req),
					    .DMC_TxCache_SMX_Req_Port_Num(DMC_TxCache_SMX_Req_Port_Num[1:0]),
					    .DMC_TxCache_SMX_Req_Address(DMC_TxCache_SMX_Req_Address[63:0]),
					    .DMA_UpdateAddress(DMA_UpdateAddress[43:0]),
					    .DMC_TxCache_SMX_Req_Length(DMC_TxCache_SMX_Req_Length[13:0]),
					    .DMC_TxCache_SMX_Req_Cmd(DMC_TxCache_SMX_Req_Cmd[7:0]),
					    .DMC_TxCache_SMX_Req_DMA_Num(DMC_TxCache_SMX_Req_DMA_Num[4:0]),
					    .tdmc_arb1_req_func_num(tdmc_arb1_req_func_num),
					    .LatchDMAPtrs(LatchDMAPtrs),
					    .DMANumToReq(DMANumToReq[4:0]),
					    .NoOfCacheWritesDispatched(NoOfCacheWritesDispatched[3:0]),
					    .DMAs_AvailableFor_Fetch(DMAs_AvailableFor_Fetch[31:0]),
					    // Inputs
					    .SysClk(SysClk),
					    .Reset_L(Reset_L),
					    .DMA0_AvailableFor_Fetch(DMA0_AvailableFor_Fetch),
					    .DMA1_AvailableFor_Fetch(DMA1_AvailableFor_Fetch),
					    .DMA2_AvailableFor_Fetch(DMA2_AvailableFor_Fetch),
					    .DMA3_AvailableFor_Fetch(DMA3_AvailableFor_Fetch),
					    .DMA4_AvailableFor_Fetch(DMA4_AvailableFor_Fetch),
					    .DMA5_AvailableFor_Fetch(DMA5_AvailableFor_Fetch),
					    .DMA6_AvailableFor_Fetch(DMA6_AvailableFor_Fetch),
					    .DMA7_AvailableFor_Fetch(DMA7_AvailableFor_Fetch),
					    .DMA8_AvailableFor_Fetch(DMA8_AvailableFor_Fetch),
					    .DMA9_AvailableFor_Fetch(DMA9_AvailableFor_Fetch),
					    .DMA10_AvailableFor_Fetch(DMA10_AvailableFor_Fetch),
					    .DMA11_AvailableFor_Fetch(DMA11_AvailableFor_Fetch),
					    .DMA12_AvailableFor_Fetch(DMA12_AvailableFor_Fetch),
					    .DMA13_AvailableFor_Fetch(DMA13_AvailableFor_Fetch),
					    .DMA14_AvailableFor_Fetch(DMA14_AvailableFor_Fetch),
					    .DMA15_AvailableFor_Fetch(DMA15_AvailableFor_Fetch),
`ifdef NEPTUNE
					    .DMA16_AvailableFor_Fetch(DMA16_AvailableFor_Fetch),
					    .DMA17_AvailableFor_Fetch(DMA17_AvailableFor_Fetch),
					    .DMA18_AvailableFor_Fetch(DMA18_AvailableFor_Fetch),
					    .DMA19_AvailableFor_Fetch(DMA19_AvailableFor_Fetch),
					    .DMA20_AvailableFor_Fetch(DMA20_AvailableFor_Fetch),
					    .DMA21_AvailableFor_Fetch(DMA21_AvailableFor_Fetch),
					    .DMA22_AvailableFor_Fetch(DMA22_AvailableFor_Fetch),
					    .DMA23_AvailableFor_Fetch(DMA23_AvailableFor_Fetch),
`else
					    .DMA16_AvailableFor_Fetch(1'b0),
					    .DMA17_AvailableFor_Fetch(1'b0),
					    .DMA18_AvailableFor_Fetch(1'b0),
					    .DMA19_AvailableFor_Fetch(1'b0),
					    .DMA20_AvailableFor_Fetch(1'b0),
					    .DMA21_AvailableFor_Fetch(1'b0),
					    .DMA22_AvailableFor_Fetch(1'b0),
					    .DMA23_AvailableFor_Fetch(1'b0),
`endif // ifdef NEPTUNE
   
					    
					   
					    .DMA0_ReqPending(DMA0_ReqPending),
					    .DMA1_ReqPending(DMA1_ReqPending),
					    .DMA2_ReqPending(DMA2_ReqPending),
					    .DMA3_ReqPending(DMA3_ReqPending),
					    .DMA4_ReqPending(DMA4_ReqPending),
					    .DMA5_ReqPending(DMA5_ReqPending),
					    .DMA6_ReqPending(DMA6_ReqPending),
					    .DMA7_ReqPending(DMA7_ReqPending),
					    .DMA8_ReqPending(DMA8_ReqPending),
					    .DMA9_ReqPending(DMA9_ReqPending),
					    .DMA10_ReqPending(DMA10_ReqPending),
					    .DMA11_ReqPending(DMA11_ReqPending),
					    .DMA12_ReqPending(DMA12_ReqPending),
					    .DMA13_ReqPending(DMA13_ReqPending),
					    .DMA14_ReqPending(DMA14_ReqPending),
					    .DMA15_ReqPending(DMA15_ReqPending),
`ifdef NEPTUNE
					    .DMA16_ReqPending(DMA16_ReqPending),
					    .DMA17_ReqPending(DMA17_ReqPending),
					    .DMA18_ReqPending(DMA18_ReqPending),
					    .DMA19_ReqPending(DMA19_ReqPending),
					    .DMA20_ReqPending(DMA20_ReqPending),
					    .DMA21_ReqPending(DMA21_ReqPending),
					    .DMA22_ReqPending(DMA22_ReqPending),
					    .DMA23_ReqPending(DMA23_ReqPending),
`else // !ifdef NEPTUNE
					    .DMA16_ReqPending(1'b0),
					    .DMA17_ReqPending(1'b0),
					    .DMA18_ReqPending(1'b0),
					    .DMA19_ReqPending(1'b0),
					    .DMA20_ReqPending(1'b0),
					    .DMA21_ReqPending(1'b0),
					    .DMA22_ReqPending(1'b0),
					    .DMA23_ReqPending(1'b0),			    
`endif // ifdef NEPTUNE
   

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
`else // !ifdef NEPTUNE
					    .dmc_txc_dma16_func_num(2'h0),
					    .dmc_txc_dma17_func_num(2'h0),
					    .dmc_txc_dma18_func_num(2'h0),
					    .dmc_txc_dma19_func_num(2'h0),
					    .dmc_txc_dma20_func_num(2'h0),
					    .dmc_txc_dma21_func_num(2'h0),
					    .dmc_txc_dma22_func_num(2'h0),
					    .dmc_txc_dma23_func_num(2'h0),		    
`endif // ifdef NEPTUNE
   
					    
					    .ArbDone(ArbDone),
					    .DMANumToReqArbOut(DMANumToReqArbOut[4:0]),
					    .DMANumToUpdate(DMANumToUpdate[31:0]),
					    .SMX_DMC_TxCache_Req_Ack(SMX_DMC_TxCache_Req_Ack),
					    .NoOfDescInMem(NoOfDescInMem[`PTR_WIDTH - 1 :0]),
					    .NoOfDescLeft(NoOfDescLeft[`PTR_WIDTH - 1 :0]),
					    .NoOfFreeSpaceInCache(NoOfFreeSpaceInCache[4:0]),
					    .ShadowRingWrap(ShadowRingWrap),
					    .DMA_AddressToReq_ff(DMA_AddressToReq_ff[63:0]),
					    .dmc_txc_tx_addr_md(dmc_txc_tx_addr_md)); 


   
   // end of module for fetch sm


   niu_tdmc_cachewrite niu_tdmc_cachewrite(/*AUTOJUNK*/
					   // Outputs
					   .DMC_TxCache_SMX_Resp_Accept(DMC_TxCache_SMX_Resp_Accept),
					   .updateCacheWritePtrs(updateCacheWritePtrs[`NO_OF_DMAS - 1 :0]),
					   .receivedErrorResp(receivedErrorResp[`NO_OF_DMAS - 1 :0]),
					   .meta_resp_dma_num(meta_resp_dma_num[4:0]),
					   .meta_resp_address(meta_resp_address[3:0]),
					   .DMA_TxCacheWritePtr(DMA_TxCacheWritePtr[7:0]),
					   .DMA_TxCacheWrite(DMA_TxCacheWrite),
					   .NoOfValidEntries(NoOfValidEntries[4:0]),
					   .DMA_TxCacheWriteEntriesValid(DMA_TxCacheWriteEntriesValid[3:0]),
					   .DMA_TxCacheWriteData(DMA_TxCacheWriteData[127:0]),
					   .txpref_dma_nack_resp(txpref_dma_nack_resp[`NO_OF_DMAS - 1 :0]),
					   .txpref_nack_resp(txpref_nack_resp),
					   .txpref_nack_rd_addr(txpref_nack_rd_addr[43:0]),
					   .parity_corrupt_dma_match(parity_corrupt_dma_match),
					   // Inputs
					   .SMX_DMC_TxCache_Resp_Rdy(SMX_DMC_TxCache_Resp_Rdy),
					   .SMX_DMC_TxCache_Resp_DMA_Num(SMX_DMC_TxCache_Resp_DMA_Num[4:0]),
					   .SMX_DMC_TxCache_Resp_Address(SMX_DMC_TxCache_Resp_Address[63:0]),
					   .SMX_DMC_TxCache_Trans_Complete(SMX_DMC_TxCache_Trans_Complete),
					   .SMX_DMC_TxCache_Resp_Complete(SMX_DMC_TxCache_Resp_Complete),
					   .SMX_DMC_TxCache_Resp_ByteEnables(SMX_DMC_TxCache_Resp_ByteEnables[15:0]),
					   .SMX_DMC_TxCache_Resp_Data_Length(SMX_DMC_TxCache_Resp_Data_Length[13:0]),
					   .SMX_DMC_TxCache_Resp_Data_Valid(SMX_DMC_TxCache_Resp_Data_Valid),
					   .SMX_DMC_TxCache_Resp_Data(SMX_DMC_TxCache_Resp_Data[127:0]),
					   .meta_dmc_resp_cmd(meta_dmc_resp_cmd[7:0]),
					   .meta_dmc_resp_cmd_status(meta_dmc_resp_cmd_status[3:0]),
					   .meta_dmc_data_status(meta_dmc_data_status[3:0]),
					   .DMA0_CacheWritePtrReOrder(DMA0_CacheWritePtrReOrder[3:0]),
					   .DMA1_CacheWritePtrReOrder(DMA1_CacheWritePtrReOrder[3:0]),
					   .DMA2_CacheWritePtrReOrder(DMA2_CacheWritePtrReOrder[3:0]),
					   .DMA3_CacheWritePtrReOrder(DMA3_CacheWritePtrReOrder[3:0]),
					   .DMA4_CacheWritePtrReOrder(DMA4_CacheWritePtrReOrder[3:0]),
					   .DMA5_CacheWritePtrReOrder(DMA5_CacheWritePtrReOrder[3:0]),
					   .DMA6_CacheWritePtrReOrder(DMA6_CacheWritePtrReOrder[3:0]),
					   .DMA7_CacheWritePtrReOrder(DMA7_CacheWritePtrReOrder[3:0]),
					   .DMA8_CacheWritePtrReOrder(DMA8_CacheWritePtrReOrder[3:0]),
					   .DMA9_CacheWritePtrReOrder(DMA9_CacheWritePtrReOrder[3:0]),
					   .DMA10_CacheWritePtrReOrder(DMA10_CacheWritePtrReOrder[3:0]),
					   .DMA11_CacheWritePtrReOrder(DMA11_CacheWritePtrReOrder[3:0]),
					   .DMA12_CacheWritePtrReOrder(DMA12_CacheWritePtrReOrder[3:0]),
					   .DMA13_CacheWritePtrReOrder(DMA13_CacheWritePtrReOrder[3:0]),
					   .DMA14_CacheWritePtrReOrder(DMA14_CacheWritePtrReOrder[3:0]),
					   .DMA15_CacheWritePtrReOrder(DMA15_CacheWritePtrReOrder[3:0]),
`ifdef NEPTUNE
					   
					   .DMA16_CacheWritePtrReOrder(DMA16_CacheWritePtrReOrder[3:0]),
					   .DMA17_CacheWritePtrReOrder(DMA17_CacheWritePtrReOrder[3:0]),
					   .DMA18_CacheWritePtrReOrder(DMA18_CacheWritePtrReOrder[3:0]),
					   .DMA19_CacheWritePtrReOrder(DMA19_CacheWritePtrReOrder[3:0]),
					   .DMA20_CacheWritePtrReOrder(DMA20_CacheWritePtrReOrder[3:0]),
					   .DMA21_CacheWritePtrReOrder(DMA21_CacheWritePtrReOrder[3:0]),
					   .DMA22_CacheWritePtrReOrder(DMA22_CacheWritePtrReOrder[3:0]),
					   .DMA23_CacheWritePtrReOrder(DMA23_CacheWritePtrReOrder[3:0]),
`endif // ifdef NEPTUNE
   
					   .meta_entries_requested_dma0(meta_entries_requested_dma0),
					   .meta_entries_requested_dma1(meta_entries_requested_dma1),
					   .meta_entries_requested_dma2(meta_entries_requested_dma2),
					   .meta_entries_requested_dma3(meta_entries_requested_dma3),
					   .meta_entries_requested_dma4(meta_entries_requested_dma4),
					   .meta_entries_requested_dma5(meta_entries_requested_dma5),
					   .meta_entries_requested_dma6(meta_entries_requested_dma6),
					   .meta_entries_requested_dma7(meta_entries_requested_dma7),
					   .meta_entries_requested_dma8(meta_entries_requested_dma8),
					   .meta_entries_requested_dma9(meta_entries_requested_dma9),
					   .meta_entries_requested_dma10(meta_entries_requested_dma10),
					   .meta_entries_requested_dma11(meta_entries_requested_dma11),
					   .meta_entries_requested_dma12(meta_entries_requested_dma12),
					   .meta_entries_requested_dma13(meta_entries_requested_dma13),
					   .meta_entries_requested_dma14(meta_entries_requested_dma14),
					   .meta_entries_requested_dma15(meta_entries_requested_dma15),
`ifdef NEPTUNE
					   .meta_entries_requested_dma16(meta_entries_requested_dma16),
					   .meta_entries_requested_dma17(meta_entries_requested_dma17),
					   .meta_entries_requested_dma18(meta_entries_requested_dma18),
					   .meta_entries_requested_dma19(meta_entries_requested_dma19),
					   .meta_entries_requested_dma20(meta_entries_requested_dma20),
					   .meta_entries_requested_dma21(meta_entries_requested_dma21),
					   .meta_entries_requested_dma22(meta_entries_requested_dma22),
					   .meta_entries_requested_dma23(meta_entries_requested_dma23),
`endif // ifdef NEPTUNE
   
					   
					   .SysClk(SysClk),
					   .Reset_L(Reset_L));
   



   // TxCache Update Logic--
   
   /*
    Tx Cache Organization-
    
    Total Avaibale size  - 4K for Tx - 32DMA Channels, 2 cache line (64 bytes) worth of descriptors 
    
    The cache RAM is 128 bits wide, and 256 deep 
    
    Each DMA can occupy 4 entries in this cache 4*16 - 64Bytes
    pointer size - 2 bits + 1 bit for wrap around detection 
    
    
    */

   

   niu_tdmc_cacheread niu_tdmc_cacheread(/*AUTOJUNK*/
					 // Outputs
					 .DMA_TxCacheRead(DMA_TxCacheRead),
					 .DMA_TxCacheReadPtr(DMA_TxCacheReadPtr[7:0]),
					 .DMA0_CacheReadGnt(DMA0_CacheReadGnt),
					 .DMA1_CacheReadGnt(DMA1_CacheReadGnt),
					 .DMA2_CacheReadGnt(DMA2_CacheReadGnt),
					 .DMA3_CacheReadGnt(DMA3_CacheReadGnt),
					 .DMA4_CacheReadGnt(DMA4_CacheReadGnt),
					 .DMA5_CacheReadGnt(DMA5_CacheReadGnt),
					 .DMA6_CacheReadGnt(DMA6_CacheReadGnt),
					 .DMA7_CacheReadGnt(DMA7_CacheReadGnt),
					 .DMA8_CacheReadGnt(DMA8_CacheReadGnt),
					 .DMA9_CacheReadGnt(DMA9_CacheReadGnt),
					 .DMA10_CacheReadGnt(DMA10_CacheReadGnt),
					 .DMA11_CacheReadGnt(DMA11_CacheReadGnt),
					 .DMA12_CacheReadGnt(DMA12_CacheReadGnt),
					 .DMA13_CacheReadGnt(DMA13_CacheReadGnt),
					 .DMA14_CacheReadGnt(DMA14_CacheReadGnt),
					 .DMA15_CacheReadGnt(DMA15_CacheReadGnt),
`ifdef NEPTUNE
					 
					 .DMA16_CacheReadGnt(DMA16_CacheReadGnt),
					 .DMA17_CacheReadGnt(DMA17_CacheReadGnt),
					 .DMA18_CacheReadGnt(DMA18_CacheReadGnt),
					 .DMA19_CacheReadGnt(DMA19_CacheReadGnt),
					 .DMA20_CacheReadGnt(DMA20_CacheReadGnt),
					 .DMA21_CacheReadGnt(DMA21_CacheReadGnt),
					 .DMA22_CacheReadGnt(DMA22_CacheReadGnt),
					 .DMA23_CacheReadGnt(DMA23_CacheReadGnt),
`endif // ifdef NEPTUNE
   
					 // Inputs
					 .DMA0_CacheReadPtr(DMA0_CacheReadPtr[3:0]),
					 .DMA0_CacheReadReq(DMA0_CacheReadReq),
					 .DMA1_CacheReadPtr(DMA1_CacheReadPtr[3:0]),
					 .DMA1_CacheReadReq(DMA1_CacheReadReq),
					 .DMA2_CacheReadPtr(DMA2_CacheReadPtr[3:0]),
					 .DMA2_CacheReadReq(DMA2_CacheReadReq),
					 .DMA3_CacheReadPtr(DMA3_CacheReadPtr[3:0]),
					 .DMA3_CacheReadReq(DMA3_CacheReadReq),
					 .DMA4_CacheReadPtr(DMA4_CacheReadPtr[3:0]),
					 .DMA4_CacheReadReq(DMA4_CacheReadReq),
					 .DMA5_CacheReadPtr(DMA5_CacheReadPtr[3:0]),
					 .DMA5_CacheReadReq(DMA5_CacheReadReq),
					 .DMA6_CacheReadPtr(DMA6_CacheReadPtr[3:0]),
					 .DMA6_CacheReadReq(DMA6_CacheReadReq),
					 .DMA7_CacheReadPtr(DMA7_CacheReadPtr[3:0]),
					 .DMA7_CacheReadReq(DMA7_CacheReadReq),
					 .DMA8_CacheReadPtr(DMA8_CacheReadPtr[3:0]),
					 .DMA8_CacheReadReq(DMA8_CacheReadReq),
					 .DMA9_CacheReadPtr(DMA9_CacheReadPtr[3:0]),
					 .DMA9_CacheReadReq(DMA9_CacheReadReq),
					 .DMA10_CacheReadPtr(DMA10_CacheReadPtr[3:0]),
					 .DMA10_CacheReadReq(DMA10_CacheReadReq),
					 .DMA11_CacheReadPtr(DMA11_CacheReadPtr[3:0]),
					 .DMA11_CacheReadReq(DMA11_CacheReadReq),
					 .DMA12_CacheReadPtr(DMA12_CacheReadPtr[3:0]),
					 .DMA12_CacheReadReq(DMA12_CacheReadReq),
					 .DMA13_CacheReadPtr(DMA13_CacheReadPtr[3:0]),
					 .DMA13_CacheReadReq(DMA13_CacheReadReq),
					 .DMA14_CacheReadPtr(DMA14_CacheReadPtr[3:0]),
					 .DMA14_CacheReadReq(DMA14_CacheReadReq),
					 .DMA15_CacheReadPtr(DMA15_CacheReadPtr[3:0]),
					 .DMA15_CacheReadReq(DMA15_CacheReadReq),
`ifdef NEPTUNE
					 
					 .DMA16_CacheReadPtr(DMA16_CacheReadPtr[3:0]),
					 .DMA16_CacheReadReq(DMA16_CacheReadReq),
					 .DMA17_CacheReadPtr(DMA17_CacheReadPtr[3:0]),
					 .DMA17_CacheReadReq(DMA17_CacheReadReq),
					 .DMA18_CacheReadPtr(DMA18_CacheReadPtr[3:0]),
					 .DMA18_CacheReadReq(DMA18_CacheReadReq),
					 .DMA19_CacheReadPtr(DMA19_CacheReadPtr[3:0]),
					 .DMA19_CacheReadReq(DMA19_CacheReadReq),
					 .DMA20_CacheReadPtr(DMA20_CacheReadPtr[3:0]),
					 .DMA20_CacheReadReq(DMA20_CacheReadReq),
					 .DMA21_CacheReadPtr(DMA21_CacheReadPtr[3:0]),
					 .DMA21_CacheReadReq(DMA21_CacheReadReq),
					 .DMA22_CacheReadPtr(DMA22_CacheReadPtr[3:0]),
					 .DMA22_CacheReadReq(DMA22_CacheReadReq),
					 .DMA23_CacheReadPtr(DMA23_CacheReadPtr[3:0]),
					 .DMA23_CacheReadReq(DMA23_CacheReadReq),
`else // !ifdef NEPTUNE
					 
					 .DMA16_CacheReadPtr(4'h0),
					 .DMA16_CacheReadReq(1'b0),
					 .DMA17_CacheReadPtr(4'h0),
					 .DMA17_CacheReadReq(1'b0),
					 .DMA18_CacheReadPtr(4'h0),
					 .DMA18_CacheReadReq(1'b0),
					 .DMA19_CacheReadPtr(4'h0),
					 .DMA19_CacheReadReq(1'b0),
					 .DMA20_CacheReadPtr(4'h0),
					 .DMA20_CacheReadReq(1'b0),
					 .DMA21_CacheReadPtr(4'h0),
					 .DMA21_CacheReadReq(1'b0),
					 .DMA22_CacheReadPtr(4'h0),
					 .DMA22_CacheReadReq(1'b0),
					 .DMA23_CacheReadPtr(4'h0),
					 .DMA23_CacheReadReq(1'b0),
`endif // ifdef NEPTUNE
   

					 
					 .SysClk(SysClk),
					 .Reset_L(Reset_L));

   niu_dmc_txcache niu_dmc_txcache( /*AUTOJUNK*/
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
				    .tcu_mbist_user_mode	            (tcu_mbist_user_mode),
				    .tcu_scan_en  			    (tcu_scan_en  ),
				    .l2clk_2x(l2clk_2x),
				    .iol2clk(iol2clk),
				    .hdr_sram_rvalue_tdmc            (hdr_sram_rvalue_tdmc),
				    .hdr_sram_rid_tdmc               (hdr_sram_rid_tdmc),
				    .hdr_sram_wr_en_tdmc             (hdr_sram_wr_en_tdmc),
				    .hdr_sram_red_clr_tdmc           (hdr_sram_red_clr_tdmc),
				    .sram_hdr_read_data_tdmc         (sram_hdr_read_data_tdmc),
				    .tds_tcu_dmo_data_out                (tds_tcu_dmo_data_out),
				    .sram_reset                      (sram_reset),

`endif // ifdef NEPTUNE
				    

                                    .WriteStrobe(DMA_TxCacheWrite),
                                    .WriteClock(SysClk),
				    .Reset_L(Reset_L),
                                    .ReadStrobe(DMA_TxCacheRead),
                                    .ReadAddr(DMA_TxCacheReadPtr),
                                    .WriteAddr(DMA_TxCacheWritePtr),
                                    .DataIn({DMA_TxCacheWriteEntriesValid,DMA_TxCacheWriteData}),
                                    .DataOut({DMA_TxCacheTags,DMA_TxCacheReadData}),
                                    .ParityStatus(ParityStatus),
`ifdef NEPTUNE
				    .parity_corrupt_dma_match({8'h0,parity_corrupt_dma_match}),
`else // !ifdef NEPTUNE
				    .parity_corrupt_dma_match({16'h0,parity_corrupt_dma_match}),		    
`endif // ifdef NEPTUNE
   
				    .parity_corrupt_config(parity_corrupt_config)

				   );



   // TXC Interfaces-



// DMA0
   niu_dmc_txcif TxCacheIf0 (.incr_read_ptr(IncrDMA0RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma0_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA0_CacheReadReq),
			 .read_gnt(DMA0_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma0_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma0_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma0_partial),
			 .empty(DMA0_CacheEmpty),
			 .cache_ready(dmc_txc_dma0_cacheready),
			 .inc_head_shadow(inc_DMA0HeadShadow),
			 .cache_entry_valid(DMA0CacheEntryValid),
			 .cache_filled_size(DMA0_EntriesValid),
			 .reset_cache_pointers(ResetDMA0RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma0 ),
                         .page0_value_dma( page0_value_dma0 ),
                         .page0_reloc_dma( page0_reloc_dma0 ),
                         .page0_valid_dma( page0_valid_dma0 ),
                         .page1_mask_dma ( page1_mask_dma0 ),
                         .page1_value_dma( page1_value_dma0 ),
                         .page1_reloc_dma( page1_reloc_dma0 ),
                         .page1_valid_dma( page1_valid_dma0 ),
			 .dma_reset_scheduled ( dma0_reset_scheduled ),
			 .dma_reset_done_hold ( dma0_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma0_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma0_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma0_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma0),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma0),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma0),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA0

// DMA1
   niu_dmc_txcif TxCacheIf1 (.incr_read_ptr(IncrDMA1RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma1_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA1_CacheReadReq),
			 .read_gnt(DMA1_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma1_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma1_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma1_partial),
			 .empty(DMA1_CacheEmpty),
			 .cache_ready(dmc_txc_dma1_cacheready),
			 .inc_head_shadow(inc_DMA1HeadShadow),
			 .cache_entry_valid(DMA1CacheEntryValid),
			 .cache_filled_size(DMA1_EntriesValid),
			 .reset_cache_pointers(ResetDMA1RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma1 ),
                         .page0_value_dma( page0_value_dma1 ),
                         .page0_reloc_dma( page0_reloc_dma1 ),
                         .page0_valid_dma( page0_valid_dma1 ),
                         .page1_mask_dma ( page1_mask_dma1 ),
                         .page1_value_dma( page1_value_dma1 ),
                         .page1_reloc_dma( page1_reloc_dma1 ),
                         .page1_valid_dma( page1_valid_dma1 ),
			 .dma_reset_scheduled ( dma1_reset_scheduled ),
			 .dma_reset_done_hold ( dma1_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma1_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma1_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma1_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma1),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma1),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma1),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA1

// DMA2
   niu_dmc_txcif TxCacheIf2 (.incr_read_ptr(IncrDMA2RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma2_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA2_CacheReadReq),
			 .read_gnt(DMA2_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma2_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma2_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma2_partial),
			 .empty(DMA2_CacheEmpty),
			 .cache_ready(dmc_txc_dma2_cacheready),
			 .inc_head_shadow(inc_DMA2HeadShadow),
			 .cache_entry_valid(DMA2CacheEntryValid),
			 .cache_filled_size(DMA2_EntriesValid),
			 .reset_cache_pointers(ResetDMA2RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma2 ),
                         .page0_value_dma( page0_value_dma2 ),
                         .page0_reloc_dma( page0_reloc_dma2 ),
                         .page0_valid_dma( page0_valid_dma2 ),
                         .page1_mask_dma ( page1_mask_dma2 ),
                         .page1_value_dma( page1_value_dma2 ),
                         .page1_reloc_dma( page1_reloc_dma2 ),
                         .page1_valid_dma( page1_valid_dma2 ),
			 .dma_reset_scheduled ( dma2_reset_scheduled ),
			 .dma_reset_done_hold ( dma2_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma2_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma2_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma2_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma2),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma2),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma2),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA2

// DMA3
   niu_dmc_txcif TxCacheIf3 (.incr_read_ptr(IncrDMA3RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma3_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA3_CacheReadReq),
			 .read_gnt(DMA3_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma3_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma3_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma3_partial),
			 .empty(DMA3_CacheEmpty),
			 .cache_ready(dmc_txc_dma3_cacheready),
			 .inc_head_shadow(inc_DMA3HeadShadow),
			 .cache_entry_valid(DMA3CacheEntryValid),
			 .cache_filled_size(DMA3_EntriesValid),
			 .reset_cache_pointers(ResetDMA3RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma3 ),
                         .page0_value_dma( page0_value_dma3 ),
                         .page0_reloc_dma( page0_reloc_dma3 ),
                         .page0_valid_dma( page0_valid_dma3 ),
                         .page1_mask_dma ( page1_mask_dma3 ),
                         .page1_value_dma( page1_value_dma3 ),
                         .page1_reloc_dma( page1_reloc_dma3 ),
                         .page1_valid_dma( page1_valid_dma3 ),
			 .dma_reset_scheduled ( dma3_reset_scheduled ),
			 .dma_reset_done_hold ( dma3_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma3_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma3_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma3_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma3),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma3),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma3),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA3

// DMA4
   niu_dmc_txcif TxCacheIf4 (.incr_read_ptr(IncrDMA4RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma4_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA4_CacheReadReq),
			 .read_gnt(DMA4_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma4_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma4_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma4_partial),
			 .empty(DMA4_CacheEmpty),
			 .cache_ready(dmc_txc_dma4_cacheready),
			 .inc_head_shadow(inc_DMA4HeadShadow),
			 .cache_entry_valid(DMA4CacheEntryValid),
			 .cache_filled_size(DMA4_EntriesValid),
			 .reset_cache_pointers(ResetDMA4RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma4 ),
                         .page0_value_dma( page0_value_dma4 ),
                         .page0_reloc_dma( page0_reloc_dma4 ),
                         .page0_valid_dma( page0_valid_dma4 ),
                         .page1_mask_dma ( page1_mask_dma4 ),
                         .page1_value_dma( page1_value_dma4 ),
                         .page1_reloc_dma( page1_reloc_dma4 ),
                         .page1_valid_dma( page1_valid_dma4 ),
			 .dma_reset_scheduled ( dma4_reset_scheduled ),
			 .dma_reset_done_hold ( dma4_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma4_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma4_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma4_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma4),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma4),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma4),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA4

// DMA5
   niu_dmc_txcif TxCacheIf5 (.incr_read_ptr(IncrDMA5RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma5_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA5_CacheReadReq),
			 .read_gnt(DMA5_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma5_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma5_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma5_partial),
			 .empty(DMA5_CacheEmpty),
			 .cache_ready(dmc_txc_dma5_cacheready),
			 .inc_head_shadow(inc_DMA5HeadShadow),
			 .cache_entry_valid(DMA5CacheEntryValid),
			 .cache_filled_size(DMA5_EntriesValid),
			 .reset_cache_pointers(ResetDMA5RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma5 ),
                         .page0_value_dma( page0_value_dma5 ),
                         .page0_reloc_dma( page0_reloc_dma5 ),
                         .page0_valid_dma( page0_valid_dma5 ),
                         .page1_mask_dma ( page1_mask_dma5 ),
                         .page1_value_dma( page1_value_dma5 ),
                         .page1_reloc_dma( page1_reloc_dma5 ),
                         .page1_valid_dma( page1_valid_dma5 ),
			 .dma_reset_scheduled ( dma5_reset_scheduled ),
			 .dma_reset_done_hold ( dma5_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma5_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma5_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma5_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma5),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma5),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma5),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA5

// DMA6
   niu_dmc_txcif TxCacheIf6 (.incr_read_ptr(IncrDMA6RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma6_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA6_CacheReadReq),
			 .read_gnt(DMA6_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma6_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma6_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma6_partial),
			 .empty(DMA6_CacheEmpty),
			 .cache_ready(dmc_txc_dma6_cacheready),
			 .inc_head_shadow(inc_DMA6HeadShadow),
			 .cache_entry_valid(DMA6CacheEntryValid),
			 .cache_filled_size(DMA6_EntriesValid),
			 .reset_cache_pointers(ResetDMA6RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma6 ),
                         .page0_value_dma( page0_value_dma6 ),
                         .page0_reloc_dma( page0_reloc_dma6 ),
                         .page0_valid_dma( page0_valid_dma6 ),
                         .page1_mask_dma ( page1_mask_dma6 ),
                         .page1_value_dma( page1_value_dma6 ),
                         .page1_reloc_dma( page1_reloc_dma6 ),
                         .page1_valid_dma( page1_valid_dma6 ),
			 .dma_reset_scheduled ( dma6_reset_scheduled ),
			 .dma_reset_done_hold ( dma6_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma6_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma6_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma6_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma6),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma6),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma6),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA6

// DMA7
   niu_dmc_txcif TxCacheIf7 (.incr_read_ptr(IncrDMA7RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma7_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA7_CacheReadReq),
			 .read_gnt(DMA7_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma7_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma7_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma7_partial),
			 .empty(DMA7_CacheEmpty),
			 .cache_ready(dmc_txc_dma7_cacheready),
			 .inc_head_shadow(inc_DMA7HeadShadow),
			 .cache_entry_valid(DMA7CacheEntryValid),
			 .cache_filled_size(DMA7_EntriesValid),
			 .reset_cache_pointers(ResetDMA7RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma7 ),
                         .page0_value_dma( page0_value_dma7 ),
                         .page0_reloc_dma( page0_reloc_dma7 ),
                         .page0_valid_dma( page0_valid_dma7 ),
                         .page1_mask_dma ( page1_mask_dma7 ),
                         .page1_value_dma( page1_value_dma7 ),
                         .page1_reloc_dma( page1_reloc_dma7 ),
                         .page1_valid_dma( page1_valid_dma7 ),
			 .dma_reset_scheduled ( dma7_reset_scheduled ),
			 .dma_reset_done_hold ( dma7_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma7_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma7_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma7_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma7),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma7),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma7),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA7

// DMA8
   niu_dmc_txcif TxCacheIf8 (.incr_read_ptr(IncrDMA8RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma8_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA8_CacheReadReq),
			 .read_gnt(DMA8_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma8_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma8_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma8_partial),
			 .empty(DMA8_CacheEmpty),
			 .cache_ready(dmc_txc_dma8_cacheready),
			 .inc_head_shadow(inc_DMA8HeadShadow),
			 .cache_entry_valid(DMA8CacheEntryValid),
			 .cache_filled_size(DMA8_EntriesValid),
			 .reset_cache_pointers(ResetDMA8RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma8 ),
                         .page0_value_dma( page0_value_dma8 ),
                         .page0_reloc_dma( page0_reloc_dma8 ),
                         .page0_valid_dma( page0_valid_dma8 ),
                         .page1_mask_dma ( page1_mask_dma8 ),
                         .page1_value_dma( page1_value_dma8 ),
                         .page1_reloc_dma( page1_reloc_dma8 ),
                         .page1_valid_dma( page1_valid_dma8 ),
			 .dma_reset_scheduled ( dma8_reset_scheduled ),
			 .dma_reset_done_hold ( dma8_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma8_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma8_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma8_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma8),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma8),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma8),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA8

// DMA9
   niu_dmc_txcif TxCacheIf9 (.incr_read_ptr(IncrDMA9RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma9_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA9_CacheReadReq),
			 .read_gnt(DMA9_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma9_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma9_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma9_partial),
			 .empty(DMA9_CacheEmpty),
			 .cache_ready(dmc_txc_dma9_cacheready),
			 .inc_head_shadow(inc_DMA9HeadShadow),
			 .cache_entry_valid(DMA9CacheEntryValid),
			 .cache_filled_size(DMA9_EntriesValid),
			 .reset_cache_pointers(ResetDMA9RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma9 ),
                         .page0_value_dma( page0_value_dma9 ),
                         .page0_reloc_dma( page0_reloc_dma9 ),
                         .page0_valid_dma( page0_valid_dma9 ),
                         .page1_mask_dma ( page1_mask_dma9 ),
                         .page1_value_dma( page1_value_dma9 ),
                         .page1_reloc_dma( page1_reloc_dma9 ),
                         .page1_valid_dma( page1_valid_dma9 ),
			 .dma_reset_scheduled ( dma9_reset_scheduled ),
			 .dma_reset_done_hold ( dma9_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma9_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma9_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma9_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma9),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma9),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma9),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA9

// DMA10
   niu_dmc_txcif TxCacheIf10 (.incr_read_ptr(IncrDMA10RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma10_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA10_CacheReadReq),
			 .read_gnt(DMA10_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma10_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma10_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma10_partial),
			 .empty(DMA10_CacheEmpty),
			 .cache_ready(dmc_txc_dma10_cacheready),
			 .inc_head_shadow(inc_DMA10HeadShadow),
			 .cache_entry_valid(DMA10CacheEntryValid),
			 .cache_filled_size(DMA10_EntriesValid),
			 .reset_cache_pointers(ResetDMA10RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma10 ),
                         .page0_value_dma( page0_value_dma10 ),
                         .page0_reloc_dma( page0_reloc_dma10 ),
                         .page0_valid_dma( page0_valid_dma10 ),
                         .page1_mask_dma ( page1_mask_dma10 ),
                         .page1_value_dma( page1_value_dma10 ),
                         .page1_reloc_dma( page1_reloc_dma10 ),
                         .page1_valid_dma( page1_valid_dma10 ),
			 .dma_reset_scheduled ( dma10_reset_scheduled ),
			 .dma_reset_done_hold ( dma10_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma10_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma10_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma10_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma10),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma10),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma10),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA10

// DMA11
   niu_dmc_txcif TxCacheIf11 (.incr_read_ptr(IncrDMA11RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma11_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA11_CacheReadReq),
			 .read_gnt(DMA11_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma11_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma11_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma11_partial),
			 .empty(DMA11_CacheEmpty),
			 .cache_ready(dmc_txc_dma11_cacheready),
			 .inc_head_shadow(inc_DMA11HeadShadow),
			 .cache_entry_valid(DMA11CacheEntryValid),
			 .cache_filled_size(DMA11_EntriesValid),
			 .reset_cache_pointers(ResetDMA11RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma11 ),
                         .page0_value_dma( page0_value_dma11 ),
                         .page0_reloc_dma( page0_reloc_dma11 ),
                         .page0_valid_dma( page0_valid_dma11 ),
                         .page1_mask_dma ( page1_mask_dma11 ),
                         .page1_value_dma( page1_value_dma11 ),
                         .page1_reloc_dma( page1_reloc_dma11 ),
                         .page1_valid_dma( page1_valid_dma11 ),
			 .dma_reset_scheduled ( dma11_reset_scheduled ),
			 .dma_reset_done_hold ( dma11_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma11_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma11_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma11_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma11),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma11),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma11),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA11

// DMA12
   niu_dmc_txcif TxCacheIf12 (.incr_read_ptr(IncrDMA12RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma12_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA12_CacheReadReq),
			 .read_gnt(DMA12_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma12_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma12_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma12_partial),
			 .empty(DMA12_CacheEmpty),
			 .cache_ready(dmc_txc_dma12_cacheready),
			 .inc_head_shadow(inc_DMA12HeadShadow),
			 .cache_entry_valid(DMA12CacheEntryValid),
			 .cache_filled_size(DMA12_EntriesValid),
			 .reset_cache_pointers(ResetDMA12RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma12 ),
                         .page0_value_dma( page0_value_dma12 ),
                         .page0_reloc_dma( page0_reloc_dma12 ),
                         .page0_valid_dma( page0_valid_dma12 ),
                         .page1_mask_dma ( page1_mask_dma12 ),
                         .page1_value_dma( page1_value_dma12 ),
                         .page1_reloc_dma( page1_reloc_dma12 ),
                         .page1_valid_dma( page1_valid_dma12 ),
			 .dma_reset_scheduled ( dma12_reset_scheduled ),
			 .dma_reset_done_hold ( dma12_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma12_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma12_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma12_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma12),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma12),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma12),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA12

// DMA13
   niu_dmc_txcif TxCacheIf13 (.incr_read_ptr(IncrDMA13RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma13_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA13_CacheReadReq),
			 .read_gnt(DMA13_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma13_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma13_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma13_partial),
			 .empty(DMA13_CacheEmpty),
			 .cache_ready(dmc_txc_dma13_cacheready),
			 .inc_head_shadow(inc_DMA13HeadShadow),
			 .cache_entry_valid(DMA13CacheEntryValid),
			 .cache_filled_size(DMA13_EntriesValid),
			 .reset_cache_pointers(ResetDMA13RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma13 ),
                         .page0_value_dma( page0_value_dma13 ),
                         .page0_reloc_dma( page0_reloc_dma13 ),
                         .page0_valid_dma( page0_valid_dma13 ),
                         .page1_mask_dma ( page1_mask_dma13 ),
                         .page1_value_dma( page1_value_dma13 ),
                         .page1_reloc_dma( page1_reloc_dma13 ),
                         .page1_valid_dma( page1_valid_dma13 ),
			 .dma_reset_scheduled ( dma13_reset_scheduled ),
			 .dma_reset_done_hold ( dma13_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma13_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma13_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma13_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma13),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma13),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma13),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA13

// DMA14
   niu_dmc_txcif TxCacheIf14 (.incr_read_ptr(IncrDMA14RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma14_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA14_CacheReadReq),
			 .read_gnt(DMA14_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma14_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma14_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma14_partial),
			 .empty(DMA14_CacheEmpty),
			 .cache_ready(dmc_txc_dma14_cacheready),
			 .inc_head_shadow(inc_DMA14HeadShadow),
			 .cache_entry_valid(DMA14CacheEntryValid),
			 .cache_filled_size(DMA14_EntriesValid),
			 .reset_cache_pointers(ResetDMA14RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma14 ),
                         .page0_value_dma( page0_value_dma14 ),
                         .page0_reloc_dma( page0_reloc_dma14 ),
                         .page0_valid_dma( page0_valid_dma14 ),
                         .page1_mask_dma ( page1_mask_dma14 ),
                         .page1_value_dma( page1_value_dma14 ),
                         .page1_reloc_dma( page1_reloc_dma14 ),
                         .page1_valid_dma( page1_valid_dma14 ),
			 .dma_reset_scheduled ( dma14_reset_scheduled ),
			 .dma_reset_done_hold ( dma14_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma14_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma14_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma14_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma14),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma14),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma14),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA14

// DMA15
   niu_dmc_txcif TxCacheIf15 (.incr_read_ptr(IncrDMA15RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma15_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA15_CacheReadReq),
			 .read_gnt(DMA15_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma15_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma15_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma15_partial),
			 .empty(DMA15_CacheEmpty),
			 .cache_ready(dmc_txc_dma15_cacheready),
			 .inc_head_shadow(inc_DMA15HeadShadow),
			 .cache_entry_valid(DMA15CacheEntryValid),
			 .cache_filled_size(DMA15_EntriesValid),
			 .reset_cache_pointers(ResetDMA15RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma15 ),
                         .page0_value_dma( page0_value_dma15 ),
                         .page0_reloc_dma( page0_reloc_dma15 ),
                         .page0_valid_dma( page0_valid_dma15 ),
                         .page1_mask_dma ( page1_mask_dma15 ),
                         .page1_value_dma( page1_value_dma15 ),
                         .page1_reloc_dma( page1_reloc_dma15 ),
                         .page1_valid_dma( page1_valid_dma15 ),
			 .dma_reset_scheduled ( dma15_reset_scheduled ),
			 .dma_reset_done_hold ( dma15_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma15_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma15_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma15_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma15),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma15),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma15),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA15

`ifdef NEPTUNE
   
// DMA16
   niu_dmc_txcif TxCacheIf16 (.incr_read_ptr(IncrDMA16RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma16_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA16_CacheReadReq),
			 .read_gnt(DMA16_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma16_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma16_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma16_partial),
			 .empty(DMA16_CacheEmpty),
			 .cache_ready(dmc_txc_dma16_cacheready),
			 .inc_head_shadow(inc_DMA16HeadShadow),
			 .cache_entry_valid(DMA16CacheEntryValid),
			 .cache_filled_size(DMA16_EntriesValid),
			 .reset_cache_pointers(ResetDMA16RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma16 ),
                         .page0_value_dma( page0_value_dma16 ),
                         .page0_reloc_dma( page0_reloc_dma16 ),
                         .page0_valid_dma( page0_valid_dma16 ),
                         .page1_mask_dma ( page1_mask_dma16 ),
                         .page1_value_dma( page1_value_dma16 ),
                         .page1_reloc_dma( page1_reloc_dma16 ),
                         .page1_valid_dma( page1_valid_dma16 ),
			 .dma_reset_scheduled ( dma16_reset_scheduled ),
			 .dma_reset_done_hold ( dma16_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma16_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma16_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma16_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma16),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma16),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma16),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA16

// DMA17
   niu_dmc_txcif TxCacheIf17 (.incr_read_ptr(IncrDMA17RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma17_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA17_CacheReadReq),
			 .read_gnt(DMA17_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma17_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma17_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma17_partial),
			 .empty(DMA17_CacheEmpty),
			 .cache_ready(dmc_txc_dma17_cacheready),
			 .inc_head_shadow(inc_DMA17HeadShadow),
			 .cache_entry_valid(DMA17CacheEntryValid),
			 .cache_filled_size(DMA17_EntriesValid),
			 .reset_cache_pointers(ResetDMA17RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma17 ),
                         .page0_value_dma( page0_value_dma17 ),
                         .page0_reloc_dma( page0_reloc_dma17 ),
                         .page0_valid_dma( page0_valid_dma17 ),
                         .page1_mask_dma ( page1_mask_dma17 ),
                         .page1_value_dma( page1_value_dma17 ),
                         .page1_reloc_dma( page1_reloc_dma17 ),
                         .page1_valid_dma( page1_valid_dma17 ),
			 .dma_reset_scheduled ( dma17_reset_scheduled ),
			 .dma_reset_done_hold ( dma17_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma17_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma17_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma17_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma17),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma17),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma17),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA17

// DMA18
   niu_dmc_txcif TxCacheIf18 (.incr_read_ptr(IncrDMA18RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma18_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA18_CacheReadReq),
			 .read_gnt(DMA18_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma18_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma18_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma18_partial),
			 .empty(DMA18_CacheEmpty),
			 .cache_ready(dmc_txc_dma18_cacheready),
			 .inc_head_shadow(inc_DMA18HeadShadow),
			 .cache_entry_valid(DMA18CacheEntryValid),
			 .cache_filled_size(DMA18_EntriesValid),
			 .reset_cache_pointers(ResetDMA18RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma18 ),
                         .page0_value_dma( page0_value_dma18 ),
                         .page0_reloc_dma( page0_reloc_dma18 ),
                         .page0_valid_dma( page0_valid_dma18 ),
                         .page1_mask_dma ( page1_mask_dma18 ),
                         .page1_value_dma( page1_value_dma18 ),
                         .page1_reloc_dma( page1_reloc_dma18 ),
                         .page1_valid_dma( page1_valid_dma18 ),
			 .dma_reset_scheduled ( dma18_reset_scheduled ),
			 .dma_reset_done_hold ( dma18_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma18_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma18_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma18_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma18),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma18),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma18),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA18

// DMA19
   niu_dmc_txcif TxCacheIf19 (.incr_read_ptr(IncrDMA19RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma19_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA19_CacheReadReq),
			 .read_gnt(DMA19_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma19_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma19_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma19_partial),
			 .empty(DMA19_CacheEmpty),
			 .cache_ready(dmc_txc_dma19_cacheready),
			 .inc_head_shadow(inc_DMA19HeadShadow),
			 .cache_entry_valid(DMA19CacheEntryValid),
			 .cache_filled_size(DMA19_EntriesValid),
			 .reset_cache_pointers(ResetDMA19RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma19 ),
                         .page0_value_dma( page0_value_dma19 ),
                         .page0_reloc_dma( page0_reloc_dma19 ),
                         .page0_valid_dma( page0_valid_dma19 ),
                         .page1_mask_dma ( page1_mask_dma19 ),
                         .page1_value_dma( page1_value_dma19 ),
                         .page1_reloc_dma( page1_reloc_dma19 ),
                         .page1_valid_dma( page1_valid_dma19 ),
			 .dma_reset_scheduled ( dma19_reset_scheduled ),
			 .dma_reset_done_hold ( dma19_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma19_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma19_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma19_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma19),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma19),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma19),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA19

// DMA20
   niu_dmc_txcif TxCacheIf20 (.incr_read_ptr(IncrDMA20RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma20_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA20_CacheReadReq),
			 .read_gnt(DMA20_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma20_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma20_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma20_partial),
			 .empty(DMA20_CacheEmpty),
			 .cache_ready(dmc_txc_dma20_cacheready),
			 .inc_head_shadow(inc_DMA20HeadShadow),
			 .cache_entry_valid(DMA20CacheEntryValid),
			 .cache_filled_size(DMA20_EntriesValid),
			 .reset_cache_pointers(ResetDMA20RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma20 ),
                         .page0_value_dma( page0_value_dma20 ),
                         .page0_reloc_dma( page0_reloc_dma20 ),
                         .page0_valid_dma( page0_valid_dma20 ),
                         .page1_mask_dma ( page1_mask_dma20 ),
                         .page1_value_dma( page1_value_dma20 ),
                         .page1_reloc_dma( page1_reloc_dma20 ),
                         .page1_valid_dma( page1_valid_dma20 ),
			 .dma_reset_scheduled ( dma20_reset_scheduled ),
			 .dma_reset_done_hold ( dma20_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma20_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma20_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma20_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma20),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma20),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma20),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA20

// DMA21
   niu_dmc_txcif TxCacheIf21 (.incr_read_ptr(IncrDMA21RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma21_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA21_CacheReadReq),
			 .read_gnt(DMA21_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma21_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma21_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma21_partial),
			 .empty(DMA21_CacheEmpty),
			 .cache_ready(dmc_txc_dma21_cacheready),
			 .inc_head_shadow(inc_DMA21HeadShadow),
			 .cache_entry_valid(DMA21CacheEntryValid),
			 .cache_filled_size(DMA21_EntriesValid),
			 .reset_cache_pointers(ResetDMA21RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma21 ),
                         .page0_value_dma( page0_value_dma21 ),
                         .page0_reloc_dma( page0_reloc_dma21 ),
                         .page0_valid_dma( page0_valid_dma21 ),
                         .page1_mask_dma ( page1_mask_dma21 ),
                         .page1_value_dma( page1_value_dma21 ),
                         .page1_reloc_dma( page1_reloc_dma21 ),
                         .page1_valid_dma( page1_valid_dma21 ),
			 .dma_reset_scheduled ( dma21_reset_scheduled ),
			 .dma_reset_done_hold ( dma21_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma21_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma21_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma21_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma21),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma21),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma21),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA21

// DMA22
   niu_dmc_txcif TxCacheIf22 (.incr_read_ptr(IncrDMA22RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma22_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA22_CacheReadReq),
			 .read_gnt(DMA22_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma22_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma22_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma22_partial),
			 .empty(DMA22_CacheEmpty),
			 .cache_ready(dmc_txc_dma22_cacheready),
			 .inc_head_shadow(inc_DMA22HeadShadow),
			 .cache_entry_valid(DMA22CacheEntryValid),
			 .cache_filled_size(DMA22_EntriesValid),
			 .reset_cache_pointers(ResetDMA22RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma22 ),
                         .page0_value_dma( page0_value_dma22 ),
                         .page0_reloc_dma( page0_reloc_dma22 ),
                         .page0_valid_dma( page0_valid_dma22 ),
                         .page1_mask_dma ( page1_mask_dma22 ),
                         .page1_value_dma( page1_value_dma22 ),
                         .page1_reloc_dma( page1_reloc_dma22 ),
                         .page1_valid_dma( page1_valid_dma22 ),
			 .dma_reset_scheduled ( dma22_reset_scheduled ),
			 .dma_reset_done_hold ( dma22_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma22_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma22_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma22_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma22),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma22),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma22),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA22

// DMA23
   niu_dmc_txcif TxCacheIf23 (.incr_read_ptr(IncrDMA23RdPtr) ,
			 .gotnxtdesc(dmc_txc_dma23_gotnxtdesc),
			 .dma_cache_readdata(DMA_TxCacheReadData),
			 .read_req(DMA23_CacheReadReq),
			 .read_gnt(DMA23_CacheReadGnt),
			 .getnxtdesc(txc_dmc_dma23_getnxtdesc),
			 .dmc_txc_dma_descriptor(dmc_txc_dma23_descriptor),
			 .dmc_txc_dma_partial ( dmc_txc_dma23_partial),
			 .empty(DMA23_CacheEmpty),
			 .cache_ready(dmc_txc_dma23_cacheready),
			 .inc_head_shadow(inc_DMA23HeadShadow),
			 .cache_entry_valid(DMA23CacheEntryValid),
			 .cache_filled_size(DMA23_EntriesValid),
			 .reset_cache_pointers(ResetDMA23RdPtr),
			 .dma_cache_tags(DMA_TxCacheTags),
			 .cache_parity_status (ParityStatus),
                         .page0_mask_dma ( page0_mask_dma23 ),
                         .page0_value_dma( page0_value_dma23 ),
                         .page0_reloc_dma( page0_reloc_dma23 ),
                         .page0_valid_dma( page0_valid_dma23 ),
                         .page1_mask_dma ( page1_mask_dma23 ),
                         .page1_value_dma( page1_value_dma23 ),
                         .page1_reloc_dma( page1_reloc_dma23 ),
                         .page1_valid_dma( page1_valid_dma23 ),
			 .dma_reset_scheduled ( dma23_reset_scheduled ),
			 .dma_reset_done_hold ( dma23_reset_done_hold ),
			 .txc_dmc_dma_reset_done ( txc_dmc_dma23_reset_done ),
		         .tx_dma_cfg_dma_stop(tx_dma_cfg_dma23_stop),
			 .dmc_txc_dma_reset_scheduled ( dmc_txc_dma23_reset_scheduled ),
			 .set_pref_buf_par_err_dma(set_pref_buf_par_err_dma23),
		         .set_pkt_part_err_dma(set_pkt_part_err_dma23),
		         .pkt_part_error_address_dma(pkt_part_error_address_dma23),
			 .SysClk(SysClk),
			 .Reset_L(Reset_L)
			 ); // For DMA23
`endif // ifdef NEPTUNE
   
endmodule

