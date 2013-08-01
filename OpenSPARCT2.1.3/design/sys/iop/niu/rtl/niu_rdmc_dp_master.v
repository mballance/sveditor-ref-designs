// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rdmc_dp_master.v
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
module niu_rdmc_dp_master (
			clk,
                        reset,
			rx_addr_32b_mode,
                        pt_drr_wt0_reg,
                        pt_drr_wt1_reg,
                        pt_drr_wt2_reg,
                        pt_drr_wt3_reg,
			port_err_status,
			muxed_port_rdc_num,
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

                        meta0_rdmc_wr_req_accept,
			meta0_rdmc_wr_data_req,

			//output
			port_gnt,
			muxed_pkt_len,
                        muxed_rdc_num_r,
			muxed_drop_pkt_r,
			muxed_s_event_r,
			stage1_en_r,
			sel_buf_en,
			pkt_req_cnt_e_done_mod,
			pkt_buf_done,
			is_hdr_wr_data,
			is_jmb1_wr_data,
			wr_last_pkt_data,
			update_rcr_shadw,
			rcr_wrbk_data,
			muxed_data_err_r2,
			rdmc_wr_data_dma_num,

			dmc_ipp_dat_req0,
                        dmc_ipp_dat_req1,
                        dmc_ipp_dat_req2,
                        dmc_ipp_dat_req3,

                        dmc_zcp_req0,
                        dmc_zcp_req1,
                        dmc_zcp_req2,
                        dmc_zcp_req3,

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
			rdmc_meta0_wr_transfer_comp_int,
                        rdmc_meta0_wr_status,

			port_err_event,
			ipp_dat_req0_data,
                        ipp_dat_req1_data,
                        ipp_dat_req2_data,
                        ipp_dat_req3_data,
			wr_debug_data

			);


input           clk;
input           reset;
input		rx_addr_32b_mode;
input[15:0]     pt_drr_wt0_reg;
input[15:0]     pt_drr_wt1_reg;
input[15:0]     pt_drr_wt2_reg;
input[15:0]     pt_drr_wt3_reg;
input[3:0]	port_err_status;
input[4:0]      muxed_port_rdc_num;
input[15:0]     full_hdr_bits;
input[15:0]	drop_pkt;
input[15:0]     pkt_buf_gnt;
input[63:0]     pkt_buf_addr0;
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
input[35:0]	orig_buf_addr0;
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
input           ipp_dmc_ful_pkt0;
input           ipp_dmc_dat_ack0;
input           ipp_dmc_dat_err0;
input[129:0]    ipp_dmc_data0;
input           ipp_dmc_ful_pkt1;
input           ipp_dmc_dat_ack1;
input           ipp_dmc_dat_err1;
input[129:0]    ipp_dmc_data1;
input           ipp_dmc_ful_pkt2;
input           ipp_dmc_dat_ack2;
input           ipp_dmc_dat_err2;
input[129:0]    ipp_dmc_data2;
input           ipp_dmc_ful_pkt3;
input           ipp_dmc_dat_ack3;
input           ipp_dmc_dat_err3;
input[129:0]    ipp_dmc_data3;

input           zcp_dmc_ful_pkt0;
input           zcp_dmc_ack0;
input[129:0]    zcp_dmc_dat0;
input           zcp_dmc_dat_err0;
input           zcp_dmc_ful_pkt1;
input           zcp_dmc_ack1;
input[129:0]    zcp_dmc_dat1;
input           zcp_dmc_dat_err1;
input           zcp_dmc_ful_pkt2;
input           zcp_dmc_ack2;
input[129:0]    zcp_dmc_dat2;
input           zcp_dmc_dat_err2;
input           zcp_dmc_ful_pkt3;
input           zcp_dmc_ack3;
input[129:0]    zcp_dmc_dat3;
input           zcp_dmc_dat_err3;

input           meta0_rdmc_wr_req_accept;
input           meta0_rdmc_wr_data_req;

