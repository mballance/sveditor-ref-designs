// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rdmc_wr_dp.v
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
module niu_rdmc_wr_dp (
			clk,
			reset,
			muxed_port_rdc_num,
			port_err_status,
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
			rdmc_meta0_wr_req_dma_num_int,
			
			ipp_dmc_ful_pkt0,
			ipp_dmc_dat_ack0,
			ipp_dmc_dat_err0,
			ipp_dmc_data0,
			ipp_dmc_ful_pkt1,
			ipp_dmc_dat_ack1,
			ipp_dmc_dat_err1,
			ipp_dmc_data1,
			ipp_dmc_ful_pkt2,
			ipp_dmc_dat_ack2,
			ipp_dmc_dat_err2,
			ipp_dmc_data2,
			ipp_dmc_ful_pkt3,
			ipp_dmc_dat_ack3,
			ipp_dmc_dat_err3,
			ipp_dmc_data3,

			zcp_dmc_ful_pkt0,
			zcp_dmc_ack0,
                        zcp_dmc_dat0,
			zcp_dmc_dat_err0,
                        zcp_dmc_ful_pkt1,
			zcp_dmc_ack1,
                        zcp_dmc_dat1,
			zcp_dmc_dat_err1,
                        zcp_dmc_ful_pkt2,
			zcp_dmc_ack2,
                        zcp_dmc_dat2,
			zcp_dmc_dat_err2,
                        zcp_dmc_ful_pkt3,
			zcp_dmc_ack3,
                        zcp_dmc_dat3,
			zcp_dmc_dat_err3,
			meta0_rdmc_wr_data_req,

			muxed_rdc_num_r,
			muxed_drop_pkt_r,
			muxed_s_event_r,
			muxed_pkt_len,
			muxed_pkt_len_r,
			muxed_l2_len_r,
			rdmc_eop_for_padding,
			pkt_req_cnt_pre_done,
			pkt_req_cnt_done,
			pkt_req_cnt_done_r,
			pkt_req_cnt_e_done_mod,
			pkt_wrbk_data,
			drop_pkt_done,
			rdmc_wr_data_dma_num,
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

			dmc_ipp_dat_req0,
			dmc_ipp_dat_req1,
			dmc_ipp_dat_req2,
			dmc_ipp_dat_req3,

			dmc_zcp_req0,
                        dmc_zcp_req1,
                        dmc_zcp_req2,
                        dmc_zcp_req3,

			rdmc_meta0_wr_data_valid,
			rdmc_meta0_wr_data,
			rdmc_meta0_wr_req_byteenable,
			rdmc_meta0_wr_transfer_comp,
			rdmc_meta0_wr_transfer_comp_int,
			rdmc_meta0_wr_status,

			port_err_event,
			ipp_dat_req0_data,
			ipp_dat_req1_data,
			ipp_dat_req2_data,
			ipp_dat_req3_data,
			wr_dp_sm_state

			);


input		clk;
input		reset;
input[3:0]	port_err_status;
input[4:0]      muxed_port_rdc_num;
input		full_hdr_r;
input[13:0]     pkt_trans_len_r;
input[1:0]	pref_buf_used_num_r;
input		drop_pkt_en_sm;
input		drop_pkt_en;
input[3:0]	drop_pkt_port_gnt;
input		drop_pad_data;
input		is_zcp0_wr_req;
input		is_zcp1_wr_req;
input		is_zcp2_wr_req;
input		is_zcp3_wr_req;
input		rdmc_wr_req_accept_hdr;
input		rdmc_wr_req_accept_jmb;
input		rdmc_wr_req_accept_zcp0;
input		rdmc_wr_req_accept_zcp1;
input		rdmc_wr_req_accept_zcp2;
input		rdmc_wr_req_accept_zcp3;
input[3:0]	port_gnt;
input[3:0]	port_gnt_r;
input		stage0_en;
input[4:0]	rdmc_meta0_wr_req_dma_num_int;
input		ipp_dmc_ful_pkt0;
input		ipp_dmc_dat_ack0;
input		ipp_dmc_dat_err0;
input[129:0]	ipp_dmc_data0;
input		ipp_dmc_ful_pkt1;
input		ipp_dmc_dat_ack1;
input		ipp_dmc_dat_err1;
input[129:0]	ipp_dmc_data1;
input		ipp_dmc_ful_pkt2;
input		ipp_dmc_dat_ack2;
input		ipp_dmc_dat_err2;
input[129:0]	ipp_dmc_data2;
input		ipp_dmc_ful_pkt3;
input		ipp_dmc_dat_ack3;
input		ipp_dmc_dat_err3;
input[129:0]	ipp_dmc_data3;

input		zcp_dmc_ful_pkt0;
input		zcp_dmc_ack0;
input[129:0]	zcp_dmc_dat0;
input		zcp_dmc_dat_err0;
input		zcp_dmc_ful_pkt1;
input		zcp_dmc_ack1;
input[129:0]	zcp_dmc_dat1;
input		zcp_dmc_dat_err1;
input		zcp_dmc_ful_pkt2;
input		zcp_dmc_ack2;
input[129:0]	zcp_dmc_dat2;
input		zcp_dmc_dat_err2;
input		zcp_dmc_ful_pkt3;
input		zcp_dmc_ack3;
input[129:0]	zcp_dmc_dat3;
input		zcp_dmc_dat_err3;
input		meta0_rdmc_wr_data_req;

output[4:0]     muxed_rdc_num_r;
output          muxed_drop_pkt_r;
output          muxed_s_event_r;
output[13:0]    muxed_pkt_len;
output[13:0]	muxed_pkt_len_r;
output[13:0]    muxed_l2_len_r;
output		rdmc_eop_for_padding;
output		pkt_req_cnt_pre_done;
output		pkt_req_cnt_done;
output		pkt_req_cnt_done_r;
output		pkt_req_cnt_e_done_mod;
output[22:0]	pkt_wrbk_data;
output		drop_pkt_done;
output[4:0]	rdmc_wr_data_dma_num;
output[3:0]	ipp_full_pkt;
output[3:0]	zcp_full_pkt;
output[3:0]	ipp_pkt_sop;
output[3:0]	zcp_pkt_sop;
output		muxed_zcopy_mode_r;
output		muxed_data_err_r2;
output		zcopy_mode;
output[1:0]	jmb_pkt_type;
output[1:0]     zcp_wr_type;
output[4:0]	zcp_rdc_num;
output[63:0]	zcp_vaddr0;
output[63:0]    zcp_vaddr1;
output[63:0]    zcp_vaddr2;
output[63:0]    zcp_vaddr3;
output[13:0]	zcp_len0;
output[13:0]	zcp_len1;
output[13:0]	zcp_len2;
output[13:0]	zcp_len3;
output[1:0]	zcp_func_num;
output		dmc_ipp_dat_req0;
output		dmc_ipp_dat_req1;
output		dmc_ipp_dat_req2;
output		dmc_ipp_dat_req3;
output		dmc_zcp_req0;
output		dmc_zcp_req1;
output		dmc_zcp_req2;
output		dmc_zcp_req3;
output		rdmc_meta0_wr_data_valid;
output[127:0]	rdmc_meta0_wr_data;
output[15:0]	rdmc_meta0_wr_req_byteenable;
output		rdmc_meta0_wr_transfer_comp;
output		rdmc_meta0_wr_transfer_comp_int;
output[3:0]	rdmc_meta0_wr_status;
output[8:0]	port_err_event;
output		ipp_dat_req0_data;
output		ipp_dat_req1_data;
output		ipp_dat_req2_data;
output		ipp_dat_req3_data;
output[4:0]	wr_dp_sm_state;

reg		ipp_full_pkt0;
reg		ipp_data_ack0;
reg		ipp_data_err0;
reg[129:0]	ipp_data0;
reg             ipp_full_pkt1;
reg             ipp_data_ack1;
reg		ipp_data_err1;
reg[129:0]      ipp_data1;
reg             ipp_full_pkt2;
reg             ipp_data_ack2;
reg		ipp_data_err2;
reg[129:0]      ipp_data2;
reg             ipp_full_pkt3;
reg             ipp_data_ack3;
reg		ipp_data_err3;
reg[129:0]      ipp_data3;
reg             zcp_full_pkt0;
reg             zcp_data_ack0;
reg		zcp_data_err0;
reg[129:0]      zcp_data0;
reg             zcp_full_pkt1;
reg             zcp_data_ack1;
reg		zcp_data_err1;
reg[129:0]      zcp_data1;
reg             zcp_full_pkt2;
reg             zcp_data_ack2;
reg		zcp_data_err2;
reg[129:0]      zcp_data2;
reg             zcp_full_pkt3;
reg             zcp_data_ack3;
reg		zcp_data_err3;
reg[129:0]      zcp_data3;

reg		muxed_cksum_err_r;
reg		muxed_bad_crc_r;
reg[3:0]	muxed_ipp_pkt_id_r;
reg[13:0]	muxed_l2_len_r;
reg[13:0]	muxed_pkt_len_r;
reg[1:0]	muxed_pkt_type_r;
reg		muxed_drop_pkt_r;
reg		muxed_s_event_r;
reg		muxed_zcopy_mode_r;
reg		muxed_orig_zcopy_mode_r;
reg		muxed_fflp_hw_err_r;
reg		muxed_mac_promis_r;
reg[4:0]	muxed_rdc_num_r;
reg		muxed_noport_r;
reg		muxed_zcp_err_r;
reg		muxed_orig_zcopy_mode_r1;

reg             rdmc_wr_data_req;
reg		rdmc_wr_data_req_dly;
reg[4:0]	rdmc_wr_data_dma_num;
reg[3:0]        port_gnt_r1;
reg[3:0]	port_gnt_r2;
reg		is_first_accept;
reg		ipp_data_req_p_r;
reg		ipp_data_req_p_r1;
reg		ipp_data_req_p_r2;
reg		zcopy_mode;
reg[1:0]	jmb_pkt_type;
reg[1:0]	zcp_wr_type;
reg		full_hdr_r1;

reg[2:0]	zcp_req_cnt;
reg             dmc_zcp_req0;
reg             dmc_zcp_req1;
reg             dmc_zcp_req2;
reg             dmc_zcp_req3;
reg[1:0]	zcp_ack_cnt;
reg[127:0]	zcp_data_reg0;
reg[31:0]	zcp_data_reg1;

