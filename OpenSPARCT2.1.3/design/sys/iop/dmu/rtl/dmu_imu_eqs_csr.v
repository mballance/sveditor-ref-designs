// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_eqs_csr.v
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
module dmu_imu_eqs_csr 
	(
	clk,
	csrbus_addr,
	csrbus_wr_data,
	csrbus_wr,
	csrbus_valid,
	csrbus_mapped,
	csrbus_done,
	csrbus_read_data,
	rst_l,
	csrbus_src_bus,
	csrbus_acc_vio,
	instance_id,
	ext_wr,
	eq_base_address_address_hw_read,
	eq_ctrl_set_enoverr_ext_wr_data,
	eq_ctrl_set_en_ext_wr_data,
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
	eq_ctrl_clr_coverr_ext_wr_data,
	eq_ctrl_clr_e2i_ext_wr_data,
	eq_ctrl_clr_dis_ext_wr_data,
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
	eq_state_state_ext_read_data_0,
	eq_state_state_ext_read_data_1,
	eq_state_state_ext_read_data_2,
	eq_state_state_ext_read_data_3,
	eq_state_state_ext_read_data_4,
	eq_state_state_ext_read_data_5,
	eq_state_state_ext_read_data_6,
	eq_state_state_ext_read_data_7,
	eq_state_state_ext_read_data_8,
	eq_state_state_ext_read_data_9,
	eq_state_state_ext_read_data_10,
	eq_state_state_ext_read_data_11,
	eq_state_state_ext_read_data_12,
	eq_state_state_ext_read_data_13,
	eq_state_state_ext_read_data_14,
	eq_state_state_ext_read_data_15,
	eq_state_state_ext_read_data_16,
	eq_state_state_ext_read_data_17,
	eq_state_state_ext_read_data_18,
	eq_state_state_ext_read_data_19,
	eq_state_state_ext_read_data_20,
	eq_state_state_ext_read_data_21,
	eq_state_state_ext_read_data_22,
	eq_state_state_ext_read_data_23,
	eq_state_state_ext_read_data_24,
	eq_state_state_ext_read_data_25,
	eq_state_state_ext_read_data_26,
	eq_state_state_ext_read_data_27,
	eq_state_state_ext_read_data_28,
	eq_state_state_ext_read_data_29,
	eq_state_state_ext_read_data_30,
	eq_state_state_ext_read_data_31,
	eq_state_state_ext_read_data_32,
	eq_state_state_ext_read_data_33,
	eq_state_state_ext_read_data_34,
	eq_state_state_ext_read_data_35,
	eq_tail_overr_hw_ld_0,
	eq_tail_overr_hw_ld_1,
	eq_tail_overr_hw_ld_2,
	eq_tail_overr_hw_ld_3,
	eq_tail_overr_hw_ld_4,
	eq_tail_overr_hw_ld_5,
	eq_tail_overr_hw_ld_6,
	eq_tail_overr_hw_ld_7,
	eq_tail_overr_hw_ld_8,
	eq_tail_overr_hw_ld_9,
	eq_tail_overr_hw_ld_10,
	eq_tail_overr_hw_ld_11,
	eq_tail_overr_hw_ld_12,
	eq_tail_overr_hw_ld_13,
	eq_tail_overr_hw_ld_14,
	eq_tail_overr_hw_ld_15,
	eq_tail_overr_hw_ld_16,
	eq_tail_overr_hw_ld_17,
	eq_tail_overr_hw_ld_18,
	eq_tail_overr_hw_ld_19,
	eq_tail_overr_hw_ld_20,
	eq_tail_overr_hw_ld_21,
	eq_tail_overr_hw_ld_22,
	eq_tail_overr_hw_ld_23,
	eq_tail_overr_hw_ld_24,
	eq_tail_overr_hw_ld_25,
	eq_tail_overr_hw_ld_26,
	eq_tail_overr_hw_ld_27,
	eq_tail_overr_hw_ld_28,
	eq_tail_overr_hw_ld_29,
	eq_tail_overr_hw_ld_30,
	eq_tail_overr_hw_ld_31,
	eq_tail_overr_hw_ld_32,
	eq_tail_overr_hw_ld_33,
	eq_tail_overr_hw_ld_34,
	eq_tail_overr_hw_ld_35,
	eq_tail_overr_hw_write_0,
	eq_tail_overr_hw_write_1,
	eq_tail_overr_hw_write_2,
	eq_tail_overr_hw_write_3,
	eq_tail_overr_hw_write_4,
	eq_tail_overr_hw_write_5,
	eq_tail_overr_hw_write_6,
	eq_tail_overr_hw_write_7,
	eq_tail_overr_hw_write_8,
	eq_tail_overr_hw_write_9,
	eq_tail_overr_hw_write_10,
	eq_tail_overr_hw_write_11,
	eq_tail_overr_hw_write_12,
	eq_tail_overr_hw_write_13,
	eq_tail_overr_hw_write_14,
	eq_tail_overr_hw_write_15,
	eq_tail_overr_hw_write_16,
	eq_tail_overr_hw_write_17,
	eq_tail_overr_hw_write_18,
	eq_tail_overr_hw_write_19,
	eq_tail_overr_hw_write_20,
	eq_tail_overr_hw_write_21,
	eq_tail_overr_hw_write_22,
	eq_tail_overr_hw_write_23,
	eq_tail_overr_hw_write_24,
	eq_tail_overr_hw_write_25,
	eq_tail_overr_hw_write_26,
	eq_tail_overr_hw_write_27,
	eq_tail_overr_hw_write_28,
	eq_tail_overr_hw_write_29,
	eq_tail_overr_hw_write_30,
	eq_tail_overr_hw_write_31,
	eq_tail_overr_hw_write_32,
	eq_tail_overr_hw_write_33,
	eq_tail_overr_hw_write_34,
	eq_tail_overr_hw_write_35,
	eq_tail_tail_hw_ld_0,
	eq_tail_tail_hw_ld_1,
	eq_tail_tail_hw_ld_2,
	eq_tail_tail_hw_ld_3,
	eq_tail_tail_hw_ld_4,
	eq_tail_tail_hw_ld_5,
	eq_tail_tail_hw_ld_6,
	eq_tail_tail_hw_ld_7,
	eq_tail_tail_hw_ld_8,
	eq_tail_tail_hw_ld_9,
	eq_tail_tail_hw_ld_10,
	eq_tail_tail_hw_ld_11,
	eq_tail_tail_hw_ld_12,
	eq_tail_tail_hw_ld_13,
	eq_tail_tail_hw_ld_14,
	eq_tail_tail_hw_ld_15,
	eq_tail_tail_hw_ld_16,
	eq_tail_tail_hw_ld_17,
	eq_tail_tail_hw_ld_18,
	eq_tail_tail_hw_ld_19,
	eq_tail_tail_hw_ld_20,
	eq_tail_tail_hw_ld_21,
	eq_tail_tail_hw_ld_22,
	eq_tail_tail_hw_ld_23,
	eq_tail_tail_hw_ld_24,
	eq_tail_tail_hw_ld_25,
	eq_tail_tail_hw_ld_26,
	eq_tail_tail_hw_ld_27,
	eq_tail_tail_hw_ld_28,
	eq_tail_tail_hw_ld_29,
	eq_tail_tail_hw_ld_30,
	eq_tail_tail_hw_ld_31,
	eq_tail_tail_hw_ld_32,
	eq_tail_tail_hw_ld_33,
	eq_tail_tail_hw_ld_34,
	eq_tail_tail_hw_ld_35,
	eq_tail_tail_hw_write_0,
	eq_tail_tail_hw_write_1,
	eq_tail_tail_hw_write_2,
	eq_tail_tail_hw_write_3,
	eq_tail_tail_hw_write_4,
	eq_tail_tail_hw_write_5,
	eq_tail_tail_hw_write_6,
	eq_tail_tail_hw_write_7,
	eq_tail_tail_hw_write_8,
	eq_tail_tail_hw_write_9,
	eq_tail_tail_hw_write_10,
	eq_tail_tail_hw_write_11,
	eq_tail_tail_hw_write_12,
	eq_tail_tail_hw_write_13,
	eq_tail_tail_hw_write_14,
	eq_tail_tail_hw_write_15,
	eq_tail_tail_hw_write_16,
	eq_tail_tail_hw_write_17,
	eq_tail_tail_hw_write_18,
	eq_tail_tail_hw_write_19,
	eq_tail_tail_hw_write_20,
	eq_tail_tail_hw_write_21,
	eq_tail_tail_hw_write_22,
	eq_tail_tail_hw_write_23,
	eq_tail_tail_hw_write_24,
	eq_tail_tail_hw_write_25,
	eq_tail_tail_hw_write_26,
	eq_tail_tail_hw_write_27,
	eq_tail_tail_hw_write_28,
	eq_tail_tail_hw_write_29,
	eq_tail_tail_hw_write_30,
	eq_tail_tail_hw_write_31,
	eq_tail_tail_hw_write_32,
	eq_tail_tail_hw_write_33,
	eq_tail_tail_hw_write_34,
	eq_tail_tail_hw_write_35,
	eq_tail_tail_hw_read_0,
	eq_tail_tail_hw_read_1,
	eq_tail_tail_hw_read_2,
	eq_tail_tail_hw_read_3,
	eq_tail_tail_hw_read_4,
	eq_tail_tail_hw_read_5,
	eq_tail_tail_hw_read_6,
	eq_tail_tail_hw_read_7,
	eq_tail_tail_hw_read_8,
	eq_tail_tail_hw_read_9,
	eq_tail_tail_hw_read_10,
	eq_tail_tail_hw_read_11,
	eq_tail_tail_hw_read_12,
	eq_tail_tail_hw_read_13,
	eq_tail_tail_hw_read_14,
	eq_tail_tail_hw_read_15,
	eq_tail_tail_hw_read_16,
	eq_tail_tail_hw_read_17,
	eq_tail_tail_hw_read_18,
	eq_tail_tail_hw_read_19,
	eq_tail_tail_hw_read_20,
	eq_tail_tail_hw_read_21,
	eq_tail_tail_hw_read_22,
	eq_tail_tail_hw_read_23,
	eq_tail_tail_hw_read_24,
	eq_tail_tail_hw_read_25,
	eq_tail_tail_hw_read_26,
	eq_tail_tail_hw_read_27,
	eq_tail_tail_hw_read_28,
	eq_tail_tail_hw_read_29,
	eq_tail_tail_hw_read_30,
	eq_tail_tail_hw_read_31,
	eq_tail_tail_hw_read_32,
	eq_tail_tail_hw_read_33,
	eq_tail_tail_hw_read_34,
	eq_tail_tail_hw_read_35,
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
	eq_head_head_hw_read_35
	);

//====================================================
//     Polarity declarations
//====================================================
input  clk;  // Clock signal
input  [`FIRE_CSRBUS_ADDR_WIDTH-1:0] csrbus_addr;  // Address bus
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
input  csrbus_wr;  // Read/Write signal
input  csrbus_valid;  // Valid address
output csrbus_mapped;  // Address is mapped
output csrbus_done;  // Operation is done
output [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_read_data;  // SW read data bus
input  rst_l;  // Reset signal
input  [1:0] csrbus_src_bus;  // Source bus
output csrbus_acc_vio;  // Violation signal
input  instance_id;  // Instance ID
output ext_wr;  // When one, csr operation is a write. When zero, operation is a
                // read.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_BASE_ADDRESS_ADDRESS_INT_SLC] eq_base_address_address_hw_read;
    // This signal provides the current value of eq_base_address_address.
output eq_ctrl_set_enoverr_ext_wr_data;  // Provides SW write data for external
                                         // register "eq_ctrl_set", field
                                         // "enoverr"
output eq_ctrl_set_en_ext_wr_data;  // Provides SW write data for external
                                    // register "eq_ctrl_set", field "en"
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
output eq_ctrl_clr_coverr_ext_wr_data;  // Provides SW write data for external
                                        // register "eq_ctrl_clr", field
                                        // "coverr"
output eq_ctrl_clr_e2i_ext_wr_data;  // Provides SW write data for external
                                     // register "eq_ctrl_clr", field "e2i"
output eq_ctrl_clr_dis_ext_wr_data;  // Provides SW write data for external
                                     // register "eq_ctrl_clr", field "dis"
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
input  [2:0] eq_state_state_ext_read_data_0;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_1;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_2;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_3;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_4;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_5;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_6;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_7;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_8;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_9;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_10;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_11;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_12;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_13;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_14;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_15;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_16;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_17;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_18;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_19;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_20;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_21;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_22;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_23;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_24;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_25;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_26;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_27;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_28;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_29;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_30;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_31;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_32;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_33;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_34;  // Ext read data (decode)
input  [2:0] eq_state_state_ext_read_data_35;  // Ext read data (decode)
input  eq_tail_overr_hw_ld_0;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_ld_1;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_ld_2;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_ld_3;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_ld_4;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_ld_5;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_ld_6;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_ld_7;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_ld_8;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_ld_9;  // Hardware load enable for eq_tail_overr. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_overr_hw_ld_10;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_11;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_12;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_13;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_14;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_15;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_16;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_17;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_18;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_19;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_20;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_21;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_22;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_23;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_24;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_25;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_26;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_27;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_28;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_29;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_30;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_31;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_32;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_33;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_34;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_ld_35;  // Hardware load enable for eq_tail_overr. When
                                // set, <hw write signal>  will be loaded into
                                // eq_tail.
input  eq_tail_overr_hw_write_0;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_1;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_2;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_3;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_4;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_5;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_6;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_7;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_8;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_9;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_10;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_11;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_12;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_13;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_14;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_15;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_16;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_17;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_18;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_19;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_20;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_21;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_22;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_23;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_24;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_25;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_26;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_27;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_28;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_29;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_30;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_31;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_32;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_33;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_34;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_overr_hw_write_35;  // data bus for hw loading of eq_tail_overr.
input  eq_tail_tail_hw_ld_0;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  eq_tail_tail_hw_ld_1;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  eq_tail_tail_hw_ld_2;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  eq_tail_tail_hw_ld_3;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  eq_tail_tail_hw_ld_4;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  eq_tail_tail_hw_ld_5;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  eq_tail_tail_hw_ld_6;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  eq_tail_tail_hw_ld_7;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  eq_tail_tail_hw_ld_8;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  eq_tail_tail_hw_ld_9;  // Hardware load enable for eq_tail_tail. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
input  eq_tail_tail_hw_ld_10;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_11;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_12;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_13;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_14;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_15;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_16;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_17;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_18;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_19;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_20;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_21;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_22;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_23;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_24;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_25;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_26;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_27;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_28;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_29;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_30;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_31;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_32;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_33;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_34;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  eq_tail_tail_hw_ld_35;  // Hardware load enable for eq_tail_tail. When
                               // set, <hw write signal>  will be loaded into
                               // eq_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_0;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_1;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_2;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_3;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_4;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_5;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_6;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_7;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_8;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_9;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_10;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_11;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_12;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_13;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_14;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_15;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_16;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_17;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_18;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_19;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_20;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_21;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_22;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_23;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_24;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_25;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_26;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_27;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_28;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_29;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_30;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_31;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_32;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_33;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_34;
    // data bus for hw loading of eq_tail_tail.
input  [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_35;
    // data bus for hw loading of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_0;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_1;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_2;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_3;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_4;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_5;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_6;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_7;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_8;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_9;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_10;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_11;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_12;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_13;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_14;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_15;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_16;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_17;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_18;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_19;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_20;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_21;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_22;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_23;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_24;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_25;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_26;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_27;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_28;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_29;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_30;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_31;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_32;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_33;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_34;
    // This signal provides the current value of eq_tail_tail.
output [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_35;
    // This signal provides the current value of eq_tail_tail.
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

//====================================================
//     Type declarations
//====================================================
wire clk;  // Clock signal
wire [`FIRE_CSRBUS_ADDR_WIDTH-1:0] csrbus_addr;  // Address bus
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
wire csrbus_wr;  // Read/Write signal
wire csrbus_valid;  // Valid address
wire csrbus_mapped;  // Address is mapped
wire csrbus_done;  // Operation is done
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_read_data;  // SW read data bus
wire rst_l;  // Reset signal
wire [1:0] csrbus_src_bus;  // Source bus
wire csrbus_acc_vio;  // Violation signal
wire instance_id;  // Instance ID
wire ext_wr;  // When one, csr operation is a write. When zero, operation is a
              // read.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_BASE_ADDRESS_ADDRESS_INT_SLC] eq_base_address_address_hw_read;
    // This signal provides the current value of eq_base_address_address.
