// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_iss_csr.v
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
module dmu_imu_iss_csr 
	(
	clk,
	csrbus_addr,
	csrbus_wr_data,
	csrbus_wr,
	csrbus_valid,
	csrbus_mapped,
	csrbus_done,
	csrbus_read_data,
	rst_l,
	csrbus_src_bus,
	csrbus_acc_vio,
	instance_id,
	ext_wr,
	interrupt_mapping_20_mdo_mode_hw_read,
	interrupt_mapping_20_v_hw_read,
	interrupt_mapping_20_t_id_hw_read,
	interrupt_mapping_20_int_cntrl_num_hw_read,
	interrupt_mapping_21_mdo_mode_hw_read,
	interrupt_mapping_21_v_hw_read,
	interrupt_mapping_21_t_id_hw_read,
	interrupt_mapping_21_int_cntrl_num_hw_read,
	interrupt_mapping_22_mdo_mode_hw_read,
	interrupt_mapping_22_v_hw_read,
	interrupt_mapping_22_t_id_hw_read,
	interrupt_mapping_22_int_cntrl_num_hw_read,
	interrupt_mapping_23_mdo_mode_hw_read,
	interrupt_mapping_23_v_hw_read,
	interrupt_mapping_23_t_id_hw_read,
	interrupt_mapping_23_int_cntrl_num_hw_read,
	interrupt_mapping_24_mdo_mode_hw_read,
	interrupt_mapping_24_v_hw_read,
	interrupt_mapping_24_t_id_hw_read,
	interrupt_mapping_24_int_cntrl_num_hw_read,
	interrupt_mapping_25_mdo_mode_hw_read,
	interrupt_mapping_25_v_hw_read,
	interrupt_mapping_25_t_id_hw_read,
	interrupt_mapping_25_int_cntrl_num_hw_read,
	interrupt_mapping_26_mdo_mode_hw_read,
	interrupt_mapping_26_v_hw_read,
	interrupt_mapping_26_t_id_hw_read,
	interrupt_mapping_26_int_cntrl_num_hw_read,
	interrupt_mapping_27_mdo_mode_hw_read,
	interrupt_mapping_27_v_hw_read,
	interrupt_mapping_27_t_id_hw_read,
	interrupt_mapping_27_int_cntrl_num_hw_read,
	interrupt_mapping_28_mdo_mode_hw_read,
	interrupt_mapping_28_v_hw_read,
	interrupt_mapping_28_t_id_hw_read,
	interrupt_mapping_28_int_cntrl_num_hw_read,
	interrupt_mapping_29_mdo_mode_hw_read,
	interrupt_mapping_29_v_hw_read,
	interrupt_mapping_29_t_id_hw_read,
	interrupt_mapping_29_int_cntrl_num_hw_read,
	interrupt_mapping_30_mdo_mode_hw_read,
	interrupt_mapping_30_v_hw_read,
	interrupt_mapping_30_t_id_hw_read,
	interrupt_mapping_30_int_cntrl_num_hw_read,
	interrupt_mapping_31_mdo_mode_hw_read,
	interrupt_mapping_31_v_hw_read,
	interrupt_mapping_31_t_id_hw_read,
	interrupt_mapping_31_int_cntrl_num_hw_read,
	interrupt_mapping_32_mdo_mode_hw_read,
	interrupt_mapping_32_v_hw_read,
	interrupt_mapping_32_t_id_hw_read,
	interrupt_mapping_32_int_cntrl_num_hw_read,
	interrupt_mapping_33_mdo_mode_hw_read,
	interrupt_mapping_33_v_hw_read,
	interrupt_mapping_33_t_id_hw_read,
	interrupt_mapping_33_int_cntrl_num_hw_read,
	interrupt_mapping_34_mdo_mode_hw_read,
	interrupt_mapping_34_v_hw_read,
	interrupt_mapping_34_t_id_hw_read,
	interrupt_mapping_34_int_cntrl_num_hw_read,
	interrupt_mapping_35_mdo_mode_hw_read,
	interrupt_mapping_35_v_hw_read,
	interrupt_mapping_35_t_id_hw_read,
	interrupt_mapping_35_int_cntrl_num_hw_read,
	interrupt_mapping_36_mdo_mode_hw_read,
	interrupt_mapping_36_v_hw_read,
	interrupt_mapping_36_t_id_hw_read,
	interrupt_mapping_36_int_cntrl_num_hw_read,
	interrupt_mapping_37_mdo_mode_hw_read,
	interrupt_mapping_37_v_hw_read,
	interrupt_mapping_37_t_id_hw_read,
	interrupt_mapping_37_int_cntrl_num_hw_read,
	interrupt_mapping_38_mdo_mode_hw_read,
	interrupt_mapping_38_v_hw_read,
	interrupt_mapping_38_t_id_hw_read,
	interrupt_mapping_38_int_cntrl_num_hw_read,
	interrupt_mapping_39_mdo_mode_hw_read,
	interrupt_mapping_39_v_hw_read,
	interrupt_mapping_39_t_id_hw_read,
	interrupt_mapping_39_int_cntrl_num_hw_read,
	interrupt_mapping_40_mdo_mode_hw_read,
	interrupt_mapping_40_v_hw_read,
	interrupt_mapping_40_t_id_hw_read,
	interrupt_mapping_40_int_cntrl_num_hw_read,
	interrupt_mapping_41_mdo_mode_hw_read,
	interrupt_mapping_41_v_hw_read,
	interrupt_mapping_41_t_id_hw_read,
	interrupt_mapping_41_int_cntrl_num_hw_read,
	interrupt_mapping_42_mdo_mode_hw_read,
	interrupt_mapping_42_v_hw_read,
	interrupt_mapping_42_t_id_hw_read,
	interrupt_mapping_42_int_cntrl_num_hw_read,
	interrupt_mapping_43_mdo_mode_hw_read,
	interrupt_mapping_43_v_hw_read,
	interrupt_mapping_43_t_id_hw_read,
	interrupt_mapping_43_int_cntrl_num_hw_read,
	interrupt_mapping_44_mdo_mode_hw_read,
	interrupt_mapping_44_v_hw_read,
	interrupt_mapping_44_t_id_hw_read,
	interrupt_mapping_44_int_cntrl_num_hw_read,
	interrupt_mapping_45_mdo_mode_hw_read,
	interrupt_mapping_45_v_hw_read,
	interrupt_mapping_45_t_id_hw_read,
	interrupt_mapping_45_int_cntrl_num_hw_read,
	interrupt_mapping_46_mdo_mode_hw_read,
	interrupt_mapping_46_v_hw_read,
	interrupt_mapping_46_t_id_hw_read,
	interrupt_mapping_46_int_cntrl_num_hw_read,
	interrupt_mapping_47_mdo_mode_hw_read,
	interrupt_mapping_47_v_hw_read,
	interrupt_mapping_47_t_id_hw_read,
	interrupt_mapping_47_int_cntrl_num_hw_read,
	interrupt_mapping_48_mdo_mode_hw_read,
	interrupt_mapping_48_v_hw_read,
	interrupt_mapping_48_t_id_hw_read,
	interrupt_mapping_48_int_cntrl_num_hw_read,
	interrupt_mapping_49_mdo_mode_hw_read,
	interrupt_mapping_49_v_hw_read,
	interrupt_mapping_49_t_id_hw_read,
	interrupt_mapping_49_int_cntrl_num_hw_read,
	interrupt_mapping_50_mdo_mode_hw_read,
	interrupt_mapping_50_v_hw_read,
	interrupt_mapping_50_t_id_hw_read,
	interrupt_mapping_50_int_cntrl_num_hw_read,
	interrupt_mapping_51_mdo_mode_hw_read,
	interrupt_mapping_51_v_hw_read,
	interrupt_mapping_51_t_id_hw_read,
	interrupt_mapping_51_int_cntrl_num_hw_read,
	interrupt_mapping_52_mdo_mode_hw_read,
	interrupt_mapping_52_v_hw_read,
	interrupt_mapping_52_t_id_hw_read,
	interrupt_mapping_52_int_cntrl_num_hw_read,
	interrupt_mapping_53_mdo_mode_hw_read,
	interrupt_mapping_53_v_hw_read,
	interrupt_mapping_53_t_id_hw_read,
	interrupt_mapping_53_int_cntrl_num_hw_read,
	interrupt_mapping_54_mdo_mode_hw_read,
	interrupt_mapping_54_v_hw_read,
	interrupt_mapping_54_t_id_hw_read,
	interrupt_mapping_54_int_cntrl_num_hw_read,
	interrupt_mapping_55_mdo_mode_hw_read,
	interrupt_mapping_55_v_hw_read,
	interrupt_mapping_55_t_id_hw_read,
	interrupt_mapping_55_int_cntrl_num_hw_read,
	interrupt_mapping_56_mdo_mode_hw_read,
	interrupt_mapping_56_v_hw_read,
	interrupt_mapping_56_t_id_hw_read,
	interrupt_mapping_56_int_cntrl_num_hw_read,
	interrupt_mapping_57_mdo_mode_hw_read,
	interrupt_mapping_57_v_hw_read,
	interrupt_mapping_57_t_id_hw_read,
	interrupt_mapping_57_int_cntrl_num_hw_read,
	interrupt_mapping_58_mdo_mode_hw_read,
	interrupt_mapping_58_v_hw_read,
	interrupt_mapping_58_t_id_hw_read,
	interrupt_mapping_58_int_cntrl_num_hw_read,
	interrupt_mapping_59_mdo_mode_hw_read,
	interrupt_mapping_59_v_hw_read,
	interrupt_mapping_59_t_id_hw_read,
	interrupt_mapping_59_int_cntrl_num_hw_read,
	interrupt_mapping_62_mdo_mode_hw_read,
	interrupt_mapping_62_v_hw_read,
	interrupt_mapping_62_t_id_hw_read,
	interrupt_mapping_62_int_cntrl_num_hw_read,
	interrupt_mapping_63_mdo_mode_hw_read,
	interrupt_mapping_63_v_hw_read,
	interrupt_mapping_63_t_id_hw_read,
	interrupt_mapping_63_int_cntrl_num_hw_read,
	clr_int_reg_20_int_state_ext_wr_data,
	clr_int_reg_20_ext_select,
	clr_int_reg_20_int_state_ext_read_data,
	clr_int_reg_21_int_state_ext_wr_data,
	clr_int_reg_21_ext_select,
	clr_int_reg_21_int_state_ext_read_data,
	clr_int_reg_22_int_state_ext_wr_data,
	clr_int_reg_22_ext_select,
	clr_int_reg_22_int_state_ext_read_data,
	clr_int_reg_23_int_state_ext_wr_data,
	clr_int_reg_23_ext_select,
	clr_int_reg_23_int_state_ext_read_data,
	clr_int_reg_24_int_state_ext_wr_data,
	clr_int_reg_24_ext_select,
	clr_int_reg_24_int_state_ext_read_data,
	clr_int_reg_25_int_state_ext_wr_data,
	clr_int_reg_25_ext_select,
	clr_int_reg_25_int_state_ext_read_data,
	clr_int_reg_26_int_state_ext_wr_data,
	clr_int_reg_26_ext_select,
	clr_int_reg_26_int_state_ext_read_data,
	clr_int_reg_27_int_state_ext_wr_data,
	clr_int_reg_27_ext_select,
	clr_int_reg_27_int_state_ext_read_data,
	clr_int_reg_28_int_state_ext_wr_data,
	clr_int_reg_28_ext_select,
	clr_int_reg_28_int_state_ext_read_data,
	clr_int_reg_29_int_state_ext_wr_data,
	clr_int_reg_29_ext_select,
	clr_int_reg_29_int_state_ext_read_data,
	clr_int_reg_30_int_state_ext_wr_data,
	clr_int_reg_30_ext_select,
	clr_int_reg_30_int_state_ext_read_data,
	clr_int_reg_31_int_state_ext_wr_data,
	clr_int_reg_31_ext_select,
	clr_int_reg_31_int_state_ext_read_data,
	clr_int_reg_32_int_state_ext_wr_data,
	clr_int_reg_32_ext_select,
	clr_int_reg_32_int_state_ext_read_data,
	clr_int_reg_33_int_state_ext_wr_data,
	clr_int_reg_33_ext_select,
	clr_int_reg_33_int_state_ext_read_data,
	clr_int_reg_34_int_state_ext_wr_data,
	clr_int_reg_34_ext_select,
	clr_int_reg_34_int_state_ext_read_data,
	clr_int_reg_35_int_state_ext_wr_data,
	clr_int_reg_35_ext_select,
	clr_int_reg_35_int_state_ext_read_data,
	clr_int_reg_36_int_state_ext_wr_data,
	clr_int_reg_36_ext_select,
	clr_int_reg_36_int_state_ext_read_data,
	clr_int_reg_37_int_state_ext_wr_data,
	clr_int_reg_37_ext_select,
	clr_int_reg_37_int_state_ext_read_data,
	clr_int_reg_38_int_state_ext_wr_data,
	clr_int_reg_38_ext_select,
	clr_int_reg_38_int_state_ext_read_data,
	clr_int_reg_39_int_state_ext_wr_data,
	clr_int_reg_39_ext_select,
	clr_int_reg_39_int_state_ext_read_data,
	clr_int_reg_40_int_state_ext_wr_data,
	clr_int_reg_40_ext_select,
	clr_int_reg_40_int_state_ext_read_data,
	clr_int_reg_41_int_state_ext_wr_data,
	clr_int_reg_41_ext_select,
	clr_int_reg_41_int_state_ext_read_data,
	clr_int_reg_42_int_state_ext_wr_data,
	clr_int_reg_42_ext_select,
	clr_int_reg_42_int_state_ext_read_data,
	clr_int_reg_43_int_state_ext_wr_data,
	clr_int_reg_43_ext_select,
	clr_int_reg_43_int_state_ext_read_data,
	clr_int_reg_44_int_state_ext_wr_data,
	clr_int_reg_44_ext_select,
	clr_int_reg_44_int_state_ext_read_data,
	clr_int_reg_45_int_state_ext_wr_data,
	clr_int_reg_45_ext_select,
	clr_int_reg_45_int_state_ext_read_data,
	clr_int_reg_46_int_state_ext_wr_data,
	clr_int_reg_46_ext_select,
	clr_int_reg_46_int_state_ext_read_data,
	clr_int_reg_47_int_state_ext_wr_data,
	clr_int_reg_47_ext_select,
	clr_int_reg_47_int_state_ext_read_data,
	clr_int_reg_48_int_state_ext_wr_data,
	clr_int_reg_48_ext_select,
	clr_int_reg_48_int_state_ext_read_data,
	clr_int_reg_49_int_state_ext_wr_data,
	clr_int_reg_49_ext_select,
	clr_int_reg_49_int_state_ext_read_data,
	clr_int_reg_50_int_state_ext_wr_data,
	clr_int_reg_50_ext_select,
	clr_int_reg_50_int_state_ext_read_data,
	clr_int_reg_51_int_state_ext_wr_data,
	clr_int_reg_51_ext_select,
	clr_int_reg_51_int_state_ext_read_data,
	clr_int_reg_52_int_state_ext_wr_data,
	clr_int_reg_52_ext_select,
	clr_int_reg_52_int_state_ext_read_data,
	clr_int_reg_53_int_state_ext_wr_data,
	clr_int_reg_53_ext_select,
	clr_int_reg_53_int_state_ext_read_data,
	clr_int_reg_54_int_state_ext_wr_data,
	clr_int_reg_54_ext_select,
	clr_int_reg_54_int_state_ext_read_data,
	clr_int_reg_55_int_state_ext_wr_data,
	clr_int_reg_55_ext_select,
	clr_int_reg_55_int_state_ext_read_data,
	clr_int_reg_56_int_state_ext_wr_data,
	clr_int_reg_56_ext_select,
	clr_int_reg_56_int_state_ext_read_data,
	clr_int_reg_57_int_state_ext_wr_data,
	clr_int_reg_57_ext_select,
	clr_int_reg_57_int_state_ext_read_data,
	clr_int_reg_58_int_state_ext_wr_data,
	clr_int_reg_58_ext_select,
	clr_int_reg_58_int_state_ext_read_data,
	clr_int_reg_59_int_state_ext_wr_data,
	clr_int_reg_59_ext_select,
	clr_int_reg_59_int_state_ext_read_data,
	clr_int_reg_62_int_state_ext_wr_data,
	clr_int_reg_62_ext_select,
	clr_int_reg_62_int_state_ext_read_data,
	clr_int_reg_63_int_state_ext_wr_data,
	clr_int_reg_63_ext_select,
	clr_int_reg_63_int_state_ext_read_data,
	interrupt_retry_timer_limit_hw_read,
	interrupt_state_status_1_state_ext_read_data,
	interrupt_state_status_2_state_ext_read_data
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
input  rst_l;  // Reset signal
input  [1:0] csrbus_src_bus;  // Source bus
output csrbus_acc_vio;  // Violation signal
input  instance_id;  // Instance ID
output ext_wr;  // When one, csr operation is a write. When zero, operation is a
                // read.
output interrupt_mapping_20_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_20_mdo_mode.
output interrupt_mapping_20_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_20_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_20_T_ID_INT_SLC] interrupt_mapping_20_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_20_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_20_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_20_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_20_int_cntrl_num.
output interrupt_mapping_21_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_21_mdo_mode.
output interrupt_mapping_21_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_21_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_21_T_ID_INT_SLC] interrupt_mapping_21_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_21_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_21_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_21_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_21_int_cntrl_num.
output interrupt_mapping_22_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_22_mdo_mode.
output interrupt_mapping_22_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_22_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_22_T_ID_INT_SLC] interrupt_mapping_22_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_22_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_22_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_22_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_22_int_cntrl_num.
output interrupt_mapping_23_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_23_mdo_mode.
output interrupt_mapping_23_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_23_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_23_T_ID_INT_SLC] interrupt_mapping_23_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_23_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_23_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_23_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_23_int_cntrl_num.
output interrupt_mapping_24_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_24_mdo_mode.
output interrupt_mapping_24_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_24_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_24_T_ID_INT_SLC] interrupt_mapping_24_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_24_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_24_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_24_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_24_int_cntrl_num.
output interrupt_mapping_25_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_25_mdo_mode.
output interrupt_mapping_25_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_25_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_25_T_ID_INT_SLC] interrupt_mapping_25_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_25_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_25_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_25_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_25_int_cntrl_num.
output interrupt_mapping_26_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_26_mdo_mode.
output interrupt_mapping_26_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_26_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_26_T_ID_INT_SLC] interrupt_mapping_26_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_26_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_26_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_26_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_26_int_cntrl_num.
output interrupt_mapping_27_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_27_mdo_mode.
output interrupt_mapping_27_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_27_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_27_T_ID_INT_SLC] interrupt_mapping_27_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_27_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_27_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_27_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_27_int_cntrl_num.
output interrupt_mapping_28_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_28_mdo_mode.
output interrupt_mapping_28_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_28_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_28_T_ID_INT_SLC] interrupt_mapping_28_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_28_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_28_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_28_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_28_int_cntrl_num.
output interrupt_mapping_29_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_29_mdo_mode.
output interrupt_mapping_29_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_29_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_29_T_ID_INT_SLC] interrupt_mapping_29_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_29_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_29_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_29_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_29_int_cntrl_num.
output interrupt_mapping_30_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_30_mdo_mode.
output interrupt_mapping_30_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_30_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_30_T_ID_INT_SLC] interrupt_mapping_30_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_30_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_30_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_30_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_30_int_cntrl_num.
output interrupt_mapping_31_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_31_mdo_mode.
output interrupt_mapping_31_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_31_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_31_T_ID_INT_SLC] interrupt_mapping_31_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_31_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_31_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_31_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_31_int_cntrl_num.
output interrupt_mapping_32_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_32_mdo_mode.
output interrupt_mapping_32_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_32_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_32_T_ID_INT_SLC] interrupt_mapping_32_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_32_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_32_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_32_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_32_int_cntrl_num.
output interrupt_mapping_33_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_33_mdo_mode.
output interrupt_mapping_33_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_33_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_33_T_ID_INT_SLC] interrupt_mapping_33_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_33_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_33_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_33_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_33_int_cntrl_num.
output interrupt_mapping_34_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_34_mdo_mode.
output interrupt_mapping_34_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_34_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_34_T_ID_INT_SLC] interrupt_mapping_34_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_34_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_34_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_34_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_34_int_cntrl_num.
output interrupt_mapping_35_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_35_mdo_mode.
output interrupt_mapping_35_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_35_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_35_T_ID_INT_SLC] interrupt_mapping_35_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_35_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_35_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_35_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_35_int_cntrl_num.
output interrupt_mapping_36_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_36_mdo_mode.
output interrupt_mapping_36_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_36_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_36_T_ID_INT_SLC] interrupt_mapping_36_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_36_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_36_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_36_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_36_int_cntrl_num.
output interrupt_mapping_37_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_37_mdo_mode.
output interrupt_mapping_37_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_37_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_37_T_ID_INT_SLC] interrupt_mapping_37_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_37_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_37_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_37_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_37_int_cntrl_num.
output interrupt_mapping_38_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_38_mdo_mode.
output interrupt_mapping_38_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_38_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_38_T_ID_INT_SLC] interrupt_mapping_38_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_38_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_38_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_38_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_38_int_cntrl_num.
output interrupt_mapping_39_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_39_mdo_mode.
output interrupt_mapping_39_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_39_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_39_T_ID_INT_SLC] interrupt_mapping_39_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_39_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_39_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_39_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_39_int_cntrl_num.
output interrupt_mapping_40_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_40_mdo_mode.
output interrupt_mapping_40_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_40_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_40_T_ID_INT_SLC] interrupt_mapping_40_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_40_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_40_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_40_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_40_int_cntrl_num.
output interrupt_mapping_41_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_41_mdo_mode.
output interrupt_mapping_41_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_41_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_41_T_ID_INT_SLC] interrupt_mapping_41_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_41_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_41_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_41_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_41_int_cntrl_num.
output interrupt_mapping_42_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_42_mdo_mode.
output interrupt_mapping_42_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_42_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_42_T_ID_INT_SLC] interrupt_mapping_42_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_42_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_42_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_42_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_42_int_cntrl_num.
output interrupt_mapping_43_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_43_mdo_mode.
output interrupt_mapping_43_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_43_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_43_T_ID_INT_SLC] interrupt_mapping_43_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_43_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_43_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_43_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_43_int_cntrl_num.
output interrupt_mapping_44_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_44_mdo_mode.
output interrupt_mapping_44_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_44_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_44_T_ID_INT_SLC] interrupt_mapping_44_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_44_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_44_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_44_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_44_int_cntrl_num.
output interrupt_mapping_45_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_45_mdo_mode.
output interrupt_mapping_45_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_45_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_45_T_ID_INT_SLC] interrupt_mapping_45_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_45_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_45_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_45_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_45_int_cntrl_num.
output interrupt_mapping_46_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_46_mdo_mode.
output interrupt_mapping_46_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_46_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_46_T_ID_INT_SLC] interrupt_mapping_46_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_46_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_46_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_46_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_46_int_cntrl_num.
output interrupt_mapping_47_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_47_mdo_mode.
output interrupt_mapping_47_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_47_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_47_T_ID_INT_SLC] interrupt_mapping_47_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_47_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_47_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_47_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_47_int_cntrl_num.
output interrupt_mapping_48_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_48_mdo_mode.
output interrupt_mapping_48_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_48_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_48_T_ID_INT_SLC] interrupt_mapping_48_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_48_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_48_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_48_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_48_int_cntrl_num.
output interrupt_mapping_49_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_49_mdo_mode.
output interrupt_mapping_49_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_49_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_49_T_ID_INT_SLC] interrupt_mapping_49_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_49_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_49_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_49_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_49_int_cntrl_num.
output interrupt_mapping_50_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_50_mdo_mode.
output interrupt_mapping_50_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_50_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_50_T_ID_INT_SLC] interrupt_mapping_50_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_50_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_50_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_50_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_50_int_cntrl_num.
output interrupt_mapping_51_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_51_mdo_mode.
output interrupt_mapping_51_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_51_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_51_T_ID_INT_SLC] interrupt_mapping_51_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_51_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_51_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_51_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_51_int_cntrl_num.
output interrupt_mapping_52_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_52_mdo_mode.
output interrupt_mapping_52_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_52_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_52_T_ID_INT_SLC] interrupt_mapping_52_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_52_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_52_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_52_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_52_int_cntrl_num.
output interrupt_mapping_53_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_53_mdo_mode.
output interrupt_mapping_53_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_53_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_53_T_ID_INT_SLC] interrupt_mapping_53_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_53_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_53_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_53_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_53_int_cntrl_num.
output interrupt_mapping_54_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_54_mdo_mode.
output interrupt_mapping_54_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_54_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_54_T_ID_INT_SLC] interrupt_mapping_54_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_54_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_54_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_54_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_54_int_cntrl_num.
output interrupt_mapping_55_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_55_mdo_mode.
output interrupt_mapping_55_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_55_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_55_T_ID_INT_SLC] interrupt_mapping_55_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_55_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_55_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_55_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_55_int_cntrl_num.
output interrupt_mapping_56_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_56_mdo_mode.
output interrupt_mapping_56_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_56_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_56_T_ID_INT_SLC] interrupt_mapping_56_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_56_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_56_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_56_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_56_int_cntrl_num.
output interrupt_mapping_57_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_57_mdo_mode.
output interrupt_mapping_57_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_57_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_57_T_ID_INT_SLC] interrupt_mapping_57_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_57_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_57_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_57_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_57_int_cntrl_num.
output interrupt_mapping_58_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_58_mdo_mode.
output interrupt_mapping_58_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_58_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_58_T_ID_INT_SLC] interrupt_mapping_58_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_58_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_58_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_58_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_58_int_cntrl_num.
output interrupt_mapping_59_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_59_mdo_mode.
output interrupt_mapping_59_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_59_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_59_T_ID_INT_SLC] interrupt_mapping_59_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_59_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_59_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_59_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_59_int_cntrl_num.
output interrupt_mapping_62_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_62_mdo_mode.
output interrupt_mapping_62_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_62_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_62_T_ID_INT_SLC] interrupt_mapping_62_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_62_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_62_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_62_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_62_int_cntrl_num.
output interrupt_mapping_63_mdo_mode_hw_read;  // This signal provides the
                                               // current value of
                                               // interrupt_mapping_63_mdo_mode.
