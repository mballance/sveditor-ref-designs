// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_cam_ram.v
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
/*module name:   fflp_cam_ram                                         */
/*description:                                                        */
/*               FFLP CAM classification                              */
/*                                                                    */
/*parent module in:                                                   */
/*child modules in:  fflp_cam_srch.v, fflp_ram_cntl.v    	      */
/*                   fflp_cam_sched.v fflp_fwd_mstr.v                 */
/*interface modules:                                                  */
/*author name:       Jeanne Cai                                       */
/*date created:      03-22-04                                         */
/*                                                                    */
/*              Copyright (c) 2004, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/*modifications:                                                      */
/*                                                                    */

module fflp_cam_ram (
			cclk,
			reset,
			disable_chksum,
			pio_disable_cam,
			cam_srch_latency,
			cam_srch_ratio,
			h1_init_value_reg_dout,
			h2_init_value_reg_dout,
			fwd_req,
			key_bus,
			fwd_info_bus,
			cam_hit,
			cam_valid,
			cam_haddr,
			pio_rd_vld,
			cam_msk_dat_out,
			pio_wen,
			pio_addr,
			pio_32b_mode,
			pio_wr_data,
			am_din,
			fc_fifo_ren_sync,
			ext_fc_valid,

			fwd_sched,
			cam_data_inp,
			cam_compare,
			cam_pio_wr,
			cam_pio_rd,
			cam_pio_sel,
			cam_index,
			cam_key_reg0_dout,
			cam_key_reg1_dout,
			cam_key_reg2_dout,
			cam_key_reg3_dout,
			cam_key_mask_reg0_dout,
			cam_key_mask_reg1_dout,
			cam_key_mask_reg2_dout,
			cam_key_mask_reg3_dout,
			cam_cmd_stat_reg_dout,
			am_rd,
			am_wr,
			am_addr,
			am_dout,
			ecc_parity_status,
			fc_fifo_empty,
			fc_fifo_dout

			);

input		cclk;
input		reset;
input		disable_chksum;
input		pio_disable_cam;
input[3:0]	cam_srch_latency;
input[3:0]	cam_srch_ratio;
input[31:0]	h1_init_value_reg_dout;
input[15:0]	h2_init_value_reg_dout;
input		fwd_req;
input[199:0]	key_bus;
input[445:0]	fwd_info_bus;
input		cam_hit;
input		cam_valid;
input[9:0]	cam_haddr;
input		pio_rd_vld;
input[199:0]	cam_msk_dat_out;
input		pio_wen;
input[19:0]	pio_addr;
input		pio_32b_mode;
input[63:0]	pio_wr_data;
input[41:0]	am_din;
input		fc_fifo_ren_sync;
input[7:0]	ext_fc_valid;

output		fwd_sched;
output[199:0]	cam_data_inp;
output		cam_compare;
output		cam_pio_wr;
output		cam_pio_rd;
output		cam_pio_sel;
output[9:0]	cam_index;
output[7:0]	cam_key_reg0_dout;
output[63:0]	cam_key_reg1_dout;
output[63:0]	cam_key_reg2_dout;
output[63:0]	cam_key_reg3_dout;
output[7:0]	cam_key_mask_reg0_dout;
output[63:0]	cam_key_mask_reg1_dout;
output[63:0]	cam_key_mask_reg2_dout;
output[63:0]	cam_key_mask_reg3_dout;
output[20:0]	cam_cmd_stat_reg_dout;
output		am_rd;
output		am_wr;
output[9:0]	am_addr;
output[41:0]	am_dout;
output[25:0]	ecc_parity_status;
output		fc_fifo_empty;
output[512:0]	fc_fifo_dout;

wire            fwd_sched;
wire		cpu_sched;
wire[199:0]     cam_data_inp;
wire            cam_compare;
wire            cam_pio_wr;
wire            cam_pio_rd;
wire            cam_pio_sel;
wire[7:0]       cam_key_reg0_dout;
wire[63:0]      cam_key_reg1_dout;
wire[63:0]	cam_key_reg2_dout;
wire[63:0]	cam_key_reg3_dout;
wire[7:0]       cam_key_mask_reg0_dout;
wire[63:0]      cam_key_mask_reg1_dout;
wire[63:0]	cam_key_mask_reg2_dout;
wire[63:0]	cam_key_mask_reg3_dout;
wire[20:0]      cam_cmd_stat_reg_dout;
wire            am_rd;
wire            am_wr;
wire[9:0]       am_addr;
wire[41:0]      am_dout;
wire[25:0]	ecc_parity_status;
wire            fc_fifo_empty;
wire[512:0]     fc_fifo_dout;
wire		fc_fifo_space_avail;

wire[41:0]	am_din_reg_dout;
wire		cpu_req_cam_acc;
wire[1:0]	ram_acc_type;
wire		kick_off_ram_ctrl;
wire[9:0]	cam_haddr_reg1_dout;
wire[9:0]	cam_index;
wire		matchout_5;
wire		kick_off_ram_srch_5;
wire		kick_off_ram_srch_4;
wire[445:0]	fwd_info_bus_2;
wire[103:0]	key_ecc_data_2;

wire[19:0]	hash_v1;
wire[15:0]	hash_v2;

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