`ifdef NEPTUNE
reg[127:0]	zcp_data_reg2;
reg[127:0]	zcp_data_reg3;
reg[21:0]       zcp_data_reg1_lo;       //for zcp page handle
`else
wire[127:0]	zcp_data_reg2;
wire[127:0]	zcp_data_reg3;
wire[21:0]	zcp_data_reg1_lo;
`endif

reg[9:0]	drop_pkt_word_cnt;
reg[3:0]	drop_pkt_en_dly;
reg[10:0]	ipp_pkt_len_word_cnt;
reg		dmc_ipp_dat_req0;
reg		dmc_ipp_dat_req1;
reg		dmc_ipp_dat_req2;
reg		dmc_ipp_dat_req3;
reg		ipp_data_req0_dly;
reg		ipp_data_req1_dly;
reg		ipp_data_req2_dly;
reg		ipp_data_req3_dly;
reg		ipp_data_req_dly1;
reg		ipp_data_req_dly2;
reg		stage0_en_r;
reg		drop_pad_data_r;
reg		ipp_fzcp_eop_tmp;
reg		ipp_fzcp_eop_tmp1;
reg		ipp_fzcp_eop_tmp2;
reg		ipp_fzcp_eop;

reg             ipp_dat_req0_data;
reg             ipp_dat_req1_data;
reg             ipp_dat_req2_data;
reg             ipp_dat_req3_data;

reg[13:0]	new_zcp_data_len_r;
reg[9:0]	pkt_len_word_cnt;
reg[9:0]	data_req_cnt;
reg		pkt_req_cnt_pre_done;
reg		pkt_req_cnt_done;
reg		pkt_req_cnt_done_r;
reg		pkt_req_cnt_done_r1;
reg		pkt_req_cnt_done_r2;
reg		pkt_req_cnt_e_done_r;
reg[3:0]	wr_len_last_bits;
reg[3:0]	wr_len_last_bits_r;
reg[15:0]	wr_data_byte_dec;

reg[3:0]	next_data_offset_reg;
reg[3:0]	data_offset_reg;
reg[127:0]	save_reg_trans;
reg[127:0]	date_save_reg_trans;
reg[127:0]	data_save_reg_tmp;
reg[127:0]	data_save_reg;
reg[127:0]	rdmc_wr_data_tmp;

reg		muxed_data_err;
reg		muxed_data_err_r1;
reg		muxed_data_err_r2;
reg[9:0]	rdmc_eop_cnt;
reg		rdmc_cal_eop;
reg		rdmc_cal_eop_r;
reg		rdmc_cal_eop_tmp;
reg		rdmc_cal_eop_tmp1;
reg		zcp_second_data_ack_dly;

reg		zcp_sop_reg0;
reg		zcp_sop_reg1;
reg		zcp_sop_reg2;
reg		zcp_sop_reg3;
reg             ipp_sop_reg0;
reg             ipp_sop_reg1;
reg             ipp_sop_reg2;
reg             ipp_sop_reg3;

reg[127:0]	rdmc_meta0_wr_data;
reg		rdmc_meta0_wr_data_valid;
reg		rdmc_meta0_wr_transfer_comp;
reg		rdmc_meta0_wr_transfer_comp_int;
reg[15:0]	rdmc_meta0_wr_req_byteenable;
reg		rdmc_wr_last_comp;
reg		wait_drop_pkt_eop;

reg		rdmc_wr_req_accept_hdr_r;
reg		rdmc_wr_req_accept_hdr_r1;
reg[127:0]	zcp_data_reg0_r;
reg[15:0]	zcp_data_reg1_r;

wire		offset_reg_en;
wire[1:0]	offset_sel;
wire		wr_idle_state;
wire[1:0]	rdmc_wr_data_sel;
wire		rdmc_wr_data_valid_sm;
wire		rdmc_wr_data_comp_sm;
wire		rdmc_wr_last_comp_sm;
wire		jmb_wr_cycle_sm;

wire		pkt_req_cnt_e_done_mod;

wire		muxed_ipp_data_ack;
wire[27:0]	ipp_ctrl_word0;
wire[27:0]	ipp_ctrl_word1;
wire[27:0]	ipp_ctrl_word2;
wire[27:0]	ipp_ctrl_word3;
wire[27:0]	muxed_ipp_ctrl_w;
wire[24:0]      zcp_ctrl_word0;
wire[24:0]      zcp_ctrl_word1;
wire[24:0]      zcp_ctrl_word2;
wire[24:0]      zcp_ctrl_word3;
wire[24:0]      muxed_zcp_ctrl_w;

wire		muxed_cksum_err;
wire		muxed_bad_crc;
wire[13:0]	muxed_l2_len;
wire[13:0]	muxed_pkt_len;
wire[1:0]	muxed_pkt_type;
wire[3:0]	muxed_ipp_pkt_id;
wire[5:0]	muxed_ipp_drop_bits;
wire		muxed_ipp_drop_pkt;
wire[7:0]	muxed_pkt_hdr_len;
wire		muxed_s_event;
wire		muxed_zcp_drop_pkt;
wire		muxed_fflp_hw_err;
wire		muxed_mac_promis;
wire		muxed_zcopy_mode;
wire		muxed_orig_zcopy_mode;
wire[4:0]	muxed_tbl_rdc_num;
wire[4:0]	muxed_fflp_rdc_num;
wire		muxed_noport;
wire		muxed_zcp_err;

wire[3:0]	ipp_pkt_sop;
wire[3:0]       zcp_pkt_sop;
wire[3:0]	ipp_full_pkt;
wire[3:0]	zcp_full_pkt;

wire		is_l2_err;
wire[4:0]	muxed_rdc_num;

wire		zcp_req_cnt_done;
wire		zcp_data_ack;
wire[127:0]	muxed_zcp_data;
wire		muxed_zcp_data_eop;
wire[4:0]	zcp_rdc_num;
wire[1:0]	zcp_type;
wire[3:0]	zcp_pkt_id;
wire[43:0]	zcp_vaddr0_tmp;
wire[43:0]      zcp_vaddr1_tmp;
wire[43:0]      zcp_vaddr2_tmp;
wire[43:0]      zcp_vaddr3_tmp;

wire[63:0]	zcp_vaddr0;
wire[13:0]	zcp_len0;
wire[63:0]      zcp_vaddr1;
wire[13:0]      zcp_len1;
wire[63:0]      zcp_vaddr2;
wire[13:0]      zcp_len2;
wire[63:0]      zcp_vaddr3;
wire[13:0]      zcp_len3;
wire[1:0]	zcp_func_num;

wire		is_zcp_wr_req;
wire		rdmc_wr_req_accept_zcp;
wire		rdmc_wr_req_accept_all;
wire		rdmc_wr_req_accept_data;

wire		drop_pkt_len_leftover;
wire[9:0]	drop_pkt_word_cnt_tmp;
wire		drop_pkt_done;

wire		zcp_has_ipp_data_req;
wire[13:0]	zcp_data_len;
wire[13:0]	new_zcp_data_len_tmp;
wire[13:0]	new_zcp_data_len;

wire[13:0]	ipp_pkt_len;
wire		ipp_pkt_len_left_over;
wire[10:0]	ipp_pkt_len_word_cnt_tmp;
wire		ipp_data_req_en;

wire		rdmc_wr_data_req_p;
wire		rdmc_wr_data_req_mod;

wire		ipp_data_req0_p;
wire		ipp_data_req1_p;
wire		ipp_data_req2_p;
wire		ipp_data_req3_p;
wire		ipp_data_req_p;
wire		ipp_data_req_dly;

wire[127:0]	muxed_ipp_data;
wire		muxed_ipp_data_eop;
wire		muxed_ipp_data_err;
wire[3:0]	ipp_data_req_maskout;
wire		ipp_data_req_in;
wire		ipp_fzcp_eop_in;
wire		ipp_next_eop;

wire		pkt_len_left_over;
wire[9:0]	pkt_len_word_cnt_tmp;
wire		pkt_req_cnt_done_tmp;
wire[15:0]	wr_data_byte_en;

wire[3:0]	next_data_offset_tmp1;
wire[3:0]	next_data_offset_tmp2;
wire[3:0]	next_data_offset_tmp;

wire[4:0]	wr_dp_sm_state;

wire[3:0]	port_ipp_eop_err;
wire[3:0]	port_zcp_eop_err;
wire[8:0]	port_err_event;


//Input registers
always @ (posedge clk)
begin
	ipp_full_pkt0		<= ipp_dmc_ful_pkt0 & !ipp_dmc_dat_err0;
	ipp_data_ack0		<= ipp_dmc_dat_ack0;
	ipp_data_err0		<= ipp_dmc_dat_err0;
	ipp_data0   		<= ipp_dmc_data0;

	ipp_full_pkt1   	<= ipp_dmc_ful_pkt1 & !ipp_dmc_dat_err1;
        ipp_data_ack1   	<= ipp_dmc_dat_ack1;
	ipp_data_err1		<= ipp_dmc_dat_err1;
        ipp_data1    		<= ipp_dmc_data1;

	ipp_full_pkt2   	<= ipp_dmc_ful_pkt2 & !ipp_dmc_dat_err2;
        ipp_data_ack2   	<= ipp_dmc_dat_ack2;
	ipp_data_err2           <= ipp_dmc_dat_err2;
        ipp_data2    		<= ipp_dmc_data2;

	ipp_full_pkt3   	<= ipp_dmc_ful_pkt3 & !ipp_dmc_dat_err3;
        ipp_data_ack3   	<= ipp_dmc_dat_ack3;
	ipp_data_err3           <= ipp_dmc_dat_err3;
        ipp_data3    		<= ipp_dmc_data3;

	zcp_full_pkt0   	<= zcp_dmc_ful_pkt0 & !zcp_dmc_dat_err0;
        zcp_data_ack0   	<= zcp_dmc_ack0;
        zcp_data0 		<= zcp_dmc_dat0;
	zcp_data_err0		<= zcp_dmc_dat_err0;

        zcp_full_pkt1   	<= zcp_dmc_ful_pkt1 & !zcp_dmc_dat_err1;
        zcp_data_ack1   	<= zcp_dmc_ack1;
        zcp_data1 		<= zcp_dmc_dat1;
	zcp_data_err1		<= zcp_dmc_dat_err1;

        zcp_full_pkt2   	<= zcp_dmc_ful_pkt2 & !zcp_dmc_dat_err2;
        zcp_data_ack2   	<= zcp_dmc_ack2;
        zcp_data2 		<= zcp_dmc_dat2;
	zcp_data_err2		<= zcp_dmc_dat_err2;

        zcp_full_pkt3   	<= zcp_dmc_ful_pkt3 & !zcp_dmc_dat_err3;
        zcp_data_ack3   	<= zcp_dmc_ack3;
        zcp_data3 		<= zcp_dmc_dat3;
	zcp_data_err3		<= zcp_dmc_dat_err3;
end


/**********************/
// Select port
/**********************/
/*
assign ipp_ctrl_word0	= {ipp_data0[103], ipp_data0[60:56], ipp_data0[53:48], 
			   ipp_data0[101:88], ipp_data0[102], ipp_data0[17]};	//28bits  

assign ipp_ctrl_word1   = {ipp_data1[103], ipp_data1[60:56], ipp_data1[53:48], 
                           ipp_data1[101:88], ipp_data1[102], ipp_data1[17]};   //28bits  

assign ipp_ctrl_word2   = {ipp_data2[103], ipp_data2[60:56], ipp_data2[53:48], 
                           ipp_data2[101:88], ipp_data2[102], ipp_data2[17]};   //28bits  

assign ipp_ctrl_word3   = {ipp_data3[103], ipp_data3[60:56], ipp_data3[53:48], 
                           ipp_data3[101:88], ipp_data3[102], ipp_data3[17]};   //28bits  
*/

assign ipp_ctrl_word0   = {ipp_data0[57:52], ipp_data0[49:44],
                           ipp_data0[101:88], ipp_data0[102], ipp_data0[17]};   //28bits

assign ipp_ctrl_word1   = {ipp_data1[57:52], ipp_data1[49:44],
                           ipp_data1[101:88], ipp_data1[102], ipp_data1[17]};   //28bits

assign ipp_ctrl_word2   = {ipp_data2[57:52], ipp_data2[49:44],
                           ipp_data2[101:88], ipp_data2[102], ipp_data2[17]};   //28bits

assign ipp_ctrl_word3   = {ipp_data3[57:52], ipp_data3[49:44],
                           ipp_data3[101:88], ipp_data3[102], ipp_data3[17]};   //28bits


assign muxed_ipp_ctrl_w = {28{port_gnt[0]}} & ipp_ctrl_word0 |
			  {28{port_gnt[1]}} & ipp_ctrl_word1 |
			  {28{port_gnt[2]}} & ipp_ctrl_word2 |
			  {28{port_gnt[3]}} & ipp_ctrl_word3;

assign zcp_ctrl_word0   = {zcp_data0[117], zcp_data0[111:104], zcp_data0[95:94], zcp_data0[87], 
			   zcp_data0[79:76], zcp_data0[63:56], zcp_data0[44]}; //25 bits

assign zcp_ctrl_word1   = {zcp_data1[117], zcp_data1[111:104], zcp_data1[95:94], zcp_data1[87], 
			   zcp_data1[79:76], zcp_data1[63:56], zcp_data1[44]};

assign zcp_ctrl_word2   = {zcp_data2[117], zcp_data2[111:104], zcp_data2[95:94], zcp_data2[87], 
			   zcp_data2[79:76], zcp_data2[63:56], zcp_data2[44]};

assign zcp_ctrl_word3   = {zcp_data3[117], zcp_data3[111:104], zcp_data3[95:94], zcp_data3[87], 
			   zcp_data3[79:76], zcp_data3[63:56], zcp_data3[44]};

assign muxed_zcp_ctrl_w	= {25{port_gnt[0]}} & zcp_ctrl_word0 |
                          {25{port_gnt[1]}} & zcp_ctrl_word1 |
                          {25{port_gnt[2]}} & zcp_ctrl_word2 |
                          {25{port_gnt[3]}} & zcp_ctrl_word3;

//assign muxed_cksum_err	= muxed_ipp_data_c[17];
//assign muxed_pkt_id		= muxed_ipp_data_c[53:50];
//assign muxed_pkt_len		= muxed_ipp_data_c[101:88];
//assign muxed_bad_crc		= muxed_ipp_data_c[102]
//assign muxed_ipp_discard_bits	= {muxed_ipp_data_c[103], muxed_ipp_data_c[60:56]};

assign muxed_cksum_err		= muxed_ipp_ctrl_w[0];
assign muxed_bad_crc		= muxed_ipp_ctrl_w[1];
assign muxed_pkt_len		= muxed_zcopy_mode ? {6'b0, muxed_pkt_hdr_len} : muxed_ipp_ctrl_w[15:2];
assign muxed_l2_len		= muxed_ipp_ctrl_w[15:2];
assign muxed_pkt_type		= muxed_ipp_ctrl_w[17:16];
assign muxed_ipp_pkt_id		= muxed_ipp_ctrl_w[21:18];
assign muxed_ipp_drop_bits	= muxed_ipp_ctrl_w[27:22];
assign muxed_ipp_drop_pkt	= |muxed_ipp_drop_bits;

assign muxed_zcp_err		= !muxed_orig_zcopy_mode & muxed_zcp_ctrl_w[0];
assign muxed_pkt_hdr_len	= muxed_zcp_ctrl_w[8:1];
assign muxed_s_event		= muxed_zcp_ctrl_w[9];
assign muxed_zcp_drop_pkt	= muxed_zcp_ctrl_w[10];
assign muxed_fflp_hw_err	= muxed_zcp_ctrl_w[11];
assign muxed_mac_promis		= muxed_zcp_ctrl_w[12];
assign muxed_orig_zcopy_mode	= muxed_zcp_ctrl_w[13];
assign muxed_zcopy_mode		= muxed_orig_zcopy_mode & !(muxed_bad_crc | muxed_cksum_err);
assign muxed_tbl_rdc_num	= muxed_zcp_ctrl_w[18:14];  
assign muxed_fflp_rdc_num	= muxed_zcp_ctrl_w[23:19];
assign muxed_noport		= muxed_zcp_ctrl_w[24];

assign ipp_full_pkt	= {ipp_full_pkt3, ipp_full_pkt2, ipp_full_pkt1, ipp_full_pkt0} & (~port_err_status);
assign zcp_full_pkt	= {zcp_full_pkt3, zcp_full_pkt2, zcp_full_pkt1, zcp_full_pkt0} & (~port_err_status);

assign ipp_pkt_sop	= {ipp_sop_reg3, ipp_sop_reg2, ipp_sop_reg1, ipp_sop_reg0};
assign zcp_pkt_sop	= {zcp_sop_reg3, zcp_sop_reg2, zcp_sop_reg1, zcp_sop_reg0};

/**********************/
//Select RDC number
/**********************/
assign is_l2_err	= muxed_mac_promis | muxed_bad_crc | muxed_ipp_drop_pkt | muxed_zcp_drop_pkt;
assign muxed_rdc_num	= is_l2_err	  ? muxed_port_rdc_num :
			  muxed_cksum_err ? muxed_tbl_rdc_num  :
					    muxed_fflp_rdc_num;
always @ (posedge clk)
if (reset)
begin
	muxed_cksum_err_r	<= 1'b0;
	muxed_bad_crc_r		<= 1'b0;
	muxed_ipp_pkt_id_r	<= 4'b0;
	muxed_pkt_len_r		<= 14'b0;
	muxed_l2_len_r		<= 14'b0;
	muxed_drop_pkt_r	<= 1'b0;
	muxed_mac_promis_r	<= 1'b0;
	muxed_s_event_r		<= 1'b0;
	muxed_fflp_hw_err_r	<= 1'b0;
	muxed_zcopy_mode_r	<= 1'b0;
	muxed_orig_zcopy_mode_r <= 1'b0;
	muxed_rdc_num_r		<= 5'b0;
	muxed_pkt_type_r	<= 2'b0;
	muxed_noport_r		<= 1'b0;
	muxed_zcp_err_r		<= 1'b0;
end
else if (stage0_en)
begin
	muxed_cksum_err_r       <= muxed_cksum_err;
        muxed_bad_crc_r         <= muxed_bad_crc;
        muxed_ipp_pkt_id_r      <= muxed_ipp_pkt_id;
	muxed_pkt_len_r		<= muxed_pkt_len;
	muxed_l2_len_r		<= muxed_l2_len;
        muxed_drop_pkt_r     	<= muxed_ipp_drop_pkt | muxed_zcp_drop_pkt;
	muxed_mac_promis_r	<= muxed_mac_promis;
        muxed_s_event_r         <= muxed_s_event;
	muxed_fflp_hw_err_r	<= muxed_fflp_hw_err;
        muxed_zcopy_mode_r      <= muxed_zcopy_mode;
	muxed_orig_zcopy_mode_r <= muxed_orig_zcopy_mode;
        muxed_rdc_num_r         <= muxed_rdc_num;
	muxed_pkt_type_r	<= muxed_pkt_type;
	muxed_noport_r		<= muxed_noport;		
	muxed_zcp_err_r		<= muxed_zcp_err;
end

wire[2:0]  err_inc	= muxed_bad_crc_r     ? 3'b001 :
			  muxed_cksum_err_r   ? 3'b011 : 
			  muxed_fflp_hw_err_r ? 3'b100 : 
			  muxed_zcp_err_r     ? 3'b101 : 3'b000;
			 
wire[22:0] pkt_wrbk_data = {muxed_pkt_type_r, muxed_zcopy_mode_r, muxed_noport_r,  
			        muxed_mac_promis_r, err_inc, 1'b0, muxed_l2_len_r}; //23bits


/*************************/
//Pipeline Control
/*************************/
always @ (posedge clk)
if (reset)
        port_gnt_r1 <= 4'b0;
else if (rdmc_wr_req_accept_hdr)
        port_gnt_r1 <= port_gnt_r;
else
        port_gnt_r1 <= port_gnt_r1;

always @ (posedge clk)
if (reset)
	is_first_accept <= 1'b0;
else if (rdmc_wr_req_accept_hdr)
	is_first_accept <= 1'b1;
else if (ipp_data_req_p)
	is_first_accept <= 1'b0;
else
	is_first_accept <= is_first_accept;

always @ (posedge clk)
if (reset)
begin
        ipp_data_req_p_r  <= 1'b0;
	ipp_data_req_p_r1 <= 1'b0;
	ipp_data_req_p_r2 <= 1'b0;
end
else
begin
        ipp_data_req_p_r  <= ipp_data_req_p & is_first_accept;
	ipp_data_req_p_r1 <= ipp_data_req_p_r;
	ipp_data_req_p_r2 <= ipp_data_req_p_r1;
end

always @ (posedge clk)
if (reset)
begin   
	full_hdr_r1	<= 1'b0;
        zcopy_mode      <= 1'b0;
        jmb_pkt_type    <= 2'b0;
end
else if (rdmc_wr_req_accept_hdr)
begin
	full_hdr_r1	<= full_hdr_r;
	zcopy_mode 	<= muxed_zcopy_mode_r;
	jmb_pkt_type	<= pref_buf_used_num_r;
end
else
begin
	full_hdr_r1	<= full_hdr_r1;
	zcopy_mode	<= zcopy_mode;
	jmb_pkt_type	<= jmb_pkt_type;
end

always @ (posedge clk)
if (reset)
        port_gnt_r2 <= 4'b0;
else if (ipp_data_req_p_r2)
        port_gnt_r2 <= port_gnt_r1;
else if (drop_pkt_done)
	port_gnt_r2 <= drop_pkt_port_gnt;
else if (rdmc_cal_eop_r)
	port_gnt_r2 <= 4'b0;
else
        port_gnt_r2 <= port_gnt_r2;


always @ (posedge clk)
if (reset)
	zcp_wr_type	<= 2'b00;
else if (ipp_data_req_p_r2)
	zcp_wr_type	<= zcp_type[1:0];
else 
	zcp_wr_type     <= zcp_wr_type;

always @ (posedge clk)
if (reset)
	rdmc_wr_data_dma_num <= 5'b0;
else if (rdmc_wr_req_accept_hdr)
	rdmc_wr_data_dma_num <= rdmc_meta0_wr_req_dma_num_int;
else
	rdmc_wr_data_dma_num <= rdmc_wr_data_dma_num;

/**********************/
//ZCP Req and Data
/**********************/
assign zcp_req_cnt_done = muxed_orig_zcopy_mode ? zcp_req_cnt[2] : zcp_req_cnt[1];

always @ (posedge clk)
if (reset)
        zcp_req_cnt <= 3'b0;
else if (zcp_req_cnt_done)
        zcp_req_cnt <= 3'b0;
else if (stage0_en | (|zcp_req_cnt))
        zcp_req_cnt <= zcp_req_cnt + 3'd1;
else
        zcp_req_cnt <= zcp_req_cnt;

always @ (posedge clk)
if (reset)
        dmc_zcp_req0 <= 1'b0;
else if (stage0_en & port_gnt[0])
        dmc_zcp_req0 <= 1'b1;
else if (zcp_req_cnt_done)
        dmc_zcp_req0 <= 1'b0;
else
        dmc_zcp_req0 <= dmc_zcp_req0;

always @ (posedge clk)
if (reset)
        dmc_zcp_req1 <= 1'b0;
else if (stage0_en & port_gnt[1])
        dmc_zcp_req1 <= 1'b1;
else if (zcp_req_cnt_done)
        dmc_zcp_req1 <= 1'b0;
else
        dmc_zcp_req1 <= dmc_zcp_req1;

always @ (posedge clk)
if (reset)
        dmc_zcp_req2 <= 1'b0;
else if (stage0_en & port_gnt[2])
        dmc_zcp_req2 <= 1'b1;
else if (zcp_req_cnt_done)
        dmc_zcp_req2 <= 1'b0;
else
        dmc_zcp_req2 <= dmc_zcp_req2;

always @ (posedge clk)
if (reset)
        dmc_zcp_req3 <= 1'b0;
else if (stage0_en & port_gnt[3])
        dmc_zcp_req3 <= 1'b1;
else if (zcp_req_cnt_done)
        dmc_zcp_req3 <= 1'b0;
else
        dmc_zcp_req3 <= dmc_zcp_req3;

assign zcp_data_ack   = zcp_data_ack0 | zcp_data_ack1 | zcp_data_ack2 | zcp_data_ack3;
assign muxed_zcp_data = {128{port_gnt_r[0]}} & zcp_data0[127:0] |
                        {128{port_gnt_r[1]}} & zcp_data1[127:0] |
                        {128{port_gnt_r[2]}} & zcp_data2[127:0] |
                        {128{port_gnt_r[3]}} & zcp_data3[127:0] ;

assign muxed_zcp_data_eop = port_gnt_r[0] & zcp_data_ack0 & zcp_data0[129] |
                            port_gnt_r[1] & zcp_data_ack1 & zcp_data1[129] |
                            port_gnt_r[2] & zcp_data_ack2 & zcp_data2[129] |
                            port_gnt_r[3] & zcp_data_ack3 & zcp_data3[129] ;


always @ (posedge clk)
if (reset)
        zcp_ack_cnt <= 2'b0;
else if (zcp_data_ack)
        zcp_ack_cnt <= zcp_ack_cnt + 2'd1;
else
        zcp_ack_cnt <= 2'b0;

always @ (posedge clk)
if (reset)
        zcp_data_reg0 <= 128'b0;
else if (zcp_data_ack & (zcp_ack_cnt == 2'b00))
        zcp_data_reg0 <= muxed_zcp_data;
else
        zcp_data_reg0 <= zcp_data_reg0;

always @ (posedge clk)
if (reset)
        zcp_data_reg1 <= 32'b0;
else if (zcp_data_ack & (zcp_ack_cnt == 2'b01))
        zcp_data_reg1 <= muxed_zcp_data[127:96];
else
        zcp_data_reg1 <= zcp_data_reg1;


`ifdef NEPTUNE
always @ (posedge clk)
if (reset)
        zcp_data_reg1_lo <= 22'b0;