output[3:0]	port_gnt;
output[13:0]    muxed_pkt_len;
output[4:0]     muxed_rdc_num_r;
output		muxed_drop_pkt_r;
output		muxed_s_event_r;
output		stage1_en_r;
output		sel_buf_en;
output          pkt_req_cnt_e_done_mod;
output		pkt_buf_done;
output		is_hdr_wr_data;
output		is_jmb1_wr_data;
output		wr_last_pkt_data;
output		update_rcr_shadw;
output[63:0]	rcr_wrbk_data;
output		muxed_data_err_r2;
output[4:0]	rdmc_wr_data_dma_num;
output          dmc_ipp_dat_req0;
output          dmc_ipp_dat_req1;
output          dmc_ipp_dat_req2;
output          dmc_ipp_dat_req3;
output          dmc_zcp_req0;
output          dmc_zcp_req1;
output          dmc_zcp_req2;
output          dmc_zcp_req3;

output          rdmc_meta0_wr_req;
output[7:0]     rdmc_meta0_wr_req_cmd;
output[63:0]    rdmc_meta0_wr_req_address;
output[13:0]    rdmc_meta0_wr_req_length;
output[1:0]     rdmc_meta0_wr_req_port_num;
output[4:0]     rdmc_meta0_wr_req_dma_num;
output[1:0]     rdmc_meta0_wr_req_func_num;

output          rdmc_meta0_wr_data_valid;
output[127:0]   rdmc_meta0_wr_data;
output[15:0]    rdmc_meta0_wr_req_byteenable;
output          rdmc_meta0_wr_transfer_comp;
output		rdmc_meta0_wr_transfer_comp_int;
output[3:0]     rdmc_meta0_wr_status;

output[8:0]	port_err_event;
output          ipp_dat_req0_data;
output          ipp_dat_req1_data;
output          ipp_dat_req2_data;
output          ipp_dat_req3_data;
output[31:0]	wr_debug_data;


wire          	rdmc_meta0_wr_req;
wire[7:0]     	rdmc_meta0_wr_req_cmd;
wire[63:0]    	rdmc_meta0_wr_req_address;
wire[13:0]    	rdmc_meta0_wr_req_length;
wire[1:0]     	rdmc_meta0_wr_req_port_num;
wire[4:0]     	rdmc_meta0_wr_req_dma_num;
wire[4:0]	rdmc_meta0_wr_req_dma_num_int;
wire[1:0]	rdmc_meta0_wr_req_func_num;
wire          	full_hdr_r;
wire[13:0]    	pkt_trans_len_r;
wire[1:0]	pref_buf_used_num_r;
wire		drop_pkt_en_sm;
wire		drop_pkt_en;
wire[3:0]	drop_pkt_port_gnt;
wire		drop_pad_data;
wire		is_zcp0_wr_req;
wire		is_zcp1_wr_req;
wire		is_zcp2_wr_req;
wire		is_zcp3_wr_req;
wire          	rdmc_wr_req_accept_hdr;
wire		rdmc_wr_req_accept_jmb;
wire		rdmc_wr_req_accept_zcp0;
wire		rdmc_wr_req_accept_zcp1;
wire		rdmc_wr_req_accept_zcp2;
wire		rdmc_wr_req_accept_zcp3;
wire[3:0]     	port_gnt;
wire[3:0]     	port_gnt_r;
wire          	stage0_en;
wire		stage1_en_r;
wire          	sel_buf_en;
wire		pkt_buf_done;
wire		is_hdr_wr_data;
wire		is_jmb1_wr_data;
wire		wr_last_pkt_data;
wire		update_rcr_shadw;
wire[63:0]	rcr_wrbk_data;
wire[4:0]	wr_sched_sm_state;
wire[4:0]	wr_dp_sm_state;

