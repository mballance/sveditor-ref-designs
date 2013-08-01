// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_dmc_txpios.v
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
 *  NIU TDMC - PIO Interface and Control regs
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
`include "txc_defines.h"

module niu_dmc_txpios (/*AUTOJUNK*/
   // Outputs
   tdmc_pio_ack, tdmc_pio_err, tdmc_pio_rdata,
   debug_select, training_vector, page0_mask_dma0, page0_value_dma0, 
   page0_reloc_dma0, page0_valid_dma0, page1_mask_dma0, 
   page1_value_dma0, page1_reloc_dma0, page1_valid_dma0, 
   dmc_txc_dma0_page_handle, tx_rng_cfg_dma0_len, 
   tx_rng_cfg_dma0_staddr, tx_rng_tail_dma0, tx_dma_cfg_dma0_rst, 
   tx_dma_cfg_dma0_stall, tx_dma_cfg_dma0_mbaddr, 
   tx_cfg_dma0_enable_mb, tx_cfg_dma0_mk, tx_cfg_dma0_mmk, 
   tx_cs_dma0, tx_dma0_pre_st, tx_dma0_rng_err_logh, 
   tx_dma0_rng_err_logl, tx_dma_cfg_dma0_stop, dmc_txc_dma0_func_num, 
   page0_mask_dma1, page0_value_dma1, page0_reloc_dma1, 
   page0_valid_dma1, page1_mask_dma1, page1_value_dma1, 
   page1_reloc_dma1, page1_valid_dma1, dmc_txc_dma1_page_handle, 
   tx_rng_cfg_dma1_len, tx_rng_cfg_dma1_staddr, tx_rng_tail_dma1, 
   tx_dma_cfg_dma1_rst, tx_dma_cfg_dma1_stall, 
   tx_dma_cfg_dma1_mbaddr, tx_cfg_dma1_enable_mb, tx_cfg_dma1_mk, 
   tx_cfg_dma1_mmk, tx_cs_dma1, tx_dma1_pre_st, tx_dma1_rng_err_logh, 
   tx_dma1_rng_err_logl, tx_dma_cfg_dma1_stop, dmc_txc_dma1_func_num, 
   page0_mask_dma2, page0_value_dma2, page0_reloc_dma2, 
   page0_valid_dma2, page1_mask_dma2, page1_value_dma2, 
   page1_reloc_dma2, page1_valid_dma2, dmc_txc_dma2_page_handle, 
   tx_rng_cfg_dma2_len, tx_rng_cfg_dma2_staddr, tx_rng_tail_dma2, 
   tx_dma_cfg_dma2_rst, tx_dma_cfg_dma2_stall, 
   tx_dma_cfg_dma2_mbaddr, tx_cfg_dma2_enable_mb, tx_cfg_dma2_mk, 
   tx_cfg_dma2_mmk, tx_cs_dma2, tx_dma2_pre_st, tx_dma2_rng_err_logh, 
   tx_dma2_rng_err_logl, tx_dma_cfg_dma2_stop, dmc_txc_dma2_func_num, 
   page0_mask_dma3, page0_value_dma3, page0_reloc_dma3, 
   page0_valid_dma3, page1_mask_dma3, page1_value_dma3, 
   page1_reloc_dma3, page1_valid_dma3, dmc_txc_dma3_page_handle, 
   tx_rng_cfg_dma3_len, tx_rng_cfg_dma3_staddr, tx_rng_tail_dma3, 
   tx_dma_cfg_dma3_rst, tx_dma_cfg_dma3_stall, 
   tx_dma_cfg_dma3_mbaddr, tx_cfg_dma3_enable_mb, tx_cfg_dma3_mk, 
   tx_cfg_dma3_mmk, tx_cs_dma3, tx_dma3_pre_st, tx_dma3_rng_err_logh, 
   tx_dma3_rng_err_logl, tx_dma_cfg_dma3_stop, dmc_txc_dma3_func_num, 
   page0_mask_dma4, page0_value_dma4, page0_reloc_dma4, 
   page0_valid_dma4, page1_mask_dma4, page1_value_dma4, 
   page1_reloc_dma4, page1_valid_dma4, dmc_txc_dma4_page_handle, 
   tx_rng_cfg_dma4_len, tx_rng_cfg_dma4_staddr, tx_rng_tail_dma4, 
   tx_dma_cfg_dma4_rst, tx_dma_cfg_dma4_stall, 
   tx_dma_cfg_dma4_mbaddr, tx_cfg_dma4_enable_mb, tx_cfg_dma4_mk, 
   tx_cfg_dma4_mmk, tx_cs_dma4, tx_dma4_pre_st, tx_dma4_rng_err_logh, 
   tx_dma4_rng_err_logl, tx_dma_cfg_dma4_stop, dmc_txc_dma4_func_num, 
   page0_mask_dma5, page0_value_dma5, page0_reloc_dma5, 
   page0_valid_dma5, page1_mask_dma5, page1_value_dma5, 
   page1_reloc_dma5, page1_valid_dma5, dmc_txc_dma5_page_handle, 
   tx_rng_cfg_dma5_len, tx_rng_cfg_dma5_staddr, tx_rng_tail_dma5, 
   tx_dma_cfg_dma5_rst, tx_dma_cfg_dma5_stall, 
   tx_dma_cfg_dma5_mbaddr, tx_cfg_dma5_enable_mb, tx_cfg_dma5_mk, 
   tx_cfg_dma5_mmk, tx_cs_dma5, tx_dma5_pre_st, tx_dma5_rng_err_logh, 
   tx_dma5_rng_err_logl, tx_dma_cfg_dma5_stop, dmc_txc_dma5_func_num, 
   page0_mask_dma6, page0_value_dma6, page0_reloc_dma6, 
   page0_valid_dma6, page1_mask_dma6, page1_value_dma6, 
   page1_reloc_dma6, page1_valid_dma6, dmc_txc_dma6_page_handle, 
   tx_rng_cfg_dma6_len, tx_rng_cfg_dma6_staddr, tx_rng_tail_dma6, 
   tx_dma_cfg_dma6_rst, tx_dma_cfg_dma6_stall, 
   tx_dma_cfg_dma6_mbaddr, tx_cfg_dma6_enable_mb, tx_cfg_dma6_mk, 
   tx_cfg_dma6_mmk, tx_cs_dma6, tx_dma6_pre_st, tx_dma6_rng_err_logh, 
   tx_dma6_rng_err_logl, tx_dma_cfg_dma6_stop, dmc_txc_dma6_func_num, 
   page0_mask_dma7, page0_value_dma7, page0_reloc_dma7, 
   page0_valid_dma7, page1_mask_dma7, page1_value_dma7, 
   page1_reloc_dma7, page1_valid_dma7, dmc_txc_dma7_page_handle, 
   tx_rng_cfg_dma7_len, tx_rng_cfg_dma7_staddr, tx_rng_tail_dma7, 
   tx_dma_cfg_dma7_rst, tx_dma_cfg_dma7_stall, 
   tx_dma_cfg_dma7_mbaddr, tx_cfg_dma7_enable_mb, tx_cfg_dma7_mk, 
   tx_cfg_dma7_mmk, tx_cs_dma7, tx_dma7_pre_st, tx_dma7_rng_err_logh, 
   tx_dma7_rng_err_logl, tx_dma_cfg_dma7_stop, dmc_txc_dma7_func_num, 
   page0_mask_dma8, page0_value_dma8, page0_reloc_dma8, 
   page0_valid_dma8, page1_mask_dma8, page1_value_dma8, 
   page1_reloc_dma8, page1_valid_dma8, dmc_txc_dma8_page_handle, 
   tx_rng_cfg_dma8_len, tx_rng_cfg_dma8_staddr, tx_rng_tail_dma8, 
   tx_dma_cfg_dma8_rst, tx_dma_cfg_dma8_stall, 
   tx_dma_cfg_dma8_mbaddr, tx_cfg_dma8_enable_mb, tx_cfg_dma8_mk, 
   tx_cfg_dma8_mmk, tx_cs_dma8, tx_dma8_pre_st, tx_dma8_rng_err_logh, 
   tx_dma8_rng_err_logl, tx_dma_cfg_dma8_stop, dmc_txc_dma8_func_num, 
   page0_mask_dma9, page0_value_dma9, page0_reloc_dma9, 
   page0_valid_dma9, page1_mask_dma9, page1_value_dma9, 
   page1_reloc_dma9, page1_valid_dma9, dmc_txc_dma9_page_handle, 
   tx_rng_cfg_dma9_len, tx_rng_cfg_dma9_staddr, tx_rng_tail_dma9, 
   tx_dma_cfg_dma9_rst, tx_dma_cfg_dma9_stall, 
   tx_dma_cfg_dma9_mbaddr, tx_cfg_dma9_enable_mb, tx_cfg_dma9_mk, 
   tx_cfg_dma9_mmk, tx_cs_dma9, tx_dma9_pre_st, tx_dma9_rng_err_logh, 
   tx_dma9_rng_err_logl, tx_dma_cfg_dma9_stop, dmc_txc_dma9_func_num, 
   page0_mask_dma10, page0_value_dma10, page0_reloc_dma10, 
   page0_valid_dma10, page1_mask_dma10, page1_value_dma10, 
   page1_reloc_dma10, page1_valid_dma10, dmc_txc_dma10_page_handle, 
   tx_rng_cfg_dma10_len, tx_rng_cfg_dma10_staddr, tx_rng_tail_dma10, 
   tx_dma_cfg_dma10_rst, tx_dma_cfg_dma10_stall, 
   tx_dma_cfg_dma10_mbaddr, tx_cfg_dma10_enable_mb, tx_cfg_dma10_mk, 
   tx_cfg_dma10_mmk, tx_cs_dma10, tx_dma10_pre_st, 
   tx_dma10_rng_err_logh, tx_dma10_rng_err_logl, 
   tx_dma_cfg_dma10_stop, dmc_txc_dma10_func_num, page0_mask_dma11, 
   page0_value_dma11, page0_reloc_dma11, page0_valid_dma11, 
   page1_mask_dma11, page1_value_dma11, page1_reloc_dma11, 
   page1_valid_dma11, dmc_txc_dma11_page_handle, 
   tx_rng_cfg_dma11_len, tx_rng_cfg_dma11_staddr, tx_rng_tail_dma11, 
   tx_dma_cfg_dma11_rst, tx_dma_cfg_dma11_stall, 
   tx_dma_cfg_dma11_mbaddr, tx_cfg_dma11_enable_mb, tx_cfg_dma11_mk, 
   tx_cfg_dma11_mmk, tx_cs_dma11, tx_dma11_pre_st, 
   tx_dma11_rng_err_logh, tx_dma11_rng_err_logl, 
   tx_dma_cfg_dma11_stop, dmc_txc_dma11_func_num, page0_mask_dma12, 
   page0_value_dma12, page0_reloc_dma12, page0_valid_dma12, 
   page1_mask_dma12, page1_value_dma12, page1_reloc_dma12, 
   page1_valid_dma12, dmc_txc_dma12_page_handle, 
   tx_rng_cfg_dma12_len, tx_rng_cfg_dma12_staddr, tx_rng_tail_dma12, 
   tx_dma_cfg_dma12_rst, tx_dma_cfg_dma12_stall, 
   tx_dma_cfg_dma12_mbaddr, tx_cfg_dma12_enable_mb, tx_cfg_dma12_mk, 
   tx_cfg_dma12_mmk, tx_cs_dma12, tx_dma12_pre_st, 
   tx_dma12_rng_err_logh, tx_dma12_rng_err_logl, 
   tx_dma_cfg_dma12_stop, dmc_txc_dma12_func_num, page0_mask_dma13, 
   page0_value_dma13, page0_reloc_dma13, page0_valid_dma13, 
   page1_mask_dma13, page1_value_dma13, page1_reloc_dma13, 
   page1_valid_dma13, dmc_txc_dma13_page_handle, 
   tx_rng_cfg_dma13_len, tx_rng_cfg_dma13_staddr, tx_rng_tail_dma13, 
   tx_dma_cfg_dma13_rst, tx_dma_cfg_dma13_stall, 
   tx_dma_cfg_dma13_mbaddr, tx_cfg_dma13_enable_mb, tx_cfg_dma13_mk, 
   tx_cfg_dma13_mmk, tx_cs_dma13, tx_dma13_pre_st, 
   tx_dma13_rng_err_logh, tx_dma13_rng_err_logl, 
   tx_dma_cfg_dma13_stop, dmc_txc_dma13_func_num, page0_mask_dma14, 
   page0_value_dma14, page0_reloc_dma14, page0_valid_dma14, 
   page1_mask_dma14, page1_value_dma14, page1_reloc_dma14, 
   page1_valid_dma14, dmc_txc_dma14_page_handle, 
   tx_rng_cfg_dma14_len, tx_rng_cfg_dma14_staddr, tx_rng_tail_dma14, 
   tx_dma_cfg_dma14_rst, tx_dma_cfg_dma14_stall, 
   tx_dma_cfg_dma14_mbaddr, tx_cfg_dma14_enable_mb, tx_cfg_dma14_mk, 
   tx_cfg_dma14_mmk, tx_cs_dma14, tx_dma14_pre_st, 
   tx_dma14_rng_err_logh, tx_dma14_rng_err_logl, 
   tx_dma_cfg_dma14_stop, dmc_txc_dma14_func_num, page0_mask_dma15, 
   page0_value_dma15, page0_reloc_dma15, page0_valid_dma15, 
   page1_mask_dma15, page1_value_dma15, page1_reloc_dma15, 
   page1_valid_dma15, dmc_txc_dma15_page_handle, 
   tx_rng_cfg_dma15_len, tx_rng_cfg_dma15_staddr, tx_rng_tail_dma15, 
   tx_dma_cfg_dma15_rst, tx_dma_cfg_dma15_stall, 
   tx_dma_cfg_dma15_mbaddr, tx_cfg_dma15_enable_mb, tx_cfg_dma15_mk, 
   tx_cfg_dma15_mmk, tx_cs_dma15, tx_dma15_pre_st, 
   tx_dma15_rng_err_logh, tx_dma15_rng_err_logl, 
   tx_dma_cfg_dma15_stop, dmc_txc_dma15_func_num, 
   dmc_txc_dma0_error, dmc_txc_dma1_error, dmc_txc_dma2_error,
   dmc_txc_dma3_error, dmc_txc_dma4_error, dmc_txc_dma5_error,
   dmc_txc_dma6_error, dmc_txc_dma7_error, dmc_txc_dma8_error,
   dmc_txc_dma9_error, dmc_txc_dma10_error, dmc_txc_dma11_error,
   dmc_txc_dma12_error, dmc_txc_dma13_error, dmc_txc_dma14_error,
   dmc_txc_dma15_error,
 
`ifdef NEPTUNE
		       
   page0_mask_dma16, 
   page0_value_dma16, page0_reloc_dma16, page0_valid_dma16, 
   page1_mask_dma16, page1_value_dma16, page1_reloc_dma16, 
   page1_valid_dma16, dmc_txc_dma16_page_handle, 
   tx_rng_cfg_dma16_len, tx_rng_cfg_dma16_staddr, tx_rng_tail_dma16, 
   tx_dma_cfg_dma16_rst, tx_dma_cfg_dma16_stall, 
   tx_dma_cfg_dma16_mbaddr, tx_cfg_dma16_enable_mb, tx_cfg_dma16_mk, 
   tx_cfg_dma16_mmk, tx_cs_dma16, tx_dma16_pre_st, 
   tx_dma16_rng_err_logh, tx_dma16_rng_err_logl, 
   tx_dma_cfg_dma16_stop, dmc_txc_dma16_func_num, page0_mask_dma17, 
   page0_value_dma17, page0_reloc_dma17, page0_valid_dma17, 
   page1_mask_dma17, page1_value_dma17, page1_reloc_dma17, 
   page1_valid_dma17, dmc_txc_dma17_page_handle, 
   tx_rng_cfg_dma17_len, tx_rng_cfg_dma17_staddr, tx_rng_tail_dma17, 
   tx_dma_cfg_dma17_rst, tx_dma_cfg_dma17_stall, 
   tx_dma_cfg_dma17_mbaddr, tx_cfg_dma17_enable_mb, tx_cfg_dma17_mk, 
   tx_cfg_dma17_mmk, tx_cs_dma17, tx_dma17_pre_st, 
   tx_dma17_rng_err_logh, tx_dma17_rng_err_logl, 
   tx_dma_cfg_dma17_stop, dmc_txc_dma17_func_num, page0_mask_dma18, 
   page0_value_dma18, page0_reloc_dma18, page0_valid_dma18, 
   page1_mask_dma18, page1_value_dma18, page1_reloc_dma18, 
   page1_valid_dma18, dmc_txc_dma18_page_handle, 
   tx_rng_cfg_dma18_len, tx_rng_cfg_dma18_staddr, tx_rng_tail_dma18, 
   tx_dma_cfg_dma18_rst, tx_dma_cfg_dma18_stall, 
   tx_dma_cfg_dma18_mbaddr, tx_cfg_dma18_enable_mb, tx_cfg_dma18_mk, 
   tx_cfg_dma18_mmk, tx_cs_dma18, tx_dma18_pre_st, 
   tx_dma18_rng_err_logh, tx_dma18_rng_err_logl, 
   tx_dma_cfg_dma18_stop, dmc_txc_dma18_func_num, page0_mask_dma19, 
   page0_value_dma19, page0_reloc_dma19, page0_valid_dma19, 
   page1_mask_dma19, page1_value_dma19, page1_reloc_dma19, 
   page1_valid_dma19, dmc_txc_dma19_page_handle, 
   tx_rng_cfg_dma19_len, tx_rng_cfg_dma19_staddr, tx_rng_tail_dma19, 
   tx_dma_cfg_dma19_rst, tx_dma_cfg_dma19_stall, 
   tx_dma_cfg_dma19_mbaddr, tx_cfg_dma19_enable_mb, tx_cfg_dma19_mk, 
   tx_cfg_dma19_mmk, tx_cs_dma19, tx_dma19_pre_st, 
   tx_dma19_rng_err_logh, tx_dma19_rng_err_logl, 
   tx_dma_cfg_dma19_stop, dmc_txc_dma19_func_num, page0_mask_dma20, 
   page0_value_dma20, page0_reloc_dma20, page0_valid_dma20, 
   page1_mask_dma20, page1_value_dma20, page1_reloc_dma20, 
   page1_valid_dma20, dmc_txc_dma20_page_handle, 
   tx_rng_cfg_dma20_len, tx_rng_cfg_dma20_staddr, tx_rng_tail_dma20, 
   tx_dma_cfg_dma20_rst, tx_dma_cfg_dma20_stall, 
   tx_dma_cfg_dma20_mbaddr, tx_cfg_dma20_enable_mb, tx_cfg_dma20_mk, 
   tx_cfg_dma20_mmk, tx_cs_dma20, tx_dma20_pre_st, 
   tx_dma20_rng_err_logh, tx_dma20_rng_err_logl, 
   tx_dma_cfg_dma20_stop, dmc_txc_dma20_func_num, page0_mask_dma21, 
   page0_value_dma21, page0_reloc_dma21, page0_valid_dma21, 
   page1_mask_dma21, page1_value_dma21, page1_reloc_dma21, 
   page1_valid_dma21, dmc_txc_dma21_page_handle, 
   tx_rng_cfg_dma21_len, tx_rng_cfg_dma21_staddr, tx_rng_tail_dma21, 
   tx_dma_cfg_dma21_rst, tx_dma_cfg_dma21_stall, 
   tx_dma_cfg_dma21_mbaddr, tx_cfg_dma21_enable_mb, tx_cfg_dma21_mk, 
   tx_cfg_dma21_mmk, tx_cs_dma21, tx_dma21_pre_st, 
   tx_dma21_rng_err_logh, tx_dma21_rng_err_logl, 
   tx_dma_cfg_dma21_stop, dmc_txc_dma21_func_num, page0_mask_dma22, 
   page0_value_dma22, page0_reloc_dma22, page0_valid_dma22, 
   page1_mask_dma22, page1_value_dma22, page1_reloc_dma22, 
   page1_valid_dma22, dmc_txc_dma22_page_handle, 
   tx_rng_cfg_dma22_len, tx_rng_cfg_dma22_staddr, tx_rng_tail_dma22, 
   tx_dma_cfg_dma22_rst, tx_dma_cfg_dma22_stall, 
   tx_dma_cfg_dma22_mbaddr, tx_cfg_dma22_enable_mb, tx_cfg_dma22_mk, 
   tx_cfg_dma22_mmk, tx_cs_dma22, tx_dma22_pre_st, 
   tx_dma22_rng_err_logh, tx_dma22_rng_err_logl, 
   tx_dma_cfg_dma22_stop, dmc_txc_dma22_func_num, page0_mask_dma23, 
   page0_value_dma23, page0_reloc_dma23, page0_valid_dma23, 
   page1_mask_dma23, page1_value_dma23, page1_reloc_dma23, 
   page1_valid_dma23, dmc_txc_dma23_page_handle, 
   tx_rng_cfg_dma23_len, tx_rng_cfg_dma23_staddr, tx_rng_tail_dma23, 
   tx_dma_cfg_dma23_rst, tx_dma_cfg_dma23_stall, 
   tx_dma_cfg_dma23_mbaddr, tx_cfg_dma23_enable_mb, tx_cfg_dma23_mk, 
   tx_cfg_dma23_mmk, tx_cs_dma23, tx_dma23_pre_st, 
   tx_dma23_rng_err_logh, tx_dma23_rng_err_logl, 
   tx_dma_cfg_dma23_stop, dmc_txc_dma23_func_num, 
   dmc_txc_dma16_error, dmc_txc_dma17_error, dmc_txc_dma18_error,
   dmc_txc_dma19_error, dmc_txc_dma20_error, dmc_txc_dma21_error,
   dmc_txc_dma22_error, dmc_txc_dma23_error,

`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
		       
		       
   // Inputs
   SysClk, Reset_L,pio_clients_rd, pio_tdmc_sel, pio_clients_addr, pio_clients_wdata ,
   pio_clients_32b, tx_rng_head_dma0, dma0_clear_reset, 
   set_cfg_dma0_mmk, clear_cfg_dma0_mb, set_pref_buf_par_err_dma0, 
   set_pkt_part_err_dma0, pkt_part_error_address_dma0, 
   set_conf_part_error_dma0, tx_dma_cfg_dma0_stop_state, 
   set_cfg_dma0_mk, ShadowRingCurrentPtr_DMA0, tx_rng_head_dma1, 
   dma1_clear_reset, set_cfg_dma1_mmk, clear_cfg_dma1_mb, set_pref_buf_par_err_dma1, 
   set_pkt_part_err_dma1, pkt_part_error_address_dma1, 
   set_conf_part_error_dma1, tx_dma_cfg_dma1_stop_state, 
   set_cfg_dma1_mk, ShadowRingCurrentPtr_DMA1, tx_rng_head_dma2, 
   dma2_clear_reset, set_cfg_dma2_mmk, clear_cfg_dma2_mb, set_pref_buf_par_err_dma2, 
   set_pkt_part_err_dma2, pkt_part_error_address_dma2, 
   set_conf_part_error_dma2, tx_dma_cfg_dma2_stop_state, 
   set_cfg_dma2_mk, ShadowRingCurrentPtr_DMA2, tx_rng_head_dma3, 
   dma3_clear_reset, set_cfg_dma3_mmk, clear_cfg_dma3_mb, set_pref_buf_par_err_dma3, 
   set_pkt_part_err_dma3, pkt_part_error_address_dma3, 
   set_conf_part_error_dma3, tx_dma_cfg_dma3_stop_state, 
   set_cfg_dma3_mk, ShadowRingCurrentPtr_DMA3, tx_rng_head_dma4, 
   dma4_clear_reset, set_cfg_dma4_mmk, clear_cfg_dma4_mb, set_pref_buf_par_err_dma4, 
   set_pkt_part_err_dma4, pkt_part_error_address_dma4, 
   set_conf_part_error_dma4, tx_dma_cfg_dma4_stop_state, 
   set_cfg_dma4_mk, ShadowRingCurrentPtr_DMA4, tx_rng_head_dma5, 
   dma5_clear_reset, set_cfg_dma5_mmk, clear_cfg_dma5_mb, set_pref_buf_par_err_dma5, 
   set_pkt_part_err_dma5, pkt_part_error_address_dma5, 
   set_conf_part_error_dma5, tx_dma_cfg_dma5_stop_state, 
   set_cfg_dma5_mk, ShadowRingCurrentPtr_DMA5, tx_rng_head_dma6, 
   dma6_clear_reset, set_cfg_dma6_mmk, clear_cfg_dma6_mb, set_pref_buf_par_err_dma6, 
   set_pkt_part_err_dma6, pkt_part_error_address_dma6, 
   set_conf_part_error_dma6, tx_dma_cfg_dma6_stop_state, 
   set_cfg_dma6_mk, ShadowRingCurrentPtr_DMA6, tx_rng_head_dma7, 
   dma7_clear_reset, set_cfg_dma7_mmk, clear_cfg_dma7_mb, set_pref_buf_par_err_dma7, 
   set_pkt_part_err_dma7, pkt_part_error_address_dma7, 
   set_conf_part_error_dma7, tx_dma_cfg_dma7_stop_state, 
   set_cfg_dma7_mk, ShadowRingCurrentPtr_DMA7, tx_rng_head_dma8, 
   dma8_clear_reset, set_cfg_dma8_mmk, clear_cfg_dma8_mb, set_pref_buf_par_err_dma8, 
   set_pkt_part_err_dma8, pkt_part_error_address_dma8, 
   set_conf_part_error_dma8, tx_dma_cfg_dma8_stop_state, 
   set_cfg_dma8_mk, ShadowRingCurrentPtr_DMA8, tx_rng_head_dma9, 
   dma9_clear_reset, set_cfg_dma9_mmk, clear_cfg_dma9_mb, set_pref_buf_par_err_dma9, 
   set_pkt_part_err_dma9, pkt_part_error_address_dma9, 
   set_conf_part_error_dma9, tx_dma_cfg_dma9_stop_state, 
   set_cfg_dma9_mk, ShadowRingCurrentPtr_DMA9, tx_rng_head_dma10, 
   dma10_clear_reset, set_cfg_dma10_mmk, clear_cfg_dma10_mb, set_pref_buf_par_err_dma10, 
   set_pkt_part_err_dma10, pkt_part_error_address_dma10, 
   set_conf_part_error_dma10, tx_dma_cfg_dma10_stop_state, 
   set_cfg_dma10_mk, ShadowRingCurrentPtr_DMA10, tx_rng_head_dma11, 
   dma11_clear_reset, set_cfg_dma11_mmk, clear_cfg_dma11_mb, set_pref_buf_par_err_dma11, 
   set_pkt_part_err_dma11, pkt_part_error_address_dma11, 
   set_conf_part_error_dma11, tx_dma_cfg_dma11_stop_state, 
   set_cfg_dma11_mk, ShadowRingCurrentPtr_DMA11, tx_rng_head_dma12, 
   dma12_clear_reset, set_cfg_dma12_mmk, clear_cfg_dma12_mb, set_pref_buf_par_err_dma12, 
   set_pkt_part_err_dma12, pkt_part_error_address_dma12, 
   set_conf_part_error_dma12, tx_dma_cfg_dma12_stop_state, 
   set_cfg_dma12_mk, ShadowRingCurrentPtr_DMA12, tx_rng_head_dma13, 
   dma13_clear_reset, set_cfg_dma13_mmk, clear_cfg_dma13_mb, set_pref_buf_par_err_dma13, 
   set_pkt_part_err_dma13, pkt_part_error_address_dma13, 
   set_conf_part_error_dma13, tx_dma_cfg_dma13_stop_state, 
   set_cfg_dma13_mk, ShadowRingCurrentPtr_DMA13, tx_rng_head_dma14, 
   dma14_clear_reset, set_cfg_dma14_mmk, clear_cfg_dma14_mb, set_pref_buf_par_err_dma14, 
   set_pkt_part_err_dma14, pkt_part_error_address_dma14, 
   set_conf_part_error_dma14, tx_dma_cfg_dma14_stop_state, 
   set_cfg_dma14_mk, ShadowRingCurrentPtr_DMA14, tx_rng_head_dma15, 
   dma15_clear_reset, set_cfg_dma15_mmk, clear_cfg_dma15_mb, set_pref_buf_par_err_dma15, 
   set_pkt_part_err_dma15, pkt_part_error_address_dma15, 
   set_conf_part_error_dma15, tx_dma_cfg_dma15_stop_state, 
   set_cfg_dma15_mk, ShadowRingCurrentPtr_DMA15, 
   set_tx_ring_oflow_dma0, set_tx_ring_oflow_dma1, set_tx_ring_oflow_dma2,
   set_tx_ring_oflow_dma3, set_tx_ring_oflow_dma4, set_tx_ring_oflow_dma5,
   set_tx_ring_oflow_dma6, set_tx_ring_oflow_dma7, set_tx_ring_oflow_dma8,
   set_tx_ring_oflow_dma9, set_tx_ring_oflow_dma10, set_tx_ring_oflow_dma11,
   set_tx_ring_oflow_dma12, set_tx_ring_oflow_dma13, set_tx_ring_oflow_dma14,
   set_tx_ring_oflow_dma15,
   txc_dmc_dma0_mark_bit,txc_dmc_dma0_inc_pkt_cnt,
   txc_dmc_dma1_mark_bit,txc_dmc_dma1_inc_pkt_cnt,
   txc_dmc_dma2_mark_bit,txc_dmc_dma2_inc_pkt_cnt,
   txc_dmc_dma3_mark_bit,txc_dmc_dma3_inc_pkt_cnt,
   txc_dmc_dma4_mark_bit,txc_dmc_dma4_inc_pkt_cnt,
   txc_dmc_dma5_mark_bit,txc_dmc_dma5_inc_pkt_cnt,
   txc_dmc_dma6_mark_bit,txc_dmc_dma6_inc_pkt_cnt,
   txc_dmc_dma7_mark_bit,txc_dmc_dma7_inc_pkt_cnt,
   txc_dmc_dma8_mark_bit,txc_dmc_dma8_inc_pkt_cnt,
   txc_dmc_dma9_mark_bit,txc_dmc_dma9_inc_pkt_cnt,
   txc_dmc_dma10_mark_bit,txc_dmc_dma10_inc_pkt_cnt,
   txc_dmc_dma11_mark_bit,txc_dmc_dma11_inc_pkt_cnt,
   txc_dmc_dma12_mark_bit,txc_dmc_dma12_inc_pkt_cnt,
   txc_dmc_dma13_mark_bit,txc_dmc_dma13_inc_pkt_cnt,
   txc_dmc_dma14_mark_bit,txc_dmc_dma14_inc_pkt_cnt,
   txc_dmc_dma15_mark_bit,txc_dmc_dma15_inc_pkt_cnt,

`ifdef NEPTUNE
		       
   tx_rng_head_dma16, 
   dma16_clear_reset, set_cfg_dma16_mmk, clear_cfg_dma16_mb, set_pref_buf_par_err_dma16, 
   set_pkt_part_err_dma16, pkt_part_error_address_dma16, 
   set_conf_part_error_dma16, tx_dma_cfg_dma16_stop_state, 
   set_cfg_dma16_mk, ShadowRingCurrentPtr_DMA16, tx_rng_head_dma17, 
   dma17_clear_reset, set_cfg_dma17_mmk, clear_cfg_dma17_mb, set_pref_buf_par_err_dma17, 
   set_pkt_part_err_dma17, pkt_part_error_address_dma17, 
   set_conf_part_error_dma17, tx_dma_cfg_dma17_stop_state, 
   set_cfg_dma17_mk, ShadowRingCurrentPtr_DMA17, tx_rng_head_dma18, 
   dma18_clear_reset, set_cfg_dma18_mmk, clear_cfg_dma18_mb, set_pref_buf_par_err_dma18, 
   set_pkt_part_err_dma18, pkt_part_error_address_dma18, 
   set_conf_part_error_dma18, tx_dma_cfg_dma18_stop_state, 
   set_cfg_dma18_mk, ShadowRingCurrentPtr_DMA18, tx_rng_head_dma19, 
   dma19_clear_reset, set_cfg_dma19_mmk, clear_cfg_dma19_mb, set_pref_buf_par_err_dma19, 
   set_pkt_part_err_dma19, pkt_part_error_address_dma19, 
   set_conf_part_error_dma19, tx_dma_cfg_dma19_stop_state, 
   set_cfg_dma19_mk, ShadowRingCurrentPtr_DMA19, tx_rng_head_dma20, 
   dma20_clear_reset, set_cfg_dma20_mmk, clear_cfg_dma20_mb, set_pref_buf_par_err_dma20, 
   set_pkt_part_err_dma20, pkt_part_error_address_dma20, 
   set_conf_part_error_dma20, tx_dma_cfg_dma20_stop_state, 
   set_cfg_dma20_mk, ShadowRingCurrentPtr_DMA20, tx_rng_head_dma21, 
   dma21_clear_reset, set_cfg_dma21_mmk, clear_cfg_dma21_mb, set_pref_buf_par_err_dma21, 
   set_pkt_part_err_dma21, pkt_part_error_address_dma21, 
   set_conf_part_error_dma21, tx_dma_cfg_dma21_stop_state, 
   set_cfg_dma21_mk, ShadowRingCurrentPtr_DMA21, tx_rng_head_dma22, 
   dma22_clear_reset, set_cfg_dma22_mmk, clear_cfg_dma22_mb, set_pref_buf_par_err_dma22, 
   set_pkt_part_err_dma22, pkt_part_error_address_dma22, 
   set_conf_part_error_dma22, tx_dma_cfg_dma22_stop_state, 
   set_cfg_dma22_mk, ShadowRingCurrentPtr_DMA22, tx_rng_head_dma23, 
   dma23_clear_reset, set_cfg_dma23_mmk, clear_cfg_dma23_mb, set_pref_buf_par_err_dma23, 
   set_pkt_part_err_dma23, pkt_part_error_address_dma23, 
   set_conf_part_error_dma23, tx_dma_cfg_dma23_stop_state, 
   set_cfg_dma23_mk, ShadowRingCurrentPtr_DMA23, 
   set_tx_ring_oflow_dma16, set_tx_ring_oflow_dma17, set_tx_ring_oflow_dma18,
   set_tx_ring_oflow_dma19, set_tx_ring_oflow_dma20, set_tx_ring_oflow_dma21,
   set_tx_ring_oflow_dma22, set_tx_ring_oflow_dma23,
   txc_dmc_dma16_mark_bit,txc_dmc_dma16_inc_pkt_cnt,
   txc_dmc_dma17_mark_bit,txc_dmc_dma17_inc_pkt_cnt,
   txc_dmc_dma18_mark_bit,txc_dmc_dma18_inc_pkt_cnt,
   txc_dmc_dma19_mark_bit,txc_dmc_dma19_inc_pkt_cnt,
   txc_dmc_dma20_mark_bit,txc_dmc_dma20_inc_pkt_cnt,
   txc_dmc_dma21_mark_bit,txc_dmc_dma21_inc_pkt_cnt,
   txc_dmc_dma22_mark_bit,txc_dmc_dma22_inc_pkt_cnt,
   txc_dmc_dma23_mark_bit,txc_dmc_dma23_inc_pkt_cnt,