output interrupt_mapping_63_v_hw_read;  // This signal provides the current
                                        // value of interrupt_mapping_63_v.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_63_T_ID_INT_SLC] interrupt_mapping_63_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_63_t_id.
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_63_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_63_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_63_int_cntrl_num.
output [1:0] clr_int_reg_20_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_20", field
                                                    // "int_state"
output clr_int_reg_20_ext_select;  // When set, register clr_int_reg_20 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_20_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_21_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_21", field
                                                    // "int_state"
output clr_int_reg_21_ext_select;  // When set, register clr_int_reg_21 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_21_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_22_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_22", field
                                                    // "int_state"
output clr_int_reg_22_ext_select;  // When set, register clr_int_reg_22 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_22_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_23_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_23", field
                                                    // "int_state"
output clr_int_reg_23_ext_select;  // When set, register clr_int_reg_23 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_23_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_24_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_24", field
                                                    // "int_state"
output clr_int_reg_24_ext_select;  // When set, register clr_int_reg_24 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_24_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_25_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_25", field
                                                    // "int_state"
output clr_int_reg_25_ext_select;  // When set, register clr_int_reg_25 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_25_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_26_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_26", field
                                                    // "int_state"
output clr_int_reg_26_ext_select;  // When set, register clr_int_reg_26 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_26_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_27_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_27", field
                                                    // "int_state"
output clr_int_reg_27_ext_select;  // When set, register clr_int_reg_27 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_27_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_28_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_28", field
                                                    // "int_state"
output clr_int_reg_28_ext_select;  // When set, register clr_int_reg_28 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_28_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_29_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_29", field
                                                    // "int_state"
output clr_int_reg_29_ext_select;  // When set, register clr_int_reg_29 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_29_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_30_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_30", field
                                                    // "int_state"
output clr_int_reg_30_ext_select;  // When set, register clr_int_reg_30 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_30_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_31_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_31", field
                                                    // "int_state"
output clr_int_reg_31_ext_select;  // When set, register clr_int_reg_31 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_31_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_32_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_32", field
                                                    // "int_state"
output clr_int_reg_32_ext_select;  // When set, register clr_int_reg_32 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_32_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_33_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_33", field
                                                    // "int_state"
output clr_int_reg_33_ext_select;  // When set, register clr_int_reg_33 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_33_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_34_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_34", field
                                                    // "int_state"
output clr_int_reg_34_ext_select;  // When set, register clr_int_reg_34 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_34_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_35_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_35", field
                                                    // "int_state"
output clr_int_reg_35_ext_select;  // When set, register clr_int_reg_35 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_35_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_36_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_36", field
                                                    // "int_state"
output clr_int_reg_36_ext_select;  // When set, register clr_int_reg_36 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_36_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_37_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_37", field
                                                    // "int_state"
output clr_int_reg_37_ext_select;  // When set, register clr_int_reg_37 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_37_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_38_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_38", field
                                                    // "int_state"
output clr_int_reg_38_ext_select;  // When set, register clr_int_reg_38 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_38_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_39_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_39", field
                                                    // "int_state"
output clr_int_reg_39_ext_select;  // When set, register clr_int_reg_39 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_39_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_40_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_40", field
                                                    // "int_state"
output clr_int_reg_40_ext_select;  // When set, register clr_int_reg_40 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_40_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_41_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_41", field
                                                    // "int_state"
output clr_int_reg_41_ext_select;  // When set, register clr_int_reg_41 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_41_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_42_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_42", field
                                                    // "int_state"
output clr_int_reg_42_ext_select;  // When set, register clr_int_reg_42 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_42_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_43_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_43", field
                                                    // "int_state"
output clr_int_reg_43_ext_select;  // When set, register clr_int_reg_43 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_43_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_44_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_44", field
                                                    // "int_state"
output clr_int_reg_44_ext_select;  // When set, register clr_int_reg_44 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_44_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_45_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_45", field
                                                    // "int_state"
output clr_int_reg_45_ext_select;  // When set, register clr_int_reg_45 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_45_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_46_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_46", field
                                                    // "int_state"
output clr_int_reg_46_ext_select;  // When set, register clr_int_reg_46 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_46_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_47_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_47", field
                                                    // "int_state"
output clr_int_reg_47_ext_select;  // When set, register clr_int_reg_47 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_47_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_48_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_48", field
                                                    // "int_state"
