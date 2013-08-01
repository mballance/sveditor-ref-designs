// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rdmc_wr_sched.v
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
module niu_rdmc_wr_sched (
			clk,
			reset,
			rx_addr_32b_mode,
			pt_drr_wt0_reg,
			pt_drr_wt1_reg,
			pt_drr_wt2_reg,
			pt_drr_wt3_reg,
			muxed_l2_len_r,
			muxed_pkt_len_r,
			rdmc_eop_for_padding,
			pkt_req_cnt_pre_done,
			pkt_req_cnt_done,
			pkt_req_cnt_done_r,
			pkt_wrbk_data,
			drop_pkt_done,
			ipp_full_pkt,
			zcp_full_pkt,
			ipp_pkt_sop,
			zcp_pkt_sop,
			muxed_zcopy_mode_r,
			muxed_data_err_r2,
			zcopy_mode,
			jmb_pkt_type,
                        zcp_wr_type,
                        zcp_rdc_num,
			zcp_vaddr0,
                        zcp_vaddr1,
                        zcp_vaddr2,
                        zcp_vaddr3,
			zcp_len0,
			zcp_len1,
			zcp_len2,
			zcp_len3,
			zcp_func_num,
			full_hdr_bits,
			drop_pkt,
			pkt_buf_gnt,
			pkt_buf_addr0,
			pkt_buf_addr1,
			pkt_buf_addr2,
			pkt_buf_addr3,
			pkt_buf_addr4,
			pkt_buf_addr5,
                        pkt_buf_addr6,
                        pkt_buf_addr7,
                        pkt_buf_addr8,
                        pkt_buf_addr9,
			pkt_buf_addr10,
                        pkt_buf_addr11,
                        pkt_buf_addr12,
                        pkt_buf_addr13,
                        pkt_buf_addr14,
                        pkt_buf_addr15,
			pkt_buf_size0,
                        pkt_buf_size1,
                        pkt_buf_size2,
                        pkt_buf_size3,
                        pkt_buf_size4,
                        pkt_buf_size5,
                        pkt_buf_size6,
                        pkt_buf_size7,
                        pkt_buf_size8,
                        pkt_buf_size9,
                        pkt_buf_size10,
                        pkt_buf_size11,
                        pkt_buf_size12,
                        pkt_buf_size13,
                        pkt_buf_size14,
                        pkt_buf_size15,
                        orig_buf_addr0,
                        orig_buf_addr1,
                        orig_buf_addr2,
                        orig_buf_addr3,
                        orig_buf_addr4,
                        orig_buf_addr5,
                        orig_buf_addr6,
                        orig_buf_addr7,
                        orig_buf_addr8,
                        orig_buf_addr9,
                        orig_buf_addr10,
                        orig_buf_addr11,
                        orig_buf_addr12,
                        orig_buf_addr13,
                        orig_buf_addr14,
                        orig_buf_addr15,
			dma_func_num0,
                        dma_func_num1,
                        dma_func_num2,
                        dma_func_num3,
                        dma_func_num4,
                        dma_func_num5,
                        dma_func_num6,
                        dma_func_num7,
                        dma_func_num8,
                        dma_func_num9,
                        dma_func_num10,
                        dma_func_num11,
                        dma_func_num12,
                        dma_func_num13,
                        dma_func_num14,
                        dma_func_num15,
			pref_buf_used_num0,
                        pref_buf_used_num1,
                        pref_buf_used_num2,
                        pref_buf_used_num3,
                        pref_buf_used_num4,
                        pref_buf_used_num5,
                        pref_buf_used_num6,
                        pref_buf_used_num7,
                        pref_buf_used_num8,
                        pref_buf_used_num9,
                        pref_buf_used_num10,
                        pref_buf_used_num11,
                        pref_buf_used_num12,
                        pref_buf_used_num13,
                        pref_buf_used_num14,
                        pref_buf_used_num15,
			pkt_trans_len0,
                        pkt_trans_len1,
                        pkt_trans_len2,
                        pkt_trans_len3,
                        pkt_trans_len4,
                        pkt_trans_len5,
                        pkt_trans_len6,
                        pkt_trans_len7,
                        pkt_trans_len8,
                        pkt_trans_len9,
                        pkt_trans_len10,
                        pkt_trans_len11,
                        pkt_trans_len12,
                        pkt_trans_len13,
                        pkt_trans_len14,
                        pkt_trans_len15,
			meta0_rdmc_wr_req_accept,
			
			rdmc_meta0_wr_req,
			rdmc_meta0_wr_req_cmd,
			rdmc_meta0_wr_req_address,
			rdmc_meta0_wr_req_length,
			rdmc_meta0_wr_req_port_num,
			rdmc_meta0_wr_req_dma_num,
			rdmc_meta0_wr_req_func_num,
			rdmc_meta0_wr_req_dma_num_int,
			full_hdr_r,
			pkt_trans_len_r,
			pref_buf_used_num_r,
			drop_pkt_en_sm,
			drop_pkt_en,
			drop_pkt_port_gnt,
			drop_pad_data,
			is_zcp0_wr_req,
			is_zcp1_wr_req,
			is_zcp2_wr_req,
			is_zcp3_wr_req,
			rdmc_wr_req_accept_hdr,
			rdmc_wr_req_accept_jmb,
			rdmc_wr_req_accept_zcp0,
			rdmc_wr_req_accept_zcp1,
			rdmc_wr_req_accept_zcp2,
			rdmc_wr_req_accept_zcp3,
			port_gnt,
			port_gnt_r,
			stage0_en,
			stage1_en_r,
			sel_buf_en,
			pkt_buf_done,
			is_hdr_wr_data,
			is_jmb1_wr_data,
			wr_last_pkt_data,
			update_rcr_shadw,
			rcr_wrbk_data,
			wr_sched_sm_state
			);

