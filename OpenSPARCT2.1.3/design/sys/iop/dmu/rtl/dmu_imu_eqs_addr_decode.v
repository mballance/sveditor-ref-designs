// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_eqs_addr_decode.v
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
module dmu_imu_eqs_addr_decode 
	(
	clk,
	rst_l,
	daemon_csrbus_valid,
	daemon_csrbus_addr,
	csrbus_src_bus,
	daemon_csrbus_wr,
	daemon_csrbus_wr_out,
	daemon_csrbus_wr_data,
	daemon_csrbus_wr_data_out,
	daemon_csrbus_mapped,
	csrbus_acc_vio,
	daemon_transaction_in_progress,
	instance_id,
	daemon_csrbus_done,
	eq_base_address_select_pulse,
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
	eq_head_select_pulse_35
	);

//====================================================================
//     Polarity declarations
//====================================================================
input  clk;  // Clock signal
input  rst_l;  // Reset
input  daemon_csrbus_valid;  // Daemon_Valid
input  [`FIRE_CSRBUS_ADDR_WIDTH - 1:0] daemon_csrbus_addr;  // Daemon_Addr
input  [1:0] csrbus_src_bus;  // Source bus
input  daemon_csrbus_wr;  // Read/Write signal
output daemon_csrbus_wr_out;  // Read/Write signal
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data;  // Write data
output [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_out;  // Write data
output daemon_csrbus_mapped;  // mapped
output csrbus_acc_vio;  // acc_vio
input  daemon_transaction_in_progress;  // daemon_transaction_in_progress
input  instance_id;  // Instance ID
output daemon_csrbus_done;  // Operation is done
output eq_base_address_select_pulse;  // select signal
output eq_ctrl_set_select_0;  // select signal
output eq_ctrl_set_select_1;  // select signal
output eq_ctrl_set_select_2;  // select signal
output eq_ctrl_set_select_3;  // select signal
output eq_ctrl_set_select_4;  // select signal
output eq_ctrl_set_select_5;  // select signal
output eq_ctrl_set_select_6;  // select signal
output eq_ctrl_set_select_7;  // select signal
output eq_ctrl_set_select_8;  // select signal
output eq_ctrl_set_select_9;  // select signal
output eq_ctrl_set_select_10;  // select signal
output eq_ctrl_set_select_11;  // select signal
output eq_ctrl_set_select_12;  // select signal
output eq_ctrl_set_select_13;  // select signal
output eq_ctrl_set_select_14;  // select signal
output eq_ctrl_set_select_15;  // select signal
output eq_ctrl_set_select_16;  // select signal
output eq_ctrl_set_select_17;  // select signal
output eq_ctrl_set_select_18;  // select signal
output eq_ctrl_set_select_19;  // select signal
output eq_ctrl_set_select_20;  // select signal
output eq_ctrl_set_select_21;  // select signal
output eq_ctrl_set_select_22;  // select signal
output eq_ctrl_set_select_23;  // select signal
output eq_ctrl_set_select_24;  // select signal
output eq_ctrl_set_select_25;  // select signal
output eq_ctrl_set_select_26;  // select signal
output eq_ctrl_set_select_27;  // select signal
output eq_ctrl_set_select_28;  // select signal
output eq_ctrl_set_select_29;  // select signal
output eq_ctrl_set_select_30;  // select signal
output eq_ctrl_set_select_31;  // select signal
output eq_ctrl_set_select_32;  // select signal
output eq_ctrl_set_select_33;  // select signal
output eq_ctrl_set_select_34;  // select signal
output eq_ctrl_set_select_35;  // select signal
output eq_ctrl_clr_select_0;  // select signal
output eq_ctrl_clr_select_1;  // select signal
output eq_ctrl_clr_select_2;  // select signal
output eq_ctrl_clr_select_3;  // select signal
output eq_ctrl_clr_select_4;  // select signal
output eq_ctrl_clr_select_5;  // select signal
output eq_ctrl_clr_select_6;  // select signal
output eq_ctrl_clr_select_7;  // select signal
output eq_ctrl_clr_select_8;  // select signal
output eq_ctrl_clr_select_9;  // select signal
output eq_ctrl_clr_select_10;  // select signal
output eq_ctrl_clr_select_11;  // select signal
output eq_ctrl_clr_select_12;  // select signal
output eq_ctrl_clr_select_13;  // select signal
output eq_ctrl_clr_select_14;  // select signal
output eq_ctrl_clr_select_15;  // select signal
output eq_ctrl_clr_select_16;  // select signal
output eq_ctrl_clr_select_17;  // select signal
output eq_ctrl_clr_select_18;  // select signal
output eq_ctrl_clr_select_19;  // select signal
output eq_ctrl_clr_select_20;  // select signal
output eq_ctrl_clr_select_21;  // select signal
output eq_ctrl_clr_select_22;  // select signal
output eq_ctrl_clr_select_23;  // select signal
output eq_ctrl_clr_select_24;  // select signal
output eq_ctrl_clr_select_25;  // select signal
output eq_ctrl_clr_select_26;  // select signal
output eq_ctrl_clr_select_27;  // select signal
output eq_ctrl_clr_select_28;  // select signal
output eq_ctrl_clr_select_29;  // select signal
output eq_ctrl_clr_select_30;  // select signal
output eq_ctrl_clr_select_31;  // select signal
output eq_ctrl_clr_select_32;  // select signal
output eq_ctrl_clr_select_33;  // select signal
output eq_ctrl_clr_select_34;  // select signal
output eq_ctrl_clr_select_35;  // select signal
output eq_state_select_0;  // select signal
output eq_state_select_1;  // select signal
output eq_state_select_2;  // select signal
output eq_state_select_3;  // select signal
output eq_state_select_4;  // select signal
output eq_state_select_5;  // select signal
output eq_state_select_6;  // select signal
output eq_state_select_7;  // select signal
output eq_state_select_8;  // select signal
output eq_state_select_9;  // select signal
output eq_state_select_10;  // select signal
output eq_state_select_11;  // select signal
output eq_state_select_12;  // select signal
output eq_state_select_13;  // select signal
output eq_state_select_14;  // select signal
output eq_state_select_15;  // select signal
output eq_state_select_16;  // select signal
output eq_state_select_17;  // select signal
output eq_state_select_18;  // select signal
output eq_state_select_19;  // select signal
output eq_state_select_20;  // select signal
output eq_state_select_21;  // select signal
output eq_state_select_22;  // select signal
output eq_state_select_23;  // select signal
output eq_state_select_24;  // select signal
output eq_state_select_25;  // select signal
output eq_state_select_26;  // select signal
output eq_state_select_27;  // select signal
output eq_state_select_28;  // select signal
output eq_state_select_29;  // select signal
output eq_state_select_30;  // select signal
output eq_state_select_31;  // select signal
output eq_state_select_32;  // select signal
output eq_state_select_33;  // select signal
output eq_state_select_34;  // select signal
output eq_state_select_35;  // select signal
output eq_tail_select_pulse_0;  // select signal
output eq_tail_select_pulse_1;  // select signal
output eq_tail_select_pulse_2;  // select signal
output eq_tail_select_pulse_3;  // select signal
output eq_tail_select_pulse_4;  // select signal
output eq_tail_select_pulse_5;  // select signal
output eq_tail_select_pulse_6;  // select signal
output eq_tail_select_pulse_7;  // select signal
output eq_tail_select_pulse_8;  // select signal
output eq_tail_select_pulse_9;  // select signal
output eq_tail_select_pulse_10;  // select signal
output eq_tail_select_pulse_11;  // select signal
output eq_tail_select_pulse_12;  // select signal
output eq_tail_select_pulse_13;  // select signal
output eq_tail_select_pulse_14;  // select signal
output eq_tail_select_pulse_15;  // select signal
output eq_tail_select_pulse_16;  // select signal
output eq_tail_select_pulse_17;  // select signal
output eq_tail_select_pulse_18;  // select signal
output eq_tail_select_pulse_19;  // select signal
output eq_tail_select_pulse_20;  // select signal
output eq_tail_select_pulse_21;  // select signal
output eq_tail_select_pulse_22;  // select signal
output eq_tail_select_pulse_23;  // select signal
output eq_tail_select_pulse_24;  // select signal
output eq_tail_select_pulse_25;  // select signal
output eq_tail_select_pulse_26;  // select signal
output eq_tail_select_pulse_27;  // select signal
output eq_tail_select_pulse_28;  // select signal
output eq_tail_select_pulse_29;  // select signal
output eq_tail_select_pulse_30;  // select signal
output eq_tail_select_pulse_31;  // select signal
output eq_tail_select_pulse_32;  // select signal
output eq_tail_select_pulse_33;  // select signal
output eq_tail_select_pulse_34;  // select signal
output eq_tail_select_pulse_35;  // select signal
output eq_head_select_pulse_0;  // select signal
output eq_head_select_pulse_1;  // select signal
output eq_head_select_pulse_2;  // select signal
output eq_head_select_pulse_3;  // select signal
output eq_head_select_pulse_4;  // select signal
output eq_head_select_pulse_5;  // select signal
output eq_head_select_pulse_6;  // select signal
output eq_head_select_pulse_7;  // select signal
output eq_head_select_pulse_8;  // select signal
output eq_head_select_pulse_9;  // select signal
output eq_head_select_pulse_10;  // select signal
output eq_head_select_pulse_11;  // select signal
output eq_head_select_pulse_12;  // select signal
output eq_head_select_pulse_13;  // select signal
output eq_head_select_pulse_14;  // select signal
output eq_head_select_pulse_15;  // select signal
output eq_head_select_pulse_16;  // select signal
output eq_head_select_pulse_17;  // select signal
output eq_head_select_pulse_18;  // select signal
output eq_head_select_pulse_19;  // select signal
output eq_head_select_pulse_20;  // select signal
output eq_head_select_pulse_21;  // select signal
output eq_head_select_pulse_22;  // select signal
output eq_head_select_pulse_23;  // select signal
output eq_head_select_pulse_24;  // select signal
output eq_head_select_pulse_25;  // select signal
output eq_head_select_pulse_26;  // select signal
output eq_head_select_pulse_27;  // select signal
output eq_head_select_pulse_28;  // select signal
output eq_head_select_pulse_29;  // select signal
output eq_head_select_pulse_30;  // select signal
output eq_head_select_pulse_31;  // select signal
output eq_head_select_pulse_32;  // select signal
output eq_head_select_pulse_33;  // select signal
output eq_head_select_pulse_34;  // select signal
output eq_head_select_pulse_35;  // select signal

//====================================================================
//     Type declarations
//====================================================================
wire clk;  // Clock signal
wire rst_l;  // Reset
wire daemon_csrbus_valid;  // Daemon_Valid
wire [`FIRE_CSRBUS_ADDR_WIDTH - 1:0] daemon_csrbus_addr;  // Daemon_Addr
wire [1:0] csrbus_src_bus;  // Source bus
wire daemon_csrbus_wr;  // Read/Write signal
reg daemon_csrbus_wr_out;  // Read/Write signal
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data;  // Write data
reg [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_out;  // Write data
wire daemon_csrbus_mapped;  // mapped
wire csrbus_acc_vio;  // acc_vio
wire daemon_transaction_in_progress;  // daemon_transaction_in_progress
wire instance_id;  // Instance ID
wire daemon_csrbus_done;  // Operation is done
reg eq_base_address_select_pulse;  // select signal
reg eq_ctrl_set_select_0;  // select signal
reg eq_ctrl_set_select_1;  // select signal
reg eq_ctrl_set_select_2;  // select signal
reg eq_ctrl_set_select_3;  // select signal
reg eq_ctrl_set_select_4;  // select signal
reg eq_ctrl_set_select_5;  // select signal
reg eq_ctrl_set_select_6;  // select signal
reg eq_ctrl_set_select_7;  // select signal
reg eq_ctrl_set_select_8;  // select signal
reg eq_ctrl_set_select_9;  // select signal
reg eq_ctrl_set_select_10;  // select signal
reg eq_ctrl_set_select_11;  // select signal
reg eq_ctrl_set_select_12;  // select signal
reg eq_ctrl_set_select_13;  // select signal
reg eq_ctrl_set_select_14;  // select signal
reg eq_ctrl_set_select_15;  // select signal
reg eq_ctrl_set_select_16;  // select signal
reg eq_ctrl_set_select_17;  // select signal
reg eq_ctrl_set_select_18;  // select signal
reg eq_ctrl_set_select_19;  // select signal
reg eq_ctrl_set_select_20;  // select signal
reg eq_ctrl_set_select_21;  // select signal
reg eq_ctrl_set_select_22;  // select signal
reg eq_ctrl_set_select_23;  // select signal
reg eq_ctrl_set_select_24;  // select signal
reg eq_ctrl_set_select_25;  // select signal
reg eq_ctrl_set_select_26;  // select signal
reg eq_ctrl_set_select_27;  // select signal
reg eq_ctrl_set_select_28;  // select signal
reg eq_ctrl_set_select_29;  // select signal
reg eq_ctrl_set_select_30;  // select signal
reg eq_ctrl_set_select_31;  // select signal
reg eq_ctrl_set_select_32;  // select signal
reg eq_ctrl_set_select_33;  // select signal
reg eq_ctrl_set_select_34;  // select signal
reg eq_ctrl_set_select_35;  // select signal
reg eq_ctrl_clr_select_0;  // select signal
reg eq_ctrl_clr_select_1;  // select signal
reg eq_ctrl_clr_select_2;  // select signal
reg eq_ctrl_clr_select_3;  // select signal
reg eq_ctrl_clr_select_4;  // select signal
reg eq_ctrl_clr_select_5;  // select signal
reg eq_ctrl_clr_select_6;  // select signal
reg eq_ctrl_clr_select_7;  // select signal
reg eq_ctrl_clr_select_8;  // select signal
reg eq_ctrl_clr_select_9;  // select signal
reg eq_ctrl_clr_select_10;  // select signal
reg eq_ctrl_clr_select_11;  // select signal
reg eq_ctrl_clr_select_12;  // select signal
reg eq_ctrl_clr_select_13;  // select signal
reg eq_ctrl_clr_select_14;  // select signal
reg eq_ctrl_clr_select_15;  // select signal
reg eq_ctrl_clr_select_16;  // select signal
reg eq_ctrl_clr_select_17;  // select signal
reg eq_ctrl_clr_select_18;  // select signal
reg eq_ctrl_clr_select_19;  // select signal
reg eq_ctrl_clr_select_20;  // select signal
reg eq_ctrl_clr_select_21;  // select signal
reg eq_ctrl_clr_select_22;  // select signal
reg eq_ctrl_clr_select_23;  // select signal
reg eq_ctrl_clr_select_24;  // select signal
reg eq_ctrl_clr_select_25;  // select signal
reg eq_ctrl_clr_select_26;  // select signal
reg eq_ctrl_clr_select_27;  // select signal
reg eq_ctrl_clr_select_28;  // select signal
reg eq_ctrl_clr_select_29;  // select signal
reg eq_ctrl_clr_select_30;  // select signal
reg eq_ctrl_clr_select_31;  // select signal
reg eq_ctrl_clr_select_32;  // select signal
reg eq_ctrl_clr_select_33;  // select signal
reg eq_ctrl_clr_select_34;  // select signal
reg eq_ctrl_clr_select_35;  // select signal
reg eq_state_select_0;  // select signal
reg eq_state_select_1;  // select signal
reg eq_state_select_2;  // select signal
reg eq_state_select_3;  // select signal
reg eq_state_select_4;  // select signal
reg eq_state_select_5;  // select signal
reg eq_state_select_6;  // select signal
reg eq_state_select_7;  // select signal
reg eq_state_select_8;  // select signal
reg eq_state_select_9;  // select signal
reg eq_state_select_10;  // select signal
reg eq_state_select_11;  // select signal
reg eq_state_select_12;  // select signal
reg eq_state_select_13;  // select signal
reg eq_state_select_14;  // select signal
reg eq_state_select_15;  // select signal
reg eq_state_select_16;  // select signal
reg eq_state_select_17;  // select signal
reg eq_state_select_18;  // select signal
reg eq_state_select_19;  // select signal
reg eq_state_select_20;  // select signal
reg eq_state_select_21;  // select signal
reg eq_state_select_22;  // select signal
reg eq_state_select_23;  // select signal
reg eq_state_select_24;  // select signal
reg eq_state_select_25;  // select signal
reg eq_state_select_26;  // select signal
reg eq_state_select_27;  // select signal
reg eq_state_select_28;  // select signal
reg eq_state_select_29;  // select signal
reg eq_state_select_30;  // select signal
reg eq_state_select_31;  // select signal
reg eq_state_select_32;  // select signal
reg eq_state_select_33;  // select signal
reg eq_state_select_34;  // select signal
reg eq_state_select_35;  // select signal
reg eq_tail_select_pulse_0;  // select signal
reg eq_tail_select_pulse_1;  // select signal
reg eq_tail_select_pulse_2;  // select signal
reg eq_tail_select_pulse_3;  // select signal
reg eq_tail_select_pulse_4;  // select signal
reg eq_tail_select_pulse_5;  // select signal
reg eq_tail_select_pulse_6;  // select signal
reg eq_tail_select_pulse_7;  // select signal
reg eq_tail_select_pulse_8;  // select signal
reg eq_tail_select_pulse_9;  // select signal
reg eq_tail_select_pulse_10;  // select signal
reg eq_tail_select_pulse_11;  // select signal
reg eq_tail_select_pulse_12;  // select signal
reg eq_tail_select_pulse_13;  // select signal
reg eq_tail_select_pulse_14;  // select signal
reg eq_tail_select_pulse_15;  // select signal
reg eq_tail_select_pulse_16;  // select signal
reg eq_tail_select_pulse_17;  // select signal
reg eq_tail_select_pulse_18;  // select signal
reg eq_tail_select_pulse_19;  // select signal
reg eq_tail_select_pulse_20;  // select signal
reg eq_tail_select_pulse_21;  // select signal
reg eq_tail_select_pulse_22;  // select signal
reg eq_tail_select_pulse_23;  // select signal
reg eq_tail_select_pulse_24;  // select signal
reg eq_tail_select_pulse_25;  // select signal
reg eq_tail_select_pulse_26;  // select signal
reg eq_tail_select_pulse_27;  // select signal
reg eq_tail_select_pulse_28;  // select signal
reg eq_tail_select_pulse_29;  // select signal
reg eq_tail_select_pulse_30;  // select signal
reg eq_tail_select_pulse_31;  // select signal
reg eq_tail_select_pulse_32;  // select signal
reg eq_tail_select_pulse_33;  // select signal
reg eq_tail_select_pulse_34;  // select signal
reg eq_tail_select_pulse_35;  // select signal
reg eq_head_select_pulse_0;  // select signal
reg eq_head_select_pulse_1;  // select signal
reg eq_head_select_pulse_2;  // select signal
reg eq_head_select_pulse_3;  // select signal
reg eq_head_select_pulse_4;  // select signal
reg eq_head_select_pulse_5;  // select signal
reg eq_head_select_pulse_6;  // select signal
reg eq_head_select_pulse_7;  // select signal
reg eq_head_select_pulse_8;  // select signal
reg eq_head_select_pulse_9;  // select signal
reg eq_head_select_pulse_10;  // select signal
reg eq_head_select_pulse_11;  // select signal
reg eq_head_select_pulse_12;  // select signal
reg eq_head_select_pulse_13;  // select signal
reg eq_head_select_pulse_14;  // select signal
reg eq_head_select_pulse_15;  // select signal
reg eq_head_select_pulse_16;  // select signal
reg eq_head_select_pulse_17;  // select signal
reg eq_head_select_pulse_18;  // select signal
reg eq_head_select_pulse_19;  // select signal
reg eq_head_select_pulse_20;  // select signal
reg eq_head_select_pulse_21;  // select signal
reg eq_head_select_pulse_22;  // select signal
reg eq_head_select_pulse_23;  // select signal
reg eq_head_select_pulse_24;  // select signal
reg eq_head_select_pulse_25;  // select signal
reg eq_head_select_pulse_26;  // select signal
reg eq_head_select_pulse_27;  // select signal
reg eq_head_select_pulse_28;  // select signal
reg eq_head_select_pulse_29;  // select signal
reg eq_head_select_pulse_30;  // select signal
reg eq_head_select_pulse_31;  // select signal
reg eq_head_select_pulse_32;  // select signal
reg eq_head_select_pulse_33;  // select signal
reg eq_head_select_pulse_34;  // select signal
reg eq_head_select_pulse_35;  // select signal


//====================================================================
//     Clocked valid
//====================================================================
reg clocked_valid;
reg clocked_valid_pulse;
always @(posedge clk)
  begin
     if(~rst_l)
       begin
          clocked_valid <= 1'b0;
          clocked_valid_pulse <= 1'b0;
       end
     else
       begin
          clocked_valid <= daemon_csrbus_valid;
          clocked_valid_pulse <= daemon_csrbus_valid & ~clocked_valid;
       end
  end

//====================================================================
//    Address Decode
//====================================================================
reg eq_base_address_addr_decoded;
reg eq_ctrl_set_addr_decoded;
reg eq_ctrl_clr_addr_decoded;
reg eq_state_addr_decoded;
reg eq_tail_addr_decoded;
reg eq_head_addr_decoded;

always @(daemon_csrbus_addr or daemon_csrbus_valid or instance_id)
  begin
    if (~daemon_csrbus_valid)
      begin
        eq_base_address_addr_decoded = 1'b0;
        eq_ctrl_set_addr_decoded = 1'b0;
        eq_ctrl_clr_addr_decoded = 1'b0;
        eq_state_addr_decoded = 1'b0;
        eq_tail_addr_decoded = 1'b0;
        eq_head_addr_decoded = 1'b0;
      end
    else
      case (instance_id)

        `FIRE_DLC_IMU_EQS_INSTANCE_ID_VALUE_A:
          begin
        eq_base_address_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_EQS_CSR_A_EQ_BASE_ADDRESS_HW_ADDR;
        eq_ctrl_set_addr_decoded =
                {6'b0,daemon_csrbus_addr[26:6]} ==
                    `FIRE_DLC_IMU_EQS_CSR_A_EQ_CTRL_SET_HW_ADDR >>
                        `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH;
        eq_ctrl_clr_addr_decoded =
                {6'b0,daemon_csrbus_addr[26:6]} ==
                    `FIRE_DLC_IMU_EQS_CSR_A_EQ_CTRL_CLR_HW_ADDR >>
                        `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH;
        eq_state_addr_decoded =
                {6'b0,daemon_csrbus_addr[26:6]} ==
                    `FIRE_DLC_IMU_EQS_CSR_A_EQ_STATE_HW_ADDR >>
                        `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH;
        eq_tail_addr_decoded =
                {6'b0,daemon_csrbus_addr[26:6]} ==
                    `FIRE_DLC_IMU_EQS_CSR_A_EQ_TAIL_HW_ADDR >>
                        `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH;
        eq_head_addr_decoded =
                {6'b0,daemon_csrbus_addr[26:6]} ==
                    `FIRE_DLC_IMU_EQS_CSR_A_EQ_HEAD_HW_ADDR >>
                        `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH;
          end

        `FIRE_DLC_IMU_EQS_INSTANCE_ID_VALUE_B:
          begin
        eq_base_address_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_EQS_CSR_B_EQ_BASE_ADDRESS_HW_ADDR;
        eq_ctrl_set_addr_decoded =
                {6'b0,daemon_csrbus_addr[26:6]} ==
                    `FIRE_DLC_IMU_EQS_CSR_B_EQ_CTRL_SET_HW_ADDR >>
                        `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH;
        eq_ctrl_clr_addr_decoded =
                {6'b0,daemon_csrbus_addr[26:6]} ==
                    `FIRE_DLC_IMU_EQS_CSR_B_EQ_CTRL_CLR_HW_ADDR >>
                        `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH;
        eq_state_addr_decoded =
                {6'b0,daemon_csrbus_addr[26:6]} ==
                    `FIRE_DLC_IMU_EQS_CSR_B_EQ_STATE_HW_ADDR >>
                        `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH;
        eq_tail_addr_decoded =
                {6'b0,daemon_csrbus_addr[26:6]} ==
                    `FIRE_DLC_IMU_EQS_CSR_B_EQ_TAIL_HW_ADDR >>
                        `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH;
        eq_head_addr_decoded =
                {6'b0,daemon_csrbus_addr[26:6]} ==
                    `FIRE_DLC_IMU_EQS_CSR_B_EQ_HEAD_HW_ADDR >>
                        `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH;
          end

        default:
          begin
            eq_base_address_addr_decoded = 1'b0;
            eq_ctrl_set_addr_decoded = 1'b0;
            eq_ctrl_clr_addr_decoded = 1'b0;
            eq_state_addr_decoded = 1'b0;
            eq_tail_addr_decoded = 1'b0;
            eq_head_addr_decoded = 1'b0;
// vlint flag_system_call off
            // synopsys translate_off
            if(daemon_csrbus_valid)
               begin // axis tbcall_region
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_eqs_addr_decode",`MON_ERROR,"ERROR: Instance ID for module dmu_imu_eqs_csr is bad"); `endif
               end // end of tbcall_region
            // synopsys translate_on
// vlint flag_system_call on
          end
      endcase
  end

//====================================================================
//      Register violations
//====================================================================
//----- reg_acc_vio: eq_base_address
reg eq_base_address_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         eq_base_address_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~eq_base_address_addr_decoded)
      eq_base_address_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              eq_base_address_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              eq_base_address_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              eq_base_address_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              eq_base_address_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              eq_base_address_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              eq_base_address_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              eq_base_address_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              eq_base_address_acc_vio = 1'b0;

          default: 
             begin
                eq_base_address_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_eqs_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_eqs_csr_a_eq_base_address"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: eq_ctrl_set
reg eq_ctrl_set_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         eq_ctrl_set_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~eq_ctrl_set_addr_decoded)
      eq_ctrl_set_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              eq_ctrl_set_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              eq_ctrl_set_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              eq_ctrl_set_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              eq_ctrl_set_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              eq_ctrl_set_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              eq_ctrl_set_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              eq_ctrl_set_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              eq_ctrl_set_acc_vio = 1'b0;

          default: 
             begin
                eq_ctrl_set_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_eqs_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_eqs_csr_a_eq_ctrl_set"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: eq_ctrl_clr
reg eq_ctrl_clr_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         eq_ctrl_clr_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~eq_ctrl_clr_addr_decoded)
      eq_ctrl_clr_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              eq_ctrl_clr_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              eq_ctrl_clr_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              eq_ctrl_clr_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              eq_ctrl_clr_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              eq_ctrl_clr_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              eq_ctrl_clr_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              eq_ctrl_clr_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              eq_ctrl_clr_acc_vio = 1'b0;

          default: 
             begin
                eq_ctrl_clr_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_eqs_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_eqs_csr_a_eq_ctrl_clr"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: eq_state
reg eq_state_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         eq_state_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~eq_state_addr_decoded)
      eq_state_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              eq_state_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              eq_state_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              eq_state_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              eq_state_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              eq_state_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              eq_state_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              eq_state_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              eq_state_acc_vio = 1'b0;

          default: 
             begin
                eq_state_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_eqs_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_eqs_csr_a_eq_state"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: eq_tail
reg eq_tail_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         eq_tail_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~eq_tail_addr_decoded)
      eq_tail_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              eq_tail_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              eq_tail_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              eq_tail_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              eq_tail_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              eq_tail_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              eq_tail_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              eq_tail_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              eq_tail_acc_vio = 1'b0;

          default: 
             begin
                eq_tail_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_eqs_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_eqs_csr_a_eq_tail"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: eq_head
reg eq_head_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         eq_head_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~eq_head_addr_decoded)
      eq_head_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              eq_head_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              eq_head_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              eq_head_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              eq_head_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              eq_head_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              eq_head_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              eq_head_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              eq_head_acc_vio = 1'b0;

          default: 
             begin
                eq_head_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_eqs_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_eqs_csr_a_eq_head"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end