`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
   set_mbox_part_error_dma, 

   txc_dmc_p0_dma_pkt_size_err, 
   txc_dmc_dma_nack_pkt_rd, 
   txc_dmc_nack_pkt_rd_addr, 
   txc_dmc_p0_pkt_size_err_addr, 
   txc_dmc_p0_pkt_size_err, 
   txc_dmc_nack_pkt_rd, 

   txc_dmc_p1_dma_pkt_size_err, 
   txc_dmc_p1_pkt_size_err_addr, 
   txc_dmc_p1_pkt_size_err, 

   txc_dmc_p2_dma_pkt_size_err, 
   txc_dmc_p2_pkt_size_err_addr, 
   txc_dmc_p2_pkt_size_err, 

   txc_dmc_p3_dma_pkt_size_err, 
   txc_dmc_p3_pkt_size_err_addr, 
   txc_dmc_p3_pkt_size_err, 

   txpref_dma_nack_resp, txpref_nack_resp, 
   txpref_nack_rd_addr, mbox_ack_dma_err_received, mbox_err_received,
   tdmc_pio_intr ,parity_corrupt_config,
   dmc_txc_tx_addr_md

   );
   
   // Include Header Files

   // Global Signals
   input          SysClk;
   input 	  Reset_L;

   output [5:0]   debug_select;
   output [31:0]   training_vector;
   // Slave Interface
  
   input 	  pio_clients_32b;
   output 	  tdmc_pio_ack;                        // pio read data ack
   output 	  tdmc_pio_err;                        // pio read data error
   output [63:0]  tdmc_pio_rdata;                      // pio read data
   // PIO I/F Inputs
   input 	  pio_clients_rd;                     // pio read
   input 	  pio_tdmc_sel;                        // pio DMC select
   input [19:0]   pio_clients_addr;                   // pio address
   input [63:0]   pio_clients_wdata;                  // pio write data
   
   
  // DMA0 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma0 ;
   input 	  dma0_clear_reset;
   input 	  set_cfg_dma0_mmk;  // from mailbox
   input 	  clear_cfg_dma0_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma0;
   output [31:0]  page0_value_dma0;
   output [31:0]  page0_reloc_dma0;
   output 	  page0_valid_dma0;
   output [31:0]  page1_mask_dma0;
   output [31:0]  page1_value_dma0;
   output [31:0]  page1_reloc_dma0;
   output 	  page1_valid_dma0;
   output [19:0]  dmc_txc_dma0_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma0_len;
   output [37:0]  tx_rng_cfg_dma0_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma0 ;
   output 	  tx_dma_cfg_dma0_rst;
   output 	  tx_dma_cfg_dma0_stall;
   output [37:0]  tx_dma_cfg_dma0_mbaddr ;   
   output 	  tx_cfg_dma0_enable_mb; // to mailbox
   output 	  tx_cfg_dma0_mk; // to mailbox
   output 	  tx_cfg_dma0_mmk; // to mailbox
   output [63:0]  tx_cs_dma0; // to mailbox
   output [63:0]  tx_dma0_pre_st; // to mailbox
   output [63:0]  tx_dma0_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma0_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma0;
   input 	  set_pkt_part_err_dma0;
   input [43:0]   pkt_part_error_address_dma0;
   input 	  set_conf_part_error_dma0;
   input 	  set_tx_ring_oflow_dma0;
   


   input  tx_dma_cfg_dma0_stop_state;
   output  tx_dma_cfg_dma0_stop;
   output [1:0]  dmc_txc_dma0_func_num;
   input     set_cfg_dma0_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA0;



  // DMA1 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma1 ;
   input 	  dma1_clear_reset;
   input 	  set_cfg_dma1_mmk;  // from mailbox
   input 	  clear_cfg_dma1_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma1;
   output [31:0]  page0_value_dma1;
   output [31:0]  page0_reloc_dma1;
   output 	  page0_valid_dma1;
   output [31:0]  page1_mask_dma1;
   output [31:0]  page1_value_dma1;
   output [31:0]  page1_reloc_dma1;
   output 	  page1_valid_dma1;
   output [19:0]  dmc_txc_dma1_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma1_len;
   output [37:0]  tx_rng_cfg_dma1_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma1 ;
   output 	  tx_dma_cfg_dma1_rst;
   output 	  tx_dma_cfg_dma1_stall;
   output [37:0]  tx_dma_cfg_dma1_mbaddr ;   
   output 	  tx_cfg_dma1_enable_mb; // to mailbox
   output 	  tx_cfg_dma1_mk; // to mailbox
   output 	  tx_cfg_dma1_mmk; // to mailbox
   output [63:0]  tx_cs_dma1; // to mailbox
   output [63:0]  tx_dma1_pre_st; // to mailbox
   output [63:0]  tx_dma1_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma1_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma1;
   input 	  set_pkt_part_err_dma1;
   input [43:0]   pkt_part_error_address_dma1;
   input 	  set_conf_part_error_dma1;
   input 	  set_tx_ring_oflow_dma1;


   input  tx_dma_cfg_dma1_stop_state;
   output  tx_dma_cfg_dma1_stop;
   output [1:0]  dmc_txc_dma1_func_num;
   input     set_cfg_dma1_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA1;



  // DMA2 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma2 ;
   input 	  dma2_clear_reset;
   input 	  set_cfg_dma2_mmk;  // from mailbox
   input 	  clear_cfg_dma2_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma2;
   output [31:0]  page0_value_dma2;
   output [31:0]  page0_reloc_dma2;
   output 	  page0_valid_dma2;
   output [31:0]  page1_mask_dma2;
   output [31:0]  page1_value_dma2;
   output [31:0]  page1_reloc_dma2;
   output 	  page1_valid_dma2;
   output [19:0]  dmc_txc_dma2_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma2_len;
   output [37:0]  tx_rng_cfg_dma2_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma2 ;
   output 	  tx_dma_cfg_dma2_rst;
   output 	  tx_dma_cfg_dma2_stall;
   output [37:0]  tx_dma_cfg_dma2_mbaddr ;   
   output 	  tx_cfg_dma2_enable_mb; // to mailbox
   output 	  tx_cfg_dma2_mk; // to mailbox
   output 	  tx_cfg_dma2_mmk; // to mailbox
   output [63:0]  tx_cs_dma2; // to mailbox
   output [63:0]  tx_dma2_pre_st; // to mailbox
   output [63:0]  tx_dma2_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma2_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma2;
   input 	  set_pkt_part_err_dma2;
   input [43:0]   pkt_part_error_address_dma2;
   input 	  set_conf_part_error_dma2;
   input 	  set_tx_ring_oflow_dma2;


   input  tx_dma_cfg_dma2_stop_state;
   output  tx_dma_cfg_dma2_stop;
   output [1:0]  dmc_txc_dma2_func_num;
   input     set_cfg_dma2_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA2;



  // DMA3 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma3 ;
   input 	  dma3_clear_reset;
   input 	  set_cfg_dma3_mmk;  // from mailbox
   input 	  clear_cfg_dma3_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma3;
   output [31:0]  page0_value_dma3;
   output [31:0]  page0_reloc_dma3;
   output 	  page0_valid_dma3;
   output [31:0]  page1_mask_dma3;
   output [31:0]  page1_value_dma3;
   output [31:0]  page1_reloc_dma3;
   output 	  page1_valid_dma3;
   output [19:0]  dmc_txc_dma3_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma3_len;
   output [37:0]  tx_rng_cfg_dma3_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma3 ;
   output 	  tx_dma_cfg_dma3_rst;
   output 	  tx_dma_cfg_dma3_stall;
   output [37:0]  tx_dma_cfg_dma3_mbaddr ;   
   output 	  tx_cfg_dma3_enable_mb; // to mailbox
   output 	  tx_cfg_dma3_mk; // to mailbox
   output 	  tx_cfg_dma3_mmk; // to mailbox
   output [63:0]  tx_cs_dma3; // to mailbox
   output [63:0]  tx_dma3_pre_st; // to mailbox
   output [63:0]  tx_dma3_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma3_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma3;
   input 	  set_pkt_part_err_dma3;
   input [43:0]   pkt_part_error_address_dma3;
   input 	  set_conf_part_error_dma3;
   input 	  set_tx_ring_oflow_dma3;


   input  tx_dma_cfg_dma3_stop_state;
   output  tx_dma_cfg_dma3_stop;
   output [1:0]  dmc_txc_dma3_func_num;
   input     set_cfg_dma3_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA3;



  // DMA4 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma4 ;
   input 	  dma4_clear_reset;
   input 	  set_cfg_dma4_mmk;  // from mailbox
   input 	  clear_cfg_dma4_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma4;
   output [31:0]  page0_value_dma4;
   output [31:0]  page0_reloc_dma4;
   output 	  page0_valid_dma4;
   output [31:0]  page1_mask_dma4;
   output [31:0]  page1_value_dma4;
   output [31:0]  page1_reloc_dma4;
   output 	  page1_valid_dma4;
   output [19:0]  dmc_txc_dma4_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma4_len;
   output [37:0]  tx_rng_cfg_dma4_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma4 ;
   output 	  tx_dma_cfg_dma4_rst;
   output 	  tx_dma_cfg_dma4_stall;
   output [37:0]  tx_dma_cfg_dma4_mbaddr ;   
   output 	  tx_cfg_dma4_enable_mb; // to mailbox
   output 	  tx_cfg_dma4_mk; // to mailbox
   output 	  tx_cfg_dma4_mmk; // to mailbox
   output [63:0]  tx_cs_dma4; // to mailbox
   output [63:0]  tx_dma4_pre_st; // to mailbox
   output [63:0]  tx_dma4_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma4_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma4;
   input 	  set_pkt_part_err_dma4;
   input [43:0]   pkt_part_error_address_dma4;
   input 	  set_conf_part_error_dma4;
   input 	  set_tx_ring_oflow_dma4;


   input  tx_dma_cfg_dma4_stop_state;
   output  tx_dma_cfg_dma4_stop;
   output [1:0]  dmc_txc_dma4_func_num;
   input     set_cfg_dma4_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA4;



  // DMA5 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma5 ;
   input 	  dma5_clear_reset;
   input 	  set_cfg_dma5_mmk;  // from mailbox
   input 	  clear_cfg_dma5_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma5;
   output [31:0]  page0_value_dma5;
   output [31:0]  page0_reloc_dma5;
   output 	  page0_valid_dma5;
   output [31:0]  page1_mask_dma5;
   output [31:0]  page1_value_dma5;
   output [31:0]  page1_reloc_dma5;
   output 	  page1_valid_dma5;
   output [19:0]  dmc_txc_dma5_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma5_len;
   output [37:0]  tx_rng_cfg_dma5_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma5 ;
   output 	  tx_dma_cfg_dma5_rst;
   output 	  tx_dma_cfg_dma5_stall;
   output [37:0]  tx_dma_cfg_dma5_mbaddr ;   
   output 	  tx_cfg_dma5_enable_mb; // to mailbox
   output 	  tx_cfg_dma5_mk; // to mailbox
   output 	  tx_cfg_dma5_mmk; // to mailbox
   output [63:0]  tx_cs_dma5; // to mailbox
   output [63:0]  tx_dma5_pre_st; // to mailbox
   output [63:0]  tx_dma5_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma5_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma5;
   input 	  set_pkt_part_err_dma5;
   input [43:0]   pkt_part_error_address_dma5;
   input 	  set_conf_part_error_dma5;
   input 	  set_tx_ring_oflow_dma5;


   input  tx_dma_cfg_dma5_stop_state;
   output  tx_dma_cfg_dma5_stop;
   output [1:0]  dmc_txc_dma5_func_num;
   input     set_cfg_dma5_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA5;



  // DMA6 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma6 ;
   input 	  dma6_clear_reset;
   input 	  set_cfg_dma6_mmk;  // from mailbox
   input 	  clear_cfg_dma6_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma6;
   output [31:0]  page0_value_dma6;
   output [31:0]  page0_reloc_dma6;
   output 	  page0_valid_dma6;
   output [31:0]  page1_mask_dma6;
   output [31:0]  page1_value_dma6;
   output [31:0]  page1_reloc_dma6;
   output 	  page1_valid_dma6;
   output [19:0]  dmc_txc_dma6_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma6_len;
   output [37:0]  tx_rng_cfg_dma6_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma6 ;
   output 	  tx_dma_cfg_dma6_rst;
   output 	  tx_dma_cfg_dma6_stall;
   output [37:0]  tx_dma_cfg_dma6_mbaddr ;   
   output 	  tx_cfg_dma6_enable_mb; // to mailbox
   output 	  tx_cfg_dma6_mk; // to mailbox
   output 	  tx_cfg_dma6_mmk; // to mailbox
   output [63:0]  tx_cs_dma6; // to mailbox
   output [63:0]  tx_dma6_pre_st; // to mailbox
   output [63:0]  tx_dma6_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma6_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma6;
   input 	  set_pkt_part_err_dma6;
   input [43:0]   pkt_part_error_address_dma6;
   input 	  set_conf_part_error_dma6;
   input 	  set_tx_ring_oflow_dma6;


   input  tx_dma_cfg_dma6_stop_state;
   output  tx_dma_cfg_dma6_stop;
   output [1:0]  dmc_txc_dma6_func_num;
   input     set_cfg_dma6_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA6;



  // DMA7 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma7 ;
   input 	  dma7_clear_reset;
   input 	  set_cfg_dma7_mmk;  // from mailbox
   input 	  clear_cfg_dma7_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma7;
   output [31:0]  page0_value_dma7;
   output [31:0]  page0_reloc_dma7;
   output 	  page0_valid_dma7;
   output [31:0]  page1_mask_dma7;
   output [31:0]  page1_value_dma7;
   output [31:0]  page1_reloc_dma7;
   output 	  page1_valid_dma7;
   output [19:0]  dmc_txc_dma7_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma7_len;
   output [37:0]  tx_rng_cfg_dma7_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma7 ;
   output 	  tx_dma_cfg_dma7_rst;
   output 	  tx_dma_cfg_dma7_stall;
   output [37:0]  tx_dma_cfg_dma7_mbaddr ;   
   output 	  tx_cfg_dma7_enable_mb; // to mailbox
   output 	  tx_cfg_dma7_mk; // to mailbox
   output 	  tx_cfg_dma7_mmk; // to mailbox
   output [63:0]  tx_cs_dma7; // to mailbox
   output [63:0]  tx_dma7_pre_st; // to mailbox
   output [63:0]  tx_dma7_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma7_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma7;
   input 	  set_pkt_part_err_dma7;
   input [43:0]   pkt_part_error_address_dma7;
   input 	  set_conf_part_error_dma7;
   input 	  set_tx_ring_oflow_dma7;


   input  tx_dma_cfg_dma7_stop_state;
   output  tx_dma_cfg_dma7_stop;
   output [1:0]  dmc_txc_dma7_func_num;
   input     set_cfg_dma7_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA7;



  // DMA8 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma8 ;
   input 	  dma8_clear_reset;
   input 	  set_cfg_dma8_mmk;  // from mailbox
   input 	  clear_cfg_dma8_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma8;
   output [31:0]  page0_value_dma8;
   output [31:0]  page0_reloc_dma8;
   output 	  page0_valid_dma8;
   output [31:0]  page1_mask_dma8;
   output [31:0]  page1_value_dma8;
   output [31:0]  page1_reloc_dma8;
   output 	  page1_valid_dma8;
   output [19:0]  dmc_txc_dma8_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma8_len;
   output [37:0]  tx_rng_cfg_dma8_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma8 ;
   output 	  tx_dma_cfg_dma8_rst;
   output 	  tx_dma_cfg_dma8_stall;
   output [37:0]  tx_dma_cfg_dma8_mbaddr ;   
   output 	  tx_cfg_dma8_enable_mb; // to mailbox
   output 	  tx_cfg_dma8_mk; // to mailbox
   output 	  tx_cfg_dma8_mmk; // to mailbox
   output [63:0]  tx_cs_dma8; // to mailbox
   output [63:0]  tx_dma8_pre_st; // to mailbox
   output [63:0]  tx_dma8_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma8_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma8;
   input 	  set_pkt_part_err_dma8;
   input [43:0]   pkt_part_error_address_dma8;
   input 	  set_conf_part_error_dma8;
   input 	  set_tx_ring_oflow_dma8;


   input  tx_dma_cfg_dma8_stop_state;
   output  tx_dma_cfg_dma8_stop;
   output [1:0]  dmc_txc_dma8_func_num;
   input     set_cfg_dma8_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA8;



  // DMA9 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma9 ;
   input 	  dma9_clear_reset;
   input 	  set_cfg_dma9_mmk;  // from mailbox
   input 	  clear_cfg_dma9_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma9;
   output [31:0]  page0_value_dma9;
   output [31:0]  page0_reloc_dma9;
   output 	  page0_valid_dma9;
   output [31:0]  page1_mask_dma9;
   output [31:0]  page1_value_dma9;
   output [31:0]  page1_reloc_dma9;
   output 	  page1_valid_dma9;
   output [19:0]  dmc_txc_dma9_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma9_len;
   output [37:0]  tx_rng_cfg_dma9_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma9 ;
   output 	  tx_dma_cfg_dma9_rst;
   output 	  tx_dma_cfg_dma9_stall;
   output [37:0]  tx_dma_cfg_dma9_mbaddr ;   
   output 	  tx_cfg_dma9_enable_mb; // to mailbox
   output 	  tx_cfg_dma9_mk; // to mailbox
   output 	  tx_cfg_dma9_mmk; // to mailbox
   output [63:0]  tx_cs_dma9; // to mailbox
   output [63:0]  tx_dma9_pre_st; // to mailbox
   output [63:0]  tx_dma9_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma9_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma9;
   input 	  set_pkt_part_err_dma9;
   input [43:0]   pkt_part_error_address_dma9;
   input 	  set_conf_part_error_dma9;
   input 	  set_tx_ring_oflow_dma9;


   input  tx_dma_cfg_dma9_stop_state;
   output  tx_dma_cfg_dma9_stop;
   output [1:0]  dmc_txc_dma9_func_num;
   input     set_cfg_dma9_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA9;



  // DMA10 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma10 ;
   input 	  dma10_clear_reset;
   input 	  set_cfg_dma10_mmk;  // from mailbox
   input 	  clear_cfg_dma10_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma10;
   output [31:0]  page0_value_dma10;
   output [31:0]  page0_reloc_dma10;
   output 	  page0_valid_dma10;
   output [31:0]  page1_mask_dma10;
   output [31:0]  page1_value_dma10;
   output [31:0]  page1_reloc_dma10;
   output 	  page1_valid_dma10;
   output [19:0]  dmc_txc_dma10_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma10_len;
   output [37:0]  tx_rng_cfg_dma10_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma10 ;
   output 	  tx_dma_cfg_dma10_rst;
   output 	  tx_dma_cfg_dma10_stall;
   output [37:0]  tx_dma_cfg_dma10_mbaddr ;   
   output 	  tx_cfg_dma10_enable_mb; // to mailbox
   output 	  tx_cfg_dma10_mk; // to mailbox
   output 	  tx_cfg_dma10_mmk; // to mailbox
   output [63:0]  tx_cs_dma10; // to mailbox
   output [63:0]  tx_dma10_pre_st; // to mailbox
   output [63:0]  tx_dma10_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma10_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma10;
   input 	  set_pkt_part_err_dma10;
   input [43:0]   pkt_part_error_address_dma10;
   input 	  set_conf_part_error_dma10;
   input 	  set_tx_ring_oflow_dma10;


   input  tx_dma_cfg_dma10_stop_state;
   output  tx_dma_cfg_dma10_stop;
   output [1:0]  dmc_txc_dma10_func_num;
   input     set_cfg_dma10_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA10;



  // DMA11 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma11 ;
   input 	  dma11_clear_reset;
   input 	  set_cfg_dma11_mmk;  // from mailbox
   input 	  clear_cfg_dma11_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma11;
   output [31:0]  page0_value_dma11;
   output [31:0]  page0_reloc_dma11;
   output 	  page0_valid_dma11;
   output [31:0]  page1_mask_dma11;
   output [31:0]  page1_value_dma11;
   output [31:0]  page1_reloc_dma11;
   output 	  page1_valid_dma11;
   output [19:0]  dmc_txc_dma11_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma11_len;
   output [37:0]  tx_rng_cfg_dma11_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma11 ;
   output 	  tx_dma_cfg_dma11_rst;
   output 	  tx_dma_cfg_dma11_stall;
   output [37:0]  tx_dma_cfg_dma11_mbaddr ;   
   output 	  tx_cfg_dma11_enable_mb; // to mailbox
   output 	  tx_cfg_dma11_mk; // to mailbox
   output 	  tx_cfg_dma11_mmk; // to mailbox
   output [63:0]  tx_cs_dma11; // to mailbox
   output [63:0]  tx_dma11_pre_st; // to mailbox
   output [63:0]  tx_dma11_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma11_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma11;
   input 	  set_pkt_part_err_dma11;
   input [43:0]   pkt_part_error_address_dma11;
   input 	  set_conf_part_error_dma11;
   input 	  set_tx_ring_oflow_dma11;


   input  tx_dma_cfg_dma11_stop_state;
   output  tx_dma_cfg_dma11_stop;
   output [1:0]  dmc_txc_dma11_func_num;
   input     set_cfg_dma11_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA11;



  // DMA12 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma12 ;
   input 	  dma12_clear_reset;
   input 	  set_cfg_dma12_mmk;  // from mailbox
   input 	  clear_cfg_dma12_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma12;
   output [31:0]  page0_value_dma12;
   output [31:0]  page0_reloc_dma12;
   output 	  page0_valid_dma12;
   output [31:0]  page1_mask_dma12;
   output [31:0]  page1_value_dma12;
   output [31:0]  page1_reloc_dma12;
   output 	  page1_valid_dma12;
   output [19:0]  dmc_txc_dma12_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma12_len;
   output [37:0]  tx_rng_cfg_dma12_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma12 ;
   output 	  tx_dma_cfg_dma12_rst;
   output 	  tx_dma_cfg_dma12_stall;
   output [37:0]  tx_dma_cfg_dma12_mbaddr ;   
   output 	  tx_cfg_dma12_enable_mb; // to mailbox
   output 	  tx_cfg_dma12_mk; // to mailbox
   output 	  tx_cfg_dma12_mmk; // to mailbox
   output [63:0]  tx_cs_dma12; // to mailbox
   output [63:0]  tx_dma12_pre_st; // to mailbox
   output [63:0]  tx_dma12_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma12_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma12;
   input 	  set_pkt_part_err_dma12;
   input [43:0]   pkt_part_error_address_dma12;
   input 	  set_conf_part_error_dma12;
   input 	  set_tx_ring_oflow_dma12;


   input  tx_dma_cfg_dma12_stop_state;
   output  tx_dma_cfg_dma12_stop;
   output [1:0]  dmc_txc_dma12_func_num;
   input     set_cfg_dma12_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA12;



  // DMA13 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma13 ;
   input 	  dma13_clear_reset;
   input 	  set_cfg_dma13_mmk;  // from mailbox
   input 	  clear_cfg_dma13_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma13;
   output [31:0]  page0_value_dma13;
   output [31:0]  page0_reloc_dma13;
   output 	  page0_valid_dma13;
   output [31:0]  page1_mask_dma13;
   output [31:0]  page1_value_dma13;
   output [31:0]  page1_reloc_dma13;
   output 	  page1_valid_dma13;
   output [19:0]  dmc_txc_dma13_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma13_len;
   output [37:0]  tx_rng_cfg_dma13_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma13 ;
   output 	  tx_dma_cfg_dma13_rst;
   output 	  tx_dma_cfg_dma13_stall;
   output [37:0]  tx_dma_cfg_dma13_mbaddr ;   
   output 	  tx_cfg_dma13_enable_mb; // to mailbox
   output 	  tx_cfg_dma13_mk; // to mailbox
   output 	  tx_cfg_dma13_mmk; // to mailbox
   output [63:0]  tx_cs_dma13; // to mailbox
   output [63:0]  tx_dma13_pre_st; // to mailbox
   output [63:0]  tx_dma13_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma13_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma13;
   input 	  set_pkt_part_err_dma13;
   input [43:0]   pkt_part_error_address_dma13;
   input 	  set_conf_part_error_dma13;
   input 	  set_tx_ring_oflow_dma13;


   input  tx_dma_cfg_dma13_stop_state;
   output  tx_dma_cfg_dma13_stop;
   output [1:0]  dmc_txc_dma13_func_num;
   input     set_cfg_dma13_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA13;



  // DMA14 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma14 ;
   input 	  dma14_clear_reset;
   input 	  set_cfg_dma14_mmk;  // from mailbox
   input 	  clear_cfg_dma14_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma14;
   output [31:0]  page0_value_dma14;
   output [31:0]  page0_reloc_dma14;
   output 	  page0_valid_dma14;
   output [31:0]  page1_mask_dma14;
   output [31:0]  page1_value_dma14;
   output [31:0]  page1_reloc_dma14;
   output 	  page1_valid_dma14;
   output [19:0]  dmc_txc_dma14_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma14_len;
   output [37:0]  tx_rng_cfg_dma14_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma14 ;
   output 	  tx_dma_cfg_dma14_rst;
   output 	  tx_dma_cfg_dma14_stall;
   output [37:0]  tx_dma_cfg_dma14_mbaddr ;   
   output 	  tx_cfg_dma14_enable_mb; // to mailbox
   output 	  tx_cfg_dma14_mk; // to mailbox
   output 	  tx_cfg_dma14_mmk; // to mailbox
   output [63:0]  tx_cs_dma14; // to mailbox
   output [63:0]  tx_dma14_pre_st; // to mailbox
   output [63:0]  tx_dma14_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma14_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma14;
   input 	  set_pkt_part_err_dma14;
   input [43:0]   pkt_part_error_address_dma14;
   input 	  set_conf_part_error_dma14;
   input 	  set_tx_ring_oflow_dma14;


   input  tx_dma_cfg_dma14_stop_state;
   output  tx_dma_cfg_dma14_stop;
   output [1:0]  dmc_txc_dma14_func_num;
   input     set_cfg_dma14_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA14;



  // DMA15 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma15 ;
   input 	  dma15_clear_reset;
   input 	  set_cfg_dma15_mmk;  // from mailbox
   input 	  clear_cfg_dma15_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma15;
   output [31:0]  page0_value_dma15;
   output [31:0]  page0_reloc_dma15;
   output 	  page0_valid_dma15;
   output [31:0]  page1_mask_dma15;
   output [31:0]  page1_value_dma15;
   output [31:0]  page1_reloc_dma15;
   output 	  page1_valid_dma15;
   output [19:0]  dmc_txc_dma15_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma15_len;
   output [37:0]  tx_rng_cfg_dma15_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma15 ;
   output 	  tx_dma_cfg_dma15_rst;
   output 	  tx_dma_cfg_dma15_stall;
   output [37:0]  tx_dma_cfg_dma15_mbaddr ;   
   output 	  tx_cfg_dma15_enable_mb; // to mailbox
   output 	  tx_cfg_dma15_mk; // to mailbox
   output 	  tx_cfg_dma15_mmk; // to mailbox
   output [63:0]  tx_cs_dma15; // to mailbox
   output [63:0]  tx_dma15_pre_st; // to mailbox
   output [63:0]  tx_dma15_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma15_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma15;
   input 	  set_pkt_part_err_dma15;
   input [43:0]   pkt_part_error_address_dma15;
   input 	  set_conf_part_error_dma15;
   input 	  set_tx_ring_oflow_dma15;


   input  tx_dma_cfg_dma15_stop_state;
   output  tx_dma_cfg_dma15_stop;
   output [1:0]  dmc_txc_dma15_func_num;
   input     set_cfg_dma15_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA15;



`ifdef NEPTUNE
   
  // DMA16 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma16 ;
   input 	  dma16_clear_reset;
   input 	  set_cfg_dma16_mmk;  // from mailbox
   input 	  clear_cfg_dma16_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma16;
   output [31:0]  page0_value_dma16;
   output [31:0]  page0_reloc_dma16;
   output 	  page0_valid_dma16;
   output [31:0]  page1_mask_dma16;
   output [31:0]  page1_value_dma16;
   output [31:0]  page1_reloc_dma16;
   output 	  page1_valid_dma16;
   output [19:0]  dmc_txc_dma16_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma16_len;
   output [37:0]  tx_rng_cfg_dma16_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma16 ;
   output 	  tx_dma_cfg_dma16_rst;
   output 	  tx_dma_cfg_dma16_stall;
   output [37:0]  tx_dma_cfg_dma16_mbaddr ;   
   output 	  tx_cfg_dma16_enable_mb; // to mailbox
   output 	  tx_cfg_dma16_mk; // to mailbox
   output 	  tx_cfg_dma16_mmk; // to mailbox
   output [63:0]  tx_cs_dma16; // to mailbox
   output [63:0]  tx_dma16_pre_st; // to mailbox
   output [63:0]  tx_dma16_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma16_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma16;
   input 	  set_pkt_part_err_dma16;
   input [43:0]   pkt_part_error_address_dma16;
   input 	  set_conf_part_error_dma16;
   input 	  set_tx_ring_oflow_dma16;


   input  tx_dma_cfg_dma16_stop_state;
   output  tx_dma_cfg_dma16_stop;
   output [1:0]  dmc_txc_dma16_func_num;
   input     set_cfg_dma16_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA16;



  // DMA17 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma17 ;
   input 	  dma17_clear_reset;
   input 	  set_cfg_dma17_mmk;  // from mailbox
   input 	  clear_cfg_dma17_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma17;
   output [31:0]  page0_value_dma17;
   output [31:0]  page0_reloc_dma17;
   output 	  page0_valid_dma17;
   output [31:0]  page1_mask_dma17;
   output [31:0]  page1_value_dma17;
   output [31:0]  page1_reloc_dma17;
   output 	  page1_valid_dma17;
   output [19:0]  dmc_txc_dma17_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma17_len;
   output [37:0]  tx_rng_cfg_dma17_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma17 ;
   output 	  tx_dma_cfg_dma17_rst;
   output 	  tx_dma_cfg_dma17_stall;
   output [37:0]  tx_dma_cfg_dma17_mbaddr ;   
   output 	  tx_cfg_dma17_enable_mb; // to mailbox
   output 	  tx_cfg_dma17_mk; // to mailbox
   output 	  tx_cfg_dma17_mmk; // to mailbox
   output [63:0]  tx_cs_dma17; // to mailbox
   output [63:0]  tx_dma17_pre_st; // to mailbox
   output [63:0]  tx_dma17_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma17_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma17;
   input 	  set_pkt_part_err_dma17;
   input [43:0]   pkt_part_error_address_dma17;
   input 	  set_conf_part_error_dma17;
   input 	  set_tx_ring_oflow_dma17;


   input  tx_dma_cfg_dma17_stop_state;
   output  tx_dma_cfg_dma17_stop;
   output [1:0]  dmc_txc_dma17_func_num;
   input     set_cfg_dma17_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA17;



  // DMA18 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma18 ;
   input 	  dma18_clear_reset;
   input 	  set_cfg_dma18_mmk;  // from mailbox
   input 	  clear_cfg_dma18_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma18;
   output [31:0]  page0_value_dma18;
   output [31:0]  page0_reloc_dma18;
   output 	  page0_valid_dma18;
   output [31:0]  page1_mask_dma18;
   output [31:0]  page1_value_dma18;
   output [31:0]  page1_reloc_dma18;
   output 	  page1_valid_dma18;
   output [19:0]  dmc_txc_dma18_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma18_len;
   output [37:0]  tx_rng_cfg_dma18_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma18 ;
   output 	  tx_dma_cfg_dma18_rst;
   output 	  tx_dma_cfg_dma18_stall;
   output [37:0]  tx_dma_cfg_dma18_mbaddr ;   
   output 	  tx_cfg_dma18_enable_mb; // to mailbox
   output 	  tx_cfg_dma18_mk; // to mailbox
   output 	  tx_cfg_dma18_mmk; // to mailbox
   output [63:0]  tx_cs_dma18; // to mailbox
   output [63:0]  tx_dma18_pre_st; // to mailbox
   output [63:0]  tx_dma18_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma18_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma18;
   input 	  set_pkt_part_err_dma18;
   input [43:0]   pkt_part_error_address_dma18;
   input 	  set_conf_part_error_dma18;
   input 	  set_tx_ring_oflow_dma18;


   input  tx_dma_cfg_dma18_stop_state;
   output  tx_dma_cfg_dma18_stop;
   output [1:0]  dmc_txc_dma18_func_num;
   input     set_cfg_dma18_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA18;



  // DMA19 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma19 ;
   input 	  dma19_clear_reset;
   input 	  set_cfg_dma19_mmk;  // from mailbox
   input 	  clear_cfg_dma19_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma19;
   output [31:0]  page0_value_dma19;
   output [31:0]  page0_reloc_dma19;
   output 	  page0_valid_dma19;
   output [31:0]  page1_mask_dma19;
   output [31:0]  page1_value_dma19;
   output [31:0]  page1_reloc_dma19;
   output 	  page1_valid_dma19;
   output [19:0]  dmc_txc_dma19_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma19_len;
   output [37:0]  tx_rng_cfg_dma19_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma19 ;
   output 	  tx_dma_cfg_dma19_rst;
   output 	  tx_dma_cfg_dma19_stall;
   output [37:0]  tx_dma_cfg_dma19_mbaddr ;   
   output 	  tx_cfg_dma19_enable_mb; // to mailbox
   output 	  tx_cfg_dma19_mk; // to mailbox
   output 	  tx_cfg_dma19_mmk; // to mailbox
   output [63:0]  tx_cs_dma19; // to mailbox
   output [63:0]  tx_dma19_pre_st; // to mailbox
   output [63:0]  tx_dma19_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma19_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma19;
   input 	  set_pkt_part_err_dma19;
   input [43:0]   pkt_part_error_address_dma19;
   input 	  set_conf_part_error_dma19;
   input 	  set_tx_ring_oflow_dma19;


   input  tx_dma_cfg_dma19_stop_state;
   output  tx_dma_cfg_dma19_stop;
   output [1:0]  dmc_txc_dma19_func_num;
   input     set_cfg_dma19_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA19;



  // DMA20 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma20 ;
   input 	  dma20_clear_reset;
   input 	  set_cfg_dma20_mmk;  // from mailbox
   input 	  clear_cfg_dma20_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma20;
   output [31:0]  page0_value_dma20;
   output [31:0]  page0_reloc_dma20;
   output 	  page0_valid_dma20;
   output [31:0]  page1_mask_dma20;
   output [31:0]  page1_value_dma20;
   output [31:0]  page1_reloc_dma20;
   output 	  page1_valid_dma20;
   output [19:0]  dmc_txc_dma20_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma20_len;
   output [37:0]  tx_rng_cfg_dma20_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma20 ;
   output 	  tx_dma_cfg_dma20_rst;
   output 	  tx_dma_cfg_dma20_stall;
   output [37:0]  tx_dma_cfg_dma20_mbaddr ;   
   output 	  tx_cfg_dma20_enable_mb; // to mailbox
   output 	  tx_cfg_dma20_mk; // to mailbox
   output 	  tx_cfg_dma20_mmk; // to mailbox
   output [63:0]  tx_cs_dma20; // to mailbox
   output [63:0]  tx_dma20_pre_st; // to mailbox
   output [63:0]  tx_dma20_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma20_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma20;
   input 	  set_pkt_part_err_dma20;
   input [43:0]   pkt_part_error_address_dma20;
   input 	  set_conf_part_error_dma20;
   input 	  set_tx_ring_oflow_dma20;


   input  tx_dma_cfg_dma20_stop_state;
   output  tx_dma_cfg_dma20_stop;
   output [1:0]  dmc_txc_dma20_func_num;
   input     set_cfg_dma20_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA20;



  // DMA21 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma21 ;
   input 	  dma21_clear_reset;
   input 	  set_cfg_dma21_mmk;  // from mailbox
   input 	  clear_cfg_dma21_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma21;
   output [31:0]  page0_value_dma21;
   output [31:0]  page0_reloc_dma21;
   output 	  page0_valid_dma21;
   output [31:0]  page1_mask_dma21;
   output [31:0]  page1_value_dma21;
   output [31:0]  page1_reloc_dma21;
   output 	  page1_valid_dma21;
   output [19:0]  dmc_txc_dma21_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma21_len;
   output [37:0]  tx_rng_cfg_dma21_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma21 ;
   output 	  tx_dma_cfg_dma21_rst;
   output 	  tx_dma_cfg_dma21_stall;
   output [37:0]  tx_dma_cfg_dma21_mbaddr ;   
   output 	  tx_cfg_dma21_enable_mb; // to mailbox
   output 	  tx_cfg_dma21_mk; // to mailbox
   output 	  tx_cfg_dma21_mmk; // to mailbox
   output [63:0]  tx_cs_dma21; // to mailbox
   output [63:0]  tx_dma21_pre_st; // to mailbox
   output [63:0]  tx_dma21_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma21_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma21;
   input 	  set_pkt_part_err_dma21;
   input [43:0]   pkt_part_error_address_dma21;
   input 	  set_conf_part_error_dma21;
   input 	  set_tx_ring_oflow_dma21;


   input  tx_dma_cfg_dma21_stop_state;
   output  tx_dma_cfg_dma21_stop;
   output [1:0]  dmc_txc_dma21_func_num;
   input     set_cfg_dma21_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA21;



  // DMA22 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma22 ;
   input 	  dma22_clear_reset;
   input 	  set_cfg_dma22_mmk;  // from mailbox
   input 	  clear_cfg_dma22_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma22;
   output [31:0]  page0_value_dma22;
   output [31:0]  page0_reloc_dma22;
   output 	  page0_valid_dma22;
   output [31:0]  page1_mask_dma22;
   output [31:0]  page1_value_dma22;
   output [31:0]  page1_reloc_dma22;
   output 	  page1_valid_dma22;
   output [19:0]  dmc_txc_dma22_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma22_len;
   output [37:0]  tx_rng_cfg_dma22_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma22 ;
   output 	  tx_dma_cfg_dma22_rst;
   output 	  tx_dma_cfg_dma22_stall;
   output [37:0]  tx_dma_cfg_dma22_mbaddr ;   
   output 	  tx_cfg_dma22_enable_mb; // to mailbox
   output 	  tx_cfg_dma22_mk; // to mailbox
   output 	  tx_cfg_dma22_mmk; // to mailbox
   output [63:0]  tx_cs_dma22; // to mailbox
   output [63:0]  tx_dma22_pre_st; // to mailbox
   output [63:0]  tx_dma22_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma22_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma22;
   input 	  set_pkt_part_err_dma22;
   input [43:0]   pkt_part_error_address_dma22;
   input 	  set_conf_part_error_dma22;
   input 	  set_tx_ring_oflow_dma22;


   input  tx_dma_cfg_dma22_stop_state;
   output  tx_dma_cfg_dma22_stop;
   output [1:0]  dmc_txc_dma22_func_num;
   input     set_cfg_dma22_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA22;



  // DMA23 Signals
   input [`PTR_WIDTH :0]   tx_rng_head_dma23 ;
   input 	  dma23_clear_reset;
   input 	  set_cfg_dma23_mmk;  // from mailbox
   input 	  clear_cfg_dma23_mb;  // from mailbox

   
   output [31:0]  page0_mask_dma23;
   output [31:0]  page0_value_dma23;
   output [31:0]  page0_reloc_dma23;
   output 	  page0_valid_dma23;
   output [31:0]  page1_mask_dma23;
   output [31:0]  page1_value_dma23;
   output [31:0]  page1_reloc_dma23;
   output 	  page1_valid_dma23;
   output [19:0]  dmc_txc_dma23_page_handle;

   output [`RNG_LENGTH_WIDTH -1 :0]  tx_rng_cfg_dma23_len;
   output [37:0]  tx_rng_cfg_dma23_staddr;
   output [`PTR_WIDTH :0]  tx_rng_tail_dma23 ;
   output 	  tx_dma_cfg_dma23_rst;
   output 	  tx_dma_cfg_dma23_stall;
   output [37:0]  tx_dma_cfg_dma23_mbaddr ;   
   output 	  tx_cfg_dma23_enable_mb; // to mailbox
   output 	  tx_cfg_dma23_mk; // to mailbox
   output 	  tx_cfg_dma23_mmk; // to mailbox
   output [63:0]  tx_cs_dma23; // to mailbox
   output [63:0]  tx_dma23_pre_st; // to mailbox
   output [63:0]  tx_dma23_rng_err_logh;  // to mailbox
   output [63:0]  tx_dma23_rng_err_logl;  // to mailbox

   input 	  set_pref_buf_par_err_dma23;
   input 	  set_pkt_part_err_dma23;
   input [43:0]   pkt_part_error_address_dma23;
   input 	  set_conf_part_error_dma23;
   input 	  set_tx_ring_oflow_dma23;


   input  tx_dma_cfg_dma23_stop_state;
   output  tx_dma_cfg_dma23_stop;
   output [1:0]  dmc_txc_dma23_func_num;
   input     set_cfg_dma23_mk;
   input [`PTR_WIDTH - 1:0] ShadowRingCurrentPtr_DMA23;

