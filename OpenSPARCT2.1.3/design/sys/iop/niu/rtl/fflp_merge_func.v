// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_merge_func.v
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
/**********************************************************************/
/*project name:  N2                                                   */
/*module name:   fflp_merge_func                                      */
/*description:   Merge function to create forward decision to ZCP     */
/*                                                                    */
/*parent module in:  fflp_fcram_top                                   */
/*child modules in:                                                   */
/*interface modules:                                                  */
/*author name:       Jeanne Cai                                       */
/*date created:      04-08-04                                         */
/*                                                                    */
/*              Copyright (c) 2004, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/*modifications:                                                      */
/*                                                                    */
/*                                                                    */


module fflp_merge_func (
			cclk,
			reset,
			fwd_sched,
			fc_fifo_dout,
			fc_din_reg_dout_r,
			ecc_check_err_r,
			ecc_corr_err_r,
			fio_no_fatal_err,
			srch_burst_done_2,
			srch_fio_wait_6,
			srch_fio_rd_en_4,
			fcram_sm_state,
			fflp_config_reg_wen_pulse_sync,
			debug_training_vector,
			pio_debug_data_sel,

			merg_bus_0_hash_v1,
			merg_bus_0_rdc_tbl_num,
			merg_bus_1_fc_lookup,
			zcp_wr,
			fflp_zcp_data,
			fc_err_status,
			fflp_debug_port

			);

input		cclk;
input		reset;
input		fwd_sched;
input[512:0]	fc_fifo_dout;
input[71:0]	fc_din_reg_dout_r;
input		ecc_check_err_r;
input		ecc_corr_err_r;
input		fio_no_fatal_err;
input		srch_burst_done_2;
input		srch_fio_wait_6;
input		srch_fio_rd_en_4;
input[4:0]	fcram_sm_state;
input		fflp_config_reg_wen_pulse_sync;
input[31:0]	debug_training_vector;
input[2:0]	pio_debug_data_sel;

output[19:0]	merg_bus_0_hash_v1;
output[2:0]	merg_bus_0_rdc_tbl_num;
output		merg_bus_1_fc_lookup;
output		zcp_wr;
output[215:0]	fflp_zcp_data;
output[33:0]	fc_err_status;
output[31:0]	fflp_debug_port;

wire		zcp_wr;
wire[215:0]	fflp_zcp_data;

wire[512:0]	merg_bus;
wire[512:0]	merg_bus_1;
wire[512:0]	merg_bus_2;
wire[512:0]	merg_bus_3;

wire[19:0]	merg_bus_hash_v1;
wire[15:0]	merg_bus_hash_v2;
wire[383:0]	merg_bus_flow_key;
wire[114:0]	merg_bus_fwd_info;

wire[63:0]	merg_bus_flow_key_row0;
wire[63:0]	merg_bus_flow_key_row1;
wire[63:0]	merg_bus_flow_key_row2;
wire[63:0]	merg_bus_flow_key_row3;
wire[63:0]	merg_bus_flow_key_row4;
wire[63:0]	merg_bus_flow_key_row5;

wire[1:0]	merg_bus_fkey_port;
wire[7:0]	merg_bus_fkey_protocol;
wire[15:0]	merg_bus_fkey_ly4_1;
wire[15:0]	merg_bus_fkey_ly4_0;

wire[11:0]	merg_bus_fkey_vid;
wire[47:0]	merg_bus_fkey_mac_da;
wire[3:0]	merg_bus_fkey_vlan_valid;

wire[2:0]	merg_bus_rdc_tbl_num;
wire		merg_bus_cam_match;
wire		merg_bus_drop_pkt;
wire[1:0]	merg_bus_ether_type;
wire[1:0]	merg_bus_l4_protocol;
wire		merg_bus_badip;
wire		merg_bus_noport;
wire		merg_bus_llcnsap;
wire		merg_bus_vlan;
wire[4:0]	merg_bus_class;
wire		merg_bus_ph_match;
wire		merg_bus_promis;

wire[3:0]	merg_bus_ip_hdr_len;	//for v4 only. v6 has fixed 40 bytes
wire[15:0]	merg_bus_ip_pkt_len;	//for both v4, v6.
wire[3:0]	merg_bus_tcp_hdr_len;
wire		merg_bus_tcp_push_bit;
wire[31:0]	merg_bus_tcp_seq_num;
wire[3:0]	merg_bus_pkt_id;
wire[4:0]	merg_bus_rdc_tbl_offset;
wire[1:0]	merg_bus_valid_tres;
wire		merg_bus_valid_zcopy;
wire[9:0]	merg_bus_valid_cam_haddr;
wire		merg_bus_am_parity_err;
wire		merg_bus_fc_lookup;
wire[1:0]	merg_bus_mac_port;
wire[11:0]	merg_bus_zcopy_id;

wire		sub0_fmt;
wire		sub0_ext;
wire		sub0_valid;
wire[47:0]	sub0_mac_da;
wire[11:0]	sub0_vid;
wire[4:0]	sub0_rdc_offset;
wire[15:0]	sub0_hash_v2;
wire[39:0]	sub0_usr_info;

wire		sub0_mac_da_comp0;
wire		sub0_mac_da_comp1;
wire		sub0_mac_da_comp2;
wire		sub0_mac_da_comp3;
wire		sub0_vlan_match;

wire		sub0_hash_v2_match;
wire		sub0_v4_ext_match;
wire		sub0_v6_ext_match;
wire		sub0_ip_version_match;
wire		sub0_is_opt_match;
wire		sub0_opt_match;
wire		v4_comp_reg_en0;

wire		sub0_v4_ext_match_r;
wire		sub4_v4_ext_match_r;
wire		sub0_v6_ext_match_r;
wire		sub0_opt_match_r;
wire		sub0_mac_da_comp0_r;
wire		sub0_mac_da_comp1_r;
wire		sub0_mac_da_comp2_r;
wire		sub0_mac_da_comp3_r;
wire		sub0_vlan_match_r;

wire		sub0_mac_da_match;
wire[31:0]	sub1_v4_src_addr;
wire[31:0]	sub1_v4_dest_addr;
wire[63:0]	sub1_v6_src_addr_u;

wire		sub1_fmt;
wire		sub1_ext;
wire		sub1_valid;
wire[15:0]	sub1_hash_v2;

wire		sub1_v4_src_addr_comp0;
wire		sub1_v4_src_addr_comp1;
wire		sub1_v4_dest_addr_comp0;
wire		sub1_v4_dest_addr_comp1;

wire		sub1_v6_src_addr_u_comp0;
wire		sub1_v6_src_addr_u_comp1;
wire		sub1_v6_src_addr_u_comp2;
wire		sub1_v6_src_addr_u_comp3;

wire		sub1_hash_v2_match;		
wire		sub1_ip_version_match;
wire		sub1_is_opt_match;
wire		sub1_opt_match;
wire		v4_comp_reg_en1;

wire		sub0_mac_da_match_r;
wire		sub1_v4_src_addr_comp0_r;
wire		sub1_v4_src_addr_comp1_r;
wire		sub1_v4_dest_addr_comp0_r;
wire		sub1_v4_dest_addr_comp1_r;
wire		sub1_v6_src_addr_u_comp0_r;
wire		sub1_v6_src_addr_u_comp1_r;
wire		sub1_v6_src_addr_u_comp2_r;
wire		sub1_v6_src_addr_u_comp3_r;
wire		sub1_opt_match_r;

wire		sub1_v4_src_addr_match;
wire		sub1_v4_dest_addr_match;
wire		sub1_v6_src_addr_u_match;

wire[15:0]	sub2_ly4_0;
wire[15:0]	sub2_ly4_1;
wire[7:0]	sub2_protocol;
wire[1:0]	sub2_port;

wire[63:0]	sub2_v6_src_addr_l;

wire		sub2_fmt;
wire		sub2_ext;
wire		sub2_valid;
wire[15:0]	sub2_hash_v2;

wire		sub2_ly4_0_match;
wire		sub2_ly4_1_match;
wire		sub2_protocol_match;
wire		sub2_port_match;

wire		sub2_v6_src_addr_l_comp0;
wire		sub2_v6_src_addr_l_comp1;
wire		sub2_v6_src_addr_l_comp2;
wire		sub2_v6_src_addr_l_comp3;

wire		sub2_hash_v2_match;
wire		sub2_ip_version_match;
wire		sub2_is_opt_match;
wire		sub2_opt_match;
wire		v4_comp_reg_en2;
wire		v6_comp_reg_en2;

