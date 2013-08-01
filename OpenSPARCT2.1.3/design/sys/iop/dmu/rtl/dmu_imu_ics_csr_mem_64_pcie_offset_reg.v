// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_ics_csr_mem_64_pcie_offset_reg.v
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
module dmu_imu_ics_csr_mem_64_pcie_offset_reg
	(
	clk,
	rst_l,
	mem_64_pcie_offset_reg_w_ld,
	csrbus_wr_data,
	mem_64_pcie_offset_reg_csrbus_read_data,
	mem_64_pcie_offset_reg_addr_hw_read,
	mem_64_pcie_offset_reg_spare_control_load_7_hw_ld,
	mem_64_pcie_offset_reg_spare_control_load_7_hw_write,
	mem_64_pcie_offset_reg_spare_control_load_7_hw_read,
	mem_64_pcie_offset_reg_spare_control_load_6_hw_ld,
	mem_64_pcie_offset_reg_spare_control_load_6_hw_write,
	mem_64_pcie_offset_reg_spare_control_load_6_hw_read,
	mem_64_pcie_offset_reg_spare_control_load_5_hw_ld,
	mem_64_pcie_offset_reg_spare_control_load_5_hw_write,
	mem_64_pcie_offset_reg_spare_control_load_5_hw_read,
	mem_64_pcie_offset_reg_spare_control_load_4_hw_ld,
	mem_64_pcie_offset_reg_spare_control_load_4_hw_write,
	mem_64_pcie_offset_reg_spare_control_load_4_hw_read,
	mem_64_pcie_offset_reg_spare_control_load_3_hw_ld,
	mem_64_pcie_offset_reg_spare_control_load_3_hw_write,
	mem_64_pcie_offset_reg_spare_control_load_3_hw_read,
	mem_64_pcie_offset_reg_spare_control_load_2_hw_ld,
	mem_64_pcie_offset_reg_spare_control_load_2_hw_write,
	mem_64_pcie_offset_reg_spare_control_load_2_hw_read,
	mem_64_pcie_offset_reg_spare_control_load_1_hw_ld,
	mem_64_pcie_offset_reg_spare_control_load_1_hw_write,
	mem_64_pcie_offset_reg_spare_control_load_1_hw_read,
	mem_64_pcie_offset_reg_spare_control_load_0_hw_ld,
	mem_64_pcie_offset_reg_spare_control_load_0_hw_write,
	mem_64_pcie_offset_reg_spare_control_load_0_hw_read,
	mem_64_pcie_offset_reg_spare_control_hw_write,
	mem_64_pcie_offset_reg_spare_control_hw_read,
	mem_64_pcie_offset_reg_spare_status_hw_read
	);

//====================================================================
//     Polarity declarations
//====================================================================
input  clk;  // Clock
input  rst_l;  // Reset signal
input  mem_64_pcie_offset_reg_w_ld;  // SW load bus
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
output [`FIRE_DLC_IMU_ICS_CSR_MEM_64_PCIE_OFFSET_REG_WIDTH-1:0] mem_64_pcie_offset_reg_csrbus_read_data;
    // SW read data
output [`FIRE_DLC_IMU_ICS_CSR_MEM_64_PCIE_OFFSET_REG_ADDR_INT_SLC] mem_64_pcie_offset_reg_addr_hw_read;
    // This signal provides the current value of mem_64_pcie_offset_reg_addr.
input  mem_64_pcie_offset_reg_spare_control_load_7_hw_ld;  // Hardware load
                                                           // enable for
                                                           // mem_64_pcie_offset_reg_spare_control_load_7.
                                                           // When set, <hw
                                                           // write signal> 
                                                           // will be loaded
                                                           // into
                                                           // mem_64_pcie_offset_reg.
input  mem_64_pcie_offset_reg_spare_control_load_7_hw_write;  // data bus for hw
                                                              // loading of
                                                              // mem_64_pcie_offset_reg_spare_control_load_7.