`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
		       

   input [`NO_OF_DMAS - 1:0]   set_mbox_part_error_dma;


   input [`NO_OF_DMAS - 1:0]   txc_dmc_p0_dma_pkt_size_err; // one-hot encoded
   input [`NO_OF_DMAS - 1:0]   txc_dmc_dma_nack_pkt_rd;
   input [43:0]   txc_dmc_nack_pkt_rd_addr;
   input [43:0]   txc_dmc_p0_pkt_size_err_addr;
   input 	  txc_dmc_p0_pkt_size_err;  // pulse to indicate error
   input 	  txc_dmc_nack_pkt_rd; // pulse to indicate error

   input [`NO_OF_DMAS - 1:0]   txc_dmc_p1_dma_pkt_size_err; // one-hot encoded
   input [43:0]   txc_dmc_p1_pkt_size_err_addr;
   input 	  txc_dmc_p1_pkt_size_err;  // pulse to indicate error

   input [`NO_OF_DMAS - 1:0]   txc_dmc_p2_dma_pkt_size_err; // one-hot encoded
   input [43:0]   txc_dmc_p2_pkt_size_err_addr;
   input 	  txc_dmc_p2_pkt_size_err;  // pulse to indicate error

   input [`NO_OF_DMAS - 1:0]   txc_dmc_p3_dma_pkt_size_err; // one-hot encoded
   input [43:0]   txc_dmc_p3_pkt_size_err_addr;
   input 	  txc_dmc_p3_pkt_size_err;  // pulse to indicate error
   
   
   
   input [`NO_OF_DMAS - 1:0] txpref_dma_nack_resp;
   input 		     txpref_nack_resp ;
   input [43:0] 	     txpref_nack_rd_addr;

   input [`NO_OF_DMAS - 1:0] mbox_ack_dma_err_received;
   input 		     mbox_err_received;
   
   output [63:0] 	     tdmc_pio_intr;
   output [31:0] 	     parity_corrupt_config;
   output 		     dmc_txc_tx_addr_md;

// txc error signals for dmaerror
   output 		     dmc_txc_dma0_error;
   output 		     dmc_txc_dma1_error;
   output 		     dmc_txc_dma2_error;
   output 		     dmc_txc_dma3_error;
   output 		     dmc_txc_dma4_error;
   output 		     dmc_txc_dma5_error;
   output 		     dmc_txc_dma6_error;
   output 		     dmc_txc_dma7_error;
   output 		     dmc_txc_dma8_error;
   output 		     dmc_txc_dma9_error;
   output 		     dmc_txc_dma10_error;
   output 		     dmc_txc_dma11_error;
   output 		     dmc_txc_dma12_error;
   output 		     dmc_txc_dma13_error;
   output 		     dmc_txc_dma14_error;
   output 		     dmc_txc_dma15_error;
`ifdef NEPTUNE
   output 		     dmc_txc_dma16_error;
   output 		     dmc_txc_dma17_error;
   output 		     dmc_txc_dma18_error;
   output 		     dmc_txc_dma19_error;
   output 		     dmc_txc_dma20_error;
   output 		     dmc_txc_dma21_error;
   output 		     dmc_txc_dma22_error;
   output 		     dmc_txc_dma23_error;
`else
`endif // !`ifdef NEPTUNE
   

// TXC Signals for various counters
    input txc_dmc_dma0_mark_bit;
 input txc_dmc_dma0_inc_pkt_cnt;
 input txc_dmc_dma1_mark_bit;
 input txc_dmc_dma1_inc_pkt_cnt;
 input txc_dmc_dma2_mark_bit;
 input txc_dmc_dma2_inc_pkt_cnt;
 input txc_dmc_dma3_mark_bit;
 input txc_dmc_dma3_inc_pkt_cnt;
 input txc_dmc_dma4_mark_bit;
 input txc_dmc_dma4_inc_pkt_cnt;
 input txc_dmc_dma5_mark_bit;
 input txc_dmc_dma5_inc_pkt_cnt;
 input txc_dmc_dma6_mark_bit;
 input txc_dmc_dma6_inc_pkt_cnt;
 input txc_dmc_dma7_mark_bit;
 input txc_dmc_dma7_inc_pkt_cnt;
 input txc_dmc_dma8_mark_bit;
 input txc_dmc_dma8_inc_pkt_cnt;
 input txc_dmc_dma9_mark_bit;
 input txc_dmc_dma9_inc_pkt_cnt;
 input txc_dmc_dma10_mark_bit;
 input txc_dmc_dma10_inc_pkt_cnt;
 input txc_dmc_dma11_mark_bit;
 input txc_dmc_dma11_inc_pkt_cnt;
 input txc_dmc_dma12_mark_bit;
 input txc_dmc_dma12_inc_pkt_cnt;
 input txc_dmc_dma13_mark_bit;
 input txc_dmc_dma13_inc_pkt_cnt;
 input txc_dmc_dma14_mark_bit;
 input txc_dmc_dma14_inc_pkt_cnt;
 input txc_dmc_dma15_mark_bit;
 input txc_dmc_dma15_inc_pkt_cnt;
`ifdef NEPTUNE
 input txc_dmc_dma16_mark_bit;
 input txc_dmc_dma16_inc_pkt_cnt;
 input txc_dmc_dma17_mark_bit;
 input txc_dmc_dma17_inc_pkt_cnt;
 input txc_dmc_dma18_mark_bit;
 input txc_dmc_dma18_inc_pkt_cnt;
 input txc_dmc_dma19_mark_bit;
 input txc_dmc_dma19_inc_pkt_cnt;
 input txc_dmc_dma20_mark_bit;
 input txc_dmc_dma20_inc_pkt_cnt;
 input txc_dmc_dma21_mark_bit;
 input txc_dmc_dma21_inc_pkt_cnt;
 input txc_dmc_dma22_mark_bit;
 input txc_dmc_dma22_inc_pkt_cnt;
 input txc_dmc_dma23_mark_bit;
 input txc_dmc_dma23_inc_pkt_cnt;
`else // !`ifdef NEPTUNE
`endif // !`ifdef NEPTUNE
   

   
   
   wire [5:0] 	  debug_select;
   wire [31:0] 	  training_vector;



   wire 	  Slave_Read_dma0_3;
   wire 	  Slave_Sel_dma0_3;
   wire [19:0] 	  Slave_Addr_dma0_3;
   wire           pio_clients_32b_d_dma0_3;

   wire 	  Slave_Read_dma4_7;
   wire 	  Slave_Sel_dma4_7;
   wire [19:0] 	  Slave_Addr_dma4_7;
   wire           pio_clients_32b_d_dma4_7;

   wire 	  Slave_Read_dma8_11;
   wire 	  Slave_Sel_dma8_11;
   wire [19:0] 	  Slave_Addr_dma8_11;
   wire           pio_clients_32b_d_dma8_11;
   
   wire 	  Slave_Read_dma12_15;
   wire 	  Slave_Sel_dma12_15;
   wire [19:0] 	  Slave_Addr_dma12_15;
   wire           pio_clients_32b_d_dma12_15;


`ifdef NEPTUNE
   wire 	  Slave_Read_dma16_19;
   wire 	  Slave_Sel_dma16_19;
   wire [19:0] 	  Slave_Addr_dma16_19;
   wire           pio_clients_32b_d_dma16_19;
   
   wire 	  Slave_Read_dma20_23;
   wire 	  Slave_Sel_dma20_23;
   wire [19:0] 	  Slave_Addr_dma20_23;
   wire           pio_clients_32b_d_dma20_23;
`else
`endif

   
   wire [63:0] 	  Slave_DataIn;
   wire 	  tdmc_pio_ack;                        // pio read data ack
   wire 	  tdmc_pio_err;                        // pio read data error
   wire [63:0] 	  tdmc_pio_rdata;                      // pio read data   //

   /*--------------------------------------------------------------*/
   // Wires & Registers
   /*--------------------------------------------------------------*/

   
   
   wire 	  slaveStrobe;

   wire 	  write_DMA0_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma0_len;
   wire [37:0] 	  tx_rng_cfg_dma0_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma0 ;
   wire 	  tx_dma_cfg_dma0_rst;
   wire 	  tx_dma_cfg_dma0_stall;
   wire [37:0] 	  tx_dma_cfg_dma0_mbaddr ;
   
   wire 	  write_DMA1_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma1_len;
   wire [37:0] 	  tx_rng_cfg_dma1_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma1 ;
   wire 	  tx_dma_cfg_dma1_rst;
   wire 	  tx_dma_cfg_dma1_stall;
   wire [37:0] 	  tx_dma_cfg_dma1_mbaddr ;

   



   wire 	  write_DMA2_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma2_len;
   wire [37:0] 	  tx_rng_cfg_dma2_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma2 ;
   wire 	  tx_dma_cfg_dma2_rst;
   wire 	  tx_dma_cfg_dma2_stall;
   wire [37:0] 	  tx_dma_cfg_dma2_mbaddr ;

   



   wire 	  write_DMA3_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma3_len;
   wire [37:0] 	  tx_rng_cfg_dma3_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma3 ;
   wire 	  tx_dma_cfg_dma3_rst;
   wire 	  tx_dma_cfg_dma3_stall;
   wire [37:0] 	  tx_dma_cfg_dma3_mbaddr ;

   



   wire 	  write_DMA4_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma4_len;
   wire [37:0] 	  tx_rng_cfg_dma4_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma4 ;
   wire 	  tx_dma_cfg_dma4_rst;
   wire 	  tx_dma_cfg_dma4_stall;
   wire [37:0] 	  tx_dma_cfg_dma4_mbaddr ;

   



   wire 	  write_DMA5_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma5_len;
   wire [37:0] 	  tx_rng_cfg_dma5_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma5 ;
   wire 	  tx_dma_cfg_dma5_rst;
   wire 	  tx_dma_cfg_dma5_stall;
   wire [37:0] 	  tx_dma_cfg_dma5_mbaddr ;

   



   wire 	  write_DMA6_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma6_len;
   wire [37:0] 	  tx_rng_cfg_dma6_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma6 ;
   wire 	  tx_dma_cfg_dma6_rst;
   wire 	  tx_dma_cfg_dma6_stall;
   wire [37:0] 	  tx_dma_cfg_dma6_mbaddr ;

   



   wire 	  write_DMA7_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma7_len;
   wire [37:0] 	  tx_rng_cfg_dma7_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma7 ;
   wire 	  tx_dma_cfg_dma7_rst;
   wire 	  tx_dma_cfg_dma7_stall;
   wire [37:0] 	  tx_dma_cfg_dma7_mbaddr ;

   



   wire 	  write_DMA8_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma8_len;
   wire [37:0] 	  tx_rng_cfg_dma8_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma8 ;
   wire 	  tx_dma_cfg_dma8_rst;
   wire 	  tx_dma_cfg_dma8_stall;
   wire [37:0] 	  tx_dma_cfg_dma8_mbaddr ;

   



   wire 	  write_DMA9_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma9_len;
   wire [37:0] 	  tx_rng_cfg_dma9_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma9 ;
   wire 	  tx_dma_cfg_dma9_rst;
   wire 	  tx_dma_cfg_dma9_stall;
   wire [37:0] 	  tx_dma_cfg_dma9_mbaddr ;

   



   wire 	  write_DMA10_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma10_len;
   wire [37:0] 	  tx_rng_cfg_dma10_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma10 ;
   wire 	  tx_dma_cfg_dma10_rst;
   wire 	  tx_dma_cfg_dma10_stall;
   wire [37:0] 	  tx_dma_cfg_dma10_mbaddr ;

   



   wire 	  write_DMA11_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma11_len;
   wire [37:0] 	  tx_rng_cfg_dma11_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma11 ;
   wire 	  tx_dma_cfg_dma11_rst;
   wire 	  tx_dma_cfg_dma11_stall;
   wire [37:0] 	  tx_dma_cfg_dma11_mbaddr ;

   



   wire 	  write_DMA12_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma12_len;
   wire [37:0] 	  tx_rng_cfg_dma12_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma12 ;
   wire 	  tx_dma_cfg_dma12_rst;
   wire 	  tx_dma_cfg_dma12_stall;
   wire [37:0] 	  tx_dma_cfg_dma12_mbaddr ;

   



   wire 	  write_DMA13_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma13_len;
   wire [37:0] 	  tx_rng_cfg_dma13_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma13 ;
   wire 	  tx_dma_cfg_dma13_rst;
   wire 	  tx_dma_cfg_dma13_stall;
   wire [37:0] 	  tx_dma_cfg_dma13_mbaddr ;

   



   wire 	  write_DMA14_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma14_len;
   wire [37:0] 	  tx_rng_cfg_dma14_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma14 ;
   wire 	  tx_dma_cfg_dma14_rst;
   wire 	  tx_dma_cfg_dma14_stall;
   wire [37:0] 	  tx_dma_cfg_dma14_mbaddr ;

   



   wire 	  write_DMA15_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma15_len;
   wire [37:0] 	  tx_rng_cfg_dma15_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma15 ;
   wire 	  tx_dma_cfg_dma15_rst;
   wire 	  tx_dma_cfg_dma15_stall;
   wire [37:0] 	  tx_dma_cfg_dma15_mbaddr ;

   



`ifdef NEPTUNE
   
   wire 	  write_DMA16_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma16_len;
   wire [37:0] 	  tx_rng_cfg_dma16_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma16 ;
   wire 	  tx_dma_cfg_dma16_rst;
   wire 	  tx_dma_cfg_dma16_stall;
   wire [37:0] 	  tx_dma_cfg_dma16_mbaddr ;

   



   wire 	  write_DMA17_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma17_len;
   wire [37:0] 	  tx_rng_cfg_dma17_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma17 ;
   wire 	  tx_dma_cfg_dma17_rst;
   wire 	  tx_dma_cfg_dma17_stall;
   wire [37:0] 	  tx_dma_cfg_dma17_mbaddr ;

   



   wire 	  write_DMA18_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma18_len;
   wire [37:0] 	  tx_rng_cfg_dma18_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma18 ;
   wire 	  tx_dma_cfg_dma18_rst;
   wire 	  tx_dma_cfg_dma18_stall;
   wire [37:0] 	  tx_dma_cfg_dma18_mbaddr ;

   



   wire 	  write_DMA19_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma19_len;
   wire [37:0] 	  tx_rng_cfg_dma19_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma19 ;
   wire 	  tx_dma_cfg_dma19_rst;
   wire 	  tx_dma_cfg_dma19_stall;
   wire [37:0] 	  tx_dma_cfg_dma19_mbaddr ;

   



   wire 	  write_DMA20_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma20_len;
   wire [37:0] 	  tx_rng_cfg_dma20_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma20 ;
   wire 	  tx_dma_cfg_dma20_rst;
   wire 	  tx_dma_cfg_dma20_stall;
   wire [37:0] 	  tx_dma_cfg_dma20_mbaddr ;

   



   wire 	  write_DMA21_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma21_len;
   wire [37:0] 	  tx_rng_cfg_dma21_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma21 ;
   wire 	  tx_dma_cfg_dma21_rst;
   wire 	  tx_dma_cfg_dma21_stall;
   wire [37:0] 	  tx_dma_cfg_dma21_mbaddr ;

   



   wire 	  write_DMA22_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma22_len;
   wire [37:0] 	  tx_rng_cfg_dma22_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma22 ;
   wire 	  tx_dma_cfg_dma22_rst;
   wire 	  tx_dma_cfg_dma22_stall;
   wire [37:0] 	  tx_dma_cfg_dma22_mbaddr ;

   



   wire 	  write_DMA23_Register;
   wire [`RNG_LENGTH_WIDTH -1 :0] 	  tx_rng_cfg_dma23_len;
   wire [37:0] 	  tx_rng_cfg_dma23_staddr;
   wire [`PTR_WIDTH :0] 	  tx_rng_tail_dma23 ;
   wire 	  tx_dma_cfg_dma23_rst;
   wire 	  tx_dma_cfg_dma23_stall;
   wire [37:0] 	  tx_dma_cfg_dma23_mbaddr ;

   
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
		       
   


   
   // fzc registers


   wire [31:0] 	  page0_mask_dma0;
   wire [31:0] 	  page0_value_dma0;
   wire [31:0] 	  page0_reloc_dma0;
   wire 	  page0_valid_dma0;
   wire [31:0] 	  page1_mask_dma0;
   wire [31:0] 	  page1_value_dma0;
   wire [31:0] 	  page1_reloc_dma0;
   wire 	  page1_valid_dma0;
   wire [19:0] 	  dmc_txc_dma0_page_handle;
   wire [31:0] 	  page0_mask_dma1;
   wire [31:0] 	  page0_value_dma1;
   wire [31:0] 	  page0_reloc_dma1;
   wire 	  page0_valid_dma1;
   wire [31:0] 	  page1_mask_dma1;
   wire [31:0] 	  page1_value_dma1;
   wire [31:0] 	  page1_reloc_dma1;
   wire 	  page1_valid_dma1;
   wire [19:0] 	  dmc_txc_dma1_page_handle;
   wire [31:0] 	  page0_mask_dma2;
   wire [31:0] 	  page0_value_dma2;
   wire [31:0] 	  page0_reloc_dma2;
   wire 	  page0_valid_dma2;
   wire [31:0] 	  page1_mask_dma2;
   wire [31:0] 	  page1_value_dma2;
   wire [31:0] 	  page1_reloc_dma2;
   wire 	  page1_valid_dma2;
   wire [19:0] 	  dmc_txc_dma2_page_handle;
   wire [31:0] 	  page0_mask_dma3;
   wire [31:0] 	  page0_value_dma3;
   wire [31:0] 	  page0_reloc_dma3;
   wire 	  page0_valid_dma3;
   wire [31:0] 	  page1_mask_dma3;
   wire [31:0] 	  page1_value_dma3;
   wire [31:0] 	  page1_reloc_dma3;
   wire 	  page1_valid_dma3;
   wire [19:0] 	  dmc_txc_dma3_page_handle;
   wire [31:0] 	  page0_mask_dma4;
   wire [31:0] 	  page0_value_dma4;
   wire [31:0] 	  page0_reloc_dma4;
   wire 	  page0_valid_dma4;
   wire [31:0] 	  page1_mask_dma4;
   wire [31:0] 	  page1_value_dma4;
   wire [31:0] 	  page1_reloc_dma4;
   wire 	  page1_valid_dma4;
   wire [19:0] 	  dmc_txc_dma4_page_handle;
   wire [31:0] 	  page0_mask_dma5;
   wire [31:0] 	  page0_value_dma5;
   wire [31:0] 	  page0_reloc_dma5;
   wire 	  page0_valid_dma5;
   wire [31:0] 	  page1_mask_dma5;
   wire [31:0] 	  page1_value_dma5;
   wire [31:0] 	  page1_reloc_dma5;
   wire 	  page1_valid_dma5;
   wire [19:0] 	  dmc_txc_dma5_page_handle;
   wire [31:0] 	  page0_mask_dma6;
   wire [31:0] 	  page0_value_dma6;
   wire [31:0] 	  page0_reloc_dma6;
   wire 	  page0_valid_dma6;
   wire [31:0] 	  page1_mask_dma6;
   wire [31:0] 	  page1_value_dma6;
   wire [31:0] 	  page1_reloc_dma6;
   wire 	  page1_valid_dma6;
   wire [19:0] 	  dmc_txc_dma6_page_handle;
   wire [31:0] 	  page0_mask_dma7;
   wire [31:0] 	  page0_value_dma7;
   wire [31:0] 	  page0_reloc_dma7;
   wire 	  page0_valid_dma7;
   wire [31:0] 	  page1_mask_dma7;
   wire [31:0] 	  page1_value_dma7;
   wire [31:0] 	  page1_reloc_dma7;
   wire 	  page1_valid_dma7;
   wire [19:0] 	  dmc_txc_dma7_page_handle;
   wire [31:0] 	  page0_mask_dma8;
   wire [31:0] 	  page0_value_dma8;
   wire [31:0] 	  page0_reloc_dma8;
   wire 	  page0_valid_dma8;
   wire [31:0] 	  page1_mask_dma8;
   wire [31:0] 	  page1_value_dma8;
   wire [31:0] 	  page1_reloc_dma8;
   wire 	  page1_valid_dma8;
   wire [19:0] 	  dmc_txc_dma8_page_handle;
   wire [31:0] 	  page0_mask_dma9;
   wire [31:0] 	  page0_value_dma9;
   wire [31:0] 	  page0_reloc_dma9;
   wire 	  page0_valid_dma9;
   wire [31:0] 	  page1_mask_dma9;
   wire [31:0] 	  page1_value_dma9;
   wire [31:0] 	  page1_reloc_dma9;
   wire 	  page1_valid_dma9;
   wire [19:0] 	  dmc_txc_dma9_page_handle;
   wire [31:0] 	  page0_mask_dma10;
   wire [31:0] 	  page0_value_dma10;
   wire [31:0] 	  page0_reloc_dma10;
   wire 	  page0_valid_dma10;
   wire [31:0] 	  page1_mask_dma10;
   wire [31:0] 	  page1_value_dma10;
   wire [31:0] 	  page1_reloc_dma10;
   wire 	  page1_valid_dma10;
   wire [19:0] 	  dmc_txc_dma10_page_handle;
   wire [31:0] 	  page0_mask_dma11;
   wire [31:0] 	  page0_value_dma11;
   wire [31:0] 	  page0_reloc_dma11;
   wire 	  page0_valid_dma11;
   wire [31:0] 	  page1_mask_dma11;
   wire [31:0] 	  page1_value_dma11;
   wire [31:0] 	  page1_reloc_dma11;
   wire 	  page1_valid_dma11;
   wire [19:0] 	  dmc_txc_dma11_page_handle;
   wire [31:0] 	  page0_mask_dma12;
   wire [31:0] 	  page0_value_dma12;
   wire [31:0] 	  page0_reloc_dma12;
   wire 	  page0_valid_dma12;
   wire [31:0] 	  page1_mask_dma12;
   wire [31:0] 	  page1_value_dma12;
   wire [31:0] 	  page1_reloc_dma12;
   wire 	  page1_valid_dma12;
   wire [19:0] 	  dmc_txc_dma12_page_handle;
   wire [31:0] 	  page0_mask_dma13;
   wire [31:0] 	  page0_value_dma13;
   wire [31:0] 	  page0_reloc_dma13;
   wire 	  page0_valid_dma13;
   wire [31:0] 	  page1_mask_dma13;
   wire [31:0] 	  page1_value_dma13;
   wire [31:0] 	  page1_reloc_dma13;
   wire 	  page1_valid_dma13;
   wire [19:0] 	  dmc_txc_dma13_page_handle;
   wire [31:0] 	  page0_mask_dma14;
   wire [31:0] 	  page0_value_dma14;
   wire [31:0] 	  page0_reloc_dma14;
   wire 	  page0_valid_dma14;
   wire [31:0] 	  page1_mask_dma14;
   wire [31:0] 	  page1_value_dma14;
   wire [31:0] 	  page1_reloc_dma14;
   wire 	  page1_valid_dma14;
   wire [19:0] 	  dmc_txc_dma14_page_handle;
   wire [31:0] 	  page0_mask_dma15;
   wire [31:0] 	  page0_value_dma15;
   wire [31:0] 	  page0_reloc_dma15;
   wire 	  page0_valid_dma15;
   wire [31:0] 	  page1_mask_dma15;
   wire [31:0] 	  page1_value_dma15;
   wire [31:0] 	  page1_reloc_dma15;
   wire 	  page1_valid_dma15;
   wire [19:0] 	  dmc_txc_dma15_page_handle;
`ifdef NEPTUNE
   
   wire [31:0] 	  page0_mask_dma16;
   wire [31:0] 	  page0_value_dma16;
   wire [31:0] 	  page0_reloc_dma16;
   wire 	  page0_valid_dma16;
   wire [31:0] 	  page1_mask_dma16;
   wire [31:0] 	  page1_value_dma16;
   wire [31:0] 	  page1_reloc_dma16;
   wire 	  page1_valid_dma16;
   wire [19:0] 	  dmc_txc_dma16_page_handle;
   wire [31:0] 	  page0_mask_dma17;
   wire [31:0] 	  page0_value_dma17;
   wire [31:0] 	  page0_reloc_dma17;
   wire 	  page0_valid_dma17;
   wire [31:0] 	  page1_mask_dma17;
   wire [31:0] 	  page1_value_dma17;
   wire [31:0] 	  page1_reloc_dma17;
   wire 	  page1_valid_dma17;
   wire [19:0] 	  dmc_txc_dma17_page_handle;
   wire [31:0] 	  page0_mask_dma18;
   wire [31:0] 	  page0_value_dma18;
   wire [31:0] 	  page0_reloc_dma18;
   wire 	  page0_valid_dma18;
   wire [31:0] 	  page1_mask_dma18;
   wire [31:0] 	  page1_value_dma18;
   wire [31:0] 	  page1_reloc_dma18;
   wire 	  page1_valid_dma18;
   wire [19:0] 	  dmc_txc_dma18_page_handle;
   wire [31:0] 	  page0_mask_dma19;
   wire [31:0] 	  page0_value_dma19;
   wire [31:0] 	  page0_reloc_dma19;
   wire 	  page0_valid_dma19;
   wire [31:0] 	  page1_mask_dma19;
   wire [31:0] 	  page1_value_dma19;
   wire [31:0] 	  page1_reloc_dma19;
   wire 	  page1_valid_dma19;
   wire [19:0] 	  dmc_txc_dma19_page_handle;
   wire [31:0] 	  page0_mask_dma20;
   wire [31:0] 	  page0_value_dma20;
   wire [31:0] 	  page0_reloc_dma20;
   wire 	  page0_valid_dma20;
   wire [31:0] 	  page1_mask_dma20;
   wire [31:0] 	  page1_value_dma20;
   wire [31:0] 	  page1_reloc_dma20;
   wire 	  page1_valid_dma20;
   wire [19:0] 	  dmc_txc_dma20_page_handle;
   wire [31:0] 	  page0_mask_dma21;
   wire [31:0] 	  page0_value_dma21;
   wire [31:0] 	  page0_reloc_dma21;
   wire 	  page0_valid_dma21;
   wire [31:0] 	  page1_mask_dma21;
   wire [31:0] 	  page1_value_dma21;
   wire [31:0] 	  page1_reloc_dma21;
   wire 	  page1_valid_dma21;
   wire [19:0] 	  dmc_txc_dma21_page_handle;
   wire [31:0] 	  page0_mask_dma22;
   wire [31:0] 	  page0_value_dma22;
   wire [31:0] 	  page0_reloc_dma22;
   wire 	  page0_valid_dma22;
   wire [31:0] 	  page1_mask_dma22;
   wire [31:0] 	  page1_value_dma22;
   wire [31:0] 	  page1_reloc_dma22;
   wire 	  page1_valid_dma22;
   wire [19:0] 	  dmc_txc_dma22_page_handle;
   wire [31:0] 	  page0_mask_dma23;
   wire [31:0] 	  page0_value_dma23;
   wire [31:0] 	  page0_reloc_dma23;
   wire 	  page0_valid_dma23;
   wire [31:0] 	  page1_mask_dma23;
   wire [31:0] 	  page1_value_dma23;
   wire [31:0] 	  page1_reloc_dma23;
   wire 	  page1_valid_dma23;
   wire [19:0] 	  dmc_txc_dma23_page_handle;
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
		       
   



   wire 	  write_FZC_DMA0_Register ;
   wire 	  write_FZC_DMA1_Register ;
   wire 	  write_FZC_DMA2_Register ;
   wire 	  write_FZC_DMA3_Register ;
   wire 	  write_FZC_DMA4_Register ;
   wire 	  write_FZC_DMA5_Register ;
   wire 	  write_FZC_DMA6_Register ;
   wire 	  write_FZC_DMA7_Register ;
   wire 	  write_FZC_DMA8_Register ;
   wire 	  write_FZC_DMA9_Register ;
   wire 	  write_FZC_DMA10_Register ;
   wire 	  write_FZC_DMA11_Register ;
   wire 	  write_FZC_DMA12_Register ;
   wire 	  write_FZC_DMA13_Register ;
   wire 	  write_FZC_DMA14_Register ;
   wire 	  write_FZC_DMA15_Register ;
`ifdef NEPTUNE
   wire 	  write_FZC_DMA16_Register ;
   wire 	  write_FZC_DMA17_Register ;
   wire 	  write_FZC_DMA18_Register ;
   wire 	  write_FZC_DMA19_Register ;
   wire 	  write_FZC_DMA20_Register ;
   wire 	  write_FZC_DMA21_Register ;
   wire 	  write_FZC_DMA22_Register ;
   wire 	  write_FZC_DMA23_Register ;
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
   



   // mailbox related wires
   
   wire [63:0] 	  tx_cs_dma0;
   wire [63:0] 	  tx_dma0_pre_st;
   wire [63:0] 	  tx_dma0_rng_err_logh; 
   wire [63:0] 	  tx_dma0_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma1;
   wire [63:0] 	  tx_dma1_pre_st;
   wire [63:0] 	  tx_dma1_rng_err_logh; 
   wire [63:0] 	  tx_dma1_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma2;
   wire [63:0] 	  tx_dma2_pre_st;
   wire [63:0] 	  tx_dma2_rng_err_logh; 
   wire [63:0] 	  tx_dma2_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma3;
   wire [63:0] 	  tx_dma3_pre_st;
   wire [63:0] 	  tx_dma3_rng_err_logh; 
   wire [63:0] 	  tx_dma3_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma4;
   wire [63:0] 	  tx_dma4_pre_st;
   wire [63:0] 	  tx_dma4_rng_err_logh; 
   wire [63:0] 	  tx_dma4_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma5;
   wire [63:0] 	  tx_dma5_pre_st;
   wire [63:0] 	  tx_dma5_rng_err_logh; 
   wire [63:0] 	  tx_dma5_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma6;
   wire [63:0] 	  tx_dma6_pre_st;
   wire [63:0] 	  tx_dma6_rng_err_logh; 
   wire [63:0] 	  tx_dma6_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma7;
   wire [63:0] 	  tx_dma7_pre_st;
   wire [63:0] 	  tx_dma7_rng_err_logh; 
   wire [63:0] 	  tx_dma7_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma8;
   wire [63:0] 	  tx_dma8_pre_st;
   wire [63:0] 	  tx_dma8_rng_err_logh; 
   wire [63:0] 	  tx_dma8_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma9;
   wire [63:0] 	  tx_dma9_pre_st;
   wire [63:0] 	  tx_dma9_rng_err_logh; 
   wire [63:0] 	  tx_dma9_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma10;
   wire [63:0] 	  tx_dma10_pre_st;
   wire [63:0] 	  tx_dma10_rng_err_logh; 
   wire [63:0] 	  tx_dma10_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma11;
   wire [63:0] 	  tx_dma11_pre_st;
   wire [63:0] 	  tx_dma11_rng_err_logh; 
   wire [63:0] 	  tx_dma11_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma12;
   wire [63:0] 	  tx_dma12_pre_st;
   wire [63:0] 	  tx_dma12_rng_err_logh; 
   wire [63:0] 	  tx_dma12_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma13;
   wire [63:0] 	  tx_dma13_pre_st;
   wire [63:0] 	  tx_dma13_rng_err_logh; 
   wire [63:0] 	  tx_dma13_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma14;
   wire [63:0] 	  tx_dma14_pre_st;
   wire [63:0] 	  tx_dma14_rng_err_logh; 
   wire [63:0] 	  tx_dma14_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma15;
   wire [63:0] 	  tx_dma15_pre_st;
   wire [63:0] 	  tx_dma15_rng_err_logh; 
   wire [63:0] 	  tx_dma15_rng_err_logl; 
`ifdef NEPTUNE
   
   wire [63:0] 	  tx_cs_dma16;
   wire [63:0] 	  tx_dma16_pre_st;
   wire [63:0] 	  tx_dma16_rng_err_logh; 
   wire [63:0] 	  tx_dma16_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma17;
   wire [63:0] 	  tx_dma17_pre_st;
   wire [63:0] 	  tx_dma17_rng_err_logh; 
   wire [63:0] 	  tx_dma17_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma18;
   wire [63:0] 	  tx_dma18_pre_st;
   wire [63:0] 	  tx_dma18_rng_err_logh; 
   wire [63:0] 	  tx_dma18_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma19;
   wire [63:0] 	  tx_dma19_pre_st;
   wire [63:0] 	  tx_dma19_rng_err_logh; 
   wire [63:0] 	  tx_dma19_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma20;
   wire [63:0] 	  tx_dma20_pre_st;
   wire [63:0] 	  tx_dma20_rng_err_logh; 
   wire [63:0] 	  tx_dma20_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma21;
   wire [63:0] 	  tx_dma21_pre_st;
   wire [63:0] 	  tx_dma21_rng_err_logh; 
   wire [63:0] 	  tx_dma21_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma22;
   wire [63:0] 	  tx_dma22_pre_st;
   wire [63:0] 	  tx_dma22_rng_err_logh; 
   wire [63:0] 	  tx_dma22_rng_err_logl; 
   wire [63:0] 	  tx_cs_dma23;
   wire [63:0] 	  tx_dma23_pre_st;
   wire [63:0] 	  tx_dma23_rng_err_logh; 
   wire [63:0] 	  tx_dma23_rng_err_logl; 

`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
		       
   


   wire 	  tx_cfg_dma0_enable_mb;
   wire 	  tx_cfg_dma0_mk;
   wire 	  tx_cfg_dma0_mmk;
   wire 	  tx_cfg_dma1_enable_mb;
   wire 	  tx_cfg_dma1_mk;
   wire 	  tx_cfg_dma1_mmk;
   wire 	  tx_cfg_dma2_enable_mb;
   wire 	  tx_cfg_dma2_mk;
   wire 	  tx_cfg_dma2_mmk;
   wire 	  tx_cfg_dma3_enable_mb;
   wire 	  tx_cfg_dma3_mk;
   wire 	  tx_cfg_dma3_mmk;
   wire 	  tx_cfg_dma4_enable_mb;
   wire 	  tx_cfg_dma4_mk;
   wire 	  tx_cfg_dma4_mmk;
   wire 	  tx_cfg_dma5_enable_mb;
   wire 	  tx_cfg_dma5_mk;
   wire 	  tx_cfg_dma5_mmk;
   wire 	  tx_cfg_dma6_enable_mb;
   wire 	  tx_cfg_dma6_mk;
   wire 	  tx_cfg_dma6_mmk;
   wire 	  tx_cfg_dma7_enable_mb;
   wire 	  tx_cfg_dma7_mk;
   wire 	  tx_cfg_dma7_mmk;
   wire 	  tx_cfg_dma8_enable_mb;
   wire 	  tx_cfg_dma8_mk;
   wire 	  tx_cfg_dma8_mmk;
   wire 	  tx_cfg_dma9_enable_mb;
   wire 	  tx_cfg_dma9_mk;
   wire 	  tx_cfg_dma9_mmk;
   wire 	  tx_cfg_dma10_enable_mb;
   wire 	  tx_cfg_dma10_mk;
   wire 	  tx_cfg_dma10_mmk;
   wire 	  tx_cfg_dma11_enable_mb;
   wire 	  tx_cfg_dma11_mk;
   wire 	  tx_cfg_dma11_mmk;
   wire 	  tx_cfg_dma12_enable_mb;
   wire 	  tx_cfg_dma12_mk;
   wire 	  tx_cfg_dma12_mmk;
   wire 	  tx_cfg_dma13_enable_mb;
   wire 	  tx_cfg_dma13_mk;
   wire 	  tx_cfg_dma13_mmk;
   wire 	  tx_cfg_dma14_enable_mb;
   wire 	  tx_cfg_dma14_mk;
   wire 	  tx_cfg_dma14_mmk;
   wire 	  tx_cfg_dma15_enable_mb;
   wire 	  tx_cfg_dma15_mk;
   wire 	  tx_cfg_dma15_mmk;
`ifdef NEPTUNE
   
   wire 	  tx_cfg_dma16_enable_mb;
   wire 	  tx_cfg_dma16_mk;
   wire 	  tx_cfg_dma16_mmk;
   wire 	  tx_cfg_dma17_enable_mb;
   wire 	  tx_cfg_dma17_mk;
   wire 	  tx_cfg_dma17_mmk;
   wire 	  tx_cfg_dma18_enable_mb;
   wire 	  tx_cfg_dma18_mk;
   wire 	  tx_cfg_dma18_mmk;
   wire 	  tx_cfg_dma19_enable_mb;
   wire 	  tx_cfg_dma19_mk;
   wire 	  tx_cfg_dma19_mmk;
   wire 	  tx_cfg_dma20_enable_mb;
   wire 	  tx_cfg_dma20_mk;
   wire 	  tx_cfg_dma20_mmk;
   wire 	  tx_cfg_dma21_enable_mb;
   wire 	  tx_cfg_dma21_mk;
   wire 	  tx_cfg_dma21_mmk;
   wire 	  tx_cfg_dma22_enable_mb;
   wire 	  tx_cfg_dma22_mk;
   wire 	  tx_cfg_dma22_mmk;
   wire 	  tx_cfg_dma23_enable_mb;
   wire 	  tx_cfg_dma23_mk;
   wire 	  tx_cfg_dma23_mmk;

`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
		       
   


   wire [63:0] 	  dma_0_3_sl_data;
   wire [63:0] 	  dma_4_7_sl_data;
   wire [63:0] 	  dma_8_11_sl_data;
   wire [63:0] 	  dma_12_15_sl_data;
   wire           read_decode_invalid_dma0_3;
   wire           read_decode_invalid_dma4_7;
   wire           read_decode_invalid_dma8_11;
   wire           read_decode_invalid_dma12_15;
`ifdef NEPTUNE
   
   wire [63:0] 	  dma_16_19_sl_data;
   wire [63:0] 	  dma_20_23_sl_data;
   wire           read_decode_invalid_dma16_19;
   wire           read_decode_invalid_dma20_23;
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
		       
   

   wire [7:0] 	  read_DMA_0_3_Regsister;
   wire [7:0] 	  read_DMA_4_7_Regsister;
   wire [7:0] 	  read_DMA_8_11_Regsister;
   wire [7:0] 	  read_DMA_12_15_Regsister;
`ifdef NEPTUNE
   wire [7:0] 	  read_DMA_16_19_Regsister;
   wire [7:0] 	  read_DMA_20_23_Regsister;
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
   
   

   wire [63:0] 	  tdmc_pio_intr;
   wire [31:0] 	  parity_corrupt_config;
   /*--------------------------------------------------------------*/
   // Parameters and Defines
   /*--------------------------------------------------------------*/

   /*--------------------------------------------------------------*/
   // Zero In Checks
   /*--------------------------------------------------------------*/


   
   niu_tdmc_piodecodes niu_tdmc_piodecodes(/*AUTOJUNK*/
					   // Outputs
					   .debug_select(debug_select[5:0]),
					   .training_vector(training_vector[31:0]),
					   .parity_corrupt_config(parity_corrupt_config[31:0]),
					   .tdmc_pio_ack(tdmc_pio_ack),
					   .tdmc_pio_err(tdmc_pio_err),
					   .tdmc_pio_rdata(tdmc_pio_rdata[63:0]),

					   .Slave_Read_dma0_3(Slave_Read_dma0_3),
					   .Slave_Sel_dma0_3(Slave_Sel_dma0_3),
					   .Slave_Addr_dma0_3(Slave_Addr_dma0_3[19:0]),
					   .pio_clients_32b_d_dma0_3(pio_clients_32b_d_dma0_3),
     
					   .Slave_Read_dma4_7(Slave_Read_dma4_7),
					   .Slave_Sel_dma4_7(Slave_Sel_dma4_7),
					   .Slave_Addr_dma4_7(Slave_Addr_dma4_7[19:0]),
					   .pio_clients_32b_d_dma4_7(pio_clients_32b_d_dma4_7),
					   
					   
					   .Slave_Read_dma8_11(Slave_Read_dma8_11),
					   .Slave_Sel_dma8_11(Slave_Sel_dma8_11),
					   .Slave_Addr_dma8_11(Slave_Addr_dma8_11[19:0]),
					   .pio_clients_32b_d_dma8_11(pio_clients_32b_d_dma8_11),
					   
					   
					   .Slave_Read_dma12_15(Slave_Read_dma12_15),
					   .Slave_Sel_dma12_15(Slave_Sel_dma12_15),
					   .Slave_Addr_dma12_15(Slave_Addr_dma12_15[19:0]),
					   .pio_clients_32b_d_dma12_15(pio_clients_32b_d_dma12_15),

					   .Slave_DataIn(Slave_DataIn[63:0]),
					   .slaveStrobe(slaveStrobe),
					   .write_DMA0_Register(write_DMA0_Register),
					   .write_DMA1_Register(write_DMA1_Register),
					   .write_DMA2_Register(write_DMA2_Register),
					   .write_DMA3_Register(write_DMA3_Register),
					   .write_DMA4_Register(write_DMA4_Register),
					   .write_DMA5_Register(write_DMA5_Register),
					   .write_DMA6_Register(write_DMA6_Register),
					   .write_DMA7_Register(write_DMA7_Register),
					   .write_DMA8_Register(write_DMA8_Register),
					   .write_DMA9_Register(write_DMA9_Register),
					   .write_DMA10_Register(write_DMA10_Register),
					   .write_DMA11_Register(write_DMA11_Register),
					   .write_DMA12_Register(write_DMA12_Register),
					   .write_DMA13_Register(write_DMA13_Register),
					   .write_DMA14_Register(write_DMA14_Register),
					   .write_DMA15_Register(write_DMA15_Register),
`ifdef NEPTUNE

					   .Slave_Read_dma16_19(Slave_Read_dma16_19),
					   .Slave_Sel_dma16_19(Slave_Sel_dma16_19),
					   .Slave_Addr_dma16_19(Slave_Addr_dma16_19[19:0]),
					   .pio_clients_32b_d_dma16_19(pio_clients_32b_d_dma16_19),

					   .Slave_Read_dma20_23(Slave_Read_dma20_23),
					   .Slave_Sel_dma20_23(Slave_Sel_dma20_23),
					   .Slave_Addr_dma20_23(Slave_Addr_dma20_23[19:0]),
					   .pio_clients_32b_d_dma20_23(pio_clients_32b_d_dma20_23),

					   .write_DMA16_Register(write_DMA16_Register),
					   .write_DMA17_Register(write_DMA17_Register),
					   .write_DMA18_Register(write_DMA18_Register),
					   .write_DMA19_Register(write_DMA19_Register),
					   .write_DMA20_Register(write_DMA20_Register),
					   .write_DMA21_Register(write_DMA21_Register),
					   .write_DMA22_Register(write_DMA22_Register),
					   .write_DMA23_Register(write_DMA23_Register),
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
					   
					   .write_FZC_DMA0_Register(write_FZC_DMA0_Register),
					   .write_FZC_DMA1_Register(write_FZC_DMA1_Register),
					   .write_FZC_DMA2_Register(write_FZC_DMA2_Register),
					   .write_FZC_DMA3_Register(write_FZC_DMA3_Register),
					   .write_FZC_DMA4_Register(write_FZC_DMA4_Register),
					   .write_FZC_DMA5_Register(write_FZC_DMA5_Register),
					   .write_FZC_DMA6_Register(write_FZC_DMA6_Register),
					   .write_FZC_DMA7_Register(write_FZC_DMA7_Register),
					   .write_FZC_DMA8_Register(write_FZC_DMA8_Register),
					   .write_FZC_DMA9_Register(write_FZC_DMA9_Register),
					   .write_FZC_DMA10_Register(write_FZC_DMA10_Register),
					   .write_FZC_DMA11_Register(write_FZC_DMA11_Register),
					   .write_FZC_DMA12_Register(write_FZC_DMA12_Register),
					   .write_FZC_DMA13_Register(write_FZC_DMA13_Register),
					   .write_FZC_DMA14_Register(write_FZC_DMA14_Register),
					   .write_FZC_DMA15_Register(write_FZC_DMA15_Register),
`ifdef NEPTUNE
					   .write_FZC_DMA16_Register(write_FZC_DMA16_Register),
					   .write_FZC_DMA17_Register(write_FZC_DMA17_Register),
					   .write_FZC_DMA18_Register(write_FZC_DMA18_Register),
					   .write_FZC_DMA19_Register(write_FZC_DMA19_Register),
					   .write_FZC_DMA20_Register(write_FZC_DMA20_Register),
					   .write_FZC_DMA21_Register(write_FZC_DMA21_Register),
					   .write_FZC_DMA22_Register(write_FZC_DMA22_Register),
					   .write_FZC_DMA23_Register(write_FZC_DMA23_Register),
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
					   
					   .read_DMA_0_3_Regsister(read_DMA_0_3_Regsister[7:0]),
					   .read_DMA_4_7_Regsister(read_DMA_4_7_Regsister[7:0]),
					   .read_DMA_8_11_Regsister(read_DMA_8_11_Regsister[7:0]),
					   .read_DMA_12_15_Regsister(read_DMA_12_15_Regsister[7:0]),
`ifdef NEPTUNE
					   .read_DMA_16_19_Regsister(read_DMA_16_19_Regsister[7:0]),
					   .read_DMA_20_23_Regsister(read_DMA_20_23_Regsister[7:0]),
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
					   
					   .dmc_txc_tx_addr_md(dmc_txc_tx_addr_md),
					   // Inputs
					   .SysClk(SysClk),
					   .Reset_L(Reset_L),
					   .pio_clients_rd(pio_clients_rd),
					   .pio_tdmc_sel(pio_tdmc_sel),
					   .pio_clients_addr(pio_clients_addr[19:0]),
					   .pio_clients_wdata(pio_clients_wdata[63:0]),
					   .pio_clients_32b(pio_clients_32b),
					   .dma_0_3_sl_data(dma_0_3_sl_data[63:0]),
					   .dma_4_7_sl_data(dma_4_7_sl_data[63:0]),
					   .dma_8_11_sl_data(dma_8_11_sl_data[63:0]),
					   .dma_12_15_sl_data(dma_12_15_sl_data[63:0]),
				           .read_decode_invalid_dma0_3(read_decode_invalid_dma0_3),
				           .read_decode_invalid_dma4_7(read_decode_invalid_dma4_7),
				           .read_decode_invalid_dma8_11(read_decode_invalid_dma8_11),
				           .read_decode_invalid_dma12_15(read_decode_invalid_dma12_15),
`ifdef NEPTUNE
					   
					   .dma_16_19_sl_data(dma_16_19_sl_data[63:0]),
					   .dma_20_23_sl_data(dma_20_23_sl_data[63:0]),
				           .read_decode_invalid_dma16_19(read_decode_invalid_dma16_19),
				           .read_decode_invalid_dma20_23(read_decode_invalid_dma20_23)
`else
					   .dma_16_19_sl_data(64'h0),
					   .dma_20_23_sl_data(64'h0),
				           .read_decode_invalid_dma16_19(1'b0),
				           .read_decode_invalid_dma20_23(1'b0)
`endif
);
   



   









// Regsisters for DMAs 0 1 2 3

 niu_tdmc_dmaregs niu_tdmc_dmaregs_0_3 
				 (/*AUTOJUNK*/
				     // Outputs
			// DMA0 - PIORegs Outs 
				     .page0_mask_dma0(page0_mask_dma0[31:0]),
				     .page0_value_dma0(page0_value_dma0[31:0]),
				     .page0_reloc_dma0(page0_reloc_dma0[31:0]),
				     .page0_valid_dma0(page0_valid_dma0),
				     .page1_mask_dma0(page1_mask_dma0[31:0]),
				     .page1_value_dma0(page1_value_dma0[31:0]),
				     .page1_reloc_dma0(page1_reloc_dma0[31:0]),
				     .page1_valid_dma0(page1_valid_dma0),
				     .dmc_txc_dma0_page_handle(dmc_txc_dma0_page_handle[19:0]),
				     .dmc_txc_dma0_func_num(dmc_txc_dma0_func_num[1:0]),
				     .tx_rng_cfg_dma0_len(tx_rng_cfg_dma0_len[`RNG_LENGTH_WIDTH -1 :0]),
				     .tx_rng_cfg_dma0_staddr(tx_rng_cfg_dma0_staddr[37:0]),
				     .tx_rng_tail_dma0(tx_rng_tail_dma0[`PTR_WIDTH :0]),
				     .tx_dma_cfg_dma0_rst(tx_dma_cfg_dma0_rst),
				     .tx_dma_cfg_dma0_stop(tx_dma_cfg_dma0_stop),	
				     .tx_dma_cfg_dma0_stall(tx_dma_cfg_dma0_stall),
				     .tx_dma_cfg_dma0_mbaddr(tx_dma_cfg_dma0_mbaddr[37:0]),
				     .tx_cfg_dma0_enable_mb(tx_cfg_dma0_enable_mb),
				     .tx_cfg_dma0_mk(tx_cfg_dma0_mk),
				     .tx_cfg_dma0_mmk(tx_cfg_dma0_mmk),
				     .tx_cs_dma0(tx_cs_dma0[63:0]),
				     .tx_dma0_pre_st(tx_dma0_pre_st[63:0]),
				     .tx_dma0_rng_err_logh(tx_dma0_rng_err_logh[63:0]),
				     .tx_dma0_rng_err_logl(tx_dma0_rng_err_logl[63:0]),
			             .intr_ldf0_dma0( tdmc_pio_intr[0] ),		
			             .intr_ldf1_dma0( tdmc_pio_intr[32] ),		


			// DMA1 - PIORegs Outs
                                     .page0_mask_dma1(page0_mask_dma1[31:0]),
                                     .page0_value_dma1(page0_value_dma1[31:0]),
                                     .page0_reloc_dma1(page0_reloc_dma1[31:0]),
                                     .page0_valid_dma1(page0_valid_dma1),
                                     .page1_mask_dma1(page1_mask_dma1[31:0]),
                                     .page1_value_dma1(page1_value_dma1[31:0]),
                                     .page1_reloc_dma1(page1_reloc_dma1[31:0]),
                                     .page1_valid_dma1(page1_valid_dma1),
                                     .dmc_txc_dma1_page_handle(dmc_txc_dma1_page_handle[19:0]),
				     .dmc_txc_dma1_func_num(dmc_txc_dma1_func_num[1:0]),
                                     .tx_rng_cfg_dma1_len(tx_rng_cfg_dma1_len[`RNG_LENGTH_WIDTH -1 :0]),
                                     .tx_rng_cfg_dma1_staddr(tx_rng_cfg_dma1_staddr[37:0]),
                                     .tx_rng_tail_dma1(tx_rng_tail_dma1[`PTR_WIDTH :0]),
                                     .tx_dma_cfg_dma1_rst(tx_dma_cfg_dma1_rst),
				     .tx_dma_cfg_dma1_stop(tx_dma_cfg_dma1_stop),	
                                     .tx_dma_cfg_dma1_stall(tx_dma_cfg_dma1_stall),
                                     .tx_dma_cfg_dma1_mbaddr(tx_dma_cfg_dma1_mbaddr[37:0]),
                                     .tx_cfg_dma1_enable_mb(tx_cfg_dma1_enable_mb),
                                     .tx_cfg_dma1_mk(tx_cfg_dma1_mk),
                                     .tx_cfg_dma1_mmk(tx_cfg_dma1_mmk),
                                     .tx_cs_dma1(tx_cs_dma1[63:0]),
                                     .tx_dma1_pre_st(tx_dma1_pre_st[63:0]),
                                     .tx_dma1_rng_err_logh(tx_dma1_rng_err_logh[63:0]),
                                     .tx_dma1_rng_err_logl(tx_dma1_rng_err_logl[63:0]),
			             .intr_ldf0_dma1( tdmc_pio_intr[1] ),		
			             .intr_ldf1_dma1( tdmc_pio_intr[33] ),		

                        // DMA2 - PIORegs Outs
                                     .page0_mask_dma2(page0_mask_dma2[31:0]),
                                     .page0_value_dma2(page0_value_dma2[31:0]),
                                     .page0_reloc_dma2(page0_reloc_dma2[31:0]),
                                     .page0_valid_dma2(page0_valid_dma2),
                                     .page1_mask_dma2(page1_mask_dma2[31:0]),
                                     .page1_value_dma2(page1_value_dma2[31:0]),
                                     .page1_reloc_dma2(page1_reloc_dma2[31:0]),
                                     .page1_valid_dma2(page1_valid_dma2),
                                     .dmc_txc_dma2_page_handle(dmc_txc_dma2_page_handle[19:0]),
				     .dmc_txc_dma2_func_num(dmc_txc_dma2_func_num[1:0]),
                                     .tx_rng_cfg_dma2_len(tx_rng_cfg_dma2_len[`RNG_LENGTH_WIDTH -1 :0]),
                                     .tx_rng_cfg_dma2_staddr(tx_rng_cfg_dma2_staddr[37:0]),
                                     .tx_rng_tail_dma2(tx_rng_tail_dma2[`PTR_WIDTH :0]),
                                     .tx_dma_cfg_dma2_rst(tx_dma_cfg_dma2_rst),
				     .tx_dma_cfg_dma2_stop(tx_dma_cfg_dma2_stop),	
                                     .tx_dma_cfg_dma2_stall(tx_dma_cfg_dma2_stall),
                                     .tx_dma_cfg_dma2_mbaddr(tx_dma_cfg_dma2_mbaddr[37:0]),
                                     .tx_cfg_dma2_enable_mb(tx_cfg_dma2_enable_mb),
                                     .tx_cfg_dma2_mk(tx_cfg_dma2_mk),
                                     .tx_cfg_dma2_mmk(tx_cfg_dma2_mmk),
                                     .tx_cs_dma2(tx_cs_dma2[63:0]),
                                     .tx_dma2_pre_st(tx_dma2_pre_st[63:0]),
                                     .tx_dma2_rng_err_logh(tx_dma2_rng_err_logh[63:0]),
                                     .tx_dma2_rng_err_logl(tx_dma2_rng_err_logl[63:0]),
			             .intr_ldf0_dma2( tdmc_pio_intr[2] ),		
			             .intr_ldf1_dma2( tdmc_pio_intr[34] ),		

                        // DMA3 - PIORegs Outs
                                     .page0_mask_dma3(page0_mask_dma3[31:0]),
                                     .page0_value_dma3(page0_value_dma3[31:0]),
                                     .page0_reloc_dma3(page0_reloc_dma3[31:0]),
                                     .page0_valid_dma3(page0_valid_dma3),
                                     .page1_mask_dma3(page1_mask_dma3[31:0]),
                                     .page1_value_dma3(page1_value_dma3[31:0]),
                                     .page1_reloc_dma3(page1_reloc_dma3[31:0]),
                                     .page1_valid_dma3(page1_valid_dma3),
                                     .dmc_txc_dma3_page_handle(dmc_txc_dma3_page_handle[19:0]),
				     .dmc_txc_dma3_func_num(dmc_txc_dma3_func_num[1:0]),
                                     .tx_rng_cfg_dma3_len(tx_rng_cfg_dma3_len[`RNG_LENGTH_WIDTH -1 :0]),
                                     .tx_rng_cfg_dma3_staddr(tx_rng_cfg_dma3_staddr[37:0]),
                                     .tx_rng_tail_dma3(tx_rng_tail_dma3[`PTR_WIDTH :0]),
                                     .tx_dma_cfg_dma3_rst(tx_dma_cfg_dma3_rst),
				     .tx_dma_cfg_dma3_stop(tx_dma_cfg_dma3_stop),	
                                     .tx_dma_cfg_dma3_stall(tx_dma_cfg_dma3_stall),
                                     .tx_dma_cfg_dma3_mbaddr(tx_dma_cfg_dma3_mbaddr[37:0]),
                                     .tx_cfg_dma3_enable_mb(tx_cfg_dma3_enable_mb),
                                     .tx_cfg_dma3_mk(tx_cfg_dma3_mk),
                                     .tx_cfg_dma3_mmk(tx_cfg_dma3_mmk),
                                     .tx_cs_dma3(tx_cs_dma3[63:0]),
                                     .tx_dma3_pre_st(tx_dma3_pre_st[63:0]),
                                     .tx_dma3_rng_err_logh(tx_dma3_rng_err_logh[63:0]),
                                     .tx_dma3_rng_err_logl(tx_dma3_rng_err_logl[63:0]),
			             .intr_ldf0_dma3( tdmc_pio_intr[3] ),		
			             .intr_ldf1_dma3( tdmc_pio_intr[35] ),		
					
                                     .dma_0_3_sl_data(dma_0_3_sl_data),
				     .read_decode_invalid_dma0_3(read_decode_invalid_dma0_3),
				  .dmc_txc_dma0_error ( dmc_txc_dma0_error),
				  .dmc_txc_dma1_error( dmc_txc_dma1_error),
				  .dmc_txc_dma2_error( dmc_txc_dma2_error),
				  .dmc_txc_dma3_error( dmc_txc_dma3_error),
				  

				     // Inputs
				     .SysClk(SysClk),
				     .Reset_L(Reset_L),
				     .Slave_Read(Slave_Read_dma0_3),
				     .Slave_Sel(Slave_Sel_dma0_3),
				     .Slave_Addr(Slave_Addr_dma0_3[19:0]),
				     .Slave_DataIn(Slave_DataIn[63:0]),
				     .slaveStrobe(slaveStrobe),
				     .pio_clients_32b(pio_clients_32b_d_dma0_3),	

				     .write_DMA0_Register(write_DMA0_Register),
				     .write_DMA1_Register(write_DMA1_Register),
				     .write_DMA2_Register(write_DMA2_Register),
				     .write_DMA3_Register(write_DMA3_Register),
				     .write_FZC_DMA0_Register(write_FZC_DMA0_Register),
				     .write_FZC_DMA1_Register(write_FZC_DMA1_Register),
				     .write_FZC_DMA2_Register(write_FZC_DMA2_Register),
				     .write_FZC_DMA3_Register(write_FZC_DMA3_Register),
				     .read_DMA_0_3_Regsister(read_DMA_0_3_Regsister[7:0]),
				

				     .txc_dmc_nack_pkt_rd_addr(txc_dmc_nack_pkt_rd_addr),
                                     .txc_dmc_p0_pkt_size_err_addr(txc_dmc_p0_pkt_size_err_addr),
                                     .txc_dmc_p0_pkt_size_err(txc_dmc_p0_pkt_size_err),
                                     .txc_dmc_nack_pkt_rd(txc_dmc_nack_pkt_rd),
                                     .txc_dmc_p1_pkt_size_err_addr(txc_dmc_p1_pkt_size_err_addr),
                                     .txc_dmc_p1_pkt_size_err(txc_dmc_p1_pkt_size_err),
                                     .txc_dmc_p2_pkt_size_err_addr(txc_dmc_p2_pkt_size_err_addr),
                                     .txc_dmc_p2_pkt_size_err(txc_dmc_p2_pkt_size_err),
                                     .txc_dmc_p3_pkt_size_err_addr(txc_dmc_p3_pkt_size_err_addr),
                                     .txc_dmc_p3_pkt_size_err(txc_dmc_p3_pkt_size_err),

				      .txc_dmc_dma0_inc_pkt_cnt(txc_dmc_dma0_inc_pkt_cnt),
				      .txc_dmc_dma0_mark_bit(txc_dmc_dma0_mark_bit),
                                      .txc_dmc_dma1_inc_pkt_cnt(txc_dmc_dma1_inc_pkt_cnt),
                                      .txc_dmc_dma1_mark_bit(txc_dmc_dma1_mark_bit),
                                      .txc_dmc_dma2_inc_pkt_cnt(txc_dmc_dma2_inc_pkt_cnt),
                                      .txc_dmc_dma2_mark_bit(txc_dmc_dma2_mark_bit),
                                      .txc_dmc_dma3_inc_pkt_cnt(txc_dmc_dma3_inc_pkt_cnt),
                                      .txc_dmc_dma3_mark_bit(txc_dmc_dma3_mark_bit),
				  
   				     .txpref_nack_resp(txpref_nack_resp),
   				     .txpref_nack_rd_addr(txpref_nack_rd_addr),
				     .mbox_err_received(mbox_err_received),



			// DMA0 - PIORegs Ins 
				     .tx_rng_head_dma0(tx_rng_head_dma0[`PTR_WIDTH :0]),
				     .dma0_clear_reset(dma0_clear_reset),
				     .set_cfg_dma0_mmk(set_cfg_dma0_mmk),
				     .set_cfg_dma0_mk(set_cfg_dma0_mk),
				     .clear_cfg_dma0_mb(clear_cfg_dma0_mb),

				     .set_pref_buf_par_err_dma0(set_pref_buf_par_err_dma0),
				     .set_pkt_part_err_dma0(set_pkt_part_err_dma0),
				     .pkt_part_error_address_dma0(pkt_part_error_address_dma0),
				     .set_conf_part_error_dma0(set_conf_part_error_dma0),
				     .set_tx_ring_oflow_dma0(set_tx_ring_oflow_dma0),
				     .set_mbox_part_error_dma0(set_mbox_part_error_dma[0]),

				     .txc_dmc_p0_dma0_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[0]),
                                     .txc_dmc_dma0_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[0]),
				     .txc_dmc_p1_dma0_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[0]),
				     .txc_dmc_p2_dma0_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[0]),
				     .txc_dmc_p3_dma0_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[0]),

			             .txpref_dma0_nack_resp(txpref_dma_nack_resp[0]),
				     .mbox_ack_dma0_err_received (mbox_ack_dma_err_received[0]),
				     .ShadowRingCurrentPtr_DMA0(ShadowRingCurrentPtr_DMA0),	
				     .tx_dma_cfg_dma0_stop_state(tx_dma_cfg_dma0_stop_state),

                        // DMA1 - PIORegs Ins
                                     .tx_rng_head_dma1(tx_rng_head_dma1[`PTR_WIDTH :0]),
                                     .dma1_clear_reset(dma1_clear_reset),
                                     .set_cfg_dma1_mmk(set_cfg_dma1_mmk),
                                     .set_cfg_dma1_mk(set_cfg_dma1_mk),
                                     .clear_cfg_dma1_mb(clear_cfg_dma1_mb),

				     .set_pref_buf_par_err_dma1(set_pref_buf_par_err_dma1),
				     .set_pkt_part_err_dma1(set_pkt_part_err_dma1),
				     .pkt_part_error_address_dma1(pkt_part_error_address_dma1),
				     .set_conf_part_error_dma1(set_conf_part_error_dma1),
				     .set_tx_ring_oflow_dma1(set_tx_ring_oflow_dma1),
				     .set_mbox_part_error_dma1(set_mbox_part_error_dma[1]),

				     .txc_dmc_p0_dma1_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[1]),
                                     .txc_dmc_dma1_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[1]),
				     .txc_dmc_p1_dma1_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[1]),
				     .txc_dmc_p2_dma1_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[1]),
				     .txc_dmc_p3_dma1_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[1]),
				  

			             .txpref_dma1_nack_resp(txpref_dma_nack_resp[1]),
				     .mbox_ack_dma1_err_received (mbox_ack_dma_err_received[1]),
				     .ShadowRingCurrentPtr_DMA1(ShadowRingCurrentPtr_DMA1),	
				     .tx_dma_cfg_dma1_stop_state(tx_dma_cfg_dma1_stop_state),

                        // DMA2 - PIORegs Ins
                                     .tx_rng_head_dma2(tx_rng_head_dma2[`PTR_WIDTH :0]),
                                     .dma2_clear_reset(dma2_clear_reset),
                                     .set_cfg_dma2_mmk(set_cfg_dma2_mmk),
                                     .set_cfg_dma2_mk(set_cfg_dma2_mk),
                                     .clear_cfg_dma2_mb(clear_cfg_dma2_mb),

				     .set_pref_buf_par_err_dma2(set_pref_buf_par_err_dma2),
				     .set_pkt_part_err_dma2(set_pkt_part_err_dma2),
				     .pkt_part_error_address_dma2(pkt_part_error_address_dma2),
				     .set_conf_part_error_dma2(set_conf_part_error_dma2),
				     .set_tx_ring_oflow_dma2(set_tx_ring_oflow_dma2),
				     .set_mbox_part_error_dma2(set_mbox_part_error_dma[2]),


				  .txc_dmc_p0_dma2_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[2]),
                                     .txc_dmc_dma2_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[2]),
				     .txc_dmc_p1_dma2_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[2]),
				     .txc_dmc_p2_dma2_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[2]),
				     .txc_dmc_p3_dma2_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[2]),
				  
			             .txpref_dma2_nack_resp(txpref_dma_nack_resp[2]),
				     .mbox_ack_dma2_err_received (mbox_ack_dma_err_received[2]),
				     .ShadowRingCurrentPtr_DMA2(ShadowRingCurrentPtr_DMA2),	
				     .tx_dma_cfg_dma2_stop_state(tx_dma_cfg_dma2_stop_state),

                        // DMA3 - PIORegs Ins
                                     .tx_rng_head_dma3(tx_rng_head_dma3[`PTR_WIDTH :0]),
                                     .dma3_clear_reset(dma3_clear_reset),
                                     .set_cfg_dma3_mmk(set_cfg_dma3_mmk),
                                     .set_cfg_dma3_mk(set_cfg_dma3_mk),
                                     .clear_cfg_dma3_mb(clear_cfg_dma3_mb),

				     .set_pref_buf_par_err_dma3(set_pref_buf_par_err_dma3),
				     .set_pkt_part_err_dma3(set_pkt_part_err_dma3),
				     .pkt_part_error_address_dma3(pkt_part_error_address_dma3),
				     .set_conf_part_error_dma3(set_conf_part_error_dma3),
				     .set_tx_ring_oflow_dma3(set_tx_ring_oflow_dma3),
				     .set_mbox_part_error_dma3(set_mbox_part_error_dma[3]),

				     .txc_dmc_p0_dma3_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[3]),
                                     .txc_dmc_dma3_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[3]),
				     .txc_dmc_p1_dma3_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[3]),
				     .txc_dmc_p2_dma3_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[3]),
				     .txc_dmc_p3_dma3_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[3]),


				  
			             .txpref_dma3_nack_resp(txpref_dma_nack_resp[3]),
				     .mbox_ack_dma3_err_received (mbox_ack_dma_err_received[3]),
				     .ShadowRingCurrentPtr_DMA3(ShadowRingCurrentPtr_DMA3),
				     .tx_dma_cfg_dma3_stop_state(tx_dma_cfg_dma3_stop_state)

				     );



