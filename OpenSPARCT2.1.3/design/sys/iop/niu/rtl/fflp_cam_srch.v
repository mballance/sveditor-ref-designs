// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_cam_srch.v
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
/*module name:   fflp_cam_srch                                        */
/*description:                                                        */
/*               Controls CAM accesses for both CPU commands and      */
/*               flow lookups                                         */
/*                                                                    */
/*parent module in:          	                                      */
/*child modules in:  fflp_cam_srch_sm                                 */
/*interface modules:                                                  */
/*author name:       Jeanne Cai                                       */
/*date created:      10-03-04                                         */
/*                                                                    */
/*              Copyright (c) 2004, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/*modifications:                                                      */
/*                                                                    */
/**********************************************************************/

`include "fflp.h"

module fflp_cam_srch        
		(
		cclk,
		reset,
		cam_srch_latency,
		pio_disable_cam,
		fwd_sched,
		cpu_sched,
		key_bus,
		fwd_info_bus,
		cam_hit,
		cam_valid,
		cam_haddr,
		pio_rd_vld,
		cam_msk_dat_out,
		am_din_reg_dout,
		pio_wen,
		pio_addr,
		pio_32b_mode,
		pio_wr_data,

		cpu_req_cam_acc,
		ram_acc_type,
		kick_off_ram_ctrl,
		cam_haddr_reg1_dout,
		cam_index,
		cam_data_inp,
		cam_compare,
		cam_pio_wr,
		cam_pio_rd,
		cam_pio_sel,
		matchout_5,
		kick_off_ram_srch_4,
		kick_off_ram_srch_5,
		fwd_info_bus_2,
		key_ecc_data_2,
		cam_key_reg0_dout,
		cam_key_reg1_dout,
		cam_key_reg2_dout,
		cam_key_reg3_dout,
		cam_key_mask_reg0_dout,
		cam_key_mask_reg1_dout,
		cam_key_mask_reg2_dout,
		cam_key_mask_reg3_dout,
		cam_cmd_stat_reg_dout
		);
	
input		cclk;
input		reset;
input		pio_disable_cam;
input[3:0]	cam_srch_latency;
input		fwd_sched;
input		cpu_sched;
input[199:0]	key_bus;
input[445:0]	fwd_info_bus;
input		cam_hit;
input		cam_valid;
input[9:0]	cam_haddr;
input		pio_rd_vld;
input[199:0]	cam_msk_dat_out;
input[41:0]	am_din_reg_dout;
input		pio_wen;
input[19:0]	pio_addr;
input		pio_32b_mode;
input[63:0]	pio_wr_data;

output		cpu_req_cam_acc;
output[1:0]	ram_acc_type;
output		kick_off_ram_ctrl;
output[9:0]	cam_haddr_reg1_dout;
output[9:0]	cam_index;
output[199:0]	cam_data_inp;
output		cam_compare;
output		cam_pio_wr;
output		cam_pio_rd;
output		cam_pio_sel;
output		matchout_5;
output		kick_off_ram_srch_4;
output		kick_off_ram_srch_5;
output[445:0]	fwd_info_bus_2;
output[103:0]	key_ecc_data_2;
output[7:0]	cam_key_reg0_dout;
output[63:0]	cam_key_reg1_dout;
output[63:0]	cam_key_reg2_dout;
output[63:0]	cam_key_reg3_dout;
output[7:0]	cam_key_mask_reg0_dout;
output[63:0]	cam_key_mask_reg1_dout;
output[63:0]	cam_key_mask_reg2_dout;
output[63:0]	cam_key_mask_reg3_dout;
output[20:0]	cam_cmd_stat_reg_dout;

wire		srch_matchout_2;
wire		matchout_1_in;
wire		matchout_1;
wire		matchout_2;
wire		matchout_3;
wire		matchout_4;
wire		matchout_5;
wire		cpu_cmd_done;
wire		cpu_cmd_done_1;
wire		cpu_cmd_done_2;
wire		kick_off_ram_srch;
wire		kick_off_ram_srch_1;
wire		kick_off_ram_srch_2;
wire		kick_off_ram_srch_3;
wire		kick_off_ram_srch_4;
wire		kick_off_ram_srch_5;

wire[445:0]	fwd_info_bus_1;
wire[445:0]	fwd_info_bus_2;
wire[103:0]     key_ecc_data_1;
wire[103:0]     key_ecc_data_2;

reg		kick_off_ram_ctrl;
reg[1:0]	ram_acc_type;
reg		cpu_req_ram_done;

wire		do_srch_cycle;
wire		do_cpu_cycle;

wire		cpu_req_en;
wire		cpu_req_in;
wire		cpu_req;
wire		is_cpu_sched_en;
wire		is_cpu_sched_in;
wire		is_cpu_sched;

wire		cpu_req_ram_done_3_in;
wire		cpu_req_cam_rd_dly;
wire		cpu_req_cam_rd_done_1;
wire		cpu_req_cam_rd_done_2;
wire		cpu_req_cam_rd_done_3;
wire		cpu_req_cam_rd_done_4;
wire		cpu_req_cam_rd_done_5;
wire		cpu_req_cam_rd_done_6;
wire		cpu_req_cam_rd_done_7;
wire		cpu_req_cam_rd_done_8;
wire		cpu_req_ram_done_1;
wire		cpu_req_ram_done_2;
wire		cpu_req_ram_done_3;

wire		cam_key_reg0_en;
wire[7:0]	cam_key_reg0_in;
wire[7:0]	cam_key_reg0_dout;
wire		cam_key_reg1_en;
wire[31:0]	cam_key_reg1_in;
wire            cam_key_reg1_h_en;
wire[31:0]      cam_key_reg1_h_in;
wire[63:0]	cam_key_reg1_dout;
wire            cam_key_reg2_en;
wire[31:0]      cam_key_reg2_in;
wire            cam_key_reg2_h_en;
wire[31:0]      cam_key_reg2_h_in;
wire[63:0]      cam_key_reg2_dout;
wire            cam_key_reg3_en;
wire[31:0]      cam_key_reg3_in;
wire            cam_key_reg3_h_en;
wire[31:0]      cam_key_reg3_h_in;
wire[63:0]      cam_key_reg3_dout;
wire		cam_key_mask_reg0_en;
wire[7:0]	cam_key_mask_reg0_in;
wire[7:0]	cam_key_mask_reg0_dout;
wire		cam_key_mask_reg1_en;
wire[31:0]	cam_key_mask_reg1_in;
wire            cam_key_mask_reg1_h_en;
wire[31:0]      cam_key_mask_reg1_h_in;
wire[63:0]	cam_key_mask_reg1_dout;
wire            cam_key_mask_reg2_en;
wire[31:0]      cam_key_mask_reg2_in;
wire            cam_key_mask_reg2_h_en;
wire[31:0]      cam_key_mask_reg2_h_in;
wire[63:0]      cam_key_mask_reg2_dout;
wire            cam_key_mask_reg3_en;
wire[31:0]      cam_key_mask_reg3_in;
wire            cam_key_mask_reg3_h_en;
wire[31:0]      cam_key_mask_reg3_h_in;
wire[63:0]      cam_key_mask_reg3_dout;
wire		cam_cmd_stat_reg_en;
wire[20:0]	cam_cmd_stat_reg_in;
//wire[20:0]	cam_cmd_stat_reg_dout;

reg[20:0]	cam_cmd_stat_reg_dout;

wire		cam_pio_rd_in;
wire		cam_pio_sel_in;
wire[199:0]	cam_key_mask_data;
wire[199:0]	cam_key_data;
wire[199:0]	cam_key_data_mux;
wire[199:0]	data_inp_in;
wire[199:0]	cam_data_inp;
wire		cam_compare;
wire		cam_pio_wr;
wire		cam_pio_rd;
wire		cam_pio_sel;

wire		pio_rd_vld_1;
wire[9:0]	cam_haddr_reg1_dout;
wire[199:0]	cam_msk_dat_reg_dout;

wire[9:0]	cam_index;
wire		status_bit;
wire[2:0]	cpu_cmd;
wire		cpu_req_cam_rd;
wire		cpu_req_ram_rd;
wire		cpu_req_ram_wr;
wire		cpu_req_cam_acc;

wire		cam_match;
wire[9:0]	cam_loc;
wire		cpu_sched_done;
wire		cpu_req_done;
wire[20:0]	cam_ram_stat_dout;
wire		cpu_req_cam_rd_done;
wire		cam_pio_rd_sel;
wire		cam_key_reg_rd_en;
wire		cam_mask_reg_rd_en;

wire		cam_key_reg3_pio_wen;
wire		cam_key_reg2_pio_wen;
wire		cam_key_reg1_pio_wen;
wire		cam_key_reg0_pio_wen;
wire            cam_key_reg3_h_pio_wen;
wire            cam_key_reg2_h_pio_wen;
wire            cam_key_reg1_h_pio_wen;

wire		cam_key_mask_reg3_pio_wen;
wire		cam_key_mask_reg2_pio_wen;
wire		cam_key_mask_reg1_pio_wen;
wire		cam_key_mask_reg0_pio_wen;
wire            cam_key_mask_reg3_h_pio_wen;
wire            cam_key_mask_reg2_h_pio_wen;
wire            cam_key_mask_reg1_h_pio_wen;

wire		cam_cmd_stat_reg_pio_wen;

wire		cam_compare_sm;
wire		cam_pio_wr_sm;
wire		cam_pio_sel_sm;
wire[1:0]	data_inp_sel;
wire		data_inp_en;
wire		srch_wait_done;
wire		cpu_cmd_done_sm;
wire		kick_off_ram_srch_sm;
wire		new_cam_hit	= cam_hit & cam_valid;


/*********************************/
//CAM_RAM interface control
/*********************************/
assign matchout_1	= matchout_1_in & !pio_disable_cam;
assign srch_matchout_2	= (matchout_1 | matchout_2) & kick_off_ram_srch_2;

dffr #(1) matchout1_reg 	(cclk, reset, new_cam_hit, 		matchout_1_in);
dffr #(1) matchout2_reg 	(cclk, reset, matchout_1, 		matchout_2);
dffr #(1) matchout3_reg 	(cclk, reset, srch_matchout_2,		matchout_3);
dffr #(1) matchout4_reg 	(cclk, reset, matchout_3,		matchout_4);
dffr #(1) matchout5_reg		(cclk, reset, matchout_4,               matchout_5);
dffr #(1) cpu_cmd_done_reg	(cclk, reset, cpu_cmd_done_sm,  	cpu_cmd_done);
dffr #(1) cpu_cmd_done1_reg	(cclk, reset, cpu_cmd_done, 		cpu_cmd_done_1);
dffr #(1) cpu_cmd_done2_reg	(cclk, reset, cpu_cmd_done_1,           cpu_cmd_done_2);
dffr #(1) kick_off_ram_srch_reg (cclk, reset, kick_off_ram_srch_sm, 	kick_off_ram_srch);
dffr #(1) kick_off_ram_srch1_reg(cclk, reset, kick_off_ram_srch,	kick_off_ram_srch_1);
dffr #(1) kick_off_ram_srch2_reg(cclk, reset, kick_off_ram_srch_1,	kick_off_ram_srch_2);
dffr #(1) kick_off_ram_srch3_reg(cclk, reset, kick_off_ram_srch_2,	kick_off_ram_srch_3);
dffr #(1) kick_off_ram_srch4_reg(cclk, reset, kick_off_ram_srch_3,	kick_off_ram_srch_4);
dffr #(1) kick_off_ram_srch5_reg(cclk, reset, kick_off_ram_srch_4,      kick_off_ram_srch_5);

dffre #(446) fwd_info_bus_1_reg	(cclk, reset, srch_wait_done,      fwd_info_bus,   fwd_info_bus_1);
dffre #(446) fwd_info_bus_2_reg	(cclk, reset, kick_off_ram_srch_4, fwd_info_bus_1, fwd_info_bus_2);
dffre #(104) key_ecc_data_1_reg	(cclk, reset, srch_wait_done,	   key_bus[103:0], key_ecc_data_1);
dffre #(104) key_ecc_data_2_reg (cclk, reset, kick_off_ram_srch_4, key_ecc_data_1, key_ecc_data_2);

always @ (kick_off_ram_srch_2 or kick_off_ram_srch_3 or
	  kick_off_ram_srch_4 or kick_off_ram_srch_5 or
	  srch_matchout_2 or cpu_req_ram_rd or cpu_req_ram_wr) 
begin
	if (srch_matchout_2)
	begin
		ram_acc_type		= `RAM_RMW;
		kick_off_ram_ctrl       = 1'b1;
		cpu_req_ram_done	= 1'b0;
	end
	else if (kick_off_ram_srch_2 | kick_off_ram_srch_3 | kick_off_ram_srch_4 | kick_off_ram_srch_5)
	begin
		ram_acc_type		= `RAM_RMW;
		kick_off_ram_ctrl	= 1'b0;
		cpu_req_ram_done	= 1'b0;
	end 
	else if (cpu_req_ram_rd)
	begin
		ram_acc_type		= `RAM_R;
		kick_off_ram_ctrl	= 1'b1;
		cpu_req_ram_done        = 1'b1;
	end
	else if (cpu_req_ram_wr)
	begin
		ram_acc_type		= `RAM_W;
		kick_off_ram_ctrl	= 1'b1;
		cpu_req_ram_done	= 1'b1;
	end
	else
	begin
		ram_acc_type		= `RAM_R;
		kick_off_ram_ctrl	= 1'b0;
		cpu_req_ram_done	= 1'b0;
	end
