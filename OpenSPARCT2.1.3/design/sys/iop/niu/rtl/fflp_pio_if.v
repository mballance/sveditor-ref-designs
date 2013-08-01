// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_pio_if.v
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
/*project name:  NIU                                                  */
/*module name:   fflp_pio_if                                          */
/*description:   pio registers for hdr matching and pio interface     */
/*               control logic and data mux                           */
/*                                                                    */
/*parent module in:  fflp_pio_if.v                                    */
/*child modules in:  none                                             */
/*interface modules:                                                  */
/*author name:       Jeanne Cai                                       */
/*date created:      03-18-04                                         */
/*                                                                    */
/*              Copyright (c) 2004, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/*modifications:                                                      */
/*								      */
/**********************************************************************/
module fflp_pio_if(
		cclk,
		reset_l,
		pio_fflp_wdata,
		pio_fflp_rd,
		pio_fflp_sel,
		pio_fflp_addr,
		pio_client_32b,
		cam_key_reg0_dout,
		cam_key_reg1_dout,
		cam_key_reg2_dout,
		cam_key_reg3_dout,
		cam_key_mask_reg0_dout,
		cam_key_mask_reg1_dout,
		cam_key_mask_reg2_dout,
		cam_key_mask_reg3_dout,
		cam_cmd_stat_reg_dout,
		vlan_tbl_din_reg_dout,
		vlan_parity_err_log_en,
		vlan_tag_id,
		cpu_vlan_gnt_3,
		cpu_fc_req_done_sync,
		fc_rd_data_reg_dout,
		fc_rd_ecc_err,
		fflp_zcp_wr_p,
		fc_err_status,
		ecc_parity_status,
		cpu_fio_req_done_sync,
		cpu_fio_rd_data,
		fio_cal_rd_latency,

		reset_s,
		pio_wen,
		pio_addr,
		pio_wr_data,
		pio_32b_mode,
		fflp_pio_rdata,
		fflp_pio_ack,
		fflp_pio_err,
		fflp_pio_intr,
		snap_en,
		disable_chksum,
		pio_disable_cam,
		fflp_init_done,
		fcram_driver_imp_ctrl,
		fcram_qs_mode,
		fcram_lookup_ratio, 
		pio_fio_latency,
		cam_srch_ratio,
		cam_srch_latency,
		h1_init_value_reg_dout,
		h2_init_value_reg_dout,
		fcram_refresh_timer_reg_dout,
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
		vlan_tbl_wr_dout,
		flow_part_sel_reg0_dout,
		flow_part_sel_reg1_dout,
		flow_part_sel_reg2_dout,
		flow_part_sel_reg3_dout,
		flow_part_sel_reg4_dout,
		flow_part_sel_reg5_dout,
		flow_part_sel_reg6_dout,
		flow_part_sel_reg7_dout,
		hash_tbl_addr_reg0_dout,
		hash_tbl_addr_reg1_dout,
		hash_tbl_addr_reg2_dout,
		hash_tbl_addr_reg3_dout,
		hash_tbl_addr_reg4_dout,
		hash_tbl_addr_reg5_dout,
		hash_tbl_addr_reg6_dout,
		hash_tbl_addr_reg7_dout,
		hash_tbl_data_reg0_dout,
		hash_tbl_data_reg1_dout,
		hash_tbl_data_reg2_dout,
		hash_tbl_data_reg3_dout,
		hash_tbl_data_reg4_dout,
		hash_tbl_data_reg5_dout,
		hash_tbl_data_reg6_dout,
		hash_tbl_data_reg7_dout,
		fcram_err_test_reg_dout,
		cpu_req_part0_sel,
		cpu_req_part1_sel,
		cpu_req_part2_sel,
		cpu_req_part3_sel,
		cpu_req_part4_sel,
		cpu_req_part5_sel,
		cpu_req_part6_sel,
		cpu_req_part7_sel,
		pio_rd,
		cpu_fcram_req,
		cpu_fio_req,
		pio_fio_cfg_reset,
		fio_cfg_addr_reg_dout,
		fflp_config_reg_wen_pulse,
		debug_training_vector,
		pio_debug_data_sel
		
           	);

input 		cclk;
input		reset_l;
input[63:0]	pio_fflp_wdata;
input		pio_fflp_rd;
input		pio_fflp_sel;
input[19:0]	pio_fflp_addr;
input		pio_client_32b;
input[7:0]	cam_key_reg0_dout;
input[63:0]	cam_key_reg1_dout;
input[63:0]	cam_key_reg2_dout;
input[63:0]	cam_key_reg3_dout;
input[7:0]	cam_key_mask_reg0_dout;
input[63:0]	cam_key_mask_reg1_dout;
input[63:0]	cam_key_mask_reg2_dout;
input[63:0]     cam_key_mask_reg3_dout;
input[20:0]	cam_cmd_stat_reg_dout;
input[17:0]	vlan_tbl_din_reg_dout;
input		vlan_parity_err_log_en;
input[11:0]	vlan_tag_id;
input		cpu_vlan_gnt_3;
input		cpu_fc_req_done_sync;
input[71:0]     fc_rd_data_reg_dout;
input		fc_rd_ecc_err;
input		fflp_zcp_wr_p;
input[33:0]	fc_err_status;
input[25:0]	ecc_parity_status;
input		cpu_fio_req_done_sync;
input[31:0]	cpu_fio_rd_data;
input[7:0]	fio_cal_rd_latency;

output		reset_s;
output		pio_wen;
output[19:0]	pio_addr;
output[63:0]	pio_wr_data;
output		pio_32b_mode;
output[63:0]	fflp_pio_rdata;
output		fflp_pio_ack;
output		fflp_pio_err;
output		fflp_pio_intr;
output		snap_en;
output		disable_chksum;
output		pio_disable_cam;
output		fflp_init_done;
output[3:0]	fcram_driver_imp_ctrl;
output		fcram_qs_mode;
output[3:0]	fcram_lookup_ratio;
output[1:0]	pio_fio_latency;
output[3:0]	cam_srch_ratio;
output[3:0]	cam_srch_latency;
output[31:0]	h1_init_value_reg_dout;
output[15:0]	h2_init_value_reg_dout;
output[31:0]	fcram_refresh_timer_reg_dout;
output[16:0]    class2_hdr_byte_value;
output[16:0]    class3_hdr_byte_value;
output[25:0]    class4_hdr_byte_value;
output[25:0]    class5_hdr_byte_value;
output[25:0]    class6_hdr_byte_value;
output[25:0]    class7_hdr_byte_value;
output[2:0]     class_action_reg4_dout;
output[2:0]     class_action_reg5_dout;
output[2:0]     class_action_reg6_dout;
output[2:0]     class_action_reg7_dout;
output[2:0]     class_action_reg8_dout;
output[2:0]     class_action_reg9_dout;
output[2:0]     class_action_reg10_dout;
output[2:0]     class_action_reg11_dout;
output[2:0]     class_action_reg12_dout;
output[2:0]     class_action_reg13_dout;
output[2:0]     class_action_reg14_dout;
output[2:0]     class_action_reg15_dout;
output[9:0]     f_key_class_action_reg4_dout;
output[9:0]     f_key_class_action_reg5_dout;
output[9:0]     f_key_class_action_reg6_dout;
output[9:0]     f_key_class_action_reg7_dout;
output[9:0]     f_key_class_action_reg8_dout;
output[9:0]     f_key_class_action_reg9_dout;
output[9:0]     f_key_class_action_reg10_dout;
output[9:0]     f_key_class_action_reg11_dout;
output[9:0]     f_key_class_action_reg12_dout;
output[9:0]     f_key_class_action_reg13_dout;
output[9:0]     f_key_class_action_reg14_dout;
output[9:0]     f_key_class_action_reg15_dout;
output[11:0]    hdr_ctrl_bit_mask_reg_dout;
output		cpu_vlan_req;
output          cpu_vlan_rd;
output          cpu_vlan_wr;
output[11:0]    cpu_vlan_addr;
output[17:0]    vlan_tbl_wr_dout;
output[10:0]    flow_part_sel_reg0_dout;
output[10:0]    flow_part_sel_reg1_dout;
output[10:0]    flow_part_sel_reg2_dout;
output[10:0]    flow_part_sel_reg3_dout;
output[10:0]    flow_part_sel_reg4_dout;
output[10:0]    flow_part_sel_reg5_dout;
output[10:0]    flow_part_sel_reg6_dout;
output[10:0]    flow_part_sel_reg7_dout;
output[23:0]    hash_tbl_addr_reg0_dout;
output[23:0]    hash_tbl_addr_reg1_dout;
output[23:0]    hash_tbl_addr_reg2_dout;
output[23:0]    hash_tbl_addr_reg3_dout;
output[23:0]    hash_tbl_addr_reg4_dout;
output[23:0]    hash_tbl_addr_reg5_dout;
output[23:0]    hash_tbl_addr_reg6_dout;
output[23:0]    hash_tbl_addr_reg7_dout;
output[63:0]    hash_tbl_data_reg0_dout;
output[63:0]    hash_tbl_data_reg1_dout;
output[63:0]    hash_tbl_data_reg2_dout;
output[63:0]    hash_tbl_data_reg3_dout;
output[63:0]    hash_tbl_data_reg4_dout;
output[63:0]    hash_tbl_data_reg5_dout;
output[63:0]    hash_tbl_data_reg6_dout;
output[63:0]    hash_tbl_data_reg7_dout;
output[71:0]	fcram_err_test_reg_dout;
output          cpu_req_part0_sel;
output          cpu_req_part1_sel;
output          cpu_req_part2_sel;
output          cpu_req_part3_sel;
output          cpu_req_part4_sel;
output          cpu_req_part5_sel;
output          cpu_req_part6_sel;
output          cpu_req_part7_sel;
output          pio_rd;
output          cpu_fcram_req;
output		cpu_fio_req;
output		pio_fio_cfg_reset;
output[7:0]	fio_cfg_addr_reg_dout;
output		fflp_config_reg_wen_pulse;
output[31:0]	debug_training_vector;
output[2:0]	pio_debug_data_sel;


wire		fflp_pio_sel;
wire		pio_rd;
wire[19:0]	pio_addr;
wire[63:0]	pio_wr_data;
wire		pio_32b_mode;

wire		pio_selected;
wire		pio_sel_pulse_dly1;
wire		fflp_pio_ack_en;
wire		pio_addr_err_in;
wire		fflp_pio_ack;
wire		fflp_pio_err;
wire		fflp_pio_rdata_en;
wire[63:0]	fflp_pio_rdata_in;
wire[63:0]	fflp_pio_rdata;
wire		pio_wen_en;
wire		pio_wen;

reg[63:0]	pio_rd_data_tmp;
reg		pio_addr_err;

wire		cpu_vlan_req_en;
wire		cpu_vlan_req_in;
wire		cpu_vlan_req;

wire[31:0]	vlan_parity_err_log_tmp;
wire[31:0]	vlan_parity_err_log_mux;
wire[31:0]	vlan_parity_err_log_reg_dout;
wire		vlan_parity_err_log_wen;
wire		vlan_parity_err_log_pio_wen;

wire		cpu_vlan_rd;
wire		cpu_vlan_wr;
wire		is_vlan_addr;
wire[11:0]	cpu_vlan_addr;
wire[17:0]	vlan_tbl_wr_dout;
wire[17:0]	vlan_tbl_rd_data;

wire		cpu_fc_req_done_sync_d;
wire		cpu_fc_req_done_p;
wire		cpu_fc_req_done_p1;
wire		is_fcram_data_addr;
wire		is_ext_fcram;
wire		is_fcram_req;
wire		cpu_fcram_req_en;
wire		cpu_fcram_req_in;
wire		cpu_fcram_req;

wire            cpu_fio_req_done_sync_d;
wire            cpu_fio_req_done_p;
wire            is_fio_data_addr;
wire		is_ext_fio;
wire            cpu_fio_req_en;
wire            cpu_fio_req_in;
wire            cpu_fio_req;

wire[16:0]	class2_hdr_byte_value;
wire[16:0]      class3_hdr_byte_value;
wire[25:0]      class4_hdr_byte_value;
wire[25:0]      class5_hdr_byte_value;
wire[25:0]      class6_hdr_byte_value;
wire[25:0]      class7_hdr_byte_value;

wire            class2_hdr_byte_value_pio_wen;
wire            class3_hdr_byte_value_pio_wen;
wire            class4_hdr_byte_value_pio_wen;
wire            class5_hdr_byte_value_pio_wen;
wire            class6_hdr_byte_value_pio_wen;
wire            class7_hdr_byte_value_pio_wen;