else if (zcp_data_ack & (zcp_ack_cnt == 2'b01))
        zcp_data_reg1_lo <= muxed_zcp_data[23:2];
else
        zcp_data_reg1_lo <= zcp_data_reg1_lo;


always @ (posedge clk)
if (reset)
        zcp_data_reg2 <= 128'b0;
else if (zcp_data_ack & (zcp_ack_cnt == 2'b10))
        zcp_data_reg2 <= muxed_zcp_data[127:0];
else
        zcp_data_reg2 <= zcp_data_reg2;

always @ (posedge clk)
if (reset)
        zcp_data_reg3 <= 128'b0;
else if (zcp_data_ack & (zcp_ack_cnt == 2'b11))
        zcp_data_reg3 <= muxed_zcp_data[127:0];
else
        zcp_data_reg3 <= zcp_data_reg3;

`else

assign zcp_data_reg2 	= 128'b0;
assign zcp_data_reg3 	= 128'b0;
assign zcp_data_reg1_lo = 22'b0;

`endif

/*********************************/
//one stage pipeline zcp read data
/*********************************/
always @ (posedge clk)
if (reset)
begin
	rdmc_wr_req_accept_hdr_r  <= 1'b0;
	rdmc_wr_req_accept_hdr_r1 <= 1'b0;
end
else
begin
	rdmc_wr_req_accept_hdr_r  <= rdmc_wr_req_accept_hdr;
	rdmc_wr_req_accept_hdr_r1 <= rdmc_wr_req_accept_hdr_r;
end

always @ (posedge clk)
if (reset)
	zcp_data_reg0_r <= 128'b0;
else if (rdmc_wr_req_accept_hdr_r1)
	zcp_data_reg0_r <= zcp_data_reg0;
else
	zcp_data_reg0_r <= zcp_data_reg0_r;

always @ (posedge clk)
if (reset)
        zcp_data_reg1_r <= 16'b0;
else if (rdmc_wr_req_accept_hdr_r1)
        zcp_data_reg1_r <= zcp_data_reg1[31:16];
else
        zcp_data_reg1_r <= zcp_data_reg1_r;


wire[7:0]       zcp_data_reg0_byte0     = zcp_data_reg0_r[127:120];
wire[7:0]       zcp_data_reg0_byte1     = zcp_data_reg0_r[119:112];
wire[7:0]       zcp_data_reg0_byte2     = zcp_data_reg0_r[111:104];
wire[7:0]       zcp_data_reg0_byte3     = zcp_data_reg0_r[103:96];
wire[7:0]       zcp_data_reg0_byte4     = zcp_data_reg0_r[95:88];
wire[7:0]       zcp_data_reg0_byte5     = zcp_data_reg0_r[87:80];
wire[7:0]       zcp_data_reg0_byte6     = zcp_data_reg0_r[79:72];
wire[7:0]       zcp_data_reg0_byte7     = zcp_data_reg0_r[71:64];
wire[7:0]       zcp_data_reg0_byte8     = zcp_data_reg0_r[63:56];
wire[7:0]       zcp_data_reg0_byte9     = zcp_data_reg0_r[55:48];
wire[7:0]       zcp_data_reg0_byte10    = zcp_data_reg0_r[47:40];
wire[7:0]       zcp_data_reg0_byte11    = zcp_data_reg0_r[39:32];
wire[7:0]       zcp_data_reg0_byte12    = zcp_data_reg0_r[31:24];
wire[7:0]       zcp_data_reg0_byte13    = zcp_data_reg0_r[23:16];
wire[7:0]       zcp_data_reg0_byte14    = zcp_data_reg0_r[15:8];
wire[7:0]       zcp_data_reg0_byte15    = zcp_data_reg0_r[7:0];

wire[7:0]       zcp_data_reg1_byte0     = zcp_data_reg1_r[15:8];
wire[7:0]       zcp_data_reg1_byte1     = zcp_data_reg1_r[7:0];
wire[7:0]       zcp_data_reg1_byte2     = zcp_data_reg1[15:8];
wire[7:0]       zcp_data_reg1_byte3     = zcp_data_reg1[7:0];

wire[7:0]       zcp_data_reg2_byte0     = zcp_data_reg2[127:120];
wire[7:0]       zcp_data_reg2_byte1     = zcp_data_reg2[119:112];
wire[7:0]       zcp_data_reg2_byte2     = zcp_data_reg2[111:104];
wire[7:0]       zcp_data_reg2_byte3     = zcp_data_reg2[103:96];
wire[7:0]       zcp_data_reg2_byte4     = zcp_data_reg2[95:88];
wire[7:0]       zcp_data_reg2_byte5     = zcp_data_reg2[87:80];
wire[7:0]       zcp_data_reg2_byte6     = zcp_data_reg2[79:72];
wire[7:0]       zcp_data_reg2_byte7     = zcp_data_reg2[71:64];
wire[7:0]       zcp_data_reg2_byte8     = zcp_data_reg2[63:56];
wire[7:0]       zcp_data_reg2_byte9     = zcp_data_reg2[55:48];
wire[7:0]       zcp_data_reg2_byte10    = zcp_data_reg2[47:40];
wire[7:0]       zcp_data_reg2_byte11    = zcp_data_reg2[39:32];
wire[7:0]       zcp_data_reg2_byte12    = zcp_data_reg2[31:24];
wire[7:0]       zcp_data_reg2_byte13    = zcp_data_reg2[23:16];
wire[7:0]       zcp_data_reg2_byte14    = zcp_data_reg2[15:8];
wire[7:0]       zcp_data_reg2_byte15    = zcp_data_reg2[7:0];

wire[7:0]       zcp_data_reg3_byte0     = zcp_data_reg3[127:120];
wire[7:0]       zcp_data_reg3_byte1     = zcp_data_reg3[119:112];
wire[7:0]       zcp_data_reg3_byte2     = zcp_data_reg3[111:104];
wire[7:0]       zcp_data_reg3_byte3     = zcp_data_reg3[103:96];
wire[7:0]       zcp_data_reg3_byte4     = zcp_data_reg3[95:88];
wire[7:0]       zcp_data_reg3_byte5     = zcp_data_reg3[87:80];
wire[7:0]       zcp_data_reg3_byte6     = zcp_data_reg3[79:72];
wire[7:0]       zcp_data_reg3_byte7     = zcp_data_reg3[71:64];
wire[7:0]       zcp_data_reg3_byte8     = zcp_data_reg3[63:56];
wire[7:0]       zcp_data_reg3_byte9     = zcp_data_reg3[55:48];
wire[7:0]       zcp_data_reg3_byte10    = zcp_data_reg3[47:40];
wire[7:0]       zcp_data_reg3_byte11    = zcp_data_reg3[39:32];
wire[7:0]       zcp_data_reg3_byte12    = zcp_data_reg3[31:24];
wire[7:0]       zcp_data_reg3_byte13    = zcp_data_reg3[23:16];
wire[7:0]       zcp_data_reg3_byte14    = zcp_data_reg3[15:8];
wire[7:0]       zcp_data_reg3_byte15    = zcp_data_reg3[7:0];

assign zcp_rdc_num      = zcp_data_reg1_byte3[4:0];
assign zcp_type         = zcp_data_reg1_byte3[6:5];
assign zcp_pkt_id       = zcp_data_reg1_byte2[5:2];

assign zcp_vaddr0_tmp   = {zcp_data_reg2_byte0[3:0], zcp_data_reg2_byte1, zcp_data_reg2_byte2,
                           zcp_data_reg2_byte3,      zcp_data_reg2_byte4, zcp_data_reg2_byte5};
assign zcp_len0         = {zcp_data_reg2_byte6[5:0], zcp_data_reg2_byte7};

assign zcp_vaddr1_tmp   = {zcp_data_reg2_byte8[3:0], zcp_data_reg2_byte9,  zcp_data_reg2_byte10,
                           zcp_data_reg2_byte11,     zcp_data_reg2_byte12, zcp_data_reg2_byte13};
assign zcp_len1         = {zcp_data_reg2_byte14[5:0],zcp_data_reg2_byte15};

assign zcp_vaddr2_tmp   = {zcp_data_reg3_byte0[3:0], zcp_data_reg3_byte1, zcp_data_reg3_byte2,
                           zcp_data_reg3_byte3,      zcp_data_reg3_byte4, zcp_data_reg3_byte5};
assign zcp_len2         = {zcp_data_reg3_byte6[5:0], zcp_data_reg3_byte7};

assign zcp_vaddr3_tmp   = {zcp_data_reg3_byte8[3:0], zcp_data_reg3_byte9,  zcp_data_reg3_byte10,
                           zcp_data_reg3_byte11,     zcp_data_reg3_byte12, zcp_data_reg3_byte13};
assign zcp_len3         = {zcp_data_reg3_byte14[5:0],zcp_data_reg3_byte15};

assign zcp_vaddr0       = {zcp_data_reg1_lo[21:2], zcp_vaddr0_tmp[43:0]};
assign zcp_vaddr1       = {zcp_data_reg1_lo[21:2], zcp_vaddr1_tmp[43:0]};
assign zcp_vaddr2       = {zcp_data_reg1_lo[21:2], zcp_vaddr2_tmp[43:0]};
assign zcp_vaddr3       = {zcp_data_reg1_lo[21:2], zcp_vaddr3_tmp[43:0]};

assign zcp_func_num	= zcp_data_reg1_lo[1:0];


/********************/
//IPP Req and Data
/********************/

/********************/
//Drop Packet Logic
/********************/
assign drop_pkt_len_leftover 	= |muxed_l2_len_r[3:0];
assign drop_pkt_word_cnt_tmp 	= drop_pkt_len_leftover ? muxed_l2_len_r[13:4] : (muxed_l2_len_r[13:4] - 10'd1);
assign drop_pkt_done		= drop_pkt_en & (drop_pkt_word_cnt == 10'b0);

always @ (posedge clk)
if (reset)
	drop_pkt_word_cnt <= 10'b0;
else if (drop_pkt_en_sm)
	drop_pkt_word_cnt <= drop_pkt_word_cnt_tmp;
else if (drop_pkt_en & !drop_pkt_done)
	drop_pkt_word_cnt <= drop_pkt_word_cnt - 10'd1;
else
	drop_pkt_word_cnt <= drop_pkt_word_cnt;

always @ (posedge clk)
if (reset)
	drop_pkt_en_dly <= 4'b0;
else
	drop_pkt_en_dly <= {4{drop_pkt_en}} & drop_pkt_port_gnt;


/*********************/
/*********************/
assign is_zcp_wr_req		= is_zcp0_wr_req | is_zcp1_wr_req | is_zcp2_wr_req | is_zcp3_wr_req;

assign rdmc_wr_req_accept_zcp   = rdmc_wr_req_accept_zcp0 | rdmc_wr_req_accept_zcp1 |
                                  rdmc_wr_req_accept_zcp2 | rdmc_wr_req_accept_zcp3;
 
assign rdmc_wr_req_accept_all   = rdmc_wr_req_accept_hdr | rdmc_wr_req_accept_zcp | 
				  rdmc_wr_req_accept_jmb;

assign rdmc_wr_req_accept_data  = rdmc_wr_req_accept_zcp | rdmc_wr_req_accept_jmb; 


assign zcp_data_len		= is_zcp0_wr_req ? zcp_len0 :
				  is_zcp1_wr_req ? zcp_len1 :
				  is_zcp2_wr_req ? zcp_len2 :
				                   zcp_len3 ;

assign zcp_has_ipp_data_req	= (|zcp_data_len[13:4]) | (zcp_data_len[3:0] > next_data_offset_reg[3:0]);
assign new_zcp_data_len_tmp	= zcp_data_len - {10'b0, next_data_offset_reg};
assign new_zcp_data_len 	= zcp_has_ipp_data_req ? new_zcp_data_len_tmp : 14'b0;

assign ipp_pkt_len		= is_zcp_wr_req ? new_zcp_data_len_r : muxed_pkt_len_r;

assign ipp_pkt_len_left_over	= |ipp_pkt_len[3:0]; 

assign ipp_pkt_len_word_cnt_tmp	= ipp_pkt_len_left_over ? ({1'b0, ipp_pkt_len[13:4]} + 11'd1) : {1'b0, ipp_pkt_len[13:4]};
assign rdmc_wr_data_req_p	= full_hdr_r1 & is_first_accept & rdmc_wr_data_req & !rdmc_wr_data_req_dly;
assign rdmc_wr_data_req_mod	= rdmc_wr_data_req & !rdmc_wr_data_req_p;
assign ipp_data_req_en		= rdmc_wr_data_req_mod & (|ipp_pkt_len_word_cnt);

always @ (posedge clk)
if (reset)
	rdmc_wr_data_req_dly <= 1'b0;
else
	rdmc_wr_data_req_dly <= rdmc_wr_data_req;

always @ (posedge clk)
if (reset)
	new_zcp_data_len_r <= 14'b0;
else
	new_zcp_data_len_r <= new_zcp_data_len;


always @ (posedge clk)
if (reset)
	ipp_pkt_len_word_cnt <= 11'b0;
else if (rdmc_wr_req_accept_zcp | rdmc_wr_req_accept_hdr)
	ipp_pkt_len_word_cnt <= ipp_pkt_len_word_cnt_tmp;
else if (ipp_data_req_en)
	ipp_pkt_len_word_cnt <= ipp_pkt_len_word_cnt - 11'd1;
else
	ipp_pkt_len_word_cnt <= ipp_pkt_len_word_cnt;


wire	ipp_data_req_en1 = ipp_data_req_en | drop_pad_data;

always @ (posedge clk)
if (reset)
begin
	ipp_dat_req0_data <= 1'b0;
	ipp_dat_req1_data <= 1'b0;
	ipp_dat_req2_data <= 1'b0;
	ipp_dat_req3_data <= 1'b0;
end
else
begin
        ipp_dat_req0_data <= ipp_data_req_en1 & port_gnt_r1[0] | drop_pkt_en & drop_pkt_port_gnt[0];
        ipp_dat_req1_data <= ipp_data_req_en1 & port_gnt_r1[1] | drop_pkt_en & drop_pkt_port_gnt[1];
        ipp_dat_req2_data <= ipp_data_req_en1 & port_gnt_r1[2] | drop_pkt_en & drop_pkt_port_gnt[2];
        ipp_dat_req3_data <= ipp_data_req_en1 & port_gnt_r1[3] | drop_pkt_en & drop_pkt_port_gnt[3];
end

always @ (posedge clk)
if (reset)
begin
	dmc_ipp_dat_req0 <= 1'b0;
	dmc_ipp_dat_req1 <= 1'b0;
	dmc_ipp_dat_req2 <= 1'b0;
	dmc_ipp_dat_req3 <= 1'b0;
	rdmc_wr_data_req <= 1'b0;
end
else
begin
	dmc_ipp_dat_req0 <= stage0_en & port_gnt[0] | ipp_data_req_en1 & port_gnt_r1[0] | drop_pkt_en & drop_pkt_port_gnt[0];
	dmc_ipp_dat_req1 <= stage0_en & port_gnt[1] | ipp_data_req_en1 & port_gnt_r1[1] | drop_pkt_en & drop_pkt_port_gnt[1];
	dmc_ipp_dat_req2 <= stage0_en & port_gnt[2] | ipp_data_req_en1 & port_gnt_r1[2] | drop_pkt_en & drop_pkt_port_gnt[2];
	dmc_ipp_dat_req3 <= stage0_en & port_gnt[3] | ipp_data_req_en1 & port_gnt_r1[3] | drop_pkt_en & drop_pkt_port_gnt[3];
	rdmc_wr_data_req <= meta0_rdmc_wr_data_req;
end

always @ (posedge clk)
if (reset)
        stage0_en_r <= 1'b0;
else
        stage0_en_r <= stage0_en;

always @ (posedge clk)
if (reset)
        drop_pad_data_r <= 1'b0;
else
        drop_pad_data_r <= drop_pad_data;

assign ipp_data_req_maskout = {4{stage0_en_r}} & port_gnt | drop_pkt_en_dly | {4{drop_pad_data_r}} & port_gnt_r1;

always @ (posedge clk)
if (reset)
begin
        ipp_data_req0_dly <= 1'b0;
        ipp_data_req1_dly <= 1'b0;
        ipp_data_req2_dly <= 1'b0;
        ipp_data_req3_dly <= 1'b0;
end
else
begin
        ipp_data_req0_dly <= dmc_ipp_dat_req0 & !ipp_data_req_maskout[0];
        ipp_data_req1_dly <= dmc_ipp_dat_req1 & !ipp_data_req_maskout[1];
        ipp_data_req2_dly <= dmc_ipp_dat_req2 & !ipp_data_req_maskout[2];
        ipp_data_req3_dly <= dmc_ipp_dat_req3 & !ipp_data_req_maskout[3];
end

assign ipp_data_req0_p  = dmc_ipp_dat_req0 & !ipp_data_req0_dly & !ipp_data_req_maskout[0]; 
assign ipp_data_req1_p  = dmc_ipp_dat_req1 & !ipp_data_req1_dly & !ipp_data_req_maskout[1];
assign ipp_data_req2_p  = dmc_ipp_dat_req2 & !ipp_data_req2_dly & !ipp_data_req_maskout[2];
assign ipp_data_req3_p  = dmc_ipp_dat_req3 & !ipp_data_req3_dly & !ipp_data_req_maskout[3];

assign ipp_data_req_p   = ipp_data_req0_p | ipp_data_req1_p | ipp_data_req2_p | ipp_data_req3_p;
assign ipp_data_req_dly = ipp_data_req0_dly | ipp_data_req1_dly | ipp_data_req2_dly | ipp_data_req3_dly;


assign muxed_ipp_data = {128{port_gnt_r2[0] & ipp_data_ack0}} & ipp_data0[127:0] |
			{128{port_gnt_r2[1] & ipp_data_ack1}} & ipp_data1[127:0] |
			{128{port_gnt_r2[2] & ipp_data_ack2}} & ipp_data2[127:0] |
			{128{port_gnt_r2[3] & ipp_data_ack3}} & ipp_data3[127:0] ;

assign muxed_ipp_data_eop  = port_gnt_r2[0] & ipp_data_ack0 & ipp_data0[129] | 
			     port_gnt_r2[1] & ipp_data_ack1 & ipp_data1[129] |
			     port_gnt_r2[2] & ipp_data_ack2 & ipp_data2[129] | 
			     port_gnt_r2[3] & ipp_data_ack3 & ipp_data3[129];

assign muxed_ipp_data_ack  = port_gnt_r2[0] & ipp_data_ack0 | 
			     port_gnt_r2[1] & ipp_data_ack1 | 
			     port_gnt_r2[2] & ipp_data_ack2 | 
			     port_gnt_r2[3] & ipp_data_ack3;

assign ipp_data_req_in 	   = dmc_ipp_dat_req0 & !ipp_data_req_maskout[0] |
			     dmc_ipp_dat_req1 & !ipp_data_req_maskout[1] |
			     dmc_ipp_dat_req2 & !ipp_data_req_maskout[2] |
			     dmc_ipp_dat_req3 & !ipp_data_req_maskout[3];

assign ipp_fzcp_eop_in     = !(|ipp_pkt_len_word_cnt) & ipp_data_req_in;

assign ipp_next_eop	   = !(|ipp_pkt_len[13:0]);	//at accept cycle  

always @ (posedge clk)
if (reset)
begin
        ipp_data_req_dly1 <= 1'b0;
        ipp_data_req_dly2 <= 1'b0;
end
else
begin
	ipp_data_req_dly1 <= ipp_data_req_dly;
	ipp_data_req_dly2 <= ipp_data_req_dly1;
end

always @ (posedge clk)
if (reset)
begin
        ipp_fzcp_eop_tmp  <= 1'b0;
        ipp_fzcp_eop_tmp1 <= 1'b0;
        ipp_fzcp_eop_tmp2 <= 1'b0;
        ipp_fzcp_eop      <= 1'b0;
end
else
begin
	ipp_fzcp_eop_tmp  <= ipp_fzcp_eop_in;
	ipp_fzcp_eop_tmp1 <= ipp_fzcp_eop_tmp;
	ipp_fzcp_eop_tmp2 <= ipp_fzcp_eop_tmp1;
	ipp_fzcp_eop	  <= ipp_fzcp_eop_tmp2;
end

/**************************************************************/
//rdmc req counter in 16byte, this is used to generate pkt done
/**************************************************************/
assign pkt_len_left_over    = |pkt_trans_len_r[3:0];
assign pkt_len_word_cnt_tmp = pkt_len_left_over ? pkt_trans_len_r[13:4] : (pkt_trans_len_r[13:4] - 10'd1);  
assign pkt_req_cnt_done_tmp = (data_req_cnt == pkt_len_word_cnt) & rdmc_wr_data_req;

assign pkt_req_cnt_e_done_mod = pkt_req_cnt_e_done_r & jmb_wr_cycle_sm;

always @ (posedge clk)
if (reset)
        pkt_len_word_cnt <= 10'd0;
else if (rdmc_wr_req_accept_all)
        pkt_len_word_cnt <= pkt_len_word_cnt_tmp;
else
        pkt_len_word_cnt <= pkt_len_word_cnt;

always @ (posedge clk)
if (reset)
	data_req_cnt <= 10'd0;
else if (pkt_req_cnt_done_tmp)
	data_req_cnt <= 10'd0;
else if (rdmc_wr_data_req)
	data_req_cnt <= data_req_cnt + 10'd1;
else 	
	data_req_cnt <= data_req_cnt;

always @ (posedge clk)
if (reset)
begin
	pkt_req_cnt_pre_done	<= 1'b0;
	pkt_req_cnt_done	<= 1'b0;
	pkt_req_cnt_done_r	<= 1'b0;
	pkt_req_cnt_done_r1	<= 1'b0;
	pkt_req_cnt_done_r2	<= 1'b0;
	pkt_req_cnt_e_done_r	<= 1'b0;
end
else
begin
	pkt_req_cnt_pre_done	<= pkt_req_cnt_done_tmp;
	pkt_req_cnt_done	<= pkt_req_cnt_pre_done;
	pkt_req_cnt_done_r	<= pkt_req_cnt_done;
	pkt_req_cnt_done_r1	<= pkt_req_cnt_done_r;
	pkt_req_cnt_done_r2	<= pkt_req_cnt_done_r1;
	pkt_req_cnt_e_done_r	<= pkt_req_cnt_done_tmp; //same as pkt_req_cnt_pre_done after added 2 cycles delay of ipp ack
end

always @ (posedge clk)
if (reset)
        wr_len_last_bits <= 4'b0;
else if (rdmc_wr_req_accept_all)
        wr_len_last_bits <= pkt_trans_len_r[3:0];
else
        wr_len_last_bits <= wr_len_last_bits;

always @ (posedge clk)
if (reset)
        wr_len_last_bits_r <= 4'b0;
else if (ipp_data_req_p_r2)
        wr_len_last_bits_r <= wr_len_last_bits[3:0];
else if (rdmc_wr_req_accept_data)
	wr_len_last_bits_r <= pkt_trans_len_r[3:0]; //for jumbo pkt and zcp pkt
else
        wr_len_last_bits_r <= wr_len_last_bits_r;


always @ (wr_len_last_bits_r)
case (wr_len_last_bits_r)	//synopsys parallel_case full_case

4'd0:   wr_data_byte_dec = 16'b1111_1111_1111_1111;
4'd1:   wr_data_byte_dec = 16'b0000_0000_0000_0001;
4'd2:   wr_data_byte_dec = 16'b0000_0000_0000_0011;
4'd3:   wr_data_byte_dec = 16'b0000_0000_0000_0111;
4'd4:   wr_data_byte_dec = 16'b0000_0000_0000_1111;
4'd5:   wr_data_byte_dec = 16'b0000_0000_0001_1111;
4'd6:   wr_data_byte_dec = 16'b0000_0000_0011_1111;
4'd7:   wr_data_byte_dec = 16'b0000_0000_0111_1111;
4'd8:   wr_data_byte_dec = 16'b0000_0000_1111_1111;
4'd9:   wr_data_byte_dec = 16'b0000_0001_1111_1111;
4'd10:  wr_data_byte_dec = 16'b0000_0011_1111_1111;
4'd11:  wr_data_byte_dec = 16'b0000_0111_1111_1111;
4'd12:  wr_data_byte_dec = 16'b0000_1111_1111_1111;
4'd13:  wr_data_byte_dec = 16'b0001_1111_1111_1111;
4'd14:  wr_data_byte_dec = 16'b0011_1111_1111_1111;
4'd15:  wr_data_byte_dec = 16'b0111_1111_1111_1111;
default:wr_data_byte_dec = 16'b0;

endcase

assign wr_data_byte_en = rdmc_wr_data_comp_sm ? wr_data_byte_dec : 16'hffff;

/************************************/
//Packet Alignement
/************************************/
assign next_data_offset_tmp1	= (~ipp_pkt_len[3:0]) + 4'd1;
assign next_data_offset_tmp2	= next_data_offset_reg - ipp_pkt_len[3:0];
assign next_data_offset_tmp	= zcp_has_ipp_data_req ? next_data_offset_tmp1 : next_data_offset_tmp2;

always @ (posedge clk)
if (reset)
	next_data_offset_reg <= 4'b0;
else if (rdmc_wr_req_accept_all)
	next_data_offset_reg <= next_data_offset_tmp;
else
	next_data_offset_reg <= next_data_offset_reg; 

always @ (posedge clk)
if (reset)
	data_offset_reg <= 4'd0;
else if (offset_reg_en & (offset_sel == 2'b00))
	data_offset_reg <= 4'd2;
else if (offset_reg_en)
	data_offset_reg <= next_data_offset_reg;
else
	data_offset_reg <= data_offset_reg;


always @ (data_offset_reg or data_save_reg)
case (data_offset_reg)          //synopsys parallel_case full_case

4'd0:   save_reg_trans = data_save_reg[127:0];
4'd1:   save_reg_trans = {data_save_reg[7:0],   120'b0};
4'd2:   save_reg_trans = {data_save_reg[15:0],  112'b0};
4'd3:   save_reg_trans = {data_save_reg[23:0],  104'b0};
4'd4:   save_reg_trans = {data_save_reg[31:0],  96'b0};
4'd5:   save_reg_trans = {data_save_reg[39:0],  88'b0};
4'd6:   save_reg_trans = {data_save_reg[47:0],  80'b0};
4'd7:   save_reg_trans = {data_save_reg[55:0],  72'b0};
4'd8:   save_reg_trans = {data_save_reg[63:0],  64'b0};
4'd9:   save_reg_trans = {data_save_reg[71:0],  56'b0};
4'd10:  save_reg_trans = {data_save_reg[79:0],  48'b0};
4'd11:  save_reg_trans = {data_save_reg[87:0],  40'b0};
4'd12:  save_reg_trans = {data_save_reg[95:0],  32'b0};
4'd13:  save_reg_trans = {data_save_reg[103:0], 24'b0};
4'd14:  save_reg_trans = {data_save_reg[111:0], 16'b0};
4'd15:  save_reg_trans = {data_save_reg[119:0], 8'b0};

