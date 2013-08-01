// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_iss_addr_decode.v
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
module dmu_imu_iss_addr_decode 
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
	interrupt_mapping_20_select_pulse,
	interrupt_mapping_21_select_pulse,
	interrupt_mapping_22_select_pulse,
	interrupt_mapping_23_select_pulse,
	interrupt_mapping_24_select_pulse,
	interrupt_mapping_25_select_pulse,
	interrupt_mapping_26_select_pulse,
	interrupt_mapping_27_select_pulse,
	interrupt_mapping_28_select_pulse,
	interrupt_mapping_29_select_pulse,
	interrupt_mapping_30_select_pulse,
	interrupt_mapping_31_select_pulse,
	interrupt_mapping_32_select_pulse,
	interrupt_mapping_33_select_pulse,
	interrupt_mapping_34_select_pulse,
	interrupt_mapping_35_select_pulse,
	interrupt_mapping_36_select_pulse,
	interrupt_mapping_37_select_pulse,
	interrupt_mapping_38_select_pulse,
	interrupt_mapping_39_select_pulse,
	interrupt_mapping_40_select_pulse,
	interrupt_mapping_41_select_pulse,
	interrupt_mapping_42_select_pulse,
	interrupt_mapping_43_select_pulse,
	interrupt_mapping_44_select_pulse,
	interrupt_mapping_45_select_pulse,
	interrupt_mapping_46_select_pulse,
	interrupt_mapping_47_select_pulse,
	interrupt_mapping_48_select_pulse,
	interrupt_mapping_49_select_pulse,
	interrupt_mapping_50_select_pulse,
	interrupt_mapping_51_select_pulse,
	interrupt_mapping_52_select_pulse,
	interrupt_mapping_53_select_pulse,
	interrupt_mapping_54_select_pulse,
	interrupt_mapping_55_select_pulse,
	interrupt_mapping_56_select_pulse,
	interrupt_mapping_57_select_pulse,
	interrupt_mapping_58_select_pulse,
	interrupt_mapping_59_select_pulse,
	interrupt_mapping_62_select_pulse,
	interrupt_mapping_63_select_pulse,
	clr_int_reg_20_select,
	clr_int_reg_21_select,
	clr_int_reg_22_select,
	clr_int_reg_23_select,
	clr_int_reg_24_select,
	clr_int_reg_25_select,
	clr_int_reg_26_select,
	clr_int_reg_27_select,
	clr_int_reg_28_select,
	clr_int_reg_29_select,
	clr_int_reg_30_select,
	clr_int_reg_31_select,
	clr_int_reg_32_select,
	clr_int_reg_33_select,
	clr_int_reg_34_select,
	clr_int_reg_35_select,
	clr_int_reg_36_select,
	clr_int_reg_37_select,
	clr_int_reg_38_select,
	clr_int_reg_39_select,
	clr_int_reg_40_select,
	clr_int_reg_41_select,
	clr_int_reg_42_select,
	clr_int_reg_43_select,
	clr_int_reg_44_select,
	clr_int_reg_45_select,
	clr_int_reg_46_select,
	clr_int_reg_47_select,
	clr_int_reg_48_select,
	clr_int_reg_49_select,
	clr_int_reg_50_select,
	clr_int_reg_51_select,
	clr_int_reg_52_select,
	clr_int_reg_53_select,
	clr_int_reg_54_select,
	clr_int_reg_55_select,
	clr_int_reg_56_select,
	clr_int_reg_57_select,
	clr_int_reg_58_select,
	clr_int_reg_59_select,
	clr_int_reg_62_select,
	clr_int_reg_63_select,
	interrupt_retry_timer_select_pulse,
	interrupt_state_status_1_select,
	interrupt_state_status_2_select
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
output interrupt_mapping_20_select_pulse;  // select signal
output interrupt_mapping_21_select_pulse;  // select signal
output interrupt_mapping_22_select_pulse;  // select signal
output interrupt_mapping_23_select_pulse;  // select signal
output interrupt_mapping_24_select_pulse;  // select signal
output interrupt_mapping_25_select_pulse;  // select signal
output interrupt_mapping_26_select_pulse;  // select signal
output interrupt_mapping_27_select_pulse;  // select signal
output interrupt_mapping_28_select_pulse;  // select signal
output interrupt_mapping_29_select_pulse;  // select signal
output interrupt_mapping_30_select_pulse;  // select signal
output interrupt_mapping_31_select_pulse;  // select signal
output interrupt_mapping_32_select_pulse;  // select signal
output interrupt_mapping_33_select_pulse;  // select signal
output interrupt_mapping_34_select_pulse;  // select signal
output interrupt_mapping_35_select_pulse;  // select signal
output interrupt_mapping_36_select_pulse;  // select signal
output interrupt_mapping_37_select_pulse;  // select signal
output interrupt_mapping_38_select_pulse;  // select signal
output interrupt_mapping_39_select_pulse;  // select signal
output interrupt_mapping_40_select_pulse;  // select signal
output interrupt_mapping_41_select_pulse;  // select signal
output interrupt_mapping_42_select_pulse;  // select signal
output interrupt_mapping_43_select_pulse;  // select signal
output interrupt_mapping_44_select_pulse;  // select signal
output interrupt_mapping_45_select_pulse;  // select signal
output interrupt_mapping_46_select_pulse;  // select signal
output interrupt_mapping_47_select_pulse;  // select signal
output interrupt_mapping_48_select_pulse;  // select signal
output interrupt_mapping_49_select_pulse;  // select signal
output interrupt_mapping_50_select_pulse;  // select signal
output interrupt_mapping_51_select_pulse;  // select signal
output interrupt_mapping_52_select_pulse;  // select signal
output interrupt_mapping_53_select_pulse;  // select signal
output interrupt_mapping_54_select_pulse;  // select signal
output interrupt_mapping_55_select_pulse;  // select signal
output interrupt_mapping_56_select_pulse;  // select signal
output interrupt_mapping_57_select_pulse;  // select signal
output interrupt_mapping_58_select_pulse;  // select signal
output interrupt_mapping_59_select_pulse;  // select signal
output interrupt_mapping_62_select_pulse;  // select signal
output interrupt_mapping_63_select_pulse;  // select signal
output clr_int_reg_20_select;  // select signal
output clr_int_reg_21_select;  // select signal
output clr_int_reg_22_select;  // select signal
output clr_int_reg_23_select;  // select signal
output clr_int_reg_24_select;  // select signal
output clr_int_reg_25_select;  // select signal
output clr_int_reg_26_select;  // select signal
output clr_int_reg_27_select;  // select signal
output clr_int_reg_28_select;  // select signal
output clr_int_reg_29_select;  // select signal
output clr_int_reg_30_select;  // select signal
output clr_int_reg_31_select;  // select signal
output clr_int_reg_32_select;  // select signal
output clr_int_reg_33_select;  // select signal
output clr_int_reg_34_select;  // select signal
output clr_int_reg_35_select;  // select signal
output clr_int_reg_36_select;  // select signal
output clr_int_reg_37_select;  // select signal
output clr_int_reg_38_select;  // select signal
output clr_int_reg_39_select;  // select signal
output clr_int_reg_40_select;  // select signal
output clr_int_reg_41_select;  // select signal
output clr_int_reg_42_select;  // select signal
output clr_int_reg_43_select;  // select signal
output clr_int_reg_44_select;  // select signal
output clr_int_reg_45_select;  // select signal
output clr_int_reg_46_select;  // select signal
output clr_int_reg_47_select;  // select signal
output clr_int_reg_48_select;  // select signal
output clr_int_reg_49_select;  // select signal
output clr_int_reg_50_select;  // select signal
output clr_int_reg_51_select;  // select signal
output clr_int_reg_52_select;  // select signal
output clr_int_reg_53_select;  // select signal
output clr_int_reg_54_select;  // select signal
output clr_int_reg_55_select;  // select signal
output clr_int_reg_56_select;  // select signal
output clr_int_reg_57_select;  // select signal
output clr_int_reg_58_select;  // select signal
output clr_int_reg_59_select;  // select signal
output clr_int_reg_62_select;  // select signal
output clr_int_reg_63_select;  // select signal
output interrupt_retry_timer_select_pulse;  // select signal
output interrupt_state_status_1_select;  // select signal
output interrupt_state_status_2_select;  // select signal

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
reg interrupt_mapping_20_select_pulse;  // select signal
reg interrupt_mapping_21_select_pulse;  // select signal
reg interrupt_mapping_22_select_pulse;  // select signal
reg interrupt_mapping_23_select_pulse;  // select signal
reg interrupt_mapping_24_select_pulse;  // select signal
reg interrupt_mapping_25_select_pulse;  // select signal
reg interrupt_mapping_26_select_pulse;  // select signal
reg interrupt_mapping_27_select_pulse;  // select signal
reg interrupt_mapping_28_select_pulse;  // select signal
reg interrupt_mapping_29_select_pulse;  // select signal
reg interrupt_mapping_30_select_pulse;  // select signal
reg interrupt_mapping_31_select_pulse;  // select signal
reg interrupt_mapping_32_select_pulse;  // select signal
reg interrupt_mapping_33_select_pulse;  // select signal
reg interrupt_mapping_34_select_pulse;  // select signal
reg interrupt_mapping_35_select_pulse;  // select signal
reg interrupt_mapping_36_select_pulse;  // select signal
reg interrupt_mapping_37_select_pulse;  // select signal
reg interrupt_mapping_38_select_pulse;  // select signal
reg interrupt_mapping_39_select_pulse;  // select signal
reg interrupt_mapping_40_select_pulse;  // select signal
reg interrupt_mapping_41_select_pulse;  // select signal
reg interrupt_mapping_42_select_pulse;  // select signal
reg interrupt_mapping_43_select_pulse;  // select signal
reg interrupt_mapping_44_select_pulse;  // select signal
reg interrupt_mapping_45_select_pulse;  // select signal
reg interrupt_mapping_46_select_pulse;  // select signal
reg interrupt_mapping_47_select_pulse;  // select signal
reg interrupt_mapping_48_select_pulse;  // select signal
reg interrupt_mapping_49_select_pulse;  // select signal
reg interrupt_mapping_50_select_pulse;  // select signal
reg interrupt_mapping_51_select_pulse;  // select signal
reg interrupt_mapping_52_select_pulse;  // select signal
reg interrupt_mapping_53_select_pulse;  // select signal
reg interrupt_mapping_54_select_pulse;  // select signal
reg interrupt_mapping_55_select_pulse;  // select signal
reg interrupt_mapping_56_select_pulse;  // select signal
reg interrupt_mapping_57_select_pulse;  // select signal
reg interrupt_mapping_58_select_pulse;  // select signal
reg interrupt_mapping_59_select_pulse;  // select signal
reg interrupt_mapping_62_select_pulse;  // select signal
reg interrupt_mapping_63_select_pulse;  // select signal
reg clr_int_reg_20_select;  // select signal
reg clr_int_reg_21_select;  // select signal
reg clr_int_reg_22_select;  // select signal
reg clr_int_reg_23_select;  // select signal
reg clr_int_reg_24_select;  // select signal
reg clr_int_reg_25_select;  // select signal
reg clr_int_reg_26_select;  // select signal
reg clr_int_reg_27_select;  // select signal
reg clr_int_reg_28_select;  // select signal
reg clr_int_reg_29_select;  // select signal
reg clr_int_reg_30_select;  // select signal
reg clr_int_reg_31_select;  // select signal
reg clr_int_reg_32_select;  // select signal
reg clr_int_reg_33_select;  // select signal
reg clr_int_reg_34_select;  // select signal
reg clr_int_reg_35_select;  // select signal
reg clr_int_reg_36_select;  // select signal
reg clr_int_reg_37_select;  // select signal
reg clr_int_reg_38_select;  // select signal
reg clr_int_reg_39_select;  // select signal
reg clr_int_reg_40_select;  // select signal
reg clr_int_reg_41_select;  // select signal
reg clr_int_reg_42_select;  // select signal
reg clr_int_reg_43_select;  // select signal
reg clr_int_reg_44_select;  // select signal
reg clr_int_reg_45_select;  // select signal
reg clr_int_reg_46_select;  // select signal
reg clr_int_reg_47_select;  // select signal
reg clr_int_reg_48_select;  // select signal
reg clr_int_reg_49_select;  // select signal
reg clr_int_reg_50_select;  // select signal
reg clr_int_reg_51_select;  // select signal
reg clr_int_reg_52_select;  // select signal
reg clr_int_reg_53_select;  // select signal
reg clr_int_reg_54_select;  // select signal
reg clr_int_reg_55_select;  // select signal
reg clr_int_reg_56_select;  // select signal
reg clr_int_reg_57_select;  // select signal
reg clr_int_reg_58_select;  // select signal
reg clr_int_reg_59_select;  // select signal
reg clr_int_reg_62_select;  // select signal
reg clr_int_reg_63_select;  // select signal
reg interrupt_retry_timer_select_pulse;  // select signal
reg interrupt_state_status_1_select;  // select signal
reg interrupt_state_status_2_select;  // select signal


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
reg interrupt_mapping_20_addr_decoded;
reg interrupt_mapping_21_addr_decoded;
reg interrupt_mapping_22_addr_decoded;
reg interrupt_mapping_23_addr_decoded;
reg interrupt_mapping_24_addr_decoded;
reg interrupt_mapping_25_addr_decoded;
reg interrupt_mapping_26_addr_decoded;
reg interrupt_mapping_27_addr_decoded;
reg interrupt_mapping_28_addr_decoded;
reg interrupt_mapping_29_addr_decoded;
reg interrupt_mapping_30_addr_decoded;
reg interrupt_mapping_31_addr_decoded;
reg interrupt_mapping_32_addr_decoded;
reg interrupt_mapping_33_addr_decoded;
reg interrupt_mapping_34_addr_decoded;
reg interrupt_mapping_35_addr_decoded;
reg interrupt_mapping_36_addr_decoded;
reg interrupt_mapping_37_addr_decoded;
reg interrupt_mapping_38_addr_decoded;
reg interrupt_mapping_39_addr_decoded;
reg interrupt_mapping_40_addr_decoded;
reg interrupt_mapping_41_addr_decoded;
reg interrupt_mapping_42_addr_decoded;
reg interrupt_mapping_43_addr_decoded;
reg interrupt_mapping_44_addr_decoded;
reg interrupt_mapping_45_addr_decoded;
reg interrupt_mapping_46_addr_decoded;
reg interrupt_mapping_47_addr_decoded;
reg interrupt_mapping_48_addr_decoded;
reg interrupt_mapping_49_addr_decoded;
reg interrupt_mapping_50_addr_decoded;
reg interrupt_mapping_51_addr_decoded;
reg interrupt_mapping_52_addr_decoded;
reg interrupt_mapping_53_addr_decoded;
reg interrupt_mapping_54_addr_decoded;
reg interrupt_mapping_55_addr_decoded;
reg interrupt_mapping_56_addr_decoded;
reg interrupt_mapping_57_addr_decoded;
reg interrupt_mapping_58_addr_decoded;
reg interrupt_mapping_59_addr_decoded;
reg interrupt_mapping_62_addr_decoded;
reg interrupt_mapping_63_addr_decoded;
reg clr_int_reg_20_addr_decoded;
reg clr_int_reg_21_addr_decoded;
reg clr_int_reg_22_addr_decoded;
reg clr_int_reg_23_addr_decoded;
reg clr_int_reg_24_addr_decoded;
reg clr_int_reg_25_addr_decoded;
reg clr_int_reg_26_addr_decoded;
reg clr_int_reg_27_addr_decoded;
reg clr_int_reg_28_addr_decoded;
reg clr_int_reg_29_addr_decoded;
reg clr_int_reg_30_addr_decoded;
reg clr_int_reg_31_addr_decoded;
reg clr_int_reg_32_addr_decoded;
reg clr_int_reg_33_addr_decoded;
reg clr_int_reg_34_addr_decoded;
reg clr_int_reg_35_addr_decoded;
reg clr_int_reg_36_addr_decoded;
reg clr_int_reg_37_addr_decoded;
reg clr_int_reg_38_addr_decoded;
reg clr_int_reg_39_addr_decoded;
reg clr_int_reg_40_addr_decoded;
reg clr_int_reg_41_addr_decoded;
reg clr_int_reg_42_addr_decoded;
reg clr_int_reg_43_addr_decoded;
reg clr_int_reg_44_addr_decoded;
reg clr_int_reg_45_addr_decoded;
reg clr_int_reg_46_addr_decoded;
reg clr_int_reg_47_addr_decoded;
reg clr_int_reg_48_addr_decoded;
reg clr_int_reg_49_addr_decoded;
reg clr_int_reg_50_addr_decoded;
reg clr_int_reg_51_addr_decoded;
reg clr_int_reg_52_addr_decoded;
reg clr_int_reg_53_addr_decoded;
reg clr_int_reg_54_addr_decoded;
reg clr_int_reg_55_addr_decoded;
reg clr_int_reg_56_addr_decoded;
reg clr_int_reg_57_addr_decoded;
reg clr_int_reg_58_addr_decoded;
reg clr_int_reg_59_addr_decoded;
reg clr_int_reg_62_addr_decoded;
reg clr_int_reg_63_addr_decoded;
reg interrupt_retry_timer_addr_decoded;
reg interrupt_state_status_1_addr_decoded;
reg interrupt_state_status_2_addr_decoded;