// Regsisters for DMAs 4 5 6 7

 niu_tdmc_dmaregs niu_tdmc_dmaregs_4_7 
				 (/*AUTOJUNK*/
				     // Outputs
			// DMA4 - PIORegs Outs 
				     .page0_mask_dma0(page0_mask_dma4[31:0]),
				     .page0_value_dma0(page0_value_dma4[31:0]),
				     .page0_reloc_dma0(page0_reloc_dma4[31:0]),
				     .page0_valid_dma0(page0_valid_dma4),
				     .page1_mask_dma0(page1_mask_dma4[31:0]),
				     .page1_value_dma0(page1_value_dma4[31:0]),
				     .page1_reloc_dma0(page1_reloc_dma4[31:0]),
				     .page1_valid_dma0(page1_valid_dma4),
				     .dmc_txc_dma0_page_handle(dmc_txc_dma4_page_handle[19:0]),
				     .dmc_txc_dma0_func_num(dmc_txc_dma4_func_num[1:0]),
				     .tx_rng_cfg_dma0_len(tx_rng_cfg_dma4_len[`RNG_LENGTH_WIDTH -1 :0]),
				     .tx_rng_cfg_dma0_staddr(tx_rng_cfg_dma4_staddr[37:0]),
				     .tx_rng_tail_dma0(tx_rng_tail_dma4[`PTR_WIDTH :0]),
				     .tx_dma_cfg_dma0_rst(tx_dma_cfg_dma4_rst),
				     .tx_dma_cfg_dma0_stop(tx_dma_cfg_dma4_stop),	
				     .tx_dma_cfg_dma0_stall(tx_dma_cfg_dma4_stall),
				     .tx_dma_cfg_dma0_mbaddr(tx_dma_cfg_dma4_mbaddr[37:0]),
				     .tx_cfg_dma0_enable_mb(tx_cfg_dma4_enable_mb),
				     .tx_cfg_dma0_mk(tx_cfg_dma4_mk),
				     .tx_cfg_dma0_mmk(tx_cfg_dma4_mmk),
				     .tx_cs_dma0(tx_cs_dma4[63:0]),
				     .tx_dma0_pre_st(tx_dma4_pre_st[63:0]),
				     .tx_dma0_rng_err_logh(tx_dma4_rng_err_logh[63:0]),
				     .tx_dma0_rng_err_logl(tx_dma4_rng_err_logl[63:0]),
			             .intr_ldf0_dma0( tdmc_pio_intr[4] ),		
			             .intr_ldf1_dma0( tdmc_pio_intr[36] ),		


			// DMA5 - PIORegs Outs
                                     .page0_mask_dma1(page0_mask_dma5[31:0]),
                                     .page0_value_dma1(page0_value_dma5[31:0]),
                                     .page0_reloc_dma1(page0_reloc_dma5[31:0]),
                                     .page0_valid_dma1(page0_valid_dma5),
                                     .page1_mask_dma1(page1_mask_dma5[31:0]),
                                     .page1_value_dma1(page1_value_dma5[31:0]),
                                     .page1_reloc_dma1(page1_reloc_dma5[31:0]),
                                     .page1_valid_dma1(page1_valid_dma5),
                                     .dmc_txc_dma1_page_handle(dmc_txc_dma5_page_handle[19:0]),
				     .dmc_txc_dma1_func_num(dmc_txc_dma5_func_num[1:0]),
                                     .tx_rng_cfg_dma1_len(tx_rng_cfg_dma5_len[`RNG_LENGTH_WIDTH -1 :0]),
                                     .tx_rng_cfg_dma1_staddr(tx_rng_cfg_dma5_staddr[37:0]),
                                     .tx_rng_tail_dma1(tx_rng_tail_dma5[`PTR_WIDTH :0]),
                                     .tx_dma_cfg_dma1_rst(tx_dma_cfg_dma5_rst),
				     .tx_dma_cfg_dma1_stop(tx_dma_cfg_dma5_stop),	
                                     .tx_dma_cfg_dma1_stall(tx_dma_cfg_dma5_stall),
                                     .tx_dma_cfg_dma1_mbaddr(tx_dma_cfg_dma5_mbaddr[37:0]),
                                     .tx_cfg_dma1_enable_mb(tx_cfg_dma5_enable_mb),
                                     .tx_cfg_dma1_mk(tx_cfg_dma5_mk),
                                     .tx_cfg_dma1_mmk(tx_cfg_dma5_mmk),
                                     .tx_cs_dma1(tx_cs_dma5[63:0]),
                                     .tx_dma1_pre_st(tx_dma5_pre_st[63:0]),
                                     .tx_dma1_rng_err_logh(tx_dma5_rng_err_logh[63:0]),
                                     .tx_dma1_rng_err_logl(tx_dma5_rng_err_logl[63:0]),
			             .intr_ldf0_dma1( tdmc_pio_intr[5] ),		
			             .intr_ldf1_dma1( tdmc_pio_intr[37] ),		

                        // DMA6 - PIORegs Outs
                                     .page0_mask_dma2(page0_mask_dma6[31:0]),
                                     .page0_value_dma2(page0_value_dma6[31:0]),
                                     .page0_reloc_dma2(page0_reloc_dma6[31:0]),
                                     .page0_valid_dma2(page0_valid_dma6),
                                     .page1_mask_dma2(page1_mask_dma6[31:0]),
                                     .page1_value_dma2(page1_value_dma6[31:0]),
                                     .page1_reloc_dma2(page1_reloc_dma6[31:0]),
                                     .page1_valid_dma2(page1_valid_dma6),
                                     .dmc_txc_dma2_page_handle(dmc_txc_dma6_page_handle[19:0]),
				     .dmc_txc_dma2_func_num(dmc_txc_dma6_func_num[1:0]),
                                     .tx_rng_cfg_dma2_len(tx_rng_cfg_dma6_len[`RNG_LENGTH_WIDTH -1 :0]),
                                     .tx_rng_cfg_dma2_staddr(tx_rng_cfg_dma6_staddr[37:0]),
                                     .tx_rng_tail_dma2(tx_rng_tail_dma6[`PTR_WIDTH :0]),
                                     .tx_dma_cfg_dma2_rst(tx_dma_cfg_dma6_rst),
				     .tx_dma_cfg_dma2_stop(tx_dma_cfg_dma6_stop),	
                                     .tx_dma_cfg_dma2_stall(tx_dma_cfg_dma6_stall),
                                     .tx_dma_cfg_dma2_mbaddr(tx_dma_cfg_dma6_mbaddr[37:0]),
                                     .tx_cfg_dma2_enable_mb(tx_cfg_dma6_enable_mb),
                                     .tx_cfg_dma2_mk(tx_cfg_dma6_mk),
                                     .tx_cfg_dma2_mmk(tx_cfg_dma6_mmk),
                                     .tx_cs_dma2(tx_cs_dma6[63:0]),
                                     .tx_dma2_pre_st(tx_dma6_pre_st[63:0]),
                                     .tx_dma2_rng_err_logh(tx_dma6_rng_err_logh[63:0]),
                                     .tx_dma2_rng_err_logl(tx_dma6_rng_err_logl[63:0]),
			             .intr_ldf0_dma2( tdmc_pio_intr[6] ),		
			             .intr_ldf1_dma2( tdmc_pio_intr[38] ),		

                        // DMA7 - PIORegs Outs
                                     .page0_mask_dma3(page0_mask_dma7[31:0]),
                                     .page0_value_dma3(page0_value_dma7[31:0]),
                                     .page0_reloc_dma3(page0_reloc_dma7[31:0]),
                                     .page0_valid_dma3(page0_valid_dma7),
                                     .page1_mask_dma3(page1_mask_dma7[31:0]),
                                     .page1_value_dma3(page1_value_dma7[31:0]),
                                     .page1_reloc_dma3(page1_reloc_dma7[31:0]),
                                     .page1_valid_dma3(page1_valid_dma7),
                                     .dmc_txc_dma3_page_handle(dmc_txc_dma7_page_handle[19:0]),
				     .dmc_txc_dma3_func_num(dmc_txc_dma7_func_num[1:0]),
                                     .tx_rng_cfg_dma3_len(tx_rng_cfg_dma7_len[`RNG_LENGTH_WIDTH -1 :0]),
                                     .tx_rng_cfg_dma3_staddr(tx_rng_cfg_dma7_staddr[37:0]),
                                     .tx_rng_tail_dma3(tx_rng_tail_dma7[`PTR_WIDTH :0]),
                                     .tx_dma_cfg_dma3_rst(tx_dma_cfg_dma7_rst),
				     .tx_dma_cfg_dma3_stop(tx_dma_cfg_dma7_stop),	
                                     .tx_dma_cfg_dma3_stall(tx_dma_cfg_dma7_stall),
                                     .tx_dma_cfg_dma3_mbaddr(tx_dma_cfg_dma7_mbaddr[37:0]),
                                     .tx_cfg_dma3_enable_mb(tx_cfg_dma7_enable_mb),
                                     .tx_cfg_dma3_mk(tx_cfg_dma7_mk),
                                     .tx_cfg_dma3_mmk(tx_cfg_dma7_mmk),
                                     .tx_cs_dma3(tx_cs_dma7[63:0]),
                                     .tx_dma3_pre_st(tx_dma7_pre_st[63:0]),
                                     .tx_dma3_rng_err_logh(tx_dma7_rng_err_logh[63:0]),
                                     .tx_dma3_rng_err_logl(tx_dma7_rng_err_logl[63:0]),
			             .intr_ldf0_dma3( tdmc_pio_intr[7] ),		
			             .intr_ldf1_dma3( tdmc_pio_intr[39] ),		
					
                                     .dma_0_3_sl_data(dma_4_7_sl_data),
				     .read_decode_invalid_dma0_3(read_decode_invalid_dma4_7),
				  .dmc_txc_dma0_error ( dmc_txc_dma4_error),
				  .dmc_txc_dma1_error( dmc_txc_dma5_error),
				  .dmc_txc_dma2_error( dmc_txc_dma6_error),
				  .dmc_txc_dma3_error( dmc_txc_dma7_error),
				  
				     // Inputs
				     .SysClk(SysClk),
				     .Reset_L(Reset_L),
				     .Slave_Read(Slave_Read_dma4_7),
				     .Slave_Sel(Slave_Sel_dma4_7),
				     .Slave_Addr(Slave_Addr_dma4_7[19:0]),
				     .Slave_DataIn(Slave_DataIn[63:0]),
				     .slaveStrobe(slaveStrobe),
				     .pio_clients_32b(pio_clients_32b_d_dma4_7),	

				     .write_DMA0_Register(write_DMA4_Register),
				     .write_DMA1_Register(write_DMA5_Register),
				     .write_DMA2_Register(write_DMA6_Register),
				     .write_DMA3_Register(write_DMA7_Register),
				     .write_FZC_DMA0_Register(write_FZC_DMA4_Register),
				     .write_FZC_DMA1_Register(write_FZC_DMA5_Register),
				     .write_FZC_DMA2_Register(write_FZC_DMA6_Register),
				     .write_FZC_DMA3_Register(write_FZC_DMA7_Register),
				     .read_DMA_0_3_Regsister(read_DMA_4_7_Regsister[7:0]),

				     .txc_dmc_nack_pkt_rd_addr(txc_dmc_nack_pkt_rd_addr),
                                     .txc_dmc_p0_pkt_size_err_addr(txc_dmc_p0_pkt_size_err_addr),
                                     .txc_dmc_p0_pkt_size_err(txc_dmc_p0_pkt_size_err),
                                     .txc_dmc_nack_pkt_rd(txc_dmc_nack_pkt_rd),
                                     .txc_dmc_p1_pkt_size_err_addr(txc_dmc_p1_pkt_size_err_addr),
                                     .txc_dmc_p1_pkt_size_err(txc_dmc_p1_pkt_size_err),
                                     .txc_dmc_p2_pkt_size_err_addr(txc_dmc_p2_pkt_size_err_addr),
                                     .txc_dmc_p2_pkt_size_err(txc_dmc_p2_pkt_size_err),
                                     .txc_dmc_p3_pkt_size_err_addr(txc_dmc_p3_pkt_size_err_addr),
                                     .txc_dmc_p3_pkt_size_err(txc_dmc_p3_pkt_size_err),

   				     .txpref_nack_resp(txpref_nack_resp),
   				     .txpref_nack_rd_addr(txpref_nack_rd_addr),
				     .mbox_err_received(mbox_err_received),

				     .txc_dmc_dma0_inc_pkt_cnt(txc_dmc_dma4_inc_pkt_cnt),
 				     .txc_dmc_dma0_mark_bit(txc_dmc_dma4_mark_bit),
 				     .txc_dmc_dma1_inc_pkt_cnt(txc_dmc_dma5_inc_pkt_cnt),
 				     .txc_dmc_dma1_mark_bit(txc_dmc_dma5_mark_bit),
 				     .txc_dmc_dma2_inc_pkt_cnt(txc_dmc_dma6_inc_pkt_cnt),
 				     .txc_dmc_dma2_mark_bit(txc_dmc_dma6_mark_bit),
 				     .txc_dmc_dma3_inc_pkt_cnt(txc_dmc_dma7_inc_pkt_cnt),
 				     .txc_dmc_dma3_mark_bit(txc_dmc_dma7_mark_bit),


			// DMA4 - PIORegs Ins 
				     .tx_rng_head_dma0(tx_rng_head_dma4[`PTR_WIDTH :0]),
				     .dma0_clear_reset(dma4_clear_reset),
				     .set_cfg_dma0_mmk(set_cfg_dma4_mmk),
				     .set_cfg_dma0_mk(set_cfg_dma4_mk),
				     .clear_cfg_dma0_mb(clear_cfg_dma4_mb),

				     .set_pref_buf_par_err_dma0(set_pref_buf_par_err_dma4),
				     .set_pkt_part_err_dma0(set_pkt_part_err_dma4),
				     .pkt_part_error_address_dma0(pkt_part_error_address_dma4),
				     .set_conf_part_error_dma0(set_conf_part_error_dma4),
				     .set_tx_ring_oflow_dma0(set_tx_ring_oflow_dma4),
				     .set_mbox_part_error_dma0(set_mbox_part_error_dma[4]),

                                     .txc_dmc_p0_dma0_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[4]),
                                     .txc_dmc_dma0_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[4]),
				     .txc_dmc_p1_dma0_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[4]),
				     .txc_dmc_p2_dma0_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[4]),
				     .txc_dmc_p3_dma0_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[4]),
			             .txpref_dma0_nack_resp(txpref_dma_nack_resp[4]),
				     .mbox_ack_dma0_err_received (mbox_ack_dma_err_received[4]),
				     .ShadowRingCurrentPtr_DMA0(ShadowRingCurrentPtr_DMA4),	
				     .tx_dma_cfg_dma0_stop_state(tx_dma_cfg_dma4_stop_state),

                        // DMA5 - PIORegs Ins
                                     .tx_rng_head_dma1(tx_rng_head_dma5[`PTR_WIDTH :0]),
                                     .dma1_clear_reset(dma5_clear_reset),
                                     .set_cfg_dma1_mmk(set_cfg_dma5_mmk),
                                     .set_cfg_dma1_mk(set_cfg_dma5_mk),
                                     .clear_cfg_dma1_mb(clear_cfg_dma5_mb),

				     .set_pref_buf_par_err_dma1(set_pref_buf_par_err_dma5),
				     .set_pkt_part_err_dma1(set_pkt_part_err_dma5),
				     .pkt_part_error_address_dma1(pkt_part_error_address_dma5),
				     .set_conf_part_error_dma1(set_conf_part_error_dma5),
				     .set_tx_ring_oflow_dma1(set_tx_ring_oflow_dma5),
				     .set_mbox_part_error_dma1(set_mbox_part_error_dma[5]),

                                     .txc_dmc_dma1_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[5]),

				     .txc_dmc_p0_dma1_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[5]),
				     .txc_dmc_p1_dma1_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[5]),
				     .txc_dmc_p2_dma1_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[5]),
				     .txc_dmc_p3_dma1_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[5]),
			             .txpref_dma1_nack_resp(txpref_dma_nack_resp[5]),
				     .mbox_ack_dma1_err_received (mbox_ack_dma_err_received[5]),
				     .ShadowRingCurrentPtr_DMA1(ShadowRingCurrentPtr_DMA5),	
				     .tx_dma_cfg_dma1_stop_state(tx_dma_cfg_dma5_stop_state),

                        // DMA6 - PIORegs Ins
                                     .tx_rng_head_dma2(tx_rng_head_dma6[`PTR_WIDTH :0]),
                                     .dma2_clear_reset(dma6_clear_reset),
                                     .set_cfg_dma2_mmk(set_cfg_dma6_mmk),
                                     .set_cfg_dma2_mk(set_cfg_dma6_mk),
                                     .clear_cfg_dma2_mb(clear_cfg_dma6_mb),

				     .set_pref_buf_par_err_dma2(set_pref_buf_par_err_dma6),
				     .set_pkt_part_err_dma2(set_pkt_part_err_dma6),
				     .pkt_part_error_address_dma2(pkt_part_error_address_dma6),
				     .set_conf_part_error_dma2(set_conf_part_error_dma6),
				     .set_tx_ring_oflow_dma2(set_tx_ring_oflow_dma6),
				     .set_mbox_part_error_dma2(set_mbox_part_error_dma[6]),
				     .txc_dmc_dma2_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[6]),
				     .txc_dmc_p0_dma2_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[6]),
				     .txc_dmc_p1_dma2_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[6]),
				     .txc_dmc_p2_dma2_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[6]),
				     .txc_dmc_p3_dma2_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[6]),
				  

			             .txpref_dma2_nack_resp(txpref_dma_nack_resp[6]),
				     .mbox_ack_dma2_err_received (mbox_ack_dma_err_received[6]),
				     .ShadowRingCurrentPtr_DMA2(ShadowRingCurrentPtr_DMA6),	
				     .tx_dma_cfg_dma2_stop_state(tx_dma_cfg_dma6_stop_state),

                        // DMA7 - PIORegs Ins
                                     .tx_rng_head_dma3(tx_rng_head_dma7[`PTR_WIDTH :0]),
                                     .dma3_clear_reset(dma7_clear_reset),
                                     .set_cfg_dma3_mmk(set_cfg_dma7_mmk),
                                     .set_cfg_dma3_mk(set_cfg_dma7_mk),
                                     .clear_cfg_dma3_mb(clear_cfg_dma7_mb),

				     .set_pref_buf_par_err_dma3(set_pref_buf_par_err_dma7),
				     .set_pkt_part_err_dma3(set_pkt_part_err_dma7),
				     .pkt_part_error_address_dma3(pkt_part_error_address_dma7),
				     .set_conf_part_error_dma3(set_conf_part_error_dma7),
				     .set_tx_ring_oflow_dma3(set_tx_ring_oflow_dma7),
				     .set_mbox_part_error_dma3(set_mbox_part_error_dma[7]),
				     .txc_dmc_p0_dma3_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[7]),
                                     .txc_dmc_dma3_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[7]),
				     .txc_dmc_p1_dma3_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[7]),
				     .txc_dmc_p2_dma3_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[7]),
				     .txc_dmc_p3_dma3_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[7]),

			             .txpref_dma3_nack_resp(txpref_dma_nack_resp[7]),
				     .mbox_ack_dma3_err_received (mbox_ack_dma_err_received[7]),
				     .ShadowRingCurrentPtr_DMA3(ShadowRingCurrentPtr_DMA7),
				     .tx_dma_cfg_dma3_stop_state(tx_dma_cfg_dma7_stop_state)

				     );



