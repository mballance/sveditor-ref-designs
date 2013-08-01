// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rdmc_rcr_manager.v
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
 * File Name    : niu_rdmc_rcr_manager.v
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
module niu_rdmc_rcr_manager (
			clk,
			reset,
			clk_div_value,
			dma_chnl_grp_id,
			shadw_start_addr,
			shadw_rd_end_addr,
			shadw_wr_end_addr,
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
			rcr_cfig_a_reg,
			rcr_cfig_b_reg,
			rx_dma_ctl_stat_reg,
			rx_dma_ctl_stat_reg_bit47,
			rcr_flush_reg,
			mbox_addr,
			rcr_cfig_a_reg_wenu,
			rcr_cfig_a_reg_wenl,
			rx_dma_ctl_stat_reg_wenu,
			rx_dma_ctl_stat_reg_wenl,
			chnl_sel_buf_en_r,	//from niu_rdmc_buf_manager.v
			pref_buf_used_num,	//up to three for jumbo packets
			wr_transfer_comp_int,
			wr_last_pkt_data,
			update_rcr_shadw,	//from niu_rdmc_wr_sched.v, need chnl id
			rdmc_wr_data_dma_num,
			rcr_wrbk_gnt,
			rcr_wrbk_done,
			rcr_wrbk_pkt_num,
			rdmc_rcr_ack_valid,
			rdmc_rcr_ack_err,
			rdmc_rcr_ack_dma_num,
			shadw_parity_err,

			shadw_wr_en,
			shadw_wr_even,
			shadw_wr_ptr,
			shadw_rd_ptr,
			rcr_wrbk_sched,
			rcr_wrbk_req,
			rcr_wrbk_addr,
			rcr_wrbk_numb,
			rcr_wrbk_data_type,
			rcr_ack_accept,
			rcr_curr_qlen,
			shadw_curr_space_cnt,
			reset_rcr_flush,
			m_bit_en,
			rcr_ctl_stat_word,
			rcr_curr_addr,
			rcr_status_a,
			rcr_addr_not_valid,
			mbox_addr_not_valid,
			rcr_addr_overflow,
			rcr_curr_cnt_overflow,
			rcr_curr_cnt_underflow,
			rcr_pkt_cnt_underflow,
			rcr_idle_cycle,
			rcr_ack_err,
			chnl_has_pkt,
			chnl_shadw_parity_err

			);

input		clk;
input		reset;
input[15:0]	clk_div_value;
input[4:0]      dma_chnl_grp_id;
input[7:0]      shadw_start_addr;
input[7:0]      shadw_rd_end_addr;
input[7:0]      shadw_wr_end_addr;
input		dma_en;
input		dma_reset;
input          	page_valid0;
input[31:0]    	addr_mask0;
input[31:0]    	comp_value0;
input[31:0]    	relo_value0;
input           page_valid1;
input[31:0]     addr_mask1;
input[31:0]     comp_value1;
input[31:0]     relo_value1;
input		dma_fatal_err;
input[19:0]    	rx_log_page_hdl_reg;
input[53:0]    	rcr_cfig_a_reg;
input[22:0]    	rcr_cfig_b_reg;
input[31:0]    	rx_dma_ctl_stat_reg;
input		rx_dma_ctl_stat_reg_bit47;
input          	rcr_flush_reg;
input[43:0]	mbox_addr;
input          	rcr_cfig_a_reg_wenu;
input		rcr_cfig_a_reg_wenl;
input          	rx_dma_ctl_stat_reg_wenu;
input		rx_dma_ctl_stat_reg_wenl;
input		chnl_sel_buf_en_r;
input[1:0]	pref_buf_used_num;
input		wr_transfer_comp_int;
input		wr_last_pkt_data;
input		update_rcr_shadw;
input[4:0]	rdmc_wr_data_dma_num;
input		rcr_wrbk_gnt;
input		rcr_wrbk_done;
input[3:0]	rcr_wrbk_pkt_num;
input		rdmc_rcr_ack_valid;
input		rdmc_rcr_ack_err;
input[4:0]	rdmc_rcr_ack_dma_num;
input		shadw_parity_err;

output		shadw_wr_en;
output		shadw_wr_even;
output[7:0]	shadw_wr_ptr;
output[7:0]	shadw_rd_ptr;
output		rcr_wrbk_sched;
output		rcr_wrbk_req;
output[63:0]	rcr_wrbk_addr;
output[3:0]	rcr_wrbk_numb;
output		rcr_wrbk_data_type;
output		rcr_ack_accept;
output[15:0]	rcr_curr_qlen;
output[7:0]	shadw_curr_space_cnt;
output		reset_rcr_flush;
output		m_bit_en;
output[2:0]	rcr_ctl_stat_word;
output[15:0]	rcr_curr_addr;
output[15:0]	rcr_status_a;
output		rcr_addr_not_valid;
output		mbox_addr_not_valid;
output		rcr_addr_overflow;
output		rcr_curr_cnt_overflow;
output		rcr_curr_cnt_underflow;
output		rcr_pkt_cnt_underflow;
output		rcr_idle_cycle;
output		rcr_ack_err;
output		chnl_has_pkt;
output		chnl_shadw_parity_err;