output mem_64_pcie_offset_reg_spare_control_load_7_hw_read;  // This signal
                                                             // provides the
                                                             // current value of
                                                             // mem_64_pcie_offset_reg_spare_control_load_7.
input  mem_64_pcie_offset_reg_spare_control_load_6_hw_ld;  // Hardware load
                                                           // enable for
                                                           // mem_64_pcie_offset_reg_spare_control_load_6.
                                                           // When set, <hw
                                                           // write signal> 
                                                           // will be loaded
                                                           // into
                                                           // mem_64_pcie_offset_reg.
input  mem_64_pcie_offset_reg_spare_control_load_6_hw_write;  // data bus for hw
                                                              // loading of
                                                              // mem_64_pcie_offset_reg_spare_control_load_6.
output mem_64_pcie_offset_reg_spare_control_load_6_hw_read;  // This signal
                                                             // provides the
                                                             // current value of
                                                             // mem_64_pcie_offset_reg_spare_control_load_6.
input  mem_64_pcie_offset_reg_spare_control_load_5_hw_ld;  // Hardware load
                                                           // enable for
                                                           // mem_64_pcie_offset_reg_spare_control_load_5.
                                                           // When set, <hw
                                                           // write signal> 
                                                           // will be loaded
                                                           // into
                                                           // mem_64_pcie_offset_reg.
input  mem_64_pcie_offset_reg_spare_control_load_5_hw_write;  // data bus for hw
                                                              // loading of
                                                              // mem_64_pcie_offset_reg_spare_control_load_5.
output mem_64_pcie_offset_reg_spare_control_load_5_hw_read;  // This signal
                                                             // provides the
                                                             // current value of
                                                             // mem_64_pcie_offset_reg_spare_control_load_5.
input  mem_64_pcie_offset_reg_spare_control_load_4_hw_ld;  // Hardware load
                                                           // enable for
                                                           // mem_64_pcie_offset_reg_spare_control_load_4.
                                                           // When set, <hw
                                                           // write signal> 
                                                           // will be loaded
                                                           // into
                                                           // mem_64_pcie_offset_reg.
input  mem_64_pcie_offset_reg_spare_control_load_4_hw_write;  // data bus for hw
                                                              // loading of
                                                              // mem_64_pcie_offset_reg_spare_control_load_4.
output mem_64_pcie_offset_reg_spare_control_load_4_hw_read;  // This signal
                                                             // provides the
                                                             // current value of
                                                             // mem_64_pcie_offset_reg_spare_control_load_4.
input  mem_64_pcie_offset_reg_spare_control_load_3_hw_ld;  // Hardware load
                                                           // enable for
                                                           // mem_64_pcie_offset_reg_spare_control_load_3.
                                                           // When set, <hw
                                                           // write signal> 
                                                           // will be loaded
                                                           // into
                                                           // mem_64_pcie_offset_reg.
input  mem_64_pcie_offset_reg_spare_control_load_3_hw_write;  // data bus for hw
                                                              // loading of
                                                              // mem_64_pcie_offset_reg_spare_control_load_3.
output mem_64_pcie_offset_reg_spare_control_load_3_hw_read;  // This signal
                                                             // provides the
                                                             // current value of
                                                             // mem_64_pcie_offset_reg_spare_control_load_3.
input  mem_64_pcie_offset_reg_spare_control_load_2_hw_ld;  // Hardware load
                                                           // enable for
                                                           // mem_64_pcie_offset_reg_spare_control_load_2.
                                                           // When set, <hw
                                                           // write signal> 
                                                           // will be loaded
                                                           // into
                                                           // mem_64_pcie_offset_reg.
input  mem_64_pcie_offset_reg_spare_control_load_2_hw_write;  // data bus for hw
                                                              // loading of
                                                              // mem_64_pcie_offset_reg_spare_control_load_2.
