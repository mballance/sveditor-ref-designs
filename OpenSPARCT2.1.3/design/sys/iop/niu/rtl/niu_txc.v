// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc.v
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
 *  niu_txc.v
 *
 *  TXC Engine Core
 *
 *  Orignal Author     (s):   Rahoul Puri
 *  Modifier     (s):
 *  Project     (s):          Neptune
 *
 *  Copyright      (c) 2004   Sun Microsystems, Inc.
 *
 *  All Rights Reserved.
 *
 *  This verilog model is the confidential and proprietary property of
 *  Sun Microsystems, Inc., and the possession or use of this model
 *  requires a written license from Sun Microsystems, Inc.
 *
 **********************************************************************/

module niu_txc      (
        niu_clk,
        niu_reset_l,
        txc_debug_port,

`ifdef NEPTUNE
`else
        iol2clk,
        l2clk_2x,
        tcu_aclk,
        tcu_bclk,
        tcu_mbist_bisi_en,
        tcu_scan_en,
        tcu_se_scancollar_in,
        tcu_se_scancollar_out,
        tcu_array_wr_inhibit,
        tcu_mbist_user_mode,
        tcu_rtx_txc_txe0_mbist_start,
        rtx_txc_txe0_tcu_mbist_fail,
        rtx_txc_txe0_tcu_mbist_done,
        rtx_txc_txe0_mbist_scan_in,
        rtx_txc_txe0_mbist_scan_out,
        rtx_txc_txe0_dmo_dout,
        tcu_rtx_txc_txe1_mbist_start,
        rtx_txc_txe1_tcu_mbist_fail,
        rtx_txc_txe1_tcu_mbist_done,
        rtx_txc_txe1_mbist_scan_in,
        rtx_txc_txe1_mbist_scan_out,
        rtx_txc_txe1_dmo_dout,

        hdr_sram_wr_en_txc0_re,
        hdr_sram_red_clr_txc0_re,
        hdr_sram_wr_en_txc0_st,
        hdr_sram_red_clr_txc0_st,
        hdr_sram_rid_txc0_re,
        hdr_sram_rid_txc0_st,
        hdr_sram_rvalue_txc0_re,
        hdr_sram_rvalue_txc0_st,
        sram_hdr_read_data_txc0_re,
        sram_hdr_read_data_txc0_st,

        hdr_sram_wr_en_txc1_re,
        hdr_sram_red_clr_txc1_re,
        hdr_sram_wr_en_txc1_st,
        hdr_sram_red_clr_txc1_st,
        hdr_sram_rid_txc1_re,
        hdr_sram_rid_txc1_st,
        hdr_sram_rvalue_txc1_re,
        hdr_sram_rvalue_txc1_st,
        sram_hdr_read_data_txc1_re,
        sram_hdr_read_data_txc1_st,

`endif

`ifdef NEPTUNE
        pio_clients_32b,
`endif
        pio_clients_rd,         // Slave Read & Write Bar
        pio_txc_sel,            // Slave Sel
        pio_clients_addr,       // Slave Address
        pio_clients_wdata,      // Slave Write Data
        txc_pio_ack,            // Slave PIO Ack
        txc_pio_err,            // Slave PIO Error
        niu_txc_interrupts,     // TXC Interrupts
        txc_pio_rdata,          // Slave Read Data

        mac_txc_req0,
        txc_mac_ack0,
        txc_mac_tag0,
        txc_mac_abort0,
        txc_mac_stat0,
        txc_mac_data0,

        mac_txc_req1,
        txc_mac_ack1,
        txc_mac_tag1,
        txc_mac_abort1,
        txc_mac_stat1,
        txc_mac_data1,

`ifdef NEPTUNE
        mac_txc_req2,
        txc_mac_ack2,
        txc_mac_tag2,
        txc_mac_data2,

        mac_txc_req3,
        txc_mac_ack3,
        txc_mac_tag3,
        txc_mac_data3,
`endif
        txc_dmc_p0_pkt_size_err,
        txc_dmc_p0_dma_pkt_size_err,
        txc_dmc_p0_pkt_size_err_addr,

        txc_dmc_p1_pkt_size_err,
        txc_dmc_p1_dma_pkt_size_err,
        txc_dmc_p1_pkt_size_err_addr,

`ifdef NEPTUNE
        txc_dmc_p2_pkt_size_err,
        txc_dmc_p2_dma_pkt_size_err,
        txc_dmc_p2_pkt_size_err_addr,
        txc_dmc_p3_pkt_size_err,
        txc_dmc_p3_dma_pkt_size_err,
        txc_dmc_p3_pkt_size_err_addr,
`endif
        txc_dmc_nack_pkt_rd,
        txc_dmc_dma_nack_pkt_rd,
        txc_dmc_nack_pkt_rd_addr,

        dmc_txc_tx_addr_md,

        dmc_txc_dma0_active,
        dmc_txc_dma0_eoflist,
        dmc_txc_dma0_error,
        dmc_txc_dma0_gotnxtdesc,
        dmc_txc_dma0_cacheready,
        dmc_txc_dma0_partial,
        dmc_txc_dma0_reset_scheduled,
        dmc_txc_dma0_func_num,
        dmc_txc_dma0_page_handle,
        dmc_txc_dma0_descriptor,
        txc_dmc_dma0_getnxtdesc,
        txc_dmc_dma0_inc_head,
        txc_dmc_dma0_reset_done,
        txc_dmc_dma0_mark_bit,
        txc_dmc_dma0_inc_pkt_cnt,

        dmc_txc_dma1_active,
        dmc_txc_dma1_eoflist,
        dmc_txc_dma1_error,
        dmc_txc_dma1_gotnxtdesc,
        dmc_txc_dma1_cacheready,
        dmc_txc_dma1_partial,
        dmc_txc_dma1_reset_scheduled,
        dmc_txc_dma1_func_num,
        dmc_txc_dma1_page_handle,
        dmc_txc_dma1_descriptor,
        txc_dmc_dma1_getnxtdesc,
        txc_dmc_dma1_inc_head,
        txc_dmc_dma1_reset_done,
        txc_dmc_dma1_mark_bit,
        txc_dmc_dma1_inc_pkt_cnt,

        dmc_txc_dma2_active,
        dmc_txc_dma2_eoflist,
        dmc_txc_dma2_error,
        dmc_txc_dma2_gotnxtdesc,
        dmc_txc_dma2_cacheready,
        dmc_txc_dma2_partial,
        dmc_txc_dma2_reset_scheduled,
        dmc_txc_dma2_func_num,
        dmc_txc_dma2_page_handle,
        dmc_txc_dma2_descriptor,
        txc_dmc_dma2_getnxtdesc,
        txc_dmc_dma2_inc_head,
        txc_dmc_dma2_reset_done,
        txc_dmc_dma2_mark_bit,
        txc_dmc_dma2_inc_pkt_cnt,

        dmc_txc_dma3_active,
        dmc_txc_dma3_eoflist,
        dmc_txc_dma3_error,
        dmc_txc_dma3_gotnxtdesc,
        dmc_txc_dma3_cacheready,
        dmc_txc_dma3_partial,
        dmc_txc_dma3_reset_scheduled,
        dmc_txc_dma3_func_num,
        dmc_txc_dma3_page_handle,
        dmc_txc_dma3_descriptor,
        txc_dmc_dma3_getnxtdesc,
        txc_dmc_dma3_inc_head,
        txc_dmc_dma3_reset_done,
        txc_dmc_dma3_mark_bit,
        txc_dmc_dma3_inc_pkt_cnt,

        dmc_txc_dma4_active,
        dmc_txc_dma4_eoflist,
        dmc_txc_dma4_error,
        dmc_txc_dma4_gotnxtdesc,
        dmc_txc_dma4_cacheready,
        dmc_txc_dma4_partial,
        dmc_txc_dma4_reset_scheduled,
        dmc_txc_dma4_func_num,
        dmc_txc_dma4_page_handle,
        dmc_txc_dma4_descriptor,
        txc_dmc_dma4_getnxtdesc,
        txc_dmc_dma4_inc_head,
        txc_dmc_dma4_reset_done,
        txc_dmc_dma4_mark_bit,
        txc_dmc_dma4_inc_pkt_cnt,

        dmc_txc_dma5_active,
        dmc_txc_dma5_eoflist,
        dmc_txc_dma5_error,
        dmc_txc_dma5_gotnxtdesc,
        dmc_txc_dma5_cacheready,
        dmc_txc_dma5_partial,
        dmc_txc_dma5_reset_scheduled,
        dmc_txc_dma5_func_num,
        dmc_txc_dma5_page_handle,
        dmc_txc_dma5_descriptor,
        txc_dmc_dma5_getnxtdesc,
        txc_dmc_dma5_inc_head,
        txc_dmc_dma5_reset_done,
        txc_dmc_dma5_mark_bit,
        txc_dmc_dma5_inc_pkt_cnt,

        dmc_txc_dma6_active,
        dmc_txc_dma6_eoflist,
        dmc_txc_dma6_error,
        dmc_txc_dma6_gotnxtdesc,
        dmc_txc_dma6_cacheready,
        dmc_txc_dma6_partial,
        dmc_txc_dma6_reset_scheduled,
        dmc_txc_dma6_func_num,
        dmc_txc_dma6_page_handle,
        dmc_txc_dma6_descriptor,
        txc_dmc_dma6_getnxtdesc,
        txc_dmc_dma6_inc_head,
        txc_dmc_dma6_reset_done,
        txc_dmc_dma6_mark_bit,
        txc_dmc_dma6_inc_pkt_cnt,

        dmc_txc_dma7_active,
        dmc_txc_dma7_eoflist,
        dmc_txc_dma7_error,
        dmc_txc_dma7_gotnxtdesc,
        dmc_txc_dma7_cacheready,
        dmc_txc_dma7_partial,
        dmc_txc_dma7_reset_scheduled,
        dmc_txc_dma7_func_num,
        dmc_txc_dma7_page_handle,
        dmc_txc_dma7_descriptor,
        txc_dmc_dma7_getnxtdesc,
        txc_dmc_dma7_inc_head,
        txc_dmc_dma7_reset_done,
        txc_dmc_dma7_mark_bit,
        txc_dmc_dma7_inc_pkt_cnt,

        dmc_txc_dma8_active,
        dmc_txc_dma8_eoflist,
        dmc_txc_dma8_error,
        dmc_txc_dma8_gotnxtdesc,
        dmc_txc_dma8_cacheready,
        dmc_txc_dma8_partial,
        dmc_txc_dma8_reset_scheduled,
        dmc_txc_dma8_func_num,
        dmc_txc_dma8_page_handle,
        dmc_txc_dma8_descriptor,
        txc_dmc_dma8_getnxtdesc,
        txc_dmc_dma8_inc_head,
        txc_dmc_dma8_reset_done,
        txc_dmc_dma8_mark_bit,
        txc_dmc_dma8_inc_pkt_cnt,

        dmc_txc_dma9_active,
        dmc_txc_dma9_eoflist,
        dmc_txc_dma9_error,
        dmc_txc_dma9_gotnxtdesc,
        dmc_txc_dma9_cacheready,
        dmc_txc_dma9_partial,
        dmc_txc_dma9_reset_scheduled,
        dmc_txc_dma9_func_num,
        dmc_txc_dma9_page_handle,
        dmc_txc_dma9_descriptor,
        txc_dmc_dma9_getnxtdesc,
        txc_dmc_dma9_inc_head,
        txc_dmc_dma9_reset_done,
        txc_dmc_dma9_mark_bit,
        txc_dmc_dma9_inc_pkt_cnt,

        dmc_txc_dma10_active,
        dmc_txc_dma10_eoflist,
        dmc_txc_dma10_error,
        dmc_txc_dma10_gotnxtdesc,
        dmc_txc_dma10_cacheready,
        dmc_txc_dma10_partial,
        dmc_txc_dma10_reset_scheduled,
        dmc_txc_dma10_func_num,
        dmc_txc_dma10_page_handle,
        dmc_txc_dma10_descriptor,
        txc_dmc_dma10_getnxtdesc,
        txc_dmc_dma10_inc_head,
        txc_dmc_dma10_reset_done,
        txc_dmc_dma10_mark_bit,
        txc_dmc_dma10_inc_pkt_cnt,

        dmc_txc_dma11_active,
        dmc_txc_dma11_eoflist,
        dmc_txc_dma11_error,
        dmc_txc_dma11_gotnxtdesc,
        dmc_txc_dma11_cacheready,
        dmc_txc_dma11_partial,
        dmc_txc_dma11_reset_scheduled,
        dmc_txc_dma11_func_num,
        dmc_txc_dma11_page_handle,
        dmc_txc_dma11_descriptor,
        txc_dmc_dma11_getnxtdesc,
        txc_dmc_dma11_inc_head,
        txc_dmc_dma11_reset_done,
        txc_dmc_dma11_mark_bit,
        txc_dmc_dma11_inc_pkt_cnt,

        dmc_txc_dma12_active,
        dmc_txc_dma12_eoflist,
        dmc_txc_dma12_error,
        dmc_txc_dma12_gotnxtdesc,
        dmc_txc_dma12_cacheready,
        dmc_txc_dma12_partial,
        dmc_txc_dma12_reset_scheduled,
        dmc_txc_dma12_func_num,
        dmc_txc_dma12_page_handle,
        dmc_txc_dma12_descriptor,
        txc_dmc_dma12_getnxtdesc,
        txc_dmc_dma12_inc_head,
        txc_dmc_dma12_reset_done,
        txc_dmc_dma12_mark_bit,
        txc_dmc_dma12_inc_pkt_cnt,

        dmc_txc_dma13_active,
        dmc_txc_dma13_eoflist,
        dmc_txc_dma13_error,
        dmc_txc_dma13_gotnxtdesc,
        dmc_txc_dma13_cacheready,
        dmc_txc_dma13_partial,
        dmc_txc_dma13_reset_scheduled,
        dmc_txc_dma13_func_num,
        dmc_txc_dma13_page_handle,
        dmc_txc_dma13_descriptor,
        txc_dmc_dma13_getnxtdesc,
        txc_dmc_dma13_inc_head,
        txc_dmc_dma13_reset_done,
        txc_dmc_dma13_mark_bit,
        txc_dmc_dma13_inc_pkt_cnt,

        dmc_txc_dma14_active,
        dmc_txc_dma14_eoflist,
        dmc_txc_dma14_error,
        dmc_txc_dma14_gotnxtdesc,
        dmc_txc_dma14_cacheready,
        dmc_txc_dma14_partial,
        dmc_txc_dma14_reset_scheduled,
        dmc_txc_dma14_func_num,
        dmc_txc_dma14_page_handle,
        dmc_txc_dma14_descriptor,
        txc_dmc_dma14_getnxtdesc,
        txc_dmc_dma14_inc_head,
        txc_dmc_dma14_reset_done,
        txc_dmc_dma14_mark_bit,
        txc_dmc_dma14_inc_pkt_cnt,

        dmc_txc_dma15_active,
        dmc_txc_dma15_eoflist,
        dmc_txc_dma15_error,
        dmc_txc_dma15_gotnxtdesc,
        dmc_txc_dma15_cacheready,
        dmc_txc_dma15_partial,
        dmc_txc_dma15_reset_scheduled,
        dmc_txc_dma15_func_num,
        dmc_txc_dma15_page_handle,
        dmc_txc_dma15_descriptor,
        txc_dmc_dma15_getnxtdesc,
        txc_dmc_dma15_inc_head,
        txc_dmc_dma15_reset_done,
        txc_dmc_dma15_mark_bit,
        txc_dmc_dma15_inc_pkt_cnt,

`ifdef NEPTUNE
        dmc_txc_dma16_active,
        dmc_txc_dma16_eoflist,
        dmc_txc_dma16_error,
        dmc_txc_dma16_gotnxtdesc,
        dmc_txc_dma16_cacheready,
        dmc_txc_dma16_partial,
        dmc_txc_dma16_reset_scheduled,
        dmc_txc_dma16_func_num,
        dmc_txc_dma16_page_handle,
        dmc_txc_dma16_descriptor,
        txc_dmc_dma16_getnxtdesc,
        txc_dmc_dma16_inc_head,
        txc_dmc_dma16_reset_done,
        txc_dmc_dma16_mark_bit,
        txc_dmc_dma16_inc_pkt_cnt,

        dmc_txc_dma17_active,
        dmc_txc_dma17_eoflist,
        dmc_txc_dma17_error,
        dmc_txc_dma17_gotnxtdesc,
        dmc_txc_dma17_cacheready,
        dmc_txc_dma17_partial,
        dmc_txc_dma17_reset_scheduled,
        dmc_txc_dma17_func_num,
        dmc_txc_dma17_page_handle,
        dmc_txc_dma17_descriptor,
        txc_dmc_dma17_getnxtdesc,
        txc_dmc_dma17_inc_head,
        txc_dmc_dma17_reset_done,
        txc_dmc_dma17_mark_bit,
        txc_dmc_dma17_inc_pkt_cnt,

        dmc_txc_dma18_active,
        dmc_txc_dma18_eoflist,
        dmc_txc_dma18_error,
        dmc_txc_dma18_gotnxtdesc,
        dmc_txc_dma18_cacheready,
        dmc_txc_dma18_partial,
        dmc_txc_dma18_reset_scheduled,
        dmc_txc_dma18_func_num,
        dmc_txc_dma18_page_handle,
        dmc_txc_dma18_descriptor,
        txc_dmc_dma18_getnxtdesc,
        txc_dmc_dma18_inc_head,
        txc_dmc_dma18_reset_done,
        txc_dmc_dma18_mark_bit,
        txc_dmc_dma18_inc_pkt_cnt,

        dmc_txc_dma19_active,
        dmc_txc_dma19_eoflist,
        dmc_txc_dma19_error,
        dmc_txc_dma19_gotnxtdesc,
        dmc_txc_dma19_cacheready,
        dmc_txc_dma19_partial,
        dmc_txc_dma19_reset_scheduled,
        dmc_txc_dma19_func_num,
        dmc_txc_dma19_page_handle,
        dmc_txc_dma19_descriptor,
        txc_dmc_dma19_getnxtdesc,
        txc_dmc_dma19_inc_head,
        txc_dmc_dma19_reset_done,
        txc_dmc_dma19_mark_bit,
        txc_dmc_dma19_inc_pkt_cnt,

        dmc_txc_dma20_active,
        dmc_txc_dma20_eoflist,
        dmc_txc_dma20_error,
        dmc_txc_dma20_gotnxtdesc,
        dmc_txc_dma20_cacheready,
        dmc_txc_dma20_partial,
        dmc_txc_dma20_reset_scheduled,
        dmc_txc_dma20_func_num,
        dmc_txc_dma20_page_handle,
        dmc_txc_dma20_descriptor,
        txc_dmc_dma20_getnxtdesc,
        txc_dmc_dma20_inc_head,
        txc_dmc_dma20_reset_done,
        txc_dmc_dma20_mark_bit,
        txc_dmc_dma20_inc_pkt_cnt,

        dmc_txc_dma21_active,
        dmc_txc_dma21_eoflist,
        dmc_txc_dma21_error,
        dmc_txc_dma21_gotnxtdesc,
        dmc_txc_dma21_cacheready,
        dmc_txc_dma21_partial,
        dmc_txc_dma21_reset_scheduled,
        dmc_txc_dma21_func_num,
        dmc_txc_dma21_page_handle,
        dmc_txc_dma21_descriptor,
        txc_dmc_dma21_getnxtdesc,
        txc_dmc_dma21_inc_head,
        txc_dmc_dma21_reset_done,
        txc_dmc_dma21_mark_bit,
        txc_dmc_dma21_inc_pkt_cnt,

        dmc_txc_dma22_active,
        dmc_txc_dma22_eoflist,
        dmc_txc_dma22_error,
        dmc_txc_dma22_gotnxtdesc,
        dmc_txc_dma22_cacheready,
        dmc_txc_dma22_partial,
        dmc_txc_dma22_reset_scheduled,
        dmc_txc_dma22_func_num,
        dmc_txc_dma22_page_handle,
        dmc_txc_dma22_descriptor,
        txc_dmc_dma22_getnxtdesc,
        txc_dmc_dma22_inc_head,
        txc_dmc_dma22_reset_done,
        txc_dmc_dma22_mark_bit,
        txc_dmc_dma22_inc_pkt_cnt,

        dmc_txc_dma23_active,
        dmc_txc_dma23_eoflist,
        dmc_txc_dma23_error,
        dmc_txc_dma23_gotnxtdesc,
        dmc_txc_dma23_cacheready,
        dmc_txc_dma23_partial,
        dmc_txc_dma23_reset_scheduled,
        dmc_txc_dma23_func_num,
        dmc_txc_dma23_page_handle,
        dmc_txc_dma23_descriptor,
        txc_dmc_dma23_getnxtdesc,
        txc_dmc_dma23_inc_head,
        txc_dmc_dma23_reset_done,
        txc_dmc_dma23_mark_bit,
        txc_dmc_dma23_inc_pkt_cnt,
`endif

        arb1_txc_req_accept,
        arb1_txc_req_transid,
        txc_arb1_req,
        txc_arb1_req_func_num,
        txc_arb1_req_port_num,
        txc_arb1_req_dma_num,
        txc_arb1_req_cmd,
        txc_arb1_req_length,
        txc_arb1_req_address,

        meta_dmc_resp_ready,
        meta_dmc_resp_complete,
        meta_dmc_resp_transfer_cmpl,
        meta_dmc_data_valid,
        meta_dmc_resp_client,
        meta_dmc_resp_port_num,
        meta_dmc_resp_cmd_status,
        meta_dmc_resp_data_status,
        meta_dmc_resp_dma_num,
        meta_dmc_resp_transID,
        meta_dmc_resp_cmd,
        meta_dmc_resp_byteenable,
        meta_dmc_resp_length,
        meta_dmc_resp_address,
        meta_dmc_data,
        dmc_meta_resp_accept
       );
    
`include "txc_defines.h"

// Global Signals
input          niu_clk;
input          niu_reset_l;

// L2Clk, SRAM and Membist N2 Signals
`ifdef NEPTUNE
`else
input          iol2clk;
input          l2clk_2x;
input          tcu_aclk;
input          tcu_bclk;
input          tcu_mbist_bisi_en;
input          tcu_scan_en;
input          tcu_se_scancollar_in;
input          tcu_se_scancollar_out;
input          tcu_array_wr_inhibit;
input          tcu_mbist_user_mode;

input          tcu_rtx_txc_txe0_mbist_start;
input          rtx_txc_txe0_mbist_scan_in;

output         rtx_txc_txe0_tcu_mbist_fail;
output         rtx_txc_txe0_tcu_mbist_done;
output         rtx_txc_txe0_mbist_scan_out;
output [39:0]  rtx_txc_txe0_dmo_dout;

wire           rtx_txc_txe0_mb1_run;
wire           rtx_txc_txe0_mb1_xmit_store_rd_en;
wire           rtx_txc_txe0_mb1_xmit_store_wr_en;
wire           rtx_txc_txe0_mb1_xmit_realign_rd_en;
wire           rtx_txc_txe0_mb1_xmit_realign_wr_en;
wire   [7:0]   rtx_txc_txe0_mb1_wdata;
wire   [9:0]   rtx_txc_txe0_mb1_addr;

input          tcu_rtx_txc_txe1_mbist_start;
input          rtx_txc_txe1_mbist_scan_in;

output         rtx_txc_txe1_tcu_mbist_fail;
output         rtx_txc_txe1_tcu_mbist_done;
output         rtx_txc_txe1_mbist_scan_out;
output [39:0]  rtx_txc_txe1_dmo_dout;

wire           rtx_txc_txe1_mb1_run;
wire           rtx_txc_txe1_mb1_xmit_store_rd_en;
wire           rtx_txc_txe1_mb1_xmit_store_wr_en;
wire           rtx_txc_txe1_mb1_xmit_realign_rd_en;
wire           rtx_txc_txe1_mb1_xmit_realign_wr_en;
wire   [7:0]   rtx_txc_txe1_mb1_wdata;
wire   [9:0]   rtx_txc_txe1_mb1_addr;

input          hdr_sram_wr_en_txc0_re;
input          hdr_sram_red_clr_txc0_re;
input          hdr_sram_wr_en_txc0_st;
input          hdr_sram_red_clr_txc0_st;
input  [2:0]   hdr_sram_rid_txc0_re;
input  [2:0]   hdr_sram_rid_txc0_st;
input  [6:0]   hdr_sram_rvalue_txc0_re;
input  [6:0]   hdr_sram_rvalue_txc0_st;

output [6:0]   sram_hdr_read_data_txc0_re;
output [6:0]   sram_hdr_read_data_txc0_st;

input          hdr_sram_wr_en_txc1_re;
input          hdr_sram_red_clr_txc1_re;
input          hdr_sram_wr_en_txc1_st;
input          hdr_sram_red_clr_txc1_st;
input  [2:0]   hdr_sram_rid_txc1_re;
input  [2:0]   hdr_sram_rid_txc1_st;
input  [6:0]   hdr_sram_rvalue_txc1_re;
input  [6:0]   hdr_sram_rvalue_txc1_st;

output [6:0]   sram_hdr_read_data_txc1_re;
output [6:0]   sram_hdr_read_data_txc1_st;

`endif

// Debug Interface
output [31:0]  txc_debug_port;

// Slave Interface
`ifdef NEPTUNE
input          pio_clients_32b;
`endif
input          pio_clients_rd;
input          pio_txc_sel;
input  [19:0]  pio_clients_addr;
input  [31:0]  pio_clients_wdata;

output         txc_pio_ack;
output         txc_pio_err;
output         niu_txc_interrupts;
output [63:0]  txc_pio_rdata;

// MAC Port Zero Interface
input          mac_txc_req0;

output         txc_mac_ack0;
output         txc_mac_tag0;
output         txc_mac_abort0;
output [3:0]   txc_mac_stat0;
output [63:0]  txc_mac_data0;

// MAC Port One Interface
input          mac_txc_req1;

output         txc_mac_ack1;
output         txc_mac_tag1;
output         txc_mac_abort1;
output [3:0]   txc_mac_stat1;
output [63:0]  txc_mac_data1;

`ifdef NEPTUNE
// MAC Port Two Interface
input          mac_txc_req2;

output         txc_mac_ack2;
output         txc_mac_tag2;
output [63:0]  txc_mac_data2;

// MAC Port Three Interface
input          mac_txc_req3;

output         txc_mac_ack3;
output [63:0]  txc_mac_data3;
output         txc_mac_tag3;
`endif

// TXC- TDMC -Error Interface
output         txc_dmc_p0_pkt_size_err;
output [43:0]  txc_dmc_p0_pkt_size_err_addr;

output         txc_dmc_p1_pkt_size_err;
output [43:0]  txc_dmc_p1_pkt_size_err_addr;

output         txc_dmc_nack_pkt_rd;
output [43:0]  txc_dmc_nack_pkt_rd_addr;

`ifdef NEPTUNE
output [23:0]  txc_dmc_p0_dma_pkt_size_err;
output [23:0]  txc_dmc_p1_dma_pkt_size_err;

output         txc_dmc_p2_pkt_size_err;
output [23:0]  txc_dmc_p2_dma_pkt_size_err;
output [43:0]  txc_dmc_p2_pkt_size_err_addr;

output         txc_dmc_p3_pkt_size_err;
output [23:0]  txc_dmc_p3_dma_pkt_size_err;
output [43:0]  txc_dmc_p3_pkt_size_err_addr;

output [23:0]  txc_dmc_dma_nack_pkt_rd; 

`else
output [15:0]  txc_dmc_p0_dma_pkt_size_err;
output [15:0]  txc_dmc_p1_dma_pkt_size_err;
output [15:0]  txc_dmc_dma_nack_pkt_rd; 

wire   [7:0]   dummy_txc_dmc_p0_dma_pkt_size_err;
wire   [7:0]   dummy_txc_dmc_p1_dma_pkt_size_err;
wire   [7:0]   dummy_txc_dmc_dma_nack_pkt_rd; 
`endif

// Tx DMA Cache
input         dmc_txc_tx_addr_md;

// DMA0 
input         dmc_txc_dma0_active;
input         dmc_txc_dma0_eoflist;
input         dmc_txc_dma0_error;
input         dmc_txc_dma0_gotnxtdesc;
input         dmc_txc_dma0_cacheready;
input         dmc_txc_dma0_partial;
input         dmc_txc_dma0_reset_scheduled;
input [1:0]   dmc_txc_dma0_func_num;
input [19:0]  dmc_txc_dma0_page_handle;
input [63:0]  dmc_txc_dma0_descriptor;

output        txc_dmc_dma0_getnxtdesc;
output        txc_dmc_dma0_inc_head;
output        txc_dmc_dma0_reset_done;
output        txc_dmc_dma0_mark_bit;
output        txc_dmc_dma0_inc_pkt_cnt;

// DMA1 
input         dmc_txc_dma1_active;
input         dmc_txc_dma1_eoflist;
input         dmc_txc_dma1_error;
input         dmc_txc_dma1_gotnxtdesc;
input         dmc_txc_dma1_cacheready;
input         dmc_txc_dma1_partial;
input         dmc_txc_dma1_reset_scheduled;
input [1:0]   dmc_txc_dma1_func_num;
input [19:0]  dmc_txc_dma1_page_handle;
input [63:0]  dmc_txc_dma1_descriptor;

output        txc_dmc_dma1_getnxtdesc;
output        txc_dmc_dma1_inc_head;
output        txc_dmc_dma1_reset_done;
output        txc_dmc_dma1_mark_bit;
output        txc_dmc_dma1_inc_pkt_cnt;

// DMA2 
input         dmc_txc_dma2_active;
input         dmc_txc_dma2_eoflist;
input         dmc_txc_dma2_error;
input         dmc_txc_dma2_gotnxtdesc;
input         dmc_txc_dma2_cacheready;
input         dmc_txc_dma2_partial;
input         dmc_txc_dma2_reset_scheduled;
input [1:0]   dmc_txc_dma2_func_num;
input [19:0]  dmc_txc_dma2_page_handle;
input [63:0]  dmc_txc_dma2_descriptor;

output        txc_dmc_dma2_getnxtdesc;
output        txc_dmc_dma2_inc_head;
output        txc_dmc_dma2_reset_done;
output        txc_dmc_dma2_mark_bit;
output        txc_dmc_dma2_inc_pkt_cnt;

// DMA3 
input         dmc_txc_dma3_active;
input         dmc_txc_dma3_eoflist;
input         dmc_txc_dma3_error;
input         dmc_txc_dma3_gotnxtdesc;
input         dmc_txc_dma3_cacheready;
input         dmc_txc_dma3_partial;
input         dmc_txc_dma3_reset_scheduled;
input [1:0]   dmc_txc_dma3_func_num;
input [19:0]  dmc_txc_dma3_page_handle;
input [63:0]  dmc_txc_dma3_descriptor;

output        txc_dmc_dma3_getnxtdesc;
output        txc_dmc_dma3_inc_head;
output        txc_dmc_dma3_reset_done;
output        txc_dmc_dma3_mark_bit;
output        txc_dmc_dma3_inc_pkt_cnt;

// DMA4 
input         dmc_txc_dma4_active;
input         dmc_txc_dma4_eoflist;
input         dmc_txc_dma4_error;
input         dmc_txc_dma4_gotnxtdesc;
input         dmc_txc_dma4_cacheready;
input         dmc_txc_dma4_partial;
input         dmc_txc_dma4_reset_scheduled;
input [1:0]   dmc_txc_dma4_func_num;
input [19:0]  dmc_txc_dma4_page_handle;
input [63:0]  dmc_txc_dma4_descriptor;

output        txc_dmc_dma4_getnxtdesc;
output        txc_dmc_dma4_inc_head;
output        txc_dmc_dma4_reset_done;
output        txc_dmc_dma4_mark_bit;
output        txc_dmc_dma4_inc_pkt_cnt;

// DMA5 
input         dmc_txc_dma5_active;
input         dmc_txc_dma5_eoflist;
input         dmc_txc_dma5_error;
input         dmc_txc_dma5_gotnxtdesc;
input         dmc_txc_dma5_cacheready;
input         dmc_txc_dma5_partial;
input         dmc_txc_dma5_reset_scheduled;
input [1:0]   dmc_txc_dma5_func_num;
input [19:0]  dmc_txc_dma5_page_handle;
input [63:0]  dmc_txc_dma5_descriptor;

output        txc_dmc_dma5_getnxtdesc;
output        txc_dmc_dma5_inc_head;
output        txc_dmc_dma5_reset_done;
output        txc_dmc_dma5_mark_bit;
output        txc_dmc_dma5_inc_pkt_cnt;

// DMA6 
input         dmc_txc_dma6_active;
input         dmc_txc_dma6_eoflist;
input         dmc_txc_dma6_error;
input         dmc_txc_dma6_gotnxtdesc;
input         dmc_txc_dma6_cacheready;
input         dmc_txc_dma6_partial;
input         dmc_txc_dma6_reset_scheduled;
input [1:0]   dmc_txc_dma6_func_num;
input [19:0]  dmc_txc_dma6_page_handle;
input [63:0]  dmc_txc_dma6_descriptor;

output        txc_dmc_dma6_getnxtdesc;
output        txc_dmc_dma6_inc_head;
output        txc_dmc_dma6_reset_done;
output        txc_dmc_dma6_mark_bit;
output        txc_dmc_dma6_inc_pkt_cnt;

// DMA7 
input         dmc_txc_dma7_active;
input         dmc_txc_dma7_eoflist;
input         dmc_txc_dma7_error;
input         dmc_txc_dma7_gotnxtdesc;
input         dmc_txc_dma7_cacheready;
input         dmc_txc_dma7_partial;
input         dmc_txc_dma7_reset_scheduled;
input [1:0]   dmc_txc_dma7_func_num;
input [19:0]  dmc_txc_dma7_page_handle;
input [63:0]  dmc_txc_dma7_descriptor;

output        txc_dmc_dma7_getnxtdesc;
output        txc_dmc_dma7_inc_head;
output        txc_dmc_dma7_reset_done;
output        txc_dmc_dma7_mark_bit;
output        txc_dmc_dma7_inc_pkt_cnt;

// DMA8 
input         dmc_txc_dma8_active;
input         dmc_txc_dma8_eoflist;
input         dmc_txc_dma8_error;
input         dmc_txc_dma8_gotnxtdesc;
input         dmc_txc_dma8_cacheready;
input         dmc_txc_dma8_partial;
input         dmc_txc_dma8_reset_scheduled;
input [1:0]   dmc_txc_dma8_func_num;
input [19:0]  dmc_txc_dma8_page_handle;
input [63:0]  dmc_txc_dma8_descriptor;

output        txc_dmc_dma8_getnxtdesc;
output        txc_dmc_dma8_inc_head;
output        txc_dmc_dma8_reset_done;
output        txc_dmc_dma8_mark_bit;
output        txc_dmc_dma8_inc_pkt_cnt;

// DMA9 
input         dmc_txc_dma9_active;
input         dmc_txc_dma9_eoflist;
input         dmc_txc_dma9_error;
input         dmc_txc_dma9_gotnxtdesc;
input         dmc_txc_dma9_cacheready;
input         dmc_txc_dma9_partial;
input         dmc_txc_dma9_reset_scheduled;
input [1:0]   dmc_txc_dma9_func_num;
input [19:0]  dmc_txc_dma9_page_handle;
input [63:0]  dmc_txc_dma9_descriptor;

output        txc_dmc_dma9_getnxtdesc;
output        txc_dmc_dma9_inc_head;
output        txc_dmc_dma9_reset_done;
output        txc_dmc_dma9_mark_bit;
output        txc_dmc_dma9_inc_pkt_cnt;

// DMA10 
input         dmc_txc_dma10_active;
input         dmc_txc_dma10_eoflist;
input         dmc_txc_dma10_error;
input         dmc_txc_dma10_gotnxtdesc;
input         dmc_txc_dma10_cacheready;
input         dmc_txc_dma10_partial;
input         dmc_txc_dma10_reset_scheduled;
input [1:0]   dmc_txc_dma10_func_num;
input [19:0]  dmc_txc_dma10_page_handle;
input [63:0]  dmc_txc_dma10_descriptor;

output        txc_dmc_dma10_getnxtdesc;
output        txc_dmc_dma10_inc_head;
output        txc_dmc_dma10_reset_done;
output        txc_dmc_dma10_mark_bit;
output        txc_dmc_dma10_inc_pkt_cnt;

// DMA11 
input         dmc_txc_dma11_active;
input         dmc_txc_dma11_eoflist;
input         dmc_txc_dma11_error;
input         dmc_txc_dma11_gotnxtdesc;
input         dmc_txc_dma11_cacheready;
input         dmc_txc_dma11_partial;
input         dmc_txc_dma11_reset_scheduled;
input [1:0]   dmc_txc_dma11_func_num;
input [19:0]  dmc_txc_dma11_page_handle;
input [63:0]  dmc_txc_dma11_descriptor;

output        txc_dmc_dma11_getnxtdesc;
output        txc_dmc_dma11_inc_head;
output        txc_dmc_dma11_reset_done;
output        txc_dmc_dma11_mark_bit;
output        txc_dmc_dma11_inc_pkt_cnt;

// DMA12 
input         dmc_txc_dma12_active;
input         dmc_txc_dma12_eoflist;
input         dmc_txc_dma12_error;
input         dmc_txc_dma12_gotnxtdesc;
input         dmc_txc_dma12_cacheready;
input         dmc_txc_dma12_partial;
input         dmc_txc_dma12_reset_scheduled;
input [1:0]   dmc_txc_dma12_func_num;
input [19:0]  dmc_txc_dma12_page_handle;
input [63:0]  dmc_txc_dma12_descriptor;

output        txc_dmc_dma12_getnxtdesc;
output        txc_dmc_dma12_inc_head;
output        txc_dmc_dma12_reset_done;
output        txc_dmc_dma12_mark_bit;
output        txc_dmc_dma12_inc_pkt_cnt;

// DMA13 
input         dmc_txc_dma13_active;
input         dmc_txc_dma13_eoflist;
input         dmc_txc_dma13_error;
input         dmc_txc_dma13_gotnxtdesc;
input         dmc_txc_dma13_cacheready;
input         dmc_txc_dma13_partial;
input         dmc_txc_dma13_reset_scheduled;
input [1:0]   dmc_txc_dma13_func_num;
input [19:0]  dmc_txc_dma13_page_handle;
input [63:0]  dmc_txc_dma13_descriptor;

output        txc_dmc_dma13_getnxtdesc;
output        txc_dmc_dma13_inc_head;
output        txc_dmc_dma13_reset_done;
output        txc_dmc_dma13_mark_bit;
output        txc_dmc_dma13_inc_pkt_cnt;

// DMA14 
input         dmc_txc_dma14_active;
input         dmc_txc_dma14_eoflist;
input         dmc_txc_dma14_error;
input         dmc_txc_dma14_gotnxtdesc;
input         dmc_txc_dma14_cacheready;
input         dmc_txc_dma14_partial;
input         dmc_txc_dma14_reset_scheduled;
input [1:0]   dmc_txc_dma14_func_num;
input [19:0]  dmc_txc_dma14_page_handle;
input [63:0]  dmc_txc_dma14_descriptor;

output        txc_dmc_dma14_getnxtdesc;
output        txc_dmc_dma14_inc_head;
output        txc_dmc_dma14_reset_done;
output        txc_dmc_dma14_mark_bit;
output        txc_dmc_dma14_inc_pkt_cnt;

// DMA15 
input         dmc_txc_dma15_active;
input         dmc_txc_dma15_eoflist;
input         dmc_txc_dma15_error;
input         dmc_txc_dma15_gotnxtdesc;
input         dmc_txc_dma15_cacheready;
input         dmc_txc_dma15_partial;
input         dmc_txc_dma15_reset_scheduled;
input [1:0]   dmc_txc_dma15_func_num;
input [19:0]  dmc_txc_dma15_page_handle;
input [63:0]  dmc_txc_dma15_descriptor;

output        txc_dmc_dma15_getnxtdesc;
output        txc_dmc_dma15_inc_head;
output        txc_dmc_dma15_reset_done;
output        txc_dmc_dma15_mark_bit;
output        txc_dmc_dma15_inc_pkt_cnt;

`ifdef NEPTUNE
// DMA16 
input         dmc_txc_dma16_active;
input         dmc_txc_dma16_eoflist;
input         dmc_txc_dma16_error;
input         dmc_txc_dma16_gotnxtdesc;
input         dmc_txc_dma16_cacheready;
input         dmc_txc_dma16_partial;
input         dmc_txc_dma16_reset_scheduled;
input [1:0]   dmc_txc_dma16_func_num;
input [19:0]  dmc_txc_dma16_page_handle;
input [63:0]  dmc_txc_dma16_descriptor;

output        txc_dmc_dma16_getnxtdesc;
output        txc_dmc_dma16_inc_head;
output        txc_dmc_dma16_reset_done;
output        txc_dmc_dma16_mark_bit;
output        txc_dmc_dma16_inc_pkt_cnt;

// DMA17 
input         dmc_txc_dma17_active;
input         dmc_txc_dma17_eoflist;
input         dmc_txc_dma17_error;
input         dmc_txc_dma17_gotnxtdesc;
input         dmc_txc_dma17_cacheready;
input         dmc_txc_dma17_partial;
input         dmc_txc_dma17_reset_scheduled;
input [1:0]   dmc_txc_dma17_func_num;
input [19:0]  dmc_txc_dma17_page_handle;
input [63:0]  dmc_txc_dma17_descriptor;

output        txc_dmc_dma17_getnxtdesc;
output        txc_dmc_dma17_inc_head;
output        txc_dmc_dma17_reset_done;
output        txc_dmc_dma17_mark_bit;
output        txc_dmc_dma17_inc_pkt_cnt;

// DMA18 
input         dmc_txc_dma18_active;
input         dmc_txc_dma18_eoflist;
input         dmc_txc_dma18_error;
input         dmc_txc_dma18_gotnxtdesc;
input         dmc_txc_dma18_cacheready;
input         dmc_txc_dma18_partial;
input         dmc_txc_dma18_reset_scheduled;
input [1:0]   dmc_txc_dma18_func_num;
input [19:0]  dmc_txc_dma18_page_handle;
input [63:0]  dmc_txc_dma18_descriptor;

output        txc_dmc_dma18_getnxtdesc;
output        txc_dmc_dma18_inc_head;
output        txc_dmc_dma18_reset_done;
output        txc_dmc_dma18_mark_bit;
output        txc_dmc_dma18_inc_pkt_cnt;

// DMA19 
input         dmc_txc_dma19_active;
input         dmc_txc_dma19_eoflist;
input         dmc_txc_dma19_error;
input         dmc_txc_dma19_gotnxtdesc;
input         dmc_txc_dma19_cacheready;
input         dmc_txc_dma19_partial;
input         dmc_txc_dma19_reset_scheduled;
input [1:0]   dmc_txc_dma19_func_num;
input [19:0]  dmc_txc_dma19_page_handle;
input [63:0]  dmc_txc_dma19_descriptor;

output        txc_dmc_dma19_getnxtdesc;
output        txc_dmc_dma19_inc_head;
output        txc_dmc_dma19_reset_done;
output        txc_dmc_dma19_mark_bit;
output        txc_dmc_dma19_inc_pkt_cnt;

// DMA20 
input         dmc_txc_dma20_active;
input         dmc_txc_dma20_eoflist;
input         dmc_txc_dma20_error;
input         dmc_txc_dma20_gotnxtdesc;
input         dmc_txc_dma20_cacheready;
input         dmc_txc_dma20_partial;
input         dmc_txc_dma20_reset_scheduled;
input [1:0]   dmc_txc_dma20_func_num;
input [19:0]  dmc_txc_dma20_page_handle;
input [63:0]  dmc_txc_dma20_descriptor;

output        txc_dmc_dma20_getnxtdesc;
output        txc_dmc_dma20_inc_head;
output        txc_dmc_dma20_reset_done;
output        txc_dmc_dma20_mark_bit;
output        txc_dmc_dma20_inc_pkt_cnt;

// DMA21 
input         dmc_txc_dma21_active;
input         dmc_txc_dma21_eoflist;
input         dmc_txc_dma21_error;
input         dmc_txc_dma21_gotnxtdesc;
input         dmc_txc_dma21_cacheready;
input         dmc_txc_dma21_partial;
input         dmc_txc_dma21_reset_scheduled;
input [1:0]   dmc_txc_dma21_func_num;
input [19:0]  dmc_txc_dma21_page_handle;
input [63:0]  dmc_txc_dma21_descriptor;

output        txc_dmc_dma21_getnxtdesc;
output        txc_dmc_dma21_inc_head;
output        txc_dmc_dma21_reset_done;
output        txc_dmc_dma21_mark_bit;
output        txc_dmc_dma21_inc_pkt_cnt;

// DMA22 
input         dmc_txc_dma22_active;
input         dmc_txc_dma22_eoflist;
input         dmc_txc_dma22_error;
input         dmc_txc_dma22_gotnxtdesc;
input         dmc_txc_dma22_cacheready;
input         dmc_txc_dma22_partial;
input         dmc_txc_dma22_reset_scheduled;
input [1:0]   dmc_txc_dma22_func_num;
input [19:0]  dmc_txc_dma22_page_handle;
input [63:0]  dmc_txc_dma22_descriptor;

output        txc_dmc_dma22_getnxtdesc;
output        txc_dmc_dma22_inc_head;
output        txc_dmc_dma22_reset_done;
output        txc_dmc_dma22_mark_bit;
output        txc_dmc_dma22_inc_pkt_cnt;

// DMA23 
input         dmc_txc_dma23_active;
input         dmc_txc_dma23_eoflist;
input         dmc_txc_dma23_error;
input         dmc_txc_dma23_gotnxtdesc;
input         dmc_txc_dma23_cacheready;
input         dmc_txc_dma23_partial;
input         dmc_txc_dma23_reset_scheduled;
input [1:0]   dmc_txc_dma23_func_num;
input [19:0]  dmc_txc_dma23_page_handle;
input [63:0]  dmc_txc_dma23_descriptor;

output        txc_dmc_dma23_getnxtdesc;
output        txc_dmc_dma23_inc_head;
output        txc_dmc_dma23_reset_done;
output        txc_dmc_dma23_mark_bit;
output        txc_dmc_dma23_inc_pkt_cnt;
`else
// DMA16 
wire          dmc_txc_dma16_active = 1'b0;
wire          dmc_txc_dma16_eoflist = 1'b1;
wire          dmc_txc_dma16_error = 1'b0;
wire          dmc_txc_dma16_gotnxtdesc = 1'b0;
wire          dmc_txc_dma16_cacheready = 1'b0;
wire          dmc_txc_dma16_partial = 1'b0;
wire          dmc_txc_dma16_reset_scheduled = 1'b0;
wire  [1:0]   dmc_txc_dma16_func_num = 2'h0;
wire  [19:0]  dmc_txc_dma16_page_handle = 20'h0;
wire  [63:0]  dmc_txc_dma16_descriptor = 64'h0;

wire          txc_dmc_dma16_getnxtdesc;
wire          txc_dmc_dma16_inc_head;
wire          txc_dmc_dma16_reset_done;
wire          txc_dmc_dma16_mark_bit;
wire          txc_dmc_dma16_inc_pkt_cnt;

// DMA17 
wire          dmc_txc_dma17_active = 1'b0;
wire          dmc_txc_dma17_eoflist = 1'b1;
wire          dmc_txc_dma17_error = 1'b0;
wire          dmc_txc_dma17_gotnxtdesc = 1'b0;
wire          dmc_txc_dma17_cacheready = 1'b0;
wire          dmc_txc_dma17_partial = 1'b0;
wire          dmc_txc_dma17_reset_scheduled = 1'b0;
wire  [1:0]   dmc_txc_dma17_func_num = 2'h0;
wire  [19:0]  dmc_txc_dma17_page_handle = 20'h0;
wire  [63:0]  dmc_txc_dma17_descriptor = 64'h0;

wire          txc_dmc_dma17_getnxtdesc;
wire          txc_dmc_dma17_inc_head;
wire          txc_dmc_dma17_reset_done;
wire          txc_dmc_dma17_mark_bit;
wire          txc_dmc_dma17_inc_pkt_cnt;

// DMA18 
wire          dmc_txc_dma18_active = 1'b0;
wire          dmc_txc_dma18_eoflist = 1'b1;
wire          dmc_txc_dma18_error = 1'b0;
wire          dmc_txc_dma18_gotnxtdesc = 1'b0;
wire          dmc_txc_dma18_cacheready = 1'b0;
wire          dmc_txc_dma18_partial = 1'b0;
wire          dmc_txc_dma18_reset_scheduled = 1'b0;
wire  [1:0]   dmc_txc_dma18_func_num = 2'h0;
wire  [19:0]  dmc_txc_dma18_page_handle = 20'h0;
wire  [63:0]  dmc_txc_dma18_descriptor = 64'h0;

wire          txc_dmc_dma18_getnxtdesc;
wire          txc_dmc_dma18_inc_head;
wire          txc_dmc_dma18_reset_done;
wire          txc_dmc_dma18_mark_bit;
wire          txc_dmc_dma18_inc_pkt_cnt;

// DMA19 
wire          dmc_txc_dma19_active = 1'b0;
wire          dmc_txc_dma19_eoflist = 1'b1;
wire          dmc_txc_dma19_error = 1'b0;
wire          dmc_txc_dma19_gotnxtdesc = 1'b0;
wire          dmc_txc_dma19_cacheready = 1'b0;
wire          dmc_txc_dma19_partial = 1'b0;
wire          dmc_txc_dma19_reset_scheduled = 1'b0;
wire  [1:0]   dmc_txc_dma19_func_num = 2'h0;
wire  [19:0]  dmc_txc_dma19_page_handle = 20'h0;
wire  [63:0]  dmc_txc_dma19_descriptor = 64'h0;

wire          txc_dmc_dma19_getnxtdesc;
wire          txc_dmc_dma19_inc_head;
wire          txc_dmc_dma19_reset_done;
wire          txc_dmc_dma19_mark_bit;
wire          txc_dmc_dma19_inc_pkt_cnt;

// DMA20 
wire          dmc_txc_dma20_active = 1'b0;
wire          dmc_txc_dma20_eoflist = 1'b1;
wire          dmc_txc_dma20_error = 1'b0;
wire          dmc_txc_dma20_gotnxtdesc = 1'b0;
wire          dmc_txc_dma20_cacheready = 1'b0;
wire          dmc_txc_dma20_partial = 1'b0;
wire          dmc_txc_dma20_reset_scheduled = 1'b0;
wire  [1:0]   dmc_txc_dma20_func_num = 2'h0;
wire  [19:0]  dmc_txc_dma20_page_handle = 20'h0;
wire  [63:0]  dmc_txc_dma20_descriptor = 64'h0;

wire          txc_dmc_dma20_getnxtdesc;
wire          txc_dmc_dma20_inc_head;
wire          txc_dmc_dma20_reset_done;
wire          txc_dmc_dma20_mark_bit;
wire          txc_dmc_dma20_inc_pkt_cnt;

// DMA21 
wire          dmc_txc_dma21_active = 1'b0;
wire          dmc_txc_dma21_eoflist = 1'b1;
wire          dmc_txc_dma21_error = 1'b0;
wire          dmc_txc_dma21_gotnxtdesc = 1'b0;
wire          dmc_txc_dma21_cacheready = 1'b0;
wire          dmc_txc_dma21_partial = 1'b0;
wire          dmc_txc_dma21_reset_scheduled = 1'b0;
wire  [1:0]   dmc_txc_dma21_func_num = 2'h0;
wire  [19:0]  dmc_txc_dma21_page_handle = 20'h0;
wire  [63:0]  dmc_txc_dma21_descriptor = 64'h0;

wire          txc_dmc_dma21_getnxtdesc;
wire          txc_dmc_dma21_inc_head;
wire          txc_dmc_dma21_reset_done;
wire          txc_dmc_dma21_mark_bit;
wire          txc_dmc_dma21_inc_pkt_cnt;

// DMA22 
wire          dmc_txc_dma22_active = 1'b0;
wire          dmc_txc_dma22_eoflist = 1'b1;
wire          dmc_txc_dma22_error = 1'b0;
wire          dmc_txc_dma22_gotnxtdesc = 1'b0;
wire          dmc_txc_dma22_cacheready = 1'b0;
wire          dmc_txc_dma22_partial = 1'b0;
wire          dmc_txc_dma22_reset_scheduled = 1'b0;
wire  [1:0]   dmc_txc_dma22_func_num = 2'h0;
wire  [19:0]  dmc_txc_dma22_page_handle = 20'h0;
wire  [63:0]  dmc_txc_dma22_descriptor = 64'h0;

wire          txc_dmc_dma22_getnxtdesc;
wire          txc_dmc_dma22_inc_head;
wire          txc_dmc_dma22_reset_done;
wire          txc_dmc_dma22_mark_bit;
wire          txc_dmc_dma22_inc_pkt_cnt;

// DMA23 
wire          dmc_txc_dma23_active = 1'b0;
wire          dmc_txc_dma23_eoflist = 1'b1;
wire          dmc_txc_dma23_error = 1'b0;
wire          dmc_txc_dma23_gotnxtdesc = 1'b0;
wire          dmc_txc_dma23_cacheready = 1'b0;
wire          dmc_txc_dma23_partial = 1'b0;
wire          dmc_txc_dma23_reset_scheduled = 1'b0;
wire  [1:0]   dmc_txc_dma23_func_num = 2'h0;
wire  [19:0]  dmc_txc_dma23_page_handle = 20'h0;
wire  [63:0]  dmc_txc_dma23_descriptor = 64'h0;

wire          txc_dmc_dma23_getnxtdesc;
wire          txc_dmc_dma23_inc_head;
wire          txc_dmc_dma23_reset_done;
wire          txc_dmc_dma23_mark_bit;
wire          txc_dmc_dma23_inc_pkt_cnt;
`endif

// Tx DMA Request Interface
input          arb1_txc_req_accept;
input  [5:0]   arb1_txc_req_transid;

output         txc_arb1_req;
output [1:0]   txc_arb1_req_func_num;
output [1:0]   txc_arb1_req_port_num;
output [4:0]   txc_arb1_req_dma_num;
output [7:0]   txc_arb1_req_cmd;
output [13:0]  txc_arb1_req_length;
output [63:0]  txc_arb1_req_address;

// Tx DMA Response Interface
input          meta_dmc_resp_ready;
input          meta_dmc_resp_complete;
input          meta_dmc_resp_transfer_cmpl;
input          meta_dmc_data_valid;
input          meta_dmc_resp_client;
input  [1:0]   meta_dmc_resp_port_num;
input  [3:0]   meta_dmc_resp_cmd_status;
input  [3:0]   meta_dmc_resp_data_status;
input  [4:0]   meta_dmc_resp_dma_num;
input  [5:0]   meta_dmc_resp_transID;
input  [7:0]   meta_dmc_resp_cmd;
input  [15:0]  meta_dmc_resp_byteenable;
input  [13:0]  meta_dmc_resp_length;
input  [63:0]  meta_dmc_resp_address;
input  [127:0] meta_dmc_data;

output         dmc_meta_resp_accept;

/*--------------------------------------------------------------*/
// Wires & Registers
/*--------------------------------------------------------------*/
`ifdef NEPTUNE
`else
wire           pio_clients_32b = 1'b0;
`endif
// Reset Block
wire           reset_l;

// Meta Interface buffered
wire           dMC_TXC_Resp_Rdy;
wire           dMC_TXC_Resp_Complete;
wire           dMC_TXC_Trans_Complete;
wire           dMC_TXC_Resp_Data_Valid;
wire           dMC_TXC_Resp_Client;
wire   [1:0]   dMC_TXC_Resp_Port_Num;
wire   [3:0]   dMC_TXC_Resp_Cmd_Status;
wire   [3:0]   dMC_TXC_Resp_Data_Status;
wire   [4:0]   dMC_TXC_Resp_DMA_Num;
wire   [5:0]   dMC_TXC_Resp_TransID;
wire   [7:0]   dMC_TXC_Resp_Cmd;
wire   [13:0]  dMC_TXC_Resp_Data_Length;
wire   [15:0]  dMC_TXC_Resp_ByteEnables;
wire   [63:0]  dMC_TXC_Resp_Address;
wire   [127:0] dMC_TXC_Resp_Data;

// Control Registers
wire           txc_Enabled;
wire           flushEngine;
wire   [3:0]   portSelect_State;
wire   [3:0]   dataFetch_State;
wire   [5:0]   debug_select;
wire   [31:0]  trainingVector;

// dma contexts
wire           dma0_NewMaxBurst;
wire           dma1_NewMaxBurst;
wire           dma2_NewMaxBurst;
wire           dma3_NewMaxBurst;
wire           dma4_NewMaxBurst;
wire           dma5_NewMaxBurst;
wire           dma6_NewMaxBurst;
wire           dma7_NewMaxBurst;
wire           dma8_NewMaxBurst;
wire           dma9_NewMaxBurst;
wire           dma10_NewMaxBurst;
wire           dma11_NewMaxBurst;
wire           dma12_NewMaxBurst;
wire           dma13_NewMaxBurst;
wire           dma14_NewMaxBurst;
wire           dma15_NewMaxBurst;
wire           dma16_NewMaxBurst;
wire           dma17_NewMaxBurst;
wire           dma18_NewMaxBurst;
wire           dma19_NewMaxBurst;
wire           dma20_NewMaxBurst;
wire           dma21_NewMaxBurst;
wire           dma22_NewMaxBurst;
wire           dma23_NewMaxBurst;
wire   [3:0]   port_Selected;
wire   [19:0]  dma0_MaxBurst;
wire   [19:0]  dma1_MaxBurst;
wire   [19:0]  dma2_MaxBurst;
wire   [19:0]  dma3_MaxBurst;
wire   [19:0]  dma4_MaxBurst;
wire   [19:0]  dma5_MaxBurst;
wire   [19:0]  dma6_MaxBurst;
wire   [19:0]  dma7_MaxBurst;
wire   [19:0]  dma8_MaxBurst;
wire   [19:0]  dma9_MaxBurst;
wire   [19:0]  dma10_MaxBurst;
wire   [19:0]  dma11_MaxBurst;
wire   [19:0]  dma12_MaxBurst;
wire   [19:0]  dma13_MaxBurst;
wire   [19:0]  dma14_MaxBurst;
wire   [19:0]  dma15_MaxBurst;
wire   [19:0]  dma16_MaxBurst;
wire   [19:0]  dma17_MaxBurst;
wire   [19:0]  dma18_MaxBurst;
wire   [19:0]  dma19_MaxBurst;
wire   [19:0]  dma20_MaxBurst;
wire   [19:0]  dma21_MaxBurst;
wire   [19:0]  dma22_MaxBurst;
wire   [19:0]  dma23_MaxBurst;

// Port 0
wire           port0_SetGetNextDescDMA0;
wire           port0_SetGetNextDescDMA1;
wire           port0_SetGetNextDescDMA2;
wire           port0_SetGetNextDescDMA3;
wire           port0_SetGetNextDescDMA4;
wire           port0_SetGetNextDescDMA5;
wire           port0_SetGetNextDescDMA6;
wire           port0_SetGetNextDescDMA7;
wire           port0_SetGetNextDescDMA8;
wire           port0_SetGetNextDescDMA9;
wire           port0_SetGetNextDescDMA10;
wire           port0_SetGetNextDescDMA11;
wire           port0_SetGetNextDescDMA12;
wire           port0_SetGetNextDescDMA13;
wire           port0_SetGetNextDescDMA14;
wire           port0_SetGetNextDescDMA15;
wire           port0_SetGetNextDescDMA16;
wire           port0_SetGetNextDescDMA17;
wire           port0_SetGetNextDescDMA18;
wire           port0_SetGetNextDescDMA19;
wire           port0_SetGetNextDescDMA20;
wire           port0_SetGetNextDescDMA21;
wire           port0_SetGetNextDescDMA22;
wire           port0_SetGetNextDescDMA23;
wire           port0_Request;
wire           port0_LatchActiveDMA;
wire           port0_mac_req;
wire           port0_TXC_DMC_Resp_Accept;
wire           port0_Enabled;
wire           port0_clrMaxBurst;
wire           port0_UpdateDMA;
wire           port0_ClearStatistics;
wire           port0_WrPacketStuffed;
wire           port0_WrPacketXmitted;
wire           port0_WrPacketRequested;
wire           port0_ReOrderFifoDataValid;
wire           port0_ReOrderFifoWrite;
wire           port0_ReOrderFifoRead;
wire           port0_StoreForwardFifoRead;
wire           port0_StoreForwardFifoWrite;
wire           port0_DMA0_inc_head;
wire           port0_DMA0_reset_done;
wire           port0_DMA0_mark_bit;
wire           port0_DMA0_inc_pkt_cnt;
wire           port0_DMA1_inc_head;
wire           port0_DMA1_reset_done;
wire           port0_DMA1_mark_bit;
wire           port0_DMA1_inc_pkt_cnt;
wire           port0_DMA2_inc_head;
wire           port0_DMA2_reset_done;
wire           port0_DMA2_mark_bit;
wire           port0_DMA2_inc_pkt_cnt;
wire           port0_DMA3_inc_head;
wire           port0_DMA3_reset_done;
wire           port0_DMA3_mark_bit;
wire           port0_DMA3_inc_pkt_cnt;
wire           port0_DMA4_inc_head;
wire           port0_DMA4_reset_done;
wire           port0_DMA4_mark_bit;
wire           port0_DMA4_inc_pkt_cnt;
wire           port0_DMA5_inc_head;
wire           port0_DMA5_reset_done;
wire           port0_DMA5_mark_bit;
wire           port0_DMA5_inc_pkt_cnt;
wire           port0_DMA6_inc_head;
wire           port0_DMA6_reset_done;
wire           port0_DMA6_mark_bit;
wire           port0_DMA6_inc_pkt_cnt;
wire           port0_DMA7_inc_head;
wire           port0_DMA7_reset_done;
wire           port0_DMA7_mark_bit;
wire           port0_DMA7_inc_pkt_cnt;
wire           port0_DMA8_inc_head;
wire           port0_DMA8_reset_done;
wire           port0_DMA8_mark_bit;
wire           port0_DMA8_inc_pkt_cnt;
wire           port0_DMA9_inc_head;
wire           port0_DMA9_reset_done;
wire           port0_DMA9_mark_bit;
wire           port0_DMA9_inc_pkt_cnt;
wire           port0_DMA10_inc_head;
wire           port0_DMA10_reset_done;
wire           port0_DMA10_mark_bit;
wire           port0_DMA10_inc_pkt_cnt;
wire           port0_DMA11_inc_head;
wire           port0_DMA11_reset_done;
wire           port0_DMA11_mark_bit;
wire           port0_DMA11_inc_pkt_cnt;
wire           port0_DMA12_inc_head;
wire           port0_DMA12_reset_done;
wire           port0_DMA12_mark_bit;
wire           port0_DMA12_inc_pkt_cnt;
wire           port0_DMA13_inc_head;
wire           port0_DMA13_reset_done;
wire           port0_DMA13_mark_bit;
wire           port0_DMA13_inc_pkt_cnt;
wire           port0_DMA14_inc_head;
wire           port0_DMA14_reset_done;
wire           port0_DMA14_mark_bit;
wire           port0_DMA14_inc_pkt_cnt;
wire           port0_DMA15_inc_head;
wire           port0_DMA15_reset_done;
wire           port0_DMA15_mark_bit;
wire           port0_DMA15_inc_pkt_cnt;
wire           port0_DMA16_inc_head;
wire           port0_DMA16_reset_done;
wire           port0_DMA16_mark_bit;
wire           port0_DMA16_inc_pkt_cnt;
wire           port0_DMA17_inc_head;
wire           port0_DMA17_reset_done;
wire           port0_DMA17_mark_bit;
wire           port0_DMA17_inc_pkt_cnt;
wire           port0_DMA18_inc_head;
wire           port0_DMA18_reset_done;
wire           port0_DMA18_mark_bit;
wire           port0_DMA18_inc_pkt_cnt;
wire           port0_DMA19_inc_head;
wire           port0_DMA19_reset_done;
wire           port0_DMA19_mark_bit;
wire           port0_DMA19_inc_pkt_cnt;
wire           port0_DMA20_inc_head;
wire           port0_DMA20_reset_done;
wire           port0_DMA20_mark_bit;
wire           port0_DMA20_inc_pkt_cnt;
wire           port0_DMA21_inc_head;
wire           port0_DMA21_reset_done;
wire           port0_DMA21_mark_bit;
wire           port0_DMA21_inc_pkt_cnt;
wire           port0_DMA22_inc_head;
wire           port0_DMA22_reset_done;
wire           port0_DMA22_mark_bit;
wire           port0_DMA22_inc_pkt_cnt;
wire           port0_DMA23_inc_head;
wire           port0_DMA23_reset_done;
wire           port0_DMA23_mark_bit;
wire           port0_DMA23_inc_pkt_cnt;
wire           port0_ReOrder_UnCorrectError;
wire           port0_StoreForward_UnCorrectError;
wire           port0_ReOrderCorruptECCSingle;
wire           port0_ReOrderCorruptECCDouble;
wire           port0_StoreForwardCorruptECCSingle;
wire           port0_StoreForwardCorruptECCDouble;
wire           port0_Nack_Pkt_Rd;
wire           port0_PacketAssyDead;
wire           port0_ReOrder_Error;
wire           port0_WrTidsInUse;
wire           port0_WrDuplicateTid;
wire           port0_WrUnInitializedTID;
wire           port0_WrTimedoutTids;
wire           port0_WrReOrderStateLogic;
wire           port0_WrReOrderStateControl;
wire           port0_WrReOrderStateData0;
wire           port0_WrReOrderStateData1;
wire           port0_WrReOrderStateData2;
wire           port0_WrReOrderStateData3;
wire           port0_ReOrder_ClearEccError;
wire           port0_WrReOrderEccState;
wire           port0_WrReOrderEccData0;
wire           port0_WrReOrderEccData1;
wire           port0_WrReOrderEccData2;
wire           port0_WrReOrderEccData3;
wire           port0_WrReOrderEccData4;
wire           port0_StoreForward_ClearEccError;
wire           port0_WrStoreForwardEccState;
wire           port0_WrStoreForwardEccData0;
wire           port0_WrStoreForwardEccData1;
wire           port0_WrStoreForwardEccData2;
wire           port0_WrStoreForwardEccData3;
wire           port0_WrStoreForwardEccData4;
wire   [1:0]   port0_Request_Func_Num;
wire   [3:0]   port0_GatherRequestCount;
wire   [3:0]   port0_Anchor_State;
wire   [3:0]   port0_ReOrder_State;
wire   [3:0]   port0_Pointer_State;
wire   [3:0]   port0_PacketAssy_State;
wire   [3:0]   port0_DRR_ArbState;
wire   [3:0]   port0_Mac_Xfer_State;
wire   [3:0]   port0_DataPortReq_State;
wire   [3:0]   port0_MaxReorderNumber;
wire   [4:0]   port0_Request_DMA_Num;
wire   [9:0]   port0_ReOrderWritePtr;
wire   [9:0]   port0_ReOrderReadPtr;
wire   [9:0]   port0_StoreForwardReadPtr;
wire   [9:0]   port0_StoreForwardWritePtr;
wire   [11:0]  port0_PacketRequestCount;
wire   [12:0]  port0_Request_Length;
wire   [13:0]  port0_UpdateDMALength;
wire   [15:0]  port0_PktErrAbortCount;
wire   [15:0]  port0_ReOrdersStuffed;
wire   [15:0]  port0_PacketsTransmitted;
wire   [15:0]  port0_PacketsStuffed;
wire   [15:0]  port0_BytesTransmitted;
wire   [23:0]  port0_UpdateDMANumber;
wire   [23:0]  port0_DMA_Nack_Pkt_Rd;
wire   [23:0]  port0_DMA_List;
wire   [23:0]  port0_ContextActiveList;
wire   [31:0]  port0_ReOrderEccControl;
wire   [31:0]  port0_StoreForwardEccControl;
wire   [31:0]  port0_Sum_prt_state;
wire   [31:0]  port0_TidsInUse;
wire   [31:0]  port0_DuplicateTid;
wire   [31:0]  port0_UnInitializedTID;
wire   [31:0]  port0_TimedoutTids ;
wire   [31:0]  port0_ReOrderStateLogic;
wire   [31:0]  port0_ReOrderStateControl;
wire   [31:0]  port0_ReOrderStateData0;
wire   [31:0]  port0_ReOrderStateData1;
wire   [31:0]  port0_ReOrderStateData2;
wire   [31:0]  port0_ReOrderStateData3;
wire   [31:0]  port0_PioDataIn;
wire   [31:0]  port0_ReOrder_ECC_State;
wire   [31:0]  port0_StoreForward_ECC_State;
wire   [43:0]  port0_Nack_Pkt_Rd_Addr;
wire   [63:0]  port0_Request_Address;
wire   [135:0] port0_PacketAssyEngineDataIn;
wire   [135:0] port0_PacketAssyEngineDataOut;
wire   [135:0] port0_ReOrderEngineDataOut;
wire   [135:0] port0_MacXferEngineDataIn;
wire   [151:0] port0_ReOrderFifoDataOut;
wire   [151:0] port0_ReOrderFifoDataIn;
wire   [151:0] port0_StoreForwardFifoDataOut;
wire   [151:0] port0_StoreForwardFifoDataIn;
wire   [151:0] port0_ReOrder_EccData;
wire   [151:0] port0_StoreForward_EccData;

// Port 1
wire           port1_SetGetNextDescDMA0;
wire           port1_SetGetNextDescDMA1;
wire           port1_SetGetNextDescDMA2;
wire           port1_SetGetNextDescDMA3;
wire           port1_SetGetNextDescDMA4;
wire           port1_SetGetNextDescDMA5;
wire           port1_SetGetNextDescDMA6;
wire           port1_SetGetNextDescDMA7;
wire           port1_SetGetNextDescDMA8;
wire           port1_SetGetNextDescDMA9;
wire           port1_SetGetNextDescDMA10;
wire           port1_SetGetNextDescDMA11;
wire           port1_SetGetNextDescDMA12;
wire           port1_SetGetNextDescDMA13;
wire           port1_SetGetNextDescDMA14;
wire           port1_SetGetNextDescDMA15;
wire           port1_SetGetNextDescDMA16;
wire           port1_SetGetNextDescDMA17;
wire           port1_SetGetNextDescDMA18;
wire           port1_SetGetNextDescDMA19;
wire           port1_SetGetNextDescDMA20;
wire           port1_SetGetNextDescDMA21;
wire           port1_SetGetNextDescDMA22;
wire           port1_SetGetNextDescDMA23;
wire           port1_Request;
wire           port1_LatchActiveDMA;
wire           port1_mac_req;
wire           port1_TXC_DMC_Resp_Accept;
wire           port1_Enabled;
wire           port1_clrMaxBurst;
wire           port1_UpdateDMA;
wire           port1_ClearStatistics;
wire           port1_WrPacketStuffed;
wire           port1_WrPacketXmitted;
wire           port1_WrPacketRequested;
wire           port1_ReOrderFifoDataValid;
wire           port1_ReOrderFifoWrite;
wire           port1_ReOrderFifoRead;
wire           port1_StoreForwardFifoRead;
wire           port1_StoreForwardFifoWrite;
wire           port1_DMA0_inc_head;
wire           port1_DMA0_reset_done;
wire           port1_DMA0_mark_bit;
wire           port1_DMA0_inc_pkt_cnt;
wire           port1_DMA1_inc_head;
wire           port1_DMA1_reset_done;
wire           port1_DMA1_mark_bit;
wire           port1_DMA1_inc_pkt_cnt;
wire           port1_DMA2_inc_head;
wire           port1_DMA2_reset_done;
wire           port1_DMA2_mark_bit;
wire           port1_DMA2_inc_pkt_cnt;
wire           port1_DMA3_inc_head;
wire           port1_DMA3_reset_done;
wire           port1_DMA3_mark_bit;
wire           port1_DMA3_inc_pkt_cnt;
wire           port1_DMA4_inc_head;
wire           port1_DMA4_reset_done;
wire           port1_DMA4_mark_bit;
wire           port1_DMA4_inc_pkt_cnt;
wire           port1_DMA5_inc_head;
wire           port1_DMA5_reset_done;
wire           port1_DMA5_mark_bit;
wire           port1_DMA5_inc_pkt_cnt;
wire           port1_DMA6_inc_head;
wire           port1_DMA6_reset_done;
wire           port1_DMA6_mark_bit;
wire           port1_DMA6_inc_pkt_cnt;
wire           port1_DMA7_inc_head;
wire           port1_DMA7_reset_done;
wire           port1_DMA7_mark_bit;
wire           port1_DMA7_inc_pkt_cnt;
wire           port1_DMA8_inc_head;
wire           port1_DMA8_reset_done;
wire           port1_DMA8_mark_bit;
wire           port1_DMA8_inc_pkt_cnt;
wire           port1_DMA9_inc_head;
wire           port1_DMA9_reset_done;
wire           port1_DMA9_mark_bit;
wire           port1_DMA9_inc_pkt_cnt;
wire           port1_DMA10_inc_head;
wire           port1_DMA10_reset_done;
wire           port1_DMA10_mark_bit;
wire           port1_DMA10_inc_pkt_cnt;
wire           port1_DMA11_inc_head;
wire           port1_DMA11_reset_done;
wire           port1_DMA11_mark_bit;
wire           port1_DMA11_inc_pkt_cnt;
wire           port1_DMA12_inc_head;
wire           port1_DMA12_reset_done;
wire           port1_DMA12_mark_bit;
wire           port1_DMA12_inc_pkt_cnt;
wire           port1_DMA13_inc_head;
wire           port1_DMA13_reset_done;
wire           port1_DMA13_mark_bit;
wire           port1_DMA13_inc_pkt_cnt;
wire           port1_DMA14_inc_head;
wire           port1_DMA14_reset_done;
wire           port1_DMA14_mark_bit;
wire           port1_DMA14_inc_pkt_cnt;
wire           port1_DMA15_inc_head;
wire           port1_DMA15_reset_done;
wire           port1_DMA15_mark_bit;
wire           port1_DMA15_inc_pkt_cnt;
wire           port1_DMA16_inc_head;
wire           port1_DMA16_reset_done;
wire           port1_DMA16_mark_bit;
wire           port1_DMA16_inc_pkt_cnt;
wire           port1_DMA17_inc_head;
wire           port1_DMA17_reset_done;
wire           port1_DMA17_mark_bit;
wire           port1_DMA17_inc_pkt_cnt;
wire           port1_DMA18_inc_head;
wire           port1_DMA18_reset_done;
wire           port1_DMA18_mark_bit;
wire           port1_DMA18_inc_pkt_cnt;
wire           port1_DMA19_inc_head;
wire           port1_DMA19_reset_done;
wire           port1_DMA19_mark_bit;
wire           port1_DMA19_inc_pkt_cnt;
wire           port1_DMA20_inc_head;
wire           port1_DMA20_reset_done;
wire           port1_DMA20_mark_bit;
wire           port1_DMA20_inc_pkt_cnt;
wire           port1_DMA21_inc_head;
wire           port1_DMA21_reset_done;
wire           port1_DMA21_mark_bit;
wire           port1_DMA21_inc_pkt_cnt;
wire           port1_DMA22_inc_head;
wire           port1_DMA22_reset_done;
wire           port1_DMA22_mark_bit;
wire           port1_DMA22_inc_pkt_cnt;
wire           port1_DMA23_inc_head;
wire           port1_DMA23_reset_done;
wire           port1_DMA23_mark_bit;
wire           port1_DMA23_inc_pkt_cnt;
wire           port1_ReOrder_UnCorrectError;
wire           port1_StoreForward_UnCorrectError;
wire           port1_ReOrderCorruptECCSingle;
wire           port1_ReOrderCorruptECCDouble;
wire           port1_StoreForwardCorruptECCSingle;
wire           port1_StoreForwardCorruptECCDouble;
wire           port1_Nack_Pkt_Rd;
wire           port1_PacketAssyDead;
wire           port1_ReOrder_Error;
wire           port1_WrTidsInUse;
wire           port1_WrDuplicateTid;
wire           port1_WrUnInitializedTID;
wire           port1_WrTimedoutTids;
wire           port1_WrReOrderStateLogic;
wire           port1_WrReOrderStateControl;
wire           port1_WrReOrderStateData0;
wire           port1_WrReOrderStateData1;
wire           port1_WrReOrderStateData2;
wire           port1_WrReOrderStateData3;
wire           port1_ReOrder_ClearEccError;
wire           port1_WrReOrderEccState;
wire           port1_WrReOrderEccData0;
wire           port1_WrReOrderEccData1;
wire           port1_WrReOrderEccData2;
wire           port1_WrReOrderEccData3;
wire           port1_WrReOrderEccData4;
wire           port1_StoreForward_ClearEccError;
wire           port1_WrStoreForwardEccState;
wire           port1_WrStoreForwardEccData0;
wire           port1_WrStoreForwardEccData1;
wire           port1_WrStoreForwardEccData2;
wire           port1_WrStoreForwardEccData3;
wire           port1_WrStoreForwardEccData4;
wire   [1:0]   port1_Request_Func_Num;
wire   [3:0]   port1_GatherRequestCount;
wire   [3:0]   port1_Anchor_State;
wire   [3:0]   port1_ReOrder_State;
wire   [3:0]   port1_Pointer_State;
wire   [3:0]   port1_PacketAssy_State;
wire   [3:0]   port1_DRR_ArbState;
wire   [3:0]   port1_Mac_Xfer_State;
wire   [3:0]   port1_DataPortReq_State;
wire   [3:0]   port1_MaxReorderNumber;
wire   [4:0]   port1_Request_DMA_Num;
wire   [9:0]   port1_ReOrderWritePtr;
wire   [9:0]   port1_ReOrderReadPtr;
wire   [9:0]   port1_StoreForwardReadPtr;
wire   [9:0]   port1_StoreForwardWritePtr;
wire   [11:0]  port1_PacketRequestCount;
wire   [12:0]  port1_Request_Length;
wire   [13:0]  port1_UpdateDMALength;
wire   [15:0]  port1_PktErrAbortCount;
wire   [15:0]  port1_ReOrdersStuffed;
wire   [15:0]  port1_PacketsTransmitted;
wire   [15:0]  port1_PacketsStuffed;
wire   [15:0]  port1_BytesTransmitted;
wire   [23:0]  port1_UpdateDMANumber;
wire   [23:0]  port1_DMA_Nack_Pkt_Rd;
wire   [23:0]  port1_DMA_List;
wire   [23:0]  port1_ContextActiveList;
wire   [31:0]  port1_ReOrderEccControl;
wire   [31:0]  port1_StoreForwardEccControl;
wire   [31:0]  port1_Sum_prt_state;
wire   [31:0]  port1_TidsInUse;
wire   [31:0]  port1_DuplicateTid;
wire   [31:0]  port1_UnInitializedTID;
wire   [31:0]  port1_TimedoutTids ;
wire   [31:0]  port1_ReOrderStateLogic;
wire   [31:0]  port1_ReOrderStateControl;
wire   [31:0]  port1_ReOrderStateData0;
wire   [31:0]  port1_ReOrderStateData1;
wire   [31:0]  port1_ReOrderStateData2;
wire   [31:0]  port1_ReOrderStateData3;
wire   [31:0]  port1_PioDataIn;
wire   [31:0]  port1_ReOrder_ECC_State;
wire   [31:0]  port1_StoreForward_ECC_State;
wire   [43:0]  port1_Nack_Pkt_Rd_Addr;
wire   [63:0]  port1_Request_Address;
wire   [135:0] port1_PacketAssyEngineDataIn;
wire   [135:0] port1_PacketAssyEngineDataOut;
wire   [135:0] port1_ReOrderEngineDataOut;
wire   [135:0] port1_MacXferEngineDataIn;
wire   [151:0] port1_ReOrderFifoDataOut;
wire   [151:0] port1_ReOrderFifoDataIn;
wire   [151:0] port1_StoreForwardFifoDataOut;
wire   [151:0] port1_StoreForwardFifoDataIn;
wire   [151:0] port1_ReOrder_EccData;
wire   [151:0] port1_StoreForward_EccData;

`ifdef NEPTUNE

// Port 2
wire           port2_SetGetNextDescDMA0;
wire           port2_SetGetNextDescDMA1;
wire           port2_SetGetNextDescDMA2;
wire           port2_SetGetNextDescDMA3;
wire           port2_SetGetNextDescDMA4;
wire           port2_SetGetNextDescDMA5;
wire           port2_SetGetNextDescDMA6;
wire           port2_SetGetNextDescDMA7;
wire           port2_SetGetNextDescDMA8;
wire           port2_SetGetNextDescDMA9;
wire           port2_SetGetNextDescDMA10;
wire           port2_SetGetNextDescDMA11;
wire           port2_SetGetNextDescDMA12;
wire           port2_SetGetNextDescDMA13;
wire           port2_SetGetNextDescDMA14;
wire           port2_SetGetNextDescDMA15;
wire           port2_SetGetNextDescDMA16;
wire           port2_SetGetNextDescDMA17;
wire           port2_SetGetNextDescDMA18;
wire           port2_SetGetNextDescDMA19;
wire           port2_SetGetNextDescDMA20;
wire           port2_SetGetNextDescDMA21;
wire           port2_SetGetNextDescDMA22;
wire           port2_SetGetNextDescDMA23;
wire           port2_Request;
wire           port2_LatchActiveDMA;
wire           port2_mac_req;
wire           port2_TXC_DMC_Resp_Accept;
wire           port2_Enabled;
wire           port2_clrMaxBurst;
wire           port2_UpdateDMA;
wire           port2_ClearStatistics;
wire           port2_WrPacketStuffed;
wire           port2_WrPacketXmitted;
wire           port2_WrPacketRequested;
wire           port2_ReOrderFifoDataValid;
wire           port2_ReOrderFifoWrite;
wire           port2_ReOrderFifoRead;
wire           port2_StoreForwardFifoRead;
wire           port2_StoreForwardFifoWrite;
wire           port2_DMA0_inc_head;
wire           port2_DMA0_reset_done;
wire           port2_DMA0_mark_bit;
wire           port2_DMA0_inc_pkt_cnt;
wire           port2_DMA1_inc_head;
wire           port2_DMA1_reset_done;
wire           port2_DMA1_mark_bit;
wire           port2_DMA1_inc_pkt_cnt;
wire           port2_DMA2_inc_head;
wire           port2_DMA2_reset_done;
wire           port2_DMA2_mark_bit;
wire           port2_DMA2_inc_pkt_cnt;
wire           port2_DMA3_inc_head;
wire           port2_DMA3_reset_done;
wire           port2_DMA3_mark_bit;
wire           port2_DMA3_inc_pkt_cnt;
wire           port2_DMA4_inc_head;
wire           port2_DMA4_reset_done;
wire           port2_DMA4_mark_bit;
wire           port2_DMA4_inc_pkt_cnt;
wire           port2_DMA5_inc_head;
wire           port2_DMA5_reset_done;
wire           port2_DMA5_mark_bit;
wire           port2_DMA5_inc_pkt_cnt;
wire           port2_DMA6_inc_head;
wire           port2_DMA6_reset_done;
wire           port2_DMA6_mark_bit;
wire           port2_DMA6_inc_pkt_cnt;
wire           port2_DMA7_inc_head;
wire           port2_DMA7_reset_done;
wire           port2_DMA7_mark_bit;
wire           port2_DMA7_inc_pkt_cnt;
wire           port2_DMA8_inc_head;
wire           port2_DMA8_reset_done;
wire           port2_DMA8_mark_bit;
wire           port2_DMA8_inc_pkt_cnt;
wire           port2_DMA9_inc_head;
wire           port2_DMA9_reset_done;
wire           port2_DMA9_mark_bit;
wire           port2_DMA9_inc_pkt_cnt;
wire           port2_DMA10_inc_head;
wire           port2_DMA10_reset_done;
wire           port2_DMA10_mark_bit;
wire           port2_DMA10_inc_pkt_cnt;
wire           port2_DMA11_inc_head;
wire           port2_DMA11_reset_done;
wire           port2_DMA11_mark_bit;
wire           port2_DMA11_inc_pkt_cnt;
wire           port2_DMA12_inc_head;
wire           port2_DMA12_reset_done;
wire           port2_DMA12_mark_bit;
wire           port2_DMA12_inc_pkt_cnt;
wire           port2_DMA13_inc_head;
wire           port2_DMA13_reset_done;
wire           port2_DMA13_mark_bit;
wire           port2_DMA13_inc_pkt_cnt;
wire           port2_DMA14_inc_head;
wire           port2_DMA14_reset_done;
wire           port2_DMA14_mark_bit;
wire           port2_DMA14_inc_pkt_cnt;
wire           port2_DMA15_inc_head;
wire           port2_DMA15_reset_done;
wire           port2_DMA15_mark_bit;
wire           port2_DMA15_inc_pkt_cnt;
wire           port2_DMA16_inc_head;
wire           port2_DMA16_reset_done;
wire           port2_DMA16_mark_bit;
wire           port2_DMA16_inc_pkt_cnt;
wire           port2_DMA17_inc_head;
wire           port2_DMA17_reset_done;
wire           port2_DMA17_mark_bit;
wire           port2_DMA17_inc_pkt_cnt;
wire           port2_DMA18_inc_head;
wire           port2_DMA18_reset_done;
wire           port2_DMA18_mark_bit;
wire           port2_DMA18_inc_pkt_cnt;
wire           port2_DMA19_inc_head;
wire           port2_DMA19_reset_done;
wire           port2_DMA19_mark_bit;
wire           port2_DMA19_inc_pkt_cnt;
wire           port2_DMA20_inc_head;
wire           port2_DMA20_reset_done;
wire           port2_DMA20_mark_bit;
wire           port2_DMA20_inc_pkt_cnt;
wire           port2_DMA21_inc_head;
wire           port2_DMA21_reset_done;
wire           port2_DMA21_mark_bit;
wire           port2_DMA21_inc_pkt_cnt;
wire           port2_DMA22_inc_head;
wire           port2_DMA22_reset_done;
wire           port2_DMA22_mark_bit;
wire           port2_DMA22_inc_pkt_cnt;
wire           port2_DMA23_inc_head;
wire           port2_DMA23_reset_done;
wire           port2_DMA23_mark_bit;
wire           port2_DMA23_inc_pkt_cnt;
wire           port2_ReOrder_UnCorrectError;
wire           port2_StoreForward_UnCorrectError;
wire           port2_ReOrderCorruptECCSingle;
wire           port2_ReOrderCorruptECCDouble;
wire           port2_StoreForwardCorruptECCSingle;
wire           port2_StoreForwardCorruptECCDouble;
wire           port2_Nack_Pkt_Rd;
wire           port2_PacketAssyDead;
wire           port2_ReOrder_Error;
wire           port2_WrTidsInUse;
wire           port2_WrDuplicateTid;
wire           port2_WrUnInitializedTID;
wire           port2_WrTimedoutTids;
wire           port2_WrReOrderStateLogic;
wire           port2_WrReOrderStateControl;
wire           port2_WrReOrderStateData0;
wire           port2_WrReOrderStateData1;
wire           port2_WrReOrderStateData2;
wire           port2_WrReOrderStateData3;
wire           port2_ReOrder_ClearEccError;
wire           port2_WrReOrderEccState;
wire           port2_WrReOrderEccData0;
wire           port2_WrReOrderEccData1;
wire           port2_WrReOrderEccData2;
wire           port2_WrReOrderEccData3;
wire           port2_WrReOrderEccData4;
wire           port2_StoreForward_ClearEccError;
wire           port2_WrStoreForwardEccState;
wire           port2_WrStoreForwardEccData0;
wire           port2_WrStoreForwardEccData1;
wire           port2_WrStoreForwardEccData2;
wire           port2_WrStoreForwardEccData3;
wire           port2_WrStoreForwardEccData4;
wire   [1:0]   port2_Request_Func_Num;
wire   [3:0]   port2_GatherRequestCount;
wire   [3:0]   port2_Anchor_State;
wire   [3:0]   port2_ReOrder_State;
wire   [3:0]   port2_Pointer_State;
wire   [3:0]   port2_PacketAssy_State;
wire   [3:0]   port2_DRR_ArbState;
wire   [3:0]   port2_Mac_Xfer_State;
wire   [3:0]   port2_DataPortReq_State;
wire   [3:0]   port2_MaxReorderNumber;
wire   [4:0]   port2_Request_DMA_Num;
wire   [9:0]   port2_ReOrderWritePtr;
wire   [9:0]   port2_ReOrderReadPtr;
wire   [9:0]   port2_StoreForwardReadPtr;
wire   [9:0]   port2_StoreForwardWritePtr;
wire   [11:0]  port2_PacketRequestCount;
wire   [12:0]  port2_Request_Length;
wire   [13:0]  port2_UpdateDMALength;
wire   [15:0]  port2_PktErrAbortCount;
wire   [15:0]  port2_ReOrdersStuffed;
wire   [15:0]  port2_PacketsTransmitted;
wire   [15:0]  port2_PacketsStuffed;
wire   [15:0]  port2_BytesTransmitted;
wire   [23:0]  port2_UpdateDMANumber;
wire   [23:0]  port2_DMA_Nack_Pkt_Rd;
wire   [23:0]  port2_DMA_List;
wire   [23:0]  port2_ContextActiveList;
wire   [31:0]  port2_ReOrderEccControl;
wire   [31:0]  port2_StoreForwardEccControl;
wire   [31:0]  port2_Sum_prt_state;
wire   [31:0]  port2_TidsInUse;
wire   [31:0]  port2_DuplicateTid;
wire   [31:0]  port2_UnInitializedTID;
wire   [31:0]  port2_TimedoutTids ;
wire   [31:0]  port2_ReOrderStateLogic;
wire   [31:0]  port2_ReOrderStateControl;
wire   [31:0]  port2_ReOrderStateData0;
wire   [31:0]  port2_ReOrderStateData1;
wire   [31:0]  port2_ReOrderStateData2;
wire   [31:0]  port2_ReOrderStateData3;
wire   [31:0]  port2_PioDataIn;
wire   [31:0]  port2_ReOrder_ECC_State;
wire   [31:0]  port2_StoreForward_ECC_State;
wire   [43:0]  port2_Nack_Pkt_Rd_Addr;
wire   [63:0]  port2_Request_Address;
wire   [135:0] port2_PacketAssyEngineDataIn;
wire   [135:0] port2_PacketAssyEngineDataOut;
wire   [135:0] port2_ReOrderEngineDataOut;
wire   [135:0] port2_MacXferEngineDataIn;
wire   [151:0] port2_ReOrderFifoDataOut;
wire   [151:0] port2_ReOrderFifoDataIn;
wire   [151:0] port2_StoreForwardFifoDataOut;
wire   [151:0] port2_StoreForwardFifoDataIn;
wire   [151:0] port2_ReOrder_EccData;
wire   [151:0] port2_StoreForward_EccData;

// Port 3
wire           port3_SetGetNextDescDMA0;
wire           port3_SetGetNextDescDMA1;
wire           port3_SetGetNextDescDMA2;
wire           port3_SetGetNextDescDMA3;
wire           port3_SetGetNextDescDMA4;
wire           port3_SetGetNextDescDMA5;
wire           port3_SetGetNextDescDMA6;
wire           port3_SetGetNextDescDMA7;
wire           port3_SetGetNextDescDMA8;
wire           port3_SetGetNextDescDMA9;
wire           port3_SetGetNextDescDMA10;
wire           port3_SetGetNextDescDMA11;
wire           port3_SetGetNextDescDMA12;
wire           port3_SetGetNextDescDMA13;
wire           port3_SetGetNextDescDMA14;
wire           port3_SetGetNextDescDMA15;
wire           port3_SetGetNextDescDMA16;
wire           port3_SetGetNextDescDMA17;
wire           port3_SetGetNextDescDMA18;
wire           port3_SetGetNextDescDMA19;
wire           port3_SetGetNextDescDMA20;
wire           port3_SetGetNextDescDMA21;
wire           port3_SetGetNextDescDMA22;
wire           port3_SetGetNextDescDMA23;
wire           port3_Request;
wire           port3_LatchActiveDMA;
wire           port3_mac_req;
wire           port3_TXC_DMC_Resp_Accept;
wire           port3_Enabled;
wire           port3_clrMaxBurst;
wire           port3_UpdateDMA;
wire           port3_ClearStatistics;
wire           port3_WrPacketStuffed;
wire           port3_WrPacketXmitted;
wire           port3_WrPacketRequested;
wire           port3_ReOrderFifoDataValid;
wire           port3_ReOrderFifoWrite;
wire           port3_ReOrderFifoRead;
wire           port3_StoreForwardFifoRead;
wire           port3_StoreForwardFifoWrite;
wire           port3_DMA0_inc_head;
wire           port3_DMA0_reset_done;
wire           port3_DMA0_mark_bit;
wire           port3_DMA0_inc_pkt_cnt;
wire           port3_DMA1_inc_head;
wire           port3_DMA1_reset_done;
wire           port3_DMA1_mark_bit;
wire           port3_DMA1_inc_pkt_cnt;
wire           port3_DMA2_inc_head;
wire           port3_DMA2_reset_done;
wire           port3_DMA2_mark_bit;
wire           port3_DMA2_inc_pkt_cnt;
wire           port3_DMA3_inc_head;
wire           port3_DMA3_reset_done;
wire           port3_DMA3_mark_bit;
wire           port3_DMA3_inc_pkt_cnt;
wire           port3_DMA4_inc_head;
wire           port3_DMA4_reset_done;
wire           port3_DMA4_mark_bit;
wire           port3_DMA4_inc_pkt_cnt;
wire           port3_DMA5_inc_head;
wire           port3_DMA5_reset_done;
wire           port3_DMA5_mark_bit;
wire           port3_DMA5_inc_pkt_cnt;
wire           port3_DMA6_inc_head;
wire           port3_DMA6_reset_done;
wire           port3_DMA6_mark_bit;
wire           port3_DMA6_inc_pkt_cnt;
wire           port3_DMA7_inc_head;
wire           port3_DMA7_reset_done;
wire           port3_DMA7_mark_bit;
wire           port3_DMA7_inc_pkt_cnt;
wire           port3_DMA8_inc_head;
wire           port3_DMA8_reset_done;
wire           port3_DMA8_mark_bit;
wire           port3_DMA8_inc_pkt_cnt;
wire           port3_DMA9_inc_head;
wire           port3_DMA9_reset_done;
wire           port3_DMA9_mark_bit;
wire           port3_DMA9_inc_pkt_cnt;
wire           port3_DMA10_inc_head;
wire           port3_DMA10_reset_done;
wire           port3_DMA10_mark_bit;
wire           port3_DMA10_inc_pkt_cnt;
wire           port3_DMA11_inc_head;
wire           port3_DMA11_reset_done;
wire           port3_DMA11_mark_bit;
wire           port3_DMA11_inc_pkt_cnt;
wire           port3_DMA12_inc_head;
wire           port3_DMA12_reset_done;
wire           port3_DMA12_mark_bit;
wire           port3_DMA12_inc_pkt_cnt;
wire           port3_DMA13_inc_head;
wire           port3_DMA13_reset_done;
wire           port3_DMA13_mark_bit;
wire           port3_DMA13_inc_pkt_cnt;
wire           port3_DMA14_inc_head;
wire           port3_DMA14_reset_done;
wire           port3_DMA14_mark_bit;
wire           port3_DMA14_inc_pkt_cnt;
wire           port3_DMA15_inc_head;
wire           port3_DMA15_reset_done;
wire           port3_DMA15_mark_bit;
wire           port3_DMA15_inc_pkt_cnt;
wire           port3_DMA16_inc_head;
wire           port3_DMA16_reset_done;
wire           port3_DMA16_mark_bit;
wire           port3_DMA16_inc_pkt_cnt;
wire           port3_DMA17_inc_head;
wire           port3_DMA17_reset_done;
wire           port3_DMA17_mark_bit;
wire           port3_DMA17_inc_pkt_cnt;
wire           port3_DMA18_inc_head;
wire           port3_DMA18_reset_done;
wire           port3_DMA18_mark_bit;
wire           port3_DMA18_inc_pkt_cnt;
wire           port3_DMA19_inc_head;
wire           port3_DMA19_reset_done;
wire           port3_DMA19_mark_bit;
wire           port3_DMA19_inc_pkt_cnt;
wire           port3_DMA20_inc_head;
wire           port3_DMA20_reset_done;
wire           port3_DMA20_mark_bit;
wire           port3_DMA20_inc_pkt_cnt;
wire           port3_DMA21_inc_head;
wire           port3_DMA21_reset_done;
wire           port3_DMA21_mark_bit;
wire           port3_DMA21_inc_pkt_cnt;
wire           port3_DMA22_inc_head;
wire           port3_DMA22_reset_done;
wire           port3_DMA22_mark_bit;
wire           port3_DMA22_inc_pkt_cnt;
wire           port3_DMA23_inc_head;
wire           port3_DMA23_reset_done;
wire           port3_DMA23_mark_bit;
wire           port3_DMA23_inc_pkt_cnt;
wire           port3_ReOrder_UnCorrectError;
wire           port3_StoreForward_UnCorrectError;
wire           port3_ReOrderCorruptECCSingle;
wire           port3_ReOrderCorruptECCDouble;
wire           port3_StoreForwardCorruptECCSingle;
wire           port3_StoreForwardCorruptECCDouble;
wire           port3_Nack_Pkt_Rd;
wire           port3_PacketAssyDead;
wire           port3_ReOrder_Error;
wire           port3_WrTidsInUse;
wire           port3_WrDuplicateTid;
wire           port3_WrUnInitializedTID;
wire           port3_WrTimedoutTids;
wire           port3_WrReOrderStateLogic;
wire           port3_WrReOrderStateControl;
wire           port3_WrReOrderStateData0;
wire           port3_WrReOrderStateData1;
wire           port3_WrReOrderStateData2;
wire           port3_WrReOrderStateData3;
wire           port3_ReOrder_ClearEccError;
wire           port3_WrReOrderEccState;
wire           port3_WrReOrderEccData0;
wire           port3_WrReOrderEccData1;
wire           port3_WrReOrderEccData2;
wire           port3_WrReOrderEccData3;
wire           port3_WrReOrderEccData4;
wire           port3_StoreForward_ClearEccError;
wire           port3_WrStoreForwardEccState;
wire           port3_WrStoreForwardEccData0;
wire           port3_WrStoreForwardEccData1;
wire           port3_WrStoreForwardEccData2;
wire           port3_WrStoreForwardEccData3;
wire           port3_WrStoreForwardEccData4;
wire   [1:0]   port3_Request_Func_Num;
wire   [3:0]   port3_GatherRequestCount;
wire   [3:0]   port3_Anchor_State;
wire   [3:0]   port3_ReOrder_State;
wire   [3:0]   port3_Pointer_State;
wire   [3:0]   port3_PacketAssy_State;
wire   [3:0]   port3_DRR_ArbState;
wire   [3:0]   port3_Mac_Xfer_State;
wire   [3:0]   port3_DataPortReq_State;
wire   [3:0]   port3_MaxReorderNumber;
wire   [4:0]   port3_Request_DMA_Num;
wire   [9:0]   port3_ReOrderWritePtr;
wire   [9:0]   port3_ReOrderReadPtr;
wire   [9:0]   port3_StoreForwardReadPtr;
wire   [9:0]   port3_StoreForwardWritePtr;
wire   [11:0]  port3_PacketRequestCount;
wire   [12:0]  port3_Request_Length;
wire   [13:0]  port3_UpdateDMALength;
wire   [15:0]  port3_PktErrAbortCount;
wire   [15:0]  port3_ReOrdersStuffed;
wire   [15:0]  port3_PacketsTransmitted;
wire   [15:0]  port3_PacketsStuffed;
wire   [15:0]  port3_BytesTransmitted;
wire   [23:0]  port3_UpdateDMANumber;
wire   [23:0]  port3_DMA_Nack_Pkt_Rd;
wire   [23:0]  port3_DMA_List;
wire   [23:0]  port3_ContextActiveList;
wire   [31:0]  port3_ReOrderEccControl;
wire   [31:0]  port3_StoreForwardEccControl;
wire   [31:0]  port3_Sum_prt_state;
wire   [31:0]  port3_TidsInUse;
wire   [31:0]  port3_DuplicateTid;
wire   [31:0]  port3_UnInitializedTID;
wire   [31:0]  port3_TimedoutTids ;
wire   [31:0]  port3_ReOrderStateLogic;
wire   [31:0]  port3_ReOrderStateControl;
wire   [31:0]  port3_ReOrderStateData0;
wire   [31:0]  port3_ReOrderStateData1;
wire   [31:0]  port3_ReOrderStateData2;
wire   [31:0]  port3_ReOrderStateData3;
wire   [31:0]  port3_PioDataIn;
wire   [31:0]  port3_ReOrder_ECC_State;
wire   [31:0]  port3_StoreForward_ECC_State;
wire   [43:0]  port3_Nack_Pkt_Rd_Addr;
wire   [63:0]  port3_Request_Address;
wire   [135:0] port3_PacketAssyEngineDataIn;
wire   [135:0] port3_PacketAssyEngineDataOut;
wire   [135:0] port3_ReOrderEngineDataOut;
wire   [135:0] port3_MacXferEngineDataIn;
wire   [151:0] port3_ReOrderFifoDataOut;
wire   [151:0] port3_ReOrderFifoDataIn;
wire   [151:0] port3_StoreForwardFifoDataOut;
wire   [151:0] port3_StoreForwardFifoDataIn;
wire   [151:0] port3_ReOrder_EccData;
wire   [151:0] port3_StoreForward_EccData;

`else

wire           sram_reset;

`endif

/*--------------------------------------------------------------*/
// Overload Parameters
/*--------------------------------------------------------------*/
parameter REORDER_SIZE_10G = 16,
          REORDER_PTR_10G  = 4,
          REORDER_SIZE_1G  = 8,
          REORDER_PTR_1G   = 3;

/*--------------------------------------------------------------*/
// Module Instantiations
/*--------------------------------------------------------------*/

niu_txc_Reset niu_txc_Reset (
        .SysClk                            (niu_clk),
        .niu_reset_l                       (niu_reset_l),
`ifdef NEPTUNE
`else
        .sram_reset                        (sram_reset),
`endif
        .reset_l                           (reset_l)
       );

niu_txc_mac_ifc niu_txc_mac_ifc (
        .SysClk                            (niu_clk),
        .Reset_L                           (reset_l),
`ifdef NEPTUNE
        .Mac_Txc_Req3                      (mac_txc_req3),
        .Mac_Req3                          (port3_mac_req),
        .Mac_Txc_Req2                      (mac_txc_req2),
        .Mac_Req2                          (port2_mac_req),
`endif
        .Mac_Txc_Req1                      (mac_txc_req1),
        .Mac_Req1                          (port1_mac_req),
        .Mac_Txc_Req0                      (mac_txc_req0),
        .Mac_Req0                          (port0_mac_req)
       );

niu_txc_meta_resp_ifc niu_txc_meta_resp_ifc (
        .SysClk                            (niu_clk),
        .Reset_L                           (reset_l),
        .meta_dmc_resp_ready               (meta_dmc_resp_ready),
        .meta_dmc_resp_complete            (meta_dmc_resp_complete),
        .meta_dmc_resp_transfer_cmpl       (meta_dmc_resp_transfer_cmpl),
        .meta_dmc_data_valid               (meta_dmc_data_valid),
        .meta_dmc_resp_client              (meta_dmc_resp_client),
        .meta_dmc_resp_port_num            (meta_dmc_resp_port_num),
        .meta_dmc_resp_cmd_status          (meta_dmc_resp_cmd_status),
        .meta_dmc_resp_data_status         (meta_dmc_resp_data_status),
        .meta_dmc_resp_dma_num             (meta_dmc_resp_dma_num),
        .meta_dmc_resp_transID             (meta_dmc_resp_transID),
        .meta_dmc_resp_cmd                 (meta_dmc_resp_cmd),
        .meta_dmc_resp_byteenable          (meta_dmc_resp_byteenable),
        .meta_dmc_resp_length              (meta_dmc_resp_length),
        .meta_dmc_resp_address             (meta_dmc_resp_address),
        .meta_dmc_data                     (meta_dmc_data),
        .dmc_meta_resp_accept              (dmc_meta_resp_accept),
        .Port0_TXC_DMC_Resp_Accept         (port0_TXC_DMC_Resp_Accept),
        .Port1_TXC_DMC_Resp_Accept         (port1_TXC_DMC_Resp_Accept),
`ifdef NEPTUNE
        .Port2_TXC_DMC_Resp_Accept         (port2_TXC_DMC_Resp_Accept),
        .Port3_TXC_DMC_Resp_Accept         (port3_TXC_DMC_Resp_Accept),
`else
        .Port2_TXC_DMC_Resp_Accept         (1'b0),
        .Port3_TXC_DMC_Resp_Accept         (1'b0),
`endif
        .DMC_TXC_Resp_Rdy                  (dMC_TXC_Resp_Rdy),
        .DMC_TXC_Resp_Complete             (dMC_TXC_Resp_Complete),
        .DMC_TXC_Trans_Complete            (dMC_TXC_Trans_Complete),
        .DMC_TXC_Resp_Data_Valid           (dMC_TXC_Resp_Data_Valid),
        .DMC_TXC_Resp_Client               (dMC_TXC_Resp_Client),
        .DMC_TXC_Resp_Port_Num             (dMC_TXC_Resp_Port_Num),
        .DMC_TXC_Resp_Cmd_Status           (dMC_TXC_Resp_Cmd_Status),
        .DMC_TXC_Resp_Data_Status          (dMC_TXC_Resp_Data_Status),
        .DMC_TXC_Resp_DMA_Num              (dMC_TXC_Resp_DMA_Num),
        .DMC_TXC_Resp_TransID              (dMC_TXC_Resp_TransID),
        .DMC_TXC_Resp_Cmd                  (dMC_TXC_Resp_Cmd),
        .DMC_TXC_Resp_Data_Length          (dMC_TXC_Resp_Data_Length),
        .DMC_TXC_Resp_ByteEnables          (dMC_TXC_Resp_ByteEnables),
        .DMC_TXC_Resp_Address              (dMC_TXC_Resp_Address),
        .DMC_TXC_Resp_Data                 (dMC_TXC_Resp_Data)
       );

niu_txc_dataFetch niu_txc_dataFetch (
        .SysClk                            (niu_clk),
        .Reset_L                           (reset_l),
        .Txc_Enabled                       (txc_Enabled),

        .DMC_TXC_Tx_Addr_Md                (dmc_txc_tx_addr_md),
        .DMC_TXC_Req_Ack                   (arb1_txc_req_accept),
        .TXC_DMC_Req                       (txc_arb1_req),
        .TXC_DMC_Req_Cmd                   (txc_arb1_req_cmd),
        .TXC_DMC_Req_Func_Num              (txc_arb1_req_func_num),
        .TXC_DMC_Req_Port_Num              (txc_arb1_req_port_num),
        .TXC_DMC_Req_DMA_Num               (txc_arb1_req_dma_num),
        .TXC_DMC_Req_Length                (txc_arb1_req_length),
        .TXC_DMC_Req_Address               (txc_arb1_req_address),

        .Port_Selected                     (port_Selected),

        .Port0_Request                     (port0_Request),
        .Port0_Request_Func_Num            (port0_Request_Func_Num),
        .Port0_Request_DMA_Num             (port0_Request_DMA_Num),
        .Port0_Request_Length              (port0_Request_Length),
        .Port0_Request_Address             (port0_Request_Address),
        .Port1_Request                     (port1_Request),
        .Port1_Request_Func_Num            (port1_Request_Func_Num),
        .Port1_Request_DMA_Num             (port1_Request_DMA_Num),
        .Port1_Request_Length              (port1_Request_Length),
        .Port1_Request_Address             (port1_Request_Address),

`ifdef NEPTUNE
        .Port2_Request                     (port2_Request),
        .Port2_Request_Func_Num            (port2_Request_Func_Num),
        .Port2_Request_DMA_Num             (port2_Request_DMA_Num),
        .Port2_Request_Length              (port2_Request_Length),
        .Port2_Request_Address             (port2_Request_Address),
        .Port3_Request                     (port3_Request),
        .Port3_Request_Func_Num            (port3_Request_Func_Num),
        .Port3_Request_DMA_Num             (port3_Request_DMA_Num),
        .Port3_Request_Length              (port3_Request_Length),
        .Port3_Request_Address             (port3_Request_Address),
`else
        .Port2_Request                     (1'h0),
        .Port2_Request_Func_Num            (2'h0),
        .Port2_Request_DMA_Num             (5'h0),
        .Port2_Request_Length              (13'h0),
        .Port2_Request_Address             (64'h0),
        .Port3_Request                     (1'h0),
        .Port3_Request_Func_Num            (2'h0),
        .Port3_Request_DMA_Num             (5'h0),
        .Port3_Request_Length              (13'h0),
        .Port3_Request_Address             (64'h0),
`endif

        .PortSelect_State                  (portSelect_State),
        .DataFetch_State                   (dataFetch_State)
       );


niu_txc_packetEngine #(REORDER_SIZE_10G,REORDER_PTR_10G) niu_txc_packetEngine0 (
        .SysClk                            (niu_clk),
        .Reset_L                           (reset_l),
        .PacketAssyDead                    (port0_PacketAssyDead),
        .ReOrder_Error                     (port0_ReOrder_Error),
        .Txc_Enabled                       (txc_Enabled),
        .PortIndentifier                   (`PORT_ZERO),
        .EnableGMACMode                    (1'b0),
        .MAC_Enabled                       (port0_Enabled),
        .FlushEngine                       (flushEngine),

        .MAC_Req                           (port0_mac_req),
        .MAC_Ack                           (txc_mac_ack0),
        .MAC_Tag                           (txc_mac_tag0),
        .MAC_Status                        (txc_mac_stat0),
        .MAC_Abort                         (txc_mac_abort0),
        .MAC_Data                          (txc_mac_data0),

        .TidsInUse                         (port0_TidsInUse),
        .DuplicateTid                      (port0_DuplicateTid),
        .UnInitializedTID                  (port0_UnInitializedTID),
        .TimedoutTids                      (port0_TimedoutTids),
        .ReOrderStateLogic                 (port0_ReOrderStateLogic),
        .ReOrderStateControl               (port0_ReOrderStateControl),
        .ReOrderStateData0                 (port0_ReOrderStateData0),
        .ReOrderStateData1                 (port0_ReOrderStateData1),
        .ReOrderStateData2                 (port0_ReOrderStateData2),
        .ReOrderStateData3                 (port0_ReOrderStateData3),
        .WrTidsInUse                       (port0_WrTidsInUse),
        .WrDuplicateTid                    (port0_WrDuplicateTid),
        .WrUnInitializedTID                (port0_WrUnInitializedTID),
        .WrTimedoutTids                    (port0_WrTimedoutTids),
        .WrReOrderStateLogic               (port0_WrReOrderStateLogic),
        .WrReOrderStateControl             (port0_WrReOrderStateControl),
        .WrReOrderStateData0               (port0_WrReOrderStateData0),
        .WrReOrderStateData1               (port0_WrReOrderStateData1),
        .WrReOrderStateData2               (port0_WrReOrderStateData2),
        .WrReOrderStateData3               (port0_WrReOrderStateData3),
        .PioDataIn                         (port0_PioDataIn),

        .ClearStatistics                   (port0_ClearStatistics),
        .WrPacketStuffed                   (port0_WrPacketStuffed),
        .WrPacketXmitted                   (port0_WrPacketXmitted),
        .WrPacketRequested                 (port0_WrPacketRequested),
        .GatherRequestCount                (port0_GatherRequestCount),
        .PacketRequestCount                (port0_PacketRequestCount),
        .PktErrAbortCount                  (port0_PktErrAbortCount),
        .ReOrdersStuffed                   (port0_ReOrdersStuffed),
        .PacketsStuffed                    (port0_PacketsStuffed),
        .PacketsTransmitted                (port0_PacketsTransmitted),
        .BytesTransmitted                  (port0_BytesTransmitted),

        .Pkt_Size_Err                      (txc_dmc_p0_pkt_size_err),
`ifdef NEPTUNE
        .DMA_Pkt_Size_Err                  (txc_dmc_p0_dma_pkt_size_err),
`else
        .DMA_Pkt_Size_Err                  ({dummy_txc_dmc_p0_dma_pkt_size_err,
                                            txc_dmc_p0_dma_pkt_size_err}),
`endif
        .Pkt_Size_Err_Addr                 (txc_dmc_p0_pkt_size_err_addr),

        .Nack_Pkt_Rd                       (port0_Nack_Pkt_Rd),
        .DMA_Nack_Pkt_Rd                   (port0_DMA_Nack_Pkt_Rd),
        .Nack_Pkt_Rd_Addr                  (port0_Nack_Pkt_Rd_Addr),

        .DMA0_Active                       (dmc_txc_dma0_active),
        .DMA0_EofList                      (dmc_txc_dma0_eoflist),
        .DMA0_Error                        (dmc_txc_dma0_error),
        .DMA0_CacheReady                   (dmc_txc_dma0_cacheready),
        .DMA0_Partial                      (dmc_txc_dma0_partial),
        .DMA0_Reset_Scheduled              (dmc_txc_dma0_reset_scheduled),
        .DMA0_GotNxtDesc                   (dmc_txc_dma0_gotnxtdesc),
        .DMA0_Mark                         (dmc_txc_dma0_descriptor[62]),
        .DMA0_SOP                          (dmc_txc_dma0_descriptor[63]),
        .DMA0_Func_Num                     (dmc_txc_dma0_func_num),
        .DMA0_DescList                     (dmc_txc_dma0_descriptor[61:58]),
        .DMA0_Length                       (dmc_txc_dma0_descriptor[56:44]),
        .DMA0_PageHandle                   (dmc_txc_dma0_page_handle),
        .DMA0_Address                      (dmc_txc_dma0_descriptor[43:0]),
        .DMA0_Inc_Head                     (port0_DMA0_inc_head),
        .DMA0_Reset_Done                   (port0_DMA0_reset_done),
        .DMA0_Mark_Bit                     (port0_DMA0_mark_bit),
        .DMA0_Inc_Pkt_Cnt                  (port0_DMA0_inc_pkt_cnt),
        .SetGetNextDescDMA0                (port0_SetGetNextDescDMA0),
        .DMA1_Active                       (dmc_txc_dma1_active),
        .DMA1_EofList                      (dmc_txc_dma1_eoflist),
        .DMA1_Error                        (dmc_txc_dma1_error),
        .DMA1_CacheReady                   (dmc_txc_dma1_cacheready),
        .DMA1_Partial                      (dmc_txc_dma1_partial),
        .DMA1_Reset_Scheduled              (dmc_txc_dma1_reset_scheduled),
        .DMA1_GotNxtDesc                   (dmc_txc_dma1_gotnxtdesc),
        .DMA1_Mark                         (dmc_txc_dma1_descriptor[62]),
        .DMA1_SOP                          (dmc_txc_dma1_descriptor[63]),
        .DMA1_Func_Num                     (dmc_txc_dma1_func_num),
        .DMA1_DescList                     (dmc_txc_dma1_descriptor[61:58]),
        .DMA1_Length                       (dmc_txc_dma1_descriptor[56:44]),
        .DMA1_PageHandle                   (dmc_txc_dma1_page_handle),
        .DMA1_Address                      (dmc_txc_dma1_descriptor[43:0]),
        .DMA1_Inc_Head                     (port0_DMA1_inc_head),
        .DMA1_Reset_Done                   (port0_DMA1_reset_done),
        .DMA1_Mark_Bit                     (port0_DMA1_mark_bit),
        .DMA1_Inc_Pkt_Cnt                  (port0_DMA1_inc_pkt_cnt),
        .SetGetNextDescDMA1                (port0_SetGetNextDescDMA1),
        .DMA2_Active                       (dmc_txc_dma2_active),
        .DMA2_EofList                      (dmc_txc_dma2_eoflist),
        .DMA2_Error                        (dmc_txc_dma2_error),
        .DMA2_CacheReady                   (dmc_txc_dma2_cacheready),
        .DMA2_Partial                      (dmc_txc_dma2_partial),
        .DMA2_Reset_Scheduled              (dmc_txc_dma2_reset_scheduled),
        .DMA2_GotNxtDesc                   (dmc_txc_dma2_gotnxtdesc),
        .DMA2_Mark                         (dmc_txc_dma2_descriptor[62]),
        .DMA2_SOP                          (dmc_txc_dma2_descriptor[63]),
        .DMA2_Func_Num                     (dmc_txc_dma2_func_num),
        .DMA2_DescList                     (dmc_txc_dma2_descriptor[61:58]),
        .DMA2_Length                       (dmc_txc_dma2_descriptor[56:44]),
        .DMA2_PageHandle                   (dmc_txc_dma2_page_handle),
        .DMA2_Address                      (dmc_txc_dma2_descriptor[43:0]),
        .DMA2_Inc_Head                     (port0_DMA2_inc_head),
        .DMA2_Reset_Done                   (port0_DMA2_reset_done),
        .DMA2_Mark_Bit                     (port0_DMA2_mark_bit),
        .DMA2_Inc_Pkt_Cnt                  (port0_DMA2_inc_pkt_cnt),
        .SetGetNextDescDMA2                (port0_SetGetNextDescDMA2),
        .DMA3_Active                       (dmc_txc_dma3_active),
        .DMA3_EofList                      (dmc_txc_dma3_eoflist),
        .DMA3_Error                        (dmc_txc_dma3_error),
        .DMA3_CacheReady                   (dmc_txc_dma3_cacheready),
        .DMA3_Partial                      (dmc_txc_dma3_partial),
        .DMA3_Reset_Scheduled              (dmc_txc_dma3_reset_scheduled),
        .DMA3_GotNxtDesc                   (dmc_txc_dma3_gotnxtdesc),
        .DMA3_Mark                         (dmc_txc_dma3_descriptor[62]),
        .DMA3_SOP                          (dmc_txc_dma3_descriptor[63]),
        .DMA3_Func_Num                     (dmc_txc_dma3_func_num),
        .DMA3_DescList                     (dmc_txc_dma3_descriptor[61:58]),
        .DMA3_Length                       (dmc_txc_dma3_descriptor[56:44]),
        .DMA3_PageHandle                   (dmc_txc_dma3_page_handle),
        .DMA3_Address                      (dmc_txc_dma3_descriptor[43:0]),
        .DMA3_Inc_Head                     (port0_DMA3_inc_head),
        .DMA3_Reset_Done                   (port0_DMA3_reset_done),
        .DMA3_Mark_Bit                     (port0_DMA3_mark_bit),
        .DMA3_Inc_Pkt_Cnt                  (port0_DMA3_inc_pkt_cnt),
        .SetGetNextDescDMA3                (port0_SetGetNextDescDMA3),
        .DMA4_Active                       (dmc_txc_dma4_active),
        .DMA4_EofList                      (dmc_txc_dma4_eoflist),
        .DMA4_Error                        (dmc_txc_dma4_error),
        .DMA4_CacheReady                   (dmc_txc_dma4_cacheready),
        .DMA4_Partial                      (dmc_txc_dma4_partial),
        .DMA4_Reset_Scheduled              (dmc_txc_dma4_reset_scheduled),
        .DMA4_GotNxtDesc                   (dmc_txc_dma4_gotnxtdesc),
        .DMA4_Mark                         (dmc_txc_dma4_descriptor[62]),
        .DMA4_SOP                          (dmc_txc_dma4_descriptor[63]),
        .DMA4_Func_Num                     (dmc_txc_dma4_func_num),
        .DMA4_DescList                     (dmc_txc_dma4_descriptor[61:58]),
        .DMA4_Length                       (dmc_txc_dma4_descriptor[56:44]),
        .DMA4_PageHandle                   (dmc_txc_dma4_page_handle),
        .DMA4_Address                      (dmc_txc_dma4_descriptor[43:0]),
        .DMA4_Inc_Head                     (port0_DMA4_inc_head),
        .DMA4_Reset_Done                   (port0_DMA4_reset_done),
        .DMA4_Mark_Bit                     (port0_DMA4_mark_bit),
        .DMA4_Inc_Pkt_Cnt                  (port0_DMA4_inc_pkt_cnt),
        .SetGetNextDescDMA4                (port0_SetGetNextDescDMA4),
        .DMA5_Active                       (dmc_txc_dma5_active),
        .DMA5_EofList                      (dmc_txc_dma5_eoflist),
        .DMA5_Error                        (dmc_txc_dma5_error),
        .DMA5_CacheReady                   (dmc_txc_dma5_cacheready),
        .DMA5_Partial                      (dmc_txc_dma5_partial),
        .DMA5_Reset_Scheduled              (dmc_txc_dma5_reset_scheduled),
        .DMA5_GotNxtDesc                   (dmc_txc_dma5_gotnxtdesc),
        .DMA5_Mark                         (dmc_txc_dma5_descriptor[62]),
        .DMA5_SOP                          (dmc_txc_dma5_descriptor[63]),
        .DMA5_Func_Num                     (dmc_txc_dma5_func_num),
        .DMA5_DescList                     (dmc_txc_dma5_descriptor[61:58]),
        .DMA5_Length                       (dmc_txc_dma5_descriptor[56:44]),
        .DMA5_PageHandle                   (dmc_txc_dma5_page_handle),
        .DMA5_Address                      (dmc_txc_dma5_descriptor[43:0]),
        .DMA5_Inc_Head                     (port0_DMA5_inc_head),
        .DMA5_Reset_Done                   (port0_DMA5_reset_done),
        .DMA5_Mark_Bit                     (port0_DMA5_mark_bit),
        .DMA5_Inc_Pkt_Cnt                  (port0_DMA5_inc_pkt_cnt),
        .SetGetNextDescDMA5                (port0_SetGetNextDescDMA5),
        .DMA6_Active                       (dmc_txc_dma6_active),
        .DMA6_EofList                      (dmc_txc_dma6_eoflist),
        .DMA6_Error                        (dmc_txc_dma6_error),
        .DMA6_CacheReady                   (dmc_txc_dma6_cacheready),
        .DMA6_Partial                      (dmc_txc_dma6_partial),
        .DMA6_Reset_Scheduled              (dmc_txc_dma6_reset_scheduled),
        .DMA6_GotNxtDesc                   (dmc_txc_dma6_gotnxtdesc),
        .DMA6_Mark                         (dmc_txc_dma6_descriptor[62]),
        .DMA6_SOP                          (dmc_txc_dma6_descriptor[63]),
        .DMA6_Func_Num                     (dmc_txc_dma6_func_num),
        .DMA6_DescList                     (dmc_txc_dma6_descriptor[61:58]),
        .DMA6_Length                       (dmc_txc_dma6_descriptor[56:44]),
        .DMA6_PageHandle                   (dmc_txc_dma6_page_handle),
        .DMA6_Address                      (dmc_txc_dma6_descriptor[43:0]),
        .DMA6_Inc_Head                     (port0_DMA6_inc_head),
        .DMA6_Reset_Done                   (port0_DMA6_reset_done),
        .DMA6_Mark_Bit                     (port0_DMA6_mark_bit),
        .DMA6_Inc_Pkt_Cnt                  (port0_DMA6_inc_pkt_cnt),
        .SetGetNextDescDMA6                (port0_SetGetNextDescDMA6),
        .DMA7_Active                       (dmc_txc_dma7_active),
        .DMA7_EofList                      (dmc_txc_dma7_eoflist),
        .DMA7_Error                        (dmc_txc_dma7_error),
        .DMA7_CacheReady                   (dmc_txc_dma7_cacheready),
        .DMA7_Partial                      (dmc_txc_dma7_partial),
        .DMA7_Reset_Scheduled              (dmc_txc_dma7_reset_scheduled),
        .DMA7_GotNxtDesc                   (dmc_txc_dma7_gotnxtdesc),
        .DMA7_Mark                         (dmc_txc_dma7_descriptor[62]),
        .DMA7_SOP                          (dmc_txc_dma7_descriptor[63]),
        .DMA7_Func_Num                     (dmc_txc_dma7_func_num),
        .DMA7_DescList                     (dmc_txc_dma7_descriptor[61:58]),
        .DMA7_Length                       (dmc_txc_dma7_descriptor[56:44]),
        .DMA7_PageHandle                   (dmc_txc_dma7_page_handle),
        .DMA7_Address                      (dmc_txc_dma7_descriptor[43:0]),
        .DMA7_Inc_Head                     (port0_DMA7_inc_head),
        .DMA7_Reset_Done                   (port0_DMA7_reset_done),
        .DMA7_Mark_Bit                     (port0_DMA7_mark_bit),
        .DMA7_Inc_Pkt_Cnt                  (port0_DMA7_inc_pkt_cnt),
        .SetGetNextDescDMA7                (port0_SetGetNextDescDMA7),
        .DMA8_Active                       (dmc_txc_dma8_active),
        .DMA8_EofList                      (dmc_txc_dma8_eoflist),
        .DMA8_Error                        (dmc_txc_dma8_error),
        .DMA8_CacheReady                   (dmc_txc_dma8_cacheready),
        .DMA8_Partial                      (dmc_txc_dma8_partial),
        .DMA8_Reset_Scheduled              (dmc_txc_dma8_reset_scheduled),
        .DMA8_GotNxtDesc                   (dmc_txc_dma8_gotnxtdesc),
        .DMA8_Mark                         (dmc_txc_dma8_descriptor[62]),
        .DMA8_SOP                          (dmc_txc_dma8_descriptor[63]),
        .DMA8_Func_Num                     (dmc_txc_dma8_func_num),
        .DMA8_DescList                     (dmc_txc_dma8_descriptor[61:58]),
        .DMA8_Length                       (dmc_txc_dma8_descriptor[56:44]),
        .DMA8_PageHandle                   (dmc_txc_dma8_page_handle),
        .DMA8_Address                      (dmc_txc_dma8_descriptor[43:0]),
        .DMA8_Inc_Head                     (port0_DMA8_inc_head),
        .DMA8_Reset_Done                   (port0_DMA8_reset_done),
        .DMA8_Mark_Bit                     (port0_DMA8_mark_bit),
        .DMA8_Inc_Pkt_Cnt                  (port0_DMA8_inc_pkt_cnt),
        .SetGetNextDescDMA8                (port0_SetGetNextDescDMA8),
        .DMA9_Active                       (dmc_txc_dma9_active),
        .DMA9_EofList                      (dmc_txc_dma9_eoflist),
        .DMA9_Error                        (dmc_txc_dma9_error),
        .DMA9_CacheReady                   (dmc_txc_dma9_cacheready),
        .DMA9_Partial                      (dmc_txc_dma9_partial),
        .DMA9_Reset_Scheduled              (dmc_txc_dma9_reset_scheduled),
        .DMA9_GotNxtDesc                   (dmc_txc_dma9_gotnxtdesc),
        .DMA9_Mark                         (dmc_txc_dma9_descriptor[62]),
        .DMA9_SOP                          (dmc_txc_dma9_descriptor[63]),
        .DMA9_Func_Num                     (dmc_txc_dma9_func_num),
        .DMA9_DescList                     (dmc_txc_dma9_descriptor[61:58]),
        .DMA9_Length                       (dmc_txc_dma9_descriptor[56:44]),
        .DMA9_PageHandle                   (dmc_txc_dma9_page_handle),
        .DMA9_Address                      (dmc_txc_dma9_descriptor[43:0]),
        .DMA9_Inc_Head                     (port0_DMA9_inc_head),
        .DMA9_Reset_Done                   (port0_DMA9_reset_done),
        .DMA9_Mark_Bit                     (port0_DMA9_mark_bit),
        .DMA9_Inc_Pkt_Cnt                  (port0_DMA9_inc_pkt_cnt),
        .SetGetNextDescDMA9                (port0_SetGetNextDescDMA9),
        .DMA10_Active                      (dmc_txc_dma10_active),
        .DMA10_EofList                     (dmc_txc_dma10_eoflist),
        .DMA10_Error                       (dmc_txc_dma10_error),
        .DMA10_CacheReady                  (dmc_txc_dma10_cacheready),
        .DMA10_Partial                     (dmc_txc_dma10_partial),
        .DMA10_Reset_Scheduled             (dmc_txc_dma10_reset_scheduled),
        .DMA10_GotNxtDesc                  (dmc_txc_dma10_gotnxtdesc),
        .DMA10_Mark                        (dmc_txc_dma10_descriptor[62]),
        .DMA10_SOP                         (dmc_txc_dma10_descriptor[63]),
        .DMA10_Func_Num                    (dmc_txc_dma10_func_num),
        .DMA10_DescList                    (dmc_txc_dma10_descriptor[61:58]),
        .DMA10_Length                      (dmc_txc_dma10_descriptor[56:44]),
        .DMA10_PageHandle                  (dmc_txc_dma10_page_handle),
        .DMA10_Address                     (dmc_txc_dma10_descriptor[43:0]),
        .DMA10_Inc_Head                    (port0_DMA10_inc_head),
        .DMA10_Reset_Done                  (port0_DMA10_reset_done),
        .DMA10_Mark_Bit                    (port0_DMA10_mark_bit),
        .DMA10_Inc_Pkt_Cnt                 (port0_DMA10_inc_pkt_cnt),
        .SetGetNextDescDMA10               (port0_SetGetNextDescDMA10),
        .DMA11_Active                      (dmc_txc_dma11_active),
        .DMA11_EofList                     (dmc_txc_dma11_eoflist),
        .DMA11_Error                       (dmc_txc_dma11_error),
        .DMA11_CacheReady                  (dmc_txc_dma11_cacheready),
        .DMA11_Partial                     (dmc_txc_dma11_partial),
        .DMA11_Reset_Scheduled             (dmc_txc_dma11_reset_scheduled),
        .DMA11_GotNxtDesc                  (dmc_txc_dma11_gotnxtdesc),
        .DMA11_Mark                        (dmc_txc_dma11_descriptor[62]),
        .DMA11_SOP                         (dmc_txc_dma11_descriptor[63]),
        .DMA11_Func_Num                    (dmc_txc_dma11_func_num),
        .DMA11_DescList                    (dmc_txc_dma11_descriptor[61:58]),
        .DMA11_Length                      (dmc_txc_dma11_descriptor[56:44]),
        .DMA11_PageHandle                  (dmc_txc_dma11_page_handle),
        .DMA11_Address                     (dmc_txc_dma11_descriptor[43:0]),
        .DMA11_Inc_Head                    (port0_DMA11_inc_head),
        .DMA11_Reset_Done                  (port0_DMA11_reset_done),
        .DMA11_Mark_Bit                    (port0_DMA11_mark_bit),
        .DMA11_Inc_Pkt_Cnt                 (port0_DMA11_inc_pkt_cnt),
        .SetGetNextDescDMA11               (port0_SetGetNextDescDMA11),
        .DMA12_Active                      (dmc_txc_dma12_active),
        .DMA12_EofList                     (dmc_txc_dma12_eoflist),
        .DMA12_Error                       (dmc_txc_dma12_error),
        .DMA12_CacheReady                  (dmc_txc_dma12_cacheready),
        .DMA12_Partial                     (dmc_txc_dma12_partial),
        .DMA12_Reset_Scheduled             (dmc_txc_dma12_reset_scheduled),
        .DMA12_GotNxtDesc                  (dmc_txc_dma12_gotnxtdesc),
        .DMA12_Mark                        (dmc_txc_dma12_descriptor[62]),
        .DMA12_SOP                         (dmc_txc_dma12_descriptor[63]),
        .DMA12_Func_Num                    (dmc_txc_dma12_func_num),
        .DMA12_DescList                    (dmc_txc_dma12_descriptor[61:58]),
        .DMA12_Length                      (dmc_txc_dma12_descriptor[56:44]),
        .DMA12_PageHandle                  (dmc_txc_dma12_page_handle),
        .DMA12_Address                     (dmc_txc_dma12_descriptor[43:0]),
        .DMA12_Inc_Head                    (port0_DMA12_inc_head),
        .DMA12_Reset_Done                  (port0_DMA12_reset_done),
        .DMA12_Mark_Bit                    (port0_DMA12_mark_bit),
        .DMA12_Inc_Pkt_Cnt                 (port0_DMA12_inc_pkt_cnt),
        .SetGetNextDescDMA12               (port0_SetGetNextDescDMA12),
        .DMA13_Active                      (dmc_txc_dma13_active),
        .DMA13_EofList                     (dmc_txc_dma13_eoflist),
        .DMA13_Error                       (dmc_txc_dma13_error),
        .DMA13_CacheReady                  (dmc_txc_dma13_cacheready),
        .DMA13_Partial                     (dmc_txc_dma13_partial),
        .DMA13_Reset_Scheduled             (dmc_txc_dma13_reset_scheduled),
        .DMA13_GotNxtDesc                  (dmc_txc_dma13_gotnxtdesc),
        .DMA13_Mark                        (dmc_txc_dma13_descriptor[62]),
        .DMA13_SOP                         (dmc_txc_dma13_descriptor[63]),
        .DMA13_Func_Num                    (dmc_txc_dma13_func_num),
        .DMA13_DescList                    (dmc_txc_dma13_descriptor[61:58]),
        .DMA13_Length                      (dmc_txc_dma13_descriptor[56:44]),
        .DMA13_PageHandle                  (dmc_txc_dma13_page_handle),
        .DMA13_Address                     (dmc_txc_dma13_descriptor[43:0]),
        .DMA13_Inc_Head                    (port0_DMA13_inc_head),
        .DMA13_Reset_Done                  (port0_DMA13_reset_done),
        .DMA13_Mark_Bit                    (port0_DMA13_mark_bit),
        .DMA13_Inc_Pkt_Cnt                 (port0_DMA13_inc_pkt_cnt),
        .SetGetNextDescDMA13               (port0_SetGetNextDescDMA13),
        .DMA14_Active                      (dmc_txc_dma14_active),
        .DMA14_EofList                     (dmc_txc_dma14_eoflist),
        .DMA14_Error                       (dmc_txc_dma14_error),
        .DMA14_CacheReady                  (dmc_txc_dma14_cacheready),
        .DMA14_Partial                     (dmc_txc_dma14_partial),
        .DMA14_Reset_Scheduled             (dmc_txc_dma14_reset_scheduled),
        .DMA14_GotNxtDesc                  (dmc_txc_dma14_gotnxtdesc),
        .DMA14_Mark                        (dmc_txc_dma14_descriptor[62]),
        .DMA14_SOP                         (dmc_txc_dma14_descriptor[63]),
        .DMA14_Func_Num                    (dmc_txc_dma14_func_num),
        .DMA14_DescList                    (dmc_txc_dma14_descriptor[61:58]),
        .DMA14_Length                      (dmc_txc_dma14_descriptor[56:44]),
        .DMA14_PageHandle                  (dmc_txc_dma14_page_handle),
        .DMA14_Address                     (dmc_txc_dma14_descriptor[43:0]),
        .DMA14_Inc_Head                    (port0_DMA14_inc_head),
        .DMA14_Reset_Done                  (port0_DMA14_reset_done),
        .DMA14_Mark_Bit                    (port0_DMA14_mark_bit),
        .DMA14_Inc_Pkt_Cnt                 (port0_DMA14_inc_pkt_cnt),
        .SetGetNextDescDMA14               (port0_SetGetNextDescDMA14),
        .DMA15_Active                      (dmc_txc_dma15_active),
        .DMA15_EofList                     (dmc_txc_dma15_eoflist),
        .DMA15_Error                       (dmc_txc_dma15_error),
        .DMA15_CacheReady                  (dmc_txc_dma15_cacheready),
        .DMA15_Partial                     (dmc_txc_dma15_partial),
        .DMA15_Reset_Scheduled             (dmc_txc_dma15_reset_scheduled),
        .DMA15_GotNxtDesc                  (dmc_txc_dma15_gotnxtdesc),
        .DMA15_Mark                        (dmc_txc_dma15_descriptor[62]),
        .DMA15_SOP                         (dmc_txc_dma15_descriptor[63]),
        .DMA15_Func_Num                    (dmc_txc_dma15_func_num),
        .DMA15_DescList                    (dmc_txc_dma15_descriptor[61:58]),
        .DMA15_Length                      (dmc_txc_dma15_descriptor[56:44]),
        .DMA15_PageHandle                  (dmc_txc_dma15_page_handle),
        .DMA15_Address                     (dmc_txc_dma15_descriptor[43:0]),
        .DMA15_Inc_Head                    (port0_DMA15_inc_head),
        .DMA15_Reset_Done                  (port0_DMA15_reset_done),
        .DMA15_Mark_Bit                    (port0_DMA15_mark_bit),
        .DMA15_Inc_Pkt_Cnt                 (port0_DMA15_inc_pkt_cnt),
        .SetGetNextDescDMA15               (port0_SetGetNextDescDMA15),
        .DMA16_Active                      (dmc_txc_dma16_active),
        .DMA16_EofList                     (dmc_txc_dma16_eoflist),
        .DMA16_Error                       (dmc_txc_dma16_error),
        .DMA16_CacheReady                  (dmc_txc_dma16_cacheready),
        .DMA16_Partial                     (dmc_txc_dma16_partial),
        .DMA16_Reset_Scheduled             (dmc_txc_dma16_reset_scheduled),
        .DMA16_GotNxtDesc                  (dmc_txc_dma16_gotnxtdesc),
        .DMA16_Mark                        (dmc_txc_dma16_descriptor[62]),
        .DMA16_SOP                         (dmc_txc_dma16_descriptor[63]),
        .DMA16_Func_Num                    (dmc_txc_dma16_func_num),
        .DMA16_DescList                    (dmc_txc_dma16_descriptor[61:58]),
        .DMA16_Length                      (dmc_txc_dma16_descriptor[56:44]),
        .DMA16_PageHandle                  (dmc_txc_dma16_page_handle),
        .DMA16_Address                     (dmc_txc_dma16_descriptor[43:0]),
        .DMA16_Inc_Head                    (port0_DMA16_inc_head),
        .DMA16_Reset_Done                  (port0_DMA16_reset_done),
        .DMA16_Mark_Bit                    (port0_DMA16_mark_bit),
        .DMA16_Inc_Pkt_Cnt                 (port0_DMA16_inc_pkt_cnt),
        .SetGetNextDescDMA16               (port0_SetGetNextDescDMA16),
        .DMA17_Active                      (dmc_txc_dma17_active),
        .DMA17_EofList                     (dmc_txc_dma17_eoflist),
        .DMA17_Error                       (dmc_txc_dma17_error),
        .DMA17_CacheReady                  (dmc_txc_dma17_cacheready),
        .DMA17_Partial                     (dmc_txc_dma17_partial),
        .DMA17_Reset_Scheduled             (dmc_txc_dma17_reset_scheduled),
        .DMA17_GotNxtDesc                  (dmc_txc_dma17_gotnxtdesc),
        .DMA17_Mark                        (dmc_txc_dma17_descriptor[62]),
        .DMA17_SOP                         (dmc_txc_dma17_descriptor[63]),
        .DMA17_Func_Num                    (dmc_txc_dma17_func_num),
        .DMA17_DescList                    (dmc_txc_dma17_descriptor[61:58]),
        .DMA17_Length                      (dmc_txc_dma17_descriptor[56:44]),
        .DMA17_PageHandle                  (dmc_txc_dma17_page_handle),
        .DMA17_Address                     (dmc_txc_dma17_descriptor[43:0]),
        .DMA17_Inc_Head                    (port0_DMA17_inc_head),
        .DMA17_Reset_Done                  (port0_DMA17_reset_done),
        .DMA17_Mark_Bit                    (port0_DMA17_mark_bit),
        .DMA17_Inc_Pkt_Cnt                 (port0_DMA17_inc_pkt_cnt),
        .SetGetNextDescDMA17               (port0_SetGetNextDescDMA17),
        .DMA18_Active                      (dmc_txc_dma18_active),
        .DMA18_EofList                     (dmc_txc_dma18_eoflist),
        .DMA18_Error                       (dmc_txc_dma18_error),
        .DMA18_CacheReady                  (dmc_txc_dma18_cacheready),
        .DMA18_Partial                     (dmc_txc_dma18_partial),
        .DMA18_Reset_Scheduled             (dmc_txc_dma18_reset_scheduled),
        .DMA18_GotNxtDesc                  (dmc_txc_dma18_gotnxtdesc),
        .DMA18_Mark                        (dmc_txc_dma18_descriptor[62]),
        .DMA18_SOP                         (dmc_txc_dma18_descriptor[63]),
        .DMA18_Func_Num                    (dmc_txc_dma18_func_num),
        .DMA18_DescList                    (dmc_txc_dma18_descriptor[61:58]),
        .DMA18_Length                      (dmc_txc_dma18_descriptor[56:44]),
        .DMA18_PageHandle                  (dmc_txc_dma18_page_handle),
        .DMA18_Address                     (dmc_txc_dma18_descriptor[43:0]),
        .DMA18_Inc_Head                    (port0_DMA18_inc_head),
        .DMA18_Reset_Done                  (port0_DMA18_reset_done),
        .DMA18_Mark_Bit                    (port0_DMA18_mark_bit),
        .DMA18_Inc_Pkt_Cnt                 (port0_DMA18_inc_pkt_cnt),
        .SetGetNextDescDMA18               (port0_SetGetNextDescDMA18),
        .DMA19_Active                      (dmc_txc_dma19_active),
        .DMA19_EofList                     (dmc_txc_dma19_eoflist),
        .DMA19_Error                       (dmc_txc_dma19_error),
        .DMA19_CacheReady                  (dmc_txc_dma19_cacheready),
        .DMA19_Partial                     (dmc_txc_dma19_partial),
        .DMA19_Reset_Scheduled             (dmc_txc_dma19_reset_scheduled),
        .DMA19_GotNxtDesc                  (dmc_txc_dma19_gotnxtdesc),
        .DMA19_Mark                        (dmc_txc_dma19_descriptor[62]),
        .DMA19_SOP                         (dmc_txc_dma19_descriptor[63]),
        .DMA19_Func_Num                    (dmc_txc_dma19_func_num),
        .DMA19_DescList                    (dmc_txc_dma19_descriptor[61:58]),
        .DMA19_Length                      (dmc_txc_dma19_descriptor[56:44]),
        .DMA19_PageHandle                  (dmc_txc_dma19_page_handle),
        .DMA19_Address                     (dmc_txc_dma19_descriptor[43:0]),
        .DMA19_Inc_Head                    (port0_DMA19_inc_head),
        .DMA19_Reset_Done                  (port0_DMA19_reset_done),
        .DMA19_Mark_Bit                    (port0_DMA19_mark_bit),
        .DMA19_Inc_Pkt_Cnt                 (port0_DMA19_inc_pkt_cnt),
        .SetGetNextDescDMA19               (port0_SetGetNextDescDMA19),
        .DMA20_Active                      (dmc_txc_dma20_active),
        .DMA20_EofList                     (dmc_txc_dma20_eoflist),
        .DMA20_Error                       (dmc_txc_dma20_error),
        .DMA20_CacheReady                  (dmc_txc_dma20_cacheready),
        .DMA20_Partial                     (dmc_txc_dma20_partial),
        .DMA20_Reset_Scheduled             (dmc_txc_dma20_reset_scheduled),
        .DMA20_GotNxtDesc                  (dmc_txc_dma20_gotnxtdesc),
        .DMA20_Mark                        (dmc_txc_dma20_descriptor[62]),
        .DMA20_SOP                         (dmc_txc_dma20_descriptor[63]),
        .DMA20_Func_Num                    (dmc_txc_dma20_func_num),
        .DMA20_DescList                    (dmc_txc_dma20_descriptor[61:58]),
        .DMA20_Length                      (dmc_txc_dma20_descriptor[56:44]),
        .DMA20_PageHandle                  (dmc_txc_dma20_page_handle),
        .DMA20_Address                     (dmc_txc_dma20_descriptor[43:0]),
        .DMA20_Inc_Head                    (port0_DMA20_inc_head),
        .DMA20_Reset_Done                  (port0_DMA20_reset_done),
        .DMA20_Mark_Bit                    (port0_DMA20_mark_bit),
        .DMA20_Inc_Pkt_Cnt                 (port0_DMA20_inc_pkt_cnt),
        .SetGetNextDescDMA20               (port0_SetGetNextDescDMA20),
        .DMA21_Active                      (dmc_txc_dma21_active),
        .DMA21_EofList                     (dmc_txc_dma21_eoflist),
        .DMA21_Error                       (dmc_txc_dma21_error),
        .DMA21_CacheReady                  (dmc_txc_dma21_cacheready),
        .DMA21_Partial                     (dmc_txc_dma21_partial),
        .DMA21_Reset_Scheduled             (dmc_txc_dma21_reset_scheduled),
        .DMA21_GotNxtDesc                  (dmc_txc_dma21_gotnxtdesc),
        .DMA21_Mark                        (dmc_txc_dma21_descriptor[62]),
        .DMA21_SOP                         (dmc_txc_dma21_descriptor[63]),
        .DMA21_Func_Num                    (dmc_txc_dma21_func_num),
        .DMA21_DescList                    (dmc_txc_dma21_descriptor[61:58]),
        .DMA21_Length                      (dmc_txc_dma21_descriptor[56:44]),
        .DMA21_PageHandle                  (dmc_txc_dma21_page_handle),
        .DMA21_Address                     (dmc_txc_dma21_descriptor[43:0]),
        .DMA21_Inc_Head                    (port0_DMA21_inc_head),
        .DMA21_Reset_Done                  (port0_DMA21_reset_done),
        .DMA21_Mark_Bit                    (port0_DMA21_mark_bit),
        .DMA21_Inc_Pkt_Cnt                 (port0_DMA21_inc_pkt_cnt),
        .SetGetNextDescDMA21               (port0_SetGetNextDescDMA21),
        .DMA22_Active                      (dmc_txc_dma22_active),
        .DMA22_EofList                     (dmc_txc_dma22_eoflist),
        .DMA22_Error                       (dmc_txc_dma22_error),
        .DMA22_CacheReady                  (dmc_txc_dma22_cacheready),
        .DMA22_Partial                     (dmc_txc_dma22_partial),
        .DMA22_Reset_Scheduled             (dmc_txc_dma22_reset_scheduled),
        .DMA22_GotNxtDesc                  (dmc_txc_dma22_gotnxtdesc),
        .DMA22_Mark                        (dmc_txc_dma22_descriptor[62]),
        .DMA22_SOP                         (dmc_txc_dma22_descriptor[63]),
        .DMA22_Func_Num                    (dmc_txc_dma22_func_num),
        .DMA22_DescList                    (dmc_txc_dma22_descriptor[61:58]),
        .DMA22_Length                      (dmc_txc_dma22_descriptor[56:44]),
        .DMA22_PageHandle                  (dmc_txc_dma22_page_handle),
        .DMA22_Address                     (dmc_txc_dma22_descriptor[43:0]),
        .DMA22_Inc_Head                    (port0_DMA22_inc_head),
        .DMA22_Reset_Done                  (port0_DMA22_reset_done),
        .DMA22_Mark_Bit                    (port0_DMA22_mark_bit),
        .DMA22_Inc_Pkt_Cnt                 (port0_DMA22_inc_pkt_cnt),
        .SetGetNextDescDMA22               (port0_SetGetNextDescDMA22),
        .DMA23_Active                      (dmc_txc_dma23_active),
        .DMA23_EofList                     (dmc_txc_dma23_eoflist),
        .DMA23_Error                       (dmc_txc_dma23_error),
        .DMA23_CacheReady                  (dmc_txc_dma23_cacheready),
        .DMA23_Partial                     (dmc_txc_dma23_partial),
        .DMA23_Reset_Scheduled             (dmc_txc_dma23_reset_scheduled),
        .DMA23_GotNxtDesc                  (dmc_txc_dma23_gotnxtdesc),
        .DMA23_Mark                        (dmc_txc_dma23_descriptor[62]),
        .DMA23_SOP                         (dmc_txc_dma23_descriptor[63]),
        .DMA23_Func_Num                    (dmc_txc_dma23_func_num),
        .DMA23_DescList                    (dmc_txc_dma23_descriptor[61:58]),
        .DMA23_Length                      (dmc_txc_dma23_descriptor[56:44]),
        .DMA23_PageHandle                  (dmc_txc_dma23_page_handle),
        .DMA23_Address                     (dmc_txc_dma23_descriptor[43:0]),
        .DMA23_Inc_Head                    (port0_DMA23_inc_head),
        .DMA23_Reset_Done                  (port0_DMA23_reset_done),
        .DMA23_Mark_Bit                    (port0_DMA23_mark_bit),
        .DMA23_Inc_Pkt_Cnt                 (port0_DMA23_inc_pkt_cnt),
        .SetGetNextDescDMA23               (port0_SetGetNextDescDMA23),

        .DMA0_NewMaxBurst                  (dma0_NewMaxBurst),
        .DMA1_NewMaxBurst                  (dma1_NewMaxBurst),
        .DMA2_NewMaxBurst                  (dma2_NewMaxBurst),
        .DMA3_NewMaxBurst                  (dma3_NewMaxBurst),
        .DMA4_NewMaxBurst                  (dma4_NewMaxBurst),
        .DMA5_NewMaxBurst                  (dma5_NewMaxBurst),
        .DMA6_NewMaxBurst                  (dma6_NewMaxBurst),
        .DMA7_NewMaxBurst                  (dma7_NewMaxBurst),
        .DMA8_NewMaxBurst                  (dma8_NewMaxBurst),
        .DMA9_NewMaxBurst                  (dma9_NewMaxBurst),
        .DMA10_NewMaxBurst                 (dma10_NewMaxBurst),
        .DMA11_NewMaxBurst                 (dma11_NewMaxBurst),
        .DMA12_NewMaxBurst                 (dma12_NewMaxBurst),
        .DMA13_NewMaxBurst                 (dma13_NewMaxBurst),
        .DMA14_NewMaxBurst                 (dma14_NewMaxBurst),
        .DMA15_NewMaxBurst                 (dma15_NewMaxBurst),
        .DMA16_NewMaxBurst                 (dma16_NewMaxBurst),
        .DMA17_NewMaxBurst                 (dma17_NewMaxBurst),
        .DMA18_NewMaxBurst                 (dma18_NewMaxBurst),
        .DMA19_NewMaxBurst                 (dma19_NewMaxBurst),
        .DMA20_NewMaxBurst                 (dma20_NewMaxBurst),
        .DMA21_NewMaxBurst                 (dma21_NewMaxBurst),
        .DMA22_NewMaxBurst                 (dma22_NewMaxBurst),
        .DMA23_NewMaxBurst                 (dma23_NewMaxBurst),
        .DMA0_MaxBurst                     (dma0_MaxBurst),
        .DMA1_MaxBurst                     (dma1_MaxBurst),
        .DMA2_MaxBurst                     (dma2_MaxBurst),
        .DMA3_MaxBurst                     (dma3_MaxBurst),
        .DMA4_MaxBurst                     (dma4_MaxBurst),
        .DMA5_MaxBurst                     (dma5_MaxBurst),
        .DMA6_MaxBurst                     (dma6_MaxBurst),
        .DMA7_MaxBurst                     (dma7_MaxBurst),
        .DMA8_MaxBurst                     (dma8_MaxBurst),
        .DMA9_MaxBurst                     (dma9_MaxBurst),
        .DMA10_MaxBurst                    (dma10_MaxBurst),
        .DMA11_MaxBurst                    (dma11_MaxBurst),
        .DMA12_MaxBurst                    (dma12_MaxBurst),
        .DMA13_MaxBurst                    (dma13_MaxBurst),
        .DMA14_MaxBurst                    (dma14_MaxBurst),
        .DMA15_MaxBurst                    (dma15_MaxBurst),
        .DMA16_MaxBurst                    (dma16_MaxBurst),
        .DMA17_MaxBurst                    (dma17_MaxBurst),
        .DMA18_MaxBurst                    (dma18_MaxBurst),
        .DMA19_MaxBurst                    (dma19_MaxBurst),
        .DMA20_MaxBurst                    (dma20_MaxBurst),
        .DMA21_MaxBurst                    (dma21_MaxBurst),
        .DMA22_MaxBurst                    (dma22_MaxBurst),
        .DMA23_MaxBurst                    (dma23_MaxBurst),
        .MaxReorderNumber                  (port0_MaxReorderNumber),
        .Port_DMA_List                     (port0_DMA_List),
        .ClrMaxBurst                       (port0_clrMaxBurst),
        .UpdateDMA                         (port0_UpdateDMA),
        .UpdateDMALength                   (port0_UpdateDMALength),
        .UpdateDMANumber                   (port0_UpdateDMANumber),

        .DMC_TXC_Req_Ack                   (arb1_txc_req_accept),
        .DMC_TXC_Req_TransID               (arb1_txc_req_transid),

        .Port_Selected                     (port_Selected[0]),
        .Port_Request                      (port0_Request),
        .Port_Request_Func_Num             (port0_Request_Func_Num),
        .Port_Request_DMA_Num              (port0_Request_DMA_Num),
        .Port_Request_Length               (port0_Request_Length),
        .Port_Request_Address              (port0_Request_Address),

        .DMC_TXC_Resp_Rdy                  (dMC_TXC_Resp_Rdy),
        .DMC_TXC_Resp_Complete             (dMC_TXC_Resp_Complete),
        .DMC_TXC_Trans_Complete            (dMC_TXC_Trans_Complete),
        .DMC_TXC_Resp_Data_Valid           (dMC_TXC_Resp_Data_Valid),
        .DMC_TXC_Resp_Client               (dMC_TXC_Resp_Client),
        .DMC_TXC_Resp_Port_Num             (dMC_TXC_Resp_Port_Num),
        .DMC_TXC_Resp_Cmd_Status           (dMC_TXC_Resp_Cmd_Status),
        .DMC_TXC_Resp_Data_Status          (dMC_TXC_Resp_Data_Status),
        .DMC_TXC_Resp_DMA_Num              (dMC_TXC_Resp_DMA_Num),
        .DMC_TXC_Resp_TransID              (dMC_TXC_Resp_TransID),
        .DMC_TXC_Resp_Cmd                  (dMC_TXC_Resp_Cmd),
        .DMC_TXC_Resp_Data_Length          (dMC_TXC_Resp_Data_Length),
        .DMC_TXC_Resp_ByteEnables          (dMC_TXC_Resp_ByteEnables),
        .DMC_TXC_Resp_Address              (dMC_TXC_Resp_Address),
        .DMC_TXC_Resp_Data                 (dMC_TXC_Resp_Data),
        .TXC_DMC_Resp_Accept               (port0_TXC_DMC_Resp_Accept),

        .ReOrderFifoDataValid              (port0_ReOrderFifoDataValid),
        .ReOrderUnCorrectError             (port0_ReOrder_UnCorrectError),
        .ReOrderEccControl                 (port0_ReOrderEccControl),
        .PacketAssyEngineDataIn            (port0_PacketAssyEngineDataIn),
        .ReOrderCorruptECCSingle           (port0_ReOrderCorruptECCSingle),
        .ReOrderCorruptECCDouble           (port0_ReOrderCorruptECCDouble),
        .ReOrderFifoWrite                  (port0_ReOrderFifoWrite),
        .ReOrderFifoReadStrobe             (port0_ReOrderFifoRead),
        .ReOrderWritePtr                   (port0_ReOrderWritePtr),
        .ReOrderReadPtr                    (port0_ReOrderReadPtr),
        .ReOrderEngineDataOut              (port0_ReOrderEngineDataOut),

        .StoreForwardUnCorrectError        (port0_StoreForward_UnCorrectError),
        .StoreForwardEccControl            (port0_StoreForwardEccControl),
        .MacXferEngineDataIn               (port0_MacXferEngineDataIn),
        .StoreForward_CorruptECCSingle     (port0_StoreForwardCorruptECCSingle),
        .StoreForward_CorruptECCDouble     (port0_StoreForwardCorruptECCDouble),
        .StoreForwardFifoWrite             (port0_StoreForwardFifoWrite),
        .StoreForwardFifoReadStrobe        (port0_StoreForwardFifoRead),
        .StoreForwardWritePtr              (port0_StoreForwardWritePtr),
        .StoreForwardReadPtr               (port0_StoreForwardReadPtr),
        .PacketAssyEngineDataOut           (port0_PacketAssyEngineDataOut),

        .LatchActiveDMA                    (port0_LatchActiveDMA),
        .ContextActiveList                 (port0_ContextActiveList),

        .Anchor_State                      (port0_Anchor_State),
        .ReOrder_State                     (port0_ReOrder_State),
        .Pointer_State                     (port0_Pointer_State),
        .PacketAssy_State                  (port0_PacketAssy_State),
        .DRR_ArbState                      (port0_DRR_ArbState),
        .Mac_Xfer_State                    (port0_Mac_Xfer_State),
        .DataPortReq_State                 (port0_DataPortReq_State),
        .Sum_prt_state                     (port0_Sum_prt_state)
       );


niu_txc_ecc_engine port0_niu_txc_ecc_engine (
        .SysClk                            (niu_clk),
        .Reset_L                           (reset_l),
        .ReOrder_ClearEccError             (port0_ReOrder_ClearEccError),
        .WrReOrderEccState                 (port0_WrReOrderEccState),
        .WrReOrderEccData0                 (port0_WrReOrderEccData0),
        .WrReOrderEccData1                 (port0_WrReOrderEccData1),
        .WrReOrderEccData2                 (port0_WrReOrderEccData2),
        .WrReOrderEccData3                 (port0_WrReOrderEccData3),
        .WrReOrderEccData4                 (port0_WrReOrderEccData4),
        .StoreForward_ClearEccError        (port0_StoreForward_ClearEccError),
        .WrStoreForwardEccState            (port0_WrStoreForwardEccState),
        .WrStoreForwardEccData0            (port0_WrStoreForwardEccData0),
        .WrStoreForwardEccData1            (port0_WrStoreForwardEccData1),
        .WrStoreForwardEccData2            (port0_WrStoreForwardEccData2),
        .WrStoreForwardEccData3            (port0_WrStoreForwardEccData3),
        .WrStoreForwardEccData4            (port0_WrStoreForwardEccData4),
        .PioDataIn                         (port0_PioDataIn),
        .ReOrder_ECC_State                 (port0_ReOrder_ECC_State),
        .ReOrder_EccData                   (port0_ReOrder_EccData),
        .StoreForward_ECC_State            (port0_StoreForward_ECC_State),
        .StoreForward_EccData              (port0_StoreForward_EccData),
        .ReOrder_CorruptECCSingle          (port0_ReOrderCorruptECCSingle),
        .ReOrder_CorruptECCDouble          (port0_ReOrderCorruptECCDouble),
        .ReOrder_FifoRead                  (port0_ReOrderFifoRead),
        .ReOrder_ReadPtr                   (port0_ReOrderReadPtr),
        .ReOrder_FifoDataOut               (port0_ReOrderFifoDataOut),
        .ReOrder_FifoDataValid             (port0_ReOrderFifoDataValid),
        .ReOrder_UnCorrectError            (port0_ReOrder_UnCorrectError),
        .ReOrder_PreECCData                (port0_ReOrderEngineDataOut),
        .ReOrder_PostECCData               (port0_ReOrderFifoDataIn),
        .ReOrder_CorrectedData             (port0_PacketAssyEngineDataIn),
        .StoreForward_CorruptECCSingle     (port0_StoreForwardCorruptECCSingle),
        .StoreForward_CorruptECCDouble     (port0_StoreForwardCorruptECCDouble),
        .StoreForward_FifoRead             (port0_StoreForwardFifoRead),
        .StoreForward_ReadPtr              (port0_StoreForwardReadPtr),
        .StoreForward_FifoDataOut          (port0_StoreForwardFifoDataOut),
        .StoreForward_UnCorrectError       (port0_StoreForward_UnCorrectError),
        .StoreForward_PreECCData           (port0_PacketAssyEngineDataOut),
        .StoreForward_PostECCData          (port0_StoreForwardFifoDataIn),
        .StoreForward_CorrectedData        (port0_MacXferEngineDataIn)
       );


`ifdef NEPTUNE
niu_ram_1024_152 port0_RO_RAM (
        .clk                               (niu_clk),
        .wt_enable                         (port0_ReOrderFifoWrite),
        .cs_rd                             (port0_ReOrderFifoRead),
        .addr_rd                           (port0_ReOrderReadPtr),
        .addr_wt                           (port0_ReOrderWritePtr),
        .data_inp                          (port0_ReOrderFifoDataIn),
        .data_out                          (port0_ReOrderFifoDataOut)
       );

niu_ram_640_152 port0_SF_RAM (
        .clk                               (niu_clk),
        .wt_enable                         (port0_StoreForwardFifoWrite),
        .cs_rd                             (port0_StoreForwardFifoRead),
        .addr_rd                           (port0_StoreForwardReadPtr),
        .addr_wt                           (port0_StoreForwardWritePtr),
        .data_inp                          (port0_StoreForwardFifoDataIn),
        .data_out                          (port0_StoreForwardFifoDataOut)
       );
`else

niu_mb1 niu_txe0_1024_152_membist (
        .rst_l                             (reset_l),
        .tcu_mbist_user_mode               (tcu_mbist_user_mode),
        .niu_mb1_xmit_store_rd_en          (rtx_txc_txe0_mb1_xmit_store_rd_en),
        .niu_mb1_xmit_store_wr_en          (rtx_txc_txe0_mb1_xmit_store_wr_en),
        .niu_mb1_xmit_realign_rd_en      (rtx_txc_txe0_mb1_xmit_realign_rd_en),
        .niu_mb1_xmit_realign_wr_en      (rtx_txc_txe0_mb1_xmit_realign_wr_en),
        .niu_mb1_addr                      (rtx_txc_txe0_mb1_addr),
        .niu_mb1_wdata                     (rtx_txc_txe0_mb1_wdata),
        .niu_mb1_run                       (rtx_txc_txe0_mb1_run),
        .niu_mb1_xmit_store_data_out       (port0_StoreForwardFifoDataOut),
        .niu_mb1_xmit_realign_data_out     (port0_ReOrderFifoDataOut),
        .tcu_mbist_bisi_en                 (tcu_mbist_bisi_en),
        .tcu_niu_mbist_start_1             (tcu_rtx_txc_txe0_mbist_start),
        .niu_tcu_mbist_fail_1              (rtx_txc_txe0_tcu_mbist_fail),
        .niu_tcu_mbist_done_1              (rtx_txc_txe0_tcu_mbist_done),
        .l1clk                             (niu_clk),
        .mb1_scan_out                      (rtx_txc_txe0_mbist_scan_out),
        .mb1_scan_in                       (rtx_txc_txe0_mbist_scan_in),
        .mb1_dmo_dout                      (rtx_txc_txe0_dmo_dout),
        .tcu_aclk                          (tcu_aclk),
        .tcu_bclk                          (tcu_bclk)
       );

wire [151:0] concate_rtx_txc_txe0_mb1_wdata;

assign concate_rtx_txc_txe0_mb1_wdata
                             = {rtx_txc_txe0_mb1_wdata, rtx_txc_txe0_mb1_wdata,
                                rtx_txc_txe0_mb1_wdata, rtx_txc_txe0_mb1_wdata,
                                rtx_txc_txe0_mb1_wdata, rtx_txc_txe0_mb1_wdata,
                                rtx_txc_txe0_mb1_wdata, rtx_txc_txe0_mb1_wdata,
                                rtx_txc_txe0_mb1_wdata, rtx_txc_txe0_mb1_wdata,
                                rtx_txc_txe0_mb1_wdata, rtx_txc_txe0_mb1_wdata,
                                rtx_txc_txe0_mb1_wdata, rtx_txc_txe0_mb1_wdata,
                                rtx_txc_txe0_mb1_wdata, rtx_txc_txe0_mb1_wdata,
                                rtx_txc_txe0_mb1_wdata, rtx_txc_txe0_mb1_wdata,
                                rtx_txc_txe0_mb1_wdata
                               };

niu_ram_1024_152 port0_RO_RAM (
        .clk                               (iol2clk),
        .reset                             (sram_reset),
        .tcu_aclk                          (tcu_aclk),
        .tcu_bclk                          (tcu_bclk),
        .tcu_se_scancollar_in              (tcu_se_scancollar_in),
        .tcu_se_scancollar_out             (tcu_se_scancollar_out),
        .tcu_scan_en                       (tcu_scan_en),
        .tcu_array_wr_inhibit              (tcu_array_wr_inhibit),
        .scan_in                           (1'b0),
        .scan_out                          (),
        .hdr_sram_rvalue                   (hdr_sram_rvalue_txc0_re),
        .hdr_sram_rid                      (hdr_sram_rid_txc0_re),
        .hdr_sram_wr_en                    (hdr_sram_wr_en_txc0_re),
        .hdr_sram_red_clr                  (hdr_sram_red_clr_txc0_re),
        .sram_hdr_read_data                (sram_hdr_read_data_txc0_re),

        .mbi_wdata                         (concate_rtx_txc_txe0_mb1_wdata),
        .mbi_rd_adr                        (rtx_txc_txe0_mb1_addr),
        .mbi_wr_adr                        (rtx_txc_txe0_mb1_addr),
        .mbi_wr_en                        (rtx_txc_txe0_mb1_xmit_realign_wr_en),
        .mbi_rd_en                        (rtx_txc_txe0_mb1_xmit_realign_rd_en),
        .mbi_run                           (rtx_txc_txe0_mb1_run),
        .l2clk_2x                          (l2clk_2x),
        .wt_enable                         (port0_ReOrderFifoWrite),
        .cs_rd                             (port0_ReOrderFifoRead),
        .addr_rd                           (port0_ReOrderReadPtr),
        .addr_wt                           (port0_ReOrderWritePtr),
        .data_inp                          (port0_ReOrderFifoDataIn),
        .data_out                          (port0_ReOrderFifoDataOut)
       );

niu_ram_1024_152 port0_SF_RAM (
        .clk                               (iol2clk),
        .reset                             (sram_reset),
        .tcu_aclk                          (tcu_aclk),
        .tcu_bclk                          (tcu_bclk),
        .tcu_se_scancollar_in              (tcu_se_scancollar_in),
        .tcu_se_scancollar_out             (tcu_se_scancollar_out),
        .tcu_scan_en                       (tcu_scan_en),
        .tcu_array_wr_inhibit              (tcu_array_wr_inhibit),
        .scan_in                           (1'b0),
        .scan_out                          (),
        .hdr_sram_rvalue                   (hdr_sram_rvalue_txc0_st),
        .hdr_sram_rid                      (hdr_sram_rid_txc0_st),
        .hdr_sram_wr_en                    (hdr_sram_wr_en_txc0_st),
        .hdr_sram_red_clr                  (hdr_sram_red_clr_txc0_st),
        .sram_hdr_read_data                (sram_hdr_read_data_txc0_st),

        .mbi_wdata                         (concate_rtx_txc_txe0_mb1_wdata),
        .mbi_rd_adr                        (rtx_txc_txe0_mb1_addr),
        .mbi_wr_adr                        (rtx_txc_txe0_mb1_addr),
        .mbi_wr_en                         (rtx_txc_txe0_mb1_xmit_store_wr_en),
        .mbi_rd_en                         (rtx_txc_txe0_mb1_xmit_store_rd_en),
        .mbi_run                           (rtx_txc_txe0_mb1_run),
        .l2clk_2x                          (l2clk_2x),
        .wt_enable                         (port0_StoreForwardFifoWrite),
        .cs_rd                             (port0_StoreForwardFifoRead),
        .addr_rd                           (port0_StoreForwardReadPtr),
        .addr_wt                           (port0_StoreForwardWritePtr),
        .data_inp                          (port0_StoreForwardFifoDataIn),
        .data_out                          (port0_StoreForwardFifoDataOut)
       );
`endif


niu_txc_packetEngine #(REORDER_SIZE_10G,REORDER_PTR_10G) niu_txc_packetEngine1 (
        .SysClk                            (niu_clk),
        .Reset_L                           (reset_l),
        .PacketAssyDead                    (port1_PacketAssyDead),
        .ReOrder_Error                     (port1_ReOrder_Error),
        .Txc_Enabled                       (txc_Enabled),
        .PortIndentifier                   (`PORT_ONE),
        .EnableGMACMode                    (1'b0),
        .MAC_Enabled                       (port1_Enabled),
        .FlushEngine                       (flushEngine),

        .MAC_Req                           (port1_mac_req),
        .MAC_Ack                           (txc_mac_ack1),
        .MAC_Tag                           (txc_mac_tag1),
        .MAC_Status                        (txc_mac_stat1),
        .MAC_Abort                         (txc_mac_abort1),
        .MAC_Data                          (txc_mac_data1),

        .TidsInUse                         (port1_TidsInUse),
        .DuplicateTid                      (port1_DuplicateTid),
        .UnInitializedTID                  (port1_UnInitializedTID),
        .TimedoutTids                      (port1_TimedoutTids),
        .ReOrderStateLogic                 (port1_ReOrderStateLogic),
        .ReOrderStateControl               (port1_ReOrderStateControl),
        .ReOrderStateData0                 (port1_ReOrderStateData0),
        .ReOrderStateData1                 (port1_ReOrderStateData1),
        .ReOrderStateData2                 (port1_ReOrderStateData2),
        .ReOrderStateData3                 (port1_ReOrderStateData3),
        .WrTidsInUse                       (port1_WrTidsInUse),
        .WrDuplicateTid                    (port1_WrDuplicateTid),
        .WrUnInitializedTID                (port1_WrUnInitializedTID),
        .WrTimedoutTids                    (port1_WrTimedoutTids),
        .WrReOrderStateLogic               (port1_WrReOrderStateLogic),
        .WrReOrderStateControl             (port1_WrReOrderStateControl),
        .WrReOrderStateData0               (port1_WrReOrderStateData0),
        .WrReOrderStateData1               (port1_WrReOrderStateData1),
        .WrReOrderStateData2               (port1_WrReOrderStateData2),
        .WrReOrderStateData3               (port1_WrReOrderStateData3),
        .PioDataIn                         (port1_PioDataIn),

        .ClearStatistics                   (port1_ClearStatistics),
        .WrPacketStuffed                   (port1_WrPacketStuffed),
        .WrPacketXmitted                   (port1_WrPacketXmitted),
        .WrPacketRequested                 (port1_WrPacketRequested),
        .GatherRequestCount                (port1_GatherRequestCount),
        .PacketRequestCount                (port1_PacketRequestCount),
        .PktErrAbortCount                  (port1_PktErrAbortCount),
        .ReOrdersStuffed                   (port1_ReOrdersStuffed),
        .PacketsStuffed                    (port1_PacketsStuffed),
        .PacketsTransmitted                (port1_PacketsTransmitted),
        .BytesTransmitted                  (port1_BytesTransmitted),

        .Pkt_Size_Err                      (txc_dmc_p1_pkt_size_err),
`ifdef NEPTUNE
        .DMA_Pkt_Size_Err                  (txc_dmc_p1_dma_pkt_size_err),
`else
        .DMA_Pkt_Size_Err                  ({dummy_txc_dmc_p1_dma_pkt_size_err,
                                            txc_dmc_p1_dma_pkt_size_err}),
`endif
        .Pkt_Size_Err_Addr                 (txc_dmc_p1_pkt_size_err_addr),

        .Nack_Pkt_Rd                       (port1_Nack_Pkt_Rd),
        .DMA_Nack_Pkt_Rd                   (port1_DMA_Nack_Pkt_Rd),
        .Nack_Pkt_Rd_Addr                  (port1_Nack_Pkt_Rd_Addr),

        .DMA0_Active                       (dmc_txc_dma0_active),
        .DMA0_EofList                      (dmc_txc_dma0_eoflist),
        .DMA0_Error                        (dmc_txc_dma0_error),
        .DMA0_CacheReady                   (dmc_txc_dma0_cacheready),
        .DMA0_Partial                      (dmc_txc_dma0_partial),
        .DMA0_Reset_Scheduled              (dmc_txc_dma0_reset_scheduled),
        .DMA0_GotNxtDesc                   (dmc_txc_dma0_gotnxtdesc),
        .DMA0_Mark                         (dmc_txc_dma0_descriptor[62]),
        .DMA0_SOP                          (dmc_txc_dma0_descriptor[63]),
        .DMA0_Func_Num                     (dmc_txc_dma0_func_num),
        .DMA0_DescList                     (dmc_txc_dma0_descriptor[61:58]),
        .DMA0_Length                       (dmc_txc_dma0_descriptor[56:44]),
        .DMA0_PageHandle                   (dmc_txc_dma0_page_handle),
        .DMA0_Address                      (dmc_txc_dma0_descriptor[43:0]),
        .DMA0_Inc_Head                     (port1_DMA0_inc_head),
        .DMA0_Reset_Done                   (port1_DMA0_reset_done),
        .DMA0_Mark_Bit                     (port1_DMA0_mark_bit),
        .DMA0_Inc_Pkt_Cnt                  (port1_DMA0_inc_pkt_cnt),
        .SetGetNextDescDMA0                (port1_SetGetNextDescDMA0),
        .DMA1_Active                       (dmc_txc_dma1_active),
        .DMA1_EofList                      (dmc_txc_dma1_eoflist),
        .DMA1_Error                        (dmc_txc_dma1_error),
        .DMA1_CacheReady                   (dmc_txc_dma1_cacheready),
        .DMA1_Partial                      (dmc_txc_dma1_partial),
        .DMA1_Reset_Scheduled              (dmc_txc_dma1_reset_scheduled),
        .DMA1_GotNxtDesc                   (dmc_txc_dma1_gotnxtdesc),
        .DMA1_Mark                         (dmc_txc_dma1_descriptor[62]),
        .DMA1_SOP                          (dmc_txc_dma1_descriptor[63]),
        .DMA1_Func_Num                     (dmc_txc_dma1_func_num),
        .DMA1_DescList                     (dmc_txc_dma1_descriptor[61:58]),
        .DMA1_Length                       (dmc_txc_dma1_descriptor[56:44]),
        .DMA1_PageHandle                   (dmc_txc_dma1_page_handle),
        .DMA1_Address                      (dmc_txc_dma1_descriptor[43:0]),
        .DMA1_Inc_Head                     (port1_DMA1_inc_head),
        .DMA1_Reset_Done                   (port1_DMA1_reset_done),
        .DMA1_Mark_Bit                     (port1_DMA1_mark_bit),
        .DMA1_Inc_Pkt_Cnt                  (port1_DMA1_inc_pkt_cnt),
        .SetGetNextDescDMA1                (port1_SetGetNextDescDMA1),
        .DMA2_Active                       (dmc_txc_dma2_active),
        .DMA2_EofList                      (dmc_txc_dma2_eoflist),
        .DMA2_Error                        (dmc_txc_dma2_error),
        .DMA2_CacheReady                   (dmc_txc_dma2_cacheready),
        .DMA2_Partial                      (dmc_txc_dma2_partial),
        .DMA2_Reset_Scheduled              (dmc_txc_dma2_reset_scheduled),
        .DMA2_GotNxtDesc                   (dmc_txc_dma2_gotnxtdesc),
        .DMA2_Mark                         (dmc_txc_dma2_descriptor[62]),
        .DMA2_SOP                          (dmc_txc_dma2_descriptor[63]),
        .DMA2_Func_Num                     (dmc_txc_dma2_func_num),
        .DMA2_DescList                     (dmc_txc_dma2_descriptor[61:58]),
        .DMA2_Length                       (dmc_txc_dma2_descriptor[56:44]),
        .DMA2_PageHandle                   (dmc_txc_dma2_page_handle),
        .DMA2_Address                      (dmc_txc_dma2_descriptor[43:0]),
        .DMA2_Inc_Head                     (port1_DMA2_inc_head),
        .DMA2_Reset_Done                   (port1_DMA2_reset_done),
        .DMA2_Mark_Bit                     (port1_DMA2_mark_bit),
        .DMA2_Inc_Pkt_Cnt                  (port1_DMA2_inc_pkt_cnt),
        .SetGetNextDescDMA2                (port1_SetGetNextDescDMA2),
        .DMA3_Active                       (dmc_txc_dma3_active),
        .DMA3_EofList                      (dmc_txc_dma3_eoflist),
        .DMA3_Error                        (dmc_txc_dma3_error),
        .DMA3_CacheReady                   (dmc_txc_dma3_cacheready),
        .DMA3_Partial                      (dmc_txc_dma3_partial),
        .DMA3_Reset_Scheduled              (dmc_txc_dma3_reset_scheduled),
        .DMA3_GotNxtDesc                   (dmc_txc_dma3_gotnxtdesc),
        .DMA3_Mark                         (dmc_txc_dma3_descriptor[62]),
        .DMA3_SOP                          (dmc_txc_dma3_descriptor[63]),
        .DMA3_Func_Num                     (dmc_txc_dma3_func_num),
        .DMA3_DescList                     (dmc_txc_dma3_descriptor[61:58]),
        .DMA3_Length                       (dmc_txc_dma3_descriptor[56:44]),
        .DMA3_PageHandle                   (dmc_txc_dma3_page_handle),
        .DMA3_Address                      (dmc_txc_dma3_descriptor[43:0]),
        .DMA3_Inc_Head                     (port1_DMA3_inc_head),
        .DMA3_Reset_Done                   (port1_DMA3_reset_done),
        .DMA3_Mark_Bit                     (port1_DMA3_mark_bit),
        .DMA3_Inc_Pkt_Cnt                  (port1_DMA3_inc_pkt_cnt),
        .SetGetNextDescDMA3                (port1_SetGetNextDescDMA3),
        .DMA4_Active                       (dmc_txc_dma4_active),
        .DMA4_EofList                      (dmc_txc_dma4_eoflist),
        .DMA4_Error                        (dmc_txc_dma4_error),
        .DMA4_CacheReady                   (dmc_txc_dma4_cacheready),
        .DMA4_Partial                      (dmc_txc_dma4_partial),
        .DMA4_Reset_Scheduled              (dmc_txc_dma4_reset_scheduled),
        .DMA4_GotNxtDesc                   (dmc_txc_dma4_gotnxtdesc),
        .DMA4_Mark                         (dmc_txc_dma4_descriptor[62]),
        .DMA4_SOP                          (dmc_txc_dma4_descriptor[63]),
        .DMA4_Func_Num                     (dmc_txc_dma4_func_num),
        .DMA4_DescList                     (dmc_txc_dma4_descriptor[61:58]),
        .DMA4_Length                       (dmc_txc_dma4_descriptor[56:44]),
        .DMA4_PageHandle                   (dmc_txc_dma4_page_handle),
        .DMA4_Address                      (dmc_txc_dma4_descriptor[43:0]),
        .DMA4_Inc_Head                     (port1_DMA4_inc_head),
        .DMA4_Reset_Done                   (port1_DMA4_reset_done),
        .DMA4_Mark_Bit                     (port1_DMA4_mark_bit),
        .DMA4_Inc_Pkt_Cnt                  (port1_DMA4_inc_pkt_cnt),
        .SetGetNextDescDMA4                (port1_SetGetNextDescDMA4),
        .DMA5_Active                       (dmc_txc_dma5_active),
        .DMA5_EofList                      (dmc_txc_dma5_eoflist),
        .DMA5_Error                        (dmc_txc_dma5_error),
        .DMA5_CacheReady                   (dmc_txc_dma5_cacheready),
        .DMA5_Partial                      (dmc_txc_dma5_partial),
        .DMA5_Reset_Scheduled              (dmc_txc_dma5_reset_scheduled),
        .DMA5_GotNxtDesc                   (dmc_txc_dma5_gotnxtdesc),
        .DMA5_Mark                         (dmc_txc_dma5_descriptor[62]),
        .DMA5_SOP                          (dmc_txc_dma5_descriptor[63]),
        .DMA5_Func_Num                     (dmc_txc_dma5_func_num),
        .DMA5_DescList                     (dmc_txc_dma5_descriptor[61:58]),
        .DMA5_Length                       (dmc_txc_dma5_descriptor[56:44]),
        .DMA5_PageHandle                   (dmc_txc_dma5_page_handle),
        .DMA5_Address                      (dmc_txc_dma5_descriptor[43:0]),
        .DMA5_Inc_Head                     (port1_DMA5_inc_head),
        .DMA5_Reset_Done                   (port1_DMA5_reset_done),
        .DMA5_Mark_Bit                     (port1_DMA5_mark_bit),
        .DMA5_Inc_Pkt_Cnt                  (port1_DMA5_inc_pkt_cnt),
        .SetGetNextDescDMA5                (port1_SetGetNextDescDMA5),
        .DMA6_Active                       (dmc_txc_dma6_active),
        .DMA6_EofList                      (dmc_txc_dma6_eoflist),
        .DMA6_Error                        (dmc_txc_dma6_error),
        .DMA6_CacheReady                   (dmc_txc_dma6_cacheready),
        .DMA6_Partial                      (dmc_txc_dma6_partial),
        .DMA6_Reset_Scheduled              (dmc_txc_dma6_reset_scheduled),
        .DMA6_GotNxtDesc                   (dmc_txc_dma6_gotnxtdesc),
        .DMA6_Mark                         (dmc_txc_dma6_descriptor[62]),
        .DMA6_SOP                          (dmc_txc_dma6_descriptor[63]),
        .DMA6_Func_Num                     (dmc_txc_dma6_func_num),
        .DMA6_DescList                     (dmc_txc_dma6_descriptor[61:58]),
        .DMA6_Length                       (dmc_txc_dma6_descriptor[56:44]),
        .DMA6_PageHandle                   (dmc_txc_dma6_page_handle),
        .DMA6_Address                      (dmc_txc_dma6_descriptor[43:0]),
        .DMA6_Inc_Head                     (port1_DMA6_inc_head),
        .DMA6_Reset_Done                   (port1_DMA6_reset_done),
        .DMA6_Mark_Bit                     (port1_DMA6_mark_bit),
        .DMA6_Inc_Pkt_Cnt                  (port1_DMA6_inc_pkt_cnt),
        .SetGetNextDescDMA6                (port1_SetGetNextDescDMA6),
        .DMA7_Active                       (dmc_txc_dma7_active),
        .DMA7_EofList                      (dmc_txc_dma7_eoflist),
        .DMA7_Error                        (dmc_txc_dma7_error),
        .DMA7_CacheReady                   (dmc_txc_dma7_cacheready),
        .DMA7_Partial                      (dmc_txc_dma7_partial),
        .DMA7_Reset_Scheduled              (dmc_txc_dma7_reset_scheduled),
        .DMA7_GotNxtDesc                   (dmc_txc_dma7_gotnxtdesc),
        .DMA7_Mark                         (dmc_txc_dma7_descriptor[62]),
        .DMA7_SOP                          (dmc_txc_dma7_descriptor[63]),
        .DMA7_Func_Num                     (dmc_txc_dma7_func_num),
        .DMA7_DescList                     (dmc_txc_dma7_descriptor[61:58]),
        .DMA7_Length                       (dmc_txc_dma7_descriptor[56:44]),
        .DMA7_PageHandle                   (dmc_txc_dma7_page_handle),
        .DMA7_Address                      (dmc_txc_dma7_descriptor[43:0]),
        .DMA7_Inc_Head                     (port1_DMA7_inc_head),
        .DMA7_Reset_Done                   (port1_DMA7_reset_done),
        .DMA7_Mark_Bit                     (port1_DMA7_mark_bit),
        .DMA7_Inc_Pkt_Cnt                  (port1_DMA7_inc_pkt_cnt),
        .SetGetNextDescDMA7                (port1_SetGetNextDescDMA7),
        .DMA8_Active                       (dmc_txc_dma8_active),
        .DMA8_EofList                      (dmc_txc_dma8_eoflist),
        .DMA8_Error                        (dmc_txc_dma8_error),
        .DMA8_CacheReady                   (dmc_txc_dma8_cacheready),
        .DMA8_Partial                      (dmc_txc_dma8_partial),
        .DMA8_Reset_Scheduled              (dmc_txc_dma8_reset_scheduled),
        .DMA8_GotNxtDesc                   (dmc_txc_dma8_gotnxtdesc),
        .DMA8_Mark                         (dmc_txc_dma8_descriptor[62]),
        .DMA8_SOP                          (dmc_txc_dma8_descriptor[63]),
        .DMA8_Func_Num                     (dmc_txc_dma8_func_num),
        .DMA8_DescList                     (dmc_txc_dma8_descriptor[61:58]),
        .DMA8_Length                       (dmc_txc_dma8_descriptor[56:44]),
        .DMA8_PageHandle                   (dmc_txc_dma8_page_handle),
        .DMA8_Address                      (dmc_txc_dma8_descriptor[43:0]),
        .DMA8_Inc_Head                     (port1_DMA8_inc_head),
        .DMA8_Reset_Done                   (port1_DMA8_reset_done),
        .DMA8_Mark_Bit                     (port1_DMA8_mark_bit),
        .DMA8_Inc_Pkt_Cnt                  (port1_DMA8_inc_pkt_cnt),
        .SetGetNextDescDMA8                (port1_SetGetNextDescDMA8),
        .DMA9_Active                       (dmc_txc_dma9_active),
        .DMA9_EofList                      (dmc_txc_dma9_eoflist),
        .DMA9_Error                        (dmc_txc_dma9_error),
        .DMA9_CacheReady                   (dmc_txc_dma9_cacheready),
        .DMA9_Partial                      (dmc_txc_dma9_partial),
        .DMA9_Reset_Scheduled              (dmc_txc_dma9_reset_scheduled),
        .DMA9_GotNxtDesc                   (dmc_txc_dma9_gotnxtdesc),
        .DMA9_Mark                         (dmc_txc_dma9_descriptor[62]),
        .DMA9_SOP                          (dmc_txc_dma9_descriptor[63]),
        .DMA9_Func_Num                     (dmc_txc_dma9_func_num),
        .DMA9_DescList                     (dmc_txc_dma9_descriptor[61:58]),
        .DMA9_Length                       (dmc_txc_dma9_descriptor[56:44]),
        .DMA9_PageHandle                   (dmc_txc_dma9_page_handle),
        .DMA9_Address                      (dmc_txc_dma9_descriptor[43:0]),
        .DMA9_Inc_Head                     (port1_DMA9_inc_head),
        .DMA9_Reset_Done                   (port1_DMA9_reset_done),
        .DMA9_Mark_Bit                     (port1_DMA9_mark_bit),
        .DMA9_Inc_Pkt_Cnt                  (port1_DMA9_inc_pkt_cnt),
        .SetGetNextDescDMA9                (port1_SetGetNextDescDMA9),
        .DMA10_Active                      (dmc_txc_dma10_active),
        .DMA10_EofList                     (dmc_txc_dma10_eoflist),
        .DMA10_Error                       (dmc_txc_dma10_error),
        .DMA10_CacheReady                  (dmc_txc_dma10_cacheready),
        .DMA10_Partial                     (dmc_txc_dma10_partial),
        .DMA10_Reset_Scheduled             (dmc_txc_dma10_reset_scheduled),
        .DMA10_GotNxtDesc                  (dmc_txc_dma10_gotnxtdesc),
        .DMA10_Mark                        (dmc_txc_dma10_descriptor[62]),
        .DMA10_SOP                         (dmc_txc_dma10_descriptor[63]),
        .DMA10_Func_Num                    (dmc_txc_dma10_func_num),
        .DMA10_DescList                    (dmc_txc_dma10_descriptor[61:58]),
        .DMA10_Length                      (dmc_txc_dma10_descriptor[56:44]),
        .DMA10_PageHandle                  (dmc_txc_dma10_page_handle),
        .DMA10_Address                     (dmc_txc_dma10_descriptor[43:0]),
        .DMA10_Inc_Head                    (port1_DMA10_inc_head),
        .DMA10_Reset_Done                  (port1_DMA10_reset_done),
        .DMA10_Mark_Bit                    (port1_DMA10_mark_bit),
        .DMA10_Inc_Pkt_Cnt                 (port1_DMA10_inc_pkt_cnt),
        .SetGetNextDescDMA10               (port1_SetGetNextDescDMA10),
        .DMA11_Active                      (dmc_txc_dma11_active),
        .DMA11_EofList                     (dmc_txc_dma11_eoflist),
        .DMA11_Error                       (dmc_txc_dma11_error),
        .DMA11_CacheReady                  (dmc_txc_dma11_cacheready),
        .DMA11_Partial                     (dmc_txc_dma11_partial),
        .DMA11_Reset_Scheduled             (dmc_txc_dma11_reset_scheduled),
        .DMA11_GotNxtDesc                  (dmc_txc_dma11_gotnxtdesc),
        .DMA11_Mark                        (dmc_txc_dma11_descriptor[62]),
        .DMA11_SOP                         (dmc_txc_dma11_descriptor[63]),
        .DMA11_Func_Num                    (dmc_txc_dma11_func_num),
        .DMA11_DescList                    (dmc_txc_dma11_descriptor[61:58]),
        .DMA11_Length                      (dmc_txc_dma11_descriptor[56:44]),
        .DMA11_PageHandle                  (dmc_txc_dma11_page_handle),
        .DMA11_Address                     (dmc_txc_dma11_descriptor[43:0]),
        .DMA11_Inc_Head                    (port1_DMA11_inc_head),
        .DMA11_Reset_Done                  (port1_DMA11_reset_done),
        .DMA11_Mark_Bit                    (port1_DMA11_mark_bit),
        .DMA11_Inc_Pkt_Cnt                 (port1_DMA11_inc_pkt_cnt),
        .SetGetNextDescDMA11               (port1_SetGetNextDescDMA11),
        .DMA12_Active                      (dmc_txc_dma12_active),
        .DMA12_EofList                     (dmc_txc_dma12_eoflist),
        .DMA12_Error                       (dmc_txc_dma12_error),
        .DMA12_CacheReady                  (dmc_txc_dma12_cacheready),
        .DMA12_Partial                     (dmc_txc_dma12_partial),
        .DMA12_Reset_Scheduled             (dmc_txc_dma12_reset_scheduled),
        .DMA12_GotNxtDesc                  (dmc_txc_dma12_gotnxtdesc),
        .DMA12_Mark                        (dmc_txc_dma12_descriptor[62]),
        .DMA12_SOP                         (dmc_txc_dma12_descriptor[63]),
        .DMA12_Func_Num                    (dmc_txc_dma12_func_num),
        .DMA12_DescList                    (dmc_txc_dma12_descriptor[61:58]),
        .DMA12_Length                      (dmc_txc_dma12_descriptor[56:44]),
        .DMA12_PageHandle                  (dmc_txc_dma12_page_handle),
        .DMA12_Address                     (dmc_txc_dma12_descriptor[43:0]),
        .DMA12_Inc_Head                    (port1_DMA12_inc_head),
        .DMA12_Reset_Done                  (port1_DMA12_reset_done),
        .DMA12_Mark_Bit                    (port1_DMA12_mark_bit),
        .DMA12_Inc_Pkt_Cnt                 (port1_DMA12_inc_pkt_cnt),
        .SetGetNextDescDMA12               (port1_SetGetNextDescDMA12),
        .DMA13_Active                      (dmc_txc_dma13_active),
        .DMA13_EofList                     (dmc_txc_dma13_eoflist),
        .DMA13_Error                       (dmc_txc_dma13_error),
        .DMA13_CacheReady                  (dmc_txc_dma13_cacheready),
        .DMA13_Partial                     (dmc_txc_dma13_partial),
        .DMA13_Reset_Scheduled             (dmc_txc_dma13_reset_scheduled),
        .DMA13_GotNxtDesc                  (dmc_txc_dma13_gotnxtdesc),
        .DMA13_Mark                        (dmc_txc_dma13_descriptor[62]),
        .DMA13_SOP                         (dmc_txc_dma13_descriptor[63]),
        .DMA13_Func_Num                    (dmc_txc_dma13_func_num),
        .DMA13_DescList                    (dmc_txc_dma13_descriptor[61:58]),
        .DMA13_Length                      (dmc_txc_dma13_descriptor[56:44]),
        .DMA13_PageHandle                  (dmc_txc_dma13_page_handle),
        .DMA13_Address                     (dmc_txc_dma13_descriptor[43:0]),
        .DMA13_Inc_Head                    (port1_DMA13_inc_head),
        .DMA13_Reset_Done                  (port1_DMA13_reset_done),
        .DMA13_Mark_Bit                    (port1_DMA13_mark_bit),
        .DMA13_Inc_Pkt_Cnt                 (port1_DMA13_inc_pkt_cnt),
        .SetGetNextDescDMA13               (port1_SetGetNextDescDMA13),
        .DMA14_Active                      (dmc_txc_dma14_active),
        .DMA14_EofList                     (dmc_txc_dma14_eoflist),
        .DMA14_Error                       (dmc_txc_dma14_error),
        .DMA14_CacheReady                  (dmc_txc_dma14_cacheready),
        .DMA14_Partial                     (dmc_txc_dma14_partial),
        .DMA14_Reset_Scheduled             (dmc_txc_dma14_reset_scheduled),
        .DMA14_GotNxtDesc                  (dmc_txc_dma14_gotnxtdesc),
        .DMA14_Mark                        (dmc_txc_dma14_descriptor[62]),
        .DMA14_SOP                         (dmc_txc_dma14_descriptor[63]),
        .DMA14_Func_Num                    (dmc_txc_dma14_func_num),
        .DMA14_DescList                    (dmc_txc_dma14_descriptor[61:58]),
        .DMA14_Length                      (dmc_txc_dma14_descriptor[56:44]),
        .DMA14_PageHandle                  (dmc_txc_dma14_page_handle),
        .DMA14_Address                     (dmc_txc_dma14_descriptor[43:0]),
        .DMA14_Inc_Head                    (port1_DMA14_inc_head),
        .DMA14_Reset_Done                  (port1_DMA14_reset_done),
        .DMA14_Mark_Bit                    (port1_DMA14_mark_bit),
        .DMA14_Inc_Pkt_Cnt                 (port1_DMA14_inc_pkt_cnt),
        .SetGetNextDescDMA14               (port1_SetGetNextDescDMA14),
        .DMA15_Active                      (dmc_txc_dma15_active),
        .DMA15_EofList                     (dmc_txc_dma15_eoflist),
        .DMA15_Error                       (dmc_txc_dma15_error),
        .DMA15_CacheReady                  (dmc_txc_dma15_cacheready),
        .DMA15_Partial                     (dmc_txc_dma15_partial),
        .DMA15_Reset_Scheduled             (dmc_txc_dma15_reset_scheduled),
        .DMA15_GotNxtDesc                  (dmc_txc_dma15_gotnxtdesc),
        .DMA15_Mark                        (dmc_txc_dma15_descriptor[62]),
        .DMA15_SOP                         (dmc_txc_dma15_descriptor[63]),
        .DMA15_Func_Num                    (dmc_txc_dma15_func_num),
        .DMA15_DescList                    (dmc_txc_dma15_descriptor[61:58]),
        .DMA15_Length                      (dmc_txc_dma15_descriptor[56:44]),
        .DMA15_PageHandle                  (dmc_txc_dma15_page_handle),
        .DMA15_Address                     (dmc_txc_dma15_descriptor[43:0]),
        .DMA15_Inc_Head                    (port1_DMA15_inc_head),
        .DMA15_Reset_Done                  (port1_DMA15_reset_done),
        .DMA15_Mark_Bit                    (port1_DMA15_mark_bit),
        .DMA15_Inc_Pkt_Cnt                 (port1_DMA15_inc_pkt_cnt),
        .SetGetNextDescDMA15               (port1_SetGetNextDescDMA15),
        .DMA16_Active                      (dmc_txc_dma16_active),
        .DMA16_EofList                     (dmc_txc_dma16_eoflist),
        .DMA16_Error                       (dmc_txc_dma16_error),
        .DMA16_CacheReady                  (dmc_txc_dma16_cacheready),
        .DMA16_Partial                     (dmc_txc_dma16_partial),
        .DMA16_Reset_Scheduled             (dmc_txc_dma16_reset_scheduled),
        .DMA16_GotNxtDesc                  (dmc_txc_dma16_gotnxtdesc),
        .DMA16_Mark                        (dmc_txc_dma16_descriptor[62]),
        .DMA16_SOP                         (dmc_txc_dma16_descriptor[63]),
        .DMA16_Func_Num                    (dmc_txc_dma16_func_num),
        .DMA16_DescList                    (dmc_txc_dma16_descriptor[61:58]),
        .DMA16_Length                      (dmc_txc_dma16_descriptor[56:44]),
        .DMA16_PageHandle                  (dmc_txc_dma16_page_handle),
        .DMA16_Address                     (dmc_txc_dma16_descriptor[43:0]),
        .DMA16_Inc_Head                    (port1_DMA16_inc_head),
        .DMA16_Reset_Done                  (port1_DMA16_reset_done),
        .DMA16_Mark_Bit                    (port1_DMA16_mark_bit),
        .DMA16_Inc_Pkt_Cnt                 (port1_DMA16_inc_pkt_cnt),
        .SetGetNextDescDMA16               (port1_SetGetNextDescDMA16),
        .DMA17_Active                      (dmc_txc_dma17_active),
        .DMA17_EofList                     (dmc_txc_dma17_eoflist),
        .DMA17_Error                       (dmc_txc_dma17_error),
        .DMA17_CacheReady                  (dmc_txc_dma17_cacheready),
        .DMA17_Partial                     (dmc_txc_dma17_partial),
        .DMA17_Reset_Scheduled             (dmc_txc_dma17_reset_scheduled),
        .DMA17_GotNxtDesc                  (dmc_txc_dma17_gotnxtdesc),
        .DMA17_Mark                        (dmc_txc_dma17_descriptor[62]),
        .DMA17_SOP                         (dmc_txc_dma17_descriptor[63]),
        .DMA17_Func_Num                    (dmc_txc_dma17_func_num),
        .DMA17_DescList                    (dmc_txc_dma17_descriptor[61:58]),
        .DMA17_Length                      (dmc_txc_dma17_descriptor[56:44]),
        .DMA17_PageHandle                  (dmc_txc_dma17_page_handle),
        .DMA17_Address                     (dmc_txc_dma17_descriptor[43:0]),
        .DMA17_Inc_Head                    (port1_DMA17_inc_head),
        .DMA17_Reset_Done                  (port1_DMA17_reset_done),
        .DMA17_Mark_Bit                    (port1_DMA17_mark_bit),
        .DMA17_Inc_Pkt_Cnt                 (port1_DMA17_inc_pkt_cnt),
        .SetGetNextDescDMA17               (port1_SetGetNextDescDMA17),
        .DMA18_Active                      (dmc_txc_dma18_active),
        .DMA18_EofList                     (dmc_txc_dma18_eoflist),
        .DMA18_Error                       (dmc_txc_dma18_error),
        .DMA18_CacheReady                  (dmc_txc_dma18_cacheready),
        .DMA18_Partial                     (dmc_txc_dma18_partial),
        .DMA18_Reset_Scheduled             (dmc_txc_dma18_reset_scheduled),
        .DMA18_GotNxtDesc                  (dmc_txc_dma18_gotnxtdesc),
        .DMA18_Mark                        (dmc_txc_dma18_descriptor[62]),
        .DMA18_SOP                         (dmc_txc_dma18_descriptor[63]),
        .DMA18_Func_Num                    (dmc_txc_dma18_func_num),
        .DMA18_DescList                    (dmc_txc_dma18_descriptor[61:58]),
        .DMA18_Length                      (dmc_txc_dma18_descriptor[56:44]),
        .DMA18_PageHandle                  (dmc_txc_dma18_page_handle),
        .DMA18_Address                     (dmc_txc_dma18_descriptor[43:0]),
        .DMA18_Inc_Head                    (port1_DMA18_inc_head),
        .DMA18_Reset_Done                  (port1_DMA18_reset_done),
        .DMA18_Mark_Bit                    (port1_DMA18_mark_bit),
        .DMA18_Inc_Pkt_Cnt                 (port1_DMA18_inc_pkt_cnt),
        .SetGetNextDescDMA18               (port1_SetGetNextDescDMA18),
        .DMA19_Active                      (dmc_txc_dma19_active),
        .DMA19_EofList                     (dmc_txc_dma19_eoflist),
        .DMA19_Error                       (dmc_txc_dma19_error),
        .DMA19_CacheReady                  (dmc_txc_dma19_cacheready),
        .DMA19_Partial                     (dmc_txc_dma19_partial),
        .DMA19_Reset_Scheduled             (dmc_txc_dma19_reset_scheduled),
        .DMA19_GotNxtDesc                  (dmc_txc_dma19_gotnxtdesc),
        .DMA19_Mark                        (dmc_txc_dma19_descriptor[62]),
        .DMA19_SOP                         (dmc_txc_dma19_descriptor[63]),
        .DMA19_Func_Num                    (dmc_txc_dma19_func_num),
        .DMA19_DescList                    (dmc_txc_dma19_descriptor[61:58]),
        .DMA19_Length                      (dmc_txc_dma19_descriptor[56:44]),
        .DMA19_PageHandle                  (dmc_txc_dma19_page_handle),
        .DMA19_Address                     (dmc_txc_dma19_descriptor[43:0]),
        .DMA19_Inc_Head                    (port1_DMA19_inc_head),
        .DMA19_Reset_Done                  (port1_DMA19_reset_done),
        .DMA19_Mark_Bit                    (port1_DMA19_mark_bit),
        .DMA19_Inc_Pkt_Cnt                 (port1_DMA19_inc_pkt_cnt),
        .SetGetNextDescDMA19               (port1_SetGetNextDescDMA19),
        .DMA20_Active                      (dmc_txc_dma20_active),
        .DMA20_EofList                     (dmc_txc_dma20_eoflist),
        .DMA20_Error                       (dmc_txc_dma20_error),
        .DMA20_CacheReady                  (dmc_txc_dma20_cacheready),
        .DMA20_Partial                     (dmc_txc_dma20_partial),
        .DMA20_Reset_Scheduled             (dmc_txc_dma20_reset_scheduled),
        .DMA20_GotNxtDesc                  (dmc_txc_dma20_gotnxtdesc),
        .DMA20_Mark                        (dmc_txc_dma20_descriptor[62]),
        .DMA20_SOP                         (dmc_txc_dma20_descriptor[63]),
        .DMA20_Func_Num                    (dmc_txc_dma20_func_num),
        .DMA20_DescList                    (dmc_txc_dma20_descriptor[61:58]),
        .DMA20_Length                      (dmc_txc_dma20_descriptor[56:44]),
        .DMA20_PageHandle                  (dmc_txc_dma20_page_handle),
        .DMA20_Address                     (dmc_txc_dma20_descriptor[43:0]),
        .DMA20_Inc_Head                    (port1_DMA20_inc_head),
        .DMA20_Reset_Done                  (port1_DMA20_reset_done),
        .DMA20_Mark_Bit                    (port1_DMA20_mark_bit),
        .DMA20_Inc_Pkt_Cnt                 (port1_DMA20_inc_pkt_cnt),
        .SetGetNextDescDMA20               (port1_SetGetNextDescDMA20),
        .DMA21_Active                      (dmc_txc_dma21_active),
        .DMA21_EofList                     (dmc_txc_dma21_eoflist),
        .DMA21_Error                       (dmc_txc_dma21_error),
        .DMA21_CacheReady                  (dmc_txc_dma21_cacheready),
        .DMA21_Partial                     (dmc_txc_dma21_partial),
        .DMA21_Reset_Scheduled             (dmc_txc_dma21_reset_scheduled),
        .DMA21_GotNxtDesc                  (dmc_txc_dma21_gotnxtdesc),
        .DMA21_Mark                        (dmc_txc_dma21_descriptor[62]),
        .DMA21_SOP                         (dmc_txc_dma21_descriptor[63]),
        .DMA21_Func_Num                    (dmc_txc_dma21_func_num),
        .DMA21_DescList                    (dmc_txc_dma21_descriptor[61:58]),
        .DMA21_Length                      (dmc_txc_dma21_descriptor[56:44]),
        .DMA21_PageHandle                  (dmc_txc_dma21_page_handle),
        .DMA21_Address                     (dmc_txc_dma21_descriptor[43:0]),
        .DMA21_Inc_Head                    (port1_DMA21_inc_head),
        .DMA21_Reset_Done                  (port1_DMA21_reset_done),
        .DMA21_Mark_Bit                    (port1_DMA21_mark_bit),
        .DMA21_Inc_Pkt_Cnt                 (port1_DMA21_inc_pkt_cnt),
        .SetGetNextDescDMA21               (port1_SetGetNextDescDMA21),
        .DMA22_Active                      (dmc_txc_dma22_active),
        .DMA22_EofList                     (dmc_txc_dma22_eoflist),
        .DMA22_Error                       (dmc_txc_dma22_error),
        .DMA22_CacheReady                  (dmc_txc_dma22_cacheready),
        .DMA22_Partial                     (dmc_txc_dma22_partial),
        .DMA22_Reset_Scheduled             (dmc_txc_dma22_reset_scheduled),
        .DMA22_GotNxtDesc                  (dmc_txc_dma22_gotnxtdesc),
        .DMA22_Mark                        (dmc_txc_dma22_descriptor[62]),
        .DMA22_SOP                         (dmc_txc_dma22_descriptor[63]),
        .DMA22_Func_Num                    (dmc_txc_dma22_func_num),
        .DMA22_DescList                    (dmc_txc_dma22_descriptor[61:58]),
        .DMA22_Length                      (dmc_txc_dma22_descriptor[56:44]),
        .DMA22_PageHandle                  (dmc_txc_dma22_page_handle),
        .DMA22_Address                     (dmc_txc_dma22_descriptor[43:0]),
        .DMA22_Inc_Head                    (port1_DMA22_inc_head),
        .DMA22_Reset_Done                  (port1_DMA22_reset_done),
        .DMA22_Mark_Bit                    (port1_DMA22_mark_bit),
        .DMA22_Inc_Pkt_Cnt                 (port1_DMA22_inc_pkt_cnt),
        .SetGetNextDescDMA22               (port1_SetGetNextDescDMA22),
        .DMA23_Active                      (dmc_txc_dma23_active),
        .DMA23_EofList                     (dmc_txc_dma23_eoflist),
        .DMA23_Error                       (dmc_txc_dma23_error),
        .DMA23_CacheReady                  (dmc_txc_dma23_cacheready),
        .DMA23_Partial                     (dmc_txc_dma23_partial),
        .DMA23_Reset_Scheduled             (dmc_txc_dma23_reset_scheduled),
        .DMA23_GotNxtDesc                  (dmc_txc_dma23_gotnxtdesc),
        .DMA23_Mark                        (dmc_txc_dma23_descriptor[62]),
        .DMA23_SOP                         (dmc_txc_dma23_descriptor[63]),
        .DMA23_Func_Num                    (dmc_txc_dma23_func_num),
        .DMA23_DescList                    (dmc_txc_dma23_descriptor[61:58]),
        .DMA23_Length                      (dmc_txc_dma23_descriptor[56:44]),
        .DMA23_PageHandle                  (dmc_txc_dma23_page_handle),
        .DMA23_Address                     (dmc_txc_dma23_descriptor[43:0]),
        .DMA23_Inc_Head                    (port1_DMA23_inc_head),
        .DMA23_Reset_Done                  (port1_DMA23_reset_done),
        .DMA23_Mark_Bit                    (port1_DMA23_mark_bit),
        .DMA23_Inc_Pkt_Cnt                 (port1_DMA23_inc_pkt_cnt),
        .SetGetNextDescDMA23               (port1_SetGetNextDescDMA23),

        .DMA0_NewMaxBurst                  (dma0_NewMaxBurst),
        .DMA1_NewMaxBurst                  (dma1_NewMaxBurst),
        .DMA2_NewMaxBurst                  (dma2_NewMaxBurst),
        .DMA3_NewMaxBurst                  (dma3_NewMaxBurst),
        .DMA4_NewMaxBurst                  (dma4_NewMaxBurst),
        .DMA5_NewMaxBurst                  (dma5_NewMaxBurst),
        .DMA6_NewMaxBurst                  (dma6_NewMaxBurst),
        .DMA7_NewMaxBurst                  (dma7_NewMaxBurst),
        .DMA8_NewMaxBurst                  (dma8_NewMaxBurst),
        .DMA9_NewMaxBurst                  (dma9_NewMaxBurst),
        .DMA10_NewMaxBurst                 (dma10_NewMaxBurst),
        .DMA11_NewMaxBurst                 (dma11_NewMaxBurst),
        .DMA12_NewMaxBurst                 (dma12_NewMaxBurst),
        .DMA13_NewMaxBurst                 (dma13_NewMaxBurst),
        .DMA14_NewMaxBurst                 (dma14_NewMaxBurst),
        .DMA15_NewMaxBurst                 (dma15_NewMaxBurst),
        .DMA16_NewMaxBurst                 (dma16_NewMaxBurst),
        .DMA17_NewMaxBurst                 (dma17_NewMaxBurst),
        .DMA18_NewMaxBurst                 (dma18_NewMaxBurst),
        .DMA19_NewMaxBurst                 (dma19_NewMaxBurst),
        .DMA20_NewMaxBurst                 (dma20_NewMaxBurst),
        .DMA21_NewMaxBurst                 (dma21_NewMaxBurst),
        .DMA22_NewMaxBurst                 (dma22_NewMaxBurst),
        .DMA23_NewMaxBurst                 (dma23_NewMaxBurst),
        .DMA0_MaxBurst                     (dma0_MaxBurst),
        .DMA1_MaxBurst                     (dma1_MaxBurst),
        .DMA2_MaxBurst                     (dma2_MaxBurst),
        .DMA3_MaxBurst                     (dma3_MaxBurst),
        .DMA4_MaxBurst                     (dma4_MaxBurst),
        .DMA5_MaxBurst                     (dma5_MaxBurst),
        .DMA6_MaxBurst                     (dma6_MaxBurst),
        .DMA7_MaxBurst                     (dma7_MaxBurst),
        .DMA8_MaxBurst                     (dma8_MaxBurst),
        .DMA9_MaxBurst                     (dma9_MaxBurst),
        .DMA10_MaxBurst                    (dma10_MaxBurst),
        .DMA11_MaxBurst                    (dma11_MaxBurst),
        .DMA12_MaxBurst                    (dma12_MaxBurst),
        .DMA13_MaxBurst                    (dma13_MaxBurst),
        .DMA14_MaxBurst                    (dma14_MaxBurst),
        .DMA15_MaxBurst                    (dma15_MaxBurst),
        .DMA16_MaxBurst                    (dma16_MaxBurst),
        .DMA17_MaxBurst                    (dma17_MaxBurst),
        .DMA18_MaxBurst                    (dma18_MaxBurst),
        .DMA19_MaxBurst                    (dma19_MaxBurst),
        .DMA20_MaxBurst                    (dma20_MaxBurst),
        .DMA21_MaxBurst                    (dma21_MaxBurst),
        .DMA22_MaxBurst                    (dma22_MaxBurst),
        .DMA23_MaxBurst                    (dma23_MaxBurst),
        .MaxReorderNumber                  (port1_MaxReorderNumber),
        .Port_DMA_List                     (port1_DMA_List),
        .ClrMaxBurst                       (port1_clrMaxBurst),
        .UpdateDMA                         (port1_UpdateDMA),
        .UpdateDMALength                   (port1_UpdateDMALength),
        .UpdateDMANumber                   (port1_UpdateDMANumber),

        .DMC_TXC_Req_Ack                   (arb1_txc_req_accept),
        .DMC_TXC_Req_TransID               (arb1_txc_req_transid),

        .Port_Selected                     (port_Selected[1]),
        .Port_Request                      (port1_Request),
        .Port_Request_Func_Num             (port1_Request_Func_Num),
        .Port_Request_DMA_Num              (port1_Request_DMA_Num),
        .Port_Request_Length               (port1_Request_Length),
        .Port_Request_Address              (port1_Request_Address),

        .DMC_TXC_Resp_Rdy                  (dMC_TXC_Resp_Rdy),
        .DMC_TXC_Resp_Complete             (dMC_TXC_Resp_Complete),
        .DMC_TXC_Trans_Complete            (dMC_TXC_Trans_Complete),
        .DMC_TXC_Resp_Data_Valid           (dMC_TXC_Resp_Data_Valid),
        .DMC_TXC_Resp_Client               (dMC_TXC_Resp_Client),
        .DMC_TXC_Resp_Port_Num             (dMC_TXC_Resp_Port_Num),
        .DMC_TXC_Resp_Cmd_Status           (dMC_TXC_Resp_Cmd_Status),
        .DMC_TXC_Resp_Data_Status          (dMC_TXC_Resp_Data_Status),
        .DMC_TXC_Resp_DMA_Num              (dMC_TXC_Resp_DMA_Num),
        .DMC_TXC_Resp_TransID              (dMC_TXC_Resp_TransID),
        .DMC_TXC_Resp_Cmd                  (dMC_TXC_Resp_Cmd),
        .DMC_TXC_Resp_Data_Length          (dMC_TXC_Resp_Data_Length),
        .DMC_TXC_Resp_ByteEnables          (dMC_TXC_Resp_ByteEnables),
        .DMC_TXC_Resp_Address              (dMC_TXC_Resp_Address),
        .DMC_TXC_Resp_Data                 (dMC_TXC_Resp_Data),
        .TXC_DMC_Resp_Accept               (port1_TXC_DMC_Resp_Accept),

        .ReOrderFifoDataValid              (port1_ReOrderFifoDataValid),
        .ReOrderUnCorrectError             (port1_ReOrder_UnCorrectError),
        .ReOrderEccControl                 (port1_ReOrderEccControl),
        .PacketAssyEngineDataIn            (port1_PacketAssyEngineDataIn),
        .ReOrderCorruptECCSingle           (port1_ReOrderCorruptECCSingle),
        .ReOrderCorruptECCDouble           (port1_ReOrderCorruptECCDouble),
        .ReOrderFifoWrite                  (port1_ReOrderFifoWrite),
        .ReOrderFifoReadStrobe             (port1_ReOrderFifoRead),
        .ReOrderWritePtr                   (port1_ReOrderWritePtr),
        .ReOrderReadPtr                    (port1_ReOrderReadPtr),
        .ReOrderEngineDataOut              (port1_ReOrderEngineDataOut),

        .StoreForwardUnCorrectError        (port1_StoreForward_UnCorrectError),
        .StoreForwardEccControl            (port1_StoreForwardEccControl),
        .MacXferEngineDataIn               (port1_MacXferEngineDataIn),
        .StoreForward_CorruptECCSingle     (port1_StoreForwardCorruptECCSingle),
        .StoreForward_CorruptECCDouble     (port1_StoreForwardCorruptECCDouble),
        .StoreForwardFifoWrite             (port1_StoreForwardFifoWrite),
        .StoreForwardFifoReadStrobe        (port1_StoreForwardFifoRead),
        .StoreForwardWritePtr              (port1_StoreForwardWritePtr),
        .StoreForwardReadPtr               (port1_StoreForwardReadPtr),
        .PacketAssyEngineDataOut           (port1_PacketAssyEngineDataOut),

        .LatchActiveDMA                    (port1_LatchActiveDMA),
        .ContextActiveList                 (port1_ContextActiveList),

        .Anchor_State                      (port1_Anchor_State),
        .ReOrder_State                     (port1_ReOrder_State),
        .Pointer_State                     (port1_Pointer_State),
        .PacketAssy_State                  (port1_PacketAssy_State),
        .DRR_ArbState                      (port1_DRR_ArbState),
        .Mac_Xfer_State                    (port1_Mac_Xfer_State),
        .DataPortReq_State                 (port1_DataPortReq_State),
        .Sum_prt_state                     (port1_Sum_prt_state)
       );


niu_txc_ecc_engine port1_niu_txc_ecc_engine (
        .SysClk                            (niu_clk),
        .Reset_L                           (reset_l),
        .ReOrder_ClearEccError             (port1_ReOrder_ClearEccError),
        .WrReOrderEccState                 (port1_WrReOrderEccState),
        .WrReOrderEccData0                 (port1_WrReOrderEccData0),
        .WrReOrderEccData1                 (port1_WrReOrderEccData1),
        .WrReOrderEccData2                 (port1_WrReOrderEccData2),
        .WrReOrderEccData3                 (port1_WrReOrderEccData3),
        .WrReOrderEccData4                 (port1_WrReOrderEccData4),
        .StoreForward_ClearEccError        (port1_StoreForward_ClearEccError),
        .WrStoreForwardEccState            (port1_WrStoreForwardEccState),
        .WrStoreForwardEccData0            (port1_WrStoreForwardEccData0),
        .WrStoreForwardEccData1            (port1_WrStoreForwardEccData1),
        .WrStoreForwardEccData2            (port1_WrStoreForwardEccData2),
        .WrStoreForwardEccData3            (port1_WrStoreForwardEccData3),
        .WrStoreForwardEccData4            (port1_WrStoreForwardEccData4),
        .PioDataIn                         (port1_PioDataIn),
        .ReOrder_ECC_State                 (port1_ReOrder_ECC_State),
        .ReOrder_EccData                   (port1_ReOrder_EccData),
        .StoreForward_ECC_State            (port1_StoreForward_ECC_State),
        .StoreForward_EccData              (port1_StoreForward_EccData),
        .ReOrder_CorruptECCSingle          (port1_ReOrderCorruptECCSingle),
        .ReOrder_CorruptECCDouble          (port1_ReOrderCorruptECCDouble),
        .ReOrder_FifoRead                  (port1_ReOrderFifoRead),
        .ReOrder_ReadPtr                   (port1_ReOrderReadPtr),
        .ReOrder_FifoDataOut               (port1_ReOrderFifoDataOut),
        .ReOrder_FifoDataValid             (port1_ReOrderFifoDataValid),
        .ReOrder_UnCorrectError            (port1_ReOrder_UnCorrectError),
        .ReOrder_PreECCData                (port1_ReOrderEngineDataOut),
        .ReOrder_PostECCData               (port1_ReOrderFifoDataIn),
        .ReOrder_CorrectedData             (port1_PacketAssyEngineDataIn),
        .StoreForward_CorruptECCSingle     (port1_StoreForwardCorruptECCSingle),
        .StoreForward_CorruptECCDouble     (port1_StoreForwardCorruptECCDouble),
        .StoreForward_FifoRead             (port1_StoreForwardFifoRead),
        .StoreForward_ReadPtr              (port1_StoreForwardReadPtr),
        .StoreForward_FifoDataOut          (port1_StoreForwardFifoDataOut),
        .StoreForward_UnCorrectError       (port1_StoreForward_UnCorrectError),
        .StoreForward_PreECCData           (port1_PacketAssyEngineDataOut),
        .StoreForward_PostECCData          (port1_StoreForwardFifoDataIn),
        .StoreForward_CorrectedData        (port1_MacXferEngineDataIn)
       );


`ifdef NEPTUNE
niu_ram_1024_152 port1_RO_RAM (
        .clk                               (niu_clk),
        .wt_enable                         (port1_ReOrderFifoWrite),
        .cs_rd                             (port1_ReOrderFifoRead),
        .addr_rd                           (port1_ReOrderReadPtr),
        .addr_wt                           (port1_ReOrderWritePtr),
        .data_inp                          (port1_ReOrderFifoDataIn),
        .data_out                          (port1_ReOrderFifoDataOut)
       );

niu_ram_640_152 port1_SF_RAM (
        .clk                               (niu_clk),
        .wt_enable                         (port1_StoreForwardFifoWrite),
        .cs_rd                             (port1_StoreForwardFifoRead),
        .addr_rd                           (port1_StoreForwardReadPtr),
        .addr_wt                           (port1_StoreForwardWritePtr),
        .data_inp                          (port1_StoreForwardFifoDataIn),
        .data_out                          (port1_StoreForwardFifoDataOut)
       );
`else

niu_mb1 niu_txe1_1024_152_membist (
        .rst_l                             (reset_l),
        .tcu_mbist_user_mode               (tcu_mbist_user_mode),
        .niu_mb1_xmit_store_rd_en          (rtx_txc_txe1_mb1_xmit_store_rd_en),
        .niu_mb1_xmit_store_wr_en          (rtx_txc_txe1_mb1_xmit_store_wr_en),
        .niu_mb1_xmit_realign_rd_en       (rtx_txc_txe1_mb1_xmit_realign_rd_en),
        .niu_mb1_xmit_realign_wr_en       (rtx_txc_txe1_mb1_xmit_realign_wr_en),
        .niu_mb1_addr                      (rtx_txc_txe1_mb1_addr),
        .niu_mb1_wdata                     (rtx_txc_txe1_mb1_wdata),
        .niu_mb1_run                       (rtx_txc_txe1_mb1_run),
        .niu_mb1_xmit_store_data_out       (port1_StoreForwardFifoDataOut),
        .niu_mb1_xmit_realign_data_out     (port1_ReOrderFifoDataOut),
        .tcu_mbist_bisi_en                 (tcu_mbist_bisi_en),
        .tcu_niu_mbist_start_1             (tcu_rtx_txc_txe1_mbist_start),
        .niu_tcu_mbist_fail_1              (rtx_txc_txe1_tcu_mbist_fail),
        .niu_tcu_mbist_done_1              (rtx_txc_txe1_tcu_mbist_done),
        .l1clk                             (niu_clk),
        .mb1_scan_out                      (rtx_txc_txe1_mbist_scan_out),
        .mb1_scan_in                       (rtx_txc_txe1_mbist_scan_in),
        .mb1_dmo_dout                      (rtx_txc_txe1_dmo_dout),
        .tcu_aclk                          (tcu_aclk),
        .tcu_bclk                          (tcu_bclk)
       );

wire [151:0] concate_rtx_txc_txe1_mb1_wdata;

assign concate_rtx_txc_txe1_mb1_wdata
                             = {rtx_txc_txe1_mb1_wdata, rtx_txc_txe1_mb1_wdata,
                                rtx_txc_txe1_mb1_wdata, rtx_txc_txe1_mb1_wdata,
                                rtx_txc_txe1_mb1_wdata, rtx_txc_txe1_mb1_wdata,
                                rtx_txc_txe1_mb1_wdata, rtx_txc_txe1_mb1_wdata,
                                rtx_txc_txe1_mb1_wdata, rtx_txc_txe1_mb1_wdata,
                                rtx_txc_txe1_mb1_wdata, rtx_txc_txe1_mb1_wdata,
                                rtx_txc_txe1_mb1_wdata, rtx_txc_txe1_mb1_wdata,
                                rtx_txc_txe1_mb1_wdata, rtx_txc_txe1_mb1_wdata,
                                rtx_txc_txe1_mb1_wdata, rtx_txc_txe1_mb1_wdata,
                                rtx_txc_txe1_mb1_wdata
                               };

niu_ram_1024_152 port1_RO_RAM (
        .clk                               (iol2clk),
        .reset                             (sram_reset),
        .tcu_aclk                          (tcu_aclk),
        .tcu_bclk                          (tcu_bclk),
        .tcu_se_scancollar_in              (tcu_se_scancollar_in),
        .tcu_se_scancollar_out             (tcu_se_scancollar_out),
        .tcu_scan_en                       (tcu_scan_en),
        .tcu_array_wr_inhibit              (tcu_array_wr_inhibit),
        .scan_in                           (1'b0),
        .scan_out                          (),
        .hdr_sram_rvalue                   (hdr_sram_rvalue_txc1_re),
        .hdr_sram_rid                      (hdr_sram_rid_txc1_re),
        .hdr_sram_wr_en                    (hdr_sram_wr_en_txc1_re),
        .hdr_sram_red_clr                  (hdr_sram_red_clr_txc1_re),
        .sram_hdr_read_data                (sram_hdr_read_data_txc1_re),
        .mbi_wdata                         (concate_rtx_txc_txe1_mb1_wdata),
        .mbi_rd_adr                        (rtx_txc_txe1_mb1_addr),
        .mbi_wr_adr                        (rtx_txc_txe1_mb1_addr),
        .mbi_wr_en                        (rtx_txc_txe1_mb1_xmit_realign_wr_en),
        .mbi_rd_en                        (rtx_txc_txe1_mb1_xmit_realign_rd_en),
        .mbi_run                           (rtx_txc_txe1_mb1_run),
        .l2clk_2x                          (l2clk_2x),
        .wt_enable                         (port1_ReOrderFifoWrite),
        .cs_rd                             (port1_ReOrderFifoRead),
        .addr_rd                           (port1_ReOrderReadPtr),
        .addr_wt                           (port1_ReOrderWritePtr),
        .data_inp                          (port1_ReOrderFifoDataIn),
        .data_out                          (port1_ReOrderFifoDataOut)
       );

niu_ram_1024_152 port1_SF_RAM (
        .clk                               (iol2clk),
        .reset                             (sram_reset),
        .tcu_aclk                          (tcu_aclk),
        .tcu_bclk                          (tcu_bclk),
        .tcu_se_scancollar_in              (tcu_se_scancollar_in),
        .tcu_se_scancollar_out             (tcu_se_scancollar_out),
        .tcu_scan_en                       (tcu_scan_en),
        .tcu_array_wr_inhibit              (tcu_array_wr_inhibit),
        .scan_in                           (1'b0),
        .scan_out                          (),
        .hdr_sram_rvalue                   (hdr_sram_rvalue_txc1_st),
        .hdr_sram_rid                      (hdr_sram_rid_txc1_st),
        .hdr_sram_wr_en                    (hdr_sram_wr_en_txc1_st),
        .hdr_sram_red_clr                  (hdr_sram_red_clr_txc1_st),
        .sram_hdr_read_data                (sram_hdr_read_data_txc1_st),
        .mbi_wdata                         (concate_rtx_txc_txe1_mb1_wdata),
        .mbi_rd_adr                        (rtx_txc_txe1_mb1_addr),
        .mbi_wr_adr                        (rtx_txc_txe1_mb1_addr),
        .mbi_wr_en                         (rtx_txc_txe1_mb1_xmit_store_wr_en),
        .mbi_rd_en                         (rtx_txc_txe1_mb1_xmit_store_rd_en),
        .mbi_run                           (rtx_txc_txe1_mb1_run),
        .l2clk_2x                          (l2clk_2x),
        .wt_enable                         (port1_StoreForwardFifoWrite),
        .cs_rd                             (port1_StoreForwardFifoRead),
        .addr_rd                           (port1_StoreForwardReadPtr),
        .addr_wt                           (port1_StoreForwardWritePtr),
        .data_inp                          (port1_StoreForwardFifoDataIn),
        .data_out                          (port1_StoreForwardFifoDataOut)
       );
`endif


`ifdef NEPTUNE

niu_txc_packetEngine #(REORDER_SIZE_1G, REORDER_PTR_1G) niu_txc_packetEngine2 (
        .SysClk                            (niu_clk),
        .Reset_L                           (reset_l),
        .PacketAssyDead                    (port2_PacketAssyDead),
        .ReOrder_Error                     (port2_ReOrder_Error),
        .Txc_Enabled                       (txc_Enabled),
        .PortIndentifier                   (`PORT_TWO),
        .EnableGMACMode                    (1'b1),
        .MAC_Enabled                       (port2_Enabled),
        .FlushEngine                       (flushEngine),

        .MAC_Req                           (port2_mac_req),
        .MAC_Ack                           (txc_mac_ack2),
        .MAC_Tag                           (txc_mac_tag2),
        .MAC_Status                        (),
        .MAC_Abort                         (),
        .MAC_Data                          (txc_mac_data2),

        .TidsInUse                         (port2_TidsInUse),
        .DuplicateTid                      (port2_DuplicateTid),
        .UnInitializedTID                  (port2_UnInitializedTID),
        .TimedoutTids                      (port2_TimedoutTids),
        .ReOrderStateLogic                 (port2_ReOrderStateLogic),
        .ReOrderStateControl               (port2_ReOrderStateControl),
        .ReOrderStateData0                 (port2_ReOrderStateData0),
        .ReOrderStateData1                 (port2_ReOrderStateData1),
        .ReOrderStateData2                 (port2_ReOrderStateData2),
        .ReOrderStateData3                 (port2_ReOrderStateData3),
        .WrTidsInUse                       (port2_WrTidsInUse),
        .WrDuplicateTid                    (port2_WrDuplicateTid),
        .WrUnInitializedTID                (port2_WrUnInitializedTID),
        .WrTimedoutTids                    (port2_WrTimedoutTids),
        .WrReOrderStateLogic               (port2_WrReOrderStateLogic),
        .WrReOrderStateControl             (port2_WrReOrderStateControl),
        .WrReOrderStateData0               (port2_WrReOrderStateData0),
        .WrReOrderStateData1               (port2_WrReOrderStateData1),
        .WrReOrderStateData2               (port2_WrReOrderStateData2),
        .WrReOrderStateData3               (port2_WrReOrderStateData3),
        .PioDataIn                         (port2_PioDataIn),

        .ClearStatistics                   (port2_ClearStatistics),
        .WrPacketStuffed                   (port2_WrPacketStuffed),
        .WrPacketXmitted                   (port2_WrPacketXmitted),
        .WrPacketRequested                 (port2_WrPacketRequested),
        .GatherRequestCount                (port2_GatherRequestCount),
        .PacketRequestCount                (port2_PacketRequestCount),
        .PktErrAbortCount                  (port2_PktErrAbortCount),
        .ReOrdersStuffed                   (port2_ReOrdersStuffed),
        .PacketsStuffed                    (port2_PacketsStuffed),
        .PacketsTransmitted                (port2_PacketsTransmitted),
        .BytesTransmitted                  (port2_BytesTransmitted),

        .Pkt_Size_Err                      (txc_dmc_p2_pkt_size_err),
        .DMA_Pkt_Size_Err                  (txc_dmc_p2_dma_pkt_size_err),
        .Pkt_Size_Err_Addr                 (txc_dmc_p2_pkt_size_err_addr),

        .Nack_Pkt_Rd                       (port2_Nack_Pkt_Rd),
        .DMA_Nack_Pkt_Rd                   (port2_DMA_Nack_Pkt_Rd),
        .Nack_Pkt_Rd_Addr                  (port2_Nack_Pkt_Rd_Addr),

        .DMA0_Active                       (dmc_txc_dma0_active),
        .DMA0_EofList                      (dmc_txc_dma0_eoflist),
        .DMA0_Error                        (dmc_txc_dma0_error),
        .DMA0_CacheReady                   (dmc_txc_dma0_cacheready),
        .DMA0_Partial                      (dmc_txc_dma0_partial),
        .DMA0_Reset_Scheduled              (dmc_txc_dma0_reset_scheduled),
        .DMA0_GotNxtDesc                   (dmc_txc_dma0_gotnxtdesc),
        .DMA0_Mark                         (dmc_txc_dma0_descriptor[62]),
        .DMA0_SOP                          (dmc_txc_dma0_descriptor[63]),
        .DMA0_Func_Num                     (dmc_txc_dma0_func_num),
        .DMA0_DescList                     (dmc_txc_dma0_descriptor[61:58]),
        .DMA0_Length                       (dmc_txc_dma0_descriptor[56:44]),
        .DMA0_PageHandle                   (dmc_txc_dma0_page_handle),
        .DMA0_Address                      (dmc_txc_dma0_descriptor[43:0]),
        .DMA0_Inc_Head                     (port2_DMA0_inc_head),
        .DMA0_Reset_Done                   (port2_DMA0_reset_done),
        .DMA0_Mark_Bit                     (port2_DMA0_mark_bit),
        .DMA0_Inc_Pkt_Cnt                  (port2_DMA0_inc_pkt_cnt),
        .SetGetNextDescDMA0                (port2_SetGetNextDescDMA0),
        .DMA1_Active                       (dmc_txc_dma1_active),
        .DMA1_EofList                      (dmc_txc_dma1_eoflist),
        .DMA1_Error                        (dmc_txc_dma1_error),
        .DMA1_CacheReady                   (dmc_txc_dma1_cacheready),
        .DMA1_Partial                      (dmc_txc_dma1_partial),
        .DMA1_Reset_Scheduled              (dmc_txc_dma1_reset_scheduled),
        .DMA1_GotNxtDesc                   (dmc_txc_dma1_gotnxtdesc),
        .DMA1_Mark                         (dmc_txc_dma1_descriptor[62]),
        .DMA1_SOP                          (dmc_txc_dma1_descriptor[63]),
        .DMA1_Func_Num                     (dmc_txc_dma1_func_num),
        .DMA1_DescList                     (dmc_txc_dma1_descriptor[61:58]),
        .DMA1_Length                       (dmc_txc_dma1_descriptor[56:44]),
        .DMA1_PageHandle                   (dmc_txc_dma1_page_handle),
        .DMA1_Address                      (dmc_txc_dma1_descriptor[43:0]),
        .DMA1_Inc_Head                     (port2_DMA1_inc_head),
        .DMA1_Reset_Done                   (port2_DMA1_reset_done),
        .DMA1_Mark_Bit                     (port2_DMA1_mark_bit),
        .DMA1_Inc_Pkt_Cnt                  (port2_DMA1_inc_pkt_cnt),
        .SetGetNextDescDMA1                (port2_SetGetNextDescDMA1),
        .DMA2_Active                       (dmc_txc_dma2_active),
        .DMA2_EofList                      (dmc_txc_dma2_eoflist),
        .DMA2_Error                        (dmc_txc_dma2_error),
        .DMA2_CacheReady                   (dmc_txc_dma2_cacheready),
        .DMA2_Partial                      (dmc_txc_dma2_partial),
        .DMA2_Reset_Scheduled              (dmc_txc_dma2_reset_scheduled),
        .DMA2_GotNxtDesc                   (dmc_txc_dma2_gotnxtdesc),
        .DMA2_Mark                         (dmc_txc_dma2_descriptor[62]),
        .DMA2_SOP                          (dmc_txc_dma2_descriptor[63]),
        .DMA2_Func_Num                     (dmc_txc_dma2_func_num),
        .DMA2_DescList                     (dmc_txc_dma2_descriptor[61:58]),
        .DMA2_Length                       (dmc_txc_dma2_descriptor[56:44]),
        .DMA2_PageHandle                   (dmc_txc_dma2_page_handle),
        .DMA2_Address                      (dmc_txc_dma2_descriptor[43:0]),
        .DMA2_Inc_Head                     (port2_DMA2_inc_head),
        .DMA2_Reset_Done                   (port2_DMA2_reset_done),
        .DMA2_Mark_Bit                     (port2_DMA2_mark_bit),
        .DMA2_Inc_Pkt_Cnt                  (port2_DMA2_inc_pkt_cnt),
        .SetGetNextDescDMA2                (port2_SetGetNextDescDMA2),
        .DMA3_Active                       (dmc_txc_dma3_active),
        .DMA3_EofList                      (dmc_txc_dma3_eoflist),
        .DMA3_Error                        (dmc_txc_dma3_error),
        .DMA3_CacheReady                   (dmc_txc_dma3_cacheready),
        .DMA3_Partial                      (dmc_txc_dma3_partial),
        .DMA3_Reset_Scheduled              (dmc_txc_dma3_reset_scheduled),
        .DMA3_GotNxtDesc                   (dmc_txc_dma3_gotnxtdesc),
        .DMA3_Mark                         (dmc_txc_dma3_descriptor[62]),
        .DMA3_SOP                          (dmc_txc_dma3_descriptor[63]),
        .DMA3_Func_Num                     (dmc_txc_dma3_func_num),
        .DMA3_DescList                     (dmc_txc_dma3_descriptor[61:58]),
        .DMA3_Length                       (dmc_txc_dma3_descriptor[56:44]),
        .DMA3_PageHandle                   (dmc_txc_dma3_page_handle),
        .DMA3_Address                      (dmc_txc_dma3_descriptor[43:0]),
        .DMA3_Inc_Head                     (port2_DMA3_inc_head),
        .DMA3_Reset_Done                   (port2_DMA3_reset_done),
        .DMA3_Mark_Bit                     (port2_DMA3_mark_bit),
        .DMA3_Inc_Pkt_Cnt                  (port2_DMA3_inc_pkt_cnt),
        .SetGetNextDescDMA3                (port2_SetGetNextDescDMA3),
        .DMA4_Active                       (dmc_txc_dma4_active),
        .DMA4_EofList                      (dmc_txc_dma4_eoflist),
        .DMA4_Error                        (dmc_txc_dma4_error),
        .DMA4_CacheReady                   (dmc_txc_dma4_cacheready),
        .DMA4_Partial                      (dmc_txc_dma4_partial),
        .DMA4_Reset_Scheduled              (dmc_txc_dma4_reset_scheduled),
        .DMA4_GotNxtDesc                   (dmc_txc_dma4_gotnxtdesc),
        .DMA4_Mark                         (dmc_txc_dma4_descriptor[62]),
        .DMA4_SOP                          (dmc_txc_dma4_descriptor[63]),
        .DMA4_Func_Num                     (dmc_txc_dma4_func_num),
        .DMA4_DescList                     (dmc_txc_dma4_descriptor[61:58]),
        .DMA4_Length                       (dmc_txc_dma4_descriptor[56:44]),
        .DMA4_PageHandle                   (dmc_txc_dma4_page_handle),
        .DMA4_Address                      (dmc_txc_dma4_descriptor[43:0]),
        .DMA4_Inc_Head                     (port2_DMA4_inc_head),
        .DMA4_Reset_Done                   (port2_DMA4_reset_done),
        .DMA4_Mark_Bit                     (port2_DMA4_mark_bit),
        .DMA4_Inc_Pkt_Cnt                  (port2_DMA4_inc_pkt_cnt),
        .SetGetNextDescDMA4                (port2_SetGetNextDescDMA4),
        .DMA5_Active                       (dmc_txc_dma5_active),
        .DMA5_EofList                      (dmc_txc_dma5_eoflist),
        .DMA5_Error                        (dmc_txc_dma5_error),
        .DMA5_CacheReady                   (dmc_txc_dma5_cacheready),
        .DMA5_Partial                      (dmc_txc_dma5_partial),
        .DMA5_Reset_Scheduled              (dmc_txc_dma5_reset_scheduled),
        .DMA5_GotNxtDesc                   (dmc_txc_dma5_gotnxtdesc),
        .DMA5_Mark                         (dmc_txc_dma5_descriptor[62]),
        .DMA5_SOP                          (dmc_txc_dma5_descriptor[63]),
        .DMA5_Func_Num                     (dmc_txc_dma5_func_num),
        .DMA5_DescList                     (dmc_txc_dma5_descriptor[61:58]),
        .DMA5_Length                       (dmc_txc_dma5_descriptor[56:44]),
        .DMA5_PageHandle                   (dmc_txc_dma5_page_handle),
        .DMA5_Address                      (dmc_txc_dma5_descriptor[43:0]),
        .DMA5_Inc_Head                     (port2_DMA5_inc_head),
        .DMA5_Reset_Done                   (port2_DMA5_reset_done),
        .DMA5_Mark_Bit                     (port2_DMA5_mark_bit),
        .DMA5_Inc_Pkt_Cnt                  (port2_DMA5_inc_pkt_cnt),
        .SetGetNextDescDMA5                (port2_SetGetNextDescDMA5),
        .DMA6_Active                       (dmc_txc_dma6_active),
        .DMA6_EofList                      (dmc_txc_dma6_eoflist),
        .DMA6_Error                        (dmc_txc_dma6_error),
        .DMA6_CacheReady                   (dmc_txc_dma6_cacheready),
        .DMA6_Partial                      (dmc_txc_dma6_partial),
        .DMA6_Reset_Scheduled              (dmc_txc_dma6_reset_scheduled),
        .DMA6_GotNxtDesc                   (dmc_txc_dma6_gotnxtdesc),
        .DMA6_Mark                         (dmc_txc_dma6_descriptor[62]),
        .DMA6_SOP                          (dmc_txc_dma6_descriptor[63]),
        .DMA6_Func_Num                     (dmc_txc_dma6_func_num),
        .DMA6_DescList                     (dmc_txc_dma6_descriptor[61:58]),
        .DMA6_Length                       (dmc_txc_dma6_descriptor[56:44]),
        .DMA6_PageHandle                   (dmc_txc_dma6_page_handle),
        .DMA6_Address                      (dmc_txc_dma6_descriptor[43:0]),
        .DMA6_Inc_Head                     (port2_DMA6_inc_head),
        .DMA6_Reset_Done                   (port2_DMA6_reset_done),
        .DMA6_Mark_Bit                     (port2_DMA6_mark_bit),
        .DMA6_Inc_Pkt_Cnt                  (port2_DMA6_inc_pkt_cnt),
        .SetGetNextDescDMA6                (port2_SetGetNextDescDMA6),
        .DMA7_Active                       (dmc_txc_dma7_active),
        .DMA7_EofList                      (dmc_txc_dma7_eoflist),
        .DMA7_Error                        (dmc_txc_dma7_error),
        .DMA7_CacheReady                   (dmc_txc_dma7_cacheready),
        .DMA7_Partial                      (dmc_txc_dma7_partial),
        .DMA7_Reset_Scheduled              (dmc_txc_dma7_reset_scheduled),
        .DMA7_GotNxtDesc                   (dmc_txc_dma7_gotnxtdesc),
        .DMA7_Mark                         (dmc_txc_dma7_descriptor[62]),
        .DMA7_SOP                          (dmc_txc_dma7_descriptor[63]),
        .DMA7_Func_Num                     (dmc_txc_dma7_func_num),
        .DMA7_DescList                     (dmc_txc_dma7_descriptor[61:58]),
        .DMA7_Length                       (dmc_txc_dma7_descriptor[56:44]),
        .DMA7_PageHandle                   (dmc_txc_dma7_page_handle),
        .DMA7_Address                      (dmc_txc_dma7_descriptor[43:0]),
        .DMA7_Inc_Head                     (port2_DMA7_inc_head),
        .DMA7_Reset_Done                   (port2_DMA7_reset_done),
        .DMA7_Mark_Bit                     (port2_DMA7_mark_bit),
        .DMA7_Inc_Pkt_Cnt                  (port2_DMA7_inc_pkt_cnt),
        .SetGetNextDescDMA7                (port2_SetGetNextDescDMA7),
        .DMA8_Active                       (dmc_txc_dma8_active),
        .DMA8_EofList                      (dmc_txc_dma8_eoflist),
        .DMA8_Error                        (dmc_txc_dma8_error),
        .DMA8_CacheReady                   (dmc_txc_dma8_cacheready),
        .DMA8_Partial                      (dmc_txc_dma8_partial),
        .DMA8_Reset_Scheduled              (dmc_txc_dma8_reset_scheduled),
        .DMA8_GotNxtDesc                   (dmc_txc_dma8_gotnxtdesc),
        .DMA8_Mark                         (dmc_txc_dma8_descriptor[62]),
        .DMA8_SOP                          (dmc_txc_dma8_descriptor[63]),
        .DMA8_Func_Num                     (dmc_txc_dma8_func_num),
        .DMA8_DescList                     (dmc_txc_dma8_descriptor[61:58]),
        .DMA8_Length                       (dmc_txc_dma8_descriptor[56:44]),
        .DMA8_PageHandle                   (dmc_txc_dma8_page_handle),
        .DMA8_Address                      (dmc_txc_dma8_descriptor[43:0]),
        .DMA8_Inc_Head                     (port2_DMA8_inc_head),
        .DMA8_Reset_Done                   (port2_DMA8_reset_done),
        .DMA8_Mark_Bit                     (port2_DMA8_mark_bit),
        .DMA8_Inc_Pkt_Cnt                  (port2_DMA8_inc_pkt_cnt),
        .SetGetNextDescDMA8                (port2_SetGetNextDescDMA8),
        .DMA9_Active                       (dmc_txc_dma9_active),
        .DMA9_EofList                      (dmc_txc_dma9_eoflist),
        .DMA9_Error                        (dmc_txc_dma9_error),
        .DMA9_CacheReady                   (dmc_txc_dma9_cacheready),
        .DMA9_Partial                      (dmc_txc_dma9_partial),
        .DMA9_Reset_Scheduled              (dmc_txc_dma9_reset_scheduled),
        .DMA9_GotNxtDesc                   (dmc_txc_dma9_gotnxtdesc),
        .DMA9_Mark                         (dmc_txc_dma9_descriptor[62]),
        .DMA9_SOP                          (dmc_txc_dma9_descriptor[63]),
        .DMA9_Func_Num                     (dmc_txc_dma9_func_num),
        .DMA9_DescList                     (dmc_txc_dma9_descriptor[61:58]),
        .DMA9_Length                       (dmc_txc_dma9_descriptor[56:44]),
        .DMA9_PageHandle                   (dmc_txc_dma9_page_handle),
        .DMA9_Address                      (dmc_txc_dma9_descriptor[43:0]),
        .DMA9_Inc_Head                     (port2_DMA9_inc_head),
        .DMA9_Reset_Done                   (port2_DMA9_reset_done),
        .DMA9_Mark_Bit                     (port2_DMA9_mark_bit),
        .DMA9_Inc_Pkt_Cnt                  (port2_DMA9_inc_pkt_cnt),
        .SetGetNextDescDMA9                (port2_SetGetNextDescDMA9),
        .DMA10_Active                      (dmc_txc_dma10_active),
        .DMA10_EofList                     (dmc_txc_dma10_eoflist),
        .DMA10_Error                       (dmc_txc_dma10_error),
        .DMA10_CacheReady                  (dmc_txc_dma10_cacheready),
        .DMA10_Partial                     (dmc_txc_dma10_partial),
        .DMA10_Reset_Scheduled             (dmc_txc_dma10_reset_scheduled),
        .DMA10_GotNxtDesc                  (dmc_txc_dma10_gotnxtdesc),
        .DMA10_Mark                        (dmc_txc_dma10_descriptor[62]),
        .DMA10_SOP                         (dmc_txc_dma10_descriptor[63]),
        .DMA10_Func_Num                    (dmc_txc_dma10_func_num),
        .DMA10_DescList                    (dmc_txc_dma10_descriptor[61:58]),
        .DMA10_Length                      (dmc_txc_dma10_descriptor[56:44]),
        .DMA10_PageHandle                  (dmc_txc_dma10_page_handle),
        .DMA10_Address                     (dmc_txc_dma10_descriptor[43:0]),
        .DMA10_Inc_Head                    (port2_DMA10_inc_head),
        .DMA10_Reset_Done                  (port2_DMA10_reset_done),
        .DMA10_Mark_Bit                    (port2_DMA10_mark_bit),
        .DMA10_Inc_Pkt_Cnt                 (port2_DMA10_inc_pkt_cnt),
        .SetGetNextDescDMA10               (port2_SetGetNextDescDMA10),
        .DMA11_Active                      (dmc_txc_dma11_active),
        .DMA11_EofList                     (dmc_txc_dma11_eoflist),
        .DMA11_Error                       (dmc_txc_dma11_error),
        .DMA11_CacheReady                  (dmc_txc_dma11_cacheready),
        .DMA11_Partial                     (dmc_txc_dma11_partial),
        .DMA11_Reset_Scheduled             (dmc_txc_dma11_reset_scheduled),
        .DMA11_GotNxtDesc                  (dmc_txc_dma11_gotnxtdesc),
        .DMA11_Mark                        (dmc_txc_dma11_descriptor[62]),
        .DMA11_SOP                         (dmc_txc_dma11_descriptor[63]),
        .DMA11_Func_Num                    (dmc_txc_dma11_func_num),
        .DMA11_DescList                    (dmc_txc_dma11_descriptor[61:58]),
        .DMA11_Length                      (dmc_txc_dma11_descriptor[56:44]),
        .DMA11_PageHandle                  (dmc_txc_dma11_page_handle),
        .DMA11_Address                     (dmc_txc_dma11_descriptor[43:0]),
        .DMA11_Inc_Head                    (port2_DMA11_inc_head),
        .DMA11_Reset_Done                  (port2_DMA11_reset_done),
        .DMA11_Mark_Bit                    (port2_DMA11_mark_bit),
        .DMA11_Inc_Pkt_Cnt                 (port2_DMA11_inc_pkt_cnt),
        .SetGetNextDescDMA11               (port2_SetGetNextDescDMA11),
        .DMA12_Active                      (dmc_txc_dma12_active),
        .DMA12_EofList                     (dmc_txc_dma12_eoflist),
        .DMA12_Error                       (dmc_txc_dma12_error),
        .DMA12_CacheReady                  (dmc_txc_dma12_cacheready),
        .DMA12_Partial                     (dmc_txc_dma12_partial),
        .DMA12_Reset_Scheduled             (dmc_txc_dma12_reset_scheduled),
        .DMA12_GotNxtDesc                  (dmc_txc_dma12_gotnxtdesc),
        .DMA12_Mark                        (dmc_txc_dma12_descriptor[62]),
        .DMA12_SOP                         (dmc_txc_dma12_descriptor[63]),
        .DMA12_Func_Num                    (dmc_txc_dma12_func_num),
        .DMA12_DescList                    (dmc_txc_dma12_descriptor[61:58]),
        .DMA12_Length                      (dmc_txc_dma12_descriptor[56:44]),
        .DMA12_PageHandle                  (dmc_txc_dma12_page_handle),
        .DMA12_Address                     (dmc_txc_dma12_descriptor[43:0]),
        .DMA12_Inc_Head                    (port2_DMA12_inc_head),
        .DMA12_Reset_Done                  (port2_DMA12_reset_done),
        .DMA12_Mark_Bit                    (port2_DMA12_mark_bit),
        .DMA12_Inc_Pkt_Cnt                 (port2_DMA12_inc_pkt_cnt),
        .SetGetNextDescDMA12               (port2_SetGetNextDescDMA12),
        .DMA13_Active                      (dmc_txc_dma13_active),
        .DMA13_EofList                     (dmc_txc_dma13_eoflist),
        .DMA13_Error                       (dmc_txc_dma13_error),
        .DMA13_CacheReady                  (dmc_txc_dma13_cacheready),
        .DMA13_Partial                     (dmc_txc_dma13_partial),
        .DMA13_Reset_Scheduled             (dmc_txc_dma13_reset_scheduled),
        .DMA13_GotNxtDesc                  (dmc_txc_dma13_gotnxtdesc),
        .DMA13_Mark                        (dmc_txc_dma13_descriptor[62]),
        .DMA13_SOP                         (dmc_txc_dma13_descriptor[63]),
        .DMA13_Func_Num                    (dmc_txc_dma13_func_num),
        .DMA13_DescList                    (dmc_txc_dma13_descriptor[61:58]),
        .DMA13_Length                      (dmc_txc_dma13_descriptor[56:44]),
        .DMA13_PageHandle                  (dmc_txc_dma13_page_handle),
        .DMA13_Address                     (dmc_txc_dma13_descriptor[43:0]),
        .DMA13_Inc_Head                    (port2_DMA13_inc_head),
        .DMA13_Reset_Done                  (port2_DMA13_reset_done),
        .DMA13_Mark_Bit                    (port2_DMA13_mark_bit),
        .DMA13_Inc_Pkt_Cnt                 (port2_DMA13_inc_pkt_cnt),
        .SetGetNextDescDMA13               (port2_SetGetNextDescDMA13),
        .DMA14_Active                      (dmc_txc_dma14_active),
        .DMA14_EofList                     (dmc_txc_dma14_eoflist),
        .DMA14_Error                       (dmc_txc_dma14_error),
        .DMA14_CacheReady                  (dmc_txc_dma14_cacheready),
        .DMA14_Partial                     (dmc_txc_dma14_partial),
        .DMA14_Reset_Scheduled             (dmc_txc_dma14_reset_scheduled),
        .DMA14_GotNxtDesc                  (dmc_txc_dma14_gotnxtdesc),
        .DMA14_Mark                        (dmc_txc_dma14_descriptor[62]),
        .DMA14_SOP                         (dmc_txc_dma14_descriptor[63]),
        .DMA14_Func_Num                    (dmc_txc_dma14_func_num),
        .DMA14_DescList                    (dmc_txc_dma14_descriptor[61:58]),
        .DMA14_Length                      (dmc_txc_dma14_descriptor[56:44]),
        .DMA14_PageHandle                  (dmc_txc_dma14_page_handle),
        .DMA14_Address                     (dmc_txc_dma14_descriptor[43:0]),
        .DMA14_Inc_Head                    (port2_DMA14_inc_head),
        .DMA14_Reset_Done                  (port2_DMA14_reset_done),
        .DMA14_Mark_Bit                    (port2_DMA14_mark_bit),
        .DMA14_Inc_Pkt_Cnt                 (port2_DMA14_inc_pkt_cnt),
        .SetGetNextDescDMA14               (port2_SetGetNextDescDMA14),
        .DMA15_Active                      (dmc_txc_dma15_active),
        .DMA15_EofList                     (dmc_txc_dma15_eoflist),
        .DMA15_Error                       (dmc_txc_dma15_error),
        .DMA15_CacheReady                  (dmc_txc_dma15_cacheready),
        .DMA15_Partial                     (dmc_txc_dma15_partial),
        .DMA15_Reset_Scheduled             (dmc_txc_dma15_reset_scheduled),
        .DMA15_GotNxtDesc                  (dmc_txc_dma15_gotnxtdesc),
        .DMA15_Mark                        (dmc_txc_dma15_descriptor[62]),
        .DMA15_SOP                         (dmc_txc_dma15_descriptor[63]),
        .DMA15_Func_Num                    (dmc_txc_dma15_func_num),
        .DMA15_DescList                    (dmc_txc_dma15_descriptor[61:58]),
        .DMA15_Length                      (dmc_txc_dma15_descriptor[56:44]),
        .DMA15_PageHandle                  (dmc_txc_dma15_page_handle),
        .DMA15_Address                     (dmc_txc_dma15_descriptor[43:0]),
        .DMA15_Inc_Head                    (port2_DMA15_inc_head),
        .DMA15_Reset_Done                  (port2_DMA15_reset_done),
        .DMA15_Mark_Bit                    (port2_DMA15_mark_bit),
        .DMA15_Inc_Pkt_Cnt                 (port2_DMA15_inc_pkt_cnt),
        .SetGetNextDescDMA15               (port2_SetGetNextDescDMA15),
        .DMA16_Active                      (dmc_txc_dma16_active),
        .DMA16_EofList                     (dmc_txc_dma16_eoflist),
        .DMA16_Error                       (dmc_txc_dma16_error),
        .DMA16_CacheReady                  (dmc_txc_dma16_cacheready),
        .DMA16_Partial                     (dmc_txc_dma16_partial),
        .DMA16_Reset_Scheduled             (dmc_txc_dma16_reset_scheduled),
        .DMA16_GotNxtDesc                  (dmc_txc_dma16_gotnxtdesc),
        .DMA16_Mark                        (dmc_txc_dma16_descriptor[62]),
        .DMA16_SOP                         (dmc_txc_dma16_descriptor[63]),
        .DMA16_Func_Num                    (dmc_txc_dma16_func_num),
        .DMA16_DescList                    (dmc_txc_dma16_descriptor[61:58]),
        .DMA16_Length                      (dmc_txc_dma16_descriptor[56:44]),
        .DMA16_PageHandle                  (dmc_txc_dma16_page_handle),
        .DMA16_Address                     (dmc_txc_dma16_descriptor[43:0]),
        .DMA16_Inc_Head                    (port2_DMA16_inc_head),
        .DMA16_Reset_Done                  (port2_DMA16_reset_done),
        .DMA16_Mark_Bit                    (port2_DMA16_mark_bit),
        .DMA16_Inc_Pkt_Cnt                 (port2_DMA16_inc_pkt_cnt),
        .SetGetNextDescDMA16               (port2_SetGetNextDescDMA16),
        .DMA17_Active                      (dmc_txc_dma17_active),
        .DMA17_EofList                     (dmc_txc_dma17_eoflist),
        .DMA17_Error                       (dmc_txc_dma17_error),
        .DMA17_CacheReady                  (dmc_txc_dma17_cacheready),
        .DMA17_Partial                     (dmc_txc_dma17_partial),
        .DMA17_Reset_Scheduled             (dmc_txc_dma17_reset_scheduled),
        .DMA17_GotNxtDesc                  (dmc_txc_dma17_gotnxtdesc),
        .DMA17_Mark                        (dmc_txc_dma17_descriptor[62]),
        .DMA17_SOP                         (dmc_txc_dma17_descriptor[63]),
        .DMA17_Func_Num                    (dmc_txc_dma17_func_num),
        .DMA17_DescList                    (dmc_txc_dma17_descriptor[61:58]),
        .DMA17_Length                      (dmc_txc_dma17_descriptor[56:44]),
        .DMA17_PageHandle                  (dmc_txc_dma17_page_handle),
        .DMA17_Address                     (dmc_txc_dma17_descriptor[43:0]),
        .DMA17_Inc_Head                    (port2_DMA17_inc_head),
        .DMA17_Reset_Done                  (port2_DMA17_reset_done),
        .DMA17_Mark_Bit                    (port2_DMA17_mark_bit),
        .DMA17_Inc_Pkt_Cnt                 (port2_DMA17_inc_pkt_cnt),
        .SetGetNextDescDMA17               (port2_SetGetNextDescDMA17),
        .DMA18_Active                      (dmc_txc_dma18_active),
        .DMA18_EofList                     (dmc_txc_dma18_eoflist),
        .DMA18_Error                       (dmc_txc_dma18_error),
        .DMA18_CacheReady                  (dmc_txc_dma18_cacheready),
        .DMA18_Partial                     (dmc_txc_dma18_partial),
        .DMA18_Reset_Scheduled             (dmc_txc_dma18_reset_scheduled),
        .DMA18_GotNxtDesc                  (dmc_txc_dma18_gotnxtdesc),
        .DMA18_Mark                        (dmc_txc_dma18_descriptor[62]),
        .DMA18_SOP                         (dmc_txc_dma18_descriptor[63]),
        .DMA18_Func_Num                    (dmc_txc_dma18_func_num),
        .DMA18_DescList                    (dmc_txc_dma18_descriptor[61:58]),
        .DMA18_Length                      (dmc_txc_dma18_descriptor[56:44]),
        .DMA18_PageHandle                  (dmc_txc_dma18_page_handle),
        .DMA18_Address                     (dmc_txc_dma18_descriptor[43:0]),
        .DMA18_Inc_Head                    (port2_DMA18_inc_head),
        .DMA18_Reset_Done                  (port2_DMA18_reset_done),
        .DMA18_Mark_Bit                    (port2_DMA18_mark_bit),
        .DMA18_Inc_Pkt_Cnt                 (port2_DMA18_inc_pkt_cnt),
        .SetGetNextDescDMA18               (port2_SetGetNextDescDMA18),
        .DMA19_Active                      (dmc_txc_dma19_active),
        .DMA19_EofList                     (dmc_txc_dma19_eoflist),
        .DMA19_Error                       (dmc_txc_dma19_error),
        .DMA19_CacheReady                  (dmc_txc_dma19_cacheready),
        .DMA19_Partial                     (dmc_txc_dma19_partial),
        .DMA19_Reset_Scheduled             (dmc_txc_dma19_reset_scheduled),
        .DMA19_GotNxtDesc                  (dmc_txc_dma19_gotnxtdesc),
        .DMA19_Mark                        (dmc_txc_dma19_descriptor[62]),
        .DMA19_SOP                         (dmc_txc_dma19_descriptor[63]),
        .DMA19_Func_Num                    (dmc_txc_dma19_func_num),
        .DMA19_DescList                    (dmc_txc_dma19_descriptor[61:58]),
        .DMA19_Length                      (dmc_txc_dma19_descriptor[56:44]),
        .DMA19_PageHandle                  (dmc_txc_dma19_page_handle),
        .DMA19_Address                     (dmc_txc_dma19_descriptor[43:0]),
        .DMA19_Inc_Head                    (port2_DMA19_inc_head),
        .DMA19_Reset_Done                  (port2_DMA19_reset_done),
        .DMA19_Mark_Bit                    (port2_DMA19_mark_bit),
        .DMA19_Inc_Pkt_Cnt                 (port2_DMA19_inc_pkt_cnt),
        .SetGetNextDescDMA19               (port2_SetGetNextDescDMA19),
        .DMA20_Active                      (dmc_txc_dma20_active),
        .DMA20_EofList                     (dmc_txc_dma20_eoflist),
        .DMA20_Error                       (dmc_txc_dma20_error),
        .DMA20_CacheReady                  (dmc_txc_dma20_cacheready),
        .DMA20_Partial                     (dmc_txc_dma20_partial),
        .DMA20_Reset_Scheduled             (dmc_txc_dma20_reset_scheduled),
        .DMA20_GotNxtDesc                  (dmc_txc_dma20_gotnxtdesc),
        .DMA20_Mark                        (dmc_txc_dma20_descriptor[62]),
        .DMA20_SOP                         (dmc_txc_dma20_descriptor[63]),
        .DMA20_Func_Num                    (dmc_txc_dma20_func_num),
        .DMA20_DescList                    (dmc_txc_dma20_descriptor[61:58]),
        .DMA20_Length                      (dmc_txc_dma20_descriptor[56:44]),
        .DMA20_PageHandle                  (dmc_txc_dma20_page_handle),
        .DMA20_Address                     (dmc_txc_dma20_descriptor[43:0]),
        .DMA20_Inc_Head                    (port2_DMA20_inc_head),
        .DMA20_Reset_Done                  (port2_DMA20_reset_done),
        .DMA20_Mark_Bit                    (port2_DMA20_mark_bit),
        .DMA20_Inc_Pkt_Cnt                 (port2_DMA20_inc_pkt_cnt),
        .SetGetNextDescDMA20               (port2_SetGetNextDescDMA20),
        .DMA21_Active                      (dmc_txc_dma21_active),
        .DMA21_EofList                     (dmc_txc_dma21_eoflist),
        .DMA21_Error                       (dmc_txc_dma21_error),
        .DMA21_CacheReady                  (dmc_txc_dma21_cacheready),
        .DMA21_Partial                     (dmc_txc_dma21_partial),
        .DMA21_Reset_Scheduled             (dmc_txc_dma21_reset_scheduled),
        .DMA21_GotNxtDesc                  (dmc_txc_dma21_gotnxtdesc),
        .DMA21_Mark                        (dmc_txc_dma21_descriptor[62]),
        .DMA21_SOP                         (dmc_txc_dma21_descriptor[63]),
        .DMA21_Func_Num                    (dmc_txc_dma21_func_num),
        .DMA21_DescList                    (dmc_txc_dma21_descriptor[61:58]),
        .DMA21_Length                      (dmc_txc_dma21_descriptor[56:44]),
        .DMA21_PageHandle                  (dmc_txc_dma21_page_handle),
        .DMA21_Address                     (dmc_txc_dma21_descriptor[43:0]),
        .DMA21_Inc_Head                    (port2_DMA21_inc_head),
        .DMA21_Reset_Done                  (port2_DMA21_reset_done),
        .DMA21_Mark_Bit                    (port2_DMA21_mark_bit),
        .DMA21_Inc_Pkt_Cnt                 (port2_DMA21_inc_pkt_cnt),
        .SetGetNextDescDMA21               (port2_SetGetNextDescDMA21),
        .DMA22_Active                      (dmc_txc_dma22_active),
        .DMA22_EofList                     (dmc_txc_dma22_eoflist),
        .DMA22_Error                       (dmc_txc_dma22_error),
        .DMA22_CacheReady                  (dmc_txc_dma22_cacheready),
        .DMA22_Partial                     (dmc_txc_dma22_partial),
        .DMA22_Reset_Scheduled             (dmc_txc_dma22_reset_scheduled),
        .DMA22_GotNxtDesc                  (dmc_txc_dma22_gotnxtdesc),
        .DMA22_Mark                        (dmc_txc_dma22_descriptor[62]),
        .DMA22_SOP                         (dmc_txc_dma22_descriptor[63]),
        .DMA22_Func_Num                    (dmc_txc_dma22_func_num),
        .DMA22_DescList                    (dmc_txc_dma22_descriptor[61:58]),
        .DMA22_Length                      (dmc_txc_dma22_descriptor[56:44]),
        .DMA22_PageHandle                  (dmc_txc_dma22_page_handle),
        .DMA22_Address                     (dmc_txc_dma22_descriptor[43:0]),
        .DMA22_Inc_Head                    (port2_DMA22_inc_head),
        .DMA22_Reset_Done                  (port2_DMA22_reset_done),
        .DMA22_Mark_Bit                    (port2_DMA22_mark_bit),
        .DMA22_Inc_Pkt_Cnt                 (port2_DMA22_inc_pkt_cnt),
        .SetGetNextDescDMA22               (port2_SetGetNextDescDMA22),
        .DMA23_Active                      (dmc_txc_dma23_active),
        .DMA23_EofList                     (dmc_txc_dma23_eoflist),
        .DMA23_Error                       (dmc_txc_dma23_error),
        .DMA23_CacheReady                  (dmc_txc_dma23_cacheready),
        .DMA23_Partial                     (dmc_txc_dma23_partial),
        .DMA23_Reset_Scheduled             (dmc_txc_dma23_reset_scheduled),
        .DMA23_GotNxtDesc                  (dmc_txc_dma23_gotnxtdesc),
        .DMA23_Mark                        (dmc_txc_dma23_descriptor[62]),
        .DMA23_SOP                         (dmc_txc_dma23_descriptor[63]),
        .DMA23_Func_Num                    (dmc_txc_dma23_func_num),
        .DMA23_DescList                    (dmc_txc_dma23_descriptor[61:58]),
        .DMA23_Length                      (dmc_txc_dma23_descriptor[56:44]),
        .DMA23_PageHandle                  (dmc_txc_dma23_page_handle),
        .DMA23_Address                     (dmc_txc_dma23_descriptor[43:0]),
        .DMA23_Inc_Head                    (port2_DMA23_inc_head),
        .DMA23_Reset_Done                  (port2_DMA23_reset_done),
        .DMA23_Mark_Bit                    (port2_DMA23_mark_bit),
        .DMA23_Inc_Pkt_Cnt                 (port2_DMA23_inc_pkt_cnt),
        .SetGetNextDescDMA23               (port2_SetGetNextDescDMA23),

        .DMA0_NewMaxBurst                  (dma0_NewMaxBurst),
        .DMA1_NewMaxBurst                  (dma1_NewMaxBurst),
        .DMA2_NewMaxBurst                  (dma2_NewMaxBurst),
        .DMA3_NewMaxBurst                  (dma3_NewMaxBurst),
        .DMA4_NewMaxBurst                  (dma4_NewMaxBurst),
        .DMA5_NewMaxBurst                  (dma5_NewMaxBurst),
        .DMA6_NewMaxBurst                  (dma6_NewMaxBurst),
        .DMA7_NewMaxBurst                  (dma7_NewMaxBurst),
        .DMA8_NewMaxBurst                  (dma8_NewMaxBurst),
        .DMA9_NewMaxBurst                  (dma9_NewMaxBurst),
        .DMA10_NewMaxBurst                 (dma10_NewMaxBurst),
        .DMA11_NewMaxBurst                 (dma11_NewMaxBurst),
        .DMA12_NewMaxBurst                 (dma12_NewMaxBurst),
        .DMA13_NewMaxBurst                 (dma13_NewMaxBurst),
        .DMA14_NewMaxBurst                 (dma14_NewMaxBurst),
        .DMA15_NewMaxBurst                 (dma15_NewMaxBurst),
        .DMA16_NewMaxBurst                 (dma16_NewMaxBurst),
        .DMA17_NewMaxBurst                 (dma17_NewMaxBurst),
        .DMA18_NewMaxBurst                 (dma18_NewMaxBurst),
        .DMA19_NewMaxBurst                 (dma19_NewMaxBurst),
        .DMA20_NewMaxBurst                 (dma20_NewMaxBurst),
        .DMA21_NewMaxBurst                 (dma21_NewMaxBurst),
        .DMA22_NewMaxBurst                 (dma22_NewMaxBurst),
        .DMA23_NewMaxBurst                 (dma23_NewMaxBurst),
        .DMA0_MaxBurst                     (dma0_MaxBurst),
        .DMA1_MaxBurst                     (dma1_MaxBurst),
        .DMA2_MaxBurst                     (dma2_MaxBurst),
        .DMA3_MaxBurst                     (dma3_MaxBurst),
        .DMA4_MaxBurst                     (dma4_MaxBurst),
        .DMA5_MaxBurst                     (dma5_MaxBurst),
        .DMA6_MaxBurst                     (dma6_MaxBurst),
        .DMA7_MaxBurst                     (dma7_MaxBurst),
        .DMA8_MaxBurst                     (dma8_MaxBurst),
        .DMA9_MaxBurst                     (dma9_MaxBurst),
        .DMA10_MaxBurst                    (dma10_MaxBurst),
        .DMA11_MaxBurst                    (dma11_MaxBurst),
        .DMA12_MaxBurst                    (dma12_MaxBurst),
        .DMA13_MaxBurst                    (dma13_MaxBurst),
        .DMA14_MaxBurst                    (dma14_MaxBurst),
        .DMA15_MaxBurst                    (dma15_MaxBurst),
        .DMA16_MaxBurst                    (dma16_MaxBurst),
        .DMA17_MaxBurst                    (dma17_MaxBurst),
        .DMA18_MaxBurst                    (dma18_MaxBurst),
        .DMA19_MaxBurst                    (dma19_MaxBurst),
        .DMA20_MaxBurst                    (dma20_MaxBurst),
        .DMA21_MaxBurst                    (dma21_MaxBurst),
        .DMA22_MaxBurst                    (dma22_MaxBurst),
        .DMA23_MaxBurst                    (dma23_MaxBurst),
        .MaxReorderNumber                  (port2_MaxReorderNumber),
        .Port_DMA_List                     (port2_DMA_List),
        .ClrMaxBurst                       (port2_clrMaxBurst),
        .UpdateDMA                         (port2_UpdateDMA),
        .UpdateDMALength                   (port2_UpdateDMALength),
        .UpdateDMANumber                   (port2_UpdateDMANumber),

        .DMC_TXC_Req_Ack                   (arb1_txc_req_accept),
        .DMC_TXC_Req_TransID               (arb1_txc_req_transid),

        .Port_Selected                     (port_Selected[2]),
        .Port_Request                      (port2_Request),
        .Port_Request_Func_Num             (port2_Request_Func_Num),
        .Port_Request_DMA_Num              (port2_Request_DMA_Num),
        .Port_Request_Length               (port2_Request_Length),
        .Port_Request_Address              (port2_Request_Address),

        .DMC_TXC_Resp_Rdy                  (dMC_TXC_Resp_Rdy),
        .DMC_TXC_Resp_Complete             (dMC_TXC_Resp_Complete),
        .DMC_TXC_Trans_Complete            (dMC_TXC_Trans_Complete),
        .DMC_TXC_Resp_Data_Valid           (dMC_TXC_Resp_Data_Valid),
        .DMC_TXC_Resp_Client               (dMC_TXC_Resp_Client),
        .DMC_TXC_Resp_Port_Num             (dMC_TXC_Resp_Port_Num),
        .DMC_TXC_Resp_Cmd_Status           (dMC_TXC_Resp_Cmd_Status),
        .DMC_TXC_Resp_Data_Status          (dMC_TXC_Resp_Data_Status),
        .DMC_TXC_Resp_DMA_Num              (dMC_TXC_Resp_DMA_Num),
        .DMC_TXC_Resp_TransID              (dMC_TXC_Resp_TransID),
        .DMC_TXC_Resp_Cmd                  (dMC_TXC_Resp_Cmd),
        .DMC_TXC_Resp_Data_Length          (dMC_TXC_Resp_Data_Length),
        .DMC_TXC_Resp_ByteEnables          (dMC_TXC_Resp_ByteEnables),
        .DMC_TXC_Resp_Address              (dMC_TXC_Resp_Address),
        .DMC_TXC_Resp_Data                 (dMC_TXC_Resp_Data),
        .TXC_DMC_Resp_Accept               (port2_TXC_DMC_Resp_Accept),

        .ReOrderFifoDataValid              (port2_ReOrderFifoDataValid),
        .ReOrderUnCorrectError             (port2_ReOrder_UnCorrectError),
        .ReOrderEccControl                 (port2_ReOrderEccControl),
        .PacketAssyEngineDataIn            (port2_PacketAssyEngineDataIn),
        .ReOrderCorruptECCSingle           (port2_ReOrderCorruptECCSingle),
        .ReOrderCorruptECCDouble           (port2_ReOrderCorruptECCDouble),
        .ReOrderFifoWrite                  (port2_ReOrderFifoWrite),
        .ReOrderFifoReadStrobe             (port2_ReOrderFifoRead),
        .ReOrderWritePtr                   (port2_ReOrderWritePtr),
        .ReOrderReadPtr                    (port2_ReOrderReadPtr),
        .ReOrderEngineDataOut              (port2_ReOrderEngineDataOut),

        .StoreForwardUnCorrectError        (port2_StoreForward_UnCorrectError),
        .StoreForwardEccControl            (port2_StoreForwardEccControl),
        .MacXferEngineDataIn               (port2_MacXferEngineDataIn),
        .StoreForward_CorruptECCSingle     (port2_StoreForwardCorruptECCSingle),
        .StoreForward_CorruptECCDouble     (port2_StoreForwardCorruptECCDouble),
        .StoreForwardFifoWrite             (port2_StoreForwardFifoWrite),
        .StoreForwardFifoReadStrobe        (port2_StoreForwardFifoRead),
        .StoreForwardWritePtr              (port2_StoreForwardWritePtr),
        .StoreForwardReadPtr               (port2_StoreForwardReadPtr),
        .PacketAssyEngineDataOut           (port2_PacketAssyEngineDataOut),

        .LatchActiveDMA                    (port2_LatchActiveDMA),
        .ContextActiveList                 (port2_ContextActiveList),

        .Anchor_State                      (port2_Anchor_State),
        .ReOrder_State                     (port2_ReOrder_State),
        .Pointer_State                     (port2_Pointer_State),
        .PacketAssy_State                  (port2_PacketAssy_State),
        .DRR_ArbState                      (port2_DRR_ArbState),
        .Mac_Xfer_State                    (port2_Mac_Xfer_State),
        .DataPortReq_State                 (port2_DataPortReq_State),
        .Sum_prt_state                     (port2_Sum_prt_state)
       );


niu_txc_ecc_engine port2_niu_txc_ecc_engine (
        .SysClk                            (niu_clk),
        .Reset_L                           (reset_l),
        .ReOrder_ClearEccError             (port2_ReOrder_ClearEccError),
        .WrReOrderEccState                 (port2_WrReOrderEccState),
        .WrReOrderEccData0                 (port2_WrReOrderEccData0),
        .WrReOrderEccData1                 (port2_WrReOrderEccData1),
        .WrReOrderEccData2                 (port2_WrReOrderEccData2),
        .WrReOrderEccData3                 (port2_WrReOrderEccData3),
        .WrReOrderEccData4                 (port2_WrReOrderEccData4),
        .StoreForward_ClearEccError        (port2_StoreForward_ClearEccError),
        .WrStoreForwardEccState            (port2_WrStoreForwardEccState),
        .WrStoreForwardEccData0            (port2_WrStoreForwardEccData0),
        .WrStoreForwardEccData1            (port2_WrStoreForwardEccData1),
        .WrStoreForwardEccData2            (port2_WrStoreForwardEccData2),
        .WrStoreForwardEccData3            (port2_WrStoreForwardEccData3),
        .WrStoreForwardEccData4            (port2_WrStoreForwardEccData4),
        .PioDataIn                         (port2_PioDataIn),
        .ReOrder_ECC_State                 (port2_ReOrder_ECC_State),
        .ReOrder_EccData                   (port2_ReOrder_EccData),
        .StoreForward_ECC_State            (port2_StoreForward_ECC_State),
        .StoreForward_EccData              (port2_StoreForward_EccData),
        .ReOrder_CorruptECCSingle          (port2_ReOrderCorruptECCSingle),
        .ReOrder_CorruptECCDouble          (port2_ReOrderCorruptECCDouble),
        .ReOrder_FifoRead                  (port2_ReOrderFifoRead),
        .ReOrder_ReadPtr                   (port2_ReOrderReadPtr),
        .ReOrder_FifoDataOut               (port2_ReOrderFifoDataOut),
        .ReOrder_FifoDataValid             (port2_ReOrderFifoDataValid),
        .ReOrder_UnCorrectError            (port2_ReOrder_UnCorrectError),
        .ReOrder_PreECCData                (port2_ReOrderEngineDataOut),
        .ReOrder_PostECCData               (port2_ReOrderFifoDataIn),
        .ReOrder_CorrectedData             (port2_PacketAssyEngineDataIn),
        .StoreForward_CorruptECCSingle     (port2_StoreForwardCorruptECCSingle),
        .StoreForward_CorruptECCDouble     (port2_StoreForwardCorruptECCDouble),
        .StoreForward_FifoRead             (port2_StoreForwardFifoRead),
        .StoreForward_ReadPtr              (port2_StoreForwardReadPtr),
        .StoreForward_FifoDataOut          (port2_StoreForwardFifoDataOut),
        .StoreForward_UnCorrectError       (port2_StoreForward_UnCorrectError),
        .StoreForward_PreECCData           (port2_PacketAssyEngineDataOut),
        .StoreForward_PostECCData          (port2_StoreForwardFifoDataIn),
        .StoreForward_CorrectedData        (port2_MacXferEngineDataIn)
       );


niu_ram_1024_152 port2_RO_RAM (
        .clk                               (niu_clk),
        .wt_enable                         (port2_ReOrderFifoWrite),
        .cs_rd                             (port2_ReOrderFifoRead),
        .addr_rd                           (port2_ReOrderReadPtr),
        .addr_wt                           (port2_ReOrderWritePtr),
        .data_inp                          (port2_ReOrderFifoDataIn),
        .data_out                          (port2_ReOrderFifoDataOut)
       );


niu_ram_640_152 port2_SF_RAM (
        .clk                               (niu_clk),
        .wt_enable                         (port2_StoreForwardFifoWrite),
        .cs_rd                             (port2_StoreForwardFifoRead),
        .addr_rd                           (port2_StoreForwardReadPtr),
        .addr_wt                           (port2_StoreForwardWritePtr),
        .data_inp                          (port2_StoreForwardFifoDataIn),
        .data_out                          (port2_StoreForwardFifoDataOut)
       );


niu_txc_packetEngine #(REORDER_SIZE_1G, REORDER_PTR_1G) niu_txc_packetEngine3 (
        .SysClk                            (niu_clk),
        .Reset_L                           (reset_l),
        .PacketAssyDead                    (port3_PacketAssyDead),
        .ReOrder_Error                     (port3_ReOrder_Error),
        .Txc_Enabled                       (txc_Enabled),
        .PortIndentifier                   (`PORT_THREE),
        .EnableGMACMode                    (1'b1),
        .MAC_Enabled                       (port3_Enabled),
        .FlushEngine                       (flushEngine),

        .MAC_Req                           (port3_mac_req),
        .MAC_Ack                           (txc_mac_ack3),
        .MAC_Tag                           (txc_mac_tag3),
        .MAC_Status                        (),
        .MAC_Abort                         (),
        .MAC_Data                          (txc_mac_data3),

        .TidsInUse                         (port3_TidsInUse),
        .DuplicateTid                      (port3_DuplicateTid),
        .UnInitializedTID                  (port3_UnInitializedTID),
        .TimedoutTids                      (port3_TimedoutTids),
        .ReOrderStateLogic                 (port3_ReOrderStateLogic),
        .ReOrderStateControl               (port3_ReOrderStateControl),
        .ReOrderStateData0                 (port3_ReOrderStateData0),
        .ReOrderStateData1                 (port3_ReOrderStateData1),
        .ReOrderStateData2                 (port3_ReOrderStateData2),
        .ReOrderStateData3                 (port3_ReOrderStateData3),
        .WrTidsInUse                       (port3_WrTidsInUse),
        .WrDuplicateTid                    (port3_WrDuplicateTid),
        .WrUnInitializedTID                (port3_WrUnInitializedTID),
        .WrTimedoutTids                    (port3_WrTimedoutTids),
        .WrReOrderStateLogic               (port3_WrReOrderStateLogic),
        .WrReOrderStateControl             (port3_WrReOrderStateControl),
        .WrReOrderStateData0               (port3_WrReOrderStateData0),
        .WrReOrderStateData1               (port3_WrReOrderStateData1),
        .WrReOrderStateData2               (port3_WrReOrderStateData2),
        .WrReOrderStateData3               (port3_WrReOrderStateData3),
        .PioDataIn                         (port3_PioDataIn),

        .ClearStatistics                   (port3_ClearStatistics),
        .WrPacketStuffed                   (port3_WrPacketStuffed),
        .WrPacketXmitted                   (port3_WrPacketXmitted),
        .WrPacketRequested                 (port3_WrPacketRequested),
        .GatherRequestCount                (port3_GatherRequestCount),
        .PacketRequestCount                (port3_PacketRequestCount),
        .PktErrAbortCount                  (port3_PktErrAbortCount),
        .ReOrdersStuffed                   (port3_ReOrdersStuffed),
        .PacketsStuffed                    (port3_PacketsStuffed),
        .PacketsTransmitted                (port3_PacketsTransmitted),
        .BytesTransmitted                  (port3_BytesTransmitted),

        .Pkt_Size_Err                      (txc_dmc_p3_pkt_size_err),
        .DMA_Pkt_Size_Err                  (txc_dmc_p3_dma_pkt_size_err),
        .Pkt_Size_Err_Addr                 (txc_dmc_p3_pkt_size_err_addr),

        .Nack_Pkt_Rd                       (port3_Nack_Pkt_Rd),
        .DMA_Nack_Pkt_Rd                   (port3_DMA_Nack_Pkt_Rd),
        .Nack_Pkt_Rd_Addr                  (port3_Nack_Pkt_Rd_Addr),

        .DMA0_Active                       (dmc_txc_dma0_active),
        .DMA0_EofList                      (dmc_txc_dma0_eoflist),
        .DMA0_Error                        (dmc_txc_dma0_error),
        .DMA0_CacheReady                   (dmc_txc_dma0_cacheready),
        .DMA0_Partial                      (dmc_txc_dma0_partial),
        .DMA0_Reset_Scheduled              (dmc_txc_dma0_reset_scheduled),
        .DMA0_GotNxtDesc                   (dmc_txc_dma0_gotnxtdesc),
        .DMA0_Mark                         (dmc_txc_dma0_descriptor[62]),
        .DMA0_SOP                          (dmc_txc_dma0_descriptor[63]),
        .DMA0_Func_Num                     (dmc_txc_dma0_func_num),
        .DMA0_DescList                     (dmc_txc_dma0_descriptor[61:58]),
        .DMA0_Length                       (dmc_txc_dma0_descriptor[56:44]),
        .DMA0_PageHandle                   (dmc_txc_dma0_page_handle),
        .DMA0_Address                      (dmc_txc_dma0_descriptor[43:0]),
        .DMA0_Inc_Head                     (port3_DMA0_inc_head),
        .DMA0_Reset_Done                   (port3_DMA0_reset_done),
        .DMA0_Mark_Bit                     (port3_DMA0_mark_bit),
        .DMA0_Inc_Pkt_Cnt                  (port3_DMA0_inc_pkt_cnt),
        .SetGetNextDescDMA0                (port3_SetGetNextDescDMA0),
        .DMA1_Active                       (dmc_txc_dma1_active),
        .DMA1_EofList                      (dmc_txc_dma1_eoflist),
        .DMA1_Error                        (dmc_txc_dma1_error),
        .DMA1_CacheReady                   (dmc_txc_dma1_cacheready),
        .DMA1_Partial                      (dmc_txc_dma1_partial),
        .DMA1_Reset_Scheduled              (dmc_txc_dma1_reset_scheduled),
        .DMA1_GotNxtDesc                   (dmc_txc_dma1_gotnxtdesc),
        .DMA1_Mark                         (dmc_txc_dma1_descriptor[62]),
        .DMA1_SOP                          (dmc_txc_dma1_descriptor[63]),
        .DMA1_Func_Num                     (dmc_txc_dma1_func_num),
        .DMA1_DescList                     (dmc_txc_dma1_descriptor[61:58]),
        .DMA1_Length                       (dmc_txc_dma1_descriptor[56:44]),
        .DMA1_PageHandle                   (dmc_txc_dma1_page_handle),
        .DMA1_Address                      (dmc_txc_dma1_descriptor[43:0]),
        .DMA1_Inc_Head                     (port3_DMA1_inc_head),
        .DMA1_Reset_Done                   (port3_DMA1_reset_done),
        .DMA1_Mark_Bit                     (port3_DMA1_mark_bit),
        .DMA1_Inc_Pkt_Cnt                  (port3_DMA1_inc_pkt_cnt),
        .SetGetNextDescDMA1                (port3_SetGetNextDescDMA1),
        .DMA2_Active                       (dmc_txc_dma2_active),
        .DMA2_EofList                      (dmc_txc_dma2_eoflist),
        .DMA2_Error                        (dmc_txc_dma2_error),
        .DMA2_CacheReady                   (dmc_txc_dma2_cacheready),
        .DMA2_Partial                      (dmc_txc_dma2_partial),
        .DMA2_Reset_Scheduled              (dmc_txc_dma2_reset_scheduled),
        .DMA2_GotNxtDesc                   (dmc_txc_dma2_gotnxtdesc),
        .DMA2_Mark                         (dmc_txc_dma2_descriptor[62]),
        .DMA2_SOP                          (dmc_txc_dma2_descriptor[63]),
        .DMA2_Func_Num                     (dmc_txc_dma2_func_num),
        .DMA2_DescList                     (dmc_txc_dma2_descriptor[61:58]),
        .DMA2_Length                       (dmc_txc_dma2_descriptor[56:44]),
        .DMA2_PageHandle                   (dmc_txc_dma2_page_handle),
        .DMA2_Address                      (dmc_txc_dma2_descriptor[43:0]),
        .DMA2_Inc_Head                     (port3_DMA2_inc_head),
        .DMA2_Reset_Done                   (port3_DMA2_reset_done),
        .DMA2_Mark_Bit                     (port3_DMA2_mark_bit),
        .DMA2_Inc_Pkt_Cnt                  (port3_DMA2_inc_pkt_cnt),
        .SetGetNextDescDMA2                (port3_SetGetNextDescDMA2),
        .DMA3_Active                       (dmc_txc_dma3_active),
        .DMA3_EofList                      (dmc_txc_dma3_eoflist),
        .DMA3_Error                        (dmc_txc_dma3_error),
        .DMA3_CacheReady                   (dmc_txc_dma3_cacheready),
        .DMA3_Partial                      (dmc_txc_dma3_partial),
        .DMA3_Reset_Scheduled              (dmc_txc_dma3_reset_scheduled),
        .DMA3_GotNxtDesc                   (dmc_txc_dma3_gotnxtdesc),
        .DMA3_Mark                         (dmc_txc_dma3_descriptor[62]),
        .DMA3_SOP                          (dmc_txc_dma3_descriptor[63]),
        .DMA3_Func_Num                     (dmc_txc_dma3_func_num),
        .DMA3_DescList                     (dmc_txc_dma3_descriptor[61:58]),
        .DMA3_Length                       (dmc_txc_dma3_descriptor[56:44]),
        .DMA3_PageHandle                   (dmc_txc_dma3_page_handle),
        .DMA3_Address                      (dmc_txc_dma3_descriptor[43:0]),
        .DMA3_Inc_Head                     (port3_DMA3_inc_head),
        .DMA3_Reset_Done                   (port3_DMA3_reset_done),
        .DMA3_Mark_Bit                     (port3_DMA3_mark_bit),
        .DMA3_Inc_Pkt_Cnt                  (port3_DMA3_inc_pkt_cnt),
        .SetGetNextDescDMA3                (port3_SetGetNextDescDMA3),
        .DMA4_Active                       (dmc_txc_dma4_active),
        .DMA4_EofList                      (dmc_txc_dma4_eoflist),
        .DMA4_Error                        (dmc_txc_dma4_error),
        .DMA4_CacheReady                   (dmc_txc_dma4_cacheready),
        .DMA4_Partial                      (dmc_txc_dma4_partial),
        .DMA4_Reset_Scheduled              (dmc_txc_dma4_reset_scheduled),
        .DMA4_GotNxtDesc                   (dmc_txc_dma4_gotnxtdesc),
        .DMA4_Mark                         (dmc_txc_dma4_descriptor[62]),
        .DMA4_SOP                          (dmc_txc_dma4_descriptor[63]),
        .DMA4_Func_Num                     (dmc_txc_dma4_func_num),
        .DMA4_DescList                     (dmc_txc_dma4_descriptor[61:58]),
        .DMA4_Length                       (dmc_txc_dma4_descriptor[56:44]),
        .DMA4_PageHandle                   (dmc_txc_dma4_page_handle),
        .DMA4_Address                      (dmc_txc_dma4_descriptor[43:0]),
        .DMA4_Inc_Head                     (port3_DMA4_inc_head),
        .DMA4_Reset_Done                   (port3_DMA4_reset_done),
        .DMA4_Mark_Bit                     (port3_DMA4_mark_bit),
        .DMA4_Inc_Pkt_Cnt                  (port3_DMA4_inc_pkt_cnt),
        .SetGetNextDescDMA4                (port3_SetGetNextDescDMA4),
        .DMA5_Active                       (dmc_txc_dma5_active),
        .DMA5_EofList                      (dmc_txc_dma5_eoflist),
        .DMA5_Error                        (dmc_txc_dma5_error),
        .DMA5_CacheReady                   (dmc_txc_dma5_cacheready),
        .DMA5_Partial                      (dmc_txc_dma5_partial),
        .DMA5_Reset_Scheduled              (dmc_txc_dma5_reset_scheduled),
        .DMA5_GotNxtDesc                   (dmc_txc_dma5_gotnxtdesc),
        .DMA5_Mark                         (dmc_txc_dma5_descriptor[62]),
        .DMA5_SOP                          (dmc_txc_dma5_descriptor[63]),
        .DMA5_Func_Num                     (dmc_txc_dma5_func_num),
        .DMA5_DescList                     (dmc_txc_dma5_descriptor[61:58]),
        .DMA5_Length                       (dmc_txc_dma5_descriptor[56:44]),
        .DMA5_PageHandle                   (dmc_txc_dma5_page_handle),
        .DMA5_Address                      (dmc_txc_dma5_descriptor[43:0]),
        .DMA5_Inc_Head                     (port3_DMA5_inc_head),
        .DMA5_Reset_Done                   (port3_DMA5_reset_done),
        .DMA5_Mark_Bit                     (port3_DMA5_mark_bit),
        .DMA5_Inc_Pkt_Cnt                  (port3_DMA5_inc_pkt_cnt),
        .SetGetNextDescDMA5                (port3_SetGetNextDescDMA5),
        .DMA6_Active                       (dmc_txc_dma6_active),
        .DMA6_EofList                      (dmc_txc_dma6_eoflist),
        .DMA6_Error                        (dmc_txc_dma6_error),
        .DMA6_CacheReady                   (dmc_txc_dma6_cacheready),
        .DMA6_Partial                      (dmc_txc_dma6_partial),
        .DMA6_Reset_Scheduled              (dmc_txc_dma6_reset_scheduled),
        .DMA6_GotNxtDesc                   (dmc_txc_dma6_gotnxtdesc),
        .DMA6_Mark                         (dmc_txc_dma6_descriptor[62]),
        .DMA6_SOP                          (dmc_txc_dma6_descriptor[63]),
        .DMA6_Func_Num                     (dmc_txc_dma6_func_num),
        .DMA6_DescList                     (dmc_txc_dma6_descriptor[61:58]),
        .DMA6_Length                       (dmc_txc_dma6_descriptor[56:44]),
        .DMA6_PageHandle                   (dmc_txc_dma6_page_handle),
        .DMA6_Address                      (dmc_txc_dma6_descriptor[43:0]),
        .DMA6_Inc_Head                     (port3_DMA6_inc_head),
        .DMA6_Reset_Done                   (port3_DMA6_reset_done),
        .DMA6_Mark_Bit                     (port3_DMA6_mark_bit),
        .DMA6_Inc_Pkt_Cnt                  (port3_DMA6_inc_pkt_cnt),
        .SetGetNextDescDMA6                (port3_SetGetNextDescDMA6),
        .DMA7_Active                       (dmc_txc_dma7_active),
        .DMA7_EofList                      (dmc_txc_dma7_eoflist),
        .DMA7_Error                        (dmc_txc_dma7_error),
        .DMA7_CacheReady                   (dmc_txc_dma7_cacheready),
        .DMA7_Partial                      (dmc_txc_dma7_partial),
        .DMA7_Reset_Scheduled              (dmc_txc_dma7_reset_scheduled),
        .DMA7_GotNxtDesc                   (dmc_txc_dma7_gotnxtdesc),
        .DMA7_Mark                         (dmc_txc_dma7_descriptor[62]),
        .DMA7_SOP                          (dmc_txc_dma7_descriptor[63]),
        .DMA7_Func_Num                     (dmc_txc_dma7_func_num),
        .DMA7_DescList                     (dmc_txc_dma7_descriptor[61:58]),
        .DMA7_Length                       (dmc_txc_dma7_descriptor[56:44]),
        .DMA7_PageHandle                   (dmc_txc_dma7_page_handle),
        .DMA7_Address                      (dmc_txc_dma7_descriptor[43:0]),
        .DMA7_Inc_Head                     (port3_DMA7_inc_head),
        .DMA7_Reset_Done                   (port3_DMA7_reset_done),
        .DMA7_Mark_Bit                     (port3_DMA7_mark_bit),
        .DMA7_Inc_Pkt_Cnt                  (port3_DMA7_inc_pkt_cnt),
        .SetGetNextDescDMA7                (port3_SetGetNextDescDMA7),
        .DMA8_Active                       (dmc_txc_dma8_active),
        .DMA8_EofList                      (dmc_txc_dma8_eoflist),
        .DMA8_Error                        (dmc_txc_dma8_error),
        .DMA8_CacheReady                   (dmc_txc_dma8_cacheready),
        .DMA8_Partial                      (dmc_txc_dma8_partial),
        .DMA8_Reset_Scheduled              (dmc_txc_dma8_reset_scheduled),
        .DMA8_GotNxtDesc                   (dmc_txc_dma8_gotnxtdesc),
        .DMA8_Mark                         (dmc_txc_dma8_descriptor[62]),
        .DMA8_SOP                          (dmc_txc_dma8_descriptor[63]),
        .DMA8_Func_Num                     (dmc_txc_dma8_func_num),
        .DMA8_DescList                     (dmc_txc_dma8_descriptor[61:58]),
        .DMA8_Length                       (dmc_txc_dma8_descriptor[56:44]),
        .DMA8_PageHandle                   (dmc_txc_dma8_page_handle),
        .DMA8_Address                      (dmc_txc_dma8_descriptor[43:0]),
        .DMA8_Inc_Head                     (port3_DMA8_inc_head),
        .DMA8_Reset_Done                   (port3_DMA8_reset_done),
        .DMA8_Mark_Bit                     (port3_DMA8_mark_bit),
        .DMA8_Inc_Pkt_Cnt                  (port3_DMA8_inc_pkt_cnt),
        .SetGetNextDescDMA8                (port3_SetGetNextDescDMA8),
        .DMA9_Active                       (dmc_txc_dma9_active),
        .DMA9_EofList                      (dmc_txc_dma9_eoflist),
        .DMA9_Error                        (dmc_txc_dma9_error),
        .DMA9_CacheReady                   (dmc_txc_dma9_cacheready),
        .DMA9_Partial                      (dmc_txc_dma9_partial),
        .DMA9_Reset_Scheduled              (dmc_txc_dma9_reset_scheduled),
        .DMA9_GotNxtDesc                   (dmc_txc_dma9_gotnxtdesc),
        .DMA9_Mark                         (dmc_txc_dma9_descriptor[62]),
        .DMA9_SOP                          (dmc_txc_dma9_descriptor[63]),
        .DMA9_Func_Num                     (dmc_txc_dma9_func_num),
        .DMA9_DescList                     (dmc_txc_dma9_descriptor[61:58]),
        .DMA9_Length                       (dmc_txc_dma9_descriptor[56:44]),
        .DMA9_PageHandle                   (dmc_txc_dma9_page_handle),
        .DMA9_Address                      (dmc_txc_dma9_descriptor[43:0]),
        .DMA9_Inc_Head                     (port3_DMA9_inc_head),
        .DMA9_Reset_Done                   (port3_DMA9_reset_done),
        .DMA9_Mark_Bit                     (port3_DMA9_mark_bit),
        .DMA9_Inc_Pkt_Cnt                  (port3_DMA9_inc_pkt_cnt),
        .SetGetNextDescDMA9                (port3_SetGetNextDescDMA9),
        .DMA10_Active                      (dmc_txc_dma10_active),
        .DMA10_EofList                     (dmc_txc_dma10_eoflist),
        .DMA10_Error                       (dmc_txc_dma10_error),
        .DMA10_CacheReady                  (dmc_txc_dma10_cacheready),
        .DMA10_Partial                     (dmc_txc_dma10_partial),
        .DMA10_Reset_Scheduled             (dmc_txc_dma10_reset_scheduled),
        .DMA10_GotNxtDesc                  (dmc_txc_dma10_gotnxtdesc),
        .DMA10_Mark                        (dmc_txc_dma10_descriptor[62]),
        .DMA10_SOP                         (dmc_txc_dma10_descriptor[63]),
        .DMA10_Func_Num                    (dmc_txc_dma10_func_num),
        .DMA10_DescList                    (dmc_txc_dma10_descriptor[61:58]),
        .DMA10_Length                      (dmc_txc_dma10_descriptor[56:44]),
        .DMA10_PageHandle                  (dmc_txc_dma10_page_handle),
        .DMA10_Address                     (dmc_txc_dma10_descriptor[43:0]),
        .DMA10_Inc_Head                    (port3_DMA10_inc_head),
        .DMA10_Reset_Done                  (port3_DMA10_reset_done),
        .DMA10_Mark_Bit                    (port3_DMA10_mark_bit),
        .DMA10_Inc_Pkt_Cnt                 (port3_DMA10_inc_pkt_cnt),
        .SetGetNextDescDMA10               (port3_SetGetNextDescDMA10),
        .DMA11_Active                      (dmc_txc_dma11_active),
        .DMA11_EofList                     (dmc_txc_dma11_eoflist),
        .DMA11_Error                       (dmc_txc_dma11_error),
        .DMA11_CacheReady                  (dmc_txc_dma11_cacheready),
        .DMA11_Partial                     (dmc_txc_dma11_partial),
        .DMA11_Reset_Scheduled             (dmc_txc_dma11_reset_scheduled),
        .DMA11_GotNxtDesc                  (dmc_txc_dma11_gotnxtdesc),
        .DMA11_Mark                        (dmc_txc_dma11_descriptor[62]),
        .DMA11_SOP                         (dmc_txc_dma11_descriptor[63]),
        .DMA11_Func_Num                    (dmc_txc_dma11_func_num),
        .DMA11_DescList                    (dmc_txc_dma11_descriptor[61:58]),
        .DMA11_Length                      (dmc_txc_dma11_descriptor[56:44]),
        .DMA11_PageHandle                  (dmc_txc_dma11_page_handle),
        .DMA11_Address                     (dmc_txc_dma11_descriptor[43:0]),
        .DMA11_Inc_Head                    (port3_DMA11_inc_head),
        .DMA11_Reset_Done                  (port3_DMA11_reset_done),
        .DMA11_Mark_Bit                    (port3_DMA11_mark_bit),
        .DMA11_Inc_Pkt_Cnt                 (port3_DMA11_inc_pkt_cnt),
        .SetGetNextDescDMA11               (port3_SetGetNextDescDMA11),
        .DMA12_Active                      (dmc_txc_dma12_active),
        .DMA12_EofList                     (dmc_txc_dma12_eoflist),
        .DMA12_Error                       (dmc_txc_dma12_error),
        .DMA12_CacheReady                  (dmc_txc_dma12_cacheready),
        .DMA12_Partial                     (dmc_txc_dma12_partial),
        .DMA12_Reset_Scheduled             (dmc_txc_dma12_reset_scheduled),
        .DMA12_GotNxtDesc                  (dmc_txc_dma12_gotnxtdesc),
        .DMA12_Mark                        (dmc_txc_dma12_descriptor[62]),
        .DMA12_SOP                         (dmc_txc_dma12_descriptor[63]),
        .DMA12_Func_Num                    (dmc_txc_dma12_func_num),
        .DMA12_DescList                    (dmc_txc_dma12_descriptor[61:58]),
        .DMA12_Length                      (dmc_txc_dma12_descriptor[56:44]),
        .DMA12_PageHandle                  (dmc_txc_dma12_page_handle),
        .DMA12_Address                     (dmc_txc_dma12_descriptor[43:0]),
        .DMA12_Inc_Head                    (port3_DMA12_inc_head),
        .DMA12_Reset_Done                  (port3_DMA12_reset_done),
        .DMA12_Mark_Bit                    (port3_DMA12_mark_bit),
        .DMA12_Inc_Pkt_Cnt                 (port3_DMA12_inc_pkt_cnt),
        .SetGetNextDescDMA12               (port3_SetGetNextDescDMA12),
        .DMA13_Active                      (dmc_txc_dma13_active),
        .DMA13_EofList                     (dmc_txc_dma13_eoflist),
        .DMA13_Error                       (dmc_txc_dma13_error),
        .DMA13_CacheReady                  (dmc_txc_dma13_cacheready),
        .DMA13_Partial                     (dmc_txc_dma13_partial),
        .DMA13_Reset_Scheduled             (dmc_txc_dma13_reset_scheduled),
        .DMA13_GotNxtDesc                  (dmc_txc_dma13_gotnxtdesc),
        .DMA13_Mark                        (dmc_txc_dma13_descriptor[62]),
        .DMA13_SOP                         (dmc_txc_dma13_descriptor[63]),
        .DMA13_Func_Num                    (dmc_txc_dma13_func_num),
        .DMA13_DescList                    (dmc_txc_dma13_descriptor[61:58]),
        .DMA13_Length                      (dmc_txc_dma13_descriptor[56:44]),
        .DMA13_PageHandle                  (dmc_txc_dma13_page_handle),
        .DMA13_Address                     (dmc_txc_dma13_descriptor[43:0]),
        .DMA13_Inc_Head                    (port3_DMA13_inc_head),
        .DMA13_Reset_Done                  (port3_DMA13_reset_done),
        .DMA13_Mark_Bit                    (port3_DMA13_mark_bit),
        .DMA13_Inc_Pkt_Cnt                 (port3_DMA13_inc_pkt_cnt),
        .SetGetNextDescDMA13               (port3_SetGetNextDescDMA13),
        .DMA14_Active                      (dmc_txc_dma14_active),
        .DMA14_EofList                     (dmc_txc_dma14_eoflist),
        .DMA14_Error                       (dmc_txc_dma14_error),
        .DMA14_CacheReady                  (dmc_txc_dma14_cacheready),
        .DMA14_Partial                     (dmc_txc_dma14_partial),
        .DMA14_Reset_Scheduled             (dmc_txc_dma14_reset_scheduled),
        .DMA14_GotNxtDesc                  (dmc_txc_dma14_gotnxtdesc),
        .DMA14_Mark                        (dmc_txc_dma14_descriptor[62]),
        .DMA14_SOP                         (dmc_txc_dma14_descriptor[63]),
        .DMA14_Func_Num                    (dmc_txc_dma14_func_num),
        .DMA14_DescList                    (dmc_txc_dma14_descriptor[61:58]),
        .DMA14_Length                      (dmc_txc_dma14_descriptor[56:44]),
        .DMA14_PageHandle                  (dmc_txc_dma14_page_handle),
        .DMA14_Address                     (dmc_txc_dma14_descriptor[43:0]),
        .DMA14_Inc_Head                    (port3_DMA14_inc_head),
        .DMA14_Reset_Done                  (port3_DMA14_reset_done),
        .DMA14_Mark_Bit                    (port3_DMA14_mark_bit),
        .DMA14_Inc_Pkt_Cnt                 (port3_DMA14_inc_pkt_cnt),
        .SetGetNextDescDMA14               (port3_SetGetNextDescDMA14),
        .DMA15_Active                      (dmc_txc_dma15_active),
        .DMA15_EofList                     (dmc_txc_dma15_eoflist),
        .DMA15_Error                       (dmc_txc_dma15_error),
        .DMA15_CacheReady                  (dmc_txc_dma15_cacheready),
        .DMA15_Partial                     (dmc_txc_dma15_partial),
        .DMA15_Reset_Scheduled             (dmc_txc_dma15_reset_scheduled),
        .DMA15_GotNxtDesc                  (dmc_txc_dma15_gotnxtdesc),
        .DMA15_Mark                        (dmc_txc_dma15_descriptor[62]),
        .DMA15_SOP                         (dmc_txc_dma15_descriptor[63]),
        .DMA15_Func_Num                    (dmc_txc_dma15_func_num),
        .DMA15_DescList                    (dmc_txc_dma15_descriptor[61:58]),
        .DMA15_Length                      (dmc_txc_dma15_descriptor[56:44]),
        .DMA15_PageHandle                  (dmc_txc_dma15_page_handle),
        .DMA15_Address                     (dmc_txc_dma15_descriptor[43:0]),
        .DMA15_Inc_Head                    (port3_DMA15_inc_head),
        .DMA15_Reset_Done                  (port3_DMA15_reset_done),
        .DMA15_Mark_Bit                    (port3_DMA15_mark_bit),
        .DMA15_Inc_Pkt_Cnt                 (port3_DMA15_inc_pkt_cnt),
        .SetGetNextDescDMA15               (port3_SetGetNextDescDMA15),
        .DMA16_Active                      (dmc_txc_dma16_active),
        .DMA16_EofList                     (dmc_txc_dma16_eoflist),
        .DMA16_Error                       (dmc_txc_dma16_error),
        .DMA16_CacheReady                  (dmc_txc_dma16_cacheready),
        .DMA16_Partial                     (dmc_txc_dma16_partial),
        .DMA16_Reset_Scheduled             (dmc_txc_dma16_reset_scheduled),
        .DMA16_GotNxtDesc                  (dmc_txc_dma16_gotnxtdesc),
        .DMA16_Mark                        (dmc_txc_dma16_descriptor[62]),
        .DMA16_SOP                         (dmc_txc_dma16_descriptor[63]),
        .DMA16_Func_Num                    (dmc_txc_dma16_func_num),
        .DMA16_DescList                    (dmc_txc_dma16_descriptor[61:58]),
        .DMA16_Length                      (dmc_txc_dma16_descriptor[56:44]),
        .DMA16_PageHandle                  (dmc_txc_dma16_page_handle),
        .DMA16_Address                     (dmc_txc_dma16_descriptor[43:0]),
        .DMA16_Inc_Head                    (port3_DMA16_inc_head),
        .DMA16_Reset_Done                  (port3_DMA16_reset_done),
        .DMA16_Mark_Bit                    (port3_DMA16_mark_bit),
        .DMA16_Inc_Pkt_Cnt                 (port3_DMA16_inc_pkt_cnt),
        .SetGetNextDescDMA16               (port3_SetGetNextDescDMA16),
        .DMA17_Active                      (dmc_txc_dma17_active),
        .DMA17_EofList                     (dmc_txc_dma17_eoflist),
        .DMA17_Error                       (dmc_txc_dma17_error),
        .DMA17_CacheReady                  (dmc_txc_dma17_cacheready),
        .DMA17_Partial                     (dmc_txc_dma17_partial),
        .DMA17_Reset_Scheduled             (dmc_txc_dma17_reset_scheduled),
        .DMA17_GotNxtDesc                  (dmc_txc_dma17_gotnxtdesc),
        .DMA17_Mark                        (dmc_txc_dma17_descriptor[62]),
        .DMA17_SOP                         (dmc_txc_dma17_descriptor[63]),
        .DMA17_Func_Num                    (dmc_txc_dma17_func_num),
        .DMA17_DescList                    (dmc_txc_dma17_descriptor[61:58]),
        .DMA17_Length                      (dmc_txc_dma17_descriptor[56:44]),
        .DMA17_PageHandle                  (dmc_txc_dma17_page_handle),
        .DMA17_Address                     (dmc_txc_dma17_descriptor[43:0]),
        .DMA17_Inc_Head                    (port3_DMA17_inc_head),
        .DMA17_Reset_Done                  (port3_DMA17_reset_done),
        .DMA17_Mark_Bit                    (port3_DMA17_mark_bit),
        .DMA17_Inc_Pkt_Cnt                 (port3_DMA17_inc_pkt_cnt),
        .SetGetNextDescDMA17               (port3_SetGetNextDescDMA17),
        .DMA18_Active                      (dmc_txc_dma18_active),
        .DMA18_EofList                     (dmc_txc_dma18_eoflist),
        .DMA18_Error                       (dmc_txc_dma18_error),
        .DMA18_CacheReady                  (dmc_txc_dma18_cacheready),
        .DMA18_Partial                     (dmc_txc_dma18_partial),
        .DMA18_Reset_Scheduled             (dmc_txc_dma18_reset_scheduled),
        .DMA18_GotNxtDesc                  (dmc_txc_dma18_gotnxtdesc),
        .DMA18_Mark                        (dmc_txc_dma18_descriptor[62]),
        .DMA18_SOP                         (dmc_txc_dma18_descriptor[63]),
        .DMA18_Func_Num                    (dmc_txc_dma18_func_num),
        .DMA18_DescList                    (dmc_txc_dma18_descriptor[61:58]),
        .DMA18_Length                      (dmc_txc_dma18_descriptor[56:44]),
        .DMA18_PageHandle                  (dmc_txc_dma18_page_handle),
        .DMA18_Address                     (dmc_txc_dma18_descriptor[43:0]),
        .DMA18_Inc_Head                    (port3_DMA18_inc_head),
        .DMA18_Reset_Done                  (port3_DMA18_reset_done),
        .DMA18_Mark_Bit                    (port3_DMA18_mark_bit),
        .DMA18_Inc_Pkt_Cnt                 (port3_DMA18_inc_pkt_cnt),
        .SetGetNextDescDMA18               (port3_SetGetNextDescDMA18),
        .DMA19_Active                      (dmc_txc_dma19_active),
        .DMA19_EofList                     (dmc_txc_dma19_eoflist),
        .DMA19_Error                       (dmc_txc_dma19_error),
        .DMA19_CacheReady                  (dmc_txc_dma19_cacheready),
        .DMA19_Partial                     (dmc_txc_dma19_partial),
        .DMA19_Reset_Scheduled             (dmc_txc_dma19_reset_scheduled),
        .DMA19_GotNxtDesc                  (dmc_txc_dma19_gotnxtdesc),
        .DMA19_Mark                        (dmc_txc_dma19_descriptor[62]),
        .DMA19_SOP                         (dmc_txc_dma19_descriptor[63]),
        .DMA19_Func_Num                    (dmc_txc_dma19_func_num),
        .DMA19_DescList                    (dmc_txc_dma19_descriptor[61:58]),
        .DMA19_Length                      (dmc_txc_dma19_descriptor[56:44]),
        .DMA19_PageHandle                  (dmc_txc_dma19_page_handle),
        .DMA19_Address                     (dmc_txc_dma19_descriptor[43:0]),
        .DMA19_Inc_Head                    (port3_DMA19_inc_head),
        .DMA19_Reset_Done                  (port3_DMA19_reset_done),
        .DMA19_Mark_Bit                    (port3_DMA19_mark_bit),
        .DMA19_Inc_Pkt_Cnt                 (port3_DMA19_inc_pkt_cnt),
        .SetGetNextDescDMA19               (port3_SetGetNextDescDMA19),
        .DMA20_Active                      (dmc_txc_dma20_active),
        .DMA20_EofList                     (dmc_txc_dma20_eoflist),
        .DMA20_Error                       (dmc_txc_dma20_error),
        .DMA20_CacheReady                  (dmc_txc_dma20_cacheready),
        .DMA20_Partial                     (dmc_txc_dma20_partial),
        .DMA20_Reset_Scheduled             (dmc_txc_dma20_reset_scheduled),
        .DMA20_GotNxtDesc                  (dmc_txc_dma20_gotnxtdesc),
        .DMA20_Mark                        (dmc_txc_dma20_descriptor[62]),
        .DMA20_SOP                         (dmc_txc_dma20_descriptor[63]),
        .DMA20_Func_Num                    (dmc_txc_dma20_func_num),
        .DMA20_DescList                    (dmc_txc_dma20_descriptor[61:58]),
        .DMA20_Length                      (dmc_txc_dma20_descriptor[56:44]),
        .DMA20_PageHandle                  (dmc_txc_dma20_page_handle),
        .DMA20_Address                     (dmc_txc_dma20_descriptor[43:0]),
        .DMA20_Inc_Head                    (port3_DMA20_inc_head),
        .DMA20_Reset_Done                  (port3_DMA20_reset_done),
        .DMA20_Mark_Bit                    (port3_DMA20_mark_bit),
        .DMA20_Inc_Pkt_Cnt                 (port3_DMA20_inc_pkt_cnt),
        .SetGetNextDescDMA20               (port3_SetGetNextDescDMA20),
        .DMA21_Active                      (dmc_txc_dma21_active),
        .DMA21_EofList                     (dmc_txc_dma21_eoflist),
        .DMA21_Error                       (dmc_txc_dma21_error),
        .DMA21_CacheReady                  (dmc_txc_dma21_cacheready),
        .DMA21_Partial                     (dmc_txc_dma21_partial),
        .DMA21_Reset_Scheduled             (dmc_txc_dma21_reset_scheduled),
        .DMA21_GotNxtDesc                  (dmc_txc_dma21_gotnxtdesc),
        .DMA21_Mark                        (dmc_txc_dma21_descriptor[62]),
        .DMA21_SOP                         (dmc_txc_dma21_descriptor[63]),
        .DMA21_Func_Num                    (dmc_txc_dma21_func_num),
        .DMA21_DescList                    (dmc_txc_dma21_descriptor[61:58]),
        .DMA21_Length                      (dmc_txc_dma21_descriptor[56:44]),
        .DMA21_PageHandle                  (dmc_txc_dma21_page_handle),
        .DMA21_Address                     (dmc_txc_dma21_descriptor[43:0]),
        .DMA21_Inc_Head                    (port3_DMA21_inc_head),
        .DMA21_Reset_Done                  (port3_DMA21_reset_done),
        .DMA21_Mark_Bit                    (port3_DMA21_mark_bit),
        .DMA21_Inc_Pkt_Cnt                 (port3_DMA21_inc_pkt_cnt),
        .SetGetNextDescDMA21               (port3_SetGetNextDescDMA21),
        .DMA22_Active                      (dmc_txc_dma22_active),
        .DMA22_EofList                     (dmc_txc_dma22_eoflist),
        .DMA22_Error                       (dmc_txc_dma22_error),
        .DMA22_CacheReady                  (dmc_txc_dma22_cacheready),
        .DMA22_Partial                     (dmc_txc_dma22_partial),
        .DMA22_Reset_Scheduled             (dmc_txc_dma22_reset_scheduled),
        .DMA22_GotNxtDesc                  (dmc_txc_dma22_gotnxtdesc),
        .DMA22_Mark                        (dmc_txc_dma22_descriptor[62]),
        .DMA22_SOP                         (dmc_txc_dma22_descriptor[63]),
        .DMA22_Func_Num                    (dmc_txc_dma22_func_num),
        .DMA22_DescList                    (dmc_txc_dma22_descriptor[61:58]),
        .DMA22_Length                      (dmc_txc_dma22_descriptor[56:44]),
        .DMA22_PageHandle                  (dmc_txc_dma22_page_handle),
        .DMA22_Address                     (dmc_txc_dma22_descriptor[43:0]),
        .DMA22_Inc_Head                    (port3_DMA22_inc_head),
        .DMA22_Reset_Done                  (port3_DMA22_reset_done),
        .DMA22_Mark_Bit                    (port3_DMA22_mark_bit),
        .DMA22_Inc_Pkt_Cnt                 (port3_DMA22_inc_pkt_cnt),
        .SetGetNextDescDMA22               (port3_SetGetNextDescDMA22),
        .DMA23_Active                      (dmc_txc_dma23_active),
        .DMA23_EofList                     (dmc_txc_dma23_eoflist),
        .DMA23_Error                       (dmc_txc_dma23_error),
        .DMA23_CacheReady                  (dmc_txc_dma23_cacheready),
        .DMA23_Partial                     (dmc_txc_dma23_partial),
        .DMA23_Reset_Scheduled             (dmc_txc_dma23_reset_scheduled),
        .DMA23_GotNxtDesc                  (dmc_txc_dma23_gotnxtdesc),
        .DMA23_Mark                        (dmc_txc_dma23_descriptor[62]),
        .DMA23_SOP                         (dmc_txc_dma23_descriptor[63]),
        .DMA23_Func_Num                    (dmc_txc_dma23_func_num),
        .DMA23_DescList                    (dmc_txc_dma23_descriptor[61:58]),
        .DMA23_Length                      (dmc_txc_dma23_descriptor[56:44]),
        .DMA23_PageHandle                  (dmc_txc_dma23_page_handle),
        .DMA23_Address                     (dmc_txc_dma23_descriptor[43:0]),
        .DMA23_Inc_Head                    (port3_DMA23_inc_head),
        .DMA23_Reset_Done                  (port3_DMA23_reset_done),
        .DMA23_Mark_Bit                    (port3_DMA23_mark_bit),
        .DMA23_Inc_Pkt_Cnt                 (port3_DMA23_inc_pkt_cnt),
        .SetGetNextDescDMA23               (port3_SetGetNextDescDMA23),

        .DMA0_NewMaxBurst                  (dma0_NewMaxBurst),
        .DMA1_NewMaxBurst                  (dma1_NewMaxBurst),
        .DMA2_NewMaxBurst                  (dma2_NewMaxBurst),
        .DMA3_NewMaxBurst                  (dma3_NewMaxBurst),
        .DMA4_NewMaxBurst                  (dma4_NewMaxBurst),
        .DMA5_NewMaxBurst                  (dma5_NewMaxBurst),
        .DMA6_NewMaxBurst                  (dma6_NewMaxBurst),
        .DMA7_NewMaxBurst                  (dma7_NewMaxBurst),
        .DMA8_NewMaxBurst                  (dma8_NewMaxBurst),
        .DMA9_NewMaxBurst                  (dma9_NewMaxBurst),
        .DMA10_NewMaxBurst                 (dma10_NewMaxBurst),
        .DMA11_NewMaxBurst                 (dma11_NewMaxBurst),
        .DMA12_NewMaxBurst                 (dma12_NewMaxBurst),
        .DMA13_NewMaxBurst                 (dma13_NewMaxBurst),
        .DMA14_NewMaxBurst                 (dma14_NewMaxBurst),
        .DMA15_NewMaxBurst                 (dma15_NewMaxBurst),
        .DMA16_NewMaxBurst                 (dma16_NewMaxBurst),
        .DMA17_NewMaxBurst                 (dma17_NewMaxBurst),
        .DMA18_NewMaxBurst                 (dma18_NewMaxBurst),
        .DMA19_NewMaxBurst                 (dma19_NewMaxBurst),
        .DMA20_NewMaxBurst                 (dma20_NewMaxBurst),
        .DMA21_NewMaxBurst                 (dma21_NewMaxBurst),
        .DMA22_NewMaxBurst                 (dma22_NewMaxBurst),
        .DMA23_NewMaxBurst                 (dma23_NewMaxBurst),
        .DMA0_MaxBurst                     (dma0_MaxBurst),
        .DMA1_MaxBurst                     (dma1_MaxBurst),
        .DMA2_MaxBurst                     (dma2_MaxBurst),
        .DMA3_MaxBurst                     (dma3_MaxBurst),
        .DMA4_MaxBurst                     (dma4_MaxBurst),
        .DMA5_MaxBurst                     (dma5_MaxBurst),
        .DMA6_MaxBurst                     (dma6_MaxBurst),
        .DMA7_MaxBurst                     (dma7_MaxBurst),
        .DMA8_MaxBurst                     (dma8_MaxBurst),
        .DMA9_MaxBurst                     (dma9_MaxBurst),
        .DMA10_MaxBurst                    (dma10_MaxBurst),
        .DMA11_MaxBurst                    (dma11_MaxBurst),
        .DMA12_MaxBurst                    (dma12_MaxBurst),
        .DMA13_MaxBurst                    (dma13_MaxBurst),
        .DMA14_MaxBurst                    (dma14_MaxBurst),
        .DMA15_MaxBurst                    (dma15_MaxBurst),
        .DMA16_MaxBurst                    (dma16_MaxBurst),
        .DMA17_MaxBurst                    (dma17_MaxBurst),
        .DMA18_MaxBurst                    (dma18_MaxBurst),
        .DMA19_MaxBurst                    (dma19_MaxBurst),
        .DMA20_MaxBurst                    (dma20_MaxBurst),
        .DMA21_MaxBurst                    (dma21_MaxBurst),
        .DMA22_MaxBurst                    (dma22_MaxBurst),
        .DMA23_MaxBurst                    (dma23_MaxBurst),
        .MaxReorderNumber                  (port3_MaxReorderNumber),
        .Port_DMA_List                     (port3_DMA_List),
        .ClrMaxBurst                       (port3_clrMaxBurst),
        .UpdateDMA                         (port3_UpdateDMA),
        .UpdateDMALength                   (port3_UpdateDMALength),
        .UpdateDMANumber                   (port3_UpdateDMANumber),

        .DMC_TXC_Req_Ack                   (arb1_txc_req_accept),
        .DMC_TXC_Req_TransID               (arb1_txc_req_transid),

        .Port_Selected                     (port_Selected[3]),
        .Port_Request                      (port3_Request),
        .Port_Request_Func_Num             (port3_Request_Func_Num),
        .Port_Request_DMA_Num              (port3_Request_DMA_Num),
        .Port_Request_Length               (port3_Request_Length),
        .Port_Request_Address              (port3_Request_Address),

        .DMC_TXC_Resp_Rdy                  (dMC_TXC_Resp_Rdy),
        .DMC_TXC_Resp_Complete             (dMC_TXC_Resp_Complete),
        .DMC_TXC_Trans_Complete            (dMC_TXC_Trans_Complete),
        .DMC_TXC_Resp_Data_Valid           (dMC_TXC_Resp_Data_Valid),
        .DMC_TXC_Resp_Client               (dMC_TXC_Resp_Client),
        .DMC_TXC_Resp_Port_Num             (dMC_TXC_Resp_Port_Num),
        .DMC_TXC_Resp_Cmd_Status           (dMC_TXC_Resp_Cmd_Status),
        .DMC_TXC_Resp_Data_Status          (dMC_TXC_Resp_Data_Status),
        .DMC_TXC_Resp_DMA_Num              (dMC_TXC_Resp_DMA_Num),
        .DMC_TXC_Resp_TransID              (dMC_TXC_Resp_TransID),
        .DMC_TXC_Resp_Cmd                  (dMC_TXC_Resp_Cmd),
        .DMC_TXC_Resp_Data_Length          (dMC_TXC_Resp_Data_Length),
        .DMC_TXC_Resp_ByteEnables          (dMC_TXC_Resp_ByteEnables),
        .DMC_TXC_Resp_Address              (dMC_TXC_Resp_Address),
        .DMC_TXC_Resp_Data                 (dMC_TXC_Resp_Data),
        .TXC_DMC_Resp_Accept               (port3_TXC_DMC_Resp_Accept),

        .ReOrderFifoDataValid              (port3_ReOrderFifoDataValid),
        .ReOrderUnCorrectError             (port3_ReOrder_UnCorrectError),
        .ReOrderEccControl                 (port3_ReOrderEccControl),
        .PacketAssyEngineDataIn            (port3_PacketAssyEngineDataIn),
        .ReOrderCorruptECCSingle           (port3_ReOrderCorruptECCSingle),
        .ReOrderCorruptECCDouble           (port3_ReOrderCorruptECCDouble),
        .ReOrderFifoWrite                  (port3_ReOrderFifoWrite),
        .ReOrderFifoReadStrobe             (port3_ReOrderFifoRead),
        .ReOrderWritePtr                   (port3_ReOrderWritePtr),
        .ReOrderReadPtr                    (port3_ReOrderReadPtr),
        .ReOrderEngineDataOut              (port3_ReOrderEngineDataOut),

        .StoreForwardUnCorrectError        (port3_StoreForward_UnCorrectError),
        .StoreForwardEccControl            (port3_StoreForwardEccControl),
        .MacXferEngineDataIn               (port3_MacXferEngineDataIn),
        .StoreForward_CorruptECCSingle     (port3_StoreForwardCorruptECCSingle),
        .StoreForward_CorruptECCDouble     (port3_StoreForwardCorruptECCDouble),
        .StoreForwardFifoWrite             (port3_StoreForwardFifoWrite),
        .StoreForwardFifoReadStrobe        (port3_StoreForwardFifoRead),
        .StoreForwardWritePtr              (port3_StoreForwardWritePtr),
        .StoreForwardReadPtr               (port3_StoreForwardReadPtr),
        .PacketAssyEngineDataOut           (port3_PacketAssyEngineDataOut),

        .LatchActiveDMA                    (port3_LatchActiveDMA),
        .ContextActiveList                 (port3_ContextActiveList),

        .Anchor_State                      (port3_Anchor_State),
        .ReOrder_State                     (port3_ReOrder_State),
        .Pointer_State                     (port3_Pointer_State),
        .PacketAssy_State                  (port3_PacketAssy_State),
        .DRR_ArbState                      (port3_DRR_ArbState),
        .Mac_Xfer_State                    (port3_Mac_Xfer_State),
        .DataPortReq_State                 (port3_DataPortReq_State),
        .Sum_prt_state                     (port3_Sum_prt_state)
       );


niu_txc_ecc_engine port3_niu_txc_ecc_engine (
        .SysClk                            (niu_clk),
        .Reset_L                           (reset_l),
        .ReOrder_ClearEccError             (port3_ReOrder_ClearEccError),
        .WrReOrderEccState                 (port3_WrReOrderEccState),
        .WrReOrderEccData0                 (port3_WrReOrderEccData0),
        .WrReOrderEccData1                 (port3_WrReOrderEccData1),
        .WrReOrderEccData2                 (port3_WrReOrderEccData2),
        .WrReOrderEccData3                 (port3_WrReOrderEccData3),
        .WrReOrderEccData4                 (port3_WrReOrderEccData4),
        .StoreForward_ClearEccError        (port3_StoreForward_ClearEccError),
        .WrStoreForwardEccState            (port3_WrStoreForwardEccState),
        .WrStoreForwardEccData0            (port3_WrStoreForwardEccData0),
        .WrStoreForwardEccData1            (port3_WrStoreForwardEccData1),
        .WrStoreForwardEccData2            (port3_WrStoreForwardEccData2),
        .WrStoreForwardEccData3            (port3_WrStoreForwardEccData3),
        .WrStoreForwardEccData4            (port3_WrStoreForwardEccData4),
        .PioDataIn                         (port3_PioDataIn),
        .ReOrder_ECC_State                 (port3_ReOrder_ECC_State),
        .ReOrder_EccData                   (port3_ReOrder_EccData),
        .StoreForward_ECC_State            (port3_StoreForward_ECC_State),
        .StoreForward_EccData              (port3_StoreForward_EccData),
        .ReOrder_CorruptECCSingle          (port3_ReOrderCorruptECCSingle),
        .ReOrder_CorruptECCDouble          (port3_ReOrderCorruptECCDouble),
        .ReOrder_FifoRead                  (port3_ReOrderFifoRead),
        .ReOrder_ReadPtr                   (port3_ReOrderReadPtr),
        .ReOrder_FifoDataOut               (port3_ReOrderFifoDataOut),
        .ReOrder_FifoDataValid             (port3_ReOrderFifoDataValid),
        .ReOrder_UnCorrectError            (port3_ReOrder_UnCorrectError),
        .ReOrder_PreECCData                (port3_ReOrderEngineDataOut),
        .ReOrder_PostECCData               (port3_ReOrderFifoDataIn),
        .ReOrder_CorrectedData             (port3_PacketAssyEngineDataIn),
        .StoreForward_CorruptECCSingle     (port3_StoreForwardCorruptECCSingle),
        .StoreForward_CorruptECCDouble     (port3_StoreForwardCorruptECCDouble),
        .StoreForward_FifoRead             (port3_StoreForwardFifoRead),
        .StoreForward_ReadPtr              (port3_StoreForwardReadPtr),
        .StoreForward_FifoDataOut          (port3_StoreForwardFifoDataOut),
        .StoreForward_UnCorrectError       (port3_StoreForward_UnCorrectError),
        .StoreForward_PreECCData           (port3_PacketAssyEngineDataOut),
        .StoreForward_PostECCData          (port3_StoreForwardFifoDataIn),
        .StoreForward_CorrectedData        (port3_MacXferEngineDataIn)
       );


niu_ram_1024_152 port3_RO_RAM (
        .clk                               (niu_clk),
        .wt_enable                         (port3_ReOrderFifoWrite),
        .cs_rd                             (port3_ReOrderFifoRead),
        .addr_rd                           (port3_ReOrderReadPtr),
        .addr_wt                           (port3_ReOrderWritePtr),
        .data_inp                          (port3_ReOrderFifoDataIn),
        .data_out                          (port3_ReOrderFifoDataOut)
       );


niu_ram_640_152 port3_SF_RAM (
        .clk                               (niu_clk),
        .wt_enable                         (port3_StoreForwardFifoWrite),
        .cs_rd                             (port3_StoreForwardFifoRead),
        .addr_rd                           (port3_StoreForwardReadPtr),
        .addr_wt                           (port3_StoreForwardWritePtr),
        .data_inp                          (port3_StoreForwardFifoDataIn),
        .data_out                          (port3_StoreForwardFifoDataOut)
       );


`endif


niu_txc_ControlRegs niu_txc_ControlRegs (
        .SysClk                            (niu_clk),
        .Reset_L                           (reset_l),
        .niu_txc_interrupts                (niu_txc_interrupts),
        .Slave_32BitMode                   (pio_clients_32b),
        .Slave_Read                        (pio_clients_rd),
        .Slave_Sel                         (pio_txc_sel),
        .Slave_Addr                        (pio_clients_addr),
        .Slave_DataIn                      (pio_clients_wdata[31:0]),
        .Slave_Ack                         (txc_pio_ack),
        .Slave_Err                         (txc_pio_err),
        .Slave_DataOut                     (txc_pio_rdata),

        .Txc_Enabled                       (txc_Enabled),
        .MAC0_Enabled                      (port0_Enabled),
        .MAC1_Enabled                      (port1_Enabled),
`ifdef NEPTUNE
        .MAC2_Enabled                      (port2_Enabled),
        .MAC3_Enabled                      (port3_Enabled),
`endif
        .FlushEngine                       (flushEngine),

        .Port0_PacketAssyDead              (port0_PacketAssyDead),
        .Port0_ReOrder_Error               (port0_ReOrder_Error),

        .Port0_ReOrderEccControl           (port0_ReOrderEccControl),
        .Port0_StoreForwardEccControl      (port0_StoreForwardEccControl),
        .Port0_ClrMaxBurst                 (port0_clrMaxBurst),
        .Port0_UpdateDMA                   (port0_UpdateDMA),
        .Port0_UpdateDMALength             (port0_UpdateDMALength),
        .Port0_UpdateDMANumber             (port0_UpdateDMANumber),
        .Port0_ClearStatistics             (port0_ClearStatistics),
        .Port0_WrPacketStuffed             (port0_WrPacketStuffed),
        .Port0_WrPacketXmitted             (port0_WrPacketXmitted),
        .Port0_WrPacketRequested           (port0_WrPacketRequested),
        .Port0_GatherRequestCount          (port0_GatherRequestCount),
        .Port0_PacketRequestCount          (port0_PacketRequestCount),
        .Port0_PktErrAbortCount            (port0_PktErrAbortCount),
        .Port0_ReOrdersStuffed             (port0_ReOrdersStuffed),
        .Port0_PacketsStuffed              (port0_PacketsStuffed),
        .Port0_PacketsTransmitted          (port0_PacketsTransmitted),
        .Port0_BytesTransmitted            (port0_BytesTransmitted),
        .Port0_MaxReorderNumber            (port0_MaxReorderNumber),
        .Port0_DMA_List                    (port0_DMA_List),

        .Port0_TidsInUse                   (port0_TidsInUse),
        .Port0_DuplicateTid                (port0_DuplicateTid),
        .Port0_UnInitializedTID            (port0_UnInitializedTID),
        .Port0_TimedoutTids                (port0_TimedoutTids),
        .Port0_ReOrderStateLogic           (port0_ReOrderStateLogic),
        .Port0_ReOrderStateControl         (port0_ReOrderStateControl),
        .Port0_ReOrderStateData0           (port0_ReOrderStateData0),
        .Port0_ReOrderStateData1           (port0_ReOrderStateData1),
        .Port0_ReOrderStateData2           (port0_ReOrderStateData2),
        .Port0_ReOrderStateData3           (port0_ReOrderStateData3),
        .Port0_WrTidsInUse                 (port0_WrTidsInUse),
        .Port0_WrDuplicateTid              (port0_WrDuplicateTid),
        .Port0_WrUnInitializedTID          (port0_WrUnInitializedTID),
        .Port0_WrTimedoutTids              (port0_WrTimedoutTids),
        .Port0_WrReOrderStateLogic         (port0_WrReOrderStateLogic),
        .Port0_WrReOrderStateControl       (port0_WrReOrderStateControl),
        .Port0_WrReOrderStateData0         (port0_WrReOrderStateData0),
        .Port0_WrReOrderStateData1         (port0_WrReOrderStateData1),
        .Port0_WrReOrderStateData2         (port0_WrReOrderStateData2),
        .Port0_WrReOrderStateData3         (port0_WrReOrderStateData3),
        .Port0_PioDataIn                   (port0_PioDataIn),

        .Port0_ReOrder_ECC_State           (port0_ReOrder_ECC_State),
        .Port0_ReOrder_EccData             (port0_ReOrder_EccData),
        .Port0_StoreForward_ECC_State      (port0_StoreForward_ECC_State),
        .Port0_StoreForward_EccData        (port0_StoreForward_EccData),
        .Port0_ReOrder_ClearEccError       (port0_ReOrder_ClearEccError),
        .Port0_WrReOrderEccState           (port0_WrReOrderEccState),
        .Port0_WrReOrderEccData0           (port0_WrReOrderEccData0),
        .Port0_WrReOrderEccData1           (port0_WrReOrderEccData1),
        .Port0_WrReOrderEccData2           (port0_WrReOrderEccData2),
        .Port0_WrReOrderEccData3           (port0_WrReOrderEccData3),
        .Port0_WrReOrderEccData4           (port0_WrReOrderEccData4),
        .Port0_StoreForward_ClearEccError  (port0_StoreForward_ClearEccError),
        .Port0_WrStoreForwardEccState      (port0_WrStoreForwardEccState),
        .Port0_WrStoreForwardEccData0      (port0_WrStoreForwardEccData0),
        .Port0_WrStoreForwardEccData1      (port0_WrStoreForwardEccData1),
        .Port0_WrStoreForwardEccData2      (port0_WrStoreForwardEccData2),
        .Port0_WrStoreForwardEccData3      (port0_WrStoreForwardEccData3),
        .Port0_WrStoreForwardEccData4      (port0_WrStoreForwardEccData4),

        .Port1_PacketAssyDead              (port1_PacketAssyDead),
        .Port1_ReOrder_Error               (port1_ReOrder_Error),

        .Port1_ReOrderEccControl           (port1_ReOrderEccControl),
        .Port1_StoreForwardEccControl      (port1_StoreForwardEccControl),
        .Port1_ClrMaxBurst                 (port1_clrMaxBurst),
        .Port1_UpdateDMA                   (port1_UpdateDMA),
        .Port1_UpdateDMALength             (port1_UpdateDMALength),
        .Port1_UpdateDMANumber             (port1_UpdateDMANumber),
        .Port1_ClearStatistics             (port1_ClearStatistics),
        .Port1_WrPacketStuffed             (port1_WrPacketStuffed),
        .Port1_WrPacketXmitted             (port1_WrPacketXmitted),
        .Port1_WrPacketRequested           (port1_WrPacketRequested),
        .Port1_GatherRequestCount          (port1_GatherRequestCount),
        .Port1_PacketRequestCount          (port1_PacketRequestCount),
        .Port1_PktErrAbortCount            (port1_PktErrAbortCount),
        .Port1_ReOrdersStuffed             (port1_ReOrdersStuffed),
        .Port1_PacketsStuffed              (port1_PacketsStuffed),
        .Port1_PacketsTransmitted          (port1_PacketsTransmitted),
        .Port1_BytesTransmitted            (port1_BytesTransmitted),
        .Port1_MaxReorderNumber            (port1_MaxReorderNumber),
        .Port1_DMA_List                    (port1_DMA_List),

        .Port1_TidsInUse                   (port1_TidsInUse),
        .Port1_DuplicateTid                (port1_DuplicateTid),
        .Port1_UnInitializedTID            (port1_UnInitializedTID),
        .Port1_TimedoutTids                (port1_TimedoutTids),
        .Port1_ReOrderStateLogic           (port1_ReOrderStateLogic),
        .Port1_ReOrderStateControl         (port1_ReOrderStateControl),
        .Port1_ReOrderStateData0           (port1_ReOrderStateData0),
        .Port1_ReOrderStateData1           (port1_ReOrderStateData1),
        .Port1_ReOrderStateData2           (port1_ReOrderStateData2),
        .Port1_ReOrderStateData3           (port1_ReOrderStateData3),
        .Port1_WrTidsInUse                 (port1_WrTidsInUse),
        .Port1_WrDuplicateTid              (port1_WrDuplicateTid),
        .Port1_WrUnInitializedTID          (port1_WrUnInitializedTID),
        .Port1_WrTimedoutTids              (port1_WrTimedoutTids),
        .Port1_WrReOrderStateLogic         (port1_WrReOrderStateLogic),
        .Port1_WrReOrderStateControl       (port1_WrReOrderStateControl),
        .Port1_WrReOrderStateData0         (port1_WrReOrderStateData0),
        .Port1_WrReOrderStateData1         (port1_WrReOrderStateData1),
        .Port1_WrReOrderStateData2         (port1_WrReOrderStateData2),
        .Port1_WrReOrderStateData3         (port1_WrReOrderStateData3),
        .Port1_PioDataIn                   (port1_PioDataIn),

        .Port1_ReOrder_ECC_State           (port1_ReOrder_ECC_State),
        .Port1_ReOrder_EccData             (port1_ReOrder_EccData),
        .Port1_StoreForward_ECC_State      (port1_StoreForward_ECC_State),
        .Port1_StoreForward_EccData        (port1_StoreForward_EccData),
        .Port1_ReOrder_ClearEccError       (port1_ReOrder_ClearEccError),
        .Port1_WrReOrderEccState           (port1_WrReOrderEccState),
        .Port1_WrReOrderEccData0           (port1_WrReOrderEccData0),
        .Port1_WrReOrderEccData1           (port1_WrReOrderEccData1),
        .Port1_WrReOrderEccData2           (port1_WrReOrderEccData2),
        .Port1_WrReOrderEccData3           (port1_WrReOrderEccData3),
        .Port1_WrReOrderEccData4           (port1_WrReOrderEccData4),
        .Port1_StoreForward_ClearEccError  (port1_StoreForward_ClearEccError),
        .Port1_WrStoreForwardEccState      (port1_WrStoreForwardEccState),
        .Port1_WrStoreForwardEccData0      (port1_WrStoreForwardEccData0),
        .Port1_WrStoreForwardEccData1      (port1_WrStoreForwardEccData1),
        .Port1_WrStoreForwardEccData2      (port1_WrStoreForwardEccData2),
        .Port1_WrStoreForwardEccData3      (port1_WrStoreForwardEccData3),
        .Port1_WrStoreForwardEccData4      (port1_WrStoreForwardEccData4),

`ifdef NEPTUNE
        .Port2_PacketAssyDead              (port2_PacketAssyDead),
        .Port2_ReOrder_Error               (port2_ReOrder_Error),

        .Port2_ReOrderEccControl           (port2_ReOrderEccControl),
        .Port2_StoreForwardEccControl      (port2_StoreForwardEccControl),
        .Port2_ClrMaxBurst                 (port2_clrMaxBurst),
        .Port2_UpdateDMA                   (port2_UpdateDMA),
        .Port2_UpdateDMALength             (port2_UpdateDMALength),
        .Port2_UpdateDMANumber             (port2_UpdateDMANumber),
        .Port2_ClearStatistics             (port2_ClearStatistics),
        .Port2_WrPacketStuffed             (port2_WrPacketStuffed),
        .Port2_WrPacketXmitted             (port2_WrPacketXmitted),
        .Port2_WrPacketRequested           (port2_WrPacketRequested),
        .Port2_GatherRequestCount          (port2_GatherRequestCount),
        .Port2_PacketRequestCount          (port2_PacketRequestCount),
        .Port2_PktErrAbortCount            (port2_PktErrAbortCount),
        .Port2_ReOrdersStuffed             (port2_ReOrdersStuffed),
        .Port2_PacketsStuffed              (port2_PacketsStuffed),
        .Port2_PacketsTransmitted          (port2_PacketsTransmitted),
        .Port2_BytesTransmitted            (port2_BytesTransmitted),
        .Port2_MaxReorderNumber            (port2_MaxReorderNumber),
        .Port2_DMA_List                    (port2_DMA_List),

        .Port2_TidsInUse                   (port2_TidsInUse),
        .Port2_DuplicateTid                (port2_DuplicateTid),
        .Port2_UnInitializedTID            (port2_UnInitializedTID),
        .Port2_TimedoutTids                (port2_TimedoutTids),
        .Port2_ReOrderStateLogic           (port2_ReOrderStateLogic),
        .Port2_ReOrderStateControl         (port2_ReOrderStateControl),
        .Port2_ReOrderStateData0           (port2_ReOrderStateData0),
        .Port2_ReOrderStateData1           (port2_ReOrderStateData1),
        .Port2_ReOrderStateData2           (port2_ReOrderStateData2),
        .Port2_ReOrderStateData3           (port2_ReOrderStateData3),
        .Port2_WrTidsInUse                 (port2_WrTidsInUse),
        .Port2_WrDuplicateTid              (port2_WrDuplicateTid),
        .Port2_WrUnInitializedTID          (port2_WrUnInitializedTID),
        .Port2_WrTimedoutTids              (port2_WrTimedoutTids),
        .Port2_WrReOrderStateLogic         (port2_WrReOrderStateLogic),
        .Port2_WrReOrderStateControl       (port2_WrReOrderStateControl),
        .Port2_WrReOrderStateData0         (port2_WrReOrderStateData0),
        .Port2_WrReOrderStateData1         (port2_WrReOrderStateData1),
        .Port2_WrReOrderStateData2         (port2_WrReOrderStateData2),
        .Port2_WrReOrderStateData3         (port2_WrReOrderStateData3),
        .Port2_PioDataIn                   (port2_PioDataIn),

        .Port2_ReOrder_ECC_State           (port2_ReOrder_ECC_State),
        .Port2_ReOrder_EccData             (port2_ReOrder_EccData),
        .Port2_StoreForward_ECC_State      (port2_StoreForward_ECC_State),
        .Port2_StoreForward_EccData        (port2_StoreForward_EccData),
        .Port2_ReOrder_ClearEccError       (port2_ReOrder_ClearEccError),
        .Port2_WrReOrderEccState           (port2_WrReOrderEccState),
        .Port2_WrReOrderEccData0           (port2_WrReOrderEccData0),
        .Port2_WrReOrderEccData1           (port2_WrReOrderEccData1),
        .Port2_WrReOrderEccData2           (port2_WrReOrderEccData2),
        .Port2_WrReOrderEccData3           (port2_WrReOrderEccData3),
        .Port2_WrReOrderEccData4           (port2_WrReOrderEccData4),
        .Port2_StoreForward_ClearEccError  (port2_StoreForward_ClearEccError),
        .Port2_WrStoreForwardEccState      (port2_WrStoreForwardEccState),
        .Port2_WrStoreForwardEccData0      (port2_WrStoreForwardEccData0),
        .Port2_WrStoreForwardEccData1      (port2_WrStoreForwardEccData1),
        .Port2_WrStoreForwardEccData2      (port2_WrStoreForwardEccData2),
        .Port2_WrStoreForwardEccData3      (port2_WrStoreForwardEccData3),
        .Port2_WrStoreForwardEccData4      (port2_WrStoreForwardEccData4),

        .Port3_PacketAssyDead              (port3_PacketAssyDead),
        .Port3_ReOrder_Error               (port3_ReOrder_Error),

        .Port3_ReOrderEccControl           (port3_ReOrderEccControl),
        .Port3_StoreForwardEccControl      (port3_StoreForwardEccControl),
        .Port3_ClrMaxBurst                 (port3_clrMaxBurst),
        .Port3_UpdateDMA                   (port3_UpdateDMA),
        .Port3_UpdateDMALength             (port3_UpdateDMALength),
        .Port3_UpdateDMANumber             (port3_UpdateDMANumber),
        .Port3_ClearStatistics             (port3_ClearStatistics),
        .Port3_WrPacketStuffed             (port3_WrPacketStuffed),
        .Port3_WrPacketXmitted             (port3_WrPacketXmitted),
        .Port3_WrPacketRequested           (port3_WrPacketRequested),
        .Port3_GatherRequestCount          (port3_GatherRequestCount),
        .Port3_PacketRequestCount          (port3_PacketRequestCount),
        .Port3_PktErrAbortCount            (port3_PktErrAbortCount),
        .Port3_ReOrdersStuffed             (port3_ReOrdersStuffed),
        .Port3_PacketsStuffed              (port3_PacketsStuffed),
        .Port3_PacketsTransmitted          (port3_PacketsTransmitted),
        .Port3_BytesTransmitted            (port3_BytesTransmitted),
        .Port3_MaxReorderNumber            (port3_MaxReorderNumber),
        .Port3_DMA_List                    (port3_DMA_List),

        .Port3_TidsInUse                   (port3_TidsInUse),
        .Port3_DuplicateTid                (port3_DuplicateTid),
        .Port3_UnInitializedTID            (port3_UnInitializedTID),
        .Port3_TimedoutTids                (port3_TimedoutTids),
        .Port3_ReOrderStateLogic           (port3_ReOrderStateLogic),
        .Port3_ReOrderStateControl         (port3_ReOrderStateControl),
        .Port3_ReOrderStateData0           (port3_ReOrderStateData0),
        .Port3_ReOrderStateData1           (port3_ReOrderStateData1),
        .Port3_ReOrderStateData2           (port3_ReOrderStateData2),
        .Port3_ReOrderStateData3           (port3_ReOrderStateData3),
        .Port3_WrTidsInUse                 (port3_WrTidsInUse),
        .Port3_WrDuplicateTid              (port3_WrDuplicateTid),
        .Port3_WrUnInitializedTID          (port3_WrUnInitializedTID),
        .Port3_WrTimedoutTids              (port3_WrTimedoutTids),
        .Port3_WrReOrderStateLogic         (port3_WrReOrderStateLogic),
        .Port3_WrReOrderStateControl       (port3_WrReOrderStateControl),
        .Port3_WrReOrderStateData0         (port3_WrReOrderStateData0),
        .Port3_WrReOrderStateData1         (port3_WrReOrderStateData1),
        .Port3_WrReOrderStateData2         (port3_WrReOrderStateData2),
        .Port3_WrReOrderStateData3         (port3_WrReOrderStateData3),
        .Port3_PioDataIn                   (port3_PioDataIn),

        .Port3_ReOrder_ECC_State           (port3_ReOrder_ECC_State),
        .Port3_ReOrder_EccData             (port3_ReOrder_EccData),
        .Port3_StoreForward_ECC_State      (port3_StoreForward_ECC_State),
        .Port3_StoreForward_EccData        (port3_StoreForward_EccData),
        .Port3_ReOrder_ClearEccError       (port3_ReOrder_ClearEccError),
        .Port3_WrReOrderEccState           (port3_WrReOrderEccState),
        .Port3_WrReOrderEccData0           (port3_WrReOrderEccData0),
        .Port3_WrReOrderEccData1           (port3_WrReOrderEccData1),
        .Port3_WrReOrderEccData2           (port3_WrReOrderEccData2),
        .Port3_WrReOrderEccData3           (port3_WrReOrderEccData3),
        .Port3_WrReOrderEccData4           (port3_WrReOrderEccData4),
        .Port3_StoreForward_ClearEccError  (port3_StoreForward_ClearEccError),
        .Port3_WrStoreForwardEccState      (port3_WrStoreForwardEccState),
        .Port3_WrStoreForwardEccData0      (port3_WrStoreForwardEccData0),
        .Port3_WrStoreForwardEccData1      (port3_WrStoreForwardEccData1),
        .Port3_WrStoreForwardEccData2      (port3_WrStoreForwardEccData2),
        .Port3_WrStoreForwardEccData3      (port3_WrStoreForwardEccData3),
        .Port3_WrStoreForwardEccData4      (port3_WrStoreForwardEccData4),
`endif
        .DMA0_NewMaxBurst                  (dma0_NewMaxBurst),
        .DMA0_MaxBurst                     (dma0_MaxBurst),
        .DMA1_NewMaxBurst                  (dma1_NewMaxBurst),
        .DMA1_MaxBurst                     (dma1_MaxBurst),
        .DMA2_NewMaxBurst                  (dma2_NewMaxBurst),
        .DMA2_MaxBurst                     (dma2_MaxBurst),
        .DMA3_NewMaxBurst                  (dma3_NewMaxBurst),
        .DMA3_MaxBurst                     (dma3_MaxBurst),
        .DMA4_NewMaxBurst                  (dma4_NewMaxBurst),
        .DMA4_MaxBurst                     (dma4_MaxBurst),
        .DMA5_NewMaxBurst                  (dma5_NewMaxBurst),
        .DMA5_MaxBurst                     (dma5_MaxBurst),
        .DMA6_NewMaxBurst                  (dma6_NewMaxBurst),
        .DMA6_MaxBurst                     (dma6_MaxBurst),
        .DMA7_NewMaxBurst                  (dma7_NewMaxBurst),
        .DMA7_MaxBurst                     (dma7_MaxBurst),
        .DMA8_NewMaxBurst                  (dma8_NewMaxBurst),
        .DMA8_MaxBurst                     (dma8_MaxBurst),
        .DMA9_NewMaxBurst                  (dma9_NewMaxBurst),
        .DMA9_MaxBurst                     (dma9_MaxBurst),
        .DMA10_NewMaxBurst                 (dma10_NewMaxBurst),
        .DMA10_MaxBurst                    (dma10_MaxBurst),
        .DMA11_NewMaxBurst                 (dma11_NewMaxBurst),
        .DMA11_MaxBurst                    (dma11_MaxBurst),
        .DMA12_NewMaxBurst                 (dma12_NewMaxBurst),
        .DMA12_MaxBurst                    (dma12_MaxBurst),
        .DMA13_NewMaxBurst                 (dma13_NewMaxBurst),
        .DMA13_MaxBurst                    (dma13_MaxBurst),
        .DMA14_NewMaxBurst                 (dma14_NewMaxBurst),
        .DMA14_MaxBurst                    (dma14_MaxBurst),
        .DMA15_NewMaxBurst                 (dma15_NewMaxBurst),
        .DMA15_MaxBurst                    (dma15_MaxBurst),
        .DMA16_NewMaxBurst                 (dma16_NewMaxBurst),
        .DMA16_MaxBurst                    (dma16_MaxBurst),
        .DMA17_NewMaxBurst                 (dma17_NewMaxBurst),
        .DMA17_MaxBurst                    (dma17_MaxBurst),
        .DMA18_NewMaxBurst                 (dma18_NewMaxBurst),
        .DMA18_MaxBurst                    (dma18_MaxBurst),
        .DMA19_NewMaxBurst                 (dma19_NewMaxBurst),
        .DMA19_MaxBurst                    (dma19_MaxBurst),
        .DMA20_NewMaxBurst                 (dma20_NewMaxBurst),
        .DMA20_MaxBurst                    (dma20_MaxBurst),
        .DMA21_NewMaxBurst                 (dma21_NewMaxBurst),
        .DMA21_MaxBurst                    (dma21_MaxBurst),
        .DMA22_NewMaxBurst                 (dma22_NewMaxBurst),
        .DMA22_MaxBurst                    (dma22_MaxBurst),
        .DMA23_NewMaxBurst                 (dma23_NewMaxBurst),
        .DMA23_MaxBurst                    (dma23_MaxBurst),

        .Debug_Select                      (debug_select),
        .TrainingVector                    (trainingVector)
       );


niu_txc_debug niu_txc_debug (
        .SysClk                            (niu_clk),
        .Reset_L                           (reset_l),
        .Debug_Select                      (debug_select),
        .TrainingVector                    (trainingVector),
        .PortSelect_State                  (portSelect_State),
        .DataFetch_State                   (dataFetch_State),
        .Port0_LatchActiveDMA              (port0_LatchActiveDMA),
        .Port0_Anchor_State                (port0_Anchor_State),
        .Port0_ReOrder_State               (port0_ReOrder_State),
        .Port0_Pointer_State               (port0_Pointer_State),
        .Port0_PacketAssy_State            (port0_PacketAssy_State),
        .Port0_DRR_ArbState                (port0_DRR_ArbState),
        .Port0_Mac_Xfer_State              (port0_Mac_Xfer_State),
        .Port0_DataPortReq_State           (port0_DataPortReq_State),
        .Port0_ContextActiveList           (port0_ContextActiveList),
        .Port0_Sum_prt_state               (port0_Sum_prt_state),
        .Port1_LatchActiveDMA              (port1_LatchActiveDMA),
        .Port1_Anchor_State                (port1_Anchor_State),
        .Port1_ReOrder_State               (port1_ReOrder_State),
        .Port1_Pointer_State               (port1_Pointer_State),
        .Port1_PacketAssy_State            (port1_PacketAssy_State),
        .Port1_DRR_ArbState                (port1_DRR_ArbState),
        .Port1_Mac_Xfer_State              (port1_Mac_Xfer_State),
        .Port1_DataPortReq_State           (port1_DataPortReq_State),
        .Port1_ContextActiveList           (port1_ContextActiveList),
        .Port1_Sum_prt_state               (port1_Sum_prt_state),
`ifdef NEPTUNE
        .Port2_LatchActiveDMA              (port2_LatchActiveDMA),
        .Port2_Anchor_State                (port2_Anchor_State),
        .Port2_ReOrder_State               (port2_ReOrder_State),
        .Port2_Pointer_State               (port2_Pointer_State),
        .Port2_PacketAssy_State            (port2_PacketAssy_State),
        .Port2_DRR_ArbState                (port2_DRR_ArbState),
        .Port2_Mac_Xfer_State              (port2_Mac_Xfer_State),
        .Port2_DataPortReq_State           (port2_DataPortReq_State),
        .Port2_ContextActiveList           (port2_ContextActiveList),
        .Port2_Sum_prt_state               (port2_Sum_prt_state),
        .Port3_LatchActiveDMA              (port3_LatchActiveDMA),
        .Port3_Anchor_State                (port3_Anchor_State),
        .Port3_ReOrder_State               (port3_ReOrder_State),
        .Port3_Pointer_State               (port3_Pointer_State),
        .Port3_PacketAssy_State            (port3_PacketAssy_State),
        .Port3_DRR_ArbState                (port3_DRR_ArbState),
        .Port3_Mac_Xfer_State              (port3_Mac_Xfer_State),
        .Port3_DataPortReq_State           (port3_DataPortReq_State),
        .Port3_ContextActiveList           (port3_ContextActiveList),
        .Port3_Sum_prt_state               (port3_Sum_prt_state),
`else
        .Port2_LatchActiveDMA              (1'b0),
        .Port2_Anchor_State                (4'h0),
        .Port2_ReOrder_State               (4'h0),
        .Port2_Pointer_State               (4'h0),
        .Port2_PacketAssy_State            (4'h0),
        .Port2_DRR_ArbState                (4'h0),
        .Port2_Mac_Xfer_State              (4'h0),
        .Port2_DataPortReq_State           (4'h0),
        .Port2_ContextActiveList           (24'h0),
        .Port2_Sum_prt_state               (32'h0),
        .Port3_LatchActiveDMA              (1'b0),
        .Port3_Anchor_State                (4'h0),
        .Port3_ReOrder_State               (4'h0),
        .Port3_Pointer_State               (4'h0),
        .Port3_PacketAssy_State            (4'h0),
        .Port3_DRR_ArbState                (4'h0),
        .Port3_Mac_Xfer_State              (4'h0),
        .Port3_DataPortReq_State           (4'h0),
        .Port3_ContextActiveList           (24'h0),
        .Port3_Sum_prt_state               (32'h0),
`endif
        .Txc_Debug_Port                    (txc_debug_port)
       );


niu_txc_tdmc_ifc niu_txc_tdmc_ifc (
        .SysClk                            (niu_clk),
        .Reset_L                           (reset_l),

        .Port0_Nack_Pkt_Rd                 (port0_Nack_Pkt_Rd),
        .Port0_DMA_Nack_Pkt_Rd             (port0_DMA_Nack_Pkt_Rd),
        .Port0_Nack_Pkt_Rd_Addr            (port0_Nack_Pkt_Rd_Addr),
        .Port0_DMA0_inc_head               (port0_DMA0_inc_head),
        .Port0_DMA0_reset_done             (port0_DMA0_reset_done),
        .Port0_DMA0_mark_bit               (port0_DMA0_mark_bit),
        .Port0_DMA0_inc_pkt_cnt            (port0_DMA0_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA0          (port0_SetGetNextDescDMA0),
        .Port0_DMA1_inc_head               (port0_DMA1_inc_head),
        .Port0_DMA1_reset_done             (port0_DMA1_reset_done),
        .Port0_DMA1_mark_bit               (port0_DMA1_mark_bit),
        .Port0_DMA1_inc_pkt_cnt            (port0_DMA1_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA1          (port0_SetGetNextDescDMA1),
        .Port0_DMA2_inc_head               (port0_DMA2_inc_head),
        .Port0_DMA2_reset_done             (port0_DMA2_reset_done),
        .Port0_DMA2_mark_bit               (port0_DMA2_mark_bit),
        .Port0_DMA2_inc_pkt_cnt            (port0_DMA2_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA2          (port0_SetGetNextDescDMA2),
        .Port0_DMA3_inc_head               (port0_DMA3_inc_head),
        .Port0_DMA3_reset_done             (port0_DMA3_reset_done),
        .Port0_DMA3_mark_bit               (port0_DMA3_mark_bit),
        .Port0_DMA3_inc_pkt_cnt            (port0_DMA3_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA3          (port0_SetGetNextDescDMA3),
        .Port0_DMA4_inc_head               (port0_DMA4_inc_head),
        .Port0_DMA4_reset_done             (port0_DMA4_reset_done),
        .Port0_DMA4_mark_bit               (port0_DMA4_mark_bit),
        .Port0_DMA4_inc_pkt_cnt            (port0_DMA4_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA4          (port0_SetGetNextDescDMA4),
        .Port0_DMA5_inc_head               (port0_DMA5_inc_head),
        .Port0_DMA5_reset_done             (port0_DMA5_reset_done),
        .Port0_DMA5_mark_bit               (port0_DMA5_mark_bit),
        .Port0_DMA5_inc_pkt_cnt            (port0_DMA5_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA5          (port0_SetGetNextDescDMA5),
        .Port0_DMA6_inc_head               (port0_DMA6_inc_head),
        .Port0_DMA6_reset_done             (port0_DMA6_reset_done),
        .Port0_DMA6_mark_bit               (port0_DMA6_mark_bit),
        .Port0_DMA6_inc_pkt_cnt            (port0_DMA6_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA6          (port0_SetGetNextDescDMA6),
        .Port0_DMA7_inc_head               (port0_DMA7_inc_head),
        .Port0_DMA7_reset_done             (port0_DMA7_reset_done),
        .Port0_DMA7_mark_bit               (port0_DMA7_mark_bit),
        .Port0_DMA7_inc_pkt_cnt            (port0_DMA7_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA7          (port0_SetGetNextDescDMA7),
        .Port0_DMA8_inc_head               (port0_DMA8_inc_head),
        .Port0_DMA8_reset_done             (port0_DMA8_reset_done),
        .Port0_DMA8_mark_bit               (port0_DMA8_mark_bit),
        .Port0_DMA8_inc_pkt_cnt            (port0_DMA8_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA8          (port0_SetGetNextDescDMA8),
        .Port0_DMA9_inc_head               (port0_DMA9_inc_head),
        .Port0_DMA9_reset_done             (port0_DMA9_reset_done),
        .Port0_DMA9_mark_bit               (port0_DMA9_mark_bit),
        .Port0_DMA9_inc_pkt_cnt            (port0_DMA9_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA9          (port0_SetGetNextDescDMA9),
        .Port0_DMA10_inc_head              (port0_DMA10_inc_head),
        .Port0_DMA10_reset_done            (port0_DMA10_reset_done),
        .Port0_DMA10_mark_bit              (port0_DMA10_mark_bit),
        .Port0_DMA10_inc_pkt_cnt           (port0_DMA10_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA10         (port0_SetGetNextDescDMA10),
        .Port0_DMA11_inc_head              (port0_DMA11_inc_head),
        .Port0_DMA11_reset_done            (port0_DMA11_reset_done),
        .Port0_DMA11_mark_bit              (port0_DMA11_mark_bit),
        .Port0_DMA11_inc_pkt_cnt           (port0_DMA11_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA11         (port0_SetGetNextDescDMA11),
        .Port0_DMA12_inc_head              (port0_DMA12_inc_head),
        .Port0_DMA12_reset_done            (port0_DMA12_reset_done),
        .Port0_DMA12_mark_bit              (port0_DMA12_mark_bit),
        .Port0_DMA12_inc_pkt_cnt           (port0_DMA12_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA12         (port0_SetGetNextDescDMA12),
        .Port0_DMA13_inc_head              (port0_DMA13_inc_head),
        .Port0_DMA13_reset_done            (port0_DMA13_reset_done),
        .Port0_DMA13_mark_bit              (port0_DMA13_mark_bit),
        .Port0_DMA13_inc_pkt_cnt           (port0_DMA13_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA13         (port0_SetGetNextDescDMA13),
        .Port0_DMA14_inc_head              (port0_DMA14_inc_head),
        .Port0_DMA14_reset_done            (port0_DMA14_reset_done),
        .Port0_DMA14_mark_bit              (port0_DMA14_mark_bit),
        .Port0_DMA14_inc_pkt_cnt           (port0_DMA14_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA14         (port0_SetGetNextDescDMA14),
        .Port0_DMA15_inc_head              (port0_DMA15_inc_head),
        .Port0_DMA15_reset_done            (port0_DMA15_reset_done),
        .Port0_DMA15_mark_bit              (port0_DMA15_mark_bit),
        .Port0_DMA15_inc_pkt_cnt           (port0_DMA15_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA15         (port0_SetGetNextDescDMA15),
`ifdef NEPTUNE
        .Port0_DMA16_inc_head              (port0_DMA16_inc_head),
        .Port0_DMA16_reset_done            (port0_DMA16_reset_done),
        .Port0_DMA16_mark_bit              (port0_DMA16_mark_bit),
        .Port0_DMA16_inc_pkt_cnt           (port0_DMA16_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA16         (port0_SetGetNextDescDMA16),
        .Port0_DMA17_inc_head              (port0_DMA17_inc_head),
        .Port0_DMA17_reset_done            (port0_DMA17_reset_done),
        .Port0_DMA17_mark_bit              (port0_DMA17_mark_bit),
        .Port0_DMA17_inc_pkt_cnt           (port0_DMA17_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA17         (port0_SetGetNextDescDMA17),
        .Port0_DMA18_inc_head              (port0_DMA18_inc_head),
        .Port0_DMA18_reset_done            (port0_DMA18_reset_done),
        .Port0_DMA18_mark_bit              (port0_DMA18_mark_bit),
        .Port0_DMA18_inc_pkt_cnt           (port0_DMA18_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA18         (port0_SetGetNextDescDMA18),
        .Port0_DMA19_inc_head              (port0_DMA19_inc_head),
        .Port0_DMA19_reset_done            (port0_DMA19_reset_done),
        .Port0_DMA19_mark_bit              (port0_DMA19_mark_bit),
        .Port0_DMA19_inc_pkt_cnt           (port0_DMA19_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA19         (port0_SetGetNextDescDMA19),
        .Port0_DMA20_inc_head              (port0_DMA20_inc_head),
        .Port0_DMA20_reset_done            (port0_DMA20_reset_done),
        .Port0_DMA20_mark_bit              (port0_DMA20_mark_bit),
        .Port0_DMA20_inc_pkt_cnt           (port0_DMA20_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA20         (port0_SetGetNextDescDMA20),
        .Port0_DMA21_inc_head              (port0_DMA21_inc_head),
        .Port0_DMA21_reset_done            (port0_DMA21_reset_done),
        .Port0_DMA21_mark_bit              (port0_DMA21_mark_bit),
        .Port0_DMA21_inc_pkt_cnt           (port0_DMA21_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA21         (port0_SetGetNextDescDMA21),
        .Port0_DMA22_inc_head              (port0_DMA22_inc_head),
        .Port0_DMA22_reset_done            (port0_DMA22_reset_done),
        .Port0_DMA22_mark_bit              (port0_DMA22_mark_bit),
        .Port0_DMA22_inc_pkt_cnt           (port0_DMA22_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA22         (port0_SetGetNextDescDMA22),
        .Port0_DMA23_inc_head              (port0_DMA23_inc_head),
        .Port0_DMA23_reset_done            (port0_DMA23_reset_done),
        .Port0_DMA23_mark_bit              (port0_DMA23_mark_bit),
        .Port0_DMA23_inc_pkt_cnt           (port0_DMA23_inc_pkt_cnt),
        .Port0_SetGetNextDescDMA23         (port0_SetGetNextDescDMA23),
`else
        .Port0_DMA16_inc_head              (1'b0),
        .Port0_DMA16_reset_done            (1'b0),
        .Port0_DMA16_mark_bit              (1'b0),
        .Port0_DMA16_inc_pkt_cnt           (1'b0),
        .Port0_SetGetNextDescDMA16         (1'b0),
        .Port0_DMA17_inc_head              (1'b0),
        .Port0_DMA17_reset_done            (1'b0),
        .Port0_DMA17_mark_bit              (1'b0),
        .Port0_DMA17_inc_pkt_cnt           (1'b0),
        .Port0_SetGetNextDescDMA17         (1'b0),
        .Port0_DMA18_inc_head              (1'b0),
        .Port0_DMA18_reset_done            (1'b0),
        .Port0_DMA18_mark_bit              (1'b0),
        .Port0_DMA18_inc_pkt_cnt           (1'b0),
        .Port0_SetGetNextDescDMA18         (1'b0),
        .Port0_DMA19_inc_head              (1'b0),
        .Port0_DMA19_reset_done            (1'b0),
        .Port0_DMA19_mark_bit              (1'b0),
        .Port0_DMA19_inc_pkt_cnt           (1'b0),
        .Port0_SetGetNextDescDMA19         (1'b0),
        .Port0_DMA20_inc_head              (1'b0),
        .Port0_DMA20_reset_done            (1'b0),
        .Port0_DMA20_mark_bit              (1'b0),
        .Port0_DMA20_inc_pkt_cnt           (1'b0),
        .Port0_SetGetNextDescDMA20         (1'b0),
        .Port0_DMA21_inc_head              (1'b0),
        .Port0_DMA21_reset_done            (1'b0),
        .Port0_DMA21_mark_bit              (1'b0),
        .Port0_DMA21_inc_pkt_cnt           (1'b0),
        .Port0_SetGetNextDescDMA21         (1'b0),
        .Port0_DMA22_inc_head              (1'b0),
        .Port0_DMA22_reset_done            (1'b0),
        .Port0_DMA22_mark_bit              (1'b0),
        .Port0_DMA22_inc_pkt_cnt           (1'b0),
        .Port0_SetGetNextDescDMA22         (1'b0),
        .Port0_DMA23_inc_head              (1'b0),
        .Port0_DMA23_reset_done            (1'b0),
        .Port0_DMA23_mark_bit              (1'b0),
        .Port0_DMA23_inc_pkt_cnt           (1'b0),
        .Port0_SetGetNextDescDMA23         (1'b0),
`endif
        .Port1_Nack_Pkt_Rd                 (port1_Nack_Pkt_Rd),
        .Port1_DMA_Nack_Pkt_Rd             (port1_DMA_Nack_Pkt_Rd),
        .Port1_Nack_Pkt_Rd_Addr            (port1_Nack_Pkt_Rd_Addr),
        .Port1_DMA0_inc_head               (port1_DMA0_inc_head),
        .Port1_DMA0_reset_done             (port1_DMA0_reset_done),
        .Port1_DMA0_mark_bit               (port1_DMA0_mark_bit),
        .Port1_DMA0_inc_pkt_cnt            (port1_DMA0_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA0          (port1_SetGetNextDescDMA0),
        .Port1_DMA1_inc_head               (port1_DMA1_inc_head),
        .Port1_DMA1_reset_done             (port1_DMA1_reset_done),
        .Port1_DMA1_mark_bit               (port1_DMA1_mark_bit),
        .Port1_DMA1_inc_pkt_cnt            (port1_DMA1_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA1          (port1_SetGetNextDescDMA1),
        .Port1_DMA2_inc_head               (port1_DMA2_inc_head),
        .Port1_DMA2_reset_done             (port1_DMA2_reset_done),
        .Port1_DMA2_mark_bit               (port1_DMA2_mark_bit),
        .Port1_DMA2_inc_pkt_cnt            (port1_DMA2_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA2          (port1_SetGetNextDescDMA2),
        .Port1_DMA3_inc_head               (port1_DMA3_inc_head),
        .Port1_DMA3_reset_done             (port1_DMA3_reset_done),
        .Port1_DMA3_mark_bit               (port1_DMA3_mark_bit),
        .Port1_DMA3_inc_pkt_cnt            (port1_DMA3_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA3          (port1_SetGetNextDescDMA3),
        .Port1_DMA4_inc_head               (port1_DMA4_inc_head),
        .Port1_DMA4_reset_done             (port1_DMA4_reset_done),
        .Port1_DMA4_mark_bit               (port1_DMA4_mark_bit),
        .Port1_DMA4_inc_pkt_cnt            (port1_DMA4_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA4          (port1_SetGetNextDescDMA4),
        .Port1_DMA5_inc_head               (port1_DMA5_inc_head),
        .Port1_DMA5_reset_done             (port1_DMA5_reset_done),
        .Port1_DMA5_mark_bit               (port1_DMA5_mark_bit),
        .Port1_DMA5_inc_pkt_cnt            (port1_DMA5_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA5          (port1_SetGetNextDescDMA5),
        .Port1_DMA6_inc_head               (port1_DMA6_inc_head),
        .Port1_DMA6_reset_done             (port1_DMA6_reset_done),
        .Port1_DMA6_mark_bit               (port1_DMA6_mark_bit),
        .Port1_DMA6_inc_pkt_cnt            (port1_DMA6_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA6          (port1_SetGetNextDescDMA6),
        .Port1_DMA7_inc_head               (port1_DMA7_inc_head),
        .Port1_DMA7_reset_done             (port1_DMA7_reset_done),
        .Port1_DMA7_mark_bit               (port1_DMA7_mark_bit),
        .Port1_DMA7_inc_pkt_cnt            (port1_DMA7_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA7          (port1_SetGetNextDescDMA7),
        .Port1_DMA8_inc_head               (port1_DMA8_inc_head),
        .Port1_DMA8_reset_done             (port1_DMA8_reset_done),
        .Port1_DMA8_mark_bit               (port1_DMA8_mark_bit),
        .Port1_DMA8_inc_pkt_cnt            (port1_DMA8_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA8          (port1_SetGetNextDescDMA8),
        .Port1_DMA9_inc_head               (port1_DMA9_inc_head),
        .Port1_DMA9_reset_done             (port1_DMA9_reset_done),
        .Port1_DMA9_mark_bit               (port1_DMA9_mark_bit),
        .Port1_DMA9_inc_pkt_cnt            (port1_DMA9_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA9          (port1_SetGetNextDescDMA9),
        .Port1_DMA10_inc_head              (port1_DMA10_inc_head),
        .Port1_DMA10_reset_done            (port1_DMA10_reset_done),
        .Port1_DMA10_mark_bit              (port1_DMA10_mark_bit),
        .Port1_DMA10_inc_pkt_cnt           (port1_DMA10_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA10         (port1_SetGetNextDescDMA10),
        .Port1_DMA11_inc_head              (port1_DMA11_inc_head),
        .Port1_DMA11_reset_done            (port1_DMA11_reset_done),
        .Port1_DMA11_mark_bit              (port1_DMA11_mark_bit),
        .Port1_DMA11_inc_pkt_cnt           (port1_DMA11_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA11         (port1_SetGetNextDescDMA11),
        .Port1_DMA12_inc_head              (port1_DMA12_inc_head),
        .Port1_DMA12_reset_done            (port1_DMA12_reset_done),
        .Port1_DMA12_mark_bit              (port1_DMA12_mark_bit),
        .Port1_DMA12_inc_pkt_cnt           (port1_DMA12_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA12         (port1_SetGetNextDescDMA12),
        .Port1_DMA13_inc_head              (port1_DMA13_inc_head),
        .Port1_DMA13_reset_done            (port1_DMA13_reset_done),
        .Port1_DMA13_mark_bit              (port1_DMA13_mark_bit),
        .Port1_DMA13_inc_pkt_cnt           (port1_DMA13_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA13         (port1_SetGetNextDescDMA13),
        .Port1_DMA14_inc_head              (port1_DMA14_inc_head),
        .Port1_DMA14_reset_done            (port1_DMA14_reset_done),
        .Port1_DMA14_mark_bit              (port1_DMA14_mark_bit),
        .Port1_DMA14_inc_pkt_cnt           (port1_DMA14_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA14         (port1_SetGetNextDescDMA14),
        .Port1_DMA15_inc_head              (port1_DMA15_inc_head),
        .Port1_DMA15_reset_done            (port1_DMA15_reset_done),
        .Port1_DMA15_mark_bit              (port1_DMA15_mark_bit),
        .Port1_DMA15_inc_pkt_cnt           (port1_DMA15_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA15         (port1_SetGetNextDescDMA15),
`ifdef NEPTUNE
        .Port1_DMA16_inc_head              (port1_DMA16_inc_head),
        .Port1_DMA16_reset_done            (port1_DMA16_reset_done),
        .Port1_DMA16_mark_bit              (port1_DMA16_mark_bit),
        .Port1_DMA16_inc_pkt_cnt           (port1_DMA16_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA16         (port1_SetGetNextDescDMA16),
        .Port1_DMA17_inc_head              (port1_DMA17_inc_head),
        .Port1_DMA17_reset_done            (port1_DMA17_reset_done),
        .Port1_DMA17_mark_bit              (port1_DMA17_mark_bit),
        .Port1_DMA17_inc_pkt_cnt           (port1_DMA17_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA17         (port1_SetGetNextDescDMA17),
        .Port1_DMA18_inc_head              (port1_DMA18_inc_head),
        .Port1_DMA18_reset_done            (port1_DMA18_reset_done),
        .Port1_DMA18_mark_bit              (port1_DMA18_mark_bit),
        .Port1_DMA18_inc_pkt_cnt           (port1_DMA18_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA18         (port1_SetGetNextDescDMA18),
        .Port1_DMA19_inc_head              (port1_DMA19_inc_head),
        .Port1_DMA19_reset_done            (port1_DMA19_reset_done),
        .Port1_DMA19_mark_bit              (port1_DMA19_mark_bit),
        .Port1_DMA19_inc_pkt_cnt           (port1_DMA19_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA19         (port1_SetGetNextDescDMA19),
        .Port1_DMA20_inc_head              (port1_DMA20_inc_head),
        .Port1_DMA20_reset_done            (port1_DMA20_reset_done),
        .Port1_DMA20_mark_bit              (port1_DMA20_mark_bit),
        .Port1_DMA20_inc_pkt_cnt           (port1_DMA20_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA20         (port1_SetGetNextDescDMA20),
        .Port1_DMA21_inc_head              (port1_DMA21_inc_head),
        .Port1_DMA21_reset_done            (port1_DMA21_reset_done),
        .Port1_DMA21_mark_bit              (port1_DMA21_mark_bit),
        .Port1_DMA21_inc_pkt_cnt           (port1_DMA21_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA21         (port1_SetGetNextDescDMA21),
        .Port1_DMA22_inc_head              (port1_DMA22_inc_head),
        .Port1_DMA22_reset_done            (port1_DMA22_reset_done),
        .Port1_DMA22_mark_bit              (port1_DMA22_mark_bit),
        .Port1_DMA22_inc_pkt_cnt           (port1_DMA22_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA22         (port1_SetGetNextDescDMA22),
        .Port1_DMA23_inc_head              (port1_DMA23_inc_head),
        .Port1_DMA23_reset_done            (port1_DMA23_reset_done),
        .Port1_DMA23_mark_bit              (port1_DMA23_mark_bit),
        .Port1_DMA23_inc_pkt_cnt           (port1_DMA23_inc_pkt_cnt),
        .Port1_SetGetNextDescDMA23         (port1_SetGetNextDescDMA23),
`else
        .Port1_DMA16_inc_head              (1'b0),
        .Port1_DMA16_reset_done            (1'b0),
        .Port1_DMA16_mark_bit              (1'b0),
        .Port1_DMA16_inc_pkt_cnt           (1'b0),
        .Port1_SetGetNextDescDMA16         (1'b0),
        .Port1_DMA17_inc_head              (1'b0),
        .Port1_DMA17_reset_done            (1'b0),
        .Port1_DMA17_mark_bit              (1'b0),
        .Port1_DMA17_inc_pkt_cnt           (1'b0),
        .Port1_SetGetNextDescDMA17         (1'b0),
        .Port1_DMA18_inc_head              (1'b0),
        .Port1_DMA18_reset_done            (1'b0),
        .Port1_DMA18_mark_bit              (1'b0),
        .Port1_DMA18_inc_pkt_cnt           (1'b0),
        .Port1_SetGetNextDescDMA18         (1'b0),
        .Port1_DMA19_inc_head              (1'b0),
        .Port1_DMA19_reset_done            (1'b0),
        .Port1_DMA19_mark_bit              (1'b0),
        .Port1_DMA19_inc_pkt_cnt           (1'b0),
        .Port1_SetGetNextDescDMA19         (1'b0),
        .Port1_DMA20_inc_head              (1'b0),
        .Port1_DMA20_reset_done            (1'b0),
        .Port1_DMA20_mark_bit              (1'b0),
        .Port1_DMA20_inc_pkt_cnt           (1'b0),
        .Port1_SetGetNextDescDMA20         (1'b0),
        .Port1_DMA21_inc_head              (1'b0),
        .Port1_DMA21_reset_done            (1'b0),
        .Port1_DMA21_mark_bit              (1'b0),
        .Port1_DMA21_inc_pkt_cnt           (1'b0),
        .Port1_SetGetNextDescDMA21         (1'b0),
        .Port1_DMA22_inc_head              (1'b0),
        .Port1_DMA22_reset_done            (1'b0),
        .Port1_DMA22_mark_bit              (1'b0),
        .Port1_DMA22_inc_pkt_cnt           (1'b0),
        .Port1_SetGetNextDescDMA22         (1'b0),
        .Port1_DMA23_inc_head              (1'b0),
        .Port1_DMA23_reset_done            (1'b0),
        .Port1_DMA23_mark_bit              (1'b0),
        .Port1_DMA23_inc_pkt_cnt           (1'b0),
        .Port1_SetGetNextDescDMA23         (1'b0),
`endif

`ifdef NEPTUNE
        .Port2_Nack_Pkt_Rd                 (port2_Nack_Pkt_Rd),
        .Port2_DMA_Nack_Pkt_Rd             (port2_DMA_Nack_Pkt_Rd),
        .Port2_Nack_Pkt_Rd_Addr            (port2_Nack_Pkt_Rd_Addr),
        .Port2_DMA0_inc_head               (port2_DMA0_inc_head),
        .Port2_DMA0_reset_done             (port2_DMA0_reset_done),
        .Port2_DMA0_mark_bit               (port2_DMA0_mark_bit),
        .Port2_DMA0_inc_pkt_cnt            (port2_DMA0_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA0          (port2_SetGetNextDescDMA0),
        .Port2_DMA1_inc_head               (port2_DMA1_inc_head),
        .Port2_DMA1_reset_done             (port2_DMA1_reset_done),
        .Port2_DMA1_mark_bit               (port2_DMA1_mark_bit),
        .Port2_DMA1_inc_pkt_cnt            (port2_DMA1_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA1          (port2_SetGetNextDescDMA1),
        .Port2_DMA2_inc_head               (port2_DMA2_inc_head),
        .Port2_DMA2_reset_done             (port2_DMA2_reset_done),
        .Port2_DMA2_mark_bit               (port2_DMA2_mark_bit),
        .Port2_DMA2_inc_pkt_cnt            (port2_DMA2_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA2          (port2_SetGetNextDescDMA2),
        .Port2_DMA3_inc_head               (port2_DMA3_inc_head),
        .Port2_DMA3_reset_done             (port2_DMA3_reset_done),
        .Port2_DMA3_mark_bit               (port2_DMA3_mark_bit),
        .Port2_DMA3_inc_pkt_cnt            (port2_DMA3_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA3          (port2_SetGetNextDescDMA3),
        .Port2_DMA4_inc_head               (port2_DMA4_inc_head),
        .Port2_DMA4_reset_done             (port2_DMA4_reset_done),
        .Port2_DMA4_mark_bit               (port2_DMA4_mark_bit),
        .Port2_DMA4_inc_pkt_cnt            (port2_DMA4_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA4          (port2_SetGetNextDescDMA4),
        .Port2_DMA5_inc_head               (port2_DMA5_inc_head),
        .Port2_DMA5_reset_done             (port2_DMA5_reset_done),
        .Port2_DMA5_mark_bit               (port2_DMA5_mark_bit),
        .Port2_DMA5_inc_pkt_cnt            (port2_DMA5_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA5          (port2_SetGetNextDescDMA5),
        .Port2_DMA6_inc_head               (port2_DMA6_inc_head),
        .Port2_DMA6_reset_done             (port2_DMA6_reset_done),
        .Port2_DMA6_mark_bit               (port2_DMA6_mark_bit),
        .Port2_DMA6_inc_pkt_cnt            (port2_DMA6_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA6          (port2_SetGetNextDescDMA6),
        .Port2_DMA7_inc_head               (port2_DMA7_inc_head),
        .Port2_DMA7_reset_done             (port2_DMA7_reset_done),
        .Port2_DMA7_mark_bit               (port2_DMA7_mark_bit),
        .Port2_DMA7_inc_pkt_cnt            (port2_DMA7_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA7          (port2_SetGetNextDescDMA7),
        .Port2_DMA8_inc_head               (port2_DMA8_inc_head),
        .Port2_DMA8_reset_done             (port2_DMA8_reset_done),
        .Port2_DMA8_mark_bit               (port2_DMA8_mark_bit),
        .Port2_DMA8_inc_pkt_cnt            (port2_DMA8_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA8          (port2_SetGetNextDescDMA8),
        .Port2_DMA9_inc_head               (port2_DMA9_inc_head),
        .Port2_DMA9_reset_done             (port2_DMA9_reset_done),
        .Port2_DMA9_mark_bit               (port2_DMA9_mark_bit),
        .Port2_DMA9_inc_pkt_cnt            (port2_DMA9_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA9          (port2_SetGetNextDescDMA9),
        .Port2_DMA10_inc_head              (port2_DMA10_inc_head),
        .Port2_DMA10_reset_done            (port2_DMA10_reset_done),
        .Port2_DMA10_mark_bit              (port2_DMA10_mark_bit),
        .Port2_DMA10_inc_pkt_cnt           (port2_DMA10_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA10         (port2_SetGetNextDescDMA10),
        .Port2_DMA11_inc_head              (port2_DMA11_inc_head),
        .Port2_DMA11_reset_done            (port2_DMA11_reset_done),
        .Port2_DMA11_mark_bit              (port2_DMA11_mark_bit),
        .Port2_DMA11_inc_pkt_cnt           (port2_DMA11_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA11         (port2_SetGetNextDescDMA11),
        .Port2_DMA12_inc_head              (port2_DMA12_inc_head),
        .Port2_DMA12_reset_done            (port2_DMA12_reset_done),
        .Port2_DMA12_mark_bit              (port2_DMA12_mark_bit),
        .Port2_DMA12_inc_pkt_cnt           (port2_DMA12_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA12         (port2_SetGetNextDescDMA12),
        .Port2_DMA13_inc_head              (port2_DMA13_inc_head),
        .Port2_DMA13_reset_done            (port2_DMA13_reset_done),
        .Port2_DMA13_mark_bit              (port2_DMA13_mark_bit),
        .Port2_DMA13_inc_pkt_cnt           (port2_DMA13_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA13         (port2_SetGetNextDescDMA13),
        .Port2_DMA14_inc_head              (port2_DMA14_inc_head),
        .Port2_DMA14_reset_done            (port2_DMA14_reset_done),
        .Port2_DMA14_mark_bit              (port2_DMA14_mark_bit),
        .Port2_DMA14_inc_pkt_cnt           (port2_DMA14_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA14         (port2_SetGetNextDescDMA14),
        .Port2_DMA15_inc_head              (port2_DMA15_inc_head),
        .Port2_DMA15_reset_done            (port2_DMA15_reset_done),
        .Port2_DMA15_mark_bit              (port2_DMA15_mark_bit),
        .Port2_DMA15_inc_pkt_cnt           (port2_DMA15_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA15         (port2_SetGetNextDescDMA15),
        .Port2_DMA16_inc_head              (port2_DMA16_inc_head),
        .Port2_DMA16_reset_done            (port2_DMA16_reset_done),
        .Port2_DMA16_mark_bit              (port2_DMA16_mark_bit),
        .Port2_DMA16_inc_pkt_cnt           (port2_DMA16_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA16         (port2_SetGetNextDescDMA16),
        .Port2_DMA17_inc_head              (port2_DMA17_inc_head),
        .Port2_DMA17_reset_done            (port2_DMA17_reset_done),
        .Port2_DMA17_mark_bit              (port2_DMA17_mark_bit),
        .Port2_DMA17_inc_pkt_cnt           (port2_DMA17_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA17         (port2_SetGetNextDescDMA17),
        .Port2_DMA18_inc_head              (port2_DMA18_inc_head),
        .Port2_DMA18_reset_done            (port2_DMA18_reset_done),
        .Port2_DMA18_mark_bit              (port2_DMA18_mark_bit),
        .Port2_DMA18_inc_pkt_cnt           (port2_DMA18_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA18         (port2_SetGetNextDescDMA18),
        .Port2_DMA19_inc_head              (port2_DMA19_inc_head),
        .Port2_DMA19_reset_done            (port2_DMA19_reset_done),
        .Port2_DMA19_mark_bit              (port2_DMA19_mark_bit),
        .Port2_DMA19_inc_pkt_cnt           (port2_DMA19_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA19         (port2_SetGetNextDescDMA19),
        .Port2_DMA20_inc_head              (port2_DMA20_inc_head),
        .Port2_DMA20_reset_done            (port2_DMA20_reset_done),
        .Port2_DMA20_mark_bit              (port2_DMA20_mark_bit),
        .Port2_DMA20_inc_pkt_cnt           (port2_DMA20_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA20         (port2_SetGetNextDescDMA20),
        .Port2_DMA21_inc_head              (port2_DMA21_inc_head),
        .Port2_DMA21_reset_done            (port2_DMA21_reset_done),
        .Port2_DMA21_mark_bit              (port2_DMA21_mark_bit),
        .Port2_DMA21_inc_pkt_cnt           (port2_DMA21_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA21         (port2_SetGetNextDescDMA21),
        .Port2_DMA22_inc_head              (port2_DMA22_inc_head),
        .Port2_DMA22_reset_done            (port2_DMA22_reset_done),
        .Port2_DMA22_mark_bit              (port2_DMA22_mark_bit),
        .Port2_DMA22_inc_pkt_cnt           (port2_DMA22_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA22         (port2_SetGetNextDescDMA22),
        .Port2_DMA23_inc_head              (port2_DMA23_inc_head),
        .Port2_DMA23_reset_done            (port2_DMA23_reset_done),
        .Port2_DMA23_mark_bit              (port2_DMA23_mark_bit),
        .Port2_DMA23_inc_pkt_cnt           (port2_DMA23_inc_pkt_cnt),
        .Port2_SetGetNextDescDMA23         (port2_SetGetNextDescDMA23),
        .Port3_Nack_Pkt_Rd                 (port3_Nack_Pkt_Rd),
        .Port3_DMA_Nack_Pkt_Rd             (port3_DMA_Nack_Pkt_Rd),
        .Port3_Nack_Pkt_Rd_Addr            (port3_Nack_Pkt_Rd_Addr),
        .Port3_DMA0_inc_head               (port3_DMA0_inc_head),
        .Port3_DMA0_reset_done             (port3_DMA0_reset_done),
        .Port3_DMA0_mark_bit               (port3_DMA0_mark_bit),
        .Port3_DMA0_inc_pkt_cnt            (port3_DMA0_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA0          (port3_SetGetNextDescDMA0),
        .Port3_DMA1_inc_head               (port3_DMA1_inc_head),
        .Port3_DMA1_reset_done             (port3_DMA1_reset_done),
        .Port3_DMA1_mark_bit               (port3_DMA1_mark_bit),
        .Port3_DMA1_inc_pkt_cnt            (port3_DMA1_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA1          (port3_SetGetNextDescDMA1),
        .Port3_DMA2_inc_head               (port3_DMA2_inc_head),
        .Port3_DMA2_reset_done             (port3_DMA2_reset_done),
        .Port3_DMA2_mark_bit               (port3_DMA2_mark_bit),
        .Port3_DMA2_inc_pkt_cnt            (port3_DMA2_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA2          (port3_SetGetNextDescDMA2),
        .Port3_DMA3_inc_head               (port3_DMA3_inc_head),
        .Port3_DMA3_reset_done             (port3_DMA3_reset_done),
        .Port3_DMA3_mark_bit               (port3_DMA3_mark_bit),
        .Port3_DMA3_inc_pkt_cnt            (port3_DMA3_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA3          (port3_SetGetNextDescDMA3),
        .Port3_DMA4_inc_head               (port3_DMA4_inc_head),
        .Port3_DMA4_reset_done             (port3_DMA4_reset_done),
        .Port3_DMA4_mark_bit               (port3_DMA4_mark_bit),
        .Port3_DMA4_inc_pkt_cnt            (port3_DMA4_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA4          (port3_SetGetNextDescDMA4),
        .Port3_DMA5_inc_head               (port3_DMA5_inc_head),
        .Port3_DMA5_reset_done             (port3_DMA5_reset_done),
        .Port3_DMA5_mark_bit               (port3_DMA5_mark_bit),
        .Port3_DMA5_inc_pkt_cnt            (port3_DMA5_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA5          (port3_SetGetNextDescDMA5),
        .Port3_DMA6_inc_head               (port3_DMA6_inc_head),
        .Port3_DMA6_reset_done             (port3_DMA6_reset_done),
        .Port3_DMA6_mark_bit               (port3_DMA6_mark_bit),
        .Port3_DMA6_inc_pkt_cnt            (port3_DMA6_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA6          (port3_SetGetNextDescDMA6),
        .Port3_DMA7_inc_head               (port3_DMA7_inc_head),
        .Port3_DMA7_reset_done             (port3_DMA7_reset_done),
        .Port3_DMA7_mark_bit               (port3_DMA7_mark_bit),
        .Port3_DMA7_inc_pkt_cnt            (port3_DMA7_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA7          (port3_SetGetNextDescDMA7),
        .Port3_DMA8_inc_head               (port3_DMA8_inc_head),
        .Port3_DMA8_reset_done             (port3_DMA8_reset_done),
        .Port3_DMA8_mark_bit               (port3_DMA8_mark_bit),
        .Port3_DMA8_inc_pkt_cnt            (port3_DMA8_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA8          (port3_SetGetNextDescDMA8),
        .Port3_DMA9_inc_head               (port3_DMA9_inc_head),
        .Port3_DMA9_reset_done             (port3_DMA9_reset_done),
        .Port3_DMA9_mark_bit               (port3_DMA9_mark_bit),
        .Port3_DMA9_inc_pkt_cnt            (port3_DMA9_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA9          (port3_SetGetNextDescDMA9),
        .Port3_DMA10_inc_head              (port3_DMA10_inc_head),
        .Port3_DMA10_reset_done            (port3_DMA10_reset_done),
        .Port3_DMA10_mark_bit              (port3_DMA10_mark_bit),
        .Port3_DMA10_inc_pkt_cnt           (port3_DMA10_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA10         (port3_SetGetNextDescDMA10),
        .Port3_DMA11_inc_head              (port3_DMA11_inc_head),
        .Port3_DMA11_reset_done            (port3_DMA11_reset_done),
        .Port3_DMA11_mark_bit              (port3_DMA11_mark_bit),
        .Port3_DMA11_inc_pkt_cnt           (port3_DMA11_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA11         (port3_SetGetNextDescDMA11),
        .Port3_DMA12_inc_head              (port3_DMA12_inc_head),
        .Port3_DMA12_reset_done            (port3_DMA12_reset_done),
        .Port3_DMA12_mark_bit              (port3_DMA12_mark_bit),
        .Port3_DMA12_inc_pkt_cnt           (port3_DMA12_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA12         (port3_SetGetNextDescDMA12),
        .Port3_DMA13_inc_head              (port3_DMA13_inc_head),
        .Port3_DMA13_reset_done            (port3_DMA13_reset_done),
        .Port3_DMA13_mark_bit              (port3_DMA13_mark_bit),
        .Port3_DMA13_inc_pkt_cnt           (port3_DMA13_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA13         (port3_SetGetNextDescDMA13),
        .Port3_DMA14_inc_head              (port3_DMA14_inc_head),
        .Port3_DMA14_reset_done            (port3_DMA14_reset_done),
        .Port3_DMA14_mark_bit              (port3_DMA14_mark_bit),
        .Port3_DMA14_inc_pkt_cnt           (port3_DMA14_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA14         (port3_SetGetNextDescDMA14),
        .Port3_DMA15_inc_head              (port3_DMA15_inc_head),
        .Port3_DMA15_reset_done            (port3_DMA15_reset_done),
        .Port3_DMA15_mark_bit              (port3_DMA15_mark_bit),
        .Port3_DMA15_inc_pkt_cnt           (port3_DMA15_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA15         (port3_SetGetNextDescDMA15),
        .Port3_DMA16_inc_head              (port3_DMA16_inc_head),
        .Port3_DMA16_reset_done            (port3_DMA16_reset_done),
        .Port3_DMA16_mark_bit              (port3_DMA16_mark_bit),
        .Port3_DMA16_inc_pkt_cnt           (port3_DMA16_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA16         (port3_SetGetNextDescDMA16),
        .Port3_DMA17_inc_head              (port3_DMA17_inc_head),
        .Port3_DMA17_reset_done            (port3_DMA17_reset_done),
        .Port3_DMA17_mark_bit              (port3_DMA17_mark_bit),
        .Port3_DMA17_inc_pkt_cnt           (port3_DMA17_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA17         (port3_SetGetNextDescDMA17),
        .Port3_DMA18_inc_head              (port3_DMA18_inc_head),
        .Port3_DMA18_reset_done            (port3_DMA18_reset_done),
        .Port3_DMA18_mark_bit              (port3_DMA18_mark_bit),
        .Port3_DMA18_inc_pkt_cnt           (port3_DMA18_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA18         (port3_SetGetNextDescDMA18),
        .Port3_DMA19_inc_head              (port3_DMA19_inc_head),
        .Port3_DMA19_reset_done            (port3_DMA19_reset_done),
        .Port3_DMA19_mark_bit              (port3_DMA19_mark_bit),
        .Port3_DMA19_inc_pkt_cnt           (port3_DMA19_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA19         (port3_SetGetNextDescDMA19),
        .Port3_DMA20_inc_head              (port3_DMA20_inc_head),
        .Port3_DMA20_reset_done            (port3_DMA20_reset_done),
        .Port3_DMA20_mark_bit              (port3_DMA20_mark_bit),
        .Port3_DMA20_inc_pkt_cnt           (port3_DMA20_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA20         (port3_SetGetNextDescDMA20),
        .Port3_DMA21_inc_head              (port3_DMA21_inc_head),
        .Port3_DMA21_reset_done            (port3_DMA21_reset_done),
        .Port3_DMA21_mark_bit              (port3_DMA21_mark_bit),
        .Port3_DMA21_inc_pkt_cnt           (port3_DMA21_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA21         (port3_SetGetNextDescDMA21),
        .Port3_DMA22_inc_head              (port3_DMA22_inc_head),
        .Port3_DMA22_reset_done            (port3_DMA22_reset_done),
        .Port3_DMA22_mark_bit              (port3_DMA22_mark_bit),
        .Port3_DMA22_inc_pkt_cnt           (port3_DMA22_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA22         (port3_SetGetNextDescDMA22),
        .Port3_DMA23_inc_head              (port3_DMA23_inc_head),
        .Port3_DMA23_reset_done            (port3_DMA23_reset_done),
        .Port3_DMA23_mark_bit              (port3_DMA23_mark_bit),
        .Port3_DMA23_inc_pkt_cnt           (port3_DMA23_inc_pkt_cnt),
        .Port3_SetGetNextDescDMA23         (port3_SetGetNextDescDMA23),
`else
        .Port2_Nack_Pkt_Rd                 (1'b0),
        .Port2_DMA_Nack_Pkt_Rd             (24'h0),
        .Port2_Nack_Pkt_Rd_Addr            (44'h0),
        .Port2_DMA0_inc_head               (1'b0),
        .Port2_DMA0_reset_done             (1'b0),
        .Port2_DMA0_mark_bit               (1'b0),
        .Port2_DMA0_inc_pkt_cnt            (1'b0),
        .Port2_SetGetNextDescDMA0          (1'b0),
        .Port2_DMA1_inc_head               (1'b0),
        .Port2_DMA1_reset_done             (1'b0),
        .Port2_DMA1_mark_bit               (1'b0),
        .Port2_DMA1_inc_pkt_cnt            (1'b0),
        .Port2_SetGetNextDescDMA1          (1'b0),
        .Port2_DMA2_inc_head               (1'b0),
        .Port2_DMA2_reset_done             (1'b0),
        .Port2_DMA2_mark_bit               (1'b0),
        .Port2_DMA2_inc_pkt_cnt            (1'b0),
        .Port2_SetGetNextDescDMA2          (1'b0),
        .Port2_DMA3_inc_head               (1'b0),
        .Port2_DMA3_reset_done             (1'b0),
        .Port2_DMA3_mark_bit               (1'b0),
        .Port2_DMA3_inc_pkt_cnt            (1'b0),
        .Port2_SetGetNextDescDMA3          (1'b0),
        .Port2_DMA4_inc_head               (1'b0),
        .Port2_DMA4_reset_done             (1'b0),
        .Port2_DMA4_mark_bit               (1'b0),
        .Port2_DMA4_inc_pkt_cnt            (1'b0),
        .Port2_SetGetNextDescDMA4          (1'b0),
        .Port2_DMA5_inc_head               (1'b0),
        .Port2_DMA5_reset_done             (1'b0),
        .Port2_DMA5_mark_bit               (1'b0),
        .Port2_DMA5_inc_pkt_cnt            (1'b0),
        .Port2_SetGetNextDescDMA5          (1'b0),
        .Port2_DMA6_inc_head               (1'b0),
        .Port2_DMA6_reset_done             (1'b0),
        .Port2_DMA6_mark_bit               (1'b0),
        .Port2_DMA6_inc_pkt_cnt            (1'b0),
        .Port2_SetGetNextDescDMA6          (1'b0),
        .Port2_DMA7_inc_head               (1'b0),
        .Port2_DMA7_reset_done             (1'b0),
        .Port2_DMA7_mark_bit               (1'b0),
        .Port2_DMA7_inc_pkt_cnt            (1'b0),
        .Port2_SetGetNextDescDMA7          (1'b0),
        .Port2_DMA8_inc_head               (1'b0),
        .Port2_DMA8_reset_done             (1'b0),
        .Port2_DMA8_mark_bit               (1'b0),
        .Port2_DMA8_inc_pkt_cnt            (1'b0),
        .Port2_SetGetNextDescDMA8          (1'b0),
        .Port2_DMA9_inc_head               (1'b0),
        .Port2_DMA9_reset_done             (1'b0),
        .Port2_DMA9_mark_bit               (1'b0),
        .Port2_DMA9_inc_pkt_cnt            (1'b0),
        .Port2_SetGetNextDescDMA9          (1'b0),
        .Port2_DMA10_inc_head              (1'b0),
        .Port2_DMA10_reset_done            (1'b0),
        .Port2_DMA10_mark_bit              (1'b0),
        .Port2_DMA10_inc_pkt_cnt           (1'b0),
        .Port2_SetGetNextDescDMA10         (1'b0),
        .Port2_DMA11_inc_head              (1'b0),
        .Port2_DMA11_reset_done            (1'b0),
        .Port2_DMA11_mark_bit              (1'b0),
        .Port2_DMA11_inc_pkt_cnt           (1'b0),
        .Port2_SetGetNextDescDMA11         (1'b0),
        .Port2_DMA12_inc_head              (1'b0),
        .Port2_DMA12_reset_done            (1'b0),
        .Port2_DMA12_mark_bit              (1'b0),
        .Port2_DMA12_inc_pkt_cnt           (1'b0),
        .Port2_SetGetNextDescDMA12         (1'b0),
        .Port2_DMA13_inc_head              (1'b0),
        .Port2_DMA13_reset_done            (1'b0),
        .Port2_DMA13_mark_bit              (1'b0),
        .Port2_DMA13_inc_pkt_cnt           (1'b0),
        .Port2_SetGetNextDescDMA13         (1'b0),
        .Port2_DMA14_inc_head              (1'b0),
        .Port2_DMA14_reset_done            (1'b0),
        .Port2_DMA14_mark_bit              (1'b0),
        .Port2_DMA14_inc_pkt_cnt           (1'b0),
        .Port2_SetGetNextDescDMA14         (1'b0),
        .Port2_DMA15_inc_head              (1'b0),
        .Port2_DMA15_reset_done            (1'b0),
        .Port2_DMA15_mark_bit              (1'b0),
        .Port2_DMA15_inc_pkt_cnt           (1'b0),
        .Port2_SetGetNextDescDMA15         (1'b0),
        .Port2_DMA16_inc_head              (1'b0),
        .Port2_DMA16_reset_done            (1'b0),
        .Port2_DMA16_mark_bit              (1'b0),
        .Port2_DMA16_inc_pkt_cnt           (1'b0),
        .Port2_SetGetNextDescDMA16         (1'b0),
        .Port2_DMA17_inc_head              (1'b0),
        .Port2_DMA17_reset_done            (1'b0),
        .Port2_DMA17_mark_bit              (1'b0),
        .Port2_DMA17_inc_pkt_cnt           (1'b0),
        .Port2_SetGetNextDescDMA17         (1'b0),
        .Port2_DMA18_inc_head              (1'b0),
        .Port2_DMA18_reset_done            (1'b0),
        .Port2_DMA18_mark_bit              (1'b0),
        .Port2_DMA18_inc_pkt_cnt           (1'b0),
        .Port2_SetGetNextDescDMA18         (1'b0),
        .Port2_DMA19_inc_head              (1'b0),
        .Port2_DMA19_reset_done            (1'b0),
        .Port2_DMA19_mark_bit              (1'b0),
        .Port2_DMA19_inc_pkt_cnt           (1'b0),
        .Port2_SetGetNextDescDMA19         (1'b0),
        .Port2_DMA20_inc_head              (1'b0),
        .Port2_DMA20_reset_done            (1'b0),
        .Port2_DMA20_mark_bit              (1'b0),
        .Port2_DMA20_inc_pkt_cnt           (1'b0),
        .Port2_SetGetNextDescDMA20         (1'b0),
        .Port2_DMA21_inc_head              (1'b0),
        .Port2_DMA21_reset_done            (1'b0),
        .Port2_DMA21_mark_bit              (1'b0),
        .Port2_DMA21_inc_pkt_cnt           (1'b0),
        .Port2_SetGetNextDescDMA21         (1'b0),
        .Port2_DMA22_inc_head              (1'b0),
        .Port2_DMA22_reset_done            (1'b0),
        .Port2_DMA22_mark_bit              (1'b0),
        .Port2_DMA22_inc_pkt_cnt           (1'b0),
        .Port2_SetGetNextDescDMA22         (1'b0),
        .Port2_DMA23_inc_head              (1'b0),
        .Port2_DMA23_reset_done            (1'b0),
        .Port2_DMA23_mark_bit              (1'b0),
        .Port2_DMA23_inc_pkt_cnt           (1'b0),
        .Port2_SetGetNextDescDMA23         (1'b0),

        .Port3_Nack_Pkt_Rd                 (1'b0),
        .Port3_DMA_Nack_Pkt_Rd             (24'h0),
        .Port3_Nack_Pkt_Rd_Addr            (44'h0),
        .Port3_DMA0_inc_head               (1'b0),
        .Port3_DMA0_reset_done             (1'b0),
        .Port3_DMA0_mark_bit               (1'b0),
        .Port3_DMA0_inc_pkt_cnt            (1'b0),
        .Port3_SetGetNextDescDMA0          (1'b0),
        .Port3_DMA1_inc_head               (1'b0),
        .Port3_DMA1_reset_done             (1'b0),
        .Port3_DMA1_mark_bit               (1'b0),
        .Port3_DMA1_inc_pkt_cnt            (1'b0),
        .Port3_SetGetNextDescDMA1          (1'b0),
        .Port3_DMA2_inc_head               (1'b0),
        .Port3_DMA2_reset_done             (1'b0),
        .Port3_DMA2_mark_bit               (1'b0),
        .Port3_DMA2_inc_pkt_cnt            (1'b0),
        .Port3_SetGetNextDescDMA2          (1'b0),
        .Port3_DMA3_inc_head               (1'b0),
        .Port3_DMA3_reset_done             (1'b0),
        .Port3_DMA3_mark_bit               (1'b0),
        .Port3_DMA3_inc_pkt_cnt            (1'b0),
        .Port3_SetGetNextDescDMA3          (1'b0),
        .Port3_DMA4_inc_head               (1'b0),
        .Port3_DMA4_reset_done             (1'b0),
        .Port3_DMA4_mark_bit               (1'b0),
        .Port3_DMA4_inc_pkt_cnt            (1'b0),
        .Port3_SetGetNextDescDMA4          (1'b0),
        .Port3_DMA5_inc_head               (1'b0),
        .Port3_DMA5_reset_done             (1'b0),
        .Port3_DMA5_mark_bit               (1'b0),
        .Port3_DMA5_inc_pkt_cnt            (1'b0),
        .Port3_SetGetNextDescDMA5          (1'b0),
        .Port3_DMA6_inc_head               (1'b0),
        .Port3_DMA6_reset_done             (1'b0),
        .Port3_DMA6_mark_bit               (1'b0),
        .Port3_DMA6_inc_pkt_cnt            (1'b0),
        .Port3_SetGetNextDescDMA6          (1'b0),
        .Port3_DMA7_inc_head               (1'b0),
        .Port3_DMA7_reset_done             (1'b0),
        .Port3_DMA7_mark_bit               (1'b0),
        .Port3_DMA7_inc_pkt_cnt            (1'b0),
        .Port3_SetGetNextDescDMA7          (1'b0),
        .Port3_DMA8_inc_head               (1'b0),
        .Port3_DMA8_reset_done             (1'b0),
        .Port3_DMA8_mark_bit               (1'b0),
        .Port3_DMA8_inc_pkt_cnt            (1'b0),
        .Port3_SetGetNextDescDMA8          (1'b0),
        .Port3_DMA9_inc_head               (1'b0),
        .Port3_DMA9_reset_done             (1'b0),
        .Port3_DMA9_mark_bit               (1'b0),
        .Port3_DMA9_inc_pkt_cnt            (1'b0),
        .Port3_SetGetNextDescDMA9          (1'b0),
        .Port3_DMA10_inc_head              (1'b0),
        .Port3_DMA10_reset_done            (1'b0),
        .Port3_DMA10_mark_bit              (1'b0),
        .Port3_DMA10_inc_pkt_cnt           (1'b0),
        .Port3_SetGetNextDescDMA10         (1'b0),
        .Port3_DMA11_inc_head              (1'b0),
        .Port3_DMA11_reset_done            (1'b0),
        .Port3_DMA11_mark_bit              (1'b0),
        .Port3_DMA11_inc_pkt_cnt           (1'b0),
        .Port3_SetGetNextDescDMA11         (1'b0),
        .Port3_DMA12_inc_head              (1'b0),
        .Port3_DMA12_reset_done            (1'b0),
        .Port3_DMA12_mark_bit              (1'b0),
        .Port3_DMA12_inc_pkt_cnt           (1'b0),
        .Port3_SetGetNextDescDMA12         (1'b0),
        .Port3_DMA13_inc_head              (1'b0),
        .Port3_DMA13_reset_done            (1'b0),
        .Port3_DMA13_mark_bit              (1'b0),
        .Port3_DMA13_inc_pkt_cnt           (1'b0),
        .Port3_SetGetNextDescDMA13         (1'b0),
        .Port3_DMA14_inc_head              (1'b0),
        .Port3_DMA14_reset_done            (1'b0),
        .Port3_DMA14_mark_bit              (1'b0),
        .Port3_DMA14_inc_pkt_cnt           (1'b0),
        .Port3_SetGetNextDescDMA14         (1'b0),
        .Port3_DMA15_inc_head              (1'b0),
        .Port3_DMA15_reset_done            (1'b0),
        .Port3_DMA15_mark_bit              (1'b0),
        .Port3_DMA15_inc_pkt_cnt           (1'b0),
        .Port3_SetGetNextDescDMA15         (1'b0),
        .Port3_DMA16_inc_head              (1'b0),
        .Port3_DMA16_reset_done            (1'b0),
        .Port3_DMA16_mark_bit              (1'b0),
        .Port3_DMA16_inc_pkt_cnt           (1'b0),
        .Port3_SetGetNextDescDMA16         (1'b0),
        .Port3_DMA17_inc_head              (1'b0),
        .Port3_DMA17_reset_done            (1'b0),
        .Port3_DMA17_mark_bit              (1'b0),
        .Port3_DMA17_inc_pkt_cnt           (1'b0),
        .Port3_SetGetNextDescDMA17         (1'b0),
        .Port3_DMA18_inc_head              (1'b0),
        .Port3_DMA18_reset_done            (1'b0),
        .Port3_DMA18_mark_bit              (1'b0),
        .Port3_DMA18_inc_pkt_cnt           (1'b0),
        .Port3_SetGetNextDescDMA18         (1'b0),
        .Port3_DMA19_inc_head              (1'b0),
        .Port3_DMA19_reset_done            (1'b0),
        .Port3_DMA19_mark_bit              (1'b0),
        .Port3_DMA19_inc_pkt_cnt           (1'b0),
        .Port3_SetGetNextDescDMA19         (1'b0),
        .Port3_DMA20_inc_head              (1'b0),
        .Port3_DMA20_reset_done            (1'b0),
        .Port3_DMA20_mark_bit              (1'b0),
        .Port3_DMA20_inc_pkt_cnt           (1'b0),
        .Port3_SetGetNextDescDMA20         (1'b0),
        .Port3_DMA21_inc_head              (1'b0),
        .Port3_DMA21_reset_done            (1'b0),
        .Port3_DMA21_mark_bit              (1'b0),
        .Port3_DMA21_inc_pkt_cnt           (1'b0),
        .Port3_SetGetNextDescDMA21         (1'b0),
        .Port3_DMA22_inc_head              (1'b0),
        .Port3_DMA22_reset_done            (1'b0),
        .Port3_DMA22_mark_bit              (1'b0),
        .Port3_DMA22_inc_pkt_cnt           (1'b0),
        .Port3_SetGetNextDescDMA22         (1'b0),
        .Port3_DMA23_inc_head              (1'b0),
        .Port3_DMA23_reset_done            (1'b0),
        .Port3_DMA23_mark_bit              (1'b0),
        .Port3_DMA23_inc_pkt_cnt           (1'b0),
        .Port3_SetGetNextDescDMA23         (1'b0),
`endif
`ifdef NEPTUNE
        .TXC_DMC_DMA_Nack_Pkt_Rd           (txc_dmc_dma_nack_pkt_rd),
`else
        .TXC_DMC_DMA_Nack_Pkt_Rd           ({dummy_txc_dmc_dma_nack_pkt_rd,
                                           txc_dmc_dma_nack_pkt_rd}),
`endif
        .TXC_DMC_Nack_Pkt_Rd               (txc_dmc_nack_pkt_rd),
        .TXC_DMC_Nack_Pkt_Rd_Addr          (txc_dmc_nack_pkt_rd_addr),
        .DMC_TXC_DMA0_GotNxtDesc           (dmc_txc_dma0_gotnxtdesc),
        .TXC_DMC_DMA0_GetNxtDesc           (txc_dmc_dma0_getnxtdesc),
        .TXC_DMC_DMA0_inc_head             (txc_dmc_dma0_inc_head),
        .TXC_DMC_DMA0_reset_done           (txc_dmc_dma0_reset_done),
        .TXC_DMC_DMA0_mark_bit             (txc_dmc_dma0_mark_bit),
        .TXC_DMC_DMA0_inc_pkt_cnt          (txc_dmc_dma0_inc_pkt_cnt),
        .DMC_TXC_DMA1_GotNxtDesc           (dmc_txc_dma1_gotnxtdesc),
        .TXC_DMC_DMA1_GetNxtDesc           (txc_dmc_dma1_getnxtdesc),
        .TXC_DMC_DMA1_inc_head             (txc_dmc_dma1_inc_head),
        .TXC_DMC_DMA1_reset_done           (txc_dmc_dma1_reset_done),
        .TXC_DMC_DMA1_mark_bit             (txc_dmc_dma1_mark_bit),
        .TXC_DMC_DMA1_inc_pkt_cnt          (txc_dmc_dma1_inc_pkt_cnt),
        .DMC_TXC_DMA2_GotNxtDesc           (dmc_txc_dma2_gotnxtdesc),
        .TXC_DMC_DMA2_GetNxtDesc           (txc_dmc_dma2_getnxtdesc),
        .TXC_DMC_DMA2_inc_head             (txc_dmc_dma2_inc_head),
        .TXC_DMC_DMA2_reset_done           (txc_dmc_dma2_reset_done),
        .TXC_DMC_DMA2_mark_bit             (txc_dmc_dma2_mark_bit),
        .TXC_DMC_DMA2_inc_pkt_cnt          (txc_dmc_dma2_inc_pkt_cnt),
        .DMC_TXC_DMA3_GotNxtDesc           (dmc_txc_dma3_gotnxtdesc),
        .TXC_DMC_DMA3_GetNxtDesc           (txc_dmc_dma3_getnxtdesc),
        .TXC_DMC_DMA3_inc_head             (txc_dmc_dma3_inc_head),
        .TXC_DMC_DMA3_reset_done           (txc_dmc_dma3_reset_done),
        .TXC_DMC_DMA3_mark_bit             (txc_dmc_dma3_mark_bit),
        .TXC_DMC_DMA3_inc_pkt_cnt          (txc_dmc_dma3_inc_pkt_cnt),
        .DMC_TXC_DMA4_GotNxtDesc           (dmc_txc_dma4_gotnxtdesc),
        .TXC_DMC_DMA4_GetNxtDesc           (txc_dmc_dma4_getnxtdesc),
        .TXC_DMC_DMA4_inc_head             (txc_dmc_dma4_inc_head),
        .TXC_DMC_DMA4_reset_done           (txc_dmc_dma4_reset_done),
        .TXC_DMC_DMA4_mark_bit             (txc_dmc_dma4_mark_bit),
        .TXC_DMC_DMA4_inc_pkt_cnt          (txc_dmc_dma4_inc_pkt_cnt),
        .DMC_TXC_DMA5_GotNxtDesc           (dmc_txc_dma5_gotnxtdesc),
        .TXC_DMC_DMA5_GetNxtDesc           (txc_dmc_dma5_getnxtdesc),
        .TXC_DMC_DMA5_inc_head             (txc_dmc_dma5_inc_head),
        .TXC_DMC_DMA5_reset_done           (txc_dmc_dma5_reset_done),
        .TXC_DMC_DMA5_mark_bit             (txc_dmc_dma5_mark_bit),
        .TXC_DMC_DMA5_inc_pkt_cnt          (txc_dmc_dma5_inc_pkt_cnt),
        .DMC_TXC_DMA6_GotNxtDesc           (dmc_txc_dma6_gotnxtdesc),
        .TXC_DMC_DMA6_GetNxtDesc           (txc_dmc_dma6_getnxtdesc),
        .TXC_DMC_DMA6_inc_head             (txc_dmc_dma6_inc_head),
        .TXC_DMC_DMA6_reset_done           (txc_dmc_dma6_reset_done),
        .TXC_DMC_DMA6_mark_bit             (txc_dmc_dma6_mark_bit),
        .TXC_DMC_DMA6_inc_pkt_cnt          (txc_dmc_dma6_inc_pkt_cnt),
        .DMC_TXC_DMA7_GotNxtDesc           (dmc_txc_dma7_gotnxtdesc),
        .TXC_DMC_DMA7_GetNxtDesc           (txc_dmc_dma7_getnxtdesc),
        .TXC_DMC_DMA7_inc_head             (txc_dmc_dma7_inc_head),
        .TXC_DMC_DMA7_reset_done           (txc_dmc_dma7_reset_done),
        .TXC_DMC_DMA7_mark_bit             (txc_dmc_dma7_mark_bit),
        .TXC_DMC_DMA7_inc_pkt_cnt          (txc_dmc_dma7_inc_pkt_cnt),
        .DMC_TXC_DMA8_GotNxtDesc           (dmc_txc_dma8_gotnxtdesc),
        .TXC_DMC_DMA8_GetNxtDesc           (txc_dmc_dma8_getnxtdesc),
        .TXC_DMC_DMA8_inc_head             (txc_dmc_dma8_inc_head),
        .TXC_DMC_DMA8_reset_done           (txc_dmc_dma8_reset_done),
        .TXC_DMC_DMA8_mark_bit             (txc_dmc_dma8_mark_bit),
        .TXC_DMC_DMA8_inc_pkt_cnt          (txc_dmc_dma8_inc_pkt_cnt),
        .DMC_TXC_DMA9_GotNxtDesc           (dmc_txc_dma9_gotnxtdesc),
        .TXC_DMC_DMA9_GetNxtDesc           (txc_dmc_dma9_getnxtdesc),
        .TXC_DMC_DMA9_inc_head             (txc_dmc_dma9_inc_head),
        .TXC_DMC_DMA9_reset_done           (txc_dmc_dma9_reset_done),
        .TXC_DMC_DMA9_mark_bit             (txc_dmc_dma9_mark_bit),
        .TXC_DMC_DMA9_inc_pkt_cnt          (txc_dmc_dma9_inc_pkt_cnt),
        .DMC_TXC_DMA10_GotNxtDesc          (dmc_txc_dma10_gotnxtdesc),
        .TXC_DMC_DMA10_GetNxtDesc          (txc_dmc_dma10_getnxtdesc),
        .TXC_DMC_DMA10_inc_head            (txc_dmc_dma10_inc_head),
        .TXC_DMC_DMA10_reset_done          (txc_dmc_dma10_reset_done),
        .TXC_DMC_DMA10_mark_bit            (txc_dmc_dma10_mark_bit),
        .TXC_DMC_DMA10_inc_pkt_cnt         (txc_dmc_dma10_inc_pkt_cnt),
        .DMC_TXC_DMA11_GotNxtDesc          (dmc_txc_dma11_gotnxtdesc),
        .TXC_DMC_DMA11_GetNxtDesc          (txc_dmc_dma11_getnxtdesc),
        .TXC_DMC_DMA11_inc_head            (txc_dmc_dma11_inc_head),
        .TXC_DMC_DMA11_reset_done          (txc_dmc_dma11_reset_done),
        .TXC_DMC_DMA11_mark_bit            (txc_dmc_dma11_mark_bit),
        .TXC_DMC_DMA11_inc_pkt_cnt         (txc_dmc_dma11_inc_pkt_cnt),
        .DMC_TXC_DMA12_GotNxtDesc          (dmc_txc_dma12_gotnxtdesc),
        .TXC_DMC_DMA12_GetNxtDesc          (txc_dmc_dma12_getnxtdesc),
        .TXC_DMC_DMA12_inc_head            (txc_dmc_dma12_inc_head),
        .TXC_DMC_DMA12_reset_done          (txc_dmc_dma12_reset_done),
        .TXC_DMC_DMA12_mark_bit            (txc_dmc_dma12_mark_bit),
        .TXC_DMC_DMA12_inc_pkt_cnt         (txc_dmc_dma12_inc_pkt_cnt),
        .DMC_TXC_DMA13_GotNxtDesc          (dmc_txc_dma13_gotnxtdesc),
        .TXC_DMC_DMA13_GetNxtDesc          (txc_dmc_dma13_getnxtdesc),
        .TXC_DMC_DMA13_inc_head            (txc_dmc_dma13_inc_head),
        .TXC_DMC_DMA13_reset_done          (txc_dmc_dma13_reset_done),
        .TXC_DMC_DMA13_mark_bit            (txc_dmc_dma13_mark_bit),
        .TXC_DMC_DMA13_inc_pkt_cnt         (txc_dmc_dma13_inc_pkt_cnt),
        .DMC_TXC_DMA14_GotNxtDesc          (dmc_txc_dma14_gotnxtdesc),
        .TXC_DMC_DMA14_GetNxtDesc          (txc_dmc_dma14_getnxtdesc),
        .TXC_DMC_DMA14_inc_head            (txc_dmc_dma14_inc_head),
        .TXC_DMC_DMA14_reset_done          (txc_dmc_dma14_reset_done),
        .TXC_DMC_DMA14_mark_bit            (txc_dmc_dma14_mark_bit),
        .TXC_DMC_DMA14_inc_pkt_cnt         (txc_dmc_dma14_inc_pkt_cnt),
        .DMC_TXC_DMA15_GotNxtDesc          (dmc_txc_dma15_gotnxtdesc),
        .TXC_DMC_DMA15_GetNxtDesc          (txc_dmc_dma15_getnxtdesc),
        .TXC_DMC_DMA15_inc_head            (txc_dmc_dma15_inc_head),
        .TXC_DMC_DMA15_reset_done          (txc_dmc_dma15_reset_done),
        .TXC_DMC_DMA15_mark_bit            (txc_dmc_dma15_mark_bit),
        .TXC_DMC_DMA15_inc_pkt_cnt         (txc_dmc_dma15_inc_pkt_cnt),
        .DMC_TXC_DMA16_GotNxtDesc          (dmc_txc_dma16_gotnxtdesc),
        .TXC_DMC_DMA16_GetNxtDesc          (txc_dmc_dma16_getnxtdesc),
        .TXC_DMC_DMA16_inc_head            (txc_dmc_dma16_inc_head),
        .TXC_DMC_DMA16_reset_done          (txc_dmc_dma16_reset_done),
        .TXC_DMC_DMA16_mark_bit            (txc_dmc_dma16_mark_bit),
        .TXC_DMC_DMA16_inc_pkt_cnt         (txc_dmc_dma16_inc_pkt_cnt),
        .DMC_TXC_DMA17_GotNxtDesc          (dmc_txc_dma17_gotnxtdesc),
        .TXC_DMC_DMA17_GetNxtDesc          (txc_dmc_dma17_getnxtdesc),
        .TXC_DMC_DMA17_inc_head            (txc_dmc_dma17_inc_head),
        .TXC_DMC_DMA17_reset_done          (txc_dmc_dma17_reset_done),
        .TXC_DMC_DMA17_mark_bit            (txc_dmc_dma17_mark_bit),
        .TXC_DMC_DMA17_inc_pkt_cnt         (txc_dmc_dma17_inc_pkt_cnt),
        .DMC_TXC_DMA18_GotNxtDesc          (dmc_txc_dma18_gotnxtdesc),
        .TXC_DMC_DMA18_GetNxtDesc          (txc_dmc_dma18_getnxtdesc),
        .TXC_DMC_DMA18_inc_head            (txc_dmc_dma18_inc_head),
        .TXC_DMC_DMA18_reset_done          (txc_dmc_dma18_reset_done),
        .TXC_DMC_DMA18_mark_bit            (txc_dmc_dma18_mark_bit),
        .TXC_DMC_DMA18_inc_pkt_cnt         (txc_dmc_dma18_inc_pkt_cnt),
        .DMC_TXC_DMA19_GotNxtDesc          (dmc_txc_dma19_gotnxtdesc),
        .TXC_DMC_DMA19_GetNxtDesc          (txc_dmc_dma19_getnxtdesc),
        .TXC_DMC_DMA19_inc_head            (txc_dmc_dma19_inc_head),
        .TXC_DMC_DMA19_reset_done          (txc_dmc_dma19_reset_done),
        .TXC_DMC_DMA19_mark_bit            (txc_dmc_dma19_mark_bit),
        .TXC_DMC_DMA19_inc_pkt_cnt         (txc_dmc_dma19_inc_pkt_cnt),
        .DMC_TXC_DMA20_GotNxtDesc          (dmc_txc_dma20_gotnxtdesc),
        .TXC_DMC_DMA20_GetNxtDesc          (txc_dmc_dma20_getnxtdesc),
        .TXC_DMC_DMA20_inc_head            (txc_dmc_dma20_inc_head),
        .TXC_DMC_DMA20_reset_done          (txc_dmc_dma20_reset_done),
        .TXC_DMC_DMA20_mark_bit            (txc_dmc_dma20_mark_bit),
        .TXC_DMC_DMA20_inc_pkt_cnt         (txc_dmc_dma20_inc_pkt_cnt),
        .DMC_TXC_DMA21_GotNxtDesc          (dmc_txc_dma21_gotnxtdesc),
        .TXC_DMC_DMA21_GetNxtDesc          (txc_dmc_dma21_getnxtdesc),
        .TXC_DMC_DMA21_inc_head            (txc_dmc_dma21_inc_head),
        .TXC_DMC_DMA21_reset_done          (txc_dmc_dma21_reset_done),
        .TXC_DMC_DMA21_mark_bit            (txc_dmc_dma21_mark_bit),
        .TXC_DMC_DMA21_inc_pkt_cnt         (txc_dmc_dma21_inc_pkt_cnt),
        .DMC_TXC_DMA22_GotNxtDesc          (dmc_txc_dma22_gotnxtdesc),
        .TXC_DMC_DMA22_GetNxtDesc          (txc_dmc_dma22_getnxtdesc),
        .TXC_DMC_DMA22_inc_head            (txc_dmc_dma22_inc_head),
        .TXC_DMC_DMA22_reset_done          (txc_dmc_dma22_reset_done),
        .TXC_DMC_DMA22_mark_bit            (txc_dmc_dma22_mark_bit),
        .TXC_DMC_DMA22_inc_pkt_cnt         (txc_dmc_dma22_inc_pkt_cnt),
        .DMC_TXC_DMA23_GotNxtDesc          (dmc_txc_dma23_gotnxtdesc),
        .TXC_DMC_DMA23_GetNxtDesc          (txc_dmc_dma23_getnxtdesc),
        .TXC_DMC_DMA23_inc_head            (txc_dmc_dma23_inc_head),
        .TXC_DMC_DMA23_reset_done          (txc_dmc_dma23_reset_done),
        .TXC_DMC_DMA23_mark_bit            (txc_dmc_dma23_mark_bit),
        .TXC_DMC_DMA23_inc_pkt_cnt         (txc_dmc_dma23_inc_pkt_cnt)
       );

`ifdef NEPTUNE

niu_txc_spare niu_txc_spare0 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare1 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare2 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare3 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare4 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare5 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare6 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare7 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare8 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare9 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare10 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare11 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare12 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare13 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare14 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare15 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare16 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare17 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare18 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare19 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare20 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare21 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare22 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare23 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare24 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare25 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare26 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare27 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare28 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare29 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare30 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

niu_txc_spare niu_txc_spare31 (
        .clk                               (niu_clk),
        .rst                               (niu_reset_l)
       );

`endif

endmodule
