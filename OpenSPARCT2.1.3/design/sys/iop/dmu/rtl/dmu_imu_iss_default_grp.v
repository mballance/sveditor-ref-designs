// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_imu_iss_default_grp.v
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
module dmu_imu_iss_default_grp 
	(
	clk,
	interrupt_mapping_20_mdo_mode_hw_read,
	interrupt_mapping_20_v_hw_read,
	interrupt_mapping_20_t_id_hw_read,
	interrupt_mapping_20_int_cntrl_num_hw_read,
	interrupt_mapping_20_select_pulse,
	interrupt_mapping_21_mdo_mode_hw_read,
	interrupt_mapping_21_v_hw_read,
	interrupt_mapping_21_t_id_hw_read,
	interrupt_mapping_21_int_cntrl_num_hw_read,
	interrupt_mapping_21_select_pulse,
	interrupt_mapping_22_mdo_mode_hw_read,
	interrupt_mapping_22_v_hw_read,
	interrupt_mapping_22_t_id_hw_read,
	interrupt_mapping_22_int_cntrl_num_hw_read,
	interrupt_mapping_22_select_pulse,
	interrupt_mapping_23_mdo_mode_hw_read,
	interrupt_mapping_23_v_hw_read,
	interrupt_mapping_23_t_id_hw_read,
	interrupt_mapping_23_int_cntrl_num_hw_read,
	interrupt_mapping_23_select_pulse,
	interrupt_mapping_24_mdo_mode_hw_read,
	interrupt_mapping_24_v_hw_read,
	interrupt_mapping_24_t_id_hw_read,
	interrupt_mapping_24_int_cntrl_num_hw_read,
	interrupt_mapping_24_select_pulse,
	interrupt_mapping_25_mdo_mode_hw_read,
	interrupt_mapping_25_v_hw_read,
	interrupt_mapping_25_t_id_hw_read,
	interrupt_mapping_25_int_cntrl_num_hw_read,
	interrupt_mapping_25_select_pulse,
	interrupt_mapping_26_mdo_mode_hw_read,
	interrupt_mapping_26_v_hw_read,
	interrupt_mapping_26_t_id_hw_read,
	interrupt_mapping_26_int_cntrl_num_hw_read,
	interrupt_mapping_26_select_pulse,
	interrupt_mapping_27_mdo_mode_hw_read,
	interrupt_mapping_27_v_hw_read,
	interrupt_mapping_27_t_id_hw_read,
	interrupt_mapping_27_int_cntrl_num_hw_read,
	interrupt_mapping_27_select_pulse,
	interrupt_mapping_28_mdo_mode_hw_read,
	interrupt_mapping_28_v_hw_read,
	interrupt_mapping_28_t_id_hw_read,
	interrupt_mapping_28_int_cntrl_num_hw_read,
	interrupt_mapping_28_select_pulse,
	interrupt_mapping_29_mdo_mode_hw_read,
	interrupt_mapping_29_v_hw_read,
	interrupt_mapping_29_t_id_hw_read,
	interrupt_mapping_29_int_cntrl_num_hw_read,
	interrupt_mapping_29_select_pulse,
	interrupt_mapping_30_mdo_mode_hw_read,
	interrupt_mapping_30_v_hw_read,
	interrupt_mapping_30_t_id_hw_read,
	interrupt_mapping_30_int_cntrl_num_hw_read,
	interrupt_mapping_30_select_pulse,
	interrupt_mapping_31_mdo_mode_hw_read,
	interrupt_mapping_31_v_hw_read,
	interrupt_mapping_31_t_id_hw_read,
	interrupt_mapping_31_int_cntrl_num_hw_read,
	interrupt_mapping_31_select_pulse,
	interrupt_mapping_32_mdo_mode_hw_read,
	interrupt_mapping_32_v_hw_read,
	interrupt_mapping_32_t_id_hw_read,
	interrupt_mapping_32_int_cntrl_num_hw_read,
	interrupt_mapping_32_select_pulse,
	interrupt_mapping_33_mdo_mode_hw_read,
	interrupt_mapping_33_v_hw_read,
	interrupt_mapping_33_t_id_hw_read,
	interrupt_mapping_33_int_cntrl_num_hw_read,
	interrupt_mapping_33_select_pulse,
	interrupt_mapping_34_mdo_mode_hw_read,
	interrupt_mapping_34_v_hw_read,
	interrupt_mapping_34_t_id_hw_read,
	interrupt_mapping_34_int_cntrl_num_hw_read,
	interrupt_mapping_34_select_pulse,
	interrupt_mapping_35_mdo_mode_hw_read,
	interrupt_mapping_35_v_hw_read,
	interrupt_mapping_35_t_id_hw_read,
	interrupt_mapping_35_int_cntrl_num_hw_read,
	interrupt_mapping_35_select_pulse,
	interrupt_mapping_36_mdo_mode_hw_read,
	interrupt_mapping_36_v_hw_read,
	interrupt_mapping_36_t_id_hw_read,
	interrupt_mapping_36_int_cntrl_num_hw_read,
	interrupt_mapping_36_select_pulse,
	interrupt_mapping_37_mdo_mode_hw_read,
	interrupt_mapping_37_v_hw_read,
	interrupt_mapping_37_t_id_hw_read,
	interrupt_mapping_37_int_cntrl_num_hw_read,
	interrupt_mapping_37_select_pulse,
	interrupt_mapping_38_mdo_mode_hw_read,
	interrupt_mapping_38_v_hw_read,
	interrupt_mapping_38_t_id_hw_read,
	interrupt_mapping_38_int_cntrl_num_hw_read,
	interrupt_mapping_38_select_pulse,
	interrupt_mapping_39_mdo_mode_hw_read,
	interrupt_mapping_39_v_hw_read,
	interrupt_mapping_39_t_id_hw_read,
	interrupt_mapping_39_int_cntrl_num_hw_read,
	interrupt_mapping_39_select_pulse,
	interrupt_mapping_40_mdo_mode_hw_read,
	interrupt_mapping_40_v_hw_read,
	interrupt_mapping_40_t_id_hw_read,
	interrupt_mapping_40_int_cntrl_num_hw_read,
	interrupt_mapping_40_select_pulse,
	interrupt_mapping_41_mdo_mode_hw_read,
	interrupt_mapping_41_v_hw_read,
	interrupt_mapping_41_t_id_hw_read,
	interrupt_mapping_41_int_cntrl_num_hw_read,
	interrupt_mapping_41_select_pulse,
	interrupt_mapping_42_mdo_mode_hw_read,
	interrupt_mapping_42_v_hw_read,
	interrupt_mapping_42_t_id_hw_read,
	interrupt_mapping_42_int_cntrl_num_hw_read,
	interrupt_mapping_42_select_pulse,
	interrupt_mapping_43_mdo_mode_hw_read,
	interrupt_mapping_43_v_hw_read,
	interrupt_mapping_43_t_id_hw_read,
	interrupt_mapping_43_int_cntrl_num_hw_read,
	interrupt_mapping_43_select_pulse,
	interrupt_mapping_44_mdo_mode_hw_read,
	interrupt_mapping_44_v_hw_read,
	interrupt_mapping_44_t_id_hw_read,
	interrupt_mapping_44_int_cntrl_num_hw_read,
	interrupt_mapping_44_select_pulse,
	interrupt_mapping_45_mdo_mode_hw_read,
	interrupt_mapping_45_v_hw_read,
	interrupt_mapping_45_t_id_hw_read,
	interrupt_mapping_45_int_cntrl_num_hw_read,
	interrupt_mapping_45_select_pulse,
	interrupt_mapping_46_mdo_mode_hw_read,
	interrupt_mapping_46_v_hw_read,
	interrupt_mapping_46_t_id_hw_read,
	interrupt_mapping_46_int_cntrl_num_hw_read,
	interrupt_mapping_46_select_pulse,
	interrupt_mapping_47_mdo_mode_hw_read,
	interrupt_mapping_47_v_hw_read,
	interrupt_mapping_47_t_id_hw_read,
	interrupt_mapping_47_int_cntrl_num_hw_read,
	interrupt_mapping_47_select_pulse,
	interrupt_mapping_48_mdo_mode_hw_read,
	interrupt_mapping_48_v_hw_read,
	interrupt_mapping_48_t_id_hw_read,
	interrupt_mapping_48_int_cntrl_num_hw_read,
	interrupt_mapping_48_select_pulse,
	interrupt_mapping_49_mdo_mode_hw_read,
	interrupt_mapping_49_v_hw_read,
	interrupt_mapping_49_t_id_hw_read,
	interrupt_mapping_49_int_cntrl_num_hw_read,
	interrupt_mapping_49_select_pulse,
	interrupt_mapping_50_mdo_mode_hw_read,
	interrupt_mapping_50_v_hw_read,
	interrupt_mapping_50_t_id_hw_read,
	interrupt_mapping_50_int_cntrl_num_hw_read,
	interrupt_mapping_50_select_pulse,
	interrupt_mapping_51_mdo_mode_hw_read,
	interrupt_mapping_51_v_hw_read,
	interrupt_mapping_51_t_id_hw_read,
	interrupt_mapping_51_int_cntrl_num_hw_read,
	interrupt_mapping_51_select_pulse,
	interrupt_mapping_52_mdo_mode_hw_read,
	interrupt_mapping_52_v_hw_read,
	interrupt_mapping_52_t_id_hw_read,
	interrupt_mapping_52_int_cntrl_num_hw_read,
	interrupt_mapping_52_select_pulse,
	interrupt_mapping_53_mdo_mode_hw_read,
	interrupt_mapping_53_v_hw_read,
	interrupt_mapping_53_t_id_hw_read,
	interrupt_mapping_53_int_cntrl_num_hw_read,
	interrupt_mapping_53_select_pulse,
	interrupt_mapping_54_mdo_mode_hw_read,
	interrupt_mapping_54_v_hw_read,
	interrupt_mapping_54_t_id_hw_read,
	interrupt_mapping_54_int_cntrl_num_hw_read,
	interrupt_mapping_54_select_pulse,
	interrupt_mapping_55_mdo_mode_hw_read,
	interrupt_mapping_55_v_hw_read,
	interrupt_mapping_55_t_id_hw_read,
	interrupt_mapping_55_int_cntrl_num_hw_read,
	interrupt_mapping_55_select_pulse,
	interrupt_mapping_56_mdo_mode_hw_read,
	interrupt_mapping_56_v_hw_read,
	interrupt_mapping_56_t_id_hw_read,
	interrupt_mapping_56_int_cntrl_num_hw_read,
	interrupt_mapping_56_select_pulse,
	interrupt_mapping_57_mdo_mode_hw_read,
	interrupt_mapping_57_v_hw_read,
	interrupt_mapping_57_t_id_hw_read,
	interrupt_mapping_57_int_cntrl_num_hw_read,
	interrupt_mapping_57_select_pulse,
	interrupt_mapping_58_mdo_mode_hw_read,
	interrupt_mapping_58_v_hw_read,
	interrupt_mapping_58_t_id_hw_read,
	interrupt_mapping_58_int_cntrl_num_hw_read,
	interrupt_mapping_58_select_pulse,
	interrupt_mapping_59_mdo_mode_hw_read,
	interrupt_mapping_59_v_hw_read,
	interrupt_mapping_59_t_id_hw_read,
	interrupt_mapping_59_int_cntrl_num_hw_read,
	interrupt_mapping_59_select_pulse,
	interrupt_mapping_62_mdo_mode_hw_read,
	interrupt_mapping_62_v_hw_read,
	interrupt_mapping_62_t_id_hw_read,
	interrupt_mapping_62_int_cntrl_num_hw_read,
	interrupt_mapping_62_select_pulse,
	interrupt_mapping_63_mdo_mode_hw_read,
	interrupt_mapping_63_v_hw_read,
	interrupt_mapping_63_t_id_hw_read,
	interrupt_mapping_63_int_cntrl_num_hw_read,
	interrupt_mapping_63_select_pulse,
	clr_int_reg_20_ext_select,
	clr_int_reg_20_select,
	clr_int_reg_20_ext_read_data,
	clr_int_reg_20_int_state_ext_wr_data,
	clr_int_reg_21_ext_select,
	clr_int_reg_21_select,
	clr_int_reg_21_ext_read_data,
	clr_int_reg_21_int_state_ext_wr_data,
	clr_int_reg_22_ext_select,
	clr_int_reg_22_select,
	clr_int_reg_22_ext_read_data,
	clr_int_reg_22_int_state_ext_wr_data,
	clr_int_reg_23_ext_select,
	clr_int_reg_23_select,
	clr_int_reg_23_ext_read_data,
	clr_int_reg_23_int_state_ext_wr_data,
	clr_int_reg_24_ext_select,
	clr_int_reg_24_select,
	clr_int_reg_24_ext_read_data,
	clr_int_reg_24_int_state_ext_wr_data,
	clr_int_reg_25_ext_select,
	clr_int_reg_25_select,
	clr_int_reg_25_ext_read_data,
	clr_int_reg_25_int_state_ext_wr_data,
	clr_int_reg_26_ext_select,
	clr_int_reg_26_select,
	clr_int_reg_26_ext_read_data,
	clr_int_reg_26_int_state_ext_wr_data,
	clr_int_reg_27_ext_select,
	clr_int_reg_27_select,
	clr_int_reg_27_ext_read_data,
	clr_int_reg_27_int_state_ext_wr_data,
	clr_int_reg_28_ext_select,
	clr_int_reg_28_select,
	clr_int_reg_28_ext_read_data,
	clr_int_reg_28_int_state_ext_wr_data,
	clr_int_reg_29_ext_select,
	clr_int_reg_29_select,
	clr_int_reg_29_ext_read_data,
	clr_int_reg_29_int_state_ext_wr_data,
	clr_int_reg_30_ext_select,
	clr_int_reg_30_select,
	clr_int_reg_30_ext_read_data,
	clr_int_reg_30_int_state_ext_wr_data,
	clr_int_reg_31_ext_select,
	clr_int_reg_31_select,
	clr_int_reg_31_ext_read_data,
	clr_int_reg_31_int_state_ext_wr_data,
	clr_int_reg_32_ext_select,
	clr_int_reg_32_select,
	clr_int_reg_32_ext_read_data,
	clr_int_reg_32_int_state_ext_wr_data,
	clr_int_reg_33_ext_select,
	clr_int_reg_33_select,
	clr_int_reg_33_ext_read_data,
	clr_int_reg_33_int_state_ext_wr_data,
	clr_int_reg_34_ext_select,
	clr_int_reg_34_select,
	clr_int_reg_34_ext_read_data,
	clr_int_reg_34_int_state_ext_wr_data,
	clr_int_reg_35_ext_select,
	clr_int_reg_35_select,
	clr_int_reg_35_ext_read_data,
	clr_int_reg_35_int_state_ext_wr_data,
	clr_int_reg_36_ext_select,
	clr_int_reg_36_select,
	clr_int_reg_36_ext_read_data,
	clr_int_reg_36_int_state_ext_wr_data,
	clr_int_reg_37_ext_select,
	clr_int_reg_37_select,
	clr_int_reg_37_ext_read_data,
	clr_int_reg_37_int_state_ext_wr_data,
	clr_int_reg_38_ext_select,
	clr_int_reg_38_select,
	clr_int_reg_38_ext_read_data,
	clr_int_reg_38_int_state_ext_wr_data,
	clr_int_reg_39_ext_select,
	clr_int_reg_39_select,
	clr_int_reg_39_ext_read_data,
	clr_int_reg_39_int_state_ext_wr_data,
	clr_int_reg_40_ext_select,
	clr_int_reg_40_select,
	clr_int_reg_40_ext_read_data,
	clr_int_reg_40_int_state_ext_wr_data,
	clr_int_reg_41_ext_select,
	clr_int_reg_41_select,
	clr_int_reg_41_ext_read_data,
	clr_int_reg_41_int_state_ext_wr_data,
	clr_int_reg_42_ext_select,
	clr_int_reg_42_select,
	clr_int_reg_42_ext_read_data,
	clr_int_reg_42_int_state_ext_wr_data,
	clr_int_reg_43_ext_select,
	clr_int_reg_43_select,
	clr_int_reg_43_ext_read_data,
	clr_int_reg_43_int_state_ext_wr_data,
	clr_int_reg_44_ext_select,
	clr_int_reg_44_select,
	clr_int_reg_44_ext_read_data,
	clr_int_reg_44_int_state_ext_wr_data,
	clr_int_reg_45_ext_select,
	clr_int_reg_45_select,
	clr_int_reg_45_ext_read_data,
	clr_int_reg_45_int_state_ext_wr_data,
	clr_int_reg_46_ext_select,
	clr_int_reg_46_select,
	clr_int_reg_46_ext_read_data,
	clr_int_reg_46_int_state_ext_wr_data,
	clr_int_reg_47_ext_select,
	clr_int_reg_47_select,
	clr_int_reg_47_ext_read_data,
	clr_int_reg_47_int_state_ext_wr_data,
	clr_int_reg_48_ext_select,
	clr_int_reg_48_select,
	clr_int_reg_48_ext_read_data,
	clr_int_reg_48_int_state_ext_wr_data,
	clr_int_reg_49_ext_select,
	clr_int_reg_49_select,
	clr_int_reg_49_ext_read_data,
	clr_int_reg_49_int_state_ext_wr_data,
	clr_int_reg_50_ext_select,
	clr_int_reg_50_select,
	clr_int_reg_50_ext_read_data,
	clr_int_reg_50_int_state_ext_wr_data,
	clr_int_reg_51_ext_select,
	clr_int_reg_51_select,
	clr_int_reg_51_ext_read_data,
	clr_int_reg_51_int_state_ext_wr_data,
	clr_int_reg_52_ext_select,
	clr_int_reg_52_select,
	clr_int_reg_52_ext_read_data,
	clr_int_reg_52_int_state_ext_wr_data,
	clr_int_reg_53_ext_select,
	clr_int_reg_53_select,
	clr_int_reg_53_ext_read_data,
	clr_int_reg_53_int_state_ext_wr_data,
	clr_int_reg_54_ext_select,
	clr_int_reg_54_select,
	clr_int_reg_54_ext_read_data,
	clr_int_reg_54_int_state_ext_wr_data,
	clr_int_reg_55_ext_select,
	clr_int_reg_55_select,
	clr_int_reg_55_ext_read_data,
	clr_int_reg_55_int_state_ext_wr_data,
	clr_int_reg_56_ext_select,
	clr_int_reg_56_select,
	clr_int_reg_56_ext_read_data,
	clr_int_reg_56_int_state_ext_wr_data,
	clr_int_reg_57_ext_select,
	clr_int_reg_57_select,
	clr_int_reg_57_ext_read_data,
	clr_int_reg_57_int_state_ext_wr_data,
	clr_int_reg_58_ext_select,
	clr_int_reg_58_select,
	clr_int_reg_58_ext_read_data,
	clr_int_reg_58_int_state_ext_wr_data,
	clr_int_reg_59_ext_select,
	clr_int_reg_59_select,
	clr_int_reg_59_ext_read_data,
	clr_int_reg_59_int_state_ext_wr_data,
	clr_int_reg_62_ext_select,
	clr_int_reg_62_select,
	clr_int_reg_62_ext_read_data,
	clr_int_reg_62_int_state_ext_wr_data,
	clr_int_reg_63_ext_select,
	clr_int_reg_63_select,
	clr_int_reg_63_ext_read_data,
	clr_int_reg_63_int_state_ext_wr_data,
	interrupt_retry_timer_limit_hw_read,
	interrupt_retry_timer_select_pulse,
	interrupt_state_status_1_select,
	interrupt_state_status_1_ext_read_data,
	interrupt_state_status_2_select,
	interrupt_state_status_2_ext_read_data,
	rst_l,
	daemon_csrbus_wr_in,
	daemon_csrbus_wr_out,
	daemon_csrbus_wr_data_in,
	read_data_0_out
	);