output clr_int_reg_48_ext_select;  // When set, register clr_int_reg_48 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_48_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_49_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_49", field
                                                    // "int_state"
output clr_int_reg_49_ext_select;  // When set, register clr_int_reg_49 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_49_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_50_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_50", field
                                                    // "int_state"
output clr_int_reg_50_ext_select;  // When set, register clr_int_reg_50 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_50_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_51_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_51", field
                                                    // "int_state"
output clr_int_reg_51_ext_select;  // When set, register clr_int_reg_51 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_51_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_52_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_52", field
                                                    // "int_state"
output clr_int_reg_52_ext_select;  // When set, register clr_int_reg_52 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_52_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_53_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_53", field
                                                    // "int_state"
output clr_int_reg_53_ext_select;  // When set, register clr_int_reg_53 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_53_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_54_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_54", field
                                                    // "int_state"
output clr_int_reg_54_ext_select;  // When set, register clr_int_reg_54 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_54_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_55_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_55", field
                                                    // "int_state"
output clr_int_reg_55_ext_select;  // When set, register clr_int_reg_55 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_55_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_56_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_56", field
                                                    // "int_state"
output clr_int_reg_56_ext_select;  // When set, register clr_int_reg_56 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_56_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_57_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_57", field
                                                    // "int_state"
output clr_int_reg_57_ext_select;  // When set, register clr_int_reg_57 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_57_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_58_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_58", field
                                                    // "int_state"
output clr_int_reg_58_ext_select;  // When set, register clr_int_reg_58 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_58_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_59_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_59", field
                                                    // "int_state"
output clr_int_reg_59_ext_select;  // When set, register clr_int_reg_59 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_59_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_62_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_62", field
                                                    // "int_state"
output clr_int_reg_62_ext_select;  // When set, register clr_int_reg_62 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_62_int_state_ext_read_data;  // Ext read data (decode)
output [1:0] clr_int_reg_63_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_63", field
                                                    // "int_state"
output clr_int_reg_63_ext_select;  // When set, register clr_int_reg_63 is
                                   // selected. This signal is a pulse.
input  [1:0] clr_int_reg_63_int_state_ext_read_data;  // Ext read data (decode)
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_RETRY_TIMER_LIMIT_INT_SLC] interrupt_retry_timer_limit_hw_read;
    // This signal provides the current value of interrupt_retry_timer_limit.
input  [23:0] interrupt_state_status_1_state_ext_read_data;  // Ext read data
                                                             // (decode)
input  [63:0] interrupt_state_status_2_state_ext_read_data;  // Ext read data
                                                             // (decode)

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
wire rst_l;  // Reset signal
wire [1:0] csrbus_src_bus;  // Source bus
wire csrbus_acc_vio;  // Violation signal
wire instance_id;  // Instance ID
wire ext_wr;  // When one, csr operation is a write. When zero, operation is a
              // read.
wire interrupt_mapping_20_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_20_mdo_mode.
wire interrupt_mapping_20_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_20_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_20_T_ID_INT_SLC] interrupt_mapping_20_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_20_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_20_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_20_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_20_int_cntrl_num.
wire interrupt_mapping_21_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_21_mdo_mode.
wire interrupt_mapping_21_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_21_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_21_T_ID_INT_SLC] interrupt_mapping_21_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_21_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_21_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_21_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_21_int_cntrl_num.
wire interrupt_mapping_22_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_22_mdo_mode.
wire interrupt_mapping_22_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_22_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_22_T_ID_INT_SLC] interrupt_mapping_22_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_22_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_22_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_22_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_22_int_cntrl_num.
wire interrupt_mapping_23_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_23_mdo_mode.
wire interrupt_mapping_23_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_23_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_23_T_ID_INT_SLC] interrupt_mapping_23_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_23_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_23_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_23_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_23_int_cntrl_num.
wire interrupt_mapping_24_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_24_mdo_mode.
wire interrupt_mapping_24_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_24_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_24_T_ID_INT_SLC] interrupt_mapping_24_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_24_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_24_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_24_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_24_int_cntrl_num.
wire interrupt_mapping_25_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_25_mdo_mode.
wire interrupt_mapping_25_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_25_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_25_T_ID_INT_SLC] interrupt_mapping_25_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_25_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_25_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_25_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_25_int_cntrl_num.
wire interrupt_mapping_26_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_26_mdo_mode.
wire interrupt_mapping_26_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_26_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_26_T_ID_INT_SLC] interrupt_mapping_26_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_26_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_26_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_26_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_26_int_cntrl_num.
wire interrupt_mapping_27_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_27_mdo_mode.
wire interrupt_mapping_27_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_27_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_27_T_ID_INT_SLC] interrupt_mapping_27_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_27_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_27_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_27_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_27_int_cntrl_num.
wire interrupt_mapping_28_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_28_mdo_mode.
wire interrupt_mapping_28_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_28_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_28_T_ID_INT_SLC] interrupt_mapping_28_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_28_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_28_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_28_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_28_int_cntrl_num.
wire interrupt_mapping_29_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_29_mdo_mode.
wire interrupt_mapping_29_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_29_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_29_T_ID_INT_SLC] interrupt_mapping_29_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_29_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_29_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_29_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_29_int_cntrl_num.
wire interrupt_mapping_30_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_30_mdo_mode.
wire interrupt_mapping_30_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_30_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_30_T_ID_INT_SLC] interrupt_mapping_30_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_30_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_30_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_30_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_30_int_cntrl_num.
wire interrupt_mapping_31_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_31_mdo_mode.
wire interrupt_mapping_31_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_31_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_31_T_ID_INT_SLC] interrupt_mapping_31_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_31_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_31_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_31_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_31_int_cntrl_num.
wire interrupt_mapping_32_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_32_mdo_mode.
wire interrupt_mapping_32_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_32_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_32_T_ID_INT_SLC] interrupt_mapping_32_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_32_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_32_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_32_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_32_int_cntrl_num.
wire interrupt_mapping_33_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_33_mdo_mode.
wire interrupt_mapping_33_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_33_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_33_T_ID_INT_SLC] interrupt_mapping_33_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_33_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_33_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_33_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_33_int_cntrl_num.
wire interrupt_mapping_34_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_34_mdo_mode.
wire interrupt_mapping_34_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_34_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_34_T_ID_INT_SLC] interrupt_mapping_34_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_34_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_34_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_34_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_34_int_cntrl_num.
wire interrupt_mapping_35_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_35_mdo_mode.
wire interrupt_mapping_35_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_35_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_35_T_ID_INT_SLC] interrupt_mapping_35_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_35_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_35_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_35_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_35_int_cntrl_num.
wire interrupt_mapping_36_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_36_mdo_mode.
wire interrupt_mapping_36_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_36_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_36_T_ID_INT_SLC] interrupt_mapping_36_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_36_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_36_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_36_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_36_int_cntrl_num.
wire interrupt_mapping_37_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_37_mdo_mode.
wire interrupt_mapping_37_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_37_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_37_T_ID_INT_SLC] interrupt_mapping_37_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_37_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_37_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_37_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_37_int_cntrl_num.
wire interrupt_mapping_38_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_38_mdo_mode.
wire interrupt_mapping_38_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_38_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_38_T_ID_INT_SLC] interrupt_mapping_38_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_38_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_38_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_38_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_38_int_cntrl_num.
wire interrupt_mapping_39_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_39_mdo_mode.
wire interrupt_mapping_39_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_39_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_39_T_ID_INT_SLC] interrupt_mapping_39_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_39_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_39_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_39_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_39_int_cntrl_num.
wire interrupt_mapping_40_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_40_mdo_mode.
wire interrupt_mapping_40_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_40_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_40_T_ID_INT_SLC] interrupt_mapping_40_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_40_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_40_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_40_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_40_int_cntrl_num.
wire interrupt_mapping_41_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_41_mdo_mode.
wire interrupt_mapping_41_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_41_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_41_T_ID_INT_SLC] interrupt_mapping_41_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_41_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_41_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_41_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_41_int_cntrl_num.
wire interrupt_mapping_42_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_42_mdo_mode.
wire interrupt_mapping_42_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_42_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_42_T_ID_INT_SLC] interrupt_mapping_42_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_42_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_42_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_42_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_42_int_cntrl_num.
wire interrupt_mapping_43_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_43_mdo_mode.
wire interrupt_mapping_43_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_43_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_43_T_ID_INT_SLC] interrupt_mapping_43_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_43_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_43_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_43_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_43_int_cntrl_num.
wire interrupt_mapping_44_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_44_mdo_mode.
wire interrupt_mapping_44_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_44_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_44_T_ID_INT_SLC] interrupt_mapping_44_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_44_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_44_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_44_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_44_int_cntrl_num.
wire interrupt_mapping_45_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_45_mdo_mode.
wire interrupt_mapping_45_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_45_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_45_T_ID_INT_SLC] interrupt_mapping_45_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_45_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_45_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_45_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_45_int_cntrl_num.
wire interrupt_mapping_46_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_46_mdo_mode.
wire interrupt_mapping_46_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_46_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_46_T_ID_INT_SLC] interrupt_mapping_46_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_46_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_46_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_46_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_46_int_cntrl_num.
wire interrupt_mapping_47_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_47_mdo_mode.
wire interrupt_mapping_47_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_47_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_47_T_ID_INT_SLC] interrupt_mapping_47_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_47_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_47_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_47_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_47_int_cntrl_num.
wire interrupt_mapping_48_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_48_mdo_mode.
wire interrupt_mapping_48_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_48_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_48_T_ID_INT_SLC] interrupt_mapping_48_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_48_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_48_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_48_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_48_int_cntrl_num.
wire interrupt_mapping_49_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_49_mdo_mode.
wire interrupt_mapping_49_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_49_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_49_T_ID_INT_SLC] interrupt_mapping_49_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_49_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_49_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_49_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_49_int_cntrl_num.
wire interrupt_mapping_50_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_50_mdo_mode.
wire interrupt_mapping_50_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_50_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_50_T_ID_INT_SLC] interrupt_mapping_50_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_50_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_50_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_50_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_50_int_cntrl_num.
wire interrupt_mapping_51_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_51_mdo_mode.
wire interrupt_mapping_51_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_51_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_51_T_ID_INT_SLC] interrupt_mapping_51_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_51_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_51_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_51_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_51_int_cntrl_num.
wire interrupt_mapping_52_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_52_mdo_mode.
wire interrupt_mapping_52_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_52_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_52_T_ID_INT_SLC] interrupt_mapping_52_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_52_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_52_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_52_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_52_int_cntrl_num.
wire interrupt_mapping_53_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_53_mdo_mode.
wire interrupt_mapping_53_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_53_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_53_T_ID_INT_SLC] interrupt_mapping_53_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_53_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_53_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_53_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_53_int_cntrl_num.
wire interrupt_mapping_54_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_54_mdo_mode.
wire interrupt_mapping_54_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_54_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_54_T_ID_INT_SLC] interrupt_mapping_54_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_54_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_54_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_54_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_54_int_cntrl_num.
wire interrupt_mapping_55_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_55_mdo_mode.
wire interrupt_mapping_55_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_55_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_55_T_ID_INT_SLC] interrupt_mapping_55_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_55_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_55_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_55_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_55_int_cntrl_num.
wire interrupt_mapping_56_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_56_mdo_mode.
wire interrupt_mapping_56_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_56_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_56_T_ID_INT_SLC] interrupt_mapping_56_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_56_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_56_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_56_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_56_int_cntrl_num.
wire interrupt_mapping_57_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_57_mdo_mode.
wire interrupt_mapping_57_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_57_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_57_T_ID_INT_SLC] interrupt_mapping_57_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_57_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_57_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_57_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_57_int_cntrl_num.
wire interrupt_mapping_58_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_58_mdo_mode.
wire interrupt_mapping_58_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_58_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_58_T_ID_INT_SLC] interrupt_mapping_58_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_58_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_58_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_58_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_58_int_cntrl_num.
wire interrupt_mapping_59_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_59_mdo_mode.
wire interrupt_mapping_59_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_59_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_59_T_ID_INT_SLC] interrupt_mapping_59_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_59_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_59_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_59_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_59_int_cntrl_num.
wire interrupt_mapping_62_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_62_mdo_mode.
wire interrupt_mapping_62_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_62_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_62_T_ID_INT_SLC] interrupt_mapping_62_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_62_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_62_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_62_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_62_int_cntrl_num.
wire interrupt_mapping_63_mdo_mode_hw_read;  // This signal provides the current
                                             // value of
                                             // interrupt_mapping_63_mdo_mode.
wire interrupt_mapping_63_v_hw_read;  // This signal provides the current value
                                      // of interrupt_mapping_63_v.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_63_T_ID_INT_SLC] interrupt_mapping_63_t_id_hw_read;
    // This signal provides the current value of interrupt_mapping_63_t_id.
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_63_INT_CNTRL_NUM_INT_SLC] interrupt_mapping_63_int_cntrl_num_hw_read;
    // This signal provides the current value of
    // interrupt_mapping_63_int_cntrl_num.
wire [1:0] clr_int_reg_20_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_20", field
                                                  // "int_state"
wire clr_int_reg_20_ext_select;  // When set, register clr_int_reg_20 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_20_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_21_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_21", field
                                                  // "int_state"
wire clr_int_reg_21_ext_select;  // When set, register clr_int_reg_21 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_21_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_22_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_22", field
                                                  // "int_state"
wire clr_int_reg_22_ext_select;  // When set, register clr_int_reg_22 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_22_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_23_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_23", field
                                                  // "int_state"
wire clr_int_reg_23_ext_select;  // When set, register clr_int_reg_23 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_23_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_24_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_24", field
                                                  // "int_state"
wire clr_int_reg_24_ext_select;  // When set, register clr_int_reg_24 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_24_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_25_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_25", field
                                                  // "int_state"
wire clr_int_reg_25_ext_select;  // When set, register clr_int_reg_25 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_25_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_26_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_26", field
                                                  // "int_state"
wire clr_int_reg_26_ext_select;  // When set, register clr_int_reg_26 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_26_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_27_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_27", field
                                                  // "int_state"
wire clr_int_reg_27_ext_select;  // When set, register clr_int_reg_27 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_27_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_28_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_28", field
                                                  // "int_state"
wire clr_int_reg_28_ext_select;  // When set, register clr_int_reg_28 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_28_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_29_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_29", field
                                                  // "int_state"
wire clr_int_reg_29_ext_select;  // When set, register clr_int_reg_29 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_29_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_30_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_30", field
                                                  // "int_state"
wire clr_int_reg_30_ext_select;  // When set, register clr_int_reg_30 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_30_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_31_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_31", field
                                                  // "int_state"
wire clr_int_reg_31_ext_select;  // When set, register clr_int_reg_31 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_31_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_32_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_32", field
                                                  // "int_state"
wire clr_int_reg_32_ext_select;  // When set, register clr_int_reg_32 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_32_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_33_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_33", field
                                                  // "int_state"
wire clr_int_reg_33_ext_select;  // When set, register clr_int_reg_33 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_33_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_34_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_34", field
                                                  // "int_state"
wire clr_int_reg_34_ext_select;  // When set, register clr_int_reg_34 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_34_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_35_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_35", field
                                                  // "int_state"
wire clr_int_reg_35_ext_select;  // When set, register clr_int_reg_35 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_35_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_36_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_36", field
                                                  // "int_state"