wire		sub1_v4_src_addr_match_r;
wire		sub1_v4_dest_addr_match_r;
wire		sub1_v6_src_addr_u_match_r;

wire		sub2_ly4_0_match_r;
wire		sub2_ly4_1_match_r;
wire		sub2_protocol_match_r;
wire		sub2_port_match_r;

wire		sub2_v6_src_addr_l_comp0_r;
wire		sub2_v6_src_addr_l_comp1_r;
wire		sub2_v6_src_addr_l_comp2_r;
wire		sub2_v6_src_addr_l_comp3_r;
wire		sub2_opt_match_r;

wire		sub2_v6_src_addr_l_match;
wire		sub3_v4_ext_match_tmp;
wire		sub3_v4_ext_match_all;
wire		sub7_v4_ext_match_all;

wire[4:0]	sub3_rdc_offset;
wire		sub3_zcopy_valid;
wire[11:0]	sub3_zcopy_id;
wire[39:0]	sub3_usr_info;

wire[63:0]	sub3_v6_dst_addr_u;

wire		sub3_fmt;
wire		sub3_ext;
wire		sub3_valid;
wire[15:0]	sub3_hash_v2;

wire		sub3_v6_dst_addr_u_comp0;
wire		sub3_v6_dst_addr_u_comp1;
wire		sub3_v6_dst_addr_u_comp2;
wire		sub3_v6_dst_addr_u_comp3;

wire		sub3_hash_v2_match;
wire		sub3_ip_version_match;
wire		sub3_is_opt_match;
wire		sub3_opt_match;

wire		sub2_v6_src_addr_l_match_r;
wire		sub3_v6_dst_addr_u_comp0_r;
wire		sub3_v6_dst_addr_u_comp1_r;
wire		sub3_v6_dst_addr_u_comp2_r;
wire		sub3_v6_dst_addr_u_comp3_r;
wire		sub3_v4_ext_match_all_r;
//wire		sub7_v4_ext_match_all_r;
wire		sub3_opt_match_r;

wire		sub3_v6_dst_addr_u_match;

wire[63:0]	sub4_v6_dst_addr_l;
wire		sub4_fmt;
wire		sub4_ext;
wire		sub4_valid;
wire[15:0]	sub4_hash_v2;

wire		sub4_v6_dst_addr_l_comp0;
wire		sub4_v6_dst_addr_l_comp1;
wire		sub4_v6_dst_addr_l_comp2;
wire		sub4_v6_dst_addr_l_comp3;

wire		sub4_hash_v2_match;
wire		sub4_ip_version_match;
wire		sub4_is_opt_match;
wire		sub4_opt_match;

wire		sub3_v6_dst_addr_u_match_r;
wire		sub4_v6_dst_addr_l_comp0_r;
wire		sub4_v6_dst_addr_l_comp1_r;
wire		sub4_v6_dst_addr_l_comp2_r;
wire		sub4_v6_dst_addr_l_comp3_r;
wire		sub4_opt_match_r;

wire		sub4_v6_dst_addr_l_match;

wire		sub5_fmt;
wire		sub5_ext;
wire		sub5_valid;
wire[15:0]	sub5_hash_v2;

wire		sub5_hash_v2_match;
wire		sub5_ip_version_match;
wire		sub5_is_opt_match;
wire		sub5_opt_match;

wire		sub4_v6_dst_addr_l_match_r;
wire		sub5_opt_match_r;

wire		sub6_v6_ext_match_all;
wire		sub6_fmt;
wire		sub6_ext;
wire		sub6_valid;
wire[15:0]	sub6_hash_v2;

wire		sub6_hash_v2_match;
wire		sub6_ip_version_match;
wire		sub6_is_opt_match;
wire		sub6_opt_match;

wire		sub6_v6_ext_match_all_r;
wire		sub6_opt_match_r;

wire		sub7_fmt;
wire		sub7_ext;
wire		sub7_valid;
wire[15:0]	sub7_hash_v2;

wire		sub7_hash_v2_match;
wire		sub7_ip_version_match;
wire		sub7_is_opt_match;
wire		sub7_opt_match;
wire		sub7_opt_match_r;

wire		exect_match;
wire[2:0]	ext_sub_addr;
wire		ext_info_reg_en;

wire		exect_match_r;
wire[2:0]	ext_sub_addr_r;
wire		ext_zcopy_valid_r;
wire[11:0]	ext_zcopy_id_r;
wire[4:0]	ext_rdc_offset_r;
wire[39:0]	ext_usr_info_r;

wire		opt_match;
wire[7:0]	opt_match_array;

wire		sub4_opt_match4;
wire		sub4_opt_match4_r;
wire		sub7_opt_no_match1;
wire		sub7_opt_no_match2;
wire		sub7_opt_no_match3;
wire		sub7_opt_no_match4;
wire		sub7_opt_no_match5;
wire		sub7_opt_no_match6;
wire		sub7_opt_no_match7;
wire		opt_info_reg_en;

reg[2:0]	opt_sub_addr;
reg[2:0]	sub_area_addr;

wire[4:0]	opt_rdc_offset_r;
wire[39:0]	opt_usr_info_r;

wire		opt_match_v;
wire		exect_match_v;
wire		fram_hash_match;
wire[2:0]	fram_sub_addr;
wire		fram_zcopy_valid;
wire[11:0]	fram_zcopy_id;
wire[4:0]	fram_rdc_offset;
wire[39:0]	fram_usr_info;

wire		fwd_l2_class;
wire[4:0]	fwd_rdc_offset;
wire[11:0]	fwd_zcopy_id;
wire[1:0]	fwd_l4_protocol;
wire[19:0]	fwd_hash_v1;
wire[15:0]	fwd_hash_v2;

wire            merg_bus_fc_lookup_r;
wire		fwd_l2_class_r;
wire[4:0]	merg_bus_rdc_tbl_offset_r;
wire		merg_bus_valid_tres_bit0_r;
wire[4:0]	merg_bus_hash_v1_lsb_r;
wire		merg_bus_valid_zcopy_r;
wire[11:0]	merg_bus_zcopy_id_r;
wire[2:0]       merg_bus_rdc_tbl_num_r;
wire[4:0]       fwd_rdc_offset_r;

wire[7:0]       byte0,  byte1,  byte2,  byte3,  byte4;
wire[7:0]       byte5,  byte6,  byte7,  byte8,  byte9;
wire[7:0]       byte10, byte11, byte12, byte13, byte14;
wire[7:0]       byte15, byte16, byte17, byte18, byte19;
wire[7:0]       byte20, byte21, byte22, byte23, byte24;
wire[7:0]       byte25, byte26;

wire[7:0]       byte0_r,  byte1_r,            byte3_r,  byte4_r;
wire[7:0]                 byte6_r,  byte7_r,  byte8_r,  byte9_r;
wire[7:0]       byte10_r, byte11_r, byte12_r, byte13_r, byte14_r;
wire[7:0]       byte15_r, byte16_r, byte17_r, byte18_r;
wire[7:0]       byte20_r, byte21_r, byte22_r, byte23_r, byte24_r;
wire[7:0]       byte25_r, byte26_r;

wire[19:0]	merg_bus_0_hash_v1;
wire[2:0]	merg_bus_0_rdc_tbl_num;
wire		merg_bus_1_fc_lookup;

wire		merge_func_cyc0;
wire		merge_func_cyc1;
wire		merge_func_cyc2;
wire		merge_func_cyc3;
wire		merge_func_cyc4;
wire		merge_func_cyc5;
wire		merge_func_cyc6;
wire		merge_func_cyc7;

wire		pre_zcp_wr;
wire		pre_zcp_wr1;
wire		pre_zcp_wr2;
wire		zcp_wr_p;

wire[7:0]	ecc_syndrome;
wire[7:0]	ecc_syndrome_r;

wire		fflp_hdw_err;
wire		merge_func_cyc;
wire		ecc_uncor_err_en;
wire		ecc_uncor_err_in;
wire		ecc_uncor_err;
wire		ecc_check_err_all;
wire		err_cnt_reg_en;
wire[3:0]	err_cnt_in;
wire		is_ecc_uncor_en;	//the first err is uncorr_err
wire		is_ecc_uncor_in;
wire		is_ecc_uncor_r;
wire		ecc_err;
wire		multi_err;
wire[19:0]	err_hash_v1;
wire		ecc_addr_reg_en;
wire[7:0]	sub_addr_array;
wire[33:0]	fc_err_status_in;
wire[3:0]	err_cnt;
wire[2:0]	ecc_sub_addr;
wire[33:0]	fc_err_status;

