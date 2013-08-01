// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_ics_csr_imu_logged_error_status_reg.v
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
module dmu_imu_ics_csr_imu_logged_error_status_reg 
	(
	clk,
	por_l,
	imu_logged_error_status_reg_w_ld,
	csrbus_wr_data,
	rw1c_alias,
	rw1s_alias,
	imu_logged_error_status_reg_csrbus_read_data,
	imu_logged_error_status_reg_spare_s_hw_set,
	imu_logged_error_status_reg_spare_s_hw_read,
	imu_logged_error_status_reg_eq_over_s_hw_set,
	imu_logged_error_status_reg_eq_over_s_hw_read,
	imu_logged_error_status_reg_eq_not_en_s_hw_set,
	imu_logged_error_status_reg_eq_not_en_s_hw_read,
	imu_logged_error_status_reg_msi_mal_err_s_hw_set,
	imu_logged_error_status_reg_msi_mal_err_s_hw_read,
	imu_logged_error_status_reg_msi_par_err_s_hw_set,
	imu_logged_error_status_reg_msi_par_err_s_hw_read,
	imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_set,
	imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_read,
	imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_set,
	imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_read,
	imu_logged_error_status_reg_fatal_mes_not_en_s_hw_set,
	imu_logged_error_status_reg_fatal_mes_not_en_s_hw_read,
	imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_set,
	imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_read,
	imu_logged_error_status_reg_cor_mes_not_en_s_hw_set,
	imu_logged_error_status_reg_cor_mes_not_en_s_hw_read,
	imu_logged_error_status_reg_msi_not_en_s_hw_set,
	imu_logged_error_status_reg_msi_not_en_s_hw_read,
	imu_logged_error_status_reg_spare_p_hw_set,
	imu_logged_error_status_reg_spare_p_hw_read,
	imu_logged_error_status_reg_eq_over_p_hw_set,
	imu_logged_error_status_reg_eq_over_p_hw_read,
	imu_logged_error_status_reg_eq_not_en_p_hw_set,
	imu_logged_error_status_reg_eq_not_en_p_hw_read,
	imu_logged_error_status_reg_msi_mal_err_p_hw_set,
	imu_logged_error_status_reg_msi_mal_err_p_hw_read,
	imu_logged_error_status_reg_msi_par_err_p_hw_set,
	imu_logged_error_status_reg_msi_par_err_p_hw_read,
	imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_set,
	imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_read,
	imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_set,
	imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_read,
	imu_logged_error_status_reg_fatal_mes_not_en_p_hw_set,
	imu_logged_error_status_reg_fatal_mes_not_en_p_hw_read,
	imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_set,
	imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_read,
	imu_logged_error_status_reg_cor_mes_not_en_p_hw_set,
	imu_logged_error_status_reg_cor_mes_not_en_p_hw_read,
	imu_logged_error_status_reg_msi_not_en_p_hw_set,
	imu_logged_error_status_reg_msi_not_en_p_hw_read
	);

