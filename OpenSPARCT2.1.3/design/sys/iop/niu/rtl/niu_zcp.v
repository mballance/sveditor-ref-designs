// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_zcp.v
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
 * File Name    : niu_zcp.v
 * Author Name  : John Lo
 * Description  : Zero Copy Processor 
 * Parent Module:  
 * Child  Module: 
 * Interface Mod:
 * Date Created : 3/25/2004
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

module niu_zcp (
// pio broadcast signals
               pio_clients_addr,
               pio_clients_rd,
               pio_clients_wdata,
               pio_zcp_sel,
               zcp_pio_ack,
               zcp_pio_rdata,
               zcp_pio_err,
               zcp_pio_intr,
// fflp intf
               fflp_zcp_wr,
               fflp_zcp_data,// 27 bytes = 216 bits
// port0
               dmc_zcp_req0,
               zcp_dmc_ack0,
               zcp_dmc_dat0,
               zcp_dmc_dat_err0,
               zcp_dmc_ful_pkt0,
// port1
               dmc_zcp_req1,
               zcp_dmc_ack1,
               zcp_dmc_dat1,
               zcp_dmc_dat_err1,
               zcp_dmc_ful_pkt1,
`ifdef NEPTUNE
// rdmc stuff
	       rdmc_zcp_func_num,
               page_handle,  // 20 bit per handle
// port2
               dmc_zcp_req2,
               zcp_dmc_ack2,
               zcp_dmc_dat2,
               zcp_dmc_dat_err2,
               zcp_dmc_ful_pkt2,
// port3
               dmc_zcp_req3,
               zcp_dmc_ack3,
               zcp_dmc_dat3,
               zcp_dmc_dat_err3,
               zcp_dmc_ful_pkt3,
// ZCP arb1 req intf
               zcp_arb1_req,
               zcp_arb1_req_cmd,
               zcp_arb1_req_address,
               zcp_arb1_req_length,
               zcp_arb1_req_port_num,
               zcp_arb1_req_dma_num,
	       zcp_arb1_req_func_num,
               arb1_zcp_req_accept,
// META RESPONSE control info
               meta_zcp_resp_ready,        // Resp Command Request
               meta_zcp_resp_cmd,
               meta_zcp_resp_cmd_status,   // Command Status
               meta_zcp_resp_length,       // Packet Length
               meta_zcp_resp_client,       // bit 0
               meta_zcp_resp_dma_num,      // Channel Number
               meta_zcp_resp_complete,     // bitwise ZCP_CLIENT[0]
               meta_zcp_resp_transfer_cmpl,// bitwise ZCP_CLIENT[0]
               zcp_meta_resp_accept,       // bitwise client accept
// META RESPONSE data	  
               meta_zcp_data_valid,        // Transfer Data Ack
               meta_zcp_data,              // Transfer Data
               meta_zcp_resp_byteenable,   // First/Last BE
               meta_zcp_data_status,       // Transfer Data Status
//		
`else  // N2
               iol2clk,
               tcu_mbist_user_mode,
               tcu_aclk,
               tcu_bclk,
               tcu_se_scancollar_in,
               tcu_se_scancollar_out,
               tcu_array_wr_inhibit,
               niu_mb7_cntrl_fifo_zcp_scan_in,
               niu_mb7_cntrl_fifo_zcp_scan_out,
               l2clk_2x,
               hdr_sram_rvalue_zcp0,
               hdr_sram_rid_zcp0,
               hdr_sram_wr_en_zcp0,
               hdr_sram_red_clr_zcp0,
               sram_hdr_read_data_zcp0,
	       rtx_rxc_zcp0_mb7_dmo_dout,
               hdr_sram_rvalue_zcp1,
               hdr_sram_rid_zcp1,
               hdr_sram_wr_en_zcp1,
               hdr_sram_red_clr_zcp1,
               sram_hdr_read_data_zcp1,
	       rtx_rxc_zcp1_mb7_dmo_dout,
// mbist controller related
               niu_tcu_mbist_fail_7,
               niu_tcu_mbist_done_7,
               mb7_scan_in,
               mb7_scan_out,
               tcu_niu_mbist_start_7,
               tcu_mbist_bisi_en,
               tcu_scan_en,
// specific to mb8
               niu_mb8_cntrl_fifo_zcp_scan_in,
               niu_mb8_cntrl_fifo_zcp_scan_out,
               niu_tcu_mbist_fail_8,
               niu_tcu_mbist_done_8,
               mb8_scan_in,
               mb8_scan_out,
               tcu_niu_mbist_start_8,
`endif
               reset_l,
               clk,
               zcp_debug_port
   );
                              // pio broadcast signals
   input  [19:0] 	      pio_clients_addr;
   input 		      pio_clients_rd;
   input  [31:0] 	      pio_clients_wdata;
   input 		      pio_zcp_sel;
   output 		      zcp_pio_ack;
   output [63:0] 	      zcp_pio_rdata;
   output 		      zcp_pio_err;
   output 		      zcp_pio_intr;
                              // fflp intf
   input  [4:0]		      fflp_zcp_wr;
   input  [215:0]	      fflp_zcp_data;// 27 bytes = 216 bits
                              // port0
   input 		      dmc_zcp_req0;
   output 		      zcp_dmc_ack0;
   output [129:0]             zcp_dmc_dat0;
   output 		      zcp_dmc_dat_err0;
   output 		      zcp_dmc_ful_pkt0;
                              // port1
   input 		      dmc_zcp_req1;
   output 		      zcp_dmc_ack1;
   output [129:0]             zcp_dmc_dat1;
   output 		      zcp_dmc_dat_err1;
   output 		      zcp_dmc_ful_pkt1;
`ifdef NEPTUNE
                              // rdmc stuff
   input  [31:0] 	      rdmc_zcp_func_num;
   input  [319:0] 	      page_handle;  // 20 bit per handle
                              // port2
   input 		      dmc_zcp_req2;
   output 		      zcp_dmc_ack2;
   output [129:0]             zcp_dmc_dat2;
   output 		      zcp_dmc_dat_err2;
   output 		      zcp_dmc_ful_pkt2;
                              // port3
   input 		      dmc_zcp_req3;
   output 		      zcp_dmc_ack3;
   output [129:0]             zcp_dmc_dat3;
   output 		      zcp_dmc_dat_err3;
   output 		      zcp_dmc_ful_pkt3;
                              // ZCP arb1 req intf
   output 		      zcp_arb1_req;
   output [7:0] 	      zcp_arb1_req_cmd;
   output [63:0] 	      zcp_arb1_req_address;
   output [13:0] 	      zcp_arb1_req_length;
   output [1:0] 	      zcp_arb1_req_port_num;
   output [4:0] 	      zcp_arb1_req_dma_num;
   output [1:0]               zcp_arb1_req_func_num;
   input 		      arb1_zcp_req_accept;
                              // META RESPONSE control info
   input 		      meta_zcp_resp_ready;        // Resp Command Request
   input  [7:0] 	      meta_zcp_resp_cmd;          // cmd
   input  [3:0] 	      meta_zcp_resp_cmd_status;   // cmd status
   input  [13:0] 	      meta_zcp_resp_length;       // Packet Length
   input  [4:0] 	      meta_zcp_resp_dma_num;      // Channel Number
   input 		      meta_zcp_resp_client;       // bit 0
   output 		      zcp_meta_resp_accept;       // bitwise client accept
                              // META RESPONSE data	  
   input  [127:0] 	      meta_zcp_data;              // Transfer Data
   input  [15:0] 	      meta_zcp_resp_byteenable;   // First/Last BE
   input  [3:0] 	      meta_zcp_data_status;       // Transfer Data Status
   input 		      meta_zcp_data_valid;        // Transfer Data Ack
   input         	      meta_zcp_resp_complete;     // bitwise ZCP_CLIENT[0]
   input         	      meta_zcp_resp_transfer_cmpl;// bitwise ZCP_CLIENT[0]
                              // DFT
`else  // N2
   // DFT signals
                              // memory related
   input 		      iol2clk;
   input 		      tcu_mbist_user_mode;
   input 		      tcu_aclk;
   input 		      tcu_bclk;
   input 		      tcu_se_scancollar_in;
   input 		      tcu_se_scancollar_out;
   input 		      tcu_array_wr_inhibit;
   input 		      niu_mb7_cntrl_fifo_zcp_scan_in;
   output 		      niu_mb7_cntrl_fifo_zcp_scan_out;
   input 		      l2clk_2x;
   input  [6:0]		      hdr_sram_rvalue_zcp0;
   input  [1:0]		      hdr_sram_rid_zcp0;
   input 		      hdr_sram_wr_en_zcp0;
   input 		      hdr_sram_red_clr_zcp0;
   output [6:0] 	      sram_hdr_read_data_zcp0;
   output [39:0] 	      rtx_rxc_zcp0_mb7_dmo_dout;
   input  [6:0]		      hdr_sram_rvalue_zcp1;
   input  [1:0]		      hdr_sram_rid_zcp1;
   input 		      hdr_sram_wr_en_zcp1;
   input 		      hdr_sram_red_clr_zcp1;
   output [6:0] 	      sram_hdr_read_data_zcp1;
   output [39:0] 	      rtx_rxc_zcp1_mb7_dmo_dout;
                              // mbist controller related
   output 		      niu_tcu_mbist_fail_7;
   output 		      niu_tcu_mbist_done_7;
   input 		      mb7_scan_in;
   output 		      mb7_scan_out;
   input 		      tcu_niu_mbist_start_7;
   input 		      tcu_mbist_bisi_en;
   input 		      tcu_scan_en;
                              // specific to mb8
   input 		      niu_mb8_cntrl_fifo_zcp_scan_in;
   output 		      niu_mb8_cntrl_fifo_zcp_scan_out;
   output 		      niu_tcu_mbist_fail_8;
   output 		      niu_tcu_mbist_done_8;
   input 		      mb8_scan_in;
   output 		      mb8_scan_out;
   input 		      tcu_niu_mbist_start_8;
`endif
   input 	              reset_l;
   input 	              clk;
   output [31:0] 	      zcp_debug_port;

   

   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   // vlint flag_net_never_driven off
   wire        		      tt_ok_reg7;
   wire 		      buf_req_ok;
   wire 		      decode_default_rdc;
   wire 		      decode_table_rdc;
   wire 		      decode_zc_rdc;
   wire			      cfifo_ren0;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      cfifo_ren1;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      cfifo_ren2;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      cfifo_ren3;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      cfifo_wen0;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      cfifo_wen1;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      cfifo_wen2;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      cfifo_wen3;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [16:0]		      chk_bit_data;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [4:0]		      default_rdc;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [10:0]		      dmaw_threshold;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      dn_ram_ren;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      dn_ram_wen;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [`DN_R]		      dram_slv_rdata;		// From dn_ram of niu_dn_ram.v
   wire [9:0]		      ds_offset0;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [9:0]		      ds_offset1;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [9:0]		      ds_offset2;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [9:0]		      ds_offset3;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      ecc_chk_dis;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [19:0]		      handle;			// From niu_zcp_slv of niu_zcp_slv.v
   wire			      latch_rspfifo_dout;	// From niu_zcp_rsp_intf of niu_zcp_rsp_intf.v
   wire			      par_chk_dis;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      req_dis;	        	// From niu_zcp_slv of niu_zcp_slv.v
   wire [1:0]		      req_load_state;		// From niu_zcp_req_intf of niu_zcp_req_intf.v
   wire [1:0] 		      req_unload_state;	        // From niu_zcp_req_intf of niu_zcp_req_intf.v
   wire			      reqfifo_uncorr_err;	// From niu_zcp_req_intf of niu_zcp_req_intf.v
   wire                       rrfifo_overrun;   	// From niu_zcp_req_intf
   wire 	              rrfifo_underrun;          // From niu_zcp_req_intfrrun;
   wire [`VAFIFO_A_PTR]	      reqfifo_wp;		// From niu_zcp_req_intf of niu_zcp_req_intf.v
   wire [`RRFIFO_W_R]	      rrfifo_rd_data;	        // From niu_zcp_req_intf of niu_zcp_req_intf.v
   wire			      rsp_accepted;		// From niu_zcp_arb2 of niu_zcp_arb2.v
   wire			      rsp_dis;	        	// From niu_zcp_slv of niu_zcp_slv.v
   wire [3:0]		      rsp_load_state;		// From niu_zcp_rsp_intf of niu_zcp_rsp_intf.v
   wire [31:0]		      rsp_ram_mapped_in;	// From niu_zcp_rsp_intf of niu_zcp_rsp_intf.v
   wire [`RSPFIFO_W_R]	      rsp_ram_wr_data;  	// From niu_zcp_rsp_intf of niu_zcp_rsp_intf.v
   wire			      rsp_request;		// From niu_zcp_rsp_intf of niu_zcp_rsp_intf.v
   wire [11:0]		      rsp_tt_index;		
   wire [11:0]		      rsp_tt_index1;		
   wire [11:0]		      rsp_tt_index2;		
   wire			      rsp_tt_index_err;  	// From va_ram of niu_va_ram.v
   wire [3:0]		      rsp_unload_state;  	// From niu_zcp_rsp_intf of niu_zcp_rsp_intf.v
   wire			      rspfifo_ren;		// From niu_zcp_rsp_intf of niu_zcp_rsp_intf.v
   wire [`VAFIFO_A_PTR]	      rspfifo_rp;		// From niu_zcp_rsp_intf of niu_zcp_rsp_intf.v
   wire			      rspfifo_uncorr_err;	// From niu_zcp_rsp_intf of niu_zcp_rsp_intf.v
   wire			      slv_accepted;		// From niu_zcp_arb2 of niu_zcp_arb2.v
   wire [10:0]		      slv_ram_addr;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [16:0]		      slv_ram_be;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [`DN_R]		      slv_ram_wdata;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      slv_request;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [11:0]		      slv_tt_index;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      slv_tt_index_err;	        // From va_ram of niu_va_ram.v
   wire [`ST_R]		      sram_slv_rdata;		// From st_ram of niu_st_ram.v
   wire			      st_ram_ren;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      st_ram_wen;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [4:0]		      table_rdc;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      tt_en;			// From niu_zcp_slv of niu_zcp_slv.v
   wire			      tt_index_chk0;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      tt_index_chk1;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      tt_index_chk2;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      tt_index_chk3;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [9:0]		      tt_index_end0;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [9:0]		      tt_index_end1;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [9:0]		      tt_index_end2;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [9:0]		      tt_index_end3;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [9:0]		      tt_index_start0;  	// From niu_zcp_slv of niu_zcp_slv.v
   wire [9:0]		      tt_index_start1;  	// From niu_zcp_slv of niu_zcp_slv.v
   wire [9:0]		      tt_index_start2;  	// From niu_zcp_slv of niu_zcp_slv.v
   wire [9:0]		      tt_index_start3;    	// From niu_zcp_slv of niu_zcp_slv.v
   wire [7:0]		      tt_offset0;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [7:0]		      tt_offset1;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [7:0]		      tt_offset2;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [7:0]		      tt_offset3;		// From niu_zcp_slv of niu_zcp_slv.v
   wire		      	      va_ram_ren;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_rwen;		// From niu_zcp_slv of niu_zcp_slv.v
   wire		      	      va_ram_rwen0;		// From niu_zcp_slv of niu_zcp_slv.v
   wire		              va_ram_rwen1;		// From niu_zcp_slv of niu_zcp_slv.v
   wire		              va_ram_rwen2;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_rwen3;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_rwen4;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_rwen5;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_rwen6;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_rwen7;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_wen;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_ren0;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_ren1;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_ren2;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_ren3;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_ren4;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_ren5;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_ren6;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_ren7;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_wen0;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_wen1;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_wen2;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_wen3;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_wen4;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_wen5;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_wen6;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      va_ram_wen7;		// From niu_zcp_slv of niu_zcp_slv.v
   wire [1023:0]	      vram_slv_rdata;		// From va_ram of niu_va_ram.v
   wire [4:0]		      zc_rdc;			// From niu_zcp_slv of niu_zcp_slv.v
   wire [7:0]		      zcp_debug_sel;		// From niu_zcp_slv of niu_zcp_slv.v
   wire			      zcp_tt_index_err;	        // From va_ram of niu_va_ram.v
   wire [`CFIFO_W_R]          zcp_dmc_dat0;
   wire [`CFIFO_W_R]          zcp_dmc_dat1;
   wire [`CFIFO_W_R]          zcp_dmc_dat2;
   wire [`CFIFO_W_R]          zcp_dmc_dat3;
   wire 		      zcp_dmc_dat_err0;
   wire 		      zcp_dmc_dat_err1;
   wire 		      zcp_dmc_dat_err2;
   wire 		      zcp_dmc_dat_err3;
   wire 		      wr_en0;
   wire 		      wr_en1;
   wire 		      wr_en2;
   wire 		      wr_en3;
   wire [`CFIFO_W_R] 	      wr_data;  // 130 bits: [129:0] 
   wire 		      reset;
   wire 		      reset_l;
   wire [3:0] 		      tt_state;
   wire [7:0] 		      tt_rdc_reg;
   wire [7:0] 		      fflp_rdc;
   wire [`IFIFO_W_R] 	      fflp_data;
   wire 		      va_ram_perr;
   wire 	      	      dn_ram_perr;
   wire 		      st_ram_perr;
   wire [31:0] 		      zcp_debug_port;
   wire [2:0] 		      ram_access_state;
   wire 		      reset_cfifo0;
   wire 		      reset_cfifo1;
   wire 		      reset_cfifo2;
   wire 		      reset_cfifo3;
   wire 		      clk;
   wire   		      kickoff_tt_reg;
   wire   		      set_tt_program_err   ; // zcp_slv.v
   wire 	              ecc_chk_bypass2;
   wire 		      double_bit_err2;
   wire 		      single_bit_err2;
   wire 		      last_line_err2;
   wire                       second_line_err2;
   wire                       first_line_err2;
   wire 	              ecc_chk_bypass3;
   wire 		      double_bit_err3;
   wire 		      single_bit_err3;
   wire 		      last_line_err3;
   wire                       second_line_err3;
   wire                       first_line_err3;
   wire                       c0_reset;
   wire                       c1_reset;
   wire                       c2_reset;
   wire                       c3_reset;
   wire  [21:0]               slv_reset;
   wire  [5:0]                fflp_reset;
   wire  [11:0]               req_reset;
   wire  [25:0]               rsp_reset;
   wire  [10:0]               tt_reset;
   wire  [36:0]               va_reset;
   wire  [4:0]                dn_reset;
   wire  [3:0]                st_reset;
   wire 		      zcp_32bit_mode;
   // vlint flag_net_never_driven on
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on

   wire [3:0]                 reset_reg_l;   
   reg  [3:0]		      inv_reset_reg_l;
   wire [`CFIFO_W_R] 	      cfifo_slv_rdata0;
   wire [`CFIFO_W_R] 	      cfifo_slv_rdata1;
   wire [`CFIFO_W_R] 	      cfifo_slv_rdata2;
   wire [`CFIFO_W_R] 	      cfifo_slv_rdata3;
   wire  [31:0] 	      training_vector;
   wire  [1:0] 		      fn;
   wire  [31:0] 	      rdmc_zcp_func_num;
   wire  [`PMS15:0]           page_handle;
   wire  [`IFIFO_W_R] 	      ififo_dout;
   wire  [2:0] 		      ififo_state;
   wire  [2:0]		      ififo_ren;
   wire 		      ififo_overrun;
   
   wire 	              ecc_chk_bypass0;
   wire 		      first_line0;
   wire 		      second_line0;
   wire 		      last_line0;
   wire 		      double_bit_err0;
   wire 		      single_bit_err0;
   wire 		      last_line_err0;
   wire                       second_line_err0;
   wire                       first_line_err0;
   
   wire 	              ecc_chk_bypass1;
   wire 		      first_line1;
   wire 		      second_line1;
   wire 		      last_line1;
   wire 		      double_bit_err1;
   wire 		      single_bit_err1;
   wire 		      last_line_err1;
   wire                       second_line_err1;
   wire                       first_line_err1;

/////////////////////////////////////////////////////////////////
// Start ifdef else endif instantiation section
/////////////////////////////////////////////////////////////////

`ifdef NEPTUNE

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [5:0]		bitmap_total_num_buf_requested;// From niu_zcp_req_intf of niu_zcp_req_intf.v
wire [1:0]		bitmap_tt_index_11_10;	// From niu_zcp_req_intf of niu_zcp_req_intf.v
wire [1:0]		rot_sft1_tt_index_11_10;// From niu_zcp_req_intf of niu_zcp_req_intf.v
wire [1:0]		rot_sft32_tt_index_11_10;// From niu_zcp_req_intf of niu_zcp_req_intf.v
wire			rotate;			// From niu_zcp_rsp_intf of niu_zcp_rsp_intf.v
wire			rotate_done;		// From niu_zcp_req_intf of niu_zcp_req_intf.v
wire			rsp_ram_wr_en0;		// From niu_zcp_rsp_intf of niu_zcp_rsp_intf.v
wire			rsp_ram_wr_en1;		// From niu_zcp_rsp_intf of niu_zcp_rsp_intf.v
wire			rsp_ram_wr_en2;		// From niu_zcp_rsp_intf of niu_zcp_rsp_intf.v
wire [3:0]		rspfifo_ren2;		// From niu_zcp_rsp_intf of niu_zcp_rsp_intf.v
wire			rspfifo_ren3;		// From niu_zcp_rsp_intf of niu_zcp_rsp_intf.v
wire			rst_rotate;		// From niu_zcp_req_intf of niu_zcp_req_intf.v
wire			rst_shift;		// From niu_zcp_req_intf of niu_zcp_req_intf.v
wire			shift;			// From niu_zcp_rsp_intf of niu_zcp_rsp_intf.v
wire			shift_done;		// From niu_zcp_req_intf of niu_zcp_req_intf.v
// End of automatics

   wire 		      wb_tt0;
   wire 		      wb_tt1;
   wire 		      tt_rd_en0;
   wire 		      tt_rd_en1;
   wire 		      tt_rd_en2;
   wire 		      tt_rd_en3;
   wire 		      tt_sm_rw;
   
   wire 		      first_line2;
   wire 		      second_line2;
   wire 		      last_line2;

   wire 		      first_line3;
   wire 		      second_line3;
   wire 		      last_line3;

   wire   		      tt_active;
   wire   [11:0] 	      tt_index;
   wire   [11:0] 	      tt_index_4va; // from tt (fflp)
   wire   [11:0] 	      tt_index_4dn; // from tt (fflp)
   wire   [11:0] 	      tt_index_4st; // from tt (fflp)

   wire   [1023:0] 	      va_dout;
   wire   [`ST_R] 	      st_dout;
   wire   [`DN_R] 	      dn_dout;
                              // req ptr intf
   wire  		      credit_ok;
   wire  		      zcp_tt_index_err_lv;
   wire   		      buf_req              ;
   wire   [15:0]              wptr_HoQ_reg         ;
   wire   		      cross_q_end_reg      ;
   wire   		      cross_4KB_reg        ;
   wire   [3:0] 	      ring_size_reg        ;
   wire   [38:0] 	      ring_base_addr_reg   ;
   wire   		      reach_buf_end_reg    ;
   wire   [5:0] 	      total_num_buf_requested_reg;
                              // wb
   wire   [`DN_R] 	      wb_dn_reg;
                              // debug
   wire   [15:0] 	      tcp_payld_len;
   wire   [9:0] 	      l2_hdr_len;
   wire   [9:0] 	      l3_hdr_len;
   wire   [9:0] 	      header_len;
                              // MCP debug
   wire  [`XPAN_TCP_SEQ_SPACE]TL;
   wire  [`XPAN_TCP_SEQ_SPACE]S;
   wire  [`PKT_LEN_R]         payload_len;  // registered wire .
   wire  [`PKT_LEN_R]	      header_delta; // registered wire .
   wire  [`XPAN_TCP_SEQ_SPACE]UE;
   wire  		      TL_bt_UE;
   wire  		      TL_eq_UE;
   wire  		      qual_ulp_end_fail_reg;
   wire  [`TCP_SEQ_SPACE]     running_anchor_seq;
   wire  [5:0] 		      first_byte_buf;
   wire  [20:0] 	      last_byte_buf;
   wire  [5:0] 		      index0;
   wire  [5:0] 	     	      index1;
   wire  [5:0] 	     	      index2;
   wire  [5:0] 	     	      index3;
   wire  		      win_ok;
   wire  		      ulp_end_fail;
   wire  		      mapped_in_fail;
   wire  		      dmaw_threshold_fail;
   wire  		      unmap_on_left_oc;
   
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire 		      neptune_signature;
   // vlint flag_dangling_net_within_module on
   // vlint flag_net_has_no_load on

   assign  neptune_signature = 1;
   
/* --------------- request interface ------------------------- */  
niu_zcp_req_intf  niu_zcp_req_intf 
  (/*AUTOINST*/
   // Outputs
   .credit_ok				(credit_ok),
   .rot_sft32_tt_index_11_10		(rot_sft32_tt_index_11_10[1:0]),
   .rot_sft1_tt_index_11_10		(rot_sft1_tt_index_11_10[1:0]),
   .bitmap_total_num_buf_requested	(bitmap_total_num_buf_requested[5:0]),
   .bitmap_tt_index_11_10		(bitmap_tt_index_11_10[1:0]),
   .rotate_done				(rotate_done),
   .shift_done				(shift_done),
   .rst_rotate				(rst_rotate),
   .rst_shift				(rst_shift),
   .reqfifo_wp				(reqfifo_wp[`VAFIFO_A_PTR]),
   .zcp_arb1_req			(zcp_arb1_req),
   .zcp_arb1_req_cmd			(zcp_arb1_req_cmd[7:0]),
   .zcp_arb1_req_address		(zcp_arb1_req_address[63:0]),
   .zcp_arb1_req_length			(zcp_arb1_req_length[13:0]),
   .zcp_arb1_req_func_num		(zcp_arb1_req_func_num[1:0]),
   .zcp_arb1_req_port_num		(zcp_arb1_req_port_num[1:0]),
   .zcp_arb1_req_dma_num		(zcp_arb1_req_dma_num[4:0]),
   .req_load_state			(req_load_state[1:0]),
   .req_unload_state			(req_unload_state[1:0]),
   .rrfifo_overrun			(rrfifo_overrun),
   .rrfifo_underrun			(rrfifo_underrun),
   .rsp_tt_index			(rsp_tt_index[11:0]),
   .rsp_tt_index1			(rsp_tt_index1[11:0]),
   .rsp_tt_index2			(rsp_tt_index2[11:0]),
   .rrfifo_rd_data			(rrfifo_rd_data[`RRFIFO_W_R]),
   // Inputs
   .clk					(clk),
   .req_reset				(req_reset[11:0]),
   .tt_index				(tt_index[11:0]),
   .fn					(fn[1:0]),
   .handle				(handle[19:0]),
   .buf_req				(buf_req),
   .wptr_HoQ_reg			(wptr_HoQ_reg[14:0]),
   .cross_q_end_reg			(cross_q_end_reg),
   .cross_4KB_reg			(cross_4KB_reg),
   .total_num_buf_requested_reg		(total_num_buf_requested_reg[5:0]),
   .ring_size_reg			(ring_size_reg[3:0]),
   .ring_base_addr_reg			(ring_base_addr_reg[38:0]),
   .rotate				(rotate),
   .shift				(shift),
   .rspfifo_rp				(rspfifo_rp[`VAFIFO_A_PTR]),
   .rspfifo_ren2			(rspfifo_ren2[3:0]),
   .arb1_zcp_req_accept			(arb1_zcp_req_accept),
   .zcp_32bit_mode			(zcp_32bit_mode),
   .req_dis				(req_dis));

