// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_rds_msi_stage_mux_only.v
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
module dmu_imu_rds_msi_stage_mux_only 
	(
	clk,
	read_data_0,
	msi_mapping_select,
	msi_mapping_select_out,
	msi_clear_reg_select,
	msi_clear_reg_select_out,
	int_mondo_data_0_reg_select_pulse,
	int_mondo_data_0_reg_select_pulse_out,
	int_mondo_data_1_reg_select_pulse,
	int_mondo_data_1_reg_select_pulse_out,
	daemon_csrbus_wr_in,
	daemon_csrbus_wr_out,
	daemon_csrbus_wr_data_in,
	daemon_csrbus_wr_data_out,
	ext_addr_in,
	ext_addr_out,
	read_data_0_out,
	rst_l,
	rst_l_out
	);

//====================================================
//     Polarity declarations
//====================================================
input  clk;  // Clock signal
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0;  // Read Data
input  msi_mapping_select;  // select
output msi_mapping_select_out;  // select
input  msi_clear_reg_select;  // select
output msi_clear_reg_select_out;  // select
input  int_mondo_data_0_reg_select_pulse;  // select
output int_mondo_data_0_reg_select_pulse_out;  // select
input  int_mondo_data_1_reg_select_pulse;  // select
output int_mondo_data_1_reg_select_pulse_out;  // select
input  daemon_csrbus_wr_in;  // csrbus_wr
output daemon_csrbus_wr_out;  // csrbus_wr
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
output [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_out;  // SW write
                                                                 // data
input  [7:0] ext_addr_in;  // Ext addr
output [7:0] ext_addr_out;  // Ext addr
output [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data
input  rst_l;  // HW reset
output rst_l_out;  // HW reset

//====================================================
//     Type declarations
//====================================================
wire clk;  // Clock signal
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0;  // Read Data
wire msi_mapping_select;  // select
wire msi_mapping_select_out;  // select
wire msi_clear_reg_select;  // select
wire msi_clear_reg_select_out;  // select
wire int_mondo_data_0_reg_select_pulse;  // select
wire int_mondo_data_0_reg_select_pulse_out;  // select
wire int_mondo_data_1_reg_select_pulse;  // select
wire int_mondo_data_1_reg_select_pulse_out;  // select
wire daemon_csrbus_wr_in;  // csrbus_wr
wire daemon_csrbus_wr_out;  // csrbus_wr
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_out;  // SW write data
wire [7:0] ext_addr_in;  // Ext addr
wire [7:0] ext_addr_out;  // Ext addr
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data
wire rst_l;  // HW reset
wire rst_l_out;  // HW reset


//====================================================
//     Assignments only
//====================================================
assign msi_mapping_select_out = msi_mapping_select;
assign msi_clear_reg_select_out = msi_clear_reg_select;
assign int_mondo_data_0_reg_select_pulse_out = int_mondo_data_0_reg_select_pulse;
assign int_mondo_data_1_reg_select_pulse_out = int_mondo_data_1_reg_select_pulse;
assign rst_l_out = rst_l;
assign daemon_csrbus_wr_out      = daemon_csrbus_wr_in;
assign daemon_csrbus_wr_data_out = daemon_csrbus_wr_data_in;
assign ext_addr_out = ext_addr_in;


//=====================================================
//      OUTPUT: read_data_out
//=====================================================
dmu_imu_rds_msi_csrpipe_1 dmu_imu_rds_msi_csrpipe_1_inst_1
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.reg_in	(1'b0),
	.reg_out	(1'b0),
	.data0	(read_data_0),
	.sel0	(1'b1),
	.out	(read_data_0_out)
	);

endmodule // dmu_imu_rds_msi_stage_mux_only