//====================================================================
//     Polarity declarations
//====================================================================
input  clk;  // Clock
input  por_l;  // Reset signal
input  imu_logged_error_status_reg_w_ld;  // SW load bus
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
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
output [`FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_SPARE_S_INT_SLC]
 imu_logged_error_status_reg_spare_s_hw_read;  // This signal provides the
                                               // current value of
                                               // imu_logged_error_status_reg_spare_s.
input  imu_logged_error_status_reg_eq_over_s_hw_set;  // Hardware set signal for
                                                      // imu_logged_error_status_reg_eq_over_s.
                                                      // When set
                                                      // imu_logged_error_status_reg
                                                      // will be set to one.
output imu_logged_error_status_reg_eq_over_s_hw_read;  // This signal provides
                                                       // the current value of
                                                       // imu_logged_error_status_reg_eq_over_s.
input  imu_logged_error_status_reg_eq_not_en_s_hw_set;  // Hardware set signal
                                                        // for
                                                        // imu_logged_error_status_reg_eq_not_en_s.
                                                        // When set
                                                        // imu_logged_error_status_reg
                                                        // will be set to one.
output imu_logged_error_status_reg_eq_not_en_s_hw_read;  // This signal provides
                                                         // the current value of
                                                         // imu_logged_error_status_reg_eq_not_en_s.
input  imu_logged_error_status_reg_msi_mal_err_s_hw_set;  // Hardware set signal
                                                          // for
                                                          // imu_logged_error_status_reg_msi_mal_err_s.
                                                          // When set
                                                          // imu_logged_error_status_reg
                                                          // will be set to one.
output imu_logged_error_status_reg_msi_mal_err_s_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // imu_logged_error_status_reg_msi_mal_err_s.
input  imu_logged_error_status_reg_msi_par_err_s_hw_set;  // Hardware set signal
                                                          // for
                                                          // imu_logged_error_status_reg_msi_par_err_s.
                                                          // When set
                                                          // imu_logged_error_status_reg
                                                          // will be set to one.
output imu_logged_error_status_reg_msi_par_err_s_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // imu_logged_error_status_reg_msi_par_err_s.
input  imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_set;  // Hardware set
                                                                // signal for
                                                                // imu_logged_error_status_reg_pmeack_mes_not_en_s.
                                                                // When set
                                                                // imu_logged_error_status_reg
                                                                // will be set
                                                                // to one.
output imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_read;  // This signal
                                                                 // provides the
                                                                 // current
                                                                 // value of
                                                                 // imu_logged_error_status_reg_pmeack_mes_not_en_s.
input  imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_set;  // Hardware set
                                                               // signal for
                                                               // imu_logged_error_status_reg_pmpme_mes_not_en_s.
                                                               // When set
                                                               // imu_logged_error_status_reg
                                                               // will be set to
                                                               // one.
output imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_read;  // This signal
                                                                // provides the
                                                                // current value
                                                                // of
                                                                // imu_logged_error_status_reg_pmpme_mes_not_en_s.
input  imu_logged_error_status_reg_fatal_mes_not_en_s_hw_set;  // Hardware set
                                                               // signal for
                                                               // imu_logged_error_status_reg_fatal_mes_not_en_s.
                                                               // When set
                                                               // imu_logged_error_status_reg
                                                               // will be set to
                                                               // one.
output imu_logged_error_status_reg_fatal_mes_not_en_s_hw_read;  // This signal
                                                                // provides the
                                                                // current value
                                                                // of
                                                                // imu_logged_error_status_reg_fatal_mes_not_en_s.
input  imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_set;  // Hardware
                                                                  // set signal
                                                                  // for
                                                                  // imu_logged_error_status_reg_nonfatal_mes_not_en_s.
                                                                  // When set
                                                                  // imu_logged_error_status_reg
                                                                  // will be set
                                                                  // to one.
output imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_read;
    // This signal provides the current value of
    // imu_logged_error_status_reg_nonfatal_mes_not_en_s.
input  imu_logged_error_status_reg_cor_mes_not_en_s_hw_set;  // Hardware set
                                                             // signal for
                                                             // imu_logged_error_status_reg_cor_mes_not_en_s.
                                                             // When set
                                                             // imu_logged_error_status_reg
                                                             // will be set to
                                                             // one.
output imu_logged_error_status_reg_cor_mes_not_en_s_hw_read;  // This signal
                                                              // provides the
                                                              // current value
                                                              // of
                                                              // imu_logged_error_status_reg_cor_mes_not_en_s.
input  imu_logged_error_status_reg_msi_not_en_s_hw_set;  // Hardware set signal
                                                         // for
                                                         // imu_logged_error_status_reg_msi_not_en_s.
                                                         // When set
                                                         // imu_logged_error_status_reg
                                                         // will be set to one.
output imu_logged_error_status_reg_msi_not_en_s_hw_read;  // This signal
                                                          // provides the
                                                          // current value of
                                                          // imu_logged_error_status_reg_msi_not_en_s.
input  [`FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_SPARE_P_INT_SLC]
 imu_logged_error_status_reg_spare_p_hw_set;  // Hardware set signal for
                                              // imu_logged_error_status_reg_spare_p.
                                              // When set
                                              // imu_logged_error_status_reg
                                              // will be set to one.