endcase

always @ (posedge clk)
if (reset)
        date_save_reg_trans <= 128'b0;
else
        date_save_reg_trans <= save_reg_trans;

wire[119:0]	data_last_save = muxed_ipp_data_ack  ? muxed_ipp_data[127:8] : date_save_reg_trans[127:8];
wire[3:0]	data_offset_in = offset_reg_en ? next_data_offset_reg[3:0] : data_offset_reg[3:0];

always @ (data_offset_in[3:0] or data_last_save)
case (data_offset_in[3:0])		//synopsys parallel_case full_case

4'd0: 	data_save_reg_tmp = 128'b0;
4'd1: 	data_save_reg_tmp = {120'b0, data_last_save[119:112]};
4'd2: 	data_save_reg_tmp = {112'b0, data_last_save[119:104]};
4'd3: 	data_save_reg_tmp = {104'b0, data_last_save[119:96]};
4'd4: 	data_save_reg_tmp = {96'b0,  data_last_save[119:88]};
4'd5: 	data_save_reg_tmp = {88'b0,  data_last_save[119:80]};
4'd6: 	data_save_reg_tmp = {80'b0,  data_last_save[119:72]};
4'd7: 	data_save_reg_tmp = {72'b0,  data_last_save[119:64]};
4'd8: 	data_save_reg_tmp = {64'b0,  data_last_save[119:56]};
4'd9: 	data_save_reg_tmp = {56'b0,  data_last_save[119:48]};
4'd10:	data_save_reg_tmp = {48'b0,  data_last_save[119:40]};
4'd11:	data_save_reg_tmp = {40'b0,  data_last_save[119:32]};
4'd12:	data_save_reg_tmp = {32'b0,  data_last_save[119:24]};
4'd13:	data_save_reg_tmp = {24'b0,  data_last_save[119:16]};
4'd14:	data_save_reg_tmp = {16'b0,  data_last_save[119:8]};
4'd15:	data_save_reg_tmp = {8'b0,   data_last_save[119:0]};
endcase


