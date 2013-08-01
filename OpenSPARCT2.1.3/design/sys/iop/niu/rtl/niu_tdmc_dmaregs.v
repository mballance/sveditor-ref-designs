// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_tdmc_dmaregs.v
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
 *  NIU TDMC - PIO Interface and Control regs for 4 DMAs
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



module niu_tdmc_dmaregs(/*AUTOARG*/
   // Outputs
   tx_dma_cfg_dma0_stop, page0_mask_dma0, page0_value_dma0, 
   page0_reloc_dma0, page0_valid_dma0, page1_mask_dma0, 
   page1_value_dma0, page1_reloc_dma0, page1_valid_dma0, 
   dmc_txc_dma0_page_handle, dmc_txc_dma0_func_num, 
   tx_rng_cfg_dma0_len, tx_rng_cfg_dma0_staddr, tx_rng_tail_dma0, 
   tx_dma_cfg_dma0_rst, tx_dma_cfg_dma0_stall, 
   tx_dma_cfg_dma0_mbaddr, tx_cfg_dma0_enable_mb, tx_cfg_dma0_mk, 
   tx_cfg_dma0_mmk, tx_cs_dma0, tx_dma0_pre_st, tx_dma0_rng_err_logh, 
   tx_dma0_rng_err_logl, tx_dma_cfg_dma1_stop, page0_mask_dma1, 
   page0_value_dma1, page0_reloc_dma1, page0_valid_dma1, 
   page1_mask_dma1, page1_value_dma1, page1_reloc_dma1, 
   page1_valid_dma1, dmc_txc_dma1_page_handle, dmc_txc_dma1_func_num, 
   tx_rng_cfg_dma1_len, tx_rng_cfg_dma1_staddr, tx_rng_tail_dma1, 
   tx_dma_cfg_dma1_rst, tx_dma_cfg_dma1_stall, 
   tx_dma_cfg_dma1_mbaddr, tx_cfg_dma1_enable_mb, tx_cfg_dma1_mk, 
   tx_cfg_dma1_mmk, tx_cs_dma1, tx_dma1_pre_st, tx_dma1_rng_err_logh, 
   tx_dma1_rng_err_logl, tx_dma_cfg_dma2_stop, page0_mask_dma2, 
   page0_value_dma2, page0_reloc_dma2, page0_valid_dma2, 
   page1_mask_dma2, page1_value_dma2, page1_reloc_dma2, 
   page1_valid_dma2, dmc_txc_dma2_page_handle, dmc_txc_dma2_func_num, 
   tx_rng_cfg_dma2_len, tx_rng_cfg_dma2_staddr, tx_rng_tail_dma2, 
   tx_dma_cfg_dma2_rst, tx_dma_cfg_dma2_stall, 
   tx_dma_cfg_dma2_mbaddr, tx_cfg_dma2_enable_mb, tx_cfg_dma2_mk, 
   tx_cfg_dma2_mmk, tx_cs_dma2, tx_dma2_pre_st, tx_dma2_rng_err_logh, 
   tx_dma2_rng_err_logl, tx_dma_cfg_dma3_stop, page0_mask_dma3, 
   page0_value_dma3, page0_reloc_dma3, page0_valid_dma3, 
   page1_mask_dma3, page1_value_dma3, page1_reloc_dma3, 
   page1_valid_dma3, dmc_txc_dma3_page_handle, dmc_txc_dma3_func_num, 
   tx_rng_cfg_dma3_len, tx_rng_cfg_dma3_staddr, tx_rng_tail_dma3, 
   tx_dma_cfg_dma3_rst, tx_dma_cfg_dma3_stall, 
   tx_dma_cfg_dma3_mbaddr, tx_cfg_dma3_enable_mb, tx_cfg_dma3_mk, 
   tx_cfg_dma3_mmk, tx_cs_dma3, tx_dma3_pre_st, tx_dma3_rng_err_logh, 
   tx_dma3_rng_err_logl, dma_0_3_sl_data, read_decode_invalid_dma0_3, 
   intr_ldf0_dma0, intr_ldf1_dma0, intr_ldf0_dma1, intr_ldf1_dma1, 
   intr_ldf0_dma2, intr_ldf1_dma2, intr_ldf0_dma3, intr_ldf1_dma3, 
   dmc_txc_dma0_error, dmc_txc_dma1_error, dmc_txc_dma2_error, 
   dmc_txc_dma3_error, 
   // Inputs
   SysClk, Reset_L, Slave_Read, Slave_Sel, Slave_Addr, Slave_DataIn, 
   slaveStrobe, pio_clients_32b, write_DMA0_Register, 
   write_DMA1_Register, write_DMA2_Register, write_DMA3_Register, 
   write_FZC_DMA0_Register, write_FZC_DMA1_Register, 
   write_FZC_DMA2_Register, write_FZC_DMA3_Register, 
   read_DMA_0_3_Regsister, tx_rng_head_dma0, dma0_clear_reset, 
   set_cfg_dma0_mmk, clear_cfg_dma0_mb, tx_dma_cfg_dma0_stop_state, 
   tx_rng_head_dma1, dma1_clear_reset, set_cfg_dma1_mmk, 
   clear_cfg_dma1_mb, tx_dma_cfg_dma1_stop_state, tx_rng_head_dma2, 
   dma2_clear_reset, set_cfg_dma2_mmk, clear_cfg_dma2_mb, 
   tx_dma_cfg_dma2_stop_state, tx_rng_head_dma3, dma3_clear_reset, 
   set_cfg_dma3_mmk, clear_cfg_dma3_mb, tx_dma_cfg_dma3_stop_state, 
   txc_dmc_dma0_inc_pkt_cnt, txc_dmc_dma1_inc_pkt_cnt, 
   txc_dmc_dma2_inc_pkt_cnt, txc_dmc_dma3_inc_pkt_cnt, 
   txc_dmc_dma0_mark_bit, txc_dmc_dma1_mark_bit, 
   txc_dmc_dma2_mark_bit, txc_dmc_dma3_mark_bit, 
   set_pref_buf_par_err_dma0, set_pkt_part_err_dma0, 
   pkt_part_error_address_dma0, set_conf_part_error_dma0, 
   set_tx_ring_oflow_dma0, set_mbox_part_error_dma0, 
   txc_dmc_p0_dma0_pkt_size_err, txc_dmc_dma0_nack_pkt_rd, 
   txc_dmc_p1_dma0_pkt_size_err, txc_dmc_p2_dma0_pkt_size_err, 
   txc_dmc_p3_dma0_pkt_size_err, set_pref_buf_par_err_dma1, 
   set_pkt_part_err_dma1, pkt_part_error_address_dma1, 
   set_conf_part_error_dma1, set_tx_ring_oflow_dma1, 
   set_mbox_part_error_dma1, txc_dmc_p0_dma1_pkt_size_err, 
   txc_dmc_dma1_nack_pkt_rd, txc_dmc_p1_dma1_pkt_size_err, 
   txc_dmc_p2_dma1_pkt_size_err, txc_dmc_p3_dma1_pkt_size_err, 
   set_pref_buf_par_err_dma2, set_pkt_part_err_dma2, 
   pkt_part_error_address_dma2, set_conf_part_error_dma2, 
   set_tx_ring_oflow_dma2, set_mbox_part_error_dma2, 
   txc_dmc_p0_dma2_pkt_size_err, txc_dmc_dma2_nack_pkt_rd, 
   txc_dmc_p1_dma2_pkt_size_err, txc_dmc_p2_dma2_pkt_size_err, 
   txc_dmc_p3_dma2_pkt_size_err, set_pref_buf_par_err_dma3, 
   set_pkt_part_err_dma3, pkt_part_error_address_dma3, 
   set_conf_part_error_dma3, set_tx_ring_oflow_dma3, 
   set_mbox_part_error_dma3, txc_dmc_p0_dma3_pkt_size_err, 
   txc_dmc_dma3_nack_pkt_rd, txc_dmc_p1_dma3_pkt_size_err, 
   txc_dmc_p2_dma3_pkt_size_err, txc_dmc_p3_dma3_pkt_size_err, 
   txc_dmc_nack_pkt_rd_addr, txc_dmc_p0_pkt_size_err_addr, 
   txc_dmc_p0_pkt_size_err, txc_dmc_nack_pkt_rd, 
   txc_dmc_p1_pkt_size_err_addr, txc_dmc_p1_pkt_size_err, 
   txc_dmc_p2_pkt_size_err_addr, txc_dmc_p2_pkt_size_err, 
   txc_dmc_p3_pkt_size_err_addr, txc_dmc_p3_pkt_size_err, 
   txpref_dma0_nack_resp, txpref_dma1_nack_resp, 
   txpref_dma2_nack_resp, txpref_dma3_nack_resp, txpref_nack_resp, 
   txpref_nack_rd_addr, mbox_ack_dma0_err_received, 
   mbox_ack_dma1_err_received, mbox_ack_dma2_err_received, 
   mbox_ack_dma3_err_received, mbox_err_received, 
   ShadowRingCurrentPtr_DMA0, ShadowRingCurrentPtr_DMA1, 
   ShadowRingCurrentPtr_DMA2, ShadowRingCurrentPtr_DMA3, 
   set_cfg_dma0_mk, set_cfg_dma1_mk, set_cfg_dma2_mk, 
   set_cfg_dma3_mk);


   // Global Signals
   input          SysClk;
   input 	  Reset_L;


   // Slave Interface
   input 	  Slave_Read;
   input 	  Slave_Sel;
   input [19:0]   Slave_Addr;
   input [63:0]   Slave_DataIn;
   input 	  slaveStrobe;
   input 	  pio_clients_32b;

   // Decode signals
   input 	  write_DMA0_Register;
   input 	  write_DMA1_Register;
   input 	  write_DMA2_Register;
   input 	  write_DMA3_Register; 
   input 	  write_FZC_DMA0_Register ;
   input 	  write_FZC_DMA1_Register ;
   input 	  write_FZC_DMA2_Register ;
   input 	  write_FZC_DMA3_Register ;
   input [7:0] 	  read_DMA_0_3_Regsister;
   

   // pios registers related signals
   
   input [`PTR_WIDTH:0] tx_rng_head_dma0 ;
   input 		dma0_clear_reset;
   input 		set_cfg_dma0_mmk;  // from mailbox
   input 		clear_cfg_dma0_mb;  // from mailbox
   input 		tx_dma_cfg_dma0_stop_state;
   output 		tx_dma_cfg_dma0_stop;
   output [31:0] 	page0_mask_dma0;
   output [31:0] 	page0_value_dma0;
   output [31:0] 	page0_reloc_dma0;
   output 		page0_valid_dma0;
   output [31:0] 	page1_mask_dma0;
   output [31:0] 	page1_value_dma0;
   output [31:0] 	page1_reloc_dma0;
   output 		page1_valid_dma0;
   output [19:0] 	dmc_txc_dma0_page_handle;
   output [1:0] 	dmc_txc_dma0_func_num;

   output [`RNG_LENGTH_WIDTH - 1:0] tx_rng_cfg_dma0_len;
   output [37:0] 		    tx_rng_cfg_dma0_staddr;
   output [`PTR_WIDTH:0] 	    tx_rng_tail_dma0 ;
   output 			    tx_dma_cfg_dma0_rst;
   output 			    tx_dma_cfg_dma0_stall;
   output [37:0] 		    tx_dma_cfg_dma0_mbaddr ;   
   output 			    tx_cfg_dma0_enable_mb; // to mailbox
   output 			    tx_cfg_dma0_mk; // to mailbox
   output 			    tx_cfg_dma0_mmk; // to mailbox
   output [63:0] 		    tx_cs_dma0; // to mailbox
   output [63:0] 		    tx_dma0_pre_st; // to mailbox
   output [63:0] 		    tx_dma0_rng_err_logh;  // to mailbox
   output [63:0] 		    tx_dma0_rng_err_logl;  // to mailbox

   input [`PTR_WIDTH:0] 	    tx_rng_head_dma1 ;
   input 			    dma1_clear_reset;
   input 			    set_cfg_dma1_mmk;  // from mailbox
   input 			    clear_cfg_dma1_mb;  // from mailbox

   
   input 			    tx_dma_cfg_dma1_stop_state;
   output 			    tx_dma_cfg_dma1_stop;
   output [31:0] 		    page0_mask_dma1;
   output [31:0] 		    page0_value_dma1;
   output [31:0] 		    page0_reloc_dma1;
   output 			    page0_valid_dma1;
   output [31:0] 		    page1_mask_dma1;
   output [31:0] 		    page1_value_dma1;
   output [31:0] 		    page1_reloc_dma1;
   output 			    page1_valid_dma1;
   output [19:0] 		    dmc_txc_dma1_page_handle;
   output [1:0] 		    dmc_txc_dma1_func_num;

   output [`RNG_LENGTH_WIDTH - 1:0] tx_rng_cfg_dma1_len;
   output [37:0] 		    tx_rng_cfg_dma1_staddr;
   output [`PTR_WIDTH:0] 	    tx_rng_tail_dma1 ;
   output 			    tx_dma_cfg_dma1_rst;
   output 			    tx_dma_cfg_dma1_stall;
   output [37:0] 		    tx_dma_cfg_dma1_mbaddr ;   
   output 			    tx_cfg_dma1_enable_mb; // to mailbox
   output 			    tx_cfg_dma1_mk; // to mailbox
   output 			    tx_cfg_dma1_mmk; // to mailbox
   output [63:0] 		    tx_cs_dma1; // to mailbox
   output [63:0] 		    tx_dma1_pre_st; // to mailbox
   output [63:0] 		    tx_dma1_rng_err_logh;  // to mailbox
   output [63:0] 		    tx_dma1_rng_err_logl;  // to mailbox

   input [`PTR_WIDTH:0] 	    tx_rng_head_dma2 ;
   input 			    dma2_clear_reset;
   input 			    set_cfg_dma2_mmk;  // from mailbox
   input 			    clear_cfg_dma2_mb;  // from mailbox

   
   input 			    tx_dma_cfg_dma2_stop_state;
   output 			    tx_dma_cfg_dma2_stop;
   output [31:0] 		    page0_mask_dma2;
   output [31:0] 		    page0_value_dma2;
   output [31:0] 		    page0_reloc_dma2;
   output 			    page0_valid_dma2;
   output [31:0] 		    page1_mask_dma2;
   output [31:0] 		    page1_value_dma2;
   output [31:0] 		    page1_reloc_dma2;
   output 			    page1_valid_dma2;
   output [19:0] 		    dmc_txc_dma2_page_handle;
   output [1:0] 		    dmc_txc_dma2_func_num;

   output [`RNG_LENGTH_WIDTH - 1:0] tx_rng_cfg_dma2_len;
   output [37:0] 		    tx_rng_cfg_dma2_staddr;
   output [`PTR_WIDTH:0] 	    tx_rng_tail_dma2 ;
   output 			    tx_dma_cfg_dma2_rst;
   output 			    tx_dma_cfg_dma2_stall;
   output [37:0] 		    tx_dma_cfg_dma2_mbaddr ;   
   output 			    tx_cfg_dma2_enable_mb; // to mailbox
   output 			    tx_cfg_dma2_mk; // to mailbox
   output 			    tx_cfg_dma2_mmk; // to mailbox
   output [63:0] 		    tx_cs_dma2; // to mailbox
   output [63:0] 		    tx_dma2_pre_st; // to mailbox
   output [63:0] 		    tx_dma2_rng_err_logh;  // to mailbox
   output [63:0] 		    tx_dma2_rng_err_logl;  // to mailbox

   input [`PTR_WIDTH:0] 	    tx_rng_head_dma3 ;
   input 			    dma3_clear_reset;
   input 			    set_cfg_dma3_mmk;  // from mailbox
   input 			    clear_cfg_dma3_mb;  // from mailbox

   
   input 			    tx_dma_cfg_dma3_stop_state;
   output 			    tx_dma_cfg_dma3_stop;
   output [31:0] 		    page0_mask_dma3;
   output [31:0] 		    page0_value_dma3;
   output [31:0] 		    page0_reloc_dma3;
   output 			    page0_valid_dma3;
   output [31:0] 		    page1_mask_dma3;
   output [31:0] 		    page1_value_dma3;
   output [31:0] 		    page1_reloc_dma3;
   output 			    page1_valid_dma3;
   output [19:0] 		    dmc_txc_dma3_page_handle;
   output [1:0] 		    dmc_txc_dma3_func_num;

   output [`RNG_LENGTH_WIDTH - 1:0] tx_rng_cfg_dma3_len;
   output [37:0] 		    tx_rng_cfg_dma3_staddr;
   output [`PTR_WIDTH:0] 	    tx_rng_tail_dma3 ;
   output 			    tx_dma_cfg_dma3_rst;
   output 			    tx_dma_cfg_dma3_stall;
   output [37:0] 		    tx_dma_cfg_dma3_mbaddr ;   
   output 			    tx_cfg_dma3_enable_mb; // to mailbox
   output 			    tx_cfg_dma3_mk; // to mailbox
   output 			    tx_cfg_dma3_mmk; // to mailbox
   output [63:0] 		    tx_cs_dma3; // to mailbox
   output [63:0] 		    tx_dma3_pre_st; // to mailbox
   output [63:0] 		    tx_dma3_rng_err_logh;  // to mailbox
   output [63:0] 		    tx_dma3_rng_err_logl;  // to mailbox
   output [63:0] 		    dma_0_3_sl_data;
   output 			    read_decode_invalid_dma0_3;
   

   input 			    txc_dmc_dma0_inc_pkt_cnt;
   input 			    txc_dmc_dma1_inc_pkt_cnt;
   input 			    txc_dmc_dma2_inc_pkt_cnt;
   input 			    txc_dmc_dma3_inc_pkt_cnt;

   input 			    txc_dmc_dma0_mark_bit;
   input 			    txc_dmc_dma1_mark_bit;
   input 			    txc_dmc_dma2_mark_bit;
   input 			    txc_dmc_dma3_mark_bit;
   


   // Error Related signals
   
   input 			    set_pref_buf_par_err_dma0;
   input 			    set_pkt_part_err_dma0;
   input [43:0] 		    pkt_part_error_address_dma0;
   input 			    set_conf_part_error_dma0;
   input 			    set_tx_ring_oflow_dma0;
   input 			    set_mbox_part_error_dma0;


   input 			    txc_dmc_p0_dma0_pkt_size_err; // one-hot encoded
   input 			    txc_dmc_dma0_nack_pkt_rd;

   input 			    txc_dmc_p1_dma0_pkt_size_err; // one-hot encoded

   input 			    txc_dmc_p2_dma0_pkt_size_err; // one-hot encoded

   input 			    txc_dmc_p3_dma0_pkt_size_err; // one-hot encoded


   input 			    set_pref_buf_par_err_dma1;
   input 			    set_pkt_part_err_dma1;
   input [43:0] 		    pkt_part_error_address_dma1;
   input 			    set_conf_part_error_dma1;
   input 			    set_tx_ring_oflow_dma1;
   input 			    set_mbox_part_error_dma1;

   input 			    txc_dmc_p0_dma1_pkt_size_err; // one-hot encoded
   input 			    txc_dmc_dma1_nack_pkt_rd;

   input 			    txc_dmc_p1_dma1_pkt_size_err; // one-hot encoded

   input 			    txc_dmc_p2_dma1_pkt_size_err; // one-hot encoded

   input 			    txc_dmc_p3_dma1_pkt_size_err; // one-hot encoded
   
   input 			    set_pref_buf_par_err_dma2;
   input 			    set_pkt_part_err_dma2;
   input [43:0] 		    pkt_part_error_address_dma2;
   input 			    set_conf_part_error_dma2;
   input 			    set_tx_ring_oflow_dma2;
   input 			    set_mbox_part_error_dma2;

   input 			    txc_dmc_p0_dma2_pkt_size_err; // one-hot encoded
   input 			    txc_dmc_dma2_nack_pkt_rd;

   input 			    txc_dmc_p1_dma2_pkt_size_err; // one-hot encoded

   input 			    txc_dmc_p2_dma2_pkt_size_err; // one-hot encoded

   input 			    txc_dmc_p3_dma2_pkt_size_err; // one-hot encoded





   input 			    set_pref_buf_par_err_dma3;
   input 			    set_pkt_part_err_dma3;
   input [43:0] 		    pkt_part_error_address_dma3;
   input 			    set_conf_part_error_dma3;
   input 			    set_tx_ring_oflow_dma3;
   input 			    set_mbox_part_error_dma3;

   input 			    txc_dmc_p0_dma3_pkt_size_err; // one-hot encoded
   input 			    txc_dmc_dma3_nack_pkt_rd;

   input 			    txc_dmc_p1_dma3_pkt_size_err; // one-hot encoded

   input 			    txc_dmc_p2_dma3_pkt_size_err; // one-hot encoded

   input 			    txc_dmc_p3_dma3_pkt_size_err; // one-hot encoded




   input [43:0] 		    txc_dmc_nack_pkt_rd_addr;
   input [43:0] 		    txc_dmc_p0_pkt_size_err_addr;
   input 			    txc_dmc_p0_pkt_size_err;  // pulse to indicate error
   input 			    txc_dmc_nack_pkt_rd; // pulse to indicate error

   input [43:0] 		    txc_dmc_p1_pkt_size_err_addr;
   input 			    txc_dmc_p1_pkt_size_err;  // pulse to indicate error

   input [43:0] 		    txc_dmc_p2_pkt_size_err_addr;
   input 			    txc_dmc_p2_pkt_size_err;  // pulse to indicate error

   input [43:0] 		    txc_dmc_p3_pkt_size_err_addr;
   input 			    txc_dmc_p3_pkt_size_err;  // pulse to indicate error

   // timeout indication from cache fetch engine
   input 			    txpref_dma0_nack_resp;
   input 			    txpref_dma1_nack_resp;
   input 			    txpref_dma2_nack_resp;
   input 			    txpref_dma3_nack_resp;
   input 			    txpref_nack_resp;
   input [43:0] 		    txpref_nack_rd_addr;
   
   
   // mbox Error
   input 			    mbox_ack_dma0_err_received;
   input 			    mbox_ack_dma1_err_received;
   input 			    mbox_ack_dma2_err_received;
   input 			    mbox_ack_dma3_err_received;
   input 			    mbox_err_received;

   // input from dma context block for shodow tail pointer
   input [`PTR_WIDTH -1 :0] 	    ShadowRingCurrentPtr_DMA0;
   input [`PTR_WIDTH -1 :0] 	    ShadowRingCurrentPtr_DMA1;
   input [`PTR_WIDTH -1 :0] 	    ShadowRingCurrentPtr_DMA2;
   input [`PTR_WIDTH -1 :0] 	    ShadowRingCurrentPtr_DMA3;

   // interrupt signals
   // 2bits per dma
   output 			    intr_ldf0_dma0;	  
   output 			    intr_ldf1_dma0;	  
   
   output 			    intr_ldf0_dma1;	  
   output 			    intr_ldf1_dma1;	  

   output 			    intr_ldf0_dma2;
   output 			    intr_ldf1_dma2;	  
   
   output 			    intr_ldf0_dma3;	  
   output 			    intr_ldf1_dma3;	  

   input 			    set_cfg_dma0_mk;
   input 			    set_cfg_dma1_mk;
   input 			    set_cfg_dma2_mk;
   input 			    set_cfg_dma3_mk;
   
   
   output 				    dmc_txc_dma0_error ;
   output 				    dmc_txc_dma1_error ;
   output 				    dmc_txc_dma2_error ;
   output 				    dmc_txc_dma3_error ;



   //
   /*--------------------------------------------------------------*/
   // Wires & Registers
   /*--------------------------------------------------------------*/
   reg [31:0] 			    page0_mask_dma0;
   reg [31:0] 			    page0_value_dma0;
   reg [31:0] 			    page0_reloc_dma0;
   reg 				    page0_valid_dma0;
   reg [31:0] 			    page1_mask_dma0;
   reg [31:0] 			    page1_value_dma0;
   reg [31:0] 			    page1_reloc_dma0;
   reg 				    page1_valid_dma0;
   reg [19:0] 			    dmc_txc_dma0_page_handle;
   reg [1:0] 			    dmc_txc_dma0_func_num;

   reg [`RNG_LENGTH_WIDTH - 1:0]    tx_rng_cfg_dma0_len;
   reg [37:0] 			    tx_rng_cfg_dma0_staddr;
   reg [`PTR_WIDTH:0] 		    tx_rng_tail_dma0 ;
   reg 				    tx_dma_cfg_dma0_rst;
   reg 				    tx_dma_cfg_dma0_stall;
   reg [37:0] 			    tx_dma_cfg_dma0_mbaddr ;   
   reg 				    tx_cfg_dma0_enable_mb; // to mailbox
   reg 				    tx_cfg_dma0_mk; // to mailbox
   reg 				    tx_cfg_dma0_mmk; // to mailbox

   wire [63:0] 			    tx_cs_dma0; // to mailbox
   wire [63:0] 			    tx_dma0_pre_st; // to mailbox
   wire [63:0] 			    tx_dma0_rng_err_logh;  // to mailbox
   wire [63:0] 			    tx_dma0_rng_err_logl;  // to mailbox
   wire [7:0] 			    tx_cs_dma0_err;
   

   reg [31:0] 			    page0_mask_dma1;
   reg [31:0] 			    page0_value_dma1;
   reg [31:0] 			    page0_reloc_dma1;
   reg 				    page0_valid_dma1;
   reg [31:0] 			    page1_mask_dma1;
   reg [31:0] 			    page1_value_dma1;
   reg [31:0] 			    page1_reloc_dma1;
   reg 				    page1_valid_dma1;
   reg [19:0] 			    dmc_txc_dma1_page_handle;
   reg [1:0] 			    dmc_txc_dma1_func_num;

   reg [`RNG_LENGTH_WIDTH - 1:0]    tx_rng_cfg_dma1_len;
   reg [37:0] 			    tx_rng_cfg_dma1_staddr;
   reg [`PTR_WIDTH:0] 		    tx_rng_tail_dma1 ;
   reg 				    tx_dma_cfg_dma1_rst;
   reg 				    tx_dma_cfg_dma1_stall;
   reg [37:0] 			    tx_dma_cfg_dma1_mbaddr ;   
   reg 				    tx_cfg_dma1_enable_mb; // to mailbox
   reg 				    tx_cfg_dma1_mk; // to mailbox
   reg 				    tx_cfg_dma1_mmk; // to mailbox

   wire [63:0] 			    tx_cs_dma1; // to mailbox
   wire [63:0] 			    tx_dma1_pre_st; // to mailbox
   wire [63:0] 			    tx_dma1_rng_err_logh;  // to mailbox
   wire [63:0] 			    tx_dma1_rng_err_logl;  // to mailbox
   wire [7:0] 			    tx_cs_dma1_err;

   reg [31:0] 			    page0_mask_dma2;
   reg [31:0] 			    page0_value_dma2;
   reg [31:0] 			    page0_reloc_dma2;
   reg 				    page0_valid_dma2;
   reg [31:0] 			    page1_mask_dma2;
   reg [31:0] 			    page1_value_dma2;
   reg [31:0] 			    page1_reloc_dma2;
   reg 				    page1_valid_dma2;
   reg [19:0] 			    dmc_txc_dma2_page_handle;
   reg [1:0] 			    dmc_txc_dma2_func_num;

   reg [`RNG_LENGTH_WIDTH - 1:0]    tx_rng_cfg_dma2_len;
   reg [37:0] 			    tx_rng_cfg_dma2_staddr;
   reg [`PTR_WIDTH:0] 		    tx_rng_tail_dma2 ;
   reg 				    tx_dma_cfg_dma2_rst;
   reg 				    tx_dma_cfg_dma2_stall;
   reg [37:0] 			    tx_dma_cfg_dma2_mbaddr ;   
   reg 				    tx_cfg_dma2_enable_mb; // to mailbox
   reg 				    tx_cfg_dma2_mk; // to mailbox
   reg 				    tx_cfg_dma2_mmk; // to mailbox

   wire [63:0] 			    tx_cs_dma2; // to mailbox
   wire [63:0] 			    tx_dma2_pre_st; // to mailbox
   wire [63:0] 			    tx_dma2_rng_err_logh;  // to mailbox
   wire [63:0] 			    tx_dma2_rng_err_logl;  // to mailbox
   wire [7:0] 			    tx_cs_dma2_err;


   reg [31:0] 			    page0_mask_dma3;
   reg [31:0] 			    page0_value_dma3;
   reg [31:0] 			    page0_reloc_dma3;
   reg 				    page0_valid_dma3;
   reg [31:0] 			    page1_mask_dma3;
   reg [31:0] 			    page1_value_dma3;
   reg [31:0] 			    page1_reloc_dma3;
   reg 				    page1_valid_dma3;
   reg [19:0] 			    dmc_txc_dma3_page_handle;
   reg [1:0] 			    dmc_txc_dma3_func_num;

   reg [`RNG_LENGTH_WIDTH - 1:0]    tx_rng_cfg_dma3_len;
   reg [37:0] 			    tx_rng_cfg_dma3_staddr;
   reg [`PTR_WIDTH:0] 		    tx_rng_tail_dma3 ;
   reg 				    tx_dma_cfg_dma3_rst;
   reg 				    tx_dma_cfg_dma3_stall;
   reg [37:0] 			    tx_dma_cfg_dma3_mbaddr ;   
   reg 				    tx_cfg_dma3_enable_mb; // to mailbox
   reg 				    tx_cfg_dma3_mk; // to mailbox
   reg 				    tx_cfg_dma3_mmk; // to mailbox

   wire [63:0] 			    tx_cs_dma3; // to mailbox
   wire [63:0] 			    tx_dma3_pre_st; // to mailbox
   wire [63:0] 			    tx_dma3_rng_err_logh;  // to mailbox
   wire [63:0] 			    tx_dma3_rng_err_logl;  // to mailbox
   wire [7:0] 			    tx_cs_dma3_err;


   reg [63:0] 			    dma_0_3_sl_data;
   reg [31:0] 			    dma_0_3_sl_data_fzc;

   reg [31:0] 			    dma_0_3_sl_data_h;
   reg [31:0] 			    dma_0_3_sl_data_l;

   reg 				    read_decode_invalid_dma0_3;

