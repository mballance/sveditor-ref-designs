// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_rds_intx_default_grp.v
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
module dmu_imu_rds_intx_default_grp 
	(
	clk,
	intx_status_reg_select,
	intx_status_reg_ext_read_data,
	int_a_int_clr_reg_clr_hw_ld,
	int_a_int_clr_reg_clr_hw_write,
	int_a_int_clr_reg_clr_hw_read,
	int_a_int_clr_reg_select_pulse,
	int_b_int_clr_reg_clr_hw_ld,
	int_b_int_clr_reg_clr_hw_write,
	int_b_int_clr_reg_clr_hw_read,
	int_b_int_clr_reg_select_pulse,
	int_c_int_clr_reg_clr_hw_ld,
	int_c_int_clr_reg_clr_hw_write,
	int_c_int_clr_reg_clr_hw_read,
	int_c_int_clr_reg_select_pulse,
	int_d_int_clr_reg_clr_hw_ld,
	int_d_int_clr_reg_clr_hw_write,
	int_d_int_clr_reg_clr_hw_read,
	int_d_int_clr_reg_select_pulse,
	rst_l,
	daemon_csrbus_wr_in,
	daemon_csrbus_wr_data_in,
	read_data_0_out
	);

//====================================================
//     Polarity declarations
//====================================================
input  clk;  // Clock signal
input  intx_status_reg_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] intx_status_reg_ext_read_data;
    // Read Data
input  int_a_int_clr_reg_clr_hw_ld;  // Hardware load enable for
                                     // int_a_int_clr_reg_clr. When set, <hw
                                     // write signal>  will be loaded into
                                     // int_a_int_clr_reg.
input  int_a_int_clr_reg_clr_hw_write;  // data bus for hw loading of
                                        // int_a_int_clr_reg_clr.
output int_a_int_clr_reg_clr_hw_read;  // This signal provides the current value
                                       // of int_a_int_clr_reg_clr.
input  int_a_int_clr_reg_select_pulse;  // select
input  int_b_int_clr_reg_clr_hw_ld;  // Hardware load enable for
                                     // int_b_int_clr_reg_clr. When set, <hw
                                     // write signal>  will be loaded into
                                     // int_b_int_clr_reg.
input  int_b_int_clr_reg_clr_hw_write;  // data bus for hw loading of
                                        // int_b_int_clr_reg_clr.
output int_b_int_clr_reg_clr_hw_read;  // This signal provides the current value
                                       // of int_b_int_clr_reg_clr.
input  int_b_int_clr_reg_select_pulse;  // select
input  int_c_int_clr_reg_clr_hw_ld;  // Hardware load enable for
                                     // int_c_int_clr_reg_clr. When set, <hw
                                     // write signal>  will be loaded into
                                     // int_c_int_clr_reg.
input  int_c_int_clr_reg_clr_hw_write;  // data bus for hw loading of
                                        // int_c_int_clr_reg_clr.
output int_c_int_clr_reg_clr_hw_read;  // This signal provides the current value
                                       // of int_c_int_clr_reg_clr.
input  int_c_int_clr_reg_select_pulse;  // select
input  int_d_int_clr_reg_clr_hw_ld;  // Hardware load enable for
                                     // int_d_int_clr_reg_clr. When set, <hw
                                     // write signal>  will be loaded into
                                     // int_d_int_clr_reg.
input  int_d_int_clr_reg_clr_hw_write;  // data bus for hw loading of
                                        // int_d_int_clr_reg_clr.
output int_d_int_clr_reg_clr_hw_read;  // This signal provides the current value
                                       // of int_d_int_clr_reg_clr.
input  int_d_int_clr_reg_select_pulse;  // select
input  rst_l;  // HW reset
input  daemon_csrbus_wr_in;  // csrbus_wr
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
output [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data

//====================================================
//     Type declarations
//====================================================
wire clk;  // Clock signal
wire intx_status_reg_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] intx_status_reg_ext_read_data;
    // Read Data
