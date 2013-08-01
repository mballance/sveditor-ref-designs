// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_eqs_stage_mux_only.v
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
module dmu_imu_eqs_stage_mux_only 
	(
	clk,
	read_data_0,
	eq_base_address_select_pulse,
	eq_base_address_select_pulse_out,
	eq_ctrl_set_select_0,
	eq_ctrl_set_select_0_out,
	eq_ctrl_set_select_1,
	eq_ctrl_set_select_1_out,
	eq_ctrl_set_select_2,
	eq_ctrl_set_select_2_out,
	eq_ctrl_set_select_3,
	eq_ctrl_set_select_3_out,
	eq_ctrl_set_select_4,
	eq_ctrl_set_select_4_out,
	eq_ctrl_set_select_5,
	eq_ctrl_set_select_5_out,
	eq_ctrl_set_select_6,
	eq_ctrl_set_select_6_out,
	eq_ctrl_set_select_7,
	eq_ctrl_set_select_7_out,
	eq_ctrl_set_select_8,
	eq_ctrl_set_select_8_out,
	eq_ctrl_set_select_9,
	eq_ctrl_set_select_9_out,
	eq_ctrl_set_select_10,
	eq_ctrl_set_select_10_out,
	eq_ctrl_set_select_11,
	eq_ctrl_set_select_11_out,
	eq_ctrl_set_select_12,
	eq_ctrl_set_select_12_out,
	eq_ctrl_set_select_13,
	eq_ctrl_set_select_13_out,
	eq_ctrl_set_select_14,
	eq_ctrl_set_select_14_out,
	eq_ctrl_set_select_15,
	eq_ctrl_set_select_15_out,
	eq_ctrl_set_select_16,
	eq_ctrl_set_select_16_out,
	eq_ctrl_set_select_17,
	eq_ctrl_set_select_17_out,
	eq_ctrl_set_select_18,
	eq_ctrl_set_select_18_out,
	eq_ctrl_set_select_19,
	eq_ctrl_set_select_19_out,
	eq_ctrl_set_select_20,
	eq_ctrl_set_select_20_out,
	eq_ctrl_set_select_21,
	eq_ctrl_set_select_21_out,
	eq_ctrl_set_select_22,
	eq_ctrl_set_select_22_out,
	eq_ctrl_set_select_23,
	eq_ctrl_set_select_23_out,
	eq_ctrl_set_select_24,
	eq_ctrl_set_select_24_out,
	eq_ctrl_set_select_25,
	eq_ctrl_set_select_25_out,
	eq_ctrl_set_select_26,
	eq_ctrl_set_select_26_out,
	eq_ctrl_set_select_27,
	eq_ctrl_set_select_27_out,
	eq_ctrl_set_select_28,
	eq_ctrl_set_select_28_out,
	eq_ctrl_set_select_29,
	eq_ctrl_set_select_29_out,
	eq_ctrl_set_select_30,
	eq_ctrl_set_select_30_out,
	eq_ctrl_set_select_31,
	eq_ctrl_set_select_31_out,
	eq_ctrl_set_select_32,
	eq_ctrl_set_select_32_out,
	eq_ctrl_set_select_33,
	eq_ctrl_set_select_33_out,
	eq_ctrl_set_select_34,
	eq_ctrl_set_select_34_out,
	eq_ctrl_set_select_35,
	eq_ctrl_set_select_35_out,
	eq_ctrl_clr_select_0,
	eq_ctrl_clr_select_0_out,
	eq_ctrl_clr_select_1,
	eq_ctrl_clr_select_1_out,
	eq_ctrl_clr_select_2,
	eq_ctrl_clr_select_2_out,
	eq_ctrl_clr_select_3,
	eq_ctrl_clr_select_3_out,
	eq_ctrl_clr_select_4,
	eq_ctrl_clr_select_4_out,
	eq_ctrl_clr_select_5,
	eq_ctrl_clr_select_5_out,
	eq_ctrl_clr_select_6,
	eq_ctrl_clr_select_6_out,
	eq_ctrl_clr_select_7,
	eq_ctrl_clr_select_7_out,
	eq_ctrl_clr_select_8,
	eq_ctrl_clr_select_8_out,
	eq_ctrl_clr_select_9,
	eq_ctrl_clr_select_9_out,
	eq_ctrl_clr_select_10,
	eq_ctrl_clr_select_10_out,
	eq_ctrl_clr_select_11,
	eq_ctrl_clr_select_11_out,
	eq_ctrl_clr_select_12,
	eq_ctrl_clr_select_12_out,
	eq_ctrl_clr_select_13,
	eq_ctrl_clr_select_13_out,
	eq_ctrl_clr_select_14,
	eq_ctrl_clr_select_14_out,
	eq_ctrl_clr_select_15,
	eq_ctrl_clr_select_15_out,
	eq_ctrl_clr_select_16,
	eq_ctrl_clr_select_16_out,
	eq_ctrl_clr_select_17,
	eq_ctrl_clr_select_17_out,
	eq_ctrl_clr_select_18,
	eq_ctrl_clr_select_18_out,
	eq_ctrl_clr_select_19,
	eq_ctrl_clr_select_19_out,
	eq_ctrl_clr_select_20,
	eq_ctrl_clr_select_20_out,
	eq_ctrl_clr_select_21,
	eq_ctrl_clr_select_21_out,
	eq_ctrl_clr_select_22,
	eq_ctrl_clr_select_22_out,
	eq_ctrl_clr_select_23,
	eq_ctrl_clr_select_23_out,
	eq_ctrl_clr_select_24,
	eq_ctrl_clr_select_24_out,
	eq_ctrl_clr_select_25,
	eq_ctrl_clr_select_25_out,
	eq_ctrl_clr_select_26,
	eq_ctrl_clr_select_26_out,
	eq_ctrl_clr_select_27,
	eq_ctrl_clr_select_27_out,
	eq_ctrl_clr_select_28,
	eq_ctrl_clr_select_28_out,
	eq_ctrl_clr_select_29,
	eq_ctrl_clr_select_29_out,
	eq_ctrl_clr_select_30,
	eq_ctrl_clr_select_30_out,
	eq_ctrl_clr_select_31,
	eq_ctrl_clr_select_31_out,
	eq_ctrl_clr_select_32,
	eq_ctrl_clr_select_32_out,
	eq_ctrl_clr_select_33,
	eq_ctrl_clr_select_33_out,
	eq_ctrl_clr_select_34,
	eq_ctrl_clr_select_34_out,
	eq_ctrl_clr_select_35,
	eq_ctrl_clr_select_35_out,
	eq_state_select_0,
	eq_state_select_0_out,
	eq_state_select_1,
	eq_state_select_1_out,
	eq_state_select_2,
	eq_state_select_2_out,
	eq_state_select_3,
	eq_state_select_3_out,
	eq_state_select_4,
	eq_state_select_4_out,
	eq_state_select_5,
	eq_state_select_5_out,
	eq_state_select_6,
	eq_state_select_6_out,
	eq_state_select_7,
	eq_state_select_7_out,
	eq_state_select_8,
	eq_state_select_8_out,
	eq_state_select_9,
	eq_state_select_9_out,
	eq_state_select_10,
	eq_state_select_10_out,
	eq_state_select_11,
	eq_state_select_11_out,
	eq_state_select_12,
	eq_state_select_12_out,
	eq_state_select_13,
	eq_state_select_13_out,
	eq_state_select_14,
	eq_state_select_14_out,
	eq_state_select_15,
	eq_state_select_15_out,
	eq_state_select_16,
	eq_state_select_16_out,
	eq_state_select_17,
	eq_state_select_17_out,
	eq_state_select_18,
	eq_state_select_18_out,
	eq_state_select_19,
	eq_state_select_19_out,
	eq_state_select_20,
	eq_state_select_20_out,
	eq_state_select_21,
	eq_state_select_21_out,
	eq_state_select_22,
	eq_state_select_22_out,
	eq_state_select_23,
	eq_state_select_23_out,
	eq_state_select_24,
	eq_state_select_24_out,
	eq_state_select_25,
	eq_state_select_25_out,
	eq_state_select_26,
	eq_state_select_26_out,
	eq_state_select_27,
	eq_state_select_27_out,
	eq_state_select_28,
	eq_state_select_28_out,
	eq_state_select_29,
	eq_state_select_29_out,
	eq_state_select_30,
	eq_state_select_30_out,
	eq_state_select_31,
	eq_state_select_31_out,
	eq_state_select_32,
	eq_state_select_32_out,
	eq_state_select_33,
	eq_state_select_33_out,
	eq_state_select_34,
	eq_state_select_34_out,
	eq_state_select_35,
	eq_state_select_35_out,
	eq_tail_select_pulse_0,
	eq_tail_select_pulse_0_out,
	eq_tail_select_pulse_1,
	eq_tail_select_pulse_1_out,
	eq_tail_select_pulse_2,
	eq_tail_select_pulse_2_out,
	eq_tail_select_pulse_3,
	eq_tail_select_pulse_3_out,
	eq_tail_select_pulse_4,
	eq_tail_select_pulse_4_out,
	eq_tail_select_pulse_5,
	eq_tail_select_pulse_5_out,
	eq_tail_select_pulse_6,
	eq_tail_select_pulse_6_out,
	eq_tail_select_pulse_7,
	eq_tail_select_pulse_7_out,
	eq_tail_select_pulse_8,
	eq_tail_select_pulse_8_out,
	eq_tail_select_pulse_9,
	eq_tail_select_pulse_9_out,
	eq_tail_select_pulse_10,
	eq_tail_select_pulse_10_out,
	eq_tail_select_pulse_11,
	eq_tail_select_pulse_11_out,
	eq_tail_select_pulse_12,
	eq_tail_select_pulse_12_out,
	eq_tail_select_pulse_13,
	eq_tail_select_pulse_13_out,
	eq_tail_select_pulse_14,
	eq_tail_select_pulse_14_out,
	eq_tail_select_pulse_15,
	eq_tail_select_pulse_15_out,
	eq_tail_select_pulse_16,
	eq_tail_select_pulse_16_out,
	eq_tail_select_pulse_17,
	eq_tail_select_pulse_17_out,
	eq_tail_select_pulse_18,
	eq_tail_select_pulse_18_out,
	eq_tail_select_pulse_19,
	eq_tail_select_pulse_19_out,
	eq_tail_select_pulse_20,
	eq_tail_select_pulse_20_out,
	eq_tail_select_pulse_21,
	eq_tail_select_pulse_21_out,
	eq_tail_select_pulse_22,
	eq_tail_select_pulse_22_out,
	eq_tail_select_pulse_23,
	eq_tail_select_pulse_23_out,
	eq_tail_select_pulse_24,
	eq_tail_select_pulse_24_out,
	eq_tail_select_pulse_25,
	eq_tail_select_pulse_25_out,
	eq_tail_select_pulse_26,
	eq_tail_select_pulse_26_out,
	eq_tail_select_pulse_27,
	eq_tail_select_pulse_27_out,
	eq_tail_select_pulse_28,
	eq_tail_select_pulse_28_out,
	eq_tail_select_pulse_29,
	eq_tail_select_pulse_29_out,
	eq_tail_select_pulse_30,
	eq_tail_select_pulse_30_out,
	eq_tail_select_pulse_31,
	eq_tail_select_pulse_31_out,
	eq_tail_select_pulse_32,
	eq_tail_select_pulse_32_out,
	eq_tail_select_pulse_33,
	eq_tail_select_pulse_33_out,
	eq_tail_select_pulse_34,
	eq_tail_select_pulse_34_out,
	eq_tail_select_pulse_35,
	eq_tail_select_pulse_35_out,
	eq_head_select_pulse_0,
	eq_head_select_pulse_0_out,
	eq_head_select_pulse_1,
	eq_head_select_pulse_1_out,
	eq_head_select_pulse_2,
	eq_head_select_pulse_2_out,
	eq_head_select_pulse_3,
	eq_head_select_pulse_3_out,
	eq_head_select_pulse_4,
	eq_head_select_pulse_4_out,
	eq_head_select_pulse_5,
	eq_head_select_pulse_5_out,
	eq_head_select_pulse_6,
	eq_head_select_pulse_6_out,
	eq_head_select_pulse_7,
	eq_head_select_pulse_7_out,
	eq_head_select_pulse_8,
	eq_head_select_pulse_8_out,
	eq_head_select_pulse_9,
	eq_head_select_pulse_9_out,
	eq_head_select_pulse_10,
	eq_head_select_pulse_10_out,
	eq_head_select_pulse_11,
	eq_head_select_pulse_11_out,
	eq_head_select_pulse_12,
	eq_head_select_pulse_12_out,
	eq_head_select_pulse_13,
	eq_head_select_pulse_13_out,
	eq_head_select_pulse_14,
	eq_head_select_pulse_14_out,
	eq_head_select_pulse_15,
	eq_head_select_pulse_15_out,
	eq_head_select_pulse_16,
	eq_head_select_pulse_16_out,
	eq_head_select_pulse_17,
	eq_head_select_pulse_17_out,
	eq_head_select_pulse_18,
	eq_head_select_pulse_18_out,
	eq_head_select_pulse_19,
	eq_head_select_pulse_19_out,
	eq_head_select_pulse_20,
	eq_head_select_pulse_20_out,
	eq_head_select_pulse_21,
	eq_head_select_pulse_21_out,
	eq_head_select_pulse_22,
	eq_head_select_pulse_22_out,
	eq_head_select_pulse_23,
	eq_head_select_pulse_23_out,
	eq_head_select_pulse_24,
	eq_head_select_pulse_24_out,
	eq_head_select_pulse_25,
	eq_head_select_pulse_25_out,
	eq_head_select_pulse_26,
	eq_head_select_pulse_26_out,
	eq_head_select_pulse_27,
	eq_head_select_pulse_27_out,
	eq_head_select_pulse_28,
	eq_head_select_pulse_28_out,
	eq_head_select_pulse_29,
	eq_head_select_pulse_29_out,
	eq_head_select_pulse_30,
	eq_head_select_pulse_30_out,
	eq_head_select_pulse_31,
	eq_head_select_pulse_31_out,
	eq_head_select_pulse_32,
	eq_head_select_pulse_32_out,
	eq_head_select_pulse_33,
	eq_head_select_pulse_33_out,
	eq_head_select_pulse_34,
	eq_head_select_pulse_34_out,
	eq_head_select_pulse_35,
	eq_head_select_pulse_35_out,
	daemon_csrbus_wr_in,
	daemon_csrbus_wr_out,
	daemon_csrbus_wr_data_in,
	daemon_csrbus_wr_data_out,
	read_data_0_out,
	rst_l,
	rst_l_out
	);

