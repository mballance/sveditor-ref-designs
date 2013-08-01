// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_ics_csr_dmc_interrupt_mask_reg_entry.v
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
module dmu_imu_ics_csr_dmc_interrupt_mask_reg_entry 
	(
	// synopsys translate_off
	  omni_ld,
	  omni_data,
	// synopsys translate_on
	clk,
	rst_l,
	w_ld,
	csrbus_wr_data,
	dmc_interrupt_mask_reg_csrbus_read_data
	);

//====================================================================
//     Polarity declarations
//====================================================================
// synopsys translate_off
  input  omni_ld;  // Omni load
// vlint flag_input_port_not_connected off
  input  [`FIRE_DLC_IMU_ICS_CSR_DMC_INTERRUPT_MASK_REG_WIDTH - 1:0] omni_data;
    // Omni write data
// synopsys translate_on
// vlint flag_input_port_not_connected on
input  clk;  // Clock signal
input  rst_l;  // Reset signal
input  w_ld;  // SW load
// vlint flag_input_port_not_connected off
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
// vlint flag_input_port_not_connected on
output [`FIRE_DLC_IMU_ICS_CSR_DMC_INTERRUPT_MASK_REG_WIDTH-1:0] dmc_interrupt_mask_reg_csrbus_read_data;
    // SW read data

//====================================================================
//     Type declarations
//====================================================================
// synopsys translate_off
  wire omni_ld;  // Omni load
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
  wire [`FIRE_DLC_IMU_ICS_CSR_DMC_INTERRUPT_MASK_REG_WIDTH - 1:0] omni_data;
    // Omni write data
// synopsys translate_on
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on
wire clk;  // Clock signal
wire rst_l;  // Reset signal
wire w_ld;  // SW load
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on
wire [`FIRE_DLC_IMU_ICS_CSR_DMC_INTERRUPT_MASK_REG_WIDTH-1:0] dmc_interrupt_mask_reg_csrbus_read_data;
    // SW read data

//====================================================================
//     Logic     
//====================================================================

//----- Reset values
// verilint 531 off
wire [0:0] reset_dmc = 1'h0;
wire [0:0] reset_debug_trig_en = 1'h0;
wire [0:0] reset_mmu = 1'h0;
wire [0:0] reset_imu = 1'h0;
// verilint 531 on

//----- Active high reset wires 
wire rst_l_active_high = ~rst_l;

//====================================================
//     Instantiation of flops
//====================================================

// bit 0
csr_sw csr_sw_0
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[0]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_imu[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[0]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b0),
	.hw_data        (1'b0),
	.cp             (clk),
	.q              (dmc_interrupt_mask_reg_csrbus_read_data[0])
	);

// bit 1
csr_sw csr_sw_1
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[1]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_mmu[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[1]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b0),
	.hw_data        (1'b0),
	.cp             (clk),
	.q              (dmc_interrupt_mask_reg_csrbus_read_data[1])
	);