// Regsisters for DMAs 8 9 10 11

 niu_tdmc_dmaregs niu_tdmc_dmaregs_8_11 
				 (/*AUTOJUNK*/
				     // Outputs
			// DMA8 - PIORegs Outs 
				     .page0_mask_dma0(page0_mask_dma8[31:0]),
				     .page0_value_dma0(page0_value_dma8[31:0]),
				     .page0_reloc_dma0(page0_reloc_dma8[31:0]),
				     .page0_valid_dma0(page0_valid_dma8),
				     .page1_mask_dma0(page1_mask_dma8[31:0]),
				     .page1_value_dma0(page1_value_dma8[31:0]),
				     .page1_reloc_dma0(page1_reloc_dma8[31:0]),
				     .page1_valid_dma0(page1_valid_dma8),
				     .dmc_txc_dma0_page_handle(dmc_txc_dma8_page_handle[19:0]),
				     .dmc_txc_dma0_func_num(dmc_txc_dma8_func_num[1:0]),
				     .tx_rng_cfg_dma0_len(tx_rng_cfg_dma8_len[`RNG_LENGTH_WIDTH -1 :0]),
				     .tx_rng_cfg_dma0_staddr(tx_rng_cfg_dma8_staddr[37:0]),
				     .tx_rng_tail_dma0(tx_rng_tail_dma8[`PTR_WIDTH :0]),
				     .tx_dma_cfg_dma0_rst(tx_dma_cfg_dma8_rst),
				     .tx_dma_cfg_dma0_stop(tx_dma_cfg_dma8_stop),	
				     .tx_dma_cfg_dma0_stall(tx_dma_cfg_dma8_stall),
				     .tx_dma_cfg_dma0_mbaddr(tx_dma_cfg_dma8_mbaddr[37:0]),
				     .tx_cfg_dma0_enable_mb(tx_cfg_dma8_enable_mb),
				     .tx_cfg_dma0_mk(tx_cfg_dma8_mk),
				     .tx_cfg_dma0_mmk(tx_cfg_dma8_mmk),
				     .tx_cs_dma0(tx_cs_dma8[63:0]),
				     .tx_dma0_pre_st(tx_dma8_pre_st[63:0]),
				     .tx_dma0_rng_err_logh(tx_dma8_rng_err_logh[63:0]),
				     .tx_dma0_rng_err_logl(tx_dma8_rng_err_logl[63:0]),
			             .intr_ldf0_dma0( tdmc_pio_intr[8] ),		
			             .intr_ldf1_dma0( tdmc_pio_intr[40] ),		


			// DMA9 - PIORegs Outs
                                     .page0_mask_dma1(page0_mask_dma9[31:0]),
                                     .page0_value_dma1(page0_value_dma9[31:0]),
                                     .page0_reloc_dma1(page0_reloc_dma9[31:0]),
                                     .page0_valid_dma1(page0_valid_dma9),
                                     .page1_mask_dma1(page1_mask_dma9[31:0]),
                                     .page1_value_dma1(page1_value_dma9[31:0]),
                                     .page1_reloc_dma1(page1_reloc_dma9[31:0]),
                                     .page1_valid_dma1(page1_valid_dma9),
                                     .dmc_txc_dma1_page_handle(dmc_txc_dma9_page_handle[19:0]),
				     .dmc_txc_dma1_func_num(dmc_txc_dma9_func_num[1:0]),
                                     .tx_rng_cfg_dma1_len(tx_rng_cfg_dma9_len[`RNG_LENGTH_WIDTH -1 :0]),
                                     .tx_rng_cfg_dma1_staddr(tx_rng_cfg_dma9_staddr[37:0]),
                                     .tx_rng_tail_dma1(tx_rng_tail_dma9[`PTR_WIDTH :0]),
                                     .tx_dma_cfg_dma1_rst(tx_dma_cfg_dma9_rst),
				     .tx_dma_cfg_dma1_stop(tx_dma_cfg_dma9_stop),	
                                     .tx_dma_cfg_dma1_stall(tx_dma_cfg_dma9_stall),
                                     .tx_dma_cfg_dma1_mbaddr(tx_dma_cfg_dma9_mbaddr[37:0]),
                                     .tx_cfg_dma1_enable_mb(tx_cfg_dma9_enable_mb),
                                     .tx_cfg_dma1_mk(tx_cfg_dma9_mk),
                                     .tx_cfg_dma1_mmk(tx_cfg_dma9_mmk),
                                     .tx_cs_dma1(tx_cs_dma9[63:0]),
                                     .tx_dma1_pre_st(tx_dma9_pre_st[63:0]),
                                     .tx_dma1_rng_err_logh(tx_dma9_rng_err_logh[63:0]),
                                     .tx_dma1_rng_err_logl(tx_dma9_rng_err_logl[63:0]),
			             .intr_ldf0_dma1( tdmc_pio_intr[9] ),		
			             .intr_ldf1_dma1( tdmc_pio_intr[41] ),		

                        // DMA10 - PIORegs Outs
                                     .page0_mask_dma2(page0_mask_dma10[31:0]),
                                     .page0_value_dma2(page0_value_dma10[31:0]),
                                     .page0_reloc_dma2(page0_reloc_dma10[31:0]),
                                     .page0_valid_dma2(page0_valid_dma10),
                                     .page1_mask_dma2(page1_mask_dma10[31:0]),
                                     .page1_value_dma2(page1_value_dma10[31:0]),
                                     .page1_reloc_dma2(page1_reloc_dma10[31:0]),
                                     .page1_valid_dma2(page1_valid_dma10),
                                     .dmc_txc_dma2_page_handle(dmc_txc_dma10_page_handle[19:0]),
				     .dmc_txc_dma2_func_num(dmc_txc_dma10_func_num[1:0]),
                                     .tx_rng_cfg_dma2_len(tx_rng_cfg_dma10_len[`RNG_LENGTH_WIDTH -1 :0]),
                                     .tx_rng_cfg_dma2_staddr(tx_rng_cfg_dma10_staddr[37:0]),
                                     .tx_rng_tail_dma2(tx_rng_tail_dma10[`PTR_WIDTH :0]),
                                     .tx_dma_cfg_dma2_rst(tx_dma_cfg_dma10_rst),
				     .tx_dma_cfg_dma2_stop(tx_dma_cfg_dma10_stop),	
                                     .tx_dma_cfg_dma2_stall(tx_dma_cfg_dma10_stall),
                                     .tx_dma_cfg_dma2_mbaddr(tx_dma_cfg_dma10_mbaddr[37:0]),
                                     .tx_cfg_dma2_enable_mb(tx_cfg_dma10_enable_mb),
                                     .tx_cfg_dma2_mk(tx_cfg_dma10_mk),
                                     .tx_cfg_dma2_mmk(tx_cfg_dma10_mmk),
                                     .tx_cs_dma2(tx_cs_dma10[63:0]),
                                     .tx_dma2_pre_st(tx_dma10_pre_st[63:0]),
                                     .tx_dma2_rng_err_logh(tx_dma10_rng_err_logh[63:0]),
                                     .tx_dma2_rng_err_logl(tx_dma10_rng_err_logl[63:0]),
			             .intr_ldf0_dma2( tdmc_pio_intr[10] ),		
			             .intr_ldf1_dma2( tdmc_pio_intr[42] ),		

                        // DMA11 - PIORegs Outs
                                     .page0_mask_dma3(page0_mask_dma11[31:0]),
                                     .page0_value_dma3(page0_value_dma11[31:0]),
                                     .page0_reloc_dma3(page0_reloc_dma11[31:0]),
                                     .page0_valid_dma3(page0_valid_dma11),
                                     .page1_mask_dma3(page1_mask_dma11[31:0]),
                                     .page1_value_dma3(page1_value_dma11[31:0]),
                                     .page1_reloc_dma3(page1_reloc_dma11[31:0]),
                                     .page1_valid_dma3(page1_valid_dma11),
                                     .dmc_txc_dma3_page_handle(dmc_txc_dma11_page_handle[19:0]),
				     .dmc_txc_dma3_func_num(dmc_txc_dma11_func_num[1:0]),
                                     .tx_rng_cfg_dma3_len(tx_rng_cfg_dma11_len[`RNG_LENGTH_WIDTH -1 :0]),
                                     .tx_rng_cfg_dma3_staddr(tx_rng_cfg_dma11_staddr[37:0]),
                                     .tx_rng_tail_dma3(tx_rng_tail_dma11[`PTR_WIDTH :0]),
                                     .tx_dma_cfg_dma3_rst(tx_dma_cfg_dma11_rst),
				     .tx_dma_cfg_dma3_stop(tx_dma_cfg_dma11_stop),	
                                     .tx_dma_cfg_dma3_stall(tx_dma_cfg_dma11_stall),
                                     .tx_dma_cfg_dma3_mbaddr(tx_dma_cfg_dma11_mbaddr[37:0]),
                                     .tx_cfg_dma3_enable_mb(tx_cfg_dma11_enable_mb),
                                     .tx_cfg_dma3_mk(tx_cfg_dma11_mk),
                                     .tx_cfg_dma3_mmk(tx_cfg_dma11_mmk),
                                     .tx_cs_dma3(tx_cs_dma11[63:0]),
                                     .tx_dma3_pre_st(tx_dma11_pre_st[63:0]),
                                     .tx_dma3_rng_err_logh(tx_dma11_rng_err_logh[63:0]),
                                     .tx_dma3_rng_err_logl(tx_dma11_rng_err_logl[63:0]),
			             .intr_ldf0_dma3( tdmc_pio_intr[11] ),		
			             .intr_ldf1_dma3( tdmc_pio_intr[43] ),		
					
                                     .dma_0_3_sl_data(dma_8_11_sl_data),
				     .read_decode_invalid_dma0_3(read_decode_invalid_dma8_11),
				  .dmc_txc_dma0_error ( dmc_txc_dma8_error),
				  .dmc_txc_dma1_error( dmc_txc_dma9_error),
				  .dmc_txc_dma2_error( dmc_txc_dma10_error),
				  .dmc_txc_dma3_error( dmc_txc_dma11_error),


				     // Inputs
				     .SysClk(SysClk),
				     .Reset_L(Reset_L),
				     .Slave_Read(Slave_Read_dma8_11),
				     .Slave_Sel(Slave_Sel_dma8_11),
				     .Slave_Addr(Slave_Addr_dma8_11[19:0]),
				     .Slave_DataIn(Slave_DataIn[63:0]),
				     .slaveStrobe(slaveStrobe),
				     .pio_clients_32b(pio_clients_32b_d_dma8_11),	

				     .write_DMA0_Register(write_DMA8_Register),
				     .write_DMA1_Register(write_DMA9_Register),
				     .write_DMA2_Register(write_DMA10_Register),
				     .write_DMA3_Register(write_DMA11_Register),
				     .write_FZC_DMA0_Register(write_FZC_DMA8_Register),
				     .write_FZC_DMA1_Register(write_FZC_DMA9_Register),
				     .write_FZC_DMA2_Register(write_FZC_DMA10_Register),
				     .write_FZC_DMA3_Register(write_FZC_DMA11_Register),
				     .read_DMA_0_3_Regsister(read_DMA_8_11_Regsister[7:0]),
				


				     .txc_dmc_nack_pkt_rd_addr(txc_dmc_nack_pkt_rd_addr),
                                     .txc_dmc_p0_pkt_size_err_addr(txc_dmc_p0_pkt_size_err_addr),
                                     .txc_dmc_p0_pkt_size_err(txc_dmc_p0_pkt_size_err),
                                     .txc_dmc_nack_pkt_rd(txc_dmc_nack_pkt_rd),
                                     .txc_dmc_p1_pkt_size_err_addr(txc_dmc_p1_pkt_size_err_addr),
                                     .txc_dmc_p1_pkt_size_err(txc_dmc_p1_pkt_size_err),
                                     .txc_dmc_p2_pkt_size_err_addr(txc_dmc_p2_pkt_size_err_addr),
                                     .txc_dmc_p2_pkt_size_err(txc_dmc_p2_pkt_size_err),
                                     .txc_dmc_p3_pkt_size_err_addr(txc_dmc_p3_pkt_size_err_addr),
                                     .txc_dmc_p3_pkt_size_err(txc_dmc_p3_pkt_size_err),

				  
   				     .txpref_nack_resp(txpref_nack_resp),
   				     .txpref_nack_rd_addr(txpref_nack_rd_addr),
				     .mbox_err_received(mbox_err_received),

				     .txc_dmc_dma0_inc_pkt_cnt(txc_dmc_dma8_inc_pkt_cnt),
				     .txc_dmc_dma0_mark_bit(txc_dmc_dma8_mark_bit),
 				     .txc_dmc_dma1_inc_pkt_cnt(txc_dmc_dma9_inc_pkt_cnt),
 				     .txc_dmc_dma1_mark_bit(txc_dmc_dma9_mark_bit),
 				     .txc_dmc_dma2_inc_pkt_cnt(txc_dmc_dma10_inc_pkt_cnt),
 				     .txc_dmc_dma2_mark_bit(txc_dmc_dma10_mark_bit),
 				     .txc_dmc_dma3_inc_pkt_cnt(txc_dmc_dma11_inc_pkt_cnt),
 				     .txc_dmc_dma3_mark_bit(txc_dmc_dma11_mark_bit),


			// DMA8 - PIORegs Ins 
				     .tx_rng_head_dma0(tx_rng_head_dma8[`PTR_WIDTH :0]),
				     .dma0_clear_reset(dma8_clear_reset),
				     .set_cfg_dma0_mmk(set_cfg_dma8_mmk),
				     .set_cfg_dma0_mk(set_cfg_dma8_mk),
				     .clear_cfg_dma0_mb(clear_cfg_dma8_mb),

				     .set_pref_buf_par_err_dma0(set_pref_buf_par_err_dma8),
				     .set_pkt_part_err_dma0(set_pkt_part_err_dma8),
				     .pkt_part_error_address_dma0(pkt_part_error_address_dma8),
				     .set_conf_part_error_dma0(set_conf_part_error_dma8),
				     .set_tx_ring_oflow_dma0(set_tx_ring_oflow_dma8),
				     .set_mbox_part_error_dma0(set_mbox_part_error_dma[8]),

				  .txc_dmc_p0_dma0_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[8]),
                                     .txc_dmc_dma0_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[8]),
				     .txc_dmc_p1_dma0_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[8]),
				     .txc_dmc_p2_dma0_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[8]),
				     .txc_dmc_p3_dma0_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[8]),
			             .txpref_dma0_nack_resp(txpref_dma_nack_resp[8]),
				     .mbox_ack_dma0_err_received (mbox_ack_dma_err_received[8]),
				     .ShadowRingCurrentPtr_DMA0(ShadowRingCurrentPtr_DMA8),	
				     .tx_dma_cfg_dma0_stop_state(tx_dma_cfg_dma8_stop_state),

                        // DMA9 - PIORegs Ins
                                     .tx_rng_head_dma1(tx_rng_head_dma9[`PTR_WIDTH :0]),
                                     .dma1_clear_reset(dma9_clear_reset),
                                     .set_cfg_dma1_mmk(set_cfg_dma9_mmk),
                                     .set_cfg_dma1_mk(set_cfg_dma9_mk),
                                     .clear_cfg_dma1_mb(clear_cfg_dma9_mb),

				     .set_pref_buf_par_err_dma1(set_pref_buf_par_err_dma9),
				     .set_pkt_part_err_dma1(set_pkt_part_err_dma9),
				     .pkt_part_error_address_dma1(pkt_part_error_address_dma9),
				     .set_conf_part_error_dma1(set_conf_part_error_dma9),
				     .set_tx_ring_oflow_dma1(set_tx_ring_oflow_dma9),
				     .set_mbox_part_error_dma1(set_mbox_part_error_dma[9]),

				  .txc_dmc_p0_dma1_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[9]),
                                     .txc_dmc_dma1_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[9]),

				     .txc_dmc_p1_dma1_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[9]),

				     .txc_dmc_p2_dma1_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[9]),

				     .txc_dmc_p3_dma1_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[9]),
			             .txpref_dma1_nack_resp(txpref_dma_nack_resp[9]),
				     .mbox_ack_dma1_err_received (mbox_ack_dma_err_received[9]),
				     .ShadowRingCurrentPtr_DMA1(ShadowRingCurrentPtr_DMA9),	
				     .tx_dma_cfg_dma1_stop_state(tx_dma_cfg_dma9_stop_state),

                        // DMA10 - PIORegs Ins
                                     .tx_rng_head_dma2(tx_rng_head_dma10[`PTR_WIDTH :0]),
                                     .dma2_clear_reset(dma10_clear_reset),
                                     .set_cfg_dma2_mmk(set_cfg_dma10_mmk),
                                     .set_cfg_dma2_mk(set_cfg_dma10_mk),
                                     .clear_cfg_dma2_mb(clear_cfg_dma10_mb),

				     .set_pref_buf_par_err_dma2(set_pref_buf_par_err_dma10),
				     .set_pkt_part_err_dma2(set_pkt_part_err_dma10),
				     .pkt_part_error_address_dma2(pkt_part_error_address_dma10),
				     .set_conf_part_error_dma2(set_conf_part_error_dma10),
				     .set_tx_ring_oflow_dma2(set_tx_ring_oflow_dma10),
				     .set_mbox_part_error_dma2(set_mbox_part_error_dma[10]),

				  .txc_dmc_p0_dma2_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[10]),
                                     .txc_dmc_dma2_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[10]),
				     .txc_dmc_p1_dma2_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[10]),
				     .txc_dmc_p2_dma2_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[10]),
				     .txc_dmc_p3_dma2_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[10]),

			             .txpref_dma2_nack_resp(txpref_dma_nack_resp[10]),
				     .mbox_ack_dma2_err_received (mbox_ack_dma_err_received[10]),
				     .ShadowRingCurrentPtr_DMA2(ShadowRingCurrentPtr_DMA10),	
				     .tx_dma_cfg_dma2_stop_state(tx_dma_cfg_dma10_stop_state),

                        // DMA11 - PIORegs Ins
                                     .tx_rng_head_dma3(tx_rng_head_dma11[`PTR_WIDTH :0]),
                                     .dma3_clear_reset(dma11_clear_reset),
                                     .set_cfg_dma3_mmk(set_cfg_dma11_mmk),
                                     .set_cfg_dma3_mk(set_cfg_dma11_mk),
                                     .clear_cfg_dma3_mb(clear_cfg_dma11_mb),

				     .set_pref_buf_par_err_dma3(set_pref_buf_par_err_dma11),
				     .set_pkt_part_err_dma3(set_pkt_part_err_dma11),
				     .pkt_part_error_address_dma3(pkt_part_error_address_dma11),
				     .set_conf_part_error_dma3(set_conf_part_error_dma11),
				     .set_tx_ring_oflow_dma3(set_tx_ring_oflow_dma11),
				     .set_mbox_part_error_dma3(set_mbox_part_error_dma[11]),

				  .txc_dmc_p0_dma3_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[11]),
                                     .txc_dmc_dma3_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[11]),
				     .txc_dmc_p1_dma3_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[11]),
				     .txc_dmc_p2_dma3_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[11]),
				     .txc_dmc_p3_dma3_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[11]),

			             .txpref_dma3_nack_resp(txpref_dma_nack_resp[11]),
				     .mbox_ack_dma3_err_received (mbox_ack_dma_err_received[11]),
				     .ShadowRingCurrentPtr_DMA3(ShadowRingCurrentPtr_DMA11),
				     .tx_dma_cfg_dma3_stop_state(tx_dma_cfg_dma11_stop_state)

				     );



