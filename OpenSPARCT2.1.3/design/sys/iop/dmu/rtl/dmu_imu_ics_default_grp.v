// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_ics_default_grp.v
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
module dmu_imu_ics_default_grp 
	(
	clk,
	imu_error_log_en_reg_spare_log_en_hw_read,
	imu_error_log_en_reg_eq_over_log_en_hw_read,
	imu_error_log_en_reg_eq_not_en_log_en_hw_read,
	imu_error_log_en_reg_msi_mal_err_log_en_hw_read,
	imu_error_log_en_reg_msi_par_err_log_en_hw_read,
	imu_error_log_en_reg_pmeack_mes_not_en_log_en_hw_read,
	imu_error_log_en_reg_pmpme_mes_not_en_log_en_hw_read,
	imu_error_log_en_reg_fatal_mes_not_en_log_en_hw_read,
	imu_error_log_en_reg_nonfatal_mes_not_en_log_en_hw_read,
	imu_error_log_en_reg_cor_mes_not_en_log_en_hw_read,
	imu_error_log_en_reg_msi_not_en_log_en_hw_read,
	imu_error_log_en_reg_select_pulse,
	imu_int_en_reg_spare_s_int_en_hw_read,
	imu_int_en_reg_eq_over_s_int_en_hw_read,
	imu_int_en_reg_eq_not_en_s_int_en_hw_read,
	imu_int_en_reg_msi_mal_err_s_int_en_hw_read,
	imu_int_en_reg_msi_par_err_s_int_en_hw_read,
	imu_int_en_reg_pmeack_mes_not_en_s_int_en_hw_read,
	imu_int_en_reg_pmpme_mes_not_en_s_int_en_hw_read,
	imu_int_en_reg_fatal_mes_not_en_s_int_en_hw_read,
	imu_int_en_reg_nonfatal_mes_not_en_s_int_en_hw_read,
	imu_int_en_reg_cor_mes_not_en_s_int_en_hw_read,
	imu_int_en_reg_msi_not_en_s_int_en_hw_read,
	imu_int_en_reg_spare_p_int_en_hw_read,
	imu_int_en_reg_eq_over_p_int_en_hw_read,
	imu_int_en_reg_eq_not_en_p_int_en_hw_read,
	imu_int_en_reg_msi_mal_err_p_int_en_hw_read,
	imu_int_en_reg_msi_par_err_p_int_en_hw_read,
	imu_int_en_reg_pmeack_mes_not_en_p_int_en_hw_read,
	imu_int_en_reg_pmpme_mes_not_en_p_int_en_hw_read,
	imu_int_en_reg_fatal_mes_not_en_p_int_en_hw_read,
	imu_int_en_reg_nonfatal_mes_not_en_p_int_en_hw_read,
	imu_int_en_reg_cor_mes_not_en_p_int_en_hw_read,
	imu_int_en_reg_msi_not_en_p_int_en_hw_read,
	imu_int_en_reg_select_pulse,
	imu_enabled_error_status_reg_select,
	imu_enabled_error_status_reg_ext_read_data,
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
	imu_logged_error_status_reg_msi_not_en_p_hw_read,
	imu_logged_error_status_reg_select_pulse,
	imu_rds_error_log_reg_hw_ld,
	imu_rds_error_log_reg_hw_write,
	imu_rds_error_log_reg_select_pulse,
	imu_scs_error_log_reg_hw_ld,
	imu_scs_error_log_reg_hw_write,
	imu_scs_error_log_reg_select_pulse,
	imu_eqs_error_log_reg_hw_ld,
	imu_eqs_error_log_reg_hw_write,
	imu_eqs_error_log_reg_select_pulse,
	dmc_interrupt_mask_reg_dmc_hw_read,
	dmc_interrupt_mask_reg_debug_trig_en_hw_read,
	dmc_interrupt_mask_reg_mmu_hw_read,
	dmc_interrupt_mask_reg_imu_hw_read,
	dmc_interrupt_mask_reg_select_pulse,
	dmc_interrupt_status_reg_select,
	dmc_interrupt_status_reg_ext_read_data,
	imu_perf_cntrl_sel1_hw_read,
	imu_perf_cntrl_sel0_hw_read,
	imu_perf_cntrl_select_pulse,
	imu_perf_cnt0_cnt_hw_write,
	imu_perf_cnt0_cnt_hw_read,
	imu_perf_cnt0_select_pulse,
	imu_perf_cnt1_cnt_hw_write,
	imu_perf_cnt1_cnt_hw_read,
	imu_perf_cnt1_select_pulse,
	msi_32_addr_reg_addr_hw_read,
	msi_32_addr_reg_select_pulse,
	msi_64_addr_reg_addr_hw_read,
	msi_64_addr_reg_select_pulse,
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
	mem_64_pcie_offset_reg_spare_status_hw_read,
	mem_64_pcie_offset_reg_select_pulse,
	imu_logged_error_status_reg_rw1c_alias,
	imu_logged_error_status_reg_rw1s_alias,
	rst_l,
	por_l,
	daemon_csrbus_wr_in,
	daemon_csrbus_wr_data_in,
	read_data_0_out
	);

//====================================================
//     Polarity declarations
//====================================================
input  clk;  // Clock signal
output [`FIRE_DLC_IMU_ICS_CSR_IMU_ERROR_LOG_EN_REG_SPARE_LOG_EN_INT_SLC] imu_error_log_en_reg_spare_log_en_hw_read;
    // This signal provides the current value of
    // imu_error_log_en_reg_spare_log_en.
output imu_error_log_en_reg_eq_over_log_en_hw_read;  // This signal provides the
                                                     // current value of
                                                     // imu_error_log_en_reg_eq_over_log_en.
output imu_error_log_en_reg_eq_not_en_log_en_hw_read;  // This signal provides
                                                       // the current value of
                                                       // imu_error_log_en_reg_eq_not_en_log_en.
output imu_error_log_en_reg_msi_mal_err_log_en_hw_read;  // This signal provides
                                                         // the current value of
                                                         // imu_error_log_en_reg_msi_mal_err_log_en.
output imu_error_log_en_reg_msi_par_err_log_en_hw_read;  // This signal provides
                                                         // the current value of
                                                         // imu_error_log_en_reg_msi_par_err_log_en.
output imu_error_log_en_reg_pmeack_mes_not_en_log_en_hw_read;  // This signal
                                                               // provides the
                                                               // current value
                                                               // of
                                                               // imu_error_log_en_reg_pmeack_mes_not_en_log_en.
output imu_error_log_en_reg_pmpme_mes_not_en_log_en_hw_read;  // This signal
                                                              // provides the
                                                              // current value
                                                              // of
                                                              // imu_error_log_en_reg_pmpme_mes_not_en_log_en.
output imu_error_log_en_reg_fatal_mes_not_en_log_en_hw_read;  // This signal
                                                              // provides the
                                                              // current value
                                                              // of
                                                              // imu_error_log_en_reg_fatal_mes_not_en_log_en.
output imu_error_log_en_reg_nonfatal_mes_not_en_log_en_hw_read;  // This signal
                                                                 // provides the
                                                                 // current
                                                                 // value of
                                                                 // imu_error_log_en_reg_nonfatal_mes_not_en_log_en.
output imu_error_log_en_reg_cor_mes_not_en_log_en_hw_read;  // This signal
                                                            // provides the
                                                            // current value of
                                                            // imu_error_log_en_reg_cor_mes_not_en_log_en.
output imu_error_log_en_reg_msi_not_en_log_en_hw_read;  // This signal provides
                                                        // the current value of
                                                        // imu_error_log_en_reg_msi_not_en_log_en.
input  imu_error_log_en_reg_select_pulse;  // select
output [`FIRE_DLC_IMU_ICS_CSR_IMU_INT_EN_REG_SPARE_S_INT_EN_INT_SLC] imu_int_en_reg_spare_s_int_en_hw_read;
    // This signal provides the current value of imu_int_en_reg_spare_s_int_en.