wire int_a_int_clr_reg_clr_hw_ld;  // Hardware load enable for
                                   // int_a_int_clr_reg_clr. When set, <hw write
                                   // signal>  will be loaded into
                                   // int_a_int_clr_reg.
wire int_a_int_clr_reg_clr_hw_write;  // data bus for hw loading of
                                      // int_a_int_clr_reg_clr.
wire int_a_int_clr_reg_clr_hw_read;  // This signal provides the current value
                                     // of int_a_int_clr_reg_clr.
wire int_a_int_clr_reg_select_pulse;  // select
wire int_b_int_clr_reg_clr_hw_ld;  // Hardware load enable for
                                   // int_b_int_clr_reg_clr. When set, <hw write
                                   // signal>  will be loaded into
                                   // int_b_int_clr_reg.
wire int_b_int_clr_reg_clr_hw_write;  // data bus for hw loading of
                                      // int_b_int_clr_reg_clr.
wire int_b_int_clr_reg_clr_hw_read;  // This signal provides the current value
                                     // of int_b_int_clr_reg_clr.
wire int_b_int_clr_reg_select_pulse;  // select
wire int_c_int_clr_reg_clr_hw_ld;  // Hardware load enable for
                                   // int_c_int_clr_reg_clr. When set, <hw write
                                   // signal>  will be loaded into
                                   // int_c_int_clr_reg.
wire int_c_int_clr_reg_clr_hw_write;  // data bus for hw loading of
                                      // int_c_int_clr_reg_clr.
wire int_c_int_clr_reg_clr_hw_read;  // This signal provides the current value
                                     // of int_c_int_clr_reg_clr.
wire int_c_int_clr_reg_select_pulse;  // select
wire int_d_int_clr_reg_clr_hw_ld;  // Hardware load enable for
                                   // int_d_int_clr_reg_clr. When set, <hw write
                                   // signal>  will be loaded into
                                   // int_d_int_clr_reg.
wire int_d_int_clr_reg_clr_hw_write;  // data bus for hw loading of
                                      // int_d_int_clr_reg_clr.
wire int_d_int_clr_reg_clr_hw_read;  // This signal provides the current value
                                     // of int_d_int_clr_reg_clr.
wire int_d_int_clr_reg_select_pulse;  // select
wire rst_l;  // HW reset
wire daemon_csrbus_wr_in;  // csrbus_wr
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data


//====================================================
//   Local signals
//====================================================
//----- For CSR register: int_a_int_clr_reg
wire [`FIRE_DLC_IMU_RDS_INTX_CSR_INT_A_INT_CLR_REG_WIDTH-1:0] int_a_int_clr_reg_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: int_b_int_clr_reg
wire [`FIRE_DLC_IMU_RDS_INTX_CSR_INT_B_INT_CLR_REG_WIDTH-1:0] int_b_int_clr_reg_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: int_c_int_clr_reg
wire [`FIRE_DLC_IMU_RDS_INTX_CSR_INT_C_INT_CLR_REG_WIDTH-1:0] int_c_int_clr_reg_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: int_d_int_clr_reg
wire [`FIRE_DLC_IMU_RDS_INTX_CSR_INT_D_INT_CLR_REG_WIDTH-1:0] int_d_int_clr_reg_csrbus_read_data;
    // Entry Based Read Data

//====================================================
//     Assignments only (first stage)
//====================================================
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data = daemon_csrbus_wr_data_in;
wire daemon_csrbus_wr      = daemon_csrbus_wr_in;

//====================================================
//      Automatic hw_ld / hw_write
//====================================================

//====================================================
//      Extern select
//====================================================

