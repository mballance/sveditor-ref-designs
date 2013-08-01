// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rdmc_chnl_master.v
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
 * File Name    : niu_rdmc_chnl_master.v
 * Author Name  : Jeanne Cai
 * Description  :
 * Date Created : 07/18/2004
 *
 * Copyright (c) 2001, Sun Microsystems, Inc.
 * Sun Proprietary and Confidential
 *
 *
 *************************************************************************/
module niu_rdmc_chnl_master (
			clk,
			reset,
			wred_enable,
			random_num,
			clk_div_value,

			dma_chnl_grp_id,
			pio_32b_mode,
			pio_wen,
			pio_addr,
			pio_wdata,
			muxed_pkt_len,		//from wr_dp
			muxed_rdc_num_r,	//from wr_dp
			muxed_drop_pkt_r,
			muxed_s_event_r,
			sel_buf_en,		//from wr_sched
			pkt_req_cnt_e_done_mod,
			pkt_buf_done,
			is_hdr_wr_data,
			is_jmb1_wr_data,
			wr_transfer_comp_int,
			wr_last_pkt_data,
			update_rcr_shadw,
			cache_start_addr,
			cache_end_addr,
			cache_buf_rd_gnt,	//from cache_acc_ctrl
			cache_buf_rd_data,	//from cache_acc_ctrl
			fetch_desp_gnt,		//from desp_acc_ctrl
			rdmc_resp_rdy_valid,	//from desp_acc_ctrl
			rdmc_req_err,
                        rdmc_resp_cmd,
                        rdmc_resp_cmd_status,
                        rdmc_resp_data_status,
			rdmc_resp_dma_num,
			rdmc_resp_data_valid,
			rdmc_resp_byteenable,
			rdmc_resp_comp,
			rdmc_resp_trans_comp,
			resp_data_in_process,

			shadw_start_addr,
			shadw_rd_end_addr,
			shadw_wr_end_addr,
			rdmc_wr_data_dma_num,
			rcr_wrbk_gnt,
			rcr_wrbk_done,
			rcr_wrbk_pkt_num,
			rdmc_rcr_ack_valid,
			rdmc_rcr_ack_err,
			rdmc_rcr_ack_dma_num,
			cache_parity_err,
			shadw_parity_err,
			data_err_event,

//output
			pio_rd_gnt,
			chnl_pio_rd_data,
			rx_log_page_hdl_reg,	//to zcp
			dma_func_num,
			fetch_desp_req,		//to desp_acc_ctrl
			fetch_desp_addr,	//to desp_acc_ctrl
			fetch_desp_num,		//to desp_acc_ctrl
			rdmc_resp_accept_sm,	//to desp_acc_ctrl
			fetch_desp_resp_vld,	//to desp_acc_ctrl
			cache_read_req,		//to cache_acc_ctrl
			cache_rd_ptr,		//to cache_acc_ctrl
			cache_wr_ptr,		//to cache_acc_ctrl
			full_header,		//to wr_sched
			drop_pkt,
			pkt_buf_gnt,		//to wr_sched
			pkt_buf_size,
			pkt_buf_addr,		//to wr_sched
			orig_buf_addr,
			pref_buf_used_num,
			pkt_trans_len,

			shadw_wr_en,
			shadw_wr_even,
			shadw_wr_ptr,
			shadw_rd_ptr,
			mailbox_data,
			ldf_a,
			ldf_b,
			rcr_wrbk_sched,
			rcr_wrbk_req,
			rcr_wrbk_addr,
			rcr_wrbk_numb,
			rcr_wrbk_data_type,
			rcr_ack_accept
			

			);

