// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_psb_csr.v
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
module dmu_psb_csr 
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
	psb_dma_ext_select,
	psb_dma_entry_ext_read_data,
	psb_dma_ext_done,
	psb_pio_ext_select,
	psb_pio_entry_ext_read_data,
	psb_pio_ext_done
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
output [4:0] ext_addr;  // External address bus for dcm psb
output psb_dma_ext_select;  // When set, register psb_dma is selected. This
                            // signal is a level.
input  [40:0] psb_dma_entry_ext_read_data;  // Read data from the external
                                            // bypass register
input  psb_dma_ext_done;  // This signal acknowledges read and write operations
                          // for register psb_dma. For read operations, it
                          // indicates that the psb_dma_ext_read_data signals
                          // are valid. For write operations, it indicates that
                          // the write operation is complete, and that
                          // <dcm>_ext_wr_data may be removed on the next cycle.
output psb_pio_ext_select;  // When set, register psb_pio is selected. This
                            // signal is a level.
input  [6:0] psb_pio_entry_ext_read_data;  // Read data from the external bypass
                                           // register
input  psb_pio_ext_done;  // This signal acknowledges read and write operations
                          // for register psb_pio. For read operations, it
                          // indicates that the psb_pio_ext_read_data signals
                          // are valid. For write operations, it indicates that
                          // the write operation is complete, and that
                          // <dcm>_ext_wr_data may be removed on the next cycle.

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
wire [4:0] ext_addr;  // External address bus for dcm psb
wire psb_dma_ext_select;  // When set, register psb_dma is selected. This signal
                          // is a level.
wire [40:0] psb_dma_entry_ext_read_data;  // Read data from the external bypass
                                          // register
wire psb_dma_ext_done;  // This signal acknowledges read and write operations
                        // for register psb_dma. For read operations, it
                        // indicates that the psb_dma_ext_read_data signals are
                        // valid. For write operations, it indicates that the
                        // write operation is complete, and that
                        // <dcm>_ext_wr_data may be removed on the next cycle.
wire psb_pio_ext_select;  // When set, register psb_pio is selected. This signal
                          // is a level.
wire [6:0] psb_pio_entry_ext_read_data;  // Read data from the external bypass
                                         // register
wire psb_pio_ext_done;  // This signal acknowledges read and write operations
                        // for register psb_pio. For read operations, it
                        // indicates that the psb_pio_ext_read_data signals are
                        // valid. For write operations, it indicates that the
                        // write operation is complete, and that
                        // <dcm>_ext_wr_data may be removed on the next cycle.

//====================================================
//     Logic
//====================================================
wire daemon_transaction_in_progress;
wire daemon_csrbus_mapped;
wire daemon_csrbus_valid;
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data;
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on
wire daemon_csrbus_done;
wire [`FIRE_CSRBUS_ADDR_WIDTH-1:0] daemon_csrbus_addr;
wire daemon_csrbus_wr;

//summit modcovoff -bepgnv
pcie_dcm_daemon #(`FIRE_CSRBUS_ADDR_WIDTH,`FIRE_CSRBUS_DATA_WIDTH) pcie_dcm_daemon (
    .daemon_csrbus_valid (daemon_csrbus_valid),
    .daemon_csrbus_mapped (daemon_csrbus_mapped),
    .daemon_csrbus_wr_data (daemon_csrbus_wr_data),
    .daemon_csrbus_done (daemon_csrbus_done),
    .daemon_csrbus_addr (daemon_csrbus_addr),
    .daemon_csrbus_wr (daemon_csrbus_wr),
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
wire psb_dma_select;
wire psb_pio_select;
wire stage_mux_only_ext_done_0_out;

dmu_psb_addr_decode dmu_psb_addr_decode
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.daemon_csrbus_valid	(daemon_csrbus_valid),
	.daemon_csrbus_addr	(daemon_csrbus_addr),
	.csrbus_src_bus	(csrbus_src_bus),
	.daemon_csrbus_wr	(daemon_csrbus_wr),
	.daemon_csrbus_mapped	(daemon_csrbus_mapped),
	.csrbus_acc_vio	(csrbus_acc_vio),
	.daemon_transaction_in_progress	(daemon_transaction_in_progress),
	.instance_id	(instance_id),
	.daemon_csrbus_done	(daemon_csrbus_done),
	.stage_mux_only_ext_done_0_out	(stage_mux_only_ext_done_0_out),
	.psb_dma_select	(psb_dma_select),
	.psb_pio_select	(psb_pio_select)
	);

//====================================================
//      ext_read_data: field-based to register-based
//====================================================
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] psb_dma_ext_read_data =
              {
                23'b0,
                psb_dma_entry_ext_read_data
              };

wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] psb_pio_ext_read_data =
              {
                57'b0,
                psb_pio_entry_ext_read_data
              };


//====================================================================
//    OUTPUT: csrbus_read_data (pipelining)
//====================================================================
//----- connecting wires
wire stage_mux_only_rst_l;
wire [4:0] stage_mux_only_ext_addr;

//----- Stage: 1 / Grp: default_grp (2 inputs / 1 outputs)
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] default_grp_read_data_0_out;
wire default_grp_ext_done_0_out;
wire default_grp_psb_dma_select;
wire default_grp_psb_pio_select;

dmu_psb_default_grp dmu_psb_default_grp
	(
	.clk	(clk),
	.psb_dma_ext_select	(psb_dma_ext_select),
	.psb_dma_select	(default_grp_psb_dma_select),
	.psb_dma_ext_read_data	(psb_dma_ext_read_data),
	.psb_dma_ext_done	(psb_dma_ext_done),
	.psb_pio_ext_select	(psb_pio_ext_select),
	.psb_pio_select	(default_grp_psb_pio_select),
	.psb_pio_ext_read_data	(psb_pio_ext_read_data),
	.psb_pio_ext_done	(psb_pio_ext_done),
	.rst_l	(stage_mux_only_rst_l),
	.ext_addr_in	(stage_mux_only_ext_addr[4:0]),
	.ext_addr_out	(ext_addr),
	.read_data_0_out	(default_grp_read_data_0_out),
	.ext_done_0_out	(default_grp_ext_done_0_out)
	);

//----- Stage: 2 / Grp: stage_mux_only (1 inputs / 1 outputs) (Mux only)
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] stage_mux_only_read_data_0_out;

dmu_psb_stage_mux_only dmu_psb_stage_mux_only
	(
	.clk	(clk),
	.read_data_0	(default_grp_read_data_0_out),
	.ext_done_0	(default_grp_ext_done_0_out),
	.psb_dma_select	(psb_dma_select),
	.psb_dma_select_out	(default_grp_psb_dma_select),
	.psb_pio_select	(psb_pio_select),
	.psb_pio_select_out	(default_grp_psb_pio_select),
	.ext_addr_in	(daemon_csrbus_addr[4:0]),
	.ext_addr_out	(stage_mux_only_ext_addr),
	.read_data_0_out	(stage_mux_only_read_data_0_out),
	.ext_done_0_out	(stage_mux_only_ext_done_0_out),
	.rst_l	(rst_l),
	.rst_l_out	(stage_mux_only_rst_l)
	);

//----- OUTPUT: csrbus_read_data
assign csrbus_read_data = stage_mux_only_read_data_0_out;

endmodule // dmu_psb_csr
