// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_cib_stage_mux_only.v
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
module dmu_ilu_cib_stage_mux_only
	(
	clk,
	read_data_0,
	read_data_1,
	ilu_log_en_select_pulse,
	ilu_log_en_select_pulse_out,
	ilu_int_en_select_pulse,
	ilu_int_en_select_pulse_out,
	ilu_en_err_select,
	ilu_en_err_select_out,
	ilu_log_err_select_pulse,
	ilu_log_err_select_pulse_out,
	pec_int_en_select_pulse,
	pec_int_en_select_pulse_out,
	pec_en_err_select,
	pec_en_err_select_out,
	ilu_diagnos_select_pulse,
	ilu_diagnos_select_pulse_out,
	ilu_log_err_rw1c_alias,
	ilu_log_err_rw1c_alias_out,
	ilu_log_err_rw1s_alias,
	ilu_log_err_rw1s_alias_out,
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
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_1;  // Read Data
input  ilu_log_en_select_pulse;  // select
output ilu_log_en_select_pulse_out;  // select
input  ilu_int_en_select_pulse;  // select
output ilu_int_en_select_pulse_out;  // select
input  ilu_en_err_select;  // select
output ilu_en_err_select_out;  // select
input  ilu_log_err_select_pulse;  // select
output ilu_log_err_select_pulse_out;  // select
input  pec_int_en_select_pulse;  // select
output pec_int_en_select_pulse_out;  // select
input  pec_en_err_select;  // select
output pec_en_err_select_out;  // select
input  ilu_diagnos_select_pulse;  // select
output ilu_diagnos_select_pulse_out;  // select
input  ilu_log_err_rw1c_alias;  // SW load
output ilu_log_err_rw1c_alias_out;  // alias
input  ilu_log_err_rw1s_alias;  // SW load
output ilu_log_err_rw1s_alias_out;  // alias
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
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_1;  // Read Data
wire ilu_log_en_select_pulse;  // select
wire ilu_log_en_select_pulse_out;  // select
wire ilu_int_en_select_pulse;  // select
wire ilu_int_en_select_pulse_out;  // select
wire ilu_en_err_select;  // select
wire ilu_en_err_select_out;  // select
wire ilu_log_err_select_pulse;  // select
wire ilu_log_err_select_pulse_out;  // select
wire pec_int_en_select_pulse;  // select
wire pec_int_en_select_pulse_out;  // select
wire pec_en_err_select;  // select
wire pec_en_err_select_out;  // select
wire ilu_diagnos_select_pulse;  // select
wire ilu_diagnos_select_pulse_out;  // select
wire ilu_log_err_rw1c_alias;  // SW load
wire ilu_log_err_rw1c_alias_out;  // alias
wire ilu_log_err_rw1s_alias;  // SW load
wire ilu_log_err_rw1s_alias_out;  // alias
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
assign ilu_log_en_select_pulse_out = ilu_log_en_select_pulse;
assign ilu_int_en_select_pulse_out = ilu_int_en_select_pulse;
assign ilu_en_err_select_out = ilu_en_err_select;
assign ilu_log_err_select_pulse_out = ilu_log_err_select_pulse;
assign pec_int_en_select_pulse_out = pec_int_en_select_pulse;
assign pec_en_err_select_out = pec_en_err_select;
assign ilu_diagnos_select_pulse_out = ilu_diagnos_select_pulse;
assign ilu_log_err_rw1c_alias_out = ilu_log_err_rw1c_alias;
assign ilu_log_err_rw1s_alias_out = ilu_log_err_rw1s_alias;
assign rst_l_out = rst_l;
assign por_l_out = por_l;
assign daemon_csrbus_wr_out      = daemon_csrbus_wr_in;
assign daemon_csrbus_wr_data_out = daemon_csrbus_wr_data_in;


//=====================================================
//      OUTPUT: read_data_out
//=====================================================
dmu_ilu_cib_csrpipe_5 dmu_ilu_cib_csrpipe_5_inst_1
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.reg_in	(1'b0),
	.reg_out	(1'b0),
	.data0	(read_data_0),
	.sel0	(1'b1),
	.data1	(read_data_1),
	.sel1	(1'b1),
	.data2	(64'b0),
	.sel2	(1'b1),
	.data3	(64'b0),
	.sel3	(1'b1),
	.data4	(64'b0),
	.sel4	(1'b1),
	.out	(read_data_0_out)
	);

endmodule // dmu_ilu_cib_stage_mux_only