//=====================================================
//      OUTPUT: read_data_out
//=====================================================
dmu_imu_rds_intx_csrpipe_5 dmu_imu_rds_intx_csrpipe_5_inst_1
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.reg_in	(1'b1),
	.reg_out	(1'b1),
	.data0	(intx_status_reg_ext_read_data),
	.sel0	(intx_status_reg_select),
	.data1	(int_a_int_clr_reg_csrbus_read_data),
	.sel1	(int_a_int_clr_reg_select_pulse),
	.data2	(int_b_int_clr_reg_csrbus_read_data),
	.sel2	(int_b_int_clr_reg_select_pulse),
	.data3	(int_c_int_clr_reg_csrbus_read_data),
	.sel3	(int_c_int_clr_reg_select_pulse),
	.data4	(int_d_int_clr_reg_csrbus_read_data),
	.sel4	(int_d_int_clr_reg_select_pulse),
	.out	(read_data_0_out)
	);


//====================================================
//     Instantiation of registers
//====================================================

wire int_a_int_clr_reg_w_ld =int_a_int_clr_reg_select_pulse & daemon_csrbus_wr;

dmu_imu_rds_intx_csr_int_a_int_clr_reg int_a_int_clr_reg
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.int_a_int_clr_reg_w_ld	(int_a_int_clr_reg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.int_a_int_clr_reg_csrbus_read_data	(int_a_int_clr_reg_csrbus_read_data),
	.int_a_int_clr_reg_clr_hw_ld	(int_a_int_clr_reg_clr_hw_ld),
	.int_a_int_clr_reg_clr_hw_write	(int_a_int_clr_reg_clr_hw_write),
	.int_a_int_clr_reg_clr_hw_read	(int_a_int_clr_reg_clr_hw_read)
	);

wire int_b_int_clr_reg_w_ld =int_b_int_clr_reg_select_pulse & daemon_csrbus_wr;

dmu_imu_rds_intx_csr_int_b_int_clr_reg int_b_int_clr_reg
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.int_b_int_clr_reg_w_ld	(int_b_int_clr_reg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.int_b_int_clr_reg_csrbus_read_data	(int_b_int_clr_reg_csrbus_read_data),
	.int_b_int_clr_reg_clr_hw_ld	(int_b_int_clr_reg_clr_hw_ld),
	.int_b_int_clr_reg_clr_hw_write	(int_b_int_clr_reg_clr_hw_write),
	.int_b_int_clr_reg_clr_hw_read	(int_b_int_clr_reg_clr_hw_read)
	);

wire int_c_int_clr_reg_w_ld =int_c_int_clr_reg_select_pulse & daemon_csrbus_wr;

dmu_imu_rds_intx_csr_int_c_int_clr_reg int_c_int_clr_reg
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.int_c_int_clr_reg_w_ld	(int_c_int_clr_reg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.int_c_int_clr_reg_csrbus_read_data	(int_c_int_clr_reg_csrbus_read_data),
	.int_c_int_clr_reg_clr_hw_ld	(int_c_int_clr_reg_clr_hw_ld),
	.int_c_int_clr_reg_clr_hw_write	(int_c_int_clr_reg_clr_hw_write),
	.int_c_int_clr_reg_clr_hw_read	(int_c_int_clr_reg_clr_hw_read)
	);

wire int_d_int_clr_reg_w_ld =int_d_int_clr_reg_select_pulse & daemon_csrbus_wr;

dmu_imu_rds_intx_csr_int_d_int_clr_reg int_d_int_clr_reg
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.int_d_int_clr_reg_w_ld	(int_d_int_clr_reg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.int_d_int_clr_reg_csrbus_read_data	(int_d_int_clr_reg_csrbus_read_data),
	.int_d_int_clr_reg_clr_hw_ld	(int_d_int_clr_reg_clr_hw_ld),
	.int_d_int_clr_reg_clr_hw_write	(int_d_int_clr_reg_clr_hw_write),
	.int_d_int_clr_reg_clr_hw_read	(int_d_int_clr_reg_clr_hw_read)
	);

endmodule // dmu_imu_rds_intx_default_grp
