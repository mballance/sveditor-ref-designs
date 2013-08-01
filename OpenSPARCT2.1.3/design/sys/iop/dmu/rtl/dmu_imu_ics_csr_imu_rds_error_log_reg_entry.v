// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_ics_csr_imu_rds_error_log_reg_entry.v
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
module dmu_imu_ics_csr_imu_rds_error_log_reg_entry 
	(
	// synopsys translate_off
	  omni_ld,
	  omni_data,
	// synopsys translate_on
	clk,
	por_l,
	w_ld,
	csrbus_wr_data,
	imu_rds_error_log_reg_csrbus_read_data,
	imu_rds_error_log_reg_hw_ld,
	imu_rds_error_log_reg_hw_write
	);

//====================================================================
//     Polarity declarations
//====================================================================
// synopsys translate_off
  input  omni_ld;  // Omni load
// vlint flag_input_port_not_connected off
  input  [`FIRE_DLC_IMU_ICS_CSR_IMU_RDS_ERROR_LOG_REG_WIDTH - 1:0] omni_data;
    // Omni write data
// synopsys translate_on
// vlint flag_input_port_not_connected on
input  clk;  // Clock signal
input  por_l;  // Reset signal
input  w_ld;  // SW load
// vlint flag_input_port_not_connected off
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
// vlint flag_input_port_not_connected on
output [`FIRE_DLC_IMU_ICS_CSR_IMU_RDS_ERROR_LOG_REG_WIDTH-1:0] imu_rds_error_log_reg_csrbus_read_data;
    // SW read data
input  imu_rds_error_log_reg_hw_ld;  // Hardware load enable for
                                     // imu_rds_error_log_reg. When set, <hw
                                     // write signal>  will be loaded into
                                     // imu_rds_error_log_reg.
// vlint flag_input_port_not_connected off
input  [`FIRE_DLC_IMU_ICS_CSR_IMU_RDS_ERROR_LOG_REG_WIDTH -1:0] imu_rds_error_log_reg_hw_write;
    // data bus for hw loading of imu_rds_error_log_reg.
// vlint flag_input_port_not_connected on

//====================================================================
//     Type declarations
//====================================================================
// synopsys translate_off
  wire omni_ld;  // Omni load
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
  wire [`FIRE_DLC_IMU_ICS_CSR_IMU_RDS_ERROR_LOG_REG_WIDTH - 1:0] omni_data;
    // Omni write data
// synopsys translate_on
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on
wire clk;  // Clock signal
wire por_l;  // Reset signal
wire w_ld;  // SW load
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_RDS_ERROR_LOG_REG_WIDTH-1:0] imu_rds_error_log_reg_csrbus_read_data;
    // SW read data
wire imu_rds_error_log_reg_hw_ld;  // Hardware load enable for
                                   // imu_rds_error_log_reg. When set, <hw write
                                   // signal>  will be loaded into
                                   // imu_rds_error_log_reg.
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_RDS_ERROR_LOG_REG_WIDTH -1:0] imu_rds_error_log_reg_hw_write;
    // data bus for hw loading of imu_rds_error_log_reg.
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on

//====================================================================
//     Logic     
//====================================================================

//----- Reset values
// verilint 531 off
wire [5:0] reset_type = 6'b0;
wire [9:0] reset_length = 10'b0;
wire [15:0] reset_req_id = 16'b0;
wire [7:0] reset_tlp_tag = 8'b0;
wire [7:0] reset_be_mess_code = 8'b0;
wire [15:0] reset_msi_data = 16'b0;
// verilint 531 on

//----- Active high reset wires 
wire por_l_active_high = ~por_l;

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
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_data[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[0]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[0]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[0])
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
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_data[1]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[1]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[1]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[1])
	);

// bit 2
csr_sw csr_sw_2
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[2]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_data[2]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[2]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[2]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[2])
	);

// bit 3
csr_sw csr_sw_3
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[3]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_data[3]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[3]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[3]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[3])
	);

// bit 4
csr_sw csr_sw_4
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[4]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_data[4]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[4]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[4]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[4])
	);

// bit 5
csr_sw csr_sw_5
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[5]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_data[5]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[5]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[5]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[5])
	);

// bit 6
csr_sw csr_sw_6
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[6]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_data[6]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[6]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[6]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[6])
	);

// bit 7
csr_sw csr_sw_7
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[7]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_data[7]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[7]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[7]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[7])
	);

// bit 8
csr_sw csr_sw_8
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[8]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_data[8]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[8]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[8]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[8])
	);

// bit 9
csr_sw csr_sw_9
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[9]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_data[9]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[9]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[9]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[9])
	);

// bit 10
csr_sw csr_sw_10
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[10]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_data[10]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[10]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[10]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[10])
	);

// bit 11
csr_sw csr_sw_11
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[11]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_data[11]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[11]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[11]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[11])
	);

// bit 12
csr_sw csr_sw_12
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[12]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_data[12]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[12]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[12]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[12])
	);

// bit 13
csr_sw csr_sw_13
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[13]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_data[13]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[13]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[13]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[13])
	);

// bit 14
csr_sw csr_sw_14
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[14]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_data[14]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[14]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[14]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[14])
	);

// bit 15
csr_sw csr_sw_15
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[15]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_data[15]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[15]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[15]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[15])
	);

// bit 16
csr_sw csr_sw_16
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[16]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_be_mess_code[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[16]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[16]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[16])
	);

// bit 17
csr_sw csr_sw_17
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[17]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_be_mess_code[1]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[17]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[17]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[17])
	);

// bit 18
csr_sw csr_sw_18
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[18]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_be_mess_code[2]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[18]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[18]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[18])
	);

// bit 19
csr_sw csr_sw_19
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[19]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_be_mess_code[3]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[19]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[19]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[19])
	);

