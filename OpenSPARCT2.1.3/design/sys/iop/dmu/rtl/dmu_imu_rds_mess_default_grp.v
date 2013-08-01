// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_rds_mess_default_grp.v
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
module dmu_imu_rds_mess_default_grp 
	(
	clk,
	err_cor_mapping_v_hw_read,
	err_cor_mapping_eqnum_hw_read,
	err_cor_mapping_select_pulse,
	err_nonfatal_mapping_v_hw_read,
	err_nonfatal_mapping_eqnum_hw_read,
	err_nonfatal_mapping_select_pulse,
	err_fatal_mapping_v_hw_read,
	err_fatal_mapping_eqnum_hw_read,
	err_fatal_mapping_select_pulse,
	pm_pme_mapping_v_hw_read,
	pm_pme_mapping_eqnum_hw_read,
	pm_pme_mapping_select_pulse,
	pme_to_ack_mapping_v_hw_read,
	pme_to_ack_mapping_eqnum_hw_read,
	pme_to_ack_mapping_select_pulse,
	rst_l,
	daemon_csrbus_wr_in,
	daemon_csrbus_wr_data_in,
	read_data_0_out
	);

//====================================================
//     Polarity declarations
//====================================================
input  clk;  // Clock signal
output err_cor_mapping_v_hw_read;  // This signal provides the current value of
                                   // err_cor_mapping_v.
output [`FIRE_DLC_IMU_RDS_MESS_CSR_ERR_COR_MAPPING_EQNUM_INT_SLC] err_cor_mapping_eqnum_hw_read;
    // This signal provides the current value of err_cor_mapping_eqnum.
input  err_cor_mapping_select_pulse;  // select
output err_nonfatal_mapping_v_hw_read;  // This signal provides the current
                                        // value of err_nonfatal_mapping_v.
output [`FIRE_DLC_IMU_RDS_MESS_CSR_ERR_NONFATAL_MAPPING_EQNUM_INT_SLC] err_nonfatal_mapping_eqnum_hw_read;
    // This signal provides the current value of err_nonfatal_mapping_eqnum.
input  err_nonfatal_mapping_select_pulse;  // select
output err_fatal_mapping_v_hw_read;  // This signal provides the current value
                                     // of err_fatal_mapping_v.
output [`FIRE_DLC_IMU_RDS_MESS_CSR_ERR_FATAL_MAPPING_EQNUM_INT_SLC] err_fatal_mapping_eqnum_hw_read;
    // This signal provides the current value of err_fatal_mapping_eqnum.
input  err_fatal_mapping_select_pulse;  // select
output pm_pme_mapping_v_hw_read;  // This signal provides the current value of
                                  // pm_pme_mapping_v.
output [`FIRE_DLC_IMU_RDS_MESS_CSR_PM_PME_MAPPING_EQNUM_INT_SLC] pm_pme_mapping_eqnum_hw_read;
    // This signal provides the current value of pm_pme_mapping_eqnum.
input  pm_pme_mapping_select_pulse;  // select
output pme_to_ack_mapping_v_hw_read;  // This signal provides the current value
                                      // of pme_to_ack_mapping_v.
output [`FIRE_DLC_IMU_RDS_MESS_CSR_PME_TO_ACK_MAPPING_EQNUM_INT_SLC] pme_to_ack_mapping_eqnum_hw_read;
    // This signal provides the current value of pme_to_ack_mapping_eqnum.
input  pme_to_ack_mapping_select_pulse;  // select
input  rst_l;  // HW reset
input  daemon_csrbus_wr_in;  // csrbus_wr
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
output [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data

//====================================================
//     Type declarations
//====================================================
wire clk;  // Clock signal
wire err_cor_mapping_v_hw_read;  // This signal provides the current value of
                                 // err_cor_mapping_v.
wire [`FIRE_DLC_IMU_RDS_MESS_CSR_ERR_COR_MAPPING_EQNUM_INT_SLC] err_cor_mapping_eqnum_hw_read;
    // This signal provides the current value of err_cor_mapping_eqnum.
wire err_cor_mapping_select_pulse;  // select
wire err_nonfatal_mapping_v_hw_read;  // This signal provides the current value
                                      // of err_nonfatal_mapping_v.
wire [`FIRE_DLC_IMU_RDS_MESS_CSR_ERR_NONFATAL_MAPPING_EQNUM_INT_SLC] err_nonfatal_mapping_eqnum_hw_read;
    // This signal provides the current value of err_nonfatal_mapping_eqnum.
wire err_nonfatal_mapping_select_pulse;  // select
wire err_fatal_mapping_v_hw_read;  // This signal provides the current value of
                                   // err_fatal_mapping_v.
wire [`FIRE_DLC_IMU_RDS_MESS_CSR_ERR_FATAL_MAPPING_EQNUM_INT_SLC] err_fatal_mapping_eqnum_hw_read;
    // This signal provides the current value of err_fatal_mapping_eqnum.
wire err_fatal_mapping_select_pulse;  // select
wire pm_pme_mapping_v_hw_read;  // This signal provides the current value of
                                // pm_pme_mapping_v.
wire [`FIRE_DLC_IMU_RDS_MESS_CSR_PM_PME_MAPPING_EQNUM_INT_SLC] pm_pme_mapping_eqnum_hw_read;
    // This signal provides the current value of pm_pme_mapping_eqnum.
wire pm_pme_mapping_select_pulse;  // select
wire pme_to_ack_mapping_v_hw_read;  // This signal provides the current value of
                                    // pme_to_ack_mapping_v.
wire [`FIRE_DLC_IMU_RDS_MESS_CSR_PME_TO_ACK_MAPPING_EQNUM_INT_SLC] pme_to_ack_mapping_eqnum_hw_read;
    // This signal provides the current value of pme_to_ack_mapping_eqnum.
