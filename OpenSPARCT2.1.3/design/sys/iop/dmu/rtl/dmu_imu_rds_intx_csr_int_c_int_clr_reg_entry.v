// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_rds_intx_csr_int_c_int_clr_reg_entry.v
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
module dmu_imu_rds_intx_csr_int_c_int_clr_reg_entry 
	(
	// synopsys translate_off
	  omni_ld,
	  omni_data,
	// synopsys translate_on
	clk,
	rst_l,
	w_ld,
	csrbus_wr_data,
	int_c_int_clr_reg_csrbus_read_data,
	int_c_int_clr_reg_clr_hw_ld,
	int_c_int_clr_reg_clr_hw_write
	);

//====================================================================
//     Polarity declarations
//====================================================================
// synopsys translate_off
  input  omni_ld;  // Omni load
// vlint flag_input_port_not_connected off
  input  [`FIRE_DLC_IMU_RDS_INTX_CSR_INT_C_INT_CLR_REG_WIDTH - 1:0] omni_data;
    // Omni write data
// synopsys translate_on
// vlint flag_input_port_not_connected on
input  clk;  // Clock signal
input  rst_l;  // Reset signal
input  w_ld;  // SW load
// vlint flag_input_port_not_connected off
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
// vlint flag_input_port_not_connected on
output [`FIRE_DLC_IMU_RDS_INTX_CSR_INT_C_INT_CLR_REG_WIDTH-1:0] int_c_int_clr_reg_csrbus_read_data;
    // SW read data
input  int_c_int_clr_reg_clr_hw_ld;  // Hardware load enable for
                                     // int_c_int_clr_reg_clr. When set, <hw
                                     // write signal>  will be loaded into
                                     // int_c_int_clr_reg.
input  int_c_int_clr_reg_clr_hw_write;  // data bus for hw loading of
                                        // int_c_int_clr_reg_clr.

//====================================================================
//     Type declarations
//====================================================================
// synopsys translate_off
  wire omni_ld;  // Omni load
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
  wire [`FIRE_DLC_IMU_RDS_INTX_CSR_INT_C_INT_CLR_REG_WIDTH - 1:0] omni_data;
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
wire [`FIRE_DLC_IMU_RDS_INTX_CSR_INT_C_INT_CLR_REG_WIDTH-1:0] int_c_int_clr_reg_csrbus_read_data;
    // SW read data
wire int_c_int_clr_reg_clr_hw_ld;  // Hardware load enable for
                                   // int_c_int_clr_reg_clr. When set, <hw write
                                   // signal>  will be loaded into
                                   // int_c_int_clr_reg.
wire int_c_int_clr_reg_clr_hw_write;  // data bus for hw loading of
                                      // int_c_int_clr_reg_clr.

//====================================================================
//     Logic     
//====================================================================