end
	
/**********************************/
//CPU Command Interface
/**********************************/
assign cam_index	= cam_cmd_stat_reg_dout[9:0];
assign status_bit	= cam_cmd_stat_reg_dout[17];
assign cpu_cmd		= cam_cmd_stat_reg_dout[20:18];

assign cpu_req_cam_rd	= cpu_req & (cpu_cmd == `RD_CAM_KEY);
assign cpu_req_ram_rd	= cpu_req & (cpu_cmd == `RD_ASSOC_D);
assign cpu_req_ram_wr	= cpu_req & (cpu_cmd == `WR_ASSOC_D);
assign cpu_req_cam_acc	= cpu_req & !((cpu_cmd == `RD_CAM_KEY) | 
			  	      (cpu_cmd == `RD_ASSOC_D) | 
				      (cpu_cmd == `WR_ASSOC_D));

assign cam_match	= (matchout_1 | matchout_2) & cpu_cmd_done_2;
assign cam_loc		= cam_match ? cam_haddr_reg1_dout[9:0] : cam_index[9:0];
assign cpu_sched_done	= (cpu_sched | cpu_req_ram_done | cpu_req_cam_rd_done);
assign cpu_req_done	= (cpu_cmd_done_2 | cpu_req_ram_done_2 | cpu_req_cam_rd_done_8);
assign cam_ram_stat_dout= {cpu_cmd[2:0], cpu_req_done, cam_match, 6'b0, cam_loc[9:0]}; 

assign cpu_req_en	= cpu_sched_done | (!status_bit && !is_cpu_sched);
assign cpu_req_in	= cpu_sched_done ? 1'b0 : 1'b1;
assign is_cpu_sched_en	= cpu_sched_done | cpu_req_done;
assign is_cpu_sched_in	= cpu_sched_done ? 1'b1 : 1'b0;

dffre #(1) cpu_req_reg		(cclk, reset, cpu_req_en,      cpu_req_in,      cpu_req);
dffre #(1) is_cpu_sched_reg	(cclk, reset, is_cpu_sched_en, is_cpu_sched_in, is_cpu_sched);

/********************************/
//TCAM Read, ASSOC_D Read
/********************************/
assign cpu_req_ram_done_3_in		= cpu_req_ram_done_2 & (cpu_cmd == `RD_ASSOC_D);

dffr #(1) cpu_req_cam_rd_dly_reg	(cclk, reset, cpu_req_cam_rd, 		cpu_req_cam_rd_dly);
dffr #(1) cpu_req_cam_rd_done_1_reg	(cclk, reset, cpu_req_cam_rd_done,	cpu_req_cam_rd_done_1);
dffr #(1) cpu_req_cam_rd_done_2_reg	(cclk, reset, cpu_req_cam_rd_done_1,	cpu_req_cam_rd_done_2);
dffr #(1) cpu_req_cam_rd_done_3_reg	(cclk, reset, cpu_req_cam_rd_done_2,	cpu_req_cam_rd_done_3);
dffr #(1) cpu_req_cam_rd_done_4_reg	(cclk, reset, cpu_req_cam_rd_done_3,	cpu_req_cam_rd_done_4);
dffr #(1) cpu_req_cam_rd_done_5_reg	(cclk, reset, cpu_req_cam_rd_done_4,	cpu_req_cam_rd_done_5);
dffr #(1) cpu_req_cam_rd_done_6_reg     (cclk, reset, cpu_req_cam_rd_done_5,    cpu_req_cam_rd_done_6);
dffr #(1) cpu_req_cam_rd_done_7_reg     (cclk, reset, cpu_req_cam_rd_done_6,    cpu_req_cam_rd_done_7);
dffr #(1) cpu_req_cam_rd_done_8_reg     (cclk, reset, cpu_req_cam_rd_done_7,    cpu_req_cam_rd_done_8);
dffr #(1) cpu_req_ram_done_1_reg	(cclk, reset, cpu_req_ram_done,		cpu_req_ram_done_1);
dffr #(1) cpu_req_ram_done_2_reg	(cclk, reset, cpu_req_ram_done_1,	cpu_req_ram_done_2);
dffr #(1) cpu_req_ram_done_3_reg	(cclk, reset, cpu_req_ram_done_3_in,	cpu_req_ram_done_3);

assign cpu_req_cam_rd_done = cpu_req_cam_rd & !cpu_req_cam_rd_dly;
assign cam_pio_rd_sel	   = (cpu_req_cam_rd_done_2 | cpu_req_cam_rd_done_3) ? 1'b1 : 1'b0;
	
assign cam_key_reg_rd_en  = (cpu_req_cam_rd_done_5 | cpu_req_cam_rd_done_6) & pio_rd_vld_1;
assign cam_mask_reg_rd_en = (cpu_req_cam_rd_done_7 | cpu_req_cam_rd_done_8) & pio_rd_vld_1;


/********************************************/
//CAM-RAM PIO READ/WRITE 
/********************************************/
assign cam_key_reg0_pio_wen	= pio_wen & (pio_addr == 20'ha0090);
assign cam_key_reg1_pio_wen	= pio_wen & (pio_addr == 20'ha0098);
assign cam_key_reg2_pio_wen	= pio_wen & (pio_addr == 20'ha00a0);
assign cam_key_reg3_pio_wen	= pio_wen & (pio_addr == 20'ha00a8);

assign cam_key_reg1_h_pio_wen   = pio_wen & ((pio_addr == 20'ha0098) & !pio_32b_mode | (pio_addr == 20'ha009c) & pio_32b_mode);
assign cam_key_reg2_h_pio_wen   = pio_wen & ((pio_addr == 20'ha00a0) & !pio_32b_mode | (pio_addr == 20'ha00a4) & pio_32b_mode);
assign cam_key_reg3_h_pio_wen   = pio_wen & ((pio_addr == 20'ha00a8) & !pio_32b_mode | (pio_addr == 20'ha00ac) & pio_32b_mode);

assign cam_key_mask_reg0_pio_wen= pio_wen & (pio_addr == 20'ha00b0);
assign cam_key_mask_reg1_pio_wen= pio_wen & (pio_addr == 20'ha00b8);
assign cam_key_mask_reg2_pio_wen= pio_wen & (pio_addr == 20'ha00c0);
assign cam_key_mask_reg3_pio_wen= pio_wen & (pio_addr == 20'ha00c8);

assign cam_key_mask_reg1_h_pio_wen= pio_wen & ((pio_addr == 20'ha00b8) & !pio_32b_mode | (pio_addr == 20'ha00bc) & pio_32b_mode);
assign cam_key_mask_reg2_h_pio_wen= pio_wen & ((pio_addr == 20'ha00c0) & !pio_32b_mode | (pio_addr == 20'ha00c4) & pio_32b_mode);
assign cam_key_mask_reg3_h_pio_wen= pio_wen & ((pio_addr == 20'ha00c8) & !pio_32b_mode | (pio_addr == 20'ha00cc) & pio_32b_mode);

assign cam_cmd_stat_reg_pio_wen	= pio_wen & (pio_addr == 20'ha00d0);
	
assign cam_key_reg0_en		= cam_key_reg0_pio_wen | cam_key_reg_rd_en;
assign cam_key_reg0_in		= cam_key_reg_rd_en 	? cam_msk_dat_reg_dout[199:192]   : pio_wr_data[7:0]; 

assign cam_key_reg1_en		= cam_key_reg1_pio_wen | cam_key_reg_rd_en | cpu_req_ram_done_3;
assign cam_key_reg1_in		= cam_key_reg_rd_en	? cam_msk_dat_reg_dout[159:128]   :
				  cpu_req_ram_done_3    ? am_din_reg_dout[31:0] :
							  pio_wr_data[31:0];

assign cam_key_reg1_h_en	= cam_key_reg1_h_pio_wen | cam_key_reg_rd_en | cpu_req_ram_done_3;
assign cam_key_reg1_h_in	= cam_key_reg_rd_en	? cam_msk_dat_reg_dout[191:160]   :
				  cpu_req_ram_done_3	? {22'b0, am_din_reg_dout[41:32]} :
				  pio_32b_mode		? pio_wr_data[31:0]		  : pio_wr_data[63:32];

assign cam_key_reg2_en		= cam_key_reg2_pio_wen | cam_key_reg_rd_en;
assign cam_key_reg2_in		= cam_key_reg_rd_en	? cam_msk_dat_reg_dout[95:64]     : pio_wr_data[31:0];

assign cam_key_reg2_h_en        = cam_key_reg2_h_pio_wen | cam_key_reg_rd_en;
assign cam_key_reg2_h_in        = cam_key_reg_rd_en     ? cam_msk_dat_reg_dout[127:96]  : 
				  pio_32b_mode		? pio_wr_data[31:0]		: pio_wr_data[63:32];

assign cam_key_reg3_en		= cam_key_reg3_pio_wen | cam_key_reg_rd_en;
assign cam_key_reg3_in		= cam_key_reg_rd_en     ? cam_msk_dat_reg_dout[31:0] : pio_wr_data[31:0];

assign cam_key_reg3_h_en        = cam_key_reg3_h_pio_wen | cam_key_reg_rd_en;
assign cam_key_reg3_h_in        = cam_key_reg_rd_en     ? cam_msk_dat_reg_dout[63:32]   : 
                                  pio_32b_mode          ? pio_wr_data[31:0]             : pio_wr_data[63:32];


assign cam_key_mask_reg0_en	= cam_key_mask_reg0_pio_wen | cam_mask_reg_rd_en;
assign cam_key_mask_reg0_in	= cam_mask_reg_rd_en 	? cam_msk_dat_reg_dout[199:192] : pio_wr_data[7:0];

assign cam_key_mask_reg1_en	= cam_key_mask_reg1_pio_wen | cam_mask_reg_rd_en;
assign cam_key_mask_reg1_in	= cam_mask_reg_rd_en 	? cam_msk_dat_reg_dout[159:128] : pio_wr_data[31:0];

assign cam_key_mask_reg1_h_en   = cam_key_mask_reg1_h_pio_wen | cam_mask_reg_rd_en;
assign cam_key_mask_reg1_h_in   = cam_mask_reg_rd_en    ? cam_msk_dat_reg_dout[191:160] : 
				  pio_32b_mode		? pio_wr_data[31:0]		: pio_wr_data[63:32];

assign cam_key_mask_reg2_en     = cam_key_mask_reg2_pio_wen | cam_mask_reg_rd_en;
assign cam_key_mask_reg2_in     = cam_mask_reg_rd_en    ? cam_msk_dat_reg_dout[95:64] 	: pio_wr_data[31:0];

assign cam_key_mask_reg2_h_en   = cam_key_mask_reg2_h_pio_wen | cam_mask_reg_rd_en;
assign cam_key_mask_reg2_h_in   = cam_mask_reg_rd_en    ? cam_msk_dat_reg_dout[127:96] 	: 
                                  pio_32b_mode          ? pio_wr_data[31:0]             : pio_wr_data[63:32];

assign cam_key_mask_reg3_en     = cam_key_mask_reg3_pio_wen | cam_mask_reg_rd_en;
assign cam_key_mask_reg3_in     = cam_mask_reg_rd_en    ? cam_msk_dat_reg_dout[31:0] 	: pio_wr_data[31:0];

assign cam_key_mask_reg3_h_en   = cam_key_mask_reg3_h_pio_wen | cam_mask_reg_rd_en;
assign cam_key_mask_reg3_h_in   = cam_mask_reg_rd_en    ? cam_msk_dat_reg_dout[63:32]  	: 
                                  pio_32b_mode          ? pio_wr_data[31:0]             : pio_wr_data[63:32];

assign cam_cmd_stat_reg_en	= cam_cmd_stat_reg_pio_wen | cpu_req_done;
assign cam_cmd_stat_reg_in	= cpu_req_done ? cam_ram_stat_dout[20:0] : {pio_wr_data[20:16], 6'b0, pio_wr_data[9:0]};  

dffre #(8)  cam_key_reg0	(cclk, reset, cam_key_reg0_en, 		cam_key_reg0_in,	cam_key_reg0_dout[7:0]);
dffre #(32) cam_key_reg1_l	(cclk, reset, cam_key_reg1_en, 		cam_key_reg1_in,	cam_key_reg1_dout[31:0]);
dffre #(32) cam_key_reg2_l	(cclk, reset, cam_key_reg2_en,          cam_key_reg2_in,        cam_key_reg2_dout[31:0]);
dffre #(32) cam_key_reg3_l	(cclk, reset, cam_key_reg3_en,          cam_key_reg3_in,        cam_key_reg3_dout[31:0]);
dffre #(32) cam_key_reg1_h      (cclk, reset, cam_key_reg1_h_en,        cam_key_reg1_h_in,      cam_key_reg1_dout[63:32]);
dffre #(32) cam_key_reg2_h      (cclk, reset, cam_key_reg2_h_en,        cam_key_reg2_h_in,      cam_key_reg2_dout[63:32]);
dffre #(32) cam_key_reg3_h      (cclk, reset, cam_key_reg3_h_en,        cam_key_reg3_h_in,      cam_key_reg3_dout[63:32]);

dffre #(8)  cam_key_mask_reg0	(cclk, reset, cam_key_mask_reg0_en, 	cam_key_mask_reg0_in, 	cam_key_mask_reg0_dout[7:0]);
dffre #(32) cam_key_mask_reg1_l	(cclk, reset, cam_key_mask_reg1_en, 	cam_key_mask_reg1_in, 	cam_key_mask_reg1_dout[31:0]);
dffre #(32) cam_key_mask_reg2_l (cclk, reset, cam_key_mask_reg2_en,     cam_key_mask_reg2_in,   cam_key_mask_reg2_dout[31:0]);
dffre #(32) cam_key_mask_reg3_l (cclk, reset, cam_key_mask_reg3_en,     cam_key_mask_reg3_in,   cam_key_mask_reg3_dout[31:0]);
dffre #(32) cam_key_mask_reg1_h (cclk, reset, cam_key_mask_reg1_h_en,   cam_key_mask_reg1_h_in, cam_key_mask_reg1_dout[63:32]);
dffre #(32) cam_key_mask_reg2_h (cclk, reset, cam_key_mask_reg2_h_en,   cam_key_mask_reg2_h_in, cam_key_mask_reg2_dout[63:32]);
dffre #(32) cam_key_mask_reg3_h (cclk, reset, cam_key_mask_reg3_h_en,   cam_key_mask_reg3_h_in, cam_key_mask_reg3_dout[63:32]);

//dffre #(21) cam_cmd_stat_reg	(cclk, reset, cam_cmd_stat_reg_en,	cam_cmd_stat_reg_in,	cam_cmd_stat_reg_dout);

always @ (posedge cclk)
if (reset)
	cam_cmd_stat_reg_dout <= 21'b0_0010_0000_0000_0000_0000;
else if (cam_cmd_stat_reg_en)
	cam_cmd_stat_reg_dout <= cam_cmd_stat_reg_in;
else
	cam_cmd_stat_reg_dout <= cam_cmd_stat_reg_dout;

/********************************************/
//Search command decode
/********************************************/
dffr #(1) do_srch_cycle_reg (cclk, reset, fwd_sched, do_srch_cycle);
dffr #(1) do_cpu_cycle_reg  (cclk, reset, cpu_sched, do_cpu_cycle);

/*********************************/
//TCAM interface signals
/*********************************/
assign 	cam_pio_rd_in	= (cpu_req_cam_rd_done | cpu_req_cam_rd_done_1 | cpu_req_cam_rd_done_2 | cpu_req_cam_rd_done_3);
assign  cam_pio_sel_in	= (cam_pio_sel_sm | cam_pio_rd_sel);

assign  cam_key_mask_data	= {cam_key_mask_reg0_dout[7:0], cam_key_mask_reg1_dout[63:0],
				   cam_key_mask_reg2_dout[63:0], cam_key_mask_reg3_dout[63:0]};

assign  cam_key_data		= {cam_key_reg0_dout[7:0], cam_key_reg1_dout[63:0],
				   cam_key_reg2_dout[63:0], cam_key_reg3_dout[63:0]};

assign	cam_key_data_mux 	= data_inp_sel[0] ? cam_key_mask_data : cam_key_data;
	
assign  data_inp_in 		= data_inp_sel[1] ? cam_key_data_mux[199:0] : key_bus[199:0];

dffre #(200) cam_data_inp_reg	(cclk, reset,   data_inp_en,	data_inp_in,		 cam_data_inp);
dffr  #(1)   cam_compare_reg	(cclk, reset, 			cam_compare_sm,	 	 cam_compare);
dffr  #(1)   cam_pio_wr_reg	(cclk, reset, 			cam_pio_wr_sm, 		 cam_pio_wr);
dffr  #(1)   cam_pio_rd_reg	(cclk, reset, 			cam_pio_rd_in, 		 cam_pio_rd);
dffr  #(1)   cam_pio_sel_reg	(cclk, reset, 			cam_pio_sel_in,		 cam_pio_sel);

dffre #(10)  cam_haddr_reg1	(cclk, reset,   cam_valid,	cam_haddr[9:0], 	 cam_haddr_reg1_dout);
dffr  #(200) cam_msk_dat_reg	(cclk, reset,       		cam_msk_dat_out[199:0],  cam_msk_dat_reg_dout);
dffr  #(1)   pio_rd_vld_reg	(cclk, reset, 			pio_rd_vld,		 pio_rd_vld_1);


//instantiate state machine
fflp_cam_srch_sm fflp_cam_srch_sm_inst
		(
		.cclk			(cclk),
		.reset			(reset),
		.cam_srch_latency	(cam_srch_latency),
		.do_srch_cycle		(do_srch_cycle),
		.do_cpu_cycle		(do_cpu_cycle),
		.cpu_cmd		(cpu_cmd),

		.cam_compare_sm		(cam_compare_sm),
		.cam_pio_wr_sm		(cam_pio_wr_sm),
		.cam_pio_sel_sm		(cam_pio_sel_sm),
		.data_inp_sel		(data_inp_sel),
		.data_inp_en		(data_inp_en),
		.srch_wait_done		(srch_wait_done),
		.cpu_cmd_done_sm	(cpu_cmd_done_sm),
		.kick_off_ram_srch_sm	(kick_off_ram_srch_sm)
		);

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