//====================================================
//     Polarity declarations
//====================================================
input  clk;  // Clock signal
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
input  interrupt_mapping_20_select_pulse;  // select
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
input  interrupt_mapping_21_select_pulse;  // select
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
input  interrupt_mapping_22_select_pulse;  // select
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
input  interrupt_mapping_23_select_pulse;  // select
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
input  interrupt_mapping_24_select_pulse;  // select
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
input  interrupt_mapping_25_select_pulse;  // select
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
input  interrupt_mapping_26_select_pulse;  // select
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
input  interrupt_mapping_27_select_pulse;  // select
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
input  interrupt_mapping_28_select_pulse;  // select
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
input  interrupt_mapping_29_select_pulse;  // select
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
input  interrupt_mapping_30_select_pulse;  // select
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
input  interrupt_mapping_31_select_pulse;  // select
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
input  interrupt_mapping_32_select_pulse;  // select
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
input  interrupt_mapping_33_select_pulse;  // select
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
input  interrupt_mapping_34_select_pulse;  // select
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
input  interrupt_mapping_35_select_pulse;  // select
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
input  interrupt_mapping_36_select_pulse;  // select
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
input  interrupt_mapping_37_select_pulse;  // select
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
input  interrupt_mapping_38_select_pulse;  // select
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
input  interrupt_mapping_39_select_pulse;  // select
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
input  interrupt_mapping_40_select_pulse;  // select
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
input  interrupt_mapping_41_select_pulse;  // select
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
input  interrupt_mapping_42_select_pulse;  // select
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
input  interrupt_mapping_43_select_pulse;  // select
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
input  interrupt_mapping_44_select_pulse;  // select
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
input  interrupt_mapping_45_select_pulse;  // select
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
input  interrupt_mapping_46_select_pulse;  // select
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
input  interrupt_mapping_47_select_pulse;  // select
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
input  interrupt_mapping_48_select_pulse;  // select
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
input  interrupt_mapping_49_select_pulse;  // select
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
input  interrupt_mapping_50_select_pulse;  // select
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
input  interrupt_mapping_51_select_pulse;  // select
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
input  interrupt_mapping_52_select_pulse;  // select
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
input  interrupt_mapping_53_select_pulse;  // select
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
input  interrupt_mapping_54_select_pulse;  // select
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
input  interrupt_mapping_55_select_pulse;  // select
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
input  interrupt_mapping_56_select_pulse;  // select
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
input  interrupt_mapping_57_select_pulse;  // select
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
input  interrupt_mapping_58_select_pulse;  // select
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
input  interrupt_mapping_59_select_pulse;  // select
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
input  interrupt_mapping_62_select_pulse;  // select
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
input  interrupt_mapping_63_select_pulse;  // select
output clr_int_reg_20_ext_select;  // When set, register clr_int_reg_20 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_20_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_20_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_20_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_20", field
                                                    // "int_state"
output clr_int_reg_21_ext_select;  // When set, register clr_int_reg_21 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_21_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_21_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_21_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_21", field
                                                    // "int_state"
output clr_int_reg_22_ext_select;  // When set, register clr_int_reg_22 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_22_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_22_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_22_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_22", field
                                                    // "int_state"
output clr_int_reg_23_ext_select;  // When set, register clr_int_reg_23 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_23_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_23_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_23_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_23", field
                                                    // "int_state"
output clr_int_reg_24_ext_select;  // When set, register clr_int_reg_24 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_24_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_24_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_24_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_24", field
                                                    // "int_state"
output clr_int_reg_25_ext_select;  // When set, register clr_int_reg_25 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_25_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_25_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_25_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_25", field
                                                    // "int_state"
output clr_int_reg_26_ext_select;  // When set, register clr_int_reg_26 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_26_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_26_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_26_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_26", field
                                                    // "int_state"
output clr_int_reg_27_ext_select;  // When set, register clr_int_reg_27 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_27_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_27_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_27_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_27", field
                                                    // "int_state"
output clr_int_reg_28_ext_select;  // When set, register clr_int_reg_28 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_28_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_28_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_28_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_28", field
                                                    // "int_state"
output clr_int_reg_29_ext_select;  // When set, register clr_int_reg_29 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_29_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_29_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_29_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_29", field
                                                    // "int_state"
output clr_int_reg_30_ext_select;  // When set, register clr_int_reg_30 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_30_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_30_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_30_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_30", field
                                                    // "int_state"
output clr_int_reg_31_ext_select;  // When set, register clr_int_reg_31 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_31_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_31_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_31_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_31", field
                                                    // "int_state"
output clr_int_reg_32_ext_select;  // When set, register clr_int_reg_32 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_32_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_32_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_32_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_32", field
                                                    // "int_state"
output clr_int_reg_33_ext_select;  // When set, register clr_int_reg_33 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_33_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_33_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_33_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_33", field
                                                    // "int_state"
output clr_int_reg_34_ext_select;  // When set, register clr_int_reg_34 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_34_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_34_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_34_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_34", field
                                                    // "int_state"
output clr_int_reg_35_ext_select;  // When set, register clr_int_reg_35 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_35_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_35_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_35_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_35", field
                                                    // "int_state"
output clr_int_reg_36_ext_select;  // When set, register clr_int_reg_36 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_36_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_36_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_36_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_36", field
                                                    // "int_state"
output clr_int_reg_37_ext_select;  // When set, register clr_int_reg_37 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_37_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_37_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_37_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_37", field
                                                    // "int_state"
output clr_int_reg_38_ext_select;  // When set, register clr_int_reg_38 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_38_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_38_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_38_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_38", field
                                                    // "int_state"
output clr_int_reg_39_ext_select;  // When set, register clr_int_reg_39 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_39_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_39_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_39_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_39", field
                                                    // "int_state"
output clr_int_reg_40_ext_select;  // When set, register clr_int_reg_40 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_40_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_40_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_40_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_40", field
                                                    // "int_state"
output clr_int_reg_41_ext_select;  // When set, register clr_int_reg_41 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_41_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_41_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_41_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_41", field
                                                    // "int_state"
output clr_int_reg_42_ext_select;  // When set, register clr_int_reg_42 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_42_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_42_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_42_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_42", field
                                                    // "int_state"
output clr_int_reg_43_ext_select;  // When set, register clr_int_reg_43 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_43_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_43_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_43_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_43", field
                                                    // "int_state"
output clr_int_reg_44_ext_select;  // When set, register clr_int_reg_44 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_44_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_44_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_44_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_44", field
                                                    // "int_state"
output clr_int_reg_45_ext_select;  // When set, register clr_int_reg_45 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_45_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_45_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_45_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_45", field
                                                    // "int_state"
output clr_int_reg_46_ext_select;  // When set, register clr_int_reg_46 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_46_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_46_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_46_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_46", field
                                                    // "int_state"
output clr_int_reg_47_ext_select;  // When set, register clr_int_reg_47 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_47_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_47_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_47_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_47", field
                                                    // "int_state"
output clr_int_reg_48_ext_select;  // When set, register clr_int_reg_48 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_48_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_48_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_48_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_48", field
                                                    // "int_state"
output clr_int_reg_49_ext_select;  // When set, register clr_int_reg_49 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_49_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_49_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_49_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_49", field
                                                    // "int_state"
output clr_int_reg_50_ext_select;  // When set, register clr_int_reg_50 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_50_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_50_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_50_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_50", field
                                                    // "int_state"
output clr_int_reg_51_ext_select;  // When set, register clr_int_reg_51 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_51_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_51_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_51_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_51", field
                                                    // "int_state"
output clr_int_reg_52_ext_select;  // When set, register clr_int_reg_52 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_52_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_52_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_52_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_52", field
                                                    // "int_state"
output clr_int_reg_53_ext_select;  // When set, register clr_int_reg_53 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_53_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_53_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_53_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_53", field
                                                    // "int_state"
