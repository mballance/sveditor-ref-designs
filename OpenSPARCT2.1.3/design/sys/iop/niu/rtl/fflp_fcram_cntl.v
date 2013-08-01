// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_fcram_cntl.v
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
/*module name:   fflp_fcram_cntl                                      */
/*description:   FCRAM access protocol                                */
/*                                                                    */
/*parent module in:  fflp_fcram_top                                   */
/*child modules in:  fflp_fcram_cntl_sm                               */
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


module fflp_fcram_cntl (
			cclk,
			reset,
			disable_chksum,
			pio_fio_latency,
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
			srch_no_fc_done,
			do_srch_cycle,
			do_cpu_cycle,
			merg_bus_0_hash_v1,
			merg_bus_0_rdc_tbl_num,
			merg_bus_1_fc_lookup,
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
			fc_din_reg_dout_r,
			ecc_check_err_r,
			ecc_corr_err_r,
			fio_no_fatal_err,
			srch_burst_done,
			cpu_burst_done_sm,
			fcram_sm_state,
			srch_burst_done_2,	//second pipe
			srch_fio_wait_6,	//third pipe
			srch_fio_rd_en_4,	//4th pipe
			cpu_fc_req_done,
			fc_rd_data_reg_dout,
			fc_rd_ecc_err,
			cpu_fio_req_done,	//fio pio req done
			cpu_fio_rd_data,
			fio_cal_rd_latency

			);

input		cclk;
input		reset;
input[1:0]	pio_fio_latency;
input		disable_chksum;
input		fflp_init_done;
input[31:0]	fcram_refresh_timer_reg_dout;
input[9:0]	flow_part_sel_reg0_dout;
input[9:0]	flow_part_sel_reg1_dout;
input[9:0]	flow_part_sel_reg2_dout;
input[9:0]	flow_part_sel_reg3_dout;
input[9:0]	flow_part_sel_reg4_dout;
input[9:0]	flow_part_sel_reg5_dout;
input[9:0]	flow_part_sel_reg6_dout;
input[9:0]	flow_part_sel_reg7_dout;
input[23:0]	hash_tbl_addr_reg0_dout;
input[23:0]	hash_tbl_addr_reg1_dout;
input[23:0]	hash_tbl_addr_reg2_dout;
input[23:0]	hash_tbl_addr_reg3_dout;
input[23:0]	hash_tbl_addr_reg4_dout;
input[23:0]	hash_tbl_addr_reg5_dout;
input[23:0]	hash_tbl_addr_reg6_dout;
input[23:0]	hash_tbl_addr_reg7_dout;
input[63:0]	hash_tbl_data_reg0_dout;
input[63:0]	hash_tbl_data_reg1_dout;
input[63:0]	hash_tbl_data_reg2_dout;
input[63:0]	hash_tbl_data_reg3_dout;
input[63:0]	hash_tbl_data_reg4_dout;
input[63:0]	hash_tbl_data_reg5_dout;
input[63:0]	hash_tbl_data_reg6_dout;
input[63:0]	hash_tbl_data_reg7_dout;
input[71:0]	fcram_err_test_reg_dout;
input		cpu_req_part0_sel;
input		cpu_req_part1_sel;
input		cpu_req_part2_sel;
input		cpu_req_part3_sel;
input		cpu_req_part4_sel;
input		cpu_req_part5_sel;
input		cpu_req_part6_sel;
input		cpu_req_part7_sel;
input		pio_rd;
input[15:0]	pio_wr_data;
input		pio_fio_cfg_reset;
input[7:0]	fio_cfg_addr_reg_dout;
input		cpu_fio_req_sync;
input[3:0]	fcram_driver_imp_ctrl;
input		fcram_qs_mode;
input		srch_no_fc_done;
input		do_srch_cycle;
input		do_cpu_cycle;
input[19:0]	merg_bus_0_hash_v1;
input[2:0]	merg_bus_0_rdc_tbl_num;
input		merg_bus_1_fc_lookup;
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
output[71:0]	fc_din_reg_dout_r;
output		ecc_check_err_r;
output		ecc_corr_err_r;
output		fio_no_fatal_err;
output		srch_burst_done;
output		cpu_burst_done_sm;
output[4:0]	fcram_sm_state;
output		srch_burst_done_2;
output		srch_fio_wait_6;
output		srch_fio_rd_en_4;
output		cpu_fc_req_done;
output[71:0]	fc_rd_data_reg_dout;
output		fc_rd_ecc_err;
output		cpu_fio_req_done;
output[31:0]	cpu_fio_rd_data;
output[7:0]	fio_cal_rd_latency;