output mem_64_pcie_offset_reg_spare_control_load_2_hw_read;  // This signal
                                                             // provides the
                                                             // current value of
                                                             // mem_64_pcie_offset_reg_spare_control_load_2.
input  mem_64_pcie_offset_reg_spare_control_load_1_hw_ld;  // Hardware load
                                                           // enable for
                                                           // mem_64_pcie_offset_reg_spare_control_load_1.
                                                           // When set, <hw
                                                           // write signal> 
                                                           // will be loaded
                                                           // into
                                                           // mem_64_pcie_offset_reg.
input  mem_64_pcie_offset_reg_spare_control_load_1_hw_write;  // data bus for hw
                                                              // loading of
                                                              // mem_64_pcie_offset_reg_spare_control_load_1.
output mem_64_pcie_offset_reg_spare_control_load_1_hw_read;  // This signal
                                                             // provides the
                                                             // current value of
                                                             // mem_64_pcie_offset_reg_spare_control_load_1.
input  mem_64_pcie_offset_reg_spare_control_load_0_hw_ld;  // Hardware load
                                                           // enable for
                                                           // mem_64_pcie_offset_reg_spare_control_load_0.
                                                           // When set, <hw
                                                           // write signal> 
                                                           // will be loaded
                                                           // into
                                                           // mem_64_pcie_offset_reg.
input  mem_64_pcie_offset_reg_spare_control_load_0_hw_write;  // data bus for hw
                                                              // loading of
                                                              // mem_64_pcie_offset_reg_spare_control_load_0.
output mem_64_pcie_offset_reg_spare_control_load_0_hw_read;  // This signal
                                                             // provides the
                                                             // current value of
                                                             // mem_64_pcie_offset_reg_spare_control_load_0.
input  [`FIRE_DLC_IMU_ICS_CSR_MEM_64_PCIE_OFFSET_REG_SPARE_CONTROL_INT_SLC]
 mem_64_pcie_offset_reg_spare_control_hw_write;  // data bus for hw loading of
                                                 // mem_64_pcie_offset_reg_spare_control.
output [`FIRE_DLC_IMU_ICS_CSR_MEM_64_PCIE_OFFSET_REG_SPARE_CONTROL_INT_SLC]
 mem_64_pcie_offset_reg_spare_control_hw_read;  // This signal provides the
                                                // current value of
                                                // mem_64_pcie_offset_reg_spare_control.
output [`FIRE_DLC_IMU_ICS_CSR_MEM_64_PCIE_OFFSET_REG_SPARE_STATUS_INT_SLC] mem_64_pcie_offset_reg_spare_status_hw_read;
    // This signal provides the current value of
    // mem_64_pcie_offset_reg_spare_status.

//====================================================================
//     Type declarations
//====================================================================
wire clk;  // Clock
wire rst_l;  // Reset signal
wire mem_64_pcie_offset_reg_w_ld;  // SW load bus
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
wire [`FIRE_DLC_IMU_ICS_CSR_MEM_64_PCIE_OFFSET_REG_WIDTH-1:0] mem_64_pcie_offset_reg_csrbus_read_data;
    // SW read data