/* --------------- response interface ------------------------ */  
niu_zcp_rsp_intf  niu_zcp_rsp_intf
  (/*AUTOINST*/
   // Outputs
   .rsp_request				(rsp_request),
   .rsp_ram_wr_en0			(rsp_ram_wr_en0),
   .rsp_ram_wr_en1			(rsp_ram_wr_en1),
   .rsp_ram_wr_en2			(rsp_ram_wr_en2),
   .rsp_ram_wr_data			(rsp_ram_wr_data[`RSPFIFO_W_R]),
   .rsp_ram_mapped_in			(rsp_ram_mapped_in[31:0]),
   .rotate				(rotate),
   .shift				(shift),
   .rspfifo_rp				(rspfifo_rp[`VAFIFO_A_PTR]),
   .rspfifo_ren2			(rspfifo_ren2[3:0]),
   .rspfifo_ren3			(rspfifo_ren3),
   .latch_rspfifo_dout			(latch_rspfifo_dout),
   .zcp_meta_resp_accept		(zcp_meta_resp_accept),
   .rsp_load_state			(rsp_load_state[3:0]),
   .rsp_unload_state			(rsp_unload_state[3:0]),
   .rspfifo_uncorr_err			(rspfifo_uncorr_err),
   // Inputs
   .clk					(clk),
   .rsp_reset				(rsp_reset[25:0]),
   .rsp_accepted			(rsp_accepted),
   .rot_sft32_tt_index_11_10		(rot_sft32_tt_index_11_10[1:0]),
   .rot_sft1_tt_index_11_10		(rot_sft1_tt_index_11_10[1:0]),
   .bitmap_total_num_buf_requested	(bitmap_total_num_buf_requested[5:0]),
   .bitmap_tt_index_11_10		(bitmap_tt_index_11_10[1:0]),
   .rotate_done				(rotate_done),
   .shift_done				(shift_done),
   .rst_rotate				(rst_rotate),
   .rst_shift				(rst_shift),
   .reqfifo_wp				(reqfifo_wp[`VAFIFO_A_PTR]),
   .meta_zcp_resp_cmd			(meta_zcp_resp_cmd[7:0]),
   .meta_zcp_resp_length		(meta_zcp_resp_length[13:0]),
   .meta_zcp_resp_ready			(meta_zcp_resp_ready),
   .meta_zcp_resp_cmd_status		(meta_zcp_resp_cmd_status[3:0]),
   .meta_zcp_resp_dma_num		(meta_zcp_resp_dma_num[4:0]),
   .meta_zcp_resp_client		(meta_zcp_resp_client),
   .meta_zcp_data			(meta_zcp_data[127:0]),
   .meta_zcp_resp_byteenable		(meta_zcp_resp_byteenable[15:0]),
   .meta_zcp_data_status		(meta_zcp_data_status[3:0]),
   .meta_zcp_data_valid			(meta_zcp_data_valid),
   .meta_zcp_resp_complete		(meta_zcp_resp_complete),
   .meta_zcp_resp_transfer_cmpl		(meta_zcp_resp_transfer_cmpl),
   .rsp_dis				(rsp_dis));

/* --------------- arbiter -------------------------- */
niu_zcp_arb2  niu_zcp_arb2
  (/*AUTOINST*/
   // Outputs
   .rsp_accepted			(rsp_accepted),
   .slv_accepted			(slv_accepted),
   // Inputs
   .clk					(clk),
   .reset				(reset),
   .tt_active				(tt_active),
   .tt_index				(tt_index[11:0]),
   .tt_sm_rw				(tt_sm_rw),
   .rsp_request				(rsp_request),
   .rsp_tt_index			(rsp_tt_index[11:0]),
   .slv_request				(slv_request),
   .slv_tt_index			(slv_tt_index[11:0]));

/* --------------- translation table ------------------------- */  
niu_va_ram va_ram
  (/*AUTOINST*/
   // Outputs
   .va_ram_perr				(va_ram_perr),
   .zcp_tt_index_err			(zcp_tt_index_err),
   .zcp_tt_index_err_lv			(zcp_tt_index_err_lv),
   .va_dout				(va_dout[1023:0]),
   .rsp_tt_index_err			(rsp_tt_index_err),
   .slv_tt_index_err			(slv_tt_index_err),
   .vram_slv_rdata			(vram_slv_rdata[1023:0]),
   // Inputs
   .clk					(clk),
   .va_reset				(va_reset[36:0]),
   .par_chk_dis				(par_chk_dis),
   .chk_bit_data			(chk_bit_data[15:0]),
   .tt_offset0				(tt_offset0[7:0]),
   .tt_index_start0			(tt_index_start0[9:0]),
   .tt_index_end0			(tt_index_end0[9:0]),
   .tt_index_chk0			(tt_index_chk0),
   .tt_offset1				(tt_offset1[7:0]),
   .tt_index_start1			(tt_index_start1[9:0]),
   .tt_index_end1			(tt_index_end1[9:0]),
   .tt_index_chk1			(tt_index_chk1),
   .tt_offset2				(tt_offset2[7:0]),
   .tt_index_start2			(tt_index_start2[9:0]),
   .tt_index_end2			(tt_index_end2[9:0]),
   .tt_index_chk2			(tt_index_chk2),
   .tt_offset3				(tt_offset3[7:0]),
   .tt_index_start3			(tt_index_start3[9:0]),
   .tt_index_end3			(tt_index_end3[9:0]),
   .tt_index_chk3			(tt_index_chk3),
   .tt_rd_en3				(tt_rd_en3),
   .tt_index_4va			(tt_index_4va[11:0]),
   .rsp_ram_wr_en0			(rsp_ram_wr_en0),
   .rsp_ram_wr_data			(rsp_ram_wr_data[`RSPFIFO_W_R]),
   .rsp_ram_mapped_in			(rsp_ram_mapped_in[31:0]),
   .rsp_tt_index1			(rsp_tt_index1[11:0]),
   .slv_tt_index			(slv_tt_index[11:0]),
   .slv_ram_wdata			(slv_ram_wdata[`VA_R]),
   .slv_ram_be				(slv_ram_be[3:0]),
   .va_ram_ren				(va_ram_ren),
   .va_ram_wen				(va_ram_wen),
   .va_ram_wen0				(va_ram_wen0),
   .va_ram_wen1				(va_ram_wen1),
   .va_ram_wen2				(va_ram_wen2),
   .va_ram_wen3				(va_ram_wen3),
   .va_ram_wen4				(va_ram_wen4),
   .va_ram_wen5				(va_ram_wen5),
   .va_ram_wen6				(va_ram_wen6),
   .va_ram_wen7				(va_ram_wen7),
   .va_ram_rwen				(va_ram_rwen),
   .va_ram_rwen0			(va_ram_rwen0),
   .va_ram_rwen1			(va_ram_rwen1),
   .va_ram_rwen2			(va_ram_rwen2),
   .va_ram_rwen3			(va_ram_rwen3),
   .va_ram_rwen4			(va_ram_rwen4),
   .va_ram_rwen5			(va_ram_rwen5),
   .va_ram_rwen6			(va_ram_rwen6),
   .va_ram_rwen7			(va_ram_rwen7));
   
niu_st_ram  st_ram
  (/*AUTOINST*/
   // Outputs
   .st_ram_perr				(st_ram_perr),
   .st_dout				(st_dout[`ST_R]),
   .sram_slv_rdata			(sram_slv_rdata[`ST_R]),
   // Inputs
   .clk					(clk),
   .st_reset				(st_reset[3:0]),
   .par_chk_dis				(par_chk_dis),
   .chk_bit_data			(chk_bit_data[13:0]),
   .tt_index_4st			(tt_index_4st[11:0]),
   .tt_rd_en2				(tt_rd_en2),
   .slv_tt_index			(slv_tt_index[11:0]),
   .st_ram_wen				(st_ram_wen),
   .st_ram_ren				(st_ram_ren),
   .slv_ram_wdata			(slv_ram_wdata[`ST_R]),
   .slv_ram_be				(slv_ram_be[`ST_PR]),
   .ds_offset0				(ds_offset0[9:0]),
   .ds_offset1				(ds_offset1[9:0]),
   .ds_offset2				(ds_offset2[9:0]),
   .ds_offset3				(ds_offset3[9:0]));


niu_dn_ram  dn_ram
  (/*AUTOINST*/
   // Outputs
   .dn_ram_perr				(dn_ram_perr),
   .dn_dout				(dn_dout[`DN_R]),
   .dram_slv_rdata			(dram_slv_rdata[`DN_R]),
   // Inputs
   .clk					(clk),
   .dn_reset				(dn_reset[4:0]),
   .par_chk_dis				(par_chk_dis),
   .chk_bit_data			(chk_bit_data[16:0]),
   .tt_index_4dn			(tt_index_4dn[11:0]),
   .tt_rd_en1				(tt_rd_en1),
   .wb_tt1				(wb_tt1),
   .wb_dn_reg				(wb_dn_reg[`DN_R]),
   .slv_tt_index			(slv_tt_index[11:0]),
   .dn_ram_wen				(dn_ram_wen),
   .dn_ram_ren				(dn_ram_ren),
   .slv_ram_wdata			(slv_ram_wdata[`DN_R]),
   .slv_ram_be				(slv_ram_be[`DN_PR]),
   .ds_offset0				(ds_offset0[9:0]),
   .ds_offset1				(ds_offset1[9:0]),
   .ds_offset2				(ds_offset2[9:0]),
   .ds_offset3				(ds_offset3[9:0]),
   .rsp_ram_wr_en1			(rsp_ram_wr_en1),
   .rsp_ram_mapped_in			(rsp_ram_mapped_in[31:0]),
   .rsp_tt_index2			(rsp_tt_index2[11:0]));