input		clk;
input		reset;
input		wred_enable;
input[15:0]	random_num;
input[15:0]     clk_div_value;
input[4:0]	dma_chnl_grp_id;
input		pio_32b_mode;
input		pio_wen;
input[19:0]     pio_addr;
input[63:0]     pio_wdata;
input[13:0]     muxed_pkt_len;
input[4:0]      muxed_rdc_num_r;
input		muxed_drop_pkt_r;
input		muxed_s_event_r;
input           sel_buf_en;
input		pkt_req_cnt_e_done_mod;
input		pkt_buf_done;
input		is_hdr_wr_data;
input		is_jmb1_wr_data;
input		wr_transfer_comp_int;
input		wr_last_pkt_data;
input		update_rcr_shadw;
input[7:0]      cache_start_addr;
input[7:0]	cache_end_addr;
input           cache_buf_rd_gnt;
input[131:0]    cache_buf_rd_data;
input		fetch_desp_gnt;
input           rdmc_resp_rdy_valid;
input           rdmc_req_err;
input[4:0]      rdmc_resp_cmd;
input[3:0]      rdmc_resp_cmd_status;
input[3:0]      rdmc_resp_data_status;
input[4:0]      rdmc_resp_dma_num;
input           rdmc_resp_data_valid;
input[15:0]     rdmc_resp_byteenable;
input           rdmc_resp_comp;
input           rdmc_resp_trans_comp;
input           resp_data_in_process;
input		cache_parity_err;
input		shadw_parity_err;
input		data_err_event;

input[7:0]      shadw_start_addr;
input[7:0]      shadw_rd_end_addr;
input[7:0]      shadw_wr_end_addr;
input[4:0]      rdmc_wr_data_dma_num;
input           rcr_wrbk_gnt;
input           rcr_wrbk_done;
input[3:0]      rcr_wrbk_pkt_num;
input           rdmc_rcr_ack_valid;
input		rdmc_rcr_ack_err;
input[4:0]      rdmc_rcr_ack_dma_num;


output		pio_rd_gnt;
output[63:0]	chnl_pio_rd_data;
output[19:0]	rx_log_page_hdl_reg;
output[1:0]	dma_func_num;
output          fetch_desp_req;
output[63:0]    fetch_desp_addr;
output[4:0]     fetch_desp_num;
output          rdmc_resp_accept_sm;
output          fetch_desp_resp_vld;
output          cache_read_req;
output[7:0]     cache_rd_ptr;
output[7:0]     cache_wr_ptr;
output		full_header;
output		drop_pkt;
output          pkt_buf_gnt;
output[1:0]	pkt_buf_size;
output[63:0]    pkt_buf_addr;
output[35:0]	orig_buf_addr;
output[1:0]	pref_buf_used_num;
output[13:0]	pkt_trans_len;

output          shadw_wr_en;
output          shadw_wr_even;
output[7:0]     shadw_wr_ptr;
output[7:0]     shadw_rd_ptr;
output[168:0]	mailbox_data;
output		ldf_a;
output		ldf_b;
output          rcr_wrbk_sched;
output          rcr_wrbk_req;
output[63:0]    rcr_wrbk_addr;
output[3:0]     rcr_wrbk_numb;
output          rcr_wrbk_data_type;
output          rcr_ack_accept;

wire		chnl_sel_buf_en_r;
wire[1:0]	pref_buf_used_num;
wire[13:0]	pkt_trans_len;
wire          	desp_init_valid;
wire          	fetch_desp_trig;
wire[63:0]    	fetch_desp_addr;
wire[4:0]     	fetch_desp_num;
wire          	cache_read_req;
wire[7:0]     	cache_rd_ptr;
wire[7:0]     	cache_wr_ptr;
wire          	pkt_buf_gnt;
wire[1:0]	pkt_buf_size;
wire[63:0]    	pkt_buf_addr;
wire[35:0]	orig_buf_addr;
wire[15:0]	desp_curr_addr;
wire[16:0]	desp_curr_cnt;
wire		desp_addr_not_valid;
wire		buf_addr_not_valid;
wire		rbr_addr_overflow;
wire		desp_curr_cnt_overflow;
wire		rbr_empty;
wire		wred_drop_pkt;
wire		rcr_drop_pkt;
wire		rbr_drop_pkt;
wire		chnl_sel_buf_en;
wire		chnl_cache_parity_err;