//====================================================================
//    Status: daemon_csrbus_mapped / csrbus_acc_vio
//====================================================================
//----- OUTPUT: daemon_csrbus_mapped
assign daemon_csrbus_mapped = clocked_valid_pulse &
                                (
                                  eq_base_address_addr_decoded |
                                  eq_ctrl_set_addr_decoded |
                                  eq_ctrl_clr_addr_decoded |
                                  eq_state_addr_decoded |
                                  eq_tail_addr_decoded |
                                  eq_head_addr_decoded
                                );


// daemon_csrbus_mapped gets asserted after fixed number of cycles
// after daemon_csrbus_valid become high
/* 0in assert_together -name mapped_after_valid
       -leader $0in_rising_edge($0in_delay(daemon_csrbus_valid, 1))
       -follower $0in_rising_edge(daemon_csrbus_mapped)
       -message ("daemon_csrbus_mapped was not asserted 1 clock cycles from csrbus_valid")
       -module dmu_imu_eqs_addr_decode
       -clock clk
       -active $0in_rising_edge(daemon_csrbus_mapped)
*/

// daemon_csrbus_mapped is a pulse
/* 0in assert_timer -name daemon_csrbus_mapped_pulse
       -var daemon_csrbus_mapped -max 1
       -message "daemon_csrbus_mapped pulse length is not 1"
       -module dmu_imu_eqs_addr_decode
       -clock clk
*/
//----- OUTPUT: csrbus_acc_vio
assign csrbus_acc_vio = clocked_valid_pulse &
                        eq_base_address_acc_vio |
                        eq_ctrl_set_acc_vio |
                        eq_ctrl_clr_acc_vio |
                        eq_state_acc_vio |
                        eq_tail_acc_vio |
                        eq_head_acc_vio;

