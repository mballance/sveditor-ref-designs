// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_rds_msi_default_grp.v
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
module dmu_imu_rds_msi_default_grp 
	(
	clk,
	msi_mapping_ext_select,
	msi_mapping_select,
	msi_mapping_ext_read_data,
	msi_mapping_v_ext_wr_data,
	msi_mapping_eqnum_ext_wr_data,
	msi_clear_reg_ext_select,
	msi_clear_reg_select,
	msi_clear_reg_ext_read_data,
	msi_clear_reg_eqwr_n_ext_wr_data,
	int_mondo_data_0_reg_data_hw_read,
	int_mondo_data_0_reg_select_pulse,
	int_mondo_data_1_reg_hw_read,
	int_mondo_data_1_reg_select_pulse,
	rst_l,
	daemon_csrbus_wr_in,
	daemon_csrbus_wr_out,
	daemon_csrbus_wr_data_in,
	ext_addr_in,
	ext_addr_out,
	read_data_0_out,
	read_data_1_out
	);

//====================================================
//     Polarity declarations
//====================================================
input  clk;  // Clock signal
output msi_mapping_ext_select;  // When set, register msi_mapping is selected.
                                // This signal is a pulse.
input  msi_mapping_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] msi_mapping_ext_read_data;
    // Read Data
output msi_mapping_v_ext_wr_data;  // Provides SW write data for external
                                   // register "msi_mapping", field "v"
output [5:0] msi_mapping_eqnum_ext_wr_data;  // Provides SW write data for
                                             // external register "msi_mapping",
                                             // field "eqnum"
output msi_clear_reg_ext_select;  // When set, register msi_clear_reg is
                                  // selected. This signal is a pulse.
input  msi_clear_reg_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] msi_clear_reg_ext_read_data;
    // Read Data
output msi_clear_reg_eqwr_n_ext_wr_data;  // Provides SW write data for external
                                          // register "msi_clear_reg", field
                                          // "eqwr_n"
output [`FIRE_DLC_IMU_RDS_MSI_CSR_INT_MONDO_DATA_0_REG_DATA_INT_SLC] int_mondo_data_0_reg_data_hw_read;
    // This signal provides the current value of int_mondo_data_0_reg_data.
input  int_mondo_data_0_reg_select_pulse;  // select
output [`FIRE_DLC_IMU_RDS_MSI_CSR_INT_MONDO_DATA_1_REG_WIDTH-1:0] int_mondo_data_1_reg_hw_read;
    // This signal provides the current value of int_mondo_data_1_reg.
input  int_mondo_data_1_reg_select_pulse;  // select
input  rst_l;  // HW reset
input  daemon_csrbus_wr_in;  // csrbus_wr
output daemon_csrbus_wr_out;  // csrbus_wr
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
input  [7:0] ext_addr_in;  // Ext addr
output [7:0] ext_addr_out;  // Ext addr
output [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data
output [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_1_out;  // Read Data

//====================================================
//     Type declarations
//====================================================
wire clk;  // Clock signal
wire msi_mapping_ext_select;  // When set, register msi_mapping is selected.
                              // This signal is a pulse.
wire msi_mapping_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] msi_mapping_ext_read_data;  // Read Data
wire msi_mapping_v_ext_wr_data;  // Provides SW write data for external register
                                 // "msi_mapping", field "v"
wire [5:0] msi_mapping_eqnum_ext_wr_data;  // Provides SW write data for
                                           // external register "msi_mapping",
                                           // field "eqnum"
wire msi_clear_reg_ext_select;  // When set, register msi_clear_reg is selected.
                                // This signal is a pulse.
wire msi_clear_reg_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] msi_clear_reg_ext_read_data;
    // Read Data
wire msi_clear_reg_eqwr_n_ext_wr_data;  // Provides SW write data for external
                                        // register "msi_clear_reg", field
                                        // "eqwr_n"
wire [`FIRE_DLC_IMU_RDS_MSI_CSR_INT_MONDO_DATA_0_REG_DATA_INT_SLC] int_mondo_data_0_reg_data_hw_read;
    // This signal provides the current value of int_mondo_data_0_reg_data.
wire int_mondo_data_0_reg_select_pulse;  // select
wire [`FIRE_DLC_IMU_RDS_MSI_CSR_INT_MONDO_DATA_1_REG_WIDTH-1:0] int_mondo_data_1_reg_hw_read;
    // This signal provides the current value of int_mondo_data_1_reg.
wire int_mondo_data_1_reg_select_pulse;  // select
wire rst_l;  // HW reset
wire daemon_csrbus_wr_in;  // csrbus_wr
wire daemon_csrbus_wr_out;  // csrbus_wr
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
wire [7:0] ext_addr_in;  // Ext addr
wire [7:0] ext_addr_out;  // Ext addr
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_1_out;  // Read Data