output clr_int_reg_54_ext_select;  // When set, register clr_int_reg_54 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_54_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_54_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_54_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_54", field
                                                    // "int_state"
output clr_int_reg_55_ext_select;  // When set, register clr_int_reg_55 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_55_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_55_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_55_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_55", field
                                                    // "int_state"
output clr_int_reg_56_ext_select;  // When set, register clr_int_reg_56 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_56_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_56_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_56_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_56", field
                                                    // "int_state"
output clr_int_reg_57_ext_select;  // When set, register clr_int_reg_57 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_57_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_57_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_57_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_57", field
                                                    // "int_state"
output clr_int_reg_58_ext_select;  // When set, register clr_int_reg_58 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_58_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_58_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_58_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_58", field
                                                    // "int_state"
output clr_int_reg_59_ext_select;  // When set, register clr_int_reg_59 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_59_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_59_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_59_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_59", field
                                                    // "int_state"
output clr_int_reg_62_ext_select;  // When set, register clr_int_reg_62 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_62_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_62_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_62_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_62", field
                                                    // "int_state"
output clr_int_reg_63_ext_select;  // When set, register clr_int_reg_63 is
                                   // selected. This signal is a pulse.
input  clr_int_reg_63_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_63_ext_read_data;
    // Read Data
output [1:0] clr_int_reg_63_int_state_ext_wr_data;  // Provides SW write data
                                                    // for external register
                                                    // "clr_int_reg_63", field
                                                    // "int_state"
output [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_RETRY_TIMER_LIMIT_INT_SLC] interrupt_retry_timer_limit_hw_read;
    // This signal provides the current value of interrupt_retry_timer_limit.
input  interrupt_retry_timer_select_pulse;  // select
input  interrupt_state_status_1_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] interrupt_state_status_1_ext_read_data;
    // Read Data
input  interrupt_state_status_2_select;  // select
input  [`FIRE_CSRBUS_DATA_WIDTH - 1:0] interrupt_state_status_2_ext_read_data;
    // Read Data
input  rst_l;  // HW reset
input  daemon_csrbus_wr_in;  // csrbus_wr
output daemon_csrbus_wr_out;  // csrbus_wr
input  [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
output [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data

//====================================================
//     Type declarations
//====================================================
wire clk;  // Clock signal
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
wire interrupt_mapping_20_select_pulse;  // select
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
wire interrupt_mapping_21_select_pulse;  // select
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
wire interrupt_mapping_22_select_pulse;  // select
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
wire interrupt_mapping_23_select_pulse;  // select
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
wire interrupt_mapping_24_select_pulse;  // select
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
wire interrupt_mapping_25_select_pulse;  // select
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
wire interrupt_mapping_26_select_pulse;  // select
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
wire interrupt_mapping_27_select_pulse;  // select
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
wire interrupt_mapping_28_select_pulse;  // select
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
wire interrupt_mapping_29_select_pulse;  // select
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
wire interrupt_mapping_30_select_pulse;  // select
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
wire interrupt_mapping_31_select_pulse;  // select
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
wire interrupt_mapping_32_select_pulse;  // select
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
wire interrupt_mapping_33_select_pulse;  // select
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
wire interrupt_mapping_34_select_pulse;  // select
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
wire interrupt_mapping_35_select_pulse;  // select
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
wire interrupt_mapping_36_select_pulse;  // select
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
wire interrupt_mapping_37_select_pulse;  // select
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
wire interrupt_mapping_38_select_pulse;  // select
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
wire interrupt_mapping_39_select_pulse;  // select
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
wire interrupt_mapping_40_select_pulse;  // select
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
wire interrupt_mapping_41_select_pulse;  // select
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
wire interrupt_mapping_42_select_pulse;  // select
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
wire interrupt_mapping_43_select_pulse;  // select
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
wire interrupt_mapping_44_select_pulse;  // select
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
wire interrupt_mapping_45_select_pulse;  // select
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
wire interrupt_mapping_46_select_pulse;  // select
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
wire interrupt_mapping_47_select_pulse;  // select
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
wire interrupt_mapping_48_select_pulse;  // select
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
wire interrupt_mapping_49_select_pulse;  // select
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
wire interrupt_mapping_50_select_pulse;  // select
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
wire interrupt_mapping_51_select_pulse;  // select
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
wire interrupt_mapping_52_select_pulse;  // select
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
wire interrupt_mapping_53_select_pulse;  // select
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
wire interrupt_mapping_54_select_pulse;  // select
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
wire interrupt_mapping_55_select_pulse;  // select
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
wire interrupt_mapping_56_select_pulse;  // select
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
wire interrupt_mapping_57_select_pulse;  // select
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
wire interrupt_mapping_58_select_pulse;  // select
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
wire interrupt_mapping_59_select_pulse;  // select
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
wire interrupt_mapping_62_select_pulse;  // select
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
wire interrupt_mapping_63_select_pulse;  // select
wire clr_int_reg_20_ext_select;  // When set, register clr_int_reg_20 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_20_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_20_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_20_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_20", field
                                                  // "int_state"
wire clr_int_reg_21_ext_select;  // When set, register clr_int_reg_21 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_21_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_21_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_21_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_21", field
                                                  // "int_state"
wire clr_int_reg_22_ext_select;  // When set, register clr_int_reg_22 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_22_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_22_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_22_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_22", field
                                                  // "int_state"
wire clr_int_reg_23_ext_select;  // When set, register clr_int_reg_23 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_23_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_23_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_23_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_23", field
                                                  // "int_state"
wire clr_int_reg_24_ext_select;  // When set, register clr_int_reg_24 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_24_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_24_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_24_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_24", field
                                                  // "int_state"
wire clr_int_reg_25_ext_select;  // When set, register clr_int_reg_25 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_25_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_25_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_25_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_25", field
                                                  // "int_state"
wire clr_int_reg_26_ext_select;  // When set, register clr_int_reg_26 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_26_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_26_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_26_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_26", field
                                                  // "int_state"
wire clr_int_reg_27_ext_select;  // When set, register clr_int_reg_27 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_27_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_27_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_27_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_27", field
                                                  // "int_state"
wire clr_int_reg_28_ext_select;  // When set, register clr_int_reg_28 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_28_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_28_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_28_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_28", field
                                                  // "int_state"
wire clr_int_reg_29_ext_select;  // When set, register clr_int_reg_29 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_29_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_29_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_29_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_29", field
                                                  // "int_state"
wire clr_int_reg_30_ext_select;  // When set, register clr_int_reg_30 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_30_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_30_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_30_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_30", field
                                                  // "int_state"
wire clr_int_reg_31_ext_select;  // When set, register clr_int_reg_31 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_31_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_31_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_31_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_31", field
                                                  // "int_state"
wire clr_int_reg_32_ext_select;  // When set, register clr_int_reg_32 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_32_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_32_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_32_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_32", field
                                                  // "int_state"
wire clr_int_reg_33_ext_select;  // When set, register clr_int_reg_33 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_33_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_33_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_33_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_33", field
                                                  // "int_state"
wire clr_int_reg_34_ext_select;  // When set, register clr_int_reg_34 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_34_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_34_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_34_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_34", field
                                                  // "int_state"
wire clr_int_reg_35_ext_select;  // When set, register clr_int_reg_35 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_35_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_35_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_35_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_35", field
                                                  // "int_state"
wire clr_int_reg_36_ext_select;  // When set, register clr_int_reg_36 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_36_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_36_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_36_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_36", field
                                                  // "int_state"
wire clr_int_reg_37_ext_select;  // When set, register clr_int_reg_37 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_37_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_37_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_37_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_37", field
                                                  // "int_state"
wire clr_int_reg_38_ext_select;  // When set, register clr_int_reg_38 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_38_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_38_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_38_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_38", field
                                                  // "int_state"
wire clr_int_reg_39_ext_select;  // When set, register clr_int_reg_39 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_39_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_39_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_39_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_39", field
                                                  // "int_state"
wire clr_int_reg_40_ext_select;  // When set, register clr_int_reg_40 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_40_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_40_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_40_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_40", field
                                                  // "int_state"
wire clr_int_reg_41_ext_select;  // When set, register clr_int_reg_41 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_41_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_41_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_41_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_41", field
                                                  // "int_state"
wire clr_int_reg_42_ext_select;  // When set, register clr_int_reg_42 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_42_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_42_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_42_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_42", field
                                                  // "int_state"
wire clr_int_reg_43_ext_select;  // When set, register clr_int_reg_43 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_43_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_43_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_43_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_43", field
                                                  // "int_state"
wire clr_int_reg_44_ext_select;  // When set, register clr_int_reg_44 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_44_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_44_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_44_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_44", field
                                                  // "int_state"
wire clr_int_reg_45_ext_select;  // When set, register clr_int_reg_45 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_45_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_45_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_45_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_45", field
                                                  // "int_state"
wire clr_int_reg_46_ext_select;  // When set, register clr_int_reg_46 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_46_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_46_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_46_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_46", field
                                                  // "int_state"
wire clr_int_reg_47_ext_select;  // When set, register clr_int_reg_47 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_47_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_47_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_47_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_47", field
                                                  // "int_state"
wire clr_int_reg_48_ext_select;  // When set, register clr_int_reg_48 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_48_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_48_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_48_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_48", field
                                                  // "int_state"
wire clr_int_reg_49_ext_select;  // When set, register clr_int_reg_49 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_49_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_49_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_49_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_49", field
                                                  // "int_state"
wire clr_int_reg_50_ext_select;  // When set, register clr_int_reg_50 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_50_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_50_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_50_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_50", field
                                                  // "int_state"
wire clr_int_reg_51_ext_select;  // When set, register clr_int_reg_51 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_51_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_51_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_51_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_51", field
                                                  // "int_state"
wire clr_int_reg_52_ext_select;  // When set, register clr_int_reg_52 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_52_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_52_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_52_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_52", field
                                                  // "int_state"
wire clr_int_reg_53_ext_select;  // When set, register clr_int_reg_53 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_53_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_53_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_53_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_53", field
                                                  // "int_state"
wire clr_int_reg_54_ext_select;  // When set, register clr_int_reg_54 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_54_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_54_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_54_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_54", field
                                                  // "int_state"
wire clr_int_reg_55_ext_select;  // When set, register clr_int_reg_55 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_55_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_55_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_55_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_55", field
                                                  // "int_state"
wire clr_int_reg_56_ext_select;  // When set, register clr_int_reg_56 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_56_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_56_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_56_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_56", field
                                                  // "int_state"
wire clr_int_reg_57_ext_select;  // When set, register clr_int_reg_57 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_57_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_57_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_57_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_57", field
                                                  // "int_state"
wire clr_int_reg_58_ext_select;  // When set, register clr_int_reg_58 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_58_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_58_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_58_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_58", field
                                                  // "int_state"
wire clr_int_reg_59_ext_select;  // When set, register clr_int_reg_59 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_59_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_59_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_59_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_59", field
                                                  // "int_state"
wire clr_int_reg_62_ext_select;  // When set, register clr_int_reg_62 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_62_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_62_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_62_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_62", field
                                                  // "int_state"
wire clr_int_reg_63_ext_select;  // When set, register clr_int_reg_63 is
                                 // selected. This signal is a pulse.
wire clr_int_reg_63_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] clr_int_reg_63_ext_read_data;
    // Read Data
wire [1:0] clr_int_reg_63_int_state_ext_wr_data;  // Provides SW write data for
                                                  // external register
                                                  // "clr_int_reg_63", field
                                                  // "int_state"
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_RETRY_TIMER_LIMIT_INT_SLC] interrupt_retry_timer_limit_hw_read;
    // This signal provides the current value of interrupt_retry_timer_limit.
wire interrupt_retry_timer_select_pulse;  // select
wire interrupt_state_status_1_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] interrupt_state_status_1_ext_read_data;
    // Read Data
wire interrupt_state_status_2_select;  // select
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] interrupt_state_status_2_ext_read_data;
    // Read Data
wire rst_l;  // HW reset
wire daemon_csrbus_wr_in;  // csrbus_wr
wire daemon_csrbus_wr_out;  // csrbus_wr
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data_in;  // SW write data
wire [`FIRE_CSRBUS_DATA_WIDTH - 1:0] read_data_0_out;  // Read Data


//====================================================
//   Local signals
//====================================================
//----- For CSR register: interrupt_mapping_20
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_20_WIDTH-1:0] interrupt_mapping_20_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_21
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_21_WIDTH-1:0] interrupt_mapping_21_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_22
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_22_WIDTH-1:0] interrupt_mapping_22_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_23
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_23_WIDTH-1:0] interrupt_mapping_23_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_24
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_24_WIDTH-1:0] interrupt_mapping_24_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_25
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_25_WIDTH-1:0] interrupt_mapping_25_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_26
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_26_WIDTH-1:0] interrupt_mapping_26_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_27
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_27_WIDTH-1:0] interrupt_mapping_27_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_28
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_28_WIDTH-1:0] interrupt_mapping_28_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_29
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_29_WIDTH-1:0] interrupt_mapping_29_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_30
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_30_WIDTH-1:0] interrupt_mapping_30_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_31
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_31_WIDTH-1:0] interrupt_mapping_31_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_32
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_32_WIDTH-1:0] interrupt_mapping_32_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_33
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_33_WIDTH-1:0] interrupt_mapping_33_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_34
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_34_WIDTH-1:0] interrupt_mapping_34_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_35
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_35_WIDTH-1:0] interrupt_mapping_35_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_36
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_36_WIDTH-1:0] interrupt_mapping_36_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_37
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_37_WIDTH-1:0] interrupt_mapping_37_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_38
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_38_WIDTH-1:0] interrupt_mapping_38_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_39
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_39_WIDTH-1:0] interrupt_mapping_39_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_40
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_40_WIDTH-1:0] interrupt_mapping_40_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_41
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_41_WIDTH-1:0] interrupt_mapping_41_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_42
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_42_WIDTH-1:0] interrupt_mapping_42_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_43
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_43_WIDTH-1:0] interrupt_mapping_43_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_44
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_44_WIDTH-1:0] interrupt_mapping_44_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_45
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_45_WIDTH-1:0] interrupt_mapping_45_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_46
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_46_WIDTH-1:0] interrupt_mapping_46_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_47
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_47_WIDTH-1:0] interrupt_mapping_47_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_48
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_48_WIDTH-1:0] interrupt_mapping_48_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_49
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_49_WIDTH-1:0] interrupt_mapping_49_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_50
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_50_WIDTH-1:0] interrupt_mapping_50_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_51
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_51_WIDTH-1:0] interrupt_mapping_51_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_52
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_52_WIDTH-1:0] interrupt_mapping_52_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_53
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_53_WIDTH-1:0] interrupt_mapping_53_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_54
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_54_WIDTH-1:0] interrupt_mapping_54_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_55
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_55_WIDTH-1:0] interrupt_mapping_55_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_56
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_56_WIDTH-1:0] interrupt_mapping_56_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_57
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_57_WIDTH-1:0] interrupt_mapping_57_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_58
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_58_WIDTH-1:0] interrupt_mapping_58_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_59
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_59_WIDTH-1:0] interrupt_mapping_59_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_62
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_62_WIDTH-1:0] interrupt_mapping_62_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_mapping_63
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_MAPPING_63_WIDTH-1:0] interrupt_mapping_63_csrbus_read_data;
    // Entry Based Read Data