wire[6:0]	merg_bus_cntl_data;
wire[31:0]	debug_port_data_in;
wire[31:0]	fflp_debug_port;
wire[2:0]	debug_data_sel;

wire[71:0]	fc_din_reg_dout_r1;
wire		ecc_check_err_r1;
wire		ecc_corr_err_r1;

assign fc_din_reg_dout_r1	= (merg_bus_fc_lookup & fio_no_fatal_err) ? fc_din_reg_dout_r : 72'b0; 
assign ecc_check_err_r1		= (merg_bus_fc_lookup & fio_no_fatal_err) ? ecc_check_err_r   : 1'b0;
assign ecc_corr_err_r1		= (merg_bus_fc_lookup & fio_no_fatal_err) ? ecc_corr_err_r    : 1'b0;

 
dffre #(513) merg_bus_reg	(cclk, reset, fwd_sched,	 fc_fifo_dout,	merg_bus);
dffre #(513) merg_bus_1_reg	(cclk, reset, srch_burst_done_2, merg_bus,	merg_bus_1);
dffre #(513) merg_bus_2_reg     (cclk, reset, srch_fio_wait_6,	 merg_bus_1,    merg_bus_2);
dffre #(513) merg_bus_3_reg	(cclk, reset, srch_fio_rd_en_4,	 merg_bus_2,	merg_bus_3);

assign merg_bus_0_hash_v1	= merg_bus[19:0];
assign merg_bus_0_rdc_tbl_num	= merg_bus[400:398];

assign merg_bus_1_fc_lookup	= merg_bus_1[498];

