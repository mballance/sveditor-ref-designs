// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_ics_csr_imu_logged_error_status_reg_entry.v
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
module dmu_imu_ics_csr_imu_logged_error_status_reg_entry 
	(
	// synopsys translate_off
	  omni_ld,
	  omni_data,
	  omni_rw1c_alias,
	  omni_rw1s_alias,
	// synopsys translate_on
	clk,
	por_l,
	w_ld,
	csrbus_wr_data,
	rw1c_alias,
	rw1s_alias,
	imu_logged_error_status_reg_csrbus_read_data,
	imu_logged_error_status_reg_spare_s_hw_set,
	imu_logged_error_status_reg_eq_over_s_hw_set,
	imu_logged_error_status_reg_eq_not_en_s_hw_set,
	imu_logged_error_status_reg_msi_mal_err_s_hw_set,
	imu_logged_error_status_reg_msi_par_err_s_hw_set,
	imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_set,
	imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_set,
	imu_logged_error_status_reg_fatal_mes_not_en_s_hw_set,
	imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_set,
	imu_logged_error_status_reg_cor_mes_not_en_s_hw_set,
	imu_logged_error_status_reg_msi_not_en_s_hw_set,
	imu_logged_error_status_reg_spare_p_hw_set,
	imu_logged_error_status_reg_eq_over_p_hw_set,
	imu_logged_error_status_reg_eq_not_en_p_hw_set,
	imu_logged_error_status_reg_msi_mal_err_p_hw_set,
	imu_logged_error_status_reg_msi_par_err_p_hw_set,
	imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_set,
	imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_set,
	imu_logged_error_status_reg_fatal_mes_not_en_p_hw_set,
	imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_set,
	imu_logged_error_status_reg_cor_mes_not_en_p_hw_set,
	imu_logged_error_status_reg_msi_not_en_p_hw_set
	);

//====================================================================
//     Polarity declarations
//====================================================================
// synopsys translate_off
  input  omni_ld;  // Omni load
// vlint flag_input_port_not_connected off
  input  [`FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_WIDTH - 1:0] omni_data;
    // Omni write data
// vlint flag_input_port_not_connected on
  input  omni_rw1c_alias;  // Omni load type: write-one-to-clear
  input  omni_rw1s_alias;  // Omni load type: write-one-to-set
// synopsys translate_on
input  clk;  // Clock signal
input  por_l;  // Reset signal
input  w_ld;  // SW load
// vlint flag_input_port_not_connected off
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
// vlint flag_input_port_not_connected on
input  rw1c_alias;  // SW load type: write-one-to-clear
input  rw1s_alias;  // SW load type: write-one-to-set
output [`FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_WIDTH-1:0]
 imu_logged_error_status_reg_csrbus_read_data;  // SW read data