// Regsisters for DMAs 12 13 14 15

 niu_tdmc_dmaregs niu_tdmc_dmaregs_12_15 
				 (/*AUTOJUNK*/
				     // Outputs
			// DMA12 - PIORegs Outs 
				     .page0_mask_dma0(page0_mask_dma12[31:0]),
				     .page0_value_dma0(page0_value_dma12[31:0]),
				     .page0_reloc_dma0(page0_reloc_dma12[31:0]),
				     .page0_valid_dma0(page0_valid_dma12),
				     .page1_mask_dma0(page1_mask_dma12[31:0]),
				     .page1_value_dma0(page1_value_dma12[31:0]),
				     .page1_reloc_dma0(page1_reloc_dma12[31:0]),
				     .page1_valid_dma0(page1_valid_dma12),
				     .dmc_txc_dma0_page_handle(dmc_txc_dma12_page_handle[19:0]),
				     .dmc_txc_dma0_func_num(dmc_txc_dma12_func_num[1:0]),
				     .tx_rng_cfg_dma0_len(tx_rng_cfg_dma12_len[`RNG_LENGTH_WIDTH -1 :0]),
				     .tx_rng_cfg_dma0_staddr(tx_rng_cfg_dma12_staddr[37:0]),
				     .tx_rng_tail_dma0(tx_rng_tail_dma12[`PTR_WIDTH :0]),
				     .tx_dma_cfg_dma0_rst(tx_dma_cfg_dma12_rst),
				     .tx_dma_cfg_dma0_stop(tx_dma_cfg_dma12_stop),	
				     .tx_dma_cfg_dma0_stall(tx_dma_cfg_dma12_stall),
				     .tx_dma_cfg_dma0_mbaddr(tx_dma_cfg_dma12_mbaddr[37:0]),
				     .tx_cfg_dma0_enable_mb(tx_cfg_dma12_enable_mb),
				     .tx_cfg_dma0_mk(tx_cfg_dma12_mk),
				     .tx_cfg_dma0_mmk(tx_cfg_dma12_mmk),
				     .tx_cs_dma0(tx_cs_dma12[63:0]),
				     .tx_dma0_pre_st(tx_dma12_pre_st[63:0]),
				     .tx_dma0_rng_err_logh(tx_dma12_rng_err_logh[63:0]),
				     .tx_dma0_rng_err_logl(tx_dma12_rng_err_logl[63:0]),
			             .intr_ldf0_dma0( tdmc_pio_intr[12] ),		
			             .intr_ldf1_dma0( tdmc_pio_intr[44] ),		


			// DMA13 - PIORegs Outs
                                     .page0_mask_dma1(page0_mask_dma13[31:0]),
                                     .page0_value_dma1(page0_value_dma13[31:0]),
                                     .page0_reloc_dma1(page0_reloc_dma13[31:0]),
                                     .page0_valid_dma1(page0_valid_dma13),
                                     .page1_mask_dma1(page1_mask_dma13[31:0]),
                                     .page1_value_dma1(page1_value_dma13[31:0]),
                                     .page1_reloc_dma1(page1_reloc_dma13[31:0]),
                                     .page1_valid_dma1(page1_valid_dma13),
                                     .dmc_txc_dma1_page_handle(dmc_txc_dma13_page_handle[19:0]),
				     .dmc_txc_dma1_func_num(dmc_txc_dma13_func_num[1:0]),
                                     .tx_rng_cfg_dma1_len(tx_rng_cfg_dma13_len[`RNG_LENGTH_WIDTH -1 :0]),
                                     .tx_rng_cfg_dma1_staddr(tx_rng_cfg_dma13_staddr[37:0]),
                                     .tx_rng_tail_dma1(tx_rng_tail_dma13[`PTR_WIDTH :0]),
                                     .tx_dma_cfg_dma1_rst(tx_dma_cfg_dma13_rst),
				     .tx_dma_cfg_dma1_stop(tx_dma_cfg_dma13_stop),	
                                     .tx_dma_cfg_dma1_stall(tx_dma_cfg_dma13_stall),
                                     .tx_dma_cfg_dma1_mbaddr(tx_dma_cfg_dma13_mbaddr[37:0]),
                                     .tx_cfg_dma1_enable_mb(tx_cfg_dma13_enable_mb),
                                     .tx_cfg_dma1_mk(tx_cfg_dma13_mk),
                                     .tx_cfg_dma1_mmk(tx_cfg_dma13_mmk),
                                     .tx_cs_dma1(tx_cs_dma13[63:0]),
                                     .tx_dma1_pre_st(tx_dma13_pre_st[63:0]),
                                     .tx_dma1_rng_err_logh(tx_dma13_rng_err_logh[63:0]),
                                     .tx_dma1_rng_err_logl(tx_dma13_rng_err_logl[63:0]),
			             .intr_ldf0_dma1( tdmc_pio_intr[13] ),		
			             .intr_ldf1_dma1( tdmc_pio_intr[45] ),		

                        // DMA14 - PIORegs Outs
                                     .page0_mask_dma2(page0_mask_dma14[31:0]),
                                     .page0_value_dma2(page0_value_dma14[31:0]),
                                     .page0_reloc_dma2(page0_reloc_dma14[31:0]),
                                     .page0_valid_dma2(page0_valid_dma14),
                                     .page1_mask_dma2(page1_mask_dma14[31:0]),
                                     .page1_value_dma2(page1_value_dma14[31:0]),
                                     .page1_reloc_dma2(page1_reloc_dma14[31:0]),
                                     .page1_valid_dma2(page1_valid_dma14),
                                     .dmc_txc_dma2_page_handle(dmc_txc_dma14_page_handle[19:0]),
				     .dmc_txc_dma2_func_num(dmc_txc_dma14_func_num[1:0]),
                                     .tx_rng_cfg_dma2_len(tx_rng_cfg_dma14_len[`RNG_LENGTH_WIDTH -1 :0]),
                                     .tx_rng_cfg_dma2_staddr(tx_rng_cfg_dma14_staddr[37:0]),
                                     .tx_rng_tail_dma2(tx_rng_tail_dma14[`PTR_WIDTH :0]),
                                     .tx_dma_cfg_dma2_rst(tx_dma_cfg_dma14_rst),
				     .tx_dma_cfg_dma2_stop(tx_dma_cfg_dma14_stop),	
                                     .tx_dma_cfg_dma2_stall(tx_dma_cfg_dma14_stall),
                                     .tx_dma_cfg_dma2_mbaddr(tx_dma_cfg_dma14_mbaddr[37:0]),
                                     .tx_cfg_dma2_enable_mb(tx_cfg_dma14_enable_mb),
                                     .tx_cfg_dma2_mk(tx_cfg_dma14_mk),
                                     .tx_cfg_dma2_mmk(tx_cfg_dma14_mmk),
                                     .tx_cs_dma2(tx_cs_dma14[63:0]),
                                     .tx_dma2_pre_st(tx_dma14_pre_st[63:0]),
                                     .tx_dma2_rng_err_logh(tx_dma14_rng_err_logh[63:0]),
                                     .tx_dma2_rng_err_logl(tx_dma14_rng_err_logl[63:0]),
			             .intr_ldf0_dma2( tdmc_pio_intr[14] ),		
			             .intr_ldf1_dma2( tdmc_pio_intr[46] ),		

                        // DMA15 - PIORegs Outs
                                     .page0_mask_dma3(page0_mask_dma15[31:0]),
                                     .page0_value_dma3(page0_value_dma15[31:0]),
                                     .page0_reloc_dma3(page0_reloc_dma15[31:0]),
                                     .page0_valid_dma3(page0_valid_dma15),
                                     .page1_mask_dma3(page1_mask_dma15[31:0]),
                                     .page1_value_dma3(page1_value_dma15[31:0]),
                                     .page1_reloc_dma3(page1_reloc_dma15[31:0]),
                                     .page1_valid_dma3(page1_valid_dma15),
                                     .dmc_txc_dma3_page_handle(dmc_txc_dma15_page_handle[19:0]),
				     .dmc_txc_dma3_func_num(dmc_txc_dma15_func_num[1:0]),
                                     .tx_rng_cfg_dma3_len(tx_rng_cfg_dma15_len[`RNG_LENGTH_WIDTH -1 :0]),
                                     .tx_rng_cfg_dma3_staddr(tx_rng_cfg_dma15_staddr[37:0]),
                                     .tx_rng_tail_dma3(tx_rng_tail_dma15[`PTR_WIDTH :0]),
                                     .tx_dma_cfg_dma3_rst(tx_dma_cfg_dma15_rst),
				     .tx_dma_cfg_dma3_stop(tx_dma_cfg_dma15_stop),	
                                     .tx_dma_cfg_dma3_stall(tx_dma_cfg_dma15_stall),
                                     .tx_dma_cfg_dma3_mbaddr(tx_dma_cfg_dma15_mbaddr[37:0]),
                                     .tx_cfg_dma3_enable_mb(tx_cfg_dma15_enable_mb),
                                     .tx_cfg_dma3_mk(tx_cfg_dma15_mk),
                                     .tx_cfg_dma3_mmk(tx_cfg_dma15_mmk),
                                     .tx_cs_dma3(tx_cs_dma15[63:0]),
                                     .tx_dma3_pre_st(tx_dma15_pre_st[63:0]),
                                     .tx_dma3_rng_err_logh(tx_dma15_rng_err_logh[63:0]),
                                     .tx_dma3_rng_err_logl(tx_dma15_rng_err_logl[63:0]),
			             .intr_ldf0_dma3( tdmc_pio_intr[15] ),		
			             .intr_ldf1_dma3( tdmc_pio_intr[47] ),		
					
                                     .dma_0_3_sl_data(dma_12_15_sl_data),
				     .read_decode_invalid_dma0_3(read_decode_invalid_dma12_15),
				  .dmc_txc_dma0_error ( dmc_txc_dma12_error),
				  .dmc_txc_dma1_error( dmc_txc_dma13_error),
				  .dmc_txc_dma2_error( dmc_txc_dma14_error),
				  .dmc_txc_dma3_error( dmc_txc_dma15_error),
				  

				     // Inputs
				     .SysClk(SysClk),
				     .Reset_L(Reset_L),
				     .Slave_Read(Slave_Read_dma12_15),
				     .Slave_Sel(Slave_Sel_dma12_15),
				     .Slave_Addr(Slave_Addr_dma12_15[19:0]),
				     .Slave_DataIn(Slave_DataIn[63:0]),
				     .slaveStrobe(slaveStrobe),
				     .pio_clients_32b(pio_clients_32b_d_dma12_15),	

				     .write_DMA0_Register(write_DMA12_Register),
				     .write_DMA1_Register(write_DMA13_Register),
				     .write_DMA2_Register(write_DMA14_Register),
				     .write_DMA3_Register(write_DMA15_Register),
				     .write_FZC_DMA0_Register(write_FZC_DMA12_Register),
				     .write_FZC_DMA1_Register(write_FZC_DMA13_Register),
				     .write_FZC_DMA2_Register(write_FZC_DMA14_Register),
				     .write_FZC_DMA3_Register(write_FZC_DMA15_Register),
				     .read_DMA_0_3_Regsister(read_DMA_12_15_Regsister[7:0]),
				


				     .txc_dmc_nack_pkt_rd_addr(txc_dmc_nack_pkt_rd_addr),
                                     .txc_dmc_p0_pkt_size_err_addr(txc_dmc_p0_pkt_size_err_addr),
                                     .txc_dmc_p0_pkt_size_err(txc_dmc_p0_pkt_size_err),
                                     .txc_dmc_nack_pkt_rd(txc_dmc_nack_pkt_rd),
                                     .txc_dmc_p1_pkt_size_err_addr(txc_dmc_p1_pkt_size_err_addr),
                                     .txc_dmc_p1_pkt_size_err(txc_dmc_p1_pkt_size_err),
                                     .txc_dmc_p2_pkt_size_err_addr(txc_dmc_p2_pkt_size_err_addr),
                                     .txc_dmc_p2_pkt_size_err(txc_dmc_p2_pkt_size_err),
                                     .txc_dmc_p3_pkt_size_err_addr(txc_dmc_p3_pkt_size_err_addr),
                                     .txc_dmc_p3_pkt_size_err(txc_dmc_p3_pkt_size_err),

   				     .txpref_nack_resp(txpref_nack_resp),
   				     .txpref_nack_rd_addr(txpref_nack_rd_addr),
				     .mbox_err_received(mbox_err_received),

				     .txc_dmc_dma0_inc_pkt_cnt(txc_dmc_dma12_inc_pkt_cnt),
 				     .txc_dmc_dma0_mark_bit(txc_dmc_dma12_mark_bit),
 				     .txc_dmc_dma1_inc_pkt_cnt(txc_dmc_dma13_inc_pkt_cnt),
 				     .txc_dmc_dma1_mark_bit(txc_dmc_dma13_mark_bit),
 				     .txc_dmc_dma2_inc_pkt_cnt(txc_dmc_dma14_inc_pkt_cnt),
 				     .txc_dmc_dma2_mark_bit(txc_dmc_dma14_mark_bit),
 				     .txc_dmc_dma3_inc_pkt_cnt(txc_dmc_dma15_inc_pkt_cnt),
 				     .txc_dmc_dma3_mark_bit(txc_dmc_dma15_mark_bit),


			// DMA12 - PIORegs Ins 
				     .tx_rng_head_dma0(tx_rng_head_dma12[`PTR_WIDTH :0]),
				     .dma0_clear_reset(dma12_clear_reset),
				     .set_cfg_dma0_mmk(set_cfg_dma12_mmk),
				     .set_cfg_dma0_mk(set_cfg_dma12_mk),
				     .clear_cfg_dma0_mb(clear_cfg_dma12_mb),

				     .set_pref_buf_par_err_dma0(set_pref_buf_par_err_dma12),
				     .set_pkt_part_err_dma0(set_pkt_part_err_dma12),
				     .pkt_part_error_address_dma0(pkt_part_error_address_dma12),
				     .set_conf_part_error_dma0(set_conf_part_error_dma12),
				     .set_tx_ring_oflow_dma0(set_tx_ring_oflow_dma12),
				     .set_mbox_part_error_dma0(set_mbox_part_error_dma[12]),

				  .txc_dmc_p0_dma0_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[12]),
                                     .txc_dmc_dma0_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[12]),
				     .txc_dmc_p1_dma0_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[12]),
				     .txc_dmc_p2_dma0_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[12]),
				     .txc_dmc_p3_dma0_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[12]),

			             .txpref_dma0_nack_resp(txpref_dma_nack_resp[12]),
				     .mbox_ack_dma0_err_received (mbox_ack_dma_err_received[12]),
				     .ShadowRingCurrentPtr_DMA0(ShadowRingCurrentPtr_DMA12),	
				     .tx_dma_cfg_dma0_stop_state(tx_dma_cfg_dma12_stop_state),

                        // DMA13 - PIORegs Ins
                                     .tx_rng_head_dma1(tx_rng_head_dma13[`PTR_WIDTH :0]),
                                     .dma1_clear_reset(dma13_clear_reset),
                                     .set_cfg_dma1_mmk(set_cfg_dma13_mmk),
                                     .set_cfg_dma1_mk(set_cfg_dma13_mk),
                                     .clear_cfg_dma1_mb(clear_cfg_dma13_mb),

				     .set_pref_buf_par_err_dma1(set_pref_buf_par_err_dma13),
				     .set_pkt_part_err_dma1(set_pkt_part_err_dma13),
				     .pkt_part_error_address_dma1(pkt_part_error_address_dma13),
				     .set_conf_part_error_dma1(set_conf_part_error_dma13),
				     .set_tx_ring_oflow_dma1(set_tx_ring_oflow_dma13),
				     .set_mbox_part_error_dma1(set_mbox_part_error_dma[13]),

				  .txc_dmc_p0_dma1_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[13]),
                                     .txc_dmc_dma1_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[13]),

				     .txc_dmc_p1_dma1_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[13]),

				     .txc_dmc_p2_dma1_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[13]),

				     .txc_dmc_p3_dma1_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[13]),

			             .txpref_dma1_nack_resp(txpref_dma_nack_resp[13]),
				     .mbox_ack_dma1_err_received (mbox_ack_dma_err_received[13]),
				     .ShadowRingCurrentPtr_DMA1(ShadowRingCurrentPtr_DMA13),	
				     .tx_dma_cfg_dma1_stop_state(tx_dma_cfg_dma13_stop_state),

                        // DMA14 - PIORegs Ins
                                     .tx_rng_head_dma2(tx_rng_head_dma14[`PTR_WIDTH :0]),
                                     .dma2_clear_reset(dma14_clear_reset),
                                     .set_cfg_dma2_mmk(set_cfg_dma14_mmk),
                                     .set_cfg_dma2_mk(set_cfg_dma14_mk),
                                     .clear_cfg_dma2_mb(clear_cfg_dma14_mb),

				     .set_pref_buf_par_err_dma2(set_pref_buf_par_err_dma14),
				     .set_pkt_part_err_dma2(set_pkt_part_err_dma14),
				     .pkt_part_error_address_dma2(pkt_part_error_address_dma14),
				     .set_conf_part_error_dma2(set_conf_part_error_dma14),
				     .set_tx_ring_oflow_dma2(set_tx_ring_oflow_dma14),
				     .set_mbox_part_error_dma2(set_mbox_part_error_dma[14]),

				      .txc_dmc_p0_dma2_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[14]),
                                     .txc_dmc_dma2_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[14]),
				     .txc_dmc_p1_dma2_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[14]),
				     .txc_dmc_p2_dma2_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[14]),
				     .txc_dmc_p3_dma2_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[14]),
			             .txpref_dma2_nack_resp(txpref_dma_nack_resp[14]),
				     .mbox_ack_dma2_err_received (mbox_ack_dma_err_received[14]),
				     .ShadowRingCurrentPtr_DMA2(ShadowRingCurrentPtr_DMA14),	
				     .tx_dma_cfg_dma2_stop_state(tx_dma_cfg_dma14_stop_state),

                        // DMA15 - PIORegs Ins
                                     .tx_rng_head_dma3(tx_rng_head_dma15[`PTR_WIDTH :0]),
                                     .dma3_clear_reset(dma15_clear_reset),
                                     .set_cfg_dma3_mmk(set_cfg_dma15_mmk),
                                     .set_cfg_dma3_mk(set_cfg_dma15_mk),
                                     .clear_cfg_dma3_mb(clear_cfg_dma15_mb),

				     .set_pref_buf_par_err_dma3(set_pref_buf_par_err_dma15),
				     .set_pkt_part_err_dma3(set_pkt_part_err_dma15),
				     .pkt_part_error_address_dma3(pkt_part_error_address_dma15),
				     .set_conf_part_error_dma3(set_conf_part_error_dma15),
				     .set_tx_ring_oflow_dma3(set_tx_ring_oflow_dma15),
				     .set_mbox_part_error_dma3(set_mbox_part_error_dma[15]),
				  .txc_dmc_p0_dma3_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[15]),
                                     .txc_dmc_dma3_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[15]),
				     .txc_dmc_p1_dma3_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[15]),
				     .txc_dmc_p2_dma3_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[15]),
				     .txc_dmc_p3_dma3_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[15]),
			             .txpref_dma3_nack_resp(txpref_dma_nack_resp[15]),
				     .mbox_ack_dma3_err_received (mbox_ack_dma_err_received[15]),
				     .ShadowRingCurrentPtr_DMA3(ShadowRingCurrentPtr_DMA15),
				     .tx_dma_cfg_dma3_stop_state(tx_dma_cfg_dma15_stop_state)

				     );