reg		rcr_cfig_a_reg_wenu_dly2;
reg		rcr_cfig_a_reg_wenu_dly;
reg             rcr_cfig_a_reg_wenl_dly2;
reg             rcr_cfig_a_reg_wenl_dly;

reg		rx_dma_ctl_stat_reg_wenu_dly;
reg		rx_dma_ctl_stat_reg_wenl_dly;

reg[3:0]	addr_cnt;
reg		cal_addr_en;

reg[15:0]	rcr_curr_addr_tmp;
reg[15:0]	rcr_curr_addr;
reg		dec_rcr_curr_cnt;
reg		dec_rcr_curr_cnt_r;
reg[16:0]	rcr_curr_cnt;		//bit[16] is overflow bit
reg[3:0]	rcr_wrbk_act_num;
reg[3:0]	rcr_wrbk_numb;
reg[16:0]	rcr_curr_pkt_cnt;
reg[3:0]	rcr_wrbk_pkt_num_sav;
reg[3:0]	rcr_wrbk_pkt_act_num;
reg[3:0]	rcr_wrbk_pkt_num_r;
reg		not_in_cacheline;
reg[43:0]	rcr_relo_addr_r;

reg		rcr_curr_cnt_overflow_r;
reg		shadw_parity_err_r;

reg		rcr_wrbk_data_type;
reg		rcr_wrbk_req;
reg		rcr_wrbk_sched;
reg		rcr_wrbk_done_r;
reg		rcr_wrbk_done_r1;
reg		rcr_wrbk_ack_done;
reg		rcr_wrbk_ack_done_r;
reg		mbox_update_done;
reg		rcr_ack_accept;

reg		rcr_idle_cycle;
reg		rcr_wrbk_req_sm;
reg		mbox_req_sm;
reg		rcr_wrbk_ack_done_sm;
reg		mbox_update_done_sm;
reg		rcr_ack_accept_sm;
reg		reset_rcr_timer;
reg		reset_m_bit;
reg[3:0]	state;
reg[3:0]	next_state;

reg		shadw_wr_en;
reg[7:0]	shadw_wr_ptr;
reg[7:0]	shadw_rd_ptr;
reg		inc_shadw_curr_cnt;
reg[7:0]	shadw_curr_cnt;
reg[5:0]	shadw_act_curr_cnt;
reg		dec_shadw_space_cnt;
reg[7:0]	shadw_curr_space_cnt;
reg		chnl_has_pkt_s1;
reg		chnl_has_pkt_s2;

reg		timer_m_bit;
reg[15:0]	clk_cnt;
reg[5:0]	timeout_cnt;
reg		rcr_timer_done_r;
reg		rcr_timer_done_r_dly;
reg		mbox_update_done_dly;
reg             rcr_flush_reg_dly;
reg		rcr_thresh_reg;
reg		thresh_m_bit;


wire[2:0]	rcr_ctl_stat_word;
wire[15:0]	rcr_curr_qlen		= rcr_curr_cnt[15:0];
//wire[17:0]	rcr_status_a		= {rcr_curr_cnt[16], rcr_curr_pkt_cnt[16:0]};
wire[15:0]	rcr_status_a		= rcr_curr_pkt_cnt[15:0];

wire		rcr_ack_err		= rdmc_rcr_ack_valid & rdmc_rcr_ack_err;
		

/**********************************************/
//PIO programmed parameters
/**********************************************/
reg[16:0]	rcr_end_addr_r;