//====================================================
//   Local signals
//====================================================
//----- For CSR register: int_mondo_data_0_reg
wire [`FIRE_DLC_IMU_RDS_MSI_CSR_INT_MONDO_DATA_0_REG_WIDTH-1:0] int_mondo_data_0_reg_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: int_mondo_data_1_reg
wire [`FIRE_DLC_IMU_RDS_MSI_CSR_INT_MONDO_DATA_1_REG_WIDTH-1:0] int_mondo_data_1_reg_csrbus_read_data;
    // Entry Based Read Data


//====================================================
//     Pipelining (First stage)
//====================================================
//----- delayed select for ext_select
reg msi_mapping_select_piped;
reg msi_mapping_select_piped_delayed;
reg msi_clear_reg_select_piped;
reg msi_clear_reg_select_piped_delayed;

always @(posedge clk)
  begin
     if(~rst_l)
       begin
          msi_mapping_select_piped <= 1'b0;
          msi_mapping_select_piped_delayed <= 1'b0;
          msi_clear_reg_select_piped <= 1'b0;
          msi_clear_reg_select_piped_delayed <= 1'b0;
       end
     else
       begin
          msi_mapping_select_piped <= msi_mapping_select;
          msi_mapping_select_piped_delayed <= msi_mapping_select_piped;
          msi_clear_reg_select_piped <= msi_clear_reg_select;
          msi_clear_reg_select_piped_delayed <= msi_clear_reg_select_piped;
        end
  end

//====================================================
//     Assignments only (first stage)
//====================================================
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data = daemon_csrbus_wr_data_in;
wire daemon_csrbus_wr      = daemon_csrbus_wr_in;
assign daemon_csrbus_wr_out      = daemon_csrbus_wr_in;
assign msi_mapping_v_ext_wr_data = daemon_csrbus_wr_data_in[63];
assign msi_mapping_eqnum_ext_wr_data = daemon_csrbus_wr_data_in[5:0];
assign msi_clear_reg_eqwr_n_ext_wr_data = daemon_csrbus_wr_data_in[62];
assign ext_addr_out = ext_addr_in;

//====================================================
//      Automatic hw_ld / hw_write
//====================================================

//====================================================
//      Extern select
//====================================================
assign msi_mapping_ext_select =
           msi_mapping_select_piped&
           ~msi_mapping_select_piped_delayed;

// msi_mapping_ext_select is a pulse
/* 0in assert_timer -name msi_mapping_ext_select_pulse
       -var msi_mapping_ext_select -max 1
       -message "msi_mapping_ext_select pulse length is not 1"
       -clock clk
*/

assign msi_clear_reg_ext_select =
           msi_clear_reg_select_piped&
           ~msi_clear_reg_select_piped_delayed;

// msi_clear_reg_ext_select is a pulse
/* 0in assert_timer -name msi_clear_reg_ext_select_pulse
       -var msi_clear_reg_ext_select -max 1
       -message "msi_clear_reg_ext_select pulse length is not 1"
       -clock clk
*/


//=====================================================
//      OUTPUT: read_data_out
//=====================================================
dmu_imu_rds_msi_csrpipe_3 dmu_imu_rds_msi_csrpipe_3_inst_1
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.reg_in	(1'b1),
	.reg_out	(1'b1),
	.data0	(msi_mapping_ext_read_data),
	.sel0	(msi_mapping_select),
	.data1	(msi_clear_reg_ext_read_data),
	.sel1	(msi_clear_reg_select),
	.data2	(int_mondo_data_0_reg_csrbus_read_data),
	.sel2	(int_mondo_data_0_reg_select_pulse),
	.out	(read_data_0_out)
	);

dmu_imu_rds_msi_csrpipe_3 dmu_imu_rds_msi_csrpipe_3_inst_2
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.reg_in	(1'b1),
	.reg_out	(1'b1),
	.data0	(int_mondo_data_1_reg_csrbus_read_data),
	.sel0	(int_mondo_data_1_reg_select_pulse),
	.data1	(64'b0),
	.sel1	(1'b1),
	.data2	(64'b0),
	.sel2	(1'b1),
	.out	(read_data_1_out)
	);


//====================================================
//     Instantiation of registers
//====================================================

wire int_mondo_data_0_reg_w_ld =int_mondo_data_0_reg_select_pulse & daemon_csrbus_wr;

dmu_imu_rds_msi_csr_int_mondo_data_0_reg int_mondo_data_0_reg
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.int_mondo_data_0_reg_w_ld	(int_mondo_data_0_reg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.int_mondo_data_0_reg_csrbus_read_data	(int_mondo_data_0_reg_csrbus_read_data),
	.int_mondo_data_0_reg_data_hw_read	(int_mondo_data_0_reg_data_hw_read)
	);

wire int_mondo_data_1_reg_w_ld =int_mondo_data_1_reg_select_pulse & daemon_csrbus_wr;

dmu_imu_rds_msi_csr_int_mondo_data_1_reg int_mondo_data_1_reg
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.int_mondo_data_1_reg_w_ld	(int_mondo_data_1_reg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.int_mondo_data_1_reg_csrbus_read_data	(int_mondo_data_1_reg_csrbus_read_data),
	.int_mondo_data_1_reg_hw_read	(int_mondo_data_1_reg_hw_read)
	);

endmodule // dmu_imu_rds_msi_default_grp