wire          	fetch_desp_req;
wire          	rdmc_resp_accept_sm;
wire          	fetch_desp_resp_vld;
wire          	fetch_desp_req_sm;
wire          	fetch_desp_pre_done;
wire          	fetch_desp_done;
wire		resp_bus_err;
wire[3:0]	resp_bus_err_type;
wire		rbr_idle_cycle;

wire          	dma_en;
wire		dma_reset;
wire[1:0]     	dma_data_offset;
wire          	full_header;
wire          	page_valid0;
wire[31:0]    	addr_mask0;
wire[31:0]    	comp_value0;
wire[31:0]    	relo_value0;
wire            page_valid1;
wire[31:0]      addr_mask1;
wire[31:0]      comp_value1;
wire[31:0]      relo_value1;
wire		dma_fatal_err;
wire[19:0]    	rx_log_page_hdl_reg;
wire[1:0]	dma_func_num;
wire[31:0]	rdc_red_param_reg;
wire[53:0]    	rbr_cfig_a_reg;
wire[10:0]    	rbr_cfig_b_reg;
wire[15:0]    	rbr_kick_reg;
wire[53:0]    	rcr_cfig_a_reg;
wire[22:0]    	rcr_cfig_b_reg;
wire[31:0]    	rx_dma_ctl_stat_reg;
wire		rx_dma_ctl_stat_reg_bit47;
wire          	rcr_flush_reg;
wire[43:0]    	mbox_addr;
wire[168:0]   	mailbox_data;
wire		ldf_a;
wire		ldf_b;
wire          	rbr_cfig_a_reg_wenu;
wire		rbr_cfig_a_reg_wenl;
wire          	rbr_kick_reg_wen;
wire          	rcr_cfig_a_reg_wenu;
wire		rcr_cfig_a_reg_wenl;
wire          	rx_dma_ctl_stat_reg_wenu;
wire		rx_dma_ctl_stat_reg_wenl;
wire		pio_rd_gnt;
wire[63:0]	chnl_pio_rd_data;

wire          	shadw_wr_en;
wire          	shadw_wr_even;
wire[7:0]     	shadw_wr_ptr;
wire[7:0]     	shadw_rd_ptr;
wire          	rcr_wrbk_req;
wire[63:0]    	rcr_wrbk_addr;
wire[3:0]     	rcr_wrbk_numb;
wire          	rcr_wrbk_data_type;
wire          	rcr_wrbk_sched;
wire          	rcr_ack_accept;
wire[15:0]	rcr_curr_qlen;
wire[7:0]	shadw_curr_space_cnt;
wire          	reset_rcr_flush;
wire		m_bit_en;
wire[2:0]    	rcr_ctl_stat_word;
wire[15:0]	rcr_curr_addr;
wire[15:0]	rcr_status_a;
wire		rcr_addr_not_valid;
wire		mbox_addr_not_valid;
wire		rcr_addr_overflow;
wire		rcr_curr_cnt_overflow;
wire		rcr_curr_cnt_underflow;
wire		rcr_pkt_cnt_underflow;
wire		rcr_idle_cycle;
wire		chnl_has_pkt;
wire		rcr_ack_err;
wire		chnl_shadw_parity_err;

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
                             .clk        (clk),
                             .do_nad     (do_nad[3:0]),
                             .do_nor     (do_nor[3:0]),
                             .do_inv     (do_inv[3:0]),
                             .do_mux     (do_mux[3:0]),
                             .do_q       (do_q[3:0]),
                             .so         (so)
                            );