wire		cpu_cmd;
/*
wire		ext_valid0;
wire		ext_valid1;
wire		ext_valid2;
wire            ext_valid3;
wire            ext_valid4;
wire            ext_valid5;
wire            ext_valid6;
wire            ext_valid7;
*/
wire[4:0]	addr_mask0;
wire[4:0]       addr_mask1;
wire[4:0]       addr_mask2;
wire[4:0]       addr_mask3;
wire[4:0]       addr_mask4;
wire[4:0]       addr_mask5;
wire[4:0]       addr_mask6;
wire[4:0]       addr_mask7;
wire[4:0]	addr_base0;
wire[4:0]       addr_base1;
wire[4:0]       addr_base2;
wire[4:0]       addr_base3;
wire[4:0]       addr_base4;
wire[4:0]       addr_base5;
wire[4:0]       addr_base6;
wire[4:0]       addr_base7;

wire[22:0]	cpu_fc_loc;
wire[1:0]	cpu_fc_bk;
wire		cpu_bk0;
wire		cpu_bk1;
wire[21:0]	cpu_fc_addr;
wire[4:0]	cpu_addr_mask;
wire[4:0]	cpu_addr_base;
wire[4:0]	cpu_fc_masked_addr_h;
wire[21:0]	cpu_fc_masked_addr;
wire[63:0]	cpu_fc_data;
wire[63:0]	cpu_fc_data_r;
wire[71:0]	ecc_check_cpu_fc_data;
wire[71:0]	cpu_fc_data_in;
wire[71:0]	ecc_check_cpu_fc_data_r;

reg[4:0]	srch_addr_mask;
reg[4:0]	srch_addr_base;

wire[4:0]	srch_fc_masked_addr_h;
wire[21:0]	srch_fc_masked_addr;

wire[14:0]	mode_reg_data;
wire[14:0]	ext_mode_reg_data;
wire[14:0]	srch_fc_addr_mux_dout;
wire[14:0]	conf_fc_addr_mux_dout;
wire[14:0]	fc_addr_mux_dout;

wire[14:0]	fflp_fcram_addr;
wire[35:0]	fflp_fcram_even_dout;
wire[35:0]	fflp_fcram_odd_dout;
wire[35:0]	fc_even_din_reg_dout;
wire[35:0]	fc_odd_din_reg_dout;
wire[71:0]	fc_din_reg_dout;
wire		fio_mstr_ready;
wire		fio_no_fatal_err;
wire[3:0]	fio_data_ready;
//wire		fflp_fcram_cs_l;
//wire		fflp_fcram_fn;
wire		fflp_fcram_pd_l;
wire		fflp_fcram_ba0;
wire		fflp_fcram_ba1;
wire[1:0]	fflp_fcram_ds;
wire[1:0]	fflp_fcram_triz_en_l;	//write data enable

reg		fflp_fcram_cs_l;
reg		fflp_fcram_fn;

wire[71:0]	fc_din_reg_dout_tmp;
wire[71:0]	fc_din_reg_dout_r;
wire		ecc_check_err;
wire		ecc_check_err_r;

wire		ecc_corr_err_r;
wire		ecc_check_err_all;
wire		ecc_no_error;
wire		ecc_corr_error;
wire		ecc_error;

wire            cpu_burst_done;
wire            cpu_burst_done_1;
wire            cpu_burst_done_2;
wire            cpu_burst_done_3;
wire            cpu_burst_done_4;
wire            cpu_burst_done_5;
wire            cpu_burst_done_6;
wire            cpu_burst_done_7;
wire            cpu_burst_done_8;
wire		cpu_burst_done_9;
wire		cpu_burst_done_10;
wire            cpu_burst_done_11;
wire            cpu_burst_done_12;
wire		cpu_burst_done_13;
wire		cpu_burst_done_14;
wire		cpu_burst_done_15;

wire            cpu_burst_done_16;
wire            cpu_burst_done_17;
wire            cpu_burst_done_18;
wire            cpu_burst_done_19;

wire		pio_fio_acc_en;
wire		pio_fio_acc_en_1;
wire		pio_fio_acc_en_2;
wire		pio_fio_acc_en_3;
wire		pio_fio_acc_en_4;
wire		pio_fio_acc_en_5;
wire		pio_fio_acc_en_6;

wire		pio_fio_rd_en;
wire		pio_fio_rd_en_1;
wire		pio_fio_rd_en_4;

wire		cpu_fc_req_done;
wire		cpu_fc_req_done_p;
wire[71:0]	fc_rd_data_reg_dout;
wire		fc_rd_ecc_err;

wire		srch_burst_done;
wire		srch_burst_done_all;
wire		srch_burst_done_1;
wire		srch_burst_done_2;
wire		srch_burst_done_3;

wire		srch_fio_wait;
wire		srch_fio_wait_1;
wire		srch_fio_wait_2;
wire		srch_fio_wait_3;
wire		srch_fio_wait_4;
wire		srch_fio_wait_5;
wire		srch_fio_wait_6;

wire		srch_fio_rd_en;
wire            srch_fio_rd_en_1;
wire            srch_fio_rd_en_2;
wire            srch_fio_rd_en_3;
wire            srch_fio_rd_en_4;
wire            srch_fio_rd_en_5;
wire            srch_fio_rd_en_6;
wire		srch_fio_rd_en_7;
wire		srch_fio_rd_en_8;
wire		srch_fio_rd_en_tmp;
wire		srch_fio_rd_en_p;
wire		srch_fio_rd_en_valid;

