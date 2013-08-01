// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rdmc.v
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
`include "niu_rdmc.h"
module niu_rdmc (
			niu_clk,
			niu_reset_l,
`ifdef NEPTUNE
			pio_client_32b,
`endif
			pio_rdmc_wdata,
                	pio_rdmc_rd,
                	pio_rdmc_sel,
                	pio_rdmc_addr,

			ipp_dmc_ful_pkt0,
                	ipp_dmc_dat_ack0,
			ipp_dmc_dat_err0,
                	ipp_dmc_data0,
                	ipp_dmc_ful_pkt1,
                	ipp_dmc_dat_ack1,
			ipp_dmc_dat_err1,
                	ipp_dmc_data1,

`ifdef NEPTUNE
                	ipp_dmc_ful_pkt2,
                	ipp_dmc_dat_ack2,
			ipp_dmc_dat_err2,
                	ipp_dmc_data2,
                	ipp_dmc_ful_pkt3,
                	ipp_dmc_dat_ack3,
			ipp_dmc_dat_err3,
                	ipp_dmc_data3,
`endif
                	zcp_dmc_ful_pkt0,
                	zcp_dmc_ack0,
                	zcp_dmc_dat0,
			zcp_dmc_dat_err0,
                	zcp_dmc_ful_pkt1,
                	zcp_dmc_ack1,
                	zcp_dmc_dat1,
			zcp_dmc_dat_err1,

`ifdef NEPTUNE
                	zcp_dmc_ful_pkt2,
                	zcp_dmc_ack2,
                	zcp_dmc_dat2,
			zcp_dmc_dat_err2,
                	zcp_dmc_ful_pkt3,
                	zcp_dmc_ack3,
                	zcp_dmc_dat3,
			zcp_dmc_dat_err3,
`endif
			meta0_rdmc_wr_req_accept,
			meta0_rdmc_wr_data_req,

			meta0_rdmc_rcr_req_accept,	//RCR write back
			meta0_rdmc_rcr_data_req,	//RCR write back
			meta0_rdmc_rcr_ack_ready,
			meta0_rdmc_rcr_ack_cmd,
			meta0_rdmc_rcr_ack_cmd_status,
                        meta0_rdmc_rcr_ack_client,
                        meta0_rdmc_rcr_ack_dma_num,

			meta1_rdmc_rbr_req_accept,
                        meta1_rdmc_rbr_req_error,
                        meta1_rdmc_rbr_resp_ready,
                        meta1_rdmc_rbr_resp_cmd,
			meta1_rdmc_rbr_resp_cmd_status,
                        meta1_rdmc_rbr_resp_dma_num,
                        meta1_rdmc_rbr_resp_client,
                        meta1_rdmc_rbr_resp_comp,
                        meta1_rdmc_rbr_resp_trans_comp,
                        meta1_rdmc_rbr_resp_data_valid,
                        meta1_rdmc_rbr_resp_data,
                        meta1_rdmc_rbr_resp_byteenable,
                        meta1_rdmc_rbr_resp_data_status,


			//Outputs
			rdmc_pio_rdata,
                	rdmc_pio_ack,
                	rdmc_pio_err,
			rdmc_pio_port_int,
			rdmc_pio_intr_ldf_a,
			rdmc_pio_intr_ldf_b,

			dmc_ipp_dat_req0,
                	dmc_ipp_dat_req1,
			dmc_zcp_req0,
                        dmc_zcp_req1,
`ifdef NEPTUNE
                	dmc_ipp_dat_req2,
                	dmc_ipp_dat_req3,
                	dmc_zcp_req2,
                	dmc_zcp_req3,

			page_handle,
			rdmc_zcp_func_num,
`endif

                	rdmc_meta0_wr_req,
                	rdmc_meta0_wr_req_cmd,
                	rdmc_meta0_wr_req_address,
                	rdmc_meta0_wr_req_length,
                	rdmc_meta0_wr_req_port_num,
                	rdmc_meta0_wr_req_dma_num,
			rdmc_meta0_wr_req_func_num,

                	rdmc_meta0_wr_data_valid,
                	rdmc_meta0_wr_data,
                	rdmc_meta0_wr_req_byteenable,
                	rdmc_meta0_wr_transfer_comp,
                	rdmc_meta0_wr_status,

			rdmc_meta0_rcr_req,		//RCR write back
                        rdmc_meta0_rcr_req_cmd,		//RCR write back
                        rdmc_meta0_rcr_req_address,	//RCR write back
                        rdmc_meta0_rcr_req_length,	//RCR write back
                        rdmc_meta0_rcr_req_port_num,	//RCR write back
                        rdmc_meta0_rcr_req_dma_num,	//RCR write back
			rdmc_meta0_rcr_req_func_num,

                        rdmc_meta0_rcr_data_valid,	//RCR write back
                        rdmc_meta0_rcr_data,		//RCR write back
                        rdmc_meta0_rcr_req_byteenable,	//RCR write back
                        rdmc_meta0_rcr_transfer_comp,	//RCR write back
                        rdmc_meta0_rcr_status,		//RCR write back
			rdmc_meta0_rcr_ack_accept,

			rdmc_meta1_rbr_req,
                        rdmc_meta1_rbr_req_cmd,
                        rdmc_meta1_rbr_req_address,
                        rdmc_meta1_rbr_req_length,
                        rdmc_meta1_rbr_req_dma_num,
			rdmc_meta1_rbr_req_port_num,
			rdmc_meta1_rbr_req_func_num,
                        rdmc_meta1_rbr_resp_accept,


`ifdef NEPTUNE
`else                    
			tcu_aclk,
                        tcu_bclk,
			tcu_scan_en,
                        tcu_se_scancollar_in,
                        tcu_se_scancollar_out,
                        tcu_mbist_bisi_en,
			tcu_array_wr_inhibit,
			tcu_mbist_user_mode,
                        l2clk_2x,
			iol2clk,
			hdr_sram_rvalue_rdmc0,
                        hdr_sram_rid_rdmc0,
                        hdr_sram_wr_en_rdmc0,
                        hdr_sram_red_clr_rdmc0,
                        sram_hdr_read_data_rdmc0,

                        hdr_sram_rvalue_rdmc1,
                        hdr_sram_rid_rdmc1,
                        hdr_sram_wr_en_rdmc1,
                        hdr_sram_red_clr_rdmc1,
                        sram_hdr_read_data_rdmc1,

                        tcu_rdp_rdmc_mbist_start,
                        rdp_rdmc_tcu_mbist_fail,
                        rdp_rdmc_tcu_mbist_done,
                        rdp_rdmc_mbist_scan_in,
                        rdp_rdmc_mbist_scan_out,
			rdp_tcu_dmo_data_out,

`endif

			rdmc_debug_port

			);

input           	niu_clk;
input           	niu_reset_l;

`ifdef NEPTUNE
input			pio_client_32b;
`endif

input[63:0]     	pio_rdmc_wdata;
input           	pio_rdmc_rd;
input           	pio_rdmc_sel;
input[19:0]     	pio_rdmc_addr;

input           	ipp_dmc_ful_pkt0;
input           	ipp_dmc_dat_ack0;
input			ipp_dmc_dat_err0;
input[129:0]    	ipp_dmc_data0;
input           	ipp_dmc_ful_pkt1;
input           	ipp_dmc_dat_ack1;
input			ipp_dmc_dat_err1;
input[129:0]    	ipp_dmc_data1;

`ifdef NEPTUNE
input           	ipp_dmc_ful_pkt2;
input           	ipp_dmc_dat_ack2;
input			ipp_dmc_dat_err2;
input[129:0]    	ipp_dmc_data2;
input           	ipp_dmc_ful_pkt3;
input           	ipp_dmc_dat_ack3;
input			ipp_dmc_dat_err3;
input[129:0]    	ipp_dmc_data3;
`endif

input           	zcp_dmc_ful_pkt0;
input           	zcp_dmc_ack0;
input[129:0]    	zcp_dmc_dat0;
input			zcp_dmc_dat_err0;
input           	zcp_dmc_ful_pkt1;
input           	zcp_dmc_ack1;
input[129:0]    	zcp_dmc_dat1;
input			zcp_dmc_dat_err1;

`ifdef NEPTUNE
input           	zcp_dmc_ful_pkt2;
input           	zcp_dmc_ack2;
input[129:0]    	zcp_dmc_dat2;
input			zcp_dmc_dat_err2;
input           	zcp_dmc_ful_pkt3;
input           	zcp_dmc_ack3;
input[129:0]    	zcp_dmc_dat3;
input			zcp_dmc_dat_err3;
`endif

input           	meta0_rdmc_wr_req_accept;
input           	meta0_rdmc_wr_data_req;

input                   meta0_rdmc_rcr_req_accept;
input                   meta0_rdmc_rcr_data_req;
input			meta0_rdmc_rcr_ack_ready;
input[7:0]		meta0_rdmc_rcr_ack_cmd;
input[3:0]		meta0_rdmc_rcr_ack_cmd_status;
input			meta0_rdmc_rcr_ack_client;
input[4:0]		meta0_rdmc_rcr_ack_dma_num;

input                   meta1_rdmc_rbr_req_accept;
input                   meta1_rdmc_rbr_req_error;
input                   meta1_rdmc_rbr_resp_ready;
input[7:0]              meta1_rdmc_rbr_resp_cmd;
input[3:0]		meta1_rdmc_rbr_resp_cmd_status;
input[4:0]              meta1_rdmc_rbr_resp_dma_num;
input                   meta1_rdmc_rbr_resp_client;
input                   meta1_rdmc_rbr_resp_comp;
input                   meta1_rdmc_rbr_resp_trans_comp;
input                   meta1_rdmc_rbr_resp_data_valid;
input[127:0]            meta1_rdmc_rbr_resp_data;
input[15:0]             meta1_rdmc_rbr_resp_byteenable;
input[3:0]              meta1_rdmc_rbr_resp_data_status;

output[63:0]    	rdmc_pio_rdata;
output          	rdmc_pio_ack;
output          	rdmc_pio_err;
output			rdmc_pio_port_int;
output[31:0]		rdmc_pio_intr_ldf_a;
output[31:0]		rdmc_pio_intr_ldf_b;

output            	dmc_ipp_dat_req0;
output            	dmc_ipp_dat_req1;
output                  dmc_zcp_req0;
output                  dmc_zcp_req1;

`ifdef NEPTUNE
output            	dmc_ipp_dat_req2;
output            	dmc_ipp_dat_req3;
output            	dmc_zcp_req2;
output            	dmc_zcp_req3;

output[319:0]		page_handle;
output[31:0]		rdmc_zcp_func_num;

`endif

output          	rdmc_meta0_wr_req;
output[7:0]     	rdmc_meta0_wr_req_cmd;
output[63:0]    	rdmc_meta0_wr_req_address;
output[13:0]    	rdmc_meta0_wr_req_length;
output[1:0]     	rdmc_meta0_wr_req_port_num;
output[4:0]     	rdmc_meta0_wr_req_dma_num;
output[1:0]		rdmc_meta0_wr_req_func_num;
output          	rdmc_meta0_wr_data_valid;
output[127:0]   	rdmc_meta0_wr_data;
output[15:0]    	rdmc_meta0_wr_req_byteenable;
output          	rdmc_meta0_wr_transfer_comp;
output[3:0]     	rdmc_meta0_wr_status;

output                  rdmc_meta0_rcr_req;
output[7:0]             rdmc_meta0_rcr_req_cmd;
output[63:0]            rdmc_meta0_rcr_req_address;
output[13:0]            rdmc_meta0_rcr_req_length;
output[1:0]             rdmc_meta0_rcr_req_port_num;
output[4:0]             rdmc_meta0_rcr_req_dma_num;
output[1:0]		rdmc_meta0_rcr_req_func_num;
output                  rdmc_meta0_rcr_data_valid;
output[127:0]           rdmc_meta0_rcr_data;
output[15:0]            rdmc_meta0_rcr_req_byteenable;
output                  rdmc_meta0_rcr_transfer_comp;
output[3:0]             rdmc_meta0_rcr_status;

output                  rdmc_meta1_rbr_req;
output[7:0]             rdmc_meta1_rbr_req_cmd;
output[63:0]            rdmc_meta1_rbr_req_address;
output[13:0]            rdmc_meta1_rbr_req_length;
output[4:0]             rdmc_meta1_rbr_req_dma_num;
output[1:0]		rdmc_meta1_rbr_req_port_num;
output[1:0]		rdmc_meta1_rbr_req_func_num;
output                  rdmc_meta1_rbr_resp_accept;
output			rdmc_meta0_rcr_ack_accept;
output[31:0]		rdmc_debug_port;

wire[147:0]		cache_rd_data;
wire[147:0]		shadw_rd_data;


`ifdef NEPTUNE
`else

input                   tcu_aclk;
input                   tcu_bclk;
input			tcu_scan_en;
input                   tcu_se_scancollar_in;
input                   tcu_se_scancollar_out;
input                   tcu_mbist_bisi_en;
input			tcu_array_wr_inhibit;
input			tcu_mbist_user_mode;
input                   l2clk_2x;
input			iol2clk;

input                   tcu_rdp_rdmc_mbist_start;
output                  rdp_rdmc_tcu_mbist_fail;
output                  rdp_rdmc_tcu_mbist_done;

input                   rdp_rdmc_mbist_scan_in;
output                  rdp_rdmc_mbist_scan_out;
output[39:0]		rdp_tcu_dmo_data_out;

input[6:0]         	hdr_sram_rvalue_rdmc0;    // <-- 512x152,256x152 1 bit less, i.e., [5:0]
input[1:0]         	hdr_sram_rid_rdmc0;       // <-- 512x152,256x152 1 bit less, i.e., [1:0]
input                   hdr_sram_wr_en_rdmc0;
input                   hdr_sram_red_clr_rdmc0;
output[6:0]         	sram_hdr_read_data_rdmc0; // <-- 512x152,256x152 1 bit less, i.e., [5:0]

input[6:0]         	hdr_sram_rvalue_rdmc1;    // <-- 512x152,256x152 1 bit less, i.e., [5:0]
input[1:0]         	hdr_sram_rid_rdmc1;       // <-- 512x152,256x152 1 bit less, i.e., [1:0]
input                   hdr_sram_wr_en_rdmc1;
input                   hdr_sram_red_clr_rdmc1;
output[6:0]         	sram_hdr_read_data_rdmc1; // <-- 512x152,256x152 1 bit less, i.e., [5:0]

wire[6:0]		sram_hdr_read_data_rdmc0;
wire[6:0]		sram_hdr_read_data_rdmc1;

//wire                  rdp_rdmc_mbist_scan_out_int0;
//wire                  rdp_rdmc_mbist_scan_out_int1;
wire[39:0]		rdp_tcu_dmo_data_out;

wire[147:0]             niu_mb4_rdmc_desc_data_out = cache_rd_data;
wire[147:0]             niu_mb4_rdmc_comp_data_out = shadw_rd_data;

wire			niu_mb4_run;
wire			niu_mb4_desc_rd_en;
wire			niu_mb4_desc_wr_en;
wire			niu_mb4_comp_rd_en;
wire			niu_mb4_comp_wr_en;
wire[7:0]		niu_mb4_wdata;
wire[7:0]		niu_mb4_addr;
wire[147:0]             niu_mb4_wdata_full      = {niu_mb4_wdata[3:0], niu_mb4_wdata, niu_mb4_wdata,
                                                   niu_mb4_wdata, niu_mb4_wdata, niu_mb4_wdata, niu_mb4_wdata,
                                                   niu_mb4_wdata, niu_mb4_wdata, niu_mb4_wdata, niu_mb4_wdata,
                                                   niu_mb4_wdata, niu_mb4_wdata, niu_mb4_wdata, niu_mb4_wdata,
                                                   niu_mb4_wdata, niu_mb4_wdata, niu_mb4_wdata, niu_mb4_wdata};

