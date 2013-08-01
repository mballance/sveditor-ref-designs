// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_ics_stage_mux_only.v
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
module dmu_imu_ics_stage_mux_only 
	(
	clk,
	read_data_0,
	imu_error_log_en_reg_select_pulse,
	imu_error_log_en_reg_select_pulse_out,
	imu_int_en_reg_select_pulse,
	imu_int_en_reg_select_pulse_out,
	imu_enabled_error_status_reg_select,
	imu_enabled_error_status_reg_select_out,
	imu_logged_error_status_reg_select_pulse,
	imu_logged_error_status_reg_select_pulse_out,
	imu_rds_error_log_reg_select_pulse,
	imu_rds_error_log_reg_select_pulse_out,
	imu_scs_error_log_reg_select_pulse,
	imu_scs_error_log_reg_select_pulse_out,
	imu_eqs_error_log_reg_select_pulse,
	imu_eqs_error_log_reg_select_pulse_out,
	dmc_interrupt_mask_reg_select_pulse,
	dmc_interrupt_mask_reg_select_pulse_out,
	dmc_interrupt_status_reg_select,
	dmc_interrupt_status_reg_select_out,
	imu_perf_cntrl_select_pulse,
	imu_perf_cntrl_select_pulse_out,
	imu_perf_cnt0_select_pulse,
	imu_perf_cnt0_select_pulse_out,
	imu_perf_cnt1_select_pulse,
	imu_perf_cnt1_select_pulse_out,
	msi_32_addr_reg_select_pulse,
	msi_32_addr_reg_select_pulse_out,
	msi_64_addr_reg_select_pulse,
	msi_64_addr_reg_select_pulse_out,
	mem_64_pcie_offset_reg_select_pulse,
	mem_64_pcie_offset_reg_select_pulse_out,
	imu_logged_error_status_reg_rw1c_alias,
	imu_logged_error_status_reg_rw1c_alias_out,
	imu_logged_error_status_reg_rw1s_alias,
	imu_logged_error_status_reg_rw1s_alias_out,
	daemon_csrbus_wr_in,
	daemon_csrbus_wr_out,
	daemon_csrbus_wr_data_in,
	daemon_csrbus_wr_data_out,
	read_data_0_out,
	rst_l,
	rst_l_out,
	por_l,
	por_l_out
	);