`ifdef NEPTUNE
   reg 				    tx_rng_cfg_dma0_shadow_written;
   reg 				    tx_rng_cfg_dma1_shadow_written;
   reg 				    tx_rng_cfg_dma2_shadow_written;
   reg 				    tx_rng_cfg_dma3_shadow_written;
   reg [31:0] 			    tx_rng_cfg_dma0_shadow;
   reg [31:0] 			    tx_rng_cfg_dma1_shadow;
   reg [31:0] 			    tx_rng_cfg_dma2_shadow;
   reg [31:0] 			    tx_rng_cfg_dma3_shadow;
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
   
   
   
   

   reg [`PTR_WIDTH -1 :0] 	    ShadowRingCurrentPtr_DMA0_d;
   reg [`PTR_WIDTH -1 :0] 	    ShadowRingCurrentPtr_DMA1_d;
   reg [`PTR_WIDTH -1 :0] 	    ShadowRingCurrentPtr_DMA2_d;
   reg [`PTR_WIDTH -1 :0] 	    ShadowRingCurrentPtr_DMA3_d;
   
   reg 				    tx_cs_pkt_size_error_dma0;
   reg 				    tx_cs_nack_pkt_rd_dma0;
   reg 				    tx_cs_pref_buf_par_err_dma0;
   reg 				    tx_cs_conf_part_err_dma0;
   reg 				    tx_cs_pkt_part_err_dma0;
   reg 				    err_logh_err_dma0;
   reg 				    err_logh_merr_dma0;
   reg [2:0] 			    err_logh_err_code_dma0;
   reg [43:0] 			    err_log_err_addr_dma0;
   reg 				    tx_cs_pkt_size_error_dma1;
   reg 				    tx_cs_nack_pkt_rd_dma1;
   reg 				    tx_cs_pref_buf_par_err_dma1;
   reg 				    tx_cs_conf_part_err_dma1;
   reg 				    tx_cs_pkt_part_err_dma1;
   reg 				    err_logh_err_dma1;
   reg 				    err_logh_merr_dma1;
   reg [2:0] 			    err_logh_err_code_dma1;
   reg [43:0] 			    err_log_err_addr_dma1;
   reg 				    tx_cs_pkt_size_error_dma2;
   reg 				    tx_cs_nack_pkt_rd_dma2;
   reg 				    tx_cs_pref_buf_par_err_dma2;
   reg 				    tx_cs_conf_part_err_dma2;
   reg 				    tx_cs_pkt_part_err_dma2;
   reg 				    err_logh_err_dma2;
   reg 				    err_logh_merr_dma2;
   reg [2:0] 			    err_logh_err_code_dma2;
   reg [43:0] 			    err_log_err_addr_dma2;
   reg 				    tx_cs_pkt_size_error_dma3;
   reg 				    tx_cs_nack_pkt_rd_dma3;
   reg 				    tx_cs_pref_buf_par_err_dma3;
   reg 				    tx_cs_conf_part_err_dma3;
   reg 				    tx_cs_pkt_part_err_dma3;
   reg 				    err_logh_err_dma3;
   reg 				    err_logh_merr_dma3;
   reg [2:0] 			    err_logh_err_code_dma3;
   reg [43:0] 			    err_log_err_addr_dma3;
   reg [3:0] 			    tx_cs_read_dma0_3;

   // 2bits per dma
   reg 				    intr_ldf0_dma0;	  
   reg 				    intr_ldf1_dma0;	  
   
   reg 				    intr_ldf0_dma1;	  
   reg 				    intr_ldf1_dma1;	  

   reg 				    intr_ldf0_dma2;
   reg 				    intr_ldf1_dma2;	  
   
   reg 				    intr_ldf0_dma3;	  
   reg 				    intr_ldf1_dma3;	  

   reg 				    tx_ent_mask_ldf0_dma0;
   reg [7:0] 			    tx_ent_mask_ldf1_dma0;

   reg 				    tx_ent_mask_ldf0_dma1;
   reg [7:0] 			    tx_ent_mask_ldf1_dma1;
   
   reg 				    tx_ent_mask_ldf0_dma2;
   reg [7:0] 			    tx_ent_mask_ldf1_dma2;

   reg 				    tx_ent_mask_ldf0_dma3;
   reg [7:0] 			    tx_ent_mask_ldf1_dma3;

   wire [7:0] 			    ldf1_events_dma0;
   wire [7:0] 			    ldf1_events_dma1;
   wire [7:0] 			    ldf1_events_dma2;
   wire [7:0] 			    ldf1_events_dma3;

   reg 				    tx_cs_nack_pref_dma0;
   reg 				    tx_cs_nack_pref_dma1;
   reg 				    tx_cs_nack_pref_dma2;
   reg 				    tx_cs_nack_pref_dma3;
   reg 				    tx_cs_mbox_error_dma0;
   reg 				    tx_cs_mbox_error_dma1;
   reg 				    tx_cs_mbox_error_dma2;
   reg 				    tx_cs_mbox_error_dma3;

   reg 				    tx_cs_tx_ring_oflow_dma0 ;
   reg 				    tx_cs_tx_ring_oflow_dma1 ;
   reg 				    tx_cs_tx_ring_oflow_dma2 ;
   reg 				    tx_cs_tx_ring_oflow_dma3 ;



   reg 				    tx_dma_cfg_dma0_stop;
   reg 				    tx_dma_cfg_dma1_stop;
   reg 				    tx_dma_cfg_dma2_stop;
   reg 				    tx_dma_cfg_dma3_stop;


   wire 			    txc_dmc_pkt_size_err;  // pulse to indicate error
   wire 			    txc_dmc_nack_pkt_rd; // pulse to indicate error

   wire 			    txc_dmc_dma0_nack_pkt_rd;
   wire 			    txc_dmc_dma0_pkt_size_err;
   
   wire 			    txc_dmc_dma1_nack_pkt_rd;
   wire 			    txc_dmc_dma1_pkt_size_err;

   wire 			    txc_dmc_dma2_nack_pkt_rd;
   wire 			    txc_dmc_dma2_pkt_size_err;

   wire 			    txc_dmc_dma3_nack_pkt_rd;
   wire 			    txc_dmc_dma3_pkt_size_err;

   reg [43:0] 			    txc_dmc_pkt_size_err_addr_dma0;
   reg [43:0] 			    txc_dmc_pkt_size_err_addr_dma1;
   reg [43:0] 			    txc_dmc_pkt_size_err_addr_dma2;
   reg [43:0] 			    txc_dmc_pkt_size_err_addr_dma3;
   
   reg 				    dmc_txc_dma0_error ;
   reg 				    dmc_txc_dma1_error ;
   reg 				    dmc_txc_dma2_error ;
   reg 				    dmc_txc_dma3_error ;
   wire 			    set_dma0_error;
   wire 			    set_dma1_error;
   wire 			    set_dma2_error;
   wire 			    set_dma3_error;

   wire 			    set_dma0_error_logs;
   wire 			    set_dma1_error_logs;
   wire 			    set_dma2_error_logs;
   wire 			    set_dma3_error_logs;
   
   reg [11:0] 		    tx_cs_pkt_cnt_dma0; 
   reg [11:0] 		    tx_cs_lastmark_dma0;
   reg [11:0] 		    tx_cs_pkt_cnt_dma1; 
   reg [11:0] 		    tx_cs_lastmark_dma1;
   reg [11:0] 		    tx_cs_pkt_cnt_dma2; 
   reg [11:0] 		    tx_cs_lastmark_dma2;
   reg [11:0] 		    tx_cs_pkt_cnt_dma3; 
   reg [11:0] 		    tx_cs_lastmark_dma3;

   reg txc_dmc_p0_pkt_size_err_d;
   reg txc_dmc_p1_pkt_size_err_d;
   reg txc_dmc_p2_pkt_size_err_d;
   reg txc_dmc_p3_pkt_size_err_d;
   reg err_logh_err_dma0_d;
   reg err_logh_err_dma1_d;
   reg err_logh_err_dma2_d;
   reg err_logh_err_dma3_d;
   always @(posedge SysClk ) 
      if(!Reset_L) begin
   txc_dmc_p0_pkt_size_err_d <= 1'b0;
   txc_dmc_p1_pkt_size_err_d <= 1'b0;
   txc_dmc_p2_pkt_size_err_d <= 1'b0;
   txc_dmc_p3_pkt_size_err_d <= 1'b0;
      end else begin
   txc_dmc_p0_pkt_size_err_d <= txc_dmc_p0_pkt_size_err;
   txc_dmc_p1_pkt_size_err_d <= txc_dmc_p1_pkt_size_err;
   txc_dmc_p2_pkt_size_err_d <= txc_dmc_p2_pkt_size_err;
   txc_dmc_p3_pkt_size_err_d <= txc_dmc_p3_pkt_size_err;
      end


   assign txc_dmc_pkt_size_err = txc_dmc_p0_pkt_size_err_d| txc_dmc_p1_pkt_size_err_d|
	   	                 txc_dmc_p2_pkt_size_err_d| txc_dmc_p3_pkt_size_err_d;





// DMA0

   assign txc_dmc_dma0_pkt_size_err = txc_dmc_p0_dma0_pkt_size_err| txc_dmc_p1_dma0_pkt_size_err|
                                      txc_dmc_p2_dma0_pkt_size_err| txc_dmc_p3_dma0_pkt_size_err;

   always@( txc_dmc_p3_pkt_size_err_addr or txc_dmc_p2_pkt_size_err_addr or  txc_dmc_p1_pkt_size_err_addr or txc_dmc_p0_pkt_size_err_addr or
            txc_dmc_p0_pkt_size_err_d or  txc_dmc_p1_pkt_size_err_d or txc_dmc_p2_pkt_size_err_d or txc_dmc_p3_pkt_size_err_d ) 
     begin
        case({txc_dmc_p3_pkt_size_err_d,txc_dmc_p2_pkt_size_err_d,txc_dmc_p1_pkt_size_err_d,txc_dmc_p0_pkt_size_err_d})
           4'b1000: txc_dmc_pkt_size_err_addr_dma0 = txc_dmc_p3_pkt_size_err_addr;
           4'b0100: txc_dmc_pkt_size_err_addr_dma0 = txc_dmc_p2_pkt_size_err_addr;
           4'b0010: txc_dmc_pkt_size_err_addr_dma0 = txc_dmc_p1_pkt_size_err_addr;
           4'b0001: txc_dmc_pkt_size_err_addr_dma0 = txc_dmc_p0_pkt_size_err_addr;
           default: txc_dmc_pkt_size_err_addr_dma0 = 44'h0;
        endcase
     end

// DMA1


   assign txc_dmc_dma1_pkt_size_err = txc_dmc_p0_dma1_pkt_size_err| txc_dmc_p1_dma1_pkt_size_err|
                                      txc_dmc_p2_dma1_pkt_size_err| txc_dmc_p3_dma1_pkt_size_err;

   always@( txc_dmc_p3_pkt_size_err_addr or txc_dmc_p2_pkt_size_err_addr or  txc_dmc_p1_pkt_size_err_addr or txc_dmc_p0_pkt_size_err_addr or
            txc_dmc_p0_pkt_size_err_d or  txc_dmc_p1_pkt_size_err_d or txc_dmc_p2_pkt_size_err_d or txc_dmc_p3_pkt_size_err_d ) 
     begin
        case({txc_dmc_p3_pkt_size_err_d,txc_dmc_p2_pkt_size_err_d,txc_dmc_p1_pkt_size_err_d,txc_dmc_p0_pkt_size_err_d})
           4'b1000: txc_dmc_pkt_size_err_addr_dma1 = txc_dmc_p3_pkt_size_err_addr;
           4'b0100: txc_dmc_pkt_size_err_addr_dma1 = txc_dmc_p2_pkt_size_err_addr;
           4'b0010: txc_dmc_pkt_size_err_addr_dma1 = txc_dmc_p1_pkt_size_err_addr;
           4'b0001: txc_dmc_pkt_size_err_addr_dma1 = txc_dmc_p0_pkt_size_err_addr;
           default: txc_dmc_pkt_size_err_addr_dma1 = 44'h0;
        endcase
     end
// DMA2


   assign txc_dmc_dma2_pkt_size_err = txc_dmc_p0_dma2_pkt_size_err| txc_dmc_p1_dma2_pkt_size_err|
                                      txc_dmc_p2_dma2_pkt_size_err| txc_dmc_p3_dma2_pkt_size_err;

   always@( txc_dmc_p3_pkt_size_err_addr or txc_dmc_p2_pkt_size_err_addr or  txc_dmc_p1_pkt_size_err_addr or txc_dmc_p0_pkt_size_err_addr or
            txc_dmc_p0_pkt_size_err_d or  txc_dmc_p1_pkt_size_err_d or txc_dmc_p2_pkt_size_err_d or txc_dmc_p3_pkt_size_err_d ) 
     begin
        case({txc_dmc_p3_pkt_size_err_d,txc_dmc_p2_pkt_size_err_d,txc_dmc_p1_pkt_size_err_d,txc_dmc_p0_pkt_size_err_d})
           4'b1000: txc_dmc_pkt_size_err_addr_dma2 = txc_dmc_p3_pkt_size_err_addr;
           4'b0100: txc_dmc_pkt_size_err_addr_dma2 = txc_dmc_p2_pkt_size_err_addr;
           4'b0010: txc_dmc_pkt_size_err_addr_dma2 = txc_dmc_p1_pkt_size_err_addr;
           4'b0001: txc_dmc_pkt_size_err_addr_dma2 = txc_dmc_p0_pkt_size_err_addr;
           default: txc_dmc_pkt_size_err_addr_dma2 = 44'h0;
        endcase
     end
// DMA3


   assign txc_dmc_dma3_pkt_size_err = txc_dmc_p0_dma3_pkt_size_err| txc_dmc_p1_dma3_pkt_size_err|
                                      txc_dmc_p2_dma3_pkt_size_err| txc_dmc_p3_dma3_pkt_size_err;

   always@( txc_dmc_p3_pkt_size_err_addr or txc_dmc_p2_pkt_size_err_addr or  txc_dmc_p1_pkt_size_err_addr or txc_dmc_p0_pkt_size_err_addr or
            txc_dmc_p0_pkt_size_err_d or  txc_dmc_p1_pkt_size_err_d or txc_dmc_p2_pkt_size_err_d or txc_dmc_p3_pkt_size_err_d ) 
     begin
        case({txc_dmc_p3_pkt_size_err_d,txc_dmc_p2_pkt_size_err_d,txc_dmc_p1_pkt_size_err_d,txc_dmc_p0_pkt_size_err_d})
           4'b1000: txc_dmc_pkt_size_err_addr_dma3 = txc_dmc_p3_pkt_size_err_addr;
           4'b0100: txc_dmc_pkt_size_err_addr_dma3 = txc_dmc_p2_pkt_size_err_addr;
           4'b0010: txc_dmc_pkt_size_err_addr_dma3 = txc_dmc_p1_pkt_size_err_addr;
           4'b0001: txc_dmc_pkt_size_err_addr_dma3 = txc_dmc_p0_pkt_size_err_addr;
           default: txc_dmc_pkt_size_err_addr_dma3 = 44'h0;
        endcase
     end

   
   always @(posedge SysClk ) begin
      if(!Reset_L) begin
      ShadowRingCurrentPtr_DMA0_d <= `PTR_WIDTH'h0;
      ShadowRingCurrentPtr_DMA1_d <= `PTR_WIDTH'h0;
      ShadowRingCurrentPtr_DMA2_d <= `PTR_WIDTH'h0;
      ShadowRingCurrentPtr_DMA3_d <= `PTR_WIDTH'h0;
      end else begin
      ShadowRingCurrentPtr_DMA0_d <= ShadowRingCurrentPtr_DMA0;
      ShadowRingCurrentPtr_DMA1_d <= ShadowRingCurrentPtr_DMA1;
      ShadowRingCurrentPtr_DMA2_d <= ShadowRingCurrentPtr_DMA2;
      ShadowRingCurrentPtr_DMA3_d <= ShadowRingCurrentPtr_DMA3;
      end
   end


   // LDF0 Interrupt Logic
   // Set when mailbox is sent out to system memory and ack is reaceived
   
   always @(posedge SysClk )
     if (!Reset_L) begin
	intr_ldf0_dma0 <= 1'b0;
	intr_ldf0_dma1 <= 1'b0;
	intr_ldf0_dma2 <= 1'b0;
	intr_ldf0_dma3 <= 1'b0;
     end else begin
        intr_ldf0_dma0 <= (tx_cfg_dma0_mk  & ~tx_ent_mask_ldf0_dma0) ? 1'b1:1'b0;
        intr_ldf0_dma1 <= (tx_cfg_dma1_mk  & ~tx_ent_mask_ldf0_dma1) ? 1'b1:1'b0;
        intr_ldf0_dma2 <= (tx_cfg_dma2_mk  & ~tx_ent_mask_ldf0_dma2) ? 1'b1:1'b0;
        intr_ldf0_dma3 <= (tx_cfg_dma3_mk  & ~tx_ent_mask_ldf0_dma3) ? 1'b1:1'b0;
     end // else: !if(!Reset_L)
   

   // LDF1 Interrupt Logic

   assign ldf1_events_dma0 = { tx_cs_mbox_error_dma0, tx_cs_pkt_size_error_dma0, tx_cs_tx_ring_oflow_dma0, tx_cs_pref_buf_par_err_dma0,
			       tx_cs_nack_pref_dma0 , tx_cs_nack_pkt_rd_dma0, tx_cs_conf_part_err_dma0, tx_cs_pkt_part_err_dma0 };

   assign ldf1_events_dma1 = { tx_cs_mbox_error_dma1, tx_cs_pkt_size_error_dma1, tx_cs_tx_ring_oflow_dma1, tx_cs_pref_buf_par_err_dma1,
			       tx_cs_nack_pref_dma1 , tx_cs_nack_pkt_rd_dma1, tx_cs_conf_part_err_dma1, tx_cs_pkt_part_err_dma1 };

   assign ldf1_events_dma2 = { tx_cs_mbox_error_dma2, tx_cs_pkt_size_error_dma2, tx_cs_tx_ring_oflow_dma2, tx_cs_pref_buf_par_err_dma2,
			       tx_cs_nack_pref_dma2 , tx_cs_nack_pkt_rd_dma2, tx_cs_conf_part_err_dma2, tx_cs_pkt_part_err_dma2 };

   assign ldf1_events_dma3 = { tx_cs_mbox_error_dma3, tx_cs_pkt_size_error_dma3, tx_cs_tx_ring_oflow_dma3, tx_cs_pref_buf_par_err_dma3,
			       tx_cs_nack_pref_dma3 , tx_cs_nack_pkt_rd_dma3, tx_cs_conf_part_err_dma3, tx_cs_pkt_part_err_dma3 };

   
   always @(posedge SysClk )
     if (!Reset_L) begin
	intr_ldf1_dma0 <= 1'b0;
	intr_ldf1_dma1 <= 1'b0;
	intr_ldf1_dma2 <= 1'b0;
	intr_ldf1_dma3 <= 1'b0;
     end else begin // if (!Reset_L)
        intr_ldf1_dma0 <= (|( (ldf1_events_dma0 ) & ~tx_ent_mask_ldf1_dma0)) ? 1'b1:1'b0;
	intr_ldf1_dma1 <= (|( (ldf1_events_dma1 ) & ~tx_ent_mask_ldf1_dma1)) ? 1'b1:1'b0;
	intr_ldf1_dma2 <= (|( (ldf1_events_dma2 ) & ~tx_ent_mask_ldf1_dma2)) ? 1'b1:1'b0;
	intr_ldf1_dma3 <= (|( (ldf1_events_dma3 ) & ~tx_ent_mask_ldf1_dma3)) ? 1'b1:1'b0;
     end // else: !if(!Reset_L)
   
   // ERROR STATUS
   // DMA0
   // setting various error bits--
   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_tx_ring_oflow_dma0 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA0_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_INTR_DBG_DMA0) )  
	  tx_cs_tx_ring_oflow_dma0 <= Slave_DataIn[5];
	else if(set_tx_ring_oflow_dma0)
	  tx_cs_tx_ring_oflow_dma0 <= 1'b1;
	else if(dma0_clear_reset)
	  tx_cs_tx_ring_oflow_dma0 <= 1'b0;
     end // else: !if(!Reset_L)


   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_pkt_size_error_dma0 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA0_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_INTR_DBG_DMA0) )
	  tx_cs_pkt_size_error_dma0 <= Slave_DataIn[6];
	else if(txc_dmc_dma0_pkt_size_err & txc_dmc_pkt_size_err )
	  tx_cs_pkt_size_error_dma0 <= 1'b1;
	else if(dma0_clear_reset)
	  tx_cs_pkt_size_error_dma0 <= 1'b0;
     end // else: !if(!Reset_L)

   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_nack_pkt_rd_dma0 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA0_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_INTR_DBG_DMA0) )
          tx_cs_nack_pkt_rd_dma0 <= Slave_DataIn[2];
	else if(txc_dmc_dma0_nack_pkt_rd & txc_dmc_nack_pkt_rd)
	  tx_cs_nack_pkt_rd_dma0 <= 1'b1;
	else if(dma0_clear_reset)
	  tx_cs_nack_pkt_rd_dma0 <= 1'b0;
     end // else: !if(!Reset_L)


   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_mbox_error_dma0 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA0_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_INTR_DBG_DMA0) )
          tx_cs_mbox_error_dma0<= Slave_DataIn[7];
	else if(mbox_ack_dma0_err_received & mbox_err_received)
	  tx_cs_mbox_error_dma0 <= 1'b1;
	else if(dma0_clear_reset)
	  tx_cs_mbox_error_dma0 <= 1'b0;
	else if(slaveStrobe & write_DMA0_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DMA0) ) begin
	   tx_cs_mbox_error_dma0 <= Slave_DataIn[7] ? 1'b0 : tx_cs_mbox_error_dma0 ;
	end // else: !if(!Reset_L)
     end // else: !if(!Reset_L)

   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_nack_pref_dma0<= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA0_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_INTR_DBG_DMA0))
	  tx_cs_nack_pref_dma0<= Slave_DataIn[3];
	else if(txpref_dma0_nack_resp & txpref_nack_resp)
	  tx_cs_nack_pref_dma0 <= 1'b1;
	else if(dma0_clear_reset)
	  tx_cs_nack_pref_dma0 <= 1'b0;
     end // else: !if(!Reset_L)
   
   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_pref_buf_par_err_dma0 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA0_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_INTR_DBG_DMA0) )
          tx_cs_pref_buf_par_err_dma0 <= Slave_DataIn[4];
	else if(set_pref_buf_par_err_dma0)
	  tx_cs_pref_buf_par_err_dma0 <= 1'b1;
	else if(dma0_clear_reset)
	  tx_cs_pref_buf_par_err_dma0 <= 1'b0;
     end // else: !if(!Reset_L)

   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_conf_part_err_dma0 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA0_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_INTR_DBG_DMA0))
          tx_cs_conf_part_err_dma0<= Slave_DataIn[1];
	else if(set_conf_part_error_dma0 | set_mbox_part_error_dma0)
	  tx_cs_conf_part_err_dma0 <= 1'b1;
	else if(dma0_clear_reset)
	  tx_cs_conf_part_err_dma0 <= 1'b0;
     end // else: !if(!Reset_L)
   
   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_pkt_part_err_dma0 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA0_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_INTR_DBG_DMA0) )
	  tx_cs_pkt_part_err_dma0 <= Slave_DataIn[0] ;
	else if(set_pkt_part_err_dma0)
	  tx_cs_pkt_part_err_dma0 <= 1'b1;
	else if(dma0_clear_reset)
	  tx_cs_pkt_part_err_dma0 <= 1'b0;
     end // else: !if(!Reset_L)

// pkt_cnt as part of TX Config register
    always@(posedge SysClk ) begin
     if (!Reset_L) begin
        tx_cs_pkt_cnt_dma0 <= 12'h0;
     end else if(dma0_clear_reset) begin
        tx_cs_pkt_cnt_dma0 <= 12'h0;
     end else if (slaveStrobe & write_DMA0_Register && ({Slave_Addr[8:3],(~Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DBG_DMA0) ) begin
	     tx_cs_pkt_cnt_dma0 <= Slave_DataIn[59:48];
     end else if(txc_dmc_dma0_inc_pkt_cnt) begin
        tx_cs_pkt_cnt_dma0 <= tx_cs_pkt_cnt_dma0 + 12'h1;
     end // else: !if(!Reset_L)
    end // always@ (posedge SysClk )

   always@(posedge SysClk) begin
      if(!Reset_L) begin
         tx_cs_lastmark_dma0 <= 12'h0;
      end else if(dma0_clear_reset) begin // if (!Reset_L)
         tx_cs_lastmark_dma0 <= 12'h0;
      end else if(txc_dmc_dma0_mark_bit) begin
         tx_cs_lastmark_dma0 <= tx_cs_pkt_cnt_dma0;
      end
   end

   assign set_dma0_error_logs = set_pref_buf_par_err_dma0 | set_pkt_part_err_dma0 |( mbox_ack_dma0_err_received & mbox_err_received)|
	   		    (txpref_dma0_nack_resp & txpref_nack_resp)  | (set_conf_part_error_dma0 | set_mbox_part_error_dma0)
			    | (txc_dmc_dma0_nack_pkt_rd & txc_dmc_nack_pkt_rd) | (txc_dmc_dma0_pkt_size_err & txc_dmc_pkt_size_err) 
			    | set_tx_ring_oflow_dma0 ;
   
   // Error log associated with the errors
   always @(posedge SysClk )
     if (!Reset_L) begin
	err_logh_err_dma0 <= 1'b0;  
	err_logh_err_dma0_d <= 1'b0;  
	err_logh_merr_dma0 <= 1'b0;
     end else begin
	err_logh_err_dma0_d <= err_logh_err_dma0;
	if( set_dma0_error_logs ) begin
	   err_logh_err_dma0 <= 1'b1;
	   // may need another term here -- TOADS
	   err_logh_merr_dma0 <= ( err_logh_err_dma0)  ? 1'b1: 1'b0;
	end // if (| tx_cs_dma0_err )
	else if(dma0_clear_reset) begin
	   err_logh_err_dma0 <= 1'b0;
	   err_logh_merr_dma0 <= 1'b0;
	end // if (dma0_clear_reset)
     end // else: !if(!Reset_L)
   // Error code and Error address
   always @(posedge SysClk )
     if (!Reset_L) begin
	err_logh_err_code_dma0 <= 3'h0;
        err_log_err_addr_dma0 <= 44'h0;
     end else if(dma0_clear_reset) begin
	err_logh_err_code_dma0 <= 3'h0;
        err_log_err_addr_dma0 <= 44'h0;
     end else if(~err_logh_err_dma0_d & err_logh_err_dma0) begin
	if(tx_cs_pkt_size_error_dma0 ) begin
	   err_logh_err_code_dma0 <= `ERR_CODE_PKT_SIZE_ERR;
	   err_log_err_addr_dma0 <= txc_dmc_pkt_size_err_addr_dma0;
	end else if(tx_cs_pref_buf_par_err_dma0 ) begin
	   err_logh_err_code_dma0 <= `ERR_CODE_PREF_BUF_PAR_ERR;
	   err_log_err_addr_dma0 <= 44'h0;// Not sure what to log??;
	end else if(tx_cs_tx_ring_oflow_dma0 ) begin
	   err_logh_err_code_dma0 <= `ERR_CODE_TX_RING_OFLOW;
	   err_log_err_addr_dma0 <= 44'h0;// Not sure what to log??;
	end else if( tx_cs_nack_pref_dma0) begin
	   err_logh_err_code_dma0 <= `ERR_CODE_NACK_PREF;
	   err_log_err_addr_dma0 <= txpref_nack_rd_addr;
	end else if( tx_cs_nack_pkt_rd_dma0 ) begin
	   err_logh_err_code_dma0 <= `ERR_CODE_NACK_PKT_RD;
	   err_log_err_addr_dma0 <= txc_dmc_nack_pkt_rd_addr;
	end else if(tx_cs_conf_part_err_dma0 ) begin
	   err_logh_err_code_dma0 <= `ERR_CODE_CONF_PART_ERR;
	   err_log_err_addr_dma0 <= set_mbox_part_error_dma0 ? {tx_dma_cfg_dma0_mbaddr, 6'h0}: {tx_rng_cfg_dma0_staddr,6'h0} ;
	end else if(tx_cs_pkt_part_err_dma0) begin
	   err_logh_err_code_dma0 <= `ERR_CODE_PKT_PART_ERR;
	   err_log_err_addr_dma0 <=pkt_part_error_address_dma0 ;
	end
     end // if (!err_logh_merr_dma0)

   // TXCS_ Error logic
   // DMA0
   assign set_dma0_error = (set_pref_buf_par_err_dma0|set_pkt_part_err_dma0);

    always @(posedge SysClk )
     if (!Reset_L) begin
        dmc_txc_dma0_error <= 1'b0;
     end else begin
	if(dma0_clear_reset) dmc_txc_dma0_error <= 1'b0;
        else dmc_txc_dma0_error <= ((| tx_cs_dma0_err)| set_dma0_error) ;
     end

   assign 	  tx_cs_dma0_err = {tx_cs_mbox_error_dma0, tx_cs_pkt_size_error_dma0, tx_cs_tx_ring_oflow_dma0, tx_cs_pref_buf_par_err_dma0, 
				    tx_cs_nack_pref_dma0, tx_cs_nack_pkt_rd_dma0, tx_cs_conf_part_err_dma0, tx_cs_pkt_part_err_dma0 } ;

   assign 	  tx_dma0_pre_st = {45'h0,3'h0,ShadowRingCurrentPtr_DMA0_d};
   assign 	  tx_dma0_rng_err_logh = {32'h0,err_logh_err_dma0,err_logh_merr_dma0,err_logh_err_code_dma0,15'h0,err_log_err_addr_dma0[43:32] };
   assign 	  tx_dma0_rng_err_logl = {32'h0,err_log_err_addr_dma0[31:0]};
   assign 	  tx_cs_dma0 = { 4'h0, tx_cs_pkt_cnt_dma0, 4'h0, tx_cs_lastmark_dma0, tx_dma_cfg_dma0_rst, tx_dma_cfg_dma0_stall,
				 tx_cfg_dma0_enable_mb,tx_dma_cfg_dma0_stop,tx_dma_cfg_dma0_stop_state,11'h0 , tx_cfg_dma0_mk, tx_cfg_dma0_mmk, 6'h0, tx_cs_dma0_err };


   // DMA1
   // setting various error bits--
   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_tx_ring_oflow_dma1 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA1_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA1)  )
	  tx_cs_tx_ring_oflow_dma1 <= Slave_DataIn[5];
	else if(set_tx_ring_oflow_dma1)
	  tx_cs_tx_ring_oflow_dma1 <= 1'b1;
	else if(dma1_clear_reset)
	  tx_cs_tx_ring_oflow_dma1 <= 1'b0;
     end // else: !if(!Reset_L)


   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_pkt_size_error_dma1 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA1_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA1 ) )
	  tx_cs_pkt_size_error_dma1 <= Slave_DataIn[6];
	else if(txc_dmc_dma1_pkt_size_err & txc_dmc_pkt_size_err )
	  tx_cs_pkt_size_error_dma1 <= 1'b1;
	else if(dma1_clear_reset)
	  tx_cs_pkt_size_error_dma1 <= 1'b0;
     end // else: !if(!Reset_L)

   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_nack_pkt_rd_dma1 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA1_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA1) )
          tx_cs_nack_pkt_rd_dma1 <= Slave_DataIn[2];
	else if(txc_dmc_dma1_nack_pkt_rd & txc_dmc_nack_pkt_rd)
	  tx_cs_nack_pkt_rd_dma1 <= 1'b1;
	else if(dma1_clear_reset)
	  tx_cs_nack_pkt_rd_dma1 <= 1'b0;
     end // else: !if(!Reset_L)


   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_mbox_error_dma1 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA1_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA1) )
          tx_cs_mbox_error_dma1<= Slave_DataIn[7];
	else if(mbox_ack_dma1_err_received & mbox_err_received)
	  tx_cs_mbox_error_dma1 <= 1'b1;
	else if(dma1_clear_reset)
	  tx_cs_mbox_error_dma1 <= 1'b0;
     end // else: !if(!Reset_L)

   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_nack_pref_dma1<= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA1_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA1))
	  tx_cs_nack_pref_dma1<= Slave_DataIn[3];
	else if(txpref_dma1_nack_resp & txpref_nack_resp)
	  tx_cs_nack_pref_dma1 <= 1'b1;
	else if(dma1_clear_reset)
	  tx_cs_nack_pref_dma1 <= 1'b0;
     end // else: !if(!Reset_L)
   
   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_pref_buf_par_err_dma1 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA1_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA1))
          tx_cs_pref_buf_par_err_dma1 <=  Slave_DataIn[4];
	else if(set_pref_buf_par_err_dma1)
	  tx_cs_pref_buf_par_err_dma1 <= 1'b1;
	else if(dma1_clear_reset)
	  tx_cs_pref_buf_par_err_dma1 <= 1'b0;
     end // else: !if(!Reset_L)

   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_conf_part_err_dma1 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA1_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA1))
          tx_cs_conf_part_err_dma1<= Slave_DataIn[1];
	else if(set_conf_part_error_dma1 | set_mbox_part_error_dma1)
	  tx_cs_conf_part_err_dma1 <= 1'b1;
	else if(dma1_clear_reset)
	  tx_cs_conf_part_err_dma1 <= 1'b0;
     end // else: !if(!Reset_L)
   
   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_pkt_part_err_dma1 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA1_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA1) )
	  tx_cs_pkt_part_err_dma1 <= Slave_DataIn[0];
	else if(set_pkt_part_err_dma1)
	  tx_cs_pkt_part_err_dma1 <= 1'b1;
	else if(dma1_clear_reset)
	  tx_cs_pkt_part_err_dma1 <= 1'b0;
     end // else: !if(!Reset_L)
   