wire eq_ctrl_set_enoverr_ext_wr_data;  // Provides SW write data for external
                                       // register "eq_ctrl_set", field
                                       // "enoverr"
wire eq_ctrl_set_en_ext_wr_data;  // Provides SW write data for external
                                  // register "eq_ctrl_set", field "en"
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
wire eq_ctrl_clr_coverr_ext_wr_data;  // Provides SW write data for external
                                      // register "eq_ctrl_clr", field "coverr"
wire eq_ctrl_clr_e2i_ext_wr_data;  // Provides SW write data for external
                                   // register "eq_ctrl_clr", field "e2i"
wire eq_ctrl_clr_dis_ext_wr_data;  // Provides SW write data for external
                                   // register "eq_ctrl_clr", field "dis"
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
wire [2:0] eq_state_state_ext_read_data_0;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_1;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_2;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_3;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_4;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_5;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_6;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_7;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_8;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_9;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_10;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_11;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_12;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_13;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_14;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_15;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_16;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_17;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_18;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_19;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_20;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_21;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_22;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_23;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_24;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_25;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_26;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_27;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_28;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_29;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_30;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_31;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_32;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_33;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_34;  // Ext read data (decode)
wire [2:0] eq_state_state_ext_read_data_35;  // Ext read data (decode)
wire eq_tail_overr_hw_ld_0;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_ld_1;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_ld_2;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_ld_3;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_ld_4;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_ld_5;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_ld_6;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_ld_7;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_ld_8;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_ld_9;  // Hardware load enable for eq_tail_overr. When
                             // set, <hw write signal>  will be loaded into
                             // eq_tail.
wire eq_tail_overr_hw_ld_10;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_11;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_12;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_13;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_14;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_15;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_16;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_17;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_18;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_19;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_20;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_21;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_22;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_23;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_24;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_25;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_26;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_27;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_28;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_29;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_30;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_31;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_32;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_33;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_34;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_ld_35;  // Hardware load enable for eq_tail_overr. When
                              // set, <hw write signal>  will be loaded into
                              // eq_tail.
wire eq_tail_overr_hw_write_0;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_1;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_2;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_3;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_4;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_5;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_6;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_7;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_8;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_9;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_10;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_11;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_12;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_13;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_14;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_15;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_16;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_17;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_18;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_19;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_20;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_21;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_22;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_23;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_24;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_25;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_26;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_27;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_28;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_29;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_30;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_31;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_32;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_33;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_34;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_overr_hw_write_35;  // data bus for hw loading of eq_tail_overr.
wire eq_tail_tail_hw_ld_0;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_1;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_2;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_3;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_4;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_5;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_6;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_7;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_8;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_9;  // Hardware load enable for eq_tail_tail. When set,
                            // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_10;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_11;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_12;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_13;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_14;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_15;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_16;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_17;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_18;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_19;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_20;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_21;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_22;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_23;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_24;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_25;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_26;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_27;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_28;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_29;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_30;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_31;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_32;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_33;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_34;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire eq_tail_tail_hw_ld_35;  // Hardware load enable for eq_tail_tail. When set,
                             // <hw write signal>  will be loaded into eq_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_0;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_1;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_2;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_3;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_4;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_5;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_6;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_7;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_8;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_9;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_10;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_11;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_12;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_13;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_14;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_15;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_16;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_17;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_18;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_19;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_20;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_21;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_22;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_23;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_24;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_25;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_26;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_27;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_28;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_29;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_30;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_31;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_32;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_33;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_34;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_write_35;
    // data bus for hw loading of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_0;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_1;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_2;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_3;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_4;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_5;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_6;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_7;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_8;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_9;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_10;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_11;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_12;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_13;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_14;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_15;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_16;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_17;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_18;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_19;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_20;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_21;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_22;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_23;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_24;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_25;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_26;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_27;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_28;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_29;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_30;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_31;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_32;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_33;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_34;
    // This signal provides the current value of eq_tail_tail.
wire [`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_TAIL_INT_SLC] eq_tail_tail_hw_read_35;
    // This signal provides the current value of eq_tail_tail.
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

//====================================================
//     Logic
//====================================================
wire daemon_transaction_in_progress;
wire daemon_csrbus_mapped;
wire daemon_csrbus_valid;
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_tmp;
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data;
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on
wire daemon_csrbus_done;
wire [`FIRE_CSRBUS_ADDR_WIDTH-1:0] daemon_csrbus_addr;
wire daemon_csrbus_wr_tmp;
wire daemon_csrbus_wr;

//summit modcovoff -bepgnv
pcie_dcm_daemon #(`FIRE_CSRBUS_ADDR_WIDTH,`FIRE_CSRBUS_DATA_WIDTH) pcie_dcm_daemon (
    .daemon_csrbus_valid (daemon_csrbus_valid),
    .daemon_csrbus_mapped (daemon_csrbus_mapped),
    .daemon_csrbus_wr_data (daemon_csrbus_wr_data_tmp),
    .daemon_csrbus_done (daemon_csrbus_done),
    .daemon_csrbus_addr (daemon_csrbus_addr),
    .daemon_csrbus_wr (daemon_csrbus_wr_tmp),
    .daemon_transaction_in_progress (daemon_transaction_in_progress),
// synopsys translate_off
      .clk(clk),
      .csrbus_read_data (csrbus_read_data),
      .rst_l (rst_l),
// synopsys translate_on
    .csrbus_valid (csrbus_valid),
    .csrbus_mapped (csrbus_mapped),
    .csrbus_wr_data (csrbus_wr_data),
    .csrbus_done (csrbus_done),
    .csrbus_addr (csrbus_addr),
    .csrbus_wr (csrbus_wr)
  );
//summit modcovon -bepgnv

//====================================================================
//   Address decode
//====================================================================
wire eq_base_address_select_pulse;
wire eq_ctrl_set_select_0;
wire eq_ctrl_set_select_1;
wire eq_ctrl_set_select_2;
wire eq_ctrl_set_select_3;
wire eq_ctrl_set_select_4;
wire eq_ctrl_set_select_5;
wire eq_ctrl_set_select_6;
wire eq_ctrl_set_select_7;
wire eq_ctrl_set_select_8;
wire eq_ctrl_set_select_9;
wire eq_ctrl_set_select_10;
wire eq_ctrl_set_select_11;
wire eq_ctrl_set_select_12;
wire eq_ctrl_set_select_13;
wire eq_ctrl_set_select_14;
wire eq_ctrl_set_select_15;
wire eq_ctrl_set_select_16;
wire eq_ctrl_set_select_17;
wire eq_ctrl_set_select_18;
wire eq_ctrl_set_select_19;
wire eq_ctrl_set_select_20;
wire eq_ctrl_set_select_21;
wire eq_ctrl_set_select_22;
wire eq_ctrl_set_select_23;
wire eq_ctrl_set_select_24;
wire eq_ctrl_set_select_25;
wire eq_ctrl_set_select_26;
wire eq_ctrl_set_select_27;
wire eq_ctrl_set_select_28;
wire eq_ctrl_set_select_29;
wire eq_ctrl_set_select_30;
wire eq_ctrl_set_select_31;
wire eq_ctrl_set_select_32;
wire eq_ctrl_set_select_33;
wire eq_ctrl_set_select_34;
wire eq_ctrl_set_select_35;
wire eq_ctrl_clr_select_0;
wire eq_ctrl_clr_select_1;
wire eq_ctrl_clr_select_2;
wire eq_ctrl_clr_select_3;
wire eq_ctrl_clr_select_4;
wire eq_ctrl_clr_select_5;
wire eq_ctrl_clr_select_6;
wire eq_ctrl_clr_select_7;
wire eq_ctrl_clr_select_8;
wire eq_ctrl_clr_select_9;
wire eq_ctrl_clr_select_10;
wire eq_ctrl_clr_select_11;
wire eq_ctrl_clr_select_12;
wire eq_ctrl_clr_select_13;
wire eq_ctrl_clr_select_14;
wire eq_ctrl_clr_select_15;
wire eq_ctrl_clr_select_16;
wire eq_ctrl_clr_select_17;
wire eq_ctrl_clr_select_18;
wire eq_ctrl_clr_select_19;
wire eq_ctrl_clr_select_20;
wire eq_ctrl_clr_select_21;
wire eq_ctrl_clr_select_22;
wire eq_ctrl_clr_select_23;
wire eq_ctrl_clr_select_24;
wire eq_ctrl_clr_select_25;
wire eq_ctrl_clr_select_26;
wire eq_ctrl_clr_select_27;
wire eq_ctrl_clr_select_28;
wire eq_ctrl_clr_select_29;
wire eq_ctrl_clr_select_30;
wire eq_ctrl_clr_select_31;
wire eq_ctrl_clr_select_32;
wire eq_ctrl_clr_select_33;
wire eq_ctrl_clr_select_34;
wire eq_ctrl_clr_select_35;
wire eq_state_select_0;
wire eq_state_select_1;
wire eq_state_select_2;
wire eq_state_select_3;
wire eq_state_select_4;
wire eq_state_select_5;
wire eq_state_select_6;
wire eq_state_select_7;
wire eq_state_select_8;
wire eq_state_select_9;
wire eq_state_select_10;
wire eq_state_select_11;
wire eq_state_select_12;
wire eq_state_select_13;
wire eq_state_select_14;
wire eq_state_select_15;
wire eq_state_select_16;
wire eq_state_select_17;
wire eq_state_select_18;
wire eq_state_select_19;
wire eq_state_select_20;
wire eq_state_select_21;
wire eq_state_select_22;
wire eq_state_select_23;
wire eq_state_select_24;
wire eq_state_select_25;
wire eq_state_select_26;
wire eq_state_select_27;
wire eq_state_select_28;
wire eq_state_select_29;
wire eq_state_select_30;
wire eq_state_select_31;
wire eq_state_select_32;
wire eq_state_select_33;
wire eq_state_select_34;
wire eq_state_select_35;
wire eq_tail_select_pulse_0;
wire eq_tail_select_pulse_1;
wire eq_tail_select_pulse_2;
wire eq_tail_select_pulse_3;
wire eq_tail_select_pulse_4;
wire eq_tail_select_pulse_5;
wire eq_tail_select_pulse_6;
wire eq_tail_select_pulse_7;
wire eq_tail_select_pulse_8;
wire eq_tail_select_pulse_9;
wire eq_tail_select_pulse_10;
wire eq_tail_select_pulse_11;
wire eq_tail_select_pulse_12;
wire eq_tail_select_pulse_13;
wire eq_tail_select_pulse_14;
wire eq_tail_select_pulse_15;
wire eq_tail_select_pulse_16;
wire eq_tail_select_pulse_17;
wire eq_tail_select_pulse_18;
wire eq_tail_select_pulse_19;
wire eq_tail_select_pulse_20;
wire eq_tail_select_pulse_21;
wire eq_tail_select_pulse_22;
wire eq_tail_select_pulse_23;
wire eq_tail_select_pulse_24;
wire eq_tail_select_pulse_25;
wire eq_tail_select_pulse_26;
wire eq_tail_select_pulse_27;
wire eq_tail_select_pulse_28;
wire eq_tail_select_pulse_29;
wire eq_tail_select_pulse_30;
wire eq_tail_select_pulse_31;
wire eq_tail_select_pulse_32;
wire eq_tail_select_pulse_33;
wire eq_tail_select_pulse_34;
wire eq_tail_select_pulse_35;
wire eq_head_select_pulse_0;
wire eq_head_select_pulse_1;
wire eq_head_select_pulse_2;
wire eq_head_select_pulse_3;
wire eq_head_select_pulse_4;
wire eq_head_select_pulse_5;
wire eq_head_select_pulse_6;
wire eq_head_select_pulse_7;
wire eq_head_select_pulse_8;
wire eq_head_select_pulse_9;
wire eq_head_select_pulse_10;
wire eq_head_select_pulse_11;
wire eq_head_select_pulse_12;
wire eq_head_select_pulse_13;
wire eq_head_select_pulse_14;
wire eq_head_select_pulse_15;
wire eq_head_select_pulse_16;
wire eq_head_select_pulse_17;
wire eq_head_select_pulse_18;
wire eq_head_select_pulse_19;
wire eq_head_select_pulse_20;
wire eq_head_select_pulse_21;
wire eq_head_select_pulse_22;
wire eq_head_select_pulse_23;
wire eq_head_select_pulse_24;
wire eq_head_select_pulse_25;
wire eq_head_select_pulse_26;
wire eq_head_select_pulse_27;
wire eq_head_select_pulse_28;
wire eq_head_select_pulse_29;
wire eq_head_select_pulse_30;
wire eq_head_select_pulse_31;
wire eq_head_select_pulse_32;
wire eq_head_select_pulse_33;
wire eq_head_select_pulse_34;
wire eq_head_select_pulse_35;