//====================================================
//     Polarity declarations
//====================================================
input  clk;  // Clock signal
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0;  // Read Data
input  imu_error_log_en_reg_select_pulse;  // select
output imu_error_log_en_reg_select_pulse_out;  // select
input  imu_int_en_reg_select_pulse;  // select
output imu_int_en_reg_select_pulse_out;  // select
input  imu_enabled_error_status_reg_select;  // select
output imu_enabled_error_status_reg_select_out;  // select
input  imu_logged_error_status_reg_select_pulse;  // select
output imu_logged_error_status_reg_select_pulse_out;  // select
input  imu_rds_error_log_reg_select_pulse;  // select
output imu_rds_error_log_reg_select_pulse_out;  // select
input  imu_scs_error_log_reg_select_pulse;  // select
output imu_scs_error_log_reg_select_pulse_out;  // select
input  imu_eqs_error_log_reg_select_pulse;  // select
output imu_eqs_error_log_reg_select_pulse_out;  // select
input  dmc_interrupt_mask_reg_select_pulse;  // select
output dmc_interrupt_mask_reg_select_pulse_out;  // select
input  dmc_interrupt_status_reg_select;  // select
output dmc_interrupt_status_reg_select_out;  // select
input  imu_perf_cntrl_select_pulse;  // select
output imu_perf_cntrl_select_pulse_out;  // select
input  imu_perf_cnt0_select_pulse;  // select
output imu_perf_cnt0_select_pulse_out;  // select
input  imu_perf_cnt1_select_pulse;  // select
output imu_perf_cnt1_select_pulse_out;  // select
input  msi_32_addr_reg_select_pulse;  // select
output msi_32_addr_reg_select_pulse_out;  // select
input  msi_64_addr_reg_select_pulse;  // select
output msi_64_addr_reg_select_pulse_out;  // select
input  mem_64_pcie_offset_reg_select_pulse;  // select
output mem_64_pcie_offset_reg_select_pulse_out;  // select
input  imu_logged_error_status_reg_rw1c_alias;  // SW load
output imu_logged_error_status_reg_rw1c_alias_out;  // alias
input  imu_logged_error_status_reg_rw1s_alias;  // SW load
output imu_logged_error_status_reg_rw1s_alias_out;  // alias
input  daemon_csrbus_wr_in;  // csrbus_wr
output daemon_csrbus_wr_out;  // csrbus_wr
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
output [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_out;  // SW write
                                                                 // data
output [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data
input  rst_l;  // HW reset
output rst_l_out;  // HW reset
input  por_l;  // HW reset
output por_l_out;  // HW reset

//====================================================
//     Type declarations
//====================================================
wire clk;  // Clock signal
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0;  // Read Data
wire imu_error_log_en_reg_select_pulse;  // select
wire imu_error_log_en_reg_select_pulse_out;  // select
wire imu_int_en_reg_select_pulse;  // select
wire imu_int_en_reg_select_pulse_out;  // select
wire imu_enabled_error_status_reg_select;  // select
wire imu_enabled_error_status_reg_select_out;  // select
wire imu_logged_error_status_reg_select_pulse;  // select
wire imu_logged_error_status_reg_select_pulse_out;  // select
wire imu_rds_error_log_reg_select_pulse;  // select
wire imu_rds_error_log_reg_select_pulse_out;  // select
wire imu_scs_error_log_reg_select_pulse;  // select
wire imu_scs_error_log_reg_select_pulse_out;  // select
wire imu_eqs_error_log_reg_select_pulse;  // select
wire imu_eqs_error_log_reg_select_pulse_out;  // select
wire dmc_interrupt_mask_reg_select_pulse;  // select
wire dmc_interrupt_mask_reg_select_pulse_out;  // select
wire dmc_interrupt_status_reg_select;  // select
wire dmc_interrupt_status_reg_select_out;  // select
wire imu_perf_cntrl_select_pulse;  // select
wire imu_perf_cntrl_select_pulse_out;  // select
wire imu_perf_cnt0_select_pulse;  // select
wire imu_perf_cnt0_select_pulse_out;  // select
wire imu_perf_cnt1_select_pulse;  // select
wire imu_perf_cnt1_select_pulse_out;  // select
wire msi_32_addr_reg_select_pulse;  // select
wire msi_32_addr_reg_select_pulse_out;  // select
wire msi_64_addr_reg_select_pulse;  // select
wire msi_64_addr_reg_select_pulse_out;  // select
wire mem_64_pcie_offset_reg_select_pulse;  // select
wire mem_64_pcie_offset_reg_select_pulse_out;  // select
wire imu_logged_error_status_reg_rw1c_alias;  // SW load
wire imu_logged_error_status_reg_rw1c_alias_out;  // alias
wire imu_logged_error_status_reg_rw1s_alias;  // SW load
wire imu_logged_error_status_reg_rw1s_alias_out;  // alias
wire daemon_csrbus_wr_in;  // csrbus_wr
wire daemon_csrbus_wr_out;  // csrbus_wr
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_out;  // SW write data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data
wire rst_l;  // HW reset
wire rst_l_out;  // HW reset
wire por_l;  // HW reset
wire por_l_out;  // HW reset


//====================================================
//     Assignments only
//====================================================
assign imu_error_log_en_reg_select_pulse_out = imu_error_log_en_reg_select_pulse;
assign imu_int_en_reg_select_pulse_out = imu_int_en_reg_select_pulse;
assign imu_enabled_error_status_reg_select_out = imu_enabled_error_status_reg_select;
assign imu_logged_error_status_reg_select_pulse_out = imu_logged_error_status_reg_select_pulse;
assign imu_rds_error_log_reg_select_pulse_out = imu_rds_error_log_reg_select_pulse;
assign imu_scs_error_log_reg_select_pulse_out = imu_scs_error_log_reg_select_pulse;
assign imu_eqs_error_log_reg_select_pulse_out = imu_eqs_error_log_reg_select_pulse;
assign dmc_interrupt_mask_reg_select_pulse_out = dmc_interrupt_mask_reg_select_pulse;
assign dmc_interrupt_status_reg_select_out = dmc_interrupt_status_reg_select;
assign imu_perf_cntrl_select_pulse_out = imu_perf_cntrl_select_pulse;
assign imu_perf_cnt0_select_pulse_out = imu_perf_cnt0_select_pulse;
assign imu_perf_cnt1_select_pulse_out = imu_perf_cnt1_select_pulse;
assign msi_32_addr_reg_select_pulse_out = msi_32_addr_reg_select_pulse;
assign msi_64_addr_reg_select_pulse_out = msi_64_addr_reg_select_pulse;
assign mem_64_pcie_offset_reg_select_pulse_out = mem_64_pcie_offset_reg_select_pulse;
assign imu_logged_error_status_reg_rw1c_alias_out = imu_logged_error_status_reg_rw1c_alias;
assign imu_logged_error_status_reg_rw1s_alias_out = imu_logged_error_status_reg_rw1s_alias;
assign rst_l_out = rst_l;
assign por_l_out = por_l;
assign daemon_csrbus_wr_out      = daemon_csrbus_wr_in;
assign daemon_csrbus_wr_data_out = daemon_csrbus_wr_data_in;


//=====================================================
//      OUTPUT: read_data_out
//=====================================================
dmu_imu_ics_csrpipe_5 dmu_imu_ics_csrpipe_5_inst_1
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

endmodule // dmu_imu_ics_stage_mux_only
