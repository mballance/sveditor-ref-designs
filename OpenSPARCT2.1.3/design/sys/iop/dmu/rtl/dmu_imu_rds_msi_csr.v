// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_rds_msi_csr.v
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
module dmu_imu_rds_msi_csr 
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
	ext_addr,
	ext_wr,
	msi_mapping_v_ext_wr_data,
	msi_mapping_eqnum_ext_wr_data,
	msi_mapping_ext_select,
	msi_mapping_ext_read_data,
	msi_clear_reg_eqwr_n_ext_wr_data,
	msi_clear_reg_ext_select,
	msi_clear_reg_ext_read_data,
	int_mondo_data_0_reg_data_hw_read,
	int_mondo_data_1_reg_hw_read
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
output [7:0] ext_addr;  // External address bus for dcm msi
output ext_wr;  // When one, csr operation is a write. When zero, operation is a
                // read.
output msi_mapping_v_ext_wr_data;  // Provides SW write data for external
                                   // register "msi_mapping", field "v"
output [5:0] msi_mapping_eqnum_ext_wr_data;  // Provides SW write data for
                                             // external register "msi_mapping",
                                             // field "eqnum"
output msi_mapping_ext_select;  // When set, register msi_mapping is selected.
                                // This signal is a pulse.
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] msi_mapping_ext_read_data;  // Read data
                                                                 // from the
                                                                 // external
                                                                 // bypass
                                                                 // register
output msi_clear_reg_eqwr_n_ext_wr_data;  // Provides SW write data for external
                                          // register "msi_clear_reg", field
                                          // "eqwr_n"
output msi_clear_reg_ext_select;  // When set, register msi_clear_reg is
                                  // selected. This signal is a pulse.
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] msi_clear_reg_ext_read_data;
    // Read data from the external bypass register
output [`FIRE_DLC_IMU_RDS_MSI_CSR_INT_MONDO_DATA_0_REG_DATA_INT_SLC] int_mondo_data_0_reg_data_hw_read;
    // This signal provides the current value of int_mondo_data_0_reg_data.
output [`FIRE_DLC_IMU_RDS_MSI_CSR_INT_MONDO_DATA_1_REG_WIDTH-1:0] int_mondo_data_1_reg_hw_read;
    // This signal provides the current value of int_mondo_data_1_reg.

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
wire [7:0] ext_addr;  // External address bus for dcm msi
wire ext_wr;  // When one, csr operation is a write. When zero, operation is a
              // read.
wire msi_mapping_v_ext_wr_data;  // Provides SW write data for external register
                                 // "msi_mapping", field "v"
wire [5:0] msi_mapping_eqnum_ext_wr_data;  // Provides SW write data for
                                           // external register "msi_mapping",
                                           // field "eqnum"
wire msi_mapping_ext_select;  // When set, register msi_mapping is selected.
                              // This signal is a pulse.
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] msi_mapping_ext_read_data;  // Read data from
                                                               // the external
                                                               // bypass
                                                               // register
wire msi_clear_reg_eqwr_n_ext_wr_data;  // Provides SW write data for external
                                        // register "msi_clear_reg", field
                                        // "eqwr_n"
wire msi_clear_reg_ext_select;  // When set, register msi_clear_reg is selected.
                                // This signal is a pulse.
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] msi_clear_reg_ext_read_data;  // Read data
                                                                 // from the
                                                                 // external
                                                                 // bypass
                                                                 // register
wire [`FIRE_DLC_IMU_RDS_MSI_CSR_INT_MONDO_DATA_0_REG_DATA_INT_SLC] int_mondo_data_0_reg_data_hw_read;
    // This signal provides the current value of int_mondo_data_0_reg_data.
wire [`FIRE_DLC_IMU_RDS_MSI_CSR_INT_MONDO_DATA_1_REG_WIDTH-1:0] int_mondo_data_1_reg_hw_read;
    // This signal provides the current value of int_mondo_data_1_reg.

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
      .rst_l(rst_l),
      .csrbus_read_data (csrbus_read_data),
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
wire msi_mapping_select;
wire msi_clear_reg_select;
wire int_mondo_data_0_reg_select_pulse;
wire int_mondo_data_1_reg_select_pulse;

