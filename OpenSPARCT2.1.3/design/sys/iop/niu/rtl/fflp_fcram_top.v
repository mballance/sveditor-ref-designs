// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_fcram_top.v
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
/*module name:   fflp_fcram_top                                       */
/*description:   FCRAM protocol and flow classification               */
/*                                                                    */
/*parent module in:  fflp_top                                         */
/*child modules in:  fflp_fcram_cntl, fflp_fcram_sched,               */ 
/*                   fflp_merge_func                                  */
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

module fflp_fcram_top (
                        cclk,
                        reset,
			disable_chksum,
			pio_fio_latency,
			fcram_lookup_ratio,
                        fflp_init_done,
			fcram_refresh_timer_reg_dout,
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
			pio_wr_data,
			pio_fio_cfg_reset,
			fio_cfg_addr_reg_dout,
			cpu_fio_req_sync,
                        fcram_driver_imp_ctrl,
			fcram_qs_mode,
			cpu_fcram_req_sync,
			fc_fifo_empty_sync,
			fflp_config_reg_wen_pulse_sync,
			debug_training_vector,
			pio_debug_data_sel,
			fc_fifo_dout,
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
			cpu_fc_req_done,
			fc_rd_data_reg_dout,
			fc_rd_ecc_err,
			cpu_fio_req_done,
			cpu_fio_rd_data,
			fio_cal_rd_latency,
			fc_fifo_ren,
			zcp_wr,
			fflp_zcp_data,
			fc_err_status,
			fflp_debug_port

			);

input		cclk;
input		reset;
input		disable_chksum;
input[1:0]	pio_fio_latency;
input[3:0]	fcram_lookup_ratio;
input		fflp_init_done;
input[31:0]	fcram_refresh_timer_reg_dout;
input[9:0]      flow_part_sel_reg0_dout;
input[9:0]      flow_part_sel_reg1_dout;
input[9:0]      flow_part_sel_reg2_dout;
input[9:0]      flow_part_sel_reg3_dout;
input[9:0]      flow_part_sel_reg4_dout;
input[9:0]      flow_part_sel_reg5_dout;
input[9:0]      flow_part_sel_reg6_dout;
input[9:0]      flow_part_sel_reg7_dout;
input[23:0]     hash_tbl_addr_reg0_dout;
input[23:0]     hash_tbl_addr_reg1_dout;
input[23:0]     hash_tbl_addr_reg2_dout;
input[23:0]     hash_tbl_addr_reg3_dout;
input[23:0]     hash_tbl_addr_reg4_dout;
input[23:0]     hash_tbl_addr_reg5_dout;
input[23:0]     hash_tbl_addr_reg6_dout;
input[23:0]     hash_tbl_addr_reg7_dout;
input[63:0]     hash_tbl_data_reg0_dout;
input[63:0]     hash_tbl_data_reg1_dout;
input[63:0]     hash_tbl_data_reg2_dout;
input[63:0]     hash_tbl_data_reg3_dout;
input[63:0]     hash_tbl_data_reg4_dout;
input[63:0]     hash_tbl_data_reg5_dout;
input[63:0]     hash_tbl_data_reg6_dout;
input[63:0]     hash_tbl_data_reg7_dout;
input[71:0]	fcram_err_test_reg_dout;
input           cpu_req_part0_sel;
input           cpu_req_part1_sel;
input           cpu_req_part2_sel;
input           cpu_req_part3_sel;
input           cpu_req_part4_sel;
input           cpu_req_part5_sel;
input           cpu_req_part6_sel;
input           cpu_req_part7_sel;
input           pio_rd;
input[15:0]	pio_wr_data;
input		pio_fio_cfg_reset;
input[7:0]	fio_cfg_addr_reg_dout;
input		cpu_fio_req_sync;
input[3:0]      fcram_driver_imp_ctrl;
input		fcram_qs_mode;
input		cpu_fcram_req_sync;
input		fc_fifo_empty_sync;
input		fflp_config_reg_wen_pulse_sync;
input[31:0]	debug_training_vector;
input[2:0]	pio_debug_data_sel;
input[512:0]	fc_fifo_dout;
input		fcram_fflp_mstrready;
input		fcram_fflp_fatal_err;
input[3:0]	fcram_fflp_data_ready;
input[35:0]	fcram_fflp_even_din;
input[35:0]	fcram_fflp_odd_din;
input[15:0]	fcram_fflp_cfg_datrd;
input		fcram_fflp_cfg_done;
input		fcram_fflp_cfg_err;

output		fflp_fcram_cfg_rst;
output		fflp_fcram_cfg_sel;
output		fflp_fcram_cfg_rd;
output[7:0]	fflp_fcram_cfg_addr;
output[15:0]	fflp_fcram_cfg_datwr;
output		fflp_fcram_slv_update;
output[1:0]	fflp_fcram_rd_en;
output          fflp_fcram_cs_l;
output          fflp_fcram_fn;
output		fflp_fcram_pd_l;
output          fflp_fcram_ba0;
output          fflp_fcram_ba1;
output[14:0]    fflp_fcram_addr;
output[1:0]     fflp_fcram_ds;
output[1:0]     fflp_fcram_triz_en_l;
output[35:0]    fflp_fcram_even_dout;
output[35:0]    fflp_fcram_odd_dout;
output          cpu_fc_req_done;
output[71:0]    fc_rd_data_reg_dout;
output		fc_rd_ecc_err;
output		cpu_fio_req_done;
output[31:0]	cpu_fio_rd_data;
output[7:0]	fio_cal_rd_latency;
output		fc_fifo_ren;
output          zcp_wr;
output[215:0]   fflp_zcp_data;
output[33:0]	fc_err_status;
output[31:0]	fflp_debug_port;

