// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp.v
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
/*module name:   fflp                                                 */
/*description:   Receive classification                               */
/*                                                                    */
/*parent module in:  top                                              */
/*child modules in:  none                                             */
/*interface modules:                                                  */
/*author name:       Jeanne Cai                                       */
/*date created:      03-22-2004                                       */
/*                                                                    */
/*              Copyright (c) 2004, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/*modifications:                                                      */
/**********************************************************************/

//`include "fflp.h"

module fflp
		(
		cclk,
                reset_l,
//ipp if
                ipp_fflp_dvalid,
                ipp_fflp_data,
                ipp_fflp_mac_default,
                ipp_fflp_mac_port,

		fflp_ipp_ready,
                fflp_ipp_dvalid,
                fflp_ipp_data,
//cam if
		cam_hit,
		cam_valid,
                cam_haddr,
		pio_rd_vld,
                cam_msk_dat_out,

		cam_data_inp,
                cam_compare,
                cam_pio_wr,
                cam_pio_rd,
                cam_pio_sel,
		cam_index,
//ram if
		am_din,

		am_rd,
                am_wr,
                am_addr,
                am_dout,
//zcp if
                fflp_zcp_wr,
                fflp_zcp_data,
//pio if
		pio_fflp_wdata,
		pio_fflp_rd,
		pio_fflp_sel,
		pio_fflp_addr,

`ifdef NEPTUNE
		pio_client_32b,
`endif

		fflp_pio_rdata,
		fflp_pio_ack,
		fflp_pio_err,
		fflp_pio_intr,
//vlan table
		vlan_tbl_rd_din,
		vlan_tbl_cs,
		vlan_tbl_wr,
		vlan_tbl_addr,
		vlan_tbl_wr_dout,

//fcram if
`ifdef NEPTUNE
		fcram_clk,
		fcram_fflp_mstrready,
		fcram_fflp_fatal_err,
		fcram_fflp_data_ready,
		fcram_fflp_even_din,
		fcram_fflp_odd_din,
		fcram_fflp_cfg_datrd,
		fcram_fflp_cfg_done,
		fcram_fflp_cfg_err,

		fflp_fcram_cfg_rst,	
		fflp_fcram_cfg_sel,
		fflp_fcram_cfg_rd,
		fflp_fcram_cfg_addr,
		fflp_fcram_cfg_datwr,
		fflp_fcram_slv_update,
		fflp_fcram_rd_en,
		fflp_fcram_cs_l,
		fflp_fcram_fn,
		fflp_fcram_pd_l,
		fflp_fcram_ba0,
		fflp_fcram_ba1,
		fflp_fcram_addr,
		fflp_fcram_ds,
		fflp_fcram_triz_en_l,
		fflp_fcram_even_dout,
		fflp_fcram_odd_dout,
`endif

		fflp_debug_port

		);

input		cclk;
input		reset_l;

input		ipp_fflp_dvalid;
input[127:0]	ipp_fflp_data;
input[11:0]	ipp_fflp_mac_default;
input[1:0]	ipp_fflp_mac_port;
output		fflp_ipp_ready;
output[3:0]	fflp_ipp_dvalid;
output[15:0]	fflp_ipp_data;

input		cam_hit;
input		cam_valid;
input[9:0]	cam_haddr;
input		pio_rd_vld;
input[199:0]	cam_msk_dat_out;
output[199:0]	cam_data_inp;
output		cam_compare;
output		cam_pio_wr;
output		cam_pio_rd;
output		cam_pio_sel;
output[9:0]	cam_index;

input[41:0]	am_din;
output		am_rd;
output		am_wr;
output[9:0]	am_addr;
output[41:0]	am_dout;

output[4:0]	fflp_zcp_wr;
output[215:0]	fflp_zcp_data;

input[63:0]     pio_fflp_wdata;
input           pio_fflp_rd;
input           pio_fflp_sel;
input[19:0]     pio_fflp_addr;

`ifdef NEPTUNE
input		pio_client_32b;
`endif

output[63:0]    fflp_pio_rdata;
output          fflp_pio_ack;
output          fflp_pio_err;
output		fflp_pio_intr;

input[17:0]	vlan_tbl_rd_din;
output		vlan_tbl_cs;
output		vlan_tbl_wr;
output[11:0]	vlan_tbl_addr;
output[17:0]	vlan_tbl_wr_dout;