always @ (posedge clk)
if (reset)
        data_save_reg <= 128'b0;
else if (rdmc_wr_data_valid_sm)
        data_save_reg <= data_save_reg_tmp;
else
        data_save_reg <= data_save_reg;


always @ (data_offset_reg or muxed_ipp_data or data_save_reg)
case (data_offset_reg)		//synopsys parallel_case full_case

4'd0:   rdmc_wr_data_tmp = {muxed_ipp_data[127:0]};
4'd1:   rdmc_wr_data_tmp = {muxed_ipp_data[119:0], data_save_reg[7:0]};
4'd2:   rdmc_wr_data_tmp = {muxed_ipp_data[111:0], data_save_reg[15:0]};
4'd3:   rdmc_wr_data_tmp = {muxed_ipp_data[103:0], data_save_reg[23:0]};
4'd4:   rdmc_wr_data_tmp = {muxed_ipp_data[95:0],  data_save_reg[31:0]};
4'd5:   rdmc_wr_data_tmp = {muxed_ipp_data[87:0],  data_save_reg[39:0]};
4'd6:   rdmc_wr_data_tmp = {muxed_ipp_data[79:0],  data_save_reg[47:0]};
4'd7:   rdmc_wr_data_tmp = {muxed_ipp_data[71:0],  data_save_reg[55:0]};
4'd8:   rdmc_wr_data_tmp = {muxed_ipp_data[63:0],  data_save_reg[63:0]};
4'd9:   rdmc_wr_data_tmp = {muxed_ipp_data[55:0],  data_save_reg[71:0]};
4'd10:  rdmc_wr_data_tmp = {muxed_ipp_data[47:0],  data_save_reg[79:0]};
4'd11:  rdmc_wr_data_tmp = {muxed_ipp_data[39:0],  data_save_reg[87:0]};
4'd12:  rdmc_wr_data_tmp = {muxed_ipp_data[31:0],  data_save_reg[95:0]};
4'd13:  rdmc_wr_data_tmp = {muxed_ipp_data[23:0],  data_save_reg[103:0]};
4'd14:  rdmc_wr_data_tmp = {muxed_ipp_data[15:0],  data_save_reg[111:0]};
4'd15:  rdmc_wr_data_tmp = {muxed_ipp_data[7:0],   data_save_reg[119:0]};