//----- Reset values
// verilint 531 off
wire [0:0] reset_clr = 1'h0;
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
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (1'b1),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (rst_l_active_high),
	.rst_val        (reset_clr[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[0]),
	.rw_alias       (1'b0),
	.rw1c_alias     (1'b1),
	.rw1s_alias     (1'b0),
	.hw_ld          (int_c_int_clr_reg_clr_hw_ld),
	.hw_data        (int_c_int_clr_reg_clr_hw_write),
	.cp             (clk),
	.q              (int_c_int_clr_reg_csrbus_read_data[0])
	);

assign  int_c_int_clr_reg_csrbus_read_data[1] = 1'b0;  // bit 1
assign  int_c_int_clr_reg_csrbus_read_data[2] = 1'b0;  // bit 2
assign  int_c_int_clr_reg_csrbus_read_data[3] = 1'b0;  // bit 3
assign  int_c_int_clr_reg_csrbus_read_data[4] = 1'b0;  // bit 4
assign  int_c_int_clr_reg_csrbus_read_data[5] = 1'b0;  // bit 5
assign  int_c_int_clr_reg_csrbus_read_data[6] = 1'b0;  // bit 6
assign  int_c_int_clr_reg_csrbus_read_data[7] = 1'b0;  // bit 7
assign  int_c_int_clr_reg_csrbus_read_data[8] = 1'b0;  // bit 8
assign  int_c_int_clr_reg_csrbus_read_data[9] = 1'b0;  // bit 9
assign  int_c_int_clr_reg_csrbus_read_data[10] = 1'b0;  // bit 10
assign  int_c_int_clr_reg_csrbus_read_data[11] = 1'b0;  // bit 11
assign  int_c_int_clr_reg_csrbus_read_data[12] = 1'b0;  // bit 12
assign  int_c_int_clr_reg_csrbus_read_data[13] = 1'b0;  // bit 13
assign  int_c_int_clr_reg_csrbus_read_data[14] = 1'b0;  // bit 14
assign  int_c_int_clr_reg_csrbus_read_data[15] = 1'b0;  // bit 15
assign  int_c_int_clr_reg_csrbus_read_data[16] = 1'b0;  // bit 16
assign  int_c_int_clr_reg_csrbus_read_data[17] = 1'b0;  // bit 17
assign  int_c_int_clr_reg_csrbus_read_data[18] = 1'b0;  // bit 18
assign  int_c_int_clr_reg_csrbus_read_data[19] = 1'b0;  // bit 19
assign  int_c_int_clr_reg_csrbus_read_data[20] = 1'b0;  // bit 20
assign  int_c_int_clr_reg_csrbus_read_data[21] = 1'b0;  // bit 21
assign  int_c_int_clr_reg_csrbus_read_data[22] = 1'b0;  // bit 22
assign  int_c_int_clr_reg_csrbus_read_data[23] = 1'b0;  // bit 23
assign  int_c_int_clr_reg_csrbus_read_data[24] = 1'b0;  // bit 24
assign  int_c_int_clr_reg_csrbus_read_data[25] = 1'b0;  // bit 25
assign  int_c_int_clr_reg_csrbus_read_data[26] = 1'b0;  // bit 26
assign  int_c_int_clr_reg_csrbus_read_data[27] = 1'b0;  // bit 27
assign  int_c_int_clr_reg_csrbus_read_data[28] = 1'b0;  // bit 28
assign  int_c_int_clr_reg_csrbus_read_data[29] = 1'b0;  // bit 29
assign  int_c_int_clr_reg_csrbus_read_data[30] = 1'b0;  // bit 30
assign  int_c_int_clr_reg_csrbus_read_data[31] = 1'b0;  // bit 31
assign  int_c_int_clr_reg_csrbus_read_data[32] = 1'b0;  // bit 32
assign  int_c_int_clr_reg_csrbus_read_data[33] = 1'b0;  // bit 33
assign  int_c_int_clr_reg_csrbus_read_data[34] = 1'b0;  // bit 34
assign  int_c_int_clr_reg_csrbus_read_data[35] = 1'b0;  // bit 35
assign  int_c_int_clr_reg_csrbus_read_data[36] = 1'b0;  // bit 36
assign  int_c_int_clr_reg_csrbus_read_data[37] = 1'b0;  // bit 37
assign  int_c_int_clr_reg_csrbus_read_data[38] = 1'b0;  // bit 38
assign  int_c_int_clr_reg_csrbus_read_data[39] = 1'b0;  // bit 39
assign  int_c_int_clr_reg_csrbus_read_data[40] = 1'b0;  // bit 40
assign  int_c_int_clr_reg_csrbus_read_data[41] = 1'b0;  // bit 41
assign  int_c_int_clr_reg_csrbus_read_data[42] = 1'b0;  // bit 42
assign  int_c_int_clr_reg_csrbus_read_data[43] = 1'b0;  // bit 43
assign  int_c_int_clr_reg_csrbus_read_data[44] = 1'b0;  // bit 44
assign  int_c_int_clr_reg_csrbus_read_data[45] = 1'b0;  // bit 45
assign  int_c_int_clr_reg_csrbus_read_data[46] = 1'b0;  // bit 46
assign  int_c_int_clr_reg_csrbus_read_data[47] = 1'b0;  // bit 47
assign  int_c_int_clr_reg_csrbus_read_data[48] = 1'b0;  // bit 48
assign  int_c_int_clr_reg_csrbus_read_data[49] = 1'b0;  // bit 49
assign  int_c_int_clr_reg_csrbus_read_data[50] = 1'b0;  // bit 50
assign  int_c_int_clr_reg_csrbus_read_data[51] = 1'b0;  // bit 51
assign  int_c_int_clr_reg_csrbus_read_data[52] = 1'b0;  // bit 52
assign  int_c_int_clr_reg_csrbus_read_data[53] = 1'b0;  // bit 53
assign  int_c_int_clr_reg_csrbus_read_data[54] = 1'b0;  // bit 54
assign  int_c_int_clr_reg_csrbus_read_data[55] = 1'b0;  // bit 55
assign  int_c_int_clr_reg_csrbus_read_data[56] = 1'b0;  // bit 56
assign  int_c_int_clr_reg_csrbus_read_data[57] = 1'b0;  // bit 57
assign  int_c_int_clr_reg_csrbus_read_data[58] = 1'b0;  // bit 58
assign  int_c_int_clr_reg_csrbus_read_data[59] = 1'b0;  // bit 59
assign  int_c_int_clr_reg_csrbus_read_data[60] = 1'b0;  // bit 60
assign  int_c_int_clr_reg_csrbus_read_data[61] = 1'b0;  // bit 61
assign  int_c_int_clr_reg_csrbus_read_data[62] = 1'b0;  // bit 62
assign  int_c_int_clr_reg_csrbus_read_data[63] = 1'b0;  // bit 63

endmodule // dmu_imu_rds_intx_csr_int_c_int_clr_reg_entry