dmu_imu_eqs_addr_decode dmu_imu_eqs_addr_decode
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.daemon_csrbus_valid	(daemon_csrbus_valid),
	.daemon_csrbus_addr	(daemon_csrbus_addr),
	.csrbus_src_bus	(csrbus_src_bus),
	.daemon_csrbus_wr	(daemon_csrbus_wr_tmp),
	.daemon_csrbus_wr_out	(daemon_csrbus_wr),
	.daemon_csrbus_wr_data	(daemon_csrbus_wr_data_tmp),
	.daemon_csrbus_wr_data_out	(daemon_csrbus_wr_data),
	.daemon_csrbus_mapped	(daemon_csrbus_mapped),
	.csrbus_acc_vio	(csrbus_acc_vio),
	.daemon_transaction_in_progress	(daemon_transaction_in_progress),
	.instance_id	(instance_id),
	.daemon_csrbus_done	(daemon_csrbus_done),
	.eq_base_address_select_pulse	(eq_base_address_select_pulse),
	.eq_ctrl_set_select_0	(eq_ctrl_set_select_0),
	.eq_ctrl_set_select_1	(eq_ctrl_set_select_1),
	.eq_ctrl_set_select_2	(eq_ctrl_set_select_2),
	.eq_ctrl_set_select_3	(eq_ctrl_set_select_3),
	.eq_ctrl_set_select_4	(eq_ctrl_set_select_4),
	.eq_ctrl_set_select_5	(eq_ctrl_set_select_5),
	.eq_ctrl_set_select_6	(eq_ctrl_set_select_6),
	.eq_ctrl_set_select_7	(eq_ctrl_set_select_7),
	.eq_ctrl_set_select_8	(eq_ctrl_set_select_8),
	.eq_ctrl_set_select_9	(eq_ctrl_set_select_9),
	.eq_ctrl_set_select_10	(eq_ctrl_set_select_10),
	.eq_ctrl_set_select_11	(eq_ctrl_set_select_11),
	.eq_ctrl_set_select_12	(eq_ctrl_set_select_12),
	.eq_ctrl_set_select_13	(eq_ctrl_set_select_13),
	.eq_ctrl_set_select_14	(eq_ctrl_set_select_14),
	.eq_ctrl_set_select_15	(eq_ctrl_set_select_15),
	.eq_ctrl_set_select_16	(eq_ctrl_set_select_16),
	.eq_ctrl_set_select_17	(eq_ctrl_set_select_17),
	.eq_ctrl_set_select_18	(eq_ctrl_set_select_18),
	.eq_ctrl_set_select_19	(eq_ctrl_set_select_19),
	.eq_ctrl_set_select_20	(eq_ctrl_set_select_20),
	.eq_ctrl_set_select_21	(eq_ctrl_set_select_21),
	.eq_ctrl_set_select_22	(eq_ctrl_set_select_22),
	.eq_ctrl_set_select_23	(eq_ctrl_set_select_23),
	.eq_ctrl_set_select_24	(eq_ctrl_set_select_24),
	.eq_ctrl_set_select_25	(eq_ctrl_set_select_25),
	.eq_ctrl_set_select_26	(eq_ctrl_set_select_26),
	.eq_ctrl_set_select_27	(eq_ctrl_set_select_27),
	.eq_ctrl_set_select_28	(eq_ctrl_set_select_28),
	.eq_ctrl_set_select_29	(eq_ctrl_set_select_29),
	.eq_ctrl_set_select_30	(eq_ctrl_set_select_30),
	.eq_ctrl_set_select_31	(eq_ctrl_set_select_31),
	.eq_ctrl_set_select_32	(eq_ctrl_set_select_32),
	.eq_ctrl_set_select_33	(eq_ctrl_set_select_33),
	.eq_ctrl_set_select_34	(eq_ctrl_set_select_34),
	.eq_ctrl_set_select_35	(eq_ctrl_set_select_35),
	.eq_ctrl_clr_select_0	(eq_ctrl_clr_select_0),
	.eq_ctrl_clr_select_1	(eq_ctrl_clr_select_1),
	.eq_ctrl_clr_select_2	(eq_ctrl_clr_select_2),
	.eq_ctrl_clr_select_3	(eq_ctrl_clr_select_3),
	.eq_ctrl_clr_select_4	(eq_ctrl_clr_select_4),
	.eq_ctrl_clr_select_5	(eq_ctrl_clr_select_5),
	.eq_ctrl_clr_select_6	(eq_ctrl_clr_select_6),
	.eq_ctrl_clr_select_7	(eq_ctrl_clr_select_7),
	.eq_ctrl_clr_select_8	(eq_ctrl_clr_select_8),
	.eq_ctrl_clr_select_9	(eq_ctrl_clr_select_9),
	.eq_ctrl_clr_select_10	(eq_ctrl_clr_select_10),
	.eq_ctrl_clr_select_11	(eq_ctrl_clr_select_11),
	.eq_ctrl_clr_select_12	(eq_ctrl_clr_select_12),
	.eq_ctrl_clr_select_13	(eq_ctrl_clr_select_13),
	.eq_ctrl_clr_select_14	(eq_ctrl_clr_select_14),
	.eq_ctrl_clr_select_15	(eq_ctrl_clr_select_15),
	.eq_ctrl_clr_select_16	(eq_ctrl_clr_select_16),
	.eq_ctrl_clr_select_17	(eq_ctrl_clr_select_17),
	.eq_ctrl_clr_select_18	(eq_ctrl_clr_select_18),
	.eq_ctrl_clr_select_19	(eq_ctrl_clr_select_19),
	.eq_ctrl_clr_select_20	(eq_ctrl_clr_select_20),
	.eq_ctrl_clr_select_21	(eq_ctrl_clr_select_21),
	.eq_ctrl_clr_select_22	(eq_ctrl_clr_select_22),
	.eq_ctrl_clr_select_23	(eq_ctrl_clr_select_23),
	.eq_ctrl_clr_select_24	(eq_ctrl_clr_select_24),
	.eq_ctrl_clr_select_25	(eq_ctrl_clr_select_25),
	.eq_ctrl_clr_select_26	(eq_ctrl_clr_select_26),
	.eq_ctrl_clr_select_27	(eq_ctrl_clr_select_27),
	.eq_ctrl_clr_select_28	(eq_ctrl_clr_select_28),
	.eq_ctrl_clr_select_29	(eq_ctrl_clr_select_29),
	.eq_ctrl_clr_select_30	(eq_ctrl_clr_select_30),
	.eq_ctrl_clr_select_31	(eq_ctrl_clr_select_31),
	.eq_ctrl_clr_select_32	(eq_ctrl_clr_select_32),
	.eq_ctrl_clr_select_33	(eq_ctrl_clr_select_33),
	.eq_ctrl_clr_select_34	(eq_ctrl_clr_select_34),
	.eq_ctrl_clr_select_35	(eq_ctrl_clr_select_35),
	.eq_state_select_0	(eq_state_select_0),
	.eq_state_select_1	(eq_state_select_1),
	.eq_state_select_2	(eq_state_select_2),
	.eq_state_select_3	(eq_state_select_3),
	.eq_state_select_4	(eq_state_select_4),
	.eq_state_select_5	(eq_state_select_5),
	.eq_state_select_6	(eq_state_select_6),
	.eq_state_select_7	(eq_state_select_7),
	.eq_state_select_8	(eq_state_select_8),
	.eq_state_select_9	(eq_state_select_9),
	.eq_state_select_10	(eq_state_select_10),
	.eq_state_select_11	(eq_state_select_11),
	.eq_state_select_12	(eq_state_select_12),
	.eq_state_select_13	(eq_state_select_13),
	.eq_state_select_14	(eq_state_select_14),
	.eq_state_select_15	(eq_state_select_15),
	.eq_state_select_16	(eq_state_select_16),
	.eq_state_select_17	(eq_state_select_17),
	.eq_state_select_18	(eq_state_select_18),
	.eq_state_select_19	(eq_state_select_19),
	.eq_state_select_20	(eq_state_select_20),
	.eq_state_select_21	(eq_state_select_21),
	.eq_state_select_22	(eq_state_select_22),
	.eq_state_select_23	(eq_state_select_23),
	.eq_state_select_24	(eq_state_select_24),
	.eq_state_select_25	(eq_state_select_25),
	.eq_state_select_26	(eq_state_select_26),
	.eq_state_select_27	(eq_state_select_27),
	.eq_state_select_28	(eq_state_select_28),
	.eq_state_select_29	(eq_state_select_29),
	.eq_state_select_30	(eq_state_select_30),
	.eq_state_select_31	(eq_state_select_31),
	.eq_state_select_32	(eq_state_select_32),
	.eq_state_select_33	(eq_state_select_33),
	.eq_state_select_34	(eq_state_select_34),
	.eq_state_select_35	(eq_state_select_35),
	.eq_tail_select_pulse_0	(eq_tail_select_pulse_0),
	.eq_tail_select_pulse_1	(eq_tail_select_pulse_1),
	.eq_tail_select_pulse_2	(eq_tail_select_pulse_2),
	.eq_tail_select_pulse_3	(eq_tail_select_pulse_3),
	.eq_tail_select_pulse_4	(eq_tail_select_pulse_4),
	.eq_tail_select_pulse_5	(eq_tail_select_pulse_5),
	.eq_tail_select_pulse_6	(eq_tail_select_pulse_6),
	.eq_tail_select_pulse_7	(eq_tail_select_pulse_7),
	.eq_tail_select_pulse_8	(eq_tail_select_pulse_8),
	.eq_tail_select_pulse_9	(eq_tail_select_pulse_9),
	.eq_tail_select_pulse_10	(eq_tail_select_pulse_10),
	.eq_tail_select_pulse_11	(eq_tail_select_pulse_11),
	.eq_tail_select_pulse_12	(eq_tail_select_pulse_12),
	.eq_tail_select_pulse_13	(eq_tail_select_pulse_13),
	.eq_tail_select_pulse_14	(eq_tail_select_pulse_14),
	.eq_tail_select_pulse_15	(eq_tail_select_pulse_15),
	.eq_tail_select_pulse_16	(eq_tail_select_pulse_16),
	.eq_tail_select_pulse_17	(eq_tail_select_pulse_17),
	.eq_tail_select_pulse_18	(eq_tail_select_pulse_18),
	.eq_tail_select_pulse_19	(eq_tail_select_pulse_19),
	.eq_tail_select_pulse_20	(eq_tail_select_pulse_20),
	.eq_tail_select_pulse_21	(eq_tail_select_pulse_21),
	.eq_tail_select_pulse_22	(eq_tail_select_pulse_22),
	.eq_tail_select_pulse_23	(eq_tail_select_pulse_23),
	.eq_tail_select_pulse_24	(eq_tail_select_pulse_24),
	.eq_tail_select_pulse_25	(eq_tail_select_pulse_25),
	.eq_tail_select_pulse_26	(eq_tail_select_pulse_26),
	.eq_tail_select_pulse_27	(eq_tail_select_pulse_27),
	.eq_tail_select_pulse_28	(eq_tail_select_pulse_28),
	.eq_tail_select_pulse_29	(eq_tail_select_pulse_29),
	.eq_tail_select_pulse_30	(eq_tail_select_pulse_30),
	.eq_tail_select_pulse_31	(eq_tail_select_pulse_31),
	.eq_tail_select_pulse_32	(eq_tail_select_pulse_32),
	.eq_tail_select_pulse_33	(eq_tail_select_pulse_33),
	.eq_tail_select_pulse_34	(eq_tail_select_pulse_34),
	.eq_tail_select_pulse_35	(eq_tail_select_pulse_35),
	.eq_head_select_pulse_0	(eq_head_select_pulse_0),
	.eq_head_select_pulse_1	(eq_head_select_pulse_1),
	.eq_head_select_pulse_2	(eq_head_select_pulse_2),
	.eq_head_select_pulse_3	(eq_head_select_pulse_3),
	.eq_head_select_pulse_4	(eq_head_select_pulse_4),
	.eq_head_select_pulse_5	(eq_head_select_pulse_5),
	.eq_head_select_pulse_6	(eq_head_select_pulse_6),
	.eq_head_select_pulse_7	(eq_head_select_pulse_7),
	.eq_head_select_pulse_8	(eq_head_select_pulse_8),
	.eq_head_select_pulse_9	(eq_head_select_pulse_9),
	.eq_head_select_pulse_10	(eq_head_select_pulse_10),
	.eq_head_select_pulse_11	(eq_head_select_pulse_11),
	.eq_head_select_pulse_12	(eq_head_select_pulse_12),
	.eq_head_select_pulse_13	(eq_head_select_pulse_13),
	.eq_head_select_pulse_14	(eq_head_select_pulse_14),
	.eq_head_select_pulse_15	(eq_head_select_pulse_15),
	.eq_head_select_pulse_16	(eq_head_select_pulse_16),
	.eq_head_select_pulse_17	(eq_head_select_pulse_17),
	.eq_head_select_pulse_18	(eq_head_select_pulse_18),
	.eq_head_select_pulse_19	(eq_head_select_pulse_19),
	.eq_head_select_pulse_20	(eq_head_select_pulse_20),
	.eq_head_select_pulse_21	(eq_head_select_pulse_21),
	.eq_head_select_pulse_22	(eq_head_select_pulse_22),
	.eq_head_select_pulse_23	(eq_head_select_pulse_23),
	.eq_head_select_pulse_24	(eq_head_select_pulse_24),
	.eq_head_select_pulse_25	(eq_head_select_pulse_25),
	.eq_head_select_pulse_26	(eq_head_select_pulse_26),
	.eq_head_select_pulse_27	(eq_head_select_pulse_27),
	.eq_head_select_pulse_28	(eq_head_select_pulse_28),
	.eq_head_select_pulse_29	(eq_head_select_pulse_29),
	.eq_head_select_pulse_30	(eq_head_select_pulse_30),
	.eq_head_select_pulse_31	(eq_head_select_pulse_31),
	.eq_head_select_pulse_32	(eq_head_select_pulse_32),
	.eq_head_select_pulse_33	(eq_head_select_pulse_33),
	.eq_head_select_pulse_34	(eq_head_select_pulse_34),
	.eq_head_select_pulse_35	(eq_head_select_pulse_35)
	);

//====================================================================
//    OUTPUT: csrbus_read_data (pipelining)
//====================================================================
//----- connecting wires
wire stage_mux_only_rst_l;
wire stage_mux_only_daemon_csrbus_wr;
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] stage_mux_only_daemon_csrbus_wr_data;