wire[4:0]       muxed_rdc_num_r;
wire		muxed_drop_pkt_r;
wire		muxed_s_event_r;
wire[13:0]      muxed_pkt_len;
wire[13:0]	muxed_pkt_len_r;
wire[13:0]	muxed_l2_len_r;
wire		rdmc_eop_for_padding;
wire		pkt_req_cnt_pre_done;
wire          	pkt_req_cnt_done;
wire		pkt_req_cnt_done_r;
wire		pkt_req_cnt_e_done_mod;
wire[22:0]	pkt_wrbk_data;
wire		drop_pkt_done;
wire[4:0]	rdmc_wr_data_dma_num;
wire[3:0]     	ipp_full_pkt;
wire[3:0]     	zcp_full_pkt;
wire[3:0]     	ipp_pkt_sop;
wire[3:0]     	zcp_pkt_sop;
wire		muxed_zcopy_mode_r;
wire		muxed_data_err_r2;
wire		zcopy_mode;
wire[1:0]	jmb_pkt_type;
wire[1:0]	zcp_wr_type;
wire[4:0]	zcp_rdc_num;
wire[63:0]	zcp_vaddr0;
wire[63:0]      zcp_vaddr1;
wire[63:0]      zcp_vaddr2;
wire[63:0]      zcp_vaddr3;
wire[13:0]	zcp_len0;
wire[13:0]      zcp_len1;
wire[13:0]      zcp_len2;
wire[13:0]      zcp_len3;
wire[1:0]	zcp_func_num;
wire          	dmc_ipp_dat_req0;
wire          	dmc_ipp_dat_req1;
wire          	dmc_ipp_dat_req2;
wire          	dmc_ipp_dat_req3;
wire          	dmc_zcp_req0;
wire          	dmc_zcp_req1;
wire          	dmc_zcp_req2;
wire          	dmc_zcp_req3;

wire          	rdmc_meta0_wr_data_valid;
wire[127:0]   	rdmc_meta0_wr_data;
wire[15:0]    	rdmc_meta0_wr_req_byteenable;
wire          	rdmc_meta0_wr_transfer_comp;
wire		rdmc_meta0_wr_transfer_comp_int;
wire[3:0]     	rdmc_meta0_wr_status;

wire[8:0]	port_err_event;
wire		ipp_dat_req0_data;
wire		ipp_dat_req1_data;
wire		ipp_dat_req2_data;
wire		ipp_dat_req3_data;

wire[31:0]	wr_debug_data	= {wr_dp_sm_state, wr_sched_sm_state, port_gnt, muxed_pkt_len_r, muxed_rdc_num_r[3:0]};


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