always @(daemon_csrbus_addr or daemon_csrbus_valid or instance_id)
  begin
    if (~daemon_csrbus_valid)
      begin
        interrupt_mapping_20_addr_decoded = 1'b0;
        interrupt_mapping_21_addr_decoded = 1'b0;
        interrupt_mapping_22_addr_decoded = 1'b0;
        interrupt_mapping_23_addr_decoded = 1'b0;
        interrupt_mapping_24_addr_decoded = 1'b0;
        interrupt_mapping_25_addr_decoded = 1'b0;
        interrupt_mapping_26_addr_decoded = 1'b0;
        interrupt_mapping_27_addr_decoded = 1'b0;
        interrupt_mapping_28_addr_decoded = 1'b0;
        interrupt_mapping_29_addr_decoded = 1'b0;
        interrupt_mapping_30_addr_decoded = 1'b0;
        interrupt_mapping_31_addr_decoded = 1'b0;
        interrupt_mapping_32_addr_decoded = 1'b0;
        interrupt_mapping_33_addr_decoded = 1'b0;
        interrupt_mapping_34_addr_decoded = 1'b0;
        interrupt_mapping_35_addr_decoded = 1'b0;
        interrupt_mapping_36_addr_decoded = 1'b0;
        interrupt_mapping_37_addr_decoded = 1'b0;
        interrupt_mapping_38_addr_decoded = 1'b0;
        interrupt_mapping_39_addr_decoded = 1'b0;
        interrupt_mapping_40_addr_decoded = 1'b0;
        interrupt_mapping_41_addr_decoded = 1'b0;
        interrupt_mapping_42_addr_decoded = 1'b0;
        interrupt_mapping_43_addr_decoded = 1'b0;
        interrupt_mapping_44_addr_decoded = 1'b0;
        interrupt_mapping_45_addr_decoded = 1'b0;
        interrupt_mapping_46_addr_decoded = 1'b0;
        interrupt_mapping_47_addr_decoded = 1'b0;
        interrupt_mapping_48_addr_decoded = 1'b0;
        interrupt_mapping_49_addr_decoded = 1'b0;
        interrupt_mapping_50_addr_decoded = 1'b0;
        interrupt_mapping_51_addr_decoded = 1'b0;
        interrupt_mapping_52_addr_decoded = 1'b0;
        interrupt_mapping_53_addr_decoded = 1'b0;
        interrupt_mapping_54_addr_decoded = 1'b0;
        interrupt_mapping_55_addr_decoded = 1'b0;
        interrupt_mapping_56_addr_decoded = 1'b0;
        interrupt_mapping_57_addr_decoded = 1'b0;
        interrupt_mapping_58_addr_decoded = 1'b0;
        interrupt_mapping_59_addr_decoded = 1'b0;
        interrupt_mapping_62_addr_decoded = 1'b0;
        interrupt_mapping_63_addr_decoded = 1'b0;
        clr_int_reg_20_addr_decoded = 1'b0;
        clr_int_reg_21_addr_decoded = 1'b0;
        clr_int_reg_22_addr_decoded = 1'b0;
        clr_int_reg_23_addr_decoded = 1'b0;
        clr_int_reg_24_addr_decoded = 1'b0;
        clr_int_reg_25_addr_decoded = 1'b0;
        clr_int_reg_26_addr_decoded = 1'b0;
        clr_int_reg_27_addr_decoded = 1'b0;
        clr_int_reg_28_addr_decoded = 1'b0;
        clr_int_reg_29_addr_decoded = 1'b0;
        clr_int_reg_30_addr_decoded = 1'b0;
        clr_int_reg_31_addr_decoded = 1'b0;
        clr_int_reg_32_addr_decoded = 1'b0;
        clr_int_reg_33_addr_decoded = 1'b0;
        clr_int_reg_34_addr_decoded = 1'b0;
        clr_int_reg_35_addr_decoded = 1'b0;
        clr_int_reg_36_addr_decoded = 1'b0;
        clr_int_reg_37_addr_decoded = 1'b0;
        clr_int_reg_38_addr_decoded = 1'b0;
        clr_int_reg_39_addr_decoded = 1'b0;
        clr_int_reg_40_addr_decoded = 1'b0;
        clr_int_reg_41_addr_decoded = 1'b0;
        clr_int_reg_42_addr_decoded = 1'b0;
        clr_int_reg_43_addr_decoded = 1'b0;
        clr_int_reg_44_addr_decoded = 1'b0;
        clr_int_reg_45_addr_decoded = 1'b0;
        clr_int_reg_46_addr_decoded = 1'b0;
        clr_int_reg_47_addr_decoded = 1'b0;
        clr_int_reg_48_addr_decoded = 1'b0;
        clr_int_reg_49_addr_decoded = 1'b0;
        clr_int_reg_50_addr_decoded = 1'b0;
        clr_int_reg_51_addr_decoded = 1'b0;
        clr_int_reg_52_addr_decoded = 1'b0;
        clr_int_reg_53_addr_decoded = 1'b0;
        clr_int_reg_54_addr_decoded = 1'b0;
        clr_int_reg_55_addr_decoded = 1'b0;
        clr_int_reg_56_addr_decoded = 1'b0;
        clr_int_reg_57_addr_decoded = 1'b0;
        clr_int_reg_58_addr_decoded = 1'b0;
        clr_int_reg_59_addr_decoded = 1'b0;
        clr_int_reg_62_addr_decoded = 1'b0;
        clr_int_reg_63_addr_decoded = 1'b0;
        interrupt_retry_timer_addr_decoded = 1'b0;
        interrupt_state_status_1_addr_decoded = 1'b0;
        interrupt_state_status_2_addr_decoded = 1'b0;
      end
    else
      case (instance_id)

        `FIRE_DLC_IMU_ISS_INSTANCE_ID_VALUE_A:
          begin
        interrupt_mapping_20_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_20_HW_ADDR;
        interrupt_mapping_21_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_21_HW_ADDR;
        interrupt_mapping_22_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_22_HW_ADDR;
        interrupt_mapping_23_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_23_HW_ADDR;
        interrupt_mapping_24_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_24_HW_ADDR;
        interrupt_mapping_25_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_25_HW_ADDR;
        interrupt_mapping_26_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_26_HW_ADDR;
        interrupt_mapping_27_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_27_HW_ADDR;
        interrupt_mapping_28_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_28_HW_ADDR;
        interrupt_mapping_29_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_29_HW_ADDR;
        interrupt_mapping_30_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_30_HW_ADDR;
        interrupt_mapping_31_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_31_HW_ADDR;
        interrupt_mapping_32_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_32_HW_ADDR;
        interrupt_mapping_33_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_33_HW_ADDR;
        interrupt_mapping_34_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_34_HW_ADDR;
        interrupt_mapping_35_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_35_HW_ADDR;
        interrupt_mapping_36_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_36_HW_ADDR;
        interrupt_mapping_37_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_37_HW_ADDR;
        interrupt_mapping_38_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_38_HW_ADDR;
        interrupt_mapping_39_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_39_HW_ADDR;
        interrupt_mapping_40_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_40_HW_ADDR;
        interrupt_mapping_41_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_41_HW_ADDR;
        interrupt_mapping_42_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_42_HW_ADDR;
        interrupt_mapping_43_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_43_HW_ADDR;
        interrupt_mapping_44_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_44_HW_ADDR;
        interrupt_mapping_45_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_45_HW_ADDR;
        interrupt_mapping_46_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_46_HW_ADDR;
        interrupt_mapping_47_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_47_HW_ADDR;
        interrupt_mapping_48_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_48_HW_ADDR;
        interrupt_mapping_49_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_49_HW_ADDR;
        interrupt_mapping_50_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_50_HW_ADDR;
        interrupt_mapping_51_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_51_HW_ADDR;
        interrupt_mapping_52_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_52_HW_ADDR;
        interrupt_mapping_53_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_53_HW_ADDR;
        interrupt_mapping_54_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_54_HW_ADDR;
        interrupt_mapping_55_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_55_HW_ADDR;
        interrupt_mapping_56_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_56_HW_ADDR;
        interrupt_mapping_57_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_57_HW_ADDR;
        interrupt_mapping_58_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_58_HW_ADDR;
        interrupt_mapping_59_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_59_HW_ADDR;
        interrupt_mapping_62_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_62_HW_ADDR;
        interrupt_mapping_63_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_MAPPING_63_HW_ADDR;
        clr_int_reg_20_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_20_HW_ADDR;
        clr_int_reg_21_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_21_HW_ADDR;
        clr_int_reg_22_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_22_HW_ADDR;
        clr_int_reg_23_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_23_HW_ADDR;
        clr_int_reg_24_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_24_HW_ADDR;
        clr_int_reg_25_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_25_HW_ADDR;
        clr_int_reg_26_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_26_HW_ADDR;
        clr_int_reg_27_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_27_HW_ADDR;
        clr_int_reg_28_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_28_HW_ADDR;
        clr_int_reg_29_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_29_HW_ADDR;
        clr_int_reg_30_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_30_HW_ADDR;
        clr_int_reg_31_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_31_HW_ADDR;
        clr_int_reg_32_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_32_HW_ADDR;
        clr_int_reg_33_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_33_HW_ADDR;
        clr_int_reg_34_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_34_HW_ADDR;
        clr_int_reg_35_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_35_HW_ADDR;
        clr_int_reg_36_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_36_HW_ADDR;
        clr_int_reg_37_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_37_HW_ADDR;
        clr_int_reg_38_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_38_HW_ADDR;
        clr_int_reg_39_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_39_HW_ADDR;
        clr_int_reg_40_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_40_HW_ADDR;
        clr_int_reg_41_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_41_HW_ADDR;
        clr_int_reg_42_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_42_HW_ADDR;
        clr_int_reg_43_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_43_HW_ADDR;
        clr_int_reg_44_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_44_HW_ADDR;
        clr_int_reg_45_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_45_HW_ADDR;
        clr_int_reg_46_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_46_HW_ADDR;
        clr_int_reg_47_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_47_HW_ADDR;
        clr_int_reg_48_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_48_HW_ADDR;
        clr_int_reg_49_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_49_HW_ADDR;
        clr_int_reg_50_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_50_HW_ADDR;
        clr_int_reg_51_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_51_HW_ADDR;
        clr_int_reg_52_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_52_HW_ADDR;
        clr_int_reg_53_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_53_HW_ADDR;
        clr_int_reg_54_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_54_HW_ADDR;
        clr_int_reg_55_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_55_HW_ADDR;
        clr_int_reg_56_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_56_HW_ADDR;
        clr_int_reg_57_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_57_HW_ADDR;
        clr_int_reg_58_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_58_HW_ADDR;
        clr_int_reg_59_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_59_HW_ADDR;
        clr_int_reg_62_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_62_HW_ADDR;
        clr_int_reg_63_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_63_HW_ADDR;
        interrupt_retry_timer_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_RETRY_TIMER_HW_ADDR;
        interrupt_state_status_1_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_1_HW_ADDR;
        interrupt_state_status_2_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_A_INTERRUPT_STATE_STATUS_2_HW_ADDR;
          end

        `FIRE_DLC_IMU_ISS_INSTANCE_ID_VALUE_B:
          begin
        interrupt_mapping_20_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_20_HW_ADDR;
        interrupt_mapping_21_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_21_HW_ADDR;
        interrupt_mapping_22_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_22_HW_ADDR;
        interrupt_mapping_23_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_23_HW_ADDR;
        interrupt_mapping_24_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_24_HW_ADDR;
        interrupt_mapping_25_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_25_HW_ADDR;
        interrupt_mapping_26_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_26_HW_ADDR;
        interrupt_mapping_27_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_27_HW_ADDR;
        interrupt_mapping_28_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_28_HW_ADDR;
        interrupt_mapping_29_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_29_HW_ADDR;
        interrupt_mapping_30_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_30_HW_ADDR;
        interrupt_mapping_31_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_31_HW_ADDR;
        interrupt_mapping_32_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_32_HW_ADDR;
        interrupt_mapping_33_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_33_HW_ADDR;
        interrupt_mapping_34_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_34_HW_ADDR;
        interrupt_mapping_35_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_35_HW_ADDR;
        interrupt_mapping_36_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_36_HW_ADDR;
        interrupt_mapping_37_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_37_HW_ADDR;
        interrupt_mapping_38_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_38_HW_ADDR;
        interrupt_mapping_39_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_39_HW_ADDR;
        interrupt_mapping_40_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_40_HW_ADDR;
        interrupt_mapping_41_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_41_HW_ADDR;
        interrupt_mapping_42_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_42_HW_ADDR;
        interrupt_mapping_43_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_43_HW_ADDR;
        interrupt_mapping_44_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_44_HW_ADDR;
        interrupt_mapping_45_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_45_HW_ADDR;
        interrupt_mapping_46_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_46_HW_ADDR;
        interrupt_mapping_47_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_47_HW_ADDR;
        interrupt_mapping_48_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_48_HW_ADDR;
        interrupt_mapping_49_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_49_HW_ADDR;
        interrupt_mapping_50_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_50_HW_ADDR;
        interrupt_mapping_51_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_51_HW_ADDR;
        interrupt_mapping_52_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_52_HW_ADDR;
        interrupt_mapping_53_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_53_HW_ADDR;
        interrupt_mapping_54_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_54_HW_ADDR;
        interrupt_mapping_55_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_55_HW_ADDR;
        interrupt_mapping_56_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_56_HW_ADDR;
        interrupt_mapping_57_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_57_HW_ADDR;
        interrupt_mapping_58_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_58_HW_ADDR;
        interrupt_mapping_59_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_59_HW_ADDR;
        interrupt_mapping_62_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_62_HW_ADDR;
        interrupt_mapping_63_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_MAPPING_63_HW_ADDR;
        clr_int_reg_20_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_20_HW_ADDR;
        clr_int_reg_21_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_21_HW_ADDR;
        clr_int_reg_22_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_22_HW_ADDR;
        clr_int_reg_23_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_23_HW_ADDR;
        clr_int_reg_24_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_24_HW_ADDR;
        clr_int_reg_25_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_25_HW_ADDR;
        clr_int_reg_26_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_26_HW_ADDR;
        clr_int_reg_27_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_27_HW_ADDR;
        clr_int_reg_28_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_28_HW_ADDR;
        clr_int_reg_29_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_29_HW_ADDR;
        clr_int_reg_30_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_30_HW_ADDR;
        clr_int_reg_31_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_31_HW_ADDR;
        clr_int_reg_32_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_32_HW_ADDR;
        clr_int_reg_33_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_33_HW_ADDR;
        clr_int_reg_34_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_34_HW_ADDR;
        clr_int_reg_35_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_35_HW_ADDR;
        clr_int_reg_36_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_36_HW_ADDR;
        clr_int_reg_37_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_37_HW_ADDR;
        clr_int_reg_38_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_38_HW_ADDR;
        clr_int_reg_39_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_39_HW_ADDR;
        clr_int_reg_40_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_40_HW_ADDR;
        clr_int_reg_41_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_41_HW_ADDR;
        clr_int_reg_42_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_42_HW_ADDR;
        clr_int_reg_43_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_43_HW_ADDR;
        clr_int_reg_44_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_44_HW_ADDR;
        clr_int_reg_45_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_45_HW_ADDR;
        clr_int_reg_46_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_46_HW_ADDR;
        clr_int_reg_47_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_47_HW_ADDR;
        clr_int_reg_48_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_48_HW_ADDR;
        clr_int_reg_49_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_49_HW_ADDR;
        clr_int_reg_50_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_50_HW_ADDR;
        clr_int_reg_51_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_51_HW_ADDR;
        clr_int_reg_52_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_52_HW_ADDR;
        clr_int_reg_53_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_53_HW_ADDR;
        clr_int_reg_54_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_54_HW_ADDR;
        clr_int_reg_55_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_55_HW_ADDR;
        clr_int_reg_56_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_56_HW_ADDR;
        clr_int_reg_57_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_57_HW_ADDR;
        clr_int_reg_58_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_58_HW_ADDR;
        clr_int_reg_59_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_59_HW_ADDR;
        clr_int_reg_62_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_62_HW_ADDR;
        clr_int_reg_63_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_CLR_INT_REG_63_HW_ADDR;
        interrupt_retry_timer_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_RETRY_TIMER_HW_ADDR;
        interrupt_state_status_1_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_STATE_STATUS_1_HW_ADDR;
        interrupt_state_status_2_addr_decoded =
                daemon_csrbus_addr[26:0] == `FIRE_DLC_IMU_ISS_CSR_B_INTERRUPT_STATE_STATUS_2_HW_ADDR;
          end

        default:
          begin
            interrupt_mapping_20_addr_decoded = 1'b0;
            interrupt_mapping_21_addr_decoded = 1'b0;
            interrupt_mapping_22_addr_decoded = 1'b0;
            interrupt_mapping_23_addr_decoded = 1'b0;
            interrupt_mapping_24_addr_decoded = 1'b0;
            interrupt_mapping_25_addr_decoded = 1'b0;
            interrupt_mapping_26_addr_decoded = 1'b0;
            interrupt_mapping_27_addr_decoded = 1'b0;
            interrupt_mapping_28_addr_decoded = 1'b0;
            interrupt_mapping_29_addr_decoded = 1'b0;
            interrupt_mapping_30_addr_decoded = 1'b0;
            interrupt_mapping_31_addr_decoded = 1'b0;
            interrupt_mapping_32_addr_decoded = 1'b0;
            interrupt_mapping_33_addr_decoded = 1'b0;
            interrupt_mapping_34_addr_decoded = 1'b0;
            interrupt_mapping_35_addr_decoded = 1'b0;
            interrupt_mapping_36_addr_decoded = 1'b0;
            interrupt_mapping_37_addr_decoded = 1'b0;
            interrupt_mapping_38_addr_decoded = 1'b0;
            interrupt_mapping_39_addr_decoded = 1'b0;
            interrupt_mapping_40_addr_decoded = 1'b0;
            interrupt_mapping_41_addr_decoded = 1'b0;
            interrupt_mapping_42_addr_decoded = 1'b0;
            interrupt_mapping_43_addr_decoded = 1'b0;
            interrupt_mapping_44_addr_decoded = 1'b0;
            interrupt_mapping_45_addr_decoded = 1'b0;
            interrupt_mapping_46_addr_decoded = 1'b0;
            interrupt_mapping_47_addr_decoded = 1'b0;
            interrupt_mapping_48_addr_decoded = 1'b0;
            interrupt_mapping_49_addr_decoded = 1'b0;
            interrupt_mapping_50_addr_decoded = 1'b0;
            interrupt_mapping_51_addr_decoded = 1'b0;
            interrupt_mapping_52_addr_decoded = 1'b0;
            interrupt_mapping_53_addr_decoded = 1'b0;
            interrupt_mapping_54_addr_decoded = 1'b0;
            interrupt_mapping_55_addr_decoded = 1'b0;
            interrupt_mapping_56_addr_decoded = 1'b0;
            interrupt_mapping_57_addr_decoded = 1'b0;
            interrupt_mapping_58_addr_decoded = 1'b0;
            interrupt_mapping_59_addr_decoded = 1'b0;
            interrupt_mapping_62_addr_decoded = 1'b0;
            interrupt_mapping_63_addr_decoded = 1'b0;
            clr_int_reg_20_addr_decoded = 1'b0;
            clr_int_reg_21_addr_decoded = 1'b0;
            clr_int_reg_22_addr_decoded = 1'b0;
            clr_int_reg_23_addr_decoded = 1'b0;
            clr_int_reg_24_addr_decoded = 1'b0;
            clr_int_reg_25_addr_decoded = 1'b0;
            clr_int_reg_26_addr_decoded = 1'b0;
            clr_int_reg_27_addr_decoded = 1'b0;
            clr_int_reg_28_addr_decoded = 1'b0;
            clr_int_reg_29_addr_decoded = 1'b0;
            clr_int_reg_30_addr_decoded = 1'b0;
            clr_int_reg_31_addr_decoded = 1'b0;
            clr_int_reg_32_addr_decoded = 1'b0;
            clr_int_reg_33_addr_decoded = 1'b0;
            clr_int_reg_34_addr_decoded = 1'b0;
            clr_int_reg_35_addr_decoded = 1'b0;
            clr_int_reg_36_addr_decoded = 1'b0;
            clr_int_reg_37_addr_decoded = 1'b0;
            clr_int_reg_38_addr_decoded = 1'b0;
            clr_int_reg_39_addr_decoded = 1'b0;
            clr_int_reg_40_addr_decoded = 1'b0;
            clr_int_reg_41_addr_decoded = 1'b0;
            clr_int_reg_42_addr_decoded = 1'b0;
            clr_int_reg_43_addr_decoded = 1'b0;
            clr_int_reg_44_addr_decoded = 1'b0;
            clr_int_reg_45_addr_decoded = 1'b0;
            clr_int_reg_46_addr_decoded = 1'b0;
            clr_int_reg_47_addr_decoded = 1'b0;
            clr_int_reg_48_addr_decoded = 1'b0;
            clr_int_reg_49_addr_decoded = 1'b0;
            clr_int_reg_50_addr_decoded = 1'b0;
            clr_int_reg_51_addr_decoded = 1'b0;
            clr_int_reg_52_addr_decoded = 1'b0;
            clr_int_reg_53_addr_decoded = 1'b0;
            clr_int_reg_54_addr_decoded = 1'b0;
            clr_int_reg_55_addr_decoded = 1'b0;
            clr_int_reg_56_addr_decoded = 1'b0;
            clr_int_reg_57_addr_decoded = 1'b0;
            clr_int_reg_58_addr_decoded = 1'b0;
            clr_int_reg_59_addr_decoded = 1'b0;
            clr_int_reg_62_addr_decoded = 1'b0;
            clr_int_reg_63_addr_decoded = 1'b0;
            interrupt_retry_timer_addr_decoded = 1'b0;
            interrupt_state_status_1_addr_decoded = 1'b0;
            interrupt_state_status_2_addr_decoded = 1'b0;
// vlint flag_system_call off
            // synopsys translate_off
            if(daemon_csrbus_valid)
               begin // axis tbcall_region
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"ERROR: Instance ID for module dmu_imu_iss_csr is bad"); `endif
               end // end of tbcall_region
            // synopsys translate_on