// pkt_cnt as part of TX Config register
    always@(posedge SysClk ) begin
     if (!Reset_L) begin
        tx_cs_pkt_cnt_dma1 <= 12'h0;
     end else if(dma1_clear_reset) begin
        tx_cs_pkt_cnt_dma1 <= 12'h0;
     end else if (slaveStrobe & write_DMA1_Register && ({Slave_Addr[8:3],(~Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DBG_DMA1) ) begin
	tx_cs_pkt_cnt_dma1 <= Slave_DataIn[59:48];
     end else if(txc_dmc_dma1_inc_pkt_cnt) begin
        tx_cs_pkt_cnt_dma1 <= tx_cs_pkt_cnt_dma1 + 12'h1;
     end // else: !if(!Reset_L)
    end // always@ (posedge SysClk )

   always@(posedge SysClk) begin
      if(!Reset_L) begin
         tx_cs_lastmark_dma1 <= 12'h0;
      end else if(dma1_clear_reset) begin // if (!Reset_L)
         tx_cs_lastmark_dma1 <= 12'h0;
      end else if(txc_dmc_dma1_mark_bit) begin
         tx_cs_lastmark_dma1 <= tx_cs_pkt_cnt_dma1;
      end
   end


   assign set_dma1_error_logs = set_pref_buf_par_err_dma1 | set_pkt_part_err_dma1|( mbox_ack_dma1_err_received & mbox_err_received)|
	   		    (txpref_dma1_nack_resp & txpref_nack_resp)  | (set_conf_part_error_dma1 | set_mbox_part_error_dma1)
			    | (txc_dmc_dma1_nack_pkt_rd & txc_dmc_nack_pkt_rd) | (txc_dmc_dma1_pkt_size_err & txc_dmc_pkt_size_err) 
			    | set_tx_ring_oflow_dma1 ;
   // Error log associated with the errors
   always @(posedge SysClk )
     if (!Reset_L) begin
	err_logh_err_dma1 <= 1'b0;  
	err_logh_err_dma1_d <= 1'b0;  
	err_logh_merr_dma1 <= 1'b0;
     end else begin
	err_logh_err_dma1_d <= err_logh_err_dma1;  
	if( set_dma1_error_logs ) begin
	   err_logh_err_dma1 <= 1'b1;
	   // may need another term here -- TOADS
	   err_logh_merr_dma1 <= ( err_logh_err_dma1)  ? 1'b1: 1'b0;
	end // if (| tx_cs_dma1_err )
	else if(dma1_clear_reset) begin
	   err_logh_err_dma1 <= 1'b0;
	   err_logh_merr_dma1 <= 1'b0;
	end // if (dma1_clear_reset)
     end // else: !if(!Reset_L)
   // Error code and Error address
   always @(posedge SysClk )
     if (!Reset_L) begin
	err_logh_err_code_dma1 <= 3'h0;
        err_log_err_addr_dma1 <= 44'h0;
     end else if(dma1_clear_reset) begin
	err_logh_err_code_dma1 <= 3'h0;
        err_log_err_addr_dma1 <= 44'h0;
     end else if(~err_logh_err_dma1_d & err_logh_err_dma1) begin
	if(tx_cs_pkt_size_error_dma1 ) begin
	   err_logh_err_code_dma1 <= `ERR_CODE_PKT_SIZE_ERR;
	   err_log_err_addr_dma1 <= txc_dmc_pkt_size_err_addr_dma1;
	end else if(tx_cs_pref_buf_par_err_dma1 ) begin
	   err_logh_err_code_dma1 <= `ERR_CODE_PREF_BUF_PAR_ERR;
	   err_log_err_addr_dma1 <= 44'h0;// Not sure what to log??;
	end else if(tx_cs_tx_ring_oflow_dma1 ) begin
	   err_logh_err_code_dma1 <= `ERR_CODE_TX_RING_OFLOW;
	   err_log_err_addr_dma1 <= 44'h0;// Not sure what to log??;
	end else if( tx_cs_nack_pref_dma1) begin
	   err_logh_err_code_dma1 <= `ERR_CODE_NACK_PREF;
	   err_log_err_addr_dma1 <= txpref_nack_rd_addr;
	end else if( tx_cs_nack_pkt_rd_dma1 ) begin
	   err_logh_err_code_dma1 <= `ERR_CODE_NACK_PKT_RD;
	   err_log_err_addr_dma1 <= txc_dmc_nack_pkt_rd_addr;
	end else if(tx_cs_conf_part_err_dma1 ) begin
	   err_logh_err_code_dma1 <= `ERR_CODE_CONF_PART_ERR;
	   err_log_err_addr_dma1 <= set_mbox_part_error_dma1 ? {tx_dma_cfg_dma1_mbaddr, 6'h0}: {tx_rng_cfg_dma1_staddr,6'h0} ;
	end else if(tx_cs_pkt_part_err_dma1) begin
	   err_logh_err_code_dma1 <= `ERR_CODE_PKT_PART_ERR;
	   err_log_err_addr_dma1 <=pkt_part_error_address_dma1 ;
	end
     end // if (!err_logh_merr_dma1)

   // TXCS_ Error logic
   // DMA1
   assign set_dma1_error = (set_pref_buf_par_err_dma1|set_pkt_part_err_dma1);
    always @(posedge SysClk )
     if (!Reset_L) begin
        dmc_txc_dma1_error <= 1'b0;
     end else begin
	if(dma1_clear_reset) dmc_txc_dma1_error <= 1'b0;
	else dmc_txc_dma1_error <= ( ((| tx_cs_dma1_err) | set_dma1_error));
     end
   assign 	  tx_cs_dma1_err = {tx_cs_mbox_error_dma1, tx_cs_pkt_size_error_dma1, tx_cs_tx_ring_oflow_dma1, tx_cs_pref_buf_par_err_dma1, 
				    tx_cs_nack_pref_dma1, tx_cs_nack_pkt_rd_dma1, tx_cs_conf_part_err_dma1, tx_cs_pkt_part_err_dma1 } ;

   assign 	  tx_dma1_pre_st ={45'h0,3'h0,ShadowRingCurrentPtr_DMA1_d}; 
   assign 	  tx_dma1_rng_err_logh = {32'h0,err_logh_err_dma1,err_logh_merr_dma1,err_logh_err_code_dma1,15'h0,err_log_err_addr_dma1[43:32] };
   assign 	  tx_dma1_rng_err_logl = {32'h0,err_log_err_addr_dma1[31:0]};
   assign 	  tx_cs_dma1 = { 4'h0, tx_cs_pkt_cnt_dma1, 4'h0, tx_cs_lastmark_dma1, tx_dma_cfg_dma1_rst, tx_dma_cfg_dma1_stall,
				 tx_cfg_dma1_enable_mb,tx_dma_cfg_dma1_stop,tx_dma_cfg_dma1_stop_state,11'h0 , tx_cfg_dma1_mk, tx_cfg_dma1_mmk, 6'h0, tx_cs_dma1_err };


   // DMA2
   // setting various error bits--
   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_tx_ring_oflow_dma2 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA2_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_INTR_DBG_DMA2)  )
	  tx_cs_tx_ring_oflow_dma2 <= Slave_DataIn[5];
	else if(set_tx_ring_oflow_dma2)
	  tx_cs_tx_ring_oflow_dma2 <= 1'b1;
	else if(dma2_clear_reset)
	  tx_cs_tx_ring_oflow_dma2 <= 1'b0;
     end // else: !if(!Reset_L)


   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_pkt_size_error_dma2 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA2_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA2 ) )
	  tx_cs_pkt_size_error_dma2 <= Slave_DataIn[6];
	else if(txc_dmc_dma2_pkt_size_err & txc_dmc_pkt_size_err )
	  tx_cs_pkt_size_error_dma2 <= 1'b1;
	else if(dma2_clear_reset)
	  tx_cs_pkt_size_error_dma2 <= 1'b0;
     end // else: !if(!Reset_L)

   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_nack_pkt_rd_dma2 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA2_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA2) )
          tx_cs_nack_pkt_rd_dma2 <= Slave_DataIn[2];
	else if(txc_dmc_dma2_nack_pkt_rd & txc_dmc_nack_pkt_rd)
	  tx_cs_nack_pkt_rd_dma2 <= 1'b1;
	else if(dma2_clear_reset)
	  tx_cs_nack_pkt_rd_dma2 <= 1'b0;
     end // else: !if(!Reset_L)


   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_mbox_error_dma2 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA2_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA2) )
          tx_cs_mbox_error_dma2<= Slave_DataIn[7];
	else if(mbox_ack_dma2_err_received & mbox_err_received)
	  tx_cs_mbox_error_dma2 <= 1'b1;
	else if(dma2_clear_reset)
	  tx_cs_mbox_error_dma2 <= 1'b0;
     end // else: !if(!Reset_L)

   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_nack_pref_dma2<= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA2_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA2))
	  tx_cs_nack_pref_dma2<= Slave_DataIn[3];
	else if(txpref_dma2_nack_resp & txpref_nack_resp)
	  tx_cs_nack_pref_dma2 <= 1'b1;
	else if(dma2_clear_reset)
	  tx_cs_nack_pref_dma2 <= 1'b0;
     end // else: !if(!Reset_L)
   
   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_pref_buf_par_err_dma2 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA2_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA2))
          tx_cs_pref_buf_par_err_dma2 <= Slave_DataIn[4] ;
	else if(set_pref_buf_par_err_dma2)
	  tx_cs_pref_buf_par_err_dma2 <= 1'b1;
	else if(dma2_clear_reset)
	  tx_cs_pref_buf_par_err_dma2 <= 1'b0;
     end // else: !if(!Reset_L)

   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_conf_part_err_dma2 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA2_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA2))
          tx_cs_conf_part_err_dma2<= Slave_DataIn[1];
	else if(set_conf_part_error_dma2 | set_mbox_part_error_dma2)
	  tx_cs_conf_part_err_dma2 <= 1'b1;
	else if(dma2_clear_reset)
	  tx_cs_conf_part_err_dma2 <= 1'b0;
     end // else: !if(!Reset_L)
   
   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_pkt_part_err_dma2 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA2_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA2) )
	  tx_cs_pkt_part_err_dma2 <= Slave_DataIn[0];
	else if(set_pkt_part_err_dma2)
	  tx_cs_pkt_part_err_dma2 <= 1'b1;
	else if(dma2_clear_reset)
	  tx_cs_pkt_part_err_dma2 <= 1'b0;
     end // else: !if(!Reset_L)

   
// pkt_cnt as part of TX Config register
    always@(posedge SysClk ) begin
     if (!Reset_L) begin
        tx_cs_pkt_cnt_dma2 <= 12'h0;
     end else if(dma2_clear_reset) begin
        tx_cs_pkt_cnt_dma2 <= 12'h0;
     end else if (slaveStrobe & write_DMA2_Register && ({Slave_Addr[8:3],(~Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DBG_DMA2) ) begin
	tx_cs_pkt_cnt_dma2 <= Slave_DataIn[59:48];
     end else if(txc_dmc_dma2_inc_pkt_cnt) begin
        tx_cs_pkt_cnt_dma2 <= tx_cs_pkt_cnt_dma2 + 12'h1;
     end // else: !if(!Reset_L)
    end // always@ (posedge SysClk )

   always@(posedge SysClk) begin
      if(!Reset_L) begin
         tx_cs_lastmark_dma2 <= 12'h0;
      end else if(dma2_clear_reset) begin // if (!Reset_L)
         tx_cs_lastmark_dma2 <= 12'h0;
      end else if(txc_dmc_dma2_mark_bit) begin
         tx_cs_lastmark_dma2 <= tx_cs_pkt_cnt_dma2;
      end
   end

   assign set_dma2_error_logs = set_pref_buf_par_err_dma2 | set_pkt_part_err_dma2|( mbox_ack_dma2_err_received & mbox_err_received)|
	   		    (txpref_dma2_nack_resp & txpref_nack_resp)  | (set_conf_part_error_dma2 | set_mbox_part_error_dma2)
			    | (txc_dmc_dma2_nack_pkt_rd & txc_dmc_nack_pkt_rd) | (txc_dmc_dma2_pkt_size_err & txc_dmc_pkt_size_err) 
			    | set_tx_ring_oflow_dma2 ;
   // Error log associated with the errors
   always @(posedge SysClk )
     if (!Reset_L) begin
	err_logh_err_dma2 <= 1'b0;  
	err_logh_err_dma2_d <= 1'b0;  
	err_logh_merr_dma2 <= 1'b0;
     end else begin
	err_logh_err_dma2_d <= err_logh_err_dma2;  
	if( set_dma2_error_logs ) begin
	   err_logh_err_dma2 <= 1'b1;
	   // may need another term here -- TOADS
	   err_logh_merr_dma2 <= ( err_logh_err_dma2)  ? 1'b1: 1'b0;
	end // if (| tx_cs_dma2_err )
	else if(dma2_clear_reset) begin
	   err_logh_err_dma2 <= 1'b0;
	   err_logh_merr_dma2 <= 1'b0;
	end // if (dma2_clear_reset)
     end // else: !if(!Reset_L)
   // Error code and Error address
   always @(posedge SysClk )
     if (!Reset_L) begin
	err_logh_err_code_dma2 <= 3'h0;
        err_log_err_addr_dma2 <= 44'h0;
     end else if(dma2_clear_reset) begin
	err_logh_err_code_dma2 <= 3'h0;
        err_log_err_addr_dma2 <= 44'h0;
     end else if(~err_logh_err_dma2_d & err_logh_err_dma2) begin
	if(tx_cs_pkt_size_error_dma2 ) begin
	   err_logh_err_code_dma2 <= `ERR_CODE_PKT_SIZE_ERR;
	   err_log_err_addr_dma2 <= txc_dmc_pkt_size_err_addr_dma2;
	end else if(tx_cs_pref_buf_par_err_dma2 ) begin
	   err_logh_err_code_dma2 <= `ERR_CODE_PREF_BUF_PAR_ERR;
	   err_log_err_addr_dma2 <= 44'h0;// Not sure what to log??;
	end else if(tx_cs_tx_ring_oflow_dma2 ) begin
	   err_logh_err_code_dma2 <= `ERR_CODE_TX_RING_OFLOW;
	   err_log_err_addr_dma2 <= 44'h0;// Not sure what to log??;
	end else if( tx_cs_nack_pref_dma2) begin
	   err_logh_err_code_dma2 <= `ERR_CODE_NACK_PREF;
	   err_log_err_addr_dma2 <= txpref_nack_rd_addr;
	end else if( tx_cs_nack_pkt_rd_dma2 ) begin
	   err_logh_err_code_dma2 <= `ERR_CODE_NACK_PKT_RD;
	   err_log_err_addr_dma2 <= txc_dmc_nack_pkt_rd_addr;
	end else if(tx_cs_conf_part_err_dma2 ) begin
	   err_logh_err_code_dma2 <= `ERR_CODE_CONF_PART_ERR;
	   err_log_err_addr_dma2 <= set_mbox_part_error_dma2 ? {tx_dma_cfg_dma2_mbaddr, 6'h0}: {tx_rng_cfg_dma2_staddr,6'h0} ;
	end else if(tx_cs_pkt_part_err_dma2) begin
	   err_logh_err_code_dma2 <= `ERR_CODE_PKT_PART_ERR;
	   err_log_err_addr_dma2 <=pkt_part_error_address_dma2 ;
	end
     end // if (!err_logh_merr_dma2)

   // TXCS_ Error logic
   // DMA2
   assign set_dma2_error = (set_pref_buf_par_err_dma2|set_pkt_part_err_dma2);
    always @(posedge SysClk )
     if (!Reset_L) begin
        dmc_txc_dma2_error <= 1'b0;
     end else begin
        if(dma2_clear_reset) dmc_txc_dma2_error <= 1'b0;
        else dmc_txc_dma2_error <= ( ((| tx_cs_dma2_err) | set_dma2_error));

     end
   assign 	  tx_cs_dma2_err = {tx_cs_mbox_error_dma2, tx_cs_pkt_size_error_dma2, tx_cs_tx_ring_oflow_dma2, tx_cs_pref_buf_par_err_dma2, 
				    tx_cs_nack_pref_dma2, tx_cs_nack_pkt_rd_dma2, tx_cs_conf_part_err_dma2, tx_cs_pkt_part_err_dma2 } ;

   assign 	  tx_dma2_pre_st = {45'h0,3'h0,ShadowRingCurrentPtr_DMA2_d};
   assign 	  tx_dma2_rng_err_logh = {32'h0,err_logh_err_dma2,err_logh_merr_dma2,err_logh_err_code_dma2,15'h0,err_log_err_addr_dma2[43:32] };
   assign 	  tx_dma2_rng_err_logl = {32'h0,err_log_err_addr_dma2[31:0]};
   assign 	  tx_cs_dma2 = { 4'h0, tx_cs_pkt_cnt_dma2, 4'h0, tx_cs_lastmark_dma2, tx_dma_cfg_dma2_rst, tx_dma_cfg_dma2_stall,
				 tx_cfg_dma2_enable_mb,  tx_dma_cfg_dma2_stop,tx_dma_cfg_dma2_stop_state,11'h0, tx_cfg_dma2_mk, tx_cfg_dma2_mmk, 6'h0, tx_cs_dma2_err };


   // DMA3
   // setting various error bits--
   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_tx_ring_oflow_dma3 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA3_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_INTR_DBG_DMA3)) 
	  tx_cs_tx_ring_oflow_dma3 <= Slave_DataIn[5];
	else if(set_tx_ring_oflow_dma3)
	  tx_cs_tx_ring_oflow_dma3 <= 1'b1;
	else if(dma3_clear_reset)
	  tx_cs_tx_ring_oflow_dma3 <= 1'b0;
     end // else: !if(!Reset_L)


   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_pkt_size_error_dma3 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA3_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA3 ) )
	  tx_cs_pkt_size_error_dma3 <= Slave_DataIn[6];
	else if(txc_dmc_dma3_pkt_size_err & txc_dmc_pkt_size_err )
	  tx_cs_pkt_size_error_dma3 <= 1'b1;
	else if(dma3_clear_reset)
	  tx_cs_pkt_size_error_dma3 <= 1'b0;
     end // else: !if(!Reset_L)


   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_nack_pkt_rd_dma3 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA3_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA3) )
          tx_cs_nack_pkt_rd_dma3 <= Slave_DataIn[2];
	else if(txc_dmc_dma3_nack_pkt_rd & txc_dmc_nack_pkt_rd)
	  tx_cs_nack_pkt_rd_dma3 <= 1'b1;
	else if(dma3_clear_reset)
	  tx_cs_nack_pkt_rd_dma3 <= 1'b0;
     end // else: !if(!Reset_L)


   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_mbox_error_dma3 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA3_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA3) )
          tx_cs_mbox_error_dma3<= Slave_DataIn[7];
	else if(mbox_ack_dma3_err_received & mbox_err_received)
	  tx_cs_mbox_error_dma3 <= 1'b1;
	else if(dma3_clear_reset)
	  tx_cs_mbox_error_dma3 <= 1'b0;
     end // else: !if(!Reset_L)

   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_nack_pref_dma3<= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA3_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA3))
	  tx_cs_nack_pref_dma3<= Slave_DataIn[3];
	else if(txpref_dma3_nack_resp & txpref_nack_resp)
	  tx_cs_nack_pref_dma3 <= 1'b1;
	else if(dma3_clear_reset)
	  tx_cs_nack_pref_dma3 <= 1'b0;
     end // else: !if(!Reset_L)
   
   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_pref_buf_par_err_dma3 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA3_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA3))
          tx_cs_pref_buf_par_err_dma3 <= Slave_DataIn[4];
	else if(set_pref_buf_par_err_dma3)
	  tx_cs_pref_buf_par_err_dma3 <= 1'b1;
	else if(dma3_clear_reset)
	  tx_cs_pref_buf_par_err_dma3 <= 1'b0;
     end // else: !if(!Reset_L)

   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_conf_part_err_dma3 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA3_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA3))
          tx_cs_conf_part_err_dma3<= Slave_DataIn[1];
	else if(set_conf_part_error_dma3 | set_mbox_part_error_dma3)
	  tx_cs_conf_part_err_dma3 <= 1'b1;
	else if(dma3_clear_reset)
	  tx_cs_conf_part_err_dma3 <= 1'b0;
     end // else: !if(!Reset_L)
   
   always @(posedge SysClk )
     if (!Reset_L) begin
	tx_cs_pkt_part_err_dma3 <= 1'b0;
     end else begin
	// setting take precedence
	if(slaveStrobe & write_DMA3_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA3) )
	  tx_cs_pkt_part_err_dma3 <= Slave_DataIn[0];
	else if(set_pkt_part_err_dma3)
	  tx_cs_pkt_part_err_dma3 <= 1'b1;
	else if(dma3_clear_reset)
	  tx_cs_pkt_part_err_dma3 <= 1'b0;
     end // else: !if(!Reset_L)
   