`endif


wire		reset;

wire		pio_32b_mode;
wire          	pio_wen;
wire[19:0]    	pio_addr;
wire            pio_wen_a;
wire[19:0]      pio_addr_a;
wire            pio_wen_b;
wire[19:0]      pio_addr_b;
wire            pio_wen_c;
wire[19:0]      pio_addr_c;

wire[63:0]    	pio_wdata;
wire		rx_addr_32b_mode;
wire		wred_enable;
wire[15:0]	random_num;
wire[15:0]	clk_div_value;
wire[15:0]	pt_drr_wt0_reg;
wire[15:0]	pt_drr_wt1_reg;
wire[15:0]	pt_drr_wt2_reg;
wire[15:0]	pt_drr_wt3_reg;

wire		muxed_cache_rd_strobe;
wire		muxed_cache_wr_strobe;
wire[7:0]	muxed_cache_rd_addr;
wire[7:0]	muxed_cache_wr_addr;
wire[147:0]	muxed_cache_wr_data;
wire            muxed_shadw_rd_strobe;
wire            muxed_shadw_wr_strobe;
wire[7:0]       muxed_shadw_rd_addr;
wire[7:0]       muxed_shadw_wr_addr;
wire[147:0]     muxed_shadw_wr_data;
wire		muxed_cache_rd_strobe_r;
wire		muxed_shadw_rd_strobe_r;
wire		cache_parity_err;
wire		shadw_parity_err;

wire[3:0]	port_err_status;
wire[4:0]     	muxed_port_rdc_num;
wire[31:0]      rdmc_debug_port;
wire          	rdmc_pio_ack;
wire          	rdmc_pio_err;
wire[63:0]    	rdmc_pio_rdata;

wire[3:0]	port_gnt;
wire[13:0]    	muxed_pkt_len;
wire[4:0]     	muxed_rdc_num_r;
wire		muxed_drop_pkt_r;
wire		muxed_s_event_r;
wire		stage1_en_r;
wire          	sel_buf_en;
wire          	pkt_req_cnt_e_done_mod;
wire          	pkt_buf_done;
wire		is_hdr_wr_data;
wire		is_jmb1_wr_data;
wire		wr_last_pkt_data;
wire		update_rcr_shadw;
wire[63:0]    	rcr_wrbk_data;
wire		muxed_data_err_r2;
wire[4:0]	rdmc_wr_data_dma_num;

wire          	dmc_ipp_dat_req0;
wire          	dmc_ipp_dat_req1;
wire          	dmc_ipp_dat_req2;
wire          	dmc_ipp_dat_req3;
wire          	dmc_zcp_req0;
wire          	dmc_zcp_req1;
wire          	dmc_zcp_req2;
wire          	dmc_zcp_req3;
wire          	rdmc_meta0_wr_req;
wire[7:0]     	rdmc_meta0_wr_req_cmd;
wire[63:0]    	rdmc_meta0_wr_req_address;
wire[13:0]    	rdmc_meta0_wr_req_length;
wire[1:0]     	rdmc_meta0_wr_req_port_num;
wire[4:0]     	rdmc_meta0_wr_req_dma_num;
wire[1:0]	rdmc_meta0_wr_req_func_num;
wire          	rdmc_meta0_wr_data_valid;
wire[127:0]   	rdmc_meta0_wr_data;
wire[15:0]    	rdmc_meta0_wr_req_byteenable;
wire          	rdmc_meta0_wr_transfer_comp;
wire		rdmc_meta0_wr_transfer_comp_int;
wire[3:0]     	rdmc_meta0_wr_status;

wire[8:0]	port_err_event;
wire            ipp_dat_req0_data;
wire            ipp_dat_req1_data;
wire            ipp_dat_req2_data;
wire            ipp_dat_req3_data;
wire[31:0]	wr_debug_data;

wire            rdmc_meta1_rbr_req;
wire[7:0]       rdmc_meta1_rbr_req_cmd;
wire[63:0]      rdmc_meta1_rbr_req_address;
wire[13:0]      rdmc_meta1_rbr_req_length;
wire[4:0]       rdmc_meta1_rbr_req_dma_num;
wire[1:0]	rdmc_meta1_rbr_req_port_num;
wire[1:0]	rdmc_meta1_rbr_req_func_num;
wire            rdmc_meta1_rbr_resp_accept;
wire[15:0]      fetch_desp_gnt;
wire            resp_data_in_process;
wire            rdmc_resp_rdy_valid;
wire		rdmc_req_err;
wire[4:0]	rdmc_resp_cmd;
wire[3:0]	rdmc_resp_cmd_status;
wire[4:0]       rdmc_resp_dma_num;
wire            rdmc_resp_data_valid;
wire[15:0]      rdmc_resp_byteenable;
wire            rdmc_resp_comp;
wire            rdmc_resp_trans_comp;
wire[3:0]	rdmc_resp_data_status;
wire[147:0]     cache_wr_data;

wire          	cache_wr_strobe;
wire[7:0]     	cache_wr_addr;
wire          	cache_rd_strobe;
wire[7:0]     	cache_rd_addr;
wire[15:0]    	cache_buf_rd_gnt;
wire[147:0]	cache_rd_data_reg;
wire[131:0]   	cache_buf_rd_data = cache_rd_data_reg[131:0];

wire		data_err_event;
wire          	shadw_wr_strobe;
wire[7:0]     	shadw_wr_addr;
wire[147:0]   	shadw_wr_data;
wire[7:0]     	shadw_rd_addr;

wire[15:0]      rcr_wrbk_gnt;
wire            rcr_wrbk_done;
wire[3:0]       rcr_wrbk_pkt_num;
wire		rdmc_rcr_req_accept;
wire            rdmc_rcr_ack_valid;
wire		rdmc_rcr_ack_err;
wire[4:0]       rdmc_rcr_ack_dma_num;
wire            shadw_rd_strobe;
wire[147:0]	shadw_rd_data_reg;
wire            rdmc_meta0_rcr_req;
wire[7:0]       rdmc_meta0_rcr_req_cmd;
wire[63:0]      rdmc_meta0_rcr_req_address;
wire[13:0]      rdmc_meta0_rcr_req_length;
wire[1:0]       rdmc_meta0_rcr_req_port_num;
wire[4:0]       rdmc_meta0_rcr_req_dma_num;
wire[1:0]	rdmc_meta0_rcr_req_func_num;

wire            rdmc_meta0_rcr_data_valid;
wire[127:0]     rdmc_meta0_rcr_data;
wire[15:0]      rdmc_meta0_rcr_req_byteenable;
wire            rdmc_meta0_rcr_transfer_comp;
wire[3:0]       rdmc_meta0_rcr_status;
wire            rdmc_meta0_rcr_ack_accept;


/**************************************/
/**************************************/
wire          fetch_desp_req0;
wire[63:0]    fetch_desp_addr0;
wire[4:0]     fetch_desp_numb0;
wire          rdmc_resp_accept_sm0;
wire          fetch_desp_resp_vld0;
wire          cache_read_req0;
wire[7:0]     cache_rd_ptr0;
wire[7:0]     cache_wr_ptr0;
wire          full_header0;
wire          pkt_buf_gnt0;
wire[63:0]    pkt_buf_addr0;

wire          shadw_wr_en0;
wire          shadw_wr_even0;
wire[7:0]     shadw_wr_ptr0;
wire[7:0]     shadw_rd_ptr0;
wire[168:0]   mailbox_data0;
wire	      ldf_a0;
wire	      ldf_b0;
wire          rcr_wrbk_sched0;
wire          rcr_wrbk_req0;
wire[63:0]    rcr_wrbk_addr0;
wire[3:0]     rcr_wrbk_numb0;
wire          rcr_wrbk_data_type0;
wire          rcr_ack_accept0;

wire          fetch_desp_req1;
wire[63:0]    fetch_desp_addr1;
wire[4:0]     fetch_desp_numb1;
wire          rdmc_resp_accept_sm1;
wire          fetch_desp_resp_vld1;
wire          cache_read_req1;
wire[7:0]     cache_rd_ptr1;
wire[7:0]     cache_wr_ptr1;
wire          full_header1;
wire          pkt_buf_gnt1;
wire[63:0]    pkt_buf_addr1;

wire          shadw_wr_en1;
wire          shadw_wr_even1;
wire[7:0]     shadw_wr_ptr1;
wire[7:0]     shadw_rd_ptr1;
wire[168:0]   mailbox_data1;
wire          ldf_a1;
wire          ldf_b1;
wire          rcr_wrbk_sched1;
wire          rcr_wrbk_req1;
wire[63:0]    rcr_wrbk_addr1;
wire[3:0]     rcr_wrbk_numb1;
wire          rcr_wrbk_data_type1;
wire          rcr_ack_accept1;

wire          fetch_desp_req2;
wire[63:0]    fetch_desp_addr2;
wire[4:0]     fetch_desp_numb2;
wire          rdmc_resp_accept_sm2;
wire          fetch_desp_resp_vld2;
wire          cache_read_req2;
wire[7:0]     cache_rd_ptr2;
wire[7:0]     cache_wr_ptr2;
wire          full_header2;
wire          pkt_buf_gnt2;
wire[63:0]    pkt_buf_addr2;

wire          shadw_wr_en2;
wire          shadw_wr_even2;
wire[7:0]     shadw_wr_ptr2;
wire[7:0]     shadw_rd_ptr2;
wire[168:0]   mailbox_data2;
wire          ldf_a2;
wire          ldf_b2;
wire          rcr_wrbk_sched2;
wire          rcr_wrbk_req2;
wire[63:0]    rcr_wrbk_addr2;
wire[3:0]     rcr_wrbk_numb2;
wire          rcr_wrbk_data_type2;
wire          rcr_ack_accept2;

wire          fetch_desp_req3;
wire[63:0]    fetch_desp_addr3;
wire[4:0]     fetch_desp_numb3;
wire          rdmc_resp_accept_sm3;
wire          fetch_desp_resp_vld3;
wire          cache_read_req3;
wire[7:0]     cache_rd_ptr3;
wire[7:0]     cache_wr_ptr3;
wire          full_header3;
wire          pkt_buf_gnt3;
wire[63:0]    pkt_buf_addr3;

wire          shadw_wr_en3;
wire          shadw_wr_even3;
wire[7:0]     shadw_wr_ptr3;
wire[7:0]     shadw_rd_ptr3;
wire[168:0]   mailbox_data3;
wire          ldf_a3;
wire          ldf_b3;
wire          rcr_wrbk_sched3;
wire          rcr_wrbk_req3;
wire[63:0]    rcr_wrbk_addr3;
wire[3:0]     rcr_wrbk_numb3;
wire          rcr_wrbk_data_type3;
wire          rcr_ack_accept3;

wire          fetch_desp_req4;
wire[63:0]    fetch_desp_addr4;
wire[4:0]     fetch_desp_numb4;
wire          rdmc_resp_accept_sm4;
wire          fetch_desp_resp_vld4;
wire          cache_read_req4;
wire[7:0]     cache_rd_ptr4;
wire[7:0]     cache_wr_ptr4;
wire          full_header4;
wire          pkt_buf_gnt4;
wire[63:0]    pkt_buf_addr4;

wire          shadw_wr_en4;
wire          shadw_wr_even4;
wire[7:0]     shadw_wr_ptr4;
wire[7:0]     shadw_rd_ptr4;
wire[168:0]   mailbox_data4;
wire          ldf_a4;
wire          ldf_b4;
wire          rcr_wrbk_sched4;
wire          rcr_wrbk_req4;
wire[63:0]    rcr_wrbk_addr4;
wire[3:0]     rcr_wrbk_numb4;
wire          rcr_wrbk_data_type4;
wire          rcr_ack_accept4;

wire          fetch_desp_req5;
wire[63:0]    fetch_desp_addr5;
wire[4:0]     fetch_desp_numb5;
wire          rdmc_resp_accept_sm5;
wire          fetch_desp_resp_vld5;
wire          cache_read_req5;
wire[7:0]     cache_rd_ptr5;
wire[7:0]     cache_wr_ptr5;
wire          full_header5;
wire          pkt_buf_gnt5;
wire[63:0]    pkt_buf_addr5;

wire          shadw_wr_en5;
wire          shadw_wr_even5;
wire[7:0]     shadw_wr_ptr5;
wire[7:0]     shadw_rd_ptr5;
wire[168:0]   mailbox_data5;
wire          ldf_a5;
wire          ldf_b5;
wire          rcr_wrbk_sched5;
wire          rcr_wrbk_req5;
wire[63:0]    rcr_wrbk_addr5;
wire[3:0]     rcr_wrbk_numb5;
wire          rcr_wrbk_data_type5;
wire          rcr_ack_accept5;

wire          fetch_desp_req6;
wire[63:0]    fetch_desp_addr6;
wire[4:0]     fetch_desp_numb6;
wire          rdmc_resp_accept_sm6;
wire          fetch_desp_resp_vld6;
wire          cache_read_req6;
wire[7:0]     cache_rd_ptr6;
wire[7:0]     cache_wr_ptr6;
wire          full_header6;
wire          pkt_buf_gnt6;
wire[63:0]    pkt_buf_addr6;

wire          shadw_wr_en6;
wire          shadw_wr_even6;
wire[7:0]     shadw_wr_ptr6;
wire[7:0]     shadw_rd_ptr6;
wire[168:0]   mailbox_data6;
wire          ldf_a6;
wire          ldf_b6;
wire          rcr_wrbk_sched6;
wire          rcr_wrbk_req6;
wire[63:0]    rcr_wrbk_addr6;
wire[3:0]     rcr_wrbk_numb6;
wire          rcr_wrbk_data_type6;
wire          rcr_ack_accept6;

wire          fetch_desp_req7;
wire[63:0]    fetch_desp_addr7;
wire[4:0]     fetch_desp_numb7;
wire          rdmc_resp_accept_sm7;
wire          fetch_desp_resp_vld7;
wire          cache_read_req7;
wire[7:0]     cache_rd_ptr7;
wire[7:0]     cache_wr_ptr7;
wire          full_header7;
wire          pkt_buf_gnt7;
wire[63:0]    pkt_buf_addr7;

wire          shadw_wr_en7;
wire          shadw_wr_even7;
wire[7:0]     shadw_wr_ptr7;
wire[7:0]     shadw_rd_ptr7;
wire[168:0]   mailbox_data7;
wire          ldf_a7;
wire          ldf_b7;
wire          rcr_wrbk_sched7;
wire          rcr_wrbk_req7;
wire[63:0]    rcr_wrbk_addr7;
wire[3:0]     rcr_wrbk_numb7;
wire          rcr_wrbk_data_type7;
wire          rcr_ack_accept7;

wire          fetch_desp_req8;
wire[63:0]    fetch_desp_addr8;
wire[4:0]     fetch_desp_numb8;
wire          rdmc_resp_accept_sm8;
wire          fetch_desp_resp_vld8;
wire          cache_read_req8;
wire[7:0]     cache_rd_ptr8;
wire[7:0]     cache_wr_ptr8;
wire          full_header8;
wire          pkt_buf_gnt8;
wire[63:0]    pkt_buf_addr8;

wire          shadw_wr_en8;
wire          shadw_wr_even8;
wire[7:0]     shadw_wr_ptr8;
wire[7:0]     shadw_rd_ptr8;
wire[168:0]   mailbox_data8;
wire          ldf_a8;
wire          ldf_b8;
wire          rcr_wrbk_sched8;
wire          rcr_wrbk_req8;
wire[63:0]    rcr_wrbk_addr8;
wire[3:0]     rcr_wrbk_numb8;
wire          rcr_wrbk_data_type8;
wire          rcr_ack_accept8;

wire          fetch_desp_req9;
wire[63:0]    fetch_desp_addr9;
wire[4:0]     fetch_desp_numb9;
wire          rdmc_resp_accept_sm9;
wire          fetch_desp_resp_vld9;
wire          cache_read_req9;
wire[7:0]     cache_rd_ptr9;
wire[7:0]     cache_wr_ptr9;
wire          full_header9;
wire          pkt_buf_gnt9;
wire[63:0]    pkt_buf_addr9;

wire          shadw_wr_en9;
wire          shadw_wr_even9;
wire[7:0]     shadw_wr_ptr9;
wire[7:0]     shadw_rd_ptr9;
wire[168:0]   mailbox_data9;
wire          ldf_a9;
wire          ldf_b9;
wire          rcr_wrbk_sched9;
wire          rcr_wrbk_req9;
wire[63:0]    rcr_wrbk_addr9;
wire[3:0]     rcr_wrbk_numb9;
wire          rcr_wrbk_data_type9;
wire          rcr_ack_accept9;

wire          fetch_desp_req10;
wire[63:0]    fetch_desp_addr10;
wire[4:0]     fetch_desp_numb10;
wire          rdmc_resp_accept_sm10;
wire          fetch_desp_resp_vld10;
wire          cache_read_req10;
wire[7:0]     cache_rd_ptr10;
wire[7:0]     cache_wr_ptr10;
wire          full_header10;
wire          pkt_buf_gnt10;
wire[63:0]    pkt_buf_addr10;

wire          shadw_wr_en10;
wire          shadw_wr_even10;
wire[7:0]     shadw_wr_ptr10;
wire[7:0]     shadw_rd_ptr10;
wire[168:0]   mailbox_data10;
wire          ldf_a10;
wire          ldf_b10;
wire          rcr_wrbk_sched10;
wire          rcr_wrbk_req10;
wire[63:0]    rcr_wrbk_addr10;
wire[3:0]     rcr_wrbk_numb10;
wire          rcr_wrbk_data_type10;
wire          rcr_ack_accept10;

wire          fetch_desp_req11;
wire[63:0]    fetch_desp_addr11;
wire[4:0]     fetch_desp_numb11;
wire          rdmc_resp_accept_sm11;
wire          fetch_desp_resp_vld11;
wire          cache_read_req11;
wire[7:0]     cache_rd_ptr11;
wire[7:0]     cache_wr_ptr11;
wire          full_header11;
wire          pkt_buf_gnt11;
wire[63:0]    pkt_buf_addr11;

wire          shadw_wr_en11;
wire          shadw_wr_even11;
wire[7:0]     shadw_wr_ptr11;
wire[7:0]     shadw_rd_ptr11;
wire[168:0]   mailbox_data11;
wire          ldf_a11;
wire          ldf_b11;
wire          rcr_wrbk_sched11;
wire          rcr_wrbk_req11;
wire[63:0]    rcr_wrbk_addr11;
wire[3:0]     rcr_wrbk_numb11;
wire          rcr_wrbk_data_type11;
wire          rcr_ack_accept11;

wire          fetch_desp_req12;
wire[63:0]    fetch_desp_addr12;
wire[4:0]     fetch_desp_numb12;
wire          rdmc_resp_accept_sm12;
wire          fetch_desp_resp_vld12;
wire          cache_read_req12;
wire[7:0]     cache_rd_ptr12;
wire[7:0]     cache_wr_ptr12;
wire          full_header12;
wire          pkt_buf_gnt12;
wire[63:0]    pkt_buf_addr12;

wire          shadw_wr_en12;
wire          shadw_wr_even12;
wire[7:0]     shadw_wr_ptr12;
wire[7:0]     shadw_rd_ptr12;
wire[168:0]   mailbox_data12;
wire          ldf_a12;
wire          ldf_b12;
wire          rcr_wrbk_sched12;
wire          rcr_wrbk_req12;
wire[63:0]    rcr_wrbk_addr12;
wire[3:0]     rcr_wrbk_numb12;
wire          rcr_wrbk_data_type12;
wire          rcr_ack_accept12;

wire          fetch_desp_req13;
wire[63:0]    fetch_desp_addr13;
wire[4:0]     fetch_desp_numb13;
wire          rdmc_resp_accept_sm13;
wire          fetch_desp_resp_vld13;
wire          cache_read_req13;
wire[7:0]     cache_rd_ptr13;
wire[7:0]     cache_wr_ptr13;
wire          full_header13;
wire          pkt_buf_gnt13;
wire[63:0]    pkt_buf_addr13;

wire          shadw_wr_en13;
wire          shadw_wr_even13;
wire[7:0]     shadw_wr_ptr13;
wire[7:0]     shadw_rd_ptr13;
wire[168:0]   mailbox_data13;
wire          ldf_a13;
wire          ldf_b13;
wire          rcr_wrbk_sched13;
wire          rcr_wrbk_req13;
wire[63:0]    rcr_wrbk_addr13;
wire[3:0]     rcr_wrbk_numb13;
wire          rcr_wrbk_data_type13;
wire          rcr_ack_accept13;

wire          fetch_desp_req14;
wire[63:0]    fetch_desp_addr14;
wire[4:0]     fetch_desp_numb14;
wire          rdmc_resp_accept_sm14;
wire          fetch_desp_resp_vld14;
wire          cache_read_req14;
wire[7:0]     cache_rd_ptr14;
wire[7:0]     cache_wr_ptr14;
wire          full_header14;
wire          pkt_buf_gnt14;
wire[63:0]    pkt_buf_addr14;

wire          shadw_wr_en14;
wire          shadw_wr_even14;
wire[7:0]     shadw_wr_ptr14;
wire[7:0]     shadw_rd_ptr14;
wire[168:0]   mailbox_data14;
wire          ldf_a14;
wire          ldf_b14;
wire          rcr_wrbk_sched14;
wire          rcr_wrbk_req14;
wire[63:0]    rcr_wrbk_addr14;
wire[3:0]     rcr_wrbk_numb14;
wire          rcr_wrbk_data_type14;
wire          rcr_ack_accept14;

wire          fetch_desp_req15;
wire[63:0]    fetch_desp_addr15;
wire[4:0]     fetch_desp_numb15;
wire          rdmc_resp_accept_sm15;
wire          fetch_desp_resp_vld15;
wire          cache_read_req15;
wire[7:0]     cache_rd_ptr15;
wire[7:0]     cache_wr_ptr15;
wire          full_header15;
wire          pkt_buf_gnt15;
wire[63:0]    pkt_buf_addr15;

wire          shadw_wr_en15;
wire          shadw_wr_even15;
wire[7:0]     shadw_wr_ptr15;
wire[7:0]     shadw_rd_ptr15;
wire[168:0]   mailbox_data15;
wire          ldf_a15;
wire          ldf_b15;
wire          rcr_wrbk_sched15;
wire          rcr_wrbk_req15;
wire[63:0]    rcr_wrbk_addr15;
wire[3:0]     rcr_wrbk_numb15;
wire          rcr_wrbk_data_type15;
wire          rcr_ack_accept15;

wire          drop_pkt0;
wire          drop_pkt1;
wire          drop_pkt2;
wire          drop_pkt3;
wire          drop_pkt4;
wire          drop_pkt5;
wire          drop_pkt6;
wire          drop_pkt7;
wire          drop_pkt8;
wire          drop_pkt9;
wire          drop_pkt10;
wire          drop_pkt11;
wire          drop_pkt12;
wire          drop_pkt13;
wire          drop_pkt14;
wire          drop_pkt15;

wire[1:0]     pkt_buf_size0;
wire[1:0]     pkt_buf_size1;
wire[1:0]     pkt_buf_size2;
wire[1:0]     pkt_buf_size3;
wire[1:0]     pkt_buf_size4;
wire[1:0]     pkt_buf_size5;
wire[1:0]     pkt_buf_size6;
wire[1:0]     pkt_buf_size7;
wire[1:0]     pkt_buf_size8;
wire[1:0]     pkt_buf_size9;
wire[1:0]     pkt_buf_size10;
wire[1:0]     pkt_buf_size11;
wire[1:0]     pkt_buf_size12;
wire[1:0]     pkt_buf_size13;
wire[1:0]     pkt_buf_size14;
wire[1:0]     pkt_buf_size15;

wire[35:0]    orig_buf_addr0;
wire[35:0]    orig_buf_addr1;
wire[35:0]    orig_buf_addr2;
wire[35:0]    orig_buf_addr3;
wire[35:0]    orig_buf_addr4;
wire[35:0]    orig_buf_addr5;
wire[35:0]    orig_buf_addr6;
wire[35:0]    orig_buf_addr7;
wire[35:0]    orig_buf_addr8;
wire[35:0]    orig_buf_addr9;
wire[35:0]    orig_buf_addr10;
wire[35:0]    orig_buf_addr11;
wire[35:0]    orig_buf_addr12;
wire[35:0]    orig_buf_addr13;
wire[35:0]    orig_buf_addr14;
wire[35:0]    orig_buf_addr15;

wire[1:0]     pref_buf_used_num0;
wire[1:0]     pref_buf_used_num1;
wire[1:0]     pref_buf_used_num2;
wire[1:0]     pref_buf_used_num3;
wire[1:0]     pref_buf_used_num4;
wire[1:0]     pref_buf_used_num5;
wire[1:0]     pref_buf_used_num6;
wire[1:0]     pref_buf_used_num7;
wire[1:0]     pref_buf_used_num8;
wire[1:0]     pref_buf_used_num9;
wire[1:0]     pref_buf_used_num10;
wire[1:0]     pref_buf_used_num11;
wire[1:0]     pref_buf_used_num12;
wire[1:0]     pref_buf_used_num13;
wire[1:0]     pref_buf_used_num14;
wire[1:0]     pref_buf_used_num15;

wire[13:0]    pkt_trans_len0;
wire[13:0]    pkt_trans_len1;
wire[13:0]    pkt_trans_len2;
wire[13:0]    pkt_trans_len3;
wire[13:0]    pkt_trans_len4;
wire[13:0]    pkt_trans_len5;
wire[13:0]    pkt_trans_len6;
wire[13:0]    pkt_trans_len7;
wire[13:0]    pkt_trans_len8;
wire[13:0]    pkt_trans_len9;
wire[13:0]    pkt_trans_len10;
wire[13:0]    pkt_trans_len11;
wire[13:0]    pkt_trans_len12;
wire[13:0]    pkt_trans_len13;
wire[13:0]    pkt_trans_len14;
wire[13:0]    pkt_trans_len15;

wire[19:0]    rx_log_page_hdl_reg0;
wire[19:0]    rx_log_page_hdl_reg1;
wire[19:0]    rx_log_page_hdl_reg2;
wire[19:0]    rx_log_page_hdl_reg3;
wire[19:0]    rx_log_page_hdl_reg4;
wire[19:0]    rx_log_page_hdl_reg5;
wire[19:0]    rx_log_page_hdl_reg6;
wire[19:0]    rx_log_page_hdl_reg7;
wire[19:0]    rx_log_page_hdl_reg8;
wire[19:0]    rx_log_page_hdl_reg9;
wire[19:0]    rx_log_page_hdl_reg10;
wire[19:0]    rx_log_page_hdl_reg11;
wire[19:0]    rx_log_page_hdl_reg12;
wire[19:0]    rx_log_page_hdl_reg13;
wire[19:0]    rx_log_page_hdl_reg14;
wire[19:0]    rx_log_page_hdl_reg15;

wire[1:0]     dma_func_num0;
wire[1:0]     dma_func_num1;
wire[1:0]     dma_func_num2;
wire[1:0]     dma_func_num3;
wire[1:0]     dma_func_num4;
wire[1:0]     dma_func_num5;
wire[1:0]     dma_func_num6;
wire[1:0]     dma_func_num7;
wire[1:0]     dma_func_num8;
wire[1:0]     dma_func_num9;
wire[1:0]     dma_func_num10;
wire[1:0]     dma_func_num11;
wire[1:0]     dma_func_num12;
wire[1:0]     dma_func_num13;
wire[1:0]     dma_func_num14;
wire[1:0]     dma_func_num15;

wire          pio_rd_gnt0;
wire          pio_rd_gnt1;
wire          pio_rd_gnt2;
wire          pio_rd_gnt3;
wire          pio_rd_gnt4;
wire          pio_rd_gnt5;
wire          pio_rd_gnt6;
wire          pio_rd_gnt7;
wire          pio_rd_gnt8;
wire          pio_rd_gnt9;
wire          pio_rd_gnt10;
wire          pio_rd_gnt11;
wire          pio_rd_gnt12;
wire          pio_rd_gnt13;
wire          pio_rd_gnt14;
wire          pio_rd_gnt15;

wire[63:0]    chnl_pio_rd_data0;
wire[63:0]    chnl_pio_rd_data1;
wire[63:0]    chnl_pio_rd_data2;
wire[63:0]    chnl_pio_rd_data3;
wire[63:0]    chnl_pio_rd_data4;
wire[63:0]    chnl_pio_rd_data5;
wire[63:0]    chnl_pio_rd_data6;
wire[63:0]    chnl_pio_rd_data7;
wire[63:0]    chnl_pio_rd_data8;
wire[63:0]    chnl_pio_rd_data9;
wire[63:0]    chnl_pio_rd_data10;
wire[63:0]    chnl_pio_rd_data11;
wire[63:0]    chnl_pio_rd_data12;
wire[63:0]    chnl_pio_rd_data13;
wire[63:0]    chnl_pio_rd_data14;
wire[63:0]    chnl_pio_rd_data15;


wire[15:0]      pio_rd_gnt = {
                        pio_rd_gnt15,
                        pio_rd_gnt14, pio_rd_gnt13, pio_rd_gnt12, pio_rd_gnt11, pio_rd_gnt10,
                        pio_rd_gnt9,  pio_rd_gnt8,  pio_rd_gnt7,  pio_rd_gnt6,  pio_rd_gnt5,
                        pio_rd_gnt4,  pio_rd_gnt3,  pio_rd_gnt2,  pio_rd_gnt1,  pio_rd_gnt0};

wire[319:0]	page_handle = {
                        rx_log_page_hdl_reg15,
                        rx_log_page_hdl_reg14, rx_log_page_hdl_reg13, rx_log_page_hdl_reg12, rx_log_page_hdl_reg11, rx_log_page_hdl_reg10,
                        rx_log_page_hdl_reg9,  rx_log_page_hdl_reg8,  rx_log_page_hdl_reg7,  rx_log_page_hdl_reg6,  rx_log_page_hdl_reg5,
                        rx_log_page_hdl_reg4,  rx_log_page_hdl_reg3,  rx_log_page_hdl_reg2,  rx_log_page_hdl_reg1,  rx_log_page_hdl_reg0};

wire[31:0]      rdmc_zcp_func_num = {
                        dma_func_num15,
                        dma_func_num14, dma_func_num13, dma_func_num12, dma_func_num11, dma_func_num10,
                        dma_func_num9,  dma_func_num8,  dma_func_num7,  dma_func_num6,  dma_func_num5,
                        dma_func_num4,  dma_func_num3,  dma_func_num2,  dma_func_num1,  dma_func_num0};

wire[15:0]	desp_rd_req = {
			fetch_desp_req15,
                        fetch_desp_req14, fetch_desp_req13, fetch_desp_req12, fetch_desp_req11, fetch_desp_req10,
			fetch_desp_req9,  fetch_desp_req8,  fetch_desp_req7,  fetch_desp_req6,  fetch_desp_req5,
                        fetch_desp_req4,  fetch_desp_req3,  fetch_desp_req2,  fetch_desp_req1,  fetch_desp_req0};

wire[15:0]	cache_rd_req = {
                        cache_read_req15,
                        cache_read_req14, cache_read_req13, cache_read_req12, cache_read_req11, cache_read_req10,
                        cache_read_req9,  cache_read_req8,  cache_read_req7,  cache_read_req6,  cache_read_req5,
                        cache_read_req4,  cache_read_req3,  cache_read_req2,  cache_read_req1,  cache_read_req0};

wire[15:0]	rdmc_resp_accept_array = {
                rdmc_resp_accept_sm15,
                rdmc_resp_accept_sm14, rdmc_resp_accept_sm13, rdmc_resp_accept_sm12, rdmc_resp_accept_sm11, rdmc_resp_accept_sm10,
                rdmc_resp_accept_sm9,  rdmc_resp_accept_sm8,  rdmc_resp_accept_sm7,  rdmc_resp_accept_sm6,  rdmc_resp_accept_sm5,
                rdmc_resp_accept_sm4,  rdmc_resp_accept_sm3,  rdmc_resp_accept_sm2,  rdmc_resp_accept_sm1,  rdmc_resp_accept_sm0};

wire[15:0]	fetch_desp_resp_valid_array = {
                fetch_desp_resp_vld15,
                fetch_desp_resp_vld14, fetch_desp_resp_vld13, fetch_desp_resp_vld12, fetch_desp_resp_vld11, fetch_desp_resp_vld10,
                fetch_desp_resp_vld9,  fetch_desp_resp_vld8,  fetch_desp_resp_vld7,  fetch_desp_resp_vld6,  fetch_desp_resp_vld5,
                fetch_desp_resp_vld4,  fetch_desp_resp_vld3,  fetch_desp_resp_vld2,  fetch_desp_resp_vld1,  fetch_desp_resp_vld0};

		
wire[15:0]	full_hdr_bits = {
			full_header15,     
                        full_header14, full_header13, full_header12, full_header11, full_header10,     
			full_header9,  full_header8,  full_header7,  full_header6,  full_header5,     
                        full_header4,  full_header3,  full_header2,  full_header1,  full_header0};    

wire[15:0]      drop_pkt = {
                        drop_pkt15,
                        drop_pkt14, drop_pkt13, drop_pkt12, drop_pkt11, drop_pkt10,
                        drop_pkt9,  drop_pkt8,  drop_pkt7,  drop_pkt6,  drop_pkt5,
                        drop_pkt4,  drop_pkt3,  drop_pkt2,  drop_pkt1,  drop_pkt0};

wire[15:0]	pkt_buf_gnt = {
                        pkt_buf_gnt15,     
                        pkt_buf_gnt14, pkt_buf_gnt13, pkt_buf_gnt12, pkt_buf_gnt11, pkt_buf_gnt10,     
                        pkt_buf_gnt9,  pkt_buf_gnt8,  pkt_buf_gnt7,  pkt_buf_gnt6,  pkt_buf_gnt5,     
                        pkt_buf_gnt4,  pkt_buf_gnt3,  pkt_buf_gnt2,  pkt_buf_gnt1,  pkt_buf_gnt0};  

wire[15:0]      shadw_wr_en = {
                        shadw_wr_en15,
                        shadw_wr_en14, shadw_wr_en13, shadw_wr_en12, shadw_wr_en11, shadw_wr_en10,
                        shadw_wr_en9,  shadw_wr_en8,  shadw_wr_en7,  shadw_wr_en6,  shadw_wr_en5,
                        shadw_wr_en4,  shadw_wr_en3,  shadw_wr_en2,  shadw_wr_en1,  shadw_wr_en0};

wire[15:0]      shadw_wr_even = {
                        shadw_wr_even15,
                        shadw_wr_even14, shadw_wr_even13, shadw_wr_even12, shadw_wr_even11, shadw_wr_even10,
                        shadw_wr_even9,  shadw_wr_even8,  shadw_wr_even7,  shadw_wr_even6,  shadw_wr_even5,
                        shadw_wr_even4,  shadw_wr_even3,  shadw_wr_even2,  shadw_wr_even1,  shadw_wr_even0};

wire[15:0]      rcr_wrbk_sched = {
                        rcr_wrbk_sched15,
                        rcr_wrbk_sched14, rcr_wrbk_sched13, rcr_wrbk_sched12, rcr_wrbk_sched11, rcr_wrbk_sched10,
                        rcr_wrbk_sched9,  rcr_wrbk_sched8,  rcr_wrbk_sched7,  rcr_wrbk_sched6,  rcr_wrbk_sched5,
                        rcr_wrbk_sched4,  rcr_wrbk_sched3,  rcr_wrbk_sched2,  rcr_wrbk_sched1,  rcr_wrbk_sched0};

wire[15:0]      rcr_wrbk_req = {
                        rcr_wrbk_req15,
                        rcr_wrbk_req14, rcr_wrbk_req13, rcr_wrbk_req12, rcr_wrbk_req11, rcr_wrbk_req10,
                        rcr_wrbk_req9,  rcr_wrbk_req8,  rcr_wrbk_req7,  rcr_wrbk_req6,  rcr_wrbk_req5,
                        rcr_wrbk_req4,  rcr_wrbk_req3,  rcr_wrbk_req2,  rcr_wrbk_req1,  rcr_wrbk_req0};

wire[15:0]      rcr_wrbk_data_type = {
                        rcr_wrbk_data_type15,
                        rcr_wrbk_data_type14, rcr_wrbk_data_type13, rcr_wrbk_data_type12, rcr_wrbk_data_type11, rcr_wrbk_data_type10,
                        rcr_wrbk_data_type9,  rcr_wrbk_data_type8,  rcr_wrbk_data_type7,  rcr_wrbk_data_type6,  rcr_wrbk_data_type5,
                        rcr_wrbk_data_type4,  rcr_wrbk_data_type3,  rcr_wrbk_data_type2,  rcr_wrbk_data_type1,  rcr_wrbk_data_type0};

wire[15:0]      rcr_ack_accept = {
                        rcr_ack_accept15,
                        rcr_ack_accept14, rcr_ack_accept13, rcr_ack_accept12, rcr_ack_accept11, rcr_ack_accept10,
                        rcr_ack_accept9,  rcr_ack_accept8,  rcr_ack_accept7,  rcr_ack_accept6,  rcr_ack_accept5,
                        rcr_ack_accept4,  rcr_ack_accept3,  rcr_ack_accept2,  rcr_ack_accept1,  rcr_ack_accept0};

wire[31:0]      rdmc_pio_intr_ldf_a = {16'b0,
                        ldf_a15,
                        ldf_a14, ldf_a13, ldf_a12, ldf_a11, ldf_a10,
                        ldf_a9,  ldf_a8,  ldf_a7,  ldf_a6,  ldf_a5,
                        ldf_a4,  ldf_a3,  ldf_a2,  ldf_a1,  ldf_a0};

wire[31:0]      rdmc_pio_intr_ldf_b = {16'b0,
                        ldf_b15,
                        ldf_b14, ldf_b13, ldf_b12, ldf_b11, ldf_b10,
                        ldf_b9,  ldf_b8,  ldf_b7,  ldf_b6,  ldf_b5,
                        ldf_b4,  ldf_b3,  ldf_b2,  ldf_b1,  ldf_b0};


`ifdef NEPTUNE
`else
wire		pio_client_32b	= 1'b0;
`endif


