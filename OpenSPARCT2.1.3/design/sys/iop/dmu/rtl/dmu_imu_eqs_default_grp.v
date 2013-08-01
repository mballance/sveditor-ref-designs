// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_eqs_default_grp.v
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
module dmu_imu_eqs_default_grp 
	(
	clk,
	eq_base_address_address_hw_read,
	eq_base_address_select_pulse,
	eq_ctrl_set_ext_select_0,
	eq_ctrl_set_ext_select_1,
	eq_ctrl_set_ext_select_2,
	eq_ctrl_set_ext_select_3,
	eq_ctrl_set_ext_select_4,
	eq_ctrl_set_ext_select_5,
	eq_ctrl_set_ext_select_6,
	eq_ctrl_set_ext_select_7,
	eq_ctrl_set_ext_select_8,
	eq_ctrl_set_ext_select_9,
	eq_ctrl_set_ext_select_10,
	eq_ctrl_set_ext_select_11,
	eq_ctrl_set_ext_select_12,
	eq_ctrl_set_ext_select_13,
	eq_ctrl_set_ext_select_14,
	eq_ctrl_set_ext_select_15,
	eq_ctrl_set_ext_select_16,
	eq_ctrl_set_ext_select_17,
	eq_ctrl_set_ext_select_18,
	eq_ctrl_set_ext_select_19,
	eq_ctrl_set_ext_select_20,
	eq_ctrl_set_ext_select_21,
	eq_ctrl_set_ext_select_22,
	eq_ctrl_set_ext_select_23,
	eq_ctrl_set_ext_select_24,
	eq_ctrl_set_ext_select_25,
	eq_ctrl_set_ext_select_26,
	eq_ctrl_set_ext_select_27,
	eq_ctrl_set_ext_select_28,
	eq_ctrl_set_ext_select_29,
	eq_ctrl_set_ext_select_30,
	eq_ctrl_set_ext_select_31,
	eq_ctrl_set_ext_select_32,
	eq_ctrl_set_ext_select_33,
	eq_ctrl_set_ext_select_34,
	eq_ctrl_set_ext_select_35,
	eq_ctrl_set_select_0,
	eq_ctrl_set_select_1,
	eq_ctrl_set_select_2,
	eq_ctrl_set_select_3,
	eq_ctrl_set_select_4,
	eq_ctrl_set_select_5,
	eq_ctrl_set_select_6,
	eq_ctrl_set_select_7,
	eq_ctrl_set_select_8,
	eq_ctrl_set_select_9,
	eq_ctrl_set_select_10,
	eq_ctrl_set_select_11,
	eq_ctrl_set_select_12,
	eq_ctrl_set_select_13,
	eq_ctrl_set_select_14,
	eq_ctrl_set_select_15,
	eq_ctrl_set_select_16,
	eq_ctrl_set_select_17,
	eq_ctrl_set_select_18,
	eq_ctrl_set_select_19,
	eq_ctrl_set_select_20,
	eq_ctrl_set_select_21,
	eq_ctrl_set_select_22,
	eq_ctrl_set_select_23,
	eq_ctrl_set_select_24,
	eq_ctrl_set_select_25,
	eq_ctrl_set_select_26,
	eq_ctrl_set_select_27,
	eq_ctrl_set_select_28,
	eq_ctrl_set_select_29,
	eq_ctrl_set_select_30,
	eq_ctrl_set_select_31,
	eq_ctrl_set_select_32,
	eq_ctrl_set_select_33,
	eq_ctrl_set_select_34,
	eq_ctrl_set_select_35,
	eq_ctrl_set_enoverr_ext_wr_data,
	eq_ctrl_set_en_ext_wr_data,
	eq_ctrl_clr_ext_select_0,
	eq_ctrl_clr_ext_select_1,
	eq_ctrl_clr_ext_select_2,
	eq_ctrl_clr_ext_select_3,
	eq_ctrl_clr_ext_select_4,
	eq_ctrl_clr_ext_select_5,
	eq_ctrl_clr_ext_select_6,
	eq_ctrl_clr_ext_select_7,
	eq_ctrl_clr_ext_select_8,
	eq_ctrl_clr_ext_select_9,
	eq_ctrl_clr_ext_select_10,
	eq_ctrl_clr_ext_select_11,
	eq_ctrl_clr_ext_select_12,
	eq_ctrl_clr_ext_select_13,
	eq_ctrl_clr_ext_select_14,
	eq_ctrl_clr_ext_select_15,
	eq_ctrl_clr_ext_select_16,
	eq_ctrl_clr_ext_select_17,
	eq_ctrl_clr_ext_select_18,
	eq_ctrl_clr_ext_select_19,
	eq_ctrl_clr_ext_select_20,
	eq_ctrl_clr_ext_select_21,
	eq_ctrl_clr_ext_select_22,
	eq_ctrl_clr_ext_select_23,
	eq_ctrl_clr_ext_select_24,
	eq_ctrl_clr_ext_select_25,
	eq_ctrl_clr_ext_select_26,
	eq_ctrl_clr_ext_select_27,
	eq_ctrl_clr_ext_select_28,
	eq_ctrl_clr_ext_select_29,
	eq_ctrl_clr_ext_select_30,
	eq_ctrl_clr_ext_select_31,
	eq_ctrl_clr_ext_select_32,
	eq_ctrl_clr_ext_select_33,
	eq_ctrl_clr_ext_select_34,
	eq_ctrl_clr_ext_select_35,
	eq_ctrl_clr_select_0,
	eq_ctrl_clr_select_1,
	eq_ctrl_clr_select_2,
	eq_ctrl_clr_select_3,
	eq_ctrl_clr_select_4,
	eq_ctrl_clr_select_5,
	eq_ctrl_clr_select_6,
	eq_ctrl_clr_select_7,
	eq_ctrl_clr_select_8,
	eq_ctrl_clr_select_9,
	eq_ctrl_clr_select_10,
	eq_ctrl_clr_select_11,
	eq_ctrl_clr_select_12,
	eq_ctrl_clr_select_13,
	eq_ctrl_clr_select_14,
	eq_ctrl_clr_select_15,
	eq_ctrl_clr_select_16,
	eq_ctrl_clr_select_17,
	eq_ctrl_clr_select_18,
	eq_ctrl_clr_select_19,
	eq_ctrl_clr_select_20,
	eq_ctrl_clr_select_21,
	eq_ctrl_clr_select_22,
	eq_ctrl_clr_select_23,
	eq_ctrl_clr_select_24,
	eq_ctrl_clr_select_25,
	eq_ctrl_clr_select_26,
	eq_ctrl_clr_select_27,
	eq_ctrl_clr_select_28,
	eq_ctrl_clr_select_29,
	eq_ctrl_clr_select_30,
	eq_ctrl_clr_select_31,
	eq_ctrl_clr_select_32,
	eq_ctrl_clr_select_33,
	eq_ctrl_clr_select_34,
	eq_ctrl_clr_select_35,
	eq_ctrl_clr_coverr_ext_wr_data,
	eq_ctrl_clr_e2i_ext_wr_data,
	eq_ctrl_clr_dis_ext_wr_data,
	eq_state_select_0,
	eq_state_select_1,
	eq_state_select_2,
	eq_state_select_3,
	eq_state_select_4,
	eq_state_select_5,
	eq_state_select_6,
	eq_state_select_7,
	eq_state_select_8,
	eq_state_select_9,
	eq_state_select_10,
	eq_state_select_11,
	eq_state_select_12,
	eq_state_select_13,
	eq_state_select_14,
	eq_state_select_15,
	eq_state_select_16,
	eq_state_select_17,
	eq_state_select_18,
	eq_state_select_19,
	eq_state_select_20,
	eq_state_select_21,
	eq_state_select_22,
	eq_state_select_23,
	eq_state_select_24,
	eq_state_select_25,
	eq_state_select_26,
	eq_state_select_27,
	eq_state_select_28,
	eq_state_select_29,
	eq_state_select_30,
	eq_state_select_31,
	eq_state_select_32,
	eq_state_select_33,
	eq_state_select_34,
	eq_state_select_35,
	eq_state_ext_read_data_0,
	eq_state_ext_read_data_1,
	eq_state_ext_read_data_2,
	eq_state_ext_read_data_3,
	eq_state_ext_read_data_4,
	eq_state_ext_read_data_5,
	eq_state_ext_read_data_6,
	eq_state_ext_read_data_7,
	eq_state_ext_read_data_8,
	eq_state_ext_read_data_9,
	eq_state_ext_read_data_10,
	eq_state_ext_read_data_11,
	eq_state_ext_read_data_12,
	eq_state_ext_read_data_13,
	eq_state_ext_read_data_14,
	eq_state_ext_read_data_15,
	eq_state_ext_read_data_16,
	eq_state_ext_read_data_17,
	eq_state_ext_read_data_18,
	eq_state_ext_read_data_19,
	eq_state_ext_read_data_20,
	eq_state_ext_read_data_21,
	eq_state_ext_read_data_22,
	eq_state_ext_read_data_23,
	eq_state_ext_read_data_24,
	eq_state_ext_read_data_25,
	eq_state_ext_read_data_26,
	eq_state_ext_read_data_27,
	eq_state_ext_read_data_28,
	eq_state_ext_read_data_29,
	eq_state_ext_read_data_30,
	eq_state_ext_read_data_31,
	eq_state_ext_read_data_32,
	eq_state_ext_read_data_33,
	eq_state_ext_read_data_34,
	eq_state_ext_read_data_35,
	eq_tail_overr_hw_ld_0,
	eq_tail_overr_hw_write_0,
	eq_tail_tail_hw_ld_0,
	eq_tail_tail_hw_write_0,
	eq_tail_tail_hw_read_0,
	eq_tail_overr_hw_ld_1,
	eq_tail_overr_hw_write_1,
	eq_tail_tail_hw_ld_1,
	eq_tail_tail_hw_write_1,
	eq_tail_tail_hw_read_1,
	eq_tail_overr_hw_ld_2,
	eq_tail_overr_hw_write_2,
	eq_tail_tail_hw_ld_2,
	eq_tail_tail_hw_write_2,
	eq_tail_tail_hw_read_2,
	eq_tail_overr_hw_ld_3,
	eq_tail_overr_hw_write_3,
	eq_tail_tail_hw_ld_3,
	eq_tail_tail_hw_write_3,
	eq_tail_tail_hw_read_3,
	eq_tail_overr_hw_ld_4,
	eq_tail_overr_hw_write_4,
	eq_tail_tail_hw_ld_4,
	eq_tail_tail_hw_write_4,
	eq_tail_tail_hw_read_4,
	eq_tail_overr_hw_ld_5,
	eq_tail_overr_hw_write_5,
	eq_tail_tail_hw_ld_5,
	eq_tail_tail_hw_write_5,
	eq_tail_tail_hw_read_5,
	eq_tail_overr_hw_ld_6,
	eq_tail_overr_hw_write_6,
	eq_tail_tail_hw_ld_6,
	eq_tail_tail_hw_write_6,
	eq_tail_tail_hw_read_6,
	eq_tail_overr_hw_ld_7,
	eq_tail_overr_hw_write_7,
	eq_tail_tail_hw_ld_7,
	eq_tail_tail_hw_write_7,
	eq_tail_tail_hw_read_7,
	eq_tail_overr_hw_ld_8,
	eq_tail_overr_hw_write_8,
	eq_tail_tail_hw_ld_8,
	eq_tail_tail_hw_write_8,
	eq_tail_tail_hw_read_8,
	eq_tail_overr_hw_ld_9,
	eq_tail_overr_hw_write_9,
	eq_tail_tail_hw_ld_9,
	eq_tail_tail_hw_write_9,
	eq_tail_tail_hw_read_9,
	eq_tail_overr_hw_ld_10,
	eq_tail_overr_hw_write_10,
	eq_tail_tail_hw_ld_10,
	eq_tail_tail_hw_write_10,
	eq_tail_tail_hw_read_10,
	eq_tail_overr_hw_ld_11,
	eq_tail_overr_hw_write_11,
	eq_tail_tail_hw_ld_11,
	eq_tail_tail_hw_write_11,
	eq_tail_tail_hw_read_11,
	eq_tail_overr_hw_ld_12,
	eq_tail_overr_hw_write_12,
	eq_tail_tail_hw_ld_12,
	eq_tail_tail_hw_write_12,
	eq_tail_tail_hw_read_12,
	eq_tail_overr_hw_ld_13,
	eq_tail_overr_hw_write_13,
	eq_tail_tail_hw_ld_13,
	eq_tail_tail_hw_write_13,
	eq_tail_tail_hw_read_13,
	eq_tail_overr_hw_ld_14,
	eq_tail_overr_hw_write_14,
	eq_tail_tail_hw_ld_14,
	eq_tail_tail_hw_write_14,
	eq_tail_tail_hw_read_14,
	eq_tail_overr_hw_ld_15,
	eq_tail_overr_hw_write_15,
	eq_tail_tail_hw_ld_15,
	eq_tail_tail_hw_write_15,
	eq_tail_tail_hw_read_15,
	eq_tail_overr_hw_ld_16,
	eq_tail_overr_hw_write_16,
	eq_tail_tail_hw_ld_16,
	eq_tail_tail_hw_write_16,
	eq_tail_tail_hw_read_16,
	eq_tail_overr_hw_ld_17,
	eq_tail_overr_hw_write_17,
	eq_tail_tail_hw_ld_17,
	eq_tail_tail_hw_write_17,
	eq_tail_tail_hw_read_17,
	eq_tail_overr_hw_ld_18,
	eq_tail_overr_hw_write_18,
	eq_tail_tail_hw_ld_18,
	eq_tail_tail_hw_write_18,
	eq_tail_tail_hw_read_18,
	eq_tail_overr_hw_ld_19,
	eq_tail_overr_hw_write_19,
	eq_tail_tail_hw_ld_19,
	eq_tail_tail_hw_write_19,
	eq_tail_tail_hw_read_19,
	eq_tail_overr_hw_ld_20,
	eq_tail_overr_hw_write_20,
	eq_tail_tail_hw_ld_20,
	eq_tail_tail_hw_write_20,
	eq_tail_tail_hw_read_20,
	eq_tail_overr_hw_ld_21,
	eq_tail_overr_hw_write_21,
	eq_tail_tail_hw_ld_21,
	eq_tail_tail_hw_write_21,
	eq_tail_tail_hw_read_21,
	eq_tail_overr_hw_ld_22,
	eq_tail_overr_hw_write_22,
	eq_tail_tail_hw_ld_22,
	eq_tail_tail_hw_write_22,
	eq_tail_tail_hw_read_22,
	eq_tail_overr_hw_ld_23,
	eq_tail_overr_hw_write_23,
	eq_tail_tail_hw_ld_23,
	eq_tail_tail_hw_write_23,
	eq_tail_tail_hw_read_23,
	eq_tail_overr_hw_ld_24,
	eq_tail_overr_hw_write_24,
	eq_tail_tail_hw_ld_24,
	eq_tail_tail_hw_write_24,
	eq_tail_tail_hw_read_24,
	eq_tail_overr_hw_ld_25,
	eq_tail_overr_hw_write_25,
	eq_tail_tail_hw_ld_25,
	eq_tail_tail_hw_write_25,
	eq_tail_tail_hw_read_25,
	eq_tail_overr_hw_ld_26,
	eq_tail_overr_hw_write_26,
	eq_tail_tail_hw_ld_26,
	eq_tail_tail_hw_write_26,
	eq_tail_tail_hw_read_26,
	eq_tail_overr_hw_ld_27,
	eq_tail_overr_hw_write_27,
	eq_tail_tail_hw_ld_27,
	eq_tail_tail_hw_write_27,
	eq_tail_tail_hw_read_27,
	eq_tail_overr_hw_ld_28,
	eq_tail_overr_hw_write_28,
	eq_tail_tail_hw_ld_28,
	eq_tail_tail_hw_write_28,
	eq_tail_tail_hw_read_28,
	eq_tail_overr_hw_ld_29,
	eq_tail_overr_hw_write_29,
	eq_tail_tail_hw_ld_29,
	eq_tail_tail_hw_write_29,
	eq_tail_tail_hw_read_29,
	eq_tail_overr_hw_ld_30,
	eq_tail_overr_hw_write_30,
	eq_tail_tail_hw_ld_30,
	eq_tail_tail_hw_write_30,
	eq_tail_tail_hw_read_30,
	eq_tail_overr_hw_ld_31,
	eq_tail_overr_hw_write_31,
	eq_tail_tail_hw_ld_31,
	eq_tail_tail_hw_write_31,
	eq_tail_tail_hw_read_31,
	eq_tail_overr_hw_ld_32,
	eq_tail_overr_hw_write_32,
	eq_tail_tail_hw_ld_32,
	eq_tail_tail_hw_write_32,
	eq_tail_tail_hw_read_32,
	eq_tail_overr_hw_ld_33,
	eq_tail_overr_hw_write_33,
	eq_tail_tail_hw_ld_33,
	eq_tail_tail_hw_write_33,
	eq_tail_tail_hw_read_33,
	eq_tail_overr_hw_ld_34,
	eq_tail_overr_hw_write_34,
	eq_tail_tail_hw_ld_34,
	eq_tail_tail_hw_write_34,
	eq_tail_tail_hw_read_34,
	eq_tail_overr_hw_ld_35,
	eq_tail_overr_hw_write_35,
	eq_tail_tail_hw_ld_35,
	eq_tail_tail_hw_write_35,
	eq_tail_tail_hw_read_35,
	eq_tail_select_pulse_0,
	eq_tail_select_pulse_1,
	eq_tail_select_pulse_2,
	eq_tail_select_pulse_3,
	eq_tail_select_pulse_4,
	eq_tail_select_pulse_5,
	eq_tail_select_pulse_6,
	eq_tail_select_pulse_7,
	eq_tail_select_pulse_8,
	eq_tail_select_pulse_9,
	eq_tail_select_pulse_10,
	eq_tail_select_pulse_11,
	eq_tail_select_pulse_12,
	eq_tail_select_pulse_13,
	eq_tail_select_pulse_14,
	eq_tail_select_pulse_15,
	eq_tail_select_pulse_16,
	eq_tail_select_pulse_17,
	eq_tail_select_pulse_18,
	eq_tail_select_pulse_19,
	eq_tail_select_pulse_20,
	eq_tail_select_pulse_21,
	eq_tail_select_pulse_22,
	eq_tail_select_pulse_23,
	eq_tail_select_pulse_24,
	eq_tail_select_pulse_25,
	eq_tail_select_pulse_26,
	eq_tail_select_pulse_27,
	eq_tail_select_pulse_28,
	eq_tail_select_pulse_29,
	eq_tail_select_pulse_30,
	eq_tail_select_pulse_31,
	eq_tail_select_pulse_32,
	eq_tail_select_pulse_33,
	eq_tail_select_pulse_34,
	eq_tail_select_pulse_35,
	eq_head_head_hw_read_0,
	eq_head_head_hw_read_1,
	eq_head_head_hw_read_2,
	eq_head_head_hw_read_3,
	eq_head_head_hw_read_4,
	eq_head_head_hw_read_5,
	eq_head_head_hw_read_6,
	eq_head_head_hw_read_7,
	eq_head_head_hw_read_8,
	eq_head_head_hw_read_9,
	eq_head_head_hw_read_10,
	eq_head_head_hw_read_11,
	eq_head_head_hw_read_12,
	eq_head_head_hw_read_13,
	eq_head_head_hw_read_14,
	eq_head_head_hw_read_15,
	eq_head_head_hw_read_16,
	eq_head_head_hw_read_17,
	eq_head_head_hw_read_18,
	eq_head_head_hw_read_19,
	eq_head_head_hw_read_20,
	eq_head_head_hw_read_21,
	eq_head_head_hw_read_22,
	eq_head_head_hw_read_23,
	eq_head_head_hw_read_24,
	eq_head_head_hw_read_25,
	eq_head_head_hw_read_26,
	eq_head_head_hw_read_27,
	eq_head_head_hw_read_28,
	eq_head_head_hw_read_29,
	eq_head_head_hw_read_30,
	eq_head_head_hw_read_31,
	eq_head_head_hw_read_32,
	eq_head_head_hw_read_33,
	eq_head_head_hw_read_34,
	eq_head_head_hw_read_35,
	eq_head_select_pulse_0,
	eq_head_select_pulse_1,
	eq_head_select_pulse_2,
	eq_head_select_pulse_3,
	eq_head_select_pulse_4,
	eq_head_select_pulse_5,
	eq_head_select_pulse_6,
	eq_head_select_pulse_7,
	eq_head_select_pulse_8,
	eq_head_select_pulse_9,
	eq_head_select_pulse_10,
	eq_head_select_pulse_11,
	eq_head_select_pulse_12,
	eq_head_select_pulse_13,
	eq_head_select_pulse_14,
	eq_head_select_pulse_15,
	eq_head_select_pulse_16,
	eq_head_select_pulse_17,
	eq_head_select_pulse_18,
	eq_head_select_pulse_19,
	eq_head_select_pulse_20,
	eq_head_select_pulse_21,
	eq_head_select_pulse_22,
	eq_head_select_pulse_23,
	eq_head_select_pulse_24,
	eq_head_select_pulse_25,
	eq_head_select_pulse_26,
	eq_head_select_pulse_27,
	eq_head_select_pulse_28,
	eq_head_select_pulse_29,
	eq_head_select_pulse_30,
	eq_head_select_pulse_31,
	eq_head_select_pulse_32,
	eq_head_select_pulse_33,
	eq_head_select_pulse_34,
	eq_head_select_pulse_35,
	rst_l,
	daemon_csrbus_wr_in,
	daemon_csrbus_wr_out,
	daemon_csrbus_wr_data_in,
	read_data_0_out
	);