/* --------------- control fifo instantiation ---------------- */  
// cfifo0
niu_zcp_cfifo32KB  niu_zcp_cfifo32KB_port0
  (
   // Outputs
   .zcp_dmc_ack(zcp_dmc_ack0),
   .zcp_dmc_dat(zcp_dmc_dat0[`CFIFO_W_R]),
   .zcp_dmc_dat_err(zcp_dmc_dat_err0),
   .zcp_dmc_ful_pkt(zcp_dmc_ful_pkt0),
   // Inputs
   .clk(clk),
   .reset(c0_reset|reset_cfifo0),
   .wr_en(wr_en0),
   .wr_data(wr_data[`CFIFO_W_R]),
   .dmc_zcp_req(dmc_zcp_req0),
   .double_bit_err(double_bit_err0),
   .single_bit_err(single_bit_err0),
   .last_line_err(last_line_err0),
   .second_line_err(second_line_err0),
   .first_line_err(first_line_err0),
   .last_line(last_line0),
   .second_line(second_line0),
   .first_line(first_line0),
   .ecc_chk_dis(ecc_chk_dis | ecc_chk_bypass0),
   .chk_bit_data(chk_bit_data[15:0]),
   .cfifo_ren(cfifo_ren0),
   .cfifo_slv_rdata(cfifo_slv_rdata0[`CFIFO_W_R]),
   .cfifo_wen(cfifo_wen0),
   .slv_ram_wdata(slv_ram_wdata[`CFIFO_W_R]),
   .slv_ram_addr(slv_ram_addr[10:0])
);