wire		fcram_ds;
wire		fcram_ds_1;
wire		fcram_ds_2;
wire		fcram_ds_3;
wire		fcram_ds_4;
wire		fcram_ds_5;

wire[1:0]	fcram_cmd_sm;
wire		fcram_ba0_sm;
wire		fcram_ba1_sm;
wire[2:0]	fcram_addr_sel;
wire		fcram_addr_en;
wire		fcram_ds_sm;
wire		fflp_fcram_slv_update;
wire		srch_burst_done_sm;
wire		cpu_burst_done_sm;
wire		power_on_wait_cnt_done_r;
wire[4:0]	fcram_sm_state;

wire		cpu_fio_req_sync_p;
wire		cpu_fio_req_sync_r;
wire		fcram_cfg_done_p;
wire		fcram_cfg_done;
wire		fcram_cfg_done_r;
wire		fcram_cfg_done_r1;
wire		fcram_cfg_err;
wire		fcram_cfg_sel_in;
wire		cpu_fio_req_done;
wire[15:0]	fcram_cfg_datrd;
wire[31:0]	cpu_fio_rd_data_tmp;
wire[31:0]	cpu_fio_rd_data;
wire		fflp_fcram_cfg_rst;
wire[7:0]	fflp_fcram_cfg_addr;
wire[15:0]	fflp_fcram_cfg_datwr;
wire		fflp_fcram_cfg_rd;
wire		fflp_fcram_cfg_sel;
wire		fflp_fcram_rd_en_p;
wire[1:0]	fflp_fcram_rd_en;

wire		fflp_data_ready_p;
wire		fflp_data_ready;
wire		cpu_rd_latency0;
wire		cpu_rd_latency1;
wire		cpu_rd_latency2;
wire		cpu_rd_latency3;
wire		cpu_rd_latency4;
wire		cpu_rd_latency5;
wire		cpu_rd_latency6;
wire		cpu_rd_latency7;
wire[7:0]	cpu_rd_latency_array;
wire[7:0]	fio_cal_rd_latency;

/***********************/
//CPU Request
/***********************/
assign cpu_cmd	= !pio_rd;

//assign ext_valid0	= flow_part_sel_reg0_dout[16];
assign addr_mask0	= flow_part_sel_reg0_dout[9:5];
assign addr_base0	= flow_part_sel_reg0_dout[4:0];

//assign ext_valid1	= flow_part_sel_reg1_dout[16];
assign addr_mask1	= flow_part_sel_reg1_dout[9:5];
assign addr_base1	= flow_part_sel_reg1_dout[4:0];

//assign ext_valid2     = flow_part_sel_reg2_dout[16];
assign addr_mask2       = flow_part_sel_reg2_dout[9:5];
assign addr_base2       = flow_part_sel_reg2_dout[4:0];

//assign ext_valid3     = flow_part_sel_reg3_dout[16];
assign addr_mask3       = flow_part_sel_reg3_dout[9:5];
assign addr_base3       = flow_part_sel_reg3_dout[4:0];

//assign ext_valid4     = flow_part_sel_reg4_dout[16];
assign addr_mask4       = flow_part_sel_reg4_dout[9:5];
assign addr_base4       = flow_part_sel_reg4_dout[4:0];

//assign ext_valid5     = flow_part_sel_reg5_dout[16];
assign addr_mask5       = flow_part_sel_reg5_dout[9:5];
assign addr_base5       = flow_part_sel_reg5_dout[4:0];

//assign ext_valid6     = flow_part_sel_reg6_dout[16];
assign addr_mask6       = flow_part_sel_reg6_dout[9:5];
assign addr_base6       = flow_part_sel_reg6_dout[4:0];

//assign ext_valid7     = flow_part_sel_reg7_dout[16];
assign addr_mask7       = flow_part_sel_reg7_dout[9:5];
assign addr_base7       = flow_part_sel_reg7_dout[4:0];

assign cpu_addr_mask	= ({5{cpu_req_part0_sel}} & addr_mask0) |
			  ({5{cpu_req_part1_sel}} & addr_mask1) |
			  ({5{cpu_req_part2_sel}} & addr_mask2) |
			  ({5{cpu_req_part3_sel}} & addr_mask3) |
			  ({5{cpu_req_part4_sel}} & addr_mask4) |
			  ({5{cpu_req_part5_sel}} & addr_mask5) |
			  ({5{cpu_req_part6_sel}} & addr_mask6) |
			  ({5{cpu_req_part7_sel}} & addr_mask7);

assign cpu_addr_base	= ({5{cpu_req_part0_sel}} & addr_base0) |
                          ({5{cpu_req_part1_sel}} & addr_base1) |
                          ({5{cpu_req_part2_sel}} & addr_base2) |
                          ({5{cpu_req_part3_sel}} & addr_base3) |
                          ({5{cpu_req_part4_sel}} & addr_base4) |
                          ({5{cpu_req_part5_sel}} & addr_base5) |
                          ({5{cpu_req_part6_sel}} & addr_base6) |
                          ({5{cpu_req_part7_sel}} & addr_base7);

