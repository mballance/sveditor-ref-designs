// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_csr_stage_2_default_grp.v
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
module dmu_mmu_csr_stage_2_default_grp
	(
	clk,
	read_data_0,
	read_data_1,
	ext_done_0,
	ctl_select_pulse,
	ctl_select_pulse_out,
	tsb_select_pulse,
	tsb_select_pulse_out,
	fsh_select_pulse,
	fsh_select_pulse_out,
	inv_select,
	inv_select_out,
	log_select_pulse,
	log_select_pulse_out,
	int_en_select_pulse,
	int_en_select_pulse_out,
	en_err_select,
	en_err_select_out,
	err_select_pulse,
	err_select_pulse_out,
	flta_select_pulse,
	flta_select_pulse_out,
	flts_select_pulse,
	flts_select_pulse_out,
	prfc_select_pulse,
	prfc_select_pulse_out,
	prf0_select_pulse,
	prf0_select_pulse_out,
	prf1_select_pulse,
	prf1_select_pulse_out,
	vtb_select,
	vtb_select_out,
	ptb_select,
	ptb_select_out,
	tdb_select,
	tdb_select_out,
	dev2iotsb_select,
	dev2iotsb_select_out,
	IotsbDesc_select,
	IotsbDesc_select_out,
	err_rw1c_alias,
	err_rw1c_alias_out,
	err_rw1s_alias,
	err_rw1s_alias_out,
	rst_l,
	rst_l_out,
	por_l,
	por_l_out,
	daemon_csrbus_wr_in,
	daemon_csrbus_wr_out,
	daemon_csrbus_wr_data_in,
	daemon_csrbus_wr_data_out,
	ext_addr_in,
	ext_addr_out,
	read_data_0_out,
	ext_done_0_out
	);