// pkt_cnt as part of TX Config register
    always@(posedge SysClk ) begin
     if (!Reset_L) begin
        tx_cs_pkt_cnt_dma3 <= 12'h0;
     end else if(dma3_clear_reset) begin
        tx_cs_pkt_cnt_dma3 <= 12'h0;
     end else if (slaveStrobe & write_DMA3_Register && ({Slave_Addr[8:3],(~Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DBG_DMA3) ) begin
	tx_cs_pkt_cnt_dma3 <= Slave_DataIn[59:48];
     end else if(txc_dmc_dma3_inc_pkt_cnt) begin
        tx_cs_pkt_cnt_dma3 <= tx_cs_pkt_cnt_dma3 + 12'h1;
     end // else: !if(!Reset_L)
    end // always@ (posedge SysClk )

   always@(posedge SysClk) begin
      if(!Reset_L) begin
         tx_cs_lastmark_dma3 <= 12'h0;
      end else if(dma3_clear_reset) begin // if (!Reset_L)
         tx_cs_lastmark_dma3 <= 12'h0;
      end else if(txc_dmc_dma3_mark_bit) begin
         tx_cs_lastmark_dma3 <= tx_cs_pkt_cnt_dma3;
      end
   end


   assign set_dma3_error_logs = set_pref_buf_par_err_dma3 | set_pkt_part_err_dma3|( mbox_ack_dma3_err_received & mbox_err_received)|
	   		    (txpref_dma3_nack_resp & txpref_nack_resp)  | (set_conf_part_error_dma3 | set_mbox_part_error_dma3)
			    | (txc_dmc_dma3_nack_pkt_rd & txc_dmc_nack_pkt_rd) | (txc_dmc_dma3_pkt_size_err & txc_dmc_pkt_size_err) 
			    | set_tx_ring_oflow_dma3 ;
   // Error log associated with the errors
   always @(posedge SysClk )
     if (!Reset_L) begin
	err_logh_err_dma3 <= 1'b0;  
	err_logh_err_dma3_d <= 1'b0;  
	err_logh_merr_dma3 <= 1'b0;
     end else begin
	err_logh_err_dma3_d <= err_logh_err_dma3;  
	if( set_dma3_error_logs) begin
	   err_logh_err_dma3 <= 1'b1;
	   // may need another term here -- TOADS
	   err_logh_merr_dma3 <= ( err_logh_err_dma3)  ? 1'b1: 1'b0;
	end // if (| tx_cs_dma3_err )
	else if(dma3_clear_reset) begin
	   err_logh_err_dma3 <= 1'b0;
	   err_logh_merr_dma3 <= 1'b0;
	end // if (dma3_clear_reset)
     end // else: !if(!Reset_L)
   // Error code and Error address
   always @(posedge SysClk )
     if (!Reset_L) begin
	err_logh_err_code_dma3 <= 3'h0;
        err_log_err_addr_dma3 <= 44'h0;
     end else if(dma3_clear_reset) begin
	err_logh_err_code_dma3 <= 3'h0;
        err_log_err_addr_dma3 <= 44'h0;
     end else if(~err_logh_err_dma3_d & err_logh_err_dma3) begin
	if(tx_cs_pkt_size_error_dma3 ) begin
	   err_logh_err_code_dma3 <= `ERR_CODE_PKT_SIZE_ERR;
	   err_log_err_addr_dma3 <= txc_dmc_pkt_size_err_addr_dma3;
	end else if(tx_cs_pref_buf_par_err_dma3 ) begin
	   err_logh_err_code_dma3 <= `ERR_CODE_PREF_BUF_PAR_ERR;
	   err_log_err_addr_dma3 <= 44'h0;// Not sure what to log??;
	end else if(tx_cs_tx_ring_oflow_dma3 ) begin
	   err_logh_err_code_dma3 <= `ERR_CODE_TX_RING_OFLOW;
	   err_log_err_addr_dma3 <= 44'h0;// Not sure what to log??;
	end else if( tx_cs_nack_pref_dma3) begin
	   err_logh_err_code_dma3 <= `ERR_CODE_NACK_PREF;
	   err_log_err_addr_dma3 <= txpref_nack_rd_addr;
	end else if( tx_cs_nack_pkt_rd_dma3 ) begin
	   err_logh_err_code_dma3 <= `ERR_CODE_NACK_PKT_RD;
	   err_log_err_addr_dma3 <= txc_dmc_nack_pkt_rd_addr;
	end else if(tx_cs_conf_part_err_dma3 ) begin
	   err_logh_err_code_dma3 <= `ERR_CODE_CONF_PART_ERR;
	   err_log_err_addr_dma3 <= set_mbox_part_error_dma3 ? {tx_dma_cfg_dma3_mbaddr, 6'h0}: {tx_rng_cfg_dma3_staddr,6'h0} ;
	end else if(tx_cs_pkt_part_err_dma3) begin
	   err_logh_err_code_dma3 <= `ERR_CODE_PKT_PART_ERR;
	   err_log_err_addr_dma3 <=pkt_part_error_address_dma3 ;
	end
     end // if (!err_logh_merr_dma3)

   // TXCS_ Error logic
   // DMA3
   assign set_dma3_error = (set_pref_buf_par_err_dma3|set_pkt_part_err_dma3);

    always @(posedge SysClk )
     if (!Reset_L) begin
        dmc_txc_dma3_error <= 1'b0;
     end else begin
       if(dma3_clear_reset) dmc_txc_dma3_error <= 1'b0;
        else dmc_txc_dma3_error <= ( ((| tx_cs_dma3_err) | set_dma3_error));
     end
   assign 	  tx_cs_dma3_err = {tx_cs_mbox_error_dma3, tx_cs_pkt_size_error_dma3, tx_cs_tx_ring_oflow_dma3, tx_cs_pref_buf_par_err_dma3, 
				    tx_cs_nack_pref_dma3, tx_cs_nack_pkt_rd_dma3, tx_cs_conf_part_err_dma3, tx_cs_pkt_part_err_dma3 } ;

   assign 	  tx_dma3_pre_st = {45'h0,3'h0,ShadowRingCurrentPtr_DMA3_d};
   assign 	  tx_dma3_rng_err_logh = {32'h0,err_logh_err_dma3,err_logh_merr_dma3,err_logh_err_code_dma3,15'h0,err_log_err_addr_dma3[43:32] };
   assign 	  tx_dma3_rng_err_logl = {32'h0,err_log_err_addr_dma3[31:0]};
   assign 	  tx_cs_dma3 = { 4'h0, tx_cs_pkt_cnt_dma3, 4'h0, tx_cs_lastmark_dma3, tx_dma_cfg_dma3_rst, tx_dma_cfg_dma3_stall,
				 tx_cfg_dma3_enable_mb,tx_dma_cfg_dma3_stop,tx_dma_cfg_dma3_stop_state,11'h0 , tx_cfg_dma3_mk, tx_cfg_dma3_mmk, 6'h0, tx_cs_dma3_err };





   
   // ERROR STATUS


   
   // Hardware/Software RW registers-
   // DMA_0

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
	  tx_dma_cfg_dma0_rst <=1'b0;
	  tx_dma_cfg_dma0_stall <=1'b1;
	  tx_dma_cfg_dma0_stop <= 1'b0;

       end // if (!Reset_L)
     else if(dma0_clear_reset) begin
	tx_dma_cfg_dma0_rst <=1'b0;
	tx_dma_cfg_dma0_stall <= 1'b1;
     end else if (slaveStrobe & write_DMA0_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DMA0) )
       begin
	  tx_dma_cfg_dma0_rst <= Slave_DataIn[31];
	  tx_dma_cfg_dma0_stall<= Slave_DataIn[30];
	  tx_dma_cfg_dma0_stop <= Slave_DataIn[28];

       end // if (write_DMA0_Register)
   

   
   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          tx_cfg_dma0_mk <= 1'b0;
       end else begin // if (!Reset_L)
          if(set_cfg_dma0_mk) begin
             tx_cfg_dma0_mk <= 1'b1;
          end else if(tx_cs_read_dma0_3[0]) begin
             tx_cfg_dma0_mk <= 1'b0;
          end else if (slaveStrobe & write_DMA0_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DMA0) ) begin
             if(tx_cfg_dma0_mmk & Slave_DataIn[15]) begin
               	tx_cfg_dma0_mk <= Slave_DataIn[15];
             end // if (tx_cfg_dma0_mmk & Slave_DataIn[15])
             else if(Slave_DataIn[15])
               tx_cfg_dma0_mk <= 1'b0;
          end else if(slaveStrobe & write_DMA0_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA0)) begin
             tx_cfg_dma0_mk <= Slave_DataIn[15];
          end
       end // else: !if(!Reset_L)

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          tx_cfg_dma0_mmk <= 1'b0;
       end else begin // if (!Reset_L)
          if(set_cfg_dma0_mmk) begin
             tx_cfg_dma0_mmk <= 1'b1;
          end else if(tx_cs_read_dma0_3[0]) begin
             tx_cfg_dma0_mmk <= 1'b0;
          end else if (slaveStrobe & write_DMA0_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DMA0) ) begin
             if(tx_cfg_dma0_mmk & Slave_DataIn[15]) begin
                tx_cfg_dma0_mmk <= 1'b0;
             end // if (tx_cfg_dma0_mmk & Slave_DataIn[15])
          end 
       end // else: !if(!Reset_L)

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          tx_cfg_dma0_enable_mb <= 1'b0;
       end else begin // if (!Reset_L)
          if (slaveStrobe & write_DMA0_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DMA0) ) begin
             tx_cfg_dma0_enable_mb <= Slave_DataIn[29];
          end else begin
             tx_cfg_dma0_enable_mb <= clear_cfg_dma0_mb ? 1'b0 : tx_cfg_dma0_enable_mb;
          end // if (clear_cfg_dma0_mb)
       end // else: !if(!Reset_L)


   
   // DMA_1

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
	  tx_dma_cfg_dma1_rst <=1'b0;
	  tx_dma_cfg_dma1_stall <=1'b1;
	  tx_dma_cfg_dma1_stop <= 1'b0;

       end // if (!Reset_L)
     else if(dma1_clear_reset) begin
	tx_dma_cfg_dma1_rst <=1'b0;
	tx_dma_cfg_dma1_stall <= 1'b1;
     end else if (slaveStrobe & write_DMA1_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DMA1) )
       begin
	  tx_dma_cfg_dma1_rst <= Slave_DataIn[31];
	  tx_dma_cfg_dma1_stall<= Slave_DataIn[30];
	  tx_dma_cfg_dma1_stop <= Slave_DataIn[28];
	  
       end // if (write_DMA1_Register)
   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          tx_cfg_dma1_mk <= 1'b0;
       end else begin // if (!Reset_L)
          if(set_cfg_dma1_mk) begin
             tx_cfg_dma1_mk <= 1'b1;
          end else if(tx_cs_read_dma0_3[1]) begin
             tx_cfg_dma1_mk <= 1'b0;
          end else if (slaveStrobe & write_DMA1_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DMA1) ) begin
             if(tx_cfg_dma1_mmk & Slave_DataIn[15]) begin
               	tx_cfg_dma1_mk <= Slave_DataIn[15];
             end // if (tx_cfg_dma1_mmk & Slave_DataIn[15])
             else if(Slave_DataIn[15])
               tx_cfg_dma1_mk <= 1'b0;
          end else if(slaveStrobe & write_DMA1_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA1)) begin
             tx_cfg_dma1_mk <= Slave_DataIn[15];
          end
       end // else: !if(!Reset_L)

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          tx_cfg_dma1_mmk <= 1'b0;
       end else begin // if (!Reset_L)
          if(set_cfg_dma1_mmk) begin
             tx_cfg_dma1_mmk <= 1'b1;
          end else if(tx_cs_read_dma0_3[1]) begin
             tx_cfg_dma1_mmk <= 1'b0;
          end else if (slaveStrobe & write_DMA1_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DMA1) ) begin
             if(tx_cfg_dma1_mmk & Slave_DataIn[15]) begin
                tx_cfg_dma1_mmk <= 1'b0;
             end // if (tx_cfg_dma1_mmk & Slave_DataIn[15])
          end 
       end // else: !if(!Reset_L)

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          tx_cfg_dma1_enable_mb <= 1'b0;
       end else begin // if (!Reset_L)
          if (slaveStrobe & write_DMA1_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DMA1) ) begin
             tx_cfg_dma1_enable_mb <= Slave_DataIn[29];
          end else begin
             tx_cfg_dma1_enable_mb <= clear_cfg_dma1_mb ? 1'b0 : tx_cfg_dma1_enable_mb;
          end // if (clear_cfg_dma1_mb)
       end // else: !if(!Reset_L)



   // DMA_2

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
	  tx_dma_cfg_dma2_rst <=1'b0;
	  tx_dma_cfg_dma2_stall <=1'b1;
	  tx_dma_cfg_dma2_stop <= 1'b0;

       end // if (!Reset_L)
     else if(dma2_clear_reset) begin
	tx_dma_cfg_dma2_rst <=1'b0;
	tx_dma_cfg_dma2_stall <= 1'b1;
     end else if (slaveStrobe & write_DMA2_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DMA2) )
       begin
	  tx_dma_cfg_dma2_rst <= Slave_DataIn[31];
	  tx_dma_cfg_dma2_stall<= Slave_DataIn[30];
	  tx_dma_cfg_dma2_stop <= Slave_DataIn[28];

       end // if (write_DMA2_Register)

   
   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          tx_cfg_dma2_mk <= 1'b0;
       end else begin // if (!Reset_L)
          if(set_cfg_dma2_mk) begin
             tx_cfg_dma2_mk <= 1'b1;
          end else if(tx_cs_read_dma0_3[2]) begin
             tx_cfg_dma2_mk <= 1'b0;
          end else if (slaveStrobe & write_DMA2_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DMA2) ) begin
             if(tx_cfg_dma2_mmk & Slave_DataIn[15]) begin
               	tx_cfg_dma2_mk <= Slave_DataIn[15];
             end // if (tx_cfg_dma2_mmk & Slave_DataIn[15])
             else if(Slave_DataIn[15])
               tx_cfg_dma2_mk <= 1'b0;
          end else if(slaveStrobe & write_DMA2_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA2)) begin
             tx_cfg_dma2_mk <= Slave_DataIn[15];
          end
       end // else: !if(!Reset_L)

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          tx_cfg_dma2_mmk <= 1'b0;
       end else begin // if (!Reset_L)
          if(set_cfg_dma2_mmk) begin
             tx_cfg_dma2_mmk <= 1'b1;
          end else if(tx_cs_read_dma0_3[2]) begin
             tx_cfg_dma2_mmk <= 1'b0;
          end else if (slaveStrobe & write_DMA2_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DMA2) ) begin
             if(tx_cfg_dma2_mmk & Slave_DataIn[15]) begin
                tx_cfg_dma2_mmk <= 1'b0;
             end // if (tx_cfg_dma2_mmk & Slave_DataIn[15])
          end 
       end // else: !if(!Reset_L)

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          tx_cfg_dma2_enable_mb <= 1'b0;
       end else begin // if (!Reset_L)
          if (slaveStrobe & write_DMA2_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DMA2) ) begin
             tx_cfg_dma2_enable_mb <= Slave_DataIn[29];
          end else begin
             tx_cfg_dma2_enable_mb <= clear_cfg_dma2_mb ? 1'b0 : tx_cfg_dma2_enable_mb;
          end // if (clear_cfg_dma2_mb)
       end // else: !if(!Reset_L)

   
   // DMA_3

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
	  tx_dma_cfg_dma3_rst <=1'b0;
	  tx_dma_cfg_dma3_stall <=1'b1;
	  tx_dma_cfg_dma3_stop <= 1'b0;
	  
       end // if (!Reset_L)
     else if(dma3_clear_reset) begin
	tx_dma_cfg_dma3_rst <=1'b0;
	tx_dma_cfg_dma3_stall <= 1'b1;
     end else if (slaveStrobe & write_DMA3_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DMA3) )
       begin
	  tx_dma_cfg_dma3_rst <= Slave_DataIn[31];
	  tx_dma_cfg_dma3_stall<= Slave_DataIn[30];
	  tx_dma_cfg_dma3_stop <= Slave_DataIn[28];
	  
       end // if (write_DMA3_Register)

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          tx_cfg_dma3_mk <= 1'b0;
       end else begin // if (!Reset_L)
          if(set_cfg_dma3_mk) begin
             tx_cfg_dma3_mk <= 1'b1;
          end else if(tx_cs_read_dma0_3[3]) begin
             tx_cfg_dma3_mk <= 1'b0;
          end else if (slaveStrobe & write_DMA3_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DMA3) ) begin
             if(tx_cfg_dma3_mmk & Slave_DataIn[15]) begin
               	tx_cfg_dma3_mk <= Slave_DataIn[15];
             end // if (tx_cfg_dma3_mmk & Slave_DataIn[15])
             else if(Slave_DataIn[15])
               tx_cfg_dma3_mk <= 1'b0;
          end else if(slaveStrobe & write_DMA3_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} ==`TXDMA_INTR_DBG_DMA3)) begin
             tx_cfg_dma3_mk <= Slave_DataIn[15];
          end
       end // else: !if(!Reset_L)

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          tx_cfg_dma3_mmk <= 1'b0;
       end else begin // if (!Reset_L)
          if(set_cfg_dma3_mmk) begin
             tx_cfg_dma3_mmk <= 1'b1;
          end else if(tx_cs_read_dma0_3[3]) begin
             tx_cfg_dma3_mmk <= 1'b0;
          end else if (slaveStrobe & write_DMA3_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DMA3) ) begin
             if(tx_cfg_dma3_mmk & Slave_DataIn[15]) begin
                tx_cfg_dma3_mmk <= 1'b0;
             end // if (tx_cfg_dma3_mmk & Slave_DataIn[15])
          end 
       end // else: !if(!Reset_L)

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          tx_cfg_dma3_enable_mb <= 1'b0;
       end else begin // if (!Reset_L)
          if (slaveStrobe & write_DMA3_Register && ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0} == `TXDMA_CS_DMA3) ) begin
             tx_cfg_dma3_enable_mb <= Slave_DataIn[29];
          end else begin
             tx_cfg_dma3_enable_mb <= clear_cfg_dma3_mb ? 1'b0 : tx_cfg_dma3_enable_mb;
          end // if (clear_cfg_dma3_mb)
       end // else: !if(!Reset_L)



   // PIOS
   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          tx_rng_cfg_dma0_len <= `RNG_LENGTH_WIDTH'h0;
          tx_rng_cfg_dma0_staddr <= 38'h0;
          tx_rng_tail_dma0 <=`PTR_WIDTH_PLUS1'h0;

	  tx_ent_mask_ldf0_dma0 <= 1'b1;
	  tx_ent_mask_ldf1_dma0 <= 8'hff;
          tx_dma_cfg_dma0_mbaddr <= 38'h0;
`ifdef NEPTUNE
	  tx_rng_cfg_dma0_shadow_written <= 1'b0;
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
	  

       end // if (!Reset_L)
     else if (write_DMA0_Register)
       begin