// vlint flag_system_call on
          end
      endcase
  end

//====================================================================
//      Register violations
//====================================================================
//----- reg_acc_vio: interrupt_mapping_20
reg interrupt_mapping_20_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_20_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_20_addr_decoded)
      interrupt_mapping_20_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_20_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_20_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_20_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_20_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_20_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_20_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_20_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_20_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_20_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_20"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_21
reg interrupt_mapping_21_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_21_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_21_addr_decoded)
      interrupt_mapping_21_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_21_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_21_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_21_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_21_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_21_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_21_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_21_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_21_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_21_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_21"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_22
reg interrupt_mapping_22_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_22_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_22_addr_decoded)
      interrupt_mapping_22_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_22_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_22_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_22_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_22_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_22_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_22_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_22_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_22_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_22_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_22"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_23
reg interrupt_mapping_23_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_23_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_23_addr_decoded)
      interrupt_mapping_23_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_23_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_23_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_23_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_23_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_23_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_23_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_23_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_23_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_23_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_23"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_24
reg interrupt_mapping_24_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_24_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_24_addr_decoded)
      interrupt_mapping_24_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_24_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_24_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_24_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_24_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_24_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_24_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_24_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_24_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_24_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_24"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_25
reg interrupt_mapping_25_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_25_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_25_addr_decoded)
      interrupt_mapping_25_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_25_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_25_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_25_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_25_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_25_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_25_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_25_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_25_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_25_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_25"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_26