input		clk;
input		reset;
input		rx_addr_32b_mode;
input[15:0]	pt_drr_wt0_reg;
input[15:0]	pt_drr_wt1_reg;
input[15:0]	pt_drr_wt2_reg;
input[15:0]	pt_drr_wt3_reg;
input[13:0]     muxed_l2_len_r;
input[13:0]	muxed_pkt_len_r;
input		rdmc_eop_for_padding;
input		pkt_req_cnt_pre_done;
input		pkt_req_cnt_done;
input		pkt_req_cnt_done_r;
input[22:0]	pkt_wrbk_data;
input		drop_pkt_done;
input[3:0]      ipp_full_pkt;
input[3:0]      zcp_full_pkt;
input[3:0]      ipp_pkt_sop;
input[3:0]      zcp_pkt_sop;
input		muxed_zcopy_mode_r;
input		muxed_data_err_r2;
input		zcopy_mode;
input[1:0]	jmb_pkt_type;
input[1:0]	zcp_wr_type;
input[4:0]	zcp_rdc_num;
input[63:0]     zcp_vaddr0;
input[63:0]     zcp_vaddr1;
input[63:0]     zcp_vaddr2;
input[63:0]     zcp_vaddr3;
input[13:0]	zcp_len0;
input[13:0]	zcp_len1;
input[13:0]	zcp_len2;
input[13:0]	zcp_len3;
input[1:0]	zcp_func_num;
input[15:0]	full_hdr_bits;
input[15:0]	drop_pkt;
input[15:0]	pkt_buf_gnt;
input[63:0]	pkt_buf_addr0;
input[63:0]     pkt_buf_addr1;
input[63:0]     pkt_buf_addr2;
input[63:0]     pkt_buf_addr3;
input[63:0]     pkt_buf_addr4;
input[63:0]     pkt_buf_addr5;
input[63:0]     pkt_buf_addr6;
input[63:0]     pkt_buf_addr7;
input[63:0]     pkt_buf_addr8;
input[63:0]     pkt_buf_addr9;
input[63:0]     pkt_buf_addr10;
input[63:0]     pkt_buf_addr11;
input[63:0]     pkt_buf_addr12;
input[63:0]     pkt_buf_addr13;
input[63:0]     pkt_buf_addr14;
input[63:0]     pkt_buf_addr15;
input[1:0]      pkt_buf_size0;
input[1:0]      pkt_buf_size1;
input[1:0]      pkt_buf_size2;
input[1:0]      pkt_buf_size3;
input[1:0]      pkt_buf_size4;
input[1:0]      pkt_buf_size5;
input[1:0]      pkt_buf_size6;
input[1:0]      pkt_buf_size7;
input[1:0]      pkt_buf_size8;
input[1:0]      pkt_buf_size9;
input[1:0]      pkt_buf_size10;
input[1:0]      pkt_buf_size11;
input[1:0]      pkt_buf_size12;
input[1:0]      pkt_buf_size13;
input[1:0]      pkt_buf_size14;
input[1:0]      pkt_buf_size15;
input[35:0]     orig_buf_addr0;
input[35:0]     orig_buf_addr1;
input[35:0]     orig_buf_addr2;
input[35:0]     orig_buf_addr3;
input[35:0]     orig_buf_addr4;
input[35:0]     orig_buf_addr5;
input[35:0]     orig_buf_addr6;
input[35:0]     orig_buf_addr7;
input[35:0]     orig_buf_addr8;
input[35:0]     orig_buf_addr9;
input[35:0]     orig_buf_addr10;
input[35:0]     orig_buf_addr11;
input[35:0]     orig_buf_addr12;
input[35:0]     orig_buf_addr13;
input[35:0]     orig_buf_addr14;
input[35:0]     orig_buf_addr15;
input[1:0]      dma_func_num0;
input[1:0]      dma_func_num1;
input[1:0]      dma_func_num2;
input[1:0]      dma_func_num3;
input[1:0]      dma_func_num4;
input[1:0]      dma_func_num5;
input[1:0]      dma_func_num6;
input[1:0]      dma_func_num7;
input[1:0]      dma_func_num8;
input[1:0]      dma_func_num9;
input[1:0]      dma_func_num10;
input[1:0]      dma_func_num11;
input[1:0]      dma_func_num12;
input[1:0]      dma_func_num13;
input[1:0]      dma_func_num14;
input[1:0]      dma_func_num15;
input[1:0]      pref_buf_used_num0;
input[1:0]      pref_buf_used_num1;
input[1:0]      pref_buf_used_num2;
input[1:0]      pref_buf_used_num3;
input[1:0]      pref_buf_used_num4;
input[1:0]      pref_buf_used_num5;
input[1:0]      pref_buf_used_num6;
input[1:0]      pref_buf_used_num7;
input[1:0]      pref_buf_used_num8;
input[1:0]      pref_buf_used_num9;
input[1:0]      pref_buf_used_num10;
input[1:0]      pref_buf_used_num11;
input[1:0]      pref_buf_used_num12;
input[1:0]      pref_buf_used_num13;
input[1:0]      pref_buf_used_num14;
input[1:0]      pref_buf_used_num15;
input[13:0]     pkt_trans_len0;
input[13:0]     pkt_trans_len1;
input[13:0]     pkt_trans_len2;
input[13:0]     pkt_trans_len3;
input[13:0]     pkt_trans_len4;
input[13:0]     pkt_trans_len5;
input[13:0]     pkt_trans_len6;
input[13:0]     pkt_trans_len7;
input[13:0]     pkt_trans_len8;
input[13:0]     pkt_trans_len9;
input[13:0]     pkt_trans_len10;
input[13:0]     pkt_trans_len11;
input[13:0]     pkt_trans_len12;
input[13:0]     pkt_trans_len13;
input[13:0]     pkt_trans_len14;
input[13:0]     pkt_trans_len15;
input		meta0_rdmc_wr_req_accept;

output		rdmc_meta0_wr_req;
output[7:0]	rdmc_meta0_wr_req_cmd;
output[63:0]	rdmc_meta0_wr_req_address;
output[13:0]	rdmc_meta0_wr_req_length;
output[1:0]	rdmc_meta0_wr_req_port_num;
output[4:0]	rdmc_meta0_wr_req_dma_num;
output[4:0]	rdmc_meta0_wr_req_dma_num_int;
output[1:0]	rdmc_meta0_wr_req_func_num;
output		full_hdr_r;
output[13:0]	pkt_trans_len_r;
output[1:0]	pref_buf_used_num_r;
output		drop_pkt_en_sm;
output		drop_pkt_en;
output[3:0]	drop_pkt_port_gnt;
output		drop_pad_data;
output		is_zcp0_wr_req;
output		is_zcp1_wr_req;
output		is_zcp2_wr_req;
output		is_zcp3_wr_req;
output		rdmc_wr_req_accept_hdr;
output		rdmc_wr_req_accept_jmb;
output		rdmc_wr_req_accept_zcp0;
output		rdmc_wr_req_accept_zcp1;
output		rdmc_wr_req_accept_zcp2;
output		rdmc_wr_req_accept_zcp3;
output[3:0]     port_gnt;
output[3:0]     port_gnt_r;
output		stage0_en;
output		stage1_en_r;
output		sel_buf_en;
output		pkt_buf_done;
output		is_hdr_wr_data;
output		is_jmb1_wr_data;
output		wr_last_pkt_data;
output		update_rcr_shadw;
output[63:0]	rcr_wrbk_data;
output[4:0]	wr_sched_sm_state;

reg		rdmc_wr_req_accept_in;
reg		rdmc_wr_req_accept_reg;
reg          	rdmc_meta0_wr_req;
reg[7:0]     	rdmc_meta0_wr_req_cmd;
reg[63:0]    	rdmc_meta0_wr_req_address;
reg[13:0]    	rdmc_meta0_wr_req_length;
reg[1:0]	rdmc_meta0_wr_req_port_num;
reg[4:0]     	rdmc_meta0_wr_req_dma_num;
reg[4:0]	rdmc_meta0_wr_req_dma_num_int;
reg[1:0]	rdmc_meta0_wr_req_func_num;
reg          	sel_buf_en;
reg		rdmc_wr_req_pulse;
reg		full_hdr_r;
reg[13:0]	pkt_trans_len_r;
reg[13:0]	pad_data_len;
reg[1:0]	pref_buf_used_num_r;
reg[35:0]	orig_buf_addr;
reg[63:0]	rcr_wrbk_data;

reg		idle_cycle;
reg		arb_cyc0_en;
reg		arb_cyc1_en;
reg		stage0_en;
reg		stage1_en;
reg		stage2_en;
reg		stage1_en_r;
reg		rdmc_wr_req_sm_hdr;
reg		rdmc_wr_req_sm_jmb1;
reg		rdmc_wr_req_sm_jmb2;
reg		rdmc_wr_req_sm_zcp0;
reg		rdmc_wr_req_sm_zcp1;
reg		rdmc_wr_req_sm_zcp2;
reg		rdmc_wr_req_sm_zcp3;
reg		pkt_buf_done;
reg		zcp_last_data_sm;
reg		drop_pkt_en_sm;
reg		bkup_wt_en;
reg		reset_port_gnt_sm;
reg		drop_pad_data;
reg[4:0]	state;
reg[4:0]	next_state;

reg		is_hdr_wr_req;
reg		is_jmb1_wr_req;
reg		is_jmb2_wr_req;
reg		is_zcp0_wr_req;
reg		is_zcp1_wr_req;
reg		is_zcp2_wr_req;
reg		is_zcp3_wr_req;
reg		is_hdr_wr_data;
reg		is_jmb1_wr_data;
reg		is_jmb2_wr_data;
reg		is_zcp0_wr_data;
reg             is_zcp1_wr_data;
reg             is_zcp2_wr_data;
reg             is_zcp3_wr_data;