wire[2:0]	class_action_reg4_dout;
wire[2:0]       class_action_reg5_dout;
wire[2:0]       class_action_reg6_dout;
wire[2:0]       class_action_reg7_dout;
wire[2:0]       class_action_reg8_dout;
wire[2:0]       class_action_reg9_dout;
wire[2:0]       class_action_reg10_dout;
wire[2:0]       class_action_reg11_dout;
wire[2:0]       class_action_reg12_dout;
wire[2:0]       class_action_reg13_dout;
wire[2:0]       class_action_reg14_dout;
wire[2:0]       class_action_reg15_dout;

wire            class_action_reg4_pio_wen;
wire            class_action_reg5_pio_wen;
wire            class_action_reg6_pio_wen;
wire            class_action_reg7_pio_wen;
wire            class_action_reg8_pio_wen;
wire            class_action_reg9_pio_wen;
wire            class_action_reg10_pio_wen;
wire            class_action_reg11_pio_wen;
wire            class_action_reg12_pio_wen;
wire            class_action_reg13_pio_wen;
wire            class_action_reg14_pio_wen;
wire            class_action_reg15_pio_wen;

wire[9:0]       f_key_class_action_reg4_dout;
wire[9:0]       f_key_class_action_reg5_dout;
wire[9:0]       f_key_class_action_reg6_dout;
wire[9:0]       f_key_class_action_reg7_dout;
wire[9:0]       f_key_class_action_reg8_dout;
wire[9:0]       f_key_class_action_reg9_dout;
wire[9:0]       f_key_class_action_reg10_dout;
wire[9:0]       f_key_class_action_reg11_dout;
wire[9:0]       f_key_class_action_reg12_dout;
wire[9:0]       f_key_class_action_reg13_dout;
wire[9:0]       f_key_class_action_reg14_dout;
wire[9:0]       f_key_class_action_reg15_dout;

wire            f_key_class_action_reg4_pio_wen;
wire            f_key_class_action_reg5_pio_wen;
wire            f_key_class_action_reg6_pio_wen;
wire            f_key_class_action_reg7_pio_wen;
wire            f_key_class_action_reg8_pio_wen;
wire            f_key_class_action_reg9_pio_wen;
wire            f_key_class_action_reg10_pio_wen;
wire            f_key_class_action_reg11_pio_wen;
wire            f_key_class_action_reg12_pio_wen;
wire            f_key_class_action_reg13_pio_wen;
wire            f_key_class_action_reg14_pio_wen;
wire            f_key_class_action_reg15_pio_wen;

wire		h1_init_value_reg_pio_wen;
wire		h2_init_value_reg_pio_wen;
wire		flow_part_sel_reg0_pio_wen;
wire		flow_part_sel_reg1_pio_wen;
wire		flow_part_sel_reg2_pio_wen;
wire		flow_part_sel_reg3_pio_wen;
wire		flow_part_sel_reg4_pio_wen;
wire		flow_part_sel_reg5_pio_wen;
wire		flow_part_sel_reg6_pio_wen;
wire		flow_part_sel_reg7_pio_wen;

wire		hash_tbl_addr_reg0_pio_wen;
wire		hash_tbl_addr_reg1_pio_wen;
wire		hash_tbl_addr_reg2_pio_wen;
wire		hash_tbl_addr_reg3_pio_wen;
wire		hash_tbl_addr_reg4_pio_wen;
wire		hash_tbl_addr_reg5_pio_wen;
wire		hash_tbl_addr_reg6_pio_wen;
wire		hash_tbl_addr_reg7_pio_wen;

wire		hash_tbl_addr_inc_wen0;
wire		hash_tbl_addr_inc_wen1;
wire		hash_tbl_addr_inc_wen2;
wire		hash_tbl_addr_inc_wen3;
wire		hash_tbl_addr_inc_wen4;
wire		hash_tbl_addr_inc_wen5;
wire		hash_tbl_addr_inc_wen6;
wire		hash_tbl_addr_inc_wen7;

wire		hash_tbl_addr_reg0_wen;
wire		hash_tbl_addr_reg1_wen;
wire		hash_tbl_addr_reg2_wen;
wire		hash_tbl_addr_reg3_wen;
wire		hash_tbl_addr_reg4_wen;
wire		hash_tbl_addr_reg5_wen;
wire		hash_tbl_addr_reg6_wen;
wire		hash_tbl_addr_reg7_wen;

wire		cpu_req_part0_sel;
wire		cpu_req_part1_sel;
wire		cpu_req_part2_sel;
wire		cpu_req_part3_sel;
wire		cpu_req_part4_sel;
wire		cpu_req_part5_sel;
wire		cpu_req_part6_sel;
wire		cpu_req_part7_sel;

wire[22:0]	curr_hash_tbl_addr;
wire[22:0]	next_hash_tbl_addr;
wire[22:0]	next_hash_tbl_addr_r;

wire[23:0]	hash_tbl_addr_reg0_mux;
wire[23:0]	hash_tbl_addr_reg1_mux;
wire[23:0]	hash_tbl_addr_reg2_mux;
wire[23:0]	hash_tbl_addr_reg3_mux;
wire[23:0]	hash_tbl_addr_reg4_mux;
wire[23:0]	hash_tbl_addr_reg5_mux;
wire[23:0]	hash_tbl_addr_reg6_mux;
wire[23:0]	hash_tbl_addr_reg7_mux;

wire		hash_tbl_data_reg0_pio_wen;
wire		hash_tbl_data_reg1_pio_wen;
wire		hash_tbl_data_reg2_pio_wen;
wire		hash_tbl_data_reg3_pio_wen;
wire		hash_tbl_data_reg4_pio_wen;
wire		hash_tbl_data_reg5_pio_wen;
wire		hash_tbl_data_reg6_pio_wen;
wire		hash_tbl_data_reg7_pio_wen;

wire            hash_tbl_data_reg0_h_pio_wen;
wire            hash_tbl_data_reg1_h_pio_wen;
wire            hash_tbl_data_reg2_h_pio_wen;
wire            hash_tbl_data_reg3_h_pio_wen;
wire            hash_tbl_data_reg4_h_pio_wen;
wire            hash_tbl_data_reg5_h_pio_wen;
wire            hash_tbl_data_reg6_h_pio_wen;
wire            hash_tbl_data_reg7_h_pio_wen;

wire		hash_tbl_data_reg0_wen;
wire		hash_tbl_data_reg1_wen;
wire		hash_tbl_data_reg2_wen;
wire		hash_tbl_data_reg3_wen;
wire		hash_tbl_data_reg4_wen;
wire		hash_tbl_data_reg5_wen;
wire		hash_tbl_data_reg6_wen;
wire		hash_tbl_data_reg7_wen;

wire            hash_tbl_data_reg0_h_wen;
wire            hash_tbl_data_reg1_h_wen;
wire            hash_tbl_data_reg2_h_wen;
wire            hash_tbl_data_reg3_h_wen;
wire            hash_tbl_data_reg4_h_wen;
wire            hash_tbl_data_reg5_h_wen;
wire            hash_tbl_data_reg6_h_wen;
wire            hash_tbl_data_reg7_h_wen;

wire		hash_tbl_ecc_log_reg0_pio_wen;
wire		hash_tbl_ecc_log_reg1_pio_wen;
wire		hash_tbl_ecc_log_reg2_pio_wen;
wire		hash_tbl_ecc_log_reg3_pio_wen;
wire		hash_tbl_ecc_log_reg4_pio_wen;
wire		hash_tbl_ecc_log_reg5_pio_wen;
wire		hash_tbl_ecc_log_reg6_pio_wen;
wire		hash_tbl_ecc_log_reg7_pio_wen;

wire		hash_tbl_ecc_log_reg0_wen;
wire		hash_tbl_ecc_log_reg1_wen;
wire		hash_tbl_ecc_log_reg2_wen;
wire		hash_tbl_ecc_log_reg3_wen;
wire		hash_tbl_ecc_log_reg4_wen;
wire		hash_tbl_ecc_log_reg5_wen;
wire		hash_tbl_ecc_log_reg6_wen;
wire		hash_tbl_ecc_log_reg7_wen;

wire		fcram_err_test_reg0_pio_wen;
wire		fcram_err_test_reg1_pio_wen;
wire		fcram_err_test_reg2_pio_wen;

wire[7:0]	fcram_err_test_reg0_dout;
wire[31:0]	fcram_err_test_reg1_dout;
wire[31:0]	fcram_err_test_reg2_dout;
wire[71:0]	fcram_err_test_reg_dout;

wire[31:0]	hash_tbl_data_reg_mux;
wire[31:0]      hash_tbl_data_reg_h_mux;
wire[31:0]	hash_tbl_ecc_log_reg_mux;

wire[31:0]	h1_init_value_reg_dout;
wire[15:0]	h2_init_value_reg_dout;

wire[10:0]	flow_part_sel_reg0_dout;
wire[10:0]	flow_part_sel_reg1_dout;
wire[10:0]	flow_part_sel_reg2_dout;
wire[10:0]	flow_part_sel_reg3_dout;
wire[10:0]	flow_part_sel_reg4_dout;
wire[10:0]	flow_part_sel_reg5_dout;
wire[10:0]	flow_part_sel_reg6_dout;
wire[10:0]	flow_part_sel_reg7_dout;

wire[23:0]	hash_tbl_addr_reg0_dout;
wire[23:0]	hash_tbl_addr_reg1_dout;
wire[23:0]	hash_tbl_addr_reg2_dout;
wire[23:0]	hash_tbl_addr_reg3_dout;
wire[23:0]	hash_tbl_addr_reg4_dout;
wire[23:0]	hash_tbl_addr_reg5_dout;
wire[23:0]	hash_tbl_addr_reg6_dout;
wire[23:0]	hash_tbl_addr_reg7_dout;

wire[63:0]	hash_tbl_data_reg0_dout;
wire[63:0]      hash_tbl_data_reg1_dout;
wire[63:0]      hash_tbl_data_reg2_dout;
wire[63:0]      hash_tbl_data_reg3_dout;
wire[63:0]      hash_tbl_data_reg4_dout;
wire[63:0]      hash_tbl_data_reg5_dout;
wire[63:0]      hash_tbl_data_reg6_dout;
wire[63:0]      hash_tbl_data_reg7_dout;

wire[31:0]	hash_tbl_ecc_log_reg0_dout;
wire[31:0]      hash_tbl_ecc_log_reg1_dout;
wire[31:0]      hash_tbl_ecc_log_reg2_dout;
wire[31:0]      hash_tbl_ecc_log_reg3_dout;
wire[31:0]      hash_tbl_ecc_log_reg4_dout;
wire[31:0]      hash_tbl_ecc_log_reg5_dout;
wire[31:0]      hash_tbl_ecc_log_reg6_dout;
wire[31:0]      hash_tbl_ecc_log_reg7_dout;

wire		hash_lookup_log_reg0_pio_wen;
wire		hash_lookup_log_reg1_pio_wen;
wire		hash_lookup_log_reg0_en;
wire		hash_lookup_log_reg1_en;
wire		hash_lookup_log_reg0_wen;
wire		hash_lookup_log_reg1_wen;
wire		hash_lookup_log_reg0_din_bit1;
wire		hash_lookup_log_reg0_din_bit0;
wire		hash_lookup_log_reg0_din_bit2;
wire[3:0]	hash_lookup_log_reg0_din;
wire[3:0]	hash_lookup_log_reg0_mux;
wire[30:0]	hash_lookup_log_reg1_mux;
wire[3:0]	hash_lookup_log_reg0_dout;
wire[30:0]	hash_lookup_log_reg1_dout;

wire		cam_ecc_log_reg_pio_wen;
wire		cam_ecc_log_reg_wen;
wire[26:0]	cam_ecc_log_reg_din;
wire[26:0]	cam_ecc_log_reg_mux;
wire[26:0]	cam_ecc_log_reg_dout;

wire            fflp_config_reg_pio_wen;
wire		hdr_ctrl_bit_mask_reg_pio_wen;
wire		fcram_refresh_timer_reg_pio_wen;
wire		fio_cfg_addr_reg_pio_wen;
wire		debug_training_vector_pio_wen;

wire 		snap_en;
wire		fflp_init_done;
wire		disable_chksum;
wire		pio_disable_cam;
wire[3:0]	fcram_driver_imp_ctrl;
wire		fcram_qs_mode;
wire[3:0]	fcram_lookup_ratio_i;
wire[3:0]	fcram_lookup_ratio;
wire[3:0]	cam_srch_ratio_i;
wire[3:0]	cam_srch_ratio;
wire[3:0]	cam_srch_latency_i;
wire[3:0]	cam_srch_latency;
wire[1:0]	pio_fio_latency;
wire		pio_fio_cfg_reset;
wire[2:0]	pio_debug_data_sel;
wire[26:0]	fflp_config_reg_dout;
wire[11:0]      hdr_ctrl_bit_mask_reg_dout;
wire[31:0]	fcram_refresh_timer_reg_dout;
wire[7:0]	fio_cfg_addr_reg_dout;
wire[31:0]	debug_training_vector;
wire		pio_sel_pulse;
wire		fflp_config_reg_wen_pulse_in;
wire		fflp_config_reg_wen_pulse;