reg interrupt_mapping_26_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_26_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_26_addr_decoded)
      interrupt_mapping_26_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_26_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_26_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_26_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_26_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_26_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_26_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_26_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_26_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_26_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_26"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_27
reg interrupt_mapping_27_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_27_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_27_addr_decoded)
      interrupt_mapping_27_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_27_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_27_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_27_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_27_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_27_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_27_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_27_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_27_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_27_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_27"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_28
reg interrupt_mapping_28_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_28_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_28_addr_decoded)
      interrupt_mapping_28_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_28_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_28_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_28_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_28_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_28_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_28_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_28_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_28_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_28_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_28"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_29
reg interrupt_mapping_29_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_29_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_29_addr_decoded)
      interrupt_mapping_29_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_29_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_29_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_29_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_29_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_29_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_29_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_29_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_29_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_29_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_29"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_30
reg interrupt_mapping_30_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_30_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_30_addr_decoded)
      interrupt_mapping_30_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_30_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_30_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_30_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_30_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_30_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_30_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_30_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_30_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_30_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_30"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_31
reg interrupt_mapping_31_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_31_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_31_addr_decoded)
      interrupt_mapping_31_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_31_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_31_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_31_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_31_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_31_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_31_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_31_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_31_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_31_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_31"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_32
reg interrupt_mapping_32_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_32_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_32_addr_decoded)
      interrupt_mapping_32_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_32_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_32_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_32_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_32_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_32_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_32_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_32_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_32_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_32_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_32"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_33
reg interrupt_mapping_33_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_33_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_33_addr_decoded)
      interrupt_mapping_33_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_33_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_33_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_33_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_33_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_33_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_33_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_33_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_33_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_33_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_33"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_34
reg interrupt_mapping_34_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_34_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_34_addr_decoded)
      interrupt_mapping_34_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_34_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_34_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_34_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_34_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_34_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_34_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_34_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_34_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_34_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_34"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_35
reg interrupt_mapping_35_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_35_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_35_addr_decoded)
      interrupt_mapping_35_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_35_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_35_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_35_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_35_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_35_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_35_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_35_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_35_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_35_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_35"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_36
reg interrupt_mapping_36_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_36_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_36_addr_decoded)
      interrupt_mapping_36_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_36_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_36_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_36_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_36_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_36_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_36_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_36_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_36_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_36_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_36"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_37
reg interrupt_mapping_37_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_37_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_37_addr_decoded)
      interrupt_mapping_37_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_37_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_37_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_37_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_37_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_37_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_37_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_37_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_37_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_37_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_37"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_38
reg interrupt_mapping_38_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_38_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_38_addr_decoded)
      interrupt_mapping_38_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_38_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_38_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_38_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_38_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_38_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_38_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_38_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_38_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_38_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_38"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_39
reg interrupt_mapping_39_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_39_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_39_addr_decoded)
      interrupt_mapping_39_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_39_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_39_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_39_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_39_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_39_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_39_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_39_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_39_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_39_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_39"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_40
reg interrupt_mapping_40_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_40_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_40_addr_decoded)
      interrupt_mapping_40_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_40_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_40_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_40_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_40_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_40_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_40_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_40_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_40_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_40_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_40"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_41
reg interrupt_mapping_41_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_41_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_41_addr_decoded)
      interrupt_mapping_41_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_41_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_41_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_41_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_41_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_41_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_41_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_41_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_41_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_41_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_41"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_42
reg interrupt_mapping_42_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_42_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_42_addr_decoded)
      interrupt_mapping_42_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_42_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_42_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_42_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_42_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_42_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_42_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_42_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_42_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_42_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_42"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_43
reg interrupt_mapping_43_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_43_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_43_addr_decoded)
      interrupt_mapping_43_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_43_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_43_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_43_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_43_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_43_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_43_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_43_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_43_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_43_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_43"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_44
reg interrupt_mapping_44_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_44_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_44_addr_decoded)
      interrupt_mapping_44_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_44_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_44_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_44_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_44_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_44_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_44_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_44_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_44_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_44_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_44"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_45
reg interrupt_mapping_45_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_45_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_45_addr_decoded)
      interrupt_mapping_45_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_45_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_45_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_45_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_45_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_45_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_45_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_45_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_45_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_45_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_45"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_46
reg interrupt_mapping_46_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_46_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_46_addr_decoded)
      interrupt_mapping_46_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_46_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_46_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_46_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_46_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_46_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_46_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_46_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_46_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_46_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_46"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_47
reg interrupt_mapping_47_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_47_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_47_addr_decoded)
      interrupt_mapping_47_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_47_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_47_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_47_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_47_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_47_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_47_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_47_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_47_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_47_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_47"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_48
reg interrupt_mapping_48_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_48_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_48_addr_decoded)
      interrupt_mapping_48_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_48_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_48_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_48_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_48_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_48_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_48_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_48_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_48_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_48_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_48"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_49