// cfifo1
niu_zcp_cfifo32KB  niu_zcp_cfifo32KB_port1
  (
   // Outputs
   .zcp_dmc_ack(zcp_dmc_ack1),
   .zcp_dmc_dat(zcp_dmc_dat1[`CFIFO_W_R]),
   .zcp_dmc_dat_err(zcp_dmc_dat_err1),
   .zcp_dmc_ful_pkt(zcp_dmc_ful_pkt1),
   // Inputs
   .clk(clk),
   .reset(c1_reset|reset_cfifo1),
   .wr_en(wr_en1),
   .wr_data(wr_data[`CFIFO_W_R]),
   .dmc_zcp_req(dmc_zcp_req1),
   .double_bit_err(double_bit_err1),
   .single_bit_err(single_bit_err1),
   .last_line_err(last_line_err1),
   .second_line_err(second_line_err1),
   .first_line_err(first_line_err1),
   .last_line(last_line1),
   .second_line(second_line1),
   .first_line(first_line1),
   .ecc_chk_dis(ecc_chk_dis | ecc_chk_bypass1),
   .chk_bit_data(chk_bit_data[15:0]),
   .cfifo_ren(cfifo_ren1),
   .cfifo_slv_rdata(cfifo_slv_rdata1[`CFIFO_W_R]),
   .cfifo_wen(cfifo_wen1),
   .slv_ram_wdata(slv_ram_wdata[`CFIFO_W_R]),
   .slv_ram_addr(slv_ram_addr[10:0])
);