`endif


niu_rdmc_chnl_pio_if niu_rdmc_chnl_pio_if0 (
			.clk                    	(clk),
                        .reset                  	(reset),
			.dma_chnl_grp_id        	(dma_chnl_grp_id),
			.pio_32b_mode			(pio_32b_mode),
			.pio_wen                	(pio_wen),
                        .pio_addr               	(pio_addr),
                        .pio_wdata              	(pio_wdata),
			.reset_rcr_flush		(reset_rcr_flush),
			.m_bit_en			(m_bit_en),
			.rcr_ctl_stat_word		(rcr_ctl_stat_word),
			.desp_curr_addr			(desp_curr_addr),
			.desp_curr_cnt			(desp_curr_cnt),
			.desp_addr_not_valid		(desp_addr_not_valid),
			.buf_addr_not_valid		(buf_addr_not_valid),
			.rbr_addr_overflow		(rbr_addr_overflow),
			.desp_curr_cnt_overflow		(desp_curr_cnt_overflow),
			.rbr_empty              	(rbr_empty),
                        .muxed_drop_pkt_r       	(muxed_drop_pkt_r),
                        .wred_drop_pkt          	(wred_drop_pkt),
                        .rcr_drop_pkt           	(rcr_drop_pkt),
                        .rbr_drop_pkt           	(rbr_drop_pkt),
                        .chnl_sel_buf_en        	(chnl_sel_buf_en),
			.rcr_curr_addr			(rcr_curr_addr),
			.rcr_status_a			(rcr_status_a),
			.rcr_addr_not_valid		(rcr_addr_not_valid),
			.mbox_addr_not_valid		(mbox_addr_not_valid),
			.rcr_addr_overflow		(rcr_addr_overflow),
			.rcr_curr_cnt_overflow		(rcr_curr_cnt_overflow),
			.rcr_curr_cnt_underflow		(rcr_curr_cnt_underflow),
			.rcr_pkt_cnt_underflow		(rcr_pkt_cnt_underflow),
			.rcr_idle_cycle			(rcr_idle_cycle),
			.chnl_has_pkt			(chnl_has_pkt),
			.chnl_shadw_parity_err		(chnl_shadw_parity_err),
			.rbr_idle_cycle			(rbr_idle_cycle),
			.chnl_cache_parity_err  	(chnl_cache_parity_err),
			.resp_bus_err			(resp_bus_err),
			.resp_bus_err_type		(resp_bus_err_type),
			.rcr_ack_err			(rcr_ack_err),
			.data_err_event         	(data_err_event),
			.rdmc_wr_data_dma_num		(rdmc_wr_data_dma_num),

			.dma_en				(dma_en),
			.dma_reset			(dma_reset),
			.dma_data_offset		(dma_data_offset),
			.full_header			(full_header),
			.page_valid0			(page_valid0),
                        .addr_mask0			(addr_mask0),
                        .comp_value0			(comp_value0),
                        .relo_value0			(relo_value0),
			.page_valid1            	(page_valid1),
                        .addr_mask1             	(addr_mask1),
                        .comp_value1            	(comp_value1),
                        .relo_value1            	(relo_value1),
			.dma_fatal_err			(dma_fatal_err),
                        .rx_log_page_hdl_reg		(rx_log_page_hdl_reg),
			.dma_func_num			(dma_func_num),
			.rdc_red_param_reg		(rdc_red_param_reg),
                        .rbr_cfig_a_reg			(rbr_cfig_a_reg),
                        .rbr_cfig_b_reg			(rbr_cfig_b_reg),
                        .rbr_kick_reg			(rbr_kick_reg),
                        .rcr_cfig_a_reg			(rcr_cfig_a_reg),
                        .rcr_cfig_b_reg			(rcr_cfig_b_reg),
                        .rx_dma_ctl_stat_reg_s		(rx_dma_ctl_stat_reg),
			.rx_dma_ctl_stat_reg_bit47	(rx_dma_ctl_stat_reg_bit47),
                        .rcr_flush_reg			(rcr_flush_reg),
                        .mbox_addr			(mbox_addr),
                        .mailbox_data			(mailbox_data),
			.ldf_a				(ldf_a),
			.ldf_b				(ldf_b),
                        .rbr_cfig_a_reg_wenu		(rbr_cfig_a_reg_wenu),
			.rbr_cfig_a_reg_wenl            (rbr_cfig_a_reg_wenl),
                        .rbr_kick_reg_wen		(rbr_kick_reg_wen),
                        .rcr_cfig_a_reg_wenu		(rcr_cfig_a_reg_wenu),
			.rcr_cfig_a_reg_wenl            (rcr_cfig_a_reg_wenl),
                        .rx_dma_ctl_stat_reg_wenu	(rx_dma_ctl_stat_reg_wenu),
			.rx_dma_ctl_stat_reg_wenl	(rx_dma_ctl_stat_reg_wenl),
			.pio_rd_gnt			(pio_rd_gnt),
			.chnl_pio_rd_data		(chnl_pio_rd_data)

			);


niu_rdmc_buf_manager niu_rdmc_buf_manager0 (
			.clk			(clk),
			.reset			(reset),
                        .wred_enable            (wred_enable),
			.random_num		(random_num),
			.dma_chnl_grp_id	(dma_chnl_grp_id),
			.dma_data_offset        (dma_data_offset),
                        .full_header            (full_header),
			.dma_en			(dma_en),
			.dma_reset		(dma_reset),
			.page_valid0            (page_valid0),
                        .addr_mask0             (addr_mask0),
                        .comp_value0            (comp_value0),
                        .relo_value0            (relo_value0),
                        .page_valid1            (page_valid1),
                        .addr_mask1             (addr_mask1),
                        .comp_value1            (comp_value1),
                        .relo_value1            (relo_value1),
			.dma_fatal_err		(dma_fatal_err),
                        .rx_log_page_hdl_reg    (rx_log_page_hdl_reg),
			.rdc_red_param_reg	(rdc_red_param_reg),
                        .rbr_cfig_a_reg         (rbr_cfig_a_reg),
                        .rbr_cfig_b_reg         (rbr_cfig_b_reg),
                        .rbr_kick_reg           (rbr_kick_reg),
			.rbr_cfig_a_reg_wenu    (rbr_cfig_a_reg_wenu),
			.rbr_cfig_a_reg_wenl    (rbr_cfig_a_reg_wenl),
                        .rbr_kick_reg_wen       (rbr_kick_reg_wen),
			.muxed_pkt_len		(muxed_pkt_len),
			.muxed_rdc_num_r	(muxed_rdc_num_r),
			.muxed_drop_pkt_r	(muxed_drop_pkt_r),
			.muxed_s_event_r	(muxed_s_event_r),
			.sel_buf_en		(sel_buf_en),
			.pkt_req_cnt_e_done_mod	(pkt_req_cnt_e_done_mod),
			.pkt_buf_done		(pkt_buf_done),
			.is_hdr_wr_data		(is_hdr_wr_data),
			.is_jmb1_wr_data	(is_jmb1_wr_data),
			.fetch_desp_req_sm	(fetch_desp_req_sm),
			.fetch_desp_pre_done	(fetch_desp_pre_done),
			.fetch_desp_done	(fetch_desp_done),
			.fetch_desp_resp_vld	(fetch_desp_resp_vld),
			.rdmc_resp_data_valid	(rdmc_resp_data_valid),
			.cache_start_addr	(cache_start_addr),
			.cache_end_addr		(cache_end_addr),
			.cache_buf_rd_gnt	(cache_buf_rd_gnt),
			.cache_buf_rd_data	(cache_buf_rd_data),
			.cache_parity_err	(cache_parity_err),
			.rcr_curr_qlen		(rcr_curr_qlen),
			.shadw_curr_space_cnt	(shadw_curr_space_cnt),

			.chnl_sel_buf_en_r	(chnl_sel_buf_en_r),
			.desp_init_valid	(desp_init_valid),
			.fetch_desp_trig	(fetch_desp_trig),
			.fetch_desp_addr	(fetch_desp_addr),
			.fetch_desp_num		(fetch_desp_num),
			.cache_read_req		(cache_read_req),
			.cache_rd_ptr		(cache_rd_ptr),
			.cache_wr_ptr		(cache_wr_ptr),
			.drop_pkt		(drop_pkt),
			.pkt_buf_gnt		(pkt_buf_gnt),
			.pkt_buf_size		(pkt_buf_size),
			.pkt_buf_addr		(pkt_buf_addr),
			.orig_buf_addr		(orig_buf_addr),
			.pref_buf_used_num	(pref_buf_used_num),
			.pkt_trans_len		(pkt_trans_len),
			.desp_curr_addr		(desp_curr_addr),
			.desp_curr_cnt		(desp_curr_cnt),
			.desp_addr_not_valid	(desp_addr_not_valid),
			.buf_addr_not_valid	(buf_addr_not_valid),
			.rbr_addr_overflow	(rbr_addr_overflow),
			.desp_curr_cnt_overflow	(desp_curr_cnt_overflow),
			.rbr_empty		(rbr_empty),
			.wred_drop_pkt		(wred_drop_pkt),
			.rcr_drop_pkt		(rcr_drop_pkt),
			.rbr_drop_pkt		(rbr_drop_pkt),
			.chnl_sel_buf_en	(chnl_sel_buf_en),
			.chnl_cache_parity_err	(chnl_cache_parity_err)

			);


niu_rdmc_fetch_desp_sm niu_rdmc_fetch_desp_sm0 (
			.clk			(clk),
			.reset			(reset),
			.dma_chnl_grp_id	(dma_chnl_grp_id),
			.dma_reset              (dma_reset),
			.dma_fatal_err		(dma_fatal_err),
			.desp_init_valid	(desp_init_valid),
			.fetch_desp_trig	(fetch_desp_trig),
			.fetch_desp_num		(fetch_desp_num),
			.fetch_desp_gnt		(fetch_desp_gnt),
			.rdmc_resp_rdy_valid	(rdmc_resp_rdy_valid),
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

			.fetch_desp_req		(fetch_desp_req),
			.rdmc_resp_accept_sm	(rdmc_resp_accept_sm),    //use rdmc_resp_accept if timing
			.fetch_desp_resp_vld	(fetch_desp_resp_vld),
			.fetch_desp_req_sm	(fetch_desp_req_sm),
			.fetch_desp_pre_done	(fetch_desp_pre_done),
			.fetch_desp_done	(fetch_desp_done),
			.resp_bus_err		(resp_bus_err),
			.resp_bus_err_type	(resp_bus_err_type),
			.rbr_idle_cycle		(rbr_idle_cycle)

			);


niu_rdmc_rcr_manager niu_rdmc_rcr_manager0 (
			.clk				(clk),
                        .reset				(reset),
                        .clk_div_value			(clk_div_value),
                        .dma_chnl_grp_id		(dma_chnl_grp_id),
                        .shadw_start_addr		(shadw_start_addr),
                        .shadw_rd_end_addr		(shadw_rd_end_addr),
                        .shadw_wr_end_addr		(shadw_wr_end_addr),
			.dma_en				(dma_en),
			.dma_reset              	(dma_reset),
			.page_valid0            	(page_valid0),
                        .addr_mask0             	(addr_mask0),
                        .comp_value0            	(comp_value0),
                        .relo_value0            	(relo_value0),
                        .page_valid1            	(page_valid1),
                        .addr_mask1             	(addr_mask1),
                        .comp_value1            	(comp_value1),
                        .relo_value1            	(relo_value1),
			.dma_fatal_err			(dma_fatal_err),
                        .rx_log_page_hdl_reg		(rx_log_page_hdl_reg),
                        .rcr_cfig_a_reg			(rcr_cfig_a_reg),
                        .rcr_cfig_b_reg			(rcr_cfig_b_reg),
                        .rx_dma_ctl_stat_reg		(rx_dma_ctl_stat_reg),
			.rx_dma_ctl_stat_reg_bit47	(rx_dma_ctl_stat_reg_bit47),
                        .rcr_flush_reg			(rcr_flush_reg),
                        .mbox_addr			(mbox_addr),
                        .rcr_cfig_a_reg_wenu		(rcr_cfig_a_reg_wenu),
			.rcr_cfig_a_reg_wenl            (rcr_cfig_a_reg_wenl),
                        .rx_dma_ctl_stat_reg_wenu	(rx_dma_ctl_stat_reg_wenu),
			.rx_dma_ctl_stat_reg_wenl	(rx_dma_ctl_stat_reg_wenl),
                        .chnl_sel_buf_en_r		(chnl_sel_buf_en_r),       //from niu_rdmc_buf_manager.v
                        .pref_buf_used_num		(pref_buf_used_num),       //up to three for jumbo pkts
			.wr_transfer_comp_int		(wr_transfer_comp_int),
			.wr_last_pkt_data		(wr_last_pkt_data),
                        .update_rcr_shadw		(update_rcr_shadw),        //from niu_rdmc_wr_sched.v
                        .rdmc_wr_data_dma_num		(rdmc_wr_data_dma_num),
                        .rcr_wrbk_gnt			(rcr_wrbk_gnt),
                        .rcr_wrbk_done			(rcr_wrbk_done),
                        .rcr_wrbk_pkt_num		(rcr_wrbk_pkt_num),
                        .rdmc_rcr_ack_valid		(rdmc_rcr_ack_valid),
			.rdmc_rcr_ack_err		(rdmc_rcr_ack_err),
                        .rdmc_rcr_ack_dma_num		(rdmc_rcr_ack_dma_num),
			.shadw_parity_err		(shadw_parity_err),

                        .shadw_wr_en			(shadw_wr_en),
                        .shadw_wr_even			(shadw_wr_even),
                        .shadw_wr_ptr			(shadw_wr_ptr),
                        .shadw_rd_ptr			(shadw_rd_ptr),
                        .rcr_wrbk_req			(rcr_wrbk_req),
                        .rcr_wrbk_addr			(rcr_wrbk_addr),
                        .rcr_wrbk_numb			(rcr_wrbk_numb),
                        .rcr_wrbk_data_type		(rcr_wrbk_data_type),
                        .rcr_wrbk_sched			(rcr_wrbk_sched),
                        .rcr_ack_accept			(rcr_ack_accept),
			.rcr_curr_qlen			(rcr_curr_qlen),
			.shadw_curr_space_cnt		(shadw_curr_space_cnt),
                        .reset_rcr_flush		(reset_rcr_flush),
			.m_bit_en			(m_bit_en),
                        .rcr_ctl_stat_word		(rcr_ctl_stat_word),
			.rcr_curr_addr			(rcr_curr_addr),
			.rcr_status_a			(rcr_status_a),
			.rcr_addr_not_valid		(rcr_addr_not_valid),
			.mbox_addr_not_valid		(mbox_addr_not_valid),
			.rcr_addr_overflow		(rcr_addr_overflow),
			.rcr_curr_cnt_overflow		(rcr_curr_cnt_overflow),
			.rcr_curr_cnt_underflow		(rcr_curr_cnt_underflow),
			.rcr_pkt_cnt_underflow		(rcr_pkt_cnt_underflow),
			.rcr_idle_cycle			(rcr_idle_cycle),
			.chnl_has_pkt			(chnl_has_pkt),
			.rcr_ack_err			(rcr_ack_err),
			.chnl_shadw_parity_err		(chnl_shadw_parity_err)

			);


endmodule


			
			