reg interrupt_mapping_49_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_49_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_49_addr_decoded)
      interrupt_mapping_49_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_49_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_49_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_49_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_49_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_49_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_49_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_49_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_49_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_49_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_49"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_50
reg interrupt_mapping_50_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_50_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_50_addr_decoded)
      interrupt_mapping_50_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_50_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_50_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_50_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_50_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_50_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_50_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_50_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_50_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_50_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_50"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_51
reg interrupt_mapping_51_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_51_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_51_addr_decoded)
      interrupt_mapping_51_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_51_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_51_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_51_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_51_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_51_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_51_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_51_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_51_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_51_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_51"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_52
reg interrupt_mapping_52_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_52_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_52_addr_decoded)
      interrupt_mapping_52_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_52_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_52_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_52_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_52_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_52_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_52_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_52_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_52_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_52_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_52"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_53
reg interrupt_mapping_53_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_53_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_53_addr_decoded)
      interrupt_mapping_53_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_53_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_53_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_53_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_53_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_53_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_53_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_53_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_53_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_53_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_53"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_54
reg interrupt_mapping_54_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_54_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_54_addr_decoded)
      interrupt_mapping_54_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_54_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_54_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_54_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_54_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_54_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_54_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_54_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_54_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_54_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_54"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_55
reg interrupt_mapping_55_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_55_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_55_addr_decoded)
      interrupt_mapping_55_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_55_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_55_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_55_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_55_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_55_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_55_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_55_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_55_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_55_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_55"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_56
reg interrupt_mapping_56_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_56_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_56_addr_decoded)
      interrupt_mapping_56_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_56_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_56_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_56_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_56_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_56_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_56_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_56_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_56_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_56_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_56"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_57
reg interrupt_mapping_57_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_57_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_57_addr_decoded)
      interrupt_mapping_57_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_57_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_57_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_57_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_57_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_57_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_57_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_57_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_57_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_57_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_57"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_58
reg interrupt_mapping_58_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_58_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_58_addr_decoded)
      interrupt_mapping_58_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_58_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_58_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_58_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_58_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_58_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_58_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_58_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_58_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_58_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_58"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_59
reg interrupt_mapping_59_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_59_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_59_addr_decoded)
      interrupt_mapping_59_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_59_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_59_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_59_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_59_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_59_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_59_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_59_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_59_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_59_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_59"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_62
reg interrupt_mapping_62_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_62_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_62_addr_decoded)
      interrupt_mapping_62_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_62_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_62_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_62_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_62_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_62_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_62_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_62_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_62_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_62_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_62"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_mapping_63
reg interrupt_mapping_63_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_mapping_63_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_mapping_63_addr_decoded)
      interrupt_mapping_63_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_mapping_63_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_mapping_63_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_mapping_63_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_mapping_63_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_mapping_63_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_mapping_63_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_mapping_63_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_mapping_63_acc_vio = 1'b0;

          default: 
             begin
                interrupt_mapping_63_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_mapping_63"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_20
reg clr_int_reg_20_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_20_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_20_addr_decoded)
      clr_int_reg_20_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_20_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_20_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_20_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_20_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_20_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_20_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_20_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_20_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_20_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_20"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_21
reg clr_int_reg_21_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_21_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_21_addr_decoded)
      clr_int_reg_21_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_21_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_21_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_21_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_21_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_21_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_21_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_21_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_21_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_21_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_21"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_22
reg clr_int_reg_22_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_22_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_22_addr_decoded)
      clr_int_reg_22_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_22_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_22_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_22_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_22_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_22_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_22_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_22_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_22_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_22_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_22"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_23
reg clr_int_reg_23_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_23_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_23_addr_decoded)
      clr_int_reg_23_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_23_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_23_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_23_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_23_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_23_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_23_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_23_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_23_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_23_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_23"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_24
reg clr_int_reg_24_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_24_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_24_addr_decoded)
      clr_int_reg_24_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_24_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_24_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_24_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_24_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_24_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_24_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_24_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_24_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_24_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_24"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_25
reg clr_int_reg_25_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_25_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_25_addr_decoded)
      clr_int_reg_25_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_25_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_25_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_25_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_25_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_25_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_25_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_25_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_25_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_25_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_25"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_26
reg clr_int_reg_26_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_26_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_26_addr_decoded)
      clr_int_reg_26_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_26_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_26_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_26_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_26_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_26_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_26_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_26_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_26_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_26_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_26"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_27
reg clr_int_reg_27_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_27_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_27_addr_decoded)
      clr_int_reg_27_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_27_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_27_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_27_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_27_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_27_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_27_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_27_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_27_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_27_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_27"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_28
reg clr_int_reg_28_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_28_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_28_addr_decoded)
      clr_int_reg_28_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_28_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_28_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_28_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_28_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_28_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_28_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_28_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_28_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_28_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_28"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_29
reg clr_int_reg_29_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_29_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_29_addr_decoded)
      clr_int_reg_29_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_29_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_29_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_29_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_29_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_29_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_29_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_29_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_29_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_29_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_29"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_30
reg clr_int_reg_30_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_30_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_30_addr_decoded)
      clr_int_reg_30_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_30_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_30_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_30_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_30_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_30_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_30_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_30_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_30_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_30_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_30"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_31
reg clr_int_reg_31_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_31_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_31_addr_decoded)
      clr_int_reg_31_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_31_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_31_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_31_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_31_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_31_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_31_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_31_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_31_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_31_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_31"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_32
reg clr_int_reg_32_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_32_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_32_addr_decoded)
      clr_int_reg_32_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_32_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_32_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_32_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_32_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_32_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_32_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_32_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_32_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_32_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_32"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_33
reg clr_int_reg_33_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_33_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_33_addr_decoded)
      clr_int_reg_33_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_33_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_33_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_33_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_33_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_33_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_33_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_33_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_33_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_33_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_33"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_34
reg clr_int_reg_34_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_34_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_34_addr_decoded)
      clr_int_reg_34_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_34_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_34_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_34_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_34_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_34_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_34_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_34_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_34_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_34_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_34"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_35
reg clr_int_reg_35_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_35_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_35_addr_decoded)
      clr_int_reg_35_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_35_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_35_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_35_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_35_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_35_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_35_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_35_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_35_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_35_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_35"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_36
reg clr_int_reg_36_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_36_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_36_addr_decoded)
      clr_int_reg_36_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_36_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_36_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_36_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_36_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_36_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_36_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_36_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_36_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_36_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_36"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_37
reg clr_int_reg_37_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_37_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_37_addr_decoded)
      clr_int_reg_37_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_37_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_37_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_37_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_37_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_37_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_37_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_37_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_37_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_37_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_37"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_38
reg clr_int_reg_38_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_38_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_38_addr_decoded)
      clr_int_reg_38_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_38_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_38_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_38_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_38_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_38_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_38_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_38_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_38_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_38_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_38"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_39
reg clr_int_reg_39_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_39_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_39_addr_decoded)
      clr_int_reg_39_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_39_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_39_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_39_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_39_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_39_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_39_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_39_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_39_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_39_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_39"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_40
reg clr_int_reg_40_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_40_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_40_addr_decoded)
      clr_int_reg_40_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_40_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_40_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_40_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_40_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_40_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_40_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_40_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_40_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_40_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_40"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_41
reg clr_int_reg_41_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_41_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_41_addr_decoded)
      clr_int_reg_41_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_41_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_41_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_41_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_41_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_41_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_41_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_41_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_41_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_41_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_41"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_42
reg clr_int_reg_42_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_42_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_42_addr_decoded)
      clr_int_reg_42_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_42_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_42_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_42_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_42_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_42_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_42_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_42_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_42_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_42_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_42"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_43
reg clr_int_reg_43_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_43_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_43_addr_decoded)
      clr_int_reg_43_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_43_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_43_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_43_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_43_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_43_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_43_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_43_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_43_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_43_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_43"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_44
reg clr_int_reg_44_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_44_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_44_addr_decoded)
      clr_int_reg_44_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_44_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_44_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_44_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_44_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_44_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_44_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_44_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_44_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_44_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_44"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_45
reg clr_int_reg_45_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_45_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_45_addr_decoded)
      clr_int_reg_45_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_45_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_45_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_45_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_45_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_45_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_45_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_45_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_45_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_45_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_45"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_46
reg clr_int_reg_46_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_46_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_46_addr_decoded)
      clr_int_reg_46_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_46_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_46_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_46_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_46_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_46_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_46_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_46_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_46_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_46_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_46"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_47
reg clr_int_reg_47_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_47_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_47_addr_decoded)
      clr_int_reg_47_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_47_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_47_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_47_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_47_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_47_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_47_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_47_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_47_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_47_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_47"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_48
reg clr_int_reg_48_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_48_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_48_addr_decoded)
      clr_int_reg_48_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_48_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_48_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_48_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_48_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_48_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_48_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_48_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_48_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_48_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_48"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_49
reg clr_int_reg_49_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_49_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_49_addr_decoded)
      clr_int_reg_49_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_49_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_49_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_49_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_49_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_49_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_49_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_49_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_49_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_49_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_49"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_50
reg clr_int_reg_50_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_50_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_50_addr_decoded)
      clr_int_reg_50_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_50_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_50_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_50_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_50_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_50_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_50_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_50_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_50_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_50_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_50"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_51
reg clr_int_reg_51_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_51_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_51_addr_decoded)
      clr_int_reg_51_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_51_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_51_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_51_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_51_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_51_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_51_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_51_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_51_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_51_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_51"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_52
reg clr_int_reg_52_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_52_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_52_addr_decoded)
      clr_int_reg_52_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_52_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_52_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_52_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_52_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_52_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_52_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_52_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_52_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_52_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_52"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_53
reg clr_int_reg_53_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_53_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_53_addr_decoded)
      clr_int_reg_53_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_53_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_53_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_53_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_53_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_53_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_53_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_53_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_53_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_53_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_53"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_54
reg clr_int_reg_54_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_54_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_54_addr_decoded)
      clr_int_reg_54_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_54_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_54_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_54_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_54_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_54_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_54_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_54_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_54_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_54_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_54"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_55
reg clr_int_reg_55_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_55_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_55_addr_decoded)
      clr_int_reg_55_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_55_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_55_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_55_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_55_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_55_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_55_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_55_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_55_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_55_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_55"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_56
reg clr_int_reg_56_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_56_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_56_addr_decoded)
      clr_int_reg_56_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_56_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_56_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_56_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_56_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_56_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_56_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_56_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_56_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_56_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_56"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_57
reg clr_int_reg_57_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_57_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_57_addr_decoded)
      clr_int_reg_57_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_57_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_57_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_57_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_57_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_57_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_57_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_57_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_57_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_57_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_57"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_58
reg clr_int_reg_58_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_58_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_58_addr_decoded)
      clr_int_reg_58_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_58_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_58_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_58_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_58_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_58_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_58_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_58_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_58_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_58_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_58"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_59
reg clr_int_reg_59_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_59_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_59_addr_decoded)
      clr_int_reg_59_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_59_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_59_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_59_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_59_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_59_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_59_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_59_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_59_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_59_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_59"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_62
reg clr_int_reg_62_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_62_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_62_addr_decoded)
      clr_int_reg_62_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_62_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_62_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_62_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_62_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_62_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_62_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_62_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_62_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_62_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_62"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: clr_int_reg_63
