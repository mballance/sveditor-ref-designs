// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_fmon.v
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
`timescale 1ps/1ps
`define SMPL   100


`ifdef MCUSAT
  `include "mcu_dispmonDefines.vh"
`else
  `include "defines.vh"
  `include "dispmonDefines.vh"
`endif
module mcu_fmon();

`define		RD		3'h2
`define		WR		3'h3
`define		ACT		3'h4
`define	        WRDATA  	3'h5

`define         CMD_OTHER	3'h1
`define         CMD_OTHER_PDE	3'h2
`define		CMD_OTHER_SRPDX 3'h3
`define		CMD_OTHER_SRE   3'h4
`define         CMD_OTHER_REF	3'h5

// FBDIMM header defines
`define 	FBD_TS0_HDR 	12'hbfe
`define 	FBD_TS1_HDR 	12'hffe
`define 	FBD_TS2_HDR 	12'h7fe
`define 	FBD_TS3_HDR 	12'h3fe

reg enabled;
reg mcu_bug_111483;
reg mcu_bug_111547;
reg mcu_bug_111811;
reg ras_corner_case;
reg first_time=1'b1;
reg mcu0_fastreset;
wire woq0_wrq_clr0;
assign woq0_wrq_clr0 = `MCU0.drif.reqq.woq.woq0_wr_queue_clear[0];

//---------------------------
// Training Seq Err Inj Init Signals
//---------------------------

reg mcu0_training_err_enable,mcu1_training_err_enable,mcu2_training_err_enable,mcu3_training_err_enable;

//----------------------------
// L0s State Checker Signals
//----------------------------

wire l1clk = `MCU0.fbdic.l1clk;

wire fbdic_l0s_enable_0 = `MCU0.fbdic.fbdic_l0s_enable;
wire fbdic_l0s_enable_1 = `MCU1.fbdic.fbdic_l0s_enable;
wire fbdic_l0s_enable_2 = `MCU2.fbdic.fbdic_l0s_enable;
wire fbdic_l0s_enable_3 = `MCU3.fbdic.fbdic_l0s_enable;

wire fbdic_l0s_stall_0 = `MCU0.fbdic.fbdic_l0s_stall_in;
wire fbdic_l0s_stall_1 = `MCU1.fbdic.fbdic_l0s_stall_in;
wire fbdic_l0s_stall_2 = `MCU2.fbdic.fbdic_l0s_stall_in;
wire fbdic_l0s_stall_3 = `MCU3.fbdic.fbdic_l0s_stall_in;

wire fbdic_sync_frame_req_0 = `MCU0.fbdic_sync_frame_req;
wire fbdic_sync_frame_req_1 = `MCU1.fbdic_sync_frame_req;
wire fbdic_sync_frame_req_2 = `MCU2.fbdic_sync_frame_req;
wire fbdic_sync_frame_req_3 = `MCU3.fbdic_sync_frame_req;

//----------------------------------
// Power Down Mode Checker Signals
//----------------------------------

wire fbdic_mcu_idle_0 		  = `MCU0.fbdic.fbdic_mcu_idle;
wire fbdic_mcu_idle_1 		  = `MCU1.fbdic.fbdic_mcu_idle;
wire fbdic_mcu_idle_2 		  = `MCU2.fbdic.fbdic_mcu_idle;
wire fbdic_mcu_idle_3 		  = `MCU3.fbdic.fbdic_mcu_idle;

wire drif_pd_mode_enter_pending_0 = `MCU0.drif.drif_pd_mode_enter_pending;
wire drif_pd_mode_enter_pending_1 = `MCU1.drif.drif_pd_mode_enter_pending;
wire drif_pd_mode_enter_pending_2 = `MCU2.drif.drif_pd_mode_enter_pending;
wire drif_pd_mode_enter_pending_3 = `MCU3.drif.drif_pd_mode_enter_pending;

wire drif_pd_mode_exit_pending_0  = `MCU0.drif.drif_pd_mode_exit_pending;
wire drif_pd_mode_exit_pending_1  = `MCU1.drif.drif_pd_mode_exit_pending;
wire drif_pd_mode_exit_pending_2  = `MCU2.drif.drif_pd_mode_exit_pending;
wire drif_pd_mode_exit_pending_3  = `MCU3.drif.drif_pd_mode_exit_pending;

wire drif_pd_mode_enable_0 	  = `MCU0.drif.drif_pd_mode_enable;
wire drif_pd_mode_enable_1 	  = `MCU1.drif.drif_pd_mode_enable;
wire drif_pd_mode_enable_2 	  = `MCU2.drif.drif_pd_mode_enable;
wire drif_pd_mode_enable_3 	  = `MCU3.drif.drif_pd_mode_enable;


wire pdmc_pd_cnt_is_zero_00 = `MCU0.drif.pdmc0.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_01 = `MCU0.drif.pdmc1.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_02 = `MCU0.drif.pdmc2.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_03 = `MCU0.drif.pdmc3.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_04 = `MCU0.drif.pdmc4.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_05 = `MCU0.drif.pdmc5.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_06 = `MCU0.drif.pdmc6.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_07 = `MCU0.drif.pdmc7.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_08 = `MCU0.drif.pdmc8.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_09 = `MCU0.drif.pdmc9.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_0a = `MCU0.drif.pdmc10.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_0b = `MCU0.drif.pdmc11.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_0c = `MCU0.drif.pdmc12.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_0d = `MCU0.drif.pdmc13.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_0e = `MCU0.drif.pdmc14.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_0f = `MCU0.drif.pdmc15.pdmc_pd_cnt_is_zero;

wire [3:0] pdmc_state_00 = `MCU0.drif.pdmc0.pdmc_state;
wire [3:0] pdmc_state_01 = `MCU0.drif.pdmc1.pdmc_state;
wire [3:0] pdmc_state_02 = `MCU0.drif.pdmc2.pdmc_state;
wire [3:0] pdmc_state_03 = `MCU0.drif.pdmc3.pdmc_state;
wire [3:0] pdmc_state_04 = `MCU0.drif.pdmc4.pdmc_state;
wire [3:0] pdmc_state_05 = `MCU0.drif.pdmc5.pdmc_state;
wire [3:0] pdmc_state_06 = `MCU0.drif.pdmc6.pdmc_state;
wire [3:0] pdmc_state_07 = `MCU0.drif.pdmc7.pdmc_state;
wire [3:0] pdmc_state_08 = `MCU0.drif.pdmc8.pdmc_state;
wire [3:0] pdmc_state_09 = `MCU0.drif.pdmc9.pdmc_state;
wire [3:0] pdmc_state_0a = `MCU0.drif.pdmc10.pdmc_state;
wire [3:0] pdmc_state_0b = `MCU0.drif.pdmc11.pdmc_state;
wire [3:0] pdmc_state_0c = `MCU0.drif.pdmc12.pdmc_state;
wire [3:0] pdmc_state_0d = `MCU0.drif.pdmc13.pdmc_state;
wire [3:0] pdmc_state_0e = `MCU0.drif.pdmc14.pdmc_state;
wire [3:0] pdmc_state_0f = `MCU0.drif.pdmc15.pdmc_state;

wire [15:0] mcu0_drif_pde_issued = `MCU0.drif.drif_pde_issued[15:0];
wire [15:0] mcu0_drif_pdx_issued = `MCU0.drif.drif_pdx_issued[15:0];
reg mcu0_start_pd_check_0 = 0;
reg mcu0_start_pd_check_1 = 0;
reg mcu0_start_pd_check_2 = 0;
reg mcu0_start_pd_check_3 = 0;
reg mcu0_start_pd_check_4 = 0;
reg mcu0_start_pd_check_5 = 0;
reg mcu0_start_pd_check_6 = 0;
reg mcu0_start_pd_check_7 = 0;
reg mcu0_start_pd_check_8 = 0;
reg mcu0_start_pd_check_9 = 0;
reg mcu0_start_pd_check_a = 0;
reg mcu0_start_pd_check_b = 0;
reg mcu0_start_pd_check_c = 0;
reg mcu0_start_pd_check_d = 0;
reg mcu0_start_pd_check_e = 0;
reg mcu0_start_pd_check_f = 0;

wire pdmc_pd_cnt_is_zero_10 = `MCU1.drif.pdmc0.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_11 = `MCU1.drif.pdmc1.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_12 = `MCU1.drif.pdmc2.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_13 = `MCU1.drif.pdmc3.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_14 = `MCU1.drif.pdmc4.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_15 = `MCU1.drif.pdmc5.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_16 = `MCU1.drif.pdmc6.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_17 = `MCU1.drif.pdmc7.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_18 = `MCU1.drif.pdmc8.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_19 = `MCU1.drif.pdmc9.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_1a = `MCU1.drif.pdmc10.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_1b = `MCU1.drif.pdmc11.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_1c = `MCU1.drif.pdmc12.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_1d = `MCU1.drif.pdmc13.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_1e = `MCU1.drif.pdmc14.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_1f = `MCU1.drif.pdmc15.pdmc_pd_cnt_is_zero;

wire pdmc_pd_cnt_is_zero_20 = `MCU2.drif.pdmc0.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_21 = `MCU2.drif.pdmc1.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_22 = `MCU2.drif.pdmc2.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_23 = `MCU2.drif.pdmc3.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_24 = `MCU2.drif.pdmc4.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_25 = `MCU2.drif.pdmc5.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_26 = `MCU2.drif.pdmc6.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_27 = `MCU2.drif.pdmc7.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_28 = `MCU2.drif.pdmc8.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_29 = `MCU2.drif.pdmc9.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_2a = `MCU2.drif.pdmc10.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_2b = `MCU2.drif.pdmc11.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_2c = `MCU2.drif.pdmc12.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_2d = `MCU2.drif.pdmc13.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_2e = `MCU2.drif.pdmc14.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_2f = `MCU2.drif.pdmc15.pdmc_pd_cnt_is_zero;

wire pdmc_pd_cnt_is_zero_30 = `MCU3.drif.pdmc0.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_31 = `MCU3.drif.pdmc1.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_32 = `MCU3.drif.pdmc2.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_33 = `MCU3.drif.pdmc3.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_34 = `MCU3.drif.pdmc4.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_35 = `MCU3.drif.pdmc5.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_36 = `MCU3.drif.pdmc6.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_37 = `MCU3.drif.pdmc7.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_38 = `MCU3.drif.pdmc8.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_39 = `MCU3.drif.pdmc9.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_3a = `MCU3.drif.pdmc10.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_3b = `MCU3.drif.pdmc11.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_3c = `MCU3.drif.pdmc12.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_3d = `MCU3.drif.pdmc13.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_3e = `MCU3.drif.pdmc14.pdmc_pd_cnt_is_zero;
wire pdmc_pd_cnt_is_zero_3f = `MCU3.drif.pdmc15.pdmc_pd_cnt_is_zero;

wire [15:0] pdmc_pd_cnt_is_zero_0 = {pdmc_pd_cnt_is_zero_0f,
                                     pdmc_pd_cnt_is_zero_0e,
                                     pdmc_pd_cnt_is_zero_0d,
                                     pdmc_pd_cnt_is_zero_0c,
                                     pdmc_pd_cnt_is_zero_0b,
                                     pdmc_pd_cnt_is_zero_0a,
                                     pdmc_pd_cnt_is_zero_09,
                                     pdmc_pd_cnt_is_zero_08,
                                     pdmc_pd_cnt_is_zero_07,
                                     pdmc_pd_cnt_is_zero_06,
                                     pdmc_pd_cnt_is_zero_05,
                                     pdmc_pd_cnt_is_zero_04,
                                     pdmc_pd_cnt_is_zero_03,
                                     pdmc_pd_cnt_is_zero_02,
                                     pdmc_pd_cnt_is_zero_01,
                                     pdmc_pd_cnt_is_zero_00};
reg [15:0] pdmc_pd_cnt_is_zero_0_d;

wire [15:0] pdmc_pd_cnt_is_zero_1 = {pdmc_pd_cnt_is_zero_1f,
                                     pdmc_pd_cnt_is_zero_1e,
                                     pdmc_pd_cnt_is_zero_1d,
                                     pdmc_pd_cnt_is_zero_1c,
                                     pdmc_pd_cnt_is_zero_1b,
                                     pdmc_pd_cnt_is_zero_1a,
                                     pdmc_pd_cnt_is_zero_19,
                                     pdmc_pd_cnt_is_zero_18,
                                     pdmc_pd_cnt_is_zero_17,
                                     pdmc_pd_cnt_is_zero_16,
                                     pdmc_pd_cnt_is_zero_15,
                                     pdmc_pd_cnt_is_zero_14,
                                     pdmc_pd_cnt_is_zero_13,
                                     pdmc_pd_cnt_is_zero_12,
                                     pdmc_pd_cnt_is_zero_11,
                                     pdmc_pd_cnt_is_zero_10};

wire [15:0] pdmc_pd_cnt_is_zero_2 = {pdmc_pd_cnt_is_zero_2f,
                                     pdmc_pd_cnt_is_zero_2e,
                                     pdmc_pd_cnt_is_zero_2d,
                                     pdmc_pd_cnt_is_zero_2c,
                                     pdmc_pd_cnt_is_zero_2b,
                                     pdmc_pd_cnt_is_zero_2a,
                                     pdmc_pd_cnt_is_zero_29,
                                     pdmc_pd_cnt_is_zero_28,
                                     pdmc_pd_cnt_is_zero_27,
                                     pdmc_pd_cnt_is_zero_26,
                                     pdmc_pd_cnt_is_zero_25,
                                     pdmc_pd_cnt_is_zero_24,
                                     pdmc_pd_cnt_is_zero_23,
                                     pdmc_pd_cnt_is_zero_22,
                                     pdmc_pd_cnt_is_zero_21,
                                     pdmc_pd_cnt_is_zero_20};

wire [15:0] pdmc_pd_cnt_is_zero_3 = {pdmc_pd_cnt_is_zero_3f,
                                     pdmc_pd_cnt_is_zero_3e,
                                     pdmc_pd_cnt_is_zero_3d,
                                     pdmc_pd_cnt_is_zero_3c,
                                     pdmc_pd_cnt_is_zero_3b,
                                     pdmc_pd_cnt_is_zero_3a,
                                     pdmc_pd_cnt_is_zero_39,
                                     pdmc_pd_cnt_is_zero_38,
                                     pdmc_pd_cnt_is_zero_37,
                                     pdmc_pd_cnt_is_zero_36,
                                     pdmc_pd_cnt_is_zero_35,
                                     pdmc_pd_cnt_is_zero_34,
                                     pdmc_pd_cnt_is_zero_33,
                                     pdmc_pd_cnt_is_zero_32,
                                     pdmc_pd_cnt_is_zero_31,
                                     pdmc_pd_cnt_is_zero_30};

//-------------------------------------
// Arbiter Checker Signals
//-------------------------------------

wire drif0_rd_picked_0 = `MCU0.drif.drif0_rd_picked;
wire drif0_err_rd_picked_0 = `MCU0.drif.drif0_err_rd_picked;
wire drif1_rd_picked_0 = `MCU0.drif.drif1_rd_picked;
wire drif1_err_rd_picked_0 = `MCU0.drif.drif1_err_rd_picked;
wire drif0_wr_picked_0 = `MCU0.drif.drif0_wr_picked;
wire drif0_err_wr_picked_0 = `MCU0.drif.drif0_err_wr_picked;
wire drif1_wr_picked_0 = `MCU0.drif.drif1_wr_picked;
wire drif1_err_wr_picked_0 = `MCU0.drif.drif1_err_wr_picked;
wire drif_scrub_picked_0 = `MCU0.drif.drif_scrub_picked;
wire drif_refresh_req_picked_0 = `MCU0.drif.drif_refresh_req_picked;
wire [9:0] drif_req_picked_0 = {drif_refresh_req_picked_0,
                                drif_scrub_picked_0,
                                drif1_err_wr_picked_0,
                                drif1_wr_picked_0,
                                drif0_err_wr_picked_0,
                                drif0_wr_picked_0,
                                drif1_err_rd_picked_0,
                                drif1_rd_picked_0,
                                drif0_err_rd_picked_0,
                                drif0_rd_picked_0};
//-------------------------------------
// IBIST Checker Signals
//-------------------------------------
wire [1:0] ibist_rx_errstat_0 = `MCU0.fbdic.fbdic_nbfibportctl[7:6];
wire [1:0] ibist_rx_errstat_1 = `MCU1.fbdic.fbdic_nbfibportctl[7:6];
wire [1:0] ibist_rx_errstat_2 = `MCU2.fbdic.fbdic_nbfibportctl[7:6];
wire [1:0] ibist_rx_errstat_3 = `MCU3.fbdic.fbdic_nbfibportctl[7:6];

//-------------------------------------
// Link WMR protect Signals
//-------------------------------------
wire rst_wmr_protect = `CPU.rst_wmr_protect;

wire [119:0] mcu_fsr0_data_0 = `MCU0.fdout.mcu_fsr0_data[119:0];
wire [119:0] mcu_fsr1_data_0 = `MCU0.fdout.mcu_fsr1_data[119:0];
wire [119:0] mcu_fsr0_data_1 = `MCU1.fdout.mcu_fsr0_data[119:0];
wire [119:0] mcu_fsr1_data_1 = `MCU1.fdout.mcu_fsr1_data[119:0];
wire [119:0] mcu_fsr0_data_2 = `MCU2.fdout.mcu_fsr0_data[119:0];
wire [119:0] mcu_fsr1_data_2 = `MCU2.fdout.mcu_fsr1_data[119:0];
wire [119:0] mcu_fsr0_data_3 = `MCU3.fdout.mcu_fsr0_data[119:0];
wire [119:0] mcu_fsr1_data_3 = `MCU3.fdout.mcu_fsr1_data[119:0];

//-------------------------------------
// WOQ (Dq) Monitor Signals
//-------------------------------------

wire [1:0] drif_woq_free_0 = `MCU0.drif.reqq.woq.drif_woq_free;
wire [1:0] drif_woq_free_1 = `MCU1.drif.reqq.woq.drif_woq_free;
wire [1:0] drif_woq_free_2 = `MCU2.drif.reqq.woq.drif_woq_free;
wire [1:0] drif_woq_free_3 = `MCU3.drif.reqq.woq.drif_woq_free;

//-----------------------
// FBDIC Checker Signals
//-----------------------

wire drl2clk 	             = `MCU0.fbdic.drl2clk;	
wire l2clk 	             = `MCU0.l2clk;	
wire sclk		     = tb_top.dram_12x_clk;

wire [2:0] mcu0_drif_dram_cmd_a   = `MCU0.fbdic.drif_dram_cmd_a; 
wire [2:0] mcu0_drif_dram_bank_a  = `MCU0.fbdic.drif_dram_bank_a; 
wire [2:0] mcu0_drif_dram_dimm_a  = `MCU0.fbdic.drif_dram_dimm_a; 
wire [15:0] mcu0_drif_dram_addr_a = `MCU0.fbdic.drif_dram_addr_a;
wire mcu0_drif_dram_rank_a        = `MCU0.fbdic.drif_dram_rank_a;

wire [2:0] mcu0_drif_dram_cmd_b   = `MCU0.fbdic.drif_dram_cmd_b; 
wire [2:0] mcu0_drif_dram_bank_b  = `MCU0.fbdic.drif_dram_bank_b; 
wire [2:0] mcu0_drif_dram_dimm_b  = `MCU0.fbdic.drif_dram_dimm_b; 
wire [15:0] mcu0_drif_dram_addr_b = `MCU0.fbdic.drif_dram_addr_b;
wire mcu0_drif_dram_rank_b        = `MCU0.fbdic.drif_dram_rank_b;

wire [2:0] mcu0_drif_dram_cmd_c   = `MCU0.fbdic.drif_dram_cmd_c; 
wire [2:0] mcu0_drif_dram_bank_c  = `MCU0.fbdic.drif_dram_bank_c; 
wire [2:0] mcu0_drif_dram_dimm_c  = `MCU0.fbdic.drif_dram_dimm_c; 
wire [15:0] mcu0_drif_dram_addr_c = `MCU0.fbdic.drif_dram_addr_c;
wire mcu0_drif_dram_rank_c        = `MCU0.fbdic.drif_dram_rank_c;

wire [2:0] mcu1_drif_dram_cmd_a   = `MCU1.fbdic.drif_dram_cmd_a; 
wire [2:0] mcu1_drif_dram_bank_a  = `MCU1.fbdic.drif_dram_bank_a; 
wire [2:0] mcu1_drif_dram_dimm_a  = `MCU1.fbdic.drif_dram_dimm_a; 
wire [15:0] mcu1_drif_dram_addr_a = `MCU1.fbdic.drif_dram_addr_a;
wire mcu1_drif_dram_rank_a        = `MCU1.fbdic.drif_dram_rank_a;

wire [2:0] mcu1_drif_dram_cmd_b   = `MCU1.fbdic.drif_dram_cmd_b; 
wire [2:0] mcu1_drif_dram_bank_b  = `MCU1.fbdic.drif_dram_bank_b; 
wire [2:0] mcu1_drif_dram_dimm_b  = `MCU1.fbdic.drif_dram_dimm_b; 
wire [15:0] mcu1_drif_dram_addr_b = `MCU1.fbdic.drif_dram_addr_b;
wire mcu1_drif_dram_rank_b        = `MCU1.fbdic.drif_dram_rank_b;

wire [2:0] mcu1_drif_dram_cmd_c   = `MCU1.fbdic.drif_dram_cmd_c; 
wire [2:0] mcu1_drif_dram_bank_c  = `MCU1.fbdic.drif_dram_bank_c; 
wire [2:0] mcu1_drif_dram_dimm_c  = `MCU1.fbdic.drif_dram_dimm_c; 
wire [15:0] mcu1_drif_dram_addr_c = `MCU1.fbdic.drif_dram_addr_c;
wire mcu1_drif_dram_rank_c        = `MCU1.fbdic.drif_dram_rank_c;

wire [2:0] mcu2_drif_dram_cmd_a   = `MCU2.fbdic.drif_dram_cmd_a; 
wire [2:0] mcu2_drif_dram_bank_a  = `MCU2.fbdic.drif_dram_bank_a; 
wire [2:0] mcu2_drif_dram_dimm_a  = `MCU2.fbdic.drif_dram_dimm_a; 
wire [15:0] mcu2_drif_dram_addr_a = `MCU2.fbdic.drif_dram_addr_a;
wire mcu2_drif_dram_rank_a        = `MCU2.fbdic.drif_dram_rank_a;

wire [2:0] mcu2_drif_dram_cmd_b   = `MCU2.fbdic.drif_dram_cmd_b; 
wire [2:0] mcu2_drif_dram_bank_b  = `MCU2.fbdic.drif_dram_bank_b; 
wire [2:0] mcu2_drif_dram_dimm_b  = `MCU2.fbdic.drif_dram_dimm_b; 
wire [15:0] mcu2_drif_dram_addr_b = `MCU2.fbdic.drif_dram_addr_b;
wire mcu2_drif_dram_rank_b        = `MCU2.fbdic.drif_dram_rank_b;

wire [2:0] mcu2_drif_dram_cmd_c   = `MCU2.fbdic.drif_dram_cmd_c; 
wire [2:0] mcu2_drif_dram_bank_c  = `MCU2.fbdic.drif_dram_bank_c; 
wire [2:0] mcu2_drif_dram_dimm_c  = `MCU2.fbdic.drif_dram_dimm_c; 
wire [15:0] mcu2_drif_dram_addr_c = `MCU2.fbdic.drif_dram_addr_c;
wire mcu2_drif_dram_rank_c        = `MCU2.fbdic.drif_dram_rank_c;

wire [2:0] mcu3_drif_dram_cmd_a   = `MCU3.fbdic.drif_dram_cmd_a; 
wire [2:0] mcu3_drif_dram_bank_a  = `MCU3.fbdic.drif_dram_bank_a; 
wire [2:0] mcu3_drif_dram_dimm_a  = `MCU3.fbdic.drif_dram_dimm_a; 
wire [15:0] mcu3_drif_dram_addr_a = `MCU3.fbdic.drif_dram_addr_a;
wire mcu3_drif_dram_rank_a        = `MCU3.fbdic.drif_dram_rank_a;

wire [2:0] mcu3_drif_dram_cmd_b   = `MCU3.fbdic.drif_dram_cmd_b; 
wire [2:0] mcu3_drif_dram_bank_b  = `MCU3.fbdic.drif_dram_bank_b; 
wire [2:0] mcu3_drif_dram_dimm_b  = `MCU3.fbdic.drif_dram_dimm_b; 
wire [15:0] mcu3_drif_dram_addr_b = `MCU3.fbdic.drif_dram_addr_b;
wire mcu3_drif_dram_rank_b        = `MCU3.fbdic.drif_dram_rank_b;

wire [2:0] mcu3_drif_dram_cmd_c   = `MCU3.fbdic.drif_dram_cmd_c; 
wire [2:0] mcu3_drif_dram_bank_c  = `MCU3.fbdic.drif_dram_bank_c; 
wire [2:0] mcu3_drif_dram_dimm_c  = `MCU3.fbdic.drif_dram_dimm_c; 
wire [15:0] mcu3_drif_dram_addr_c = `MCU3.fbdic.drif_dram_addr_c;
wire mcu3_drif_dram_rank_c        = `MCU3.fbdic.drif_dram_rank_c;

reg [15:0] mcu0_drif_dram_ras_addr_a;
reg [15:0] mcu0_drif_dram_ras_addr_b;
reg [15:0] mcu0_drif_dram_ras_addr_c;

reg [15:0] mcu1_drif_dram_ras_addr_a;
reg [15:0] mcu1_drif_dram_ras_addr_b;
reg [15:0] mcu1_drif_dram_ras_addr_c;

reg [15:0] mcu2_drif_dram_ras_addr_a;
reg [15:0] mcu2_drif_dram_ras_addr_b;
reg [15:0] mcu2_drif_dram_ras_addr_c;

reg [15:0] mcu3_drif_dram_ras_addr_a;
reg [15:0] mcu3_drif_dram_ras_addr_b;
reg [15:0] mcu3_drif_dram_ras_addr_c;

reg [39:0] mcu0_physical_addr_a;
reg [39:0] mcu0_physical_addr_b;
reg [39:0] mcu0_physical_addr_c;

reg [39:0] mcu1_physical_addr_a;
reg [39:0] mcu1_physical_addr_b;
reg [39:0] mcu1_physical_addr_c;

reg [39:0] mcu2_physical_addr_a;
reg [39:0] mcu2_physical_addr_b;
reg [39:0] mcu2_physical_addr_c;

reg [39:0] mcu3_physical_addr_a;
reg [39:0] mcu3_physical_addr_b;
reg [39:0] mcu3_physical_addr_c;

wire [7:0] fbdic_fbd_state_0 = `MCU0.fbdic.fbdic_fbd_state;
wire [7:0] fbdic_fbd_state_1 = `MCU1.fbdic.fbdic_fbd_state;
wire [7:0] fbdic_fbd_state_2 = `MCU2.fbdic.fbdic_fbd_state;
wire [7:0] fbdic_fbd_state_3 = `MCU3.fbdic.fbdic_fbd_state;

wire [9:0] fbdimm0a_tx_p_top = tb_top.fbdimm0a_tx_p_top;
wire [9:0] fbdimm0b_tx_p_top = tb_top.fbdimm0b_tx_p_top;
wire [9:0] fbdimm1a_tx_p_top = tb_top.fbdimm1a_tx_p_top;
wire [9:0] fbdimm1b_tx_p_top = tb_top.fbdimm1b_tx_p_top;
wire [9:0] fbdimm2a_tx_p_top = tb_top.fbdimm2a_tx_p_top;
wire [9:0] fbdimm2b_tx_p_top = tb_top.fbdimm2b_tx_p_top;
wire [9:0] fbdimm3a_tx_p_top = tb_top.fbdimm3a_tx_p_top;
wire [9:0] fbdimm3b_tx_p_top = tb_top.fbdimm3b_tx_p_top;

wire [9:0] fbdimm0a_tx_n_top = tb_top.fbdimm0a_tx_n_top;
wire [9:0] fbdimm0b_tx_n_top = tb_top.fbdimm0b_tx_n_top;
wire [9:0] fbdimm1a_tx_n_top = tb_top.fbdimm1a_tx_n_top;
wire [9:0] fbdimm1b_tx_n_top = tb_top.fbdimm1b_tx_n_top;
wire [9:0] fbdimm2a_tx_n_top = tb_top.fbdimm2a_tx_n_top;
wire [9:0] fbdimm2b_tx_n_top = tb_top.fbdimm2b_tx_n_top;
wire [9:0] fbdimm3a_tx_n_top = tb_top.fbdimm3a_tx_n_top;
wire [9:0] fbdimm3b_tx_n_top = tb_top.fbdimm3b_tx_n_top;

wire [14:0] fbdimm0a_rx_p_top = tb_top.fbdimm0a_rx_p_top;
wire [14:0] fbdimm0b_rx_p_top = tb_top.fbdimm0b_rx_p_top;
wire [14:0] fbdimm1a_rx_p_top = tb_top.fbdimm1a_rx_p_top;
wire [14:0] fbdimm1b_rx_p_top = tb_top.fbdimm1b_rx_p_top;
wire [14:0] fbdimm2a_rx_p_top = tb_top.fbdimm2a_rx_p_top;
wire [14:0] fbdimm2b_rx_p_top = tb_top.fbdimm2b_rx_p_top;
wire [14:0] fbdimm3a_rx_p_top = tb_top.fbdimm3a_rx_p_top;
wire [14:0] fbdimm3b_rx_p_top = tb_top.fbdimm3b_rx_p_top;

wire [14:0] fbdimm0a_rx_n_top = tb_top.fbdimm0a_rx_n_top;
wire [14:0] fbdimm0b_rx_n_top = tb_top.fbdimm0b_rx_n_top;
wire [14:0] fbdimm1a_rx_n_top = tb_top.fbdimm1a_rx_n_top;
wire [14:0] fbdimm1b_rx_n_top = tb_top.fbdimm1b_rx_n_top;
wire [14:0] fbdimm2a_rx_n_top = tb_top.fbdimm2a_rx_n_top;
wire [14:0] fbdimm2b_rx_n_top = tb_top.fbdimm2b_rx_n_top;
wire [14:0] fbdimm3a_rx_n_top = tb_top.fbdimm3a_rx_n_top;
wire [14:0] fbdimm3b_rx_n_top = tb_top.fbdimm3b_rx_n_top;

reg  [11:0] sync_frame_UI_err_0a; 
reg  [11:0] sync_frame_UI_err_0b; 
reg  [11:0] sync_frame_UI_err_1a; 
reg  [11:0] sync_frame_UI_err_1b; 
reg  [11:0] sync_frame_UI_err_2a; 
reg  [11:0] sync_frame_UI_err_2b; 
reg  [11:0] sync_frame_UI_err_3a; 
reg  [11:0] sync_frame_UI_err_3b; 

reg	    chnl_type;		// Dual Channel or Single Channel
reg	    rank_addr;		// RANK HI addr = 1, RANK LOW addr = 0
reg  [2:0]  num_dimms;		// DIMM NUMBERS: 1, 2, 4, 6, 8
reg	    rank;		// 1 RANK or 2 RANKS
reg  [1:0]  dimm_size ;

wire [15:0] fbdic_failover_config_0 = `MCU0.fbdic.fbdic_failover_config ;
wire [15:0] fbdic_failover_config_1 = `MCU1.fbdic.fbdic_failover_config ;
wire [15:0] fbdic_failover_config_2 = `MCU2.fbdic.fbdic_failover_config ;
wire [15:0] fbdic_failover_config_3 = `MCU3.fbdic.fbdic_failover_config ;

wire fbdic_l0_state_0 = `MCU0.fbdic.fbdic_l0_state ;
wire fbdic_l0_state_1 = `MCU1.fbdic.fbdic_l0_state ;
wire fbdic_l0_state_2 = `MCU2.fbdic.fbdic_l0_state ;
wire fbdic_l0_state_3 = `MCU3.fbdic.fbdic_l0_state ;

reg  [9:0] mcu0_clk_train_pat0;
reg  [9:0] mcu0_clk_train_pat1;
reg  [9:0] mcu1_clk_train_pat0;
reg  [9:0] mcu1_clk_train_pat1;
reg  [9:0] mcu2_clk_train_pat0;
reg  [9:0] mcu2_clk_train_pat1;
reg  [9:0] mcu3_clk_train_pat0;
reg  [9:0] mcu3_clk_train_pat1;

wire mcu0_fbdic_f_1_l = `MCU0.fbdiwr.fbdic_f_1_l ;
wire mcu1_fbdic_f_1_l = `MCU1.fbdiwr.fbdic_f_1_l ;
wire mcu2_fbdic_f_1_l = `MCU2.fbdiwr.fbdic_f_1_l ;
wire mcu3_fbdic_f_1_l = `MCU3.fbdiwr.fbdic_f_1_l ;

wire [1:0] mcu0_fbdic_f = `MCU0.fbdiwr.fbdic_f ;
wire [1:0] mcu1_fbdic_f = `MCU1.fbdiwr.fbdic_f ;
wire [1:0] mcu2_fbdic_f = `MCU2.fbdiwr.fbdic_f ;
wire [1:0] mcu3_fbdic_f = `MCU3.fbdiwr.fbdic_f ;

wire [71:0] mcu0_fbdiwr_bc_cmd_data0 = `MCU0.fbdiwr.fbdiwr_bc_cmd_data0 ;
wire [71:0] mcu0_fbdiwr_bc_cmd_data1 = `MCU0.fbdiwr.fbdiwr_bc_cmd_data1 ;
wire [71:0] mcu1_fbdiwr_bc_cmd_data0 = `MCU1.fbdiwr.fbdiwr_bc_cmd_data0 ;
wire [71:0] mcu1_fbdiwr_bc_cmd_data1 = `MCU1.fbdiwr.fbdiwr_bc_cmd_data1 ;
wire [71:0] mcu2_fbdiwr_bc_cmd_data0 = `MCU2.fbdiwr.fbdiwr_bc_cmd_data0 ;
wire [71:0] mcu2_fbdiwr_bc_cmd_data1 = `MCU2.fbdiwr.fbdiwr_bc_cmd_data1 ;
wire [71:0] mcu3_fbdiwr_bc_cmd_data0 = `MCU3.fbdiwr.fbdiwr_bc_cmd_data0 ;
wire [71:0] mcu3_fbdiwr_bc_cmd_data1 = `MCU3.fbdiwr.fbdiwr_bc_cmd_data1 ;

reg  [1:0] mcu0_fbdic_f_1_cnt;
reg  [1:0] mcu1_fbdic_f_1_cnt;
reg  [1:0] mcu2_fbdic_f_1_cnt;
reg  [1:0] mcu3_fbdic_f_1_cnt;

reg  [2:0] mcu0_wdata_dimm;
reg  [2:0] mcu1_wdata_dimm;
reg  [2:0] mcu2_wdata_dimm;
reg  [2:0] mcu3_wdata_dimm;

reg  sync_collision_check_enable;

reg  mcu0_l2t_mecc_err_r3_detected;
reg  mcu0_l2t0_scb_mecc_err_detected;
reg  mcu1_l2t_mecc_err_r3_detected;
reg  mcu1_l2t0_scb_mecc_err_detected;
reg  mcu2_l2t_mecc_err_r3_detected;
reg  mcu2_l2t0_scb_mecc_err_detected;
reg  mcu3_l2t_mecc_err_r3_detected;
reg  mcu3_l2t0_scb_mecc_err_detected;

//-------------------------------------------------
// Warm Protect (mcu_fbd_protect) checker signals
//-------------------------------------------------

//wire mcu0_rst_mcu_fbd_protect = `MCU0.rst_mcu_fbd_protect ;
//wire mcu1_rst_mcu_fbd_protect = `MCU1.rst_mcu_fbd_protect ;
//wire mcu2_rst_mcu_fbd_protect = `MCU2.rst_mcu_fbd_protect ;
//wire mcu3_rst_mcu_fbd_protect = `MCU3.rst_mcu_fbd_protect ;

//--------------------------------------
// Wr/Rd Cnfg CMDS : TID Checker signals
//--------------------------------------

reg  fbdic0_last_tid_0;
reg  fbdic0_last_tid_1;
reg  fbdic0_last_tid_2;
reg  fbdic0_last_tid_3;

reg  fbdic1_last_tid_0;
reg  fbdic1_last_tid_1;
reg  fbdic1_last_tid_2;
reg  fbdic1_last_tid_3;

wire fbdic_trans_id_0;
wire fbdic_trans_id_1;
wire fbdic_trans_id_2;
wire fbdic_trans_id_3;

reg  chnl_0;
reg  chnl_1;
reg  chnl_2;
reg  chnl_3;

wire [31:0] drif_ucb_addr_0 = `MCU0.fbdic.drif_ucb_addr;
wire [31:0] drif_ucb_addr_1 = `MCU1.fbdic.drif_ucb_addr;
wire [31:0] drif_ucb_addr_2 = `MCU2.fbdic.drif_ucb_addr;
wire [31:0] drif_ucb_addr_3 = `MCU3.fbdic.drif_ucb_addr;

wire [63:0] drif_ucb_data_0 = `MCU0.fbdic.drif_ucb_data;
wire [63:0] drif_ucb_data_1 = `MCU1.fbdic.drif_ucb_data;
wire [63:0] drif_ucb_data_2 = `MCU2.fbdic.drif_ucb_data;
wire [63:0] drif_ucb_data_3 = `MCU3.fbdic.drif_ucb_data;

wire fbdic_config_reg_write_0 = `MCU0.fbdic.fbdic_config_reg_write;
wire fbdic_config_reg_write_1 = `MCU1.fbdic.fbdic_config_reg_write;
wire fbdic_config_reg_write_2 = `MCU2.fbdic.fbdic_config_reg_write;
wire fbdic_config_reg_write_3 = `MCU3.fbdic.fbdic_config_reg_write;

wire drif_ucb_wr_req_vld_0 = `MCU0.fbdic.drif_ucb_wr_req_vld;
wire drif_ucb_wr_req_vld_1 = `MCU1.fbdic.drif_ucb_wr_req_vld;
wire drif_ucb_wr_req_vld_2 = `MCU2.fbdic.drif_ucb_wr_req_vld;
wire drif_ucb_wr_req_vld_3 = `MCU3.fbdic.drif_ucb_wr_req_vld;

//-----------------------------------
// Readdp data X checkers/monitors
//-----------------------------------

wire mcu0_rdpctl_l2t0_data_valid = `MCU0.rdpctl.rdpctl_l2t0_data_valid;
wire mcu0_rdpctl_l2t1_data_valid = `MCU0.rdpctl.rdpctl_l2t1_data_valid;
wire mcu1_rdpctl_l2t0_data_valid = `MCU1.rdpctl.rdpctl_l2t0_data_valid;
wire mcu1_rdpctl_l2t1_data_valid = `MCU1.rdpctl.rdpctl_l2t1_data_valid;
wire mcu2_rdpctl_l2t0_data_valid = `MCU2.rdpctl.rdpctl_l2t0_data_valid;
wire mcu2_rdpctl_l2t1_data_valid = `MCU2.rdpctl.rdpctl_l2t1_data_valid;
wire mcu3_rdpctl_l2t0_data_valid = `MCU3.rdpctl.rdpctl_l2t0_data_valid;
wire mcu3_rdpctl_l2t1_data_valid = `MCU3.rdpctl.rdpctl_l2t1_data_valid;

wire [127:0] mcu0_rddata_0 = `MCU0.readdp0.rddata[127:0] ;
wire [127:0] mcu0_rddata_1 = `MCU0.readdp1.rddata[127:0] ;
wire [127:0] mcu1_rddata_0 = `MCU1.readdp0.rddata[127:0] ;
wire [127:0] mcu1_rddata_1 = `MCU1.readdp1.rddata[127:0] ;
wire [127:0] mcu2_rddata_0 = `MCU2.readdp0.rddata[127:0] ;
wire [127:0] mcu2_rddata_1 = `MCU2.readdp1.rddata[127:0] ;
wire [127:0] mcu3_rddata_0 = `MCU3.readdp0.rddata[127:0] ;
wire [127:0] mcu3_rddata_1 = `MCU3.readdp1.rddata[127:0] ;

//-----------------------------------------------
// SYNC & STATUS Frames Checker Signals
//----------------------------------------------- 

wire [5:0] mcu0_fbdic_sync_frm_period = `MCU0.fbdic.fbdic_sync_frm_period;
wire [5:0] mcu1_fbdic_sync_frm_period = `MCU1.fbdic.fbdic_sync_frm_period;
wire [5:0] mcu2_fbdic_sync_frm_period = `MCU2.fbdic.fbdic_sync_frm_period;
wire [5:0] mcu3_fbdic_sync_frm_period = `MCU3.fbdic.fbdic_sync_frm_period;

wire [15:0] mcu0_fbdic_chnl_read_lat = `MCU0.fbdic.fbdic_chnl_read_lat;
wire [15:0] mcu1_fbdic_chnl_read_lat = `MCU1.fbdic.fbdic_chnl_read_lat;
wire [15:0] mcu2_fbdic_chnl_read_lat = `MCU2.fbdic.fbdic_chnl_read_lat;
wire [15:0] mcu3_fbdic_chnl_read_lat = `MCU3.fbdic.fbdic_chnl_read_lat;

wire mcu0_fbdic_sync_frame_req = `MCU0.fbdic.fbdic_sync_frame_req;
wire mcu1_fbdic_sync_frame_req = `MCU1.fbdic.fbdic_sync_frame_req;
wire mcu2_fbdic_sync_frame_req = `MCU2.fbdic.fbdic_sync_frame_req;
wire mcu3_fbdic_sync_frame_req = `MCU3.fbdic.fbdic_sync_frame_req;

wire mcu0_fbdic_status_frame = `MCU0.fbdic.fbdic_status_frame;
wire mcu1_fbdic_status_frame = `MCU1.fbdic.fbdic_status_frame;
wire mcu2_fbdic_status_frame = `MCU2.fbdic.fbdic_status_frame;
wire mcu3_fbdic_status_frame = `MCU3.fbdic.fbdic_status_frame;

wire [1:0] mcu0_fbdic_sync_sd = `MCU0.fbdic.fbdic_sync_sd;
wire [1:0] mcu1_fbdic_sync_sd = `MCU1.fbdic.fbdic_sync_sd;
wire [1:0] mcu2_fbdic_sync_sd = `MCU2.fbdic.fbdic_sync_sd;
wire [1:0] mcu3_fbdic_sync_sd = `MCU3.fbdic.fbdic_sync_sd;

integer mcu0_chnl_lat,mcu0_chnl_lat_int;
integer mcu1_chnl_lat,mcu1_chnl_lat_int;
integer mcu2_chnl_lat,mcu2_chnl_lat_int;
integer mcu3_chnl_lat,mcu3_chnl_lat_int;

integer mcu0_sync_sd;
integer mcu1_sync_sd;
integer mcu2_sync_sd;
integer mcu3_sync_sd;

integer dummy;

//-----------------------------------------------
// SOFT CHANNEL RESET (SCR) Frame Checker Signals
//----------------------------------------------- 

wire mcu0_fbdic_scr_frame_req = `MCU0.fbdic.fbdic_scr_frame_req;
wire mcu1_fbdic_scr_frame_req = `MCU1.fbdic.fbdic_scr_frame_req;
wire mcu2_fbdic_scr_frame_req = `MCU2.fbdic.fbdic_scr_frame_req;
wire mcu3_fbdic_scr_frame_req = `MCU3.fbdic.fbdic_scr_frame_req;

wire mcu0_fbdic_scr_response_frame = `MCU0.fbdic.fbdic_scr_response_frame;
wire mcu1_fbdic_scr_response_frame = `MCU1.fbdic.fbdic_scr_response_frame;
wire mcu2_fbdic_scr_response_frame = `MCU2.fbdic.fbdic_scr_response_frame;
wire mcu3_fbdic_scr_response_frame = `MCU3.fbdic.fbdic_scr_response_frame;

wire mcu0_fbdic_scr = `MCU0.fbdic.fbdic_scr;
wire mcu1_fbdic_scr = `MCU1.fbdic.fbdic_scr;
wire mcu2_fbdic_scr = `MCU2.fbdic.fbdic_scr;
wire mcu3_fbdic_scr = `MCU3.fbdic.fbdic_scr;

reg [2:0] mcu0_drif_dram_cmd_a_prev;
reg [2:0] mcu0_drif_dram_cmd_b_prev;
reg [2:0] mcu0_drif_dram_cmd_c_prev;

reg [2:0] mcu1_drif_dram_cmd_a_prev;
reg [2:0] mcu1_drif_dram_cmd_b_prev;
reg [2:0] mcu1_drif_dram_cmd_c_prev;

reg [2:0] mcu2_drif_dram_cmd_a_prev;
reg [2:0] mcu2_drif_dram_cmd_b_prev;
reg [2:0] mcu2_drif_dram_cmd_c_prev;

reg [2:0] mcu3_drif_dram_cmd_a_prev;
reg [2:0] mcu3_drif_dram_cmd_b_prev;
reg [2:0] mcu3_drif_dram_cmd_c_prev;

//--------------------------------------
// Status Parity Error
//--------------------------------------

wire mcu0_fbdic_status_parity_error = `MCU0.fbdic.fbdic_status_parity_error;
wire mcu1_fbdic_status_parity_error = `MCU1.fbdic.fbdic_status_parity_error;
wire mcu2_fbdic_status_parity_error = `MCU2.fbdic.fbdic_status_parity_error;
wire mcu3_fbdic_status_parity_error = `MCU3.fbdic.fbdic_status_parity_error;

//--------------------------------------
// Status Alert Bit Error
//--------------------------------------

wire mcu0_fbdic_status_alert_error = `MCU0.fbdic.fbdic_alert_asserted;
wire mcu1_fbdic_status_alert_error = `MCU1.fbdic.fbdic_alert_asserted;
wire mcu2_fbdic_status_alert_error = `MCU2.fbdic.fbdic_alert_asserted;
wire mcu3_fbdic_status_alert_error = `MCU3.fbdic.fbdic_alert_asserted;

//--------------------------------------
// Status Alert Frame Error
//--------------------------------------

wire mcu0_fbdic_alert_frame = `MCU0.fbdic.fbdic_alert_frame;
wire mcu1_fbdic_alert_frame = `MCU1.fbdic.fbdic_alert_frame;
wire mcu2_fbdic_alert_frame = `MCU2.fbdic.fbdic_alert_frame;
wire mcu3_fbdic_alert_frame = `MCU3.fbdic.fbdic_alert_frame;

//----------------------------
// FBD Init Signals
//----------------------------

wire mcu0_fbdic_fast_reset = `MCU0.fbdic.fbdic_fast_reset;
wire mcu1_fbdic_fast_reset = `MCU1.fbdic.fbdic_fast_reset;
wire mcu2_fbdic_fast_reset = `MCU2.fbdic.fbdic_fast_reset;
wire mcu3_fbdic_fast_reset = `MCU3.fbdic.fbdic_fast_reset;

wire [13:0] mcu0_fbd0_elect_idle = `MCU0.fbdic.fbd0_elect_idle;
wire [13:0] mcu1_fbd0_elect_idle = `MCU1.fbdic.fbd0_elect_idle;
wire [13:0] mcu2_fbd0_elect_idle = `MCU2.fbdic.fbd0_elect_idle;
wire [13:0] mcu3_fbd0_elect_idle = `MCU3.fbdic.fbd0_elect_idle;

wire [13:0] mcu0_fbd1_elect_idle = `MCU0.fbdic.fbd1_elect_idle;
wire [13:0] mcu1_fbd1_elect_idle = `MCU1.fbdic.fbd1_elect_idle;
wire [13:0] mcu2_fbd1_elect_idle = `MCU2.fbdic.fbd1_elect_idle;
wire [13:0] mcu3_fbd1_elect_idle = `MCU3.fbdic.fbd1_elect_idle;

wire mcu0_fbdic_tdisable_done = `MCU0.fbdic.fbdic_tdisable_done;
wire mcu1_fbdic_tdisable_done = `MCU1.fbdic.fbdic_tdisable_done;
wire mcu2_fbdic_tdisable_done = `MCU2.fbdic.fbdic_tdisable_done;
wire mcu3_fbdic_tdisable_done = `MCU3.fbdic.fbdic_tdisable_done;

wire mcu0_fbdic_tcalibrate_done = `MCU0.fbdic.fbdic_tcalibrate_done;
wire mcu1_fbdic_tcalibrate_done = `MCU1.fbdic.fbdic_tcalibrate_done;
wire mcu2_fbdic_tcalibrate_done = `MCU2.fbdic.fbdic_tcalibrate_done;
wire mcu3_fbdic_tcalibrate_done = `MCU3.fbdic.fbdic_tcalibrate_done;

wire [1:0] mcu0_fbdic_tclktrain_done = `MCU0.fbdic.fbdic_tclktrain_done;
wire [1:0] mcu1_fbdic_tclktrain_done = `MCU1.fbdic.fbdic_tclktrain_done;
wire [1:0] mcu2_fbdic_tclktrain_done = `MCU2.fbdic.fbdic_tclktrain_done;
wire [1:0] mcu3_fbdic_tclktrain_done = `MCU3.fbdic.fbdic_tclktrain_done;

wire [1:0] mcu0_fbdic_testing_done = `MCU0.fbdic.fbdic_testing_done;
wire [1:0] mcu1_fbdic_testing_done = `MCU1.fbdic.fbdic_testing_done;
wire [1:0] mcu2_fbdic_testing_done = `MCU2.fbdic.fbdic_testing_done;
wire [1:0] mcu3_fbdic_testing_done = `MCU3.fbdic.fbdic_testing_done;

wire [1:0] mcu0_fbdic_polling_done = `MCU0.fbdic.fbdic_polling_done;
wire [1:0] mcu1_fbdic_polling_done = `MCU1.fbdic.fbdic_polling_done;
wire [1:0] mcu2_fbdic_polling_done = `MCU2.fbdic.fbdic_polling_done;
wire [1:0] mcu3_fbdic_polling_done = `MCU3.fbdic.fbdic_polling_done;

wire [1:0] mcu0_fbdic_config_done = `MCU0.fbdic.fbdic_config_done;
wire [1:0] mcu1_fbdic_config_done = `MCU1.fbdic.fbdic_config_done;
wire [1:0] mcu2_fbdic_config_done = `MCU2.fbdic.fbdic_config_done;
wire [1:0] mcu3_fbdic_config_done = `MCU3.fbdic.fbdic_config_done;

reg enidl_chk_on;

//--------------------------------------
// CRC RETRY : BEFORE WRITE QUEUE EMPTY; WR SENT TO WRONG LOCATION
//--------------------------------------

wire mcu0_crc_retry_wr_q_not_empty = `MCU0.drif.drif_wr_picked & (|(`MCU0.drif.drif_err_state[4:1]));

wire mcu1_crc_retry_wr_q_not_empty = `MCU1.drif.drif_wr_picked & (|(`MCU1.drif.drif_err_state[4:1]));

wire mcu2_crc_retry_wr_q_not_empty = `MCU2.drif.drif_wr_picked & (|(`MCU2.drif.drif_err_state[4:1]));

wire mcu3_crc_retry_wr_q_not_empty = `MCU3.drif.drif_wr_picked & (|(`MCU3.drif.drif_err_state[4:1]));

//--------------------------------------
// Collision : Alertframe and CRC Error assert at the same time
//--------------------------------------

wire mcu0_alertframe_crc_error = `MCU0.drif.drif_err_state[4] & `MCU0.fbdic.fbdic_err_state[5];
wire mcu1_alertframe_crc_error = `MCU1.drif.drif_err_state[4] & `MCU1.fbdic.fbdic_err_state[5];
wire mcu2_alertframe_crc_error = `MCU2.drif.drif_err_state[4] & `MCU2.fbdic.fbdic_err_state[5];
wire mcu3_alertframe_crc_error = `MCU3.drif.drif_err_state[4] & `MCU3.fbdic.fbdic_err_state[5];

//------------------------------------------------
// Arbitration/Collision Signals
//------------------------------------------------

wire mcu0_drif_ucb_wr_req_vld = `MCU0.fbdic.drif_ucb_wr_req_vld;
wire mcu1_drif_ucb_wr_req_vld = `MCU1.fbdic.drif_ucb_wr_req_vld;
wire mcu2_drif_ucb_wr_req_vld = `MCU2.fbdic.drif_ucb_wr_req_vld;
wire mcu3_drif_ucb_wr_req_vld = `MCU3.fbdic.drif_ucb_wr_req_vld;

wire mcu0_drif_ucb_rd_req_vld = `MCU0.fbdic.drif_ucb_rd_req_vld;
wire mcu1_drif_ucb_rd_req_vld = `MCU1.fbdic.drif_ucb_rd_req_vld;
wire mcu2_drif_ucb_rd_req_vld = `MCU2.fbdic.drif_ucb_rd_req_vld;
wire mcu3_drif_ucb_rd_req_vld = `MCU3.fbdic.drif_ucb_rd_req_vld;

reg mcu0_drif_ucb_wr_req_vld_REG;
reg mcu1_drif_ucb_wr_req_vld_REG;
reg mcu2_drif_ucb_wr_req_vld_REG;
reg mcu3_drif_ucb_wr_req_vld_REG;

reg mcu0_drif_ucb_rd_req_vld_REG;
reg mcu1_drif_ucb_rd_req_vld_REG;
reg mcu2_drif_ucb_rd_req_vld_REG;
reg mcu3_drif_ucb_rd_req_vld_REG;

reg [2:0] mcu0_drif_dram_cmd_a_REG;
reg [2:0] mcu0_drif_dram_cmd_b_REG;
reg [2:0] mcu0_drif_dram_cmd_c_REG;

reg [2:0] mcu1_drif_dram_cmd_a_REG;
reg [2:0] mcu1_drif_dram_cmd_b_REG;
reg [2:0] mcu1_drif_dram_cmd_c_REG;

reg [2:0] mcu2_drif_dram_cmd_a_REG;
reg [2:0] mcu2_drif_dram_cmd_b_REG;
reg [2:0] mcu2_drif_dram_cmd_c_REG;

reg [2:0] mcu3_drif_dram_cmd_a_REG;
reg [2:0] mcu3_drif_dram_cmd_b_REG;
reg [2:0] mcu3_drif_dram_cmd_c_REG;

//---------------------------
// Refresh Checker Signals
//---------------------------

wire [4:0] mcu0_drif_mcu_state_next = `MCU0.drif.drif_mcu_state_next;
wire [4:0] mcu1_drif_mcu_state_next = `MCU1.drif.drif_mcu_state_next;
wire [4:0] mcu2_drif_mcu_state_next = `MCU2.drif.drif_mcu_state_next;
wire [4:0] mcu3_drif_mcu_state_next = `MCU3.drif.drif_mcu_state_next;

integer ref_state5_cycle_0 = 0;
integer ref_state5_cycle_1 = 0;
integer ref_state5_cycle_2 = 0;
integer ref_state5_cycle_3 = 0;

integer ref_state6_cycle_0 = 0;
integer ref_state6_cycle_1 = 0;
integer ref_state6_cycle_2 = 0;
integer ref_state6_cycle_3 = 0;

//---------------------------------
// FBD Channel Error & DTM Signals
//---------------------------------

reg dtm_enabled;
reg fbd_init_check;

reg [7:0] mcu0_nb_channel_error_cnt;
reg [7:0] mcu1_nb_channel_error_cnt;
reg [7:0] mcu2_nb_channel_error_cnt;
reg [7:0] mcu3_nb_channel_error_cnt;

reg [7:0] mcu0_sb_channel_error_cnt_tmp;
reg [7:0] mcu1_sb_channel_error_cnt_tmp;
reg [7:0] mcu2_sb_channel_error_cnt_tmp;
reg [7:0] mcu3_sb_channel_error_cnt_tmp;

reg [7:0] mcu0_sb_channel_error_cnt;
reg [7:0] mcu1_sb_channel_error_cnt;
reg [7:0] mcu2_sb_channel_error_cnt;
reg [7:0] mcu3_sb_channel_error_cnt;


reg mcu0_nb_err_enable;
reg mcu1_nb_err_enable;
reg mcu2_nb_err_enable;
reg mcu3_nb_err_enable;

reg mcu0_sb_err_enable;
reg mcu1_sb_err_enable;
reg mcu2_sb_err_enable;
reg mcu3_sb_err_enable;

reg mcu0_nb_err_random;
reg mcu1_nb_err_random;
reg mcu2_nb_err_random;
reg mcu3_nb_err_random;

reg mcu0_sb_err_random;
reg mcu1_sb_err_random;
reg mcu2_sb_err_random;
reg mcu3_sb_err_random;

integer mcu0_nb_random_val;
integer mcu1_nb_random_val;
integer mcu2_nb_random_val;
integer mcu3_nb_random_val;

integer mcu0_sb_random_val;
integer mcu1_sb_random_val;
integer mcu2_sb_random_val;
integer mcu3_sb_random_val;

integer mcu0_sb_random_cycle;
integer mcu1_sb_random_cycle;
integer mcu2_sb_random_cycle;
integer mcu3_sb_random_cycle;

integer mcu0_nb_random_cycle;
integer mcu1_nb_random_cycle;
integer mcu2_nb_random_cycle;
integer mcu3_nb_random_cycle;

integer mcu0_sb_random_lane=1;
integer mcu1_sb_random_lane=1;
integer mcu2_sb_random_lane=1;
integer mcu3_sb_random_lane=1;

integer mcu0_nb_random_lane=1;
integer mcu1_nb_random_lane=1;
integer mcu2_nb_random_lane=1;
integer mcu3_nb_random_lane=1;

integer mcu0_sb_random_bit_time=1;
integer mcu1_sb_random_bit_time=1;
integer mcu2_sb_random_bit_time=1;
integer mcu3_sb_random_bit_time=1;

integer mcu0_nb_random_bit_time=1;
integer mcu1_nb_random_bit_time=1;
integer mcu2_nb_random_bit_time=1;
integer mcu3_nb_random_bit_time=1;

reg [9:0] mcu0_sb_lane_mask;
reg [9:0] mcu1_sb_lane_mask;
reg [9:0] mcu2_sb_lane_mask;
reg [9:0] mcu3_sb_lane_mask;

reg [13:0] mcu0_nb_lane_mask;
reg [13:0] mcu1_nb_lane_mask;
reg [13:0] mcu2_nb_lane_mask;
reg [13:0] mcu3_nb_lane_mask;

reg mcu0_sb_crc_multiple_lanes;
reg mcu1_sb_crc_multiple_lanes;
reg mcu2_sb_crc_multiple_lanes;
reg mcu3_sb_crc_multiple_lanes;

reg mcu0_nb_crc_multiple_lanes;
reg mcu1_nb_crc_multiple_lanes;
reg mcu2_nb_crc_multiple_lanes;
reg mcu3_nb_crc_multiple_lanes;

reg [11:0] mcu0_sb_bit_time_mask;
reg [11:0] mcu1_sb_bit_time_mask;
reg [11:0] mcu2_sb_bit_time_mask;
reg [11:0] mcu3_sb_bit_time_mask;

reg [11:0] mcu0_nb_bit_time_mask;
reg [11:0] mcu1_nb_bit_time_mask;
reg [11:0] mcu2_nb_bit_time_mask;
reg [11:0] mcu3_nb_bit_time_mask;

reg mcu0_sb_crc_multiple_bit_times;
reg mcu1_sb_crc_multiple_bit_times;
reg mcu2_sb_crc_multiple_bit_times;
reg mcu3_sb_crc_multiple_bit_times;

reg mcu0_nb_crc_multiple_bit_times;
reg mcu1_nb_crc_multiple_bit_times;
reg mcu2_nb_crc_multiple_bit_times;
reg mcu3_nb_crc_multiple_bit_times;

integer MCU0_NB_RANDOM_WEIGHT;
integer MCU1_NB_RANDOM_WEIGHT;
integer MCU2_NB_RANDOM_WEIGHT;
integer MCU3_NB_RANDOM_WEIGHT;

integer MCU0_SB_RANDOM_WEIGHT;
integer MCU1_SB_RANDOM_WEIGHT;
integer MCU2_SB_RANDOM_WEIGHT;
integer MCU3_SB_RANDOM_WEIGHT;

integer mcu0_nb_cycle_cnt;
integer mcu1_nb_cycle_cnt;
integer mcu2_nb_cycle_cnt;
integer mcu3_nb_cycle_cnt;

reg mcu0_inject_fbu_err;
reg mcu1_inject_fbu_err;
reg mcu2_inject_fbu_err;
reg mcu3_inject_fbu_err;

reg mcu0_enable_ch0_err_inj;
reg mcu1_enable_ch0_err_inj;
reg mcu2_enable_ch0_err_inj;
reg mcu3_enable_ch0_err_inj;

reg mcu0_enable_ch1_err_inj;
reg mcu1_enable_ch1_err_inj;
reg mcu2_enable_ch1_err_inj;
reg mcu3_enable_ch1_err_inj;

wire mcu0_esr_fbr = `MCU0.drif.rdpctl_err_sts_reg[16];
wire mcu1_esr_fbr = `MCU1.drif.rdpctl_err_sts_reg[16];
wire mcu2_esr_fbr = `MCU2.drif.rdpctl_err_sts_reg[16];
wire mcu3_esr_fbr = `MCU3.drif.rdpctl_err_sts_reg[16];

wire mcu0_esr_fbu = `MCU0.drif.rdpctl_err_sts_reg[17];
wire mcu1_esr_fbu = `MCU1.drif.rdpctl_err_sts_reg[17];
wire mcu2_esr_fbu = `MCU2.drif.rdpctl_err_sts_reg[17];
wire mcu3_esr_fbu = `MCU3.drif.rdpctl_err_sts_reg[17];

// --- FBU ---

wire mcu0_synd_SPE = `MCU0.fbdic.fbdic_mcu_syndrome[3];
wire mcu0_synd_AA  = `MCU0.fbdic.fbdic_mcu_syndrome[2];
wire mcu0_synd_AF  = `MCU0.fbdic.fbdic_mcu_syndrome[1];
wire mcu0_synd_C   = `MCU0.fbdic.fbdic_mcu_syndrome[0];

wire mcu1_synd_SPE = `MCU1.fbdic.fbdic_mcu_syndrome[3];
wire mcu1_synd_AA  = `MCU1.fbdic.fbdic_mcu_syndrome[2];
wire mcu1_synd_AF  = `MCU1.fbdic.fbdic_mcu_syndrome[1];
wire mcu1_synd_C   = `MCU1.fbdic.fbdic_mcu_syndrome[0];

wire mcu2_synd_SPE = `MCU2.fbdic.fbdic_mcu_syndrome[3];
wire mcu2_synd_AA  = `MCU2.fbdic.fbdic_mcu_syndrome[2];
wire mcu2_synd_AF  = `MCU2.fbdic.fbdic_mcu_syndrome[1];
wire mcu2_synd_C   = `MCU2.fbdic.fbdic_mcu_syndrome[0];

wire mcu3_synd_SPE = `MCU3.fbdic.fbdic_mcu_syndrome[3];
wire mcu3_synd_AA  = `MCU3.fbdic.fbdic_mcu_syndrome[2];
wire mcu3_synd_AF  = `MCU3.fbdic.fbdic_mcu_syndrome[1];
wire mcu3_synd_C   = `MCU3.fbdic.fbdic_mcu_syndrome[0];

// --- FBR ---

wire mcu0_syndrome_SPE = `MCU0.fbdic.fbdic_mcu_syndrome_in[3] & `MCU0.fbdic.fbdic_mcu_syndrome_en;
wire mcu0_syndrome_AA  = `MCU0.fbdic.fbdic_mcu_syndrome_in[2] & `MCU0.fbdic.fbdic_mcu_syndrome_en;
wire mcu0_syndrome_AF  = `MCU0.fbdic.fbdic_mcu_syndrome_in[1] & `MCU0.fbdic.fbdic_mcu_syndrome_en;
wire mcu0_syndrome_C   = `MCU0.fbdic.fbdic_mcu_syndrome_in[0] & `MCU0.fbdic.fbdic_mcu_syndrome_en;

wire mcu1_syndrome_SPE = `MCU1.fbdic.fbdic_mcu_syndrome_in[3] & `MCU1.fbdic.fbdic_mcu_syndrome_en;
wire mcu1_syndrome_AA  = `MCU1.fbdic.fbdic_mcu_syndrome_in[2] & `MCU1.fbdic.fbdic_mcu_syndrome_en;
wire mcu1_syndrome_AF  = `MCU1.fbdic.fbdic_mcu_syndrome_in[1] & `MCU1.fbdic.fbdic_mcu_syndrome_en;
wire mcu1_syndrome_C   = `MCU1.fbdic.fbdic_mcu_syndrome_in[0] & `MCU1.fbdic.fbdic_mcu_syndrome_en;

wire mcu2_syndrome_SPE = `MCU2.fbdic.fbdic_mcu_syndrome_in[3] & `MCU2.fbdic.fbdic_mcu_syndrome_en;
wire mcu2_syndrome_AA  = `MCU2.fbdic.fbdic_mcu_syndrome_in[2] & `MCU2.fbdic.fbdic_mcu_syndrome_en;
wire mcu2_syndrome_AF  = `MCU2.fbdic.fbdic_mcu_syndrome_in[1] & `MCU2.fbdic.fbdic_mcu_syndrome_en;
wire mcu2_syndrome_C   = `MCU2.fbdic.fbdic_mcu_syndrome_in[0] & `MCU2.fbdic.fbdic_mcu_syndrome_en;

wire mcu3_syndrome_SPE = `MCU3.fbdic.fbdic_mcu_syndrome_in[3] & `MCU3.fbdic.fbdic_mcu_syndrome_en;
wire mcu3_syndrome_AA  = `MCU3.fbdic.fbdic_mcu_syndrome_in[2] & `MCU3.fbdic.fbdic_mcu_syndrome_en;
wire mcu3_syndrome_AF  = `MCU3.fbdic.fbdic_mcu_syndrome_in[1] & `MCU3.fbdic.fbdic_mcu_syndrome_en;
wire mcu3_syndrome_C   = `MCU3.fbdic.fbdic_mcu_syndrome_in[0] & `MCU3.fbdic.fbdic_mcu_syndrome_en;

wire mcu0_l2t0_scb_secc_err = `MCU0.mcu_l2t0_scb_secc_err;  
wire mcu0_l2t0_scb_mecc_err = `MCU0.mcu_l2t0_scb_mecc_err; 
wire mcu0_l2t0_mecc_err_r3 = `MCU0.mcu_l2t0_mecc_err_r3;   

wire mcu1_l2t0_scb_secc_err = `MCU1.mcu_l2t0_scb_secc_err;  
wire mcu1_l2t0_scb_mecc_err = `MCU1.mcu_l2t0_scb_mecc_err; 
wire mcu1_l2t0_mecc_err_r3 = `MCU1.mcu_l2t0_mecc_err_r3;   

wire mcu2_l2t0_scb_secc_err = `MCU2.mcu_l2t0_scb_secc_err;  
wire mcu2_l2t0_scb_mecc_err = `MCU2.mcu_l2t0_scb_mecc_err; 
wire mcu2_l2t0_mecc_err_r3 = `MCU2.mcu_l2t0_mecc_err_r3;   

wire mcu3_l2t0_scb_secc_err = `MCU3.mcu_l2t0_scb_secc_err;  
wire mcu3_l2t0_scb_mecc_err = `MCU3.mcu_l2t0_scb_mecc_err; 
wire mcu3_l2t0_mecc_err_r3 = `MCU3.mcu_l2t0_mecc_err_r3;   

wire mcu0_l2t1_scb_secc_err = `MCU0.mcu_l2t1_scb_secc_err;
wire mcu0_l2t1_scb_mecc_err = `MCU0.mcu_l2t1_scb_mecc_err;
wire mcu0_l2t1_mecc_err_r3 = `MCU0.mcu_l2t1_mecc_err_r3; 

wire mcu1_l2t1_scb_secc_err = `MCU1.mcu_l2t1_scb_secc_err;
wire mcu1_l2t1_scb_mecc_err = `MCU1.mcu_l2t1_scb_mecc_err;
wire mcu1_l2t1_mecc_err_r3 = `MCU1.mcu_l2t1_mecc_err_r3; 

wire mcu2_l2t1_scb_secc_err = `MCU2.mcu_l2t1_scb_secc_err;
wire mcu2_l2t1_scb_mecc_err = `MCU2.mcu_l2t1_scb_mecc_err;
wire mcu2_l2t1_mecc_err_r3 = `MCU2.mcu_l2t1_mecc_err_r3; 

wire mcu3_l2t1_scb_secc_err = `MCU3.mcu_l2t1_scb_secc_err;
wire mcu3_l2t1_scb_mecc_err = `MCU3.mcu_l2t1_scb_mecc_err;
wire mcu3_l2t1_mecc_err_r3 = `MCU3.mcu_l2t1_mecc_err_r3; 

// --- fbd errors during training

wire mcu0_fbdic_chnl_reset_error = ~(`MCU0.fbdic.fbdic_chnl_reset_error_mode);
wire mcu1_fbdic_chnl_reset_error = ~(`MCU1.fbdic.fbdic_chnl_reset_error_mode);
wire mcu2_fbdic_chnl_reset_error = ~(`MCU2.fbdic.fbdic_chnl_reset_error_mode);
wire mcu3_fbdic_chnl_reset_error = ~(`MCU3.fbdic.fbdic_chnl_reset_error_mode);

// --- refresh count

wire mcu0_refresh_req = `MCU0.drif.drif_refresh_req_picked;
wire mcu1_refresh_req = `MCU1.drif.drif_refresh_req_picked;
wire mcu2_refresh_req = `MCU2.drif.drif_refresh_req_picked;
wire mcu3_refresh_req = `MCU3.drif.drif_refresh_req_picked;

wire mcu0_refresh_go = `MCU0.drif.drif_ref_go;
wire mcu1_refresh_go = `MCU1.drif.drif_ref_go;
wire mcu2_refresh_go = `MCU2.drif.drif_ref_go;
wire mcu3_refresh_go = `MCU3.drif.drif_ref_go;

wire mcu0_self_refresh = `MCU0.drif.drif_enter_self_refresh;
wire mcu1_self_refresh = `MCU1.drif.drif_enter_self_refresh;
wire mcu2_self_refresh = `MCU2.drif.drif_enter_self_refresh;
wire mcu3_self_refresh = `MCU3.drif.drif_enter_self_refresh;

integer mcu0_refresh_counter;
integer mcu1_refresh_counter;
integer mcu2_refresh_counter;
integer mcu3_refresh_counter;

integer	mcu0_enter_refresh;
integer	mcu1_enter_refresh;
integer	mcu2_enter_refresh;
integer	mcu3_enter_refresh;

integer fbdimm0_refresh_counter;
integer fbdimm1_refresh_counter;
integer fbdimm2_refresh_counter;
integer fbdimm3_refresh_counter;
integer fbdimm4_refresh_counter;
integer fbdimm5_refresh_counter;
integer fbdimm6_refresh_counter;
integer fbdimm7_refresh_counter;

reg enable_refresh_check;
reg enable_alert_crc_check;
reg enable_alert_crc_retry_wr_q_not_empty;

`ifndef AXIS
  `ifdef X8
    //wire [14:0] fbdimm0_refresh_cnt_sample = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.fbdimm_DIMMx8.U00.refr_cnt;
    //wire [14:0] fbdimm2_refresh_cnt_sample = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.fbdimm_DIMMx8.U00.refr_cnt;
    //wire [14:0] fbdimm4_refresh_cnt_sample = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.fbdimm_DIMMx8.U00.refr_cnt;
    //wire [14:0] fbdimm6_refresh_cnt_sample = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.fbdimm_DIMMx8.U00.refr_cnt;
  `else
    //wire [14:0] fbdimm0_refresh_cnt_sample = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.fbdimm_DIMMx4.U00.refr_cnt;
    //wire [14:0] fbdimm2_refresh_cnt_sample = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.fbdimm_DIMMx4.U00.refr_cnt;
    //wire [14:0] fbdimm4_refresh_cnt_sample = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.fbdimm_DIMMx4.U00.refr_cnt;
    //wire [14:0] fbdimm6_refresh_cnt_sample = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.fbdimm_DIMMx4.U00.refr_cnt;
  `endif
`endif

// refresh define end

//---------------------------------------------------------------
//                    CHECKERS
//---------------------------------------------------------------

//-------------------
// mcu - check for 120049
//-------------------

reg mcu0_l0state_cond1;
reg mcu0_l0state_cond2;
reg mcu1_l0state_cond1;
reg mcu1_l0state_cond2;
reg mcu2_l0state_cond1;
reg mcu2_l0state_cond2;
reg mcu3_l0state_cond1;
reg mcu3_l0state_cond2;
reg enable_mon_120049;
reg pipe_mcu0_fast_reset_err_on_first_sync;
reg pipe_mcu1_fast_reset_err_on_first_sync;
reg pipe_mcu2_fast_reset_err_on_first_sync;
reg pipe_mcu3_fast_reset_err_on_first_sync;
reg pipe_mcu0_fbdic_fbdic_error_mode;
reg pipe_mcu1_fbdic_fbdic_error_mode;
reg pipe_mcu2_fbdic_fbdic_error_mode;
reg pipe_mcu3_fbdic_fbdic_error_mode;
reg pipe_mcu0_drif_woq_wr_error_mode;
reg pipe_mcu1_drif_woq_wr_error_mode;
reg pipe_mcu2_drif_woq_wr_error_mode;
reg pipe_mcu3_drif_woq_wr_error_mode;

initial
begin
   mcu0_l0state_cond1 = 1'b0;
   mcu0_l0state_cond2 = 1'b0;
   mcu1_l0state_cond1 = 1'b0;
   mcu1_l0state_cond2 = 1'b0;
   mcu2_l0state_cond1 = 1'b0;
   mcu2_l0state_cond2 = 1'b0;
   mcu3_l0state_cond1 = 1'b0;
   mcu3_l0state_cond2 = 1'b0;
   pipe_mcu0_fast_reset_err_on_first_sync = 1'b0;
   pipe_mcu1_fast_reset_err_on_first_sync = 1'b0;
   pipe_mcu2_fast_reset_err_on_first_sync = 1'b0;
   pipe_mcu3_fast_reset_err_on_first_sync = 1'b0;
   pipe_mcu0_fbdic_fbdic_error_mode = 1'b0;
   pipe_mcu1_fbdic_fbdic_error_mode = 1'b0;
   pipe_mcu2_fbdic_fbdic_error_mode = 1'b0;
   pipe_mcu3_fbdic_fbdic_error_mode = 1'b0;
   pipe_mcu0_drif_woq_wr_error_mode = 1'b0;
   pipe_mcu1_drif_woq_wr_error_mode = 1'b0;
   pipe_mcu2_drif_woq_wr_error_mode = 1'b0;
   pipe_mcu3_drif_woq_wr_error_mode = 1'b0;
   if ($test$plusargs("disable_mon_120049"))
	enable_mon_120049 = 0;
   else
	enable_mon_120049 = 1;
end

// MCU0
always @ (posedge `MCU0.fbdic.l1clk && enable_mon_120049)
 begin
   pipe_mcu0_fast_reset_err_on_first_sync <= `MCU0.fbdic.fast_reset_err_on_first_sync;
   pipe_mcu0_fbdic_fbdic_error_mode <= `MCU0.fbdic.fbdic_error_mode;
   pipe_mcu0_drif_woq_wr_error_mode <= `MCU0.drif.woq_wr_error_mode;
 end

always @ (posedge `MCU0.fbdic.l1clk && enable_mon_120049)
   if (((`MCU0.fbdic.fbdic_fbd_state[2:0] == 3'b0) | (`MCU0.fbdic.fbdic_idle_frame == 1'b1)))
      mcu0_l0state_cond1 <= 1'b0;
   else
      mcu0_l0state_cond1 <= mcu0_l0state_cond1 | `MCU0.fbdic.fbdic_l0_state;

always @ (posedge `MCU0.fbdic.l1clk && enable_mon_120049)
   if (((`MCU0.fbdic.fbdic_fbd_state[2:0] == 3'b0) | (`MCU0.fbdic.fbdic_idle_frame == 1'b1)))
      mcu0_l0state_cond2 <= 1'b0;
   else
      mcu0_l0state_cond2 <= mcu0_l0state_cond2 | (`MCU0.drif.drif_dram_cmd_b[2:0] == 3'h5);

wire mcu0_trigger = pipe_mcu0_fast_reset_err_on_first_sync & mcu0_l0state_cond1 & mcu0_l0state_cond2 & enable_mon_120049 & ~pipe_mcu0_fbdic_fbdic_error_mode & ~pipe_mcu0_drif_woq_wr_error_mode;

always @ (posedge (mcu0_trigger === 1'b1))
   `PR_ERROR("mcu_fmon", `ERROR, "MCU0: *** N2 TO 2.0 BUG 120049 ***");

// MCU1
always @ (posedge `MCU1.fbdic.l1clk && enable_mon_120049)
 begin
   pipe_mcu1_fast_reset_err_on_first_sync <= `MCU1.fbdic.fast_reset_err_on_first_sync;
   pipe_mcu1_fbdic_fbdic_error_mode <= `MCU1.fbdic.fbdic_error_mode;
   pipe_mcu1_drif_woq_wr_error_mode <= `MCU1.drif.woq_wr_error_mode;
 end

always @ (posedge `MCU1.fbdic.l1clk && enable_mon_120049)
   if (((`MCU1.fbdic.fbdic_fbd_state[2:0] == 3'b0) | (`MCU1.fbdic.fbdic_idle_frame == 1'b1)))
	mcu1_l0state_cond1 <= 1'b0;
   else
	mcu1_l0state_cond1 <= mcu1_l0state_cond1 | `MCU1.fbdic.fbdic_l0_state;

always @ (posedge `MCU1.fbdic.l1clk && enable_mon_120049)
   if (((`MCU1.fbdic.fbdic_fbd_state[2:0] == 3'b0) | (`MCU1.fbdic.fbdic_idle_frame == 1'b1)))
	mcu1_l0state_cond2 <= 1'b0;
   else
	mcu1_l0state_cond2 <= mcu1_l0state_cond2 | (`MCU1.drif.drif_dram_cmd_b[2:0] == 3'h5);

wire mcu1_trigger = pipe_mcu1_fast_reset_err_on_first_sync & mcu1_l0state_cond1 & mcu1_l0state_cond2 & enable_mon_120049 & ~pipe_mcu1_fbdic_fbdic_error_mode & ~pipe_mcu1_drif_woq_wr_error_mode;

always @ (posedge (mcu1_trigger === 1'b1))
   `PR_ERROR("mcu_fmon", `ERROR, "MCU1: *** N2 TO 2.0 BUG 120049 ***");

// MCU2
always @ (posedge `MCU2.fbdic.l1clk && enable_mon_120049)
 begin
   pipe_mcu2_fast_reset_err_on_first_sync <= `MCU2.fbdic.fast_reset_err_on_first_sync;
   pipe_mcu2_fbdic_fbdic_error_mode <= `MCU2.fbdic.fbdic_error_mode;
   pipe_mcu2_drif_woq_wr_error_mode <= `MCU2.drif.woq_wr_error_mode;
 end

always @ (posedge `MCU2.fbdic.l1clk && enable_mon_120049)
   if (((`MCU2.fbdic.fbdic_fbd_state[2:0] == 3'b0) | (`MCU2.fbdic.fbdic_idle_frame == 1'b1)))
	mcu2_l0state_cond1 <= 1'b0;
   else
	mcu2_l0state_cond1 <= mcu2_l0state_cond1 | `MCU2.fbdic.fbdic_l0_state;

always @ (posedge `MCU2.fbdic.l1clk && enable_mon_120049)
   if (((`MCU2.fbdic.fbdic_fbd_state[2:0] == 3'b0) | (`MCU2.fbdic.fbdic_idle_frame == 1'b1)))
	mcu2_l0state_cond2 <= 1'b0;
   else
	mcu2_l0state_cond2 <= mcu2_l0state_cond2 | (`MCU2.drif.drif_dram_cmd_b[2:0] == 3'h5);

wire mcu2_trigger = pipe_mcu2_fast_reset_err_on_first_sync & mcu2_l0state_cond1 & mcu2_l0state_cond2 & enable_mon_120049 & ~pipe_mcu2_fbdic_fbdic_error_mode & ~pipe_mcu2_drif_woq_wr_error_mode;

always @ (posedge (mcu2_trigger === 1'b1))
   `PR_ERROR("mcu_fmon", `ERROR, "MCU2: *** N2 TO 2.0 BUG 120049 ***");

// MCU3
always @ (posedge `MCU3.fbdic.l1clk && enable_mon_120049)
 begin
   pipe_mcu3_fast_reset_err_on_first_sync <= `MCU3.fbdic.fast_reset_err_on_first_sync;
   pipe_mcu3_fbdic_fbdic_error_mode <= `MCU3.fbdic.fbdic_error_mode;
   pipe_mcu3_drif_woq_wr_error_mode <= `MCU3.drif.woq_wr_error_mode;
 end
always @ (posedge `MCU3.fbdic.l1clk && enable_mon_120049)
   if (((`MCU3.fbdic.fbdic_fbd_state[2:0] == 3'b0) | (`MCU3.fbdic.fbdic_idle_frame == 1'b1)))
	mcu3_l0state_cond1 <= 1'b0;
   else
	mcu3_l0state_cond1 <= mcu3_l0state_cond1 | `MCU3.fbdic.fbdic_l0_state;

always @ (posedge `MCU3.fbdic.l1clk && enable_mon_120049)
   if (((`MCU3.fbdic.fbdic_fbd_state[2:0] == 3'b0) | (`MCU3.fbdic.fbdic_idle_frame == 1'b1)))
	mcu3_l0state_cond2 <= 1'b0;
   else
	mcu3_l0state_cond2 <= mcu3_l0state_cond2 | (`MCU3.drif.drif_dram_cmd_b[2:0] == 3'h5);

wire mcu3_trigger = pipe_mcu3_fast_reset_err_on_first_sync & mcu3_l0state_cond1 & mcu3_l0state_cond2 & enable_mon_120049 & ~pipe_mcu3_fbdic_fbdic_error_mode & ~pipe_mcu3_drif_woq_wr_error_mode;

always @ (posedge (mcu3_trigger === 1'b1))
   `PR_ERROR("mcu_fmon", `ERROR, "MCU3: *** N2 TO 2.0 BUG 120049 ***");

//-------------------
// mcu - check for crc retry before wr error queue empty
//-------------------

initial
   if ($test$plusargs("disable_alert_crc_retry_b4_wr_err_q_empty"))
      enable_alert_crc_retry_wr_q_not_empty = 0;
   else
      enable_alert_crc_retry_wr_q_not_empty = 1;


always @ (posedge `MCU0.drif.l1clk && enable_alert_crc_retry_wr_q_not_empty === 1'b1)
    if (mcu0_crc_retry_wr_q_not_empty === 1'b1)
       `PR_ERROR("mcu_fmon", `ERROR, "MCU0: CRC RETRY WHILE WR ERR Q NOT EMPTY *** N2 TO 2.0 BUG 120114 ***");

always @ (posedge `MCU1.drif.l1clk && enable_alert_crc_retry_wr_q_not_empty === 1'b1)
    if (mcu1_crc_retry_wr_q_not_empty === 1'b1)
       `PR_ERROR("mcu_fmon", `ERROR, "MCU1: CRC RETRY WHILE WR ERR Q NOT EMPTY *** N2 TO 2.0 BUG 120114 ***");

always @ (posedge `MCU2.drif.l1clk && enable_alert_crc_retry_wr_q_not_empty === 1'b1)
    if (mcu2_crc_retry_wr_q_not_empty === 1'b1)
       `PR_ERROR("mcu_fmon", `ERROR, "MCU2: CRC RETRY WHILE WR ERR Q NOT EMPTY *** N2 TO 2.0 BUG 120114 ***");

always @ (posedge `MCU3.drif.l1clk && enable_alert_crc_retry_wr_q_not_empty === 1'b1)
    if (mcu3_crc_retry_wr_q_not_empty === 1'b1)
       `PR_ERROR("mcu_fmon", `ERROR, "MCU3: CRC RETRY WHILE WR ERR Q NOT EMPTY *** N2 TO 2.0 BUG 120114 ***"); 

//-------------------
// mcu - check for collision : alertFrame and CRC error
//-------------------

initial
   if ($test$plusargs("disable_alert_crc_checker"))
      enable_alert_crc_check = 0;
   else
      enable_alert_crc_check = 1;


always @ (posedge `MCU0.drif.l1clk && enable_alert_crc_check)
    if (mcu0_alertframe_crc_error === 1'b1)
       `PR_ERROR("mcu_fmon", `ERROR, "MCU0: COLLISION : ALERT_FRAME and CRC RETRY *** N2 TO 2.0 BUG 118987 ***");

always @ (posedge `MCU1.drif.l1clk && enable_alert_crc_check)
    if (mcu1_alertframe_crc_error === 1'b1)
       `PR_ERROR("mcu_fmon", `ERROR, "MCU1: COLLISION : ALERT_FRAME and CRC RETRY *** N2 TO 2.0 BUG 118987 ***");

always @ (posedge `MCU2.drif.l1clk && enable_alert_crc_check)
    if (mcu2_alertframe_crc_error === 1'b1)
       `PR_ERROR("mcu_fmon", `ERROR, "MCU2: COLLISION : ALERT_FRAME and CRC RETRY *** N2 TO 2.0 BUG 118987 ***");

always @ (posedge `MCU3.drif.l1clk && enable_alert_crc_check)
    if (mcu3_alertframe_crc_error === 1'b1)
       `PR_ERROR("mcu_fmon", `ERROR, "MCU3: COLLISION : ALERT_FRAME and CRC RETRY *** N2 TO 2.0 BUG 118987 ***");

//-------------------
// mcu - dimm refresh check
//-------------------

initial 
begin
mcu0_refresh_counter = 0;
mcu1_refresh_counter = 0;
mcu2_refresh_counter = 0;
mcu3_refresh_counter = 0;

mcu0_enter_refresh = 0;
mcu1_enter_refresh = 0;
mcu2_enter_refresh = 0;
mcu3_enter_refresh = 0;

fbdimm0_refresh_counter = 0;
fbdimm1_refresh_counter = 0;
fbdimm2_refresh_counter = 0;
fbdimm3_refresh_counter = 0;
fbdimm4_refresh_counter = 0;
fbdimm5_refresh_counter = 0;
fbdimm6_refresh_counter = 0;
fbdimm7_refresh_counter = 0;

if ($test$plusargs("disable_refresh_checker"))
    enable_refresh_check = 0;
else
    enable_refresh_check = 1;

end

`ifndef AXIS
always @ (posedge fbdic_l0_state_0)
begin
	mcu0_refresh_counter = 0;
	fbdimm0_refresh_counter = 1;
end
	
always @ (posedge fbdic_l0_state_1)
begin
	mcu1_refresh_counter = 0;
	fbdimm2_refresh_counter = 1;
end

// --- MCU0 refresh count check 
always @ (posedge mcu0_self_refresh)
	mcu0_refresh_counter = mcu0_refresh_counter + 1;

always @ (posedge mcu0_refresh_go && (mcu0_enter_refresh == 0))
begin
	mcu0_enter_refresh = 1;
    	`PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: MCU0 enter refresh state %d",mcu0_enter_refresh);
end

always @ (posedge mcu0_refresh_req)
	if (mcu0_enter_refresh && (mcu0_drif_dram_rank_b === 1'b1) || (mcu0_drif_dram_dimm_b !== 3'b0))
	begin
		mcu0_enter_refresh = 0;
    		`PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: MCU0 refresh other dimms, out of refresh state %d",mcu0_enter_refresh);
	end

always @ (posedge drl2clk && enable_refresh_check)
begin
  if (mcu0_refresh_req && (mcu0_enter_refresh != 0) 
	&& (mcu0_drif_dram_rank_b !== 1'b1) && (mcu0_drif_dram_dimm_b === 3'b0))
  begin
//	if (mcu0_enter_refresh >= `MCU0.drif.drif_dimms_present)
//	begin
	   mcu0_refresh_counter = mcu0_refresh_counter + 1;
	   mcu0_enter_refresh = 0;

	   repeat(10) @ (posedge drl2clk);

	  // if (mcu0_refresh_counter > fbdimm0_refresh_counter)
	//	`PR_ERROR("mcu_fmon", `ERROR, "MCU0: mcu0 refresh lost mcu cnt = %d dimm cnt = %d", mcu0_refresh_counter, fbdimm0_refresh_counter);
//	   else
  //  		`PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: MCU0 refresh complete mcu_cnt=%d dimm_cnt=%d",mcu0_refresh_counter, fbdimm0_refresh_counter);
//	end
//	else
//	   mcu0_enter_refresh = mcu0_enter_refresh + 1;
  end
end

/*always @ (fbdimm0_refresh_cnt_sample)
begin
   if (enable_refresh_check)
   begin
	fbdimm0_refresh_counter = fbdimm0_refresh_counter + 1;
	if (mcu0_refresh_counter > fbdimm0_refresh_counter)
     	   `PR_ERROR("mcu_fmon", `ERROR, "FBDIMM0: MCU0 refresh lost mcu_cnt=%d dimm_cnt=%d", mcu0_refresh_counter, fbdimm0_refresh_counter);
	else
    	   `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: FBDIMM0 refresh mcu_cnt=%d dimm_cnt=%d",mcu0_refresh_counter, fbdimm0_refresh_counter);
  end
end
*/
// --- MCU0 refresh count check end 

// --- MCU1 refresh count check 

// --- MCU1 refresh count check end 

`endif

//-------------------

// L0s State Checker
//-------------------

always @ (negedge (fbdic_l0s_stall_0 && enabled))
begin
  if (fbdic_l0s_enable_0) begin
   if (fbdic_sync_frame_req_0 !== 1)
     `PR_ERROR("mcu_fmon", `ERROR, "MCU0: The first frame after L0s duration is not a sync frame");
  end
end

always @ (negedge (fbdic_l0s_stall_1 && enabled))
begin
  if (fbdic_l0s_enable_1) begin
   if (fbdic_sync_frame_req_1 !== 1)
     `PR_ERROR("mcu_fmon", `ERROR, "MCU1: The first frame after L0s duration is not a sync frame");
  end
end

always @ (negedge (fbdic_l0s_stall_2 && enabled))
begin
  if (fbdic_l0s_enable_2) begin
   if (fbdic_sync_frame_req_2 !== 1)
     `PR_ERROR("mcu_fmon", `ERROR, "MCU2: The first frame after L0s duration is not a sync frame");
  end
end

always @ (negedge (fbdic_l0s_stall_3 && enabled))
begin
  if (fbdic_l0s_enable_3) begin
   if (fbdic_sync_frame_req_3 !== 1)
     `PR_ERROR("mcu_fmon", `ERROR, "MCU3: The first frame after L0s duration is not a sync frame");
  end
end

//--------------------------
// Power Down Mode Checkers
//--------------------------
always @ (posedge drl2clk && enabled)
begin
  pdmc_pd_cnt_is_zero_0_d <= pdmc_pd_cnt_is_zero_0;
end

//***pdmc0***
always @ (posedge drl2clk && enabled)
begin
  if (mcu0_drif_pdx_issued[0] || pdmc_state_00[0])
     mcu0_start_pd_check_0 = 0;
  else if (mcu0_drif_pde_issued[0]) begin
     mcu0_start_pd_check_0 = 1;
     if ((mcu0_start_pd_check_0 == 1'b1) && (pdmc_pd_cnt_is_zero_0_d[0] !== 1'b1))
       `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Power down is issued but cnt is not zero");
   end
end

always @ (posedge drl2clk && enabled)
begin
  if (mcu0_start_pd_check_0) begin
    if ((mcu0_drif_dram_dimm_a == 3'd0) && (mcu0_drif_dram_rank_a == 1'b0) &&
                                  ((mcu0_drif_dram_cmd_a == `RD) || 
                                   (mcu0_drif_dram_cmd_a == `WR) || 
                                   (mcu0_drif_dram_cmd_a == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
    if ((mcu0_drif_dram_dimm_b == 3'd0) && (mcu0_drif_dram_rank_b == 1'b0) &&
                                 (((mcu0_drif_dram_cmd_b == `CMD_OTHER) && (mcu0_drif_dram_addr_b[2:0] == `CMD_OTHER_REF)) ||
                                   (mcu0_drif_dram_cmd_b == `WR) || 
                                   (mcu0_drif_dram_cmd_b == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
    if ((mcu0_drif_dram_dimm_c == 3'd0) && (mcu0_drif_dram_rank_c == 1'b0) &&
                                 (((mcu0_drif_dram_cmd_c == `CMD_OTHER) && (mcu0_drif_dram_addr_c[2:0] == `CMD_OTHER_SRE)) || 
                                   (mcu0_drif_dram_cmd_c == `WR) || 
                                   (mcu0_drif_dram_cmd_c == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
  end
end
      
//***pdmc8***
always @ (posedge drl2clk && enabled)
begin
  if (mcu0_drif_pdx_issued[8] || pdmc_state_08[0])
     mcu0_start_pd_check_8 = 0;
  else if (mcu0_drif_pde_issued[8]) begin
     mcu0_start_pd_check_8 = 1;
     if ((mcu0_start_pd_check_8 == 1'b1) && (pdmc_pd_cnt_is_zero_0_d[8] !== 1'b1))
       `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Power down is issued but cnt is not zero");
   end
end

always @ (posedge drl2clk && enabled)
begin
  if (mcu0_start_pd_check_8) begin
    if ((mcu0_drif_dram_dimm_a == 3'd0) && (mcu0_drif_dram_rank_a == 1'b1) &&
                                  ((mcu0_drif_dram_cmd_a == `RD) || 
                                   (mcu0_drif_dram_cmd_a == `WR) || 
                                   (mcu0_drif_dram_cmd_a == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
    if ((mcu0_drif_dram_dimm_b == 3'd0) && (mcu0_drif_dram_rank_b == 1'b1) &&
                                 (((mcu0_drif_dram_cmd_b == `CMD_OTHER) && (mcu0_drif_dram_addr_b[2:0] == `CMD_OTHER_REF)) ||
                                   (mcu0_drif_dram_cmd_b == `WR) || 
                                   (mcu0_drif_dram_cmd_b == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
    if ((mcu0_drif_dram_dimm_c == 3'd0) && (mcu0_drif_dram_rank_c == 1'b1) &&
                                 (((mcu0_drif_dram_cmd_c == `CMD_OTHER) && (mcu0_drif_dram_addr_c[2:0] == `CMD_OTHER_SRE)) || 
                                   (mcu0_drif_dram_cmd_c == `WR) || 
                                   (mcu0_drif_dram_cmd_c == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
  end
end
      
//***pdmc1***
always @ (posedge drl2clk && enabled)
begin
  if (mcu0_drif_pdx_issued[1] || pdmc_state_01[0])
     mcu0_start_pd_check_1 = 0;
  else if (mcu0_drif_pde_issued[1]) begin
     mcu0_start_pd_check_1 = 1;
     if ((mcu0_start_pd_check_1 == 1'b1) && (pdmc_pd_cnt_is_zero_0_d[1] !== 1'b1))
       `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Power down is issued but cnt is not zero");
   end
end

always @ (posedge drl2clk && enabled)
begin
  if (mcu0_start_pd_check_1) begin
    if ((mcu0_drif_dram_dimm_a == 3'd1) && (mcu0_drif_dram_rank_a == 1'b0) &&
                                  ((mcu0_drif_dram_cmd_a == `RD) || 
                                   (mcu0_drif_dram_cmd_a == `WR) || 
                                   (mcu0_drif_dram_cmd_a == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
    if ((mcu0_drif_dram_dimm_b == 3'd1) && (mcu0_drif_dram_rank_b == 1'b0) &&
                                 (((mcu0_drif_dram_cmd_b == `CMD_OTHER) && (mcu0_drif_dram_addr_b[2:0] == `CMD_OTHER_REF)) ||
                                   (mcu0_drif_dram_cmd_b == `WR) || 
                                   (mcu0_drif_dram_cmd_b == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
    if ((mcu0_drif_dram_dimm_c == 3'd1) && (mcu0_drif_dram_rank_c == 1'b0) &&
                                 (((mcu0_drif_dram_cmd_c == `CMD_OTHER) && (mcu0_drif_dram_addr_c[2:0] == `CMD_OTHER_SRE)) || 
                                   (mcu0_drif_dram_cmd_c == `WR) || 
                                   (mcu0_drif_dram_cmd_c == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
  end
end
      
//***pdmc9***
always @ (posedge drl2clk && enabled)
begin
  if (mcu0_drif_pdx_issued[9] || pdmc_state_09[0])
     mcu0_start_pd_check_9 = 0;
  else if (mcu0_drif_pde_issued[9]) begin
     mcu0_start_pd_check_9 = 1;
     if ((mcu0_start_pd_check_9 == 1'b1) && (pdmc_pd_cnt_is_zero_0_d[9] !== 1'b1))
       `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Power down is issued but cnt is not zero");
   end
end

always @ (posedge drl2clk && enabled)
begin
  if (mcu0_start_pd_check_9) begin
    if ((mcu0_drif_dram_dimm_a == 3'd1) && (mcu0_drif_dram_rank_a == 1'b1) &&
                                  ((mcu0_drif_dram_cmd_a == `RD) || 
                                   (mcu0_drif_dram_cmd_a == `WR) || 
                                   (mcu0_drif_dram_cmd_a == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
    if ((mcu0_drif_dram_dimm_b == 3'd1) && (mcu0_drif_dram_rank_b == 1'b1) &&
                                 (((mcu0_drif_dram_cmd_b == `CMD_OTHER) && (mcu0_drif_dram_addr_b[2:0] == `CMD_OTHER_REF)) ||
                                   (mcu0_drif_dram_cmd_b == `WR) || 
                                   (mcu0_drif_dram_cmd_b == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
    if ((mcu0_drif_dram_dimm_c == 3'd1) && (mcu0_drif_dram_rank_c == 1'b1) &&
                                 (((mcu0_drif_dram_cmd_c == `CMD_OTHER) && (mcu0_drif_dram_addr_c[2:0] == `CMD_OTHER_SRE)) || 
                                   (mcu0_drif_dram_cmd_c == `WR) || 
                                   (mcu0_drif_dram_cmd_c == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
  end
end
      
//***pdmc2***
always @ (posedge drl2clk && enabled)
begin
  if (mcu0_drif_pdx_issued[2] || pdmc_state_02[0])
     mcu0_start_pd_check_2 = 0;
  else if (mcu0_drif_pde_issued[2]) begin
     mcu0_start_pd_check_2 = 1;
     if ((mcu0_start_pd_check_2 == 1'b1) && (pdmc_pd_cnt_is_zero_0_d[2] !== 1'b1))
       `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Power down is issued but cnt is not zero");
   end
end

always @ (posedge drl2clk && enabled)
begin
  if (mcu0_start_pd_check_2) begin
    if ((mcu0_drif_dram_dimm_a == 3'd2) && (mcu0_drif_dram_rank_a == 1'b0) &&
                                  ((mcu0_drif_dram_cmd_a == `RD) || 
                                   (mcu0_drif_dram_cmd_a == `WR) || 
                                   (mcu0_drif_dram_cmd_a == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
    if ((mcu0_drif_dram_dimm_b == 3'd2) && (mcu0_drif_dram_rank_b == 1'b0) &&
                                 (((mcu0_drif_dram_cmd_b == `CMD_OTHER) && (mcu0_drif_dram_addr_b[2:0] == `CMD_OTHER_REF)) ||
                                   (mcu0_drif_dram_cmd_b == `WR) || 
                                   (mcu0_drif_dram_cmd_b == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
    if ((mcu0_drif_dram_dimm_c == 3'd2) && (mcu0_drif_dram_rank_c == 1'b0) &&
                                 (((mcu0_drif_dram_cmd_c == `CMD_OTHER) && (mcu0_drif_dram_addr_c[2:0] == `CMD_OTHER_SRE)) || 
                                   (mcu0_drif_dram_cmd_c == `WR) || 
                                   (mcu0_drif_dram_cmd_c == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
  end
end
      
//***pdmc10***
always @ (posedge drl2clk && enabled)
begin
  if (mcu0_drif_pdx_issued[10] || pdmc_state_0a[0])
     mcu0_start_pd_check_a = 0;
  else if (mcu0_drif_pde_issued[10]) begin
     mcu0_start_pd_check_a = 1;
     if ((mcu0_start_pd_check_a == 1'b1) && (pdmc_pd_cnt_is_zero_0_d[10] !== 1'b1))
       `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Power down is issued but cnt is not zero");
   end
end

always @ (posedge drl2clk && enabled)
begin
  if (mcu0_start_pd_check_a) begin
    if ((mcu0_drif_dram_dimm_a == 3'd2) && (mcu0_drif_dram_rank_a == 1'b1) &&
                                  ((mcu0_drif_dram_cmd_a == `RD) || 
                                   (mcu0_drif_dram_cmd_a == `WR) || 
                                   (mcu0_drif_dram_cmd_a == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
    if ((mcu0_drif_dram_dimm_b == 3'd2) && (mcu0_drif_dram_rank_b == 1'b1) &&
                                 (((mcu0_drif_dram_cmd_b == `CMD_OTHER) && (mcu0_drif_dram_addr_b[2:0] == `CMD_OTHER_REF)) ||
                                   (mcu0_drif_dram_cmd_b == `WR) || 
                                   (mcu0_drif_dram_cmd_b == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
    if ((mcu0_drif_dram_dimm_c == 3'd2) && (mcu0_drif_dram_rank_c == 1'b1) &&
                                 (((mcu0_drif_dram_cmd_c == `CMD_OTHER) && (mcu0_drif_dram_addr_c[2:0] == `CMD_OTHER_SRE)) || 
                                   (mcu0_drif_dram_cmd_c == `WR) || 
                                   (mcu0_drif_dram_cmd_c == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
  end
end
      
//***pdmc3***
always @ (posedge drl2clk && enabled)
begin
  if (mcu0_drif_pdx_issued[3] || pdmc_state_03[0])
     mcu0_start_pd_check_3 = 0;
  else if (mcu0_drif_pde_issued[3]) begin
     mcu0_start_pd_check_3 = 1;
     if ((mcu0_start_pd_check_3 == 1'b1) && (pdmc_pd_cnt_is_zero_0_d[3] !== 1'b1))
       `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Power down is issued but cnt is not zero");
   end
end

always @ (posedge drl2clk && enabled)
begin
  if (mcu0_start_pd_check_3) begin
    if ((mcu0_drif_dram_dimm_a == 3'd3) && (mcu0_drif_dram_rank_a == 1'b0) &&
                                  ((mcu0_drif_dram_cmd_a == `RD) || 
                                   (mcu0_drif_dram_cmd_a == `WR) || 
                                   (mcu0_drif_dram_cmd_a == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
    if ((mcu0_drif_dram_dimm_b == 3'd3) && (mcu0_drif_dram_rank_b == 1'b0) &&
                                 (((mcu0_drif_dram_cmd_b == `CMD_OTHER) && (mcu0_drif_dram_addr_b[2:0] == `CMD_OTHER_REF)) ||
                                   (mcu0_drif_dram_cmd_b == `WR) || 
                                   (mcu0_drif_dram_cmd_b == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
    if ((mcu0_drif_dram_dimm_c == 3'd3) && (mcu0_drif_dram_rank_c == 1'b0) &&
                                 (((mcu0_drif_dram_cmd_c == `CMD_OTHER) && (mcu0_drif_dram_addr_c[2:0] == `CMD_OTHER_SRE)) || 
                                   (mcu0_drif_dram_cmd_c == `WR) || 
                                   (mcu0_drif_dram_cmd_c == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
  end
end
      
//***pdmc11***
always @ (posedge drl2clk && enabled)
begin
  if (mcu0_drif_pdx_issued[11] || pdmc_state_0b[0])
     mcu0_start_pd_check_b = 0;
  else if (mcu0_drif_pde_issued[11]) begin
     mcu0_start_pd_check_b = 1;
     if ((mcu0_start_pd_check_b == 1'b1) && (pdmc_pd_cnt_is_zero_0_d[11] !== 1'b1))
       `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Power down is issued but cnt is not zero");
   end
end

always @ (posedge drl2clk && enabled)
begin
  if (mcu0_start_pd_check_b) begin
    if ((mcu0_drif_dram_dimm_a == 3'd3) && (mcu0_drif_dram_rank_a == 1'b1) &&
                                  ((mcu0_drif_dram_cmd_a == `RD) || 
                                   (mcu0_drif_dram_cmd_a == `WR) || 
                                   (mcu0_drif_dram_cmd_a == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
    if ((mcu0_drif_dram_dimm_b == 3'd3) && (mcu0_drif_dram_rank_b == 1'b1) &&
                                 (((mcu0_drif_dram_cmd_b == `CMD_OTHER) && (mcu0_drif_dram_addr_b[2:0] == `CMD_OTHER_REF)) ||
                                   (mcu0_drif_dram_cmd_b == `WR) || 
                                   (mcu0_drif_dram_cmd_b == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
    if ((mcu0_drif_dram_dimm_c == 3'd3) && (mcu0_drif_dram_rank_c == 1'b1) &&
                                 (((mcu0_drif_dram_cmd_c == `CMD_OTHER) && (mcu0_drif_dram_addr_c[2:0] == `CMD_OTHER_SRE)) || 
                                   (mcu0_drif_dram_cmd_c == `WR) || 
                                   (mcu0_drif_dram_cmd_c == `ACT))) 
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Non power_down_exit command is sent while in power down");
  end
end
      

//`endif

//---------------------
// Arbiter Checkers
//---------------------

always @ (negedge (drl2clk && enabled))
begin
  if (|(drif_req_picked_0[9:0]))
    begin
      if ((drif_req_picked_0 != 10'h001) &&
          (drif_req_picked_0 != 10'h002) &&
          (drif_req_picked_0 != 10'h004) &&
          (drif_req_picked_0 != 10'h008) &&
          (drif_req_picked_0 != 10'h010) &&
          (drif_req_picked_0 != 10'h020) &&
          (drif_req_picked_0 != 10'h040) &&
          (drif_req_picked_0 != 10'h080) &&
          (drif_req_picked_0 != 10'h100) &&
          (drif_req_picked_0 != 10'h200))
         `PR_ERROR("mcu_fmon", `ERROR, "MCU0: %h More than 1 request present", drif_req_picked_0);
    end
end

//---------------------
// IBIST Checkers
//---------------------
always @ (ibist_rx_errstat_0)
if (enabled && (!mcu0_training_err_enable))
begin
  if (ibist_rx_errstat_0 == 2'b10)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0:IBIST transmission error %d",ibist_rx_errstat_0);
end

always @ (ibist_rx_errstat_1)
if (enabled && (!mcu1_training_err_enable))
begin
  if (ibist_rx_errstat_1 == 2'b10)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1:IBIST transmission error %d",ibist_rx_errstat_1);
end

always @ (ibist_rx_errstat_2)
if (enabled && (!mcu2_training_err_enable))
begin
  if (ibist_rx_errstat_2 == 2'b10)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2:IBIST transmission error %d",ibist_rx_errstat_2);
end

always @ (ibist_rx_errstat_3)
if (enabled && (!mcu3_training_err_enable))
begin
  if (ibist_rx_errstat_3 == 2'b10)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3:IBIST transmission error %d",ibist_rx_errstat_3);
end

//--------------------------
// WOQ (Wr Dq) Monitors 
//--------------------------

always @ (drif_woq_free_0)
if (enabled)
begin
   `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: Number of Writes dequeued from WOQ = %x", drif_woq_free_0);
end

always @ (drif_woq_free_1)
if (enabled)
begin
   `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: Number of Writes dequeued from WOQ = %x", drif_woq_free_1);
end

always @ (drif_woq_free_2)
if (enabled)
begin
   `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: Number of Writes dequeued from WOQ = %x", drif_woq_free_2);
end

always @ (drif_woq_free_3)
if (enabled)
begin
   `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: Number of Writes dequeued from WOQ = %x", drif_woq_free_3);
end

//-----------------------------
// FBDIC Checkers
//-----------------------------

initial
begin

// Training Seq Err Inj Init Signals

  mcu0_training_err_enable = 1'b0;
  mcu1_training_err_enable = 1'b0;
  mcu2_training_err_enable = 1'b0;
  mcu3_training_err_enable = 1'b0;

// - End

  mcu0_fbdic_f_1_cnt = 2'b0;
  mcu1_fbdic_f_1_cnt = 2'b0;
  mcu2_fbdic_f_1_cnt = 2'b0;
  mcu3_fbdic_f_1_cnt = 2'b0;

  mcu0_wdata_dimm = 3'b0;
  mcu1_wdata_dimm = 3'b0;
  mcu2_wdata_dimm = 3'b0;
  mcu3_wdata_dimm = 3'b0;

  enabled = 1'b1;

  if ($test$plusargs("mcu_fmon_disable"))
    enabled = 1'b0;

  if ($test$plusargs("disable_sync_check"))
     sync_collision_check_enable = 1'b0;
  else
     sync_collision_check_enable = 1'b1;

end

always @ (posedge (drl2clk && enabled))
begin

  // ----- Arbitration/Collision Checks ------

  if ((mcu0_drif_dram_cmd_a==`WR && mcu0_drif_dram_cmd_b==`WR) && (mcu0_drif_dram_dimm_a==mcu0_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: FBDIC cannot issue writes to same dimms in Slot A and B");

  if ((mcu0_drif_dram_cmd_a==`WR && mcu0_drif_dram_cmd_c==`WR) && (mcu0_drif_dram_dimm_a==mcu0_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: FBDIC cannot issue writes to same dimms in Slot A and C");

  if ((mcu0_drif_dram_cmd_b==`WR && mcu0_drif_dram_cmd_c==`WR) && (mcu0_drif_dram_dimm_b==mcu0_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: FBDIC cannot issue writes to same dimms in Slot B and C");

  // MCU1 DIMM Collision Checks

  if ((mcu1_drif_dram_cmd_a==`WR && mcu1_drif_dram_cmd_b==`WR) && (mcu1_drif_dram_dimm_a==mcu1_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: FBDIC cannot issue writes to same dimms in Slot A and B");

  if ((mcu1_drif_dram_cmd_a==`WR && mcu1_drif_dram_cmd_c==`WR) && (mcu1_drif_dram_dimm_a==mcu1_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: FBDIC cannot issue writes to same dimms in Slot A and C");

  if ((mcu1_drif_dram_cmd_b==`WR && mcu1_drif_dram_cmd_c==`WR) && (mcu1_drif_dram_dimm_b==mcu1_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: FBDIC cannot issue writes to same dimms in Slot B and C");

  // MCU2 DIMM Collision Checks

  if ((mcu2_drif_dram_cmd_a==`WR && mcu2_drif_dram_cmd_b==`WR) && (mcu2_drif_dram_dimm_a==mcu2_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: FBDIC cannot issue writes to same dimms in Slot A and B");

  if ((mcu2_drif_dram_cmd_a==`WR && mcu2_drif_dram_cmd_c==`WR) && (mcu2_drif_dram_dimm_a==mcu2_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: FBDIC cannot issue writes to same dimms in Slot A and C");

  if ((mcu2_drif_dram_cmd_b==`WR && mcu2_drif_dram_cmd_c==`WR) && (mcu2_drif_dram_dimm_b==mcu2_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: FBDIC cannot issue writes to same dimms in Slot B and C");

  // MCU3 DIMM Collision Checks

  if ((mcu3_drif_dram_cmd_a==`WR && mcu3_drif_dram_cmd_b==`WR) && (mcu3_drif_dram_dimm_a==mcu3_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: FBDIC cannot issue writes to same dimms in Slot A and B");

  if ((mcu3_drif_dram_cmd_a==`WR && mcu3_drif_dram_cmd_c==`WR) && (mcu3_drif_dram_dimm_a==mcu3_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: FBDIC cannot issue writes to same dimms in Slot A and C");

  if ((mcu3_drif_dram_cmd_b==`WR && mcu3_drif_dram_cmd_c==`WR) && (mcu3_drif_dram_dimm_b==mcu3_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: FBDIC cannot issue writes to same dimms in Slot B and C");

  // ---- Read Slot A Checkers -----

  // MCU0 1 RD/Frame Check 
  if((mcu0_drif_dram_cmd_a==`RD && mcu0_drif_dram_cmd_b==`RD) ||
     (mcu0_drif_dram_cmd_b==`RD && mcu0_drif_dram_cmd_c==`RD) ||
     (mcu0_drif_dram_cmd_a==`RD && mcu0_drif_dram_cmd_c==`RD) ||
     (mcu0_drif_dram_cmd_a==`RD && mcu0_drif_dram_cmd_b==`RD && mcu0_drif_dram_cmd_c==`RD))
       `PR_ERROR("mcu_fmon", `ERROR, "MCU0:  FBDIC cannot issue more than 1 RD command per frame");  

  // MCU1 1 RD/Frame Check 
  if((mcu1_drif_dram_cmd_a==`RD && mcu1_drif_dram_cmd_b==`RD) ||
     (mcu1_drif_dram_cmd_b==`RD && mcu1_drif_dram_cmd_c==`RD) ||
     (mcu1_drif_dram_cmd_a==`RD && mcu1_drif_dram_cmd_c==`RD) ||
     (mcu1_drif_dram_cmd_a==`RD && mcu1_drif_dram_cmd_b==`RD && mcu1_drif_dram_cmd_c==`RD))
       `PR_ERROR("mcu_fmon", `ERROR, "MCU1:  FBDIC cannot issue more than 1 RD command per frame");  

  // MCU2 1 RD/Frame Check 
  if((mcu2_drif_dram_cmd_a==`RD && mcu2_drif_dram_cmd_b==`RD) ||
     (mcu2_drif_dram_cmd_b==`RD && mcu2_drif_dram_cmd_c==`RD) ||
     (mcu2_drif_dram_cmd_a==`RD && mcu2_drif_dram_cmd_c==`RD) ||
     (mcu2_drif_dram_cmd_a==`RD && mcu2_drif_dram_cmd_b==`RD && mcu2_drif_dram_cmd_c==`RD))
       `PR_ERROR("mcu_fmon", `ERROR, "MCU2:  FBDIC cannot issue more than 1 RD command per frame");  

  // MCU3 1 RD/Frame Check 
  if((mcu3_drif_dram_cmd_a==`RD && mcu3_drif_dram_cmd_b==`RD) ||
     (mcu3_drif_dram_cmd_b==`RD && mcu3_drif_dram_cmd_c==`RD) ||
     (mcu3_drif_dram_cmd_a==`RD && mcu3_drif_dram_cmd_c==`RD) ||
     (mcu3_drif_dram_cmd_a==`RD && mcu3_drif_dram_cmd_b==`RD && mcu3_drif_dram_cmd_c==`RD))
       `PR_ERROR("mcu_fmon", `ERROR, "MCU3:  FBDIC cannot issue more than 1 RD command per frame");  

  // MCU0 1 RD(Slot A) Check
  if (mcu0_drif_dram_cmd_b==`RD || mcu0_drif_dram_cmd_c==`RD)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: FBDIC cannot issue RD CMD in Slots B or C");

  // MCU1 1 RD(Slot A) Check
  if (mcu1_drif_dram_cmd_b==`RD || mcu1_drif_dram_cmd_c==`RD)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: FBDIC cannot issue RD CMD in Slots B or C");

  // MCU2 1 RD(Slot A) Check
  if (mcu2_drif_dram_cmd_b==`RD || mcu2_drif_dram_cmd_c==`RD)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: FBDIC cannot issue RD CMD in Slots B or C");

  // MCU3 1 RD(Slot A) Check
  if (mcu3_drif_dram_cmd_b==`RD || mcu3_drif_dram_cmd_c==`RD)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: FBDIC cannot issue RD CMD in Slots B or C");

  // ---- Read (Slot A) & Auto Ref Collision Checks ----

  // MCU0 RD(A) & Auto Ref(B) Check
  if ((mcu0_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_REF && mcu0_drif_dram_cmd_a==`RD) && (mcu0_drif_dram_dimm_a == mcu0_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: FBDIC cannot issue RD CMD (A) and Auto Ref (B) addressed to same DIMM in same cycle");

  // MCU1 RD(A) & Auto Ref(B) Check
  if ((mcu1_drif_dram_cmd_b==`CMD_OTHER && mcu1_drif_dram_addr_b == `CMD_OTHER_REF && mcu1_drif_dram_cmd_a==`RD) && (mcu1_drif_dram_dimm_a == mcu1_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: FBDIC cannot issue RD CMD (A) and Auto Ref (B) addressed to same DIMM in same cycle");

  // MCU2 RD(A) & Auto Ref(B) Check
  if ((mcu2_drif_dram_cmd_b==`CMD_OTHER && mcu2_drif_dram_addr_b == `CMD_OTHER_REF && mcu2_drif_dram_cmd_a==`RD) && (mcu2_drif_dram_dimm_a == mcu2_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: FBDIC cannot issue RD CMD (A) and Auto Ref (B) addressed to same DIMM in same cycle");

  // MCU3 RD(A) & Auto Ref(B) Check
  if ((mcu3_drif_dram_cmd_b==`CMD_OTHER && mcu3_drif_dram_addr_b == `CMD_OTHER_REF && mcu3_drif_dram_cmd_a==`RD) && (mcu3_drif_dram_dimm_a == mcu3_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: FBDIC cannot issue RD CMD (A) and Auto Ref (B) addressed to same DIMM in same cycle");

  // ---- Write (Slot A) & Auto Ref Collision Checks ----

  // MCU0 WR(A) & Auto Ref(B) Check
  if ((mcu0_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_REF && mcu0_drif_dram_cmd_a==`WR) && (mcu0_drif_dram_dimm_a == mcu0_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: FBDIC cannot issue WR CMD (A) and Auto Ref (B) addressed to same DIMM in same cycle");

  // MCU1 WR(A) & Auto Ref(B) Check
  if ((mcu1_drif_dram_cmd_b==`CMD_OTHER && mcu1_drif_dram_addr_b == `CMD_OTHER_REF && mcu1_drif_dram_cmd_a==`WR) && (mcu1_drif_dram_dimm_a == mcu1_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: FBDIC cannot issue WR CMD (A) and Auto Ref (B) addressed to same DIMM in same cycle");

  // MCU2 WR(A) & Auto Ref(B) Check
  if ((mcu2_drif_dram_cmd_b==`CMD_OTHER && mcu2_drif_dram_addr_b == `CMD_OTHER_REF && mcu2_drif_dram_cmd_a==`WR) && (mcu2_drif_dram_dimm_a == mcu2_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: FBDIC cannot issue WR CMD (A) and Auto Ref (B) addressed to same DIMM in same cycle");

  // MCU3 WR(A) & Auto Ref(B) Check
  if ((mcu3_drif_dram_cmd_b==`CMD_OTHER && mcu3_drif_dram_addr_b == `CMD_OTHER_REF && mcu3_drif_dram_cmd_a==`WR) && (mcu3_drif_dram_dimm_a == mcu3_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: FBDIC cannot issue WR CMD (A) and Auto Ref (B) addressed to same DIMM in same cycle");

  // ---- Write (Slot C) & Auto Ref Collision Checks ----

  // MCU0 WR(C) & Auto Ref(B) Check
  if ((mcu0_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_REF && mcu0_drif_dram_cmd_c==`WR) && (mcu0_drif_dram_dimm_c == mcu0_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: FBDIC cannot issue WR CMD (C) and Auto Ref (B) addressed to same DIMM in same cycle");

  // MCU1 WR(C) & Auto Ref(B) Check
  if ((mcu1_drif_dram_cmd_b==`CMD_OTHER && mcu1_drif_dram_addr_b == `CMD_OTHER_REF && mcu1_drif_dram_cmd_c==`WR) && (mcu1_drif_dram_dimm_c == mcu1_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: FBDIC cannot issue WR CMD (C) and Auto Ref (B) addressed to same DIMM in same cycle");

  // MCU2 WR(C) & Auto Ref(B) Check
  if ((mcu2_drif_dram_cmd_b==`CMD_OTHER && mcu2_drif_dram_addr_b == `CMD_OTHER_REF && mcu2_drif_dram_cmd_c==`WR) && (mcu2_drif_dram_dimm_c == mcu2_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: FBDIC cannot issue WR CMD (C) and Auto Ref (B) addressed to same DIMM in same cycle");

  // MCU3 WR(C) & Auto Ref(B) Check
  if ((mcu3_drif_dram_cmd_b==`CMD_OTHER && mcu3_drif_dram_addr_b == `CMD_OTHER_REF && mcu3_drif_dram_cmd_c==`WR) && (mcu3_drif_dram_dimm_c == mcu3_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: FBDIC cannot issue WR CMD (C) and Auto Ref (B) addressed to same DIMM in same cycle");

  // ---- Activate (Slot A) & Auto Ref Collision Checks ----

  // MCU0 ACT(A) & Auto Ref(B) Check
  if ((mcu0_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_REF && mcu0_drif_dram_cmd_a==`ACT) && (mcu0_drif_dram_dimm_a == mcu0_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: FBDIC cannot issue ACT CMD (A) and Auto Ref (B) addressed to same DIMM in same cycle");

  // MCU1 ACT(A) & Auto Ref(B) Check
  if ((mcu1_drif_dram_cmd_b==`CMD_OTHER && mcu1_drif_dram_addr_b == `CMD_OTHER_REF && mcu1_drif_dram_cmd_a==`ACT) && (mcu1_drif_dram_dimm_a == mcu1_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: FBDIC cannot issue ACT CMD (A) and Auto Ref (B) addressed to same DIMM in same cycle");

  // MCU2 ACT(A) & Auto Ref(B) Check
  if ((mcu2_drif_dram_cmd_b==`CMD_OTHER && mcu2_drif_dram_addr_b == `CMD_OTHER_REF && mcu2_drif_dram_cmd_a==`ACT) && (mcu2_drif_dram_dimm_a == mcu2_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: FBDIC cannot issue ACT CMD (A) and Auto Ref (B) addressed to same DIMM in same cycle");

  // MCU3 ACT(A) & Auto Ref(B) Check
  if ((mcu3_drif_dram_cmd_b==`CMD_OTHER && mcu3_drif_dram_addr_b == `CMD_OTHER_REF && mcu3_drif_dram_cmd_a==`ACT) && (mcu3_drif_dram_dimm_a == mcu3_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: FBDIC cannot issue ACT CMD (A) and Auto Ref (B) addressed to same DIMM in same cycle");

  // ---- Activate (Slot C) & Auto Ref Collision Checks ----

  // MCU0 ACT(C) & Auto Ref(B) Check
  if ((mcu0_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_REF && mcu0_drif_dram_cmd_c==`ACT) && (mcu0_drif_dram_dimm_c == mcu0_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: FBDIC cannot issue ACT CMD (A) and Auto Ref (B) addressed to same DIMM in same cycle");

  // MCU1 ACT(C) & Auto Ref(B) Check
  if ((mcu1_drif_dram_cmd_b==`CMD_OTHER && mcu1_drif_dram_addr_b == `CMD_OTHER_REF && mcu1_drif_dram_cmd_c==`ACT) && (mcu1_drif_dram_dimm_c == mcu1_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: FBDIC cannot issue ACT CMD (A) and Auto Ref (B) addressed to same DIMM in same cycle");

  // MCU2 ACT(C) & Auto Ref(B) Check
  if ((mcu2_drif_dram_cmd_b==`CMD_OTHER && mcu2_drif_dram_addr_b == `CMD_OTHER_REF && mcu2_drif_dram_cmd_c==`ACT) && (mcu2_drif_dram_dimm_c == mcu2_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: FBDIC cannot issue ACT CMD (A) and Auto Ref (B) addressed to same DIMM in same cycle");

  // MCU3 ACT(C) & Auto Ref(B) Check
  if ((mcu3_drif_dram_cmd_b==`CMD_OTHER && mcu3_drif_dram_addr_b == `CMD_OTHER_REF && mcu3_drif_dram_cmd_c==`ACT) && (mcu3_drif_dram_dimm_c == mcu3_drif_dram_dimm_b))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: FBDIC cannot issue ACT CMD (A) and Auto Ref (B) addressed to same DIMM in same cycle");

  // ---- Auto Ref(B) & Power Down(C) Collision Checks ----

  if ((mcu0_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_REF && mcu0_drif_dram_cmd_c==`CMD_OTHER && mcu0_drif_dram_addr_c == `CMD_OTHER_SRPDX) && (mcu0_drif_dram_dimm_b == mcu0_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: FBDIC cannot issue Auto Ref (B) and Power Down (C) addressed to same DIMM in same cycle");

  if ((mcu1_drif_dram_cmd_b==`CMD_OTHER && mcu1_drif_dram_addr_b == `CMD_OTHER_REF && mcu1_drif_dram_cmd_c==`CMD_OTHER && mcu1_drif_dram_addr_c == `CMD_OTHER_SRPDX) && (mcu1_drif_dram_dimm_b == mcu1_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: FBDIC cannot issue Auto Ref (B) and Power Down (C) addressed to same DIMM in same cycle");

  if ((mcu2_drif_dram_cmd_b==`CMD_OTHER && mcu2_drif_dram_addr_b == `CMD_OTHER_REF && mcu2_drif_dram_cmd_c==`CMD_OTHER && mcu2_drif_dram_addr_c == `CMD_OTHER_SRPDX) && (mcu2_drif_dram_dimm_b == mcu2_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: FBDIC cannot issue Auto Ref (B) and Power Down (C) addressed to same DIMM in same cycle");

  if ((mcu3_drif_dram_cmd_b==`CMD_OTHER && mcu3_drif_dram_addr_b == `CMD_OTHER_REF && mcu3_drif_dram_cmd_c==`CMD_OTHER && mcu3_drif_dram_addr_c == `CMD_OTHER_SRPDX) && (mcu3_drif_dram_dimm_b == mcu3_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: FBDIC cannot issue Auto Ref (B) and Power Down (C) addressed to same DIMM in same cycle");

  // ---- Auto Ref(B) & Power Enter(C) Collision Checks ----

  if ((mcu0_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_REF && mcu0_drif_dram_cmd_c==`CMD_OTHER && mcu0_drif_dram_addr_c == `CMD_OTHER_PDE) && (mcu0_drif_dram_dimm_b == mcu0_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: FBDIC cannot issue Auto Ref (B) and Power Enter (C) addressed to same DIMM in same cycle");

  if ((mcu1_drif_dram_cmd_b==`CMD_OTHER && mcu1_drif_dram_addr_b == `CMD_OTHER_REF && mcu1_drif_dram_cmd_c==`CMD_OTHER && mcu1_drif_dram_addr_c == `CMD_OTHER_PDE) && (mcu1_drif_dram_dimm_b == mcu1_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: FBDIC cannot issue Auto Ref (B) and Power Enter (C) addressed to same DIMM in same cycle");

  if ((mcu2_drif_dram_cmd_b==`CMD_OTHER && mcu2_drif_dram_addr_b == `CMD_OTHER_REF && mcu2_drif_dram_cmd_c==`CMD_OTHER && mcu2_drif_dram_addr_c == `CMD_OTHER_PDE) && (mcu2_drif_dram_dimm_b == mcu2_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: FBDIC cannot issue Auto Ref (B) and Power Enter (C) addressed to same DIMM in same cycle");

  if ((mcu3_drif_dram_cmd_b==`CMD_OTHER && mcu3_drif_dram_addr_b == `CMD_OTHER_REF && mcu3_drif_dram_cmd_c==`CMD_OTHER && mcu3_drif_dram_addr_c == `CMD_OTHER_PDE) && (mcu3_drif_dram_dimm_b == mcu3_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: FBDIC cannot issue Auto Ref (B) and Power Enter (C) addressed to same DIMM in same cycle");

  // ---- Self Ref(B) & Power Down(C) Collision Checks ----

  if ((mcu0_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_SRE && mcu0_drif_dram_cmd_c==`CMD_OTHER && mcu0_drif_dram_addr_c == `CMD_OTHER_SRPDX) && (mcu0_drif_dram_dimm_b == mcu0_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: FBDIC cannot issue Self Ref (B) and Power Down (C) addressed to same DIMM in same cycle");

  if ((mcu1_drif_dram_cmd_b==`CMD_OTHER && mcu1_drif_dram_addr_b == `CMD_OTHER_SRE && mcu1_drif_dram_cmd_c==`CMD_OTHER && mcu1_drif_dram_addr_c == `CMD_OTHER_SRPDX) && (mcu1_drif_dram_dimm_b == mcu1_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: FBDIC cannot issue Self Ref (B) and Power Down (C) addressed to same DIMM in same cycle");

  if ((mcu2_drif_dram_cmd_b==`CMD_OTHER && mcu2_drif_dram_addr_b == `CMD_OTHER_SRE && mcu2_drif_dram_cmd_c==`CMD_OTHER && mcu2_drif_dram_addr_c == `CMD_OTHER_SRPDX) && (mcu2_drif_dram_dimm_b == mcu2_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: FBDIC cannot issue Self Ref (B) and Power Down (C) addressed to same DIMM in same cycle");

  if ((mcu3_drif_dram_cmd_b==`CMD_OTHER && mcu3_drif_dram_addr_b == `CMD_OTHER_SRE && mcu3_drif_dram_cmd_c==`CMD_OTHER && mcu3_drif_dram_addr_c == `CMD_OTHER_SRPDX) && (mcu3_drif_dram_dimm_b == mcu3_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: FBDIC cannot issue Self Ref (B) and Power Down (C) addressed to same DIMM in same cycle");

  // ---- Self Ref(B) & Power Enter(C) Collision Checks ----

  if ((mcu0_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_SRE && mcu0_drif_dram_cmd_c==`CMD_OTHER && mcu0_drif_dram_addr_c == `CMD_OTHER_PDE) && (mcu0_drif_dram_dimm_b == mcu0_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: FBDIC cannot issue Self Ref (B) and Power Enter (C) addressed to same DIMM in same cycle");

  if ((mcu1_drif_dram_cmd_b==`CMD_OTHER && mcu1_drif_dram_addr_b == `CMD_OTHER_SRE && mcu1_drif_dram_cmd_c==`CMD_OTHER && mcu1_drif_dram_addr_c == `CMD_OTHER_PDE) && (mcu1_drif_dram_dimm_b == mcu1_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: FBDIC cannot issue Self Ref (B) and Power Enter (C) addressed to same DIMM in same cycle");

  if ((mcu2_drif_dram_cmd_b==`CMD_OTHER && mcu2_drif_dram_addr_b == `CMD_OTHER_SRE && mcu2_drif_dram_cmd_c==`CMD_OTHER && mcu2_drif_dram_addr_c == `CMD_OTHER_PDE) && (mcu2_drif_dram_dimm_b == mcu2_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: FBDIC cannot issue Self Ref (B) and Power Enter (C) addressed to same DIMM in same cycle");

  if ((mcu3_drif_dram_cmd_b==`CMD_OTHER && mcu3_drif_dram_addr_b == `CMD_OTHER_SRE && mcu3_drif_dram_cmd_c==`CMD_OTHER && mcu3_drif_dram_addr_c == `CMD_OTHER_PDE) && (mcu3_drif_dram_dimm_b == mcu3_drif_dram_dimm_c))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: FBDIC cannot issue Self Ref (B) and Power Enter (C) addressed to same DIMM in same cycle");

  // ---- Tick Monitor : Sync Frame Req ----
 
  if (fbdic_sync_frame_req_0)
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: SYNC Frame request issued");
  if (fbdic_sync_frame_req_1)
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: SYNC Frame request issued");
  if (fbdic_sync_frame_req_2)
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: SYNC Frame request issued");
  if (fbdic_sync_frame_req_3)
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: SYNC Frame request issued");

  //----------------------------------------------------------------------------------------------
  //					M C U 0 - phys addr gen
  //----------------------------------------------------------------------------------------------

  mcu0_physical_addr_a = 40'b0;
  mcu0_physical_addr_b = 40'b0;
  mcu0_physical_addr_c = 40'b0;

/*
reg	    chnl_type;		    	// Dual Channel (1) or Single Channel (0)
reg	    rank_addr;		    	// RANK HIGH (1), RANK LOW (0)
reg	    rank;		    	// 1S (no stack dimm,0) or 2S (yes stack dimm,1)
reg  [1:0]  dimm_size ;     		// 256M=00, 512M=01, 1G=10, 2G=11
reg  [2:0]  num_dimms;			// DIMM NUMBERS: 1D=1, 2D=2, ... , 7D=7, 8D=0
*/

  case({chnl_type, rank_addr, rank, dimm_size, num_dimms})

  //-------------------------------
  // DUAL CHANNEL, RANK HIGH 
  //-------------------------------

  8'b1_1_0_00_001,
  8'b1_1_0_00_010,
  8'b1_1_0_00_100, 
  8'b1_1_0_00_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_dimm_a, mcu0_drif_dram_ras_addr_a[12:0], 
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:2], 
                                             mcu0_drif_dram_bank_a[1], 2'b00, mcu0_drif_dram_bank_a[0],
                                             mcu0_drif_dram_addr_a[1], 5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_dimm_b, mcu0_drif_dram_ras_addr_b[12:0], 
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:2],
                                             mcu0_drif_dram_bank_b[1], 2'b00, mcu0_drif_dram_bank_b[0], 
                                             mcu0_drif_dram_addr_b[1], 5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_dimm_c, mcu0_drif_dram_ras_addr_c[12:0], 
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:2],
                                             mcu0_drif_dram_bank_c[1], 2'b00, mcu0_drif_dram_bank_c[0],
                                             mcu0_drif_dram_addr_c[1], 5'b00000};
                   end
  8'b1_1_1_00_001,
  8'b1_1_1_00_010,
  8'b1_1_1_00_100, 
  8'b1_1_1_00_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_dimm_a, mcu0_drif_dram_ras_addr_a[12:0], 
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:2],
                                             mcu0_drif_dram_bank_a[1], 2'b00, mcu0_drif_dram_bank_a[0],
                                             mcu0_drif_dram_addr_a[1], 5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_dimm_b, mcu0_drif_dram_ras_addr_b[12:0], 
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:2],
                                             mcu0_drif_dram_bank_b[1], 2'b00, mcu0_drif_dram_bank_b[0],
                                             mcu0_drif_dram_addr_b[1], 5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_dimm_c, mcu0_drif_dram_ras_addr_c[12:0], 
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:2],
                                             mcu0_drif_dram_bank_c[1], 2'b00, mcu0_drif_dram_bank_c[0],
                                             mcu0_drif_dram_addr_c[1], 5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu0_physical_addr_a[32] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[32] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[32] = mcu0_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu0_physical_addr_a[33] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[33] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[33] = mcu0_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu0_physical_addr_a[34] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[34] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[34] = mcu0_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu0_physical_addr_a[35] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[35] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[35] = mcu0_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b1_1_0_01_001,
  8'b1_1_0_01_010,
  8'b1_1_0_01_100, 
  8'b1_1_0_01_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_dimm_a, mcu0_drif_dram_ras_addr_a[13:0], 
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:2],
                                             mcu0_drif_dram_bank_a[1], 2'b00, mcu0_drif_dram_bank_a[0],
                                             mcu0_drif_dram_addr_a[1], 5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_dimm_b, mcu0_drif_dram_ras_addr_b[13:0], 
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:2], 
                                             mcu0_drif_dram_bank_b[1], 2'b00, mcu0_drif_dram_bank_b[0],
                                             mcu0_drif_dram_addr_b[1], 5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_dimm_c, mcu0_drif_dram_ras_addr_c[13:0], 
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:2],
                                             mcu0_drif_dram_bank_c[1], 2'b00, mcu0_drif_dram_bank_c[0],
                                             mcu0_drif_dram_addr_c[1], 5'b00000};
                   end
  8'b1_1_1_01_001,
  8'b1_1_1_01_010,
  8'b1_1_1_01_100, 
  8'b1_1_1_01_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_dimm_a, mcu0_drif_dram_ras_addr_a[13:0], 
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:2], 
                                             mcu0_drif_dram_bank_a[1], 2'b00, mcu0_drif_dram_bank_a[0], 
                                             mcu0_drif_dram_addr_a[1], 5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_dimm_b, mcu0_drif_dram_ras_addr_b[13:0], 
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:2],
                                             mcu0_drif_dram_bank_b[1], 2'b00, mcu0_drif_dram_bank_b[0],
                                             mcu0_drif_dram_addr_b[1], 5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_dimm_c, mcu0_drif_dram_ras_addr_c[13:0], 
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:2],
                                             mcu0_drif_dram_bank_c[1], 2'b00, mcu0_drif_dram_bank_c[0], 
                                             mcu0_drif_dram_addr_c[1], 5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu0_physical_addr_a[33] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[33] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[33] = mcu0_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu0_physical_addr_a[34] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[34] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[34] = mcu0_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu0_physical_addr_a[35] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[35] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[35] = mcu0_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu0_physical_addr_a[36] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[36] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[36] = mcu0_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b1_1_0_10_001,
  8'b1_1_0_10_010,
  8'b1_1_0_10_100, 
  8'b1_1_0_10_000: begin
  		     		 mcu0_physical_addr_a = {mcu0_drif_dram_dimm_a, mcu0_drif_dram_addr_a[2], 
                                    	     mcu0_drif_dram_ras_addr_a[13:0],  mcu0_drif_dram_addr_a[11],
                                     		 mcu0_drif_dram_addr_a[9:3], mcu0_drif_dram_bank_a[2:1],
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[1], 5'b00000};
             		 mcu0_physical_addr_b = {mcu0_drif_dram_dimm_b, mcu0_drif_dram_addr_b[2],
                                    	     mcu0_drif_dram_ras_addr_b[13:0],  mcu0_drif_dram_addr_b[11],
                                     		 mcu0_drif_dram_addr_b[9:3], mcu0_drif_dram_bank_b[2:1], 
                                     	     2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[1], 5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_dimm_c, mcu0_drif_dram_addr_c[2], 
                                             mcu0_drif_dram_ras_addr_c[13:0],  mcu0_drif_dram_addr_c[11],
                                             mcu0_drif_dram_addr_c[9:3], mcu0_drif_dram_bank_c[2:1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[1], 5'b00000};
                   end
  8'b1_1_1_10_001,
  8'b1_1_1_10_010,
  8'b1_1_1_10_100, 
  8'b1_1_1_10_000: begin
  		             mcu0_physical_addr_a = {mcu0_drif_dram_dimm_a, mcu0_drif_dram_addr_a[2], 
                                             mcu0_drif_dram_ras_addr_a[13:0],  mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:3], 
                                             mcu0_drif_dram_bank_a[2:1], 2'b00, mcu0_drif_dram_bank_a[0],
                                             mcu0_drif_dram_addr_a[1], 5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_dimm_b, mcu0_drif_dram_addr_b[2],
                                             mcu0_drif_dram_ras_addr_b[13:0],  mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:3],
                                             mcu0_drif_dram_bank_b[2:1], 2'b00, mcu0_drif_dram_bank_b[0],
                                             mcu0_drif_dram_addr_b[1], 5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_dimm_c, mcu0_drif_dram_addr_c[2], 
                                             mcu0_drif_dram_ras_addr_c[13:0],  mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:3],
                                             mcu0_drif_dram_bank_c[2:1], 2'b00, mcu0_drif_dram_bank_c[0], 
                                             mcu0_drif_dram_addr_c[1], 5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu0_physical_addr_a[34] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[34] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[34] = mcu0_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu0_physical_addr_a[35] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[35] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[35] = mcu0_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu0_physical_addr_a[36] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[36] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[36] = mcu0_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu0_physical_addr_a[37] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[37] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[37] = mcu0_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b1_1_0_11_001,
  8'b1_1_0_11_010,
  8'b1_1_0_11_100, 
  8'b1_1_0_11_000: begin
  		     mcu0_physical_addr_a = {mcu0_drif_dram_dimm_a, mcu0_drif_dram_addr_a[2], 
                                             mcu0_drif_dram_ras_addr_a[14:0],  mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:3], 
                                             mcu0_drif_dram_bank_a[2:1], 2'b00, mcu0_drif_dram_bank_a[0],
                                             mcu0_drif_dram_addr_a[1], 5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_dimm_b, mcu0_drif_dram_addr_b[2],
                                             mcu0_drif_dram_ras_addr_b[14:0],  mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:3],
                                             mcu0_drif_dram_bank_b[2:1], 2'b00, mcu0_drif_dram_bank_b[0],
                                             mcu0_drif_dram_addr_b[1], 5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_dimm_c, mcu0_drif_dram_addr_c[2], 
                                             mcu0_drif_dram_ras_addr_c[14:0],  mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:3],
                                             mcu0_drif_dram_bank_c[2:1], 2'b00, mcu0_drif_dram_bank_c[0], 
                                             mcu0_drif_dram_addr_c[1], 5'b00000};
                   end
  8'b1_1_1_11_001,
  8'b1_1_1_11_010,
  8'b1_1_1_11_100, 
  8'b1_1_1_11_000: begin
  		     mcu0_physical_addr_a = {mcu0_drif_dram_dimm_a, mcu0_drif_dram_addr_a[2], 
                                             mcu0_drif_dram_ras_addr_a[14:0],  mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:3], 
                                             mcu0_drif_dram_bank_a[2:1], 2'b00, mcu0_drif_dram_bank_a[0],
                                             mcu0_drif_dram_addr_a[1], 5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_dimm_b, mcu0_drif_dram_addr_b[2],
                                             mcu0_drif_dram_ras_addr_b[14:0],  mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:3],
                                             mcu0_drif_dram_bank_b[2:1], 2'b00, mcu0_drif_dram_bank_b[0],
                                             mcu0_drif_dram_addr_b[1], 5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_dimm_c, mcu0_drif_dram_addr_c[2], 
                                             mcu0_drif_dram_ras_addr_c[14:0],  mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:3],
                                             mcu0_drif_dram_bank_c[2:1], 2'b00, mcu0_drif_dram_bank_c[0], 
                                             mcu0_drif_dram_addr_c[1], 5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu0_physical_addr_a[35] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[35] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[35] = mcu0_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu0_physical_addr_a[36] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[36] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[36] = mcu0_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu0_physical_addr_a[37] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[37] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[37] = mcu0_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu0_physical_addr_a[38] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[38] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[38] = mcu0_drif_dram_rank_c;
			  end
                     endcase
                   end

  //---------------------------
  // SINGLE CHANNEL, RANK HIGH 
  //---------------------------

  8'b0_1_0_00_001,
  8'b0_1_0_00_010,
  8'b0_1_0_00_100, 
  8'b0_1_0_00_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_dimm_a, mcu0_drif_dram_ras_addr_a[12:0], 
                                              mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:3], mcu0_drif_dram_bank_a[1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_dimm_b, mcu0_drif_dram_ras_addr_b[12:0], 
                                              mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:3], mcu0_drif_dram_bank_b[1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_dimm_c, mcu0_drif_dram_ras_addr_c[12:0], 
                                              mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:3], mcu0_drif_dram_bank_c[1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[2], 
                                             5'b00000};
                   end
  8'b0_1_1_00_001,
  8'b0_1_1_00_010,
  8'b0_1_1_00_100, 
  8'b0_1_1_00_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_dimm_a, mcu0_drif_dram_ras_addr_a[12:0], 
                                              mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:3], mcu0_drif_dram_bank_a[1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_dimm_b, mcu0_drif_dram_ras_addr_b[12:0], 
                                              mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:3], mcu0_drif_dram_bank_b[1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_dimm_c, mcu0_drif_dram_ras_addr_c[12:0], 
                                              mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:3], mcu0_drif_dram_bank_c[1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[2], 
                                             5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu0_physical_addr_a[31] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[31] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[31] = mcu0_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu0_physical_addr_a[32] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[32] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[32] = mcu0_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu0_physical_addr_a[33] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[33] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[33] = mcu0_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu0_physical_addr_a[34] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[34] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[34] = mcu0_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b0_1_0_01_001,
  8'b0_1_0_01_010,
  8'b0_1_0_01_100, 
  8'b0_1_0_01_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_dimm_a, mcu0_drif_dram_ras_addr_a[13:0], 
                                              mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:3], mcu0_drif_dram_bank_a[1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_dimm_b, mcu0_drif_dram_ras_addr_b[13:0], 
                                              mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:3], mcu0_drif_dram_bank_b[1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_dimm_c, mcu0_drif_dram_ras_addr_c[13:0], 
                                              mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:3], mcu0_drif_dram_bank_c[1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[2], 
                                             5'b00000};
                   end
  8'b0_1_1_01_001,
  8'b0_1_1_01_010,
  8'b0_1_1_01_100, 
  8'b0_1_1_01_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_dimm_a, mcu0_drif_dram_ras_addr_a[13:0], 
                                              mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:3], mcu0_drif_dram_bank_a[1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_dimm_b, mcu0_drif_dram_ras_addr_b[13:0], 
                                              mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:3], mcu0_drif_dram_bank_b[1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_dimm_c, mcu0_drif_dram_ras_addr_c[13:0], 
                                              mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:3], mcu0_drif_dram_bank_c[1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[2], 
                                             5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu0_physical_addr_a[32] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[32] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[32] = mcu0_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu0_physical_addr_a[33] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[33] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[33] = mcu0_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu0_physical_addr_a[34] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[34] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[34] = mcu0_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu0_physical_addr_a[35] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[35] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[35] = mcu0_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b0_1_0_10_001,
  8'b0_1_0_10_010,
  8'b0_1_0_10_100, 
  8'b0_1_0_10_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_dimm_a, mcu0_drif_dram_addr_a[3],
                                             mcu0_drif_dram_ras_addr_a[13:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:4], mcu0_drif_dram_bank_a[2:1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_dimm_b, mcu0_drif_dram_addr_b[3],
                                             mcu0_drif_dram_ras_addr_b[13:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:4], mcu0_drif_dram_bank_b[2:1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_dimm_c, mcu0_drif_dram_addr_c[3],
                                             mcu0_drif_dram_ras_addr_c[13:0], 
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:4], mcu0_drif_dram_bank_c[2:1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[2], 
                                             5'b00000};
                   end
  8'b0_1_1_10_001,
  8'b0_1_1_10_010,
  8'b0_1_1_10_100, 
  8'b0_1_1_10_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_dimm_a, mcu0_drif_dram_addr_a[3],
                                             mcu0_drif_dram_ras_addr_a[13:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:4], mcu0_drif_dram_bank_a[2:1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_dimm_b, mcu0_drif_dram_addr_b[3],
                                             mcu0_drif_dram_ras_addr_b[13:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:4], mcu0_drif_dram_bank_b[2:1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_dimm_c, mcu0_drif_dram_addr_c[3],
                                             mcu0_drif_dram_ras_addr_c[13:0], 
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:4], mcu0_drif_dram_bank_c[2:1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[2], 
                                             5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu0_physical_addr_a[33] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[33] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[33] = mcu0_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu0_physical_addr_a[34] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[34] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[34] = mcu0_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu0_physical_addr_a[35] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[35] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[35] = mcu0_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu0_physical_addr_a[36] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[36] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[36] = mcu0_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b0_1_0_11_001,
  8'b0_1_0_11_010,
  8'b0_1_0_11_100, 
  8'b0_1_0_11_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_dimm_a, mcu0_drif_dram_addr_a[3],
                                             mcu0_drif_dram_ras_addr_a[14:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:4], mcu0_drif_dram_bank_a[2:1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_dimm_b, mcu0_drif_dram_addr_b[3],
                                             mcu0_drif_dram_ras_addr_b[14:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:4], mcu0_drif_dram_bank_b[2:1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_dimm_c, mcu0_drif_dram_addr_c[3],
                                             mcu0_drif_dram_ras_addr_c[14:0], 
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:4], mcu0_drif_dram_bank_c[2:1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[2], 
                                             5'b00000};
                   end
  8'b0_1_1_11_001,
  8'b0_1_1_11_010,
  8'b0_1_1_11_100, 
  8'b0_1_1_11_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_dimm_a, mcu0_drif_dram_addr_a[3],
                                             mcu0_drif_dram_ras_addr_a[14:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:4], mcu0_drif_dram_bank_a[2:1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_dimm_b, mcu0_drif_dram_addr_b[3],
                                             mcu0_drif_dram_ras_addr_b[14:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:4], mcu0_drif_dram_bank_b[2:1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_dimm_c, mcu0_drif_dram_addr_c[3],
                                             mcu0_drif_dram_ras_addr_c[14:0], 
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:4], mcu0_drif_dram_bank_c[2:1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[2], 
                                             5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu0_physical_addr_a[34] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[34] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[34] = mcu0_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu0_physical_addr_a[35] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[35] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[35] = mcu0_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu0_physical_addr_a[36] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[36] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[36] = mcu0_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu0_physical_addr_a[37] = mcu0_drif_dram_rank_a;
                            mcu0_physical_addr_b[37] = mcu0_drif_dram_rank_b;
                            mcu0_physical_addr_c[37] = mcu0_drif_dram_rank_c;
			  end
                     endcase
                   end

  //---------------------------
  // DUAL CHANNEL, RANK LOW 
  //---------------------------

  8'b1_0_0_00_001,
  8'b1_0_0_00_010,
  8'b1_0_0_00_100,
  8'b1_0_0_00_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_ras_addr_a[12:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:2], mcu0_drif_dram_bank_a[1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_ras_addr_b[12:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:2], mcu0_drif_dram_bank_b[1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_ras_addr_c[12:0],  
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:2], mcu0_drif_dram_bank_c[1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                          end
                     010: begin
                            mcu0_physical_addr_a[32] = mcu0_drif_dram_addr_a[2];  
                            mcu0_physical_addr_a[10] = mcu0_drif_dram_dimm_a[0];  
                            mcu0_physical_addr_b[32] = mcu0_drif_dram_addr_b[2];  
                            mcu0_physical_addr_b[10] = mcu0_drif_dram_dimm_b[0];  
                            mcu0_physical_addr_c[32] = mcu0_drif_dram_addr_c[2];  
                            mcu0_physical_addr_c[10] = mcu0_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu0_physical_addr_a[33:32] = mcu0_drif_dram_addr_a[3:2];  
                            mcu0_physical_addr_a[11:10] = mcu0_drif_dram_dimm_a[1:0];  
                            mcu0_physical_addr_b[33:32] = mcu0_drif_dram_addr_b[3:2];  
                            mcu0_physical_addr_b[11:10] = mcu0_drif_dram_dimm_b[1:0];  
                            mcu0_physical_addr_c[33:32] = mcu0_drif_dram_addr_c[3:2];  
                            mcu0_physical_addr_c[11:10] = mcu0_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu0_physical_addr_a[34:32] = mcu0_drif_dram_addr_a[4:2];  
                            mcu0_physical_addr_a[12:10] = mcu0_drif_dram_dimm_a[2:0];  
                            mcu0_physical_addr_b[34:32] = mcu0_drif_dram_addr_b[4:2];  
                            mcu0_physical_addr_b[12:10] = mcu0_drif_dram_dimm_b[2:0];  
                            mcu0_physical_addr_c[34:32] = mcu0_drif_dram_addr_c[4:2];  
                            mcu0_physical_addr_c[12:10] = mcu0_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b1_0_1_00_001,
  8'b1_0_1_00_010,
  8'b1_0_1_00_100,
  8'b1_0_1_00_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_ras_addr_a[12:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:2], mcu0_drif_dram_bank_a[1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_ras_addr_b[12:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:2], mcu0_drif_dram_bank_b[1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_ras_addr_c[12:0],  
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:2], mcu0_drif_dram_bank_c[1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu0_physical_addr_a[32] = mcu0_drif_dram_addr_a[2];  
                            mcu0_physical_addr_a[10] = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[32] = mcu0_drif_dram_addr_b[2];  
                            mcu0_physical_addr_b[10] = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[32] = mcu0_drif_dram_addr_c[2];  
                            mcu0_physical_addr_c[10] = mcu0_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu0_physical_addr_a[33:32] = mcu0_drif_dram_addr_a[3:2];  
                            mcu0_physical_addr_a[10]    = mcu0_drif_dram_dimm_a[0];  
                            mcu0_physical_addr_a[11]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[33:32] = mcu0_drif_dram_addr_b[3:2];  
                            mcu0_physical_addr_b[10]    = mcu0_drif_dram_dimm_b[0];  
                            mcu0_physical_addr_b[11]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[33:32] = mcu0_drif_dram_addr_c[3:2];  
                            mcu0_physical_addr_c[10]    = mcu0_drif_dram_dimm_c[0];  
                            mcu0_physical_addr_c[11]    = mcu0_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu0_physical_addr_a[34:32] = mcu0_drif_dram_addr_a[4:2];  
                            mcu0_physical_addr_a[11:10] = mcu0_drif_dram_dimm_a[1:0];  
                            mcu0_physical_addr_a[12]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[34:32] = mcu0_drif_dram_addr_b[4:2];  
                            mcu0_physical_addr_b[11:10] = mcu0_drif_dram_dimm_b[1:0];  
                            mcu0_physical_addr_b[12]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[34:32] = mcu0_drif_dram_addr_c[4:2];  
                            mcu0_physical_addr_c[11:10] = mcu0_drif_dram_dimm_c[1:0];  
                            mcu0_physical_addr_c[12]    = mcu0_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu0_physical_addr_a[35:32] = mcu0_drif_dram_addr_a[5:2];  
                            mcu0_physical_addr_a[12:10] = mcu0_drif_dram_dimm_a[2:0];  
                            mcu0_physical_addr_a[13]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[35:32] = mcu0_drif_dram_addr_b[5:2];  
                            mcu0_physical_addr_b[12:10] = mcu0_drif_dram_dimm_b[2:0];  
                            mcu0_physical_addr_b[13]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[35:32] = mcu0_drif_dram_addr_c[5:2];  
                            mcu0_physical_addr_c[12:10] = mcu0_drif_dram_dimm_c[2:0];  
                            mcu0_physical_addr_c[13]    = mcu0_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b1_0_0_01_001,
  8'b1_0_0_01_010,
  8'b1_0_0_01_100,
  8'b1_0_0_01_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_ras_addr_a[13:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:2], mcu0_drif_dram_bank_a[1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_ras_addr_b[13:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:2], mcu0_drif_dram_bank_b[1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_ras_addr_c[13:0],  
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:2], mcu0_drif_dram_bank_c[1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                          end
                     010: begin
                            mcu0_physical_addr_a[33] = mcu0_drif_dram_addr_a[2];  
                            mcu0_physical_addr_a[10] = mcu0_drif_dram_dimm_a[0];  
                            mcu0_physical_addr_b[33] = mcu0_drif_dram_addr_b[2];  
                            mcu0_physical_addr_b[10] = mcu0_drif_dram_dimm_b[0];  
                            mcu0_physical_addr_c[33] = mcu0_drif_dram_addr_c[2];  
                            mcu0_physical_addr_c[10] = mcu0_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu0_physical_addr_a[34:33] = mcu0_drif_dram_addr_a[3:2];  
                            mcu0_physical_addr_a[11:10] = mcu0_drif_dram_dimm_a[1:0];  
                            mcu0_physical_addr_b[34:33] = mcu0_drif_dram_addr_b[3:2];  
                            mcu0_physical_addr_b[11:10] = mcu0_drif_dram_dimm_b[1:0];  
                            mcu0_physical_addr_c[34:33] = mcu0_drif_dram_addr_c[3:2];  
                            mcu0_physical_addr_c[11:10] = mcu0_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu0_physical_addr_a[35:33] = mcu0_drif_dram_addr_a[4:2];  
                            mcu0_physical_addr_a[12:10] = mcu0_drif_dram_dimm_a[2:0];  
                            mcu0_physical_addr_b[35:33] = mcu0_drif_dram_addr_b[4:2];  
                            mcu0_physical_addr_b[12:10] = mcu0_drif_dram_dimm_b[2:0];  
                            mcu0_physical_addr_c[35:33] = mcu0_drif_dram_addr_c[4:2];  
                            mcu0_physical_addr_c[12:10] = mcu0_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b1_0_1_01_001,
  8'b1_0_1_01_010,
  8'b1_0_1_01_100,
  8'b1_0_1_01_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_ras_addr_a[13:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:2], mcu0_drif_dram_bank_a[1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_ras_addr_b[13:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:2], mcu0_drif_dram_bank_b[1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_ras_addr_c[13:0],  
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:2], mcu0_drif_dram_bank_c[1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu0_physical_addr_a[33] = mcu0_drif_dram_addr_a[2];  
                            mcu0_physical_addr_a[10] = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[33] = mcu0_drif_dram_addr_b[2];  
                            mcu0_physical_addr_b[10] = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[33] = mcu0_drif_dram_addr_c[2];  
                            mcu0_physical_addr_c[10] = mcu0_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu0_physical_addr_a[34:33] = mcu0_drif_dram_addr_a[3:2];  
                            mcu0_physical_addr_a[10]    = mcu0_drif_dram_dimm_a[0];  
                            mcu0_physical_addr_a[11]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[34:33] = mcu0_drif_dram_addr_b[3:2];  
                            mcu0_physical_addr_b[10]    = mcu0_drif_dram_dimm_b[0];  
                            mcu0_physical_addr_b[11]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[34:33] = mcu0_drif_dram_addr_c[3:2];  
                            mcu0_physical_addr_c[10]    = mcu0_drif_dram_dimm_c[0];  
                            mcu0_physical_addr_c[11]    = mcu0_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu0_physical_addr_a[35:33] = mcu0_drif_dram_addr_a[4:2];  
                            mcu0_physical_addr_a[11:10] = mcu0_drif_dram_dimm_a[1:0];  
                            mcu0_physical_addr_a[12]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[35:33] = mcu0_drif_dram_addr_b[4:2];  
                            mcu0_physical_addr_b[11:10] = mcu0_drif_dram_dimm_b[1:0];  
                            mcu0_physical_addr_b[12]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[35:33] = mcu0_drif_dram_addr_c[4:2];  
                            mcu0_physical_addr_c[11:10] = mcu0_drif_dram_dimm_c[1:0];  
                            mcu0_physical_addr_c[12]    = mcu0_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu0_physical_addr_a[36:33] = mcu0_drif_dram_addr_a[5:2];  
                            mcu0_physical_addr_a[12:10] = mcu0_drif_dram_dimm_a[2:0];  
                            mcu0_physical_addr_a[13]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[36:33] = mcu0_drif_dram_addr_b[5:2];  
                            mcu0_physical_addr_b[12:10] = mcu0_drif_dram_dimm_b[2:0];  
                            mcu0_physical_addr_b[13]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[36:33] = mcu0_drif_dram_addr_c[5:2];  
                            mcu0_physical_addr_c[12:10] = mcu0_drif_dram_dimm_c[2:0];  
                            mcu0_physical_addr_c[13]    = mcu0_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b1_0_0_10_001,
  8'b1_0_0_10_010,
  8'b1_0_0_10_100,
  8'b1_0_0_10_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_ras_addr_a[13:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:3], mcu0_drif_dram_bank_a[2:1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_ras_addr_b[13:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:3], mcu0_drif_dram_bank_b[2:1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_ras_addr_c[13:0],  
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:3], mcu0_drif_dram_bank_c[2:1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu0_physical_addr_a[33] = mcu0_drif_dram_addr_a[2];  
                            mcu0_physical_addr_b[33] = mcu0_drif_dram_addr_b[2];  
                            mcu0_physical_addr_c[33] = mcu0_drif_dram_addr_c[2];  
                          end
                     010: begin
                            mcu0_physical_addr_a[34:33] = mcu0_drif_dram_addr_a[3:2];  
                            mcu0_physical_addr_a[11]    = mcu0_drif_dram_dimm_a[0];  
                            mcu0_physical_addr_b[34:33] = mcu0_drif_dram_addr_b[3:2];  
                            mcu0_physical_addr_b[11]    = mcu0_drif_dram_dimm_b[0];  
                            mcu0_physical_addr_c[34:33] = mcu0_drif_dram_addr_c[3:2];  
                            mcu0_physical_addr_c[11]    = mcu0_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu0_physical_addr_a[35:33] = mcu0_drif_dram_addr_a[4:2];  
                            mcu0_physical_addr_a[12:11] = mcu0_drif_dram_dimm_a[1:0];  
                            mcu0_physical_addr_b[35:33] = mcu0_drif_dram_addr_b[4:2];  
                            mcu0_physical_addr_b[12:11] = mcu0_drif_dram_dimm_b[1:0];  
                            mcu0_physical_addr_c[35:33] = mcu0_drif_dram_addr_c[4:2];  
                            mcu0_physical_addr_c[12:11] = mcu0_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu0_physical_addr_a[36:33] = mcu0_drif_dram_addr_a[5:2];  
                            mcu0_physical_addr_a[13:11] = mcu0_drif_dram_dimm_a[2:0];  
                            mcu0_physical_addr_b[36:33] = mcu0_drif_dram_addr_b[5:2];  
                            mcu0_physical_addr_b[13:11] = mcu0_drif_dram_dimm_b[2:0];  
                            mcu0_physical_addr_c[36:33] = mcu0_drif_dram_addr_c[5:2];  
                            mcu0_physical_addr_c[13:11] = mcu0_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b1_0_1_10_001,
  8'b1_0_1_10_010,
  8'b1_0_1_10_100,
  8'b1_0_1_10_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_ras_addr_a[13:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:2], mcu0_drif_dram_bank_a[1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_ras_addr_b[13:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:2], mcu0_drif_dram_bank_b[1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_ras_addr_c[13:0],  
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:2], mcu0_drif_dram_bank_c[1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu0_physical_addr_a[34:33] = mcu0_drif_dram_addr_a[3:2];  
                            mcu0_physical_addr_a[11]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[34:33] = mcu0_drif_dram_addr_b[3:2];  
                            mcu0_physical_addr_b[11]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[34:33] = mcu0_drif_dram_addr_c[3:2];  
                            mcu0_physical_addr_c[11]    = mcu0_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu0_physical_addr_a[35:33] = mcu0_drif_dram_addr_a[4:2];  
                            mcu0_physical_addr_a[11]    = mcu0_drif_dram_dimm_a[0];  
                            mcu0_physical_addr_a[12]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[35:33] = mcu0_drif_dram_addr_b[4:2];  
                            mcu0_physical_addr_b[11]    = mcu0_drif_dram_dimm_b[0];  
                            mcu0_physical_addr_b[12]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[35:33] = mcu0_drif_dram_addr_c[4:2];  
                            mcu0_physical_addr_c[11]    = mcu0_drif_dram_dimm_c[0];  
                            mcu0_physical_addr_c[12]    = mcu0_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu0_physical_addr_a[36:33] = mcu0_drif_dram_addr_a[5:2];  
                            mcu0_physical_addr_a[12:11] = mcu0_drif_dram_dimm_a[1:0];  
                            mcu0_physical_addr_a[13]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[36:33] = mcu0_drif_dram_addr_b[5:2];  
                            mcu0_physical_addr_b[13:11] = mcu0_drif_dram_dimm_b[1:0];  
                            mcu0_physical_addr_b[12]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[36:33] = mcu0_drif_dram_addr_c[5:2];  
                            mcu0_physical_addr_c[12:11] = mcu0_drif_dram_dimm_c[1:0];  
                            mcu0_physical_addr_c[13]    = mcu0_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu0_physical_addr_a[37:33] = mcu0_drif_dram_addr_a[5:2];  
                            mcu0_physical_addr_a[13:11] = mcu0_drif_dram_dimm_a[2:0];  
                            mcu0_physical_addr_a[14]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[37:33] = mcu0_drif_dram_addr_b[5:2];  
                            mcu0_physical_addr_b[13:11] = mcu0_drif_dram_dimm_b[2:0];  
                            mcu0_physical_addr_b[14]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[37:33] = mcu0_drif_dram_addr_c[5:2];  
                            mcu0_physical_addr_c[13:11] = mcu0_drif_dram_dimm_c[2:0];  
                            mcu0_physical_addr_c[14]    = mcu0_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b1_0_0_11_001,
  8'b1_0_0_11_010,
  8'b1_0_0_11_100,
  8'b1_0_0_11_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_ras_addr_a[14:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:3], mcu0_drif_dram_bank_a[2:1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_ras_addr_b[14:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:3], mcu0_drif_dram_bank_b[2:1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_ras_addr_c[14:0],  
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:3], mcu0_drif_dram_bank_c[2:1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu0_physical_addr_a[34] = mcu0_drif_dram_addr_a[2];  
                            mcu0_physical_addr_b[34] = mcu0_drif_dram_addr_b[2];  
                            mcu0_physical_addr_c[34] = mcu0_drif_dram_addr_c[2];  
                          end
                     010: begin
                            mcu0_physical_addr_a[35:34] = mcu0_drif_dram_addr_a[3:2];  
                            mcu0_physical_addr_a[11]    = mcu0_drif_dram_dimm_a[0];  
                            mcu0_physical_addr_b[35:34] = mcu0_drif_dram_addr_b[3:2];  
                            mcu0_physical_addr_b[11]    = mcu0_drif_dram_dimm_b[0];  
                            mcu0_physical_addr_c[35:34] = mcu0_drif_dram_addr_c[3:2];  
                            mcu0_physical_addr_c[11]    = mcu0_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu0_physical_addr_a[36:34] = mcu0_drif_dram_addr_a[4:2];  
                            mcu0_physical_addr_a[12:11] = mcu0_drif_dram_dimm_a[1:0];  
                            mcu0_physical_addr_b[36:34] = mcu0_drif_dram_addr_b[4:2];  
                            mcu0_physical_addr_b[12:11] = mcu0_drif_dram_dimm_b[1:0];  
                            mcu0_physical_addr_c[36:34] = mcu0_drif_dram_addr_c[4:2];  
                            mcu0_physical_addr_c[12:11] = mcu0_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu0_physical_addr_a[37:34] = mcu0_drif_dram_addr_a[5:2];  
                            mcu0_physical_addr_a[13:11] = mcu0_drif_dram_dimm_a[2:0];  
                            mcu0_physical_addr_b[37:34] = mcu0_drif_dram_addr_b[5:2];  
                            mcu0_physical_addr_b[13:11] = mcu0_drif_dram_dimm_b[2:0];  
                            mcu0_physical_addr_c[37:34] = mcu0_drif_dram_addr_c[5:2];  
                            mcu0_physical_addr_c[13:11] = mcu0_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b1_0_1_11_001,
  8'b1_0_1_11_010,
  8'b1_0_1_11_100,
  8'b1_0_1_11_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_ras_addr_a[14:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:2], mcu0_drif_dram_bank_a[1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_ras_addr_b[14:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:2], mcu0_drif_dram_bank_b[1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_ras_addr_c[14:0],  
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:2], mcu0_drif_dram_bank_c[1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu0_physical_addr_a[35:34] = mcu0_drif_dram_addr_a[3:2];  
                            mcu0_physical_addr_a[11]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[35:34] = mcu0_drif_dram_addr_b[3:2];  
                            mcu0_physical_addr_b[11]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[35:34] = mcu0_drif_dram_addr_c[3:2];  
                            mcu0_physical_addr_c[11]    = mcu0_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu0_physical_addr_a[36:34] = mcu0_drif_dram_addr_a[4:2];  
                            mcu0_physical_addr_a[11]    = mcu0_drif_dram_dimm_a[0];  
                            mcu0_physical_addr_a[12]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[36:34] = mcu0_drif_dram_addr_b[4:2];  
                            mcu0_physical_addr_b[11]    = mcu0_drif_dram_dimm_b[0];  
                            mcu0_physical_addr_b[12]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[36:34] = mcu0_drif_dram_addr_c[4:2];  
                            mcu0_physical_addr_c[11]    = mcu0_drif_dram_dimm_c[0];  
                            mcu0_physical_addr_c[12]    = mcu0_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu0_physical_addr_a[37:34] = mcu0_drif_dram_addr_a[5:2];  
                            mcu0_physical_addr_a[12:11] = mcu0_drif_dram_dimm_a[1:0];  
                            mcu0_physical_addr_a[13]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[37:34] = mcu0_drif_dram_addr_b[5:2];  
                            mcu0_physical_addr_b[13:11] = mcu0_drif_dram_dimm_b[1:0];  
                            mcu0_physical_addr_b[12]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[37:34] = mcu0_drif_dram_addr_c[5:2];  
                            mcu0_physical_addr_c[12:11] = mcu0_drif_dram_dimm_c[1:0];  
                            mcu0_physical_addr_c[13]    = mcu0_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu0_physical_addr_a[38:34] = mcu0_drif_dram_addr_a[5:2];  
                            mcu0_physical_addr_a[13:11] = mcu0_drif_dram_dimm_a[2:0];  
                            mcu0_physical_addr_a[14]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[38:34] = mcu0_drif_dram_addr_b[5:2];  
                            mcu0_physical_addr_b[13:11] = mcu0_drif_dram_dimm_b[2:0];  
                            mcu0_physical_addr_b[14]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[38:34] = mcu0_drif_dram_addr_c[5:2];  
                            mcu0_physical_addr_c[13:11] = mcu0_drif_dram_dimm_c[2:0];  
                            mcu0_physical_addr_c[14]    = mcu0_drif_dram_rank_c;  
			  end
                     endcase
                   end

  //---------------------------
  // SINGLE CHANNEL, RANK LOW 
  //---------------------------

  8'b0_0_0_00_001,
  8'b0_0_0_00_010,
  8'b0_0_0_00_100,
  8'b0_0_0_00_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_ras_addr_a[12:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:3], mcu0_drif_dram_bank_a[1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_ras_addr_b[12:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:3], mcu0_drif_dram_bank_b[1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_ras_addr_c[12:0],  
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:3], mcu0_drif_dram_bank_c[1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                          end
                     010: begin
                            mcu0_physical_addr_a[31] = mcu0_drif_dram_addr_a[3];  
                            mcu0_physical_addr_a[10] = mcu0_drif_dram_dimm_a[0];  
                            mcu0_physical_addr_b[31] = mcu0_drif_dram_addr_b[3];  
                            mcu0_physical_addr_b[10] = mcu0_drif_dram_dimm_b[0];  
                            mcu0_physical_addr_c[31] = mcu0_drif_dram_addr_c[3];  
                            mcu0_physical_addr_c[10] = mcu0_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu0_physical_addr_a[32:31] = mcu0_drif_dram_addr_a[4:3];  
                            mcu0_physical_addr_a[11:10] = mcu0_drif_dram_dimm_a[1:0];  
                            mcu0_physical_addr_b[32:31] = mcu0_drif_dram_addr_b[4:3];  
                            mcu0_physical_addr_b[11:10] = mcu0_drif_dram_dimm_b[1:0];  
                            mcu0_physical_addr_c[32:31] = mcu0_drif_dram_addr_c[4:3];  
                            mcu0_physical_addr_c[11:10] = mcu0_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu0_physical_addr_a[33:31] = mcu0_drif_dram_addr_a[5:3];  
                            mcu0_physical_addr_a[12:10] = mcu0_drif_dram_dimm_a[2:0];  
                            mcu0_physical_addr_b[33:31] = mcu0_drif_dram_addr_b[5:3];  
                            mcu0_physical_addr_b[12:10] = mcu0_drif_dram_dimm_b[2:0];  
                            mcu0_physical_addr_c[33:31] = mcu0_drif_dram_addr_c[5:3];  
                            mcu0_physical_addr_c[12:10] = mcu0_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b0_0_1_00_001,
  8'b0_0_1_00_010,
  8'b0_0_1_00_100,
  8'b0_0_1_00_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_ras_addr_a[12:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:3], mcu0_drif_dram_bank_a[1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_ras_addr_b[12:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:3], mcu0_drif_dram_bank_b[1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_ras_addr_c[12:0],  
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:3], mcu0_drif_dram_bank_c[1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu0_physical_addr_a[31] = mcu0_drif_dram_addr_a[3];  
                            mcu0_physical_addr_a[10] = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[31] = mcu0_drif_dram_addr_b[3];  
                            mcu0_physical_addr_b[10] = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[31] = mcu0_drif_dram_addr_c[3];  
                            mcu0_physical_addr_c[10] = mcu0_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu0_physical_addr_a[32:31] = mcu0_drif_dram_addr_a[4:3];  
                            mcu0_physical_addr_a[10]    = mcu0_drif_dram_dimm_a[0];  
                            mcu0_physical_addr_a[11]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[32:31] = mcu0_drif_dram_addr_b[4:3];  
                            mcu0_physical_addr_b[10]    = mcu0_drif_dram_dimm_b[0];  
                            mcu0_physical_addr_b[11]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[32:31] = mcu0_drif_dram_addr_c[4:3];  
                            mcu0_physical_addr_c[10]    = mcu0_drif_dram_dimm_c[0];  
                            mcu0_physical_addr_c[11]    = mcu0_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu0_physical_addr_a[33:31] = mcu0_drif_dram_addr_a[5:3];  
                            mcu0_physical_addr_a[11:10] = mcu0_drif_dram_dimm_a[1:0];  
                            mcu0_physical_addr_a[12]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[33:31] = mcu0_drif_dram_addr_b[5:3];  
                            mcu0_physical_addr_b[11:10] = mcu0_drif_dram_dimm_b[1:0];  
                            mcu0_physical_addr_b[12]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[33:31] = mcu0_drif_dram_addr_c[5:3];  
                            mcu0_physical_addr_c[11:10] = mcu0_drif_dram_dimm_c[1:0];  
                            mcu0_physical_addr_c[12]    = mcu0_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu0_physical_addr_a[34:31] = mcu0_drif_dram_addr_a[6:3];  
                            mcu0_physical_addr_a[12:10] = mcu0_drif_dram_dimm_a[2:0];  
                            mcu0_physical_addr_a[13]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[34:31] = mcu0_drif_dram_addr_b[6:3];  
                            mcu0_physical_addr_b[12:10] = mcu0_drif_dram_dimm_b[2:0];  
                            mcu0_physical_addr_b[13]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[34:31] = mcu0_drif_dram_addr_c[6:3];  
                            mcu0_physical_addr_c[12:10] = mcu0_drif_dram_dimm_c[2:0];  
                            mcu0_physical_addr_c[13]    = mcu0_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b0_0_0_01_001,
  8'b0_0_0_01_010,
  8'b0_0_0_01_100,
  8'b0_0_0_01_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_ras_addr_a[13:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:3], mcu0_drif_dram_bank_a[1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_ras_addr_b[13:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:3], mcu0_drif_dram_bank_b[1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_ras_addr_c[13:0],  
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:3], mcu0_drif_dram_bank_c[1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                          end
                     010: begin
                            mcu0_physical_addr_a[32] = mcu0_drif_dram_addr_a[3];  
                            mcu0_physical_addr_a[10] = mcu0_drif_dram_dimm_a[0];  
                            mcu0_physical_addr_b[32] = mcu0_drif_dram_addr_b[3];  
                            mcu0_physical_addr_b[10] = mcu0_drif_dram_dimm_b[0];  
                            mcu0_physical_addr_c[32] = mcu0_drif_dram_addr_c[3];  
                            mcu0_physical_addr_c[10] = mcu0_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu0_physical_addr_a[33:32] = mcu0_drif_dram_addr_a[4:3];  
                            mcu0_physical_addr_a[11:10] = mcu0_drif_dram_dimm_a[1:0];  
                            mcu0_physical_addr_b[33:32] = mcu0_drif_dram_addr_b[4:3];  
                            mcu0_physical_addr_b[11:10] = mcu0_drif_dram_dimm_b[1:0];  
                            mcu0_physical_addr_c[33:32] = mcu0_drif_dram_addr_c[4:3];  
                            mcu0_physical_addr_c[11:10] = mcu0_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu0_physical_addr_a[34:32] = mcu0_drif_dram_addr_a[5:3];  
                            mcu0_physical_addr_a[12:10] = mcu0_drif_dram_dimm_a[2:0];  
                            mcu0_physical_addr_b[34:32] = mcu0_drif_dram_addr_b[5:3];  
                            mcu0_physical_addr_b[12:10] = mcu0_drif_dram_dimm_b[2:0];  
                            mcu0_physical_addr_c[34:32] = mcu0_drif_dram_addr_c[5:3];  
                            mcu0_physical_addr_c[12:10] = mcu0_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b0_0_1_01_001,
  8'b0_0_1_01_010,
  8'b0_0_1_01_100,
  8'b0_0_1_01_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_ras_addr_a[13:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:3], mcu0_drif_dram_bank_a[1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_ras_addr_b[13:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:3], mcu0_drif_dram_bank_b[1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_ras_addr_c[13:0],  
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:3], mcu0_drif_dram_bank_c[1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu0_physical_addr_a[32] = mcu0_drif_dram_addr_a[3];  
                            mcu0_physical_addr_a[10] = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[32] = mcu0_drif_dram_addr_b[3];  
                            mcu0_physical_addr_b[10] = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[32] = mcu0_drif_dram_addr_c[3];  
                            mcu0_physical_addr_c[10] = mcu0_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu0_physical_addr_a[33:32] = mcu0_drif_dram_addr_a[4:3];  
                            mcu0_physical_addr_a[10]    = mcu0_drif_dram_dimm_a[0];  
                            mcu0_physical_addr_a[11]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[33:32] = mcu0_drif_dram_addr_b[4:3];  
                            mcu0_physical_addr_b[10]    = mcu0_drif_dram_dimm_b[0];  
                            mcu0_physical_addr_b[11]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[33:32] = mcu0_drif_dram_addr_c[4:3];  
                            mcu0_physical_addr_c[10]    = mcu0_drif_dram_dimm_c[0];  
                            mcu0_physical_addr_c[11]    = mcu0_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu0_physical_addr_a[34:32] = mcu0_drif_dram_addr_a[5:3];  
                            mcu0_physical_addr_a[11:10] = mcu0_drif_dram_dimm_a[1:0];  
                            mcu0_physical_addr_a[12]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[34:32] = mcu0_drif_dram_addr_b[5:3];  
                            mcu0_physical_addr_b[11:10] = mcu0_drif_dram_dimm_b[1:0];  
                            mcu0_physical_addr_b[12]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[34:32] = mcu0_drif_dram_addr_c[5:3];  
                            mcu0_physical_addr_c[11:10] = mcu0_drif_dram_dimm_c[1:0];  
                            mcu0_physical_addr_c[12]    = mcu0_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu0_physical_addr_a[35:32] = mcu0_drif_dram_addr_a[6:3];  
                            mcu0_physical_addr_a[12:10] = mcu0_drif_dram_dimm_a[2:0];  
                            mcu0_physical_addr_a[13]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[35:32] = mcu0_drif_dram_addr_b[6:3];  
                            mcu0_physical_addr_b[12:10] = mcu0_drif_dram_dimm_b[2:0];  
                            mcu0_physical_addr_b[13]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[35:32] = mcu0_drif_dram_addr_c[6:3];  
                            mcu0_physical_addr_c[12:10] = mcu0_drif_dram_dimm_c[2:0];  
                            mcu0_physical_addr_c[13]    = mcu0_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b0_0_0_10_001,
  8'b0_0_0_10_010,
  8'b0_0_0_10_100,
  8'b0_0_0_10_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_ras_addr_a[13:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:4], mcu0_drif_dram_bank_a[2:1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_ras_addr_b[13:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:4], mcu0_drif_dram_bank_b[2:1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_ras_addr_c[13:0],  
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:4], mcu0_drif_dram_bank_c[2:1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu0_physical_addr_a[32] = mcu0_drif_dram_addr_a[3];  
                            mcu0_physical_addr_b[32] = mcu0_drif_dram_addr_b[3];  
                            mcu0_physical_addr_c[32] = mcu0_drif_dram_addr_c[3];  
                          end
                     010: begin
                            mcu0_physical_addr_a[33:32] = mcu0_drif_dram_addr_a[4:3];  
                            mcu0_physical_addr_a[11]    = mcu0_drif_dram_dimm_a[0];  
                            mcu0_physical_addr_b[33:32] = mcu0_drif_dram_addr_b[4:3];  
                            mcu0_physical_addr_b[11]    = mcu0_drif_dram_dimm_b[0];  
                            mcu0_physical_addr_c[33:32] = mcu0_drif_dram_addr_c[4:3];  
                            mcu0_physical_addr_c[11]    = mcu0_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu0_physical_addr_a[34:32] = mcu0_drif_dram_addr_a[5:3];  
                            mcu0_physical_addr_a[12:11] = mcu0_drif_dram_dimm_a[1:0];  
                            mcu0_physical_addr_b[34:32] = mcu0_drif_dram_addr_b[5:3];  
                            mcu0_physical_addr_b[12:11] = mcu0_drif_dram_dimm_b[1:0];  
                            mcu0_physical_addr_c[34:32] = mcu0_drif_dram_addr_c[5:3];  
                            mcu0_physical_addr_c[12:11] = mcu0_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu0_physical_addr_a[35:32] = mcu0_drif_dram_addr_a[6:3];  
                            mcu0_physical_addr_a[13:11] = mcu0_drif_dram_dimm_a[2:0];  
                            mcu0_physical_addr_b[35:32] = mcu0_drif_dram_addr_b[6:3];  
                            mcu0_physical_addr_b[13:11] = mcu0_drif_dram_dimm_b[2:0];  
                            mcu0_physical_addr_c[35:32] = mcu0_drif_dram_addr_c[6:3];  
                            mcu0_physical_addr_c[13:11] = mcu0_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b0_0_1_10_001,
  8'b0_0_1_10_010,
  8'b0_0_1_10_100,
  8'b0_0_1_10_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_ras_addr_a[13:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:4], mcu0_drif_dram_bank_a[2:1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_ras_addr_b[13:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:4], mcu0_drif_dram_bank_b[2:1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_ras_addr_c[13:0],  
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:4], mcu0_drif_dram_bank_c[2:1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu0_physical_addr_a[33:32] = mcu0_drif_dram_addr_a[4:3];  
                            mcu0_physical_addr_a[11]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[33:32] = mcu0_drif_dram_addr_b[4:3];  
                            mcu0_physical_addr_b[11]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[33:32] = mcu0_drif_dram_addr_c[4:3];  
                            mcu0_physical_addr_c[11]    = mcu0_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu0_physical_addr_a[34:32] = mcu0_drif_dram_addr_a[5:3];  
                            mcu0_physical_addr_a[11]    = mcu0_drif_dram_dimm_a[0];  
                            mcu0_physical_addr_a[12]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[34:32] = mcu0_drif_dram_addr_b[5:3];  
                            mcu0_physical_addr_b[11]    = mcu0_drif_dram_dimm_b[0];  
                            mcu0_physical_addr_b[12]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[34:32] = mcu0_drif_dram_addr_c[5:3];  
                            mcu0_physical_addr_c[11]    = mcu0_drif_dram_dimm_c[0];  
                            mcu0_physical_addr_c[12]    = mcu0_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu0_physical_addr_a[35:32] = mcu0_drif_dram_addr_a[6:3];  
                            mcu0_physical_addr_a[12:11] = mcu0_drif_dram_dimm_a[1:0];  
                            mcu0_physical_addr_a[13]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[35:32] = mcu0_drif_dram_addr_b[6:3];  
                            mcu0_physical_addr_b[12:11] = mcu0_drif_dram_dimm_b[1:0];  
                            mcu0_physical_addr_b[13]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[35:32] = mcu0_drif_dram_addr_c[6:3];  
                            mcu0_physical_addr_c[12:11] = mcu0_drif_dram_dimm_c[1:0];  
                            mcu0_physical_addr_c[13]    = mcu0_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu0_physical_addr_a[36:32] = mcu0_drif_dram_addr_a[7:3];  
                            mcu0_physical_addr_a[13:11] = mcu0_drif_dram_dimm_a[2:0];  
                            mcu0_physical_addr_a[14]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[36:32] = mcu0_drif_dram_addr_b[7:3];  
                            mcu0_physical_addr_b[13:11] = mcu0_drif_dram_dimm_b[2:0];  
                            mcu0_physical_addr_b[14]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[36:32] = mcu0_drif_dram_addr_c[7:3];  
                            mcu0_physical_addr_c[13:11] = mcu0_drif_dram_dimm_c[2:0];  
                            mcu0_physical_addr_c[14]    = mcu0_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b0_0_0_11_001,
  8'b0_0_0_11_010,
  8'b0_0_0_11_100,
  8'b0_0_0_11_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_ras_addr_a[14:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:4], mcu0_drif_dram_bank_a[2:1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_ras_addr_b[14:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:4], mcu0_drif_dram_bank_b[2:1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_ras_addr_c[14:0],  
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:4], mcu0_drif_dram_bank_c[2:1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu0_physical_addr_a[33] = mcu0_drif_dram_addr_a[3];  
                            mcu0_physical_addr_b[33] = mcu0_drif_dram_addr_b[3];  
                            mcu0_physical_addr_c[33] = mcu0_drif_dram_addr_c[3];  
                          end
                     010: begin
                            mcu0_physical_addr_a[34:33] = mcu0_drif_dram_addr_a[4:3];  
                            mcu0_physical_addr_a[11]    = mcu0_drif_dram_dimm_a[0];  
                            mcu0_physical_addr_b[34:33] = mcu0_drif_dram_addr_b[4:3];  
                            mcu0_physical_addr_b[11]    = mcu0_drif_dram_dimm_b[0];  
                            mcu0_physical_addr_c[34:33] = mcu0_drif_dram_addr_c[4:3];  
                            mcu0_physical_addr_c[11]    = mcu0_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu0_physical_addr_a[35:33] = mcu0_drif_dram_addr_a[5:3];  
                            mcu0_physical_addr_a[12:11] = mcu0_drif_dram_dimm_a[1:0];  
                            mcu0_physical_addr_b[35:33] = mcu0_drif_dram_addr_b[5:3];  
                            mcu0_physical_addr_b[12:11] = mcu0_drif_dram_dimm_b[1:0];  
                            mcu0_physical_addr_c[35:33] = mcu0_drif_dram_addr_c[5:3];  
                            mcu0_physical_addr_c[12:11] = mcu0_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu0_physical_addr_a[36:33] = mcu0_drif_dram_addr_a[6:3];  
                            mcu0_physical_addr_a[13:11] = mcu0_drif_dram_dimm_a[2:0];  
                            mcu0_physical_addr_b[36:33] = mcu0_drif_dram_addr_b[6:3];  
                            mcu0_physical_addr_b[13:11] = mcu0_drif_dram_dimm_b[2:0];  
                            mcu0_physical_addr_c[36:33] = mcu0_drif_dram_addr_c[6:3];  
                            mcu0_physical_addr_c[13:11] = mcu0_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b0_0_1_11_001,
  8'b0_0_1_11_010,
  8'b0_0_1_11_100,
  8'b0_0_1_11_000: begin
                     mcu0_physical_addr_a = {mcu0_drif_dram_ras_addr_a[14:0],  
                                             mcu0_drif_dram_addr_a[11],mcu0_drif_dram_addr_a[9:4], mcu0_drif_dram_bank_a[2:1], 
                                             2'b00, mcu0_drif_dram_bank_a[0], mcu0_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu0_physical_addr_b = {mcu0_drif_dram_ras_addr_b[14:0],  
                                             mcu0_drif_dram_addr_b[11],mcu0_drif_dram_addr_b[9:4], mcu0_drif_dram_bank_b[2:1], 
                                             2'b00, mcu0_drif_dram_bank_b[0], mcu0_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu0_physical_addr_c = {mcu0_drif_dram_ras_addr_c[14:0],  
                                             mcu0_drif_dram_addr_c[11],mcu0_drif_dram_addr_c[9:4], mcu0_drif_dram_bank_c[2:1], 
                                             2'b00, mcu0_drif_dram_bank_c[0], mcu0_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu0_physical_addr_a[34:33] = mcu0_drif_dram_addr_a[4:3];  
                            mcu0_physical_addr_a[11]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[34:33] = mcu0_drif_dram_addr_b[4:3];  
                            mcu0_physical_addr_b[11]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[34:33] = mcu0_drif_dram_addr_c[4:3];  
                            mcu0_physical_addr_c[11]    = mcu0_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu0_physical_addr_a[35:33] = mcu0_drif_dram_addr_a[5:3];  
                            mcu0_physical_addr_a[11]    = mcu0_drif_dram_dimm_a[0];  
                            mcu0_physical_addr_a[12]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[35:33] = mcu0_drif_dram_addr_b[5:3];  
                            mcu0_physical_addr_b[11]    = mcu0_drif_dram_dimm_b[0];  
                            mcu0_physical_addr_b[12]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[35:33] = mcu0_drif_dram_addr_c[5:3];  
                            mcu0_physical_addr_c[11]    = mcu0_drif_dram_dimm_c[0];  
                            mcu0_physical_addr_c[12]    = mcu0_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu0_physical_addr_a[36:33] = mcu0_drif_dram_addr_a[6:3];  
                            mcu0_physical_addr_a[12:11] = mcu0_drif_dram_dimm_a[1:0];  
                            mcu0_physical_addr_a[13]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[36:33] = mcu0_drif_dram_addr_b[6:3];  
                            mcu0_physical_addr_b[12:11] = mcu0_drif_dram_dimm_b[1:0];  
                            mcu0_physical_addr_b[13]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[36:33] = mcu0_drif_dram_addr_c[6:3];  
                            mcu0_physical_addr_c[12:11] = mcu0_drif_dram_dimm_c[1:0];  
                            mcu0_physical_addr_c[13]    = mcu0_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu0_physical_addr_a[37:33] = mcu0_drif_dram_addr_a[7:3];  
                            mcu0_physical_addr_a[13:11] = mcu0_drif_dram_dimm_a[2:0];  
                            mcu0_physical_addr_a[14]    = mcu0_drif_dram_rank_a;  
                            mcu0_physical_addr_b[37:33] = mcu0_drif_dram_addr_b[7:3];  
                            mcu0_physical_addr_b[13:11] = mcu0_drif_dram_dimm_b[2:0];  
                            mcu0_physical_addr_b[14]    = mcu0_drif_dram_rank_b;  
                            mcu0_physical_addr_c[37:33] = mcu0_drif_dram_addr_c[7:3];  
                            mcu0_physical_addr_c[13:11] = mcu0_drif_dram_dimm_c[2:0];  
                            mcu0_physical_addr_c[14]    = mcu0_drif_dram_rank_c;  
			  end
                     endcase
                   end
  endcase

  //----------------------------------------------------------------------------------------------
  //					M C U 1 - phys addr gen
  //----------------------------------------------------------------------------------------------


  mcu1_physical_addr_a = 40'b0;
  mcu1_physical_addr_b = 40'b0;
  mcu1_physical_addr_c = 40'b0;

  case({chnl_type, rank_addr, rank, dimm_size, num_dimms})

  //-------------------------------
  // DUAL CHANNEL, RANK HIGH 
  //-------------------------------

  8'b1_1_0_00_001,
  8'b1_1_0_00_010,
  8'b1_1_0_00_100, 
  8'b1_1_0_00_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_dimm_a, mcu1_drif_dram_ras_addr_a[12:0], 
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:2], 
                                             mcu1_drif_dram_bank_a[1], 2'b01, mcu1_drif_dram_bank_a[0],
                                             mcu1_drif_dram_addr_a[1], 5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_dimm_b, mcu1_drif_dram_ras_addr_b[12:0], 
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:2],
                                             mcu1_drif_dram_bank_b[1], 2'b01, mcu1_drif_dram_bank_b[0], 
                                             mcu1_drif_dram_addr_b[1], 5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_dimm_c, mcu1_drif_dram_ras_addr_c[12:0], 
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:2],
                                             mcu1_drif_dram_bank_c[1], 2'b01, mcu1_drif_dram_bank_c[0],
                                             mcu1_drif_dram_addr_c[1], 5'b00000};
                   end
  8'b1_1_1_00_001,
  8'b1_1_1_00_010,
  8'b1_1_1_00_100, 
  8'b1_1_1_00_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_dimm_a, mcu1_drif_dram_ras_addr_a[12:0], 
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:2],
                                             mcu1_drif_dram_bank_a[1], 2'b01, mcu1_drif_dram_bank_a[0],
                                             mcu1_drif_dram_addr_a[1], 5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_dimm_b, mcu1_drif_dram_ras_addr_b[12:0], 
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:2],
                                             mcu1_drif_dram_bank_b[1], 2'b01, mcu1_drif_dram_bank_b[0],
                                             mcu1_drif_dram_addr_b[1], 5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_dimm_c, mcu1_drif_dram_ras_addr_c[12:0], 
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:2],
                                             mcu1_drif_dram_bank_c[1], 2'b01, mcu1_drif_dram_bank_c[0],
                                             mcu1_drif_dram_addr_c[1], 5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu1_physical_addr_a[32] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[32] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[32] = mcu1_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu1_physical_addr_a[33] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[33] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[33] = mcu1_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu1_physical_addr_a[34] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[34] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[34] = mcu1_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu1_physical_addr_a[35] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[35] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[35] = mcu1_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b1_1_0_01_001,
  8'b1_1_0_01_010,
  8'b1_1_0_01_100, 
  8'b1_1_0_01_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_dimm_a, mcu1_drif_dram_ras_addr_a[13:0], 
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:2],
                                             mcu1_drif_dram_bank_a[1], 2'b01, mcu1_drif_dram_bank_a[0],
                                             mcu1_drif_dram_addr_a[1], 5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_dimm_b, mcu1_drif_dram_ras_addr_b[13:0], 
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:2], 
                                             mcu1_drif_dram_bank_b[1], 2'b01, mcu1_drif_dram_bank_b[0],
                                             mcu1_drif_dram_addr_b[1], 5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_dimm_c, mcu1_drif_dram_ras_addr_c[13:0], 
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:2],
                                             mcu1_drif_dram_bank_c[1], 2'b01, mcu1_drif_dram_bank_c[0],
                                             mcu1_drif_dram_addr_c[1], 5'b00000};
                   end
  8'b1_1_1_01_001,
  8'b1_1_1_01_010,
  8'b1_1_1_01_100, 
  8'b1_1_1_01_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_dimm_a, mcu1_drif_dram_ras_addr_a[13:0], 
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:2], 
                                             mcu1_drif_dram_bank_a[1], 2'b01, mcu1_drif_dram_bank_a[0], 
                                             mcu1_drif_dram_addr_a[1], 5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_dimm_b, mcu1_drif_dram_ras_addr_b[13:0], 
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:2],
                                             mcu1_drif_dram_bank_b[1], 2'b01, mcu1_drif_dram_bank_b[0],
                                             mcu1_drif_dram_addr_b[1], 5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_dimm_c, mcu1_drif_dram_ras_addr_c[13:0], 
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:2],
                                             mcu1_drif_dram_bank_c[1], 2'b01, mcu1_drif_dram_bank_c[0], 
                                             mcu1_drif_dram_addr_c[1], 5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu1_physical_addr_a[33] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[33] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[33] = mcu1_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu1_physical_addr_a[34] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[34] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[34] = mcu1_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu1_physical_addr_a[35] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[35] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[35] = mcu1_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu1_physical_addr_a[36] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[36] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[36] = mcu1_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b1_1_0_10_001,
  8'b1_1_0_10_010,
  8'b1_1_0_10_100, 
  8'b1_1_0_10_000: begin
  		     		 mcu1_physical_addr_a = {mcu1_drif_dram_dimm_a, mcu1_drif_dram_addr_a[2], 
                                    	     mcu1_drif_dram_ras_addr_a[13:0],  mcu1_drif_dram_addr_a[11],
                                     		 mcu1_drif_dram_addr_a[9:3], mcu1_drif_dram_bank_a[2:1],
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[1], 5'b00000};
             		 mcu1_physical_addr_b = {mcu1_drif_dram_dimm_b, mcu1_drif_dram_addr_b[2],
                                    	     mcu1_drif_dram_ras_addr_b[13:0],  mcu1_drif_dram_addr_b[11],
                                     		 mcu1_drif_dram_addr_b[9:3], mcu1_drif_dram_bank_b[2:1], 
                                     	     2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[1], 5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_dimm_c, mcu1_drif_dram_addr_c[2], 
                                             mcu1_drif_dram_ras_addr_c[13:0],  mcu1_drif_dram_addr_c[11],
                                             mcu1_drif_dram_addr_c[9:3], mcu1_drif_dram_bank_c[2:1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[1], 5'b00000};
                   end
  8'b1_1_1_10_001,
  8'b1_1_1_10_010,
  8'b1_1_1_10_100, 
  8'b1_1_1_10_000: begin
  		             mcu1_physical_addr_a = {mcu1_drif_dram_dimm_a, mcu1_drif_dram_addr_a[2], 
                                             mcu1_drif_dram_ras_addr_a[13:0],  mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:3], 
                                             mcu1_drif_dram_bank_a[2:1], 2'b01, mcu1_drif_dram_bank_a[0],
                                             mcu1_drif_dram_addr_a[1], 5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_dimm_b, mcu1_drif_dram_addr_b[2],
                                             mcu1_drif_dram_ras_addr_b[13:0],  mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:3],
                                             mcu1_drif_dram_bank_b[2:1], 2'b01, mcu1_drif_dram_bank_b[0],
                                             mcu1_drif_dram_addr_b[1], 5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_dimm_c, mcu1_drif_dram_addr_c[2], 
                                             mcu1_drif_dram_ras_addr_c[13:0],  mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:3],
                                             mcu1_drif_dram_bank_c[2:1], 2'b01, mcu1_drif_dram_bank_c[0], 
                                             mcu1_drif_dram_addr_c[1], 5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu1_physical_addr_a[34] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[34] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[34] = mcu1_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu1_physical_addr_a[35] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[35] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[35] = mcu1_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu1_physical_addr_a[36] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[36] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[36] = mcu1_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu1_physical_addr_a[37] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[37] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[37] = mcu1_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b1_1_0_11_001,
  8'b1_1_0_11_010,
  8'b1_1_0_11_100, 
  8'b1_1_0_11_000: begin
  		     mcu1_physical_addr_a = {mcu1_drif_dram_dimm_a, mcu1_drif_dram_addr_a[2], 
                                             mcu1_drif_dram_ras_addr_a[14:0],  mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:3], 
                                             mcu1_drif_dram_bank_a[2:1], 2'b01, mcu1_drif_dram_bank_a[0],
                                             mcu1_drif_dram_addr_a[1], 5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_dimm_b, mcu1_drif_dram_addr_b[2],
                                             mcu1_drif_dram_ras_addr_b[14:0],  mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:3],
                                             mcu1_drif_dram_bank_b[2:1], 2'b01, mcu1_drif_dram_bank_b[0],
                                             mcu1_drif_dram_addr_b[1], 5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_dimm_c, mcu1_drif_dram_addr_c[2], 
                                             mcu1_drif_dram_ras_addr_c[14:0],  mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:3],
                                             mcu1_drif_dram_bank_c[2:1], 2'b01, mcu1_drif_dram_bank_c[0], 
                                             mcu1_drif_dram_addr_c[1], 5'b00000};
                   end
  8'b1_1_1_11_001,
  8'b1_1_1_11_010,
  8'b1_1_1_11_100, 
  8'b1_1_1_11_000: begin
  		     mcu1_physical_addr_a = {mcu1_drif_dram_dimm_a, mcu1_drif_dram_addr_a[2], 
                                             mcu1_drif_dram_ras_addr_a[14:0],  mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:3], 
                                             mcu1_drif_dram_bank_a[2:1], 2'b01, mcu1_drif_dram_bank_a[0],
                                             mcu1_drif_dram_addr_a[1], 5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_dimm_b, mcu1_drif_dram_addr_b[2],
                                             mcu1_drif_dram_ras_addr_b[14:0],  mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:3],
                                             mcu1_drif_dram_bank_b[2:1], 2'b01, mcu1_drif_dram_bank_b[0],
                                             mcu1_drif_dram_addr_b[1], 5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_dimm_c, mcu1_drif_dram_addr_c[2], 
                                             mcu1_drif_dram_ras_addr_c[14:0],  mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:3],
                                             mcu1_drif_dram_bank_c[2:1], 2'b01, mcu1_drif_dram_bank_c[0], 
                                             mcu1_drif_dram_addr_c[1], 5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu1_physical_addr_a[35] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[35] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[35] = mcu1_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu1_physical_addr_a[36] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[36] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[36] = mcu1_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu1_physical_addr_a[37] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[37] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[37] = mcu1_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu1_physical_addr_a[38] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[38] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[38] = mcu1_drif_dram_rank_c;
			  end
                     endcase
                   end

  //---------------------------
  // SINGLE CHANNEL, RANK HIGH 
  //---------------------------

  8'b0_1_0_00_001,
  8'b0_1_0_00_010,
  8'b0_1_0_00_100, 
  8'b0_1_0_00_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_dimm_a, mcu1_drif_dram_ras_addr_a[12:0], 
                                              mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:3], mcu1_drif_dram_bank_a[1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_dimm_b, mcu1_drif_dram_ras_addr_b[12:0], 
                                              mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:3], mcu1_drif_dram_bank_b[1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_dimm_c, mcu1_drif_dram_ras_addr_c[12:0], 
                                              mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:3], mcu1_drif_dram_bank_c[1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[2], 
                                             5'b00000};
                   end
  8'b0_1_1_00_001,
  8'b0_1_1_00_010,
  8'b0_1_1_00_100, 
  8'b0_1_1_00_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_dimm_a, mcu1_drif_dram_ras_addr_a[12:0], 
                                              mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:3], mcu1_drif_dram_bank_a[1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_dimm_b, mcu1_drif_dram_ras_addr_b[12:0], 
                                              mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:3], mcu1_drif_dram_bank_b[1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_dimm_c, mcu1_drif_dram_ras_addr_c[12:0], 
                                              mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:3], mcu1_drif_dram_bank_c[1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[2], 
                                             5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu1_physical_addr_a[31] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[31] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[31] = mcu1_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu1_physical_addr_a[32] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[32] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[32] = mcu1_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu1_physical_addr_a[33] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[33] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[33] = mcu1_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu1_physical_addr_a[34] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[34] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[34] = mcu1_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b0_1_0_01_001,
  8'b0_1_0_01_010,
  8'b0_1_0_01_100, 
  8'b0_1_0_01_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_dimm_a, mcu1_drif_dram_ras_addr_a[13:0], 
                                              mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:3], mcu1_drif_dram_bank_a[1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_dimm_b, mcu1_drif_dram_ras_addr_b[13:0], 
                                              mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:3], mcu1_drif_dram_bank_b[1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_dimm_c, mcu1_drif_dram_ras_addr_c[13:0], 
                                              mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:3], mcu1_drif_dram_bank_c[1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[2], 
                                             5'b00000};
                   end
  8'b0_1_1_01_001,
  8'b0_1_1_01_010,
  8'b0_1_1_01_100, 
  8'b0_1_1_01_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_dimm_a, mcu1_drif_dram_ras_addr_a[13:0], 
                                              mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:3], mcu1_drif_dram_bank_a[1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_dimm_b, mcu1_drif_dram_ras_addr_b[13:0], 
                                              mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:3], mcu1_drif_dram_bank_b[1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_dimm_c, mcu1_drif_dram_ras_addr_c[13:0], 
                                              mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:3], mcu1_drif_dram_bank_c[1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[2], 
                                             5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu1_physical_addr_a[32] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[32] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[32] = mcu1_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu1_physical_addr_a[33] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[33] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[33] = mcu1_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu1_physical_addr_a[34] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[34] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[34] = mcu1_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu1_physical_addr_a[35] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[35] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[35] = mcu1_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b0_1_0_10_001,
  8'b0_1_0_10_010,
  8'b0_1_0_10_100, 
  8'b0_1_0_10_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_dimm_a, mcu1_drif_dram_addr_a[3],
                                             mcu1_drif_dram_ras_addr_a[13:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:4], mcu1_drif_dram_bank_a[2:1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_dimm_b, mcu1_drif_dram_addr_b[3],
                                             mcu1_drif_dram_ras_addr_b[13:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:4], mcu1_drif_dram_bank_b[2:1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_dimm_c, mcu1_drif_dram_addr_c[3],
                                             mcu1_drif_dram_ras_addr_c[13:0], 
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:4], mcu1_drif_dram_bank_c[2:1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[2], 
                                             5'b00000};
                   end
  8'b0_1_1_10_001,
  8'b0_1_1_10_010,
  8'b0_1_1_10_100, 
  8'b0_1_1_10_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_dimm_a, mcu1_drif_dram_addr_a[3],
                                             mcu1_drif_dram_ras_addr_a[13:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:4], mcu1_drif_dram_bank_a[2:1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_dimm_b, mcu1_drif_dram_addr_b[3],
                                             mcu1_drif_dram_ras_addr_b[13:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:4], mcu1_drif_dram_bank_b[2:1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_dimm_c, mcu1_drif_dram_addr_c[3],
                                             mcu1_drif_dram_ras_addr_c[13:0], 
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:4], mcu1_drif_dram_bank_c[2:1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[2], 
                                             5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu1_physical_addr_a[33] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[33] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[33] = mcu1_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu1_physical_addr_a[34] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[34] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[34] = mcu1_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu1_physical_addr_a[35] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[35] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[35] = mcu1_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu1_physical_addr_a[36] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[36] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[36] = mcu1_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b0_1_0_11_001,
  8'b0_1_0_11_010,
  8'b0_1_0_11_100, 
  8'b0_1_0_11_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_dimm_a, mcu1_drif_dram_addr_a[3],
                                             mcu1_drif_dram_ras_addr_a[14:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:4], mcu1_drif_dram_bank_a[2:1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_dimm_b, mcu1_drif_dram_addr_b[3],
                                             mcu1_drif_dram_ras_addr_b[14:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:4], mcu1_drif_dram_bank_b[2:1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_dimm_c, mcu1_drif_dram_addr_c[3],
                                             mcu1_drif_dram_ras_addr_c[14:0], 
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:4], mcu1_drif_dram_bank_c[2:1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[2], 
                                             5'b00000};
                   end
  8'b0_1_1_11_001,
  8'b0_1_1_11_010,
  8'b0_1_1_11_100, 
  8'b0_1_1_11_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_dimm_a, mcu1_drif_dram_addr_a[3],
                                             mcu1_drif_dram_ras_addr_a[14:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:4], mcu1_drif_dram_bank_a[2:1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_dimm_b, mcu1_drif_dram_addr_b[3],
                                             mcu1_drif_dram_ras_addr_b[14:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:4], mcu1_drif_dram_bank_b[2:1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_dimm_c, mcu1_drif_dram_addr_c[3],
                                             mcu1_drif_dram_ras_addr_c[14:0], 
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:4], mcu1_drif_dram_bank_c[2:1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[2], 
                                             5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu1_physical_addr_a[34] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[34] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[34] = mcu1_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu1_physical_addr_a[35] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[35] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[35] = mcu1_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu1_physical_addr_a[36] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[36] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[36] = mcu1_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu1_physical_addr_a[37] = mcu1_drif_dram_rank_a;
                            mcu1_physical_addr_b[37] = mcu1_drif_dram_rank_b;
                            mcu1_physical_addr_c[37] = mcu1_drif_dram_rank_c;
			  end
                     endcase
                   end

  //---------------------------
  // DUAL CHANNEL, RANK LOW 
  //---------------------------

  8'b1_0_0_00_001,
  8'b1_0_0_00_010,
  8'b1_0_0_00_100,
  8'b1_0_0_00_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_ras_addr_a[12:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:2], mcu1_drif_dram_bank_a[1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_ras_addr_b[12:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:2], mcu1_drif_dram_bank_b[1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_ras_addr_c[12:0],  
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:2], mcu1_drif_dram_bank_c[1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                          end
                     010: begin
                            mcu1_physical_addr_a[32] = mcu1_drif_dram_addr_a[2];  
                            mcu1_physical_addr_a[10] = mcu1_drif_dram_dimm_a[0];  
                            mcu1_physical_addr_b[32] = mcu1_drif_dram_addr_b[2];  
                            mcu1_physical_addr_b[10] = mcu1_drif_dram_dimm_b[0];  
                            mcu1_physical_addr_c[32] = mcu1_drif_dram_addr_c[2];  
                            mcu1_physical_addr_c[10] = mcu1_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu1_physical_addr_a[33:32] = mcu1_drif_dram_addr_a[3:2];  
                            mcu1_physical_addr_a[11:10] = mcu1_drif_dram_dimm_a[1:0];  
                            mcu1_physical_addr_b[33:32] = mcu1_drif_dram_addr_b[3:2];  
                            mcu1_physical_addr_b[11:10] = mcu1_drif_dram_dimm_b[1:0];  
                            mcu1_physical_addr_c[33:32] = mcu1_drif_dram_addr_c[3:2];  
                            mcu1_physical_addr_c[11:10] = mcu1_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu1_physical_addr_a[34:32] = mcu1_drif_dram_addr_a[4:2];  
                            mcu1_physical_addr_a[12:10] = mcu1_drif_dram_dimm_a[2:0];  
                            mcu1_physical_addr_b[34:32] = mcu1_drif_dram_addr_b[4:2];  
                            mcu1_physical_addr_b[12:10] = mcu1_drif_dram_dimm_b[2:0];  
                            mcu1_physical_addr_c[34:32] = mcu1_drif_dram_addr_c[4:2];  
                            mcu1_physical_addr_c[12:10] = mcu1_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b1_0_1_00_001,
  8'b1_0_1_00_010,
  8'b1_0_1_00_100,
  8'b1_0_1_00_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_ras_addr_a[12:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:2], mcu1_drif_dram_bank_a[1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_ras_addr_b[12:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:2], mcu1_drif_dram_bank_b[1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_ras_addr_c[12:0],  
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:2], mcu1_drif_dram_bank_c[1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu1_physical_addr_a[32] = mcu1_drif_dram_addr_a[2];  
                            mcu1_physical_addr_a[10] = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[32] = mcu1_drif_dram_addr_b[2];  
                            mcu1_physical_addr_b[10] = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[32] = mcu1_drif_dram_addr_c[2];  
                            mcu1_physical_addr_c[10] = mcu1_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu1_physical_addr_a[33:32] = mcu1_drif_dram_addr_a[3:2];  
                            mcu1_physical_addr_a[10]    = mcu1_drif_dram_dimm_a[0];  
                            mcu1_physical_addr_a[11]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[33:32] = mcu1_drif_dram_addr_b[3:2];  
                            mcu1_physical_addr_b[10]    = mcu1_drif_dram_dimm_b[0];  
                            mcu1_physical_addr_b[11]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[33:32] = mcu1_drif_dram_addr_c[3:2];  
                            mcu1_physical_addr_c[10]    = mcu1_drif_dram_dimm_c[0];  
                            mcu1_physical_addr_c[11]    = mcu1_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu1_physical_addr_a[34:32] = mcu1_drif_dram_addr_a[4:2];  
                            mcu1_physical_addr_a[11:10] = mcu1_drif_dram_dimm_a[1:0];  
                            mcu1_physical_addr_a[12]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[34:32] = mcu1_drif_dram_addr_b[4:2];  
                            mcu1_physical_addr_b[11:10] = mcu1_drif_dram_dimm_b[1:0];  
                            mcu1_physical_addr_b[12]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[34:32] = mcu1_drif_dram_addr_c[4:2];  
                            mcu1_physical_addr_c[11:10] = mcu1_drif_dram_dimm_c[1:0];  
                            mcu1_physical_addr_c[12]    = mcu1_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu1_physical_addr_a[35:32] = mcu1_drif_dram_addr_a[5:2];  
                            mcu1_physical_addr_a[12:10] = mcu1_drif_dram_dimm_a[2:0];  
                            mcu1_physical_addr_a[13]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[35:32] = mcu1_drif_dram_addr_b[5:2];  
                            mcu1_physical_addr_b[12:10] = mcu1_drif_dram_dimm_b[2:0];  
                            mcu1_physical_addr_b[13]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[35:32] = mcu1_drif_dram_addr_c[5:2];  
                            mcu1_physical_addr_c[12:10] = mcu1_drif_dram_dimm_c[2:0];  
                            mcu1_physical_addr_c[13]    = mcu1_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b1_0_0_01_001,
  8'b1_0_0_01_010,
  8'b1_0_0_01_100,
  8'b1_0_0_01_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_ras_addr_a[13:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:2], mcu1_drif_dram_bank_a[1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_ras_addr_b[13:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:2], mcu1_drif_dram_bank_b[1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_ras_addr_c[13:0],  
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:2], mcu1_drif_dram_bank_c[1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                          end
                     010: begin
                            mcu1_physical_addr_a[33] = mcu1_drif_dram_addr_a[2];  
                            mcu1_physical_addr_a[10] = mcu1_drif_dram_dimm_a[0];  
                            mcu1_physical_addr_b[33] = mcu1_drif_dram_addr_b[2];  
                            mcu1_physical_addr_b[10] = mcu1_drif_dram_dimm_b[0];  
                            mcu1_physical_addr_c[33] = mcu1_drif_dram_addr_c[2];  
                            mcu1_physical_addr_c[10] = mcu1_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu1_physical_addr_a[34:33] = mcu1_drif_dram_addr_a[3:2];  
                            mcu1_physical_addr_a[11:10] = mcu1_drif_dram_dimm_a[1:0];  
                            mcu1_physical_addr_b[34:33] = mcu1_drif_dram_addr_b[3:2];  
                            mcu1_physical_addr_b[11:10] = mcu1_drif_dram_dimm_b[1:0];  
                            mcu1_physical_addr_c[34:33] = mcu1_drif_dram_addr_c[3:2];  
                            mcu1_physical_addr_c[11:10] = mcu1_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu1_physical_addr_a[35:33] = mcu1_drif_dram_addr_a[4:2];  
                            mcu1_physical_addr_a[12:10] = mcu1_drif_dram_dimm_a[2:0];  
                            mcu1_physical_addr_b[35:33] = mcu1_drif_dram_addr_b[4:2];  
                            mcu1_physical_addr_b[12:10] = mcu1_drif_dram_dimm_b[2:0];  
                            mcu1_physical_addr_c[35:33] = mcu1_drif_dram_addr_c[4:2];  
                            mcu1_physical_addr_c[12:10] = mcu1_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b1_0_1_01_001,
  8'b1_0_1_01_010,
  8'b1_0_1_01_100,
  8'b1_0_1_01_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_ras_addr_a[13:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:2], mcu1_drif_dram_bank_a[1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_ras_addr_b[13:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:2], mcu1_drif_dram_bank_b[1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_ras_addr_c[13:0],  
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:2], mcu1_drif_dram_bank_c[1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu1_physical_addr_a[33] = mcu1_drif_dram_addr_a[2];  
                            mcu1_physical_addr_a[10] = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[33] = mcu1_drif_dram_addr_b[2];  
                            mcu1_physical_addr_b[10] = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[33] = mcu1_drif_dram_addr_c[2];  
                            mcu1_physical_addr_c[10] = mcu1_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu1_physical_addr_a[34:33] = mcu1_drif_dram_addr_a[3:2];  
                            mcu1_physical_addr_a[10]    = mcu1_drif_dram_dimm_a[0];  
                            mcu1_physical_addr_a[11]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[34:33] = mcu1_drif_dram_addr_b[3:2];  
                            mcu1_physical_addr_b[10]    = mcu1_drif_dram_dimm_b[0];  
                            mcu1_physical_addr_b[11]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[34:33] = mcu1_drif_dram_addr_c[3:2];  
                            mcu1_physical_addr_c[10]    = mcu1_drif_dram_dimm_c[0];  
                            mcu1_physical_addr_c[11]    = mcu1_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu1_physical_addr_a[35:33] = mcu1_drif_dram_addr_a[4:2];  
                            mcu1_physical_addr_a[11:10] = mcu1_drif_dram_dimm_a[1:0];  
                            mcu1_physical_addr_a[12]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[35:33] = mcu1_drif_dram_addr_b[4:2];  
                            mcu1_physical_addr_b[11:10] = mcu1_drif_dram_dimm_b[1:0];  
                            mcu1_physical_addr_b[12]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[35:33] = mcu1_drif_dram_addr_c[4:2];  
                            mcu1_physical_addr_c[11:10] = mcu1_drif_dram_dimm_c[1:0];  
                            mcu1_physical_addr_c[12]    = mcu1_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu1_physical_addr_a[36:33] = mcu1_drif_dram_addr_a[5:2];  
                            mcu1_physical_addr_a[12:10] = mcu1_drif_dram_dimm_a[2:0];  
                            mcu1_physical_addr_a[13]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[36:33] = mcu1_drif_dram_addr_b[5:2];  
                            mcu1_physical_addr_b[12:10] = mcu1_drif_dram_dimm_b[2:0];  
                            mcu1_physical_addr_b[13]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[36:33] = mcu1_drif_dram_addr_c[5:2];  
                            mcu1_physical_addr_c[12:10] = mcu1_drif_dram_dimm_c[2:0];  
                            mcu1_physical_addr_c[13]    = mcu1_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b1_0_0_10_001,
  8'b1_0_0_10_010,
  8'b1_0_0_10_100,
  8'b1_0_0_10_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_ras_addr_a[13:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:3], mcu1_drif_dram_bank_a[2:1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_ras_addr_b[13:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:3], mcu1_drif_dram_bank_b[2:1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_ras_addr_c[13:0],  
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:3], mcu1_drif_dram_bank_c[2:1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu1_physical_addr_a[33] = mcu1_drif_dram_addr_a[2];  
                            mcu1_physical_addr_b[33] = mcu1_drif_dram_addr_b[2];  
                            mcu1_physical_addr_c[33] = mcu1_drif_dram_addr_c[2];  
                          end
                     010: begin
                            mcu1_physical_addr_a[34:33] = mcu1_drif_dram_addr_a[3:2];  
                            mcu1_physical_addr_a[11]    = mcu1_drif_dram_dimm_a[0];  
                            mcu1_physical_addr_b[34:33] = mcu1_drif_dram_addr_b[3:2];  
                            mcu1_physical_addr_b[11]    = mcu1_drif_dram_dimm_b[0];  
                            mcu1_physical_addr_c[34:33] = mcu1_drif_dram_addr_c[3:2];  
                            mcu1_physical_addr_c[11]    = mcu1_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu1_physical_addr_a[35:33] = mcu1_drif_dram_addr_a[4:2];  
                            mcu1_physical_addr_a[12:11] = mcu1_drif_dram_dimm_a[1:0];  
                            mcu1_physical_addr_b[35:33] = mcu1_drif_dram_addr_b[4:2];  
                            mcu1_physical_addr_b[12:11] = mcu1_drif_dram_dimm_b[1:0];  
                            mcu1_physical_addr_c[35:33] = mcu1_drif_dram_addr_c[4:2];  
                            mcu1_physical_addr_c[12:11] = mcu1_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu1_physical_addr_a[36:33] = mcu1_drif_dram_addr_a[5:2];  
                            mcu1_physical_addr_a[13:11] = mcu1_drif_dram_dimm_a[2:0];  
                            mcu1_physical_addr_b[36:33] = mcu1_drif_dram_addr_b[5:2];  
                            mcu1_physical_addr_b[13:11] = mcu1_drif_dram_dimm_b[2:0];  
                            mcu1_physical_addr_c[36:33] = mcu1_drif_dram_addr_c[5:2];  
                            mcu1_physical_addr_c[13:11] = mcu1_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b1_0_1_10_001,
  8'b1_0_1_10_010,
  8'b1_0_1_10_100,
  8'b1_0_1_10_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_ras_addr_a[13:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:2], mcu1_drif_dram_bank_a[1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_ras_addr_b[13:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:2], mcu1_drif_dram_bank_b[1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_ras_addr_c[13:0],  
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:2], mcu1_drif_dram_bank_c[1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu1_physical_addr_a[34:33] = mcu1_drif_dram_addr_a[3:2];  
                            mcu1_physical_addr_a[11]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[34:33] = mcu1_drif_dram_addr_b[3:2];  
                            mcu1_physical_addr_b[11]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[34:33] = mcu1_drif_dram_addr_c[3:2];  
                            mcu1_physical_addr_c[11]    = mcu1_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu1_physical_addr_a[35:33] = mcu1_drif_dram_addr_a[4:2];  
                            mcu1_physical_addr_a[11]    = mcu1_drif_dram_dimm_a[0];  
                            mcu1_physical_addr_a[12]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[35:33] = mcu1_drif_dram_addr_b[4:2];  
                            mcu1_physical_addr_b[11]    = mcu1_drif_dram_dimm_b[0];  
                            mcu1_physical_addr_b[12]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[35:33] = mcu1_drif_dram_addr_c[4:2];  
                            mcu1_physical_addr_c[11]    = mcu1_drif_dram_dimm_c[0];  
                            mcu1_physical_addr_c[12]    = mcu1_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu1_physical_addr_a[36:33] = mcu1_drif_dram_addr_a[5:2];  
                            mcu1_physical_addr_a[12:11] = mcu1_drif_dram_dimm_a[1:0];  
                            mcu1_physical_addr_a[13]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[36:33] = mcu1_drif_dram_addr_b[5:2];  
                            mcu1_physical_addr_b[13:11] = mcu1_drif_dram_dimm_b[1:0];  
                            mcu1_physical_addr_b[12]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[36:33] = mcu1_drif_dram_addr_c[5:2];  
                            mcu1_physical_addr_c[12:11] = mcu1_drif_dram_dimm_c[1:0];  
                            mcu1_physical_addr_c[13]    = mcu1_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu1_physical_addr_a[37:33] = mcu1_drif_dram_addr_a[5:2];  
                            mcu1_physical_addr_a[13:11] = mcu1_drif_dram_dimm_a[2:0];  
                            mcu1_physical_addr_a[14]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[37:33] = mcu1_drif_dram_addr_b[5:2];  
                            mcu1_physical_addr_b[13:11] = mcu1_drif_dram_dimm_b[2:0];  
                            mcu1_physical_addr_b[14]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[37:33] = mcu1_drif_dram_addr_c[5:2];  
                            mcu1_physical_addr_c[13:11] = mcu1_drif_dram_dimm_c[2:0];  
                            mcu1_physical_addr_c[14]    = mcu1_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b1_0_0_11_001,
  8'b1_0_0_11_010,
  8'b1_0_0_11_100,
  8'b1_0_0_11_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_ras_addr_a[14:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:3], mcu1_drif_dram_bank_a[2:1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_ras_addr_b[14:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:3], mcu1_drif_dram_bank_b[2:1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_ras_addr_c[14:0],  
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:3], mcu1_drif_dram_bank_c[2:1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu1_physical_addr_a[34] = mcu1_drif_dram_addr_a[2];  
                            mcu1_physical_addr_b[34] = mcu1_drif_dram_addr_b[2];  
                            mcu1_physical_addr_c[34] = mcu1_drif_dram_addr_c[2];  
                          end
                     010: begin
                            mcu1_physical_addr_a[35:34] = mcu1_drif_dram_addr_a[3:2];  
                            mcu1_physical_addr_a[11]    = mcu1_drif_dram_dimm_a[0];  
                            mcu1_physical_addr_b[35:34] = mcu1_drif_dram_addr_b[3:2];  
                            mcu1_physical_addr_b[11]    = mcu1_drif_dram_dimm_b[0];  
                            mcu1_physical_addr_c[35:34] = mcu1_drif_dram_addr_c[3:2];  
                            mcu1_physical_addr_c[11]    = mcu1_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu1_physical_addr_a[36:34] = mcu1_drif_dram_addr_a[4:2];  
                            mcu1_physical_addr_a[12:11] = mcu1_drif_dram_dimm_a[1:0];  
                            mcu1_physical_addr_b[36:34] = mcu1_drif_dram_addr_b[4:2];  
                            mcu1_physical_addr_b[12:11] = mcu1_drif_dram_dimm_b[1:0];  
                            mcu1_physical_addr_c[36:34] = mcu1_drif_dram_addr_c[4:2];  
                            mcu1_physical_addr_c[12:11] = mcu1_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu1_physical_addr_a[37:34] = mcu1_drif_dram_addr_a[5:2];  
                            mcu1_physical_addr_a[13:11] = mcu1_drif_dram_dimm_a[2:0];  
                            mcu1_physical_addr_b[37:34] = mcu1_drif_dram_addr_b[5:2];  
                            mcu1_physical_addr_b[13:11] = mcu1_drif_dram_dimm_b[2:0];  
                            mcu1_physical_addr_c[37:34] = mcu1_drif_dram_addr_c[5:2];  
                            mcu1_physical_addr_c[13:11] = mcu1_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b1_0_1_11_001,
  8'b1_0_1_11_010,
  8'b1_0_1_11_100,
  8'b1_0_1_11_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_ras_addr_a[14:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:2], mcu1_drif_dram_bank_a[1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_ras_addr_b[14:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:2], mcu1_drif_dram_bank_b[1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_ras_addr_c[14:0],  
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:2], mcu1_drif_dram_bank_c[1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu1_physical_addr_a[35:34] = mcu1_drif_dram_addr_a[3:2];  
                            mcu1_physical_addr_a[11]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[35:34] = mcu1_drif_dram_addr_b[3:2];  
                            mcu1_physical_addr_b[11]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[35:34] = mcu1_drif_dram_addr_c[3:2];  
                            mcu1_physical_addr_c[11]    = mcu1_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu1_physical_addr_a[36:34] = mcu1_drif_dram_addr_a[4:2];  
                            mcu1_physical_addr_a[11]    = mcu1_drif_dram_dimm_a[0];  
                            mcu1_physical_addr_a[12]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[36:34] = mcu1_drif_dram_addr_b[4:2];  
                            mcu1_physical_addr_b[11]    = mcu1_drif_dram_dimm_b[0];  
                            mcu1_physical_addr_b[12]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[36:34] = mcu1_drif_dram_addr_c[4:2];  
                            mcu1_physical_addr_c[11]    = mcu1_drif_dram_dimm_c[0];  
                            mcu1_physical_addr_c[12]    = mcu1_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu1_physical_addr_a[37:34] = mcu1_drif_dram_addr_a[5:2];  
                            mcu1_physical_addr_a[12:11] = mcu1_drif_dram_dimm_a[1:0];  
                            mcu1_physical_addr_a[13]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[37:34] = mcu1_drif_dram_addr_b[5:2];  
                            mcu1_physical_addr_b[13:11] = mcu1_drif_dram_dimm_b[1:0];  
                            mcu1_physical_addr_b[12]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[37:34] = mcu1_drif_dram_addr_c[5:2];  
                            mcu1_physical_addr_c[12:11] = mcu1_drif_dram_dimm_c[1:0];  
                            mcu1_physical_addr_c[13]    = mcu1_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu1_physical_addr_a[38:34] = mcu1_drif_dram_addr_a[5:2];  
                            mcu1_physical_addr_a[13:11] = mcu1_drif_dram_dimm_a[2:0];  
                            mcu1_physical_addr_a[14]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[38:34] = mcu1_drif_dram_addr_b[5:2];  
                            mcu1_physical_addr_b[13:11] = mcu1_drif_dram_dimm_b[2:0];  
                            mcu1_physical_addr_b[14]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[38:34] = mcu1_drif_dram_addr_c[5:2];  
                            mcu1_physical_addr_c[13:11] = mcu1_drif_dram_dimm_c[2:0];  
                            mcu1_physical_addr_c[14]    = mcu1_drif_dram_rank_c;  
			  end
                     endcase
                   end

  //---------------------------
  // SINGLE CHANNEL, RANK LOW 
  //---------------------------

  8'b0_0_0_00_001,
  8'b0_0_0_00_010,
  8'b0_0_0_00_100,
  8'b0_0_0_00_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_ras_addr_a[12:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:3], mcu1_drif_dram_bank_a[1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_ras_addr_b[12:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:3], mcu1_drif_dram_bank_b[1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_ras_addr_c[12:0],  
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:3], mcu1_drif_dram_bank_c[1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                          end
                     010: begin
                            mcu1_physical_addr_a[31] = mcu1_drif_dram_addr_a[3];  
                            mcu1_physical_addr_a[10] = mcu1_drif_dram_dimm_a[0];  
                            mcu1_physical_addr_b[31] = mcu1_drif_dram_addr_b[3];  
                            mcu1_physical_addr_b[10] = mcu1_drif_dram_dimm_b[0];  
                            mcu1_physical_addr_c[31] = mcu1_drif_dram_addr_c[3];  
                            mcu1_physical_addr_c[10] = mcu1_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu1_physical_addr_a[32:31] = mcu1_drif_dram_addr_a[4:3];  
                            mcu1_physical_addr_a[11:10] = mcu1_drif_dram_dimm_a[1:0];  
                            mcu1_physical_addr_b[32:31] = mcu1_drif_dram_addr_b[4:3];  
                            mcu1_physical_addr_b[11:10] = mcu1_drif_dram_dimm_b[1:0];  
                            mcu1_physical_addr_c[32:31] = mcu1_drif_dram_addr_c[4:3];  
                            mcu1_physical_addr_c[11:10] = mcu1_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu1_physical_addr_a[33:31] = mcu1_drif_dram_addr_a[5:3];  
                            mcu1_physical_addr_a[12:10] = mcu1_drif_dram_dimm_a[2:0];  
                            mcu1_physical_addr_b[33:31] = mcu1_drif_dram_addr_b[5:3];  
                            mcu1_physical_addr_b[12:10] = mcu1_drif_dram_dimm_b[2:0];  
                            mcu1_physical_addr_c[33:31] = mcu1_drif_dram_addr_c[5:3];  
                            mcu1_physical_addr_c[12:10] = mcu1_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b0_0_1_00_001,
  8'b0_0_1_00_010,
  8'b0_0_1_00_100,
  8'b0_0_1_00_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_ras_addr_a[12:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:3], mcu1_drif_dram_bank_a[1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_ras_addr_b[12:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:3], mcu1_drif_dram_bank_b[1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_ras_addr_c[12:0],  
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:3], mcu1_drif_dram_bank_c[1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu1_physical_addr_a[31] = mcu1_drif_dram_addr_a[3];  
                            mcu1_physical_addr_a[10] = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[31] = mcu1_drif_dram_addr_b[3];  
                            mcu1_physical_addr_b[10] = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[31] = mcu1_drif_dram_addr_c[3];  
                            mcu1_physical_addr_c[10] = mcu1_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu1_physical_addr_a[32:31] = mcu1_drif_dram_addr_a[4:3];  
                            mcu1_physical_addr_a[10]    = mcu1_drif_dram_dimm_a[0];  
                            mcu1_physical_addr_a[11]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[32:31] = mcu1_drif_dram_addr_b[4:3];  
                            mcu1_physical_addr_b[10]    = mcu1_drif_dram_dimm_b[0];  
                            mcu1_physical_addr_b[11]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[32:31] = mcu1_drif_dram_addr_c[4:3];  
                            mcu1_physical_addr_c[10]    = mcu1_drif_dram_dimm_c[0];  
                            mcu1_physical_addr_c[11]    = mcu1_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu1_physical_addr_a[33:31] = mcu1_drif_dram_addr_a[5:3];  
                            mcu1_physical_addr_a[11:10] = mcu1_drif_dram_dimm_a[1:0];  
                            mcu1_physical_addr_a[12]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[33:31] = mcu1_drif_dram_addr_b[5:3];  
                            mcu1_physical_addr_b[11:10] = mcu1_drif_dram_dimm_b[1:0];  
                            mcu1_physical_addr_b[12]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[33:31] = mcu1_drif_dram_addr_c[5:3];  
                            mcu1_physical_addr_c[11:10] = mcu1_drif_dram_dimm_c[1:0];  
                            mcu1_physical_addr_c[12]    = mcu1_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu1_physical_addr_a[34:31] = mcu1_drif_dram_addr_a[6:3];  
                            mcu1_physical_addr_a[12:10] = mcu1_drif_dram_dimm_a[2:0];  
                            mcu1_physical_addr_a[13]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[34:31] = mcu1_drif_dram_addr_b[6:3];  
                            mcu1_physical_addr_b[12:10] = mcu1_drif_dram_dimm_b[2:0];  
                            mcu1_physical_addr_b[13]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[34:31] = mcu1_drif_dram_addr_c[6:3];  
                            mcu1_physical_addr_c[12:10] = mcu1_drif_dram_dimm_c[2:0];  
                            mcu1_physical_addr_c[13]    = mcu1_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b0_0_0_01_001,
  8'b0_0_0_01_010,
  8'b0_0_0_01_100,
  8'b0_0_0_01_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_ras_addr_a[13:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:3], mcu1_drif_dram_bank_a[1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_ras_addr_b[13:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:3], mcu1_drif_dram_bank_b[1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_ras_addr_c[13:0],  
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:3], mcu1_drif_dram_bank_c[1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                          end
                     010: begin
                            mcu1_physical_addr_a[32] = mcu1_drif_dram_addr_a[3];  
                            mcu1_physical_addr_a[10] = mcu1_drif_dram_dimm_a[0];  
                            mcu1_physical_addr_b[32] = mcu1_drif_dram_addr_b[3];  
                            mcu1_physical_addr_b[10] = mcu1_drif_dram_dimm_b[0];  
                            mcu1_physical_addr_c[32] = mcu1_drif_dram_addr_c[3];  
                            mcu1_physical_addr_c[10] = mcu1_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu1_physical_addr_a[33:32] = mcu1_drif_dram_addr_a[4:3];  
                            mcu1_physical_addr_a[11:10] = mcu1_drif_dram_dimm_a[1:0];  
                            mcu1_physical_addr_b[33:32] = mcu1_drif_dram_addr_b[4:3];  
                            mcu1_physical_addr_b[11:10] = mcu1_drif_dram_dimm_b[1:0];  
                            mcu1_physical_addr_c[33:32] = mcu1_drif_dram_addr_c[4:3];  
                            mcu1_physical_addr_c[11:10] = mcu1_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu1_physical_addr_a[34:32] = mcu1_drif_dram_addr_a[5:3];  
                            mcu1_physical_addr_a[12:10] = mcu1_drif_dram_dimm_a[2:0];  
                            mcu1_physical_addr_b[34:32] = mcu1_drif_dram_addr_b[5:3];  
                            mcu1_physical_addr_b[12:10] = mcu1_drif_dram_dimm_b[2:0];  
                            mcu1_physical_addr_c[34:32] = mcu1_drif_dram_addr_c[5:3];  
                            mcu1_physical_addr_c[12:10] = mcu1_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b0_0_1_01_001,
  8'b0_0_1_01_010,
  8'b0_0_1_01_100,
  8'b0_0_1_01_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_ras_addr_a[13:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:3], mcu1_drif_dram_bank_a[1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_ras_addr_b[13:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:3], mcu1_drif_dram_bank_b[1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_ras_addr_c[13:0],  
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:3], mcu1_drif_dram_bank_c[1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu1_physical_addr_a[32] = mcu1_drif_dram_addr_a[3];  
                            mcu1_physical_addr_a[10] = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[32] = mcu1_drif_dram_addr_b[3];  
                            mcu1_physical_addr_b[10] = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[32] = mcu1_drif_dram_addr_c[3];  
                            mcu1_physical_addr_c[10] = mcu1_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu1_physical_addr_a[33:32] = mcu1_drif_dram_addr_a[4:3];  
                            mcu1_physical_addr_a[10]    = mcu1_drif_dram_dimm_a[0];  
                            mcu1_physical_addr_a[11]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[33:32] = mcu1_drif_dram_addr_b[4:3];  
                            mcu1_physical_addr_b[10]    = mcu1_drif_dram_dimm_b[0];  
                            mcu1_physical_addr_b[11]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[33:32] = mcu1_drif_dram_addr_c[4:3];  
                            mcu1_physical_addr_c[10]    = mcu1_drif_dram_dimm_c[0];  
                            mcu1_physical_addr_c[11]    = mcu1_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu1_physical_addr_a[34:32] = mcu1_drif_dram_addr_a[5:3];  
                            mcu1_physical_addr_a[11:10] = mcu1_drif_dram_dimm_a[1:0];  
                            mcu1_physical_addr_a[12]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[34:32] = mcu1_drif_dram_addr_b[5:3];  
                            mcu1_physical_addr_b[11:10] = mcu1_drif_dram_dimm_b[1:0];  
                            mcu1_physical_addr_b[12]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[34:32] = mcu1_drif_dram_addr_c[5:3];  
                            mcu1_physical_addr_c[11:10] = mcu1_drif_dram_dimm_c[1:0];  
                            mcu1_physical_addr_c[12]    = mcu1_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu1_physical_addr_a[35:32] = mcu1_drif_dram_addr_a[6:3];  
                            mcu1_physical_addr_a[12:10] = mcu1_drif_dram_dimm_a[2:0];  
                            mcu1_physical_addr_a[13]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[35:32] = mcu1_drif_dram_addr_b[6:3];  
                            mcu1_physical_addr_b[12:10] = mcu1_drif_dram_dimm_b[2:0];  
                            mcu1_physical_addr_b[13]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[35:32] = mcu1_drif_dram_addr_c[6:3];  
                            mcu1_physical_addr_c[12:10] = mcu1_drif_dram_dimm_c[2:0];  
                            mcu1_physical_addr_c[13]    = mcu1_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b0_0_0_10_001,
  8'b0_0_0_10_010,
  8'b0_0_0_10_100,
  8'b0_0_0_10_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_ras_addr_a[13:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:4], mcu1_drif_dram_bank_a[2:1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_ras_addr_b[13:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:4], mcu1_drif_dram_bank_b[2:1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_ras_addr_c[13:0],  
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:4], mcu1_drif_dram_bank_c[2:1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu1_physical_addr_a[32] = mcu1_drif_dram_addr_a[3];  
                            mcu1_physical_addr_b[32] = mcu1_drif_dram_addr_b[3];  
                            mcu1_physical_addr_c[32] = mcu1_drif_dram_addr_c[3];  
                          end
                     010: begin
                            mcu1_physical_addr_a[33:32] = mcu1_drif_dram_addr_a[4:3];  
                            mcu1_physical_addr_a[11]    = mcu1_drif_dram_dimm_a[0];  
                            mcu1_physical_addr_b[33:32] = mcu1_drif_dram_addr_b[4:3];  
                            mcu1_physical_addr_b[11]    = mcu1_drif_dram_dimm_b[0];  
                            mcu1_physical_addr_c[33:32] = mcu1_drif_dram_addr_c[4:3];  
                            mcu1_physical_addr_c[11]    = mcu1_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu1_physical_addr_a[34:32] = mcu1_drif_dram_addr_a[5:3];  
                            mcu1_physical_addr_a[12:11] = mcu1_drif_dram_dimm_a[1:0];  
                            mcu1_physical_addr_b[34:32] = mcu1_drif_dram_addr_b[5:3];  
                            mcu1_physical_addr_b[12:11] = mcu1_drif_dram_dimm_b[1:0];  
                            mcu1_physical_addr_c[34:32] = mcu1_drif_dram_addr_c[5:3];  
                            mcu1_physical_addr_c[12:11] = mcu1_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu1_physical_addr_a[35:32] = mcu1_drif_dram_addr_a[6:3];  
                            mcu1_physical_addr_a[13:11] = mcu1_drif_dram_dimm_a[2:0];  
                            mcu1_physical_addr_b[35:32] = mcu1_drif_dram_addr_b[6:3];  
                            mcu1_physical_addr_b[13:11] = mcu1_drif_dram_dimm_b[2:0];  
                            mcu1_physical_addr_c[35:32] = mcu1_drif_dram_addr_c[6:3];  
                            mcu1_physical_addr_c[13:11] = mcu1_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b0_0_1_10_001,
  8'b0_0_1_10_010,
  8'b0_0_1_10_100,
  8'b0_0_1_10_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_ras_addr_a[13:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:4], mcu1_drif_dram_bank_a[2:1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_ras_addr_b[13:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:4], mcu1_drif_dram_bank_b[2:1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_ras_addr_c[13:0],  
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:4], mcu1_drif_dram_bank_c[2:1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu1_physical_addr_a[33:32] = mcu1_drif_dram_addr_a[4:3];  
                            mcu1_physical_addr_a[11]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[33:32] = mcu1_drif_dram_addr_b[4:3];  
                            mcu1_physical_addr_b[11]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[33:32] = mcu1_drif_dram_addr_c[4:3];  
                            mcu1_physical_addr_c[11]    = mcu1_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu1_physical_addr_a[34:32] = mcu1_drif_dram_addr_a[5:3];  
                            mcu1_physical_addr_a[11]    = mcu1_drif_dram_dimm_a[0];  
                            mcu1_physical_addr_a[12]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[34:32] = mcu1_drif_dram_addr_b[5:3];  
                            mcu1_physical_addr_b[11]    = mcu1_drif_dram_dimm_b[0];  
                            mcu1_physical_addr_b[12]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[34:32] = mcu1_drif_dram_addr_c[5:3];  
                            mcu1_physical_addr_c[11]    = mcu1_drif_dram_dimm_c[0];  
                            mcu1_physical_addr_c[12]    = mcu1_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu1_physical_addr_a[35:32] = mcu1_drif_dram_addr_a[6:3];  
                            mcu1_physical_addr_a[12:11] = mcu1_drif_dram_dimm_a[1:0];  
                            mcu1_physical_addr_a[13]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[35:32] = mcu1_drif_dram_addr_b[6:3];  
                            mcu1_physical_addr_b[12:11] = mcu1_drif_dram_dimm_b[1:0];  
                            mcu1_physical_addr_b[13]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[35:32] = mcu1_drif_dram_addr_c[6:3];  
                            mcu1_physical_addr_c[12:11] = mcu1_drif_dram_dimm_c[1:0];  
                            mcu1_physical_addr_c[13]    = mcu1_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu1_physical_addr_a[36:32] = mcu1_drif_dram_addr_a[7:3];  
                            mcu1_physical_addr_a[13:11] = mcu1_drif_dram_dimm_a[2:0];  
                            mcu1_physical_addr_a[14]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[36:32] = mcu1_drif_dram_addr_b[7:3];  
                            mcu1_physical_addr_b[13:11] = mcu1_drif_dram_dimm_b[2:0];  
                            mcu1_physical_addr_b[14]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[36:32] = mcu1_drif_dram_addr_c[7:3];  
                            mcu1_physical_addr_c[13:11] = mcu1_drif_dram_dimm_c[2:0];  
                            mcu1_physical_addr_c[14]    = mcu1_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b0_0_0_11_001,
  8'b0_0_0_11_010,
  8'b0_0_0_11_100,
  8'b0_0_0_11_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_ras_addr_a[14:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:4], mcu1_drif_dram_bank_a[2:1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_ras_addr_b[14:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:4], mcu1_drif_dram_bank_b[2:1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_ras_addr_c[14:0],  
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:4], mcu1_drif_dram_bank_c[2:1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu1_physical_addr_a[33] = mcu1_drif_dram_addr_a[3];  
                            mcu1_physical_addr_b[33] = mcu1_drif_dram_addr_b[3];  
                            mcu1_physical_addr_c[33] = mcu1_drif_dram_addr_c[3];  
                          end
                     010: begin
                            mcu1_physical_addr_a[34:33] = mcu1_drif_dram_addr_a[4:3];  
                            mcu1_physical_addr_a[11]    = mcu1_drif_dram_dimm_a[0];  
                            mcu1_physical_addr_b[34:33] = mcu1_drif_dram_addr_b[4:3];  
                            mcu1_physical_addr_b[11]    = mcu1_drif_dram_dimm_b[0];  
                            mcu1_physical_addr_c[34:33] = mcu1_drif_dram_addr_c[4:3];  
                            mcu1_physical_addr_c[11]    = mcu1_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu1_physical_addr_a[35:33] = mcu1_drif_dram_addr_a[5:3];  
                            mcu1_physical_addr_a[12:11] = mcu1_drif_dram_dimm_a[1:0];  
                            mcu1_physical_addr_b[35:33] = mcu1_drif_dram_addr_b[5:3];  
                            mcu1_physical_addr_b[12:11] = mcu1_drif_dram_dimm_b[1:0];  
                            mcu1_physical_addr_c[35:33] = mcu1_drif_dram_addr_c[5:3];  
                            mcu1_physical_addr_c[12:11] = mcu1_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu1_physical_addr_a[36:33] = mcu1_drif_dram_addr_a[6:3];  
                            mcu1_physical_addr_a[13:11] = mcu1_drif_dram_dimm_a[2:0];  
                            mcu1_physical_addr_b[36:33] = mcu1_drif_dram_addr_b[6:3];  
                            mcu1_physical_addr_b[13:11] = mcu1_drif_dram_dimm_b[2:0];  
                            mcu1_physical_addr_c[36:33] = mcu1_drif_dram_addr_c[6:3];  
                            mcu1_physical_addr_c[13:11] = mcu1_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b0_0_1_11_001,
  8'b0_0_1_11_010,
  8'b0_0_1_11_100,
  8'b0_0_1_11_000: begin
                     mcu1_physical_addr_a = {mcu1_drif_dram_ras_addr_a[14:0],  
                                             mcu1_drif_dram_addr_a[11],mcu1_drif_dram_addr_a[9:4], mcu1_drif_dram_bank_a[2:1], 
                                             2'b01, mcu1_drif_dram_bank_a[0], mcu1_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu1_physical_addr_b = {mcu1_drif_dram_ras_addr_b[14:0],  
                                             mcu1_drif_dram_addr_b[11],mcu1_drif_dram_addr_b[9:4], mcu1_drif_dram_bank_b[2:1], 
                                             2'b01, mcu1_drif_dram_bank_b[0], mcu1_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu1_physical_addr_c = {mcu1_drif_dram_ras_addr_c[14:0],  
                                             mcu1_drif_dram_addr_c[11],mcu1_drif_dram_addr_c[9:4], mcu1_drif_dram_bank_c[2:1], 
                                             2'b01, mcu1_drif_dram_bank_c[0], mcu1_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu1_physical_addr_a[34:33] = mcu1_drif_dram_addr_a[4:3];  
                            mcu1_physical_addr_a[11]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[34:33] = mcu1_drif_dram_addr_b[4:3];  
                            mcu1_physical_addr_b[11]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[34:33] = mcu1_drif_dram_addr_c[4:3];  
                            mcu1_physical_addr_c[11]    = mcu1_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu1_physical_addr_a[35:33] = mcu1_drif_dram_addr_a[5:3];  
                            mcu1_physical_addr_a[11]    = mcu1_drif_dram_dimm_a[0];  
                            mcu1_physical_addr_a[12]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[35:33] = mcu1_drif_dram_addr_b[5:3];  
                            mcu1_physical_addr_b[11]    = mcu1_drif_dram_dimm_b[0];  
                            mcu1_physical_addr_b[12]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[35:33] = mcu1_drif_dram_addr_c[5:3];  
                            mcu1_physical_addr_c[11]    = mcu1_drif_dram_dimm_c[0];  
                            mcu1_physical_addr_c[12]    = mcu1_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu1_physical_addr_a[36:33] = mcu1_drif_dram_addr_a[6:3];  
                            mcu1_physical_addr_a[12:11] = mcu1_drif_dram_dimm_a[1:0];  
                            mcu1_physical_addr_a[13]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[36:33] = mcu1_drif_dram_addr_b[6:3];  
                            mcu1_physical_addr_b[12:11] = mcu1_drif_dram_dimm_b[1:0];  
                            mcu1_physical_addr_b[13]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[36:33] = mcu1_drif_dram_addr_c[6:3];  
                            mcu1_physical_addr_c[12:11] = mcu1_drif_dram_dimm_c[1:0];  
                            mcu1_physical_addr_c[13]    = mcu1_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu1_physical_addr_a[37:33] = mcu1_drif_dram_addr_a[7:3];  
                            mcu1_physical_addr_a[13:11] = mcu1_drif_dram_dimm_a[2:0];  
                            mcu1_physical_addr_a[14]    = mcu1_drif_dram_rank_a;  
                            mcu1_physical_addr_b[37:33] = mcu1_drif_dram_addr_b[7:3];  
                            mcu1_physical_addr_b[13:11] = mcu1_drif_dram_dimm_b[2:0];  
                            mcu1_physical_addr_b[14]    = mcu1_drif_dram_rank_b;  
                            mcu1_physical_addr_c[37:33] = mcu1_drif_dram_addr_c[7:3];  
                            mcu1_physical_addr_c[13:11] = mcu1_drif_dram_dimm_c[2:0];  
                            mcu1_physical_addr_c[14]    = mcu1_drif_dram_rank_c;  
			  end
                     endcase
                   end
  endcase

  //----------------------------------------------------------------------------------------------
  //					M C U 2 - phys addr gen
  //----------------------------------------------------------------------------------------------


  mcu2_physical_addr_a = 40'b0;
  mcu2_physical_addr_b = 40'b0;
  mcu2_physical_addr_c = 40'b0;

  case({chnl_type, rank_addr, rank, dimm_size, num_dimms})

  //-------------------------------
  // DUAL CHANNEL, RANK HIGH 
  //-------------------------------

  8'b1_1_0_00_001,
  8'b1_1_0_00_010,
  8'b1_1_0_00_100, 
  8'b1_1_0_00_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_dimm_a, mcu2_drif_dram_ras_addr_a[12:0], 
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:2], 
                                             mcu2_drif_dram_bank_a[1], 2'b10, mcu2_drif_dram_bank_a[0],
                                             mcu2_drif_dram_addr_a[1], 5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_dimm_b, mcu2_drif_dram_ras_addr_b[12:0], 
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:2],
                                             mcu2_drif_dram_bank_b[1], 2'b10, mcu2_drif_dram_bank_b[0], 
                                             mcu2_drif_dram_addr_b[1], 5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_dimm_c, mcu2_drif_dram_ras_addr_c[12:0], 
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:2],
                                             mcu2_drif_dram_bank_c[1], 2'b10, mcu2_drif_dram_bank_c[0],
                                             mcu2_drif_dram_addr_c[1], 5'b00000};
                   end
  8'b1_1_1_00_001,
  8'b1_1_1_00_010,
  8'b1_1_1_00_100, 
  8'b1_1_1_00_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_dimm_a, mcu2_drif_dram_ras_addr_a[12:0], 
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:2],
                                             mcu2_drif_dram_bank_a[1], 2'b10, mcu2_drif_dram_bank_a[0],
                                             mcu2_drif_dram_addr_a[1], 5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_dimm_b, mcu2_drif_dram_ras_addr_b[12:0], 
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:2],
                                             mcu2_drif_dram_bank_b[1], 2'b10, mcu2_drif_dram_bank_b[0],
                                             mcu2_drif_dram_addr_b[1], 5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_dimm_c, mcu2_drif_dram_ras_addr_c[12:0], 
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:2],
                                             mcu2_drif_dram_bank_c[1], 2'b10, mcu2_drif_dram_bank_c[0],
                                             mcu2_drif_dram_addr_c[1], 5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu2_physical_addr_a[32] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[32] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[32] = mcu2_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu2_physical_addr_a[33] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[33] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[33] = mcu2_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu2_physical_addr_a[34] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[34] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[34] = mcu2_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu2_physical_addr_a[35] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[35] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[35] = mcu2_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b1_1_0_01_001,
  8'b1_1_0_01_010,
  8'b1_1_0_01_100, 
  8'b1_1_0_01_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_dimm_a, mcu2_drif_dram_ras_addr_a[13:0], 
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:2],
                                             mcu2_drif_dram_bank_a[1], 2'b10, mcu2_drif_dram_bank_a[0],
                                             mcu2_drif_dram_addr_a[1], 5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_dimm_b, mcu2_drif_dram_ras_addr_b[13:0], 
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:2], 
                                             mcu2_drif_dram_bank_b[1], 2'b10, mcu2_drif_dram_bank_b[0],
                                             mcu2_drif_dram_addr_b[1], 5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_dimm_c, mcu2_drif_dram_ras_addr_c[13:0], 
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:2],
                                             mcu2_drif_dram_bank_c[1], 2'b10, mcu2_drif_dram_bank_c[0],
                                             mcu2_drif_dram_addr_c[1], 5'b00000};
                   end
  8'b1_1_1_01_001,
  8'b1_1_1_01_010,
  8'b1_1_1_01_100, 
  8'b1_1_1_01_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_dimm_a, mcu2_drif_dram_ras_addr_a[13:0], 
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:2], 
                                             mcu2_drif_dram_bank_a[1], 2'b10, mcu2_drif_dram_bank_a[0], 
                                             mcu2_drif_dram_addr_a[1], 5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_dimm_b, mcu2_drif_dram_ras_addr_b[13:0], 
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:2],
                                             mcu2_drif_dram_bank_b[1], 2'b10, mcu2_drif_dram_bank_b[0],
                                             mcu2_drif_dram_addr_b[1], 5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_dimm_c, mcu2_drif_dram_ras_addr_c[13:0], 
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:2],
                                             mcu2_drif_dram_bank_c[1], 2'b10, mcu2_drif_dram_bank_c[0], 
                                             mcu2_drif_dram_addr_c[1], 5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu2_physical_addr_a[33] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[33] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[33] = mcu2_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu2_physical_addr_a[34] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[34] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[34] = mcu2_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu2_physical_addr_a[35] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[35] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[35] = mcu2_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu2_physical_addr_a[36] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[36] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[36] = mcu2_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b1_1_0_10_001,
  8'b1_1_0_10_010,
  8'b1_1_0_10_100, 
  8'b1_1_0_10_000: begin
  		     		 mcu2_physical_addr_a = {mcu2_drif_dram_dimm_a, mcu2_drif_dram_addr_a[2], 
                                    	     mcu2_drif_dram_ras_addr_a[13:0],  mcu2_drif_dram_addr_a[11],
                                     		 mcu2_drif_dram_addr_a[9:3], mcu2_drif_dram_bank_a[2:1],
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[1], 5'b00000};
             		 mcu2_physical_addr_b = {mcu2_drif_dram_dimm_b, mcu2_drif_dram_addr_b[2],
                                    	     mcu2_drif_dram_ras_addr_b[13:0],  mcu2_drif_dram_addr_b[11],
                                     		 mcu2_drif_dram_addr_b[9:3], mcu2_drif_dram_bank_b[2:1], 
                                     	     2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[1], 5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_dimm_c, mcu2_drif_dram_addr_c[2], 
                                             mcu2_drif_dram_ras_addr_c[13:0],  mcu2_drif_dram_addr_c[11],
                                             mcu2_drif_dram_addr_c[9:3], mcu2_drif_dram_bank_c[2:1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[1], 5'b00000};
                   end
  8'b1_1_1_10_001,
  8'b1_1_1_10_010,
  8'b1_1_1_10_100, 
  8'b1_1_1_10_000: begin
  		             mcu2_physical_addr_a = {mcu2_drif_dram_dimm_a, mcu2_drif_dram_addr_a[2], 
                                             mcu2_drif_dram_ras_addr_a[13:0],  mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:3], 
                                             mcu2_drif_dram_bank_a[2:1], 2'b10, mcu2_drif_dram_bank_a[0],
                                             mcu2_drif_dram_addr_a[1], 5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_dimm_b, mcu2_drif_dram_addr_b[2],
                                             mcu2_drif_dram_ras_addr_b[13:0],  mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:3],
                                             mcu2_drif_dram_bank_b[2:1], 2'b10, mcu2_drif_dram_bank_b[0],
                                             mcu2_drif_dram_addr_b[1], 5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_dimm_c, mcu2_drif_dram_addr_c[2], 
                                             mcu2_drif_dram_ras_addr_c[13:0],  mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:3],
                                             mcu2_drif_dram_bank_c[2:1], 2'b10, mcu2_drif_dram_bank_c[0], 
                                             mcu2_drif_dram_addr_c[1], 5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu2_physical_addr_a[34] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[34] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[34] = mcu2_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu2_physical_addr_a[35] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[35] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[35] = mcu2_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu2_physical_addr_a[36] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[36] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[36] = mcu2_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu2_physical_addr_a[37] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[37] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[37] = mcu2_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b1_1_0_11_001,
  8'b1_1_0_11_010,
  8'b1_1_0_11_100, 
  8'b1_1_0_11_000: begin
  		     mcu2_physical_addr_a = {mcu2_drif_dram_dimm_a, mcu2_drif_dram_addr_a[2], 
                                             mcu2_drif_dram_ras_addr_a[14:0],  mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:3], 
                                             mcu2_drif_dram_bank_a[2:1], 2'b10, mcu2_drif_dram_bank_a[0],
                                             mcu2_drif_dram_addr_a[1], 5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_dimm_b, mcu2_drif_dram_addr_b[2],
                                             mcu2_drif_dram_ras_addr_b[14:0],  mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:3],
                                             mcu2_drif_dram_bank_b[2:1], 2'b10, mcu2_drif_dram_bank_b[0],
                                             mcu2_drif_dram_addr_b[1], 5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_dimm_c, mcu2_drif_dram_addr_c[2], 
                                             mcu2_drif_dram_ras_addr_c[14:0],  mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:3],
                                             mcu2_drif_dram_bank_c[2:1], 2'b10, mcu2_drif_dram_bank_c[0], 
                                             mcu2_drif_dram_addr_c[1], 5'b00000};
                   end
  8'b1_1_1_11_001,
  8'b1_1_1_11_010,
  8'b1_1_1_11_100, 
  8'b1_1_1_11_000: begin
  		     mcu2_physical_addr_a = {mcu2_drif_dram_dimm_a, mcu2_drif_dram_addr_a[2], 
                                             mcu2_drif_dram_ras_addr_a[14:0],  mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:3], 
                                             mcu2_drif_dram_bank_a[2:1], 2'b10, mcu2_drif_dram_bank_a[0],
                                             mcu2_drif_dram_addr_a[1], 5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_dimm_b, mcu2_drif_dram_addr_b[2],
                                             mcu2_drif_dram_ras_addr_b[14:0],  mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:3],
                                             mcu2_drif_dram_bank_b[2:1], 2'b10, mcu2_drif_dram_bank_b[0],
                                             mcu2_drif_dram_addr_b[1], 5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_dimm_c, mcu2_drif_dram_addr_c[2], 
                                             mcu2_drif_dram_ras_addr_c[14:0],  mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:3],
                                             mcu2_drif_dram_bank_c[2:1], 2'b10, mcu2_drif_dram_bank_c[0], 
                                             mcu2_drif_dram_addr_c[1], 5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu2_physical_addr_a[35] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[35] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[35] = mcu2_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu2_physical_addr_a[36] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[36] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[36] = mcu2_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu2_physical_addr_a[37] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[37] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[37] = mcu2_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu2_physical_addr_a[38] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[38] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[38] = mcu2_drif_dram_rank_c;
			  end
                     endcase
                   end

  //---------------------------
  // SINGLE CHANNEL, RANK HIGH 
  //---------------------------

  8'b0_1_0_00_001,
  8'b0_1_0_00_010,
  8'b0_1_0_00_100, 
  8'b0_1_0_00_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_dimm_a, mcu2_drif_dram_ras_addr_a[12:0], 
                                              mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:3], mcu2_drif_dram_bank_a[1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_dimm_b, mcu2_drif_dram_ras_addr_b[12:0], 
                                              mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:3], mcu2_drif_dram_bank_b[1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_dimm_c, mcu2_drif_dram_ras_addr_c[12:0], 
                                              mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:3], mcu2_drif_dram_bank_c[1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[2], 
                                             5'b00000};
                   end
  8'b0_1_1_00_001,
  8'b0_1_1_00_010,
  8'b0_1_1_00_100, 
  8'b0_1_1_00_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_dimm_a, mcu2_drif_dram_ras_addr_a[12:0], 
                                              mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:3], mcu2_drif_dram_bank_a[1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_dimm_b, mcu2_drif_dram_ras_addr_b[12:0], 
                                              mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:3], mcu2_drif_dram_bank_b[1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_dimm_c, mcu2_drif_dram_ras_addr_c[12:0], 
                                              mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:3], mcu2_drif_dram_bank_c[1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[2], 
                                             5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu2_physical_addr_a[31] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[31] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[31] = mcu2_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu2_physical_addr_a[32] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[32] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[32] = mcu2_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu2_physical_addr_a[33] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[33] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[33] = mcu2_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu2_physical_addr_a[34] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[34] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[34] = mcu2_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b0_1_0_01_001,
  8'b0_1_0_01_010,
  8'b0_1_0_01_100, 
  8'b0_1_0_01_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_dimm_a, mcu2_drif_dram_ras_addr_a[13:0], 
                                              mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:3], mcu2_drif_dram_bank_a[1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_dimm_b, mcu2_drif_dram_ras_addr_b[13:0], 
                                              mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:3], mcu2_drif_dram_bank_b[1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_dimm_c, mcu2_drif_dram_ras_addr_c[13:0], 
                                              mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:3], mcu2_drif_dram_bank_c[1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[2], 
                                             5'b00000};
                   end
  8'b0_1_1_01_001,
  8'b0_1_1_01_010,
  8'b0_1_1_01_100, 
  8'b0_1_1_01_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_dimm_a, mcu2_drif_dram_ras_addr_a[13:0], 
                                              mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:3], mcu2_drif_dram_bank_a[1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_dimm_b, mcu2_drif_dram_ras_addr_b[13:0], 
                                              mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:3], mcu2_drif_dram_bank_b[1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_dimm_c, mcu2_drif_dram_ras_addr_c[13:0], 
                                              mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:3], mcu2_drif_dram_bank_c[1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[2], 
                                             5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu2_physical_addr_a[32] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[32] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[32] = mcu2_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu2_physical_addr_a[33] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[33] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[33] = mcu2_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu2_physical_addr_a[34] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[34] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[34] = mcu2_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu2_physical_addr_a[35] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[35] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[35] = mcu2_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b0_1_0_10_001,
  8'b0_1_0_10_010,
  8'b0_1_0_10_100, 
  8'b0_1_0_10_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_dimm_a, mcu2_drif_dram_addr_a[3],
                                             mcu2_drif_dram_ras_addr_a[13:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:4], mcu2_drif_dram_bank_a[2:1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_dimm_b, mcu2_drif_dram_addr_b[3],
                                             mcu2_drif_dram_ras_addr_b[13:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:4], mcu2_drif_dram_bank_b[2:1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_dimm_c, mcu2_drif_dram_addr_c[3],
                                             mcu2_drif_dram_ras_addr_c[13:0], 
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:4], mcu2_drif_dram_bank_c[2:1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[2], 
                                             5'b00000};
                   end
  8'b0_1_1_10_001,
  8'b0_1_1_10_010,
  8'b0_1_1_10_100, 
  8'b0_1_1_10_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_dimm_a, mcu2_drif_dram_addr_a[3],
                                             mcu2_drif_dram_ras_addr_a[13:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:4], mcu2_drif_dram_bank_a[2:1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_dimm_b, mcu2_drif_dram_addr_b[3],
                                             mcu2_drif_dram_ras_addr_b[13:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:4], mcu2_drif_dram_bank_b[2:1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_dimm_c, mcu2_drif_dram_addr_c[3],
                                             mcu2_drif_dram_ras_addr_c[13:0], 
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:4], mcu2_drif_dram_bank_c[2:1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[2], 
                                             5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu2_physical_addr_a[33] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[33] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[33] = mcu2_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu2_physical_addr_a[34] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[34] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[34] = mcu2_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu2_physical_addr_a[35] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[35] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[35] = mcu2_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu2_physical_addr_a[36] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[36] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[36] = mcu2_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b0_1_0_11_001,
  8'b0_1_0_11_010,
  8'b0_1_0_11_100, 
  8'b0_1_0_11_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_dimm_a, mcu2_drif_dram_addr_a[3],
                                             mcu2_drif_dram_ras_addr_a[14:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:4], mcu2_drif_dram_bank_a[2:1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_dimm_b, mcu2_drif_dram_addr_b[3],
                                             mcu2_drif_dram_ras_addr_b[14:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:4], mcu2_drif_dram_bank_b[2:1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_dimm_c, mcu2_drif_dram_addr_c[3],
                                             mcu2_drif_dram_ras_addr_c[14:0], 
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:4], mcu2_drif_dram_bank_c[2:1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[2], 
                                             5'b00000};
                   end
  8'b0_1_1_11_001,
  8'b0_1_1_11_010,
  8'b0_1_1_11_100, 
  8'b0_1_1_11_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_dimm_a, mcu2_drif_dram_addr_a[3],
                                             mcu2_drif_dram_ras_addr_a[14:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:4], mcu2_drif_dram_bank_a[2:1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_dimm_b, mcu2_drif_dram_addr_b[3],
                                             mcu2_drif_dram_ras_addr_b[14:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:4], mcu2_drif_dram_bank_b[2:1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_dimm_c, mcu2_drif_dram_addr_c[3],
                                             mcu2_drif_dram_ras_addr_c[14:0], 
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:4], mcu2_drif_dram_bank_c[2:1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[2], 
                                             5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu2_physical_addr_a[34] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[34] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[34] = mcu2_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu2_physical_addr_a[35] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[35] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[35] = mcu2_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu2_physical_addr_a[36] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[36] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[36] = mcu2_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu2_physical_addr_a[37] = mcu2_drif_dram_rank_a;
                            mcu2_physical_addr_b[37] = mcu2_drif_dram_rank_b;
                            mcu2_physical_addr_c[37] = mcu2_drif_dram_rank_c;
			  end
                     endcase
                   end

  //---------------------------
  // DUAL CHANNEL, RANK LOW 
  //---------------------------

  8'b1_0_0_00_001,
  8'b1_0_0_00_010,
  8'b1_0_0_00_100,
  8'b1_0_0_00_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_ras_addr_a[12:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:2], mcu2_drif_dram_bank_a[1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_ras_addr_b[12:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:2], mcu2_drif_dram_bank_b[1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_ras_addr_c[12:0],  
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:2], mcu2_drif_dram_bank_c[1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                          end
                     010: begin
                            mcu2_physical_addr_a[32] = mcu2_drif_dram_addr_a[2];  
                            mcu2_physical_addr_a[10] = mcu2_drif_dram_dimm_a[0];  
                            mcu2_physical_addr_b[32] = mcu2_drif_dram_addr_b[2];  
                            mcu2_physical_addr_b[10] = mcu2_drif_dram_dimm_b[0];  
                            mcu2_physical_addr_c[32] = mcu2_drif_dram_addr_c[2];  
                            mcu2_physical_addr_c[10] = mcu2_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu2_physical_addr_a[33:32] = mcu2_drif_dram_addr_a[3:2];  
                            mcu2_physical_addr_a[11:10] = mcu2_drif_dram_dimm_a[1:0];  
                            mcu2_physical_addr_b[33:32] = mcu2_drif_dram_addr_b[3:2];  
                            mcu2_physical_addr_b[11:10] = mcu2_drif_dram_dimm_b[1:0];  
                            mcu2_physical_addr_c[33:32] = mcu2_drif_dram_addr_c[3:2];  
                            mcu2_physical_addr_c[11:10] = mcu2_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu2_physical_addr_a[34:32] = mcu2_drif_dram_addr_a[4:2];  
                            mcu2_physical_addr_a[12:10] = mcu2_drif_dram_dimm_a[2:0];  
                            mcu2_physical_addr_b[34:32] = mcu2_drif_dram_addr_b[4:2];  
                            mcu2_physical_addr_b[12:10] = mcu2_drif_dram_dimm_b[2:0];  
                            mcu2_physical_addr_c[34:32] = mcu2_drif_dram_addr_c[4:2];  
                            mcu2_physical_addr_c[12:10] = mcu2_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b1_0_1_00_001,
  8'b1_0_1_00_010,
  8'b1_0_1_00_100,
  8'b1_0_1_00_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_ras_addr_a[12:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:2], mcu2_drif_dram_bank_a[1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_ras_addr_b[12:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:2], mcu2_drif_dram_bank_b[1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_ras_addr_c[12:0],  
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:2], mcu2_drif_dram_bank_c[1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu2_physical_addr_a[32] = mcu2_drif_dram_addr_a[2];  
                            mcu2_physical_addr_a[10] = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[32] = mcu2_drif_dram_addr_b[2];  
                            mcu2_physical_addr_b[10] = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[32] = mcu2_drif_dram_addr_c[2];  
                            mcu2_physical_addr_c[10] = mcu2_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu2_physical_addr_a[33:32] = mcu2_drif_dram_addr_a[3:2];  
                            mcu2_physical_addr_a[10]    = mcu2_drif_dram_dimm_a[0];  
                            mcu2_physical_addr_a[11]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[33:32] = mcu2_drif_dram_addr_b[3:2];  
                            mcu2_physical_addr_b[10]    = mcu2_drif_dram_dimm_b[0];  
                            mcu2_physical_addr_b[11]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[33:32] = mcu2_drif_dram_addr_c[3:2];  
                            mcu2_physical_addr_c[10]    = mcu2_drif_dram_dimm_c[0];  
                            mcu2_physical_addr_c[11]    = mcu2_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu2_physical_addr_a[34:32] = mcu2_drif_dram_addr_a[4:2];  
                            mcu2_physical_addr_a[11:10] = mcu2_drif_dram_dimm_a[1:0];  
                            mcu2_physical_addr_a[12]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[34:32] = mcu2_drif_dram_addr_b[4:2];  
                            mcu2_physical_addr_b[11:10] = mcu2_drif_dram_dimm_b[1:0];  
                            mcu2_physical_addr_b[12]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[34:32] = mcu2_drif_dram_addr_c[4:2];  
                            mcu2_physical_addr_c[11:10] = mcu2_drif_dram_dimm_c[1:0];  
                            mcu2_physical_addr_c[12]    = mcu2_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu2_physical_addr_a[35:32] = mcu2_drif_dram_addr_a[5:2];  
                            mcu2_physical_addr_a[12:10] = mcu2_drif_dram_dimm_a[2:0];  
                            mcu2_physical_addr_a[13]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[35:32] = mcu2_drif_dram_addr_b[5:2];  
                            mcu2_physical_addr_b[12:10] = mcu2_drif_dram_dimm_b[2:0];  
                            mcu2_physical_addr_b[13]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[35:32] = mcu2_drif_dram_addr_c[5:2];  
                            mcu2_physical_addr_c[12:10] = mcu2_drif_dram_dimm_c[2:0];  
                            mcu2_physical_addr_c[13]    = mcu2_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b1_0_0_01_001,
  8'b1_0_0_01_010,
  8'b1_0_0_01_100,
  8'b1_0_0_01_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_ras_addr_a[13:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:2], mcu2_drif_dram_bank_a[1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_ras_addr_b[13:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:2], mcu2_drif_dram_bank_b[1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_ras_addr_c[13:0],  
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:2], mcu2_drif_dram_bank_c[1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                          end
                     010: begin
                            mcu2_physical_addr_a[33] = mcu2_drif_dram_addr_a[2];  
                            mcu2_physical_addr_a[10] = mcu2_drif_dram_dimm_a[0];  
                            mcu2_physical_addr_b[33] = mcu2_drif_dram_addr_b[2];  
                            mcu2_physical_addr_b[10] = mcu2_drif_dram_dimm_b[0];  
                            mcu2_physical_addr_c[33] = mcu2_drif_dram_addr_c[2];  
                            mcu2_physical_addr_c[10] = mcu2_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu2_physical_addr_a[34:33] = mcu2_drif_dram_addr_a[3:2];  
                            mcu2_physical_addr_a[11:10] = mcu2_drif_dram_dimm_a[1:0];  
                            mcu2_physical_addr_b[34:33] = mcu2_drif_dram_addr_b[3:2];  
                            mcu2_physical_addr_b[11:10] = mcu2_drif_dram_dimm_b[1:0];  
                            mcu2_physical_addr_c[34:33] = mcu2_drif_dram_addr_c[3:2];  
                            mcu2_physical_addr_c[11:10] = mcu2_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu2_physical_addr_a[35:33] = mcu2_drif_dram_addr_a[4:2];  
                            mcu2_physical_addr_a[12:10] = mcu2_drif_dram_dimm_a[2:0];  
                            mcu2_physical_addr_b[35:33] = mcu2_drif_dram_addr_b[4:2];  
                            mcu2_physical_addr_b[12:10] = mcu2_drif_dram_dimm_b[2:0];  
                            mcu2_physical_addr_c[35:33] = mcu2_drif_dram_addr_c[4:2];  
                            mcu2_physical_addr_c[12:10] = mcu2_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b1_0_1_01_001,
  8'b1_0_1_01_010,
  8'b1_0_1_01_100,
  8'b1_0_1_01_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_ras_addr_a[13:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:2], mcu2_drif_dram_bank_a[1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_ras_addr_b[13:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:2], mcu2_drif_dram_bank_b[1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_ras_addr_c[13:0],  
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:2], mcu2_drif_dram_bank_c[1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu2_physical_addr_a[33] = mcu2_drif_dram_addr_a[2];  
                            mcu2_physical_addr_a[10] = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[33] = mcu2_drif_dram_addr_b[2];  
                            mcu2_physical_addr_b[10] = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[33] = mcu2_drif_dram_addr_c[2];  
                            mcu2_physical_addr_c[10] = mcu2_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu2_physical_addr_a[34:33] = mcu2_drif_dram_addr_a[3:2];  
                            mcu2_physical_addr_a[10]    = mcu2_drif_dram_dimm_a[0];  
                            mcu2_physical_addr_a[11]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[34:33] = mcu2_drif_dram_addr_b[3:2];  
                            mcu2_physical_addr_b[10]    = mcu2_drif_dram_dimm_b[0];  
                            mcu2_physical_addr_b[11]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[34:33] = mcu2_drif_dram_addr_c[3:2];  
                            mcu2_physical_addr_c[10]    = mcu2_drif_dram_dimm_c[0];  
                            mcu2_physical_addr_c[11]    = mcu2_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu2_physical_addr_a[35:33] = mcu2_drif_dram_addr_a[4:2];  
                            mcu2_physical_addr_a[11:10] = mcu2_drif_dram_dimm_a[1:0];  
                            mcu2_physical_addr_a[12]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[35:33] = mcu2_drif_dram_addr_b[4:2];  
                            mcu2_physical_addr_b[11:10] = mcu2_drif_dram_dimm_b[1:0];  
                            mcu2_physical_addr_b[12]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[35:33] = mcu2_drif_dram_addr_c[4:2];  
                            mcu2_physical_addr_c[11:10] = mcu2_drif_dram_dimm_c[1:0];  
                            mcu2_physical_addr_c[12]    = mcu2_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu2_physical_addr_a[36:33] = mcu2_drif_dram_addr_a[5:2];  
                            mcu2_physical_addr_a[12:10] = mcu2_drif_dram_dimm_a[2:0];  
                            mcu2_physical_addr_a[13]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[36:33] = mcu2_drif_dram_addr_b[5:2];  
                            mcu2_physical_addr_b[12:10] = mcu2_drif_dram_dimm_b[2:0];  
                            mcu2_physical_addr_b[13]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[36:33] = mcu2_drif_dram_addr_c[5:2];  
                            mcu2_physical_addr_c[12:10] = mcu2_drif_dram_dimm_c[2:0];  
                            mcu2_physical_addr_c[13]    = mcu2_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b1_0_0_10_001,
  8'b1_0_0_10_010,
  8'b1_0_0_10_100,
  8'b1_0_0_10_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_ras_addr_a[13:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:3], mcu2_drif_dram_bank_a[2:1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_ras_addr_b[13:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:3], mcu2_drif_dram_bank_b[2:1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_ras_addr_c[13:0],  
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:3], mcu2_drif_dram_bank_c[2:1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu2_physical_addr_a[33] = mcu2_drif_dram_addr_a[2];  
                            mcu2_physical_addr_b[33] = mcu2_drif_dram_addr_b[2];  
                            mcu2_physical_addr_c[33] = mcu2_drif_dram_addr_c[2];  
                          end
                     010: begin
                            mcu2_physical_addr_a[34:33] = mcu2_drif_dram_addr_a[3:2];  
                            mcu2_physical_addr_a[11]    = mcu2_drif_dram_dimm_a[0];  
                            mcu2_physical_addr_b[34:33] = mcu2_drif_dram_addr_b[3:2];  
                            mcu2_physical_addr_b[11]    = mcu2_drif_dram_dimm_b[0];  
                            mcu2_physical_addr_c[34:33] = mcu2_drif_dram_addr_c[3:2];  
                            mcu2_physical_addr_c[11]    = mcu2_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu2_physical_addr_a[35:33] = mcu2_drif_dram_addr_a[4:2];  
                            mcu2_physical_addr_a[12:11] = mcu2_drif_dram_dimm_a[1:0];  
                            mcu2_physical_addr_b[35:33] = mcu2_drif_dram_addr_b[4:2];  
                            mcu2_physical_addr_b[12:11] = mcu2_drif_dram_dimm_b[1:0];  
                            mcu2_physical_addr_c[35:33] = mcu2_drif_dram_addr_c[4:2];  
                            mcu2_physical_addr_c[12:11] = mcu2_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu2_physical_addr_a[36:33] = mcu2_drif_dram_addr_a[5:2];  
                            mcu2_physical_addr_a[13:11] = mcu2_drif_dram_dimm_a[2:0];  
                            mcu2_physical_addr_b[36:33] = mcu2_drif_dram_addr_b[5:2];  
                            mcu2_physical_addr_b[13:11] = mcu2_drif_dram_dimm_b[2:0];  
                            mcu2_physical_addr_c[36:33] = mcu2_drif_dram_addr_c[5:2];  
                            mcu2_physical_addr_c[13:11] = mcu2_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b1_0_1_10_001,
  8'b1_0_1_10_010,
  8'b1_0_1_10_100,
  8'b1_0_1_10_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_ras_addr_a[13:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:2], mcu2_drif_dram_bank_a[1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_ras_addr_b[13:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:2], mcu2_drif_dram_bank_b[1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_ras_addr_c[13:0],  
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:2], mcu2_drif_dram_bank_c[1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu2_physical_addr_a[34:33] = mcu2_drif_dram_addr_a[3:2];  
                            mcu2_physical_addr_a[11]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[34:33] = mcu2_drif_dram_addr_b[3:2];  
                            mcu2_physical_addr_b[11]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[34:33] = mcu2_drif_dram_addr_c[3:2];  
                            mcu2_physical_addr_c[11]    = mcu2_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu2_physical_addr_a[35:33] = mcu2_drif_dram_addr_a[4:2];  
                            mcu2_physical_addr_a[11]    = mcu2_drif_dram_dimm_a[0];  
                            mcu2_physical_addr_a[12]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[35:33] = mcu2_drif_dram_addr_b[4:2];  
                            mcu2_physical_addr_b[11]    = mcu2_drif_dram_dimm_b[0];  
                            mcu2_physical_addr_b[12]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[35:33] = mcu2_drif_dram_addr_c[4:2];  
                            mcu2_physical_addr_c[11]    = mcu2_drif_dram_dimm_c[0];  
                            mcu2_physical_addr_c[12]    = mcu2_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu2_physical_addr_a[36:33] = mcu2_drif_dram_addr_a[5:2];  
                            mcu2_physical_addr_a[12:11] = mcu2_drif_dram_dimm_a[1:0];  
                            mcu2_physical_addr_a[13]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[36:33] = mcu2_drif_dram_addr_b[5:2];  
                            mcu2_physical_addr_b[13:11] = mcu2_drif_dram_dimm_b[1:0];  
                            mcu2_physical_addr_b[12]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[36:33] = mcu2_drif_dram_addr_c[5:2];  
                            mcu2_physical_addr_c[12:11] = mcu2_drif_dram_dimm_c[1:0];  
                            mcu2_physical_addr_c[13]    = mcu2_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu2_physical_addr_a[37:33] = mcu2_drif_dram_addr_a[5:2];  
                            mcu2_physical_addr_a[13:11] = mcu2_drif_dram_dimm_a[2:0];  
                            mcu2_physical_addr_a[14]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[37:33] = mcu2_drif_dram_addr_b[5:2];  
                            mcu2_physical_addr_b[13:11] = mcu2_drif_dram_dimm_b[2:0];  
                            mcu2_physical_addr_b[14]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[37:33] = mcu2_drif_dram_addr_c[5:2];  
                            mcu2_physical_addr_c[13:11] = mcu2_drif_dram_dimm_c[2:0];  
                            mcu2_physical_addr_c[14]    = mcu2_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b1_0_0_11_001,
  8'b1_0_0_11_010,
  8'b1_0_0_11_100,
  8'b1_0_0_11_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_ras_addr_a[14:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:3], mcu2_drif_dram_bank_a[2:1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_ras_addr_b[14:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:3], mcu2_drif_dram_bank_b[2:1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_ras_addr_c[14:0],  
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:3], mcu2_drif_dram_bank_c[2:1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu2_physical_addr_a[34] = mcu2_drif_dram_addr_a[2];  
                            mcu2_physical_addr_b[34] = mcu2_drif_dram_addr_b[2];  
                            mcu2_physical_addr_c[34] = mcu2_drif_dram_addr_c[2];  
                          end
                     010: begin
                            mcu2_physical_addr_a[35:34] = mcu2_drif_dram_addr_a[3:2];  
                            mcu2_physical_addr_a[11]    = mcu2_drif_dram_dimm_a[0];  
                            mcu2_physical_addr_b[35:34] = mcu2_drif_dram_addr_b[3:2];  
                            mcu2_physical_addr_b[11]    = mcu2_drif_dram_dimm_b[0];  
                            mcu2_physical_addr_c[35:34] = mcu2_drif_dram_addr_c[3:2];  
                            mcu2_physical_addr_c[11]    = mcu2_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu2_physical_addr_a[36:34] = mcu2_drif_dram_addr_a[4:2];  
                            mcu2_physical_addr_a[12:11] = mcu2_drif_dram_dimm_a[1:0];  
                            mcu2_physical_addr_b[36:34] = mcu2_drif_dram_addr_b[4:2];  
                            mcu2_physical_addr_b[12:11] = mcu2_drif_dram_dimm_b[1:0];  
                            mcu2_physical_addr_c[36:34] = mcu2_drif_dram_addr_c[4:2];  
                            mcu2_physical_addr_c[12:11] = mcu2_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu2_physical_addr_a[37:34] = mcu2_drif_dram_addr_a[5:2];  
                            mcu2_physical_addr_a[13:11] = mcu2_drif_dram_dimm_a[2:0];  
                            mcu2_physical_addr_b[37:34] = mcu2_drif_dram_addr_b[5:2];  
                            mcu2_physical_addr_b[13:11] = mcu2_drif_dram_dimm_b[2:0];  
                            mcu2_physical_addr_c[37:34] = mcu2_drif_dram_addr_c[5:2];  
                            mcu2_physical_addr_c[13:11] = mcu2_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b1_0_1_11_001,
  8'b1_0_1_11_010,
  8'b1_0_1_11_100,
  8'b1_0_1_11_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_ras_addr_a[14:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:2], mcu2_drif_dram_bank_a[1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_ras_addr_b[14:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:2], mcu2_drif_dram_bank_b[1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_ras_addr_c[14:0],  
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:2], mcu2_drif_dram_bank_c[1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu2_physical_addr_a[35:34] = mcu2_drif_dram_addr_a[3:2];  
                            mcu2_physical_addr_a[11]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[35:34] = mcu2_drif_dram_addr_b[3:2];  
                            mcu2_physical_addr_b[11]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[35:34] = mcu2_drif_dram_addr_c[3:2];  
                            mcu2_physical_addr_c[11]    = mcu2_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu2_physical_addr_a[36:34] = mcu2_drif_dram_addr_a[4:2];  
                            mcu2_physical_addr_a[11]    = mcu2_drif_dram_dimm_a[0];  
                            mcu2_physical_addr_a[12]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[36:34] = mcu2_drif_dram_addr_b[4:2];  
                            mcu2_physical_addr_b[11]    = mcu2_drif_dram_dimm_b[0];  
                            mcu2_physical_addr_b[12]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[36:34] = mcu2_drif_dram_addr_c[4:2];  
                            mcu2_physical_addr_c[11]    = mcu2_drif_dram_dimm_c[0];  
                            mcu2_physical_addr_c[12]    = mcu2_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu2_physical_addr_a[37:34] = mcu2_drif_dram_addr_a[5:2];  
                            mcu2_physical_addr_a[12:11] = mcu2_drif_dram_dimm_a[1:0];  
                            mcu2_physical_addr_a[13]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[37:34] = mcu2_drif_dram_addr_b[5:2];  
                            mcu2_physical_addr_b[13:11] = mcu2_drif_dram_dimm_b[1:0];  
                            mcu2_physical_addr_b[12]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[37:34] = mcu2_drif_dram_addr_c[5:2];  
                            mcu2_physical_addr_c[12:11] = mcu2_drif_dram_dimm_c[1:0];  
                            mcu2_physical_addr_c[13]    = mcu2_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu2_physical_addr_a[38:34] = mcu2_drif_dram_addr_a[5:2];  
                            mcu2_physical_addr_a[13:11] = mcu2_drif_dram_dimm_a[2:0];  
                            mcu2_physical_addr_a[14]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[38:34] = mcu2_drif_dram_addr_b[5:2];  
                            mcu2_physical_addr_b[13:11] = mcu2_drif_dram_dimm_b[2:0];  
                            mcu2_physical_addr_b[14]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[38:34] = mcu2_drif_dram_addr_c[5:2];  
                            mcu2_physical_addr_c[13:11] = mcu2_drif_dram_dimm_c[2:0];  
                            mcu2_physical_addr_c[14]    = mcu2_drif_dram_rank_c;  
			  end
                     endcase
                   end

  //---------------------------
  // SINGLE CHANNEL, RANK LOW 
  //---------------------------

  8'b0_0_0_00_001,
  8'b0_0_0_00_010,
  8'b0_0_0_00_100,
  8'b0_0_0_00_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_ras_addr_a[12:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:3], mcu2_drif_dram_bank_a[1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_ras_addr_b[12:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:3], mcu2_drif_dram_bank_b[1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_ras_addr_c[12:0],  
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:3], mcu2_drif_dram_bank_c[1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                          end
                     010: begin
                            mcu2_physical_addr_a[31] = mcu2_drif_dram_addr_a[3];  
                            mcu2_physical_addr_a[10] = mcu2_drif_dram_dimm_a[0];  
                            mcu2_physical_addr_b[31] = mcu2_drif_dram_addr_b[3];  
                            mcu2_physical_addr_b[10] = mcu2_drif_dram_dimm_b[0];  
                            mcu2_physical_addr_c[31] = mcu2_drif_dram_addr_c[3];  
                            mcu2_physical_addr_c[10] = mcu2_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu2_physical_addr_a[32:31] = mcu2_drif_dram_addr_a[4:3];  
                            mcu2_physical_addr_a[11:10] = mcu2_drif_dram_dimm_a[1:0];  
                            mcu2_physical_addr_b[32:31] = mcu2_drif_dram_addr_b[4:3];  
                            mcu2_physical_addr_b[11:10] = mcu2_drif_dram_dimm_b[1:0];  
                            mcu2_physical_addr_c[32:31] = mcu2_drif_dram_addr_c[4:3];  
                            mcu2_physical_addr_c[11:10] = mcu2_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu2_physical_addr_a[33:31] = mcu2_drif_dram_addr_a[5:3];  
                            mcu2_physical_addr_a[12:10] = mcu2_drif_dram_dimm_a[2:0];  
                            mcu2_physical_addr_b[33:31] = mcu2_drif_dram_addr_b[5:3];  
                            mcu2_physical_addr_b[12:10] = mcu2_drif_dram_dimm_b[2:0];  
                            mcu2_physical_addr_c[33:31] = mcu2_drif_dram_addr_c[5:3];  
                            mcu2_physical_addr_c[12:10] = mcu2_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b0_0_1_00_001,
  8'b0_0_1_00_010,
  8'b0_0_1_00_100,
  8'b0_0_1_00_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_ras_addr_a[12:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:3], mcu2_drif_dram_bank_a[1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_ras_addr_b[12:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:3], mcu2_drif_dram_bank_b[1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_ras_addr_c[12:0],  
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:3], mcu2_drif_dram_bank_c[1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu2_physical_addr_a[31] = mcu2_drif_dram_addr_a[3];  
                            mcu2_physical_addr_a[10] = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[31] = mcu2_drif_dram_addr_b[3];  
                            mcu2_physical_addr_b[10] = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[31] = mcu2_drif_dram_addr_c[3];  
                            mcu2_physical_addr_c[10] = mcu2_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu2_physical_addr_a[32:31] = mcu2_drif_dram_addr_a[4:3];  
                            mcu2_physical_addr_a[10]    = mcu2_drif_dram_dimm_a[0];  
                            mcu2_physical_addr_a[11]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[32:31] = mcu2_drif_dram_addr_b[4:3];  
                            mcu2_physical_addr_b[10]    = mcu2_drif_dram_dimm_b[0];  
                            mcu2_physical_addr_b[11]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[32:31] = mcu2_drif_dram_addr_c[4:3];  
                            mcu2_physical_addr_c[10]    = mcu2_drif_dram_dimm_c[0];  
                            mcu2_physical_addr_c[11]    = mcu2_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu2_physical_addr_a[33:31] = mcu2_drif_dram_addr_a[5:3];  
                            mcu2_physical_addr_a[11:10] = mcu2_drif_dram_dimm_a[1:0];  
                            mcu2_physical_addr_a[12]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[33:31] = mcu2_drif_dram_addr_b[5:3];  
                            mcu2_physical_addr_b[11:10] = mcu2_drif_dram_dimm_b[1:0];  
                            mcu2_physical_addr_b[12]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[33:31] = mcu2_drif_dram_addr_c[5:3];  
                            mcu2_physical_addr_c[11:10] = mcu2_drif_dram_dimm_c[1:0];  
                            mcu2_physical_addr_c[12]    = mcu2_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu2_physical_addr_a[34:31] = mcu2_drif_dram_addr_a[6:3];  
                            mcu2_physical_addr_a[12:10] = mcu2_drif_dram_dimm_a[2:0];  
                            mcu2_physical_addr_a[13]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[34:31] = mcu2_drif_dram_addr_b[6:3];  
                            mcu2_physical_addr_b[12:10] = mcu2_drif_dram_dimm_b[2:0];  
                            mcu2_physical_addr_b[13]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[34:31] = mcu2_drif_dram_addr_c[6:3];  
                            mcu2_physical_addr_c[12:10] = mcu2_drif_dram_dimm_c[2:0];  
                            mcu2_physical_addr_c[13]    = mcu2_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b0_0_0_01_001,
  8'b0_0_0_01_010,
  8'b0_0_0_01_100,
  8'b0_0_0_01_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_ras_addr_a[13:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:3], mcu2_drif_dram_bank_a[1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_ras_addr_b[13:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:3], mcu2_drif_dram_bank_b[1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_ras_addr_c[13:0],  
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:3], mcu2_drif_dram_bank_c[1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                          end
                     010: begin
                            mcu2_physical_addr_a[32] = mcu2_drif_dram_addr_a[3];  
                            mcu2_physical_addr_a[10] = mcu2_drif_dram_dimm_a[0];  
                            mcu2_physical_addr_b[32] = mcu2_drif_dram_addr_b[3];  
                            mcu2_physical_addr_b[10] = mcu2_drif_dram_dimm_b[0];  
                            mcu2_physical_addr_c[32] = mcu2_drif_dram_addr_c[3];  
                            mcu2_physical_addr_c[10] = mcu2_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu2_physical_addr_a[33:32] = mcu2_drif_dram_addr_a[4:3];  
                            mcu2_physical_addr_a[11:10] = mcu2_drif_dram_dimm_a[1:0];  
                            mcu2_physical_addr_b[33:32] = mcu2_drif_dram_addr_b[4:3];  
                            mcu2_physical_addr_b[11:10] = mcu2_drif_dram_dimm_b[1:0];  
                            mcu2_physical_addr_c[33:32] = mcu2_drif_dram_addr_c[4:3];  
                            mcu2_physical_addr_c[11:10] = mcu2_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu2_physical_addr_a[34:32] = mcu2_drif_dram_addr_a[5:3];  
                            mcu2_physical_addr_a[12:10] = mcu2_drif_dram_dimm_a[2:0];  
                            mcu2_physical_addr_b[34:32] = mcu2_drif_dram_addr_b[5:3];  
                            mcu2_physical_addr_b[12:10] = mcu2_drif_dram_dimm_b[2:0];  
                            mcu2_physical_addr_c[34:32] = mcu2_drif_dram_addr_c[5:3];  
                            mcu2_physical_addr_c[12:10] = mcu2_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b0_0_1_01_001,
  8'b0_0_1_01_010,
  8'b0_0_1_01_100,
  8'b0_0_1_01_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_ras_addr_a[13:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:3], mcu2_drif_dram_bank_a[1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_ras_addr_b[13:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:3], mcu2_drif_dram_bank_b[1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_ras_addr_c[13:0],  
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:3], mcu2_drif_dram_bank_c[1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu2_physical_addr_a[32] = mcu2_drif_dram_addr_a[3];  
                            mcu2_physical_addr_a[10] = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[32] = mcu2_drif_dram_addr_b[3];  
                            mcu2_physical_addr_b[10] = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[32] = mcu2_drif_dram_addr_c[3];  
                            mcu2_physical_addr_c[10] = mcu2_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu2_physical_addr_a[33:32] = mcu2_drif_dram_addr_a[4:3];  
                            mcu2_physical_addr_a[10]    = mcu2_drif_dram_dimm_a[0];  
                            mcu2_physical_addr_a[11]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[33:32] = mcu2_drif_dram_addr_b[4:3];  
                            mcu2_physical_addr_b[10]    = mcu2_drif_dram_dimm_b[0];  
                            mcu2_physical_addr_b[11]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[33:32] = mcu2_drif_dram_addr_c[4:3];  
                            mcu2_physical_addr_c[10]    = mcu2_drif_dram_dimm_c[0];  
                            mcu2_physical_addr_c[11]    = mcu2_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu2_physical_addr_a[34:32] = mcu2_drif_dram_addr_a[5:3];  
                            mcu2_physical_addr_a[11:10] = mcu2_drif_dram_dimm_a[1:0];  
                            mcu2_physical_addr_a[12]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[34:32] = mcu2_drif_dram_addr_b[5:3];  
                            mcu2_physical_addr_b[11:10] = mcu2_drif_dram_dimm_b[1:0];  
                            mcu2_physical_addr_b[12]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[34:32] = mcu2_drif_dram_addr_c[5:3];  
                            mcu2_physical_addr_c[11:10] = mcu2_drif_dram_dimm_c[1:0];  
                            mcu2_physical_addr_c[12]    = mcu2_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu2_physical_addr_a[35:32] = mcu2_drif_dram_addr_a[6:3];  
                            mcu2_physical_addr_a[12:10] = mcu2_drif_dram_dimm_a[2:0];  
                            mcu2_physical_addr_a[13]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[35:32] = mcu2_drif_dram_addr_b[6:3];  
                            mcu2_physical_addr_b[12:10] = mcu2_drif_dram_dimm_b[2:0];  
                            mcu2_physical_addr_b[13]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[35:32] = mcu2_drif_dram_addr_c[6:3];  
                            mcu2_physical_addr_c[12:10] = mcu2_drif_dram_dimm_c[2:0];  
                            mcu2_physical_addr_c[13]    = mcu2_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b0_0_0_10_001,
  8'b0_0_0_10_010,
  8'b0_0_0_10_100,
  8'b0_0_0_10_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_ras_addr_a[13:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:4], mcu2_drif_dram_bank_a[2:1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_ras_addr_b[13:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:4], mcu2_drif_dram_bank_b[2:1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_ras_addr_c[13:0],  
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:4], mcu2_drif_dram_bank_c[2:1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu2_physical_addr_a[32] = mcu2_drif_dram_addr_a[3];  
                            mcu2_physical_addr_b[32] = mcu2_drif_dram_addr_b[3];  
                            mcu2_physical_addr_c[32] = mcu2_drif_dram_addr_c[3];  
                          end
                     010: begin
                            mcu2_physical_addr_a[33:32] = mcu2_drif_dram_addr_a[4:3];  
                            mcu2_physical_addr_a[11]    = mcu2_drif_dram_dimm_a[0];  
                            mcu2_physical_addr_b[33:32] = mcu2_drif_dram_addr_b[4:3];  
                            mcu2_physical_addr_b[11]    = mcu2_drif_dram_dimm_b[0];  
                            mcu2_physical_addr_c[33:32] = mcu2_drif_dram_addr_c[4:3];  
                            mcu2_physical_addr_c[11]    = mcu2_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu2_physical_addr_a[34:32] = mcu2_drif_dram_addr_a[5:3];  
                            mcu2_physical_addr_a[12:11] = mcu2_drif_dram_dimm_a[1:0];  
                            mcu2_physical_addr_b[34:32] = mcu2_drif_dram_addr_b[5:3];  
                            mcu2_physical_addr_b[12:11] = mcu2_drif_dram_dimm_b[1:0];  
                            mcu2_physical_addr_c[34:32] = mcu2_drif_dram_addr_c[5:3];  
                            mcu2_physical_addr_c[12:11] = mcu2_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu2_physical_addr_a[35:32] = mcu2_drif_dram_addr_a[6:3];  
                            mcu2_physical_addr_a[13:11] = mcu2_drif_dram_dimm_a[2:0];  
                            mcu2_physical_addr_b[35:32] = mcu2_drif_dram_addr_b[6:3];  
                            mcu2_physical_addr_b[13:11] = mcu2_drif_dram_dimm_b[2:0];  
                            mcu2_physical_addr_c[35:32] = mcu2_drif_dram_addr_c[6:3];  
                            mcu2_physical_addr_c[13:11] = mcu2_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b0_0_1_10_001,
  8'b0_0_1_10_010,
  8'b0_0_1_10_100,
  8'b0_0_1_10_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_ras_addr_a[13:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:4], mcu2_drif_dram_bank_a[2:1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_ras_addr_b[13:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:4], mcu2_drif_dram_bank_b[2:1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_ras_addr_c[13:0],  
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:4], mcu2_drif_dram_bank_c[2:1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu2_physical_addr_a[33:32] = mcu2_drif_dram_addr_a[4:3];  
                            mcu2_physical_addr_a[11]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[33:32] = mcu2_drif_dram_addr_b[4:3];  
                            mcu2_physical_addr_b[11]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[33:32] = mcu2_drif_dram_addr_c[4:3];  
                            mcu2_physical_addr_c[11]    = mcu2_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu2_physical_addr_a[34:32] = mcu2_drif_dram_addr_a[5:3];  
                            mcu2_physical_addr_a[11]    = mcu2_drif_dram_dimm_a[0];  
                            mcu2_physical_addr_a[12]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[34:32] = mcu2_drif_dram_addr_b[5:3];  
                            mcu2_physical_addr_b[11]    = mcu2_drif_dram_dimm_b[0];  
                            mcu2_physical_addr_b[12]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[34:32] = mcu2_drif_dram_addr_c[5:3];  
                            mcu2_physical_addr_c[11]    = mcu2_drif_dram_dimm_c[0];  
                            mcu2_physical_addr_c[12]    = mcu2_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu2_physical_addr_a[35:32] = mcu2_drif_dram_addr_a[6:3];  
                            mcu2_physical_addr_a[12:11] = mcu2_drif_dram_dimm_a[1:0];  
                            mcu2_physical_addr_a[13]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[35:32] = mcu2_drif_dram_addr_b[6:3];  
                            mcu2_physical_addr_b[12:11] = mcu2_drif_dram_dimm_b[1:0];  
                            mcu2_physical_addr_b[13]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[35:32] = mcu2_drif_dram_addr_c[6:3];  
                            mcu2_physical_addr_c[12:11] = mcu2_drif_dram_dimm_c[1:0];  
                            mcu2_physical_addr_c[13]    = mcu2_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu2_physical_addr_a[36:32] = mcu2_drif_dram_addr_a[7:3];  
                            mcu2_physical_addr_a[13:11] = mcu2_drif_dram_dimm_a[2:0];  
                            mcu2_physical_addr_a[14]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[36:32] = mcu2_drif_dram_addr_b[7:3];  
                            mcu2_physical_addr_b[13:11] = mcu2_drif_dram_dimm_b[2:0];  
                            mcu2_physical_addr_b[14]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[36:32] = mcu2_drif_dram_addr_c[7:3];  
                            mcu2_physical_addr_c[13:11] = mcu2_drif_dram_dimm_c[2:0];  
                            mcu2_physical_addr_c[14]    = mcu2_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b0_0_0_11_001,
  8'b0_0_0_11_010,
  8'b0_0_0_11_100,
  8'b0_0_0_11_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_ras_addr_a[14:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:4], mcu2_drif_dram_bank_a[2:1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_ras_addr_b[14:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:4], mcu2_drif_dram_bank_b[2:1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_ras_addr_c[14:0],  
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:4], mcu2_drif_dram_bank_c[2:1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu2_physical_addr_a[33] = mcu2_drif_dram_addr_a[3];  
                            mcu2_physical_addr_b[33] = mcu2_drif_dram_addr_b[3];  
                            mcu2_physical_addr_c[33] = mcu2_drif_dram_addr_c[3];  
                          end
                     010: begin
                            mcu2_physical_addr_a[34:33] = mcu2_drif_dram_addr_a[4:3];  
                            mcu2_physical_addr_a[11]    = mcu2_drif_dram_dimm_a[0];  
                            mcu2_physical_addr_b[34:33] = mcu2_drif_dram_addr_b[4:3];  
                            mcu2_physical_addr_b[11]    = mcu2_drif_dram_dimm_b[0];  
                            mcu2_physical_addr_c[34:33] = mcu2_drif_dram_addr_c[4:3];  
                            mcu2_physical_addr_c[11]    = mcu2_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu2_physical_addr_a[35:33] = mcu2_drif_dram_addr_a[5:3];  
                            mcu2_physical_addr_a[12:11] = mcu2_drif_dram_dimm_a[1:0];  
                            mcu2_physical_addr_b[35:33] = mcu2_drif_dram_addr_b[5:3];  
                            mcu2_physical_addr_b[12:11] = mcu2_drif_dram_dimm_b[1:0];  
                            mcu2_physical_addr_c[35:33] = mcu2_drif_dram_addr_c[5:3];  
                            mcu2_physical_addr_c[12:11] = mcu2_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu2_physical_addr_a[36:33] = mcu2_drif_dram_addr_a[6:3];  
                            mcu2_physical_addr_a[13:11] = mcu2_drif_dram_dimm_a[2:0];  
                            mcu2_physical_addr_b[36:33] = mcu2_drif_dram_addr_b[6:3];  
                            mcu2_physical_addr_b[13:11] = mcu2_drif_dram_dimm_b[2:0];  
                            mcu2_physical_addr_c[36:33] = mcu2_drif_dram_addr_c[6:3];  
                            mcu2_physical_addr_c[13:11] = mcu2_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b0_0_1_11_001,
  8'b0_0_1_11_010,
  8'b0_0_1_11_100,
  8'b0_0_1_11_000: begin
                     mcu2_physical_addr_a = {mcu2_drif_dram_ras_addr_a[14:0],  
                                             mcu2_drif_dram_addr_a[11],mcu2_drif_dram_addr_a[9:4], mcu2_drif_dram_bank_a[2:1], 
                                             2'b10, mcu2_drif_dram_bank_a[0], mcu2_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu2_physical_addr_b = {mcu2_drif_dram_ras_addr_b[14:0],  
                                             mcu2_drif_dram_addr_b[11],mcu2_drif_dram_addr_b[9:4], mcu2_drif_dram_bank_b[2:1], 
                                             2'b10, mcu2_drif_dram_bank_b[0], mcu2_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu2_physical_addr_c = {mcu2_drif_dram_ras_addr_c[14:0],  
                                             mcu2_drif_dram_addr_c[11],mcu2_drif_dram_addr_c[9:4], mcu2_drif_dram_bank_c[2:1], 
                                             2'b10, mcu2_drif_dram_bank_c[0], mcu2_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu2_physical_addr_a[34:33] = mcu2_drif_dram_addr_a[4:3];  
                            mcu2_physical_addr_a[11]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[34:33] = mcu2_drif_dram_addr_b[4:3];  
                            mcu2_physical_addr_b[11]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[34:33] = mcu2_drif_dram_addr_c[4:3];  
                            mcu2_physical_addr_c[11]    = mcu2_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu2_physical_addr_a[35:33] = mcu2_drif_dram_addr_a[5:3];  
                            mcu2_physical_addr_a[11]    = mcu2_drif_dram_dimm_a[0];  
                            mcu2_physical_addr_a[12]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[35:33] = mcu2_drif_dram_addr_b[5:3];  
                            mcu2_physical_addr_b[11]    = mcu2_drif_dram_dimm_b[0];  
                            mcu2_physical_addr_b[12]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[35:33] = mcu2_drif_dram_addr_c[5:3];  
                            mcu2_physical_addr_c[11]    = mcu2_drif_dram_dimm_c[0];  
                            mcu2_physical_addr_c[12]    = mcu2_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu2_physical_addr_a[36:33] = mcu2_drif_dram_addr_a[6:3];  
                            mcu2_physical_addr_a[12:11] = mcu2_drif_dram_dimm_a[1:0];  
                            mcu2_physical_addr_a[13]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[36:33] = mcu2_drif_dram_addr_b[6:3];  
                            mcu2_physical_addr_b[12:11] = mcu2_drif_dram_dimm_b[1:0];  
                            mcu2_physical_addr_b[13]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[36:33] = mcu2_drif_dram_addr_c[6:3];  
                            mcu2_physical_addr_c[12:11] = mcu2_drif_dram_dimm_c[1:0];  
                            mcu2_physical_addr_c[13]    = mcu2_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu2_physical_addr_a[37:33] = mcu2_drif_dram_addr_a[7:3];  
                            mcu2_physical_addr_a[13:11] = mcu2_drif_dram_dimm_a[2:0];  
                            mcu2_physical_addr_a[14]    = mcu2_drif_dram_rank_a;  
                            mcu2_physical_addr_b[37:33] = mcu2_drif_dram_addr_b[7:3];  
                            mcu2_physical_addr_b[13:11] = mcu2_drif_dram_dimm_b[2:0];  
                            mcu2_physical_addr_b[14]    = mcu2_drif_dram_rank_b;  
                            mcu2_physical_addr_c[37:33] = mcu2_drif_dram_addr_c[7:3];  
                            mcu2_physical_addr_c[13:11] = mcu2_drif_dram_dimm_c[2:0];  
                            mcu2_physical_addr_c[14]    = mcu2_drif_dram_rank_c;  
			  end
                     endcase
                   end
  endcase

  //----------------------------------------------------------------------------------------------
  //					M C U 3 - phys addr gen
  //----------------------------------------------------------------------------------------------


  mcu3_physical_addr_a = 40'b0;
  mcu3_physical_addr_b = 40'b0;
  mcu3_physical_addr_c = 40'b0;

  case({chnl_type, rank_addr, rank, dimm_size, num_dimms})

  //-------------------------------
  // DUAL CHANNEL, RANK HIGH 
  //-------------------------------

  8'b1_1_0_00_001,
  8'b1_1_0_00_010,
  8'b1_1_0_00_100, 
  8'b1_1_0_00_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_dimm_a, mcu3_drif_dram_ras_addr_a[12:0], 
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:2], 
                                             mcu3_drif_dram_bank_a[1], 2'b11, mcu3_drif_dram_bank_a[0],
                                             mcu3_drif_dram_addr_a[1], 5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_dimm_b, mcu3_drif_dram_ras_addr_b[12:0], 
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:2],
                                             mcu3_drif_dram_bank_b[1], 2'b11, mcu3_drif_dram_bank_b[0], 
                                             mcu3_drif_dram_addr_b[1], 5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_dimm_c, mcu3_drif_dram_ras_addr_c[12:0], 
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:2],
                                             mcu3_drif_dram_bank_c[1], 2'b11, mcu3_drif_dram_bank_c[0],
                                             mcu3_drif_dram_addr_c[1], 5'b00000};
                   end
  8'b1_1_1_00_001,
  8'b1_1_1_00_010,
  8'b1_1_1_00_100, 
  8'b1_1_1_00_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_dimm_a, mcu3_drif_dram_ras_addr_a[12:0], 
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:2],
                                             mcu3_drif_dram_bank_a[1], 2'b11, mcu3_drif_dram_bank_a[0],
                                             mcu3_drif_dram_addr_a[1], 5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_dimm_b, mcu3_drif_dram_ras_addr_b[12:0], 
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:2],
                                             mcu3_drif_dram_bank_b[1], 2'b11, mcu3_drif_dram_bank_b[0],
                                             mcu3_drif_dram_addr_b[1], 5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_dimm_c, mcu3_drif_dram_ras_addr_c[12:0], 
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:2],
                                             mcu3_drif_dram_bank_c[1], 2'b11, mcu3_drif_dram_bank_c[0],
                                             mcu3_drif_dram_addr_c[1], 5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu3_physical_addr_a[32] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[32] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[32] = mcu3_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu3_physical_addr_a[33] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[33] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[33] = mcu3_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu3_physical_addr_a[34] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[34] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[34] = mcu3_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu3_physical_addr_a[35] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[35] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[35] = mcu3_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b1_1_0_01_001,
  8'b1_1_0_01_010,
  8'b1_1_0_01_100, 
  8'b1_1_0_01_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_dimm_a, mcu3_drif_dram_ras_addr_a[13:0], 
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:2],
                                             mcu3_drif_dram_bank_a[1], 2'b11, mcu3_drif_dram_bank_a[0],
                                             mcu3_drif_dram_addr_a[1], 5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_dimm_b, mcu3_drif_dram_ras_addr_b[13:0], 
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:2], 
                                             mcu3_drif_dram_bank_b[1], 2'b11, mcu3_drif_dram_bank_b[0],
                                             mcu3_drif_dram_addr_b[1], 5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_dimm_c, mcu3_drif_dram_ras_addr_c[13:0], 
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:2],
                                             mcu3_drif_dram_bank_c[1], 2'b11, mcu3_drif_dram_bank_c[0],
                                             mcu3_drif_dram_addr_c[1], 5'b00000};
                   end
  8'b1_1_1_01_001,
  8'b1_1_1_01_010,
  8'b1_1_1_01_100, 
  8'b1_1_1_01_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_dimm_a, mcu3_drif_dram_ras_addr_a[13:0], 
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:2], 
                                             mcu3_drif_dram_bank_a[1], 2'b11, mcu3_drif_dram_bank_a[0], 
                                             mcu3_drif_dram_addr_a[1], 5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_dimm_b, mcu3_drif_dram_ras_addr_b[13:0], 
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:2],
                                             mcu3_drif_dram_bank_b[1], 2'b11, mcu3_drif_dram_bank_b[0],
                                             mcu3_drif_dram_addr_b[1], 5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_dimm_c, mcu3_drif_dram_ras_addr_c[13:0], 
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:2],
                                             mcu3_drif_dram_bank_c[1], 2'b11, mcu3_drif_dram_bank_c[0], 
                                             mcu3_drif_dram_addr_c[1], 5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu3_physical_addr_a[33] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[33] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[33] = mcu3_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu3_physical_addr_a[34] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[34] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[34] = mcu3_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu3_physical_addr_a[35] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[35] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[35] = mcu3_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu3_physical_addr_a[36] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[36] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[36] = mcu3_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b1_1_0_10_001,
  8'b1_1_0_10_010,
  8'b1_1_0_10_100, 
  8'b1_1_0_10_000: begin
  		     		 mcu3_physical_addr_a = {mcu3_drif_dram_dimm_a, mcu3_drif_dram_addr_a[2], 
                                    	     mcu3_drif_dram_ras_addr_a[13:0],  mcu3_drif_dram_addr_a[11],
                                     		 mcu3_drif_dram_addr_a[9:3], mcu3_drif_dram_bank_a[2:1],
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[1], 5'b00000};
             		 mcu3_physical_addr_b = {mcu3_drif_dram_dimm_b, mcu3_drif_dram_addr_b[2],
                                    	     mcu3_drif_dram_ras_addr_b[13:0],  mcu3_drif_dram_addr_b[11],
                                     		 mcu3_drif_dram_addr_b[9:3], mcu3_drif_dram_bank_b[2:1], 
                                     	     2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[1], 5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_dimm_c, mcu3_drif_dram_addr_c[2], 
                                             mcu3_drif_dram_ras_addr_c[13:0],  mcu3_drif_dram_addr_c[11],
                                             mcu3_drif_dram_addr_c[9:3], mcu3_drif_dram_bank_c[2:1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[1], 5'b00000};
                   end
  8'b1_1_1_10_001,
  8'b1_1_1_10_010,
  8'b1_1_1_10_100, 
  8'b1_1_1_10_000: begin
  		             mcu3_physical_addr_a = {mcu3_drif_dram_dimm_a, mcu3_drif_dram_addr_a[2], 
                                             mcu3_drif_dram_ras_addr_a[13:0],  mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:3], 
                                             mcu3_drif_dram_bank_a[2:1], 2'b11, mcu3_drif_dram_bank_a[0],
                                             mcu3_drif_dram_addr_a[1], 5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_dimm_b, mcu3_drif_dram_addr_b[2],
                                             mcu3_drif_dram_ras_addr_b[13:0],  mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:3],
                                             mcu3_drif_dram_bank_b[2:1], 2'b11, mcu3_drif_dram_bank_b[0],
                                             mcu3_drif_dram_addr_b[1], 5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_dimm_c, mcu3_drif_dram_addr_c[2], 
                                             mcu3_drif_dram_ras_addr_c[13:0],  mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:3],
                                             mcu3_drif_dram_bank_c[2:1], 2'b11, mcu3_drif_dram_bank_c[0], 
                                             mcu3_drif_dram_addr_c[1], 5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu3_physical_addr_a[34] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[34] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[34] = mcu3_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu3_physical_addr_a[35] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[35] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[35] = mcu3_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu3_physical_addr_a[36] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[36] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[36] = mcu3_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu3_physical_addr_a[37] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[37] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[37] = mcu3_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b1_1_0_11_001,
  8'b1_1_0_11_010,
  8'b1_1_0_11_100, 
  8'b1_1_0_11_000: begin
  		     mcu3_physical_addr_a = {mcu3_drif_dram_dimm_a, mcu3_drif_dram_addr_a[2], 
                                             mcu3_drif_dram_ras_addr_a[14:0],  mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:3], 
                                             mcu3_drif_dram_bank_a[2:1], 2'b11, mcu3_drif_dram_bank_a[0],
                                             mcu3_drif_dram_addr_a[1], 5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_dimm_b, mcu3_drif_dram_addr_b[2],
                                             mcu3_drif_dram_ras_addr_b[14:0],  mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:3],
                                             mcu3_drif_dram_bank_b[2:1], 2'b11, mcu3_drif_dram_bank_b[0],
                                             mcu3_drif_dram_addr_b[1], 5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_dimm_c, mcu3_drif_dram_addr_c[2], 
                                             mcu3_drif_dram_ras_addr_c[14:0],  mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:3],
                                             mcu3_drif_dram_bank_c[2:1], 2'b11, mcu3_drif_dram_bank_c[0], 
                                             mcu3_drif_dram_addr_c[1], 5'b00000};
                   end
  8'b1_1_1_11_001,
  8'b1_1_1_11_010,
  8'b1_1_1_11_100, 
  8'b1_1_1_11_000: begin
  		     mcu3_physical_addr_a = {mcu3_drif_dram_dimm_a, mcu3_drif_dram_addr_a[2], 
                                             mcu3_drif_dram_ras_addr_a[14:0],  mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:3], 
                                             mcu3_drif_dram_bank_a[2:1], 2'b11, mcu3_drif_dram_bank_a[0],
                                             mcu3_drif_dram_addr_a[1], 5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_dimm_b, mcu3_drif_dram_addr_b[2],
                                             mcu3_drif_dram_ras_addr_b[14:0],  mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:3],
                                             mcu3_drif_dram_bank_b[2:1], 2'b11, mcu3_drif_dram_bank_b[0],
                                             mcu3_drif_dram_addr_b[1], 5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_dimm_c, mcu3_drif_dram_addr_c[2], 
                                             mcu3_drif_dram_ras_addr_c[14:0],  mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:3],
                                             mcu3_drif_dram_bank_c[2:1], 2'b11, mcu3_drif_dram_bank_c[0], 
                                             mcu3_drif_dram_addr_c[1], 5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu3_physical_addr_a[35] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[35] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[35] = mcu3_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu3_physical_addr_a[36] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[36] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[36] = mcu3_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu3_physical_addr_a[37] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[37] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[37] = mcu3_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu3_physical_addr_a[38] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[38] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[38] = mcu3_drif_dram_rank_c;
			  end
                     endcase
                   end

  //---------------------------
  // SINGLE CHANNEL, RANK HIGH 
  //---------------------------

  8'b0_1_0_00_001,
  8'b0_1_0_00_010,
  8'b0_1_0_00_100, 
  8'b0_1_0_00_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_dimm_a, mcu3_drif_dram_ras_addr_a[12:0], 
                                              mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:3], mcu3_drif_dram_bank_a[1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_dimm_b, mcu3_drif_dram_ras_addr_b[12:0], 
                                              mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:3], mcu3_drif_dram_bank_b[1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_dimm_c, mcu3_drif_dram_ras_addr_c[12:0], 
                                              mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:3], mcu3_drif_dram_bank_c[1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[2], 
                                             5'b00000};
                   end
  8'b0_1_1_00_001,
  8'b0_1_1_00_010,
  8'b0_1_1_00_100, 
  8'b0_1_1_00_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_dimm_a, mcu3_drif_dram_ras_addr_a[12:0], 
                                              mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:3], mcu3_drif_dram_bank_a[1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_dimm_b, mcu3_drif_dram_ras_addr_b[12:0], 
                                              mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:3], mcu3_drif_dram_bank_b[1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_dimm_c, mcu3_drif_dram_ras_addr_c[12:0], 
                                              mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:3], mcu3_drif_dram_bank_c[1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[2], 
                                             5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu3_physical_addr_a[31] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[31] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[31] = mcu3_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu3_physical_addr_a[32] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[32] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[32] = mcu3_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu3_physical_addr_a[33] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[33] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[33] = mcu3_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu3_physical_addr_a[34] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[34] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[34] = mcu3_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b0_1_0_01_001,
  8'b0_1_0_01_010,
  8'b0_1_0_01_100, 
  8'b0_1_0_01_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_dimm_a, mcu3_drif_dram_ras_addr_a[13:0], 
                                              mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:3], mcu3_drif_dram_bank_a[1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_dimm_b, mcu3_drif_dram_ras_addr_b[13:0], 
                                              mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:3], mcu3_drif_dram_bank_b[1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_dimm_c, mcu3_drif_dram_ras_addr_c[13:0], 
                                              mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:3], mcu3_drif_dram_bank_c[1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[2], 
                                             5'b00000};
                   end
  8'b0_1_1_01_001,
  8'b0_1_1_01_010,
  8'b0_1_1_01_100, 
  8'b0_1_1_01_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_dimm_a, mcu3_drif_dram_ras_addr_a[13:0], 
                                              mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:3], mcu3_drif_dram_bank_a[1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_dimm_b, mcu3_drif_dram_ras_addr_b[13:0], 
                                              mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:3], mcu3_drif_dram_bank_b[1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_dimm_c, mcu3_drif_dram_ras_addr_c[13:0], 
                                              mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:3], mcu3_drif_dram_bank_c[1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[2], 
                                             5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu3_physical_addr_a[32] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[32] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[32] = mcu3_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu3_physical_addr_a[33] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[33] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[33] = mcu3_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu3_physical_addr_a[34] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[34] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[34] = mcu3_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu3_physical_addr_a[35] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[35] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[35] = mcu3_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b0_1_0_10_001,
  8'b0_1_0_10_010,
  8'b0_1_0_10_100, 
  8'b0_1_0_10_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_dimm_a, mcu3_drif_dram_addr_a[3],
                                             mcu3_drif_dram_ras_addr_a[13:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:4], mcu3_drif_dram_bank_a[2:1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_dimm_b, mcu3_drif_dram_addr_b[3],
                                             mcu3_drif_dram_ras_addr_b[13:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:4], mcu3_drif_dram_bank_b[2:1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_dimm_c, mcu3_drif_dram_addr_c[3],
                                             mcu3_drif_dram_ras_addr_c[13:0], 
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:4], mcu3_drif_dram_bank_c[2:1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[2], 
                                             5'b00000};
                   end
  8'b0_1_1_10_001,
  8'b0_1_1_10_010,
  8'b0_1_1_10_100, 
  8'b0_1_1_10_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_dimm_a, mcu3_drif_dram_addr_a[3],
                                             mcu3_drif_dram_ras_addr_a[13:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:4], mcu3_drif_dram_bank_a[2:1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_dimm_b, mcu3_drif_dram_addr_b[3],
                                             mcu3_drif_dram_ras_addr_b[13:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:4], mcu3_drif_dram_bank_b[2:1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_dimm_c, mcu3_drif_dram_addr_c[3],
                                             mcu3_drif_dram_ras_addr_c[13:0], 
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:4], mcu3_drif_dram_bank_c[2:1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[2], 
                                             5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu3_physical_addr_a[33] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[33] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[33] = mcu3_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu3_physical_addr_a[34] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[34] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[34] = mcu3_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu3_physical_addr_a[35] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[35] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[35] = mcu3_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu3_physical_addr_a[36] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[36] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[36] = mcu3_drif_dram_rank_c;
			  end
                     endcase
                   end
  8'b0_1_0_11_001,
  8'b0_1_0_11_010,
  8'b0_1_0_11_100, 
  8'b0_1_0_11_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_dimm_a, mcu3_drif_dram_addr_a[3],
                                             mcu3_drif_dram_ras_addr_a[14:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:4], mcu3_drif_dram_bank_a[2:1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_dimm_b, mcu3_drif_dram_addr_b[3],
                                             mcu3_drif_dram_ras_addr_b[14:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:4], mcu3_drif_dram_bank_b[2:1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_dimm_c, mcu3_drif_dram_addr_c[3],
                                             mcu3_drif_dram_ras_addr_c[14:0], 
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:4], mcu3_drif_dram_bank_c[2:1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[2], 
                                             5'b00000};
                   end
  8'b0_1_1_11_001,
  8'b0_1_1_11_010,
  8'b0_1_1_11_100, 
  8'b0_1_1_11_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_dimm_a, mcu3_drif_dram_addr_a[3],
                                             mcu3_drif_dram_ras_addr_a[14:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:4], mcu3_drif_dram_bank_a[2:1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_dimm_b, mcu3_drif_dram_addr_b[3],
                                             mcu3_drif_dram_ras_addr_b[14:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:4], mcu3_drif_dram_bank_b[2:1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_dimm_c, mcu3_drif_dram_addr_c[3],
                                             mcu3_drif_dram_ras_addr_c[14:0], 
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:4], mcu3_drif_dram_bank_c[2:1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[2], 
                                             5'b00000};
		     case(num_dimms)
                     001: begin 
                            mcu3_physical_addr_a[34] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[34] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[34] = mcu3_drif_dram_rank_c;
			  end
                     010: begin 
                            mcu3_physical_addr_a[35] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[35] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[35] = mcu3_drif_dram_rank_c;
			  end
                     100: begin 
                            mcu3_physical_addr_a[36] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[36] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[36] = mcu3_drif_dram_rank_c;
			  end
                     000: begin 
                            mcu3_physical_addr_a[37] = mcu3_drif_dram_rank_a;
                            mcu3_physical_addr_b[37] = mcu3_drif_dram_rank_b;
                            mcu3_physical_addr_c[37] = mcu3_drif_dram_rank_c;
			  end
                     endcase
                   end

  //---------------------------
  // DUAL CHANNEL, RANK LOW 
  //---------------------------

  8'b1_0_0_00_001,
  8'b1_0_0_00_010,
  8'b1_0_0_00_100,
  8'b1_0_0_00_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_ras_addr_a[12:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:2], mcu3_drif_dram_bank_a[1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_ras_addr_b[12:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:2], mcu3_drif_dram_bank_b[1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_ras_addr_c[12:0],  
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:2], mcu3_drif_dram_bank_c[1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                          end
                     010: begin
                            mcu3_physical_addr_a[32] = mcu3_drif_dram_addr_a[2];  
                            mcu3_physical_addr_a[10] = mcu3_drif_dram_dimm_a[0];  
                            mcu3_physical_addr_b[32] = mcu3_drif_dram_addr_b[2];  
                            mcu3_physical_addr_b[10] = mcu3_drif_dram_dimm_b[0];  
                            mcu3_physical_addr_c[32] = mcu3_drif_dram_addr_c[2];  
                            mcu3_physical_addr_c[10] = mcu3_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu3_physical_addr_a[33:32] = mcu3_drif_dram_addr_a[3:2];  
                            mcu3_physical_addr_a[11:10] = mcu3_drif_dram_dimm_a[1:0];  
                            mcu3_physical_addr_b[33:32] = mcu3_drif_dram_addr_b[3:2];  
                            mcu3_physical_addr_b[11:10] = mcu3_drif_dram_dimm_b[1:0];  
                            mcu3_physical_addr_c[33:32] = mcu3_drif_dram_addr_c[3:2];  
                            mcu3_physical_addr_c[11:10] = mcu3_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu3_physical_addr_a[34:32] = mcu3_drif_dram_addr_a[4:2];  
                            mcu3_physical_addr_a[12:10] = mcu3_drif_dram_dimm_a[2:0];  
                            mcu3_physical_addr_b[34:32] = mcu3_drif_dram_addr_b[4:2];  
                            mcu3_physical_addr_b[12:10] = mcu3_drif_dram_dimm_b[2:0];  
                            mcu3_physical_addr_c[34:32] = mcu3_drif_dram_addr_c[4:2];  
                            mcu3_physical_addr_c[12:10] = mcu3_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b1_0_1_00_001,
  8'b1_0_1_00_010,
  8'b1_0_1_00_100,
  8'b1_0_1_00_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_ras_addr_a[12:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:2], mcu3_drif_dram_bank_a[1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_ras_addr_b[12:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:2], mcu3_drif_dram_bank_b[1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_ras_addr_c[12:0],  
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:2], mcu3_drif_dram_bank_c[1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu3_physical_addr_a[32] = mcu3_drif_dram_addr_a[2];  
                            mcu3_physical_addr_a[10] = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[32] = mcu3_drif_dram_addr_b[2];  
                            mcu3_physical_addr_b[10] = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[32] = mcu3_drif_dram_addr_c[2];  
                            mcu3_physical_addr_c[10] = mcu3_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu3_physical_addr_a[33:32] = mcu3_drif_dram_addr_a[3:2];  
                            mcu3_physical_addr_a[10]    = mcu3_drif_dram_dimm_a[0];  
                            mcu3_physical_addr_a[11]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[33:32] = mcu3_drif_dram_addr_b[3:2];  
                            mcu3_physical_addr_b[10]    = mcu3_drif_dram_dimm_b[0];  
                            mcu3_physical_addr_b[11]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[33:32] = mcu3_drif_dram_addr_c[3:2];  
                            mcu3_physical_addr_c[10]    = mcu3_drif_dram_dimm_c[0];  
                            mcu3_physical_addr_c[11]    = mcu3_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu3_physical_addr_a[34:32] = mcu3_drif_dram_addr_a[4:2];  
                            mcu3_physical_addr_a[11:10] = mcu3_drif_dram_dimm_a[1:0];  
                            mcu3_physical_addr_a[12]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[34:32] = mcu3_drif_dram_addr_b[4:2];  
                            mcu3_physical_addr_b[11:10] = mcu3_drif_dram_dimm_b[1:0];  
                            mcu3_physical_addr_b[12]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[34:32] = mcu3_drif_dram_addr_c[4:2];  
                            mcu3_physical_addr_c[11:10] = mcu3_drif_dram_dimm_c[1:0];  
                            mcu3_physical_addr_c[12]    = mcu3_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu3_physical_addr_a[35:32] = mcu3_drif_dram_addr_a[5:2];  
                            mcu3_physical_addr_a[12:10] = mcu3_drif_dram_dimm_a[2:0];  
                            mcu3_physical_addr_a[13]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[35:32] = mcu3_drif_dram_addr_b[5:2];  
                            mcu3_physical_addr_b[12:10] = mcu3_drif_dram_dimm_b[2:0];  
                            mcu3_physical_addr_b[13]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[35:32] = mcu3_drif_dram_addr_c[5:2];  
                            mcu3_physical_addr_c[12:10] = mcu3_drif_dram_dimm_c[2:0];  
                            mcu3_physical_addr_c[13]    = mcu3_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b1_0_0_01_001,
  8'b1_0_0_01_010,
  8'b1_0_0_01_100,
  8'b1_0_0_01_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_ras_addr_a[13:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:2], mcu3_drif_dram_bank_a[1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_ras_addr_b[13:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:2], mcu3_drif_dram_bank_b[1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_ras_addr_c[13:0],  
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:2], mcu3_drif_dram_bank_c[1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                          end
                     010: begin
                            mcu3_physical_addr_a[33] = mcu3_drif_dram_addr_a[2];  
                            mcu3_physical_addr_a[10] = mcu3_drif_dram_dimm_a[0];  
                            mcu3_physical_addr_b[33] = mcu3_drif_dram_addr_b[2];  
                            mcu3_physical_addr_b[10] = mcu3_drif_dram_dimm_b[0];  
                            mcu3_physical_addr_c[33] = mcu3_drif_dram_addr_c[2];  
                            mcu3_physical_addr_c[10] = mcu3_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu3_physical_addr_a[34:33] = mcu3_drif_dram_addr_a[3:2];  
                            mcu3_physical_addr_a[11:10] = mcu3_drif_dram_dimm_a[1:0];  
                            mcu3_physical_addr_b[34:33] = mcu3_drif_dram_addr_b[3:2];  
                            mcu3_physical_addr_b[11:10] = mcu3_drif_dram_dimm_b[1:0];  
                            mcu3_physical_addr_c[34:33] = mcu3_drif_dram_addr_c[3:2];  
                            mcu3_physical_addr_c[11:10] = mcu3_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu3_physical_addr_a[35:33] = mcu3_drif_dram_addr_a[4:2];  
                            mcu3_physical_addr_a[12:10] = mcu3_drif_dram_dimm_a[2:0];  
                            mcu3_physical_addr_b[35:33] = mcu3_drif_dram_addr_b[4:2];  
                            mcu3_physical_addr_b[12:10] = mcu3_drif_dram_dimm_b[2:0];  
                            mcu3_physical_addr_c[35:33] = mcu3_drif_dram_addr_c[4:2];  
                            mcu3_physical_addr_c[12:10] = mcu3_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b1_0_1_01_001,
  8'b1_0_1_01_010,
  8'b1_0_1_01_100,
  8'b1_0_1_01_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_ras_addr_a[13:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:2], mcu3_drif_dram_bank_a[1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_ras_addr_b[13:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:2], mcu3_drif_dram_bank_b[1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_ras_addr_c[13:0],  
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:2], mcu3_drif_dram_bank_c[1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu3_physical_addr_a[33] = mcu3_drif_dram_addr_a[2];  
                            mcu3_physical_addr_a[10] = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[33] = mcu3_drif_dram_addr_b[2];  
                            mcu3_physical_addr_b[10] = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[33] = mcu3_drif_dram_addr_c[2];  
                            mcu3_physical_addr_c[10] = mcu3_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu3_physical_addr_a[34:33] = mcu3_drif_dram_addr_a[3:2];  
                            mcu3_physical_addr_a[10]    = mcu3_drif_dram_dimm_a[0];  
                            mcu3_physical_addr_a[11]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[34:33] = mcu3_drif_dram_addr_b[3:2];  
                            mcu3_physical_addr_b[10]    = mcu3_drif_dram_dimm_b[0];  
                            mcu3_physical_addr_b[11]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[34:33] = mcu3_drif_dram_addr_c[3:2];  
                            mcu3_physical_addr_c[10]    = mcu3_drif_dram_dimm_c[0];  
                            mcu3_physical_addr_c[11]    = mcu3_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu3_physical_addr_a[35:33] = mcu3_drif_dram_addr_a[4:2];  
                            mcu3_physical_addr_a[11:10] = mcu3_drif_dram_dimm_a[1:0];  
                            mcu3_physical_addr_a[12]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[35:33] = mcu3_drif_dram_addr_b[4:2];  
                            mcu3_physical_addr_b[11:10] = mcu3_drif_dram_dimm_b[1:0];  
                            mcu3_physical_addr_b[12]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[35:33] = mcu3_drif_dram_addr_c[4:2];  
                            mcu3_physical_addr_c[11:10] = mcu3_drif_dram_dimm_c[1:0];  
                            mcu3_physical_addr_c[12]    = mcu3_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu3_physical_addr_a[36:33] = mcu3_drif_dram_addr_a[5:2];  
                            mcu3_physical_addr_a[12:10] = mcu3_drif_dram_dimm_a[2:0];  
                            mcu3_physical_addr_a[13]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[36:33] = mcu3_drif_dram_addr_b[5:2];  
                            mcu3_physical_addr_b[12:10] = mcu3_drif_dram_dimm_b[2:0];  
                            mcu3_physical_addr_b[13]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[36:33] = mcu3_drif_dram_addr_c[5:2];  
                            mcu3_physical_addr_c[12:10] = mcu3_drif_dram_dimm_c[2:0];  
                            mcu3_physical_addr_c[13]    = mcu3_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b1_0_0_10_001,
  8'b1_0_0_10_010,
  8'b1_0_0_10_100,
  8'b1_0_0_10_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_ras_addr_a[13:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:3], mcu3_drif_dram_bank_a[2:1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_ras_addr_b[13:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:3], mcu3_drif_dram_bank_b[2:1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_ras_addr_c[13:0],  
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:3], mcu3_drif_dram_bank_c[2:1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu3_physical_addr_a[33] = mcu3_drif_dram_addr_a[2];  
                            mcu3_physical_addr_b[33] = mcu3_drif_dram_addr_b[2];  
                            mcu3_physical_addr_c[33] = mcu3_drif_dram_addr_c[2];  
                          end
                     010: begin
                            mcu3_physical_addr_a[34:33] = mcu3_drif_dram_addr_a[3:2];  
                            mcu3_physical_addr_a[11]    = mcu3_drif_dram_dimm_a[0];  
                            mcu3_physical_addr_b[34:33] = mcu3_drif_dram_addr_b[3:2];  
                            mcu3_physical_addr_b[11]    = mcu3_drif_dram_dimm_b[0];  
                            mcu3_physical_addr_c[34:33] = mcu3_drif_dram_addr_c[3:2];  
                            mcu3_physical_addr_c[11]    = mcu3_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu3_physical_addr_a[35:33] = mcu3_drif_dram_addr_a[4:2];  
                            mcu3_physical_addr_a[12:11] = mcu3_drif_dram_dimm_a[1:0];  
                            mcu3_physical_addr_b[35:33] = mcu3_drif_dram_addr_b[4:2];  
                            mcu3_physical_addr_b[12:11] = mcu3_drif_dram_dimm_b[1:0];  
                            mcu3_physical_addr_c[35:33] = mcu3_drif_dram_addr_c[4:2];  
                            mcu3_physical_addr_c[12:11] = mcu3_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu3_physical_addr_a[36:33] = mcu3_drif_dram_addr_a[5:2];  
                            mcu3_physical_addr_a[13:11] = mcu3_drif_dram_dimm_a[2:0];  
                            mcu3_physical_addr_b[36:33] = mcu3_drif_dram_addr_b[5:2];  
                            mcu3_physical_addr_b[13:11] = mcu3_drif_dram_dimm_b[2:0];  
                            mcu3_physical_addr_c[36:33] = mcu3_drif_dram_addr_c[5:2];  
                            mcu3_physical_addr_c[13:11] = mcu3_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b1_0_1_10_001,
  8'b1_0_1_10_010,
  8'b1_0_1_10_100,
  8'b1_0_1_10_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_ras_addr_a[13:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:2], mcu3_drif_dram_bank_a[1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_ras_addr_b[13:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:2], mcu3_drif_dram_bank_b[1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_ras_addr_c[13:0],  
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:2], mcu3_drif_dram_bank_c[1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu3_physical_addr_a[34:33] = mcu3_drif_dram_addr_a[3:2];  
                            mcu3_physical_addr_a[11]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[34:33] = mcu3_drif_dram_addr_b[3:2];  
                            mcu3_physical_addr_b[11]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[34:33] = mcu3_drif_dram_addr_c[3:2];  
                            mcu3_physical_addr_c[11]    = mcu3_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu3_physical_addr_a[35:33] = mcu3_drif_dram_addr_a[4:2];  
                            mcu3_physical_addr_a[11]    = mcu3_drif_dram_dimm_a[0];  
                            mcu3_physical_addr_a[12]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[35:33] = mcu3_drif_dram_addr_b[4:2];  
                            mcu3_physical_addr_b[11]    = mcu3_drif_dram_dimm_b[0];  
                            mcu3_physical_addr_b[12]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[35:33] = mcu3_drif_dram_addr_c[4:2];  
                            mcu3_physical_addr_c[11]    = mcu3_drif_dram_dimm_c[0];  
                            mcu3_physical_addr_c[12]    = mcu3_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu3_physical_addr_a[36:33] = mcu3_drif_dram_addr_a[5:2];  
                            mcu3_physical_addr_a[12:11] = mcu3_drif_dram_dimm_a[1:0];  
                            mcu3_physical_addr_a[13]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[36:33] = mcu3_drif_dram_addr_b[5:2];  
                            mcu3_physical_addr_b[13:11] = mcu3_drif_dram_dimm_b[1:0];  
                            mcu3_physical_addr_b[12]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[36:33] = mcu3_drif_dram_addr_c[5:2];  
                            mcu3_physical_addr_c[12:11] = mcu3_drif_dram_dimm_c[1:0];  
                            mcu3_physical_addr_c[13]    = mcu3_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu3_physical_addr_a[37:33] = mcu3_drif_dram_addr_a[5:2];  
                            mcu3_physical_addr_a[13:11] = mcu3_drif_dram_dimm_a[2:0];  
                            mcu3_physical_addr_a[14]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[37:33] = mcu3_drif_dram_addr_b[5:2];  
                            mcu3_physical_addr_b[13:11] = mcu3_drif_dram_dimm_b[2:0];  
                            mcu3_physical_addr_b[14]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[37:33] = mcu3_drif_dram_addr_c[5:2];  
                            mcu3_physical_addr_c[13:11] = mcu3_drif_dram_dimm_c[2:0];  
                            mcu3_physical_addr_c[14]    = mcu3_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b1_0_0_11_001,
  8'b1_0_0_11_010,
  8'b1_0_0_11_100,
  8'b1_0_0_11_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_ras_addr_a[14:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:3], mcu3_drif_dram_bank_a[2:1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_ras_addr_b[14:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:3], mcu3_drif_dram_bank_b[2:1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_ras_addr_c[14:0],  
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:3], mcu3_drif_dram_bank_c[2:1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu3_physical_addr_a[34] = mcu3_drif_dram_addr_a[2];  
                            mcu3_physical_addr_b[34] = mcu3_drif_dram_addr_b[2];  
                            mcu3_physical_addr_c[34] = mcu3_drif_dram_addr_c[2];  
                          end
                     010: begin
                            mcu3_physical_addr_a[35:34] = mcu3_drif_dram_addr_a[3:2];  
                            mcu3_physical_addr_a[11]    = mcu3_drif_dram_dimm_a[0];  
                            mcu3_physical_addr_b[35:34] = mcu3_drif_dram_addr_b[3:2];  
                            mcu3_physical_addr_b[11]    = mcu3_drif_dram_dimm_b[0];  
                            mcu3_physical_addr_c[35:34] = mcu3_drif_dram_addr_c[3:2];  
                            mcu3_physical_addr_c[11]    = mcu3_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu3_physical_addr_a[36:34] = mcu3_drif_dram_addr_a[4:2];  
                            mcu3_physical_addr_a[12:11] = mcu3_drif_dram_dimm_a[1:0];  
                            mcu3_physical_addr_b[36:34] = mcu3_drif_dram_addr_b[4:2];  
                            mcu3_physical_addr_b[12:11] = mcu3_drif_dram_dimm_b[1:0];  
                            mcu3_physical_addr_c[36:34] = mcu3_drif_dram_addr_c[4:2];  
                            mcu3_physical_addr_c[12:11] = mcu3_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu3_physical_addr_a[37:34] = mcu3_drif_dram_addr_a[5:2];  
                            mcu3_physical_addr_a[13:11] = mcu3_drif_dram_dimm_a[2:0];  
                            mcu3_physical_addr_b[37:34] = mcu3_drif_dram_addr_b[5:2];  
                            mcu3_physical_addr_b[13:11] = mcu3_drif_dram_dimm_b[2:0];  
                            mcu3_physical_addr_c[37:34] = mcu3_drif_dram_addr_c[5:2];  
                            mcu3_physical_addr_c[13:11] = mcu3_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b1_0_1_11_001,
  8'b1_0_1_11_010,
  8'b1_0_1_11_100,
  8'b1_0_1_11_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_ras_addr_a[14:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:2], mcu3_drif_dram_bank_a[1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[1], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_ras_addr_b[14:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:2], mcu3_drif_dram_bank_b[1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[1], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_ras_addr_c[14:0],  
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:2], mcu3_drif_dram_bank_c[1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[1], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu3_physical_addr_a[35:34] = mcu3_drif_dram_addr_a[3:2];  
                            mcu3_physical_addr_a[11]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[35:34] = mcu3_drif_dram_addr_b[3:2];  
                            mcu3_physical_addr_b[11]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[35:34] = mcu3_drif_dram_addr_c[3:2];  
                            mcu3_physical_addr_c[11]    = mcu3_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu3_physical_addr_a[36:34] = mcu3_drif_dram_addr_a[4:2];  
                            mcu3_physical_addr_a[11]    = mcu3_drif_dram_dimm_a[0];  
                            mcu3_physical_addr_a[12]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[36:34] = mcu3_drif_dram_addr_b[4:2];  
                            mcu3_physical_addr_b[11]    = mcu3_drif_dram_dimm_b[0];  
                            mcu3_physical_addr_b[12]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[36:34] = mcu3_drif_dram_addr_c[4:2];  
                            mcu3_physical_addr_c[11]    = mcu3_drif_dram_dimm_c[0];  
                            mcu3_physical_addr_c[12]    = mcu3_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu3_physical_addr_a[37:34] = mcu3_drif_dram_addr_a[5:2];  
                            mcu3_physical_addr_a[12:11] = mcu3_drif_dram_dimm_a[1:0];  
                            mcu3_physical_addr_a[13]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[37:34] = mcu3_drif_dram_addr_b[5:2];  
                            mcu3_physical_addr_b[13:11] = mcu3_drif_dram_dimm_b[1:0];  
                            mcu3_physical_addr_b[12]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[37:34] = mcu3_drif_dram_addr_c[5:2];  
                            mcu3_physical_addr_c[12:11] = mcu3_drif_dram_dimm_c[1:0];  
                            mcu3_physical_addr_c[13]    = mcu3_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu3_physical_addr_a[38:34] = mcu3_drif_dram_addr_a[5:2];  
                            mcu3_physical_addr_a[13:11] = mcu3_drif_dram_dimm_a[2:0];  
                            mcu3_physical_addr_a[14]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[38:34] = mcu3_drif_dram_addr_b[5:2];  
                            mcu3_physical_addr_b[13:11] = mcu3_drif_dram_dimm_b[2:0];  
                            mcu3_physical_addr_b[14]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[38:34] = mcu3_drif_dram_addr_c[5:2];  
                            mcu3_physical_addr_c[13:11] = mcu3_drif_dram_dimm_c[2:0];  
                            mcu3_physical_addr_c[14]    = mcu3_drif_dram_rank_c;  
			  end
                     endcase
                   end

  //---------------------------
  // SINGLE CHANNEL, RANK LOW 
  //---------------------------

  8'b0_0_0_00_001,
  8'b0_0_0_00_010,
  8'b0_0_0_00_100,
  8'b0_0_0_00_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_ras_addr_a[12:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:3], mcu3_drif_dram_bank_a[1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_ras_addr_b[12:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:3], mcu3_drif_dram_bank_b[1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_ras_addr_c[12:0],  
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:3], mcu3_drif_dram_bank_c[1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                          end
                     010: begin
                            mcu3_physical_addr_a[31] = mcu3_drif_dram_addr_a[3];  
                            mcu3_physical_addr_a[10] = mcu3_drif_dram_dimm_a[0];  
                            mcu3_physical_addr_b[31] = mcu3_drif_dram_addr_b[3];  
                            mcu3_physical_addr_b[10] = mcu3_drif_dram_dimm_b[0];  
                            mcu3_physical_addr_c[31] = mcu3_drif_dram_addr_c[3];  
                            mcu3_physical_addr_c[10] = mcu3_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu3_physical_addr_a[32:31] = mcu3_drif_dram_addr_a[4:3];  
                            mcu3_physical_addr_a[11:10] = mcu3_drif_dram_dimm_a[1:0];  
                            mcu3_physical_addr_b[32:31] = mcu3_drif_dram_addr_b[4:3];  
                            mcu3_physical_addr_b[11:10] = mcu3_drif_dram_dimm_b[1:0];  
                            mcu3_physical_addr_c[32:31] = mcu3_drif_dram_addr_c[4:3];  
                            mcu3_physical_addr_c[11:10] = mcu3_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu3_physical_addr_a[33:31] = mcu3_drif_dram_addr_a[5:3];  
                            mcu3_physical_addr_a[12:10] = mcu3_drif_dram_dimm_a[2:0];  
                            mcu3_physical_addr_b[33:31] = mcu3_drif_dram_addr_b[5:3];  
                            mcu3_physical_addr_b[12:10] = mcu3_drif_dram_dimm_b[2:0];  
                            mcu3_physical_addr_c[33:31] = mcu3_drif_dram_addr_c[5:3];  
                            mcu3_physical_addr_c[12:10] = mcu3_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b0_0_1_00_001,
  8'b0_0_1_00_010,
  8'b0_0_1_00_100,
  8'b0_0_1_00_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_ras_addr_a[12:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:3], mcu3_drif_dram_bank_a[1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_ras_addr_b[12:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:3], mcu3_drif_dram_bank_b[1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_ras_addr_c[12:0],  
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:3], mcu3_drif_dram_bank_c[1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu3_physical_addr_a[31] = mcu3_drif_dram_addr_a[3];  
                            mcu3_physical_addr_a[10] = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[31] = mcu3_drif_dram_addr_b[3];  
                            mcu3_physical_addr_b[10] = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[31] = mcu3_drif_dram_addr_c[3];  
                            mcu3_physical_addr_c[10] = mcu3_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu3_physical_addr_a[32:31] = mcu3_drif_dram_addr_a[4:3];  
                            mcu3_physical_addr_a[10]    = mcu3_drif_dram_dimm_a[0];  
                            mcu3_physical_addr_a[11]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[32:31] = mcu3_drif_dram_addr_b[4:3];  
                            mcu3_physical_addr_b[10]    = mcu3_drif_dram_dimm_b[0];  
                            mcu3_physical_addr_b[11]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[32:31] = mcu3_drif_dram_addr_c[4:3];  
                            mcu3_physical_addr_c[10]    = mcu3_drif_dram_dimm_c[0];  
                            mcu3_physical_addr_c[11]    = mcu3_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu3_physical_addr_a[33:31] = mcu3_drif_dram_addr_a[5:3];  
                            mcu3_physical_addr_a[11:10] = mcu3_drif_dram_dimm_a[1:0];  
                            mcu3_physical_addr_a[12]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[33:31] = mcu3_drif_dram_addr_b[5:3];  
                            mcu3_physical_addr_b[11:10] = mcu3_drif_dram_dimm_b[1:0];  
                            mcu3_physical_addr_b[12]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[33:31] = mcu3_drif_dram_addr_c[5:3];  
                            mcu3_physical_addr_c[11:10] = mcu3_drif_dram_dimm_c[1:0];  
                            mcu3_physical_addr_c[12]    = mcu3_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu3_physical_addr_a[34:31] = mcu3_drif_dram_addr_a[6:3];  
                            mcu3_physical_addr_a[12:10] = mcu3_drif_dram_dimm_a[2:0];  
                            mcu3_physical_addr_a[13]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[34:31] = mcu3_drif_dram_addr_b[6:3];  
                            mcu3_physical_addr_b[12:10] = mcu3_drif_dram_dimm_b[2:0];  
                            mcu3_physical_addr_b[13]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[34:31] = mcu3_drif_dram_addr_c[6:3];  
                            mcu3_physical_addr_c[12:10] = mcu3_drif_dram_dimm_c[2:0];  
                            mcu3_physical_addr_c[13]    = mcu3_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b0_0_0_01_001,
  8'b0_0_0_01_010,
  8'b0_0_0_01_100,
  8'b0_0_0_01_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_ras_addr_a[13:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:3], mcu3_drif_dram_bank_a[1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_ras_addr_b[13:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:3], mcu3_drif_dram_bank_b[1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_ras_addr_c[13:0],  
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:3], mcu3_drif_dram_bank_c[1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                          end
                     010: begin
                            mcu3_physical_addr_a[32] = mcu3_drif_dram_addr_a[3];  
                            mcu3_physical_addr_a[10] = mcu3_drif_dram_dimm_a[0];  
                            mcu3_physical_addr_b[32] = mcu3_drif_dram_addr_b[3];  
                            mcu3_physical_addr_b[10] = mcu3_drif_dram_dimm_b[0];  
                            mcu3_physical_addr_c[32] = mcu3_drif_dram_addr_c[3];  
                            mcu3_physical_addr_c[10] = mcu3_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu3_physical_addr_a[33:32] = mcu3_drif_dram_addr_a[4:3];  
                            mcu3_physical_addr_a[11:10] = mcu3_drif_dram_dimm_a[1:0];  
                            mcu3_physical_addr_b[33:32] = mcu3_drif_dram_addr_b[4:3];  
                            mcu3_physical_addr_b[11:10] = mcu3_drif_dram_dimm_b[1:0];  
                            mcu3_physical_addr_c[33:32] = mcu3_drif_dram_addr_c[4:3];  
                            mcu3_physical_addr_c[11:10] = mcu3_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu3_physical_addr_a[34:32] = mcu3_drif_dram_addr_a[5:3];  
                            mcu3_physical_addr_a[12:10] = mcu3_drif_dram_dimm_a[2:0];  
                            mcu3_physical_addr_b[34:32] = mcu3_drif_dram_addr_b[5:3];  
                            mcu3_physical_addr_b[12:10] = mcu3_drif_dram_dimm_b[2:0];  
                            mcu3_physical_addr_c[34:32] = mcu3_drif_dram_addr_c[5:3];  
                            mcu3_physical_addr_c[12:10] = mcu3_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b0_0_1_01_001,
  8'b0_0_1_01_010,
  8'b0_0_1_01_100,
  8'b0_0_1_01_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_ras_addr_a[13:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:3], mcu3_drif_dram_bank_a[1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_ras_addr_b[13:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:3], mcu3_drif_dram_bank_b[1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_ras_addr_c[13:0],  
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:3], mcu3_drif_dram_bank_c[1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu3_physical_addr_a[32] = mcu3_drif_dram_addr_a[3];  
                            mcu3_physical_addr_a[10] = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[32] = mcu3_drif_dram_addr_b[3];  
                            mcu3_physical_addr_b[10] = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[32] = mcu3_drif_dram_addr_c[3];  
                            mcu3_physical_addr_c[10] = mcu3_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu3_physical_addr_a[33:32] = mcu3_drif_dram_addr_a[4:3];  
                            mcu3_physical_addr_a[10]    = mcu3_drif_dram_dimm_a[0];  
                            mcu3_physical_addr_a[11]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[33:32] = mcu3_drif_dram_addr_b[4:3];  
                            mcu3_physical_addr_b[10]    = mcu3_drif_dram_dimm_b[0];  
                            mcu3_physical_addr_b[11]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[33:32] = mcu3_drif_dram_addr_c[4:3];  
                            mcu3_physical_addr_c[10]    = mcu3_drif_dram_dimm_c[0];  
                            mcu3_physical_addr_c[11]    = mcu3_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu3_physical_addr_a[34:32] = mcu3_drif_dram_addr_a[5:3];  
                            mcu3_physical_addr_a[11:10] = mcu3_drif_dram_dimm_a[1:0];  
                            mcu3_physical_addr_a[12]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[34:32] = mcu3_drif_dram_addr_b[5:3];  
                            mcu3_physical_addr_b[11:10] = mcu3_drif_dram_dimm_b[1:0];  
                            mcu3_physical_addr_b[12]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[34:32] = mcu3_drif_dram_addr_c[5:3];  
                            mcu3_physical_addr_c[11:10] = mcu3_drif_dram_dimm_c[1:0];  
                            mcu3_physical_addr_c[12]    = mcu3_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu3_physical_addr_a[35:32] = mcu3_drif_dram_addr_a[6:3];  
                            mcu3_physical_addr_a[12:10] = mcu3_drif_dram_dimm_a[2:0];  
                            mcu3_physical_addr_a[13]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[35:32] = mcu3_drif_dram_addr_b[6:3];  
                            mcu3_physical_addr_b[12:10] = mcu3_drif_dram_dimm_b[2:0];  
                            mcu3_physical_addr_b[13]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[35:32] = mcu3_drif_dram_addr_c[6:3];  
                            mcu3_physical_addr_c[12:10] = mcu3_drif_dram_dimm_c[2:0];  
                            mcu3_physical_addr_c[13]    = mcu3_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b0_0_0_10_001,
  8'b0_0_0_10_010,
  8'b0_0_0_10_100,
  8'b0_0_0_10_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_ras_addr_a[13:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:4], mcu3_drif_dram_bank_a[2:1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_ras_addr_b[13:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:4], mcu3_drif_dram_bank_b[2:1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_ras_addr_c[13:0],  
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:4], mcu3_drif_dram_bank_c[2:1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu3_physical_addr_a[32] = mcu3_drif_dram_addr_a[3];  
                            mcu3_physical_addr_b[32] = mcu3_drif_dram_addr_b[3];  
                            mcu3_physical_addr_c[32] = mcu3_drif_dram_addr_c[3];  
                          end
                     010: begin
                            mcu3_physical_addr_a[33:32] = mcu3_drif_dram_addr_a[4:3];  
                            mcu3_physical_addr_a[11]    = mcu3_drif_dram_dimm_a[0];  
                            mcu3_physical_addr_b[33:32] = mcu3_drif_dram_addr_b[4:3];  
                            mcu3_physical_addr_b[11]    = mcu3_drif_dram_dimm_b[0];  
                            mcu3_physical_addr_c[33:32] = mcu3_drif_dram_addr_c[4:3];  
                            mcu3_physical_addr_c[11]    = mcu3_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu3_physical_addr_a[34:32] = mcu3_drif_dram_addr_a[5:3];  
                            mcu3_physical_addr_a[12:11] = mcu3_drif_dram_dimm_a[1:0];  
                            mcu3_physical_addr_b[34:32] = mcu3_drif_dram_addr_b[5:3];  
                            mcu3_physical_addr_b[12:11] = mcu3_drif_dram_dimm_b[1:0];  
                            mcu3_physical_addr_c[34:32] = mcu3_drif_dram_addr_c[5:3];  
                            mcu3_physical_addr_c[12:11] = mcu3_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu3_physical_addr_a[35:32] = mcu3_drif_dram_addr_a[6:3];  
                            mcu3_physical_addr_a[13:11] = mcu3_drif_dram_dimm_a[2:0];  
                            mcu3_physical_addr_b[35:32] = mcu3_drif_dram_addr_b[6:3];  
                            mcu3_physical_addr_b[13:11] = mcu3_drif_dram_dimm_b[2:0];  
                            mcu3_physical_addr_c[35:32] = mcu3_drif_dram_addr_c[6:3];  
                            mcu3_physical_addr_c[13:11] = mcu3_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b0_0_1_10_001,
  8'b0_0_1_10_010,
  8'b0_0_1_10_100,
  8'b0_0_1_10_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_ras_addr_a[13:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:4], mcu3_drif_dram_bank_a[2:1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_ras_addr_b[13:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:4], mcu3_drif_dram_bank_b[2:1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_ras_addr_c[13:0],  
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:4], mcu3_drif_dram_bank_c[2:1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu3_physical_addr_a[33:32] = mcu3_drif_dram_addr_a[4:3];  
                            mcu3_physical_addr_a[11]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[33:32] = mcu3_drif_dram_addr_b[4:3];  
                            mcu3_physical_addr_b[11]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[33:32] = mcu3_drif_dram_addr_c[4:3];  
                            mcu3_physical_addr_c[11]    = mcu3_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu3_physical_addr_a[34:32] = mcu3_drif_dram_addr_a[5:3];  
                            mcu3_physical_addr_a[11]    = mcu3_drif_dram_dimm_a[0];  
                            mcu3_physical_addr_a[12]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[34:32] = mcu3_drif_dram_addr_b[5:3];  
                            mcu3_physical_addr_b[11]    = mcu3_drif_dram_dimm_b[0];  
                            mcu3_physical_addr_b[12]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[34:32] = mcu3_drif_dram_addr_c[5:3];  
                            mcu3_physical_addr_c[11]    = mcu3_drif_dram_dimm_c[0];  
                            mcu3_physical_addr_c[12]    = mcu3_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu3_physical_addr_a[35:32] = mcu3_drif_dram_addr_a[6:3];  
                            mcu3_physical_addr_a[12:11] = mcu3_drif_dram_dimm_a[1:0];  
                            mcu3_physical_addr_a[13]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[35:32] = mcu3_drif_dram_addr_b[6:3];  
                            mcu3_physical_addr_b[12:11] = mcu3_drif_dram_dimm_b[1:0];  
                            mcu3_physical_addr_b[13]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[35:32] = mcu3_drif_dram_addr_c[6:3];  
                            mcu3_physical_addr_c[12:11] = mcu3_drif_dram_dimm_c[1:0];  
                            mcu3_physical_addr_c[13]    = mcu3_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu3_physical_addr_a[36:32] = mcu3_drif_dram_addr_a[7:3];  
                            mcu3_physical_addr_a[13:11] = mcu3_drif_dram_dimm_a[2:0];  
                            mcu3_physical_addr_a[14]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[36:32] = mcu3_drif_dram_addr_b[7:3];  
                            mcu3_physical_addr_b[13:11] = mcu3_drif_dram_dimm_b[2:0];  
                            mcu3_physical_addr_b[14]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[36:32] = mcu3_drif_dram_addr_c[7:3];  
                            mcu3_physical_addr_c[13:11] = mcu3_drif_dram_dimm_c[2:0];  
                            mcu3_physical_addr_c[14]    = mcu3_drif_dram_rank_c;  
			  end
                     endcase
                   end
  8'b0_0_0_11_001,
  8'b0_0_0_11_010,
  8'b0_0_0_11_100,
  8'b0_0_0_11_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_ras_addr_a[14:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:4], mcu3_drif_dram_bank_a[2:1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_ras_addr_b[14:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:4], mcu3_drif_dram_bank_b[2:1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_ras_addr_c[14:0],  
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:4], mcu3_drif_dram_bank_c[2:1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu3_physical_addr_a[33] = mcu3_drif_dram_addr_a[3];  
                            mcu3_physical_addr_b[33] = mcu3_drif_dram_addr_b[3];  
                            mcu3_physical_addr_c[33] = mcu3_drif_dram_addr_c[3];  
                          end
                     010: begin
                            mcu3_physical_addr_a[34:33] = mcu3_drif_dram_addr_a[4:3];  
                            mcu3_physical_addr_a[11]    = mcu3_drif_dram_dimm_a[0];  
                            mcu3_physical_addr_b[34:33] = mcu3_drif_dram_addr_b[4:3];  
                            mcu3_physical_addr_b[11]    = mcu3_drif_dram_dimm_b[0];  
                            mcu3_physical_addr_c[34:33] = mcu3_drif_dram_addr_c[4:3];  
                            mcu3_physical_addr_c[11]    = mcu3_drif_dram_dimm_c[0];  
                          end
                     100: begin
                            mcu3_physical_addr_a[35:33] = mcu3_drif_dram_addr_a[5:3];  
                            mcu3_physical_addr_a[12:11] = mcu3_drif_dram_dimm_a[1:0];  
                            mcu3_physical_addr_b[35:33] = mcu3_drif_dram_addr_b[5:3];  
                            mcu3_physical_addr_b[12:11] = mcu3_drif_dram_dimm_b[1:0];  
                            mcu3_physical_addr_c[35:33] = mcu3_drif_dram_addr_c[5:3];  
                            mcu3_physical_addr_c[12:11] = mcu3_drif_dram_dimm_c[1:0];  
			  end
		     000: begin
                            mcu3_physical_addr_a[36:33] = mcu3_drif_dram_addr_a[6:3];  
                            mcu3_physical_addr_a[13:11] = mcu3_drif_dram_dimm_a[2:0];  
                            mcu3_physical_addr_b[36:33] = mcu3_drif_dram_addr_b[6:3];  
                            mcu3_physical_addr_b[13:11] = mcu3_drif_dram_dimm_b[2:0];  
                            mcu3_physical_addr_c[36:33] = mcu3_drif_dram_addr_c[6:3];  
                            mcu3_physical_addr_c[13:11] = mcu3_drif_dram_dimm_c[2:0];  
			  end
                     endcase
                   end
  8'b0_0_1_11_001,
  8'b0_0_1_11_010,
  8'b0_0_1_11_100,
  8'b0_0_1_11_000: begin
                     mcu3_physical_addr_a = {mcu3_drif_dram_ras_addr_a[14:0],  
                                             mcu3_drif_dram_addr_a[11],mcu3_drif_dram_addr_a[9:4], mcu3_drif_dram_bank_a[2:1], 
                                             2'b11, mcu3_drif_dram_bank_a[0], mcu3_drif_dram_addr_a[2], 
                                             5'b00000};
                     mcu3_physical_addr_b = {mcu3_drif_dram_ras_addr_b[14:0],  
                                             mcu3_drif_dram_addr_b[11],mcu3_drif_dram_addr_b[9:4], mcu3_drif_dram_bank_b[2:1], 
                                             2'b11, mcu3_drif_dram_bank_b[0], mcu3_drif_dram_addr_b[2], 
                                             5'b00000};
                     mcu3_physical_addr_c = {mcu3_drif_dram_ras_addr_c[14:0],  
                                             mcu3_drif_dram_addr_c[11],mcu3_drif_dram_addr_c[9:4], mcu3_drif_dram_bank_c[2:1], 
                                             2'b11, mcu3_drif_dram_bank_c[0], mcu3_drif_dram_addr_c[2], 
                                             5'b00000};
                     case(num_dimms)
                     001: begin
                            mcu3_physical_addr_a[34:33] = mcu3_drif_dram_addr_a[4:3];  
                            mcu3_physical_addr_a[11]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[34:33] = mcu3_drif_dram_addr_b[4:3];  
                            mcu3_physical_addr_b[11]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[34:33] = mcu3_drif_dram_addr_c[4:3];  
                            mcu3_physical_addr_c[11]    = mcu3_drif_dram_rank_c;  
                          end
                     010: begin
                            mcu3_physical_addr_a[35:33] = mcu3_drif_dram_addr_a[5:3];  
                            mcu3_physical_addr_a[11]    = mcu3_drif_dram_dimm_a[0];  
                            mcu3_physical_addr_a[12]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[35:33] = mcu3_drif_dram_addr_b[5:3];  
                            mcu3_physical_addr_b[11]    = mcu3_drif_dram_dimm_b[0];  
                            mcu3_physical_addr_b[12]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[35:33] = mcu3_drif_dram_addr_c[5:3];  
                            mcu3_physical_addr_c[11]    = mcu3_drif_dram_dimm_c[0];  
                            mcu3_physical_addr_c[12]    = mcu3_drif_dram_rank_c;  
                          end
                     100: begin
                            mcu3_physical_addr_a[36:33] = mcu3_drif_dram_addr_a[6:3];  
                            mcu3_physical_addr_a[12:11] = mcu3_drif_dram_dimm_a[1:0];  
                            mcu3_physical_addr_a[13]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[36:33] = mcu3_drif_dram_addr_b[6:3];  
                            mcu3_physical_addr_b[12:11] = mcu3_drif_dram_dimm_b[1:0];  
                            mcu3_physical_addr_b[13]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[36:33] = mcu3_drif_dram_addr_c[6:3];  
                            mcu3_physical_addr_c[12:11] = mcu3_drif_dram_dimm_c[1:0];  
                            mcu3_physical_addr_c[13]    = mcu3_drif_dram_rank_c;  
			  end
		     000: begin
                            mcu3_physical_addr_a[37:33] = mcu3_drif_dram_addr_a[7:3];  
                            mcu3_physical_addr_a[13:11] = mcu3_drif_dram_dimm_a[2:0];  
                            mcu3_physical_addr_a[14]    = mcu3_drif_dram_rank_a;  
                            mcu3_physical_addr_b[37:33] = mcu3_drif_dram_addr_b[7:3];  
                            mcu3_physical_addr_b[13:11] = mcu3_drif_dram_dimm_b[2:0];  
                            mcu3_physical_addr_b[14]    = mcu3_drif_dram_rank_b;  
                            mcu3_physical_addr_c[37:33] = mcu3_drif_dram_addr_c[7:3];  
                            mcu3_physical_addr_c[13:11] = mcu3_drif_dram_dimm_c[2:0];  
                            mcu3_physical_addr_c[14]    = mcu3_drif_dram_rank_c;  
			  end
                     endcase
                   end
  endcase


  //--------------------------------------------------------------
  // MCU0 Print Read/Write Commands being sent out to FBD Branch 0 
  //--------------------------------------------------------------

  if (mcu0_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_REF) begin
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: (Slot B) Auto Refresh Request issued");  
  end

  if (mcu0_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_SRPDX) begin
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: (Slot B) Power Down Request issued");  
  end

  if (mcu0_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_PDE) begin
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: (Slot B) Power Enter Request issued");  
  end

  if (mcu0_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_SRE) begin
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: (Slot B) Self Refresh Request issued");  
  end

  if (mcu0_drif_dram_cmd_a==`ACT) begin 
    //`PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: ACTIVATE CMD \(Slot A\) sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, ADDR=%x", mcu0_drif_dram_dimm_a, mcu0_drif_dram_bank_a, mcu0_drif_dram_rank_a, mcu0_drif_dram_addr_a);  
    mcu0_drif_dram_ras_addr_a = mcu0_drif_dram_addr_a;
  end

  if (mcu0_drif_dram_cmd_b==`ACT) begin
    //`PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: ACTIVATE CMD\ (Slot B\) sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, ADDR=%x",mcu0_drif_dram_dimm_b, mcu0_drif_dram_bank_b, mcu0_drif_dram_rank_b, mcu0_drif_dram_addr_b);  
    mcu0_drif_dram_ras_addr_b = mcu0_drif_dram_addr_b;
  end

  if (mcu0_drif_dram_cmd_c==`ACT) begin
    //`PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: ACTIVATE CMD\ (Slot C\) sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, ADDR=%x",mcu0_drif_dram_dimm_c, mcu0_drif_dram_bank_c, mcu0_drif_dram_rank_c, mcu0_drif_dram_addr_c);  
    mcu0_drif_dram_ras_addr_c = mcu0_drif_dram_addr_c;
  end

  if (mcu0_drif_dram_cmd_a==`WR) 
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: WRITE CMD\ (Slot A\) PA[39:0]=%x sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, CAS ADDR[10:0]=%x, RAS ADDR[14:0]=%x",mcu0_physical_addr_a, mcu0_drif_dram_dimm_a, mcu0_drif_dram_bank_a, mcu0_drif_dram_rank_a, mcu0_drif_dram_addr_a, mcu0_drif_dram_ras_addr_a);  

  if (mcu0_drif_dram_cmd_b==`WR) 
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: WRITE CMD\ (Slot B\) PA[39:0]=%x sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, CAS ADDR[10:0]=%x, RAS ADDR[14:0]=%x",mcu0_physical_addr_b, mcu0_drif_dram_dimm_b, mcu0_drif_dram_bank_b, mcu0_drif_dram_rank_b, mcu0_drif_dram_addr_b, mcu0_drif_dram_ras_addr_b);  

  if (mcu0_drif_dram_cmd_c==`WR) 
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: WRITE CMD\ (Slot C\) PA[39:0]=%x sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, CAS ADDR[10:0]=%x, RAS ADDR[14:0]=%x",mcu0_physical_addr_c, mcu0_drif_dram_dimm_c, mcu0_drif_dram_bank_c, mcu0_drif_dram_rank_c, mcu0_drif_dram_addr_c, mcu0_drif_dram_ras_addr_c);  

  if (mcu0_drif_dram_cmd_a==`RD) 
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: READ CMD\ (Slot A\) PA[39:0]=%x sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, CAS ADDR[10:0]=%x, RAS ADDR[14:0]=%x",mcu0_physical_addr_a, mcu0_drif_dram_dimm_a, mcu0_drif_dram_bank_a, mcu0_drif_dram_rank_a, mcu0_drif_dram_addr_a, mcu0_drif_dram_ras_addr_a);  

  if (mcu0_fbdic_f_1_l == 1'b0) begin
  case (mcu0_fbdic_f_1_cnt)
    2'b00: mcu0_wdata_dimm[0] = mcu0_fbdic_f[0] ; 
    2'b01: mcu0_wdata_dimm[1] = mcu0_fbdic_f[0] ; 
    2'b10: mcu0_wdata_dimm[2] = mcu0_fbdic_f[0] ; 
    default: ;
  endcase

    if (mcu0_fbdic_f_1_cnt < 3'b11) begin 
      if (chnl_type==1'b1)
        begin 
        `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: (CH0) WDATA[71:0]=%x (CH1) WDATA[71:0]=%x WSn=%b", mcu0_fbdiwr_bc_cmd_data0, mcu0_fbdiwr_bc_cmd_data1, mcu0_fbdic_f[0]);
        end
      else begin
        `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: (CH0) WDATA[71:0]=%x WSn=%b", mcu0_fbdiwr_bc_cmd_data0, mcu0_fbdic_f[0]);
      end
      mcu0_fbdic_f_1_cnt = mcu0_fbdic_f_1_cnt + 1'b1;
    end
    else begin
      if (chnl_type==1'b1)
        begin
        `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: (CH0) WDATA[71:0]=%x (CH1) WDATA[71:0]=%x DIMM[2:0]=%x", mcu0_fbdiwr_bc_cmd_data0, mcu0_fbdiwr_bc_cmd_data1, mcu0_wdata_dimm);
        end
      else begin
        `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: (CH0) WDATA[71:0]=%x DIMM[2:0]=%x", mcu0_fbdiwr_bc_cmd_data0, mcu0_wdata_dimm);
      end
      mcu0_fbdic_f_1_cnt = 2'b0;
    end
  end

  //--------------------------------------------------------------
  // MCU1 Print Read/Write Commands being sent out to FBD Branch 1 
  //--------------------------------------------------------------

  if (mcu1_drif_dram_cmd_b==`CMD_OTHER && mcu1_drif_dram_addr_b == `CMD_OTHER_REF) begin
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: (Slot B) Auto Refresh Request issued");  
  end

  if (mcu1_drif_dram_cmd_b==`CMD_OTHER && mcu1_drif_dram_addr_b == `CMD_OTHER_SRPDX) begin
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: (Slot B) Power Down Request issued");  
  end

  if (mcu1_drif_dram_cmd_b==`CMD_OTHER && mcu1_drif_dram_addr_b == `CMD_OTHER_PDE) begin
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: (Slot B) Power Enter Request issued");  
  end

  if (mcu1_drif_dram_cmd_b==`CMD_OTHER && mcu1_drif_dram_addr_b == `CMD_OTHER_SRE) begin
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: (Slot B) Self Refresh Request issued");  
  end

  if (mcu1_drif_dram_cmd_a==`ACT) begin 
    //`PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: ACTIVATE CMD \(Slot A\) sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, ADDR=%x",mcu1_drif_dram_dimm_a, mcu1_drif_dram_bank_a, mcu1_drif_dram_rank_a, mcu1_drif_dram_addr_a);  
    mcu1_drif_dram_ras_addr_a = mcu1_drif_dram_addr_a;
  end 

  if (mcu1_drif_dram_cmd_b==`ACT) begin 
    //`PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: ACTIVATE CMD\ (Slot B\) sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, ADDR=%x",mcu1_drif_dram_dimm_b, mcu1_drif_dram_bank_b, mcu1_drif_dram_rank_b, mcu1_drif_dram_addr_b);  
    mcu1_drif_dram_ras_addr_b = mcu1_drif_dram_addr_b;
  end 

  if (mcu1_drif_dram_cmd_c==`ACT) begin 
    //`PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: ACTIVATE CMD\ (Slot C\) sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, ADDR=%x",mcu1_drif_dram_dimm_c, mcu1_drif_dram_bank_c, mcu1_drif_dram_rank_c, mcu1_drif_dram_addr_c);  
    mcu1_drif_dram_ras_addr_c = mcu1_drif_dram_addr_c;
  end 


  if (mcu1_drif_dram_cmd_a==`WR) 
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: WRITE CMD\ (Slot A\) PA[39:0]=%x sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, CAS ADDR[10:0]=%x, RAS ADDR[14:0]=%x",mcu1_physical_addr_a, mcu1_drif_dram_dimm_a, mcu1_drif_dram_bank_a, mcu1_drif_dram_rank_a, mcu1_drif_dram_addr_a, mcu1_drif_dram_ras_addr_a);  

  if (mcu1_drif_dram_cmd_b==`WR) 
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: WRITE CMD\ (Slot B\) PA[39:0]=%x sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, CAS ADDR[10:0]=%x, RAS ADDR[14:0]=%x",mcu1_physical_addr_b, mcu1_drif_dram_dimm_b, mcu1_drif_dram_bank_b, mcu1_drif_dram_rank_b, mcu1_drif_dram_addr_b, mcu1_drif_dram_ras_addr_b);  

  if (mcu1_drif_dram_cmd_c==`WR) 
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: WRITE CMD\ (Slot C\) PA[39:0]=%x sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, CAS ADDR[10:0]=%x, RAS ADDR[14:0]=%x",mcu1_physical_addr_c, mcu1_drif_dram_dimm_c, mcu1_drif_dram_bank_c, mcu1_drif_dram_rank_c, mcu1_drif_dram_addr_c, mcu1_drif_dram_ras_addr_c);  

  if (mcu1_drif_dram_cmd_a==`RD) 
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: READ CMD\ (Slot A\) PA[39:0]=%x sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, CAS ADDR[10:0]=%x, RAS ADDR[14:0]=%x",mcu1_physical_addr_a, mcu1_drif_dram_dimm_a, mcu1_drif_dram_bank_a, mcu1_drif_dram_rank_a, mcu1_drif_dram_addr_a, mcu1_drif_dram_ras_addr_a);  

  if (mcu1_fbdic_f_1_l == 1'b0) begin
  case (mcu1_fbdic_f_1_cnt)
    2'b00: mcu1_wdata_dimm[0] = mcu1_fbdic_f[0] ; 
    2'b01: mcu1_wdata_dimm[1] = mcu1_fbdic_f[0] ; 
    2'b10: mcu1_wdata_dimm[2] = mcu1_fbdic_f[0] ; 
    default: ;
  endcase

    if (mcu1_fbdic_f_1_cnt < 3'b11) begin 
      if (chnl_type==1'b1)
        begin
        `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: (CH0) WDATA[71:0]=%x (CH1) WDATA[71:0]=%x WSn=%b", mcu1_fbdiwr_bc_cmd_data0, mcu1_fbdiwr_bc_cmd_data1, mcu1_fbdic_f[0]);
      end
      else
      begin
        `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: (CH0) WDATA[71:0]=%x WSn=%b", mcu1_fbdiwr_bc_cmd_data0, mcu1_fbdic_f[0]);
      end
      mcu1_fbdic_f_1_cnt = mcu1_fbdic_f_1_cnt + 1'b1;
    end
    else begin
      if (chnl_type==1'b1)
      begin
        `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: (CH0) WDATA[71:0]=%x (CH1) WDATA[71:0]=%x DIMM[2:0]=%x", mcu1_fbdiwr_bc_cmd_data0, mcu1_fbdiwr_bc_cmd_data1, mcu1_wdata_dimm);
      end
      else 
      begin
        `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: (CH0) WDATA[71:0]=%x DIMM[2:0]=%x", mcu1_fbdiwr_bc_cmd_data0, mcu1_wdata_dimm);
      end
      mcu1_fbdic_f_1_cnt = 2'b0;
    end
  end

  //--------------------------------------------------------------
  // MCU2 Print Read/Write Commands being sent out to FBD Branch 2 
  //--------------------------------------------------------------

  if (mcu2_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_REF) begin
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: (Slot B) Auto Refresh Request issued");  
  end

  if (mcu2_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_SRPDX) begin
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: (Slot B) Power Down Request issued");  
  end

  if (mcu2_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_PDE) begin
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: (Slot B) Power Enter Request issued");  
  end

  if (mcu2_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_SRE) begin
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: (Slot B) Self Refresh Request issued");  
  end

  if (mcu2_drif_dram_cmd_a==`ACT) begin
    //`PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: ACTIVATE CMD \(Slot A\) sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, ADDR=%x",mcu2_drif_dram_dimm_a, mcu2_drif_dram_bank_a, mcu2_drif_dram_rank_a, mcu2_drif_dram_addr_a);  
    mcu2_drif_dram_ras_addr_a = mcu2_drif_dram_addr_a;
  end 

  if (mcu2_drif_dram_cmd_b==`ACT) begin 
    //`PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: ACTIVATE CMD\ (Slot B\) sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, ADDR=%x",mcu2_drif_dram_dimm_b, mcu2_drif_dram_bank_b, mcu2_drif_dram_rank_b, mcu2_drif_dram_addr_b);  
    mcu2_drif_dram_ras_addr_b = mcu2_drif_dram_addr_b;
  end 

  if (mcu2_drif_dram_cmd_c==`ACT) begin
    //`PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: ACTIVATE CMD\ (Slot C\) sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, ADDR=%x",mcu2_drif_dram_dimm_c, mcu2_drif_dram_bank_c, mcu2_drif_dram_rank_c, mcu2_drif_dram_addr_c);  
    mcu2_drif_dram_ras_addr_c = mcu2_drif_dram_addr_c;
  end 


  if (mcu2_drif_dram_cmd_a==`WR) 
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: WRITE CMD\ (Slot A\) PA[39:0]=%x sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, CAS ADDR[10:0]=%x, RAS ADDR[14:0]=%x",mcu2_physical_addr_a, mcu2_drif_dram_dimm_a, mcu2_drif_dram_bank_a, mcu2_drif_dram_rank_a, mcu2_drif_dram_addr_a, mcu2_drif_dram_ras_addr_a);  

  if (mcu2_drif_dram_cmd_b==`WR) 
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: WRITE CMD\ (Slot B\) PA[39:0]=%x sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, CAS ADDR[10:0]=%x, RAS ADDR[14:0]=%x",mcu2_physical_addr_b, mcu2_drif_dram_dimm_b, mcu2_drif_dram_bank_b, mcu2_drif_dram_rank_b, mcu2_drif_dram_addr_b, mcu2_drif_dram_ras_addr_b);  

  if (mcu2_drif_dram_cmd_c==`WR) 
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: WRITE CMD\ (Slot C\) PA[39:0]=%x sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, CAS ADDR[10:0]=%x, RAS ADDR[14:0]=%x",mcu2_physical_addr_c, mcu2_drif_dram_dimm_c, mcu2_drif_dram_bank_c, mcu2_drif_dram_rank_c, mcu2_drif_dram_addr_c, mcu2_drif_dram_ras_addr_c);  

  if (mcu2_drif_dram_cmd_a==`RD) 
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: READ CMD\ (Slot A\) PA[39:0]=%x sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, CAS ADDR[10:0]=%x, RAS ADDR[14:0]=%x",mcu2_physical_addr_a, mcu2_drif_dram_dimm_a, mcu2_drif_dram_bank_a, mcu2_drif_dram_rank_a, mcu2_drif_dram_addr_a, mcu2_drif_dram_ras_addr_a);  

  if (mcu2_fbdic_f_1_l == 1'b0) begin
  case (mcu2_fbdic_f_1_cnt)
    2'b00: mcu2_wdata_dimm[0] = mcu2_fbdic_f[0] ; 
    2'b01: mcu2_wdata_dimm[1] = mcu2_fbdic_f[0] ; 
    2'b10: mcu2_wdata_dimm[2] = mcu2_fbdic_f[0] ; 
    default: ;
  endcase

    if (mcu2_fbdic_f_1_cnt < 3'b11) begin 
      if(chnl_type==1'b1)
      begin
        `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: (CH0) WDATA[71:0]=%x (CH1) WDATA[71:0]=%x WSn=%b", mcu2_fbdiwr_bc_cmd_data0, mcu2_fbdiwr_bc_cmd_data1, mcu2_fbdic_f[0]);
      end
      else
      begin
        `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: (CH0) WDATA[71:0]=%x WSn=%b", mcu2_fbdiwr_bc_cmd_data0, mcu2_fbdic_f[0]);
      end
      mcu2_fbdic_f_1_cnt = mcu2_fbdic_f_1_cnt + 1'b1;
    end
    else begin
      if (chnl_type==1'b1)
      begin
        `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: (CH0) WDATA[71:0]=%x (CH1) WDATA[71:0]=%x DIMM[2:0]=%x", mcu2_fbdiwr_bc_cmd_data0, mcu2_fbdiwr_bc_cmd_data1, mcu2_wdata_dimm);
      end
      else
      begin
        `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: (CH0) WDATA[71:0]=%x DIMM[2:0]=%x", mcu2_fbdiwr_bc_cmd_data0, mcu2_wdata_dimm);
      end
      mcu2_fbdic_f_1_cnt = 2'b0;
    end
  end

  //--------------------------------------------------------------
  // MCU3 Print Read/Write Commands being sent out to FBD Branch 3 
  //--------------------------------------------------------------

  if (mcu3_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_REF) begin
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: (slot B) Auto Refresh Request issued");  
  end

  if (mcu3_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_SRPDX) begin
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: (slot B) Power Down Request issued");  
  end

  if (mcu3_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_PDE) begin
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: (slot B) Power Enter Request issued");  
  end

  if (mcu3_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_SRE) begin
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: (slot B) Self Refresh Request issued");  
  end

  if (mcu3_drif_dram_cmd_a==`ACT) begin
    //`PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: ACTIVATE CMD \(Slot A\) sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, ADDR=%x",mcu3_drif_dram_dimm_a, mcu3_drif_dram_bank_a, mcu3_drif_dram_rank_a, mcu3_drif_dram_addr_a);  
    mcu3_drif_dram_ras_addr_a = mcu3_drif_dram_addr_a;
  end 

  if (mcu3_drif_dram_cmd_b==`ACT) begin 
    //`PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: ACTIVATE CMD\ (Slot B\) sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, ADDR=%x",mcu3_drif_dram_dimm_b, mcu3_drif_dram_bank_b, mcu3_drif_dram_rank_b, mcu3_drif_dram_addr_b);  
    mcu3_drif_dram_ras_addr_b = mcu3_drif_dram_addr_b;
  end 

  if (mcu3_drif_dram_cmd_c==`ACT) begin 
    //`PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: ACTIVATE CMD\ (Slot C\) sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, ADDR=%x",mcu3_drif_dram_dimm_c, mcu3_drif_dram_bank_c, mcu3_drif_dram_rank_c, mcu3_drif_dram_addr_c);  
    mcu3_drif_dram_ras_addr_c = mcu3_drif_dram_addr_c;
  end 


  if (mcu3_drif_dram_cmd_a==`WR) 
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: WRITE CMD\ (Slot A\) PA[39:0]=%x sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, CAS ADDR[10:0]=%x, RAS ADDR[14:0]=%x",mcu3_physical_addr_a, mcu3_drif_dram_dimm_a, mcu3_drif_dram_bank_a, mcu3_drif_dram_rank_a, mcu3_drif_dram_addr_a, mcu3_drif_dram_ras_addr_a);  

  if (mcu3_drif_dram_cmd_b==`WR) 
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: WRITE CMD\ (Slot B\) PA[39:0]=%x sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, CAS ADDR[10:0]=%x, RAS ADDR[14:0]=%x",mcu3_physical_addr_b, mcu3_drif_dram_dimm_b, mcu3_drif_dram_bank_b, mcu3_drif_dram_rank_b, mcu3_drif_dram_addr_b, mcu3_drif_dram_ras_addr_b);  

  if (mcu3_drif_dram_cmd_c==`WR) 
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: WRITE CMD\ (Slot C\) PA[39:0]=%x sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, CAS ADDR[10:0]=%x, RAS ADDR[14:0]=%x",mcu3_physical_addr_c, mcu3_drif_dram_dimm_c, mcu3_drif_dram_bank_c, mcu3_drif_dram_rank_c, mcu3_drif_dram_addr_c, mcu3_drif_dram_ras_addr_c);  

  if (mcu3_drif_dram_cmd_a==`RD) 
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: READ CMD\ (Slot A\) PA[39:0]=%x sent to DIMM[2:0]=%x, BANK[2:0]=%x, RANK=%x, CAS ADDR[10:0]=%x, RAS ADDR[14:0]=%x",mcu3_physical_addr_a, mcu3_drif_dram_dimm_a, mcu3_drif_dram_bank_a, mcu3_drif_dram_rank_a, mcu3_drif_dram_addr_a, mcu3_drif_dram_ras_addr_a);  

  if (mcu3_fbdic_f_1_l == 1'b0) begin
  case (mcu3_fbdic_f_1_cnt)
    2'b00: mcu3_wdata_dimm[0] = mcu3_fbdic_f[0] ; 
    2'b01: mcu3_wdata_dimm[1] = mcu3_fbdic_f[0] ; 
    2'b10: mcu3_wdata_dimm[2] = mcu3_fbdic_f[0] ; 
    default: ;
  endcase

    if (mcu3_fbdic_f_1_cnt < 3'b11) begin 
      if (chnl_type==1'b1)
      begin
        `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: (CH0) WDATA[71:0]=%x (CH1) WDATA[71:0]=%x WSn=%b", mcu3_fbdiwr_bc_cmd_data0, mcu3_fbdiwr_bc_cmd_data1, mcu3_fbdic_f[0]);
      end
      else
      begin
        `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: (CH0) WDATA[71:0]=%x WSn=%b", mcu3_fbdiwr_bc_cmd_data0, mcu3_fbdic_f[0]);
      end
      mcu3_fbdic_f_1_cnt = mcu3_fbdic_f_1_cnt + 1'b1;
    end
    else begin
      if(chnl_type==1'b1)
      begin
        `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: (CH0) WDATA[71:0]=%x (CH1) WDATA[71:0]=%x DIMM[2:0]=%x", mcu3_fbdiwr_bc_cmd_data0, mcu3_fbdiwr_bc_cmd_data1, mcu3_wdata_dimm);
      end
      else
      begin
        `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: (CH0) WDATA[71:0]=%x DIMM[2:0]=%x", mcu3_fbdiwr_bc_cmd_data0, mcu3_wdata_dimm);
      end
      mcu3_fbdic_f_1_cnt = 2'b0;
    end
  end

end

//----------------------------------------
// Print MCU FBDIC States (tick Monitor)
//----------------------------------------

always @ (fbdic_fbd_state_0)
if (enabled)
begin
   case(fbdic_fbd_state_0)
   8'h0:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: Entered DISABLE STATE of Link Training Seq");
   8'h1:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: Entered CALIBRATE STATE of Link Training Seq");
   8'h2:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: Entered TRAINING STATE of Link Training Seq");
   8'h3:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: Entered TESTING STATE of Link Training Seq");
   8'h4:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: Entered POLLING STATE of Link Training Seq");
   8'h5:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: Entered CONFIG STATE of Link Training Seq");
   8'h6:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: Entered L0 STATE");
   endcase
end

always @ (fbdic_fbd_state_1)
if (enabled)
begin
   case(fbdic_fbd_state_1)
   8'h0:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: Entered DISABLE STATE of Link Training Seq");
   8'h1:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: Entered CALIBRATE STATE of Link Training Seq");
   8'h2:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: Entered TRAINING STATE of Link Training Seq");
   8'h3:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: Entered TESTING STATE of Link Training Seq");
   8'h4:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: Entered POLLING STATE of Link Training Seq");
   8'h5:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: Entered CONFIG STATE of Link Training Seq");
   8'h6:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: Entered L0 STATE");
   endcase
end

always @ (fbdic_fbd_state_2)
if (enabled)
begin
   case(fbdic_fbd_state_2)
   8'h0:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: Entered DISABLE STATE of Link Training Seq");
   8'h1:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: Entered CALIBRATE STATE of Link Training Seq");
   8'h2:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: Entered TRAINING STATE of Link Training Seq");
   8'h3:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: Entered TESTING STATE of Link Training Seq");
   8'h4:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: Entered POLLING STATE of Link Training Seq");
   8'h5:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: Entered CONFIG STATE of Link Training Seq");
   8'h6:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: Entered L0 STATE");
   endcase
end

always @ (fbdic_fbd_state_3)
if (enabled)
begin
   case(fbdic_fbd_state_3)
   8'h0:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: Entered DISABLE STATE of Link Training Seq");
   8'h1:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: Entered CALIBRATE STATE of Link Training Seq");
   8'h2:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: Entered TRAINING STATE of Link Training Seq");
   8'h3:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: Entered TESTING STATE of Link Training Seq");
   8'h4:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: Entered POLLING STATE of Link Training Seq");
   8'h5:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: Entered CONFIG STATE of Link Training Seq");
   8'h6:  `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: Entered L0 STATE");
   endcase
end

//----------------------------------------
// Sync Frame Collision & failover 
//----------------------------------------

initial
begin
  sync_frame_UI_err_0a = 12'h0;
  sync_frame_UI_err_0b = 12'h0;
  sync_frame_UI_err_1a = 12'h0;
  sync_frame_UI_err_1b = 12'h0;
  sync_frame_UI_err_2a = 12'h0;
  sync_frame_UI_err_2b = 12'h0;
  sync_frame_UI_err_3a = 12'h0;
  sync_frame_UI_err_3b = 12'h0;

  #100;

  if ($test$plusargs("DUAL_CHANNEL"))
    chnl_type = 1'b1;				// DUAL CHANNELS PER BRANCH
  else if ($test$plusargs("SNG_CHANNEL"))
    chnl_type = 1'b0;				// SINGLE CHANNEL PER BRANCH
  else
    chnl_type = 1'b1;				// DUAL CHANNELS PER BRANCH (Default) 

  if ($test$plusargs("RANK_LOW"))
    rank_addr = 1'b0;				// RANK LOW Address Select
  else if ($test$plusargs("RANK_HIGH"))
    rank_addr = 1'b1;				// RANK HIGH Address Select
  else
    rank_addr = 1'b1;				// RANK HIGH Address Select (Default)

  if ($test$plusargs("STACK_DIMM"))
    rank = 1'b1;				// 2 RANKS
  else
    rank = 1'b0;				// 1 RANK (Default)  

  if ($test$plusargs("DIMM_SIZE_1G"))
    dimm_size = 2'b10;
  else if ($test$plusargs("DIMM_SIZE_512"))
    dimm_size = 2'b01;
  else if ($test$plusargs("DIMM_SIZE_256"))
    dimm_size = 2'b00;
  else
    dimm_size = 2'b11;

  if ($test$plusargs("1_FBDIMM"))		// Number of DIMMS
    num_dimms = 3'h1;
  else if ($test$plusargs("2_FBDIMMS"))
    num_dimms = 3'h2;
  else if ($test$plusargs("3_FBDIMMS"))
    num_dimms = 3'h3;
  else if ($test$plusargs("4_FBDIMMS"))
    num_dimms = 3'h4;
  else if ($test$plusargs("5_FBDIMMS"))
    num_dimms = 3'h5;
  else if ($test$plusargs("6_FBDIMMS"))
    num_dimms = 3'h6;
  else if ($test$plusargs("7_FBDIMMS"))
    num_dimms = 3'h7;
  else if ($test$plusargs("8_FBDIMMS"))
    num_dimms = 3'h0;
  else
    num_dimms = 3'h1;				// Default 1 FBDIMM

  if ($test$plusargs("DTM_ENABLED"))
    dtm_enabled = 1;
  else
    dtm_enabled = 0;

  if ($test$plusargs("disable_fbdinit_chk"))
    fbd_init_check = 0;
  else
    fbd_init_check = 1;

end

always @ (posedge (fbdic_l0_state_0 && enabled))
begin
  // SB failover lanes  
  if (fbdic_failover_config_0[7:4] != 4'hf)
  begin
    mcu0_clk_train_pat0 = bit_failover_lane_shift(10'h2aa, fbdic_failover_config_0[7:4]);
    mcu0_clk_train_pat1 = bit_failover_lane_shift(10'h155, fbdic_failover_config_0[7:4]);
  end

  if (fbdic_failover_config_0[15:12] != 4'hf)
  begin
    mcu0_clk_train_pat0 = bit_failover_lane_shift(10'h2aa, fbdic_failover_config_0[15:12]);
    mcu0_clk_train_pat1 = bit_failover_lane_shift(10'h155, fbdic_failover_config_0[15:12]);
  end
end

always @ (posedge (fbdic_l0_state_1 && enabled))
begin
  // SB failover lanes  
  if (fbdic_failover_config_1[7:4] != 4'hf)
  begin
    mcu1_clk_train_pat0 = bit_failover_lane_shift(10'h2aa, fbdic_failover_config_1[7:4]);
    mcu1_clk_train_pat1 = bit_failover_lane_shift(10'h155, fbdic_failover_config_1[7:4]);
  end

  if (fbdic_failover_config_1[15:12] != 4'hf)
  begin
    mcu1_clk_train_pat0 = bit_failover_lane_shift(10'h2aa, fbdic_failover_config_1[15:12]);
    mcu1_clk_train_pat1 = bit_failover_lane_shift(10'h155, fbdic_failover_config_1[15:12]);
  end
end

always @ (posedge (fbdic_l0_state_2 && enabled))
begin
  // SB failover lanes  
  if (fbdic_failover_config_2[7:4] != 4'hf)
  begin
    mcu2_clk_train_pat0 = bit_failover_lane_shift(10'h2aa, fbdic_failover_config_2[7:4]);
    mcu2_clk_train_pat1 = bit_failover_lane_shift(10'h155, fbdic_failover_config_2[7:4]);
  end

  if (fbdic_failover_config_2[15:12] != 4'hf)
  begin
    mcu2_clk_train_pat0 = bit_failover_lane_shift(10'h2aa, fbdic_failover_config_2[15:12]);
    mcu2_clk_train_pat1 = bit_failover_lane_shift(10'h155, fbdic_failover_config_2[15:12]);
  end
end

always @ (posedge (fbdic_l0_state_3 && enabled))
begin
  // SB failover lanes  
  if (fbdic_failover_config_3[7:4] != 4'hf)
  begin
    mcu3_clk_train_pat0 = bit_failover_lane_shift(10'h2aa, fbdic_failover_config_3[7:4]);
    mcu3_clk_train_pat1 = bit_failover_lane_shift(10'h155, fbdic_failover_config_3[7:4]);
  end

  if (fbdic_failover_config_3[15:12] != 4'hf)
  begin
    mcu3_clk_train_pat0 = bit_failover_lane_shift(10'h2aa, fbdic_failover_config_3[15:12]);
    mcu3_clk_train_pat1 = bit_failover_lane_shift(10'h155, fbdic_failover_config_3[15:12]);
  end
end

always @ (posedge (fbdic_sync_frame_req_0 && enabled))
begin
  repeat(4) @(posedge drl2clk);
  repeat(4) @(negedge sclk);

  @(negedge sclk);     
  if (fbdimm0a_tx_p_top != mcu0_clk_train_pat0) 
    sync_frame_UI_err_0a[4] = 1'b1;
  if (chnl_type) begin
    if (fbdimm0b_tx_p_top != mcu0_clk_train_pat0)
      sync_frame_UI_err_0b[4] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm0a_tx_p_top != mcu0_clk_train_pat1) 	
    sync_frame_UI_err_0a[5] = 1'b1;
  if (chnl_type) begin
    if (fbdimm0b_tx_p_top != mcu0_clk_train_pat1)
      sync_frame_UI_err_0b[5] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm0a_tx_p_top != mcu0_clk_train_pat0) 	
    sync_frame_UI_err_0a[6] = 1'b1;
  if (chnl_type) begin
    if (fbdimm0b_tx_p_top != mcu0_clk_train_pat0)
      sync_frame_UI_err_0b[6] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm0a_tx_p_top != mcu0_clk_train_pat1)     
    sync_frame_UI_err_0a[7] = 1'b1;
  if (chnl_type) begin
    if (fbdimm0b_tx_p_top != mcu0_clk_train_pat1)
      sync_frame_UI_err_0b[7] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm0a_tx_p_top != mcu0_clk_train_pat0)     
    sync_frame_UI_err_0a[8] = 1'b1;
  if (chnl_type) begin
    if (fbdimm0b_tx_p_top != mcu0_clk_train_pat0)
      sync_frame_UI_err_0b[8] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm0a_tx_p_top != mcu0_clk_train_pat1)     
    sync_frame_UI_err_0a[9] = 1'b1;
  if (chnl_type) begin
    if (fbdimm0b_tx_p_top != mcu0_clk_train_pat1)
      sync_frame_UI_err_0b[9] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm0a_tx_p_top != mcu0_clk_train_pat0)     
    sync_frame_UI_err_0a[10] = 1'b1;
  if (chnl_type) begin
    if (fbdimm0b_tx_p_top != mcu0_clk_train_pat0)
      sync_frame_UI_err_0b[10] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm0a_tx_p_top != mcu0_clk_train_pat1)     
    sync_frame_UI_err_0a[11] = 1'b1;
  if (chnl_type) begin
    if (fbdimm0b_tx_p_top != mcu0_clk_train_pat1)
      sync_frame_UI_err_0b[11] = 1'b1;
  end

`ifdef MCUSAT
  if (((|sync_frame_UI_err_0a[11:0] == 1'b1) || (|sync_frame_UI_err_0b[11:0] == 1'b1)) && sync_collision_check_enable)
       `PR_ERROR("mcu_fmon", `ERROR, "MCU0: SYNC Frame is corrupted due to possible collision Ch a=%x Ch b=%x",sync_frame_UI_err_0a, sync_frame_UI_err_0b);  
`endif
end 

always @ (posedge (fbdic_sync_frame_req_1 && enabled))
begin
  repeat(4) @(posedge drl2clk);
  repeat(4) @(negedge sclk);

  @(negedge sclk);     
  if (fbdimm1a_tx_p_top != mcu1_clk_train_pat0) 
    sync_frame_UI_err_1a[4] = 1'b1;
  if (chnl_type) begin
    if (fbdimm1b_tx_p_top != mcu1_clk_train_pat0)
      sync_frame_UI_err_1b[4] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm1a_tx_p_top != mcu1_clk_train_pat1) 	
    sync_frame_UI_err_1a[5] = 1'b1;
  if (chnl_type) begin
    if (fbdimm1b_tx_p_top != mcu1_clk_train_pat1)
      sync_frame_UI_err_1b[5] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm1a_tx_p_top != mcu1_clk_train_pat0) 	
    sync_frame_UI_err_1a[6] = 1'b1;
  if (chnl_type) begin
    if (fbdimm1b_tx_p_top != mcu1_clk_train_pat0)
      sync_frame_UI_err_1b[6] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm1a_tx_p_top != mcu1_clk_train_pat1)     
    sync_frame_UI_err_1a[7] = 1'b1;
  if (chnl_type) begin
    if (fbdimm1b_tx_p_top != mcu1_clk_train_pat1)
      sync_frame_UI_err_1b[7] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm1a_tx_p_top != mcu1_clk_train_pat0)     
    sync_frame_UI_err_1a[8] = 1'b1;
  if (chnl_type) begin
    if (fbdimm1b_tx_p_top != mcu1_clk_train_pat0)
      sync_frame_UI_err_1b[8] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm1a_tx_p_top != mcu1_clk_train_pat1)     
    sync_frame_UI_err_1a[9] = 1'b1;
  if (chnl_type) begin
    if (fbdimm1b_tx_p_top != mcu1_clk_train_pat1)
      sync_frame_UI_err_1b[9] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm1a_tx_p_top != mcu1_clk_train_pat0)     
    sync_frame_UI_err_1a[10] = 1'b1;
  if (chnl_type) begin
    if (fbdimm1b_tx_p_top != mcu1_clk_train_pat0)
      sync_frame_UI_err_1b[10] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm1a_tx_p_top != mcu1_clk_train_pat1)     
    sync_frame_UI_err_1a[11] = 1'b1;
  if (chnl_type) begin
    if (fbdimm1b_tx_p_top != mcu1_clk_train_pat1)
      sync_frame_UI_err_1b[11] = 1'b1;
  end

`ifdef MCUSAT
  if (((|sync_frame_UI_err_1a[11:0] == 1'b1) || (|sync_frame_UI_err_1b[11:0] == 1'b1)) && sync_collision_check_enable)
       `PR_ERROR("mcu_fmon", `ERROR, "MCU1: SYNC Frame is corrupted due to possible collision Ch a=%x Ch b=%x",sync_frame_UI_err_1a, sync_frame_UI_err_1b);  
`endif
end 

always @ (posedge (fbdic_sync_frame_req_2 && enabled))
begin
  repeat(4) @(posedge drl2clk);
  repeat(4) @(negedge sclk);

  @(negedge sclk);     
  if (fbdimm2a_tx_p_top != mcu2_clk_train_pat0) 
    sync_frame_UI_err_2a[4] = 1'b1;
  if (chnl_type) begin
    if (fbdimm2b_tx_p_top != mcu2_clk_train_pat0)
      sync_frame_UI_err_2b[4] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm2a_tx_p_top != mcu2_clk_train_pat1) 	
    sync_frame_UI_err_2a[5] = 1'b1;
  if (chnl_type) begin
    if (fbdimm2b_tx_p_top != mcu2_clk_train_pat1)
      sync_frame_UI_err_2b[5] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm2a_tx_p_top != mcu2_clk_train_pat0) 	
    sync_frame_UI_err_2a[6] = 1'b1;
  if (chnl_type) begin
    if (fbdimm2b_tx_p_top != mcu2_clk_train_pat0)
      sync_frame_UI_err_2b[6] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm2a_tx_p_top != mcu2_clk_train_pat1)     
    sync_frame_UI_err_2a[7] = 1'b1;
  if (chnl_type) begin
    if (fbdimm2b_tx_p_top != mcu2_clk_train_pat1)
      sync_frame_UI_err_2b[7] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm2a_tx_p_top != mcu2_clk_train_pat0)     
    sync_frame_UI_err_2a[8] = 1'b1;
  if (chnl_type) begin
    if (fbdimm2b_tx_p_top != mcu2_clk_train_pat0)
      sync_frame_UI_err_2b[8] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm2a_tx_p_top != mcu2_clk_train_pat1)     
    sync_frame_UI_err_2a[9] = 1'b1;
  if (chnl_type) begin
    if (fbdimm2b_tx_p_top != mcu2_clk_train_pat1)
      sync_frame_UI_err_2b[9] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm2a_tx_p_top != mcu2_clk_train_pat0)     
    sync_frame_UI_err_2a[10] = 1'b1;
  if (chnl_type) begin
    if (fbdimm2b_tx_p_top != mcu2_clk_train_pat0)
      sync_frame_UI_err_2b[10] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm2a_tx_p_top != mcu2_clk_train_pat1)     
    sync_frame_UI_err_2a[11] = 1'b1;
  if (chnl_type) begin
    if (fbdimm2b_tx_p_top != mcu2_clk_train_pat1)
      sync_frame_UI_err_2b[11] = 1'b1;
  end

`ifdef MCUSAT
  if (((|sync_frame_UI_err_2a[11:0] == 1'b1) || (|sync_frame_UI_err_2b[11:0] == 1'b1)) && sync_collision_check_enable)
       `PR_ERROR("mcu_fmon", `ERROR, "MCU2: SYNC Frame is corrupted due to possible collision Ch a=%x Ch b=%x",sync_frame_UI_err_2a, sync_frame_UI_err_2b);  
`endif
end 

always @ (posedge (fbdic_sync_frame_req_3 && enabled))
begin
  repeat(4) @(posedge drl2clk);
  repeat(4) @(negedge sclk);

  @(negedge sclk);     
  if (fbdimm3a_tx_p_top != mcu3_clk_train_pat0) 
    sync_frame_UI_err_3a[4] = 1'b1;
  if (chnl_type) begin
    if (fbdimm3b_tx_p_top != mcu3_clk_train_pat0)
      sync_frame_UI_err_3b[4] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm3a_tx_p_top != mcu3_clk_train_pat1) 	
    sync_frame_UI_err_3a[5] = 1'b1;
  if (chnl_type) begin
    if (fbdimm3b_tx_p_top != mcu3_clk_train_pat1)
      sync_frame_UI_err_3b[5] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm3a_tx_p_top != mcu3_clk_train_pat0) 	
    sync_frame_UI_err_3a[6] = 1'b1;
  if (chnl_type) begin
    if (fbdimm3b_tx_p_top != mcu3_clk_train_pat0)
      sync_frame_UI_err_3b[6] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm3a_tx_p_top != mcu3_clk_train_pat1)     
    sync_frame_UI_err_3a[7] = 1'b1;
  if (chnl_type) begin
    if (fbdimm3b_tx_p_top != mcu3_clk_train_pat1)
      sync_frame_UI_err_3b[7] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm3a_tx_p_top != mcu3_clk_train_pat0)     
    sync_frame_UI_err_3a[8] = 1'b1;
  if (chnl_type) begin
    if (fbdimm3b_tx_p_top != mcu3_clk_train_pat0)
      sync_frame_UI_err_3b[8] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm3a_tx_p_top != mcu3_clk_train_pat1)     
    sync_frame_UI_err_3a[9] = 1'b1;
  if (chnl_type) begin
    if (fbdimm3b_tx_p_top != mcu3_clk_train_pat1)
      sync_frame_UI_err_3b[9] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm3a_tx_p_top != mcu3_clk_train_pat0)     
    sync_frame_UI_err_3a[10] = 1'b1;
  if (chnl_type) begin
    if (fbdimm3b_tx_p_top != mcu3_clk_train_pat0)
      sync_frame_UI_err_3b[10] = 1'b1;
  end
  @(negedge sclk); 
  if (fbdimm3a_tx_p_top != mcu3_clk_train_pat1)     
    sync_frame_UI_err_3a[11] = 1'b1;
  if (chnl_type) begin
    if (fbdimm3b_tx_p_top != mcu3_clk_train_pat1)
      sync_frame_UI_err_3b[11] = 1'b1;
  end

`ifdef MCUSAT
  if (((|sync_frame_UI_err_3a[11:0] == 1'b1) || (|sync_frame_UI_err_3b[11:0] == 1'b1)) && sync_collision_check_enable)
       `PR_ERROR("mcu_fmon", `ERROR, "MCU3: SYNC Frame is corrupted due to possible collision Ch a=%x Ch b=%x",sync_frame_UI_err_3a, sync_frame_UI_err_3b);  
`endif
end 

function [9:0] bit_failover_lane_shift;
input [9:0] mcu_clk_train_pat;
input [3:0] bad_bit_lane_ch;
       
reg [9:0] MCU_CLK_TRAIN_PAT;

begin
    MCU_CLK_TRAIN_PAT = mcu_clk_train_pat;
    mcu_clk_train_pat = mcu_clk_train_pat << 1;

    case(bad_bit_lane_ch)
    0000: mcu_clk_train_pat[0]   = MCU_CLK_TRAIN_PAT[0] ; 
    0001: mcu_clk_train_pat[1:0] = MCU_CLK_TRAIN_PAT[1:0] ; 
    0010: mcu_clk_train_pat[2:0] = MCU_CLK_TRAIN_PAT[2:0] ; 
    0011: mcu_clk_train_pat[3:0] = MCU_CLK_TRAIN_PAT[3:0] ; 
    0100: mcu_clk_train_pat[4:0] = MCU_CLK_TRAIN_PAT[4:0] ; 
    0101: mcu_clk_train_pat[5:0] = MCU_CLK_TRAIN_PAT[5:0] ; 
    0110: mcu_clk_train_pat[6:0] = MCU_CLK_TRAIN_PAT[6:0] ; 
    0111: mcu_clk_train_pat[7:0] = MCU_CLK_TRAIN_PAT[7:0] ; 
    1000: mcu_clk_train_pat[8:0] = MCU_CLK_TRAIN_PAT[8:0] ; 
    1001: mcu_clk_train_pat[9:0] = MCU_CLK_TRAIN_PAT[9:0] ; 
    endcase
 
    bit_failover_lane_shift = mcu_clk_train_pat ;

end
endfunction

//----------------------------
// Wr/Rd Config (TID) checkers
//----------------------------

initial
begin
  chnl_0 = 1'b0;
  chnl_1 = 1'b0;
  chnl_2 = 1'b0;
  chnl_3 = 1'b0;

  fbdic0_last_tid_0 = 1'b0;
  fbdic0_last_tid_1 = 1'b0;
  fbdic0_last_tid_2 = 1'b0;
  fbdic0_last_tid_3 = 1'b0;

  fbdic1_last_tid_0 = 1'b0;
  fbdic1_last_tid_1 = 1'b0;
  fbdic1_last_tid_2 = 1'b0;
  fbdic1_last_tid_3 = 1'b0;
end

always @(posedge (drl2clk && enabled))
begin
     // MCU 0
     if (drif_ucb_addr_0[31:0] == 32'h900)
       if (drif_ucb_data_0[15] == 1'b0)
         chnl_0 <= 1'b0;
       else
         chnl_0 <= 1'b1;

     if (drif_ucb_addr_0==32'h908 && drif_ucb_wr_req_vld_0==1'b1 && chnl_0==1'b0)
       fbdic0_last_tid_0 <= ~fbdic0_last_tid_0;

     if (drif_ucb_addr_0==32'h908 && drif_ucb_wr_req_vld_0==1'b1 && chnl_0==1'b1)
       fbdic1_last_tid_0 <= ~fbdic1_last_tid_0;

     // MCU 1
     if (drif_ucb_addr_1[31:0] == 32'h900)
       if (drif_ucb_data_1[15] == 1'b0)
         chnl_1 <= 1'b0;
       else
         chnl_1 <= 1'b1;

     if (drif_ucb_addr_1==32'h908 && drif_ucb_wr_req_vld_1==1'b1 && chnl_1==1'b0)
       fbdic0_last_tid_1 <= ~fbdic0_last_tid_1;

     if (drif_ucb_addr_1==32'h908 && drif_ucb_wr_req_vld_1==1'b1 && chnl_1==1'b1)
       fbdic1_last_tid_1 <= ~fbdic1_last_tid_1;

     // MCU 2
     if (drif_ucb_addr_2[31:0] == 32'h900)
       if (drif_ucb_data_2[15] == 1'b0)
         chnl_2 <= 1'b0;
       else
         chnl_2 <= 1'b1;

     if (drif_ucb_addr_2==32'h908 && drif_ucb_wr_req_vld_2==1'b1 && chnl_2==1'b0)
       fbdic0_last_tid_2 <= ~fbdic0_last_tid_2;

     if (drif_ucb_addr_2==32'h908 && drif_ucb_wr_req_vld_2==1'b1 && chnl_2==1'b1)
       fbdic1_last_tid_2 <= ~fbdic1_last_tid_2;

     // MCU 3
     if (drif_ucb_addr_3[31:0] == 32'h900)
       if (drif_ucb_data_3[15] == 1'b0)
         chnl_3 <= 1'b0;
       else
         chnl_3 <= 1'b1;

     if (drif_ucb_addr_3==32'h908 && drif_ucb_wr_req_vld_3==1'b1 && chnl_3==1'b0)
       fbdic0_last_tid_3 <= ~fbdic0_last_tid_3;

     if (drif_ucb_addr_3==32'h908 && drif_ucb_wr_req_vld_3==1'b1 && chnl_3==1'b1)
       fbdic1_last_tid_3 <= ~fbdic1_last_tid_3;

end

assign fbdic_trans_id_0 = chnl_0 ? fbdic1_last_tid_0 : fbdic0_last_tid_0 ;
assign fbdic_trans_id_1 = chnl_1 ? fbdic1_last_tid_1 : fbdic0_last_tid_1 ;
assign fbdic_trans_id_2 = chnl_2 ? fbdic1_last_tid_2 : fbdic0_last_tid_2 ;
assign fbdic_trans_id_3 = chnl_3 ? fbdic1_last_tid_3 : fbdic0_last_tid_3 ;

`ifndef DISABLE_TID_CHKR

always @(posedge (fbdic_config_reg_write_0 && enabled))
begin
  if (fbdic_sync_frame_req_0)
    repeat(5) @(posedge drl2clk);
  else
    repeat(4) @(posedge drl2clk);

  repeat(5) @(negedge sclk);

  if ((fbdimm0a_tx_p_top[3] != fbdic_trans_id_0) && (chnl_0 == 1'b0)) 
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: BAD TID  ACTUAL TID=%b EXPECTED TID=%b", fbdimm0a_tx_p_top[3], fbdic_trans_id_0); 

  if ((fbdimm0a_tx_p_top[3] == fbdic_trans_id_0) && (chnl_0 == 1'b0))
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: MATCHED TID  ACTUAL TID=%b EXPECTED TID=%b", fbdimm0a_tx_p_top[3], fbdic_trans_id_0); 

  if ((fbdimm0b_tx_p_top[3] != fbdic_trans_id_0) && (chnl_0 == 1'b1)) 
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: BAD TID  ACTUAL TID=%b EXPECTED TID=%b", fbdimm0b_tx_p_top[3], fbdic_trans_id_0); 

  if ((fbdimm0b_tx_p_top[3] == fbdic_trans_id_0) && (chnl_0 == 1'b1))
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: MATCHED TID  ACTUAL TID=%b EXPECTED TID=%b", fbdimm0b_tx_p_top[3], fbdic_trans_id_0); 
end 

always @(posedge (fbdic_config_reg_write_1 && enabled))
begin
  if (fbdic_sync_frame_req_1)
    repeat(5) @(posedge drl2clk);
  else
    repeat(4) @(posedge drl2clk);

  repeat(5) @(negedge sclk);

  if ((fbdimm1a_tx_p_top[3] != fbdic_trans_id_1) && (chnl_1 == 1'b0))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: BAD TID  ACTUAL TID=%b EXPECTED TID=%b", fbdimm1a_tx_p_top[3], fbdic_trans_id_1); 

  if ((fbdimm1a_tx_p_top[3] == fbdic_trans_id_1) && (chnl_1 == 1'b0))
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: MATCHED TID  ACTUAL TID=%b EXPECTED TID=%b", fbdimm1a_tx_p_top[3], fbdic_trans_id_1); 

  if ((fbdimm1b_tx_p_top[3] != fbdic_trans_id_1) && (chnl_1 == 1'b1)) ;
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: BAD TID  ACTUAL TID=%b EXPECTED TID=%b", fbdimm1b_tx_p_top[3], fbdic_trans_id_1); 

  if ((fbdimm1b_tx_p_top[3] == fbdic_trans_id_1) && (chnl_1 == 1'b1))
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: MATCHED TID  ACTUAL TID=%b EXPECTED TID=%b", fbdimm1b_tx_p_top[3], fbdic_trans_id_1); 
end 

always @(posedge (fbdic_config_reg_write_2 && enabled))
begin
  if (fbdic_sync_frame_req_2)
    repeat(5) @(posedge drl2clk);
  else
    repeat(4) @(posedge drl2clk);

  repeat(5) @(negedge sclk);

  if ((fbdimm2a_tx_p_top[3] != fbdic_trans_id_2) && (chnl_2 == 1'b0))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: BAD TID  ACTUAL TID=%b EXPECTED TID=%b", fbdimm2a_tx_p_top[3], fbdic_trans_id_2); 

  if ((fbdimm2a_tx_p_top[3] == fbdic_trans_id_2) && (chnl_2 == 1'b0))
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: MATCHED TID  ACTUAL TID=%b EXPECTED TID=%b", fbdimm2a_tx_p_top[3], fbdic_trans_id_2); 

  if ((fbdimm2b_tx_p_top[3] != fbdic_trans_id_2) && (chnl_2 == 1'b1))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: BAD TID  ACTUAL TID=%b EXPECTED TID=%b", fbdimm2b_tx_p_top[3], fbdic_trans_id_2); 

  if ((fbdimm2b_tx_p_top[3] == fbdic_trans_id_2) && (chnl_2 == 1'b1))
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: MATCHED TID  ACTUAL TID=%b EXPECTED TID=%b", fbdimm2b_tx_p_top[3], fbdic_trans_id_2); 
end 

always @(posedge (fbdic_config_reg_write_3 && enabled))
begin
  if (fbdic_sync_frame_req_3)
    repeat(5) @(posedge drl2clk);
  else
    repeat(4) @(posedge drl2clk);

  repeat(5) @(negedge sclk);

  if ((fbdimm3a_tx_p_top[3] != fbdic_trans_id_3) && (chnl_3 == 1'b0))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: BAD TID  ACTUAL TID=%b EXPECTED TID=%b", fbdimm3a_tx_p_top[3], fbdic_trans_id_3); 

  if ((fbdimm3a_tx_p_top[3] == fbdic_trans_id_3) && (chnl_3 == 1'b0))
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: MATCHED TID  ACTUAL TID=%b EXPECTED TID=%b", fbdimm3a_tx_p_top[3], fbdic_trans_id_3); 

  if ((fbdimm3b_tx_p_top[3] != fbdic_trans_id_3) && (chnl_3 == 1'b1))
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: BAD TID  ACTUAL TID=%b EXPECTED TID=%b", fbdimm3b_tx_p_top[3], fbdic_trans_id_3); 

  if ((fbdimm3b_tx_p_top[3] == fbdic_trans_id_3) && (chnl_3 == 1'b1))
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: MATCHED TID  ACTUAL TID=%b EXPECTED TID=%b", fbdimm3b_tx_p_top[3], fbdic_trans_id_3); 
end

`endif 

//---------------------------------------------------------------
// Added Read Data return print statements in fbdic and X checker
//---------------------------------------------------------------

always @(posedge (mcu0_rdpctl_l2t0_data_valid && enabled) or posedge (mcu0_rdpctl_l2t1_data_valid && enabled))
begin
  if (chnl_type == 1'b1) // DUAL Channel Mode for now
  begin
    @(negedge drl2clk);
    if (|mcu0_rddata_0 === 1'bX)
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: (Chnla) Read Data = %x has X", mcu0_rddata_0);
    //else
    //  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU0: (Chnla) Read Data = %x", mcu0_rddata_0);

    if (|mcu0_rddata_1 === 1'bX)
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: (Chnlb) Read Data = %x has X", mcu0_rddata_1);
    //else
    //  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU0: (Chnlb) Read Data = %x", mcu0_rddata_1);

    @(negedge drl2clk);
    if (|mcu0_rddata_0 === 1'bX)
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: (Chnla) Read Data = %x has X", mcu0_rddata_0);
    //else
    //  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU0: (Chnla) Read Data = %x", mcu0_rddata_0);

    if (|mcu0_rddata_1 === 1'bX)
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: (Chnlb) Read Data = %x has X", mcu0_rddata_1);
    //else
    //  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU0: (Chnlb) Read Data = %x", mcu0_rddata_1);
  end
end

always @(posedge (mcu1_rdpctl_l2t0_data_valid && enabled) or posedge (mcu1_rdpctl_l2t1_data_valid && enabled))
begin
  if (chnl_type == 1'b1) // DUAL Channel Mode for now
  begin
    @(negedge drl2clk);
    if (|mcu1_rddata_0 === 1'bX)
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU1: (Chnla) Read Data = %x has X", mcu1_rddata_0);
    //else
    //  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU1: (Chnla) Read Data = %x", mcu1_rddata_0);

    if (|mcu1_rddata_1 === 1'bX)
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU1: (Chnlb) Read Data = %x has X", mcu1_rddata_1);
    //else
    //  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU1: (Chnlb) Read Data = %x", mcu1_rddata_1);

    @(negedge drl2clk);
    if (|mcu1_rddata_0 === 1'bX)
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU1: (Chnla) Read Data = %x has X", mcu1_rddata_0);
    //else
    //  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU1: (Chnla) Read Data = %x", mcu1_rddata_0);

    if (|mcu1_rddata_1 === 1'bX)
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU1: (Chnlb) Read Data = %x has X", mcu1_rddata_1);
    //else
    //  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU1: (Chnlb) Read Data = %x", mcu1_rddata_1);
  end
end

always @(posedge (mcu2_rdpctl_l2t0_data_valid && enabled) or posedge (mcu2_rdpctl_l2t1_data_valid && enabled))
begin
  if (chnl_type == 1'b1) // DUAL Channel Mode for now
  begin
    @(negedge drl2clk);
    if (|mcu2_rddata_0 === 1'bX)
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU2: (Chnla) Read Data = %x has X", mcu2_rddata_0);
    //else
    //  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU2: (Chnla) Read Data = %x", mcu2_rddata_0);

    if (|mcu2_rddata_1 === 1'bX)
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU2: (Chnlb) Read Data = %x has X", mcu2_rddata_1);
    //else
    //  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU2: (Chnlb) Read Data = %x", mcu2_rddata_1);

    @(negedge drl2clk);
    if (|mcu2_rddata_0 === 1'bX)
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU2: (Chnla) Read Data = %x has X", mcu2_rddata_0);
    //else
    //  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU2: (Chnla) Read Data = %x", mcu2_rddata_0);

    if (|mcu2_rddata_1 === 1'bX)
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU2: (Chnlb) Read Data = %x has X", mcu2_rddata_1);
    //else
    //  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU2: (Chnlb) Read Data = %x", mcu2_rddata_1);
  end
end

always @(posedge (mcu3_rdpctl_l2t0_data_valid && enabled) or posedge (mcu3_rdpctl_l2t1_data_valid && enabled))
begin
  if (chnl_type == 1'b1) // DUAL Channel Mode for now
  begin
    @(negedge drl2clk);
    if (|mcu3_rddata_0 === 1'bX)
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU3: (Chnla) Read Data = %x has X", mcu3_rddata_0);
    //else
    //  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU3: (Chnla) Read Data = %x", mcu3_rddata_0);

    if (|mcu3_rddata_1 === 1'bX)
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU3: (Chnlb) Read Data = %x has X", mcu3_rddata_1);
    //else
    //  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU3: (Chnlb) Read Data = %x", mcu3_rddata_1);

    @(negedge drl2clk);
    if (|mcu3_rddata_0 === 1'bX)
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU3: (Chnla) Read Data = %x has X", mcu3_rddata_0);
    //else
    //  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU3: (Chnla) Read Data = %x", mcu3_rddata_0);

    if (|mcu3_rddata_1 === 1'bX)
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU3: (Chnlb) Read Data = %x has X", mcu3_rddata_1);
    //else
    //  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU3: (Chnlb) Read Data = %x", mcu3_rddata_1);
  end
end



// added for including code common to both MCUSAT and fullchip
`ifdef MCUSAT
    `define MCUSAT_AND_FC
`endif
`ifdef FC_CRC_INJECT
    `define MCUSAT_AND_FC
`endif


//----------------------------
// SYNC & Status Frame Checker
//----------------------------
`ifdef MCUSAT_AND_FC
initial 
begin
  mcu0_chnl_lat = 0;
  mcu1_chnl_lat = 0;
  mcu2_chnl_lat = 0;
  mcu3_chnl_lat = 0;
end

always  @(posedge (fbdic_l0_state_0 && enabled))
begin
  for (mcu0_chnl_lat=0; mcu0_chnl_lat < mcu0_fbdic_chnl_read_lat[7:0]; mcu0_chnl_lat=mcu0_chnl_lat + 1) dummy=1;
end

always @(posedge (fbdic_l0_state_1 && enabled))
begin
  for (mcu1_chnl_lat=0; mcu1_chnl_lat < mcu1_fbdic_chnl_read_lat[7:0]; mcu1_chnl_lat=mcu1_chnl_lat + 1) dummy=1;
end

always  @(posedge (fbdic_l0_state_2 && enabled))
begin
  for (mcu2_chnl_lat=0; mcu2_chnl_lat < mcu2_fbdic_chnl_read_lat[7:0]; mcu2_chnl_lat=mcu2_chnl_lat + 1) dummy=1;
end

always  @(posedge (fbdic_l0_state_3 && enabled))
begin
  for (mcu3_chnl_lat=0; mcu3_chnl_lat < mcu3_fbdic_chnl_read_lat[7:0]; mcu3_chnl_lat=mcu3_chnl_lat + 1) dummy=1;
end
 
/////////////////////////////////////
/////////////////////////////////////
always  @(posedge (fbdic_l0_state_0 && enabled && mcu0_fbdic_chnl_read_lat))
begin
  for (mcu0_chnl_lat_int=0; mcu0_chnl_lat_int < mcu0_fbdic_chnl_read_lat[7:0]; mcu0_chnl_lat_int=mcu0_chnl_lat_int + 1) dummy=1;
end

always @(posedge (fbdic_l0_state_1 && enabled && mcu1_fbdic_chnl_read_lat))
begin
  for (mcu1_chnl_lat_int=0; mcu1_chnl_lat_int < mcu1_fbdic_chnl_read_lat[7:0]; mcu1_chnl_lat_int=mcu1_chnl_lat_int + 1) dummy=1;
end

always  @(posedge (fbdic_l0_state_2 && enabled && mcu2_fbdic_chnl_read_lat))
begin
  for (mcu2_chnl_lat_int=0; mcu2_chnl_lat_int < mcu2_fbdic_chnl_read_lat[7:0]; mcu2_chnl_lat_int=mcu2_chnl_lat_int + 1) dummy=1;
end

always  @(posedge (fbdic_l0_state_3 && enabled && mcu3_fbdic_chnl_read_lat))
begin
  for (mcu3_chnl_lat_int=0; mcu3_chnl_lat_int < mcu3_fbdic_chnl_read_lat[7:0]; mcu3_chnl_lat_int=mcu3_chnl_lat_int + 1) dummy=1;
end

always @(posedge (mcu0_fbdic_sync_frame_req && enabled))
begin
  @(negedge drl2clk);
  case (mcu0_fbdic_sync_sd)
    2'b00: mcu0_sync_sd = 0;
    2'b01: mcu0_sync_sd = 1;
    2'b10: mcu0_sync_sd = 2;
    2'b11: mcu0_sync_sd = 3;
  endcase

  repeat (mcu0_chnl_lat+mcu0_sync_sd+1) @(posedge drl2clk);

  @(negedge drl2clk);
  if (mcu0_fbdic_status_frame != 1'b1 && fbdic_l0_state_0)
   begin
	if(mcu0_chnl_lat != mcu0_chnl_lat_int) 
    		`PR_ERROR ("mcu_fmon", `ERROR, "MCU0: STATUS Frame not received after %x dram cycles after SYNC Frame  *** N2 T.O. BUG 121080 ***", mcu0_fbdic_chnl_read_lat[7:0]);
	else
    		`PR_ERROR ("mcu_fmon", `ERROR, "MCU0: STATUS Frame not received after %x dram cycles after SYNC Frame", mcu0_fbdic_chnl_read_lat[7:0]);
  end
end 

always @(posedge (mcu1_fbdic_sync_frame_req && enabled))
begin
  @(negedge drl2clk);
  case (mcu1_fbdic_sync_sd)
    2'b00: mcu1_sync_sd = 0;
    2'b01: mcu1_sync_sd = 1;
    2'b10: mcu1_sync_sd = 2;
    2'b11: mcu1_sync_sd = 3;
  endcase

  repeat (mcu1_chnl_lat+mcu1_sync_sd+1) @(posedge drl2clk);

  @(negedge drl2clk);
  if (mcu1_fbdic_status_frame != 1'b1 && fbdic_l0_state_1)
	begin
		if(mcu1_chnl_lat != mcu1_chnl_lat_int) 
    			`PR_ERROR ("mcu_fmon", `ERROR, "MCU1: STATUS Frame not received after %x dram cycles after SYNC Frame *** N2 T.O. BUG 121080 ***", mcu1_fbdic_chnl_read_lat[7:0]);
		else
    			`PR_ERROR ("mcu_fmon", `ERROR, "MCU1: STATUS Frame not received after %x dram cycles after SYNC Frame", mcu1_fbdic_chnl_read_lat[7:0]);
	end
end 

always @(posedge (mcu2_fbdic_sync_frame_req && enabled))
begin
  @(negedge drl2clk);
  case (mcu2_fbdic_sync_sd)
    2'b00: mcu2_sync_sd = 0;
    2'b01: mcu2_sync_sd = 1;
    2'b10: mcu2_sync_sd = 2;
    2'b11: mcu2_sync_sd = 3;
  endcase

  repeat (mcu2_chnl_lat+mcu2_sync_sd+1) @(posedge drl2clk);

  @(negedge drl2clk);
  if (mcu2_fbdic_status_frame != 1'b1 && fbdic_l0_state_2)
	begin
		if(mcu2_chnl_lat != mcu2_chnl_lat_int) 
    			`PR_ERROR ("mcu_fmon", `ERROR, "MCU2: STATUS Frame not received after %x dram cycles after SYNC Frame *** N2 T.O. BUG 121080 ***", mcu2_fbdic_chnl_read_lat[7:0]);
		else
    			`PR_ERROR ("mcu_fmon", `ERROR, "MCU2: STATUS Frame not received after %x dram cycles after SYNC Frame", mcu2_fbdic_chnl_read_lat[7:0]);
	end
end 

always @(posedge (mcu3_fbdic_sync_frame_req && enabled))
begin
  @(negedge drl2clk);
  case (mcu3_fbdic_sync_sd)
    2'b00: mcu3_sync_sd = 0;
    2'b01: mcu3_sync_sd = 1;
    2'b10: mcu3_sync_sd = 2;
    2'b11: mcu3_sync_sd = 3;
  endcase

  repeat (mcu3_chnl_lat+mcu3_sync_sd+1) @(posedge drl2clk);

  @(negedge drl2clk);
  if (mcu3_fbdic_status_frame != 1'b1 && fbdic_l0_state_3) 
	begin
		if(mcu3_chnl_lat != mcu3_chnl_lat_int)
    			`PR_ERROR ("mcu_fmon", `ERROR, "MCU3: STATUS Frame not received after %x dram cycles after SYNC Frame *** N2 T.O. BUG 121080 ***", mcu3_fbdic_chnl_read_lat[7:0]);
		else
    			`PR_ERROR ("mcu_fmon", `ERROR, "MCU3: STATUS Frame not received after %x dram cycles after SYNC Frame", mcu3_fbdic_chnl_read_lat[7:0]);
	end
end 
`endif

always @(posedge (mcu0_fbdic_status_frame && enabled)) begin
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU0: STATUS Frame received");
end

always @(posedge (mcu1_fbdic_status_frame && enabled)) begin
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU1: STATUS Frame received");
end

always @(posedge (mcu2_fbdic_status_frame && enabled)) begin
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU2: STATUS Frame received");
end

always @(posedge (mcu3_fbdic_status_frame && enabled)) begin
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU3: STATUS Frame received");
end

//-------------------------------
// SCR Frame Checkers & Monitors
//-------------------------------

initial 
begin
  mcu0_drif_dram_cmd_a_prev = 3'b0;
  mcu0_drif_dram_cmd_b_prev = 3'b0;
  mcu0_drif_dram_cmd_c_prev = 3'b0;

  mcu1_drif_dram_cmd_a_prev = 3'b0;
  mcu1_drif_dram_cmd_b_prev = 3'b0;
  mcu1_drif_dram_cmd_c_prev = 3'b0;

  mcu2_drif_dram_cmd_a_prev = 3'b0;
  mcu2_drif_dram_cmd_b_prev = 3'b0;
  mcu2_drif_dram_cmd_c_prev = 3'b0;

  mcu3_drif_dram_cmd_a_prev = 3'b0;
  mcu3_drif_dram_cmd_b_prev = 3'b0;
  mcu3_drif_dram_cmd_c_prev = 3'b0;
end

//------------------------------------------------------
// SCR Checker for NO CMD other than NOP/REF/DATA(Slotb)
//------------------------------------------------------

always @(posedge (drl2clk && enabled)) 
begin

  mcu0_drif_dram_cmd_a_prev <= mcu0_drif_dram_cmd_a;
  mcu0_drif_dram_cmd_b_prev <= mcu0_drif_dram_cmd_b;
  mcu0_drif_dram_cmd_c_prev <= mcu0_drif_dram_cmd_c;

  mcu1_drif_dram_cmd_a_prev <= mcu1_drif_dram_cmd_a;
  mcu1_drif_dram_cmd_b_prev <= mcu1_drif_dram_cmd_b;
  mcu1_drif_dram_cmd_c_prev <= mcu1_drif_dram_cmd_c;

  mcu2_drif_dram_cmd_a_prev <= mcu2_drif_dram_cmd_a;
  mcu2_drif_dram_cmd_b_prev <= mcu2_drif_dram_cmd_b;
  mcu2_drif_dram_cmd_c_prev <= mcu2_drif_dram_cmd_c;

  mcu3_drif_dram_cmd_a_prev <= mcu3_drif_dram_cmd_a;
  mcu3_drif_dram_cmd_b_prev <= mcu3_drif_dram_cmd_b;
  mcu3_drif_dram_cmd_c_prev <= mcu3_drif_dram_cmd_c;

end 

//-------------------------
// SCR NOP Checker
//-------------------------

always @(posedge (mcu0_fbdic_scr_frame_req && enabled)) begin
  if (mcu0_drif_dram_cmd_a_prev || mcu0_drif_dram_cmd_b_prev || mcu0_drif_dram_cmd_c_prev)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: should not issue a CMD a cycle earlier than SCR frame req"); 

  if (mcu0_drif_dram_cmd_a || mcu0_drif_dram_cmd_b || mcu0_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: should not issue a CMD when SCR frame req is issued"); 

  @(posedge drl2clk);
  if (mcu0_drif_dram_cmd_a || mcu0_drif_dram_cmd_b || mcu0_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: should not issue a CMD 1 cycle after SCR frame req is issued"); 

  @(posedge drl2clk);
  if (mcu0_drif_dram_cmd_a || mcu0_drif_dram_cmd_b || mcu0_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: should not issue a CMD 2 cycles after SCR frame req is issued"); 

  @(posedge drl2clk);
  if (mcu0_drif_dram_cmd_a || mcu0_drif_dram_cmd_b || mcu0_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: should not issue a CMD 3 cycles after SCR frame req is issued"); 

  @(posedge drl2clk);
  if (mcu0_drif_dram_cmd_a || mcu0_drif_dram_cmd_b || mcu0_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: should not issue a CMD 4 cycles after SCR frame req is issued"); 

end

always @(posedge (mcu1_fbdic_scr_frame_req && enabled)) begin
  if (mcu1_drif_dram_cmd_a_prev || mcu1_drif_dram_cmd_b_prev || mcu1_drif_dram_cmd_c_prev)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: should not issue a CMD a cycle earlier than SCR frame req"); 

  if (mcu1_drif_dram_cmd_a || mcu1_drif_dram_cmd_b || mcu1_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: should not issue a CMD when SCR frame req is issued"); 

  @(posedge drl2clk);
  if (mcu1_drif_dram_cmd_a || mcu1_drif_dram_cmd_b || mcu1_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: should not issue a CMD 1 cycle after SCR frame req is issued"); 

  @(posedge drl2clk);
  if (mcu1_drif_dram_cmd_a || mcu1_drif_dram_cmd_b || mcu1_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: should not issue a CMD 2 cycles after SCR frame req is issued"); 

  @(posedge drl2clk);
  if (mcu1_drif_dram_cmd_a || mcu1_drif_dram_cmd_b || mcu1_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: should not issue a CMD 3 cycles after SCR frame req is issued"); 

  @(posedge drl2clk);
  if (mcu1_drif_dram_cmd_a || mcu1_drif_dram_cmd_b || mcu1_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: should not issue a CMD 4 cycles after SCR frame req is issued"); 

end

always @(posedge (mcu2_fbdic_scr_frame_req && enabled)) begin
  if (mcu2_drif_dram_cmd_a_prev || mcu2_drif_dram_cmd_b_prev || mcu2_drif_dram_cmd_c_prev)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: should not issue a CMD a cycle earlier than SCR frame req"); 

  if (mcu2_drif_dram_cmd_a || mcu2_drif_dram_cmd_b || mcu2_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: should not issue a CMD when SCR frame req is issued"); 

  @(posedge drl2clk);
  if (mcu2_drif_dram_cmd_a || mcu2_drif_dram_cmd_b || mcu2_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: should not issue a CMD 1 cycle after SCR frame req is issued"); 

  @(posedge drl2clk);
  if (mcu2_drif_dram_cmd_a || mcu2_drif_dram_cmd_b || mcu2_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: should not issue a CMD 2 cycles after SCR frame req is issued"); 

  @(posedge drl2clk);
  if (mcu2_drif_dram_cmd_a || mcu2_drif_dram_cmd_b || mcu2_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: should not issue a CMD 3 cycles after SCR frame req is issued"); 

  @(posedge drl2clk);
  if (mcu2_drif_dram_cmd_a || mcu2_drif_dram_cmd_b || mcu2_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: should not issue a CMD 4 cycles after SCR frame req is issued"); 

end

always @(posedge (mcu3_fbdic_scr_frame_req && enabled)) begin
  if (mcu3_drif_dram_cmd_a_prev || mcu3_drif_dram_cmd_b_prev || mcu3_drif_dram_cmd_c_prev)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: should not issue a CMD a cycle earlier than SCR frame req"); 

  if (mcu3_drif_dram_cmd_a || mcu3_drif_dram_cmd_b || mcu3_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: should not issue a CMD when SCR frame req is issued"); 

  @(posedge drl2clk);
  if (mcu3_drif_dram_cmd_a || mcu3_drif_dram_cmd_b || mcu3_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: should not issue a CMD 1 cycle after SCR frame req is issued"); 

  @(posedge drl2clk);
  if (mcu3_drif_dram_cmd_a || mcu3_drif_dram_cmd_b || mcu3_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: should not issue a CMD 2 cycles after SCR frame req is issued"); 

  @(posedge drl2clk);
  if (mcu3_drif_dram_cmd_a || mcu3_drif_dram_cmd_b || mcu3_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: should not issue a CMD 3 cycles after SCR frame req is issued"); 

  @(posedge drl2clk);
  if (mcu3_drif_dram_cmd_a || mcu3_drif_dram_cmd_b || mcu3_drif_dram_cmd_c)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: should not issue a CMD 4 cycles after SCR frame req is issued"); 

end

//-----------------------------
// SCR Frame request Monitor
//----------------------------- 

always @(posedge (mcu0_fbdic_scr_frame_req && enabled)) begin
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU0: SCR (Soft Channel Reset) Frame issued");
end

always @(posedge (mcu1_fbdic_scr_frame_req && enabled)) begin
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU1: SCR (Soft Channel Reset) Frame issued");
end

always @(posedge (mcu2_fbdic_scr_frame_req && enabled)) begin
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU2: SCR (Soft Channel Reset) Frame issued");
end

always @(posedge (mcu3_fbdic_scr_frame_req && enabled)) begin
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU3: SCR (Soft Channel Reset) Frame issued");
end

//-----------------------------
// SCR Status Response Monitor
//----------------------------- 

always @(posedge (mcu0_fbdic_scr_response_frame && enabled)) begin
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU0: SCR (Soft Channel Reset) Frame Response received");
end

always @(posedge (mcu1_fbdic_scr_response_frame && enabled)) begin
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU1: SCR (Soft Channel Reset) Frame Response received");
end

always @(posedge (mcu2_fbdic_scr_response_frame && enabled)) begin
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU2: SCR (Soft Channel Reset) Frame Response received");
end

always @(posedge (mcu3_fbdic_scr_response_frame && enabled)) begin
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU3: SCR (Soft Channel Reset) Frame Response received");
end

//-----------------------------
// Status Parity Detect Monitor
//----------------------------- 

always @ (posedge (mcu0_fbdic_status_parity_error && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU0: STATUS Parity err asserted");

always @ (posedge (mcu1_fbdic_status_parity_error && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU1: STATUS Parity err asserted");

always @ (posedge (mcu2_fbdic_status_parity_error && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU2: STATUS Parity err asserted");

always @ (posedge (mcu3_fbdic_status_parity_error && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU3: STATUS Parity err asserted");

always @ (negedge (mcu0_fbdic_status_parity_error && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU0: STATUS Parity err de-asserted");

always @ (negedge (mcu1_fbdic_status_parity_error && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU1: STATUS Parity err de-asserted");

always @ (negedge (mcu2_fbdic_status_parity_error && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU2: STATUS Parity err de-asserted");

always @ (negedge (mcu3_fbdic_status_parity_error && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU3: STATUS Parity err de-asserted");

//-----------------------------
// Status Alert Detect Monitor
//----------------------------- 

always @ (posedge (mcu0_fbdic_status_alert_error && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU0: STATUS Alert bit err asserted");

always @ (posedge (mcu1_fbdic_status_alert_error && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU1: STATUS Alert bit err asserted");

always @ (posedge (mcu2_fbdic_status_alert_error && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU2: STATUS Alert bit err asserted");

always @ (posedge (mcu3_fbdic_status_alert_error && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU3: STATUS Alert bit err asserted");

always @ (negedge (mcu0_fbdic_status_alert_error && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU0: STATUS Alert bit err de-asserted");

always @ (negedge (mcu1_fbdic_status_alert_error && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU1: STATUS Alert bit err de-asserted");

always @ (negedge (mcu2_fbdic_status_alert_error && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU2: STATUS Alert bit err de-asserted");

always @ (negedge (mcu3_fbdic_status_alert_error && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU3: STATUS Alert bit err de-asserted");


//-----------------------------
// Status Alert Detect Monitor
//----------------------------- 

always @ (posedge (mcu0_fbdic_alert_frame && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU0: STATUS Alert Frame err asserted");

always @ (posedge (mcu1_fbdic_alert_frame && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU1: STATUS Alert Frame err asserted");

always @ (posedge (mcu2_fbdic_alert_frame && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU2: STATUS Alert Frame err asserted");

always @ (posedge (mcu3_fbdic_alert_frame && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU3: STATUS Alert Frame err asserted");

always @ (negedge (mcu0_fbdic_alert_frame && enabled)) begin
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU0: STATUS Alert Frame err de-asserted");
end

always @ (negedge (mcu1_fbdic_alert_frame && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU1: STATUS Alert Frame err de-asserted");

always @ (negedge (mcu2_fbdic_alert_frame && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU2: STATUS Alert Frame err de-asserted");

always @ (negedge (mcu3_fbdic_alert_frame && enabled))
  `PR_DEBUG ("mcu_fmon", `DEBUG, "MCU3: STATUS Alert Frame err de-asserted");

//---------------------------------------------------
// Electrical Idle Checker
//---------------------------------------------------

reg [3:0] EI_CNT, EI_CNT_CYCLE;
reg EI_checker;

initial
begin
  EI_CNT = 3'h0;
  if ($test$plusargs("EI_checker_disable"))
     EI_checker = 1'b0;
  else
     EI_checker = 1'b1;

  if ($test$plusargs("RANDOM_PARAM"))
     EI_CNT_CYCLE = 4'hA;
  else
`ifdef NEC_FBDIMM
     EI_CNT_CYCLE = 4'hA;
`else
     EI_CNT_CYCLE = 4'h5;
`endif
end

always @ (posedge (drl2clk && EI_checker && enabled))
begin

  if ((fbdimm0a_rx_p_top == fbdimm0a_rx_n_top) && (fbdimm0b_rx_p_top == fbdimm0b_rx_n_top))
    EI_CNT = EI_CNT + 1'b1;
  else
    EI_CNT = 1'b0;

  if (EI_CNT == EI_CNT_CYCLE) begin
     if (mcu0_fbd0_elect_idle != 14'h3fff)
       `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: FBD0 Electrical Idle bits not set %x", mcu0_fbd0_elect_idle);
     if (mcu0_fbd1_elect_idle != 14'h3fff && chnl_type == 1'b1)
       `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: FBD1 Electrical Idle bits not set %x", mcu0_fbd1_elect_idle);
  end
end

//----------------------------------------------------
// SERDES Checkers (ENIDL)
//----------------------------------------------------

`ifdef MCUSAT
always @ (posedge (`MCU0.mcu_fsr0_cfgtx_enidl && enabled))
begin
   if (fbdic_fbd_state_0 != 8'h0)
     `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: ENIDL to SERDES should be asserted during DISABLE STATE");
end

always @ (negedge (`MCU0.mcu_fsr0_cfgtx_enidl && enabled))
begin
   if (fbdic_fbd_state_0 == 8'h0)
     `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: ENIDL to SERDES should not be de-asserted during DISABLE STATE");
end

`ifndef SNG_CHANNEL
always @ (posedge (`MCU0.mcu_fsr1_cfgtx_enidl && enabled))
if (chnl_type)
begin
   if (fbdic_fbd_state_0 != 8'h0)
     `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: ENIDL to SERDES should be asserted during DISABLE STATE");
end

always @ (negedge (`MCU0.mcu_fsr1_cfgtx_enidl && enabled))
if (chnl_type)
begin
   if (fbdic_fbd_state_0 == 8'h0)
     `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: ENIDL to SERDES should not be de-asserted during DISABLE STATE");
end
`endif

`endif

//---------------------------------------------------
// FBD Init Checkers
//---------------------------------------------------

reg [7:0] prev_fbdic_fbd_state_0;

initial prev_fbdic_fbd_state_0 = 8'h0;

always @ (fbdic_fbd_state_0)
if (enabled && ~dtm_enabled)
begin
   if (fbdic_fbd_state_0 == 8'h0)
   begin
     repeat (25) @ (posedge drl2clk);
     if (`MCU0.fbdic.fbdic_tdisable_done != 1'b0)
       `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: fbdic_tdisable_done bit should be reset during initial part of DISABLE STATE");
     if ((`MCU0.fbdic.fbdic_tcalibrate_done != 1'b0) && (prev_fbdic_fbd_state_0 != 8'h1))
       `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: fbdic_tcalibrate_done bit should be reset during DISABLE STATE");
     if (`MCU0.fbdic.fbdic_tclktrain_done[0] != 1'b0)
       `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: fbdic_tclktrain_done bit should be reset during DISABLE STATE");
     if (`MCU0.fbdic.fbdic_testing_done[0] != 1'b0)
       `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: fbdic_testing_done bit should be reset during DISABLE STATE");
     if (`MCU0.fbdic.fbdic_polling_done[0] != 1'b0)
       `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: fbdic_polling_done bit should be reset during DISABLE STATE");
     if (`MCU0.fbdic.fbdic_config_done[0] != 1'b0)
       `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: fbdic_config_done bit should be reset during DISABLE STATE");
   end
   prev_fbdic_fbd_state_0 = fbdic_fbd_state_0;
end


always @(posedge (drl2clk && enabled))
begin

 if (~dtm_enabled && fbd_init_check) 
 begin
  case (fbdic_fbd_state_0)
  8'h3: begin
         if (mcu0_fbdic_tclktrain_done[0] != 1'b1)
          `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: Training Done Bit should be asserted after TRAINING STATE"); 
       end
  8'h4: begin
         if (mcu0_fbdic_testing_done[0] != 1'b1)
          `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: Testing Done Bit should be asserted after TESTING STATE"); 
       end
  8'h5: begin
         if (mcu0_fbdic_polling_done[0] != 1'b1)
          `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: Polling Done Bit should be asserted after POLLING STATE"); 
       end
  8'h6: begin
         if (mcu0_fbdic_config_done[0] != 1'b1)
          `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: Config Done Bit should be asserted after CONFIG STATE"); 
       end
  default: begin
           end
  endcase

  case (fbdic_fbd_state_1)
  8'h3: begin
         if (mcu1_fbdic_tclktrain_done[0] != 1'b1)
          `PR_ERROR ("mcu_fmon", `ERROR, "MCU1: Training Done Bit should be asserted after TRAINING STATE"); 
       end
  8'h4: begin
         if (mcu1_fbdic_testing_done[0] != 1'b1)
          `PR_ERROR ("mcu_fmon", `ERROR, "MCU1: Testing Done Bit should be asserted after TESTING STATE"); 
       end
  8'h5: begin
         if (mcu1_fbdic_polling_done[0] != 1'b1)
          `PR_ERROR ("mcu_fmon", `ERROR, "MCU1: Polling Done Bit should be asserted after POLLING STATE"); 
       end
  8'h6: begin
         if (mcu1_fbdic_config_done[0] != 1'b1)
          `PR_ERROR ("mcu_fmon", `ERROR, "MCU1: Config Done Bit should be asserted after CONFIG STATE"); 
       end
  default: begin
           end
  endcase

  case (fbdic_fbd_state_2)
  8'h3: begin
         if (mcu2_fbdic_tclktrain_done[0] != 1'b1)
          `PR_ERROR ("mcu_fmon", `ERROR, "MCU2: Training Done Bit should be asserted after TRAINING STATE"); 
       end
  8'h4: begin
         if (mcu2_fbdic_testing_done[0] != 1'b1)
          `PR_ERROR ("mcu_fmon", `ERROR, "MCU2: Testing Done Bit should be asserted after TESTING STATE"); 
       end
  8'h5: begin
         if (mcu2_fbdic_polling_done[0] != 1'b1)
          `PR_ERROR ("mcu_fmon", `ERROR, "MCU2: Polling Done Bit should be asserted after POLLING STATE"); 
       end
  8'h6: begin
         if (mcu2_fbdic_config_done[0] != 1'b1)
          `PR_ERROR ("mcu_fmon", `ERROR, "MCU2: Config Done Bit should be asserted after CONFIG STATE"); 
       end
  default: begin
           end
  endcase

  case (fbdic_fbd_state_3)
  8'h3: begin
         if (mcu3_fbdic_tclktrain_done[0] != 1'b1)
          `PR_ERROR ("mcu_fmon", `ERROR, "MCU3: Training Done Bit should be asserted after TRAINING STATE"); 
       end
  8'h4: begin
         if (mcu3_fbdic_testing_done[0] != 1'b1)
          `PR_ERROR ("mcu_fmon", `ERROR, "MCU3: Testing Done Bit should be asserted after TESTING STATE"); 
       end
  8'h5: begin
         if (mcu3_fbdic_polling_done[0] != 1'b1)
          `PR_ERROR ("mcu_fmon", `ERROR, "MCU3: Polling Done Bit should be asserted after POLLING STATE"); 
       end
  8'h6: begin
         if (mcu3_fbdic_config_done[0] != 1'b1)
          `PR_ERROR ("mcu_fmon", `ERROR, "MCU3: Config Done Bit should be asserted after CONFIG STATE"); 
       end
  default: begin
           end
  endcase
 end

end

always @(posedge (drl2clk && enabled))
begin

if(!mcu0_training_err_enable)
begin
#(`SMPL);
  if (mcu0_fbdic_tclktrain_done[1] == 1'b1)
    `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: Training Error Bit asserted"); 

  if (mcu0_fbdic_testing_done[1] == 1'b1)
    `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: Testing Error Bit asserted"); 

  if (mcu0_fbdic_polling_done[1] == 1'b1)
    `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: Polling Error Bit asserted"); 

  if (mcu0_fbdic_config_done[1] == 1'b1)
    `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: Config Error Bit asserted"); 
end

if(!mcu1_training_err_enable)
begin
#(`SMPL);
  if (mcu1_fbdic_tclktrain_done[1] == 1'b1)
    `PR_ERROR ("mcu_fmon", `ERROR, "MCU1: Training Error Bit asserted"); 

  if (mcu1_fbdic_testing_done[1] == 1'b1)
    `PR_ERROR ("mcu_fmon", `ERROR, "MCU1: Testing Error Bit asserted"); 

  if (mcu1_fbdic_polling_done[1] == 1'b1)
    `PR_ERROR ("mcu_fmon", `ERROR, "MCU1: Polling Error Bit asserted"); 

  if (mcu1_fbdic_config_done[1] == 1'b1)
    `PR_ERROR ("mcu_fmon", `ERROR, "MCU1: Config Error Bit asserted"); 

end

if(!mcu2_training_err_enable)
begin
#(`SMPL);
  if (mcu2_fbdic_tclktrain_done[1] == 1'b1)
    `PR_ERROR ("mcu_fmon", `ERROR, "MCU2: Training Error Bit asserted"); 

  if (mcu2_fbdic_testing_done[1] == 1'b1)
    `PR_ERROR ("mcu_fmon", `ERROR, "MCU2: Testing Error Bit asserted"); 

  if (mcu2_fbdic_polling_done[1] == 1'b1)
    `PR_ERROR ("mcu_fmon", `ERROR, "MCU2: Polling Error Bit asserted"); 

  if (mcu2_fbdic_config_done[1] == 1'b1)
    `PR_ERROR ("mcu_fmon", `ERROR, "MCU2: Config Error Bit asserted"); 

end

if(!mcu3_training_err_enable)
begin
#(`SMPL);
  if (mcu3_fbdic_tclktrain_done[1] == 1'b1)
    `PR_ERROR ("mcu_fmon", `ERROR, "MCU3: Training Error Bit asserted"); 

  if (mcu3_fbdic_testing_done[1] == 1'b1)
    `PR_ERROR ("mcu_fmon", `ERROR, "MCU3: Testing Error Bit asserted"); 

  if (mcu3_fbdic_polling_done[1] == 1'b1)
    `PR_ERROR ("mcu_fmon", `ERROR, "MCU3: Polling Error Bit asserted"); 

  if (mcu3_fbdic_config_done[1] == 1'b1)
    `PR_ERROR ("mcu_fmon", `ERROR, "MCU3: Config Error Bit asserted"); 
end

end

//----------------------------------------------------------
// Arbritration/Collision Checkers
//----------------------------------------------------------

// Make sure CMDs sent from DRIF -> FBDIC are asserted for 
// 2 cycles if sync_frame req are asserted at same time

//-----
// MCU0

always @ (posedge (mcu0_drif_ucb_wr_req_vld && fbdic_sync_frame_req_0 && enabled))
begin
  mcu0_drif_ucb_wr_req_vld_REG = mcu0_drif_ucb_wr_req_vld;
  @ (posedge drl2clk);
  if (mcu0_drif_ucb_wr_req_vld != mcu0_drif_ucb_wr_req_vld_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: DRIF needs to assert drif_ucb_wr_req_vld for 1 more cycle");
end
    
always @ (posedge (mcu0_drif_ucb_rd_req_vld && fbdic_sync_frame_req_0 && enabled))
begin
  mcu0_drif_ucb_rd_req_vld_REG = mcu0_drif_ucb_rd_req_vld;
  @ (posedge drl2clk);
  if (mcu0_drif_ucb_rd_req_vld != mcu0_drif_ucb_rd_req_vld_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: DRIF needs to assert drif_ucb_rd_req_vld for 1 more cycle");
end

always @ (mcu0_drif_dram_cmd_a)
if (enabled && fbdic_sync_frame_req_0 && (mcu0_drif_dram_cmd_a==`ACT || mcu0_drif_dram_cmd_a==`WR || mcu0_drif_dram_cmd_a==`RD))
begin
  mcu0_drif_dram_cmd_a_REG = mcu0_drif_dram_cmd_a; 
  @ (posedge drl2clk);
  if (mcu0_drif_dram_cmd_a != mcu0_drif_dram_cmd_a_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: DRIF needs to assert mcu0_drif_dram_cmd_a for 1 more cycle");
end

always @ (mcu0_drif_dram_cmd_b)
if (enabled && fbdic_sync_frame_req_0 && (mcu0_drif_dram_cmd_b==`ACT || mcu0_drif_dram_cmd_b==`WR))
begin
  mcu0_drif_dram_cmd_b_REG = mcu0_drif_dram_cmd_b; 
  @ (posedge drl2clk);
  if (mcu0_drif_dram_cmd_b != mcu0_drif_dram_cmd_b_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: DRIF needs to assert mcu0_drif_dram_cmd_b for 1 more cycle");
end

always @ (mcu0_drif_dram_cmd_c)
if (enabled && fbdic_sync_frame_req_0 && (mcu0_drif_dram_cmd_c==`ACT || mcu0_drif_dram_cmd_c==`WR))
begin
  mcu0_drif_dram_cmd_c_REG = mcu0_drif_dram_cmd_c; 
  @ (posedge drl2clk);
  if (mcu0_drif_dram_cmd_c != mcu0_drif_dram_cmd_c_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: DRIF needs to assert mcu0_drif_dram_cmd_c for 1 more cycle");
end

//-----
// MCU1

always @ (posedge (mcu1_drif_ucb_wr_req_vld && fbdic_sync_frame_req_1 && enabled))
begin
  mcu1_drif_ucb_wr_req_vld_REG = mcu1_drif_ucb_wr_req_vld;
  @ (posedge drl2clk);
  if (mcu1_drif_ucb_wr_req_vld != mcu1_drif_ucb_wr_req_vld_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: DRIF needs to assert drif_ucb_wr_req_vld for 1 more cycle");
end
    
always @ (posedge (mcu1_drif_ucb_rd_req_vld && fbdic_sync_frame_req_1 && enabled))
begin
  mcu1_drif_ucb_rd_req_vld_REG = mcu1_drif_ucb_rd_req_vld;
  @ (posedge drl2clk);
  if (mcu1_drif_ucb_rd_req_vld != mcu1_drif_ucb_rd_req_vld_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: DRIF needs to assert drif_ucb_rd_req_vld for 1 more cycle");
end

always @ (mcu1_drif_dram_cmd_a)
if (enabled && fbdic_sync_frame_req_1 && (mcu1_drif_dram_cmd_a==`ACT || mcu1_drif_dram_cmd_a==`WR || mcu1_drif_dram_cmd_a==`RD))
begin
  mcu1_drif_dram_cmd_a_REG = mcu1_drif_dram_cmd_a; 
  @ (posedge drl2clk);
  if (mcu1_drif_dram_cmd_a != mcu1_drif_dram_cmd_a_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: DRIF needs to assert mcu1_drif_dram_cmd_a for 1 more cycle");
end

always @ (mcu1_drif_dram_cmd_b)
if (enabled && fbdic_sync_frame_req_1 && (mcu1_drif_dram_cmd_b==`ACT || mcu1_drif_dram_cmd_b==`WR))
begin
  mcu1_drif_dram_cmd_b_REG = mcu1_drif_dram_cmd_b; 
  @ (posedge drl2clk);
  if (mcu1_drif_dram_cmd_b != mcu1_drif_dram_cmd_b_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: DRIF needs to assert mcu1_drif_dram_cmd_b for 1 more cycle");
end

always @ (mcu1_drif_dram_cmd_c)
if (enabled && fbdic_sync_frame_req_1 && (mcu1_drif_dram_cmd_c==`ACT || mcu1_drif_dram_cmd_c==`WR))
begin
  mcu1_drif_dram_cmd_c_REG = mcu1_drif_dram_cmd_c; 
  @ (posedge drl2clk);
  if (mcu1_drif_dram_cmd_c != mcu1_drif_dram_cmd_c_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: DRIF needs to assert mcu1_drif_dram_cmd_c for 1 more cycle");
end

//-----
// MCU2

always @ (posedge (mcu2_drif_ucb_wr_req_vld && fbdic_sync_frame_req_2 && enabled))
begin
  mcu2_drif_ucb_wr_req_vld_REG = mcu2_drif_ucb_wr_req_vld;
  @ (posedge drl2clk);
  if (mcu2_drif_ucb_wr_req_vld != mcu2_drif_ucb_wr_req_vld_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: DRIF needs to assert drif_ucb_wr_req_vld for 1 more cycle");
end
    
always @ (posedge (mcu2_drif_ucb_rd_req_vld && fbdic_sync_frame_req_2 && enabled))
begin
  mcu2_drif_ucb_rd_req_vld_REG = mcu2_drif_ucb_rd_req_vld;
  @ (posedge drl2clk);
  if (mcu2_drif_ucb_rd_req_vld != mcu2_drif_ucb_rd_req_vld_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: DRIF needs to assert drif_ucb_rd_req_vld for 1 more cycle");
end

always @ (mcu2_drif_dram_cmd_a)
if (enabled && fbdic_sync_frame_req_2 && (mcu2_drif_dram_cmd_a==`ACT || mcu2_drif_dram_cmd_a==`WR || mcu2_drif_dram_cmd_a==`RD))
begin
  mcu2_drif_dram_cmd_a_REG = mcu2_drif_dram_cmd_a; 
  @ (posedge drl2clk);
  if (mcu2_drif_dram_cmd_a != mcu2_drif_dram_cmd_a_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: DRIF needs to assert mcu2_drif_dram_cmd_a for 1 more cycle");
end

always @ (mcu2_drif_dram_cmd_b)
if (enabled && fbdic_sync_frame_req_2 && (mcu2_drif_dram_cmd_b==`ACT || mcu2_drif_dram_cmd_b==`WR))
begin
  mcu2_drif_dram_cmd_b_REG = mcu2_drif_dram_cmd_b; 
  @ (posedge drl2clk);
  if (mcu2_drif_dram_cmd_b != mcu2_drif_dram_cmd_b_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: DRIF needs to assert mcu2_drif_dram_cmd_b for 1 more cycle");
end

always @ (mcu2_drif_dram_cmd_c)
if (enabled && fbdic_sync_frame_req_2 && (mcu2_drif_dram_cmd_c==`ACT || mcu2_drif_dram_cmd_c==`WR))
begin
  mcu2_drif_dram_cmd_c_REG = mcu2_drif_dram_cmd_c; 
  @ (posedge drl2clk);
  if (mcu2_drif_dram_cmd_c != mcu2_drif_dram_cmd_c_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: DRIF needs to assert mcu2_drif_dram_cmd_c for 1 more cycle");
end

//-----
// MCU3

always @ (posedge (mcu3_drif_ucb_wr_req_vld && fbdic_sync_frame_req_3 && enabled))
begin
  mcu3_drif_ucb_wr_req_vld_REG = mcu3_drif_ucb_wr_req_vld;
  @ (posedge drl2clk);
  if (mcu3_drif_ucb_wr_req_vld != mcu3_drif_ucb_wr_req_vld_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: DRIF needs to assert drif_ucb_wr_req_vld for 1 more cycle");
end
    
always @ (posedge (mcu3_drif_ucb_rd_req_vld && fbdic_sync_frame_req_3 && enabled))
begin
  mcu3_drif_ucb_rd_req_vld_REG = mcu3_drif_ucb_rd_req_vld;
  @ (posedge drl2clk);
  if (mcu3_drif_ucb_rd_req_vld != mcu3_drif_ucb_rd_req_vld_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: DRIF needs to assert drif_ucb_rd_req_vld for 1 more cycle");
end

always @ (mcu3_drif_dram_cmd_a)
if (enabled && fbdic_sync_frame_req_3 && (mcu3_drif_dram_cmd_a==`ACT || mcu3_drif_dram_cmd_a==`WR || mcu3_drif_dram_cmd_a==`RD))
begin
  mcu3_drif_dram_cmd_a_REG = mcu3_drif_dram_cmd_a; 
  @ (posedge drl2clk);
  if (mcu3_drif_dram_cmd_a != mcu3_drif_dram_cmd_a_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: DRIF needs to assert mcu3_drif_dram_cmd_a for 1 more cycle");
end

always @ (mcu3_drif_dram_cmd_b)
if (enabled && fbdic_sync_frame_req_3 && (mcu3_drif_dram_cmd_b==`ACT || mcu3_drif_dram_cmd_b==`WR))
begin
  mcu3_drif_dram_cmd_b_REG = mcu3_drif_dram_cmd_b; 
  @ (posedge drl2clk);
  if (mcu3_drif_dram_cmd_b != mcu3_drif_dram_cmd_b_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: DRIF needs to assert mcu3_drif_dram_cmd_b for 1 more cycle");
end

always @ (mcu3_drif_dram_cmd_c)
if (enabled && fbdic_sync_frame_req_3 && (mcu3_drif_dram_cmd_c==`ACT || mcu3_drif_dram_cmd_c==`WR))
begin
  mcu3_drif_dram_cmd_c_REG = mcu3_drif_dram_cmd_c; 
  @ (posedge drl2clk);
  if (mcu3_drif_dram_cmd_c != mcu3_drif_dram_cmd_c_REG)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: DRIF needs to assert mcu3_drif_dram_cmd_c for 1 more cycle");
end

//-------------------------
// Refresh Checker Signals
//-------------------------

always @(posedge (drl2clk && enabled)) 
begin
  if (mcu0_drif_mcu_state_next == 5'h5) 
  begin
  if (ref_state5_cycle_0 < 4) // wait for 4 cycles as auto ref is issued
    ref_state5_cycle_0 = ref_state5_cycle_0 + 1;
  else
    begin
    if ((mcu0_drif_dram_cmd_a != 3'b0) || (mcu0_drif_dram_cmd_b != 3'b0 && mcu0_drif_dram_cmd_b != 3'h5) || (mcu0_drif_dram_cmd_c != 3'b0))
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: Issued CMD other than NOP during Self Refresh STATE");
    end
  end
  else
    ref_state5_cycle_0 = 0;

  if (mcu0_drif_mcu_state_next == 5'h6) 
  begin
  if (ref_state6_cycle_0 < 4) // wait for 4 cycles as auto ref is issued
    ref_state6_cycle_0 = ref_state6_cycle_0 + 1;
  else
    begin
    if ((mcu0_drif_dram_cmd_a != 3'b0) || (mcu0_drif_dram_cmd_b != 3'b0 && mcu0_drif_dram_cmd_b != 3'h5) || (mcu0_drif_dram_cmd_c != 3'b0))
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU0: Issued CMD other than NOP during Power Down STATE");
    end
  end
  else
    ref_state6_cycle_0 = 0;

  if (mcu1_drif_mcu_state_next == 5'h5) 
  begin
  if (ref_state5_cycle_1 < 4) // wait for 4 cycles as auto ref is issued
    ref_state5_cycle_1 = ref_state5_cycle_1 + 1;
  else
    begin
    if ((mcu1_drif_dram_cmd_a != 3'b0) || (mcu1_drif_dram_cmd_b != 3'b0 && mcu1_drif_dram_cmd_b != 3'h5) || (mcu1_drif_dram_cmd_c != 3'b0))
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU1: Issued CMD other than NOP during Self Refresh STATE");
    end
  end
  else
    ref_state5_cycle_1 = 0;

  if (mcu1_drif_mcu_state_next == 5'h6) 
  begin
  if (ref_state6_cycle_1 < 4) // wait for 4 cycles as auto ref is issued
    ref_state6_cycle_1 = ref_state6_cycle_1 + 1;
  else
    begin
    if ((mcu1_drif_dram_cmd_a != 3'b0) || (mcu1_drif_dram_cmd_b != 3'b0 && mcu1_drif_dram_cmd_b != 3'h5) || (mcu1_drif_dram_cmd_c != 3'b0))
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU1: Issued CMD other than NOP during Power Down STATE");
    end
  end
  else
    ref_state6_cycle_1 = 0;

  if (mcu2_drif_mcu_state_next == 5'h5) 
  begin
  if (ref_state5_cycle_2 < 4) // wait for 4 cycles as auto ref is issued
    ref_state5_cycle_2 = ref_state5_cycle_2 + 1;
  else
    begin
    if ((mcu2_drif_dram_cmd_a != 3'b0) || (mcu2_drif_dram_cmd_b != 3'b0 && mcu2_drif_dram_cmd_b != 3'h5) || (mcu2_drif_dram_cmd_c != 3'b0))
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU2: Issued CMD other than NOP during Self Refresh STATE");
    end
  end
  else
    ref_state5_cycle_2 = 0;

  if (mcu2_drif_mcu_state_next == 5'h6) 
  begin
  if (ref_state6_cycle_2 < 4) // wait for 4 cycles as auto ref is issued
    ref_state6_cycle_2 = ref_state6_cycle_2 + 1;
  else
    begin
    if ((mcu2_drif_dram_cmd_a != 3'b0) || (mcu2_drif_dram_cmd_b != 3'b0 && mcu2_drif_dram_cmd_b != 3'h5) || (mcu2_drif_dram_cmd_c != 3'b0))
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU2: Issued CMD other than NOP during Power Down STATE");
    end
  end
  else
    ref_state6_cycle_2 = 0;

  if (mcu3_drif_mcu_state_next == 5'h5) 
  begin
  if (ref_state5_cycle_3 < 4) // wait for 4 cycles as auto ref is issued
    ref_state5_cycle_3 = ref_state5_cycle_3 + 1;
  else
    begin
    if ((mcu3_drif_dram_cmd_a != 3'b0) || (mcu3_drif_dram_cmd_b != 3'b0 && mcu3_drif_dram_cmd_b != 3'h5) || (mcu3_drif_dram_cmd_c != 3'b0))
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU3: Issued CMD other than NOP during Self Refresh STATE");
    end
  end
  else
    ref_state5_cycle_3 = 0;

  if (mcu3_drif_mcu_state_next == 5'h6) 
  begin
  if (ref_state6_cycle_3 < 4) // wait for 4 cycles as auto ref is issued
    ref_state6_cycle_3 = ref_state6_cycle_3 + 1;
  else
    begin
    if ((mcu3_drif_dram_cmd_a != 3'b0) || (mcu3_drif_dram_cmd_b != 3'b0 && mcu3_drif_dram_cmd_b != 3'h5) || (mcu3_drif_dram_cmd_c != 3'b0))
      `PR_ERROR ("mcu_fmon", `ERROR, "MCU3: Issued CMD other than NOP during Power Down STATE");
    end
  end
  else
    ref_state6_cycle_3 = 0;

end

//-------------------------------------------------
// FBD Channel Error Injection Scheme
//-------------------------------------------------

integer status1,status2,status3,status4,status5,status6,status7,status8,status9,status10,status11,status12,status13,status14,status15,status16,status17,status18,status19,status20;

initial 
begin
  mcu0_sb_bit_time_mask = 12'h1;
  mcu1_sb_bit_time_mask = 12'h1;
  mcu2_sb_bit_time_mask = 12'h1;
  mcu3_sb_bit_time_mask = 12'h1;

  mcu0_nb_bit_time_mask = 12'h1;
  mcu1_nb_bit_time_mask = 12'h1;
  mcu2_nb_bit_time_mask = 12'h1;
  mcu3_nb_bit_time_mask = 12'h1;

  mcu0_sb_lane_mask = 10'h1;
  mcu1_sb_lane_mask = 10'h1;
  mcu2_sb_lane_mask = 10'h1;
  mcu3_sb_lane_mask = 10'h1;

  mcu0_nb_lane_mask = 14'h1;
  mcu1_nb_lane_mask = 14'h1;
  mcu2_nb_lane_mask = 14'h1;
  mcu3_nb_lane_mask = 14'h1;

  mcu0_l2t_mecc_err_r3_detected = 1'b0;
  mcu0_l2t0_scb_mecc_err_detected = 1'b0;
  mcu1_l2t_mecc_err_r3_detected = 1'b0;
  mcu1_l2t0_scb_mecc_err_detected = 1'b0;
  mcu2_l2t_mecc_err_r3_detected = 1'b0;
  mcu2_l2t0_scb_mecc_err_detected = 1'b0;
  mcu3_l2t_mecc_err_r3_detected = 1'b0;
  mcu3_l2t0_scb_mecc_err_detected = 1'b0;

`ifdef FC_CRC_INJECT
  mcu0_nb_channel_error_cnt=8'h0;
  mcu1_nb_channel_error_cnt=8'h0;
  mcu2_nb_channel_error_cnt=8'h0;
  mcu3_nb_channel_error_cnt=8'h0;

  mcu0_sb_channel_error_cnt=8'h0;
  mcu1_sb_channel_error_cnt=8'h0;
  mcu2_sb_channel_error_cnt=8'h0;
  mcu3_sb_channel_error_cnt=8'h0;
`else
  mcu0_nb_channel_error_cnt=8'h1;
  mcu1_nb_channel_error_cnt=8'h1;
  mcu2_nb_channel_error_cnt=8'h1;
  mcu3_nb_channel_error_cnt=8'h1;

  mcu0_sb_channel_error_cnt=8'h1;
  mcu1_sb_channel_error_cnt=8'h1;
  mcu2_sb_channel_error_cnt=8'h1;
  mcu3_sb_channel_error_cnt=8'h1;
`endif

  MCU0_NB_RANDOM_WEIGHT = 10;          // Default Random Weigthage 10%
  MCU1_NB_RANDOM_WEIGHT = 10;          // Default Random Weigthage 10%
  MCU2_NB_RANDOM_WEIGHT = 10;          // Default Random Weigthage 10%
  MCU3_NB_RANDOM_WEIGHT = 10;          // Default Random Weigthage 10%

  MCU0_SB_RANDOM_WEIGHT = 10;          // Default Random Weightage 10%
  MCU1_SB_RANDOM_WEIGHT = 10;          // Default Random Weightage 10%
  MCU2_SB_RANDOM_WEIGHT = 10;          // Default Random Weightage 10%
  MCU3_SB_RANDOM_WEIGHT = 10;          // Default Random Weightage 10%

  #5;

`ifndef AXIS
  status1 = $value$plusargs("mcu0_nb_channel_error_cnt=%h",mcu0_nb_channel_error_cnt);
  status2 = $value$plusargs("mcu1_nb_channel_error_cnt=%h",mcu1_nb_channel_error_cnt);
  status3 = $value$plusargs("mcu2_nb_channel_error_cnt=%h",mcu2_nb_channel_error_cnt);
  status4 = $value$plusargs("mcu3_nb_channel_error_cnt=%h",mcu3_nb_channel_error_cnt);

  status5 = $value$plusargs("mcu0_sb_channel_error_cnt=%h",mcu0_sb_channel_error_cnt);
  status6 = $value$plusargs("mcu1_sb_channel_error_cnt=%h",mcu1_sb_channel_error_cnt);
  status7 = $value$plusargs("mcu2_sb_channel_error_cnt=%h",mcu2_sb_channel_error_cnt);
  status8 = $value$plusargs("mcu3_sb_channel_error_cnt=%h",mcu3_sb_channel_error_cnt);

  status9 = $value$plusargs("mcu0_nb_random_weight=%d",MCU0_NB_RANDOM_WEIGHT);
  status10 = $value$plusargs("mcu1_nb_random_weight=%d",MCU1_NB_RANDOM_WEIGHT);
  status11 = $value$plusargs("mcu2_nb_random_weight=%d",MCU2_NB_RANDOM_WEIGHT);
  status12 = $value$plusargs("mcu3_nb_random_weight=%d",MCU3_NB_RANDOM_WEIGHT);

  status13 = $value$plusargs("mcu0_sb_random_weight=%d",MCU0_SB_RANDOM_WEIGHT);
  status14 = $value$plusargs("mcu1_sb_random_weight=%d",MCU1_SB_RANDOM_WEIGHT);
  status15 = $value$plusargs("mcu2_sb_random_weight=%d",MCU2_SB_RANDOM_WEIGHT);
  status16 = $value$plusargs("mcu3_sb_random_weight=%d",MCU3_SB_RANDOM_WEIGHT);
`endif

  mcu0_sb_random_val = MCU0_SB_RANDOM_WEIGHT;
  mcu1_sb_random_val = MCU1_SB_RANDOM_WEIGHT;
  mcu2_sb_random_val = MCU2_SB_RANDOM_WEIGHT;
  mcu3_sb_random_val = MCU3_SB_RANDOM_WEIGHT;

  mcu0_nb_random_val = MCU0_NB_RANDOM_WEIGHT;
  mcu1_nb_random_val = MCU1_NB_RANDOM_WEIGHT;
  mcu2_nb_random_val = MCU2_NB_RANDOM_WEIGHT;
  mcu3_nb_random_val = MCU3_NB_RANDOM_WEIGHT;

  if ($test$plusargs("MCU0_NB_ERR_ENABLE"))
    mcu0_nb_err_enable = 1;
  else
    mcu0_nb_err_enable = 0;

  if ($test$plusargs("MCU1_NB_ERR_ENABLE"))
    mcu1_nb_err_enable = 1;
  else
    mcu1_nb_err_enable = 0;

  if ($test$plusargs("MCU2_NB_ERR_ENABLE"))
    mcu2_nb_err_enable = 1;
  else
    mcu2_nb_err_enable = 0;

  if ($test$plusargs("MCU3_NB_ERR_ENABLE"))
    mcu3_nb_err_enable = 1;
  else
    mcu3_nb_err_enable = 0;

  if ($test$plusargs("MCU0_SB_ERR_ENABLE"))
    mcu0_sb_err_enable = 1;
  else
    mcu0_sb_err_enable = 0;

  if ($test$plusargs("MCU1_SB_ERR_ENABLE"))
    mcu1_sb_err_enable = 1;
  else
    mcu1_sb_err_enable = 0;

  if ($test$plusargs("MCU2_SB_ERR_ENABLE"))
    mcu2_sb_err_enable = 1;
  else
    mcu2_sb_err_enable = 0;

  if ($test$plusargs("MCU3_SB_ERR_ENABLE"))
    mcu3_sb_err_enable = 1;
  else
    mcu3_sb_err_enable = 0;

  if ($test$plusargs("MCU0_NB_ERR_RANDOM")) begin
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "MCU0: *** NB RANDOM ERR WEIGHT = %d ***", MCU0_NB_RANDOM_WEIGHT);
    mcu0_nb_err_random = 1;
  end
  else
    mcu0_nb_err_random = 0;

  if ($test$plusargs("MCU1_NB_ERR_RANDOM")) begin
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "MCU1: *** NB RANDOM ERR WEIGHT = %d ***", MCU1_NB_RANDOM_WEIGHT);
    mcu1_nb_err_random = 1;
  end
  else
    mcu1_nb_err_random = 0;

  if ($test$plusargs("MCU2_NB_ERR_RANDOM")) begin
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "MCU2: *** NB RANDOM ERR WEIGHT = %d ***", MCU2_NB_RANDOM_WEIGHT);
    mcu2_nb_err_random = 1;
  end
  else
    mcu2_nb_err_random = 0;

  if ($test$plusargs("MCU3_NB_ERR_RANDOM")) begin
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "MCU3: *** NB RANDOM ERR WEIGHT = %d ***", MCU3_NB_RANDOM_WEIGHT);
    mcu3_nb_err_random = 1;
  end
  else
    mcu3_nb_err_random = 0;

  if ($test$plusargs("MCU0_SB_ERR_RANDOM")) begin
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "MCU0: *** SB RANDOM ERR WEIGHT = %d ***", MCU0_SB_RANDOM_WEIGHT);
    mcu0_sb_err_random = 1;
  end
  else
    mcu0_sb_err_random = 0;

  if ($test$plusargs("MCU1_SB_ERR_RANDOM")) begin
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "MCU1: *** SB RANDOM ERR WEIGHT = %d ***", MCU1_SB_RANDOM_WEIGHT);
    mcu1_sb_err_random = 1;
  end
  else
    mcu1_sb_err_random = 0;

  if ($test$plusargs("MCU2_SB_ERR_RANDOM")) begin
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "MCU2: *** SB RANDOM ERR WEIGHT = %d ***", MCU2_SB_RANDOM_WEIGHT);
    mcu2_sb_err_random = 1;
  end
  else
    mcu2_sb_err_random = 0;

  if ($test$plusargs("MCU3_SB_ERR_RANDOM")) begin
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "MCU3: *** SB RANDOM ERR WEIGHT = %d ***", MCU3_SB_RANDOM_WEIGHT);
    mcu3_sb_err_random = 1;
  end
  else
    mcu3_sb_err_random = 0;

  if ($test$plusargs("MCU0_INJECT_FBU_ERR"))
    mcu0_inject_fbu_err = 1;
  else
    mcu0_inject_fbu_err = 0;

  if ($test$plusargs("MCU1_INJECT_FBU_ERR"))
    mcu1_inject_fbu_err = 1;
  else
    mcu1_inject_fbu_err = 0;

  if ($test$plusargs("MCU2_INJECT_FBU_ERR"))
    mcu2_inject_fbu_err = 1;
  else
    mcu2_inject_fbu_err = 0;

  if ($test$plusargs("MCU3_INJECT_FBU_ERR"))
    mcu3_inject_fbu_err = 1;
  else
    mcu3_inject_fbu_err = 0;

  if($test$plusargs("ALL_MCU_TRAINING_SEQ_ERR"))
  begin
   mcu0_training_err_enable = 1;
   mcu1_training_err_enable = 1;
   mcu2_training_err_enable = 1;
   mcu3_training_err_enable = 1;
  end
  else
  begin
   mcu0_training_err_enable = 0;
   mcu1_training_err_enable = 0;
   mcu2_training_err_enable = 0;
   mcu3_training_err_enable = 0;
  end

  if($test$plusargs("MCU0_TRAINING_SEQ_ERR"))
   mcu0_training_err_enable = 1;
  else
   mcu0_training_err_enable = 0;

  if($test$plusargs("MCU1_TRAINING_SEQ_ERR"))
   mcu1_training_err_enable = 1;
  else
   mcu1_training_err_enable = 0;

  if($test$plusargs("MCU2_TRAINING_SEQ_ERR"))
   mcu2_training_err_enable = 1;
  else
   mcu2_training_err_enable = 0;

  if($test$plusargs("MCU3_TRAINING_SEQ_ERR"))
   mcu3_training_err_enable = 1;
  else
   mcu3_training_err_enable = 0;

  if ($test$plusargs("MCU0_DISABLE_CH0_FBD_ERRINJ"))
    mcu0_enable_ch0_err_inj = 0;
  else
    mcu0_enable_ch0_err_inj = 1;

  if ($test$plusargs("MCU1_DISABLE_CH0_FBD_ERRINJ"))
    mcu1_enable_ch0_err_inj = 0;
  else
    mcu1_enable_ch0_err_inj = 1;

  if ($test$plusargs("MCU2_DISABLE_CH0_FBD_ERRINJ"))
    mcu2_enable_ch0_err_inj = 0;
  else
    mcu2_enable_ch0_err_inj = 1;

  if ($test$plusargs("MCU3_DISABLE_CH0_FBD_ERRINJ"))
    mcu3_enable_ch0_err_inj = 0;
  else
    mcu3_enable_ch0_err_inj = 1;

  if ($test$plusargs("MCU0_DISABLE_CH1_FBD_ERRINJ"))
    mcu0_enable_ch1_err_inj = 0;
  else
    mcu0_enable_ch1_err_inj = 1;

  if ($test$plusargs("MCU1_DISABLE_CH1_FBD_ERRINJ"))
    mcu1_enable_ch1_err_inj = 0;
  else
    mcu1_enable_ch1_err_inj = 1;

  if ($test$plusargs("MCU2_DISABLE_CH1_FBD_ERRINJ"))
    mcu2_enable_ch1_err_inj = 0;
  else
    mcu2_enable_ch1_err_inj = 1;

  if ($test$plusargs("MCU3_DISABLE_CH1_FBD_ERRINJ"))
    mcu3_enable_ch1_err_inj = 0;
  else
    mcu3_enable_ch1_err_inj = 1;

  if ($test$plusargs("MCU0_SB_CRC_MULTIPLE_LANES"))
    mcu0_sb_crc_multiple_lanes = 1;
  else
    mcu0_sb_crc_multiple_lanes = 0;

  if ($test$plusargs("MCU1_SB_CRC_MULTIPLE_LANES"))
    mcu1_sb_crc_multiple_lanes = 1;
  else
    mcu1_sb_crc_multiple_lanes = 0;

  if ($test$plusargs("MCU2_SB_CRC_MULTIPLE_LANES"))
    mcu2_sb_crc_multiple_lanes = 1;
  else
    mcu2_sb_crc_multiple_lanes = 0;

  if ($test$plusargs("MCU3_SB_CRC_MULTIPLE_LANES"))
    mcu3_sb_crc_multiple_lanes = 1;
  else
    mcu3_sb_crc_multiple_lanes = 0;

  if ($test$plusargs("MCU0_SB_CRC_MULTIPLE_BIT_TIMES"))
    mcu0_sb_crc_multiple_bit_times = 1;
  else
    mcu0_sb_crc_multiple_bit_times = 0;

  if ($test$plusargs("MCU1_SB_CRC_MULTIPLE_BIT_TIMES"))
    mcu1_sb_crc_multiple_bit_times = 1;
  else
    mcu1_sb_crc_multiple_bit_times = 0;

  if ($test$plusargs("MCU2_SB_CRC_MULTIPLE_BIT_TIMES"))
    mcu2_sb_crc_multiple_bit_times = 1;
  else
    mcu2_sb_crc_multiple_bit_times = 0;

  if ($test$plusargs("MCU3_SB_CRC_MULTIPLE_BIT_TIMES"))
    mcu3_sb_crc_multiple_bit_times = 1;
  else
    mcu3_sb_crc_multiple_bit_times = 0;

  if ($test$plusargs("MCU0_NB_CRC_MULTIPLE_LANES"))
    mcu0_nb_crc_multiple_lanes = 1;
  else
    mcu0_nb_crc_multiple_lanes = 0;

  if ($test$plusargs("MCU1_NB_CRC_MULTIPLE_LANES"))
    mcu1_nb_crc_multiple_lanes = 1;
  else
    mcu1_nb_crc_multiple_lanes = 0;

  if ($test$plusargs("MCU2_NB_CRC_MULTIPLE_LANES"))
    mcu2_nb_crc_multiple_lanes = 1;
  else
    mcu2_nb_crc_multiple_lanes = 0;

  if ($test$plusargs("MCU3_NB_CRC_MULTIPLE_LANES"))
    mcu3_nb_crc_multiple_lanes = 1;
  else
    mcu3_nb_crc_multiple_lanes = 0;

  if ($test$plusargs("MCU0_NB_CRC_MULTIPLE_BIT_TIMES"))
    mcu0_nb_crc_multiple_bit_times = 1;
  else
    mcu0_nb_crc_multiple_bit_times = 0;

  if ($test$plusargs("MCU1_NB_CRC_MULTIPLE_BIT_TIMES"))
    mcu1_nb_crc_multiple_bit_times = 1;
  else
    mcu1_nb_crc_multiple_bit_times = 0;

  if ($test$plusargs("MCU2_NB_CRC_MULTIPLE_BIT_TIMES"))
    mcu2_nb_crc_multiple_bit_times = 1;
  else
    mcu2_nb_crc_multiple_bit_times = 0;

  if ($test$plusargs("MCU3_NB_CRC_MULTIPLE_BIT_TIMES"))
    mcu3_nb_crc_multiple_bit_times = 1;
  else
    mcu3_nb_crc_multiple_bit_times = 0;

  if ($test$plusargs("MCU_BUG_111483"))
    mcu_bug_111483 = 1;
  else
    mcu_bug_111483 = 0;

  if ($test$plusargs("MCU_BUG_111547"))
    mcu_bug_111547 = 1;
  else
    mcu_bug_111547 = 0;

  if ($test$plusargs("MCU_BUG_111811"))
    mcu_bug_111811 = 1;
  else
    mcu_bug_111811 = 0;

  if ($test$plusargs("RAS_CORNER_CASE"))
    ras_corner_case = 1;
  else
    ras_corner_case = 0;

  mcu0_nb_cycle_cnt = 0;
  mcu1_nb_cycle_cnt = 0;
  mcu2_nb_cycle_cnt = 0;
  mcu3_nb_cycle_cnt = 0;

`ifndef AXIS
  status17 = $value$plusargs("mcu0_nb_cycle_cnt=%d",mcu0_nb_cycle_cnt);
  status18 = $value$plusargs("mcu1_nb_cycle_cnt=%d",mcu1_nb_cycle_cnt);
  status19 = $value$plusargs("mcu2_nb_cycle_cnt=%d",mcu2_nb_cycle_cnt);
  status20 = $value$plusargs("mcu3_nb_cycle_cnt=%d",mcu3_nb_cycle_cnt);
`endif

end

`ifdef MCUSAT_AND_FC
`ifdef FC_CRC_INJECT
      reg passed_bootEnd_mask=0;
      always @( `TOP.gOutOfBoot[63:0] ) begin
        if (!passed_bootEnd_mask && (`TOP.gOutOfBoot[63:0] === `TOP.verif_args.finish_mask[63:0]) ) begin
            repeat (1000) @ (posedge drl2clk); // wait until 1000 cycles after bootEnd, then start injecting
            passed_bootEnd_mask=1;
            end
      end
`endif            

// added the following to stop, re-start and re-stop CRC error injections
//NB
time stop_mcu0_nb_crc_inj_time=0, stop_mcu1_nb_crc_inj_time=0, stop_mcu2_nb_crc_inj_time=0, stop_mcu3_nb_crc_inj_time=0;
time restart_mcu0_nb_crc_inj_time=0, restart_mcu1_nb_crc_inj_time=0, restart_mcu2_nb_crc_inj_time=0, restart_mcu3_nb_crc_inj_time=0;
time restart_stop_mcu0_nb_crc_inj_time=0, restart_stop_mcu1_nb_crc_inj_time=0, restart_stop_mcu2_nb_crc_inj_time=0, restart_stop_mcu3_nb_crc_inj_time=0;
reg stop_mcu0_nb_mask=0, stop_mcu1_nb_mask=0, stop_mcu2_nb_mask=0, stop_mcu3_nb_mask=0;
reg restart_mcu0_nb_mask=0, restart_mcu1_nb_mask=0, restart_mcu2_nb_mask=0, restart_mcu3_nb_mask=0;
reg restart_stop_mcu0_nb_mask=0, restart_stop_mcu1_nb_mask=0, restart_stop_mcu2_nb_mask=0, restart_stop_mcu3_nb_mask=0;

//mcu0
initial 
begin
if($value$plusargs("STOP_MCU0_NB_CRC_INJ_TIME=%d",stop_mcu0_nb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"STOP_MCU0_NB_CRC_INJ_TIME\" has been set to %d",stop_mcu0_nb_crc_inj_time);
end
initial 
begin
if($value$plusargs("RESTART_MCU0_NB_CRC_INJ_TIME=%d",restart_mcu0_nb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"RESTART_MCU0_NB_CRC_INJ_TIME\" has been set to %d",restart_mcu0_nb_crc_inj_time);
end
initial 
begin
if($value$plusargs("RESTART_STOP_MCU0_NB_CRC_INJ_TIME=%d",restart_stop_mcu0_nb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"RESTART_STOP_MCU0_NB_CRC_INJ_TIME\" has been set to %d",restart_stop_mcu0_nb_crc_inj_time);
end

//mcu1
initial 
begin
if($value$plusargs("STOP_MCU1_NB_CRC_INJ_TIME=%d",stop_mcu1_nb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"STOP_MCU1_NB_CRC_INJ_TIME\" has been set to %d",stop_mcu1_nb_crc_inj_time);
end
initial 
begin
if($value$plusargs("RESTART_MCU1_NB_CRC_INJ_TIME=%d",restart_mcu1_nb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"RESTART_MCU1_NB_CRC_INJ_TIME\" has been set to %d",restart_mcu1_nb_crc_inj_time);
end
initial 
begin
if($value$plusargs("RESTART_STOP_MCU1_NB_CRC_INJ_TIME=%d",restart_stop_mcu1_nb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"RESTART_STOP_MCU1_NB_CRC_INJ_TIME\" has been set to %d",restart_stop_mcu1_nb_crc_inj_time);
end

//mcu2
initial 
begin
if($value$plusargs("STOP_MCU2_NB_CRC_INJ_TIME=%d",stop_mcu2_nb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"STOP_MCU2_NB_CRC_INJ_TIME\" has been set to %d",stop_mcu2_nb_crc_inj_time);
end
initial 
begin
if($value$plusargs("RESTART_MCU2_NB_CRC_INJ_TIME=%d",restart_mcu2_nb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"RESTART_MCU2_NB_CRC_INJ_TIME\" has been set to %d",restart_mcu2_nb_crc_inj_time);
end
initial 
begin
if($value$plusargs("RESTART_STOP_MCU2_NB_CRC_INJ_TIME=%d",restart_stop_mcu2_nb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"RESTART_STOP_MCU2_NB_CRC_INJ_TIME\" has been set to %d",restart_stop_mcu2_nb_crc_inj_time);
end

//mcu3
initial 
begin
if($value$plusargs("STOP_MCU3_NB_CRC_INJ_TIME=%d",stop_mcu3_nb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"STOP_MCU3_NB_CRC_INJ_TIME\" has been set to %d",stop_mcu3_nb_crc_inj_time);
end
initial 
begin
if($value$plusargs("RESTART_MCU3_NB_CRC_INJ_TIME=%d",restart_mcu3_nb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"RESTART_MCU3_NB_CRC_INJ_TIME\" has been set to %d",restart_mcu3_nb_crc_inj_time);
end
initial 
begin
if($value$plusargs("RESTART_STOP_MCU3_NB_CRC_INJ_TIME=%d",restart_stop_mcu3_nb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"RESTART_STOP_MCU3_NB_CRC_INJ_TIME\" has been set to %d",restart_stop_mcu3_nb_crc_inj_time);
end

//SB
time stop_mcu0_sb_crc_inj_time=0, stop_mcu1_sb_crc_inj_time=0, stop_mcu2_sb_crc_inj_time=0, stop_mcu3_sb_crc_inj_time=0;
time restart_mcu0_sb_crc_inj_time=0, restart_mcu1_sb_crc_inj_time=0, restart_mcu2_sb_crc_inj_time=0, restart_mcu3_sb_crc_inj_time=0;
time restart_stop_mcu0_sb_crc_inj_time=0, restart_stop_mcu1_sb_crc_inj_time=0, restart_stop_mcu2_sb_crc_inj_time=0, restart_stop_mcu3_sb_crc_inj_time=0;
reg stop_mcu0_sb_mask=0, stop_mcu1_sb_mask=0, stop_mcu2_sb_mask=0, stop_mcu3_sb_mask=0;
reg restart_mcu0_sb_mask=0, restart_mcu1_sb_mask=0, restart_mcu2_sb_mask=0, restart_mcu3_sb_mask=0;
reg restart_stop_mcu0_sb_mask=0, restart_stop_mcu1_sb_mask=0, restart_stop_mcu2_sb_mask=0, restart_stop_mcu3_sb_mask=0;

//mcu0
initial 
begin
if($value$plusargs("STOP_MCU0_SB_CRC_INJ_TIME=%d",stop_mcu0_sb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"STOP_MCU0_SB_CRC_INJ_TIME\" has been set to %d",stop_mcu0_sb_crc_inj_time);
end
initial 
begin
if($value$plusargs("RESTART_MCU0_SB_CRC_INJ_TIME=%d",restart_mcu0_sb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"RESTART_MCU0_SB_CRC_INJ_TIME\" has been set to %d",restart_mcu0_sb_crc_inj_time);
end
initial 
begin
if($value$plusargs("RESTART_STOP_MCU0_SB_CRC_INJ_TIME=%d",restart_stop_mcu0_sb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"RESTART_STOP_MCU0_SB_CRC_INJ_TIME\" has been set to %d",restart_stop_mcu0_sb_crc_inj_time);
end

//mcu1
initial 
begin
if($value$plusargs("STOP_MCU1_SB_CRC_INJ_TIME=%d",stop_mcu1_sb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"STOP_MCU1_SB_CRC_INJ_TIME\" has been set to %d",stop_mcu1_sb_crc_inj_time);
end
initial 
begin
if($value$plusargs("RESTART_MCU1_SB_CRC_INJ_TIME=%d",restart_mcu1_sb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"RESTART_MCU1_SB_CRC_INJ_TIME\" has been set to %d",restart_mcu1_sb_crc_inj_time);
end
initial 
begin
if($value$plusargs("RESTART_STOP_MCU1_SB_CRC_INJ_TIME=%d",restart_stop_mcu1_sb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"RESTART_STOP_MCU1_SB_CRC_INJ_TIME\" has been set to %d",restart_stop_mcu1_sb_crc_inj_time);
end

//mcu2
initial 
begin
if($value$plusargs("STOP_MCU2_SB_CRC_INJ_TIME=%d",stop_mcu2_sb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"STOP_MCU2_SB_CRC_INJ_TIME\" has been set to %d",stop_mcu2_sb_crc_inj_time);
end
initial 
begin
if($value$plusargs("RESTART_MCU2_SB_CRC_INJ_TIME=%d",restart_mcu2_sb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"RESTART_MCU2_SB_CRC_INJ_TIME\" has been set to %d",restart_mcu2_sb_crc_inj_time);
end
initial 
begin
if($value$plusargs("RESTART_STOP_MCU2_SB_CRC_INJ_TIME=%d",restart_stop_mcu2_sb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"RESTART_STOP_MCU2_SB_CRC_INJ_TIME\" has been set to %d",restart_stop_mcu2_sb_crc_inj_time);
end

//mcu3
initial 
begin
if($value$plusargs("STOP_MCU3_SB_CRC_INJ_TIME=%d",stop_mcu3_sb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"STOP_MCU3_SB_CRC_INJ_TIME\" has been set to %d",stop_mcu3_sb_crc_inj_time);
end
initial 
begin
if($value$plusargs("RESTART_MCU3_SB_CRC_INJ_TIME=%d",restart_mcu3_sb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"RESTART_MCU3_SB_CRC_INJ_TIME\" has been set to %d",restart_mcu3_sb_crc_inj_time);
end
initial 
begin
if($value$plusargs("RESTART_STOP_MCU3_SB_CRC_INJ_TIME=%d",restart_stop_mcu3_sb_crc_inj_time))
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Parameter \"RESTART_STOP_MCU3_SB_CRC_INJ_TIME\" has been set to %d",restart_stop_mcu3_sb_crc_inj_time);
end


integer mcu0_nb_err=0, mcu1_nb_err=0, mcu2_nb_err=0, mcu3_nb_err=0;
integer mcu0_sb_err=0, mcu1_sb_err=0, mcu2_sb_err=0, mcu3_sb_err=0;
reg inject_crc_mcu0_nb_mask=0, inject_crc_mcu1_nb_mask=0, inject_crc_mcu2_nb_mask=0, inject_crc_mcu3_nb_mask=0;
reg inject_crc_mcu0_sb_mask=0, inject_crc_mcu1_sb_mask=0, inject_crc_mcu2_sb_mask=0, inject_crc_mcu3_sb_mask=0;


reg inject_crc_mcu0_nb_errq_mask=0, inject_crc_mcu1_nb_errq_mask=0, inject_crc_mcu2_nb_errq_mask=0, inject_crc_mcu3_nb_errq_mask=0;
reg inject_crc_mcu0_sb_errq_mask=0, inject_crc_mcu1_sb_errq_mask=0, inject_crc_mcu2_sb_errq_mask=0, inject_crc_mcu3_sb_errq_mask=0;

/*
always  @(  posedge `MCU0.drif.reqq.drq0.drq_rdq_full or posedge `MCU0.drif.reqq.drq0.drq_wrq_full or
            posedge `MCU0.drif.reqq.drq1.drq_rdq_full or posedge `MCU0.drif.reqq.drq1.drq_wrq_full 
        )    begin
        if ( `MCU0.drif.reqq.drq0.drq_rdq_full ) `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** MCU0 drq0 RD queue is full !!");
        if ( `MCU0.drif.reqq.drq1.drq_rdq_full ) `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** MCU0 drq1 RD queue is full !!");
        if ( `MCU0.drif.reqq.drq0.drq_wrq_full ) `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** MCU0 drq0 WR queue is full !!");
        if ( `MCU0.drif.reqq.drq1.drq_wrq_full ) `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** MCU0 drq1 WR queue is full !!");
        if ($test$plusargs("INJECT_CRC_MCU0_NB_ERRQ")) begin
            inject_crc_mcu0_nb_errq_mask=0;
        end
        if ($test$plusargs("INJECT_CRC_MCU0_SB_ERRQ")) begin
            inject_crc_mcu0_sb_errq_mask=0;
        end
    end


always  @(  posedge `MCU1.drif.reqq.drq0.drq_rdq_full or posedge `MCU1.drif.reqq.drq0.drq_wrq_full or
            posedge `MCU1.drif.reqq.drq1.drq_rdq_full or posedge `MCU1.drif.reqq.drq1.drq_wrq_full 
        )    begin
        if ( `MCU1.drif.reqq.drq0.drq_rdq_full ) `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** MCU1 drq0 RD queue is full !!");
        if ( `MCU1.drif.reqq.drq1.drq_rdq_full ) `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** MCU1 drq1 RD queue is full !!");
        if ( `MCU1.drif.reqq.drq0.drq_wrq_full ) `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** MCU1 drq0 WR queue is full !!");
        if ( `MCU1.drif.reqq.drq1.drq_wrq_full ) `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** MCU1 drq1 WR queue is full !!");
        if ($test$plusargs("INJECT_CRC_MCU1_NB_ERRQ")) begin
            inject_crc_mcu1_nb_errq_mask=0;
        end
        if ($test$plusargs("INJECT_CRC_MCU1_SB_ERRQ")) begin
            inject_crc_mcu1_sb_errq_mask=0;
        end
    end


always  @(  posedge `MCU2.drif.reqq.drq0.drq_rdq_full or posedge `MCU2.drif.reqq.drq0.drq_wrq_full or
            posedge `MCU2.drif.reqq.drq1.drq_rdq_full or posedge `MCU2.drif.reqq.drq1.drq_wrq_full 
        )    begin
        if ( `MCU2.drif.reqq.drq0.drq_rdq_full ) `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** MCU2 drq0 RD queue is full !!");
        if ( `MCU2.drif.reqq.drq1.drq_rdq_full ) `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** MCU2 drq1 RD queue is full !!");
        if ( `MCU2.drif.reqq.drq0.drq_wrq_full ) `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** MCU2 drq0 WR queue is full !!");
        if ( `MCU2.drif.reqq.drq1.drq_wrq_full ) `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** MCU2 drq1 WR queue is full !!");
        if ($test$plusargs("INJECT_CRC_MCU2_NB_ERRQ")) begin
            inject_crc_mcu2_nb_errq_mask=0;
        end
        if ($test$plusargs("INJECT_CRC_MCU2_SB_ERRQ")) begin
            inject_crc_mcu2_sb_errq_mask=0;
        end
    end


always  @(  posedge `MCU3.drif.reqq.drq0.drq_rdq_full or posedge `MCU3.drif.reqq.drq0.drq_wrq_full or
            posedge `MCU3.drif.reqq.drq1.drq_rdq_full or posedge `MCU3.drif.reqq.drq1.drq_wrq_full 
        )    begin
        if ( `MCU3.drif.reqq.drq0.drq_rdq_full ) `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** MCU3 drq0 RD queue is full !!");
        if ( `MCU3.drif.reqq.drq1.drq_rdq_full ) `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** MCU3 drq1 RD queue is full !!");
        if ( `MCU3.drif.reqq.drq0.drq_wrq_full ) `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** MCU3 drq0 WR queue is full !!");
        if ( `MCU3.drif.reqq.drq1.drq_wrq_full ) `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** MCU3 drq1 WR queue is full !!");
        if ($test$plusargs("INJECT_CRC_MCU3_NB_ERRQ")) begin
            inject_crc_mcu3_nb_errq_mask=0;
        end
        if ($test$plusargs("INJECT_CRC_MCU3_SB_ERRQ")) begin
            inject_crc_mcu3_sb_errq_mask=0;
        end
    end
*/


//---------------------------------------------------------------
// NB CRC - Corrupt Read Data or Read Config Data Frame Mechanism 
//---------------------------------------------------------------
parameter BIT_TIMES =12;
parameter NB_LANES =14;
parameter SB_LANES =10;

// --- MCU0 ---

`ifdef FC_CRC_INJECT
reg [167:0] corrupted_mcu0_nb_lndskw0_data;
reg [167:0] corrupted_mcu0_nb_lndskw1_data;
integer mcu0_nb_quadword=1; //default is always the 1st quadword
initial begin
if ($value$plusargs("MCU0_NB_QUADWORD=%d",mcu0_nb_quadword)) begin
    if ( (mcu0_nb_quadword<1) || (mcu0_nb_quadword>4) ) `PR_ERROR ("mcu_fmon", `ERROR, "can only specify 1,2,3 or 4!");
    else `PR_ALWAYS ("mcu_fmon", `ALWAYS, "INFO: will inject CRC error on MCU0 NB quadword %d",mcu0_nb_quadword);
    end
end
`endif

reg NBQW1=0; reg NBQW2=0; reg NBQW3=0; reg NBQW4=0;
reg SBQW1=0; reg SBQW2=0; reg SBQW3=0; reg SBQW4=0;

function [167:0] return_168_bits_nb_mask;
input[11:0] mcu0_nb_bit_time_mask;
input[13:0] mcu0_nb_lane_mask;
begin
     return_168_bits_nb_mask=168'b0;
     if (mcu0_nb_bit_time_mask[0] ==1)  return_168_bits_nb_mask[13:0]    =   mcu0_nb_lane_mask[13:0];
     if (mcu0_nb_bit_time_mask[1] ==1)  return_168_bits_nb_mask[27:14]   =   mcu0_nb_lane_mask[13:0];
     if (mcu0_nb_bit_time_mask[2] ==1)  return_168_bits_nb_mask[41:28]   =   mcu0_nb_lane_mask[13:0];
     if (mcu0_nb_bit_time_mask[3] ==1)  return_168_bits_nb_mask[55:42]   =   mcu0_nb_lane_mask[13:0];
     if (mcu0_nb_bit_time_mask[4] ==1)  return_168_bits_nb_mask[69:56]   =   mcu0_nb_lane_mask[13:0];
     if (mcu0_nb_bit_time_mask[5] ==1)  return_168_bits_nb_mask[83:70]   =   mcu0_nb_lane_mask[13:0];
     if (mcu0_nb_bit_time_mask[6] ==1)  return_168_bits_nb_mask[97:84]   =   mcu0_nb_lane_mask[13:0];
     if (mcu0_nb_bit_time_mask[7] ==1)  return_168_bits_nb_mask[111:98]  =   mcu0_nb_lane_mask[13:0];
     if (mcu0_nb_bit_time_mask[8] ==1)  return_168_bits_nb_mask[125:112] =   mcu0_nb_lane_mask[13:0];
     if (mcu0_nb_bit_time_mask[9] ==1)  return_168_bits_nb_mask[139:126] =   mcu0_nb_lane_mask[13:0];
     if (mcu0_nb_bit_time_mask[10]==1)  return_168_bits_nb_mask[153:140] =   mcu0_nb_lane_mask[13:0];
     if (mcu0_nb_bit_time_mask[11]==1)  return_168_bits_nb_mask[167:154] =   mcu0_nb_lane_mask[13:0];
end
endfunction

`define MAX_CRC_ERRORS 16
reg [167:0] mcu0_nb_data_array_QW1 [0:`MAX_CRC_ERRORS-1];
reg [167:0] mcu0_nb_data_array_QW2 [0:`MAX_CRC_ERRORS-1];
reg [167:0] mcu0_nb_data_array_QW3 [0:`MAX_CRC_ERRORS-1];
reg [167:0] mcu0_nb_data_array_QW4 [0:`MAX_CRC_ERRORS-1];
integer mcu0_nb_data_array_QW1_cnt [0:`MAX_CRC_ERRORS-1];
integer mcu0_nb_data_array_QW2_cnt [0:`MAX_CRC_ERRORS-1];
integer mcu0_nb_data_array_QW3_cnt [0:`MAX_CRC_ERRORS-1];
integer mcu0_nb_data_array_QW4_cnt [0:`MAX_CRC_ERRORS-1];

integer i=0; integer j=-1;
reg found=0;
integer N=0;
reg trigger_NB=0;

integer delay_crc;
initial
    if (!$value$plusargs("DELAY_CRC=%d",delay_crc)) delay_crc=6;

always @ ( 
`ifdef FC_CRC_INJECT //for fullchip
                    posedge `MCU0.fbdic.fbdic_rddata_vld // for fullchip, check for all reads
`else //for MCUSAT
                    mcu0_drif_dram_cmd_a or 
                    `MCU0.fbdic.fbdic_config_reg_read or 
                    `MCU0.fbdic.fbdic_config_reg_write or 
                    `MCU0.fbdic.fbdic_sync_frame_req or 
                    `MCU0.fbdic.fbdic_scr_frame_req    
`endif
)
begin
if (enabled && ~ras_corner_case)
begin
`ifdef FC_CRC_INJECT 
if ( passed_bootEnd_mask==1 && !mcu0_esr_fbr && !mcu0_esr_fbu)
begin
N=N+1;
`endif

  // --------- Random NB CRC Err Injection --------
  if (mcu0_nb_err_random) begin
      
    if (mcu0_nb_crc_multiple_bit_times) begin
      mcu0_nb_bit_time_mask = ({$random} % 4095); // pick multiple bit times
      while (mcu0_nb_bit_time_mask==0) mcu0_nb_bit_time_mask = ({$random} % 4095);
      end
    else begin // pick any 1 random bit time
        mcu0_nb_bit_time_mask=1;
      mcu0_nb_random_bit_time = ({$random} % BIT_TIMES);
      while (mcu0_nb_random_bit_time==0) mcu0_nb_random_bit_time = ({$random} % BIT_TIMES);
      mcu0_nb_bit_time_mask = mcu0_nb_bit_time_mask << mcu0_nb_random_bit_time;
    end
    
    if (mcu0_nb_crc_multiple_lanes) begin
      mcu0_nb_lane_mask = ({$random} % 16383); // pick multiple lanes
      while (mcu0_nb_lane_mask==0) mcu0_nb_lane_mask = ({$random} % 16383);
`ifdef FC_CRC_INJECT
      mcu0_nb_lane_mask = mcu0_nb_lane_mask & 14'h3000; // for FC, pick only 13 and 14th lanes as they carry CRC bits on NB
`endif
      end
    else begin // pick any 1 random lane
        mcu0_nb_lane_mask=1;
`ifdef MCUSAT
      mcu0_nb_random_lane = ({$random} % NB_LANES);
      while (mcu0_nb_random_lane==0) mcu0_nb_random_lane = ({$random} % NB_LANES);
      mcu0_nb_lane_mask = mcu0_nb_lane_mask << mcu0_nb_random_lane;
`else
      mcu0_nb_random_lane = ({$random} % 2); // for now inside FC, pick one of 13th/14th lane
      mcu0_nb_lane_mask = mcu0_nb_lane_mask << (mcu0_nb_random_lane+12);
`endif
    end
`ifdef MCUSAT
    mcu0_nb_random_cycle = ({$random} % 3);
    mcu0_nb_random_val = ({$random} % 100);
    if (!(mcu0_nb_random_val > MCU0_NB_RANDOM_WEIGHT)) mcu0_nb_err_enable=1;
`else
    mcu0_nb_err_enable=1;
`endif
  end //if (mcu0_nb_err_random)

`ifdef FC_CRC_INJECT
  else if (mcu0_nb_err_enable) begin
      mcu0_nb_bit_time_mask=12'h1;
      mcu0_nb_lane_mask=14'h1000; // for FC, pick only the 13th lane
      end
`endif


//times to stop and restart
  if ( !stop_mcu0_nb_mask && !($time < stop_mcu0_nb_crc_inj_time) && !(stop_mcu0_nb_crc_inj_time == 0) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Stopping crc err injection on NB channel for MCU0, time now is %d",$time);
     force mcu0_nb_err_enable=0;
     stop_mcu0_nb_mask = 1;
    end
  else if ( !restart_mcu0_nb_mask && !($time < restart_mcu0_nb_crc_inj_time) && !(restart_mcu0_nb_crc_inj_time == 0) && (restart_mcu0_nb_crc_inj_time > stop_mcu0_nb_crc_inj_time) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Restarting crc err injection on NB channel for MCU0, time now is %d",$time);
     release mcu0_nb_err_enable;
     restart_mcu0_nb_mask=1;
     end
  else if ( !restart_stop_mcu0_nb_mask && !($time < restart_stop_mcu0_nb_crc_inj_time) && !(restart_stop_mcu0_nb_crc_inj_time == 0) && (restart_stop_mcu0_nb_crc_inj_time > restart_mcu0_nb_crc_inj_time) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Stopping the restarted crc err injection on NB channel for MCU0, time now is %d",$time);
     force mcu0_nb_err_enable=0;
     restart_stop_mcu0_nb_mask=1;
     end

// code for fullchip crc injection on both NB and SB has been completely changed 
// 11/02/2006
`ifdef FC_CRC_INJECT
    if (mcu0_nb_err_enable==1) begin
            trigger_NB=1;
    `PR_ALWAYS ("mcu_fmon", `ALWAYS, "INFO: CRC NB masks : mcu0_nb_bit_time_mask[11:0] is %b, mcu0_nb_lane_mask[13:0] is %b",mcu0_nb_bit_time_mask,mcu0_nb_lane_mask);
  
      found=0; i=0; j=-1;
      for (i=0; i<`MAX_CRC_ERRORS; i=i+1)
          begin
          if ( (mcu0_nb_data_array_QW1[i][167:0]==`MCU0.lndskw0_data[167:0] && found==0 && mcu0_nb_quadword==1) ||
               (mcu0_nb_data_array_QW2[i][167:0]==`MCU0.lndskw1_data[167:0] && found==0 && mcu0_nb_quadword==2) )
              //see if data already exists in array
              begin found=1; j=i; end
          if (found==0 && ( !(mcu0_nb_data_array_QW1[i][167:0]===168'bx) && mcu0_nb_quadword==1) ||
               ( !(mcu0_nb_data_array_QW2[i][167:0]===168'bx) && mcu0_nb_quadword==2) )
              //find the array index to put "new" data
              j=i;
          end
          if (found==0 && (N%delay_crc==1))
            begin
              if (mcu0_nb_quadword==1) begin
                  mcu0_nb_data_array_QW1[j+1][167:0]=`MCU0.lndskw0_data[167:0];
                 if (mcu0_inject_fbu_err==1) 
                    mcu0_nb_data_array_QW1_cnt[j+1]=3;
                 else
                    mcu0_nb_data_array_QW1_cnt[j+1]=1;
              end
              if (mcu0_nb_quadword==2) begin
                  mcu0_nb_data_array_QW2[j+1][167:0]=`MCU0.lndskw1_data[167:0];
                 if (mcu0_inject_fbu_err==1) 
                    mcu0_nb_data_array_QW2_cnt[j+1]=3;
                 else
                    mcu0_nb_data_array_QW2_cnt[j+1]=1;
              end
            end

    if ( (mcu0_inject_fbu_err==1 && found==1 && ( (mcu0_nb_quadword==1 && mcu0_nb_data_array_QW1_cnt[j]>0)
        || (mcu0_nb_quadword==2 && mcu0_nb_data_array_QW2_cnt[j]>0) ) ) ||
         (found==0 && ( (mcu0_nb_quadword==1 && mcu0_nb_data_array_QW1_cnt[j+1]>0)
        || (mcu0_nb_quadword==2 && mcu0_nb_data_array_QW2_cnt[j+1]>0) ) ) ) begin

    if (mcu0_nb_quadword==1) begin
                NBQW1=1;
    corrupted_mcu0_nb_lndskw0_data[167:0] = `MCU0.lndskw0_data[167:0] ^ ( return_168_bits_nb_mask ( mcu0_nb_bit_time_mask, mcu0_nb_lane_mask ) ) ;
    `PR_ALWAYS ("mcu_fmon", `ALWAYS, "INFO: MCU0 NB QW1: orig. data [167:0] was %x, modif. data [167:0] is %x",`MCU0.lndskw0_data[167:0],corrupted_mcu0_nb_lndskw0_data[167:0]);
    force `MCU0.lndskw0_data[167:0] = corrupted_mcu0_nb_lndskw0_data[167:0];
    @(posedge drl2clk);
    release `MCU0.lndskw0_data[167:0];
    end
    else if (mcu0_nb_quadword==2) begin
                NBQW2=1;
    corrupted_mcu0_nb_lndskw1_data[167:0] = `MCU0.lndskw1_data[167:0] ^ ( return_168_bits_nb_mask ( mcu0_nb_bit_time_mask, mcu0_nb_lane_mask ) ) ;
    `PR_ALWAYS ("mcu_fmon", `ALWAYS, "INFO: MCU0 NB QW2: orig. data [167:0] was %x, modif. data [167:0] is %x",`MCU0.lndskw1_data[167:0],corrupted_mcu0_nb_lndskw1_data[167:0]);
    force `MCU0.lndskw1_data[167:0] = corrupted_mcu0_nb_lndskw1_data[167:0];
    @(posedge drl2clk);
    release `MCU0.lndskw1_data[167:0];
    end
    end
    
    @(posedge drl2clk);

      found=0; i=0; j=-1;
      for (i=0; i<`MAX_CRC_ERRORS; i=i+1) 
          begin
          if ( (mcu0_nb_data_array_QW3[i][167:0]==`MCU0.lndskw0_data[167:0] && found==0 && mcu0_nb_quadword==3) ||
               (mcu0_nb_data_array_QW4[i][167:0]==`MCU0.lndskw1_data[167:0] && found==0 && mcu0_nb_quadword==4) )
              begin found=1; j=i; end
          if (found==0 && ( !(mcu0_nb_data_array_QW3[i][167:0]===168'bx) && mcu0_nb_quadword==3) ||
               ( !(mcu0_nb_data_array_QW4[i][167:0]===168'bx) && mcu0_nb_quadword==4) )
              j=i;
          end
          if (found==0 && (N%delay_crc==1))
            begin
              if (mcu0_nb_quadword==3) begin
                  mcu0_nb_data_array_QW3[j+1][167:0]=`MCU0.lndskw0_data[167:0];
                 if (mcu0_inject_fbu_err==1) 
                    mcu0_nb_data_array_QW3_cnt[j+1]=3;
                 else
                    mcu0_nb_data_array_QW3_cnt[j+1]=1;
              end
              if (mcu0_nb_quadword==4) begin
                  mcu0_nb_data_array_QW4[j+1][167:0]=`MCU0.lndskw1_data[167:0];
                 if (mcu0_inject_fbu_err==1) 
                    mcu0_nb_data_array_QW4_cnt[j+1]=3;
                 else
                    mcu0_nb_data_array_QW4_cnt[j+1]=1;
              end
            end

    if ( (mcu0_inject_fbu_err==1 && found==1 && ( (mcu0_nb_quadword==3 && mcu0_nb_data_array_QW3_cnt[j]>0)
        || (mcu0_nb_quadword==4 && mcu0_nb_data_array_QW4_cnt[j]>0) ) ) ||
         (found==0 && ( (mcu0_nb_quadword==3 && mcu0_nb_data_array_QW3_cnt[j+1]>0)
        || (mcu0_nb_quadword==4 && mcu0_nb_data_array_QW4_cnt[j+1]>0) ) ) ) begin

    if (mcu0_nb_quadword==3) begin
                NBQW3=1;
    corrupted_mcu0_nb_lndskw0_data[167:0] = `MCU0.lndskw0_data[167:0] ^ ( return_168_bits_nb_mask ( mcu0_nb_bit_time_mask, mcu0_nb_lane_mask ) ) ;
    `PR_ALWAYS ("mcu_fmon", `ALWAYS, "INFO: MCU0 NB QW3: orig. data [167:0] was %x, modif. data [167:0] is %x",`MCU0.lndskw0_data[167:0],corrupted_mcu0_nb_lndskw0_data[167:0]);
    force `MCU0.lndskw0_data[167:0] = corrupted_mcu0_nb_lndskw0_data[167:0];
    @(posedge drl2clk);
    release `MCU0.lndskw0_data[167:0];
    end
    else if (mcu0_nb_quadword==4) begin
                NBQW4=1;
    corrupted_mcu0_nb_lndskw1_data[167:0] = `MCU0.lndskw1_data[167:0] ^ ( return_168_bits_nb_mask ( mcu0_nb_bit_time_mask, mcu0_nb_lane_mask ) ) ;
    `PR_ALWAYS ("mcu_fmon", `ALWAYS, "INFO: MCU0 NB QW4: orig. data [167:0] was %x, modif. data [167:0] is %x",`MCU0.lndskw1_data[167:0],corrupted_mcu0_nb_lndskw1_data[167:0]);
    force `MCU0.lndskw1_data[167:0] = corrupted_mcu0_nb_lndskw1_data[167:0];
    @(posedge drl2clk);
    release `MCU0.lndskw1_data[167:0];
    end
    end
    
    if (found==0) begin
    if (mcu0_nb_quadword==1 && mcu0_nb_data_array_QW1_cnt[j+1]>0) mcu0_nb_data_array_QW1_cnt[j+1]=mcu0_nb_data_array_QW1_cnt[j+1]-1;
    if (mcu0_nb_quadword==2 && mcu0_nb_data_array_QW2_cnt[j+1]>0) mcu0_nb_data_array_QW2_cnt[j+1]=mcu0_nb_data_array_QW2_cnt[j+1]-1;
    if (mcu0_nb_quadword==3 && mcu0_nb_data_array_QW3_cnt[j+1]>0) mcu0_nb_data_array_QW3_cnt[j+1]=mcu0_nb_data_array_QW3_cnt[j+1]-1;
    if (mcu0_nb_quadword==4 && mcu0_nb_data_array_QW4_cnt[j+1]>0) mcu0_nb_data_array_QW4_cnt[j+1]=mcu0_nb_data_array_QW4_cnt[j+1]-1;
    end
    else begin
    if (mcu0_nb_quadword==1 && mcu0_nb_data_array_QW1_cnt[j]>0) mcu0_nb_data_array_QW1_cnt[j]=mcu0_nb_data_array_QW1_cnt[j]-1;
    if (mcu0_nb_quadword==2 && mcu0_nb_data_array_QW2_cnt[j]>0) mcu0_nb_data_array_QW2_cnt[j]=mcu0_nb_data_array_QW2_cnt[j]-1;
    if (mcu0_nb_quadword==3 && mcu0_nb_data_array_QW3_cnt[j]>0) mcu0_nb_data_array_QW3_cnt[j]=mcu0_nb_data_array_QW3_cnt[j]-1;
    if (mcu0_nb_quadword==4 && mcu0_nb_data_array_QW4_cnt[j]>0) mcu0_nb_data_array_QW4_cnt[j]=mcu0_nb_data_array_QW4_cnt[j]-1;
    end
    end
            NBQW1=0; NBQW2=0; NBQW3=0; NBQW4=0;
            trigger_NB=0;

`ifdef FC_CRC_INJECT 
end
`endif
      
`else //mcusat
    if ( (mcu0_nb_err_enable==1) && mcu0_drif_dram_cmd_a==`RD || 
      (`MCU0.fbdic.fbdic_config_reg_read==1'b1 && ~mcu_bug_111547) ||
      (`MCU0.fbdic.fbdic_config_reg_write==1'b1 && ~mcu_bug_111483) ||
      (`MCU0.fbdic.fbdic_sync_frame_req==1'b1 && ~mcu_bug_111811) ||
      (`MCU0.fbdic.fbdic_scr_frame_req==1'b1 ) &&
      (mcu0_nb_channel_error_cnt>0) &&
      (!mcu0_esr_fbr && !mcu0_esr_fbu) && (~mcu0_esr_fbu || mcu0_inject_fbu_err) &&
      (`MCU0.drif.pdmc0.pdmc_pd_cnt < 6'h23) &&
      (`MCU0.drif.drif_err_state == 5'h1 || mcu0_inject_fbu_err)) 
        begin


    if (mcu0_nb_err_random)
      repeat ((mcu0_chnl_lat-4)+mcu0_nb_random_cycle) @ (posedge drl2clk);
    else
      repeat ((mcu0_chnl_lat-4)+mcu0_nb_cycle_cnt) @ (posedge drl2clk);


`ifdef NEC_FBDIMM
    repeat (6) @ (posedge sclk);
`else
    repeat (11) @ (posedge sclk);
`endif

    if (mcu0_enable_ch0_err_inj) begin
      force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_frame_num = 12'h1;

      force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_frame_num = 12'h1;

      if (mcu0_nb_err_random) begin
        if (mcu0_nb_bit_time_mask[0]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn0_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn0_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[1]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn1_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn1_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[2]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn2_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn2_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[3]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn3_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn3_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[4]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn4_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn4_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[5]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn5_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn5_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[6]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn6_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn6_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[7]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn7_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn7_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[8]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn8_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn8_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[9]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn9_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn9_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[10]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn10_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn10_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[11]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn11_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn11_crc_mask = mcu0_nb_lane_mask;
        end
      end

    if (mcu0_inject_fbu_err && !mcu0_esr_fbu)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBU on CH0 NB - MCU0 (mcu0_nb_bit_time_mask[11:0] is %b, mcu0_nb_lane_mask[13:0] is %b)",mcu0_nb_bit_time_mask,mcu0_nb_lane_mask);
    else if (!mcu0_esr_fbr)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBR on CH0 NB - MCU0 (mcu0_nb_bit_time_mask[11:0] is %b, mcu0_nb_lane_mask[13:0] is %b)",mcu0_nb_bit_time_mask,mcu0_nb_lane_mask);

    end

    if (mcu0_enable_ch1_err_inj) begin
      force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_frame_num = 12'h1;

      force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_frame_num = 12'h1;

      if (mcu0_nb_err_random) begin
        if (mcu0_nb_bit_time_mask[0]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn0_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn0_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[1]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn1_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn1_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[2]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn2_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn2_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[3]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn3_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn3_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[4]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn4_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn4_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[5]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn5_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn5_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[6]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn6_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn6_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[7]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn7_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn7_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[8]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn8_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn8_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[9]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn9_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn9_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[10]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn10_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn10_crc_mask = mcu0_nb_lane_mask;
        end
        if (mcu0_nb_bit_time_mask[11]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn11_crc_mask = mcu0_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn11_crc_mask = mcu0_nb_lane_mask;
        end
      end

    if (mcu0_inject_fbu_err && !mcu0_esr_fbu)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBU on CH1 NB - MCU0 (mcu0_nb_bit_time_mask[11:0] is %b, mcu0_nb_lane_mask[13:0] is %b)",mcu0_nb_bit_time_mask,mcu0_nb_lane_mask);
    else if (!mcu0_esr_fbr)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBR on CH1 NB - MCU0 (mcu0_nb_bit_time_mask[11:0] is %b, mcu0_nb_lane_mask[13:0] is %b)",mcu0_nb_bit_time_mask,mcu0_nb_lane_mask);

    end

    repeat (1) @ (posedge sclk);

    release tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_frame_num;

    release tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_frame_num;

    release tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_frame_num;
  
    release tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_frame_num;

    if (mcu0_nb_err_random==0)
      mcu0_nb_channel_error_cnt=mcu0_nb_channel_error_cnt - 1;
    else begin
      mcu0_nb_err_enable = 0;
      mcu0_nb_lane_mask = 14'h1;
      mcu0_nb_bit_time_mask = 12'h1;
    end
  end
`endif
end
end

// --- MCU1 ---


always @ (          mcu1_drif_dram_cmd_a or 
                    `MCU1.fbdic.fbdic_config_reg_read or 
                    `MCU1.fbdic.fbdic_config_reg_write or 
                    `MCU1.fbdic.fbdic_sync_frame_req or 
                    `MCU1.fbdic.fbdic_scr_frame_req
        ) 
begin
if (enabled && ~ras_corner_case)
begin

  // --------- Random NB CRC Err Injection --------
  if (mcu1_nb_err_random) begin
    mcu1_nb_random_cycle = ({$random} % 3);
    if (mcu1_nb_crc_multiple_bit_times)
      mcu1_nb_bit_time_mask = $random;
    else begin
      mcu1_nb_random_bit_time = ({$random} % BIT_TIMES);
      mcu1_nb_bit_time_mask = mcu1_nb_bit_time_mask << mcu1_nb_random_bit_time;
    end
    if (mcu1_nb_crc_multiple_lanes)
      mcu1_nb_lane_mask = $random;
    else begin
      mcu1_nb_random_lane = ({$random} % NB_LANES);
      mcu1_nb_lane_mask = mcu1_nb_lane_mask << mcu1_nb_random_lane;
    end
    mcu1_nb_random_val = ({$random} % 100);
    if (!(mcu1_nb_random_val > MCU1_NB_RANDOM_WEIGHT)) mcu1_nb_err_enable=1;
  end



  if ( !stop_mcu1_nb_mask && !($time < stop_mcu1_nb_crc_inj_time) && !(stop_mcu1_nb_crc_inj_time == 0) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Stopping crc err injection on NB channel for MCU1, time now is %d",$time);
     force mcu1_nb_err_enable=0;
     stop_mcu1_nb_mask = 1;
    end
  else if ( !restart_mcu1_nb_mask && !($time < restart_mcu1_nb_crc_inj_time) && !(restart_mcu1_nb_crc_inj_time == 0) && (restart_mcu1_nb_crc_inj_time > stop_mcu1_nb_crc_inj_time) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Restarting crc err injection on NB channel for MCU1, time now is %d",$time);
     release mcu1_nb_err_enable;
     restart_mcu1_nb_mask=1;
     end
  else if ( !restart_stop_mcu1_nb_mask && !($time < restart_stop_mcu1_nb_crc_inj_time) && !(restart_stop_mcu1_nb_crc_inj_time == 0) && (restart_stop_mcu1_nb_crc_inj_time > restart_mcu1_nb_crc_inj_time) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Stopping the restarted crc err injection on NB channel for MCU1, time now is %d",$time);
     force mcu1_nb_err_enable=0;
     restart_stop_mcu1_nb_mask=1;
     end



   if ( ( $test$plusargs("INJECT_CRC_MCU1_NB_ERRQ") && (mcu1_nb_err < 8) && mcu1_nb_err_random ) &&
      ( `MCU1.drif.reqq.drq0.drq_rdq_full == 0 && `MCU1.drif.reqq.drq0.drq_wrq_full == 0 ) &&   // check both rd and wr queues on both channels are empty
      ( `MCU1.drif.reqq.drq1.drq_rdq_full == 0 && `MCU1.drif.reqq.drq1.drq_wrq_full == 0 ) &&
      ( `MCU1.drif.reqq.drq0.drq_empty == 1 && `MCU1.drif.reqq.drq1.drq_empty == 1 ) &&         // check channel 0/1 dram rd/wr queues 
      ( `MCU1.drif.errq.errq_empty == 1 && `MCU1.drif.reqq.woq_err_fifo_empty == 1 ) &&         // check also dram rd/wr ecc/crc error fifo
`ifdef FC_CRC_INJECT
      passed_bootEnd_mask==1 &&
`endif
      ( mcu1_drif_dram_cmd_a==`RD ||
      (`MCU1.fbdic.fbdic_config_reg_read==1'b1 && ~mcu_bug_111547) ||
      (`MCU1.fbdic.fbdic_config_reg_write==1'b1 && ~mcu_bug_111483) ||
      (`MCU1.fbdic.fbdic_sync_frame_req==1'b1 && ~mcu_bug_111811) ||
      `MCU1.fbdic.fbdic_scr_frame_req==1'b1) )
       begin
     force mcu1_nb_err_enable=0;
      inject_crc_mcu1_nb_errq_mask=1;
      `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Injecting CRC errors on NB channel in MCU1 via RD/WR queue tracking, errq loop count is %d (max. allowed is 8)",mcu1_nb_err);
      end

      else if ( mcu1_nb_err_enable==1 && (mcu1_drif_dram_cmd_a==`RD || 
      (`MCU1.fbdic.fbdic_config_reg_read==1'b1 && ~mcu_bug_111547) ||
      (`MCU1.fbdic.fbdic_config_reg_write==1'b1 && ~mcu_bug_111483) ||
      (`MCU1.fbdic.fbdic_sync_frame_req==1'b1 && ~mcu_bug_111811) ||
      (`MCU1.fbdic.fbdic_scr_frame_req==1'b1 )) &&
      (mcu1_nb_channel_error_cnt>0) &&
      (~mcu1_esr_fbu || mcu1_inject_fbu_err) &&
      (`MCU1.drif.pdmc0.pdmc_pd_cnt < 6'h23) &&
`ifdef FC_CRC_INJECT
      passed_bootEnd_mask==1 &&
      (!mcu1_esr_fbr && !mcu1_esr_fbu) && 
`endif
      (`MCU1.drif.drif_err_state == 5'h1 || mcu1_inject_fbu_err) )
        inject_crc_mcu1_nb_mask=1;

    
  if ( inject_crc_mcu1_nb_errq_mask==1 || (inject_crc_mcu1_nb_errq_mask==0 && inject_crc_mcu1_nb_mask==1 )  )
      begin


    if (mcu1_nb_err_random)
      repeat ((mcu1_chnl_lat-4)+mcu1_nb_random_cycle) @ (posedge drl2clk);
    else
      repeat ((mcu1_chnl_lat-4)+mcu1_nb_cycle_cnt) @ (posedge drl2clk);
`ifdef NEC_FBDIMM
    repeat (6) @ (posedge sclk);
`else
    repeat (11) @ (posedge sclk);
`endif



    mcu1_nb_err = mcu1_nb_err + 1;
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "MCU1: NB --- injecting CRC error no. %d", mcu1_nb_err);

    if (mcu1_enable_ch0_err_inj) begin
      force tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn_frame_num = 12'h1;

      force tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn_frame_num = 12'h1;

      if (mcu1_nb_err_random) begin
        if (mcu1_nb_bit_time_mask[0]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn0_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn0_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[1]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn1_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn1_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[2]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn2_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn2_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[3]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn3_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn3_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[4]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn4_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn4_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[5]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn5_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn5_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[6]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn6_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn6_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[7]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn7_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn7_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[8]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn8_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn8_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[9]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn9_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn9_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[10]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn10_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn10_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[11]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn11_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn11_crc_mask = mcu1_nb_lane_mask;
        end
      end

    if (mcu1_inject_fbu_err && !mcu1_esr_fbu)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBU on CH0 NB - MCU1 (mcu1_nb_bit_time_mask[11:0] is %b, mcu1_nb_lane_mask[13:0] is %b)",mcu1_nb_bit_time_mask,mcu1_nb_lane_mask);
    else if (!mcu1_esr_fbr)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBR on CH0 NB - MCU1 (mcu1_nb_bit_time_mask[11:0] is %b, mcu1_nb_lane_mask[13:0] is %b)",mcu1_nb_bit_time_mask,mcu1_nb_lane_mask);

    end

    if (mcu1_enable_ch1_err_inj) begin
      force tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn_frame_num = 12'h1;

      force tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn_frame_num = 12'h1;

      if (mcu1_nb_err_random) begin
        if (mcu1_nb_bit_time_mask[0]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn0_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn0_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[1]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn1_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn1_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[2]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn2_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn2_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[3]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn3_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn3_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[4]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn4_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn4_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[5]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn5_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn5_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[6]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn6_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn6_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[7]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn7_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn7_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[8]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn8_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn8_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[9]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn9_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn9_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[10]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn10_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn10_crc_mask = mcu1_nb_lane_mask;
        end
        if (mcu1_nb_bit_time_mask[11]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn11_crc_mask = mcu1_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn11_crc_mask = mcu1_nb_lane_mask;
        end
      end

    if (mcu1_inject_fbu_err && !mcu1_esr_fbu)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBU on CH1 NB - MCU1 (mcu1_nb_bit_time_mask[11:0] is %b, mcu1_nb_lane_mask[13:0] is %b)",mcu1_nb_bit_time_mask,mcu1_nb_lane_mask);
    else if (!mcu1_esr_fbr)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBR on CH1 NB - MCU1 (mcu1_nb_bit_time_mask[11:0] is %b, mcu1_nb_lane_mask[13:0] is %b)",mcu1_nb_bit_time_mask,mcu1_nb_lane_mask);

    end

    repeat (1) @ (posedge sclk);

    release tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn_frame_num;

    release tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn_frame_num;

    release tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn_frame_num;
  
    release tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn_frame_num;

    inject_crc_mcu1_nb_mask=0;
    if (mcu1_nb_err_random==0)
      mcu1_nb_channel_error_cnt=mcu1_nb_channel_error_cnt - 1;
    else begin
      mcu1_nb_err_enable = 0;
      mcu1_nb_lane_mask = 14'h1;
      mcu1_nb_bit_time_mask = 12'h1;
    end
  end
end
end

// --- MCU2 ---


always @ (          mcu2_drif_dram_cmd_a or 
                    `MCU2.fbdic.fbdic_config_reg_read or 
                    `MCU2.fbdic.fbdic_config_reg_write or 
                    `MCU2.fbdic.fbdic_sync_frame_req or 
                    `MCU2.fbdic.fbdic_scr_frame_req
        ) 
begin
if (enabled && ~ras_corner_case)
begin

  // --------- Random NB CRC Err Injection --------
  if (mcu2_nb_err_random) begin
    mcu2_nb_random_cycle = ({$random} % 3);
    if (mcu2_nb_crc_multiple_bit_times)
      mcu2_nb_bit_time_mask = $random;
    else begin
      mcu2_nb_random_bit_time = ({$random} % BIT_TIMES);
      mcu2_nb_bit_time_mask = mcu2_nb_bit_time_mask << mcu2_nb_random_bit_time;
    end
    if (mcu2_nb_crc_multiple_lanes)
      mcu2_nb_lane_mask = $random;
    else begin
      mcu2_nb_random_lane = ({$random} % NB_LANES);
      mcu2_nb_lane_mask = mcu2_nb_lane_mask << mcu2_nb_random_lane;
    end
    mcu2_nb_random_val = ({$random} % 100);
    if (!(mcu2_nb_random_val > MCU2_NB_RANDOM_WEIGHT)) mcu2_nb_err_enable=1;
  end



  if ( !stop_mcu2_nb_mask && !($time < stop_mcu2_nb_crc_inj_time) && !(stop_mcu2_nb_crc_inj_time == 0) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Stopping crc err injection on NB channel for MCU2, time now is %d",$time);
     force mcu2_nb_err_enable=0;
     stop_mcu2_nb_mask = 1;
    end
  else if ( !restart_mcu2_nb_mask && !($time < restart_mcu2_nb_crc_inj_time) && !(restart_mcu2_nb_crc_inj_time == 0) && (restart_mcu2_nb_crc_inj_time > stop_mcu2_nb_crc_inj_time) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Restarting crc err injection on NB channel for MCU2, time now is %d",$time);
     release mcu2_nb_err_enable;
     restart_mcu2_nb_mask=1;
     end
  else if ( !restart_stop_mcu2_nb_mask && !($time < restart_stop_mcu2_nb_crc_inj_time) && !(restart_stop_mcu2_nb_crc_inj_time == 0) && (restart_stop_mcu2_nb_crc_inj_time > restart_mcu2_nb_crc_inj_time) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Stopping the restarted crc err injection on NB channel for MCU2, time now is %d",$time);
     force mcu2_nb_err_enable=0;
     restart_stop_mcu2_nb_mask=1;
     end



   if ( ( $test$plusargs("INJECT_CRC_MCU2_NB_ERRQ") && (mcu2_nb_err < 8) && mcu2_nb_err_random ) &&
      ( `MCU2.drif.reqq.drq0.drq_rdq_full == 0 && `MCU2.drif.reqq.drq0.drq_wrq_full == 0 ) &&   // check both rd and wr queues on both channels are empty
      ( `MCU2.drif.reqq.drq1.drq_rdq_full == 0 && `MCU2.drif.reqq.drq1.drq_wrq_full == 0 ) &&
      ( `MCU2.drif.reqq.drq0.drq_empty == 1 && `MCU2.drif.reqq.drq1.drq_empty == 1 ) &&         // check channel 0/1 dram rd/wr queues 
      ( `MCU2.drif.errq.errq_empty == 1 && `MCU2.drif.reqq.woq_err_fifo_empty == 1 ) &&         // check also dram rd/wr ecc/crc error fifo
`ifdef FC_CRC_INJECT
      passed_bootEnd_mask==1 &&
`endif
      ( mcu2_drif_dram_cmd_a==`RD ||
      (`MCU2.fbdic.fbdic_config_reg_read==1'b1 && ~mcu_bug_111547) ||
      (`MCU2.fbdic.fbdic_config_reg_write==1'b1 && ~mcu_bug_111483) ||
      (`MCU2.fbdic.fbdic_sync_frame_req==1'b1 && ~mcu_bug_111811) ||
      `MCU2.fbdic.fbdic_scr_frame_req==1'b1) )
       begin
     force mcu2_nb_err_enable=0;
      inject_crc_mcu2_nb_errq_mask=1;
      `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Injecting CRC errors on NB channel in MCU2 via RD/WR queue tracking, errq loop count is %d (max. allowed is 8)",mcu2_nb_err);
      end


      else if ( mcu2_nb_err_enable==1 && (mcu2_drif_dram_cmd_a==`RD || 
      (`MCU2.fbdic.fbdic_config_reg_read==1'b1 && ~mcu_bug_111547) ||
      (`MCU2.fbdic.fbdic_config_reg_write==1'b1 && ~mcu_bug_111483) ||
      (`MCU2.fbdic.fbdic_sync_frame_req==1'b1 && ~mcu_bug_111811) ||
      (`MCU2.fbdic.fbdic_scr_frame_req==1'b1 )) &&
      (mcu2_nb_channel_error_cnt>0) &&
      (~mcu2_esr_fbu || mcu2_inject_fbu_err) &&
      (`MCU2.drif.pdmc0.pdmc_pd_cnt < 6'h23) &&
`ifdef FC_CRC_INJECT
      passed_bootEnd_mask==1 &&
      (!mcu2_esr_fbr && !mcu2_esr_fbu) && 
`endif
      (`MCU2.drif.drif_err_state == 5'h1 || mcu2_inject_fbu_err) )
        inject_crc_mcu2_nb_mask=1;

    
  if ( inject_crc_mcu2_nb_errq_mask==1 || (inject_crc_mcu2_nb_errq_mask==0 && inject_crc_mcu2_nb_mask==1 )  )
      begin


    if (mcu2_nb_err_random)
      repeat ((mcu2_chnl_lat-4)+mcu2_nb_random_cycle) @ (posedge drl2clk);
    else
      repeat ((mcu2_chnl_lat-4)+mcu2_nb_cycle_cnt) @ (posedge drl2clk);


`ifdef NEC_FBDIMM
    repeat (6) @ (posedge sclk);
`else
    repeat (11) @ (posedge sclk);
`endif



    mcu2_nb_err = mcu2_nb_err + 1;
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "MCU2: NB --- injecting CRC error no. %d", mcu2_nb_err);

    if (mcu2_enable_ch0_err_inj) begin
      force tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn_frame_num = 12'h1;

      force tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn_frame_num = 12'h1;

      if (mcu2_nb_err_random) begin
        if (mcu2_nb_bit_time_mask[0]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn0_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn0_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[1]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn1_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn1_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[2]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn2_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn2_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[3]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn3_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn3_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[4]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn4_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn4_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[5]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn5_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn5_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[6]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn6_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn6_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[7]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn7_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn7_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[8]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn8_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn8_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[9]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn9_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn9_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[10]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn10_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn10_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[11]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn11_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn11_crc_mask = mcu2_nb_lane_mask;
        end
      end

    if (mcu2_inject_fbu_err && !mcu2_esr_fbu)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBU on CH0 NB - MCU2 (mcu2_nb_bit_time_mask[11:0] is %b, mcu2_nb_lane_mask[13:0] is %b)",mcu2_nb_bit_time_mask,mcu2_nb_lane_mask);
    else if (!mcu2_esr_fbr)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBR on CH0 NB - MCU2 (mcu2_nb_bit_time_mask[11:0] is %b, mcu2_nb_lane_mask[13:0] is %b)",mcu2_nb_bit_time_mask,mcu2_nb_lane_mask);

    end

    if (mcu2_enable_ch1_err_inj) begin
      force tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn_frame_num = 12'h1;

      force tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn_frame_num = 12'h1;

      if (mcu2_nb_err_random) begin
        if (mcu2_nb_bit_time_mask[0]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn0_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn0_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[1]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn1_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn1_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[2]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn2_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn2_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[3]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn3_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn3_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[4]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn4_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn4_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[5]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn5_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn5_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[6]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn6_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn6_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[7]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn7_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn7_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[8]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn8_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn8_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[9]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn9_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn9_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[10]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn10_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn10_crc_mask = mcu2_nb_lane_mask;
        end
        if (mcu2_nb_bit_time_mask[11]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn11_crc_mask = mcu2_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn11_crc_mask = mcu2_nb_lane_mask;
        end
      end

    if (mcu2_inject_fbu_err && !mcu2_esr_fbu)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBU on CH1 NB - MCU2 (mcu2_nb_bit_time_mask[11:0] is %b, mcu2_nb_lane_mask[13:0] is %b)",mcu2_nb_bit_time_mask,mcu2_nb_lane_mask);
    else if (!mcu2_esr_fbr)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBR on CH1 NB - MCU2 (mcu2_nb_bit_time_mask[11:0] is %b, mcu2_nb_lane_mask[13:0] is %b)",mcu2_nb_bit_time_mask,mcu2_nb_lane_mask);

    end

    repeat (1) @ (posedge sclk);

    release tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn_frame_num;

    release tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn_frame_num;

    release tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn_frame_num;
  
    release tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn_frame_num;

    inject_crc_mcu2_nb_mask=0;
    if (mcu2_nb_err_random==0)
      mcu2_nb_channel_error_cnt=mcu2_nb_channel_error_cnt - 1;
    else begin
      mcu2_nb_err_enable = 0;
      mcu2_nb_lane_mask = 14'h1;
      mcu2_nb_bit_time_mask = 12'h1;
    end
  end
end
end

// --- MCU3 ---


always @ (          mcu3_drif_dram_cmd_a or 
                    `MCU3.fbdic.fbdic_config_reg_read or 
                    `MCU3.fbdic.fbdic_config_reg_write or 
                    `MCU3.fbdic.fbdic_sync_frame_req or 
                    `MCU3.fbdic.fbdic_scr_frame_req
        ) 
begin
if (enabled && ~ras_corner_case)
begin

  // --------- Random NB CRC Err Injection --------
  if (mcu3_nb_err_random) begin
    mcu3_nb_random_cycle = ({$random} % 3);
    if (mcu3_nb_crc_multiple_bit_times)
      mcu3_nb_bit_time_mask = $random;
    else begin
      mcu3_nb_random_bit_time = ({$random} % BIT_TIMES);
      mcu3_nb_bit_time_mask = mcu3_nb_bit_time_mask << mcu3_nb_random_bit_time;
    end
    if (mcu3_nb_crc_multiple_lanes)
      mcu3_nb_lane_mask = $random;
    else begin
      mcu3_nb_random_lane = ({$random} % NB_LANES);
      mcu3_nb_lane_mask = mcu3_nb_lane_mask << mcu3_nb_random_lane;
    end
    mcu3_nb_random_val = ({$random} % 100);
    if (!(mcu3_nb_random_val > MCU3_NB_RANDOM_WEIGHT)) mcu3_nb_err_enable=1;
  end



  if ( !stop_mcu3_nb_mask && !($time < stop_mcu3_nb_crc_inj_time) && !(stop_mcu3_nb_crc_inj_time == 0) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Stopping crc err injection on NB channel for MCU3, time now is %d",$time);
     force mcu3_nb_err_enable=0;
     stop_mcu3_nb_mask = 1;
    end
  else if ( !restart_mcu3_nb_mask && !($time < restart_mcu3_nb_crc_inj_time) && !(restart_mcu3_nb_crc_inj_time == 0) && (restart_mcu3_nb_crc_inj_time > stop_mcu3_nb_crc_inj_time) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Restarting crc err injection on NB channel for MCU3, time now is %d",$time);
     release mcu3_nb_err_enable;
     restart_mcu3_nb_mask=1;
     end
  else if ( !restart_stop_mcu3_nb_mask && !($time < restart_stop_mcu3_nb_crc_inj_time) && !(restart_stop_mcu3_nb_crc_inj_time == 0) && (restart_stop_mcu3_nb_crc_inj_time > restart_mcu3_nb_crc_inj_time) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Stopping the restarted crc err injection on NB channel for MCU3, time now is %d",$time);
     force mcu3_nb_err_enable=0;
     restart_stop_mcu3_nb_mask=1;
     end
     


   if ( ( $test$plusargs("INJECT_CRC_MCU3_NB_ERRQ") && (mcu3_nb_err < 8) && mcu3_nb_err_random ) &&
      ( `MCU3.drif.reqq.drq0.drq_rdq_full == 0 && `MCU3.drif.reqq.drq0.drq_wrq_full == 0 ) &&   // check both rd and wr queues on both channels are empty
      ( `MCU3.drif.reqq.drq1.drq_rdq_full == 0 && `MCU3.drif.reqq.drq1.drq_wrq_full == 0 ) &&
      ( `MCU3.drif.reqq.drq0.drq_empty == 1 && `MCU3.drif.reqq.drq1.drq_empty == 1 ) &&         // check channel 0/1 dram rd/wr queues 
      ( `MCU3.drif.errq.errq_empty == 1 && `MCU3.drif.reqq.woq_err_fifo_empty == 1 ) &&         // check also dram rd/wr ecc/crc error fifo
`ifdef FC_CRC_INJECT
      passed_bootEnd_mask==1 &&
`endif
      ( mcu3_drif_dram_cmd_a==`RD ||
      (`MCU3.fbdic.fbdic_config_reg_read==1'b1 && ~mcu_bug_111547) ||
      (`MCU3.fbdic.fbdic_config_reg_write==1'b1 && ~mcu_bug_111483) ||
      (`MCU3.fbdic.fbdic_sync_frame_req==1'b1 && ~mcu_bug_111811) ||
      `MCU3.fbdic.fbdic_scr_frame_req==1'b1) )
       begin
     force mcu3_nb_err_enable=0;
      inject_crc_mcu3_nb_errq_mask=1;
      `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Injecting CRC errors on NB channel in MCU3 via RD/WR queue tracking, errq loop count is %d (max. allowed is 8)",mcu3_nb_err);
      end


      else if ( mcu3_nb_err_enable==1 && (mcu3_drif_dram_cmd_a==`RD || 
      (`MCU3.fbdic.fbdic_config_reg_read==1'b1 && ~mcu_bug_111547) ||
      (`MCU3.fbdic.fbdic_config_reg_write==1'b1 && ~mcu_bug_111483) ||
      (`MCU3.fbdic.fbdic_sync_frame_req==1'b1 && ~mcu_bug_111811) ||
      (`MCU3.fbdic.fbdic_scr_frame_req==1'b1 )) &&
      (mcu3_nb_channel_error_cnt>0) &&
      (~mcu3_esr_fbu || mcu3_inject_fbu_err) &&
      (`MCU3.drif.pdmc0.pdmc_pd_cnt < 6'h23) &&
`ifdef FC_CRC_INJECT
      passed_bootEnd_mask==1 &&
      (!mcu3_esr_fbr && !mcu3_esr_fbu) && 
`endif
      (`MCU3.drif.drif_err_state == 5'h1 || mcu3_inject_fbu_err) )
        inject_crc_mcu3_nb_mask=1;

    
  if ( inject_crc_mcu3_nb_errq_mask==1 || (inject_crc_mcu3_nb_errq_mask==0 && inject_crc_mcu3_nb_mask==1 )  )
      begin


    if (mcu3_nb_err_random)
      repeat ((mcu3_chnl_lat-4)+mcu3_nb_random_cycle) @ (posedge drl2clk);
    else
      repeat ((mcu3_chnl_lat-4)+mcu3_nb_cycle_cnt) @ (posedge drl2clk);

`ifdef NEC_FBDIMM
    repeat (6) @ (posedge sclk);
`else
    repeat (11) @ (posedge sclk);
`endif



    mcu3_nb_err = mcu3_nb_err + 1;
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "MCU3: NB --- injecting CRC error no. %d", mcu3_nb_err);

    if (mcu3_enable_ch0_err_inj) begin
      force tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn_frame_num = 12'h1;

      force tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn_frame_num = 12'h1;

      if (mcu3_nb_err_random) begin
        if (mcu3_nb_bit_time_mask[0]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn0_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn0_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[1]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn1_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn1_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[2]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn2_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn2_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[3]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn3_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn3_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[4]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn4_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn4_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[5]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn5_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn5_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[6]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn6_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn6_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[7]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn7_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn7_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[8]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn8_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn8_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[9]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn9_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn9_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[10]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn10_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn10_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[11]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn11_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn11_crc_mask = mcu3_nb_lane_mask;
        end
      end

    if (mcu3_inject_fbu_err && !mcu3_esr_fbu)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBU on CH0 NB - MCU3 (mcu3_nb_bit_time_mask[11:0] is %b, mcu3_nb_lane_mask[13:0] is %b)",mcu3_nb_bit_time_mask,mcu3_nb_lane_mask);
    else if (!mcu3_esr_fbr)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBR on CH0 NB - MCU3 (mcu3_nb_bit_time_mask[11:0] is %b, mcu3_nb_lane_mask[13:0] is %b)",mcu3_nb_bit_time_mask,mcu3_nb_lane_mask);

    end

    if (mcu3_enable_ch1_err_inj) begin
      force tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn_frame_num = 12'h1;

      force tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn_frame_num = 12'h1;

      if (mcu3_nb_err_random) begin
        if (mcu3_nb_bit_time_mask[0]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn0_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn0_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[1]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn1_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn1_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[2]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn2_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn2_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[3]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn3_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn3_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[4]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn4_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn4_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[5]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn5_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn5_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[6]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn6_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn6_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[7]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn7_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn7_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[8]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn8_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn8_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[9]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn9_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn9_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[10]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn10_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn10_crc_mask = mcu3_nb_lane_mask;
        end
        if (mcu3_nb_bit_time_mask[11]) begin 
           force tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn11_crc_mask = mcu3_nb_lane_mask;
           force tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn11_crc_mask = mcu3_nb_lane_mask;
        end
      end

    if (mcu3_inject_fbu_err && !mcu3_esr_fbu)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBU on CH1 NB - MCU3 (mcu3_nb_bit_time_mask[11:0] is %b, mcu3_nb_lane_mask[13:0] is %b)",mcu3_nb_bit_time_mask,mcu3_nb_lane_mask);
    else if (!mcu3_esr_fbr)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBR on CH1 NB - MCU3 (mcu3_nb_bit_time_mask[11:0] is %b, mcu3_nb_lane_mask[13:0] is %b)",mcu3_nb_bit_time_mask,mcu3_nb_lane_mask);

    end

    repeat (1) @ (posedge sclk);

    release tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn_frame_num;

    release tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn_frame_num;

    release tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn_frame_num;
  
    release tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn_frame_num;

    inject_crc_mcu3_nb_mask=0;
    if (mcu3_nb_err_random==0)
      mcu3_nb_channel_error_cnt=mcu3_nb_channel_error_cnt - 1;
    else begin
      mcu3_nb_err_enable = 0;
      mcu3_nb_lane_mask = 14'h1;
      mcu3_nb_bit_time_mask = 12'h1;
    end
  end
end
end


//Error Injection in Training Seq

// --- MCU0 ---


always @(fbdic_fbd_state_0)
begin
mcu0_sb_channel_error_cnt_tmp = mcu0_sb_channel_error_cnt;
end

// If an error is detected and MCU went to disable state, stop the error
// injection
always @(posedge drl2clk)
begin

     if ((mcu0_fbdic_tclktrain_done[1] == 1'b1)||
            (mcu0_fbdic_testing_done[1] == 1'b1) ||
               (mcu0_fbdic_polling_done[1] == 1'b1))
                begin
                        repeat (50) @(posedge drl2clk);
                        if(fbdic_fbd_state_0 == 0)
			begin
                                mcu0_training_err_enable = 0;
    `PR_DEBUG("mcu_fmon",`DEBUG," DISABLED Err INJECTION IN TRAINING SEQUENCE");
			end
                end


end


always @(posedge drl2clk)
begin

@(posedge drl2clk);

  if ((mcu0_training_err_enable == 1) &&
   (fbdic_fbd_state_0 == 2 || fbdic_fbd_state_0 == 3  ||
    fbdic_fbd_state_0 == 4 || fbdic_fbd_state_0 == 5) &&
   ( mcu0_sb_channel_error_cnt_tmp>0 ) )
  begin

     if( fbdic_fbd_state_0 == 2 )
     begin
          repeat (100) @(posedge drl2clk);
     end
     else 
     begin
          repeat (30) @(posedge drl2clk);
     end

    `PR_DEBUG("mcu_fmon",`DEBUG," Entered Err Injection in TRAINING SEQUENCE SB Channel");

    if (mcu0_enable_ch0_err_inj)
    begin
      force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_frame_num = 12'h1;
    end

    if (mcu0_enable_ch1_err_inj)
    begin
      force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_frame_num = 12'h1;
    end

    repeat (1) @ (posedge sclk);

    release tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_frame_num;

    mcu0_sb_channel_error_cnt_tmp = mcu0_sb_channel_error_cnt_tmp - 1;

    repeat (3) @ (posedge sclk);
  end // if (mcu0_training_err_enable ..
end


//------------------------------------------------
// SB CRC - Corrupt SB CMD/Data Frame Mechanism
//------------------------------------------------


`ifdef FC_CRC_INJECT
reg [119:0] corrupted_mcu0_sb_mcu0_fsr0_data;
integer mcu0_sb_quadword=1;
initial begin
if ($value$plusargs("MCU0_SB_QUADWORD=%d",mcu0_sb_quadword)) begin
    if ( (mcu0_sb_quadword<1) || (mcu0_sb_quadword>4) ) `PR_ERROR ("mcu_fmon", `ERROR, "can only specify 1,2,3 or 4!");
    else `PR_ALWAYS ("mcu_fmon", `ALWAYS, "INFO: will inject CRC error on MCU0 SB quadword %d",mcu0_sb_quadword);
    end
end
`endif

function [119:0] return_120_bits_sb_mask;
input[11:0] mcu0_sb_bit_time_mask;
input[9:0] mcu0_sb_lane_mask;
begin
     return_120_bits_sb_mask=120'b0;
     if (mcu0_sb_bit_time_mask[0] ==1)  return_120_bits_sb_mask[9:0]     =  mcu0_sb_lane_mask[9:0];
     if (mcu0_sb_bit_time_mask[1] ==1)  return_120_bits_sb_mask[19:10]   =  mcu0_sb_lane_mask[9:0];
     if (mcu0_sb_bit_time_mask[2] ==1)  return_120_bits_sb_mask[29:20]   =  mcu0_sb_lane_mask[9:0];
     if (mcu0_sb_bit_time_mask[3] ==1)  return_120_bits_sb_mask[39:30]   =  mcu0_sb_lane_mask[9:0];
     if (mcu0_sb_bit_time_mask[4] ==1)  return_120_bits_sb_mask[49:40]   =  mcu0_sb_lane_mask[9:0];
     if (mcu0_sb_bit_time_mask[5] ==1)  return_120_bits_sb_mask[59:50]   =  mcu0_sb_lane_mask[9:0];
     if (mcu0_sb_bit_time_mask[6] ==1)  return_120_bits_sb_mask[69:60]   =  mcu0_sb_lane_mask[9:0];
     if (mcu0_sb_bit_time_mask[7] ==1)  return_120_bits_sb_mask[79:70]   =  mcu0_sb_lane_mask[9:0];
     if (mcu0_sb_bit_time_mask[8] ==1)  return_120_bits_sb_mask[89:80]   =  mcu0_sb_lane_mask[9:0];
     if (mcu0_sb_bit_time_mask[9] ==1)  return_120_bits_sb_mask[99:90]   =  mcu0_sb_lane_mask[9:0];
     if (mcu0_sb_bit_time_mask[10]==1)  return_120_bits_sb_mask[109:100] =  mcu0_sb_lane_mask[9:0];
     if (mcu0_sb_bit_time_mask[11]==1)  return_120_bits_sb_mask[119:110] =  mcu0_sb_lane_mask[9:0];
end
endfunction

reg [119:0] mcu0_sb_data_array_QW1 [0:`MAX_CRC_ERRORS-1];
reg [119:0] mcu0_sb_data_array_QW2 [0:`MAX_CRC_ERRORS-1];
reg [119:0] mcu0_sb_data_array_QW3 [0:`MAX_CRC_ERRORS-1];
reg [119:0] mcu0_sb_data_array_QW4 [0:`MAX_CRC_ERRORS-1];
integer mcu0_sb_data_array_QW1_cnt [0:`MAX_CRC_ERRORS-1];
integer mcu0_sb_data_array_QW2_cnt [0:`MAX_CRC_ERRORS-1];
integer mcu0_sb_data_array_QW3_cnt [0:`MAX_CRC_ERRORS-1];
integer mcu0_sb_data_array_QW4_cnt [0:`MAX_CRC_ERRORS-1];

integer S=0;
reg trigger_SB=0;

always @ (          
`ifdef FC_CRC_INJECT // for fullchip, pick only valid write packets
                    `MCU0.drif.drif_dram_cmd_b[2:0]
`else //for MCUSAT
                    mcu0_drif_dram_cmd_a or 
                    mcu0_drif_dram_cmd_b or 
                    mcu0_drif_dram_cmd_c or
                    `MCU0.fbdic.fbdic_config_reg_write or 
                    `MCU0.fbdic.fbdic_config_reg_read or 
                    `MCU0.fbdic.fbdic_scr_frame_req or 
                    `MCU0.fbdic.fbdic_sync_frame_req or 
                    `MCU0.fbdic.fbdic_issue_pre_all_cmd or 
                    `MCU0.fbdic.fbdic_issue_cke_cmd
`endif
) 
begin
if (enabled && ~ras_corner_case)
begin
`ifdef FC_CRC_INJECT 
if ( passed_bootEnd_mask==1 && `MCU0.drif.drif_dram_cmd_b[2:0]==3'h5 // currently injecting only on writes only
     && !mcu0_esr_fbr && !mcu0_esr_fbu)
begin
S=S+1;
`endif

  // --------- Random SB CRC Err Injection --------
  if (mcu0_sb_err_random) begin
      
    if (mcu0_sb_crc_multiple_bit_times) begin
      mcu0_sb_bit_time_mask = ({$random} % 4095); // pick multiple bit times
      while (mcu0_sb_bit_time_mask==0) mcu0_sb_bit_time_mask = ({$random} % 4095);
`ifdef FC_CRC_INJECT
      mcu0_sb_bit_time_mask = mcu0_sb_bit_time_mask & 12'hFF0; //pick bit times 5 thru 12
`endif
      end
    else begin // pick any 1 random bit time
        mcu0_sb_bit_time_mask=1;
`ifdef MCUSAT
      mcu0_sb_random_bit_time = ({$random} % BIT_TIMES);
      while (mcu0_sb_random_bit_time==0) mcu0_sb_random_bit_time = ({$random} % BIT_TIMES);
      mcu0_sb_bit_time_mask = mcu0_sb_bit_time_mask << mcu0_sb_random_bit_time;
`else
      mcu0_sb_random_bit_time = ({$random} % 8);  // for now within FC, pick one of bit times 5 thru 12
      mcu0_sb_bit_time_mask = mcu0_sb_bit_time_mask << (mcu0_sb_random_bit_time+4);
`endif
    end
    
    if (mcu0_sb_crc_multiple_lanes) begin
      mcu0_sb_lane_mask = ({$random} % 1023); // pick multiple lanes
      while (mcu0_sb_lane_mask==0) mcu0_sb_lane_mask = ({$random} % 1023);
    end
    else begin  // pick any 1 random lane
        mcu0_sb_lane_mask=1;
      mcu0_sb_random_lane = ({$random} % SB_LANES);
      while (mcu0_sb_random_lane==0) mcu0_sb_random_lane = ({$random} % SB_LANES);
      mcu0_sb_lane_mask = mcu0_sb_lane_mask << mcu0_sb_random_lane;
    end
`ifdef MCUSAT
    mcu0_sb_random_cycle = ({$random} % 3);
    mcu0_sb_random_val = ({$random} % 100);
    if (!(mcu0_sb_random_val > MCU0_SB_RANDOM_WEIGHT)) mcu0_sb_err_enable=1;
`else
    mcu0_sb_err_enable=1;
`endif
  end //if (mcu0_sb_err_random)

`ifdef FC_CRC_INJECT
  else if (mcu0_sb_err_enable) begin
	mcu0_sb_bit_time_mask=12'h010; // for FC, pick only the 5th bit time
	mcu0_sb_lane_mask=10'h200;
	end
`endif


  if ( !stop_mcu0_sb_mask && !($time < stop_mcu0_sb_crc_inj_time) && !(stop_mcu0_sb_crc_inj_time == 0) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Stopping crc err injection on SB channel for MCU0, time now is %d",$time);
     force mcu0_sb_err_enable=0;
     stop_mcu0_sb_mask = 1;
    end
  else if ( !restart_mcu0_sb_mask && !($time < restart_mcu0_sb_crc_inj_time) && !(restart_mcu0_sb_crc_inj_time == 0) && (restart_mcu0_sb_crc_inj_time > stop_mcu0_sb_crc_inj_time) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Restarting crc err injection on SB channel for MCU0, time now is %d",$time);
     release mcu0_sb_err_enable;
     restart_mcu0_sb_mask=1;
     end
  else if ( !restart_stop_mcu0_sb_mask && !($time < restart_stop_mcu0_sb_crc_inj_time) && !(restart_stop_mcu0_sb_crc_inj_time == 0) && (restart_stop_mcu0_sb_crc_inj_time > restart_mcu0_sb_crc_inj_time) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Stopping the restarted crc err injection on SB channel for MCU0, time now is %d",$time);
     force mcu0_sb_err_enable=0;
     restart_stop_mcu0_sb_mask=1;
     end

// code for fullchip crc injection on both NB and SB has been completely changed 
// 11/02/2006
`ifdef FC_CRC_INJECT
    if (mcu0_sb_err_enable==1) begin
        trigger_SB=1;
    `PR_ALWAYS ("mcu_fmon", `ALWAYS, "INFO: CRC SB masks : mcu0_sb_bit_time_mask[11:0] is %b, mcu0_sb_lane_mask[9:0] is %b",mcu0_sb_bit_time_mask,mcu0_sb_lane_mask);

      repeat (2) @(posedge drl2clk); // always has a delay of 2 cycles
      
	found=0; i=0; j=-1;
	for (i=0; i<`MAX_CRC_ERRORS; i=i+1)
	  begin
	  if (mcu0_sb_data_array_QW1[i][119:0]==`MCU0.mcu_fsr0_data[119:0] && found==0 && mcu0_sb_quadword==1)
		begin found=1; j=i; end
	  if ( found==0 && !(mcu0_sb_data_array_QW1[i][119:0]===120'bx) && mcu0_sb_quadword==1) 
		j=i;
	  end
          if (found==0 && (S%delay_crc==1))
            begin
              if (mcu0_sb_quadword==1) begin
		        mcu0_sb_data_array_QW1[j+1][119:0]=`MCU0.mcu_fsr0_data[119:0];
		        if (mcu0_inject_fbu_err==1)
                    mcu0_sb_data_array_QW1_cnt[j+1]=3;
		        else
                    mcu0_sb_data_array_QW1_cnt[j+1]=1;
		    end
            end

	if ( (mcu0_inject_fbu_err==1 && found==1 && mcu0_sb_quadword==1 && mcu0_sb_data_array_QW1_cnt[j]>0) ||
         (found==0 && mcu0_sb_quadword==1 && mcu0_sb_data_array_QW1_cnt[j+1]>0) ) begin
            SBQW1=1;

      if (mcu0_sb_quadword==1) begin
          corrupted_mcu0_sb_mcu0_fsr0_data[119:0] = `MCU0.mcu_fsr0_data[119:0] ^ ( return_120_bits_sb_mask ( mcu0_sb_bit_time_mask, mcu0_sb_lane_mask ) ) ;
    `PR_ALWAYS ("mcu_fmon", `ALWAYS, "INFO: MCU0 SB QW1: orig. fsr0 data [119:0] was %x, modif. fsr0 data [119:0] is %x",`MCU0.mcu_fsr0_data[119:0], corrupted_mcu0_sb_mcu0_fsr0_data[119:0]);
    force `MCU0.mcu_fsr0_data[119:0] = corrupted_mcu0_sb_mcu0_fsr0_data[119:0];
    @(posedge drl2clk);
    release `MCU0.mcu_fsr0_data[119:0];
    end
    end

    @(posedge drl2clk);

	found=0; i=0; j=-1;
	for (i=0; i<`MAX_CRC_ERRORS; i=i+1)
	  begin
	  if (mcu0_sb_data_array_QW2[i][119:0]==`MCU0.mcu_fsr0_data[119:0] && found==0 && mcu0_sb_quadword==2)
		begin found=1; j=i; end
	  if ( found==0 && !(mcu0_sb_data_array_QW2[i][119:0]===120'bx) && mcu0_sb_quadword==2) 
		j=i;
	  end
          if (found==0 && (S%delay_crc==1))
            begin
              if (mcu0_sb_quadword==2) begin
		        mcu0_sb_data_array_QW2[j+1][119:0]=`MCU0.mcu_fsr0_data[119:0];
		        if (mcu0_inject_fbu_err==1)
                    mcu0_sb_data_array_QW2_cnt[j+1]=3;
		        else
                    mcu0_sb_data_array_QW2_cnt[j+1]=1;
		    end
            end

	if ( (mcu0_inject_fbu_err==1 && found==1 && mcu0_sb_quadword==2 && mcu0_sb_data_array_QW2_cnt[j]>0) ||
         (found==0 && mcu0_sb_quadword==2 && mcu0_sb_data_array_QW2_cnt[j+1]>0) ) begin
            SBQW2=1;
    
      if (mcu0_sb_quadword==2) begin
          corrupted_mcu0_sb_mcu0_fsr0_data[119:0] = `MCU0.mcu_fsr0_data[119:0] ^ ( return_120_bits_sb_mask ( mcu0_sb_bit_time_mask, mcu0_sb_lane_mask ) ) ;
    `PR_ALWAYS ("mcu_fmon", `ALWAYS, "INFO: MCU0 SB QW2: orig. fsr0 data [119:0] was %x, modif. fsr0 data [119:0] is %x",`MCU0.mcu_fsr0_data[119:0], corrupted_mcu0_sb_mcu0_fsr0_data[119:0]);
    force `MCU0.mcu_fsr0_data[119:0] = corrupted_mcu0_sb_mcu0_fsr0_data[119:0];
    @(posedge drl2clk);
    release `MCU0.mcu_fsr0_data[119:0];
    end
    end

    @(posedge drl2clk);

	found=0; i=0; j=-1;
	for (i=0; i<`MAX_CRC_ERRORS; i=i+1)
	  begin
	  if (mcu0_sb_data_array_QW3[i][119:0]==`MCU0.mcu_fsr0_data[119:0] && found==0 && mcu0_sb_quadword==3)
		begin found=1; j=i; end
	  if ( found==0 && !(mcu0_sb_data_array_QW3[i][119:0]===120'bx) && mcu0_sb_quadword==3) 
		j=i;
	  end
          if (found==0 && (S%delay_crc==1))
            begin
              if (mcu0_sb_quadword==3) begin
		        mcu0_sb_data_array_QW3[j+1][119:0]=`MCU0.mcu_fsr0_data[119:0];
		        if (mcu0_inject_fbu_err==1)
                    mcu0_sb_data_array_QW3_cnt[j+1]=3;
		        else
                    mcu0_sb_data_array_QW3_cnt[j+1]=1;
		    end
            end

	if ( (mcu0_inject_fbu_err==1 && found==1 && mcu0_sb_quadword==3 && mcu0_sb_data_array_QW3_cnt[j]>0) ||
         (found==0 && mcu0_sb_quadword==3 && mcu0_sb_data_array_QW3_cnt[j+1]>0) ) begin
            SBQW3=1;
    
      if (mcu0_sb_quadword==3) begin
          corrupted_mcu0_sb_mcu0_fsr0_data[119:0] = `MCU0.mcu_fsr0_data[119:0] ^ ( return_120_bits_sb_mask ( mcu0_sb_bit_time_mask, mcu0_sb_lane_mask ) ) ;
    `PR_ALWAYS ("mcu_fmon", `ALWAYS, "INFO: MCU0 SB QW3: orig. fsr0 data [119:0] was %x, modif. fsr0 data [119:0] is %x",`MCU0.mcu_fsr0_data[119:0], corrupted_mcu0_sb_mcu0_fsr0_data[119:0]);
    force `MCU0.mcu_fsr0_data[119:0] = corrupted_mcu0_sb_mcu0_fsr0_data[119:0];
    @(posedge drl2clk);
    release `MCU0.mcu_fsr0_data[119:0];
    end
    end

    @(posedge drl2clk);

	found=0; i=0; j=-1;
	for (i=0; i<`MAX_CRC_ERRORS; i=i+1)
	  begin
	  if (mcu0_sb_data_array_QW4[i][119:0]==`MCU0.mcu_fsr0_data[119:0] && found==0 && mcu0_sb_quadword==4)
		begin found=1; j=i; end
	  if ( found==0 && !(mcu0_sb_data_array_QW4[i][119:0]===120'bx) && mcu0_sb_quadword==4) 
		j=i;
	  end
          if (found==0 && (S%delay_crc==1))
            begin
              if (mcu0_sb_quadword==4) begin
		        mcu0_sb_data_array_QW4[j+1][119:0]=`MCU0.mcu_fsr0_data[119:0];
		        if (mcu0_inject_fbu_err==1)
                    mcu0_sb_data_array_QW4_cnt[j+1]=3;
		        else
                    mcu0_sb_data_array_QW4_cnt[j+1]=1;
		    end
            end

	if ( (mcu0_inject_fbu_err==1 && found==1 && mcu0_sb_quadword==4 && mcu0_sb_data_array_QW4_cnt[j]>0) ||
         (found==0 && mcu0_sb_quadword==4 && mcu0_sb_data_array_QW4_cnt[j+1]>0) ) begin
            SBQW4=1;
    
      if (mcu0_sb_quadword==4) begin
          corrupted_mcu0_sb_mcu0_fsr0_data[119:0] = `MCU0.mcu_fsr0_data[119:0] ^ ( return_120_bits_sb_mask ( mcu0_sb_bit_time_mask, mcu0_sb_lane_mask ) ) ;
    `PR_ALWAYS ("mcu_fmon", `ALWAYS, "INFO: MCU0 SB QW4: orig. fsr0 data [119:0] was %x, modif. fsr0 data [119:0] is %x",`MCU0.mcu_fsr0_data[119:0], corrupted_mcu0_sb_mcu0_fsr0_data[119:0]);
    force `MCU0.mcu_fsr0_data[119:0] = corrupted_mcu0_sb_mcu0_fsr0_data[119:0];
    @(posedge drl2clk);
    release `MCU0.mcu_fsr0_data[119:0];
    end
    end

    if (found==0) begin
   	if (mcu0_sb_quadword==1 && mcu0_sb_data_array_QW1_cnt[j+1]>0) mcu0_sb_data_array_QW1_cnt[j+1]=mcu0_sb_data_array_QW1_cnt[j+1]-1;
    if (mcu0_sb_quadword==2 && mcu0_sb_data_array_QW2_cnt[j+1]>0) mcu0_sb_data_array_QW2_cnt[j+1]=mcu0_sb_data_array_QW2_cnt[j+1]-1;
    if (mcu0_sb_quadword==3 && mcu0_sb_data_array_QW3_cnt[j+1]>0) mcu0_sb_data_array_QW3_cnt[j+1]=mcu0_sb_data_array_QW3_cnt[j+1]-1;
    if (mcu0_sb_quadword==4 && mcu0_sb_data_array_QW4_cnt[j+1]>0) mcu0_sb_data_array_QW4_cnt[j+1]=mcu0_sb_data_array_QW4_cnt[j+1]-1;
    end
    else begin
   	if (mcu0_sb_quadword==1 && mcu0_sb_data_array_QW1_cnt[j]>0) mcu0_sb_data_array_QW1_cnt[j]=mcu0_sb_data_array_QW1_cnt[j]-1;
    if (mcu0_sb_quadword==2 && mcu0_sb_data_array_QW2_cnt[j]>0) mcu0_sb_data_array_QW2_cnt[j]=mcu0_sb_data_array_QW2_cnt[j]-1;
    if (mcu0_sb_quadword==3 && mcu0_sb_data_array_QW3_cnt[j]>0) mcu0_sb_data_array_QW3_cnt[j]=mcu0_sb_data_array_QW3_cnt[j]-1;
    if (mcu0_sb_quadword==4 && mcu0_sb_data_array_QW4_cnt[j]>0) mcu0_sb_data_array_QW4_cnt[j]=mcu0_sb_data_array_QW4_cnt[j]-1;
    end
    end
            SBQW1=0; SBQW2=0; SBQW3=0; SBQW4=0;
            trigger_SB=0;

`ifdef FC_CRC_INJECT
end
`endif
      
`else //mcusat
      if ( mcu0_sb_err_enable==1 && 
      (!mcu0_esr_fbr && !mcu0_esr_fbu) && (~mcu0_esr_fbu || mcu0_inject_fbu_err) &&
      ((`MCU0.fbdic.fbdic_config_reg_write==1'b1 && ~mcu_bug_111483) ||
       (`MCU0.fbdic.fbdic_config_reg_read==1'b1 && ~mcu_bug_111547) ||
       (`MCU0.fbdic.fbdic_sync_frame_req==1'b1 && ~mcu_bug_111811) ||
       `MCU0.fbdic.fbdic_scr_frame_req==1'b1 ||
       `MCU0.fbdic.fbdic_issue_pre_all_cmd ||
       `MCU0.fbdic.fbdic_issue_cke_cmd ||
       mcu0_drif_dram_cmd_a==`ACT ||
       mcu0_drif_dram_cmd_a==`WR ||
       mcu0_drif_dram_cmd_a==`RD || 
       mcu0_drif_dram_cmd_b==`ACT ||
       mcu0_drif_dram_cmd_b==`WR ||
       mcu0_drif_dram_cmd_b==`WRDATA || 
      (mcu0_drif_dram_cmd_b==`CMD_OTHER && mcu0_drif_dram_addr_b == `CMD_OTHER_REF) || 
      (mcu0_drif_dram_cmd_c==`CMD_OTHER && mcu0_drif_dram_addr_c == `CMD_OTHER_PDE) || 
      (mcu0_drif_dram_cmd_c==`CMD_OTHER && mcu0_drif_dram_addr_c == `CMD_OTHER_SRPDX) || 
       mcu0_drif_dram_cmd_c==`ACT || 
       mcu0_drif_dram_cmd_c==`WR) && 
      (`MCU0.drif.pdmc0.pdmc_pd_cnt < 6'h23) &&
      (mcu0_sb_channel_error_cnt>0) &&
      (`MCU0.drif.drif_err_state == 5'h1 || mcu0_inject_fbu_err))
          begin

    if (mcu0_sb_err_random)
      repeat (3+mcu0_sb_random_cycle) @ (posedge drl2clk);
    else
      repeat (3) @ (posedge drl2clk);
    repeat (10) @ (posedge sclk);


    if (mcu0_enable_ch0_err_inj) begin
      force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_frame_num = 12'h1;

      if (mcu0_sb_err_random) begin
        if (mcu0_sb_bit_time_mask[0]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps0_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps0_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[1]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps1_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps1_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[2]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps2_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps2_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[3]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps3_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps3_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[4]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps4_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps4_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[5]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps5_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps5_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[6]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps6_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps6_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[7]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps7_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps7_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[8]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps8_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps8_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[9]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps9_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps9_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[10]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps10_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps10_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[11]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps11_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps11_crc_mask = mcu0_sb_lane_mask;
        end
      end
                 
    if (mcu0_inject_fbu_err && !mcu0_esr_fbu)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBU on CH0 SB - MCU0 (mcu0_sb_bit_time_mask[11:0] is %b, mcu0_sb_lane_mask[9:0] is %b)",mcu0_sb_bit_time_mask,mcu0_sb_lane_mask);
    else if (!mcu0_esr_fbr)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBR on CH0 SB - MCU0 (mcu0_sb_bit_time_mask[11:0] is %b, mcu0_sb_lane_mask[9:0] is %b)",mcu0_sb_bit_time_mask,mcu0_sb_lane_mask);

    end

    if (mcu0_enable_ch1_err_inj) begin
      force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_frame_num = 12'h1;

      if (mcu0_sb_err_random) begin
        if (mcu0_sb_bit_time_mask[0]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps0_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps0_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[1]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps1_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps1_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[2]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps2_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps2_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[3]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps3_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps3_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[4]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps4_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps4_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[5]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps5_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps5_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[6]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps6_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps6_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[7]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps7_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps7_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[8]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps8_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps8_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[9]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps9_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps9_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[10]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps10_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps10_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[11]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps11_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps11_crc_mask = mcu0_sb_lane_mask;
        end
      end
                 
    if (mcu0_inject_fbu_err && !mcu0_esr_fbu)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBU on CH1 SB - MCU0 (mcu0_sb_bit_time_mask[11:0] is %b, mcu0_sb_lane_mask[9:0] is %b)",mcu0_sb_bit_time_mask,mcu0_sb_lane_mask);
    else if (!mcu0_esr_fbr)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBR on CH1 SB - MCU0 (mcu0_sb_bit_time_mask[11:0] is %b, mcu0_sb_lane_mask[9:0] is %b)",mcu0_sb_bit_time_mask,mcu0_sb_lane_mask);

    end

    repeat (1) @ (posedge sclk);

    release tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_frame_num; 

    release tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_frame_num; 

    if (mcu0_sb_err_random==0)
      mcu0_sb_channel_error_cnt=mcu0_sb_channel_error_cnt - 1;
    else begin
      mcu0_sb_err_enable = 0;
      mcu0_sb_lane_mask = 10'h1;
      mcu0_sb_bit_time_mask = 12'h1;
    end
  end
`endif
end

end

// --- MCU1 ---

always @(fbdic_fbd_state_1)
begin
mcu1_sb_channel_error_cnt_tmp = mcu1_sb_channel_error_cnt;
end

// If an error is detected and MCU went to disable state, stop the error
// injection
always @(posedge drl2clk)
begin

     if ((mcu1_fbdic_tclktrain_done[1] == 1'b1)||
            (mcu1_fbdic_testing_done[1] == 1'b1) ||
               (mcu1_fbdic_polling_done[1] == 1'b1))
                begin
                        repeat (50) @(posedge drl2clk);
                        if(fbdic_fbd_state_1 == 0)
                        begin
                                mcu1_training_err_enable = 0;
    `PR_DEBUG("mcu_fmon",`DEBUG," DISABLED Err INJECTION IN TRAINING SEQUENCE");
                        end
                end


end

always @(posedge drl2clk)
begin

@(posedge drl2clk);

  if ((mcu1_training_err_enable == 1) &&
   (fbdic_fbd_state_1 == 2 || fbdic_fbd_state_1 == 3  ||
    fbdic_fbd_state_1 == 4 || fbdic_fbd_state_1 == 5) &&
   ( mcu1_sb_channel_error_cnt_tmp>0 ) )
  begin

     if( fbdic_fbd_state_1 == 2 )
     begin
          repeat (100) @(posedge drl2clk);
     end
     else
     begin
          repeat (30) @(posedge drl2clk);
     end

    `PR_DEBUG("mcu_fmon",`DEBUG," Entered Err Injection in TRAINING SEQUENCE SB Channel");

    if (mcu1_enable_ch0_err_inj)
    begin
      force tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps_frame_num = 12'h1;
    end

    if (mcu1_enable_ch1_err_inj)
    begin
      force tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps_frame_num = 12'h1;
    end

    repeat (1) @ (posedge sclk);

    release tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps_frame_num;

    mcu1_sb_channel_error_cnt_tmp = mcu1_sb_channel_error_cnt_tmp - 1;

    repeat (3) @ (posedge sclk);
  end // if (mcu1_training_err_enable ..
end



always @ (          mcu1_drif_dram_cmd_a or 
                    mcu1_drif_dram_cmd_b or 
                    mcu1_drif_dram_cmd_c or 
                    `MCU1.fbdic.fbdic_config_reg_write or 
                    `MCU1.fbdic.fbdic_config_reg_read or 
                    `MCU1.fbdic.fbdic_scr_frame_req or 
                    `MCU1.fbdic.fbdic_sync_frame_req or 
                    `MCU1.fbdic.fbdic_issue_pre_all_cmd or 
                    `MCU1.fbdic.fbdic_issue_cke_cmd
        ) 
begin
if (enabled && ~ras_corner_case)
begin

  // --------- Random SB CRC Err Injection --------
  if (mcu1_sb_err_random) begin
    mcu1_sb_random_cycle = ({$random} % 3);
    if (mcu1_sb_crc_multiple_bit_times)
      mcu1_sb_bit_time_mask = $random;
    else begin
      mcu1_sb_random_bit_time = ({$random} % BIT_TIMES);
      mcu1_sb_bit_time_mask = mcu1_sb_bit_time_mask << mcu1_sb_random_bit_time;
    end
    if (mcu1_sb_crc_multiple_lanes)
      mcu1_sb_lane_mask = $random;
    else begin
      mcu1_sb_random_lane = ({$random} % SB_LANES);
      mcu1_sb_lane_mask = mcu1_sb_lane_mask << mcu1_sb_random_lane;
    end
    mcu1_sb_random_val = ({$random} % 100);
    if (!(mcu1_sb_random_val > MCU1_SB_RANDOM_WEIGHT)) mcu1_sb_err_enable=1;
  end




  if ( !stop_mcu1_sb_mask && !($time < stop_mcu1_sb_crc_inj_time) && !(stop_mcu1_sb_crc_inj_time == 0) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Stopping crc err injection on SB channel for MCU1, time now is %d",$time);
     force mcu1_sb_err_enable=0;
     stop_mcu1_sb_mask = 1;
    end
  else if ( !restart_mcu1_sb_mask && !($time < restart_mcu1_sb_crc_inj_time) && !(restart_mcu1_sb_crc_inj_time == 0) && (restart_mcu1_sb_crc_inj_time > stop_mcu1_sb_crc_inj_time) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Restarting crc err injection on SB channel for MCU1, time now is %d",$time);
     release mcu1_sb_err_enable;
     restart_mcu1_sb_mask=1;
     end
  else if ( !restart_stop_mcu1_sb_mask && !($time < restart_stop_mcu1_sb_crc_inj_time) && !(restart_stop_mcu1_sb_crc_inj_time == 0) && (restart_stop_mcu1_sb_crc_inj_time > restart_mcu1_sb_crc_inj_time) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Stopping the restarted crc err injection on SB channel for MCU1, time now is %d",$time);
     force mcu1_sb_err_enable=0;
     restart_stop_mcu1_sb_mask=1;
     end



   if ( ( $test$plusargs("INJECT_CRC_MCU1_SB_ERRQ") && (mcu1_sb_err < 8) && mcu1_sb_err_random ) &&
      ( `MCU1.drif.reqq.drq0.drq_rdq_full == 0 && `MCU1.drif.reqq.drq0.drq_wrq_full == 0 ) &&   // check both rd and wr queues on both channels are empty
      ( `MCU1.drif.reqq.drq1.drq_rdq_full == 0 && `MCU1.drif.reqq.drq1.drq_wrq_full == 0 ) &&
      ( `MCU1.drif.reqq.drq0.drq_empty == 1 && `MCU1.drif.reqq.drq1.drq_empty == 1 ) &&         // check channel 0/1 dram rd/wr queues 
      ( `MCU1.drif.errq.errq_empty == 1 && `MCU1.drif.reqq.woq_err_fifo_empty == 1 ) &&         // check also dram rd/wr ecc/crc error fifo
`ifdef FC_CRC_INJECT
      passed_bootEnd_mask==1 &&
`endif
      ((`MCU1.fbdic.fbdic_config_reg_write==1'b1 && ~mcu_bug_111483) ||
       (`MCU1.fbdic.fbdic_config_reg_read==1'b1 && ~mcu_bug_111547) ||
       (`MCU1.fbdic.fbdic_sync_frame_req==1'b1 && ~mcu_bug_111811) ||
       `MCU1.fbdic.fbdic_scr_frame_req==1'b1 ||
       `MCU1.fbdic.fbdic_issue_pre_all_cmd ||
       `MCU1.fbdic.fbdic_issue_cke_cmd ||
       mcu1_drif_dram_cmd_a==`ACT ||
       mcu1_drif_dram_cmd_a==`WR ||
       mcu1_drif_dram_cmd_a==`RD || 
       mcu1_drif_dram_cmd_b==`ACT ||
       mcu1_drif_dram_cmd_b==`WR ||
       mcu1_drif_dram_cmd_b==`WRDATA || 
      (mcu1_drif_dram_cmd_b==`CMD_OTHER && mcu1_drif_dram_addr_b == `CMD_OTHER_REF) || 
      (mcu1_drif_dram_cmd_c==`CMD_OTHER && mcu1_drif_dram_addr_c == `CMD_OTHER_PDE) || 
      (mcu1_drif_dram_cmd_c==`CMD_OTHER && mcu1_drif_dram_addr_c == `CMD_OTHER_SRPDX) || 
       mcu1_drif_dram_cmd_c==`ACT || 
       mcu1_drif_dram_cmd_c==`WR) ) 
       begin
     force mcu1_sb_err_enable=0;
       inject_crc_mcu1_sb_errq_mask=1;
      `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Injecting CRC errors on SB channel in MCU1 via RD/WR queue tracking, errq loop count is %d (max. allowed is 8)",mcu1_sb_err);
      end



      else if ( mcu1_sb_err_enable==1 && (~mcu1_esr_fbu || mcu1_inject_fbu_err) &&
      ((`MCU1.fbdic.fbdic_config_reg_write==1'b1 && ~mcu_bug_111483) ||
       (`MCU1.fbdic.fbdic_config_reg_read==1'b1 && ~mcu_bug_111547) ||
       (`MCU1.fbdic.fbdic_sync_frame_req==1'b1 && ~mcu_bug_111811) ||
       `MCU1.fbdic.fbdic_scr_frame_req==1'b1 ||
       `MCU1.fbdic.fbdic_issue_pre_all_cmd ||
       `MCU1.fbdic.fbdic_issue_cke_cmd ||
       mcu1_drif_dram_cmd_a==`ACT ||
       mcu1_drif_dram_cmd_a==`WR ||
       mcu1_drif_dram_cmd_a==`RD || 
       mcu1_drif_dram_cmd_b==`ACT || 
       mcu1_drif_dram_cmd_b==`WR || 
       mcu1_drif_dram_cmd_b==`WRDATA || 
      (mcu1_drif_dram_cmd_b==`CMD_OTHER && mcu1_drif_dram_addr_b == `CMD_OTHER_REF) || 
      (mcu1_drif_dram_cmd_c==`CMD_OTHER && mcu1_drif_dram_addr_c == `CMD_OTHER_PDE) || 
      (mcu1_drif_dram_cmd_c==`CMD_OTHER && mcu1_drif_dram_addr_c == `CMD_OTHER_SRPDX) || 
       mcu1_drif_dram_cmd_c==`ACT ||
       mcu1_drif_dram_cmd_c==`WR) &&
      (`MCU1.drif.pdmc0.pdmc_pd_cnt < 6'h23) &&
      (mcu1_sb_channel_error_cnt>0) &&
`ifdef FC_CRC_INJECT                                                 
      passed_bootEnd_mask==1 &&
      (!mcu1_esr_fbr && !mcu1_esr_fbu) && 
`endif
      (`MCU1.drif.drif_err_state == 5'h1 || mcu1_inject_fbu_err) )
        inject_crc_mcu1_sb_mask=1;


    if ( inject_crc_mcu1_sb_errq_mask==1 || (inject_crc_mcu1_sb_errq_mask==0 && inject_crc_mcu1_sb_mask==1 ) )
        begin


    if (mcu1_sb_err_random)
      repeat (3+mcu1_sb_random_cycle) @ (posedge drl2clk);
    else
      repeat (3) @ (posedge drl2clk);
    repeat (10) @ (posedge sclk);



    mcu1_sb_err = mcu1_sb_err + 1;
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "MCU1: SB --- injecting CRC error no. %d", mcu1_sb_err);
    

    if (mcu1_enable_ch0_err_inj) begin
      force tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps_frame_num = 12'h1;

      if (mcu1_sb_err_random) begin
        if (mcu1_sb_bit_time_mask[0]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps0_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps0_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[1]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps1_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps1_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[2]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps2_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps2_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[3]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps3_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps3_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[4]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps4_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps4_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[5]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps5_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps5_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[6]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps6_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps6_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[7]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps7_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps7_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[8]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps8_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps8_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[9]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps9_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps9_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[10]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps10_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps10_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[11]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps11_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps11_crc_mask = mcu1_sb_lane_mask;
        end
      end
                 
    if (mcu1_inject_fbu_err && !mcu1_esr_fbu)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBU on CH0 SB - MCU1 (mcu1_sb_bit_time_mask[11:0] is %b, mcu1_sb_lane_mask[9:0] is %b)",mcu1_sb_bit_time_mask,mcu1_sb_lane_mask);
    else if (!mcu1_esr_fbr)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBR on CH0 SB - MCU1 (mcu1_sb_bit_time_mask[11:0] is %b, mcu1_sb_lane_mask[9:0] is %b)",mcu1_sb_bit_time_mask,mcu1_sb_lane_mask);

    end

    if (mcu1_enable_ch1_err_inj) begin
      force tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps_frame_num = 12'h1;

      if (mcu1_sb_err_random) begin
        if (mcu1_sb_bit_time_mask[0]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps0_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps0_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[1]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps1_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps1_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[2]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps2_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps2_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[3]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps3_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps3_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[4]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps4_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps4_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[5]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps5_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps5_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[6]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps6_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps6_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[7]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps7_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps7_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[8]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps8_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps8_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[9]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps9_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps9_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[10]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps10_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps10_crc_mask = mcu1_sb_lane_mask;
        end
        if (mcu1_sb_bit_time_mask[11]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps11_crc_mask = mcu1_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps11_crc_mask = mcu1_sb_lane_mask;
        end
      end

    if (mcu1_inject_fbu_err && !mcu1_esr_fbu)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBU on CH1 SB - MCU1 (mcu1_sb_bit_time_mask[11:0] is %b, mcu1_sb_lane_mask[9:0] is %b)",mcu1_sb_bit_time_mask,mcu1_sb_lane_mask);
    else if (!mcu1_esr_fbr)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBR on CH1 SB - MCU1 (mcu1_sb_bit_time_mask[11:0] is %b, mcu1_sb_lane_mask[9:0] is %b)",mcu1_sb_bit_time_mask,mcu1_sb_lane_mask);

    end

    repeat (1) @ (posedge sclk);

    release tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps_frame_num; 

    release tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps_frame_num; 

    inject_crc_mcu1_sb_mask=0;
    if (mcu1_sb_err_random==0)
      mcu1_sb_channel_error_cnt=mcu1_sb_channel_error_cnt - 1;
    else begin
      mcu1_sb_err_enable = 0;
      mcu1_sb_lane_mask = 10'h1;
      mcu1_sb_bit_time_mask = 12'h1;
    end
  end
end
end

// --- MCU2 ---

always @(fbdic_fbd_state_2)
begin
mcu2_sb_channel_error_cnt_tmp = mcu2_sb_channel_error_cnt;
end

// If an error is detected and MCU went to disable state, stop the error
// injection
always @(posedge drl2clk)
begin

     if ((mcu2_fbdic_tclktrain_done[1] == 1'b1)||
            (mcu2_fbdic_testing_done[1] == 1'b1) ||
               (mcu2_fbdic_polling_done[1] == 1'b1))
                begin
                        repeat (50) @(posedge drl2clk);
                        if(fbdic_fbd_state_2 == 0)
                        begin
                                mcu2_training_err_enable = 0;
    `PR_DEBUG("mcu_fmon",`DEBUG," DISABLED Err INJECTION IN TRAINING SEQUENCE");
                        end
                end


end

always @(posedge drl2clk)
begin

@(posedge drl2clk);

  if ((mcu2_training_err_enable == 1) &&
   (fbdic_fbd_state_2 == 2 || fbdic_fbd_state_2 == 3  ||
    fbdic_fbd_state_2 == 4 || fbdic_fbd_state_2 == 5) &&
   ( mcu2_sb_channel_error_cnt_tmp>0 ) )
  begin

     if( fbdic_fbd_state_2 == 2 )
     begin
          repeat (100) @(posedge drl2clk);
     end
     else
     begin
          repeat (30) @(posedge drl2clk);
     end

    `PR_DEBUG("mcu_fmon",`DEBUG," Entered Err Injection in TRAINING SEQUENCE SB Channel");

    if (mcu2_enable_ch0_err_inj)
    begin
      force tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps_frame_num = 12'h1;
    end

    if (mcu2_enable_ch1_err_inj)
    begin
      force tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps_frame_num = 12'h1;
    end

    repeat (1) @ (posedge sclk);

    release tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps_frame_num;

    mcu2_sb_channel_error_cnt_tmp = mcu2_sb_channel_error_cnt_tmp - 1;

    repeat (3) @ (posedge sclk);
    repeat (3) @ (posedge sclk);
  end // if (mcu2_training_err_enable ..
end


always @ (          mcu2_drif_dram_cmd_a or 
                    mcu2_drif_dram_cmd_b or 
                    mcu2_drif_dram_cmd_c or 
                    `MCU2.fbdic.fbdic_config_reg_write or 
                    `MCU2.fbdic.fbdic_config_reg_read or 
                    `MCU2.fbdic.fbdic_scr_frame_req or 
                    `MCU2.fbdic.fbdic_sync_frame_req or 
                    `MCU2.fbdic.fbdic_issue_pre_all_cmd or 
                    `MCU2.fbdic.fbdic_issue_cke_cmd
        )
begin
if (enabled && ~ras_corner_case)
begin


  // --------- Random SB CRC Err Injection --------
  if (mcu2_sb_err_random) begin
    mcu2_sb_random_cycle = ({$random} % 3);
    if (mcu2_sb_crc_multiple_bit_times)
      mcu2_sb_bit_time_mask = $random;
    else begin
      mcu2_sb_random_bit_time = ({$random} % BIT_TIMES);
      mcu2_sb_bit_time_mask = mcu2_sb_bit_time_mask << mcu2_sb_random_bit_time;
    end
    if (mcu2_sb_crc_multiple_lanes)
      mcu2_sb_lane_mask = $random;
    else begin
      mcu2_sb_random_lane = ({$random} % SB_LANES);
      mcu2_sb_lane_mask = mcu2_sb_lane_mask << mcu2_sb_random_lane;
    end
    mcu2_sb_random_val = ({$random} % 100);
    if (!(mcu2_sb_random_val > MCU2_SB_RANDOM_WEIGHT)) mcu2_sb_err_enable=1;
  end




  if ( !stop_mcu2_sb_mask && !($time < stop_mcu2_sb_crc_inj_time) && !(stop_mcu2_sb_crc_inj_time == 0) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Stopping crc err injection on SB channel for MCU2, time now is %d",$time);
     force mcu2_sb_err_enable=0;
     stop_mcu2_sb_mask = 1;
    end
  else if ( !restart_mcu2_sb_mask && !($time < restart_mcu2_sb_crc_inj_time) && !(restart_mcu2_sb_crc_inj_time == 0) && (restart_mcu2_sb_crc_inj_time > stop_mcu2_sb_crc_inj_time) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Restarting crc err injection on SB channel for MCU2, time now is %d",$time);
     release mcu2_sb_err_enable;
     restart_mcu2_sb_mask=1;
     end
  else if ( !restart_stop_mcu2_sb_mask && !($time < restart_stop_mcu2_sb_crc_inj_time) && !(restart_stop_mcu2_sb_crc_inj_time == 0) && (restart_stop_mcu2_sb_crc_inj_time > restart_mcu2_sb_crc_inj_time) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Stopping the restarted crc err injection on SB channel for MCU2, time now is %d",$time);
     force mcu2_sb_err_enable=0;
     restart_stop_mcu2_sb_mask=1;
     end



   if ( ( $test$plusargs("INJECT_CRC_MCU2_SB_ERRQ") && (mcu2_sb_err < 8) && mcu2_sb_err_random ) &&
      ( `MCU2.drif.reqq.drq0.drq_rdq_full == 0 && `MCU2.drif.reqq.drq0.drq_wrq_full == 0 ) &&   // check both rd and wr queues on both channels are empty
      ( `MCU2.drif.reqq.drq1.drq_rdq_full == 0 && `MCU2.drif.reqq.drq1.drq_wrq_full == 0 ) &&
      ( `MCU2.drif.reqq.drq0.drq_empty == 1 && `MCU2.drif.reqq.drq1.drq_empty == 1 ) &&         // check channel 0/1 dram rd/wr queues 
      ( `MCU2.drif.errq.errq_empty == 1 && `MCU2.drif.reqq.woq_err_fifo_empty == 1 ) &&         // check also dram rd/wr ecc/crc error fifo
`ifdef FC_CRC_INJECT
      passed_bootEnd_mask==1 &&
`endif
      ((`MCU2.fbdic.fbdic_config_reg_write==1'b1 && ~mcu_bug_111483) ||
       (`MCU2.fbdic.fbdic_config_reg_read==1'b1 && ~mcu_bug_111547) ||
       (`MCU2.fbdic.fbdic_sync_frame_req==1'b1 && ~mcu_bug_111811) ||
       `MCU2.fbdic.fbdic_scr_frame_req==1'b1 ||
       `MCU2.fbdic.fbdic_issue_pre_all_cmd ||
       `MCU2.fbdic.fbdic_issue_cke_cmd ||
       mcu2_drif_dram_cmd_a==`ACT ||
       mcu2_drif_dram_cmd_a==`WR ||
       mcu2_drif_dram_cmd_a==`RD || 
       mcu2_drif_dram_cmd_b==`ACT ||
       mcu2_drif_dram_cmd_b==`WR ||
       mcu2_drif_dram_cmd_b==`WRDATA || 
      (mcu2_drif_dram_cmd_b==`CMD_OTHER && mcu2_drif_dram_addr_b == `CMD_OTHER_REF) || 
      (mcu2_drif_dram_cmd_c==`CMD_OTHER && mcu2_drif_dram_addr_c == `CMD_OTHER_PDE) || 
      (mcu2_drif_dram_cmd_c==`CMD_OTHER && mcu2_drif_dram_addr_c == `CMD_OTHER_SRPDX) || 
       mcu2_drif_dram_cmd_c==`ACT || 
       mcu2_drif_dram_cmd_c==`WR) )
       begin
     force mcu2_sb_err_enable=0;
       inject_crc_mcu2_sb_errq_mask=1;
      `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Injecting CRC errors on SB channel in MCU2 via RD/WR queue tracking, errq loop count is %d (max. allowed is 8)",mcu2_sb_err);
      end


      else if ( mcu2_sb_err_enable==1 && (~mcu2_esr_fbu || mcu2_inject_fbu_err) &&
      ((`MCU2.fbdic.fbdic_config_reg_write==1'b1 && ~mcu_bug_111483) ||
       (`MCU2.fbdic.fbdic_config_reg_read==1'b1 && ~mcu_bug_111547) ||
       (`MCU2.fbdic.fbdic_sync_frame_req==1'b1 && ~mcu_bug_111811) ||
       `MCU2.fbdic.fbdic_scr_frame_req==1'b1 ||
       `MCU2.fbdic.fbdic_issue_pre_all_cmd ||
       `MCU2.fbdic.fbdic_issue_cke_cmd ||
       mcu2_drif_dram_cmd_a==`ACT ||
       mcu2_drif_dram_cmd_a==`WR ||
       mcu2_drif_dram_cmd_a==`RD || 
       mcu2_drif_dram_cmd_b==`ACT || 
       mcu2_drif_dram_cmd_b==`WR || 
       mcu2_drif_dram_cmd_b==`WRDATA || 
      (mcu2_drif_dram_cmd_b==`CMD_OTHER && mcu2_drif_dram_addr_b == `CMD_OTHER_REF) || 
      (mcu2_drif_dram_cmd_c==`CMD_OTHER && mcu2_drif_dram_addr_c == `CMD_OTHER_PDE) || 
      (mcu2_drif_dram_cmd_c==`CMD_OTHER && mcu2_drif_dram_addr_c == `CMD_OTHER_SRPDX) || 
       mcu2_drif_dram_cmd_c==`ACT ||
       mcu2_drif_dram_cmd_c==`WR) &&
      (`MCU2.drif.pdmc0.pdmc_pd_cnt < 6'h23) &&
      (mcu2_sb_channel_error_cnt>0) &&
`ifdef FC_CRC_INJECT                                                 
      passed_bootEnd_mask==1 &&
      (!mcu2_esr_fbr && !mcu2_esr_fbu) && 
`endif
      (`MCU2.drif.drif_err_state == 5'h1 || mcu2_inject_fbu_err) )
        inject_crc_mcu2_sb_mask=1;


    if ( inject_crc_mcu2_sb_errq_mask==1 || (inject_crc_mcu2_sb_errq_mask==0 && inject_crc_mcu2_sb_mask==1 ) )
        begin


    if (mcu2_sb_err_random)
      repeat (3+mcu2_sb_random_cycle) @ (posedge drl2clk);
    else
      repeat (3) @ (posedge drl2clk);
    repeat (10) @ (posedge sclk);



    mcu2_sb_err = mcu2_sb_err + 1;
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "MCU2: SB --- injecting CRC error no. %d", mcu2_sb_err);
    

    if (mcu2_enable_ch0_err_inj) begin
      force tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps_frame_num = 12'h1;

      if (mcu2_sb_err_random) begin
        if (mcu2_sb_bit_time_mask[0]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps0_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps0_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[1]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps1_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps1_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[2]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps2_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps2_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[3]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps3_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps3_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[4]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps4_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps4_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[5]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps5_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps5_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[6]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps6_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps6_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[7]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps7_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps7_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[8]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps8_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps8_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[9]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps9_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps9_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[10]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps10_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps10_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[11]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps11_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps11_crc_mask = mcu2_sb_lane_mask;
        end
      end
                 
    if (mcu2_inject_fbu_err && !mcu2_esr_fbu)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBU on CH0 SB - MCU2 (mcu2_sb_bit_time_mask[11:0] is %b, mcu2_sb_lane_mask[9:0] is %b)",mcu2_sb_bit_time_mask,mcu2_sb_lane_mask);
    else if (!mcu2_esr_fbr)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBR on CH0 SB - MCU2 (mcu2_sb_bit_time_mask[11:0] is %b, mcu2_sb_lane_mask[9:0] is %b)",mcu2_sb_bit_time_mask,mcu2_sb_lane_mask);

    end

    if (mcu2_enable_ch1_err_inj) begin
      force tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps_frame_num = 12'h1;

      if (mcu2_sb_err_random) begin
        if (mcu2_sb_bit_time_mask[0]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps0_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps0_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[1]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps1_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps1_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[2]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps2_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps2_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[3]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps3_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps3_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[4]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps4_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps4_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[5]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps5_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps5_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[6]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps6_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps6_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[7]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps7_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps7_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[8]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps8_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps8_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[9]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps9_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps9_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[10]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps10_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps10_crc_mask = mcu2_sb_lane_mask;
        end
        if (mcu2_sb_bit_time_mask[11]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps11_crc_mask = mcu2_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps11_crc_mask = mcu2_sb_lane_mask;
        end
      end

    if (mcu2_inject_fbu_err && !mcu2_esr_fbu)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBU on CH1 SB - MCU2 (mcu2_sb_bit_time_mask[11:0] is %b, mcu2_sb_lane_mask[9:0] is %b)",mcu2_sb_bit_time_mask,mcu2_sb_lane_mask);
    else if (!mcu2_esr_fbr)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBR on CH1 SB - MCU2 (mcu2_sb_bit_time_mask[11:0] is %b, mcu2_sb_lane_mask[9:0] is %b)",mcu2_sb_bit_time_mask,mcu2_sb_lane_mask);

    end

    repeat (1) @ (posedge sclk);

    release tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps_frame_num; 

    release tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps_frame_num; 

    inject_crc_mcu2_sb_mask=0;
    if (mcu2_sb_err_random==0)
      mcu2_sb_channel_error_cnt=mcu2_sb_channel_error_cnt - 1;
    else begin
      mcu2_sb_err_enable = 0;
      mcu2_sb_lane_mask = 10'h1;
      mcu2_sb_bit_time_mask = 12'h1;
    end
  end
end
end

// --- MCU3 ---

always @(fbdic_fbd_state_3)
begin
mcu3_sb_channel_error_cnt_tmp = mcu3_sb_channel_error_cnt;
end

// If an error is detected and MCU went to disable state, stop the error
// injection
always @(posedge drl2clk)
begin

     if ((mcu3_fbdic_tclktrain_done[1] == 1'b1)||
            (mcu3_fbdic_testing_done[1] == 1'b1) ||
               (mcu3_fbdic_polling_done[1] == 1'b1))
                begin
                        repeat (50) @(posedge drl2clk);
                        if(fbdic_fbd_state_3 == 0)
                        begin
                                mcu3_training_err_enable = 0;
    `PR_DEBUG("mcu_fmon",`DEBUG," DISABLED Err INJECTION IN TRAINING SEQUENCE");
                        end
                end


end

always @(posedge drl2clk)
begin

@(posedge drl2clk);

  if ((mcu3_training_err_enable == 1) &&
   (fbdic_fbd_state_3 == 2 || fbdic_fbd_state_3 == 3  ||
    fbdic_fbd_state_3 == 4 || fbdic_fbd_state_3 == 5) &&
   ( mcu3_sb_channel_error_cnt_tmp>0 ) )
  begin

     if( fbdic_fbd_state_3 == 2 )
     begin
          repeat (100) @(posedge drl2clk);
     end
     else
     begin
          repeat (30) @(posedge drl2clk);
     end

    `PR_DEBUG("mcu_fmon",`DEBUG," Entered Err Injection in TRAINING SEQUENCE SB Channel");

    if (mcu3_enable_ch0_err_inj)
    begin
      force tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps_frame_num = 12'h1;
    end

    if (mcu3_enable_ch1_err_inj)
    begin
      force tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps_frame_num = 12'h1;
    end

    repeat (1) @ (posedge sclk);

    release tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps_frame_num;

    mcu3_sb_channel_error_cnt_tmp = mcu3_sb_channel_error_cnt_tmp - 1;

    repeat (3) @ (posedge sclk);
  end // if (mcu3_training_err_enable ..
end


always @ (          mcu3_drif_dram_cmd_a or 
                    mcu3_drif_dram_cmd_b or 
                    mcu3_drif_dram_cmd_c or 
                    `MCU3.fbdic.fbdic_config_reg_write or 
                    `MCU3.fbdic.fbdic_config_reg_read or 
                    `MCU3.fbdic.fbdic_scr_frame_req or 
                    `MCU3.fbdic.fbdic_sync_frame_req or 
                    `MCU3.fbdic.fbdic_issue_pre_all_cmd or 
                    `MCU3.fbdic.fbdic_issue_cke_cmd
            ) 
begin
if (enabled && ~ras_corner_case)
begin

  // --------- Random SB CRC Err Injection --------
  if (mcu3_sb_err_random) begin
    mcu3_sb_random_cycle = ({$random} % 3);
    if (mcu3_sb_crc_multiple_bit_times)
      mcu3_sb_bit_time_mask = $random;
    else begin
      mcu3_sb_random_bit_time = ({$random} % BIT_TIMES);
      mcu3_sb_bit_time_mask = mcu3_sb_bit_time_mask << mcu3_sb_random_bit_time;
    end
    if (mcu3_sb_crc_multiple_lanes)
      mcu3_sb_lane_mask = $random;
    else begin
      mcu3_sb_random_lane = ({$random} % SB_LANES);
      mcu3_sb_lane_mask = mcu3_sb_lane_mask << mcu3_sb_random_lane;
    end
    mcu3_sb_random_val = ({$random} % 100);
    if (!(mcu3_sb_random_val > MCU3_SB_RANDOM_WEIGHT)) mcu3_sb_err_enable=1;
  end




  if ( !stop_mcu3_sb_mask && !($time < stop_mcu3_sb_crc_inj_time) && !(stop_mcu3_sb_crc_inj_time == 0) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Stopping crc err injection on SB channel for MCU3, time now is %d",$time);
     force mcu3_sb_err_enable=0;
     stop_mcu3_sb_mask = 1;
    end
  else if ( !restart_mcu3_sb_mask && !($time < restart_mcu3_sb_crc_inj_time) && !(restart_mcu3_sb_crc_inj_time == 0) && (restart_mcu3_sb_crc_inj_time > stop_mcu3_sb_crc_inj_time) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Restarting crc err injection on SB channel for MCU3, time now is %d",$time);
     release mcu3_sb_err_enable;
     restart_mcu3_sb_mask=1;
     end
  else if ( !restart_stop_mcu3_sb_mask && !($time < restart_stop_mcu3_sb_crc_inj_time) && !(restart_stop_mcu3_sb_crc_inj_time == 0) && (restart_stop_mcu3_sb_crc_inj_time > restart_mcu3_sb_crc_inj_time) )
    begin
     `PR_ALWAYS("mcu_fmon", `ALWAYS, "*** Stopping the restarted crc err injection on SB channel for MCU3, time now is %d",$time);
     force mcu3_sb_err_enable=0;
     restart_stop_mcu3_sb_mask=1;
     end



   if ( ( $test$plusargs("INJECT_CRC_MCU3_SB_ERRQ") && (mcu3_sb_err < 8) && mcu3_sb_err_random ) &&
      ( `MCU3.drif.reqq.drq0.drq_rdq_full == 0 && `MCU3.drif.reqq.drq0.drq_wrq_full == 0 ) &&   // check both rd and wr queues on both channels are empty
      ( `MCU3.drif.reqq.drq1.drq_rdq_full == 0 && `MCU3.drif.reqq.drq1.drq_wrq_full == 0 ) &&
      ( `MCU3.drif.reqq.drq0.drq_empty == 1 && `MCU3.drif.reqq.drq1.drq_empty == 1 ) &&         // check channel 0/1 dram rd/wr queues 
      ( `MCU3.drif.errq.errq_empty == 1 && `MCU3.drif.reqq.woq_err_fifo_empty == 1 ) &&         // check also dram rd/wr ecc/crc error fifo
`ifdef FC_CRC_INJECT
      passed_bootEnd_mask==1 &&
`endif
      ((`MCU3.fbdic.fbdic_config_reg_write==1'b1 && ~mcu_bug_111483) ||
       (`MCU3.fbdic.fbdic_config_reg_read==1'b1 && ~mcu_bug_111547) ||
       (`MCU3.fbdic.fbdic_sync_frame_req==1'b1 && ~mcu_bug_111811) ||
       `MCU3.fbdic.fbdic_scr_frame_req==1'b1 ||
       `MCU3.fbdic.fbdic_issue_pre_all_cmd ||
       `MCU3.fbdic.fbdic_issue_cke_cmd ||
       mcu3_drif_dram_cmd_a==`ACT ||
       mcu3_drif_dram_cmd_a==`WR ||
       mcu3_drif_dram_cmd_a==`RD || 
       mcu3_drif_dram_cmd_b==`ACT ||
       mcu3_drif_dram_cmd_b==`WR ||
       mcu3_drif_dram_cmd_b==`WRDATA || 
      (mcu3_drif_dram_cmd_b==`CMD_OTHER && mcu3_drif_dram_addr_b == `CMD_OTHER_REF) || 
      (mcu3_drif_dram_cmd_c==`CMD_OTHER && mcu3_drif_dram_addr_c == `CMD_OTHER_PDE) || 
      (mcu3_drif_dram_cmd_c==`CMD_OTHER && mcu3_drif_dram_addr_c == `CMD_OTHER_SRPDX) || 
       mcu3_drif_dram_cmd_c==`ACT || 
       mcu3_drif_dram_cmd_c==`WR) )
       begin
     force mcu3_sb_err_enable=0;
       inject_crc_mcu3_sb_errq_mask=1;
      `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Injecting CRC errors on SB channel in MCU3 via RD/WR queue tracking, errq loop count is %d (max. allowed is 8)",mcu3_sb_err);
      end


      else if ( mcu3_sb_err_enable==1 && (~mcu3_esr_fbu || mcu3_inject_fbu_err) &&
      ((`MCU3.fbdic.fbdic_config_reg_write==1'b1 && ~mcu_bug_111483) ||
       (`MCU3.fbdic.fbdic_config_reg_read==1'b1 && ~mcu_bug_111547) ||
       (`MCU3.fbdic.fbdic_sync_frame_req==1'b1 && ~mcu_bug_111811) ||
       `MCU3.fbdic.fbdic_scr_frame_req==1'b1 ||
       `MCU3.fbdic.fbdic_issue_pre_all_cmd ||
       `MCU3.fbdic.fbdic_issue_cke_cmd ||
       mcu3_drif_dram_cmd_a==`ACT ||
       mcu3_drif_dram_cmd_a==`WR ||
       mcu3_drif_dram_cmd_a==`RD || 
       mcu3_drif_dram_cmd_b==`ACT || 
       mcu3_drif_dram_cmd_b==`WR || 
       mcu3_drif_dram_cmd_b==`WRDATA || 
      (mcu3_drif_dram_cmd_b==`CMD_OTHER && mcu3_drif_dram_addr_b == `CMD_OTHER_REF) || 
      (mcu3_drif_dram_cmd_c==`CMD_OTHER && mcu3_drif_dram_addr_c == `CMD_OTHER_PDE) || 
      (mcu3_drif_dram_cmd_c==`CMD_OTHER && mcu3_drif_dram_addr_c == `CMD_OTHER_SRPDX) || 
       mcu3_drif_dram_cmd_c==`ACT ||
       mcu3_drif_dram_cmd_c==`WR) &&
      (`MCU3.drif.pdmc0.pdmc_pd_cnt < 6'h23) &&
      (mcu3_sb_channel_error_cnt>0) &&
`ifdef FC_CRC_INJECT                                                 
      passed_bootEnd_mask==1 &&
      (!mcu3_esr_fbr && !mcu3_esr_fbu) && 
`endif
      (`MCU3.drif.drif_err_state == 5'h1 || mcu3_inject_fbu_err) )
        inject_crc_mcu3_sb_mask=1;


    if ( inject_crc_mcu3_sb_errq_mask==1 || (inject_crc_mcu3_sb_errq_mask==0 && inject_crc_mcu3_sb_mask==1 ) )
        begin


    if (mcu3_sb_err_random)
      repeat (3+mcu3_sb_random_cycle) @ (posedge drl2clk);
    else
      repeat (3) @ (posedge drl2clk);
    repeat (10) @ (posedge sclk);



    mcu3_sb_err = mcu3_sb_err + 1;
    `PR_ALWAYS("mcu_fmon", `ALWAYS, "MCU3: SB --- injecting CRC error no. %d", mcu3_sb_err);


    if (mcu3_enable_ch0_err_inj) begin
      force tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps_frame_num = 12'h1;

      if (mcu3_sb_err_random) begin
        if (mcu3_sb_bit_time_mask[0]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps0_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps0_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[1]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps1_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps1_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[2]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps2_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps2_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[3]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps3_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps3_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[4]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps4_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps4_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[5]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps5_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps5_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[6]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps6_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps6_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[7]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps7_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps7_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[8]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps8_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps8_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[9]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps9_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps9_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[10]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps10_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps10_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[11]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps11_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps11_crc_mask = mcu3_sb_lane_mask;
        end
      end

    if (mcu3_inject_fbu_err && !mcu3_esr_fbu)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBU on CH0 SB - MCU3 (mcu3_sb_bit_time_mask[11:0] is %b, mcu3_sb_lane_mask[9:0] is %b)",mcu3_sb_bit_time_mask,mcu3_sb_lane_mask);
    else if (!mcu3_esr_fbr)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBR on CH0 SB - MCU3 (mcu3_sb_bit_time_mask[11:0] is %b, mcu3_sb_lane_mask[9:0] is %b)",mcu3_sb_bit_time_mask,mcu3_sb_lane_mask);

    end

    if (mcu3_enable_ch1_err_inj) begin
      force tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps_frame_num = 12'h1;

      if (mcu3_sb_err_random) begin
        if (mcu3_sb_bit_time_mask[0]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps0_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps0_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[1]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps1_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps1_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[2]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps2_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps2_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[3]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps3_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps3_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[4]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps4_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps4_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[5]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps5_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps5_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[6]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps6_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps6_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[7]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps7_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps7_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[8]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps8_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps8_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu3_sb_bit_time_mask[9]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps9_crc_mask = mcu3_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps9_crc_mask = mcu3_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[10]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps10_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps10_crc_mask = mcu0_sb_lane_mask;
        end
        if (mcu0_sb_bit_time_mask[11]) begin 
           force tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps11_crc_mask = mcu0_sb_lane_mask;
           force tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps11_crc_mask = mcu0_sb_lane_mask;
        end
      end

    if (mcu3_inject_fbu_err && !mcu3_esr_fbu)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBU on CH1 SB - MCU3 (mcu3_sb_bit_time_mask[11:0] is %b, mcu3_sb_lane_mask[9:0] is %b)",mcu3_sb_bit_time_mask,mcu3_sb_lane_mask);
    else if (!mcu3_esr_fbr)
    `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: Will inject FBR on CH1 SB - MCU3 (mcu3_sb_bit_time_mask[11:0] is %b, mcu3_sb_lane_mask[9:0] is %b)",mcu3_sb_bit_time_mask,mcu3_sb_lane_mask);

    end

    repeat (1) @ (posedge sclk);

    release tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps_frame_num; 

    release tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps_frame_num; 

    inject_crc_mcu3_sb_mask=0;
    if (mcu3_sb_err_random==0)
      mcu3_sb_channel_error_cnt=mcu3_sb_channel_error_cnt - 1;
    else begin
      mcu3_sb_err_enable = 0;
      mcu3_sb_lane_mask = 10'h1;
      mcu3_sb_bit_time_mask = 12'h1;
    end
  end
end
end

`endif


//--------------------------------
// FBD Channel Error Checkers
//-------------------------------

// --- FBR ---

// --- MCU0 ---

reg mcu0_l2t0_scb_secc_err_detected, mcu0_l2t1_scb_secc_err_detected;

always @ (posedge (mcu0_esr_fbr && enabled)) 
begin
  @ (negedge drl2clk);
  repeat (2) @ (negedge l2clk);
  if ((mcu0_syndrome_AA || mcu0_syndrome_AF || mcu0_syndrome_SPE) && `MCU0.mcu_l2t0_data_vld_r0) begin
                       if (mcu0_l2t0_scb_secc_err==1) mcu0_l2t0_scb_secc_err_detected = 1'b1;
    @ (negedge l2clk); if (mcu0_l2t0_scb_secc_err==1) mcu0_l2t0_scb_secc_err_detected = 1'b1;
    @ (negedge l2clk); if (mcu0_l2t0_scb_secc_err==1) mcu0_l2t0_scb_secc_err_detected = 1'b1;
    if (mcu0_l2t0_scb_secc_err_detected)
      `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: mcu_l2t0_scb_secc_err asserted when FBR (AA/AF/SPE) is logged");
    else
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: mcu_l2t0_scb_secc_err not asserted when FBR (AA/AF/SPE) is logged");
   @ (negedge l2clk);
   mcu0_l2t0_scb_secc_err_detected = 1'b0;
  end

  if ((mcu0_syndrome_AA || mcu0_syndrome_AF || mcu0_syndrome_SPE) && `MCU0.mcu_l2t1_data_vld_r0) begin
                       if (mcu0_l2t1_scb_secc_err==1) mcu0_l2t1_scb_secc_err_detected = 1'b1;
    @ (negedge l2clk); if (mcu0_l2t1_scb_secc_err==1) mcu0_l2t1_scb_secc_err_detected = 1'b1;
    @ (negedge l2clk); if (mcu0_l2t1_scb_secc_err==1) mcu0_l2t1_scb_secc_err_detected = 1'b1;
    if (mcu0_l2t1_scb_secc_err_detected)
      `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: mcu_l2t1_scb_secc_err asserted when FBR (AA/AF/SPE) is logged");
    else
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: mcu_l2t1_scb_secc_err not asserted when FBR (AA/AF/SPE) is logged");
   @ (negedge l2clk);
   mcu0_l2t1_scb_secc_err_detected = 1'b0;
  end
end

always @ (posedge (mcu0_esr_fbr && enabled)) 
begin
  @ (negedge drl2clk);
  @ (posedge `MCU0.rdata.rdata_ddr_cmp_sync_en_d2);
#10;
  if (mcu0_syndrome_C && `MCU0.mcu_l2t0_data_vld_r0) begin

    if (mcu0_l2t0_scb_secc_err!=1)
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: mcu_l2t0_scb_secc_err not asserted when FBR (C) is logged");
    else
      `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: mcu_l2t0_scb_secc_err asserted when FBR (C) is logged");
  end
  if (mcu0_syndrome_C && `MCU0.mcu_l2t1_data_vld_r0) begin
    if (mcu0_l2t1_scb_secc_err!=1)
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: mcu_l2t1_scb_secc_err not asserted when FBR (C) is logged");
    else
      `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: mcu_l2t1_scb_secc_err asserted when FBR (C) is logged");
  end
end

// --- MCU1 ---

reg mcu1_l2t0_scb_secc_err_detected, mcu1_l2t1_scb_secc_err_detected;

always @ (posedge (mcu1_esr_fbr && enabled)) 
begin
  @ (negedge drl2clk);
  repeat (2) @ (negedge l2clk);
  if ((mcu1_syndrome_AA || mcu1_syndrome_AF || mcu1_syndrome_SPE) && `MCU1.mcu_l2t0_data_vld_r0) begin
                       if (mcu1_l2t0_scb_secc_err==1) mcu1_l2t0_scb_secc_err_detected = 1'b1;
    @ (negedge l2clk); if (mcu1_l2t0_scb_secc_err==1) mcu1_l2t0_scb_secc_err_detected = 1'b1;
    @ (negedge l2clk); if (mcu1_l2t0_scb_secc_err==1) mcu1_l2t0_scb_secc_err_detected = 1'b1;
    if (mcu1_l2t0_scb_secc_err_detected)
      `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: mcu_l2t0_scb_secc_err asserted when FBR (AA/AF/SPE) is logged");
    else
      `PR_ERROR("mcu_fmon", `ERROR, "MCU1: mcu_l2t0_scb_secc_err not asserted when FBR (AA/AF/SPE) is logged");
   @ (negedge l2clk);
   mcu1_l2t0_scb_secc_err_detected = 1'b0;
  end

  if ((mcu1_syndrome_AA || mcu1_syndrome_AF || mcu1_syndrome_SPE) && `MCU1.mcu_l2t1_data_vld_r0) begin
                       if (mcu1_l2t1_scb_secc_err==1) mcu1_l2t1_scb_secc_err_detected = 1'b1;
    @ (negedge l2clk); if (mcu1_l2t1_scb_secc_err==1) mcu1_l2t1_scb_secc_err_detected = 1'b1;
    @ (negedge l2clk); if (mcu1_l2t1_scb_secc_err==1) mcu1_l2t1_scb_secc_err_detected = 1'b1;
    if (mcu1_l2t1_scb_secc_err_detected)
      `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: mcu_l2t1_scb_secc_err asserted when FBR (AA/AF/SPE) is logged");
    else
      `PR_ERROR("mcu_fmon", `ERROR, "MCU1: mcu_l2t1_scb_secc_err not asserted when FBR (AA/AF/SPE) is logged");
   @ (negedge l2clk);
   mcu1_l2t1_scb_secc_err_detected = 1'b0;
  end
end

always @ (posedge (mcu1_esr_fbr && enabled)) 
begin
  @ (negedge drl2clk);
  @ (posedge `MCU1.rdata.rdata_ddr_cmp_sync_en_d2);
#10;
  if (mcu1_syndrome_C && `MCU1.mcu_l2t0_data_vld_r0) begin
    if (mcu1_l2t0_scb_secc_err!=1)
      `PR_ERROR("mcu_fmon", `ERROR, "MCU1: mcu_l2t0_scb_secc_err not asserted when FBR (C) is logged");
    else
      `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: mcu_l2t0_scb_secc_err asserted when FBR (C) is logged");
  end
  if (mcu1_syndrome_C && `MCU1.mcu_l2t1_data_vld_r0) begin
    if (mcu1_l2t1_scb_secc_err!=1)
      `PR_ERROR("mcu_fmon", `ERROR, "MCU1: mcu_l2t1_scb_secc_err not asserted when FBR (C) is logged");
    else
      `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: mcu_l2t1_scb_secc_err asserted when FBR (C) is logged");
  end
end

// --- MCU2 ---

reg mcu2_l2t0_scb_secc_err_detected, mcu2_l2t1_scb_secc_err_detected;

always @ (posedge (mcu2_esr_fbr && enabled)) 
begin
  @ (negedge drl2clk);
  repeat (2) @ (negedge l2clk);
  if ((mcu2_syndrome_AA || mcu2_syndrome_AF || mcu2_syndrome_SPE) && `MCU2.mcu_l2t0_data_vld_r0) begin
                       if (mcu2_l2t0_scb_secc_err==1) mcu2_l2t0_scb_secc_err_detected = 1'b1;
    @ (negedge l2clk); if (mcu2_l2t0_scb_secc_err==1) mcu2_l2t0_scb_secc_err_detected = 1'b1;
    @ (negedge l2clk); if (mcu2_l2t0_scb_secc_err==1) mcu2_l2t0_scb_secc_err_detected = 1'b1;
    if (mcu2_l2t0_scb_secc_err_detected)
      `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: mcu_l2t0_scb_secc_err asserted when FBR (AA/AF/SPE) is logged");
    else
      `PR_ERROR("mcu_fmon", `ERROR, "MCU2: mcu_l2t0_scb_secc_err not asserted when FBR (AA/AF/SPE) is logged");
   @ (negedge l2clk);
   mcu2_l2t0_scb_secc_err_detected = 1'b0;
  end

  if ((mcu2_syndrome_AA || mcu2_syndrome_AF || mcu2_syndrome_SPE) && `MCU2.mcu_l2t1_data_vld_r0) begin
                       if (mcu2_l2t1_scb_secc_err==1) mcu2_l2t1_scb_secc_err_detected = 1'b1;
    @ (negedge l2clk); if (mcu2_l2t1_scb_secc_err==1) mcu2_l2t1_scb_secc_err_detected = 1'b1;
    @ (negedge l2clk); if (mcu2_l2t1_scb_secc_err==1) mcu2_l2t1_scb_secc_err_detected = 1'b1;
    if (mcu2_l2t1_scb_secc_err_detected)
      `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: mcu_l2t1_scb_secc_err asserted when FBR (AA/AF/SPE) is logged");
    else
      `PR_ERROR("mcu_fmon", `ERROR, "MCU2: mcu_l2t1_scb_secc_err not asserted when FBR (AA/AF/SPE) is logged");
   @ (negedge l2clk);
   mcu2_l2t1_scb_secc_err_detected = 1'b0;
  end
end

always @ (posedge (mcu2_esr_fbr && enabled)) 
begin
  @ (negedge drl2clk);
  @ (posedge `MCU2.rdata.rdata_ddr_cmp_sync_en_d2);
#10;
  if (mcu2_syndrome_C && `MCU2.mcu_l2t0_data_vld_r0) begin
    if (mcu2_l2t0_scb_secc_err!=1)
      `PR_ERROR("mcu_fmon", `ERROR, "MCU2: mcu_l2t0_scb_secc_err not asserted when FBR (C) is logged");
    else
      `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: mcu_l2t0_scb_secc_err asserted when FBR (C) is logged");
  end
  if (mcu2_syndrome_C && `MCU2.mcu_l2t1_data_vld_r0) begin
    if (mcu2_l2t1_scb_secc_err!=1)
      `PR_ERROR("mcu_fmon", `ERROR, "MCU2: mcu_l2t1_scb_secc_err not asserted when FBR (C) is logged");
    else
      `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: mcu_l2t1_scb_secc_err asserted when FBR (C) is logged");
  end
end

// --- MCU3 ---

reg mcu3_l2t0_scb_secc_err_detected, mcu3_l2t1_scb_secc_err_detected;

always @ (posedge (mcu3_esr_fbr && enabled)) 
begin
  @ (negedge drl2clk);
  repeat (2) @ (negedge l2clk);
  if ((mcu3_syndrome_AA || mcu3_syndrome_AF || mcu3_syndrome_SPE) && `MCU3.mcu_l2t0_data_vld_r0) begin
                       if (mcu3_l2t0_scb_secc_err==1) mcu3_l2t0_scb_secc_err_detected = 1'b1;
    @ (negedge l2clk); if (mcu3_l2t0_scb_secc_err==1) mcu3_l2t0_scb_secc_err_detected = 1'b1;
    @ (negedge l2clk); if (mcu3_l2t0_scb_secc_err==1) mcu3_l2t0_scb_secc_err_detected = 1'b1;
    if (mcu3_l2t0_scb_secc_err_detected)
      `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: mcu_l2t0_scb_secc_err asserted when FBR (AA/AF/SPE) is logged");
    else
      `PR_ERROR("mcu_fmon", `ERROR, "MCU3: mcu_l2t0_scb_secc_err not asserted when FBR (AA/AF/SPE) is logged");
   @ (negedge l2clk);
   mcu3_l2t0_scb_secc_err_detected = 1'b0;
  end

  if ((mcu3_syndrome_AA || mcu3_syndrome_AF || mcu3_syndrome_SPE) && `MCU3.mcu_l2t1_data_vld_r0) begin
                       if (mcu3_l2t1_scb_secc_err==1) mcu3_l2t1_scb_secc_err_detected = 1'b1;
    @ (negedge l2clk); if (mcu3_l2t1_scb_secc_err==1) mcu3_l2t1_scb_secc_err_detected = 1'b1;
    @ (negedge l2clk); if (mcu3_l2t1_scb_secc_err==1) mcu3_l2t1_scb_secc_err_detected = 1'b1;
    if (mcu3_l2t1_scb_secc_err_detected)
      `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: mcu_l2t1_scb_secc_err asserted when FBR (AA/AF/SPE) is logged");
    else
      `PR_ERROR("mcu_fmon", `ERROR, "MCU3: mcu_l2t1_scb_secc_err not asserted when FBR (AA/AF/SPE) is logged");
   @ (negedge l2clk);
   mcu3_l2t1_scb_secc_err_detected = 1'b0;
  end
end

always @ (posedge (mcu3_esr_fbr && enabled)) 
begin
  @ (negedge drl2clk);
  @ (posedge `MCU3.rdata.rdata_ddr_cmp_sync_en_d2);
#10;
  if (mcu3_syndrome_C && `MCU3.mcu_l2t0_data_vld_r0) begin
    if (mcu3_l2t0_scb_secc_err!=1)
      `PR_ERROR("mcu_fmon", `ERROR, "MCU3: mcu_l2t0_scb_secc_err not asserted when FBR (C) is logged");
    else
      `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: mcu_l2t0_scb_secc_err asserted when FBR (C) is logged");
  end
  if (mcu3_syndrome_C && `MCU3.mcu_l2t1_data_vld_r0) begin
    if (mcu3_l2t1_scb_secc_err!=1)
      `PR_ERROR("mcu_fmon", `ERROR, "MCU3: mcu_l2t1_scb_secc_err not asserted when FBR (C) is logged");
    else
      `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: mcu_l2t1_scb_secc_err asserted when FBR (C) is logged");
  end
end

// --- FBU ---

// --- MCU0 ---

always @ (posedge (mcu0_esr_fbu && enabled && mcu0_fbdic_chnl_reset_error)) 
if (mcu0_synd_C)
begin
  // --- mcu0_l2t0_mecc_err_r3 or mcu0_l2t1_mecc_err_r3 or mcu0_l2t0_scb_mecc_err or mcu0_l2t1_scb_mecc_err assertion check : Window of 12 l2clks ---
  @ (negedge l2clk); if (mcu0_l2t0_mecc_err_r3==1 || mcu0_l2t1_mecc_err_r3==1 || mcu0_l2t0_scb_mecc_err || mcu0_l2t1_scb_mecc_err) mcu0_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_mecc_err_r3==1 || mcu0_l2t1_mecc_err_r3==1 || mcu0_l2t0_scb_mecc_err || mcu0_l2t1_scb_mecc_err) mcu0_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_mecc_err_r3==1 || mcu0_l2t1_mecc_err_r3==1 || mcu0_l2t0_scb_mecc_err || mcu0_l2t1_scb_mecc_err) mcu0_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_mecc_err_r3==1 || mcu0_l2t1_mecc_err_r3==1 || mcu0_l2t0_scb_mecc_err || mcu0_l2t1_scb_mecc_err) mcu0_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_mecc_err_r3==1 || mcu0_l2t1_mecc_err_r3==1 || mcu0_l2t0_scb_mecc_err || mcu0_l2t1_scb_mecc_err) mcu0_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_mecc_err_r3==1 || mcu0_l2t1_mecc_err_r3==1 || mcu0_l2t0_scb_mecc_err || mcu0_l2t1_scb_mecc_err) mcu0_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_mecc_err_r3==1 || mcu0_l2t1_mecc_err_r3==1 || mcu0_l2t0_scb_mecc_err || mcu0_l2t1_scb_mecc_err) mcu0_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_mecc_err_r3==1 || mcu0_l2t1_mecc_err_r3==1 || mcu0_l2t0_scb_mecc_err || mcu0_l2t1_scb_mecc_err) mcu0_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_mecc_err_r3==1 || mcu0_l2t1_mecc_err_r3==1 || mcu0_l2t0_scb_mecc_err || mcu0_l2t1_scb_mecc_err) mcu0_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_mecc_err_r3==1 || mcu0_l2t1_mecc_err_r3==1 || mcu0_l2t0_scb_mecc_err || mcu0_l2t1_scb_mecc_err) mcu0_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_mecc_err_r3==1 || mcu0_l2t1_mecc_err_r3==1 || mcu0_l2t0_scb_mecc_err || mcu0_l2t1_scb_mecc_err) mcu0_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_mecc_err_r3==1 || mcu0_l2t1_mecc_err_r3==1 || mcu0_l2t0_scb_mecc_err || mcu0_l2t1_scb_mecc_err) mcu0_l2t_mecc_err_r3_detected = 1'b1;
  if (~mcu0_l2t_mecc_err_r3_detected) 
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: mcu_l2t0_mecc_err_r3 or mcu_l2t1_mecc_err_r3 or mcu_l2t1_scb_mecc_err or mcu_l2t1_scb_mecc_err not asserted when ESR.FBU and SYND.C is logged");
  @ (negedge l2clk);
  mcu0_l2t_mecc_err_r3_detected = 1'b0;
end

always @ (posedge (mcu0_esr_fbu && mcu0_synd_SPE && ~mcu0_synd_C && enabled)) // FBU.C -> P1 
begin
  // --- mcu0_l2t0_scb_mecc_err assertion check : Window of 10 l2clks
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  if (~mcu0_l2t0_scb_mecc_err_detected)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: mcu0_l2t0_scb_mecc_err not asserted when ESR.FBU and SYND.SPE is logged");
  @ (negedge l2clk);
  mcu0_l2t0_scb_mecc_err_detected = 1'b0;
end

`ifdef ENABLE_FBU_AF
always @ (posedge (mcu0_esr_fbu && mcu0_synd_AF && ~mcu0_synd_C && enabled)) // FBU.C -> P1 
begin
  // --- mcu0_l2t0_scb_mecc_err assertion check : Window of 10 l2clks
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu0_l2t0_scb_mecc_err==1) mcu0_l2t0_scb_mecc_err_detected = 1'b1;
  if (~mcu0_l2t0_scb_mecc_err_detected)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU0: mcu0_l2t0_scb_mecc_err not asserted when ESR.FBU and SYND.AF is logged");
  @ (negedge l2clk);
  mcu0_l2t0_scb_mecc_err_detected = 1'b0;
end
`endif

// --- MCU1 ---

always @ (posedge (mcu1_esr_fbu && enabled && mcu1_fbdic_chnl_reset_error)) 
if (mcu1_synd_C)
begin
  // --- mcu1_l2t0_mecc_err_r3 or mcu1_l2t1_mecc_err_r3 or mcu1_l2t0_scb_mecc_err or mcu1_l2t1_scb_mecc_err assertion check : Window of 12 l2clks ---
  @ (negedge l2clk); if (mcu1_l2t0_mecc_err_r3==1 || mcu1_l2t1_mecc_err_r3==1 || mcu1_l2t0_scb_mecc_err || mcu1_l2t1_scb_mecc_err) mcu1_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_mecc_err_r3==1 || mcu1_l2t1_mecc_err_r3==1 || mcu1_l2t0_scb_mecc_err || mcu1_l2t1_scb_mecc_err) mcu1_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_mecc_err_r3==1 || mcu1_l2t1_mecc_err_r3==1 || mcu1_l2t0_scb_mecc_err || mcu1_l2t1_scb_mecc_err) mcu1_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_mecc_err_r3==1 || mcu1_l2t1_mecc_err_r3==1 || mcu1_l2t0_scb_mecc_err || mcu1_l2t1_scb_mecc_err) mcu1_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_mecc_err_r3==1 || mcu1_l2t1_mecc_err_r3==1 || mcu1_l2t0_scb_mecc_err || mcu1_l2t1_scb_mecc_err) mcu1_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_mecc_err_r3==1 || mcu1_l2t1_mecc_err_r3==1 || mcu1_l2t0_scb_mecc_err || mcu1_l2t1_scb_mecc_err) mcu1_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_mecc_err_r3==1 || mcu1_l2t1_mecc_err_r3==1 || mcu1_l2t0_scb_mecc_err || mcu1_l2t1_scb_mecc_err) mcu1_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_mecc_err_r3==1 || mcu1_l2t1_mecc_err_r3==1 || mcu1_l2t0_scb_mecc_err || mcu1_l2t1_scb_mecc_err) mcu1_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_mecc_err_r3==1 || mcu1_l2t1_mecc_err_r3==1 || mcu1_l2t0_scb_mecc_err || mcu1_l2t1_scb_mecc_err) mcu1_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_mecc_err_r3==1 || mcu1_l2t1_mecc_err_r3==1 || mcu1_l2t0_scb_mecc_err || mcu1_l2t1_scb_mecc_err) mcu1_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_mecc_err_r3==1 || mcu1_l2t1_mecc_err_r3==1 || mcu1_l2t0_scb_mecc_err || mcu1_l2t1_scb_mecc_err) mcu1_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_mecc_err_r3==1 || mcu1_l2t1_mecc_err_r3==1 || mcu1_l2t0_scb_mecc_err || mcu1_l2t1_scb_mecc_err) mcu1_l2t_mecc_err_r3_detected = 1'b1;
  if (~mcu1_l2t_mecc_err_r3_detected) 
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: mcu_l2t0_mecc_err_r3 or mcu_l2t1_mecc_err_r3 or mcu_l2t1_scb_mecc_err or mcu_l2t1_scb_mecc_err not asserted when ESR.FBU and SYND.C is logged");
  @ (negedge l2clk);
  mcu1_l2t_mecc_err_r3_detected = 1'b0;
end

always @ (posedge (mcu1_esr_fbu && mcu1_synd_SPE && ~mcu1_synd_C && enabled)) // FBU.C -> P1
begin
  // --- mcu1_l2t0_scb_mecc_err assertion check : Window of 10 l2clks
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  if (~mcu1_l2t0_scb_mecc_err_detected)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: mcu1_l2t0_scb_mecc_err not asserted when ESR.FBU and SYND.SPE is logged");
  @ (negedge l2clk);
  mcu1_l2t0_scb_mecc_err_detected = 1'b0;
end

`ifdef ENABLE_FBU_AF
always @ (posedge (mcu1_esr_fbu && mcu1_synd_AF && ~mcu1_synd_C && enabled)) // FBU.C -> P1 
begin
  // --- mcu1_l2t0_scb_mecc_err assertion check : Window of 10 l2clks
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu1_l2t0_scb_mecc_err==1) mcu1_l2t0_scb_mecc_err_detected = 1'b1;
  if (~mcu1_l2t0_scb_mecc_err_detected)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU1: mcu1_l2t0_scb_mecc_err not asserted when ESR.FBU and SYND.AF is logged");
  @ (negedge l2clk);
  mcu1_l2t0_scb_mecc_err_detected = 1'b0;
end
`endif

// --- MCU2 ---

always @ (posedge (mcu2_esr_fbu && enabled && mcu2_fbdic_chnl_reset_error)) 
if (mcu2_synd_C)
begin
  // --- mcu2_l2t0_mecc_err_r3 or mcu2_l2t1_mecc_err_r3 or mcu2_l2t0_scb_mecc_err or mcu2_l2t1_scb_mecc_err assertion check : Window of 12 l2clks ---
  @ (negedge l2clk); if (mcu2_l2t0_mecc_err_r3==1 || mcu2_l2t1_mecc_err_r3==1 || mcu2_l2t0_scb_mecc_err || mcu2_l2t1_scb_mecc_err) mcu2_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_mecc_err_r3==1 || mcu2_l2t1_mecc_err_r3==1 || mcu2_l2t0_scb_mecc_err || mcu2_l2t1_scb_mecc_err) mcu2_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_mecc_err_r3==1 || mcu2_l2t1_mecc_err_r3==1 || mcu2_l2t0_scb_mecc_err || mcu2_l2t1_scb_mecc_err) mcu2_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_mecc_err_r3==1 || mcu2_l2t1_mecc_err_r3==1 || mcu2_l2t0_scb_mecc_err || mcu2_l2t1_scb_mecc_err) mcu2_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_mecc_err_r3==1 || mcu2_l2t1_mecc_err_r3==1 || mcu2_l2t0_scb_mecc_err || mcu2_l2t1_scb_mecc_err) mcu2_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_mecc_err_r3==1 || mcu2_l2t1_mecc_err_r3==1 || mcu2_l2t0_scb_mecc_err || mcu2_l2t1_scb_mecc_err) mcu2_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_mecc_err_r3==1 || mcu2_l2t1_mecc_err_r3==1 || mcu2_l2t0_scb_mecc_err || mcu2_l2t1_scb_mecc_err) mcu2_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_mecc_err_r3==1 || mcu2_l2t1_mecc_err_r3==1 || mcu2_l2t0_scb_mecc_err || mcu2_l2t1_scb_mecc_err) mcu2_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_mecc_err_r3==1 || mcu2_l2t1_mecc_err_r3==1 || mcu2_l2t0_scb_mecc_err || mcu2_l2t1_scb_mecc_err) mcu2_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_mecc_err_r3==1 || mcu2_l2t1_mecc_err_r3==1 || mcu2_l2t0_scb_mecc_err || mcu2_l2t1_scb_mecc_err) mcu2_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_mecc_err_r3==1 || mcu2_l2t1_mecc_err_r3==1 || mcu2_l2t0_scb_mecc_err || mcu2_l2t1_scb_mecc_err) mcu2_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_mecc_err_r3==1 || mcu2_l2t1_mecc_err_r3==1 || mcu2_l2t0_scb_mecc_err || mcu2_l2t1_scb_mecc_err) mcu2_l2t_mecc_err_r3_detected = 1'b1;
  if (~mcu2_l2t_mecc_err_r3_detected) 
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: mcu_l2t0_mecc_err_r3 or mcu_l2t1_mecc_err_r3 or mcu_l2t1_scb_mecc_err or mcu_l2t1_scb_mecc_err not asserted when ESR.FBU and SYND.C is logged");
  @ (negedge l2clk);
  mcu2_l2t_mecc_err_r3_detected = 1'b0;
end

always @ (posedge (mcu2_esr_fbu && mcu2_synd_SPE && ~mcu2_synd_C && enabled))  // FBU.C -> P1
begin
  // --- mcu2_l2t0_scb_mecc_err assertion check : Window of 10 l2clks
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  if (~mcu2_l2t0_scb_mecc_err_detected)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: mcu2_l2t0_scb_mecc_err not asserted when ESR.FBU and SYND.SPE is logged");
  @ (negedge l2clk);
  mcu2_l2t0_scb_mecc_err_detected = 1'b0;
end

`ifdef ENABLE_FBU_AF
always @ (posedge (mcu2_esr_fbu && mcu2_synd_AF && ~mcu2_synd_C && enabled)) // FBU.C -> P1 
begin
  // --- mcu2_l2t0_scb_mecc_err assertion check : Window of 10 l2clks
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu2_l2t0_scb_mecc_err==1) mcu2_l2t0_scb_mecc_err_detected = 1'b1;
  if (~mcu2_l2t0_scb_mecc_err_detected)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU2: mcu2_l2t0_scb_mecc_err not asserted when ESR.FBU and SYND.AF is logged");
  @ (negedge l2clk);
  mcu2_l2t0_scb_mecc_err_detected = 1'b0;
end
`endif

// --- MCU3 ---

always @ (posedge (mcu3_esr_fbu && enabled && mcu3_fbdic_chnl_reset_error)) 
if (mcu3_synd_C)
begin
  // --- mcu3_l2t0_mecc_err_r3 or mcu3_l2t1_mecc_err_r3 or mcu3_l2t0_scb_mecc_err or mcu3_l2t1_scb_mecc_err assertion check : Window of 12 l2clks ---
  @ (negedge l2clk); if (mcu3_l2t0_mecc_err_r3==1 || mcu3_l2t1_mecc_err_r3==1 || mcu3_l2t0_scb_mecc_err || mcu3_l2t1_scb_mecc_err) mcu3_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_mecc_err_r3==1 || mcu3_l2t1_mecc_err_r3==1 || mcu3_l2t0_scb_mecc_err || mcu3_l2t1_scb_mecc_err) mcu3_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_mecc_err_r3==1 || mcu3_l2t1_mecc_err_r3==1 || mcu3_l2t0_scb_mecc_err || mcu3_l2t1_scb_mecc_err) mcu3_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_mecc_err_r3==1 || mcu3_l2t1_mecc_err_r3==1 || mcu3_l2t0_scb_mecc_err || mcu3_l2t1_scb_mecc_err) mcu3_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_mecc_err_r3==1 || mcu3_l2t1_mecc_err_r3==1 || mcu3_l2t0_scb_mecc_err || mcu3_l2t1_scb_mecc_err) mcu3_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_mecc_err_r3==1 || mcu3_l2t1_mecc_err_r3==1 || mcu3_l2t0_scb_mecc_err || mcu3_l2t1_scb_mecc_err) mcu3_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_mecc_err_r3==1 || mcu3_l2t1_mecc_err_r3==1 || mcu3_l2t0_scb_mecc_err || mcu3_l2t1_scb_mecc_err) mcu3_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_mecc_err_r3==1 || mcu3_l2t1_mecc_err_r3==1 || mcu3_l2t0_scb_mecc_err || mcu3_l2t1_scb_mecc_err) mcu3_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_mecc_err_r3==1 || mcu3_l2t1_mecc_err_r3==1 || mcu3_l2t0_scb_mecc_err || mcu3_l2t1_scb_mecc_err) mcu3_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_mecc_err_r3==1 || mcu3_l2t1_mecc_err_r3==1 || mcu3_l2t0_scb_mecc_err || mcu3_l2t1_scb_mecc_err) mcu3_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_mecc_err_r3==1 || mcu3_l2t1_mecc_err_r3==1 || mcu3_l2t0_scb_mecc_err || mcu3_l2t1_scb_mecc_err) mcu3_l2t_mecc_err_r3_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_mecc_err_r3==1 || mcu3_l2t1_mecc_err_r3==1 || mcu3_l2t0_scb_mecc_err || mcu3_l2t1_scb_mecc_err) mcu3_l2t_mecc_err_r3_detected = 1'b1;
  if (~mcu3_l2t_mecc_err_r3_detected) 
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: mcu_l2t0_mecc_err_r3 or mcu_l2t1_mecc_err_r3 or mcu_l2t1_scb_mecc_err or mcu_l2t1_scb_mecc_err not asserted when ESR.FBU and SYND.C is logged");
  @ (negedge l2clk);
  mcu3_l2t_mecc_err_r3_detected = 1'b0;
end

always @ (posedge (mcu3_esr_fbu && mcu3_synd_SPE && ~mcu3_synd_C && enabled)) // FBU.C -> P1 
begin
  // --- mcu3_l2t0_scb_mecc_err assertion check : Window of 10 l2clks
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  if (~mcu3_l2t0_scb_mecc_err_detected)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: mcu3_l2t0_scb_mecc_err not asserted when ESR.FBU and SYND.SPE is logged");
  @ (negedge l2clk);
  mcu3_l2t0_scb_mecc_err_detected = 1'b0;
end

`ifdef ENABLE_FBU_AF
always @ (posedge (mcu3_esr_fbu && mcu3_synd_AF && ~mcu3_synd_C && enabled)) // FBU.C -> P1 
begin
  // --- mcu3_l2t0_scb_mecc_err assertion check : Window of 10 l2clks
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  @ (negedge l2clk); if (mcu3_l2t0_scb_mecc_err==1) mcu3_l2t0_scb_mecc_err_detected = 1'b1;
  if (~mcu3_l2t0_scb_mecc_err_detected)
    `PR_ERROR("mcu_fmon", `ERROR, "MCU3: mcu3_l2t0_scb_mecc_err not asserted when ESR.FBU and SYND.AF is logged");
  @ (negedge l2clk);
  mcu3_l2t0_scb_mecc_err_detected = 1'b0;
end
`endif

//-----------------------------------
// Disable mcu_fmon during Warm Reset
//-----------------------------------

`ifdef MCUSAT
always @ (posedge rst_wmr_protect)
begin
  if (!($test$plusargs("mcu_fmon_disable"))) begin
    enabled = 1'b0;
    fbd_init_check = 1'b0;
  end
end

always @ (negedge rst_wmr_protect)
begin
  if (!($test$plusargs("mcu_fmon_disable")))
    enabled = 1'b1;
end
`else
always @ (tb_top.flush_reset_complete)
begin
  if (tb_top.flush_reset_complete == 1'b0) begin
   if (!($test$plusargs("mcu_fmon_disable"))) begin
    enabled = 1'b0;
    fbd_init_check = 1'b0;

    // --- reset all reg variables used in this monitor/checker

    mcu0_start_pd_check_0 = 0;
    mcu0_start_pd_check_1 = 0;
    mcu0_start_pd_check_2 = 0;
    mcu0_start_pd_check_3 = 0;
    mcu0_start_pd_check_4 = 0;
    mcu0_start_pd_check_5 = 0;
    mcu0_start_pd_check_6 = 0;
    mcu0_start_pd_check_7 = 0;
    mcu0_start_pd_check_8 = 0;
    mcu0_start_pd_check_9 = 0;
    mcu0_start_pd_check_a = 0;
    mcu0_start_pd_check_b = 0;
    mcu0_start_pd_check_c = 0;
    mcu0_start_pd_check_d = 0;
    mcu0_start_pd_check_e = 0;
    mcu0_start_pd_check_f = 0;
  
    mcu0_drif_dram_ras_addr_a = 16'h0;
    mcu0_drif_dram_ras_addr_b = 16'h0;
    mcu0_drif_dram_ras_addr_c = 16'h0;
    mcu1_drif_dram_ras_addr_a = 16'h0;
    mcu1_drif_dram_ras_addr_b = 16'h0;
    mcu1_drif_dram_ras_addr_c = 16'h0;
    mcu2_drif_dram_ras_addr_a = 16'h0;
    mcu2_drif_dram_ras_addr_b = 16'h0;
    mcu2_drif_dram_ras_addr_c = 16'h0;
    mcu3_drif_dram_ras_addr_a = 16'h0;
    mcu3_drif_dram_ras_addr_b = 16'h0;
    mcu3_drif_dram_ras_addr_c = 16'h0;

    mcu0_physical_addr_a = 40'h0;
    mcu0_physical_addr_b = 40'h0;
    mcu0_physical_addr_c = 40'h0;
    mcu1_physical_addr_a = 40'h0;
    mcu1_physical_addr_b = 40'h0;
    mcu1_physical_addr_c = 40'h0;
    mcu2_physical_addr_a = 40'h0;
    mcu2_physical_addr_b = 40'h0;
    mcu2_physical_addr_c = 40'h0;
    mcu3_physical_addr_a = 40'h0;
    mcu3_physical_addr_b = 40'h0;
    mcu3_physical_addr_c = 40'h0;

    sync_frame_UI_err_0a = 12'h0;
    sync_frame_UI_err_0b = 12'h0;
    sync_frame_UI_err_1a = 12'h0;
    sync_frame_UI_err_1b = 12'h0;
    sync_frame_UI_err_2a = 12'h0;
    sync_frame_UI_err_2b = 12'h0;
    sync_frame_UI_err_3a = 12'h0;
    sync_frame_UI_err_3b = 12'h0;

    mcu0_drif_dram_cmd_a_prev = 3'b0;
    mcu0_drif_dram_cmd_b_prev = 3'b0;
    mcu0_drif_dram_cmd_c_prev = 3'b0;
    mcu1_drif_dram_cmd_a_prev = 3'b0;
    mcu1_drif_dram_cmd_b_prev = 3'b0;
    mcu1_drif_dram_cmd_c_prev = 3'b0;
    mcu2_drif_dram_cmd_a_prev = 3'b0;
    mcu2_drif_dram_cmd_b_prev = 3'b0;
    mcu2_drif_dram_cmd_c_prev = 3'b0;
    mcu3_drif_dram_cmd_a_prev = 3'b0;
    mcu3_drif_dram_cmd_b_prev = 3'b0;
    mcu3_drif_dram_cmd_c_prev = 3'b0;

    mcu0_drif_ucb_wr_req_vld_REG = 1'b0;
    mcu1_drif_ucb_wr_req_vld_REG = 1'b0;
    mcu2_drif_ucb_wr_req_vld_REG = 1'b0;
    mcu3_drif_ucb_wr_req_vld_REG = 1'b0;

    mcu0_drif_ucb_rd_req_vld_REG = 1'b0;
    mcu1_drif_ucb_rd_req_vld_REG = 1'b0;
    mcu2_drif_ucb_rd_req_vld_REG = 1'b0;
    mcu3_drif_ucb_rd_req_vld_REG = 1'b0;

    mcu0_drif_dram_cmd_a_REG = 3'b0;
    mcu0_drif_dram_cmd_b_REG = 3'b0;
    mcu0_drif_dram_cmd_c_REG = 3'b0;
    mcu1_drif_dram_cmd_a_REG = 3'b0;
    mcu1_drif_dram_cmd_b_REG = 3'b0;
    mcu1_drif_dram_cmd_c_REG = 3'b0;
    mcu2_drif_dram_cmd_a_REG = 3'b0;
    mcu2_drif_dram_cmd_b_REG = 3'b0;
    mcu2_drif_dram_cmd_c_REG = 3'b0;
    mcu3_drif_dram_cmd_a_REG = 3'b0;
    mcu3_drif_dram_cmd_b_REG = 3'b0;
    mcu3_drif_dram_cmd_c_REG = 3'b0;
   end
  end
  if (tb_top.flush_reset_complete == 1'b1) 
   if (!($test$plusargs("mcu_fmon_disable")))
    enabled = 1'b1;
end
`endif


//-------------------------------------------------------
// NB FAILOVER LANE - MCU AUTO RECONFIGURION TESTING
//-------------------------------------------------------

initial
begin
  @ (posedge drl2clk);

  if ($test$plusargs("fbdimm0a_nblane0_stuckat1")) force tb_top.fbdimm0a_rx_p_top[0] = 1'b1;
  if ($test$plusargs("fbdimm0b_nblane0_stuckat1")) force tb_top.fbdimm0b_rx_p_top[0] = 1'b1;

  if ($test$plusargs("fbdimm0a_nblane1_stuckat1")) force tb_top.fbdimm0a_rx_p_top[1] = 1'b1;
  if ($test$plusargs("fbdimm0b_nblane1_stuckat1")) force tb_top.fbdimm0b_rx_p_top[1] = 1'b1;

  if ($test$plusargs("fbdimm0a_nblane2_stuckat1")) force tb_top.fbdimm0a_rx_p_top[2] = 1'b1;
  if ($test$plusargs("fbdimm0b_nblane2_stuckat1")) force tb_top.fbdimm0b_rx_p_top[2] = 1'b1;

  if ($test$plusargs("fbdimm0a_nblane3_stuckat1")) force tb_top.fbdimm0a_rx_p_top[3] = 1'b1;
  if ($test$plusargs("fbdimm0b_nblane3_stuckat1")) force tb_top.fbdimm0b_rx_p_top[3] = 1'b1;

  if ($test$plusargs("fbdimm0a_nblane4_stuckat1")) force tb_top.fbdimm0a_rx_p_top[4] = 1'b1;
  if ($test$plusargs("fbdimm0b_nblane4_stuckat1")) force tb_top.fbdimm0b_rx_p_top[4] = 1'b1;

  if ($test$plusargs("fbdimm0a_nblane5_stuckat1")) force tb_top.fbdimm0a_rx_p_top[5] = 1'b1;
  if ($test$plusargs("fbdimm0b_nblane5_stuckat1")) force tb_top.fbdimm0b_rx_p_top[5] = 1'b1;

  if ($test$plusargs("fbdimm0a_nblane6_stuckat1")) force tb_top.fbdimm0a_rx_p_top[6] = 1'b1;
  if ($test$plusargs("fbdimm0b_nblane6_stuckat1")) force tb_top.fbdimm0b_rx_p_top[6] = 1'b1;

  if ($test$plusargs("fbdimm0a_nblane7_stuckat1")) force tb_top.fbdimm0a_rx_p_top[7] = 1'b1;
  if ($test$plusargs("fbdimm0b_nblane7_stuckat1")) force tb_top.fbdimm0b_rx_p_top[7] = 1'b1;

  if ($test$plusargs("fbdimm0a_nblane8_stuckat1")) force tb_top.fbdimm0a_rx_p_top[8] = 1'b1;
  if ($test$plusargs("fbdimm0b_nblane8_stuckat1")) force tb_top.fbdimm0b_rx_p_top[8] = 1'b1;

  if ($test$plusargs("fbdimm0a_nblane9_stuckat1")) force tb_top.fbdimm0a_rx_p_top[9] = 1'b1;
  if ($test$plusargs("fbdimm0b_nblane9_stuckat1")) force tb_top.fbdimm0b_rx_p_top[9] = 1'b1;

  if ($test$plusargs("fbdimm0a_nblane10_stuckat1")) force tb_top.fbdimm0a_rx_p_top[10] = 1'b1;
  if ($test$plusargs("fbdimm0b_nblane10_stuckat1")) force tb_top.fbdimm0b_rx_p_top[10] = 1'b1;

  if ($test$plusargs("fbdimm0a_nblane11_stuckat1")) force tb_top.fbdimm0a_rx_p_top[11] = 1'b1;
  if ($test$plusargs("fbdimm0b_nblane11_stuckat1")) force tb_top.fbdimm0b_rx_p_top[11] = 1'b1;

  if ($test$plusargs("fbdimm0a_nblane12_stuckat1")) force tb_top.fbdimm0a_rx_p_top[12] = 1'b1;
  if ($test$plusargs("fbdimm0b_nblane12_stuckat1")) force tb_top.fbdimm0b_rx_p_top[12] = 1'b1;

  if ($test$plusargs("fbdimm0a_nblane13_stuckat1")) force tb_top.fbdimm0a_rx_p_top[13] = 1'b1;
  if ($test$plusargs("fbdimm0b_nblane13_stuckat1")) force tb_top.fbdimm0b_rx_p_top[13] = 1'b1;

end

//------------------------------------------------------
// SB FAILOVER LANE - MCU AUTO RECONFIGURION TESTING
//------------------------------------------------------

initial
begin
  @ (posedge drl2clk);

  if ($test$plusargs("fbdimm0a_sblane0_stuckat1")) force fbdimm0a_tx_p_top[0] = 1'b1;
  if ($test$plusargs("fbdimm0b_sblane0_stuckat1")) force fbdimm0b_tx_p_top[0] = 1'b1;

  if ($test$plusargs("fbdimm0a_sblane1_stuckat1")) force fbdimm0a_tx_p_top[1] = 1'b1;
  if ($test$plusargs("fbdimm0b_sblane1_stuckat1")) force fbdimm0b_tx_p_top[1] = 1'b1;

  if ($test$plusargs("fbdimm0a_sblane2_stuckat1")) force fbdimm0a_tx_p_top[2] = 1'b1;
  if ($test$plusargs("fbdimm0b_sblane2_stuckat1")) force fbdimm0b_tx_p_top[2] = 1'b1;

  if ($test$plusargs("fbdimm0a_sblane3_stuckat1")) force fbdimm0a_tx_p_top[3] = 1'b1;
  if ($test$plusargs("fbdimm0b_sblane3_stuckat1")) force fbdimm0b_tx_p_top[3] = 1'b1;

  if ($test$plusargs("fbdimm0a_sblane4_stuckat1")) force fbdimm0a_tx_p_top[4] = 1'b1;
  if ($test$plusargs("fbdimm0b_sblane4_stuckat1")) force fbdimm0b_tx_p_top[4] = 1'b1;

  if ($test$plusargs("fbdimm0a_sblane5_stuckat1")) force fbdimm0a_tx_p_top[5] = 1'b1;
  if ($test$plusargs("fbdimm0b_sblane5_stuckat1")) force fbdimm0b_tx_p_top[5] = 1'b1;

  if ($test$plusargs("fbdimm0a_sblane6_stuckat1")) force fbdimm0a_tx_p_top[6] = 1'b1;
  if ($test$plusargs("fbdimm0b_sblane6_stuckat1")) force fbdimm0b_tx_p_top[6] = 1'b1;

  if ($test$plusargs("fbdimm0a_sblane7_stuckat1")) force fbdimm0a_tx_p_top[7] = 1'b1;
  if ($test$plusargs("fbdimm0b_sblane7_stuckat1")) force fbdimm0b_tx_p_top[7] = 1'b1;

  if ($test$plusargs("fbdimm0a_sblane8_stuckat1")) force fbdimm0a_tx_p_top[8] = 1'b1;
  if ($test$plusargs("fbdimm0b_sblane8_stuckat1")) force fbdimm0b_tx_p_top[8] = 1'b1;

  if ($test$plusargs("fbdimm0a_sblane9_stuckat1")) force fbdimm0a_tx_p_top[9] = 1'b1;
  if ($test$plusargs("fbdimm0b_sblane9_stuckat1")) force fbdimm0b_tx_p_top[9] = 1'b1;
end

//-------------------------------------------
// SERDES LOOPBACK (Blunt_End) Testing
//-------------------------------------------

initial
begin
 #1000;
 if ($test$plusargs("SERDES_BLUNTEND")) begin
  fork
  begin
    @ (posedge `MCU0.fbdic.fbdic_loopback[1]);
    repeat (10) @ (posedge drl2clk);
    force tb_top.fbdimm0a_rx_p_top[13:0] = 14'h3fff;
    force tb_top.fbdimm0a_rx_n_top[13:0] = 14'h0;
    repeat (20) @ (posedge drl2clk);
    force tb_top.fbdimm0a_rx_p_top[13:0] = 14'h0;
    force tb_top.fbdimm0a_rx_n_top[13:0] = 14'h3fff;
    repeat (20) @ (posedge drl2clk);
    force tb_top.fbdimm0a_rx_p_top[13:0] = 14'h3aaa;
    force tb_top.fbdimm0a_rx_n_top[13:0] = 14'h0555;
    repeat (20) @ (posedge drl2clk);
    force tb_top.fbdimm0a_rx_p_top[13:0] = 14'h0;
    force tb_top.fbdimm0a_rx_n_top[13:0] = 14'h3fff;
    @ (posedge `MCU0.fbdic.fbdic_loopback[0]);
    force tb_top.fbdimm0a_rx_p_top[13:0] = 14'h3fff;
    force tb_top.fbdimm0a_rx_n_top[13:0] = 14'h0;
    repeat (20) @ (posedge drl2clk);
    force tb_top.fbdimm0a_rx_p_top[13:0] = 14'h0;
    force tb_top.fbdimm0a_rx_n_top[13:0] = 14'h3fff;
    repeat (20) @ (posedge drl2clk);
    force tb_top.fbdimm0a_rx_p_top[13:0] = 14'h3aaf;
    force tb_top.fbdimm0a_rx_n_top[13:0] = 14'h0550;
    repeat (20) @ (posedge drl2clk);
    force tb_top.fbdimm0a_rx_p_top[13:0] = 14'h0;
    force tb_top.fbdimm0a_rx_n_top[13:0] = 14'h3fff;
  end
  begin
    @ (posedge `MCU0.fbdic.fbdic_loopback[1]);
    repeat (20) @ (posedge drl2clk);
    if (fbdimm0a_tx_p_top[9:0] != 10'h3ff)
      `PR_ERROR("mcu_fmon", `ERROR, "SERDES Blunt-End Loop Back Test Failed TX != RX");
    repeat (20) @ (posedge drl2clk);
    if (fbdimm0a_tx_p_top[9:0] != 10'h0)
      `PR_ERROR("mcu_fmon", `ERROR, "SERDES Blunt-End Loop Back Test Failed TX != RX");
    repeat (20) @ (posedge drl2clk);
    if (fbdimm0a_tx_p_top[9:0] != 10'h2aa)
      `PR_ERROR("mcu_fmon", `ERROR, "SERDES Blunt-End Loop Back Test Failed TX != RX");
    repeat (20) @ (posedge drl2clk);
    if (fbdimm0a_tx_p_top[9:0] != 10'h0)
      `PR_ERROR("mcu_fmon", `ERROR, "SERDES Blunt-End Loop Back Test Failed TX != RX");
    @ (posedge `MCU0.fbdic.fbdic_loopback[0]);
    repeat (10) @ (posedge drl2clk);
    if (fbdimm0a_tx_p_top[9:0] != 10'h3ff)
      `PR_ERROR("mcu_fmon", `ERROR, "SERDES Blunt-End Loop Back Test Failed TX != RX");
    repeat (20) @ (posedge drl2clk);
    if (fbdimm0a_tx_p_top[9:0] != 10'h0)
      `PR_ERROR("mcu_fmon", `ERROR, "SERDES Blunt-End Loop Back Test Failed TX != RX");
    repeat (20) @ (posedge drl2clk);
    if (fbdimm0a_tx_p_top[9:0] != 10'h3aa)
      `PR_ERROR("mcu_fmon", `ERROR, "SERDES Blunt-End Loop Back Test Failed TX != RX");
    repeat (20) @ (posedge drl2clk);
    if (fbdimm0a_tx_p_top[9:0] != 10'h0)
      `PR_ERROR("mcu_fmon", `ERROR, "SERDES Blunt-End Loop Back Test Failed TX != RX");
  end
  join
 end
end

//-------------------------------------------
// SERDES LANE INV Testing
//-------------------------------------------

initial
begin
 #1000;
 if ($test$plusargs("SERDES_INVERT")) 
 begin
    @ (posedge `MCU0.fbdic.fbdic_fbd_state[0]);
    force tb_top.fbdimm0a_rx_p_top = 14'h3fff; 
    force tb_top.fbdimm0b_rx_p_top = 14'h3fff; 

    @ (posedge `MCU0.fbdic.fbdic_sds_invert[0]);
    repeat (10) @ (posedge drl2clk);
    if (fbdimm0a_tx_p_top[9:0] != 10'h0 || fbdimm0b_tx_p_top[9:0] != 10'h0)
      `PR_ERROR("mcu_fmon", `ERROR, "TX SERDES Lane Invert Test Failed !!!");
    else
      `PR_DEBUG("mcu_fmon", `DEBUG, "TX SERDES Lane Invert Test Passed !!!");

    if (`CPU.fsr0_mcu0_data != 168'h0 || `CPU.fsr1_mcu0_data != 168'h0)
      `PR_ERROR("mcu_fmon", `ERROR, "RX SERDES Lane Invert Test Failed !!!");
    else
      `PR_DEBUG("mcu_fmon", `DEBUG, "RX SERDES Lane Invert Test Passed !!!");

 end
end



integer mcu0_idle_frame_cnt;
integer mcu1_idle_frame_cnt;
integer mcu2_idle_frame_cnt;
integer mcu3_idle_frame_cnt;

reg mcu0_idle_frame_detected;
reg mcu1_idle_frame_detected;
reg mcu2_idle_frame_detected;
reg mcu3_idle_frame_detected;

reg idle_frame_checker_enable;

initial begin
  mcu0_idle_frame_cnt=0;
  mcu1_idle_frame_cnt=0;
  mcu2_idle_frame_cnt=0;
  mcu3_idle_frame_cnt=0;

  mcu0_idle_frame_detected=0;
  mcu1_idle_frame_detected=0;
  mcu2_idle_frame_detected=0;
  mcu3_idle_frame_detected=0;

  #5;
  if (($test$plusargs("RANDOM_ENV")) || ($test$plusargs("RANDOM_PARAM")))
    idle_frame_checker_enable = 1;
  else
    idle_frame_checker_enable = 0;
end

always @ (posedge drl2clk)
if (enabled && idle_frame_checker_enable)
begin
  if (`MCU0.fbdic.fbdic_l0_state) begin
    if (`MCU0.fbdic.fbdic_idle_frame)
      mcu0_idle_frame_detected = 1'b1;
    mcu0_idle_frame_cnt = mcu0_idle_frame_cnt + 1;
  end

   if (mcu0_idle_frame_cnt == 200)   // expected to see idle frame frame match with in 200 dram clock cycles
   begin
     if (mcu0_idle_frame_detected == 0)
        `PR_ERROR("mcu_fmon", `ERROR, "MCU0 IDLE LFSR is out-of-sync with AMB IDLE LFSR *** N2 T.O. 1.0 BUG 111811 ***");
     else begin
       mcu0_idle_frame_cnt=0;
       mcu0_idle_frame_detected=0;
     end
   end
end

always @ (posedge drl2clk)
if (enabled && idle_frame_checker_enable)
begin
  if (`MCU1.fbdic.fbdic_l0_state) begin
    if (`MCU1.fbdic.fbdic_idle_frame)
      mcu1_idle_frame_detected = 1'b1;
    mcu1_idle_frame_cnt = mcu1_idle_frame_cnt + 1;
  end

   if (mcu1_idle_frame_cnt == 200)   // expected to see idle frame frame match with in 200 dram clock cycles
   begin
     if (mcu1_idle_frame_detected == 0)
        `PR_ERROR("mcu_fmon", `ERROR, "MCU1 IDLE LFSR is out-of-sync with AMB IDLE LFSR *** N2 T.O. BUG 111811 ***");
     else begin
       mcu1_idle_frame_cnt=0;
       mcu1_idle_frame_detected=0;
     end
   end
end

always @ (posedge drl2clk)
if (enabled && idle_frame_checker_enable)
begin
  if (`MCU2.fbdic.fbdic_l0_state) begin
    if (`MCU2.fbdic.fbdic_idle_frame)
      mcu2_idle_frame_detected = 1'b1;
    mcu2_idle_frame_cnt = mcu2_idle_frame_cnt + 1;
  end

   if (mcu2_idle_frame_cnt == 200)   // expected to see idle frame frame match with in 200 dram clock cycles
   begin
     if (mcu2_idle_frame_detected == 0)
        `PR_ERROR("mcu_fmon", `ERROR, "MCU2 IDLE LFSR is out-of-sync with AMB IDLE LFSR *** N2 T.O. BUG 111811 ***");
     else begin
       mcu2_idle_frame_cnt=0;
       mcu2_idle_frame_detected=0;
     end
   end
end

always @ (posedge drl2clk)
if (enabled && idle_frame_checker_enable)
begin
  if (`MCU3.fbdic.fbdic_l0_state) begin
    if (`MCU3.fbdic.fbdic_idle_frame)
      mcu3_idle_frame_detected = 1'b1;
    mcu3_idle_frame_cnt = mcu3_idle_frame_cnt + 1;
  end

   if (mcu3_idle_frame_cnt == 200)   // expected to see idle frame frame match with in 200 dram clock cycles
   begin
     if (mcu3_idle_frame_detected == 0)
        `PR_ERROR("mcu_fmon", `ERROR, "MCU3 IDLE LFSR is out-of-sync with AMB IDLE LFSR *** N2 T.O. BUG 111811 ***");
     else begin
       mcu3_idle_frame_cnt=0;
       mcu3_idle_frame_detected=0;
     end
   end
end

// added the following logic added to validate when more than 34 read errors are encountered, error queue will wrap around

integer mcu0_err_fifo_enq_counter;
integer mcu1_err_fifo_enq_counter;
integer mcu2_err_fifo_enq_counter;
integer mcu3_err_fifo_enq_counter;

initial begin
    mcu0_err_fifo_enq_counter=0;
    mcu1_err_fifo_enq_counter=0;
    mcu2_err_fifo_enq_counter=0;
    mcu3_err_fifo_enq_counter=0;
end

always @(posedge `MCU0.rdpctl_err_fifo_enq) begin
  if (`MCU0.rdpctl_err_fifo_enq == 1'b1) begin //make sure it is 0->1 and not 0->x
    mcu0_err_fifo_enq_counter = mcu0_err_fifo_enq_counter + 1; //increment
        if ($test$plusargs("MCU_ERR_FIFO_ENQ"))
            `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: *** error fifo queue counter reached %d !!! ***", mcu0_err_fifo_enq_counter);
  end
end

always @(posedge `MCU1.rdpctl_err_fifo_enq) begin
  if (`MCU1.rdpctl_err_fifo_enq == 1'b1) begin //make sure it is 0->1 and not 0->x
    mcu1_err_fifo_enq_counter = mcu1_err_fifo_enq_counter + 1; //increment
        if ($test$plusargs("MCU_ERR_FIFO_ENQ"))
            `PR_DEBUG("mcu_fmon", `DEBUG, "MCU1: *** error fifo queue counter reached %d !!! ***", mcu1_err_fifo_enq_counter);
  end
end

always @(posedge `MCU2.rdpctl_err_fifo_enq) begin
  if (`MCU2.rdpctl_err_fifo_enq == 1'b1) begin //make sure it is 0->1 and not 0->x
    mcu2_err_fifo_enq_counter = mcu2_err_fifo_enq_counter + 1; //increment
        if ($test$plusargs("MCU_ERR_FIFO_ENQ"))
            `PR_DEBUG("mcu_fmon", `DEBUG, "MCU2: *** error fifo queue counter reached %d !!! ***", mcu2_err_fifo_enq_counter);
  end
end

always @(posedge `MCU3.rdpctl_err_fifo_enq) begin
  if (`MCU3.rdpctl_err_fifo_enq == 1'b1) begin //make sure it is 0->1 and not 0->x
    mcu3_err_fifo_enq_counter = mcu3_err_fifo_enq_counter + 1; //increment
        if ($test$plusargs("MCU_ERR_FIFO_ENQ"))
            `PR_DEBUG("mcu_fmon", `DEBUG, "MCU3: *** error fifo queue counter reached %d !!! ***", mcu3_err_fifo_enq_counter);
  end
end

`ifdef MCUSAT_AND_FC

// --- MCU RAS CORNER CASES ---

integer clkcycle;
reg corner_case_1;
reg corner_case_2;
reg corner_case_3;
reg corner_case_4;

initial begin
  clkcycle = 1;
`ifndef AXIS
  $value$plusargs("SET_CLKCYCLE=%d",clkcycle);
`endif

 #5;
 if ($test$plusargs("CORNER_CASE_1"))
   corner_case_1 = 1;
 else
   corner_case_1 = 0;

 if ($test$plusargs("CORNER_CASE_2"))
   corner_case_2 = 1;
 else
   corner_case_2 = 0;

 if ($test$plusargs("CORNER_CASE_3"))
   corner_case_3 = 1;
 else
   corner_case_3 = 0;

 if ($test$plusargs("CORNER_CASE_4"))
   corner_case_4 = 1;
 else
   corner_case_4 = 0;

end

// --- Corner Cases: Inject SB errors before 1st SYNC frame ---

always @ (`MCU0.fbdic.fbdic_sync_frame_req)
if (enabled && ras_corner_case)
begin

  if ((mcu0_sb_err_enable==1) &&
      (`MCU0.fbdic.fbdic_sync_frame_req==1) &&
      (mcu0_sb_channel_error_cnt>0) &&
      (`MCU0.drif.drif_err_state == 5'h1) &&
      corner_case_1)
  begin
    repeat (clkcycle) @ (posedge drl2clk);
    repeat (10) @ (posedge sclk);

    force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_freq = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_period = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_frame_num = 12'h1;

    force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_freq = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_period = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_frame_num = 12'h1;

    force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_freq = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_period = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_frame_num = 12'h1;

    force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_freq = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_period = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_frame_num = 12'h1;

    repeat (1) @ (posedge sclk);

    release tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_frame_num;

    release tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_frame_num;

    mcu0_sb_channel_error_cnt=mcu0_sb_channel_error_cnt - 1;
    if (mcu0_sb_channel_error_cnt==0)
      mcu0_sb_err_enable=0;
  end
end

always @ (`MCU0.fbdic.fbdic_scr_frame_req or `MCU0.fbdic.fbdic_issue_pre_all_cmd or `MCU0.fbdic.fbdic_issue_cke_cmd or `MCU0.fbdic.fbdic_sync_frame_req or mcu0_drif_dram_cmd_a)
if (enabled && ras_corner_case)
begin

  if ((mcu0_sb_err_enable==1 || mcu0_nb_err_enable==1) &&
      ((`MCU0.fbdic.fbdic_scr_frame_req) ||
       (`MCU0.fbdic.fbdic_sync_frame_req) ||
       (`MCU0.fbdic.fbdic_issue_pre_all_cmd) ||
       (`MCU0.fbdic.fbdic_issue_cke_cmd) ||
       (mcu0_drif_dram_cmd_a==`RD)) &&
       (mcu0_sb_channel_error_cnt>0 || mcu0_nb_channel_error_cnt>0) &&
       corner_case_2)
  begin

  fork
  begin

    if (`MCU0.fbdic.fbdic_scr_frame_req==1 && mcu0_nb_err_enable) begin
      clkcycle=mcu0_chnl_lat-4;
      repeat (clkcycle) @ (posedge drl2clk);
      repeat (10) @ (posedge sclk);

      force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_frame_num = 12'h1;

      force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_frame_num = 12'h1;

      force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_frame_num = 12'h1;

      force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_crc_period = 12'h1;
      force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_frame_num = 12'h1;

      repeat (1) @ (posedge sclk);

      release tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_crc_freq;
      release tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_crc_period;
      release tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_frame_num;

      release tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_crc_freq;
      release tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_crc_period;
      release tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_frame_num;

      release tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_crc_freq;
      release tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_crc_period;
      release tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_frame_num;

      release tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_crc_freq;
      release tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_crc_period;
      release tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_frame_num;

      mcu0_nb_channel_error_cnt=mcu0_nb_channel_error_cnt - 1;
    end
    end

    begin

    if (((mcu0_drif_dram_cmd_a==`RD) || 
         (`MCU0.fbdic.fbdic_scr_frame_req && ~corner_case_3 && ~corner_case_4) || 
         (`MCU0.fbdic.fbdic_issue_cke_cmd && corner_case_3) ||
         (`MCU0.fbdic.fbdic_issue_pre_all_cmd && corner_case_4) ||
        (`MCU0.fbdic.fbdic_err_state[5] && `MCU0.fbdic.fbdic_sync_frame_req)) && 
        mcu0_sb_err_enable) begin
      clkcycle=3;
      repeat (clkcycle) @ (posedge drl2clk);
      repeat (10) @ (posedge sclk);

      force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_frame_num = 12'h1;

      force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_freq = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_period = 12'h1;
      force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_frame_num = 12'h1;

      repeat (1) @ (posedge sclk);

      release tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_freq;
      release tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_period;
      release tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_frame_num;

      release tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_freq;
      release tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_period;
      release tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_frame_num;

      release tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_freq;
      release tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_period;
      release tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_frame_num;

      release tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_freq;
      release tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_period;
      release tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_frame_num;

      mcu0_sb_channel_error_cnt=mcu0_sb_channel_error_cnt - 1;
    end

    end

    join

    if (mcu0_sb_channel_error_cnt==0)
      mcu0_sb_err_enable=0;

    if (mcu0_nb_channel_error_cnt==0)
      mcu0_nb_err_enable=0;
  end
end

reg scrub_wrerr_cornercase;

initial begin
    #1;
    if ($test$plusargs("SCRUB_WRERR_CORNERCASE"))
      scrub_wrerr_cornercase = 1;
    else
      scrub_wrerr_cornercase = 0;

    if (scrub_wrerr_cornercase) begin
    #4380000;

    force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_freq = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_period = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_frame_num = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_freq = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_period = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_frame_num = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_freq = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_period = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_frame_num = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_freq = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_period = 12'h1;
    force tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_frame_num = 12'h1;

    repeat (1) @ (posedge sclk);

    release tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_frame_num;
    release tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_frame_num;
    release tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_frame_num;
    release tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_freq;
    release tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_crc_period;
    release tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_frame_num;
 end
end

initial begin
    #1;
    if ($test$plusargs("BUG119328"))
    begin
    wait (`MCU0.drif.reqq.woq.woq_wr_err_state == 2'b10);
    wait ((`MCU0.fbdic.drif_dram_cmd_a == 3'b100)||(`MCU0.fbdic.drif_dram_cmd_b == 3'b100));
    wait ((`MCU0.fbdic.drif_dram_cmd_a == 3'b011)||(`MCU0.fbdic.drif_dram_cmd_b == 3'b011));
//    #11760;
    #50249;
    #3000;

    force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_crc_freq = 12'h1;
    force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_crc_period = 12'h1;
    force tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_frame_num = 12'h1;
    force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_crc_freq = 12'h1;
    force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_crc_period = 12'h1;
    force tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_frame_num = 12'h1;
    force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_crc_freq = 12'h1;
    force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_crc_period = 12'h1;
    force tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_frame_num = 12'h1;
    force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_crc_freq = 12'h1;
    force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_crc_period = 12'h1;
    force tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_frame_num = 12'h1;

    repeat (1) @ (posedge sclk);

    release tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_frame_num;
    release tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_frame_num;
    release tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_frame_num;
    release tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_crc_freq;
    release tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_crc_period;
    release tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_frame_num;
    end
end

`endif


//------------------------------------------------------------
// ----- Added CKE CMD & PRE_ALL checkers after SCR CMD ------
//------------------------------------------------------------

always @ (posedge `MCU0.fbdic.fbdic_scr_frame_req) 
if (enabled)
begin
  repeat (6) @ (negedge drl2clk);
  if (`MCU0.fbdic.fbdic_issue_cke_cmd != 1'b1)
     `PR_ERROR("mcu_fmon", `ERROR, "MCU0: CKE CMD not issued 5 dram clock cycles after SCR cmd");
  repeat (6) @ (negedge drl2clk);
  if (`MCU0.fbdic.fbdic_issue_pre_all_cmd != 1'b1)
     `PR_ERROR("mcu_fmon", `ERROR, "MCU0: PRE_ALL CMD not issued 6 dram clock cycles after CKE cmd");
end

always @ (posedge `MCU1.fbdic.fbdic_scr_frame_req) 
if (enabled)
begin
  repeat (6) @ (negedge drl2clk);
  if (`MCU1.fbdic.fbdic_issue_cke_cmd != 1'b1)
     `PR_ERROR("mcu_fmon", `ERROR, "MCU1: CKE CMD not issued 5 dram clock cycles after SCR cmd");
  repeat (6) @ (negedge drl2clk);
  if (`MCU1.fbdic.fbdic_issue_pre_all_cmd != 1'b1)
     `PR_ERROR("mcu_fmon", `ERROR, "MCU1: PRE_ALL CMD not issued 6 dram clock cycles after CKE cmd");
end

always @ (posedge `MCU2.fbdic.fbdic_scr_frame_req) 
if (enabled)
begin
  repeat (6) @ (negedge drl2clk);
  if (`MCU2.fbdic.fbdic_issue_cke_cmd != 1'b1)
     `PR_ERROR("mcu_fmon", `ERROR, "MCU2: CKE CMD not issued 5 dram clock cycles after SCR cmd");
  repeat (6) @ (negedge drl2clk);
  if (`MCU2.fbdic.fbdic_issue_pre_all_cmd != 1'b1)
     `PR_ERROR("mcu_fmon", `ERROR, "MCU2: PRE_ALL CMD not issued 6 dram clock cycles after CKE cmd");
end

always @ (posedge `MCU3.fbdic.fbdic_scr_frame_req) 
if (enabled)
begin
  repeat (6) @ (negedge drl2clk);
  if (`MCU3.fbdic.fbdic_issue_cke_cmd != 1'b1)
     `PR_ERROR("mcu_fmon", `ERROR, "MCU3: CKE CMD not issued 5 dram clock cycles after SCR cmd");
  repeat (6) @ (negedge drl2clk);
  if (`MCU3.fbdic.fbdic_issue_pre_all_cmd != 1'b1)
     `PR_ERROR("mcu_fmon", `ERROR, "MCU3: PRE_ALL CMD not issued 6 dram clock cycles after CKE cmd");
end


//SYNC_IER checker
always @ (negedge `MCU0.fbdic.fbdic_l0_state)
if (enabled)
begin
  if (`MCU0.fbdic.fbdic_sync_ier) 
  begin
    repeat (3) @ (negedge drl2clk);
      if (`MCU0.fbdic.fbdic_sync_ier !== 1'b0)
        `PR_ERROR("mcu_fmon", `ERROR, "MCU0: IER bit is not reset");
  end
end
 
always @ (posedge (`MCU0.fbdic.fbdic_sync_ier && `MCU0.fbdic.fbdic_sync_frame_req))
if (enabled)
begin
  if (`MCU0.fbdic.fbdic_l0_state)
  begin
    @ (negedge drl2clk);
    if ((`MCU0.fbdic.fbdic_sync_frame_req) && (`MCU0.fbdic.fbdic_a_cmd_in[6] !== 1'b1))
      `PR_ERROR("mcu_fmon", `ERROR, "MCU0: Sync frame has IER=0");
  end
end
     
always @ (negedge `MCU1.fbdic.fbdic_l0_state)
if (enabled)
begin
  if (`MCU1.fbdic.fbdic_sync_ier) 
  begin
    repeat (3) @ (negedge drl2clk);
      if (`MCU1.fbdic.fbdic_sync_ier !== 1'b0)
        `PR_ERROR("mcu_fmon", `ERROR, "MCU1: IER bit is not reset");
  end
end
 
always @ (posedge (`MCU1.fbdic.fbdic_sync_ier && `MCU1.fbdic.fbdic_sync_frame_req))
if (enabled)
begin
  if (`MCU1.fbdic.fbdic_l0_state)
  begin
    @ (negedge drl2clk);
    if ((`MCU1.fbdic.fbdic_sync_frame_req) && (`MCU1.fbdic.fbdic_a_cmd_in[6] !== 1'b1))
      `PR_ERROR("mcu_fmon", `ERROR, "MCU1: Sync frame has IER=0");
  end
end
     
always @ (negedge `MCU2.fbdic.fbdic_l0_state)
if (enabled)
begin
  if (`MCU2.fbdic.fbdic_sync_ier) 
  begin
    repeat (3) @ (negedge drl2clk);
      if (`MCU2.fbdic.fbdic_sync_ier !== 1'b0)
        `PR_ERROR("mcu_fmon", `ERROR, "MCU2: IER bit is not reset");
  end
end
 
always @ (posedge (`MCU2.fbdic.fbdic_sync_ier && `MCU2.fbdic.fbdic_sync_frame_req))
if (enabled)
begin
  if (`MCU2.fbdic.fbdic_l0_state)
  begin
    @ (negedge drl2clk);
    if ((`MCU2.fbdic.fbdic_sync_frame_req) && (`MCU2.fbdic.fbdic_a_cmd_in[6] !== 1'b1))
      `PR_ERROR("mcu_fmon", `ERROR, "MCU2: Sync frame has IER=0");
  end
end
     
always @ (negedge `MCU3.fbdic.fbdic_l0_state)
if (enabled)
begin
  if (`MCU3.fbdic.fbdic_sync_ier) 
  begin
    repeat (3) @ (negedge drl2clk);
      if (`MCU3.fbdic.fbdic_sync_ier !== 1'b0)
        `PR_ERROR("mcu_fmon", `ERROR, "MCU3: IER bit is not reset");
  end
end
 
always @ (posedge (`MCU3.fbdic.fbdic_sync_ier && `MCU3.fbdic.fbdic_sync_frame_req))
if (enabled)
begin
  if (`MCU3.fbdic.fbdic_l0_state)
  begin
    @ (negedge drl2clk);
    if ((`MCU3.fbdic.fbdic_sync_frame_req) && (`MCU3.fbdic.fbdic_a_cmd_in[6] !== 1'b1))
      `PR_ERROR("mcu_fmon", `ERROR, "MCU3: Sync frame has IER=0");
  end
end



//always @ (posedge (`MCU0.drif.reqq.woq.woq0_wr_queue_clear[0]))
always @ (posedge woq0_wrq_clr0)
begin
  if ($test$plusargs("BUG119648"))
  begin
    if (first_time)
    begin
      //$display("%d WOQ clear= %x\n",$time,woq0_wrq_clr0);
      force `MCU0.fbdic.fbdic_l0_state = 1'b0;
      first_time = 1'b0;
      repeat (10) @ (negedge drl2clk);
      release `MCU0.fbdic.fbdic_l0_state;
    end
  end
end


initial begin
    #1;
    if ($test$plusargs("MCU0_FASTRESET"))
	mcu0_fastreset = 1;
    else
      mcu0_fastreset = 0;

    if (mcu0_fastreset) begin
    #4455001;
    force `CPU.mcu0.fbdic.fbdic_chnl_reset_en = 1'b1;
    force `CPU.mcu0.fbdic.fbdic_chnl_reset_in[0] = 1'b1;
    force `CPU.mcu0.fbdic.fbdic_chnl_reset_ld = 1'b1;
    wait (`CPU.mcu0.fbdic.fbdic_chnl_reset[0] == 1'b1);
    release `CPU.mcu0.fbdic.fbdic_chnl_reset_en;
    release `CPU.mcu0.fbdic.fbdic_chnl_reset_in[0];
    release `CPU.mcu0.fbdic.fbdic_chnl_reset_ld;
 end
end

reg ts0_hdr, ts1_hdr, ts2_hdr, ts3_hdr, tsx_hdr;
reg [3:0] fbdic_seq_en;
integer tsx_rndm;


initial begin 
  ts0_hdr = 0;
  ts1_hdr = 0;
  ts2_hdr = 0;
  ts3_hdr = 0;
  tsx_hdr = 0;

  #1;

  if ($test$plusargs("TS0_HDR"))
    ts0_hdr = 1;
  else
    ts0_hdr = 0;

  if ($test$plusargs("TS1_HDR"))
    ts1_hdr = 1;
  else
    ts1_hdr = 0;

  if ($test$plusargs("TS2_HDR"))
    ts2_hdr = 1;
  else
    ts2_hdr = 0;

  if ($test$plusargs("TS3_HDR"))
    ts3_hdr = 1;
  else
    ts3_hdr = 0;

  if ($test$plusargs("TSX_HDR"))   // Random Header
    tsx_hdr = 1;
  else
    tsx_hdr = 0;
end

always @ (posedge `MCU0.fbdic.fbdic_l0_state)
if (enabled)
begin
  if (ts0_hdr)
    fbdic_seq_en = 4'h1;
  else if (ts1_hdr) 
    fbdic_seq_en = 4'h2;
  else if (ts2_hdr) 
    fbdic_seq_en = 4'h4;
  else if (ts3_hdr) 
    fbdic_seq_en = 4'h8;
  else if (tsx_hdr) begin
    tsx_rndm = ({$random(`PARGS.seed)} % 4);
    case(tsx_rndm)
      0: fbdic_seq_en = 4'h1;
      1: fbdic_seq_en = 4'h2;
      2: fbdic_seq_en = 4'h4;
      3: fbdic_seq_en = 4'h8;
    endcase
  end

  wait (`MCU0.fbdic.fbdic_status_frame == 1'b1);
   
  if (ts0_hdr || ts1_hdr || ts2_hdr || ts3_hdr || tsx_hdr) 
  begin
    force `MCU0.fbdic.fbdic_sequence_en = fbdic_seq_en ; 
    `PR_DEBUG("mcu_fmon", `DEBUG, "MCU0: Forced fbdic_sequence_en to %x", fbdic_seq_en);
    @ (posedge drl2clk);
    release `MCU0.fbdic.fbdic_sequence_en ;
  end
end
     

// added the following to be displayed *ONLY* at fullchip

`ifdef FC_CRC_INJECT
// nb

//0a and 0b
always @( posedge tb_top.crc_errinject_top.nb_crc_errinj0a_n.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.nb_crc_errinj0a_n.sclk );
    if ( !( tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_out[(NB_LANES-1):0] == tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_in[(NB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet nb_crc_errinj0a_n.pn_in[13:0] was %x, modif. packet nb_crc_errinj0a_n.pn_out[13:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_in[(NB_LANES-1):0], tb_top.crc_errinject_top.nb_crc_errinj0a_n.pn_out[(NB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.nb_crc_errinj0a_p.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.nb_crc_errinj0a_p.sclk );
    if ( !( tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_out[(NB_LANES-1):0] == tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_in[(NB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet nb_crc_errinj0a_p.pn_in[13:0] was %x, modif. packet nb_crc_errinj0a_p.pn_out[13:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_in[(NB_LANES-1):0], tb_top.crc_errinject_top.nb_crc_errinj0a_p.pn_out[(NB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.nb_crc_errinj0b_n.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.nb_crc_errinj0b_n.sclk );
    if ( !( tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_out[(NB_LANES-1):0] == tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_in[(NB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet nb_crc_errinj0b_n.pn_in[13:0] was %x, modif. packet nb_crc_errinj0b_n.pn_out[13:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_in[(NB_LANES-1):0], tb_top.crc_errinject_top.nb_crc_errinj0b_n.pn_out[(NB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.nb_crc_errinj0b_p.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.nb_crc_errinj0b_p.sclk );
    if ( !( tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_out[(NB_LANES-1):0] == tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_in[(NB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet nb_crc_errinj0b_p.pn_in[13:0] was %x, modif. packet nb_crc_errinj0b_p.pn_out[13:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_in[(NB_LANES-1):0], tb_top.crc_errinject_top.nb_crc_errinj0b_p.pn_out[(NB_LANES-1):0],i);

    end

end


//1a and 1b

always @( posedge tb_top.crc_errinject_top.nb_crc_errinj1a_n.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.nb_crc_errinj1a_n.sclk );
    if ( !( tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn_out[(NB_LANES-1):0] == tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn_in[(NB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet nb_crc_errinj1a_n.pn_in[13:0] was %x, modif. packet nb_crc_errinj1a_n.pn_out[13:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn_in[(NB_LANES-1):0], tb_top.crc_errinject_top.nb_crc_errinj1a_n.pn_out[(NB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.nb_crc_errinj1a_p.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.nb_crc_errinj1a_p.sclk );
    if ( !( tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn_out[(NB_LANES-1):0] == tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn_in[(NB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet nb_crc_errinj1a_p.pn_in[13:0] was %x, modif. packet nb_crc_errinj1a_p.pn_out[13:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn_in[(NB_LANES-1):0], tb_top.crc_errinject_top.nb_crc_errinj1a_p.pn_out[(NB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.nb_crc_errinj1b_n.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.nb_crc_errinj1b_n.sclk );
    if ( !( tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn_out[(NB_LANES-1):0] == tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn_in[(NB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet nb_crc_errinj1b_n.pn_in[13:0] was %x, modif. packet nb_crc_errinj1b_n.pn_out[13:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn_in[(NB_LANES-1):0], tb_top.crc_errinject_top.nb_crc_errinj1b_n.pn_out[(NB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.nb_crc_errinj1b_p.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.nb_crc_errinj1b_p.sclk );
    if ( !( tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn_out[(NB_LANES-1):0] == tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn_in[(NB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet nb_crc_errinj1b_p.pn_in[13:0] was %x, modif. packet nb_crc_errinj1b_p.pn_out[13:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn_in[(NB_LANES-1):0], tb_top.crc_errinject_top.nb_crc_errinj1b_p.pn_out[(NB_LANES-1):0],i);

    end

end


//2a and 2b
always @( posedge tb_top.crc_errinject_top.nb_crc_errinj2a_n.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.nb_crc_errinj2a_n.sclk );
    if ( !( tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn_out[(NB_LANES-1):0] == tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn_in[(NB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet nb_crc_errinj2a_n.pn_in[13:0] was %x, modif. packet nb_crc_errinj2a_n.pn_out[13:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn_in[(NB_LANES-1):0], tb_top.crc_errinject_top.nb_crc_errinj2a_n.pn_out[(NB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.nb_crc_errinj2a_p.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.nb_crc_errinj2a_p.sclk );
    if ( !( tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn_out[(NB_LANES-1):0] == tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn_in[(NB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet nb_crc_errinj2a_p.pn_in[13:0] was %x, modif. packet nb_crc_errinj2a_p.pn_out[13:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn_in[(NB_LANES-1):0], tb_top.crc_errinject_top.nb_crc_errinj2a_p.pn_out[(NB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.nb_crc_errinj2b_n.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.nb_crc_errinj2b_n.sclk );
    if ( !( tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn_out[(NB_LANES-1):0] == tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn_in[(NB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet nb_crc_errinj2b_n.pn_in[13:0] was %x, modif. packet nb_crc_errinj2b_n.pn_out[13:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn_in[(NB_LANES-1):0], tb_top.crc_errinject_top.nb_crc_errinj2b_n.pn_out[(NB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.nb_crc_errinj2b_p.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.nb_crc_errinj2b_p.sclk );
    if ( !( tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn_out[(NB_LANES-1):0] == tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn_in[(NB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet nb_crc_errinj2b_p.pn_in[13:0] was %x, modif. packet nb_crc_errinj2b_p.pn_out[13:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn_in[(NB_LANES-1):0], tb_top.crc_errinject_top.nb_crc_errinj2b_p.pn_out[(NB_LANES-1):0],i);

    end

end


//3a and 3b

always @( posedge tb_top.crc_errinject_top.nb_crc_errinj3a_n.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.nb_crc_errinj3a_n.sclk );
    if ( !( tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn_out[(NB_LANES-1):0] == tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn_in[(NB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet nb_crc_errinj3a_n.pn_in[13:0] was %x, modif. packet nb_crc_errinj3a_n.pn_out[13:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn_in[(NB_LANES-1):0], tb_top.crc_errinject_top.nb_crc_errinj3a_n.pn_out[(NB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.nb_crc_errinj3a_p.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.nb_crc_errinj3a_p.sclk );
    if ( !( tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn_out[(NB_LANES-1):0] == tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn_in[(NB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet nb_crc_errinj3a_p.pn_in[13:0] was %x, modif. packet nb_crc_errinj3a_p.pn_out[13:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn_in[(NB_LANES-1):0], tb_top.crc_errinject_top.nb_crc_errinj3a_p.pn_out[(NB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.nb_crc_errinj3b_n.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.nb_crc_errinj3b_n.sclk );
    if ( !( tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn_out[(NB_LANES-1):0] == tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn_in[(NB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet nb_crc_errinj3b_n.pn_in[13:0] was %x, modif. packet nb_crc_errinj3b_n.pn_out[13:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn_in[(NB_LANES-1):0], tb_top.crc_errinject_top.nb_crc_errinj3b_n.pn_out[(NB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.nb_crc_errinj3b_p.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.nb_crc_errinj3b_p.sclk );
    if ( !( tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn_out[(NB_LANES-1):0] == tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn_in[(NB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet nb_crc_errinj3b_p.pn_in[13:0] was %x, modif. packet nb_crc_errinj3b_p.pn_out[13:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn_in[(NB_LANES-1):0], tb_top.crc_errinject_top.nb_crc_errinj3b_p.pn_out[(NB_LANES-1):0],i);

    end

end


// sb

//0a and 0b
always @( posedge tb_top.crc_errinject_top.sb_crc_errinj0a_n.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.sb_crc_errinj0a_n.link_clk );
    if ( !( tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_out[(SB_LANES-1):0] == tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_in[(SB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet sb_crc_errinj0a_n.ps_in[9:0] was %x, modif. packet sb_crc_errinj0a_n.ps_out[9:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_in[(SB_LANES-1):0], tb_top.crc_errinject_top.sb_crc_errinj0a_n.ps_out[(SB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.sb_crc_errinj0a_p.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.sb_crc_errinj0a_p.link_clk );
    if ( !( tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_out[(SB_LANES-1):0] == tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_in[(SB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet sb_crc_errinj0a_p.ps_in[9:0] was %x, modif. packet sb_crc_errinj0a_p.ps_out[9:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_in[(SB_LANES-1):0], tb_top.crc_errinject_top.sb_crc_errinj0a_p.ps_out[(SB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.sb_crc_errinj0b_n.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.sb_crc_errinj0b_n.link_clk );
    if ( !( tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_out[(SB_LANES-1):0] == tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_in[(SB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet sb_crc_errinj0b_n.ps_in[9:0] was %x, modif. packet sb_crc_errinj0b_n.ps_out[9:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_in[(SB_LANES-1):0], tb_top.crc_errinject_top.sb_crc_errinj0b_n.ps_out[(SB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.sb_crc_errinj0b_p.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.sb_crc_errinj0b_p.link_clk );
    if ( !( tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_out[(SB_LANES-1):0] == tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_in[(SB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet sb_crc_errinj0b_p.ps_in[9:0] was %x, modif. packet sb_crc_errinj0b_p.ps_out[9:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_in[(SB_LANES-1):0], tb_top.crc_errinject_top.sb_crc_errinj0b_p.ps_out[(SB_LANES-1):0],i);

    end

end


//1a and 1b

always @( posedge tb_top.crc_errinject_top.sb_crc_errinj1a_n.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.sb_crc_errinj1a_n.link_clk );
    if ( !( tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps_out[(SB_LANES-1):0] == tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps_in[(SB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet sb_crc_errinj1a_n.ps_in[9:0] was %x, modif. packet sb_crc_errinj1a_n.ps_out[9:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps_in[(SB_LANES-1):0], tb_top.crc_errinject_top.sb_crc_errinj1a_n.ps_out[(SB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.sb_crc_errinj1a_p.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.sb_crc_errinj1a_p.link_clk );
    if ( !( tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps_out[(SB_LANES-1):0] == tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps_in[(SB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet sb_crc_errinj1a_p.ps_in[9:0] was %x, modif. packet sb_crc_errinj1a_p.ps_out[9:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps_in[(SB_LANES-1):0], tb_top.crc_errinject_top.sb_crc_errinj1a_p.ps_out[(SB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.sb_crc_errinj1b_n.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.sb_crc_errinj1b_n.link_clk );
    if ( !( tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps_out[(SB_LANES-1):0] == tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps_in[(SB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet sb_crc_errinj1b_n.ps_in[9:0] was %x, modif. packet sb_crc_errinj1b_n.ps_out[9:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps_in[(SB_LANES-1):0], tb_top.crc_errinject_top.sb_crc_errinj1b_n.ps_out[(SB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.sb_crc_errinj1b_p.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.sb_crc_errinj1b_p.link_clk );
    if ( !( tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps_out[(SB_LANES-1):0] == tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps_in[(SB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet sb_crc_errinj1b_p.ps_in[9:0] was %x, modif. packet sb_crc_errinj1b_p.ps_out[9:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps_in[(SB_LANES-1):0], tb_top.crc_errinject_top.sb_crc_errinj1b_p.ps_out[(SB_LANES-1):0],i);

    end

end


//2a and 2b
always @( posedge tb_top.crc_errinject_top.sb_crc_errinj2a_n.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.sb_crc_errinj2a_n.link_clk );
    if ( !( tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps_out[(SB_LANES-1):0] == tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps_in[(SB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet sb_crc_errinj2a_n.ps_in[9:0] was %x, modif. packet sb_crc_errinj2a_n.ps_out[9:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps_in[(SB_LANES-1):0], tb_top.crc_errinject_top.sb_crc_errinj2a_n.ps_out[(SB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.sb_crc_errinj2a_p.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.sb_crc_errinj2a_p.link_clk );
    if ( !( tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps_out[(SB_LANES-1):0] == tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps_in[(SB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet sb_crc_errinj2a_p.ps_in[9:0] was %x, modif. packet sb_crc_errinj2a_p.ps_out[9:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps_in[(SB_LANES-1):0], tb_top.crc_errinject_top.sb_crc_errinj2a_p.ps_out[(SB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.sb_crc_errinj2b_n.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.sb_crc_errinj2b_n.link_clk );
    if ( !( tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps_out[(SB_LANES-1):0] == tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps_in[(SB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet sb_crc_errinj2b_n.ps_in[9:0] was %x, modif. packet sb_crc_errinj2b_n.ps_out[9:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps_in[(SB_LANES-1):0], tb_top.crc_errinject_top.sb_crc_errinj2b_n.ps_out[(SB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.sb_crc_errinj2b_p.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.sb_crc_errinj2b_p.link_clk );
    if ( !( tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps_out[(SB_LANES-1):0] == tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps_in[(SB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet sb_crc_errinj2b_p.ps_in[9:0] was %x, modif. packet sb_crc_errinj2b_p.ps_out[9:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps_in[(SB_LANES-1):0], tb_top.crc_errinject_top.sb_crc_errinj2b_p.ps_out[(SB_LANES-1):0],i);

    end

end


//3a and 3b

always @( posedge tb_top.crc_errinject_top.sb_crc_errinj3a_n.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.sb_crc_errinj3a_n.link_clk );
    if ( !( tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps_out[(SB_LANES-1):0] == tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps_in[(SB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet sb_crc_errinj3a_n.ps_in[9:0] was %x, modif. packet sb_crc_errinj3a_n.ps_out[9:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps_in[(SB_LANES-1):0], tb_top.crc_errinject_top.sb_crc_errinj3a_n.ps_out[(SB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.sb_crc_errinj3a_p.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.sb_crc_errinj3a_p.link_clk );
    if ( !( tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps_out[(SB_LANES-1):0] == tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps_in[(SB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet sb_crc_errinj3a_p.ps_in[9:0] was %x, modif. packet sb_crc_errinj3a_p.ps_out[9:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps_in[(SB_LANES-1):0], tb_top.crc_errinject_top.sb_crc_errinj3a_p.ps_out[(SB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.sb_crc_errinj3b_n.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.sb_crc_errinj3b_n.link_clk );
    if ( !( tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps_out[(SB_LANES-1):0] == tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps_in[(SB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet sb_crc_errinj3b_n.ps_in[9:0] was %x, modif. packet sb_crc_errinj3b_n.ps_out[9:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps_in[(SB_LANES-1):0], tb_top.crc_errinject_top.sb_crc_errinj3b_n.ps_out[(SB_LANES-1):0],i);

    end

end


always @( posedge tb_top.crc_errinject_top.sb_crc_errinj3b_p.crc_en ) begin

    for ( i=0; i < BIT_TIMES; i=i+1 ) begin
    @( posedge tb_top.crc_errinject_top.sb_crc_errinj3b_p.link_clk );
    if ( !( tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps_out[(SB_LANES-1):0] == tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps_in[(SB_LANES-1):0] ) )
        `PR_ALWAYS("mcu_fmon",`ALWAYS,"INFO: orig. packet sb_crc_errinj3b_p.ps_in[9:0] was %x, modif. packet sb_crc_errinj3b_p.ps_out[9:0] is %x, change happened for bit time %d", tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps_in[(SB_LANES-1):0], tb_top.crc_errinject_top.sb_crc_errinj3b_p.ps_out[(SB_LANES-1):0],i);

    end

end

/*
    //following added to dump and debug memory contents
    always @ (posedge global_monitor.trigger_RD) begin
    if ( ($test$plusargs("ONE_NIBBLE_ERROR") || $test$plusargs("MULTI_NIBBLE_ERROR")) && !$test$plusargs("ON_WRITE_NEW") ) begin
        #1000 
        $fsdbDumpMem(global_monitor.mcu0_read_data_array_QW1);
        $fsdbDumpMem(global_monitor.mcu0_read_data_array_QW2);
        #3000
        $fsdbDumpMem(global_monitor.mcu0_read_data_array_QW3);
        $fsdbDumpMem(global_monitor.mcu0_read_data_array_QW4);
        end
    end
    always @ (posedge global_monitor.trigger_WR) begin
    if ( ($test$plusargs("ONE_NIBBLE_ERROR") || $test$plusargs("MULTI_NIBBLE_ERROR")) && $test$plusargs("ON_WRITE_NEW") ) begin
        #3000
        #1000
        $fsdbDumpMem(global_monitor.mcu0_write_data_array_QW1);
        #3000
        $fsdbDumpMem(global_monitor.mcu0_write_data_array_QW2);
        #3000
        $fsdbDumpMem(global_monitor.mcu0_write_data_array_QW3);
        #3000
        $fsdbDumpMem(global_monitor.mcu0_write_data_array_QW4);
        end
    end
*/

    always @ (posedge mcu_fmon.trigger_NB) begin
    if ( $test$plusargs("MCU0_NB_ERR_ENABLE") || $test$plusargs("MCU0_NB_ERR_RANDOM") ) begin
        #1000
        $fsdbDumpMem(mcu_fmon.mcu0_nb_data_array_QW1);
        $fsdbDumpMem(mcu_fmon.mcu0_nb_data_array_QW2);
        #3000
        $fsdbDumpMem(mcu_fmon.mcu0_nb_data_array_QW3);
        $fsdbDumpMem(mcu_fmon.mcu0_nb_data_array_QW4);
        end
    end
    always @ (posedge mcu_fmon.trigger_SB) begin
    if ( $test$plusargs("MCU0_SB_ERR_ENABLE") || $test$plusargs("MCU0_SB_ERR_RANDOM") ) begin
        #3000
        #3000
        #1000
        $fsdbDumpMem(mcu_fmon.mcu0_sb_data_array_QW1);
        #3000
        $fsdbDumpMem(mcu_fmon.mcu0_sb_data_array_QW2);
        #3000
        $fsdbDumpMem(mcu_fmon.mcu0_sb_data_array_QW3);
        #3000
        $fsdbDumpMem(mcu_fmon.mcu0_sb_data_array_QW4);
        end
    end

`endif

endmodule