//----- For CSR register: interrupt_retry_timer
wire [`FIRE_DLC_IMU_ISS_CSR_INTERRUPT_RETRY_TIMER_WIDTH-1:0] interrupt_retry_timer_csrbus_read_data;
    // Entry Based Read Data


//====================================================
//     Pipelining (First stage)
//====================================================
//----- delayed select for ext_select
reg clr_int_reg_20_select_piped;
reg clr_int_reg_20_select_piped_delayed;
reg clr_int_reg_21_select_piped;
reg clr_int_reg_21_select_piped_delayed;
reg clr_int_reg_22_select_piped;
reg clr_int_reg_22_select_piped_delayed;
reg clr_int_reg_23_select_piped;
reg clr_int_reg_23_select_piped_delayed;
reg clr_int_reg_24_select_piped;
reg clr_int_reg_24_select_piped_delayed;
reg clr_int_reg_25_select_piped;
reg clr_int_reg_25_select_piped_delayed;
reg clr_int_reg_26_select_piped;
reg clr_int_reg_26_select_piped_delayed;
reg clr_int_reg_27_select_piped;
reg clr_int_reg_27_select_piped_delayed;
reg clr_int_reg_28_select_piped;
reg clr_int_reg_28_select_piped_delayed;
reg clr_int_reg_29_select_piped;
reg clr_int_reg_29_select_piped_delayed;
reg clr_int_reg_30_select_piped;
reg clr_int_reg_30_select_piped_delayed;
reg clr_int_reg_31_select_piped;
reg clr_int_reg_31_select_piped_delayed;
reg clr_int_reg_32_select_piped;
reg clr_int_reg_32_select_piped_delayed;
reg clr_int_reg_33_select_piped;
reg clr_int_reg_33_select_piped_delayed;
reg clr_int_reg_34_select_piped;
reg clr_int_reg_34_select_piped_delayed;
reg clr_int_reg_35_select_piped;
reg clr_int_reg_35_select_piped_delayed;
reg clr_int_reg_36_select_piped;
reg clr_int_reg_36_select_piped_delayed;
reg clr_int_reg_37_select_piped;
reg clr_int_reg_37_select_piped_delayed;
reg clr_int_reg_38_select_piped;
reg clr_int_reg_38_select_piped_delayed;
reg clr_int_reg_39_select_piped;
reg clr_int_reg_39_select_piped_delayed;
reg clr_int_reg_40_select_piped;
reg clr_int_reg_40_select_piped_delayed;
reg clr_int_reg_41_select_piped;
reg clr_int_reg_41_select_piped_delayed;
reg clr_int_reg_42_select_piped;
reg clr_int_reg_42_select_piped_delayed;
reg clr_int_reg_43_select_piped;
reg clr_int_reg_43_select_piped_delayed;
reg clr_int_reg_44_select_piped;
reg clr_int_reg_44_select_piped_delayed;
reg clr_int_reg_45_select_piped;
reg clr_int_reg_45_select_piped_delayed;
reg clr_int_reg_46_select_piped;
reg clr_int_reg_46_select_piped_delayed;
reg clr_int_reg_47_select_piped;
reg clr_int_reg_47_select_piped_delayed;
reg clr_int_reg_48_select_piped;
reg clr_int_reg_48_select_piped_delayed;
reg clr_int_reg_49_select_piped;
reg clr_int_reg_49_select_piped_delayed;
reg clr_int_reg_50_select_piped;
reg clr_int_reg_50_select_piped_delayed;
reg clr_int_reg_51_select_piped;
reg clr_int_reg_51_select_piped_delayed;
reg clr_int_reg_52_select_piped;
reg clr_int_reg_52_select_piped_delayed;
reg clr_int_reg_53_select_piped;
reg clr_int_reg_53_select_piped_delayed;
reg clr_int_reg_54_select_piped;
reg clr_int_reg_54_select_piped_delayed;
reg clr_int_reg_55_select_piped;
reg clr_int_reg_55_select_piped_delayed;
reg clr_int_reg_56_select_piped;
reg clr_int_reg_56_select_piped_delayed;
reg clr_int_reg_57_select_piped;
reg clr_int_reg_57_select_piped_delayed;
reg clr_int_reg_58_select_piped;
reg clr_int_reg_58_select_piped_delayed;
reg clr_int_reg_59_select_piped;
reg clr_int_reg_59_select_piped_delayed;
reg clr_int_reg_62_select_piped;
reg clr_int_reg_62_select_piped_delayed;
reg clr_int_reg_63_select_piped;
reg clr_int_reg_63_select_piped_delayed;

always @(posedge clk)
  begin
     if(~rst_l)
       begin
          clr_int_reg_20_select_piped <= 1'b0;
          clr_int_reg_20_select_piped_delayed <= 1'b0;
          clr_int_reg_21_select_piped <= 1'b0;
          clr_int_reg_21_select_piped_delayed <= 1'b0;
          clr_int_reg_22_select_piped <= 1'b0;
          clr_int_reg_22_select_piped_delayed <= 1'b0;
          clr_int_reg_23_select_piped <= 1'b0;
          clr_int_reg_23_select_piped_delayed <= 1'b0;
          clr_int_reg_24_select_piped <= 1'b0;
          clr_int_reg_24_select_piped_delayed <= 1'b0;
          clr_int_reg_25_select_piped <= 1'b0;
          clr_int_reg_25_select_piped_delayed <= 1'b0;
          clr_int_reg_26_select_piped <= 1'b0;
          clr_int_reg_26_select_piped_delayed <= 1'b0;
          clr_int_reg_27_select_piped <= 1'b0;
          clr_int_reg_27_select_piped_delayed <= 1'b0;
          clr_int_reg_28_select_piped <= 1'b0;
          clr_int_reg_28_select_piped_delayed <= 1'b0;
          clr_int_reg_29_select_piped <= 1'b0;
          clr_int_reg_29_select_piped_delayed <= 1'b0;
          clr_int_reg_30_select_piped <= 1'b0;
          clr_int_reg_30_select_piped_delayed <= 1'b0;
          clr_int_reg_31_select_piped <= 1'b0;
          clr_int_reg_31_select_piped_delayed <= 1'b0;
          clr_int_reg_32_select_piped <= 1'b0;
          clr_int_reg_32_select_piped_delayed <= 1'b0;
          clr_int_reg_33_select_piped <= 1'b0;
          clr_int_reg_33_select_piped_delayed <= 1'b0;
          clr_int_reg_34_select_piped <= 1'b0;
          clr_int_reg_34_select_piped_delayed <= 1'b0;
          clr_int_reg_35_select_piped <= 1'b0;
          clr_int_reg_35_select_piped_delayed <= 1'b0;
          clr_int_reg_36_select_piped <= 1'b0;
          clr_int_reg_36_select_piped_delayed <= 1'b0;
          clr_int_reg_37_select_piped <= 1'b0;
          clr_int_reg_37_select_piped_delayed <= 1'b0;
          clr_int_reg_38_select_piped <= 1'b0;
          clr_int_reg_38_select_piped_delayed <= 1'b0;
          clr_int_reg_39_select_piped <= 1'b0;
          clr_int_reg_39_select_piped_delayed <= 1'b0;
          clr_int_reg_40_select_piped <= 1'b0;
          clr_int_reg_40_select_piped_delayed <= 1'b0;
          clr_int_reg_41_select_piped <= 1'b0;
          clr_int_reg_41_select_piped_delayed <= 1'b0;
          clr_int_reg_42_select_piped <= 1'b0;
          clr_int_reg_42_select_piped_delayed <= 1'b0;
          clr_int_reg_43_select_piped <= 1'b0;
          clr_int_reg_43_select_piped_delayed <= 1'b0;
          clr_int_reg_44_select_piped <= 1'b0;
          clr_int_reg_44_select_piped_delayed <= 1'b0;
          clr_int_reg_45_select_piped <= 1'b0;
          clr_int_reg_45_select_piped_delayed <= 1'b0;
          clr_int_reg_46_select_piped <= 1'b0;
          clr_int_reg_46_select_piped_delayed <= 1'b0;
          clr_int_reg_47_select_piped <= 1'b0;
          clr_int_reg_47_select_piped_delayed <= 1'b0;
          clr_int_reg_48_select_piped <= 1'b0;
          clr_int_reg_48_select_piped_delayed <= 1'b0;
          clr_int_reg_49_select_piped <= 1'b0;
          clr_int_reg_49_select_piped_delayed <= 1'b0;
          clr_int_reg_50_select_piped <= 1'b0;
          clr_int_reg_50_select_piped_delayed <= 1'b0;
          clr_int_reg_51_select_piped <= 1'b0;
          clr_int_reg_51_select_piped_delayed <= 1'b0;
          clr_int_reg_52_select_piped <= 1'b0;
          clr_int_reg_52_select_piped_delayed <= 1'b0;
          clr_int_reg_53_select_piped <= 1'b0;
          clr_int_reg_53_select_piped_delayed <= 1'b0;
          clr_int_reg_54_select_piped <= 1'b0;
          clr_int_reg_54_select_piped_delayed <= 1'b0;
          clr_int_reg_55_select_piped <= 1'b0;
          clr_int_reg_55_select_piped_delayed <= 1'b0;
          clr_int_reg_56_select_piped <= 1'b0;
          clr_int_reg_56_select_piped_delayed <= 1'b0;
          clr_int_reg_57_select_piped <= 1'b0;
          clr_int_reg_57_select_piped_delayed <= 1'b0;
          clr_int_reg_58_select_piped <= 1'b0;
          clr_int_reg_58_select_piped_delayed <= 1'b0;
          clr_int_reg_59_select_piped <= 1'b0;
          clr_int_reg_59_select_piped_delayed <= 1'b0;
          clr_int_reg_62_select_piped <= 1'b0;
          clr_int_reg_62_select_piped_delayed <= 1'b0;
          clr_int_reg_63_select_piped <= 1'b0;
          clr_int_reg_63_select_piped_delayed <= 1'b0;
       end
     else
       begin
          clr_int_reg_20_select_piped <= clr_int_reg_20_select;
          clr_int_reg_20_select_piped_delayed <= clr_int_reg_20_select_piped;
          clr_int_reg_21_select_piped <= clr_int_reg_21_select;
          clr_int_reg_21_select_piped_delayed <= clr_int_reg_21_select_piped;
          clr_int_reg_22_select_piped <= clr_int_reg_22_select;
          clr_int_reg_22_select_piped_delayed <= clr_int_reg_22_select_piped;
          clr_int_reg_23_select_piped <= clr_int_reg_23_select;
          clr_int_reg_23_select_piped_delayed <= clr_int_reg_23_select_piped;
          clr_int_reg_24_select_piped <= clr_int_reg_24_select;
          clr_int_reg_24_select_piped_delayed <= clr_int_reg_24_select_piped;
          clr_int_reg_25_select_piped <= clr_int_reg_25_select;
          clr_int_reg_25_select_piped_delayed <= clr_int_reg_25_select_piped;
          clr_int_reg_26_select_piped <= clr_int_reg_26_select;
          clr_int_reg_26_select_piped_delayed <= clr_int_reg_26_select_piped;
          clr_int_reg_27_select_piped <= clr_int_reg_27_select;
          clr_int_reg_27_select_piped_delayed <= clr_int_reg_27_select_piped;
          clr_int_reg_28_select_piped <= clr_int_reg_28_select;
          clr_int_reg_28_select_piped_delayed <= clr_int_reg_28_select_piped;
          clr_int_reg_29_select_piped <= clr_int_reg_29_select;
          clr_int_reg_29_select_piped_delayed <= clr_int_reg_29_select_piped;
          clr_int_reg_30_select_piped <= clr_int_reg_30_select;
          clr_int_reg_30_select_piped_delayed <= clr_int_reg_30_select_piped;
          clr_int_reg_31_select_piped <= clr_int_reg_31_select;
          clr_int_reg_31_select_piped_delayed <= clr_int_reg_31_select_piped;
          clr_int_reg_32_select_piped <= clr_int_reg_32_select;
          clr_int_reg_32_select_piped_delayed <= clr_int_reg_32_select_piped;
          clr_int_reg_33_select_piped <= clr_int_reg_33_select;
          clr_int_reg_33_select_piped_delayed <= clr_int_reg_33_select_piped;
          clr_int_reg_34_select_piped <= clr_int_reg_34_select;
          clr_int_reg_34_select_piped_delayed <= clr_int_reg_34_select_piped;
          clr_int_reg_35_select_piped <= clr_int_reg_35_select;
          clr_int_reg_35_select_piped_delayed <= clr_int_reg_35_select_piped;
          clr_int_reg_36_select_piped <= clr_int_reg_36_select;
          clr_int_reg_36_select_piped_delayed <= clr_int_reg_36_select_piped;
          clr_int_reg_37_select_piped <= clr_int_reg_37_select;
          clr_int_reg_37_select_piped_delayed <= clr_int_reg_37_select_piped;
          clr_int_reg_38_select_piped <= clr_int_reg_38_select;
          clr_int_reg_38_select_piped_delayed <= clr_int_reg_38_select_piped;
          clr_int_reg_39_select_piped <= clr_int_reg_39_select;
          clr_int_reg_39_select_piped_delayed <= clr_int_reg_39_select_piped;
          clr_int_reg_40_select_piped <= clr_int_reg_40_select;
          clr_int_reg_40_select_piped_delayed <= clr_int_reg_40_select_piped;
          clr_int_reg_41_select_piped <= clr_int_reg_41_select;
          clr_int_reg_41_select_piped_delayed <= clr_int_reg_41_select_piped;
          clr_int_reg_42_select_piped <= clr_int_reg_42_select;
          clr_int_reg_42_select_piped_delayed <= clr_int_reg_42_select_piped;
          clr_int_reg_43_select_piped <= clr_int_reg_43_select;
          clr_int_reg_43_select_piped_delayed <= clr_int_reg_43_select_piped;
          clr_int_reg_44_select_piped <= clr_int_reg_44_select;
          clr_int_reg_44_select_piped_delayed <= clr_int_reg_44_select_piped;
          clr_int_reg_45_select_piped <= clr_int_reg_45_select;
          clr_int_reg_45_select_piped_delayed <= clr_int_reg_45_select_piped;
          clr_int_reg_46_select_piped <= clr_int_reg_46_select;
          clr_int_reg_46_select_piped_delayed <= clr_int_reg_46_select_piped;
          clr_int_reg_47_select_piped <= clr_int_reg_47_select;
          clr_int_reg_47_select_piped_delayed <= clr_int_reg_47_select_piped;
          clr_int_reg_48_select_piped <= clr_int_reg_48_select;
          clr_int_reg_48_select_piped_delayed <= clr_int_reg_48_select_piped;
          clr_int_reg_49_select_piped <= clr_int_reg_49_select;
          clr_int_reg_49_select_piped_delayed <= clr_int_reg_49_select_piped;
          clr_int_reg_50_select_piped <= clr_int_reg_50_select;
          clr_int_reg_50_select_piped_delayed <= clr_int_reg_50_select_piped;
          clr_int_reg_51_select_piped <= clr_int_reg_51_select;
          clr_int_reg_51_select_piped_delayed <= clr_int_reg_51_select_piped;
          clr_int_reg_52_select_piped <= clr_int_reg_52_select;
          clr_int_reg_52_select_piped_delayed <= clr_int_reg_52_select_piped;
          clr_int_reg_53_select_piped <= clr_int_reg_53_select;
          clr_int_reg_53_select_piped_delayed <= clr_int_reg_53_select_piped;
          clr_int_reg_54_select_piped <= clr_int_reg_54_select;
          clr_int_reg_54_select_piped_delayed <= clr_int_reg_54_select_piped;
          clr_int_reg_55_select_piped <= clr_int_reg_55_select;
          clr_int_reg_55_select_piped_delayed <= clr_int_reg_55_select_piped;
          clr_int_reg_56_select_piped <= clr_int_reg_56_select;
          clr_int_reg_56_select_piped_delayed <= clr_int_reg_56_select_piped;
          clr_int_reg_57_select_piped <= clr_int_reg_57_select;
          clr_int_reg_57_select_piped_delayed <= clr_int_reg_57_select_piped;
          clr_int_reg_58_select_piped <= clr_int_reg_58_select;
          clr_int_reg_58_select_piped_delayed <= clr_int_reg_58_select_piped;
          clr_int_reg_59_select_piped <= clr_int_reg_59_select;
          clr_int_reg_59_select_piped_delayed <= clr_int_reg_59_select_piped;
          clr_int_reg_62_select_piped <= clr_int_reg_62_select;
          clr_int_reg_62_select_piped_delayed <= clr_int_reg_62_select_piped;
          clr_int_reg_63_select_piped <= clr_int_reg_63_select;
          clr_int_reg_63_select_piped_delayed <= clr_int_reg_63_select_piped;
        end
  end

//====================================================
//     Assignments only (first stage)
//====================================================
wire [`FIRE_CSRBUS_DATA_WIDTH-1:0] daemon_csrbus_wr_data = daemon_csrbus_wr_data_in;
wire daemon_csrbus_wr      = daemon_csrbus_wr_in;
assign daemon_csrbus_wr_out      = daemon_csrbus_wr_in;
assign clr_int_reg_20_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_21_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_22_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_23_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_24_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_25_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_26_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_27_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_28_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_29_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_30_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_31_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_32_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_33_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_34_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_35_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_36_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_37_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_38_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_39_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_40_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_41_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_42_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_43_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_44_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_45_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_46_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_47_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_48_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_49_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_50_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_51_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_52_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_53_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_54_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_55_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_56_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_57_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_58_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_59_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_62_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];
assign clr_int_reg_63_int_state_ext_wr_data = daemon_csrbus_wr_data_in[1:0];