output [`FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_SPARE_P_INT_SLC]
 imu_logged_error_status_reg_spare_p_hw_read;  // This signal provides the
                                               // current value of
                                               // imu_logged_error_status_reg_spare_p.
input  imu_logged_error_status_reg_eq_over_p_hw_set;  // Hardware set signal for
                                                      // imu_logged_error_status_reg_eq_over_p.
                                                      // When set
                                                      // imu_logged_error_status_reg
                                                      // will be set to one.
output imu_logged_error_status_reg_eq_over_p_hw_read;  // This signal provides
                                                       // the current value of
                                                       // imu_logged_error_status_reg_eq_over_p.
input  imu_logged_error_status_reg_eq_not_en_p_hw_set;  // Hardware set signal
                                                        // for
                                                        // imu_logged_error_status_reg_eq_not_en_p.
                                                        // When set
                                                        // imu_logged_error_status_reg
                                                        // will be set to one.
output imu_logged_error_status_reg_eq_not_en_p_hw_read;  // This signal provides
                                                         // the current value of
                                                         // imu_logged_error_status_reg_eq_not_en_p.
input  imu_logged_error_status_reg_msi_mal_err_p_hw_set;  // Hardware set signal
                                                          // for
                                                          // imu_logged_error_status_reg_msi_mal_err_p.
                                                          // When set
                                                          // imu_logged_error_status_reg
                                                          // will be set to one.
output imu_logged_error_status_reg_msi_mal_err_p_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // imu_logged_error_status_reg_msi_mal_err_p.
input  imu_logged_error_status_reg_msi_par_err_p_hw_set;  // Hardware set signal
                                                          // for
                                                          // imu_logged_error_status_reg_msi_par_err_p.
                                                          // When set
                                                          // imu_logged_error_status_reg
                                                          // will be set to one.
output imu_logged_error_status_reg_msi_par_err_p_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // imu_logged_error_status_reg_msi_par_err_p.
input  imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_set;  // Hardware set
                                                                // signal for
                                                                // imu_logged_error_status_reg_pmeack_mes_not_en_p.
                                                                // When set
                                                                // imu_logged_error_status_reg
                                                                // will be set
                                                                // to one.
output imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_read;  // This signal
                                                                 // provides the
                                                                 // current
                                                                 // value of
                                                                 // imu_logged_error_status_reg_pmeack_mes_not_en_p.
input  imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_set;  // Hardware set
                                                               // signal for
                                                               // imu_logged_error_status_reg_pmpme_mes_not_en_p.
                                                               // When set
                                                               // imu_logged_error_status_reg
                                                               // will be set to
                                                               // one.
output imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_read;  // This signal
                                                                // provides the
                                                                // current value
                                                                // of
                                                                // imu_logged_error_status_reg_pmpme_mes_not_en_p.
input  imu_logged_error_status_reg_fatal_mes_not_en_p_hw_set;  // Hardware set
                                                               // signal for
                                                               // imu_logged_error_status_reg_fatal_mes_not_en_p.
                                                               // When set
                                                               // imu_logged_error_status_reg
                                                               // will be set to
                                                               // one.
output imu_logged_error_status_reg_fatal_mes_not_en_p_hw_read;  // This signal
                                                                // provides the
                                                                // current value
                                                                // of
                                                                // imu_logged_error_status_reg_fatal_mes_not_en_p.
input  imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_set;  // Hardware
                                                                  // set signal
                                                                  // for
                                                                  // imu_logged_error_status_reg_nonfatal_mes_not_en_p.
                                                                  // When set
                                                                  // imu_logged_error_status_reg
                                                                  // will be set
                                                                  // to one.
output imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_read;
    // This signal provides the current value of
    // imu_logged_error_status_reg_nonfatal_mes_not_en_p.
input  imu_logged_error_status_reg_cor_mes_not_en_p_hw_set;  // Hardware set
                                                             // signal for
                                                             // imu_logged_error_status_reg_cor_mes_not_en_p.
                                                             // When set
                                                             // imu_logged_error_status_reg
                                                             // will be set to
                                                             // one.
output imu_logged_error_status_reg_cor_mes_not_en_p_hw_read;  // This signal
                                                              // provides the
                                                              // current value
                                                              // of
                                                              // imu_logged_error_status_reg_cor_mes_not_en_p.
input  imu_logged_error_status_reg_msi_not_en_p_hw_set;  // Hardware set signal
                                                         // for
                                                         // imu_logged_error_status_reg_msi_not_en_p.
                                                         // When set
                                                         // imu_logged_error_status_reg
                                                         // will be set to one.
output imu_logged_error_status_reg_msi_not_en_p_hw_read;  // This signal
                                                          // provides the
                                                          // current value of
                                                          // imu_logged_error_status_reg_msi_not_en_p.

//====================================================================
//     Type declarations
//====================================================================
wire clk;  // Clock
wire por_l;  // Reset signal
wire imu_logged_error_status_reg_w_ld;  // SW load bus
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
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
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_SPARE_S_INT_SLC]
 imu_logged_error_status_reg_spare_s_hw_read;  // This signal provides the
                                               // current value of
                                               // imu_logged_error_status_reg_spare_s.
wire imu_logged_error_status_reg_eq_over_s_hw_set;  // Hardware set signal for
                                                    // imu_logged_error_status_reg_eq_over_s.
                                                    // When set
                                                    // imu_logged_error_status_reg
                                                    // will be set to one.
wire imu_logged_error_status_reg_eq_over_s_hw_read;  // This signal provides the
                                                     // current value of
                                                     // imu_logged_error_status_reg_eq_over_s.
wire imu_logged_error_status_reg_eq_not_en_s_hw_set;  // Hardware set signal for
                                                      // imu_logged_error_status_reg_eq_not_en_s.
                                                      // When set
                                                      // imu_logged_error_status_reg
                                                      // will be set to one.
wire imu_logged_error_status_reg_eq_not_en_s_hw_read;  // This signal provides
                                                       // the current value of
                                                       // imu_logged_error_status_reg_eq_not_en_s.
wire imu_logged_error_status_reg_msi_mal_err_s_hw_set;  // Hardware set signal
                                                        // for
                                                        // imu_logged_error_status_reg_msi_mal_err_s.
                                                        // When set
                                                        // imu_logged_error_status_reg
                                                        // will be set to one.
wire imu_logged_error_status_reg_msi_mal_err_s_hw_read;  // This signal provides
                                                         // the current value of
                                                         // imu_logged_error_status_reg_msi_mal_err_s.
wire imu_logged_error_status_reg_msi_par_err_s_hw_set;  // Hardware set signal
                                                        // for
                                                        // imu_logged_error_status_reg_msi_par_err_s.
                                                        // When set
                                                        // imu_logged_error_status_reg
                                                        // will be set to one.
wire imu_logged_error_status_reg_msi_par_err_s_hw_read;  // This signal provides
                                                         // the current value of
                                                         // imu_logged_error_status_reg_msi_par_err_s.
wire imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_set;  // Hardware set
                                                              // signal for
                                                              // imu_logged_error_status_reg_pmeack_mes_not_en_s.
                                                              // When set
                                                              // imu_logged_error_status_reg
                                                              // will be set to
                                                              // one.
wire imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_read;  // This signal
                                                               // provides the
                                                               // current value
                                                               // of
                                                               // imu_logged_error_status_reg_pmeack_mes_not_en_s.
wire imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_set;  // Hardware set
                                                             // signal for
                                                             // imu_logged_error_status_reg_pmpme_mes_not_en_s.
                                                             // When set
                                                             // imu_logged_error_status_reg
                                                             // will be set to
                                                             // one.
wire imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_read;  // This signal
                                                              // provides the
                                                              // current value
                                                              // of
                                                              // imu_logged_error_status_reg_pmpme_mes_not_en_s.
wire imu_logged_error_status_reg_fatal_mes_not_en_s_hw_set;  // Hardware set
                                                             // signal for
                                                             // imu_logged_error_status_reg_fatal_mes_not_en_s.
                                                             // When set
                                                             // imu_logged_error_status_reg
                                                             // will be set to
                                                             // one.
wire imu_logged_error_status_reg_fatal_mes_not_en_s_hw_read;  // This signal
                                                              // provides the
                                                              // current value
                                                              // of
                                                              // imu_logged_error_status_reg_fatal_mes_not_en_s.
wire imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_set;  // Hardware set
                                                                // signal for
                                                                // imu_logged_error_status_reg_nonfatal_mes_not_en_s.
                                                                // When set
                                                                // imu_logged_error_status_reg
                                                                // will be set
                                                                // to one.
wire imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_read;  // This signal
                                                                 // provides the
                                                                 // current
                                                                 // value of
                                                                 // imu_logged_error_status_reg_nonfatal_mes_not_en_s.
wire imu_logged_error_status_reg_cor_mes_not_en_s_hw_set;  // Hardware set
                                                           // signal for
                                                           // imu_logged_error_status_reg_cor_mes_not_en_s.
                                                           // When set
                                                           // imu_logged_error_status_reg
                                                           // will be set to
                                                           // one.
wire imu_logged_error_status_reg_cor_mes_not_en_s_hw_read;  // This signal
                                                            // provides the
                                                            // current value of
                                                            // imu_logged_error_status_reg_cor_mes_not_en_s.
wire imu_logged_error_status_reg_msi_not_en_s_hw_set;  // Hardware set signal
                                                       // for
                                                       // imu_logged_error_status_reg_msi_not_en_s.
                                                       // When set
                                                       // imu_logged_error_status_reg
                                                       // will be set to one.
wire imu_logged_error_status_reg_msi_not_en_s_hw_read;  // This signal provides
                                                        // the current value of
                                                        // imu_logged_error_status_reg_msi_not_en_s.
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_SPARE_P_INT_SLC]
 imu_logged_error_status_reg_spare_p_hw_set;  // Hardware set signal for
                                              // imu_logged_error_status_reg_spare_p.
                                              // When set
                                              // imu_logged_error_status_reg
                                              // will be set to one.
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_SPARE_P_INT_SLC]
 imu_logged_error_status_reg_spare_p_hw_read;  // This signal provides the
                                               // current value of
                                               // imu_logged_error_status_reg_spare_p.
wire imu_logged_error_status_reg_eq_over_p_hw_set;  // Hardware set signal for
                                                    // imu_logged_error_status_reg_eq_over_p.
                                                    // When set
                                                    // imu_logged_error_status_reg
                                                    // will be set to one.
wire imu_logged_error_status_reg_eq_over_p_hw_read;  // This signal provides the
                                                     // current value of
                                                     // imu_logged_error_status_reg_eq_over_p.
wire imu_logged_error_status_reg_eq_not_en_p_hw_set;  // Hardware set signal for
                                                      // imu_logged_error_status_reg_eq_not_en_p.
                                                      // When set
                                                      // imu_logged_error_status_reg
                                                      // will be set to one.
wire imu_logged_error_status_reg_eq_not_en_p_hw_read;  // This signal provides
                                                       // the current value of
                                                       // imu_logged_error_status_reg_eq_not_en_p.
wire imu_logged_error_status_reg_msi_mal_err_p_hw_set;  // Hardware set signal
                                                        // for
                                                        // imu_logged_error_status_reg_msi_mal_err_p.
                                                        // When set
                                                        // imu_logged_error_status_reg
                                                        // will be set to one.
wire imu_logged_error_status_reg_msi_mal_err_p_hw_read;  // This signal provides
                                                         // the current value of
                                                         // imu_logged_error_status_reg_msi_mal_err_p.
wire imu_logged_error_status_reg_msi_par_err_p_hw_set;  // Hardware set signal
                                                        // for
                                                        // imu_logged_error_status_reg_msi_par_err_p.
                                                        // When set
                                                        // imu_logged_error_status_reg
                                                        // will be set to one.
wire imu_logged_error_status_reg_msi_par_err_p_hw_read;  // This signal provides
                                                         // the current value of
                                                         // imu_logged_error_status_reg_msi_par_err_p.
wire imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_set;  // Hardware set
                                                              // signal for
                                                              // imu_logged_error_status_reg_pmeack_mes_not_en_p.
                                                              // When set
                                                              // imu_logged_error_status_reg
                                                              // will be set to
                                                              // one.
wire imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_read;  // This signal
                                                               // provides the
                                                               // current value
                                                               // of
                                                               // imu_logged_error_status_reg_pmeack_mes_not_en_p.
wire imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_set;  // Hardware set
                                                             // signal for
                                                             // imu_logged_error_status_reg_pmpme_mes_not_en_p.
                                                             // When set
                                                             // imu_logged_error_status_reg
                                                             // will be set to
                                                             // one.
wire imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_read;  // This signal
                                                              // provides the
                                                              // current value
                                                              // of
                                                              // imu_logged_error_status_reg_pmpme_mes_not_en_p.
wire imu_logged_error_status_reg_fatal_mes_not_en_p_hw_set;  // Hardware set
                                                             // signal for
                                                             // imu_logged_error_status_reg_fatal_mes_not_en_p.
                                                             // When set
                                                             // imu_logged_error_status_reg
                                                             // will be set to
                                                             // one.
wire imu_logged_error_status_reg_fatal_mes_not_en_p_hw_read;  // This signal
                                                              // provides the
                                                              // current value
                                                              // of
                                                              // imu_logged_error_status_reg_fatal_mes_not_en_p.
wire imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_set;  // Hardware set
                                                                // signal for
                                                                // imu_logged_error_status_reg_nonfatal_mes_not_en_p.
                                                                // When set
                                                                // imu_logged_error_status_reg
                                                                // will be set
                                                                // to one.
wire imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_read;  // This signal
                                                                 // provides the
                                                                 // current
                                                                 // value of
                                                                 // imu_logged_error_status_reg_nonfatal_mes_not_en_p.
wire imu_logged_error_status_reg_cor_mes_not_en_p_hw_set;  // Hardware set
                                                           // signal for
                                                           // imu_logged_error_status_reg_cor_mes_not_en_p.
                                                           // When set
                                                           // imu_logged_error_status_reg
                                                           // will be set to
                                                           // one.
wire imu_logged_error_status_reg_cor_mes_not_en_p_hw_read;  // This signal
                                                            // provides the
                                                            // current value of
                                                            // imu_logged_error_status_reg_cor_mes_not_en_p.
wire imu_logged_error_status_reg_msi_not_en_p_hw_set;  // Hardware set signal
                                                       // for
                                                       // imu_logged_error_status_reg_msi_not_en_p.
                                                       // When set
                                                       // imu_logged_error_status_reg
                                                       // will be set to one.
wire imu_logged_error_status_reg_msi_not_en_p_hw_read;  // This signal provides
                                                        // the current value of
                                                        // imu_logged_error_status_reg_msi_not_en_p.

//====================================================================
//     Logic     
//====================================================================

// synopsys translate_off
// verilint 123 off
// verilint 498 off
reg omni_ld;
reg [`FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_WIDTH-1:0] omni_data;
reg omni_rw1c_alias;
reg omni_rw1s_alias;