input  [`FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_SPARE_S_INT_SLC]
 imu_logged_error_status_reg_spare_s_hw_set;  // Hardware set signal for
                                              // imu_logged_error_status_reg_spare_s.
                                              // When set
                                              // imu_logged_error_status_reg
                                              // will be set to one.
input  imu_logged_error_status_reg_eq_over_s_hw_set;  // Hardware set signal for
                                                      // imu_logged_error_status_reg_eq_over_s.
                                                      // When set
                                                      // imu_logged_error_status_reg
                                                      // will be set to one.
input  imu_logged_error_status_reg_eq_not_en_s_hw_set;  // Hardware set signal
                                                        // for
                                                        // imu_logged_error_status_reg_eq_not_en_s.
                                                        // When set
                                                        // imu_logged_error_status_reg
                                                        // will be set to one.
input  imu_logged_error_status_reg_msi_mal_err_s_hw_set;  // Hardware set signal
                                                          // for
                                                          // imu_logged_error_status_reg_msi_mal_err_s.
                                                          // When set
                                                          // imu_logged_error_status_reg
                                                          // will be set to one.
input  imu_logged_error_status_reg_msi_par_err_s_hw_set;  // Hardware set signal
                                                          // for
                                                          // imu_logged_error_status_reg_msi_par_err_s.
                                                          // When set
                                                          // imu_logged_error_status_reg
                                                          // will be set to one.
input  imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_set;  // Hardware set
                                                                // signal for
                                                                // imu_logged_error_status_reg_pmeack_mes_not_en_s.
                                                                // When set
                                                                // imu_logged_error_status_reg
                                                                // will be set
                                                                // to one.
input  imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_set;  // Hardware set
                                                               // signal for
                                                               // imu_logged_error_status_reg_pmpme_mes_not_en_s.
                                                               // When set
                                                               // imu_logged_error_status_reg
                                                               // will be set to
                                                               // one.
input  imu_logged_error_status_reg_fatal_mes_not_en_s_hw_set;  // Hardware set
                                                               // signal for
                                                               // imu_logged_error_status_reg_fatal_mes_not_en_s.
                                                               // When set
                                                               // imu_logged_error_status_reg
                                                               // will be set to
                                                               // one.
input  imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_set;  // Hardware
                                                                  // set signal
                                                                  // for
                                                                  // imu_logged_error_status_reg_nonfatal_mes_not_en_s.
                                                                  // When set
                                                                  // imu_logged_error_status_reg
                                                                  // will be set
                                                                  // to one.
input  imu_logged_error_status_reg_cor_mes_not_en_s_hw_set;  // Hardware set
                                                             // signal for
                                                             // imu_logged_error_status_reg_cor_mes_not_en_s.
                                                             // When set
                                                             // imu_logged_error_status_reg
                                                             // will be set to
                                                             // one.
input  imu_logged_error_status_reg_msi_not_en_s_hw_set;  // Hardware set signal
                                                         // for
                                                         // imu_logged_error_status_reg_msi_not_en_s.
                                                         // When set
                                                         // imu_logged_error_status_reg
                                                         // will be set to one.
input  [`FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_SPARE_P_INT_SLC]
 imu_logged_error_status_reg_spare_p_hw_set;  // Hardware set signal for
                                              // imu_logged_error_status_reg_spare_p.
                                              // When set
                                              // imu_logged_error_status_reg
                                              // will be set to one.
input  imu_logged_error_status_reg_eq_over_p_hw_set;  // Hardware set signal for
                                                      // imu_logged_error_status_reg_eq_over_p.
                                                      // When set
                                                      // imu_logged_error_status_reg
                                                      // will be set to one.
input  imu_logged_error_status_reg_eq_not_en_p_hw_set;  // Hardware set signal
                                                        // for
                                                        // imu_logged_error_status_reg_eq_not_en_p.
                                                        // When set
                                                        // imu_logged_error_status_reg
                                                        // will be set to one.
input  imu_logged_error_status_reg_msi_mal_err_p_hw_set;  // Hardware set signal
                                                          // for
                                                          // imu_logged_error_status_reg_msi_mal_err_p.
                                                          // When set
                                                          // imu_logged_error_status_reg
                                                          // will be set to one.
input  imu_logged_error_status_reg_msi_par_err_p_hw_set;  // Hardware set signal
                                                          // for
                                                          // imu_logged_error_status_reg_msi_par_err_p.
                                                          // When set
                                                          // imu_logged_error_status_reg
                                                          // will be set to one.
input  imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_set;  // Hardware set
                                                                // signal for
                                                                // imu_logged_error_status_reg_pmeack_mes_not_en_p.
                                                                // When set
                                                                // imu_logged_error_status_reg
                                                                // will be set
                                                                // to one.
input  imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_set;  // Hardware set
                                                               // signal for
                                                               // imu_logged_error_status_reg_pmpme_mes_not_en_p.
                                                               // When set
                                                               // imu_logged_error_status_reg
                                                               // will be set to
                                                               // one.
input  imu_logged_error_status_reg_fatal_mes_not_en_p_hw_set;  // Hardware set
                                                               // signal for
                                                               // imu_logged_error_status_reg_fatal_mes_not_en_p.
                                                               // When set
                                                               // imu_logged_error_status_reg
                                                               // will be set to
                                                               // one.
input  imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_set;  // Hardware
                                                                  // set signal
                                                                  // for
                                                                  // imu_logged_error_status_reg_nonfatal_mes_not_en_p.
                                                                  // When set
                                                                  // imu_logged_error_status_reg
                                                                  // will be set
                                                                  // to one.
input  imu_logged_error_status_reg_cor_mes_not_en_p_hw_set;  // Hardware set
                                                             // signal for
                                                             // imu_logged_error_status_reg_cor_mes_not_en_p.
                                                             // When set
                                                             // imu_logged_error_status_reg
                                                             // will be set to
                                                             // one.