//====================================================
//      Automatic hw_ld / hw_write
//====================================================

//====================================================
//      Extern select
//====================================================
assign clr_int_reg_20_ext_select =
           clr_int_reg_20_select_piped&
           ~clr_int_reg_20_select_piped_delayed;

// clr_int_reg_20_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_20_ext_select_pulse
       -var clr_int_reg_20_ext_select -max 1
       -message "clr_int_reg_20_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_21_ext_select =
           clr_int_reg_21_select_piped&
           ~clr_int_reg_21_select_piped_delayed;

// clr_int_reg_21_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_21_ext_select_pulse
       -var clr_int_reg_21_ext_select -max 1
       -message "clr_int_reg_21_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_22_ext_select =
           clr_int_reg_22_select_piped&
           ~clr_int_reg_22_select_piped_delayed;

// clr_int_reg_22_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_22_ext_select_pulse
       -var clr_int_reg_22_ext_select -max 1
       -message "clr_int_reg_22_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_23_ext_select =
           clr_int_reg_23_select_piped&
           ~clr_int_reg_23_select_piped_delayed;

// clr_int_reg_23_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_23_ext_select_pulse
       -var clr_int_reg_23_ext_select -max 1
       -message "clr_int_reg_23_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_24_ext_select =
           clr_int_reg_24_select_piped&
           ~clr_int_reg_24_select_piped_delayed;

// clr_int_reg_24_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_24_ext_select_pulse
       -var clr_int_reg_24_ext_select -max 1
       -message "clr_int_reg_24_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_25_ext_select =
           clr_int_reg_25_select_piped&
           ~clr_int_reg_25_select_piped_delayed;

// clr_int_reg_25_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_25_ext_select_pulse
       -var clr_int_reg_25_ext_select -max 1
       -message "clr_int_reg_25_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_26_ext_select =
           clr_int_reg_26_select_piped&
           ~clr_int_reg_26_select_piped_delayed;

// clr_int_reg_26_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_26_ext_select_pulse
       -var clr_int_reg_26_ext_select -max 1
       -message "clr_int_reg_26_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_27_ext_select =
           clr_int_reg_27_select_piped&
           ~clr_int_reg_27_select_piped_delayed;

// clr_int_reg_27_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_27_ext_select_pulse
       -var clr_int_reg_27_ext_select -max 1
       -message "clr_int_reg_27_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_28_ext_select =
           clr_int_reg_28_select_piped&
           ~clr_int_reg_28_select_piped_delayed;

// clr_int_reg_28_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_28_ext_select_pulse
       -var clr_int_reg_28_ext_select -max 1
       -message "clr_int_reg_28_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_29_ext_select =
           clr_int_reg_29_select_piped&
           ~clr_int_reg_29_select_piped_delayed;

// clr_int_reg_29_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_29_ext_select_pulse
       -var clr_int_reg_29_ext_select -max 1
       -message "clr_int_reg_29_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_30_ext_select =
           clr_int_reg_30_select_piped&
           ~clr_int_reg_30_select_piped_delayed;

// clr_int_reg_30_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_30_ext_select_pulse
       -var clr_int_reg_30_ext_select -max 1
       -message "clr_int_reg_30_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_31_ext_select =
           clr_int_reg_31_select_piped&
           ~clr_int_reg_31_select_piped_delayed;

// clr_int_reg_31_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_31_ext_select_pulse
       -var clr_int_reg_31_ext_select -max 1
       -message "clr_int_reg_31_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_32_ext_select =
           clr_int_reg_32_select_piped&
           ~clr_int_reg_32_select_piped_delayed;

// clr_int_reg_32_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_32_ext_select_pulse
       -var clr_int_reg_32_ext_select -max 1
       -message "clr_int_reg_32_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_33_ext_select =
           clr_int_reg_33_select_piped&
           ~clr_int_reg_33_select_piped_delayed;

// clr_int_reg_33_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_33_ext_select_pulse
       -var clr_int_reg_33_ext_select -max 1
       -message "clr_int_reg_33_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_34_ext_select =
           clr_int_reg_34_select_piped&
           ~clr_int_reg_34_select_piped_delayed;

// clr_int_reg_34_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_34_ext_select_pulse
       -var clr_int_reg_34_ext_select -max 1
       -message "clr_int_reg_34_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_35_ext_select =
           clr_int_reg_35_select_piped&
           ~clr_int_reg_35_select_piped_delayed;

// clr_int_reg_35_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_35_ext_select_pulse
       -var clr_int_reg_35_ext_select -max 1
       -message "clr_int_reg_35_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_36_ext_select =
           clr_int_reg_36_select_piped&
           ~clr_int_reg_36_select_piped_delayed;

// clr_int_reg_36_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_36_ext_select_pulse
       -var clr_int_reg_36_ext_select -max 1
       -message "clr_int_reg_36_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_37_ext_select =
           clr_int_reg_37_select_piped&
           ~clr_int_reg_37_select_piped_delayed;

// clr_int_reg_37_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_37_ext_select_pulse
       -var clr_int_reg_37_ext_select -max 1
       -message "clr_int_reg_37_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_38_ext_select =
           clr_int_reg_38_select_piped&
           ~clr_int_reg_38_select_piped_delayed;

// clr_int_reg_38_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_38_ext_select_pulse
       -var clr_int_reg_38_ext_select -max 1
       -message "clr_int_reg_38_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_39_ext_select =
           clr_int_reg_39_select_piped&
           ~clr_int_reg_39_select_piped_delayed;

// clr_int_reg_39_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_39_ext_select_pulse
       -var clr_int_reg_39_ext_select -max 1
       -message "clr_int_reg_39_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_40_ext_select =
           clr_int_reg_40_select_piped&
           ~clr_int_reg_40_select_piped_delayed;

// clr_int_reg_40_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_40_ext_select_pulse
       -var clr_int_reg_40_ext_select -max 1
       -message "clr_int_reg_40_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_41_ext_select =
           clr_int_reg_41_select_piped&
           ~clr_int_reg_41_select_piped_delayed;

// clr_int_reg_41_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_41_ext_select_pulse
       -var clr_int_reg_41_ext_select -max 1
       -message "clr_int_reg_41_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_42_ext_select =
           clr_int_reg_42_select_piped&
           ~clr_int_reg_42_select_piped_delayed;

// clr_int_reg_42_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_42_ext_select_pulse
       -var clr_int_reg_42_ext_select -max 1
       -message "clr_int_reg_42_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_43_ext_select =
           clr_int_reg_43_select_piped&
           ~clr_int_reg_43_select_piped_delayed;

// clr_int_reg_43_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_43_ext_select_pulse
       -var clr_int_reg_43_ext_select -max 1
       -message "clr_int_reg_43_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_44_ext_select =
           clr_int_reg_44_select_piped&
           ~clr_int_reg_44_select_piped_delayed;

// clr_int_reg_44_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_44_ext_select_pulse
       -var clr_int_reg_44_ext_select -max 1
       -message "clr_int_reg_44_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_45_ext_select =
           clr_int_reg_45_select_piped&
           ~clr_int_reg_45_select_piped_delayed;

// clr_int_reg_45_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_45_ext_select_pulse
       -var clr_int_reg_45_ext_select -max 1
       -message "clr_int_reg_45_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_46_ext_select =
           clr_int_reg_46_select_piped&
           ~clr_int_reg_46_select_piped_delayed;

// clr_int_reg_46_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_46_ext_select_pulse
       -var clr_int_reg_46_ext_select -max 1
       -message "clr_int_reg_46_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_47_ext_select =
           clr_int_reg_47_select_piped&
           ~clr_int_reg_47_select_piped_delayed;

// clr_int_reg_47_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_47_ext_select_pulse
       -var clr_int_reg_47_ext_select -max 1
       -message "clr_int_reg_47_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_48_ext_select =
           clr_int_reg_48_select_piped&
           ~clr_int_reg_48_select_piped_delayed;

// clr_int_reg_48_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_48_ext_select_pulse
       -var clr_int_reg_48_ext_select -max 1
       -message "clr_int_reg_48_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_49_ext_select =
           clr_int_reg_49_select_piped&
           ~clr_int_reg_49_select_piped_delayed;

// clr_int_reg_49_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_49_ext_select_pulse
       -var clr_int_reg_49_ext_select -max 1
       -message "clr_int_reg_49_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_50_ext_select =
           clr_int_reg_50_select_piped&
           ~clr_int_reg_50_select_piped_delayed;

// clr_int_reg_50_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_50_ext_select_pulse
       -var clr_int_reg_50_ext_select -max 1
       -message "clr_int_reg_50_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_51_ext_select =
           clr_int_reg_51_select_piped&
           ~clr_int_reg_51_select_piped_delayed;