// bit 20
csr_sw csr_sw_20
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[20]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_be_mess_code[4]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[20]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[20]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[20])
	);

// bit 21
csr_sw csr_sw_21
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[21]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_be_mess_code[5]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[21]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[21]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[21])
	);

// bit 22
csr_sw csr_sw_22
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[22]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_be_mess_code[6]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[22]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[22]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[22])
	);

// bit 23
csr_sw csr_sw_23
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[23]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_be_mess_code[7]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[23]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[23]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[23])
	);

// bit 24
csr_sw csr_sw_24
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[24]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tlp_tag[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[24]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[24]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[24])
	);

// bit 25
csr_sw csr_sw_25
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[25]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tlp_tag[1]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[25]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[25]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[25])
	);

// bit 26
csr_sw csr_sw_26
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[26]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tlp_tag[2]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[26]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[26]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[26])
	);

// bit 27
csr_sw csr_sw_27
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[27]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tlp_tag[3]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[27]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[27]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[27])
	);

// bit 28
csr_sw csr_sw_28
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[28]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tlp_tag[4]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[28]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[28]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[28])
	);

// bit 29
csr_sw csr_sw_29
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[29]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tlp_tag[5]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[29]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[29]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[29])
	);

// bit 30
csr_sw csr_sw_30
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[30]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tlp_tag[6]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[30]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[30]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[30])
	);

// bit 31
csr_sw csr_sw_31
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[31]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_tlp_tag[7]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[31]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[31]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[31])
	);

// bit 32
csr_sw csr_sw_32
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[32]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_req_id[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[32]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[32]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[32])
	);

// bit 33
csr_sw csr_sw_33
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[33]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_req_id[1]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[33]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[33]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[33])
	);

// bit 34
csr_sw csr_sw_34
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[34]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_req_id[2]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[34]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[34]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[34])
	);

// bit 35
csr_sw csr_sw_35
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[35]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_req_id[3]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[35]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[35]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[35])
	);

// bit 36
csr_sw csr_sw_36
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[36]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_req_id[4]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[36]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[36]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[36])
	);

// bit 37
csr_sw csr_sw_37
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[37]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_req_id[5]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[37]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[37]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[37])
	);

// bit 38
csr_sw csr_sw_38
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[38]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_req_id[6]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[38]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[38]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[38])
	);

// bit 39
csr_sw csr_sw_39
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[39]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_req_id[7]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[39]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[39]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[39])
	);

// bit 40
csr_sw csr_sw_40
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[40]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_req_id[8]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[40]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[40]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[40])
	);

// bit 41
csr_sw csr_sw_41
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[41]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_req_id[9]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[41]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[41]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[41])
	);

// bit 42
csr_sw csr_sw_42
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[42]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_req_id[10]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[42]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[42]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[42])
	);

// bit 43
csr_sw csr_sw_43
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[43]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_req_id[11]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[43]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[43]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[43])
	);

// bit 44
csr_sw csr_sw_44
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[44]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_req_id[12]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[44]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[44]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[44])
	);

// bit 45
csr_sw csr_sw_45
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[45]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_req_id[13]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[45]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[45]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[45])
	);

// bit 46
csr_sw csr_sw_46
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[46]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_req_id[14]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[46]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[46]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[46])
	);

// bit 47
csr_sw csr_sw_47
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[47]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_req_id[15]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[47]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[47]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[47])
	);

// bit 48
csr_sw csr_sw_48
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[48]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_length[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[48]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[48]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[48])
	);

// bit 49
csr_sw csr_sw_49
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[49]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_length[1]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[49]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[49]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[49])
	);

// bit 50
csr_sw csr_sw_50
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[50]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_length[2]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[50]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[50]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[50])
	);

// bit 51
csr_sw csr_sw_51
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[51]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_length[3]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[51]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[51]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[51])
	);

// bit 52
csr_sw csr_sw_52
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[52]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_length[4]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[52]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[52]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[52])
	);

// bit 53
csr_sw csr_sw_53
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[53]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_length[5]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[53]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[53]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[53])
	);

// bit 54
csr_sw csr_sw_54
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[54]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_length[6]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[54]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[54]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[54])
	);

// bit 55
csr_sw csr_sw_55
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[55]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_length[7]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[55]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[55]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[55])
	);

// bit 56
csr_sw csr_sw_56
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[56]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_length[8]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[56]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[56]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[56])
	);

// bit 57
csr_sw csr_sw_57
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[57]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_length[9]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[57]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[57]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[57])
	);

// bit 58
csr_sw csr_sw_58
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[58]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_type[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[58]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[58]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[58])
	);

// bit 59
csr_sw csr_sw_59
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[59]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_type[1]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[59]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[59]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[59])
	);

// bit 60
csr_sw csr_sw_60
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[60]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_type[2]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[60]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[60]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[60])
	);

// bit 61
csr_sw csr_sw_61
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[61]),
	  .omni_rw_alias   (1'b1),
	  .omni_rw1c_alias (1'b0),
	  .omni_rw1s_alias (1'b0),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_type[3]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[61]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[61]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[61])
	);

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
	.rst            (por_l_active_high),
	.rst_val        (reset_type[4]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[62]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[62]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[62])
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
	.rst            (por_l_active_high),
	.rst_val        (reset_type[5]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[63]),
	.rw_alias       (1'b1),
	.rw1c_alias     (1'b0),
	.rw1s_alias     (1'b0),
	.hw_ld          (imu_rds_error_log_reg_hw_ld),
	.hw_data        (imu_rds_error_log_reg_hw_write[63]),
	.cp             (clk),
	.q              (imu_rds_error_log_reg_csrbus_read_data[63])
	);


endmodule // dmu_imu_ics_csr_imu_rds_error_log_reg_entry