dmu_imu_rds_msi_addr_decode dmu_imu_rds_msi_addr_decode
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
	.msi_mapping_select	(msi_mapping_select),
	.msi_clear_reg_select	(msi_clear_reg_select),
	.int_mondo_data_0_reg_select_pulse	(int_mondo_data_0_reg_select_pulse),
	.int_mondo_data_1_reg_select_pulse	(int_mondo_data_1_reg_select_pulse)
	);

//====================================================================
//    OUTPUT: csrbus_read_data (pipelining)
//====================================================================
//----- connecting wires
wire stage_2_default_grp_rst_l;
wire stage_mux_only_rst_l;
wire [7:0] stage_2_default_grp_ext_addr;
wire stage_2_default_grp_daemon_csrbus_wr;
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] stage_2_default_grp_daemon_csrbus_wr_data;
wire [7:0] stage_mux_only_ext_addr;
wire stage_mux_only_daemon_csrbus_wr;
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] stage_mux_only_daemon_csrbus_wr_data;

//----- Stage: 1 / Grp: default_grp (4 inputs / 2 outputs)
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] default_grp_read_data_0_out;
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] default_grp_read_data_1_out;
wire default_grp_msi_mapping_select;
wire default_grp_msi_clear_reg_select;
wire default_grp_int_mondo_data_0_reg_select_pulse;
wire default_grp_int_mondo_data_1_reg_select_pulse;

dmu_imu_rds_msi_default_grp dmu_imu_rds_msi_default_grp
	(
	.clk	(clk),
	.msi_mapping_ext_select	(msi_mapping_ext_select),
	.msi_mapping_select	(default_grp_msi_mapping_select),
	.msi_mapping_ext_read_data	(msi_mapping_ext_read_data),
	.msi_mapping_v_ext_wr_data	(msi_mapping_v_ext_wr_data),
	.msi_mapping_eqnum_ext_wr_data	(msi_mapping_eqnum_ext_wr_data),
	.msi_clear_reg_ext_select	(msi_clear_reg_ext_select),
	.msi_clear_reg_select	(default_grp_msi_clear_reg_select),
	.msi_clear_reg_ext_read_data	(msi_clear_reg_ext_read_data),
	.msi_clear_reg_eqwr_n_ext_wr_data	(msi_clear_reg_eqwr_n_ext_wr_data),
	.int_mondo_data_0_reg_data_hw_read	(int_mondo_data_0_reg_data_hw_read),
	.int_mondo_data_0_reg_select_pulse	(default_grp_int_mondo_data_0_reg_select_pulse),
	.int_mondo_data_1_reg_hw_read	(int_mondo_data_1_reg_hw_read),
	.int_mondo_data_1_reg_select_pulse	(default_grp_int_mondo_data_1_reg_select_pulse),
	.rst_l	(stage_2_default_grp_rst_l),
	.daemon_csrbus_wr_in	(stage_2_default_grp_daemon_csrbus_wr),
	.daemon_csrbus_wr_out	(ext_wr),
	.daemon_csrbus_wr_data_in	(stage_2_default_grp_daemon_csrbus_wr_data),
	.ext_addr_in	(stage_2_default_grp_ext_addr[7:0]),
	.ext_addr_out	(ext_addr),
	.read_data_0_out	(default_grp_read_data_0_out),
	.read_data_1_out	(default_grp_read_data_1_out)
	);

//----- Stage: 2 / Grp: stage_2_default_grp (2 inputs / 1 outputs)
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] stage_2_default_grp_read_data_0_out;
wire stage_2_default_grp_msi_mapping_select;
wire stage_2_default_grp_msi_clear_reg_select;
wire stage_2_default_grp_int_mondo_data_0_reg_select_pulse;
wire stage_2_default_grp_int_mondo_data_1_reg_select_pulse;