// cfifo2
niu_zcp_cfifo16KB  niu_zcp_cfifo16KB_port2
  (
   // Outputs
   .zcp_dmc_ack(zcp_dmc_ack2),
   .zcp_dmc_dat(zcp_dmc_dat2[`CFIFO_W_R]),
   .zcp_dmc_dat_err(zcp_dmc_dat_err2),
   .zcp_dmc_ful_pkt(zcp_dmc_ful_pkt2),
   // Inputs
   .clk(clk),
   .reset(c2_reset|reset_cfifo2),
   .wr_en(wr_en2),
   .wr_data(wr_data[`CFIFO_W_R]),
   .dmc_zcp_req(dmc_zcp_req2),
   .double_bit_err(double_bit_err2),
   .single_bit_err(single_bit_err2),
   .last_line_err(last_line_err2),
   .second_line_err(second_line_err2),
   .first_line_err(first_line_err2),
   .last_line(last_line2),
   .second_line(second_line2),
   .first_line(first_line2),
   .ecc_chk_dis(ecc_chk_dis | ecc_chk_bypass2),
   .chk_bit_data(chk_bit_data[15:0]),
   .cfifo_ren(cfifo_ren2),
   .cfifo_slv_rdata(cfifo_slv_rdata2[`CFIFO_W_R]),
   .cfifo_wen(cfifo_wen2),
   .slv_ram_wdata(slv_ram_wdata[`CFIFO_W_R]),
   .slv_ram_addr(slv_ram_addr[9:0])
);

// cfifo3
niu_zcp_cfifo16KB  niu_zcp_cfifo16KB_port3
  (
   // Outputs
   .zcp_dmc_ack(zcp_dmc_ack3),
   .zcp_dmc_dat(zcp_dmc_dat3[`CFIFO_W_R]),
   .zcp_dmc_dat_err(zcp_dmc_dat_err3),
   .zcp_dmc_ful_pkt(zcp_dmc_ful_pkt3),
   // Inputs
   .clk(clk),
   .reset(c3_reset|reset_cfifo3),
   .wr_en(wr_en3),
   .wr_data(wr_data[`CFIFO_W_R]),
   .dmc_zcp_req(dmc_zcp_req3),
   .double_bit_err(double_bit_err3),
   .single_bit_err(single_bit_err3),
   .last_line_err(last_line_err3),
   .second_line_err(second_line_err3),
   .first_line_err(first_line_err3),
   .last_line(last_line3),
   .second_line(second_line3),
   .first_line(first_line3),
   .ecc_chk_dis(ecc_chk_dis | ecc_chk_bypass3),
   .chk_bit_data(chk_bit_data[15:0]),
   .cfifo_ren(cfifo_ren3),
   .cfifo_slv_rdata(cfifo_slv_rdata3[`CFIFO_W_R]),
   .cfifo_wen(cfifo_wen3),
   .slv_ram_wdata(slv_ram_wdata[`CFIFO_W_R]),
   .slv_ram_addr(slv_ram_addr[9:0])
);