//====================================================
//     Polarity declarations
//====================================================
input  clk;  // Clock signal
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0;  // Read Data
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_1;  // Read Data
input  ext_done_0;  // Ext Done
input  ctl_select_pulse;  // select
output ctl_select_pulse_out;  // select
input  tsb_select_pulse;  // select
output tsb_select_pulse_out;  // select
input  fsh_select_pulse;  // select
output fsh_select_pulse_out;  // select
input  inv_select;  // select
output inv_select_out;  // select
input  log_select_pulse;  // select
output log_select_pulse_out;  // select
input  int_en_select_pulse;  // select
output int_en_select_pulse_out;  // select
input  en_err_select;  // select
output en_err_select_out;  // select
input  err_select_pulse;  // select
output err_select_pulse_out;  // select
input  flta_select_pulse;  // select
output flta_select_pulse_out;  // select
input  flts_select_pulse;  // select
output flts_select_pulse_out;  // select
input  prfc_select_pulse;  // select
output prfc_select_pulse_out;  // select
input  prf0_select_pulse;  // select
output prf0_select_pulse_out;  // select
input  prf1_select_pulse;  // select
output prf1_select_pulse_out;  // select
input  vtb_select;  // select
output vtb_select_out;  // select
input  ptb_select;  // select
output ptb_select_out;  // select
input  tdb_select;  // select
output tdb_select_out;  // select
input  dev2iotsb_select;  // select
output dev2iotsb_select_out;  // select
input  IotsbDesc_select;  // select
output IotsbDesc_select_out;  // select
input  err_rw1c_alias;  // SW load
output err_rw1c_alias_out;  // alias
input  err_rw1s_alias;  // SW load
output err_rw1s_alias_out;  // alias
input  rst_l;  // HW reset
output rst_l_out;  // HW reset
input  por_l;  // HW reset
output por_l_out;  // HW reset
input  daemon_csrbus_wr_in;  // csrbus_wr
output daemon_csrbus_wr_out;  // csrbus_wr
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
output [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_out;  // SW write
                                                                 // data
input  [8:0] ext_addr_in;  // Ext addr
output [8:0] ext_addr_out;  // Ext addr
output [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data
output ext_done_0_out;  // Ext Done

//====================================================
//     Type declarations
//====================================================
wire clk;  // Clock signal
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_1;  // Read Data
wire ext_done_0;  // Ext Done
wire ctl_select_pulse;  // select
reg ctl_select_pulse_out;  // select
wire tsb_select_pulse;  // select
reg tsb_select_pulse_out;  // select
wire fsh_select_pulse;  // select
reg fsh_select_pulse_out;  // select
wire inv_select;  // select
reg inv_select_out;  // select
wire log_select_pulse;  // select
reg log_select_pulse_out;  // select
wire int_en_select_pulse;  // select
reg int_en_select_pulse_out;  // select
wire en_err_select;  // select
reg en_err_select_out;  // select
wire err_select_pulse;  // select
reg err_select_pulse_out;  // select
wire flta_select_pulse;  // select
reg flta_select_pulse_out;  // select
wire flts_select_pulse;  // select
reg flts_select_pulse_out;  // select
wire prfc_select_pulse;  // select
reg prfc_select_pulse_out;  // select
wire prf0_select_pulse;  // select
reg prf0_select_pulse_out;  // select
wire prf1_select_pulse;  // select
reg prf1_select_pulse_out;  // select
wire vtb_select;  // select
reg vtb_select_out;  // select
wire ptb_select;  // select
reg ptb_select_out;  // select
wire tdb_select;  // select
reg tdb_select_out;  // select
wire dev2iotsb_select;  // select
reg dev2iotsb_select_out;  // select
wire IotsbDesc_select;  // select
reg IotsbDesc_select_out;  // select
wire err_rw1c_alias;  // SW load
wire err_rw1c_alias_out;  // alias
wire err_rw1s_alias;  // SW load
wire err_rw1s_alias_out;  // alias
wire rst_l;  // HW reset
wire rst_l_out;  // HW reset
wire por_l;  // HW reset
wire por_l_out;  // HW reset
wire daemon_csrbus_wr_in;  // csrbus_wr
wire daemon_csrbus_wr_out;  // csrbus_wr
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_out;  // SW write data
wire [8:0] ext_addr_in;  // Ext addr
wire [8:0] ext_addr_out;  // Ext addr
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data
reg ext_done_0_out;  // Ext Done


//====================================================
//     Pipelining
//====================================================
always @(posedge clk)
  begin
     ext_done_0_out <=
        ext_done_0;

     ctl_select_pulse_out <= ctl_select_pulse;
     tsb_select_pulse_out <= tsb_select_pulse;
     fsh_select_pulse_out <= fsh_select_pulse;
     inv_select_out <= inv_select;
     log_select_pulse_out <= log_select_pulse;
     int_en_select_pulse_out <= int_en_select_pulse;
     en_err_select_out <= en_err_select;
     err_select_pulse_out <= err_select_pulse;
     flta_select_pulse_out <= flta_select_pulse;
     flts_select_pulse_out <= flts_select_pulse;
     prfc_select_pulse_out <= prfc_select_pulse;
     prf0_select_pulse_out <= prf0_select_pulse;
     prf1_select_pulse_out <= prf1_select_pulse;
     vtb_select_out <= vtb_select;
     ptb_select_out <= ptb_select;
     tdb_select_out <= tdb_select;
     dev2iotsb_select_out <= dev2iotsb_select;
     IotsbDesc_select_out <= IotsbDesc_select;
  end


//====================================================
//     Assignments only
//====================================================
assign daemon_csrbus_wr_out      = daemon_csrbus_wr_in;
assign daemon_csrbus_wr_data_out = daemon_csrbus_wr_data_in;
assign ext_addr_out = ext_addr_in;
assign err_rw1c_alias_out = err_rw1c_alias;
assign err_rw1s_alias_out = err_rw1s_alias;
assign rst_l_out = rst_l;
assign por_l_out = por_l;

//=====================================================
//      OUTPUT: read_data_out
//=====================================================
dmu_mmu_csr_csrpipe_15 dmu_mmu_csr_csrpipe_15_inst_1
	(
	.clk	(clk),
        .rst_l  (rst_l),
	.reg_in	(1'b0),
	.reg_out	(1'b1),
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
	.data5	(64'b0),
	.sel5	(1'b1),
	.data6	(64'b0),
	.sel6	(1'b1),
	.data7	(64'b0),
	.sel7	(1'b1),
	.data8	(64'b0),
	.sel8	(1'b1),
	.data9	(64'b0),
	.sel9	(1'b1),
	.data10	(64'b0),
	.sel10	(1'b1),
	.data11	(64'b0),
	.sel11	(1'b1),
	.data12	(64'b0),
	.sel12	(1'b1),
	.data13	(64'b0),
	.sel13	(1'b1),
	.data14	(64'b0),
	.sel14	(1'b1),
	.out	(read_data_0_out)
	);

endmodule // dmu_mmu_csr_stage_2_default_grp