dmu_imu_rds_msi_stage_2_default_grp dmu_imu_rds_msi_stage_2_default_grp
	(
	.clk	(clk),
	.read_data_0	(default_grp_read_data_0_out),
	.read_data_1	(default_grp_read_data_1_out),
	.msi_mapping_select	(stage_2_default_grp_msi_mapping_select),
	.msi_mapping_select_out	(default_grp_msi_mapping_select),
	.msi_clear_reg_select	(stage_2_default_grp_msi_clear_reg_select),
	.msi_clear_reg_select_out	(default_grp_msi_clear_reg_select),
	.int_mondo_data_0_reg_select_pulse	(stage_2_default_grp_int_mondo_data_0_reg_select_pulse),
	.int_mondo_data_0_reg_select_pulse_out	(default_grp_int_mondo_data_0_reg_select_pulse),
	.int_mondo_data_1_reg_select_pulse	(stage_2_default_grp_int_mondo_data_1_reg_select_pulse),
	.int_mondo_data_1_reg_select_pulse_out	(default_grp_int_mondo_data_1_reg_select_pulse),
	.rst_l	(stage_mux_only_rst_l),
	.rst_l_out	(stage_2_default_grp_rst_l),
	.daemon_csrbus_wr_in	(stage_mux_only_daemon_csrbus_wr),
	.daemon_csrbus_wr_out	(stage_2_default_grp_daemon_csrbus_wr),
	.daemon_csrbus_wr_data_in	(stage_mux_only_daemon_csrbus_wr_data),
	.daemon_csrbus_wr_data_out	(stage_2_default_grp_daemon_csrbus_wr_data),
	.ext_addr_in	(stage_mux_only_ext_addr[7:0]),
	.ext_addr_out	(stage_2_default_grp_ext_addr),
	.read_data_0_out	(stage_2_default_grp_read_data_0_out)
	);

//----- Stage: 3 / Grp: stage_mux_only (1 inputs / 1 outputs) (Mux only)
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] stage_mux_only_read_data_0_out;

dmu_imu_rds_msi_stage_mux_only dmu_imu_rds_msi_stage_mux_only
	(
	.clk	(clk),
	.read_data_0	(stage_2_default_grp_read_data_0_out),
	.msi_mapping_select	(msi_mapping_select),
	.msi_mapping_select_out	(stage_2_default_grp_msi_mapping_select),
	.msi_clear_reg_select	(msi_clear_reg_select),
	.msi_clear_reg_select_out	(stage_2_default_grp_msi_clear_reg_select),
	.int_mondo_data_0_reg_select_pulse	(int_mondo_data_0_reg_select_pulse),
	.int_mondo_data_0_reg_select_pulse_out	(stage_2_default_grp_int_mondo_data_0_reg_select_pulse),
	.int_mondo_data_1_reg_select_pulse	(int_mondo_data_1_reg_select_pulse),
	.int_mondo_data_1_reg_select_pulse_out	(stage_2_default_grp_int_mondo_data_1_reg_select_pulse),
	.daemon_csrbus_wr_in	(daemon_csrbus_wr),
	.daemon_csrbus_wr_out	(stage_mux_only_daemon_csrbus_wr),
	.daemon_csrbus_wr_data_in	(daemon_csrbus_wr_data),
	.daemon_csrbus_wr_data_out	(stage_mux_only_daemon_csrbus_wr_data),
	.ext_addr_in	(daemon_csrbus_addr[7:0]),
	.ext_addr_out	(stage_mux_only_ext_addr),
	.read_data_0_out	(stage_mux_only_read_data_0_out),
	.rst_l	(rst_l),
	.rst_l_out	(stage_mux_only_rst_l)
	);

//----- OUTPUT: csrbus_read_data
assign csrbus_read_data = stage_mux_only_read_data_0_out;

endmodule // dmu_imu_rds_msi_csr