//----- Stage: 1 / Grp: default_grp (109 inputs / 1 outputs)
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] default_grp_read_data_0_out;
wire default_grp_eq_base_address_select_pulse;
wire default_grp_eq_ctrl_set_select_0;
wire default_grp_eq_ctrl_set_select_1;
wire default_grp_eq_ctrl_set_select_2;
wire default_grp_eq_ctrl_set_select_3;
wire default_grp_eq_ctrl_set_select_4;
wire default_grp_eq_ctrl_set_select_5;
wire default_grp_eq_ctrl_set_select_6;
wire default_grp_eq_ctrl_set_select_7;
wire default_grp_eq_ctrl_set_select_8;
wire default_grp_eq_ctrl_set_select_9;
wire default_grp_eq_ctrl_set_select_10;
wire default_grp_eq_ctrl_set_select_11;
wire default_grp_eq_ctrl_set_select_12;
wire default_grp_eq_ctrl_set_select_13;
wire default_grp_eq_ctrl_set_select_14;
wire default_grp_eq_ctrl_set_select_15;
wire default_grp_eq_ctrl_set_select_16;
wire default_grp_eq_ctrl_set_select_17;
wire default_grp_eq_ctrl_set_select_18;
wire default_grp_eq_ctrl_set_select_19;
wire default_grp_eq_ctrl_set_select_20;
wire default_grp_eq_ctrl_set_select_21;
wire default_grp_eq_ctrl_set_select_22;
wire default_grp_eq_ctrl_set_select_23;
wire default_grp_eq_ctrl_set_select_24;
wire default_grp_eq_ctrl_set_select_25;
wire default_grp_eq_ctrl_set_select_26;
wire default_grp_eq_ctrl_set_select_27;
wire default_grp_eq_ctrl_set_select_28;
wire default_grp_eq_ctrl_set_select_29;
wire default_grp_eq_ctrl_set_select_30;
wire default_grp_eq_ctrl_set_select_31;
wire default_grp_eq_ctrl_set_select_32;
wire default_grp_eq_ctrl_set_select_33;
wire default_grp_eq_ctrl_set_select_34;
wire default_grp_eq_ctrl_set_select_35;
wire default_grp_eq_ctrl_clr_select_0;
wire default_grp_eq_ctrl_clr_select_1;
wire default_grp_eq_ctrl_clr_select_2;
wire default_grp_eq_ctrl_clr_select_3;
wire default_grp_eq_ctrl_clr_select_4;
wire default_grp_eq_ctrl_clr_select_5;
wire default_grp_eq_ctrl_clr_select_6;
wire default_grp_eq_ctrl_clr_select_7;
wire default_grp_eq_ctrl_clr_select_8;
wire default_grp_eq_ctrl_clr_select_9;
wire default_grp_eq_ctrl_clr_select_10;
wire default_grp_eq_ctrl_clr_select_11;
wire default_grp_eq_ctrl_clr_select_12;
wire default_grp_eq_ctrl_clr_select_13;
wire default_grp_eq_ctrl_clr_select_14;
wire default_grp_eq_ctrl_clr_select_15;
wire default_grp_eq_ctrl_clr_select_16;
wire default_grp_eq_ctrl_clr_select_17;
wire default_grp_eq_ctrl_clr_select_18;
wire default_grp_eq_ctrl_clr_select_19;
wire default_grp_eq_ctrl_clr_select_20;
wire default_grp_eq_ctrl_clr_select_21;
wire default_grp_eq_ctrl_clr_select_22;
wire default_grp_eq_ctrl_clr_select_23;
wire default_grp_eq_ctrl_clr_select_24;
wire default_grp_eq_ctrl_clr_select_25;
wire default_grp_eq_ctrl_clr_select_26;
wire default_grp_eq_ctrl_clr_select_27;
wire default_grp_eq_ctrl_clr_select_28;
wire default_grp_eq_ctrl_clr_select_29;
wire default_grp_eq_ctrl_clr_select_30;
wire default_grp_eq_ctrl_clr_select_31;
wire default_grp_eq_ctrl_clr_select_32;
wire default_grp_eq_ctrl_clr_select_33;
wire default_grp_eq_ctrl_clr_select_34;
wire default_grp_eq_ctrl_clr_select_35;
wire default_grp_eq_state_select_0;
wire default_grp_eq_state_select_1;
wire default_grp_eq_state_select_2;
wire default_grp_eq_state_select_3;
wire default_grp_eq_state_select_4;
wire default_grp_eq_state_select_5;
wire default_grp_eq_state_select_6;
wire default_grp_eq_state_select_7;
wire default_grp_eq_state_select_8;
wire default_grp_eq_state_select_9;
wire default_grp_eq_state_select_10;
wire default_grp_eq_state_select_11;
wire default_grp_eq_state_select_12;
wire default_grp_eq_state_select_13;
wire default_grp_eq_state_select_14;
wire default_grp_eq_state_select_15;
wire default_grp_eq_state_select_16;
wire default_grp_eq_state_select_17;
wire default_grp_eq_state_select_18;
wire default_grp_eq_state_select_19;
wire default_grp_eq_state_select_20;
wire default_grp_eq_state_select_21;
wire default_grp_eq_state_select_22;
wire default_grp_eq_state_select_23;
wire default_grp_eq_state_select_24;
wire default_grp_eq_state_select_25;
wire default_grp_eq_state_select_26;
wire default_grp_eq_state_select_27;
wire default_grp_eq_state_select_28;
wire default_grp_eq_state_select_29;
wire default_grp_eq_state_select_30;
wire default_grp_eq_state_select_31;
wire default_grp_eq_state_select_32;
wire default_grp_eq_state_select_33;
wire default_grp_eq_state_select_34;
wire default_grp_eq_state_select_35;
wire default_grp_eq_tail_select_pulse_0;
wire default_grp_eq_tail_select_pulse_1;
wire default_grp_eq_tail_select_pulse_2;
wire default_grp_eq_tail_select_pulse_3;
wire default_grp_eq_tail_select_pulse_4;
wire default_grp_eq_tail_select_pulse_5;
wire default_grp_eq_tail_select_pulse_6;
wire default_grp_eq_tail_select_pulse_7;
wire default_grp_eq_tail_select_pulse_8;
wire default_grp_eq_tail_select_pulse_9;
wire default_grp_eq_tail_select_pulse_10;
wire default_grp_eq_tail_select_pulse_11;
wire default_grp_eq_tail_select_pulse_12;
wire default_grp_eq_tail_select_pulse_13;
wire default_grp_eq_tail_select_pulse_14;
wire default_grp_eq_tail_select_pulse_15;
wire default_grp_eq_tail_select_pulse_16;
wire default_grp_eq_tail_select_pulse_17;
wire default_grp_eq_tail_select_pulse_18;
wire default_grp_eq_tail_select_pulse_19;
wire default_grp_eq_tail_select_pulse_20;
wire default_grp_eq_tail_select_pulse_21;
wire default_grp_eq_tail_select_pulse_22;
wire default_grp_eq_tail_select_pulse_23;
wire default_grp_eq_tail_select_pulse_24;
wire default_grp_eq_tail_select_pulse_25;
wire default_grp_eq_tail_select_pulse_26;
wire default_grp_eq_tail_select_pulse_27;
wire default_grp_eq_tail_select_pulse_28;
wire default_grp_eq_tail_select_pulse_29;
wire default_grp_eq_tail_select_pulse_30;
wire default_grp_eq_tail_select_pulse_31;
wire default_grp_eq_tail_select_pulse_32;
wire default_grp_eq_tail_select_pulse_33;
wire default_grp_eq_tail_select_pulse_34;
wire default_grp_eq_tail_select_pulse_35;
wire default_grp_eq_head_select_pulse_0;
wire default_grp_eq_head_select_pulse_1;
wire default_grp_eq_head_select_pulse_2;
wire default_grp_eq_head_select_pulse_3;
wire default_grp_eq_head_select_pulse_4;
wire default_grp_eq_head_select_pulse_5;
wire default_grp_eq_head_select_pulse_6;
wire default_grp_eq_head_select_pulse_7;
wire default_grp_eq_head_select_pulse_8;
wire default_grp_eq_head_select_pulse_9;
wire default_grp_eq_head_select_pulse_10;
wire default_grp_eq_head_select_pulse_11;
wire default_grp_eq_head_select_pulse_12;
wire default_grp_eq_head_select_pulse_13;
wire default_grp_eq_head_select_pulse_14;
wire default_grp_eq_head_select_pulse_15;
wire default_grp_eq_head_select_pulse_16;
wire default_grp_eq_head_select_pulse_17;
wire default_grp_eq_head_select_pulse_18;
wire default_grp_eq_head_select_pulse_19;
wire default_grp_eq_head_select_pulse_20;
wire default_grp_eq_head_select_pulse_21;
wire default_grp_eq_head_select_pulse_22;
wire default_grp_eq_head_select_pulse_23;
wire default_grp_eq_head_select_pulse_24;
wire default_grp_eq_head_select_pulse_25;
wire default_grp_eq_head_select_pulse_26;
wire default_grp_eq_head_select_pulse_27;
wire default_grp_eq_head_select_pulse_28;
wire default_grp_eq_head_select_pulse_29;
wire default_grp_eq_head_select_pulse_30;
wire default_grp_eq_head_select_pulse_31;
wire default_grp_eq_head_select_pulse_32;
wire default_grp_eq_head_select_pulse_33;
wire default_grp_eq_head_select_pulse_34;
wire default_grp_eq_head_select_pulse_35;