//====================================================================
//    Select
//====================================================================
always @(posedge clk)
  begin
     if(~rst_l)
       begin
          eq_base_address_select_pulse <= 1'b0;
          eq_ctrl_set_select_0 <= 1'b0;
          eq_ctrl_set_select_1 <= 1'b0;
          eq_ctrl_set_select_2 <= 1'b0;
          eq_ctrl_set_select_3 <= 1'b0;
          eq_ctrl_set_select_4 <= 1'b0;
          eq_ctrl_set_select_5 <= 1'b0;
          eq_ctrl_set_select_6 <= 1'b0;
          eq_ctrl_set_select_7 <= 1'b0;
          eq_ctrl_set_select_8 <= 1'b0;
          eq_ctrl_set_select_9 <= 1'b0;
          eq_ctrl_set_select_10 <= 1'b0;
          eq_ctrl_set_select_11 <= 1'b0;
          eq_ctrl_set_select_12 <= 1'b0;
          eq_ctrl_set_select_13 <= 1'b0;
          eq_ctrl_set_select_14 <= 1'b0;
          eq_ctrl_set_select_15 <= 1'b0;
          eq_ctrl_set_select_16 <= 1'b0;
          eq_ctrl_set_select_17 <= 1'b0;
          eq_ctrl_set_select_18 <= 1'b0;
          eq_ctrl_set_select_19 <= 1'b0;
          eq_ctrl_set_select_20 <= 1'b0;
          eq_ctrl_set_select_21 <= 1'b0;
          eq_ctrl_set_select_22 <= 1'b0;
          eq_ctrl_set_select_23 <= 1'b0;
          eq_ctrl_set_select_24 <= 1'b0;
          eq_ctrl_set_select_25 <= 1'b0;
          eq_ctrl_set_select_26 <= 1'b0;
          eq_ctrl_set_select_27 <= 1'b0;
          eq_ctrl_set_select_28 <= 1'b0;
          eq_ctrl_set_select_29 <= 1'b0;
          eq_ctrl_set_select_30 <= 1'b0;
          eq_ctrl_set_select_31 <= 1'b0;
          eq_ctrl_set_select_32 <= 1'b0;
          eq_ctrl_set_select_33 <= 1'b0;
          eq_ctrl_set_select_34 <= 1'b0;
          eq_ctrl_set_select_35 <= 1'b0;
          eq_ctrl_clr_select_0 <= 1'b0;
          eq_ctrl_clr_select_1 <= 1'b0;
          eq_ctrl_clr_select_2 <= 1'b0;
          eq_ctrl_clr_select_3 <= 1'b0;
          eq_ctrl_clr_select_4 <= 1'b0;
          eq_ctrl_clr_select_5 <= 1'b0;
          eq_ctrl_clr_select_6 <= 1'b0;
          eq_ctrl_clr_select_7 <= 1'b0;
          eq_ctrl_clr_select_8 <= 1'b0;
          eq_ctrl_clr_select_9 <= 1'b0;
          eq_ctrl_clr_select_10 <= 1'b0;
          eq_ctrl_clr_select_11 <= 1'b0;
          eq_ctrl_clr_select_12 <= 1'b0;
          eq_ctrl_clr_select_13 <= 1'b0;
          eq_ctrl_clr_select_14 <= 1'b0;
          eq_ctrl_clr_select_15 <= 1'b0;
          eq_ctrl_clr_select_16 <= 1'b0;
          eq_ctrl_clr_select_17 <= 1'b0;
          eq_ctrl_clr_select_18 <= 1'b0;
          eq_ctrl_clr_select_19 <= 1'b0;
          eq_ctrl_clr_select_20 <= 1'b0;
          eq_ctrl_clr_select_21 <= 1'b0;
          eq_ctrl_clr_select_22 <= 1'b0;
          eq_ctrl_clr_select_23 <= 1'b0;
          eq_ctrl_clr_select_24 <= 1'b0;
          eq_ctrl_clr_select_25 <= 1'b0;
          eq_ctrl_clr_select_26 <= 1'b0;
          eq_ctrl_clr_select_27 <= 1'b0;
          eq_ctrl_clr_select_28 <= 1'b0;
          eq_ctrl_clr_select_29 <= 1'b0;
          eq_ctrl_clr_select_30 <= 1'b0;
          eq_ctrl_clr_select_31 <= 1'b0;
          eq_ctrl_clr_select_32 <= 1'b0;
          eq_ctrl_clr_select_33 <= 1'b0;
          eq_ctrl_clr_select_34 <= 1'b0;
          eq_ctrl_clr_select_35 <= 1'b0;
          eq_state_select_0 <= 1'b0;
          eq_state_select_1 <= 1'b0;
          eq_state_select_2 <= 1'b0;
          eq_state_select_3 <= 1'b0;
          eq_state_select_4 <= 1'b0;
          eq_state_select_5 <= 1'b0;
          eq_state_select_6 <= 1'b0;
          eq_state_select_7 <= 1'b0;
          eq_state_select_8 <= 1'b0;
          eq_state_select_9 <= 1'b0;
          eq_state_select_10 <= 1'b0;
          eq_state_select_11 <= 1'b0;
          eq_state_select_12 <= 1'b0;
          eq_state_select_13 <= 1'b0;
          eq_state_select_14 <= 1'b0;
          eq_state_select_15 <= 1'b0;
          eq_state_select_16 <= 1'b0;
          eq_state_select_17 <= 1'b0;
          eq_state_select_18 <= 1'b0;
          eq_state_select_19 <= 1'b0;
          eq_state_select_20 <= 1'b0;
          eq_state_select_21 <= 1'b0;
          eq_state_select_22 <= 1'b0;
          eq_state_select_23 <= 1'b0;
          eq_state_select_24 <= 1'b0;
          eq_state_select_25 <= 1'b0;
          eq_state_select_26 <= 1'b0;
          eq_state_select_27 <= 1'b0;
          eq_state_select_28 <= 1'b0;
          eq_state_select_29 <= 1'b0;
          eq_state_select_30 <= 1'b0;
          eq_state_select_31 <= 1'b0;
          eq_state_select_32 <= 1'b0;
          eq_state_select_33 <= 1'b0;
          eq_state_select_34 <= 1'b0;
          eq_state_select_35 <= 1'b0;
          eq_tail_select_pulse_0 <= 1'b0;
          eq_tail_select_pulse_1 <= 1'b0;
          eq_tail_select_pulse_2 <= 1'b0;
          eq_tail_select_pulse_3 <= 1'b0;
          eq_tail_select_pulse_4 <= 1'b0;
          eq_tail_select_pulse_5 <= 1'b0;
          eq_tail_select_pulse_6 <= 1'b0;
          eq_tail_select_pulse_7 <= 1'b0;
          eq_tail_select_pulse_8 <= 1'b0;
          eq_tail_select_pulse_9 <= 1'b0;
          eq_tail_select_pulse_10 <= 1'b0;
          eq_tail_select_pulse_11 <= 1'b0;
          eq_tail_select_pulse_12 <= 1'b0;
          eq_tail_select_pulse_13 <= 1'b0;
          eq_tail_select_pulse_14 <= 1'b0;
          eq_tail_select_pulse_15 <= 1'b0;
          eq_tail_select_pulse_16 <= 1'b0;
          eq_tail_select_pulse_17 <= 1'b0;
          eq_tail_select_pulse_18 <= 1'b0;
          eq_tail_select_pulse_19 <= 1'b0;
          eq_tail_select_pulse_20 <= 1'b0;
          eq_tail_select_pulse_21 <= 1'b0;
          eq_tail_select_pulse_22 <= 1'b0;
          eq_tail_select_pulse_23 <= 1'b0;
          eq_tail_select_pulse_24 <= 1'b0;
          eq_tail_select_pulse_25 <= 1'b0;
          eq_tail_select_pulse_26 <= 1'b0;
          eq_tail_select_pulse_27 <= 1'b0;
          eq_tail_select_pulse_28 <= 1'b0;
          eq_tail_select_pulse_29 <= 1'b0;
          eq_tail_select_pulse_30 <= 1'b0;
          eq_tail_select_pulse_31 <= 1'b0;
          eq_tail_select_pulse_32 <= 1'b0;
          eq_tail_select_pulse_33 <= 1'b0;
          eq_tail_select_pulse_34 <= 1'b0;
          eq_tail_select_pulse_35 <= 1'b0;
          eq_head_select_pulse_0 <= 1'b0;
          eq_head_select_pulse_1 <= 1'b0;
          eq_head_select_pulse_2 <= 1'b0;
          eq_head_select_pulse_3 <= 1'b0;
          eq_head_select_pulse_4 <= 1'b0;
          eq_head_select_pulse_5 <= 1'b0;
          eq_head_select_pulse_6 <= 1'b0;
          eq_head_select_pulse_7 <= 1'b0;
          eq_head_select_pulse_8 <= 1'b0;
          eq_head_select_pulse_9 <= 1'b0;
          eq_head_select_pulse_10 <= 1'b0;
          eq_head_select_pulse_11 <= 1'b0;
          eq_head_select_pulse_12 <= 1'b0;
          eq_head_select_pulse_13 <= 1'b0;
          eq_head_select_pulse_14 <= 1'b0;
          eq_head_select_pulse_15 <= 1'b0;
          eq_head_select_pulse_16 <= 1'b0;
          eq_head_select_pulse_17 <= 1'b0;
          eq_head_select_pulse_18 <= 1'b0;
          eq_head_select_pulse_19 <= 1'b0;
          eq_head_select_pulse_20 <= 1'b0;
          eq_head_select_pulse_21 <= 1'b0;
          eq_head_select_pulse_22 <= 1'b0;
          eq_head_select_pulse_23 <= 1'b0;
          eq_head_select_pulse_24 <= 1'b0;
          eq_head_select_pulse_25 <= 1'b0;
          eq_head_select_pulse_26 <= 1'b0;
          eq_head_select_pulse_27 <= 1'b0;
          eq_head_select_pulse_28 <= 1'b0;
          eq_head_select_pulse_29 <= 1'b0;
          eq_head_select_pulse_30 <= 1'b0;
          eq_head_select_pulse_31 <= 1'b0;
          eq_head_select_pulse_32 <= 1'b0;
          eq_head_select_pulse_33 <= 1'b0;
          eq_head_select_pulse_34 <= 1'b0;
          eq_head_select_pulse_35 <= 1'b0;
       end
     else
       begin
          eq_base_address_select_pulse <=
         ~eq_base_address_acc_vio &
         clocked_valid_pulse &
         eq_base_address_addr_decoded;

          eq_ctrl_set_select_0 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd0
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_1 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd1
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_2 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd2
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_3 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd3
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_4 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd4
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_5 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd5
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_6 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd6
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_7 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd7
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_8 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd8
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_9 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd9
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_10 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd10
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_11 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd11
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_12 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd12
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_13 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd13
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_14 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd14
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_15 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd15
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_16 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd16
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_17 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd17
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_18 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd18
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_19 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd19
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_20 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd20
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_21 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd21
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_22 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd22
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_23 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd23
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_24 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd24
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_25 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd25
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_26 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd26
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_27 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd27
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_28 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd28
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_29 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd29
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_30 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd30
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_31 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd31
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_32 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd32
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_33 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd33
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_34 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd34
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_set_select_35 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_SET_LOW_ADDR_WIDTH'd35
         ) &
         ~eq_ctrl_set_acc_vio &
         eq_ctrl_set_addr_decoded;

          eq_ctrl_clr_select_0 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd0
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_1 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd1
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_2 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd2
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_3 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd3
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_4 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd4
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_5 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd5
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_6 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd6
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_7 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd7
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_8 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd8
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_9 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd9
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_10 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd10
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_11 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd11
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_12 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd12
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_13 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd13
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_14 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd14
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_15 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd15
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_16 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd16
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_17 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd17
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_18 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd18
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_19 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd19
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_20 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd20
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_21 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd21
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_22 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd22
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_23 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd23
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_24 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd24
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_25 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd25
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_26 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd26
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_27 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd27
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_28 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd28
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_29 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd29
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_30 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd30
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_31 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd31
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_32 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd32
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_33 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd33
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_34 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd34
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_ctrl_clr_select_35 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_CTRL_CLR_LOW_ADDR_WIDTH'd35
         ) &
         ~eq_ctrl_clr_acc_vio &
         eq_ctrl_clr_addr_decoded;

          eq_state_select_0 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd0
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_1 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd1
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_2 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd2
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_3 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd3
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_4 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd4
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_5 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd5
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_6 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd6
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_7 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd7
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_8 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd8
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_9 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd9
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_10 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd10
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_11 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd11
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_12 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd12
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_13 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd13
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_14 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd14
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_15 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd15
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_16 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd16
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_17 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd17
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_18 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd18
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_19 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd19
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_20 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd20
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_21 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd21
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_22 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd22
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_23 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd23
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_24 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd24
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_25 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd25
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_26 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd26
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_27 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd27
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_28 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd28
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_29 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd29
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_30 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd30
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_31 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd31
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_32 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd32
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_33 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd33
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_34 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd34
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_state_select_35 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_STATE_LOW_ADDR_WIDTH'd35
         ) &
         ~eq_state_acc_vio &
         eq_state_addr_decoded;

          eq_tail_select_pulse_0 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd0
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_1 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd1
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_2 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd2
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_3 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd3
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_4 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd4
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_5 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd5
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_6 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd6
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_7 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd7
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_8 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd8
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_9 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd9
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_10 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd10
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_11 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd11
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_12 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd12
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_13 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd13
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_14 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd14
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_15 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd15
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_16 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd16
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_17 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd17
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_18 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd18
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_19 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd19
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_20 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd20
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_21 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd21
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_22 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd22
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_23 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd23
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_24 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd24
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_25 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd25
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_26 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd26
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_27 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd27
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_28 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd28
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_29 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd29
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_30 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd30
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_31 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd31
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_32 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd32
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_33 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd33
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_34 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd34
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_tail_select_pulse_35 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_TAIL_LOW_ADDR_WIDTH'd35
         ) &
         ~eq_tail_acc_vio &
         clocked_valid_pulse &
         eq_tail_addr_decoded;

          eq_head_select_pulse_0 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd0
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_1 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd1
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_2 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd2
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_3 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd3
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_4 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd4
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_5 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd5
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_6 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd6
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_7 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd7
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_8 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd8
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_9 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd9
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_10 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd10
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_11 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd11
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_12 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd12
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_13 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd13
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_14 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd14
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_15 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd15
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_16 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd16
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_17 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd17
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_18 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd18
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_19 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd19
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_20 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd20
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_21 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd21
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_22 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd22
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_23 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd23
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_24 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd24
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_25 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd25
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_26 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd26
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_27 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd27
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_28 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd28
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_29 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd29
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_30 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd30
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_31 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd31
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_32 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd32
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_33 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd33
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_34 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd34
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

          eq_head_select_pulse_35 <=
         (
           daemon_csrbus_addr[`FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH-1:0] ==
           `FIRE_DLC_IMU_EQS_CSR_EQ_HEAD_LOW_ADDR_WIDTH'd35
         ) &
         ~eq_head_acc_vio &
         clocked_valid_pulse &
         eq_head_addr_decoded;

        end
  end

//====================================================================
//    daemon_csrbus_wr / daemon_csrbus_wr_data
//====================================================================
always @(posedge clk)
  begin
     if(~rst_l)
       begin
          daemon_csrbus_wr_out      <= 1'b0;
          daemon_csrbus_wr_data_out <= `FIRE_CSRBUS_DATA_WIDTH'b0;
       end
     else
       begin
          daemon_csrbus_wr_out      <= daemon_csrbus_wr;
          daemon_csrbus_wr_data_out <= daemon_csrbus_wr_data;
        end
  end

//====================================================================
//    Cycle Counter: Used for ExtReadTiming / ExtWriteTiming
//====================================================================

//====================================================================
//   OUTPUT: daemon_csrbus_done (pipelining)
//====================================================================
//----- DONE for internal/extern registers
reg stage_1_daemon_csrbus_done_internal_0;
reg stage_1_daemon_csrbus_done_internal_1;
reg stage_2_daemon_csrbus_done_internal_0;

always @(posedge clk)
  begin
     if(~rst_l)
       begin
         stage_1_daemon_csrbus_done_internal_0 <= 1'b0;
         stage_1_daemon_csrbus_done_internal_1 <= 1'b0;
       end
     else
       begin
         stage_1_daemon_csrbus_done_internal_0 <=
                 eq_base_address_select_pulse |
                 eq_tail_select_pulse_0 |
                 eq_tail_select_pulse_1 |
                 eq_tail_select_pulse_2 |
                 eq_tail_select_pulse_3 |
                 eq_tail_select_pulse_4 |
                 eq_tail_select_pulse_5 |
                 eq_tail_select_pulse_6 |
                 eq_tail_select_pulse_7 |
                 eq_tail_select_pulse_8 |
                 eq_tail_select_pulse_9 |
                 eq_tail_select_pulse_10 |
                 eq_tail_select_pulse_11 |
                 eq_tail_select_pulse_12 |
                 eq_tail_select_pulse_13 |
                 eq_tail_select_pulse_14 |
                 eq_tail_select_pulse_15 |
                 eq_tail_select_pulse_16 |
                 eq_tail_select_pulse_17 |
                 eq_tail_select_pulse_18 |
                 eq_tail_select_pulse_19 |
                 eq_tail_select_pulse_20 |
                 eq_tail_select_pulse_21 |
                 eq_tail_select_pulse_22 |
                 eq_tail_select_pulse_23 |
                 eq_tail_select_pulse_24 |
                 eq_tail_select_pulse_25 |
                 eq_tail_select_pulse_26 |
                 eq_tail_select_pulse_27 |
                 eq_tail_select_pulse_28 |
                 eq_tail_select_pulse_29 |
                 eq_tail_select_pulse_30 |
                 eq_tail_select_pulse_31 |
                 eq_tail_select_pulse_32 |
                 eq_tail_select_pulse_33 |
                 eq_tail_select_pulse_34 |
                 eq_tail_select_pulse_35 |
                 eq_head_select_pulse_0 |
                 eq_head_select_pulse_1 |
                 eq_head_select_pulse_2 |
                 eq_head_select_pulse_3 |
                 eq_head_select_pulse_4 |
                 eq_head_select_pulse_5 |
                 eq_head_select_pulse_6 |
                 eq_head_select_pulse_7 |
                 eq_head_select_pulse_8 |
                 eq_head_select_pulse_9 |
                 eq_head_select_pulse_10 |
                 eq_head_select_pulse_11 |
                 eq_head_select_pulse_12 |
                 eq_head_select_pulse_13 |
                 eq_head_select_pulse_14 |
                 eq_head_select_pulse_15 |
                 eq_head_select_pulse_16 |
                 eq_head_select_pulse_17 |
                 eq_head_select_pulse_18 |
                 eq_head_select_pulse_19 |
                 eq_head_select_pulse_20 |
                 eq_head_select_pulse_21 |
                 eq_head_select_pulse_22 |
                 eq_head_select_pulse_23 |
                 eq_head_select_pulse_24 |
                 eq_head_select_pulse_25 |
                 eq_head_select_pulse_26 |
                 eq_head_select_pulse_27 |
                 eq_head_select_pulse_28 |
                 eq_head_select_pulse_29 |
                 eq_head_select_pulse_30 |
                 eq_head_select_pulse_31 |
                 eq_head_select_pulse_32 |
                 eq_head_select_pulse_33 |
                 eq_head_select_pulse_34 |
                 eq_head_select_pulse_35 |
                 eq_ctrl_set_select_0 & clocked_valid_pulse |
                 eq_ctrl_set_select_1 & clocked_valid_pulse |
                 eq_ctrl_set_select_2 & clocked_valid_pulse |
                 eq_ctrl_set_select_3 & clocked_valid_pulse |
                 eq_ctrl_set_select_4 & clocked_valid_pulse |
                 eq_ctrl_set_select_5 & clocked_valid_pulse |
                 eq_ctrl_set_select_6 & clocked_valid_pulse |
                 eq_ctrl_set_select_7 & clocked_valid_pulse |
                 eq_ctrl_set_select_8 & clocked_valid_pulse |
                 eq_ctrl_set_select_9 & clocked_valid_pulse |
                 eq_ctrl_set_select_10 & clocked_valid_pulse |
                 eq_ctrl_set_select_11 & clocked_valid_pulse |
                 eq_ctrl_set_select_12 & clocked_valid_pulse |
                 eq_ctrl_set_select_13 & clocked_valid_pulse |
                 eq_ctrl_set_select_14 & clocked_valid_pulse |
                 eq_ctrl_set_select_15 & clocked_valid_pulse |
                 eq_ctrl_set_select_16 & clocked_valid_pulse |
                 eq_ctrl_set_select_17 & clocked_valid_pulse |
                 eq_ctrl_set_select_18 & clocked_valid_pulse |
                 eq_ctrl_set_select_19 & clocked_valid_pulse |
                 eq_ctrl_set_select_20 & clocked_valid_pulse |
                 eq_ctrl_set_select_21 & clocked_valid_pulse |
                 eq_ctrl_set_select_22 & clocked_valid_pulse |
                 eq_ctrl_set_select_23 & clocked_valid_pulse |
                 eq_ctrl_set_select_24 & clocked_valid_pulse |
                 eq_ctrl_set_select_25 & clocked_valid_pulse |
                 eq_ctrl_set_select_26 & clocked_valid_pulse |
                 eq_ctrl_set_select_27 & clocked_valid_pulse |
                 eq_ctrl_set_select_28 & clocked_valid_pulse |
                 eq_ctrl_set_select_29 & clocked_valid_pulse |
                 eq_ctrl_set_select_30 & clocked_valid_pulse |
                 eq_ctrl_set_select_31 & clocked_valid_pulse |
                 eq_ctrl_set_select_32 & clocked_valid_pulse |
                 eq_ctrl_set_select_33 & clocked_valid_pulse |
                 eq_ctrl_set_select_34 & clocked_valid_pulse |
                 eq_ctrl_set_select_35 & clocked_valid_pulse;
         stage_1_daemon_csrbus_done_internal_1 <=
                 eq_ctrl_clr_select_0 & clocked_valid_pulse |
                 eq_ctrl_clr_select_1 & clocked_valid_pulse |
                 eq_ctrl_clr_select_2 & clocked_valid_pulse |
                 eq_ctrl_clr_select_3 & clocked_valid_pulse |
                 eq_ctrl_clr_select_4 & clocked_valid_pulse |
                 eq_ctrl_clr_select_5 & clocked_valid_pulse |
                 eq_ctrl_clr_select_6 & clocked_valid_pulse |
                 eq_ctrl_clr_select_7 & clocked_valid_pulse |
                 eq_ctrl_clr_select_8 & clocked_valid_pulse |
                 eq_ctrl_clr_select_9 & clocked_valid_pulse |
                 eq_ctrl_clr_select_10 & clocked_valid_pulse |
                 eq_ctrl_clr_select_11 & clocked_valid_pulse |
                 eq_ctrl_clr_select_12 & clocked_valid_pulse |
                 eq_ctrl_clr_select_13 & clocked_valid_pulse |
                 eq_ctrl_clr_select_14 & clocked_valid_pulse |
                 eq_ctrl_clr_select_15 & clocked_valid_pulse |
                 eq_ctrl_clr_select_16 & clocked_valid_pulse |
                 eq_ctrl_clr_select_17 & clocked_valid_pulse |
                 eq_ctrl_clr_select_18 & clocked_valid_pulse |
                 eq_ctrl_clr_select_19 & clocked_valid_pulse |
                 eq_ctrl_clr_select_20 & clocked_valid_pulse |
                 eq_ctrl_clr_select_21 & clocked_valid_pulse |
                 eq_ctrl_clr_select_22 & clocked_valid_pulse |
                 eq_ctrl_clr_select_23 & clocked_valid_pulse |
                 eq_ctrl_clr_select_24 & clocked_valid_pulse |
                 eq_ctrl_clr_select_25 & clocked_valid_pulse |
                 eq_ctrl_clr_select_26 & clocked_valid_pulse |
                 eq_ctrl_clr_select_27 & clocked_valid_pulse |
                 eq_ctrl_clr_select_28 & clocked_valid_pulse |
                 eq_ctrl_clr_select_29 & clocked_valid_pulse |
                 eq_ctrl_clr_select_30 & clocked_valid_pulse |
                 eq_ctrl_clr_select_31 & clocked_valid_pulse |
                 eq_ctrl_clr_select_32 & clocked_valid_pulse |
                 eq_ctrl_clr_select_33 & clocked_valid_pulse |
                 eq_ctrl_clr_select_34 & clocked_valid_pulse |
                 eq_ctrl_clr_select_35 & clocked_valid_pulse |
                 eq_state_select_0 & clocked_valid_pulse |
                 eq_state_select_1 & clocked_valid_pulse |
                 eq_state_select_2 & clocked_valid_pulse |
                 eq_state_select_3 & clocked_valid_pulse |
                 eq_state_select_4 & clocked_valid_pulse |
                 eq_state_select_5 & clocked_valid_pulse |
                 eq_state_select_6 & clocked_valid_pulse |
                 eq_state_select_7 & clocked_valid_pulse |
                 eq_state_select_8 & clocked_valid_pulse |
                 eq_state_select_9 & clocked_valid_pulse |
                 eq_state_select_10 & clocked_valid_pulse |
                 eq_state_select_11 & clocked_valid_pulse |
                 eq_state_select_12 & clocked_valid_pulse |
                 eq_state_select_13 & clocked_valid_pulse |
                 eq_state_select_14 & clocked_valid_pulse |
                 eq_state_select_15 & clocked_valid_pulse |
                 eq_state_select_16 & clocked_valid_pulse |
                 eq_state_select_17 & clocked_valid_pulse |
                 eq_state_select_18 & clocked_valid_pulse |
                 eq_state_select_19 & clocked_valid_pulse |
                 eq_state_select_20 & clocked_valid_pulse |
                 eq_state_select_21 & clocked_valid_pulse |
                 eq_state_select_22 & clocked_valid_pulse |
                 eq_state_select_23 & clocked_valid_pulse |
                 eq_state_select_24 & clocked_valid_pulse |
                 eq_state_select_25 & clocked_valid_pulse |
                 eq_state_select_26 & clocked_valid_pulse |
                 eq_state_select_27 & clocked_valid_pulse |
                 eq_state_select_28 & clocked_valid_pulse |
                 eq_state_select_29 & clocked_valid_pulse |
                 eq_state_select_30 & clocked_valid_pulse |
                 eq_state_select_31 & clocked_valid_pulse |
                 eq_state_select_32 & clocked_valid_pulse |
                 eq_state_select_33 & clocked_valid_pulse |
                 eq_state_select_34 & clocked_valid_pulse |
                 eq_state_select_35 & clocked_valid_pulse;
       end
     if(~rst_l)
       begin
         stage_2_daemon_csrbus_done_internal_0 <= 1'b0;
       end
     else
       begin
         stage_2_daemon_csrbus_done_internal_0 <=
                 stage_1_daemon_csrbus_done_internal_0 |
                 stage_1_daemon_csrbus_done_internal_1;
       end
  end

//----- OUTPUT: daemon_csrbus_done
assign daemon_csrbus_done = daemon_csrbus_valid &
          (
            stage_2_daemon_csrbus_done_internal_0
          );

// daemon_csrbus_done gets asserted only when csrbus_valid is high
/* 0in assert -name daemon_csrbus_done_high
       -var daemon_csrbus_valid -active daemon_csrbus_done
       -message "csrbus_done got asserted while csrbus_valid is low"
       -module dmu_imu_eqs_addr_decode
       -clock clk
*/

// daemon_csrbus_done is a pulse
/* 0in assert_timer -name daemon_csrbus_done_pulse
       -var daemon_csrbus_done -max 1
       -message "csrbus_done pulse length is not 1"
       -module dmu_imu_eqs_addr_decode
       -clock clk
*/

endmodule // dmu_imu_eqs_addr_decode