reg		wr_last_pkt_data;
reg		zcp_wr_last_data;
reg[1:0]	pkt_buf_size_r;
reg[22:0]	pkt_wrbk_data_r;
reg[40:0]	bus_wrbk_data;

reg		drop_pkt_en;
reg[3:0]	drop_pkt_port_gnt;
reg		reset_port_gnt;
reg[3:0]	port_gnt;
reg[3:0]	port_gnt_r;
reg[3:0]	token;
reg[3:0]	final_req_r;
reg		is_org_req_r;
reg		is_bkup_req_r;

reg[15:0]	curr_wt0;
reg[15:0]       curr_wt1;
reg[15:0]       curr_wt2;
reg[15:0]       curr_wt3;

reg[15:0]	bkup_wt0;
reg[15:0]	bkup_wt1;
reg[15:0]	bkup_wt2;
reg[15:0]	bkup_wt3;

wire[4:0]	wr_sched_sm_state = state;

wire		rdmc_wr_req_sm;
wire		rdmc_wr_req_accept;
wire		rdmc_wr_req_accept_pulse;

wire[3:0]	pkt_buf_gnt_enc;
wire[1:0]	port_gnt_enc;
wire		full_hdr;

wire		rdmc_wr_req_sm_nom;
wire[63:0]	rdmc_req_addr_all;
wire[13:0]	pkt_trans_len_all;

wire[3:0]	mask_req;
wire[3:0]	org_req;
wire[3:0]	bkup_req;
wire[3:0]	final_req;
wire		is_org_req;
wire		is_mask_req;
wire		is_bkup_req;

wire[3:0]	n_flag 		= {curr_wt3[15], curr_wt2[15], curr_wt1[15], curr_wt0[15]};
wire[3:0]	bkup_n_flag 	= {bkup_wt3[15], bkup_wt2[15], bkup_wt1[15], bkup_wt0[15]};

wire[3:0]	sel_port_gnt;

wire	muxed_full_pkt  = |(ipp_full_pkt & zcp_full_pkt & port_gnt);
wire	muxed_pkt_sop   = |(ipp_pkt_sop & zcp_pkt_sop & port_gnt);

wire	jmb_pkt		= pref_buf_used_num_r[1];

wire	drop_pkt_req	= |drop_pkt;

wire	is_wr_data;
wire	has_ly2_padding;

parameter

PORT_REQ        	= 5'd0,
PORT_ARB		= 5'd1,
WAIT_PORT_RDY		= 5'd2,
BUF_COMP		= 5'd3,
BUF_SEL			= 5'd4,
BUS_REQ 		= 5'd5,
WAIT_S1			= 5'd6,
WAIT_S2			= 5'd7,
JMB_REQ1_WAIT   	= 5'd8,
JMB_REQ1_PRE    	= 5'd9,
JMB_REQ1		= 5'd10,
JMB_WAIT1		= 5'd11,
JMB_REQ2		= 5'd12,
JMB_WAIT2		= 5'd13,
ZCP_REQ0_WAIT   	= 5'd14,
ZCP_REQ0_PRE    	= 5'd15,
ZCP_REQ0		= 5'd16,
ZCP_WAIT0		= 5'd17,
ZCP_REQ1		= 5'd18,
ZCP_WAIT1		= 5'd19,
ZCP_REQ2        	= 5'd20,
ZCP_WAIT2       	= 5'd21,
ZCP_REQ3        	= 5'd22,
ZCP_WAIT3       	= 5'd23,
DIS_PKT			= 5'd24,
DIS_PKT_WAIT		= 5'd25,
DIS_PKT_DONE_W		= 5'd26,
DIS_LY2_PADDING_W	= 5'd27,
DIS_LY2_PADDING		= 5'd28;


always @ (state or final_req or 
	  muxed_full_pkt or muxed_pkt_sop or 
	  rdmc_wr_req_accept or rdmc_meta0_wr_req or rdmc_wr_req_accept_pulse or
	  muxed_zcopy_mode_r or jmb_pkt or pkt_req_cnt_done or pkt_req_cnt_done_r or
	  pref_buf_used_num_r or zcp_wr_type or is_wr_data or
	  drop_pkt_req or drop_pkt_done or muxed_data_err_r2 or
	  pkt_req_cnt_pre_done or has_ly2_padding or rdmc_eop_for_padding)
begin
	idle_cycle		= 1'b0;
	arb_cyc0_en		= 1'b0;
	arb_cyc1_en		= 1'b0;
	stage0_en		= 1'b0;
	stage1_en		= 1'b0;
	stage2_en		= 1'b0;
	rdmc_wr_req_sm_hdr	= 1'b0;
	rdmc_wr_req_sm_jmb1	= 1'b0;
	rdmc_wr_req_sm_jmb2	= 1'b0;
	rdmc_wr_req_sm_zcp0	= 1'b0;
	rdmc_wr_req_sm_zcp1	= 1'b0;
	rdmc_wr_req_sm_zcp2	= 1'b0;
	rdmc_wr_req_sm_zcp3	= 1'b0;
	zcp_last_data_sm	= 1'b0;
	pkt_buf_done		= 1'b0;
	drop_pkt_en_sm		= 1'b0;
	bkup_wt_en		= 1'b0;
	reset_port_gnt_sm	= 1'b0;
	drop_pad_data		= 1'b0;

case (state)	//synopsys parallel_case full_case

PORT_REQ:
begin
	if (final_req)
	begin
		arb_cyc0_en	= 1'b1;
		next_state	= PORT_ARB;
	end
	else 
	begin
		idle_cycle	= 1'b1;
		next_state      = state;
	end
end

PORT_ARB:
begin
		arb_cyc1_en	= 1'b1;
		next_state	= WAIT_PORT_RDY;
end

WAIT_PORT_RDY:
begin
	if (!(rdmc_meta0_wr_req | rdmc_wr_req_accept_pulse) | rdmc_wr_req_accept)
	begin
		if (!muxed_full_pkt & muxed_data_err_r2)
			next_state	= PORT_REQ;
		else if (muxed_full_pkt & muxed_pkt_sop)
		begin
			stage0_en	= 1'b1;
			next_state	= BUF_COMP;
		end
		else
		next_state	= state;
	end
	else
		next_state	= state;
end

BUF_COMP:
begin
	stage1_en	= 1'b1;
	next_state	= BUF_SEL;
end

BUF_SEL:
begin
	stage2_en	= 1'b1;
	next_state	= BUS_REQ;
end

BUS_REQ:
begin
	if (drop_pkt_req)
		next_state		= DIS_PKT;
	else
	begin
		rdmc_wr_req_sm_hdr	= 1'b1;
		next_state		= WAIT_S1;
	end
end

WAIT_S1:
begin
	reset_port_gnt_sm	= 1'b1;
	if (muxed_zcopy_mode_r)
	begin
		pkt_buf_done	= 1'b1;
		next_state	= ZCP_REQ0_WAIT;
	end
	else if (jmb_pkt)
		next_state	= JMB_REQ1_WAIT;
	else
	begin	
		pkt_buf_done	= 1'b1;
		bkup_wt_en	= 1'b1;
		next_state	= WAIT_S2;
	end
end

WAIT_S2:

	next_state      = PORT_REQ;


JMB_REQ1_WAIT:
begin
	if (!(rdmc_meta0_wr_req | rdmc_wr_req_accept_pulse) | rdmc_wr_req_accept)
		next_state	= JMB_REQ1_PRE;
	else
		next_state	= state;
end

JMB_REQ1_PRE:
		next_state      = JMB_REQ1;


JMB_REQ1:
begin
	if (pkt_req_cnt_done)
	begin
		rdmc_wr_req_sm_jmb1	= 1'b1;
		next_state		= JMB_WAIT1;
	end
	else
		next_state		= state;
end