output imu_int_en_reg_eq_over_s_int_en_hw_read;  // This signal provides the
                                                 // current value of
                                                 // imu_int_en_reg_eq_over_s_int_en.
output imu_int_en_reg_eq_not_en_s_int_en_hw_read;  // This signal provides the
                                                   // current value of
                                                   // imu_int_en_reg_eq_not_en_s_int_en.
output imu_int_en_reg_msi_mal_err_s_int_en_hw_read;  // This signal provides the
                                                     // current value of
                                                     // imu_int_en_reg_msi_mal_err_s_int_en.
output imu_int_en_reg_msi_par_err_s_int_en_hw_read;  // This signal provides the
                                                     // current value of
                                                     // imu_int_en_reg_msi_par_err_s_int_en.
output imu_int_en_reg_pmeack_mes_not_en_s_int_en_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // imu_int_en_reg_pmeack_mes_not_en_s_int_en.
output imu_int_en_reg_pmpme_mes_not_en_s_int_en_hw_read;  // This signal
                                                          // provides the
                                                          // current value of
                                                          // imu_int_en_reg_pmpme_mes_not_en_s_int_en.
output imu_int_en_reg_fatal_mes_not_en_s_int_en_hw_read;  // This signal
                                                          // provides the
                                                          // current value of
                                                          // imu_int_en_reg_fatal_mes_not_en_s_int_en.
output imu_int_en_reg_nonfatal_mes_not_en_s_int_en_hw_read;  // This signal
                                                             // provides the
                                                             // current value of
                                                             // imu_int_en_reg_nonfatal_mes_not_en_s_int_en.
output imu_int_en_reg_cor_mes_not_en_s_int_en_hw_read;  // This signal provides
                                                        // the current value of
                                                        // imu_int_en_reg_cor_mes_not_en_s_int_en.
output imu_int_en_reg_msi_not_en_s_int_en_hw_read;  // This signal provides the
                                                    // current value of
                                                    // imu_int_en_reg_msi_not_en_s_int_en.
output [`FIRE_DLC_IMU_ICS_CSR_IMU_INT_EN_REG_SPARE_P_INT_EN_INT_SLC] imu_int_en_reg_spare_p_int_en_hw_read;
    // This signal provides the current value of imu_int_en_reg_spare_p_int_en.
output imu_int_en_reg_eq_over_p_int_en_hw_read;  // This signal provides the
                                                 // current value of
                                                 // imu_int_en_reg_eq_over_p_int_en.
output imu_int_en_reg_eq_not_en_p_int_en_hw_read;  // This signal provides the
                                                   // current value of
                                                   // imu_int_en_reg_eq_not_en_p_int_en.
output imu_int_en_reg_msi_mal_err_p_int_en_hw_read;  // This signal provides the
                                                     // current value of
                                                     // imu_int_en_reg_msi_mal_err_p_int_en.
output imu_int_en_reg_msi_par_err_p_int_en_hw_read;  // This signal provides the
                                                     // current value of
                                                     // imu_int_en_reg_msi_par_err_p_int_en.
output imu_int_en_reg_pmeack_mes_not_en_p_int_en_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // imu_int_en_reg_pmeack_mes_not_en_p_int_en.
output imu_int_en_reg_pmpme_mes_not_en_p_int_en_hw_read;  // This signal
                                                          // provides the
                                                          // current value of
                                                          // imu_int_en_reg_pmpme_mes_not_en_p_int_en.
output imu_int_en_reg_fatal_mes_not_en_p_int_en_hw_read;  // This signal
                                                          // provides the
                                                          // current value of
                                                          // imu_int_en_reg_fatal_mes_not_en_p_int_en.
output imu_int_en_reg_nonfatal_mes_not_en_p_int_en_hw_read;  // This signal
                                                             // provides the
                                                             // current value of
                                                             // imu_int_en_reg_nonfatal_mes_not_en_p_int_en.
output imu_int_en_reg_cor_mes_not_en_p_int_en_hw_read;  // This signal provides
                                                        // the current value of
                                                        // imu_int_en_reg_cor_mes_not_en_p_int_en.
output imu_int_en_reg_msi_not_en_p_int_en_hw_read;  // This signal provides the
                                                    // current value of
                                                    // imu_int_en_reg_msi_not_en_p_int_en.
input  imu_int_en_reg_select_pulse;  // select
input  imu_enabled_error_status_reg_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] imu_enabled_error_status_reg_ext_read_data;
    // Read Data
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
input  imu_logged_error_status_reg_select_pulse;  // select
input  imu_rds_error_log_reg_hw_ld;  // Hardware load enable for
                                     // imu_rds_error_log_reg. When set, <hw
                                     // write signal>  will be loaded into
                                     // imu_rds_error_log_reg.
input  [`FIRE_DLC_IMU_ICS_CSR_IMU_RDS_ERROR_LOG_REG_WIDTH-1:0] imu_rds_error_log_reg_hw_write;
    // data bus for hw loading of imu_rds_error_log_reg.
input  imu_rds_error_log_reg_select_pulse;  // select
input  imu_scs_error_log_reg_hw_ld;  // Hardware load enable for
                                     // imu_scs_error_log_reg. When set, <hw
                                     // write signal>  will be loaded into
                                     // imu_scs_error_log_reg.
input  [`FIRE_DLC_IMU_ICS_CSR_IMU_SCS_ERROR_LOG_REG_WIDTH-1:0] imu_scs_error_log_reg_hw_write;
    // data bus for hw loading of imu_scs_error_log_reg.
input  imu_scs_error_log_reg_select_pulse;  // select
input  imu_eqs_error_log_reg_hw_ld;  // Hardware load enable for
                                     // imu_eqs_error_log_reg. When set, <hw
                                     // write signal>  will be loaded into
                                     // imu_eqs_error_log_reg.
input  [`FIRE_DLC_IMU_ICS_CSR_IMU_EQS_ERROR_LOG_REG_WIDTH-1:0] imu_eqs_error_log_reg_hw_write;
    // data bus for hw loading of imu_eqs_error_log_reg.