wire		fflp_err_intr_mask_wen;
wire[10:0]	fflp_err_intr_bits;
wire		fflp_pio_intr_in;
wire		fflp_pio_intr;
reg[10:0]	fflp_err_intr_mask_reg_dout;


wire		reset_s;
wire		reset_in = !reset_l;

niu_dff #(1) reset_s_reg (cclk, reset_in, reset_s);


/**************************/
//pio ack logic
/**************************/
assign pio_sel_pulse	= fflp_pio_sel & !pio_selected;

dffr #(1)  fflp_pio_sel_reg 	  (cclk, reset_s, pio_fflp_sel,		fflp_pio_sel);
dffr #(1)  pio_rd_reg	    	  (cclk, reset_s, pio_fflp_rd,  	pio_rd);
dffr #(20) pio_addr_reg		  (cclk, reset_s, pio_fflp_addr,	pio_addr);
dffr #(64) pio_wr_data_reg  	  (cclk, reset_s, pio_fflp_wdata,	pio_wr_data);
dffr #(1)  pio_selected_reg 	  (cclk, reset_s, fflp_pio_sel,		pio_selected);
dffr #(1)  pio_sel_pulse_dly1_reg (cclk, reset_s, pio_sel_pulse, 	pio_sel_pulse_dly1);
dffr #(1)  pio_32b_mode_reg	  (cclk, reset_s, pio_client_32b,	pio_32b_mode);

assign fflp_pio_ack_en	= pio_sel_pulse_dly1 & !(cpu_fcram_req | cpu_vlan_req | cpu_fio_req) | 
			  cpu_vlan_req & cpu_vlan_gnt_3 | cpu_fcram_req & cpu_fc_req_done_p1 | 
			  cpu_fio_req & cpu_fio_req_done_p;
assign pio_addr_err_in	= pio_sel_pulse_dly1 & pio_addr_err & pio_rd;

dffr #(1)  fflp_pio_ack_reg	(cclk, reset_s, fflp_pio_ack_en, fflp_pio_ack);
dffr #(1)  fflp_pio_err_reg	(cclk, reset_s, pio_addr_err_in, fflp_pio_err);

assign fflp_pio_rdata_en = fflp_pio_ack_en & pio_rd;
assign fflp_pio_rdata_in = pio_addr_err_in ? 64'b0 : pio_rd_data_tmp;

dffre #(64) fflp_pio_rdata_reg (cclk, reset_s, fflp_pio_rdata_en, fflp_pio_rdata_in, fflp_pio_rdata);

/*
always @ (posedge cclk)
if (reset_s)
	fflp_pio_rdata <= 64'b0;
else if (pio_sel_pulse_dly1 & pio_rd & pio_addr_err)
	fflp_pio_rdata <= 64'b0;
else if ((pio_sel_pulse_dly1 & !cpu_vlan_req | cpu_vlan_req & cpu_vlan_gnt_3) & pio_rd)
	fflp_pio_rdata <= pio_rd_data_tmp;
else
	fflp_pio_rdata <= fflp_pio_rdata;
*/

//pio read enable for ACR and write enable logic
//read pio data is 2 mult-cycles

assign pio_wen_en = pio_sel_pulse & !pio_rd;

dffr #(1) pio_wen_reg 			(cclk, reset_s, pio_wen_en, 			pio_wen);
dffr #(1) fflp_config_reg_wen_pulse_reg	(cclk, reset_s, fflp_config_reg_wen_pulse_in, 	fflp_config_reg_wen_pulse);