wire[15:0]	rcr_max_len		= rcr_cfig_a_reg[53:38];
wire[24:0]	rcr_base_addr		= rcr_cfig_a_reg[37:13];
wire[15:0]	rcr_start_addr		= {rcr_cfig_a_reg[12:0], 3'b0};
wire[15:0]	rcr_end_addr		= rcr_end_addr_r[15:0];
wire		rcr_addr_overflow	= rcr_end_addr_r[16] & dma_en;

wire[15:0]	pkt_thresh		= rcr_cfig_b_reg[22:7];
wire		timeout_en		= rcr_cfig_b_reg[6];
wire[5:0]	timeout_value		= rcr_cfig_b_reg[5:0];

wire[19:0]	page_handle		= rx_log_page_hdl_reg;

wire		m_bit			= rx_dma_ctl_stat_reg_bit47;
//wire		rcr_thresh_bit		= rx_dma_ctl_stat_reg[46];
//wire		rcrto_bit		= rx_dma_ctl_stat_reg[45];
wire[15:0]	cpu_ptr_rd_num		= rx_dma_ctl_stat_reg[31:16];
wire[15:0]	cpu_pkt_rd_num		= rx_dma_ctl_stat_reg[15:0];

/****************************/
//RCR Manager
/****************************/
always @ (posedge clk)
if (reset)
        rcr_cfig_a_reg_wenu_dly <= 1'b0;
else if (dma_reset)
	rcr_cfig_a_reg_wenu_dly <= 1'b0;
else if (rcr_cfig_a_reg_wenu)
        rcr_cfig_a_reg_wenu_dly <= 1'b1;
else
	rcr_cfig_a_reg_wenu_dly <= 1'b0;

always @ (posedge clk)
if (reset)
        rcr_cfig_a_reg_wenu_dly2 <= 1'b0;
else
        rcr_cfig_a_reg_wenu_dly2 <= rcr_cfig_a_reg_wenu_dly;

always @ (posedge clk)
if (reset)
        rcr_cfig_a_reg_wenl_dly <= 1'b0;
else if (dma_reset)
        rcr_cfig_a_reg_wenl_dly <= 1'b0;
else if (rcr_cfig_a_reg_wenl)
        rcr_cfig_a_reg_wenl_dly <= 1'b1;
else
        rcr_cfig_a_reg_wenl_dly <= 1'b0;

always @ (posedge clk)
if (reset)
        rcr_cfig_a_reg_wenl_dly2 <= 1'b0;
else
        rcr_cfig_a_reg_wenl_dly2 <= rcr_cfig_a_reg_wenl_dly;


always @ (posedge clk)
if (reset)
        rx_dma_ctl_stat_reg_wenu_dly <= 1'b0;
else if (dma_reset)
	rx_dma_ctl_stat_reg_wenu_dly <= 1'b0;
else
        rx_dma_ctl_stat_reg_wenu_dly <= rx_dma_ctl_stat_reg_wenu;

always @ (posedge clk)
if (reset)
        rx_dma_ctl_stat_reg_wenl_dly <= 1'b0;
else if (dma_reset)
        rx_dma_ctl_stat_reg_wenl_dly <= 1'b0;
else
        rx_dma_ctl_stat_reg_wenl_dly <= rx_dma_ctl_stat_reg_wenl;


wire[15:0] rcr_end_addr_sub = rcr_max_len[15:0] - 16'd1;

always @ (posedge clk)
if (reset)
	rcr_end_addr_r <= 17'b0;
else if (dma_reset)
	rcr_end_addr_r <= 17'b0;
else if (rcr_cfig_a_reg_wenu_dly & (|rcr_max_len))
	rcr_end_addr_r <= {1'b0, rcr_end_addr_sub};
else if (rcr_cfig_a_reg_wenl_dly2 | rcr_cfig_a_reg_wenu_dly2)
	rcr_end_addr_r <= {1'b0, rcr_start_addr[15:0]} + rcr_end_addr_r;
else
	rcr_end_addr_r <= rcr_end_addr_r;


always @ (posedge clk)
if (reset)
        addr_cnt <= 4'b0;
else if (dma_reset)
	addr_cnt <= 4'b0;
else if (cal_addr_en)
        addr_cnt <= rcr_wrbk_act_num;	//each write back is one cache line for 8 addresses
else if (addr_cnt != 4'b0)
        addr_cnt <= addr_cnt - 4'd1;
else
        addr_cnt <= addr_cnt;

always @ (posedge clk)
if (reset)
        rcr_curr_addr_tmp <= 16'b0;
else if ((addr_cnt != 4'b0) & (rcr_curr_addr_tmp == rcr_end_addr))
        rcr_curr_addr_tmp <= rcr_start_addr;
else if (addr_cnt != 4'b0)
        rcr_curr_addr_tmp <= rcr_curr_addr_tmp + 16'd1;
else if (cal_addr_en)
        rcr_curr_addr_tmp <= rcr_curr_addr[15:0];
else
        rcr_curr_addr_tmp <= rcr_curr_addr_tmp;

always @ (posedge clk)
if (reset)
	rcr_curr_addr <= 16'b0;
else if (rcr_cfig_a_reg_wenl_dly)
	rcr_curr_addr <= rcr_start_addr;
else if (rcr_wrbk_ack_done & !shadw_parity_err_r)
	rcr_curr_addr <= rcr_curr_addr_tmp;
else
	rcr_curr_addr <= rcr_curr_addr;

always @ (posedge clk)
if (reset)
        dec_rcr_curr_cnt <= 1'b0;
else if (rx_dma_ctl_stat_reg_wenl & !rcr_wrbk_ack_done_sm | rx_dma_ctl_stat_reg_wenl_dly & !dec_rcr_curr_cnt)
        dec_rcr_curr_cnt <= 1'b1;
else
        dec_rcr_curr_cnt <= 1'b0;


always @ (posedge clk)
if (reset)
        rcr_curr_cnt <= 17'b0;         //pio read only, this is rcr addr cnt
else if (dma_reset)
	rcr_curr_cnt <= 17'b0;
else if (rcr_curr_cnt[16] | rcr_curr_cnt_overflow_r)
	rcr_curr_cnt <= rcr_curr_cnt;
else if (dec_rcr_curr_cnt)
        rcr_curr_cnt <= rcr_curr_cnt - {1'b0, cpu_ptr_rd_num[15:0]}; // bit[16] is overflow bit
else if (rcr_wrbk_ack_done & !shadw_parity_err_r)
        rcr_curr_cnt <= rcr_curr_cnt + {13'b0, rcr_wrbk_act_num[3:0]};
else
        rcr_curr_cnt <= rcr_curr_cnt;

always @ (posedge clk)
if (reset)
	rcr_wrbk_pkt_num_sav <= 4'b0;
else if (dma_reset)
	rcr_wrbk_pkt_num_sav <= 4'b0;
else if (rcr_wrbk_ack_done & not_in_cacheline & !shadw_parity_err_r)
	rcr_wrbk_pkt_num_sav <= rcr_wrbk_pkt_num_r;
else if (rcr_wrbk_ack_done & !shadw_parity_err_r)
	rcr_wrbk_pkt_num_sav <= 4'b0;
else
	rcr_wrbk_pkt_num_sav <= rcr_wrbk_pkt_num_sav;

always @ (posedge clk)
if (reset)
	rcr_wrbk_pkt_act_num <= 4'b0;
else if (dma_reset)
	rcr_wrbk_pkt_act_num <= 4'b0;
else if (rcr_wrbk_ack_done_sm & !shadw_parity_err_r)	
	rcr_wrbk_pkt_act_num <= (rcr_wrbk_pkt_num_r - rcr_wrbk_pkt_num_sav);
else
	rcr_wrbk_pkt_act_num <= rcr_wrbk_pkt_act_num;

always @ (posedge clk)
if (reset)
	rcr_curr_pkt_cnt <= 17'b0;
else if (dma_reset)
	rcr_curr_pkt_cnt <= 17'b0;
else if (rcr_curr_pkt_cnt[16] | rcr_curr_cnt_overflow_r)
	rcr_curr_pkt_cnt <= rcr_curr_pkt_cnt;
else if (dec_rcr_curr_cnt)
	rcr_curr_pkt_cnt <= rcr_curr_pkt_cnt - {1'b0, cpu_pkt_rd_num[15:0]};
else if (rcr_wrbk_ack_done & !shadw_parity_err_r)
	rcr_curr_pkt_cnt <= rcr_curr_pkt_cnt + {13'b0, rcr_wrbk_pkt_act_num[3:0]};
else
	rcr_curr_pkt_cnt <= rcr_curr_pkt_cnt; 

/******************************/
//RCR overflow/underflow
/******************************/
//can not detect real packet count overflow
wire    rcr_curr_cnt_overflow 	= rcr_wrbk_ack_done_r & (rcr_curr_cnt > {1'b0, rcr_max_len[15:0]}) & dma_en;
wire	rcr_curr_cnt_underflow	= dec_rcr_curr_cnt_r & rcr_curr_cnt[16];
wire	rcr_pkt_cnt_underflow	= dec_rcr_curr_cnt_r & rcr_curr_pkt_cnt[16];

always @ (posedge clk)
if (reset)
	dec_rcr_curr_cnt_r <= 1'b0;
else
        dec_rcr_curr_cnt_r <= dec_rcr_curr_cnt;

always @ (posedge clk)
if (reset)
        rcr_curr_cnt_overflow_r <= 1'b0;
else if (dma_reset)
	rcr_curr_cnt_overflow_r <= 1'b0;
else if (rcr_curr_cnt_overflow)
        rcr_curr_cnt_overflow_r <= 1'b1;
else
        rcr_curr_cnt_overflow_r <= rcr_curr_cnt_overflow_r;


wire	chnl_shadw_parity_err = shadw_parity_err & rcr_wrbk_sched;

always @ (posedge clk)
if (reset)
	shadw_parity_err_r <= 1'b0;
else if (rcr_wrbk_ack_done)
	shadw_parity_err_r <= 1'b0;
else if (chnl_shadw_parity_err | rcr_ack_err)
	shadw_parity_err_r <= 1'b1;
else
	shadw_parity_err_r <= shadw_parity_err_r;

/*********************************/
//request completion write back
/*********************************/
wire	  shadw_buf_not_empty	= (|shadw_act_curr_cnt);
wire	  shadw_buf_empty	= !shadw_buf_not_empty;
//wire	  mbox_update_true	= (rcrto_bit | rcr_thresh_bit) & m_bit;
wire	  timer_mbox_update	= timer_m_bit & (|rcr_curr_pkt_cnt);
wire	  thresh_mbox_update	= thresh_m_bit & rcr_thresh_reg;
wire	  mbox_update_true	= timer_mbox_update | thresh_mbox_update;
wire	  rcr_wrbk_trig		= (|shadw_curr_cnt[7:3]) | 
				  (rcr_timer_done_r | rcr_flush_reg | thresh_mbox_update) & shadw_buf_not_empty;

wire[3:0] rcr_wrbk_min_num	= (|shadw_curr_cnt[7:3]) ? 4'd8 : shadw_curr_cnt[3:0];
wire[3:0] rcr_wrbk_act_num_tmp	= not_in_cacheline ? (rcr_wrbk_min_num - {1'b0, rcr_curr_addr[2:0]}) : rcr_wrbk_min_num;

wire[43:0]	rcr_full_addr	= {rcr_base_addr[24:0], rcr_curr_addr[15:3], 6'b0}; //always start in cacheline

wire		rcr_addr_valid0	= ((rcr_full_addr[43:12] & addr_mask0) == (comp_value0 & addr_mask0)) & page_valid0;
wire		rcr_addr_valid1 = ((rcr_full_addr[43:12] & addr_mask1) == (comp_value1 & addr_mask1)) & page_valid1;

wire		rcr_addr_valid	= rcr_addr_valid0 | rcr_addr_valid1;

wire[31:0]	rcr_relo_addr0	= (rcr_full_addr[43:12] & ~addr_mask0) | (relo_value0 & addr_mask0);
wire[31:0]	rcr_relo_addr1	= (rcr_full_addr[43:12] & ~addr_mask1) | (relo_value1 & addr_mask1);

wire[31:0]	rcr_relo_addr	= rcr_addr_valid0 ? rcr_relo_addr0 : rcr_relo_addr1;

wire		mbox_addr_valid0= ((mbox_addr[43:12] & addr_mask0) == (comp_value0 & addr_mask0)) & page_valid0;
wire		mbox_addr_valid1= ((mbox_addr[43:12] & addr_mask1) == (comp_value1 & addr_mask1)) & page_valid1;

wire		mbox_addr_valid	= mbox_addr_valid0 | mbox_addr_valid1;

wire[31:0]	mbox_relo_addr0	= (mbox_addr[43:12] & ~addr_mask0) | (relo_value0 & addr_mask0);	
wire[31:0]	mbox_relo_addr1 = (mbox_addr[43:12] & ~addr_mask1) | (relo_value1 & addr_mask1);

wire[31:0]	mbox_relo_addr	= mbox_addr_valid0 ? mbox_relo_addr0 : mbox_relo_addr1;

wire[43:0]	relo_addr_tmp	= mbox_req_sm ? {mbox_relo_addr, mbox_addr[11:0]} : 
						{rcr_relo_addr, rcr_full_addr[11:0]};	
wire[63:0]	rcr_wrbk_addr   = {page_handle[19:0], rcr_relo_addr_r[43:0]};

wire		rcr_addr_not_valid  = !rcr_addr_valid & dma_en;
wire		mbox_addr_not_valid = !mbox_addr_valid & dma_en;

always @ (posedge clk)
if (reset)
        cal_addr_en <= 1'b0;
else
        cal_addr_en <= rcr_wrbk_req_sm;

always @ (posedge clk)
if (reset)
        rcr_relo_addr_r <= 44'b0;
else if (rcr_wrbk_req_sm | mbox_req_sm)
        rcr_relo_addr_r <= relo_addr_tmp;
else
        rcr_relo_addr_r <= rcr_relo_addr_r;

always @ (posedge clk)
if (reset)
        rcr_wrbk_act_num <= 4'b0;
else if (dma_reset)
	rcr_wrbk_act_num <= 4'b0;
else if (rcr_wrbk_req_sm)
        rcr_wrbk_act_num <= rcr_wrbk_act_num_tmp;
else
        rcr_wrbk_act_num <= rcr_wrbk_act_num;

always @ (posedge clk)
if (reset)
        rcr_wrbk_numb <= 4'b0;
else if (dma_reset)
	rcr_wrbk_numb <= 4'b0;
else if (rcr_wrbk_req_sm)
        rcr_wrbk_numb <= rcr_wrbk_min_num;
else
        rcr_wrbk_numb <= rcr_wrbk_numb;


always @ (posedge clk)
if (reset)
	not_in_cacheline <= 1'b0;
else if (dma_reset)
	not_in_cacheline <= 1'b0;
else if (rcr_wrbk_req_sm)
	not_in_cacheline <= !rcr_wrbk_min_num[3];
else
	not_in_cacheline <= not_in_cacheline;


always @ (posedge clk)
if (reset)
        rcr_wrbk_data_type <= 1'b0;
else if (dma_reset)
	rcr_wrbk_data_type <= 1'b0;
else if (rcr_wrbk_req_sm)
        rcr_wrbk_data_type <= 1'b1;
else if (mbox_req_sm)
	rcr_wrbk_data_type <= 1'b0;
else
        rcr_wrbk_data_type <= rcr_wrbk_data_type;

always @ (posedge clk)
if (reset)
	rcr_wrbk_req <= 1'b0;
else if (dma_reset)
	rcr_wrbk_req <= 1'b0;
else if (rcr_wrbk_gnt)		
	rcr_wrbk_req <= 1'b0;
else if (rcr_wrbk_req_sm | mbox_req_sm)
	rcr_wrbk_req <= 1'b1;
else
	rcr_wrbk_req <= rcr_wrbk_req;

always @ (posedge clk)
if (reset)
        rcr_wrbk_sched <= 1'b0;
else if (dma_reset)
	rcr_wrbk_sched <= 1'b0;
else if (rcr_wrbk_gnt)          
        rcr_wrbk_sched <= 1'b1;
else if (rcr_wrbk_done_r)
        rcr_wrbk_sched <= 1'b0;
else
        rcr_wrbk_sched <= rcr_wrbk_sched;

always @ (posedge clk)
if (reset)
begin
	rcr_wrbk_done_r  <= 1'b0;
	rcr_wrbk_done_r1 <= 1'b0;
end
else
begin
	rcr_wrbk_done_r  <= rcr_wrbk_sched & rcr_wrbk_done;
	rcr_wrbk_done_r1 <= rcr_wrbk_done_r;
end

always @ (posedge clk)
if (reset)
	rcr_wrbk_pkt_num_r <= 4'b0;
else if (dma_reset)
	rcr_wrbk_pkt_num_r <= 4'b0;
else if (rcr_wrbk_done_r1)
	rcr_wrbk_pkt_num_r <= rcr_wrbk_pkt_num;
else
	rcr_wrbk_pkt_num_r <= rcr_wrbk_pkt_num_r;

always @ (posedge clk)
if (reset)
begin
        rcr_wrbk_ack_done 	<= 1'b0;
	rcr_wrbk_ack_done_r	<= 1'b0;
	mbox_update_done  	<= 1'b0;
end
else
begin
        rcr_wrbk_ack_done       <= rcr_wrbk_ack_done_sm;
        rcr_wrbk_ack_done_r     <= rcr_wrbk_ack_done;
        mbox_update_done        <= mbox_update_done_sm;
end


always @ (posedge clk)
if (reset)
        rcr_ack_accept <= 1'b0;
else
        rcr_ack_accept <= rcr_ack_accept_sm;



/************************************/
//Completion write back FSM
/************************************/
wire	rdmc_rcr_ack = rdmc_rcr_ack_valid & (rdmc_rcr_ack_dma_num == dma_chnl_grp_id);

parameter

IDLE			= 4'd0,
WRBK_REQ		= 4'd1,
WAIT_WRBK_DONE		= 4'd2,
WAIT_WRBK_ACK		= 4'd3,
WRBK_ACK_DONE_WAIT1	= 4'd4,
WRBK_ACK_DONE_WAIT2	= 4'd5,
WRBK_ACK_DONE		= 4'd6,
MBOX_REQ		= 4'd7,
WAIT_MBOX_WR_DONE	= 4'd8,
WAIT_MBOX_ACK		= 4'd9,
COMP_S1			= 4'd10,
COMP_S2			= 4'd11;

always @ (state or rcr_addr_valid or mbox_addr_valid or
	  rcr_wrbk_trig or mbox_update_true or 
	  rcr_wrbk_sched or rcr_wrbk_done_r or 
	  rdmc_rcr_ack or rdmc_rcr_ack_err or
	  dma_fatal_err or shadw_parity_err_r or
	  rcr_timer_done_r)
begin
	rcr_idle_cycle		= 1'b0;
	rcr_wrbk_req_sm		= 1'b0;
	mbox_req_sm		= 1'b0;
	rcr_wrbk_ack_done_sm	= 1'b0;
	mbox_update_done_sm	= 1'b0;
	rcr_ack_accept_sm	= 1'b0;
	reset_rcr_timer		= 1'b0;
	reset_m_bit		= 1'b0;
	next_state		= 4'b0;

case (state)    //synopsys parallel_case full_case

IDLE:
begin
	rcr_idle_cycle	= 1'b1;
	if ((rcr_addr_valid | mbox_addr_valid) & !dma_fatal_err)
	begin
		if (rcr_wrbk_trig)
		begin
			rcr_wrbk_req_sm	= 1'b1;
			next_state	= WRBK_REQ;
		end
		else if (mbox_update_true)
		begin
			mbox_req_sm	= 1'b1;
			next_state	= MBOX_REQ;
		end
		else if (rcr_timer_done_r)
		begin
			reset_rcr_timer = 1'b1;
			next_state      = state;
		end
		else
			next_state	= state;
	end
	else
		 next_state	= state;
end

WRBK_REQ:
begin
	if (rcr_wrbk_sched)
		next_state	= WAIT_WRBK_DONE;
	else
		next_state	= state;
end

WAIT_WRBK_DONE:
begin
	if (rcr_wrbk_done_r)
		next_state	= WAIT_WRBK_ACK;
	else
		next_state	= state;
end

WAIT_WRBK_ACK:
begin
	if (rdmc_rcr_ack)
	begin
		rcr_wrbk_ack_done_sm	= 1'b1;
		rcr_ack_accept_sm	= 1'b1;
		if (shadw_parity_err_r | rdmc_rcr_ack_err)
			next_state	= IDLE;
		else
			next_state	= WRBK_ACK_DONE_WAIT1;
	end
	else
		next_state		= state;
end

WRBK_ACK_DONE_WAIT1:

	next_state	= WRBK_ACK_DONE_WAIT2;

WRBK_ACK_DONE_WAIT2:

	next_state      = WRBK_ACK_DONE;
	

WRBK_ACK_DONE:
begin
	if (mbox_update_true)
	begin
		mbox_req_sm	= 1'b1;
		next_state	= MBOX_REQ;
	end
	else if (rcr_timer_done_r)
	begin
		reset_m_bit	= 1'b1;
		reset_rcr_timer = 1'b1;
		next_state 	= COMP_S2;
	end
	else
	begin
		reset_m_bit	= 1'b1;
		next_state	= COMP_S2;
	end
end

MBOX_REQ:
begin
        if (rcr_wrbk_sched)
                next_state      = WAIT_MBOX_WR_DONE;
        else
                next_state      = state;
end

WAIT_MBOX_WR_DONE:
begin
        if (rcr_wrbk_done_r)
                next_state      = WAIT_MBOX_ACK;
        else
                next_state      = state;
end

WAIT_MBOX_ACK:
begin
        if (rdmc_rcr_ack)
        begin
                mbox_update_done_sm     = 1'b1; 
		rcr_ack_accept_sm	= 1'b1;
                next_state              = COMP_S1;
        end
        else
                next_state              = state;
end

COMP_S1:
begin
	if (rcr_timer_done_r)
		reset_rcr_timer = 1'b1;
	else
		reset_rcr_timer = 1'b0;

	reset_m_bit	= 1'b1;
	next_state      = COMP_S2;
end

COMP_S2:
        next_state      = IDLE;

default:
	next_state      = IDLE;

endcase
end

always @ (posedge clk)
if (reset)
        state <= 4'b0;
else if (dma_reset)
	state <= 4'b0;
else
        state <= next_state;



/*********************************/
// shadwow memory manager
/*********************************/
wire	shadw_wr_even	= shadw_curr_cnt[0];
wire	last_rd_addr	= (shadw_rd_ptr == shadw_rd_end_addr);
wire	last_wr_addr	= (shadw_wr_ptr == shadw_wr_end_addr);

always @ (posedge clk)
if (reset)
	shadw_wr_en <= 1'b0;
else if (dma_reset)
	shadw_wr_en <= 1'b0;
else 
	shadw_wr_en <= update_rcr_shadw & (rdmc_wr_data_dma_num == dma_chnl_grp_id);

always @ (posedge clk)
if (reset)
        shadw_wr_ptr <= shadw_start_addr;
else if (dma_reset)
	shadw_wr_ptr <= shadw_start_addr;
else if (shadw_wr_en & shadw_curr_cnt[0] & last_wr_addr)
        shadw_wr_ptr <= shadw_start_addr;
else if (shadw_wr_en & shadw_curr_cnt[0])
        shadw_wr_ptr <= shadw_wr_ptr + 8'd1;
else
        shadw_wr_ptr <= shadw_wr_ptr;


always @ (posedge clk)
if (reset)
        shadw_rd_ptr <= shadw_start_addr;
else if (dma_reset)
	shadw_rd_ptr <= shadw_start_addr;
else if (rcr_wrbk_ack_done & rcr_wrbk_numb[3] & last_rd_addr)
        shadw_rd_ptr <= shadw_start_addr;
else if (rcr_wrbk_ack_done & rcr_wrbk_numb[3])
        shadw_rd_ptr <= shadw_rd_ptr + 8'd4;
else
        shadw_rd_ptr <= shadw_rd_ptr;


always @ (posedge clk)
if (reset)
	inc_shadw_curr_cnt <= 1'b0;
else if (dma_reset)
	inc_shadw_curr_cnt <= 1'b0;
else if (shadw_wr_en & rcr_wrbk_ack_done)
	inc_shadw_curr_cnt <= 1'b1;
else
	inc_shadw_curr_cnt <= 1'b0;


always @ (posedge clk)
if (reset)
	shadw_curr_cnt <= 8'b0;
else if (dma_reset)
	shadw_curr_cnt <= 8'b0;
else if (shadw_wr_en & !rcr_wrbk_ack_done | inc_shadw_curr_cnt)
	shadw_curr_cnt <= shadw_curr_cnt + 8'd1;
else if (rcr_wrbk_ack_done & rcr_wrbk_numb[3])
	shadw_curr_cnt <= shadw_curr_cnt - 8'd8;
else
	shadw_curr_cnt <= shadw_curr_cnt;

always @ (posedge clk)
if (reset)
        shadw_act_curr_cnt <= 6'b0;	//support 4 cache line only
else if (dma_reset)
        shadw_act_curr_cnt <= 6'b0;
else if (shadw_wr_en & !rcr_wrbk_ack_done | inc_shadw_curr_cnt)
        shadw_act_curr_cnt <= shadw_act_curr_cnt + 6'd1;
else if (rcr_wrbk_ack_done)
        shadw_act_curr_cnt <= shadw_act_curr_cnt - {2'b0, rcr_wrbk_act_num[3:0]};
else
        shadw_act_curr_cnt <= shadw_act_curr_cnt;


always @ (posedge clk)
if (reset)
        dec_shadw_space_cnt <= 1'b0;
else if (chnl_sel_buf_en_r & rcr_wrbk_ack_done)
        dec_shadw_space_cnt <= 1'b1;
else
        dec_shadw_space_cnt <= 1'b0;


always @ (posedge clk)
if (reset)
	shadw_curr_space_cnt <= `SHADW_MAX_ADDR_CNT;
else if (dma_reset)
	shadw_curr_space_cnt <= `SHADW_MAX_ADDR_CNT;
else if (chnl_sel_buf_en_r & !rcr_wrbk_ack_done | dec_shadw_space_cnt)
	shadw_curr_space_cnt <= shadw_curr_space_cnt - {6'b0, pref_buf_used_num[1:0]};
else if (rcr_wrbk_ack_done & rcr_wrbk_numb[3])
	shadw_curr_space_cnt <= shadw_curr_space_cnt + 8'd8;
else
	shadw_curr_space_cnt <= shadw_curr_space_cnt;

always @ (posedge clk)
if (reset)
	chnl_has_pkt_s1	<= 1'b0;
else if (chnl_sel_buf_en_r)
	chnl_has_pkt_s1	<= 1'b1;
else if (wr_last_pkt_data & shadw_wr_en)
	chnl_has_pkt_s1	<= 1'b0;
else
	chnl_has_pkt_s1	<= chnl_has_pkt_s1;

always @ (posedge clk)
if (reset)
        chnl_has_pkt_s2 <= 1'b0;
else if (wr_last_pkt_data & shadw_wr_en)
        chnl_has_pkt_s2 <= 1'b1;
else if (wr_transfer_comp_int) 
        chnl_has_pkt_s2 <= 1'b0;
else
        chnl_has_pkt_s2 <= chnl_has_pkt_s2;

wire	chnl_has_pkt = chnl_has_pkt_s1 | chnl_has_pkt_s2;


/********************************/
//Mailbox operations
/********************************/
wire m_bit_en           = mbox_update_done & !rx_dma_ctl_stat_reg_wenu | mbox_update_done_dly;
wire set_rcrto_bit      = mbox_update_done ? rcr_timer_done_r : rcr_timer_done_r_dly;
wire m_bit_in		= !(rcr_thresh_reg | set_rcrto_bit);

assign rcr_ctl_stat_word= {m_bit_in, rcr_thresh_reg, set_rcrto_bit};

always @ (posedge clk)
if (reset)
	rcr_thresh_reg  <= 1'b0;
else
	rcr_thresh_reg	<= (rcr_curr_pkt_cnt[15:0] > pkt_thresh);

always @ (posedge clk)
if (reset)
        thresh_m_bit <= 1'b0;
else if (reset_m_bit)
        thresh_m_bit <= 1'b0;
else if (rcr_idle_cycle & !rx_dma_ctl_stat_reg_wenu_dly)
        thresh_m_bit <= m_bit;
else
        thresh_m_bit <= thresh_m_bit;

always @ (posedge clk)
if (reset)
begin
	rcr_timer_done_r_dly    <= 1'b0;
	mbox_update_done_dly    <= 1'b0;
end
else
begin
        rcr_timer_done_r_dly    <= mbox_update_done & rcr_timer_done_r;
        mbox_update_done_dly    <= mbox_update_done & rx_dma_ctl_stat_reg_wenu;
end

/********************************/
//RCR Timeout counter
/********************************/
wire	clk_cnt_done 		= (clk_cnt == clk_div_value);
wire	rcr_timer_done		= (timeout_cnt == timeout_value) & timeout_en;
wire	pio_wr_reset		= rx_dma_ctl_stat_reg_wenu_dly & m_bit & !rcr_timer_done_r;

always @ (posedge clk)
if (reset)
	timer_m_bit <= 1'b0;
else if (pio_wr_reset | reset_rcr_timer | m_bit_en)
	timer_m_bit <= 1'b0;
else if (rcr_timer_done)
	timer_m_bit <= m_bit;
else
	timer_m_bit <= timer_m_bit;


always @ (posedge clk)
if (reset)
	clk_cnt <= 16'b0;
else if (dma_reset)
	clk_cnt <= 16'b0;
else if (clk_cnt_done)
	clk_cnt <= 16'b0;
else
	clk_cnt <= clk_cnt + 16'd1;

always @ (posedge clk)
if (reset)
        timeout_cnt <= 6'b0;
else if (dma_reset)
	timeout_cnt <= 6'b0;
else if (pio_wr_reset | reset_rcr_timer)
        timeout_cnt <= 6'b0;
else if (rcr_timer_done)
	timeout_cnt <= timeout_cnt;
else if (clk_cnt_done & timeout_en)
        timeout_cnt <= timeout_cnt + 6'd1;
else
	timeout_cnt <= timeout_cnt;

always @ (posedge clk)
if (reset)
	rcr_timer_done_r <= 1'b0;
else if (pio_wr_reset | reset_rcr_timer)
	rcr_timer_done_r <= 1'b0;
else if (rcr_timer_done)
	rcr_timer_done_r <= 1'b1;
else
	rcr_timer_done_r <= rcr_timer_done_r;



/********************************/
//RCR Flush 
/********************************/
always @ (posedge clk)
if (reset)
        rcr_flush_reg_dly <= 1'b0;
else
        rcr_flush_reg_dly <= rcr_flush_reg;

wire	rcr_flush_pulse = rcr_flush_reg & !rcr_flush_reg_dly;
wire	reset_rcr_flush	= rcr_flush_pulse & shadw_buf_empty | rcr_wrbk_ack_done;


endmodule