/*********************************************************************************************************/
/*********************************************************************************************************/

`ifdef NEPTUNE
wire      [3:0] do_nad;
wire      [3:0] do_nor;
wire      [3:0] do_inv;
wire      [3:0] do_mux;
wire      [3:0] do_q;
wire            so;

nep_spare_rdmc spare_rdmc_0 (
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


niu_rdmc_clk_buf niu_rdmc_clk_buf0 (
				.clk		(niu_clk),
				.niu_reset_l	(niu_reset_l),

				.reset		(reset)

				);


niu_rdmc_pio_if	niu_rdmc_pio_if0 (
			.clk			(niu_clk),
			.reset			(reset),
			.pio_rdmc_sel		(pio_rdmc_sel),
			.pio_rdmc_rd		(pio_rdmc_rd),
			.pio_rdmc_addr		(pio_rdmc_addr),
			.pio_rdmc_wdata		(pio_rdmc_wdata),
			.pio_client_32b		(pio_client_32b),
			.stage1_en_r		(stage1_en_r),
			.port_gnt		(port_gnt),
			.port_err_event		(port_err_event),
			.ipp_dat_req0_data      (ipp_dat_req0_data),
                        .ipp_dat_req1_data      (ipp_dat_req1_data),
                        .ipp_dat_req2_data      (ipp_dat_req2_data),
                        .ipp_dat_req3_data      (ipp_dat_req3_data),
			.wr_transfer_comp_int	(rdmc_meta0_wr_transfer_comp_int),
			.wr_debug_data		(wr_debug_data),
			.pio_rd_gnt		(pio_rd_gnt),
                        .chnl_pio_rd_data0      (chnl_pio_rd_data0),
                        .chnl_pio_rd_data1      (chnl_pio_rd_data1),
                        .chnl_pio_rd_data2      (chnl_pio_rd_data2),
                        .chnl_pio_rd_data3      (chnl_pio_rd_data3),
                        .chnl_pio_rd_data4      (chnl_pio_rd_data4),
                        .chnl_pio_rd_data5      (chnl_pio_rd_data5),
                        .chnl_pio_rd_data6      (chnl_pio_rd_data6),
                        .chnl_pio_rd_data7      (chnl_pio_rd_data7),
                        .chnl_pio_rd_data8      (chnl_pio_rd_data8),
                        .chnl_pio_rd_data9      (chnl_pio_rd_data9),
                        .chnl_pio_rd_data10     (chnl_pio_rd_data10),
                        .chnl_pio_rd_data11     (chnl_pio_rd_data11),
                        .chnl_pio_rd_data12     (chnl_pio_rd_data12),
                        .chnl_pio_rd_data13     (chnl_pio_rd_data13),
                        .chnl_pio_rd_data14     (chnl_pio_rd_data14),
                        .chnl_pio_rd_data15     (chnl_pio_rd_data15),
			.cache_rd_strobe	(cache_rd_strobe),
			.cache_wr_strobe	(cache_wr_strobe),
			.cache_rd_addr		(cache_rd_addr),
			.cache_wr_addr		(cache_wr_addr),
			.cache_wr_data		(cache_wr_data),
			.cache_rd_data_reg	(cache_rd_data_reg),
			.shadw_rd_strobe	(shadw_rd_strobe),
			.shadw_wr_strobe	(shadw_wr_strobe),
			.shadw_rd_addr		(shadw_rd_addr),
			.shadw_wr_addr		(shadw_wr_addr),
			.shadw_wr_data		(shadw_wr_data),
			.shadw_rd_data_reg	(shadw_rd_data_reg),
			.pkt_buf_gnt		(pkt_buf_gnt),

			.pio_32b_mode		(pio_32b_mode),
			.pio_wen		(pio_wen),
			.pio_addr		(pio_addr),
			.pio_wen_a              (pio_wen_a),
                        .pio_addr_a             (pio_addr_a),
			.pio_wen_b              (pio_wen_b),
                        .pio_addr_b             (pio_addr_b),
			.pio_wen_c              (pio_wen_c),
                        .pio_addr_c             (pio_addr_c),
			.pio_wdata		(pio_wdata),
			.rx_addr_32b_mode	(rx_addr_32b_mode),
			.wred_enable		(wred_enable),
			.random_num             (random_num),
			.clk_div_value		(clk_div_value),
			.port_err_status	(port_err_status),
			.muxed_port_rdc_num	(muxed_port_rdc_num),
                        .pt_drr_wt0_reg         (pt_drr_wt0_reg),
                        .pt_drr_wt1_reg         (pt_drr_wt1_reg),
                        .pt_drr_wt2_reg         (pt_drr_wt2_reg),
                        .pt_drr_wt3_reg         (pt_drr_wt3_reg),
			.muxed_cache_rd_strobe	(muxed_cache_rd_strobe),
			.muxed_cache_wr_strobe	(muxed_cache_wr_strobe),
			.muxed_cache_rd_addr	(muxed_cache_rd_addr),
			.muxed_cache_wr_addr	(muxed_cache_wr_addr),
			.muxed_cache_wr_data	(muxed_cache_wr_data),
			.muxed_shadw_rd_strobe	(muxed_shadw_rd_strobe),
			.muxed_shadw_wr_strobe	(muxed_shadw_wr_strobe),
			.muxed_shadw_rd_addr	(muxed_shadw_rd_addr),
			.muxed_shadw_wr_addr	(muxed_shadw_wr_addr),
			.muxed_shadw_wr_data	(muxed_shadw_wr_data),
			.muxed_cache_rd_strobe_r(muxed_cache_rd_strobe_r),
			.muxed_shadw_rd_strobe_r(muxed_shadw_rd_strobe_r),
			.cache_parity_err	(cache_parity_err),
			.shadw_parity_err	(shadw_parity_err),
			.rdmc_debug_port	(rdmc_debug_port),
			.rdmc_pio_port_int	(rdmc_pio_port_int),
			.rdmc_pio_ack		(rdmc_pio_ack),
			.rdmc_pio_err		(rdmc_pio_err),
			.rdmc_pio_rdata		(rdmc_pio_rdata)

			);


niu_rdmc_dp_master      niu_rdmc_dp_master0 (
                        .clk                            (niu_clk),
                        .reset                          (reset),
			.rx_addr_32b_mode		(rx_addr_32b_mode),
                        .pt_drr_wt0_reg                 (pt_drr_wt0_reg),
                        .pt_drr_wt1_reg                 (pt_drr_wt1_reg),
                        .pt_drr_wt2_reg                 (pt_drr_wt2_reg),
                        .pt_drr_wt3_reg                 (pt_drr_wt3_reg),
			.port_err_status		(port_err_status),
                        .muxed_port_rdc_num             (muxed_port_rdc_num),
                        .full_hdr_bits                  (full_hdr_bits),
			.drop_pkt			(drop_pkt),
                        .pkt_buf_gnt                    (pkt_buf_gnt),
                        .pkt_buf_addr0                  (pkt_buf_addr0),
                        .pkt_buf_addr1                  (pkt_buf_addr1),
                        .pkt_buf_addr2                  (pkt_buf_addr2),
                        .pkt_buf_addr3                  (pkt_buf_addr3),
                        .pkt_buf_addr4                  (pkt_buf_addr4),
                        .pkt_buf_addr5                  (pkt_buf_addr5),
                        .pkt_buf_addr6                  (pkt_buf_addr6),
                        .pkt_buf_addr7                  (pkt_buf_addr7),
                        .pkt_buf_addr8                  (pkt_buf_addr8),
                        .pkt_buf_addr9                  (pkt_buf_addr9),
                        .pkt_buf_addr10                 (pkt_buf_addr10),
                        .pkt_buf_addr11                 (pkt_buf_addr11),
                        .pkt_buf_addr12                 (pkt_buf_addr12),
                        .pkt_buf_addr13                 (pkt_buf_addr13),
                        .pkt_buf_addr14                 (pkt_buf_addr14),
                        .pkt_buf_addr15                 (pkt_buf_addr15),
			.pkt_buf_size0                  (pkt_buf_size0),
                        .pkt_buf_size1                  (pkt_buf_size1),
                        .pkt_buf_size2                  (pkt_buf_size2),
                        .pkt_buf_size3                  (pkt_buf_size3),
                        .pkt_buf_size4                  (pkt_buf_size4),
                        .pkt_buf_size5                  (pkt_buf_size5),
                        .pkt_buf_size6                  (pkt_buf_size6),
                        .pkt_buf_size7                  (pkt_buf_size7),
                        .pkt_buf_size8                  (pkt_buf_size8),
                        .pkt_buf_size9                  (pkt_buf_size9),
                        .pkt_buf_size10                 (pkt_buf_size10),
                        .pkt_buf_size11                 (pkt_buf_size11),
                        .pkt_buf_size12                 (pkt_buf_size12),
                        .pkt_buf_size13                 (pkt_buf_size13),
                        .pkt_buf_size14                 (pkt_buf_size14),
                        .pkt_buf_size15                 (pkt_buf_size15),
                        .orig_buf_addr0                 (orig_buf_addr0),
                        .orig_buf_addr1                 (orig_buf_addr1),
                        .orig_buf_addr2                 (orig_buf_addr2),
                        .orig_buf_addr3                 (orig_buf_addr3),
                        .orig_buf_addr4                 (orig_buf_addr4),
                        .orig_buf_addr5                 (orig_buf_addr5),
                        .orig_buf_addr6                 (orig_buf_addr6),
                        .orig_buf_addr7                 (orig_buf_addr7),
                        .orig_buf_addr8                 (orig_buf_addr8),
                        .orig_buf_addr9                 (orig_buf_addr9),
                        .orig_buf_addr10                (orig_buf_addr10),
                        .orig_buf_addr11                (orig_buf_addr11),
                        .orig_buf_addr12                (orig_buf_addr12),
                        .orig_buf_addr13                (orig_buf_addr13),
                        .orig_buf_addr14                (orig_buf_addr14),
                        .orig_buf_addr15                (orig_buf_addr15),
			.dma_func_num0                  (dma_func_num0),
                        .dma_func_num1                  (dma_func_num1),
                        .dma_func_num2                  (dma_func_num2),
                        .dma_func_num3                  (dma_func_num3),
                        .dma_func_num4                  (dma_func_num4),
                        .dma_func_num5                  (dma_func_num5),
                        .dma_func_num6                  (dma_func_num6),
                        .dma_func_num7                  (dma_func_num7),
                        .dma_func_num8                  (dma_func_num8),
                        .dma_func_num9                  (dma_func_num9),
                        .dma_func_num10                 (dma_func_num10),
                        .dma_func_num11                 (dma_func_num11),
                        .dma_func_num12                 (dma_func_num12),
                        .dma_func_num13                 (dma_func_num13),
                        .dma_func_num14                 (dma_func_num14),
                        .dma_func_num15                 (dma_func_num15),
			.pref_buf_used_num0             (pref_buf_used_num0),
                        .pref_buf_used_num1             (pref_buf_used_num1),
                        .pref_buf_used_num2             (pref_buf_used_num2),
                        .pref_buf_used_num3             (pref_buf_used_num3),
                        .pref_buf_used_num4             (pref_buf_used_num4),
                        .pref_buf_used_num5             (pref_buf_used_num5),
                        .pref_buf_used_num6             (pref_buf_used_num6),
                        .pref_buf_used_num7             (pref_buf_used_num7),
                        .pref_buf_used_num8             (pref_buf_used_num8),
                        .pref_buf_used_num9             (pref_buf_used_num9),
                        .pref_buf_used_num10            (pref_buf_used_num10),
                        .pref_buf_used_num11            (pref_buf_used_num11),
                        .pref_buf_used_num12            (pref_buf_used_num12),
                        .pref_buf_used_num13            (pref_buf_used_num13),
                        .pref_buf_used_num14            (pref_buf_used_num14),
                        .pref_buf_used_num15            (pref_buf_used_num15),
			.pkt_trans_len0                 (pkt_trans_len0),
                        .pkt_trans_len1                 (pkt_trans_len1),
                        .pkt_trans_len2                 (pkt_trans_len2),
                        .pkt_trans_len3                 (pkt_trans_len3),
                        .pkt_trans_len4                 (pkt_trans_len4),
                        .pkt_trans_len5                 (pkt_trans_len5),
                        .pkt_trans_len6                 (pkt_trans_len6),
                        .pkt_trans_len7                 (pkt_trans_len7),
                        .pkt_trans_len8                 (pkt_trans_len8),
                        .pkt_trans_len9                 (pkt_trans_len9),
                        .pkt_trans_len10                (pkt_trans_len10),
                        .pkt_trans_len11                (pkt_trans_len11),
                        .pkt_trans_len12                (pkt_trans_len12),
                        .pkt_trans_len13                (pkt_trans_len13),
                        .pkt_trans_len14                (pkt_trans_len14),
                        .pkt_trans_len15                (pkt_trans_len15),
                        .ipp_dmc_ful_pkt0             	(ipp_dmc_ful_pkt0),
                        .ipp_dmc_dat_ack0             	(ipp_dmc_dat_ack0),
			.ipp_dmc_dat_err0		(ipp_dmc_dat_err0),
                        .ipp_dmc_data0                 	(ipp_dmc_data0),
                        .ipp_dmc_ful_pkt1             	(ipp_dmc_ful_pkt1),
                        .ipp_dmc_dat_ack1             	(ipp_dmc_dat_ack1),
			.ipp_dmc_dat_err1		(ipp_dmc_dat_err1),
                        .ipp_dmc_data1                 	(ipp_dmc_data1),

`ifdef NEPTUNE
                        .ipp_dmc_ful_pkt2             	(ipp_dmc_ful_pkt2),
                        .ipp_dmc_dat_ack2             	(ipp_dmc_dat_ack2),
			.ipp_dmc_dat_err2		(ipp_dmc_dat_err2),
                        .ipp_dmc_data2                 	(ipp_dmc_data2),
                        .ipp_dmc_ful_pkt3             	(ipp_dmc_ful_pkt3),
                        .ipp_dmc_dat_ack3             	(ipp_dmc_dat_ack3),
			.ipp_dmc_dat_err3		(ipp_dmc_dat_err3),
                        .ipp_dmc_data3                 	(ipp_dmc_data3),
`else
			.ipp_dmc_ful_pkt2             	(1'b0),
                        .ipp_dmc_dat_ack2             	(1'b0),
			.ipp_dmc_dat_err2		(1'b0),
                        .ipp_dmc_data2                 	(130'b0),
                        .ipp_dmc_ful_pkt3             	(1'b0),
                        .ipp_dmc_dat_ack3             	(1'b0),
			.ipp_dmc_dat_err3		(1'b0),
                        .ipp_dmc_data3                 	(130'b0),
`endif

                        .zcp_dmc_ful_pkt0             	(zcp_dmc_ful_pkt0),
                        .zcp_dmc_ack0             	(zcp_dmc_ack0),
                        .zcp_dmc_dat0                 	(zcp_dmc_dat0),
			.zcp_dmc_dat_err0		(zcp_dmc_dat_err0),
                        .zcp_dmc_ful_pkt1             	(zcp_dmc_ful_pkt1),
                        .zcp_dmc_ack1             	(zcp_dmc_ack1),
                        .zcp_dmc_dat1                 	(zcp_dmc_dat1),
			.zcp_dmc_dat_err1		(zcp_dmc_dat_err1),