input  imu_eqs_error_log_reg_select_pulse;  // select
output dmc_interrupt_mask_reg_dmc_hw_read;  // This signal provides the current
                                            // value of
                                            // dmc_interrupt_mask_reg_dmc.
output dmc_interrupt_mask_reg_debug_trig_en_hw_read;  // This signal provides
                                                      // the current value of
                                                      // dmc_interrupt_mask_reg_debug_trig_en.
output dmc_interrupt_mask_reg_mmu_hw_read;  // This signal provides the current
                                            // value of
                                            // dmc_interrupt_mask_reg_mmu.
output dmc_interrupt_mask_reg_imu_hw_read;  // This signal provides the current
                                            // value of
                                            // dmc_interrupt_mask_reg_imu.
input  dmc_interrupt_mask_reg_select_pulse;  // select
input  dmc_interrupt_status_reg_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] dmc_interrupt_status_reg_ext_read_data;
    // Read Data
output [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNTRL_SEL1_INT_SLC] imu_perf_cntrl_sel1_hw_read;
    // This signal provides the current value of imu_perf_cntrl_sel1.
output [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNTRL_SEL0_INT_SLC] imu_perf_cntrl_sel0_hw_read;
    // This signal provides the current value of imu_perf_cntrl_sel0.
input  imu_perf_cntrl_select_pulse;  // select
input  [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNT0_CNT_INT_SLC] imu_perf_cnt0_cnt_hw_write;
    // data bus for hw loading of imu_perf_cnt0_cnt.
output [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNT0_CNT_INT_SLC] imu_perf_cnt0_cnt_hw_read;
    // This signal provides the current value of imu_perf_cnt0_cnt.
input  imu_perf_cnt0_select_pulse;  // select
input  [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNT1_CNT_INT_SLC] imu_perf_cnt1_cnt_hw_write;
    // data bus for hw loading of imu_perf_cnt1_cnt.
output [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNT1_CNT_INT_SLC] imu_perf_cnt1_cnt_hw_read;
    // This signal provides the current value of imu_perf_cnt1_cnt.
input  imu_perf_cnt1_select_pulse;  // select
output [`FIRE_DLC_IMU_ICS_CSR_MSI_32_ADDR_REG_ADDR_INT_SLC] msi_32_addr_reg_addr_hw_read;
    // This signal provides the current value of msi_32_addr_reg_addr.
input  msi_32_addr_reg_select_pulse;  // select
output [`FIRE_DLC_IMU_ICS_CSR_MSI_64_ADDR_REG_ADDR_INT_SLC] msi_64_addr_reg_addr_hw_read;
    // This signal provides the current value of msi_64_addr_reg_addr.
input  msi_64_addr_reg_select_pulse;  // select
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
input  mem_64_pcie_offset_reg_select_pulse;  // select
input  imu_logged_error_status_reg_rw1c_alias;  // SW load
input  imu_logged_error_status_reg_rw1s_alias;  // SW load
input  rst_l;  // HW reset
input  por_l;  // HW reset
input  daemon_csrbus_wr_in;  // csrbus_wr
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
output [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data

//====================================================
//     Type declarations
//====================================================
wire clk;  // Clock signal
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_ERROR_LOG_EN_REG_SPARE_LOG_EN_INT_SLC] imu_error_log_en_reg_spare_log_en_hw_read;
    // This signal provides the current value of
    // imu_error_log_en_reg_spare_log_en.
wire imu_error_log_en_reg_eq_over_log_en_hw_read;  // This signal provides the
                                                   // current value of
                                                   // imu_error_log_en_reg_eq_over_log_en.
wire imu_error_log_en_reg_eq_not_en_log_en_hw_read;  // This signal provides the
                                                     // current value of
                                                     // imu_error_log_en_reg_eq_not_en_log_en.
wire imu_error_log_en_reg_msi_mal_err_log_en_hw_read;  // This signal provides
                                                       // the current value of
                                                       // imu_error_log_en_reg_msi_mal_err_log_en.
wire imu_error_log_en_reg_msi_par_err_log_en_hw_read;  // This signal provides
                                                       // the current value of
                                                       // imu_error_log_en_reg_msi_par_err_log_en.
wire imu_error_log_en_reg_pmeack_mes_not_en_log_en_hw_read;  // This signal
                                                             // provides the
                                                             // current value of
                                                             // imu_error_log_en_reg_pmeack_mes_not_en_log_en.
wire imu_error_log_en_reg_pmpme_mes_not_en_log_en_hw_read;  // This signal
                                                            // provides the
                                                            // current value of
                                                            // imu_error_log_en_reg_pmpme_mes_not_en_log_en.
wire imu_error_log_en_reg_fatal_mes_not_en_log_en_hw_read;  // This signal
                                                            // provides the
                                                            // current value of
                                                            // imu_error_log_en_reg_fatal_mes_not_en_log_en.
wire imu_error_log_en_reg_nonfatal_mes_not_en_log_en_hw_read;  // This signal
                                                               // provides the
                                                               // current value
                                                               // of
                                                               // imu_error_log_en_reg_nonfatal_mes_not_en_log_en.
wire imu_error_log_en_reg_cor_mes_not_en_log_en_hw_read;  // This signal
                                                          // provides the
                                                          // current value of
                                                          // imu_error_log_en_reg_cor_mes_not_en_log_en.
wire imu_error_log_en_reg_msi_not_en_log_en_hw_read;  // This signal provides
                                                      // the current value of
                                                      // imu_error_log_en_reg_msi_not_en_log_en.
wire imu_error_log_en_reg_select_pulse;  // select
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_INT_EN_REG_SPARE_S_INT_EN_INT_SLC] imu_int_en_reg_spare_s_int_en_hw_read;
    // This signal provides the current value of imu_int_en_reg_spare_s_int_en.
wire imu_int_en_reg_eq_over_s_int_en_hw_read;  // This signal provides the
                                               // current value of
                                               // imu_int_en_reg_eq_over_s_int_en.
wire imu_int_en_reg_eq_not_en_s_int_en_hw_read;  // This signal provides the
                                                 // current value of
                                                 // imu_int_en_reg_eq_not_en_s_int_en.
wire imu_int_en_reg_msi_mal_err_s_int_en_hw_read;  // This signal provides the
                                                   // current value of
                                                   // imu_int_en_reg_msi_mal_err_s_int_en.
wire imu_int_en_reg_msi_par_err_s_int_en_hw_read;  // This signal provides the
                                                   // current value of
                                                   // imu_int_en_reg_msi_par_err_s_int_en.
wire imu_int_en_reg_pmeack_mes_not_en_s_int_en_hw_read;  // This signal provides
                                                         // the current value of
                                                         // imu_int_en_reg_pmeack_mes_not_en_s_int_en.
wire imu_int_en_reg_pmpme_mes_not_en_s_int_en_hw_read;  // This signal provides
                                                        // the current value of
                                                        // imu_int_en_reg_pmpme_mes_not_en_s_int_en.
