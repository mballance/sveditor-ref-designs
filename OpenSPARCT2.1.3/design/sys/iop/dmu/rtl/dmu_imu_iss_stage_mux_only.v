// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_iss_stage_mux_only.v
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
module dmu_imu_iss_stage_mux_only 
	(
	clk,
	read_data_0,
	interrupt_mapping_20_select_pulse,
	interrupt_mapping_20_select_pulse_out,
	interrupt_mapping_21_select_pulse,
	interrupt_mapping_21_select_pulse_out,
	interrupt_mapping_22_select_pulse,
	interrupt_mapping_22_select_pulse_out,
	interrupt_mapping_23_select_pulse,
	interrupt_mapping_23_select_pulse_out,
	interrupt_mapping_24_select_pulse,
	interrupt_mapping_24_select_pulse_out,
	interrupt_mapping_25_select_pulse,
	interrupt_mapping_25_select_pulse_out,
	interrupt_mapping_26_select_pulse,
	interrupt_mapping_26_select_pulse_out,
	interrupt_mapping_27_select_pulse,
	interrupt_mapping_27_select_pulse_out,
	interrupt_mapping_28_select_pulse,
	interrupt_mapping_28_select_pulse_out,
	interrupt_mapping_29_select_pulse,
	interrupt_mapping_29_select_pulse_out,
	interrupt_mapping_30_select_pulse,
	interrupt_mapping_30_select_pulse_out,
	interrupt_mapping_31_select_pulse,
	interrupt_mapping_31_select_pulse_out,
	interrupt_mapping_32_select_pulse,
	interrupt_mapping_32_select_pulse_out,
	interrupt_mapping_33_select_pulse,
	interrupt_mapping_33_select_pulse_out,
	interrupt_mapping_34_select_pulse,
	interrupt_mapping_34_select_pulse_out,
	interrupt_mapping_35_select_pulse,
	interrupt_mapping_35_select_pulse_out,
	interrupt_mapping_36_select_pulse,
	interrupt_mapping_36_select_pulse_out,
	interrupt_mapping_37_select_pulse,
	interrupt_mapping_37_select_pulse_out,
	interrupt_mapping_38_select_pulse,
	interrupt_mapping_38_select_pulse_out,
	interrupt_mapping_39_select_pulse,
	interrupt_mapping_39_select_pulse_out,
	interrupt_mapping_40_select_pulse,
	interrupt_mapping_40_select_pulse_out,
	interrupt_mapping_41_select_pulse,
	interrupt_mapping_41_select_pulse_out,
	interrupt_mapping_42_select_pulse,
	interrupt_mapping_42_select_pulse_out,
	interrupt_mapping_43_select_pulse,
	interrupt_mapping_43_select_pulse_out,
	interrupt_mapping_44_select_pulse,
	interrupt_mapping_44_select_pulse_out,
	interrupt_mapping_45_select_pulse,
	interrupt_mapping_45_select_pulse_out,
	interrupt_mapping_46_select_pulse,
	interrupt_mapping_46_select_pulse_out,
	interrupt_mapping_47_select_pulse,
	interrupt_mapping_47_select_pulse_out,
	interrupt_mapping_48_select_pulse,
	interrupt_mapping_48_select_pulse_out,
	interrupt_mapping_49_select_pulse,
	interrupt_mapping_49_select_pulse_out,
	interrupt_mapping_50_select_pulse,
	interrupt_mapping_50_select_pulse_out,
	interrupt_mapping_51_select_pulse,
	interrupt_mapping_51_select_pulse_out,
	interrupt_mapping_52_select_pulse,
	interrupt_mapping_52_select_pulse_out,
	interrupt_mapping_53_select_pulse,
	interrupt_mapping_53_select_pulse_out,
	interrupt_mapping_54_select_pulse,
	interrupt_mapping_54_select_pulse_out,
	interrupt_mapping_55_select_pulse,
	interrupt_mapping_55_select_pulse_out,
	interrupt_mapping_56_select_pulse,
	interrupt_mapping_56_select_pulse_out,
	interrupt_mapping_57_select_pulse,
	interrupt_mapping_57_select_pulse_out,
	interrupt_mapping_58_select_pulse,
	interrupt_mapping_58_select_pulse_out,
	interrupt_mapping_59_select_pulse,
	interrupt_mapping_59_select_pulse_out,
	interrupt_mapping_62_select_pulse,
	interrupt_mapping_62_select_pulse_out,
	interrupt_mapping_63_select_pulse,
	interrupt_mapping_63_select_pulse_out,
	clr_int_reg_20_select,
	clr_int_reg_20_select_out,
	clr_int_reg_21_select,
	clr_int_reg_21_select_out,
	clr_int_reg_22_select,
	clr_int_reg_22_select_out,
	clr_int_reg_23_select,
	clr_int_reg_23_select_out,
	clr_int_reg_24_select,
	clr_int_reg_24_select_out,
	clr_int_reg_25_select,
	clr_int_reg_25_select_out,
	clr_int_reg_26_select,
	clr_int_reg_26_select_out,
	clr_int_reg_27_select,
	clr_int_reg_27_select_out,
	clr_int_reg_28_select,
	clr_int_reg_28_select_out,
	clr_int_reg_29_select,
	clr_int_reg_29_select_out,
	clr_int_reg_30_select,
	clr_int_reg_30_select_out,
	clr_int_reg_31_select,
	clr_int_reg_31_select_out,
	clr_int_reg_32_select,
	clr_int_reg_32_select_out,
	clr_int_reg_33_select,
	clr_int_reg_33_select_out,
	clr_int_reg_34_select,
	clr_int_reg_34_select_out,
	clr_int_reg_35_select,
	clr_int_reg_35_select_out,
	clr_int_reg_36_select,
	clr_int_reg_36_select_out,
	clr_int_reg_37_select,
	clr_int_reg_37_select_out,
	clr_int_reg_38_select,
	clr_int_reg_38_select_out,
	clr_int_reg_39_select,
	clr_int_reg_39_select_out,
	clr_int_reg_40_select,
	clr_int_reg_40_select_out,
	clr_int_reg_41_select,
	clr_int_reg_41_select_out,
	clr_int_reg_42_select,
	clr_int_reg_42_select_out,
	clr_int_reg_43_select,
	clr_int_reg_43_select_out,
	clr_int_reg_44_select,
	clr_int_reg_44_select_out,
	clr_int_reg_45_select,
	clr_int_reg_45_select_out,
	clr_int_reg_46_select,
	clr_int_reg_46_select_out,
	clr_int_reg_47_select,
	clr_int_reg_47_select_out,
	clr_int_reg_48_select,
	clr_int_reg_48_select_out,
	clr_int_reg_49_select,
	clr_int_reg_49_select_out,
	clr_int_reg_50_select,
	clr_int_reg_50_select_out,
	clr_int_reg_51_select,
	clr_int_reg_51_select_out,
	clr_int_reg_52_select,
	clr_int_reg_52_select_out,
	clr_int_reg_53_select,
	clr_int_reg_53_select_out,
	clr_int_reg_54_select,
	clr_int_reg_54_select_out,
	clr_int_reg_55_select,
	clr_int_reg_55_select_out,
	clr_int_reg_56_select,
	clr_int_reg_56_select_out,
	clr_int_reg_57_select,
	clr_int_reg_57_select_out,
	clr_int_reg_58_select,
	clr_int_reg_58_select_out,
	clr_int_reg_59_select,
	clr_int_reg_59_select_out,
	clr_int_reg_62_select,
	clr_int_reg_62_select_out,
	clr_int_reg_63_select,
	clr_int_reg_63_select_out,
	interrupt_retry_timer_select_pulse,
	interrupt_retry_timer_select_pulse_out,
	interrupt_state_status_1_select,
	interrupt_state_status_1_select_out,
	interrupt_state_status_2_select,
	interrupt_state_status_2_select_out,
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
input  interrupt_mapping_20_select_pulse;  // select
output interrupt_mapping_20_select_pulse_out;  // select
input  interrupt_mapping_21_select_pulse;  // select
output interrupt_mapping_21_select_pulse_out;  // select
input  interrupt_mapping_22_select_pulse;  // select
output interrupt_mapping_22_select_pulse_out;  // select
input  interrupt_mapping_23_select_pulse;  // select
output interrupt_mapping_23_select_pulse_out;  // select
input  interrupt_mapping_24_select_pulse;  // select
output interrupt_mapping_24_select_pulse_out;  // select
input  interrupt_mapping_25_select_pulse;  // select
output interrupt_mapping_25_select_pulse_out;  // select
input  interrupt_mapping_26_select_pulse;  // select
output interrupt_mapping_26_select_pulse_out;  // select
input  interrupt_mapping_27_select_pulse;  // select
output interrupt_mapping_27_select_pulse_out;  // select
input  interrupt_mapping_28_select_pulse;  // select
output interrupt_mapping_28_select_pulse_out;  // select
input  interrupt_mapping_29_select_pulse;  // select
output interrupt_mapping_29_select_pulse_out;  // select
input  interrupt_mapping_30_select_pulse;  // select
output interrupt_mapping_30_select_pulse_out;  // select
input  interrupt_mapping_31_select_pulse;  // select
output interrupt_mapping_31_select_pulse_out;  // select
input  interrupt_mapping_32_select_pulse;  // select
output interrupt_mapping_32_select_pulse_out;  // select
input  interrupt_mapping_33_select_pulse;  // select
output interrupt_mapping_33_select_pulse_out;  // select
input  interrupt_mapping_34_select_pulse;  // select
output interrupt_mapping_34_select_pulse_out;  // select
input  interrupt_mapping_35_select_pulse;  // select
output interrupt_mapping_35_select_pulse_out;  // select
input  interrupt_mapping_36_select_pulse;  // select
output interrupt_mapping_36_select_pulse_out;  // select
input  interrupt_mapping_37_select_pulse;  // select
output interrupt_mapping_37_select_pulse_out;  // select
input  interrupt_mapping_38_select_pulse;  // select
output interrupt_mapping_38_select_pulse_out;  // select
input  interrupt_mapping_39_select_pulse;  // select
output interrupt_mapping_39_select_pulse_out;  // select
input  interrupt_mapping_40_select_pulse;  // select
output interrupt_mapping_40_select_pulse_out;  // select
input  interrupt_mapping_41_select_pulse;  // select
output interrupt_mapping_41_select_pulse_out;  // select
input  interrupt_mapping_42_select_pulse;  // select
output interrupt_mapping_42_select_pulse_out;  // select
input  interrupt_mapping_43_select_pulse;  // select
output interrupt_mapping_43_select_pulse_out;  // select
input  interrupt_mapping_44_select_pulse;  // select
output interrupt_mapping_44_select_pulse_out;  // select
input  interrupt_mapping_45_select_pulse;  // select
output interrupt_mapping_45_select_pulse_out;  // select
input  interrupt_mapping_46_select_pulse;  // select
output interrupt_mapping_46_select_pulse_out;  // select
input  interrupt_mapping_47_select_pulse;  // select
output interrupt_mapping_47_select_pulse_out;  // select
input  interrupt_mapping_48_select_pulse;  // select
output interrupt_mapping_48_select_pulse_out;  // select
input  interrupt_mapping_49_select_pulse;  // select
output interrupt_mapping_49_select_pulse_out;  // select
input  interrupt_mapping_50_select_pulse;  // select
output interrupt_mapping_50_select_pulse_out;  // select
input  interrupt_mapping_51_select_pulse;  // select
output interrupt_mapping_51_select_pulse_out;  // select
input  interrupt_mapping_52_select_pulse;  // select
output interrupt_mapping_52_select_pulse_out;  // select
input  interrupt_mapping_53_select_pulse;  // select
output interrupt_mapping_53_select_pulse_out;  // select
input  interrupt_mapping_54_select_pulse;  // select
output interrupt_mapping_54_select_pulse_out;  // select
input  interrupt_mapping_55_select_pulse;  // select
output interrupt_mapping_55_select_pulse_out;  // select
input  interrupt_mapping_56_select_pulse;  // select
output interrupt_mapping_56_select_pulse_out;  // select
input  interrupt_mapping_57_select_pulse;  // select
output interrupt_mapping_57_select_pulse_out;  // select
input  interrupt_mapping_58_select_pulse;  // select
output interrupt_mapping_58_select_pulse_out;  // select
input  interrupt_mapping_59_select_pulse;  // select
output interrupt_mapping_59_select_pulse_out;  // select
input  interrupt_mapping_62_select_pulse;  // select
output interrupt_mapping_62_select_pulse_out;  // select
input  interrupt_mapping_63_select_pulse;  // select
output interrupt_mapping_63_select_pulse_out;  // select
input  clr_int_reg_20_select;  // select
output clr_int_reg_20_select_out;  // select
input  clr_int_reg_21_select;  // select
output clr_int_reg_21_select_out;  // select
input  clr_int_reg_22_select;  // select
output clr_int_reg_22_select_out;  // select
input  clr_int_reg_23_select;  // select
output clr_int_reg_23_select_out;  // select
input  clr_int_reg_24_select;  // select
output clr_int_reg_24_select_out;  // select
input  clr_int_reg_25_select;  // select
output clr_int_reg_25_select_out;  // select
input  clr_int_reg_26_select;  // select
output clr_int_reg_26_select_out;  // select
input  clr_int_reg_27_select;  // select
output clr_int_reg_27_select_out;  // select
input  clr_int_reg_28_select;  // select
output clr_int_reg_28_select_out;  // select
input  clr_int_reg_29_select;  // select
output clr_int_reg_29_select_out;  // select
input  clr_int_reg_30_select;  // select
output clr_int_reg_30_select_out;  // select
input  clr_int_reg_31_select;  // select
output clr_int_reg_31_select_out;  // select
input  clr_int_reg_32_select;  // select
output clr_int_reg_32_select_out;  // select
input  clr_int_reg_33_select;  // select
output clr_int_reg_33_select_out;  // select
input  clr_int_reg_34_select;  // select
output clr_int_reg_34_select_out;  // select
input  clr_int_reg_35_select;  // select
output clr_int_reg_35_select_out;  // select
input  clr_int_reg_36_select;  // select
output clr_int_reg_36_select_out;  // select
input  clr_int_reg_37_select;  // select
output clr_int_reg_37_select_out;  // select
input  clr_int_reg_38_select;  // select
output clr_int_reg_38_select_out;  // select
input  clr_int_reg_39_select;  // select
output clr_int_reg_39_select_out;  // select
input  clr_int_reg_40_select;  // select
output clr_int_reg_40_select_out;  // select
input  clr_int_reg_41_select;  // select
output clr_int_reg_41_select_out;  // select
input  clr_int_reg_42_select;  // select
output clr_int_reg_42_select_out;  // select
input  clr_int_reg_43_select;  // select
output clr_int_reg_43_select_out;  // select
input  clr_int_reg_44_select;  // select
output clr_int_reg_44_select_out;  // select
input  clr_int_reg_45_select;  // select
output clr_int_reg_45_select_out;  // select
input  clr_int_reg_46_select;  // select
output clr_int_reg_46_select_out;  // select
input  clr_int_reg_47_select;  // select
output clr_int_reg_47_select_out;  // select
input  clr_int_reg_48_select;  // select
output clr_int_reg_48_select_out;  // select
input  clr_int_reg_49_select;  // select
output clr_int_reg_49_select_out;  // select
input  clr_int_reg_50_select;  // select
output clr_int_reg_50_select_out;  // select
input  clr_int_reg_51_select;  // select
output clr_int_reg_51_select_out;  // select
input  clr_int_reg_52_select;  // select
output clr_int_reg_52_select_out;  // select
input  clr_int_reg_53_select;  // select
output clr_int_reg_53_select_out;  // select
input  clr_int_reg_54_select;  // select
output clr_int_reg_54_select_out;  // select
input  clr_int_reg_55_select;  // select
output clr_int_reg_55_select_out;  // select
input  clr_int_reg_56_select;  // select
output clr_int_reg_56_select_out;  // select
input  clr_int_reg_57_select;  // select
output clr_int_reg_57_select_out;  // select
input  clr_int_reg_58_select;  // select
output clr_int_reg_58_select_out;  // select
input  clr_int_reg_59_select;  // select
output clr_int_reg_59_select_out;  // select
input  clr_int_reg_62_select;  // select
output clr_int_reg_62_select_out;  // select
input  clr_int_reg_63_select;  // select
output clr_int_reg_63_select_out;  // select
input  interrupt_retry_timer_select_pulse;  // select
output interrupt_retry_timer_select_pulse_out;  // select
input  interrupt_state_status_1_select;  // select
output interrupt_state_status_1_select_out;  // select
input  interrupt_state_status_2_select;  // select
output interrupt_state_status_2_select_out;  // select
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
wire interrupt_mapping_20_select_pulse;  // select
wire interrupt_mapping_20_select_pulse_out;  // select
wire interrupt_mapping_21_select_pulse;  // select
wire interrupt_mapping_21_select_pulse_out;  // select
wire interrupt_mapping_22_select_pulse;  // select
wire interrupt_mapping_22_select_pulse_out;  // select
wire interrupt_mapping_23_select_pulse;  // select
wire interrupt_mapping_23_select_pulse_out;  // select
wire interrupt_mapping_24_select_pulse;  // select
wire interrupt_mapping_24_select_pulse_out;  // select
wire interrupt_mapping_25_select_pulse;  // select
wire interrupt_mapping_25_select_pulse_out;  // select
wire interrupt_mapping_26_select_pulse;  // select
wire interrupt_mapping_26_select_pulse_out;  // select
wire interrupt_mapping_27_select_pulse;  // select
wire interrupt_mapping_27_select_pulse_out;  // select
wire interrupt_mapping_28_select_pulse;  // select
wire interrupt_mapping_28_select_pulse_out;  // select
wire interrupt_mapping_29_select_pulse;  // select
wire interrupt_mapping_29_select_pulse_out;  // select
wire interrupt_mapping_30_select_pulse;  // select
wire interrupt_mapping_30_select_pulse_out;  // select
wire interrupt_mapping_31_select_pulse;  // select
wire interrupt_mapping_31_select_pulse_out;  // select
wire interrupt_mapping_32_select_pulse;  // select
wire interrupt_mapping_32_select_pulse_out;  // select
wire interrupt_mapping_33_select_pulse;  // select
wire interrupt_mapping_33_select_pulse_out;  // select
wire interrupt_mapping_34_select_pulse;  // select
wire interrupt_mapping_34_select_pulse_out;  // select
wire interrupt_mapping_35_select_pulse;  // select
wire interrupt_mapping_35_select_pulse_out;  // select
wire interrupt_mapping_36_select_pulse;  // select
wire interrupt_mapping_36_select_pulse_out;  // select
wire interrupt_mapping_37_select_pulse;  // select
wire interrupt_mapping_37_select_pulse_out;  // select
wire interrupt_mapping_38_select_pulse;  // select
wire interrupt_mapping_38_select_pulse_out;  // select
wire interrupt_mapping_39_select_pulse;  // select
wire interrupt_mapping_39_select_pulse_out;  // select
wire interrupt_mapping_40_select_pulse;  // select
wire interrupt_mapping_40_select_pulse_out;  // select
wire interrupt_mapping_41_select_pulse;  // select
wire interrupt_mapping_41_select_pulse_out;  // select
wire interrupt_mapping_42_select_pulse;  // select
wire interrupt_mapping_42_select_pulse_out;  // select
wire interrupt_mapping_43_select_pulse;  // select
wire interrupt_mapping_43_select_pulse_out;  // select
wire interrupt_mapping_44_select_pulse;  // select
wire interrupt_mapping_44_select_pulse_out;  // select
wire interrupt_mapping_45_select_pulse;  // select
wire interrupt_mapping_45_select_pulse_out;  // select
wire interrupt_mapping_46_select_pulse;  // select
wire interrupt_mapping_46_select_pulse_out;  // select
wire interrupt_mapping_47_select_pulse;  // select
wire interrupt_mapping_47_select_pulse_out;  // select
wire interrupt_mapping_48_select_pulse;  // select
wire interrupt_mapping_48_select_pulse_out;  // select
wire interrupt_mapping_49_select_pulse;  // select
wire interrupt_mapping_49_select_pulse_out;  // select
wire interrupt_mapping_50_select_pulse;  // select
wire interrupt_mapping_50_select_pulse_out;  // select
wire interrupt_mapping_51_select_pulse;  // select
wire interrupt_mapping_51_select_pulse_out;  // select
wire interrupt_mapping_52_select_pulse;  // select
wire interrupt_mapping_52_select_pulse_out;  // select
wire interrupt_mapping_53_select_pulse;  // select
wire interrupt_mapping_53_select_pulse_out;  // select
wire interrupt_mapping_54_select_pulse;  // select
wire interrupt_mapping_54_select_pulse_out;  // select
wire interrupt_mapping_55_select_pulse;  // select
wire interrupt_mapping_55_select_pulse_out;  // select
wire interrupt_mapping_56_select_pulse;  // select
wire interrupt_mapping_56_select_pulse_out;  // select
wire interrupt_mapping_57_select_pulse;  // select
wire interrupt_mapping_57_select_pulse_out;  // select
wire interrupt_mapping_58_select_pulse;  // select
wire interrupt_mapping_58_select_pulse_out;  // select
wire interrupt_mapping_59_select_pulse;  // select
wire interrupt_mapping_59_select_pulse_out;  // select
wire interrupt_mapping_62_select_pulse;  // select
wire interrupt_mapping_62_select_pulse_out;  // select
wire interrupt_mapping_63_select_pulse;  // select
wire interrupt_mapping_63_select_pulse_out;  // select
wire clr_int_reg_20_select;  // select
wire clr_int_reg_20_select_out;  // select
wire clr_int_reg_21_select;  // select
wire clr_int_reg_21_select_out;  // select
wire clr_int_reg_22_select;  // select
wire clr_int_reg_22_select_out;  // select
wire clr_int_reg_23_select;  // select
wire clr_int_reg_23_select_out;  // select
wire clr_int_reg_24_select;  // select
wire clr_int_reg_24_select_out;  // select
wire clr_int_reg_25_select;  // select
wire clr_int_reg_25_select_out;  // select
wire clr_int_reg_26_select;  // select
wire clr_int_reg_26_select_out;  // select
wire clr_int_reg_27_select;  // select
wire clr_int_reg_27_select_out;  // select
wire clr_int_reg_28_select;  // select
wire clr_int_reg_28_select_out;  // select
wire clr_int_reg_29_select;  // select
wire clr_int_reg_29_select_out;  // select
wire clr_int_reg_30_select;  // select
wire clr_int_reg_30_select_out;  // select
wire clr_int_reg_31_select;  // select
wire clr_int_reg_31_select_out;  // select
wire clr_int_reg_32_select;  // select
wire clr_int_reg_32_select_out;  // select
wire clr_int_reg_33_select;  // select
wire clr_int_reg_33_select_out;  // select
wire clr_int_reg_34_select;  // select
wire clr_int_reg_34_select_out;  // select
wire clr_int_reg_35_select;  // select
wire clr_int_reg_35_select_out;  // select
wire clr_int_reg_36_select;  // select
wire clr_int_reg_36_select_out;  // select
wire clr_int_reg_37_select;  // select
wire clr_int_reg_37_select_out;  // select
wire clr_int_reg_38_select;  // select
wire clr_int_reg_38_select_out;  // select
wire clr_int_reg_39_select;  // select
wire clr_int_reg_39_select_out;  // select
wire clr_int_reg_40_select;  // select
wire clr_int_reg_40_select_out;  // select
wire clr_int_reg_41_select;  // select
wire clr_int_reg_41_select_out;  // select
wire clr_int_reg_42_select;  // select
wire clr_int_reg_42_select_out;  // select
wire clr_int_reg_43_select;  // select
wire clr_int_reg_43_select_out;  // select
wire clr_int_reg_44_select;  // select
wire clr_int_reg_44_select_out;  // select
wire clr_int_reg_45_select;  // select
wire clr_int_reg_45_select_out;  // select
wire clr_int_reg_46_select;  // select
wire clr_int_reg_46_select_out;  // select
wire clr_int_reg_47_select;  // select
wire clr_int_reg_47_select_out;  // select
wire clr_int_reg_48_select;  // select
wire clr_int_reg_48_select_out;  // select
wire clr_int_reg_49_select;  // select
wire clr_int_reg_49_select_out;  // select
wire clr_int_reg_50_select;  // select
wire clr_int_reg_50_select_out;  // select
wire clr_int_reg_51_select;  // select
wire clr_int_reg_51_select_out;  // select
wire clr_int_reg_52_select;  // select
wire clr_int_reg_52_select_out;  // select
wire clr_int_reg_53_select;  // select
wire clr_int_reg_53_select_out;  // select
wire clr_int_reg_54_select;  // select
wire clr_int_reg_54_select_out;  // select
wire clr_int_reg_55_select;  // select
wire clr_int_reg_55_select_out;  // select
wire clr_int_reg_56_select;  // select
wire clr_int_reg_56_select_out;  // select
wire clr_int_reg_57_select;  // select
wire clr_int_reg_57_select_out;  // select
wire clr_int_reg_58_select;  // select
wire clr_int_reg_58_select_out;  // select
wire clr_int_reg_59_select;  // select
wire clr_int_reg_59_select_out;  // select
wire clr_int_reg_62_select;  // select
wire clr_int_reg_62_select_out;  // select
wire clr_int_reg_63_select;  // select
wire clr_int_reg_63_select_out;  // select
wire interrupt_retry_timer_select_pulse;  // select
wire interrupt_retry_timer_select_pulse_out;  // select
wire interrupt_state_status_1_select;  // select
wire interrupt_state_status_1_select_out;  // select
wire interrupt_state_status_2_select;  // select
wire interrupt_state_status_2_select_out;  // select
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
assign interrupt_mapping_20_select_pulse_out = interrupt_mapping_20_select_pulse;
assign interrupt_mapping_21_select_pulse_out = interrupt_mapping_21_select_pulse;
assign interrupt_mapping_22_select_pulse_out = interrupt_mapping_22_select_pulse;
assign interrupt_mapping_23_select_pulse_out = interrupt_mapping_23_select_pulse;
assign interrupt_mapping_24_select_pulse_out = interrupt_mapping_24_select_pulse;
assign interrupt_mapping_25_select_pulse_out = interrupt_mapping_25_select_pulse;
assign interrupt_mapping_26_select_pulse_out = interrupt_mapping_26_select_pulse;
assign interrupt_mapping_27_select_pulse_out = interrupt_mapping_27_select_pulse;
assign interrupt_mapping_28_select_pulse_out = interrupt_mapping_28_select_pulse;
assign interrupt_mapping_29_select_pulse_out = interrupt_mapping_29_select_pulse;
assign interrupt_mapping_30_select_pulse_out = interrupt_mapping_30_select_pulse;
assign interrupt_mapping_31_select_pulse_out = interrupt_mapping_31_select_pulse;
assign interrupt_mapping_32_select_pulse_out = interrupt_mapping_32_select_pulse;
assign interrupt_mapping_33_select_pulse_out = interrupt_mapping_33_select_pulse;
assign interrupt_mapping_34_select_pulse_out = interrupt_mapping_34_select_pulse;
assign interrupt_mapping_35_select_pulse_out = interrupt_mapping_35_select_pulse;
assign interrupt_mapping_36_select_pulse_out = interrupt_mapping_36_select_pulse;
assign interrupt_mapping_37_select_pulse_out = interrupt_mapping_37_select_pulse;
assign interrupt_mapping_38_select_pulse_out = interrupt_mapping_38_select_pulse;
assign interrupt_mapping_39_select_pulse_out = interrupt_mapping_39_select_pulse;
assign interrupt_mapping_40_select_pulse_out = interrupt_mapping_40_select_pulse;
assign interrupt_mapping_41_select_pulse_out = interrupt_mapping_41_select_pulse;
assign interrupt_mapping_42_select_pulse_out = interrupt_mapping_42_select_pulse;
assign interrupt_mapping_43_select_pulse_out = interrupt_mapping_43_select_pulse;
assign interrupt_mapping_44_select_pulse_out = interrupt_mapping_44_select_pulse;
assign interrupt_mapping_45_select_pulse_out = interrupt_mapping_45_select_pulse;
assign interrupt_mapping_46_select_pulse_out = interrupt_mapping_46_select_pulse;
assign interrupt_mapping_47_select_pulse_out = interrupt_mapping_47_select_pulse;
assign interrupt_mapping_48_select_pulse_out = interrupt_mapping_48_select_pulse;
assign interrupt_mapping_49_select_pulse_out = interrupt_mapping_49_select_pulse;
assign interrupt_mapping_50_select_pulse_out = interrupt_mapping_50_select_pulse;
assign interrupt_mapping_51_select_pulse_out = interrupt_mapping_51_select_pulse;
assign interrupt_mapping_52_select_pulse_out = interrupt_mapping_52_select_pulse;
assign interrupt_mapping_53_select_pulse_out = interrupt_mapping_53_select_pulse;
assign interrupt_mapping_54_select_pulse_out = interrupt_mapping_54_select_pulse;
assign interrupt_mapping_55_select_pulse_out = interrupt_mapping_55_select_pulse;
assign interrupt_mapping_56_select_pulse_out = interrupt_mapping_56_select_pulse;
assign interrupt_mapping_57_select_pulse_out = interrupt_mapping_57_select_pulse;
assign interrupt_mapping_58_select_pulse_out = interrupt_mapping_58_select_pulse;
assign interrupt_mapping_59_select_pulse_out = interrupt_mapping_59_select_pulse;
assign interrupt_mapping_62_select_pulse_out = interrupt_mapping_62_select_pulse;
assign interrupt_mapping_63_select_pulse_out = interrupt_mapping_63_select_pulse;
assign clr_int_reg_20_select_out = clr_int_reg_20_select;
assign clr_int_reg_21_select_out = clr_int_reg_21_select;
assign clr_int_reg_22_select_out = clr_int_reg_22_select;
assign clr_int_reg_23_select_out = clr_int_reg_23_select;
assign clr_int_reg_24_select_out = clr_int_reg_24_select;
assign clr_int_reg_25_select_out = clr_int_reg_25_select;
assign clr_int_reg_26_select_out = clr_int_reg_26_select;
assign clr_int_reg_27_select_out = clr_int_reg_27_select;
assign clr_int_reg_28_select_out = clr_int_reg_28_select;
assign clr_int_reg_29_select_out = clr_int_reg_29_select;
assign clr_int_reg_30_select_out = clr_int_reg_30_select;
assign clr_int_reg_31_select_out = clr_int_reg_31_select;
assign clr_int_reg_32_select_out = clr_int_reg_32_select;
assign clr_int_reg_33_select_out = clr_int_reg_33_select;
assign clr_int_reg_34_select_out = clr_int_reg_34_select;
assign clr_int_reg_35_select_out = clr_int_reg_35_select;
assign clr_int_reg_36_select_out = clr_int_reg_36_select;
assign clr_int_reg_37_select_out = clr_int_reg_37_select;
assign clr_int_reg_38_select_out = clr_int_reg_38_select;
assign clr_int_reg_39_select_out = clr_int_reg_39_select;
assign clr_int_reg_40_select_out = clr_int_reg_40_select;
assign clr_int_reg_41_select_out = clr_int_reg_41_select;
assign clr_int_reg_42_select_out = clr_int_reg_42_select;
assign clr_int_reg_43_select_out = clr_int_reg_43_select;
assign clr_int_reg_44_select_out = clr_int_reg_44_select;
assign clr_int_reg_45_select_out = clr_int_reg_45_select;
assign clr_int_reg_46_select_out = clr_int_reg_46_select;
assign clr_int_reg_47_select_out = clr_int_reg_47_select;
assign clr_int_reg_48_select_out = clr_int_reg_48_select;
assign clr_int_reg_49_select_out = clr_int_reg_49_select;
assign clr_int_reg_50_select_out = clr_int_reg_50_select;
assign clr_int_reg_51_select_out = clr_int_reg_51_select;
assign clr_int_reg_52_select_out = clr_int_reg_52_select;
assign clr_int_reg_53_select_out = clr_int_reg_53_select;
assign clr_int_reg_54_select_out = clr_int_reg_54_select;
assign clr_int_reg_55_select_out = clr_int_reg_55_select;
assign clr_int_reg_56_select_out = clr_int_reg_56_select;
assign clr_int_reg_57_select_out = clr_int_reg_57_select;
assign clr_int_reg_58_select_out = clr_int_reg_58_select;
assign clr_int_reg_59_select_out = clr_int_reg_59_select;
assign clr_int_reg_62_select_out = clr_int_reg_62_select;
assign clr_int_reg_63_select_out = clr_int_reg_63_select;
assign interrupt_retry_timer_select_pulse_out = interrupt_retry_timer_select_pulse;
assign interrupt_state_status_1_select_out = interrupt_state_status_1_select;
assign interrupt_state_status_2_select_out = interrupt_state_status_2_select;
assign rst_l_out = rst_l;
assign daemon_csrbus_wr_out      = daemon_csrbus_wr_in;
assign daemon_csrbus_wr_data_out = daemon_csrbus_wr_data_in;


//=====================================================
//      OUTPUT: read_data_out
//=====================================================
dmu_imu_iss_csrpipe_5 dmu_imu_iss_csrpipe_5_inst_1
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

endmodule // dmu_imu_iss_stage_mux_only