// clr_int_reg_51_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_51_ext_select_pulse
       -var clr_int_reg_51_ext_select -max 1
       -message "clr_int_reg_51_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_52_ext_select =
           clr_int_reg_52_select_piped&
           ~clr_int_reg_52_select_piped_delayed;

// clr_int_reg_52_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_52_ext_select_pulse
       -var clr_int_reg_52_ext_select -max 1
       -message "clr_int_reg_52_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_53_ext_select =
           clr_int_reg_53_select_piped&
           ~clr_int_reg_53_select_piped_delayed;

// clr_int_reg_53_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_53_ext_select_pulse
       -var clr_int_reg_53_ext_select -max 1
       -message "clr_int_reg_53_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_54_ext_select =
           clr_int_reg_54_select_piped&
           ~clr_int_reg_54_select_piped_delayed;

// clr_int_reg_54_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_54_ext_select_pulse
       -var clr_int_reg_54_ext_select -max 1
       -message "clr_int_reg_54_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_55_ext_select =
           clr_int_reg_55_select_piped&
           ~clr_int_reg_55_select_piped_delayed;

// clr_int_reg_55_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_55_ext_select_pulse
       -var clr_int_reg_55_ext_select -max 1
       -message "clr_int_reg_55_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_56_ext_select =
           clr_int_reg_56_select_piped&
           ~clr_int_reg_56_select_piped_delayed;

// clr_int_reg_56_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_56_ext_select_pulse
       -var clr_int_reg_56_ext_select -max 1
       -message "clr_int_reg_56_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_57_ext_select =
           clr_int_reg_57_select_piped&
           ~clr_int_reg_57_select_piped_delayed;

// clr_int_reg_57_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_57_ext_select_pulse
       -var clr_int_reg_57_ext_select -max 1
       -message "clr_int_reg_57_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_58_ext_select =
           clr_int_reg_58_select_piped&
           ~clr_int_reg_58_select_piped_delayed;

// clr_int_reg_58_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_58_ext_select_pulse
       -var clr_int_reg_58_ext_select -max 1
       -message "clr_int_reg_58_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_59_ext_select =
           clr_int_reg_59_select_piped&
           ~clr_int_reg_59_select_piped_delayed;

// clr_int_reg_59_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_59_ext_select_pulse
       -var clr_int_reg_59_ext_select -max 1
       -message "clr_int_reg_59_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_62_ext_select =
           clr_int_reg_62_select_piped&
           ~clr_int_reg_62_select_piped_delayed;

// clr_int_reg_62_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_62_ext_select_pulse
       -var clr_int_reg_62_ext_select -max 1
       -message "clr_int_reg_62_ext_select pulse length is not 1"
       -clock clk
*/

assign clr_int_reg_63_ext_select =
           clr_int_reg_63_select_piped&
           ~clr_int_reg_63_select_piped_delayed;

// clr_int_reg_63_ext_select is a pulse
/* 0in assert_timer -name clr_int_reg_63_ext_select_pulse
       -var clr_int_reg_63_ext_select -max 1
       -message "clr_int_reg_63_ext_select pulse length is not 1"
       -clock clk
*/


//=====================================================
//      OUTPUT: read_data_out
//=====================================================
dmu_imu_iss_csrpipe_87 dmu_imu_iss_csrpipe_87_inst_1
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.reg_in	(1'b1),
	.reg_out	(1'b1),
	.data0	(interrupt_mapping_20_csrbus_read_data),
	.sel0	(interrupt_mapping_20_select_pulse),
	.data1	(interrupt_mapping_21_csrbus_read_data),
	.sel1	(interrupt_mapping_21_select_pulse),
	.data2	(interrupt_mapping_22_csrbus_read_data),
	.sel2	(interrupt_mapping_22_select_pulse),
	.data3	(interrupt_mapping_23_csrbus_read_data),
	.sel3	(interrupt_mapping_23_select_pulse),
	.data4	(interrupt_mapping_24_csrbus_read_data),
	.sel4	(interrupt_mapping_24_select_pulse),
	.data5	(interrupt_mapping_25_csrbus_read_data),
	.sel5	(interrupt_mapping_25_select_pulse),
	.data6	(interrupt_mapping_26_csrbus_read_data),
	.sel6	(interrupt_mapping_26_select_pulse),
	.data7	(interrupt_mapping_27_csrbus_read_data),
	.sel7	(interrupt_mapping_27_select_pulse),
	.data8	(interrupt_mapping_28_csrbus_read_data),
	.sel8	(interrupt_mapping_28_select_pulse),
	.data9	(interrupt_mapping_29_csrbus_read_data),
	.sel9	(interrupt_mapping_29_select_pulse),
	.data10	(interrupt_mapping_30_csrbus_read_data),
	.sel10	(interrupt_mapping_30_select_pulse),
	.data11	(interrupt_mapping_31_csrbus_read_data),
	.sel11	(interrupt_mapping_31_select_pulse),
	.data12	(interrupt_mapping_32_csrbus_read_data),
	.sel12	(interrupt_mapping_32_select_pulse),
	.data13	(interrupt_mapping_33_csrbus_read_data),
	.sel13	(interrupt_mapping_33_select_pulse),
	.data14	(interrupt_mapping_34_csrbus_read_data),
	.sel14	(interrupt_mapping_34_select_pulse),
	.data15	(interrupt_mapping_35_csrbus_read_data),
	.sel15	(interrupt_mapping_35_select_pulse),
	.data16	(interrupt_mapping_36_csrbus_read_data),
	.sel16	(interrupt_mapping_36_select_pulse),
	.data17	(interrupt_mapping_37_csrbus_read_data),
	.sel17	(interrupt_mapping_37_select_pulse),
	.data18	(interrupt_mapping_38_csrbus_read_data),
	.sel18	(interrupt_mapping_38_select_pulse),
	.data19	(interrupt_mapping_39_csrbus_read_data),
	.sel19	(interrupt_mapping_39_select_pulse),
	.data20	(interrupt_mapping_40_csrbus_read_data),
	.sel20	(interrupt_mapping_40_select_pulse),
	.data21	(interrupt_mapping_41_csrbus_read_data),
	.sel21	(interrupt_mapping_41_select_pulse),
	.data22	(interrupt_mapping_42_csrbus_read_data),
	.sel22	(interrupt_mapping_42_select_pulse),
	.data23	(interrupt_mapping_43_csrbus_read_data),
	.sel23	(interrupt_mapping_43_select_pulse),
	.data24	(interrupt_mapping_44_csrbus_read_data),
	.sel24	(interrupt_mapping_44_select_pulse),
	.data25	(interrupt_mapping_45_csrbus_read_data),
	.sel25	(interrupt_mapping_45_select_pulse),
	.data26	(interrupt_mapping_46_csrbus_read_data),
	.sel26	(interrupt_mapping_46_select_pulse),
	.data27	(interrupt_mapping_47_csrbus_read_data),
	.sel27	(interrupt_mapping_47_select_pulse),
	.data28	(interrupt_mapping_48_csrbus_read_data),
	.sel28	(interrupt_mapping_48_select_pulse),
	.data29	(interrupt_mapping_49_csrbus_read_data),
	.sel29	(interrupt_mapping_49_select_pulse),
	.data30	(interrupt_mapping_50_csrbus_read_data),
	.sel30	(interrupt_mapping_50_select_pulse),
	.data31	(interrupt_mapping_51_csrbus_read_data),
	.sel31	(interrupt_mapping_51_select_pulse),
	.data32	(interrupt_mapping_52_csrbus_read_data),
	.sel32	(interrupt_mapping_52_select_pulse),
	.data33	(interrupt_mapping_53_csrbus_read_data),
	.sel33	(interrupt_mapping_53_select_pulse),
	.data34	(interrupt_mapping_54_csrbus_read_data),
	.sel34	(interrupt_mapping_54_select_pulse),
	.data35	(interrupt_mapping_55_csrbus_read_data),
	.sel35	(interrupt_mapping_55_select_pulse),
	.data36	(interrupt_mapping_56_csrbus_read_data),
	.sel36	(interrupt_mapping_56_select_pulse),
	.data37	(interrupt_mapping_57_csrbus_read_data),
	.sel37	(interrupt_mapping_57_select_pulse),
	.data38	(interrupt_mapping_58_csrbus_read_data),
	.sel38	(interrupt_mapping_58_select_pulse),
	.data39	(interrupt_mapping_59_csrbus_read_data),
	.sel39	(interrupt_mapping_59_select_pulse),
	.data40	(interrupt_mapping_62_csrbus_read_data),
	.sel40	(interrupt_mapping_62_select_pulse),
	.data41	(interrupt_mapping_63_csrbus_read_data),
	.sel41	(interrupt_mapping_63_select_pulse),
	.data42	(clr_int_reg_20_ext_read_data),
	.sel42	(clr_int_reg_20_select),
	.data43	(clr_int_reg_21_ext_read_data),
	.sel43	(clr_int_reg_21_select),
	.data44	(clr_int_reg_22_ext_read_data),
	.sel44	(clr_int_reg_22_select),
	.data45	(clr_int_reg_23_ext_read_data),
	.sel45	(clr_int_reg_23_select),
	.data46	(clr_int_reg_24_ext_read_data),
	.sel46	(clr_int_reg_24_select),
	.data47	(clr_int_reg_25_ext_read_data),
	.sel47	(clr_int_reg_25_select),
	.data48	(clr_int_reg_26_ext_read_data),
	.sel48	(clr_int_reg_26_select),
	.data49	(clr_int_reg_27_ext_read_data),
	.sel49	(clr_int_reg_27_select),
	.data50	(clr_int_reg_28_ext_read_data),
	.sel50	(clr_int_reg_28_select),
	.data51	(clr_int_reg_29_ext_read_data),
	.sel51	(clr_int_reg_29_select),
	.data52	(clr_int_reg_30_ext_read_data),
	.sel52	(clr_int_reg_30_select),
	.data53	(clr_int_reg_31_ext_read_data),
	.sel53	(clr_int_reg_31_select),
	.data54	(clr_int_reg_32_ext_read_data),
	.sel54	(clr_int_reg_32_select),
	.data55	(clr_int_reg_33_ext_read_data),
	.sel55	(clr_int_reg_33_select),
	.data56	(clr_int_reg_34_ext_read_data),
	.sel56	(clr_int_reg_34_select),
	.data57	(clr_int_reg_35_ext_read_data),
	.sel57	(clr_int_reg_35_select),
	.data58	(clr_int_reg_36_ext_read_data),
	.sel58	(clr_int_reg_36_select),
	.data59	(clr_int_reg_37_ext_read_data),
	.sel59	(clr_int_reg_37_select),
	.data60	(clr_int_reg_38_ext_read_data),
	.sel60	(clr_int_reg_38_select),
	.data61	(clr_int_reg_39_ext_read_data),
	.sel61	(clr_int_reg_39_select),
	.data62	(clr_int_reg_40_ext_read_data),
	.sel62	(clr_int_reg_40_select),
	.data63	(clr_int_reg_41_ext_read_data),
	.sel63	(clr_int_reg_41_select),
	.data64	(clr_int_reg_42_ext_read_data),
	.sel64	(clr_int_reg_42_select),
	.data65	(clr_int_reg_43_ext_read_data),
	.sel65	(clr_int_reg_43_select),
	.data66	(clr_int_reg_44_ext_read_data),
	.sel66	(clr_int_reg_44_select),
	.data67	(clr_int_reg_45_ext_read_data),
	.sel67	(clr_int_reg_45_select),
	.data68	(clr_int_reg_46_ext_read_data),
	.sel68	(clr_int_reg_46_select),
	.data69	(clr_int_reg_47_ext_read_data),
	.sel69	(clr_int_reg_47_select),
	.data70	(clr_int_reg_48_ext_read_data),
	.sel70	(clr_int_reg_48_select),
	.data71	(clr_int_reg_49_ext_read_data),
	.sel71	(clr_int_reg_49_select),
	.data72	(clr_int_reg_50_ext_read_data),
	.sel72	(clr_int_reg_50_select),
	.data73	(clr_int_reg_51_ext_read_data),
	.sel73	(clr_int_reg_51_select),
	.data74	(clr_int_reg_52_ext_read_data),
	.sel74	(clr_int_reg_52_select),
	.data75	(clr_int_reg_53_ext_read_data),
	.sel75	(clr_int_reg_53_select),
	.data76	(clr_int_reg_54_ext_read_data),
	.sel76	(clr_int_reg_54_select),
	.data77	(clr_int_reg_55_ext_read_data),
	.sel77	(clr_int_reg_55_select),
	.data78	(clr_int_reg_56_ext_read_data),
	.sel78	(clr_int_reg_56_select),
	.data79	(clr_int_reg_57_ext_read_data),
	.sel79	(clr_int_reg_57_select),
	.data80	(clr_int_reg_58_ext_read_data),
	.sel80	(clr_int_reg_58_select),
	.data81	(clr_int_reg_59_ext_read_data),
	.sel81	(clr_int_reg_59_select),
	.data82	(clr_int_reg_62_ext_read_data),
	.sel82	(clr_int_reg_62_select),
	.data83	(clr_int_reg_63_ext_read_data),
	.sel83	(clr_int_reg_63_select),
	.data84	(interrupt_retry_timer_csrbus_read_data),
	.sel84	(interrupt_retry_timer_select_pulse),
	.data85	(interrupt_state_status_1_ext_read_data),
	.sel85	(interrupt_state_status_1_select),
	.data86	(interrupt_state_status_2_ext_read_data),
	.sel86	(interrupt_state_status_2_select),
	.out	(read_data_0_out)
	);


//====================================================
//     Instantiation of registers
//====================================================

wire interrupt_mapping_20_w_ld =interrupt_mapping_20_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_20 interrupt_mapping_20
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_20_w_ld	(interrupt_mapping_20_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_20_csrbus_read_data	(interrupt_mapping_20_csrbus_read_data),
	.interrupt_mapping_20_mdo_mode_hw_read	(interrupt_mapping_20_mdo_mode_hw_read),
	.interrupt_mapping_20_v_hw_read	(interrupt_mapping_20_v_hw_read),
	.interrupt_mapping_20_t_id_hw_read	(interrupt_mapping_20_t_id_hw_read),
	.interrupt_mapping_20_int_cntrl_num_hw_read	(interrupt_mapping_20_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_21_w_ld =interrupt_mapping_21_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_21 interrupt_mapping_21
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_21_w_ld	(interrupt_mapping_21_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_21_csrbus_read_data	(interrupt_mapping_21_csrbus_read_data),
	.interrupt_mapping_21_mdo_mode_hw_read	(interrupt_mapping_21_mdo_mode_hw_read),
	.interrupt_mapping_21_v_hw_read	(interrupt_mapping_21_v_hw_read),
	.interrupt_mapping_21_t_id_hw_read	(interrupt_mapping_21_t_id_hw_read),
	.interrupt_mapping_21_int_cntrl_num_hw_read	(interrupt_mapping_21_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_22_w_ld =interrupt_mapping_22_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_22 interrupt_mapping_22
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_22_w_ld	(interrupt_mapping_22_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_22_csrbus_read_data	(interrupt_mapping_22_csrbus_read_data),
	.interrupt_mapping_22_mdo_mode_hw_read	(interrupt_mapping_22_mdo_mode_hw_read),
	.interrupt_mapping_22_v_hw_read	(interrupt_mapping_22_v_hw_read),
	.interrupt_mapping_22_t_id_hw_read	(interrupt_mapping_22_t_id_hw_read),
	.interrupt_mapping_22_int_cntrl_num_hw_read	(interrupt_mapping_22_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_23_w_ld =interrupt_mapping_23_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_23 interrupt_mapping_23
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_23_w_ld	(interrupt_mapping_23_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_23_csrbus_read_data	(interrupt_mapping_23_csrbus_read_data),
	.interrupt_mapping_23_mdo_mode_hw_read	(interrupt_mapping_23_mdo_mode_hw_read),
	.interrupt_mapping_23_v_hw_read	(interrupt_mapping_23_v_hw_read),
	.interrupt_mapping_23_t_id_hw_read	(interrupt_mapping_23_t_id_hw_read),
	.interrupt_mapping_23_int_cntrl_num_hw_read	(interrupt_mapping_23_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_24_w_ld =interrupt_mapping_24_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_24 interrupt_mapping_24
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_24_w_ld	(interrupt_mapping_24_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_24_csrbus_read_data	(interrupt_mapping_24_csrbus_read_data),
	.interrupt_mapping_24_mdo_mode_hw_read	(interrupt_mapping_24_mdo_mode_hw_read),
	.interrupt_mapping_24_v_hw_read	(interrupt_mapping_24_v_hw_read),
	.interrupt_mapping_24_t_id_hw_read	(interrupt_mapping_24_t_id_hw_read),
	.interrupt_mapping_24_int_cntrl_num_hw_read	(interrupt_mapping_24_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_25_w_ld =interrupt_mapping_25_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_25 interrupt_mapping_25
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_25_w_ld	(interrupt_mapping_25_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_25_csrbus_read_data	(interrupt_mapping_25_csrbus_read_data),
	.interrupt_mapping_25_mdo_mode_hw_read	(interrupt_mapping_25_mdo_mode_hw_read),
	.interrupt_mapping_25_v_hw_read	(interrupt_mapping_25_v_hw_read),
	.interrupt_mapping_25_t_id_hw_read	(interrupt_mapping_25_t_id_hw_read),
	.interrupt_mapping_25_int_cntrl_num_hw_read	(interrupt_mapping_25_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_26_w_ld =interrupt_mapping_26_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_26 interrupt_mapping_26
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_26_w_ld	(interrupt_mapping_26_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_26_csrbus_read_data	(interrupt_mapping_26_csrbus_read_data),
	.interrupt_mapping_26_mdo_mode_hw_read	(interrupt_mapping_26_mdo_mode_hw_read),
	.interrupt_mapping_26_v_hw_read	(interrupt_mapping_26_v_hw_read),
	.interrupt_mapping_26_t_id_hw_read	(interrupt_mapping_26_t_id_hw_read),
	.interrupt_mapping_26_int_cntrl_num_hw_read	(interrupt_mapping_26_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_27_w_ld =interrupt_mapping_27_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_27 interrupt_mapping_27
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_27_w_ld	(interrupt_mapping_27_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_27_csrbus_read_data	(interrupt_mapping_27_csrbus_read_data),
	.interrupt_mapping_27_mdo_mode_hw_read	(interrupt_mapping_27_mdo_mode_hw_read),
	.interrupt_mapping_27_v_hw_read	(interrupt_mapping_27_v_hw_read),
	.interrupt_mapping_27_t_id_hw_read	(interrupt_mapping_27_t_id_hw_read),
	.interrupt_mapping_27_int_cntrl_num_hw_read	(interrupt_mapping_27_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_28_w_ld =interrupt_mapping_28_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_28 interrupt_mapping_28
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_28_w_ld	(interrupt_mapping_28_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_28_csrbus_read_data	(interrupt_mapping_28_csrbus_read_data),
	.interrupt_mapping_28_mdo_mode_hw_read	(interrupt_mapping_28_mdo_mode_hw_read),
	.interrupt_mapping_28_v_hw_read	(interrupt_mapping_28_v_hw_read),
	.interrupt_mapping_28_t_id_hw_read	(interrupt_mapping_28_t_id_hw_read),
	.interrupt_mapping_28_int_cntrl_num_hw_read	(interrupt_mapping_28_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_29_w_ld =interrupt_mapping_29_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_29 interrupt_mapping_29
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_29_w_ld	(interrupt_mapping_29_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_29_csrbus_read_data	(interrupt_mapping_29_csrbus_read_data),
	.interrupt_mapping_29_mdo_mode_hw_read	(interrupt_mapping_29_mdo_mode_hw_read),
	.interrupt_mapping_29_v_hw_read	(interrupt_mapping_29_v_hw_read),
	.interrupt_mapping_29_t_id_hw_read	(interrupt_mapping_29_t_id_hw_read),
	.interrupt_mapping_29_int_cntrl_num_hw_read	(interrupt_mapping_29_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_30_w_ld =interrupt_mapping_30_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_30 interrupt_mapping_30
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_30_w_ld	(interrupt_mapping_30_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_30_csrbus_read_data	(interrupt_mapping_30_csrbus_read_data),
	.interrupt_mapping_30_mdo_mode_hw_read	(interrupt_mapping_30_mdo_mode_hw_read),
	.interrupt_mapping_30_v_hw_read	(interrupt_mapping_30_v_hw_read),
	.interrupt_mapping_30_t_id_hw_read	(interrupt_mapping_30_t_id_hw_read),
	.interrupt_mapping_30_int_cntrl_num_hw_read	(interrupt_mapping_30_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_31_w_ld =interrupt_mapping_31_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_31 interrupt_mapping_31
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_31_w_ld	(interrupt_mapping_31_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_31_csrbus_read_data	(interrupt_mapping_31_csrbus_read_data),
	.interrupt_mapping_31_mdo_mode_hw_read	(interrupt_mapping_31_mdo_mode_hw_read),
	.interrupt_mapping_31_v_hw_read	(interrupt_mapping_31_v_hw_read),
	.interrupt_mapping_31_t_id_hw_read	(interrupt_mapping_31_t_id_hw_read),
	.interrupt_mapping_31_int_cntrl_num_hw_read	(interrupt_mapping_31_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_32_w_ld =interrupt_mapping_32_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_32 interrupt_mapping_32
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_32_w_ld	(interrupt_mapping_32_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_32_csrbus_read_data	(interrupt_mapping_32_csrbus_read_data),
	.interrupt_mapping_32_mdo_mode_hw_read	(interrupt_mapping_32_mdo_mode_hw_read),
	.interrupt_mapping_32_v_hw_read	(interrupt_mapping_32_v_hw_read),
	.interrupt_mapping_32_t_id_hw_read	(interrupt_mapping_32_t_id_hw_read),
	.interrupt_mapping_32_int_cntrl_num_hw_read	(interrupt_mapping_32_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_33_w_ld =interrupt_mapping_33_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_33 interrupt_mapping_33
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_33_w_ld	(interrupt_mapping_33_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_33_csrbus_read_data	(interrupt_mapping_33_csrbus_read_data),
	.interrupt_mapping_33_mdo_mode_hw_read	(interrupt_mapping_33_mdo_mode_hw_read),
	.interrupt_mapping_33_v_hw_read	(interrupt_mapping_33_v_hw_read),
	.interrupt_mapping_33_t_id_hw_read	(interrupt_mapping_33_t_id_hw_read),
	.interrupt_mapping_33_int_cntrl_num_hw_read	(interrupt_mapping_33_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_34_w_ld =interrupt_mapping_34_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_34 interrupt_mapping_34
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_34_w_ld	(interrupt_mapping_34_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_34_csrbus_read_data	(interrupt_mapping_34_csrbus_read_data),
	.interrupt_mapping_34_mdo_mode_hw_read	(interrupt_mapping_34_mdo_mode_hw_read),
	.interrupt_mapping_34_v_hw_read	(interrupt_mapping_34_v_hw_read),
	.interrupt_mapping_34_t_id_hw_read	(interrupt_mapping_34_t_id_hw_read),
	.interrupt_mapping_34_int_cntrl_num_hw_read	(interrupt_mapping_34_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_35_w_ld =interrupt_mapping_35_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_35 interrupt_mapping_35
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_35_w_ld	(interrupt_mapping_35_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_35_csrbus_read_data	(interrupt_mapping_35_csrbus_read_data),
	.interrupt_mapping_35_mdo_mode_hw_read	(interrupt_mapping_35_mdo_mode_hw_read),
	.interrupt_mapping_35_v_hw_read	(interrupt_mapping_35_v_hw_read),
	.interrupt_mapping_35_t_id_hw_read	(interrupt_mapping_35_t_id_hw_read),
	.interrupt_mapping_35_int_cntrl_num_hw_read	(interrupt_mapping_35_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_36_w_ld =interrupt_mapping_36_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_36 interrupt_mapping_36
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_36_w_ld	(interrupt_mapping_36_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_36_csrbus_read_data	(interrupt_mapping_36_csrbus_read_data),
	.interrupt_mapping_36_mdo_mode_hw_read	(interrupt_mapping_36_mdo_mode_hw_read),
	.interrupt_mapping_36_v_hw_read	(interrupt_mapping_36_v_hw_read),
	.interrupt_mapping_36_t_id_hw_read	(interrupt_mapping_36_t_id_hw_read),
	.interrupt_mapping_36_int_cntrl_num_hw_read	(interrupt_mapping_36_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_37_w_ld =interrupt_mapping_37_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_37 interrupt_mapping_37
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_37_w_ld	(interrupt_mapping_37_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_37_csrbus_read_data	(interrupt_mapping_37_csrbus_read_data),
	.interrupt_mapping_37_mdo_mode_hw_read	(interrupt_mapping_37_mdo_mode_hw_read),
	.interrupt_mapping_37_v_hw_read	(interrupt_mapping_37_v_hw_read),
	.interrupt_mapping_37_t_id_hw_read	(interrupt_mapping_37_t_id_hw_read),
	.interrupt_mapping_37_int_cntrl_num_hw_read	(interrupt_mapping_37_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_38_w_ld =interrupt_mapping_38_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_38 interrupt_mapping_38
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_38_w_ld	(interrupt_mapping_38_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_38_csrbus_read_data	(interrupt_mapping_38_csrbus_read_data),
	.interrupt_mapping_38_mdo_mode_hw_read	(interrupt_mapping_38_mdo_mode_hw_read),
	.interrupt_mapping_38_v_hw_read	(interrupt_mapping_38_v_hw_read),
	.interrupt_mapping_38_t_id_hw_read	(interrupt_mapping_38_t_id_hw_read),
	.interrupt_mapping_38_int_cntrl_num_hw_read	(interrupt_mapping_38_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_39_w_ld =interrupt_mapping_39_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_39 interrupt_mapping_39
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_39_w_ld	(interrupt_mapping_39_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_39_csrbus_read_data	(interrupt_mapping_39_csrbus_read_data),
	.interrupt_mapping_39_mdo_mode_hw_read	(interrupt_mapping_39_mdo_mode_hw_read),
	.interrupt_mapping_39_v_hw_read	(interrupt_mapping_39_v_hw_read),
	.interrupt_mapping_39_t_id_hw_read	(interrupt_mapping_39_t_id_hw_read),
	.interrupt_mapping_39_int_cntrl_num_hw_read	(interrupt_mapping_39_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_40_w_ld =interrupt_mapping_40_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_40 interrupt_mapping_40
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_40_w_ld	(interrupt_mapping_40_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_40_csrbus_read_data	(interrupt_mapping_40_csrbus_read_data),
	.interrupt_mapping_40_mdo_mode_hw_read	(interrupt_mapping_40_mdo_mode_hw_read),
	.interrupt_mapping_40_v_hw_read	(interrupt_mapping_40_v_hw_read),
	.interrupt_mapping_40_t_id_hw_read	(interrupt_mapping_40_t_id_hw_read),
	.interrupt_mapping_40_int_cntrl_num_hw_read	(interrupt_mapping_40_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_41_w_ld =interrupt_mapping_41_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_41 interrupt_mapping_41
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_41_w_ld	(interrupt_mapping_41_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_41_csrbus_read_data	(interrupt_mapping_41_csrbus_read_data),
	.interrupt_mapping_41_mdo_mode_hw_read	(interrupt_mapping_41_mdo_mode_hw_read),
	.interrupt_mapping_41_v_hw_read	(interrupt_mapping_41_v_hw_read),
	.interrupt_mapping_41_t_id_hw_read	(interrupt_mapping_41_t_id_hw_read),
	.interrupt_mapping_41_int_cntrl_num_hw_read	(interrupt_mapping_41_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_42_w_ld =interrupt_mapping_42_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_42 interrupt_mapping_42
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_42_w_ld	(interrupt_mapping_42_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_42_csrbus_read_data	(interrupt_mapping_42_csrbus_read_data),
	.interrupt_mapping_42_mdo_mode_hw_read	(interrupt_mapping_42_mdo_mode_hw_read),
	.interrupt_mapping_42_v_hw_read	(interrupt_mapping_42_v_hw_read),
	.interrupt_mapping_42_t_id_hw_read	(interrupt_mapping_42_t_id_hw_read),
	.interrupt_mapping_42_int_cntrl_num_hw_read	(interrupt_mapping_42_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_43_w_ld =interrupt_mapping_43_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_43 interrupt_mapping_43
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_43_w_ld	(interrupt_mapping_43_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_43_csrbus_read_data	(interrupt_mapping_43_csrbus_read_data),
	.interrupt_mapping_43_mdo_mode_hw_read	(interrupt_mapping_43_mdo_mode_hw_read),
	.interrupt_mapping_43_v_hw_read	(interrupt_mapping_43_v_hw_read),
	.interrupt_mapping_43_t_id_hw_read	(interrupt_mapping_43_t_id_hw_read),
	.interrupt_mapping_43_int_cntrl_num_hw_read	(interrupt_mapping_43_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_44_w_ld =interrupt_mapping_44_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_44 interrupt_mapping_44
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_44_w_ld	(interrupt_mapping_44_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_44_csrbus_read_data	(interrupt_mapping_44_csrbus_read_data),
	.interrupt_mapping_44_mdo_mode_hw_read	(interrupt_mapping_44_mdo_mode_hw_read),
	.interrupt_mapping_44_v_hw_read	(interrupt_mapping_44_v_hw_read),
	.interrupt_mapping_44_t_id_hw_read	(interrupt_mapping_44_t_id_hw_read),
	.interrupt_mapping_44_int_cntrl_num_hw_read	(interrupt_mapping_44_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_45_w_ld =interrupt_mapping_45_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_45 interrupt_mapping_45
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_45_w_ld	(interrupt_mapping_45_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_45_csrbus_read_data	(interrupt_mapping_45_csrbus_read_data),
	.interrupt_mapping_45_mdo_mode_hw_read	(interrupt_mapping_45_mdo_mode_hw_read),
	.interrupt_mapping_45_v_hw_read	(interrupt_mapping_45_v_hw_read),
	.interrupt_mapping_45_t_id_hw_read	(interrupt_mapping_45_t_id_hw_read),
	.interrupt_mapping_45_int_cntrl_num_hw_read	(interrupt_mapping_45_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_46_w_ld =interrupt_mapping_46_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_46 interrupt_mapping_46
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_46_w_ld	(interrupt_mapping_46_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_46_csrbus_read_data	(interrupt_mapping_46_csrbus_read_data),
	.interrupt_mapping_46_mdo_mode_hw_read	(interrupt_mapping_46_mdo_mode_hw_read),
	.interrupt_mapping_46_v_hw_read	(interrupt_mapping_46_v_hw_read),
	.interrupt_mapping_46_t_id_hw_read	(interrupt_mapping_46_t_id_hw_read),
	.interrupt_mapping_46_int_cntrl_num_hw_read	(interrupt_mapping_46_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_47_w_ld =interrupt_mapping_47_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_47 interrupt_mapping_47
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_47_w_ld	(interrupt_mapping_47_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_47_csrbus_read_data	(interrupt_mapping_47_csrbus_read_data),
	.interrupt_mapping_47_mdo_mode_hw_read	(interrupt_mapping_47_mdo_mode_hw_read),
	.interrupt_mapping_47_v_hw_read	(interrupt_mapping_47_v_hw_read),
	.interrupt_mapping_47_t_id_hw_read	(interrupt_mapping_47_t_id_hw_read),
	.interrupt_mapping_47_int_cntrl_num_hw_read	(interrupt_mapping_47_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_48_w_ld =interrupt_mapping_48_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_48 interrupt_mapping_48
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_48_w_ld	(interrupt_mapping_48_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_48_csrbus_read_data	(interrupt_mapping_48_csrbus_read_data),
	.interrupt_mapping_48_mdo_mode_hw_read	(interrupt_mapping_48_mdo_mode_hw_read),
	.interrupt_mapping_48_v_hw_read	(interrupt_mapping_48_v_hw_read),
	.interrupt_mapping_48_t_id_hw_read	(interrupt_mapping_48_t_id_hw_read),
	.interrupt_mapping_48_int_cntrl_num_hw_read	(interrupt_mapping_48_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_49_w_ld =interrupt_mapping_49_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_49 interrupt_mapping_49
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_49_w_ld	(interrupt_mapping_49_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_49_csrbus_read_data	(interrupt_mapping_49_csrbus_read_data),
	.interrupt_mapping_49_mdo_mode_hw_read	(interrupt_mapping_49_mdo_mode_hw_read),
	.interrupt_mapping_49_v_hw_read	(interrupt_mapping_49_v_hw_read),
	.interrupt_mapping_49_t_id_hw_read	(interrupt_mapping_49_t_id_hw_read),
	.interrupt_mapping_49_int_cntrl_num_hw_read	(interrupt_mapping_49_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_50_w_ld =interrupt_mapping_50_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_50 interrupt_mapping_50
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_50_w_ld	(interrupt_mapping_50_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_50_csrbus_read_data	(interrupt_mapping_50_csrbus_read_data),
	.interrupt_mapping_50_mdo_mode_hw_read	(interrupt_mapping_50_mdo_mode_hw_read),
	.interrupt_mapping_50_v_hw_read	(interrupt_mapping_50_v_hw_read),
	.interrupt_mapping_50_t_id_hw_read	(interrupt_mapping_50_t_id_hw_read),
	.interrupt_mapping_50_int_cntrl_num_hw_read	(interrupt_mapping_50_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_51_w_ld =interrupt_mapping_51_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_51 interrupt_mapping_51
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_51_w_ld	(interrupt_mapping_51_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_51_csrbus_read_data	(interrupt_mapping_51_csrbus_read_data),
	.interrupt_mapping_51_mdo_mode_hw_read	(interrupt_mapping_51_mdo_mode_hw_read),
	.interrupt_mapping_51_v_hw_read	(interrupt_mapping_51_v_hw_read),
	.interrupt_mapping_51_t_id_hw_read	(interrupt_mapping_51_t_id_hw_read),
	.interrupt_mapping_51_int_cntrl_num_hw_read	(interrupt_mapping_51_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_52_w_ld =interrupt_mapping_52_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_52 interrupt_mapping_52
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_52_w_ld	(interrupt_mapping_52_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_52_csrbus_read_data	(interrupt_mapping_52_csrbus_read_data),
	.interrupt_mapping_52_mdo_mode_hw_read	(interrupt_mapping_52_mdo_mode_hw_read),
	.interrupt_mapping_52_v_hw_read	(interrupt_mapping_52_v_hw_read),
	.interrupt_mapping_52_t_id_hw_read	(interrupt_mapping_52_t_id_hw_read),
	.interrupt_mapping_52_int_cntrl_num_hw_read	(interrupt_mapping_52_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_53_w_ld =interrupt_mapping_53_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_53 interrupt_mapping_53
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_53_w_ld	(interrupt_mapping_53_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_53_csrbus_read_data	(interrupt_mapping_53_csrbus_read_data),
	.interrupt_mapping_53_mdo_mode_hw_read	(interrupt_mapping_53_mdo_mode_hw_read),
	.interrupt_mapping_53_v_hw_read	(interrupt_mapping_53_v_hw_read),
	.interrupt_mapping_53_t_id_hw_read	(interrupt_mapping_53_t_id_hw_read),
	.interrupt_mapping_53_int_cntrl_num_hw_read	(interrupt_mapping_53_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_54_w_ld =interrupt_mapping_54_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_54 interrupt_mapping_54
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_54_w_ld	(interrupt_mapping_54_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_54_csrbus_read_data	(interrupt_mapping_54_csrbus_read_data),
	.interrupt_mapping_54_mdo_mode_hw_read	(interrupt_mapping_54_mdo_mode_hw_read),
	.interrupt_mapping_54_v_hw_read	(interrupt_mapping_54_v_hw_read),
	.interrupt_mapping_54_t_id_hw_read	(interrupt_mapping_54_t_id_hw_read),
	.interrupt_mapping_54_int_cntrl_num_hw_read	(interrupt_mapping_54_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_55_w_ld =interrupt_mapping_55_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_55 interrupt_mapping_55
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_55_w_ld	(interrupt_mapping_55_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_55_csrbus_read_data	(interrupt_mapping_55_csrbus_read_data),
	.interrupt_mapping_55_mdo_mode_hw_read	(interrupt_mapping_55_mdo_mode_hw_read),
	.interrupt_mapping_55_v_hw_read	(interrupt_mapping_55_v_hw_read),
	.interrupt_mapping_55_t_id_hw_read	(interrupt_mapping_55_t_id_hw_read),
	.interrupt_mapping_55_int_cntrl_num_hw_read	(interrupt_mapping_55_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_56_w_ld =interrupt_mapping_56_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_56 interrupt_mapping_56
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_56_w_ld	(interrupt_mapping_56_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_56_csrbus_read_data	(interrupt_mapping_56_csrbus_read_data),
	.interrupt_mapping_56_mdo_mode_hw_read	(interrupt_mapping_56_mdo_mode_hw_read),
	.interrupt_mapping_56_v_hw_read	(interrupt_mapping_56_v_hw_read),
	.interrupt_mapping_56_t_id_hw_read	(interrupt_mapping_56_t_id_hw_read),
	.interrupt_mapping_56_int_cntrl_num_hw_read	(interrupt_mapping_56_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_57_w_ld =interrupt_mapping_57_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_57 interrupt_mapping_57
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_57_w_ld	(interrupt_mapping_57_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_57_csrbus_read_data	(interrupt_mapping_57_csrbus_read_data),
	.interrupt_mapping_57_mdo_mode_hw_read	(interrupt_mapping_57_mdo_mode_hw_read),
	.interrupt_mapping_57_v_hw_read	(interrupt_mapping_57_v_hw_read),
	.interrupt_mapping_57_t_id_hw_read	(interrupt_mapping_57_t_id_hw_read),
	.interrupt_mapping_57_int_cntrl_num_hw_read	(interrupt_mapping_57_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_58_w_ld =interrupt_mapping_58_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_58 interrupt_mapping_58
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_58_w_ld	(interrupt_mapping_58_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_58_csrbus_read_data	(interrupt_mapping_58_csrbus_read_data),
	.interrupt_mapping_58_mdo_mode_hw_read	(interrupt_mapping_58_mdo_mode_hw_read),
	.interrupt_mapping_58_v_hw_read	(interrupt_mapping_58_v_hw_read),
	.interrupt_mapping_58_t_id_hw_read	(interrupt_mapping_58_t_id_hw_read),
	.interrupt_mapping_58_int_cntrl_num_hw_read	(interrupt_mapping_58_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_59_w_ld =interrupt_mapping_59_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_59 interrupt_mapping_59
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_59_w_ld	(interrupt_mapping_59_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_59_csrbus_read_data	(interrupt_mapping_59_csrbus_read_data),
	.interrupt_mapping_59_mdo_mode_hw_read	(interrupt_mapping_59_mdo_mode_hw_read),
	.interrupt_mapping_59_v_hw_read	(interrupt_mapping_59_v_hw_read),
	.interrupt_mapping_59_t_id_hw_read	(interrupt_mapping_59_t_id_hw_read),
	.interrupt_mapping_59_int_cntrl_num_hw_read	(interrupt_mapping_59_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_62_w_ld =interrupt_mapping_62_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_62 interrupt_mapping_62
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_62_w_ld	(interrupt_mapping_62_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_62_csrbus_read_data	(interrupt_mapping_62_csrbus_read_data),
	.interrupt_mapping_62_mdo_mode_hw_read	(interrupt_mapping_62_mdo_mode_hw_read),
	.interrupt_mapping_62_v_hw_read	(interrupt_mapping_62_v_hw_read),
	.interrupt_mapping_62_t_id_hw_read	(interrupt_mapping_62_t_id_hw_read),
	.interrupt_mapping_62_int_cntrl_num_hw_read	(interrupt_mapping_62_int_cntrl_num_hw_read)
	);

wire interrupt_mapping_63_w_ld =interrupt_mapping_63_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_mapping_63 interrupt_mapping_63
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_mapping_63_w_ld	(interrupt_mapping_63_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_mapping_63_csrbus_read_data	(interrupt_mapping_63_csrbus_read_data),
	.interrupt_mapping_63_mdo_mode_hw_read	(interrupt_mapping_63_mdo_mode_hw_read),
	.interrupt_mapping_63_v_hw_read	(interrupt_mapping_63_v_hw_read),
	.interrupt_mapping_63_t_id_hw_read	(interrupt_mapping_63_t_id_hw_read),
	.interrupt_mapping_63_int_cntrl_num_hw_read	(interrupt_mapping_63_int_cntrl_num_hw_read)
	);

wire interrupt_retry_timer_w_ld =interrupt_retry_timer_select_pulse & daemon_csrbus_wr;

dmu_imu_iss_csr_interrupt_retry_timer interrupt_retry_timer
	(
	.clk	(clk),
	.rst_l	(rst_l),
	.interrupt_retry_timer_w_ld	(interrupt_retry_timer_w_ld),
	.csrbus_wr_data	(daemon_csrbus_wr_data),
	.interrupt_retry_timer_csrbus_read_data	(interrupt_retry_timer_csrbus_read_data),
	.interrupt_retry_timer_limit_hw_read	(interrupt_retry_timer_limit_hw_read)
	);

endmodule // dmu_imu_iss_default_grp
