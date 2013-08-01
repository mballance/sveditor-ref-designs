// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_rds_intx_csr_int_b_int_clr_reg.v
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
module dmu_imu_rds_intx_csr_int_b_int_clr_reg 
	(
	clk,
	rst_l,
	int_b_int_clr_reg_w_ld,
	csrbus_wr_data,
	int_b_int_clr_reg_csrbus_read_data,
	int_b_int_clr_reg_clr_hw_ld,
	int_b_int_clr_reg_clr_hw_write,
	int_b_int_clr_reg_clr_hw_read
	);

//====================================================================
//     Polarity declarations
//====================================================================
input  clk;  // Clock
input  rst_l;  // Reset signal
input  int_b_int_clr_reg_w_ld;  // SW load bus
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
output [`FIRE_DLC_IMU_RDS_INTX_CSR_INT_B_INT_CLR_REG_WIDTH-1:0] int_b_int_clr_reg_csrbus_read_data;
    // SW read data
input  int_b_int_clr_reg_clr_hw_ld;  // Hardware load enable for
                                     // int_b_int_clr_reg_clr. When set, <hw
                                     // write signal>  will be loaded into
                                     // int_b_int_clr_reg.
input  int_b_int_clr_reg_clr_hw_write;  // data bus for hw loading of
                                        // int_b_int_clr_reg_clr.
output int_b_int_clr_reg_clr_hw_read;  // This signal provides the current value
                                       // of int_b_int_clr_reg_clr.

//====================================================================
//     Type declarations
//====================================================================
wire clk;  // Clock
wire rst_l;  // Reset signal
wire int_b_int_clr_reg_w_ld;  // SW load bus
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
wire [`FIRE_DLC_IMU_RDS_INTX_CSR_INT_B_INT_CLR_REG_WIDTH-1:0] int_b_int_clr_reg_csrbus_read_data;
    // SW read data
wire int_b_int_clr_reg_clr_hw_ld;  // Hardware load enable for
                                   // int_b_int_clr_reg_clr. When set, <hw write
                                   // signal>  will be loaded into
                                   // int_b_int_clr_reg.
wire int_b_int_clr_reg_clr_hw_write;  // data bus for hw loading of
                                      // int_b_int_clr_reg_clr.
wire int_b_int_clr_reg_clr_hw_read;  // This signal provides the current value
                                     // of int_b_int_clr_reg_clr.

//====================================================================
//     Logic     
//====================================================================

// synopsys translate_off
// verilint 123 off
// verilint 498 off
reg omni_ld;
reg [`FIRE_DLC_IMU_RDS_INTX_CSR_INT_B_INT_CLR_REG_WIDTH-1:0] omni_data;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld         = 1'b0;
     omni_data       = `FIRE_DLC_IMU_RDS_INTX_CSR_INT_B_INT_CLR_REG_WIDTH'b0;
  end// vlint flag_unsynthesizable_initial on

// verilint 123 on
// verilint 498 on
// synopsys translate_on

//----- Hardware Data Out Mux Assignments
assign int_b_int_clr_reg_clr_hw_read=
           int_b_int_clr_reg_csrbus_read_data [0];

//====================================================================
//     Instantiation of entries
//====================================================================

//----- Entry 0
dmu_imu_rds_intx_csr_int_b_int_clr_reg_entry int_b_int_clr_reg_0
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld),
	  .omni_data	(omni_data),
	// synopsys translate_on
	.clk	(clk),
	.rst_l	(rst_l),
	.w_ld	(int_b_int_clr_reg_w_ld),
	.csrbus_wr_data	(csrbus_wr_data),
	.int_b_int_clr_reg_csrbus_read_data	(int_b_int_clr_reg_csrbus_read_data),
	.int_b_int_clr_reg_clr_hw_ld	(int_b_int_clr_reg_clr_hw_ld),
	.int_b_int_clr_reg_clr_hw_write	(int_b_int_clr_reg_clr_hw_write)
	);

endmodule // dmu_imu_rds_intx_csr_int_b_int_clr_reg