wire imu_int_en_reg_fatal_mes_not_en_s_int_en_hw_read;  // This signal provides
                                                        // the current value of
                                                        // imu_int_en_reg_fatal_mes_not_en_s_int_en.
wire imu_int_en_reg_nonfatal_mes_not_en_s_int_en_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // imu_int_en_reg_nonfatal_mes_not_en_s_int_en.
wire imu_int_en_reg_cor_mes_not_en_s_int_en_hw_read;  // This signal provides
                                                      // the current value of
                                                      // imu_int_en_reg_cor_mes_not_en_s_int_en.
wire imu_int_en_reg_msi_not_en_s_int_en_hw_read;  // This signal provides the
                                                  // current value of
                                                  // imu_int_en_reg_msi_not_en_s_int_en.
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_INT_EN_REG_SPARE_P_INT_EN_INT_SLC] imu_int_en_reg_spare_p_int_en_hw_read;
    // This signal provides the current value of imu_int_en_reg_spare_p_int_en.
wire imu_int_en_reg_eq_over_p_int_en_hw_read;  // This signal provides the
                                               // current value of
                                               // imu_int_en_reg_eq_over_p_int_en.
wire imu_int_en_reg_eq_not_en_p_int_en_hw_read;  // This signal provides the
                                                 // current value of
                                                 // imu_int_en_reg_eq_not_en_p_int_en.
wire imu_int_en_reg_msi_mal_err_p_int_en_hw_read;  // This signal provides the
                                                   // current value of
                                                   // imu_int_en_reg_msi_mal_err_p_int_en.
wire imu_int_en_reg_msi_par_err_p_int_en_hw_read;  // This signal provides the
                                                   // current value of
                                                   // imu_int_en_reg_msi_par_err_p_int_en.
wire imu_int_en_reg_pmeack_mes_not_en_p_int_en_hw_read;  // This signal provides
                                                         // the current value of
                                                         // imu_int_en_reg_pmeack_mes_not_en_p_int_en.
wire imu_int_en_reg_pmpme_mes_not_en_p_int_en_hw_read;  // This signal provides
                                                        // the current value of
                                                        // imu_int_en_reg_pmpme_mes_not_en_p_int_en.
wire imu_int_en_reg_fatal_mes_not_en_p_int_en_hw_read;  // This signal provides
                                                        // the current value of
                                                        // imu_int_en_reg_fatal_mes_not_en_p_int_en.
wire imu_int_en_reg_nonfatal_mes_not_en_p_int_en_hw_read;  // This signal
                                                           // provides the
                                                           // current value of
                                                           // imu_int_en_reg_nonfatal_mes_not_en_p_int_en.
wire imu_int_en_reg_cor_mes_not_en_p_int_en_hw_read;  // This signal provides
                                                      // the current value of
                                                      // imu_int_en_reg_cor_mes_not_en_p_int_en.
wire imu_int_en_reg_msi_not_en_p_int_en_hw_read;  // This signal provides the
                                                  // current value of
                                                  // imu_int_en_reg_msi_not_en_p_int_en.
wire imu_int_en_reg_select_pulse;  // select
wire imu_enabled_error_status_reg_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] imu_enabled_error_status_reg_ext_read_data;
    // Read Data
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
wire imu_logged_error_status_reg_select_pulse;  // select
wire imu_rds_error_log_reg_hw_ld;  // Hardware load enable for
                                   // imu_rds_error_log_reg. When set, <hw write
                                   // signal>  will be loaded into
                                   // imu_rds_error_log_reg.
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_RDS_ERROR_LOG_REG_WIDTH-1:0] imu_rds_error_log_reg_hw_write;
    // data bus for hw loading of imu_rds_error_log_reg.
wire imu_rds_error_log_reg_select_pulse;  // select
wire imu_scs_error_log_reg_hw_ld;  // Hardware load enable for
                                   // imu_scs_error_log_reg. When set, <hw write
                                   // signal>  will be loaded into
                                   // imu_scs_error_log_reg.
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_SCS_ERROR_LOG_REG_WIDTH-1:0] imu_scs_error_log_reg_hw_write;
    // data bus for hw loading of imu_scs_error_log_reg.
wire imu_scs_error_log_reg_select_pulse;  // select
wire imu_eqs_error_log_reg_hw_ld;  // Hardware load enable for
                                   // imu_eqs_error_log_reg. When set, <hw write
                                   // signal>  will be loaded into
                                   // imu_eqs_error_log_reg.
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_EQS_ERROR_LOG_REG_WIDTH-1:0] imu_eqs_error_log_reg_hw_write;
    // data bus for hw loading of imu_eqs_error_log_reg.
wire imu_eqs_error_log_reg_select_pulse;  // select
wire dmc_interrupt_mask_reg_dmc_hw_read;  // This signal provides the current
                                          // value of
                                          // dmc_interrupt_mask_reg_dmc.
wire dmc_interrupt_mask_reg_debug_trig_en_hw_read;  // This signal provides the
                                                    // current value of
                                                    // dmc_interrupt_mask_reg_debug_trig_en.
wire dmc_interrupt_mask_reg_mmu_hw_read;  // This signal provides the current
                                          // value of
                                          // dmc_interrupt_mask_reg_mmu.
wire dmc_interrupt_mask_reg_imu_hw_read;  // This signal provides the current
                                          // value of
                                          // dmc_interrupt_mask_reg_imu.
wire dmc_interrupt_mask_reg_select_pulse;  // select
wire dmc_interrupt_status_reg_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] dmc_interrupt_status_reg_ext_read_data;
    // Read Data
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNTRL_SEL1_INT_SLC] imu_perf_cntrl_sel1_hw_read;
    // This signal provides the current value of imu_perf_cntrl_sel1.
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNTRL_SEL0_INT_SLC] imu_perf_cntrl_sel0_hw_read;
    // This signal provides the current value of imu_perf_cntrl_sel0.
wire imu_perf_cntrl_select_pulse;  // select
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNT0_CNT_INT_SLC] imu_perf_cnt0_cnt_hw_write;
    // data bus for hw loading of imu_perf_cnt0_cnt.
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNT0_CNT_INT_SLC] imu_perf_cnt0_cnt_hw_read;
    // This signal provides the current value of imu_perf_cnt0_cnt.
wire imu_perf_cnt0_select_pulse;  // select
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNT1_CNT_INT_SLC] imu_perf_cnt1_cnt_hw_write;
    // data bus for hw loading of imu_perf_cnt1_cnt.
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNT1_CNT_INT_SLC] imu_perf_cnt1_cnt_hw_read;
    // This signal provides the current value of imu_perf_cnt1_cnt.
wire imu_perf_cnt1_select_pulse;  // select
wire [`FIRE_DLC_IMU_ICS_CSR_MSI_32_ADDR_REG_ADDR_INT_SLC] msi_32_addr_reg_addr_hw_read;
    // This signal provides the current value of msi_32_addr_reg_addr.
wire msi_32_addr_reg_select_pulse;  // select
wire [`FIRE_DLC_IMU_ICS_CSR_MSI_64_ADDR_REG_ADDR_INT_SLC] msi_64_addr_reg_addr_hw_read;
    // This signal provides the current value of msi_64_addr_reg_addr.