niu_rdmc_wr_sched niu_rdmc_wr_sched0 (
			.clk				(clk),
			.reset				(reset),
			.rx_addr_32b_mode		(rx_addr_32b_mode),			
			.pt_drr_wt0_reg			(pt_drr_wt0_reg),
			.pt_drr_wt1_reg                 (pt_drr_wt1_reg),
			.pt_drr_wt2_reg                 (pt_drr_wt2_reg),
			.pt_drr_wt3_reg                 (pt_drr_wt3_reg),
			.muxed_l2_len_r                 (muxed_l2_len_r),
			.muxed_pkt_len_r		(muxed_pkt_len_r),
			.rdmc_eop_for_padding		(rdmc_eop_for_padding),
			.pkt_req_cnt_pre_done		(pkt_req_cnt_pre_done),
                        .pkt_req_cnt_done               (pkt_req_cnt_done),
			.pkt_req_cnt_done_r		(pkt_req_cnt_done_r),
                        .pkt_wrbk_data                  (pkt_wrbk_data),
			.drop_pkt_done			(drop_pkt_done),
                        .ipp_full_pkt                   (ipp_full_pkt),
                        .zcp_full_pkt                   (zcp_full_pkt),
                        .ipp_pkt_sop                    (ipp_pkt_sop),
                        .zcp_pkt_sop                    (zcp_pkt_sop),
                        .muxed_zcopy_mode_r             (muxed_zcopy_mode_r),
			.muxed_data_err_r2		(muxed_data_err_r2),
			.zcopy_mode			(zcopy_mode),
			.jmb_pkt_type			(jmb_pkt_type),
                        .zcp_wr_type                    (zcp_wr_type),
                        .zcp_rdc_num                    (zcp_rdc_num),
                        .zcp_vaddr0                     (zcp_vaddr0),
                        .zcp_vaddr1                     (zcp_vaddr1),
                        .zcp_vaddr2                     (zcp_vaddr2),
                        .zcp_vaddr3                     (zcp_vaddr3),
                        .zcp_len0                       (zcp_len0),
                        .zcp_len1                       (zcp_len1),
                        .zcp_len2                       (zcp_len2),
                        .zcp_len3                       (zcp_len3),
			.zcp_func_num			(zcp_func_num),
			.full_hdr_bits			(full_hdr_bits),
			.drop_pkt			(drop_pkt),
			.pkt_buf_gnt			(pkt_buf_gnt),
			.pkt_buf_addr0			(pkt_buf_addr0),
			.pkt_buf_addr1			(pkt_buf_addr1),
			.pkt_buf_addr2			(pkt_buf_addr2),
			.pkt_buf_addr3			(pkt_buf_addr3),
			.pkt_buf_addr4			(pkt_buf_addr4),
			.pkt_buf_addr5			(pkt_buf_addr5),
			.pkt_buf_addr6			(pkt_buf_addr6),
			.pkt_buf_addr7			(pkt_buf_addr7),
			.pkt_buf_addr8			(pkt_buf_addr8),
			.pkt_buf_addr9			(pkt_buf_addr9),
			.pkt_buf_addr10			(pkt_buf_addr10),
			.pkt_buf_addr11			(pkt_buf_addr11),
			.pkt_buf_addr12			(pkt_buf_addr12),
			.pkt_buf_addr13			(pkt_buf_addr13),
			.pkt_buf_addr14			(pkt_buf_addr14),
			.pkt_buf_addr15			(pkt_buf_addr15),
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
			.meta0_rdmc_wr_req_accept	(meta0_rdmc_wr_req_accept),

			.rdmc_meta0_wr_req		(rdmc_meta0_wr_req),
			.rdmc_meta0_wr_req_cmd		(rdmc_meta0_wr_req_cmd),
			.rdmc_meta0_wr_req_address	(rdmc_meta0_wr_req_address),
			.rdmc_meta0_wr_req_length	(rdmc_meta0_wr_req_length),
			.rdmc_meta0_wr_req_port_num	(rdmc_meta0_wr_req_port_num),
			.rdmc_meta0_wr_req_dma_num	(rdmc_meta0_wr_req_dma_num),
			.rdmc_meta0_wr_req_dma_num_int	(rdmc_meta0_wr_req_dma_num_int),
			.rdmc_meta0_wr_req_func_num     (rdmc_meta0_wr_req_func_num),
			.full_hdr_r			(full_hdr_r),
			.pkt_trans_len_r		(pkt_trans_len_r),
			.pref_buf_used_num_r		(pref_buf_used_num_r),
			.drop_pkt_en_sm			(drop_pkt_en_sm),
			.drop_pkt_en			(drop_pkt_en),
			.drop_pkt_port_gnt		(drop_pkt_port_gnt),
			.drop_pad_data			(drop_pad_data),
			.is_zcp0_wr_req			(is_zcp0_wr_req),
			.is_zcp1_wr_req			(is_zcp1_wr_req),
			.is_zcp2_wr_req			(is_zcp2_wr_req),
			.is_zcp3_wr_req			(is_zcp3_wr_req),
			.rdmc_wr_req_accept_hdr		(rdmc_wr_req_accept_hdr),
			.rdmc_wr_req_accept_jmb		(rdmc_wr_req_accept_jmb),
			.rdmc_wr_req_accept_zcp0	(rdmc_wr_req_accept_zcp0),
			.rdmc_wr_req_accept_zcp1	(rdmc_wr_req_accept_zcp1),
			.rdmc_wr_req_accept_zcp2	(rdmc_wr_req_accept_zcp2),
			.rdmc_wr_req_accept_zcp3	(rdmc_wr_req_accept_zcp3),
			.port_gnt			(port_gnt),
			.port_gnt_r			(port_gnt_r),
			.stage0_en			(stage0_en),
			.stage1_en_r			(stage1_en_r),
			.sel_buf_en			(sel_buf_en),
			.pkt_buf_done			(pkt_buf_done),
			.is_hdr_wr_data			(is_hdr_wr_data),
			.is_jmb1_wr_data		(is_jmb1_wr_data),
			.wr_last_pkt_data		(wr_last_pkt_data),
			.update_rcr_shadw		(update_rcr_shadw),
			.rcr_wrbk_data			(rcr_wrbk_data),
			.wr_sched_sm_state		(wr_sched_sm_state)

			);