wire		srch_no_fc_done;
wire		fwd_sched;
wire		do_srch_cycle;
wire		do_cpu_cycle;

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
wire[71:0]	fc_din_reg_dout_r;
wire		ecc_check_err_r;
wire		ecc_corr_err_r;
wire		fio_no_fatal_err;
wire		srch_burst_done;
wire		cpu_burst_done_sm;
wire[4:0]	fcram_sm_state;
wire		srch_burst_done_2;
wire		srch_fio_wait_6;
wire		srch_fio_rd_en_4;
wire		cpu_fc_req_done;
wire[71:0]	fc_rd_data_reg_dout;
wire		fc_rd_ecc_err;
wire		cpu_fio_req_done;
wire[31:0]	cpu_fio_rd_data;
wire[7:0]	fio_cal_rd_latency;

wire[19:0]	merg_bus_0_hash_v1;
wire[2:0]	merg_bus_0_rdc_tbl_num;
wire		merg_bus_1_fc_lookup;
wire		fc_fifo_ren;
wire		zcp_wr;
wire[215:0]	fflp_zcp_data;
wire[33:0]	fc_err_status;
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


fflp_fcram_sched	fflp_fcram_sched_inst
				(
				.cclk			(cclk),
				.reset			(reset),
				.fcram_lookup_ratio	(fcram_lookup_ratio),
				.cpu_fcram_req_sync	(cpu_fcram_req_sync),
				.fc_fifo_empty_sync	(fc_fifo_empty_sync),
				.fc_fifo_fc_lookup	(fc_fifo_dout[498]),
				.srch_burst_done	(srch_burst_done),
				.cpu_burst_done_sm	(cpu_burst_done_sm),

				.srch_no_fc_done	(srch_no_fc_done),
				.fwd_sched		(fwd_sched),
				.do_srch_cycle		(do_srch_cycle),
				.do_cpu_cycle		(do_cpu_cycle),
				.fc_fifo_ren		(fc_fifo_ren)

				);