`else // N2 mode

   assign  rdmc_zcp_func_num  =  0;
   assign  page_handle        =  0;
   assign  va_ram_perr        =  0;
   assign  dn_ram_perr        =  0;
   assign  st_ram_perr        =  0;
   assign  zcp_dmc_dat2       =  0;
   assign  zcp_dmc_dat3       =  0;
   assign  zcp_dmc_dat_err2   =  0;
   assign  zcp_dmc_dat_err3   =  0;
   assign  dram_slv_rdata     =  0;
   assign  sram_slv_rdata     =  0;
   assign  vram_slv_rdata     =  0;
   assign  slv_accepted       =  1'b1;
   assign  rspfifo_uncorr_err =  0;
   assign  reqfifo_uncorr_err =  0;  
   assign  rsp_tt_index_err   =  0;
   assign  slv_tt_index_err   =  0;  
   assign  zcp_tt_index_err   =  0;  
   assign  rsp_unload_state   =  0; 
   assign  rsp_load_state     =  0;
   assign  req_unload_state   =  0;  
   assign  req_load_state     =  0;  
   assign  rrfifo_overrun     =  0;
   assign  rrfifo_underrun    =  0;
   assign  cfifo_slv_rdata2   =  0;
   assign  cfifo_slv_rdata3   =  0;
   wire  [6:0] 		    hdr_sram_rvalue_zcp0;
   wire  [1:0] 		    hdr_sram_rid_zcp0;
   wire  [6:0] 		    sram_hdr_read_data_zcp0;
   wire  [6:0] 		    hdr_sram_rvalue_zcp1;
   wire  [1:0] 		    hdr_sram_rid_zcp1;
   wire  [6:0] 		    sram_hdr_read_data_zcp1;
   
// cfifo0
niu_zcp_cfifo8KB niu_zcp_cfifo8KB_port0(
   .clk(clk),
   .iol2clk(iol2clk),
   .reset(c0_reset|reset_cfifo0),
   // from niu_zcp_tt for write to cfifo
   .wr_en(wr_en0),
   .wr_data(wr_data[`CFIFO_W_R]),
   // dmc intf for read from cfifo
   .dmc_zcp_req(dmc_zcp_req0),
   .zcp_dmc_ack(zcp_dmc_ack0),
   .zcp_dmc_dat(zcp_dmc_dat0[`CFIFO_W_R]),
   .zcp_dmc_dat_err(zcp_dmc_dat_err0),
   .zcp_dmc_ful_pkt(zcp_dmc_ful_pkt0),
   // slv intf
   .double_bit_err(double_bit_err0),
   .single_bit_err(single_bit_err0),
   .last_line_err(last_line_err0),
   .second_line_err(second_line_err0),
   .first_line_err(first_line_err0),
   .last_line(last_line0),
   .second_line(second_line0),
   .first_line(first_line0),
   .ecc_chk_dis(ecc_chk_dis | ecc_chk_bypass0),
   .chk_bit_data(chk_bit_data[15:0]),
   .cfifo_ren(cfifo_ren0),
   .cfifo_slv_rdata(cfifo_slv_rdata0[`CFIFO_W_R]),
   .cfifo_wen(cfifo_wen0),
   .slv_ram_wdata(slv_ram_wdata[`CFIFO_W_R]),
   .slv_ram_addr(slv_ram_addr[8:0]),
   // DFT signals
   // memory related
   .tcu_mbist_user_mode(tcu_mbist_user_mode),
   .tcu_aclk(tcu_aclk),
   .tcu_bclk(tcu_bclk),
   .tcu_se_scancollar_in(tcu_se_scancollar_in),
   .tcu_se_scancollar_out(tcu_se_scancollar_out),
   .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
   .scan_in(niu_mb7_cntrl_fifo_zcp_scan_in),   
   .scan_out(niu_mb7_cntrl_fifo_zcp_scan_out), 
   .hdr_sram_rvalue(hdr_sram_rvalue_zcp0),
   .hdr_sram_rid(hdr_sram_rid_zcp0),
   .hdr_sram_wr_en(hdr_sram_wr_en_zcp0),
   .hdr_sram_red_clr(hdr_sram_red_clr_zcp0),
   .sram_hdr_read_data(sram_hdr_read_data_zcp0),
   .mb_dmo_dout(rtx_rxc_zcp0_mb7_dmo_dout[39:0]),
   .l2clk_2x(l2clk_2x),
   // mbist controller related
   .niu_tcu_mbist_fail(niu_tcu_mbist_fail_7),
   .niu_tcu_mbist_done(niu_tcu_mbist_done_7),
   .mb_scan_in(mb7_scan_in),
   .mb_scan_out(mb7_scan_out),
   .tcu_niu_mbist_start(tcu_niu_mbist_start_7), // exception
   .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
   .tcu_scan_en(tcu_scan_en)
);
   
// cfifo1
niu_zcp_cfifo8KB niu_zcp_cfifo8KB_port1(
   .clk(clk),
   .iol2clk(iol2clk),
   .reset(c1_reset|reset_cfifo1),
   // from niu_zcp_tt for write to cfifo
   .wr_en(wr_en1),
   .wr_data(wr_data[`CFIFO_W_R]),
   // dmc intf for read from cfifo
   .dmc_zcp_req(dmc_zcp_req1),
   .zcp_dmc_ack(zcp_dmc_ack1),
   .zcp_dmc_dat(zcp_dmc_dat1[`CFIFO_W_R]),
   .zcp_dmc_dat_err(zcp_dmc_dat_err1),
   .zcp_dmc_ful_pkt(zcp_dmc_ful_pkt1),
   // slv intf
   .double_bit_err(double_bit_err1),
   .single_bit_err(single_bit_err1),
   .last_line_err(last_line_err1),
   .second_line_err(second_line_err1),
   .first_line_err(first_line_err1),
   .last_line(last_line1),
   .second_line(second_line1),
   .first_line(first_line1),
   .ecc_chk_dis(ecc_chk_dis | ecc_chk_bypass1),
   .chk_bit_data(chk_bit_data[15:0]),
   .cfifo_ren(cfifo_ren1),
   .cfifo_slv_rdata(cfifo_slv_rdata1[`CFIFO_W_R]),
   .cfifo_wen(cfifo_wen1),
   .slv_ram_wdata(slv_ram_wdata[`CFIFO_W_R]),
   .slv_ram_addr(slv_ram_addr[8:0]),
   // DFT signals					
   // memory related
   .tcu_mbist_user_mode(tcu_mbist_user_mode),
   .tcu_aclk(tcu_aclk),
   .tcu_bclk(tcu_bclk),
   .tcu_se_scancollar_in(tcu_se_scancollar_in),
   .tcu_se_scancollar_out(tcu_se_scancollar_out),
   .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
   .scan_in(niu_mb8_cntrl_fifo_zcp_scan_in),   
   .scan_out(niu_mb8_cntrl_fifo_zcp_scan_out), 
   .hdr_sram_rvalue(hdr_sram_rvalue_zcp1),
   .hdr_sram_rid(hdr_sram_rid_zcp1),
   .hdr_sram_wr_en(hdr_sram_wr_en_zcp1),
   .hdr_sram_red_clr(hdr_sram_red_clr_zcp1),
   .sram_hdr_read_data(sram_hdr_read_data_zcp1),
   .mb_dmo_dout(rtx_rxc_zcp1_mb7_dmo_dout[39:0]),
   .l2clk_2x(l2clk_2x),
   // mbist controller related
   .niu_tcu_mbist_fail(niu_tcu_mbist_fail_8),
   .niu_tcu_mbist_done(niu_tcu_mbist_done_8),
   .mb_scan_in(mb8_scan_in),
   .mb_scan_out(mb8_scan_out),
   .tcu_niu_mbist_start(tcu_niu_mbist_start_8), // exception
   .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
   .tcu_scan_en(tcu_scan_en)
);


`endif // !ifdef NEPTUNE
   
/////////////////////////////////////////////////////////////////
// common shared modules instantiation section
/////////////////////////////////////////////////////////////////

/* --------------- reset logic ------------------------- */  
zcp_RegDff #(4) reset_reg_l_RegDff(.din({4{reset_l}}),           .clk(clk),.qout(reset_reg_l[3:0]));

always @ (posedge clk)
  inv_reset_reg_l <=  ~reset_reg_l; 
//
zcp_RegDff #(1) reset_RegDff     (.din(    inv_reset_reg_l[0]),  .clk(clk),.qout(reset));
zcp_RegDff #(1) c0_reset_RegDff  (.din(    inv_reset_reg_l[0]),  .clk(clk),.qout(c0_reset));  // cfifo0 local reset
zcp_RegDff #(1) c1_reset_RegDff  (.din(    inv_reset_reg_l[0]),  .clk(clk),.qout(c1_reset));  // cfifo1 local reset
zcp_RegDff #(1) c2_reset_RegDff  (.din(    inv_reset_reg_l[0]),  .clk(clk),.qout(c2_reset));  // cfifo2 local reset
zcp_RegDff #(1) c3_reset_RegDff  (.din(    inv_reset_reg_l[0]),  .clk(clk),.qout(c3_reset));  // cfifo3 local reset
zcp_RegDff #(4) st_reset_RegDff  (.din( {4{inv_reset_reg_l[0]}}),.clk(clk),.qout(st_reset[3:0]));
zcp_RegDff #(5) dn_reset_RegDff  (.din( {5{inv_reset_reg_l[0]}}),.clk(clk),.qout(dn_reset[4:0]));
zcp_RegDff #(6) fflp_reset_RegDff(.din( {6{inv_reset_reg_l[0]}}),.clk(clk),.qout(fflp_reset[5:0]));// niu_zcp_fflp_intf
zcp_RegDff #(26) rsp_reset_RegDff(.din({26{inv_reset_reg_l[1]}}),.clk(clk),.qout(rsp_reset[25:0]));
zcp_RegDff #(11)tt_reset_RegDff  (.din({11{inv_reset_reg_l[1]}}),.clk(clk),.qout(tt_reset[10:0]));  // niu_zcp_tt
zcp_RegDff #(12) req_reset_RegDff(.din({12{inv_reset_reg_l[2]}}),.clk(clk),.qout(req_reset[11:0]));
zcp_RegDff #(22) slv_reset_RegDff(.din({22{inv_reset_reg_l[2]}}),.clk(clk),.qout(slv_reset[21:0])); // niu_zcp_slv 
zcp_RegDff #(37)va_reset_RegDff  (.din({37{inv_reset_reg_l[3]}}),.clk(clk),.qout(va_reset[36:0]));

/* --------------- zcp_fflp_intf instantiation ------------------------- */  
niu_zcp_fflp_intf niu_zcp_fflp_intf
  (/*AUTOINST*/
   // Outputs
   .ififo_ren				(ififo_ren[2:0]),
   .ififo_dout				(ififo_dout[`IFIFO_W_R]),
   .ififo_overrun			(ififo_overrun),
   .ififo_state				(ififo_state[2:0]),
   // Inputs
   .clk					(clk),
   .fflp_reset				(fflp_reset[5:0]),
   .fflp_zcp_wr				(fflp_zcp_wr[4:0]),
   .fflp_zcp_data			(fflp_zcp_data[`IFIFO_W_R]));
   
/* --------------- tt instantiation -------------------------- */  
 niu_zcp_tt niu_zcp_tt (
`ifdef NEPTUNE
   .dmaw_threshold(dmaw_threshold[10:0]),
   // error handling
   .va_ram_perr(va_ram_perr),
   .dn_ram_perr(dn_ram_perr),
   .st_ram_perr(st_ram_perr),
   // tt intf
   .va_dout(va_dout[1023:0]),
   .st_dout(st_dout[`ST_R]),
   .dn_dout(dn_dout[`DN_R]),
   .tt_index_4va(tt_index_4va[11:0]),
   .tt_index_4dn(tt_index_4dn[11:0]),
   .tt_index_4st(tt_index_4st[11:0]),
   // req ptr intf
   .credit_ok(credit_ok),
   .zcp_tt_index_err_lv(zcp_tt_index_err_lv),
   .tt_index(tt_index[11:0]),
   .buf_req(buf_req),
   .wptr_HoQ_reg(wptr_HoQ_reg[15:0]),
   .cross_q_end_reg(cross_q_end_reg),
   .cross_4KB_reg(cross_4KB_reg),
   .ring_size_reg(ring_size_reg[3:0]),
   .ring_base_addr_reg(ring_base_addr_reg[38:0]),
   .reach_buf_end_reg(reach_buf_end_reg),
   .total_num_buf_requested_reg(total_num_buf_requested_reg[5:0]),
   // wb
   .wb_dn_reg(wb_dn_reg[`DN_R]),
   .wb_tt0(wb_tt0),
   .wb_tt1(wb_tt1),
   //
   .tt_rd_en0(tt_rd_en0),
   .tt_rd_en1(tt_rd_en1),
   .tt_rd_en2(tt_rd_en2),
   .tt_rd_en3(tt_rd_en3),
   .tt_active(tt_active),
   .tt_sm_rw(tt_sm_rw),
   // debug
   .tcp_payld_len(tcp_payld_len[15:0]),
   .l2_hdr_len(l2_hdr_len[9:0]),
   .l3_hdr_len(l3_hdr_len[9:0]),
   .header_len(header_len[9:0]),
   .tt_ok_reg7(tt_ok_reg7),
   .buf_req_ok(buf_req_ok),
   // MCP debug
   .TL(TL[`XPAN_TCP_SEQ_SPACE]),
   .S(S[`XPAN_TCP_SEQ_SPACE]),
   .payload_len(payload_len[`PKT_LEN_R]),
   .header_delta(header_delta[`PKT_LEN_R]),
   .UE(UE[`XPAN_TCP_SEQ_SPACE]),
   .TL_bt_UE(TL_bt_UE),
   .TL_eq_UE(TL_eq_UE),
   .qual_ulp_end_fail_reg(qual_ulp_end_fail_reg),
   .running_anchor_seq(running_anchor_seq[`TCP_SEQ_SPACE]),
   .first_byte_buf(first_byte_buf[5:0]),
   .last_byte_buf(last_byte_buf[20:0]),
   .index0(index0[5:0]),
   .index1(index1[5:0]),
   .index2(index2[5:0]),
   .index3(index3[5:0]),
   .win_ok(win_ok),
   .ulp_end_fail(ulp_end_fail),
   .mapped_in_fail(mapped_in_fail),
   .dmaw_threshold_fail(dmaw_threshold_fail),
   .unmap_on_left_oc(unmap_on_left_oc),
   .last_line2(last_line2),
   .second_line2(second_line2),
   .first_line2(first_line2),
   .last_line3(last_line3),
   .second_line3(second_line3),
   .first_line3(first_line3),
`else // N2
`endif
   .last_line0(last_line0),
   .second_line0(second_line0),
   .first_line0(first_line0),
   .last_line1(last_line1),
   .second_line1(second_line1),
   .first_line1(first_line1),
   .clk(clk),
   .reset(tt_reset),
   .kickoff_tt_reg(kickoff_tt_reg),
   .set_tt_program_err(set_tt_program_err),
   .fflp_data(fflp_data[`IFIFO_W_R]),
   // zcp_slv intf
   .tt_en(tt_en),
   .fn(fn[1:0]),
   .handle(handle[19:0]),
   // fflp wr intf
   .ififo_ren(ififo_ren[2:0]),
   .ififo_dout(ififo_dout[`IFIFO_W_R]),
   // rx dmc stuff
   .decode_default_rdc(decode_default_rdc),
   .decode_table_rdc(decode_table_rdc),
   .decode_zc_rdc(decode_zc_rdc),
   .tt_rdc_reg(tt_rdc_reg[7:0]),
   .fflp_rdc(fflp_rdc[7:0]),
   .default_rdc(default_rdc[4:0]),
   .table_rdc(table_rdc[4:0]),
   .zc_rdc(zc_rdc[4:0]),
   .wr_data(wr_data[`CFIFO_W_R]),
   .wr_en0(wr_en0),
   .wr_en1(wr_en1),
   .wr_en2(wr_en2),
   .wr_en3(wr_en3),
   .tt_state(tt_state[3:0])
);
   
/* --------------- pio interface ----------------------------- */  
niu_zcp_slv  niu_zcp_slv 
  (/*AUTOINST*/
   // Outputs
   .zcp_debug_sel			(zcp_debug_sel[7:0]),
   .ecc_chk_bypass0			(ecc_chk_bypass0),
   .double_bit_err0			(double_bit_err0),
   .single_bit_err0			(single_bit_err0),
   .last_line_err0			(last_line_err0),
   .second_line_err0			(second_line_err0),
   .first_line_err0			(first_line_err0),
   .ecc_chk_bypass1			(ecc_chk_bypass1),
   .double_bit_err1			(double_bit_err1),
   .single_bit_err1			(single_bit_err1),
   .last_line_err1			(last_line_err1),
   .second_line_err1			(second_line_err1),
   .first_line_err1			(first_line_err1),
   .ecc_chk_bypass2			(ecc_chk_bypass2),
   .double_bit_err2			(double_bit_err2),
   .single_bit_err2			(single_bit_err2),
   .last_line_err2			(last_line_err2),
   .second_line_err2			(second_line_err2),
   .first_line_err2			(first_line_err2),
   .ecc_chk_bypass3			(ecc_chk_bypass3),
   .double_bit_err3			(double_bit_err3),
   .single_bit_err3			(single_bit_err3),
   .last_line_err3			(last_line_err3),
   .second_line_err3			(second_line_err3),
   .first_line_err3			(first_line_err3),
   .zcp_pio_ack				(zcp_pio_ack),
   .zcp_pio_rdata			(zcp_pio_rdata[63:0]),
   .zcp_pio_err				(zcp_pio_err),
   .zcp_pio_intr			(zcp_pio_intr),
   .handle				(handle[19:0]),
   .fn					(fn[1:0]),
   .default_rdc				(default_rdc[4:0]),
   .table_rdc				(table_rdc[4:0]),
   .zc_rdc				(zc_rdc[4:0]),
   .tt_en				(tt_en),
   .zcp_32bit_mode			(zcp_32bit_mode),
   .req_dis				(req_dis),
   .rsp_dis				(rsp_dis),
   .par_chk_dis				(par_chk_dis),
   .ecc_chk_dis				(ecc_chk_dis),
   .dmaw_threshold			(dmaw_threshold[10:0]),
   .reset_cfifo0			(reset_cfifo0),
   .reset_cfifo1			(reset_cfifo1),
   .reset_cfifo2			(reset_cfifo2),
   .reset_cfifo3			(reset_cfifo3),
   .training_vector			(training_vector[31:0]),
   .slv_request				(slv_request),
   .slv_tt_index			(slv_tt_index[11:0]),
   .slv_ram_addr			(slv_ram_addr[10:0]),
   .slv_ram_wdata			(slv_ram_wdata[`DN_R]),
   .slv_ram_be				(slv_ram_be[16:0]),
   .va_ram_rwen				(va_ram_rwen),
   .va_ram_rwen0			(va_ram_rwen0),
   .va_ram_rwen1			(va_ram_rwen1),
   .va_ram_rwen2			(va_ram_rwen2),
   .va_ram_rwen3			(va_ram_rwen3),
   .va_ram_rwen4			(va_ram_rwen4),
   .va_ram_rwen5			(va_ram_rwen5),
   .va_ram_rwen6			(va_ram_rwen6),
   .va_ram_rwen7			(va_ram_rwen7),
   .va_ram_ren				(va_ram_ren),
   .va_ram_wen				(va_ram_wen),
   .va_ram_ren0				(va_ram_ren0),
   .va_ram_wen0				(va_ram_wen0),
   .va_ram_ren1				(va_ram_ren1),
   .va_ram_wen1				(va_ram_wen1),
   .va_ram_ren2				(va_ram_ren2),
   .va_ram_wen2				(va_ram_wen2),
   .va_ram_ren3				(va_ram_ren3),
   .va_ram_wen3				(va_ram_wen3),
   .va_ram_ren4				(va_ram_ren4),
   .va_ram_wen4				(va_ram_wen4),
   .va_ram_ren5				(va_ram_ren5),
   .va_ram_wen5				(va_ram_wen5),
   .va_ram_ren6				(va_ram_ren6),
   .va_ram_wen6				(va_ram_wen6),
   .va_ram_ren7				(va_ram_ren7),
   .va_ram_wen7				(va_ram_wen7),
   .st_ram_ren				(st_ram_ren),
   .st_ram_wen				(st_ram_wen),
   .dn_ram_ren				(dn_ram_ren),
   .dn_ram_wen				(dn_ram_wen),
   .cfifo_ren0				(cfifo_ren0),
   .cfifo_wen0				(cfifo_wen0),
   .cfifo_ren1				(cfifo_ren1),
   .cfifo_wen1				(cfifo_wen1),
   .cfifo_ren2				(cfifo_ren2),
   .cfifo_wen2				(cfifo_wen2),
   .cfifo_ren3				(cfifo_ren3),
   .cfifo_wen3				(cfifo_wen3),
   .tt_offset0				(tt_offset0[7:0]),
   .tt_index_start0			(tt_index_start0[9:0]),
   .tt_index_end0			(tt_index_end0[9:0]),
   .tt_index_chk0			(tt_index_chk0),
   .tt_offset1				(tt_offset1[7:0]),
   .tt_index_start1			(tt_index_start1[9:0]),
   .tt_index_end1			(tt_index_end1[9:0]),
   .tt_index_chk1			(tt_index_chk1),
   .tt_offset2				(tt_offset2[7:0]),
   .tt_index_start2			(tt_index_start2[9:0]),
   .tt_index_end2			(tt_index_end2[9:0]),
   .tt_index_chk2			(tt_index_chk2),
   .tt_offset3				(tt_offset3[7:0]),
   .tt_index_start3			(tt_index_start3[9:0]),
   .tt_index_end3			(tt_index_end3[9:0]),
   .tt_index_chk3			(tt_index_chk3),
   .ds_offset0				(ds_offset0[9:0]),
   .ds_offset1				(ds_offset1[9:0]),
   .ds_offset2				(ds_offset2[9:0]),
   .ds_offset3				(ds_offset3[9:0]),
   .chk_bit_data			(chk_bit_data[16:0]),
   .ram_access_state			(ram_access_state[2:0]),
   // Inputs
   .clk					(clk),
   .slv_reset				(slv_reset[21:0]),
   .kickoff_tt_reg			(kickoff_tt_reg),
   .ififo_state				(ififo_state[2:0]),
   .tt_state				(tt_state[3:0]),
   .req_load_state			(req_load_state[1:0]),
   .req_unload_state			(req_unload_state[1:0]),
   .rsp_load_state			(rsp_load_state[3:0]),
   .rsp_unload_state			(rsp_unload_state[3:0]),
   .ififo_overrun			(ififo_overrun),
   .set_tt_program_err			(set_tt_program_err),
   .zcp_tt_index_err			(zcp_tt_index_err),
   .slv_tt_index_err			(slv_tt_index_err),
   .rsp_tt_index_err			(rsp_tt_index_err),
   .va_ram_perr				(va_ram_perr),
   .dn_ram_perr				(dn_ram_perr),
   .st_ram_perr				(st_ram_perr),
   .rrfifo_overrun			(rrfifo_overrun),
   .rrfifo_underrun			(rrfifo_underrun),
   .rspfifo_uncorr_err			(rspfifo_uncorr_err),
   .pio_clients_addr			(pio_clients_addr[19:0]),
   .pio_clients_rd			(pio_clients_rd),
   .pio_clients_wdata			(pio_clients_wdata[31:0]),
   .pio_zcp_sel				(pio_zcp_sel),
   .zcp_dmc_dat_err0			(zcp_dmc_dat_err0),
   .zcp_dmc_dat_err1			(zcp_dmc_dat_err1),
   .zcp_dmc_dat_err2			(zcp_dmc_dat_err2),
   .zcp_dmc_dat_err3			(zcp_dmc_dat_err3),
   .decode_default_rdc			(decode_default_rdc),
   .decode_table_rdc			(decode_table_rdc),
   .decode_zc_rdc			(decode_zc_rdc),
   .tt_rdc_reg				(tt_rdc_reg[7:0]),
   .fflp_rdc				(fflp_rdc[7:0]),
   .rdmc_zcp_func_num			(rdmc_zcp_func_num[31:0]),
   .page_handle				(page_handle[`PMS15:0]),
   .slv_accepted			(slv_accepted),
   .vram_slv_rdata			(vram_slv_rdata[1023:0]),
   .sram_slv_rdata			(sram_slv_rdata[`ST_R]),
   .dram_slv_rdata			(dram_slv_rdata[`DN_R]),
   .cfifo_slv_rdata0			(cfifo_slv_rdata0[`CFIFO_W_R]),
   .cfifo_slv_rdata1			(cfifo_slv_rdata1[`CFIFO_W_R]),
   .cfifo_slv_rdata2			(cfifo_slv_rdata2[`CFIFO_W_R]),
   .cfifo_slv_rdata3			(cfifo_slv_rdata3[`CFIFO_W_R]));


niu_zcp_debug niu_zcp_debug (
`ifdef NEPTUNE
/* ----- tt module ----- */
   // error handling
   .va_ram_perr(va_ram_perr),
   .dn_ram_perr(dn_ram_perr),
   .st_ram_perr(st_ram_perr),
   // tt intf
   .tt_index_4va(tt_index_4va[11:0]),
   .tt_index_4dn(tt_index_4dn[11:0]),
   .tt_index_4st(tt_index_4st[11:0]),
   // req ptr intf
   .credit_ok(credit_ok),
   .zcp_tt_index_err_lv(zcp_tt_index_err_lv),
   .tt_index(tt_index[11:0]),
   .buf_req(buf_req),
   .wptr_HoQ_reg(wptr_HoQ_reg[15:0]),
   .cross_q_end_reg(cross_q_end_reg),
   .cross_4KB_reg(cross_4KB_reg),
   .ring_size_reg(ring_size_reg[3:0]),
   .ring_base_addr_reg(ring_base_addr_reg[38:0]),
   .reach_buf_end_reg(reach_buf_end_reg),
   .total_num_buf_requested_reg(total_num_buf_requested_reg[5:0]),
   // wb
   .wb_dn_reg(wb_dn_reg[`DN_R]),
   .wb_tt0(wb_tt0),                         // loj
   //
   .tt_rd_en0(tt_rd_en0),                   // loj
   .tt_active(tt_active),
   // Zero copy specific
   .tcp_payld_len(tcp_payld_len[15:0]),
   .l2_hdr_len(l2_hdr_len[9:0]),
   .l3_hdr_len(l3_hdr_len[9:0]),
   .header_len(header_len[9:0]),
   .tt_ok_reg(tt_ok_reg7),
   .buf_req_ok(buf_req_ok),
   // MCP debug
   .TL(TL[`XPAN_TCP_SEQ_SPACE]),                            // MCP debug
   .S(S[`XPAN_TCP_SEQ_SPACE]),                              // MCP debug
   .payload_len(payload_len[`PKT_LEN_R]),                   // MCP debug
   .header_delta(header_delta[`PKT_LEN_R]),                 // MCP debug
   .UE(UE[`XPAN_TCP_SEQ_SPACE]),                            // MCP debug
   .TL_bt_UE(TL_bt_UE),                                     // MCP debug
   .TL_eq_UE(TL_eq_UE),                                     // MCP debug
   .qual_ulp_end_fail_reg(qual_ulp_end_fail_reg),           // MCP debug
   .running_anchor_seq(running_anchor_seq[`TCP_SEQ_SPACE] ),// MCP debug
   .first_byte_buf(first_byte_buf[5:0]),                    // MCP debug
   .last_byte_buf(last_byte_buf[20:0]),                     // MCP debug
   .index0(index0[5:0]),                                    // MCP debug
   .index1(index1[5:0]),                                    // MCP debug
   .index2(index2[5:0]),                                    // MCP debug
   .index3(index3[5:0]),                                    // MCP debug
   .win_ok(win_ok),                                         // MCP debug
   .ulp_end_fail(ulp_end_fail),                             // MCP debug
   .mapped_in_fail(mapped_in_fail),                         // MCP debug
   .dmaw_threshold_fail(dmaw_threshold_fail),               // MCP debug
   .unmap_on_left_oc(unmap_on_left_oc),                     // MCP debug
   /* ----- req_intf module ----- */
   .latch_rspfifo_dout(latch_rspfifo_dout),
   .zcp_arb1_req(zcp_arb1_req),
   .zcp_arb1_req_cmd(zcp_arb1_req_cmd[7:0]),
   .zcp_arb1_req_address(zcp_arb1_req_address[63:0]),
   .zcp_arb1_req_length(zcp_arb1_req_length[13:0]),
   .zcp_arb1_req_port_num(zcp_arb1_req_port_num[1:0]),
   .zcp_arb1_req_dma_num(zcp_arb1_req_dma_num[4:0]),
   .arb1_zcp_req_accept(arb1_zcp_req_accept),
   /* ----- rsp_intf module ----- */
   .rsp_accepted(rsp_accepted),
   .rsp_request(rsp_request),
   .rsp_ram_wr_en2(rsp_ram_wr_en2),
   .rsp_ram_wr_data(rsp_ram_wr_data[127:0]),
   .rsp_tt_index(rsp_tt_index[11:0]),
   .rsp_ram_mapped_in(rsp_ram_mapped_in[31:0]),
   // req intf
   .rspfifo_ren3(rspfifo_ren3),
   .rspfifo_rp(rspfifo_rp[`VAFIFO_A_PTR]),
   .reqfifo_wp(reqfifo_wp[`VAFIFO_A_PTR]),
   .rrfifo_rd_data(rrfifo_rd_data[`RRFIFO_W_R]),
   // META RESPONSE control info
   .meta_zcp_resp_ready(meta_zcp_resp_ready),                // Resp Command Request
   .meta_zcp_resp_cmd(meta_zcp_resp_cmd[7:0]),               // cmd
   .meta_zcp_resp_cmd_status(meta_zcp_resp_cmd_status[3:0]), // cmd
   .meta_zcp_resp_length(meta_zcp_resp_length[11:0]),        // Packet Length
   .meta_zcp_resp_dma_num(meta_zcp_resp_dma_num[4:0]),       // Channel Number
   .meta_zcp_resp_client(meta_zcp_resp_client),              // bit 0
   .zcp_meta_resp_accept(zcp_meta_resp_accept),              // bitwise client accept
   // META RESPONSE data	  
   .meta_zcp_data(meta_zcp_data[127:0]),                     // Transfer Data
   .meta_zcp_resp_byteenable(meta_zcp_resp_byteenable[15:0]),// First/Last BE
   .meta_zcp_data_status(meta_zcp_data_status[3:0]),         // Transfer Data Status
   .meta_zcp_data_valid(meta_zcp_data_valid),                // Transfer Data Ack
   .meta_zcp_resp_complete(meta_zcp_resp_complete),          // bitwise ZCP_CLIENT[0]
   .meta_zcp_resp_transfer_cmpl(meta_zcp_resp_transfer_cmpl),// bitwise ZCP_CLIENT[0]
   /* ----- va ram module ----- */
   .va_dout(va_dout[127:0]),
   .va_ram_ren0(va_ram_ren0),
   .va_ram_wen0(va_ram_wen0),
   .va_ram_ren1(va_ram_ren1),
   .va_ram_wen1(va_ram_wen1),
   .va_ram_ren2(va_ram_ren2),
   .va_ram_wen2(va_ram_wen2),
   .va_ram_ren3(va_ram_ren3),
   .va_ram_wen3(va_ram_wen3),
   .va_ram_ren4(va_ram_ren4),
   .va_ram_wen4(va_ram_wen4),
   .va_ram_ren5(va_ram_ren5),
   .va_ram_wen5(va_ram_wen5),
   .va_ram_ren6(va_ram_ren6),
   .va_ram_wen6(va_ram_wen6),
   .va_ram_ren7(va_ram_ren7),
   .va_ram_wen7(va_ram_wen7),
   /* ----- dn ram module ----- */
   // tt r/w
   .dn_dout(dn_dout[`DN_R]),
   // slv r/w
   .dn_ram_wen(dn_ram_wen),
   .dn_ram_ren(dn_ram_ren),
   /* ----- st ram module ----- */
   .st_dout(st_dout[`ST_R]),
   .st_ram_wen(st_ram_wen),
   .st_ram_ren(st_ram_ren),
`else  // N2
`endif // !ifdef NEPTUNE
   // shared section
   .kickoff_tt_reg(kickoff_tt_reg),
   .ififo_state(ififo_state[2:0]),
   .tt_state(tt_state[3:0]),
   .req_load_state(req_load_state),
   .req_unload_state(req_unload_state),
   .rsp_load_state(rsp_load_state),
   .rsp_unload_state(rsp_unload_state),
   .ram_access_state(ram_access_state[2:0]),
   // fflp wr intf
   .wr_data(wr_data),
   .wr_en0(wr_en0),
   .wr_en1(wr_en1),
   .wr_en2(wr_en2),
   .wr_en3(wr_en3),
   .default_rdc(default_rdc[4:0]),
   .table_rdc(table_rdc[4:0]),
   .zc_rdc(zc_rdc[4:0]),
   .fflp_data(fflp_data[`IFIFO_W_R]),
   .zcp_debug_sel(zcp_debug_sel[7:0]),
   .training_vector(training_vector[31:0]),
   .clk(clk),
   .reset(reset),
   .zcp_debug_port(zcp_debug_port[31:0])
);
   
/* --------------- spare gates --------------- */
`ifdef NEPTUNE
wire      [3:0] do_nad;
wire      [3:0] do_nor;
wire      [3:0] do_inv;
wire      [3:0] do_mux;
wire      [3:0] do_q;
wire            so;

  zcp_spare_gates zcp_top_spare_gates (
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
                             .clk        (clk),
                             .do_nad     (do_nad[3:0]),
                             .do_nor     (do_nor[3:0]),
                             .do_inv     (do_inv[3:0]),
                             .do_mux     (do_mux[3:0]),
                             .do_q       (do_q[3:0]),
                             .so         (so)
                            );

`else
`endif

   
endmodule // niu_zcp 
