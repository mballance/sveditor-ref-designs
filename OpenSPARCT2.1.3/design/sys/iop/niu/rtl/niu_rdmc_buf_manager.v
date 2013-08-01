// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rdmc_buf_manager.v
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
/*************************************************************************
 *
 * File Name    : niu_rdmc_buf_manager.v
 * Author Name  : Jeanne Cai
 * Description  :
 * Date Created : 07/18/2004
 *
 * Copyright (c) 2001, Sun Microsystems, Inc.
 * Sun Proprietary and Confidential
 *
 *
 *************************************************************************/
`include "niu_rdmc.h"
module niu_rdmc_buf_manager (
			clk,
			reset,
			wred_enable,
			random_num,
			dma_chnl_grp_id,
			dma_data_offset,
			full_header,
			dma_en,
			dma_reset,
			page_valid0,
			addr_mask0,
			comp_value0,
			relo_value0,
			page_valid1,
                        addr_mask1,
                        comp_value1,
                        relo_value1,
			dma_fatal_err,
			rx_log_page_hdl_reg,
			rdc_red_param_reg,
			rbr_cfig_a_reg,
			rbr_cfig_b_reg,
			rbr_kick_reg,
			rbr_cfig_a_reg_wenu,
			rbr_cfig_a_reg_wenl,
			rbr_kick_reg_wen,
			muxed_pkt_len,
			muxed_rdc_num_r,
			muxed_drop_pkt_r,
			muxed_s_event_r,
			sel_buf_en,		//it is stage0_en_r, in stage1
			pkt_req_cnt_e_done_mod,
			pkt_buf_done,
			is_hdr_wr_data,
			is_jmb1_wr_data,
			fetch_desp_req_sm,
			fetch_desp_pre_done,
			fetch_desp_done,
			fetch_desp_resp_vld,
			rdmc_resp_data_valid,
			cache_start_addr,	
			cache_end_addr,
			cache_buf_rd_gnt,
			cache_buf_rd_data,
			cache_parity_err,
			rcr_curr_qlen,
			shadw_curr_space_cnt,

			chnl_sel_buf_en_r,
			desp_init_valid,
			fetch_desp_trig,
			fetch_desp_addr,
			fetch_desp_num,
			cache_read_req,
			cache_rd_ptr,
			cache_wr_ptr,
			drop_pkt,
			pkt_buf_gnt,
			pkt_buf_size,
			pkt_buf_addr,
			orig_buf_addr,
			pref_buf_used_num,
			pkt_trans_len,
			desp_curr_addr,
			desp_curr_cnt,
			desp_addr_not_valid,
			buf_addr_not_valid,
			rbr_addr_overflow,
			desp_curr_cnt_overflow,
			rbr_empty,
			wred_drop_pkt,
			rcr_drop_pkt,
			rbr_drop_pkt,
			chnl_sel_buf_en,
			chnl_cache_parity_err

			);

input		clk;
input		reset;
input		wred_enable;
input[15:0]	random_num;
input[4:0]	dma_chnl_grp_id;
input[1:0]      dma_data_offset;
input           full_header;
input		dma_reset;
input		dma_en;
input		page_valid0;
input[31:0]     addr_mask0;
input[31:0]     comp_value0;
input[31:0]     relo_value0;
input           page_valid1;
input[31:0]     addr_mask1;
input[31:0]     comp_value1;
input[31:0]     relo_value1;
input		dma_fatal_err;
input[19:0]     rx_log_page_hdl_reg;
input[31:0]	rdc_red_param_reg;
input[53:0]     rbr_cfig_a_reg;
input[10:0]     rbr_cfig_b_reg;
input[15:0]     rbr_kick_reg;
input           rbr_cfig_a_reg_wenu;
input		rbr_cfig_a_reg_wenl;
input           rbr_kick_reg_wen;
input[13:0]	muxed_pkt_len;
input[4:0]	muxed_rdc_num_r;
input		muxed_drop_pkt_r;
input		muxed_s_event_r;
input		sel_buf_en;
input		pkt_req_cnt_e_done_mod;
input		pkt_buf_done;
input		is_hdr_wr_data;
input		is_jmb1_wr_data;
input		fetch_desp_req_sm;
input		fetch_desp_pre_done;
input		fetch_desp_done;
input		fetch_desp_resp_vld;
input		rdmc_resp_data_valid;
input[7:0]	cache_start_addr;
input[7:0]	cache_end_addr;
input		cache_buf_rd_gnt;
input[131:0]	cache_buf_rd_data;
input		cache_parity_err;
input[15:0]	rcr_curr_qlen;
input[7:0]	shadw_curr_space_cnt;

output		chnl_sel_buf_en_r;
output		desp_init_valid;
output		fetch_desp_trig;
output[63:0]	fetch_desp_addr;
output[4:0]	fetch_desp_num;
output		cache_read_req;
output[7:0]	cache_rd_ptr;
output[7:0]	cache_wr_ptr;
output		drop_pkt;
output		pkt_buf_gnt;
output[1:0]	pkt_buf_size;
output[63:0]	pkt_buf_addr;
output[35:0]	orig_buf_addr;
output[1:0]	pref_buf_used_num;
output[13:0]	pkt_trans_len;
output[15:0]	desp_curr_addr;
output[16:0]	desp_curr_cnt;
output		desp_addr_not_valid;
output		buf_addr_not_valid;
output		rbr_addr_overflow;
output		desp_curr_cnt_overflow;
output		rbr_empty;
output		wred_drop_pkt;
output		rcr_drop_pkt;
output		rbr_drop_pkt;
output		chnl_sel_buf_en;
output		chnl_cache_parity_err;


reg		rbr_cfig_a_reg_wenu_dly2;
reg		rbr_cfig_a_reg_wenu_dly;
reg             rbr_cfig_a_reg_wenl_dly2;
reg             rbr_cfig_a_reg_wenl_dly;

reg		rbr_kick_reg_wen_dly;
reg[16:0]	rbr_end_addr_r;


always @ (posedge clk)
if (reset)
	rbr_cfig_a_reg_wenu_dly <= 1'b0;
else if (dma_reset)
	rbr_cfig_a_reg_wenu_dly <= 1'b0;
else
	rbr_cfig_a_reg_wenu_dly <= rbr_cfig_a_reg_wenu;

always @ (posedge clk)
if (reset)
        rbr_cfig_a_reg_wenu_dly2 <= 1'b0;
else if (dma_reset)
	rbr_cfig_a_reg_wenu_dly2 <= 1'b0;
else
        rbr_cfig_a_reg_wenu_dly2 <= rbr_cfig_a_reg_wenu_dly;

always @ (posedge clk)
if (reset)
        rbr_cfig_a_reg_wenl_dly <= 1'b0;
else if (dma_reset)
        rbr_cfig_a_reg_wenl_dly <= 1'b0;
else
        rbr_cfig_a_reg_wenl_dly <= rbr_cfig_a_reg_wenl;

always @ (posedge clk)
if (reset)
        rbr_cfig_a_reg_wenl_dly2 <= 1'b0;
else if (dma_reset)
        rbr_cfig_a_reg_wenl_dly2 <= 1'b0;
else
        rbr_cfig_a_reg_wenl_dly2 <= rbr_cfig_a_reg_wenl_dly;


always @ (posedge clk)
if (reset)
	rbr_kick_reg_wen_dly <= 1'b0;
else if (dma_reset)
	rbr_kick_reg_wen_dly <= 1'b0;
else
	rbr_kick_reg_wen_dly <= rbr_kick_reg_wen;

/**********************************************/
//PIO programmed parameters
/**********************************************/
wire[19:0]	page_handle		= rx_log_page_hdl_reg[19:0];
wire[3:0]       wred_window             = rdc_red_param_reg[3:0];
wire[11:0]      wred_thresh             = rdc_red_param_reg[15:4];
wire[3:0]       wred_window_syn         = rdc_red_param_reg[19:16];
wire[11:0]      wred_thresh_syn         = rdc_red_param_reg[31:20];

wire[15:0]	rbr_max_len		= rbr_cfig_a_reg[53:38];
wire[25:0]	rbr_base_addr		= rbr_cfig_a_reg[37:12];
wire[15:0]	rbr_start_addr		= {rbr_cfig_a_reg[11:0], 4'b0};	//4 bytes aligned
wire[15:0]	rbr_end_addr		= rbr_end_addr_r[15:0];
wire		rbr_addr_overflow 	= rbr_end_addr_r[16] & dma_en;

wire[1:0]	cache_buf_size_sel	= rbr_cfig_b_reg[10:9];		//{00:4k, 01:8k, 10:16k,11:32k}
wire		size2_config_valid	= rbr_cfig_b_reg[8];
wire[1:0]	size2_buf_size_sel	= rbr_cfig_b_reg[7:6];		//{00:2k, 01:4k, 10:8k,11:16k}
wire		size1_config_valid	= rbr_cfig_b_reg[5];
wire[1:0]	size1_buf_size_sel	= rbr_cfig_b_reg[4:3];		//{00:1k, 01:2k, 10:4k,11:8k}
wire		size0_config_valid	= rbr_cfig_b_reg[2];
wire[1:0]	size0_buf_size_sel	= rbr_cfig_b_reg[1:0];		//{00:256, 01:512, 10:1k,11:2k}


/************************/
//descriptor manager
/************************/
reg		cal_addr_en;
reg[4:0]        addr_cnt;               // at most, fetch 16 addresses
reg[15:0]       desp_curr_addr_tmp;
reg[15:0]       desp_curr_addr;         // always on 4 bytes boundry
reg[16:0]       desp_curr_cnt;          // bit[16] is overflow bit
reg		inc_desp_curr_cnt;
reg		desp_curr_cnt_overflow_r;
reg[15:0]	desp_addr_avail_num;

reg[7:0]        cache_space_cnt;        //support 255 lines, for most cases, it is 8 lines
reg[7:0]	cache_buf_cnt;
reg		inc_cache_buf_cnt;
reg             cache_buf_empty;
reg             cache_buf_full;

reg[4:0]        fetch_desp_num;

wire[15:0]	rbr_end_addr_sub = rbr_max_len[15:0] - 16'd1;

always @ (posedge clk)
if (reset)
	rbr_end_addr_r <= 17'b0;
else if (dma_reset)
	rbr_end_addr_r <= 17'b0;
else if (rbr_cfig_a_reg_wenu_dly & (|rbr_max_len))
	rbr_end_addr_r <= {1'b0, rbr_end_addr_sub[15:0]}; 
else if (rbr_cfig_a_reg_wenl_dly2 | rbr_cfig_a_reg_wenu_dly2)
	rbr_end_addr_r <= {1'b0, rbr_start_addr[15:0]} + rbr_end_addr_r;
else
	rbr_end_addr_r <= rbr_end_addr_r;

always @ (posedge clk)
if (reset)
	addr_cnt <= 5'b0;
else if (dma_reset)
	addr_cnt <= 5'b0;
else if (cal_addr_en)
	addr_cnt <= fetch_desp_num;
else if (addr_cnt != 5'b0)
	addr_cnt <= addr_cnt - 5'd1;
else
	addr_cnt <= addr_cnt;

always @ (posedge clk)
if (reset)
	desp_curr_addr_tmp <= 16'b0;
else if (dma_reset)
	desp_curr_addr_tmp <= 16'b0;
else if ((addr_cnt != 5'b0) & (desp_curr_addr_tmp == rbr_end_addr))
	desp_curr_addr_tmp <= rbr_start_addr;
else if (addr_cnt != 5'b0)
        desp_curr_addr_tmp <= desp_curr_addr_tmp + 16'd1;  
else if (cal_addr_en)
	desp_curr_addr_tmp <= desp_curr_addr;
else
	desp_curr_addr_tmp <= desp_curr_addr_tmp;

always @ (posedge clk)
if (reset)
        desp_curr_addr <= 16'b0;
else if (rbr_cfig_a_reg_wenl_dly)
        desp_curr_addr <= rbr_start_addr;
else if (fetch_desp_done)
        desp_curr_addr <= desp_curr_addr_tmp; 
else
        desp_curr_addr <= desp_curr_addr;

always @ (posedge clk)
if (reset)
	desp_addr_avail_num <= 16'b0;
else if (dma_reset)
	desp_addr_avail_num <= 16'b0;
else if (rbr_cfig_a_reg_wenu_dly)
	desp_addr_avail_num <= rbr_max_len[15:0];
else if (fetch_desp_pre_done)
	desp_addr_avail_num <= rbr_end_addr[15:0] - desp_curr_addr_tmp[15:0];  
else if (fetch_desp_done)
	desp_addr_avail_num <= desp_addr_avail_num + 16'd1;
else
	desp_addr_avail_num <= desp_addr_avail_num;


always @ (posedge clk)
if (reset)
	inc_desp_curr_cnt <= 1'b0;
else if (dma_reset)
	inc_desp_curr_cnt <= 1'b0;
else if (rbr_kick_reg_wen & !fetch_desp_pre_done | rbr_kick_reg_wen_dly & !inc_desp_curr_cnt)
	inc_desp_curr_cnt <= 1'b1;
else
	inc_desp_curr_cnt <= 1'b0;

always @ (posedge clk)
if (reset)
	desp_curr_cnt <= 17'b0;		//pio read only
else if (dma_reset)
	desp_curr_cnt <= 17'b0;
else if (desp_curr_cnt[16] | desp_curr_cnt_overflow_r)
	desp_curr_cnt <= desp_curr_cnt;
else if (inc_desp_curr_cnt)
	desp_curr_cnt <= desp_curr_cnt + {1'b0, rbr_kick_reg[15:0]}; // bit[16] is overflow bit
else if (fetch_desp_done)
	desp_curr_cnt <= desp_curr_cnt - {12'b0, fetch_desp_num[4:0]};
else
	desp_curr_cnt <= desp_curr_cnt;	


wire	desp_curr_cnt_overflow = (desp_curr_cnt > {1'b0, rbr_max_len}) & dma_en;

always @ (posedge clk)
if (reset)
	desp_curr_cnt_overflow_r <= 1'b0;
else if (dma_reset)
	desp_curr_cnt_overflow_r <= 1'b0;
else if (desp_curr_cnt_overflow)
	desp_curr_cnt_overflow_r <= 1'b1;
else
	desp_curr_cnt_overflow_r <= desp_curr_cnt_overflow_r;

/*****************************/
//request descriptor
/*****************************/
reg[31:0]  desp_relo_addr_r;
wire       rbr_empty            = (|cache_space_cnt[7:2]) & !(|desp_curr_cnt[15:0]) & dma_en;
wire	   fetch_desp_trig 	= (cache_space_cnt[7:0] > 8'd4) & (|desp_curr_cnt[15:0]);
wire[4:0]  desp_cnt_avail_num	= (|desp_curr_cnt[15:4])       ? 5'b10000 : desp_curr_cnt[4:0];
wire[4:0]  desp_addr_avail_num1	= (|desp_addr_avail_num[15:4]) ? 5'b10000 : desp_addr_avail_num[4:0];
wire[4:0]  fetch_desp_min_num   = (desp_addr_avail_num1[4:0] > desp_cnt_avail_num[4:0]) ? desp_cnt_avail_num[4:0] : 
											  desp_addr_avail_num1[4:0]; 

wire[43:0] desp_full_addr	= {rbr_base_addr[25:0], desp_curr_addr[15:0], 2'b0};

wire	   desp_addr_valid0	= ((desp_full_addr[43:12] & addr_mask0) == (comp_value0 & addr_mask0)) & page_valid0;
wire	   desp_addr_valid1	= ((desp_full_addr[43:12] & addr_mask1) == (comp_value1 & addr_mask1)) & page_valid1;

wire[31:0] desp_relo_addr0	= (desp_full_addr[43:12] & ~addr_mask0) | (relo_value0 & addr_mask0); 
wire[31:0] desp_relo_addr1	= (desp_full_addr[43:12] & ~addr_mask1) | (relo_value1 & addr_mask1);

wire[31:0] desp_relo_addr	= desp_addr_valid0 ? desp_relo_addr0 : desp_relo_addr1;
wire[63:0] fetch_desp_addr	= {page_handle[19:0], desp_relo_addr_r[31:0], desp_full_addr[11:0]};

wire	   desp_addr_not_valid	= !(desp_addr_valid0 | desp_addr_valid1) & dma_en;
wire	   desp_init_valid	= (desp_addr_valid0 | desp_addr_valid1) & dma_en;


always @ (posedge clk)
if (reset)
        cal_addr_en <= 1'b0;
else
        cal_addr_en <= fetch_desp_req_sm;

always @ (posedge clk)
if (reset)
	desp_relo_addr_r <= 32'b0;
else if (fetch_desp_req_sm)
	desp_relo_addr_r <= desp_relo_addr;
else	
	desp_relo_addr_r <= desp_relo_addr_r;
	
always @ (posedge clk)
if (reset)
	fetch_desp_num <= 5'b0;
else if (fetch_desp_req_sm)
	fetch_desp_num <= fetch_desp_min_num;
else
	fetch_desp_num <= fetch_desp_num; 


/******************************/
//buffer size decode
/******************************/
reg[7:0]	cache_buf_size_dec;
reg[7:0]	size2_buf_size_dec;
reg[7:0]	size1_buf_size_dec;
reg[7:0]	size0_buf_size_dec;
reg[7:0]	size2_buf_num_dec;
reg[7:0]	size1_buf_num_dec;
reg[7:0]	size0_buf_num_dec;
reg[7:0]	cache_buf_size_pre;
reg[9:0]	cache_buf_size1_pre;	//one cache - data_offset
reg[10:0]	cache_buf_size2_pre;	//for two cache buf size - 1 data_offset
reg[10:0]	cache_buf_size3_pre;	//for three cache buf size  - 2 data_offset
reg[7:0]        size2_buf_size_pre;
reg[7:0]        size1_buf_size_pre;
reg[7:0]        size0_buf_size_pre;
reg[7:0]	start_size2_buf_num;
reg[7:0]	start_size1_buf_num;
reg[7:0]	start_size0_buf_num;


wire[7:0]       byte_offset     = (dma_data_offset[1:0] == 2'b01) ? 8'd64 :
                                  (dma_data_offset[1:0] == 2'b10) ? 8'd128 : 8'd0;


always @(cache_buf_size_sel)
case(cache_buf_size_sel) //synopsys parallel_case full_case
2'd0:    cache_buf_size_dec = 8'h10;	//4k
2'd1:    cache_buf_size_dec = 8'h20;	//8k
2'd2:    cache_buf_size_dec = 8'h40;	//16k
2'd3:    cache_buf_size_dec = 8'h80;	//32k
default: cache_buf_size_dec = 8'h10;
endcase

always @(size2_buf_size_sel)
case(size2_buf_size_sel) //synopsys parallel_case full_case
2'd0:    size2_buf_size_dec = 8'h08;	//2k
2'd1:    size2_buf_size_dec = 8'h10;	//4k
2'd2:    size2_buf_size_dec = 8'h20;	//8k
2'd3:    size2_buf_size_dec = 8'h40;	//16k
default: size2_buf_size_dec = 8'h08;
endcase

always @(size1_buf_size_sel)
case(size1_buf_size_sel) //synopsys parallel_case full_case
2'd0:    size1_buf_size_dec = 8'h04;	//1k
2'd1:    size1_buf_size_dec = 8'h08;	//2k
2'd2:    size1_buf_size_dec = 8'h10;	//4k
2'd3:    size1_buf_size_dec = 8'h20;	//8k
default: size1_buf_size_dec = 8'h04;
endcase

always @(size0_buf_size_sel)
case(size0_buf_size_sel) //synopsys parallel_case full_case
2'd0:    size0_buf_size_dec = 8'h01;	//256
2'd1:    size0_buf_size_dec = 8'h02;	//512
2'd2:    size0_buf_size_dec = 8'h04;	//1k
2'd3:    size0_buf_size_dec = 8'h08;	//2k
default: size0_buf_size_dec = 8'h01;
endcase


always @(cache_buf_size_sel or size2_buf_size_sel)
case(cache_buf_size_sel)	//synopsys parallel_case full_case
2'b00: begin
	case(size2_buf_size_sel) //synopsys parallel_case full_case
	2'b00:	size2_buf_num_dec = 8'd2;
	2'b01:  size2_buf_num_dec = 8'd1; 
	2'b10:  size2_buf_num_dec = 8'd0;
	2'b11:  size2_buf_num_dec = 8'd0;
	default:size2_buf_num_dec = 8'd0;
	endcase
	end
2'b01: begin
        case(size2_buf_size_sel) //synopsys parallel_case full_case
        2'b00:  size2_buf_num_dec = 8'd4; 
        2'b01:  size2_buf_num_dec = 8'd2;
        2'b10:  size2_buf_num_dec = 8'd1;
        2'b11:  size2_buf_num_dec = 8'd0;
        default:size2_buf_num_dec = 8'd0;
        endcase
	end
2'b10: begin
        case(size2_buf_size_sel) //synopsys parallel_case full_case
        2'b00:  size2_buf_num_dec = 8'd8; 
        2'b01:  size2_buf_num_dec = 8'd4;
        2'b10:  size2_buf_num_dec = 8'd2;
        2'b11:  size2_buf_num_dec = 8'd1;
        default:size2_buf_num_dec = 8'd1;
        endcase
	end
2'b11: begin
        case(size2_buf_size_sel) //synopsys parallel_case full_case
        2'b00:  size2_buf_num_dec = 8'd16; 
        2'b01:  size2_buf_num_dec = 8'd8;
        2'b10:  size2_buf_num_dec = 8'd4;
        2'b11:  size2_buf_num_dec = 8'd2;
        default:size2_buf_num_dec = 8'd2;
        endcase
	end
default:	size2_buf_num_dec = 8'd0;
endcase

always @(cache_buf_size_sel or size1_buf_size_sel)
case(cache_buf_size_sel)  //synopsys parallel_case full_case
2'b00: begin
        case(size1_buf_size_sel) //synopsys parallel_case full_case
        2'b00:  size1_buf_num_dec = 8'd4; 
        2'b01:  size1_buf_num_dec = 8'd2;
        2'b10:  size1_buf_num_dec = 8'd1;
        2'b11:  size1_buf_num_dec = 8'd0;
        default:size1_buf_num_dec = 8'd0;
        endcase
	end
2'b01: begin
        case(size1_buf_size_sel) //synopsys parallel_case full_case
        2'b00:  size1_buf_num_dec = 8'd8; 
        2'b01:  size1_buf_num_dec = 8'd4;
        2'b10:  size1_buf_num_dec = 8'd2;
        2'b11:  size1_buf_num_dec = 8'd1;
        default:size1_buf_num_dec = 8'd1;
        endcase
	end
2'b10: begin
        case(size1_buf_size_sel) //synopsys parallel_case full_case
        2'b00:  size1_buf_num_dec = 8'd16; 
        2'b01:  size1_buf_num_dec = 8'd8;
        2'b10:  size1_buf_num_dec = 8'd4;
        2'b11:  size1_buf_num_dec = 8'd2;
        default:size1_buf_num_dec = 8'd2;
        endcase
	end
2'b11: begin
        case(size1_buf_size_sel) //synopsys parallel_case full_case
        2'b00:  size1_buf_num_dec = 8'd32; 
        2'b01:  size1_buf_num_dec = 8'd16;
        2'b10:  size1_buf_num_dec = 8'd8;
        2'b11:  size1_buf_num_dec = 8'd4;
        default:size1_buf_num_dec = 8'd4;
        endcase
	end
default:        size1_buf_num_dec = 8'd0;
endcase

always @(cache_buf_size_sel or size0_buf_size_sel)
case(cache_buf_size_sel)  //synopsys parallel_case full_case
2'b00: begin
        case(size0_buf_size_sel) //synopsys parallel_case full_case
        2'b00:  size0_buf_num_dec = 8'd16;
        2'b01:  size0_buf_num_dec = 8'd8;
        2'b10:  size0_buf_num_dec = 8'd4;
        2'b11:  size0_buf_num_dec = 8'd2;
        default:size0_buf_num_dec = 8'd2;
        endcase
	end
2'b01: begin
        case(size0_buf_size_sel) //synopsys parallel_case full_case
        2'b00:  size0_buf_num_dec = 8'd32;
        2'b01:  size0_buf_num_dec = 8'd16;
        2'b10:  size0_buf_num_dec = 8'd8;
        2'b11:  size0_buf_num_dec = 8'd4;
        default:size0_buf_num_dec = 8'd4;
        endcase
	end
2'b10: begin
        case(size0_buf_size_sel) //synopsys parallel_case full_case
        2'b00:  size0_buf_num_dec = 8'd64;
        2'b01:  size0_buf_num_dec = 8'd32;
        2'b10:  size0_buf_num_dec = 8'd16;
        2'b11:  size0_buf_num_dec = 8'd8;
        default:size0_buf_num_dec = 8'd8;
        endcase
	end
2'b11: begin
        case(size0_buf_size_sel) //synopsys parallel_case full_case
        2'b00:  size0_buf_num_dec = 8'd128;
        2'b01:  size0_buf_num_dec = 8'd64;
        2'b10:  size0_buf_num_dec = 8'd32;
        2'b11:  size0_buf_num_dec = 8'd16;
        default:size0_buf_num_dec = 8'd16;
        endcase
	end
default:        size0_buf_num_dec = 8'd0;
endcase


always @ (posedge clk)
if (reset)
	cache_buf_size_pre <= 8'b0;
else
	cache_buf_size_pre <= cache_buf_size_dec;

wire[15:0]	cache_buf_size		= {cache_buf_size_pre[7:0], 8'b0};
wire[9:0]	cache_buf_size1_in 	= {cache_buf_size_dec[7:0], 2'b0} - {8'b0, byte_offset[7:6]};

always @ (posedge clk)
if (reset)
        cache_buf_size1_pre <= 10'b0;
else
        cache_buf_size1_pre <= cache_buf_size1_in;

//wire[15:0]	cache_buf_size1		= {cache_buf_size1_pre[9:0], 6'b0};
wire[13:0]	cache_buf_size1		= {cache_buf_size1_pre[7:0], 6'b0};
wire[10:0]	cache_buf_size2_in 	= {cache_buf_size_pre[7:0], 3'b0} - {9'b0, byte_offset[7:6]};

always @ (posedge clk)
if (reset)
	cache_buf_size2_pre <= 11'b0;
else
	cache_buf_size2_pre <= cache_buf_size2_in;


//wire[16:0]	cache_buf_size2		= {cache_buf_size2_pre[10:0], 6'b0};
wire[15:0]	cache_buf_size2		= {cache_buf_size2_pre[9:0], 6'b0};
wire[10:0]	cache_buf_size3_in	= cache_buf_size2_pre[10:0] + {1'b0, cache_buf_size1_pre[9:0]};

always @ (posedge clk)
if (reset)
        cache_buf_size3_pre <= 11'b0;
else
        cache_buf_size3_pre <= cache_buf_size3_in;

wire[16:0]	cache_buf_size3		= {cache_buf_size3_pre[10:0], 6'b0};


always @ (posedge clk)
if (reset)
	size2_buf_size_pre <= 8'b0;
else
	size2_buf_size_pre <= size2_buf_size_dec;

wire[15:0]	size2_buf_size	= {size2_buf_size_pre[7:0], 8'b0};

always @ (posedge clk)
if (reset)
        size1_buf_size_pre <= 8'b0;
else
        size1_buf_size_pre <= size1_buf_size_dec;

wire[15:0]	size1_buf_size  = {size1_buf_size_pre[7:0], 8'b0};

always @ (posedge clk)
if (reset)
        size0_buf_size_pre <= 8'b0;
else
        size0_buf_size_pre <= size0_buf_size_dec;

wire[15:0]	size0_buf_size  = {size0_buf_size_pre[7:0], 8'b0};


always @ (posedge clk)
if (reset)
	start_size2_buf_num <= 8'b0;
else
	start_size2_buf_num <= size2_buf_num_dec;


always @ (posedge clk)
if (reset)
        start_size1_buf_num <= 8'b0;
else
        start_size1_buf_num <= size1_buf_num_dec;

always @ (posedge clk)
if (reset)
        start_size0_buf_num <= 8'b0;
else
        start_size0_buf_num <= size0_buf_num_dec;


/*********************************/
// cache memory manager 
/*********************************/
reg		cache_buf_rd_gnt_dly1;
reg		cache_buf_rd_gnt_dly2;
reg		cache_buf_rd_gnt_dly3;

reg[7:0]	cache_wr_ptr;
reg[7:0]	cache_rd_ptr;
reg[2:0]	cache_rd_cnt;	//at most read 4 addresses

wire	cache_buf_wr_gnt = fetch_desp_resp_vld & rdmc_resp_data_valid;
wire	last_rd_ptr	 = (cache_space_cnt == `CACHE_LEN_SUB1);
wire	last_wr_ptr	 = (cache_space_cnt == 8'd1); 

wire	last_wr_addr	= (cache_wr_ptr == cache_end_addr);
wire	last_rd_addr	= (cache_rd_ptr == cache_end_addr);

always @ (posedge clk)
if (reset)
	cache_wr_ptr <= cache_start_addr;
else if (dma_reset)
	cache_wr_ptr <= cache_start_addr;
else if (cache_buf_wr_gnt & last_wr_addr)
	cache_wr_ptr <= cache_start_addr;
else if (cache_buf_wr_gnt)
	cache_wr_ptr <= cache_wr_ptr + 8'd1;
else 
	cache_wr_ptr <= cache_wr_ptr;

always @ (posedge clk)
if (reset)
        cache_rd_ptr <= cache_start_addr;
else if (dma_reset)
	cache_rd_ptr <= cache_start_addr;
else if (cache_buf_rd_gnt_dly3 & last_rd_addr)
	cache_rd_ptr <= cache_start_addr;
else if (cache_buf_rd_gnt_dly3)
        cache_rd_ptr <= cache_rd_ptr + 8'd1;
else 
        cache_rd_ptr <= cache_rd_ptr;

always @ (posedge clk)
if (reset)
	cache_buf_empty <= 1'b1;
else if (dma_reset)
	cache_buf_empty <= 1'b1;
else if (cache_buf_wr_gnt)
	cache_buf_empty <= 1'b0;
else if (cache_buf_rd_gnt_dly3 & last_rd_ptr)
	cache_buf_empty <= 1'b1;
else
	cache_buf_empty <= cache_buf_empty;


always @ (posedge clk)
if (reset)
        cache_buf_full <= 1'b0;
else if (dma_reset)
	cache_buf_full <= 1'b0;
else if (cache_buf_rd_gnt_dly3)
        cache_buf_full <= 1'b0;
else if (cache_buf_wr_gnt & last_wr_ptr)
        cache_buf_full <= 1'b1;
else
        cache_buf_full <= cache_buf_full;

always @ (posedge clk)
if (reset)
        cache_space_cnt <= `CACHE_LEN;
else if (dma_reset)
	cache_space_cnt <= `CACHE_LEN;
else if (cache_buf_wr_gnt & cache_buf_rd_gnt_dly3)
        cache_space_cnt <= cache_space_cnt;
else if (cache_buf_wr_gnt)
        cache_space_cnt <= cache_space_cnt - 8'd1;
else if (cache_buf_rd_gnt_dly3)
        cache_space_cnt <= cache_space_cnt + 8'd1;
else
        cache_space_cnt <= cache_space_cnt;


wire[3:0] cache_rd_valid_bits = cache_buf_rd_data[131:128];

always @ (posedge clk)
if (reset)
        cache_buf_rd_gnt_dly1 <= 1'b0;
else if (dma_reset)
	cache_buf_rd_gnt_dly1 <= 1'b0;
else
        cache_buf_rd_gnt_dly1 <= cache_buf_rd_gnt;

always @ (posedge clk)
if (reset)
begin
	cache_buf_rd_gnt_dly2 <= 1'b0;
	cache_buf_rd_gnt_dly3 <= 1'b0;
end
else
begin
        cache_buf_rd_gnt_dly2 <= cache_buf_rd_gnt_dly1;
        cache_buf_rd_gnt_dly3 <= cache_buf_rd_gnt_dly2;
end

always @ (cache_rd_valid_bits)     
begin

case (cache_rd_valid_bits)	//synopsys parallel_case full_case

4'b0001, 4'b0010, 4'b0100, 4'b1000:
        cache_rd_cnt  = 3'b001;
4'b0011, 4'b0110, 4'b1100:
        cache_rd_cnt  = 3'b010;
4'b0111, 4'b1110:
        cache_rd_cnt  = 3'b011;
4'b1111:
        cache_rd_cnt  = 3'b100;
default:
        cache_rd_cnt  = 3'b000;
endcase
end

always @ (posedge clk)
if (reset)
        inc_cache_buf_cnt <= 1'b0;
else if (dma_reset)
	inc_cache_buf_cnt <= 1'b0;
else if (fetch_desp_pre_done & cache_buf_rd_gnt_dly3)
        inc_cache_buf_cnt <= 1'b1;
else
        inc_cache_buf_cnt <= 1'b0;

always @ (posedge clk)
if (reset)
	cache_buf_cnt <= 8'b0;
else if (dma_reset)
	cache_buf_cnt <= 8'b0;
else if (fetch_desp_pre_done & !cache_buf_rd_gnt_dly3 | inc_cache_buf_cnt)
        cache_buf_cnt <= cache_buf_cnt + {3'b0, fetch_desp_num[4:0]};
else if (cache_buf_rd_gnt_dly3)
	cache_buf_cnt <= cache_buf_cnt - {5'b0, cache_rd_cnt};
else
	cache_buf_cnt <= cache_buf_cnt;


/************************/
//Discard pkt
/************************/
reg             chnl_sel_buf_en;
reg             sel_buf_en_r;	//same as chnl_sel_buf_en
reg		drop_pkt;
reg		wred_drop_pkt;

wire		buf_addr_not_valid;
wire		rbr_drop_pkt;
wire		rcr_drop_pkt;
wire		shadow_not_empty	= (|shadw_curr_space_cnt); 
wire		shadow_not_e_empty	= (|shadw_curr_space_cnt[7:2]) | (&shadw_curr_space_cnt[1:0]);

wire            is_drop_pkt_tmp         = wred_drop_pkt | rcr_drop_pkt | muxed_drop_pkt_r | dma_fatal_err | !dma_en;
wire            sel_buf_enabled_tmp     = chnl_sel_buf_en & !is_drop_pkt_tmp;

wire		is_drop_pkt		= is_drop_pkt_tmp | rbr_drop_pkt;
wire		sel_buf_enabled		= chnl_sel_buf_en & !is_drop_pkt;

always @ (posedge clk)
if (reset)
        chnl_sel_buf_en <= 1'b0;
else if (dma_reset)
	chnl_sel_buf_en <= 1'b0;
else
        chnl_sel_buf_en <= sel_buf_en & (muxed_rdc_num_r == dma_chnl_grp_id);

always @ (posedge clk)
if (reset)
        sel_buf_en_r <= 1'b0;
else if (dma_reset)
	sel_buf_en_r <= 1'b0;
else
        sel_buf_en_r <= sel_buf_en & (muxed_rdc_num_r == dma_chnl_grp_id);

always @ (posedge clk)
if (reset)
	drop_pkt <= 1'b0;
else if (dma_reset)
	drop_pkt <= 1'b0;
else if (chnl_sel_buf_en)
	drop_pkt <= (is_drop_pkt | buf_addr_not_valid);
else
	drop_pkt <= 1'b0;

/*********************************/
// prefetch buffer manager
/*********************************/
reg[3:0]	use_pref_buf;		//pkt use pref buf, in stage2
reg[3:0]  	unload_pref_buf;	//size load pref buf, not in stage2
reg	  	is_last_pref_buf;
reg		d_pref_buf_valid;
reg		t_pref_buf_valid;

reg[127:0]	pref_buf_addr_reg;
reg		pref_buf0_valid;
reg		pref_buf1_valid;
reg		pref_buf2_valid;
reg		pref_buf3_valid;
reg		cache_read_req;

reg		size0_buf_req;
reg		size1_buf_req;
reg		size2_buf_req;

reg[31:0]	pref_buf_addr0;
reg[31:0]	pref_buf_addr1;
reg[31:0]	pref_buf_addr2;
reg[31:0]	pref_buf_addr3;


wire		get_pkt_pref_buf;
wire		pkt_pref_buf_in_use;

wire            chnl_cache_parity_err = cache_buf_rd_gnt_dly3 & cache_parity_err;
wire	  	load_pref_buf         = cache_buf_rd_gnt_dly3 & !cache_parity_err;

wire[31:0]	pref_buf_addr_tmp0 = cache_buf_rd_data[31:0];
wire[31:0]	pref_buf_addr_tmp1 = cache_buf_rd_data[63:32];
wire[31:0]      pref_buf_addr_tmp2 = cache_buf_rd_data[95:64];
wire[31:0]      pref_buf_addr_tmp3 = cache_buf_rd_data[127:96];

always @(cache_buf_size_sel or 
	 pref_buf_addr_tmp0 or pref_buf_addr_tmp1 or
	 pref_buf_addr_tmp2 or pref_buf_addr_tmp3)

case(cache_buf_size_sel) //synopsys parallel_case full_case
2'b00: begin
	pref_buf_addr0 = pref_buf_addr_tmp0[31:0]; 
	pref_buf_addr1 = pref_buf_addr_tmp1[31:0];
	pref_buf_addr2 = pref_buf_addr_tmp2[31:0];
	pref_buf_addr3 = pref_buf_addr_tmp3[31:0];
	end
2'b01: begin
        pref_buf_addr0 = {pref_buf_addr_tmp0[31:1], 1'b0}; 
        pref_buf_addr1 = {pref_buf_addr_tmp1[31:1], 1'b0};
        pref_buf_addr2 = {pref_buf_addr_tmp2[31:1], 1'b0};
        pref_buf_addr3 = {pref_buf_addr_tmp3[31:1], 1'b0};
        end
2'b10: begin
        pref_buf_addr0 = {pref_buf_addr_tmp0[31:2], 2'b0}; 
        pref_buf_addr1 = {pref_buf_addr_tmp1[31:2], 2'b0};
        pref_buf_addr2 = {pref_buf_addr_tmp2[31:2], 2'b0};
        pref_buf_addr3 = {pref_buf_addr_tmp3[31:2], 2'b0};
        end
2'b11: begin
        pref_buf_addr0 = {pref_buf_addr_tmp0[31:3], 3'b0}; 
        pref_buf_addr1 = {pref_buf_addr_tmp1[31:3], 3'b0};
        pref_buf_addr2 = {pref_buf_addr_tmp2[31:3], 3'b0};
        pref_buf_addr3 = {pref_buf_addr_tmp3[31:3], 3'b0};
        end
default: begin
        pref_buf_addr0 = pref_buf_addr_tmp0[31:0]; 
        pref_buf_addr1 = pref_buf_addr_tmp1[31:0];
        pref_buf_addr2 = pref_buf_addr_tmp2[31:0];
        pref_buf_addr3 = pref_buf_addr_tmp3[31:0];
        end
endcase


always @ (posedge clk)
if (reset)
	pref_buf_addr_reg <= 128'b0;
else if (load_pref_buf)
	pref_buf_addr_reg <= {pref_buf_addr3, pref_buf_addr2, pref_buf_addr1, pref_buf_addr0};
else
	pref_buf_addr_reg <= pref_buf_addr_reg;
	
always @ (posedge clk)
if (reset)
	pref_buf0_valid <= 1'b0;
else if (dma_reset)
	pref_buf0_valid <= 1'b0;
else if (unload_pref_buf[0] | get_pkt_pref_buf & use_pref_buf[0])
	pref_buf0_valid <= 1'b0;
else if (load_pref_buf)
	pref_buf0_valid <= cache_rd_valid_bits[0];
else
	pref_buf0_valid <= pref_buf0_valid;

always @ (posedge clk)
if (reset)
        pref_buf1_valid <= 1'b0;
else if (dma_reset)
	pref_buf1_valid <= 1'b0;
else if (unload_pref_buf[1] | get_pkt_pref_buf & use_pref_buf[1])
        pref_buf1_valid <= 1'b0;
else if (load_pref_buf)
        pref_buf1_valid <= cache_rd_valid_bits[1];
else
        pref_buf1_valid <= pref_buf1_valid;

always @ (posedge clk)
if (reset)
        pref_buf2_valid <= 1'b0;
else if (dma_reset)
	pref_buf2_valid <= 1'b0;
else if (unload_pref_buf[2] | get_pkt_pref_buf & use_pref_buf[2])
        pref_buf2_valid <= 1'b0;
else if (load_pref_buf)
        pref_buf2_valid <= cache_rd_valid_bits[2];
else
        pref_buf2_valid <= pref_buf2_valid;

always @ (posedge clk)
if (reset)
        pref_buf3_valid <= 1'b0;
else if (dma_reset)
	pref_buf3_valid <= 1'b0;
else if (unload_pref_buf[3] | get_pkt_pref_buf & use_pref_buf[3])
        pref_buf3_valid <= 1'b0;
else if (load_pref_buf)
        pref_buf3_valid <= cache_rd_valid_bits[3];
else
        pref_buf3_valid <= pref_buf3_valid;


wire[3:0]	pref_buf_valid_bits = {pref_buf3_valid, pref_buf2_valid, pref_buf1_valid, pref_buf0_valid};
wire		pref_buf_valid	    = |pref_buf_valid_bits;

wire[31:0]	muxed_pref_buf_addr = 	pref_buf0_valid ? pref_buf_addr_reg[31:0]  :
					pref_buf1_valid ? pref_buf_addr_reg[63:32] :
					pref_buf2_valid ? pref_buf_addr_reg[95:64] :	
							  pref_buf_addr_reg[127:96];

wire		size_buf_req	    = size0_buf_req | size1_buf_req | size2_buf_req;

always @ (pref_buf_valid_bits)     
begin

case (pref_buf_valid_bits)	//synopsys parallel_case full_case

4'b0001, 4'b0010, 4'b0100, 4'b1000:
        begin
	is_last_pref_buf = 1'b1;
	d_pref_buf_valid = 1'b0;
	t_pref_buf_valid = 1'b0;
	end
4'b0011, 4'b0110, 4'b1100:
	begin
        is_last_pref_buf = 1'b0;
        d_pref_buf_valid = 1'b1;
        t_pref_buf_valid = 1'b0;
        end
4'b0111, 4'b1110:
	begin
        is_last_pref_buf = 1'b0;
        d_pref_buf_valid = 1'b1;
        t_pref_buf_valid = 1'b1;
        end
4'b1111:
	begin
        is_last_pref_buf = 1'b0;
        d_pref_buf_valid = 1'b1;
        t_pref_buf_valid = 1'b1;
        end
default:
	begin
        is_last_pref_buf = 1'b0;
        d_pref_buf_valid = 1'b0;
        t_pref_buf_valid = 1'b0;
        end
endcase
end


always @ (pref_buf_valid_bits or size_buf_req or pkt_pref_buf_in_use)
begin
        if (size_buf_req & !pkt_pref_buf_in_use)
        begin
                if (pref_buf_valid_bits[0])
                        unload_pref_buf = 4'b0001;
                else if (pref_buf_valid_bits[1])
                        unload_pref_buf = 4'b0010;
                else if (pref_buf_valid_bits[2])
                        unload_pref_buf = 4'b0100;
                else if (pref_buf_valid_bits[3])
                        unload_pref_buf = 4'b1000;
		else
			unload_pref_buf = 4'b0000;
        end
        else    
		unload_pref_buf = 4'b0000;
end

wire	cache_buf_rd_gnt_p = cache_buf_rd_gnt | cache_buf_rd_gnt_dly1 | 
			     cache_buf_rd_gnt_dly2 | cache_buf_rd_gnt_dly3;

always @ (posedge clk)
if (reset)
        cache_read_req <= 1'b0;
else if (dma_reset)
	cache_read_req <= 1'b0;
else if (cache_buf_rd_gnt_p)
        cache_read_req <= 1'b0;
else if (!cache_buf_empty & (is_last_pref_buf & (|unload_pref_buf) | !pref_buf_valid))
        cache_read_req <= 1'b1;
else
        cache_read_req <= cache_read_req;


/*********************************/
// size buffer manager
/*********************************/
reg[2:0]        load_size_buf;
reg		size0_buf_valid;
reg		size1_buf_valid;
reg		size2_buf_valid;
reg[7:0]	curr_size0_buf_num;
reg[7:0]	curr_size1_buf_num;
reg[7:0]	curr_size2_buf_num;
reg[35:0]	curr_size0_buf_addr_pre;
reg[35:0]	curr_size1_buf_addr_pre;
reg[35:0]	curr_size2_buf_addr_pre;

wire		use_size0_buf;
wire		use_size1_buf;
wire		use_size2_buf;

wire		is_last_size0_buf = sel_buf_enabled & use_size0_buf & (curr_size0_buf_num == 8'h01);
wire		is_last_size1_buf = sel_buf_enabled & use_size1_buf & (curr_size1_buf_num == 8'h01);
wire		is_last_size2_buf = sel_buf_enabled & use_size2_buf & (curr_size2_buf_num == 8'h01);

always @ (posedge clk)
if (reset)
	size0_buf_valid	<= 1'b0;
else if (dma_reset)
	size0_buf_valid <= 1'b0;
else if (is_last_size0_buf)
        size0_buf_valid <= 1'b0;
else if (load_size_buf[0])
	size0_buf_valid <= 1'b1;
else
	size0_buf_valid <= size0_buf_valid;

always @ (posedge clk)
if (reset)
        size1_buf_valid <= 1'b0;
else if (dma_reset)
	size1_buf_valid <= 1'b0;
else if (is_last_size1_buf)
        size1_buf_valid <= 1'b0;
else if (load_size_buf[1])
        size1_buf_valid <= 1'b1;
else
        size1_buf_valid <= size1_buf_valid;

always @ (posedge clk)
if (reset)
        size2_buf_valid <= 1'b0;
else if (dma_reset)
	size2_buf_valid <= 1'b0;
else if (is_last_size2_buf)
        size2_buf_valid <= 1'b0;
else if (load_size_buf[2])
        size2_buf_valid <= 1'b1;
else
        size2_buf_valid <= size2_buf_valid;


always @ (posedge clk)
if (reset)
        curr_size0_buf_num <= 8'b0;
else if (dma_reset)
	curr_size0_buf_num <= 8'b0;
else if (sel_buf_enabled & use_size0_buf)
        curr_size0_buf_num <= curr_size0_buf_num - 8'h01;
else if (load_size_buf[0])
        curr_size0_buf_num <= start_size0_buf_num;
else
        curr_size0_buf_num <= curr_size0_buf_num;


always @ (posedge clk)
if (reset)
        curr_size1_buf_num <= 8'b0;
else if (dma_reset)
	curr_size1_buf_num <= 8'b0;
else if (sel_buf_enabled & use_size1_buf)
        curr_size1_buf_num <= curr_size1_buf_num - 8'h01;
else if (load_size_buf[1])
        curr_size1_buf_num <= start_size1_buf_num;
else
        curr_size1_buf_num <= curr_size1_buf_num;


always @ (posedge clk)
if (reset)
        curr_size2_buf_num <= 8'b0;
else if (dma_reset)
	curr_size2_buf_num <= 8'b0;
else if (sel_buf_enabled & use_size2_buf)
        curr_size2_buf_num <= curr_size2_buf_num - 8'h01;
else if (load_size_buf[2])
        curr_size2_buf_num <= start_size2_buf_num;
else
        curr_size2_buf_num <= curr_size2_buf_num;


wire[43:0] curr_size0_buf_addr	   = {curr_size0_buf_addr_pre[35:0], 8'b0};
wire[43:0] curr_size1_buf_addr	   = {curr_size1_buf_addr_pre[35:0], 8'b0};
wire[43:0] curr_size2_buf_addr	   = {curr_size2_buf_addr_pre[35:0], 8'b0};
 
wire[7:0]  next_size0_buf_addr_tmp = curr_size0_buf_addr_pre[7:0] + size0_buf_size[15:8];
wire[35:0] next_size0_buf_addr     = {curr_size0_buf_addr_pre[35:8], next_size0_buf_addr_tmp[7:0]};

wire[7:0]  next_size1_buf_addr_tmp = curr_size1_buf_addr_pre[7:0] + size1_buf_size[15:8];
wire[35:0] next_size1_buf_addr     = {curr_size1_buf_addr_pre[35:8], next_size1_buf_addr_tmp[7:0]};

wire[7:0]  next_size2_buf_addr_tmp = curr_size2_buf_addr_pre[7:0] + size2_buf_size[15:8];
wire[35:0] next_size2_buf_addr     = {curr_size2_buf_addr_pre[35:8], next_size2_buf_addr_tmp[7:0]};


always @ (posedge clk)
if (reset)
	curr_size0_buf_addr_pre <= 36'b0;
else if (sel_buf_enabled & use_size0_buf)
        curr_size0_buf_addr_pre <= next_size0_buf_addr;
else if (load_size_buf[0])
	curr_size0_buf_addr_pre <= {muxed_pref_buf_addr, 4'b0};
else
	curr_size0_buf_addr_pre <= curr_size0_buf_addr_pre;

always @ (posedge clk)
if (reset)
        curr_size1_buf_addr_pre <= 36'b0;
else if (sel_buf_enabled & use_size1_buf)
        curr_size1_buf_addr_pre <= next_size1_buf_addr;
else if (load_size_buf[1])
        curr_size1_buf_addr_pre <= {muxed_pref_buf_addr, 4'b0};
else
        curr_size1_buf_addr_pre <= curr_size1_buf_addr_pre;

always @ (posedge clk)
if (reset)
        curr_size2_buf_addr_pre <= 36'b0;
else if (sel_buf_enabled & use_size2_buf)
        curr_size2_buf_addr_pre <= next_size2_buf_addr;
else if (load_size_buf[2])
        curr_size2_buf_addr_pre <= {muxed_pref_buf_addr, 4'b0};
else
        curr_size2_buf_addr_pre <= curr_size2_buf_addr_pre;

/**************************************/
//req for loading new size buffer
/**************************************/
always @ (posedge clk)
if (reset)
	size0_buf_req <= 1'b0;
else if (dma_reset)
	size0_buf_req <= 1'b0;
else if (load_size_buf[0])
	size0_buf_req <= 1'b0;
else if ((is_last_size0_buf | !size0_buf_valid) & size0_config_valid)
	size0_buf_req <= 1'b1;
else
	size0_buf_req <= size0_buf_req;

always @ (posedge clk)
if (reset)
        size1_buf_req <= 1'b0;
else if (dma_reset)
	size1_buf_req <= 1'b0;
else if (load_size_buf[1])
        size1_buf_req <= 1'b0;
else if ((is_last_size1_buf | !size1_buf_valid) & size1_config_valid)
        size1_buf_req <= 1'b1;
else
        size1_buf_req <= size1_buf_req;

always @ (posedge clk)
if (reset)
        size2_buf_req <= 1'b0;
else if (dma_reset)
	size2_buf_req <= 1'b0;
else if (load_size_buf[2])
        size2_buf_req <= 1'b0;
else if ((is_last_size2_buf | !size2_buf_valid) & size2_config_valid)
        size2_buf_req <= 1'b1;
else
        size2_buf_req <= size2_buf_req;


always @ (size0_buf_req or size1_buf_req or
	  size2_buf_req or pref_buf_valid or pkt_pref_buf_in_use)
begin
	if (pref_buf_valid & !pkt_pref_buf_in_use)
	begin
		if (size2_buf_req)
			load_size_buf = 3'b100;
		else if (size1_buf_req)
			load_size_buf = 3'b010;
		else if (size0_buf_req)
			load_size_buf = 3'b001;
		else 	
			load_size_buf = 3'b000;
	end
	else	load_size_buf = 3'b000;
end


/***********************************************************/
//select proper buffer for incoming pkt
/***********************************************************/
reg		chnl_sel_buf_en_r;
reg[7:0]	pkt_hdr_byte_r;
reg[13:0]	muxed_pkt_len_r;
reg[14:0]	full_len_r;
reg[13:0]	pkt_len_leftover;
reg[13:0]	pkt_trans_len;

reg		sel_size0_buf_r;
reg		sel_size1_buf_r;
reg		sel_size2_buf_r;
reg		sel_1pref_buf_r;
reg		sel_2pref_buf_r;
reg		sel_3pref_buf_r;
reg		sel_size_buf_r;
reg		sel_size_buf_r1;
reg		use_1pref_buf_r;
reg		use_2pref_buf_r;
reg		use_3pref_buf_r;

reg		pkt_buf_gnt;
reg[43:0]	buf_new_addr_r;
reg[35:0]	buf_addr_r;
reg[1:0]	pkt_buf_size;
reg[1:0]	pref_buf_used_num_r;
reg		jmb_pkt_in_process;

wire[7:0]	pkt_hdr_byte	= full_header ? (byte_offset + 8'd18) : (byte_offset + 8'd2);
wire[7:0]	pkt_hdr_byte1	= full_header ? 8'd18 : 8'd2;

wire[14:0]	full_len1	= {1'b0, muxed_pkt_len[13:0]};
wire[14:0]	full_len2	= {7'b0, pkt_hdr_byte_r[7:0]};
wire[14:0]	full_len	= full_len1 + full_len2;	//include offset	

wire[13:0]	real_len	= muxed_pkt_len_r[13:0] + {6'b0, pkt_hdr_byte1[7:0]};		//not include offset
wire		pkt_len_overflow= full_len_r[14];

wire 		sel_size0_buf	= (size0_buf_size[13:0]	>= full_len_r[13:0]); 
wire 		sel_size1_buf	= (size1_buf_size[13:0]	>= full_len_r[13:0]);
wire 		sel_size2_buf	= (size2_buf_size[14:0]	>= {1'b0, full_len_r[13:0]});
wire 		sel_1pref_buf	= (cache_buf_size[15:0]	>= {2'b0, full_len_r[13:0]}); 
wire 		sel_2pref_buf	= (cache_buf_size2[15:0]>= {2'b0, full_len_r[13:0]});
wire 		sel_3pref_buf	= (cache_buf_size3[16:0]>= {3'b0, full_len_r[13:0]});

wire[35:0]	orig_buf_addr = buf_addr_r[35:0];

wire		get_next_buf;
wire		get_last_buf;

always @ (posedge clk)
if (reset)
	pkt_hdr_byte_r <= 8'b0;
else
	pkt_hdr_byte_r <= pkt_hdr_byte;

always @ (posedge clk)
if (reset)
        muxed_pkt_len_r <= 14'b0;
else
        muxed_pkt_len_r <= muxed_pkt_len[13:0];


always @ (posedge clk)
if (reset)
	full_len_r <= 15'b0;
else
	full_len_r <= full_len;


always @ (posedge clk)
if (reset)
        pkt_len_leftover <= 14'b0;
else if (sel_buf_en_r)
        pkt_len_leftover <= full_len_r[13:0] - cache_buf_size[13:0];
else if (get_next_buf)
        pkt_len_leftover <= pkt_len_leftover - cache_buf_size1[13:0];
else
	pkt_len_leftover <= pkt_len_leftover;


always @ (posedge clk)
if (reset)
	sel_size0_buf_r <= 1'b0;
else
	sel_size0_buf_r <= sel_size0_buf;

always @ (posedge clk)
if (reset)
        sel_size1_buf_r <= 1'b0;
else
	sel_size1_buf_r <= sel_size1_buf;

always @ (posedge clk)
if (reset)
        sel_size2_buf_r <= 1'b0;
else
        sel_size2_buf_r <= sel_size2_buf;


always @ (posedge clk)
if (reset)
begin
	sel_size_buf_r  <= 1'b0;
	sel_size_buf_r1 <= 1'b0;
end
else
begin
	sel_size_buf_r  <= (sel_size0_buf | sel_size1_buf | sel_size2_buf);
	sel_size_buf_r1 <= sel_size_buf_r;
end
 
always @ (posedge clk)
if (reset)
        sel_1pref_buf_r <= 1'b0;
else
	sel_1pref_buf_r <= sel_1pref_buf;

always @ (posedge clk)
if (reset)
        sel_2pref_buf_r <= 1'b0;
else
	sel_2pref_buf_r <= sel_2pref_buf & !sel_1pref_buf;

always @ (posedge clk)
if (reset)
        sel_3pref_buf_r <= 1'b0;
else
	sel_3pref_buf_r <= sel_3pref_buf & !(sel_1pref_buf | sel_2pref_buf);
	
assign use_size0_buf	 = sel_size0_buf_r & size0_buf_valid;
wire   use_size1_buf_tmp = sel_size1_buf_r & size1_buf_valid;
wire   use_size2_buf_tmp = sel_size2_buf_r & size2_buf_valid;
assign use_size1_buf	 = !use_size0_buf & use_size1_buf_tmp; 
assign use_size2_buf	 = !(use_size0_buf | use_size1_buf_tmp) & use_size2_buf_tmp;

wire use_1pref_buf	= !sel_size_buf_r & sel_1pref_buf_r & pref_buf_valid;
wire use_2pref_buf	= !sel_size_buf_r & sel_2pref_buf_r & (d_pref_buf_valid | pref_buf_valid & !cache_buf_empty);
wire use_3pref_buf	= !sel_size_buf_r & sel_3pref_buf_r & (pref_buf_valid & (|cache_buf_cnt[7:1]) |
					     d_pref_buf_valid & !cache_buf_empty |
					     t_pref_buf_valid);  

wire is_use_pref_buf	= (use_1pref_buf | use_2pref_buf | use_3pref_buf) & !pkt_len_overflow;
wire is_use_size_buf	= (use_size0_buf | use_size1_buf | use_size2_buf) & !pkt_len_overflow;

wire buf_gnt		= (is_use_pref_buf | is_use_size_buf);

wire[1:0]  buf_size_in	= use_size0_buf ? 2'b00 :
			  use_size1_buf ? 2'b01 :
			  use_size2_buf ? 2'b10 :
					  2'b11;

always @ (posedge clk)
if (reset)
        pkt_buf_gnt <= 1'b0;
else if (dma_reset)
	pkt_buf_gnt <= 1'b0;
else if (sel_buf_enabled_tmp & !buf_addr_not_valid)
        pkt_buf_gnt <= buf_gnt;
else if (pkt_buf_done)
        pkt_buf_gnt <= 1'b0;
else
        pkt_buf_gnt <= pkt_buf_gnt;

always @ (posedge clk)
if (reset)
        pkt_buf_size <= 2'b0;
else if (sel_buf_en_r)
        pkt_buf_size <= buf_size_in;
else
        pkt_buf_size <= pkt_buf_size;


assign rbr_drop_pkt = !buf_gnt;
assign rcr_drop_pkt = !((sel_size_buf_r | sel_1pref_buf_r) & shadow_not_empty | shadow_not_e_empty);


/*******************************/
//Calculate pkt transfer len
/*******************************/
wire            chnl_pkt_cnt_done = pkt_req_cnt_e_done_mod & (muxed_rdc_num_r == dma_chnl_grp_id);

wire		jmb_pkt_mode	= !(sel_size_buf_r | use_1pref_buf);
wire[1:0] pref_buf_used_num     = (sel_size_buf_r1 | use_1pref_buf_r) ? 2'b01 :
                                  use_2pref_buf_r 		      ? 2'b10 :
                                  use_3pref_buf_r 		      ? 2'b11 : 2'b00;

assign		get_next_buf	= chnl_pkt_cnt_done & is_hdr_wr_data & (&pref_buf_used_num_r);
assign		get_last_buf	= chnl_pkt_cnt_done & (is_hdr_wr_data & (pref_buf_used_num_r == 2'b10) |
						       is_jmb1_wr_data & (pref_buf_used_num_r == 2'b11));
				   
wire[13:0]	pkt_len_tmp	= (jmb_pkt_mode & sel_buf_en_r) ? cache_buf_size1[13:0]:
				  sel_buf_en_r		        ? real_len[13:0]     :
				  get_next_buf		        ? cache_buf_size1[13:0] : pkt_len_leftover;
				  			       

always @ (posedge clk)
if (reset)
begin
        use_1pref_buf_r <= 1'b0;
        use_2pref_buf_r <= 1'b0;
        use_3pref_buf_r <= 1'b0;
end
else if (sel_buf_en_r)
begin
        use_1pref_buf_r <= use_1pref_buf;
        use_2pref_buf_r <= use_2pref_buf;
        use_3pref_buf_r <= use_3pref_buf;
end

always @ (posedge clk)
if (reset)
        chnl_sel_buf_en_r <= 1'b0;
else if (dma_reset)
	chnl_sel_buf_en_r <= 1'b0;
else
        chnl_sel_buf_en_r <= sel_buf_enabled;

always @ (posedge clk)
if (reset)
	pref_buf_used_num_r <= 2'b0;
else if (chnl_sel_buf_en_r)
	pref_buf_used_num_r <= pref_buf_used_num;
else
	pref_buf_used_num_r <= pref_buf_used_num_r;

always @ (posedge clk)
if (reset)
	pkt_trans_len <= 14'b0;
else if (sel_buf_en_r | get_next_buf | get_last_buf)
	pkt_trans_len <= pkt_len_tmp;
else
	pkt_trans_len <= pkt_trans_len;

/*******************************/
//Calculate pkt transfer addr
/*******************************/
assign get_pkt_pref_buf		= sel_buf_enabled_tmp & is_use_pref_buf | get_next_buf | get_last_buf;
assign pkt_pref_buf_in_use	= chnl_sel_buf_en | jmb_pkt_in_process;

wire[43:0] buf_addr_tmp1= {44{use_size0_buf}} & curr_size0_buf_addr |
                          {44{use_size1_buf}} & curr_size1_buf_addr |
                          {44{use_size2_buf}} & curr_size2_buf_addr ;

wire[43:0] buf_addr_tmp2= is_use_size_buf & sel_buf_en_r ? buf_addr_tmp1 : {muxed_pref_buf_addr, 12'b0};


wire[43:0] buf_addr	= (dma_data_offset[1:0] == 2'b01) ? {buf_addr_tmp2[43:8], 8'b0100_0000} :
			  (dma_data_offset[1:0] == 2'b10) ? {buf_addr_tmp2[43:8], 8'b1000_0000} :
							     buf_addr_tmp2[43:0];


wire	   buf_addr_valid0	= ((buf_addr[43:12] & addr_mask0) == (comp_value0 & addr_mask0)) & page_valid0;
wire       buf_addr_valid1	= ((buf_addr[43:12] & addr_mask1) == (comp_value1 & addr_mask1)) & page_valid1;

assign	   buf_addr_not_valid	= !(buf_addr_valid0 | buf_addr_valid1) & buf_gnt & chnl_sel_buf_en & dma_en; 


wire[31:0] buf_relo_addr0	= (buf_addr[43:12] & ~addr_mask0) | (relo_value0 & addr_mask0);
wire[31:0] buf_relo_addr1	= (buf_addr[43:12] & ~addr_mask1) | (relo_value1 & addr_mask1);
wire[31:0] buf_relo_addr	= buf_addr_valid0 ? buf_relo_addr0 : buf_relo_addr1;
wire[43:0] buf_new_addr		= {buf_relo_addr, buf_addr[11:0]};
wire[63:0] pkt_buf_addr		= {page_handle[19:0], buf_new_addr_r[43:0]};

always @ (pref_buf_valid_bits)
begin
	if (pref_buf_valid_bits[0])
        	use_pref_buf = 4'b0001;
        else if (pref_buf_valid_bits[1])
                use_pref_buf = 4'b0010;
        else if (pref_buf_valid_bits[2])
                use_pref_buf = 4'b0100;
        else if (pref_buf_valid_bits[3])
                use_pref_buf = 4'b1000;
	else
		use_pref_buf = 4'b0000;
end


always @ (posedge clk)
if (reset)
	jmb_pkt_in_process <= 1'b0;
else if (dma_reset)
	jmb_pkt_in_process <= 1'b0;
else if (sel_buf_enabled_tmp & (use_2pref_buf | use_3pref_buf))
	jmb_pkt_in_process <= 1'b1;
else if (get_last_buf)
	jmb_pkt_in_process <= 1'b0;
else
	jmb_pkt_in_process <= jmb_pkt_in_process;


always @ (posedge clk)
if (reset)
        buf_new_addr_r <= 44'b0;
else if (sel_buf_en_r | get_next_buf | get_last_buf)
        buf_new_addr_r <= buf_new_addr;
else
        buf_new_addr_r <= buf_new_addr_r;

always @ (posedge clk)
if (reset)
        buf_addr_r <= 36'b0;
else if (sel_buf_en_r | get_next_buf | get_last_buf) 
        buf_addr_r <= buf_addr[43:8];
else
	buf_addr_r <= buf_addr_r;


/*************************/
//Weighted RED
/*************************/
reg[15:0]       wred_v2_tmp;
reg[16:0]	wred_v1;
reg[15:0]	wred_v2;

wire[11:0]	muxed_wred_thresh = muxed_s_event_r ? wred_thresh_syn : wred_thresh;
wire[3:0]	muxed_wred_window = muxed_s_event_r ? wred_window_syn : wred_window;
	
wire[16:0]	wred_v1_tmp	= {1'b0, rcr_curr_qlen[15:0]} - {5'b0, muxed_wred_thresh[11:0]};
//wire[15:0]	wred_v2_msb	= wred_v2_tmp[31:16];
//wire		wred_v3_tmp	= (wred_v2[15:0] < wred_v1[15:0]) & !wred_v1[16]; //drop pkt when cross (THRSH + WIN);
wire            wred_v3_tmp     = ((wred_v2[15:0] < wred_v1[15:0]) | (wred_v2[15:0] == wred_v1[15:0])) & !wred_v1[16]; //drop pkt when hit threshold

always @ (muxed_wred_window or random_num)
begin

case (muxed_wred_window)	//synopsys parallel_case full_case

/*
4'd0:	wred_v2_tmp = {16'b0, random_num};
4'd1:	wred_v2_tmp = {15'b0, random_num, 1'b0};
4'd2:   wred_v2_tmp = {14'b0, random_num, 2'b0};
4'd3:   wred_v2_tmp = {13'b0, random_num, 3'b0};
4'd4:   wred_v2_tmp = {12'b0, random_num, 4'b0};
4'd5:   wred_v2_tmp = {11'b0, random_num, 5'b0};
4'd6:   wred_v2_tmp = {10'b0, random_num, 6'b0};
4'd7:   wred_v2_tmp = {9'b0,  random_num, 7'b0};
4'd8:   wred_v2_tmp = {8'b0,  random_num, 8'b0};
4'd9:   wred_v2_tmp = {7'b0,  random_num, 9'b0};
4'd10:  wred_v2_tmp = {6'b0,  random_num, 10'b0};
4'd11:  wred_v2_tmp = {5'b0,  random_num, 11'b0};
4'd12:  wred_v2_tmp = {4'b0,  random_num, 12'b0};
4'd13:  wred_v2_tmp = {3'b0,  random_num, 13'b0};
4'd14:  wred_v2_tmp = {2'b0,  random_num, 14'b0};
4'd15:  wred_v2_tmp = {1'b0,  random_num, 15'b0};
*/

4'd0:   wred_v2_tmp = 16'b0;
4'd1:   wred_v2_tmp = {15'b0, random_num[15]};
4'd2:	wred_v2_tmp = {14'b0, random_num[15:14]};
4'd3:   wred_v2_tmp = {13'b0, random_num[15:13]};
4'd4:   wred_v2_tmp = {12'b0, random_num[15:12]};
4'd5:   wred_v2_tmp = {11'b0, random_num[15:11]};
4'd6:   wred_v2_tmp = {10'b0, random_num[15:10]};
4'd7:   wred_v2_tmp = {9'b0, random_num[15:9]};
4'd8:   wred_v2_tmp = {8'b0, random_num[15:8]};
4'd9:   wred_v2_tmp = {7'b0, random_num[15:7]};
4'd10:  wred_v2_tmp = {6'b0, random_num[15:6]};
4'd11:  wred_v2_tmp = {5'b0, random_num[15:5]};
4'd12:  wred_v2_tmp = {4'b0, random_num[15:4]};
4'd13:  wred_v2_tmp = {3'b0, random_num[15:3]};
4'd14:  wred_v2_tmp = {2'b0, random_num[15:2]};
4'd15:  wred_v2_tmp = {1'b0, random_num[15:1]};


endcase
end


always @ (posedge clk)
if (reset)
begin
	wred_v1 	<= 17'b0;
	wred_v2		<= 16'b0;
end
else
begin
	wred_v1 	<= wred_v1_tmp[16:0];
	wred_v2		<= wred_v2_tmp[15:0];
end


always @ (posedge clk)
if (reset)
	wred_drop_pkt <= 1'b0;
else if (dma_reset)
	wred_drop_pkt <= 1'b0;
else if (!wred_enable)
	wred_drop_pkt <= 1'b0;
else if (sel_buf_en)
	wred_drop_pkt <= wred_v3_tmp;
else
	wred_drop_pkt <= 1'b0;

	

endmodule