input  imu_logged_error_status_reg_msi_not_en_p_hw_set;  // Hardware set signal
                                                         // for
                                                         // imu_logged_error_status_reg_msi_not_en_p.
                                                         // When set
                                                         // imu_logged_error_status_reg
                                                         // will be set to one.

//====================================================================
//     Type declarations
//====================================================================
// synopsys translate_off
  wire omni_ld;  // Omni load
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
  wire [`FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_WIDTH - 1:0] omni_data;
    // Omni write data
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on
  wire omni_rw1c_alias;  // Omni load type: write-one-to-clear
  wire omni_rw1s_alias;  // Omni load type: write-one-to-set
// synopsys translate_on
wire clk;  // Clock signal
wire por_l;  // Reset signal
wire w_ld;  // SW load
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on
wire rw1c_alias;  // SW load type: write-one-to-clear
wire rw1s_alias;  // SW load type: write-one-to-set
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_WIDTH-1:0]
 imu_logged_error_status_reg_csrbus_read_data;  // SW read data
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_SPARE_S_INT_SLC]
 imu_logged_error_status_reg_spare_s_hw_set;  // Hardware set signal for
                                              // imu_logged_error_status_reg_spare_s.
                                              // When set
                                              // imu_logged_error_status_reg
                                              // will be set to one.
wire imu_logged_error_status_reg_eq_over_s_hw_set;  // Hardware set signal for
                                                    // imu_logged_error_status_reg_eq_over_s.
                                                    // When set
                                                    // imu_logged_error_status_reg
                                                    // will be set to one.
wire imu_logged_error_status_reg_eq_not_en_s_hw_set;  // Hardware set signal for
                                                      // imu_logged_error_status_reg_eq_not_en_s.
                                                      // When set
                                                      // imu_logged_error_status_reg
                                                      // will be set to one.
wire imu_logged_error_status_reg_msi_mal_err_s_hw_set;  // Hardware set signal
                                                        // for
                                                        // imu_logged_error_status_reg_msi_mal_err_s.
                                                        // When set
                                                        // imu_logged_error_status_reg
                                                        // will be set to one.
wire imu_logged_error_status_reg_msi_par_err_s_hw_set;  // Hardware set signal
                                                        // for
                                                        // imu_logged_error_status_reg_msi_par_err_s.
                                                        // When set
                                                        // imu_logged_error_status_reg
                                                        // will be set to one.
wire imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_set;  // Hardware set
                                                              // signal for
                                                              // imu_logged_error_status_reg_pmeack_mes_not_en_s.
                                                              // When set
                                                              // imu_logged_error_status_reg
                                                              // will be set to
                                                              // one.
wire imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_set;  // Hardware set
                                                             // signal for
                                                             // imu_logged_error_status_reg_pmpme_mes_not_en_s.
                                                             // When set
                                                             // imu_logged_error_status_reg
                                                             // will be set to
                                                             // one.
wire imu_logged_error_status_reg_fatal_mes_not_en_s_hw_set;  // Hardware set
                                                             // signal for
                                                             // imu_logged_error_status_reg_fatal_mes_not_en_s.
                                                             // When set
                                                             // imu_logged_error_status_reg
                                                             // will be set to
                                                             // one.
wire imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_set;  // Hardware set
                                                                // signal for
                                                                // imu_logged_error_status_reg_nonfatal_mes_not_en_s.
                                                                // When set
                                                                // imu_logged_error_status_reg
                                                                // will be set
                                                                // to one.
wire imu_logged_error_status_reg_cor_mes_not_en_s_hw_set;  // Hardware set
                                                           // signal for
                                                           // imu_logged_error_status_reg_cor_mes_not_en_s.
                                                           // When set
                                                           // imu_logged_error_status_reg
                                                           // will be set to
                                                           // one.
wire imu_logged_error_status_reg_msi_not_en_s_hw_set;  // Hardware set signal
                                                       // for
                                                       // imu_logged_error_status_reg_msi_not_en_s.
                                                       // When set
                                                       // imu_logged_error_status_reg
                                                       // will be set to one.
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_SPARE_P_INT_SLC]
 imu_logged_error_status_reg_spare_p_hw_set;  // Hardware set signal for
                                              // imu_logged_error_status_reg_spare_p.
                                              // When set
                                              // imu_logged_error_status_reg
                                              // will be set to one.
wire imu_logged_error_status_reg_eq_over_p_hw_set;  // Hardware set signal for
                                                    // imu_logged_error_status_reg_eq_over_p.
                                                    // When set
                                                    // imu_logged_error_status_reg
                                                    // will be set to one.
wire imu_logged_error_status_reg_eq_not_en_p_hw_set;  // Hardware set signal for
                                                      // imu_logged_error_status_reg_eq_not_en_p.
                                                      // When set
                                                      // imu_logged_error_status_reg
                                                      // will be set to one.
wire imu_logged_error_status_reg_msi_mal_err_p_hw_set;  // Hardware set signal
                                                        // for
                                                        // imu_logged_error_status_reg_msi_mal_err_p.
                                                        // When set
                                                        // imu_logged_error_status_reg
                                                        // will be set to one.
wire imu_logged_error_status_reg_msi_par_err_p_hw_set;  // Hardware set signal
                                                        // for
                                                        // imu_logged_error_status_reg_msi_par_err_p.
                                                        // When set
                                                        // imu_logged_error_status_reg
                                                        // will be set to one.
wire imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_set;  // Hardware set
                                                              // signal for
                                                              // imu_logged_error_status_reg_pmeack_mes_not_en_p.
                                                              // When set
                                                              // imu_logged_error_status_reg
                                                              // will be set to
                                                              // one.
wire imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_set;  // Hardware set
                                                             // signal for
                                                             // imu_logged_error_status_reg_pmpme_mes_not_en_p.
                                                             // When set
                                                             // imu_logged_error_status_reg
                                                             // will be set to
                                                             // one.
wire imu_logged_error_status_reg_fatal_mes_not_en_p_hw_set;  // Hardware set
                                                             // signal for
                                                             // imu_logged_error_status_reg_fatal_mes_not_en_p.
                                                             // When set
                                                             // imu_logged_error_status_reg
                                                             // will be set to
                                                             // one.
wire imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_set;  // Hardware set
                                                                // signal for
                                                                // imu_logged_error_status_reg_nonfatal_mes_not_en_p.
                                                                // When set
                                                                // imu_logged_error_status_reg
                                                                // will be set
                                                                // to one.
wire imu_logged_error_status_reg_cor_mes_not_en_p_hw_set;  // Hardware set
                                                           // signal for
                                                           // imu_logged_error_status_reg_cor_mes_not_en_p.
                                                           // When set
                                                           // imu_logged_error_status_reg
                                                           // will be set to
                                                           // one.
wire imu_logged_error_status_reg_msi_not_en_p_hw_set;  // Hardware set signal
                                                       // for
                                                       // imu_logged_error_status_reg_msi_not_en_p.
                                                       // When set
                                                       // imu_logged_error_status_reg
                                                       // will be set to one.

//====================================================================
//     Logic     
//====================================================================

//----- Reset values
// verilint 531 off
wire [4:0] reset_spare_s = 5'h0;
wire [0:0] reset_eq_over_s = 1'h0;
wire [0:0] reset_eq_not_en_s = 1'h0;
wire [0:0] reset_msi_mal_err_s = 1'h0;
wire [0:0] reset_msi_par_err_s = 1'h0;
wire [0:0] reset_pmeack_mes_not_en_s = 1'h0;
wire [0:0] reset_pmpme_mes_not_en_s = 1'h0;
wire [0:0] reset_fatal_mes_not_en_s = 1'h0;
wire [0:0] reset_nonfatal_mes_not_en_s = 1'h0;
wire [0:0] reset_cor_mes_not_en_s = 1'h0;
wire [0:0] reset_msi_not_en_s = 1'h0;
wire [4:0] reset_spare_p = 5'h0;
wire [0:0] reset_eq_over_p = 1'h0;
wire [0:0] reset_eq_not_en_p = 1'h0;
wire [0:0] reset_msi_mal_err_p = 1'h0;
wire [0:0] reset_msi_par_err_p = 1'h0;
wire [0:0] reset_pmeack_mes_not_en_p = 1'h0;
wire [0:0] reset_pmpme_mes_not_en_p = 1'h0;
wire [0:0] reset_fatal_mes_not_en_p = 1'h0;
wire [0:0] reset_nonfatal_mes_not_en_p = 1'h0;
wire [0:0] reset_cor_mes_not_en_p = 1'h0;
wire [0:0] reset_msi_not_en_p = 1'h0;
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
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_not_en_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[0]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_msi_not_en_p_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[0])
	);

// bit 1
csr_sw csr_sw_1
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[1]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_cor_mes_not_en_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[1]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_cor_mes_not_en_p_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[1])
	);

// bit 2
csr_sw csr_sw_2
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[2]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_nonfatal_mes_not_en_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[2]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[2])
	);

// bit 3
csr_sw csr_sw_3
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[3]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_fatal_mes_not_en_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[3]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_fatal_mes_not_en_p_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[3])
	);

// bit 4
csr_sw csr_sw_4
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[4]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_pmpme_mes_not_en_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[4]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[4])
	);

// bit 5
csr_sw csr_sw_5
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[5]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_pmeack_mes_not_en_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[5]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[5])
	);

// bit 6
csr_sw csr_sw_6
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[6]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_par_err_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[6]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_msi_par_err_p_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[6])
	);

// bit 7
csr_sw csr_sw_7
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[7]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_mal_err_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[7]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_msi_mal_err_p_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[7])
	);

// bit 8
csr_sw csr_sw_8
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[8]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_eq_not_en_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[8]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_eq_not_en_p_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[8])
	);

// bit 9
csr_sw csr_sw_9
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[9]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_eq_over_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[9]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_eq_over_p_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[9])
	);

// bit 10
csr_sw csr_sw_10
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[10]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_spare_p[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[10]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_spare_p_hw_set[0]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[10])
	);

// bit 11
csr_sw csr_sw_11
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[11]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_spare_p[1]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[11]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_spare_p_hw_set[1]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[11])
	);

// bit 12
csr_sw csr_sw_12
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[12]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_spare_p[2]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[12]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_spare_p_hw_set[2]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[12])
	);

// bit 13
csr_sw csr_sw_13
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[13]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_spare_p[3]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[13]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_spare_p_hw_set[3]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[13])
	);

// bit 14
csr_sw csr_sw_14
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[14]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_spare_p[4]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[14]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_spare_p_hw_set[4]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[14])
	);

assign  imu_logged_error_status_reg_csrbus_read_data[15] = 1'b0;  // bit 15
assign  imu_logged_error_status_reg_csrbus_read_data[16] = 1'b0;  // bit 16
assign  imu_logged_error_status_reg_csrbus_read_data[17] = 1'b0;  // bit 17
assign  imu_logged_error_status_reg_csrbus_read_data[18] = 1'b0;  // bit 18
assign  imu_logged_error_status_reg_csrbus_read_data[19] = 1'b0;  // bit 19
assign  imu_logged_error_status_reg_csrbus_read_data[20] = 1'b0;  // bit 20
assign  imu_logged_error_status_reg_csrbus_read_data[21] = 1'b0;  // bit 21
assign  imu_logged_error_status_reg_csrbus_read_data[22] = 1'b0;  // bit 22
assign  imu_logged_error_status_reg_csrbus_read_data[23] = 1'b0;  // bit 23
assign  imu_logged_error_status_reg_csrbus_read_data[24] = 1'b0;  // bit 24
assign  imu_logged_error_status_reg_csrbus_read_data[25] = 1'b0;  // bit 25
assign  imu_logged_error_status_reg_csrbus_read_data[26] = 1'b0;  // bit 26
assign  imu_logged_error_status_reg_csrbus_read_data[27] = 1'b0;  // bit 27
assign  imu_logged_error_status_reg_csrbus_read_data[28] = 1'b0;  // bit 28
assign  imu_logged_error_status_reg_csrbus_read_data[29] = 1'b0;  // bit 29
assign  imu_logged_error_status_reg_csrbus_read_data[30] = 1'b0;  // bit 30
assign  imu_logged_error_status_reg_csrbus_read_data[31] = 1'b0;  // bit 31
// bit 32
csr_sw csr_sw_32
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[32]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_not_en_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[32]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_msi_not_en_s_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[32])
	);

// bit 33
csr_sw csr_sw_33
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[33]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_cor_mes_not_en_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[33]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_cor_mes_not_en_s_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[33])
	);

// bit 34
csr_sw csr_sw_34
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[34]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_nonfatal_mes_not_en_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[34]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[34])
	);

// bit 35
csr_sw csr_sw_35
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[35]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_fatal_mes_not_en_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[35]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_fatal_mes_not_en_s_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[35])
	);

// bit 36
csr_sw csr_sw_36
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[36]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_pmpme_mes_not_en_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[36]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[36])
	);

// bit 37
csr_sw csr_sw_37
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[37]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_pmeack_mes_not_en_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[37]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[37])
	);

// bit 38
csr_sw csr_sw_38
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[38]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_par_err_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[38]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_msi_par_err_s_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[38])
	);

// bit 39
csr_sw csr_sw_39
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[39]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_msi_mal_err_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[39]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_msi_mal_err_s_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[39])
	);

// bit 40
csr_sw csr_sw_40
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[40]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_eq_not_en_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[40]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_eq_not_en_s_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[40])
	);

// bit 41
csr_sw csr_sw_41
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[41]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_eq_over_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[41]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_eq_over_s_hw_set),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[41])
	);

// bit 42
csr_sw csr_sw_42
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[42]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_spare_s[0]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[42]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_spare_s_hw_set[0]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[42])
	);

// bit 43
csr_sw csr_sw_43
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[43]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_spare_s[1]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[43]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_spare_s_hw_set[1]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[43])
	);

// bit 44
csr_sw csr_sw_44
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[44]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_spare_s[2]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[44]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_spare_s_hw_set[2]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[44])
	);

// bit 45
csr_sw csr_sw_45
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[45]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_spare_s[3]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[45]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_spare_s_hw_set[3]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[45])
	);

// bit 46
csr_sw csr_sw_46
	(
	// synopsys translate_off
	  .omni_ld        (omni_ld),
	  .omni_data      (omni_data[46]),
	  .omni_rw_alias   (1'b0),
	  .omni_rw1c_alias (omni_rw1c_alias),
	  .omni_rw1s_alias (omni_rw1s_alias),
	// synopsys translate_on
	.rst            (por_l_active_high),
	.rst_val        (reset_spare_s[4]),
	.csr_ld         (w_ld),
	.csr_data       (csrbus_wr_data[46]),
	.rw_alias       (1'b0),
	.rw1c_alias     (rw1c_alias),
	.rw1s_alias     (rw1s_alias),
	.hw_ld          (imu_logged_error_status_reg_spare_s_hw_set[4]),
	.hw_data        (1'b1),
	.cp             (clk),
	.q              (imu_logged_error_status_reg_csrbus_read_data[46])
	);

assign  imu_logged_error_status_reg_csrbus_read_data[47] = 1'b0;  // bit 47
assign  imu_logged_error_status_reg_csrbus_read_data[48] = 1'b0;  // bit 48
assign  imu_logged_error_status_reg_csrbus_read_data[49] = 1'b0;  // bit 49
assign  imu_logged_error_status_reg_csrbus_read_data[50] = 1'b0;  // bit 50
assign  imu_logged_error_status_reg_csrbus_read_data[51] = 1'b0;  // bit 51
assign  imu_logged_error_status_reg_csrbus_read_data[52] = 1'b0;  // bit 52
assign  imu_logged_error_status_reg_csrbus_read_data[53] = 1'b0;  // bit 53
assign  imu_logged_error_status_reg_csrbus_read_data[54] = 1'b0;  // bit 54
assign  imu_logged_error_status_reg_csrbus_read_data[55] = 1'b0;  // bit 55
assign  imu_logged_error_status_reg_csrbus_read_data[56] = 1'b0;  // bit 56
assign  imu_logged_error_status_reg_csrbus_read_data[57] = 1'b0;  // bit 57
assign  imu_logged_error_status_reg_csrbus_read_data[58] = 1'b0;  // bit 58
assign  imu_logged_error_status_reg_csrbus_read_data[59] = 1'b0;  // bit 59
assign  imu_logged_error_status_reg_csrbus_read_data[60] = 1'b0;  // bit 60
assign  imu_logged_error_status_reg_csrbus_read_data[61] = 1'b0;  // bit 61
assign  imu_logged_error_status_reg_csrbus_read_data[62] = 1'b0;  // bit 62
assign  imu_logged_error_status_reg_csrbus_read_data[63] = 1'b0;  // bit 63

endmodule // dmu_imu_ics_csr_imu_logged_error_status_reg_entry