//====================================================
//     Polarity declarations
//====================================================
input  clk;  // Clock signal
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0;  // Read Data
input  eq_base_address_select_pulse;  // select
output eq_base_address_select_pulse_out;  // select
input  eq_ctrl_set_select_0;  // select
output eq_ctrl_set_select_0_out;  // select
input  eq_ctrl_set_select_1;  // select
output eq_ctrl_set_select_1_out;  // select
input  eq_ctrl_set_select_2;  // select
output eq_ctrl_set_select_2_out;  // select
input  eq_ctrl_set_select_3;  // select
output eq_ctrl_set_select_3_out;  // select
input  eq_ctrl_set_select_4;  // select
output eq_ctrl_set_select_4_out;  // select
input  eq_ctrl_set_select_5;  // select
output eq_ctrl_set_select_5_out;  // select
input  eq_ctrl_set_select_6;  // select
output eq_ctrl_set_select_6_out;  // select
input  eq_ctrl_set_select_7;  // select
output eq_ctrl_set_select_7_out;  // select
input  eq_ctrl_set_select_8;  // select
output eq_ctrl_set_select_8_out;  // select
input  eq_ctrl_set_select_9;  // select
output eq_ctrl_set_select_9_out;  // select
input  eq_ctrl_set_select_10;  // select
output eq_ctrl_set_select_10_out;  // select
input  eq_ctrl_set_select_11;  // select
output eq_ctrl_set_select_11_out;  // select
input  eq_ctrl_set_select_12;  // select
output eq_ctrl_set_select_12_out;  // select
input  eq_ctrl_set_select_13;  // select
output eq_ctrl_set_select_13_out;  // select
input  eq_ctrl_set_select_14;  // select
output eq_ctrl_set_select_14_out;  // select
input  eq_ctrl_set_select_15;  // select
output eq_ctrl_set_select_15_out;  // select
input  eq_ctrl_set_select_16;  // select
output eq_ctrl_set_select_16_out;  // select
input  eq_ctrl_set_select_17;  // select
output eq_ctrl_set_select_17_out;  // select
input  eq_ctrl_set_select_18;  // select
output eq_ctrl_set_select_18_out;  // select
input  eq_ctrl_set_select_19;  // select
output eq_ctrl_set_select_19_out;  // select
input  eq_ctrl_set_select_20;  // select
output eq_ctrl_set_select_20_out;  // select
input  eq_ctrl_set_select_21;  // select
output eq_ctrl_set_select_21_out;  // select
input  eq_ctrl_set_select_22;  // select
output eq_ctrl_set_select_22_out;  // select
input  eq_ctrl_set_select_23;  // select
output eq_ctrl_set_select_23_out;  // select
input  eq_ctrl_set_select_24;  // select
output eq_ctrl_set_select_24_out;  // select
input  eq_ctrl_set_select_25;  // select
output eq_ctrl_set_select_25_out;  // select
input  eq_ctrl_set_select_26;  // select
output eq_ctrl_set_select_26_out;  // select
input  eq_ctrl_set_select_27;  // select
output eq_ctrl_set_select_27_out;  // select
input  eq_ctrl_set_select_28;  // select
output eq_ctrl_set_select_28_out;  // select
input  eq_ctrl_set_select_29;  // select
output eq_ctrl_set_select_29_out;  // select
input  eq_ctrl_set_select_30;  // select
output eq_ctrl_set_select_30_out;  // select
input  eq_ctrl_set_select_31;  // select
output eq_ctrl_set_select_31_out;  // select
input  eq_ctrl_set_select_32;  // select
output eq_ctrl_set_select_32_out;  // select
input  eq_ctrl_set_select_33;  // select
output eq_ctrl_set_select_33_out;  // select
input  eq_ctrl_set_select_34;  // select
output eq_ctrl_set_select_34_out;  // select
input  eq_ctrl_set_select_35;  // select
output eq_ctrl_set_select_35_out;  // select
input  eq_ctrl_clr_select_0;  // select
output eq_ctrl_clr_select_0_out;  // select
input  eq_ctrl_clr_select_1;  // select
output eq_ctrl_clr_select_1_out;  // select
input  eq_ctrl_clr_select_2;  // select
output eq_ctrl_clr_select_2_out;  // select
input  eq_ctrl_clr_select_3;  // select
output eq_ctrl_clr_select_3_out;  // select
input  eq_ctrl_clr_select_4;  // select
output eq_ctrl_clr_select_4_out;  // select
input  eq_ctrl_clr_select_5;  // select
output eq_ctrl_clr_select_5_out;  // select
input  eq_ctrl_clr_select_6;  // select
output eq_ctrl_clr_select_6_out;  // select
input  eq_ctrl_clr_select_7;  // select
output eq_ctrl_clr_select_7_out;  // select
input  eq_ctrl_clr_select_8;  // select
output eq_ctrl_clr_select_8_out;  // select
input  eq_ctrl_clr_select_9;  // select
output eq_ctrl_clr_select_9_out;  // select
input  eq_ctrl_clr_select_10;  // select
output eq_ctrl_clr_select_10_out;  // select
input  eq_ctrl_clr_select_11;  // select
output eq_ctrl_clr_select_11_out;  // select
input  eq_ctrl_clr_select_12;  // select
output eq_ctrl_clr_select_12_out;  // select
input  eq_ctrl_clr_select_13;  // select
output eq_ctrl_clr_select_13_out;  // select
input  eq_ctrl_clr_select_14;  // select
output eq_ctrl_clr_select_14_out;  // select
input  eq_ctrl_clr_select_15;  // select
output eq_ctrl_clr_select_15_out;  // select
input  eq_ctrl_clr_select_16;  // select
output eq_ctrl_clr_select_16_out;  // select
input  eq_ctrl_clr_select_17;  // select
output eq_ctrl_clr_select_17_out;  // select
input  eq_ctrl_clr_select_18;  // select
output eq_ctrl_clr_select_18_out;  // select
input  eq_ctrl_clr_select_19;  // select
output eq_ctrl_clr_select_19_out;  // select
input  eq_ctrl_clr_select_20;  // select
output eq_ctrl_clr_select_20_out;  // select
input  eq_ctrl_clr_select_21;  // select
output eq_ctrl_clr_select_21_out;  // select
input  eq_ctrl_clr_select_22;  // select
output eq_ctrl_clr_select_22_out;  // select
input  eq_ctrl_clr_select_23;  // select
output eq_ctrl_clr_select_23_out;  // select
input  eq_ctrl_clr_select_24;  // select
output eq_ctrl_clr_select_24_out;  // select
input  eq_ctrl_clr_select_25;  // select
output eq_ctrl_clr_select_25_out;  // select
input  eq_ctrl_clr_select_26;  // select
output eq_ctrl_clr_select_26_out;  // select
input  eq_ctrl_clr_select_27;  // select
output eq_ctrl_clr_select_27_out;  // select
input  eq_ctrl_clr_select_28;  // select
output eq_ctrl_clr_select_28_out;  // select
input  eq_ctrl_clr_select_29;  // select
output eq_ctrl_clr_select_29_out;  // select
input  eq_ctrl_clr_select_30;  // select
output eq_ctrl_clr_select_30_out;  // select
input  eq_ctrl_clr_select_31;  // select
output eq_ctrl_clr_select_31_out;  // select
input  eq_ctrl_clr_select_32;  // select
output eq_ctrl_clr_select_32_out;  // select
input  eq_ctrl_clr_select_33;  // select
output eq_ctrl_clr_select_33_out;  // select
input  eq_ctrl_clr_select_34;  // select
output eq_ctrl_clr_select_34_out;  // select
input  eq_ctrl_clr_select_35;  // select
output eq_ctrl_clr_select_35_out;  // select
input  eq_state_select_0;  // select
output eq_state_select_0_out;  // select
input  eq_state_select_1;  // select
output eq_state_select_1_out;  // select
input  eq_state_select_2;  // select
output eq_state_select_2_out;  // select
input  eq_state_select_3;  // select
output eq_state_select_3_out;  // select
input  eq_state_select_4;  // select
output eq_state_select_4_out;  // select
input  eq_state_select_5;  // select
output eq_state_select_5_out;  // select
input  eq_state_select_6;  // select
output eq_state_select_6_out;  // select
input  eq_state_select_7;  // select
output eq_state_select_7_out;  // select
input  eq_state_select_8;  // select
output eq_state_select_8_out;  // select
input  eq_state_select_9;  // select
output eq_state_select_9_out;  // select
input  eq_state_select_10;  // select
output eq_state_select_10_out;  // select
input  eq_state_select_11;  // select
output eq_state_select_11_out;  // select
input  eq_state_select_12;  // select
output eq_state_select_12_out;  // select
input  eq_state_select_13;  // select
output eq_state_select_13_out;  // select
input  eq_state_select_14;  // select
output eq_state_select_14_out;  // select
input  eq_state_select_15;  // select
output eq_state_select_15_out;  // select
input  eq_state_select_16;  // select
output eq_state_select_16_out;  // select
input  eq_state_select_17;  // select
output eq_state_select_17_out;  // select
input  eq_state_select_18;  // select
output eq_state_select_18_out;  // select
input  eq_state_select_19;  // select
output eq_state_select_19_out;  // select
input  eq_state_select_20;  // select
output eq_state_select_20_out;  // select
input  eq_state_select_21;  // select
output eq_state_select_21_out;  // select
input  eq_state_select_22;  // select
output eq_state_select_22_out;  // select
input  eq_state_select_23;  // select
output eq_state_select_23_out;  // select
input  eq_state_select_24;  // select
output eq_state_select_24_out;  // select
input  eq_state_select_25;  // select
output eq_state_select_25_out;  // select
input  eq_state_select_26;  // select
output eq_state_select_26_out;  // select
input  eq_state_select_27;  // select
output eq_state_select_27_out;  // select
input  eq_state_select_28;  // select
output eq_state_select_28_out;  // select
input  eq_state_select_29;  // select
output eq_state_select_29_out;  // select
input  eq_state_select_30;  // select
output eq_state_select_30_out;  // select
input  eq_state_select_31;  // select
output eq_state_select_31_out;  // select
input  eq_state_select_32;  // select
output eq_state_select_32_out;  // select
input  eq_state_select_33;  // select
output eq_state_select_33_out;  // select
input  eq_state_select_34;  // select
output eq_state_select_34_out;  // select
input  eq_state_select_35;  // select
output eq_state_select_35_out;  // select
input  eq_tail_select_pulse_0;  // select
output eq_tail_select_pulse_0_out;  // select
input  eq_tail_select_pulse_1;  // select
output eq_tail_select_pulse_1_out;  // select
input  eq_tail_select_pulse_2;  // select
output eq_tail_select_pulse_2_out;  // select
input  eq_tail_select_pulse_3;  // select
output eq_tail_select_pulse_3_out;  // select
input  eq_tail_select_pulse_4;  // select
output eq_tail_select_pulse_4_out;  // select
input  eq_tail_select_pulse_5;  // select
output eq_tail_select_pulse_5_out;  // select
input  eq_tail_select_pulse_6;  // select
output eq_tail_select_pulse_6_out;  // select
input  eq_tail_select_pulse_7;  // select
output eq_tail_select_pulse_7_out;  // select
input  eq_tail_select_pulse_8;  // select
output eq_tail_select_pulse_8_out;  // select
input  eq_tail_select_pulse_9;  // select
output eq_tail_select_pulse_9_out;  // select
input  eq_tail_select_pulse_10;  // select
output eq_tail_select_pulse_10_out;  // select
input  eq_tail_select_pulse_11;  // select
output eq_tail_select_pulse_11_out;  // select
input  eq_tail_select_pulse_12;  // select
output eq_tail_select_pulse_12_out;  // select
input  eq_tail_select_pulse_13;  // select
output eq_tail_select_pulse_13_out;  // select
input  eq_tail_select_pulse_14;  // select
output eq_tail_select_pulse_14_out;  // select
input  eq_tail_select_pulse_15;  // select
output eq_tail_select_pulse_15_out;  // select
input  eq_tail_select_pulse_16;  // select
output eq_tail_select_pulse_16_out;  // select
input  eq_tail_select_pulse_17;  // select
output eq_tail_select_pulse_17_out;  // select
input  eq_tail_select_pulse_18;  // select
output eq_tail_select_pulse_18_out;  // select
input  eq_tail_select_pulse_19;  // select
output eq_tail_select_pulse_19_out;  // select
input  eq_tail_select_pulse_20;  // select
output eq_tail_select_pulse_20_out;  // select
input  eq_tail_select_pulse_21;  // select
output eq_tail_select_pulse_21_out;  // select
input  eq_tail_select_pulse_22;  // select
output eq_tail_select_pulse_22_out;  // select
input  eq_tail_select_pulse_23;  // select
output eq_tail_select_pulse_23_out;  // select
input  eq_tail_select_pulse_24;  // select
output eq_tail_select_pulse_24_out;  // select
input  eq_tail_select_pulse_25;  // select
output eq_tail_select_pulse_25_out;  // select
input  eq_tail_select_pulse_26;  // select
output eq_tail_select_pulse_26_out;  // select
input  eq_tail_select_pulse_27;  // select
output eq_tail_select_pulse_27_out;  // select
input  eq_tail_select_pulse_28;  // select
output eq_tail_select_pulse_28_out;  // select
input  eq_tail_select_pulse_29;  // select
output eq_tail_select_pulse_29_out;  // select
input  eq_tail_select_pulse_30;  // select
output eq_tail_select_pulse_30_out;  // select
input  eq_tail_select_pulse_31;  // select
output eq_tail_select_pulse_31_out;  // select
input  eq_tail_select_pulse_32;  // select
output eq_tail_select_pulse_32_out;  // select
input  eq_tail_select_pulse_33;  // select
output eq_tail_select_pulse_33_out;  // select
input  eq_tail_select_pulse_34;  // select
output eq_tail_select_pulse_34_out;  // select
input  eq_tail_select_pulse_35;  // select
output eq_tail_select_pulse_35_out;  // select
input  eq_head_select_pulse_0;  // select
output eq_head_select_pulse_0_out;  // select
input  eq_head_select_pulse_1;  // select
output eq_head_select_pulse_1_out;  // select
input  eq_head_select_pulse_2;  // select
output eq_head_select_pulse_2_out;  // select
input  eq_head_select_pulse_3;  // select
output eq_head_select_pulse_3_out;  // select
input  eq_head_select_pulse_4;  // select
output eq_head_select_pulse_4_out;  // select
input  eq_head_select_pulse_5;  // select
output eq_head_select_pulse_5_out;  // select
input  eq_head_select_pulse_6;  // select
output eq_head_select_pulse_6_out;  // select
input  eq_head_select_pulse_7;  // select
output eq_head_select_pulse_7_out;  // select
input  eq_head_select_pulse_8;  // select
output eq_head_select_pulse_8_out;  // select
input  eq_head_select_pulse_9;  // select
output eq_head_select_pulse_9_out;  // select
input  eq_head_select_pulse_10;  // select
output eq_head_select_pulse_10_out;  // select
input  eq_head_select_pulse_11;  // select
output eq_head_select_pulse_11_out;  // select
input  eq_head_select_pulse_12;  // select
output eq_head_select_pulse_12_out;  // select
input  eq_head_select_pulse_13;  // select
output eq_head_select_pulse_13_out;  // select
input  eq_head_select_pulse_14;  // select
output eq_head_select_pulse_14_out;  // select
input  eq_head_select_pulse_15;  // select
output eq_head_select_pulse_15_out;  // select
input  eq_head_select_pulse_16;  // select
output eq_head_select_pulse_16_out;  // select
input  eq_head_select_pulse_17;  // select
output eq_head_select_pulse_17_out;  // select
input  eq_head_select_pulse_18;  // select
output eq_head_select_pulse_18_out;  // select
input  eq_head_select_pulse_19;  // select
output eq_head_select_pulse_19_out;  // select
input  eq_head_select_pulse_20;  // select
output eq_head_select_pulse_20_out;  // select
input  eq_head_select_pulse_21;  // select
output eq_head_select_pulse_21_out;  // select
input  eq_head_select_pulse_22;  // select
output eq_head_select_pulse_22_out;  // select
input  eq_head_select_pulse_23;  // select
output eq_head_select_pulse_23_out;  // select
input  eq_head_select_pulse_24;  // select
output eq_head_select_pulse_24_out;  // select
input  eq_head_select_pulse_25;  // select
output eq_head_select_pulse_25_out;  // select
input  eq_head_select_pulse_26;  // select
output eq_head_select_pulse_26_out;  // select
input  eq_head_select_pulse_27;  // select
output eq_head_select_pulse_27_out;  // select
input  eq_head_select_pulse_28;  // select
output eq_head_select_pulse_28_out;  // select
input  eq_head_select_pulse_29;  // select
output eq_head_select_pulse_29_out;  // select
input  eq_head_select_pulse_30;  // select
output eq_head_select_pulse_30_out;  // select
input  eq_head_select_pulse_31;  // select
output eq_head_select_pulse_31_out;  // select
input  eq_head_select_pulse_32;  // select
output eq_head_select_pulse_32_out;  // select
input  eq_head_select_pulse_33;  // select
output eq_head_select_pulse_33_out;  // select
input  eq_head_select_pulse_34;  // select
output eq_head_select_pulse_34_out;  // select
input  eq_head_select_pulse_35;  // select
output eq_head_select_pulse_35_out;  // select
input  daemon_csrbus_wr_in;  // csrbus_wr
output daemon_csrbus_wr_out;  // csrbus_wr
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
output [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_out;  // SW write
                                                                 // data
output [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data
input  rst_l;  // HW reset
output rst_l_out;  // HW reset

//====================================================
//     Type declarations
//====================================================
wire clk;  // Clock signal
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0;  // Read Data
wire eq_base_address_select_pulse;  // select
wire eq_base_address_select_pulse_out;  // select
wire eq_ctrl_set_select_0;  // select
wire eq_ctrl_set_select_0_out;  // select
wire eq_ctrl_set_select_1;  // select
wire eq_ctrl_set_select_1_out;  // select
wire eq_ctrl_set_select_2;  // select
wire eq_ctrl_set_select_2_out;  // select
wire eq_ctrl_set_select_3;  // select
wire eq_ctrl_set_select_3_out;  // select
wire eq_ctrl_set_select_4;  // select
wire eq_ctrl_set_select_4_out;  // select
wire eq_ctrl_set_select_5;  // select
wire eq_ctrl_set_select_5_out;  // select
wire eq_ctrl_set_select_6;  // select
wire eq_ctrl_set_select_6_out;  // select
wire eq_ctrl_set_select_7;  // select
wire eq_ctrl_set_select_7_out;  // select
wire eq_ctrl_set_select_8;  // select
wire eq_ctrl_set_select_8_out;  // select
wire eq_ctrl_set_select_9;  // select
wire eq_ctrl_set_select_9_out;  // select
wire eq_ctrl_set_select_10;  // select
wire eq_ctrl_set_select_10_out;  // select
wire eq_ctrl_set_select_11;  // select
wire eq_ctrl_set_select_11_out;  // select
wire eq_ctrl_set_select_12;  // select
wire eq_ctrl_set_select_12_out;  // select
wire eq_ctrl_set_select_13;  // select
wire eq_ctrl_set_select_13_out;  // select
wire eq_ctrl_set_select_14;  // select
wire eq_ctrl_set_select_14_out;  // select
wire eq_ctrl_set_select_15;  // select
wire eq_ctrl_set_select_15_out;  // select
wire eq_ctrl_set_select_16;  // select
wire eq_ctrl_set_select_16_out;  // select
wire eq_ctrl_set_select_17;  // select
wire eq_ctrl_set_select_17_out;  // select
wire eq_ctrl_set_select_18;  // select
wire eq_ctrl_set_select_18_out;  // select
wire eq_ctrl_set_select_19;  // select
wire eq_ctrl_set_select_19_out;  // select
wire eq_ctrl_set_select_20;  // select
wire eq_ctrl_set_select_20_out;  // select
wire eq_ctrl_set_select_21;  // select
wire eq_ctrl_set_select_21_out;  // select
wire eq_ctrl_set_select_22;  // select
wire eq_ctrl_set_select_22_out;  // select
wire eq_ctrl_set_select_23;  // select
wire eq_ctrl_set_select_23_out;  // select
wire eq_ctrl_set_select_24;  // select
wire eq_ctrl_set_select_24_out;  // select
wire eq_ctrl_set_select_25;  // select
wire eq_ctrl_set_select_25_out;  // select
wire eq_ctrl_set_select_26;  // select
wire eq_ctrl_set_select_26_out;  // select
wire eq_ctrl_set_select_27;  // select
wire eq_ctrl_set_select_27_out;  // select
wire eq_ctrl_set_select_28;  // select
wire eq_ctrl_set_select_28_out;  // select
wire eq_ctrl_set_select_29;  // select
wire eq_ctrl_set_select_29_out;  // select
wire eq_ctrl_set_select_30;  // select
wire eq_ctrl_set_select_30_out;  // select
wire eq_ctrl_set_select_31;  // select
wire eq_ctrl_set_select_31_out;  // select
wire eq_ctrl_set_select_32;  // select
wire eq_ctrl_set_select_32_out;  // select
wire eq_ctrl_set_select_33;  // select
wire eq_ctrl_set_select_33_out;  // select
wire eq_ctrl_set_select_34;  // select
wire eq_ctrl_set_select_34_out;  // select
wire eq_ctrl_set_select_35;  // select
wire eq_ctrl_set_select_35_out;  // select
wire eq_ctrl_clr_select_0;  // select
wire eq_ctrl_clr_select_0_out;  // select
wire eq_ctrl_clr_select_1;  // select
wire eq_ctrl_clr_select_1_out;  // select
wire eq_ctrl_clr_select_2;  // select
wire eq_ctrl_clr_select_2_out;  // select
wire eq_ctrl_clr_select_3;  // select
wire eq_ctrl_clr_select_3_out;  // select
wire eq_ctrl_clr_select_4;  // select
wire eq_ctrl_clr_select_4_out;  // select
wire eq_ctrl_clr_select_5;  // select
wire eq_ctrl_clr_select_5_out;  // select
wire eq_ctrl_clr_select_6;  // select
wire eq_ctrl_clr_select_6_out;  // select
wire eq_ctrl_clr_select_7;  // select
wire eq_ctrl_clr_select_7_out;  // select
wire eq_ctrl_clr_select_8;  // select
wire eq_ctrl_clr_select_8_out;  // select
wire eq_ctrl_clr_select_9;  // select
wire eq_ctrl_clr_select_9_out;  // select
wire eq_ctrl_clr_select_10;  // select
wire eq_ctrl_clr_select_10_out;  // select
wire eq_ctrl_clr_select_11;  // select
wire eq_ctrl_clr_select_11_out;  // select
wire eq_ctrl_clr_select_12;  // select
wire eq_ctrl_clr_select_12_out;  // select
wire eq_ctrl_clr_select_13;  // select
wire eq_ctrl_clr_select_13_out;  // select
wire eq_ctrl_clr_select_14;  // select
wire eq_ctrl_clr_select_14_out;  // select
wire eq_ctrl_clr_select_15;  // select
wire eq_ctrl_clr_select_15_out;  // select
wire eq_ctrl_clr_select_16;  // select
wire eq_ctrl_clr_select_16_out;  // select
wire eq_ctrl_clr_select_17;  // select
wire eq_ctrl_clr_select_17_out;  // select
wire eq_ctrl_clr_select_18;  // select
wire eq_ctrl_clr_select_18_out;  // select
wire eq_ctrl_clr_select_19;  // select
wire eq_ctrl_clr_select_19_out;  // select
wire eq_ctrl_clr_select_20;  // select
wire eq_ctrl_clr_select_20_out;  // select
wire eq_ctrl_clr_select_21;  // select
wire eq_ctrl_clr_select_21_out;  // select
wire eq_ctrl_clr_select_22;  // select
wire eq_ctrl_clr_select_22_out;  // select
wire eq_ctrl_clr_select_23;  // select
wire eq_ctrl_clr_select_23_out;  // select
wire eq_ctrl_clr_select_24;  // select
wire eq_ctrl_clr_select_24_out;  // select
wire eq_ctrl_clr_select_25;  // select
wire eq_ctrl_clr_select_25_out;  // select
wire eq_ctrl_clr_select_26;  // select
wire eq_ctrl_clr_select_26_out;  // select
wire eq_ctrl_clr_select_27;  // select
wire eq_ctrl_clr_select_27_out;  // select
wire eq_ctrl_clr_select_28;  // select
wire eq_ctrl_clr_select_28_out;  // select
wire eq_ctrl_clr_select_29;  // select
wire eq_ctrl_clr_select_29_out;  // select
wire eq_ctrl_clr_select_30;  // select
wire eq_ctrl_clr_select_30_out;  // select
wire eq_ctrl_clr_select_31;  // select
wire eq_ctrl_clr_select_31_out;  // select
wire eq_ctrl_clr_select_32;  // select
wire eq_ctrl_clr_select_32_out;  // select
wire eq_ctrl_clr_select_33;  // select
wire eq_ctrl_clr_select_33_out;  // select
wire eq_ctrl_clr_select_34;  // select
wire eq_ctrl_clr_select_34_out;  // select
wire eq_ctrl_clr_select_35;  // select
wire eq_ctrl_clr_select_35_out;  // select
wire eq_state_select_0;  // select
wire eq_state_select_0_out;  // select
wire eq_state_select_1;  // select
wire eq_state_select_1_out;  // select
wire eq_state_select_2;  // select
wire eq_state_select_2_out;  // select
wire eq_state_select_3;  // select
wire eq_state_select_3_out;  // select
wire eq_state_select_4;  // select
wire eq_state_select_4_out;  // select
wire eq_state_select_5;  // select
wire eq_state_select_5_out;  // select
wire eq_state_select_6;  // select
wire eq_state_select_6_out;  // select
wire eq_state_select_7;  // select
wire eq_state_select_7_out;  // select
wire eq_state_select_8;  // select
wire eq_state_select_8_out;  // select
wire eq_state_select_9;  // select
wire eq_state_select_9_out;  // select
wire eq_state_select_10;  // select
wire eq_state_select_10_out;  // select
wire eq_state_select_11;  // select
wire eq_state_select_11_out;  // select
wire eq_state_select_12;  // select
wire eq_state_select_12_out;  // select
wire eq_state_select_13;  // select
wire eq_state_select_13_out;  // select
wire eq_state_select_14;  // select
wire eq_state_select_14_out;  // select
wire eq_state_select_15;  // select
wire eq_state_select_15_out;  // select
wire eq_state_select_16;  // select
wire eq_state_select_16_out;  // select
wire eq_state_select_17;  // select
wire eq_state_select_17_out;  // select
wire eq_state_select_18;  // select
wire eq_state_select_18_out;  // select
wire eq_state_select_19;  // select
wire eq_state_select_19_out;  // select
wire eq_state_select_20;  // select
wire eq_state_select_20_out;  // select
wire eq_state_select_21;  // select
wire eq_state_select_21_out;  // select
wire eq_state_select_22;  // select
wire eq_state_select_22_out;  // select
wire eq_state_select_23;  // select
wire eq_state_select_23_out;  // select
wire eq_state_select_24;  // select
wire eq_state_select_24_out;  // select
wire eq_state_select_25;  // select
wire eq_state_select_25_out;  // select
wire eq_state_select_26;  // select
wire eq_state_select_26_out;  // select
wire eq_state_select_27;  // select
wire eq_state_select_27_out;  // select
wire eq_state_select_28;  // select
wire eq_state_select_28_out;  // select
wire eq_state_select_29;  // select
wire eq_state_select_29_out;  // select
wire eq_state_select_30;  // select
wire eq_state_select_30_out;  // select
wire eq_state_select_31;  // select
wire eq_state_select_31_out;  // select
wire eq_state_select_32;  // select
wire eq_state_select_32_out;  // select
wire eq_state_select_33;  // select
wire eq_state_select_33_out;  // select
wire eq_state_select_34;  // select
wire eq_state_select_34_out;  // select
wire eq_state_select_35;  // select
wire eq_state_select_35_out;  // select
wire eq_tail_select_pulse_0;  // select
wire eq_tail_select_pulse_0_out;  // select
wire eq_tail_select_pulse_1;  // select
wire eq_tail_select_pulse_1_out;  // select
wire eq_tail_select_pulse_2;  // select
wire eq_tail_select_pulse_2_out;  // select
wire eq_tail_select_pulse_3;  // select
wire eq_tail_select_pulse_3_out;  // select
wire eq_tail_select_pulse_4;  // select
wire eq_tail_select_pulse_4_out;  // select
wire eq_tail_select_pulse_5;  // select
wire eq_tail_select_pulse_5_out;  // select
wire eq_tail_select_pulse_6;  // select
wire eq_tail_select_pulse_6_out;  // select
wire eq_tail_select_pulse_7;  // select
wire eq_tail_select_pulse_7_out;  // select
wire eq_tail_select_pulse_8;  // select
wire eq_tail_select_pulse_8_out;  // select
wire eq_tail_select_pulse_9;  // select
wire eq_tail_select_pulse_9_out;  // select
wire eq_tail_select_pulse_10;  // select
wire eq_tail_select_pulse_10_out;  // select
wire eq_tail_select_pulse_11;  // select
wire eq_tail_select_pulse_11_out;  // select
wire eq_tail_select_pulse_12;  // select
wire eq_tail_select_pulse_12_out;  // select
wire eq_tail_select_pulse_13;  // select
wire eq_tail_select_pulse_13_out;  // select
wire eq_tail_select_pulse_14;  // select
wire eq_tail_select_pulse_14_out;  // select
wire eq_tail_select_pulse_15;  // select
wire eq_tail_select_pulse_15_out;  // select
wire eq_tail_select_pulse_16;  // select
wire eq_tail_select_pulse_16_out;  // select
wire eq_tail_select_pulse_17;  // select
wire eq_tail_select_pulse_17_out;  // select
wire eq_tail_select_pulse_18;  // select
wire eq_tail_select_pulse_18_out;  // select
wire eq_tail_select_pulse_19;  // select
wire eq_tail_select_pulse_19_out;  // select
wire eq_tail_select_pulse_20;  // select
wire eq_tail_select_pulse_20_out;  // select
wire eq_tail_select_pulse_21;  // select
wire eq_tail_select_pulse_21_out;  // select
wire eq_tail_select_pulse_22;  // select
wire eq_tail_select_pulse_22_out;  // select
wire eq_tail_select_pulse_23;  // select
wire eq_tail_select_pulse_23_out;  // select
wire eq_tail_select_pulse_24;  // select
wire eq_tail_select_pulse_24_out;  // select
wire eq_tail_select_pulse_25;  // select
wire eq_tail_select_pulse_25_out;  // select
wire eq_tail_select_pulse_26;  // select
wire eq_tail_select_pulse_26_out;  // select
wire eq_tail_select_pulse_27;  // select
wire eq_tail_select_pulse_27_out;  // select
wire eq_tail_select_pulse_28;  // select
wire eq_tail_select_pulse_28_out;  // select
wire eq_tail_select_pulse_29;  // select
wire eq_tail_select_pulse_29_out;  // select
wire eq_tail_select_pulse_30;  // select
wire eq_tail_select_pulse_30_out;  // select
wire eq_tail_select_pulse_31;  // select
wire eq_tail_select_pulse_31_out;  // select
wire eq_tail_select_pulse_32;  // select
wire eq_tail_select_pulse_32_out;  // select
wire eq_tail_select_pulse_33;  // select
wire eq_tail_select_pulse_33_out;  // select
wire eq_tail_select_pulse_34;  // select
wire eq_tail_select_pulse_34_out;  // select
wire eq_tail_select_pulse_35;  // select
wire eq_tail_select_pulse_35_out;  // select
wire eq_head_select_pulse_0;  // select
wire eq_head_select_pulse_0_out;  // select
wire eq_head_select_pulse_1;  // select
wire eq_head_select_pulse_1_out;  // select
wire eq_head_select_pulse_2;  // select
wire eq_head_select_pulse_2_out;  // select
wire eq_head_select_pulse_3;  // select
wire eq_head_select_pulse_3_out;  // select
wire eq_head_select_pulse_4;  // select
wire eq_head_select_pulse_4_out;  // select
wire eq_head_select_pulse_5;  // select
wire eq_head_select_pulse_5_out;  // select
wire eq_head_select_pulse_6;  // select
wire eq_head_select_pulse_6_out;  // select
wire eq_head_select_pulse_7;  // select
wire eq_head_select_pulse_7_out;  // select
wire eq_head_select_pulse_8;  // select
wire eq_head_select_pulse_8_out;  // select
wire eq_head_select_pulse_9;  // select
wire eq_head_select_pulse_9_out;  // select
wire eq_head_select_pulse_10;  // select
wire eq_head_select_pulse_10_out;  // select
wire eq_head_select_pulse_11;  // select
wire eq_head_select_pulse_11_out;  // select
wire eq_head_select_pulse_12;  // select
wire eq_head_select_pulse_12_out;  // select
wire eq_head_select_pulse_13;  // select
wire eq_head_select_pulse_13_out;  // select
wire eq_head_select_pulse_14;  // select
wire eq_head_select_pulse_14_out;  // select
wire eq_head_select_pulse_15;  // select
wire eq_head_select_pulse_15_out;  // select
wire eq_head_select_pulse_16;  // select
wire eq_head_select_pulse_16_out;  // select
wire eq_head_select_pulse_17;  // select
wire eq_head_select_pulse_17_out;  // select
wire eq_head_select_pulse_18;  // select
wire eq_head_select_pulse_18_out;  // select
wire eq_head_select_pulse_19;  // select
wire eq_head_select_pulse_19_out;  // select
wire eq_head_select_pulse_20;  // select
wire eq_head_select_pulse_20_out;  // select
wire eq_head_select_pulse_21;  // select
wire eq_head_select_pulse_21_out;  // select
wire eq_head_select_pulse_22;  // select
wire eq_head_select_pulse_22_out;  // select
wire eq_head_select_pulse_23;  // select
wire eq_head_select_pulse_23_out;  // select
wire eq_head_select_pulse_24;  // select
wire eq_head_select_pulse_24_out;  // select
wire eq_head_select_pulse_25;  // select
wire eq_head_select_pulse_25_out;  // select
wire eq_head_select_pulse_26;  // select
wire eq_head_select_pulse_26_out;  // select
wire eq_head_select_pulse_27;  // select
wire eq_head_select_pulse_27_out;  // select
wire eq_head_select_pulse_28;  // select
wire eq_head_select_pulse_28_out;  // select
wire eq_head_select_pulse_29;  // select
wire eq_head_select_pulse_29_out;  // select
wire eq_head_select_pulse_30;  // select
wire eq_head_select_pulse_30_out;  // select
wire eq_head_select_pulse_31;  // select
wire eq_head_select_pulse_31_out;  // select
wire eq_head_select_pulse_32;  // select
wire eq_head_select_pulse_32_out;  // select
wire eq_head_select_pulse_33;  // select
wire eq_head_select_pulse_33_out;  // select
wire eq_head_select_pulse_34;  // select
wire eq_head_select_pulse_34_out;  // select
wire eq_head_select_pulse_35;  // select
wire eq_head_select_pulse_35_out;  // select
wire daemon_csrbus_wr_in;  // csrbus_wr
wire daemon_csrbus_wr_out;  // csrbus_wr
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_out;  // SW write data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data
wire rst_l;  // HW reset
wire rst_l_out;  // HW reset


//====================================================
//     Assignments only
//====================================================
assign eq_base_address_select_pulse_out = eq_base_address_select_pulse;
assign eq_ctrl_set_select_0_out = eq_ctrl_set_select_0;
assign eq_ctrl_set_select_1_out = eq_ctrl_set_select_1;
assign eq_ctrl_set_select_2_out = eq_ctrl_set_select_2;
assign eq_ctrl_set_select_3_out = eq_ctrl_set_select_3;
assign eq_ctrl_set_select_4_out = eq_ctrl_set_select_4;
assign eq_ctrl_set_select_5_out = eq_ctrl_set_select_5;
assign eq_ctrl_set_select_6_out = eq_ctrl_set_select_6;
assign eq_ctrl_set_select_7_out = eq_ctrl_set_select_7;
assign eq_ctrl_set_select_8_out = eq_ctrl_set_select_8;
assign eq_ctrl_set_select_9_out = eq_ctrl_set_select_9;
assign eq_ctrl_set_select_10_out = eq_ctrl_set_select_10;
assign eq_ctrl_set_select_11_out = eq_ctrl_set_select_11;
assign eq_ctrl_set_select_12_out = eq_ctrl_set_select_12;
assign eq_ctrl_set_select_13_out = eq_ctrl_set_select_13;
assign eq_ctrl_set_select_14_out = eq_ctrl_set_select_14;
assign eq_ctrl_set_select_15_out = eq_ctrl_set_select_15;
assign eq_ctrl_set_select_16_out = eq_ctrl_set_select_16;
assign eq_ctrl_set_select_17_out = eq_ctrl_set_select_17;
assign eq_ctrl_set_select_18_out = eq_ctrl_set_select_18;
assign eq_ctrl_set_select_19_out = eq_ctrl_set_select_19;
assign eq_ctrl_set_select_20_out = eq_ctrl_set_select_20;
assign eq_ctrl_set_select_21_out = eq_ctrl_set_select_21;
assign eq_ctrl_set_select_22_out = eq_ctrl_set_select_22;
assign eq_ctrl_set_select_23_out = eq_ctrl_set_select_23;
assign eq_ctrl_set_select_24_out = eq_ctrl_set_select_24;
assign eq_ctrl_set_select_25_out = eq_ctrl_set_select_25;
assign eq_ctrl_set_select_26_out = eq_ctrl_set_select_26;
assign eq_ctrl_set_select_27_out = eq_ctrl_set_select_27;
assign eq_ctrl_set_select_28_out = eq_ctrl_set_select_28;
assign eq_ctrl_set_select_29_out = eq_ctrl_set_select_29;
assign eq_ctrl_set_select_30_out = eq_ctrl_set_select_30;
assign eq_ctrl_set_select_31_out = eq_ctrl_set_select_31;
assign eq_ctrl_set_select_32_out = eq_ctrl_set_select_32;
assign eq_ctrl_set_select_33_out = eq_ctrl_set_select_33;
assign eq_ctrl_set_select_34_out = eq_ctrl_set_select_34;
assign eq_ctrl_set_select_35_out = eq_ctrl_set_select_35;
assign eq_ctrl_clr_select_0_out = eq_ctrl_clr_select_0;
assign eq_ctrl_clr_select_1_out = eq_ctrl_clr_select_1;
assign eq_ctrl_clr_select_2_out = eq_ctrl_clr_select_2;
assign eq_ctrl_clr_select_3_out = eq_ctrl_clr_select_3;
assign eq_ctrl_clr_select_4_out = eq_ctrl_clr_select_4;
assign eq_ctrl_clr_select_5_out = eq_ctrl_clr_select_5;
assign eq_ctrl_clr_select_6_out = eq_ctrl_clr_select_6;
assign eq_ctrl_clr_select_7_out = eq_ctrl_clr_select_7;
assign eq_ctrl_clr_select_8_out = eq_ctrl_clr_select_8;
assign eq_ctrl_clr_select_9_out = eq_ctrl_clr_select_9;
assign eq_ctrl_clr_select_10_out = eq_ctrl_clr_select_10;
assign eq_ctrl_clr_select_11_out = eq_ctrl_clr_select_11;
assign eq_ctrl_clr_select_12_out = eq_ctrl_clr_select_12;
assign eq_ctrl_clr_select_13_out = eq_ctrl_clr_select_13;
assign eq_ctrl_clr_select_14_out = eq_ctrl_clr_select_14;
assign eq_ctrl_clr_select_15_out = eq_ctrl_clr_select_15;
assign eq_ctrl_clr_select_16_out = eq_ctrl_clr_select_16;
assign eq_ctrl_clr_select_17_out = eq_ctrl_clr_select_17;
assign eq_ctrl_clr_select_18_out = eq_ctrl_clr_select_18;
assign eq_ctrl_clr_select_19_out = eq_ctrl_clr_select_19;
assign eq_ctrl_clr_select_20_out = eq_ctrl_clr_select_20;
assign eq_ctrl_clr_select_21_out = eq_ctrl_clr_select_21;
assign eq_ctrl_clr_select_22_out = eq_ctrl_clr_select_22;
assign eq_ctrl_clr_select_23_out = eq_ctrl_clr_select_23;
assign eq_ctrl_clr_select_24_out = eq_ctrl_clr_select_24;
assign eq_ctrl_clr_select_25_out = eq_ctrl_clr_select_25;
assign eq_ctrl_clr_select_26_out = eq_ctrl_clr_select_26;
assign eq_ctrl_clr_select_27_out = eq_ctrl_clr_select_27;
assign eq_ctrl_clr_select_28_out = eq_ctrl_clr_select_28;
assign eq_ctrl_clr_select_29_out = eq_ctrl_clr_select_29;
assign eq_ctrl_clr_select_30_out = eq_ctrl_clr_select_30;
assign eq_ctrl_clr_select_31_out = eq_ctrl_clr_select_31;
assign eq_ctrl_clr_select_32_out = eq_ctrl_clr_select_32;
assign eq_ctrl_clr_select_33_out = eq_ctrl_clr_select_33;
assign eq_ctrl_clr_select_34_out = eq_ctrl_clr_select_34;
assign eq_ctrl_clr_select_35_out = eq_ctrl_clr_select_35;
assign eq_state_select_0_out = eq_state_select_0;
assign eq_state_select_1_out = eq_state_select_1;
assign eq_state_select_2_out = eq_state_select_2;
assign eq_state_select_3_out = eq_state_select_3;
assign eq_state_select_4_out = eq_state_select_4;
assign eq_state_select_5_out = eq_state_select_5;
assign eq_state_select_6_out = eq_state_select_6;
assign eq_state_select_7_out = eq_state_select_7;
assign eq_state_select_8_out = eq_state_select_8;
assign eq_state_select_9_out = eq_state_select_9;
assign eq_state_select_10_out = eq_state_select_10;
assign eq_state_select_11_out = eq_state_select_11;
assign eq_state_select_12_out = eq_state_select_12;
assign eq_state_select_13_out = eq_state_select_13;
assign eq_state_select_14_out = eq_state_select_14;
assign eq_state_select_15_out = eq_state_select_15;
assign eq_state_select_16_out = eq_state_select_16;
assign eq_state_select_17_out = eq_state_select_17;
assign eq_state_select_18_out = eq_state_select_18;
assign eq_state_select_19_out = eq_state_select_19;
assign eq_state_select_20_out = eq_state_select_20;
assign eq_state_select_21_out = eq_state_select_21;
assign eq_state_select_22_out = eq_state_select_22;
assign eq_state_select_23_out = eq_state_select_23;
assign eq_state_select_24_out = eq_state_select_24;
assign eq_state_select_25_out = eq_state_select_25;
assign eq_state_select_26_out = eq_state_select_26;
assign eq_state_select_27_out = eq_state_select_27;
assign eq_state_select_28_out = eq_state_select_28;
assign eq_state_select_29_out = eq_state_select_29;
assign eq_state_select_30_out = eq_state_select_30;
assign eq_state_select_31_out = eq_state_select_31;
assign eq_state_select_32_out = eq_state_select_32;
assign eq_state_select_33_out = eq_state_select_33;
assign eq_state_select_34_out = eq_state_select_34;
assign eq_state_select_35_out = eq_state_select_35;
assign eq_tail_select_pulse_0_out = eq_tail_select_pulse_0;
assign eq_tail_select_pulse_1_out = eq_tail_select_pulse_1;
assign eq_tail_select_pulse_2_out = eq_tail_select_pulse_2;
assign eq_tail_select_pulse_3_out = eq_tail_select_pulse_3;
assign eq_tail_select_pulse_4_out = eq_tail_select_pulse_4;
assign eq_tail_select_pulse_5_out = eq_tail_select_pulse_5;
assign eq_tail_select_pulse_6_out = eq_tail_select_pulse_6;
assign eq_tail_select_pulse_7_out = eq_tail_select_pulse_7;
assign eq_tail_select_pulse_8_out = eq_tail_select_pulse_8;
assign eq_tail_select_pulse_9_out = eq_tail_select_pulse_9;
assign eq_tail_select_pulse_10_out = eq_tail_select_pulse_10;
assign eq_tail_select_pulse_11_out = eq_tail_select_pulse_11;
assign eq_tail_select_pulse_12_out = eq_tail_select_pulse_12;
assign eq_tail_select_pulse_13_out = eq_tail_select_pulse_13;
assign eq_tail_select_pulse_14_out = eq_tail_select_pulse_14;
assign eq_tail_select_pulse_15_out = eq_tail_select_pulse_15;
assign eq_tail_select_pulse_16_out = eq_tail_select_pulse_16;
assign eq_tail_select_pulse_17_out = eq_tail_select_pulse_17;
assign eq_tail_select_pulse_18_out = eq_tail_select_pulse_18;
assign eq_tail_select_pulse_19_out = eq_tail_select_pulse_19;
assign eq_tail_select_pulse_20_out = eq_tail_select_pulse_20;
assign eq_tail_select_pulse_21_out = eq_tail_select_pulse_21;
assign eq_tail_select_pulse_22_out = eq_tail_select_pulse_22;
assign eq_tail_select_pulse_23_out = eq_tail_select_pulse_23;
assign eq_tail_select_pulse_24_out = eq_tail_select_pulse_24;
assign eq_tail_select_pulse_25_out = eq_tail_select_pulse_25;
assign eq_tail_select_pulse_26_out = eq_tail_select_pulse_26;
assign eq_tail_select_pulse_27_out = eq_tail_select_pulse_27;
assign eq_tail_select_pulse_28_out = eq_tail_select_pulse_28;
assign eq_tail_select_pulse_29_out = eq_tail_select_pulse_29;
assign eq_tail_select_pulse_30_out = eq_tail_select_pulse_30;
assign eq_tail_select_pulse_31_out = eq_tail_select_pulse_31;
assign eq_tail_select_pulse_32_out = eq_tail_select_pulse_32;
assign eq_tail_select_pulse_33_out = eq_tail_select_pulse_33;
assign eq_tail_select_pulse_34_out = eq_tail_select_pulse_34;
assign eq_tail_select_pulse_35_out = eq_tail_select_pulse_35;
assign eq_head_select_pulse_0_out = eq_head_select_pulse_0;
assign eq_head_select_pulse_1_out = eq_head_select_pulse_1;
assign eq_head_select_pulse_2_out = eq_head_select_pulse_2;
assign eq_head_select_pulse_3_out = eq_head_select_pulse_3;
assign eq_head_select_pulse_4_out = eq_head_select_pulse_4;
assign eq_head_select_pulse_5_out = eq_head_select_pulse_5;
assign eq_head_select_pulse_6_out = eq_head_select_pulse_6;
assign eq_head_select_pulse_7_out = eq_head_select_pulse_7;
assign eq_head_select_pulse_8_out = eq_head_select_pulse_8;
assign eq_head_select_pulse_9_out = eq_head_select_pulse_9;
assign eq_head_select_pulse_10_out = eq_head_select_pulse_10;
assign eq_head_select_pulse_11_out = eq_head_select_pulse_11;
assign eq_head_select_pulse_12_out = eq_head_select_pulse_12;
assign eq_head_select_pulse_13_out = eq_head_select_pulse_13;
assign eq_head_select_pulse_14_out = eq_head_select_pulse_14;
assign eq_head_select_pulse_15_out = eq_head_select_pulse_15;
assign eq_head_select_pulse_16_out = eq_head_select_pulse_16;
assign eq_head_select_pulse_17_out = eq_head_select_pulse_17;
assign eq_head_select_pulse_18_out = eq_head_select_pulse_18;
assign eq_head_select_pulse_19_out = eq_head_select_pulse_19;
assign eq_head_select_pulse_20_out = eq_head_select_pulse_20;
assign eq_head_select_pulse_21_out = eq_head_select_pulse_21;
assign eq_head_select_pulse_22_out = eq_head_select_pulse_22;
assign eq_head_select_pulse_23_out = eq_head_select_pulse_23;
assign eq_head_select_pulse_24_out = eq_head_select_pulse_24;
assign eq_head_select_pulse_25_out = eq_head_select_pulse_25;
assign eq_head_select_pulse_26_out = eq_head_select_pulse_26;
assign eq_head_select_pulse_27_out = eq_head_select_pulse_27;
assign eq_head_select_pulse_28_out = eq_head_select_pulse_28;
assign eq_head_select_pulse_29_out = eq_head_select_pulse_29;
assign eq_head_select_pulse_30_out = eq_head_select_pulse_30;
assign eq_head_select_pulse_31_out = eq_head_select_pulse_31;
assign eq_head_select_pulse_32_out = eq_head_select_pulse_32;
assign eq_head_select_pulse_33_out = eq_head_select_pulse_33;
assign eq_head_select_pulse_34_out = eq_head_select_pulse_34;
assign eq_head_select_pulse_35_out = eq_head_select_pulse_35;
assign rst_l_out = rst_l;
assign daemon_csrbus_wr_out      = daemon_csrbus_wr_in;
assign daemon_csrbus_wr_data_out = daemon_csrbus_wr_data_in;


//=====================================================
//      OUTPUT: read_data_out
//=====================================================
dmu_imu_eqs_csrpipe_5 dmu_imu_eqs_csrpipe_5_inst_1
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.reg_in	(1'b0),
	.reg_out	(1'b0),
	.data0	(read_data_0),
	.sel0	(1'b1),
	.data1	(64'b0),
	.sel1	(1'b1),
	.data2	(64'b0),
	.sel2	(1'b1),
	.data3	(64'b0),
	.sel3	(1'b1),
	.data4	(64'b0),
	.sel4	(1'b1),
	.out	(read_data_0_out)
	);

endmodule // dmu_imu_eqs_stage_mux_only