reg clr_int_reg_63_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         clr_int_reg_63_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~clr_int_reg_63_addr_decoded)
      clr_int_reg_63_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              clr_int_reg_63_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              clr_int_reg_63_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              clr_int_reg_63_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              clr_int_reg_63_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              clr_int_reg_63_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              clr_int_reg_63_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              clr_int_reg_63_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              clr_int_reg_63_acc_vio = 1'b0;

          default: 
             begin
                clr_int_reg_63_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_clr_int_reg_63"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_retry_timer
reg interrupt_retry_timer_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_retry_timer_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_retry_timer_addr_decoded)
      interrupt_retry_timer_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_retry_timer_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_retry_timer_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_retry_timer_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_retry_timer_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_retry_timer_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_retry_timer_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_retry_timer_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_retry_timer_acc_vio = 1'b0;

          default: 
             begin
                interrupt_retry_timer_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_retry_timer"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_state_status_1
reg interrupt_state_status_1_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_state_status_1_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_state_status_1_addr_decoded)
      interrupt_state_status_1_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_state_status_1_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_state_status_1_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_state_status_1_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_state_status_1_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_state_status_1_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_state_status_1_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_state_status_1_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_state_status_1_acc_vio = 1'b0;

          default: 
             begin
                interrupt_state_status_1_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_state_status_1"); `endif
                    // synopsys translate_on
                    // vlint flag_system_call on
                end // end of tbcall_region
             end
      endcase
  end