endcase


wire[127:0] hdr_data1	= {muxed_ipp_data[111:0], zcp_data_reg0_byte1,  zcp_data_reg0_byte0};
wire[127:0] hdr_data2	= {zcp_data_reg1_byte1,   zcp_data_reg1_byte0,  zcp_data_reg0_byte15, zcp_data_reg0_byte14,
			   zcp_data_reg0_byte13,  zcp_data_reg0_byte12, zcp_data_reg0_byte11, zcp_data_reg0_byte10,
			   zcp_data_reg0_byte9,   zcp_data_reg0_byte8,  zcp_data_reg0_byte7,  zcp_data_reg0_byte6,
			   zcp_data_reg0_byte5,   zcp_data_reg0_byte4,  zcp_data_reg0_byte3,  zcp_data_reg0_byte2};

wire[127:0] rdmc_wr_data_in = (rdmc_wr_data_sel == 2'b00) ? hdr_data2 :
		  	      (rdmc_wr_data_sel == 2'b01) ? hdr_data1 : rdmc_wr_data_tmp;


/****************************/
//ECC ERROR
/****************************/
wire[3:0] ipp_data_err = {ipp_data_err3, ipp_data_err2, ipp_data_err1, ipp_data_err0};
wire[3:0] zcp_data_err = {zcp_data_err3, zcp_data_err2, zcp_data_err1, zcp_data_err0};

wire[3:0] ipp_ack_array= {ipp_data_ack3, ipp_data_ack2, ipp_data_ack1, ipp_data_ack0};
wire[3:0] zcp_ack_array= {zcp_data_ack3, zcp_data_ack2, zcp_data_ack1, zcp_data_ack0};

wire	muxed_ipp_ctrl_err	= |(port_gnt    & ipp_ack_array & ipp_data_err); //first read
wire	muxed_zcp_data_err	= |(port_gnt_r  & zcp_ack_array & zcp_data_err); //control phase
assign	muxed_ipp_data_err	= |(port_gnt_r2 & ipp_ack_array & ipp_data_err); //data phase

always @ (posedge clk)
if (reset)
	wait_drop_pkt_eop <= 1'b0;
else if (drop_pkt_done)
	wait_drop_pkt_eop <= 1'b1;
else if (rdmc_cal_eop_r)
	wait_drop_pkt_eop <= 1'b0;
else
	wait_drop_pkt_eop <= wait_drop_pkt_eop;

always @ (posedge clk)
if (reset)
	muxed_data_err <= 1'b0;
else if (muxed_ipp_ctrl_err)
	muxed_data_err <= 1'b1;
else if (rdmc_wr_req_accept_hdr | wait_drop_pkt_eop)
	muxed_data_err <= 1'b0;
else
	muxed_data_err <= muxed_data_err;

always @ (posedge clk)
if (reset)
        muxed_data_err_r1 <= 1'b0;
else if (rdmc_wr_req_accept_hdr & muxed_data_err | muxed_zcp_data_err | (|port_zcp_eop_err))
        muxed_data_err_r1 <= 1'b1;
else if (ipp_data_req_p_r2 | wait_drop_pkt_eop)
        muxed_data_err_r1 <= 1'b0;
else
	muxed_data_err_r1 <= muxed_data_err_r1;


always @ (posedge clk)
if (reset)
        muxed_data_err_r2 <= 1'b0;
else if (ipp_data_req_p_r1)
	muxed_data_err_r2 <= 1'b0;
else if (muxed_ipp_data_err & !wr_idle_state | ipp_data_req_p_r2 & muxed_data_err_r1 | (|port_ipp_eop_err))
	muxed_data_err_r2 <= 1'b1;
else if (rdmc_wr_last_comp | wait_drop_pkt_eop)
        muxed_data_err_r2 <= 1'b0;
else
        muxed_data_err_r2 <= muxed_data_err_r2;


/**********************************************/
//calculate eop & sop 
/**********************************************/
wire	muxed_ipp_data_req	= dmc_ipp_dat_req0 & (port_gnt_r1[0] | drop_pkt_en_dly[0]) | 
				  dmc_ipp_dat_req1 & (port_gnt_r1[1] | drop_pkt_en_dly[1]) |
				  dmc_ipp_dat_req2 & (port_gnt_r1[2] | drop_pkt_en_dly[2]) |
				  dmc_ipp_dat_req3 & (port_gnt_r1[3] | drop_pkt_en_dly[3]);
wire	rdmc_eop_cnt_done 	= muxed_ipp_data_req & (rdmc_eop_cnt == 10'b0);
wire	rdmc_eop_for_padding	= rdmc_eop_cnt_done;

always @ (posedge clk)
if (reset)
	rdmc_eop_cnt <= 10'b11_1111_1111;
else if (rdmc_wr_req_accept_hdr | drop_pkt_en_sm)
	rdmc_eop_cnt <= drop_pkt_word_cnt_tmp[9:0];
else if (muxed_ipp_data_req & (|rdmc_eop_cnt))
	rdmc_eop_cnt <= rdmc_eop_cnt - 10'd1;
else if (rdmc_eop_cnt_done)
	rdmc_eop_cnt <= 10'b11_1111_1111;
else
	rdmc_eop_cnt <= rdmc_eop_cnt;

always @ (posedge clk)
if (reset)
begin
	rdmc_cal_eop_tmp	<= 1'b0;
	rdmc_cal_eop_tmp1	<= 1'b0;
	rdmc_cal_eop 		<= 1'b0;
	rdmc_cal_eop_r 		<= 1'b0;
end
else
begin
	rdmc_cal_eop_tmp	<= rdmc_eop_cnt_done;
	rdmc_cal_eop_tmp1  	<= rdmc_cal_eop_tmp;
	rdmc_cal_eop		<= rdmc_cal_eop_tmp1;
	rdmc_cal_eop_r 		<= rdmc_cal_eop;
end


always @ (posedge clk)
if (reset)
	muxed_orig_zcopy_mode_r1 <= 1'b0;
else if (zcp_req_cnt_done)
	muxed_orig_zcopy_mode_r1 <= muxed_orig_zcopy_mode_r;
else
	muxed_orig_zcopy_mode_r1 <= muxed_orig_zcopy_mode_r1;

wire	rdmc_cal_zcp_eop	= muxed_orig_zcopy_mode_r1 ? zcp_data_ack & (zcp_ack_cnt == 2'b11) :
							     zcp_data_ack & (zcp_ack_cnt == 2'b01);

/*******************/
//Port Error
/*******************/
always @ (posedge clk)
if (reset)
	zcp_second_data_ack_dly <= 1'b0;
else if (zcp_data_ack & (zcp_ack_cnt == 2'b01))
	zcp_second_data_ack_dly <= 1'b1;
else
	zcp_second_data_ack_dly <= 1'b0;
	
wire	pkt_id_err  = !(zcp_pkt_id == muxed_ipp_pkt_id_r) & zcp_second_data_ack_dly;
wire	ipp_eop_err = !(rdmc_cal_eop_r == muxed_ipp_data_eop);
wire	zcp_eop_err = !(rdmc_cal_zcp_eop == muxed_zcp_data_eop);

assign	port_ipp_eop_err = {4{ipp_eop_err}} & port_gnt_r2;
assign	port_zcp_eop_err = {4{zcp_eop_err}} & port_gnt_r;
assign	port_err_event	 = {pkt_id_err, port_zcp_eop_err, port_ipp_eop_err};


/**********************/
//SOP calculation
/**********************/
always @ (posedge clk)
if (reset)
	zcp_sop_reg0 <= 1'b1;
else if (stage0_en_r & port_gnt[0])
	zcp_sop_reg0 <= 1'b0;
else if (rdmc_cal_zcp_eop & port_gnt_r[0])
	zcp_sop_reg0 <= 1'b1;
else
	zcp_sop_reg0 <= zcp_sop_reg0;


always @ (posedge clk)
if (reset)
        zcp_sop_reg1 <= 1'b1;
else if (stage0_en_r & port_gnt[1])
        zcp_sop_reg1 <= 1'b0;
else if (rdmc_cal_zcp_eop & port_gnt_r[1])
        zcp_sop_reg1 <= 1'b1;
else
        zcp_sop_reg1 <= zcp_sop_reg1;

always @ (posedge clk)
if (reset)
        zcp_sop_reg2 <= 1'b1;
else if (stage0_en_r & port_gnt[2])
        zcp_sop_reg2 <= 1'b0;
else if (rdmc_cal_zcp_eop & port_gnt_r[2])
        zcp_sop_reg2 <= 1'b1;
else
        zcp_sop_reg2 <= zcp_sop_reg2;

always @ (posedge clk)
if (reset)
        zcp_sop_reg3 <= 1'b1;
else if (stage0_en_r & port_gnt[3])
        zcp_sop_reg3 <= 1'b0;
else if (rdmc_cal_zcp_eop & port_gnt_r[3])
        zcp_sop_reg3 <= 1'b1;
else
        zcp_sop_reg3 <= zcp_sop_reg3;


always @ (posedge clk)
if (reset)
        ipp_sop_reg0 <= 1'b1;
else if (stage0_en_r & port_gnt[0])
        ipp_sop_reg0 <= 1'b0;
else if (rdmc_cal_eop_r & port_gnt_r2[0])
        ipp_sop_reg0 <= 1'b1;
else
        ipp_sop_reg0 <= ipp_sop_reg0;

always @ (posedge clk)
if (reset)
        ipp_sop_reg1 <= 1'b1;
else if (stage0_en_r & port_gnt[1])
        ipp_sop_reg1 <= 1'b0;
else if (rdmc_cal_eop_r & port_gnt_r2[1])
        ipp_sop_reg1 <= 1'b1;
else
        ipp_sop_reg1 <= ipp_sop_reg1;

always @ (posedge clk)
if (reset)
        ipp_sop_reg2 <= 1'b1;
else if (stage0_en_r & port_gnt[2])
        ipp_sop_reg2 <= 1'b0;
else if (rdmc_cal_eop_r & port_gnt_r2[2])
        ipp_sop_reg2 <= 1'b1;
else
        ipp_sop_reg2 <= ipp_sop_reg2;

always @ (posedge clk)
if (reset)
        ipp_sop_reg3 <= 1'b1;
else if (stage0_en_r & port_gnt[3])
        ipp_sop_reg3 <= 1'b0;
else if (rdmc_cal_eop_r & port_gnt_r2[3])
        ipp_sop_reg3 <= 1'b1;
else
        ipp_sop_reg3 <= ipp_sop_reg3;


/****************************/
//rdmc-meta0 write interface
/****************************/
wire[3:0] rdmc_meta0_wr_status = 4'b0;

always @ (posedge clk)
if (reset)
	rdmc_meta0_wr_data <= 128'b0;
else
	rdmc_meta0_wr_data <= rdmc_wr_data_in;

always @ (posedge clk)
if (reset)
	rdmc_meta0_wr_data_valid <= 1'b0;
else
	rdmc_meta0_wr_data_valid <= rdmc_wr_data_valid_sm;

always @ (posedge clk)
if (reset)
	rdmc_meta0_wr_transfer_comp <= 1'b0;
else
	rdmc_meta0_wr_transfer_comp <= rdmc_wr_data_comp_sm;

always @ (posedge clk)
if (reset)
        rdmc_meta0_wr_transfer_comp_int <= 1'b0;	//for output timing
else
        rdmc_meta0_wr_transfer_comp_int <= rdmc_wr_data_comp_sm;


always @ (posedge clk)
if (reset)
	rdmc_meta0_wr_req_byteenable <= 16'b0;
else if (rdmc_wr_data_valid_sm)
	rdmc_meta0_wr_req_byteenable <= wr_data_byte_en;
else
	rdmc_meta0_wr_req_byteenable <= 16'b0;

always @ (posedge clk)
if (reset)
        rdmc_wr_last_comp  <= 1'b0;
else
        rdmc_wr_last_comp  <= rdmc_wr_last_comp_sm;


niu_rdmc_wr_dp_sm niu_rdmc_wr_dp_sm_inst0 (
			.clk			(clk),
			.reset			(reset),
			.full_hdr_r1		(full_hdr_r1),
			.ipp_data_req_dly2	(ipp_data_req_dly2),
			.rdmc_wr_req_accept_hdr	(rdmc_wr_req_accept_hdr),
			.rdmc_wr_req_accept_zcp	(rdmc_wr_req_accept_zcp),
			.muxed_ipp_data_ack	(muxed_ipp_data_ack),
			.rdmc_cal_eop_r		(rdmc_cal_eop_r),
			.ipp_next_eop		(ipp_next_eop),
			.ipp_fzcp_eop		(ipp_fzcp_eop),
			.pkt_req_cnt_done	(pkt_req_cnt_done),
			.pkt_req_cnt_done_r	(pkt_req_cnt_done_r),
			.pkt_req_cnt_done_r1	(pkt_req_cnt_done_r1),
			.pkt_req_cnt_done_r2	(pkt_req_cnt_done_r2),
			.jmb_pkt_type		(jmb_pkt_type),
			.zcopy_mode		(zcopy_mode),
			.zcp_wr_type		(zcp_wr_type),
				
			.offset_reg_en		(offset_reg_en),
			.offset_sel		(offset_sel),
			.wr_idle_state		(wr_idle_state),
			.rdmc_wr_data_sel	(rdmc_wr_data_sel),
			.rdmc_wr_data_valid_sm	(rdmc_wr_data_valid_sm),
			.rdmc_wr_data_comp_sm	(rdmc_wr_data_comp_sm),
			.rdmc_wr_last_comp_sm	(rdmc_wr_last_comp_sm),
			.jmb_wr_cycle_sm	(jmb_wr_cycle_sm),
			.wr_dp_sm_state		(wr_dp_sm_state)

			);

endmodule

	




			