wire pme_to_ack_mapping_select_pulse;  // select
wire rst_l;  // HW reset
wire daemon_csrbus_wr_in;  // csrbus_wr
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data


//====================================================
//   Local signals
//====================================================
//----- For CSR register: err_cor_mapping
wire [`FIRE_DLC_IMU_RDS_MESS_CSR_ERR_COR_MAPPING_WIDTH-1:0] err_cor_mapping_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: err_nonfatal_mapping
wire [`FIRE_DLC_IMU_RDS_MESS_CSR_ERR_NONFATAL_MAPPING_WIDTH-1:0] err_nonfatal_mapping_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: err_fatal_mapping
wire [`FIRE_DLC_IMU_RDS_MESS_CSR_ERR_FATAL_MAPPING_WIDTH-1:0] err_fatal_mapping_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: pm_pme_mapping
wire [`FIRE_DLC_IMU_RDS_MESS_CSR_PM_PME_MAPPING_WIDTH-1:0] pm_pme_mapping_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: pme_to_ack_mapping
wire [`FIRE_DLC_IMU_RDS_MESS_CSR_PME_TO_ACK_MAPPING_WIDTH-1:0] pme_to_ack_mapping_csrbus_read_data;
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
dmu_imu_rds_mess_csrpipe_6 dmu_imu_rds_mess_csrpipe_6_inst_1
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.reg_in	(1'b1),
	.reg_out	(1'b1),
	.data0	(err_cor_mapping_csrbus_read_data),
	.sel0	(err_cor_mapping_select_pulse),
	.data1	(err_nonfatal_mapping_csrbus_read_data),
	.sel1	(err_nonfatal_mapping_select_pulse),
	.data2	(err_fatal_mapping_csrbus_read_data),
	.sel2	(err_fatal_mapping_select_pulse),
	.data3	(pm_pme_mapping_csrbus_read_data),
	.sel3	(pm_pme_mapping_select_pulse),
	.data4	(pme_to_ack_mapping_csrbus_read_data),
	.sel4	(pme_to_ack_mapping_select_pulse),
	.data5	(64'b0),
	.sel5	(1'b1),
	.out	(read_data_0_out)
	);


//====================================================
//     Instantiation of registers
//====================================================

wire err_cor_mapping_w_ld =err_cor_mapping_select_pulse & daemon_csrbus_wr;

dmu_imu_rds_mess_csr_err_cor_mapping err_cor_mapping
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.err_cor_mapping_w_ld	(err_cor_mapping_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.err_cor_mapping_csrbus_read_data	(err_cor_mapping_csrbus_read_data),
	.err_cor_mapping_v_hw_read	(err_cor_mapping_v_hw_read),
	.err_cor_mapping_eqnum_hw_read	(err_cor_mapping_eqnum_hw_read)
	);

wire err_nonfatal_mapping_w_ld =err_nonfatal_mapping_select_pulse & daemon_csrbus_wr;

dmu_imu_rds_mess_csr_err_nonfatal_mapping err_nonfatal_mapping
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.err_nonfatal_mapping_w_ld	(err_nonfatal_mapping_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.err_nonfatal_mapping_csrbus_read_data	(err_nonfatal_mapping_csrbus_read_data),
	.err_nonfatal_mapping_v_hw_read	(err_nonfatal_mapping_v_hw_read),
	.err_nonfatal_mapping_eqnum_hw_read	(err_nonfatal_mapping_eqnum_hw_read)
	);

wire err_fatal_mapping_w_ld =err_fatal_mapping_select_pulse & daemon_csrbus_wr;

dmu_imu_rds_mess_csr_err_fatal_mapping err_fatal_mapping
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.err_fatal_mapping_w_ld	(err_fatal_mapping_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.err_fatal_mapping_csrbus_read_data	(err_fatal_mapping_csrbus_read_data),
	.err_fatal_mapping_v_hw_read	(err_fatal_mapping_v_hw_read),
	.err_fatal_mapping_eqnum_hw_read	(err_fatal_mapping_eqnum_hw_read)
	);

wire pm_pme_mapping_w_ld =pm_pme_mapping_select_pulse & daemon_csrbus_wr;

dmu_imu_rds_mess_csr_pm_pme_mapping pm_pme_mapping
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.pm_pme_mapping_w_ld	(pm_pme_mapping_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.pm_pme_mapping_csrbus_read_data	(pm_pme_mapping_csrbus_read_data),
	.pm_pme_mapping_v_hw_read	(pm_pme_mapping_v_hw_read),
	.pm_pme_mapping_eqnum_hw_read	(pm_pme_mapping_eqnum_hw_read)
	);

wire pme_to_ack_mapping_w_ld =pme_to_ack_mapping_select_pulse & daemon_csrbus_wr;

dmu_imu_rds_mess_csr_pme_to_ack_mapping pme_to_ack_mapping
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.pme_to_ack_mapping_w_ld	(pme_to_ack_mapping_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.pme_to_ack_mapping_csrbus_read_data	(pme_to_ack_mapping_csrbus_read_data),
	.pme_to_ack_mapping_v_hw_read	(pme_to_ack_mapping_v_hw_read),
	.pme_to_ack_mapping_eqnum_hw_read	(pme_to_ack_mapping_eqnum_hw_read)
	);

endmodule // dmu_imu_rds_mess_default_grp