assign fflp_config_reg_wen_pulse_in	= (pio_sel_pulse | pio_sel_pulse_dly1) & !pio_rd & (pio_addr == 20'ha0100);

assign fflp_config_reg_pio_wen 		= pio_wen & (pio_addr == 20'ha0100);
assign hdr_ctrl_bit_mask_reg_pio_wen	= pio_wen & (pio_addr == 20'ha0108);
assign fcram_refresh_timer_reg_pio_wen	= pio_wen & (pio_addr == 20'ha0110);
assign fio_cfg_addr_reg_pio_wen		= pio_wen & (pio_addr == 20'ha0118);

assign fcram_err_test_reg0_pio_wen	= pio_wen & (pio_addr == 20'ha0128);
assign fcram_err_test_reg1_pio_wen	= pio_wen & (pio_addr == 20'ha0130);
assign fcram_err_test_reg2_pio_wen	= pio_wen & (pio_addr == 20'ha0138);
assign debug_training_vector_pio_wen	= pio_wen & (pio_addr == 20'ha0148);

assign class2_hdr_byte_value_pio_wen	= pio_wen & (pio_addr == 20'ha0000);
assign class3_hdr_byte_value_pio_wen	= pio_wen & (pio_addr == 20'ha0008);
assign class4_hdr_byte_value_pio_wen	= pio_wen & (pio_addr == 20'ha0010);
assign class5_hdr_byte_value_pio_wen	= pio_wen & (pio_addr == 20'ha0018);
assign class6_hdr_byte_value_pio_wen	= pio_wen & (pio_addr == 20'ha0020);
assign class7_hdr_byte_value_pio_wen	= pio_wen & (pio_addr == 20'ha0028);

assign class_action_reg4_pio_wen	= pio_wen & (pio_addr == 20'ha0030);
assign class_action_reg5_pio_wen	= pio_wen & (pio_addr == 20'ha0038);
assign class_action_reg6_pio_wen	= pio_wen & (pio_addr == 20'ha0040);
assign class_action_reg7_pio_wen	= pio_wen & (pio_addr == 20'ha0048);
assign class_action_reg8_pio_wen	= pio_wen & (pio_addr == 20'ha0050);
assign class_action_reg9_pio_wen	= pio_wen & (pio_addr == 20'ha0058);
assign class_action_reg10_pio_wen	= pio_wen & (pio_addr == 20'ha0060);
assign class_action_reg11_pio_wen	= pio_wen & (pio_addr == 20'ha0068);
assign class_action_reg12_pio_wen	= pio_wen & (pio_addr == 20'ha0070);
assign class_action_reg13_pio_wen	= pio_wen & (pio_addr == 20'ha0078);
assign class_action_reg14_pio_wen	= pio_wen & (pio_addr == 20'ha0080);
assign class_action_reg15_pio_wen	= pio_wen & (pio_addr == 20'ha0088);

assign f_key_class_action_reg4_pio_wen	= pio_wen & (pio_addr == 20'hc0000);
assign f_key_class_action_reg5_pio_wen	= pio_wen & (pio_addr == 20'hc0008);
assign f_key_class_action_reg6_pio_wen	= pio_wen & (pio_addr == 20'hc0010);
assign f_key_class_action_reg7_pio_wen	= pio_wen & (pio_addr == 20'hc0018);
assign f_key_class_action_reg8_pio_wen	= pio_wen & (pio_addr == 20'hc0020);
assign f_key_class_action_reg9_pio_wen	= pio_wen & (pio_addr == 20'hc0028);
assign f_key_class_action_reg10_pio_wen	= pio_wen & (pio_addr == 20'hc0030);
assign f_key_class_action_reg11_pio_wen	= pio_wen & (pio_addr == 20'hc0038);
assign f_key_class_action_reg12_pio_wen	= pio_wen & (pio_addr == 20'hc0040);
assign f_key_class_action_reg13_pio_wen	= pio_wen & (pio_addr == 20'hc0048);
assign f_key_class_action_reg14_pio_wen	= pio_wen & (pio_addr == 20'hc0050);
assign f_key_class_action_reg15_pio_wen	= pio_wen & (pio_addr == 20'hc0058);

assign h1_init_value_reg_pio_wen	= pio_wen & (pio_addr == 20'hc0060);
assign h2_init_value_reg_pio_wen	= pio_wen & (pio_addr == 20'hc0068);

assign flow_part_sel_reg0_pio_wen	= pio_wen & (pio_addr == 20'hc0070);
assign flow_part_sel_reg1_pio_wen	= pio_wen & (pio_addr == 20'hc0078);
assign flow_part_sel_reg2_pio_wen	= pio_wen & (pio_addr == 20'hc0080);
assign flow_part_sel_reg3_pio_wen	= pio_wen & (pio_addr == 20'hc0088);
assign flow_part_sel_reg4_pio_wen	= pio_wen & (pio_addr == 20'hc0090);
assign flow_part_sel_reg5_pio_wen	= pio_wen & (pio_addr == 20'hc0098);
assign flow_part_sel_reg6_pio_wen	= pio_wen & (pio_addr == 20'hc00a0);
assign flow_part_sel_reg7_pio_wen	= pio_wen & (pio_addr == 20'hc00a8);

assign hash_tbl_addr_reg0_pio_wen	= pio_wen & (pio_addr == 20'h00000);
assign hash_tbl_addr_reg1_pio_wen	= pio_wen & (pio_addr == 20'h02000);
assign hash_tbl_addr_reg2_pio_wen	= pio_wen & (pio_addr == 20'h04000);
assign hash_tbl_addr_reg3_pio_wen	= pio_wen & (pio_addr == 20'h06000);
assign hash_tbl_addr_reg4_pio_wen	= pio_wen & (pio_addr == 20'h08000);
assign hash_tbl_addr_reg5_pio_wen	= pio_wen & (pio_addr == 20'h0a000);
assign hash_tbl_addr_reg6_pio_wen	= pio_wen & (pio_addr == 20'h0c000);
assign hash_tbl_addr_reg7_pio_wen	= pio_wen & (pio_addr == 20'h0e000);

assign hash_tbl_addr_inc_wen0		= (pio_addr[15:13] == 3'd0) & hash_tbl_addr_reg0_dout[23] & cpu_fc_req_done_p;
assign hash_tbl_addr_inc_wen1		= (pio_addr[15:13] == 3'd1) & hash_tbl_addr_reg1_dout[23] & cpu_fc_req_done_p;
assign hash_tbl_addr_inc_wen2		= (pio_addr[15:13] == 3'd2) & hash_tbl_addr_reg2_dout[23] & cpu_fc_req_done_p;
assign hash_tbl_addr_inc_wen3           = (pio_addr[15:13] == 3'd3) & hash_tbl_addr_reg3_dout[23] & cpu_fc_req_done_p;
assign hash_tbl_addr_inc_wen4           = (pio_addr[15:13] == 3'd4) & hash_tbl_addr_reg4_dout[23] & cpu_fc_req_done_p;
assign hash_tbl_addr_inc_wen5           = (pio_addr[15:13] == 3'd5) & hash_tbl_addr_reg5_dout[23] & cpu_fc_req_done_p;
assign hash_tbl_addr_inc_wen6           = (pio_addr[15:13] == 3'd6) & hash_tbl_addr_reg6_dout[23] & cpu_fc_req_done_p;
assign hash_tbl_addr_inc_wen7           = (pio_addr[15:13] == 3'd7) & hash_tbl_addr_reg7_dout[23] & cpu_fc_req_done_p;
 
assign hash_tbl_addr_reg0_wen           = hash_tbl_addr_reg0_pio_wen | hash_tbl_addr_inc_wen0;
assign hash_tbl_addr_reg1_wen           = hash_tbl_addr_reg1_pio_wen | hash_tbl_addr_inc_wen1;
assign hash_tbl_addr_reg2_wen           = hash_tbl_addr_reg2_pio_wen | hash_tbl_addr_inc_wen2;
assign hash_tbl_addr_reg3_wen           = hash_tbl_addr_reg3_pio_wen | hash_tbl_addr_inc_wen3;
assign hash_tbl_addr_reg4_wen           = hash_tbl_addr_reg4_pio_wen | hash_tbl_addr_inc_wen4;
assign hash_tbl_addr_reg5_wen           = hash_tbl_addr_reg5_pio_wen | hash_tbl_addr_inc_wen5;
assign hash_tbl_addr_reg6_wen           = hash_tbl_addr_reg6_pio_wen | hash_tbl_addr_inc_wen6;
assign hash_tbl_addr_reg7_wen           = hash_tbl_addr_reg7_pio_wen | hash_tbl_addr_inc_wen7;

assign cpu_req_part0_sel		= (pio_addr[15:13] == 3'd0);
assign cpu_req_part1_sel		= (pio_addr[15:13] == 3'd1);
assign cpu_req_part2_sel                = (pio_addr[15:13] == 3'd2);
assign cpu_req_part3_sel                = (pio_addr[15:13] == 3'd3);
assign cpu_req_part4_sel                = (pio_addr[15:13] == 3'd4);
assign cpu_req_part5_sel                = (pio_addr[15:13] == 3'd5);
assign cpu_req_part6_sel                = (pio_addr[15:13] == 3'd6);
assign cpu_req_part7_sel                = (pio_addr[15:13] == 3'd7);


assign curr_hash_tbl_addr		= {23{cpu_req_part0_sel}} & hash_tbl_addr_reg0_dout[22:0] |
					  {23{cpu_req_part1_sel}} & hash_tbl_addr_reg1_dout[22:0] |
					  {23{cpu_req_part2_sel}} & hash_tbl_addr_reg2_dout[22:0] |
					  {23{cpu_req_part3_sel}} & hash_tbl_addr_reg3_dout[22:0] |
					  {23{cpu_req_part4_sel}} & hash_tbl_addr_reg4_dout[22:0] |
					  {23{cpu_req_part5_sel}} & hash_tbl_addr_reg5_dout[22:0] |
					  {23{cpu_req_part6_sel}} & hash_tbl_addr_reg6_dout[22:0] |
					  {23{cpu_req_part7_sel}} & hash_tbl_addr_reg7_dout[22:0];

assign next_hash_tbl_addr		= curr_hash_tbl_addr[22:0] + 23'd1;

dffr #(23) next_hash_tbl_addr_reg	(cclk, reset_s, next_hash_tbl_addr, next_hash_tbl_addr_r);

assign hash_tbl_addr_reg0_mux           = hash_tbl_addr_inc_wen0 ? {hash_tbl_addr_reg0_dout[23], next_hash_tbl_addr_r[22:0]} : pio_wr_data[23:0]; 
assign hash_tbl_addr_reg1_mux           = hash_tbl_addr_inc_wen1 ? {hash_tbl_addr_reg1_dout[23], next_hash_tbl_addr_r[22:0]} : pio_wr_data[23:0];
assign hash_tbl_addr_reg2_mux           = hash_tbl_addr_inc_wen2 ? {hash_tbl_addr_reg2_dout[23], next_hash_tbl_addr_r[22:0]} : pio_wr_data[23:0];
assign hash_tbl_addr_reg3_mux           = hash_tbl_addr_inc_wen3 ? {hash_tbl_addr_reg3_dout[23], next_hash_tbl_addr_r[22:0]} : pio_wr_data[23:0];
assign hash_tbl_addr_reg4_mux           = hash_tbl_addr_inc_wen4 ? {hash_tbl_addr_reg4_dout[23], next_hash_tbl_addr_r[22:0]} : pio_wr_data[23:0];
assign hash_tbl_addr_reg5_mux           = hash_tbl_addr_inc_wen5 ? {hash_tbl_addr_reg5_dout[23], next_hash_tbl_addr_r[22:0]} : pio_wr_data[23:0];
assign hash_tbl_addr_reg6_mux           = hash_tbl_addr_inc_wen6 ? {hash_tbl_addr_reg6_dout[23], next_hash_tbl_addr_r[22:0]} : pio_wr_data[23:0];
assign hash_tbl_addr_reg7_mux           = hash_tbl_addr_inc_wen7 ? {hash_tbl_addr_reg7_dout[23], next_hash_tbl_addr_r[22:0]} : pio_wr_data[23:0];

assign hash_tbl_data_reg0_pio_wen       = pio_wen & (pio_addr == 20'h00008);
assign hash_tbl_data_reg1_pio_wen       = pio_wen & (pio_addr == 20'h02008);
assign hash_tbl_data_reg2_pio_wen       = pio_wen & (pio_addr == 20'h04008);
assign hash_tbl_data_reg3_pio_wen       = pio_wen & (pio_addr == 20'h06008);
assign hash_tbl_data_reg4_pio_wen       = pio_wen & (pio_addr == 20'h08008);
assign hash_tbl_data_reg5_pio_wen       = pio_wen & (pio_addr == 20'h0a008);
assign hash_tbl_data_reg6_pio_wen       = pio_wen & (pio_addr == 20'h0c008);
assign hash_tbl_data_reg7_pio_wen       = pio_wen & (pio_addr == 20'h0e008);

assign hash_tbl_data_reg0_h_pio_wen     = pio_wen & ((pio_addr == 20'h00008) & !pio_32b_mode | (pio_addr == 20'h0000c) & pio_32b_mode);
assign hash_tbl_data_reg1_h_pio_wen     = pio_wen & ((pio_addr == 20'h02008) & !pio_32b_mode | (pio_addr == 20'h0200c) & pio_32b_mode);
assign hash_tbl_data_reg2_h_pio_wen     = pio_wen & ((pio_addr == 20'h04008) & !pio_32b_mode | (pio_addr == 20'h0400c) & pio_32b_mode);
assign hash_tbl_data_reg3_h_pio_wen     = pio_wen & ((pio_addr == 20'h06008) & !pio_32b_mode | (pio_addr == 20'h0600c) & pio_32b_mode);
assign hash_tbl_data_reg4_h_pio_wen     = pio_wen & ((pio_addr == 20'h08008) & !pio_32b_mode | (pio_addr == 20'h0800c) & pio_32b_mode);
assign hash_tbl_data_reg5_h_pio_wen     = pio_wen & ((pio_addr == 20'h0a008) & !pio_32b_mode | (pio_addr == 20'h0a00c) & pio_32b_mode);
assign hash_tbl_data_reg6_h_pio_wen     = pio_wen & ((pio_addr == 20'h0c008) & !pio_32b_mode | (pio_addr == 20'h0c00c) & pio_32b_mode);
assign hash_tbl_data_reg7_h_pio_wen     = pio_wen & ((pio_addr == 20'h0e008) & !pio_32b_mode | (pio_addr == 20'h0e00c) & pio_32b_mode);

assign hash_tbl_ecc_log_reg0_pio_wen	= pio_wen & (pio_addr == 20'h00010);
assign hash_tbl_ecc_log_reg1_pio_wen    = pio_wen & (pio_addr == 20'h02010);
assign hash_tbl_ecc_log_reg2_pio_wen    = pio_wen & (pio_addr == 20'h04010);
assign hash_tbl_ecc_log_reg3_pio_wen    = pio_wen & (pio_addr == 20'h06010);
assign hash_tbl_ecc_log_reg4_pio_wen    = pio_wen & (pio_addr == 20'h08010);
assign hash_tbl_ecc_log_reg5_pio_wen    = pio_wen & (pio_addr == 20'h0a010);
assign hash_tbl_ecc_log_reg6_pio_wen    = pio_wen & (pio_addr == 20'h0c010);
assign hash_tbl_ecc_log_reg7_pio_wen    = pio_wen & (pio_addr == 20'h0e010);

assign hash_tbl_data_reg0_wen           = hash_tbl_data_reg0_pio_wen | cpu_req_part0_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_data_reg1_wen           = hash_tbl_data_reg1_pio_wen | cpu_req_part1_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_data_reg2_wen           = hash_tbl_data_reg2_pio_wen | cpu_req_part2_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_data_reg3_wen           = hash_tbl_data_reg3_pio_wen | cpu_req_part3_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_data_reg4_wen           = hash_tbl_data_reg4_pio_wen | cpu_req_part4_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_data_reg5_wen           = hash_tbl_data_reg5_pio_wen | cpu_req_part5_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_data_reg6_wen           = hash_tbl_data_reg6_pio_wen | cpu_req_part6_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_data_reg7_wen           = hash_tbl_data_reg7_pio_wen | cpu_req_part7_sel & cpu_fc_req_done_p & pio_rd;

assign hash_tbl_data_reg0_h_wen         = hash_tbl_data_reg0_h_pio_wen | cpu_req_part0_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_data_reg1_h_wen         = hash_tbl_data_reg1_h_pio_wen | cpu_req_part1_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_data_reg2_h_wen         = hash_tbl_data_reg2_h_pio_wen | cpu_req_part2_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_data_reg3_h_wen         = hash_tbl_data_reg3_h_pio_wen | cpu_req_part3_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_data_reg4_h_wen         = hash_tbl_data_reg4_h_pio_wen | cpu_req_part4_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_data_reg5_h_wen         = hash_tbl_data_reg5_h_pio_wen | cpu_req_part5_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_data_reg6_h_wen         = hash_tbl_data_reg6_h_pio_wen | cpu_req_part6_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_data_reg7_h_wen         = hash_tbl_data_reg7_h_pio_wen | cpu_req_part7_sel & cpu_fc_req_done_p & pio_rd;

assign hash_tbl_ecc_log_reg0_wen	= hash_tbl_ecc_log_reg0_pio_wen | cpu_req_part0_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_ecc_log_reg1_wen	= hash_tbl_ecc_log_reg1_pio_wen | cpu_req_part1_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_ecc_log_reg2_wen	= hash_tbl_ecc_log_reg2_pio_wen | cpu_req_part2_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_ecc_log_reg3_wen	= hash_tbl_ecc_log_reg3_pio_wen | cpu_req_part3_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_ecc_log_reg4_wen        = hash_tbl_ecc_log_reg4_pio_wen | cpu_req_part4_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_ecc_log_reg5_wen        = hash_tbl_ecc_log_reg5_pio_wen | cpu_req_part5_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_ecc_log_reg6_wen        = hash_tbl_ecc_log_reg6_pio_wen | cpu_req_part6_sel & cpu_fc_req_done_p & pio_rd;
assign hash_tbl_ecc_log_reg7_wen        = hash_tbl_ecc_log_reg7_pio_wen | cpu_req_part7_sel & cpu_fc_req_done_p & pio_rd;

assign hash_tbl_data_reg_mux		= cpu_fc_req_done_p ? fc_rd_data_reg_dout[31:0] :  pio_wr_data[31:0];
assign hash_tbl_data_reg_h_mux		= cpu_fc_req_done_p ? fc_rd_data_reg_dout[63:32] :  pio_wr_data[63:32];
assign hash_tbl_ecc_log_reg_mux		= cpu_fc_req_done_p ? {fc_rd_ecc_err, curr_hash_tbl_addr[22:0], fc_rd_data_reg_dout[71:64]} : 
								pio_wr_data[31:0];

assign cam_ecc_log_reg_pio_wen		= pio_wen & (pio_addr == 20'ha00d8);
assign cam_ecc_log_reg_wen		= cam_ecc_log_reg_pio_wen | ecc_parity_status[25];
assign cam_ecc_log_reg_din		= cam_ecc_log_reg_dout[26] ? {cam_ecc_log_reg_dout[26:25], 1'b1, cam_ecc_log_reg_dout[23:0]} :
								     {ecc_parity_status[25:24], 1'b0, ecc_parity_status[23:0]};  
assign cam_ecc_log_reg_mux		= ecc_parity_status[25] ? cam_ecc_log_reg_din[26:0] : {pio_wr_data[31:29], pio_wr_data[23:0]};

assign hash_lookup_log_reg0_pio_wen	= pio_wen & (pio_addr == 20'ha00e0);  
assign hash_lookup_log_reg1_pio_wen	= pio_wen & (pio_addr == 20'ha00e8);

assign hash_lookup_log_reg0_en		= fflp_zcp_wr_p & fc_err_status[33];
assign hash_lookup_log_reg1_en		= fflp_zcp_wr_p & fc_err_status[33] & !hash_lookup_log_reg0_dout[3];
assign hash_lookup_log_reg0_wen		= hash_lookup_log_reg0_pio_wen | hash_lookup_log_reg0_en;
assign hash_lookup_log_reg1_wen		= hash_lookup_log_reg1_pio_wen | hash_lookup_log_reg1_en;

assign hash_lookup_log_reg0_din_bit2	= hash_lookup_log_reg0_dout[3] ? 1'b1 : 1'b0;
assign hash_lookup_log_reg0_din_bit1	= hash_lookup_log_reg0_dout[3] ? hash_lookup_log_reg0_dout[1] : fc_err_status[32];
assign hash_lookup_log_reg0_din_bit0	= hash_lookup_log_reg0_dout[3] ? hash_lookup_log_reg0_dout[0] : fc_err_status[31];
assign hash_lookup_log_reg0_din		= {fc_err_status[33], hash_lookup_log_reg0_din_bit2, hash_lookup_log_reg0_din_bit1, 
								hash_lookup_log_reg0_din_bit0};
assign hash_lookup_log_reg0_mux		= hash_lookup_log_reg0_en ? hash_lookup_log_reg0_din[3:0] : pio_wr_data[3:0]; 

assign hash_lookup_log_reg1_mux		= hash_lookup_log_reg1_en ? fc_err_status[30:0] : pio_wr_data[30:0];


dffre #(12)  hdr_ctrl_bit_mask_reg 	(cclk, reset_s, hdr_ctrl_bit_mask_reg_pio_wen,   pio_wr_data[11:0], hdr_ctrl_bit_mask_reg_dout[11:0]);
dffre #(27)  fflp_config_reg       	(cclk, reset_s, fflp_config_reg_pio_wen,         pio_wr_data[26:0], fflp_config_reg_dout[26:0]);
dffre #(32)  fcram_refresh_timer_reg	(cclk, reset_s, fcram_refresh_timer_reg_pio_wen, pio_wr_data[31:0], fcram_refresh_timer_reg_dout);
dffre #(8)   fio_cfg_addr_reg		(cclk, reset_s, fio_cfg_addr_reg_pio_wen,	 pio_wr_data[7:0],  fio_cfg_addr_reg_dout);

assign snap_en                  = fflp_config_reg_dout[0];
assign fflp_init_done           = fflp_config_reg_dout[1];
assign disable_chksum           = fflp_config_reg_dout[2];
assign fcram_qs_mode            = fflp_config_reg_dout[3];      // set 1 to free running QS mode
assign fcram_driver_imp_ctrl    = fflp_config_reg_dout[7:4];    // 4'b0 for normal output drive
assign fcram_lookup_ratio_i     = fflp_config_reg_dout[11:8];
assign cam_srch_ratio_i         = fflp_config_reg_dout[15:12];
assign cam_srch_latency_i       = fflp_config_reg_dout[19:16];
assign pio_fio_latency          = fflp_config_reg_dout[21:20];
assign pio_fio_cfg_reset        = fflp_config_reg_dout[22];
assign pio_debug_data_sel       = fflp_config_reg_dout[25:23];
assign pio_disable_cam		= fflp_config_reg_dout[26];

assign fcram_lookup_ratio	= (fcram_lookup_ratio_i == 4'b0) 	? 4'd1 : fcram_lookup_ratio_i;
assign cam_srch_ratio		= (cam_srch_ratio_i == 4'b0)		? 4'd1 : cam_srch_ratio_i;
assign cam_srch_latency		= (cam_srch_latency_i[3:2] == 2'b0) 	? 4'd3 : cam_srch_latency_i;


dffre #(17) class2_hdr_byte_value_reg  (cclk, reset_s, class2_hdr_byte_value_pio_wen, pio_wr_data[16:0], class2_hdr_byte_value[16:0]);
dffre #(17) class3_hdr_byte_value_reg  (cclk, reset_s, class3_hdr_byte_value_pio_wen, pio_wr_data[16:0], class3_hdr_byte_value[16:0]);
dffre #(26) class4_hdr_byte_value_reg  (cclk, reset_s, class4_hdr_byte_value_pio_wen, pio_wr_data[25:0], class4_hdr_byte_value[25:0]);
dffre #(26) class5_hdr_byte_value_reg  (cclk, reset_s, class5_hdr_byte_value_pio_wen, pio_wr_data[25:0], class5_hdr_byte_value[25:0]);
dffre #(26) class6_hdr_byte_value_reg  (cclk, reset_s, class6_hdr_byte_value_pio_wen, pio_wr_data[25:0], class6_hdr_byte_value[25:0]);
dffre #(26) class7_hdr_byte_value_reg  (cclk, reset_s, class7_hdr_byte_value_pio_wen, pio_wr_data[25:0], class7_hdr_byte_value[25:0]);

//def class action register per l3 class
dffre #(3) class_action_reg4  (cclk, reset_s, class_action_reg4_pio_wen,  {pio_wr_data[3:2], pio_wr_data[0]}, class_action_reg4_dout[2:0]);
dffre #(3) class_action_reg5  (cclk, reset_s, class_action_reg5_pio_wen,  {pio_wr_data[3:2], pio_wr_data[0]}, class_action_reg5_dout[2:0]);
dffre #(3) class_action_reg6  (cclk, reset_s, class_action_reg6_pio_wen,  {pio_wr_data[3:2], pio_wr_data[0]}, class_action_reg6_dout[2:0]);
dffre #(3) class_action_reg7  (cclk, reset_s, class_action_reg7_pio_wen,  {pio_wr_data[3:2], pio_wr_data[0]}, class_action_reg7_dout[2:0]);
dffre #(3) class_action_reg8  (cclk, reset_s, class_action_reg8_pio_wen,  {pio_wr_data[3:2], pio_wr_data[0]}, class_action_reg8_dout[2:0]);
dffre #(3) class_action_reg9  (cclk, reset_s, class_action_reg9_pio_wen,  {pio_wr_data[3:2], pio_wr_data[0]}, class_action_reg9_dout[2:0]);
dffre #(3) class_action_reg10 (cclk, reset_s, class_action_reg10_pio_wen, {pio_wr_data[3:2], pio_wr_data[0]}, class_action_reg10_dout[2:0]);
dffre #(3) class_action_reg11 (cclk, reset_s, class_action_reg11_pio_wen, {pio_wr_data[3:2], pio_wr_data[0]}, class_action_reg11_dout[2:0]);
dffre #(3) class_action_reg12 (cclk, reset_s, class_action_reg12_pio_wen, {pio_wr_data[3:2], pio_wr_data[0]}, class_action_reg12_dout[2:0]);
dffre #(3) class_action_reg13 (cclk, reset_s, class_action_reg13_pio_wen, {pio_wr_data[3:2], pio_wr_data[0]}, class_action_reg13_dout[2:0]);
dffre #(3) class_action_reg14 (cclk, reset_s, class_action_reg14_pio_wen, {pio_wr_data[3:2], pio_wr_data[0]}, class_action_reg14_dout[2:0]);
dffre #(3) class_action_reg15 (cclk, reset_s, class_action_reg15_pio_wen, {pio_wr_data[3:2], pio_wr_data[0]}, class_action_reg15_dout[2:0]);

dffre #(10) f_key_class_action_reg4  (cclk, reset_s, f_key_class_action_reg4_pio_wen,  pio_wr_data[9:0], f_key_class_action_reg4_dout[9:0]);
dffre #(10) f_key_class_action_reg5  (cclk, reset_s, f_key_class_action_reg5_pio_wen,  pio_wr_data[9:0], f_key_class_action_reg5_dout[9:0]);
dffre #(10) f_key_class_action_reg6  (cclk, reset_s, f_key_class_action_reg6_pio_wen,  pio_wr_data[9:0], f_key_class_action_reg6_dout[9:0]);
dffre #(10) f_key_class_action_reg7  (cclk, reset_s, f_key_class_action_reg7_pio_wen,  pio_wr_data[9:0], f_key_class_action_reg7_dout[9:0]);
dffre #(10) f_key_class_action_reg8  (cclk, reset_s, f_key_class_action_reg8_pio_wen,  pio_wr_data[9:0], f_key_class_action_reg8_dout[9:0]);
dffre #(10) f_key_class_action_reg9  (cclk, reset_s, f_key_class_action_reg9_pio_wen,  pio_wr_data[9:0], f_key_class_action_reg9_dout[9:0]);
dffre #(10) f_key_class_action_reg10 (cclk, reset_s, f_key_class_action_reg10_pio_wen, pio_wr_data[9:0], f_key_class_action_reg10_dout[9:0]);
dffre #(10) f_key_class_action_reg11 (cclk, reset_s, f_key_class_action_reg11_pio_wen, pio_wr_data[9:0], f_key_class_action_reg11_dout[9:0]);
dffre #(10) f_key_class_action_reg12 (cclk, reset_s, f_key_class_action_reg12_pio_wen, pio_wr_data[9:0], f_key_class_action_reg12_dout[9:0]);
dffre #(10) f_key_class_action_reg13 (cclk, reset_s, f_key_class_action_reg13_pio_wen, pio_wr_data[9:0], f_key_class_action_reg13_dout[9:0]);
dffre #(10) f_key_class_action_reg14 (cclk, reset_s, f_key_class_action_reg14_pio_wen, pio_wr_data[9:0], f_key_class_action_reg14_dout[9:0]);
dffre #(10) f_key_class_action_reg15 (cclk, reset_s, f_key_class_action_reg15_pio_wen, pio_wr_data[9:0], f_key_class_action_reg15_dout[9:0]);

dffre #(32) h1_poly_init_value_reg (cclk, reset_s, h1_init_value_reg_pio_wen, pio_wr_data[31:0], h1_init_value_reg_dout);
dffre #(16) h2_poly_init_value_reg (cclk, reset_s, h2_init_value_reg_pio_wen, pio_wr_data[15:0], h2_init_value_reg_dout);		

wire[10:0] flow_part_pio_wr_data = {pio_wr_data[16], pio_wr_data[12:8], pio_wr_data[4:0]};

dffre #(11) flow_part_sel_reg0	(cclk, reset_s, flow_part_sel_reg0_pio_wen, flow_part_pio_wr_data[10:0], flow_part_sel_reg0_dout);  
dffre #(11) flow_part_sel_reg1  (cclk, reset_s, flow_part_sel_reg1_pio_wen, flow_part_pio_wr_data[10:0], flow_part_sel_reg1_dout);
dffre #(11) flow_part_sel_reg2  (cclk, reset_s, flow_part_sel_reg2_pio_wen, flow_part_pio_wr_data[10:0], flow_part_sel_reg2_dout);
dffre #(11) flow_part_sel_reg3  (cclk, reset_s, flow_part_sel_reg3_pio_wen, flow_part_pio_wr_data[10:0], flow_part_sel_reg3_dout);
dffre #(11) flow_part_sel_reg4  (cclk, reset_s, flow_part_sel_reg4_pio_wen, flow_part_pio_wr_data[10:0], flow_part_sel_reg4_dout);
dffre #(11) flow_part_sel_reg5  (cclk, reset_s, flow_part_sel_reg5_pio_wen, flow_part_pio_wr_data[10:0], flow_part_sel_reg5_dout);
dffre #(11) flow_part_sel_reg6  (cclk, reset_s, flow_part_sel_reg6_pio_wen, flow_part_pio_wr_data[10:0], flow_part_sel_reg6_dout);
dffre #(11) flow_part_sel_reg7  (cclk, reset_s, flow_part_sel_reg7_pio_wen, flow_part_pio_wr_data[10:0], flow_part_sel_reg7_dout);	

dffre #(24) hash_tbl_addr_reg0	(cclk, reset_s, hash_tbl_addr_reg0_wen, hash_tbl_addr_reg0_mux[23:0], hash_tbl_addr_reg0_dout); 
dffre #(24) hash_tbl_addr_reg1	(cclk, reset_s, hash_tbl_addr_reg1_wen, hash_tbl_addr_reg1_mux[23:0], hash_tbl_addr_reg1_dout);
dffre #(24) hash_tbl_addr_reg2	(cclk, reset_s, hash_tbl_addr_reg2_wen, hash_tbl_addr_reg2_mux[23:0], hash_tbl_addr_reg2_dout);
dffre #(24) hash_tbl_addr_reg3	(cclk, reset_s, hash_tbl_addr_reg3_wen, hash_tbl_addr_reg3_mux[23:0], hash_tbl_addr_reg3_dout);
dffre #(24) hash_tbl_addr_reg4	(cclk, reset_s, hash_tbl_addr_reg4_wen, hash_tbl_addr_reg4_mux[23:0], hash_tbl_addr_reg4_dout);
dffre #(24) hash_tbl_addr_reg5	(cclk, reset_s, hash_tbl_addr_reg5_wen, hash_tbl_addr_reg5_mux[23:0], hash_tbl_addr_reg5_dout);
dffre #(24) hash_tbl_addr_reg6	(cclk, reset_s, hash_tbl_addr_reg6_wen, hash_tbl_addr_reg6_mux[23:0], hash_tbl_addr_reg6_dout);
dffre #(24) hash_tbl_addr_reg7	(cclk, reset_s, hash_tbl_addr_reg7_wen, hash_tbl_addr_reg7_mux[23:0], hash_tbl_addr_reg7_dout);

dffre #(32) hash_tbl_data_reg0_l  (cclk, reset_s, hash_tbl_data_reg0_wen, hash_tbl_data_reg_mux[31:0], hash_tbl_data_reg0_dout[31:0]); 
dffre #(32) hash_tbl_data_reg1_l  (cclk, reset_s, hash_tbl_data_reg1_wen, hash_tbl_data_reg_mux[31:0], hash_tbl_data_reg1_dout[31:0]);
dffre #(32) hash_tbl_data_reg2_l  (cclk, reset_s, hash_tbl_data_reg2_wen, hash_tbl_data_reg_mux[31:0], hash_tbl_data_reg2_dout[31:0]);
dffre #(32) hash_tbl_data_reg3_l  (cclk, reset_s, hash_tbl_data_reg3_wen, hash_tbl_data_reg_mux[31:0], hash_tbl_data_reg3_dout[31:0]);
dffre #(32) hash_tbl_data_reg4_l  (cclk, reset_s, hash_tbl_data_reg4_wen, hash_tbl_data_reg_mux[31:0], hash_tbl_data_reg4_dout[31:0]);
dffre #(32) hash_tbl_data_reg5_l  (cclk, reset_s, hash_tbl_data_reg5_wen, hash_tbl_data_reg_mux[31:0], hash_tbl_data_reg5_dout[31:0]);
dffre #(32) hash_tbl_data_reg6_l  (cclk, reset_s, hash_tbl_data_reg6_wen, hash_tbl_data_reg_mux[31:0], hash_tbl_data_reg6_dout[31:0]);
dffre #(32) hash_tbl_data_reg7_l  (cclk, reset_s, hash_tbl_data_reg7_wen, hash_tbl_data_reg_mux[31:0], hash_tbl_data_reg7_dout[31:0]);

dffre #(32) hash_tbl_data_reg0_h  (cclk, reset_s, hash_tbl_data_reg0_h_wen, hash_tbl_data_reg_h_mux[31:0], hash_tbl_data_reg0_dout[63:32]);
dffre #(32) hash_tbl_data_reg1_h  (cclk, reset_s, hash_tbl_data_reg1_h_wen, hash_tbl_data_reg_h_mux[31:0], hash_tbl_data_reg1_dout[63:32]);
dffre #(32) hash_tbl_data_reg2_h  (cclk, reset_s, hash_tbl_data_reg2_h_wen, hash_tbl_data_reg_h_mux[31:0], hash_tbl_data_reg2_dout[63:32]);
dffre #(32) hash_tbl_data_reg3_h  (cclk, reset_s, hash_tbl_data_reg3_h_wen, hash_tbl_data_reg_h_mux[31:0], hash_tbl_data_reg3_dout[63:32]);
dffre #(32) hash_tbl_data_reg4_h  (cclk, reset_s, hash_tbl_data_reg4_h_wen, hash_tbl_data_reg_h_mux[31:0], hash_tbl_data_reg4_dout[63:32]);
dffre #(32) hash_tbl_data_reg5_h  (cclk, reset_s, hash_tbl_data_reg5_h_wen, hash_tbl_data_reg_h_mux[31:0], hash_tbl_data_reg5_dout[63:32]);
dffre #(32) hash_tbl_data_reg6_h  (cclk, reset_s, hash_tbl_data_reg6_h_wen, hash_tbl_data_reg_h_mux[31:0], hash_tbl_data_reg6_dout[63:32]);
dffre #(32) hash_tbl_data_reg7_h  (cclk, reset_s, hash_tbl_data_reg7_h_wen, hash_tbl_data_reg_h_mux[31:0], hash_tbl_data_reg7_dout[63:32]);

dffre #(32) hash_tbl_ecc_log_reg0 (cclk, reset_s, hash_tbl_ecc_log_reg0_wen, hash_tbl_ecc_log_reg_mux, hash_tbl_ecc_log_reg0_dout);
dffre #(32) hash_tbl_ecc_log_reg1 (cclk, reset_s, hash_tbl_ecc_log_reg1_wen, hash_tbl_ecc_log_reg_mux, hash_tbl_ecc_log_reg1_dout);
dffre #(32) hash_tbl_ecc_log_reg2 (cclk, reset_s, hash_tbl_ecc_log_reg2_wen, hash_tbl_ecc_log_reg_mux, hash_tbl_ecc_log_reg2_dout);
dffre #(32) hash_tbl_ecc_log_reg3 (cclk, reset_s, hash_tbl_ecc_log_reg3_wen, hash_tbl_ecc_log_reg_mux, hash_tbl_ecc_log_reg3_dout);
dffre #(32) hash_tbl_ecc_log_reg4 (cclk, reset_s, hash_tbl_ecc_log_reg4_wen, hash_tbl_ecc_log_reg_mux, hash_tbl_ecc_log_reg4_dout);
dffre #(32) hash_tbl_ecc_log_reg5 (cclk, reset_s, hash_tbl_ecc_log_reg5_wen, hash_tbl_ecc_log_reg_mux, hash_tbl_ecc_log_reg5_dout);
dffre #(32) hash_tbl_ecc_log_reg6 (cclk, reset_s, hash_tbl_ecc_log_reg6_wen, hash_tbl_ecc_log_reg_mux, hash_tbl_ecc_log_reg6_dout);
dffre #(32) hash_tbl_ecc_log_reg7 (cclk, reset_s, hash_tbl_ecc_log_reg7_wen, hash_tbl_ecc_log_reg_mux, hash_tbl_ecc_log_reg7_dout);

dffre #(27) cam_ecc_log_reg	  (cclk, reset_s, cam_ecc_log_reg_wen,      cam_ecc_log_reg_mux,      cam_ecc_log_reg_dout);
dffre #(4)  hash_lookup_log_reg0  (cclk, reset_s, hash_lookup_log_reg0_wen, hash_lookup_log_reg0_mux, hash_lookup_log_reg0_dout);
dffre #(31) hash_lookup_log_reg1  (cclk, reset_s, hash_lookup_log_reg1_wen, hash_lookup_log_reg1_mux, hash_lookup_log_reg1_dout);

dffre #(8)  fcram_err_test_reg0	  (cclk, reset_s, fcram_err_test_reg0_pio_wen, pio_wr_data[7:0],  fcram_err_test_reg0_dout);
dffre #(32) fcram_err_test_reg1   (cclk, reset_s, fcram_err_test_reg1_pio_wen, pio_wr_data[31:0], fcram_err_test_reg1_dout);
dffre #(32) fcram_err_test_reg2   (cclk, reset_s, fcram_err_test_reg2_pio_wen, pio_wr_data[31:0], fcram_err_test_reg2_dout);

dffre #(32) debug_tran_vector_reg (cclk, reset_s, debug_training_vector_pio_wen, pio_wr_data[31:0], debug_training_vector);

/************************/
//CPU Vlan table access
/************************/
assign cpu_vlan_rd	= pio_rd & (pio_addr[16:15] == 2'b00) & (!pio_32b_mode | pio_32b_mode & !pio_addr[2]);
assign cpu_vlan_wr      = !pio_rd & (pio_addr[16:15] == 2'b00) & (!pio_32b_mode | pio_32b_mode & !pio_addr[2]);

assign is_vlan_addr	= (pio_addr[19:17] == 3'b100);
assign cpu_vlan_addr	= pio_addr[14:3];
assign vlan_tbl_wr_dout	= {pio_wr_data[17], pio_wr_data[15:8], pio_wr_data[16], pio_wr_data[7:0]};
assign vlan_tbl_rd_data = {18{cpu_vlan_gnt_3}} & vlan_tbl_din_reg_dout[17:0]; 

assign cpu_vlan_req_en	= pio_sel_pulse & is_vlan_addr | cpu_vlan_gnt_3;
assign cpu_vlan_req_in	= pio_sel_pulse & is_vlan_addr ? 1'b1 : 1'b0;

dffre #(1) cpu_vlan_req_reg (cclk, reset_s, cpu_vlan_req_en, cpu_vlan_req_in, cpu_vlan_req); 

assign vlan_parity_err_log_tmp	= vlan_parity_err_log_reg_dout[31] ? {2'b11, vlan_parity_err_log_reg_dout[29:0]} :
								     {2'b10, vlan_tag_id[11:0], vlan_tbl_din_reg_dout[17:0]}; 
assign vlan_parity_err_log_mux	= vlan_parity_err_log_en ?           vlan_parity_err_log_tmp[31:0] : pio_wr_data[31:0];

assign vlan_parity_err_log_pio_wen	= pio_wen & (pio_addr == 20'h88000);
assign vlan_parity_err_log_wen		= vlan_parity_err_log_pio_wen | vlan_parity_err_log_en;

dffre #(32) vlan_parity_err_log_reg (cclk, reset_s, vlan_parity_err_log_wen, vlan_parity_err_log_mux, vlan_parity_err_log_reg_dout); 

/************************/
//CPU access FCRAM
/************************/
assign fcram_err_test_reg_dout	= {fcram_err_test_reg0_dout, fcram_err_test_reg1_dout, fcram_err_test_reg2_dout};
assign cpu_fc_req_done_p	= cpu_fc_req_done_sync & !cpu_fc_req_done_sync_d;
assign is_fcram_data_addr	= (pio_addr[12:0] == 13'd8) & (pio_addr[19:16] == 4'b0) & !pio_32b_mode |
				  (pio_addr[12:0] == 13'd12) & (pio_addr[19:16] == 4'b0) & pio_32b_mode;
assign is_ext_fcram		= ((pio_addr[15:13] == 3'd0) & flow_part_sel_reg0_dout[10] |
				   (pio_addr[15:13] == 3'd1) & flow_part_sel_reg1_dout[10] |
				   (pio_addr[15:13] == 3'd2) & flow_part_sel_reg2_dout[10] |
				   (pio_addr[15:13] == 3'd3) & flow_part_sel_reg3_dout[10] |
				   (pio_addr[15:13] == 3'd4) & flow_part_sel_reg4_dout[10] |
				   (pio_addr[15:13] == 3'd5) & flow_part_sel_reg5_dout[10] |
				   (pio_addr[15:13] == 3'd6) & flow_part_sel_reg6_dout[10] |
				   (pio_addr[15:13] == 3'd7) & flow_part_sel_reg7_dout[10]);
assign is_fcram_req		= pio_sel_pulse & is_fcram_data_addr & is_ext_fcram;
assign cpu_fcram_req_en		= is_fcram_req | cpu_fc_req_done_p1;
assign cpu_fcram_req_in		= is_fcram_req ? 1'b1 : 1'b0;

dffr  #(1) cpu_fc_req_done_d_reg	(cclk, reset_s, cpu_fc_req_done_sync, cpu_fc_req_done_sync_d);
dffr  #(1) cpu_fc_req_done_p1_reg	(cclk, reset_s, cpu_fc_req_done_p, cpu_fc_req_done_p1);

dffre #(1) cpu_fcram_req_reg		(cclk, reset_s, cpu_fcram_req_en, cpu_fcram_req_in, cpu_fcram_req);


/************************/
//CPU access FIO
/************************/
assign cpu_fio_req_done_p	= cpu_fio_req_done_sync & !cpu_fio_req_done_sync_d;
assign is_fio_data_addr		= (pio_addr == 20'ha0120);
assign is_ext_fio		= flow_part_sel_reg0_dout[10] | flow_part_sel_reg1_dout[10] |
				  flow_part_sel_reg2_dout[10] | flow_part_sel_reg3_dout[10] |
				  flow_part_sel_reg4_dout[10] | flow_part_sel_reg5_dout[10] |
				  flow_part_sel_reg6_dout[10] | flow_part_sel_reg7_dout[10];
assign cpu_fio_req_en		= pio_sel_pulse & is_fio_data_addr & is_ext_fio | cpu_fio_req_done_p;
assign cpu_fio_req_in		= pio_sel_pulse & is_fio_data_addr & is_ext_fio ? 1'b1 : 1'b0;

dffr  #(1) cpu_fio_req_done_d_reg	(cclk, reset_s, 		cpu_fio_req_done_sync,  cpu_fio_req_done_sync_d);
dffre #(1) cpu_fio_req_reg		(cclk, reset_s, cpu_fio_req_en,	cpu_fio_req_in,		cpu_fio_req);

/************************/
//Interrupt
/************************/
assign fflp_err_intr_mask_wen	= pio_wen & (pio_addr == 20'ha0140);
assign fflp_err_intr_bits	= {	hash_tbl_ecc_log_reg7_dout[31],
				   	hash_tbl_ecc_log_reg6_dout[31],
				   	hash_tbl_ecc_log_reg5_dout[31],
					hash_tbl_ecc_log_reg4_dout[31],
					hash_tbl_ecc_log_reg3_dout[31],
					hash_tbl_ecc_log_reg2_dout[31],
					hash_tbl_ecc_log_reg1_dout[31],
					hash_tbl_ecc_log_reg0_dout[31],
					hash_lookup_log_reg0_dout[3],
					cam_ecc_log_reg_dout[26],
					vlan_parity_err_log_reg_dout[31] };

assign fflp_pio_intr_in		= |(fflp_err_intr_bits[10:0] & (~fflp_err_intr_mask_reg_dout[10:0]));

dffr  #(1) fflp_err_intr_reg	(cclk, reset_s, fflp_pio_intr_in, fflp_pio_intr);

always @ (posedge cclk)
if (reset_s)
	fflp_err_intr_mask_reg_dout <= 11'h7ff;
else if (fflp_err_intr_mask_wen)
	fflp_err_intr_mask_reg_dout <= pio_wr_data[10:0];
else
	fflp_err_intr_mask_reg_dout <= fflp_err_intr_mask_reg_dout;



always @ (pio_addr or pio_32b_mode or fflp_config_reg_dout or
hdr_ctrl_bit_mask_reg_dout or fcram_refresh_timer_reg_dout or
class2_hdr_byte_value or class3_hdr_byte_value or
class4_hdr_byte_value or class5_hdr_byte_value or
class6_hdr_byte_value or class7_hdr_byte_value or
class_action_reg4_dout or class_action_reg5_dout or
class_action_reg6_dout or class_action_reg7_dout or
class_action_reg8_dout or class_action_reg9_dout or
class_action_reg10_dout or class_action_reg11_dout or
class_action_reg12_dout or class_action_reg13_dout or 
class_action_reg14_dout or class_action_reg15_dout or 
f_key_class_action_reg4_dout or f_key_class_action_reg5_dout or
f_key_class_action_reg6_dout or f_key_class_action_reg7_dout or
f_key_class_action_reg8_dout or f_key_class_action_reg9_dout or
f_key_class_action_reg10_dout or f_key_class_action_reg11_dout or
f_key_class_action_reg12_dout or f_key_class_action_reg13_dout or
f_key_class_action_reg14_dout or f_key_class_action_reg15_dout or
cam_key_reg0_dout or cam_key_reg1_dout or
cam_key_reg2_dout or cam_key_reg3_dout or
cam_key_mask_reg0_dout or cam_key_mask_reg1_dout or
cam_key_mask_reg2_dout or cam_key_mask_reg3_dout or
cam_cmd_stat_reg_dout or vlan_tbl_rd_data or 
vlan_parity_err_log_reg_dout or 
h1_init_value_reg_dout or h2_init_value_reg_dout or
flow_part_sel_reg0_dout or flow_part_sel_reg1_dout or
flow_part_sel_reg2_dout or flow_part_sel_reg3_dout or
flow_part_sel_reg4_dout or flow_part_sel_reg5_dout or
flow_part_sel_reg6_dout or flow_part_sel_reg7_dout or
hash_tbl_addr_reg0_dout or hash_tbl_addr_reg1_dout or
hash_tbl_addr_reg2_dout or hash_tbl_addr_reg3_dout or
hash_tbl_addr_reg4_dout or hash_tbl_addr_reg5_dout or 
hash_tbl_addr_reg6_dout or hash_tbl_addr_reg7_dout or
hash_tbl_data_reg0_dout or hash_tbl_data_reg1_dout or
hash_tbl_data_reg2_dout or hash_tbl_data_reg3_dout or
hash_tbl_data_reg4_dout or hash_tbl_data_reg5_dout or
hash_tbl_data_reg6_dout or hash_tbl_data_reg7_dout or
hash_tbl_ecc_log_reg0_dout or hash_tbl_ecc_log_reg1_dout or
hash_tbl_ecc_log_reg2_dout or hash_tbl_ecc_log_reg3_dout or
hash_tbl_ecc_log_reg4_dout or hash_tbl_ecc_log_reg5_dout or
hash_tbl_ecc_log_reg6_dout or hash_tbl_ecc_log_reg7_dout or
fcram_err_test_reg0_dout or fcram_err_test_reg1_dout or fcram_err_test_reg2_dout or
hash_lookup_log_reg0_dout or hash_lookup_log_reg1_dout or
cam_ecc_log_reg_dout or cpu_fio_rd_data or fio_cfg_addr_reg_dout or
fflp_err_intr_mask_reg_dout or debug_training_vector or fio_cal_rd_latency)

begin

pio_addr_err = 1'b0;

casex (pio_addr[19:2]) //synopsys parallel_case full_case
// 0in < case -full -parallel -message "0in ERROR: case check in fflp_pio_if:pio_addr"

18'h00000:	pio_rd_data_tmp = {40'b0, hash_tbl_addr_reg0_dout[23:0]};
18'h00001:	pio_rd_data_tmp = 64'b0;
18'h00800:      pio_rd_data_tmp = {40'b0, hash_tbl_addr_reg1_dout[23:0]};
18'h00801:	pio_rd_data_tmp = 64'b0;
18'h01000:      pio_rd_data_tmp = {40'b0, hash_tbl_addr_reg2_dout[23:0]};
18'h01001:	pio_rd_data_tmp = 64'b0;
18'h01800:      pio_rd_data_tmp = {40'b0, hash_tbl_addr_reg3_dout[23:0]};
18'h01801:	pio_rd_data_tmp = 64'b0;
18'h02000:      pio_rd_data_tmp = {40'b0, hash_tbl_addr_reg4_dout[23:0]};
18'h02001:	pio_rd_data_tmp = 64'b0;
18'h02800:      pio_rd_data_tmp = {40'b0, hash_tbl_addr_reg5_dout[23:0]};
18'h02801:	pio_rd_data_tmp = 64'b0;
18'h03000:      pio_rd_data_tmp = {40'b0, hash_tbl_addr_reg6_dout[23:0]};
18'h03001:	pio_rd_data_tmp = 64'b0;
18'h03800:      pio_rd_data_tmp = {40'b0, hash_tbl_addr_reg7_dout[23:0]};
18'h03801:	pio_rd_data_tmp = 64'b0;

18'h00002, 18'h00802, 18'h01002, 18'h01802, 18'h02002, 18'h02802, 18'h03002, 18'h03802:
                begin
                if (pio_32b_mode)
                        begin
                        case (pio_addr[13:11])
			// 0in < case -full -parallel -message "0in ERROR: case check in fflp_pio_if:pio_addr0"

                        3'h0:   pio_rd_data_tmp = {32'b0, hash_tbl_data_reg0_dout[31:0]};
                        3'h1:   pio_rd_data_tmp = {32'b0, hash_tbl_data_reg1_dout[31:0]};
                        3'h2:   pio_rd_data_tmp = {32'b0, hash_tbl_data_reg2_dout[31:0]};
                        3'h3:   pio_rd_data_tmp = {32'b0, hash_tbl_data_reg3_dout[31:0]};
                        3'h4:   pio_rd_data_tmp = {32'b0, hash_tbl_data_reg4_dout[31:0]};
                        3'h5:   pio_rd_data_tmp = {32'b0, hash_tbl_data_reg5_dout[31:0]};
                        3'h6:   pio_rd_data_tmp = {32'b0, hash_tbl_data_reg6_dout[31:0]};
                        3'h7:   pio_rd_data_tmp = {32'b0, hash_tbl_data_reg7_dout[31:0]};

                        endcase
                        end
                else
                        begin
                        case (pio_addr[15:13])
			// 0in < case -full -parallel -message "0in ERROR: case check in fflp_pio_if:pio_addr1"

                        3'h0:   pio_rd_data_tmp = hash_tbl_data_reg0_dout[63:0];
                        3'h1:   pio_rd_data_tmp = hash_tbl_data_reg1_dout[63:0];
                        3'h2:   pio_rd_data_tmp = hash_tbl_data_reg2_dout[63:0];
                        3'h3:   pio_rd_data_tmp = hash_tbl_data_reg3_dout[63:0];
                        3'h4:   pio_rd_data_tmp = hash_tbl_data_reg4_dout[63:0];
                        3'h5:   pio_rd_data_tmp = hash_tbl_data_reg5_dout[63:0];
                        3'h6:   pio_rd_data_tmp = hash_tbl_data_reg6_dout[63:0];
                        3'h7:   pio_rd_data_tmp = hash_tbl_data_reg7_dout[63:0];

                        endcase
                        end
                end

18'h00003, 18'h00803, 18'h01003, 18'h01803, 18'h02003, 18'h02803, 18'h03003, 18'h03803:
		begin
		if (pio_32b_mode)
			begin
			case (pio_addr[15:13])
			// 0in < case -full -parallel -message "0in ERROR: case check in fflp_pio_if:pio_addr2"

			3'h0:	pio_rd_data_tmp	= {32'b0, hash_tbl_data_reg0_dout[63:32]};
			3'h1:   pio_rd_data_tmp = {32'b0, hash_tbl_data_reg1_dout[63:32]};
			3'h2:   pio_rd_data_tmp = {32'b0, hash_tbl_data_reg2_dout[63:32]};
                        3'h3:   pio_rd_data_tmp = {32'b0, hash_tbl_data_reg3_dout[63:32]};
			3'h4:   pio_rd_data_tmp = {32'b0, hash_tbl_data_reg4_dout[63:32]};
                        3'h5:   pio_rd_data_tmp = {32'b0, hash_tbl_data_reg5_dout[63:32]};
			3'h6:   pio_rd_data_tmp = {32'b0, hash_tbl_data_reg6_dout[63:32]};
                        3'h7:   pio_rd_data_tmp = {32'b0, hash_tbl_data_reg7_dout[63:32]};

			endcase
			end
		else
			begin
			pio_addr_err    = 1'b0;
			pio_rd_data_tmp = 64'b0;
			end
		end

18'h00004:	pio_rd_data_tmp = {32'b0, hash_tbl_ecc_log_reg0_dout[31:0]};
18'h00005:	pio_rd_data_tmp = 64'b0;
18'h00804:	pio_rd_data_tmp = {32'b0, hash_tbl_ecc_log_reg1_dout[31:0]};
18'h00805:	pio_rd_data_tmp = 64'b0;
18'h01004:	pio_rd_data_tmp = {32'b0, hash_tbl_ecc_log_reg2_dout[31:0]};
18'h01005:	pio_rd_data_tmp = 64'b0;
18'h01804:	pio_rd_data_tmp = {32'b0, hash_tbl_ecc_log_reg3_dout[31:0]};
18'h01805:	pio_rd_data_tmp = 64'b0;
18'h02004:      pio_rd_data_tmp = {32'b0, hash_tbl_ecc_log_reg4_dout[31:0]};
18'h02005:	pio_rd_data_tmp = 64'b0;
18'h02804:      pio_rd_data_tmp = {32'b0, hash_tbl_ecc_log_reg5_dout[31:0]};
18'h02805:	pio_rd_data_tmp = 64'b0;
18'h03004:      pio_rd_data_tmp = {32'b0, hash_tbl_ecc_log_reg6_dout[31:0]};
18'h03005:	pio_rd_data_tmp = 64'b0;
18'h03804:      pio_rd_data_tmp = {32'b0, hash_tbl_ecc_log_reg7_dout[31:0]};
18'h03805:	pio_rd_data_tmp = 64'b0;

18'h20xxx, 18'h21xxx:
begin
		if (pio_32b_mode & pio_addr[2])
			pio_rd_data_tmp = 64'b0;
		else
			pio_rd_data_tmp = {46'b0, 
					vlan_tbl_rd_data[17], vlan_tbl_rd_data[8], vlan_tbl_rd_data[16:9], vlan_tbl_rd_data[7:0]};
end

18'h22000:	pio_rd_data_tmp = {32'b0, vlan_parity_err_log_reg_dout[31:0]};
18'h22001:	pio_rd_data_tmp = 64'b0;

18'h28000:	pio_rd_data_tmp	= {47'b0, class2_hdr_byte_value[16:0]};
18'h28001:	pio_rd_data_tmp = 64'b0;
18'h28002: 	pio_rd_data_tmp = {47'b0, class3_hdr_byte_value[16:0]};	
18'h28003:      pio_rd_data_tmp = 64'b0;
18'h28004:      pio_rd_data_tmp = {38'b0, class4_hdr_byte_value[25:0]};
18'h28005:      pio_rd_data_tmp = 64'b0;
18'h28006:      pio_rd_data_tmp = {38'b0, class5_hdr_byte_value[25:0]};
18'h28007:      pio_rd_data_tmp = 64'b0;
18'h28008:      pio_rd_data_tmp = {38'b0, class6_hdr_byte_value[25:0]};
18'h28009:      pio_rd_data_tmp = 64'b0;
18'h2800a:      pio_rd_data_tmp = {38'b0, class7_hdr_byte_value[25:0]};
18'h2800b:      pio_rd_data_tmp = 64'b0;
18'h2800c:	pio_rd_data_tmp	= {60'b0, class_action_reg4_dout[2:1], 1'b0, class_action_reg4_dout[0]};
18'h2800d:      pio_rd_data_tmp = 64'b0;
18'h2800e:	pio_rd_data_tmp	= {60'b0, class_action_reg5_dout[2:1], 1'b0, class_action_reg5_dout[0]};
18'h2800f:      pio_rd_data_tmp = 64'b0;
18'h28010:      pio_rd_data_tmp = {60'b0, class_action_reg6_dout[2:1], 1'b0, class_action_reg6_dout[0]};
18'h28011:      pio_rd_data_tmp = 64'b0;
18'h28012:      pio_rd_data_tmp = {60'b0, class_action_reg7_dout[2:1], 1'b0, class_action_reg7_dout[0]};
18'h28013:      pio_rd_data_tmp = 64'b0;
18'h28014:      pio_rd_data_tmp = {60'b0, class_action_reg8_dout[2:1], 1'b0, class_action_reg8_dout[0]};
18'h28015:      pio_rd_data_tmp = 64'b0;
18'h28016:      pio_rd_data_tmp = {60'b0, class_action_reg9_dout[2:1], 1'b0, class_action_reg9_dout[0]};
18'h28017:      pio_rd_data_tmp = 64'b0;
18'h28018:      pio_rd_data_tmp = {60'b0, class_action_reg10_dout[2:1], 1'b0, class_action_reg10_dout[0]};
18'h28019:      pio_rd_data_tmp = 64'b0;
18'h2801a:      pio_rd_data_tmp = {60'b0, class_action_reg11_dout[2:1], 1'b0, class_action_reg11_dout[0]};
18'h2801b:      pio_rd_data_tmp = 64'b0;
18'h2801c:      pio_rd_data_tmp = {60'b0, class_action_reg12_dout[2:1], 1'b0, class_action_reg12_dout[0]};
18'h2801d:      pio_rd_data_tmp = 64'b0;
18'h2801e:      pio_rd_data_tmp = {60'b0, class_action_reg13_dout[2:1], 1'b0, class_action_reg13_dout[0]};
18'h2801f:      pio_rd_data_tmp = 64'b0;
18'h28020:      pio_rd_data_tmp = {60'b0, class_action_reg14_dout[2:1], 1'b0, class_action_reg14_dout[0]};
18'h28021:      pio_rd_data_tmp = 64'b0;
18'h28022:      pio_rd_data_tmp = {60'b0, class_action_reg15_dout[2:1], 1'b0, class_action_reg15_dout[0]};
18'h28023:      pio_rd_data_tmp = 64'b0;
18'h28024:	pio_rd_data_tmp = {56'b0, cam_key_reg0_dout[7:0]};
18'h28025:      pio_rd_data_tmp = 64'b0;

18'h28026:	begin
		if (pio_32b_mode)
			pio_rd_data_tmp = {32'b0, cam_key_reg1_dout[31:0]};
		else
			pio_rd_data_tmp = cam_key_reg1_dout[63:0];
		end

18'h28027:      begin
                if (pio_32b_mode)
                        pio_rd_data_tmp = {32'b0, cam_key_reg1_dout[63:32]};
                else
			begin
                        pio_addr_err    = 1'b0;
                        pio_rd_data_tmp = 64'b0;
                        end
                end

18'h28028:      begin
                if (pio_32b_mode)
                        pio_rd_data_tmp = {32'b0, cam_key_reg2_dout[31:0]};
                else
                        pio_rd_data_tmp = cam_key_reg2_dout[63:0];
                end

18'h28029:      begin
                if (pio_32b_mode)
                        pio_rd_data_tmp = {32'b0, cam_key_reg2_dout[63:32]};
                else
                        begin
                        pio_addr_err    = 1'b0;
                        pio_rd_data_tmp = 64'b0;
                        end
                end

18'h2802a:      begin
                if (pio_32b_mode)
                        pio_rd_data_tmp = {32'b0, cam_key_reg3_dout[31:0]};
                else
                        pio_rd_data_tmp = cam_key_reg3_dout[63:0];
                end

18'h2802b:      begin
                if (pio_32b_mode)
                        pio_rd_data_tmp = {32'b0, cam_key_reg3_dout[63:32]};
                else
                        begin
                        pio_addr_err    = 1'b0;
                        pio_rd_data_tmp = 64'b0;
                        end
                end

18'h2802c:	pio_rd_data_tmp = {56'b0, cam_key_mask_reg0_dout[7:0]};

18'h2802d:	pio_rd_data_tmp = 64'b0;

18'h2802e:      begin
                if (pio_32b_mode)
                        pio_rd_data_tmp = {32'b0, cam_key_mask_reg1_dout[31:0]};
                else
                        pio_rd_data_tmp = cam_key_mask_reg1_dout[63:0];
                end

18'h2802f:      begin
                if (pio_32b_mode)
                        pio_rd_data_tmp = {32'b0, cam_key_mask_reg1_dout[63:32]};
                else
                        begin
                        pio_addr_err    = 1'b0;
                        pio_rd_data_tmp = 64'b0;
                        end
                end

18'h28030:      begin
                if (pio_32b_mode)
                        pio_rd_data_tmp = {32'b0, cam_key_mask_reg2_dout[31:0]};
                else
                        pio_rd_data_tmp = cam_key_mask_reg2_dout[63:0];
                end

18'h28031:      begin
                if (pio_32b_mode)
                        pio_rd_data_tmp = {32'b0, cam_key_mask_reg2_dout[63:32]};
                else
                        begin
                        pio_addr_err    = 1'b0;
                        pio_rd_data_tmp = 64'b0;
                        end
                end

18'h28032:      begin
                if (pio_32b_mode)
                        pio_rd_data_tmp = {32'b0, cam_key_mask_reg3_dout[31:0]};
                else
                        pio_rd_data_tmp = cam_key_mask_reg3_dout[63:0];
                end

18'h28033:      begin
                if (pio_32b_mode)
                        pio_rd_data_tmp = {32'b0, cam_key_mask_reg3_dout[63:32]};
                else
                        begin
                        pio_addr_err    = 1'b0;
                        pio_rd_data_tmp = 64'b0;
                        end
                end

18'h28034:      pio_rd_data_tmp = {43'b0, cam_cmd_stat_reg_dout[20:0]};
18'h28035:	pio_rd_data_tmp = 64'b0;
18'h28036:	pio_rd_data_tmp = {32'b0, cam_ecc_log_reg_dout[26:24], 5'b0, cam_ecc_log_reg_dout[23:0]};
18'h28037:	pio_rd_data_tmp = 64'b0;
18'h28038:	pio_rd_data_tmp = {60'b0, hash_lookup_log_reg0_dout[3:0]};
18'h28039:	pio_rd_data_tmp = 64'b0;
18'h2803a:	pio_rd_data_tmp = {33'b0, hash_lookup_log_reg1_dout[30:0]}; 
18'h2803b:	pio_rd_data_tmp = 64'b0;

18'h28040:      pio_rd_data_tmp = {37'b0, fflp_config_reg_dout[26:0]};
18'h28041:	pio_rd_data_tmp = 64'b0;
18'h28042:      pio_rd_data_tmp = {52'b0, hdr_ctrl_bit_mask_reg_dout[11:0]};
18'h28043:      pio_rd_data_tmp = 64'b0;
18'h28044:	pio_rd_data_tmp = {32'b0, fcram_refresh_timer_reg_dout};
18'h28045:      pio_rd_data_tmp = 64'b0;
18'h28046:	pio_rd_data_tmp = {56'b0, fio_cfg_addr_reg_dout[7:0]};
18'h28047:      pio_rd_data_tmp = 64'b0;
18'h28048:	pio_rd_data_tmp = {32'b0, cpu_fio_rd_data[31:0]};
18'h28049:      pio_rd_data_tmp = 64'b0;
18'h2804a:	pio_rd_data_tmp = {56'b0, fcram_err_test_reg0_dout[7:0]};
18'h2804b:      pio_rd_data_tmp = 64'b0;
18'h2804c:	pio_rd_data_tmp = {32'b0, fcram_err_test_reg1_dout[31:0]};
18'h2804d:      pio_rd_data_tmp = 64'b0;
18'h2804e:	pio_rd_data_tmp = {32'b0, fcram_err_test_reg2_dout[31:0]};
18'h2804f:      pio_rd_data_tmp = 64'b0;

18'h28050:	pio_rd_data_tmp = {32'b0, 21'b0, fflp_err_intr_mask_reg_dout[10:0]};
18'h28051:      pio_rd_data_tmp = 64'b0;
18'h28052:	pio_rd_data_tmp = {32'b0, debug_training_vector[31:0]};
18'h28053:      pio_rd_data_tmp = 64'b0;

18'h28054:	pio_rd_data_tmp = {56'b0, fio_cal_rd_latency[7:0]};
18'h28055:	pio_rd_data_tmp = 64'b0;

18'h30000:      pio_rd_data_tmp = {54'b0, f_key_class_action_reg4_dout[9:0]};
18'h30001:	pio_rd_data_tmp = 64'b0;
18'h30002:      pio_rd_data_tmp = {54'b0, f_key_class_action_reg5_dout[9:0]};
18'h30003:      pio_rd_data_tmp = 64'b0;
18'h30004:      pio_rd_data_tmp = {54'b0, f_key_class_action_reg6_dout[9:0]};
18'h30005:      pio_rd_data_tmp = 64'b0;
18'h30006:      pio_rd_data_tmp = {54'b0, f_key_class_action_reg7_dout[9:0]};
18'h30007:      pio_rd_data_tmp = 64'b0;
18'h30008:      pio_rd_data_tmp = {54'b0, f_key_class_action_reg8_dout[9:0]};
18'h30009:      pio_rd_data_tmp = 64'b0;
18'h3000a:      pio_rd_data_tmp = {54'b0, f_key_class_action_reg9_dout[9:0]};
18'h3000b:      pio_rd_data_tmp = 64'b0;
18'h3000c:      pio_rd_data_tmp = {54'b0, f_key_class_action_reg10_dout[9:0]};
18'h3000d:      pio_rd_data_tmp = 64'b0;
18'h3000e:      pio_rd_data_tmp = {54'b0, f_key_class_action_reg11_dout[9:0]};
18'h3000f:      pio_rd_data_tmp = 64'b0;
18'h30010:      pio_rd_data_tmp = {54'b0, f_key_class_action_reg12_dout[9:0]};
18'h30011:      pio_rd_data_tmp = 64'b0;
18'h30012:      pio_rd_data_tmp = {54'b0, f_key_class_action_reg13_dout[9:0]};
18'h30013:      pio_rd_data_tmp = 64'b0;
18'h30014:      pio_rd_data_tmp = {54'b0, f_key_class_action_reg14_dout[9:0]};
18'h30015:      pio_rd_data_tmp = 64'b0;
18'h30016:      pio_rd_data_tmp = {54'b0, f_key_class_action_reg15_dout[9:0]};
18'h30017:      pio_rd_data_tmp = 64'b0;
18'h30018:	pio_rd_data_tmp = {32'b0, h1_init_value_reg_dout[31:0]};
18'h30019:      pio_rd_data_tmp = 64'b0;
18'h3001a:	pio_rd_data_tmp = {48'b0, h2_init_value_reg_dout[15:0]};
18'h3001b:      pio_rd_data_tmp = 64'b0;
18'h3001c:	pio_rd_data_tmp = {47'b0, flow_part_sel_reg0_dout[10], 3'b0, flow_part_sel_reg0_dout[9:5], 3'b0, flow_part_sel_reg0_dout[4:0]};
18'h3001d:      pio_rd_data_tmp = 64'b0;
18'h3001e:	pio_rd_data_tmp = {47'b0, flow_part_sel_reg1_dout[10], 3'b0, flow_part_sel_reg1_dout[9:5], 3'b0, flow_part_sel_reg1_dout[4:0]};
18'h3001f:      pio_rd_data_tmp = 64'b0;
18'h30020:	pio_rd_data_tmp = {47'b0, flow_part_sel_reg2_dout[10], 3'b0, flow_part_sel_reg2_dout[9:5], 3'b0, flow_part_sel_reg2_dout[4:0]};
18'h30021:      pio_rd_data_tmp = 64'b0;
18'h30022:	pio_rd_data_tmp = {47'b0, flow_part_sel_reg3_dout[10], 3'b0, flow_part_sel_reg3_dout[9:5], 3'b0, flow_part_sel_reg3_dout[4:0]};
18'h30023:      pio_rd_data_tmp = 64'b0;
18'h30024:	pio_rd_data_tmp = {47'b0, flow_part_sel_reg4_dout[10], 3'b0, flow_part_sel_reg4_dout[9:5], 3'b0, flow_part_sel_reg4_dout[4:0]};
18'h30025:      pio_rd_data_tmp = 64'b0;
18'h30026:	pio_rd_data_tmp = {47'b0, flow_part_sel_reg5_dout[10], 3'b0, flow_part_sel_reg5_dout[9:5], 3'b0, flow_part_sel_reg5_dout[4:0]};
18'h30027:      pio_rd_data_tmp = 64'b0;
18'h30028:	pio_rd_data_tmp = {47'b0, flow_part_sel_reg6_dout[10], 3'b0, flow_part_sel_reg6_dout[9:5], 3'b0, flow_part_sel_reg6_dout[4:0]};
18'h30029:      pio_rd_data_tmp = 64'b0;
18'h3002a:	pio_rd_data_tmp = {47'b0, flow_part_sel_reg7_dout[10], 3'b0, flow_part_sel_reg7_dout[9:5], 3'b0, flow_part_sel_reg7_dout[4:0]};
18'h3002b:      pio_rd_data_tmp = 64'b0;

default:	begin
		pio_rd_data_tmp	= 64'hdeadbeefdeadbeef;
		pio_addr_err	= 1'b1;
		end
endcase

end


endmodule