assign merg_bus_hash_v1		= merg_bus_3[19:0];
assign merg_bus_hash_v2		= merg_bus_3[35:20];
assign merg_bus_flow_key	= {merg_bus_3[397:36], 22'b0};
assign merg_bus_fwd_info	= merg_bus_3[512:398];

assign merg_bus_flow_key_row0	= merg_bus_flow_key[63:0];
assign merg_bus_flow_key_row1	= merg_bus_flow_key[127:64];	//IP dest addr
assign merg_bus_flow_key_row2	= merg_bus_flow_key[191:128];
assign merg_bus_flow_key_row3	= merg_bus_flow_key[255:192];	//IP source addr
assign merg_bus_flow_key_row4	= merg_bus_flow_key[319:256];
assign merg_bus_flow_key_row5	= merg_bus_flow_key[383:320];

assign merg_bus_fkey_port	= merg_bus_flow_key_row0[23:22];
assign merg_bus_fkey_protocol	= merg_bus_flow_key_row0[31:24];
assign merg_bus_fkey_ly4_1	= merg_bus_flow_key_row0[47:32];
assign merg_bus_fkey_ly4_0	= merg_bus_flow_key_row0[63:48];

assign merg_bus_fkey_vid	= merg_bus_flow_key_row5[11:0];
assign merg_bus_fkey_mac_da	= merg_bus_flow_key_row5[59:12];
assign merg_bus_fkey_vlan_valid = merg_bus_flow_key_row5[63:60];
	
assign merg_bus_rdc_tbl_num	= merg_bus_fwd_info[2:0];
assign merg_bus_cam_match	= merg_bus_fwd_info[3];
assign merg_bus_drop_pkt	= merg_bus_fwd_info[4];
assign merg_bus_ether_type      = merg_bus_fwd_info[6:5];
assign merg_bus_l4_protocol     = merg_bus_fwd_info[8:7];
assign merg_bus_badip           = merg_bus_fwd_info[9];
assign merg_bus_noport          = merg_bus_fwd_info[10];
assign merg_bus_llcnsap         = merg_bus_fwd_info[11];
assign merg_bus_vlan            = merg_bus_fwd_info[12];
assign merg_bus_class           = merg_bus_fwd_info[17:13];
assign merg_bus_ph_match        = merg_bus_fwd_info[18];
assign merg_bus_promis          = merg_bus_fwd_info[19];

assign merg_bus_ip_hdr_len      = merg_bus_fwd_info[23:20];
assign merg_bus_ip_pkt_len      = merg_bus_fwd_info[39:24];
assign merg_bus_tcp_hdr_len     = merg_bus_fwd_info[43:40];
assign merg_bus_tcp_push_bit    = merg_bus_fwd_info[44];
assign merg_bus_tcp_seq_num     = merg_bus_fwd_info[76:45];
assign merg_bus_pkt_id          = merg_bus_fwd_info[80:77];
assign merg_bus_rdc_tbl_offset	= merg_bus_fwd_info[85:81];
assign merg_bus_valid_tres	= merg_bus_fwd_info[87:86];
assign merg_bus_valid_zcopy	= merg_bus_fwd_info[88];
assign merg_bus_valid_cam_haddr	= merg_bus_fwd_info[98:89]; 
assign merg_bus_am_parity_err	= merg_bus_fwd_info[99];
assign merg_bus_fc_lookup	= merg_bus_fwd_info[100];
assign merg_bus_mac_port	= merg_bus_fwd_info[102:101];
assign merg_bus_zcopy_id	= merg_bus_fwd_info[114:103];

/**********************************/
//Merge and Compare Function
/**********************************/

/**************/
//subarea0
/**************/
assign sub0_fmt			= fc_din_reg_dout_r1[63];
assign sub0_ext			= fc_din_reg_dout_r1[62];
assign sub0_valid		= fc_din_reg_dout_r1[61];
assign sub0_mac_da		= fc_din_reg_dout_r1[59:12];
assign sub0_vid			= fc_din_reg_dout_r1[11:0];

assign sub0_rdc_offset		= fc_din_reg_dout_r1[60:56];
assign sub0_hash_v2		= fc_din_reg_dout_r1[55:40];
assign sub0_usr_info		= fc_din_reg_dout_r1[39:0];

/*******************************************************/

assign sub0_mac_da_comp0	= (sub0_mac_da[11:0]  == merg_bus_fkey_mac_da[11:0]);
assign sub0_mac_da_comp1	= (sub0_mac_da[23:12] == merg_bus_fkey_mac_da[23:12]);
assign sub0_mac_da_comp2	= (sub0_mac_da[35:24] == merg_bus_fkey_mac_da[35:24]);
assign sub0_mac_da_comp3	= (sub0_mac_da[47:36] == merg_bus_fkey_mac_da[47:36]);
assign sub0_vlan_match		= (sub0_vid == merg_bus_fkey_vid) | (merg_bus_fkey_vlan_valid == 4'b0000);

assign sub0_hash_v2_match	= (sub0_hash_v2 == merg_bus_hash_v2);

/*******************************************************/

assign sub0_v4_ext_match	= sub0_valid & merg_bus_ether_type[0] & (!sub0_fmt) & sub0_ext;
assign sub0_v6_ext_match	= sub0_valid & merg_bus_ether_type[1] & sub0_fmt & sub0_ext;

assign sub0_ip_version_match	= (merg_bus_ether_type[0] & (!sub0_fmt) | merg_bus_ether_type[1] & sub0_fmt);
assign sub0_is_opt_match	= sub0_valid & (!sub0_ext) & sub0_ip_version_match; 
assign sub0_opt_match		= sub0_hash_v2_match & sub0_is_opt_match;

assign v4_comp_reg_en0		= merge_func_cyc0 | (merge_func_cyc4 & !sub0_v6_ext_match_r);

/*******************************************************/

dffre #(1) sub0_v4_ext_match_reg	(cclk, reset, merge_func_cyc0,	sub0_v4_ext_match,	sub0_v4_ext_match_r);
dffre #(1) sub0_v6_ext_match_reg	(cclk, reset, merge_func_cyc0,  sub0_v6_ext_match,      sub0_v6_ext_match_r);
dffre #(1) sub0_opt_match_reg		(cclk, reset, merge_func_cyc0, 	sub0_opt_match,		sub0_opt_match_r);

dffre #(1) sub0_mac_da_comp0_reg	(cclk, reset, v4_comp_reg_en0,  sub0_mac_da_comp0,	sub0_mac_da_comp0_r);
dffre #(1) sub0_mac_da_comp1_reg	(cclk, reset, v4_comp_reg_en0,  sub0_mac_da_comp1,	sub0_mac_da_comp1_r);
dffre #(1) sub0_mac_da_comp2_reg	(cclk, reset, v4_comp_reg_en0,  sub0_mac_da_comp2,      sub0_mac_da_comp2_r);
dffre #(1) sub0_mac_da_comp3_reg	(cclk, reset, v4_comp_reg_en0,  sub0_mac_da_comp3,      sub0_mac_da_comp3_r);
dffre #(1) sub0_vlan_match_reg		(cclk, reset, v4_comp_reg_en0,  sub0_vlan_match,	sub0_vlan_match_r);

dffre #(1) sub4_v4_ext_match_reg        (cclk, reset, merge_func_cyc4,  sub0_v4_ext_match,      sub4_v4_ext_match_r);

/**************/
//subarea1
/**************/
assign sub0_mac_da_match	= sub0_mac_da_comp0_r & sub0_mac_da_comp1_r & sub0_mac_da_comp2_r & sub0_mac_da_comp3_r;

assign sub1_v4_src_addr		= fc_din_reg_dout_r1[63:32];
assign sub1_v4_dest_addr	= fc_din_reg_dout_r1[31:0];

assign sub1_v6_src_addr_u	= fc_din_reg_dout_r1[63:0];

assign sub1_fmt                 = fc_din_reg_dout_r1[63];
assign sub1_ext                 = fc_din_reg_dout_r1[62];
assign sub1_valid               = fc_din_reg_dout_r1[61];
assign sub1_hash_v2		= fc_din_reg_dout_r1[55:40];

/********************************************************/

assign sub1_v4_src_addr_comp0	= (sub1_v4_src_addr[15:0]   == merg_bus_flow_key_row3[15:0]);
assign sub1_v4_src_addr_comp1	= (sub1_v4_src_addr[31:16]  == merg_bus_flow_key_row3[31:16]);
assign sub1_v4_dest_addr_comp0	= (sub1_v4_dest_addr[15:0]  == merg_bus_flow_key_row1[15:0]);
assign sub1_v4_dest_addr_comp1	= (sub1_v4_dest_addr[31:16] == merg_bus_flow_key_row1[31:16]);

assign sub1_v6_src_addr_u_comp0	= (sub1_v6_src_addr_u[15:0]  == merg_bus_flow_key_row4[15:0]);
assign sub1_v6_src_addr_u_comp1	= (sub1_v6_src_addr_u[31:16] == merg_bus_flow_key_row4[31:16]);
assign sub1_v6_src_addr_u_comp2	= (sub1_v6_src_addr_u[47:32] == merg_bus_flow_key_row4[47:32]);
assign sub1_v6_src_addr_u_comp3	= (sub1_v6_src_addr_u[63:48] == merg_bus_flow_key_row4[63:48]);

assign sub1_hash_v2_match       = (sub1_hash_v2 == merg_bus_hash_v2);

/*******************************************************/

assign sub1_ip_version_match    = (merg_bus_ether_type[0] & (!sub1_fmt) | merg_bus_ether_type[1] & sub1_fmt);
assign sub1_is_opt_match        = sub1_valid & (!sub1_ext) & sub1_ip_version_match;
assign sub1_opt_match           = sub1_hash_v2_match & sub1_is_opt_match;

assign v4_comp_reg_en1          = merge_func_cyc1 | (merge_func_cyc5 & !sub0_v6_ext_match_r);
 
/*******************************************************/

dffre #(1) sub0_mac_da_match_reg	(cclk, reset, v4_comp_reg_en1, sub0_mac_da_match,	sub0_mac_da_match_r);

dffre #(1) sub1_v4_src_addr_comp0_reg	(cclk, reset, v4_comp_reg_en1, sub1_v4_src_addr_comp0,	sub1_v4_src_addr_comp0_r);
dffre #(1) sub1_v4_src_addr_comp1_reg	(cclk, reset, v4_comp_reg_en1, sub1_v4_src_addr_comp1,  sub1_v4_src_addr_comp1_r);
dffre #(1) sub1_v4_dest_addr_comp0_reg	(cclk, reset, v4_comp_reg_en1, sub1_v4_dest_addr_comp0,	sub1_v4_dest_addr_comp0_r);
dffre #(1) sub1_v4_dest_addr_comp1_reg	(cclk, reset, v4_comp_reg_en1, sub1_v4_dest_addr_comp1,	sub1_v4_dest_addr_comp1_r);

dffre #(1) sub1_v6_src_addr_u_comp0_reg	(cclk, reset, merge_func_cyc1, sub1_v6_src_addr_u_comp0,sub1_v6_src_addr_u_comp0_r);
dffre #(1) sub1_v6_src_addr_u_comp1_reg	(cclk, reset, merge_func_cyc1, sub1_v6_src_addr_u_comp1,sub1_v6_src_addr_u_comp1_r);
dffre #(1) sub1_v6_src_addr_u_comp2_reg (cclk, reset, merge_func_cyc1, sub1_v6_src_addr_u_comp2,sub1_v6_src_addr_u_comp2_r);
dffre #(1) sub1_v6_src_addr_u_comp3_reg (cclk, reset, merge_func_cyc1, sub1_v6_src_addr_u_comp3,sub1_v6_src_addr_u_comp3_r);

dffre #(1) sub1_opt_match_reg		(cclk, reset, merge_func_cyc1, sub1_opt_match,       	sub1_opt_match_r);

/**************/
//subarea2
/**************/
assign sub1_v4_src_addr_match	= sub1_v4_src_addr_comp0_r & sub1_v4_src_addr_comp1_r;
assign sub1_v4_dest_addr_match	= sub1_v4_dest_addr_comp0_r & sub1_v4_dest_addr_comp1_r;
assign sub1_v6_src_addr_u_match	= sub1_v6_src_addr_u_comp0_r & sub1_v6_src_addr_u_comp1_r &
				  sub1_v6_src_addr_u_comp2_r & sub1_v6_src_addr_u_comp3_r;

/******************************************************/

assign sub2_ly4_0		= fc_din_reg_dout_r1[63:48];
assign sub2_ly4_1		= fc_din_reg_dout_r1[47:32];
assign sub2_protocol		= fc_din_reg_dout_r1[31:24];
assign sub2_port		= fc_din_reg_dout_r1[23:22];

assign sub2_v6_src_addr_l	= fc_din_reg_dout_r1[63:0];

assign sub2_fmt                 = fc_din_reg_dout_r1[63];
assign sub2_ext                 = fc_din_reg_dout_r1[62];
assign sub2_valid               = fc_din_reg_dout_r1[61];
assign sub2_hash_v2             = fc_din_reg_dout_r1[55:40];

/*******************************************************/
assign sub2_ly4_0_match		= (sub2_ly4_0   == merg_bus_fkey_ly4_0);
assign sub2_ly4_1_match		= (sub2_ly4_1   == merg_bus_fkey_ly4_1);
assign sub2_protocol_match	= (sub2_protocol == merg_bus_fkey_protocol);
assign sub2_port_match		= (sub2_port    == merg_bus_fkey_port);

assign sub2_v6_src_addr_l_comp0 = (sub2_v6_src_addr_l[15:0]  == merg_bus_flow_key_row3[15:0]);
assign sub2_v6_src_addr_l_comp1 = (sub2_v6_src_addr_l[31:16] == merg_bus_flow_key_row3[31:16]);
assign sub2_v6_src_addr_l_comp2 = (sub2_v6_src_addr_l[47:32] == merg_bus_flow_key_row3[47:32]);
assign sub2_v6_src_addr_l_comp3 = (sub2_v6_src_addr_l[63:48] == merg_bus_flow_key_row3[63:48]);

assign sub2_hash_v2_match       = (sub2_hash_v2 == merg_bus_hash_v2); 

/*******************************************************/

assign sub2_ip_version_match    = (merg_bus_ether_type[0] & (!sub2_fmt) | merg_bus_ether_type[1] & sub2_fmt);
assign sub2_is_opt_match        = sub2_valid & (!sub2_ext) & sub2_ip_version_match;
assign sub2_opt_match           = sub2_hash_v2_match & sub2_is_opt_match;

assign v4_comp_reg_en2          = merge_func_cyc2 | (merge_func_cyc6 & !sub0_v6_ext_match_r) ;
assign v6_comp_reg_en2		= merge_func_cyc2 | merge_func_cyc5 | merge_func_cyc6;

/*******************************************************/


dffre #(1) sub1_v4_src_addr_match_reg   (cclk, reset, v4_comp_reg_en2, sub1_v4_src_addr_match,  sub1_v4_src_addr_match_r);
dffre #(1) sub1_v4_dest_addr_match_reg  (cclk, reset, v4_comp_reg_en2, sub1_v4_dest_addr_match, sub1_v4_dest_addr_match_r);

dffre #(1) sub1_v6_src_addr_u_match_reg (cclk, reset, merge_func_cyc2, sub1_v6_src_addr_u_match,sub1_v6_src_addr_u_match_r);

dffre #(1) sub2_ly4_0_match_reg         (cclk, reset, v6_comp_reg_en2, sub2_ly4_0_match, 	sub2_ly4_0_match_r);
dffre #(1) sub2_ly4_1_match_reg  	(cclk, reset, v6_comp_reg_en2, sub2_ly4_1_match, 	sub2_ly4_1_match_r);
dffre #(1) sub2_protocol_match_reg	(cclk, reset, v6_comp_reg_en2, sub2_protocol_match,	sub2_protocol_match_r);
dffre #(1) sub2_port_match_reg		(cclk, reset, v6_comp_reg_en2, sub2_port_match,		sub2_port_match_r);

dffre #(1) sub2_v6_src_addr_l_comp0_reg (cclk, reset, merge_func_cyc2, sub2_v6_src_addr_l_comp0,sub2_v6_src_addr_l_comp0_r);
dffre #(1) sub2_v6_src_addr_l_comp1_reg (cclk, reset, merge_func_cyc2, sub2_v6_src_addr_l_comp1,sub2_v6_src_addr_l_comp1_r);
dffre #(1) sub2_v6_src_addr_l_comp2_reg (cclk, reset, merge_func_cyc2, sub2_v6_src_addr_l_comp2,sub2_v6_src_addr_l_comp2_r);
dffre #(1) sub2_v6_src_addr_l_comp3_reg (cclk, reset, merge_func_cyc2, sub2_v6_src_addr_l_comp3,sub2_v6_src_addr_l_comp3_r);

dffre #(1) sub2_opt_match_reg           (cclk, reset, merge_func_cyc2, sub2_opt_match,       	sub2_opt_match_r);


/**************/
//subarea3
/**************/
assign sub2_v6_src_addr_l_match = sub2_v6_src_addr_l_comp0_r & sub2_v6_src_addr_l_comp1_r &
                                  sub2_v6_src_addr_l_comp2_r & sub2_v6_src_addr_l_comp3_r;

assign sub3_v4_ext_match_tmp	= sub0_vlan_match_r & sub0_mac_da_match_r  &
				  sub1_v4_src_addr_match_r & sub1_v4_dest_addr_match_r &
				  sub2_ly4_0_match_r & sub2_ly4_1_match_r &
				  sub2_protocol_match_r  & sub2_port_match_r;

assign sub3_v4_ext_match_all	= sub3_v4_ext_match_tmp & sub0_v4_ext_match_r;
assign sub7_v4_ext_match_all    = sub3_v4_ext_match_tmp & sub4_v4_ext_match_r;

/*****************************************************/

assign sub3_rdc_offset		= fc_din_reg_dout_r1[60:56];
assign sub3_zcopy_valid		= fc_din_reg_dout_r1[55];
assign sub3_zcopy_id		= fc_din_reg_dout_r1[51:40];
assign sub3_usr_info		= fc_din_reg_dout_r1[39:0];

assign sub3_v6_dst_addr_u	= fc_din_reg_dout_r1[63:0];

assign sub3_fmt                 = fc_din_reg_dout_r1[63];
assign sub3_ext                 = fc_din_reg_dout_r1[62];
assign sub3_valid               = fc_din_reg_dout_r1[61];
assign sub3_hash_v2             = fc_din_reg_dout_r1[55:40];

/*****************************************************/

assign sub3_v6_dst_addr_u_comp0	= (sub3_v6_dst_addr_u[15:0]  == merg_bus_flow_key_row2[15:0]);
assign sub3_v6_dst_addr_u_comp1 = (sub3_v6_dst_addr_u[31:16] == merg_bus_flow_key_row2[31:16]);
assign sub3_v6_dst_addr_u_comp2 = (sub3_v6_dst_addr_u[47:32] == merg_bus_flow_key_row2[47:32]);
assign sub3_v6_dst_addr_u_comp3 = (sub3_v6_dst_addr_u[63:48] == merg_bus_flow_key_row2[63:48]);

assign sub3_hash_v2_match       = (sub3_hash_v2 == merg_bus_hash_v2); 

/*******************************************************/

assign sub3_ip_version_match    = (merg_bus_ether_type[0] & (!sub3_fmt) | merg_bus_ether_type[1] & sub3_fmt);
assign sub3_is_opt_match        = sub3_valid & (!sub3_ext) & sub3_ip_version_match;
assign sub3_opt_match           = sub3_hash_v2_match & sub3_is_opt_match;

/******************************************************/

dffre #(1) sub2_v6_src_addr_l_match_reg	(cclk, reset, merge_func_cyc3, sub2_v6_src_addr_l_match,sub2_v6_src_addr_l_match_r);

dffre #(1) sub3_v6_dst_addr_u_comp0_reg (cclk, reset, merge_func_cyc3, sub3_v6_dst_addr_u_comp0,sub3_v6_dst_addr_u_comp0_r);
dffre #(1) sub3_v6_dst_addr_u_comp1_reg (cclk, reset, merge_func_cyc3, sub3_v6_dst_addr_u_comp1,sub3_v6_dst_addr_u_comp1_r);
dffre #(1) sub3_v6_dst_addr_u_comp2_reg (cclk, reset, merge_func_cyc3, sub3_v6_dst_addr_u_comp2,sub3_v6_dst_addr_u_comp2_r);
dffre #(1) sub3_v6_dst_addr_u_comp3_reg (cclk, reset, merge_func_cyc3, sub3_v6_dst_addr_u_comp3,sub3_v6_dst_addr_u_comp3_r);

dffre #(1) sub3_v4_ext_match_all_reg	(cclk, reset, merge_func_cyc3, sub3_v4_ext_match_all,	sub3_v4_ext_match_all_r);
//dffre #(1) sub7_v4_ext_match_all_reg	(cclk, reset, merge_func_cyc7, sub3_v4_ext_match_all,   sub7_v4_ext_match_all_r);
dffre #(1) sub3_opt_match_reg		(cclk, reset, merge_func_cyc3, sub3_opt_match,          sub3_opt_match_r);

/**************/
//subarea4
/**************/
assign sub3_v6_dst_addr_u_match = sub3_v6_dst_addr_u_comp0_r & sub3_v6_dst_addr_u_comp1_r &
                                  sub3_v6_dst_addr_u_comp2_r & sub3_v6_dst_addr_u_comp3_r;

/*****************************************************/

assign sub4_v6_dst_addr_l       = fc_din_reg_dout_r1[63:0];

assign sub4_fmt                 = fc_din_reg_dout_r1[63];
assign sub4_ext                 = fc_din_reg_dout_r1[62];
assign sub4_valid               = fc_din_reg_dout_r1[61];
assign sub4_hash_v2             = fc_din_reg_dout_r1[55:40];

/*****************************************************/

assign sub4_v6_dst_addr_l_comp0 = (sub4_v6_dst_addr_l[15:0]  == merg_bus_flow_key_row1[15:0]);
assign sub4_v6_dst_addr_l_comp1 = (sub4_v6_dst_addr_l[31:16] == merg_bus_flow_key_row1[31:16]);
assign sub4_v6_dst_addr_l_comp2 = (sub4_v6_dst_addr_l[47:32] == merg_bus_flow_key_row1[47:32]);
assign sub4_v6_dst_addr_l_comp3 = (sub4_v6_dst_addr_l[63:48] == merg_bus_flow_key_row1[63:48]);

assign sub4_hash_v2_match       = (sub4_hash_v2 == merg_bus_hash_v2);

/*******************************************************/

assign sub4_ip_version_match    = (merg_bus_ether_type[0] & (!sub4_fmt) | merg_bus_ether_type[1] & sub4_fmt);
assign sub4_is_opt_match        = sub4_valid & (!sub4_ext) & sub4_ip_version_match;
assign sub4_opt_match           = sub4_hash_v2_match & sub4_is_opt_match;

/******************************************************/

dffre #(1) sub3_v6_dst_addr_u_match_reg (cclk, reset, merge_func_cyc4, sub3_v6_dst_addr_u_match,sub3_v6_dst_addr_u_match_r);

dffre #(1) sub4_v6_dst_addr_l_comp0_reg (cclk, reset, merge_func_cyc4, sub4_v6_dst_addr_l_comp0,sub4_v6_dst_addr_l_comp0_r);
dffre #(1) sub4_v6_dst_addr_l_comp1_reg (cclk, reset, merge_func_cyc4, sub4_v6_dst_addr_l_comp1,sub4_v6_dst_addr_l_comp1_r);
dffre #(1) sub4_v6_dst_addr_l_comp2_reg (cclk, reset, merge_func_cyc4, sub4_v6_dst_addr_l_comp2,sub4_v6_dst_addr_l_comp2_r);
dffre #(1) sub4_v6_dst_addr_l_comp3_reg (cclk, reset, merge_func_cyc4, sub4_v6_dst_addr_l_comp3,sub4_v6_dst_addr_l_comp3_r);

dffre #(1) sub4_opt_match_reg           (cclk, reset, merge_func_cyc4, sub4_opt_match,          sub4_opt_match_r);

/**************/
//subarea5
/**************/
assign sub4_v6_dst_addr_l_match = sub4_v6_dst_addr_l_comp0_r & sub4_v6_dst_addr_l_comp1_r &
                                  sub4_v6_dst_addr_l_comp2_r & sub4_v6_dst_addr_l_comp3_r;


/*****************************************************/

assign sub5_fmt                 = fc_din_reg_dout_r1[63];
assign sub5_ext                 = fc_din_reg_dout_r1[62];
assign sub5_valid               = fc_din_reg_dout_r1[61];
assign sub5_hash_v2             = fc_din_reg_dout_r1[55:40];

/*****************************************************/

assign sub5_hash_v2_match       = (sub5_hash_v2 == merg_bus_hash_v2);
assign sub5_ip_version_match    = (merg_bus_ether_type[0] & (!sub5_fmt) | merg_bus_ether_type[1] & sub5_fmt);
assign sub5_is_opt_match        = sub5_valid & (!sub5_ext) & sub5_ip_version_match;
assign sub5_opt_match           = sub5_hash_v2_match & sub5_is_opt_match;

/******************************************************/

dffre #(1) sub4_v6_dst_addr_l_match_reg (cclk, reset, merge_func_cyc5, sub4_v6_dst_addr_l_match,sub4_v6_dst_addr_l_match_r);

dffre #(1) sub5_opt_match_reg           (cclk, reset, merge_func_cyc5, sub5_opt_match,          sub5_opt_match_r);


/**************/
//subarea6
/**************/
assign sub6_v6_ext_match_all	= sub0_v6_ext_match_r        & sub0_vlan_match_r          & sub0_mac_da_match_r  &
                                  sub1_v6_src_addr_u_match_r & sub2_v6_src_addr_l_match_r & 
				  sub3_v6_dst_addr_u_match_r & sub4_v6_dst_addr_l_match_r &
				  sub2_ly4_0_match_r  	     & sub2_ly4_1_match_r         & 
				  sub2_protocol_match_r       & sub2_port_match_r; 

/*****************************************************/

assign sub6_fmt                 = fc_din_reg_dout_r1[63];
assign sub6_ext                 = fc_din_reg_dout_r1[62];
assign sub6_valid               = fc_din_reg_dout_r1[61];
assign sub6_hash_v2             = fc_din_reg_dout_r1[55:40];

/*****************************************************/

assign sub6_hash_v2_match       = (sub6_hash_v2 == merg_bus_hash_v2);
assign sub6_ip_version_match    = (merg_bus_ether_type[0] & (!sub6_fmt) | merg_bus_ether_type[1] & sub6_fmt);
assign sub6_is_opt_match        = sub6_valid & (!sub6_ext) & sub6_ip_version_match;
assign sub6_opt_match           = sub6_hash_v2_match & sub6_is_opt_match;

/******************************************************/

dffre #(1) sub6_v6_ext_match_all_reg	(cclk, reset, merge_func_cyc6, sub6_v6_ext_match_all,   sub6_v6_ext_match_all_r);
dffre #(1) sub6_opt_match_reg		(cclk, reset, merge_func_cyc6, sub6_opt_match,          sub6_opt_match_r);

/**************/
//subarea7
/**************/
assign sub7_fmt                 = fc_din_reg_dout_r1[63];
assign sub7_ext                 = fc_din_reg_dout_r1[62];
assign sub7_valid               = fc_din_reg_dout_r1[61];
assign sub7_hash_v2             = fc_din_reg_dout_r1[55:40];

/*****************************************************/

assign sub7_hash_v2_match       = (sub7_hash_v2 == merg_bus_hash_v2);
assign sub7_ip_version_match    = (merg_bus_ether_type[0] & (!sub7_fmt) | merg_bus_ether_type[1] & sub7_fmt);
assign sub7_is_opt_match        = sub7_valid & (!sub7_ext) & sub7_ip_version_match;
assign sub7_opt_match           = sub7_hash_v2_match & sub7_is_opt_match;

/******************************************************/

dffre #(1) sub7_opt_match_reg           (cclk, reset, merge_func_cyc7, sub7_opt_match,          sub7_opt_match_r);

/*******************/
//Exect Match
/*******************/
assign exect_match		= sub3_v4_ext_match_all_r | sub6_v6_ext_match_all_r | sub7_v4_ext_match_all;
assign ext_sub_addr		= (sub3_v4_ext_match_all_r | sub6_v6_ext_match_all_r) ? 3'b000 : 3'b100;
assign ext_info_reg_en		= (merge_func_cyc3 | 
				  (merge_func_cyc6 & !sub3_v4_ext_match_all_r) | 
				  (merge_func_cyc7 & !(sub3_v4_ext_match_all_r | sub6_v6_ext_match_all_r)));

dffre #(1)  exect_match_reg	(cclk, reset, merge_func_cyc7,	exect_match,	  exect_match_r);
dffre #(3)  ext_sub_addr_reg	(cclk, reset, merge_func_cyc7,  ext_sub_addr,	  ext_sub_addr_r);
dffre #(1)  ext_zcopy_valid_reg (cclk, reset, ext_info_reg_en,  sub3_zcopy_valid, ext_zcopy_valid_r);
dffre #(12) ext_zcopy_id_reg	(cclk, reset, ext_info_reg_en,	sub3_zcopy_id,	  ext_zcopy_id_r);
dffre #(5)  ext_rdc_offset_reg	(cclk, reset, ext_info_reg_en,  sub3_rdc_offset,  ext_rdc_offset_r);
dffre #(40) ext_usr_info_reg	(cclk, reset, ext_info_reg_en,  sub3_usr_info,	  ext_usr_info_r); 


/*******************/
//Optimistic Match
/*******************/
assign opt_match		= sub4_opt_match_r | sub5_opt_match_r | sub6_opt_match_r | sub7_opt_match_r | 
				  sub4_opt_match4_r;		
assign opt_match_array		= {sub7_opt_match_r, sub6_opt_match_r, sub5_opt_match_r, sub4_opt_match_r,
				   sub3_opt_match_r, sub2_opt_match_r, sub1_opt_match_r, sub0_opt_match_r};

assign sub4_opt_match4		= sub0_opt_match_r | sub1_opt_match_r | sub2_opt_match_r | sub3_opt_match_r;
assign sub7_opt_no_match1	= !sub0_opt_match_r;
assign sub7_opt_no_match2	= !(sub0_opt_match_r | sub1_opt_match_r);
assign sub7_opt_no_match3	= !(sub0_opt_match_r | sub1_opt_match_r | sub2_opt_match_r);
assign sub7_opt_no_match4	= !(sub0_opt_match_r | sub1_opt_match_r | sub2_opt_match_r | sub3_opt_match_r);
assign sub7_opt_no_match5	= !(sub4_opt_match4_r | sub4_opt_match_r);
assign sub7_opt_no_match6	= !(sub4_opt_match4_r | sub4_opt_match_r | sub5_opt_match_r);
assign sub7_opt_no_match7	= !(sub4_opt_match4_r | sub4_opt_match_r | sub5_opt_match_r | sub6_opt_match_r);

assign opt_info_reg_en		= (merge_func_cyc7 & sub7_opt_no_match7) |
				  (merge_func_cyc6 & sub7_opt_no_match6) |
				  (merge_func_cyc5 & sub7_opt_no_match5) |
				  (merge_func_cyc4 & sub7_opt_no_match4) |
				  (merge_func_cyc3 & sub7_opt_no_match3) |
				  (merge_func_cyc2 & sub7_opt_no_match2) |
				  (merge_func_cyc1 & sub7_opt_no_match1) |
				   merge_func_cyc0;

always @(opt_match_array)
begin

casex (opt_match_array)
// 0in < case -full -parallel -message "0in ERROR: case check in fflp_merge_func"

8'bxxxxxxx1:	opt_sub_addr	= 3'b000;
8'bxxxxxx10:	opt_sub_addr	= 3'b001;
8'bxxxxx100:	opt_sub_addr	= 3'b010;
8'bxxxx1000:	opt_sub_addr	= 3'b011;
8'bxxx10000:	opt_sub_addr	= 3'b100;
8'bxx100000:	opt_sub_addr	= 3'b101;
8'bx1000000:	opt_sub_addr	= 3'b110;
8'b10000000:	opt_sub_addr	= 3'b111;
default:	opt_sub_addr	= 3'b000;

endcase

end

dffre #(1)  sub4_opt_match4_reg	(cclk, reset, merge_func_cyc4,  sub4_opt_match4, sub4_opt_match4_r);
dffre #(5)  opt_rdc_offset_reg  (cclk, reset, opt_info_reg_en,  sub0_rdc_offset, opt_rdc_offset_r); 
dffre #(40) opt_usr_info_reg    (cclk, reset, opt_info_reg_en,  sub0_usr_info,   opt_usr_info_r);


/***********************************************/
//Merge Matches, one cycle after merge_func_cyc7
/***********************************************/
assign opt_match_v	= opt_match & merg_bus_fc_lookup_r & !ecc_uncor_err;
assign exect_match_v	= exect_match_r & merg_bus_fc_lookup_r & !ecc_uncor_err;

assign fram_hash_match	= opt_match_v | exect_match_v;
assign fram_sub_addr	= exect_match_v ? ext_sub_addr_r	: opt_match_v ? opt_sub_addr     : 3'b0;
assign fram_zcopy_valid	= exect_match_v ? ext_zcopy_valid_r 	: 1'b0;
assign fram_zcopy_id	= exect_match_v ? ext_zcopy_id_r 	: 12'b0;
assign fram_rdc_offset	= exect_match_v ? ext_rdc_offset_r 	: opt_match_v ? opt_rdc_offset_r : 5'b0;  
assign fram_usr_info	= exect_match_v ? ext_usr_info_r	: opt_match_v ? opt_usr_info_r   : 40'b0;


assign fwd_l2_class	= !(merg_bus_class[2] | merg_bus_class[3]) | merg_bus_class[4];

assign fwd_rdc_offset	= (fwd_l2_class_r | merg_bus_valid_tres_bit0_r) ? merg_bus_rdc_tbl_offset_r[4:0] :
			  ecc_uncor_err				  	? 5'b0 :
			  fram_hash_match       		  	? fram_rdc_offset[4:0] :
						  		    	  merg_bus_hash_v1_lsb_r[4:0];

assign fwd_zcopy_id	= merg_bus_fc_lookup_r   ? fram_zcopy_id : 
			  merg_bus_valid_zcopy_r ? merg_bus_zcopy_id_r : 12'b0;

assign fwd_l4_protocol	= (|merg_bus_ether_type) ? merg_bus_l4_protocol   : 2'b00; //at merge_func_cyc7
assign fwd_hash_v1	= (|merg_bus_ether_type) ? merg_bus_hash_v1[19:0] : 20'b0; //at merge_func_cyc7
assign fwd_hash_v2	= (|merg_bus_ether_type) ? merg_bus_hash_v2       : 16'b0; //at merge_func_cyc7

assign fflp_hdw_err	= merg_bus_am_parity_err | (!fio_no_fatal_err) | 
			  ecc_uncor_err          | ecc_check_err_r1;		//at merge_func_cyc7

dffre #(1)  merg_bus_fc_lookup_r_reg	(cclk, reset, merge_func_cyc7, merg_bus_fc_lookup,	merg_bus_fc_lookup_r);
dffre #(1)  fwd_l2_class_r_reg		(cclk, reset, merge_func_cyc7, fwd_l2_class,		fwd_l2_class_r);
dffre #(5)  merg_bus_rdc_offset_r_reg 	(cclk, reset, merge_func_cyc7, merg_bus_rdc_tbl_offset,	merg_bus_rdc_tbl_offset_r);
dffre #(1)  merg_bus_valid_tres_r_reg	(cclk, reset, merge_func_cyc7, merg_bus_valid_tres[0],	merg_bus_valid_tres_bit0_r);
dffre #(5)  merg_bus_hash_v1_r_reg	(cclk, reset, merge_func_cyc7, merg_bus_hash_v1[4:0],	merg_bus_hash_v1_lsb_r);
dffre #(1)  merg_bus_valid_zcopy_r_reg	(cclk, reset, merge_func_cyc7, merg_bus_valid_zcopy,	merg_bus_valid_zcopy_r);
dffre #(12) merg_bus_zcopy_id_r_reg	(cclk, reset, merge_func_cyc7, merg_bus_zcopy_id,	merg_bus_zcopy_id_r);

/*******************/
//Forward Decision
/*******************/
assign byte0    = {merg_bus_mac_port, merg_bus_ph_match, merg_bus_class};
assign byte1    = {merg_bus_vlan, merg_bus_llcnsap, merg_bus_noport, merg_bus_badip,
                   merg_bus_cam_match, merg_bus_valid_tres, merg_bus_valid_zcopy};

assign byte2    = {merg_bus_rdc_tbl_num_r, fwd_rdc_offset_r};

assign byte3    = merg_bus_valid_cam_haddr[7:0];
assign byte4    = {2'b0, fram_hash_match, exect_match_v, fram_zcopy_valid, fram_sub_addr};

assign byte5    = 8'b0;	//reserved for zcp to use

assign byte6    = {merg_bus_promis, fflp_hdw_err, merg_bus_drop_pkt, merg_bus_tcp_push_bit, fwd_zcopy_id[11:8]};
assign byte7    = fwd_zcopy_id[7:0];

assign byte8    = fwd_hash_v2[15:8]; 
assign byte9    = fwd_hash_v2[7:0];
assign byte10   = {4'b0, fwd_hash_v1[19:16]};
assign byte11   = fwd_hash_v1[15:8];
assign byte12   = fwd_hash_v1[7:0];

assign byte13   = fram_usr_info[39:32];
assign byte14   = fram_usr_info[31:24];
assign byte15   = fram_usr_info[23:16];
assign byte16   = fram_usr_info[15:8];
assign byte17   = fram_usr_info[7:0];

assign byte18   = {1'b0, merg_bus_ether_type[1], merg_bus_pkt_id, fwd_l4_protocol};
assign byte19	= 8'b0;
assign byte20   = merg_bus_ip_pkt_len[15:8];
assign byte21   = merg_bus_ip_pkt_len[7:0];
assign byte22   = {merg_bus_ip_hdr_len, merg_bus_tcp_hdr_len};
assign byte23   = merg_bus_tcp_seq_num[31:24];
assign byte24   = merg_bus_tcp_seq_num[23:16];
assign byte25   = merg_bus_tcp_seq_num[15:8];
assign byte26   = merg_bus_tcp_seq_num[7:0];

dffre #(8) byte0_reg	(cclk, reset, merge_func_cyc7, byte0,		byte0_r);
dffre #(8) byte1_reg	(cclk, reset, merge_func_cyc7, byte1,  		byte1_r);

dffre #(5) rdc_offset_reg(cclk, reset, pre_zcp_wr,      fwd_rdc_offset,         fwd_rdc_offset_r);
dffre #(3) rdc_num_reg   (cclk, reset, merge_func_cyc7, merg_bus_rdc_tbl_num,   merg_bus_rdc_tbl_num_r);

dffre #(8) byte3_reg	(cclk, reset, merge_func_cyc7, byte3,  		byte3_r);
dffre #(8) byte4_reg	(cclk, reset, pre_zcp_wr,      byte4,		byte4_r);

dffre #(4) byte6_reg_h  (cclk, reset, merge_func_cyc7, byte6[7:4],      byte6_r[7:4]); 
dffre #(4) byte6_reg_l  (cclk, reset, pre_zcp_wr,      byte6[3:0],      byte6_r[3:0]); 

dffre #(8) byte7_reg	(cclk, reset, pre_zcp_wr,      byte7,  		byte7_r);
dffre #(8) byte8_reg	(cclk, reset, merge_func_cyc7, byte8,  		byte8_r);
dffre #(8) byte9_reg    (cclk, reset, merge_func_cyc7, byte9,  		byte9_r);
dffre #(8) byte10_reg	(cclk, reset, merge_func_cyc7, byte10, 		byte10_r);
dffre #(8) byte11_reg	(cclk, reset, merge_func_cyc7, byte11, 		byte11_r);
dffre #(8) byte12_reg	(cclk, reset, merge_func_cyc7, byte12, 		byte12_r);
dffre #(8) byte13_reg	(cclk, reset, pre_zcp_wr,      byte13, 		byte13_r);
dffre #(8) byte14_reg	(cclk, reset, pre_zcp_wr,      byte14, 		byte14_r);
dffre #(8) byte15_reg	(cclk, reset, pre_zcp_wr,      byte15, 		byte15_r);
dffre #(8) byte16_reg	(cclk, reset, pre_zcp_wr,      byte16, 		byte16_r);
dffre #(8) byte17_reg	(cclk, reset, pre_zcp_wr,      byte17, 		byte17_r);
dffre #(8) byte18_reg   (cclk, reset, merge_func_cyc7, byte18, 		byte18_r);

dffre #(8) byte20_reg   (cclk, reset, merge_func_cyc7, byte20, 		byte20_r);
dffre #(8) byte21_reg   (cclk, reset, merge_func_cyc7, byte21, 		byte21_r);
dffre #(8) byte22_reg   (cclk, reset, merge_func_cyc7, byte22, 		byte22_r);
dffre #(8) byte23_reg   (cclk, reset, merge_func_cyc7, byte23, 		byte23_r);
dffre #(8) byte24_reg   (cclk, reset, merge_func_cyc7, byte24, 		byte24_r);
dffre #(8) byte25_reg   (cclk, reset, merge_func_cyc7, byte25, 		byte25_r);
dffre #(8) byte26_reg   (cclk, reset, merge_func_cyc7, byte26, 		byte26_r);

assign fflp_zcp_data    = {byte0_r,  byte1_r,  byte2,    byte3_r,  byte4_r,  
			   byte5,    byte6_r,  byte7_r,  byte8_r,  byte9_r,
                           byte10_r, byte11_r, byte12_r, byte13_r, byte14_r, 
			   byte15_r, byte16_r, byte17_r, byte18_r, byte19,
                           byte20_r, byte21_r, byte22_r, byte23_r, byte24_r, 
			   byte25_r, byte26_r};

dffr #(1) merge_func_cyc0_reg	(cclk, reset, srch_fio_rd_en_4,		merge_func_cyc0);
dffr #(1) merge_func_cyc1_reg	(cclk, reset, merge_func_cyc0,		merge_func_cyc1);
dffr #(1) merge_func_cyc2_reg   (cclk, reset, merge_func_cyc1,  	merge_func_cyc2);
dffr #(1) merge_func_cyc3_reg   (cclk, reset, merge_func_cyc2,  	merge_func_cyc3);
dffr #(1) merge_func_cyc4_reg   (cclk, reset, merge_func_cyc3,  	merge_func_cyc4);
dffr #(1) merge_func_cyc5_reg   (cclk, reset, merge_func_cyc4,  	merge_func_cyc5);
dffr #(1) merge_func_cyc6_reg   (cclk, reset, merge_func_cyc5,  	merge_func_cyc6);
dffr #(1) merge_func_cyc7_reg   (cclk, reset, merge_func_cyc6,  	merge_func_cyc7);

dffr #(1) pre_zcp_wr_reg	(cclk, reset, merge_func_cyc7,  	pre_zcp_wr);
dffr #(1) pre_zcp_wr1_reg	(cclk, reset, pre_zcp_wr,		pre_zcp_wr1);
dffr #(1) pre_zcp_wr2_reg	(cclk, reset, pre_zcp_wr1,      	pre_zcp_wr2);
dffr #(1) zcp_wr_reg		(cclk, reset, zcp_wr_p,			zcp_wr);

assign zcp_wr_p		= pre_zcp_wr | pre_zcp_wr1 | pre_zcp_wr2;


/***************************/
//FCRAM Error handling
/***************************/
assign merge_func_cyc	= (merge_func_cyc0 | merge_func_cyc1 | merge_func_cyc2 | merge_func_cyc3 |
			   merge_func_cyc4 | merge_func_cyc5 | merge_func_cyc6 | merge_func_cyc7);
assign ecc_uncor_err_en	= merge_func_cyc & ecc_check_err_r1 | pre_zcp_wr;
assign ecc_uncor_err_in = merge_func_cyc & ecc_check_err_r1 ? 1'b1 : 1'b0;

assign ecc_check_err_all= ecc_check_err_r1 | ecc_corr_err_r1;
assign err_cnt_reg_en	= merge_func_cyc & ecc_check_err_all | pre_zcp_wr;  
assign err_cnt_in	= merge_func_cyc0 & ecc_check_err_all ? 4'd1 :
			  merge_func_cyc & ecc_check_err_all  ? (err_cnt + 4'd1) :
								4'd0;
assign ecc_err          = |err_cnt;
assign multi_err	= |err_cnt[3:1]; 
assign err_hash_v1	= {byte10_r[3:0], byte11_r[7:0], byte12_r[7:0]};
assign sub_addr_array	= {merge_func_cyc7, merge_func_cyc6, merge_func_cyc5, merge_func_cyc4, 
			   merge_func_cyc3, merge_func_cyc2, merge_func_cyc1, merge_func_cyc0}; 
assign ecc_addr_reg_en	= merge_func_cyc & ecc_check_err_all & (err_cnt == 4'b0) | pre_zcp_wr; 

assign is_ecc_uncor_en  = merge_func_cyc0 & ecc_check_err_all | merge_func_cyc & ecc_check_err_all & (err_cnt == 4'b0) | pre_zcp_wr;
assign is_ecc_uncor_in  = merge_func_cyc0 & ecc_check_err_all | merge_func_cyc & ecc_check_err_all & (err_cnt == 4'b0) ? ecc_check_err_r1 : 1'b0;

assign ecc_syndrome	= fc_din_reg_dout_r1[71:64];

always @(sub_addr_array)
begin

casex (sub_addr_array)

8'bxxxxxxx1:    sub_area_addr	= 3'b000;
8'bxxxxxx10:    sub_area_addr	= 3'b001;
8'bxxxxx100:    sub_area_addr	= 3'b010;
8'bxxxx1000:    sub_area_addr	= 3'b011;
8'bxxx10000:    sub_area_addr	= 3'b100;
8'bxx100000:    sub_area_addr	= 3'b101;
8'bx1000000:    sub_area_addr	= 3'b110;
8'b10000000:    sub_area_addr	= 3'b111;
default:        sub_area_addr	= 3'b000;

endcase

end

assign fc_err_status_in = {ecc_err, is_ecc_uncor_r, multi_err, err_hash_v1, ecc_sub_addr, ecc_syndrome_r}; //34bits

dffre #(1)  ecc_uncor_err_reg	(cclk, reset, ecc_uncor_err_en, ecc_uncor_err_in,  ecc_uncor_err);
dffre #(4)  err_cnt_reg		(cclk, reset, err_cnt_reg_en,	err_cnt_in,	   err_cnt);
dffre #(3)  ecc_sub_addr_reg	(cclk, reset, ecc_addr_reg_en,	sub_area_addr,     ecc_sub_addr);
dffre #(8)  ecc_ecc_syndrome_reg(cclk, reset, ecc_addr_reg_en,	ecc_syndrome, 	   ecc_syndrome_r);
dffre #(1)  is_ecc_uncor_reg	(cclk, reset, is_ecc_uncor_en,	is_ecc_uncor_in,   is_ecc_uncor_r);
dffre #(34) fc_err_status_reg	(cclk, reset, pre_zcp_wr, 	fc_err_status_in,  fc_err_status);


/*************************/
//Debug port data
/*************************/
assign merg_bus_cntl_data	= {merge_func_cyc7, merg_bus_fc_lookup, merg_bus_rdc_tbl_offset[4:0]}; 
assign debug_port_data_in	= (debug_data_sel == 3'b000) ? {byte0_r, byte1_r, byte2,   byte3_r} :
				  (debug_data_sel == 3'b001) ? {byte4_r, byte6_r, byte7_r, byte8_r} :  
				  (debug_data_sel == 3'b010) ? {byte9_r, byte10_r, byte11_r, byte12_r} :
				  (debug_data_sel == 3'b011) ? {byte18_r, byte20_r, byte21_r, byte22_r} :
				  (debug_data_sel == 3'b100) ? fc_din_reg_dout_r1[63:32] :
				  (debug_data_sel == 3'b101) ? {fc_din_reg_dout_r1[31:12], merg_bus_cntl_data[6:0], fcram_sm_state[4:0]} :
				  (debug_data_sel == 3'b110) ? debug_training_vector :
							       ~fflp_debug_port;

dffre #(3)  debug_data_sel_reg	(cclk, reset, fflp_config_reg_wen_pulse_sync,	pio_debug_data_sel,	debug_data_sel);
dffr  #(32) fflp_debug_port_reg (cclk, reset,					debug_port_data_in,	fflp_debug_port);

endmodule
		