dmu_imu_eqs_default_grp dmu_imu_eqs_default_grp
	(
	.clk	(clk),
	.eq_base_address_address_hw_read	(eq_base_address_address_hw_read),
	.eq_base_address_select_pulse	(default_grp_eq_base_address_select_pulse),
	.eq_ctrl_set_ext_select_0	(eq_ctrl_set_ext_select_0),
	.eq_ctrl_set_ext_select_1	(eq_ctrl_set_ext_select_1),
	.eq_ctrl_set_ext_select_2	(eq_ctrl_set_ext_select_2),
	.eq_ctrl_set_ext_select_3	(eq_ctrl_set_ext_select_3),
	.eq_ctrl_set_ext_select_4	(eq_ctrl_set_ext_select_4),
	.eq_ctrl_set_ext_select_5	(eq_ctrl_set_ext_select_5),
	.eq_ctrl_set_ext_select_6	(eq_ctrl_set_ext_select_6),
	.eq_ctrl_set_ext_select_7	(eq_ctrl_set_ext_select_7),
	.eq_ctrl_set_ext_select_8	(eq_ctrl_set_ext_select_8),
	.eq_ctrl_set_ext_select_9	(eq_ctrl_set_ext_select_9),
	.eq_ctrl_set_ext_select_10	(eq_ctrl_set_ext_select_10),
	.eq_ctrl_set_ext_select_11	(eq_ctrl_set_ext_select_11),
	.eq_ctrl_set_ext_select_12	(eq_ctrl_set_ext_select_12),
	.eq_ctrl_set_ext_select_13	(eq_ctrl_set_ext_select_13),
	.eq_ctrl_set_ext_select_14	(eq_ctrl_set_ext_select_14),
	.eq_ctrl_set_ext_select_15	(eq_ctrl_set_ext_select_15),
	.eq_ctrl_set_ext_select_16	(eq_ctrl_set_ext_select_16),
	.eq_ctrl_set_ext_select_17	(eq_ctrl_set_ext_select_17),
	.eq_ctrl_set_ext_select_18	(eq_ctrl_set_ext_select_18),
	.eq_ctrl_set_ext_select_19	(eq_ctrl_set_ext_select_19),
	.eq_ctrl_set_ext_select_20	(eq_ctrl_set_ext_select_20),
	.eq_ctrl_set_ext_select_21	(eq_ctrl_set_ext_select_21),
	.eq_ctrl_set_ext_select_22	(eq_ctrl_set_ext_select_22),
	.eq_ctrl_set_ext_select_23	(eq_ctrl_set_ext_select_23),
	.eq_ctrl_set_ext_select_24	(eq_ctrl_set_ext_select_24),
	.eq_ctrl_set_ext_select_25	(eq_ctrl_set_ext_select_25),
	.eq_ctrl_set_ext_select_26	(eq_ctrl_set_ext_select_26),
	.eq_ctrl_set_ext_select_27	(eq_ctrl_set_ext_select_27),
	.eq_ctrl_set_ext_select_28	(eq_ctrl_set_ext_select_28),
	.eq_ctrl_set_ext_select_29	(eq_ctrl_set_ext_select_29),
	.eq_ctrl_set_ext_select_30	(eq_ctrl_set_ext_select_30),
	.eq_ctrl_set_ext_select_31	(eq_ctrl_set_ext_select_31),
	.eq_ctrl_set_ext_select_32	(eq_ctrl_set_ext_select_32),
	.eq_ctrl_set_ext_select_33	(eq_ctrl_set_ext_select_33),
	.eq_ctrl_set_ext_select_34	(eq_ctrl_set_ext_select_34),
	.eq_ctrl_set_ext_select_35	(eq_ctrl_set_ext_select_35),
	.eq_ctrl_set_select_0	(default_grp_eq_ctrl_set_select_0),
	.eq_ctrl_set_select_1	(default_grp_eq_ctrl_set_select_1),
	.eq_ctrl_set_select_2	(default_grp_eq_ctrl_set_select_2),
	.eq_ctrl_set_select_3	(default_grp_eq_ctrl_set_select_3),
	.eq_ctrl_set_select_4	(default_grp_eq_ctrl_set_select_4),
	.eq_ctrl_set_select_5	(default_grp_eq_ctrl_set_select_5),
	.eq_ctrl_set_select_6	(default_grp_eq_ctrl_set_select_6),
	.eq_ctrl_set_select_7	(default_grp_eq_ctrl_set_select_7),
	.eq_ctrl_set_select_8	(default_grp_eq_ctrl_set_select_8),
	.eq_ctrl_set_select_9	(default_grp_eq_ctrl_set_select_9),
	.eq_ctrl_set_select_10	(default_grp_eq_ctrl_set_select_10),
	.eq_ctrl_set_select_11	(default_grp_eq_ctrl_set_select_11),
	.eq_ctrl_set_select_12	(default_grp_eq_ctrl_set_select_12),
	.eq_ctrl_set_select_13	(default_grp_eq_ctrl_set_select_13),
	.eq_ctrl_set_select_14	(default_grp_eq_ctrl_set_select_14),
	.eq_ctrl_set_select_15	(default_grp_eq_ctrl_set_select_15),
	.eq_ctrl_set_select_16	(default_grp_eq_ctrl_set_select_16),
	.eq_ctrl_set_select_17	(default_grp_eq_ctrl_set_select_17),
	.eq_ctrl_set_select_18	(default_grp_eq_ctrl_set_select_18),
	.eq_ctrl_set_select_19	(default_grp_eq_ctrl_set_select_19),
	.eq_ctrl_set_select_20	(default_grp_eq_ctrl_set_select_20),
	.eq_ctrl_set_select_21	(default_grp_eq_ctrl_set_select_21),
	.eq_ctrl_set_select_22	(default_grp_eq_ctrl_set_select_22),
	.eq_ctrl_set_select_23	(default_grp_eq_ctrl_set_select_23),
	.eq_ctrl_set_select_24	(default_grp_eq_ctrl_set_select_24),
	.eq_ctrl_set_select_25	(default_grp_eq_ctrl_set_select_25),
	.eq_ctrl_set_select_26	(default_grp_eq_ctrl_set_select_26),
	.eq_ctrl_set_select_27	(default_grp_eq_ctrl_set_select_27),
	.eq_ctrl_set_select_28	(default_grp_eq_ctrl_set_select_28),
	.eq_ctrl_set_select_29	(default_grp_eq_ctrl_set_select_29),
	.eq_ctrl_set_select_30	(default_grp_eq_ctrl_set_select_30),
	.eq_ctrl_set_select_31	(default_grp_eq_ctrl_set_select_31),
	.eq_ctrl_set_select_32	(default_grp_eq_ctrl_set_select_32),
	.eq_ctrl_set_select_33	(default_grp_eq_ctrl_set_select_33),
	.eq_ctrl_set_select_34	(default_grp_eq_ctrl_set_select_34),
	.eq_ctrl_set_select_35	(default_grp_eq_ctrl_set_select_35),
	.eq_ctrl_set_enoverr_ext_wr_data	(eq_ctrl_set_enoverr_ext_wr_data),
	.eq_ctrl_set_en_ext_wr_data	(eq_ctrl_set_en_ext_wr_data),
	.eq_ctrl_clr_ext_select_0	(eq_ctrl_clr_ext_select_0),
	.eq_ctrl_clr_ext_select_1	(eq_ctrl_clr_ext_select_1),
	.eq_ctrl_clr_ext_select_2	(eq_ctrl_clr_ext_select_2),
	.eq_ctrl_clr_ext_select_3	(eq_ctrl_clr_ext_select_3),
	.eq_ctrl_clr_ext_select_4	(eq_ctrl_clr_ext_select_4),
	.eq_ctrl_clr_ext_select_5	(eq_ctrl_clr_ext_select_5),
	.eq_ctrl_clr_ext_select_6	(eq_ctrl_clr_ext_select_6),
	.eq_ctrl_clr_ext_select_7	(eq_ctrl_clr_ext_select_7),
	.eq_ctrl_clr_ext_select_8	(eq_ctrl_clr_ext_select_8),
	.eq_ctrl_clr_ext_select_9	(eq_ctrl_clr_ext_select_9),
	.eq_ctrl_clr_ext_select_10	(eq_ctrl_clr_ext_select_10),
	.eq_ctrl_clr_ext_select_11	(eq_ctrl_clr_ext_select_11),
	.eq_ctrl_clr_ext_select_12	(eq_ctrl_clr_ext_select_12),
	.eq_ctrl_clr_ext_select_13	(eq_ctrl_clr_ext_select_13),
	.eq_ctrl_clr_ext_select_14	(eq_ctrl_clr_ext_select_14),
	.eq_ctrl_clr_ext_select_15	(eq_ctrl_clr_ext_select_15),
	.eq_ctrl_clr_ext_select_16	(eq_ctrl_clr_ext_select_16),
	.eq_ctrl_clr_ext_select_17	(eq_ctrl_clr_ext_select_17),
	.eq_ctrl_clr_ext_select_18	(eq_ctrl_clr_ext_select_18),
	.eq_ctrl_clr_ext_select_19	(eq_ctrl_clr_ext_select_19),
	.eq_ctrl_clr_ext_select_20	(eq_ctrl_clr_ext_select_20),
	.eq_ctrl_clr_ext_select_21	(eq_ctrl_clr_ext_select_21),
	.eq_ctrl_clr_ext_select_22	(eq_ctrl_clr_ext_select_22),
	.eq_ctrl_clr_ext_select_23	(eq_ctrl_clr_ext_select_23),
	.eq_ctrl_clr_ext_select_24	(eq_ctrl_clr_ext_select_24),
	.eq_ctrl_clr_ext_select_25	(eq_ctrl_clr_ext_select_25),
	.eq_ctrl_clr_ext_select_26	(eq_ctrl_clr_ext_select_26),
	.eq_ctrl_clr_ext_select_27	(eq_ctrl_clr_ext_select_27),
	.eq_ctrl_clr_ext_select_28	(eq_ctrl_clr_ext_select_28),
	.eq_ctrl_clr_ext_select_29	(eq_ctrl_clr_ext_select_29),
	.eq_ctrl_clr_ext_select_30	(eq_ctrl_clr_ext_select_30),
	.eq_ctrl_clr_ext_select_31	(eq_ctrl_clr_ext_select_31),
	.eq_ctrl_clr_ext_select_32	(eq_ctrl_clr_ext_select_32),
	.eq_ctrl_clr_ext_select_33	(eq_ctrl_clr_ext_select_33),
	.eq_ctrl_clr_ext_select_34	(eq_ctrl_clr_ext_select_34),
	.eq_ctrl_clr_ext_select_35	(eq_ctrl_clr_ext_select_35),
	.eq_ctrl_clr_select_0	(default_grp_eq_ctrl_clr_select_0),
	.eq_ctrl_clr_select_1	(default_grp_eq_ctrl_clr_select_1),
	.eq_ctrl_clr_select_2	(default_grp_eq_ctrl_clr_select_2),
	.eq_ctrl_clr_select_3	(default_grp_eq_ctrl_clr_select_3),
	.eq_ctrl_clr_select_4	(default_grp_eq_ctrl_clr_select_4),
	.eq_ctrl_clr_select_5	(default_grp_eq_ctrl_clr_select_5),
	.eq_ctrl_clr_select_6	(default_grp_eq_ctrl_clr_select_6),
	.eq_ctrl_clr_select_7	(default_grp_eq_ctrl_clr_select_7),
	.eq_ctrl_clr_select_8	(default_grp_eq_ctrl_clr_select_8),
	.eq_ctrl_clr_select_9	(default_grp_eq_ctrl_clr_select_9),
	.eq_ctrl_clr_select_10	(default_grp_eq_ctrl_clr_select_10),
	.eq_ctrl_clr_select_11	(default_grp_eq_ctrl_clr_select_11),
	.eq_ctrl_clr_select_12	(default_grp_eq_ctrl_clr_select_12),
	.eq_ctrl_clr_select_13	(default_grp_eq_ctrl_clr_select_13),
	.eq_ctrl_clr_select_14	(default_grp_eq_ctrl_clr_select_14),
	.eq_ctrl_clr_select_15	(default_grp_eq_ctrl_clr_select_15),
	.eq_ctrl_clr_select_16	(default_grp_eq_ctrl_clr_select_16),
	.eq_ctrl_clr_select_17	(default_grp_eq_ctrl_clr_select_17),
	.eq_ctrl_clr_select_18	(default_grp_eq_ctrl_clr_select_18),
	.eq_ctrl_clr_select_19	(default_grp_eq_ctrl_clr_select_19),
	.eq_ctrl_clr_select_20	(default_grp_eq_ctrl_clr_select_20),
	.eq_ctrl_clr_select_21	(default_grp_eq_ctrl_clr_select_21),
	.eq_ctrl_clr_select_22	(default_grp_eq_ctrl_clr_select_22),
	.eq_ctrl_clr_select_23	(default_grp_eq_ctrl_clr_select_23),
	.eq_ctrl_clr_select_24	(default_grp_eq_ctrl_clr_select_24),
	.eq_ctrl_clr_select_25	(default_grp_eq_ctrl_clr_select_25),
	.eq_ctrl_clr_select_26	(default_grp_eq_ctrl_clr_select_26),
	.eq_ctrl_clr_select_27	(default_grp_eq_ctrl_clr_select_27),
	.eq_ctrl_clr_select_28	(default_grp_eq_ctrl_clr_select_28),
	.eq_ctrl_clr_select_29	(default_grp_eq_ctrl_clr_select_29),
	.eq_ctrl_clr_select_30	(default_grp_eq_ctrl_clr_select_30),
	.eq_ctrl_clr_select_31	(default_grp_eq_ctrl_clr_select_31),
	.eq_ctrl_clr_select_32	(default_grp_eq_ctrl_clr_select_32),
	.eq_ctrl_clr_select_33	(default_grp_eq_ctrl_clr_select_33),
	.eq_ctrl_clr_select_34	(default_grp_eq_ctrl_clr_select_34),
	.eq_ctrl_clr_select_35	(default_grp_eq_ctrl_clr_select_35),
	.eq_ctrl_clr_coverr_ext_wr_data	(eq_ctrl_clr_coverr_ext_wr_data),
	.eq_ctrl_clr_e2i_ext_wr_data	(eq_ctrl_clr_e2i_ext_wr_data),
	.eq_ctrl_clr_dis_ext_wr_data	(eq_ctrl_clr_dis_ext_wr_data),
	.eq_state_select_0	(default_grp_eq_state_select_0),
	.eq_state_select_1	(default_grp_eq_state_select_1),
	.eq_state_select_2	(default_grp_eq_state_select_2),
	.eq_state_select_3	(default_grp_eq_state_select_3),
	.eq_state_select_4	(default_grp_eq_state_select_4),
	.eq_state_select_5	(default_grp_eq_state_select_5),
	.eq_state_select_6	(default_grp_eq_state_select_6),
	.eq_state_select_7	(default_grp_eq_state_select_7),
	.eq_state_select_8	(default_grp_eq_state_select_8),
	.eq_state_select_9	(default_grp_eq_state_select_9),
	.eq_state_select_10	(default_grp_eq_state_select_10),
	.eq_state_select_11	(default_grp_eq_state_select_11),
	.eq_state_select_12	(default_grp_eq_state_select_12),
	.eq_state_select_13	(default_grp_eq_state_select_13),
	.eq_state_select_14	(default_grp_eq_state_select_14),
	.eq_state_select_15	(default_grp_eq_state_select_15),
	.eq_state_select_16	(default_grp_eq_state_select_16),
	.eq_state_select_17	(default_grp_eq_state_select_17),
	.eq_state_select_18	(default_grp_eq_state_select_18),
	.eq_state_select_19	(default_grp_eq_state_select_19),
	.eq_state_select_20	(default_grp_eq_state_select_20),
	.eq_state_select_21	(default_grp_eq_state_select_21),
	.eq_state_select_22	(default_grp_eq_state_select_22),
	.eq_state_select_23	(default_grp_eq_state_select_23),
	.eq_state_select_24	(default_grp_eq_state_select_24),
	.eq_state_select_25	(default_grp_eq_state_select_25),
	.eq_state_select_26	(default_grp_eq_state_select_26),
	.eq_state_select_27	(default_grp_eq_state_select_27),
	.eq_state_select_28	(default_grp_eq_state_select_28),
	.eq_state_select_29	(default_grp_eq_state_select_29),
	.eq_state_select_30	(default_grp_eq_state_select_30),
	.eq_state_select_31	(default_grp_eq_state_select_31),
	.eq_state_select_32	(default_grp_eq_state_select_32),
	.eq_state_select_33	(default_grp_eq_state_select_33),
	.eq_state_select_34	(default_grp_eq_state_select_34),
	.eq_state_select_35	(default_grp_eq_state_select_35),
	.eq_state_ext_read_data_0
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_0
              }),
	.eq_state_ext_read_data_1
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_1
              }),
	.eq_state_ext_read_data_2
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_2
              }),
	.eq_state_ext_read_data_3
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_3
              }),
	.eq_state_ext_read_data_4
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_4
              }),
	.eq_state_ext_read_data_5
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_5
              }),
	.eq_state_ext_read_data_6
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_6
              }),
	.eq_state_ext_read_data_7
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_7
              }),
	.eq_state_ext_read_data_8
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_8
              }),
	.eq_state_ext_read_data_9
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_9
              }),
	.eq_state_ext_read_data_10
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_10
              }),
	.eq_state_ext_read_data_11
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_11
              }),
	.eq_state_ext_read_data_12
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_12
              }),
	.eq_state_ext_read_data_13
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_13
              }),
	.eq_state_ext_read_data_14
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_14
              }),
	.eq_state_ext_read_data_15
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_15
              }),
	.eq_state_ext_read_data_16
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_16
              }),
	.eq_state_ext_read_data_17
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_17
              }),
	.eq_state_ext_read_data_18
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_18
              }),
	.eq_state_ext_read_data_19
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_19
              }),
	.eq_state_ext_read_data_20
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_20
              }),
	.eq_state_ext_read_data_21
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_21
              }),
	.eq_state_ext_read_data_22
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_22
              }),
	.eq_state_ext_read_data_23
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_23
              }),
	.eq_state_ext_read_data_24
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_24
              }),
	.eq_state_ext_read_data_25
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_25
              }),
	.eq_state_ext_read_data_26
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_26
              }),
	.eq_state_ext_read_data_27
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_27
              }),
	.eq_state_ext_read_data_28
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_28
              }),
	.eq_state_ext_read_data_29
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_29
              }),
	.eq_state_ext_read_data_30
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_30
              }),
	.eq_state_ext_read_data_31
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_31
              }),
	.eq_state_ext_read_data_32
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_32
              }),
	.eq_state_ext_read_data_33
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_33
              }),
	.eq_state_ext_read_data_34
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_34
              }),
	.eq_state_ext_read_data_35
	  (
              {
                61'b0,
                eq_state_state_ext_read_data_35
              }),
	.eq_tail_overr_hw_ld_0	(eq_tail_overr_hw_ld_0),
	.eq_tail_overr_hw_write_0	(eq_tail_overr_hw_write_0),
	.eq_tail_tail_hw_ld_0	(eq_tail_tail_hw_ld_0),
	.eq_tail_tail_hw_write_0	(eq_tail_tail_hw_write_0),
	.eq_tail_tail_hw_read_0	(eq_tail_tail_hw_read_0),
	.eq_tail_overr_hw_ld_1	(eq_tail_overr_hw_ld_1),
	.eq_tail_overr_hw_write_1	(eq_tail_overr_hw_write_1),
	.eq_tail_tail_hw_ld_1	(eq_tail_tail_hw_ld_1),
	.eq_tail_tail_hw_write_1	(eq_tail_tail_hw_write_1),
	.eq_tail_tail_hw_read_1	(eq_tail_tail_hw_read_1),
	.eq_tail_overr_hw_ld_2	(eq_tail_overr_hw_ld_2),
	.eq_tail_overr_hw_write_2	(eq_tail_overr_hw_write_2),
	.eq_tail_tail_hw_ld_2	(eq_tail_tail_hw_ld_2),
	.eq_tail_tail_hw_write_2	(eq_tail_tail_hw_write_2),
	.eq_tail_tail_hw_read_2	(eq_tail_tail_hw_read_2),
	.eq_tail_overr_hw_ld_3	(eq_tail_overr_hw_ld_3),
	.eq_tail_overr_hw_write_3	(eq_tail_overr_hw_write_3),
	.eq_tail_tail_hw_ld_3	(eq_tail_tail_hw_ld_3),
	.eq_tail_tail_hw_write_3	(eq_tail_tail_hw_write_3),
	.eq_tail_tail_hw_read_3	(eq_tail_tail_hw_read_3),
	.eq_tail_overr_hw_ld_4	(eq_tail_overr_hw_ld_4),
	.eq_tail_overr_hw_write_4	(eq_tail_overr_hw_write_4),
	.eq_tail_tail_hw_ld_4	(eq_tail_tail_hw_ld_4),
	.eq_tail_tail_hw_write_4	(eq_tail_tail_hw_write_4),
	.eq_tail_tail_hw_read_4	(eq_tail_tail_hw_read_4),
	.eq_tail_overr_hw_ld_5	(eq_tail_overr_hw_ld_5),
	.eq_tail_overr_hw_write_5	(eq_tail_overr_hw_write_5),
	.eq_tail_tail_hw_ld_5	(eq_tail_tail_hw_ld_5),
	.eq_tail_tail_hw_write_5	(eq_tail_tail_hw_write_5),
	.eq_tail_tail_hw_read_5	(eq_tail_tail_hw_read_5),
	.eq_tail_overr_hw_ld_6	(eq_tail_overr_hw_ld_6),
	.eq_tail_overr_hw_write_6	(eq_tail_overr_hw_write_6),
	.eq_tail_tail_hw_ld_6	(eq_tail_tail_hw_ld_6),
	.eq_tail_tail_hw_write_6	(eq_tail_tail_hw_write_6),
	.eq_tail_tail_hw_read_6	(eq_tail_tail_hw_read_6),
	.eq_tail_overr_hw_ld_7	(eq_tail_overr_hw_ld_7),
	.eq_tail_overr_hw_write_7	(eq_tail_overr_hw_write_7),
	.eq_tail_tail_hw_ld_7	(eq_tail_tail_hw_ld_7),
	.eq_tail_tail_hw_write_7	(eq_tail_tail_hw_write_7),
	.eq_tail_tail_hw_read_7	(eq_tail_tail_hw_read_7),
	.eq_tail_overr_hw_ld_8	(eq_tail_overr_hw_ld_8),
	.eq_tail_overr_hw_write_8	(eq_tail_overr_hw_write_8),
	.eq_tail_tail_hw_ld_8	(eq_tail_tail_hw_ld_8),
	.eq_tail_tail_hw_write_8	(eq_tail_tail_hw_write_8),
	.eq_tail_tail_hw_read_8	(eq_tail_tail_hw_read_8),
	.eq_tail_overr_hw_ld_9	(eq_tail_overr_hw_ld_9),
	.eq_tail_overr_hw_write_9	(eq_tail_overr_hw_write_9),
	.eq_tail_tail_hw_ld_9	(eq_tail_tail_hw_ld_9),
	.eq_tail_tail_hw_write_9	(eq_tail_tail_hw_write_9),
	.eq_tail_tail_hw_read_9	(eq_tail_tail_hw_read_9),
	.eq_tail_overr_hw_ld_10	(eq_tail_overr_hw_ld_10),
	.eq_tail_overr_hw_write_10	(eq_tail_overr_hw_write_10),
	.eq_tail_tail_hw_ld_10	(eq_tail_tail_hw_ld_10),
	.eq_tail_tail_hw_write_10	(eq_tail_tail_hw_write_10),
	.eq_tail_tail_hw_read_10	(eq_tail_tail_hw_read_10),
	.eq_tail_overr_hw_ld_11	(eq_tail_overr_hw_ld_11),
	.eq_tail_overr_hw_write_11	(eq_tail_overr_hw_write_11),
	.eq_tail_tail_hw_ld_11	(eq_tail_tail_hw_ld_11),
	.eq_tail_tail_hw_write_11	(eq_tail_tail_hw_write_11),
	.eq_tail_tail_hw_read_11	(eq_tail_tail_hw_read_11),
	.eq_tail_overr_hw_ld_12	(eq_tail_overr_hw_ld_12),
	.eq_tail_overr_hw_write_12	(eq_tail_overr_hw_write_12),
	.eq_tail_tail_hw_ld_12	(eq_tail_tail_hw_ld_12),
	.eq_tail_tail_hw_write_12	(eq_tail_tail_hw_write_12),
	.eq_tail_tail_hw_read_12	(eq_tail_tail_hw_read_12),
	.eq_tail_overr_hw_ld_13	(eq_tail_overr_hw_ld_13),
	.eq_tail_overr_hw_write_13	(eq_tail_overr_hw_write_13),
	.eq_tail_tail_hw_ld_13	(eq_tail_tail_hw_ld_13),
	.eq_tail_tail_hw_write_13	(eq_tail_tail_hw_write_13),
	.eq_tail_tail_hw_read_13	(eq_tail_tail_hw_read_13),
	.eq_tail_overr_hw_ld_14	(eq_tail_overr_hw_ld_14),
	.eq_tail_overr_hw_write_14	(eq_tail_overr_hw_write_14),
	.eq_tail_tail_hw_ld_14	(eq_tail_tail_hw_ld_14),
	.eq_tail_tail_hw_write_14	(eq_tail_tail_hw_write_14),
	.eq_tail_tail_hw_read_14	(eq_tail_tail_hw_read_14),
	.eq_tail_overr_hw_ld_15	(eq_tail_overr_hw_ld_15),
	.eq_tail_overr_hw_write_15	(eq_tail_overr_hw_write_15),
	.eq_tail_tail_hw_ld_15	(eq_tail_tail_hw_ld_15),
	.eq_tail_tail_hw_write_15	(eq_tail_tail_hw_write_15),
	.eq_tail_tail_hw_read_15	(eq_tail_tail_hw_read_15),
	.eq_tail_overr_hw_ld_16	(eq_tail_overr_hw_ld_16),
	.eq_tail_overr_hw_write_16	(eq_tail_overr_hw_write_16),
	.eq_tail_tail_hw_ld_16	(eq_tail_tail_hw_ld_16),
	.eq_tail_tail_hw_write_16	(eq_tail_tail_hw_write_16),
	.eq_tail_tail_hw_read_16	(eq_tail_tail_hw_read_16),
	.eq_tail_overr_hw_ld_17	(eq_tail_overr_hw_ld_17),
	.eq_tail_overr_hw_write_17	(eq_tail_overr_hw_write_17),
	.eq_tail_tail_hw_ld_17	(eq_tail_tail_hw_ld_17),
	.eq_tail_tail_hw_write_17	(eq_tail_tail_hw_write_17),
	.eq_tail_tail_hw_read_17	(eq_tail_tail_hw_read_17),
	.eq_tail_overr_hw_ld_18	(eq_tail_overr_hw_ld_18),
	.eq_tail_overr_hw_write_18	(eq_tail_overr_hw_write_18),
	.eq_tail_tail_hw_ld_18	(eq_tail_tail_hw_ld_18),
	.eq_tail_tail_hw_write_18	(eq_tail_tail_hw_write_18),
	.eq_tail_tail_hw_read_18	(eq_tail_tail_hw_read_18),
	.eq_tail_overr_hw_ld_19	(eq_tail_overr_hw_ld_19),
	.eq_tail_overr_hw_write_19	(eq_tail_overr_hw_write_19),
	.eq_tail_tail_hw_ld_19	(eq_tail_tail_hw_ld_19),
	.eq_tail_tail_hw_write_19	(eq_tail_tail_hw_write_19),
	.eq_tail_tail_hw_read_19	(eq_tail_tail_hw_read_19),
	.eq_tail_overr_hw_ld_20	(eq_tail_overr_hw_ld_20),
	.eq_tail_overr_hw_write_20	(eq_tail_overr_hw_write_20),
	.eq_tail_tail_hw_ld_20	(eq_tail_tail_hw_ld_20),
	.eq_tail_tail_hw_write_20	(eq_tail_tail_hw_write_20),
	.eq_tail_tail_hw_read_20	(eq_tail_tail_hw_read_20),
	.eq_tail_overr_hw_ld_21	(eq_tail_overr_hw_ld_21),
	.eq_tail_overr_hw_write_21	(eq_tail_overr_hw_write_21),
	.eq_tail_tail_hw_ld_21	(eq_tail_tail_hw_ld_21),
	.eq_tail_tail_hw_write_21	(eq_tail_tail_hw_write_21),
	.eq_tail_tail_hw_read_21	(eq_tail_tail_hw_read_21),
	.eq_tail_overr_hw_ld_22	(eq_tail_overr_hw_ld_22),
	.eq_tail_overr_hw_write_22	(eq_tail_overr_hw_write_22),
	.eq_tail_tail_hw_ld_22	(eq_tail_tail_hw_ld_22),
	.eq_tail_tail_hw_write_22	(eq_tail_tail_hw_write_22),
	.eq_tail_tail_hw_read_22	(eq_tail_tail_hw_read_22),
	.eq_tail_overr_hw_ld_23	(eq_tail_overr_hw_ld_23),
	.eq_tail_overr_hw_write_23	(eq_tail_overr_hw_write_23),
	.eq_tail_tail_hw_ld_23	(eq_tail_tail_hw_ld_23),
	.eq_tail_tail_hw_write_23	(eq_tail_tail_hw_write_23),
	.eq_tail_tail_hw_read_23	(eq_tail_tail_hw_read_23),
	.eq_tail_overr_hw_ld_24	(eq_tail_overr_hw_ld_24),
	.eq_tail_overr_hw_write_24	(eq_tail_overr_hw_write_24),
	.eq_tail_tail_hw_ld_24	(eq_tail_tail_hw_ld_24),
	.eq_tail_tail_hw_write_24	(eq_tail_tail_hw_write_24),
	.eq_tail_tail_hw_read_24	(eq_tail_tail_hw_read_24),
	.eq_tail_overr_hw_ld_25	(eq_tail_overr_hw_ld_25),
	.eq_tail_overr_hw_write_25	(eq_tail_overr_hw_write_25),
	.eq_tail_tail_hw_ld_25	(eq_tail_tail_hw_ld_25),
	.eq_tail_tail_hw_write_25	(eq_tail_tail_hw_write_25),
	.eq_tail_tail_hw_read_25	(eq_tail_tail_hw_read_25),
	.eq_tail_overr_hw_ld_26	(eq_tail_overr_hw_ld_26),
	.eq_tail_overr_hw_write_26	(eq_tail_overr_hw_write_26),
	.eq_tail_tail_hw_ld_26	(eq_tail_tail_hw_ld_26),
	.eq_tail_tail_hw_write_26	(eq_tail_tail_hw_write_26),
	.eq_tail_tail_hw_read_26	(eq_tail_tail_hw_read_26),
	.eq_tail_overr_hw_ld_27	(eq_tail_overr_hw_ld_27),
	.eq_tail_overr_hw_write_27	(eq_tail_overr_hw_write_27),
	.eq_tail_tail_hw_ld_27	(eq_tail_tail_hw_ld_27),
	.eq_tail_tail_hw_write_27	(eq_tail_tail_hw_write_27),
	.eq_tail_tail_hw_read_27	(eq_tail_tail_hw_read_27),
	.eq_tail_overr_hw_ld_28	(eq_tail_overr_hw_ld_28),
	.eq_tail_overr_hw_write_28	(eq_tail_overr_hw_write_28),
	.eq_tail_tail_hw_ld_28	(eq_tail_tail_hw_ld_28),
	.eq_tail_tail_hw_write_28	(eq_tail_tail_hw_write_28),
	.eq_tail_tail_hw_read_28	(eq_tail_tail_hw_read_28),
	.eq_tail_overr_hw_ld_29	(eq_tail_overr_hw_ld_29),
	.eq_tail_overr_hw_write_29	(eq_tail_overr_hw_write_29),
	.eq_tail_tail_hw_ld_29	(eq_tail_tail_hw_ld_29),
	.eq_tail_tail_hw_write_29	(eq_tail_tail_hw_write_29),
	.eq_tail_tail_hw_read_29	(eq_tail_tail_hw_read_29),
	.eq_tail_overr_hw_ld_30	(eq_tail_overr_hw_ld_30),
	.eq_tail_overr_hw_write_30	(eq_tail_overr_hw_write_30),
	.eq_tail_tail_hw_ld_30	(eq_tail_tail_hw_ld_30),
	.eq_tail_tail_hw_write_30	(eq_tail_tail_hw_write_30),
	.eq_tail_tail_hw_read_30	(eq_tail_tail_hw_read_30),
	.eq_tail_overr_hw_ld_31	(eq_tail_overr_hw_ld_31),
	.eq_tail_overr_hw_write_31	(eq_tail_overr_hw_write_31),
	.eq_tail_tail_hw_ld_31	(eq_tail_tail_hw_ld_31),
	.eq_tail_tail_hw_write_31	(eq_tail_tail_hw_write_31),
	.eq_tail_tail_hw_read_31	(eq_tail_tail_hw_read_31),
	.eq_tail_overr_hw_ld_32	(eq_tail_overr_hw_ld_32),
	.eq_tail_overr_hw_write_32	(eq_tail_overr_hw_write_32),
	.eq_tail_tail_hw_ld_32	(eq_tail_tail_hw_ld_32),
	.eq_tail_tail_hw_write_32	(eq_tail_tail_hw_write_32),
	.eq_tail_tail_hw_read_32	(eq_tail_tail_hw_read_32),
	.eq_tail_overr_hw_ld_33	(eq_tail_overr_hw_ld_33),
	.eq_tail_overr_hw_write_33	(eq_tail_overr_hw_write_33),
	.eq_tail_tail_hw_ld_33	(eq_tail_tail_hw_ld_33),
	.eq_tail_tail_hw_write_33	(eq_tail_tail_hw_write_33),
	.eq_tail_tail_hw_read_33	(eq_tail_tail_hw_read_33),
	.eq_tail_overr_hw_ld_34	(eq_tail_overr_hw_ld_34),
	.eq_tail_overr_hw_write_34	(eq_tail_overr_hw_write_34),
	.eq_tail_tail_hw_ld_34	(eq_tail_tail_hw_ld_34),
	.eq_tail_tail_hw_write_34	(eq_tail_tail_hw_write_34),
	.eq_tail_tail_hw_read_34	(eq_tail_tail_hw_read_34),
	.eq_tail_overr_hw_ld_35	(eq_tail_overr_hw_ld_35),
	.eq_tail_overr_hw_write_35	(eq_tail_overr_hw_write_35),
	.eq_tail_tail_hw_ld_35	(eq_tail_tail_hw_ld_35),
	.eq_tail_tail_hw_write_35	(eq_tail_tail_hw_write_35),
	.eq_tail_tail_hw_read_35	(eq_tail_tail_hw_read_35),
	.eq_tail_select_pulse_0	(default_grp_eq_tail_select_pulse_0),
	.eq_tail_select_pulse_1	(default_grp_eq_tail_select_pulse_1),
	.eq_tail_select_pulse_2	(default_grp_eq_tail_select_pulse_2),
	.eq_tail_select_pulse_3	(default_grp_eq_tail_select_pulse_3),
	.eq_tail_select_pulse_4	(default_grp_eq_tail_select_pulse_4),
	.eq_tail_select_pulse_5	(default_grp_eq_tail_select_pulse_5),
	.eq_tail_select_pulse_6	(default_grp_eq_tail_select_pulse_6),
	.eq_tail_select_pulse_7	(default_grp_eq_tail_select_pulse_7),
	.eq_tail_select_pulse_8	(default_grp_eq_tail_select_pulse_8),
	.eq_tail_select_pulse_9	(default_grp_eq_tail_select_pulse_9),
	.eq_tail_select_pulse_10	(default_grp_eq_tail_select_pulse_10),
	.eq_tail_select_pulse_11	(default_grp_eq_tail_select_pulse_11),
	.eq_tail_select_pulse_12	(default_grp_eq_tail_select_pulse_12),
	.eq_tail_select_pulse_13	(default_grp_eq_tail_select_pulse_13),
	.eq_tail_select_pulse_14	(default_grp_eq_tail_select_pulse_14),
	.eq_tail_select_pulse_15	(default_grp_eq_tail_select_pulse_15),
	.eq_tail_select_pulse_16	(default_grp_eq_tail_select_pulse_16),
	.eq_tail_select_pulse_17	(default_grp_eq_tail_select_pulse_17),
	.eq_tail_select_pulse_18	(default_grp_eq_tail_select_pulse_18),
	.eq_tail_select_pulse_19	(default_grp_eq_tail_select_pulse_19),
	.eq_tail_select_pulse_20	(default_grp_eq_tail_select_pulse_20),
	.eq_tail_select_pulse_21	(default_grp_eq_tail_select_pulse_21),
	.eq_tail_select_pulse_22	(default_grp_eq_tail_select_pulse_22),
	.eq_tail_select_pulse_23	(default_grp_eq_tail_select_pulse_23),
	.eq_tail_select_pulse_24	(default_grp_eq_tail_select_pulse_24),
	.eq_tail_select_pulse_25	(default_grp_eq_tail_select_pulse_25),
	.eq_tail_select_pulse_26	(default_grp_eq_tail_select_pulse_26),
	.eq_tail_select_pulse_27	(default_grp_eq_tail_select_pulse_27),
	.eq_tail_select_pulse_28	(default_grp_eq_tail_select_pulse_28),
	.eq_tail_select_pulse_29	(default_grp_eq_tail_select_pulse_29),
	.eq_tail_select_pulse_30	(default_grp_eq_tail_select_pulse_30),
	.eq_tail_select_pulse_31	(default_grp_eq_tail_select_pulse_31),
	.eq_tail_select_pulse_32	(default_grp_eq_tail_select_pulse_32),
	.eq_tail_select_pulse_33	(default_grp_eq_tail_select_pulse_33),
	.eq_tail_select_pulse_34	(default_grp_eq_tail_select_pulse_34),
	.eq_tail_select_pulse_35	(default_grp_eq_tail_select_pulse_35),
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
	.eq_head_head_hw_read_35	(eq_head_head_hw_read_35),
	.eq_head_select_pulse_0	(default_grp_eq_head_select_pulse_0),
	.eq_head_select_pulse_1	(default_grp_eq_head_select_pulse_1),
	.eq_head_select_pulse_2	(default_grp_eq_head_select_pulse_2),
	.eq_head_select_pulse_3	(default_grp_eq_head_select_pulse_3),
	.eq_head_select_pulse_4	(default_grp_eq_head_select_pulse_4),
	.eq_head_select_pulse_5	(default_grp_eq_head_select_pulse_5),
	.eq_head_select_pulse_6	(default_grp_eq_head_select_pulse_6),
	.eq_head_select_pulse_7	(default_grp_eq_head_select_pulse_7),
	.eq_head_select_pulse_8	(default_grp_eq_head_select_pulse_8),
	.eq_head_select_pulse_9	(default_grp_eq_head_select_pulse_9),
	.eq_head_select_pulse_10	(default_grp_eq_head_select_pulse_10),
	.eq_head_select_pulse_11	(default_grp_eq_head_select_pulse_11),
	.eq_head_select_pulse_12	(default_grp_eq_head_select_pulse_12),
	.eq_head_select_pulse_13	(default_grp_eq_head_select_pulse_13),
	.eq_head_select_pulse_14	(default_grp_eq_head_select_pulse_14),
	.eq_head_select_pulse_15	(default_grp_eq_head_select_pulse_15),
	.eq_head_select_pulse_16	(default_grp_eq_head_select_pulse_16),
	.eq_head_select_pulse_17	(default_grp_eq_head_select_pulse_17),
	.eq_head_select_pulse_18	(default_grp_eq_head_select_pulse_18),
	.eq_head_select_pulse_19	(default_grp_eq_head_select_pulse_19),
	.eq_head_select_pulse_20	(default_grp_eq_head_select_pulse_20),
	.eq_head_select_pulse_21	(default_grp_eq_head_select_pulse_21),
	.eq_head_select_pulse_22	(default_grp_eq_head_select_pulse_22),
	.eq_head_select_pulse_23	(default_grp_eq_head_select_pulse_23),
	.eq_head_select_pulse_24	(default_grp_eq_head_select_pulse_24),
	.eq_head_select_pulse_25	(default_grp_eq_head_select_pulse_25),
	.eq_head_select_pulse_26	(default_grp_eq_head_select_pulse_26),
	.eq_head_select_pulse_27	(default_grp_eq_head_select_pulse_27),
	.eq_head_select_pulse_28	(default_grp_eq_head_select_pulse_28),
	.eq_head_select_pulse_29	(default_grp_eq_head_select_pulse_29),
	.eq_head_select_pulse_30	(default_grp_eq_head_select_pulse_30),
	.eq_head_select_pulse_31	(default_grp_eq_head_select_pulse_31),
	.eq_head_select_pulse_32	(default_grp_eq_head_select_pulse_32),
	.eq_head_select_pulse_33	(default_grp_eq_head_select_pulse_33),
	.eq_head_select_pulse_34	(default_grp_eq_head_select_pulse_34),
	.eq_head_select_pulse_35	(default_grp_eq_head_select_pulse_35),
	.rst_l	(stage_mux_only_rst_l),
	.daemon_csrbus_wr_in	(stage_mux_only_daemon_csrbus_wr),
	.daemon_csrbus_wr_out	(ext_wr),
	.daemon_csrbus_wr_data_in	(stage_mux_only_daemon_csrbus_wr_data),
	.read_data_0_out	(default_grp_read_data_0_out)
	);