`ifdef NEPTUNE

	  case ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b), 2'h0}) // synopsys parallel_case

	    `TXDMA_RNG_CFIG_DMA0: begin

               if(pio_clients_32b) begin
		  tx_rng_cfg_dma0_shadow[31:0] <= Slave_DataIn[31:0];
		  tx_rng_cfg_dma0_shadow_written <= 1'b1;
	       end else begin  // 64 bit mode
		  tx_rng_cfg_dma0_len <= Slave_DataIn[`RNG_LENGTH_WIDTH -1  + 48 :48];
		  tx_rng_cfg_dma0_staddr <= Slave_DataIn[43:6];
	       end // else: !if(pio_clients_32b)
	    end 

	    `TXDMA_RNG_CFIG_DMA0_H: begin
	       // This condition will never happen in 64 bit mode
               if(pio_clients_32b) begin
		  if(tx_rng_cfg_dma0_shadow_written) begin
		     tx_rng_cfg_dma0_len <= Slave_DataIn[`RNG_LENGTH_WIDTH -1  + 16 :16];
		     tx_rng_cfg_dma0_staddr <= { Slave_DataIn[11:0],tx_rng_cfg_dma0_shadow[31:6] };
		     tx_rng_cfg_dma0_shadow_written <= 1'b0;
		  end // else: !if(tx_rng_cfg_dma0_shadow_written)
	       end // if (pio_clients_32b)
	    end 


	    
`else
	    case ({Slave_Addr[8:3],3'h0}) // synopsys parallel_case
	      `TXDMA_RNG_CFIG_DMA0: begin
		 tx_rng_cfg_dma0_len <= Slave_DataIn[`RNG_LENGTH_WIDTH -1  + 48 :48];
		 tx_rng_cfg_dma0_staddr <= Slave_DataIn[43:6];
	      end 

`endif
              `TXDMA_MBH_DMA0: tx_dma_cfg_dma0_mbaddr[37:26]<= Slave_DataIn[11:0];
              `TXDMA_MBL_DMA0: tx_dma_cfg_dma0_mbaddr[25:0]<= Slave_DataIn[31:6];
  	      `TXDMA_RING_KICK_DMA0: tx_rng_tail_dma0 <= Slave_DataIn[`PTR_WIDTH   + 3 :3];

	      `TXDMA_ENT_MASK_DMA0 : begin
		 tx_ent_mask_ldf0_dma0 <= Slave_DataIn[15];
		 tx_ent_mask_ldf1_dma0 <= Slave_DataIn[7:0];
	      end
	      
	      
	    endcase
	  end // if (write_DMA0_Register)

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          page0_mask_dma0 <= 32'h0;
          page0_value_dma0 <= 32'h0;
          page0_reloc_dma0 <= 32'h0;
          page0_valid_dma0 <= 1'b0 ;
          page1_mask_dma0 <= 32'h0;
          page1_value_dma0 <= 32'h0;
          page1_reloc_dma0 <= 32'h0;
          page1_valid_dma0 <= 1'b0;
          dmc_txc_dma0_page_handle <= 20'h0;
	  dmc_txc_dma0_func_num <= 2'h0;

       end // if (!Reset_L)
     else if (write_FZC_DMA0_Register )
       begin
          case ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0}) // synopsys parallel_case
            `TXDMA_LOG_PAGE_VLD_DMA0:   {dmc_txc_dma0_func_num,page1_valid_dma0,page0_valid_dma0} <= Slave_DataIn[3:0];
            `TXDMA_LOG_PAGE_MASK0_DMA0:  page0_mask_dma0 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_VALUE0_DMA0: page0_value_dma0 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_MASK1_DMA0:  page1_mask_dma0 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_VALUE1_DMA0: page1_value_dma0 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_RELOC0_DMA0: page0_reloc_dma0 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_RELOC1_DMA0: page1_reloc_dma0 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_HANDLE_DMA0: dmc_txc_dma0_page_handle <= Slave_DataIn[19:0];
          endcase
       end // if (write_FZC_DMA0_Register)

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          tx_rng_cfg_dma1_len <= `RNG_LENGTH_WIDTH'h0;
          tx_rng_cfg_dma1_staddr <= 38'h0;
          tx_rng_tail_dma1 <=`PTR_WIDTH_PLUS1'h0;

	  tx_ent_mask_ldf0_dma1 <= 1'b1;
	  tx_ent_mask_ldf1_dma1 <= 8'hff;
	  
          tx_dma_cfg_dma1_mbaddr <= 38'h0;
`ifdef NEPTUNE
	  tx_rng_cfg_dma1_shadow_written <= 1'b0;
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
	  

       end // if (!Reset_L)
     else if (write_DMA1_Register)
       begin

`ifdef NEPTUNE

	  case ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b), 2'h0}) // synopsys parallel_case

	    `TXDMA_RNG_CFIG_DMA1: begin

               if(pio_clients_32b) begin
		  tx_rng_cfg_dma1_shadow[31:0] <= Slave_DataIn[31:0];
		  tx_rng_cfg_dma1_shadow_written <= 1'b1;
	       end else begin  // 64 bit mode
		  tx_rng_cfg_dma1_len <= Slave_DataIn[`RNG_LENGTH_WIDTH -1  +  48 :48];
		  tx_rng_cfg_dma1_staddr <= Slave_DataIn[43:6];
	       end // else: !if(pio_clients_32b)
	    end 

	    `TXDMA_RNG_CFIG_DMA1_H: begin
	       // This condition will never happen in 64 bit mode
               if(pio_clients_32b) begin
		  if(tx_rng_cfg_dma1_shadow_written) begin
		     tx_rng_cfg_dma1_len <= Slave_DataIn[`RNG_LENGTH_WIDTH -1  + 16:16];
		     tx_rng_cfg_dma1_staddr <= { Slave_DataIn[11:0],tx_rng_cfg_dma1_shadow[31:6] };
		     tx_rng_cfg_dma1_shadow_written <= 1'b0;
		  end // else: !if(tx_rng_cfg_dma1_shadow_written)
	       end // if (pio_clients_32b)
	    end 


	    