`ifdef NEPTUNE
                        .zcp_dmc_ful_pkt2             	(zcp_dmc_ful_pkt2),
                        .zcp_dmc_ack2             	(zcp_dmc_ack2),
                        .zcp_dmc_dat2                 	(zcp_dmc_dat2),
			.zcp_dmc_dat_err2		(zcp_dmc_dat_err2),
                        .zcp_dmc_ful_pkt3             	(zcp_dmc_ful_pkt3),
                        .zcp_dmc_ack3             	(zcp_dmc_ack3),
                        .zcp_dmc_dat3                 	(zcp_dmc_dat3),
			.zcp_dmc_dat_err3		(zcp_dmc_dat_err3),
`else
			.zcp_dmc_ful_pkt2             	(1'b0),
                        .zcp_dmc_ack2             	(1'b0),
                        .zcp_dmc_dat2                 	(130'b0),
			.zcp_dmc_dat_err2		(1'b0),
                        .zcp_dmc_ful_pkt3             	(1'b0),
                        .zcp_dmc_ack3             	(1'b0),
                        .zcp_dmc_dat3                 	(130'b0),
			.zcp_dmc_dat_err3		(1'b0),
`endif
                        .meta0_rdmc_wr_req_accept       (meta0_rdmc_wr_req_accept),
                        .meta0_rdmc_wr_data_req         (meta0_rdmc_wr_data_req),

			//output
			.port_gnt			(port_gnt),
			.muxed_pkt_len                  (muxed_pkt_len),
                        .muxed_rdc_num_r                (muxed_rdc_num_r),
			.muxed_drop_pkt_r		(muxed_drop_pkt_r),
			.muxed_s_event_r		(muxed_s_event_r),
			.stage1_en_r			(stage1_en_r),
                        .sel_buf_en                     (sel_buf_en),
			.pkt_req_cnt_e_done_mod		(pkt_req_cnt_e_done_mod),
			.pkt_buf_done			(pkt_buf_done),
			.is_hdr_wr_data			(is_hdr_wr_data),
			.is_jmb1_wr_data		(is_jmb1_wr_data),
			.wr_last_pkt_data		(wr_last_pkt_data),
			.update_rcr_shadw		(update_rcr_shadw),
			.rcr_wrbk_data			(rcr_wrbk_data),
			.muxed_data_err_r2		(muxed_data_err_r2),
			.rdmc_wr_data_dma_num		(rdmc_wr_data_dma_num),
                        .dmc_ipp_dat_req0             	(dmc_ipp_dat_req0),
                        .dmc_ipp_dat_req1             	(dmc_ipp_dat_req1),
                        .dmc_ipp_dat_req2             	(dmc_ipp_dat_req2),
                        .dmc_ipp_dat_req3             	(dmc_ipp_dat_req3),
                        .dmc_zcp_req0             	(dmc_zcp_req0),
                        .dmc_zcp_req1             	(dmc_zcp_req1),
                        .dmc_zcp_req2             	(dmc_zcp_req2),
                        .dmc_zcp_req3             	(dmc_zcp_req3),

                        .rdmc_meta0_wr_req              (rdmc_meta0_wr_req),
                        .rdmc_meta0_wr_req_cmd          (rdmc_meta0_wr_req_cmd),
                        .rdmc_meta0_wr_req_address      (rdmc_meta0_wr_req_address),
                        .rdmc_meta0_wr_req_length       (rdmc_meta0_wr_req_length),
                        .rdmc_meta0_wr_req_port_num     (rdmc_meta0_wr_req_port_num),
                        .rdmc_meta0_wr_req_dma_num      (rdmc_meta0_wr_req_dma_num),
			.rdmc_meta0_wr_req_func_num	(rdmc_meta0_wr_req_func_num),

                        .rdmc_meta0_wr_data_valid       (rdmc_meta0_wr_data_valid),
                        .rdmc_meta0_wr_data             (rdmc_meta0_wr_data),
                        .rdmc_meta0_wr_req_byteenable   (rdmc_meta0_wr_req_byteenable),
                        .rdmc_meta0_wr_transfer_comp    (rdmc_meta0_wr_transfer_comp),
			.rdmc_meta0_wr_transfer_comp_int(rdmc_meta0_wr_transfer_comp_int),
                        .rdmc_meta0_wr_status           (rdmc_meta0_wr_status),

			.port_err_event			(port_err_event),
			.ipp_dat_req0_data              (ipp_dat_req0_data),
                        .ipp_dat_req1_data              (ipp_dat_req1_data),
                        .ipp_dat_req2_data              (ipp_dat_req2_data),
                        .ipp_dat_req3_data              (ipp_dat_req3_data),
			.wr_debug_data			(wr_debug_data)

                        );

niu_rdmc_cache_acc_ctrl niu_rdmc_cache_acc_ctrl0 (
			.clk                                    (niu_clk),
                        .reset                                  (reset),
			.cache_rd_req				(cache_rd_req),
			.cache_rd_ptr0				(cache_rd_ptr0),
                        .cache_rd_ptr1				(cache_rd_ptr1),
                        .cache_rd_ptr2				(cache_rd_ptr2),
                        .cache_rd_ptr3				(cache_rd_ptr3),
                        .cache_rd_ptr4				(cache_rd_ptr4),
                        .cache_rd_ptr5				(cache_rd_ptr5),
                        .cache_rd_ptr6				(cache_rd_ptr6),
                        .cache_rd_ptr7				(cache_rd_ptr7),
                        .cache_rd_ptr8				(cache_rd_ptr8),
                        .cache_rd_ptr9				(cache_rd_ptr9),
			.cache_rd_ptr10                         (cache_rd_ptr10),
                        .cache_rd_ptr11                         (cache_rd_ptr11),
                        .cache_rd_ptr12                         (cache_rd_ptr12),
                        .cache_rd_ptr13                         (cache_rd_ptr13),
                        .cache_rd_ptr14                         (cache_rd_ptr14),
                        .cache_rd_ptr15                         (cache_rd_ptr15),
			.muxed_cache_rd_strobe_r		(muxed_cache_rd_strobe_r),
			.cache_rd_data				(cache_rd_data),
			.cache_wr_ptr0                          (cache_wr_ptr0),
                        .cache_wr_ptr1                          (cache_wr_ptr1),
                        .cache_wr_ptr2                          (cache_wr_ptr2),
                        .cache_wr_ptr3                          (cache_wr_ptr3),
                        .cache_wr_ptr4                          (cache_wr_ptr4),
                        .cache_wr_ptr5                          (cache_wr_ptr5),
                        .cache_wr_ptr6                          (cache_wr_ptr6),
                        .cache_wr_ptr7                          (cache_wr_ptr7),
                        .cache_wr_ptr8                          (cache_wr_ptr8),
                        .cache_wr_ptr9                          (cache_wr_ptr9),
                        .cache_wr_ptr10                         (cache_wr_ptr10),
                        .cache_wr_ptr11                         (cache_wr_ptr11),
                        .cache_wr_ptr12                         (cache_wr_ptr12),
                        .cache_wr_ptr13                         (cache_wr_ptr13),
                        .cache_wr_ptr14                         (cache_wr_ptr14),
                        .cache_wr_ptr15                         (cache_wr_ptr15),
			.fetch_desp_resp_valid_array		(fetch_desp_resp_valid_array),
			.rdmc_resp_data_valid			(rdmc_resp_data_valid),

			.cache_wr_strobe			(cache_wr_strobe),
			.cache_wr_addr				(cache_wr_addr),
			.cache_rd_strobe			(cache_rd_strobe),
			.cache_rd_addr				(cache_rd_addr),
			.cache_buf_rd_gnt			(cache_buf_rd_gnt),
			.cache_rd_data_reg			(cache_rd_data_reg)

			);


niu_rdmc_shadow_ram_ctrl niu_rdmc_shadow_ram_ctrl0 (
			.clk                            (niu_clk),
                        .reset                          (reset),
			.shadw_wr_en			(shadw_wr_en),
			.shadw_wr_even			(shadw_wr_even),
			.shadw_wr_ptr0                  (shadw_wr_ptr0),
                        .shadw_wr_ptr1                  (shadw_wr_ptr1),
                        .shadw_wr_ptr2                  (shadw_wr_ptr2),
                        .shadw_wr_ptr3                  (shadw_wr_ptr3),
                        .shadw_wr_ptr4                  (shadw_wr_ptr4),
                        .shadw_wr_ptr5                  (shadw_wr_ptr5),
                        .shadw_wr_ptr6                  (shadw_wr_ptr6),
                        .shadw_wr_ptr7                  (shadw_wr_ptr7),
                        .shadw_wr_ptr8                  (shadw_wr_ptr8),
                        .shadw_wr_ptr9                  (shadw_wr_ptr9),
                        .shadw_wr_ptr10                 (shadw_wr_ptr10),
                        .shadw_wr_ptr11                 (shadw_wr_ptr11),
                        .shadw_wr_ptr12                 (shadw_wr_ptr12),
                        .shadw_wr_ptr13                 (shadw_wr_ptr13),
                        .shadw_wr_ptr14                 (shadw_wr_ptr14),
                        .shadw_wr_ptr15                 (shadw_wr_ptr15),
                        .shadw_rd_ptr0                  (shadw_rd_ptr0),
                        .shadw_rd_ptr1                  (shadw_rd_ptr1),
                        .shadw_rd_ptr2                  (shadw_rd_ptr2),
                        .shadw_rd_ptr3                  (shadw_rd_ptr3),
                        .shadw_rd_ptr4                  (shadw_rd_ptr4),
                        .shadw_rd_ptr5                  (shadw_rd_ptr5),
                        .shadw_rd_ptr6                  (shadw_rd_ptr6),
                        .shadw_rd_ptr7                  (shadw_rd_ptr7),
                        .shadw_rd_ptr8                  (shadw_rd_ptr8),
                        .shadw_rd_ptr9                  (shadw_rd_ptr9),
                        .shadw_rd_ptr10                 (shadw_rd_ptr10),
                        .shadw_rd_ptr11                 (shadw_rd_ptr11),
                        .shadw_rd_ptr12                 (shadw_rd_ptr12),
                        .shadw_rd_ptr13                 (shadw_rd_ptr13),
                        .shadw_rd_ptr14                 (shadw_rd_ptr14),
                        .shadw_rd_ptr15                 (shadw_rd_ptr15),
			.muxed_data_err_r2		(muxed_data_err_r2),
			.rdmc_meta0_wr_transfer_comp_int(rdmc_meta0_wr_transfer_comp_int),
			.rcr_wrbk_data			(rcr_wrbk_data),
			.rcr_wrbk_sched			(rcr_wrbk_sched),
			.rdmc_rcr_req_accept		(rdmc_rcr_req_accept),
			.shadw_rd_strobe		(shadw_rd_strobe),

			.data_err_event			(data_err_event),
			.shadw_wr_strobe		(shadw_wr_strobe),
			.shadw_wr_addr			(shadw_wr_addr),
			.shadw_wr_data			(shadw_wr_data),
			.shadw_rd_addr			(shadw_rd_addr)

			);


`ifdef NEPTUNE
`else
        niu_mb4 niu_mb4 (
                    .l1clk                      (niu_clk),
		    .rst			(reset),
                    .mb4_scan_in                (rdp_rdmc_mbist_scan_in),
                    .tcu_aclk                   (tcu_aclk),
                    .tcu_bclk                   (tcu_bclk),
                    .tcu_niu_mbist_start_4      (tcu_rdp_rdmc_mbist_start),
                    .tcu_mbist_bisi_en          (tcu_mbist_bisi_en),
		    .tcu_mbist_user_mode	(tcu_mbist_user_mode),
                    .niu_mb4_rdmc_desc_data_out (niu_mb4_rdmc_desc_data_out[147:0]),
                    .niu_mb4_rdmc_comp_data_out (niu_mb4_rdmc_comp_data_out[147:0]),
                    .niu_mb4_desc_rd_en         (niu_mb4_desc_rd_en),
                    .niu_mb4_desc_wr_en         (niu_mb4_desc_wr_en),
                    .niu_mb4_comp_rd_en         (niu_mb4_comp_rd_en),
                    .niu_mb4_comp_wr_en         (niu_mb4_comp_wr_en),
                    .niu_mb4_addr               (niu_mb4_addr[7:0]),
                    .niu_mb4_wdata              (niu_mb4_wdata[7:0]),
                    .niu_mb4_run                (niu_mb4_run),
                    .niu_tcu_mbist_fail_4       (rdp_rdmc_tcu_mbist_fail),
                    .niu_tcu_mbist_done_4       (rdp_rdmc_tcu_mbist_done),
                    .mb4_scan_out               (rdp_rdmc_mbist_scan_out),
		    .mb4_dmo_dout		(rdp_tcu_dmo_data_out));
`endif

niu_ram_256_148 niu_ram_256_148_inst0 (
`ifdef NEPTUNE
			.clk                    (niu_clk),
`else
			.reset			(reset),
			.clk                    (iol2clk),
                        .tcu_aclk               (tcu_aclk),
                        .tcu_bclk               (tcu_bclk),
			.tcu_scan_en		(tcu_scan_en),
                        .tcu_se_scancollar_in   (tcu_se_scancollar_in),
                        .tcu_se_scancollar_out  (tcu_se_scancollar_out),
		        .tcu_array_wr_inhibit	(tcu_array_wr_inhibit),
                        .scan_in                (1'b0),
                        .scan_out               (),
			.hdr_sram_rvalue        (hdr_sram_rvalue_rdmc0),
                        .hdr_sram_rid           (hdr_sram_rid_rdmc0),
                        .hdr_sram_wr_en         (hdr_sram_wr_en_rdmc0),
                        .hdr_sram_red_clr       (hdr_sram_red_clr_rdmc0),
                        .sram_hdr_read_data     (sram_hdr_read_data_rdmc0),

                        .l2clk_2x               (l2clk_2x),
                        .mbi_wdata              (niu_mb4_wdata_full),
                        .mbi_rd_adr             (niu_mb4_addr[7:0]),
                        .mbi_wr_adr             (niu_mb4_addr[7:0]),
                        .mbi_wr_en              (niu_mb4_desc_wr_en),
                        .mbi_rd_en              (niu_mb4_desc_rd_en),
                        .mbi_run                (niu_mb4_run),
`endif
                        .data_inp               (muxed_cache_wr_data),
                        .addr_rd                (muxed_cache_rd_addr),
                        .addr_wt                (muxed_cache_wr_addr),
                        .wt_enable              (muxed_cache_wr_strobe),
                        .cs_rd                  (muxed_cache_rd_strobe),

                        .data_out               (cache_rd_data)

                        );

niu_ram_256_148 niu_ram_256_148_inst1 (
`ifdef NEPTUNE
			.clk                    (niu_clk),
`else
			.reset                  (reset),
			.clk                    (iol2clk),
                        .tcu_aclk               (tcu_aclk),
                        .tcu_bclk               (tcu_bclk),
			.tcu_scan_en		(tcu_scan_en),
                        .tcu_se_scancollar_in   (tcu_se_scancollar_in),
                        .tcu_se_scancollar_out  (tcu_se_scancollar_out),
			.tcu_array_wr_inhibit	(tcu_array_wr_inhibit),
                        .scan_in                (1'b0),
                        .scan_out               (),
			.hdr_sram_rvalue        (hdr_sram_rvalue_rdmc1),
                        .hdr_sram_rid           (hdr_sram_rid_rdmc1),
                        .hdr_sram_wr_en         (hdr_sram_wr_en_rdmc1),
                        .hdr_sram_red_clr       (hdr_sram_red_clr_rdmc1),
                        .sram_hdr_read_data     (sram_hdr_read_data_rdmc1),

                        .l2clk_2x               (l2clk_2x),
                        .mbi_wdata              (niu_mb4_wdata_full),
                        .mbi_rd_adr             (niu_mb4_addr[7:0]),
                        .mbi_wr_adr             (niu_mb4_addr[7:0]),
                        .mbi_wr_en              (niu_mb4_comp_wr_en),
                        .mbi_rd_en              (niu_mb4_comp_rd_en),
                        .mbi_run                (niu_mb4_run),
`endif
                        .data_inp               (muxed_shadw_wr_data),
                        .addr_rd                (muxed_shadw_rd_addr),
                        .addr_wt                (muxed_shadw_wr_addr),
                        .wt_enable              (muxed_shadw_wr_strobe),
                        .cs_rd                  (muxed_shadw_rd_strobe),

                        .data_out               (shadw_rd_data)

                        );


niu_rdmc_desp_acc_ctrl niu_rdmc_desp_acc_ctrl0 (
			.clk					(niu_clk),
			.reset					(reset),
			.rx_addr_32b_mode			(rx_addr_32b_mode),
			.desp_rd_req				(desp_rd_req),
			.fetch_desp_addr0			(fetch_desp_addr0),
                        .fetch_desp_addr1			(fetch_desp_addr1),
                        .fetch_desp_addr2			(fetch_desp_addr2),
                        .fetch_desp_addr3			(fetch_desp_addr3),
                        .fetch_desp_addr4			(fetch_desp_addr4),
                        .fetch_desp_addr5			(fetch_desp_addr5),
                        .fetch_desp_addr6			(fetch_desp_addr6),
                        .fetch_desp_addr7			(fetch_desp_addr7),
                        .fetch_desp_addr8			(fetch_desp_addr8),
                        .fetch_desp_addr9			(fetch_desp_addr9),
			.fetch_desp_addr10      		(fetch_desp_addr10),
                        .fetch_desp_addr11      		(fetch_desp_addr11),
                        .fetch_desp_addr12      		(fetch_desp_addr12),
                        .fetch_desp_addr13      		(fetch_desp_addr13),
                        .fetch_desp_addr14      		(fetch_desp_addr14),
                        .fetch_desp_addr15      		(fetch_desp_addr15),
			.fetch_desp_numb0       		(fetch_desp_numb0),
                        .fetch_desp_numb1       		(fetch_desp_numb1),
                        .fetch_desp_numb2       		(fetch_desp_numb2),
                        .fetch_desp_numb3       		(fetch_desp_numb3),
                        .fetch_desp_numb4       		(fetch_desp_numb4),
                        .fetch_desp_numb5       		(fetch_desp_numb5),
                        .fetch_desp_numb6       		(fetch_desp_numb6),
                        .fetch_desp_numb7       		(fetch_desp_numb7),
                        .fetch_desp_numb8       		(fetch_desp_numb8),
                        .fetch_desp_numb9       		(fetch_desp_numb9),
                        .fetch_desp_numb10      		(fetch_desp_numb10),
                        .fetch_desp_numb11      		(fetch_desp_numb11),
                        .fetch_desp_numb12      		(fetch_desp_numb12),
                        .fetch_desp_numb13      		(fetch_desp_numb13),
                        .fetch_desp_numb14      		(fetch_desp_numb14),
                        .fetch_desp_numb15      		(fetch_desp_numb15),
			.dma_func_num0                       	(dma_func_num0),
                        .dma_func_num1                       	(dma_func_num1),
                        .dma_func_num2                       	(dma_func_num2),
                        .dma_func_num3                       	(dma_func_num3),
                        .dma_func_num4                       	(dma_func_num4),
                        .dma_func_num5                       	(dma_func_num5),
                        .dma_func_num6                       	(dma_func_num6),
                        .dma_func_num7                       	(dma_func_num7),
                        .dma_func_num8                       	(dma_func_num8),
                        .dma_func_num9                       	(dma_func_num9),
                        .dma_func_num10                      	(dma_func_num10),
                        .dma_func_num11                      	(dma_func_num11),
                        .dma_func_num12                      	(dma_func_num12),
                        .dma_func_num13                      	(dma_func_num13),
                        .dma_func_num14                      	(dma_func_num14),
                        .dma_func_num15                      	(dma_func_num15),
			.rdmc_resp_accept_array			(rdmc_resp_accept_array),
                        .fetch_desp_resp_valid_array		(fetch_desp_resp_valid_array),
                        .meta1_rdmc_rbr_req_accept		(meta1_rdmc_rbr_req_accept),
                        .meta1_rdmc_rbr_req_error		(meta1_rdmc_rbr_req_error),
                        .meta1_rdmc_rbr_resp_ready		(meta1_rdmc_rbr_resp_ready),
                        .meta1_rdmc_rbr_resp_cmd		(meta1_rdmc_rbr_resp_cmd),
			.meta1_rdmc_rbr_resp_cmd_status		(meta1_rdmc_rbr_resp_cmd_status),
                        .meta1_rdmc_rbr_resp_dma_num		(meta1_rdmc_rbr_resp_dma_num),
                        .meta1_rdmc_rbr_resp_client		(meta1_rdmc_rbr_resp_client),
                        .meta1_rdmc_rbr_resp_comp		(meta1_rdmc_rbr_resp_comp),
                        .meta1_rdmc_rbr_resp_trans_comp		(meta1_rdmc_rbr_resp_trans_comp),
                        .meta1_rdmc_rbr_resp_data_valid		(meta1_rdmc_rbr_resp_data_valid),
                        .meta1_rdmc_rbr_resp_data		(meta1_rdmc_rbr_resp_data),
                        .meta1_rdmc_rbr_resp_byteenable		(meta1_rdmc_rbr_resp_byteenable),
                        .meta1_rdmc_rbr_resp_data_status	(meta1_rdmc_rbr_resp_data_status),

                        .rdmc_meta1_rbr_req			(rdmc_meta1_rbr_req),
                        .rdmc_meta1_rbr_req_cmd			(rdmc_meta1_rbr_req_cmd),
                        .rdmc_meta1_rbr_req_address		(rdmc_meta1_rbr_req_address),
                        .rdmc_meta1_rbr_req_length		(rdmc_meta1_rbr_req_length),
                        .rdmc_meta1_rbr_req_dma_num		(rdmc_meta1_rbr_req_dma_num),
			.rdmc_meta1_rbr_req_port_num		(rdmc_meta1_rbr_req_port_num),
			.rdmc_meta1_rbr_req_func_num		(rdmc_meta1_rbr_req_func_num),
                        .rdmc_meta1_rbr_resp_accept		(rdmc_meta1_rbr_resp_accept),
                        .fetch_desp_gnt				(fetch_desp_gnt),
                        .resp_data_in_process			(resp_data_in_process),
                        .rdmc_resp_rdy_valid			(rdmc_resp_rdy_valid),
			.rdmc_req_err				(rdmc_req_err),
			.rdmc_resp_cmd				(rdmc_resp_cmd),
			.rdmc_resp_cmd_status			(rdmc_resp_cmd_status),
                        .rdmc_resp_dma_num			(rdmc_resp_dma_num),
			.rdmc_resp_data_valid			(rdmc_resp_data_valid),
                        .rdmc_resp_byteenable			(rdmc_resp_byteenable),
                        .rdmc_resp_comp				(rdmc_resp_comp),
                        .rdmc_resp_trans_comp			(rdmc_resp_trans_comp),
			.rdmc_resp_data_status			(rdmc_resp_data_status),
                        .cache_wr_data				(cache_wr_data)

			);


niu_rdmc_rcr_acc_ctrl niu_rdmc_rcr_acc_ctrl0 (
			.clk                    	(niu_clk),
                        .reset                  	(reset),
			.rx_addr_32b_mode		(rx_addr_32b_mode),
			.rcr_ack_accept			(rcr_ack_accept),
			.rcr_wrbk_req			(rcr_wrbk_req),
			.rcr_wrbk_data_type		(rcr_wrbk_data_type),
                        .rcr_wrbk_addr0                 (rcr_wrbk_addr0),
                        .rcr_wrbk_addr1                 (rcr_wrbk_addr1),
                        .rcr_wrbk_addr2                 (rcr_wrbk_addr2),
                        .rcr_wrbk_addr3                 (rcr_wrbk_addr3),
                        .rcr_wrbk_addr4                 (rcr_wrbk_addr4),
                        .rcr_wrbk_addr5                 (rcr_wrbk_addr5),
                        .rcr_wrbk_addr6                 (rcr_wrbk_addr6),
                        .rcr_wrbk_addr7                 (rcr_wrbk_addr7),
                        .rcr_wrbk_addr8                 (rcr_wrbk_addr8),
                        .rcr_wrbk_addr9                 (rcr_wrbk_addr9),
                        .rcr_wrbk_addr10                (rcr_wrbk_addr10),
                        .rcr_wrbk_addr11                (rcr_wrbk_addr11),
                        .rcr_wrbk_addr12                (rcr_wrbk_addr12),
                        .rcr_wrbk_addr13                (rcr_wrbk_addr13),
                        .rcr_wrbk_addr14                (rcr_wrbk_addr14),
                        .rcr_wrbk_addr15                (rcr_wrbk_addr15),
                        .rcr_wrbk_numb0                 (rcr_wrbk_numb0),
                        .rcr_wrbk_numb1                 (rcr_wrbk_numb1),
                        .rcr_wrbk_numb2                 (rcr_wrbk_numb2),
                        .rcr_wrbk_numb3                 (rcr_wrbk_numb3),
                        .rcr_wrbk_numb4                 (rcr_wrbk_numb4),
                        .rcr_wrbk_numb5                 (rcr_wrbk_numb5),
                        .rcr_wrbk_numb6                 (rcr_wrbk_numb6),
                        .rcr_wrbk_numb7                 (rcr_wrbk_numb7),
                        .rcr_wrbk_numb8                 (rcr_wrbk_numb8),
                        .rcr_wrbk_numb9                 (rcr_wrbk_numb9),
                        .rcr_wrbk_numb10                (rcr_wrbk_numb10),
                        .rcr_wrbk_numb11                (rcr_wrbk_numb11),
                        .rcr_wrbk_numb12                (rcr_wrbk_numb12),
                        .rcr_wrbk_numb13                (rcr_wrbk_numb13),
                        .rcr_wrbk_numb14                (rcr_wrbk_numb14),
                        .rcr_wrbk_numb15                (rcr_wrbk_numb15),
			.dma_func_num0                  (dma_func_num0),
                        .dma_func_num1                  (dma_func_num1),
                        .dma_func_num2                  (dma_func_num2),
                        .dma_func_num3                  (dma_func_num3),
                        .dma_func_num4                  (dma_func_num4),
                        .dma_func_num5                  (dma_func_num5),
                        .dma_func_num6                  (dma_func_num6),
                        .dma_func_num7                  (dma_func_num7),
                        .dma_func_num8                  (dma_func_num8),
                        .dma_func_num9                  (dma_func_num9),
                        .dma_func_num10                 (dma_func_num10),
                        .dma_func_num11                 (dma_func_num11),
                        .dma_func_num12                 (dma_func_num12),
                        .dma_func_num13                 (dma_func_num13),
                        .dma_func_num14                 (dma_func_num14),
                        .dma_func_num15                 (dma_func_num15),
			.shadw_rd_data			(shadw_rd_data),
			.mailbox_data0			(mailbox_data0),
                        .mailbox_data1			(mailbox_data1),
                        .mailbox_data2			(mailbox_data2),
                        .mailbox_data3			(mailbox_data3),
			.mailbox_data4          	(mailbox_data4),
                        .mailbox_data5          	(mailbox_data5),
                        .mailbox_data6          	(mailbox_data6),
                        .mailbox_data7         	 	(mailbox_data7),
			.mailbox_data8          	(mailbox_data8),
                        .mailbox_data9          	(mailbox_data9),
			.mailbox_data10         	(mailbox_data10),
                        .mailbox_data11         	(mailbox_data11),
                        .mailbox_data12         	(mailbox_data12),
                        .mailbox_data13         	(mailbox_data13),
                        .mailbox_data14         	(mailbox_data14),
                        .mailbox_data15         	(mailbox_data15),
			.meta0_rdmc_rcr_req_accept	(meta0_rdmc_rcr_req_accept),
			.meta0_rdmc_rcr_data_req	(meta0_rdmc_rcr_data_req),
			.meta0_rdmc_rcr_ack_ready	(meta0_rdmc_rcr_ack_ready),
			.meta0_rdmc_rcr_ack_cmd		(meta0_rdmc_rcr_ack_cmd),
			.meta0_rdmc_rcr_ack_cmd_status	(meta0_rdmc_rcr_ack_cmd_status),
			.meta0_rdmc_rcr_ack_client	(meta0_rdmc_rcr_ack_client),
			.meta0_rdmc_rcr_ack_dma_num	(meta0_rdmc_rcr_ack_dma_num),
			.muxed_shadw_rd_strobe_r	(muxed_shadw_rd_strobe_r),

			.rcr_wrbk_gnt			(rcr_wrbk_gnt),
                        .rcr_wrbk_done			(rcr_wrbk_done),
                        .rcr_wrbk_pkt_num		(rcr_wrbk_pkt_num),
			.rdmc_rcr_req_accept		(rdmc_rcr_req_accept),
                        .rdmc_rcr_ack_valid		(rdmc_rcr_ack_valid),
			.rdmc_rcr_ack_err		(rdmc_rcr_ack_err),
                        .rdmc_rcr_ack_dma_num		(rdmc_rcr_ack_dma_num),
                        .shadw_rd_strobe		(shadw_rd_strobe),
			.shadw_rd_data_reg		(shadw_rd_data_reg),
                        .rdmc_meta0_rcr_req		(rdmc_meta0_rcr_req),
                        .rdmc_meta0_rcr_req_cmd		(rdmc_meta0_rcr_req_cmd),
                        .rdmc_meta0_rcr_req_address	(rdmc_meta0_rcr_req_address),
                        .rdmc_meta0_rcr_req_length	(rdmc_meta0_rcr_req_length),
                        .rdmc_meta0_rcr_req_port_num	(rdmc_meta0_rcr_req_port_num),
                        .rdmc_meta0_rcr_req_dma_num	(rdmc_meta0_rcr_req_dma_num),
			.rdmc_meta0_rcr_req_func_num	(rdmc_meta0_rcr_req_func_num),

                        .rdmc_meta0_rcr_data_valid	(rdmc_meta0_rcr_data_valid),
                        .rdmc_meta0_rcr_data		(rdmc_meta0_rcr_data),
                        .rdmc_meta0_rcr_req_byteenable	(rdmc_meta0_rcr_req_byteenable),
                        .rdmc_meta0_rcr_transfer_comp	(rdmc_meta0_rcr_transfer_comp),
                        .rdmc_meta0_rcr_status		(rdmc_meta0_rcr_status),
                        .rdmc_meta0_rcr_ack_accept	(rdmc_meta0_rcr_ack_accept)

			);


niu_rdmc_chnl_master	niu_rdmc_chnl_master0 (
			.clk			(niu_clk),
                        .reset			(reset),
                        .wred_enable            (wred_enable),
			.random_num		(random_num),
			.clk_div_value		(clk_div_value),
                        .dma_chnl_grp_id	(`CHNL0),
                        .pio_wen		(pio_wen),
                        .pio_addr		(pio_addr),
                        .pio_wdata		(pio_wdata),
			.pio_32b_mode		(pio_32b_mode),
                        .muxed_pkt_len		(muxed_pkt_len),          //from wr_dp
                        .muxed_rdc_num_r	(muxed_rdc_num_r),        //from wr_dp
			.muxed_drop_pkt_r	(muxed_drop_pkt_r),
			.muxed_s_event_r	(muxed_s_event_r),
                        .sel_buf_en		(sel_buf_en),             //from wr_sched
			.pkt_req_cnt_e_done_mod	(pkt_req_cnt_e_done_mod),
			.pkt_buf_done		(pkt_buf_done),
			.is_hdr_wr_data		(is_hdr_wr_data),
			.is_jmb1_wr_data	(is_jmb1_wr_data),
			.wr_transfer_comp_int	(rdmc_meta0_wr_transfer_comp_int),
			.wr_last_pkt_data	(wr_last_pkt_data),
			.update_rcr_shadw	(update_rcr_shadw),
                        .cache_start_addr	(`CHNL0_CACHE_START_ADDR),
			.cache_end_addr		(`CHNL0_CACHE_END_ADDR),
                        .cache_buf_rd_gnt	(cache_buf_rd_gnt[0]),    //from cache_acc_ctrl
                        .cache_buf_rd_data	(cache_buf_rd_data),      //from cache_acc_ctrl
                        .fetch_desp_gnt		(fetch_desp_gnt[0]),      //from desp_acc_ctrl
                        .rdmc_resp_rdy_valid	(rdmc_resp_rdy_valid),    //from desp_acc_ctrl
			.rdmc_req_err		(rdmc_req_err),
			.rdmc_resp_cmd		(rdmc_resp_cmd),
			.rdmc_resp_cmd_status	(rdmc_resp_cmd_status),
			.rdmc_resp_data_status	(rdmc_resp_data_status),
                        .rdmc_resp_dma_num	(rdmc_resp_dma_num),
                        .rdmc_resp_data_valid	(rdmc_resp_data_valid),
                        .rdmc_resp_byteenable	(rdmc_resp_byteenable),
                        .rdmc_resp_comp		(rdmc_resp_comp),
                        .rdmc_resp_trans_comp	(rdmc_resp_trans_comp),
                        .resp_data_in_process	(resp_data_in_process),
			.shadw_start_addr       (`CHNL0_SHADW_START_ADDR),
                        .shadw_rd_end_addr      (`CHNL0_SHADW_RD_END_ADDR),
                        .shadw_wr_end_addr      (`CHNL0_SHADW_WR_END_ADDR),
                        .rdmc_wr_data_dma_num   (rdmc_wr_data_dma_num),
			.rcr_wrbk_gnt           (rcr_wrbk_gnt[0]),
                        .rcr_wrbk_done          (rcr_wrbk_done),
                        .rcr_wrbk_pkt_num       (rcr_wrbk_pkt_num),
                        .rdmc_rcr_ack_valid     (rdmc_rcr_ack_valid),
			.rdmc_rcr_ack_err	(rdmc_rcr_ack_err),
                        .rdmc_rcr_ack_dma_num   (rdmc_rcr_ack_dma_num),
			.cache_parity_err	(cache_parity_err),
			.shadw_parity_err	(shadw_parity_err),
			.data_err_event		(data_err_event),

			.pio_rd_gnt		(pio_rd_gnt0),
			.chnl_pio_rd_data	(chnl_pio_rd_data0),
			.rx_log_page_hdl_reg	(rx_log_page_hdl_reg0),
			.dma_func_num		(dma_func_num0),
                        .fetch_desp_req		(fetch_desp_req0),        //to desp_acc_ctrl
                        .fetch_desp_addr	(fetch_desp_addr0),       //to desp_acc_ctrl
                        .fetch_desp_num		(fetch_desp_numb0),       //to desp_acc_ctrl
                        .rdmc_resp_accept_sm	(rdmc_resp_accept_sm0),   //to desp_acc_ctrl
                        .fetch_desp_resp_vld	(fetch_desp_resp_vld0),   //to desp_acc_ctrl
                        .cache_read_req		(cache_read_req0),        //to cache_acc_ctrl
                        .cache_rd_ptr		(cache_rd_ptr0),          //to cache_acc_ctrl
                        .cache_wr_ptr		(cache_wr_ptr0),          //to cache_acc_ctrl
                        .full_header		(full_header0),           //to wr_sched
			.drop_pkt		(drop_pkt0),
                        .pkt_buf_gnt		(pkt_buf_gnt0),           //to wr_sched
			.pkt_buf_size		(pkt_buf_size0),
                        .pkt_buf_addr		(pkt_buf_addr0),	  //to wr_sched
			.orig_buf_addr		(orig_buf_addr0),
			.pref_buf_used_num	(pref_buf_used_num0),
			.pkt_trans_len		(pkt_trans_len0),
			.shadw_wr_en            (shadw_wr_en0),
                        .shadw_wr_even          (shadw_wr_even0),
                        .shadw_wr_ptr           (shadw_wr_ptr0),
                        .shadw_rd_ptr           (shadw_rd_ptr0),
			.mailbox_data		(mailbox_data0),
			.ldf_a                  (ldf_a0),
                        .ldf_b                  (ldf_b0),
                        .rcr_wrbk_req           (rcr_wrbk_req0),
                        .rcr_wrbk_addr          (rcr_wrbk_addr0),
                        .rcr_wrbk_numb          (rcr_wrbk_numb0),
                        .rcr_wrbk_data_type     (rcr_wrbk_data_type0),
                        .rcr_wrbk_sched         (rcr_wrbk_sched0),
                        .rcr_ack_accept         (rcr_ack_accept0)


			);

niu_rdmc_chnl_master    niu_rdmc_chnl_master1 (
                        .clk                    (niu_clk),
                        .reset                  (reset),
                        .wred_enable            (wred_enable),
			.random_num             (random_num),
			.clk_div_value    	(clk_div_value),
                        .dma_chnl_grp_id        (`CHNL1),
			.pio_32b_mode           (pio_32b_mode),
                        .pio_wen                (pio_wen),
                        .pio_addr          	(pio_addr),
                        .pio_wdata         	(pio_wdata),
                        .muxed_pkt_len          (muxed_pkt_len),          //from wr_dp
                        .muxed_rdc_num_r        (muxed_rdc_num_r),        //from wr_dp
                        .muxed_drop_pkt_r       (muxed_drop_pkt_r),
                        .muxed_s_event_r        (muxed_s_event_r),
                        .sel_buf_en             (sel_buf_en),             //from wr_sched
                        .pkt_req_cnt_e_done_mod (pkt_req_cnt_e_done_mod),
                        .pkt_buf_done           (pkt_buf_done),
                        .is_hdr_wr_data         (is_hdr_wr_data),
                        .is_jmb1_wr_data        (is_jmb1_wr_data),
                        .wr_transfer_comp_int   (rdmc_meta0_wr_transfer_comp_int),
                        .wr_last_pkt_data       (wr_last_pkt_data),
                        .update_rcr_shadw       (update_rcr_shadw),
                        .cache_start_addr       (`CHNL1_CACHE_START_ADDR),
			.cache_end_addr         (`CHNL1_CACHE_END_ADDR),
                        .cache_buf_rd_gnt       (cache_buf_rd_gnt[1]),    //from cache_acc_ctrl
                        .cache_buf_rd_data      (cache_buf_rd_data),      //from cache_acc_ctrl
                        .fetch_desp_gnt         (fetch_desp_gnt[1]),      //from desp_acc_ctrl
                        .rdmc_resp_rdy_valid    (rdmc_resp_rdy_valid),    //from desp_acc_ctrl
                        .rdmc_req_err           (rdmc_req_err),
                        .rdmc_resp_cmd          (rdmc_resp_cmd),
                        .rdmc_resp_cmd_status   (rdmc_resp_cmd_status),
                        .rdmc_resp_data_status  (rdmc_resp_data_status),
                        .rdmc_resp_dma_num      (rdmc_resp_dma_num),
                        .rdmc_resp_data_valid   (rdmc_resp_data_valid),
                        .rdmc_resp_byteenable   (rdmc_resp_byteenable),
                        .rdmc_resp_comp         (rdmc_resp_comp),
                        .rdmc_resp_trans_comp   (rdmc_resp_trans_comp),
                        .resp_data_in_process   (resp_data_in_process),
			.shadw_start_addr       (`CHNL1_SHADW_START_ADDR),
                        .shadw_rd_end_addr      (`CHNL1_SHADW_RD_END_ADDR),
                        .shadw_wr_end_addr      (`CHNL1_SHADW_WR_END_ADDR),
                        .rdmc_wr_data_dma_num   (rdmc_wr_data_dma_num),
                        .rcr_wrbk_gnt           (rcr_wrbk_gnt[1]),
                        .rcr_wrbk_done          (rcr_wrbk_done),
                        .rcr_wrbk_pkt_num       (rcr_wrbk_pkt_num),
                        .rdmc_rcr_ack_valid     (rdmc_rcr_ack_valid),
                        .rdmc_rcr_ack_err       (rdmc_rcr_ack_err),
                        .rdmc_rcr_ack_dma_num   (rdmc_rcr_ack_dma_num),
                        .cache_parity_err       (cache_parity_err),
                        .shadw_parity_err       (shadw_parity_err),
			.data_err_event         (data_err_event),

                        .pio_rd_gnt             (pio_rd_gnt1),
                        .chnl_pio_rd_data       (chnl_pio_rd_data1),
			.rx_log_page_hdl_reg    (rx_log_page_hdl_reg1),
                        .dma_func_num           (dma_func_num1),
                        .fetch_desp_req         (fetch_desp_req1),        //to desp_acc_ctrl
                        .fetch_desp_addr        (fetch_desp_addr1),       //to desp_acc_ctrl
                        .fetch_desp_num         (fetch_desp_numb1),       //to desp_acc_ctrl
                        .rdmc_resp_accept_sm    (rdmc_resp_accept_sm1),   //to desp_acc_ctrl
                        .fetch_desp_resp_vld    (fetch_desp_resp_vld1),   //to desp_acc_ctrl
                        .cache_read_req         (cache_read_req1),        //to cache_acc_ctrl
                        .cache_rd_ptr           (cache_rd_ptr1),          //to cache_acc_ctrl
                        .cache_wr_ptr           (cache_wr_ptr1),          //to cache_acc_ctrl
                        .full_header            (full_header1),           //to wr_sched
			.drop_pkt               (drop_pkt1),
                        .pkt_buf_gnt            (pkt_buf_gnt1),           //to wr_sched
			.pkt_buf_size           (pkt_buf_size1),
                        .pkt_buf_addr           (pkt_buf_addr1),          //to wr_sched
			.orig_buf_addr          (orig_buf_addr1),
                        .pref_buf_used_num      (pref_buf_used_num1),
                        .pkt_trans_len          (pkt_trans_len1),
			.shadw_wr_en            (shadw_wr_en1),
                        .shadw_wr_even          (shadw_wr_even1),
                        .shadw_wr_ptr           (shadw_wr_ptr1),
                        .shadw_rd_ptr           (shadw_rd_ptr1),
			.mailbox_data           (mailbox_data1),
			.ldf_a                  (ldf_a1),
                        .ldf_b                  (ldf_b1),
                        .rcr_wrbk_req           (rcr_wrbk_req1),
                        .rcr_wrbk_addr          (rcr_wrbk_addr1),
                        .rcr_wrbk_numb          (rcr_wrbk_numb1),
                        .rcr_wrbk_data_type     (rcr_wrbk_data_type1),
                        .rcr_wrbk_sched         (rcr_wrbk_sched1),
                        .rcr_ack_accept         (rcr_ack_accept1)

                        );

niu_rdmc_chnl_master    niu_rdmc_chnl_master2 (
                        .clk                    (niu_clk),
                        .reset                  (reset),
                        .wred_enable            (wred_enable),
			.random_num             (random_num),
			.clk_div_value          (clk_div_value),
                        .dma_chnl_grp_id        (`CHNL2),
                        .pio_32b_mode           (pio_32b_mode),
                        .pio_wen                (pio_wen_a),
                        .pio_addr          	(pio_addr_a),
                        .pio_wdata         	(pio_wdata),
                        .muxed_pkt_len          (muxed_pkt_len),          //from wr_dp
                        .muxed_rdc_num_r        (muxed_rdc_num_r),        //from wr_dp
                        .muxed_drop_pkt_r       (muxed_drop_pkt_r),
                        .muxed_s_event_r        (muxed_s_event_r),
                        .sel_buf_en             (sel_buf_en),             //from wr_sched
                        .pkt_req_cnt_e_done_mod (pkt_req_cnt_e_done_mod),
                        .pkt_buf_done           (pkt_buf_done),
                        .is_hdr_wr_data         (is_hdr_wr_data),
                        .is_jmb1_wr_data        (is_jmb1_wr_data),
                        .wr_transfer_comp_int   (rdmc_meta0_wr_transfer_comp_int),
                        .wr_last_pkt_data       (wr_last_pkt_data),
                        .update_rcr_shadw       (update_rcr_shadw),
                        .cache_start_addr       (`CHNL2_CACHE_START_ADDR),
			.cache_end_addr         (`CHNL2_CACHE_END_ADDR),
                        .cache_buf_rd_gnt       (cache_buf_rd_gnt[2]),    //from cache_acc_ctrl
                        .cache_buf_rd_data      (cache_buf_rd_data),      //from cache_acc_ctrl
                        .fetch_desp_gnt         (fetch_desp_gnt[2]),      //from desp_acc_ctrl
                        .rdmc_resp_rdy_valid    (rdmc_resp_rdy_valid),    //from desp_acc_ctrl
                        .rdmc_req_err           (rdmc_req_err),
                        .rdmc_resp_cmd          (rdmc_resp_cmd),
                        .rdmc_resp_cmd_status   (rdmc_resp_cmd_status),
                        .rdmc_resp_data_status  (rdmc_resp_data_status),
                        .rdmc_resp_dma_num      (rdmc_resp_dma_num),
                        .rdmc_resp_data_valid   (rdmc_resp_data_valid),
                        .rdmc_resp_byteenable   (rdmc_resp_byteenable),
                        .rdmc_resp_comp         (rdmc_resp_comp),
                        .rdmc_resp_trans_comp   (rdmc_resp_trans_comp),
                        .resp_data_in_process   (resp_data_in_process),
			.shadw_start_addr       (`CHNL2_SHADW_START_ADDR),
                        .shadw_rd_end_addr      (`CHNL2_SHADW_RD_END_ADDR),
                        .shadw_wr_end_addr      (`CHNL2_SHADW_WR_END_ADDR),
                        .rdmc_wr_data_dma_num   (rdmc_wr_data_dma_num),
                        .rcr_wrbk_gnt           (rcr_wrbk_gnt[2]),
                        .rcr_wrbk_done          (rcr_wrbk_done),
                        .rcr_wrbk_pkt_num       (rcr_wrbk_pkt_num),
                        .rdmc_rcr_ack_valid     (rdmc_rcr_ack_valid),
                        .rdmc_rcr_ack_err       (rdmc_rcr_ack_err),
                        .rdmc_rcr_ack_dma_num   (rdmc_rcr_ack_dma_num),
                        .cache_parity_err       (cache_parity_err),
                        .shadw_parity_err       (shadw_parity_err),
                        .data_err_event         (data_err_event),

                        .pio_rd_gnt             (pio_rd_gnt2),
                        .chnl_pio_rd_data       (chnl_pio_rd_data2),
			.rx_log_page_hdl_reg    (rx_log_page_hdl_reg2),
                        .dma_func_num           (dma_func_num2),
                        .fetch_desp_req         (fetch_desp_req2),        //to desp_acc_ctrl
                        .fetch_desp_addr        (fetch_desp_addr2),       //to desp_acc_ctrl
                        .fetch_desp_num         (fetch_desp_numb2),       //to desp_acc_ctrl
                        .rdmc_resp_accept_sm    (rdmc_resp_accept_sm2),   //to desp_acc_ctrl
                        .fetch_desp_resp_vld    (fetch_desp_resp_vld2),   //to desp_acc_ctrl
                        .cache_read_req       	(cache_read_req2),        //to cache_acc_ctrl
                        .cache_rd_ptr           (cache_rd_ptr2),          //to cache_acc_ctrl
                        .cache_wr_ptr           (cache_wr_ptr2),          //to cache_acc_ctrl
                        .full_header            (full_header2),           //to wr_sched
                        .drop_pkt               (drop_pkt2),
                        .pkt_buf_gnt            (pkt_buf_gnt2),           //to wr_sched
			.pkt_buf_size           (pkt_buf_size2),
                        .pkt_buf_addr           (pkt_buf_addr2),          //to wr_sched
                        .orig_buf_addr          (orig_buf_addr2),
                        .pref_buf_used_num      (pref_buf_used_num2),
                        .pkt_trans_len          (pkt_trans_len2),
			.shadw_wr_en            (shadw_wr_en2),
                        .shadw_wr_even          (shadw_wr_even2),
                        .shadw_wr_ptr           (shadw_wr_ptr2),
                        .shadw_rd_ptr           (shadw_rd_ptr2),
			.mailbox_data           (mailbox_data2),
			.ldf_a                  (ldf_a2),
                        .ldf_b                  (ldf_b2),
                        .rcr_wrbk_req           (rcr_wrbk_req2),
                        .rcr_wrbk_addr          (rcr_wrbk_addr2),
                        .rcr_wrbk_numb          (rcr_wrbk_numb2),
                        .rcr_wrbk_data_type     (rcr_wrbk_data_type2),
                        .rcr_wrbk_sched         (rcr_wrbk_sched2),
                        .rcr_ack_accept         (rcr_ack_accept2)

                        );

niu_rdmc_chnl_master    niu_rdmc_chnl_master3 (
                        .clk                    (niu_clk),
                        .reset                  (reset),
                        .wred_enable            (wred_enable),
			.random_num             (random_num),
			.clk_div_value          (clk_div_value),
                        .dma_chnl_grp_id        (`CHNL3),
                        .pio_32b_mode           (pio_32b_mode),
                        .pio_wen                (pio_wen_a),
                        .pio_addr          	(pio_addr_a),
                        .pio_wdata         	(pio_wdata),
                        .muxed_pkt_len          (muxed_pkt_len),          //from wr_dp
                        .muxed_rdc_num_r        (muxed_rdc_num_r),        //from wr_dp
                        .muxed_drop_pkt_r       (muxed_drop_pkt_r),
                        .muxed_s_event_r        (muxed_s_event_r),
                        .sel_buf_en             (sel_buf_en),             //from wr_sched
                        .pkt_req_cnt_e_done_mod (pkt_req_cnt_e_done_mod),
                        .pkt_buf_done           (pkt_buf_done),
                        .is_hdr_wr_data         (is_hdr_wr_data),
                        .is_jmb1_wr_data        (is_jmb1_wr_data),
                        .wr_transfer_comp_int   (rdmc_meta0_wr_transfer_comp_int),
                        .wr_last_pkt_data       (wr_last_pkt_data),
                        .update_rcr_shadw       (update_rcr_shadw),
                        .cache_start_addr       (`CHNL3_CACHE_START_ADDR),
			.cache_end_addr         (`CHNL3_CACHE_END_ADDR),
                        .cache_buf_rd_gnt       (cache_buf_rd_gnt[3]),    //from cache_acc_ctrl
                        .cache_buf_rd_data      (cache_buf_rd_data),      //from cache_acc_ctrl
                        .fetch_desp_gnt         (fetch_desp_gnt[3]),      //from desp_acc_ctrl
                        .rdmc_resp_rdy_valid    (rdmc_resp_rdy_valid),    //from desp_acc_ctrl
                        .rdmc_req_err           (rdmc_req_err),
                        .rdmc_resp_cmd          (rdmc_resp_cmd),
                        .rdmc_resp_cmd_status   (rdmc_resp_cmd_status),
                        .rdmc_resp_data_status  (rdmc_resp_data_status),
                        .rdmc_resp_dma_num      (rdmc_resp_dma_num),
                        .rdmc_resp_data_valid   (rdmc_resp_data_valid),
                        .rdmc_resp_byteenable   (rdmc_resp_byteenable),
                        .rdmc_resp_comp         (rdmc_resp_comp),
                        .rdmc_resp_trans_comp   (rdmc_resp_trans_comp),
                        .resp_data_in_process   (resp_data_in_process),
			.shadw_start_addr       (`CHNL3_SHADW_START_ADDR),
                        .shadw_rd_end_addr      (`CHNL3_SHADW_RD_END_ADDR),
                        .shadw_wr_end_addr      (`CHNL3_SHADW_WR_END_ADDR),
                        .rdmc_wr_data_dma_num   (rdmc_wr_data_dma_num),
                        .rcr_wrbk_gnt           (rcr_wrbk_gnt[3]),
                        .rcr_wrbk_done          (rcr_wrbk_done),
                        .rcr_wrbk_pkt_num       (rcr_wrbk_pkt_num),
                        .rdmc_rcr_ack_valid     (rdmc_rcr_ack_valid),
                        .rdmc_rcr_ack_err       (rdmc_rcr_ack_err),
                        .rdmc_rcr_ack_dma_num   (rdmc_rcr_ack_dma_num),
                        .cache_parity_err       (cache_parity_err),
                        .shadw_parity_err       (shadw_parity_err),
                        .data_err_event         (data_err_event),

                        .pio_rd_gnt             (pio_rd_gnt3),
                        .chnl_pio_rd_data       (chnl_pio_rd_data3),
			.rx_log_page_hdl_reg    (rx_log_page_hdl_reg3),
                        .dma_func_num           (dma_func_num3),
                        .fetch_desp_req         (fetch_desp_req3),        //to desp_acc_ctrl
                        .fetch_desp_addr        (fetch_desp_addr3),       //to desp_acc_ctrl
                        .fetch_desp_num         (fetch_desp_numb3),       //to desp_acc_ctrl
                        .rdmc_resp_accept_sm    (rdmc_resp_accept_sm3),   //to desp_acc_ctrl
                        .fetch_desp_resp_vld    (fetch_desp_resp_vld3),   //to desp_acc_ctrl
                        .cache_read_req         (cache_read_req3),        //to cache_acc_ctrl
                        .cache_rd_ptr           (cache_rd_ptr3),          //to cache_acc_ctrl
                        .cache_wr_ptr           (cache_wr_ptr3),          //to cache_acc_ctrl
                        .full_header            (full_header3),           //to wr_sched
                        .drop_pkt               (drop_pkt3),
                        .pkt_buf_gnt            (pkt_buf_gnt3),           //to wr_sched
			.pkt_buf_size           (pkt_buf_size3),
                        .pkt_buf_addr           (pkt_buf_addr3),          //to wr_sched
                        .orig_buf_addr          (orig_buf_addr3),
                        .pref_buf_used_num      (pref_buf_used_num3),
                        .pkt_trans_len          (pkt_trans_len3),
			.shadw_wr_en            (shadw_wr_en3),
                        .shadw_wr_even          (shadw_wr_even3),
                        .shadw_wr_ptr           (shadw_wr_ptr3),
                        .shadw_rd_ptr           (shadw_rd_ptr3),
			.mailbox_data           (mailbox_data3),
			.ldf_a			(ldf_a3),
			.ldf_b			(ldf_b3),
                        .rcr_wrbk_req           (rcr_wrbk_req3),
                        .rcr_wrbk_addr          (rcr_wrbk_addr3),
                        .rcr_wrbk_numb          (rcr_wrbk_numb3),
                        .rcr_wrbk_data_type     (rcr_wrbk_data_type3),
                        .rcr_wrbk_sched         (rcr_wrbk_sched3),
                        .rcr_ack_accept         (rcr_ack_accept3)

                        );


niu_rdmc_chnl_master    niu_rdmc_chnl_master4 (
                        .clk                    (niu_clk),
                        .reset                  (reset),
                        .wred_enable            (wred_enable),
			.random_num             (random_num),
                        .clk_div_value          (clk_div_value),
                        .dma_chnl_grp_id        (`CHNL4),
                        .pio_32b_mode           (pio_32b_mode),
                        .pio_wen                (pio_wen_a),
                        .pio_addr               (pio_addr_a),
                        .pio_wdata              (pio_wdata),
                        .muxed_pkt_len          (muxed_pkt_len),          //from wr_dp
                        .muxed_rdc_num_r        (muxed_rdc_num_r),        //from wr_dp
                        .muxed_drop_pkt_r       (muxed_drop_pkt_r),
                        .muxed_s_event_r        (muxed_s_event_r),
                        .sel_buf_en             (sel_buf_en),             //from wr_sched
                        .pkt_req_cnt_e_done_mod (pkt_req_cnt_e_done_mod),
                        .pkt_buf_done           (pkt_buf_done),
                        .is_hdr_wr_data         (is_hdr_wr_data),
                        .is_jmb1_wr_data        (is_jmb1_wr_data),
                        .wr_transfer_comp_int   (rdmc_meta0_wr_transfer_comp_int),
                        .wr_last_pkt_data       (wr_last_pkt_data),
                        .update_rcr_shadw       (update_rcr_shadw),
                        .cache_start_addr       (`CHNL4_CACHE_START_ADDR),
                        .cache_end_addr         (`CHNL4_CACHE_END_ADDR),
                        .cache_buf_rd_gnt       (cache_buf_rd_gnt[4]),    //from cache_acc_ctrl
                        .cache_buf_rd_data      (cache_buf_rd_data),      //from cache_acc_ctrl
                        .fetch_desp_gnt         (fetch_desp_gnt[4]),      //from desp_acc_ctrl
                        .rdmc_resp_rdy_valid    (rdmc_resp_rdy_valid),    //from desp_acc_ctrl
                        .rdmc_req_err           (rdmc_req_err),
                        .rdmc_resp_cmd          (rdmc_resp_cmd),
                        .rdmc_resp_cmd_status   (rdmc_resp_cmd_status),
                        .rdmc_resp_data_status  (rdmc_resp_data_status),
                        .rdmc_resp_dma_num      (rdmc_resp_dma_num),
                        .rdmc_resp_data_valid   (rdmc_resp_data_valid),
                        .rdmc_resp_byteenable   (rdmc_resp_byteenable),
                        .rdmc_resp_comp         (rdmc_resp_comp),
                        .rdmc_resp_trans_comp   (rdmc_resp_trans_comp),
                        .resp_data_in_process   (resp_data_in_process),
                        .shadw_start_addr       (`CHNL4_SHADW_START_ADDR),
                        .shadw_rd_end_addr      (`CHNL4_SHADW_RD_END_ADDR),
                        .shadw_wr_end_addr      (`CHNL4_SHADW_WR_END_ADDR),
                        .rdmc_wr_data_dma_num   (rdmc_wr_data_dma_num),
                        .rcr_wrbk_gnt           (rcr_wrbk_gnt[4]),
                        .rcr_wrbk_done          (rcr_wrbk_done),
                        .rcr_wrbk_pkt_num       (rcr_wrbk_pkt_num),
                        .rdmc_rcr_ack_valid     (rdmc_rcr_ack_valid),
                        .rdmc_rcr_ack_err       (rdmc_rcr_ack_err),
                        .rdmc_rcr_ack_dma_num   (rdmc_rcr_ack_dma_num),
                        .cache_parity_err       (cache_parity_err),
                        .shadw_parity_err       (shadw_parity_err),
                        .data_err_event         (data_err_event),

                        .pio_rd_gnt             (pio_rd_gnt4),
                        .chnl_pio_rd_data       (chnl_pio_rd_data4),
			.rx_log_page_hdl_reg    (rx_log_page_hdl_reg4),
                        .dma_func_num           (dma_func_num4),
                        .fetch_desp_req         (fetch_desp_req4),        //to desp_acc_ctrl
                        .fetch_desp_addr        (fetch_desp_addr4),       //to desp_acc_ctrl
                        .fetch_desp_num         (fetch_desp_numb4),       //to desp_acc_ctrl
                        .rdmc_resp_accept_sm    (rdmc_resp_accept_sm4),   //to desp_acc_ctrl
                        .fetch_desp_resp_vld    (fetch_desp_resp_vld4),   //to desp_acc_ctrl
                        .cache_read_req         (cache_read_req4),        //to cache_acc_ctrl
                        .cache_rd_ptr           (cache_rd_ptr4),          //to cache_acc_ctrl
                        .cache_wr_ptr           (cache_wr_ptr4),          //to cache_acc_ctrl
                        .full_header            (full_header4),           //to wr_sched
                        .drop_pkt               (drop_pkt4),
                        .pkt_buf_gnt            (pkt_buf_gnt4),           //to wr_sched
                        .pkt_buf_size           (pkt_buf_size4),
                        .pkt_buf_addr           (pkt_buf_addr4),          //to wr_sched
                        .orig_buf_addr          (orig_buf_addr4),
                        .pref_buf_used_num      (pref_buf_used_num4),
                        .pkt_trans_len          (pkt_trans_len4),
                        .shadw_wr_en            (shadw_wr_en4),
                        .shadw_wr_even          (shadw_wr_even4),
                        .shadw_wr_ptr           (shadw_wr_ptr4),
                        .shadw_rd_ptr           (shadw_rd_ptr4),
                        .mailbox_data           (mailbox_data4),
                        .ldf_a                  (ldf_a4),
                        .ldf_b                  (ldf_b4),
                        .rcr_wrbk_req           (rcr_wrbk_req4),
                        .rcr_wrbk_addr          (rcr_wrbk_addr4),
                        .rcr_wrbk_numb          (rcr_wrbk_numb4),
                        .rcr_wrbk_data_type     (rcr_wrbk_data_type4),
                        .rcr_wrbk_sched         (rcr_wrbk_sched4),
                        .rcr_ack_accept         (rcr_ack_accept4)

                        );

niu_rdmc_chnl_master    niu_rdmc_chnl_master5 (
                        .clk                    (niu_clk),
                        .reset                  (reset),
                        .wred_enable            (wred_enable),
			.random_num             (random_num),
                        .clk_div_value          (clk_div_value),
                        .dma_chnl_grp_id        (`CHNL5),
                        .pio_32b_mode           (pio_32b_mode),
                        .pio_wen                (pio_wen_a),
                        .pio_addr               (pio_addr_a),
                        .pio_wdata              (pio_wdata),
                        .muxed_pkt_len          (muxed_pkt_len),          //from wr_dp
                        .muxed_rdc_num_r        (muxed_rdc_num_r),        //from wr_dp
                        .muxed_drop_pkt_r       (muxed_drop_pkt_r),
                        .muxed_s_event_r        (muxed_s_event_r),
                        .sel_buf_en             (sel_buf_en),             //from wr_sched
                        .pkt_req_cnt_e_done_mod (pkt_req_cnt_e_done_mod),
                        .pkt_buf_done           (pkt_buf_done),
                        .is_hdr_wr_data         (is_hdr_wr_data),
                        .is_jmb1_wr_data        (is_jmb1_wr_data),
                        .wr_transfer_comp_int   (rdmc_meta0_wr_transfer_comp_int),
                        .wr_last_pkt_data       (wr_last_pkt_data),
                        .update_rcr_shadw       (update_rcr_shadw),
                        .cache_start_addr       (`CHNL5_CACHE_START_ADDR),
                        .cache_end_addr         (`CHNL5_CACHE_END_ADDR),
                        .cache_buf_rd_gnt       (cache_buf_rd_gnt[5]),    //from cache_acc_ctrl
                        .cache_buf_rd_data      (cache_buf_rd_data),      //from cache_acc_ctrl
                        .fetch_desp_gnt         (fetch_desp_gnt[5]),      //from desp_acc_ctrl
                        .rdmc_resp_rdy_valid    (rdmc_resp_rdy_valid),    //from desp_acc_ctrl
                        .rdmc_req_err           (rdmc_req_err),
                        .rdmc_resp_cmd          (rdmc_resp_cmd),
                        .rdmc_resp_cmd_status   (rdmc_resp_cmd_status),
                        .rdmc_resp_data_status  (rdmc_resp_data_status),
                        .rdmc_resp_dma_num      (rdmc_resp_dma_num),
                        .rdmc_resp_data_valid   (rdmc_resp_data_valid),
                        .rdmc_resp_byteenable   (rdmc_resp_byteenable),
                        .rdmc_resp_comp         (rdmc_resp_comp),
                        .rdmc_resp_trans_comp   (rdmc_resp_trans_comp),
                        .resp_data_in_process   (resp_data_in_process),
                        .shadw_start_addr       (`CHNL5_SHADW_START_ADDR),
                        .shadw_rd_end_addr      (`CHNL5_SHADW_RD_END_ADDR),
                        .shadw_wr_end_addr      (`CHNL5_SHADW_WR_END_ADDR),
                        .rdmc_wr_data_dma_num   (rdmc_wr_data_dma_num),
                        .rcr_wrbk_gnt           (rcr_wrbk_gnt[5]),
                        .rcr_wrbk_done          (rcr_wrbk_done),
                        .rcr_wrbk_pkt_num       (rcr_wrbk_pkt_num),
                        .rdmc_rcr_ack_valid     (rdmc_rcr_ack_valid),
                        .rdmc_rcr_ack_err       (rdmc_rcr_ack_err),
                        .rdmc_rcr_ack_dma_num   (rdmc_rcr_ack_dma_num),
                        .cache_parity_err       (cache_parity_err),
                        .shadw_parity_err       (shadw_parity_err),
                        .data_err_event         (data_err_event),

                        .pio_rd_gnt             (pio_rd_gnt5),
                        .chnl_pio_rd_data       (chnl_pio_rd_data5),
			.rx_log_page_hdl_reg    (rx_log_page_hdl_reg5),
                        .dma_func_num           (dma_func_num5),
                        .fetch_desp_req         (fetch_desp_req5),        //to desp_acc_ctrl
                        .fetch_desp_addr        (fetch_desp_addr5),       //to desp_acc_ctrl
                        .fetch_desp_num         (fetch_desp_numb5),       //to desp_acc_ctrl
                        .rdmc_resp_accept_sm    (rdmc_resp_accept_sm5),   //to desp_acc_ctrl
                        .fetch_desp_resp_vld    (fetch_desp_resp_vld5),   //to desp_acc_ctrl
                        .cache_read_req         (cache_read_req5),        //to cache_acc_ctrl
                        .cache_rd_ptr           (cache_rd_ptr5),          //to cache_acc_ctrl
                        .cache_wr_ptr           (cache_wr_ptr5),          //to cache_acc_ctrl
                        .full_header            (full_header5),           //to wr_sched
                        .drop_pkt               (drop_pkt5),
                        .pkt_buf_gnt            (pkt_buf_gnt5),           //to wr_sched
                        .pkt_buf_size           (pkt_buf_size5),
                        .pkt_buf_addr           (pkt_buf_addr5),          //to wr_sched
                        .orig_buf_addr          (orig_buf_addr5),
                        .pref_buf_used_num      (pref_buf_used_num5),
                        .pkt_trans_len          (pkt_trans_len5),
                        .shadw_wr_en            (shadw_wr_en5),
                        .shadw_wr_even          (shadw_wr_even5),
                        .shadw_wr_ptr           (shadw_wr_ptr5),
                        .shadw_rd_ptr           (shadw_rd_ptr5),
                        .mailbox_data           (mailbox_data5),
                        .ldf_a                  (ldf_a5),
                        .ldf_b                  (ldf_b5),
                        .rcr_wrbk_req           (rcr_wrbk_req5),
                        .rcr_wrbk_addr          (rcr_wrbk_addr5),
                        .rcr_wrbk_numb          (rcr_wrbk_numb5),
                        .rcr_wrbk_data_type     (rcr_wrbk_data_type5),
                        .rcr_wrbk_sched         (rcr_wrbk_sched5),
                        .rcr_ack_accept         (rcr_ack_accept5)

                        );

niu_rdmc_chnl_master    niu_rdmc_chnl_master6 (
                        .clk                    (niu_clk),
                        .reset                  (reset),
                        .wred_enable            (wred_enable),
			.random_num             (random_num),
                        .clk_div_value          (clk_div_value),
                        .dma_chnl_grp_id        (`CHNL6),
                        .pio_32b_mode           (pio_32b_mode),
                        .pio_wen                (pio_wen_a),
                        .pio_addr               (pio_addr_a),
                        .pio_wdata              (pio_wdata),
                        .muxed_pkt_len          (muxed_pkt_len),          //from wr_dp
                        .muxed_rdc_num_r        (muxed_rdc_num_r),        //from wr_dp
                        .muxed_drop_pkt_r       (muxed_drop_pkt_r),
                        .muxed_s_event_r        (muxed_s_event_r),
                        .sel_buf_en             (sel_buf_en),             //from wr_sched
                        .pkt_req_cnt_e_done_mod (pkt_req_cnt_e_done_mod),
                        .pkt_buf_done           (pkt_buf_done),
                        .is_hdr_wr_data         (is_hdr_wr_data),
                        .is_jmb1_wr_data        (is_jmb1_wr_data),
                        .wr_transfer_comp_int   (rdmc_meta0_wr_transfer_comp_int),
                        .wr_last_pkt_data       (wr_last_pkt_data),
                        .update_rcr_shadw       (update_rcr_shadw),
                        .cache_start_addr       (`CHNL6_CACHE_START_ADDR),
                        .cache_end_addr         (`CHNL6_CACHE_END_ADDR),
                        .cache_buf_rd_gnt       (cache_buf_rd_gnt[6]),    //from cache_acc_ctrl
                        .cache_buf_rd_data      (cache_buf_rd_data),      //from cache_acc_ctrl
                        .fetch_desp_gnt         (fetch_desp_gnt[6]),      //from desp_acc_ctrl
                        .rdmc_resp_rdy_valid    (rdmc_resp_rdy_valid),    //from desp_acc_ctrl
                        .rdmc_req_err           (rdmc_req_err),
                        .rdmc_resp_cmd          (rdmc_resp_cmd),
                        .rdmc_resp_cmd_status   (rdmc_resp_cmd_status),
                        .rdmc_resp_data_status  (rdmc_resp_data_status),
                        .rdmc_resp_dma_num      (rdmc_resp_dma_num),
                        .rdmc_resp_data_valid   (rdmc_resp_data_valid),
                        .rdmc_resp_byteenable   (rdmc_resp_byteenable),
                        .rdmc_resp_comp         (rdmc_resp_comp),
                        .rdmc_resp_trans_comp   (rdmc_resp_trans_comp),
                        .resp_data_in_process   (resp_data_in_process),
                        .shadw_start_addr       (`CHNL6_SHADW_START_ADDR),
                        .shadw_rd_end_addr      (`CHNL6_SHADW_RD_END_ADDR),
                        .shadw_wr_end_addr      (`CHNL6_SHADW_WR_END_ADDR),
                        .rdmc_wr_data_dma_num   (rdmc_wr_data_dma_num),
                        .rcr_wrbk_gnt           (rcr_wrbk_gnt[6]),
                        .rcr_wrbk_done          (rcr_wrbk_done),
                        .rcr_wrbk_pkt_num       (rcr_wrbk_pkt_num),
                        .rdmc_rcr_ack_valid     (rdmc_rcr_ack_valid),
                        .rdmc_rcr_ack_err       (rdmc_rcr_ack_err),
                        .rdmc_rcr_ack_dma_num   (rdmc_rcr_ack_dma_num),
                        .cache_parity_err       (cache_parity_err),
                        .shadw_parity_err       (shadw_parity_err),
                        .data_err_event         (data_err_event),

                        .pio_rd_gnt             (pio_rd_gnt6),
                        .chnl_pio_rd_data       (chnl_pio_rd_data6),
			.rx_log_page_hdl_reg    (rx_log_page_hdl_reg6),
                        .dma_func_num           (dma_func_num6),
                        .fetch_desp_req         (fetch_desp_req6),        //to desp_acc_ctrl
                        .fetch_desp_addr        (fetch_desp_addr6),       //to desp_acc_ctrl
                        .fetch_desp_num         (fetch_desp_numb6),       //to desp_acc_ctrl
                        .rdmc_resp_accept_sm    (rdmc_resp_accept_sm6),   //to desp_acc_ctrl
                        .fetch_desp_resp_vld    (fetch_desp_resp_vld6),   //to desp_acc_ctrl
                        .cache_read_req         (cache_read_req6),        //to cache_acc_ctrl
                        .cache_rd_ptr           (cache_rd_ptr6),          //to cache_acc_ctrl
                        .cache_wr_ptr           (cache_wr_ptr6),          //to cache_acc_ctrl
                        .full_header            (full_header6),           //to wr_sched
                        .drop_pkt               (drop_pkt6),
                        .pkt_buf_gnt            (pkt_buf_gnt6),           //to wr_sched
                        .pkt_buf_size           (pkt_buf_size6),
                        .pkt_buf_addr           (pkt_buf_addr6),          //to wr_sched
                        .orig_buf_addr          (orig_buf_addr6),
                        .pref_buf_used_num      (pref_buf_used_num6),
                        .pkt_trans_len          (pkt_trans_len6),
                        .shadw_wr_en            (shadw_wr_en6),
                        .shadw_wr_even          (shadw_wr_even6),
                        .shadw_wr_ptr           (shadw_wr_ptr6),
                        .shadw_rd_ptr           (shadw_rd_ptr6),
                        .mailbox_data           (mailbox_data6),
                        .ldf_a                  (ldf_a6),
                        .ldf_b                  (ldf_b6),
                        .rcr_wrbk_req           (rcr_wrbk_req6),
                        .rcr_wrbk_addr          (rcr_wrbk_addr6),
                        .rcr_wrbk_numb          (rcr_wrbk_numb6),
                        .rcr_wrbk_data_type     (rcr_wrbk_data_type6),
                        .rcr_wrbk_sched         (rcr_wrbk_sched6),
                        .rcr_ack_accept         (rcr_ack_accept6)

                        );

niu_rdmc_chnl_master    niu_rdmc_chnl_master7 (
                        .clk                    (niu_clk),
                        .reset                  (reset),
                        .wred_enable            (wred_enable),
			.random_num             (random_num),
                        .clk_div_value          (clk_div_value),
                        .dma_chnl_grp_id        (`CHNL7),
                        .pio_32b_mode           (pio_32b_mode),
                        .pio_wen                (pio_wen_b),
                        .pio_addr               (pio_addr_b),
                        .pio_wdata              (pio_wdata),
                        .muxed_pkt_len          (muxed_pkt_len),          //from wr_dp
                        .muxed_rdc_num_r        (muxed_rdc_num_r),        //from wr_dp
                        .muxed_drop_pkt_r       (muxed_drop_pkt_r),
                        .muxed_s_event_r        (muxed_s_event_r),
                        .sel_buf_en             (sel_buf_en),             //from wr_sched
                        .pkt_req_cnt_e_done_mod (pkt_req_cnt_e_done_mod),
                        .pkt_buf_done           (pkt_buf_done),
                        .is_hdr_wr_data         (is_hdr_wr_data),
                        .is_jmb1_wr_data        (is_jmb1_wr_data),
                        .wr_transfer_comp_int   (rdmc_meta0_wr_transfer_comp_int),
                        .wr_last_pkt_data       (wr_last_pkt_data),
                        .update_rcr_shadw       (update_rcr_shadw),
                        .cache_start_addr       (`CHNL7_CACHE_START_ADDR),
                        .cache_end_addr         (`CHNL7_CACHE_END_ADDR),
                        .cache_buf_rd_gnt       (cache_buf_rd_gnt[7]),    //from cache_acc_ctrl
                        .cache_buf_rd_data      (cache_buf_rd_data),      //from cache_acc_ctrl
                        .fetch_desp_gnt         (fetch_desp_gnt[7]),      //from desp_acc_ctrl
                        .rdmc_resp_rdy_valid    (rdmc_resp_rdy_valid),    //from desp_acc_ctrl
                        .rdmc_req_err           (rdmc_req_err),
                        .rdmc_resp_cmd          (rdmc_resp_cmd),
                        .rdmc_resp_cmd_status   (rdmc_resp_cmd_status),
                        .rdmc_resp_data_status  (rdmc_resp_data_status),
                        .rdmc_resp_dma_num      (rdmc_resp_dma_num),
                        .rdmc_resp_data_valid   (rdmc_resp_data_valid),
                        .rdmc_resp_byteenable   (rdmc_resp_byteenable),
                        .rdmc_resp_comp         (rdmc_resp_comp),
                        .rdmc_resp_trans_comp   (rdmc_resp_trans_comp),
                        .resp_data_in_process   (resp_data_in_process),
                        .shadw_start_addr       (`CHNL7_SHADW_START_ADDR),
                        .shadw_rd_end_addr      (`CHNL7_SHADW_RD_END_ADDR),
                        .shadw_wr_end_addr      (`CHNL7_SHADW_WR_END_ADDR),
                        .rdmc_wr_data_dma_num   (rdmc_wr_data_dma_num),
                        .rcr_wrbk_gnt           (rcr_wrbk_gnt[7]),
                        .rcr_wrbk_done          (rcr_wrbk_done),
                        .rcr_wrbk_pkt_num       (rcr_wrbk_pkt_num),
                        .rdmc_rcr_ack_valid     (rdmc_rcr_ack_valid),
                        .rdmc_rcr_ack_err       (rdmc_rcr_ack_err),
                        .rdmc_rcr_ack_dma_num   (rdmc_rcr_ack_dma_num),
                        .cache_parity_err       (cache_parity_err),
                        .shadw_parity_err       (shadw_parity_err),
                        .data_err_event         (data_err_event),

                        .pio_rd_gnt             (pio_rd_gnt7),
                        .chnl_pio_rd_data       (chnl_pio_rd_data7),
			.rx_log_page_hdl_reg    (rx_log_page_hdl_reg7),
                        .dma_func_num           (dma_func_num7),
                        .fetch_desp_req         (fetch_desp_req7),        //to desp_acc_ctrl
                        .fetch_desp_addr        (fetch_desp_addr7),       //to desp_acc_ctrl
                        .fetch_desp_num         (fetch_desp_numb7),       //to desp_acc_ctrl
                        .rdmc_resp_accept_sm    (rdmc_resp_accept_sm7),   //to desp_acc_ctrl
                        .fetch_desp_resp_vld    (fetch_desp_resp_vld7),   //to desp_acc_ctrl
                        .cache_read_req         (cache_read_req7),        //to cache_acc_ctrl
                        .cache_rd_ptr           (cache_rd_ptr7),          //to cache_acc_ctrl
                        .cache_wr_ptr           (cache_wr_ptr7),          //to cache_acc_ctrl
                        .full_header            (full_header7),           //to wr_sched
                        .drop_pkt               (drop_pkt7),
                        .pkt_buf_gnt            (pkt_buf_gnt7),           //to wr_sched
                        .pkt_buf_size           (pkt_buf_size7),
                        .pkt_buf_addr           (pkt_buf_addr7),          //to wr_sched
                        .orig_buf_addr          (orig_buf_addr7),
                        .pref_buf_used_num      (pref_buf_used_num7),
                        .pkt_trans_len          (pkt_trans_len7),
                        .shadw_wr_en            (shadw_wr_en7),
                        .shadw_wr_even          (shadw_wr_even7),
                        .shadw_wr_ptr           (shadw_wr_ptr7),
                        .shadw_rd_ptr           (shadw_rd_ptr7),
                        .mailbox_data           (mailbox_data7),
                        .ldf_a                  (ldf_a7),
                        .ldf_b                  (ldf_b7),
                        .rcr_wrbk_req           (rcr_wrbk_req7),
                        .rcr_wrbk_addr          (rcr_wrbk_addr7),
                        .rcr_wrbk_numb          (rcr_wrbk_numb7),
                        .rcr_wrbk_data_type     (rcr_wrbk_data_type7),
                        .rcr_wrbk_sched         (rcr_wrbk_sched7),
                        .rcr_ack_accept         (rcr_ack_accept7)

                        );

niu_rdmc_chnl_master    niu_rdmc_chnl_master8 (
                        .clk                    (niu_clk),
                        .reset                  (reset),
                        .wred_enable            (wred_enable),
			.random_num             (random_num),
                        .clk_div_value          (clk_div_value),
                        .dma_chnl_grp_id        (`CHNL8),
                        .pio_32b_mode           (pio_32b_mode),
                        .pio_wen                (pio_wen_b),
                        .pio_addr               (pio_addr_b),
                        .pio_wdata              (pio_wdata),
                        .muxed_pkt_len          (muxed_pkt_len),          //from wr_dp
                        .muxed_rdc_num_r        (muxed_rdc_num_r),        //from wr_dp
                        .muxed_drop_pkt_r       (muxed_drop_pkt_r),
                        .muxed_s_event_r        (muxed_s_event_r),
                        .sel_buf_en             (sel_buf_en),             //from wr_sched
                        .pkt_req_cnt_e_done_mod (pkt_req_cnt_e_done_mod),
                        .pkt_buf_done           (pkt_buf_done),
                        .is_hdr_wr_data         (is_hdr_wr_data),
                        .is_jmb1_wr_data        (is_jmb1_wr_data),
                        .wr_transfer_comp_int   (rdmc_meta0_wr_transfer_comp_int),
                        .wr_last_pkt_data       (wr_last_pkt_data),
                        .update_rcr_shadw       (update_rcr_shadw),
                        .cache_start_addr       (`CHNL8_CACHE_START_ADDR),
                        .cache_end_addr         (`CHNL8_CACHE_END_ADDR),
                        .cache_buf_rd_gnt       (cache_buf_rd_gnt[8]),    //from cache_acc_ctrl
                        .cache_buf_rd_data      (cache_buf_rd_data),      //from cache_acc_ctrl
                        .fetch_desp_gnt         (fetch_desp_gnt[8]),      //from desp_acc_ctrl
                        .rdmc_resp_rdy_valid    (rdmc_resp_rdy_valid),    //from desp_acc_ctrl
                        .rdmc_req_err           (rdmc_req_err),
                        .rdmc_resp_cmd          (rdmc_resp_cmd),
                        .rdmc_resp_cmd_status   (rdmc_resp_cmd_status),
                        .rdmc_resp_data_status  (rdmc_resp_data_status),
                        .rdmc_resp_dma_num      (rdmc_resp_dma_num),
                        .rdmc_resp_data_valid   (rdmc_resp_data_valid),
                        .rdmc_resp_byteenable   (rdmc_resp_byteenable),
                        .rdmc_resp_comp         (rdmc_resp_comp),
                        .rdmc_resp_trans_comp   (rdmc_resp_trans_comp),
                        .resp_data_in_process   (resp_data_in_process),
                        .shadw_start_addr       (`CHNL8_SHADW_START_ADDR),
                        .shadw_rd_end_addr      (`CHNL8_SHADW_RD_END_ADDR),
                        .shadw_wr_end_addr      (`CHNL8_SHADW_WR_END_ADDR),
                        .rdmc_wr_data_dma_num   (rdmc_wr_data_dma_num),
                        .rcr_wrbk_gnt           (rcr_wrbk_gnt[8]),
                        .rcr_wrbk_done          (rcr_wrbk_done),
                        .rcr_wrbk_pkt_num       (rcr_wrbk_pkt_num),
                        .rdmc_rcr_ack_valid     (rdmc_rcr_ack_valid),
                        .rdmc_rcr_ack_err       (rdmc_rcr_ack_err),
                        .rdmc_rcr_ack_dma_num   (rdmc_rcr_ack_dma_num),
                        .cache_parity_err       (cache_parity_err),
                        .shadw_parity_err       (shadw_parity_err),
                        .data_err_event         (data_err_event),

                        .pio_rd_gnt             (pio_rd_gnt8),
                        .chnl_pio_rd_data       (chnl_pio_rd_data8),
			.rx_log_page_hdl_reg    (rx_log_page_hdl_reg8),
                        .dma_func_num           (dma_func_num8),
                        .fetch_desp_req         (fetch_desp_req8),        //to desp_acc_ctrl
                        .fetch_desp_addr        (fetch_desp_addr8),       //to desp_acc_ctrl
                        .fetch_desp_num         (fetch_desp_numb8),       //to desp_acc_ctrl
                        .rdmc_resp_accept_sm    (rdmc_resp_accept_sm8),   //to desp_acc_ctrl
                        .fetch_desp_resp_vld    (fetch_desp_resp_vld8),   //to desp_acc_ctrl
                        .cache_read_req         (cache_read_req8),        //to cache_acc_ctrl
                        .cache_rd_ptr           (cache_rd_ptr8),          //to cache_acc_ctrl
                        .cache_wr_ptr           (cache_wr_ptr8),          //to cache_acc_ctrl
                        .full_header            (full_header8),           //to wr_sched
                        .drop_pkt               (drop_pkt8),
                        .pkt_buf_gnt            (pkt_buf_gnt8),           //to wr_sched
                        .pkt_buf_size           (pkt_buf_size8),
                        .pkt_buf_addr           (pkt_buf_addr8),          //to wr_sched
                        .orig_buf_addr          (orig_buf_addr8),
                        .pref_buf_used_num      (pref_buf_used_num8),
                        .pkt_trans_len          (pkt_trans_len8),
                        .shadw_wr_en            (shadw_wr_en8),
                        .shadw_wr_even          (shadw_wr_even8),
                        .shadw_wr_ptr           (shadw_wr_ptr8),
                        .shadw_rd_ptr           (shadw_rd_ptr8),
                        .mailbox_data           (mailbox_data8),
                        .ldf_a                  (ldf_a8),
                        .ldf_b                  (ldf_b8),
                        .rcr_wrbk_req           (rcr_wrbk_req8),
                        .rcr_wrbk_addr          (rcr_wrbk_addr8),
                        .rcr_wrbk_numb          (rcr_wrbk_numb8),
                        .rcr_wrbk_data_type     (rcr_wrbk_data_type8),
                        .rcr_wrbk_sched         (rcr_wrbk_sched8),
                        .rcr_ack_accept         (rcr_ack_accept8)

                        );

niu_rdmc_chnl_master    niu_rdmc_chnl_master9 (
                        .clk                    (niu_clk),
                        .reset                  (reset),
                        .wred_enable            (wred_enable),
			.random_num             (random_num),
                        .clk_div_value          (clk_div_value),
                        .dma_chnl_grp_id        (`CHNL9),
                        .pio_32b_mode           (pio_32b_mode),
                        .pio_wen                (pio_wen_b),
                        .pio_addr               (pio_addr_b),
                        .pio_wdata              (pio_wdata),
                        .muxed_pkt_len          (muxed_pkt_len),          //from wr_dp
                        .muxed_rdc_num_r        (muxed_rdc_num_r),        //from wr_dp
                        .muxed_drop_pkt_r       (muxed_drop_pkt_r),
                        .muxed_s_event_r        (muxed_s_event_r),
                        .sel_buf_en             (sel_buf_en),             //from wr_sched
                        .pkt_req_cnt_e_done_mod (pkt_req_cnt_e_done_mod),
                        .pkt_buf_done           (pkt_buf_done),
                        .is_hdr_wr_data         (is_hdr_wr_data),
                        .is_jmb1_wr_data        (is_jmb1_wr_data),
                        .wr_transfer_comp_int   (rdmc_meta0_wr_transfer_comp_int),
                        .wr_last_pkt_data       (wr_last_pkt_data),
                        .update_rcr_shadw       (update_rcr_shadw),
                        .cache_start_addr       (`CHNL9_CACHE_START_ADDR),
                        .cache_end_addr         (`CHNL9_CACHE_END_ADDR),
                        .cache_buf_rd_gnt       (cache_buf_rd_gnt[9]),    //from cache_acc_ctrl
                        .cache_buf_rd_data      (cache_buf_rd_data),      //from cache_acc_ctrl
                        .fetch_desp_gnt         (fetch_desp_gnt[9]),      //from desp_acc_ctrl
                        .rdmc_resp_rdy_valid    (rdmc_resp_rdy_valid),    //from desp_acc_ctrl
                        .rdmc_req_err           (rdmc_req_err),
                        .rdmc_resp_cmd          (rdmc_resp_cmd),
                        .rdmc_resp_cmd_status   (rdmc_resp_cmd_status),
                        .rdmc_resp_data_status  (rdmc_resp_data_status),
                        .rdmc_resp_dma_num      (rdmc_resp_dma_num),
                        .rdmc_resp_data_valid   (rdmc_resp_data_valid),
                        .rdmc_resp_byteenable   (rdmc_resp_byteenable),
                        .rdmc_resp_comp         (rdmc_resp_comp),
                        .rdmc_resp_trans_comp   (rdmc_resp_trans_comp),
                        .resp_data_in_process   (resp_data_in_process),
                        .shadw_start_addr       (`CHNL9_SHADW_START_ADDR),
                        .shadw_rd_end_addr      (`CHNL9_SHADW_RD_END_ADDR),
                        .shadw_wr_end_addr      (`CHNL9_SHADW_WR_END_ADDR),
                        .rdmc_wr_data_dma_num   (rdmc_wr_data_dma_num),
                        .rcr_wrbk_gnt           (rcr_wrbk_gnt[9]),
                        .rcr_wrbk_done          (rcr_wrbk_done),
                        .rcr_wrbk_pkt_num       (rcr_wrbk_pkt_num),
                        .rdmc_rcr_ack_valid     (rdmc_rcr_ack_valid),
                        .rdmc_rcr_ack_err       (rdmc_rcr_ack_err),
                        .rdmc_rcr_ack_dma_num   (rdmc_rcr_ack_dma_num),
                        .cache_parity_err       (cache_parity_err),
                        .shadw_parity_err       (shadw_parity_err),
                        .data_err_event         (data_err_event),

                        .pio_rd_gnt             (pio_rd_gnt9),
                        .chnl_pio_rd_data       (chnl_pio_rd_data9),
			.rx_log_page_hdl_reg    (rx_log_page_hdl_reg9),
                        .dma_func_num           (dma_func_num9),
                        .fetch_desp_req         (fetch_desp_req9),        //to desp_acc_ctrl
                        .fetch_desp_addr        (fetch_desp_addr9),       //to desp_acc_ctrl
                        .fetch_desp_num         (fetch_desp_numb9),       //to desp_acc_ctrl
                        .rdmc_resp_accept_sm    (rdmc_resp_accept_sm9),   //to desp_acc_ctrl
                        .fetch_desp_resp_vld    (fetch_desp_resp_vld9),   //to desp_acc_ctrl
                        .cache_read_req         (cache_read_req9),        //to cache_acc_ctrl
                        .cache_rd_ptr           (cache_rd_ptr9),          //to cache_acc_ctrl
                        .cache_wr_ptr           (cache_wr_ptr9),          //to cache_acc_ctrl
                        .full_header            (full_header9),           //to wr_sched
                        .drop_pkt               (drop_pkt9),
                        .pkt_buf_gnt            (pkt_buf_gnt9),           //to wr_sched
                        .pkt_buf_size           (pkt_buf_size9),
                        .pkt_buf_addr           (pkt_buf_addr9),          //to wr_sched
                        .orig_buf_addr          (orig_buf_addr9),
                        .pref_buf_used_num      (pref_buf_used_num9),
                        .pkt_trans_len          (pkt_trans_len9),
                        .shadw_wr_en            (shadw_wr_en9),
                        .shadw_wr_even          (shadw_wr_even9),
                        .shadw_wr_ptr           (shadw_wr_ptr9),
                        .shadw_rd_ptr           (shadw_rd_ptr9),
                        .mailbox_data           (mailbox_data9),
                        .ldf_a                  (ldf_a9),
                        .ldf_b                  (ldf_b9),
                        .rcr_wrbk_req           (rcr_wrbk_req9),
                        .rcr_wrbk_addr          (rcr_wrbk_addr9),
                        .rcr_wrbk_numb          (rcr_wrbk_numb9),
                        .rcr_wrbk_data_type     (rcr_wrbk_data_type9),
                        .rcr_wrbk_sched         (rcr_wrbk_sched9),
                        .rcr_ack_accept         (rcr_ack_accept9)

                        );

niu_rdmc_chnl_master    niu_rdmc_chnl_master10 (
                        .clk                    (niu_clk),
                        .reset                  (reset),
                        .wred_enable            (wred_enable),
			.random_num             (random_num),
                        .clk_div_value          (clk_div_value),
                        .dma_chnl_grp_id        (`CHNL10),
                        .pio_32b_mode           (pio_32b_mode),
                        .pio_wen                (pio_wen_b),
                        .pio_addr               (pio_addr_b),
                        .pio_wdata              (pio_wdata),
                        .muxed_pkt_len          (muxed_pkt_len),          //from wr_dp
                        .muxed_rdc_num_r        (muxed_rdc_num_r),        //from wr_dp
                        .muxed_drop_pkt_r       (muxed_drop_pkt_r),
                        .muxed_s_event_r        (muxed_s_event_r),
                        .sel_buf_en             (sel_buf_en),             //from wr_sched
                        .pkt_req_cnt_e_done_mod (pkt_req_cnt_e_done_mod),
                        .pkt_buf_done           (pkt_buf_done),
                        .is_hdr_wr_data         (is_hdr_wr_data),
                        .is_jmb1_wr_data        (is_jmb1_wr_data),
                        .wr_transfer_comp_int   (rdmc_meta0_wr_transfer_comp_int),
                        .wr_last_pkt_data       (wr_last_pkt_data),
                        .update_rcr_shadw       (update_rcr_shadw),
                        .cache_start_addr       (`CHNL10_CACHE_START_ADDR),
                        .cache_end_addr         (`CHNL10_CACHE_END_ADDR),
                        .cache_buf_rd_gnt       (cache_buf_rd_gnt[10]),    //from cache_acc_ctrl
                        .cache_buf_rd_data      (cache_buf_rd_data),      //from cache_acc_ctrl
                        .fetch_desp_gnt         (fetch_desp_gnt[10]),      //from desp_acc_ctrl
                        .rdmc_resp_rdy_valid    (rdmc_resp_rdy_valid),    //from desp_acc_ctrl
                        .rdmc_req_err           (rdmc_req_err),
                        .rdmc_resp_cmd          (rdmc_resp_cmd),
                        .rdmc_resp_cmd_status   (rdmc_resp_cmd_status),
                        .rdmc_resp_data_status  (rdmc_resp_data_status),
                        .rdmc_resp_dma_num      (rdmc_resp_dma_num),
                        .rdmc_resp_data_valid   (rdmc_resp_data_valid),
                        .rdmc_resp_byteenable   (rdmc_resp_byteenable),
                        .rdmc_resp_comp         (rdmc_resp_comp),
                        .rdmc_resp_trans_comp   (rdmc_resp_trans_comp),
                        .resp_data_in_process   (resp_data_in_process),
                        .shadw_start_addr       (`CHNL10_SHADW_START_ADDR),
                        .shadw_rd_end_addr      (`CHNL10_SHADW_RD_END_ADDR),
                        .shadw_wr_end_addr      (`CHNL10_SHADW_WR_END_ADDR),
                        .rdmc_wr_data_dma_num   (rdmc_wr_data_dma_num),
                        .rcr_wrbk_gnt           (rcr_wrbk_gnt[10]),
                        .rcr_wrbk_done          (rcr_wrbk_done),
                        .rcr_wrbk_pkt_num       (rcr_wrbk_pkt_num),
                        .rdmc_rcr_ack_valid     (rdmc_rcr_ack_valid),
                        .rdmc_rcr_ack_err       (rdmc_rcr_ack_err),
                        .rdmc_rcr_ack_dma_num   (rdmc_rcr_ack_dma_num),
                        .cache_parity_err       (cache_parity_err),
                        .shadw_parity_err       (shadw_parity_err),
                        .data_err_event         (data_err_event),

                        .pio_rd_gnt             (pio_rd_gnt10),
                        .chnl_pio_rd_data       (chnl_pio_rd_data10),
			.rx_log_page_hdl_reg    (rx_log_page_hdl_reg10),
                        .dma_func_num           (dma_func_num10),
                        .fetch_desp_req         (fetch_desp_req10),        //to desp_acc_ctrl
                        .fetch_desp_addr        (fetch_desp_addr10),       //to desp_acc_ctrl
                        .fetch_desp_num         (fetch_desp_numb10),       //to desp_acc_ctrl
                        .rdmc_resp_accept_sm    (rdmc_resp_accept_sm10),   //to desp_acc_ctrl
                        .fetch_desp_resp_vld    (fetch_desp_resp_vld10),   //to desp_acc_ctrl
                        .cache_read_req         (cache_read_req10),        //to cache_acc_ctrl
                        .cache_rd_ptr           (cache_rd_ptr10),          //to cache_acc_ctrl
                        .cache_wr_ptr           (cache_wr_ptr10),          //to cache_acc_ctrl
                        .full_header            (full_header10),           //to wr_sched
                        .drop_pkt               (drop_pkt10),
                        .pkt_buf_gnt            (pkt_buf_gnt10),           //to wr_sched
                        .pkt_buf_size           (pkt_buf_size10),
                        .pkt_buf_addr           (pkt_buf_addr10),          //to wr_sched
                        .orig_buf_addr          (orig_buf_addr10),
                        .pref_buf_used_num      (pref_buf_used_num10),
                        .pkt_trans_len          (pkt_trans_len10),
                        .shadw_wr_en            (shadw_wr_en10),
                        .shadw_wr_even          (shadw_wr_even10),
                        .shadw_wr_ptr           (shadw_wr_ptr10),
                        .shadw_rd_ptr           (shadw_rd_ptr10),
                        .mailbox_data           (mailbox_data10),
                        .ldf_a                  (ldf_a10),
                        .ldf_b                  (ldf_b10),
                        .rcr_wrbk_req           (rcr_wrbk_req10),
                        .rcr_wrbk_addr          (rcr_wrbk_addr10),
                        .rcr_wrbk_numb          (rcr_wrbk_numb10),
                        .rcr_wrbk_data_type     (rcr_wrbk_data_type10),
                        .rcr_wrbk_sched         (rcr_wrbk_sched10),
                        .rcr_ack_accept         (rcr_ack_accept10)

                        );

niu_rdmc_chnl_master    niu_rdmc_chnl_master11 (
                        .clk                    (niu_clk),
                        .reset                  (reset),
                        .wred_enable            (wred_enable),
			.random_num             (random_num),
                        .clk_div_value          (clk_div_value),
                        .dma_chnl_grp_id        (`CHNL11),
                        .pio_32b_mode           (pio_32b_mode),
                        .pio_wen                (pio_wen_b),
                        .pio_addr               (pio_addr_b),
                        .pio_wdata              (pio_wdata),
                        .muxed_pkt_len          (muxed_pkt_len),          //from wr_dp
                        .muxed_rdc_num_r        (muxed_rdc_num_r),        //from wr_dp
                        .muxed_drop_pkt_r       (muxed_drop_pkt_r),
                        .muxed_s_event_r        (muxed_s_event_r),
                        .sel_buf_en             (sel_buf_en),             //from wr_sched
                        .pkt_req_cnt_e_done_mod (pkt_req_cnt_e_done_mod),
                        .pkt_buf_done           (pkt_buf_done),
                        .is_hdr_wr_data         (is_hdr_wr_data),
                        .is_jmb1_wr_data        (is_jmb1_wr_data),
                        .wr_transfer_comp_int   (rdmc_meta0_wr_transfer_comp_int),
                        .wr_last_pkt_data       (wr_last_pkt_data),
                        .update_rcr_shadw       (update_rcr_shadw),
                        .cache_start_addr       (`CHNL11_CACHE_START_ADDR),
                        .cache_end_addr         (`CHNL11_CACHE_END_ADDR),
                        .cache_buf_rd_gnt       (cache_buf_rd_gnt[11]),    //from cache_acc_ctrl
                        .cache_buf_rd_data      (cache_buf_rd_data),      //from cache_acc_ctrl
                        .fetch_desp_gnt         (fetch_desp_gnt[11]),      //from desp_acc_ctrl
                        .rdmc_resp_rdy_valid    (rdmc_resp_rdy_valid),    //from desp_acc_ctrl
                        .rdmc_req_err           (rdmc_req_err),
                        .rdmc_resp_cmd          (rdmc_resp_cmd),
                        .rdmc_resp_cmd_status   (rdmc_resp_cmd_status),
                        .rdmc_resp_data_status  (rdmc_resp_data_status),
                        .rdmc_resp_dma_num      (rdmc_resp_dma_num),
                        .rdmc_resp_data_valid   (rdmc_resp_data_valid),
                        .rdmc_resp_byteenable   (rdmc_resp_byteenable),
                        .rdmc_resp_comp         (rdmc_resp_comp),
                        .rdmc_resp_trans_comp   (rdmc_resp_trans_comp),
                        .resp_data_in_process   (resp_data_in_process),
                        .shadw_start_addr       (`CHNL11_SHADW_START_ADDR),
                        .shadw_rd_end_addr      (`CHNL11_SHADW_RD_END_ADDR),
                        .shadw_wr_end_addr      (`CHNL11_SHADW_WR_END_ADDR),
                        .rdmc_wr_data_dma_num   (rdmc_wr_data_dma_num),
                        .rcr_wrbk_gnt           (rcr_wrbk_gnt[11]),
                        .rcr_wrbk_done          (rcr_wrbk_done),
                        .rcr_wrbk_pkt_num       (rcr_wrbk_pkt_num),
                        .rdmc_rcr_ack_valid     (rdmc_rcr_ack_valid),
                        .rdmc_rcr_ack_err       (rdmc_rcr_ack_err),
                        .rdmc_rcr_ack_dma_num   (rdmc_rcr_ack_dma_num),
                        .cache_parity_err       (cache_parity_err),
                        .shadw_parity_err       (shadw_parity_err),
                        .data_err_event         (data_err_event),

                        .pio_rd_gnt             (pio_rd_gnt11),
                        .chnl_pio_rd_data       (chnl_pio_rd_data11),
			.rx_log_page_hdl_reg    (rx_log_page_hdl_reg11),
                        .dma_func_num           (dma_func_num11),
                        .fetch_desp_req         (fetch_desp_req11),        //to desp_acc_ctrl
                        .fetch_desp_addr        (fetch_desp_addr11),       //to desp_acc_ctrl
                        .fetch_desp_num         (fetch_desp_numb11),       //to desp_acc_ctrl
                        .rdmc_resp_accept_sm    (rdmc_resp_accept_sm11),   //to desp_acc_ctrl
                        .fetch_desp_resp_vld    (fetch_desp_resp_vld11),   //to desp_acc_ctrl
                        .cache_read_req         (cache_read_req11),        //to cache_acc_ctrl
                        .cache_rd_ptr           (cache_rd_ptr11),          //to cache_acc_ctrl
                        .cache_wr_ptr           (cache_wr_ptr11),          //to cache_acc_ctrl
                        .full_header            (full_header11),           //to wr_sched
                        .drop_pkt               (drop_pkt11),
                        .pkt_buf_gnt            (pkt_buf_gnt11),           //to wr_sched
                        .pkt_buf_size           (pkt_buf_size11),
                        .pkt_buf_addr           (pkt_buf_addr11),          //to wr_sched
                        .orig_buf_addr          (orig_buf_addr11),
                        .pref_buf_used_num      (pref_buf_used_num11),
                        .pkt_trans_len          (pkt_trans_len11),
                        .shadw_wr_en            (shadw_wr_en11),
                        .shadw_wr_even          (shadw_wr_even11),
                        .shadw_wr_ptr           (shadw_wr_ptr11),
                        .shadw_rd_ptr           (shadw_rd_ptr11),
                        .mailbox_data           (mailbox_data11),
                        .ldf_a                  (ldf_a11),
                        .ldf_b                  (ldf_b11),
                        .rcr_wrbk_req           (rcr_wrbk_req11),
                        .rcr_wrbk_addr          (rcr_wrbk_addr11),
                        .rcr_wrbk_numb          (rcr_wrbk_numb11),
                        .rcr_wrbk_data_type     (rcr_wrbk_data_type11),
                        .rcr_wrbk_sched         (rcr_wrbk_sched11),
                        .rcr_ack_accept         (rcr_ack_accept11)

                        );

niu_rdmc_chnl_master    niu_rdmc_chnl_master12 (
                        .clk                    (niu_clk),
                        .reset                  (reset),
                        .wred_enable            (wred_enable),
			.random_num             (random_num),
                        .clk_div_value          (clk_div_value),
                        .dma_chnl_grp_id        (`CHNL12),
                        .pio_32b_mode           (pio_32b_mode),
                        .pio_wen                (pio_wen_c),
                        .pio_addr               (pio_addr_c),
                        .pio_wdata              (pio_wdata),
                        .muxed_pkt_len          (muxed_pkt_len),          //from wr_dp
                        .muxed_rdc_num_r        (muxed_rdc_num_r),        //from wr_dp
                        .muxed_drop_pkt_r       (muxed_drop_pkt_r),
                        .muxed_s_event_r        (muxed_s_event_r),
                        .sel_buf_en             (sel_buf_en),             //from wr_sched
                        .pkt_req_cnt_e_done_mod (pkt_req_cnt_e_done_mod),
                        .pkt_buf_done           (pkt_buf_done),
                        .is_hdr_wr_data         (is_hdr_wr_data),
                        .is_jmb1_wr_data        (is_jmb1_wr_data),
                        .wr_transfer_comp_int   (rdmc_meta0_wr_transfer_comp_int),
                        .wr_last_pkt_data       (wr_last_pkt_data),
                        .update_rcr_shadw       (update_rcr_shadw),
                        .cache_start_addr       (`CHNL12_CACHE_START_ADDR),
                        .cache_end_addr         (`CHNL12_CACHE_END_ADDR),
                        .cache_buf_rd_gnt       (cache_buf_rd_gnt[12]),    //from cache_acc_ctrl
                        .cache_buf_rd_data      (cache_buf_rd_data),      //from cache_acc_ctrl
                        .fetch_desp_gnt         (fetch_desp_gnt[12]),      //from desp_acc_ctrl
                        .rdmc_resp_rdy_valid    (rdmc_resp_rdy_valid),    //from desp_acc_ctrl
                        .rdmc_req_err           (rdmc_req_err),
                        .rdmc_resp_cmd          (rdmc_resp_cmd),
                        .rdmc_resp_cmd_status   (rdmc_resp_cmd_status),
                        .rdmc_resp_data_status  (rdmc_resp_data_status),
                        .rdmc_resp_dma_num      (rdmc_resp_dma_num),
                        .rdmc_resp_data_valid   (rdmc_resp_data_valid),
                        .rdmc_resp_byteenable   (rdmc_resp_byteenable),
                        .rdmc_resp_comp         (rdmc_resp_comp),
                        .rdmc_resp_trans_comp   (rdmc_resp_trans_comp),
                        .resp_data_in_process   (resp_data_in_process),
                        .shadw_start_addr       (`CHNL12_SHADW_START_ADDR),
                        .shadw_rd_end_addr      (`CHNL12_SHADW_RD_END_ADDR),
                        .shadw_wr_end_addr      (`CHNL12_SHADW_WR_END_ADDR),
                        .rdmc_wr_data_dma_num   (rdmc_wr_data_dma_num),
                        .rcr_wrbk_gnt           (rcr_wrbk_gnt[12]),
                        .rcr_wrbk_done          (rcr_wrbk_done),
                        .rcr_wrbk_pkt_num       (rcr_wrbk_pkt_num),
                        .rdmc_rcr_ack_valid     (rdmc_rcr_ack_valid),
                        .rdmc_rcr_ack_err       (rdmc_rcr_ack_err),
                        .rdmc_rcr_ack_dma_num   (rdmc_rcr_ack_dma_num),
                        .cache_parity_err       (cache_parity_err),
                        .shadw_parity_err       (shadw_parity_err),
                        .data_err_event         (data_err_event),

                        .pio_rd_gnt             (pio_rd_gnt12),
                        .chnl_pio_rd_data       (chnl_pio_rd_data12),
			.rx_log_page_hdl_reg    (rx_log_page_hdl_reg12),
                        .dma_func_num           (dma_func_num12),
                        .fetch_desp_req         (fetch_desp_req12),        //to desp_acc_ctrl
                        .fetch_desp_addr        (fetch_desp_addr12),       //to desp_acc_ctrl
                        .fetch_desp_num         (fetch_desp_numb12),       //to desp_acc_ctrl
                        .rdmc_resp_accept_sm    (rdmc_resp_accept_sm12),   //to desp_acc_ctrl
                        .fetch_desp_resp_vld    (fetch_desp_resp_vld12),   //to desp_acc_ctrl
                        .cache_read_req         (cache_read_req12),        //to cache_acc_ctrl
                        .cache_rd_ptr           (cache_rd_ptr12),          //to cache_acc_ctrl
                        .cache_wr_ptr           (cache_wr_ptr12),          //to cache_acc_ctrl
                        .full_header            (full_header12),           //to wr_sched
                        .drop_pkt               (drop_pkt12),
                        .pkt_buf_gnt            (pkt_buf_gnt12),           //to wr_sched
                        .pkt_buf_size           (pkt_buf_size12),
                        .pkt_buf_addr           (pkt_buf_addr12),          //to wr_sched
                        .orig_buf_addr          (orig_buf_addr12),
                        .pref_buf_used_num      (pref_buf_used_num12),
                        .pkt_trans_len          (pkt_trans_len12),
                        .shadw_wr_en            (shadw_wr_en12),
                        .shadw_wr_even          (shadw_wr_even12),
                        .shadw_wr_ptr           (shadw_wr_ptr12),
                        .shadw_rd_ptr           (shadw_rd_ptr12),
                        .mailbox_data           (mailbox_data12),
                        .ldf_a                  (ldf_a12),
                        .ldf_b                  (ldf_b12),
                        .rcr_wrbk_req           (rcr_wrbk_req12),
                        .rcr_wrbk_addr          (rcr_wrbk_addr12),
                        .rcr_wrbk_numb          (rcr_wrbk_numb12),
                        .rcr_wrbk_data_type     (rcr_wrbk_data_type12),
                        .rcr_wrbk_sched         (rcr_wrbk_sched12),
                        .rcr_ack_accept         (rcr_ack_accept12)

                        );

niu_rdmc_chnl_master    niu_rdmc_chnl_master13 (
                        .clk                    (niu_clk),
                        .reset                  (reset),
                        .wred_enable            (wred_enable),
			.random_num             (random_num),
                        .clk_div_value          (clk_div_value),
                        .dma_chnl_grp_id        (`CHNL13),
                        .pio_32b_mode           (pio_32b_mode),
                        .pio_wen                (pio_wen_c),
                        .pio_addr               (pio_addr_c),
                        .pio_wdata              (pio_wdata),
                        .muxed_pkt_len          (muxed_pkt_len),          //from wr_dp
                        .muxed_rdc_num_r        (muxed_rdc_num_r),        //from wr_dp
                        .muxed_drop_pkt_r       (muxed_drop_pkt_r),
                        .muxed_s_event_r        (muxed_s_event_r),
                        .sel_buf_en             (sel_buf_en),             //from wr_sched
                        .pkt_req_cnt_e_done_mod (pkt_req_cnt_e_done_mod),
                        .pkt_buf_done           (pkt_buf_done),
                        .is_hdr_wr_data         (is_hdr_wr_data),
                        .is_jmb1_wr_data        (is_jmb1_wr_data),
                        .wr_transfer_comp_int   (rdmc_meta0_wr_transfer_comp_int),
                        .wr_last_pkt_data       (wr_last_pkt_data),
                        .update_rcr_shadw       (update_rcr_shadw),
                        .cache_start_addr       (`CHNL13_CACHE_START_ADDR),
                        .cache_end_addr         (`CHNL13_CACHE_END_ADDR),
                        .cache_buf_rd_gnt       (cache_buf_rd_gnt[13]),    //from cache_acc_ctrl
                        .cache_buf_rd_data      (cache_buf_rd_data),      //from cache_acc_ctrl
                        .fetch_desp_gnt         (fetch_desp_gnt[13]),      //from desp_acc_ctrl
                        .rdmc_resp_rdy_valid    (rdmc_resp_rdy_valid),    //from desp_acc_ctrl
                        .rdmc_req_err           (rdmc_req_err),
                        .rdmc_resp_cmd          (rdmc_resp_cmd),
                        .rdmc_resp_cmd_status   (rdmc_resp_cmd_status),
                        .rdmc_resp_data_status  (rdmc_resp_data_status),
                        .rdmc_resp_dma_num      (rdmc_resp_dma_num),
                        .rdmc_resp_data_valid   (rdmc_resp_data_valid),
                        .rdmc_resp_byteenable   (rdmc_resp_byteenable),
                        .rdmc_resp_comp         (rdmc_resp_comp),
                        .rdmc_resp_trans_comp   (rdmc_resp_trans_comp),
                        .resp_data_in_process   (resp_data_in_process),
                        .shadw_start_addr       (`CHNL13_SHADW_START_ADDR),
                        .shadw_rd_end_addr      (`CHNL13_SHADW_RD_END_ADDR),
                        .shadw_wr_end_addr      (`CHNL13_SHADW_WR_END_ADDR),
                        .rdmc_wr_data_dma_num   (rdmc_wr_data_dma_num),
                        .rcr_wrbk_gnt           (rcr_wrbk_gnt[13]),
                        .rcr_wrbk_done          (rcr_wrbk_done),
                        .rcr_wrbk_pkt_num       (rcr_wrbk_pkt_num),
                        .rdmc_rcr_ack_valid     (rdmc_rcr_ack_valid),
                        .rdmc_rcr_ack_err       (rdmc_rcr_ack_err),
                        .rdmc_rcr_ack_dma_num   (rdmc_rcr_ack_dma_num),
                        .cache_parity_err       (cache_parity_err),
                        .shadw_parity_err       (shadw_parity_err),
                        .data_err_event         (data_err_event),

                        .pio_rd_gnt             (pio_rd_gnt13),
                        .chnl_pio_rd_data       (chnl_pio_rd_data13),
			.rx_log_page_hdl_reg    (rx_log_page_hdl_reg13),
                        .dma_func_num           (dma_func_num13),
                        .fetch_desp_req         (fetch_desp_req13),        //to desp_acc_ctrl
                        .fetch_desp_addr        (fetch_desp_addr13),       //to desp_acc_ctrl
                        .fetch_desp_num         (fetch_desp_numb13),       //to desp_acc_ctrl
                        .rdmc_resp_accept_sm    (rdmc_resp_accept_sm13),   //to desp_acc_ctrl
                        .fetch_desp_resp_vld    (fetch_desp_resp_vld13),   //to desp_acc_ctrl
                        .cache_read_req         (cache_read_req13),        //to cache_acc_ctrl
                        .cache_rd_ptr           (cache_rd_ptr13),          //to cache_acc_ctrl
                        .cache_wr_ptr           (cache_wr_ptr13),          //to cache_acc_ctrl
                        .full_header            (full_header13),           //to wr_sched
                        .drop_pkt               (drop_pkt13),
                        .pkt_buf_gnt            (pkt_buf_gnt13),           //to wr_sched
                        .pkt_buf_size           (pkt_buf_size13),
                        .pkt_buf_addr           (pkt_buf_addr13),          //to wr_sched
                        .orig_buf_addr          (orig_buf_addr13),
                        .pref_buf_used_num      (pref_buf_used_num13),
                        .pkt_trans_len          (pkt_trans_len13),
                        .shadw_wr_en            (shadw_wr_en13),
                        .shadw_wr_even          (shadw_wr_even13),
                        .shadw_wr_ptr           (shadw_wr_ptr13),
                        .shadw_rd_ptr           (shadw_rd_ptr13),
                        .mailbox_data           (mailbox_data13),
                        .ldf_a                  (ldf_a13),
                        .ldf_b                  (ldf_b13),
                        .rcr_wrbk_req           (rcr_wrbk_req13),
                        .rcr_wrbk_addr          (rcr_wrbk_addr13),
                        .rcr_wrbk_numb          (rcr_wrbk_numb13),
                        .rcr_wrbk_data_type     (rcr_wrbk_data_type13),
                        .rcr_wrbk_sched         (rcr_wrbk_sched13),
                        .rcr_ack_accept         (rcr_ack_accept13)

                        );

niu_rdmc_chnl_master    niu_rdmc_chnl_master14 (
                        .clk                    (niu_clk),
                        .reset                  (reset),
                        .wred_enable            (wred_enable),
			.random_num             (random_num),
                        .clk_div_value          (clk_div_value),
                        .dma_chnl_grp_id        (`CHNL14),
                        .pio_32b_mode           (pio_32b_mode),
                        .pio_wen                (pio_wen_c),
                        .pio_addr               (pio_addr_c),
                        .pio_wdata              (pio_wdata),
                        .muxed_pkt_len          (muxed_pkt_len),          //from wr_dp
                        .muxed_rdc_num_r        (muxed_rdc_num_r),        //from wr_dp
                        .muxed_drop_pkt_r       (muxed_drop_pkt_r),
                        .muxed_s_event_r        (muxed_s_event_r),
                        .sel_buf_en             (sel_buf_en),             //from wr_sched
                        .pkt_req_cnt_e_done_mod (pkt_req_cnt_e_done_mod),
                        .pkt_buf_done           (pkt_buf_done),
                        .is_hdr_wr_data         (is_hdr_wr_data),
                        .is_jmb1_wr_data        (is_jmb1_wr_data),
                        .wr_transfer_comp_int   (rdmc_meta0_wr_transfer_comp_int),
                        .wr_last_pkt_data       (wr_last_pkt_data),
                        .update_rcr_shadw       (update_rcr_shadw),
                        .cache_start_addr       (`CHNL14_CACHE_START_ADDR),
                        .cache_end_addr         (`CHNL14_CACHE_END_ADDR),
                        .cache_buf_rd_gnt       (cache_buf_rd_gnt[14]),    //from cache_acc_ctrl
                        .cache_buf_rd_data      (cache_buf_rd_data),      //from cache_acc_ctrl
                        .fetch_desp_gnt         (fetch_desp_gnt[14]),      //from desp_acc_ctrl
                        .rdmc_resp_rdy_valid    (rdmc_resp_rdy_valid),    //from desp_acc_ctrl
                        .rdmc_req_err           (rdmc_req_err),
                        .rdmc_resp_cmd          (rdmc_resp_cmd),
                        .rdmc_resp_cmd_status   (rdmc_resp_cmd_status),
                        .rdmc_resp_data_status  (rdmc_resp_data_status),
                        .rdmc_resp_dma_num      (rdmc_resp_dma_num),
                        .rdmc_resp_data_valid   (rdmc_resp_data_valid),
                        .rdmc_resp_byteenable   (rdmc_resp_byteenable),
                        .rdmc_resp_comp         (rdmc_resp_comp),
                        .rdmc_resp_trans_comp   (rdmc_resp_trans_comp),
                        .resp_data_in_process   (resp_data_in_process),
                        .shadw_start_addr       (`CHNL14_SHADW_START_ADDR),
                        .shadw_rd_end_addr      (`CHNL14_SHADW_RD_END_ADDR),
                        .shadw_wr_end_addr      (`CHNL14_SHADW_WR_END_ADDR),
                        .rdmc_wr_data_dma_num   (rdmc_wr_data_dma_num),
                        .rcr_wrbk_gnt           (rcr_wrbk_gnt[14]),
                        .rcr_wrbk_done          (rcr_wrbk_done),
                        .rcr_wrbk_pkt_num       (rcr_wrbk_pkt_num),
                        .rdmc_rcr_ack_valid     (rdmc_rcr_ack_valid),
                        .rdmc_rcr_ack_err       (rdmc_rcr_ack_err),
                        .rdmc_rcr_ack_dma_num   (rdmc_rcr_ack_dma_num),
                        .cache_parity_err       (cache_parity_err),
                        .shadw_parity_err       (shadw_parity_err),
                        .data_err_event         (data_err_event),

                        .pio_rd_gnt             (pio_rd_gnt14),
                        .chnl_pio_rd_data       (chnl_pio_rd_data14),
			.rx_log_page_hdl_reg    (rx_log_page_hdl_reg14),
                        .dma_func_num           (dma_func_num14),
                        .fetch_desp_req         (fetch_desp_req14),        //to desp_acc_ctrl
                        .fetch_desp_addr        (fetch_desp_addr14),       //to desp_acc_ctrl
                        .fetch_desp_num         (fetch_desp_numb14),       //to desp_acc_ctrl
                        .rdmc_resp_accept_sm    (rdmc_resp_accept_sm14),   //to desp_acc_ctrl
                        .fetch_desp_resp_vld    (fetch_desp_resp_vld14),   //to desp_acc_ctrl
                        .cache_read_req         (cache_read_req14),        //to cache_acc_ctrl
                        .cache_rd_ptr           (cache_rd_ptr14),          //to cache_acc_ctrl
                        .cache_wr_ptr           (cache_wr_ptr14),          //to cache_acc_ctrl
                        .full_header            (full_header14),           //to wr_sched
                        .drop_pkt               (drop_pkt14),
                        .pkt_buf_gnt            (pkt_buf_gnt14),           //to wr_sched
                        .pkt_buf_size           (pkt_buf_size14),
                        .pkt_buf_addr           (pkt_buf_addr14),          //to wr_sched
                        .orig_buf_addr          (orig_buf_addr14),
                        .pref_buf_used_num      (pref_buf_used_num14),
                        .pkt_trans_len          (pkt_trans_len14),
                        .shadw_wr_en            (shadw_wr_en14),
                        .shadw_wr_even          (shadw_wr_even14),
                        .shadw_wr_ptr           (shadw_wr_ptr14),
                        .shadw_rd_ptr           (shadw_rd_ptr14),
                        .mailbox_data           (mailbox_data14),
                        .ldf_a                  (ldf_a14),
                        .ldf_b                  (ldf_b14),
                        .rcr_wrbk_req           (rcr_wrbk_req14),
                        .rcr_wrbk_addr          (rcr_wrbk_addr14),
                        .rcr_wrbk_numb          (rcr_wrbk_numb14),
                        .rcr_wrbk_data_type     (rcr_wrbk_data_type14),
                        .rcr_wrbk_sched         (rcr_wrbk_sched14),
                        .rcr_ack_accept         (rcr_ack_accept14)

                        );

niu_rdmc_chnl_master    niu_rdmc_chnl_master15 (
                        .clk                    (niu_clk),
                        .reset                  (reset),
                        .wred_enable            (wred_enable),
			.random_num             (random_num),
                        .clk_div_value          (clk_div_value),
                        .dma_chnl_grp_id        (`CHNL15),
                        .pio_32b_mode           (pio_32b_mode),
                        .pio_wen                (pio_wen_c),
                        .pio_addr               (pio_addr_c),
                        .pio_wdata              (pio_wdata),
                        .muxed_pkt_len          (muxed_pkt_len),          //from wr_dp
                        .muxed_rdc_num_r        (muxed_rdc_num_r),        //from wr_dp
                        .muxed_drop_pkt_r       (muxed_drop_pkt_r),
                        .muxed_s_event_r        (muxed_s_event_r),
                        .sel_buf_en             (sel_buf_en),             //from wr_sched
                        .pkt_req_cnt_e_done_mod (pkt_req_cnt_e_done_mod),
                        .pkt_buf_done           (pkt_buf_done),
                        .is_hdr_wr_data         (is_hdr_wr_data),
                        .is_jmb1_wr_data        (is_jmb1_wr_data),
                        .wr_transfer_comp_int   (rdmc_meta0_wr_transfer_comp_int),
                        .wr_last_pkt_data       (wr_last_pkt_data),
                        .update_rcr_shadw       (update_rcr_shadw),
                        .cache_start_addr       (`CHNL15_CACHE_START_ADDR),
                        .cache_end_addr         (`CHNL15_CACHE_END_ADDR),
                        .cache_buf_rd_gnt       (cache_buf_rd_gnt[15]),    //from cache_acc_ctrl
                        .cache_buf_rd_data      (cache_buf_rd_data),      //from cache_acc_ctrl
                        .fetch_desp_gnt         (fetch_desp_gnt[15]),      //from desp_acc_ctrl
                        .rdmc_resp_rdy_valid    (rdmc_resp_rdy_valid),    //from desp_acc_ctrl
                        .rdmc_req_err           (rdmc_req_err),
                        .rdmc_resp_cmd          (rdmc_resp_cmd),
                        .rdmc_resp_cmd_status   (rdmc_resp_cmd_status),
                        .rdmc_resp_data_status  (rdmc_resp_data_status),
                        .rdmc_resp_dma_num      (rdmc_resp_dma_num),
                        .rdmc_resp_data_valid   (rdmc_resp_data_valid),
                        .rdmc_resp_byteenable   (rdmc_resp_byteenable),
                        .rdmc_resp_comp         (rdmc_resp_comp),
                        .rdmc_resp_trans_comp   (rdmc_resp_trans_comp),
                        .resp_data_in_process   (resp_data_in_process),
                        .shadw_start_addr       (`CHNL15_SHADW_START_ADDR),
                        .shadw_rd_end_addr      (`CHNL15_SHADW_RD_END_ADDR),
                        .shadw_wr_end_addr      (`CHNL15_SHADW_WR_END_ADDR),
                        .rdmc_wr_data_dma_num   (rdmc_wr_data_dma_num),
                        .rcr_wrbk_gnt           (rcr_wrbk_gnt[15]),
                        .rcr_wrbk_done          (rcr_wrbk_done),
                        .rcr_wrbk_pkt_num       (rcr_wrbk_pkt_num),
                        .rdmc_rcr_ack_valid     (rdmc_rcr_ack_valid),
                        .rdmc_rcr_ack_err       (rdmc_rcr_ack_err),
                        .rdmc_rcr_ack_dma_num   (rdmc_rcr_ack_dma_num),
                        .cache_parity_err       (cache_parity_err),
                        .shadw_parity_err       (shadw_parity_err),
                        .data_err_event         (data_err_event),

                        .pio_rd_gnt             (pio_rd_gnt15),
                        .chnl_pio_rd_data       (chnl_pio_rd_data15),
			.rx_log_page_hdl_reg    (rx_log_page_hdl_reg15),
                        .dma_func_num           (dma_func_num15),
                        .fetch_desp_req         (fetch_desp_req15),        //to desp_acc_ctrl
                        .fetch_desp_addr        (fetch_desp_addr15),       //to desp_acc_ctrl
                        .fetch_desp_num         (fetch_desp_numb15),       //to desp_acc_ctrl
                        .rdmc_resp_accept_sm    (rdmc_resp_accept_sm15),   //to desp_acc_ctrl
                        .fetch_desp_resp_vld    (fetch_desp_resp_vld15),   //to desp_acc_ctrl
                        .cache_read_req         (cache_read_req15),        //to cache_acc_ctrl
                        .cache_rd_ptr           (cache_rd_ptr15),          //to cache_acc_ctrl
                        .cache_wr_ptr           (cache_wr_ptr15),          //to cache_acc_ctrl
                        .full_header            (full_header15),           //to wr_sched
                        .drop_pkt               (drop_pkt15),	
                        .pkt_buf_gnt            (pkt_buf_gnt15),           //to wr_sched
                        .pkt_buf_size           (pkt_buf_size15),
                        .pkt_buf_addr           (pkt_buf_addr15),          //to wr_sched
                        .orig_buf_addr          (orig_buf_addr15),
                        .pref_buf_used_num      (pref_buf_used_num15),
                        .pkt_trans_len          (pkt_trans_len15),
                        .shadw_wr_en            (shadw_wr_en15),
                        .shadw_wr_even          (shadw_wr_even15),
                        .shadw_wr_ptr           (shadw_wr_ptr15),
                        .shadw_rd_ptr           (shadw_rd_ptr15),
                        .mailbox_data           (mailbox_data15),
                        .ldf_a                  (ldf_a15),
                        .ldf_b                  (ldf_b15),
                        .rcr_wrbk_req           (rcr_wrbk_req15),
                        .rcr_wrbk_addr          (rcr_wrbk_addr15),
                        .rcr_wrbk_numb          (rcr_wrbk_numb15),
                        .rcr_wrbk_data_type     (rcr_wrbk_data_type15),
                        .rcr_wrbk_sched         (rcr_wrbk_sched15),
                        .rcr_ack_accept         (rcr_ack_accept15)

                        );

endmodule