`ifdef NEPTUNE
input		fcram_clk;
input		fcram_fflp_mstrready;
input		fcram_fflp_fatal_err;
input[3:0]	fcram_fflp_data_ready;
input[35:0]	fcram_fflp_even_din;
input[35:0]	fcram_fflp_odd_din;
input[15:0]	fcram_fflp_cfg_datrd;
input		fcram_fflp_cfg_done;
input		fcram_fflp_cfg_err;

output          fflp_fcram_cfg_rst;
output          fflp_fcram_cfg_sel;
output          fflp_fcram_cfg_rd;
output[7:0]     fflp_fcram_cfg_addr;
output[15:0]    fflp_fcram_cfg_datwr;
output		fflp_fcram_slv_update;
output[1:0]	fflp_fcram_rd_en;
output		fflp_fcram_cs_l;
output		fflp_fcram_fn;
output		fflp_fcram_pd_l;
output		fflp_fcram_ba0;
output		fflp_fcram_ba1;
output[14:0]	fflp_fcram_addr;
output[1:0]	fflp_fcram_ds;
output[1:0]	fflp_fcram_triz_en_l;
output[35:0]	fflp_fcram_even_dout;
output[35:0]	fflp_fcram_odd_dout;
`endif

output[31:0]	fflp_debug_port;

`ifdef NEPTUNE
`else

wire            pio_client_32b          = 1'b0;
wire            fcram_clk               = cclk;
wire            fcram_fflp_mstrready    = 1'b0;
wire		fcram_fflp_fatal_err	= 1'b0;
wire[3:0]       fcram_fflp_data_ready   = 4'b0;
wire[35:0]      fcram_fflp_even_din     = 36'b0;
wire[35:0]      fcram_fflp_odd_din      = 36'b0;
wire[15:0]      fcram_fflp_cfg_datrd    = 16'b0;
wire            fcram_fflp_cfg_done     = 1'b0;
wire		fcram_fflp_cfg_err	= 1'b0;