`else
	    case ({Slave_Addr[8:3],3'h0}) // synopsys parallel_case
	      `TXDMA_RNG_CFIG_DMA1: begin
		 tx_rng_cfg_dma1_len <= Slave_DataIn[`RNG_LENGTH_WIDTH -1  + 48 :48];
		 tx_rng_cfg_dma1_staddr <= Slave_DataIn[43:6];
	      end 

`endif
              `TXDMA_MBH_DMA1: tx_dma_cfg_dma1_mbaddr[37:26]<= Slave_DataIn[11:0];
              `TXDMA_MBL_DMA1: tx_dma_cfg_dma1_mbaddr[25:0]<= Slave_DataIn[31:6];
  	      `TXDMA_RING_KICK_DMA1: tx_rng_tail_dma1 <= Slave_DataIn[`PTR_WIDTH   + 3:3];
	      `TXDMA_ENT_MASK_DMA1 : begin
		 tx_ent_mask_ldf0_dma1 <= Slave_DataIn[15];
		 tx_ent_mask_ldf1_dma1 <= Slave_DataIn[7:0];
	      end
	    endcase
	  end // if (write_DMA1_Register)

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          page0_mask_dma1 <= 32'h0;
          page0_value_dma1 <= 32'h0;
          page0_reloc_dma1 <= 32'h0;
          page0_valid_dma1 <= 1'b0 ;
          page1_mask_dma1 <= 32'h0;
          page1_value_dma1 <= 32'h0;
          page1_reloc_dma1 <= 32'h0;
          page1_valid_dma1 <= 1'b0;
          dmc_txc_dma1_page_handle <= 20'h0;
	  dmc_txc_dma1_func_num <= 2'h0;

       end // if (!Reset_L)
     else if (write_FZC_DMA1_Register )
       begin
          case ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0}) // synopsys parallel_case
            `TXDMA_LOG_PAGE_VLD_DMA1:   {dmc_txc_dma1_func_num,page1_valid_dma1,page0_valid_dma1} <= Slave_DataIn[3:0];
            `TXDMA_LOG_PAGE_MASK0_DMA1:  page0_mask_dma1 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_VALUE0_DMA1: page0_value_dma1 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_MASK1_DMA1:  page1_mask_dma1 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_VALUE1_DMA1: page1_value_dma1 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_RELOC0_DMA1: page0_reloc_dma1 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_RELOC1_DMA1: page1_reloc_dma1 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_HANDLE_DMA1: dmc_txc_dma1_page_handle <= Slave_DataIn[19:0];
          endcase
       end // if (write_FZC_DMA1_Register)

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          tx_rng_cfg_dma2_len <= `RNG_LENGTH_WIDTH'h0;
          tx_rng_cfg_dma2_staddr <= 38'h0;
          tx_rng_tail_dma2 <=`PTR_WIDTH_PLUS1'h0;

	  tx_ent_mask_ldf0_dma2 <= 1'b1;
	  tx_ent_mask_ldf1_dma2 <= 8'hff;
	  
          tx_dma_cfg_dma2_mbaddr <= 38'h0;
`ifdef NEPTUNE
	  tx_rng_cfg_dma2_shadow_written <= 1'b0;
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
	  
       end // if (!Reset_L)
     else if (write_DMA2_Register)
       begin