// vlint flag_unsynthesizable_initial off
initial
  begin
     omni_ld         = 1'b0;
     omni_data       = `FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_WIDTH'b0;
     omni_rw1c_alias   = 1'b0;
     omni_rw1s_alias   = 1'b0;
  end// vlint flag_unsynthesizable_initial on

// verilint 123 on
// verilint 498 on
// synopsys translate_on

//----- Hardware Data Out Mux Assignments
assign imu_logged_error_status_reg_spare_s_hw_read=
           imu_logged_error_status_reg_csrbus_read_data
               [`FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_SPARE_S_SLC];
assign imu_logged_error_status_reg_eq_over_s_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [41];
assign imu_logged_error_status_reg_eq_not_en_s_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [40];
assign imu_logged_error_status_reg_msi_mal_err_s_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [39];
assign imu_logged_error_status_reg_msi_par_err_s_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [38];
assign imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [37];
assign imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [36];
assign imu_logged_error_status_reg_fatal_mes_not_en_s_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [35];
assign imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [34];
assign imu_logged_error_status_reg_cor_mes_not_en_s_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [33];
assign imu_logged_error_status_reg_msi_not_en_s_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [32];
assign imu_logged_error_status_reg_spare_p_hw_read=
           imu_logged_error_status_reg_csrbus_read_data
               [`FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_SPARE_P_SLC];
assign imu_logged_error_status_reg_eq_over_p_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [9];
assign imu_logged_error_status_reg_eq_not_en_p_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [8];
assign imu_logged_error_status_reg_msi_mal_err_p_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [7];
assign imu_logged_error_status_reg_msi_par_err_p_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [6];
assign imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [5];
assign imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [4];
assign imu_logged_error_status_reg_fatal_mes_not_en_p_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [3];
assign imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [2];
assign imu_logged_error_status_reg_cor_mes_not_en_p_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [1];
assign imu_logged_error_status_reg_msi_not_en_p_hw_read=
           imu_logged_error_status_reg_csrbus_read_data [0];

//====================================================================
//     Instantiation of entries
//====================================================================

//----- Entry 0
dmu_imu_ics_csr_imu_logged_error_status_reg_entry imu_logged_error_status_reg_0
	(
	// synopsys translate_off
	  .omni_ld	(omni_ld),
	  .omni_data	(omni_data),
	  .omni_rw1c_alias	(omni_rw1c_alias),
	  .omni_rw1s_alias	(omni_rw1s_alias),
	// synopsys translate_on
	.clk	(clk),
	.por_l	(por_l),
	.w_ld	(imu_logged_error_status_reg_w_ld),
	.csrbus_wr_data	(csrbus_wr_data),
	.rw1c_alias	(rw1c_alias),
	.rw1s_alias	(rw1s_alias),
	.imu_logged_error_status_reg_csrbus_read_data	(imu_logged_error_status_reg_csrbus_read_data),
	.imu_logged_error_status_reg_spare_s_hw_set	(imu_logged_error_status_reg_spare_s_hw_set),
	.imu_logged_error_status_reg_eq_over_s_hw_set	(imu_logged_error_status_reg_eq_over_s_hw_set),
	.imu_logged_error_status_reg_eq_not_en_s_hw_set	(imu_logged_error_status_reg_eq_not_en_s_hw_set),
	.imu_logged_error_status_reg_msi_mal_err_s_hw_set	(imu_logged_error_status_reg_msi_mal_err_s_hw_set),
	.imu_logged_error_status_reg_msi_par_err_s_hw_set	(imu_logged_error_status_reg_msi_par_err_s_hw_set),
	.imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_set	(imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_set),
	.imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_set	(imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_set),
	.imu_logged_error_status_reg_fatal_mes_not_en_s_hw_set	(imu_logged_error_status_reg_fatal_mes_not_en_s_hw_set),
	.imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_set	(imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_set),
	.imu_logged_error_status_reg_cor_mes_not_en_s_hw_set	(imu_logged_error_status_reg_cor_mes_not_en_s_hw_set),
	.imu_logged_error_status_reg_msi_not_en_s_hw_set	(imu_logged_error_status_reg_msi_not_en_s_hw_set),
	.imu_logged_error_status_reg_spare_p_hw_set	(imu_logged_error_status_reg_spare_p_hw_set),
	.imu_logged_error_status_reg_eq_over_p_hw_set	(imu_logged_error_status_reg_eq_over_p_hw_set),
	.imu_logged_error_status_reg_eq_not_en_p_hw_set	(imu_logged_error_status_reg_eq_not_en_p_hw_set),
	.imu_logged_error_status_reg_msi_mal_err_p_hw_set	(imu_logged_error_status_reg_msi_mal_err_p_hw_set),
	.imu_logged_error_status_reg_msi_par_err_p_hw_set	(imu_logged_error_status_reg_msi_par_err_p_hw_set),
	.imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_set	(imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_set),
	.imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_set	(imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_set),
	.imu_logged_error_status_reg_fatal_mes_not_en_p_hw_set	(imu_logged_error_status_reg_fatal_mes_not_en_p_hw_set),
	.imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_set	(imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_set),
	.imu_logged_error_status_reg_cor_mes_not_en_p_hw_set	(imu_logged_error_status_reg_cor_mes_not_en_p_hw_set),
	.imu_logged_error_status_reg_msi_not_en_p_hw_set	(imu_logged_error_status_reg_msi_not_en_p_hw_set)
	);

endmodule // dmu_imu_ics_csr_imu_logged_error_status_reg