`endif


wire            ipp_fflp_dvalid;
wire[127:0]     ipp_fflp_data;
wire[11:0]      ipp_fflp_mac_default;
wire[1:0]       ipp_fflp_mac_port;
wire            fflp_ipp_ready;
wire[3:0]       fflp_ipp_dvalid;
wire[15:0]      fflp_ipp_data;

wire            cam_hit;
wire		cam_valid;
wire[9:0]       cam_haddr;
wire		pio_rd_vld;
wire[199:0]     cam_msk_dat_out;
wire[199:0]     cam_data_inp;
wire            cam_compare;
wire            cam_pio_wr;
wire            cam_pio_rd;
wire            cam_pio_sel;
wire[9:0]	cam_index;

wire[41:0]      am_din;
wire            am_rd;
wire            am_wr;
wire[9:0]       am_addr;
wire[41:0]      am_dout;

wire[4:0]       fflp_zcp_wr;
wire[215:0]     fflp_zcp_data;

wire[63:0]      pio_fflp_wdata;
wire            pio_fflp_rd;
wire            pio_fflp_sel;
wire[19:0]      pio_fflp_addr;
wire[63:0]      fflp_pio_rdata;
wire            fflp_pio_ack;
wire            fflp_pio_err;
wire		fflp_pio_intr;

wire		snap_en;
wire		disable_chksum;
wire		pio_disable_cam;
wire[16:0]      class2_hdr_byte_value;
wire[16:0]      class3_hdr_byte_value;
wire[25:0]      class4_hdr_byte_value;
wire[25:0]      class5_hdr_byte_value;
wire[25:0]      class6_hdr_byte_value;
wire[25:0]      class7_hdr_byte_value;
wire[2:0]       class_action_reg4_dout;
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
wire[11:0]      hdr_ctrl_bit_mask_reg_dout;
wire		fflp_config_reg_wen_pulse;
wire[31:0]	debug_training_vector;
wire[2:0]	pio_debug_data_sel;

wire            fwd_sched;
wire            fwd_req;
wire[199:0]     key_bus;
wire[445:0]     fwd_info_bus;

wire		fc_fifo_empty;
wire[512:0]	fc_fifo_dout;
wire		fc_fifo_ren_sync;

wire		fflp_init_done;
wire[3:0]	fcram_driver_imp_ctrl;
wire		fcram_qs_mode;
wire[3:0]	fcram_lookup_ratio;
wire[1:0]	pio_fio_latency;
wire[3:0]	cam_srch_latency;
wire[3:0]	cam_srch_ratio;
wire		pio_wen;
wire[19:0]      pio_addr;
wire		pio_32b_mode;
wire[63:0]      pio_wr_data;
wire[7:0]       cam_key_reg0_dout;
wire[63:0]      cam_key_reg1_dout;
wire[63:0]      cam_key_reg2_dout;
wire[63:0]      cam_key_reg3_dout;
wire[7:0]       cam_key_mask_reg0_dout;
wire[63:0]      cam_key_mask_reg1_dout;
wire[63:0]      cam_key_mask_reg2_dout;
wire[63:0]      cam_key_mask_reg3_dout;
wire[20:0]      cam_cmd_stat_reg_dout;
wire[25:0]	ecc_parity_status;

wire[31:0]	h1_init_value_reg_dout;
wire[15:0]	h2_init_value_reg_dout;
wire[31:0]	fcram_refresh_timer_reg_dout;

wire		cpu_vlan_req; 
wire		cpu_vlan_rd;
wire		cpu_vlan_wr;
wire[11:0]	cpu_vlan_addr;
wire[17:0]	vlan_tbl_wr_dout;

wire[17:0]	vlan_tbl_rd_din;
wire            vlan_tbl_cs;
wire            vlan_tbl_wr;
wire[11:0]      vlan_tbl_addr;
wire[17:0]      vlan_tbl_din_reg_dout;
wire		vlan_parity_err_log_en;
wire[11:0]	vlan_tag_id;
wire            cpu_vlan_gnt_3;

wire[10:0]      flow_part_sel_reg0_dout;
wire[10:0]      flow_part_sel_reg1_dout;
wire[10:0]      flow_part_sel_reg2_dout;
wire[10:0]      flow_part_sel_reg3_dout;
wire[10:0]      flow_part_sel_reg4_dout;
wire[10:0]      flow_part_sel_reg5_dout;
wire[10:0]      flow_part_sel_reg6_dout;
wire[10:0]      flow_part_sel_reg7_dout;
wire[23:0]      hash_tbl_addr_reg0_dout;
wire[23:0]      hash_tbl_addr_reg1_dout;
wire[23:0]      hash_tbl_addr_reg2_dout;
wire[23:0]      hash_tbl_addr_reg3_dout;
wire[23:0]      hash_tbl_addr_reg4_dout;
wire[23:0]      hash_tbl_addr_reg5_dout;
wire[23:0]      hash_tbl_addr_reg6_dout;
wire[23:0]      hash_tbl_addr_reg7_dout;
wire[63:0]      hash_tbl_data_reg0_dout;
wire[63:0]      hash_tbl_data_reg1_dout;
wire[63:0]      hash_tbl_data_reg2_dout;
wire[63:0]      hash_tbl_data_reg3_dout;
wire[63:0]      hash_tbl_data_reg4_dout;
wire[63:0]      hash_tbl_data_reg5_dout;
wire[63:0]      hash_tbl_data_reg6_dout;
wire[63:0]      hash_tbl_data_reg7_dout;
wire[71:0]	fcram_err_test_reg_dout;
wire            cpu_req_part0_sel;
wire            cpu_req_part1_sel;
wire            cpu_req_part2_sel;
wire            cpu_req_part3_sel;
wire            cpu_req_part4_sel;
wire            cpu_req_part5_sel;
wire            cpu_req_part6_sel;
wire            cpu_req_part7_sel;
wire            pio_rd;
wire            cpu_fcram_req;
wire		cpu_fio_req;
wire		pio_fio_cfg_reset;
wire[7:0]	fio_cfg_addr_reg_dout;

wire[7:0]       ext_fc_valid = {flow_part_sel_reg7_dout[10],
                                flow_part_sel_reg6_dout[10],
                                flow_part_sel_reg5_dout[10],
                                flow_part_sel_reg4_dout[10],
                                flow_part_sel_reg3_dout[10],
                                flow_part_sel_reg2_dout[10],
                                flow_part_sel_reg1_dout[10],
                                flow_part_sel_reg0_dout[10]};


wire            fflp_fcram_cfg_rst;
wire            fflp_fcram_cfg_sel;
wire            fflp_fcram_cfg_rd;
wire[7:0]       fflp_fcram_cfg_addr;
wire[15:0]      fflp_fcram_cfg_datwr;
wire		fflp_fcram_slv_update;
wire[1:0]	fflp_fcram_rd_en;
wire		fflp_fcram_cs_l;
wire		fflp_fcram_fn;
wire		fflp_fcram_pd_l;
wire		fflp_fcram_ba0;
wire		fflp_fcram_ba1;
wire[14:0]	fflp_fcram_addr;
wire[1:0]	fflp_fcram_ds;
wire[1:0]	fflp_fcram_triz_en_l;
wire[35:0]	fflp_fcram_even_dout;
wire[35:0]	fflp_fcram_odd_dout;
wire		cpu_fc_req_done;
wire[71:0]	fc_rd_data_reg_dout;
wire		fc_rd_ecc_err;
wire            cpu_fio_req_done;
wire[31:0]      cpu_fio_rd_data;
wire[7:0]	fio_cal_rd_latency;
wire[33:0]	fc_err_status;
wire		fc_fifo_ren;
wire		zcp_wr;

wire		fflp_zcp_wr_p;
wire		cpu_fc_req_done_sync;
wire		cpu_fio_req_done_sync;

wire		cpu_fcram_req_sync;
wire		cpu_fio_req_sync;
wire		fc_fifo_empty_sync;
wire		fflp_config_reg_wen_pulse_sync;

wire		reset_s;
wire		reset_sync;

wire[31:0]	fflp_debug_port;


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
                             .rst        ({reset_s,reset_s,reset_s,reset_s}),
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


fflp_hdr	fflp_hdr_inst ( 
                                .cclk                           (cclk),
                                .reset                          (reset_s),
				.ipp_fflp_dvalid		(ipp_fflp_dvalid),
                                .ipp_fflp_data                  (ipp_fflp_data),
                                .ipp_fflp_mac_default           (ipp_fflp_mac_default),
                                .ipp_fflp_mac_port              (ipp_fflp_mac_port),
                                .snap_en                        (snap_en),
				.disable_chksum			(disable_chksum),
                                .class2_hdr_byte_value          (class2_hdr_byte_value),
                                .class3_hdr_byte_value          (class3_hdr_byte_value),
                                .class4_hdr_byte_value          (class4_hdr_byte_value),
                                .class5_hdr_byte_value          (class5_hdr_byte_value),
                                .class6_hdr_byte_value          (class6_hdr_byte_value),
                                .class7_hdr_byte_value          (class7_hdr_byte_value),
                                .class_action_reg4_dout         (class_action_reg4_dout),
                                .class_action_reg5_dout         (class_action_reg5_dout),
                                .class_action_reg6_dout         (class_action_reg6_dout),
                                .class_action_reg7_dout         (class_action_reg7_dout),
                                .class_action_reg8_dout         (class_action_reg8_dout),
                                .class_action_reg9_dout         (class_action_reg9_dout),
                                .class_action_reg10_dout        (class_action_reg10_dout),
                                .class_action_reg11_dout        (class_action_reg11_dout),
                                .class_action_reg12_dout        (class_action_reg12_dout),
                                .class_action_reg13_dout        (class_action_reg13_dout),
                                .class_action_reg14_dout        (class_action_reg14_dout),
                                .class_action_reg15_dout        (class_action_reg15_dout),
                                .f_key_class_action_reg4_dout   (f_key_class_action_reg4_dout),
                                .f_key_class_action_reg5_dout   (f_key_class_action_reg5_dout),
                                .f_key_class_action_reg6_dout   (f_key_class_action_reg6_dout),
                                .f_key_class_action_reg7_dout   (f_key_class_action_reg7_dout),
                                .f_key_class_action_reg8_dout   (f_key_class_action_reg8_dout),
                                .f_key_class_action_reg9_dout   (f_key_class_action_reg9_dout),
                                .f_key_class_action_reg10_dout  (f_key_class_action_reg10_dout),
                                .f_key_class_action_reg11_dout  (f_key_class_action_reg11_dout),
                                .f_key_class_action_reg12_dout  (f_key_class_action_reg12_dout),
                                .f_key_class_action_reg13_dout  (f_key_class_action_reg13_dout),
                                .f_key_class_action_reg14_dout  (f_key_class_action_reg14_dout),
                                .f_key_class_action_reg15_dout  (f_key_class_action_reg15_dout),
                                .hdr_ctrl_bit_mask_reg_dout     (hdr_ctrl_bit_mask_reg_dout),
                                .cpu_vlan_req                   (cpu_vlan_req),
                                .cpu_vlan_rd                    (cpu_vlan_rd),
                                .cpu_vlan_wr                    (cpu_vlan_wr),
                                .cpu_vlan_addr                  (cpu_vlan_addr),
                                .vlan_tbl_rd_din                (vlan_tbl_rd_din),
				.fwd_sched			(fwd_sched),

				.fflp_ipp_ready			(fflp_ipp_ready),
				.fflp_ipp_dvalid		(fflp_ipp_dvalid),
				.fflp_ipp_data			(fflp_ipp_data),
				.fwd_req			(fwd_req),
				.key_bus			(key_bus),
				.fwd_info_bus			(fwd_info_bus),
                                .vlan_tbl_cs                    (vlan_tbl_cs),
                                .vlan_tbl_wr                    (vlan_tbl_wr),
                                .vlan_tbl_addr                  (vlan_tbl_addr),
                                .vlan_tbl_din_reg_dout          (vlan_tbl_din_reg_dout),
				.vlan_parity_err_log_en		(vlan_parity_err_log_en),
				.vlan_tag_id			(vlan_tag_id),
                                .cpu_vlan_gnt_3                 (cpu_vlan_gnt_3)

				);


fflp_cam_ram	fflp_cam_ram_inst (
				.cclk                           (cclk),
                                .reset                          (reset_s),
				.pio_disable_cam		(pio_disable_cam),
				.disable_chksum			(disable_chksum),
				.cam_srch_latency		(cam_srch_latency),
				.h1_init_value_reg_dout		(h1_init_value_reg_dout),
				.h2_init_value_reg_dout		(h2_init_value_reg_dout),
				.cam_srch_ratio			(cam_srch_ratio),
				.fwd_req			(fwd_req),
				.key_bus			(key_bus),
				.fwd_info_bus			(fwd_info_bus),
				.cam_hit			(cam_hit),
				.cam_valid			(cam_valid),
				.cam_haddr			(cam_haddr),
				.pio_rd_vld			(pio_rd_vld),
				.cam_msk_dat_out		(cam_msk_dat_out),
				.pio_wen			(pio_wen),
				.pio_addr			(pio_addr),
				.pio_32b_mode			(pio_32b_mode),
				.pio_wr_data			(pio_wr_data),
				.am_din				(am_din),
				.fc_fifo_ren_sync		(fc_fifo_ren_sync),
				.ext_fc_valid			(ext_fc_valid),

				.fwd_sched			(fwd_sched),
				.cam_data_inp           	(cam_data_inp),
                                .cam_compare            	(cam_compare),
                                .cam_pio_wr             	(cam_pio_wr),
                                .cam_pio_rd             	(cam_pio_rd),
                                .cam_pio_sel            	(cam_pio_sel),
				.cam_index			(cam_index),
				.cam_key_reg0_dout      	(cam_key_reg0_dout),
                                .cam_key_reg1_dout      	(cam_key_reg1_dout),
				.cam_key_reg2_dout		(cam_key_reg2_dout),
				.cam_key_reg3_dout		(cam_key_reg3_dout),
                                .cam_key_mask_reg0_dout 	(cam_key_mask_reg0_dout),
                                .cam_key_mask_reg1_dout 	(cam_key_mask_reg1_dout),
				.cam_key_mask_reg2_dout		(cam_key_mask_reg2_dout),
				.cam_key_mask_reg3_dout		(cam_key_mask_reg3_dout),
                                .cam_cmd_stat_reg_dout  	(cam_cmd_stat_reg_dout),
				.am_rd                  	(am_rd),
                                .am_wr                  	(am_wr),
                                .am_addr                	(am_addr),
                                .am_dout                	(am_dout),
				.ecc_parity_status		(ecc_parity_status),
				.fc_fifo_empty            	(fc_fifo_empty),
                                .fc_fifo_dout          		(fc_fifo_dout)

				);


fflp_pio_if	fflp_pio_if_inst (
				.cclk                           (cclk),
                                .reset_l                        (reset_l),
				.pio_fflp_wdata		        (pio_fflp_wdata),
				.pio_fflp_rd		        (pio_fflp_rd),
				.pio_fflp_sel		        (pio_fflp_sel),
				.pio_fflp_addr	                (pio_fflp_addr),
				.pio_client_32b			(pio_client_32b),
				.cam_key_reg0_dout              (cam_key_reg0_dout),
                                .cam_key_reg1_dout              (cam_key_reg1_dout),
				.cam_key_reg2_dout              (cam_key_reg2_dout),
                                .cam_key_reg3_dout              (cam_key_reg3_dout),
                                .cam_key_mask_reg0_dout         (cam_key_mask_reg0_dout),
                                .cam_key_mask_reg1_dout         (cam_key_mask_reg1_dout),
				.cam_key_mask_reg2_dout         (cam_key_mask_reg2_dout),
                                .cam_key_mask_reg3_dout         (cam_key_mask_reg3_dout),
                                .cam_cmd_stat_reg_dout          (cam_cmd_stat_reg_dout),
				.vlan_tbl_din_reg_dout          (vlan_tbl_din_reg_dout),
				.vlan_parity_err_log_en		(vlan_parity_err_log_en),
				.vlan_tag_id			(vlan_tag_id),
                                .cpu_vlan_gnt_3                 (cpu_vlan_gnt_3),
				.cpu_fc_req_done_sync		(cpu_fc_req_done_sync),
				.fc_rd_data_reg_dout		(fc_rd_data_reg_dout),
				.fc_rd_ecc_err			(fc_rd_ecc_err),
				.fflp_zcp_wr_p			(fflp_zcp_wr_p),
				.fc_err_status			(fc_err_status),
				.ecc_parity_status		(ecc_parity_status),
				.cpu_fio_req_done_sync		(cpu_fio_req_done_sync),
				.cpu_fio_rd_data		(cpu_fio_rd_data),
				.fio_cal_rd_latency		(fio_cal_rd_latency),

				.reset_s			(reset_s),
				.pio_wen                        (pio_wen),
                                .pio_addr                       (pio_addr),
				.pio_32b_mode			(pio_32b_mode),
                                .pio_wr_data                    (pio_wr_data),
				.fflp_pio_rdata			(fflp_pio_rdata),
				.fflp_pio_ack			(fflp_pio_ack),
				.fflp_pio_err			(fflp_pio_err),
				.fflp_pio_intr			(fflp_pio_intr),
				.snap_en			(snap_en),
				.disable_chksum			(disable_chksum),
				.pio_disable_cam		(pio_disable_cam),
				.fflp_init_done			(fflp_init_done),
				.fcram_driver_imp_ctrl		(fcram_driver_imp_ctrl),
				.fcram_qs_mode			(fcram_qs_mode),
				.fcram_lookup_ratio		(fcram_lookup_ratio),
				.pio_fio_latency		(pio_fio_latency),
				.cam_srch_latency               (cam_srch_latency),
                                .cam_srch_ratio                 (cam_srch_ratio),
				.h1_init_value_reg_dout		(h1_init_value_reg_dout),
				.h2_init_value_reg_dout		(h2_init_value_reg_dout),
				.fcram_refresh_timer_reg_dout	(fcram_refresh_timer_reg_dout),
				.class2_hdr_byte_value          (class2_hdr_byte_value),
                                .class3_hdr_byte_value          (class3_hdr_byte_value),
                                .class4_hdr_byte_value          (class4_hdr_byte_value),
                                .class5_hdr_byte_value          (class5_hdr_byte_value),
                                .class6_hdr_byte_value          (class6_hdr_byte_value),
                                .class7_hdr_byte_value          (class7_hdr_byte_value),
                                .class_action_reg4_dout         (class_action_reg4_dout),
                                .class_action_reg5_dout         (class_action_reg5_dout),
                                .class_action_reg6_dout         (class_action_reg6_dout),
                                .class_action_reg7_dout         (class_action_reg7_dout),
                                .class_action_reg8_dout         (class_action_reg8_dout),
                                .class_action_reg9_dout         (class_action_reg9_dout),
                                .class_action_reg10_dout        (class_action_reg10_dout),
                                .class_action_reg11_dout        (class_action_reg11_dout),
                                .class_action_reg12_dout        (class_action_reg12_dout),
                                .class_action_reg13_dout        (class_action_reg13_dout),
                                .class_action_reg14_dout        (class_action_reg14_dout),
                                .class_action_reg15_dout        (class_action_reg15_dout),
                                .f_key_class_action_reg4_dout   (f_key_class_action_reg4_dout),
                                .f_key_class_action_reg5_dout   (f_key_class_action_reg5_dout),
                                .f_key_class_action_reg6_dout   (f_key_class_action_reg6_dout),
                                .f_key_class_action_reg7_dout   (f_key_class_action_reg7_dout),
                                .f_key_class_action_reg8_dout   (f_key_class_action_reg8_dout),
                                .f_key_class_action_reg9_dout   (f_key_class_action_reg9_dout),
                                .f_key_class_action_reg10_dout  (f_key_class_action_reg10_dout),
                                .f_key_class_action_reg11_dout  (f_key_class_action_reg11_dout),
                                .f_key_class_action_reg12_dout  (f_key_class_action_reg12_dout),
                                .f_key_class_action_reg13_dout  (f_key_class_action_reg13_dout),
                                .f_key_class_action_reg14_dout  (f_key_class_action_reg14_dout),
                                .f_key_class_action_reg15_dout  (f_key_class_action_reg15_dout),
                                .hdr_ctrl_bit_mask_reg_dout     (hdr_ctrl_bit_mask_reg_dout),
				.cpu_vlan_req                   (cpu_vlan_req),
                                .cpu_vlan_rd                    (cpu_vlan_rd),
                                .cpu_vlan_wr                    (cpu_vlan_wr),
                                .cpu_vlan_addr                  (cpu_vlan_addr),
				.vlan_tbl_wr_dout		(vlan_tbl_wr_dout),
				.flow_part_sel_reg0_dout	(flow_part_sel_reg0_dout),
				.flow_part_sel_reg1_dout        (flow_part_sel_reg1_dout),
				.flow_part_sel_reg2_dout        (flow_part_sel_reg2_dout),
				.flow_part_sel_reg3_dout        (flow_part_sel_reg3_dout),
				.flow_part_sel_reg4_dout        (flow_part_sel_reg4_dout),
				.flow_part_sel_reg5_dout        (flow_part_sel_reg5_dout),
				.flow_part_sel_reg6_dout        (flow_part_sel_reg6_dout),
				.flow_part_sel_reg7_dout        (flow_part_sel_reg7_dout),
				.hash_tbl_addr_reg0_dout	(hash_tbl_addr_reg0_dout),
				.hash_tbl_addr_reg1_dout        (hash_tbl_addr_reg1_dout),
				.hash_tbl_addr_reg2_dout        (hash_tbl_addr_reg2_dout),
				.hash_tbl_addr_reg3_dout        (hash_tbl_addr_reg3_dout),
				.hash_tbl_addr_reg4_dout        (hash_tbl_addr_reg4_dout),
				.hash_tbl_addr_reg5_dout        (hash_tbl_addr_reg5_dout),
				.hash_tbl_addr_reg6_dout        (hash_tbl_addr_reg6_dout),
				.hash_tbl_addr_reg7_dout        (hash_tbl_addr_reg7_dout),
				.hash_tbl_data_reg0_dout        (hash_tbl_data_reg0_dout),
                                .hash_tbl_data_reg1_dout        (hash_tbl_data_reg1_dout),
                                .hash_tbl_data_reg2_dout        (hash_tbl_data_reg2_dout),
                                .hash_tbl_data_reg3_dout        (hash_tbl_data_reg3_dout),
                                .hash_tbl_data_reg4_dout        (hash_tbl_data_reg4_dout),
                                .hash_tbl_data_reg5_dout        (hash_tbl_data_reg5_dout),
                                .hash_tbl_data_reg6_dout        (hash_tbl_data_reg6_dout),
                                .hash_tbl_data_reg7_dout        (hash_tbl_data_reg7_dout),
				.fcram_err_test_reg_dout	(fcram_err_test_reg_dout),
				.cpu_req_part0_sel		(cpu_req_part0_sel),
				.cpu_req_part1_sel              (cpu_req_part1_sel),
				.cpu_req_part2_sel              (cpu_req_part2_sel),
				.cpu_req_part3_sel              (cpu_req_part3_sel),
				.cpu_req_part4_sel              (cpu_req_part4_sel),
				.cpu_req_part5_sel              (cpu_req_part5_sel),
				.cpu_req_part6_sel              (cpu_req_part6_sel),
				.cpu_req_part7_sel              (cpu_req_part7_sel),
				.pio_rd				(pio_rd),
				.cpu_fcram_req			(cpu_fcram_req),
				.cpu_fio_req			(cpu_fio_req),
				.pio_fio_cfg_reset		(pio_fio_cfg_reset),
				.fio_cfg_addr_reg_dout		(fio_cfg_addr_reg_dout),
				.fflp_config_reg_wen_pulse	(fflp_config_reg_wen_pulse),
				.debug_training_vector		(debug_training_vector),
				.pio_debug_data_sel		(pio_debug_data_sel)

				);


fflp_sync2fc_clk	fflp_sync2fc_clk_inst
				(
      				.cclk				(fcram_clk),
      				.reset				(reset_s),
				.cpu_fcram_req			(cpu_fcram_req),
				.cpu_fio_req			(cpu_fio_req),
				.fc_fifo_empty			(fc_fifo_empty),
				.fflp_config_reg_wen_pulse	(fflp_config_reg_wen_pulse),

				.reset_sync			(reset_sync),
				.cpu_fcram_req_sync		(cpu_fcram_req_sync),
				.cpu_fio_req_sync		(cpu_fio_req_sync),
				.fc_fifo_empty_sync		(fc_fifo_empty_sync),
				.fflp_config_reg_wen_pulse_sync	(fflp_config_reg_wen_pulse_sync)

				);



fflp_sync2sys_clk	fflp_sync2sys_clk_inst
				(
				.cclk				(cclk),
				.cpu_fc_req_done		(cpu_fc_req_done),
				.cpu_fio_req_done		(cpu_fio_req_done),
				.fc_fifo_ren			(fc_fifo_ren),
				.zcp_wr				(zcp_wr),

				.cpu_fc_req_done_sync		(cpu_fc_req_done_sync),
				.cpu_fio_req_done_sync		(cpu_fio_req_done_sync),
				.fc_fifo_ren_sync		(fc_fifo_ren_sync),
				.fflp_zcp_wr_p			(fflp_zcp_wr_p),
				.fflp_zcp_wr			(fflp_zcp_wr)

				);


fflp_fcram_top		fflp_fcram_top_inst
				(
      				.cclk				(fcram_clk),
      				.reset				(reset_sync),
				.disable_chksum			(disable_chksum),
				.pio_fio_latency		(pio_fio_latency),
				.fcram_lookup_ratio		(fcram_lookup_ratio),
				.fflp_init_done			(fflp_init_done),
				.fcram_refresh_timer_reg_dout	(fcram_refresh_timer_reg_dout),
                                .flow_part_sel_reg0_dout        (flow_part_sel_reg0_dout[9:0]),
                                .flow_part_sel_reg1_dout        (flow_part_sel_reg1_dout[9:0]),
                                .flow_part_sel_reg2_dout        (flow_part_sel_reg2_dout[9:0]),
                                .flow_part_sel_reg3_dout        (flow_part_sel_reg3_dout[9:0]),
                                .flow_part_sel_reg4_dout        (flow_part_sel_reg4_dout[9:0]),
                                .flow_part_sel_reg5_dout        (flow_part_sel_reg5_dout[9:0]),
                                .flow_part_sel_reg6_dout        (flow_part_sel_reg6_dout[9:0]),
                                .flow_part_sel_reg7_dout        (flow_part_sel_reg7_dout[9:0]),
                                .hash_tbl_addr_reg0_dout        (hash_tbl_addr_reg0_dout),
                                .hash_tbl_addr_reg1_dout        (hash_tbl_addr_reg1_dout),
                                .hash_tbl_addr_reg2_dout        (hash_tbl_addr_reg2_dout),
                                .hash_tbl_addr_reg3_dout        (hash_tbl_addr_reg3_dout),
                                .hash_tbl_addr_reg4_dout        (hash_tbl_addr_reg4_dout),
                                .hash_tbl_addr_reg5_dout        (hash_tbl_addr_reg5_dout),
                                .hash_tbl_addr_reg6_dout        (hash_tbl_addr_reg6_dout),
                                .hash_tbl_addr_reg7_dout        (hash_tbl_addr_reg7_dout),
                                .hash_tbl_data_reg0_dout        (hash_tbl_data_reg0_dout),
                                .hash_tbl_data_reg1_dout        (hash_tbl_data_reg1_dout),
                                .hash_tbl_data_reg2_dout        (hash_tbl_data_reg2_dout),
                                .hash_tbl_data_reg3_dout        (hash_tbl_data_reg3_dout),
                                .hash_tbl_data_reg4_dout        (hash_tbl_data_reg4_dout),
                                .hash_tbl_data_reg5_dout        (hash_tbl_data_reg5_dout),
                                .hash_tbl_data_reg6_dout        (hash_tbl_data_reg6_dout),
                                .hash_tbl_data_reg7_dout        (hash_tbl_data_reg7_dout),
				.fcram_err_test_reg_dout	(fcram_err_test_reg_dout),
                                .cpu_req_part0_sel              (cpu_req_part0_sel),
                                .cpu_req_part1_sel              (cpu_req_part1_sel),
                                .cpu_req_part2_sel              (cpu_req_part2_sel),
                                .cpu_req_part3_sel              (cpu_req_part3_sel),
                                .cpu_req_part4_sel              (cpu_req_part4_sel),
                                .cpu_req_part5_sel              (cpu_req_part5_sel),
                                .cpu_req_part6_sel              (cpu_req_part6_sel),
                                .cpu_req_part7_sel              (cpu_req_part7_sel),
                                .pio_rd                         (pio_rd),
				.pio_wr_data			(pio_wr_data[15:0]),
				.pio_fio_cfg_reset              (pio_fio_cfg_reset),
                                .fio_cfg_addr_reg_dout          (fio_cfg_addr_reg_dout),
                                .cpu_fio_req_sync               (cpu_fio_req_sync),
				.fcram_driver_imp_ctrl		(fcram_driver_imp_ctrl),
				.fcram_qs_mode			(fcram_qs_mode),
                                .cpu_fcram_req_sync             (cpu_fcram_req_sync),
				.fc_fifo_empty_sync		(fc_fifo_empty_sync),
				.fflp_config_reg_wen_pulse_sync	(fflp_config_reg_wen_pulse_sync),
				.debug_training_vector		(debug_training_vector),
				.pio_debug_data_sel		(pio_debug_data_sel),
				.fc_fifo_dout			(fc_fifo_dout),
				.fcram_fflp_mstrready		(fcram_fflp_mstrready),
				.fcram_fflp_fatal_err		(fcram_fflp_fatal_err),
				.fcram_fflp_data_ready		(fcram_fflp_data_ready),
				.fcram_fflp_even_din		(fcram_fflp_even_din),
				.fcram_fflp_odd_din		(fcram_fflp_odd_din),
				.fcram_fflp_cfg_datrd           (fcram_fflp_cfg_datrd),
                                .fcram_fflp_cfg_done            (fcram_fflp_cfg_done),
				.fcram_fflp_cfg_err		(fcram_fflp_cfg_err),

                                .fflp_fcram_cfg_rst             (fflp_fcram_cfg_rst),
                                .fflp_fcram_cfg_sel             (fflp_fcram_cfg_sel),
                                .fflp_fcram_cfg_rd              (fflp_fcram_cfg_rd),
                                .fflp_fcram_cfg_addr            (fflp_fcram_cfg_addr),
                                .fflp_fcram_cfg_datwr           (fflp_fcram_cfg_datwr),
				.fflp_fcram_slv_update		(fflp_fcram_slv_update),
				.fflp_fcram_rd_en		(fflp_fcram_rd_en),
				.fflp_fcram_cs_l		(fflp_fcram_cs_l),
				.fflp_fcram_fn			(fflp_fcram_fn),
				.fflp_fcram_pd_l		(fflp_fcram_pd_l),
				.fflp_fcram_ba0			(fflp_fcram_ba0),
				.fflp_fcram_ba1			(fflp_fcram_ba1),
				.fflp_fcram_addr		(fflp_fcram_addr),
				.fflp_fcram_ds			(fflp_fcram_ds),
				.fflp_fcram_triz_en_l		(fflp_fcram_triz_en_l),
				.fflp_fcram_even_dout		(fflp_fcram_even_dout),
				.fflp_fcram_odd_dout		(fflp_fcram_odd_dout),
				.cpu_fc_req_done		(cpu_fc_req_done),
				.fc_rd_data_reg_dout		(fc_rd_data_reg_dout),
				.fc_rd_ecc_err			(fc_rd_ecc_err),
				.cpu_fio_req_done		(cpu_fio_req_done),
				.cpu_fio_rd_data		(cpu_fio_rd_data),
				.fio_cal_rd_latency		(fio_cal_rd_latency),
				.fc_fifo_ren			(fc_fifo_ren),
				.zcp_wr				(zcp_wr),
				.fflp_zcp_data			(fflp_zcp_data),
				.fc_err_status			(fc_err_status),
				.fflp_debug_port		(fflp_debug_port)

				);



endmodule

				


	