wire [`FIRE_DLC_IMU_ICS_CSR_MEM_64_PCIE_OFFSET_REG_ADDR_INT_SLC] mem_64_pcie_offset_reg_addr_hw_read;
    // This signal provides the current value of mem_64_pcie_offset_reg_addr.
wire mem_64_pcie_offset_reg_spare_control_load_7_hw_ld;  // Hardware load enable
                                                         // for
                                                         // mem_64_pcie_offset_reg_spare_control_load_7.
                                                         // When set, <hw write
                                                         // signal>  will be
                                                         // loaded into
                                                         // mem_64_pcie_offset_reg.
wire mem_64_pcie_offset_reg_spare_control_load_7_hw_write;  // data bus for hw
                                                            // loading of
                                                            // mem_64_pcie_offset_reg_spare_control_load_7.
wire mem_64_pcie_offset_reg_spare_control_load_7_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // mem_64_pcie_offset_reg_spare_control_load_7.
wire mem_64_pcie_offset_reg_spare_control_load_6_hw_ld;  // Hardware load enable
                                                         // for
                                                         // mem_64_pcie_offset_reg_spare_control_load_6.
                                                         // When set, <hw write
                                                         // signal>  will be
                                                         // loaded into
                                                         // mem_64_pcie_offset_reg.
wire mem_64_pcie_offset_reg_spare_control_load_6_hw_write;  // data bus for hw
                                                            // loading of
                                                            // mem_64_pcie_offset_reg_spare_control_load_6.
wire mem_64_pcie_offset_reg_spare_control_load_6_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // mem_64_pcie_offset_reg_spare_control_load_6.
wire mem_64_pcie_offset_reg_spare_control_load_5_hw_ld;  // Hardware load enable
                                                         // for
                                                         // mem_64_pcie_offset_reg_spare_control_load_5.
                                                         // When set, <hw write
                                                         // signal>  will be
                                                         // loaded into
                                                         // mem_64_pcie_offset_reg.
wire mem_64_pcie_offset_reg_spare_control_load_5_hw_write;  // data bus for hw
                                                            // loading of
                                                            // mem_64_pcie_offset_reg_spare_control_load_5.
wire mem_64_pcie_offset_reg_spare_control_load_5_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // mem_64_pcie_offset_reg_spare_control_load_5.
wire mem_64_pcie_offset_reg_spare_control_load_4_hw_ld;  // Hardware load enable
                                                         // for
                                                         // mem_64_pcie_offset_reg_spare_control_load_4.
                                                         // When set, <hw write
                                                         // signal>  will be
                                                         // loaded into
                                                         // mem_64_pcie_offset_reg.
wire mem_64_pcie_offset_reg_spare_control_load_4_hw_write;  // data bus for hw
                                                            // loading of
                                                            // mem_64_pcie_offset_reg_spare_control_load_4.
wire mem_64_pcie_offset_reg_spare_control_load_4_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // mem_64_pcie_offset_reg_spare_control_load_4.
wire mem_64_pcie_offset_reg_spare_control_load_3_hw_ld;  // Hardware load enable
                                                         // for
                                                         // mem_64_pcie_offset_reg_spare_control_load_3.
                                                         // When set, <hw write
                                                         // signal>  will be
                                                         // loaded into
                                                         // mem_64_pcie_offset_reg.
wire mem_64_pcie_offset_reg_spare_control_load_3_hw_write;  // data bus for hw
                                                            // loading of
                                                            // mem_64_pcie_offset_reg_spare_control_load_3.
wire mem_64_pcie_offset_reg_spare_control_load_3_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // mem_64_pcie_offset_reg_spare_control_load_3.
wire mem_64_pcie_offset_reg_spare_control_load_2_hw_ld;  // Hardware load enable
                                                         // for
                                                         // mem_64_pcie_offset_reg_spare_control_load_2.
                                                         // When set, <hw write
                                                         // signal>  will be
                                                         // loaded into
                                                         // mem_64_pcie_offset_reg.
wire mem_64_pcie_offset_reg_spare_control_load_2_hw_write;  // data bus for hw
                                                            // loading of
                                                            // mem_64_pcie_offset_reg_spare_control_load_2.
wire mem_64_pcie_offset_reg_spare_control_load_2_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // mem_64_pcie_offset_reg_spare_control_load_2.
wire mem_64_pcie_offset_reg_spare_control_load_1_hw_ld;  // Hardware load enable
                                                         // for
                                                         // mem_64_pcie_offset_reg_spare_control_load_1.
                                                         // When set, <hw write
                                                         // signal>  will be
                                                         // loaded into
                                                         // mem_64_pcie_offset_reg.
wire mem_64_pcie_offset_reg_spare_control_load_1_hw_write;  // data bus for hw
                                                            // loading of
                                                            // mem_64_pcie_offset_reg_spare_control_load_1.
wire mem_64_pcie_offset_reg_spare_control_load_1_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // mem_64_pcie_offset_reg_spare_control_load_1.
wire mem_64_pcie_offset_reg_spare_control_load_0_hw_ld;  // Hardware load enable
                                                         // for
                                                         // mem_64_pcie_offset_reg_spare_control_load_0.
                                                         // When set, <hw write
                                                         // signal>  will be
                                                         // loaded into
                                                         // mem_64_pcie_offset_reg.
wire mem_64_pcie_offset_reg_spare_control_load_0_hw_write;  // data bus for hw
                                                            // loading of
                                                            // mem_64_pcie_offset_reg_spare_control_load_0.
wire mem_64_pcie_offset_reg_spare_control_load_0_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // mem_64_pcie_offset_reg_spare_control_load_0.
wire [`FIRE_DLC_IMU_ICS_CSR_MEM_64_PCIE_OFFSET_REG_SPARE_CONTROL_INT_SLC] mem_64_pcie_offset_reg_spare_control_hw_write;
    // data bus for hw loading of mem_64_pcie_offset_reg_spare_control.