assign cpu_fc_data	= (({64{cpu_req_part0_sel}} & hash_tbl_data_reg0_dout) |
                           ({64{cpu_req_part1_sel}} & hash_tbl_data_reg1_dout) |
                           ({64{cpu_req_part2_sel}} & hash_tbl_data_reg2_dout) |
                           ({64{cpu_req_part3_sel}} & hash_tbl_data_reg3_dout) |
                           ({64{cpu_req_part4_sel}} & hash_tbl_data_reg4_dout) |
                           ({64{cpu_req_part5_sel}} & hash_tbl_data_reg5_dout) |
                           ({64{cpu_req_part6_sel}} & hash_tbl_data_reg6_dout) |
                           ({64{cpu_req_part7_sel}} & hash_tbl_data_reg7_dout));

assign cpu_fc_loc	= ({23{cpu_req_part0_sel}} & hash_tbl_addr_reg0_dout[22:0]) |
                          ({23{cpu_req_part1_sel}} & hash_tbl_addr_reg1_dout[22:0]) |
                          ({23{cpu_req_part2_sel}} & hash_tbl_addr_reg2_dout[22:0]) |
                          ({23{cpu_req_part3_sel}} & hash_tbl_addr_reg3_dout[22:0]) |
                          ({23{cpu_req_part4_sel}} & hash_tbl_addr_reg4_dout[22:0]) |
                          ({23{cpu_req_part5_sel}} & hash_tbl_addr_reg5_dout[22:0]) |
                          ({23{cpu_req_part6_sel}} & hash_tbl_addr_reg6_dout[22:0]) |
                          ({23{cpu_req_part7_sel}} & hash_tbl_addr_reg7_dout[22:0]);