wire clr_int_reg_36_ext_select;  // When set, register clr_int_reg_36 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_36_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_37_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_37", field
                                                  // "int_state"
wire clr_int_reg_37_ext_select;  // When set, register clr_int_reg_37 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_37_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_38_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_38", field
                                                  // "int_state"
wire clr_int_reg_38_ext_select;  // When set, register clr_int_reg_38 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_38_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_39_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_39", field
                                                  // "int_state"
wire clr_int_reg_39_ext_select;  // When set, register clr_int_reg_39 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_39_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_40_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_40", field
                                                  // "int_state"
wire clr_int_reg_40_ext_select;  // When set, register clr_int_reg_40 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_40_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_41_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_41", field
                                                  // "int_state"
wire clr_int_reg_41_ext_select;  // When set, register clr_int_reg_41 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_41_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_42_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_42", field
                                                  // "int_state"
wire clr_int_reg_42_ext_select;  // When set, register clr_int_reg_42 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_42_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_43_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_43", field
                                                  // "int_state"
wire clr_int_reg_43_ext_select;  // When set, register clr_int_reg_43 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_43_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_44_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_44", field
                                                  // "int_state"
wire clr_int_reg_44_ext_select;  // When set, register clr_int_reg_44 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_44_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_45_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_45", field
                                                  // "int_state"
wire clr_int_reg_45_ext_select;  // When set, register clr_int_reg_45 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_45_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_46_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_46", field
                                                  // "int_state"
wire clr_int_reg_46_ext_select;  // When set, register clr_int_reg_46 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_46_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_47_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_47", field
                                                  // "int_state"
wire clr_int_reg_47_ext_select;  // When set, register clr_int_reg_47 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_47_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_48_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_48", field
                                                  // "int_state"
wire clr_int_reg_48_ext_select;  // When set, register clr_int_reg_48 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_48_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_49_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_49", field
                                                  // "int_state"
wire clr_int_reg_49_ext_select;  // When set, register clr_int_reg_49 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_49_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_50_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_50", field
                                                  // "int_state"
wire clr_int_reg_50_ext_select;  // When set, register clr_int_reg_50 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_50_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_51_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_51", field
                                                  // "int_state"
wire clr_int_reg_51_ext_select;  // When set, register clr_int_reg_51 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_51_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_52_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_52", field
                                                  // "int_state"
wire clr_int_reg_52_ext_select;  // When set, register clr_int_reg_52 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_52_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_53_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_53", field
                                                  // "int_state"
wire clr_int_reg_53_ext_select;  // When set, register clr_int_reg_53 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_53_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_54_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_54", field
                                                  // "int_state"
wire clr_int_reg_54_ext_select;  // When set, register clr_int_reg_54 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_54_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_55_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_55", field
                                                  // "int_state"
wire clr_int_reg_55_ext_select;  // When set, register clr_int_reg_55 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_55_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_56_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_56", field
                                                  // "int_state"
wire clr_int_reg_56_ext_select;  // When set, register clr_int_reg_56 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_56_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_57_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_57", field
                                                  // "int_state"
wire clr_int_reg_57_ext_select;  // When set, register clr_int_reg_57 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_57_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_58_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_58", field
                                                  // "int_state"
wire clr_int_reg_58_ext_select;  // When set, register clr_int_reg_58 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_58_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_59_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_59", field
                                                  // "int_state"
wire clr_int_reg_59_ext_select;  // When set, register clr_int_reg_59 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_59_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_62_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_62", field
                                                  // "int_state"
wire clr_int_reg_62_ext_select;  // When set, register clr_int_reg_62 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_62_int_state_ext_read_data;  // Ext read data (decode)
wire [1:0] clr_int_reg_63_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_63", field
                                                  // "int_state"
wire clr_int_reg_63_ext_select;  // When set, register clr_int_reg_63 is
                                 // selected. This signal is a pulse.
wire [1:0] clr_int_reg_63_int_state_ext_read_data;  // Ext read data (decode)
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_RETRY_TIMER_LIMIT_INT_SLC] interrupt_retry_timer_limit_hw_read;
    // This signal provides the current value of interrupt_retry_timer_limit.
wire [23:0] interrupt_state_status_1_state_ext_read_data;  // Ext read data
                                                           // (decode)
wire [63:0] interrupt_state_status_2_state_ext_read_data;  // Ext read data
                                                           // (decode)

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
wire interrupt_mapping_20_select_pulse;
wire interrupt_mapping_21_select_pulse;
wire interrupt_mapping_22_select_pulse;
wire interrupt_mapping_23_select_pulse;
wire interrupt_mapping_24_select_pulse;
wire interrupt_mapping_25_select_pulse;
wire interrupt_mapping_26_select_pulse;
wire interrupt_mapping_27_select_pulse;
wire interrupt_mapping_28_select_pulse;
wire interrupt_mapping_29_select_pulse;
wire interrupt_mapping_30_select_pulse;
wire interrupt_mapping_31_select_pulse;
wire interrupt_mapping_32_select_pulse;
wire interrupt_mapping_33_select_pulse;
wire interrupt_mapping_34_select_pulse;
wire interrupt_mapping_35_select_pulse;
wire interrupt_mapping_36_select_pulse;
wire interrupt_mapping_37_select_pulse;
wire interrupt_mapping_38_select_pulse;
wire interrupt_mapping_39_select_pulse;
wire interrupt_mapping_40_select_pulse;
wire interrupt_mapping_41_select_pulse;
wire interrupt_mapping_42_select_pulse;
wire interrupt_mapping_43_select_pulse;
wire interrupt_mapping_44_select_pulse;
wire interrupt_mapping_45_select_pulse;
wire interrupt_mapping_46_select_pulse;
wire interrupt_mapping_47_select_pulse;
wire interrupt_mapping_48_select_pulse;
wire interrupt_mapping_49_select_pulse;
wire interrupt_mapping_50_select_pulse;
wire interrupt_mapping_51_select_pulse;
wire interrupt_mapping_52_select_pulse;
wire interrupt_mapping_53_select_pulse;
wire interrupt_mapping_54_select_pulse;
wire interrupt_mapping_55_select_pulse;
wire interrupt_mapping_56_select_pulse;
wire interrupt_mapping_57_select_pulse;
wire interrupt_mapping_58_select_pulse;
wire interrupt_mapping_59_select_pulse;
wire interrupt_mapping_62_select_pulse;
wire interrupt_mapping_63_select_pulse;
wire clr_int_reg_20_select;
wire clr_int_reg_21_select;
wire clr_int_reg_22_select;
wire clr_int_reg_23_select;
wire clr_int_reg_24_select;
wire clr_int_reg_25_select;
wire clr_int_reg_26_select;
wire clr_int_reg_27_select;
wire clr_int_reg_28_select;
wire clr_int_reg_29_select;
wire clr_int_reg_30_select;
wire clr_int_reg_31_select;
wire clr_int_reg_32_select;
wire clr_int_reg_33_select;
wire clr_int_reg_34_select;
wire clr_int_reg_35_select;
wire clr_int_reg_36_select;
wire clr_int_reg_37_select;
wire clr_int_reg_38_select;
wire clr_int_reg_39_select;
wire clr_int_reg_40_select;
wire clr_int_reg_41_select;
wire clr_int_reg_42_select;
wire clr_int_reg_43_select;
wire clr_int_reg_44_select;
wire clr_int_reg_45_select;
wire clr_int_reg_46_select;
wire clr_int_reg_47_select;
wire clr_int_reg_48_select;
wire clr_int_reg_49_select;
wire clr_int_reg_50_select;
wire clr_int_reg_51_select;
wire clr_int_reg_52_select;
wire clr_int_reg_53_select;
wire clr_int_reg_54_select;
wire clr_int_reg_55_select;
wire clr_int_reg_56_select;
wire clr_int_reg_57_select;
wire clr_int_reg_58_select;
wire clr_int_reg_59_select;
wire clr_int_reg_62_select;
wire clr_int_reg_63_select;
wire interrupt_retry_timer_select_pulse;
wire interrupt_state_status_1_select;
wire interrupt_state_status_2_select;

dmu_imu_iss_addr_decode dmu_imu_iss_addr_decode
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
	.interrupt_mapping_20_select_pulse	(interrupt_mapping_20_select_pulse),
	.interrupt_mapping_21_select_pulse	(interrupt_mapping_21_select_pulse),
	.interrupt_mapping_22_select_pulse	(interrupt_mapping_22_select_pulse),
	.interrupt_mapping_23_select_pulse	(interrupt_mapping_23_select_pulse),
	.interrupt_mapping_24_select_pulse	(interrupt_mapping_24_select_pulse),
	.interrupt_mapping_25_select_pulse	(interrupt_mapping_25_select_pulse),
	.interrupt_mapping_26_select_pulse	(interrupt_mapping_26_select_pulse),
	.interrupt_mapping_27_select_pulse	(interrupt_mapping_27_select_pulse),
	.interrupt_mapping_28_select_pulse	(interrupt_mapping_28_select_pulse),
	.interrupt_mapping_29_select_pulse	(interrupt_mapping_29_select_pulse),
	.interrupt_mapping_30_select_pulse	(interrupt_mapping_30_select_pulse),
	.interrupt_mapping_31_select_pulse	(interrupt_mapping_31_select_pulse),
	.interrupt_mapping_32_select_pulse	(interrupt_mapping_32_select_pulse),
	.interrupt_mapping_33_select_pulse	(interrupt_mapping_33_select_pulse),
	.interrupt_mapping_34_select_pulse	(interrupt_mapping_34_select_pulse),
	.interrupt_mapping_35_select_pulse	(interrupt_mapping_35_select_pulse),
	.interrupt_mapping_36_select_pulse	(interrupt_mapping_36_select_pulse),
	.interrupt_mapping_37_select_pulse	(interrupt_mapping_37_select_pulse),
	.interrupt_mapping_38_select_pulse	(interrupt_mapping_38_select_pulse),
	.interrupt_mapping_39_select_pulse	(interrupt_mapping_39_select_pulse),
	.interrupt_mapping_40_select_pulse	(interrupt_mapping_40_select_pulse),
	.interrupt_mapping_41_select_pulse	(interrupt_mapping_41_select_pulse),
	.interrupt_mapping_42_select_pulse	(interrupt_mapping_42_select_pulse),
	.interrupt_mapping_43_select_pulse	(interrupt_mapping_43_select_pulse),
	.interrupt_mapping_44_select_pulse	(interrupt_mapping_44_select_pulse),
	.interrupt_mapping_45_select_pulse	(interrupt_mapping_45_select_pulse),
	.interrupt_mapping_46_select_pulse	(interrupt_mapping_46_select_pulse),
	.interrupt_mapping_47_select_pulse	(interrupt_mapping_47_select_pulse),
	.interrupt_mapping_48_select_pulse	(interrupt_mapping_48_select_pulse),
	.interrupt_mapping_49_select_pulse	(interrupt_mapping_49_select_pulse),
	.interrupt_mapping_50_select_pulse	(interrupt_mapping_50_select_pulse),
	.interrupt_mapping_51_select_pulse	(interrupt_mapping_51_select_pulse),
	.interrupt_mapping_52_select_pulse	(interrupt_mapping_52_select_pulse),
	.interrupt_mapping_53_select_pulse	(interrupt_mapping_53_select_pulse),
	.interrupt_mapping_54_select_pulse	(interrupt_mapping_54_select_pulse),
	.interrupt_mapping_55_select_pulse	(interrupt_mapping_55_select_pulse),
	.interrupt_mapping_56_select_pulse	(interrupt_mapping_56_select_pulse),
	.interrupt_mapping_57_select_pulse	(interrupt_mapping_57_select_pulse),
	.interrupt_mapping_58_select_pulse	(interrupt_mapping_58_select_pulse),
	.interrupt_mapping_59_select_pulse	(interrupt_mapping_59_select_pulse),
	.interrupt_mapping_62_select_pulse	(interrupt_mapping_62_select_pulse),
	.interrupt_mapping_63_select_pulse	(interrupt_mapping_63_select_pulse),
	.clr_int_reg_20_select	(clr_int_reg_20_select),
	.clr_int_reg_21_select	(clr_int_reg_21_select),
	.clr_int_reg_22_select	(clr_int_reg_22_select),
	.clr_int_reg_23_select	(clr_int_reg_23_select),
	.clr_int_reg_24_select	(clr_int_reg_24_select),
	.clr_int_reg_25_select	(clr_int_reg_25_select),
	.clr_int_reg_26_select	(clr_int_reg_26_select),
	.clr_int_reg_27_select	(clr_int_reg_27_select),
	.clr_int_reg_28_select	(clr_int_reg_28_select),
	.clr_int_reg_29_select	(clr_int_reg_29_select),
	.clr_int_reg_30_select	(clr_int_reg_30_select),
	.clr_int_reg_31_select	(clr_int_reg_31_select),
	.clr_int_reg_32_select	(clr_int_reg_32_select),
	.clr_int_reg_33_select	(clr_int_reg_33_select),
	.clr_int_reg_34_select	(clr_int_reg_34_select),
	.clr_int_reg_35_select	(clr_int_reg_35_select),
	.clr_int_reg_36_select	(clr_int_reg_36_select),
	.clr_int_reg_37_select	(clr_int_reg_37_select),
	.clr_int_reg_38_select	(clr_int_reg_38_select),
	.clr_int_reg_39_select	(clr_int_reg_39_select),
	.clr_int_reg_40_select	(clr_int_reg_40_select),
	.clr_int_reg_41_select	(clr_int_reg_41_select),
	.clr_int_reg_42_select	(clr_int_reg_42_select),
	.clr_int_reg_43_select	(clr_int_reg_43_select),
	.clr_int_reg_44_select	(clr_int_reg_44_select),
	.clr_int_reg_45_select	(clr_int_reg_45_select),
	.clr_int_reg_46_select	(clr_int_reg_46_select),
	.clr_int_reg_47_select	(clr_int_reg_47_select),
	.clr_int_reg_48_select	(clr_int_reg_48_select),
	.clr_int_reg_49_select	(clr_int_reg_49_select),
	.clr_int_reg_50_select	(clr_int_reg_50_select),
	.clr_int_reg_51_select	(clr_int_reg_51_select),
	.clr_int_reg_52_select	(clr_int_reg_52_select),
	.clr_int_reg_53_select	(clr_int_reg_53_select),
	.clr_int_reg_54_select	(clr_int_reg_54_select),
	.clr_int_reg_55_select	(clr_int_reg_55_select),
	.clr_int_reg_56_select	(clr_int_reg_56_select),
	.clr_int_reg_57_select	(clr_int_reg_57_select),
	.clr_int_reg_58_select	(clr_int_reg_58_select),
	.clr_int_reg_59_select	(clr_int_reg_59_select),
	.clr_int_reg_62_select	(clr_int_reg_62_select),
	.clr_int_reg_63_select	(clr_int_reg_63_select),
	.interrupt_retry_timer_select_pulse	(interrupt_retry_timer_select_pulse),
	.interrupt_state_status_1_select	(interrupt_state_status_1_select),
	.interrupt_state_status_2_select	(interrupt_state_status_2_select)
	);

//====================================================================
//    OUTPUT: csrbus_read_data (pipelining)
//====================================================================
//----- connecting wires
wire stage_mux_only_rst_l;
wire stage_mux_only_daemon_csrbus_wr;
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] stage_mux_only_daemon_csrbus_wr_data;

//----- Stage: 1 / Grp: default_grp (87 inputs / 1 outputs)
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] default_grp_read_data_0_out;
wire default_grp_interrupt_mapping_20_select_pulse;
wire default_grp_interrupt_mapping_21_select_pulse;
wire default_grp_interrupt_mapping_22_select_pulse;
wire default_grp_interrupt_mapping_23_select_pulse;
wire default_grp_interrupt_mapping_24_select_pulse;
wire default_grp_interrupt_mapping_25_select_pulse;
wire default_grp_interrupt_mapping_26_select_pulse;
wire default_grp_interrupt_mapping_27_select_pulse;
wire default_grp_interrupt_mapping_28_select_pulse;
wire default_grp_interrupt_mapping_29_select_pulse;
wire default_grp_interrupt_mapping_30_select_pulse;
wire default_grp_interrupt_mapping_31_select_pulse;
wire default_grp_interrupt_mapping_32_select_pulse;
wire default_grp_interrupt_mapping_33_select_pulse;
wire default_grp_interrupt_mapping_34_select_pulse;
wire default_grp_interrupt_mapping_35_select_pulse;
wire default_grp_interrupt_mapping_36_select_pulse;
wire default_grp_interrupt_mapping_37_select_pulse;
wire default_grp_interrupt_mapping_38_select_pulse;
wire default_grp_interrupt_mapping_39_select_pulse;
wire default_grp_interrupt_mapping_40_select_pulse;
wire default_grp_interrupt_mapping_41_select_pulse;
wire default_grp_interrupt_mapping_42_select_pulse;
wire default_grp_interrupt_mapping_43_select_pulse;
wire default_grp_interrupt_mapping_44_select_pulse;
wire default_grp_interrupt_mapping_45_select_pulse;
wire default_grp_interrupt_mapping_46_select_pulse;
wire default_grp_interrupt_mapping_47_select_pulse;
wire default_grp_interrupt_mapping_48_select_pulse;
wire default_grp_interrupt_mapping_49_select_pulse;
wire default_grp_interrupt_mapping_50_select_pulse;
wire default_grp_interrupt_mapping_51_select_pulse;
wire default_grp_interrupt_mapping_52_select_pulse;
wire default_grp_interrupt_mapping_53_select_pulse;
wire default_grp_interrupt_mapping_54_select_pulse;
wire default_grp_interrupt_mapping_55_select_pulse;
wire default_grp_interrupt_mapping_56_select_pulse;
wire default_grp_interrupt_mapping_57_select_pulse;
wire default_grp_interrupt_mapping_58_select_pulse;
wire default_grp_interrupt_mapping_59_select_pulse;
wire default_grp_interrupt_mapping_62_select_pulse;
wire default_grp_interrupt_mapping_63_select_pulse;
wire default_grp_clr_int_reg_20_select;
wire default_grp_clr_int_reg_21_select;
wire default_grp_clr_int_reg_22_select;
wire default_grp_clr_int_reg_23_select;
wire default_grp_clr_int_reg_24_select;
wire default_grp_clr_int_reg_25_select;
wire default_grp_clr_int_reg_26_select;
wire default_grp_clr_int_reg_27_select;
wire default_grp_clr_int_reg_28_select;
wire default_grp_clr_int_reg_29_select;
wire default_grp_clr_int_reg_30_select;
wire default_grp_clr_int_reg_31_select;
wire default_grp_clr_int_reg_32_select;
wire default_grp_clr_int_reg_33_select;
wire default_grp_clr_int_reg_34_select;
wire default_grp_clr_int_reg_35_select;
wire default_grp_clr_int_reg_36_select;
wire default_grp_clr_int_reg_37_select;
wire default_grp_clr_int_reg_38_select;
wire default_grp_clr_int_reg_39_select;
wire default_grp_clr_int_reg_40_select;
wire default_grp_clr_int_reg_41_select;
wire default_grp_clr_int_reg_42_select;
wire default_grp_clr_int_reg_43_select;
wire default_grp_clr_int_reg_44_select;
wire default_grp_clr_int_reg_45_select;
wire default_grp_clr_int_reg_46_select;
wire default_grp_clr_int_reg_47_select;
wire default_grp_clr_int_reg_48_select;
wire default_grp_clr_int_reg_49_select;
wire default_grp_clr_int_reg_50_select;
wire default_grp_clr_int_reg_51_select;
wire default_grp_clr_int_reg_52_select;
wire default_grp_clr_int_reg_53_select;
wire default_grp_clr_int_reg_54_select;
wire default_grp_clr_int_reg_55_select;
wire default_grp_clr_int_reg_56_select;
wire default_grp_clr_int_reg_57_select;
wire default_grp_clr_int_reg_58_select;
wire default_grp_clr_int_reg_59_select;
wire default_grp_clr_int_reg_62_select;
wire default_grp_clr_int_reg_63_select;
wire default_grp_interrupt_retry_timer_select_pulse;
wire default_grp_interrupt_state_status_1_select;
wire default_grp_interrupt_state_status_2_select;

dmu_imu_iss_default_grp dmu_imu_iss_default_grp
	(
	.clk	(clk),
	.interrupt_mapping_20_mdo_mode_hw_read	(interrupt_mapping_20_mdo_mode_hw_read),
	.interrupt_mapping_20_v_hw_read	(interrupt_mapping_20_v_hw_read),
	.interrupt_mapping_20_t_id_hw_read	(interrupt_mapping_20_t_id_hw_read),
	.interrupt_mapping_20_int_cntrl_num_hw_read	(interrupt_mapping_20_int_cntrl_num_hw_read),
	.interrupt_mapping_20_select_pulse	(default_grp_interrupt_mapping_20_select_pulse),
	.interrupt_mapping_21_mdo_mode_hw_read	(interrupt_mapping_21_mdo_mode_hw_read),
	.interrupt_mapping_21_v_hw_read	(interrupt_mapping_21_v_hw_read),
	.interrupt_mapping_21_t_id_hw_read	(interrupt_mapping_21_t_id_hw_read),
	.interrupt_mapping_21_int_cntrl_num_hw_read	(interrupt_mapping_21_int_cntrl_num_hw_read),
	.interrupt_mapping_21_select_pulse	(default_grp_interrupt_mapping_21_select_pulse),
	.interrupt_mapping_22_mdo_mode_hw_read	(interrupt_mapping_22_mdo_mode_hw_read),
	.interrupt_mapping_22_v_hw_read	(interrupt_mapping_22_v_hw_read),
	.interrupt_mapping_22_t_id_hw_read	(interrupt_mapping_22_t_id_hw_read),
	.interrupt_mapping_22_int_cntrl_num_hw_read	(interrupt_mapping_22_int_cntrl_num_hw_read),
	.interrupt_mapping_22_select_pulse	(default_grp_interrupt_mapping_22_select_pulse),
	.interrupt_mapping_23_mdo_mode_hw_read	(interrupt_mapping_23_mdo_mode_hw_read),
	.interrupt_mapping_23_v_hw_read	(interrupt_mapping_23_v_hw_read),
	.interrupt_mapping_23_t_id_hw_read	(interrupt_mapping_23_t_id_hw_read),
	.interrupt_mapping_23_int_cntrl_num_hw_read	(interrupt_mapping_23_int_cntrl_num_hw_read),
	.interrupt_mapping_23_select_pulse	(default_grp_interrupt_mapping_23_select_pulse),
	.interrupt_mapping_24_mdo_mode_hw_read	(interrupt_mapping_24_mdo_mode_hw_read),
	.interrupt_mapping_24_v_hw_read	(interrupt_mapping_24_v_hw_read),
	.interrupt_mapping_24_t_id_hw_read	(interrupt_mapping_24_t_id_hw_read),
	.interrupt_mapping_24_int_cntrl_num_hw_read	(interrupt_mapping_24_int_cntrl_num_hw_read),
	.interrupt_mapping_24_select_pulse	(default_grp_interrupt_mapping_24_select_pulse),
	.interrupt_mapping_25_mdo_mode_hw_read	(interrupt_mapping_25_mdo_mode_hw_read),
	.interrupt_mapping_25_v_hw_read	(interrupt_mapping_25_v_hw_read),
	.interrupt_mapping_25_t_id_hw_read	(interrupt_mapping_25_t_id_hw_read),
	.interrupt_mapping_25_int_cntrl_num_hw_read	(interrupt_mapping_25_int_cntrl_num_hw_read),
	.interrupt_mapping_25_select_pulse	(default_grp_interrupt_mapping_25_select_pulse),
	.interrupt_mapping_26_mdo_mode_hw_read	(interrupt_mapping_26_mdo_mode_hw_read),
	.interrupt_mapping_26_v_hw_read	(interrupt_mapping_26_v_hw_read),
	.interrupt_mapping_26_t_id_hw_read	(interrupt_mapping_26_t_id_hw_read),
	.interrupt_mapping_26_int_cntrl_num_hw_read	(interrupt_mapping_26_int_cntrl_num_hw_read),
	.interrupt_mapping_26_select_pulse	(default_grp_interrupt_mapping_26_select_pulse),
	.interrupt_mapping_27_mdo_mode_hw_read	(interrupt_mapping_27_mdo_mode_hw_read),
	.interrupt_mapping_27_v_hw_read	(interrupt_mapping_27_v_hw_read),
	.interrupt_mapping_27_t_id_hw_read	(interrupt_mapping_27_t_id_hw_read),
	.interrupt_mapping_27_int_cntrl_num_hw_read	(interrupt_mapping_27_int_cntrl_num_hw_read),
	.interrupt_mapping_27_select_pulse	(default_grp_interrupt_mapping_27_select_pulse),
	.interrupt_mapping_28_mdo_mode_hw_read	(interrupt_mapping_28_mdo_mode_hw_read),
	.interrupt_mapping_28_v_hw_read	(interrupt_mapping_28_v_hw_read),
	.interrupt_mapping_28_t_id_hw_read	(interrupt_mapping_28_t_id_hw_read),
	.interrupt_mapping_28_int_cntrl_num_hw_read	(interrupt_mapping_28_int_cntrl_num_hw_read),
	.interrupt_mapping_28_select_pulse	(default_grp_interrupt_mapping_28_select_pulse),
	.interrupt_mapping_29_mdo_mode_hw_read	(interrupt_mapping_29_mdo_mode_hw_read),
	.interrupt_mapping_29_v_hw_read	(interrupt_mapping_29_v_hw_read),
	.interrupt_mapping_29_t_id_hw_read	(interrupt_mapping_29_t_id_hw_read),
	.interrupt_mapping_29_int_cntrl_num_hw_read	(interrupt_mapping_29_int_cntrl_num_hw_read),
	.interrupt_mapping_29_select_pulse	(default_grp_interrupt_mapping_29_select_pulse),
	.interrupt_mapping_30_mdo_mode_hw_read	(interrupt_mapping_30_mdo_mode_hw_read),
	.interrupt_mapping_30_v_hw_read	(interrupt_mapping_30_v_hw_read),
	.interrupt_mapping_30_t_id_hw_read	(interrupt_mapping_30_t_id_hw_read),
	.interrupt_mapping_30_int_cntrl_num_hw_read	(interrupt_mapping_30_int_cntrl_num_hw_read),
	.interrupt_mapping_30_select_pulse	(default_grp_interrupt_mapping_30_select_pulse),
	.interrupt_mapping_31_mdo_mode_hw_read	(interrupt_mapping_31_mdo_mode_hw_read),
	.interrupt_mapping_31_v_hw_read	(interrupt_mapping_31_v_hw_read),
	.interrupt_mapping_31_t_id_hw_read	(interrupt_mapping_31_t_id_hw_read),
	.interrupt_mapping_31_int_cntrl_num_hw_read	(interrupt_mapping_31_int_cntrl_num_hw_read),
	.interrupt_mapping_31_select_pulse	(default_grp_interrupt_mapping_31_select_pulse),
	.interrupt_mapping_32_mdo_mode_hw_read	(interrupt_mapping_32_mdo_mode_hw_read),
	.interrupt_mapping_32_v_hw_read	(interrupt_mapping_32_v_hw_read),
	.interrupt_mapping_32_t_id_hw_read	(interrupt_mapping_32_t_id_hw_read),
	.interrupt_mapping_32_int_cntrl_num_hw_read	(interrupt_mapping_32_int_cntrl_num_hw_read),
	.interrupt_mapping_32_select_pulse	(default_grp_interrupt_mapping_32_select_pulse),
	.interrupt_mapping_33_mdo_mode_hw_read	(interrupt_mapping_33_mdo_mode_hw_read),
	.interrupt_mapping_33_v_hw_read	(interrupt_mapping_33_v_hw_read),
	.interrupt_mapping_33_t_id_hw_read	(interrupt_mapping_33_t_id_hw_read),
	.interrupt_mapping_33_int_cntrl_num_hw_read	(interrupt_mapping_33_int_cntrl_num_hw_read),
	.interrupt_mapping_33_select_pulse	(default_grp_interrupt_mapping_33_select_pulse),
	.interrupt_mapping_34_mdo_mode_hw_read	(interrupt_mapping_34_mdo_mode_hw_read),
	.interrupt_mapping_34_v_hw_read	(interrupt_mapping_34_v_hw_read),
	.interrupt_mapping_34_t_id_hw_read	(interrupt_mapping_34_t_id_hw_read),
	.interrupt_mapping_34_int_cntrl_num_hw_read	(interrupt_mapping_34_int_cntrl_num_hw_read),
	.interrupt_mapping_34_select_pulse	(default_grp_interrupt_mapping_34_select_pulse),
	.interrupt_mapping_35_mdo_mode_hw_read	(interrupt_mapping_35_mdo_mode_hw_read),
	.interrupt_mapping_35_v_hw_read	(interrupt_mapping_35_v_hw_read),
	.interrupt_mapping_35_t_id_hw_read	(interrupt_mapping_35_t_id_hw_read),
	.interrupt_mapping_35_int_cntrl_num_hw_read	(interrupt_mapping_35_int_cntrl_num_hw_read),
	.interrupt_mapping_35_select_pulse	(default_grp_interrupt_mapping_35_select_pulse),
	.interrupt_mapping_36_mdo_mode_hw_read	(interrupt_mapping_36_mdo_mode_hw_read),
	.interrupt_mapping_36_v_hw_read	(interrupt_mapping_36_v_hw_read),
	.interrupt_mapping_36_t_id_hw_read	(interrupt_mapping_36_t_id_hw_read),
	.interrupt_mapping_36_int_cntrl_num_hw_read	(interrupt_mapping_36_int_cntrl_num_hw_read),
	.interrupt_mapping_36_select_pulse	(default_grp_interrupt_mapping_36_select_pulse),
	.interrupt_mapping_37_mdo_mode_hw_read	(interrupt_mapping_37_mdo_mode_hw_read),
	.interrupt_mapping_37_v_hw_read	(interrupt_mapping_37_v_hw_read),
	.interrupt_mapping_37_t_id_hw_read	(interrupt_mapping_37_t_id_hw_read),
	.interrupt_mapping_37_int_cntrl_num_hw_read	(interrupt_mapping_37_int_cntrl_num_hw_read),
	.interrupt_mapping_37_select_pulse	(default_grp_interrupt_mapping_37_select_pulse),
	.interrupt_mapping_38_mdo_mode_hw_read	(interrupt_mapping_38_mdo_mode_hw_read),
	.interrupt_mapping_38_v_hw_read	(interrupt_mapping_38_v_hw_read),
	.interrupt_mapping_38_t_id_hw_read	(interrupt_mapping_38_t_id_hw_read),
	.interrupt_mapping_38_int_cntrl_num_hw_read	(interrupt_mapping_38_int_cntrl_num_hw_read),
	.interrupt_mapping_38_select_pulse	(default_grp_interrupt_mapping_38_select_pulse),
	.interrupt_mapping_39_mdo_mode_hw_read	(interrupt_mapping_39_mdo_mode_hw_read),
	.interrupt_mapping_39_v_hw_read	(interrupt_mapping_39_v_hw_read),
	.interrupt_mapping_39_t_id_hw_read	(interrupt_mapping_39_t_id_hw_read),
	.interrupt_mapping_39_int_cntrl_num_hw_read	(interrupt_mapping_39_int_cntrl_num_hw_read),
	.interrupt_mapping_39_select_pulse	(default_grp_interrupt_mapping_39_select_pulse),
	.interrupt_mapping_40_mdo_mode_hw_read	(interrupt_mapping_40_mdo_mode_hw_read),
	.interrupt_mapping_40_v_hw_read	(interrupt_mapping_40_v_hw_read),
	.interrupt_mapping_40_t_id_hw_read	(interrupt_mapping_40_t_id_hw_read),
	.interrupt_mapping_40_int_cntrl_num_hw_read	(interrupt_mapping_40_int_cntrl_num_hw_read),
	.interrupt_mapping_40_select_pulse	(default_grp_interrupt_mapping_40_select_pulse),
	.interrupt_mapping_41_mdo_mode_hw_read	(interrupt_mapping_41_mdo_mode_hw_read),
	.interrupt_mapping_41_v_hw_read	(interrupt_mapping_41_v_hw_read),
	.interrupt_mapping_41_t_id_hw_read	(interrupt_mapping_41_t_id_hw_read),
	.interrupt_mapping_41_int_cntrl_num_hw_read	(interrupt_mapping_41_int_cntrl_num_hw_read),
	.interrupt_mapping_41_select_pulse	(default_grp_interrupt_mapping_41_select_pulse),
	.interrupt_mapping_42_mdo_mode_hw_read	(interrupt_mapping_42_mdo_mode_hw_read),
	.interrupt_mapping_42_v_hw_read	(interrupt_mapping_42_v_hw_read),
	.interrupt_mapping_42_t_id_hw_read	(interrupt_mapping_42_t_id_hw_read),
	.interrupt_mapping_42_int_cntrl_num_hw_read	(interrupt_mapping_42_int_cntrl_num_hw_read),
	.interrupt_mapping_42_select_pulse	(default_grp_interrupt_mapping_42_select_pulse),
	.interrupt_mapping_43_mdo_mode_hw_read	(interrupt_mapping_43_mdo_mode_hw_read),
	.interrupt_mapping_43_v_hw_read	(interrupt_mapping_43_v_hw_read),
	.interrupt_mapping_43_t_id_hw_read	(interrupt_mapping_43_t_id_hw_read),
	.interrupt_mapping_43_int_cntrl_num_hw_read	(interrupt_mapping_43_int_cntrl_num_hw_read),
	.interrupt_mapping_43_select_pulse	(default_grp_interrupt_mapping_43_select_pulse),
	.interrupt_mapping_44_mdo_mode_hw_read	(interrupt_mapping_44_mdo_mode_hw_read),
	.interrupt_mapping_44_v_hw_read	(interrupt_mapping_44_v_hw_read),
	.interrupt_mapping_44_t_id_hw_read	(interrupt_mapping_44_t_id_hw_read),
	.interrupt_mapping_44_int_cntrl_num_hw_read	(interrupt_mapping_44_int_cntrl_num_hw_read),
	.interrupt_mapping_44_select_pulse	(default_grp_interrupt_mapping_44_select_pulse),
	.interrupt_mapping_45_mdo_mode_hw_read	(interrupt_mapping_45_mdo_mode_hw_read),
	.interrupt_mapping_45_v_hw_read	(interrupt_mapping_45_v_hw_read),
	.interrupt_mapping_45_t_id_hw_read	(interrupt_mapping_45_t_id_hw_read),
	.interrupt_mapping_45_int_cntrl_num_hw_read	(interrupt_mapping_45_int_cntrl_num_hw_read),
	.interrupt_mapping_45_select_pulse	(default_grp_interrupt_mapping_45_select_pulse),
	.interrupt_mapping_46_mdo_mode_hw_read	(interrupt_mapping_46_mdo_mode_hw_read),
	.interrupt_mapping_46_v_hw_read	(interrupt_mapping_46_v_hw_read),
	.interrupt_mapping_46_t_id_hw_read	(interrupt_mapping_46_t_id_hw_read),
	.interrupt_mapping_46_int_cntrl_num_hw_read	(interrupt_mapping_46_int_cntrl_num_hw_read),
	.interrupt_mapping_46_select_pulse	(default_grp_interrupt_mapping_46_select_pulse),
	.interrupt_mapping_47_mdo_mode_hw_read	(interrupt_mapping_47_mdo_mode_hw_read),
	.interrupt_mapping_47_v_hw_read	(interrupt_mapping_47_v_hw_read),
	.interrupt_mapping_47_t_id_hw_read	(interrupt_mapping_47_t_id_hw_read),
	.interrupt_mapping_47_int_cntrl_num_hw_read	(interrupt_mapping_47_int_cntrl_num_hw_read),
	.interrupt_mapping_47_select_pulse	(default_grp_interrupt_mapping_47_select_pulse),
	.interrupt_mapping_48_mdo_mode_hw_read	(interrupt_mapping_48_mdo_mode_hw_read),
	.interrupt_mapping_48_v_hw_read	(interrupt_mapping_48_v_hw_read),
	.interrupt_mapping_48_t_id_hw_read	(interrupt_mapping_48_t_id_hw_read),
	.interrupt_mapping_48_int_cntrl_num_hw_read	(interrupt_mapping_48_int_cntrl_num_hw_read),
	.interrupt_mapping_48_select_pulse	(default_grp_interrupt_mapping_48_select_pulse),
	.interrupt_mapping_49_mdo_mode_hw_read	(interrupt_mapping_49_mdo_mode_hw_read),
	.interrupt_mapping_49_v_hw_read	(interrupt_mapping_49_v_hw_read),
	.interrupt_mapping_49_t_id_hw_read	(interrupt_mapping_49_t_id_hw_read),
	.interrupt_mapping_49_int_cntrl_num_hw_read	(interrupt_mapping_49_int_cntrl_num_hw_read),
	.interrupt_mapping_49_select_pulse	(default_grp_interrupt_mapping_49_select_pulse),
	.interrupt_mapping_50_mdo_mode_hw_read	(interrupt_mapping_50_mdo_mode_hw_read),
	.interrupt_mapping_50_v_hw_read	(interrupt_mapping_50_v_hw_read),
	.interrupt_mapping_50_t_id_hw_read	(interrupt_mapping_50_t_id_hw_read),
	.interrupt_mapping_50_int_cntrl_num_hw_read	(interrupt_mapping_50_int_cntrl_num_hw_read),
	.interrupt_mapping_50_select_pulse	(default_grp_interrupt_mapping_50_select_pulse),
	.interrupt_mapping_51_mdo_mode_hw_read	(interrupt_mapping_51_mdo_mode_hw_read),
	.interrupt_mapping_51_v_hw_read	(interrupt_mapping_51_v_hw_read),
	.interrupt_mapping_51_t_id_hw_read	(interrupt_mapping_51_t_id_hw_read),
	.interrupt_mapping_51_int_cntrl_num_hw_read	(interrupt_mapping_51_int_cntrl_num_hw_read),
	.interrupt_mapping_51_select_pulse	(default_grp_interrupt_mapping_51_select_pulse),
	.interrupt_mapping_52_mdo_mode_hw_read	(interrupt_mapping_52_mdo_mode_hw_read),
	.interrupt_mapping_52_v_hw_read	(interrupt_mapping_52_v_hw_read),
	.interrupt_mapping_52_t_id_hw_read	(interrupt_mapping_52_t_id_hw_read),
	.interrupt_mapping_52_int_cntrl_num_hw_read	(interrupt_mapping_52_int_cntrl_num_hw_read),
	.interrupt_mapping_52_select_pulse	(default_grp_interrupt_mapping_52_select_pulse),
	.interrupt_mapping_53_mdo_mode_hw_read	(interrupt_mapping_53_mdo_mode_hw_read),
	.interrupt_mapping_53_v_hw_read	(interrupt_mapping_53_v_hw_read),
	.interrupt_mapping_53_t_id_hw_read	(interrupt_mapping_53_t_id_hw_read),
	.interrupt_mapping_53_int_cntrl_num_hw_read	(interrupt_mapping_53_int_cntrl_num_hw_read),
	.interrupt_mapping_53_select_pulse	(default_grp_interrupt_mapping_53_select_pulse),
	.interrupt_mapping_54_mdo_mode_hw_read	(interrupt_mapping_54_mdo_mode_hw_read),
	.interrupt_mapping_54_v_hw_read	(interrupt_mapping_54_v_hw_read),
	.interrupt_mapping_54_t_id_hw_read	(interrupt_mapping_54_t_id_hw_read),
	.interrupt_mapping_54_int_cntrl_num_hw_read	(interrupt_mapping_54_int_cntrl_num_hw_read),
	.interrupt_mapping_54_select_pulse	(default_grp_interrupt_mapping_54_select_pulse),
	.interrupt_mapping_55_mdo_mode_hw_read	(interrupt_mapping_55_mdo_mode_hw_read),
	.interrupt_mapping_55_v_hw_read	(interrupt_mapping_55_v_hw_read),
	.interrupt_mapping_55_t_id_hw_read	(interrupt_mapping_55_t_id_hw_read),
	.interrupt_mapping_55_int_cntrl_num_hw_read	(interrupt_mapping_55_int_cntrl_num_hw_read),
	.interrupt_mapping_55_select_pulse	(default_grp_interrupt_mapping_55_select_pulse),
	.interrupt_mapping_56_mdo_mode_hw_read	(interrupt_mapping_56_mdo_mode_hw_read),
	.interrupt_mapping_56_v_hw_read	(interrupt_mapping_56_v_hw_read),
	.interrupt_mapping_56_t_id_hw_read	(interrupt_mapping_56_t_id_hw_read),
	.interrupt_mapping_56_int_cntrl_num_hw_read	(interrupt_mapping_56_int_cntrl_num_hw_read),
	.interrupt_mapping_56_select_pulse	(default_grp_interrupt_mapping_56_select_pulse),
	.interrupt_mapping_57_mdo_mode_hw_read	(interrupt_mapping_57_mdo_mode_hw_read),
	.interrupt_mapping_57_v_hw_read	(interrupt_mapping_57_v_hw_read),
	.interrupt_mapping_57_t_id_hw_read	(interrupt_mapping_57_t_id_hw_read),
	.interrupt_mapping_57_int_cntrl_num_hw_read	(interrupt_mapping_57_int_cntrl_num_hw_read),
	.interrupt_mapping_57_select_pulse	(default_grp_interrupt_mapping_57_select_pulse),
	.interrupt_mapping_58_mdo_mode_hw_read	(interrupt_mapping_58_mdo_mode_hw_read),
	.interrupt_mapping_58_v_hw_read	(interrupt_mapping_58_v_hw_read),
	.interrupt_mapping_58_t_id_hw_read	(interrupt_mapping_58_t_id_hw_read),
	.interrupt_mapping_58_int_cntrl_num_hw_read	(interrupt_mapping_58_int_cntrl_num_hw_read),
	.interrupt_mapping_58_select_pulse	(default_grp_interrupt_mapping_58_select_pulse),
	.interrupt_mapping_59_mdo_mode_hw_read	(interrupt_mapping_59_mdo_mode_hw_read),
	.interrupt_mapping_59_v_hw_read	(interrupt_mapping_59_v_hw_read),
	.interrupt_mapping_59_t_id_hw_read	(interrupt_mapping_59_t_id_hw_read),
	.interrupt_mapping_59_int_cntrl_num_hw_read	(interrupt_mapping_59_int_cntrl_num_hw_read),
	.interrupt_mapping_59_select_pulse	(default_grp_interrupt_mapping_59_select_pulse),
	.interrupt_mapping_62_mdo_mode_hw_read	(interrupt_mapping_62_mdo_mode_hw_read),
	.interrupt_mapping_62_v_hw_read	(interrupt_mapping_62_v_hw_read),
	.interrupt_mapping_62_t_id_hw_read	(interrupt_mapping_62_t_id_hw_read),
	.interrupt_mapping_62_int_cntrl_num_hw_read	(interrupt_mapping_62_int_cntrl_num_hw_read),
	.interrupt_mapping_62_select_pulse	(default_grp_interrupt_mapping_62_select_pulse),
	.interrupt_mapping_63_mdo_mode_hw_read	(interrupt_mapping_63_mdo_mode_hw_read),
	.interrupt_mapping_63_v_hw_read	(interrupt_mapping_63_v_hw_read),
	.interrupt_mapping_63_t_id_hw_read	(interrupt_mapping_63_t_id_hw_read),
	.interrupt_mapping_63_int_cntrl_num_hw_read	(interrupt_mapping_63_int_cntrl_num_hw_read),
	.interrupt_mapping_63_select_pulse	(default_grp_interrupt_mapping_63_select_pulse),
	.clr_int_reg_20_ext_select	(clr_int_reg_20_ext_select),
	.clr_int_reg_20_select	(default_grp_clr_int_reg_20_select),
	.clr_int_reg_20_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_20_int_state_ext_read_data
              }),
	.clr_int_reg_20_int_state_ext_wr_data	(clr_int_reg_20_int_state_ext_wr_data),
	.clr_int_reg_21_ext_select	(clr_int_reg_21_ext_select),
	.clr_int_reg_21_select	(default_grp_clr_int_reg_21_select),
	.clr_int_reg_21_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_21_int_state_ext_read_data
              }),
	.clr_int_reg_21_int_state_ext_wr_data	(clr_int_reg_21_int_state_ext_wr_data),
	.clr_int_reg_22_ext_select	(clr_int_reg_22_ext_select),
	.clr_int_reg_22_select	(default_grp_clr_int_reg_22_select),
	.clr_int_reg_22_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_22_int_state_ext_read_data
              }),
	.clr_int_reg_22_int_state_ext_wr_data	(clr_int_reg_22_int_state_ext_wr_data),
	.clr_int_reg_23_ext_select	(clr_int_reg_23_ext_select),
	.clr_int_reg_23_select	(default_grp_clr_int_reg_23_select),
	.clr_int_reg_23_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_23_int_state_ext_read_data
              }),
	.clr_int_reg_23_int_state_ext_wr_data	(clr_int_reg_23_int_state_ext_wr_data),
	.clr_int_reg_24_ext_select	(clr_int_reg_24_ext_select),
	.clr_int_reg_24_select	(default_grp_clr_int_reg_24_select),
	.clr_int_reg_24_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_24_int_state_ext_read_data
              }),
	.clr_int_reg_24_int_state_ext_wr_data	(clr_int_reg_24_int_state_ext_wr_data),
	.clr_int_reg_25_ext_select	(clr_int_reg_25_ext_select),
	.clr_int_reg_25_select	(default_grp_clr_int_reg_25_select),
	.clr_int_reg_25_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_25_int_state_ext_read_data
              }),
	.clr_int_reg_25_int_state_ext_wr_data	(clr_int_reg_25_int_state_ext_wr_data),
	.clr_int_reg_26_ext_select	(clr_int_reg_26_ext_select),
	.clr_int_reg_26_select	(default_grp_clr_int_reg_26_select),
	.clr_int_reg_26_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_26_int_state_ext_read_data
              }),
	.clr_int_reg_26_int_state_ext_wr_data	(clr_int_reg_26_int_state_ext_wr_data),
	.clr_int_reg_27_ext_select	(clr_int_reg_27_ext_select),
	.clr_int_reg_27_select	(default_grp_clr_int_reg_27_select),
	.clr_int_reg_27_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_27_int_state_ext_read_data
              }),
	.clr_int_reg_27_int_state_ext_wr_data	(clr_int_reg_27_int_state_ext_wr_data),
	.clr_int_reg_28_ext_select	(clr_int_reg_28_ext_select),
	.clr_int_reg_28_select	(default_grp_clr_int_reg_28_select),
	.clr_int_reg_28_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_28_int_state_ext_read_data
              }),
	.clr_int_reg_28_int_state_ext_wr_data	(clr_int_reg_28_int_state_ext_wr_data),
	.clr_int_reg_29_ext_select	(clr_int_reg_29_ext_select),
	.clr_int_reg_29_select	(default_grp_clr_int_reg_29_select),
	.clr_int_reg_29_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_29_int_state_ext_read_data
              }),
	.clr_int_reg_29_int_state_ext_wr_data	(clr_int_reg_29_int_state_ext_wr_data),
	.clr_int_reg_30_ext_select	(clr_int_reg_30_ext_select),
	.clr_int_reg_30_select	(default_grp_clr_int_reg_30_select),
	.clr_int_reg_30_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_30_int_state_ext_read_data
              }),
	.clr_int_reg_30_int_state_ext_wr_data	(clr_int_reg_30_int_state_ext_wr_data),
	.clr_int_reg_31_ext_select	(clr_int_reg_31_ext_select),
	.clr_int_reg_31_select	(default_grp_clr_int_reg_31_select),
	.clr_int_reg_31_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_31_int_state_ext_read_data
              }),
	.clr_int_reg_31_int_state_ext_wr_data	(clr_int_reg_31_int_state_ext_wr_data),
	.clr_int_reg_32_ext_select	(clr_int_reg_32_ext_select),
	.clr_int_reg_32_select	(default_grp_clr_int_reg_32_select),
	.clr_int_reg_32_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_32_int_state_ext_read_data
              }),
	.clr_int_reg_32_int_state_ext_wr_data	(clr_int_reg_32_int_state_ext_wr_data),
	.clr_int_reg_33_ext_select	(clr_int_reg_33_ext_select),
	.clr_int_reg_33_select	(default_grp_clr_int_reg_33_select),
	.clr_int_reg_33_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_33_int_state_ext_read_data
              }),
	.clr_int_reg_33_int_state_ext_wr_data	(clr_int_reg_33_int_state_ext_wr_data),
	.clr_int_reg_34_ext_select	(clr_int_reg_34_ext_select),
	.clr_int_reg_34_select	(default_grp_clr_int_reg_34_select),
	.clr_int_reg_34_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_34_int_state_ext_read_data
              }),
	.clr_int_reg_34_int_state_ext_wr_data	(clr_int_reg_34_int_state_ext_wr_data),
	.clr_int_reg_35_ext_select	(clr_int_reg_35_ext_select),
	.clr_int_reg_35_select	(default_grp_clr_int_reg_35_select),
	.clr_int_reg_35_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_35_int_state_ext_read_data
              }),
	.clr_int_reg_35_int_state_ext_wr_data	(clr_int_reg_35_int_state_ext_wr_data),
	.clr_int_reg_36_ext_select	(clr_int_reg_36_ext_select),
	.clr_int_reg_36_select	(default_grp_clr_int_reg_36_select),
	.clr_int_reg_36_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_36_int_state_ext_read_data
              }),
	.clr_int_reg_36_int_state_ext_wr_data	(clr_int_reg_36_int_state_ext_wr_data),
	.clr_int_reg_37_ext_select	(clr_int_reg_37_ext_select),
	.clr_int_reg_37_select	(default_grp_clr_int_reg_37_select),
	.clr_int_reg_37_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_37_int_state_ext_read_data
              }),
	.clr_int_reg_37_int_state_ext_wr_data	(clr_int_reg_37_int_state_ext_wr_data),
	.clr_int_reg_38_ext_select	(clr_int_reg_38_ext_select),
	.clr_int_reg_38_select	(default_grp_clr_int_reg_38_select),
	.clr_int_reg_38_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_38_int_state_ext_read_data
              }),
	.clr_int_reg_38_int_state_ext_wr_data	(clr_int_reg_38_int_state_ext_wr_data),
	.clr_int_reg_39_ext_select	(clr_int_reg_39_ext_select),
	.clr_int_reg_39_select	(default_grp_clr_int_reg_39_select),
	.clr_int_reg_39_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_39_int_state_ext_read_data
              }),
	.clr_int_reg_39_int_state_ext_wr_data	(clr_int_reg_39_int_state_ext_wr_data),
	.clr_int_reg_40_ext_select	(clr_int_reg_40_ext_select),
	.clr_int_reg_40_select	(default_grp_clr_int_reg_40_select),
	.clr_int_reg_40_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_40_int_state_ext_read_data
              }),
	.clr_int_reg_40_int_state_ext_wr_data	(clr_int_reg_40_int_state_ext_wr_data),
	.clr_int_reg_41_ext_select	(clr_int_reg_41_ext_select),
	.clr_int_reg_41_select	(default_grp_clr_int_reg_41_select),
	.clr_int_reg_41_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_41_int_state_ext_read_data
              }),
	.clr_int_reg_41_int_state_ext_wr_data	(clr_int_reg_41_int_state_ext_wr_data),
	.clr_int_reg_42_ext_select	(clr_int_reg_42_ext_select),
	.clr_int_reg_42_select	(default_grp_clr_int_reg_42_select),
	.clr_int_reg_42_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_42_int_state_ext_read_data
              }),
	.clr_int_reg_42_int_state_ext_wr_data	(clr_int_reg_42_int_state_ext_wr_data),
	.clr_int_reg_43_ext_select	(clr_int_reg_43_ext_select),
	.clr_int_reg_43_select	(default_grp_clr_int_reg_43_select),
	.clr_int_reg_43_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_43_int_state_ext_read_data
              }),
	.clr_int_reg_43_int_state_ext_wr_data	(clr_int_reg_43_int_state_ext_wr_data),
	.clr_int_reg_44_ext_select	(clr_int_reg_44_ext_select),
	.clr_int_reg_44_select	(default_grp_clr_int_reg_44_select),
	.clr_int_reg_44_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_44_int_state_ext_read_data
              }),
	.clr_int_reg_44_int_state_ext_wr_data	(clr_int_reg_44_int_state_ext_wr_data),
	.clr_int_reg_45_ext_select	(clr_int_reg_45_ext_select),
	.clr_int_reg_45_select	(default_grp_clr_int_reg_45_select),
	.clr_int_reg_45_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_45_int_state_ext_read_data
              }),
	.clr_int_reg_45_int_state_ext_wr_data	(clr_int_reg_45_int_state_ext_wr_data),
	.clr_int_reg_46_ext_select	(clr_int_reg_46_ext_select),
	.clr_int_reg_46_select	(default_grp_clr_int_reg_46_select),
	.clr_int_reg_46_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_46_int_state_ext_read_data
              }),
	.clr_int_reg_46_int_state_ext_wr_data	(clr_int_reg_46_int_state_ext_wr_data),
	.clr_int_reg_47_ext_select	(clr_int_reg_47_ext_select),
	.clr_int_reg_47_select	(default_grp_clr_int_reg_47_select),
	.clr_int_reg_47_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_47_int_state_ext_read_data
              }),
	.clr_int_reg_47_int_state_ext_wr_data	(clr_int_reg_47_int_state_ext_wr_data),
	.clr_int_reg_48_ext_select	(clr_int_reg_48_ext_select),
	.clr_int_reg_48_select	(default_grp_clr_int_reg_48_select),
	.clr_int_reg_48_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_48_int_state_ext_read_data
              }),
	.clr_int_reg_48_int_state_ext_wr_data	(clr_int_reg_48_int_state_ext_wr_data),
	.clr_int_reg_49_ext_select	(clr_int_reg_49_ext_select),
	.clr_int_reg_49_select	(default_grp_clr_int_reg_49_select),
	.clr_int_reg_49_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_49_int_state_ext_read_data
              }),
	.clr_int_reg_49_int_state_ext_wr_data	(clr_int_reg_49_int_state_ext_wr_data),
	.clr_int_reg_50_ext_select	(clr_int_reg_50_ext_select),
	.clr_int_reg_50_select	(default_grp_clr_int_reg_50_select),
	.clr_int_reg_50_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_50_int_state_ext_read_data
              }),
	.clr_int_reg_50_int_state_ext_wr_data	(clr_int_reg_50_int_state_ext_wr_data),
	.clr_int_reg_51_ext_select	(clr_int_reg_51_ext_select),
	.clr_int_reg_51_select	(default_grp_clr_int_reg_51_select),
	.clr_int_reg_51_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_51_int_state_ext_read_data
              }),
	.clr_int_reg_51_int_state_ext_wr_data	(clr_int_reg_51_int_state_ext_wr_data),
	.clr_int_reg_52_ext_select	(clr_int_reg_52_ext_select),
	.clr_int_reg_52_select	(default_grp_clr_int_reg_52_select),
	.clr_int_reg_52_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_52_int_state_ext_read_data
              }),
	.clr_int_reg_52_int_state_ext_wr_data	(clr_int_reg_52_int_state_ext_wr_data),
	.clr_int_reg_53_ext_select	(clr_int_reg_53_ext_select),
	.clr_int_reg_53_select	(default_grp_clr_int_reg_53_select),
	.clr_int_reg_53_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_53_int_state_ext_read_data
              }),
	.clr_int_reg_53_int_state_ext_wr_data	(clr_int_reg_53_int_state_ext_wr_data),
	.clr_int_reg_54_ext_select	(clr_int_reg_54_ext_select),
	.clr_int_reg_54_select	(default_grp_clr_int_reg_54_select),
	.clr_int_reg_54_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_54_int_state_ext_read_data
              }),
	.clr_int_reg_54_int_state_ext_wr_data	(clr_int_reg_54_int_state_ext_wr_data),
	.clr_int_reg_55_ext_select	(clr_int_reg_55_ext_select),
	.clr_int_reg_55_select	(default_grp_clr_int_reg_55_select),
	.clr_int_reg_55_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_55_int_state_ext_read_data
              }),
	.clr_int_reg_55_int_state_ext_wr_data	(clr_int_reg_55_int_state_ext_wr_data),
	.clr_int_reg_56_ext_select	(clr_int_reg_56_ext_select),
	.clr_int_reg_56_select	(default_grp_clr_int_reg_56_select),
	.clr_int_reg_56_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_56_int_state_ext_read_data
              }),
	.clr_int_reg_56_int_state_ext_wr_data	(clr_int_reg_56_int_state_ext_wr_data),
	.clr_int_reg_57_ext_select	(clr_int_reg_57_ext_select),
	.clr_int_reg_57_select	(default_grp_clr_int_reg_57_select),
	.clr_int_reg_57_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_57_int_state_ext_read_data
              }),
	.clr_int_reg_57_int_state_ext_wr_data	(clr_int_reg_57_int_state_ext_wr_data),
	.clr_int_reg_58_ext_select	(clr_int_reg_58_ext_select),
	.clr_int_reg_58_select	(default_grp_clr_int_reg_58_select),
	.clr_int_reg_58_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_58_int_state_ext_read_data
              }),
	.clr_int_reg_58_int_state_ext_wr_data	(clr_int_reg_58_int_state_ext_wr_data),
	.clr_int_reg_59_ext_select	(clr_int_reg_59_ext_select),
	.clr_int_reg_59_select	(default_grp_clr_int_reg_59_select),
	.clr_int_reg_59_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_59_int_state_ext_read_data
              }),
	.clr_int_reg_59_int_state_ext_wr_data	(clr_int_reg_59_int_state_ext_wr_data),
	.clr_int_reg_62_ext_select	(clr_int_reg_62_ext_select),
	.clr_int_reg_62_select	(default_grp_clr_int_reg_62_select),
	.clr_int_reg_62_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_62_int_state_ext_read_data
              }),
	.clr_int_reg_62_int_state_ext_wr_data	(clr_int_reg_62_int_state_ext_wr_data),
	.clr_int_reg_63_ext_select	(clr_int_reg_63_ext_select),
	.clr_int_reg_63_select	(default_grp_clr_int_reg_63_select),
	.clr_int_reg_63_ext_read_data
	  (
              {
                62'b0,
                clr_int_reg_63_int_state_ext_read_data
              }),
	.clr_int_reg_63_int_state_ext_wr_data	(clr_int_reg_63_int_state_ext_wr_data),
	.interrupt_retry_timer_limit_hw_read	(interrupt_retry_timer_limit_hw_read),
	.interrupt_retry_timer_select_pulse	(default_grp_interrupt_retry_timer_select_pulse),
	.interrupt_state_status_1_select	(default_grp_interrupt_state_status_1_select),
	.interrupt_state_status_1_ext_read_data
	  (
              {
                interrupt_state_status_1_state_ext_read_data,
                40'b0
              }),
	.interrupt_state_status_2_select	(default_grp_interrupt_state_status_2_select),
	.interrupt_state_status_2_ext_read_data
	  (
              {
                interrupt_state_status_2_state_ext_read_data
              }),
	.rst_l	(stage_mux_only_rst_l),
	.daemon_csrbus_wr_in	(stage_mux_only_daemon_csrbus_wr),
	.daemon_csrbus_wr_out	(ext_wr),
	.daemon_csrbus_wr_data_in	(stage_mux_only_daemon_csrbus_wr_data),
	.read_data_0_out	(default_grp_read_data_0_out)
	);