`ifdef NEPTUNE
   
// Regsisters for DMAs 16 17 18 19

 niu_tdmc_dmaregs niu_tdmc_dmaregs_16_19 
				 (/*AUTOJUNK*/
				     // Outputs
			// DMA16 - PIORegs Outs 
				     .page0_mask_dma0(page0_mask_dma16[31:0]),
				     .page0_value_dma0(page0_value_dma16[31:0]),
				     .page0_reloc_dma0(page0_reloc_dma16[31:0]),
				     .page0_valid_dma0(page0_valid_dma16),
				     .page1_mask_dma0(page1_mask_dma16[31:0]),
				     .page1_value_dma0(page1_value_dma16[31:0]),
				     .page1_reloc_dma0(page1_reloc_dma16[31:0]),
				     .page1_valid_dma0(page1_valid_dma16),
				     .dmc_txc_dma0_page_handle(dmc_txc_dma16_page_handle[19:0]),
				     .dmc_txc_dma0_func_num(dmc_txc_dma16_func_num[1:0]),
				     .tx_rng_cfg_dma0_len(tx_rng_cfg_dma16_len[`RNG_LENGTH_WIDTH -1 :0]),
				     .tx_rng_cfg_dma0_staddr(tx_rng_cfg_dma16_staddr[37:0]),
				     .tx_rng_tail_dma0(tx_rng_tail_dma16[`PTR_WIDTH :0]),
				     .tx_dma_cfg_dma0_rst(tx_dma_cfg_dma16_rst),
				     .tx_dma_cfg_dma0_stop(tx_dma_cfg_dma16_stop),	
				     .tx_dma_cfg_dma0_stall(tx_dma_cfg_dma16_stall),
				     .tx_dma_cfg_dma0_mbaddr(tx_dma_cfg_dma16_mbaddr[37:0]),
				     .tx_cfg_dma0_enable_mb(tx_cfg_dma16_enable_mb),
				     .tx_cfg_dma0_mk(tx_cfg_dma16_mk),
				     .tx_cfg_dma0_mmk(tx_cfg_dma16_mmk),
				     .tx_cs_dma0(tx_cs_dma16[63:0]),
				     .tx_dma0_pre_st(tx_dma16_pre_st[63:0]),
				     .tx_dma0_rng_err_logh(tx_dma16_rng_err_logh[63:0]),
				     .tx_dma0_rng_err_logl(tx_dma16_rng_err_logl[63:0]),
			             .intr_ldf0_dma0( tdmc_pio_intr[16] ),		
			             .intr_ldf1_dma0( tdmc_pio_intr[48] ),		


			// DMA17 - PIORegs Outs
                                     .page0_mask_dma1(page0_mask_dma17[31:0]),
                                     .page0_value_dma1(page0_value_dma17[31:0]),
                                     .page0_reloc_dma1(page0_reloc_dma17[31:0]),
                                     .page0_valid_dma1(page0_valid_dma17),
                                     .page1_mask_dma1(page1_mask_dma17[31:0]),
                                     .page1_value_dma1(page1_value_dma17[31:0]),
                                     .page1_reloc_dma1(page1_reloc_dma17[31:0]),
                                     .page1_valid_dma1(page1_valid_dma17),
                                     .dmc_txc_dma1_page_handle(dmc_txc_dma17_page_handle[19:0]),
				     .dmc_txc_dma1_func_num(dmc_txc_dma17_func_num[1:0]),
                                     .tx_rng_cfg_dma1_len(tx_rng_cfg_dma17_len[`RNG_LENGTH_WIDTH -1 :0]),
                                     .tx_rng_cfg_dma1_staddr(tx_rng_cfg_dma17_staddr[37:0]),
                                     .tx_rng_tail_dma1(tx_rng_tail_dma17[`PTR_WIDTH :0]),
                                     .tx_dma_cfg_dma1_rst(tx_dma_cfg_dma17_rst),
				     .tx_dma_cfg_dma1_stop(tx_dma_cfg_dma17_stop),	
                                     .tx_dma_cfg_dma1_stall(tx_dma_cfg_dma17_stall),
                                     .tx_dma_cfg_dma1_mbaddr(tx_dma_cfg_dma17_mbaddr[37:0]),
                                     .tx_cfg_dma1_enable_mb(tx_cfg_dma17_enable_mb),
                                     .tx_cfg_dma1_mk(tx_cfg_dma17_mk),
                                     .tx_cfg_dma1_mmk(tx_cfg_dma17_mmk),
                                     .tx_cs_dma1(tx_cs_dma17[63:0]),
                                     .tx_dma1_pre_st(tx_dma17_pre_st[63:0]),
                                     .tx_dma1_rng_err_logh(tx_dma17_rng_err_logh[63:0]),
                                     .tx_dma1_rng_err_logl(tx_dma17_rng_err_logl[63:0]),
			             .intr_ldf0_dma1( tdmc_pio_intr[17] ),		
			             .intr_ldf1_dma1( tdmc_pio_intr[49] ),		

                        // DMA18 - PIORegs Outs
                                     .page0_mask_dma2(page0_mask_dma18[31:0]),
                                     .page0_value_dma2(page0_value_dma18[31:0]),
                                     .page0_reloc_dma2(page0_reloc_dma18[31:0]),
                                     .page0_valid_dma2(page0_valid_dma18),
                                     .page1_mask_dma2(page1_mask_dma18[31:0]),
                                     .page1_value_dma2(page1_value_dma18[31:0]),
                                     .page1_reloc_dma2(page1_reloc_dma18[31:0]),
                                     .page1_valid_dma2(page1_valid_dma18),
                                     .dmc_txc_dma2_page_handle(dmc_txc_dma18_page_handle[19:0]),
				     .dmc_txc_dma2_func_num(dmc_txc_dma18_func_num[1:0]),
                                     .tx_rng_cfg_dma2_len(tx_rng_cfg_dma18_len[`RNG_LENGTH_WIDTH -1 :0]),
                                     .tx_rng_cfg_dma2_staddr(tx_rng_cfg_dma18_staddr[37:0]),
                                     .tx_rng_tail_dma2(tx_rng_tail_dma18[`PTR_WIDTH :0]),
                                     .tx_dma_cfg_dma2_rst(tx_dma_cfg_dma18_rst),
				     .tx_dma_cfg_dma2_stop(tx_dma_cfg_dma18_stop),	
                                     .tx_dma_cfg_dma2_stall(tx_dma_cfg_dma18_stall),
                                     .tx_dma_cfg_dma2_mbaddr(tx_dma_cfg_dma18_mbaddr[37:0]),
                                     .tx_cfg_dma2_enable_mb(tx_cfg_dma18_enable_mb),
                                     .tx_cfg_dma2_mk(tx_cfg_dma18_mk),
                                     .tx_cfg_dma2_mmk(tx_cfg_dma18_mmk),
                                     .tx_cs_dma2(tx_cs_dma18[63:0]),
                                     .tx_dma2_pre_st(tx_dma18_pre_st[63:0]),
                                     .tx_dma2_rng_err_logh(tx_dma18_rng_err_logh[63:0]),
                                     .tx_dma2_rng_err_logl(tx_dma18_rng_err_logl[63:0]),
			             .intr_ldf0_dma2( tdmc_pio_intr[18] ),		
			             .intr_ldf1_dma2( tdmc_pio_intr[50] ),		

                        // DMA19 - PIORegs Outs
                                     .page0_mask_dma3(page0_mask_dma19[31:0]),
                                     .page0_value_dma3(page0_value_dma19[31:0]),
                                     .page0_reloc_dma3(page0_reloc_dma19[31:0]),
                                     .page0_valid_dma3(page0_valid_dma19),
                                     .page1_mask_dma3(page1_mask_dma19[31:0]),
                                     .page1_value_dma3(page1_value_dma19[31:0]),
                                     .page1_reloc_dma3(page1_reloc_dma19[31:0]),
                                     .page1_valid_dma3(page1_valid_dma19),
                                     .dmc_txc_dma3_page_handle(dmc_txc_dma19_page_handle[19:0]),
				     .dmc_txc_dma3_func_num(dmc_txc_dma19_func_num[1:0]),
                                     .tx_rng_cfg_dma3_len(tx_rng_cfg_dma19_len[`RNG_LENGTH_WIDTH -1 :0]),
                                     .tx_rng_cfg_dma3_staddr(tx_rng_cfg_dma19_staddr[37:0]),
                                     .tx_rng_tail_dma3(tx_rng_tail_dma19[`PTR_WIDTH :0]),
                                     .tx_dma_cfg_dma3_rst(tx_dma_cfg_dma19_rst),
				     .tx_dma_cfg_dma3_stop(tx_dma_cfg_dma19_stop),	
                                     .tx_dma_cfg_dma3_stall(tx_dma_cfg_dma19_stall),
                                     .tx_dma_cfg_dma3_mbaddr(tx_dma_cfg_dma19_mbaddr[37:0]),
                                     .tx_cfg_dma3_enable_mb(tx_cfg_dma19_enable_mb),
                                     .tx_cfg_dma3_mk(tx_cfg_dma19_mk),
                                     .tx_cfg_dma3_mmk(tx_cfg_dma19_mmk),
                                     .tx_cs_dma3(tx_cs_dma19[63:0]),
                                     .tx_dma3_pre_st(tx_dma19_pre_st[63:0]),
                                     .tx_dma3_rng_err_logh(tx_dma19_rng_err_logh[63:0]),
                                     .tx_dma3_rng_err_logl(tx_dma19_rng_err_logl[63:0]),
			             .intr_ldf0_dma3( tdmc_pio_intr[19] ),		
			             .intr_ldf1_dma3( tdmc_pio_intr[51] ),		
					
                                     .dma_0_3_sl_data(dma_16_19_sl_data),
				     .read_decode_invalid_dma0_3(read_decode_invalid_dma16_19),
				  .dmc_txc_dma0_error ( dmc_txc_dma16_error),
				  .dmc_txc_dma1_error( dmc_txc_dma17_error),
				  .dmc_txc_dma2_error( dmc_txc_dma18_error),
				  .dmc_txc_dma3_error( dmc_txc_dma19_error),

				     // Inputs
				     .SysClk(SysClk),
				     .Reset_L(Reset_L),
				     .Slave_Read(Slave_Read_dma16_19),
				     .Slave_Sel(Slave_Sel_dma16_19),
				     .Slave_Addr(Slave_Addr_dma16_19[19:0]),
				     .Slave_DataIn(Slave_DataIn[63:0]),
				     .slaveStrobe(slaveStrobe),
				     .pio_clients_32b(pio_clients_32b_d_dma16_19),	

				     .write_DMA0_Register(write_DMA16_Register),
				     .write_DMA1_Register(write_DMA17_Register),
				     .write_DMA2_Register(write_DMA18_Register),
				     .write_DMA3_Register(write_DMA19_Register),
				     .write_FZC_DMA0_Register(write_FZC_DMA16_Register),
				     .write_FZC_DMA1_Register(write_FZC_DMA17_Register),
				     .write_FZC_DMA2_Register(write_FZC_DMA18_Register),
				     .write_FZC_DMA3_Register(write_FZC_DMA19_Register),
				     .read_DMA_0_3_Regsister(read_DMA_16_19_Regsister[7:0]),
				
				     .txc_dmc_nack_pkt_rd_addr(txc_dmc_nack_pkt_rd_addr),
                                     .txc_dmc_p0_pkt_size_err_addr(txc_dmc_p0_pkt_size_err_addr),
                                     .txc_dmc_p0_pkt_size_err(txc_dmc_p0_pkt_size_err),
                                     .txc_dmc_nack_pkt_rd(txc_dmc_nack_pkt_rd),
                                     .txc_dmc_p1_pkt_size_err_addr(txc_dmc_p1_pkt_size_err_addr),
                                     .txc_dmc_p1_pkt_size_err(txc_dmc_p1_pkt_size_err),
                                     .txc_dmc_p2_pkt_size_err_addr(txc_dmc_p2_pkt_size_err_addr),
                                     .txc_dmc_p2_pkt_size_err(txc_dmc_p2_pkt_size_err),
                                     .txc_dmc_p3_pkt_size_err_addr(txc_dmc_p3_pkt_size_err_addr),
                                     .txc_dmc_p3_pkt_size_err(txc_dmc_p3_pkt_size_err),
				  
   				     .txpref_nack_resp(txpref_nack_resp),
   				     .txpref_nack_rd_addr(txpref_nack_rd_addr),
				     .mbox_err_received(mbox_err_received),

				     .txc_dmc_dma0_inc_pkt_cnt(txc_dmc_dma16_inc_pkt_cnt),
 				     .txc_dmc_dma0_mark_bit(txc_dmc_dma16_mark_bit),
 				     .txc_dmc_dma1_inc_pkt_cnt(txc_dmc_dma17_inc_pkt_cnt),
 				     .txc_dmc_dma1_mark_bit(txc_dmc_dma17_mark_bit),
 				     .txc_dmc_dma2_inc_pkt_cnt(txc_dmc_dma18_inc_pkt_cnt),
 				     .txc_dmc_dma2_mark_bit(txc_dmc_dma18_mark_bit),
 				     .txc_dmc_dma3_inc_pkt_cnt(txc_dmc_dma19_inc_pkt_cnt),
 				     .txc_dmc_dma3_mark_bit(txc_dmc_dma19_mark_bit),


			// DMA16 - PIORegs Ins 
				     .tx_rng_head_dma0(tx_rng_head_dma16[`PTR_WIDTH :0]),
				     .dma0_clear_reset(dma16_clear_reset),
				     .set_cfg_dma0_mmk(set_cfg_dma16_mmk),
				     .set_cfg_dma0_mk(set_cfg_dma16_mk),
				     .clear_cfg_dma0_mb(clear_cfg_dma16_mb),

				     .set_pref_buf_par_err_dma0(set_pref_buf_par_err_dma16),
				     .set_pkt_part_err_dma0(set_pkt_part_err_dma16),
				     .pkt_part_error_address_dma0(pkt_part_error_address_dma16),
				     .set_conf_part_error_dma0(set_conf_part_error_dma16),
				     .set_tx_ring_oflow_dma0(set_tx_ring_oflow_dma16),
				     .set_mbox_part_error_dma0(set_mbox_part_error_dma[16]),

				     .txc_dmc_p0_dma0_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[16]),
                                     .txc_dmc_dma0_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[16]),
				     .txc_dmc_p1_dma0_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[16]),
				     .txc_dmc_p2_dma0_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[16]),
				     .txc_dmc_p3_dma0_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[16]),

			             .txpref_dma0_nack_resp(txpref_dma_nack_resp[16]),
				     .mbox_ack_dma0_err_received (mbox_ack_dma_err_received[16]),
				     .ShadowRingCurrentPtr_DMA0(ShadowRingCurrentPtr_DMA16),	
				     .tx_dma_cfg_dma0_stop_state(tx_dma_cfg_dma16_stop_state),

                        // DMA17 - PIORegs Ins
                                     .tx_rng_head_dma1(tx_rng_head_dma17[`PTR_WIDTH :0]),
                                     .dma1_clear_reset(dma17_clear_reset),
                                     .set_cfg_dma1_mmk(set_cfg_dma17_mmk),
                                     .set_cfg_dma1_mk(set_cfg_dma17_mk),
                                     .clear_cfg_dma1_mb(clear_cfg_dma17_mb),

				     .set_pref_buf_par_err_dma1(set_pref_buf_par_err_dma17),
				     .set_pkt_part_err_dma1(set_pkt_part_err_dma17),
				     .pkt_part_error_address_dma1(pkt_part_error_address_dma17),
				     .set_conf_part_error_dma1(set_conf_part_error_dma17),
				     .set_tx_ring_oflow_dma1(set_tx_ring_oflow_dma17),
				     .set_mbox_part_error_dma1(set_mbox_part_error_dma[17]),


				     .txc_dmc_p0_dma1_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[17]),
                                     .txc_dmc_dma1_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[17]),

				     .txc_dmc_p1_dma1_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[17]),

				     .txc_dmc_p2_dma1_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[17]),

				     .txc_dmc_p3_dma1_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[17]),
			             .txpref_dma1_nack_resp(txpref_dma_nack_resp[17]),
				     .mbox_ack_dma1_err_received (mbox_ack_dma_err_received[17]),
				     .ShadowRingCurrentPtr_DMA1(ShadowRingCurrentPtr_DMA17),	
				     .tx_dma_cfg_dma1_stop_state(tx_dma_cfg_dma17_stop_state),

                        // DMA18 - PIORegs Ins
                                     .tx_rng_head_dma2(tx_rng_head_dma18[`PTR_WIDTH :0]),
                                     .dma2_clear_reset(dma18_clear_reset),
                                     .set_cfg_dma2_mmk(set_cfg_dma18_mmk),
                                     .set_cfg_dma2_mk(set_cfg_dma18_mk),
                                     .clear_cfg_dma2_mb(clear_cfg_dma18_mb),

				     .set_pref_buf_par_err_dma2(set_pref_buf_par_err_dma18),
				     .set_pkt_part_err_dma2(set_pkt_part_err_dma18),
				     .pkt_part_error_address_dma2(pkt_part_error_address_dma18),
				     .set_conf_part_error_dma2(set_conf_part_error_dma18),
				     .set_tx_ring_oflow_dma2(set_tx_ring_oflow_dma18),
				     .set_mbox_part_error_dma2(set_mbox_part_error_dma[18]),

				     .txc_dmc_p0_dma2_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[18]),
                                     .txc_dmc_dma2_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[18]),
				     .txc_dmc_p1_dma2_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[18]),
				     .txc_dmc_p2_dma2_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[18]),
				     .txc_dmc_p3_dma2_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[18]),
			             .txpref_dma2_nack_resp(txpref_dma_nack_resp[18]),
				     .mbox_ack_dma2_err_received (mbox_ack_dma_err_received[18]),
				     .ShadowRingCurrentPtr_DMA2(ShadowRingCurrentPtr_DMA18),	
				     .tx_dma_cfg_dma2_stop_state(tx_dma_cfg_dma18_stop_state),

                        // DMA19 - PIORegs Ins
                                     .tx_rng_head_dma3(tx_rng_head_dma19[`PTR_WIDTH :0]),
                                     .dma3_clear_reset(dma19_clear_reset),
                                     .set_cfg_dma3_mmk(set_cfg_dma19_mmk),
                                     .set_cfg_dma3_mk(set_cfg_dma19_mk),
                                     .clear_cfg_dma3_mb(clear_cfg_dma19_mb),

				     .set_pref_buf_par_err_dma3(set_pref_buf_par_err_dma19),
				     .set_pkt_part_err_dma3(set_pkt_part_err_dma19),
				     .pkt_part_error_address_dma3(pkt_part_error_address_dma19),
				     .set_conf_part_error_dma3(set_conf_part_error_dma19),
				     .set_tx_ring_oflow_dma3(set_tx_ring_oflow_dma19),
				     .set_mbox_part_error_dma3(set_mbox_part_error_dma[19]),
				  .txc_dmc_p0_dma3_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[19]),
                                     .txc_dmc_dma3_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[19]),
				     .txc_dmc_p1_dma3_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[19]),
				     .txc_dmc_p2_dma3_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[19]),
				     .txc_dmc_p3_dma3_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[19]),
				  
			             .txpref_dma3_nack_resp(txpref_dma_nack_resp[19]),
				     .mbox_ack_dma3_err_received (mbox_ack_dma_err_received[19]),
				     .ShadowRingCurrentPtr_DMA3(ShadowRingCurrentPtr_DMA19),
				     .tx_dma_cfg_dma3_stop_state(tx_dma_cfg_dma19_stop_state)

				     );



// Regsisters for DMAs 20 21 22 23

 niu_tdmc_dmaregs niu_tdmc_dmaregs_20_23 
				 (/*AUTOJUNK*/
				     // Outputs
			// DMA20 - PIORegs Outs 
				     .page0_mask_dma0(page0_mask_dma20[31:0]),
				     .page0_value_dma0(page0_value_dma20[31:0]),
				     .page0_reloc_dma0(page0_reloc_dma20[31:0]),
				     .page0_valid_dma0(page0_valid_dma20),
				     .page1_mask_dma0(page1_mask_dma20[31:0]),
				     .page1_value_dma0(page1_value_dma20[31:0]),
				     .page1_reloc_dma0(page1_reloc_dma20[31:0]),
				     .page1_valid_dma0(page1_valid_dma20),
				     .dmc_txc_dma0_page_handle(dmc_txc_dma20_page_handle[19:0]),
				     .dmc_txc_dma0_func_num(dmc_txc_dma20_func_num[1:0]),
				     .tx_rng_cfg_dma0_len(tx_rng_cfg_dma20_len[`RNG_LENGTH_WIDTH -1 :0]),
				     .tx_rng_cfg_dma0_staddr(tx_rng_cfg_dma20_staddr[37:0]),
				     .tx_rng_tail_dma0(tx_rng_tail_dma20[`PTR_WIDTH :0]),
				     .tx_dma_cfg_dma0_rst(tx_dma_cfg_dma20_rst),
				     .tx_dma_cfg_dma0_stop(tx_dma_cfg_dma20_stop),	
				     .tx_dma_cfg_dma0_stall(tx_dma_cfg_dma20_stall),
				     .tx_dma_cfg_dma0_mbaddr(tx_dma_cfg_dma20_mbaddr[37:0]),
				     .tx_cfg_dma0_enable_mb(tx_cfg_dma20_enable_mb),
				     .tx_cfg_dma0_mk(tx_cfg_dma20_mk),
				     .tx_cfg_dma0_mmk(tx_cfg_dma20_mmk),
				     .tx_cs_dma0(tx_cs_dma20[63:0]),
				     .tx_dma0_pre_st(tx_dma20_pre_st[63:0]),
				     .tx_dma0_rng_err_logh(tx_dma20_rng_err_logh[63:0]),
				     .tx_dma0_rng_err_logl(tx_dma20_rng_err_logl[63:0]),
			             .intr_ldf0_dma0( tdmc_pio_intr[20] ),		
			             .intr_ldf1_dma0( tdmc_pio_intr[52] ),		


			// DMA21 - PIORegs Outs
                                     .page0_mask_dma1(page0_mask_dma21[31:0]),
                                     .page0_value_dma1(page0_value_dma21[31:0]),
                                     .page0_reloc_dma1(page0_reloc_dma21[31:0]),
                                     .page0_valid_dma1(page0_valid_dma21),
                                     .page1_mask_dma1(page1_mask_dma21[31:0]),
                                     .page1_value_dma1(page1_value_dma21[31:0]),
                                     .page1_reloc_dma1(page1_reloc_dma21[31:0]),
                                     .page1_valid_dma1(page1_valid_dma21),
                                     .dmc_txc_dma1_page_handle(dmc_txc_dma21_page_handle[19:0]),
				     .dmc_txc_dma1_func_num(dmc_txc_dma21_func_num[1:0]),
                                     .tx_rng_cfg_dma1_len(tx_rng_cfg_dma21_len[`RNG_LENGTH_WIDTH -1 :0]),
                                     .tx_rng_cfg_dma1_staddr(tx_rng_cfg_dma21_staddr[37:0]),
                                     .tx_rng_tail_dma1(tx_rng_tail_dma21[`PTR_WIDTH :0]),
                                     .tx_dma_cfg_dma1_rst(tx_dma_cfg_dma21_rst),
				     .tx_dma_cfg_dma1_stop(tx_dma_cfg_dma21_stop),	
                                     .tx_dma_cfg_dma1_stall(tx_dma_cfg_dma21_stall),
                                     .tx_dma_cfg_dma1_mbaddr(tx_dma_cfg_dma21_mbaddr[37:0]),
                                     .tx_cfg_dma1_enable_mb(tx_cfg_dma21_enable_mb),
                                     .tx_cfg_dma1_mk(tx_cfg_dma21_mk),
                                     .tx_cfg_dma1_mmk(tx_cfg_dma21_mmk),
                                     .tx_cs_dma1(tx_cs_dma21[63:0]),
                                     .tx_dma1_pre_st(tx_dma21_pre_st[63:0]),
                                     .tx_dma1_rng_err_logh(tx_dma21_rng_err_logh[63:0]),
                                     .tx_dma1_rng_err_logl(tx_dma21_rng_err_logl[63:0]),
			             .intr_ldf0_dma1( tdmc_pio_intr[21] ),		
			             .intr_ldf1_dma1( tdmc_pio_intr[53] ),		

                        // DMA22 - PIORegs Outs
                                     .page0_mask_dma2(page0_mask_dma22[31:0]),
                                     .page0_value_dma2(page0_value_dma22[31:0]),
                                     .page0_reloc_dma2(page0_reloc_dma22[31:0]),
                                     .page0_valid_dma2(page0_valid_dma22),
                                     .page1_mask_dma2(page1_mask_dma22[31:0]),
                                     .page1_value_dma2(page1_value_dma22[31:0]),
                                     .page1_reloc_dma2(page1_reloc_dma22[31:0]),
                                     .page1_valid_dma2(page1_valid_dma22),
                                     .dmc_txc_dma2_page_handle(dmc_txc_dma22_page_handle[19:0]),
				     .dmc_txc_dma2_func_num(dmc_txc_dma22_func_num[1:0]),
                                     .tx_rng_cfg_dma2_len(tx_rng_cfg_dma22_len[`RNG_LENGTH_WIDTH -1 :0]),
                                     .tx_rng_cfg_dma2_staddr(tx_rng_cfg_dma22_staddr[37:0]),
                                     .tx_rng_tail_dma2(tx_rng_tail_dma22[`PTR_WIDTH :0]),
                                     .tx_dma_cfg_dma2_rst(tx_dma_cfg_dma22_rst),
				     .tx_dma_cfg_dma2_stop(tx_dma_cfg_dma22_stop),	
                                     .tx_dma_cfg_dma2_stall(tx_dma_cfg_dma22_stall),
                                     .tx_dma_cfg_dma2_mbaddr(tx_dma_cfg_dma22_mbaddr[37:0]),
                                     .tx_cfg_dma2_enable_mb(tx_cfg_dma22_enable_mb),
                                     .tx_cfg_dma2_mk(tx_cfg_dma22_mk),
                                     .tx_cfg_dma2_mmk(tx_cfg_dma22_mmk),
                                     .tx_cs_dma2(tx_cs_dma22[63:0]),
                                     .tx_dma2_pre_st(tx_dma22_pre_st[63:0]),
                                     .tx_dma2_rng_err_logh(tx_dma22_rng_err_logh[63:0]),
                                     .tx_dma2_rng_err_logl(tx_dma22_rng_err_logl[63:0]),
			             .intr_ldf0_dma2( tdmc_pio_intr[22] ),		
			             .intr_ldf1_dma2( tdmc_pio_intr[54] ),		

                        // DMA23 - PIORegs Outs
                                     .page0_mask_dma3(page0_mask_dma23[31:0]),
                                     .page0_value_dma3(page0_value_dma23[31:0]),
                                     .page0_reloc_dma3(page0_reloc_dma23[31:0]),
                                     .page0_valid_dma3(page0_valid_dma23),
                                     .page1_mask_dma3(page1_mask_dma23[31:0]),
                                     .page1_value_dma3(page1_value_dma23[31:0]),
                                     .page1_reloc_dma3(page1_reloc_dma23[31:0]),
                                     .page1_valid_dma3(page1_valid_dma23),
                                     .dmc_txc_dma3_page_handle(dmc_txc_dma23_page_handle[19:0]),
				     .dmc_txc_dma3_func_num(dmc_txc_dma23_func_num[1:0]),
                                     .tx_rng_cfg_dma3_len(tx_rng_cfg_dma23_len[`RNG_LENGTH_WIDTH -1 :0]),
                                     .tx_rng_cfg_dma3_staddr(tx_rng_cfg_dma23_staddr[37:0]),
                                     .tx_rng_tail_dma3(tx_rng_tail_dma23[`PTR_WIDTH :0]),
                                     .tx_dma_cfg_dma3_rst(tx_dma_cfg_dma23_rst),
				     .tx_dma_cfg_dma3_stop(tx_dma_cfg_dma23_stop),	
                                     .tx_dma_cfg_dma3_stall(tx_dma_cfg_dma23_stall),
                                     .tx_dma_cfg_dma3_mbaddr(tx_dma_cfg_dma23_mbaddr[37:0]),
                                     .tx_cfg_dma3_enable_mb(tx_cfg_dma23_enable_mb),
                                     .tx_cfg_dma3_mk(tx_cfg_dma23_mk),
                                     .tx_cfg_dma3_mmk(tx_cfg_dma23_mmk),
                                     .tx_cs_dma3(tx_cs_dma23[63:0]),
                                     .tx_dma3_pre_st(tx_dma23_pre_st[63:0]),
                                     .tx_dma3_rng_err_logh(tx_dma23_rng_err_logh[63:0]),
                                     .tx_dma3_rng_err_logl(tx_dma23_rng_err_logl[63:0]),
			             .intr_ldf0_dma3( tdmc_pio_intr[23] ),		
			             .intr_ldf1_dma3( tdmc_pio_intr[55] ),		
					
                                     .dma_0_3_sl_data(dma_20_23_sl_data),
				     .read_decode_invalid_dma0_3(read_decode_invalid_dma20_23),
				  .dmc_txc_dma0_error ( dmc_txc_dma20_error),
				  .dmc_txc_dma1_error( dmc_txc_dma21_error),
				  .dmc_txc_dma2_error( dmc_txc_dma22_error),
				  .dmc_txc_dma3_error( dmc_txc_dma23_error),
				  
				     // Inputs
				     .SysClk(SysClk),
				     .Reset_L(Reset_L),
				     .Slave_Read(Slave_Read_dma20_23),
				     .Slave_Sel(Slave_Sel_dma20_23),
				     .Slave_Addr(Slave_Addr_dma20_23[19:0]),
				     .Slave_DataIn(Slave_DataIn[63:0]),
				     .slaveStrobe(slaveStrobe),
				     .pio_clients_32b(pio_clients_32b_d_dma20_23),	

				     .write_DMA0_Register(write_DMA20_Register),
				     .write_DMA1_Register(write_DMA21_Register),
				     .write_DMA2_Register(write_DMA22_Register),
				     .write_DMA3_Register(write_DMA23_Register),
				     .write_FZC_DMA0_Register(write_FZC_DMA20_Register),
				     .write_FZC_DMA1_Register(write_FZC_DMA21_Register),
				     .write_FZC_DMA2_Register(write_FZC_DMA22_Register),
				     .write_FZC_DMA3_Register(write_FZC_DMA23_Register),
				     .read_DMA_0_3_Regsister(read_DMA_20_23_Regsister[7:0]),
				


				     .txc_dmc_nack_pkt_rd_addr(txc_dmc_nack_pkt_rd_addr),
                                     .txc_dmc_p0_pkt_size_err_addr(txc_dmc_p0_pkt_size_err_addr),
                                     .txc_dmc_p0_pkt_size_err(txc_dmc_p0_pkt_size_err),
                                     .txc_dmc_nack_pkt_rd(txc_dmc_nack_pkt_rd),
                                     .txc_dmc_p1_pkt_size_err_addr(txc_dmc_p1_pkt_size_err_addr),
                                     .txc_dmc_p1_pkt_size_err(txc_dmc_p1_pkt_size_err),
                                     .txc_dmc_p2_pkt_size_err_addr(txc_dmc_p2_pkt_size_err_addr),
                                     .txc_dmc_p2_pkt_size_err(txc_dmc_p2_pkt_size_err),
                                     .txc_dmc_p3_pkt_size_err_addr(txc_dmc_p3_pkt_size_err_addr),
                                     .txc_dmc_p3_pkt_size_err(txc_dmc_p3_pkt_size_err),
				  
   				     .txpref_nack_resp(txpref_nack_resp),
   				     .txpref_nack_rd_addr(txpref_nack_rd_addr),
				     .mbox_err_received(mbox_err_received),

				     .txc_dmc_dma0_inc_pkt_cnt(txc_dmc_dma20_inc_pkt_cnt),
 				     .txc_dmc_dma0_mark_bit(txc_dmc_dma20_mark_bit),
 				     .txc_dmc_dma1_inc_pkt_cnt(txc_dmc_dma21_inc_pkt_cnt),
 				     .txc_dmc_dma1_mark_bit(txc_dmc_dma21_mark_bit),
 				     .txc_dmc_dma2_inc_pkt_cnt(txc_dmc_dma22_inc_pkt_cnt),
 				     .txc_dmc_dma2_mark_bit(txc_dmc_dma22_mark_bit),
 				     .txc_dmc_dma3_inc_pkt_cnt(txc_dmc_dma23_inc_pkt_cnt),
 				     .txc_dmc_dma3_mark_bit(txc_dmc_dma23_mark_bit),

			// DMA20 - PIORegs Ins 
				     .tx_rng_head_dma0(tx_rng_head_dma20[`PTR_WIDTH :0]),
				     .dma0_clear_reset(dma20_clear_reset),
				     .set_cfg_dma0_mmk(set_cfg_dma20_mmk),
				     .set_cfg_dma0_mk(set_cfg_dma20_mk),
				     .clear_cfg_dma0_mb(clear_cfg_dma20_mb),

				     .set_pref_buf_par_err_dma0(set_pref_buf_par_err_dma20),
				     .set_pkt_part_err_dma0(set_pkt_part_err_dma20),
				     .pkt_part_error_address_dma0(pkt_part_error_address_dma20),
				     .set_conf_part_error_dma0(set_conf_part_error_dma20),
				     .set_tx_ring_oflow_dma0(set_tx_ring_oflow_dma20),
				     .set_mbox_part_error_dma0(set_mbox_part_error_dma[20]),

				  .txc_dmc_p0_dma0_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[20]),
                                     .txc_dmc_dma0_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[20]),
				     .txc_dmc_p1_dma0_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[20]),
				     .txc_dmc_p2_dma0_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[20]),
				     .txc_dmc_p3_dma0_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[20]),
				  
			             .txpref_dma0_nack_resp(txpref_dma_nack_resp[20]),
				     .mbox_ack_dma0_err_received (mbox_ack_dma_err_received[20]),
				     .ShadowRingCurrentPtr_DMA0(ShadowRingCurrentPtr_DMA20),	
				     .tx_dma_cfg_dma0_stop_state(tx_dma_cfg_dma20_stop_state),

                        // DMA21 - PIORegs Ins
                                     .tx_rng_head_dma1(tx_rng_head_dma21[`PTR_WIDTH :0]),
                                     .dma1_clear_reset(dma21_clear_reset),
                                     .set_cfg_dma1_mmk(set_cfg_dma21_mmk),
                                     .set_cfg_dma1_mk(set_cfg_dma21_mk),
                                     .clear_cfg_dma1_mb(clear_cfg_dma21_mb),

				     .set_pref_buf_par_err_dma1(set_pref_buf_par_err_dma21),
				     .set_pkt_part_err_dma1(set_pkt_part_err_dma21),
				     .pkt_part_error_address_dma1(pkt_part_error_address_dma21),
				     .set_conf_part_error_dma1(set_conf_part_error_dma21),
				     .set_tx_ring_oflow_dma1(set_tx_ring_oflow_dma21),
				     .set_mbox_part_error_dma1(set_mbox_part_error_dma[21]),


				     .txc_dmc_p0_dma1_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[21]),
                                     .txc_dmc_dma1_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[21]),

				     .txc_dmc_p1_dma1_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[21]),

				     .txc_dmc_p2_dma1_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[21]),

				     .txc_dmc_p3_dma1_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[21]),
				  
			             .txpref_dma1_nack_resp(txpref_dma_nack_resp[21]),
				     .mbox_ack_dma1_err_received (mbox_ack_dma_err_received[21]),
				     .ShadowRingCurrentPtr_DMA1(ShadowRingCurrentPtr_DMA21),	
				     .tx_dma_cfg_dma1_stop_state(tx_dma_cfg_dma21_stop_state),

                        // DMA22 - PIORegs Ins
                                     .tx_rng_head_dma2(tx_rng_head_dma22[`PTR_WIDTH :0]),
                                     .dma2_clear_reset(dma22_clear_reset),
                                     .set_cfg_dma2_mmk(set_cfg_dma22_mmk),
                                     .set_cfg_dma2_mk(set_cfg_dma22_mk),
                                     .clear_cfg_dma2_mb(clear_cfg_dma22_mb),

				     .set_pref_buf_par_err_dma2(set_pref_buf_par_err_dma22),
				     .set_pkt_part_err_dma2(set_pkt_part_err_dma22),
				     .pkt_part_error_address_dma2(pkt_part_error_address_dma22),
				     .set_conf_part_error_dma2(set_conf_part_error_dma22),
				     .set_tx_ring_oflow_dma2(set_tx_ring_oflow_dma22),
				     .set_mbox_part_error_dma2(set_mbox_part_error_dma[22]),

				  
				     .txc_dmc_p0_dma2_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[22]),
                                     .txc_dmc_dma2_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[22]),
				     .txc_dmc_p1_dma2_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[22]),
				     .txc_dmc_p2_dma2_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[22]),
				     .txc_dmc_p3_dma2_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[22]),
			             .txpref_dma2_nack_resp(txpref_dma_nack_resp[22]),
				     .mbox_ack_dma2_err_received (mbox_ack_dma_err_received[22]),
				     .ShadowRingCurrentPtr_DMA2(ShadowRingCurrentPtr_DMA22),	
				     .tx_dma_cfg_dma2_stop_state(tx_dma_cfg_dma22_stop_state),

                        // DMA23 - PIORegs Ins
                                     .tx_rng_head_dma3(tx_rng_head_dma23[`PTR_WIDTH :0]),
                                     .dma3_clear_reset(dma23_clear_reset),
                                     .set_cfg_dma3_mmk(set_cfg_dma23_mmk),
                                     .set_cfg_dma3_mk(set_cfg_dma23_mk),
                                     .clear_cfg_dma3_mb(clear_cfg_dma23_mb),

				     .set_pref_buf_par_err_dma3(set_pref_buf_par_err_dma23),
				     .set_pkt_part_err_dma3(set_pkt_part_err_dma23),
				     .pkt_part_error_address_dma3(pkt_part_error_address_dma23),
				     .set_conf_part_error_dma3(set_conf_part_error_dma23),
				     .set_tx_ring_oflow_dma3(set_tx_ring_oflow_dma23),
				     .set_mbox_part_error_dma3(set_mbox_part_error_dma[23]),
				  .txc_dmc_p0_dma3_pkt_size_err(txc_dmc_p0_dma_pkt_size_err[23]),
                                     .txc_dmc_dma3_nack_pkt_rd(txc_dmc_dma_nack_pkt_rd[23]),
				     .txc_dmc_p1_dma3_pkt_size_err(txc_dmc_p1_dma_pkt_size_err[23]),
				     .txc_dmc_p2_dma3_pkt_size_err(txc_dmc_p2_dma_pkt_size_err[23]),
				     .txc_dmc_p3_dma3_pkt_size_err(txc_dmc_p3_dma_pkt_size_err[23]),
			             .txpref_dma3_nack_resp(txpref_dma_nack_resp[23]),
				     .mbox_ack_dma3_err_received (mbox_ack_dma_err_received[23]),
				     .ShadowRingCurrentPtr_DMA3(ShadowRingCurrentPtr_DMA23),
				     .tx_dma_cfg_dma3_stop_state(tx_dma_cfg_dma23_stop_state)

				     );



`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
		       
   
`ifdef NEPTUNE
   
   assign tdmc_pio_intr[31:24] = 8'h0;
   assign tdmc_pio_intr[63:56] = 8'h0;
`else // !ifdef NEPTUNE
   assign tdmc_pio_intr[31:16] = 16'h0;
   assign tdmc_pio_intr[63:48] = 16'h0;
`endif // !ifdef CHANNELS_16
   
   
endmodule // niu_dmc_txpios

// Local Variables:
// verilog-library-directories:(".")
// End:
