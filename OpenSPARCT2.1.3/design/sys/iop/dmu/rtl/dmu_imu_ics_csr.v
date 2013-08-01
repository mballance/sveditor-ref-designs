// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_ics_csr.v
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
module dmu_imu_ics_csr 
	(
	clk,
	csrbus_addr,
	csrbus_wr_data,
	csrbus_wr,
	csrbus_valid,
	csrbus_mapped,
	csrbus_done,
	csrbus_read_data,
	por_l,
	rst_l,
	csrbus_src_bus,
	csrbus_acc_vio,
	instance_id,
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
	imu_enabled_error_status_reg_spare_s_ext_read_data,
	imu_enabled_error_status_reg_eq_over_s_ext_read_data,
	imu_enabled_error_status_reg_eq_not_en_s_ext_read_data,
	imu_enabled_error_status_reg_msi_mal_err_s_ext_read_data,
	imu_enabled_error_status_reg_msi_par_err_s_ext_read_data,
	imu_enabled_error_status_reg_pmeack_mes_not_en_s_ext_read_data,
	imu_enabled_error_status_reg_pmpme_mes_not_en_s_ext_read_data,
	imu_enabled_error_status_reg_fatal_mes_not_en_s_ext_read_data,
	imu_enabled_error_status_reg_nonfatal_mes_not_en_s_ext_read_data,
	imu_enabled_error_status_reg_cor_mes_not_en_s_ext_read_data,
	imu_enabled_error_status_reg_msi_not_en_s_ext_read_data,
	imu_enabled_error_status_reg_spare_p_ext_read_data,
	imu_enabled_error_status_reg_eq_over_p_ext_read_data,
	imu_enabled_error_status_reg_eq_not_en_p_ext_read_data,
	imu_enabled_error_status_reg_msi_mal_err_p_ext_read_data,
	imu_enabled_error_status_reg_msi_par_err_p_ext_read_data,
	imu_enabled_error_status_reg_pmeack_mes_not_en_p_ext_read_data,
	imu_enabled_error_status_reg_pmpme_mes_not_en_p_ext_read_data,
	imu_enabled_error_status_reg_fatal_mes_not_en_p_ext_read_data,
	imu_enabled_error_status_reg_nonfatal_mes_not_en_p_ext_read_data,
	imu_enabled_error_status_reg_cor_mes_not_en_p_ext_read_data,
	imu_enabled_error_status_reg_msi_not_en_p_ext_read_data,
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
	imu_rds_error_log_reg_hw_ld,
	imu_rds_error_log_reg_hw_write,
	imu_scs_error_log_reg_hw_ld,
	imu_scs_error_log_reg_hw_write,
	imu_eqs_error_log_reg_hw_ld,
	imu_eqs_error_log_reg_hw_write,
	dmc_interrupt_mask_reg_dmc_hw_read,
	dmc_interrupt_mask_reg_debug_trig_en_hw_read,
	dmc_interrupt_mask_reg_mmu_hw_read,
	dmc_interrupt_mask_reg_imu_hw_read,
	dmc_interrupt_status_reg_mmu_ext_read_data,
	dmc_interrupt_status_reg_imu_ext_read_data,
	imu_perf_cntrl_sel1_hw_read,
	imu_perf_cntrl_sel0_hw_read,
	imu_perf_cnt0_cnt_hw_write,
	imu_perf_cnt0_cnt_hw_read,
	imu_perf_cnt1_cnt_hw_write,
	imu_perf_cnt1_cnt_hw_read,
	msi_32_addr_reg_addr_hw_read,
	msi_64_addr_reg_addr_hw_read,
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

//====================================================
//     Polarity declarations
//====================================================
input  clk;  // Clock signal
input  [`FIRE_CSRBUS_ADDR_WIDTH-1:0] csrbus_addr;  // Address bus
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
input  csrbus_wr;  // Read/Write signal
input  csrbus_valid;  // Valid address
output csrbus_mapped;  // Address is mapped
output csrbus_done;  // Operation is done
output [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_read_data;  // SW read data bus
input  por_l;  // Reset signal
input  rst_l;  // Reset signal
input  [1:0] csrbus_src_bus;  // Source bus
output csrbus_acc_vio;  // Violation signal
input  instance_id;  // Instance ID
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
input  [4:0] imu_enabled_error_status_reg_spare_s_ext_read_data;  // Ext read
                                                                  // data
                                                                  // (decode)
input  [0:0] imu_enabled_error_status_reg_eq_over_s_ext_read_data;
    // Ext read data (decode)
input  [0:0] imu_enabled_error_status_reg_eq_not_en_s_ext_read_data;
    // Ext read data (decode)
input  [0:0] imu_enabled_error_status_reg_msi_mal_err_s_ext_read_data;
    // Ext read data (decode)
input  [0:0] imu_enabled_error_status_reg_msi_par_err_s_ext_read_data;
    // Ext read data (decode)
input  [0:0] imu_enabled_error_status_reg_pmeack_mes_not_en_s_ext_read_data;
    // Ext read data (decode)
input  [0:0] imu_enabled_error_status_reg_pmpme_mes_not_en_s_ext_read_data;
    // Ext read data (decode)
input  [0:0] imu_enabled_error_status_reg_fatal_mes_not_en_s_ext_read_data;
    // Ext read data (decode)
input  [0:0] imu_enabled_error_status_reg_nonfatal_mes_not_en_s_ext_read_data;
    // Ext read data (decode)
input  [0:0] imu_enabled_error_status_reg_cor_mes_not_en_s_ext_read_data;
    // Ext read data (decode)
input  [0:0] imu_enabled_error_status_reg_msi_not_en_s_ext_read_data;
    // Ext read data (decode)
input  [4:0] imu_enabled_error_status_reg_spare_p_ext_read_data;  // Ext read
                                                                  // data
                                                                  // (decode)
input  [0:0] imu_enabled_error_status_reg_eq_over_p_ext_read_data;
    // Ext read data (decode)
input  [0:0] imu_enabled_error_status_reg_eq_not_en_p_ext_read_data;
    // Ext read data (decode)
input  [0:0] imu_enabled_error_status_reg_msi_mal_err_p_ext_read_data;
    // Ext read data (decode)
input  [0:0] imu_enabled_error_status_reg_msi_par_err_p_ext_read_data;
    // Ext read data (decode)
input  [0:0] imu_enabled_error_status_reg_pmeack_mes_not_en_p_ext_read_data;
    // Ext read data (decode)
input  [0:0] imu_enabled_error_status_reg_pmpme_mes_not_en_p_ext_read_data;
    // Ext read data (decode)
input  [0:0] imu_enabled_error_status_reg_fatal_mes_not_en_p_ext_read_data;
    // Ext read data (decode)
input  [0:0] imu_enabled_error_status_reg_nonfatal_mes_not_en_p_ext_read_data;
    // Ext read data (decode)
input  [0:0] imu_enabled_error_status_reg_cor_mes_not_en_p_ext_read_data;
    // Ext read data (decode)
input  [0:0] imu_enabled_error_status_reg_msi_not_en_p_ext_read_data;
    // Ext read data (decode)
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
input  imu_rds_error_log_reg_hw_ld;  // Hardware load enable for
                                     // imu_rds_error_log_reg. When set, <hw
                                     // write signal>  will be loaded into
                                     // imu_rds_error_log_reg.
input  [`FIRE_DLC_IMU_ICS_CSR_IMU_RDS_ERROR_LOG_REG_WIDTH-1:0] imu_rds_error_log_reg_hw_write;
    // data bus for hw loading of imu_rds_error_log_reg.
input  imu_scs_error_log_reg_hw_ld;  // Hardware load enable for
                                     // imu_scs_error_log_reg. When set, <hw
                                     // write signal>  will be loaded into
                                     // imu_scs_error_log_reg.
input  [`FIRE_DLC_IMU_ICS_CSR_IMU_SCS_ERROR_LOG_REG_WIDTH-1:0] imu_scs_error_log_reg_hw_write;
    // data bus for hw loading of imu_scs_error_log_reg.
input  imu_eqs_error_log_reg_hw_ld;  // Hardware load enable for
                                     // imu_eqs_error_log_reg. When set, <hw
                                     // write signal>  will be loaded into
                                     // imu_eqs_error_log_reg.
input  [`FIRE_DLC_IMU_ICS_CSR_IMU_EQS_ERROR_LOG_REG_WIDTH-1:0] imu_eqs_error_log_reg_hw_write;
    // data bus for hw loading of imu_eqs_error_log_reg.
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
input  [0:0] dmc_interrupt_status_reg_mmu_ext_read_data;  // Ext read data
                                                          // (decode)
input  [0:0] dmc_interrupt_status_reg_imu_ext_read_data;  // Ext read data
                                                          // (decode)
output [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNTRL_SEL1_INT_SLC] imu_perf_cntrl_sel1_hw_read;
    // This signal provides the current value of imu_perf_cntrl_sel1.
output [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNTRL_SEL0_INT_SLC] imu_perf_cntrl_sel0_hw_read;
    // This signal provides the current value of imu_perf_cntrl_sel0.
input  [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNT0_CNT_INT_SLC] imu_perf_cnt0_cnt_hw_write;
    // data bus for hw loading of imu_perf_cnt0_cnt.
output [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNT0_CNT_INT_SLC] imu_perf_cnt0_cnt_hw_read;
    // This signal provides the current value of imu_perf_cnt0_cnt.
input  [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNT1_CNT_INT_SLC] imu_perf_cnt1_cnt_hw_write;
    // data bus for hw loading of imu_perf_cnt1_cnt.
output [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNT1_CNT_INT_SLC] imu_perf_cnt1_cnt_hw_read;
    // This signal provides the current value of imu_perf_cnt1_cnt.
output [`FIRE_DLC_IMU_ICS_CSR_MSI_32_ADDR_REG_ADDR_INT_SLC] msi_32_addr_reg_addr_hw_read;
    // This signal provides the current value of msi_32_addr_reg_addr.
output [`FIRE_DLC_IMU_ICS_CSR_MSI_64_ADDR_REG_ADDR_INT_SLC] msi_64_addr_reg_addr_hw_read;
    // This signal provides the current value of msi_64_addr_reg_addr.
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

//====================================================
//     Type declarations
//====================================================
wire clk;  // Clock signal
wire [`FIRE_CSRBUS_ADDR_WIDTH-1:0] csrbus_addr;  // Address bus
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_wr_data;  // SW write data
wire csrbus_wr;  // Read/Write signal
wire csrbus_valid;  // Valid address
wire csrbus_mapped;  // Address is mapped
wire csrbus_done;  // Operation is done
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] csrbus_read_data;  // SW read data bus
wire por_l;  // Reset signal
wire rst_l;  // Reset signal
wire [1:0] csrbus_src_bus;  // Source bus
wire csrbus_acc_vio;  // Violation signal
wire instance_id;  // Instance ID
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
wire [4:0] imu_enabled_error_status_reg_spare_s_ext_read_data;  // Ext read data
                                                                // (decode)
wire [0:0] imu_enabled_error_status_reg_eq_over_s_ext_read_data;  // Ext read
                                                                  // data
                                                                  // (decode)
wire [0:0] imu_enabled_error_status_reg_eq_not_en_s_ext_read_data;
    // Ext read data (decode)
wire [0:0] imu_enabled_error_status_reg_msi_mal_err_s_ext_read_data;
    // Ext read data (decode)
wire [0:0] imu_enabled_error_status_reg_msi_par_err_s_ext_read_data;
    // Ext read data (decode)
wire [0:0] imu_enabled_error_status_reg_pmeack_mes_not_en_s_ext_read_data;
    // Ext read data (decode)
wire [0:0] imu_enabled_error_status_reg_pmpme_mes_not_en_s_ext_read_data;
    // Ext read data (decode)
wire [0:0] imu_enabled_error_status_reg_fatal_mes_not_en_s_ext_read_data;
    // Ext read data (decode)
wire [0:0] imu_enabled_error_status_reg_nonfatal_mes_not_en_s_ext_read_data;
    // Ext read data (decode)
wire [0:0] imu_enabled_error_status_reg_cor_mes_not_en_s_ext_read_data;
    // Ext read data (decode)
wire [0:0] imu_enabled_error_status_reg_msi_not_en_s_ext_read_data;
    // Ext read data (decode)
wire [4:0] imu_enabled_error_status_reg_spare_p_ext_read_data;  // Ext read data
                                                                // (decode)
wire [0:0] imu_enabled_error_status_reg_eq_over_p_ext_read_data;  // Ext read
                                                                  // data
                                                                  // (decode)
wire [0:0] imu_enabled_error_status_reg_eq_not_en_p_ext_read_data;
    // Ext read data (decode)
wire [0:0] imu_enabled_error_status_reg_msi_mal_err_p_ext_read_data;
    // Ext read data (decode)
wire [0:0] imu_enabled_error_status_reg_msi_par_err_p_ext_read_data;
    // Ext read data (decode)
wire [0:0] imu_enabled_error_status_reg_pmeack_mes_not_en_p_ext_read_data;
    // Ext read data (decode)
wire [0:0] imu_enabled_error_status_reg_pmpme_mes_not_en_p_ext_read_data;
    // Ext read data (decode)
wire [0:0] imu_enabled_error_status_reg_fatal_mes_not_en_p_ext_read_data;
    // Ext read data (decode)
wire [0:0] imu_enabled_error_status_reg_nonfatal_mes_not_en_p_ext_read_data;
    // Ext read data (decode)
wire [0:0] imu_enabled_error_status_reg_cor_mes_not_en_p_ext_read_data;
    // Ext read data (decode)
wire [0:0] imu_enabled_error_status_reg_msi_not_en_p_ext_read_data;
    // Ext read data (decode)
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
wire imu_rds_error_log_reg_hw_ld;  // Hardware load enable for
                                   // imu_rds_error_log_reg. When set, <hw write
                                   // signal>  will be loaded into
                                   // imu_rds_error_log_reg.
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_RDS_ERROR_LOG_REG_WIDTH-1:0] imu_rds_error_log_reg_hw_write;
    // data bus for hw loading of imu_rds_error_log_reg.
wire imu_scs_error_log_reg_hw_ld;  // Hardware load enable for
                                   // imu_scs_error_log_reg. When set, <hw write
                                   // signal>  will be loaded into
                                   // imu_scs_error_log_reg.
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_SCS_ERROR_LOG_REG_WIDTH-1:0] imu_scs_error_log_reg_hw_write;
    // data bus for hw loading of imu_scs_error_log_reg.
wire imu_eqs_error_log_reg_hw_ld;  // Hardware load enable for
                                   // imu_eqs_error_log_reg. When set, <hw write
                                   // signal>  will be loaded into
                                   // imu_eqs_error_log_reg.
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_EQS_ERROR_LOG_REG_WIDTH-1:0] imu_eqs_error_log_reg_hw_write;
    // data bus for hw loading of imu_eqs_error_log_reg.
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
wire [0:0] dmc_interrupt_status_reg_mmu_ext_read_data;  // Ext read data
                                                        // (decode)
wire [0:0] dmc_interrupt_status_reg_imu_ext_read_data;  // Ext read data
                                                        // (decode)
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNTRL_SEL1_INT_SLC] imu_perf_cntrl_sel1_hw_read;
    // This signal provides the current value of imu_perf_cntrl_sel1.
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNTRL_SEL0_INT_SLC] imu_perf_cntrl_sel0_hw_read;
    // This signal provides the current value of imu_perf_cntrl_sel0.
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNT0_CNT_INT_SLC] imu_perf_cnt0_cnt_hw_write;
    // data bus for hw loading of imu_perf_cnt0_cnt.
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNT0_CNT_INT_SLC] imu_perf_cnt0_cnt_hw_read;
    // This signal provides the current value of imu_perf_cnt0_cnt.
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNT1_CNT_INT_SLC] imu_perf_cnt1_cnt_hw_write;
    // data bus for hw loading of imu_perf_cnt1_cnt.
wire [`FIRE_DLC_IMU_ICS_CSR_IMU_PERF_CNT1_CNT_INT_SLC] imu_perf_cnt1_cnt_hw_read;
    // This signal provides the current value of imu_perf_cnt1_cnt.
wire [`FIRE_DLC_IMU_ICS_CSR_MSI_32_ADDR_REG_ADDR_INT_SLC] msi_32_addr_reg_addr_hw_read;
    // This signal provides the current value of msi_32_addr_reg_addr.
wire [`FIRE_DLC_IMU_ICS_CSR_MSI_64_ADDR_REG_ADDR_INT_SLC] msi_64_addr_reg_addr_hw_read;
    // This signal provides the current value of msi_64_addr_reg_addr.
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

//====================================================
//     Logic
//====================================================
wire daemon_transaction_in_progress;
wire daemon_csrbus_mapped;
wire daemon_csrbus_valid;
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_tmp;
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data;
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on
wire daemon_csrbus_done;
wire [`FIRE_CSRBUS_ADDR_WIDTH-1:0] daemon_csrbus_addr;
wire daemon_csrbus_wr_tmp;
wire daemon_csrbus_wr;

//summit modcovoff -bepgnv
pcie_dcm_daemon #(`FIRE_CSRBUS_ADDR_WIDTH,`FIRE_CSRBUS_DATA_WIDTH) pcie_dcm_daemon (
    .daemon_csrbus_valid (daemon_csrbus_valid),
    .daemon_csrbus_mapped (daemon_csrbus_mapped),
    .daemon_csrbus_wr_data (daemon_csrbus_wr_data_tmp),
    .daemon_csrbus_done (daemon_csrbus_done),
    .daemon_csrbus_addr (daemon_csrbus_addr),
    .daemon_csrbus_wr (daemon_csrbus_wr_tmp),
    .daemon_transaction_in_progress (daemon_transaction_in_progress),
// synopsys translate_off
      .clk(clk),
      .csrbus_read_data (csrbus_read_data),
      .rst_l (rst_l),
// synopsys translate_on
    .csrbus_valid (csrbus_valid),
    .csrbus_mapped (csrbus_mapped),
    .csrbus_wr_data (csrbus_wr_data),
    .csrbus_done (csrbus_done),
    .csrbus_addr (csrbus_addr),
    .csrbus_wr (csrbus_wr)
  );
//summit modcovon -bepgnv

//====================================================================
//   Address decode
//====================================================================
wire imu_error_log_en_reg_select_pulse;
wire imu_int_en_reg_select_pulse;
wire imu_enabled_error_status_reg_select;
wire imu_logged_error_status_reg_select_pulse;
wire imu_rds_error_log_reg_select_pulse;
wire imu_scs_error_log_reg_select_pulse;
wire imu_eqs_error_log_reg_select_pulse;
wire dmc_interrupt_mask_reg_select_pulse;
wire dmc_interrupt_status_reg_select;
wire imu_perf_cntrl_select_pulse;
wire imu_perf_cnt0_select_pulse;
wire imu_perf_cnt1_select_pulse;
wire msi_32_addr_reg_select_pulse;
wire msi_64_addr_reg_select_pulse;
wire mem_64_pcie_offset_reg_select_pulse;
wire imu_logged_error_status_reg_rw1c_alias;
wire imu_logged_error_status_reg_rw1s_alias;

dmu_imu_ics_addr_decode dmu_imu_ics_addr_decode
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.daemon_csrbus_valid	(daemon_csrbus_valid),
	.daemon_csrbus_addr	(daemon_csrbus_addr),
	.csrbus_src_bus	(csrbus_src_bus),
	.daemon_csrbus_wr	(daemon_csrbus_wr_tmp),
	.daemon_csrbus_wr_out	(daemon_csrbus_wr),
	.daemon_csrbus_wr_data	(daemon_csrbus_wr_data_tmp),
	.daemon_csrbus_wr_data_out	(daemon_csrbus_wr_data),
	.daemon_csrbus_mapped	(daemon_csrbus_mapped),
	.csrbus_acc_vio	(csrbus_acc_vio),
	.daemon_transaction_in_progress	(daemon_transaction_in_progress),
	.instance_id	(instance_id),
	.daemon_csrbus_done	(daemon_csrbus_done),
	.imu_error_log_en_reg_select_pulse	(imu_error_log_en_reg_select_pulse),
	.imu_int_en_reg_select_pulse	(imu_int_en_reg_select_pulse),
	.imu_enabled_error_status_reg_select	(imu_enabled_error_status_reg_select),
	.imu_logged_error_status_reg_select_pulse	(imu_logged_error_status_reg_select_pulse),
	.imu_logged_error_status_reg_rw1c_alias	(imu_logged_error_status_reg_rw1c_alias),
	.imu_logged_error_status_reg_rw1s_alias	(imu_logged_error_status_reg_rw1s_alias),
	.imu_rds_error_log_reg_select_pulse	(imu_rds_error_log_reg_select_pulse),
	.imu_scs_error_log_reg_select_pulse	(imu_scs_error_log_reg_select_pulse),
	.imu_eqs_error_log_reg_select_pulse	(imu_eqs_error_log_reg_select_pulse),
	.dmc_interrupt_mask_reg_select_pulse	(dmc_interrupt_mask_reg_select_pulse),
	.dmc_interrupt_status_reg_select	(dmc_interrupt_status_reg_select),
	.imu_perf_cntrl_select_pulse	(imu_perf_cntrl_select_pulse),
	.imu_perf_cnt0_select_pulse	(imu_perf_cnt0_select_pulse),
	.imu_perf_cnt1_select_pulse	(imu_perf_cnt1_select_pulse),
	.msi_32_addr_reg_select_pulse	(msi_32_addr_reg_select_pulse),
	.msi_64_addr_reg_select_pulse	(msi_64_addr_reg_select_pulse),
	.mem_64_pcie_offset_reg_select_pulse	(mem_64_pcie_offset_reg_select_pulse)
	);

//====================================================================
//    OUTPUT: csrbus_read_data (pipelining)
//====================================================================
//----- connecting wires
wire stage_mux_only_rst_l;
wire stage_mux_only_por_l;
wire stage_mux_only_imu_logged_error_status_reg_rw1c_alias;
wire stage_mux_only_imu_logged_error_status_reg_rw1s_alias;
wire stage_mux_only_daemon_csrbus_wr;
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] stage_mux_only_daemon_csrbus_wr_data;

//----- Stage: 1 / Grp: default_grp (15 inputs / 1 outputs)
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] default_grp_read_data_0_out;
wire default_grp_imu_error_log_en_reg_select_pulse;
wire default_grp_imu_int_en_reg_select_pulse;
wire default_grp_imu_enabled_error_status_reg_select;
wire default_grp_imu_logged_error_status_reg_select_pulse;
wire default_grp_imu_rds_error_log_reg_select_pulse;
wire default_grp_imu_scs_error_log_reg_select_pulse;
wire default_grp_imu_eqs_error_log_reg_select_pulse;
wire default_grp_dmc_interrupt_mask_reg_select_pulse;
wire default_grp_dmc_interrupt_status_reg_select;
wire default_grp_imu_perf_cntrl_select_pulse;
wire default_grp_imu_perf_cnt0_select_pulse;
wire default_grp_imu_perf_cnt1_select_pulse;
wire default_grp_msi_32_addr_reg_select_pulse;
wire default_grp_msi_64_addr_reg_select_pulse;
wire default_grp_mem_64_pcie_offset_reg_select_pulse;

dmu_imu_ics_default_grp dmu_imu_ics_default_grp
	(
	.clk	(clk),
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
	.imu_error_log_en_reg_msi_not_en_log_en_hw_read	(imu_error_log_en_reg_msi_not_en_log_en_hw_read),
	.imu_error_log_en_reg_select_pulse	(default_grp_imu_error_log_en_reg_select_pulse),
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
	.imu_int_en_reg_msi_not_en_p_int_en_hw_read	(imu_int_en_reg_msi_not_en_p_int_en_hw_read),
	.imu_int_en_reg_select_pulse	(default_grp_imu_int_en_reg_select_pulse),
	.imu_enabled_error_status_reg_select	(default_grp_imu_enabled_error_status_reg_select),
	.imu_enabled_error_status_reg_ext_read_data
	  (
              {
                17'b0,
                imu_enabled_error_status_reg_spare_s_ext_read_data,
                imu_enabled_error_status_reg_eq_over_s_ext_read_data,
                imu_enabled_error_status_reg_eq_not_en_s_ext_read_data,
                imu_enabled_error_status_reg_msi_mal_err_s_ext_read_data,
                imu_enabled_error_status_reg_msi_par_err_s_ext_read_data,
                imu_enabled_error_status_reg_pmeack_mes_not_en_s_ext_read_data,
                imu_enabled_error_status_reg_pmpme_mes_not_en_s_ext_read_data,
                imu_enabled_error_status_reg_fatal_mes_not_en_s_ext_read_data,
                imu_enabled_error_status_reg_nonfatal_mes_not_en_s_ext_read_data,
                imu_enabled_error_status_reg_cor_mes_not_en_s_ext_read_data,
                imu_enabled_error_status_reg_msi_not_en_s_ext_read_data,
                17'b0,
                imu_enabled_error_status_reg_spare_p_ext_read_data,
                imu_enabled_error_status_reg_eq_over_p_ext_read_data,
                imu_enabled_error_status_reg_eq_not_en_p_ext_read_data,
                imu_enabled_error_status_reg_msi_mal_err_p_ext_read_data,
                imu_enabled_error_status_reg_msi_par_err_p_ext_read_data,
                imu_enabled_error_status_reg_pmeack_mes_not_en_p_ext_read_data,
                imu_enabled_error_status_reg_pmpme_mes_not_en_p_ext_read_data,
                imu_enabled_error_status_reg_fatal_mes_not_en_p_ext_read_data,
                imu_enabled_error_status_reg_nonfatal_mes_not_en_p_ext_read_data,
                imu_enabled_error_status_reg_cor_mes_not_en_p_ext_read_data,
                imu_enabled_error_status_reg_msi_not_en_p_ext_read_data
              }),
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
	.imu_logged_error_status_reg_msi_not_en_p_hw_read	(imu_logged_error_status_reg_msi_not_en_p_hw_read),
	.imu_logged_error_status_reg_select_pulse	(default_grp_imu_logged_error_status_reg_select_pulse),
	.imu_rds_error_log_reg_hw_ld	(imu_rds_error_log_reg_hw_ld),
	.imu_rds_error_log_reg_hw_write	(imu_rds_error_log_reg_hw_write),
	.imu_rds_error_log_reg_select_pulse	(default_grp_imu_rds_error_log_reg_select_pulse),
	.imu_scs_error_log_reg_hw_ld	(imu_scs_error_log_reg_hw_ld),
	.imu_scs_error_log_reg_hw_write	(imu_scs_error_log_reg_hw_write),
	.imu_scs_error_log_reg_select_pulse	(default_grp_imu_scs_error_log_reg_select_pulse),
	.imu_eqs_error_log_reg_hw_ld	(imu_eqs_error_log_reg_hw_ld),
	.imu_eqs_error_log_reg_hw_write	(imu_eqs_error_log_reg_hw_write),
	.imu_eqs_error_log_reg_select_pulse	(default_grp_imu_eqs_error_log_reg_select_pulse),
	.dmc_interrupt_mask_reg_dmc_hw_read	(dmc_interrupt_mask_reg_dmc_hw_read),
	.dmc_interrupt_mask_reg_debug_trig_en_hw_read	(dmc_interrupt_mask_reg_debug_trig_en_hw_read),
	.dmc_interrupt_mask_reg_mmu_hw_read	(dmc_interrupt_mask_reg_mmu_hw_read),
	.dmc_interrupt_mask_reg_imu_hw_read	(dmc_interrupt_mask_reg_imu_hw_read),
	.dmc_interrupt_mask_reg_select_pulse	(default_grp_dmc_interrupt_mask_reg_select_pulse),
	.dmc_interrupt_status_reg_select	(default_grp_dmc_interrupt_status_reg_select),
	.dmc_interrupt_status_reg_ext_read_data
	  (
              {
                62'b0,
                dmc_interrupt_status_reg_mmu_ext_read_data,
                dmc_interrupt_status_reg_imu_ext_read_data
              }),
	.imu_perf_cntrl_sel1_hw_read	(imu_perf_cntrl_sel1_hw_read),
	.imu_perf_cntrl_sel0_hw_read	(imu_perf_cntrl_sel0_hw_read),
	.imu_perf_cntrl_select_pulse	(default_grp_imu_perf_cntrl_select_pulse),
	.imu_perf_cnt0_cnt_hw_write	(imu_perf_cnt0_cnt_hw_write),
	.imu_perf_cnt0_cnt_hw_read	(imu_perf_cnt0_cnt_hw_read),
	.imu_perf_cnt0_select_pulse	(default_grp_imu_perf_cnt0_select_pulse),
	.imu_perf_cnt1_cnt_hw_write	(imu_perf_cnt1_cnt_hw_write),
	.imu_perf_cnt1_cnt_hw_read	(imu_perf_cnt1_cnt_hw_read),
	.imu_perf_cnt1_select_pulse	(default_grp_imu_perf_cnt1_select_pulse),
	.msi_32_addr_reg_addr_hw_read	(msi_32_addr_reg_addr_hw_read),
	.msi_32_addr_reg_select_pulse	(default_grp_msi_32_addr_reg_select_pulse),
	.msi_64_addr_reg_addr_hw_read	(msi_64_addr_reg_addr_hw_read),
	.msi_64_addr_reg_select_pulse	(default_grp_msi_64_addr_reg_select_pulse),
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
	.mem_64_pcie_offset_reg_spare_status_hw_read	(mem_64_pcie_offset_reg_spare_status_hw_read),
	.mem_64_pcie_offset_reg_select_pulse	(default_grp_mem_64_pcie_offset_reg_select_pulse),
	.imu_logged_error_status_reg_rw1c_alias	(stage_mux_only_imu_logged_error_status_reg_rw1c_alias),
	.imu_logged_error_status_reg_rw1s_alias	(stage_mux_only_imu_logged_error_status_reg_rw1s_alias),
	.rst_l	(stage_mux_only_rst_l),
	.por_l	(stage_mux_only_por_l),
	.daemon_csrbus_wr_in	(stage_mux_only_daemon_csrbus_wr),
	.daemon_csrbus_wr_data_in	(stage_mux_only_daemon_csrbus_wr_data),
	.read_data_0_out	(default_grp_read_data_0_out)
	);

//----- Stage: 2 / Grp: stage_mux_only (1 inputs / 1 outputs) (Mux only)
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] stage_mux_only_read_data_0_out;

dmu_imu_ics_stage_mux_only dmu_imu_ics_stage_mux_only
	(
	.clk	(clk),
	.read_data_0	(default_grp_read_data_0_out),
	.imu_error_log_en_reg_select_pulse	(imu_error_log_en_reg_select_pulse),
	.imu_error_log_en_reg_select_pulse_out	(default_grp_imu_error_log_en_reg_select_pulse),
	.imu_int_en_reg_select_pulse	(imu_int_en_reg_select_pulse),
	.imu_int_en_reg_select_pulse_out	(default_grp_imu_int_en_reg_select_pulse),
	.imu_enabled_error_status_reg_select	(imu_enabled_error_status_reg_select),
	.imu_enabled_error_status_reg_select_out	(default_grp_imu_enabled_error_status_reg_select),
	.imu_logged_error_status_reg_select_pulse	(imu_logged_error_status_reg_select_pulse),
	.imu_logged_error_status_reg_select_pulse_out	(default_grp_imu_logged_error_status_reg_select_pulse),
	.imu_rds_error_log_reg_select_pulse	(imu_rds_error_log_reg_select_pulse),
	.imu_rds_error_log_reg_select_pulse_out	(default_grp_imu_rds_error_log_reg_select_pulse),
	.imu_scs_error_log_reg_select_pulse	(imu_scs_error_log_reg_select_pulse),
	.imu_scs_error_log_reg_select_pulse_out	(default_grp_imu_scs_error_log_reg_select_pulse),
	.imu_eqs_error_log_reg_select_pulse	(imu_eqs_error_log_reg_select_pulse),
	.imu_eqs_error_log_reg_select_pulse_out	(default_grp_imu_eqs_error_log_reg_select_pulse),
	.dmc_interrupt_mask_reg_select_pulse	(dmc_interrupt_mask_reg_select_pulse),
	.dmc_interrupt_mask_reg_select_pulse_out	(default_grp_dmc_interrupt_mask_reg_select_pulse),
	.dmc_interrupt_status_reg_select	(dmc_interrupt_status_reg_select),
	.dmc_interrupt_status_reg_select_out	(default_grp_dmc_interrupt_status_reg_select),
	.imu_perf_cntrl_select_pulse	(imu_perf_cntrl_select_pulse),
	.imu_perf_cntrl_select_pulse_out	(default_grp_imu_perf_cntrl_select_pulse),
	.imu_perf_cnt0_select_pulse	(imu_perf_cnt0_select_pulse),
	.imu_perf_cnt0_select_pulse_out	(default_grp_imu_perf_cnt0_select_pulse),
	.imu_perf_cnt1_select_pulse	(imu_perf_cnt1_select_pulse),
	.imu_perf_cnt1_select_pulse_out	(default_grp_imu_perf_cnt1_select_pulse),
	.msi_32_addr_reg_select_pulse	(msi_32_addr_reg_select_pulse),
	.msi_32_addr_reg_select_pulse_out	(default_grp_msi_32_addr_reg_select_pulse),
	.msi_64_addr_reg_select_pulse	(msi_64_addr_reg_select_pulse),
	.msi_64_addr_reg_select_pulse_out	(default_grp_msi_64_addr_reg_select_pulse),
	.mem_64_pcie_offset_reg_select_pulse	(mem_64_pcie_offset_reg_select_pulse),
	.mem_64_pcie_offset_reg_select_pulse_out	(default_grp_mem_64_pcie_offset_reg_select_pulse),
	.imu_logged_error_status_reg_rw1c_alias	(imu_logged_error_status_reg_rw1c_alias),
	.imu_logged_error_status_reg_rw1c_alias_out	(stage_mux_only_imu_logged_error_status_reg_rw1c_alias),
	.imu_logged_error_status_reg_rw1s_alias	(imu_logged_error_status_reg_rw1s_alias),
	.imu_logged_error_status_reg_rw1s_alias_out	(stage_mux_only_imu_logged_error_status_reg_rw1s_alias),
	.daemon_csrbus_wr_in	(daemon_csrbus_wr),
	.daemon_csrbus_wr_out	(stage_mux_only_daemon_csrbus_wr),
	.daemon_csrbus_wr_data_in	(daemon_csrbus_wr_data),
	.daemon_csrbus_wr_data_out	(stage_mux_only_daemon_csrbus_wr_data),
	.read_data_0_out	(stage_mux_only_read_data_0_out),
	.rst_l	(rst_l),
	.rst_l_out	(stage_mux_only_rst_l),
	.por_l	(por_l),
	.por_l_out	(stage_mux_only_por_l)
	);

//----- OUTPUT: csrbus_read_data
assign csrbus_read_data = stage_mux_only_read_data_0_out;

endmodule // dmu_imu_ics_csr