`ifdef NEPTUNE

	  case ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b), 2'h0}) // synopsys parallel_case

	    `TXDMA_RNG_CFIG_DMA2: begin

               if(pio_clients_32b) begin
		  tx_rng_cfg_dma2_shadow[31:0] <= Slave_DataIn[31:0];
		  tx_rng_cfg_dma2_shadow_written <= 1'b1;
	       end else begin  // 64 bit mode
		  tx_rng_cfg_dma2_len <= Slave_DataIn[`RNG_LENGTH_WIDTH -1  + 48 :48];
		  tx_rng_cfg_dma2_staddr <= Slave_DataIn[43:6];
	       end // else: !if(pio_clients_32b)
	    end 

	    `TXDMA_RNG_CFIG_DMA2_H: begin
	       // This condition will never happen in 64 bit mode
               if(pio_clients_32b) begin
		  if(tx_rng_cfg_dma2_shadow_written) begin
		     tx_rng_cfg_dma2_len <= Slave_DataIn[`RNG_LENGTH_WIDTH -1  + 16 :16];
		     tx_rng_cfg_dma2_staddr <= { Slave_DataIn[11:0],tx_rng_cfg_dma2_shadow[31:6] };
		     tx_rng_cfg_dma2_shadow_written <= 1'b0;
		  end // else: !if(tx_rng_cfg_dma2_shadow_written)
	       end // if (pio_clients_32b)
	    end 


	    
`else
	    case ({Slave_Addr[8:3],3'h0}) // synopsys parallel_case
	      `TXDMA_RNG_CFIG_DMA2: begin
		 tx_rng_cfg_dma2_len <= Slave_DataIn[`RNG_LENGTH_WIDTH -1  + 48 :48];
		 tx_rng_cfg_dma2_staddr <= Slave_DataIn[43:6];
	      end 

`endif
              `TXDMA_MBH_DMA2: tx_dma_cfg_dma2_mbaddr[37:26]<= Slave_DataIn[11:0];
              `TXDMA_MBL_DMA2: tx_dma_cfg_dma2_mbaddr[25:0]<= Slave_DataIn[31:6];
  	      `TXDMA_RING_KICK_DMA2: tx_rng_tail_dma2 <= Slave_DataIn[`PTR_WIDTH   + 3:3];

	      `TXDMA_ENT_MASK_DMA2 : begin
		 tx_ent_mask_ldf0_dma2 <= Slave_DataIn[15];
		 tx_ent_mask_ldf1_dma2 <= Slave_DataIn[7:0];
	      end
	    endcase
	  end // if (write_DMA2_Register)

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          page0_mask_dma2 <= 32'h0;
          page0_value_dma2 <= 32'h0;
          page0_reloc_dma2 <= 32'h0;
          page0_valid_dma2 <= 1'b0 ;
          page1_mask_dma2 <= 32'h0;
          page1_value_dma2 <= 32'h0;
          page1_reloc_dma2 <= 32'h0;
          page1_valid_dma2 <= 1'b0;
          dmc_txc_dma2_page_handle <= 20'h0;
	  dmc_txc_dma2_func_num <= 2'h0;

       end // if (!Reset_L)
     else if (write_FZC_DMA2_Register )
       begin
          case ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0}) // synopsys parallel_case
            `TXDMA_LOG_PAGE_VLD_DMA2:   {dmc_txc_dma2_func_num,page1_valid_dma2,page0_valid_dma2} <= Slave_DataIn[3:0];
            `TXDMA_LOG_PAGE_MASK0_DMA2:  page0_mask_dma2 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_VALUE0_DMA2: page0_value_dma2 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_MASK1_DMA2:  page1_mask_dma2 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_VALUE1_DMA2: page1_value_dma2 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_RELOC0_DMA2: page0_reloc_dma2 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_RELOC1_DMA2: page1_reloc_dma2 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_HANDLE_DMA2: dmc_txc_dma2_page_handle <= Slave_DataIn[19:0];
          endcase
       end // if (write_FZC_DMA2_Register)

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          tx_rng_cfg_dma3_len <= `RNG_LENGTH_WIDTH'h0;
          tx_rng_cfg_dma3_staddr <= 38'h0;
          tx_rng_tail_dma3 <=`PTR_WIDTH_PLUS1'h0;
	  tx_ent_mask_ldf0_dma3 <= 1'b1;
	  tx_ent_mask_ldf1_dma3 <= 8'hff;
          tx_dma_cfg_dma3_mbaddr <= 38'h0;
`ifdef NEPTUNE
	  tx_rng_cfg_dma3_shadow_written <= 1'b0;
`else // !ifdef NEPTUNE
`endif // !ifdef NEPTUNE
	  
       end // if (!Reset_L)
     else if (write_DMA3_Register)
       begin
`ifdef NEPTUNE

	  case ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b), 2'h0}) // synopsys parallel_case

	    `TXDMA_RNG_CFIG_DMA3: begin

               if(pio_clients_32b) begin
		  tx_rng_cfg_dma3_shadow[31:0] <= Slave_DataIn[31:0];
		  tx_rng_cfg_dma3_shadow_written <= 1'b1;
	       end else begin  // 64 bit mode
		  tx_rng_cfg_dma3_len <= Slave_DataIn[`RNG_LENGTH_WIDTH -1  + 48 :48];
		  tx_rng_cfg_dma3_staddr <= Slave_DataIn[43:6];
	       end // else: !if(pio_clients_32b)
	    end 

	    `TXDMA_RNG_CFIG_DMA3_H: begin
	       // This condition will never happen in 64 bit mode
               if(pio_clients_32b) begin
		  if(tx_rng_cfg_dma3_shadow_written) begin
		     tx_rng_cfg_dma3_len <= Slave_DataIn[`RNG_LENGTH_WIDTH -1  + 16 :16];
		     tx_rng_cfg_dma3_staddr <= { Slave_DataIn[11:0],tx_rng_cfg_dma3_shadow[31:6] };
		     tx_rng_cfg_dma3_shadow_written <= 1'b0;
		  end // else: !if(tx_rng_cfg_dma3_shadow_written)
	       end // if (pio_clients_32b)
	    end 


	    