//====================================================
//     Polarity declarations
//====================================================
input  clk;  // Clock signal
output [`FIRE_DLC_IMU_EQS_CSR_EQ_BASE_ADDRESS_ADDRESS_INT_SLC] eq_base_address_address_hw_read;
    // This signal provides the current value of eq_base_address_address.
input  eq_base_address_select_pulse;  // select
output eq_ctrl_set_ext_select_0;  // When set, register eq_ctrl_set is selected.
                                  // This signal is a pulse.
output eq_ctrl_set_ext_select_1;  // When set, register eq_ctrl_set is selected.
                                  // This signal is a pulse.
output eq_ctrl_set_ext_select_2;  // When set, register eq_ctrl_set is selected.
                                  // This signal is a pulse.
output eq_ctrl_set_ext_select_3;  // When set, register eq_ctrl_set is selected.
                                  // This signal is a pulse.
output eq_ctrl_set_ext_select_4;  // When set, register eq_ctrl_set is selected.
                                  // This signal is a pulse.
output eq_ctrl_set_ext_select_5;  // When set, register eq_ctrl_set is selected.
                                  // This signal is a pulse.
output eq_ctrl_set_ext_select_6;  // When set, register eq_ctrl_set is selected.
                                  // This signal is a pulse.
output eq_ctrl_set_ext_select_7;  // When set, register eq_ctrl_set is selected.
                                  // This signal is a pulse.
output eq_ctrl_set_ext_select_8;  // When set, register eq_ctrl_set is selected.
                                  // This signal is a pulse.
output eq_ctrl_set_ext_select_9;  // When set, register eq_ctrl_set is selected.
                                  // This signal is a pulse.
output eq_ctrl_set_ext_select_10;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_11;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_12;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_13;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_14;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_15;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_16;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_17;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_18;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_19;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_20;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_21;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_22;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_23;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_24;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_25;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_26;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_27;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_28;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_29;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_30;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_31;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_32;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_33;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_34;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
output eq_ctrl_set_ext_select_35;  // When set, register eq_ctrl_set is
                                   // selected. This signal is a pulse.
input  eq_ctrl_set_select_0;  // select
input  eq_ctrl_set_select_1;  // select
input  eq_ctrl_set_select_2;  // select
input  eq_ctrl_set_select_3;  // select
input  eq_ctrl_set_select_4;  // select
input  eq_ctrl_set_select_5;  // select
input  eq_ctrl_set_select_6;  // select
input  eq_ctrl_set_select_7;  // select
input  eq_ctrl_set_select_8;  // select
input  eq_ctrl_set_select_9;  // select
input  eq_ctrl_set_select_10;  // select
input  eq_ctrl_set_select_11;  // select
input  eq_ctrl_set_select_12;  // select
input  eq_ctrl_set_select_13;  // select
input  eq_ctrl_set_select_14;  // select
input  eq_ctrl_set_select_15;  // select
input  eq_ctrl_set_select_16;  // select
input  eq_ctrl_set_select_17;  // select
input  eq_ctrl_set_select_18;  // select
input  eq_ctrl_set_select_19;  // select
input  eq_ctrl_set_select_20;  // select
input  eq_ctrl_set_select_21;  // select
input  eq_ctrl_set_select_22;  // select
input  eq_ctrl_set_select_23;  // select
input  eq_ctrl_set_select_24;  // select
input  eq_ctrl_set_select_25;  // select
input  eq_ctrl_set_select_26;  // select
input  eq_ctrl_set_select_27;  // select
input  eq_ctrl_set_select_28;  // select
input  eq_ctrl_set_select_29;  // select
input  eq_ctrl_set_select_30;  // select
input  eq_ctrl_set_select_31;  // select
input  eq_ctrl_set_select_32;  // select
input  eq_ctrl_set_select_33;  // select
input  eq_ctrl_set_select_34;  // select
input  eq_ctrl_set_select_35;  // select
output eq_ctrl_set_enoverr_ext_wr_data;  // Provides SW write data for external
                                         // register "eq_ctrl_set", field
                                         // "enoverr"
output eq_ctrl_set_en_ext_wr_data;  // Provides SW write data for external
                                    // register "eq_ctrl_set", field "en"
output eq_ctrl_clr_ext_select_0;  // When set, register eq_ctrl_clr is selected.
                                  // This signal is a pulse.
output eq_ctrl_clr_ext_select_1;  // When set, register eq_ctrl_clr is selected.
                                  // This signal is a pulse.
output eq_ctrl_clr_ext_select_2;  // When set, register eq_ctrl_clr is selected.
                                  // This signal is a pulse.
output eq_ctrl_clr_ext_select_3;  // When set, register eq_ctrl_clr is selected.
                                  // This signal is a pulse.
output eq_ctrl_clr_ext_select_4;  // When set, register eq_ctrl_clr is selected.
                                  // This signal is a pulse.
output eq_ctrl_clr_ext_select_5;  // When set, register eq_ctrl_clr is selected.
                                  // This signal is a pulse.
output eq_ctrl_clr_ext_select_6;  // When set, register eq_ctrl_clr is selected.
                                  // This signal is a pulse.
output eq_ctrl_clr_ext_select_7;  // When set, register eq_ctrl_clr is selected.
                                  // This signal is a pulse.
output eq_ctrl_clr_ext_select_8;  // When set, register eq_ctrl_clr is selected.
                                  // This signal is a pulse.
output eq_ctrl_clr_ext_select_9;  // When set, register eq_ctrl_clr is selected.
                                  // This signal is a pulse.
output eq_ctrl_clr_ext_select_10;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_11;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_12;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_13;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_14;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_15;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_16;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_17;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_18;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_19;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_20;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_21;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_22;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_23;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_24;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_25;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_26;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_27;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_28;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_29;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_30;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_31;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_32;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_33;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_34;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
output eq_ctrl_clr_ext_select_35;  // When set, register eq_ctrl_clr is
                                   // selected. This signal is a pulse.
input  eq_ctrl_clr_select_0;  // select
input  eq_ctrl_clr_select_1;  // select
input  eq_ctrl_clr_select_2;  // select
input  eq_ctrl_clr_select_3;  // select
input  eq_ctrl_clr_select_4;  // select
input  eq_ctrl_clr_select_5;  // select
input  eq_ctrl_clr_select_6;  // select
input  eq_ctrl_clr_select_7;  // select
input  eq_ctrl_clr_select_8;  // select
input  eq_ctrl_clr_select_9;  // select
input  eq_ctrl_clr_select_10;  // select
input  eq_ctrl_clr_select_11;  // select
input  eq_ctrl_clr_select_12;  // select
input  eq_ctrl_clr_select_13;  // select
input  eq_ctrl_clr_select_14;  // select
input  eq_ctrl_clr_select_15;  // select
input  eq_ctrl_clr_select_16;  // select
input  eq_ctrl_clr_select_17;  // select
input  eq_ctrl_clr_select_18;  // select
input  eq_ctrl_clr_select_19;  // select
input  eq_ctrl_clr_select_20;  // select
input  eq_ctrl_clr_select_21;  // select
input  eq_ctrl_clr_select_22;  // select
input  eq_ctrl_clr_select_23;  // select
input  eq_ctrl_clr_select_24;  // select
input  eq_ctrl_clr_select_25;  // select
input  eq_ctrl_clr_select_26;  // select
input  eq_ctrl_clr_select_27;  // select
input  eq_ctrl_clr_select_28;  // select
input  eq_ctrl_clr_select_29;  // select
input  eq_ctrl_clr_select_30;  // select
input  eq_ctrl_clr_select_31;  // select
input  eq_ctrl_clr_select_32;  // select
input  eq_ctrl_clr_select_33;  // select
input  eq_ctrl_clr_select_34;  // select
input  eq_ctrl_clr_select_35;  // select
output eq_ctrl_clr_coverr_ext_wr_data;  // Provides SW write data for external
                                        // register "eq_ctrl_clr", field
                                        // "coverr"
output eq_ctrl_clr_e2i_ext_wr_data;  // Provides SW write data for external
                                     // register "eq_ctrl_clr", field "e2i"
output eq_ctrl_clr_dis_ext_wr_data;  // Provides SW write data for external
                                     // register "eq_ctrl_clr", field "dis"
input  eq_state_select_0;  // select
input  eq_state_select_1;  // select
input  eq_state_select_2;  // select
input  eq_state_select_3;  // select
input  eq_state_select_4;  // select
input  eq_state_select_5;  // select
input  eq_state_select_6;  // select
input  eq_state_select_7;  // select
input  eq_state_select_8;  // select
input  eq_state_select_9;  // select
input  eq_state_select_10;  // select
input  eq_state_select_11;  // select
input  eq_state_select_12;  // select
input  eq_state_select_13;  // select
input  eq_state_select_14;  // select
input  eq_state_select_15;  // select
input  eq_state_select_16;  // select
input  eq_state_select_17;  // select
input  eq_state_select_18;  // select
input  eq_state_select_19;  // select
input  eq_state_select_20;  // select
input  eq_state_select_21;  // select
input  eq_state_select_22;  // select
input  eq_state_select_23;  // select
input  eq_state_select_24;  // select
input  eq_state_select_25;  // select
input  eq_state_select_26;  // select
input  eq_state_select_27;  // select
input  eq_state_select_28;  // select
input  eq_state_select_29;  // select
input  eq_state_select_30;  // select
input  eq_state_select_31;  // select
input  eq_state_select_32;  // select
input  eq_state_select_33;  // select
input  eq_state_select_34;  // select
input  eq_state_select_35;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_0;  // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_1;  // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_2;  // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_3;  // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_4;  // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_5;  // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_6;  // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_7;  // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_8;  // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_9;  // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_10;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_11;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_12;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_13;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_14;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_15;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_16;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_17;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_18;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_19;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_20;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_21;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_22;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_23;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_24;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_25;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_26;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_27;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_28;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_29;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_30;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_31;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_32;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_33;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_34;
    // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_35;
    // Read Data
input  eq_tail_overr_hw_ld_0;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_write_0;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_0;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_0;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_0;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_1;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_write_1;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_1;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_1;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_1;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_2;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_write_2;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_2;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_2;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_2;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_3;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_write_3;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_3;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_3;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_3;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_4;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_write_4;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_4;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_4;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_4;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_5;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_write_5;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_5;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_5;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_5;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_6;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_write_6;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_6;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_6;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_6;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_7;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_write_7;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_7;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_7;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_7;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_8;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_write_8;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_8;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_8;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_8;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_9;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_write_9;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_9;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_9;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_9;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_10;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_10;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_10;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_10;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_10;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_11;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_11;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_11;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_11;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_11;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_12;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_12;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_12;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_12;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_12;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_13;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_13;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_13;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_13;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_13;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_14;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_14;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_14;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_14;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_14;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_15;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_15;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_15;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_15;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_15;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_16;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_16;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_16;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_16;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_16;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_17;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_17;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_17;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_17;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_17;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_18;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_18;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_18;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_18;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_18;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_19;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_19;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_19;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_19;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_19;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_20;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_20;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_20;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_20;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_20;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_21;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_21;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_21;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_21;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_21;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_22;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_22;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_22;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_22;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_22;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_23;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_23;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_23;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_23;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_23;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_24;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_24;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_24;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_24;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_24;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_25;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_25;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_25;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_25;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_25;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_26;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_26;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_26;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_26;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_26;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_27;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_27;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_27;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_27;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_27;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_28;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_28;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_28;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_28;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_28;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_29;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_29;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_29;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_29;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_29;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_30;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_30;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_30;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_30;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_30;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_31;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_31;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_31;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_31;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_31;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_32;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_32;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_32;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_32;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_32;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_33;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_33;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_33;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_33;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_33;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_34;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_34;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_34;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_34;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_34;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_overr_hw_ld_35;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_35;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_35;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_35;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_35;
    // This signal provides the current value of eq_tail_tail.
input  eq_tail_select_pulse_0;  // select
input  eq_tail_select_pulse_1;  // select
input  eq_tail_select_pulse_2;  // select
input  eq_tail_select_pulse_3;  // select
input  eq_tail_select_pulse_4;  // select
input  eq_tail_select_pulse_5;  // select
input  eq_tail_select_pulse_6;  // select
input  eq_tail_select_pulse_7;  // select
input  eq_tail_select_pulse_8;  // select
input  eq_tail_select_pulse_9;  // select
input  eq_tail_select_pulse_10;  // select
input  eq_tail_select_pulse_11;  // select
input  eq_tail_select_pulse_12;  // select
input  eq_tail_select_pulse_13;  // select
input  eq_tail_select_pulse_14;  // select
input  eq_tail_select_pulse_15;  // select
input  eq_tail_select_pulse_16;  // select
input  eq_tail_select_pulse_17;  // select
input  eq_tail_select_pulse_18;  // select
input  eq_tail_select_pulse_19;  // select
input  eq_tail_select_pulse_20;  // select
input  eq_tail_select_pulse_21;  // select
input  eq_tail_select_pulse_22;  // select
input  eq_tail_select_pulse_23;  // select
input  eq_tail_select_pulse_24;  // select
input  eq_tail_select_pulse_25;  // select
input  eq_tail_select_pulse_26;  // select
input  eq_tail_select_pulse_27;  // select
input  eq_tail_select_pulse_28;  // select
input  eq_tail_select_pulse_29;  // select
input  eq_tail_select_pulse_30;  // select
input  eq_tail_select_pulse_31;  // select
input  eq_tail_select_pulse_32;  // select
input  eq_tail_select_pulse_33;  // select
input  eq_tail_select_pulse_34;  // select
input  eq_tail_select_pulse_35;  // select
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_0;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_1;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_2;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_3;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_4;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_5;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_6;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_7;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_8;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_9;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_10;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_11;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_12;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_13;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_14;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_15;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_16;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_17;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_18;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_19;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_20;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_21;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_22;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_23;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_24;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_25;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_26;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_27;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_28;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_29;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_30;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_31;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_32;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_33;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_34;
    // This signal provides the current value of eq_head_head.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_35;
    // This signal provides the current value of eq_head_head.
input  eq_head_select_pulse_0;  // select
input  eq_head_select_pulse_1;  // select
input  eq_head_select_pulse_2;  // select
input  eq_head_select_pulse_3;  // select
input  eq_head_select_pulse_4;  // select
input  eq_head_select_pulse_5;  // select
input  eq_head_select_pulse_6;  // select
input  eq_head_select_pulse_7;  // select
input  eq_head_select_pulse_8;  // select
input  eq_head_select_pulse_9;  // select
input  eq_head_select_pulse_10;  // select
input  eq_head_select_pulse_11;  // select
input  eq_head_select_pulse_12;  // select
input  eq_head_select_pulse_13;  // select
input  eq_head_select_pulse_14;  // select
input  eq_head_select_pulse_15;  // select
input  eq_head_select_pulse_16;  // select
input  eq_head_select_pulse_17;  // select
input  eq_head_select_pulse_18;  // select
input  eq_head_select_pulse_19;  // select
input  eq_head_select_pulse_20;  // select
input  eq_head_select_pulse_21;  // select
input  eq_head_select_pulse_22;  // select
input  eq_head_select_pulse_23;  // select
input  eq_head_select_pulse_24;  // select
input  eq_head_select_pulse_25;  // select
input  eq_head_select_pulse_26;  // select
input  eq_head_select_pulse_27;  // select
input  eq_head_select_pulse_28;  // select
input  eq_head_select_pulse_29;  // select
input  eq_head_select_pulse_30;  // select
input  eq_head_select_pulse_31;  // select
input  eq_head_select_pulse_32;  // select
input  eq_head_select_pulse_33;  // select
input  eq_head_select_pulse_34;  // select
input  eq_head_select_pulse_35;  // select
input  rst_l;  // HW reset
input  daemon_csrbus_wr_in;  // csrbus_wr
output daemon_csrbus_wr_out;  // csrbus_wr
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
output [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data

//====================================================
//     Type declarations
//====================================================
wire clk;  // Clock signal
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_BASE_ADDRESS_ADDRESS_INT_SLC] eq_base_address_address_hw_read;
    // This signal provides the current value of eq_base_address_address.
wire eq_base_address_select_pulse;  // select
wire eq_ctrl_set_ext_select_0;  // When set, register eq_ctrl_set is selected.
                                // This signal is a pulse.
wire eq_ctrl_set_ext_select_1;  // When set, register eq_ctrl_set is selected.
                                // This signal is a pulse.
wire eq_ctrl_set_ext_select_2;  // When set, register eq_ctrl_set is selected.
                                // This signal is a pulse.
wire eq_ctrl_set_ext_select_3;  // When set, register eq_ctrl_set is selected.
                                // This signal is a pulse.
wire eq_ctrl_set_ext_select_4;  // When set, register eq_ctrl_set is selected.
                                // This signal is a pulse.
wire eq_ctrl_set_ext_select_5;  // When set, register eq_ctrl_set is selected.
                                // This signal is a pulse.
wire eq_ctrl_set_ext_select_6;  // When set, register eq_ctrl_set is selected.
                                // This signal is a pulse.
wire eq_ctrl_set_ext_select_7;  // When set, register eq_ctrl_set is selected.
                                // This signal is a pulse.
wire eq_ctrl_set_ext_select_8;  // When set, register eq_ctrl_set is selected.
                                // This signal is a pulse.
wire eq_ctrl_set_ext_select_9;  // When set, register eq_ctrl_set is selected.
                                // This signal is a pulse.
wire eq_ctrl_set_ext_select_10;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_11;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_12;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_13;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_14;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_15;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_16;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_17;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_18;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_19;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_20;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_21;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_22;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_23;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_24;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_25;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_26;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_27;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_28;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_29;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_30;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_31;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_32;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_33;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_34;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_ext_select_35;  // When set, register eq_ctrl_set is selected.
                                 // This signal is a pulse.
wire eq_ctrl_set_select_0;  // select
wire eq_ctrl_set_select_1;  // select
wire eq_ctrl_set_select_2;  // select
wire eq_ctrl_set_select_3;  // select
wire eq_ctrl_set_select_4;  // select
wire eq_ctrl_set_select_5;  // select
wire eq_ctrl_set_select_6;  // select
wire eq_ctrl_set_select_7;  // select
wire eq_ctrl_set_select_8;  // select
wire eq_ctrl_set_select_9;  // select
wire eq_ctrl_set_select_10;  // select
wire eq_ctrl_set_select_11;  // select
wire eq_ctrl_set_select_12;  // select
wire eq_ctrl_set_select_13;  // select
wire eq_ctrl_set_select_14;  // select
wire eq_ctrl_set_select_15;  // select
wire eq_ctrl_set_select_16;  // select
wire eq_ctrl_set_select_17;  // select
wire eq_ctrl_set_select_18;  // select
wire eq_ctrl_set_select_19;  // select
wire eq_ctrl_set_select_20;  // select
wire eq_ctrl_set_select_21;  // select
wire eq_ctrl_set_select_22;  // select
wire eq_ctrl_set_select_23;  // select
wire eq_ctrl_set_select_24;  // select
wire eq_ctrl_set_select_25;  // select
wire eq_ctrl_set_select_26;  // select
wire eq_ctrl_set_select_27;  // select
wire eq_ctrl_set_select_28;  // select
wire eq_ctrl_set_select_29;  // select
wire eq_ctrl_set_select_30;  // select
wire eq_ctrl_set_select_31;  // select
wire eq_ctrl_set_select_32;  // select
wire eq_ctrl_set_select_33;  // select
wire eq_ctrl_set_select_34;  // select
wire eq_ctrl_set_select_35;  // select
wire eq_ctrl_set_enoverr_ext_wr_data;  // Provides SW write data for external
                                       // register "eq_ctrl_set", field
                                       // "enoverr"
wire eq_ctrl_set_en_ext_wr_data;  // Provides SW write data for external
                                  // register "eq_ctrl_set", field "en"
wire eq_ctrl_clr_ext_select_0;  // When set, register eq_ctrl_clr is selected.
                                // This signal is a pulse.
wire eq_ctrl_clr_ext_select_1;  // When set, register eq_ctrl_clr is selected.
                                // This signal is a pulse.
wire eq_ctrl_clr_ext_select_2;  // When set, register eq_ctrl_clr is selected.
                                // This signal is a pulse.
wire eq_ctrl_clr_ext_select_3;  // When set, register eq_ctrl_clr is selected.
                                // This signal is a pulse.
wire eq_ctrl_clr_ext_select_4;  // When set, register eq_ctrl_clr is selected.
                                // This signal is a pulse.
wire eq_ctrl_clr_ext_select_5;  // When set, register eq_ctrl_clr is selected.
                                // This signal is a pulse.
wire eq_ctrl_clr_ext_select_6;  // When set, register eq_ctrl_clr is selected.
                                // This signal is a pulse.
wire eq_ctrl_clr_ext_select_7;  // When set, register eq_ctrl_clr is selected.
                                // This signal is a pulse.
wire eq_ctrl_clr_ext_select_8;  // When set, register eq_ctrl_clr is selected.
                                // This signal is a pulse.
wire eq_ctrl_clr_ext_select_9;  // When set, register eq_ctrl_clr is selected.
                                // This signal is a pulse.
wire eq_ctrl_clr_ext_select_10;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_11;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_12;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_13;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_14;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_15;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_16;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_17;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_18;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_19;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_20;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_21;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_22;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_23;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_24;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_25;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_26;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_27;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_28;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_29;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_30;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_31;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_32;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_33;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_34;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_ext_select_35;  // When set, register eq_ctrl_clr is selected.
                                 // This signal is a pulse.
wire eq_ctrl_clr_select_0;  // select
wire eq_ctrl_clr_select_1;  // select
wire eq_ctrl_clr_select_2;  // select
wire eq_ctrl_clr_select_3;  // select
wire eq_ctrl_clr_select_4;  // select
wire eq_ctrl_clr_select_5;  // select
wire eq_ctrl_clr_select_6;  // select
wire eq_ctrl_clr_select_7;  // select
wire eq_ctrl_clr_select_8;  // select
wire eq_ctrl_clr_select_9;  // select
wire eq_ctrl_clr_select_10;  // select
wire eq_ctrl_clr_select_11;  // select
wire eq_ctrl_clr_select_12;  // select
wire eq_ctrl_clr_select_13;  // select
wire eq_ctrl_clr_select_14;  // select
wire eq_ctrl_clr_select_15;  // select
wire eq_ctrl_clr_select_16;  // select
wire eq_ctrl_clr_select_17;  // select
wire eq_ctrl_clr_select_18;  // select
wire eq_ctrl_clr_select_19;  // select
wire eq_ctrl_clr_select_20;  // select
wire eq_ctrl_clr_select_21;  // select
wire eq_ctrl_clr_select_22;  // select
wire eq_ctrl_clr_select_23;  // select
wire eq_ctrl_clr_select_24;  // select
wire eq_ctrl_clr_select_25;  // select
wire eq_ctrl_clr_select_26;  // select
wire eq_ctrl_clr_select_27;  // select
wire eq_ctrl_clr_select_28;  // select
wire eq_ctrl_clr_select_29;  // select
wire eq_ctrl_clr_select_30;  // select
wire eq_ctrl_clr_select_31;  // select
wire eq_ctrl_clr_select_32;  // select
wire eq_ctrl_clr_select_33;  // select
wire eq_ctrl_clr_select_34;  // select
wire eq_ctrl_clr_select_35;  // select
wire eq_ctrl_clr_coverr_ext_wr_data;  // Provides SW write data for external
                                      // register "eq_ctrl_clr", field "coverr"
wire eq_ctrl_clr_e2i_ext_wr_data;  // Provides SW write data for external
                                   // register "eq_ctrl_clr", field "e2i"
wire eq_ctrl_clr_dis_ext_wr_data;  // Provides SW write data for external
                                   // register "eq_ctrl_clr", field "dis"
wire eq_state_select_0;  // select
wire eq_state_select_1;  // select
wire eq_state_select_2;  // select
wire eq_state_select_3;  // select
wire eq_state_select_4;  // select
wire eq_state_select_5;  // select
wire eq_state_select_6;  // select
wire eq_state_select_7;  // select
wire eq_state_select_8;  // select
wire eq_state_select_9;  // select
wire eq_state_select_10;  // select
wire eq_state_select_11;  // select
wire eq_state_select_12;  // select
wire eq_state_select_13;  // select
wire eq_state_select_14;  // select
wire eq_state_select_15;  // select
wire eq_state_select_16;  // select
wire eq_state_select_17;  // select
wire eq_state_select_18;  // select
wire eq_state_select_19;  // select
wire eq_state_select_20;  // select
wire eq_state_select_21;  // select
wire eq_state_select_22;  // select
wire eq_state_select_23;  // select
wire eq_state_select_24;  // select
wire eq_state_select_25;  // select
wire eq_state_select_26;  // select
wire eq_state_select_27;  // select
wire eq_state_select_28;  // select
wire eq_state_select_29;  // select
wire eq_state_select_30;  // select
wire eq_state_select_31;  // select
wire eq_state_select_32;  // select
wire eq_state_select_33;  // select
wire eq_state_select_34;  // select
wire eq_state_select_35;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_0;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_1;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_2;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_3;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_4;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_5;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_6;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_7;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_8;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_9;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_10;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_11;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_12;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_13;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_14;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_15;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_16;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_17;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_18;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_19;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_20;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_21;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_22;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_23;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_24;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_25;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_26;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_27;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_28;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_29;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_30;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_31;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_32;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_33;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_34;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] eq_state_ext_read_data_35;  // Read Data
wire eq_tail_overr_hw_ld_0;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_write_0;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_0;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_0;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_0;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_1;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_write_1;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_1;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_1;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_1;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_2;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_write_2;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_2;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_2;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_2;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_3;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_write_3;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_3;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_3;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_3;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_4;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_write_4;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_4;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_4;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_4;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_5;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_write_5;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_5;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_5;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_5;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_6;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_write_6;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_6;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_6;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_6;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_7;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_write_7;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_7;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_7;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_7;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_8;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_write_8;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_8;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_8;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_8;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_9;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_write_9;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_9;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_9;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_9;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_10;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_10;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_10;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_10;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_10;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_11;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_11;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_11;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_11;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_11;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_12;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_12;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_12;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_12;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_12;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_13;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_13;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_13;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_13;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_13;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_14;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_14;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_14;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_14;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_14;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_15;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_15;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_15;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_15;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_15;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_16;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_16;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_16;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_16;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_16;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_17;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_17;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_17;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_17;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_17;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_18;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_18;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_18;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_18;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_18;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_19;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_19;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_19;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_19;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_19;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_20;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_20;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_20;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_20;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_20;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_21;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_21;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_21;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_21;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_21;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_22;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_22;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_22;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_22;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_22;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_23;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_23;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_23;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_23;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_23;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_24;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_24;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_24;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_24;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_24;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_25;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_25;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_25;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_25;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_25;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_26;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_26;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_26;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_26;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_26;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_27;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_27;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_27;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_27;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_27;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_28;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_28;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_28;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_28;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_28;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_29;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_29;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_29;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_29;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_29;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_30;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_30;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_30;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_30;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_30;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_31;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_31;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_31;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_31;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_31;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_32;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_32;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_32;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_32;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_32;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_33;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_33;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_33;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_33;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_33;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_34;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_34;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_34;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_34;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_34;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_overr_hw_ld_35;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_35;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_35;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_35;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_35;
    // This signal provides the current value of eq_tail_tail.
wire eq_tail_select_pulse_0;  // select
wire eq_tail_select_pulse_1;  // select
wire eq_tail_select_pulse_2;  // select
wire eq_tail_select_pulse_3;  // select
wire eq_tail_select_pulse_4;  // select
wire eq_tail_select_pulse_5;  // select
wire eq_tail_select_pulse_6;  // select
wire eq_tail_select_pulse_7;  // select
wire eq_tail_select_pulse_8;  // select
wire eq_tail_select_pulse_9;  // select
wire eq_tail_select_pulse_10;  // select
wire eq_tail_select_pulse_11;  // select
wire eq_tail_select_pulse_12;  // select
wire eq_tail_select_pulse_13;  // select
wire eq_tail_select_pulse_14;  // select
wire eq_tail_select_pulse_15;  // select
wire eq_tail_select_pulse_16;  // select
wire eq_tail_select_pulse_17;  // select
wire eq_tail_select_pulse_18;  // select
wire eq_tail_select_pulse_19;  // select
wire eq_tail_select_pulse_20;  // select
wire eq_tail_select_pulse_21;  // select
wire eq_tail_select_pulse_22;  // select
wire eq_tail_select_pulse_23;  // select
wire eq_tail_select_pulse_24;  // select
wire eq_tail_select_pulse_25;  // select
wire eq_tail_select_pulse_26;  // select
wire eq_tail_select_pulse_27;  // select
wire eq_tail_select_pulse_28;  // select
wire eq_tail_select_pulse_29;  // select
wire eq_tail_select_pulse_30;  // select
wire eq_tail_select_pulse_31;  // select
wire eq_tail_select_pulse_32;  // select
wire eq_tail_select_pulse_33;  // select
wire eq_tail_select_pulse_34;  // select
wire eq_tail_select_pulse_35;  // select
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_0;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_1;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_2;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_3;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_4;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_5;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_6;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_7;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_8;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_9;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_10;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_11;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_12;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_13;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_14;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_15;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_16;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_17;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_18;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_19;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_20;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_21;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_22;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_23;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_24;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_25;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_26;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_27;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_28;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_29;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_30;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_31;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_32;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_33;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_34;
    // This signal provides the current value of eq_head_head.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_HEAD_INT_SLC] eq_head_head_hw_read_35;
    // This signal provides the current value of eq_head_head.
wire eq_head_select_pulse_0;  // select
wire eq_head_select_pulse_1;  // select
wire eq_head_select_pulse_2;  // select
wire eq_head_select_pulse_3;  // select
wire eq_head_select_pulse_4;  // select
wire eq_head_select_pulse_5;  // select
wire eq_head_select_pulse_6;  // select
wire eq_head_select_pulse_7;  // select
wire eq_head_select_pulse_8;  // select
wire eq_head_select_pulse_9;  // select
wire eq_head_select_pulse_10;  // select
wire eq_head_select_pulse_11;  // select
wire eq_head_select_pulse_12;  // select
wire eq_head_select_pulse_13;  // select
wire eq_head_select_pulse_14;  // select
wire eq_head_select_pulse_15;  // select
wire eq_head_select_pulse_16;  // select
wire eq_head_select_pulse_17;  // select
wire eq_head_select_pulse_18;  // select
wire eq_head_select_pulse_19;  // select
wire eq_head_select_pulse_20;  // select
wire eq_head_select_pulse_21;  // select
wire eq_head_select_pulse_22;  // select
wire eq_head_select_pulse_23;  // select
wire eq_head_select_pulse_24;  // select
wire eq_head_select_pulse_25;  // select
wire eq_head_select_pulse_26;  // select
wire eq_head_select_pulse_27;  // select
wire eq_head_select_pulse_28;  // select
wire eq_head_select_pulse_29;  // select
wire eq_head_select_pulse_30;  // select
wire eq_head_select_pulse_31;  // select
wire eq_head_select_pulse_32;  // select
wire eq_head_select_pulse_33;  // select
wire eq_head_select_pulse_34;  // select
wire eq_head_select_pulse_35;  // select
wire rst_l;  // HW reset
wire daemon_csrbus_wr_in;  // csrbus_wr
wire daemon_csrbus_wr_out;  // csrbus_wr
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data


//====================================================
//   Local signals
//====================================================
//----- For CSR register: eq_base_address
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_BASE_ADDRESS_WIDTH-1:0] eq_base_address_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: eq_tail
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_0;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_1;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_2;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_3;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_4;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_5;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_6;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_7;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_8;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_9;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_10;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_11;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_12;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_13;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_14;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_15;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_16;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_17;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_18;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_19;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_20;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_21;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_22;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_23;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_24;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_25;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_26;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_27;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_28;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_29;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_30;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_31;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_32;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_33;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_34;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_WIDTH-1:0] eq_tail_csrbus_read_data_35;
    // Entry Based Read Data

//----- For CSR register: eq_head
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_0;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_1;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_2;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_3;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_4;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_5;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_6;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_7;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_8;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_9;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_10;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_11;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_12;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_13;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_14;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_15;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_16;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_17;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_18;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_19;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_20;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_21;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_22;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_23;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_24;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_25;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_26;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_27;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_28;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_29;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_30;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_31;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_32;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_33;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_34;
    // Entry Based Read Data
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_WIDTH-1:0] eq_head_csrbus_read_data_35;
    // Entry Based Read Data


//====================================================
//     Pipelining (First stage)
//====================================================
//----- delayed select for ext_select
reg eq_ctrl_set_select_0_piped;
reg eq_ctrl_set_select_0_piped_delayed;
reg eq_ctrl_set_select_1_piped;
reg eq_ctrl_set_select_1_piped_delayed;
reg eq_ctrl_set_select_2_piped;
reg eq_ctrl_set_select_2_piped_delayed;
reg eq_ctrl_set_select_3_piped;
reg eq_ctrl_set_select_3_piped_delayed;
reg eq_ctrl_set_select_4_piped;
reg eq_ctrl_set_select_4_piped_delayed;
reg eq_ctrl_set_select_5_piped;
reg eq_ctrl_set_select_5_piped_delayed;
reg eq_ctrl_set_select_6_piped;
reg eq_ctrl_set_select_6_piped_delayed;
reg eq_ctrl_set_select_7_piped;
reg eq_ctrl_set_select_7_piped_delayed;
reg eq_ctrl_set_select_8_piped;
reg eq_ctrl_set_select_8_piped_delayed;
reg eq_ctrl_set_select_9_piped;
reg eq_ctrl_set_select_9_piped_delayed;
reg eq_ctrl_set_select_10_piped;
reg eq_ctrl_set_select_10_piped_delayed;
reg eq_ctrl_set_select_11_piped;
reg eq_ctrl_set_select_11_piped_delayed;
reg eq_ctrl_set_select_12_piped;
reg eq_ctrl_set_select_12_piped_delayed;
reg eq_ctrl_set_select_13_piped;
reg eq_ctrl_set_select_13_piped_delayed;
reg eq_ctrl_set_select_14_piped;
reg eq_ctrl_set_select_14_piped_delayed;
reg eq_ctrl_set_select_15_piped;
reg eq_ctrl_set_select_15_piped_delayed;
reg eq_ctrl_set_select_16_piped;
reg eq_ctrl_set_select_16_piped_delayed;
reg eq_ctrl_set_select_17_piped;
reg eq_ctrl_set_select_17_piped_delayed;
reg eq_ctrl_set_select_18_piped;
reg eq_ctrl_set_select_18_piped_delayed;
reg eq_ctrl_set_select_19_piped;
reg eq_ctrl_set_select_19_piped_delayed;
reg eq_ctrl_set_select_20_piped;
reg eq_ctrl_set_select_20_piped_delayed;
reg eq_ctrl_set_select_21_piped;
reg eq_ctrl_set_select_21_piped_delayed;
reg eq_ctrl_set_select_22_piped;
reg eq_ctrl_set_select_22_piped_delayed;
reg eq_ctrl_set_select_23_piped;
reg eq_ctrl_set_select_23_piped_delayed;
reg eq_ctrl_set_select_24_piped;
reg eq_ctrl_set_select_24_piped_delayed;
reg eq_ctrl_set_select_25_piped;
reg eq_ctrl_set_select_25_piped_delayed;
reg eq_ctrl_set_select_26_piped;
reg eq_ctrl_set_select_26_piped_delayed;
reg eq_ctrl_set_select_27_piped;
reg eq_ctrl_set_select_27_piped_delayed;
reg eq_ctrl_set_select_28_piped;
reg eq_ctrl_set_select_28_piped_delayed;
reg eq_ctrl_set_select_29_piped;
reg eq_ctrl_set_select_29_piped_delayed;
reg eq_ctrl_set_select_30_piped;
reg eq_ctrl_set_select_30_piped_delayed;
reg eq_ctrl_set_select_31_piped;
reg eq_ctrl_set_select_31_piped_delayed;
reg eq_ctrl_set_select_32_piped;
reg eq_ctrl_set_select_32_piped_delayed;
reg eq_ctrl_set_select_33_piped;
reg eq_ctrl_set_select_33_piped_delayed;
reg eq_ctrl_set_select_34_piped;
reg eq_ctrl_set_select_34_piped_delayed;
reg eq_ctrl_set_select_35_piped;
reg eq_ctrl_set_select_35_piped_delayed;
reg eq_ctrl_clr_select_0_piped;
reg eq_ctrl_clr_select_0_piped_delayed;
reg eq_ctrl_clr_select_1_piped;
reg eq_ctrl_clr_select_1_piped_delayed;
reg eq_ctrl_clr_select_2_piped;
reg eq_ctrl_clr_select_2_piped_delayed;
reg eq_ctrl_clr_select_3_piped;
reg eq_ctrl_clr_select_3_piped_delayed;
reg eq_ctrl_clr_select_4_piped;
reg eq_ctrl_clr_select_4_piped_delayed;
reg eq_ctrl_clr_select_5_piped;
reg eq_ctrl_clr_select_5_piped_delayed;
reg eq_ctrl_clr_select_6_piped;
reg eq_ctrl_clr_select_6_piped_delayed;
reg eq_ctrl_clr_select_7_piped;
reg eq_ctrl_clr_select_7_piped_delayed;
reg eq_ctrl_clr_select_8_piped;
reg eq_ctrl_clr_select_8_piped_delayed;
reg eq_ctrl_clr_select_9_piped;
reg eq_ctrl_clr_select_9_piped_delayed;
reg eq_ctrl_clr_select_10_piped;
reg eq_ctrl_clr_select_10_piped_delayed;
reg eq_ctrl_clr_select_11_piped;
reg eq_ctrl_clr_select_11_piped_delayed;
reg eq_ctrl_clr_select_12_piped;
reg eq_ctrl_clr_select_12_piped_delayed;
reg eq_ctrl_clr_select_13_piped;
reg eq_ctrl_clr_select_13_piped_delayed;
reg eq_ctrl_clr_select_14_piped;
reg eq_ctrl_clr_select_14_piped_delayed;
reg eq_ctrl_clr_select_15_piped;
reg eq_ctrl_clr_select_15_piped_delayed;
reg eq_ctrl_clr_select_16_piped;
reg eq_ctrl_clr_select_16_piped_delayed;
reg eq_ctrl_clr_select_17_piped;
reg eq_ctrl_clr_select_17_piped_delayed;
reg eq_ctrl_clr_select_18_piped;
reg eq_ctrl_clr_select_18_piped_delayed;
reg eq_ctrl_clr_select_19_piped;
reg eq_ctrl_clr_select_19_piped_delayed;
reg eq_ctrl_clr_select_20_piped;
reg eq_ctrl_clr_select_20_piped_delayed;
reg eq_ctrl_clr_select_21_piped;
reg eq_ctrl_clr_select_21_piped_delayed;
reg eq_ctrl_clr_select_22_piped;
reg eq_ctrl_clr_select_22_piped_delayed;
reg eq_ctrl_clr_select_23_piped;
reg eq_ctrl_clr_select_23_piped_delayed;
reg eq_ctrl_clr_select_24_piped;
reg eq_ctrl_clr_select_24_piped_delayed;
reg eq_ctrl_clr_select_25_piped;
reg eq_ctrl_clr_select_25_piped_delayed;
reg eq_ctrl_clr_select_26_piped;
reg eq_ctrl_clr_select_26_piped_delayed;
reg eq_ctrl_clr_select_27_piped;
reg eq_ctrl_clr_select_27_piped_delayed;
reg eq_ctrl_clr_select_28_piped;
reg eq_ctrl_clr_select_28_piped_delayed;
reg eq_ctrl_clr_select_29_piped;
reg eq_ctrl_clr_select_29_piped_delayed;
reg eq_ctrl_clr_select_30_piped;
reg eq_ctrl_clr_select_30_piped_delayed;
reg eq_ctrl_clr_select_31_piped;
reg eq_ctrl_clr_select_31_piped_delayed;
reg eq_ctrl_clr_select_32_piped;
reg eq_ctrl_clr_select_32_piped_delayed;
reg eq_ctrl_clr_select_33_piped;
reg eq_ctrl_clr_select_33_piped_delayed;
reg eq_ctrl_clr_select_34_piped;
reg eq_ctrl_clr_select_34_piped_delayed;
reg eq_ctrl_clr_select_35_piped;
reg eq_ctrl_clr_select_35_piped_delayed;

always @(posedge clk)
  begin
     if(~rst_l)
       begin
          eq_ctrl_set_select_0_piped <= 1'b0;
          eq_ctrl_set_select_0_piped_delayed <= 1'b0;
          eq_ctrl_set_select_1_piped <= 1'b0;
          eq_ctrl_set_select_1_piped_delayed <= 1'b0;
          eq_ctrl_set_select_2_piped <= 1'b0;
          eq_ctrl_set_select_2_piped_delayed <= 1'b0;
          eq_ctrl_set_select_3_piped <= 1'b0;
          eq_ctrl_set_select_3_piped_delayed <= 1'b0;
          eq_ctrl_set_select_4_piped <= 1'b0;
          eq_ctrl_set_select_4_piped_delayed <= 1'b0;
          eq_ctrl_set_select_5_piped <= 1'b0;
          eq_ctrl_set_select_5_piped_delayed <= 1'b0;
          eq_ctrl_set_select_6_piped <= 1'b0;
          eq_ctrl_set_select_6_piped_delayed <= 1'b0;
          eq_ctrl_set_select_7_piped <= 1'b0;
          eq_ctrl_set_select_7_piped_delayed <= 1'b0;
          eq_ctrl_set_select_8_piped <= 1'b0;
          eq_ctrl_set_select_8_piped_delayed <= 1'b0;
          eq_ctrl_set_select_9_piped <= 1'b0;
          eq_ctrl_set_select_9_piped_delayed <= 1'b0;
          eq_ctrl_set_select_10_piped <= 1'b0;
          eq_ctrl_set_select_10_piped_delayed <= 1'b0;
          eq_ctrl_set_select_11_piped <= 1'b0;
          eq_ctrl_set_select_11_piped_delayed <= 1'b0;
          eq_ctrl_set_select_12_piped <= 1'b0;
          eq_ctrl_set_select_12_piped_delayed <= 1'b0;
          eq_ctrl_set_select_13_piped <= 1'b0;
          eq_ctrl_set_select_13_piped_delayed <= 1'b0;
          eq_ctrl_set_select_14_piped <= 1'b0;
          eq_ctrl_set_select_14_piped_delayed <= 1'b0;
          eq_ctrl_set_select_15_piped <= 1'b0;
          eq_ctrl_set_select_15_piped_delayed <= 1'b0;
          eq_ctrl_set_select_16_piped <= 1'b0;
          eq_ctrl_set_select_16_piped_delayed <= 1'b0;
          eq_ctrl_set_select_17_piped <= 1'b0;
          eq_ctrl_set_select_17_piped_delayed <= 1'b0;
          eq_ctrl_set_select_18_piped <= 1'b0;
          eq_ctrl_set_select_18_piped_delayed <= 1'b0;
          eq_ctrl_set_select_19_piped <= 1'b0;
          eq_ctrl_set_select_19_piped_delayed <= 1'b0;
          eq_ctrl_set_select_20_piped <= 1'b0;
          eq_ctrl_set_select_20_piped_delayed <= 1'b0;
          eq_ctrl_set_select_21_piped <= 1'b0;
          eq_ctrl_set_select_21_piped_delayed <= 1'b0;
          eq_ctrl_set_select_22_piped <= 1'b0;
          eq_ctrl_set_select_22_piped_delayed <= 1'b0;
          eq_ctrl_set_select_23_piped <= 1'b0;
          eq_ctrl_set_select_23_piped_delayed <= 1'b0;
          eq_ctrl_set_select_24_piped <= 1'b0;
          eq_ctrl_set_select_24_piped_delayed <= 1'b0;
          eq_ctrl_set_select_25_piped <= 1'b0;
          eq_ctrl_set_select_25_piped_delayed <= 1'b0;
          eq_ctrl_set_select_26_piped <= 1'b0;
          eq_ctrl_set_select_26_piped_delayed <= 1'b0;
          eq_ctrl_set_select_27_piped <= 1'b0;
          eq_ctrl_set_select_27_piped_delayed <= 1'b0;
          eq_ctrl_set_select_28_piped <= 1'b0;
          eq_ctrl_set_select_28_piped_delayed <= 1'b0;
          eq_ctrl_set_select_29_piped <= 1'b0;
          eq_ctrl_set_select_29_piped_delayed <= 1'b0;
          eq_ctrl_set_select_30_piped <= 1'b0;
          eq_ctrl_set_select_30_piped_delayed <= 1'b0;
          eq_ctrl_set_select_31_piped <= 1'b0;
          eq_ctrl_set_select_31_piped_delayed <= 1'b0;
          eq_ctrl_set_select_32_piped <= 1'b0;
          eq_ctrl_set_select_32_piped_delayed <= 1'b0;
          eq_ctrl_set_select_33_piped <= 1'b0;
          eq_ctrl_set_select_33_piped_delayed <= 1'b0;
          eq_ctrl_set_select_34_piped <= 1'b0;
          eq_ctrl_set_select_34_piped_delayed <= 1'b0;
          eq_ctrl_set_select_35_piped <= 1'b0;
          eq_ctrl_set_select_35_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_0_piped <= 1'b0;
          eq_ctrl_clr_select_0_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_1_piped <= 1'b0;
          eq_ctrl_clr_select_1_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_2_piped <= 1'b0;
          eq_ctrl_clr_select_2_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_3_piped <= 1'b0;
          eq_ctrl_clr_select_3_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_4_piped <= 1'b0;
          eq_ctrl_clr_select_4_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_5_piped <= 1'b0;
          eq_ctrl_clr_select_5_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_6_piped <= 1'b0;
          eq_ctrl_clr_select_6_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_7_piped <= 1'b0;
          eq_ctrl_clr_select_7_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_8_piped <= 1'b0;
          eq_ctrl_clr_select_8_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_9_piped <= 1'b0;
          eq_ctrl_clr_select_9_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_10_piped <= 1'b0;
          eq_ctrl_clr_select_10_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_11_piped <= 1'b0;
          eq_ctrl_clr_select_11_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_12_piped <= 1'b0;
          eq_ctrl_clr_select_12_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_13_piped <= 1'b0;
          eq_ctrl_clr_select_13_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_14_piped <= 1'b0;
          eq_ctrl_clr_select_14_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_15_piped <= 1'b0;
          eq_ctrl_clr_select_15_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_16_piped <= 1'b0;
          eq_ctrl_clr_select_16_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_17_piped <= 1'b0;
          eq_ctrl_clr_select_17_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_18_piped <= 1'b0;
          eq_ctrl_clr_select_18_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_19_piped <= 1'b0;
          eq_ctrl_clr_select_19_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_20_piped <= 1'b0;
          eq_ctrl_clr_select_20_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_21_piped <= 1'b0;
          eq_ctrl_clr_select_21_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_22_piped <= 1'b0;
          eq_ctrl_clr_select_22_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_23_piped <= 1'b0;
          eq_ctrl_clr_select_23_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_24_piped <= 1'b0;
          eq_ctrl_clr_select_24_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_25_piped <= 1'b0;
          eq_ctrl_clr_select_25_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_26_piped <= 1'b0;
          eq_ctrl_clr_select_26_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_27_piped <= 1'b0;
          eq_ctrl_clr_select_27_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_28_piped <= 1'b0;
          eq_ctrl_clr_select_28_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_29_piped <= 1'b0;
          eq_ctrl_clr_select_29_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_30_piped <= 1'b0;
          eq_ctrl_clr_select_30_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_31_piped <= 1'b0;
          eq_ctrl_clr_select_31_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_32_piped <= 1'b0;
          eq_ctrl_clr_select_32_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_33_piped <= 1'b0;
          eq_ctrl_clr_select_33_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_34_piped <= 1'b0;
          eq_ctrl_clr_select_34_piped_delayed <= 1'b0;
          eq_ctrl_clr_select_35_piped <= 1'b0;
          eq_ctrl_clr_select_35_piped_delayed <= 1'b0;
       end
     else
       begin
          eq_ctrl_set_select_0_piped <= eq_ctrl_set_select_0;
          eq_ctrl_set_select_0_piped_delayed <= eq_ctrl_set_select_0_piped;
          eq_ctrl_set_select_1_piped <= eq_ctrl_set_select_1;
          eq_ctrl_set_select_1_piped_delayed <= eq_ctrl_set_select_1_piped;
          eq_ctrl_set_select_2_piped <= eq_ctrl_set_select_2;
          eq_ctrl_set_select_2_piped_delayed <= eq_ctrl_set_select_2_piped;
          eq_ctrl_set_select_3_piped <= eq_ctrl_set_select_3;
          eq_ctrl_set_select_3_piped_delayed <= eq_ctrl_set_select_3_piped;
          eq_ctrl_set_select_4_piped <= eq_ctrl_set_select_4;
          eq_ctrl_set_select_4_piped_delayed <= eq_ctrl_set_select_4_piped;
          eq_ctrl_set_select_5_piped <= eq_ctrl_set_select_5;
          eq_ctrl_set_select_5_piped_delayed <= eq_ctrl_set_select_5_piped;
          eq_ctrl_set_select_6_piped <= eq_ctrl_set_select_6;
          eq_ctrl_set_select_6_piped_delayed <= eq_ctrl_set_select_6_piped;
          eq_ctrl_set_select_7_piped <= eq_ctrl_set_select_7;
          eq_ctrl_set_select_7_piped_delayed <= eq_ctrl_set_select_7_piped;
          eq_ctrl_set_select_8_piped <= eq_ctrl_set_select_8;
          eq_ctrl_set_select_8_piped_delayed <= eq_ctrl_set_select_8_piped;
          eq_ctrl_set_select_9_piped <= eq_ctrl_set_select_9;
          eq_ctrl_set_select_9_piped_delayed <= eq_ctrl_set_select_9_piped;
          eq_ctrl_set_select_10_piped <= eq_ctrl_set_select_10;
          eq_ctrl_set_select_10_piped_delayed <= eq_ctrl_set_select_10_piped;
          eq_ctrl_set_select_11_piped <= eq_ctrl_set_select_11;
          eq_ctrl_set_select_11_piped_delayed <= eq_ctrl_set_select_11_piped;
          eq_ctrl_set_select_12_piped <= eq_ctrl_set_select_12;
          eq_ctrl_set_select_12_piped_delayed <= eq_ctrl_set_select_12_piped;
          eq_ctrl_set_select_13_piped <= eq_ctrl_set_select_13;
          eq_ctrl_set_select_13_piped_delayed <= eq_ctrl_set_select_13_piped;
          eq_ctrl_set_select_14_piped <= eq_ctrl_set_select_14;
          eq_ctrl_set_select_14_piped_delayed <= eq_ctrl_set_select_14_piped;
          eq_ctrl_set_select_15_piped <= eq_ctrl_set_select_15;
          eq_ctrl_set_select_15_piped_delayed <= eq_ctrl_set_select_15_piped;
          eq_ctrl_set_select_16_piped <= eq_ctrl_set_select_16;
          eq_ctrl_set_select_16_piped_delayed <= eq_ctrl_set_select_16_piped;
          eq_ctrl_set_select_17_piped <= eq_ctrl_set_select_17;
          eq_ctrl_set_select_17_piped_delayed <= eq_ctrl_set_select_17_piped;
          eq_ctrl_set_select_18_piped <= eq_ctrl_set_select_18;
          eq_ctrl_set_select_18_piped_delayed <= eq_ctrl_set_select_18_piped;
          eq_ctrl_set_select_19_piped <= eq_ctrl_set_select_19;
          eq_ctrl_set_select_19_piped_delayed <= eq_ctrl_set_select_19_piped;
          eq_ctrl_set_select_20_piped <= eq_ctrl_set_select_20;
          eq_ctrl_set_select_20_piped_delayed <= eq_ctrl_set_select_20_piped;
          eq_ctrl_set_select_21_piped <= eq_ctrl_set_select_21;
          eq_ctrl_set_select_21_piped_delayed <= eq_ctrl_set_select_21_piped;
          eq_ctrl_set_select_22_piped <= eq_ctrl_set_select_22;
          eq_ctrl_set_select_22_piped_delayed <= eq_ctrl_set_select_22_piped;
          eq_ctrl_set_select_23_piped <= eq_ctrl_set_select_23;
          eq_ctrl_set_select_23_piped_delayed <= eq_ctrl_set_select_23_piped;
          eq_ctrl_set_select_24_piped <= eq_ctrl_set_select_24;
          eq_ctrl_set_select_24_piped_delayed <= eq_ctrl_set_select_24_piped;
          eq_ctrl_set_select_25_piped <= eq_ctrl_set_select_25;
          eq_ctrl_set_select_25_piped_delayed <= eq_ctrl_set_select_25_piped;
          eq_ctrl_set_select_26_piped <= eq_ctrl_set_select_26;
          eq_ctrl_set_select_26_piped_delayed <= eq_ctrl_set_select_26_piped;
          eq_ctrl_set_select_27_piped <= eq_ctrl_set_select_27;
          eq_ctrl_set_select_27_piped_delayed <= eq_ctrl_set_select_27_piped;
          eq_ctrl_set_select_28_piped <= eq_ctrl_set_select_28;
          eq_ctrl_set_select_28_piped_delayed <= eq_ctrl_set_select_28_piped;
          eq_ctrl_set_select_29_piped <= eq_ctrl_set_select_29;
          eq_ctrl_set_select_29_piped_delayed <= eq_ctrl_set_select_29_piped;
          eq_ctrl_set_select_30_piped <= eq_ctrl_set_select_30;
          eq_ctrl_set_select_30_piped_delayed <= eq_ctrl_set_select_30_piped;
          eq_ctrl_set_select_31_piped <= eq_ctrl_set_select_31;
          eq_ctrl_set_select_31_piped_delayed <= eq_ctrl_set_select_31_piped;
          eq_ctrl_set_select_32_piped <= eq_ctrl_set_select_32;
          eq_ctrl_set_select_32_piped_delayed <= eq_ctrl_set_select_32_piped;
          eq_ctrl_set_select_33_piped <= eq_ctrl_set_select_33;
          eq_ctrl_set_select_33_piped_delayed <= eq_ctrl_set_select_33_piped;
          eq_ctrl_set_select_34_piped <= eq_ctrl_set_select_34;
          eq_ctrl_set_select_34_piped_delayed <= eq_ctrl_set_select_34_piped;
          eq_ctrl_set_select_35_piped <= eq_ctrl_set_select_35;
          eq_ctrl_set_select_35_piped_delayed <= eq_ctrl_set_select_35_piped;
          eq_ctrl_clr_select_0_piped <= eq_ctrl_clr_select_0;
          eq_ctrl_clr_select_0_piped_delayed <= eq_ctrl_clr_select_0_piped;
          eq_ctrl_clr_select_1_piped <= eq_ctrl_clr_select_1;
          eq_ctrl_clr_select_1_piped_delayed <= eq_ctrl_clr_select_1_piped;
          eq_ctrl_clr_select_2_piped <= eq_ctrl_clr_select_2;
          eq_ctrl_clr_select_2_piped_delayed <= eq_ctrl_clr_select_2_piped;
          eq_ctrl_clr_select_3_piped <= eq_ctrl_clr_select_3;
          eq_ctrl_clr_select_3_piped_delayed <= eq_ctrl_clr_select_3_piped;
          eq_ctrl_clr_select_4_piped <= eq_ctrl_clr_select_4;
          eq_ctrl_clr_select_4_piped_delayed <= eq_ctrl_clr_select_4_piped;
          eq_ctrl_clr_select_5_piped <= eq_ctrl_clr_select_5;
          eq_ctrl_clr_select_5_piped_delayed <= eq_ctrl_clr_select_5_piped;
          eq_ctrl_clr_select_6_piped <= eq_ctrl_clr_select_6;
          eq_ctrl_clr_select_6_piped_delayed <= eq_ctrl_clr_select_6_piped;
          eq_ctrl_clr_select_7_piped <= eq_ctrl_clr_select_7;
          eq_ctrl_clr_select_7_piped_delayed <= eq_ctrl_clr_select_7_piped;
          eq_ctrl_clr_select_8_piped <= eq_ctrl_clr_select_8;
          eq_ctrl_clr_select_8_piped_delayed <= eq_ctrl_clr_select_8_piped;
          eq_ctrl_clr_select_9_piped <= eq_ctrl_clr_select_9;
          eq_ctrl_clr_select_9_piped_delayed <= eq_ctrl_clr_select_9_piped;
          eq_ctrl_clr_select_10_piped <= eq_ctrl_clr_select_10;
          eq_ctrl_clr_select_10_piped_delayed <= eq_ctrl_clr_select_10_piped;
          eq_ctrl_clr_select_11_piped <= eq_ctrl_clr_select_11;
          eq_ctrl_clr_select_11_piped_delayed <= eq_ctrl_clr_select_11_piped;
          eq_ctrl_clr_select_12_piped <= eq_ctrl_clr_select_12;
          eq_ctrl_clr_select_12_piped_delayed <= eq_ctrl_clr_select_12_piped;
          eq_ctrl_clr_select_13_piped <= eq_ctrl_clr_select_13;
          eq_ctrl_clr_select_13_piped_delayed <= eq_ctrl_clr_select_13_piped;
          eq_ctrl_clr_select_14_piped <= eq_ctrl_clr_select_14;
          eq_ctrl_clr_select_14_piped_delayed <= eq_ctrl_clr_select_14_piped;
          eq_ctrl_clr_select_15_piped <= eq_ctrl_clr_select_15;
          eq_ctrl_clr_select_15_piped_delayed <= eq_ctrl_clr_select_15_piped;
          eq_ctrl_clr_select_16_piped <= eq_ctrl_clr_select_16;
          eq_ctrl_clr_select_16_piped_delayed <= eq_ctrl_clr_select_16_piped;
          eq_ctrl_clr_select_17_piped <= eq_ctrl_clr_select_17;
          eq_ctrl_clr_select_17_piped_delayed <= eq_ctrl_clr_select_17_piped;
          eq_ctrl_clr_select_18_piped <= eq_ctrl_clr_select_18;
          eq_ctrl_clr_select_18_piped_delayed <= eq_ctrl_clr_select_18_piped;
          eq_ctrl_clr_select_19_piped <= eq_ctrl_clr_select_19;
          eq_ctrl_clr_select_19_piped_delayed <= eq_ctrl_clr_select_19_piped;
          eq_ctrl_clr_select_20_piped <= eq_ctrl_clr_select_20;
          eq_ctrl_clr_select_20_piped_delayed <= eq_ctrl_clr_select_20_piped;
          eq_ctrl_clr_select_21_piped <= eq_ctrl_clr_select_21;
          eq_ctrl_clr_select_21_piped_delayed <= eq_ctrl_clr_select_21_piped;
          eq_ctrl_clr_select_22_piped <= eq_ctrl_clr_select_22;
          eq_ctrl_clr_select_22_piped_delayed <= eq_ctrl_clr_select_22_piped;
          eq_ctrl_clr_select_23_piped <= eq_ctrl_clr_select_23;
          eq_ctrl_clr_select_23_piped_delayed <= eq_ctrl_clr_select_23_piped;
          eq_ctrl_clr_select_24_piped <= eq_ctrl_clr_select_24;
          eq_ctrl_clr_select_24_piped_delayed <= eq_ctrl_clr_select_24_piped;
          eq_ctrl_clr_select_25_piped <= eq_ctrl_clr_select_25;
          eq_ctrl_clr_select_25_piped_delayed <= eq_ctrl_clr_select_25_piped;
          eq_ctrl_clr_select_26_piped <= eq_ctrl_clr_select_26;
          eq_ctrl_clr_select_26_piped_delayed <= eq_ctrl_clr_select_26_piped;
          eq_ctrl_clr_select_27_piped <= eq_ctrl_clr_select_27;
          eq_ctrl_clr_select_27_piped_delayed <= eq_ctrl_clr_select_27_piped;
          eq_ctrl_clr_select_28_piped <= eq_ctrl_clr_select_28;
          eq_ctrl_clr_select_28_piped_delayed <= eq_ctrl_clr_select_28_piped;
          eq_ctrl_clr_select_29_piped <= eq_ctrl_clr_select_29;
          eq_ctrl_clr_select_29_piped_delayed <= eq_ctrl_clr_select_29_piped;
          eq_ctrl_clr_select_30_piped <= eq_ctrl_clr_select_30;
          eq_ctrl_clr_select_30_piped_delayed <= eq_ctrl_clr_select_30_piped;
          eq_ctrl_clr_select_31_piped <= eq_ctrl_clr_select_31;
          eq_ctrl_clr_select_31_piped_delayed <= eq_ctrl_clr_select_31_piped;
          eq_ctrl_clr_select_32_piped <= eq_ctrl_clr_select_32;
          eq_ctrl_clr_select_32_piped_delayed <= eq_ctrl_clr_select_32_piped;
          eq_ctrl_clr_select_33_piped <= eq_ctrl_clr_select_33;
          eq_ctrl_clr_select_33_piped_delayed <= eq_ctrl_clr_select_33_piped;
          eq_ctrl_clr_select_34_piped <= eq_ctrl_clr_select_34;
          eq_ctrl_clr_select_34_piped_delayed <= eq_ctrl_clr_select_34_piped;
          eq_ctrl_clr_select_35_piped <= eq_ctrl_clr_select_35;
          eq_ctrl_clr_select_35_piped_delayed <= eq_ctrl_clr_select_35_piped;
        end
  end

//====================================================
//     Assignments only (first stage)
//====================================================
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data = daemon_csrbus_wr_data_in;
wire daemon_csrbus_wr      = daemon_csrbus_wr_in;
assign daemon_csrbus_wr_out      = daemon_csrbus_wr_in;
assign eq_ctrl_set_enoverr_ext_wr_data = daemon_csrbus_wr_data_in[57];
assign eq_ctrl_set_en_ext_wr_data = daemon_csrbus_wr_data_in[44];
assign eq_ctrl_clr_coverr_ext_wr_data = daemon_csrbus_wr_data_in[57];
assign eq_ctrl_clr_e2i_ext_wr_data = daemon_csrbus_wr_data_in[47];
assign eq_ctrl_clr_dis_ext_wr_data = daemon_csrbus_wr_data_in[44];

//====================================================
//      Automatic hw_ld / hw_write
//====================================================

//====================================================
//      Extern select
//====================================================
assign eq_ctrl_set_ext_select_0 =
           eq_ctrl_set_select_0_piped&
           ~eq_ctrl_set_select_0_piped_delayed;

// eq_ctrl_set_ext_select_0 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_0_pulse
       -var eq_ctrl_set_ext_select_0 -max 1
       -message "eq_ctrl_set_ext_select_0 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_1 =
           eq_ctrl_set_select_1_piped&
           ~eq_ctrl_set_select_1_piped_delayed;

// eq_ctrl_set_ext_select_1 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_1_pulse
       -var eq_ctrl_set_ext_select_1 -max 1
       -message "eq_ctrl_set_ext_select_1 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_2 =
           eq_ctrl_set_select_2_piped&
           ~eq_ctrl_set_select_2_piped_delayed;

// eq_ctrl_set_ext_select_2 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_2_pulse
       -var eq_ctrl_set_ext_select_2 -max 1
       -message "eq_ctrl_set_ext_select_2 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_3 =
           eq_ctrl_set_select_3_piped&
           ~eq_ctrl_set_select_3_piped_delayed;

// eq_ctrl_set_ext_select_3 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_3_pulse
       -var eq_ctrl_set_ext_select_3 -max 1
       -message "eq_ctrl_set_ext_select_3 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_4 =
           eq_ctrl_set_select_4_piped&
           ~eq_ctrl_set_select_4_piped_delayed;

// eq_ctrl_set_ext_select_4 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_4_pulse
       -var eq_ctrl_set_ext_select_4 -max 1
       -message "eq_ctrl_set_ext_select_4 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_5 =
           eq_ctrl_set_select_5_piped&
           ~eq_ctrl_set_select_5_piped_delayed;

// eq_ctrl_set_ext_select_5 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_5_pulse
       -var eq_ctrl_set_ext_select_5 -max 1
       -message "eq_ctrl_set_ext_select_5 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_6 =
           eq_ctrl_set_select_6_piped&
           ~eq_ctrl_set_select_6_piped_delayed;

// eq_ctrl_set_ext_select_6 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_6_pulse
       -var eq_ctrl_set_ext_select_6 -max 1
       -message "eq_ctrl_set_ext_select_6 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_7 =
           eq_ctrl_set_select_7_piped&
           ~eq_ctrl_set_select_7_piped_delayed;

// eq_ctrl_set_ext_select_7 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_7_pulse
       -var eq_ctrl_set_ext_select_7 -max 1
       -message "eq_ctrl_set_ext_select_7 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_8 =
           eq_ctrl_set_select_8_piped&
           ~eq_ctrl_set_select_8_piped_delayed;

// eq_ctrl_set_ext_select_8 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_8_pulse
       -var eq_ctrl_set_ext_select_8 -max 1
       -message "eq_ctrl_set_ext_select_8 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_9 =
           eq_ctrl_set_select_9_piped&
           ~eq_ctrl_set_select_9_piped_delayed;

// eq_ctrl_set_ext_select_9 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_9_pulse
       -var eq_ctrl_set_ext_select_9 -max 1
       -message "eq_ctrl_set_ext_select_9 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_10 =
           eq_ctrl_set_select_10_piped&
           ~eq_ctrl_set_select_10_piped_delayed;

// eq_ctrl_set_ext_select_10 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_10_pulse
       -var eq_ctrl_set_ext_select_10 -max 1
       -message "eq_ctrl_set_ext_select_10 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_11 =
           eq_ctrl_set_select_11_piped&
           ~eq_ctrl_set_select_11_piped_delayed;

// eq_ctrl_set_ext_select_11 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_11_pulse
       -var eq_ctrl_set_ext_select_11 -max 1
       -message "eq_ctrl_set_ext_select_11 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_12 =
           eq_ctrl_set_select_12_piped&
           ~eq_ctrl_set_select_12_piped_delayed;

// eq_ctrl_set_ext_select_12 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_12_pulse
       -var eq_ctrl_set_ext_select_12 -max 1
       -message "eq_ctrl_set_ext_select_12 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_13 =
           eq_ctrl_set_select_13_piped&
           ~eq_ctrl_set_select_13_piped_delayed;

// eq_ctrl_set_ext_select_13 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_13_pulse
       -var eq_ctrl_set_ext_select_13 -max 1
       -message "eq_ctrl_set_ext_select_13 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_14 =
           eq_ctrl_set_select_14_piped&
           ~eq_ctrl_set_select_14_piped_delayed;

// eq_ctrl_set_ext_select_14 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_14_pulse
       -var eq_ctrl_set_ext_select_14 -max 1
       -message "eq_ctrl_set_ext_select_14 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_15 =
           eq_ctrl_set_select_15_piped&
           ~eq_ctrl_set_select_15_piped_delayed;

// eq_ctrl_set_ext_select_15 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_15_pulse
       -var eq_ctrl_set_ext_select_15 -max 1
       -message "eq_ctrl_set_ext_select_15 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_16 =
           eq_ctrl_set_select_16_piped&
           ~eq_ctrl_set_select_16_piped_delayed;

// eq_ctrl_set_ext_select_16 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_16_pulse
       -var eq_ctrl_set_ext_select_16 -max 1
       -message "eq_ctrl_set_ext_select_16 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_17 =
           eq_ctrl_set_select_17_piped&
           ~eq_ctrl_set_select_17_piped_delayed;

// eq_ctrl_set_ext_select_17 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_17_pulse
       -var eq_ctrl_set_ext_select_17 -max 1
       -message "eq_ctrl_set_ext_select_17 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_18 =
           eq_ctrl_set_select_18_piped&
           ~eq_ctrl_set_select_18_piped_delayed;

// eq_ctrl_set_ext_select_18 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_18_pulse
       -var eq_ctrl_set_ext_select_18 -max 1
       -message "eq_ctrl_set_ext_select_18 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_19 =
           eq_ctrl_set_select_19_piped&
           ~eq_ctrl_set_select_19_piped_delayed;

// eq_ctrl_set_ext_select_19 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_19_pulse
       -var eq_ctrl_set_ext_select_19 -max 1
       -message "eq_ctrl_set_ext_select_19 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_20 =
           eq_ctrl_set_select_20_piped&
           ~eq_ctrl_set_select_20_piped_delayed;

// eq_ctrl_set_ext_select_20 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_20_pulse
       -var eq_ctrl_set_ext_select_20 -max 1
       -message "eq_ctrl_set_ext_select_20 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_21 =
           eq_ctrl_set_select_21_piped&
           ~eq_ctrl_set_select_21_piped_delayed;

// eq_ctrl_set_ext_select_21 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_21_pulse
       -var eq_ctrl_set_ext_select_21 -max 1
       -message "eq_ctrl_set_ext_select_21 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_22 =
           eq_ctrl_set_select_22_piped&
           ~eq_ctrl_set_select_22_piped_delayed;

// eq_ctrl_set_ext_select_22 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_22_pulse
       -var eq_ctrl_set_ext_select_22 -max 1
       -message "eq_ctrl_set_ext_select_22 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_23 =
           eq_ctrl_set_select_23_piped&
           ~eq_ctrl_set_select_23_piped_delayed;

// eq_ctrl_set_ext_select_23 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_23_pulse
       -var eq_ctrl_set_ext_select_23 -max 1
       -message "eq_ctrl_set_ext_select_23 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_24 =
           eq_ctrl_set_select_24_piped&
           ~eq_ctrl_set_select_24_piped_delayed;

// eq_ctrl_set_ext_select_24 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_24_pulse
       -var eq_ctrl_set_ext_select_24 -max 1
       -message "eq_ctrl_set_ext_select_24 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_25 =
           eq_ctrl_set_select_25_piped&
           ~eq_ctrl_set_select_25_piped_delayed;

// eq_ctrl_set_ext_select_25 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_25_pulse
       -var eq_ctrl_set_ext_select_25 -max 1
       -message "eq_ctrl_set_ext_select_25 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_26 =
           eq_ctrl_set_select_26_piped&
           ~eq_ctrl_set_select_26_piped_delayed;

// eq_ctrl_set_ext_select_26 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_26_pulse
       -var eq_ctrl_set_ext_select_26 -max 1
       -message "eq_ctrl_set_ext_select_26 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_27 =
           eq_ctrl_set_select_27_piped&
           ~eq_ctrl_set_select_27_piped_delayed;

// eq_ctrl_set_ext_select_27 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_27_pulse
       -var eq_ctrl_set_ext_select_27 -max 1
       -message "eq_ctrl_set_ext_select_27 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_28 =
           eq_ctrl_set_select_28_piped&
           ~eq_ctrl_set_select_28_piped_delayed;

// eq_ctrl_set_ext_select_28 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_28_pulse
       -var eq_ctrl_set_ext_select_28 -max 1
       -message "eq_ctrl_set_ext_select_28 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_29 =
           eq_ctrl_set_select_29_piped&
           ~eq_ctrl_set_select_29_piped_delayed;

// eq_ctrl_set_ext_select_29 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_29_pulse
       -var eq_ctrl_set_ext_select_29 -max 1
       -message "eq_ctrl_set_ext_select_29 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_30 =
           eq_ctrl_set_select_30_piped&
           ~eq_ctrl_set_select_30_piped_delayed;

// eq_ctrl_set_ext_select_30 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_30_pulse
       -var eq_ctrl_set_ext_select_30 -max 1
       -message "eq_ctrl_set_ext_select_30 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_31 =
           eq_ctrl_set_select_31_piped&
           ~eq_ctrl_set_select_31_piped_delayed;

// eq_ctrl_set_ext_select_31 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_31_pulse
       -var eq_ctrl_set_ext_select_31 -max 1
       -message "eq_ctrl_set_ext_select_31 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_32 =
           eq_ctrl_set_select_32_piped&
           ~eq_ctrl_set_select_32_piped_delayed;

// eq_ctrl_set_ext_select_32 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_32_pulse
       -var eq_ctrl_set_ext_select_32 -max 1
       -message "eq_ctrl_set_ext_select_32 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_33 =
           eq_ctrl_set_select_33_piped&
           ~eq_ctrl_set_select_33_piped_delayed;

// eq_ctrl_set_ext_select_33 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_33_pulse
       -var eq_ctrl_set_ext_select_33 -max 1
       -message "eq_ctrl_set_ext_select_33 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_34 =
           eq_ctrl_set_select_34_piped&
           ~eq_ctrl_set_select_34_piped_delayed;

// eq_ctrl_set_ext_select_34 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_34_pulse
       -var eq_ctrl_set_ext_select_34 -max 1
       -message "eq_ctrl_set_ext_select_34 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_set_ext_select_35 =
           eq_ctrl_set_select_35_piped&
           ~eq_ctrl_set_select_35_piped_delayed;

// eq_ctrl_set_ext_select_35 is a pulse
/* 0in assert_timer -name eq_ctrl_set_ext_select_35_pulse
       -var eq_ctrl_set_ext_select_35 -max 1
       -message "eq_ctrl_set_ext_select_35 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_0 =
           eq_ctrl_clr_select_0_piped&
           ~eq_ctrl_clr_select_0_piped_delayed;

// eq_ctrl_clr_ext_select_0 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_0_pulse
       -var eq_ctrl_clr_ext_select_0 -max 1
       -message "eq_ctrl_clr_ext_select_0 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_1 =
           eq_ctrl_clr_select_1_piped&
           ~eq_ctrl_clr_select_1_piped_delayed;

// eq_ctrl_clr_ext_select_1 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_1_pulse
       -var eq_ctrl_clr_ext_select_1 -max 1
       -message "eq_ctrl_clr_ext_select_1 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_2 =
           eq_ctrl_clr_select_2_piped&
           ~eq_ctrl_clr_select_2_piped_delayed;

// eq_ctrl_clr_ext_select_2 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_2_pulse
       -var eq_ctrl_clr_ext_select_2 -max 1
       -message "eq_ctrl_clr_ext_select_2 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_3 =
           eq_ctrl_clr_select_3_piped&
           ~eq_ctrl_clr_select_3_piped_delayed;

// eq_ctrl_clr_ext_select_3 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_3_pulse
       -var eq_ctrl_clr_ext_select_3 -max 1
       -message "eq_ctrl_clr_ext_select_3 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_4 =
           eq_ctrl_clr_select_4_piped&
           ~eq_ctrl_clr_select_4_piped_delayed;

// eq_ctrl_clr_ext_select_4 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_4_pulse
       -var eq_ctrl_clr_ext_select_4 -max 1
       -message "eq_ctrl_clr_ext_select_4 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_5 =
           eq_ctrl_clr_select_5_piped&
           ~eq_ctrl_clr_select_5_piped_delayed;

// eq_ctrl_clr_ext_select_5 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_5_pulse
       -var eq_ctrl_clr_ext_select_5 -max 1
       -message "eq_ctrl_clr_ext_select_5 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_6 =
           eq_ctrl_clr_select_6_piped&
           ~eq_ctrl_clr_select_6_piped_delayed;

// eq_ctrl_clr_ext_select_6 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_6_pulse
       -var eq_ctrl_clr_ext_select_6 -max 1
       -message "eq_ctrl_clr_ext_select_6 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_7 =
           eq_ctrl_clr_select_7_piped&
           ~eq_ctrl_clr_select_7_piped_delayed;

// eq_ctrl_clr_ext_select_7 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_7_pulse
       -var eq_ctrl_clr_ext_select_7 -max 1
       -message "eq_ctrl_clr_ext_select_7 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_8 =
           eq_ctrl_clr_select_8_piped&
           ~eq_ctrl_clr_select_8_piped_delayed;

// eq_ctrl_clr_ext_select_8 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_8_pulse
       -var eq_ctrl_clr_ext_select_8 -max 1
       -message "eq_ctrl_clr_ext_select_8 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_9 =
           eq_ctrl_clr_select_9_piped&
           ~eq_ctrl_clr_select_9_piped_delayed;

// eq_ctrl_clr_ext_select_9 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_9_pulse
       -var eq_ctrl_clr_ext_select_9 -max 1
       -message "eq_ctrl_clr_ext_select_9 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_10 =
           eq_ctrl_clr_select_10_piped&
           ~eq_ctrl_clr_select_10_piped_delayed;

// eq_ctrl_clr_ext_select_10 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_10_pulse
       -var eq_ctrl_clr_ext_select_10 -max 1
       -message "eq_ctrl_clr_ext_select_10 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_11 =
           eq_ctrl_clr_select_11_piped&
           ~eq_ctrl_clr_select_11_piped_delayed;

// eq_ctrl_clr_ext_select_11 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_11_pulse
       -var eq_ctrl_clr_ext_select_11 -max 1
       -message "eq_ctrl_clr_ext_select_11 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_12 =
           eq_ctrl_clr_select_12_piped&
           ~eq_ctrl_clr_select_12_piped_delayed;

// eq_ctrl_clr_ext_select_12 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_12_pulse
       -var eq_ctrl_clr_ext_select_12 -max 1
       -message "eq_ctrl_clr_ext_select_12 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_13 =
           eq_ctrl_clr_select_13_piped&
           ~eq_ctrl_clr_select_13_piped_delayed;

// eq_ctrl_clr_ext_select_13 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_13_pulse
       -var eq_ctrl_clr_ext_select_13 -max 1
       -message "eq_ctrl_clr_ext_select_13 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_14 =
           eq_ctrl_clr_select_14_piped&
           ~eq_ctrl_clr_select_14_piped_delayed;

// eq_ctrl_clr_ext_select_14 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_14_pulse
       -var eq_ctrl_clr_ext_select_14 -max 1
       -message "eq_ctrl_clr_ext_select_14 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_15 =
           eq_ctrl_clr_select_15_piped&
           ~eq_ctrl_clr_select_15_piped_delayed;

// eq_ctrl_clr_ext_select_15 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_15_pulse
       -var eq_ctrl_clr_ext_select_15 -max 1
       -message "eq_ctrl_clr_ext_select_15 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_16 =
           eq_ctrl_clr_select_16_piped&
           ~eq_ctrl_clr_select_16_piped_delayed;

// eq_ctrl_clr_ext_select_16 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_16_pulse
       -var eq_ctrl_clr_ext_select_16 -max 1
       -message "eq_ctrl_clr_ext_select_16 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_17 =
           eq_ctrl_clr_select_17_piped&
           ~eq_ctrl_clr_select_17_piped_delayed;

// eq_ctrl_clr_ext_select_17 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_17_pulse
       -var eq_ctrl_clr_ext_select_17 -max 1
       -message "eq_ctrl_clr_ext_select_17 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_18 =
           eq_ctrl_clr_select_18_piped&
           ~eq_ctrl_clr_select_18_piped_delayed;

// eq_ctrl_clr_ext_select_18 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_18_pulse
       -var eq_ctrl_clr_ext_select_18 -max 1
       -message "eq_ctrl_clr_ext_select_18 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_19 =
           eq_ctrl_clr_select_19_piped&
           ~eq_ctrl_clr_select_19_piped_delayed;

// eq_ctrl_clr_ext_select_19 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_19_pulse
       -var eq_ctrl_clr_ext_select_19 -max 1
       -message "eq_ctrl_clr_ext_select_19 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_20 =
           eq_ctrl_clr_select_20_piped&
           ~eq_ctrl_clr_select_20_piped_delayed;

// eq_ctrl_clr_ext_select_20 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_20_pulse
       -var eq_ctrl_clr_ext_select_20 -max 1
       -message "eq_ctrl_clr_ext_select_20 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_21 =
           eq_ctrl_clr_select_21_piped&
           ~eq_ctrl_clr_select_21_piped_delayed;

// eq_ctrl_clr_ext_select_21 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_21_pulse
       -var eq_ctrl_clr_ext_select_21 -max 1
       -message "eq_ctrl_clr_ext_select_21 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_22 =
           eq_ctrl_clr_select_22_piped&
           ~eq_ctrl_clr_select_22_piped_delayed;

// eq_ctrl_clr_ext_select_22 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_22_pulse
       -var eq_ctrl_clr_ext_select_22 -max 1
       -message "eq_ctrl_clr_ext_select_22 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_23 =
           eq_ctrl_clr_select_23_piped&
           ~eq_ctrl_clr_select_23_piped_delayed;

// eq_ctrl_clr_ext_select_23 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_23_pulse
       -var eq_ctrl_clr_ext_select_23 -max 1
       -message "eq_ctrl_clr_ext_select_23 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_24 =
           eq_ctrl_clr_select_24_piped&
           ~eq_ctrl_clr_select_24_piped_delayed;

// eq_ctrl_clr_ext_select_24 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_24_pulse
       -var eq_ctrl_clr_ext_select_24 -max 1
       -message "eq_ctrl_clr_ext_select_24 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_25 =
           eq_ctrl_clr_select_25_piped&
           ~eq_ctrl_clr_select_25_piped_delayed;

// eq_ctrl_clr_ext_select_25 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_25_pulse
       -var eq_ctrl_clr_ext_select_25 -max 1
       -message "eq_ctrl_clr_ext_select_25 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_26 =
           eq_ctrl_clr_select_26_piped&
           ~eq_ctrl_clr_select_26_piped_delayed;

// eq_ctrl_clr_ext_select_26 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_26_pulse
       -var eq_ctrl_clr_ext_select_26 -max 1
       -message "eq_ctrl_clr_ext_select_26 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_27 =
           eq_ctrl_clr_select_27_piped&
           ~eq_ctrl_clr_select_27_piped_delayed;

// eq_ctrl_clr_ext_select_27 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_27_pulse
       -var eq_ctrl_clr_ext_select_27 -max 1
       -message "eq_ctrl_clr_ext_select_27 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_28 =
           eq_ctrl_clr_select_28_piped&
           ~eq_ctrl_clr_select_28_piped_delayed;

// eq_ctrl_clr_ext_select_28 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_28_pulse
       -var eq_ctrl_clr_ext_select_28 -max 1
       -message "eq_ctrl_clr_ext_select_28 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_29 =
           eq_ctrl_clr_select_29_piped&
           ~eq_ctrl_clr_select_29_piped_delayed;

// eq_ctrl_clr_ext_select_29 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_29_pulse
       -var eq_ctrl_clr_ext_select_29 -max 1
       -message "eq_ctrl_clr_ext_select_29 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_30 =
           eq_ctrl_clr_select_30_piped&
           ~eq_ctrl_clr_select_30_piped_delayed;

// eq_ctrl_clr_ext_select_30 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_30_pulse
       -var eq_ctrl_clr_ext_select_30 -max 1
       -message "eq_ctrl_clr_ext_select_30 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_31 =
           eq_ctrl_clr_select_31_piped&
           ~eq_ctrl_clr_select_31_piped_delayed;

// eq_ctrl_clr_ext_select_31 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_31_pulse
       -var eq_ctrl_clr_ext_select_31 -max 1
       -message "eq_ctrl_clr_ext_select_31 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_32 =
           eq_ctrl_clr_select_32_piped&
           ~eq_ctrl_clr_select_32_piped_delayed;

// eq_ctrl_clr_ext_select_32 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_32_pulse
       -var eq_ctrl_clr_ext_select_32 -max 1
       -message "eq_ctrl_clr_ext_select_32 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_33 =
           eq_ctrl_clr_select_33_piped&
           ~eq_ctrl_clr_select_33_piped_delayed;

// eq_ctrl_clr_ext_select_33 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_33_pulse
       -var eq_ctrl_clr_ext_select_33 -max 1
       -message "eq_ctrl_clr_ext_select_33 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_34 =
           eq_ctrl_clr_select_34_piped&
           ~eq_ctrl_clr_select_34_piped_delayed;

// eq_ctrl_clr_ext_select_34 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_34_pulse
       -var eq_ctrl_clr_ext_select_34 -max 1
       -message "eq_ctrl_clr_ext_select_34 pulse length is not 1"
       -clock clk
*/

assign eq_ctrl_clr_ext_select_35 =
           eq_ctrl_clr_select_35_piped&
           ~eq_ctrl_clr_select_35_piped_delayed;

// eq_ctrl_clr_ext_select_35 is a pulse
/* 0in assert_timer -name eq_ctrl_clr_ext_select_35_pulse
       -var eq_ctrl_clr_ext_select_35 -max 1
       -message "eq_ctrl_clr_ext_select_35 pulse length is not 1"
       -clock clk
*/


//=====================================================
//      OUTPUT: read_data_out
//=====================================================
dmu_imu_eqs_csrpipe_109 dmu_imu_eqs_csrpipe_109_inst_1
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.reg_in	(1'b1),
	.reg_out	(1'b1),
	.data0	(eq_base_address_csrbus_read_data),
	.sel0	(eq_base_address_select_pulse),
	.data1	(eq_state_ext_read_data_0),
	.sel1	(eq_state_select_0),
	.data2	(eq_state_ext_read_data_1),
	.sel2	(eq_state_select_1),
	.data3	(eq_state_ext_read_data_2),
	.sel3	(eq_state_select_2),
	.data4	(eq_state_ext_read_data_3),
	.sel4	(eq_state_select_3),
	.data5	(eq_state_ext_read_data_4),
	.sel5	(eq_state_select_4),
	.data6	(eq_state_ext_read_data_5),
	.sel6	(eq_state_select_5),
	.data7	(eq_state_ext_read_data_6),
	.sel7	(eq_state_select_6),
	.data8	(eq_state_ext_read_data_7),
	.sel8	(eq_state_select_7),
	.data9	(eq_state_ext_read_data_8),
	.sel9	(eq_state_select_8),
	.data10	(eq_state_ext_read_data_9),
	.sel10	(eq_state_select_9),
	.data11	(eq_state_ext_read_data_10),
	.sel11	(eq_state_select_10),
	.data12	(eq_state_ext_read_data_11),
	.sel12	(eq_state_select_11),
	.data13	(eq_state_ext_read_data_12),
	.sel13	(eq_state_select_12),
	.data14	(eq_state_ext_read_data_13),
	.sel14	(eq_state_select_13),
	.data15	(eq_state_ext_read_data_14),
	.sel15	(eq_state_select_14),
	.data16	(eq_state_ext_read_data_15),
	.sel16	(eq_state_select_15),
	.data17	(eq_state_ext_read_data_16),
	.sel17	(eq_state_select_16),
	.data18	(eq_state_ext_read_data_17),
	.sel18	(eq_state_select_17),
	.data19	(eq_state_ext_read_data_18),
	.sel19	(eq_state_select_18),
	.data20	(eq_state_ext_read_data_19),
	.sel20	(eq_state_select_19),
	.data21	(eq_state_ext_read_data_20),
	.sel21	(eq_state_select_20),
	.data22	(eq_state_ext_read_data_21),
	.sel22	(eq_state_select_21),
	.data23	(eq_state_ext_read_data_22),
	.sel23	(eq_state_select_22),
	.data24	(eq_state_ext_read_data_23),
	.sel24	(eq_state_select_23),
	.data25	(eq_state_ext_read_data_24),
	.sel25	(eq_state_select_24),
	.data26	(eq_state_ext_read_data_25),
	.sel26	(eq_state_select_25),
	.data27	(eq_state_ext_read_data_26),
	.sel27	(eq_state_select_26),
	.data28	(eq_state_ext_read_data_27),
	.sel28	(eq_state_select_27),
	.data29	(eq_state_ext_read_data_28),
	.sel29	(eq_state_select_28),
	.data30	(eq_state_ext_read_data_29),
	.sel30	(eq_state_select_29),
	.data31	(eq_state_ext_read_data_30),
	.sel31	(eq_state_select_30),
	.data32	(eq_state_ext_read_data_31),
	.sel32	(eq_state_select_31),
	.data33	(eq_state_ext_read_data_32),
	.sel33	(eq_state_select_32),
	.data34	(eq_state_ext_read_data_33),
	.sel34	(eq_state_select_33),
	.data35	(eq_state_ext_read_data_34),
	.sel35	(eq_state_select_34),
	.data36	(eq_state_ext_read_data_35),
	.sel36	(eq_state_select_35),
	.data37	(eq_tail_csrbus_read_data_0),
	.sel37	(eq_tail_select_pulse_0),
	.data38	(eq_tail_csrbus_read_data_1),
	.sel38	(eq_tail_select_pulse_1),
	.data39	(eq_tail_csrbus_read_data_2),
	.sel39	(eq_tail_select_pulse_2),
	.data40	(eq_tail_csrbus_read_data_3),
	.sel40	(eq_tail_select_pulse_3),
	.data41	(eq_tail_csrbus_read_data_4),
	.sel41	(eq_tail_select_pulse_4),
	.data42	(eq_tail_csrbus_read_data_5),
	.sel42	(eq_tail_select_pulse_5),
	.data43	(eq_tail_csrbus_read_data_6),
	.sel43	(eq_tail_select_pulse_6),
	.data44	(eq_tail_csrbus_read_data_7),
	.sel44	(eq_tail_select_pulse_7),
	.data45	(eq_tail_csrbus_read_data_8),
	.sel45	(eq_tail_select_pulse_8),
	.data46	(eq_tail_csrbus_read_data_9),
	.sel46	(eq_tail_select_pulse_9),
	.data47	(eq_tail_csrbus_read_data_10),
	.sel47	(eq_tail_select_pulse_10),
	.data48	(eq_tail_csrbus_read_data_11),
	.sel48	(eq_tail_select_pulse_11),
	.data49	(eq_tail_csrbus_read_data_12),
	.sel49	(eq_tail_select_pulse_12),
	.data50	(eq_tail_csrbus_read_data_13),
	.sel50	(eq_tail_select_pulse_13),
	.data51	(eq_tail_csrbus_read_data_14),
	.sel51	(eq_tail_select_pulse_14),
	.data52	(eq_tail_csrbus_read_data_15),
	.sel52	(eq_tail_select_pulse_15),
	.data53	(eq_tail_csrbus_read_data_16),
	.sel53	(eq_tail_select_pulse_16),
	.data54	(eq_tail_csrbus_read_data_17),
	.sel54	(eq_tail_select_pulse_17),
	.data55	(eq_tail_csrbus_read_data_18),
	.sel55	(eq_tail_select_pulse_18),
	.data56	(eq_tail_csrbus_read_data_19),
	.sel56	(eq_tail_select_pulse_19),
	.data57	(eq_tail_csrbus_read_data_20),
	.sel57	(eq_tail_select_pulse_20),
	.data58	(eq_tail_csrbus_read_data_21),
	.sel58	(eq_tail_select_pulse_21),
	.data59	(eq_tail_csrbus_read_data_22),
	.sel59	(eq_tail_select_pulse_22),
	.data60	(eq_tail_csrbus_read_data_23),
	.sel60	(eq_tail_select_pulse_23),
	.data61	(eq_tail_csrbus_read_data_24),
	.sel61	(eq_tail_select_pulse_24),
	.data62	(eq_tail_csrbus_read_data_25),
	.sel62	(eq_tail_select_pulse_25),
	.data63	(eq_tail_csrbus_read_data_26),
	.sel63	(eq_tail_select_pulse_26),
	.data64	(eq_tail_csrbus_read_data_27),
	.sel64	(eq_tail_select_pulse_27),
	.data65	(eq_tail_csrbus_read_data_28),
	.sel65	(eq_tail_select_pulse_28),
	.data66	(eq_tail_csrbus_read_data_29),
	.sel66	(eq_tail_select_pulse_29),
	.data67	(eq_tail_csrbus_read_data_30),
	.sel67	(eq_tail_select_pulse_30),
	.data68	(eq_tail_csrbus_read_data_31),
	.sel68	(eq_tail_select_pulse_31),
	.data69	(eq_tail_csrbus_read_data_32),
	.sel69	(eq_tail_select_pulse_32),
	.data70	(eq_tail_csrbus_read_data_33),
	.sel70	(eq_tail_select_pulse_33),
	.data71	(eq_tail_csrbus_read_data_34),
	.sel71	(eq_tail_select_pulse_34),
	.data72	(eq_tail_csrbus_read_data_35),
	.sel72	(eq_tail_select_pulse_35),
	.data73	(eq_head_csrbus_read_data_0),
	.sel73	(eq_head_select_pulse_0),
	.data74	(eq_head_csrbus_read_data_1),
	.sel74	(eq_head_select_pulse_1),
	.data75	(eq_head_csrbus_read_data_2),
	.sel75	(eq_head_select_pulse_2),
	.data76	(eq_head_csrbus_read_data_3),
	.sel76	(eq_head_select_pulse_3),
	.data77	(eq_head_csrbus_read_data_4),
	.sel77	(eq_head_select_pulse_4),
	.data78	(eq_head_csrbus_read_data_5),
	.sel78	(eq_head_select_pulse_5),
	.data79	(eq_head_csrbus_read_data_6),
	.sel79	(eq_head_select_pulse_6),
	.data80	(eq_head_csrbus_read_data_7),
	.sel80	(eq_head_select_pulse_7),
	.data81	(eq_head_csrbus_read_data_8),
	.sel81	(eq_head_select_pulse_8),
	.data82	(eq_head_csrbus_read_data_9),
	.sel82	(eq_head_select_pulse_9),
	.data83	(eq_head_csrbus_read_data_10),
	.sel83	(eq_head_select_pulse_10),
	.data84	(eq_head_csrbus_read_data_11),
	.sel84	(eq_head_select_pulse_11),
	.data85	(eq_head_csrbus_read_data_12),
	.sel85	(eq_head_select_pulse_12),
	.data86	(eq_head_csrbus_read_data_13),
	.sel86	(eq_head_select_pulse_13),
	.data87	(eq_head_csrbus_read_data_14),
	.sel87	(eq_head_select_pulse_14),
	.data88	(eq_head_csrbus_read_data_15),
	.sel88	(eq_head_select_pulse_15),
	.data89	(eq_head_csrbus_read_data_16),
	.sel89	(eq_head_select_pulse_16),
	.data90	(eq_head_csrbus_read_data_17),
	.sel90	(eq_head_select_pulse_17),
	.data91	(eq_head_csrbus_read_data_18),
	.sel91	(eq_head_select_pulse_18),
	.data92	(eq_head_csrbus_read_data_19),
	.sel92	(eq_head_select_pulse_19),
	.data93	(eq_head_csrbus_read_data_20),
	.sel93	(eq_head_select_pulse_20),
	.data94	(eq_head_csrbus_read_data_21),
	.sel94	(eq_head_select_pulse_21),
	.data95	(eq_head_csrbus_read_data_22),
	.sel95	(eq_head_select_pulse_22),
	.data96	(eq_head_csrbus_read_data_23),
	.sel96	(eq_head_select_pulse_23),
	.data97	(eq_head_csrbus_read_data_24),
	.sel97	(eq_head_select_pulse_24),
	.data98	(eq_head_csrbus_read_data_25),
	.sel98	(eq_head_select_pulse_25),
	.data99	(eq_head_csrbus_read_data_26),
	.sel99	(eq_head_select_pulse_26),
	.data100	(eq_head_csrbus_read_data_27),
	.sel100	(eq_head_select_pulse_27),
	.data101	(eq_head_csrbus_read_data_28),
	.sel101	(eq_head_select_pulse_28),
	.data102	(eq_head_csrbus_read_data_29),
	.sel102	(eq_head_select_pulse_29),
	.data103	(eq_head_csrbus_read_data_30),
	.sel103	(eq_head_select_pulse_30),
	.data104	(eq_head_csrbus_read_data_31),
	.sel104	(eq_head_select_pulse_31),
	.data105	(eq_head_csrbus_read_data_32),
	.sel105	(eq_head_select_pulse_32),
	.data106	(eq_head_csrbus_read_data_33),
	.sel106	(eq_head_select_pulse_33),
	.data107	(eq_head_csrbus_read_data_34),
	.sel107	(eq_head_select_pulse_34),
	.data108	(eq_head_csrbus_read_data_35),
	.sel108	(eq_head_select_pulse_35),
	.out	(read_data_0_out)
	);


//====================================================
//     Instantiation of registers
//====================================================

wire eq_base_address_w_ld =eq_base_address_select_pulse & daemon_csrbus_wr;

dmu_imu_eqs_csr_eq_base_address eq_base_address
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.eq_base_address_w_ld	(eq_base_address_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.eq_base_address_csrbus_read_data	(eq_base_address_csrbus_read_data),
	.eq_base_address_address_hw_read	(eq_base_address_address_hw_read)
	);

wire eq_tail_w_ld_0 =eq_tail_select_pulse_0 & daemon_csrbus_wr;
wire eq_tail_w_ld_1 =eq_tail_select_pulse_1 & daemon_csrbus_wr;
wire eq_tail_w_ld_2 =eq_tail_select_pulse_2 & daemon_csrbus_wr;
wire eq_tail_w_ld_3 =eq_tail_select_pulse_3 & daemon_csrbus_wr;
wire eq_tail_w_ld_4 =eq_tail_select_pulse_4 & daemon_csrbus_wr;
wire eq_tail_w_ld_5 =eq_tail_select_pulse_5 & daemon_csrbus_wr;
wire eq_tail_w_ld_6 =eq_tail_select_pulse_6 & daemon_csrbus_wr;
wire eq_tail_w_ld_7 =eq_tail_select_pulse_7 & daemon_csrbus_wr;
wire eq_tail_w_ld_8 =eq_tail_select_pulse_8 & daemon_csrbus_wr;
wire eq_tail_w_ld_9 =eq_tail_select_pulse_9 & daemon_csrbus_wr;
wire eq_tail_w_ld_10 =eq_tail_select_pulse_10 & daemon_csrbus_wr;
wire eq_tail_w_ld_11 =eq_tail_select_pulse_11 & daemon_csrbus_wr;
wire eq_tail_w_ld_12 =eq_tail_select_pulse_12 & daemon_csrbus_wr;
wire eq_tail_w_ld_13 =eq_tail_select_pulse_13 & daemon_csrbus_wr;
wire eq_tail_w_ld_14 =eq_tail_select_pulse_14 & daemon_csrbus_wr;
wire eq_tail_w_ld_15 =eq_tail_select_pulse_15 & daemon_csrbus_wr;
wire eq_tail_w_ld_16 =eq_tail_select_pulse_16 & daemon_csrbus_wr;
wire eq_tail_w_ld_17 =eq_tail_select_pulse_17 & daemon_csrbus_wr;
wire eq_tail_w_ld_18 =eq_tail_select_pulse_18 & daemon_csrbus_wr;
wire eq_tail_w_ld_19 =eq_tail_select_pulse_19 & daemon_csrbus_wr;
wire eq_tail_w_ld_20 =eq_tail_select_pulse_20 & daemon_csrbus_wr;
wire eq_tail_w_ld_21 =eq_tail_select_pulse_21 & daemon_csrbus_wr;
wire eq_tail_w_ld_22 =eq_tail_select_pulse_22 & daemon_csrbus_wr;
wire eq_tail_w_ld_23 =eq_tail_select_pulse_23 & daemon_csrbus_wr;
wire eq_tail_w_ld_24 =eq_tail_select_pulse_24 & daemon_csrbus_wr;
wire eq_tail_w_ld_25 =eq_tail_select_pulse_25 & daemon_csrbus_wr;
wire eq_tail_w_ld_26 =eq_tail_select_pulse_26 & daemon_csrbus_wr;
wire eq_tail_w_ld_27 =eq_tail_select_pulse_27 & daemon_csrbus_wr;
wire eq_tail_w_ld_28 =eq_tail_select_pulse_28 & daemon_csrbus_wr;
wire eq_tail_w_ld_29 =eq_tail_select_pulse_29 & daemon_csrbus_wr;
wire eq_tail_w_ld_30 =eq_tail_select_pulse_30 & daemon_csrbus_wr;
wire eq_tail_w_ld_31 =eq_tail_select_pulse_31 & daemon_csrbus_wr;
wire eq_tail_w_ld_32 =eq_tail_select_pulse_32 & daemon_csrbus_wr;
wire eq_tail_w_ld_33 =eq_tail_select_pulse_33 & daemon_csrbus_wr;
wire eq_tail_w_ld_34 =eq_tail_select_pulse_34 & daemon_csrbus_wr;
wire eq_tail_w_ld_35 =eq_tail_select_pulse_35 & daemon_csrbus_wr;

dmu_imu_eqs_csr_eq_tail eq_tail
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.eq_tail_w_ld_0	(eq_tail_w_ld_0),
	.eq_tail_w_ld_1	(eq_tail_w_ld_1),
	.eq_tail_w_ld_2	(eq_tail_w_ld_2),
	.eq_tail_w_ld_3	(eq_tail_w_ld_3),
	.eq_tail_w_ld_4	(eq_tail_w_ld_4),
	.eq_tail_w_ld_5	(eq_tail_w_ld_5),
	.eq_tail_w_ld_6	(eq_tail_w_ld_6),
	.eq_tail_w_ld_7	(eq_tail_w_ld_7),
	.eq_tail_w_ld_8	(eq_tail_w_ld_8),
	.eq_tail_w_ld_9	(eq_tail_w_ld_9),
	.eq_tail_w_ld_10	(eq_tail_w_ld_10),
	.eq_tail_w_ld_11	(eq_tail_w_ld_11),
	.eq_tail_w_ld_12	(eq_tail_w_ld_12),
	.eq_tail_w_ld_13	(eq_tail_w_ld_13),
	.eq_tail_w_ld_14	(eq_tail_w_ld_14),
	.eq_tail_w_ld_15	(eq_tail_w_ld_15),
	.eq_tail_w_ld_16	(eq_tail_w_ld_16),
	.eq_tail_w_ld_17	(eq_tail_w_ld_17),
	.eq_tail_w_ld_18	(eq_tail_w_ld_18),
	.eq_tail_w_ld_19	(eq_tail_w_ld_19),
	.eq_tail_w_ld_20	(eq_tail_w_ld_20),
	.eq_tail_w_ld_21	(eq_tail_w_ld_21),
	.eq_tail_w_ld_22	(eq_tail_w_ld_22),
	.eq_tail_w_ld_23	(eq_tail_w_ld_23),
	.eq_tail_w_ld_24	(eq_tail_w_ld_24),
	.eq_tail_w_ld_25	(eq_tail_w_ld_25),
	.eq_tail_w_ld_26	(eq_tail_w_ld_26),
	.eq_tail_w_ld_27	(eq_tail_w_ld_27),
	.eq_tail_w_ld_28	(eq_tail_w_ld_28),
	.eq_tail_w_ld_29	(eq_tail_w_ld_29),
	.eq_tail_w_ld_30	(eq_tail_w_ld_30),
	.eq_tail_w_ld_31	(eq_tail_w_ld_31),
	.eq_tail_w_ld_32	(eq_tail_w_ld_32),
	.eq_tail_w_ld_33	(eq_tail_w_ld_33),
	.eq_tail_w_ld_34	(eq_tail_w_ld_34),
	.eq_tail_w_ld_35	(eq_tail_w_ld_35),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.eq_tail_csrbus_read_data_0	(eq_tail_csrbus_read_data_0),
	.eq_tail_csrbus_read_data_1	(eq_tail_csrbus_read_data_1),
	.eq_tail_csrbus_read_data_2	(eq_tail_csrbus_read_data_2),
	.eq_tail_csrbus_read_data_3	(eq_tail_csrbus_read_data_3),
	.eq_tail_csrbus_read_data_4	(eq_tail_csrbus_read_data_4),
	.eq_tail_csrbus_read_data_5	(eq_tail_csrbus_read_data_5),
	.eq_tail_csrbus_read_data_6	(eq_tail_csrbus_read_data_6),
	.eq_tail_csrbus_read_data_7	(eq_tail_csrbus_read_data_7),
	.eq_tail_csrbus_read_data_8	(eq_tail_csrbus_read_data_8),
	.eq_tail_csrbus_read_data_9	(eq_tail_csrbus_read_data_9),
	.eq_tail_csrbus_read_data_10	(eq_tail_csrbus_read_data_10),
	.eq_tail_csrbus_read_data_11	(eq_tail_csrbus_read_data_11),
	.eq_tail_csrbus_read_data_12	(eq_tail_csrbus_read_data_12),
	.eq_tail_csrbus_read_data_13	(eq_tail_csrbus_read_data_13),
	.eq_tail_csrbus_read_data_14	(eq_tail_csrbus_read_data_14),
	.eq_tail_csrbus_read_data_15	(eq_tail_csrbus_read_data_15),
	.eq_tail_csrbus_read_data_16	(eq_tail_csrbus_read_data_16),
	.eq_tail_csrbus_read_data_17	(eq_tail_csrbus_read_data_17),
	.eq_tail_csrbus_read_data_18	(eq_tail_csrbus_read_data_18),
	.eq_tail_csrbus_read_data_19	(eq_tail_csrbus_read_data_19),
	.eq_tail_csrbus_read_data_20	(eq_tail_csrbus_read_data_20),
	.eq_tail_csrbus_read_data_21	(eq_tail_csrbus_read_data_21),
	.eq_tail_csrbus_read_data_22	(eq_tail_csrbus_read_data_22),
	.eq_tail_csrbus_read_data_23	(eq_tail_csrbus_read_data_23),
	.eq_tail_csrbus_read_data_24	(eq_tail_csrbus_read_data_24),
	.eq_tail_csrbus_read_data_25	(eq_tail_csrbus_read_data_25),
	.eq_tail_csrbus_read_data_26	(eq_tail_csrbus_read_data_26),
	.eq_tail_csrbus_read_data_27	(eq_tail_csrbus_read_data_27),
	.eq_tail_csrbus_read_data_28	(eq_tail_csrbus_read_data_28),
	.eq_tail_csrbus_read_data_29	(eq_tail_csrbus_read_data_29),
	.eq_tail_csrbus_read_data_30	(eq_tail_csrbus_read_data_30),
	.eq_tail_csrbus_read_data_31	(eq_tail_csrbus_read_data_31),
	.eq_tail_csrbus_read_data_32	(eq_tail_csrbus_read_data_32),
	.eq_tail_csrbus_read_data_33	(eq_tail_csrbus_read_data_33),
	.eq_tail_csrbus_read_data_34	(eq_tail_csrbus_read_data_34),
	.eq_tail_csrbus_read_data_35	(eq_tail_csrbus_read_data_35),
	.eq_tail_overr_hw_ld_0	(eq_tail_overr_hw_ld_0),
	.eq_tail_overr_hw_ld_1	(eq_tail_overr_hw_ld_1),
	.eq_tail_overr_hw_ld_2	(eq_tail_overr_hw_ld_2),
	.eq_tail_overr_hw_ld_3	(eq_tail_overr_hw_ld_3),
	.eq_tail_overr_hw_ld_4	(eq_tail_overr_hw_ld_4),
	.eq_tail_overr_hw_ld_5	(eq_tail_overr_hw_ld_5),
	.eq_tail_overr_hw_ld_6	(eq_tail_overr_hw_ld_6),
	.eq_tail_overr_hw_ld_7	(eq_tail_overr_hw_ld_7),
	.eq_tail_overr_hw_ld_8	(eq_tail_overr_hw_ld_8),
	.eq_tail_overr_hw_ld_9	(eq_tail_overr_hw_ld_9),
	.eq_tail_overr_hw_ld_10	(eq_tail_overr_hw_ld_10),
	.eq_tail_overr_hw_ld_11	(eq_tail_overr_hw_ld_11),
	.eq_tail_overr_hw_ld_12	(eq_tail_overr_hw_ld_12),
	.eq_tail_overr_hw_ld_13	(eq_tail_overr_hw_ld_13),
	.eq_tail_overr_hw_ld_14	(eq_tail_overr_hw_ld_14),
	.eq_tail_overr_hw_ld_15	(eq_tail_overr_hw_ld_15),
	.eq_tail_overr_hw_ld_16	(eq_tail_overr_hw_ld_16),
	.eq_tail_overr_hw_ld_17	(eq_tail_overr_hw_ld_17),
	.eq_tail_overr_hw_ld_18	(eq_tail_overr_hw_ld_18),
	.eq_tail_overr_hw_ld_19	(eq_tail_overr_hw_ld_19),
	.eq_tail_overr_hw_ld_20	(eq_tail_overr_hw_ld_20),
	.eq_tail_overr_hw_ld_21	(eq_tail_overr_hw_ld_21),
	.eq_tail_overr_hw_ld_22	(eq_tail_overr_hw_ld_22),
	.eq_tail_overr_hw_ld_23	(eq_tail_overr_hw_ld_23),
	.eq_tail_overr_hw_ld_24	(eq_tail_overr_hw_ld_24),
	.eq_tail_overr_hw_ld_25	(eq_tail_overr_hw_ld_25),
	.eq_tail_overr_hw_ld_26	(eq_tail_overr_hw_ld_26),
	.eq_tail_overr_hw_ld_27	(eq_tail_overr_hw_ld_27),
	.eq_tail_overr_hw_ld_28	(eq_tail_overr_hw_ld_28),
	.eq_tail_overr_hw_ld_29	(eq_tail_overr_hw_ld_29),
	.eq_tail_overr_hw_ld_30	(eq_tail_overr_hw_ld_30),
	.eq_tail_overr_hw_ld_31	(eq_tail_overr_hw_ld_31),
	.eq_tail_overr_hw_ld_32	(eq_tail_overr_hw_ld_32),
	.eq_tail_overr_hw_ld_33	(eq_tail_overr_hw_ld_33),
	.eq_tail_overr_hw_ld_34	(eq_tail_overr_hw_ld_34),
	.eq_tail_overr_hw_ld_35	(eq_tail_overr_hw_ld_35),
	.eq_tail_overr_hw_write_0	(eq_tail_overr_hw_write_0),
	.eq_tail_overr_hw_write_1	(eq_tail_overr_hw_write_1),
	.eq_tail_overr_hw_write_2	(eq_tail_overr_hw_write_2),
	.eq_tail_overr_hw_write_3	(eq_tail_overr_hw_write_3),
	.eq_tail_overr_hw_write_4	(eq_tail_overr_hw_write_4),
	.eq_tail_overr_hw_write_5	(eq_tail_overr_hw_write_5),
	.eq_tail_overr_hw_write_6	(eq_tail_overr_hw_write_6),
	.eq_tail_overr_hw_write_7	(eq_tail_overr_hw_write_7),
	.eq_tail_overr_hw_write_8	(eq_tail_overr_hw_write_8),
	.eq_tail_overr_hw_write_9	(eq_tail_overr_hw_write_9),
	.eq_tail_overr_hw_write_10	(eq_tail_overr_hw_write_10),
	.eq_tail_overr_hw_write_11	(eq_tail_overr_hw_write_11),
	.eq_tail_overr_hw_write_12	(eq_tail_overr_hw_write_12),
	.eq_tail_overr_hw_write_13	(eq_tail_overr_hw_write_13),
	.eq_tail_overr_hw_write_14	(eq_tail_overr_hw_write_14),
	.eq_tail_overr_hw_write_15	(eq_tail_overr_hw_write_15),
	.eq_tail_overr_hw_write_16	(eq_tail_overr_hw_write_16),
	.eq_tail_overr_hw_write_17	(eq_tail_overr_hw_write_17),
	.eq_tail_overr_hw_write_18	(eq_tail_overr_hw_write_18),
	.eq_tail_overr_hw_write_19	(eq_tail_overr_hw_write_19),
	.eq_tail_overr_hw_write_20	(eq_tail_overr_hw_write_20),
	.eq_tail_overr_hw_write_21	(eq_tail_overr_hw_write_21),
	.eq_tail_overr_hw_write_22	(eq_tail_overr_hw_write_22),
	.eq_tail_overr_hw_write_23	(eq_tail_overr_hw_write_23),
	.eq_tail_overr_hw_write_24	(eq_tail_overr_hw_write_24),
	.eq_tail_overr_hw_write_25	(eq_tail_overr_hw_write_25),
	.eq_tail_overr_hw_write_26	(eq_tail_overr_hw_write_26),
	.eq_tail_overr_hw_write_27	(eq_tail_overr_hw_write_27),
	.eq_tail_overr_hw_write_28	(eq_tail_overr_hw_write_28),
	.eq_tail_overr_hw_write_29	(eq_tail_overr_hw_write_29),
	.eq_tail_overr_hw_write_30	(eq_tail_overr_hw_write_30),
	.eq_tail_overr_hw_write_31	(eq_tail_overr_hw_write_31),
	.eq_tail_overr_hw_write_32	(eq_tail_overr_hw_write_32),
	.eq_tail_overr_hw_write_33	(eq_tail_overr_hw_write_33),
	.eq_tail_overr_hw_write_34	(eq_tail_overr_hw_write_34),
	.eq_tail_overr_hw_write_35	(eq_tail_overr_hw_write_35),
	.eq_tail_tail_hw_ld_0	(eq_tail_tail_hw_ld_0),
	.eq_tail_tail_hw_ld_1	(eq_tail_tail_hw_ld_1),
	.eq_tail_tail_hw_ld_2	(eq_tail_tail_hw_ld_2),
	.eq_tail_tail_hw_ld_3	(eq_tail_tail_hw_ld_3),
	.eq_tail_tail_hw_ld_4	(eq_tail_tail_hw_ld_4),
	.eq_tail_tail_hw_ld_5	(eq_tail_tail_hw_ld_5),
	.eq_tail_tail_hw_ld_6	(eq_tail_tail_hw_ld_6),
	.eq_tail_tail_hw_ld_7	(eq_tail_tail_hw_ld_7),
	.eq_tail_tail_hw_ld_8	(eq_tail_tail_hw_ld_8),
	.eq_tail_tail_hw_ld_9	(eq_tail_tail_hw_ld_9),
	.eq_tail_tail_hw_ld_10	(eq_tail_tail_hw_ld_10),
	.eq_tail_tail_hw_ld_11	(eq_tail_tail_hw_ld_11),
	.eq_tail_tail_hw_ld_12	(eq_tail_tail_hw_ld_12),
	.eq_tail_tail_hw_ld_13	(eq_tail_tail_hw_ld_13),
	.eq_tail_tail_hw_ld_14	(eq_tail_tail_hw_ld_14),
	.eq_tail_tail_hw_ld_15	(eq_tail_tail_hw_ld_15),
	.eq_tail_tail_hw_ld_16	(eq_tail_tail_hw_ld_16),
	.eq_tail_tail_hw_ld_17	(eq_tail_tail_hw_ld_17),
	.eq_tail_tail_hw_ld_18	(eq_tail_tail_hw_ld_18),
	.eq_tail_tail_hw_ld_19	(eq_tail_tail_hw_ld_19),
	.eq_tail_tail_hw_ld_20	(eq_tail_tail_hw_ld_20),
	.eq_tail_tail_hw_ld_21	(eq_tail_tail_hw_ld_21),
	.eq_tail_tail_hw_ld_22	(eq_tail_tail_hw_ld_22),
	.eq_tail_tail_hw_ld_23	(eq_tail_tail_hw_ld_23),
	.eq_tail_tail_hw_ld_24	(eq_tail_tail_hw_ld_24),
	.eq_tail_tail_hw_ld_25	(eq_tail_tail_hw_ld_25),
	.eq_tail_tail_hw_ld_26	(eq_tail_tail_hw_ld_26),
	.eq_tail_tail_hw_ld_27	(eq_tail_tail_hw_ld_27),
	.eq_tail_tail_hw_ld_28	(eq_tail_tail_hw_ld_28),
	.eq_tail_tail_hw_ld_29	(eq_tail_tail_hw_ld_29),
	.eq_tail_tail_hw_ld_30	(eq_tail_tail_hw_ld_30),
	.eq_tail_tail_hw_ld_31	(eq_tail_tail_hw_ld_31),
	.eq_tail_tail_hw_ld_32	(eq_tail_tail_hw_ld_32),
	.eq_tail_tail_hw_ld_33	(eq_tail_tail_hw_ld_33),
	.eq_tail_tail_hw_ld_34	(eq_tail_tail_hw_ld_34),
	.eq_tail_tail_hw_ld_35	(eq_tail_tail_hw_ld_35),
	.eq_tail_tail_hw_write_0	(eq_tail_tail_hw_write_0),
	.eq_tail_tail_hw_write_1	(eq_tail_tail_hw_write_1),
	.eq_tail_tail_hw_write_2	(eq_tail_tail_hw_write_2),
	.eq_tail_tail_hw_write_3	(eq_tail_tail_hw_write_3),
	.eq_tail_tail_hw_write_4	(eq_tail_tail_hw_write_4),
	.eq_tail_tail_hw_write_5	(eq_tail_tail_hw_write_5),
	.eq_tail_tail_hw_write_6	(eq_tail_tail_hw_write_6),
	.eq_tail_tail_hw_write_7	(eq_tail_tail_hw_write_7),
	.eq_tail_tail_hw_write_8	(eq_tail_tail_hw_write_8),
	.eq_tail_tail_hw_write_9	(eq_tail_tail_hw_write_9),
	.eq_tail_tail_hw_write_10	(eq_tail_tail_hw_write_10),
	.eq_tail_tail_hw_write_11	(eq_tail_tail_hw_write_11),
	.eq_tail_tail_hw_write_12	(eq_tail_tail_hw_write_12),
	.eq_tail_tail_hw_write_13	(eq_tail_tail_hw_write_13),
	.eq_tail_tail_hw_write_14	(eq_tail_tail_hw_write_14),
	.eq_tail_tail_hw_write_15	(eq_tail_tail_hw_write_15),
	.eq_tail_tail_hw_write_16	(eq_tail_tail_hw_write_16),
	.eq_tail_tail_hw_write_17	(eq_tail_tail_hw_write_17),
	.eq_tail_tail_hw_write_18	(eq_tail_tail_hw_write_18),
	.eq_tail_tail_hw_write_19	(eq_tail_tail_hw_write_19),
	.eq_tail_tail_hw_write_20	(eq_tail_tail_hw_write_20),
	.eq_tail_tail_hw_write_21	(eq_tail_tail_hw_write_21),
	.eq_tail_tail_hw_write_22	(eq_tail_tail_hw_write_22),
	.eq_tail_tail_hw_write_23	(eq_tail_tail_hw_write_23),
	.eq_tail_tail_hw_write_24	(eq_tail_tail_hw_write_24),
	.eq_tail_tail_hw_write_25	(eq_tail_tail_hw_write_25),
	.eq_tail_tail_hw_write_26	(eq_tail_tail_hw_write_26),
	.eq_tail_tail_hw_write_27	(eq_tail_tail_hw_write_27),
	.eq_tail_tail_hw_write_28	(eq_tail_tail_hw_write_28),
	.eq_tail_tail_hw_write_29	(eq_tail_tail_hw_write_29),
	.eq_tail_tail_hw_write_30	(eq_tail_tail_hw_write_30),
	.eq_tail_tail_hw_write_31	(eq_tail_tail_hw_write_31),
	.eq_tail_tail_hw_write_32	(eq_tail_tail_hw_write_32),
	.eq_tail_tail_hw_write_33	(eq_tail_tail_hw_write_33),
	.eq_tail_tail_hw_write_34	(eq_tail_tail_hw_write_34),
	.eq_tail_tail_hw_write_35	(eq_tail_tail_hw_write_35),
	.eq_tail_tail_hw_read_0	(eq_tail_tail_hw_read_0),
	.eq_tail_tail_hw_read_1	(eq_tail_tail_hw_read_1),
	.eq_tail_tail_hw_read_2	(eq_tail_tail_hw_read_2),
	.eq_tail_tail_hw_read_3	(eq_tail_tail_hw_read_3),
	.eq_tail_tail_hw_read_4	(eq_tail_tail_hw_read_4),
	.eq_tail_tail_hw_read_5	(eq_tail_tail_hw_read_5),
	.eq_tail_tail_hw_read_6	(eq_tail_tail_hw_read_6),
	.eq_tail_tail_hw_read_7	(eq_tail_tail_hw_read_7),
	.eq_tail_tail_hw_read_8	(eq_tail_tail_hw_read_8),
	.eq_tail_tail_hw_read_9	(eq_tail_tail_hw_read_9),
	.eq_tail_tail_hw_read_10	(eq_tail_tail_hw_read_10),
	.eq_tail_tail_hw_read_11	(eq_tail_tail_hw_read_11),
	.eq_tail_tail_hw_read_12	(eq_tail_tail_hw_read_12),
	.eq_tail_tail_hw_read_13	(eq_tail_tail_hw_read_13),
	.eq_tail_tail_hw_read_14	(eq_tail_tail_hw_read_14),
	.eq_tail_tail_hw_read_15	(eq_tail_tail_hw_read_15),
	.eq_tail_tail_hw_read_16	(eq_tail_tail_hw_read_16),
	.eq_tail_tail_hw_read_17	(eq_tail_tail_hw_read_17),
	.eq_tail_tail_hw_read_18	(eq_tail_tail_hw_read_18),
	.eq_tail_tail_hw_read_19	(eq_tail_tail_hw_read_19),
	.eq_tail_tail_hw_read_20	(eq_tail_tail_hw_read_20),
	.eq_tail_tail_hw_read_21	(eq_tail_tail_hw_read_21),
	.eq_tail_tail_hw_read_22	(eq_tail_tail_hw_read_22),
	.eq_tail_tail_hw_read_23	(eq_tail_tail_hw_read_23),
	.eq_tail_tail_hw_read_24	(eq_tail_tail_hw_read_24),
	.eq_tail_tail_hw_read_25	(eq_tail_tail_hw_read_25),
	.eq_tail_tail_hw_read_26	(eq_tail_tail_hw_read_26),
	.eq_tail_tail_hw_read_27	(eq_tail_tail_hw_read_27),
	.eq_tail_tail_hw_read_28	(eq_tail_tail_hw_read_28),
	.eq_tail_tail_hw_read_29	(eq_tail_tail_hw_read_29),
	.eq_tail_tail_hw_read_30	(eq_tail_tail_hw_read_30),
	.eq_tail_tail_hw_read_31	(eq_tail_tail_hw_read_31),
	.eq_tail_tail_hw_read_32	(eq_tail_tail_hw_read_32),
	.eq_tail_tail_hw_read_33	(eq_tail_tail_hw_read_33),
	.eq_tail_tail_hw_read_34	(eq_tail_tail_hw_read_34),
	.eq_tail_tail_hw_read_35	(eq_tail_tail_hw_read_35)
	);

wire eq_head_w_ld_0 =eq_head_select_pulse_0 & daemon_csrbus_wr;
wire eq_head_w_ld_1 =eq_head_select_pulse_1 & daemon_csrbus_wr;
wire eq_head_w_ld_2 =eq_head_select_pulse_2 & daemon_csrbus_wr;
wire eq_head_w_ld_3 =eq_head_select_pulse_3 & daemon_csrbus_wr;
wire eq_head_w_ld_4 =eq_head_select_pulse_4 & daemon_csrbus_wr;
wire eq_head_w_ld_5 =eq_head_select_pulse_5 & daemon_csrbus_wr;
wire eq_head_w_ld_6 =eq_head_select_pulse_6 & daemon_csrbus_wr;
wire eq_head_w_ld_7 =eq_head_select_pulse_7 & daemon_csrbus_wr;
wire eq_head_w_ld_8 =eq_head_select_pulse_8 & daemon_csrbus_wr;
wire eq_head_w_ld_9 =eq_head_select_pulse_9 & daemon_csrbus_wr;
wire eq_head_w_ld_10 =eq_head_select_pulse_10 & daemon_csrbus_wr;
wire eq_head_w_ld_11 =eq_head_select_pulse_11 & daemon_csrbus_wr;
wire eq_head_w_ld_12 =eq_head_select_pulse_12 & daemon_csrbus_wr;
wire eq_head_w_ld_13 =eq_head_select_pulse_13 & daemon_csrbus_wr;
wire eq_head_w_ld_14 =eq_head_select_pulse_14 & daemon_csrbus_wr;
wire eq_head_w_ld_15 =eq_head_select_pulse_15 & daemon_csrbus_wr;
wire eq_head_w_ld_16 =eq_head_select_pulse_16 & daemon_csrbus_wr;
wire eq_head_w_ld_17 =eq_head_select_pulse_17 & daemon_csrbus_wr;
wire eq_head_w_ld_18 =eq_head_select_pulse_18 & daemon_csrbus_wr;
wire eq_head_w_ld_19 =eq_head_select_pulse_19 & daemon_csrbus_wr;
wire eq_head_w_ld_20 =eq_head_select_pulse_20 & daemon_csrbus_wr;
wire eq_head_w_ld_21 =eq_head_select_pulse_21 & daemon_csrbus_wr;
wire eq_head_w_ld_22 =eq_head_select_pulse_22 & daemon_csrbus_wr;
wire eq_head_w_ld_23 =eq_head_select_pulse_23 & daemon_csrbus_wr;
wire eq_head_w_ld_24 =eq_head_select_pulse_24 & daemon_csrbus_wr;
wire eq_head_w_ld_25 =eq_head_select_pulse_25 & daemon_csrbus_wr;
wire eq_head_w_ld_26 =eq_head_select_pulse_26 & daemon_csrbus_wr;
wire eq_head_w_ld_27 =eq_head_select_pulse_27 & daemon_csrbus_wr;
wire eq_head_w_ld_28 =eq_head_select_pulse_28 & daemon_csrbus_wr;
wire eq_head_w_ld_29 =eq_head_select_pulse_29 & daemon_csrbus_wr;
wire eq_head_w_ld_30 =eq_head_select_pulse_30 & daemon_csrbus_wr;
wire eq_head_w_ld_31 =eq_head_select_pulse_31 & daemon_csrbus_wr;
wire eq_head_w_ld_32 =eq_head_select_pulse_32 & daemon_csrbus_wr;
wire eq_head_w_ld_33 =eq_head_select_pulse_33 & daemon_csrbus_wr;
wire eq_head_w_ld_34 =eq_head_select_pulse_34 & daemon_csrbus_wr;
wire eq_head_w_ld_35 =eq_head_select_pulse_35 & daemon_csrbus_wr;

dmu_imu_eqs_csr_eq_head eq_head
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.eq_head_w_ld_0	(eq_head_w_ld_0),
	.eq_head_w_ld_1	(eq_head_w_ld_1),
	.eq_head_w_ld_2	(eq_head_w_ld_2),
	.eq_head_w_ld_3	(eq_head_w_ld_3),
	.eq_head_w_ld_4	(eq_head_w_ld_4),
	.eq_head_w_ld_5	(eq_head_w_ld_5),
	.eq_head_w_ld_6	(eq_head_w_ld_6),
	.eq_head_w_ld_7	(eq_head_w_ld_7),
	.eq_head_w_ld_8	(eq_head_w_ld_8),
	.eq_head_w_ld_9	(eq_head_w_ld_9),
	.eq_head_w_ld_10	(eq_head_w_ld_10),
	.eq_head_w_ld_11	(eq_head_w_ld_11),
	.eq_head_w_ld_12	(eq_head_w_ld_12),
	.eq_head_w_ld_13	(eq_head_w_ld_13),
	.eq_head_w_ld_14	(eq_head_w_ld_14),
	.eq_head_w_ld_15	(eq_head_w_ld_15),
	.eq_head_w_ld_16	(eq_head_w_ld_16),
	.eq_head_w_ld_17	(eq_head_w_ld_17),
	.eq_head_w_ld_18	(eq_head_w_ld_18),
	.eq_head_w_ld_19	(eq_head_w_ld_19),
	.eq_head_w_ld_20	(eq_head_w_ld_20),
	.eq_head_w_ld_21	(eq_head_w_ld_21),
	.eq_head_w_ld_22	(eq_head_w_ld_22),
	.eq_head_w_ld_23	(eq_head_w_ld_23),
	.eq_head_w_ld_24	(eq_head_w_ld_24),
	.eq_head_w_ld_25	(eq_head_w_ld_25),
	.eq_head_w_ld_26	(eq_head_w_ld_26),
	.eq_head_w_ld_27	(eq_head_w_ld_27),
	.eq_head_w_ld_28	(eq_head_w_ld_28),
	.eq_head_w_ld_29	(eq_head_w_ld_29),
	.eq_head_w_ld_30	(eq_head_w_ld_30),
	.eq_head_w_ld_31	(eq_head_w_ld_31),
	.eq_head_w_ld_32	(eq_head_w_ld_32),
	.eq_head_w_ld_33	(eq_head_w_ld_33),
	.eq_head_w_ld_34	(eq_head_w_ld_34),
	.eq_head_w_ld_35	(eq_head_w_ld_35),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.eq_head_csrbus_read_data_0	(eq_head_csrbus_read_data_0),
	.eq_head_csrbus_read_data_1	(eq_head_csrbus_read_data_1),
	.eq_head_csrbus_read_data_2	(eq_head_csrbus_read_data_2),
	.eq_head_csrbus_read_data_3	(eq_head_csrbus_read_data_3),
	.eq_head_csrbus_read_data_4	(eq_head_csrbus_read_data_4),
	.eq_head_csrbus_read_data_5	(eq_head_csrbus_read_data_5),
	.eq_head_csrbus_read_data_6	(eq_head_csrbus_read_data_6),
	.eq_head_csrbus_read_data_7	(eq_head_csrbus_read_data_7),
	.eq_head_csrbus_read_data_8	(eq_head_csrbus_read_data_8),
	.eq_head_csrbus_read_data_9	(eq_head_csrbus_read_data_9),
	.eq_head_csrbus_read_data_10	(eq_head_csrbus_read_data_10),
	.eq_head_csrbus_read_data_11	(eq_head_csrbus_read_data_11),
	.eq_head_csrbus_read_data_12	(eq_head_csrbus_read_data_12),
	.eq_head_csrbus_read_data_13	(eq_head_csrbus_read_data_13),
	.eq_head_csrbus_read_data_14	(eq_head_csrbus_read_data_14),
	.eq_head_csrbus_read_data_15	(eq_head_csrbus_read_data_15),
	.eq_head_csrbus_read_data_16	(eq_head_csrbus_read_data_16),
	.eq_head_csrbus_read_data_17	(eq_head_csrbus_read_data_17),
	.eq_head_csrbus_read_data_18	(eq_head_csrbus_read_data_18),
	.eq_head_csrbus_read_data_19	(eq_head_csrbus_read_data_19),
	.eq_head_csrbus_read_data_20	(eq_head_csrbus_read_data_20),
	.eq_head_csrbus_read_data_21	(eq_head_csrbus_read_data_21),
	.eq_head_csrbus_read_data_22	(eq_head_csrbus_read_data_22),
	.eq_head_csrbus_read_data_23	(eq_head_csrbus_read_data_23),
	.eq_head_csrbus_read_data_24	(eq_head_csrbus_read_data_24),
	.eq_head_csrbus_read_data_25	(eq_head_csrbus_read_data_25),
	.eq_head_csrbus_read_data_26	(eq_head_csrbus_read_data_26),
	.eq_head_csrbus_read_data_27	(eq_head_csrbus_read_data_27),
	.eq_head_csrbus_read_data_28	(eq_head_csrbus_read_data_28),
	.eq_head_csrbus_read_data_29	(eq_head_csrbus_read_data_29),
	.eq_head_csrbus_read_data_30	(eq_head_csrbus_read_data_30),
	.eq_head_csrbus_read_data_31	(eq_head_csrbus_read_data_31),
	.eq_head_csrbus_read_data_32	(eq_head_csrbus_read_data_32),
	.eq_head_csrbus_read_data_33	(eq_head_csrbus_read_data_33),
	.eq_head_csrbus_read_data_34	(eq_head_csrbus_read_data_34),
	.eq_head_csrbus_read_data_35	(eq_head_csrbus_read_data_35),
	.eq_head_head_hw_read_0	(eq_head_head_hw_read_0),
	.eq_head_head_hw_read_1	(eq_head_head_hw_read_1),
	.eq_head_head_hw_read_2	(eq_head_head_hw_read_2),
	.eq_head_head_hw_read_3	(eq_head_head_hw_read_3),
	.eq_head_head_hw_read_4	(eq_head_head_hw_read_4),
	.eq_head_head_hw_read_5	(eq_head_head_hw_read_5),
	.eq_head_head_hw_read_6	(eq_head_head_hw_read_6),
	.eq_head_head_hw_read_7	(eq_head_head_hw_read_7),
	.eq_head_head_hw_read_8	(eq_head_head_hw_read_8),
	.eq_head_head_hw_read_9	(eq_head_head_hw_read_9),
	.eq_head_head_hw_read_10	(eq_head_head_hw_read_10),
	.eq_head_head_hw_read_11	(eq_head_head_hw_read_11),
	.eq_head_head_hw_read_12	(eq_head_head_hw_read_12),
	.eq_head_head_hw_read_13	(eq_head_head_hw_read_13),
	.eq_head_head_hw_read_14	(eq_head_head_hw_read_14),
	.eq_head_head_hw_read_15	(eq_head_head_hw_read_15),
	.eq_head_head_hw_read_16	(eq_head_head_hw_read_16),
	.eq_head_head_hw_read_17	(eq_head_head_hw_read_17),
	.eq_head_head_hw_read_18	(eq_head_head_hw_read_18),
	.eq_head_head_hw_read_19	(eq_head_head_hw_read_19),
	.eq_head_head_hw_read_20	(eq_head_head_hw_read_20),
	.eq_head_head_hw_read_21	(eq_head_head_hw_read_21),
	.eq_head_head_hw_read_22	(eq_head_head_hw_read_22),
	.eq_head_head_hw_read_23	(eq_head_head_hw_read_23),
	.eq_head_head_hw_read_24	(eq_head_head_hw_read_24),
	.eq_head_head_hw_read_25	(eq_head_head_hw_read_25),
	.eq_head_head_hw_read_26	(eq_head_head_hw_read_26),
	.eq_head_head_hw_read_27	(eq_head_head_hw_read_27),
	.eq_head_head_hw_read_28	(eq_head_head_hw_read_28),
	.eq_head_head_hw_read_29	(eq_head_head_hw_read_29),
	.eq_head_head_hw_read_30	(eq_head_head_hw_read_30),
	.eq_head_head_hw_read_31	(eq_head_head_hw_read_31),
	.eq_head_head_hw_read_32	(eq_head_head_hw_read_32),
	.eq_head_head_hw_read_33	(eq_head_head_hw_read_33),
	.eq_head_head_hw_read_34	(eq_head_head_hw_read_34),
	.eq_head_head_hw_read_35	(eq_head_head_hw_read_35)
	);

endmodule // dmu_imu_eqs_default_grp