fflp_fcram_cntl		fflp_fcram_cntl_inst
				(
				.cclk				(cclk),
				.reset				(reset),
				.disable_chksum			(disable_chksum),
				.pio_fio_latency		(pio_fio_latency),
				.fflp_init_done			(fflp_init_done),
				.fcram_refresh_timer_reg_dout	(fcram_refresh_timer_reg_dout),
				.flow_part_sel_reg0_dout	(flow_part_sel_reg0_dout),
				.flow_part_sel_reg1_dout	(flow_part_sel_reg1_dout),
				.flow_part_sel_reg2_dout	(flow_part_sel_reg2_dout),
				.flow_part_sel_reg3_dout	(flow_part_sel_reg3_dout),
				.flow_part_sel_reg4_dout	(flow_part_sel_reg4_dout),
				.flow_part_sel_reg5_dout	(flow_part_sel_reg5_dout),
				.flow_part_sel_reg6_dout	(flow_part_sel_reg6_dout),
				.flow_part_sel_reg7_dout	(flow_part_sel_reg7_dout),
				.hash_tbl_addr_reg0_dout	(hash_tbl_addr_reg0_dout),
				.hash_tbl_addr_reg1_dout	(hash_tbl_addr_reg1_dout),
				.hash_tbl_addr_reg2_dout	(hash_tbl_addr_reg2_dout),
				.hash_tbl_addr_reg3_dout	(hash_tbl_addr_reg3_dout),
				.hash_tbl_addr_reg4_dout	(hash_tbl_addr_reg4_dout),
				.hash_tbl_addr_reg5_dout	(hash_tbl_addr_reg5_dout),
				.hash_tbl_addr_reg6_dout	(hash_tbl_addr_reg6_dout),
				.hash_tbl_addr_reg7_dout	(hash_tbl_addr_reg7_dout),
				.hash_tbl_data_reg0_dout	(hash_tbl_data_reg0_dout),
				.hash_tbl_data_reg1_dout	(hash_tbl_data_reg1_dout),
				.hash_tbl_data_reg2_dout	(hash_tbl_data_reg2_dout),
				.hash_tbl_data_reg3_dout	(hash_tbl_data_reg3_dout),
				.hash_tbl_data_reg4_dout	(hash_tbl_data_reg4_dout),
				.hash_tbl_data_reg5_dout	(hash_tbl_data_reg5_dout),
				.hash_tbl_data_reg6_dout	(hash_tbl_data_reg6_dout),
				.hash_tbl_data_reg7_dout	(hash_tbl_data_reg7_dout),
				.fcram_err_test_reg_dout	(fcram_err_test_reg_dout),
				.cpu_req_part0_sel		(cpu_req_part0_sel),
				.cpu_req_part1_sel		(cpu_req_part1_sel),
				.cpu_req_part2_sel		(cpu_req_part2_sel),
				.cpu_req_part3_sel		(cpu_req_part3_sel),
				.cpu_req_part4_sel		(cpu_req_part4_sel),
				.cpu_req_part5_sel		(cpu_req_part5_sel),
				.cpu_req_part6_sel		(cpu_req_part6_sel),
				.cpu_req_part7_sel		(cpu_req_part7_sel),
				.pio_rd				(pio_rd),
				.pio_wr_data			(pio_wr_data),
				.pio_fio_cfg_reset		(pio_fio_cfg_reset),
				.fio_cfg_addr_reg_dout		(fio_cfg_addr_reg_dout),
				.cpu_fio_req_sync		(cpu_fio_req_sync),
				.fcram_driver_imp_ctrl		(fcram_driver_imp_ctrl),
				.fcram_qs_mode			(fcram_qs_mode),
				.srch_no_fc_done		(srch_no_fc_done),
				.do_srch_cycle			(do_srch_cycle),
				.do_cpu_cycle			(do_cpu_cycle),
				.merg_bus_0_hash_v1		(merg_bus_0_hash_v1),
				.merg_bus_0_rdc_tbl_num		(merg_bus_0_rdc_tbl_num),
				.merg_bus_1_fc_lookup		(merg_bus_1_fc_lookup),
				.fcram_fflp_mstrready		(fcram_fflp_mstrready),
				.fcram_fflp_fatal_err		(fcram_fflp_fatal_err),
				.fcram_fflp_data_ready		(fcram_fflp_data_ready),
				.fcram_fflp_even_din		(fcram_fflp_even_din),
				.fcram_fflp_odd_din		(fcram_fflp_odd_din),
				.fcram_fflp_cfg_datrd		(fcram_fflp_cfg_datrd),
				.fcram_fflp_cfg_done		(fcram_fflp_cfg_done),
				.fcram_fflp_cfg_err		(fcram_fflp_cfg_err),

				.fflp_fcram_cfg_rst		(fflp_fcram_cfg_rst),
				.fflp_fcram_cfg_sel		(fflp_fcram_cfg_sel),
				.fflp_fcram_cfg_rd		(fflp_fcram_cfg_rd),
				.fflp_fcram_cfg_addr		(fflp_fcram_cfg_addr),
				.fflp_fcram_cfg_datwr		(fflp_fcram_cfg_datwr),
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
				.fc_din_reg_dout_r		(fc_din_reg_dout_r),
				.ecc_check_err_r		(ecc_check_err_r),
				.ecc_corr_err_r			(ecc_corr_err_r),
				.fio_no_fatal_err		(fio_no_fatal_err),
				.srch_burst_done		(srch_burst_done),
				.cpu_burst_done_sm		(cpu_burst_done_sm),
				.fcram_sm_state			(fcram_sm_state),
				.srch_burst_done_2		(srch_burst_done_2),
				.srch_fio_wait_6		(srch_fio_wait_6),
				.srch_fio_rd_en_4		(srch_fio_rd_en_4),
				.cpu_fc_req_done		(cpu_fc_req_done),
				.fc_rd_data_reg_dout		(fc_rd_data_reg_dout),
				.fc_rd_ecc_err			(fc_rd_ecc_err),
				.cpu_fio_req_done		(cpu_fio_req_done),
				.cpu_fio_rd_data		(cpu_fio_rd_data),
				.fio_cal_rd_latency		(fio_cal_rd_latency)

				);


fflp_merge_func		fflp_merge_func_inst
				(
				.cclk				(cclk),
				.reset				(reset),
				.fwd_sched			(fwd_sched),
				.fc_fifo_dout			(fc_fifo_dout),
				.fc_din_reg_dout_r		(fc_din_reg_dout_r),
				.ecc_check_err_r		(ecc_check_err_r),
				.ecc_corr_err_r			(ecc_corr_err_r),
				.fio_no_fatal_err		(fio_no_fatal_err),
				.srch_burst_done_2		(srch_burst_done_2),
				.srch_fio_wait_6		(srch_fio_wait_6),
				.srch_fio_rd_en_4		(srch_fio_rd_en_4),
				.fcram_sm_state			(fcram_sm_state),
				.fflp_config_reg_wen_pulse_sync	(fflp_config_reg_wen_pulse_sync),
				.debug_training_vector		(debug_training_vector),
				.pio_debug_data_sel		(pio_debug_data_sel),
	
				.merg_bus_0_hash_v1             (merg_bus_0_hash_v1),
                                .merg_bus_0_rdc_tbl_num         (merg_bus_0_rdc_tbl_num),
				.merg_bus_1_fc_lookup		(merg_bus_1_fc_lookup),
				.zcp_wr				(zcp_wr),
				.fflp_zcp_data			(fflp_zcp_data),
				.fc_err_status			(fc_err_status),
				.fflp_debug_port		(fflp_debug_port)

				);


endmodule