//----- Stage: 2 / Grp: stage_mux_only (1 inputs / 1 outputs) (Mux only)
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] stage_mux_only_read_data_0_out;

dmu_imu_eqs_stage_mux_only dmu_imu_eqs_stage_mux_only
	(
	.clk	(clk),
	.read_data_0	(default_grp_read_data_0_out),
	.eq_base_address_select_pulse	(eq_base_address_select_pulse),
	.eq_base_address_select_pulse_out	(default_grp_eq_base_address_select_pulse),
	.eq_ctrl_set_select_0	(eq_ctrl_set_select_0),
	.eq_ctrl_set_select_0_out	(default_grp_eq_ctrl_set_select_0),
	.eq_ctrl_set_select_1	(eq_ctrl_set_select_1),
	.eq_ctrl_set_select_1_out	(default_grp_eq_ctrl_set_select_1),
	.eq_ctrl_set_select_2	(eq_ctrl_set_select_2),
	.eq_ctrl_set_select_2_out	(default_grp_eq_ctrl_set_select_2),
	.eq_ctrl_set_select_3	(eq_ctrl_set_select_3),
	.eq_ctrl_set_select_3_out	(default_grp_eq_ctrl_set_select_3),
	.eq_ctrl_set_select_4	(eq_ctrl_set_select_4),
	.eq_ctrl_set_select_4_out	(default_grp_eq_ctrl_set_select_4),
	.eq_ctrl_set_select_5	(eq_ctrl_set_select_5),
	.eq_ctrl_set_select_5_out	(default_grp_eq_ctrl_set_select_5),
	.eq_ctrl_set_select_6	(eq_ctrl_set_select_6),
	.eq_ctrl_set_select_6_out	(default_grp_eq_ctrl_set_select_6),
	.eq_ctrl_set_select_7	(eq_ctrl_set_select_7),
	.eq_ctrl_set_select_7_out	(default_grp_eq_ctrl_set_select_7),
	.eq_ctrl_set_select_8	(eq_ctrl_set_select_8),
	.eq_ctrl_set_select_8_out	(default_grp_eq_ctrl_set_select_8),
	.eq_ctrl_set_select_9	(eq_ctrl_set_select_9),
	.eq_ctrl_set_select_9_out	(default_grp_eq_ctrl_set_select_9),
	.eq_ctrl_set_select_10	(eq_ctrl_set_select_10),
	.eq_ctrl_set_select_10_out	(default_grp_eq_ctrl_set_select_10),
	.eq_ctrl_set_select_11	(eq_ctrl_set_select_11),
	.eq_ctrl_set_select_11_out	(default_grp_eq_ctrl_set_select_11),
	.eq_ctrl_set_select_12	(eq_ctrl_set_select_12),
	.eq_ctrl_set_select_12_out	(default_grp_eq_ctrl_set_select_12),
	.eq_ctrl_set_select_13	(eq_ctrl_set_select_13),
	.eq_ctrl_set_select_13_out	(default_grp_eq_ctrl_set_select_13),
	.eq_ctrl_set_select_14	(eq_ctrl_set_select_14),
	.eq_ctrl_set_select_14_out	(default_grp_eq_ctrl_set_select_14),
	.eq_ctrl_set_select_15	(eq_ctrl_set_select_15),
	.eq_ctrl_set_select_15_out	(default_grp_eq_ctrl_set_select_15),
	.eq_ctrl_set_select_16	(eq_ctrl_set_select_16),
	.eq_ctrl_set_select_16_out	(default_grp_eq_ctrl_set_select_16),
	.eq_ctrl_set_select_17	(eq_ctrl_set_select_17),
	.eq_ctrl_set_select_17_out	(default_grp_eq_ctrl_set_select_17),
	.eq_ctrl_set_select_18	(eq_ctrl_set_select_18),
	.eq_ctrl_set_select_18_out	(default_grp_eq_ctrl_set_select_18),
	.eq_ctrl_set_select_19	(eq_ctrl_set_select_19),
	.eq_ctrl_set_select_19_out	(default_grp_eq_ctrl_set_select_19),
	.eq_ctrl_set_select_20	(eq_ctrl_set_select_20),
	.eq_ctrl_set_select_20_out	(default_grp_eq_ctrl_set_select_20),
	.eq_ctrl_set_select_21	(eq_ctrl_set_select_21),
	.eq_ctrl_set_select_21_out	(default_grp_eq_ctrl_set_select_21),
	.eq_ctrl_set_select_22	(eq_ctrl_set_select_22),
	.eq_ctrl_set_select_22_out	(default_grp_eq_ctrl_set_select_22),
	.eq_ctrl_set_select_23	(eq_ctrl_set_select_23),
	.eq_ctrl_set_select_23_out	(default_grp_eq_ctrl_set_select_23),
	.eq_ctrl_set_select_24	(eq_ctrl_set_select_24),
	.eq_ctrl_set_select_24_out	(default_grp_eq_ctrl_set_select_24),
	.eq_ctrl_set_select_25	(eq_ctrl_set_select_25),
	.eq_ctrl_set_select_25_out	(default_grp_eq_ctrl_set_select_25),
	.eq_ctrl_set_select_26	(eq_ctrl_set_select_26),
	.eq_ctrl_set_select_26_out	(default_grp_eq_ctrl_set_select_26),
	.eq_ctrl_set_select_27	(eq_ctrl_set_select_27),
	.eq_ctrl_set_select_27_out	(default_grp_eq_ctrl_set_select_27),
	.eq_ctrl_set_select_28	(eq_ctrl_set_select_28),
	.eq_ctrl_set_select_28_out	(default_grp_eq_ctrl_set_select_28),
	.eq_ctrl_set_select_29	(eq_ctrl_set_select_29),
	.eq_ctrl_set_select_29_out	(default_grp_eq_ctrl_set_select_29),
	.eq_ctrl_set_select_30	(eq_ctrl_set_select_30),
	.eq_ctrl_set_select_30_out	(default_grp_eq_ctrl_set_select_30),
	.eq_ctrl_set_select_31	(eq_ctrl_set_select_31),
	.eq_ctrl_set_select_31_out	(default_grp_eq_ctrl_set_select_31),
	.eq_ctrl_set_select_32	(eq_ctrl_set_select_32),
	.eq_ctrl_set_select_32_out	(default_grp_eq_ctrl_set_select_32),
	.eq_ctrl_set_select_33	(eq_ctrl_set_select_33),
	.eq_ctrl_set_select_33_out	(default_grp_eq_ctrl_set_select_33),
	.eq_ctrl_set_select_34	(eq_ctrl_set_select_34),
	.eq_ctrl_set_select_34_out	(default_grp_eq_ctrl_set_select_34),
	.eq_ctrl_set_select_35	(eq_ctrl_set_select_35),
	.eq_ctrl_set_select_35_out	(default_grp_eq_ctrl_set_select_35),
	.eq_ctrl_clr_select_0	(eq_ctrl_clr_select_0),
	.eq_ctrl_clr_select_0_out	(default_grp_eq_ctrl_clr_select_0),
	.eq_ctrl_clr_select_1	(eq_ctrl_clr_select_1),
	.eq_ctrl_clr_select_1_out	(default_grp_eq_ctrl_clr_select_1),
	.eq_ctrl_clr_select_2	(eq_ctrl_clr_select_2),
	.eq_ctrl_clr_select_2_out	(default_grp_eq_ctrl_clr_select_2),
	.eq_ctrl_clr_select_3	(eq_ctrl_clr_select_3),
	.eq_ctrl_clr_select_3_out	(default_grp_eq_ctrl_clr_select_3),
	.eq_ctrl_clr_select_4	(eq_ctrl_clr_select_4),
	.eq_ctrl_clr_select_4_out	(default_grp_eq_ctrl_clr_select_4),
	.eq_ctrl_clr_select_5	(eq_ctrl_clr_select_5),
	.eq_ctrl_clr_select_5_out	(default_grp_eq_ctrl_clr_select_5),
	.eq_ctrl_clr_select_6	(eq_ctrl_clr_select_6),
	.eq_ctrl_clr_select_6_out	(default_grp_eq_ctrl_clr_select_6),
	.eq_ctrl_clr_select_7	(eq_ctrl_clr_select_7),
	.eq_ctrl_clr_select_7_out	(default_grp_eq_ctrl_clr_select_7),
	.eq_ctrl_clr_select_8	(eq_ctrl_clr_select_8),
	.eq_ctrl_clr_select_8_out	(default_grp_eq_ctrl_clr_select_8),
	.eq_ctrl_clr_select_9	(eq_ctrl_clr_select_9),
	.eq_ctrl_clr_select_9_out	(default_grp_eq_ctrl_clr_select_9),
	.eq_ctrl_clr_select_10	(eq_ctrl_clr_select_10),
	.eq_ctrl_clr_select_10_out	(default_grp_eq_ctrl_clr_select_10),
	.eq_ctrl_clr_select_11	(eq_ctrl_clr_select_11),
	.eq_ctrl_clr_select_11_out	(default_grp_eq_ctrl_clr_select_11),
	.eq_ctrl_clr_select_12	(eq_ctrl_clr_select_12),
	.eq_ctrl_clr_select_12_out	(default_grp_eq_ctrl_clr_select_12),
	.eq_ctrl_clr_select_13	(eq_ctrl_clr_select_13),
	.eq_ctrl_clr_select_13_out	(default_grp_eq_ctrl_clr_select_13),
	.eq_ctrl_clr_select_14	(eq_ctrl_clr_select_14),
	.eq_ctrl_clr_select_14_out	(default_grp_eq_ctrl_clr_select_14),
	.eq_ctrl_clr_select_15	(eq_ctrl_clr_select_15),
	.eq_ctrl_clr_select_15_out	(default_grp_eq_ctrl_clr_select_15),
	.eq_ctrl_clr_select_16	(eq_ctrl_clr_select_16),
	.eq_ctrl_clr_select_16_out	(default_grp_eq_ctrl_clr_select_16),
	.eq_ctrl_clr_select_17	(eq_ctrl_clr_select_17),
	.eq_ctrl_clr_select_17_out	(default_grp_eq_ctrl_clr_select_17),
	.eq_ctrl_clr_select_18	(eq_ctrl_clr_select_18),
	.eq_ctrl_clr_select_18_out	(default_grp_eq_ctrl_clr_select_18),
	.eq_ctrl_clr_select_19	(eq_ctrl_clr_select_19),
	.eq_ctrl_clr_select_19_out	(default_grp_eq_ctrl_clr_select_19),
	.eq_ctrl_clr_select_20	(eq_ctrl_clr_select_20),
	.eq_ctrl_clr_select_20_out	(default_grp_eq_ctrl_clr_select_20),
	.eq_ctrl_clr_select_21	(eq_ctrl_clr_select_21),
	.eq_ctrl_clr_select_21_out	(default_grp_eq_ctrl_clr_select_21),
	.eq_ctrl_clr_select_22	(eq_ctrl_clr_select_22),
	.eq_ctrl_clr_select_22_out	(default_grp_eq_ctrl_clr_select_22),
	.eq_ctrl_clr_select_23	(eq_ctrl_clr_select_23),
	.eq_ctrl_clr_select_23_out	(default_grp_eq_ctrl_clr_select_23),
	.eq_ctrl_clr_select_24	(eq_ctrl_clr_select_24),
	.eq_ctrl_clr_select_24_out	(default_grp_eq_ctrl_clr_select_24),
	.eq_ctrl_clr_select_25	(eq_ctrl_clr_select_25),
	.eq_ctrl_clr_select_25_out	(default_grp_eq_ctrl_clr_select_25),
	.eq_ctrl_clr_select_26	(eq_ctrl_clr_select_26),
	.eq_ctrl_clr_select_26_out	(default_grp_eq_ctrl_clr_select_26),
	.eq_ctrl_clr_select_27	(eq_ctrl_clr_select_27),
	.eq_ctrl_clr_select_27_out	(default_grp_eq_ctrl_clr_select_27),
	.eq_ctrl_clr_select_28	(eq_ctrl_clr_select_28),
	.eq_ctrl_clr_select_28_out	(default_grp_eq_ctrl_clr_select_28),
	.eq_ctrl_clr_select_29	(eq_ctrl_clr_select_29),
	.eq_ctrl_clr_select_29_out	(default_grp_eq_ctrl_clr_select_29),
	.eq_ctrl_clr_select_30	(eq_ctrl_clr_select_30),
	.eq_ctrl_clr_select_30_out	(default_grp_eq_ctrl_clr_select_30),
	.eq_ctrl_clr_select_31	(eq_ctrl_clr_select_31),
	.eq_ctrl_clr_select_31_out	(default_grp_eq_ctrl_clr_select_31),
	.eq_ctrl_clr_select_32	(eq_ctrl_clr_select_32),
	.eq_ctrl_clr_select_32_out	(default_grp_eq_ctrl_clr_select_32),
	.eq_ctrl_clr_select_33	(eq_ctrl_clr_select_33),
	.eq_ctrl_clr_select_33_out	(default_grp_eq_ctrl_clr_select_33),
	.eq_ctrl_clr_select_34	(eq_ctrl_clr_select_34),
	.eq_ctrl_clr_select_34_out	(default_grp_eq_ctrl_clr_select_34),
	.eq_ctrl_clr_select_35	(eq_ctrl_clr_select_35),
	.eq_ctrl_clr_select_35_out	(default_grp_eq_ctrl_clr_select_35),
	.eq_state_select_0	(eq_state_select_0),
	.eq_state_select_0_out	(default_grp_eq_state_select_0),
	.eq_state_select_1	(eq_state_select_1),
	.eq_state_select_1_out	(default_grp_eq_state_select_1),
	.eq_state_select_2	(eq_state_select_2),
	.eq_state_select_2_out	(default_grp_eq_state_select_2),
	.eq_state_select_3	(eq_state_select_3),
	.eq_state_select_3_out	(default_grp_eq_state_select_3),
	.eq_state_select_4	(eq_state_select_4),
	.eq_state_select_4_out	(default_grp_eq_state_select_4),
	.eq_state_select_5	(eq_state_select_5),
	.eq_state_select_5_out	(default_grp_eq_state_select_5),
	.eq_state_select_6	(eq_state_select_6),
	.eq_state_select_6_out	(default_grp_eq_state_select_6),
	.eq_state_select_7	(eq_state_select_7),
	.eq_state_select_7_out	(default_grp_eq_state_select_7),
	.eq_state_select_8	(eq_state_select_8),
	.eq_state_select_8_out	(default_grp_eq_state_select_8),
	.eq_state_select_9	(eq_state_select_9),
	.eq_state_select_9_out	(default_grp_eq_state_select_9),
	.eq_state_select_10	(eq_state_select_10),
	.eq_state_select_10_out	(default_grp_eq_state_select_10),
	.eq_state_select_11	(eq_state_select_11),
	.eq_state_select_11_out	(default_grp_eq_state_select_11),
	.eq_state_select_12	(eq_state_select_12),
	.eq_state_select_12_out	(default_grp_eq_state_select_12),
	.eq_state_select_13	(eq_state_select_13),
	.eq_state_select_13_out	(default_grp_eq_state_select_13),
	.eq_state_select_14	(eq_state_select_14),
	.eq_state_select_14_out	(default_grp_eq_state_select_14),
	.eq_state_select_15	(eq_state_select_15),
	.eq_state_select_15_out	(default_grp_eq_state_select_15),
	.eq_state_select_16	(eq_state_select_16),
	.eq_state_select_16_out	(default_grp_eq_state_select_16),
	.eq_state_select_17	(eq_state_select_17),
	.eq_state_select_17_out	(default_grp_eq_state_select_17),
	.eq_state_select_18	(eq_state_select_18),
	.eq_state_select_18_out	(default_grp_eq_state_select_18),
	.eq_state_select_19	(eq_state_select_19),
	.eq_state_select_19_out	(default_grp_eq_state_select_19),
	.eq_state_select_20	(eq_state_select_20),
	.eq_state_select_20_out	(default_grp_eq_state_select_20),
	.eq_state_select_21	(eq_state_select_21),
	.eq_state_select_21_out	(default_grp_eq_state_select_21),
	.eq_state_select_22	(eq_state_select_22),
	.eq_state_select_22_out	(default_grp_eq_state_select_22),
	.eq_state_select_23	(eq_state_select_23),
	.eq_state_select_23_out	(default_grp_eq_state_select_23),
	.eq_state_select_24	(eq_state_select_24),
	.eq_state_select_24_out	(default_grp_eq_state_select_24),
	.eq_state_select_25	(eq_state_select_25),
	.eq_state_select_25_out	(default_grp_eq_state_select_25),
	.eq_state_select_26	(eq_state_select_26),
	.eq_state_select_26_out	(default_grp_eq_state_select_26),
	.eq_state_select_27	(eq_state_select_27),
	.eq_state_select_27_out	(default_grp_eq_state_select_27),
	.eq_state_select_28	(eq_state_select_28),
	.eq_state_select_28_out	(default_grp_eq_state_select_28),
	.eq_state_select_29	(eq_state_select_29),
	.eq_state_select_29_out	(default_grp_eq_state_select_29),
	.eq_state_select_30	(eq_state_select_30),
	.eq_state_select_30_out	(default_grp_eq_state_select_30),
	.eq_state_select_31	(eq_state_select_31),
	.eq_state_select_31_out	(default_grp_eq_state_select_31),
	.eq_state_select_32	(eq_state_select_32),
	.eq_state_select_32_out	(default_grp_eq_state_select_32),
	.eq_state_select_33	(eq_state_select_33),
	.eq_state_select_33_out	(default_grp_eq_state_select_33),
	.eq_state_select_34	(eq_state_select_34),
	.eq_state_select_34_out	(default_grp_eq_state_select_34),
	.eq_state_select_35	(eq_state_select_35),
	.eq_state_select_35_out	(default_grp_eq_state_select_35),
	.eq_tail_select_pulse_0	(eq_tail_select_pulse_0),
	.eq_tail_select_pulse_0_out	(default_grp_eq_tail_select_pulse_0),
	.eq_tail_select_pulse_1	(eq_tail_select_pulse_1),
	.eq_tail_select_pulse_1_out	(default_grp_eq_tail_select_pulse_1),
	.eq_tail_select_pulse_2	(eq_tail_select_pulse_2),
	.eq_tail_select_pulse_2_out	(default_grp_eq_tail_select_pulse_2),
	.eq_tail_select_pulse_3	(eq_tail_select_pulse_3),
	.eq_tail_select_pulse_3_out	(default_grp_eq_tail_select_pulse_3),
	.eq_tail_select_pulse_4	(eq_tail_select_pulse_4),
	.eq_tail_select_pulse_4_out	(default_grp_eq_tail_select_pulse_4),
	.eq_tail_select_pulse_5	(eq_tail_select_pulse_5),
	.eq_tail_select_pulse_5_out	(default_grp_eq_tail_select_pulse_5),
	.eq_tail_select_pulse_6	(eq_tail_select_pulse_6),
	.eq_tail_select_pulse_6_out	(default_grp_eq_tail_select_pulse_6),
	.eq_tail_select_pulse_7	(eq_tail_select_pulse_7),
	.eq_tail_select_pulse_7_out	(default_grp_eq_tail_select_pulse_7),
	.eq_tail_select_pulse_8	(eq_tail_select_pulse_8),
	.eq_tail_select_pulse_8_out	(default_grp_eq_tail_select_pulse_8),
	.eq_tail_select_pulse_9	(eq_tail_select_pulse_9),
	.eq_tail_select_pulse_9_out	(default_grp_eq_tail_select_pulse_9),
	.eq_tail_select_pulse_10	(eq_tail_select_pulse_10),
	.eq_tail_select_pulse_10_out	(default_grp_eq_tail_select_pulse_10),
	.eq_tail_select_pulse_11	(eq_tail_select_pulse_11),
	.eq_tail_select_pulse_11_out	(default_grp_eq_tail_select_pulse_11),
	.eq_tail_select_pulse_12	(eq_tail_select_pulse_12),
	.eq_tail_select_pulse_12_out	(default_grp_eq_tail_select_pulse_12),
	.eq_tail_select_pulse_13	(eq_tail_select_pulse_13),
	.eq_tail_select_pulse_13_out	(default_grp_eq_tail_select_pulse_13),
	.eq_tail_select_pulse_14	(eq_tail_select_pulse_14),
	.eq_tail_select_pulse_14_out	(default_grp_eq_tail_select_pulse_14),
	.eq_tail_select_pulse_15	(eq_tail_select_pulse_15),
	.eq_tail_select_pulse_15_out	(default_grp_eq_tail_select_pulse_15),
	.eq_tail_select_pulse_16	(eq_tail_select_pulse_16),
	.eq_tail_select_pulse_16_out	(default_grp_eq_tail_select_pulse_16),
	.eq_tail_select_pulse_17	(eq_tail_select_pulse_17),
	.eq_tail_select_pulse_17_out	(default_grp_eq_tail_select_pulse_17),
	.eq_tail_select_pulse_18	(eq_tail_select_pulse_18),
	.eq_tail_select_pulse_18_out	(default_grp_eq_tail_select_pulse_18),
	.eq_tail_select_pulse_19	(eq_tail_select_pulse_19),
	.eq_tail_select_pulse_19_out	(default_grp_eq_tail_select_pulse_19),
	.eq_tail_select_pulse_20	(eq_tail_select_pulse_20),
	.eq_tail_select_pulse_20_out	(default_grp_eq_tail_select_pulse_20),
	.eq_tail_select_pulse_21	(eq_tail_select_pulse_21),
	.eq_tail_select_pulse_21_out	(default_grp_eq_tail_select_pulse_21),
	.eq_tail_select_pulse_22	(eq_tail_select_pulse_22),
	.eq_tail_select_pulse_22_out	(default_grp_eq_tail_select_pulse_22),
	.eq_tail_select_pulse_23	(eq_tail_select_pulse_23),
	.eq_tail_select_pulse_23_out	(default_grp_eq_tail_select_pulse_23),
	.eq_tail_select_pulse_24	(eq_tail_select_pulse_24),
	.eq_tail_select_pulse_24_out	(default_grp_eq_tail_select_pulse_24),
	.eq_tail_select_pulse_25	(eq_tail_select_pulse_25),
	.eq_tail_select_pulse_25_out	(default_grp_eq_tail_select_pulse_25),
	.eq_tail_select_pulse_26	(eq_tail_select_pulse_26),
	.eq_tail_select_pulse_26_out	(default_grp_eq_tail_select_pulse_26),
	.eq_tail_select_pulse_27	(eq_tail_select_pulse_27),
	.eq_tail_select_pulse_27_out	(default_grp_eq_tail_select_pulse_27),
	.eq_tail_select_pulse_28	(eq_tail_select_pulse_28),
	.eq_tail_select_pulse_28_out	(default_grp_eq_tail_select_pulse_28),
	.eq_tail_select_pulse_29	(eq_tail_select_pulse_29),
	.eq_tail_select_pulse_29_out	(default_grp_eq_tail_select_pulse_29),
	.eq_tail_select_pulse_30	(eq_tail_select_pulse_30),
	.eq_tail_select_pulse_30_out	(default_grp_eq_tail_select_pulse_30),
	.eq_tail_select_pulse_31	(eq_tail_select_pulse_31),
	.eq_tail_select_pulse_31_out	(default_grp_eq_tail_select_pulse_31),
	.eq_tail_select_pulse_32	(eq_tail_select_pulse_32),
	.eq_tail_select_pulse_32_out	(default_grp_eq_tail_select_pulse_32),
	.eq_tail_select_pulse_33	(eq_tail_select_pulse_33),
	.eq_tail_select_pulse_33_out	(default_grp_eq_tail_select_pulse_33),
	.eq_tail_select_pulse_34	(eq_tail_select_pulse_34),
	.eq_tail_select_pulse_34_out	(default_grp_eq_tail_select_pulse_34),
	.eq_tail_select_pulse_35	(eq_tail_select_pulse_35),
	.eq_tail_select_pulse_35_out	(default_grp_eq_tail_select_pulse_35),
	.eq_head_select_pulse_0	(eq_head_select_pulse_0),
	.eq_head_select_pulse_0_out	(default_grp_eq_head_select_pulse_0),
	.eq_head_select_pulse_1	(eq_head_select_pulse_1),
	.eq_head_select_pulse_1_out	(default_grp_eq_head_select_pulse_1),
	.eq_head_select_pulse_2	(eq_head_select_pulse_2),
	.eq_head_select_pulse_2_out	(default_grp_eq_head_select_pulse_2),
	.eq_head_select_pulse_3	(eq_head_select_pulse_3),
	.eq_head_select_pulse_3_out	(default_grp_eq_head_select_pulse_3),
	.eq_head_select_pulse_4	(eq_head_select_pulse_4),
	.eq_head_select_pulse_4_out	(default_grp_eq_head_select_pulse_4),
	.eq_head_select_pulse_5	(eq_head_select_pulse_5),
	.eq_head_select_pulse_5_out	(default_grp_eq_head_select_pulse_5),
	.eq_head_select_pulse_6	(eq_head_select_pulse_6),
	.eq_head_select_pulse_6_out	(default_grp_eq_head_select_pulse_6),
	.eq_head_select_pulse_7	(eq_head_select_pulse_7),
	.eq_head_select_pulse_7_out	(default_grp_eq_head_select_pulse_7),
	.eq_head_select_pulse_8	(eq_head_select_pulse_8),
	.eq_head_select_pulse_8_out	(default_grp_eq_head_select_pulse_8),
	.eq_head_select_pulse_9	(eq_head_select_pulse_9),
	.eq_head_select_pulse_9_out	(default_grp_eq_head_select_pulse_9),
	.eq_head_select_pulse_10	(eq_head_select_pulse_10),
	.eq_head_select_pulse_10_out	(default_grp_eq_head_select_pulse_10),
	.eq_head_select_pulse_11	(eq_head_select_pulse_11),
	.eq_head_select_pulse_11_out	(default_grp_eq_head_select_pulse_11),
	.eq_head_select_pulse_12	(eq_head_select_pulse_12),
	.eq_head_select_pulse_12_out	(default_grp_eq_head_select_pulse_12),
	.eq_head_select_pulse_13	(eq_head_select_pulse_13),
	.eq_head_select_pulse_13_out	(default_grp_eq_head_select_pulse_13),
	.eq_head_select_pulse_14	(eq_head_select_pulse_14),
	.eq_head_select_pulse_14_out	(default_grp_eq_head_select_pulse_14),
	.eq_head_select_pulse_15	(eq_head_select_pulse_15),
	.eq_head_select_pulse_15_out	(default_grp_eq_head_select_pulse_15),
	.eq_head_select_pulse_16	(eq_head_select_pulse_16),
	.eq_head_select_pulse_16_out	(default_grp_eq_head_select_pulse_16),
	.eq_head_select_pulse_17	(eq_head_select_pulse_17),
	.eq_head_select_pulse_17_out	(default_grp_eq_head_select_pulse_17),
	.eq_head_select_pulse_18	(eq_head_select_pulse_18),
	.eq_head_select_pulse_18_out	(default_grp_eq_head_select_pulse_18),
	.eq_head_select_pulse_19	(eq_head_select_pulse_19),
	.eq_head_select_pulse_19_out	(default_grp_eq_head_select_pulse_19),
	.eq_head_select_pulse_20	(eq_head_select_pulse_20),
	.eq_head_select_pulse_20_out	(default_grp_eq_head_select_pulse_20),
	.eq_head_select_pulse_21	(eq_head_select_pulse_21),
	.eq_head_select_pulse_21_out	(default_grp_eq_head_select_pulse_21),
	.eq_head_select_pulse_22	(eq_head_select_pulse_22),
	.eq_head_select_pulse_22_out	(default_grp_eq_head_select_pulse_22),
	.eq_head_select_pulse_23	(eq_head_select_pulse_23),
	.eq_head_select_pulse_23_out	(default_grp_eq_head_select_pulse_23),
	.eq_head_select_pulse_24	(eq_head_select_pulse_24),
	.eq_head_select_pulse_24_out	(default_grp_eq_head_select_pulse_24),
	.eq_head_select_pulse_25	(eq_head_select_pulse_25),
	.eq_head_select_pulse_25_out	(default_grp_eq_head_select_pulse_25),
	.eq_head_select_pulse_26	(eq_head_select_pulse_26),
	.eq_head_select_pulse_26_out	(default_grp_eq_head_select_pulse_26),
	.eq_head_select_pulse_27	(eq_head_select_pulse_27),
	.eq_head_select_pulse_27_out	(default_grp_eq_head_select_pulse_27),
	.eq_head_select_pulse_28	(eq_head_select_pulse_28),
	.eq_head_select_pulse_28_out	(default_grp_eq_head_select_pulse_28),
	.eq_head_select_pulse_29	(eq_head_select_pulse_29),
	.eq_head_select_pulse_29_out	(default_grp_eq_head_select_pulse_29),
	.eq_head_select_pulse_30	(eq_head_select_pulse_30),
	.eq_head_select_pulse_30_out	(default_grp_eq_head_select_pulse_30),
	.eq_head_select_pulse_31	(eq_head_select_pulse_31),
	.eq_head_select_pulse_31_out	(default_grp_eq_head_select_pulse_31),
	.eq_head_select_pulse_32	(eq_head_select_pulse_32),
	.eq_head_select_pulse_32_out	(default_grp_eq_head_select_pulse_32),
	.eq_head_select_pulse_33	(eq_head_select_pulse_33),
	.eq_head_select_pulse_33_out	(default_grp_eq_head_select_pulse_33),
	.eq_head_select_pulse_34	(eq_head_select_pulse_34),
	.eq_head_select_pulse_34_out	(default_grp_eq_head_select_pulse_34),
	.eq_head_select_pulse_35	(eq_head_select_pulse_35),
	.eq_head_select_pulse_35_out	(default_grp_eq_head_select_pulse_35),
	.daemon_csrbus_wr_in	(daemon_csrbus_wr),
	.daemon_csrbus_wr_out	(stage_mux_only_daemon_csrbus_wr),
	.daemon_csrbus_wr_data_in	(daemon_csrbus_wr_data),
	.daemon_csrbus_wr_data_out	(stage_mux_only_daemon_csrbus_wr_data),
	.read_data_0_out	(stage_mux_only_read_data_0_out),
	.rst_l	(rst_l),
	.rst_l_out	(stage_mux_only_rst_l)
	);

//----- OUTPUT: csrbus_read_data
assign csrbus_read_data = stage_mux_only_read_data_0_out;

endmodule // dmu_imu_eqs_csr