wire [`FIRE_DLC_IMU_ICS_CSR_MEM_64_PCIE_OFFSET_REG_SPARE_CONTROL_INT_SLC] mem_64_pcie_offset_reg_spare_control_hw_read;
    // This signal provides the current value of
    // mem_64_pcie_offset_reg_spare_control.
wire [`FIRE_DLC_IMU_ICS_CSR_MEM_64_PCIE_OFFSET_REG_SPARE_STATUS_INT_SLC] mem_64_pcie_offset_reg_spare_status_hw_read;
    // This signal provides the current value of
    // mem_64_pcie_offset_reg_spare_status.

//====================================================================
//     Logic     
//====================================================================

// synopsys translate_off
// verilint 123 off
// verilint 498 off
reg omni_ld;
reg [`FIRE_DLC_IMU_ICS_CSR_MEM_64_PCIE_OFFSET_REG_WIDTH-1:0] omni_data;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld         = 1'b0;
     omni_data       = `FIRE_DLC_IMU_ICS_CSR_MEM_64_PCIE_OFFSET_REG_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

// verilint 123 on
// verilint 498 on
// synopsys translate_on

//----- Hardware Data Out Mux Assignments
assign mem_64_pcie_offset_reg_addr_hw_read=
           mem_64_pcie_offset_reg_csrbus_read_data
               [`FIRE_DLC_IMU_ICS_CSR_MEM_64_PCIE_OFFSET_REG_ADDR_SLC];
assign mem_64_pcie_offset_reg_spare_control_load_7_hw_read=
           mem_64_pcie_offset_reg_csrbus_read_data [23];
assign mem_64_pcie_offset_reg_spare_control_load_6_hw_read=
           mem_64_pcie_offset_reg_csrbus_read_data [22];
assign mem_64_pcie_offset_reg_spare_control_load_5_hw_read=
           mem_64_pcie_offset_reg_csrbus_read_data [21];
assign mem_64_pcie_offset_reg_spare_control_load_4_hw_read=
           mem_64_pcie_offset_reg_csrbus_read_data [20];
assign mem_64_pcie_offset_reg_spare_control_load_3_hw_read=
           mem_64_pcie_offset_reg_csrbus_read_data [19];
assign mem_64_pcie_offset_reg_spare_control_load_2_hw_read=
           mem_64_pcie_offset_reg_csrbus_read_data [18];
assign mem_64_pcie_offset_reg_spare_control_load_1_hw_read=
           mem_64_pcie_offset_reg_csrbus_read_data [17];
assign mem_64_pcie_offset_reg_spare_control_load_0_hw_read=
           mem_64_pcie_offset_reg_csrbus_read_data [16];
assign mem_64_pcie_offset_reg_spare_control_hw_read=
           mem_64_pcie_offset_reg_csrbus_read_data
               [`FIRE_DLC_IMU_ICS_CSR_MEM_64_PCIE_OFFSET_REG_SPARE_CONTROL_SLC];
assign mem_64_pcie_offset_reg_spare_status_hw_read=
           mem_64_pcie_offset_reg_csrbus_read_data
               [`FIRE_DLC_IMU_ICS_CSR_MEM_64_PCIE_OFFSET_REG_SPARE_STATUS_SLC];

//====================================================================
//     Instantiation of entries
//====================================================================

//----- Entry 0
dmu_imu_ics_csr_mem_64_pcie_offset_reg_entry mem_64_pcie_offset_reg_0
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld),
	  .omni_data	(omni_data),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(mem_64_pcie_offset_reg_w_ld),
	.csrbus_wr_data	(csrbus_wr_data),
	.mem_64_pcie_offset_reg_csrbus_read_data	(mem_64_pcie_offset_reg_csrbus_read_data),
	.mem_64_pcie_offset_reg_spare_control_load_7_hw_ld	(mem_64_pcie_offset_reg_spare_control_load_7_hw_ld),
	.mem_64_pcie_offset_reg_spare_control_load_7_hw_write	(mem_64_pcie_offset_reg_spare_control_load_7_hw_write),
	.mem_64_pcie_offset_reg_spare_control_load_6_hw_ld	(mem_64_pcie_offset_reg_spare_control_load_6_hw_ld),
	.mem_64_pcie_offset_reg_spare_control_load_6_hw_write	(mem_64_pcie_offset_reg_spare_control_load_6_hw_write),
	.mem_64_pcie_offset_reg_spare_control_load_5_hw_ld	(mem_64_pcie_offset_reg_spare_control_load_5_hw_ld),
	.mem_64_pcie_offset_reg_spare_control_load_5_hw_write	(mem_64_pcie_offset_reg_spare_control_load_5_hw_write),
	.mem_64_pcie_offset_reg_spare_control_load_4_hw_ld	(mem_64_pcie_offset_reg_spare_control_load_4_hw_ld),
	.mem_64_pcie_offset_reg_spare_control_load_4_hw_write	(mem_64_pcie_offset_reg_spare_control_load_4_hw_write),
	.mem_64_pcie_offset_reg_spare_control_load_3_hw_ld	(mem_64_pcie_offset_reg_spare_control_load_3_hw_ld),
	.mem_64_pcie_offset_reg_spare_control_load_3_hw_write	(mem_64_pcie_offset_reg_spare_control_load_3_hw_write),
	.mem_64_pcie_offset_reg_spare_control_load_2_hw_ld	(mem_64_pcie_offset_reg_spare_control_load_2_hw_ld),
	.mem_64_pcie_offset_reg_spare_control_load_2_hw_write	(mem_64_pcie_offset_reg_spare_control_load_2_hw_write),
	.mem_64_pcie_offset_reg_spare_control_load_1_hw_ld	(mem_64_pcie_offset_reg_spare_control_load_1_hw_ld),
	.mem_64_pcie_offset_reg_spare_control_load_1_hw_write	(mem_64_pcie_offset_reg_spare_control_load_1_hw_write),
	.mem_64_pcie_offset_reg_spare_control_load_0_hw_ld	(mem_64_pcie_offset_reg_spare_control_load_0_hw_ld),
	.mem_64_pcie_offset_reg_spare_control_load_0_hw_write	(mem_64_pcie_offset_reg_spare_control_load_0_hw_write),
	.mem_64_pcie_offset_reg_spare_control_hw_write	(mem_64_pcie_offset_reg_spare_control_hw_write)
	);

endmodule // dmu_imu_ics_csr_mem_64_pcie_offset_reg
