// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_hdr_dp.v
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
/*module name:   fflp_hdr_dp                                          */
/*description:   datapath for header bus and information decoded      */
/*               from them                                            */
/*                                                                    */
/*parent module in:  fflp_hdr.v                                       */
/*child modules in:  none                                             */
/*interface modules:                                                  */
/*author name:       Jeanne Cai                                       */
/*date created:      03-10-2004                                       */
/*                                                                    */
/*              Copyright (c) 2004, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/*modifications:                                                      */
/**********************************************************************/

`include "fflp.h"

module fflp_hdr_dp (
		cclk,
		reset,
		ipp_fflp_data,
		ipp_fflp_mac_default,
		ipp_fflp_mac_port,
		shft0_reg_en,
		shft1_reg_en,
		shft2_reg_en,
		shft3_reg_en,
		shft4_reg_en,
		shft5_reg_en,
		shft6_reg_en,
		shft7_reg_en,
		hdr_shft_done,
		fwd_sched,
		snap_en,
		disable_chksum,

                class2_hdr_byte_value,
                class3_hdr_byte_value,
                class4_hdr_byte_value,
                class5_hdr_byte_value,
                class6_hdr_byte_value,
                class7_hdr_byte_value,
                class_action_reg4_dout,
                class_action_reg5_dout,
                class_action_reg6_dout,
                class_action_reg7_dout,
                class_action_reg8_dout,
                class_action_reg9_dout,
                class_action_reg10_dout,
                class_action_reg11_dout,
                class_action_reg12_dout,
                class_action_reg13_dout,
                class_action_reg14_dout,
                class_action_reg15_dout,
		f_key_class_action_reg4_dout,
                f_key_class_action_reg5_dout,
                f_key_class_action_reg6_dout,
                f_key_class_action_reg7_dout,
                f_key_class_action_reg8_dout,
                f_key_class_action_reg9_dout,
                f_key_class_action_reg10_dout,
                f_key_class_action_reg11_dout,
                f_key_class_action_reg12_dout,
                f_key_class_action_reg13_dout,
                f_key_class_action_reg14_dout,
                f_key_class_action_reg15_dout,
		hdr_ctrl_bit_mask_reg_dout,
		cpu_vlan_req,
		cpu_vlan_rd,
		cpu_vlan_wr,
		cpu_vlan_addr,
		vlan_tbl_rd_din,
		
		fwd_req,
		key_bus,
		fwd_info_bus,
		hdr_fifo_space_avail,
		hdr_fifo_full,
		fflp_ipp_dvalid,
		fflp_ipp_data,
		vlan_tbl_cs,
		vlan_tbl_wr,
		vlan_tbl_addr,
		vlan_tbl_din_reg_dout,
		vlan_parity_err_log_en,
		vlan_tag_id,
		cpu_vlan_gnt_3

		);

input		cclk;
input		reset;
input[127:0]	ipp_fflp_data;
input[11:0]	ipp_fflp_mac_default;
input[1:0]	ipp_fflp_mac_port;
input		shft0_reg_en;
input		shft1_reg_en;
input		shft2_reg_en;
input		shft3_reg_en;
input		shft4_reg_en;
input		shft5_reg_en;
input		shft6_reg_en;
input		shft7_reg_en;
input		hdr_shft_done;
input		fwd_sched;
input		snap_en;
input		disable_chksum;

input[16:0]	class2_hdr_byte_value;
input[16:0]	class3_hdr_byte_value;
input[25:0]	class4_hdr_byte_value;
input[25:0]	class5_hdr_byte_value;
input[25:0]	class6_hdr_byte_value;
input[25:0]	class7_hdr_byte_value;

input[2:0]	class_action_reg4_dout;
input[2:0]	class_action_reg5_dout;
input[2:0]	class_action_reg6_dout;
input[2:0]	class_action_reg7_dout;
input[2:0]	class_action_reg8_dout;
input[2:0]	class_action_reg9_dout;
input[2:0]	class_action_reg10_dout;
input[2:0]	class_action_reg11_dout;
input[2:0]	class_action_reg12_dout;
input[2:0]	class_action_reg13_dout;
input[2:0]	class_action_reg14_dout;
input[2:0]	class_action_reg15_dout;
input[9:0]      f_key_class_action_reg4_dout;
input[9:0]      f_key_class_action_reg5_dout;
input[9:0]      f_key_class_action_reg6_dout;
input[9:0]      f_key_class_action_reg7_dout;
input[9:0]      f_key_class_action_reg8_dout;
input[9:0]      f_key_class_action_reg9_dout;
input[9:0]      f_key_class_action_reg10_dout;
input[9:0]      f_key_class_action_reg11_dout;
input[9:0]      f_key_class_action_reg12_dout;
input[9:0]      f_key_class_action_reg13_dout;
input[9:0]      f_key_class_action_reg14_dout;
input[9:0]      f_key_class_action_reg15_dout;
input[11:0]	hdr_ctrl_bit_mask_reg_dout;
input		cpu_vlan_req;
input		cpu_vlan_rd;
input		cpu_vlan_wr;
input[11:0]	cpu_vlan_addr;
input[17:0]     vlan_tbl_rd_din;

output		fwd_req;
output[199:0]	key_bus;
output[445:0]	fwd_info_bus;
output		hdr_fifo_space_avail;
output		hdr_fifo_full;
output[3:0]	fflp_ipp_dvalid;
output[15:0]	fflp_ipp_data;
output		vlan_tbl_cs;
output		vlan_tbl_wr;
output[11:0]	vlan_tbl_addr;
output[17:0]	vlan_tbl_din_reg_dout;
output		vlan_parity_err_log_en;
output[11:0]	vlan_tag_id;
output		cpu_vlan_gnt_3;

wire		hdr_fifo_cnt_en;
wire[2:0]	hdr_fifo_cnt_in;
wire[2:0]	hdr_fifo_cnt;
wire[199:0]	key_bus;
wire[445:0]	fwd_info_bus;

reg[7:0]        shft0_tmp12_dout;
reg[7:0]        shft0_tmp13_dout;
reg[7:0]        shft0_tmp14_dout;
reg[7:0]        shft0_tmp15_dout;

reg[7:0]        shft1_tmp0_dout;
reg[7:0]        shft1_tmp1_dout;
reg[7:0]        shft1_tmp2_dout;
reg[7:0]        shft1_tmp3_dout;
reg[7:0]        shft1_tmp4_dout;
reg[7:0]        shft1_tmp5_dout;
reg[7:0]        shft1_tmp6_dout;
reg[7:0]        shft1_tmp7_dout;
reg[7:0]        shft1_tmp8_dout;
reg[7:0]        shft1_tmp9_dout;
reg[7:0]        shft1_tmp10_dout;
reg[7:0]        shft1_tmp11_dout;
reg[7:0]        shft1_tmp12_dout;
reg[7:0]        shft1_tmp13_dout;
reg[7:0]        shft1_tmp14_dout;
reg[7:0]        shft1_tmp15_dout;

reg[7:0]        shft2_tmp0_dout;
reg[7:0]        shft2_tmp1_dout;
reg[7:0]        shft2_tmp2_dout;
reg[7:0]        shft2_tmp3_dout;
reg[7:0]        shft2_tmp4_dout;
reg[7:0]        shft2_tmp5_dout;
reg[7:0]        shft2_tmp6_dout;
reg[7:0]        shft2_tmp7_dout;
reg[7:0]        shft2_tmp8_dout;
reg[7:0]        shft2_tmp9_dout;
reg[7:0]        shft2_tmp10_dout;
reg[7:0]        shft2_tmp11_dout;
reg[7:0]        shft2_tmp12_dout;
reg[7:0]        shft2_tmp13_dout;
reg[7:0]        shft2_tmp14_dout;
reg[7:0]        shft2_tmp15_dout;

reg[7:0]        shft3_tmp0_dout;
reg[7:0]        shft3_tmp1_dout;
reg[7:0]        shft3_tmp2_dout;
reg[7:0]        shft3_tmp3_dout;
reg[7:0]        shft3_tmp4_dout;
reg[7:0]        shft3_tmp5_dout;
reg[7:0]        shft3_tmp6_dout;
reg[7:0]        shft3_tmp7_dout;
reg[7:0]        shft3_tmp8_dout;
reg[7:0]        shft3_tmp9_dout;
reg[7:0]        shft3_tmp10_dout;
reg[7:0]        shft3_tmp11_dout;
reg[7:0]        shft3_tmp12_dout;
reg[7:0]        shft3_tmp13_dout;
reg[7:0]        shft3_tmp14_dout;
reg[7:0]        shft3_tmp15_dout;

reg[7:0]        shft4_tmp0_dout;
reg[7:0]        shft4_tmp1_dout;
reg[7:0]        shft4_tmp2_dout;
reg[7:0]        shft4_tmp3_dout;
reg[7:0]        shft4_tmp4_dout;
reg[7:0]        shft4_tmp5_dout;
reg[7:0]        shft4_tmp6_dout;
reg[7:0]        shft4_tmp7_dout;
reg[7:0]        shft4_tmp8_dout;
reg[7:0]        shft4_tmp9_dout;
reg[7:0]        shft4_tmp10_dout;
reg[7:0]        shft4_tmp11_dout;
reg[7:0]        shft4_tmp12_dout;
reg[7:0]        shft4_tmp13_dout;
reg[7:0]        shft4_tmp14_dout;
reg[7:0]        shft4_tmp15_dout;

reg[7:0]        shft5_tmp0_dout;
reg[7:0]        shft5_tmp1_dout;
reg[7:0]        shft5_tmp2_dout;
reg[7:0]        shft5_tmp3_dout;
//reg[7:0]      shft5_tmp4_dout;
//reg[7:0]      shft5_tmp5_dout;
reg[7:0]        shft5_tmp6_dout;
reg[7:0]        shft5_tmp7_dout;

wire[1:0]       encap_offset_reg;
wire[1:0]	ether_type_in;
wire[1:0]       ether_type;
wire[4:0]       class;

wire[4:0]	v4_protocol_in;
wire[4:0]	v6_next_hdr_in;

wire[4:0]	v4_protocol;
wire[4:0]	v6_next_hdr;
wire[1:0]	l4_protocol_r;

wire[7:0]	shft2_tmp2_dout_r;
wire[7:0]	shft2_tmp3_dout_r;
wire[3:0]	ipv4_ip_hdr_len_r;
wire[3:0]	ipv4_ip_hdr_len_r0;
wire[15:0]	ipv4_ip_pkt_len_r;
wire		noport_r;
wire		badip_r;

wire[15:0]	shft0_tmp1312_trans_r;
wire[15:0]	valid_hdr_class_match_in;
wire[15:0]	valid_hdr_class_match;
wire[16:0]	addr_ind_hdr_byte_masked4_r;
wire[16:0]	addr_ind_hdr_byte_masked5_r;
wire[16:0]	addr_ind_hdr_byte_masked6_r;
wire[16:0]	addr_ind_hdr_byte_masked7_r;

reg[2:0]	l2_rdc_num;
wire[2:0]	l2_rdc_num_r;

reg[31:0]	v4_tcp_port_01;
reg[31:0]	v4_tcp_port_10;
reg[31:0]	v4_tcp_port_11;
reg[31:0]	v4_tcp_port;
wire[31:0]	v4_tcp_port_01_r;
wire[31:0]	v4_tcp_port_10_r;
wire[31:0]	v4_tcp_port_r;

wire[7:0]	ipv4_tos_r;
wire[7:0]	ipv4_protocol_r;
wire[31:0]	ipv4_src_addr_r;
wire[31:0]	ipv4_dest_addr_r;
//wire[31:0]	ipv4_ah_spi_r;
//wire[31:0]	ipv4_esp_spi_r;

wire[7:0]	ipv6_tos_r;
wire[7:0]	ipv6_next_hdr_r;
wire[127:0]	ipv6_src_addr_r;
wire[127:0]	ipv6_dest_addr_r;
wire[15:0]	ipv6_tcp_src_port_r;
wire[15:0]	ipv6_tcp_dest_port_r;
//wire[31:0]	ipv6_ah_spi_r;
//wire[31:0]	ipv6_esp_spi_r;
wire[31:0]	v6_tcp_port_r;

wire[87:0]	raw_cam_key_r;
wire		do_raw_key_r;
wire[2:0]	class_action_r;
wire[199:0]	tcam_key_r;
wire[9:0]	f_key_class_action_r;
wire[361:0]	flow_key_r;

reg[31:0]	v4_seq_num_01;
reg[31:0]	v4_seq_num_10;
reg[31:0]	v4_seq_num_11;
reg[31:0]	v4_seq_num;
wire[31:0]	v4_seq_num_01_r;
wire[31:0]	v4_seq_num_10_r;
wire[31:0]	v4_seq_num_r;

wire[31:0]	v6_seq_num;
wire[31:0]	v6_seq_num_r;

reg[3:0]	v4_tcp_len_01;
reg[3:0]	v4_tcp_len_10;
reg[3:0]	v4_tcp_len_11;
reg[3:0]	v4_tcp_len;
wire[3:0]	v4_tcp_len_01_r;
wire[3:0]	v4_tcp_len_10_r;
wire[3:0]	v4_tcp_len_r;

wire[3:0]	v6_tcp_len;
wire[3:0]	v6_tcp_len_r;

reg[11:0]	v4_tcp_flag_01;
reg[11:0]	v4_tcp_flag_10;
reg[11:0]	v4_tcp_flag_11;
reg[11:0]	v4_tcp_flag;
wire[11:0]	v4_tcp_flag_01_r;
wire[11:0]	v4_tcp_flag_10_r;
wire[11:0]	v4_tcp_flag_r;

wire[11:0]	v6_tcp_flag;
wire[11:0]	v6_tcp_flag_r;

reg[31:0]	tcp_port;
reg[31:0]	tcp_seq_num;
reg[3:0]	tcp_hdr_len;
reg[11:0]	tcp_ctrl_flag;
reg[15:0]	ip_pkt_len;

wire[3:0]	pkt_id_in;
wire[3:0]	pkt_id;


wire[127:0]	ipp_fflp_data_reg_dout;
wire[13:0]	ipp_fflp_status_reg_dout;
wire[13:0]	shft0_status_reg_dout;
wire 		promiscuous;
wire 		ph_match;
wire[2:0]	mac_rdc_num;
//wire 		mpr;
wire[1:0] 	mac_port;

wire[127:0]	shft0_reg_dout;
wire[127:0]	shft1_reg_dout;
wire[127:0]     shft2_reg_dout;
wire[127:0]     shft3_reg_dout;
wire[127:0]     shft4_reg_dout;
wire[127:0]	shft5_reg_dout;
wire[31:0]	shft6_reg_dout;

wire[7:0]       shft0_reg0_dout;
wire[7:0]       shft0_reg1_dout;
wire[7:0]       shft0_reg2_dout;
wire[7:0]       shft0_reg3_dout;
wire[7:0]       shft0_reg4_dout;
wire[7:0]       shft0_reg5_dout;
/*
wire[7:0]       shft0_reg6_dout;
wire[7:0]       shft0_reg7_dout;
wire[7:0]       shft0_reg8_dout;
wire[7:0]       shft0_reg9_dout;
wire[7:0]       shft0_reg10_dout;
wire[7:0]       shft0_reg11_dout;
*/
wire[7:0]	shft0_reg12_dout;
wire[7:0]	shft0_reg13_dout;
wire[7:0]	shft0_reg14_dout;
wire[7:0]	shft0_reg15_dout;

wire[7:0]	shft1_reg0_dout;
wire[7:0]	shft1_reg1_dout;
wire[7:0]       shft1_reg2_dout;
wire[7:0]       shft1_reg3_dout;
wire[7:0]       shft1_reg4_dout;
wire[7:0]       shft1_reg5_dout;
wire[7:0]       shft1_reg6_dout;
wire[7:0]       shft1_reg7_dout;
wire[7:0]       shft1_reg8_dout;
wire[7:0]       shft1_reg9_dout;
wire[7:0]       shft1_reg10_dout;
wire[7:0]       shft1_reg11_dout;
wire[7:0]       shft1_reg12_dout;
wire[7:0]       shft1_reg13_dout;
wire[7:0]       shft1_reg14_dout;
wire[7:0]       shft1_reg15_dout;

wire[7:0]       shft2_reg0_dout;
wire[7:0]       shft2_reg1_dout;
wire[7:0]       shft2_reg2_dout;
wire[7:0]       shft2_reg3_dout;
wire[7:0]       shft2_reg4_dout;
wire[7:0]       shft2_reg5_dout;
wire[7:0]       shft2_reg6_dout;
wire[7:0]       shft2_reg7_dout;
wire[7:0]       shft2_reg8_dout;
wire[7:0]       shft2_reg9_dout;
wire[7:0]       shft2_reg10_dout;
wire[7:0]       shft2_reg11_dout;
wire[7:0]       shft2_reg12_dout;
wire[7:0]       shft2_reg13_dout;
wire[7:0]       shft2_reg14_dout;
wire[7:0]       shft2_reg15_dout;

wire[7:0]       shft3_reg0_dout;
wire[7:0]       shft3_reg1_dout;
wire[7:0]       shft3_reg2_dout;
wire[7:0]       shft3_reg3_dout;
wire[7:0]       shft3_reg4_dout;
wire[7:0]       shft3_reg5_dout;
wire[7:0]       shft3_reg6_dout;
wire[7:0]       shft3_reg7_dout;
wire[7:0]       shft3_reg8_dout;
wire[7:0]       shft3_reg9_dout;
wire[7:0]       shft3_reg10_dout;
wire[7:0]       shft3_reg11_dout;
wire[7:0]       shft3_reg12_dout;
wire[7:0]       shft3_reg13_dout;
wire[7:0]       shft3_reg14_dout;
wire[7:0]       shft3_reg15_dout;

wire[7:0]       shft4_reg0_dout;
wire[7:0]       shft4_reg1_dout;
wire[7:0]       shft4_reg2_dout;
wire[7:0]       shft4_reg3_dout;
wire[7:0]       shft4_reg4_dout;
wire[7:0]       shft4_reg5_dout;
wire[7:0]       shft4_reg6_dout;
wire[7:0]       shft4_reg7_dout;
wire[7:0]       shft4_reg8_dout;
wire[7:0]       shft4_reg9_dout;
wire[7:0]       shft4_reg10_dout;
wire[7:0]       shft4_reg11_dout;
wire[7:0]       shft4_reg12_dout;
wire[7:0]       shft4_reg13_dout;
wire[7:0]       shft4_reg14_dout;
wire[7:0]       shft4_reg15_dout;

wire[7:0]       shft5_reg0_dout;
wire[7:0]       shft5_reg1_dout;
wire[7:0]       shft5_reg2_dout;
wire[7:0]       shft5_reg3_dout;
wire[7:0]       shft5_reg4_dout;
wire[7:0]       shft5_reg5_dout;
wire[7:0]       shft5_reg6_dout;
wire[7:0]       shft5_reg7_dout;
wire[7:0]       shft5_reg8_dout;
wire[7:0]       shft5_reg9_dout;
wire[7:0]       shft5_reg10_dout;
wire[7:0]       shft5_reg11_dout;
wire[7:0]       shft5_reg12_dout;
wire[7:0]       shft5_reg13_dout;
wire[7:0]       shft5_reg14_dout;
wire[7:0]       shft5_reg15_dout;

wire[7:0]       shft6_reg2_dout;
wire[7:0]       shft6_reg3_dout;

/*
wire[7:0]       shft6_reg0_dout;
wire[7:0]       shft6_reg1_dout;

wire[7:0]       shft6_reg4_dout;
wire[7:0]       shft6_reg5_dout;
wire[7:0]       shft6_reg6_dout;
wire[7:0]       shft6_reg7_dout;
wire[7:0]       shft6_reg8_dout;
wire[7:0]       shft6_reg9_dout;
wire[7:0]       shft6_reg10_dout;
wire[7:0]       shft6_reg11_dout;
wire[7:0]       shft6_reg12_dout;
wire[7:0]       shft6_reg13_dout;
wire[7:0]       shft6_reg14_dout;
wire[7:0]       shft6_reg15_dout;
*/

wire[15:0]	shft0_reg1312_trans;
wire[15:0]	shft0_reg1514_trans;
wire[15:0]	shft1_reg10_trans;
wire[15:0]	shft1_reg32_trans;
wire[47:0]	mac_dest_addr;

wire		or_tag;
wire[11:0]	vlan_tag_id;
wire		is_snap_type_0;
wire		is_aa_0;
wire		is_03_0;
wire		is_snap_type_1;
wire		is_aa_1;
wire		is_03_1;
wire		snap_type_0;
wire		snap_type_1;
wire		snap_type;
wire[1:0]	encap_offset;
	
wire[15:0]	shft0_tmp1312_trans;
wire[15:0]	shft1_tmp54_trans;
wire		is_ipv4;
wire		is_ipv6;
wire		is_ip_pkt;
wire		v4_prot_tcp;
wire		v4_prot_udp;
wire		v4_prot_ah;
wire		v4_prot_esp;
wire		v4_prot_sctp;
wire		v6_nhdr_tcp;
wire		v6_nhdr_udp;
wire		v6_nhdr_ah;
wire		v6_nhdr_esp;
wire		v6_nhdr_sctp;
wire[2:0]	l4_protocol_dec;
wire[1:0]	l4_protocol;

wire[3:0]       ipv4_ip_hdr_len;
wire[15:0]      ipv4_ip_pkt_len;
wire[15:0]      ipv4_frag_offset;
wire            noport;
wire		badip;

wire[15:0]      ipv6_ip_pkt_len;	//IP payload len, not include IP hdr len (40 bytes)
wire[15:0]	ipv6_ip_pkt_len_r;

wire[15:0]	class_en_mask;
wire[16:0]	addr_ind_hdr_byte;
wire[7:0]	addr_ind_hdr_byte0;
wire[7:0]	addr_ind_hdr_byte1;
wire[16:0]	addr_ind_hdr_byte_masked4;
wire[16:0]	addr_ind_hdr_byte_masked5;
wire[16:0]	addr_ind_hdr_byte_masked6;
wire[16:0]	addr_ind_hdr_byte_masked7;

wire[16:0]	class4_hdr_byte_value_masked;
wire[16:0]	class5_hdr_byte_value_masked;
wire[16:0]	class6_hdr_byte_value_masked;
wire[16:0]	class7_hdr_byte_value_masked;

wire		l2_hdr_class_match2;
wire		l2_hdr_class_match3;
wire		l3_hdr_class_match4;
wire		l3_hdr_class_match5;
wire		l3_hdr_class_match6;
wire		l3_hdr_class_match7;
wire		l3_hdr_class_match8;
wire		l3_hdr_class_match9;
wire		l3_hdr_class_match10;
wire		l3_hdr_class_match11;
wire		l3_hdr_class_match12;
wire		l3_hdr_class_match13;
wire		l3_hdr_class_match14;
wire		l3_hdr_class_match15;
wire		l3_hdr_class_match16;
wire		l3_hdr_class_match17;

wire[15:0]	hdr_class_match;
wire[4:0]	class_index;
wire[4:0]	class_index_tmp;
wire[2:0]	class_action;
wire[1:0]	class_action_r0;
wire[9:0]	f_key_class_action;

wire[2:0]	vlan_rdc_num;
wire		vpr;
wire[1:0]	vlan_parity;
wire		vlan_rdc_prio;
wire		use_vlan_rdc;
wire		is_promis;

wire[1:0]	vlan_parity_bit;
wire		vlan_parity_err;
wire		vlan_parity_err_r;

wire[19:0]	shft1_status;

wire[7:0]	ipv4_tos;
wire[7:0]	ipv4_protocol;
wire[31:0]	ipv4_src_addr;
wire[31:0]	ipv4_dest_addr;
//wire[31:0]	ipv4_ah_spi;
//wire[31:0]	ipv4_esp_spi;
wire[7:0]	ipv6_tos;
wire[7:0]	ipv6_next_hdr;
wire[127:0]	ipv6_src_addr;
wire[63:0]	ipv6_dest_addr_pre;
wire[63:0]	ipv6_dest_addr_suf;
wire[127:0]	ipv6_dest_addr;
wire[15:0]	ipv6_tcp_src_port;
wire[15:0]	ipv6_tcp_dest_port;
//wire[31:0]	ipv6_ah_spi;
//wire[31:0]	ipv6_esp_spi;

wire		do_raw_key;
wire[87:0]	raw_cam_key;

wire		class_action_ipaddr;
wire[199:0]	v4_cam_key;
wire[199:0]	v4_cam_key_ah;
wire[199:0]	v4_cam_key_esp;
wire[199:0]	v6_cam_key_src;
wire[199:0]	v6_cam_key_src_ah;
wire[199:0]	v6_cam_key_src_esp;
wire[199:0]	v6_cam_key_dest;
wire[199:0]	v6_cam_key_dest_ah;
wire[199:0]	v6_cam_key_dest_esp;
wire[199:0]	v4_5t_cam_key;
wire[199:0]	v6_4t_cam_key;

wire[199:0]	raw_cam_key_r0;
wire[199:0]	tcam_key;

wire[1:0]	f_key_class_action_l4_1;
wire[1:0]	f_key_class_action_l4_0;
wire		f_key_class_action_prot;
wire		f_key_class_action_ip_da;
wire		f_key_class_action_ip_sa;
wire		f_key_class_action_vlan;
wire		f_key_class_action_l2_da;
wire		f_key_class_action_vport;
wire[7:0]	prot_bytes;
wire[31:0]	ip_da_bytes_0;
wire[31:0]	ip_da_bytes_1;
wire[31:0]	ip_da_bytes_2;
wire[31:0]	ip_da_bytes_3;
wire[31:0]	ip_sa_bytes_0;
wire[31:0]	ip_sa_bytes_1;
wire[31:0]	ip_sa_bytes_2;
wire[31:0]	ip_sa_bytes_3;
wire		vlan_bytes_valid;
wire[15:0]	f_key_l4_1_bytes;
wire[15:0]	f_key_l4_0_bytes;
wire[7:0]	f_key_prot_bytes;
wire[31:0]      f_key_ip_da_bytes_0;
wire[31:0]      f_key_ip_da_bytes_1;
wire[31:0]      f_key_ip_da_bytes_2;
wire[31:0]      f_key_ip_da_bytes_3;
wire[31:0]      f_key_ip_sa_bytes_0;
wire[31:0]      f_key_ip_sa_bytes_1;
wire[31:0]      f_key_ip_sa_bytes_2;
wire[31:0]      f_key_ip_sa_bytes_3;
wire[3:0]	f_key_vlan_valid;
wire[11:0]	f_key_vlan_bytes;
wire[47:0]	f_key_l2_da_bytes;
wire[1:0]	f_key_vport_bytes;
wire[361:0]	flow_key;

wire		tcp_push_bit;
wire[83:0]	fwd_info;

wire		hdr_fifo_wen;
wire		hdr_fifo_ren;
wire		hdr_fifo_space_avail;
//wire		hdr_fifo_lastwp;
wire[645:0]	hdr_fifo_din;
wire[645:0]	hdr_fifo_dout;
wire		hdr_fifo_empty;
wire		hdr_fifo_full;
wire		fwd_req;

wire		cpu_vlan_acc_en;
wire		cpu_vlan_acc_in;
wire		cpu_vlan_acc;
wire		cpu_vlan_acc_dly;

wire		cpu_vlan_gnt_1;
wire		cpu_vlan_gnt_2;
wire		cpu_vlan_gnt_3;

wire		cpu_vlan_gnt;
wire		cpu_vlan_rd_gnt;
wire		cpu_vlan_wr_gnt;

wire		srch_vlan_rd_in;
wire		srch_vlan_rd;

wire            vlan_tbl_cs_in;
wire		vlan_tbl_rd_in;
wire		vlan_tbl_wr_in;

wire            vlan_tbl_cs;
wire            vlan_tbl_wr;

wire[11:0]	vlan_tbl_addr_in;
wire[11:0]      vlan_tbl_addr;
wire[17:0]	vlan_tbl_din_reg_dout;
wire		vlan_parity_err_log_en;
wire[17:0]      masked_vlan_tbl_dout;
wire[3:0]	vlan_tbl_rd_data;

wire[3:0]	mac_port_dec;	
wire		mac_port0, mac_port1, mac_port2, mac_port3;

wire[3:0]	fflp_ipp_dvalid_in;
wire[3:0]	fflp_ipp_dvalid;
wire[15:0]	fflp_ipp_data;


/*
dff #(128) ipp_fflp_data_reg 
	(
	cclk, 
	1'b0, 
	1'b1, 
	ipp_fflp_data, 
	ipp_fflp_data_reg_dout
	);

dff #(14)  ipp_fflp_ctrl_reg 
	(
	cclk, 
	1'b0, 
	1'b1, 
	{ipp_fflp_mac_port[1:0], ipp_fflp_mac_default[11:0]},
	ipp_fflp_status_reg_dout
	);
*/

assign ipp_fflp_data_reg_dout	= ipp_fflp_data;
assign ipp_fflp_status_reg_dout = {ipp_fflp_mac_port[1:0], ipp_fflp_mac_default[11:0]};

dffre #(14) hdr_shft0_status_reg 
	(
	cclk, 
	reset, 
	shft0_reg_en, 
	ipp_fflp_status_reg_dout, //{mac_port[1:0], 1'b0, mpr, 5'b0, mac_rdc[2:0], ph_match, promiscuous} 
	shft0_status_reg_dout
	);

dffre #(128) hdr_shft0_reg
        (
        cclk,
        reset,
        shft0_reg_en,
        ipp_fflp_data_reg_dout,
        shft0_reg_dout
        ) ;

dffre #(128) hdr_shft1_reg 
	(
	cclk, 
	reset, 
	shft1_reg_en, 
	ipp_fflp_data_reg_dout, 
	shft1_reg_dout
	);

dffre #(128) hdr_shft2_reg 
	(
	cclk, 
	reset, 
	shft2_reg_en, 
	ipp_fflp_data_reg_dout, 
	shft2_reg_dout
	);

dffre #(128) hdr_shft3_reg 
	(
	cclk, 
	reset, 
	shft3_reg_en, 
	ipp_fflp_data_reg_dout, 
	shft3_reg_dout
	);

dffre #(128) hdr_shft4_reg 
	(
	cclk, 
	reset, 
	shft4_reg_en, 
	ipp_fflp_data_reg_dout, 
	shft4_reg_dout
	);

dffre #(128) hdr_shft5_reg 
	(
	cclk, 
	reset, 
	shft5_reg_en, 
	ipp_fflp_data_reg_dout, 
	shft5_reg_dout
	);

dffre #(32) hdr_shft6_reg
        (
        cclk,
        reset,
        shft6_reg_en,
        ipp_fflp_data_reg_dout[31:0],
        shft6_reg_dout[31:0]
        );

/*
dffre #(128) hdr_shft7_reg
        (
        cclk,
        reset,
        shft7_reg_en,
        ipp_fflp_data_reg_dout,
        shft7_reg_dout
        );
*/


assign promiscuous	= shft0_status_reg_dout[0];
assign ph_match		= shft0_status_reg_dout[1];
assign mac_rdc_num	= shft0_status_reg_dout[4:2];
//assign mpr		= shft0_status_reg_dout[10];
assign mac_port		= shft0_status_reg_dout[13:12];

assign shft0_reg0_dout  = shft0_reg_dout[7:0];
assign shft0_reg1_dout  = shft0_reg_dout[15:8];
assign shft0_reg2_dout  = shft0_reg_dout[23:16];
assign shft0_reg3_dout  = shft0_reg_dout[31:24];
assign shft0_reg4_dout  = shft0_reg_dout[39:32];
assign shft0_reg5_dout  = shft0_reg_dout[47:40];
/*
assign shft0_reg6_dout  = shft0_reg_dout[55:48];
assign shft0_reg7_dout  = shft0_reg_dout[63:56];
assign shft0_reg8_dout  = shft0_reg_dout[71:64];
assign shft0_reg9_dout  = shft0_reg_dout[79:72];
assign shft0_reg10_dout = shft0_reg_dout[87:80];
assign shft0_reg11_dout = shft0_reg_dout[95:88];
*/
assign shft0_reg12_dout = shft0_reg_dout[103:96];
assign shft0_reg13_dout = shft0_reg_dout[111:104];
assign shft0_reg14_dout = shft0_reg_dout[119:112];
assign shft0_reg15_dout = shft0_reg_dout[127:120];

assign shft1_reg0_dout  = shft1_reg_dout[7:0];
assign shft1_reg1_dout  = shft1_reg_dout[15:8];
assign shft1_reg2_dout  = shft1_reg_dout[23:16];
assign shft1_reg3_dout  = shft1_reg_dout[31:24];
assign shft1_reg4_dout  = shft1_reg_dout[39:32];
assign shft1_reg5_dout  = shft1_reg_dout[47:40];
assign shft1_reg6_dout  = shft1_reg_dout[55:48];
assign shft1_reg7_dout  = shft1_reg_dout[63:56];
assign shft1_reg8_dout  = shft1_reg_dout[71:64];
assign shft1_reg9_dout  = shft1_reg_dout[79:72];
assign shft1_reg10_dout = shft1_reg_dout[87:80];
assign shft1_reg11_dout = shft1_reg_dout[95:88];
assign shft1_reg12_dout = shft1_reg_dout[103:96];
assign shft1_reg13_dout = shft1_reg_dout[111:104];
assign shft1_reg14_dout = shft1_reg_dout[119:112];
assign shft1_reg15_dout = shft1_reg_dout[127:120];

assign shft2_reg0_dout  = shft2_reg_dout[7:0];
assign shft2_reg1_dout  = shft2_reg_dout[15:8];
assign shft2_reg2_dout  = shft2_reg_dout[23:16];
assign shft2_reg3_dout  = shft2_reg_dout[31:24];
assign shft2_reg4_dout  = shft2_reg_dout[39:32];
assign shft2_reg5_dout  = shft2_reg_dout[47:40];
assign shft2_reg6_dout  = shft2_reg_dout[55:48];
assign shft2_reg7_dout  = shft2_reg_dout[63:56];
assign shft2_reg8_dout  = shft2_reg_dout[71:64];
assign shft2_reg9_dout  = shft2_reg_dout[79:72];
assign shft2_reg10_dout = shft2_reg_dout[87:80];
assign shft2_reg11_dout = shft2_reg_dout[95:88];
assign shft2_reg12_dout = shft2_reg_dout[103:96];
assign shft2_reg13_dout = shft2_reg_dout[111:104];
assign shft2_reg14_dout = shft2_reg_dout[119:112];
assign shft2_reg15_dout = shft2_reg_dout[127:120];

assign shft3_reg0_dout  = shft3_reg_dout[7:0];
assign shft3_reg1_dout  = shft3_reg_dout[15:8];
assign shft3_reg2_dout  = shft3_reg_dout[23:16];
assign shft3_reg3_dout  = shft3_reg_dout[31:24];
assign shft3_reg4_dout  = shft3_reg_dout[39:32];
assign shft3_reg5_dout  = shft3_reg_dout[47:40];
assign shft3_reg6_dout  = shft3_reg_dout[55:48];
assign shft3_reg7_dout  = shft3_reg_dout[63:56];
assign shft3_reg8_dout  = shft3_reg_dout[71:64];
assign shft3_reg9_dout  = shft3_reg_dout[79:72];
assign shft3_reg10_dout = shft3_reg_dout[87:80];
assign shft3_reg11_dout = shft3_reg_dout[95:88];
assign shft3_reg12_dout = shft3_reg_dout[103:96];
assign shft3_reg13_dout = shft3_reg_dout[111:104];
assign shft3_reg14_dout = shft3_reg_dout[119:112];
assign shft3_reg15_dout = shft3_reg_dout[127:120];

assign shft4_reg0_dout  = shft4_reg_dout[7:0];
assign shft4_reg1_dout  = shft4_reg_dout[15:8];
assign shft4_reg2_dout  = shft4_reg_dout[23:16];
assign shft4_reg3_dout  = shft4_reg_dout[31:24];
assign shft4_reg4_dout  = shft4_reg_dout[39:32];
assign shft4_reg5_dout  = shft4_reg_dout[47:40];
assign shft4_reg6_dout  = shft4_reg_dout[55:48];
assign shft4_reg7_dout  = shft4_reg_dout[63:56];
assign shft4_reg8_dout  = shft4_reg_dout[71:64];
assign shft4_reg9_dout  = shft4_reg_dout[79:72];
assign shft4_reg10_dout = shft4_reg_dout[87:80];
assign shft4_reg11_dout = shft4_reg_dout[95:88];
assign shft4_reg12_dout = shft4_reg_dout[103:96];
assign shft4_reg13_dout = shft4_reg_dout[111:104];
assign shft4_reg14_dout = shft4_reg_dout[119:112];
assign shft4_reg15_dout = shft4_reg_dout[127:120];

assign shft5_reg0_dout  = shft5_reg_dout[7:0];
assign shft5_reg1_dout  = shft5_reg_dout[15:8];
assign shft5_reg2_dout  = shft5_reg_dout[23:16];
assign shft5_reg3_dout  = shft5_reg_dout[31:24];
assign shft5_reg4_dout  = shft5_reg_dout[39:32];
assign shft5_reg5_dout  = shft5_reg_dout[47:40];
assign shft5_reg6_dout  = shft5_reg_dout[55:48];
assign shft5_reg7_dout  = shft5_reg_dout[63:56];
assign shft5_reg8_dout  = shft5_reg_dout[71:64];
assign shft5_reg9_dout  = shft5_reg_dout[79:72];
assign shft5_reg10_dout = shft5_reg_dout[87:80];
assign shft5_reg11_dout = shft5_reg_dout[95:88];
assign shft5_reg12_dout = shft5_reg_dout[103:96];
assign shft5_reg13_dout = shft5_reg_dout[111:104];
assign shft5_reg14_dout = shft5_reg_dout[119:112];
assign shft5_reg15_dout = shft5_reg_dout[127:120];

assign shft6_reg2_dout  = shft6_reg_dout[23:16];
assign shft6_reg3_dout  = shft6_reg_dout[31:24];

/*
assign shft6_reg0_dout  = shft6_reg_dout[7:0];
assign shft6_reg1_dout  = shft6_reg_dout[15:8];

assign shft6_reg4_dout  = shft6_reg_dout[39:32];
assign shft6_reg5_dout  = shft6_reg_dout[47:40];
assign shft6_reg6_dout  = shft6_reg_dout[55:48];
assign shft6_reg7_dout  = shft6_reg_dout[63:56];
assign shft6_reg8_dout  = shft6_reg_dout[71:64];
assign shft6_reg9_dout  = shft6_reg_dout[79:72];
assign shft6_reg10_dout = shft6_reg_dout[87:80];
assign shft6_reg11_dout = shft6_reg_dout[95:88];
assign shft6_reg12_dout = shft6_reg_dout[103:96];
assign shft6_reg13_dout = shft6_reg_dout[111:104];
assign shft6_reg14_dout = shft6_reg_dout[119:112];
assign shft6_reg15_dout = shft6_reg_dout[127:120];

assign shft7_reg0_dout  = shft7_reg_dout[7:0];
assign shft7_reg1_dout  = shft7_reg_dout[15:8];
assign shft7_reg2_dout  = shft7_reg_dout[23:16];
assign shft7_reg3_dout  = shft7_reg_dout[31:24];
assign shft7_reg4_dout  = shft7_reg_dout[39:32];
assign shft7_reg5_dout  = shft7_reg_dout[47:40];
assign shft7_reg6_dout  = shft7_reg_dout[55:48];
assign shft7_reg7_dout  = shft7_reg_dout[63:56];
assign shft7_reg8_dout  = shft7_reg_dout[71:64];
assign shft7_reg9_dout  = shft7_reg_dout[79:72];
assign shft7_reg10_dout = shft7_reg_dout[87:80];
assign shft7_reg11_dout = shft7_reg_dout[95:88];
assign shft7_reg12_dout = shft7_reg_dout[103:96];
assign shft7_reg13_dout = shft7_reg_dout[111:104];
assign shft7_reg14_dout = shft7_reg_dout[119:112];
assign shft7_reg15_dout = shft7_reg_dout[127:120];
*/

assign mac_port0	= (mac_port == 2'b00);
assign mac_port1	= (mac_port == 2'b01);
assign mac_port2	= (mac_port == 2'b10);
assign mac_port3	= (mac_port == 2'b11);
assign mac_port_dec	= {mac_port3, mac_port2, mac_port1, mac_port0};

assign shft0_reg1312_trans = {shft0_reg12_dout, shft0_reg13_dout};
assign shft0_reg1514_trans = {shft0_reg14_dout, shft0_reg15_dout};
assign shft1_reg10_trans = {shft1_reg0_dout, shft1_reg1_dout};
assign shft1_reg32_trans = {shft1_reg2_dout, shft1_reg3_dout};

assign mac_dest_addr	= {shft0_reg0_dout, shft0_reg1_dout, shft0_reg2_dout,
			   shft0_reg3_dout, shft0_reg4_dout, shft0_reg5_dout};
assign or_tag		= (shft0_reg1312_trans == 16'h8100);
assign vlan_tag_id	= shft0_reg1514_trans[11:0];

assign is_snap_type_0	= snap_en &
                      	!((|shft0_reg1312_trans[15:11]) |
                      	((~|shft0_reg1312_trans[15:11]) &
			shft0_reg1312_trans[10] & 
			shft0_reg1312_trans[9]) &
                         (|shft0_reg1312_trans[8:0]));

assign is_aa_0		= shft0_reg1514_trans == 16'haaaa;
assign is_03_0		= shft1_reg0_dout == 8'h03;     

assign is_snap_type_1	= snap_en &
                      	!((|shft1_reg10_trans[15:11]) |
                      	((~|shft1_reg10_trans[15:11]) &
                        shft1_reg10_trans[10] & 
                        shft1_reg10_trans[9]) &
                         (|shft1_reg10_trans[8:0]));

assign is_aa_1		= shft1_reg32_trans == 16'haaaa;
assign is_03_1		= shft1_reg4_dout == 8'h03;

assign snap_type_0 	= is_snap_type_0 & is_aa_0 & is_03_0;
assign snap_type_1 	= is_snap_type_1 & is_aa_1 & is_03_1;
assign snap_type	= or_tag ? snap_type_1 : snap_type_0;
assign encap_offset	= {snap_type, or_tag};

dffre #(2) encap_offset_reg0 (cclk, reset, shft2_reg_en, encap_offset, encap_offset_reg);

always @ (
	encap_offset or 
	shft0_reg12_dout or 
	shft0_reg13_dout or 
	shft0_reg14_dout or 
	shft0_reg15_dout or
	shft1_reg0_dout or
	shft1_reg1_dout or
	shft1_reg2_dout or
	shft1_reg3_dout or
	shft1_reg4_dout or
	shft1_reg5_dout or
	shft1_reg6_dout or
	shft1_reg7_dout or
	shft1_reg8_dout or
	shft1_reg9_dout or
	shft1_reg10_dout or
	shft1_reg11_dout or
	shft1_reg12_dout or
	shft1_reg13_dout or
	shft1_reg14_dout or
	shft1_reg15_dout or
	shft2_reg0_dout or
        shft2_reg1_dout or
        shft2_reg2_dout or
        shft2_reg3_dout or
        shft2_reg4_dout or
        shft2_reg5_dout or
        shft2_reg6_dout or
        shft2_reg7_dout or
        shft2_reg8_dout or
        shft2_reg9_dout or
        shft2_reg10_dout or
        shft2_reg11_dout or
        shft2_reg12_dout or
        shft2_reg13_dout or
        shft2_reg14_dout or
        shft2_reg15_dout) 
	
begin
        case (encap_offset) //synopsys parallel_case full_case
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:shftM_tmpN_dout_1"
        2'b00:  begin
		shft0_tmp12_dout = shft0_reg12_dout;
		shft0_tmp13_dout = shft0_reg13_dout;
		shft0_tmp14_dout = shft0_reg14_dout;
                shft0_tmp15_dout = shft0_reg15_dout;

		shft1_tmp0_dout = shft1_reg0_dout;
		shft1_tmp1_dout = shft1_reg1_dout;
		shft1_tmp2_dout = shft1_reg2_dout;
		shft1_tmp3_dout = shft1_reg3_dout;
		shft1_tmp4_dout = shft1_reg4_dout;
                shft1_tmp5_dout = shft1_reg5_dout;
                shft1_tmp6_dout = shft1_reg6_dout;
                shft1_tmp7_dout = shft1_reg7_dout;
		shft1_tmp8_dout = shft1_reg8_dout;
                shft1_tmp9_dout = shft1_reg9_dout;
                shft1_tmp10_dout = shft1_reg10_dout;
                shft1_tmp11_dout = shft1_reg11_dout;
		shft1_tmp12_dout = shft1_reg12_dout;
                shft1_tmp13_dout = shft1_reg13_dout;
		shft1_tmp14_dout = shft1_reg14_dout;
                shft1_tmp15_dout = shft1_reg15_dout;

		shft2_tmp0_dout = shft2_reg0_dout;
                shft2_tmp1_dout = shft2_reg1_dout;
                shft2_tmp2_dout = shft2_reg2_dout;
                shft2_tmp3_dout = shft2_reg3_dout;
		end

	2'b01:	begin
		shft0_tmp12_dout = shft1_reg0_dout;
                shft0_tmp13_dout = shft1_reg1_dout;
                shft0_tmp14_dout = shft1_reg2_dout;
                shft0_tmp15_dout = shft1_reg3_dout;

                shft1_tmp0_dout = shft1_reg4_dout;
                shft1_tmp1_dout = shft1_reg5_dout;
                shft1_tmp2_dout = shft1_reg6_dout;
                shft1_tmp3_dout = shft1_reg7_dout;
                shft1_tmp4_dout = shft1_reg8_dout;
                shft1_tmp5_dout = shft1_reg9_dout;
                shft1_tmp6_dout = shft1_reg10_dout;
                shft1_tmp7_dout = shft1_reg11_dout;
                shft1_tmp8_dout = shft1_reg12_dout;
                shft1_tmp9_dout = shft1_reg13_dout;
                shft1_tmp10_dout = shft1_reg14_dout;
                shft1_tmp11_dout = shft1_reg15_dout;
                shft1_tmp12_dout = shft2_reg0_dout;
                shft1_tmp13_dout = shft2_reg1_dout;
                shft1_tmp14_dout = shft2_reg2_dout;
                shft1_tmp15_dout = shft2_reg3_dout;

                shft2_tmp0_dout = shft2_reg4_dout;
                shft2_tmp1_dout = shft2_reg5_dout;
                shft2_tmp2_dout = shft2_reg6_dout;
                shft2_tmp3_dout = shft2_reg7_dout;
                end

	2'b10:  begin
		shft0_tmp12_dout = shft1_reg4_dout;
                shft0_tmp13_dout = shft1_reg5_dout;
                shft0_tmp14_dout = shft1_reg6_dout;
                shft0_tmp15_dout = shft1_reg7_dout;

                shft1_tmp0_dout = shft1_reg8_dout;
                shft1_tmp1_dout = shft1_reg9_dout;
                shft1_tmp2_dout = shft1_reg10_dout;
                shft1_tmp3_dout = shft1_reg11_dout;
                shft1_tmp4_dout = shft1_reg12_dout;
                shft1_tmp5_dout = shft1_reg13_dout;
                shft1_tmp6_dout = shft1_reg14_dout;
                shft1_tmp7_dout = shft1_reg15_dout;
                shft1_tmp8_dout = shft2_reg0_dout;
                shft1_tmp9_dout = shft2_reg1_dout;
                shft1_tmp10_dout = shft2_reg2_dout;
                shft1_tmp11_dout = shft2_reg3_dout;
                shft1_tmp12_dout = shft2_reg4_dout;
                shft1_tmp13_dout = shft2_reg5_dout;
                shft1_tmp14_dout = shft2_reg6_dout;
                shft1_tmp15_dout = shft2_reg7_dout;

		shft2_tmp0_dout = shft2_reg8_dout;
                shft2_tmp1_dout = shft2_reg9_dout;
                shft2_tmp2_dout = shft2_reg10_dout;
                shft2_tmp3_dout = shft2_reg11_dout;
                end

        2'b11:  begin
		shft0_tmp12_dout = shft1_reg8_dout;
                shft0_tmp13_dout = shft1_reg9_dout;
                shft0_tmp14_dout = shft1_reg10_dout;
                shft0_tmp15_dout = shft1_reg11_dout;

                shft1_tmp0_dout = shft1_reg12_dout;
                shft1_tmp1_dout = shft1_reg13_dout;
                shft1_tmp2_dout = shft1_reg14_dout;
                shft1_tmp3_dout = shft1_reg15_dout;
                shft1_tmp4_dout = shft2_reg0_dout;
                shft1_tmp5_dout = shft2_reg1_dout;
                shft1_tmp6_dout = shft2_reg2_dout;
                shft1_tmp7_dout = shft2_reg3_dout;
                shft1_tmp8_dout = shft2_reg4_dout;
                shft1_tmp9_dout = shft2_reg5_dout;
                shft1_tmp10_dout = shft2_reg6_dout;
                shft1_tmp11_dout = shft2_reg7_dout;
                shft1_tmp12_dout = shft2_reg8_dout;
                shft1_tmp13_dout = shft2_reg9_dout;
                shft1_tmp14_dout = shft2_reg10_dout;
                shft1_tmp15_dout = shft2_reg11_dout;

		shft2_tmp0_dout = shft2_reg12_dout;
                shft2_tmp1_dout = shft2_reg13_dout;
                shft2_tmp2_dout = shft2_reg14_dout;
                shft2_tmp3_dout = shft2_reg15_dout;
		end

	default:begin
		shft0_tmp12_dout = 8'b0;
		shft0_tmp13_dout = 8'b0;
		shft0_tmp14_dout = 8'b0;
                shft0_tmp15_dout = 8'b0;

                shft1_tmp0_dout = 8'b0;
                shft1_tmp1_dout = 8'b0;
                shft1_tmp2_dout = 8'b0;
                shft1_tmp3_dout = 8'b0;
                shft1_tmp4_dout = 8'b0;
                shft1_tmp5_dout = 8'b0;
                shft1_tmp6_dout = 8'b0;
                shft1_tmp7_dout = 8'b0;
                shft1_tmp8_dout = 8'b0;
                shft1_tmp9_dout = 8'b0;
                shft1_tmp10_dout = 8'b0;
                shft1_tmp11_dout = 8'b0;
                shft1_tmp12_dout = 8'b0;
                shft1_tmp13_dout = 8'b0;
                shft1_tmp14_dout = 8'b0;
                shft1_tmp15_dout = 8'b0;

                shft2_tmp0_dout = 8'b0;
                shft2_tmp1_dout = 8'b0;
                shft2_tmp2_dout = 8'b0;
                shft2_tmp3_dout = 8'b0;
                end
	endcase
end

assign shft0_tmp1312_trans	= {shft0_tmp12_dout, 
				   shft0_tmp13_dout};
assign shft1_tmp54_trans 	= {shft1_tmp4_dout, 
				   shft1_tmp5_dout};

assign is_ipv4		= (shft0_tmp1312_trans == `TYPE_IPV4) & 
		  	  (shft0_tmp14_dout[7:4] == 4'b0100);
assign is_ipv6		= (shft0_tmp1312_trans == `TYPE_IPV6) & 
		  	  (shft0_tmp14_dout[7:4] == 4'b0110);

assign ether_type_in	= {is_ipv6, is_ipv4};

dffre #(2) ether_type_reg	(cclk, reset, shft2_reg_en, ether_type_in, ether_type);

assign is_ip_pkt	= |ether_type;

assign v4_prot_tcp	= (shft1_tmp7_dout == `TCP) & ether_type[0];
assign v4_prot_udp	= (shft1_tmp7_dout == `UDP) & ether_type[0];
assign v4_prot_ah     	= (shft1_tmp7_dout == `AH) & ether_type[0];
assign v4_prot_esp    	= (shft1_tmp7_dout == `ESP) & ether_type[0];
assign v4_prot_sctp	= (shft1_tmp7_dout == `SCTP) & ether_type[0];

assign v6_nhdr_tcp    	= (shft1_tmp4_dout == `TCP) & ether_type[1];
assign v6_nhdr_udp    	= (shft1_tmp4_dout == `UDP) & ether_type[1];
assign v6_nhdr_ah     	= (shft1_tmp4_dout == `AH) & ether_type[1];
assign v6_nhdr_esp    	= (shft1_tmp4_dout == `ESP) & ether_type[1];
assign v6_nhdr_sctp	= (shft1_tmp4_dout == `SCTP) & ether_type[1];

assign l4_protocol_dec	= {(v4_prot_sctp | v6_nhdr_sctp), 
			   (v4_prot_udp | v6_nhdr_udp),
			   (v4_prot_tcp | v6_nhdr_tcp)};

assign l4_protocol	= noport	     ? 2'b00 :
			  l4_protocol_dec[0] ? 2'b01 : 
			  l4_protocol_dec[1] ? 2'b10 :
			  l4_protocol_dec[2] ? 2'b11 : 2'b00;

assign v4_protocol_in	= {v4_prot_sctp, v4_prot_esp, v4_prot_ah, v4_prot_udp, v4_prot_tcp};
assign v6_next_hdr_in	= {v6_nhdr_sctp, v6_nhdr_esp, v6_nhdr_ah, v6_nhdr_udp, v6_nhdr_tcp};

dffre #(2) l4_protocol_r_reg	(cclk, reset, shft3_reg_en, l4_protocol,    l4_protocol_r);
dffre #(5) v4_protocol_reg      (cclk, reset, shft3_reg_en, v4_protocol_in, v4_protocol);
dffre #(5) v6_next_hdr_reg      (cclk, reset, shft3_reg_en, v6_next_hdr_in, v6_next_hdr);

assign ipv4_ip_hdr_len  = shft0_tmp14_dout[3:0];
assign ipv4_ip_pkt_len  = {shft1_tmp0_dout, shft1_tmp1_dout};
assign ipv4_frag_offset = shft1_tmp54_trans;
//assign noport         = ether_type[0] & ((ipv4_frag_offset[15:13] == 3'b001) | (|ipv4_frag_offset[12:0]));
assign noport		= ether_type[0] & (ipv4_frag_offset[13] | (|ipv4_frag_offset[12:0]));
assign badip		= ether_type[0] & (ipv4_ip_hdr_len < 4'b0101);

assign ipv6_ip_pkt_len	= {shft1_tmp2_dout, shft1_tmp3_dout};


dffre #(8)  shft2_tmp2_dout_r_reg	(cclk, reset, shft3_reg_en, shft2_tmp2_dout, shft2_tmp2_dout_r);
dffre #(8)  shft2_tmp3_dout_r_reg	(cclk, reset, shft3_reg_en, shft2_tmp3_dout, shft2_tmp3_dout_r);
dffre #(4)  ipv4_ip_hdr_len_r_reg	(cclk, reset, shft3_reg_en, ipv4_ip_hdr_len, ipv4_ip_hdr_len_r);
dffre #(4)  ipv4_ip_hdr_len_r0_reg	(cclk, reset, shft3_reg_en, ipv4_ip_hdr_len, ipv4_ip_hdr_len_r0);
dffre #(16) ipv4_ip_pkt_len_r_reg	(cclk, reset, shft3_reg_en, ipv4_ip_pkt_len, ipv4_ip_pkt_len_r);
dffre #(1)  noport_r_reg		(cclk, reset, shft3_reg_en, noport,          noport_r);
dffre #(1)  badip_r_reg			(cclk, reset, shft3_reg_en, badip,           badip_r);

dffre #(16) ipv6_ip_pkt_len_r_reg	(cclk, reset, shft3_reg_en, ipv6_ip_pkt_len, ipv6_ip_pkt_len_r);

/******************************/
//Forward Decision to IPP
/******************************/
assign	fflp_ipp_data		= {2'b0, pkt_id, l4_protocol_r, ipv4_ip_hdr_len_r, ether_type, encap_offset_reg};

assign	fflp_ipp_dvalid_in	= {4{shft3_reg_en}} & mac_port_dec[3:0];

dffr #(4) fflp_ipp_dvalid_reg	(cclk, reset, fflp_ipp_dvalid_in, fflp_ipp_dvalid);

/*************************/
// Class 
/*************************/
assign class_en_mask	= 
			{
			10'h3ff,
			class7_hdr_byte_value[25],
			class6_hdr_byte_value[25],
			class5_hdr_byte_value[25],
			class4_hdr_byte_value[25],
			class3_hdr_byte_value[16],
			class2_hdr_byte_value[16]
			};
				
assign addr_ind_hdr_byte1 = ether_type[1] ? ipv6_next_hdr : ipv4_protocol;
assign addr_ind_hdr_byte0 = ether_type[1] ? ipv6_tos      : ipv4_tos;
assign addr_ind_hdr_byte  = 
		{
		ether_type[1],		//{v6,v4}
		addr_ind_hdr_byte1,	//Protocol 
		addr_ind_hdr_byte0	//TOS 
		}; 

assign addr_ind_hdr_byte_masked4 = 
		{
		addr_ind_hdr_byte[16:8],
		addr_ind_hdr_byte[7:0] & class4_hdr_byte_value[15:8]
		};

assign addr_ind_hdr_byte_masked5 =
		{addr_ind_hdr_byte[16:8],
		addr_ind_hdr_byte[7:0] & class5_hdr_byte_value[15:8]
		};

assign addr_ind_hdr_byte_masked6 =
                {addr_ind_hdr_byte[16:8],
                addr_ind_hdr_byte[7:0] & class6_hdr_byte_value[15:8]
                };

assign addr_ind_hdr_byte_masked7 =
                {addr_ind_hdr_byte[16:8],
                addr_ind_hdr_byte[7:0] & class7_hdr_byte_value[15:8]
                };


dffre #(16) shft0_tmp1312_trans_r_reg		(cclk, reset, shft3_reg_en, shft0_tmp1312_trans,       shft0_tmp1312_trans_r);
dffre #(17) addr_ind_hdr_byte_masked4_r_reg	(cclk, reset, shft3_reg_en, addr_ind_hdr_byte_masked4, addr_ind_hdr_byte_masked4_r);
dffre #(17) addr_ind_hdr_byte_masked5_r_reg	(cclk, reset, shft3_reg_en, addr_ind_hdr_byte_masked5, addr_ind_hdr_byte_masked5_r);
dffre #(17) addr_ind_hdr_byte_masked6_r_reg	(cclk, reset, shft3_reg_en, addr_ind_hdr_byte_masked6, addr_ind_hdr_byte_masked6_r);
dffre #(17) addr_ind_hdr_byte_masked7_r_reg	(cclk, reset, shft3_reg_en, addr_ind_hdr_byte_masked7, addr_ind_hdr_byte_masked7_r);

assign class4_hdr_byte_value_masked =
		{
		class4_hdr_byte_value[24:16], 
		class4_hdr_byte_value[7:0] & class4_hdr_byte_value[15:8]
		};

assign class5_hdr_byte_value_masked =
		{
                class5_hdr_byte_value[24:16], 
                class5_hdr_byte_value[7:0] & class5_hdr_byte_value[15:8]
                };

assign class6_hdr_byte_value_masked =
                {
                class6_hdr_byte_value[24:16], 
                class6_hdr_byte_value[7:0] & class6_hdr_byte_value[15:8]
                };

assign class7_hdr_byte_value_masked =
                {
                class7_hdr_byte_value[24:16], 
                class7_hdr_byte_value[7:0] & class7_hdr_byte_value[15:8]
                };
		

assign l2_hdr_class_match2	= (shft0_tmp1312_trans_r == class2_hdr_byte_value[15:0]);
assign l2_hdr_class_match3	= (shft0_tmp1312_trans_r == class3_hdr_byte_value[15:0]);

assign l3_hdr_class_match4	= (addr_ind_hdr_byte_masked4_r == class4_hdr_byte_value_masked) & is_ip_pkt;
assign l3_hdr_class_match5	= (addr_ind_hdr_byte_masked5_r == class5_hdr_byte_value_masked) & is_ip_pkt;
assign l3_hdr_class_match6      = (addr_ind_hdr_byte_masked6_r == class6_hdr_byte_value_masked) & is_ip_pkt;
assign l3_hdr_class_match7      = (addr_ind_hdr_byte_masked7_r == class7_hdr_byte_value_masked) & is_ip_pkt;

assign l3_hdr_class_match8	= v4_protocol[0];
assign l3_hdr_class_match9	= v4_protocol[1];
assign l3_hdr_class_match10	= v4_protocol[2] | v4_protocol[3];
assign l3_hdr_class_match11	= v4_protocol[4];
assign l3_hdr_class_match12	= v6_next_hdr[0];
assign l3_hdr_class_match13	= v6_next_hdr[1];
assign l3_hdr_class_match14	= v6_next_hdr[2] | v6_next_hdr[3];
assign l3_hdr_class_match15	= v6_next_hdr[4];
assign l3_hdr_class_match16	= (shft0_tmp1312_trans_r == `TYPE_ARP);
assign l3_hdr_class_match17	= (shft0_tmp1312_trans_r == `TYPE_RARP);
 

assign hdr_class_match =  
		{
		l3_hdr_class_match17,
		l3_hdr_class_match16,
		l3_hdr_class_match15,
		l3_hdr_class_match14,
		l3_hdr_class_match13,
		l3_hdr_class_match12,
		l3_hdr_class_match11,
		l3_hdr_class_match10,
		l3_hdr_class_match9,
		l3_hdr_class_match8,
		l3_hdr_class_match7,
		l3_hdr_class_match6,
		l3_hdr_class_match5,
		l3_hdr_class_match4,
		l2_hdr_class_match3,
		l2_hdr_class_match2
		};


assign valid_hdr_class_match_in = hdr_class_match & class_en_mask;
assign class_index		= class_index_enc (valid_hdr_class_match[15:0]);
assign class_index_tmp		= (is_promis) ? 5'b0 : class_index;

dffre #(16) valid_hdr_class_match_reg	(cclk, reset, shft4_reg_en, valid_hdr_class_match_in, valid_hdr_class_match);
dffre #(5)  class_reg			(cclk, reset, shft5_reg_en, class_index_tmp, class);

assign class_action	= class_action_sel0 
		(
		class[3:0],
		3'b010,	
		3'b010,	
               	class_action_reg4_dout[2:0],
               	class_action_reg5_dout[2:0],
               	class_action_reg6_dout[2:0],
               	class_action_reg7_dout[2:0],
               	class_action_reg8_dout[2:0],
               	class_action_reg9_dout[2:0],
		class_action_reg10_dout[2:0],
               	class_action_reg11_dout[2:0],
               	class_action_reg12_dout[2:0],
               	class_action_reg13_dout[2:0],
		class_action_reg14_dout[2:0],
		class_action_reg15_dout[2:0]
		);

assign f_key_class_action = class_action_sel1
		(
		class[3:0],
                10'b0,
                10'b0,
                f_key_class_action_reg4_dout[9:0],
                f_key_class_action_reg5_dout[9:0],
                f_key_class_action_reg6_dout[9:0],
                f_key_class_action_reg7_dout[9:0],
                f_key_class_action_reg8_dout[9:0],
                f_key_class_action_reg9_dout[9:0],
                f_key_class_action_reg10_dout[9:0],
                f_key_class_action_reg11_dout[9:0],
                f_key_class_action_reg12_dout[9:0],
                f_key_class_action_reg13_dout[9:0],
                f_key_class_action_reg14_dout[9:0],
                f_key_class_action_reg15_dout[9:0]
                );


/***************************************/
//L2 RDC number
/***************************************/
assign vlan_parity_err_log_en	= vlan_parity_err & shft5_reg_en;

assign masked_vlan_tbl_dout	= {18{shft5_reg_en | cpu_vlan_gnt_3}} & vlan_tbl_din_reg_dout[17:0];
assign vlan_tbl_rd_data 	= mac_port_dec[0] ? masked_vlan_tbl_dout[3:0] :
                          	  mac_port_dec[1] ? masked_vlan_tbl_dout[7:4] :
                          	  mac_port_dec[2] ? masked_vlan_tbl_dout[12:9] :
                                            	    masked_vlan_tbl_dout[16:13];

assign vlan_rdc_num 	= vlan_tbl_rd_data[2:0];
assign vpr	    	= vlan_tbl_rd_data[3];
assign vlan_parity  	= {masked_vlan_tbl_dout[17], masked_vlan_tbl_dout[8]};

assign vlan_parity_bit	= {^masked_vlan_tbl_dout[16:9], ^masked_vlan_tbl_dout[7:0]};
assign vlan_parity_err	= !((vlan_parity_bit == vlan_parity) | disable_chksum) & encap_offset_reg[0];

assign use_vlan_rdc	= encap_offset_reg[0] & !vlan_parity_err;
assign vlan_rdc_prio	= use_vlan_rdc & vpr;
assign is_promis	= !ph_match & promiscuous;

/*
always @ (use_vlan_rdc or vlan_rdc_prio or mpr or 
	 vlan_rdc_num or mac_rdc_num)
if (vlan_rdc_prio)
	l2_rdc_num = vlan_rdc_num;
else if (mpr)
	l2_rdc_num = mac_rdc_num;
else if (use_vlan_rdc)
	l2_rdc_num = vlan_rdc_num;
else
	l2_rdc_num = mac_rdc_num;
*/

always @ (vlan_rdc_prio or vlan_rdc_num or mac_rdc_num)
if (vlan_rdc_prio)
	l2_rdc_num = vlan_rdc_num;
else
	l2_rdc_num = mac_rdc_num;

dffre #(3) l2_rdc_num_r_reg      (cclk, reset, shft5_reg_en, l2_rdc_num,      l2_rdc_num_r);
dffre #(1) vlan_parity_err_r_reg (cclk, reset, shft5_reg_en, vlan_parity_err, vlan_parity_err_r);
	
assign class_action_r0 = class[4] ? 2'b01 : class_action_r[2:1];
assign shft1_status = { is_promis, ph_match, class[4:0], 
			encap_offset_reg[0], encap_offset_reg[1], noport_r,
			badip_r, l4_protocol_r[1:0], ether_type[1:0], 
			class_action_r0[1:0], l2_rdc_num_r[2:0]}; //20 bits 


/***************************/
//Stage two 
/***************************/
always @ (
	encap_offset_reg or 
        shft2_reg4_dout or
        shft2_reg5_dout or
        shft2_reg6_dout or
        shft2_reg7_dout or
        shft2_reg8_dout or
        shft2_reg9_dout or
        shft2_reg10_dout or
        shft2_reg11_dout or
        shft2_reg12_dout or
        shft2_reg13_dout or
        shft2_reg14_dout or
        shft2_reg15_dout or
        shft3_reg0_dout or
        shft3_reg1_dout or
        shft3_reg2_dout or
        shft3_reg3_dout or
        shft3_reg4_dout or
        shft3_reg5_dout or
        shft3_reg6_dout or
        shft3_reg7_dout or
        shft3_reg8_dout or
        shft3_reg9_dout or
        shft3_reg10_dout or
        shft3_reg11_dout or
        shft3_reg12_dout or
        shft3_reg13_dout or
        shft3_reg14_dout or
        shft3_reg15_dout or
	shft4_reg0_dout or
        shft4_reg1_dout or
        shft4_reg2_dout or
        shft4_reg3_dout or
        shft4_reg4_dout or
        shft4_reg5_dout or
	shft4_reg6_dout or
        shft4_reg7_dout or
        shft4_reg8_dout or
        shft4_reg9_dout or
        shft4_reg10_dout or
        shft4_reg11_dout or
        shft4_reg12_dout or
        shft4_reg13_dout or
        shft4_reg14_dout or
        shft4_reg15_dout or
	shft5_reg0_dout or
        shft5_reg1_dout or
        shft5_reg2_dout or
        shft5_reg3_dout or
        shft5_reg4_dout or
        shft5_reg5_dout or
        shft5_reg6_dout or
        shft5_reg7_dout or
        shft5_reg8_dout or
        shft5_reg9_dout or
        shft5_reg10_dout or
        shft5_reg11_dout or
        shft5_reg12_dout or
        shft5_reg13_dout or
        shft5_reg14_dout or
        shft5_reg15_dout or
        //shft6_reg0_dout or
        //shft6_reg1_dout or
        shft6_reg2_dout or
        shft6_reg3_dout
	) 

begin
        case (encap_offset_reg) //synopsys parallel_case full_case
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:shftM_tmpN_dout_2"
        2'b00:  begin
		shft2_tmp4_dout = shft2_reg4_dout;
                shft2_tmp5_dout = shft2_reg5_dout;
                shft2_tmp6_dout = shft2_reg6_dout;
                shft2_tmp7_dout = shft2_reg7_dout;
                shft2_tmp8_dout = shft2_reg8_dout;
                shft2_tmp9_dout = shft2_reg9_dout;
                shft2_tmp10_dout = shft2_reg10_dout;
                shft2_tmp11_dout = shft2_reg11_dout;
                shft2_tmp12_dout = shft2_reg12_dout;
                shft2_tmp13_dout = shft2_reg13_dout;
                shft2_tmp14_dout = shft2_reg14_dout;
                shft2_tmp15_dout = shft2_reg15_dout;

                shft3_tmp0_dout = shft3_reg0_dout;
                shft3_tmp1_dout = shft3_reg1_dout;
                shft3_tmp2_dout = shft3_reg2_dout;
                shft3_tmp3_dout = shft3_reg3_dout;
                shft3_tmp4_dout = shft3_reg4_dout;
                shft3_tmp5_dout = shft3_reg5_dout;
                shft3_tmp6_dout = shft3_reg6_dout;
                shft3_tmp7_dout = shft3_reg7_dout;
                shft3_tmp8_dout = shft3_reg8_dout;
                shft3_tmp9_dout = shft3_reg9_dout;
                shft3_tmp10_dout = shft3_reg10_dout;
                shft3_tmp11_dout = shft3_reg11_dout;
                shft3_tmp12_dout = shft3_reg12_dout;
                shft3_tmp13_dout = shft3_reg13_dout;
		shft3_tmp14_dout = shft3_reg14_dout;
                shft3_tmp15_dout = shft3_reg15_dout;


                shft4_tmp0_dout = shft4_reg0_dout;
                shft4_tmp1_dout = shft4_reg1_dout;
                shft4_tmp2_dout = shft4_reg2_dout;
                shft4_tmp3_dout = shft4_reg3_dout;
		shft4_tmp4_dout = shft4_reg4_dout;
                shft4_tmp5_dout = shft4_reg5_dout;
                shft4_tmp6_dout = shft4_reg6_dout;
                shft4_tmp7_dout = shft4_reg7_dout;
                shft4_tmp8_dout = shft4_reg8_dout;
                shft4_tmp9_dout = shft4_reg9_dout;
                shft4_tmp10_dout = shft4_reg10_dout;
                shft4_tmp11_dout = shft4_reg11_dout;
                shft4_tmp12_dout = shft4_reg12_dout;
                shft4_tmp13_dout = shft4_reg13_dout;
		shft4_tmp14_dout = shft4_reg14_dout;
                shft4_tmp15_dout = shft4_reg15_dout;

		shft5_tmp0_dout = shft5_reg0_dout;
                shft5_tmp1_dout = shft5_reg1_dout;
                shft5_tmp2_dout = shft5_reg2_dout;
                shft5_tmp3_dout = shft5_reg3_dout;
                //shft5_tmp4_dout = shft5_reg4_dout;
                //shft5_tmp5_dout = shft5_reg5_dout;
                shft5_tmp6_dout = shft5_reg6_dout;
                shft5_tmp7_dout = shft5_reg7_dout;

                end

        2'b01:  begin
		shft2_tmp4_dout = shft2_reg8_dout;
                shft2_tmp5_dout = shft2_reg9_dout;
                shft2_tmp6_dout = shft2_reg10_dout;
                shft2_tmp7_dout = shft2_reg11_dout;
                shft2_tmp8_dout = shft2_reg12_dout;
                shft2_tmp9_dout = shft2_reg13_dout;
                shft2_tmp10_dout = shft2_reg14_dout;
                shft2_tmp11_dout = shft2_reg15_dout;
		shft2_tmp12_dout = shft3_reg0_dout;
                shft2_tmp13_dout = shft3_reg1_dout;
                shft2_tmp14_dout = shft3_reg2_dout;
                shft2_tmp15_dout = shft3_reg3_dout;

                shft3_tmp0_dout = shft3_reg4_dout;
                shft3_tmp1_dout = shft3_reg5_dout;
                shft3_tmp2_dout = shft3_reg6_dout;
                shft3_tmp3_dout = shft3_reg7_dout;
                shft3_tmp4_dout = shft3_reg8_dout;
                shft3_tmp5_dout = shft3_reg9_dout;
                shft3_tmp6_dout = shft3_reg10_dout;
                shft3_tmp7_dout = shft3_reg11_dout;
                shft3_tmp8_dout = shft3_reg12_dout;
                shft3_tmp9_dout = shft3_reg13_dout;
                shft3_tmp10_dout = shft3_reg14_dout;
                shft3_tmp11_dout = shft3_reg15_dout;
                shft3_tmp12_dout = shft4_reg0_dout;
                shft3_tmp13_dout = shft4_reg1_dout;
		shft3_tmp14_dout = shft4_reg2_dout;
                shft3_tmp15_dout = shft4_reg3_dout;

                shft4_tmp0_dout = shft4_reg4_dout;
                shft4_tmp1_dout = shft4_reg5_dout;
                shft4_tmp2_dout = shft4_reg6_dout;
                shft4_tmp3_dout = shft4_reg7_dout;
		shft4_tmp4_dout = shft4_reg8_dout;
                shft4_tmp5_dout = shft4_reg9_dout;
                shft4_tmp6_dout = shft4_reg10_dout;
                shft4_tmp7_dout = shft4_reg11_dout;
                shft4_tmp8_dout = shft4_reg12_dout;
                shft4_tmp9_dout = shft4_reg13_dout;
                shft4_tmp10_dout = shft4_reg14_dout;
                shft4_tmp11_dout = shft4_reg15_dout;
                shft4_tmp12_dout = shft5_reg0_dout;
                shft4_tmp13_dout = shft5_reg1_dout;
                shft4_tmp14_dout = shft5_reg2_dout;
                shft4_tmp15_dout = shft5_reg3_dout;

		shft5_tmp0_dout = shft5_reg4_dout;
                shft5_tmp1_dout = shft5_reg5_dout;
                shft5_tmp2_dout = shft5_reg6_dout;
                shft5_tmp3_dout = shft5_reg7_dout;
                //shft5_tmp4_dout = shft5_reg8_dout;
                //shft5_tmp5_dout = shft5_reg9_dout;
                shft5_tmp6_dout = shft5_reg10_dout;
                shft5_tmp7_dout = shft5_reg11_dout;

                end

        2'b10:  begin
		shft2_tmp4_dout = shft2_reg12_dout;
                shft2_tmp5_dout = shft2_reg13_dout;
                shft2_tmp6_dout = shft2_reg14_dout;
                shft2_tmp7_dout = shft2_reg15_dout;
		shft2_tmp8_dout = shft3_reg0_dout;
                shft2_tmp9_dout = shft3_reg1_dout;
                shft2_tmp10_dout = shft3_reg2_dout;
                shft2_tmp11_dout = shft3_reg3_dout;
                shft2_tmp12_dout = shft3_reg4_dout;
                shft2_tmp13_dout = shft3_reg5_dout;
                shft2_tmp14_dout = shft3_reg6_dout;
                shft2_tmp15_dout = shft3_reg7_dout;

                shft3_tmp0_dout = shft3_reg8_dout;
                shft3_tmp1_dout = shft3_reg9_dout;
                shft3_tmp2_dout = shft3_reg10_dout;
                shft3_tmp3_dout = shft3_reg11_dout;
                shft3_tmp4_dout = shft3_reg12_dout;
                shft3_tmp5_dout = shft3_reg13_dout;
                shft3_tmp6_dout = shft3_reg14_dout;
                shft3_tmp7_dout = shft3_reg15_dout;
                shft3_tmp8_dout = shft4_reg0_dout;
                shft3_tmp9_dout = shft4_reg1_dout;
                shft3_tmp10_dout = shft4_reg2_dout;
                shft3_tmp11_dout = shft4_reg3_dout;
                shft3_tmp12_dout = shft4_reg4_dout;
                shft3_tmp13_dout = shft4_reg5_dout;
		shft3_tmp14_dout = shft4_reg6_dout;
                shft3_tmp15_dout = shft4_reg7_dout;

                shft4_tmp0_dout = shft4_reg8_dout;
                shft4_tmp1_dout = shft4_reg9_dout;
                shft4_tmp2_dout = shft4_reg10_dout;
                shft4_tmp3_dout = shft4_reg11_dout;
		shft4_tmp4_dout = shft4_reg12_dout;
                shft4_tmp5_dout = shft4_reg13_dout;
                shft4_tmp6_dout = shft4_reg14_dout;
                shft4_tmp7_dout = shft4_reg15_dout;
                shft4_tmp8_dout = shft5_reg0_dout;
                shft4_tmp9_dout = shft5_reg1_dout;
                shft4_tmp10_dout = shft5_reg2_dout;
                shft4_tmp11_dout = shft5_reg3_dout;
                shft4_tmp12_dout = shft5_reg4_dout;
                shft4_tmp13_dout = shft5_reg5_dout;
                shft4_tmp14_dout = shft5_reg6_dout;
                shft4_tmp15_dout = shft5_reg7_dout;

                shft5_tmp0_dout = shft5_reg8_dout;
                shft5_tmp1_dout = shft5_reg9_dout;
                shft5_tmp2_dout = shft5_reg10_dout;
                shft5_tmp3_dout = shft5_reg11_dout;
                //shft5_tmp4_dout = shft5_reg12_dout;
                //shft5_tmp5_dout = shft5_reg13_dout;
                shft5_tmp6_dout = shft5_reg14_dout;
                shft5_tmp7_dout = shft5_reg15_dout;

                end

        2'b11:  begin
		shft2_tmp4_dout = shft3_reg0_dout;
                shft2_tmp5_dout = shft3_reg1_dout;
                shft2_tmp6_dout = shft3_reg2_dout;
                shft2_tmp7_dout = shft3_reg3_dout;
                shft2_tmp8_dout = shft3_reg4_dout;
                shft2_tmp9_dout = shft3_reg5_dout;
                shft2_tmp10_dout = shft3_reg6_dout;
                shft2_tmp11_dout = shft3_reg7_dout;
                shft2_tmp12_dout = shft3_reg8_dout;
                shft2_tmp13_dout = shft3_reg9_dout;
                shft2_tmp14_dout = shft3_reg10_dout;
                shft2_tmp15_dout = shft3_reg11_dout;

                shft3_tmp0_dout = shft3_reg12_dout;
                shft3_tmp1_dout = shft3_reg13_dout;
                shft3_tmp2_dout = shft3_reg14_dout;
                shft3_tmp3_dout = shft3_reg15_dout;
                shft3_tmp4_dout = shft4_reg0_dout;
                shft3_tmp5_dout = shft4_reg1_dout;
                shft3_tmp6_dout = shft4_reg2_dout;
                shft3_tmp7_dout = shft4_reg3_dout;
                shft3_tmp8_dout = shft4_reg4_dout;
                shft3_tmp9_dout = shft4_reg5_dout;
                shft3_tmp10_dout = shft4_reg6_dout;
                shft3_tmp11_dout = shft4_reg7_dout;
                shft3_tmp12_dout = shft4_reg8_dout;
                shft3_tmp13_dout = shft4_reg9_dout;
		shft3_tmp14_dout = shft4_reg10_dout;
                shft3_tmp15_dout = shft4_reg11_dout;

                shft4_tmp0_dout = shft4_reg12_dout;
                shft4_tmp1_dout = shft4_reg13_dout;
                shft4_tmp2_dout = shft4_reg14_dout;
                shft4_tmp3_dout = shft4_reg15_dout;
		shft4_tmp4_dout = shft5_reg0_dout;
                shft4_tmp5_dout = shft5_reg1_dout;
                shft4_tmp6_dout = shft5_reg2_dout;
                shft4_tmp7_dout = shft5_reg3_dout;
                shft4_tmp8_dout = shft5_reg4_dout;
                shft4_tmp9_dout = shft5_reg5_dout;
                shft4_tmp10_dout = shft5_reg6_dout;
                shft4_tmp11_dout = shft5_reg7_dout;
                shft4_tmp12_dout = shft5_reg8_dout;
                shft4_tmp13_dout = shft5_reg9_dout;
                shft4_tmp14_dout = shft5_reg10_dout;
                shft4_tmp15_dout = shft5_reg11_dout;

                shft5_tmp0_dout = shft5_reg12_dout;
                shft5_tmp1_dout = shft5_reg13_dout;
                shft5_tmp2_dout = shft5_reg14_dout;
                shft5_tmp3_dout = shft5_reg15_dout;
                //shft5_tmp4_dout = shft6_reg0_dout;
                //shft5_tmp5_dout = shft6_reg1_dout;
                shft5_tmp6_dout = shft6_reg2_dout;
                shft5_tmp7_dout = shft6_reg3_dout;

                end

	default:begin
                shft2_tmp4_dout = 8'b0;
                shft2_tmp5_dout = 8'b0;
                shft2_tmp6_dout = 8'b0;
                shft2_tmp7_dout = 8'b0;
                shft2_tmp8_dout = 8'b0;
                shft2_tmp9_dout = 8'b0;
                shft2_tmp10_dout = 8'b0;
                shft2_tmp11_dout = 8'b0;
                shft2_tmp12_dout = 8'b0;
                shft2_tmp13_dout = 8'b0;
                shft2_tmp14_dout = 8'b0;
                shft2_tmp15_dout = 8'b0;

		shft3_tmp0_dout = 8'b0;
                shft3_tmp1_dout = 8'b0;
                shft3_tmp2_dout = 8'b0;
                shft3_tmp3_dout = 8'b0;
                shft3_tmp4_dout = 8'b0;
                shft3_tmp5_dout = 8'b0;
                shft3_tmp6_dout = 8'b0;
                shft3_tmp7_dout = 8'b0;
                shft3_tmp8_dout = 8'b0;
                shft3_tmp9_dout = 8'b0;
                shft3_tmp10_dout = 8'b0;
                shft3_tmp11_dout = 8'b0;
                shft3_tmp12_dout = 8'b0;
                shft3_tmp13_dout = 8'b0;
		shft3_tmp14_dout = 8'b0;
		shft3_tmp15_dout = 8'b0;

                shft4_tmp0_dout = 8'b0;
                shft4_tmp1_dout = 8'b0;
                shft4_tmp2_dout = 8'b0;
                shft4_tmp3_dout = 8'b0;
		shft4_tmp4_dout = 8'b0;
                shft4_tmp5_dout = 8'b0;
                shft4_tmp6_dout = 8'b0;
                shft4_tmp7_dout = 8'b0;
                shft4_tmp8_dout = 8'b0;
                shft4_tmp9_dout = 8'b0;
                shft4_tmp10_dout = 8'b0;
                shft4_tmp11_dout = 8'b0;
                shft4_tmp12_dout = 8'b0;
                shft4_tmp13_dout = 8'b0;
                shft4_tmp14_dout = 8'b0;
                shft4_tmp15_dout = 8'b0;

                shft5_tmp0_dout = 8'b0;
                shft5_tmp1_dout = 8'b0;
                shft5_tmp2_dout = 8'b0;
                shft5_tmp3_dout = 8'b0;
                //shft5_tmp4_dout = 8'b0;
                //shft5_tmp5_dout = 8'b0;
                shft5_tmp6_dout = 8'b0;
                shft5_tmp7_dout = 8'b0;

                end
        endcase
end

assign ipv4_tos		= shft0_tmp15_dout;
assign ipv4_protocol    = shft1_tmp7_dout;
assign ipv4_src_addr    = {shft1_tmp10_dout, shft1_tmp11_dout, 
			   shft1_tmp12_dout, shft1_tmp13_dout};
assign ipv4_dest_addr   = {shft1_tmp14_dout, shft1_tmp15_dout, 
			   shft2_tmp0_dout, shft2_tmp1_dout};

/*
assign ipv4_ah_spi      = {shft2_tmp6_dout, shft2_tmp7_dout, 
			   shft2_tmp8_dout, shft2_tmp9_dout};
assign ipv4_esp_spi     = {shft2_tmp2_dout, shft2_tmp3_dout, 
			   shft2_tmp4_dout, shft2_tmp5_dout};
*/

assign ipv6_tos		= {shft0_tmp14_dout[3:0], shft0_tmp15_dout[7:4]};
assign ipv6_next_hdr    = shft1_tmp4_dout;
assign ipv6_src_addr    = {shft1_tmp6_dout, shft1_tmp7_dout, 
			   shft1_tmp8_dout, shft1_tmp9_dout,
                           shft1_tmp10_dout, shft1_tmp11_dout, 
			   shft1_tmp12_dout, shft1_tmp13_dout,
                           shft1_tmp14_dout, shft1_tmp15_dout, 
			   shft2_tmp0_dout, shft2_tmp1_dout,
                           shft2_tmp2_dout, shft2_tmp3_dout, 
			   shft2_tmp4_dout, shft2_tmp5_dout};

assign ipv6_dest_addr_pre = {shft2_tmp6_dout, shft2_tmp7_dout, 
			     shft2_tmp8_dout, shft2_tmp9_dout,
                             shft2_tmp10_dout, shft2_tmp11_dout, 
			     shft2_tmp12_dout, shft2_tmp13_dout};

assign ipv6_dest_addr_suf = {shft2_tmp14_dout, shft2_tmp15_dout, 
			     shft3_tmp0_dout, shft3_tmp1_dout,
                             shft3_tmp2_dout, shft3_tmp3_dout, 
			     shft3_tmp4_dout, shft3_tmp5_dout};

assign ipv6_dest_addr	  = {ipv6_dest_addr_pre, ipv6_dest_addr_suf};

assign ipv6_tcp_src_port  = {shft3_tmp6_dout, shft3_tmp7_dout};
assign ipv6_tcp_dest_port = {shft3_tmp8_dout, shft3_tmp9_dout};

/*
assign ipv6_ah_spi      = {shft3_tmp10_dout, shft3_tmp11_dout, 
			   shft3_tmp12_dout, shft3_tmp13_dout};
assign ipv6_esp_spi     = {shft3_tmp6_dout, shft3_tmp7_dout, 
			   shft3_tmp8_dout, shft3_tmp9_dout};
*/

/*******************************************/
//Extract IPV4/TCP ports (shift5, stage6_en)
/*******************************************/
always @ (
	ipv4_ip_hdr_len_r[1:0] or
	shft2_tmp2_dout_r or
	shft2_tmp3_dout_r or
	shft2_tmp4_dout or
	shft2_tmp5_dout or

	shft2_tmp6_dout or
	shft2_tmp7_dout or
	shft2_tmp8_dout or
	shft2_tmp9_dout or

	shft2_tmp10_dout or
	shft2_tmp11_dout or
	shft2_tmp12_dout or
	shft2_tmp13_dout)

begin

	case (ipv4_ip_hdr_len_r[1:0]) //synopsys parallel_case full_case 
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:v4_tcp_port_1"

	2'b00, 2'b01:	v4_tcp_port_01 = {shft2_tmp2_dout_r, shft2_tmp3_dout_r, shft2_tmp4_dout, shft2_tmp5_dout};
	2'b10:		v4_tcp_port_01 = {shft2_tmp6_dout, shft2_tmp7_dout, shft2_tmp8_dout, shft2_tmp9_dout};
	2'b11:		v4_tcp_port_01 = {shft2_tmp10_dout, shft2_tmp11_dout, shft2_tmp12_dout, shft2_tmp13_dout};
	default:	v4_tcp_port_01 = 32'b0;

	endcase
end

always @ (
	ipv4_ip_hdr_len_r[1:0] or
	shft2_tmp14_dout or
	shft2_tmp15_dout or
	shft3_tmp0_dout or
	shft3_tmp1_dout or

	shft3_tmp2_dout or
        shft3_tmp3_dout or
        shft3_tmp4_dout or
        shft3_tmp5_dout or

        shft3_tmp6_dout or
        shft3_tmp7_dout or
        shft3_tmp8_dout or
        shft3_tmp9_dout or

        shft3_tmp10_dout or
        shft3_tmp11_dout or
        shft3_tmp12_dout or
        shft3_tmp13_dout)

begin
	case (ipv4_ip_hdr_len_r[1:0]) //synopsys parallel_case full_case
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:v4_tcp_port_2"
	
	2'b00:		v4_tcp_port_10 = {shft2_tmp14_dout, shft2_tmp15_dout, shft3_tmp0_dout, shft3_tmp1_dout};
	2'b01:		v4_tcp_port_10 = {shft3_tmp2_dout, shft3_tmp3_dout, shft3_tmp4_dout, shft3_tmp5_dout};  
	2'b10:		v4_tcp_port_10 = {shft3_tmp6_dout, shft3_tmp7_dout, shft3_tmp8_dout, shft3_tmp9_dout};
	2'b11:		v4_tcp_port_10 = {shft3_tmp10_dout, shft3_tmp11_dout, shft3_tmp12_dout, shft3_tmp13_dout};
	default:	v4_tcp_port_10 = 32'b0;

	endcase
end

always @ (
	ipv4_ip_hdr_len_r[1:0] or
	shft3_tmp14_dout or
        shft3_tmp15_dout or
        shft4_tmp0_dout or
        shft4_tmp1_dout or

	shft4_tmp2_dout or
        shft4_tmp3_dout or
        shft4_tmp4_dout or
        shft4_tmp5_dout or

        shft4_tmp6_dout or
        shft4_tmp7_dout or
        shft4_tmp8_dout or
        shft4_tmp9_dout or

        shft4_tmp10_dout or
        shft4_tmp11_dout or
        shft4_tmp12_dout or
        shft4_tmp13_dout) 

begin

	case (ipv4_ip_hdr_len_r[1:0]) //synopsys parallel_case full_case
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:v4_tcp_port_3"

	2'b00:		v4_tcp_port_11 = {shft3_tmp14_dout, shft3_tmp15_dout, shft4_tmp0_dout, shft4_tmp1_dout};
	2'b01:		v4_tcp_port_11 = {shft4_tmp2_dout, shft4_tmp3_dout, shft4_tmp4_dout, shft4_tmp5_dout};
	2'b10:		v4_tcp_port_11 = {shft4_tmp6_dout, shft4_tmp7_dout, shft4_tmp8_dout, shft4_tmp9_dout};
	2'b11:		v4_tcp_port_11 = {shft4_tmp10_dout, shft4_tmp11_dout, shft4_tmp12_dout, shft4_tmp13_dout};
	default:	v4_tcp_port_11 = 32'b0;

	endcase
end


always @ (
	ipv4_ip_hdr_len_r[3:2] or
	v4_tcp_port_01_r or
	v4_tcp_port_10_r or
	v4_tcp_port_11)

begin
	case (ipv4_ip_hdr_len_r[3:2]) //synopsys parallel_case full_case
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:v4_tcp_port_4"

	2'b00, 2'b01:	v4_tcp_port = v4_tcp_port_01_r;
	2'b10:		v4_tcp_port = v4_tcp_port_10_r;
	2'b11:		v4_tcp_port = v4_tcp_port_11;
	default:	v4_tcp_port = 32'b0;

	endcase
end

	
dffre #(32)  v4_tcp_port_01_r_reg	(cclk, reset, shft4_reg_en, v4_tcp_port_01, v4_tcp_port_01_r);
dffre #(32)  v4_tcp_port_10_r_reg	(cclk, reset, shft5_reg_en, v4_tcp_port_10, v4_tcp_port_10_r);
dffre #(8)   ipv4_tos_r_reg		(cclk, reset, shft5_reg_en, ipv4_tos,       ipv4_tos_r);
dffre #(8)   ipv4_protocol_r_reg	(cclk, reset, shft5_reg_en, ipv4_protocol,  ipv4_protocol_r);
dffre #(32)  ipv4_src_addr_r_reg	(cclk, reset, shft5_reg_en, ipv4_src_addr,  ipv4_src_addr_r);
dffre #(32)  ipv4_dest_addr_r_reg	(cclk, reset, shft5_reg_en, ipv4_dest_addr, ipv4_dest_addr_r);
/*
dffre #(32)  ipv4_ah_spi_r_reg		(cclk, reset, shft5_reg_en, ipv4_ah_spi,    ipv4_ah_spi_r);
dffre #(32)  ipv4_esp_spi_r_reg		(cclk, reset, shft5_reg_en, ipv4_esp_spi,   ipv4_esp_spi_r);
*/

dffre #(8)   ipv6_tos_r_reg             (cclk, reset, shft5_reg_en, ipv6_tos,          ipv6_tos_r);
dffre #(8)   ipv6_next_hdr_r_reg        (cclk, reset, shft5_reg_en, ipv6_next_hdr,     ipv6_next_hdr_r);
dffre #(128) ipv6_src_addr_r_reg        (cclk, reset, shft5_reg_en, ipv6_src_addr,     ipv6_src_addr_r);
dffre #(128) ipv6_dest_addr_r_reg       (cclk, reset, shft5_reg_en, ipv6_dest_addr,    ipv6_dest_addr_r);
dffre #(16)  ipv6_tcp_src_port_r_reg	(cclk, reset, shft5_reg_en, ipv6_tcp_src_port, ipv6_tcp_src_port_r);
dffre #(16)  ipv6_tcp_dest_port_r_reg	(cclk, reset, shft5_reg_en, ipv6_tcp_dest_port,ipv6_tcp_dest_port_r);
/*
dffre #(32)  ipv6_ah_spi_r_reg          (cclk, reset, shft5_reg_en, ipv6_ah_spi,       ipv6_ah_spi_r);
dffre #(32)  ipv6_esp_spi_r_reg         (cclk, reset, shft5_reg_en, ipv6_esp_spi,      ipv6_esp_spi_r);
*/

dffre #(32)  v4_tcp_port_r_reg		(cclk, reset, shft6_reg_en, v4_tcp_port,    v4_tcp_port_r);  //{src, dest}

assign	    v6_tcp_port_r		= {ipv6_tcp_src_port_r, ipv6_tcp_dest_port_r};

/******************************/
//Gen raw key
/******************************/
assign do_raw_key       = (class[4:2] == 3'b0) | (class[4] == 1'b1);

assign raw_cam_key      = {shft1_tmp8_dout, shft1_tmp7_dout,
                           shft1_tmp6_dout, shft1_tmp5_dout,
                           shft1_tmp4_dout, shft1_tmp3_dout,
                           shft1_tmp2_dout, shft1_tmp1_dout,
                           shft1_tmp0_dout, shft0_tmp15_dout,
                           shft0_tmp14_dout};

dffre #(88) raw_cam_key_r_reg	(cclk, reset, shft3_reg_en, raw_cam_key, raw_cam_key_r);
dffre #(1)  do_raw_key_r_reg	(cclk, reset, shft6_reg_en, do_raw_key,  do_raw_key_r);

/********************************/
//GEN TCAM key (stage7_en)
/********************************/
dffre #(3) class_action_r_reg  (cclk, reset, shft6_reg_en, class_action, class_action_r);

assign class_action_ipaddr  	= class_action_r[0];

assign v4_cam_key	= {class, 5'b0, l2_rdc_num_r, noport_r, 74'b0, ipv4_tos_r, ipv4_protocol_r, v4_tcp_port_r, ipv4_src_addr_r, ipv4_dest_addr_r};  
assign v4_cam_key_ah	= {class, 5'b0, l2_rdc_num_r, noport_r, 74'b0, ipv4_tos_r, ipv4_protocol_r, v4_seq_num_r,  ipv4_src_addr_r, ipv4_dest_addr_r};
assign v4_cam_key_esp	= {class, 5'b0, l2_rdc_num_r, noport_r, 74'b0, ipv4_tos_r, ipv4_protocol_r, v4_tcp_port_r, ipv4_src_addr_r, ipv4_dest_addr_r};

assign v6_cam_key_src		= {class, 5'b0, l2_rdc_num_r, 11'b0, ipv6_tos_r, ipv6_next_hdr_r, v6_tcp_port_r, ipv6_src_addr_r};  
assign v6_cam_key_src_ah	= {class, 5'b0, l2_rdc_num_r, 11'b0, ipv6_tos_r, ipv6_next_hdr_r, v6_seq_num_r,  ipv6_src_addr_r};
assign v6_cam_key_src_esp	= {class, 5'b0, l2_rdc_num_r, 11'b0, ipv6_tos_r, ipv6_next_hdr_r, v6_tcp_port_r, ipv6_src_addr_r};

assign v6_cam_key_dest		= {class, 5'b0, l2_rdc_num_r, 11'b0, ipv6_tos_r, ipv6_next_hdr_r, v6_tcp_port_r, ipv6_dest_addr_r};
assign v6_cam_key_dest_ah	= {class, 5'b0, l2_rdc_num_r, 11'b0, ipv6_tos_r, ipv6_next_hdr_r, v6_seq_num_r,  ipv6_dest_addr_r};
assign v6_cam_key_dest_esp	= {class, 5'b0, l2_rdc_num_r, 11'b0, ipv6_tos_r, ipv6_next_hdr_r, v6_tcp_port_r, ipv6_dest_addr_r};

assign v4_5t_cam_key	= v4_protocol[3]  			?	v4_cam_key_esp  :
			  v4_protocol[2]  			?	v4_cam_key_ah	:
									v4_cam_key;

assign v6_4t_cam_key	= !class_action_ipaddr & v6_next_hdr[3] ?	v6_cam_key_dest_esp :
			  !class_action_ipaddr & v6_next_hdr[2] ?	v6_cam_key_dest_ah  :
			  !class_action_ipaddr		    	?	v6_cam_key_dest     :
			  class_action_ipaddr & v6_next_hdr[3]  ?	v6_cam_key_src_esp  :
		  	  class_action_ipaddr & v6_next_hdr[2]  ?	v6_cam_key_src_ah   :
									v6_cam_key_src; 

assign raw_cam_key_r0	= {class, 3'b0, raw_cam_key_r, 104'b0};


assign tcam_key		= do_raw_key_r  ? 	raw_cam_key_r0 :
			  ether_type[0]	?	v4_5t_cam_key  :
						v6_4t_cam_key;


dffre  #(200) tcam_key_r_reg	(cclk, reset, shft7_reg_en, tcam_key, tcam_key_r);

/********************************/
//GEN FLOW CAM key (stage7_en)
/********************************/
dffre #(10) f_key_class_action_r_reg	(cclk, reset, shft6_reg_en, f_key_class_action, f_key_class_action_r);

assign f_key_class_action_l4_1	= f_key_class_action_r[1:0];
assign f_key_class_action_l4_0	= f_key_class_action_r[3:2];
assign f_key_class_action_prot	= f_key_class_action_r[4];
assign f_key_class_action_ip_da	= f_key_class_action_r[5];
assign f_key_class_action_ip_sa	= f_key_class_action_r[6];
assign f_key_class_action_vlan	= f_key_class_action_r[7];
assign f_key_class_action_l2_da	= f_key_class_action_r[8];
assign f_key_class_action_vport	= f_key_class_action_r[9];

assign prot_bytes		= ether_type[1] ? ipv6_next_hdr_r	   : ipv4_protocol_r;
assign ip_da_bytes_0		= ether_type[1] ? ipv6_dest_addr_r[31:0]   : ipv4_dest_addr_r[31:0];
assign ip_da_bytes_1		= ether_type[1] ? ipv6_dest_addr_r[63:32]  : 32'b0;
assign ip_da_bytes_2		= ether_type[1] ? ipv6_dest_addr_r[95:64]  : 32'b0;
assign ip_da_bytes_3		= ether_type[1] ? ipv6_dest_addr_r[127:96] : 32'b0;

assign ip_sa_bytes_0		= ether_type[1] ? ipv6_src_addr_r[31:0]   : ipv4_src_addr_r[31:0];
assign ip_sa_bytes_1		= ether_type[1] ? ipv6_src_addr_r[63:32]  : 32'b0;
assign ip_sa_bytes_2		= ether_type[1] ? ipv6_src_addr_r[95:64]  : 32'b0;
assign ip_sa_bytes_3		= ether_type[1] ? ipv6_src_addr_r[127:96] : 32'b0;							

assign vlan_bytes_valid		= encap_offset_reg[0] & f_key_class_action_vlan; 

assign f_key_l4_1_bytes		= (f_key_class_action_l4_1 == 2'b00) ? 16'b0 :
				  (f_key_class_action_l4_1 == 2'b01) ? 16'b0 :
				  (f_key_class_action_l4_1 == 2'b10) ? tcp_port[15:0] : 
								       tcp_seq_num[15:0];

assign f_key_l4_0_bytes		= (f_key_class_action_l4_0 == 2'b00) ? 16'b0 :
                                  (f_key_class_action_l4_0 == 2'b01) ? 16'b0 :
                                  (f_key_class_action_l4_0 == 2'b10) ? tcp_port[31:16] : 
                                                                       tcp_seq_num[31:16];

assign f_key_prot_bytes		= f_key_class_action_prot	? prot_bytes    : 8'b0;
assign f_key_ip_da_bytes_0	= f_key_class_action_ip_da	? ip_da_bytes_0 : 32'b0; 
assign f_key_ip_da_bytes_1	= f_key_class_action_ip_da	? ip_da_bytes_1 : 32'b0;
assign f_key_ip_da_bytes_2	= f_key_class_action_ip_da	? ip_da_bytes_2 : 32'b0;
assign f_key_ip_da_bytes_3	= f_key_class_action_ip_da      ? ip_da_bytes_3 : 32'b0;

assign f_key_ip_sa_bytes_0      = f_key_class_action_ip_sa      ? ip_sa_bytes_0 : 32'b0;
assign f_key_ip_sa_bytes_1      = f_key_class_action_ip_sa      ? ip_sa_bytes_1 : 32'b0;
assign f_key_ip_sa_bytes_2      = f_key_class_action_ip_sa      ? ip_sa_bytes_2 : 32'b0;
assign f_key_ip_sa_bytes_3      = f_key_class_action_ip_sa      ? ip_sa_bytes_3 : 32'b0;

assign f_key_vlan_valid		= vlan_bytes_valid 		? 4'b1111 : 4'b0000;
assign f_key_vlan_bytes		= vlan_bytes_valid		? vlan_tag_id[11:0] : 12'b0;
assign f_key_l2_da_bytes	= f_key_class_action_l2_da	? mac_dest_addr : 48'b0;
assign f_key_vport_bytes	= f_key_class_action_vport	? mac_port : 2'b0;

assign flow_key			= {f_key_vlan_valid, f_key_l2_da_bytes, f_key_vlan_bytes,
				f_key_ip_sa_bytes_3, f_key_ip_sa_bytes_2, 
				f_key_ip_sa_bytes_1, f_key_ip_sa_bytes_0,
				f_key_ip_da_bytes_3, f_key_ip_da_bytes_2,
				f_key_ip_da_bytes_1, f_key_ip_da_bytes_0,
				f_key_l4_0_bytes, f_key_l4_1_bytes, f_key_prot_bytes, f_key_vport_bytes};

dffre #(362) flow_key_r_reg	(cclk, reset, shft7_reg_en, flow_key, flow_key_r);

/********************************/
//Extract TCP SEQUENCE NUMBER
/********************************/
always @ (
        ipv4_ip_hdr_len_r0[1:0] or
        shft2_tmp6_dout or
        shft2_tmp7_dout or
        shft2_tmp8_dout or
        shft2_tmp9_dout or

        shft2_tmp10_dout or
        shft2_tmp11_dout or
        shft2_tmp12_dout or
        shft2_tmp13_dout or

        shft2_tmp14_dout or
        shft2_tmp15_dout or
        shft3_tmp0_dout or
        shft3_tmp1_dout)

begin

        case (ipv4_ip_hdr_len_r0[1:0]) //synopsys parallel_case full_case
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:v4_seq_num_1"

        2'b00, 2'b01:   v4_seq_num_01 = {shft2_tmp6_dout, shft2_tmp7_dout, shft2_tmp8_dout, shft2_tmp9_dout};
        2'b10:          v4_seq_num_01 = {shft2_tmp10_dout, shft2_tmp11_dout, shft2_tmp12_dout, shft2_tmp13_dout};
        2'b11:          v4_seq_num_01 = {shft2_tmp14_dout, shft2_tmp15_dout, shft3_tmp0_dout, shft3_tmp1_dout};
        default:        v4_seq_num_01 = 32'b0;

        endcase
end

always @ (
        ipv4_ip_hdr_len_r0[1:0] or
        shft3_tmp2_dout or
        shft3_tmp3_dout or
        shft3_tmp4_dout or
        shft3_tmp5_dout or

        shft3_tmp6_dout or
        shft3_tmp7_dout or
        shft3_tmp8_dout or
        shft3_tmp9_dout or

        shft3_tmp10_dout or
        shft3_tmp11_dout or
        shft3_tmp12_dout or
        shft3_tmp13_dout or
	
	shft3_tmp14_dout or
        shft3_tmp15_dout or
        shft4_tmp0_dout or
        shft4_tmp1_dout)

begin
        case (ipv4_ip_hdr_len_r0[1:0]) //synopsys parallel_case full_case
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:v4_seq_num_2"

        2'b00:          v4_seq_num_10 = {shft3_tmp2_dout, shft3_tmp3_dout, shft3_tmp4_dout, shft3_tmp5_dout};
        2'b01:          v4_seq_num_10 = {shft3_tmp6_dout, shft3_tmp7_dout, shft3_tmp8_dout, shft3_tmp9_dout};
        2'b10:          v4_seq_num_10 = {shft3_tmp10_dout, shft3_tmp11_dout, shft3_tmp12_dout, shft3_tmp13_dout};
	2'b11:		v4_seq_num_10 = {shft3_tmp14_dout, shft3_tmp15_dout, shft4_tmp0_dout, shft4_tmp1_dout};
        default:        v4_seq_num_10 = 32'b0;

        endcase
end

always @ (
        ipv4_ip_hdr_len_r0[1:0] or
        shft4_tmp2_dout or
        shft4_tmp3_dout or
        shft4_tmp4_dout or
        shft4_tmp5_dout or

        shft4_tmp6_dout or
        shft4_tmp7_dout or
        shft4_tmp8_dout or
        shft4_tmp9_dout or

        shft4_tmp10_dout or
        shft4_tmp11_dout or
        shft4_tmp12_dout or
        shft4_tmp13_dout or

	shft4_tmp14_dout or
        shft4_tmp15_dout or
        shft5_tmp0_dout or
        shft5_tmp1_dout)

begin

        case (ipv4_ip_hdr_len_r0[1:0]) //synopsys parallel_case full_case
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:v4_seq_num_3"

        2'b00:          v4_seq_num_11 = {shft4_tmp2_dout, shft4_tmp3_dout, shft4_tmp4_dout, shft4_tmp5_dout};
        2'b01:          v4_seq_num_11 = {shft4_tmp6_dout, shft4_tmp7_dout, shft4_tmp8_dout, shft4_tmp9_dout};
        2'b10:          v4_seq_num_11 = {shft4_tmp10_dout, shft4_tmp11_dout, shft4_tmp12_dout, shft4_tmp13_dout};
	2'b11:		v4_seq_num_11 = {shft4_tmp14_dout, shft4_tmp15_dout, shft5_tmp0_dout, shft5_tmp1_dout};
        default:        v4_seq_num_11 = 32'b0;

        endcase
end


always @ (
	ipv4_ip_hdr_len_r0[3:2] or
        v4_seq_num_01_r or
        v4_seq_num_10_r or
        v4_seq_num_11)

begin
        case (ipv4_ip_hdr_len_r0[3:2]) //synopsys parallel_case full_case
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:v4_seq_num_4"

        2'b00, 2'b01:   v4_seq_num = v4_seq_num_01_r;
        2'b10:          v4_seq_num = v4_seq_num_10_r;
        2'b11:          v4_seq_num = v4_seq_num_11;
        default:        v4_seq_num = 32'b0;

        endcase
end

assign v6_seq_num	= {shft3_tmp10_dout, shft3_tmp11_dout, shft3_tmp12_dout, shft3_tmp13_dout};

dffre #(32) v4_seq_num_01_r_reg	(cclk, reset, shft4_reg_en, v4_seq_num_01, v4_seq_num_01_r);
dffre #(32) v4_seq_num_10_r_reg (cclk, reset, shft5_reg_en, v4_seq_num_10, v4_seq_num_10_r);
dffre #(32) v4_seq_num_r_reg	(cclk, reset, shft6_reg_en, v4_seq_num,    v4_seq_num_r);
dffre #(32) v6_seq_num_r_reg	(cclk, reset, shft5_reg_en, v6_seq_num,    v6_seq_num_r);

/********************************/
//Extract TCP LEN FIELD
/********************************/
always @ (
	ipv4_ip_hdr_len_r0[1:0] or
	shft2_tmp14_dout or
	shft3_tmp2_dout or
	shft3_tmp6_dout)
	
begin
	case (ipv4_ip_hdr_len_r0[1:0]) //synopsys parallel_case full_case
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:v4_tcp_len_1"
	2'b00, 2'b01:	v4_tcp_len_01 = shft2_tmp14_dout[7:4];
	2'b10:		v4_tcp_len_01 = shft3_tmp2_dout[7:4];
	2'b11:		v4_tcp_len_01 = shft3_tmp6_dout[7:4];
	default:	v4_tcp_len_01 = 4'b0;

	endcase
end

always @ (
        ipv4_ip_hdr_len_r0[1:0] or
        shft3_tmp10_dout or
        shft3_tmp14_dout or
        shft4_tmp2_dout or
	shft4_tmp6_dout)
        
begin
        case (ipv4_ip_hdr_len_r0[1:0]) //synopsys parallel_case full_case
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:v4_tcp_len_2"
        2'b00:    	v4_tcp_len_10 = shft3_tmp10_dout[7:4];
	2'b01:		v4_tcp_len_10 = shft3_tmp14_dout[7:4];
        2'b10:          v4_tcp_len_10 = shft4_tmp2_dout[7:4];
        2'b11:          v4_tcp_len_10 = shft4_tmp6_dout[7:4];
        default:        v4_tcp_len_10 = 4'b0;

        endcase
end     

always @ (
        ipv4_ip_hdr_len_r0[1:0] or
        shft4_tmp10_dout or
        shft4_tmp14_dout or
        shft5_tmp2_dout or
        shft5_tmp6_dout)
        
begin
        case (ipv4_ip_hdr_len_r0[1:0]) //synopsys parallel_case full_case
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:v4_tcp_len_3"
        2'b00:          v4_tcp_len_11 = shft4_tmp10_dout[7:4];
        2'b01:          v4_tcp_len_11 = shft4_tmp14_dout[7:4];
        2'b10:          v4_tcp_len_11 = shft5_tmp2_dout[7:4];
        2'b11:          v4_tcp_len_11 = shft5_tmp6_dout[7:4];
        default:        v4_tcp_len_11 = 4'b0;

        endcase
end     


always @ (
	ipv4_ip_hdr_len_r0[3:2] or
	v4_tcp_len_01_r or
	v4_tcp_len_10_r or
	v4_tcp_len_11)

begin
	case (ipv4_ip_hdr_len_r0[3:2]) //synopsys parallel_case full_case
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:v4_tcp_len_4"

	2'b00, 2'b01:	v4_tcp_len = v4_tcp_len_01_r;
	2'b10:		v4_tcp_len = v4_tcp_len_10_r;
	2'b11:		v4_tcp_len = v4_tcp_len_11;
	default:	v4_tcp_len = 4'b0;

	endcase
end

	
assign v6_tcp_len	= shft4_tmp2_dout[7:4];

dffre #(4) v4_tcp_len_01_r_reg (cclk, reset, shft5_reg_en, v4_tcp_len_01, v4_tcp_len_01_r);
dffre #(4) v4_tcp_len_10_r_reg (cclk, reset, shft6_reg_en, v4_tcp_len_10, v4_tcp_len_10_r);
dffre #(4) v4_tcp_len_r_reg    (cclk, reset, shft7_reg_en, v4_tcp_len,    v4_tcp_len_r);
dffre #(4) v6_tcp_len_r_reg    (cclk, reset, shft5_reg_en, v6_tcp_len,    v6_tcp_len_r);

/********************************/
//Extract TCP CONTROL FLAG
/********************************/
always @ (
        ipv4_ip_hdr_len_r0[1:0] or
        shft2_tmp15_dout or shft2_tmp14_dout or
        shft3_tmp3_dout or shft3_tmp2_dout or
        shft3_tmp7_dout or shft3_tmp6_dout)

begin
        case (ipv4_ip_hdr_len_r0[1:0]) //synopsys parallel_case full_case
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:v4_tcp_flag_1"

        2'b00, 2'b01:   v4_tcp_flag_01 = {shft2_tmp14_dout[3:0], shft2_tmp15_dout[7:0]};
        2'b10:          v4_tcp_flag_01 = {shft3_tmp2_dout[3:0], shft3_tmp3_dout[7:0]};
        2'b11:          v4_tcp_flag_01 = {shft3_tmp6_dout[3:0], shft3_tmp7_dout[7:0]};
        default:        v4_tcp_flag_01 = 12'b0;

        endcase
end

always @ (
        ipv4_ip_hdr_len_r0[1:0] or
        shft3_tmp11_dout or shft3_tmp10_dout or
        shft3_tmp15_dout or shft3_tmp14_dout or
        shft4_tmp3_dout or shft4_tmp2_dout or
        shft4_tmp7_dout or shft4_tmp6_dout)

begin
        case (ipv4_ip_hdr_len_r0[1:0]) //synopsys parallel_case full_case
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:v4_tcp_flag_2"

        2'b00:          v4_tcp_flag_10 = {shft3_tmp10_dout[3:0], shft3_tmp11_dout[7:0]};
        2'b01:          v4_tcp_flag_10 = {shft3_tmp14_dout[3:0], shft3_tmp15_dout[7:0]};
        2'b10:          v4_tcp_flag_10 = {shft4_tmp2_dout[3:0], shft4_tmp3_dout[7:0]};
        2'b11:          v4_tcp_flag_10 = {shft4_tmp6_dout[3:0], shft4_tmp7_dout[7:0]};
        default:        v4_tcp_flag_10 = 12'b0;

        endcase
end    

always @ (
        ipv4_ip_hdr_len_r0[1:0] or
        shft4_tmp11_dout or shft4_tmp10_dout or
        shft4_tmp15_dout or shft4_tmp14_dout or
        shft5_tmp3_dout or shft5_tmp2_dout or
        shft5_tmp7_dout or shft5_tmp6_dout)

begin
        case (ipv4_ip_hdr_len_r0[1:0]) //synopsys parallel_case full_case
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:v4_tcp_flag_3"

        2'b00:          v4_tcp_flag_11 = {shft4_tmp10_dout[3:0], shft4_tmp11_dout[7:0]};
        2'b01:          v4_tcp_flag_11 = {shft4_tmp14_dout[3:0], shft4_tmp15_dout[7:0]};
        2'b10:          v4_tcp_flag_11 = {shft5_tmp2_dout[3:0], shft5_tmp3_dout[7:0]};
        2'b11:          v4_tcp_flag_11 = {shft5_tmp6_dout[3:0], shft5_tmp7_dout[7:0]};
        default:        v4_tcp_flag_11 = 12'b0;

        endcase
end    


always @ (
        ipv4_ip_hdr_len_r0[3:2] or
        v4_tcp_flag_01_r or
        v4_tcp_flag_10_r or
        v4_tcp_flag_11)

begin
        case (ipv4_ip_hdr_len_r0[3:2]) //synopsys parallel_case full_case
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:v4_tcp_flag_4"


        2'b00, 2'b01:   v4_tcp_flag = v4_tcp_flag_01_r;
        2'b10:          v4_tcp_flag = v4_tcp_flag_10_r;
        2'b11:          v4_tcp_flag = v4_tcp_flag_11;
        default:        v4_tcp_flag = 12'b0;

        endcase
end

assign v6_tcp_flag = {shft4_tmp2_dout[3:0], shft4_tmp3_dout[7:0]};

dffre #(12) v4_tcp_flag_01_r_reg (cclk, reset, shft5_reg_en, v4_tcp_flag_01, v4_tcp_flag_01_r);
dffre #(12) v4_tcp_flag_10_r_reg (cclk, reset, shft6_reg_en, v4_tcp_flag_10, v4_tcp_flag_10_r);
dffre #(12) v4_tcp_flag_r_reg    (cclk, reset, shft7_reg_en, v4_tcp_flag,    v4_tcp_flag_r);
dffre #(12) v6_tcp_flag_r_reg    (cclk, reset, shft5_reg_en, v6_tcp_flag,    v6_tcp_flag_r);

always @ (ether_type or
	ipv4_ip_pkt_len_r or
	ipv6_ip_pkt_len_r or
	v4_tcp_port_r or
	ipv6_tcp_src_port_r or
	ipv6_tcp_dest_port_r or
	v4_seq_num_r or 
	v6_seq_num_r or 
	v4_tcp_len_r or
	v6_tcp_len_r or
	v4_tcp_flag_r or
	v6_tcp_flag_r)
	

if (ether_type[1])
begin
	tcp_port	= {ipv6_tcp_src_port_r, ipv6_tcp_dest_port_r};
        tcp_seq_num     = v6_seq_num_r;
        tcp_hdr_len     = v6_tcp_len_r;
        tcp_ctrl_flag   = v6_tcp_flag_r;
	ip_pkt_len	= ipv6_ip_pkt_len_r;
end
else 
begin
	tcp_port	= v4_tcp_port_r;
	tcp_seq_num 	= v4_seq_num_r; 
	tcp_hdr_len	= v4_tcp_len_r;
	tcp_ctrl_flag	= v4_tcp_flag_r;
	ip_pkt_len	= ipv4_ip_pkt_len_r;
end


assign tcp_push_bit  	= |(tcp_ctrl_flag & (~hdr_ctrl_bit_mask_reg_dout)) & (l4_protocol_r == 2'b01);


assign fwd_info 	= {vlan_parity_err_r, mac_port, pkt_id, tcp_seq_num, tcp_push_bit, 
			   tcp_hdr_len, ip_pkt_len, ipv4_ip_hdr_len_r, shft1_status}; //64+20=84

assign pkt_id_in	= pkt_id + 4'd1;

dffre #(4) pkt_id_reg (cclk, reset, hdr_shft_done, pkt_id_in, pkt_id);

/*************************************/
//Header fifo operation
/*************************************/
assign	hdr_fifo_wen		= hdr_shft_done;
assign	hdr_fifo_ren		= fwd_sched;
assign	hdr_fifo_din 		= {fwd_info, flow_key_r, tcam_key_r}; //84+362+200=646

assign	hdr_fifo_space_avail	= (hdr_fifo_cnt < 3'b011);
//assign	hdr_fifo_lastwp	= (hdr_fifo_cnt == 3'b001);
//assign	hdr_fifo_lastrp	= (hdr_fifo_cnt == 3'b011);


assign hdr_fifo_cnt_in	= hdr_fifo_wen & hdr_fifo_ren ? hdr_fifo_cnt :
			  hdr_fifo_wen		      ? hdr_fifo_cnt + 3'd1 :
			  hdr_fifo_ren		      ? hdr_fifo_cnt - 3'd1 :
							hdr_fifo_cnt;
assign hdr_fifo_cnt_en	= hdr_fifo_wen | hdr_fifo_ren;

dffre #(3) hdr_fifo_cnt_reg (cclk, reset, hdr_fifo_cnt_en, hdr_fifo_cnt_in, hdr_fifo_cnt);

/*
always @ (posedge cclk)
if (reset)
        hdr_fifo_full <= 1'b0;
else if (hdr_fifo_ren)
        hdr_fifo_full <= 1'b0;
else if (hdr_fifo_lastwp && hdr_fifo_wen)
        hdr_fifo_full <= 1'b1;
else
	hdr_fifo_full <= hdr_fifo_full;

always @ (posedge cclk)
if (reset)
	hdr_fifo_empty <= 1'b1;
else if (hdr_fifo_wen)
	hdr_fifo_empty <= 1'b0;
else if (hdr_fifo_lastrp & hdr_fifo_ren)
	hdr_fifo_empty <= 1'b1;
else
	hdr_fifo_empty <= hdr_fifo_empty;
*/

/* 0in fifo
   -enq hdr_fifo_wen
   -deq hdr_fifo_ren
   -depth 4
   -enq_data hdr_fifo_din
   -deq_data hdr_fifo_dout
   -clock cclk
   -reset reset
   -message "ASSERTION : fifo : fflp_hdr_dp : hdr_fifo0 failed"
*/
//instantiates hdr_fifo
fflp_hdr_fifo #(646) hdr_fifo0 (
                .clk		(cclk),
                .reset		(reset),
		.dout		(hdr_fifo_dout),
		.hdr_fifo_empty	(hdr_fifo_empty),
		.hdr_fifo_full	(hdr_fifo_full),
                .din		(hdr_fifo_din),
                .wen		(hdr_fifo_wen),
                .ren		(hdr_fifo_ren)
                );

dffre #(446) fwd_info_bus_reg	(cclk, reset, fwd_sched, hdr_fifo_dout[645:200], fwd_info_bus);
dffre #(200) key_bus_reg	(cclk, reset, fwd_sched, hdr_fifo_dout[199:0],   key_bus);

assign	fwd_req		 = !hdr_fifo_empty;


/******************************/
//VLAN table lookup
/******************************/
/************************/
//CPU access request
/************************/
assign cpu_vlan_gnt 	= cpu_vlan_acc & !cpu_vlan_acc_dly;
assign cpu_vlan_acc_en	= cpu_vlan_gnt_3 | cpu_vlan_req & !shft1_reg_en;
assign cpu_vlan_acc_in	= cpu_vlan_gnt_3 ? 1'b0 : 1'b1;

dffre #(1) cpu_vlan_acc_reg 	(cclk, reset, cpu_vlan_acc_en, cpu_vlan_acc_in, cpu_vlan_acc);
dffr  #(1) cpu_vlan_acc_dly_reg (cclk, reset,                  cpu_vlan_acc,    cpu_vlan_acc_dly);

dffr  #(1) cpu_vlan_gnt_1_reg	(cclk, reset, cpu_vlan_gnt,   cpu_vlan_gnt_1);
dffr  #(1) cpu_vlan_gnt_2_reg	(cclk, reset, cpu_vlan_gnt_1, cpu_vlan_gnt_2);
dffr  #(1) cpu_vlan_gnt_3_reg	(cclk, reset, cpu_vlan_gnt_2, cpu_vlan_gnt_3);

assign cpu_vlan_rd_gnt = cpu_vlan_gnt & cpu_vlan_rd;

assign cpu_vlan_wr_gnt = cpu_vlan_gnt & cpu_vlan_wr;

/*************************/
//Search access request
/*************************/
assign srch_vlan_rd_in = or_tag & shft1_reg_en;

dffr #(1) srch_vlan_rd_reg (cclk, reset, srch_vlan_rd_in, srch_vlan_rd);

/*************************/
//Vlan access control
/*************************/
`ifdef NEPTUNE
assign vlan_tbl_cs_in	= vlan_tbl_rd_in | vlan_tbl_wr_in;
`else
assign vlan_tbl_cs_in   = vlan_tbl_rd_in;
`endif

assign vlan_tbl_rd_in  	= srch_vlan_rd | cpu_vlan_rd_gnt;
assign vlan_tbl_wr_in  	= cpu_vlan_wr_gnt;

assign vlan_tbl_addr_in 	= srch_vlan_rd ? vlan_tag_id[11:0] : cpu_vlan_addr;

dffr #(1)  vlan_tbl_cs_reg 	(cclk, reset, vlan_tbl_cs_in,   vlan_tbl_cs);
dffr #(1)  vlan_tbl_wr_reg 	(cclk, reset, vlan_tbl_wr_in,   vlan_tbl_wr);
dffr #(12) vlan_tbl_addr_reg 	(cclk, reset, vlan_tbl_addr_in, vlan_tbl_addr);
dffr #(18) vlan_tbl_din_reg 	(cclk, reset, vlan_tbl_rd_din,  vlan_tbl_din_reg_dout);

/**********************************************************************/
function [4:0] class_index_enc;
/**********************************************************************/
input	[15:0]	hdr_class;

reg     [4:0]	l3_class_index;

begin

casex (hdr_class) //synopsys full_case
// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:l3_class_index"
16'b0000_0000_0000_0000:    l3_class_index = 5'b00000;
16'bxxxx_xxxx_xxxx_xxx1:    l3_class_index = 5'b00010;
16'bxxxx_xxxx_xxxx_xx10:    l3_class_index = 5'b00011;
16'bxxxx_xxxx_xxxx_x100:    l3_class_index = 5'b00100;
16'bxxxx_xxxx_xxxx_1000:    l3_class_index = 5'b00101;
16'bxxxx_xxxx_xxx1_0000:    l3_class_index = 5'b00110;
16'bxxxx_xxxx_xx10_0000:    l3_class_index = 5'b00111;
16'bxxxx_xxxx_x100_0000:    l3_class_index = 5'b01000;
16'bxxxx_xxxx_1000_0000:    l3_class_index = 5'b01001;
16'bxxxx_xxx1_0000_0000:    l3_class_index = 5'b01010;
16'bxxxx_xx10_0000_0000:    l3_class_index = 5'b01011;
16'bxxxx_x100_0000_0000:    l3_class_index = 5'b01100;
16'bxxxx_1000_0000_0000:    l3_class_index = 5'b01101;
16'bxxx1_0000_0000_0000:    l3_class_index = 5'b01110;
16'bxx10_0000_0000_0000:    l3_class_index = 5'b01111;
16'bx100_0000_0000_0000:    l3_class_index = 5'b10000;
16'b1000_0000_0000_0000:    l3_class_index = 5'b10001;
default:                    l3_class_index = 5'b00000;

endcase

class_index_enc = l3_class_index;

end

endfunction

/**********************************************************************/
function [2:0] class_action_sel0;
/**********************************************************************/
input   [3:0]   class;
input   [2:0]   l3_class_action_reg2_dout;
input   [2:0]   l3_class_action_reg3_dout;
input   [2:0]   l3_class_action_reg4_dout;
input   [2:0]   l3_class_action_reg5_dout;
input   [2:0]   l3_class_action_reg6_dout;
input   [2:0]   l3_class_action_reg7_dout;
input   [2:0]   l3_class_action_reg8_dout;
input   [2:0]   l3_class_action_reg9_dout;
input   [2:0]   l3_class_action_reg10_dout;
input   [2:0]   l3_class_action_reg11_dout;
input   [2:0]   l3_class_action_reg12_dout;
input   [2:0]   l3_class_action_reg13_dout;
input   [2:0]   l3_class_action_reg14_dout;
input   [2:0]   l3_class_action_reg15_dout;

reg     [2:0]  class_action;

begin

case (class) //synopsys parallel_case full_case
// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:CAM_class_action"
4'b0000:	class_action = 3'b0;
4'b0001:        class_action = 3'b0;
4'b0010:	class_action = l3_class_action_reg2_dout;
4'b0011:        class_action = l3_class_action_reg3_dout;
4'b0100:        class_action = l3_class_action_reg4_dout;
4'b0101:        class_action = l3_class_action_reg5_dout;
4'b0110:        class_action = l3_class_action_reg6_dout;
4'b0111:        class_action = l3_class_action_reg7_dout;
4'b1000:        class_action = l3_class_action_reg8_dout;
4'b1001:        class_action = l3_class_action_reg9_dout;
4'b1010:        class_action = l3_class_action_reg10_dout;
4'b1011:        class_action = l3_class_action_reg11_dout;
4'b1100:        class_action = l3_class_action_reg12_dout;
4'b1101:        class_action = l3_class_action_reg13_dout;
4'b1110:        class_action = l3_class_action_reg14_dout;
4'b1111:        class_action = l3_class_action_reg15_dout;

default:        class_action = 3'b0;

endcase

class_action_sel0 = class_action;
end
endfunction


/**********************************************************************/
function [9:0] class_action_sel1;
/**********************************************************************/
input   [3:0]   class;
input   [9:0]   l3_class_action_reg2_dout;
input   [9:0]   l3_class_action_reg3_dout;
input   [9:0]   l3_class_action_reg4_dout;
input   [9:0]   l3_class_action_reg5_dout;
input   [9:0]   l3_class_action_reg6_dout;
input   [9:0]   l3_class_action_reg7_dout;
input   [9:0]   l3_class_action_reg8_dout;
input   [9:0]   l3_class_action_reg9_dout;
input   [9:0]   l3_class_action_reg10_dout;
input   [9:0]   l3_class_action_reg11_dout;
input   [9:0]   l3_class_action_reg12_dout;
input   [9:0]   l3_class_action_reg13_dout;
input   [9:0]   l3_class_action_reg14_dout;
input   [9:0]   l3_class_action_reg15_dout;

reg     [9:0]  class_action;

begin

case (class) //synopsys parallel_case full_case
// 0in < case -full -parallel -message "0in ERROR: case check in fflp_hdr_dp:FCARM_class_action"
4'b0000:        class_action = 10'b0;
4'b0001:        class_action = 10'b0;
4'b0010:        class_action = l3_class_action_reg2_dout;
4'b0011:        class_action = l3_class_action_reg3_dout;
4'b0100:        class_action = l3_class_action_reg4_dout;
4'b0101:        class_action = l3_class_action_reg5_dout;
4'b0110:        class_action = l3_class_action_reg6_dout;
4'b0111:        class_action = l3_class_action_reg7_dout;
4'b1000:        class_action = l3_class_action_reg8_dout;
4'b1001:        class_action = l3_class_action_reg9_dout;
4'b1010:        class_action = l3_class_action_reg10_dout;
4'b1011:        class_action = l3_class_action_reg11_dout;
4'b1100:        class_action = l3_class_action_reg12_dout;
4'b1101:        class_action = l3_class_action_reg13_dout;
4'b1110:        class_action = l3_class_action_reg14_dout;
4'b1111:        class_action = l3_class_action_reg15_dout;

default:        class_action = 10'b0;

endcase

class_action_sel1 = class_action;
end
endfunction


`ifdef NEPTUNE
wire      [3:0] do_nad;
wire      [3:0] do_nor;
wire      [3:0] do_inv;
wire      [3:0] do_mux;
wire      [3:0] do_q;
wire            so;

nep_spare_fflp spare_fflp_0 (
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
                             .clk        (cclk),
                             .do_nad     (do_nad[3:0]),
                             .do_nor     (do_nor[3:0]),
                             .do_inv     (do_inv[3:0]),
                             .do_mux     (do_mux[3:0]),
                             .do_q       (do_q[3:0]),
                             .so         (so)
                            );

`endif


endmodule
