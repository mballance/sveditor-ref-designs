/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: enable_file.h
* Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
* 4150 Network Circle, Santa Clara, California 95054, U.S.A.
*
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; version 2 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*
* For the avoidance of doubt, and except that if any non-GPL license 
* choice is available it will apply instead, Sun elects to use only 
* the General Public License version 2 (GPLv2) at this time for any 
* software where a choice of GPL license versions is made 
* available with the language indicating that GPLv2 or any later version 
* may be used, or where a choice of which version of the GPL is applied is 
* otherwise unspecified. 
*
* Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
* CA 95054 USA or visit www.sun.com if you need additional information or 
* have any questions. 
*
* 
* ========== Copyright Header End ============================================
*/
#define POWERON_RESET_ENABLE 0x1
#define WATCHDOG_RESET_ENABLE 0x1
#define EXTERNAL_RESET_ENABLE 0x1
#define SOFTWARE_RESET_ENABLE 0x1
#define REDMODE_ENABLE 0x1
#define RESERVED0_ENABLE 0x1
#define RESERVED1_ENABLE 0x1
#define INSTRUCTION_ACCESS_EXCEPTION_ENABLE 0x1
#define IA_MMU_MISS_ENABLE 0x1
#define INSTRUCTION_ACCESS_ERROR_ENABLE 0x1
#define RESERVED2_ENABLE 0x1
#define RESERVED3_ENABLE 0x1
#define RESERVED4_ENABLE 0x1
#define RESERVED5_ENABLE 0x1
#define RESERVED6_ENABLE 0x1
#define		ENABLE_T0_Reserved_0x01	
#define		ENABLE_HT0_Reserved_0x01	
#define		ENABLE_T0_Reserved_0x02
#define		ENABLE_HT0_Watchdog_Reset_0x02
#define		ENABLE_T0_Reserved_0x03
#define		ENABLE_HT0_Reserved_0x03
#define		ENABLE_T0_Reserved_0x04
#define		ENABLE_HT0_Reserved_0x04
#define		ENABLE_T0_Reserved_0x05
#define		ENABLE_HT0_Reserved_0x05
#define		ENABLE_T0_Reserved_0x06
#define		ENABLE_HT0_Reserved_0x06
#define		ENABLE_T0_Reserved_0x07
#define		ENABLE_HT0_Store_Error_0x07
#define		ENABLE_T0_Instruction_access_exception_0x08
#define		ENABLE_HT0_IAE_privilege_violation_0x08
#define		ENABLE_T0_Instruction_Access_MMU_Miss_0x09
#define		ENABLE_HT0_Instruction_Access_MMU_Miss_0x09
#define		ENABLE_T0_Instruction_access_error_0x0a
#define		ENABLE_HT0_Instruction_access_error_0x0a
#define		ENABLE_T0_Reserved_0x0b
#define		ENABLE_HT0_IAE_unauth_access_0x0b
#define		ENABLE_T0_Reserved_0x0c
#define		ENABLE_HT0_IAE_nfo_page_0x0c
#define		ENABLE_T0_Reserved_0x0d
#define		ENABLE_HT0_Instruction_access_range_0x0d
#define		ENABLE_T0_Reserved_0x0e
#define		ENABLE_HT0_Reserved_0x0e
#define		ENABLE_T0_Reserved_0x0f
#define		ENABLE_HT0_Reserved_0x0f
#define		ENABLE_T0_Illegal_instruction_0x10
#define		ENABLE_HT0_Illegal_instruction_0x10
#define		ENABLE_T0_Privileged_opcode_0x11
#define		ENABLE_HT0_Privileged_opcode_0x11
#define		ENABLE_T0_Unimplemented_LDD_0x12
#define		ENABLE_HT0_Unimplemented_LDD_0x12
#define		ENABLE_T0_Unimplemented_STD_0x13
#define		ENABLE_HT0_Unimplemented_STD_0x13
#define		ENABLE_T0_Reserved_0x14
#define		ENABLE_HT0_DAE_invalid_asi_0x14
#define		ENABLE_T0_Reserved_0x15
#define		ENABLE_HT0_DAE_privilege_violation_0x15
#define		ENABLE_T0_Reserved_0x16
#define		ENABLE_HT0_DAE_nc_page_0x16
#define		ENABLE_T0_Reserved_0x17
#define		ENABLE_HT0_DAE_nfo_page_0x17
#define		ENABLE_T0_Reserved_0x18
#define		ENABLE_HT0_Reserved_0x18
#define		ENABLE_T0_Reserved_0x19
#define		ENABLE_HT0_Reserved_0x19
#define		ENABLE_T0_Reserved_0x1a
#define		ENABLE_HT0_Reserved_0x1a
#define		ENABLE_T0_Reserved_0x1b
#define		ENABLE_HT0_Reserved_0x1b
#define		ENABLE_T0_Reserved_0x1c
#define		ENABLE_HT0_Reserved_0x1c
#define		ENABLE_T0_Reserved_0x1d
#define		ENABLE_HT0_Reserved_0x1d
#define		ENABLE_T0_Reserved_0x1e
#define		ENABLE_HT0_Reserved_0x1e
#define		ENABLE_T0_Reserved_0x1f
#define		ENABLE_HT0_Reserved_0x1f
#define		ENABLE_T0_Fp_disabled_0x20
#define		ENABLE_HT0_Fp_disabled_0x20
#define		ENABLE_T0_Fp_exception_ieee_754_0x21
#define		ENABLE_HT0_Fp_exception_ieee_754_0x21
#define		ENABLE_T0_Fp_exception_other_0x22
#define		ENABLE_HT0_Fp_exception_other_0x22
#define		ENABLE_T0_Tag_Overflow_0x23
#define		ENABLE_HT0_Tag_Overflow_0x23
#define		ENABLE_T0_Clean_Window_0x24
#define		ENABLE_HT0_Clean_Window_0x24
#define			ENABLE_T0_Division_By_Zero_0x28
#define			ENABLE_HT0_Division_By_Zero_0x28
#define		ENABLE_T0_Reserved_0x29
#define		ENABLE_HT0_Reserved_0x29
#define		ENABLE_T0_Reserved_0x2a
#define		ENABLE_HT0_Instruction_Invalid_TSB_Entry_0x2a
#define		ENABLE_T0_Reserved_0x2b
#define		ENABLE_HT0_Data_Invalid_TSB_Entry_0x2b
#define		ENABLE_T0_Reserved_0x2c
#define		ENABLE_HT0_Reserved_0x2c
#define		ENABLE_T0_Reserved_0x2d
#define		ENABLE_HT0_Reserved_0x2d
#define		ENABLE_T0_Reserved_0x2e
#define		ENABLE_HT0_mem_address_range_0x2e
#define		ENABLE_T0_Reserved_0x2f
#define		ENABLE_HT0_Reserved_0x2f
#define		ENABLE_T0_Data_Access_Exception_0x30
#define		ENABLE_HT0_DAE_so_page_0x30
#define		ENABLE_T0_Reserved_0x31
#define		ENABLE_HT0_Reserved_0x31
#define		ENABLE_T0_Data_access_error_0x32
#define		ENABLE_HT0_Data_access_error_0x32
#define		ENABLE_T0_Reserved_0x33
#define		ENABLE_HT0_Reserved_0x33
#define		ENABLE_T0_Mem_Address_Not_Aligned_0x34
#define		ENABLE_HT0_Mem_Address_Not_Aligned_0x34
#define		ENABLE_T0_Lddf_Mem_Address_Not_Aligned_0x35
#define		ENABLE_HT0_Lddf_Mem_Address_Not_Aligned_0x35
#define		ENABLE_T0_Stdf_Mem_Address_Not_Aligned_0x36
#define		ENABLE_HT0_Stdf_Mem_Address_Not_Aligned_0x36
#define		ENABLE_T0_Privileged_Action_0x37
#define		ENABLE_HT0_Privileged_Action_0x37
#define		ENABLE_T0_Reserved_0x38
#define		ENABLE_HT0_Reserved_0x38
#define		ENABLE_T0_Reserved_0x39
#define		ENABLE_HT0_Reserved_0x39
#define		ENABLE_T0_Reserved_0x3a
#define		ENABLE_HT0_Reserved_0x3a
#define		ENABLE_T0_Reserved_0x3b
#define		ENABLE_HT0_Reserved_0x3b
#define		ENABLE_T0_Reserved_0x3c
#define		ENABLE_HT0_Control_Word_Queue_Interrupt_0x3c
#define		ENABLE_T0_Reserved_0x3d
#define		ENABLE_HT0_Modular_Arithmetic_Interrupt_0x3d
#define		ENABLE_T0_Reserved_0x3e
#define		ENABLE_HT0_Reserved_0x3e
#define		ENABLE_T0_Reserved_0x3f
#define		ENABLE_HT0_Reserved_0x3f
#define		ENABLE_T0_Reserved_0x40
#define		ENABLE_HT0_Sw_Recoverable_Error_0x40
#define		ENABLE_T0_Interrupt_Level_1_0x41
#define		ENABLE_HT0_Interrupt_Level_1_0x41
#define		ENABLE_T0_Interrupt_Level_2_0x42
#define		ENABLE_HT0_Interrupt_Level_2_0x42
#define		ENABLE_T0_Interrupt_Level_3_0x43
#define		ENABLE_HT0_Interrupt_Level_3_0x43
#define		ENABLE_T0_Interrupt_Level_4_0x44
#define		ENABLE_HT0_Interrupt_Level_4_0x44
#define		ENABLE_T0_Interrupt_Level_5_0x45
#define		ENABLE_HT0_Interrupt_Level_5_0x45
#define		ENABLE_T0_Interrupt_Level_6_0x46
#define		ENABLE_HT0_Interrupt_Level_6_0x46
#define		ENABLE_T0_Interrupt_Level_7_0x47
#define		ENABLE_HT0_Interrupt_Level_7_0x47
#define		ENABLE_T0_Interrupt_Level_8_0x48
#define		ENABLE_HT0_Interrupt_Level_8_0x48
#define		ENABLE_T0_Interrupt_Level_9_0x49
#define		ENABLE_HT0_Interrupt_Level_9_0x49
#define		ENABLE_T0_Interrupt_Level_10_0x4a
#define		ENABLE_HT0_Interrupt_Level_10_0x4a
#define		ENABLE_T0_Interrupt_Level_11_0x4b
#define		ENABLE_HT0_Interrupt_Level_11_0x4b
#define		ENABLE_T0_Interrupt_Level_12_0x4c
#define		ENABLE_HT0_Interrupt_Level_12_0x4c
#define		ENABLE_T0_Interrupt_Level_13_0x4d
#define		ENABLE_HT0_Interrupt_Level_13_0x4d
#define		ENABLE_T0_Interrupt_Level_14_0x4e
#define		ENABLE_HT0_Interrupt_Level_14_0x4e
#define		ENABLE_T0_Interrupt_Level_15_0x4f
#define		ENABLE_HT0_Interrupt_Level_15_0x4f
#define		ENABLE_T0_Reserved_0x50
#define		ENABLE_HT0_Reserved_0x50
#define		ENABLE_T0_Reserved_0x51
#define		ENABLE_HT0_Reserved_0x51
#define		ENABLE_T0_Reserved_0x52
#define		ENABLE_HT0_Reserved_0x52
#define		ENABLE_T0_Reserved_0x53
#define		ENABLE_HT0_Reserved_0x53
#define		ENABLE_T0_Reserved_0x54
#define		ENABLE_HT0_Reserved_0x54
#define		ENABLE_T0_Reserved_0x55
#define		ENABLE_HT0_Reserved_0x55
#define		ENABLE_T0_Reserved_0x56
#define		ENABLE_HT0_Reserved_0x56
#define		ENABLE_T0_Reserved_0x57
#define		ENABLE_HT0_Reserved_0x57
#define		ENABLE_T0_Reserved_0x58
#define		ENABLE_HT0_Reserved_0x58
#define		ENABLE_T0_Reserved_0x59
#define		ENABLE_HT0_Reserved_0x59
#define		ENABLE_T0_Reserved_0x5a
#define		ENABLE_HT0_Reserved_0x5a
#define		ENABLE_T0_Reserved_0x5b
#define		ENABLE_HT0_Reserved_0x5b
#define		ENABLE_T0_Reserved_0x5c
#define		ENABLE_HT0_Reserved_0x5c
#define		ENABLE_T0_Reserved_0x5d
#define		ENABLE_HT0_Reserved_0x5d
#define		ENABLE_T0_Reserved_0x5e
#define		ENABLE_HT0_Hstick_Match_0x5e
#define		ENABLE_T0_Reserved_0x5f
#define		ENABLE_HT0_Trap_Level_Zero_0x5f
#define		ENABLE_T0_Interrupt_0x60
#define		ENABLE_HT0_Interrupt_0x60
#define		ENABLE_T0_Reserved_0x61
#define		ENABLE_HT0_PA_Watchpoint_0x61
#define		ENABLE_T0_VA_Watchpoint_0x62
#define		ENABLE_HT0_VA_Watchpoint_0x62
#define		ENABLE_T0_fast_instr_access_MMU_miss_0x64
#define		ENABLE_HT0_fast_instr_access_MMU_miss_0x64
#define		ENABLE_T0_fast_data_access_MMU_miss_0x68
#define		ENABLE_HT0_fast_data_access_MMU_miss_0x68
#define		ENABLE_T0_data_access_protection_0x6c
#define		ENABLE_HT0_data_access_protection_0x6c
#define		ENABLE_T0_Window_Spill_0_Normal_0x80
#define		ENABLE_HT0_Window_Spill_0_Normal_0x80
#define		ENABLE_T0_Window_Spill_1_Normal_0x84
#define		ENABLE_HT0_Window_Spill_1_Normal_0x84
#define		ENABLE_T0_Window_Spill_2_Normal_0x88
#define		ENABLE_HT0_Window_Spill_2_Normal_0x88
#define		ENABLE_T0_Window_Spill_3_Normal_0x8c
#define		ENABLE_HT0_Window_Spill_3_Normal_0x8c
#define		ENABLE_T0_Window_Spill_4_Normal_0x90	
#define		ENABLE_HT0_Window_Spill_4_Normal_0x90	
#define		ENABLE_T0_Window_Spill_5_Normal_0x94	
#define		ENABLE_HT0_Window_Spill_5_Normal_0x94	
#define		ENABLE_T0_Window_Spill_6_Normal_0x98
#define		ENABLE_HT0_Window_Spill_6_Normal_0x98
#define		ENABLE_T0_Window_Spill_7_Normal_0x9c
#define		ENABLE_HT0_Window_Spill_7_Normal_0x9c
#define		ENABLE_T0_Window_Spill_0_Other_0xa0
#define		ENABLE_HT0_Window_Spill_0_Other_0xa0
#define		ENABLE_T0_Window_Spill_1_Other_0xa4
#define		ENABLE_HT0_Window_Spill_1_Other_0xa4
#define		ENABLE_T0_Window_Spill_2_Other_0xa8
#define		ENABLE_HT0_Window_Spill_2_Other_0xa8
#define		ENABLE_T0_Window_Spill_3_Other_0xac
#define		ENABLE_HT0_Window_Spill_3_Other_0xac
#define		ENABLE_T0_Window_Spill_4_Other_0xb0
#define		ENABLE_HT0_Window_Spill_4_Other_0xb0
#define		ENABLE_T0_Window_Spill_5_Other_0xb4
#define		ENABLE_HT0_Window_Spill_5_Other_0xb4
#define		ENABLE_T0_Window_Spill_6_Other_0xb8
#define		ENABLE_HT0_Window_Spill_6_Other_0xb8
#define		ENABLE_T0_Window_Spill_7_Other_0xbc
#define		ENABLE_HT0_Window_Spill_7_Other_0xbc
#define		ENABLE_T0_Window_Fill_0_Normal_0xc0
#define		ENABLE_HT0_Window_Fill_0_Normal_0xc0
#define		ENABLE_T0_Window_Fill_1_Normal_0xc4
#define		ENABLE_HT0_Window_Fill_1_Normal_0xc4
#define		ENABLE_T0_Window_Fill_2_Normal_0xc8
#define		ENABLE_HT0_Window_Fill_2_Normal_0xc8
#define		ENABLE_T0_Window_Fill_3_Normal_0xcc
#define		ENABLE_HT0_Window_Fill_3_Normal_0xcc
#define		ENABLE_T0_Window_Fill_4_Normal_0xd0
#define		ENABLE_HT0_Window_Fill_4_Normal_0xd0
#define		ENABLE_T0_Window_Fill_5_Normal_0xd4
#define		ENABLE_HT0_Window_Fill_5_Normal_0xd4
#define		ENABLE_T0_Window_Fill_6_Normal_0xd8
#define		ENABLE_HT0_Window_Fill_6_Normal_0xd8
#define		ENABLE_T0_Window_Fill_7_Normal_0xdc
#define		ENABLE_HT0_Window_Fill_7_Normal_0xdc
#define		ENABLE_T0_Window_Fill_0_Other_0xe0
#define		ENABLE_HT0_Window_Fill_0_Other_0xe0
#define		ENABLE_T0_Window_Fill_1_Other_0xe4
#define		ENABLE_HT0_Window_Fill_1_Other_0xe4
#define		ENABLE_T0_Window_Fill_2_Other_0xe8
#define		ENABLE_HT0_Window_Fill_2_Other_0xe8
#define		ENABLE_T0_Window_Fill_3_Other_0xec
#define		ENABLE_HT0_Window_Fill_3_Other_0xec
#define		ENABLE_T0_Window_Fill_4_Other_0xf0
#define		ENABLE_HT0_Window_Fill_4_Other_0xf0
#define		ENABLE_T0_Window_Fill_5_Other_0xf4
#define		ENABLE_HT0_Window_Fill_5_Other_0xf4
#define		ENABLE_T0_Window_Fill_6_Other_0xf8
#define		ENABLE_HT0_Window_Fill_6_Other_0xf8
#define		ENABLE_T0_Window_Fill_7_Other_0xfc
#define		ENABLE_HT0_Window_Fill_7_Other_0xfc
#define PRIVILEGED_OPCODE_ENABLE 0x1
#define UNIMPLEMENTED_LDD_ENABLE 0x1
#define UNIMPLEMENTED_STD_ENABLE 0x1
#define RESERVED7_ENABLE 0x1
#define RESERVED8_ENABLE 0x1
#define RESERVED9_ENABLE 0x1
#define RESERVED10_ENABLE 0x1
#define RESERVED11_ENABLE 0x1
#define RESERVED12_ENABLE 0x1
#define RESERVED13_ENABLE 0x1
#define RESERVED14_ENABLE 0x1
#define RESERVED15_ENABLE 0x1
#define RESERVED16_ENABLE 0x1
#define RESERVED17_ENABLE 0x1
#define RESERVED18_ENABLE 0x1
#define FP_DISABLED_ENABLE 0x1
#define FP_IEEE_754_ENABLE 0x1
#define FP_EXCP_OTHER_ENABLE 0x1
#define TAG_OVERFLOW_ENABLE 0x1
#define CLEAN_WIN_ENABLE 0x1
#define DIV_ZERO_ENABLE 0x1
#define INT_PROC_ERROR_ENABLE 0x1
#define RESERVED19_ENABLE 0x1
#define RESERVED20_ENABLE 0x1
#define RESERVED21_ENABLE 0x1
#define RESERVED22_ENABLE 0x1
#define RESERVED23_ENABLE 0x1
#define RESERVED24_ENABLE 0x1
#define DATA_ACCESS_EXCEPTION_ENABLE 0x1
#define DA_MMU_MISS_ENABLE 0x1
#define DATA_ACCESS_ERROR_ENABLE 0x1
#define DATA_PROT_ENABLE 0x1
#define MEM_NONALIGNED_ENABLE 0x1
#define LDDF_MEM_NONALIGNED_ENABLE 0x1
#define STDF_MEM_NONALIGNED_ENABLE 0x1
#define PRIVILEGED_ACTION_ENABLE 0x1
#define LDQF_MEM_NONALIGNED_ENABLE 0x1
#define STQF_MEM_NONALIGNED_ENABLE 0x1
#define RESERVED25_ENABLE 0x1
#define RESERVED26_ENABLE 0x1
#define RESERVED27_ENABLE 0x1
#define RESERVED28_ENABLE 0x1
#define RESERVED29_ENABLE 0x1
#define RESERVED30_ENABLE 0x1
#define ASYNC_DATA_ERROR_ENABLE 0x1
#define INTERRUPT_LEVEL_1_ENABLE 0x1
#define INTERRUPT_LEVEL_2_ENABLE 0x1
#define INTERRUPT_LEVEL_3_ENABLE 0x1
#define INTERRUPT_LEVEL_4_ENABLE 0x1
#define INTERRUPT_LEVEL_5_ENABLE 0x1
#define INTERRUPT_LEVEL_6_ENABLE 0x1
#define INTERRUPT_LEVEL_7_ENABLE 0x1
#define INTERRUPT_LEVEL_8_ENABLE 0x1
#define INTERRUPT_LEVEL_9_ENABLE 0x1
#define INTERRUPT_LEVEL_10_ENABLE 0x1
#define INTERRUPT_LEVEL_11_ENABLE 0x1
#define INTERRUPT_LEVEL_12_ENABLE 0x1
#define INTERRUPT_LEVEL_13_ENABLE 0x1
#define INTERRUPT_LEVEL_14_ENABLE 0x1
#define INTERRUPT_LEVEL_15_ENABLE 0x1
#define RESERVED31_ENABLE 0x1
#define RESERVED32_ENABLE 0x1
#define RESERVED33_ENABLE 0x1
#define RESERVED34_ENABLE 0x1
#define RESERVED35_ENABLE 0x1
#define RESERVED36_ENABLE 0x1
#define RESERVED37_ENABLE 0x1
#define RESERVED38_ENABLE 0x1
#define RESERVED39_ENABLE 0x1
#define RESERVED40_ENABLE 0x1
#define RESERVED41_ENABLE 0x1
#define RESERVED42_ENABLE 0x1
#define RESERVED43_ENABLE 0x1
#define RESERVED44_ENABLE 0x1
#define RESERVED45_ENABLE 0x1
#define RESERVED46_ENABLE 0x1
#define IMPL_DEP_XCPN_0_ENABLE 0x1
#define PA_WATCHPOINT_ENABLE 0x1
#define VA_WATCHPOINT_ENABLE 0x1
#define IA_FAST_MMU_MISS_ENABLE 0x1
#define DA_FAST_MMU_MISS_ENABLE 0x1
#define FAST_DATA_PROT_ENABLE 0x1
#define SPILL_0_NORMAL_ENABLE 0x1
#define SPILL_1_NORMAL_ENABLE 0x1
#define SPILL_2_NORMAL_ENABLE 0x1
#define SPILL_3_NORMAL_ENABLE 0x1
#define SPILL_4_NORMAL_ENABLE 0x1
#define SPILL_5_NORMAL_ENABLE 0x1
#define SPILL_6_NORMAL_ENABLE 0x1
#define SPILL_7_NORMAL_ENABLE 0x1
#define SPILL_0_OTHER_ENABLE 0x1
#define SPILL_1_OTHER_ENABLE 0x1
#define SPILL_2_OTHER_ENABLE 0x1
#define SPILL_3_OTHER_ENABLE 0x1
#define SPILL_4_OTHER_ENABLE 0x1
#define SPILL_5_OTHER_ENABLE 0x1
#define SPILL_6_OTHER_ENABLE 0x1
#define SPILL_7_OTHER_ENABLE 0x1
#define FILL_0_NORMAL_ENABLE 0x1
#define FILL_1_NORMAL_ENABLE 0x1
#define FILL_2_NORMAL_ENABLE 0x1
#define FILL_3_NORMAL_ENABLE 0x1
#define FILL_4_NORMAL_ENABLE 0x1
#define FILL_5_NORMAL_ENABLE 0x1
#define FILL_6_NORMAL_ENABLE 0x1
#define FILL_7_NORMAL_ENABLE 0x1
#define FILL_0_OTHER_ENABLE 0x1
#define FILL_1_OTHER_ENABLE 0x1
#define FILL_2_OTHER_ENABLE 0x1
#define FILL_3_OTHER_ENABLE 0x1
#define FILL_4_OTHER_ENABLE 0x1
#define FILL_5_OTHER_ENABLE 0x1
#define FILL_6_OTHER_ENABLE 0x1
#define FILL_7_OTHER_ENABLE 0x1
#define TICC_256_ENABLE 0x1
#define TICC_257_ENABLE 0x1
#define TICC_258_ENABLE 0x1
#define TICC_259_ENABLE 0x1
#define TICC_260_ENABLE 0x1
#define TICC_261_ENABLE 0x1
#define TICC_262_ENABLE 0x1
#define TICC_263_ENABLE 0x1
#define TICC_264_ENABLE 0x1
#define TICC_265_ENABLE 0x1
#define TICC_266_ENABLE 0x1
#define TICC_267_ENABLE 0x1
#define TICC_268_ENABLE 0x1
#define TICC_269_ENABLE 0x1
#define TICC_270_ENABLE 0x1
#define TICC_271_ENABLE 0x1
#define TICC_272_ENABLE 0x1
#define TICC_273_ENABLE 0x1
#define TICC_274_ENABLE 0x1
#define TICC_275_ENABLE 0x1
#define TICC_276_ENABLE 0x1
#define TICC_277_ENABLE 0x1
#define TICC_278_ENABLE 0x1
#define TICC_279_ENABLE 0x1
#define TICC_280_ENABLE 0x1
#define TICC_281_ENABLE 0x1
#define TICC_282_ENABLE 0x1
#define TICC_283_ENABLE 0x1
#define TICC_284_ENABLE 0x1
#define TICC_285_ENABLE 0x1
#define TICC_286_ENABLE 0x1
#define TICC_287_ENABLE 0x1
#define TICC_288_ENABLE 0x1
#define TICC_289_ENABLE 0x1
#define TICC_290_ENABLE 0x1
#define TICC_291_ENABLE 0x1
#define TICC_292_ENABLE 0x1
#define TICC_293_ENABLE 0x1
#define TICC_294_ENABLE 0x1
#define TICC_295_ENABLE 0x1
#define TICC_296_ENABLE 0x1
#define TICC_297_ENABLE 0x1
#define TICC_298_ENABLE 0x1
#define TICC_299_ENABLE 0x1
#define TICC_300_ENABLE 0x1
#define TICC_301_ENABLE 0x1
#define TICC_302_ENABLE 0x1
#define TICC_303_ENABLE 0x1
#define TICC_304_ENABLE 0x1
#define TICC_305_ENABLE 0x1
#define TICC_306_ENABLE 0x1
#define TICC_307_ENABLE 0x1
#define TICC_308_ENABLE 0x1
#define TICC_309_ENABLE 0x1
#define TICC_310_ENABLE 0x1
#define TICC_311_ENABLE 0x1
#define TICC_312_ENABLE 0x1
#define TICC_313_ENABLE 0x1
#define TICC_314_ENABLE 0x1
#define TICC_315_ENABLE 0x1
#define TICC_316_ENABLE 0x1
#define TICC_317_ENABLE 0x1
#define TICC_318_ENABLE 0x1
#define TICC_319_ENABLE 0x1
#define TICC_320_ENABLE 0x1
#define TICC_321_ENABLE 0x1
#define TICC_322_ENABLE 0x1
#define TICC_323_ENABLE 0x1
#define TICC_324_ENABLE 0x1
#define TICC_325_ENABLE 0x1
#define TICC_326_ENABLE 0x1
#define TICC_327_ENABLE 0x1
#define TICC_328_ENABLE 0x1
#define TICC_329_ENABLE 0x1
#define TICC_330_ENABLE 0x1
#define TICC_331_ENABLE 0x1
#define TICC_332_ENABLE 0x1
#define TICC_333_ENABLE 0x1
#define TICC_334_ENABLE 0x1
#define TICC_335_ENABLE 0x1
#define TICC_336_ENABLE 0x1
#define TICC_337_ENABLE 0x1
#define TICC_338_ENABLE 0x1
#define TICC_339_ENABLE 0x1
#define TICC_340_ENABLE 0x1
#define TICC_341_ENABLE 0x1
#define TICC_342_ENABLE 0x1
#define TICC_343_ENABLE 0x1
#define TICC_344_ENABLE 0x1
#define TICC_345_ENABLE 0x1
#define TICC_346_ENABLE 0x1
#define TICC_347_ENABLE 0x1
#define TICC_348_ENABLE 0x1
#define TICC_349_ENABLE 0x1
#define TICC_350_ENABLE 0x1
#define TICC_351_ENABLE 0x1
#define TICC_352_ENABLE 0x1
#define TICC_353_ENABLE 0x1
#define TICC_354_ENABLE 0x1
#define TICC_355_ENABLE 0x1
#define TICC_356_ENABLE 0x1
#define TICC_357_ENABLE 0x1
#define TICC_358_ENABLE 0x1
#define TICC_359_ENABLE 0x1
#define TICC_360_ENABLE 0x1
#define TICC_361_ENABLE 0x1
#define TICC_362_ENABLE 0x1
#define TICC_363_ENABLE 0x1
#define TICC_364_ENABLE 0x1
#define TICC_365_ENABLE 0x1
#define TICC_366_ENABLE 0x1
#define TICC_367_ENABLE 0x1
#define TICC_368_ENABLE 0x1
#define TICC_369_ENABLE 0x1
#define TICC_370_ENABLE 0x1
#define TICC_371_ENABLE 0x1
#define TICC_372_ENABLE 0x1
#define TICC_373_ENABLE 0x1
#define TICC_374_ENABLE 0x1
#define TICC_375_ENABLE 0x1
#define TICC_376_ENABLE 0x1
#define TICC_377_ENABLE 0x1
#define TICC_378_ENABLE 0x1
#define TICC_379_ENABLE 0x1
#define TICC_380_ENABLE 0x1
#define TICC_381_ENABLE 0x1
#define TICC_382_ENABLE 0x1
#define TICC_383_ENABLE 0x1

#define ENABLE_HT0_Trap_Instruction_134 0x1

#define H_T0_PThreadMutexLock_0x110
#define My_T0_PThreadMutexLock_0x110  \
	done			; \
	nop