JMB_WAIT1:
begin
	if (pref_buf_used_num_r == 2'b10)
	begin
		pkt_buf_done	= 1'b1;
		bkup_wt_en	= 1'b1;
		next_state	= PORT_REQ;
	end
	else	
		next_state	= JMB_REQ2;
end

JMB_REQ2:
begin
        if (pkt_req_cnt_done)
        begin
                rdmc_wr_req_sm_jmb2     = 1'b1;
                next_state              = JMB_WAIT2;
        end
        else
                next_state              = state;
end

JMB_WAIT2:
begin
		pkt_buf_done	= 1'b1;
		bkup_wt_en	= 1'b1;
                next_state      = PORT_REQ;
end


ZCP_REQ0_WAIT:
begin
        if (!(rdmc_meta0_wr_req | rdmc_wr_req_accept_pulse) | rdmc_wr_req_accept)
                next_state      = ZCP_REQ0_PRE;
        else
                next_state      = state;
end

ZCP_REQ0_PRE:
                next_state      = ZCP_REQ0;


ZCP_REQ0:
begin
	if (pkt_req_cnt_done_r)
	begin
		rdmc_wr_req_sm_zcp0	= 1'b1;
		next_state		= ZCP_WAIT0;
	end
	else
		next_state		= state;
end

ZCP_WAIT0:
begin
	if (zcp_wr_type == 2'b00)
	begin	
		zcp_last_data_sm	= 1'b1;
		bkup_wt_en		= 1'b1;
		if (has_ly2_padding)
			next_state	= DIS_LY2_PADDING_W;
		else
			next_state	= PORT_REQ;
	end
	else
		next_state	= ZCP_REQ1;
end

ZCP_REQ1:
begin
        if (pkt_req_cnt_done_r)
        begin
                rdmc_wr_req_sm_zcp1	= 1'b1;
                next_state      	= ZCP_WAIT1;
        end
        else
                next_state      	= state;
end

ZCP_WAIT1:
begin
        if (zcp_wr_type == 2'b01)
	begin
		zcp_last_data_sm	= 1'b1;
		bkup_wt_en		= 1'b1;
		if (has_ly2_padding)
                        next_state      = DIS_LY2_PADDING_W;
                else    
                        next_state      = PORT_REQ;
	end
        else
                next_state      = ZCP_REQ2;
end

ZCP_REQ2:
begin
        if (pkt_req_cnt_done_r)
        begin
                rdmc_wr_req_sm_zcp2	= 1'b1;
                next_state      	= ZCP_WAIT2;
        end
        else
                next_state      	= state;
end

ZCP_WAIT2:
begin
        if (zcp_wr_type == 2'b10)
	begin
		zcp_last_data_sm	= 1'b1;
		bkup_wt_en		= 1'b1;
		if (has_ly2_padding)
                        next_state      = DIS_LY2_PADDING_W;
                else
                        next_state      = PORT_REQ;
	end
        else
                next_state      = ZCP_REQ3;
end


ZCP_REQ3:
begin
        if (pkt_req_cnt_done_r)
        begin
                rdmc_wr_req_sm_zcp3	= 1'b1;
                next_state      	= ZCP_WAIT3;
        end
        else
                next_state      	= state;
end

ZCP_WAIT3:
begin
		zcp_last_data_sm	= 1'b1;
		bkup_wt_en		= 1'b1;
		if (has_ly2_padding)
                        next_state      = DIS_LY2_PADDING_W;
                else
                        next_state      = PORT_REQ;
end

DIS_PKT:
begin
	if (is_wr_data)
		next_state	= DIS_PKT_WAIT;
	else
	begin
		reset_port_gnt_sm = 1'b1;
		drop_pkt_en_sm	  = 1'b1;
		bkup_wt_en	  = 1'b1;
		next_state	  = DIS_PKT_DONE_W;
	end
end

DIS_PKT_WAIT:
begin
	if (!is_wr_data)
		next_state	= DIS_PKT;
	else
		next_state	= state;
end

DIS_PKT_DONE_W:
begin
        if (drop_pkt_done)
                next_state      = PORT_REQ;
        else
                next_state      = state;
end

DIS_LY2_PADDING_W:
begin
	if (pkt_req_cnt_pre_done)
		next_state	= DIS_LY2_PADDING;
	else
		next_state	= state;
end

DIS_LY2_PADDING:
begin
	if (rdmc_eop_for_padding)
		next_state	= PORT_REQ;
	else
	begin
		drop_pad_data	= 1'b1;
		next_state	= state;
	end
end
				
default:
	next_state	= PORT_REQ;

endcase
end

always @ (posedge clk)
if (reset)
        state <= 5'b0;
else
        state <= next_state;

always @ (posedge clk)
if (reset)
        sel_buf_en <= 1'b0;
else
        sel_buf_en <= stage0_en;

always @ (posedge clk)
if (reset)
        stage1_en_r <= 1'b0;
else
        stage1_en_r <= stage1_en;


always @ (posedge clk)
if (reset)
	rdmc_wr_req_pulse   <= 1'b0;
else
        rdmc_wr_req_pulse   <= rdmc_wr_req_sm;

always @ (posedge clk) 
if (reset)
begin
	is_hdr_wr_req	<= 1'b0;
	is_jmb1_wr_req	<= 1'b0;	
	is_jmb2_wr_req	<= 1'b0;
	is_zcp0_wr_req	<= 1'b0;
	is_zcp1_wr_req	<= 1'b0;
	is_zcp2_wr_req  <= 1'b0;
        is_zcp3_wr_req  <= 1'b0;
end
else if (rdmc_wr_req_sm)
begin
        is_hdr_wr_req   <= rdmc_wr_req_sm_hdr;
        is_jmb1_wr_req  <= rdmc_wr_req_sm_jmb1;
        is_jmb2_wr_req  <= rdmc_wr_req_sm_jmb2;
        is_zcp0_wr_req  <= rdmc_wr_req_sm_zcp0;
        is_zcp1_wr_req  <= rdmc_wr_req_sm_zcp1;
        is_zcp2_wr_req  <= rdmc_wr_req_sm_zcp2;
        is_zcp3_wr_req  <= rdmc_wr_req_sm_zcp3;
end
else if (rdmc_wr_req_accept)
begin
        is_hdr_wr_req   <= 1'b0;
        is_jmb1_wr_req  <= 1'b0;        
        is_jmb2_wr_req  <= 1'b0;
        is_zcp0_wr_req  <= 1'b0;
        is_zcp1_wr_req  <= 1'b0;
        is_zcp2_wr_req  <= 1'b0;
        is_zcp3_wr_req  <= 1'b0;
end
else
begin
	is_hdr_wr_req   <= is_hdr_wr_req;
        is_jmb1_wr_req  <= is_jmb1_wr_req;        
        is_jmb2_wr_req  <= is_jmb2_wr_req;
        is_zcp0_wr_req  <= is_zcp0_wr_req;
        is_zcp1_wr_req  <= is_zcp1_wr_req;
        is_zcp2_wr_req  <= is_zcp2_wr_req;
        is_zcp3_wr_req  <= is_zcp3_wr_req;
end


always @ (posedge clk)
if (reset)
begin
        is_hdr_wr_data   <= 1'b0;
        is_jmb1_wr_data  <= 1'b0;
        is_jmb2_wr_data  <= 1'b0;
	is_zcp0_wr_data  <= 1'b0;
	is_zcp1_wr_data  <= 1'b0;
	is_zcp2_wr_data  <= 1'b0;
	is_zcp3_wr_data  <= 1'b0;
end
else if (rdmc_wr_req_accept)
begin
        is_hdr_wr_data   <= is_hdr_wr_req;
        is_jmb1_wr_data  <= is_jmb1_wr_req;
        is_jmb2_wr_data  <= is_jmb2_wr_req;
        is_zcp0_wr_data  <= is_zcp0_wr_req;
        is_zcp1_wr_data  <= is_zcp1_wr_req;
        is_zcp2_wr_data  <= is_zcp2_wr_req;
        is_zcp3_wr_data  <= is_zcp3_wr_req;

end
else if (pkt_req_cnt_pre_done)
begin
        is_hdr_wr_data   <= 1'b0;
        is_jmb1_wr_data  <= 1'b0;
        is_jmb2_wr_data  <= 1'b0;
	is_zcp0_wr_data  <= 1'b0;
        is_zcp1_wr_data  <= 1'b0;
        is_zcp2_wr_data  <= 1'b0;
        is_zcp3_wr_data  <= 1'b0;
end
else
begin
        is_hdr_wr_data   <= is_hdr_wr_data;
        is_jmb1_wr_data  <= is_jmb1_wr_data;
        is_jmb2_wr_data  <= is_jmb2_wr_data;
	is_zcp0_wr_data  <= is_zcp0_wr_data;
        is_zcp1_wr_data  <= is_zcp1_wr_data;
        is_zcp2_wr_data  <= is_zcp2_wr_data;
        is_zcp3_wr_data  <= is_zcp3_wr_data;
end

always @ (posedge clk)
if (reset)
	zcp_wr_last_data <= 1'b0;
else if (zcp_last_data_sm)
	zcp_wr_last_data <= 1'b1;
else if (pkt_req_cnt_pre_done)
	zcp_wr_last_data <= 1'b0;
else
	zcp_wr_last_data <= zcp_wr_last_data;


assign  rdmc_wr_req_sm = rdmc_wr_req_sm_hdr | rdmc_wr_req_sm_jmb1 | rdmc_wr_req_sm_jmb2 |
                         rdmc_wr_req_sm_zcp0 | rdmc_wr_req_sm_zcp1 | rdmc_wr_req_sm_zcp2 |
                         rdmc_wr_req_sm_zcp3;

wire	rdmc_wr_req_accept_hdr	= rdmc_wr_req_accept & is_hdr_wr_req;
wire	rdmc_wr_req_accept_jmb1	= rdmc_wr_req_accept & is_jmb1_wr_req;
wire	rdmc_wr_req_accept_jmb2	= rdmc_wr_req_accept & is_jmb2_wr_req;
wire	rdmc_wr_req_accept_zcp0	= rdmc_wr_req_accept & is_zcp0_wr_req;
wire    rdmc_wr_req_accept_zcp1 = rdmc_wr_req_accept & is_zcp1_wr_req;
wire    rdmc_wr_req_accept_zcp2 = rdmc_wr_req_accept & is_zcp2_wr_req;
wire    rdmc_wr_req_accept_zcp3 = rdmc_wr_req_accept & is_zcp3_wr_req;
wire    rdmc_wr_req_accept_jmb  = rdmc_wr_req_accept_jmb1 | rdmc_wr_req_accept_jmb2;

wire	update_rcr_shadw_en	= is_hdr_wr_data & !zcopy_mode |
				  is_jmb1_wr_data | is_jmb2_wr_data | 
				  zcp_wr_last_data;

wire	wr_last_pkt_data_en	= is_hdr_wr_data & !(zcopy_mode | jmb_pkt_type[1]) | 
				  is_jmb1_wr_data & (jmb_pkt_type == 2'b10) |
				  is_jmb2_wr_data | zcp_wr_last_data;


wire	update_rcr_shadw	= pkt_req_cnt_pre_done & update_rcr_shadw_en; 

always @ (posedge clk)
if (reset)
	wr_last_pkt_data <= 1'b0;
else
	wr_last_pkt_data <= wr_last_pkt_data_en & pkt_req_cnt_pre_done;


/*********************************/
//Select RDA Channel
/*********************************/
wire[63:0]	rdmc_req_addr_tmp =	{64{pkt_buf_gnt[0]}} & pkt_buf_addr0 |
					{64{pkt_buf_gnt[1]}} & pkt_buf_addr1 |
                                        {64{pkt_buf_gnt[2]}} & pkt_buf_addr2 |
                                        {64{pkt_buf_gnt[3]}} & pkt_buf_addr3 |
                                        {64{pkt_buf_gnt[4]}} & pkt_buf_addr4 |
                                        {64{pkt_buf_gnt[5]}} & pkt_buf_addr5 |
                                        {64{pkt_buf_gnt[6]}} & pkt_buf_addr6 |
                                        {64{pkt_buf_gnt[7]}} & pkt_buf_addr7 |
                                        {64{pkt_buf_gnt[8]}} & pkt_buf_addr8 |
                                        {64{pkt_buf_gnt[9]}} & pkt_buf_addr9 |
                                        {64{pkt_buf_gnt[10]}} & pkt_buf_addr10 |
                                        {64{pkt_buf_gnt[11]}} & pkt_buf_addr11 |
                                        {64{pkt_buf_gnt[12]}} & pkt_buf_addr12 |
                                        {64{pkt_buf_gnt[13]}} & pkt_buf_addr13 |
                                        {64{pkt_buf_gnt[14]}} & pkt_buf_addr14 |
                                        {64{pkt_buf_gnt[15]}} & pkt_buf_addr15;

wire[35:0]      orig_buf_addr_tmp =     {36{pkt_buf_gnt[0]}} & orig_buf_addr0 |
                                        {36{pkt_buf_gnt[1]}} & orig_buf_addr1 |
                                        {36{pkt_buf_gnt[2]}} & orig_buf_addr2 |
                                        {36{pkt_buf_gnt[3]}} & orig_buf_addr3 |
                                        {36{pkt_buf_gnt[4]}} & orig_buf_addr4 |
                                        {36{pkt_buf_gnt[5]}} & orig_buf_addr5 |
                                        {36{pkt_buf_gnt[6]}} & orig_buf_addr6 |
                                        {36{pkt_buf_gnt[7]}} & orig_buf_addr7 |
                                        {36{pkt_buf_gnt[8]}} & orig_buf_addr8 |
                                        {36{pkt_buf_gnt[9]}} & orig_buf_addr9 |
                                        {36{pkt_buf_gnt[10]}} & orig_buf_addr10 |
                                        {36{pkt_buf_gnt[11]}} & orig_buf_addr11 |
                                        {36{pkt_buf_gnt[12]}} & orig_buf_addr12 |
                                        {36{pkt_buf_gnt[13]}} & orig_buf_addr13 |
                                        {36{pkt_buf_gnt[14]}} & orig_buf_addr14 |
                                        {36{pkt_buf_gnt[15]}} & orig_buf_addr15;

wire[1:0]      pkt_buf_size_tmp =       {2{pkt_buf_gnt[0]}} & pkt_buf_size0 |
                                        {2{pkt_buf_gnt[1]}} & pkt_buf_size1 |
                                        {2{pkt_buf_gnt[2]}} & pkt_buf_size2 |
                                        {2{pkt_buf_gnt[3]}} & pkt_buf_size3 |
                                        {2{pkt_buf_gnt[4]}} & pkt_buf_size4 |
                                        {2{pkt_buf_gnt[5]}} & pkt_buf_size5 |
                                        {2{pkt_buf_gnt[6]}} & pkt_buf_size6 |
                                        {2{pkt_buf_gnt[7]}} & pkt_buf_size7 |
                                        {2{pkt_buf_gnt[8]}} & pkt_buf_size8 |
                                        {2{pkt_buf_gnt[9]}} & pkt_buf_size9 |
                                        {2{pkt_buf_gnt[10]}} & pkt_buf_size10 |
                                        {2{pkt_buf_gnt[11]}} & pkt_buf_size11 |
                                        {2{pkt_buf_gnt[12]}} & pkt_buf_size12 |
                                        {2{pkt_buf_gnt[13]}} & pkt_buf_size13 |
                                        {2{pkt_buf_gnt[14]}} & pkt_buf_size14 |
                                        {2{pkt_buf_gnt[15]}} & pkt_buf_size15;

wire[1:0]      pref_buf_used_num_tmp =  {2{pkt_buf_gnt[0]}} & pref_buf_used_num0 |
                                        {2{pkt_buf_gnt[1]}} & pref_buf_used_num1 |
                                        {2{pkt_buf_gnt[2]}} & pref_buf_used_num2 |
                                        {2{pkt_buf_gnt[3]}} & pref_buf_used_num3 |
                                        {2{pkt_buf_gnt[4]}} & pref_buf_used_num4 |
                                        {2{pkt_buf_gnt[5]}} & pref_buf_used_num5 |
                                        {2{pkt_buf_gnt[6]}} & pref_buf_used_num6 |
                                        {2{pkt_buf_gnt[7]}} & pref_buf_used_num7 |
                                        {2{pkt_buf_gnt[8]}} & pref_buf_used_num8 |
                                        {2{pkt_buf_gnt[9]}} & pref_buf_used_num9 |
                                        {2{pkt_buf_gnt[10]}} & pref_buf_used_num10 |
                                        {2{pkt_buf_gnt[11]}} & pref_buf_used_num11 |
                                        {2{pkt_buf_gnt[12]}} & pref_buf_used_num12 |
                                        {2{pkt_buf_gnt[13]}} & pref_buf_used_num13 |
                                        {2{pkt_buf_gnt[14]}} & pref_buf_used_num14 |
                                        {2{pkt_buf_gnt[15]}} & pref_buf_used_num15;

wire[13:0]      pkt_trans_len_tmp =     {14{pkt_buf_gnt[0]}} & pkt_trans_len0 |
                                        {14{pkt_buf_gnt[1]}} & pkt_trans_len1 |
                                        {14{pkt_buf_gnt[2]}} & pkt_trans_len2 |
                                        {14{pkt_buf_gnt[3]}} & pkt_trans_len3 |
                                        {14{pkt_buf_gnt[4]}} & pkt_trans_len4 |
                                        {14{pkt_buf_gnt[5]}} & pkt_trans_len5 |
                                        {14{pkt_buf_gnt[6]}} & pkt_trans_len6 |
                                        {14{pkt_buf_gnt[7]}} & pkt_trans_len7 |
                                        {14{pkt_buf_gnt[8]}} & pkt_trans_len8 |
                                        {14{pkt_buf_gnt[9]}} & pkt_trans_len9 |
                                        {14{pkt_buf_gnt[10]}} & pkt_trans_len10 |
                                        {14{pkt_buf_gnt[11]}} & pkt_trans_len11 |
                                        {14{pkt_buf_gnt[12]}} & pkt_trans_len12 |
                                        {14{pkt_buf_gnt[13]}} & pkt_trans_len13 |
                                        {14{pkt_buf_gnt[14]}} & pkt_trans_len14 |
                                        {14{pkt_buf_gnt[15]}} & pkt_trans_len15;

wire[1:0]      dma_func_num_tmp =       {2{pkt_buf_gnt[0]}} & dma_func_num0 |
                                        {2{pkt_buf_gnt[1]}} & dma_func_num1 |
                                        {2{pkt_buf_gnt[2]}} & dma_func_num2 |
                                        {2{pkt_buf_gnt[3]}} & dma_func_num3 |
                                        {2{pkt_buf_gnt[4]}} & dma_func_num4 |
                                        {2{pkt_buf_gnt[5]}} & dma_func_num5 |
                                        {2{pkt_buf_gnt[6]}} & dma_func_num6 |
                                        {2{pkt_buf_gnt[7]}} & dma_func_num7 |
                                        {2{pkt_buf_gnt[8]}} & dma_func_num8 |
                                        {2{pkt_buf_gnt[9]}} & dma_func_num9 |
                                        {2{pkt_buf_gnt[10]}} & dma_func_num10 |
                                        {2{pkt_buf_gnt[11]}} & dma_func_num11 |
                                        {2{pkt_buf_gnt[12]}} & dma_func_num12 |
                                        {2{pkt_buf_gnt[13]}} & dma_func_num13 |
                                        {2{pkt_buf_gnt[14]}} & dma_func_num14 |
                                        {2{pkt_buf_gnt[15]}} & dma_func_num15; 


niu_rdmc_encode_32   encode_32_inst_a (
                                	.din    (pkt_buf_gnt),
                                	.dout   (pkt_buf_gnt_enc)
                                	);

assign port_gnt_enc 		= (port_gnt == 4'b0010) ? 2'b01 :
				  (port_gnt == 4'b0100) ? 2'b10 :
				  (port_gnt == 4'b1000) ? 2'b11 :
							  2'b00;

assign full_hdr 		= |(full_hdr_bits & pkt_buf_gnt);


assign rdmc_wr_req_sm_nom	= rdmc_wr_req_sm_hdr | rdmc_wr_req_sm_jmb1 | rdmc_wr_req_sm_jmb2;

assign rdmc_req_addr_all 	= rdmc_wr_req_sm_nom  ? rdmc_req_addr_tmp  :
                                  rdmc_wr_req_sm_zcp0 ? zcp_vaddr0         :
                                  rdmc_wr_req_sm_zcp1 ? zcp_vaddr1         :
                                  rdmc_wr_req_sm_zcp2 ? zcp_vaddr2         :
                                                        zcp_vaddr3;

assign pkt_trans_len_all 	= rdmc_wr_req_sm_nom  ? pkt_trans_len_tmp  :
                                  rdmc_wr_req_sm_zcp0 ? zcp_len0           :
                                  rdmc_wr_req_sm_zcp1 ? zcp_len1           :
                                  rdmc_wr_req_sm_zcp2 ? zcp_len2           :
							zcp_len3;

always @ (posedge clk)
if (reset)
        pkt_trans_len_r <= 14'b0;
else if (rdmc_wr_req_sm)
        pkt_trans_len_r <= pkt_trans_len_all;
else
        pkt_trans_len_r <= pkt_trans_len_r;

always @ (posedge clk)
if (reset)
        orig_buf_addr <= 36'b0;
else if (rdmc_wr_req_pulse)
        orig_buf_addr <= orig_buf_addr_tmp;
else
        orig_buf_addr <= orig_buf_addr;

always @ (posedge clk)
if (reset)
        pkt_buf_size_r <= 2'b0;
else if (rdmc_wr_req_pulse & is_hdr_wr_req)
        pkt_buf_size_r <= pkt_buf_size_tmp;
else
        pkt_buf_size_r <= pkt_buf_size_r;

always @ (posedge clk)
if (reset)
        pref_buf_used_num_r <= 2'b0;
else if (rdmc_wr_req_sm_hdr)
        pref_buf_used_num_r <= pref_buf_used_num_tmp;
else
        pref_buf_used_num_r <= pref_buf_used_num_r;


always @ (posedge clk)
if (reset)
        full_hdr_r <= 1'b0;
else if (rdmc_wr_req_pulse & is_hdr_wr_req)
        full_hdr_r <= full_hdr;
else
        full_hdr_r <= full_hdr_r;

wire multi_bit = rdmc_wr_req_accept_hdr  ? pref_buf_used_num_r[1] :
		 rdmc_wr_req_accept_jmb1 ? (&pref_buf_used_num_r) : 1'b0;


always @ (posedge clk)
if (reset)
        pkt_wrbk_data_r <= 23'b0;
else if (rdmc_wr_req_accept_hdr)
        pkt_wrbk_data_r <= pkt_wrbk_data[22:0];
else
        pkt_wrbk_data_r <= pkt_wrbk_data_r;

always @ (posedge clk)
if (reset)
        bus_wrbk_data <= 41'b0;
else if (rdmc_wr_req_accept_hdr | rdmc_wr_req_accept_jmb1 | rdmc_wr_req_accept_jmb2)
        bus_wrbk_data <= {multi_bit, pkt_buf_size_r, orig_buf_addr[35:0], 2'b00};
else
        bus_wrbk_data <= bus_wrbk_data;

always @ (posedge clk)
if (reset)
        rcr_wrbk_data <= 64'b0;
else if (update_rcr_shadw)
        rcr_wrbk_data <= {bus_wrbk_data[40], pkt_wrbk_data_r[22:0], bus_wrbk_data[39:0]};
else
        rcr_wrbk_data <= rcr_wrbk_data;


/******************/
//Drop Packet
/******************/
always @ (posedge clk)
if (reset)
	drop_pkt_en <= 1'b0;
else if (drop_pkt_en_sm)
	drop_pkt_en <= 1'b1;
else if (drop_pkt_done)
	drop_pkt_en <= 1'b0;
else
	drop_pkt_en <= drop_pkt_en;

always @ (posedge clk)
if (reset)
	drop_pkt_port_gnt <= 4'b0;
else if (drop_pkt_en_sm)
	drop_pkt_port_gnt <= port_gnt;
else if (drop_pkt_done)
	drop_pkt_port_gnt <= 4'b0;
else
	drop_pkt_port_gnt <= drop_pkt_port_gnt;

/******************/
//Detect L2 Padding 
/******************/
wire 		pad_data_len_reg_en 	= rdmc_wr_req_sm_hdr | 
				  	  rdmc_wr_req_sm_zcp0 | rdmc_wr_req_sm_zcp1 |
				  	  rdmc_wr_req_sm_zcp2 | rdmc_wr_req_sm_zcp3 ;

wire[13:0] 	pad_data_len_in		= {14{rdmc_wr_req_sm_hdr}} & muxed_pkt_len_r |
				  	  {14{rdmc_wr_req_sm_zcp0}} & zcp_len0 |
				          {14{rdmc_wr_req_sm_zcp1}} & zcp_len1 |
				          {14{rdmc_wr_req_sm_zcp2}} & zcp_len2 |
				          {14{rdmc_wr_req_sm_zcp3}} & zcp_len3 ;

wire[13:0]	pad_data_len_tmp	= pad_data_len - pad_data_len_in;

always @ (posedge clk)
if (reset)
	pad_data_len	<= 14'b0;
else if (pad_data_len_reg_en)
	pad_data_len	<= pad_data_len_tmp;
else if (stage1_en)
	pad_data_len	<= muxed_l2_len_r;
else
	pad_data_len	<= pad_data_len;


assign	has_ly2_padding	= (|pad_data_len[13:4]) | (pad_data_len[3:0] >= muxed_l2_len_r[3:0]) & (|muxed_l2_len_r[3:0]);

	
/*********************************/
//CMD interface signals
/*********************************/
always @ (posedge clk)
if (reset)
	rdmc_meta0_wr_req <= 1'b0;
else if (meta0_rdmc_wr_req_accept)
	rdmc_meta0_wr_req <= 1'b0;
else if (rdmc_wr_req_sm)
	rdmc_meta0_wr_req <= 1'b1;
else
	rdmc_meta0_wr_req <= rdmc_meta0_wr_req;

always @ (posedge clk)
if (reset)
	rdmc_meta0_wr_req_cmd <= 8'b0;
else if (rdmc_wr_req_sm & rx_addr_32b_mode)
	rdmc_meta0_wr_req_cmd <= 8'b0010_0001;
else if (rdmc_wr_req_sm)
	rdmc_meta0_wr_req_cmd <= 8'b0010_1001;
else
	rdmc_meta0_wr_req_cmd <= rdmc_meta0_wr_req_cmd;

always @ (posedge clk)
if (reset)
        rdmc_meta0_wr_req_address <= 64'b0;
else if (rdmc_wr_req_sm & rx_addr_32b_mode)
	rdmc_meta0_wr_req_address <= {32'b0, rdmc_req_addr_all[31:0]};
else if (rdmc_wr_req_sm)
        rdmc_meta0_wr_req_address <= rdmc_req_addr_all[63:0];
else
        rdmc_meta0_wr_req_address <= rdmc_meta0_wr_req_address;

always @ (posedge clk)
if (reset)
	rdmc_meta0_wr_req_length <= 14'b0;
else if (rdmc_wr_req_sm)
	rdmc_meta0_wr_req_length <= pkt_trans_len_all[13:0];
else
	rdmc_meta0_wr_req_length <= rdmc_meta0_wr_req_length;

always @ (posedge clk)
if (reset)
	rdmc_meta0_wr_req_port_num <= 2'b0;
else if (rdmc_wr_req_sm_hdr)
	rdmc_meta0_wr_req_port_num <= port_gnt_enc;
else
	rdmc_meta0_wr_req_port_num <= rdmc_meta0_wr_req_port_num;

wire	rdmc_wr_req_sm_zcp	= rdmc_wr_req_sm_zcp0 | 
				  rdmc_wr_req_sm_zcp1 |
				  rdmc_wr_req_sm_zcp2 |
				  rdmc_wr_req_sm_zcp3;
always @ (posedge clk)
if (reset)
	rdmc_meta0_wr_req_dma_num <= 5'b0;
else if (rdmc_wr_req_sm_hdr)
	rdmc_meta0_wr_req_dma_num <= {1'b0, pkt_buf_gnt_enc};
else if (rdmc_wr_req_sm_zcp)
	rdmc_meta0_wr_req_dma_num <= zcp_rdc_num;
else
	rdmc_meta0_wr_req_dma_num <= rdmc_meta0_wr_req_dma_num;

always @ (posedge clk)
if (reset)
        rdmc_meta0_wr_req_dma_num_int <= 5'b0;		//for output timing
else if (rdmc_wr_req_sm_hdr)
        rdmc_meta0_wr_req_dma_num_int <= {1'b0, pkt_buf_gnt_enc};
else if (rdmc_wr_req_sm_zcp)
        rdmc_meta0_wr_req_dma_num_int <= zcp_rdc_num;
else
        rdmc_meta0_wr_req_dma_num_int <= rdmc_meta0_wr_req_dma_num_int;

always @ (posedge clk)
if (reset)
        rdmc_meta0_wr_req_func_num <= 2'b0;
else if (rdmc_wr_req_sm_hdr)
        rdmc_meta0_wr_req_func_num <= dma_func_num_tmp;
else if (rdmc_wr_req_sm_zcp)
        rdmc_meta0_wr_req_func_num <= zcp_func_num;		//need change 
else
        rdmc_meta0_wr_req_func_num <= rdmc_meta0_wr_req_func_num;


/**********************************************************/
//Generate rdmc_wr_req_accept pulse for the second pipeline
/**********************************************************/
assign is_wr_data = is_hdr_wr_data | is_jmb1_wr_data | is_jmb2_wr_data |
		    is_zcp0_wr_data | is_zcp1_wr_data | is_zcp2_wr_data | is_zcp3_wr_data;

assign rdmc_wr_req_accept_pulse = rdmc_wr_req_accept_in | rdmc_wr_req_accept_reg;

always @ (posedge clk)
if (reset)
	rdmc_wr_req_accept_in <= 1'b0;
else
	rdmc_wr_req_accept_in <= meta0_rdmc_wr_req_accept;

always @ (posedge clk)
if (reset)
	rdmc_wr_req_accept_reg <= 1'b0;
else if (rdmc_wr_req_accept_in & is_wr_data & !pkt_req_cnt_pre_done)
	rdmc_wr_req_accept_reg <= 1'b1;
else if (rdmc_wr_req_accept)
	rdmc_wr_req_accept_reg <= 1'b0;
else
	rdmc_wr_req_accept_reg <= rdmc_wr_req_accept_reg;

assign rdmc_wr_req_accept = rdmc_wr_req_accept_pulse & !is_wr_data |
			    rdmc_wr_req_accept_pulse & is_wr_data & pkt_req_cnt_pre_done;


/***************************/
//4-Portso DDR Arbiter
/***************************/
assign org_req		= ipp_full_pkt & zcp_full_pkt;
assign mask_req		= org_req & ~n_flag;
assign bkup_req		= org_req & ~bkup_n_flag;

assign is_mask_req	= |mask_req;
assign is_org_req	= |org_req;
assign is_bkup_req	= |bkup_req;

assign final_req	= is_mask_req ? mask_req :
			  is_bkup_req ? bkup_req :
					org_req;

niu_rdmc_rr_arbiter	rr_arbiter_inst_a (.req 	(final_req_r),
					  .token	(token),
					  .gnt		(sel_port_gnt)
					);


always @ (posedge clk)
if (reset)
	reset_port_gnt <= 1'b0;
else
	reset_port_gnt <= reset_port_gnt_sm;

always @ (posedge clk)
if (reset)
	port_gnt <= 4'b0;
else if (arb_cyc1_en)
	port_gnt <= sel_port_gnt;
else if (reset_port_gnt)
	port_gnt <= 4'b0;
else 
	port_gnt <= port_gnt;

always @ (posedge clk)
if (reset)
        port_gnt_r      <= 4'b0;
else if (rdmc_wr_req_sm_hdr | drop_pkt_req)
        port_gnt_r      <= port_gnt;
else
        port_gnt_r      <= port_gnt_r;

always @ (posedge clk)
if (reset)
        token   <= 4'b0001;
else if (arb_cyc1_en & (|sel_port_gnt))
        token   <= {sel_port_gnt[2:0], sel_port_gnt[3]};
else
        token   <= token;


always @ (posedge clk)
if (reset)
	final_req_r	<= 4'b0;
else if (arb_cyc0_en)
	final_req_r	<= final_req;
else
	final_req_r	<= final_req_r;

always @ (posedge clk)
if (reset)
begin
	is_bkup_req_r	<= 1'b0;
	is_org_req_r	<= 1'b0;
end
else if (arb_cyc0_en)
begin
	is_bkup_req_r	<= !is_mask_req & is_bkup_req;
	is_org_req_r	<= !(is_mask_req | is_bkup_req) & is_org_req;
end
else
begin
        is_bkup_req_r   <= is_bkup_req_r;
	is_org_req_r	<= is_org_req_r;
end


/*********************************/
//Weight Calculation
/*********************************/
wire[15:0] curr_wt0_tmp	= (curr_wt0 - {6'b0, muxed_l2_len_r[13:4]});
wire[15:0] curr_wt1_tmp = (curr_wt1 - {6'b0, muxed_l2_len_r[13:4]});
wire[15:0] curr_wt2_tmp = (curr_wt2 - {6'b0, muxed_l2_len_r[13:4]});
wire[15:0] curr_wt3_tmp = (curr_wt3 - {6'b0, muxed_l2_len_r[13:4]});

wire[15:0] bkup_wt0_tmp = n_flag[0] ? (pt_drr_wt0_reg + curr_wt0[15:0]) : pt_drr_wt0_reg;
wire[15:0] bkup_wt1_tmp = n_flag[1] ? (pt_drr_wt1_reg + curr_wt1[15:0]) : pt_drr_wt1_reg;
wire[15:0] bkup_wt2_tmp = n_flag[2] ? (pt_drr_wt2_reg + curr_wt2[15:0]) : pt_drr_wt2_reg;
wire[15:0] bkup_wt3_tmp = n_flag[3] ? (pt_drr_wt3_reg + curr_wt3[15:0]) : pt_drr_wt3_reg;

wire[15:0] new_bkup_wt0	= bkup_n_flag[0] ? (pt_drr_wt0_reg + bkup_wt0[15:0]) : pt_drr_wt0_reg;
wire[15:0] new_bkup_wt1 = bkup_n_flag[1] ? (pt_drr_wt1_reg + bkup_wt1[15:0]) : pt_drr_wt1_reg;
wire[15:0] new_bkup_wt2 = bkup_n_flag[2] ? (pt_drr_wt2_reg + bkup_wt2[15:0]) : pt_drr_wt2_reg;
wire[15:0] new_bkup_wt3 = bkup_n_flag[3] ? (pt_drr_wt3_reg + bkup_wt3[15:0]) : pt_drr_wt3_reg;

wire	update_curr_wt	= arb_cyc1_en & is_bkup_req_r;
wire	reset_curr_wt	= arb_cyc1_en & is_org_req_r | idle_cycle;
wire	update_bkup_wt	= bkup_wt_en & (&(bkup_n_flag | ~org_req));
wire	reset_bkup_wt	= update_curr_wt | reset_curr_wt;

always @ (posedge clk)
if (reset)
	curr_wt0 <= 16'h0400;
else if (stage1_en & port_gnt[0])
	curr_wt0 <= curr_wt0_tmp;
else if (reset_curr_wt)
	curr_wt0 <= pt_drr_wt0_reg;
else if (update_curr_wt)
	curr_wt0 <= bkup_wt0;
else
	curr_wt0 <= curr_wt0;

always @ (posedge clk)
if (reset)
        curr_wt1 <= 16'h0400;
else if (stage1_en & port_gnt[1])
        curr_wt1 <= curr_wt1_tmp;
else if (reset_curr_wt)
        curr_wt1 <= pt_drr_wt1_reg;
else if (update_curr_wt)
        curr_wt1 <= bkup_wt1;
else
        curr_wt1 <= curr_wt1;

always @ (posedge clk)
if (reset)
        curr_wt2 <= 16'h0066;
else if (stage1_en & port_gnt[2])
        curr_wt2 <= curr_wt2_tmp;
else if (reset_curr_wt)
        curr_wt2 <= pt_drr_wt2_reg;
else if (update_curr_wt)
        curr_wt2 <= bkup_wt2;
else
        curr_wt2 <= curr_wt2;

always @ (posedge clk)
if (reset)
        curr_wt3 <= 16'h0066;
else if (stage1_en & port_gnt[3])
        curr_wt3 <= curr_wt3_tmp;
else if (reset_curr_wt)
        curr_wt3 <= pt_drr_wt3_reg;
else if (update_curr_wt)
        curr_wt3 <= bkup_wt3;
else
        curr_wt3 <= curr_wt3;


always @ (posedge clk)
if (reset)
	bkup_wt0 <= 16'h0400;
else if (stage2_en & port_gnt[0])
	bkup_wt0 <= bkup_wt0_tmp;
else if (update_bkup_wt)
	bkup_wt0 <= new_bkup_wt0;
else if (reset_bkup_wt)
	bkup_wt0 <= pt_drr_wt0_reg;
else
	bkup_wt0 <= bkup_wt0;


always @ (posedge clk)
if (reset)
        bkup_wt1 <= 16'h0400;
else if (stage2_en & port_gnt[1])
        bkup_wt1 <= bkup_wt1_tmp;
else if (update_bkup_wt)
        bkup_wt1 <= new_bkup_wt1;
else if (reset_bkup_wt)
        bkup_wt1 <= pt_drr_wt1_reg;
else
        bkup_wt1 <= bkup_wt1;

always @ (posedge clk)
if (reset)
        bkup_wt2 <= 16'h0066;
else if (stage2_en & port_gnt[2])
        bkup_wt2 <= bkup_wt2_tmp;
else if (update_bkup_wt)
        bkup_wt2 <= new_bkup_wt2;
else if (reset_bkup_wt)
        bkup_wt2 <= pt_drr_wt2_reg;
else
        bkup_wt2 <= bkup_wt2;

always @ (posedge clk)
if (reset)
        bkup_wt3 <= 16'h0066;
else if (stage2_en & port_gnt[3])
        bkup_wt3 <= bkup_wt3_tmp;
else if (update_bkup_wt)
        bkup_wt3 <= new_bkup_wt3;
else if (reset_bkup_wt)
        bkup_wt3 <= pt_drr_wt3_reg;
else
        bkup_wt3 <= bkup_wt3;


endmodule


	



				