wire msi_64_addr_reg_select_pulse;  // select
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
wire mem_64_pcie_offset_reg_select_pulse;  // select
wire imu_logged_error_status_reg_rw1c_alias;  // SW load
wire imu_logged_error_status_reg_rw1s_alias;  // SW load
wire rst_l;  // HW reset
wire por_l;  // HW reset
wire daemon_csrbus_wr_in;  // csrbus_wr
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data


//====================================================
//   Local signals
//====================================================
//----- For CSR register: imu_error_log_en_reg
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_ERROR_LOG_EN_REG_WIDTH-1:0] imu_error_log_en_reg_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: imu_int_en_reg
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_INT_EN_REG_WIDTH-1:0] imu_int_en_reg_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: imu_logged_error_status_reg
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_WIDTH-1:0]
 imu_logged_error_status_reg_csrbus_read_data;  // Entry Based Read Data

//----- For CSR register: imu_rds_error_log_reg
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_RDS_ERROR_LOG_REG_WIDTH-1:0] imu_rds_error_log_reg_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: imu_scs_error_log_reg
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_SCS_ERROR_LOG_REG_WIDTH-1:0] imu_scs_error_log_reg_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: imu_eqs_error_log_reg
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_EQS_ERROR_LOG_REG_WIDTH-1:0] imu_eqs_error_log_reg_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: dmc_interrupt_mask_reg
wire [`FIRE_DLC_IMU_ICS_CSR_DMC_INTERRUPT_MASK_REG_WIDTH-1:0] dmc_interrupt_mask_reg_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: imu_perf_cntrl
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNTRL_WIDTH-1:0] imu_perf_cntrl_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: imu_perf_cnt0
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNT0_WIDTH-1:0] imu_perf_cnt0_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: imu_perf_cnt1
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNT1_WIDTH-1:0] imu_perf_cnt1_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: msi_32_addr_reg
wire [`FIRE_DLC_IMU_ICS_CSR_MSI_32_ADDR_REG_WIDTH-1:0] msi_32_addr_reg_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: msi_64_addr_reg
wire [`FIRE_DLC_IMU_ICS_CSR_MSI_64_ADDR_REG_WIDTH-1:0] msi_64_addr_reg_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: mem_64_pcie_offset_reg
wire [`FIRE_DLC_IMU_ICS_CSR_MEM_64_PCIE_OFFSET_REG_WIDTH-1:0] mem_64_pcie_offset_reg_csrbus_read_data;
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
dmu_imu_ics_csrpipe_15 dmu_imu_ics_csrpipe_15_inst_1
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.reg_in	(1'b1),
	.reg_out	(1'b1),
	.data0	(imu_error_log_en_reg_csrbus_read_data),
	.sel0	(imu_error_log_en_reg_select_pulse),
	.data1	(imu_int_en_reg_csrbus_read_data),
	.sel1	(imu_int_en_reg_select_pulse),
	.data2	(imu_enabled_error_status_reg_ext_read_data),
	.sel2	(imu_enabled_error_status_reg_select),
	.data3	(imu_logged_error_status_reg_csrbus_read_data),
	.sel3	(imu_logged_error_status_reg_select_pulse),
	.data4	(imu_rds_error_log_reg_csrbus_read_data),
	.sel4	(imu_rds_error_log_reg_select_pulse),
	.data5	(imu_scs_error_log_reg_csrbus_read_data),
	.sel5	(imu_scs_error_log_reg_select_pulse),
	.data6	(imu_eqs_error_log_reg_csrbus_read_data),
	.sel6	(imu_eqs_error_log_reg_select_pulse),
	.data7	(dmc_interrupt_mask_reg_csrbus_read_data),
	.sel7	(dmc_interrupt_mask_reg_select_pulse),
	.data8	(dmc_interrupt_status_reg_ext_read_data),
	.sel8	(dmc_interrupt_status_reg_select),
	.data9	(imu_perf_cntrl_csrbus_read_data),
	.sel9	(imu_perf_cntrl_select_pulse),
	.data10	(imu_perf_cnt0_csrbus_read_data),
	.sel10	(imu_perf_cnt0_select_pulse),
	.data11	(imu_perf_cnt1_csrbus_read_data),
	.sel11	(imu_perf_cnt1_select_pulse),
	.data12	(msi_32_addr_reg_csrbus_read_data),
	.sel12	(msi_32_addr_reg_select_pulse),
	.data13	(msi_64_addr_reg_csrbus_read_data),
	.sel13	(msi_64_addr_reg_select_pulse),
	.data14	(mem_64_pcie_offset_reg_csrbus_read_data),
	.sel14	(mem_64_pcie_offset_reg_select_pulse),
	.out	(read_data_0_out)
	);


//====================================================
//     Instantiation of registers
//====================================================

wire imu_error_log_en_reg_w_ld =imu_error_log_en_reg_select_pulse & daemon_csrbus_wr;

dmu_imu_ics_csr_imu_error_log_en_reg imu_error_log_en_reg
	(
	.clk	(clk),
	.por_l	(por_l),
	.imu_error_log_en_reg_w_ld	(imu_error_log_en_reg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.imu_error_log_en_reg_csrbus_read_data	(imu_error_log_en_reg_csrbus_read_data),
	.imu_error_log_en_reg_spare_log_en_hw_read	(imu_error_log_en_reg_spare_log_en_hw_read),
	.imu_error_log_en_reg_eq_over_log_en_hw_read	(imu_error_log_en_reg_eq_over_log_en_hw_read),
	.imu_error_log_en_reg_eq_not_en_log_en_hw_read	(imu_error_log_en_reg_eq_not_en_log_en_hw_read),
	.imu_error_log_en_reg_msi_mal_err_log_en_hw_read	(imu_error_log_en_reg_msi_mal_err_log_en_hw_read),
	.imu_error_log_en_reg_msi_par_err_log_en_hw_read	(imu_error_log_en_reg_msi_par_err_log_en_hw_read),
	.imu_error_log_en_reg_pmeack_mes_not_en_log_en_hw_read	(imu_error_log_en_reg_pmeack_mes_not_en_log_en_hw_read),
	.imu_error_log_en_reg_pmpme_mes_not_en_log_en_hw_read	(imu_error_log_en_reg_pmpme_mes_not_en_log_en_hw_read),
	.imu_error_log_en_reg_fatal_mes_not_en_log_en_hw_read	(imu_error_log_en_reg_fatal_mes_not_en_log_en_hw_read),
	.imu_error_log_en_reg_nonfatal_mes_not_en_log_en_hw_read	(imu_error_log_en_reg_nonfatal_mes_not_en_log_en_hw_read),
	.imu_error_log_en_reg_cor_mes_not_en_log_en_hw_read	(imu_error_log_en_reg_cor_mes_not_en_log_en_hw_read),
	.imu_error_log_en_reg_msi_not_en_log_en_hw_read	(imu_error_log_en_reg_msi_not_en_log_en_hw_read)
	);

wire imu_int_en_reg_w_ld =imu_int_en_reg_select_pulse & daemon_csrbus_wr;

dmu_imu_ics_csr_imu_int_en_reg imu_int_en_reg
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.imu_int_en_reg_w_ld	(imu_int_en_reg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.imu_int_en_reg_csrbus_read_data	(imu_int_en_reg_csrbus_read_data),
	.imu_int_en_reg_spare_s_int_en_hw_read	(imu_int_en_reg_spare_s_int_en_hw_read),
	.imu_int_en_reg_eq_over_s_int_en_hw_read	(imu_int_en_reg_eq_over_s_int_en_hw_read),
	.imu_int_en_reg_eq_not_en_s_int_en_hw_read	(imu_int_en_reg_eq_not_en_s_int_en_hw_read),
	.imu_int_en_reg_msi_mal_err_s_int_en_hw_read	(imu_int_en_reg_msi_mal_err_s_int_en_hw_read),
	.imu_int_en_reg_msi_par_err_s_int_en_hw_read	(imu_int_en_reg_msi_par_err_s_int_en_hw_read),
	.imu_int_en_reg_pmeack_mes_not_en_s_int_en_hw_read	(imu_int_en_reg_pmeack_mes_not_en_s_int_en_hw_read),
	.imu_int_en_reg_pmpme_mes_not_en_s_int_en_hw_read	(imu_int_en_reg_pmpme_mes_not_en_s_int_en_hw_read),
	.imu_int_en_reg_fatal_mes_not_en_s_int_en_hw_read	(imu_int_en_reg_fatal_mes_not_en_s_int_en_hw_read),
	.imu_int_en_reg_nonfatal_mes_not_en_s_int_en_hw_read	(imu_int_en_reg_nonfatal_mes_not_en_s_int_en_hw_read),
	.imu_int_en_reg_cor_mes_not_en_s_int_en_hw_read	(imu_int_en_reg_cor_mes_not_en_s_int_en_hw_read),
	.imu_int_en_reg_msi_not_en_s_int_en_hw_read	(imu_int_en_reg_msi_not_en_s_int_en_hw_read),
	.imu_int_en_reg_spare_p_int_en_hw_read	(imu_int_en_reg_spare_p_int_en_hw_read),
	.imu_int_en_reg_eq_over_p_int_en_hw_read	(imu_int_en_reg_eq_over_p_int_en_hw_read),
	.imu_int_en_reg_eq_not_en_p_int_en_hw_read	(imu_int_en_reg_eq_not_en_p_int_en_hw_read),
	.imu_int_en_reg_msi_mal_err_p_int_en_hw_read	(imu_int_en_reg_msi_mal_err_p_int_en_hw_read),
	.imu_int_en_reg_msi_par_err_p_int_en_hw_read	(imu_int_en_reg_msi_par_err_p_int_en_hw_read),
	.imu_int_en_reg_pmeack_mes_not_en_p_int_en_hw_read	(imu_int_en_reg_pmeack_mes_not_en_p_int_en_hw_read),
	.imu_int_en_reg_pmpme_mes_not_en_p_int_en_hw_read	(imu_int_en_reg_pmpme_mes_not_en_p_int_en_hw_read),
	.imu_int_en_reg_fatal_mes_not_en_p_int_en_hw_read	(imu_int_en_reg_fatal_mes_not_en_p_int_en_hw_read),
	.imu_int_en_reg_nonfatal_mes_not_en_p_int_en_hw_read	(imu_int_en_reg_nonfatal_mes_not_en_p_int_en_hw_read),
	.imu_int_en_reg_cor_mes_not_en_p_int_en_hw_read	(imu_int_en_reg_cor_mes_not_en_p_int_en_hw_read),
	.imu_int_en_reg_msi_not_en_p_int_en_hw_read	(imu_int_en_reg_msi_not_en_p_int_en_hw_read)
	);

wire imu_logged_error_status_reg_w_ld =imu_logged_error_status_reg_select_pulse & daemon_csrbus_wr;

dmu_imu_ics_csr_imu_logged_error_status_reg imu_logged_error_status_reg
	(
	.clk	(clk),
	.por_l	(por_l),
	.imu_logged_error_status_reg_w_ld	(imu_logged_error_status_reg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.rw1c_alias	(imu_logged_error_status_reg_rw1c_alias),
	.rw1s_alias	(imu_logged_error_status_reg_rw1s_alias),
	.imu_logged_error_status_reg_csrbus_read_data	(imu_logged_error_status_reg_csrbus_read_data),
	.imu_logged_error_status_reg_spare_s_hw_set	(imu_logged_error_status_reg_spare_s_hw_set),
	.imu_logged_error_status_reg_spare_s_hw_read	(imu_logged_error_status_reg_spare_s_hw_read),
	.imu_logged_error_status_reg_eq_over_s_hw_set	(imu_logged_error_status_reg_eq_over_s_hw_set),
	.imu_logged_error_status_reg_eq_over_s_hw_read	(imu_logged_error_status_reg_eq_over_s_hw_read),
	.imu_logged_error_status_reg_eq_not_en_s_hw_set	(imu_logged_error_status_reg_eq_not_en_s_hw_set),
	.imu_logged_error_status_reg_eq_not_en_s_hw_read	(imu_logged_error_status_reg_eq_not_en_s_hw_read),
	.imu_logged_error_status_reg_msi_mal_err_s_hw_set	(imu_logged_error_status_reg_msi_mal_err_s_hw_set),
	.imu_logged_error_status_reg_msi_mal_err_s_hw_read	(imu_logged_error_status_reg_msi_mal_err_s_hw_read),
	.imu_logged_error_status_reg_msi_par_err_s_hw_set	(imu_logged_error_status_reg_msi_par_err_s_hw_set),
	.imu_logged_error_status_reg_msi_par_err_s_hw_read	(imu_logged_error_status_reg_msi_par_err_s_hw_read),
	.imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_set	(imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_set),
	.imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_read	(imu_logged_error_status_reg_pmeack_mes_not_en_s_hw_read),
	.imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_set	(imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_set),
	.imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_read	(imu_logged_error_status_reg_pmpme_mes_not_en_s_hw_read),
	.imu_logged_error_status_reg_fatal_mes_not_en_s_hw_set	(imu_logged_error_status_reg_fatal_mes_not_en_s_hw_set),
	.imu_logged_error_status_reg_fatal_mes_not_en_s_hw_read	(imu_logged_error_status_reg_fatal_mes_not_en_s_hw_read),
	.imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_set	(imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_set),
	.imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_read	(imu_logged_error_status_reg_nonfatal_mes_not_en_s_hw_read),
	.imu_logged_error_status_reg_cor_mes_not_en_s_hw_set	(imu_logged_error_status_reg_cor_mes_not_en_s_hw_set),
	.imu_logged_error_status_reg_cor_mes_not_en_s_hw_read	(imu_logged_error_status_reg_cor_mes_not_en_s_hw_read),
	.imu_logged_error_status_reg_msi_not_en_s_hw_set	(imu_logged_error_status_reg_msi_not_en_s_hw_set),
	.imu_logged_error_status_reg_msi_not_en_s_hw_read	(imu_logged_error_status_reg_msi_not_en_s_hw_read),
	.imu_logged_error_status_reg_spare_p_hw_set	(imu_logged_error_status_reg_spare_p_hw_set),
	.imu_logged_error_status_reg_spare_p_hw_read	(imu_logged_error_status_reg_spare_p_hw_read),
	.imu_logged_error_status_reg_eq_over_p_hw_set	(imu_logged_error_status_reg_eq_over_p_hw_set),
	.imu_logged_error_status_reg_eq_over_p_hw_read	(imu_logged_error_status_reg_eq_over_p_hw_read),
	.imu_logged_error_status_reg_eq_not_en_p_hw_set	(imu_logged_error_status_reg_eq_not_en_p_hw_set),
	.imu_logged_error_status_reg_eq_not_en_p_hw_read	(imu_logged_error_status_reg_eq_not_en_p_hw_read),
	.imu_logged_error_status_reg_msi_mal_err_p_hw_set	(imu_logged_error_status_reg_msi_mal_err_p_hw_set),
	.imu_logged_error_status_reg_msi_mal_err_p_hw_read	(imu_logged_error_status_reg_msi_mal_err_p_hw_read),
	.imu_logged_error_status_reg_msi_par_err_p_hw_set	(imu_logged_error_status_reg_msi_par_err_p_hw_set),
	.imu_logged_error_status_reg_msi_par_err_p_hw_read	(imu_logged_error_status_reg_msi_par_err_p_hw_read),
	.imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_set	(imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_set),
	.imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_read	(imu_logged_error_status_reg_pmeack_mes_not_en_p_hw_read),
	.imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_set	(imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_set),
	.imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_read	(imu_logged_error_status_reg_pmpme_mes_not_en_p_hw_read),
	.imu_logged_error_status_reg_fatal_mes_not_en_p_hw_set	(imu_logged_error_status_reg_fatal_mes_not_en_p_hw_set),
	.imu_logged_error_status_reg_fatal_mes_not_en_p_hw_read	(imu_logged_error_status_reg_fatal_mes_not_en_p_hw_read),
	.imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_set	(imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_set),
	.imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_read	(imu_logged_error_status_reg_nonfatal_mes_not_en_p_hw_read),
	.imu_logged_error_status_reg_cor_mes_not_en_p_hw_set	(imu_logged_error_status_reg_cor_mes_not_en_p_hw_set),
	.imu_logged_error_status_reg_cor_mes_not_en_p_hw_read	(imu_logged_error_status_reg_cor_mes_not_en_p_hw_read),
	.imu_logged_error_status_reg_msi_not_en_p_hw_set	(imu_logged_error_status_reg_msi_not_en_p_hw_set),
	.imu_logged_error_status_reg_msi_not_en_p_hw_read	(imu_logged_error_status_reg_msi_not_en_p_hw_read)
	);

wire imu_rds_error_log_reg_w_ld =imu_rds_error_log_reg_select_pulse & daemon_csrbus_wr;

dmu_imu_ics_csr_imu_rds_error_log_reg imu_rds_error_log_reg
	(
	.clk	(clk),
	.por_l	(por_l),
	.imu_rds_error_log_reg_w_ld	(imu_rds_error_log_reg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.imu_rds_error_log_reg_csrbus_read_data	(imu_rds_error_log_reg_csrbus_read_data),
	.imu_rds_error_log_reg_hw_ld	(imu_rds_error_log_reg_hw_ld),
	.imu_rds_error_log_reg_hw_write	(imu_rds_error_log_reg_hw_write)
	);

wire imu_scs_error_log_reg_w_ld =imu_scs_error_log_reg_select_pulse & daemon_csrbus_wr;

dmu_imu_ics_csr_imu_scs_error_log_reg imu_scs_error_log_reg
	(
	.clk	(clk),
	.por_l	(por_l),
	.imu_scs_error_log_reg_w_ld	(imu_scs_error_log_reg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.imu_scs_error_log_reg_csrbus_read_data	(imu_scs_error_log_reg_csrbus_read_data),
	.imu_scs_error_log_reg_hw_ld	(imu_scs_error_log_reg_hw_ld),
	.imu_scs_error_log_reg_hw_write	(imu_scs_error_log_reg_hw_write)
	);

wire imu_eqs_error_log_reg_w_ld =imu_eqs_error_log_reg_select_pulse & daemon_csrbus_wr;

dmu_imu_ics_csr_imu_eqs_error_log_reg imu_eqs_error_log_reg
	(
	.clk	(clk),
	.por_l	(por_l),
	.imu_eqs_error_log_reg_w_ld	(imu_eqs_error_log_reg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.imu_eqs_error_log_reg_csrbus_read_data	(imu_eqs_error_log_reg_csrbus_read_data),
	.imu_eqs_error_log_reg_hw_ld	(imu_eqs_error_log_reg_hw_ld),
	.imu_eqs_error_log_reg_hw_write	(imu_eqs_error_log_reg_hw_write)
	);

wire dmc_interrupt_mask_reg_w_ld =dmc_interrupt_mask_reg_select_pulse & daemon_csrbus_wr;

dmu_imu_ics_csr_dmc_interrupt_mask_reg dmc_interrupt_mask_reg
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.dmc_interrupt_mask_reg_w_ld	(dmc_interrupt_mask_reg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.dmc_interrupt_mask_reg_csrbus_read_data	(dmc_interrupt_mask_reg_csrbus_read_data),
	.dmc_interrupt_mask_reg_dmc_hw_read	(dmc_interrupt_mask_reg_dmc_hw_read),
	.dmc_interrupt_mask_reg_debug_trig_en_hw_read	(dmc_interrupt_mask_reg_debug_trig_en_hw_read),
	.dmc_interrupt_mask_reg_mmu_hw_read	(dmc_interrupt_mask_reg_mmu_hw_read),
	.dmc_interrupt_mask_reg_imu_hw_read	(dmc_interrupt_mask_reg_imu_hw_read)
	);

wire imu_perf_cntrl_w_ld =imu_perf_cntrl_select_pulse & daemon_csrbus_wr;

dmu_imu_ics_csr_imu_perf_cntrl imu_perf_cntrl
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.imu_perf_cntrl_w_ld	(imu_perf_cntrl_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.imu_perf_cntrl_csrbus_read_data	(imu_perf_cntrl_csrbus_read_data),
	.imu_perf_cntrl_sel1_hw_read	(imu_perf_cntrl_sel1_hw_read),
	.imu_perf_cntrl_sel0_hw_read	(imu_perf_cntrl_sel0_hw_read)
	);

wire imu_perf_cnt0_w_ld =imu_perf_cnt0_select_pulse & daemon_csrbus_wr;

dmu_imu_ics_csr_imu_perf_cnt0 imu_perf_cnt0
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.imu_perf_cnt0_w_ld	(imu_perf_cnt0_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.imu_perf_cnt0_csrbus_read_data	(imu_perf_cnt0_csrbus_read_data),
	.imu_perf_cnt0_cnt_hw_write	(imu_perf_cnt0_cnt_hw_write),
	.imu_perf_cnt0_cnt_hw_read	(imu_perf_cnt0_cnt_hw_read)
	);

wire imu_perf_cnt1_w_ld =imu_perf_cnt1_select_pulse & daemon_csrbus_wr;

dmu_imu_ics_csr_imu_perf_cnt1 imu_perf_cnt1
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.imu_perf_cnt1_w_ld	(imu_perf_cnt1_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.imu_perf_cnt1_csrbus_read_data	(imu_perf_cnt1_csrbus_read_data),
	.imu_perf_cnt1_cnt_hw_write	(imu_perf_cnt1_cnt_hw_write),
	.imu_perf_cnt1_cnt_hw_read	(imu_perf_cnt1_cnt_hw_read)
	);

wire msi_32_addr_reg_w_ld =msi_32_addr_reg_select_pulse & daemon_csrbus_wr;

dmu_imu_ics_csr_msi_32_addr_reg msi_32_addr_reg
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.msi_32_addr_reg_w_ld	(msi_32_addr_reg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.msi_32_addr_reg_csrbus_read_data	(msi_32_addr_reg_csrbus_read_data),
	.msi_32_addr_reg_addr_hw_read	(msi_32_addr_reg_addr_hw_read)
	);

wire msi_64_addr_reg_w_ld =msi_64_addr_reg_select_pulse & daemon_csrbus_wr;

dmu_imu_ics_csr_msi_64_addr_reg msi_64_addr_reg
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.msi_64_addr_reg_w_ld	(msi_64_addr_reg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.msi_64_addr_reg_csrbus_read_data	(msi_64_addr_reg_csrbus_read_data),
	.msi_64_addr_reg_addr_hw_read	(msi_64_addr_reg_addr_hw_read)
	);

wire mem_64_pcie_offset_reg_w_ld =mem_64_pcie_offset_reg_select_pulse & daemon_csrbus_wr;

dmu_imu_ics_csr_mem_64_pcie_offset_reg mem_64_pcie_offset_reg
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.mem_64_pcie_offset_reg_w_ld	(mem_64_pcie_offset_reg_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.mem_64_pcie_offset_reg_csrbus_read_data	(mem_64_pcie_offset_reg_csrbus_read_data),
	.mem_64_pcie_offset_reg_addr_hw_read	(mem_64_pcie_offset_reg_addr_hw_read),
	.mem_64_pcie_offset_reg_spare_control_load_7_hw_ld	(mem_64_pcie_offset_reg_spare_control_load_7_hw_ld),
	.mem_64_pcie_offset_reg_spare_control_load_7_hw_write	(mem_64_pcie_offset_reg_spare_control_load_7_hw_write),
	.mem_64_pcie_offset_reg_spare_control_load_7_hw_read	(mem_64_pcie_offset_reg_spare_control_load_7_hw_read),
	.mem_64_pcie_offset_reg_spare_control_load_6_hw_ld	(mem_64_pcie_offset_reg_spare_control_load_6_hw_ld),
	.mem_64_pcie_offset_reg_spare_control_load_6_hw_write	(mem_64_pcie_offset_reg_spare_control_load_6_hw_write),
	.mem_64_pcie_offset_reg_spare_control_load_6_hw_read	(mem_64_pcie_offset_reg_spare_control_load_6_hw_read),
	.mem_64_pcie_offset_reg_spare_control_load_5_hw_ld	(mem_64_pcie_offset_reg_spare_control_load_5_hw_ld),
	.mem_64_pcie_offset_reg_spare_control_load_5_hw_write	(mem_64_pcie_offset_reg_spare_control_load_5_hw_write),
	.mem_64_pcie_offset_reg_spare_control_load_5_hw_read	(mem_64_pcie_offset_reg_spare_control_load_5_hw_read),
	.mem_64_pcie_offset_reg_spare_control_load_4_hw_ld	(mem_64_pcie_offset_reg_spare_control_load_4_hw_ld),
	.mem_64_pcie_offset_reg_spare_control_load_4_hw_write	(mem_64_pcie_offset_reg_spare_control_load_4_hw_write),
	.mem_64_pcie_offset_reg_spare_control_load_4_hw_read	(mem_64_pcie_offset_reg_spare_control_load_4_hw_read),
	.mem_64_pcie_offset_reg_spare_control_load_3_hw_ld	(mem_64_pcie_offset_reg_spare_control_load_3_hw_ld),
	.mem_64_pcie_offset_reg_spare_control_load_3_hw_write	(mem_64_pcie_offset_reg_spare_control_load_3_hw_write),
	.mem_64_pcie_offset_reg_spare_control_load_3_hw_read	(mem_64_pcie_offset_reg_spare_control_load_3_hw_read),
	.mem_64_pcie_offset_reg_spare_control_load_2_hw_ld	(mem_64_pcie_offset_reg_spare_control_load_2_hw_ld),
	.mem_64_pcie_offset_reg_spare_control_load_2_hw_write	(mem_64_pcie_offset_reg_spare_control_load_2_hw_write),
	.mem_64_pcie_offset_reg_spare_control_load_2_hw_read	(mem_64_pcie_offset_reg_spare_control_load_2_hw_read),
	.mem_64_pcie_offset_reg_spare_control_load_1_hw_ld	(mem_64_pcie_offset_reg_spare_control_load_1_hw_ld),
	.mem_64_pcie_offset_reg_spare_control_load_1_hw_write	(mem_64_pcie_offset_reg_spare_control_load_1_hw_write),
	.mem_64_pcie_offset_reg_spare_control_load_1_hw_read	(mem_64_pcie_offset_reg_spare_control_load_1_hw_read),
	.mem_64_pcie_offset_reg_spare_control_load_0_hw_ld	(mem_64_pcie_offset_reg_spare_control_load_0_hw_ld),
	.mem_64_pcie_offset_reg_spare_control_load_0_hw_write	(mem_64_pcie_offset_reg_spare_control_load_0_hw_write),
	.mem_64_pcie_offset_reg_spare_control_load_0_hw_read	(mem_64_pcie_offset_reg_spare_control_load_0_hw_read),
	.mem_64_pcie_offset_reg_spare_control_hw_write	(mem_64_pcie_offset_reg_spare_control_hw_write),
	.mem_64_pcie_offset_reg_spare_control_hw_read	(mem_64_pcie_offset_reg_spare_control_hw_read),
	.mem_64_pcie_offset_reg_spare_status_hw_read	(mem_64_pcie_offset_reg_spare_status_hw_read)
	);

endmodule // dmu_imu_ics_default_grp