//----- Stage: 2 / Grp: stage_mux_only (1 inputs / 1 outputs) (Mux only)
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] stage_mux_only_read_data_0_out;

dmu_imu_iss_stage_mux_only dmu_imu_iss_stage_mux_only
	(
	.clk	(clk),
	.read_data_0	(default_grp_read_data_0_out),
	.interrupt_mapping_20_select_pulse	(interrupt_mapping_20_select_pulse),
	.interrupt_mapping_20_select_pulse_out	(default_grp_interrupt_mapping_20_select_pulse),
	.interrupt_mapping_21_select_pulse	(interrupt_mapping_21_select_pulse),
	.interrupt_mapping_21_select_pulse_out	(default_grp_interrupt_mapping_21_select_pulse),
	.interrupt_mapping_22_select_pulse	(interrupt_mapping_22_select_pulse),
	.interrupt_mapping_22_select_pulse_out	(default_grp_interrupt_mapping_22_select_pulse),
	.interrupt_mapping_23_select_pulse	(interrupt_mapping_23_select_pulse),
	.interrupt_mapping_23_select_pulse_out	(default_grp_interrupt_mapping_23_select_pulse),
	.interrupt_mapping_24_select_pulse	(interrupt_mapping_24_select_pulse),
	.interrupt_mapping_24_select_pulse_out	(default_grp_interrupt_mapping_24_select_pulse),
	.interrupt_mapping_25_select_pulse	(interrupt_mapping_25_select_pulse),
	.interrupt_mapping_25_select_pulse_out	(default_grp_interrupt_mapping_25_select_pulse),
	.interrupt_mapping_26_select_pulse	(interrupt_mapping_26_select_pulse),
	.interrupt_mapping_26_select_pulse_out	(default_grp_interrupt_mapping_26_select_pulse),
	.interrupt_mapping_27_select_pulse	(interrupt_mapping_27_select_pulse),
	.interrupt_mapping_27_select_pulse_out	(default_grp_interrupt_mapping_27_select_pulse),
	.interrupt_mapping_28_select_pulse	(interrupt_mapping_28_select_pulse),
	.interrupt_mapping_28_select_pulse_out	(default_grp_interrupt_mapping_28_select_pulse),
	.interrupt_mapping_29_select_pulse	(interrupt_mapping_29_select_pulse),
	.interrupt_mapping_29_select_pulse_out	(default_grp_interrupt_mapping_29_select_pulse),
	.interrupt_mapping_30_select_pulse	(interrupt_mapping_30_select_pulse),
	.interrupt_mapping_30_select_pulse_out	(default_grp_interrupt_mapping_30_select_pulse),
	.interrupt_mapping_31_select_pulse	(interrupt_mapping_31_select_pulse),
	.interrupt_mapping_31_select_pulse_out	(default_grp_interrupt_mapping_31_select_pulse),
	.interrupt_mapping_32_select_pulse	(interrupt_mapping_32_select_pulse),
	.interrupt_mapping_32_select_pulse_out	(default_grp_interrupt_mapping_32_select_pulse),
	.interrupt_mapping_33_select_pulse	(interrupt_mapping_33_select_pulse),
	.interrupt_mapping_33_select_pulse_out	(default_grp_interrupt_mapping_33_select_pulse),
	.interrupt_mapping_34_select_pulse	(interrupt_mapping_34_select_pulse),
	.interrupt_mapping_34_select_pulse_out	(default_grp_interrupt_mapping_34_select_pulse),
	.interrupt_mapping_35_select_pulse	(interrupt_mapping_35_select_pulse),
	.interrupt_mapping_35_select_pulse_out	(default_grp_interrupt_mapping_35_select_pulse),
	.interrupt_mapping_36_select_pulse	(interrupt_mapping_36_select_pulse),
	.interrupt_mapping_36_select_pulse_out	(default_grp_interrupt_mapping_36_select_pulse),
	.interrupt_mapping_37_select_pulse	(interrupt_mapping_37_select_pulse),
	.interrupt_mapping_37_select_pulse_out	(default_grp_interrupt_mapping_37_select_pulse),
	.interrupt_mapping_38_select_pulse	(interrupt_mapping_38_select_pulse),
	.interrupt_mapping_38_select_pulse_out	(default_grp_interrupt_mapping_38_select_pulse),
	.interrupt_mapping_39_select_pulse	(interrupt_mapping_39_select_pulse),
	.interrupt_mapping_39_select_pulse_out	(default_grp_interrupt_mapping_39_select_pulse),
	.interrupt_mapping_40_select_pulse	(interrupt_mapping_40_select_pulse),
	.interrupt_mapping_40_select_pulse_out	(default_grp_interrupt_mapping_40_select_pulse),
	.interrupt_mapping_41_select_pulse	(interrupt_mapping_41_select_pulse),
	.interrupt_mapping_41_select_pulse_out	(default_grp_interrupt_mapping_41_select_pulse),
	.interrupt_mapping_42_select_pulse	(interrupt_mapping_42_select_pulse),
	.interrupt_mapping_42_select_pulse_out	(default_grp_interrupt_mapping_42_select_pulse),
	.interrupt_mapping_43_select_pulse	(interrupt_mapping_43_select_pulse),
	.interrupt_mapping_43_select_pulse_out	(default_grp_interrupt_mapping_43_select_pulse),
	.interrupt_mapping_44_select_pulse	(interrupt_mapping_44_select_pulse),
	.interrupt_mapping_44_select_pulse_out	(default_grp_interrupt_mapping_44_select_pulse),
	.interrupt_mapping_45_select_pulse	(interrupt_mapping_45_select_pulse),
	.interrupt_mapping_45_select_pulse_out	(default_grp_interrupt_mapping_45_select_pulse),
	.interrupt_mapping_46_select_pulse	(interrupt_mapping_46_select_pulse),
	.interrupt_mapping_46_select_pulse_out	(default_grp_interrupt_mapping_46_select_pulse),
	.interrupt_mapping_47_select_pulse	(interrupt_mapping_47_select_pulse),
	.interrupt_mapping_47_select_pulse_out	(default_grp_interrupt_mapping_47_select_pulse),
	.interrupt_mapping_48_select_pulse	(interrupt_mapping_48_select_pulse),
	.interrupt_mapping_48_select_pulse_out	(default_grp_interrupt_mapping_48_select_pulse),
	.interrupt_mapping_49_select_pulse	(interrupt_mapping_49_select_pulse),
	.interrupt_mapping_49_select_pulse_out	(default_grp_interrupt_mapping_49_select_pulse),
	.interrupt_mapping_50_select_pulse	(interrupt_mapping_50_select_pulse),
	.interrupt_mapping_50_select_pulse_out	(default_grp_interrupt_mapping_50_select_pulse),
	.interrupt_mapping_51_select_pulse	(interrupt_mapping_51_select_pulse),
	.interrupt_mapping_51_select_pulse_out	(default_grp_interrupt_mapping_51_select_pulse),
	.interrupt_mapping_52_select_pulse	(interrupt_mapping_52_select_pulse),
	.interrupt_mapping_52_select_pulse_out	(default_grp_interrupt_mapping_52_select_pulse),
	.interrupt_mapping_53_select_pulse	(interrupt_mapping_53_select_pulse),
	.interrupt_mapping_53_select_pulse_out	(default_grp_interrupt_mapping_53_select_pulse),
	.interrupt_mapping_54_select_pulse	(interrupt_mapping_54_select_pulse),
	.interrupt_mapping_54_select_pulse_out	(default_grp_interrupt_mapping_54_select_pulse),
	.interrupt_mapping_55_select_pulse	(interrupt_mapping_55_select_pulse),
	.interrupt_mapping_55_select_pulse_out	(default_grp_interrupt_mapping_55_select_pulse),
	.interrupt_mapping_56_select_pulse	(interrupt_mapping_56_select_pulse),
	.interrupt_mapping_56_select_pulse_out	(default_grp_interrupt_mapping_56_select_pulse),
	.interrupt_mapping_57_select_pulse	(interrupt_mapping_57_select_pulse),
	.interrupt_mapping_57_select_pulse_out	(default_grp_interrupt_mapping_57_select_pulse),
	.interrupt_mapping_58_select_pulse	(interrupt_mapping_58_select_pulse),
	.interrupt_mapping_58_select_pulse_out	(default_grp_interrupt_mapping_58_select_pulse),
	.interrupt_mapping_59_select_pulse	(interrupt_mapping_59_select_pulse),
	.interrupt_mapping_59_select_pulse_out	(default_grp_interrupt_mapping_59_select_pulse),
	.interrupt_mapping_62_select_pulse	(interrupt_mapping_62_select_pulse),
	.interrupt_mapping_62_select_pulse_out	(default_grp_interrupt_mapping_62_select_pulse),
	.interrupt_mapping_63_select_pulse	(interrupt_mapping_63_select_pulse),
	.interrupt_mapping_63_select_pulse_out	(default_grp_interrupt_mapping_63_select_pulse),
	.clr_int_reg_20_select	(clr_int_reg_20_select),
	.clr_int_reg_20_select_out	(default_grp_clr_int_reg_20_select),
	.clr_int_reg_21_select	(clr_int_reg_21_select),
	.clr_int_reg_21_select_out	(default_grp_clr_int_reg_21_select),
	.clr_int_reg_22_select	(clr_int_reg_22_select),
	.clr_int_reg_22_select_out	(default_grp_clr_int_reg_22_select),
	.clr_int_reg_23_select	(clr_int_reg_23_select),
	.clr_int_reg_23_select_out	(default_grp_clr_int_reg_23_select),
	.clr_int_reg_24_select	(clr_int_reg_24_select),
	.clr_int_reg_24_select_out	(default_grp_clr_int_reg_24_select),
	.clr_int_reg_25_select	(clr_int_reg_25_select),
	.clr_int_reg_25_select_out	(default_grp_clr_int_reg_25_select),
	.clr_int_reg_26_select	(clr_int_reg_26_select),
	.clr_int_reg_26_select_out	(default_grp_clr_int_reg_26_select),
	.clr_int_reg_27_select	(clr_int_reg_27_select),
	.clr_int_reg_27_select_out	(default_grp_clr_int_reg_27_select),
	.clr_int_reg_28_select	(clr_int_reg_28_select),
	.clr_int_reg_28_select_out	(default_grp_clr_int_reg_28_select),
	.clr_int_reg_29_select	(clr_int_reg_29_select),
	.clr_int_reg_29_select_out	(default_grp_clr_int_reg_29_select),
	.clr_int_reg_30_select	(clr_int_reg_30_select),
	.clr_int_reg_30_select_out	(default_grp_clr_int_reg_30_select),
	.clr_int_reg_31_select	(clr_int_reg_31_select),
	.clr_int_reg_31_select_out	(default_grp_clr_int_reg_31_select),
	.clr_int_reg_32_select	(clr_int_reg_32_select),
	.clr_int_reg_32_select_out	(default_grp_clr_int_reg_32_select),
	.clr_int_reg_33_select	(clr_int_reg_33_select),
	.clr_int_reg_33_select_out	(default_grp_clr_int_reg_33_select),
	.clr_int_reg_34_select	(clr_int_reg_34_select),
	.clr_int_reg_34_select_out	(default_grp_clr_int_reg_34_select),
	.clr_int_reg_35_select	(clr_int_reg_35_select),
	.clr_int_reg_35_select_out	(default_grp_clr_int_reg_35_select),
	.clr_int_reg_36_select	(clr_int_reg_36_select),
	.clr_int_reg_36_select_out	(default_grp_clr_int_reg_36_select),
	.clr_int_reg_37_select	(clr_int_reg_37_select),
	.clr_int_reg_37_select_out	(default_grp_clr_int_reg_37_select),
	.clr_int_reg_38_select	(clr_int_reg_38_select),
	.clr_int_reg_38_select_out	(default_grp_clr_int_reg_38_select),
	.clr_int_reg_39_select	(clr_int_reg_39_select),
	.clr_int_reg_39_select_out	(default_grp_clr_int_reg_39_select),
	.clr_int_reg_40_select	(clr_int_reg_40_select),
	.clr_int_reg_40_select_out	(default_grp_clr_int_reg_40_select),
	.clr_int_reg_41_select	(clr_int_reg_41_select),
	.clr_int_reg_41_select_out	(default_grp_clr_int_reg_41_select),
	.clr_int_reg_42_select	(clr_int_reg_42_select),
	.clr_int_reg_42_select_out	(default_grp_clr_int_reg_42_select),
	.clr_int_reg_43_select	(clr_int_reg_43_select),
	.clr_int_reg_43_select_out	(default_grp_clr_int_reg_43_select),
	.clr_int_reg_44_select	(clr_int_reg_44_select),
	.clr_int_reg_44_select_out	(default_grp_clr_int_reg_44_select),
	.clr_int_reg_45_select	(clr_int_reg_45_select),
	.clr_int_reg_45_select_out	(default_grp_clr_int_reg_45_select),
	.clr_int_reg_46_select	(clr_int_reg_46_select),
	.clr_int_reg_46_select_out	(default_grp_clr_int_reg_46_select),
	.clr_int_reg_47_select	(clr_int_reg_47_select),
	.clr_int_reg_47_select_out	(default_grp_clr_int_reg_47_select),
	.clr_int_reg_48_select	(clr_int_reg_48_select),
	.clr_int_reg_48_select_out	(default_grp_clr_int_reg_48_select),
	.clr_int_reg_49_select	(clr_int_reg_49_select),
	.clr_int_reg_49_select_out	(default_grp_clr_int_reg_49_select),
	.clr_int_reg_50_select	(clr_int_reg_50_select),
	.clr_int_reg_50_select_out	(default_grp_clr_int_reg_50_select),
	.clr_int_reg_51_select	(clr_int_reg_51_select),
	.clr_int_reg_51_select_out	(default_grp_clr_int_reg_51_select),
	.clr_int_reg_52_select	(clr_int_reg_52_select),
	.clr_int_reg_52_select_out	(default_grp_clr_int_reg_52_select),
	.clr_int_reg_53_select	(clr_int_reg_53_select),
	.clr_int_reg_53_select_out	(default_grp_clr_int_reg_53_select),
	.clr_int_reg_54_select	(clr_int_reg_54_select),
	.clr_int_reg_54_select_out	(default_grp_clr_int_reg_54_select),
	.clr_int_reg_55_select	(clr_int_reg_55_select),
	.clr_int_reg_55_select_out	(default_grp_clr_int_reg_55_select),
	.clr_int_reg_56_select	(clr_int_reg_56_select),
	.clr_int_reg_56_select_out	(default_grp_clr_int_reg_56_select),
	.clr_int_reg_57_select	(clr_int_reg_57_select),
	.clr_int_reg_57_select_out	(default_grp_clr_int_reg_57_select),
	.clr_int_reg_58_select	(clr_int_reg_58_select),
	.clr_int_reg_58_select_out	(default_grp_clr_int_reg_58_select),
	.clr_int_reg_59_select	(clr_int_reg_59_select),
	.clr_int_reg_59_select_out	(default_grp_clr_int_reg_59_select),
	.clr_int_reg_62_select	(clr_int_reg_62_select),
	.clr_int_reg_62_select_out	(default_grp_clr_int_reg_62_select),
	.clr_int_reg_63_select	(clr_int_reg_63_select),
	.clr_int_reg_63_select_out	(default_grp_clr_int_reg_63_select),
	.interrupt_retry_timer_select_pulse	(interrupt_retry_timer_select_pulse),
	.interrupt_retry_timer_select_pulse_out	(default_grp_interrupt_retry_timer_select_pulse),
	.interrupt_state_status_1_select	(interrupt_state_status_1_select),
	.interrupt_state_status_1_select_out	(default_grp_interrupt_state_status_1_select),
	.interrupt_state_status_2_select	(interrupt_state_status_2_select),
	.interrupt_state_status_2_select_out	(default_grp_interrupt_state_status_2_select),
	.daemon_csrbus_wr_in	(daemon_csrbus_wr),
	.daemon_csrbus_wr_out	(stage_mux_only_daemon_csrbus_wr),
	.daemon_csrbus_wr_data_in	(daemon_csrbus_wr_data),
	.daemon_csrbus_wr_data_out	(stage_mux_only_daemon_csrbus_wr_data),
	.read_data_0_out	(stage_mux_only_read_data_0_out),
	.rst_l	(rst_l),
	.rst_l_out	(stage_mux_only_rst_l)
	);

//----- OUTPUT: csrbus_read_data
assign csrbus_read_data = stage_mux_only_read_data_0_out;

endmodule // dmu_imu_iss_csr