assign  dmc_interrupt_mask_reg_csrbus_read_data[2] = 1'b0;  // bit 2
assign  dmc_interrupt_mask_reg_csrbus_read_data[3] = 1'b0;  // bit 3
assign  dmc_interrupt_mask_reg_csrbus_read_data[4] = 1'b0;  // bit 4
assign  dmc_interrupt_mask_reg_csrbus_read_data[5] = 1'b0;  // bit 5
assign  dmc_interrupt_mask_reg_csrbus_read_data[6] = 1'b0;  // bit 6
assign  dmc_interrupt_mask_reg_csrbus_read_data[7] = 1'b0;  // bit 7
assign  dmc_interrupt_mask_reg_csrbus_read_data[8] = 1'b0;  // bit 8
assign  dmc_interrupt_mask_reg_csrbus_read_data[9] = 1'b0;  // bit 9
assign  dmc_interrupt_mask_reg_csrbus_read_data[10] = 1'b0;  // bit 10
assign  dmc_interrupt_mask_reg_csrbus_read_data[11] = 1'b0;  // bit 11
assign  dmc_interrupt_mask_reg_csrbus_read_data[12] = 1'b0;  // bit 12
assign  dmc_interrupt_mask_reg_csrbus_read_data[13] = 1'b0;  // bit 13
assign  dmc_interrupt_mask_reg_csrbus_read_data[14] = 1'b0;  // bit 14
assign  dmc_interrupt_mask_reg_csrbus_read_data[15] = 1'b0;  // bit 15
assign  dmc_interrupt_mask_reg_csrbus_read_data[16] = 1'b0;  // bit 16
assign  dmc_interrupt_mask_reg_csrbus_read_data[17] = 1'b0;  // bit 17
assign  dmc_interrupt_mask_reg_csrbus_read_data[18] = 1'b0;  // bit 18
assign  dmc_interrupt_mask_reg_csrbus_read_data[19] = 1'b0;  // bit 19
assign  dmc_interrupt_mask_reg_csrbus_read_data[20] = 1'b0;  // bit 20
assign  dmc_interrupt_mask_reg_csrbus_read_data[21] = 1'b0;  // bit 21
assign  dmc_interrupt_mask_reg_csrbus_read_data[22] = 1'b0;  // bit 22
assign  dmc_interrupt_mask_reg_csrbus_read_data[23] = 1'b0;  // bit 23
assign  dmc_interrupt_mask_reg_csrbus_read_data[24] = 1'b0;  // bit 24
assign  dmc_interrupt_mask_reg_csrbus_read_data[25] = 1'b0;  // bit 25
assign  dmc_interrupt_mask_reg_csrbus_read_data[26] = 1'b0;  // bit 26
assign  dmc_interrupt_mask_reg_csrbus_read_data[27] = 1'b0;  // bit 27
assign  dmc_interrupt_mask_reg_csrbus_read_data[28] = 1'b0;  // bit 28
assign  dmc_interrupt_mask_reg_csrbus_read_data[29] = 1'b0;  // bit 29
assign  dmc_interrupt_mask_reg_csrbus_read_data[30] = 1'b0;  // bit 30
assign  dmc_interrupt_mask_reg_csrbus_read_data[31] = 1'b0;  // bit 31
assign  dmc_interrupt_mask_reg_csrbus_read_data[32] = 1'b0;  // bit 32
assign  dmc_interrupt_mask_reg_csrbus_read_data[33] = 1'b0;  // bit 33
assign  dmc_interrupt_mask_reg_csrbus_read_data[34] = 1'b0;  // bit 34
assign  dmc_interrupt_mask_reg_csrbus_read_data[35] = 1'b0;  // bit 35
assign  dmc_interrupt_mask_reg_csrbus_read_data[36] = 1'b0;  // bit 36
assign  dmc_interrupt_mask_reg_csrbus_read_data[37] = 1'b0;  // bit 37
assign  dmc_interrupt_mask_reg_csrbus_read_data[38] = 1'b0;  // bit 38
assign  dmc_interrupt_mask_reg_csrbus_read_data[39] = 1'b0;  // bit 39
assign  dmc_interrupt_mask_reg_csrbus_read_data[40] = 1'b0;  // bit 40
assign  dmc_interrupt_mask_reg_csrbus_read_data[41] = 1'b0;  // bit 41
assign  dmc_interrupt_mask_reg_csrbus_read_data[42] = 1'b0;  // bit 42
assign  dmc_interrupt_mask_reg_csrbus_read_data[43] = 1'b0;  // bit 43
assign  dmc_interrupt_mask_reg_csrbus_read_data[44] = 1'b0;  // bit 44
assign  dmc_interrupt_mask_reg_csrbus_read_data[45] = 1'b0;  // bit 45
assign  dmc_interrupt_mask_reg_csrbus_read_data[46] = 1'b0;  // bit 46
assign  dmc_interrupt_mask_reg_csrbus_read_data[47] = 1'b0;  // bit 47
assign  dmc_interrupt_mask_reg_csrbus_read_data[48] = 1'b0;  // bit 48
assign  dmc_interrupt_mask_reg_csrbus_read_data[49] = 1'b0;  // bit 49
assign  dmc_interrupt_mask_reg_csrbus_read_data[50] = 1'b0;  // bit 50
assign  dmc_interrupt_mask_reg_csrbus_read_data[51] = 1'b0;  // bit 51
assign  dmc_interrupt_mask_reg_csrbus_read_data[52] = 1'b0;  // bit 52
assign  dmc_interrupt_mask_reg_csrbus_read_data[53] = 1'b0;  // bit 53
assign  dmc_interrupt_mask_reg_csrbus_read_data[54] = 1'b0;  // bit 54
assign  dmc_interrupt_mask_reg_csrbus_read_data[55] = 1'b0;  // bit 55
assign  dmc_interrupt_mask_reg_csrbus_read_data[56] = 1'b0;  // bit 56
assign  dmc_interrupt_mask_reg_csrbus_read_data[57] = 1'b0;  // bit 57
assign  dmc_interrupt_mask_reg_csrbus_read_data[58] = 1'b0;  // bit 58
assign  dmc_interrupt_mask_reg_csrbus_read_data[59] = 1'b0;  // bit 59
assign  dmc_interrupt_mask_reg_csrbus_read_data[60] = 1'b0;  // bit 60
assign  dmc_interrupt_mask_reg_csrbus_read_data[61] = 1'b0;  // bit 61
// bit 62
csr_sw csr_sw_62
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[62]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_debug_trig_en[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[62]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b0),
	.hw_data        (1'b0),
	.cp             (clk),
	.q              (dmc_interrupt_mask_reg_csrbus_read_data[62])
	);

// bit 63
csr_sw csr_sw_63
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[63]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_dmc[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[63]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (1'b0),
	.hw_data        (1'b0),
	.cp             (clk),
	.q              (dmc_interrupt_mask_reg_csrbus_read_data[63])
	);


endmodule // dmu_imu_ics_csr_dmc_interrupt_mask_reg_entry