//----- reg_acc_vio: interrupt_state_status_2
reg interrupt_state_status_2_acc_vio;
always @(csrbus_src_bus or daemon_csrbus_wr or
         interrupt_state_status_2_addr_decoded or
         daemon_transaction_in_progress)
  begin
    if (daemon_transaction_in_progress | ~interrupt_state_status_2_addr_decoded)
      interrupt_state_status_2_acc_vio = 1'b0;
    else
      case ({csrbus_src_bus, daemon_csrbus_wr})
        // reads
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b0}:
              interrupt_state_status_2_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b0}:
              interrupt_state_status_2_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b0}:
              interrupt_state_status_2_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b0}:
              interrupt_state_status_2_acc_vio = 1'b0;
        // writes
          {`FIRE_CSRBUS_SRC_BUS_ENC_JTAG, 1'b1}:
              interrupt_state_status_2_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_SLOW, 1'b1}:
              interrupt_state_status_2_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_MED, 1'b1}:
              interrupt_state_status_2_acc_vio = 1'b0;
          {`FIRE_CSRBUS_SRC_BUS_ENC_PIO_FAST, 1'b1}:
              interrupt_state_status_2_acc_vio = 1'b0;

          default: 
             begin
                interrupt_state_status_2_acc_vio = 1'b0;
                begin // axis tbcall_region
                      // vlint flag_system_call off
                      // synopsys translate_off
`ifdef PR_ERROR if ($time > 1 && rst_l) `PR_ERROR("dmu_imu_iss_addr_decode",`MON_ERROR,"acc_vio: default case of dmu_imu_iss_csr_a_interrupt_state_status_2"); `endif
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
                                  interrupt_mapping_20_addr_decoded |
                                  interrupt_mapping_21_addr_decoded |
                                  interrupt_mapping_22_addr_decoded |
                                  interrupt_mapping_23_addr_decoded |
                                  interrupt_mapping_24_addr_decoded |
                                  interrupt_mapping_25_addr_decoded |
                                  interrupt_mapping_26_addr_decoded |
                                  interrupt_mapping_27_addr_decoded |
                                  interrupt_mapping_28_addr_decoded |
                                  interrupt_mapping_29_addr_decoded |
                                  interrupt_mapping_30_addr_decoded |
                                  interrupt_mapping_31_addr_decoded |
                                  interrupt_mapping_32_addr_decoded |
                                  interrupt_mapping_33_addr_decoded |
                                  interrupt_mapping_34_addr_decoded |
                                  interrupt_mapping_35_addr_decoded |
                                  interrupt_mapping_36_addr_decoded |
                                  interrupt_mapping_37_addr_decoded |
                                  interrupt_mapping_38_addr_decoded |
                                  interrupt_mapping_39_addr_decoded |
                                  interrupt_mapping_40_addr_decoded |
                                  interrupt_mapping_41_addr_decoded |
                                  interrupt_mapping_42_addr_decoded |
                                  interrupt_mapping_43_addr_decoded |
                                  interrupt_mapping_44_addr_decoded |
                                  interrupt_mapping_45_addr_decoded |
                                  interrupt_mapping_46_addr_decoded |
                                  interrupt_mapping_47_addr_decoded |
                                  interrupt_mapping_48_addr_decoded |
                                  interrupt_mapping_49_addr_decoded |
                                  interrupt_mapping_50_addr_decoded |
                                  interrupt_mapping_51_addr_decoded |
                                  interrupt_mapping_52_addr_decoded |
                                  interrupt_mapping_53_addr_decoded |
                                  interrupt_mapping_54_addr_decoded |
                                  interrupt_mapping_55_addr_decoded |
                                  interrupt_mapping_56_addr_decoded |
                                  interrupt_mapping_57_addr_decoded |
                                  interrupt_mapping_58_addr_decoded |
                                  interrupt_mapping_59_addr_decoded |
                                  interrupt_mapping_62_addr_decoded |
                                  interrupt_mapping_63_addr_decoded |
                                  clr_int_reg_20_addr_decoded |
                                  clr_int_reg_21_addr_decoded |
                                  clr_int_reg_22_addr_decoded |
                                  clr_int_reg_23_addr_decoded |
                                  clr_int_reg_24_addr_decoded |
                                  clr_int_reg_25_addr_decoded |
                                  clr_int_reg_26_addr_decoded |
                                  clr_int_reg_27_addr_decoded |
                                  clr_int_reg_28_addr_decoded |
                                  clr_int_reg_29_addr_decoded |
                                  clr_int_reg_30_addr_decoded |
                                  clr_int_reg_31_addr_decoded |
                                  clr_int_reg_32_addr_decoded |
                                  clr_int_reg_33_addr_decoded |
                                  clr_int_reg_34_addr_decoded |
                                  clr_int_reg_35_addr_decoded |
                                  clr_int_reg_36_addr_decoded |
                                  clr_int_reg_37_addr_decoded |
                                  clr_int_reg_38_addr_decoded |
                                  clr_int_reg_39_addr_decoded |
                                  clr_int_reg_40_addr_decoded |
                                  clr_int_reg_41_addr_decoded |
                                  clr_int_reg_42_addr_decoded |
                                  clr_int_reg_43_addr_decoded |
                                  clr_int_reg_44_addr_decoded |
                                  clr_int_reg_45_addr_decoded |
                                  clr_int_reg_46_addr_decoded |
                                  clr_int_reg_47_addr_decoded |
                                  clr_int_reg_48_addr_decoded |
                                  clr_int_reg_49_addr_decoded |
                                  clr_int_reg_50_addr_decoded |
                                  clr_int_reg_51_addr_decoded |
                                  clr_int_reg_52_addr_decoded |
                                  clr_int_reg_53_addr_decoded |
                                  clr_int_reg_54_addr_decoded |
                                  clr_int_reg_55_addr_decoded |
                                  clr_int_reg_56_addr_decoded |
                                  clr_int_reg_57_addr_decoded |
                                  clr_int_reg_58_addr_decoded |
                                  clr_int_reg_59_addr_decoded |
                                  clr_int_reg_62_addr_decoded |
                                  clr_int_reg_63_addr_decoded |
                                  interrupt_retry_timer_addr_decoded |
                                  interrupt_state_status_1_addr_decoded |
                                  interrupt_state_status_2_addr_decoded
                                );


// daemon_csrbus_mapped gets asserted after fixed number of cycles
// after daemon_csrbus_valid become high
/* 0in assert_together -name mapped_after_valid
       -leader $0in_rising_edge($0in_delay(daemon_csrbus_valid, 1))
       -follower $0in_rising_edge(daemon_csrbus_mapped)
       -message ("daemon_csrbus_mapped was not asserted 1 clock cycles from csrbus_valid")
       -module dmu_imu_iss_addr_decode
       -clock clk
       -active $0in_rising_edge(daemon_csrbus_mapped)
*/

// daemon_csrbus_mapped is a pulse
/* 0in assert_timer -name daemon_csrbus_mapped_pulse
       -var daemon_csrbus_mapped -max 1
       -message "daemon_csrbus_mapped pulse length is not 1"
       -module dmu_imu_iss_addr_decode
       -clock clk
*/
//----- OUTPUT: csrbus_acc_vio
assign csrbus_acc_vio = clocked_valid_pulse &
                        interrupt_mapping_20_acc_vio |
                        interrupt_mapping_21_acc_vio |
                        interrupt_mapping_22_acc_vio |
                        interrupt_mapping_23_acc_vio |
                        interrupt_mapping_24_acc_vio |
                        interrupt_mapping_25_acc_vio |
                        interrupt_mapping_26_acc_vio |
                        interrupt_mapping_27_acc_vio |
                        interrupt_mapping_28_acc_vio |
                        interrupt_mapping_29_acc_vio |
                        interrupt_mapping_30_acc_vio |
                        interrupt_mapping_31_acc_vio |
                        interrupt_mapping_32_acc_vio |
                        interrupt_mapping_33_acc_vio |
                        interrupt_mapping_34_acc_vio |
                        interrupt_mapping_35_acc_vio |
                        interrupt_mapping_36_acc_vio |
                        interrupt_mapping_37_acc_vio |
                        interrupt_mapping_38_acc_vio |
                        interrupt_mapping_39_acc_vio |
                        interrupt_mapping_40_acc_vio |
                        interrupt_mapping_41_acc_vio |
                        interrupt_mapping_42_acc_vio |
                        interrupt_mapping_43_acc_vio |
                        interrupt_mapping_44_acc_vio |
                        interrupt_mapping_45_acc_vio |
                        interrupt_mapping_46_acc_vio |
                        interrupt_mapping_47_acc_vio |
                        interrupt_mapping_48_acc_vio |
                        interrupt_mapping_49_acc_vio |
                        interrupt_mapping_50_acc_vio |
                        interrupt_mapping_51_acc_vio |
                        interrupt_mapping_52_acc_vio |
                        interrupt_mapping_53_acc_vio |
                        interrupt_mapping_54_acc_vio |
                        interrupt_mapping_55_acc_vio |
                        interrupt_mapping_56_acc_vio |
                        interrupt_mapping_57_acc_vio |
                        interrupt_mapping_58_acc_vio |
                        interrupt_mapping_59_acc_vio |
                        interrupt_mapping_62_acc_vio |
                        interrupt_mapping_63_acc_vio |
                        clr_int_reg_20_acc_vio |
                        clr_int_reg_21_acc_vio |
                        clr_int_reg_22_acc_vio |
                        clr_int_reg_23_acc_vio |
                        clr_int_reg_24_acc_vio |
                        clr_int_reg_25_acc_vio |
                        clr_int_reg_26_acc_vio |
                        clr_int_reg_27_acc_vio |
                        clr_int_reg_28_acc_vio |
                        clr_int_reg_29_acc_vio |
                        clr_int_reg_30_acc_vio |
                        clr_int_reg_31_acc_vio |
                        clr_int_reg_32_acc_vio |
                        clr_int_reg_33_acc_vio |
                        clr_int_reg_34_acc_vio |
                        clr_int_reg_35_acc_vio |
                        clr_int_reg_36_acc_vio |
                        clr_int_reg_37_acc_vio |
                        clr_int_reg_38_acc_vio |
                        clr_int_reg_39_acc_vio |
                        clr_int_reg_40_acc_vio |
                        clr_int_reg_41_acc_vio |
                        clr_int_reg_42_acc_vio |
                        clr_int_reg_43_acc_vio |
                        clr_int_reg_44_acc_vio |
                        clr_int_reg_45_acc_vio |
                        clr_int_reg_46_acc_vio |
                        clr_int_reg_47_acc_vio |
                        clr_int_reg_48_acc_vio |
                        clr_int_reg_49_acc_vio |
                        clr_int_reg_50_acc_vio |
                        clr_int_reg_51_acc_vio |
                        clr_int_reg_52_acc_vio |
                        clr_int_reg_53_acc_vio |
                        clr_int_reg_54_acc_vio |
                        clr_int_reg_55_acc_vio |
                        clr_int_reg_56_acc_vio |
                        clr_int_reg_57_acc_vio |
                        clr_int_reg_58_acc_vio |
                        clr_int_reg_59_acc_vio |
                        clr_int_reg_62_acc_vio |
                        clr_int_reg_63_acc_vio |
                        interrupt_retry_timer_acc_vio |
                        interrupt_state_status_1_acc_vio |
                        interrupt_state_status_2_acc_vio;

//====================================================================
//    Select
//====================================================================
always @(posedge clk)
  begin
     if(~rst_l)
       begin
          interrupt_mapping_20_select_pulse <= 1'b0;
          interrupt_mapping_21_select_pulse <= 1'b0;
          interrupt_mapping_22_select_pulse <= 1'b0;
          interrupt_mapping_23_select_pulse <= 1'b0;
          interrupt_mapping_24_select_pulse <= 1'b0;
          interrupt_mapping_25_select_pulse <= 1'b0;
          interrupt_mapping_26_select_pulse <= 1'b0;
          interrupt_mapping_27_select_pulse <= 1'b0;
          interrupt_mapping_28_select_pulse <= 1'b0;
          interrupt_mapping_29_select_pulse <= 1'b0;
          interrupt_mapping_30_select_pulse <= 1'b0;
          interrupt_mapping_31_select_pulse <= 1'b0;
          interrupt_mapping_32_select_pulse <= 1'b0;
          interrupt_mapping_33_select_pulse <= 1'b0;
          interrupt_mapping_34_select_pulse <= 1'b0;
          interrupt_mapping_35_select_pulse <= 1'b0;
          interrupt_mapping_36_select_pulse <= 1'b0;
          interrupt_mapping_37_select_pulse <= 1'b0;
          interrupt_mapping_38_select_pulse <= 1'b0;
          interrupt_mapping_39_select_pulse <= 1'b0;
          interrupt_mapping_40_select_pulse <= 1'b0;
          interrupt_mapping_41_select_pulse <= 1'b0;
          interrupt_mapping_42_select_pulse <= 1'b0;
          interrupt_mapping_43_select_pulse <= 1'b0;
          interrupt_mapping_44_select_pulse <= 1'b0;
          interrupt_mapping_45_select_pulse <= 1'b0;
          interrupt_mapping_46_select_pulse <= 1'b0;
          interrupt_mapping_47_select_pulse <= 1'b0;
          interrupt_mapping_48_select_pulse <= 1'b0;
          interrupt_mapping_49_select_pulse <= 1'b0;
          interrupt_mapping_50_select_pulse <= 1'b0;
          interrupt_mapping_51_select_pulse <= 1'b0;
          interrupt_mapping_52_select_pulse <= 1'b0;
          interrupt_mapping_53_select_pulse <= 1'b0;
          interrupt_mapping_54_select_pulse <= 1'b0;
          interrupt_mapping_55_select_pulse <= 1'b0;
          interrupt_mapping_56_select_pulse <= 1'b0;
          interrupt_mapping_57_select_pulse <= 1'b0;
          interrupt_mapping_58_select_pulse <= 1'b0;
          interrupt_mapping_59_select_pulse <= 1'b0;
          interrupt_mapping_62_select_pulse <= 1'b0;
          interrupt_mapping_63_select_pulse <= 1'b0;
          clr_int_reg_20_select <= 1'b0;
          clr_int_reg_21_select <= 1'b0;
          clr_int_reg_22_select <= 1'b0;
          clr_int_reg_23_select <= 1'b0;
          clr_int_reg_24_select <= 1'b0;
          clr_int_reg_25_select <= 1'b0;
          clr_int_reg_26_select <= 1'b0;
          clr_int_reg_27_select <= 1'b0;
          clr_int_reg_28_select <= 1'b0;
          clr_int_reg_29_select <= 1'b0;
          clr_int_reg_30_select <= 1'b0;
          clr_int_reg_31_select <= 1'b0;
          clr_int_reg_32_select <= 1'b0;
          clr_int_reg_33_select <= 1'b0;
          clr_int_reg_34_select <= 1'b0;
          clr_int_reg_35_select <= 1'b0;
          clr_int_reg_36_select <= 1'b0;
          clr_int_reg_37_select <= 1'b0;
          clr_int_reg_38_select <= 1'b0;
          clr_int_reg_39_select <= 1'b0;
          clr_int_reg_40_select <= 1'b0;
          clr_int_reg_41_select <= 1'b0;
          clr_int_reg_42_select <= 1'b0;
          clr_int_reg_43_select <= 1'b0;
          clr_int_reg_44_select <= 1'b0;
          clr_int_reg_45_select <= 1'b0;
          clr_int_reg_46_select <= 1'b0;
          clr_int_reg_47_select <= 1'b0;
          clr_int_reg_48_select <= 1'b0;
          clr_int_reg_49_select <= 1'b0;
          clr_int_reg_50_select <= 1'b0;
          clr_int_reg_51_select <= 1'b0;
          clr_int_reg_52_select <= 1'b0;
          clr_int_reg_53_select <= 1'b0;
          clr_int_reg_54_select <= 1'b0;
          clr_int_reg_55_select <= 1'b0;
          clr_int_reg_56_select <= 1'b0;
          clr_int_reg_57_select <= 1'b0;
          clr_int_reg_58_select <= 1'b0;
          clr_int_reg_59_select <= 1'b0;
          clr_int_reg_62_select <= 1'b0;
          clr_int_reg_63_select <= 1'b0;
          interrupt_retry_timer_select_pulse <= 1'b0;
          interrupt_state_status_1_select <= 1'b0;
          interrupt_state_status_2_select <= 1'b0;
       end
     else
       begin
          interrupt_mapping_20_select_pulse <=
         ~interrupt_mapping_20_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_20_addr_decoded;

          interrupt_mapping_21_select_pulse <=
         ~interrupt_mapping_21_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_21_addr_decoded;

          interrupt_mapping_22_select_pulse <=
         ~interrupt_mapping_22_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_22_addr_decoded;

          interrupt_mapping_23_select_pulse <=
         ~interrupt_mapping_23_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_23_addr_decoded;

          interrupt_mapping_24_select_pulse <=
         ~interrupt_mapping_24_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_24_addr_decoded;

          interrupt_mapping_25_select_pulse <=
         ~interrupt_mapping_25_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_25_addr_decoded;

          interrupt_mapping_26_select_pulse <=
         ~interrupt_mapping_26_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_26_addr_decoded;

          interrupt_mapping_27_select_pulse <=
         ~interrupt_mapping_27_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_27_addr_decoded;

          interrupt_mapping_28_select_pulse <=
         ~interrupt_mapping_28_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_28_addr_decoded;

          interrupt_mapping_29_select_pulse <=
         ~interrupt_mapping_29_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_29_addr_decoded;

          interrupt_mapping_30_select_pulse <=
         ~interrupt_mapping_30_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_30_addr_decoded;

          interrupt_mapping_31_select_pulse <=
         ~interrupt_mapping_31_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_31_addr_decoded;

          interrupt_mapping_32_select_pulse <=
         ~interrupt_mapping_32_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_32_addr_decoded;

          interrupt_mapping_33_select_pulse <=
         ~interrupt_mapping_33_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_33_addr_decoded;

          interrupt_mapping_34_select_pulse <=
         ~interrupt_mapping_34_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_34_addr_decoded;

          interrupt_mapping_35_select_pulse <=
         ~interrupt_mapping_35_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_35_addr_decoded;

          interrupt_mapping_36_select_pulse <=
         ~interrupt_mapping_36_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_36_addr_decoded;

          interrupt_mapping_37_select_pulse <=
         ~interrupt_mapping_37_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_37_addr_decoded;

          interrupt_mapping_38_select_pulse <=
         ~interrupt_mapping_38_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_38_addr_decoded;

          interrupt_mapping_39_select_pulse <=
         ~interrupt_mapping_39_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_39_addr_decoded;

          interrupt_mapping_40_select_pulse <=
         ~interrupt_mapping_40_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_40_addr_decoded;

          interrupt_mapping_41_select_pulse <=
         ~interrupt_mapping_41_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_41_addr_decoded;

          interrupt_mapping_42_select_pulse <=
         ~interrupt_mapping_42_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_42_addr_decoded;

          interrupt_mapping_43_select_pulse <=
         ~interrupt_mapping_43_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_43_addr_decoded;

          interrupt_mapping_44_select_pulse <=
         ~interrupt_mapping_44_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_44_addr_decoded;

          interrupt_mapping_45_select_pulse <=
         ~interrupt_mapping_45_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_45_addr_decoded;

          interrupt_mapping_46_select_pulse <=
         ~interrupt_mapping_46_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_46_addr_decoded;

          interrupt_mapping_47_select_pulse <=
         ~interrupt_mapping_47_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_47_addr_decoded;

          interrupt_mapping_48_select_pulse <=
         ~interrupt_mapping_48_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_48_addr_decoded;

          interrupt_mapping_49_select_pulse <=
         ~interrupt_mapping_49_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_49_addr_decoded;

          interrupt_mapping_50_select_pulse <=
         ~interrupt_mapping_50_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_50_addr_decoded;

          interrupt_mapping_51_select_pulse <=
         ~interrupt_mapping_51_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_51_addr_decoded;

          interrupt_mapping_52_select_pulse <=
         ~interrupt_mapping_52_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_52_addr_decoded;

          interrupt_mapping_53_select_pulse <=
         ~interrupt_mapping_53_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_53_addr_decoded;

          interrupt_mapping_54_select_pulse <=
         ~interrupt_mapping_54_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_54_addr_decoded;

          interrupt_mapping_55_select_pulse <=
         ~interrupt_mapping_55_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_55_addr_decoded;

          interrupt_mapping_56_select_pulse <=
         ~interrupt_mapping_56_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_56_addr_decoded;

          interrupt_mapping_57_select_pulse <=
         ~interrupt_mapping_57_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_57_addr_decoded;

          interrupt_mapping_58_select_pulse <=
         ~interrupt_mapping_58_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_58_addr_decoded;

          interrupt_mapping_59_select_pulse <=
         ~interrupt_mapping_59_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_59_addr_decoded;

          interrupt_mapping_62_select_pulse <=
         ~interrupt_mapping_62_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_62_addr_decoded;

          interrupt_mapping_63_select_pulse <=
         ~interrupt_mapping_63_acc_vio &
         clocked_valid_pulse &
         interrupt_mapping_63_addr_decoded;

          clr_int_reg_20_select <=
         ~clr_int_reg_20_acc_vio &
         clr_int_reg_20_addr_decoded;

          clr_int_reg_21_select <=
         ~clr_int_reg_21_acc_vio &
         clr_int_reg_21_addr_decoded;

          clr_int_reg_22_select <=
         ~clr_int_reg_22_acc_vio &
         clr_int_reg_22_addr_decoded;

          clr_int_reg_23_select <=
         ~clr_int_reg_23_acc_vio &
         clr_int_reg_23_addr_decoded;

          clr_int_reg_24_select <=
         ~clr_int_reg_24_acc_vio &
         clr_int_reg_24_addr_decoded;

          clr_int_reg_25_select <=
         ~clr_int_reg_25_acc_vio &
         clr_int_reg_25_addr_decoded;

          clr_int_reg_26_select <=
         ~clr_int_reg_26_acc_vio &
         clr_int_reg_26_addr_decoded;

          clr_int_reg_27_select <=
         ~clr_int_reg_27_acc_vio &
         clr_int_reg_27_addr_decoded;

          clr_int_reg_28_select <=
         ~clr_int_reg_28_acc_vio &
         clr_int_reg_28_addr_decoded;

          clr_int_reg_29_select <=
         ~clr_int_reg_29_acc_vio &
         clr_int_reg_29_addr_decoded;

          clr_int_reg_30_select <=
         ~clr_int_reg_30_acc_vio &
         clr_int_reg_30_addr_decoded;

          clr_int_reg_31_select <=
         ~clr_int_reg_31_acc_vio &
         clr_int_reg_31_addr_decoded;

          clr_int_reg_32_select <=
         ~clr_int_reg_32_acc_vio &
         clr_int_reg_32_addr_decoded;

          clr_int_reg_33_select <=
         ~clr_int_reg_33_acc_vio &
         clr_int_reg_33_addr_decoded;

          clr_int_reg_34_select <=
         ~clr_int_reg_34_acc_vio &
         clr_int_reg_34_addr_decoded;

          clr_int_reg_35_select <=
         ~clr_int_reg_35_acc_vio &
         clr_int_reg_35_addr_decoded;

          clr_int_reg_36_select <=
         ~clr_int_reg_36_acc_vio &
         clr_int_reg_36_addr_decoded;

          clr_int_reg_37_select <=
         ~clr_int_reg_37_acc_vio &
         clr_int_reg_37_addr_decoded;

          clr_int_reg_38_select <=
         ~clr_int_reg_38_acc_vio &
         clr_int_reg_38_addr_decoded;

          clr_int_reg_39_select <=
         ~clr_int_reg_39_acc_vio &
         clr_int_reg_39_addr_decoded;

          clr_int_reg_40_select <=
         ~clr_int_reg_40_acc_vio &
         clr_int_reg_40_addr_decoded;

          clr_int_reg_41_select <=
         ~clr_int_reg_41_acc_vio &
         clr_int_reg_41_addr_decoded;

          clr_int_reg_42_select <=
         ~clr_int_reg_42_acc_vio &
         clr_int_reg_42_addr_decoded;

          clr_int_reg_43_select <=
         ~clr_int_reg_43_acc_vio &
         clr_int_reg_43_addr_decoded;

          clr_int_reg_44_select <=
         ~clr_int_reg_44_acc_vio &
         clr_int_reg_44_addr_decoded;

          clr_int_reg_45_select <=
         ~clr_int_reg_45_acc_vio &
         clr_int_reg_45_addr_decoded;

          clr_int_reg_46_select <=
         ~clr_int_reg_46_acc_vio &
         clr_int_reg_46_addr_decoded;

          clr_int_reg_47_select <=
         ~clr_int_reg_47_acc_vio &
         clr_int_reg_47_addr_decoded;

          clr_int_reg_48_select <=
         ~clr_int_reg_48_acc_vio &
         clr_int_reg_48_addr_decoded;

          clr_int_reg_49_select <=
         ~clr_int_reg_49_acc_vio &
         clr_int_reg_49_addr_decoded;

          clr_int_reg_50_select <=
         ~clr_int_reg_50_acc_vio &
         clr_int_reg_50_addr_decoded;

          clr_int_reg_51_select <=
         ~clr_int_reg_51_acc_vio &
         clr_int_reg_51_addr_decoded;

          clr_int_reg_52_select <=
         ~clr_int_reg_52_acc_vio &
         clr_int_reg_52_addr_decoded;

          clr_int_reg_53_select <=
         ~clr_int_reg_53_acc_vio &
         clr_int_reg_53_addr_decoded;

          clr_int_reg_54_select <=
         ~clr_int_reg_54_acc_vio &
         clr_int_reg_54_addr_decoded;

          clr_int_reg_55_select <=
         ~clr_int_reg_55_acc_vio &
         clr_int_reg_55_addr_decoded;

          clr_int_reg_56_select <=
         ~clr_int_reg_56_acc_vio &
         clr_int_reg_56_addr_decoded;

          clr_int_reg_57_select <=
         ~clr_int_reg_57_acc_vio &
         clr_int_reg_57_addr_decoded;

          clr_int_reg_58_select <=
         ~clr_int_reg_58_acc_vio &
         clr_int_reg_58_addr_decoded;

          clr_int_reg_59_select <=
         ~clr_int_reg_59_acc_vio &
         clr_int_reg_59_addr_decoded;

          clr_int_reg_62_select <=
         ~clr_int_reg_62_acc_vio &
         clr_int_reg_62_addr_decoded;

          clr_int_reg_63_select <=
         ~clr_int_reg_63_acc_vio &
         clr_int_reg_63_addr_decoded;

          interrupt_retry_timer_select_pulse <=
         ~interrupt_retry_timer_acc_vio &
         clocked_valid_pulse &
         interrupt_retry_timer_addr_decoded;

          interrupt_state_status_1_select <=
         ~interrupt_state_status_1_acc_vio &
         interrupt_state_status_1_addr_decoded;

          interrupt_state_status_2_select <=
         ~interrupt_state_status_2_acc_vio &
         interrupt_state_status_2_addr_decoded;

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
reg stage_2_daemon_csrbus_done_internal_0;

always @(posedge clk)
  begin
     if(~rst_l)
       begin
         stage_1_daemon_csrbus_done_internal_0 <= 1'b0;
       end
     else
       begin
         stage_1_daemon_csrbus_done_internal_0 <=
                 interrupt_mapping_20_select_pulse |
                 interrupt_mapping_21_select_pulse |
                 interrupt_mapping_22_select_pulse |
                 interrupt_mapping_23_select_pulse |
                 interrupt_mapping_24_select_pulse |
                 interrupt_mapping_25_select_pulse |
                 interrupt_mapping_26_select_pulse |
                 interrupt_mapping_27_select_pulse |
                 interrupt_mapping_28_select_pulse |
                 interrupt_mapping_29_select_pulse |
                 interrupt_mapping_30_select_pulse |
                 interrupt_mapping_31_select_pulse |
                 interrupt_mapping_32_select_pulse |
                 interrupt_mapping_33_select_pulse |
                 interrupt_mapping_34_select_pulse |
                 interrupt_mapping_35_select_pulse |
                 interrupt_mapping_36_select_pulse |
                 interrupt_mapping_37_select_pulse |
                 interrupt_mapping_38_select_pulse |
                 interrupt_mapping_39_select_pulse |
                 interrupt_mapping_40_select_pulse |
                 interrupt_mapping_41_select_pulse |
                 interrupt_mapping_42_select_pulse |
                 interrupt_mapping_43_select_pulse |
                 interrupt_mapping_44_select_pulse |
                 interrupt_mapping_45_select_pulse |
                 interrupt_mapping_46_select_pulse |
                 interrupt_mapping_47_select_pulse |
                 interrupt_mapping_48_select_pulse |
                 interrupt_mapping_49_select_pulse |
                 interrupt_mapping_50_select_pulse |
                 interrupt_mapping_51_select_pulse |
                 interrupt_mapping_52_select_pulse |
                 interrupt_mapping_53_select_pulse |
                 interrupt_mapping_54_select_pulse |
                 interrupt_mapping_55_select_pulse |
                 interrupt_mapping_56_select_pulse |
                 interrupt_mapping_57_select_pulse |
                 interrupt_mapping_58_select_pulse |
                 interrupt_mapping_59_select_pulse |
                 interrupt_mapping_62_select_pulse |
                 interrupt_mapping_63_select_pulse |
                 interrupt_retry_timer_select_pulse |
                 clr_int_reg_20_select & clocked_valid_pulse |
                 clr_int_reg_21_select & clocked_valid_pulse |
                 clr_int_reg_22_select & clocked_valid_pulse |
                 clr_int_reg_23_select & clocked_valid_pulse |
                 clr_int_reg_24_select & clocked_valid_pulse |
                 clr_int_reg_25_select & clocked_valid_pulse |
                 clr_int_reg_26_select & clocked_valid_pulse |
                 clr_int_reg_27_select & clocked_valid_pulse |
                 clr_int_reg_28_select & clocked_valid_pulse |
                 clr_int_reg_29_select & clocked_valid_pulse |
                 clr_int_reg_30_select & clocked_valid_pulse |
                 clr_int_reg_31_select & clocked_valid_pulse |
                 clr_int_reg_32_select & clocked_valid_pulse |
                 clr_int_reg_33_select & clocked_valid_pulse |
                 clr_int_reg_34_select & clocked_valid_pulse |
                 clr_int_reg_35_select & clocked_valid_pulse |
                 clr_int_reg_36_select & clocked_valid_pulse |
                 clr_int_reg_37_select & clocked_valid_pulse |
                 clr_int_reg_38_select & clocked_valid_pulse |
                 clr_int_reg_39_select & clocked_valid_pulse |
                 clr_int_reg_40_select & clocked_valid_pulse |
                 clr_int_reg_41_select & clocked_valid_pulse |
                 clr_int_reg_42_select & clocked_valid_pulse |
                 clr_int_reg_43_select & clocked_valid_pulse |
                 clr_int_reg_44_select & clocked_valid_pulse |
                 clr_int_reg_45_select & clocked_valid_pulse |
                 clr_int_reg_46_select & clocked_valid_pulse |
                 clr_int_reg_47_select & clocked_valid_pulse |
                 clr_int_reg_48_select & clocked_valid_pulse |
                 clr_int_reg_49_select & clocked_valid_pulse |
                 clr_int_reg_50_select & clocked_valid_pulse |
                 clr_int_reg_51_select & clocked_valid_pulse |
                 clr_int_reg_52_select & clocked_valid_pulse |
                 clr_int_reg_53_select & clocked_valid_pulse |
                 clr_int_reg_54_select & clocked_valid_pulse |
                 clr_int_reg_55_select & clocked_valid_pulse |
                 clr_int_reg_56_select & clocked_valid_pulse |
                 clr_int_reg_57_select & clocked_valid_pulse |
                 clr_int_reg_58_select & clocked_valid_pulse |
                 clr_int_reg_59_select & clocked_valid_pulse |
                 clr_int_reg_62_select & clocked_valid_pulse |
                 clr_int_reg_63_select & clocked_valid_pulse |
                 interrupt_state_status_1_select & clocked_valid_pulse |
                 interrupt_state_status_2_select & clocked_valid_pulse;
       end
     if(~rst_l)
       begin
         stage_2_daemon_csrbus_done_internal_0 <= 1'b0;
       end
     else
       begin
         stage_2_daemon_csrbus_done_internal_0 <=
                 stage_1_daemon_csrbus_done_internal_0;
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
       -module dmu_imu_iss_addr_decode
       -clock clk
*/

// daemon_csrbus_done is a pulse
/* 0in assert_timer -name daemon_csrbus_done_pulse
       -var daemon_csrbus_done -max 1
       -message "csrbus_done pulse length is not 1"
       -module dmu_imu_iss_addr_decode
       -clock clk
*/

endmodule // dmu_imu_iss_addr_decode