fflp_cam_sched	fflp_cam_sched_inst (
				.cclk			(cclk),
				.reset			(reset),
				.cam_srch_latency	(cam_srch_latency),
				.cam_srch_ratio		(cam_srch_ratio),
				.fwd_req		(fwd_req),
				.cpu_req_cam_acc	(cpu_req_cam_acc),
				.fc_fifo_space_avail	(fc_fifo_space_avail),
		
				.fwd_sched		(fwd_sched),
				.cpu_sched		(cpu_sched)
				);

fflp_cam_srch	fflp_cam_srch_inst (
				.cclk                   (cclk),
                                .reset                  (reset),
				.pio_disable_cam	(pio_disable_cam),
				.cam_srch_latency	(cam_srch_latency),
				.fwd_sched              (fwd_sched),
                                .cpu_sched              (cpu_sched),
				.key_bus		(key_bus),
				.fwd_info_bus		(fwd_info_bus),
				.cam_hit		(cam_hit),
				.cam_valid		(cam_valid),
				.cam_haddr		(cam_haddr),
				.pio_rd_vld		(pio_rd_vld),
				.cam_msk_dat_out	(cam_msk_dat_out),
				.am_din_reg_dout	(am_din_reg_dout),
				.pio_wen		(pio_wen),
				.pio_addr		(pio_addr),
				.pio_32b_mode		(pio_32b_mode),
				.pio_wr_data		(pio_wr_data),

				.cpu_req_cam_acc	(cpu_req_cam_acc),
				.ram_acc_type		(ram_acc_type),
				.kick_off_ram_ctrl	(kick_off_ram_ctrl),
				.cam_haddr_reg1_dout	(cam_haddr_reg1_dout),
				.cam_index		(cam_index),
				.cam_data_inp		(cam_data_inp),
				.cam_compare		(cam_compare),
				.cam_pio_wr		(cam_pio_wr),
				.cam_pio_rd		(cam_pio_rd),
				.cam_pio_sel		(cam_pio_sel),
				.matchout_5		(matchout_5),
				.kick_off_ram_srch_4	(kick_off_ram_srch_4),
				.kick_off_ram_srch_5	(kick_off_ram_srch_5),
				.fwd_info_bus_2		(fwd_info_bus_2),
				.key_ecc_data_2		(key_ecc_data_2),
				.cam_key_reg0_dout	(cam_key_reg0_dout),
				.cam_key_reg1_dout	(cam_key_reg1_dout),
				.cam_key_reg2_dout      (cam_key_reg2_dout),
                                .cam_key_reg3_dout      (cam_key_reg3_dout),
				.cam_key_mask_reg0_dout	(cam_key_mask_reg0_dout),
				.cam_key_mask_reg1_dout	(cam_key_mask_reg1_dout),
				.cam_key_mask_reg2_dout (cam_key_mask_reg2_dout),
                                .cam_key_mask_reg3_dout (cam_key_mask_reg3_dout),
				.cam_cmd_stat_reg_dout	(cam_cmd_stat_reg_dout)

				);

fflp_ram_cntl	fflp_ram_cntl_inst (
				.cclk                   (cclk),
                                .reset                  (reset),
				.ram_acc_type           (ram_acc_type),
                                .kick_off_ram_ctrl      (kick_off_ram_ctrl),
				.cam_haddr_reg1_dout    (cam_haddr_reg1_dout),
                                .cam_index              (cam_index),
				.cam_key_reg1_dout      (cam_key_reg1_dout[41:0]),
				.am_din			(am_din),

				.am_rd			(am_rd),
				.am_wr			(am_wr),
				.am_addr		(am_addr),
				.am_dout		(am_dout),
				.am_din_reg_dout	(am_din_reg_dout)

				);


fflp_hash_func	fflp_hash_func_inst (
				.cclk			(cclk),
				.reset			(reset),
				.fwd_info_hash_key	(fwd_info_bus[361:0]),
				.fwd_sched		(fwd_sched),
				.kick_off_ram_srch_4	(kick_off_ram_srch_4),
				.h1_init_value_reg_dout	(h1_init_value_reg_dout),
				.h2_init_value_reg_dout	(h2_init_value_reg_dout),

				.hash_v1		(hash_v1),
				.hash_v2		(hash_v2)

				);

fflp_fwd_mstr	fflp_fwd_mstr_inst (
				.cclk                   (cclk),
                                .reset                  (reset),
				.disable_chksum		(disable_chksum),
				.fc_fifo_ren_sync	(fc_fifo_ren_sync),
				.ext_fc_valid		(ext_fc_valid),
				.fwd_info_bus_2         (fwd_info_bus_2),
				.key_ecc_data_2		(key_ecc_data_2),
				.kick_off_ram_srch_5    (kick_off_ram_srch_5),
				.matchout_5             (matchout_5),
				.cam_haddr_reg1_dout    (cam_haddr_reg1_dout),
				.am_din_reg_dout        (am_din_reg_dout),
				.hash_v1		(hash_v1),
				.hash_v2		(hash_v2),

				.ecc_parity_status	(ecc_parity_status),
				.fc_fifo_space_avail	(fc_fifo_space_avail),
				.fc_fifo_empty		(fc_fifo_empty),
				.fc_fifo_dout		(fc_fifo_dout)

				);


endmodule



			
			