assign cpu_fc_bk        = cpu_fc_loc[2:1];
assign cpu_bk0          = cpu_fc_bk[0];
assign cpu_bk1          = cpu_fc_bk[1];
assign cpu_fc_addr      = {cpu_fc_loc[22:3], cpu_fc_loc[0], 1'b0};    //22bits

assign cpu_fc_masked_addr_h	= (cpu_addr_mask & cpu_addr_base) | (~cpu_addr_mask & cpu_fc_addr[21:17]); 
assign cpu_fc_masked_addr	= {cpu_fc_masked_addr_h, cpu_fc_addr[16:0]};


/**********************************/
//Packet Lookup Addr
/**********************************/
always @(merg_bus_0_rdc_tbl_num or
	addr_mask0 or addr_base0 or
	addr_mask1 or addr_base1 or
	addr_mask2 or addr_base2 or
	addr_mask3 or addr_base3 or
	addr_mask4 or addr_base4 or
	addr_mask5 or addr_base5 or
	addr_mask6 or addr_base6 or
	addr_mask7 or addr_base7)
begin
	case (merg_bus_0_rdc_tbl_num)
	// 0in < case -full -parallel -message "0in ERROR: case check in fflp_fcram_cntl"
	
	3'b000:	
	begin
		srch_addr_mask = addr_mask0;
		srch_addr_base = addr_base0;
	end
	3'b001: 
        begin
                srch_addr_mask = addr_mask1;
                srch_addr_base = addr_base1;
        end
	3'b010: 
        begin
                srch_addr_mask = addr_mask2;
                srch_addr_base = addr_base2;
        end
	3'b011: 
        begin
                srch_addr_mask = addr_mask3;
                srch_addr_base = addr_base3;
        end
	3'b100: 
        begin
                srch_addr_mask = addr_mask4;
                srch_addr_base = addr_base4;
        end
	3'b101: 
        begin
                srch_addr_mask = addr_mask5;
                srch_addr_base = addr_base5;
        end
	3'b110: 
        begin
                srch_addr_mask = addr_mask6;
                srch_addr_base = addr_base6;
        end
	3'b111: 
        begin
                srch_addr_mask = addr_mask7;
                srch_addr_base = addr_base7;
        end
	default:
	begin
		srch_addr_mask = 5'b0;
		srch_addr_base = 5'b0;
	end
	endcase
end

assign srch_fc_masked_addr_h	= (srch_addr_mask & srch_addr_base) | (~srch_addr_mask & merg_bus_0_hash_v1[19:15]);
assign srch_fc_masked_addr	= {srch_fc_masked_addr_h, merg_bus_0_hash_v1[14:0], 2'b00};


/*******************************/
//FCRAM Interface signal
/*******************************/
assign mode_reg_data		= {8'b0, 3'b110, 1'b0, 3'b010};	//{resed(8), cas_latency, burst_type, burst_len}
assign ext_mode_reg_data	= {8'b0, 1'b1, fcram_qs_mode, fcram_driver_imp_ctrl[3:0], 1'b0};	

assign srch_fc_addr_mux_dout	= (fcram_addr_sel[1:0] == 2'b00) ? srch_fc_masked_addr[21:7] :
                                  (fcram_addr_sel[1:0] == 2'b01) ? {8'b0, srch_fc_masked_addr[6:0]} :
                                  (fcram_addr_sel[1:0] == 2'b10) ? cpu_fc_masked_addr[21:7] :
                                  				   {2'b01, 6'b0, cpu_fc_masked_addr[6:0]};
assign conf_fc_addr_mux_dout	= fcram_addr_sel[0] ? ext_mode_reg_data : mode_reg_data;
assign fc_addr_mux_dout		= fcram_addr_sel[2] ? srch_fc_addr_mux_dout : conf_fc_addr_mux_dout; 

dffre #(15) fflp_fcram_addr_reg	(cclk, reset, fcram_addr_en,	 fc_addr_mux_dout,		fflp_fcram_addr);
dffre #(36) fcram_even_dout_reg (cclk, reset, fcram_ds,		 cpu_fc_data_in[35:0],		fflp_fcram_even_dout);		
dffre #(36) fcram_odd_dout_reg	(cclk, reset, fcram_ds,		 cpu_fc_data_in[71:36],		fflp_fcram_odd_dout);

dffr  #(1)  fcram_mstr_ready_reg(cclk, reset,			 fcram_fflp_mstrready,		fio_mstr_ready);
dffr  #(1)  fcram_fatal_err_reg (cclk, reset,			 !fcram_fflp_fatal_err,		fio_no_fatal_err);
dffr  #(4)  fcram_data_ready_reg(cclk, reset, 			 fcram_fflp_data_ready,		fio_data_ready);
dffr  #(36) fcram_even_din_reg	(cclk, reset,                    fcram_fflp_even_din,		fc_even_din_reg_dout);
dffr  #(36) fcram_odd_din_reg	(cclk, reset,                    fcram_fflp_odd_din,		fc_odd_din_reg_dout);

//dffr  #(1)  fflp_fcram_cs_reg	(cclk, reset, 			 fcram_cmd_sm[1],		fflp_fcram_cs_l);
//dffr  #(1)  fflp_fcram_fn_reg	(cclk, reset, 			 fcram_cmd_sm[0],		fflp_fcram_fn);

dffr  #(1)  fflp_fcram_pd_reg	(cclk, reset,			 power_on_wait_cnt_done_r,	fflp_fcram_pd_l);
dffr  #(1)  fflp_fcram_ba0_reg	(cclk, reset, 			 fcram_ba0_sm,			fflp_fcram_ba0);
dffr  #(1)  fflp_fcram_ba1_reg	(cclk, reset, 			 fcram_ba1_sm,             	fflp_fcram_ba1);
dffr  #(2)  fflp_fcram_rd_en_reg(cclk, reset, 			 {2{fflp_fcram_rd_en_p}},     	fflp_fcram_rd_en);

always @ (posedge cclk)
if (reset)
	fflp_fcram_cs_l <= 1'b1;
else
	fflp_fcram_cs_l <= fcram_cmd_sm[1];

always @ (posedge cclk)
if (reset)
	fflp_fcram_fn <= 1'b0;
else
	fflp_fcram_fn <= fcram_cmd_sm[0];


/*******************************/
//Pipeline Control
/*******************************/
assign pio_fio_acc_en		= (pio_fio_latency == 2'b00) ? cpu_burst_done_12 : 
				  (pio_fio_latency == 2'b01) ? cpu_burst_done_13 :
				  (pio_fio_latency == 2'b10) ? cpu_burst_done_14 :
							       cpu_burst_done_15 ;

assign cpu_fc_req_done_p 	= pio_fio_acc_en_4 | pio_fio_acc_en_5 | pio_fio_acc_en_6;

assign fc_din_reg_dout		= {fc_odd_din_reg_dout, fc_even_din_reg_dout};
assign srch_burst_done_all	= srch_no_fc_done | srch_burst_done;
assign srch_fio_rd_en		= (pio_fio_latency == 2'b00) ? srch_fio_wait_3 : 
				  (pio_fio_latency == 2'b01) ? srch_fio_wait_4 : 
				  (pio_fio_latency == 2'b10) ? srch_fio_wait_5 :
							       srch_fio_wait_6;

assign srch_fio_rd_en_valid	= (srch_fio_rd_en & merg_bus_1_fc_lookup & fio_no_fatal_err);
assign srch_fio_rd_en_tmp       = srch_fio_rd_en_valid ? 1'b1 : 
                                  srch_fio_rd_en_8     ? 1'b0 : srch_fio_rd_en_p;

assign pio_fio_rd_en		= pio_fio_acc_en & pio_rd;
assign pio_fio_rd_en_1		= pio_fio_acc_en_1 & pio_rd;
assign pio_fio_rd_en_4		= pio_fio_acc_en_4 & pio_rd;

assign fflp_fcram_rd_en_p	= srch_fio_rd_en_p | pio_fio_rd_en | pio_fio_rd_en_1;

dffre #(72) fc_rd_data_reg	(cclk, reset, pio_fio_rd_en_4,	fc_din_reg_dout_r,	fc_rd_data_reg_dout); 
dffre #(1)  fc_rd_ecc_err_reg	(cclk, reset, pio_fio_rd_en_4,	ecc_check_err_all,	fc_rd_ecc_err);

dffr #(1) cpu_burst_done_reg    (cclk, reset, cpu_burst_done_sm,        cpu_burst_done);
dffr #(1) cpu_burst_done_1_reg  (cclk, reset, cpu_burst_done,           cpu_burst_done_1);
dffr #(1) cpu_burst_done_2_reg  (cclk, reset, cpu_burst_done_1,         cpu_burst_done_2);
dffr #(1) cpu_burst_done_3_reg  (cclk, reset, cpu_burst_done_2,         cpu_burst_done_3);
dffr #(1) cpu_burst_done_4_reg  (cclk, reset, cpu_burst_done_3,         cpu_burst_done_4);
dffr #(1) cpu_burst_done_5_reg  (cclk, reset, cpu_burst_done_4,         cpu_burst_done_5);
dffr #(1) cpu_burst_done_6_reg  (cclk, reset, cpu_burst_done_5,         cpu_burst_done_6);
dffr #(1) cpu_burst_done_7_reg  (cclk, reset, cpu_burst_done_6,         cpu_burst_done_7);
dffr #(1) cpu_burst_done_8_reg  (cclk, reset, cpu_burst_done_7,         cpu_burst_done_8);
dffr #(1) cpu_burst_done_9_reg  (cclk, reset, cpu_burst_done_8,         cpu_burst_done_9);
dffr #(1) cpu_burst_done_10_reg (cclk, reset, cpu_burst_done_9,         cpu_burst_done_10);
dffr #(1) cpu_burst_done_11_reg (cclk, reset, cpu_burst_done_10,        cpu_burst_done_11);
dffr #(1) cpu_burst_done_12_reg (cclk, reset, cpu_burst_done_11,        cpu_burst_done_12);
dffr #(1) cpu_burst_done_13_reg (cclk, reset, cpu_burst_done_12,        cpu_burst_done_13);
dffr #(1) cpu_burst_done_14_reg (cclk, reset, cpu_burst_done_13,        cpu_burst_done_14);
dffr #(1) cpu_burst_done_15_reg (cclk, reset, cpu_burst_done_14,        cpu_burst_done_15);

//for calculating fio read latency
dffr #(1) cpu_burst_done_16_reg (cclk, reset, cpu_burst_done_15,        cpu_burst_done_16);
dffr #(1) cpu_burst_done_17_reg (cclk, reset, cpu_burst_done_16,        cpu_burst_done_17);
dffr #(1) cpu_burst_done_18_reg (cclk, reset, cpu_burst_done_17,        cpu_burst_done_18);
dffr #(1) cpu_burst_done_19_reg (cclk, reset, cpu_burst_done_18,        cpu_burst_done_19);

dffr #(1) pio_fio_acc_en_1_reg	(cclk, reset, pio_fio_acc_en,		pio_fio_acc_en_1);
dffr #(1) pio_fio_acc_en_2_reg  (cclk, reset, pio_fio_acc_en_1,         pio_fio_acc_en_2);
dffr #(1) pio_fio_acc_en_3_reg  (cclk, reset, pio_fio_acc_en_2,         pio_fio_acc_en_3);
dffr #(1) pio_fio_acc_en_4_reg  (cclk, reset, pio_fio_acc_en_3,         pio_fio_acc_en_4);
dffr #(1) pio_fio_acc_en_5_reg  (cclk, reset, pio_fio_acc_en_4,         pio_fio_acc_en_5);
dffr #(1) pio_fio_acc_en_6_reg  (cclk, reset, pio_fio_acc_en_5,         pio_fio_acc_en_6);

dffr #(1) cpu_fc_req_done_reg	(cclk, reset, cpu_fc_req_done_p,	cpu_fc_req_done);

dffr #(1) srch_burst_done_reg	(cclk, reset, srch_burst_done_sm,	srch_burst_done);
dffr #(1) srch_burst_done_1_reg (cclk, reset, srch_burst_done_all,	srch_burst_done_1);
dffr #(1) srch_burst_done_2_reg (cclk, reset, srch_burst_done_1,	srch_burst_done_2);
dffr #(1) srch_burst_done_3_reg (cclk, reset, srch_burst_done_2,        srch_burst_done_3);

dffr #(1) srch_fio_wait_reg	(cclk, reset, srch_burst_done_3,        srch_fio_wait);
dffr #(1) srch_fio_wait_1_reg	(cclk, reset, srch_fio_wait,        	srch_fio_wait_1);
dffr #(1) srch_fio_wait_2_reg   (cclk, reset, srch_fio_wait_1,          srch_fio_wait_2);
dffr #(1) srch_fio_wait_3_reg   (cclk, reset, srch_fio_wait_2,          srch_fio_wait_3);
dffr #(1) srch_fio_wait_4_reg   (cclk, reset, srch_fio_wait_3,          srch_fio_wait_4);
dffr #(1) srch_fio_wait_5_reg   (cclk, reset, srch_fio_wait_4,          srch_fio_wait_5);
dffr #(1) srch_fio_wait_6_reg   (cclk, reset, srch_fio_wait_5,          srch_fio_wait_6);

dffr #(1) srch_fio_rd_en_1_reg  (cclk, reset, srch_fio_rd_en,           srch_fio_rd_en_1);
dffr #(1) srch_fio_rd_en_2_reg  (cclk, reset, srch_fio_rd_en_1,         srch_fio_rd_en_2);
dffr #(1) srch_fio_rd_en_3_reg  (cclk, reset, srch_fio_rd_en_2,         srch_fio_rd_en_3);
dffr #(1) srch_fio_rd_en_4_reg  (cclk, reset, srch_fio_rd_en_3,         srch_fio_rd_en_4);
dffr #(1) srch_fio_rd_en_5_reg  (cclk, reset, srch_fio_rd_en_4,         srch_fio_rd_en_5);
dffr #(1) srch_fio_rd_en_6_reg  (cclk, reset, srch_fio_rd_en_5,         srch_fio_rd_en_6);
dffr #(1) srch_fio_rd_en_7_reg  (cclk, reset, srch_fio_rd_en_6,         srch_fio_rd_en_7);
dffr #(1) srch_fio_rd_en_8_reg  (cclk, reset, srch_fio_rd_en_7,         srch_fio_rd_en_8);
dffr #(1) srch_fio_rd_en_p_reg	(cclk, reset, srch_fio_rd_en_tmp,	srch_fio_rd_en_p);

dffr #(1) fcram_ds_reg		(cclk, reset, fcram_ds_sm,		fcram_ds);
dffr #(1) fcram_ds_1_reg	(cclk, reset, fcram_ds,			fcram_ds_1);
dffr #(1) fcram_ds_2_reg	(cclk, reset, fcram_ds_1,		fcram_ds_2);
dffr #(1) fcram_ds_3_reg	(cclk, reset, fcram_ds_2,		fcram_ds_3);
dffr #(1) fcram_ds_4_reg	(cclk, reset, fcram_ds_3,		fcram_ds_4);
dffr #(1) fcram_ds_5_reg	(cclk, reset, fcram_ds_4,		fcram_ds_5);
dffr #(2) fcram_ds_6_reg	(cclk, reset, {2{fcram_ds_5}},		fflp_fcram_ds);

assign fflp_fcram_triz_en_l	= ~fflp_fcram_ds;

fflp_fcram_cntl_sm	fflp_fcram_cntl_sm_inst (
					.cclk				(cclk),	
					.reset				(reset),
					.fflp_init_done			(fflp_init_done),
					.fio_mstr_ready			(fio_mstr_ready),
					.fcram_refresh_timer_reg_dout	(fcram_refresh_timer_reg_dout),
					.do_srch_cycle			(do_srch_cycle),	
					.do_cpu_cycle			(do_cpu_cycle),
					.cpu_cmd			(cpu_cmd),
					.cpu_bk0			(cpu_bk0),		
					.cpu_bk1			(cpu_bk1),
					
					.fcram_cmd_sm			(fcram_cmd_sm),
					.fcram_ba0_sm			(fcram_ba0_sm),
					.fcram_ba1_sm			(fcram_ba1_sm),
					.fcram_addr_sel			(fcram_addr_sel),
					.fcram_addr_en			(fcram_addr_en),
					.fcram_ds_sm			(fcram_ds_sm),
					.fflp_fcram_slv_update		(fflp_fcram_slv_update),
					.srch_burst_done_sm		(srch_burst_done_sm),
					.cpu_burst_done_sm		(cpu_burst_done_sm),
					.power_on_wait_cnt_done_r	(power_on_wait_cnt_done_r),
					.fcram_sm_state			(fcram_sm_state)

					);


dffr #(64)	cpu_fc_data_r_reg	(cclk, reset, cpu_fc_data,			cpu_fc_data_r);
dffr #(72)	ecc_chk_cpu_fc_data_reg (cclk, reset, ecc_check_cpu_fc_data,		ecc_check_cpu_fc_data_r);
assign		cpu_fc_data_in =	{ecc_check_cpu_fc_data_r[7:0], ecc_check_cpu_fc_data_r[71:8]} ^ fcram_err_test_reg_dout[71:0];

niu_64data_ecc_generate niu_64data_ecc_generate_inst0 (
				.din		(cpu_fc_data_r),
				.dout		(ecc_check_cpu_fc_data)
				
				);

niu_64data_ecc_check    niu_64data_ecc_check_inst0 (
                                .din            ({fc_din_reg_dout[63:0], fc_din_reg_dout[71:64]}),
                                .dout           (fc_din_reg_dout_tmp),
                                .no_error       (ecc_no_error),
                                .error          (ecc_error),
                                .corr_error     (ecc_corr_error),
                                .uncorr_error   (ecc_check_err)

                                );

wire		ecc_check_err_in     = ecc_check_err & !disable_chksum;	//din_en_12
wire		ecc_corr_err_in	     = ecc_corr_error & !disable_chksum;
wire[71:0]	fc_din_reg_dout_tmp1 = {fc_din_reg_dout[71:64], fc_din_reg_dout_tmp[71:8]};

dffr #(72)     fc_din_reg_dout_r_reg   (cclk, reset, fc_din_reg_dout_tmp1, fc_din_reg_dout_r);  //enable by din_en_12
dffr #(1)      ecc_err_reg             (cclk, reset, ecc_check_err_in,     ecc_check_err_r);
dffr #(1)      ecc_corr_err_reg	       (cclk, reset, ecc_corr_err_in,	   ecc_corr_err_r);

assign	ecc_check_err_all    = ecc_check_err_r | ecc_corr_err_r;


/*************************/
//FIO Parallel Interface
/*************************/
assign cpu_fio_req_sync_p	= cpu_fio_req_sync & !cpu_fio_req_sync_r;
assign fcram_cfg_sel_in		= cpu_fio_req_sync_p ? 1'b1 :
				  fcram_cfg_done     ? 1'b0 : fflp_fcram_cfg_sel;

assign fcram_cfg_done_p		= fcram_cfg_done | fcram_cfg_done_r | fcram_cfg_done_r1;
assign fflp_fcram_cfg_addr	= fio_cfg_addr_reg_dout[7:0];
assign fflp_fcram_cfg_datwr	= pio_wr_data[15:0];
assign fflp_fcram_cfg_rd	= pio_rd;
assign fflp_fcram_cfg_rst	= pio_fio_cfg_reset;


dffr  #(1)	cpu_fio_req_sync_r_reg	(cclk, reset, cpu_fio_req_sync,		cpu_fio_req_sync_r);
dffr  #(1)	fflp_fcram_cfg_sel_reg	(cclk, reset, fcram_cfg_sel_in, 	fflp_fcram_cfg_sel);
dffr  #(1)	fcram_cfg_done_reg	(cclk, reset, fcram_fflp_cfg_done, 	fcram_cfg_done);
dffr  #(1)	fcram_cfg_err_reg	(cclk, reset, fcram_fflp_cfg_err,	fcram_cfg_err);
dffr  #(1)      fcram_cfg_done_r_reg	(cclk, reset, fcram_cfg_done, 		fcram_cfg_done_r);
dffr  #(1)	fcram_cfg_done_r1_reg	(cclk, reset, fcram_cfg_done_r, 	fcram_cfg_done_r1);
dffr  #(1)	cpu_fio_req_done_reg	(cclk, reset, fcram_cfg_done_p, 	cpu_fio_req_done);
dffr  #(16)	fcram_cfg_datrd_reg	(cclk, reset, fcram_fflp_cfg_datrd, 	fcram_cfg_datrd);

assign		cpu_fio_rd_data_tmp	= fcram_cfg_err ? 32'hdeadbeef : {16'b0, fcram_cfg_datrd[15:0]};

dffre #(32)	cpu_fio_rd_data_reg	(cclk, reset, fcram_cfg_done, 		cpu_fio_rd_data_tmp, cpu_fio_rd_data);

/***********************/
//Calculate fio latecy
/***********************/
assign		fflp_data_ready_p	= (&fio_data_ready) & !fflp_data_ready;

dffr #(1)	fflp_data_ready_reg	(cclk, reset, (&fio_data_ready),	fflp_data_ready);

assign		cpu_rd_latency0		= fflp_data_ready_p & cpu_burst_done_12;	//00
assign		cpu_rd_latency1		= fflp_data_ready_p & cpu_burst_done_13;
assign          cpu_rd_latency2         = fflp_data_ready_p & cpu_burst_done_14;
assign          cpu_rd_latency3         = fflp_data_ready_p & cpu_burst_done_15;
assign          cpu_rd_latency4         = fflp_data_ready_p & cpu_burst_done_16;
assign          cpu_rd_latency5         = fflp_data_ready_p & cpu_burst_done_17;	//01
assign          cpu_rd_latency6         = fflp_data_ready_p & cpu_burst_done_18;	//10
assign          cpu_rd_latency7         = fflp_data_ready_p & cpu_burst_done_19;	//11

assign		cpu_rd_latency_array	= {cpu_rd_latency7, cpu_rd_latency6, cpu_rd_latency5, cpu_rd_latency4,
					   cpu_rd_latency3, cpu_rd_latency2, cpu_rd_latency1, cpu_rd_latency0};

dffre #(8)	cpu_rd_latency_reg	(cclk, reset, fflp_data_ready_p,	cpu_rd_latency_array,	fio_cal_rd_latency);

endmodule