niu_rdmc_wr_dp	niu_rdmc_wr_dp0 (
			.clk				(clk),
                        .reset				(reset),
			.port_err_status		(port_err_status),
                        .muxed_port_rdc_num		(muxed_port_rdc_num),
                        .full_hdr_r			(full_hdr_r),			
                        .pkt_trans_len_r		(pkt_trans_len_r),
			.pref_buf_used_num_r		(pref_buf_used_num_r),
			.drop_pkt_en_sm			(drop_pkt_en_sm),
			.drop_pkt_en			(drop_pkt_en),
			.drop_pkt_port_gnt		(drop_pkt_port_gnt),
			.drop_pad_data			(drop_pad_data),
			.is_zcp0_wr_req                 (is_zcp0_wr_req),
                        .is_zcp1_wr_req                 (is_zcp1_wr_req),
                        .is_zcp2_wr_req                 (is_zcp2_wr_req),
                        .is_zcp3_wr_req                 (is_zcp3_wr_req),
                        .rdmc_wr_req_accept_hdr		(rdmc_wr_req_accept_hdr),
			.rdmc_wr_req_accept_jmb		(rdmc_wr_req_accept_jmb),
			.rdmc_wr_req_accept_zcp0	(rdmc_wr_req_accept_zcp0),
			.rdmc_wr_req_accept_zcp1	(rdmc_wr_req_accept_zcp1),
			.rdmc_wr_req_accept_zcp2	(rdmc_wr_req_accept_zcp2),
			.rdmc_wr_req_accept_zcp3	(rdmc_wr_req_accept_zcp3),
                        .port_gnt			(port_gnt),
                        .port_gnt_r			(port_gnt_r),
                        .stage0_en			(stage0_en),
			.rdmc_meta0_wr_req_dma_num_int	(rdmc_meta0_wr_req_dma_num_int),
                        .ipp_dmc_ful_pkt0		(ipp_dmc_ful_pkt0),
                        .ipp_dmc_dat_ack0		(ipp_dmc_dat_ack0),
			.ipp_dmc_dat_err0		(ipp_dmc_dat_err0),
                        .ipp_dmc_data0			(ipp_dmc_data0),
                        .ipp_dmc_ful_pkt1		(ipp_dmc_ful_pkt1),
                        .ipp_dmc_dat_ack1		(ipp_dmc_dat_ack1),
			.ipp_dmc_dat_err1		(ipp_dmc_dat_err1),
                        .ipp_dmc_data1			(ipp_dmc_data1),
                        .ipp_dmc_ful_pkt2		(ipp_dmc_ful_pkt2),
                        .ipp_dmc_dat_ack2		(ipp_dmc_dat_ack2),
			.ipp_dmc_dat_err2		(ipp_dmc_dat_err2),
                        .ipp_dmc_data2			(ipp_dmc_data2),
                        .ipp_dmc_ful_pkt3		(ipp_dmc_ful_pkt3),
                        .ipp_dmc_dat_ack3		(ipp_dmc_dat_ack3),
			.ipp_dmc_dat_err3		(ipp_dmc_dat_err3),
                        .ipp_dmc_data3			(ipp_dmc_data3),
                        .zcp_dmc_ful_pkt0		(zcp_dmc_ful_pkt0),
                        .zcp_dmc_ack0			(zcp_dmc_ack0),
                        .zcp_dmc_dat0			(zcp_dmc_dat0),
			.zcp_dmc_dat_err0		(zcp_dmc_dat_err0),
                        .zcp_dmc_ful_pkt1		(zcp_dmc_ful_pkt1),
                        .zcp_dmc_ack1			(zcp_dmc_ack1),
                        .zcp_dmc_dat1			(zcp_dmc_dat1),
			.zcp_dmc_dat_err1		(zcp_dmc_dat_err1),
                        .zcp_dmc_ful_pkt2		(zcp_dmc_ful_pkt2),
                        .zcp_dmc_ack2			(zcp_dmc_ack2),
                        .zcp_dmc_dat2			(zcp_dmc_dat2),
			.zcp_dmc_dat_err2		(zcp_dmc_dat_err2),
                        .zcp_dmc_ful_pkt3		(zcp_dmc_ful_pkt3),
                        .zcp_dmc_ack3			(zcp_dmc_ack3),
                        .zcp_dmc_dat3			(zcp_dmc_dat3),
			.zcp_dmc_dat_err3		(zcp_dmc_dat_err3),
                        .meta0_rdmc_wr_data_req		(meta0_rdmc_wr_data_req),

			.muxed_rdc_num_r		(muxed_rdc_num_r),
			.muxed_drop_pkt_r		(muxed_drop_pkt_r),
			.muxed_s_event_r		(muxed_s_event_r),
			.muxed_pkt_len			(muxed_pkt_len),
			.muxed_pkt_len_r		(muxed_pkt_len_r),
			.muxed_l2_len_r			(muxed_l2_len_r),
			.rdmc_eop_for_padding		(rdmc_eop_for_padding),
			.pkt_req_cnt_pre_done		(pkt_req_cnt_pre_done),
                        .pkt_req_cnt_done		(pkt_req_cnt_done),
			.pkt_req_cnt_done_r		(pkt_req_cnt_done_r),
			.pkt_req_cnt_e_done_mod		(pkt_req_cnt_e_done_mod),
			.pkt_wrbk_data			(pkt_wrbk_data),
			.drop_pkt_done			(drop_pkt_done),
			.rdmc_wr_data_dma_num		(rdmc_wr_data_dma_num),
                        .ipp_full_pkt			(ipp_full_pkt),
                        .zcp_full_pkt			(zcp_full_pkt),
                        .ipp_pkt_sop			(ipp_pkt_sop),
                        .zcp_pkt_sop			(zcp_pkt_sop),
			.muxed_zcopy_mode_r		(muxed_zcopy_mode_r),
			.muxed_data_err_r2		(muxed_data_err_r2),
			.zcopy_mode			(zcopy_mode),
			.jmb_pkt_type			(jmb_pkt_type),
			.zcp_wr_type			(zcp_wr_type),
			.zcp_rdc_num			(zcp_rdc_num),
			.zcp_vaddr0			(zcp_vaddr0),
			.zcp_vaddr1			(zcp_vaddr1),
			.zcp_vaddr2			(zcp_vaddr2),
			.zcp_vaddr3			(zcp_vaddr3),
			.zcp_len0			(zcp_len0),
			.zcp_len1			(zcp_len1),
			.zcp_len2			(zcp_len2),
			.zcp_len3			(zcp_len3),
			.zcp_func_num			(zcp_func_num),
                        .dmc_ipp_dat_req0		(dmc_ipp_dat_req0),
                        .dmc_ipp_dat_req1		(dmc_ipp_dat_req1),
                        .dmc_ipp_dat_req2		(dmc_ipp_dat_req2),
                        .dmc_ipp_dat_req3		(dmc_ipp_dat_req3),
                        .dmc_zcp_req0			(dmc_zcp_req0),
                        .dmc_zcp_req1			(dmc_zcp_req1),
                        .dmc_zcp_req2			(dmc_zcp_req2),
                        .dmc_zcp_req3			(dmc_zcp_req3),
                        .rdmc_meta0_wr_data_valid	(rdmc_meta0_wr_data_valid),
                        .rdmc_meta0_wr_data		(rdmc_meta0_wr_data),
                        .rdmc_meta0_wr_req_byteenable	(rdmc_meta0_wr_req_byteenable),
                        .rdmc_meta0_wr_transfer_comp	(rdmc_meta0_wr_transfer_comp),
			.rdmc_meta0_wr_transfer_comp_int(rdmc_meta0_wr_transfer_comp_int),
                        .rdmc_meta0_wr_status		(rdmc_meta0_wr_status),
			.port_err_event			(port_err_event),
			.ipp_dat_req0_data		(ipp_dat_req0_data),
			.ipp_dat_req1_data		(ipp_dat_req1_data),
			.ipp_dat_req2_data		(ipp_dat_req2_data),
			.ipp_dat_req3_data		(ipp_dat_req3_data),
			.wr_dp_sm_state			(wr_dp_sm_state)
		
			);


endmodule