`else
	    case ({Slave_Addr[8:3],3'h0}) // synopsys parallel_case
	      `TXDMA_RNG_CFIG_DMA3: begin
		 tx_rng_cfg_dma3_len <= Slave_DataIn[`RNG_LENGTH_WIDTH -1  + 48 :48];
		 tx_rng_cfg_dma3_staddr <= Slave_DataIn[43:6];
	      end 

`endif
              `TXDMA_MBH_DMA3: tx_dma_cfg_dma3_mbaddr[37:26]<= Slave_DataIn[11:0];
              `TXDMA_MBL_DMA3: tx_dma_cfg_dma3_mbaddr[25:0]<= Slave_DataIn[31:6];
  	      `TXDMA_RING_KICK_DMA3: tx_rng_tail_dma3 <= Slave_DataIn[`PTR_WIDTH   + 3:3];

	      `TXDMA_ENT_MASK_DMA3 : begin
		 tx_ent_mask_ldf0_dma3 <= Slave_DataIn[15];
		 tx_ent_mask_ldf1_dma3 <= Slave_DataIn[7:0];
	      end
	    endcase
	  end // if (write_DMA3_Register)

   always @ (posedge SysClk )
     if (!Reset_L)
       begin
          page0_mask_dma3 <= 32'h0;
          page0_value_dma3 <= 32'h0;
          page0_reloc_dma3 <= 32'h0;
          page0_valid_dma3 <= 1'b0 ;
          page1_mask_dma3 <= 32'h0;
          page1_value_dma3 <= 32'h0;
          page1_reloc_dma3 <= 32'h0;
          page1_valid_dma3 <= 1'b0;
          dmc_txc_dma3_page_handle <= 20'h0;
	  dmc_txc_dma3_func_num <= 2'h0;

       end // if (!Reset_L)
     else if (write_FZC_DMA3_Register )
       begin
          case ({Slave_Addr[8:3],(Slave_Addr[2] & pio_clients_32b ) ,2'h0}) // synopsys parallel_case
            `TXDMA_LOG_PAGE_VLD_DMA3:   {dmc_txc_dma3_func_num,page1_valid_dma3,page0_valid_dma3} <= Slave_DataIn[3:0];
            `TXDMA_LOG_PAGE_MASK0_DMA3:  page0_mask_dma3 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_VALUE0_DMA3: page0_value_dma3 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_MASK1_DMA3:  page1_mask_dma3 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_VALUE1_DMA3: page1_value_dma3 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_RELOC0_DMA3: page0_reloc_dma3 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_RELOC1_DMA3: page1_reloc_dma3 <= Slave_DataIn[31:0];
            `TXDMA_LOG_PAGE_HANDLE_DMA3: dmc_txc_dma3_page_handle <= Slave_DataIn[19:0];
          endcase
       end // if (write_FZC_DMA3_Register )



   always @ (posedge SysClk )
     if (!Reset_L) begin
	dma_0_3_sl_data_l <= 32'h0;
     end else begin
	case(read_DMA_0_3_Regsister) // synopsys parallel_case
	  8'b00000001: begin
	     case ({Slave_Addr[8:3],3'h0})// synopsys parallel_case
                 `TXDMA_RNG_CFIG_DMA0: dma_0_3_sl_data_l <= {tx_rng_cfg_dma0_staddr[25:0],6'h0};
                 `TXDMA_CS_DMA0:   begin
                    dma_0_3_sl_data_l<= { tx_dma_cfg_dma0_rst, tx_dma_cfg_dma0_stall, tx_cfg_dma0_enable_mb, tx_dma_cfg_dma0_stop,
                                          tx_dma_cfg_dma0_stop_state,11'h0, tx_cfg_dma0_mk, tx_cfg_dma0_mmk, 6'h0, tx_cs_dma0_err };
                 end // case: `TXDMA_CS_DMA0
               `TXDMA_RNG_HDL_DMA0:  dma_0_3_sl_data_l <= {12'h0,tx_rng_head_dma0[`PTR_WIDTH:0],3'h0};
               `TXDMA_RING_KICK_DMA0: dma_0_3_sl_data_l <= {12'h0,tx_rng_tail_dma0[`PTR_WIDTH:0],3'h0};
               `TXDMA_MBH_DMA0: dma_0_3_sl_data_l<= {20'h0,tx_dma_cfg_dma0_mbaddr[37:26]};
               `TXDMA_MBL_DMA0: dma_0_3_sl_data_l<= { tx_dma_cfg_dma0_mbaddr[25:0],6'h0};
               `TXDMA_ST_DMA0:  dma_0_3_sl_data_l <=tx_dma0_pre_st[31:0];
               `TXDMA_ENT_MASK_DMA0: dma_0_3_sl_data_l <= {16'h0,tx_ent_mask_ldf0_dma0,7'h0,tx_ent_mask_ldf1_dma0};
               `TXDMA_RNG_ERR_LOGH_DMA0: dma_0_3_sl_data_l <= tx_dma0_rng_err_logh[31:0];
               `TXDMA_RNG_ERR_LOGL_DMA0: dma_0_3_sl_data_l<= tx_dma0_rng_err_logl[31:0];
               `TXDMA_INTR_DBG_DMA0: dma_0_3_sl_data_l<= {16'h0,tx_cfg_dma0_mk,7'h0,tx_cs_dma0_err};
               default: begin
                  dma_0_3_sl_data_l <= 32'h0;
               end
             endcase
	  end
	  8'b00000010: begin
	     // LOW DECODE DMA 1
             case ({Slave_Addr[8:3],3'h0})// synopsys parallel_case
               `TXDMA_RNG_CFIG_DMA1: dma_0_3_sl_data_l <= {tx_rng_cfg_dma1_staddr[25:0],6'h0};
               `TXDMA_CS_DMA1:   begin
                  dma_0_3_sl_data_l<= { tx_dma_cfg_dma1_rst, tx_dma_cfg_dma1_stall, tx_cfg_dma1_enable_mb, tx_dma_cfg_dma1_stop,
                                        tx_dma_cfg_dma1_stop_state,11'h0, tx_cfg_dma1_mk, tx_cfg_dma1_mmk, 6'h0, tx_cs_dma1_err };
               end // case: `TXDMA_CS_DMA1
               `TXDMA_RNG_HDL_DMA1:  dma_0_3_sl_data_l <= {12'h0,tx_rng_head_dma1[`PTR_WIDTH:0],3'h0};
               `TXDMA_RING_KICK_DMA1: dma_0_3_sl_data_l <= {12'h0,tx_rng_tail_dma1[`PTR_WIDTH:0],3'h0};
               `TXDMA_MBH_DMA1: dma_0_3_sl_data_l<= {20'h0,tx_dma_cfg_dma1_mbaddr[37:26]};
               `TXDMA_MBL_DMA1: dma_0_3_sl_data_l<= { tx_dma_cfg_dma1_mbaddr[25:0],6'h0};
               `TXDMA_ST_DMA1:  dma_0_3_sl_data_l <=tx_dma1_pre_st[31:0];
               `TXDMA_ENT_MASK_DMA1: dma_0_3_sl_data_l <= {16'h0,tx_ent_mask_ldf0_dma1,7'h0,tx_ent_mask_ldf1_dma1};
               `TXDMA_RNG_ERR_LOGH_DMA1: dma_0_3_sl_data_l <= tx_dma1_rng_err_logh[31:0];
               `TXDMA_RNG_ERR_LOGL_DMA1: dma_0_3_sl_data_l<= tx_dma1_rng_err_logl[31:0];
               `TXDMA_INTR_DBG_DMA1: dma_0_3_sl_data_l<= {16'h0,tx_cfg_dma1_mk,7'h0,tx_cs_dma1_err};
               default: begin
                  dma_0_3_sl_data_l <= 32'h0;
               end
             endcase
	     
	  end
	  8'b00000100: begin
	     // LOW DECODE DMA 2
             case ({Slave_Addr[8:3],3'h0})// synopsys parallel_case
               `TXDMA_RNG_CFIG_DMA2: dma_0_3_sl_data_l <= {tx_rng_cfg_dma2_staddr[25:0],6'h0};
               `TXDMA_CS_DMA2:   begin
                  dma_0_3_sl_data_l<= { tx_dma_cfg_dma2_rst, tx_dma_cfg_dma2_stall, tx_cfg_dma2_enable_mb, tx_dma_cfg_dma2_stop,
                                        tx_dma_cfg_dma2_stop_state,11'h0, tx_cfg_dma2_mk, tx_cfg_dma2_mmk, 6'h0, tx_cs_dma2_err };
               end // case: `TXDMA_CS_DMA2
               `TXDMA_RNG_HDL_DMA2:  dma_0_3_sl_data_l <= {12'h0,tx_rng_head_dma2[`PTR_WIDTH:0],3'h0};
               `TXDMA_RING_KICK_DMA2: dma_0_3_sl_data_l <= {12'h0,tx_rng_tail_dma2[`PTR_WIDTH:0],3'h0};
               `TXDMA_MBH_DMA2: dma_0_3_sl_data_l<= {20'h0,tx_dma_cfg_dma2_mbaddr[37:26]};
               `TXDMA_MBL_DMA2: dma_0_3_sl_data_l<= { tx_dma_cfg_dma2_mbaddr[25:0],6'h0};
               `TXDMA_ST_DMA2:  dma_0_3_sl_data_l <=tx_dma2_pre_st[31:0];
               `TXDMA_ENT_MASK_DMA2: dma_0_3_sl_data_l <= {16'h0,tx_ent_mask_ldf0_dma2,7'h0,tx_ent_mask_ldf1_dma2};
               `TXDMA_RNG_ERR_LOGH_DMA2: dma_0_3_sl_data_l <= tx_dma2_rng_err_logh[31:0];
               `TXDMA_RNG_ERR_LOGL_DMA2: dma_0_3_sl_data_l<= tx_dma2_rng_err_logl[31:0];
               `TXDMA_INTR_DBG_DMA2: dma_0_3_sl_data_l<= {16'h0,tx_cfg_dma2_mk,7'h0,tx_cs_dma2_err};
               default: begin
                  dma_0_3_sl_data_l <= 32'h0;
               end
             endcase
	     
	  end
	  8'b00001000: begin
	     // LOW DECODE DMA 3
             case ({Slave_Addr[8:3],3'h0})// synopsys parallel_case
               `TXDMA_RNG_CFIG_DMA3: dma_0_3_sl_data_l <= {tx_rng_cfg_dma3_staddr[25:0],6'h0};
               `TXDMA_CS_DMA3:   begin
                  dma_0_3_sl_data_l<= { tx_dma_cfg_dma3_rst, tx_dma_cfg_dma3_stall, tx_cfg_dma3_enable_mb, tx_dma_cfg_dma3_stop,
                                        tx_dma_cfg_dma3_stop_state,11'h0, tx_cfg_dma3_mk, tx_cfg_dma3_mmk, 6'h0, tx_cs_dma3_err };
               end // case: `TXDMA_CS_DMA3
               `TXDMA_RNG_HDL_DMA3:  dma_0_3_sl_data_l <= {12'h0,tx_rng_head_dma3[`PTR_WIDTH:0],3'h0};
               `TXDMA_RING_KICK_DMA3: dma_0_3_sl_data_l <= {12'h0,tx_rng_tail_dma3[`PTR_WIDTH:0],3'h0};
               `TXDMA_MBH_DMA3: dma_0_3_sl_data_l<= {20'h0,tx_dma_cfg_dma3_mbaddr[37:26]};
               `TXDMA_MBL_DMA3: dma_0_3_sl_data_l<= { tx_dma_cfg_dma3_mbaddr[25:0],6'h0};
               `TXDMA_ST_DMA3:  dma_0_3_sl_data_l <=tx_dma3_pre_st[31:0];
               `TXDMA_ENT_MASK_DMA3: dma_0_3_sl_data_l <= {16'h0,tx_ent_mask_ldf0_dma3,7'h0,tx_ent_mask_ldf1_dma3};
               `TXDMA_RNG_ERR_LOGH_DMA3: dma_0_3_sl_data_l <= tx_dma3_rng_err_logh[31:0];
               `TXDMA_RNG_ERR_LOGL_DMA3: dma_0_3_sl_data_l<= tx_dma3_rng_err_logl[31:0];
               `TXDMA_INTR_DBG_DMA3: dma_0_3_sl_data_l<= {16'h0,tx_cfg_dma3_mk,7'h0,tx_cs_dma3_err};
               default: begin
                  dma_0_3_sl_data_l <= 32'h0;
               end
             endcase
	  end // case: 8'b00001000
	  default: begin
	     dma_0_3_sl_data_l <= 32'h0;
	  end
	endcase // case(read_DMA_0_3_Regsister)
     end // else: !if(!Reset_L)

   
   always @ (posedge SysClk )
     if (!Reset_L) begin
	dma_0_3_sl_data_h <= 32'h0;
	tx_cs_read_dma0_3 <= 4'h0;
     end else begin
	case(read_DMA_0_3_Regsister) // synopsys parallel_case
	  8'b00000001: begin
	     // HIGH DECODE DMA 0
               case ({Slave_Addr[8:3],3'h0})// synopsys parallel_case
                 `TXDMA_RNG_CFIG_DMA0: dma_0_3_sl_data_h <= {3'h0,tx_rng_cfg_dma0_len,4'h0,tx_rng_cfg_dma0_staddr[37:26]};
                 `TXDMA_CS_DMA0:   begin
                    dma_0_3_sl_data_h<= { 4'h0, tx_cs_pkt_cnt_dma0, 4'h0, tx_cs_lastmark_dma0};
                    tx_cs_read_dma0_3 <= 4'h1;
                 end // case: `TXDMA_CS_DMA0
                 `TXDMA_CS_DBG_DMA0: dma_0_3_sl_data_h <= { 4'h0, tx_cs_pkt_cnt_dma0,16'h0};
                 default: begin
                    dma_0_3_sl_data_h <= 32'h0;
                 end
               endcase
	  end
	  8'b00000010: begin
	     // HIGH DECODE DMA 1
               case ({Slave_Addr[8:3],3'h0})// synopsys parallel_case
                 `TXDMA_RNG_CFIG_DMA1: dma_0_3_sl_data_h <= {3'h0,tx_rng_cfg_dma1_len,4'h0,tx_rng_cfg_dma1_staddr[37:26]};
                 `TXDMA_CS_DMA1:   begin
                    dma_0_3_sl_data_h<= { 4'h0, tx_cs_pkt_cnt_dma1, 4'h0, tx_cs_lastmark_dma1};
                    tx_cs_read_dma0_3 <= 4'h2;
                 end // case: `TXDMA_CS_DMA1
                 `TXDMA_CS_DBG_DMA1: dma_0_3_sl_data_h <= { 4'h0, tx_cs_pkt_cnt_dma1,16'h0};
                 default: begin
                    dma_0_3_sl_data_h <= 32'h0;
                 end
               endcase
	  end
	  8'b00000100: begin
	     // HIGH DECODE DMA 2
               case ({Slave_Addr[8:3],3'h0})// synopsys parallel_case
                 `TXDMA_RNG_CFIG_DMA2: dma_0_3_sl_data_h <= {3'h0,tx_rng_cfg_dma2_len,4'h0,tx_rng_cfg_dma2_staddr[37:26]};
                 `TXDMA_CS_DMA2:   begin
                    dma_0_3_sl_data_h<= { 4'h0, tx_cs_pkt_cnt_dma2, 4'h0, tx_cs_lastmark_dma2};
                    tx_cs_read_dma0_3 <= 4'h4;
                 end // case: `TXDMA_CS_DMA2
                 `TXDMA_CS_DBG_DMA2: dma_0_3_sl_data_h <= { 4'h0, tx_cs_pkt_cnt_dma2,16'h0};
                 default: begin
                    dma_0_3_sl_data_h <= 32'h0;
                 end
               endcase
	  end
	  8'b00001000: begin
	     // HIGH DECODE DMA 3
               case ({Slave_Addr[8:3],3'h0})// synopsys parallel_case
                 `TXDMA_RNG_CFIG_DMA3: dma_0_3_sl_data_h <= {3'h0,tx_rng_cfg_dma3_len,4'h0,tx_rng_cfg_dma3_staddr[37:26]};
                 `TXDMA_CS_DMA3:   begin
                    dma_0_3_sl_data_h<= { 4'h0, tx_cs_pkt_cnt_dma3, 4'h0, tx_cs_lastmark_dma3};
                    tx_cs_read_dma0_3 <= 4'h8;
                 end // case: `TXDMA_CS_DMA3
                 `TXDMA_CS_DBG_DMA3: dma_0_3_sl_data_h <= { 4'h0, tx_cs_pkt_cnt_dma3,16'h0};
                 default: begin
                    dma_0_3_sl_data_h <= 32'h0;
                 end
               endcase
	  end // case: 8'b00001000
	  default: begin
	     dma_0_3_sl_data_h <= 32'h0;
	     tx_cs_read_dma0_3 <= 4'h0;
	  end
	endcase // case(read_DMA_0_3_Regsister)
     end // else: !if(!Reset_L)

   
   
   always @ (posedge SysClk )
     if (!Reset_L) begin
	dma_0_3_sl_data_fzc <= 32'h0;
        read_decode_invalid_dma0_3 <= 1'b0;
     end else begin
	case(read_DMA_0_3_Regsister) // synopsys parallel_case
	  8'b00010000: begin
	     case ({Slave_Addr[8:3],3'h0})// synopsys parallel_case
 	       `TXDMA_LOG_PAGE_VLD_DMA0:  dma_0_3_sl_data_fzc <=  {28'h0,dmc_txc_dma0_func_num,page1_valid_dma0,page0_valid_dma0} ;
	       `TXDMA_LOG_PAGE_MASK0_DMA0:  dma_0_3_sl_data_fzc <= {page0_mask_dma0 }; 
	       `TXDMA_LOG_PAGE_VALUE0_DMA0: dma_0_3_sl_data_fzc <= {page0_value_dma0 };
	       `TXDMA_LOG_PAGE_MASK1_DMA0:  dma_0_3_sl_data_fzc <= {page1_mask_dma0 };
	       `TXDMA_LOG_PAGE_VALUE1_DMA0: dma_0_3_sl_data_fzc <= {page1_value_dma0 };
	       `TXDMA_LOG_PAGE_RELOC0_DMA0: dma_0_3_sl_data_fzc <= {page0_reloc_dma0 };
	       `TXDMA_LOG_PAGE_RELOC1_DMA0: dma_0_3_sl_data_fzc <= {page1_reloc_dma0 };
	       `TXDMA_LOG_PAGE_HANDLE_DMA0: dma_0_3_sl_data_fzc <= {12'h0,dmc_txc_dma0_page_handle };
	       default: begin 
		  dma_0_3_sl_data_fzc <= 32'hdeadbeef;
		  read_decode_invalid_dma0_3 <= 1'b1;
	       end
	     endcase
	  end
	  8'b00100000: begin
	     case ({Slave_Addr[8:3],3'h0})// synopsys parallel_case
 	       `TXDMA_LOG_PAGE_VLD_DMA1:  dma_0_3_sl_data_fzc <=  {28'h0,dmc_txc_dma1_func_num,page1_valid_dma1,page0_valid_dma1} ;
	       `TXDMA_LOG_PAGE_MASK0_DMA1:  dma_0_3_sl_data_fzc <= {page0_mask_dma1 }; 
	       `TXDMA_LOG_PAGE_VALUE0_DMA1: dma_0_3_sl_data_fzc <= {page0_value_dma1 };
	       `TXDMA_LOG_PAGE_MASK1_DMA1:  dma_0_3_sl_data_fzc <= {page1_mask_dma1 };
	       `TXDMA_LOG_PAGE_VALUE1_DMA1: dma_0_3_sl_data_fzc <= {page1_value_dma1 };
	       `TXDMA_LOG_PAGE_RELOC0_DMA1: dma_0_3_sl_data_fzc <= {page0_reloc_dma1 };
	       `TXDMA_LOG_PAGE_RELOC1_DMA1: dma_0_3_sl_data_fzc <= {page1_reloc_dma1 };
	       `TXDMA_LOG_PAGE_HANDLE_DMA1: dma_0_3_sl_data_fzc <= {12'h0,dmc_txc_dma1_page_handle };
	       default: begin 
		  dma_0_3_sl_data_fzc <= 32'hdeadbeef;
		  read_decode_invalid_dma0_3 <= 1'b1;
	       end
	     endcase
	  end
	  8'b01000000: begin
	     case ({Slave_Addr[8:3],3'h0})// synopsys parallel_case
 	       `TXDMA_LOG_PAGE_VLD_DMA2:  dma_0_3_sl_data_fzc <=  {28'h0,dmc_txc_dma2_func_num,page1_valid_dma2,page0_valid_dma2} ;
	       `TXDMA_LOG_PAGE_MASK0_DMA2:  dma_0_3_sl_data_fzc <= {page0_mask_dma2 }; 
	       `TXDMA_LOG_PAGE_VALUE0_DMA2: dma_0_3_sl_data_fzc <= {page0_value_dma2 };
	       `TXDMA_LOG_PAGE_MASK1_DMA2:  dma_0_3_sl_data_fzc <= {page1_mask_dma2 };
	       `TXDMA_LOG_PAGE_VALUE1_DMA2: dma_0_3_sl_data_fzc <= {page1_value_dma2 };
	       `TXDMA_LOG_PAGE_RELOC0_DMA2: dma_0_3_sl_data_fzc <= {page0_reloc_dma2 };
	       `TXDMA_LOG_PAGE_RELOC1_DMA2: dma_0_3_sl_data_fzc <= {page1_reloc_dma2 };
	       `TXDMA_LOG_PAGE_HANDLE_DMA2: dma_0_3_sl_data_fzc <= {12'h0,dmc_txc_dma2_page_handle };
	       default: begin 
		  dma_0_3_sl_data_fzc <= 32'hdeadbeef;
		  read_decode_invalid_dma0_3 <= 1'b1;
	       end
	     endcase
	  end
	  8'b10000000: begin
	     case ({Slave_Addr[8:3],3'h0})// synopsys parallel_case
 	       `TXDMA_LOG_PAGE_VLD_DMA3:  dma_0_3_sl_data_fzc <=  {28'h0,dmc_txc_dma3_func_num,page1_valid_dma3,page0_valid_dma3} ;
	       `TXDMA_LOG_PAGE_MASK0_DMA3:  dma_0_3_sl_data_fzc <= {page0_mask_dma3 }; 
	       `TXDMA_LOG_PAGE_VALUE0_DMA3: dma_0_3_sl_data_fzc <= {page0_value_dma3 };
	       `TXDMA_LOG_PAGE_MASK1_DMA3:  dma_0_3_sl_data_fzc <= {page1_mask_dma3 };
	       `TXDMA_LOG_PAGE_VALUE1_DMA3: dma_0_3_sl_data_fzc <= {page1_value_dma3 };
	       `TXDMA_LOG_PAGE_RELOC0_DMA3: dma_0_3_sl_data_fzc <= {page0_reloc_dma3 };
	       `TXDMA_LOG_PAGE_RELOC1_DMA3: dma_0_3_sl_data_fzc <= {page1_reloc_dma3 };
	       `TXDMA_LOG_PAGE_HANDLE_DMA3: dma_0_3_sl_data_fzc <= {12'h0,dmc_txc_dma3_page_handle };
	       default: begin 
		  dma_0_3_sl_data_fzc <= 32'hdeadbeef;
		  read_decode_invalid_dma0_3 <= 1'b1;
	       end
	     endcase
	  end
	  default:begin 
	     read_decode_invalid_dma0_3 <= 1'b0;
	     dma_0_3_sl_data_fzc <= 32'hdeadbeef;
	  end // case: default
	endcase
     end 
   
   always@(dma_0_3_sl_data_h or dma_0_3_sl_data_l or dma_0_3_sl_data_fzc or read_DMA_0_3_Regsister ) begin
      if(| read_DMA_0_3_Regsister[3:0]) begin
	 dma_0_3_sl_data = {dma_0_3_sl_data_h,dma_0_3_sl_data_l};
      end else begin
	 dma_0_3_sl_data = {32'h0,dma_0_3_sl_data_fzc};
      end
   end
   
endmodule // niu_tdmc_dmaregs
