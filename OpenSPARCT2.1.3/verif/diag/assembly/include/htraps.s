/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: htraps.s
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
#ifdef USE_MPGEN_TRAPS
#define NORMAL_TRAP(n) add %l0, n, %l0; b TrapCheck;  nop;nop;nop;nop;nop;nop
#else
#define NORMAL_TRAP(n) mov n, %g7; b TrapCheck;  nop;nop;nop;nop;nop;nop
#endif

#ifdef SPILL_TRAP_RETRY
#define SPILL_TRAP(n) saved; retry; nop;nop;nop;nop;nop;nop;
#else
#define SPILL_TRAP(n) saved; mov n, %g7; b TrapCheck;  nop;
#endif

#ifdef FILL_TRAP_RETRY
#define FILL_TRAP(n) restored; retry; nop;nop;nop;nop;nop;nop;
#else
#define FILL_TRAP(n) restored; mov n, %g7; b TrapCheck;  nop;
#endif

#define CUSTOM_TRAP(n) setx n, %g1, %g2; jmp %g2; nop

.text

HT0_Reserved_0x00:		
#ifdef H_HT0_Reserved_0x00
#ifdef SUN_H_HT0_Reserved_0x00
	 SUN_H_HT0_Reserved_0x00 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x00)
#endif
.align 32
#else
	NORMAL_TRAP(0x00); 
#endif

HT0_Reserved_0x01:		
#ifdef H_HT0_Reserved_0x01
#ifdef SUN_H_HT0_Reserved_0x01
	 SUN_H_HT0_Reserved_0x01 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x01)
#endif
.align 32
#else
	NORMAL_TRAP(0x01); 
#endif

HT0_Watchdog_Reset_0x02:		
#ifdef H_HT0_Watchdog_Reset_0x02
#ifdef SUN_H_HT0_Watchdog_Reset_0x02
	 SUN_H_HT0_Watchdog_Reset_0x02 
#else
#	ifdef My_HT0_Watchdog_Reset_0x02
		My_HT0_Watchdog_Reset_0x02
#	else
        	CUSTOM_TRAP(H_HT0_Watchdog_Reset_0x02)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x02); 
#endif

HT0_Externally_Initiated_Reset_0x03:		
#ifdef H_HT0_Externally_Initiated_Reset_0x03
#ifdef SUN_H_HT0_Externally_Initiated_Reset_0x03
	 SUN_H_HT0_Externally_Initiated_Reset_0x03 
#else
        CUSTOM_TRAP(H_HT0_Externally_Initiated_Reset_0x03)
#endif
.align 32
#else
	NORMAL_TRAP(0x03); 
#endif

HT0_Software_Initiated_Reset_0x04:		
#ifdef H_HT0_Software_Initiated_Reset_0x04
#ifdef SUN_H_HT0_Software_Initiated_Reset_0x04
	 SUN_H_HT0_Software_Initiated_Reset_0x04 
#else
        CUSTOM_TRAP(H_HT0_Software_Initiated_Reset_0x04)
#endif
.align 32
#else
	NORMAL_TRAP(0x04); 
#endif

HT0_Reserved_0x05:		
#ifdef H_HT0_Reserved_0x05
#ifdef SUN_H_HT0_Reserved_0x05
	 SUN_H_HT0_Reserved_0x05 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x05)
#endif
.align 32
#else
	NORMAL_TRAP(0x05); 
#endif

HT0_Reserved_0x06:		
#ifdef H_HT0_Reserved_0x06
#ifdef SUN_H_HT0_Reserved_0x06
	 SUN_H_HT0_Reserved_0x06 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x06)
#endif
.align 32
#else
	NORMAL_TRAP(0x06); 
#endif

HT0_Store_Error_0x07:		
#ifdef H_HT0_Store_Error_0x07
#ifdef SUN_H_HT0_Store_Error_0x07
	 SUN_H_HT0_Store_Error_0x07 
#else
        CUSTOM_TRAP(H_HT0_Store_Error_0x07)
#endif
.align 32
#else
	NORMAL_TRAP(0x07); 
#endif

HT0_IAE_privilege_violation_0x08:
#ifdef H_HT0_IAE_privilege_violation_0x08
#ifdef SUN_H_HT0_IAE_privilege_violation_0x08
	 SUN_H_HT0_IAE_privilege_violation_0x08 
#else
#	ifdef My_HT0_IAE_privilege_violation_0x08
		My_HT0_IAE_privilege_violation_0x08
#	else
		CUSTOM_TRAP(H_HT0_IAE_privilege_violation_0x08)
#	endif
#endif
.align 32	
#else	
#	ifdef CLEAR_ITTE_P_ON_INSTR_ACC_EXCE
		b iaccess_except_handler; nop;nop;nop;nop;nop;nop;nop;
#	else
		NORMAL_TRAP(0x08); 
#	endif
#endif

HT0_Instruction_Access_MMU_Miss_0x09:		
#ifdef H_HT0_Instruction_Access_MMU_Miss_0x09
#ifdef SUN_H_HT0_Instruction_Access_MMU_Miss_0x09
	SUN_H_HT0_Instruction_Access_MMU_Miss_0x09
#else
#	ifdef My_HT0_Instruction_Access_MMU_Miss_0x09
		My_HT0_Instruction_Access_MMU_Miss_0x09
#	else
		CUSTOM_TRAP(H_HT0_Instruction_Access_MMU_Miss_0x09)
    ba  immu_miss_handler
#	endif
#endif

.align 32	
#else	
	!!NORMAL_TRAP(0x09); 
    ba  immu_miss_handler
    nop;nop;nop;nop;nop;nop;nop
#endif

HT0_Instruction_Access_Error_0x0a:		
#ifdef H_HT0_Instruction_access_error_0x0a
#ifdef SUN_H_HT0_Instruction_access_error_0x0a
	 SUN_H_HT0_Instruction_access_error_0x0a 
#else
        CUSTOM_TRAP(H_HT0_Instruction_access_error_0x0a)
#endif
.align 32
#else
	NORMAL_TRAP(0x0a); 
#endif

HT0_IAE_unauth_access_0x0b:		
#ifdef H_HT0_IAE_unauth_access_0x0b
#ifdef SUN_H_HT0_IAE_unauth_access_0x0b
	 SUN_H_HT0_IAE_unauth_access_0x0b 
#else
        CUSTOM_TRAP(H_HT0_IAE_unauth_access_0x0b)
#endif
.align 32
#else
	NORMAL_TRAP(0x0b); 
#endif

HT0_IAE_nfo_page_0x0c:		
#ifdef H_HT0_IAE_nfo_page_0x0c
#ifdef SUN_H_HT0_IAE_nfo_page_0x0c
	 SUN_H_HT0_IAE_nfo_page_0x0c 
#else
        CUSTOM_TRAP(H_HT0_IAE_nfo_page_0x0c)
#endif
.align 32
#else
	NORMAL_TRAP(0x0c); 
#endif

HT0_Instruction_address_range_0x0d:		
#ifdef H_HT0_Instruction_address_range_0x0d
#ifdef SUN_H_HT0_Instruction_address_range_0x0d
	 SUN_H_HT0_Instruction_address_range_0x0d 
#else
	#ifdef My_HT0_Instruction_address_range_0x0d
		My_HT0_Instruction_address_range_0x0d
	#else
	        CUSTOM_TRAP(H_HT0_Instruction_address_range_0x0d)
	#endif
#endif
.align 32
#else
	NORMAL_TRAP(0x0d); 
#endif

HT0_Instruction_real_range_0x0e:		
#ifdef H_HT0_Instruction_real_range_0x0e
#ifdef SUN_H_HT0_Instruction_real_range_0x0e
	 SUN_H_HT0_Instruction_real_range_0x0e 
#else
        CUSTOM_TRAP(H_HT0_Instruction_real_range_0x0e)
#endif
.align 32
#else
	NORMAL_TRAP(0x0e); 
#endif

HT0_Reserved_0x0f:		
#ifdef H_HT0_Reserved_0x0f
#ifdef SUN_H_HT0_Reserved_0x0f
	 SUN_H_HT0_Reserved_0x0f 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x0f)
#endif
.align 32
#else
	NORMAL_TRAP(0x0f); 
#endif

HT0_Illegal_Instruction_0x10:
#ifdef H_HT0_Illegal_instruction_0x10
#ifdef SUN_H_HT0_Illegal_instruction_0x10
	 SUN_H_HT0_Illegal_instruction_0x10 
#else
#	ifdef My_HT0_Illegal_instruction_0x10
		My_HT0_Illegal_instruction_0x10
#	else
        	CUSTOM_TRAP(H_HT0_Illegal_instruction_0x10)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x10)
#endif

HT0_Privileged_Opcode_0x11:
#ifdef H_HT0_Privileged_opcode_0x11
#ifdef SUN_H_HT0_Privileged_opcode_0x11
	 SUN_H_HT0_Privileged_opcode_0x11 
#else
#	ifdef My_HT0_Privileged_opcode_0x11
		My_HT0_Privileged_opcode_0x11
#	else
        	CUSTOM_TRAP(H_HT0_Privileged_opcode_0x11)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x11)
#endif

HT0_Unimplemented_LDD_0x12:
#ifdef H_HT0_Unimplemented_LDD_0x12
#ifdef SUN_H_HT0_Unimplemented_LDD_0x12
	 SUN_H_HT0_Unimplemented_LDD_0x12 
#else
        CUSTOM_TRAP(H_HT0_Unimplemented_LDD_0x12)
#endif
.align 32
#else
	NORMAL_TRAP(0x12)
#endif

HT0_Unimplemented_STD_0x13:
#ifdef H_HT0_Unimplemented_STD_0x13
#ifdef SUN_H_HT0_Unimplemented_STD_0x13
	 SUN_H_HT0_Unimplemented_STD_0x13 
#else
        CUSTOM_TRAP(H_HT0_Unimplemented_STD_0x13)
#endif
.align 32
#else
	NORMAL_TRAP(0x13)
#endif

HT0_DAE_invalid_asi_0x14:		
#ifdef H_HT0_DAE_invalid_asi_0x14
#ifdef SUN_H_HT0_DAE_invalid_asi_0x14
	 SUN_H_HT0_DAE_invalid_asi_0x14 
#else
        CUSTOM_TRAP(H_HT0_DAE_invalid_asi_0x14)
#endif
.align 32
#else
	NORMAL_TRAP(0x14); 
#endif

HT0_DAE_privilege_violation_0x15:		
#ifdef H_HT0_DAE_privilege_violation_0x15
#ifdef SUN_H_HT0_DAE_privilege_violation_0x15
	 SUN_H_HT0_DAE_privilege_violation_0x15 
#else
        CUSTOM_TRAP(H_HT0_DAE_privilege_violation_0x15)
#endif
.align 32
#else
	NORMAL_TRAP(0x15); 
#endif

HT0_DAE_nc_page_0x16:		
#ifdef H_HT0_DAE_nc_page_0x16
#ifdef SUN_H_HT0_DAE_nc_page_0x16
	 SUN_H_HT0_DAE_nc_page_0x16 
#else
        CUSTOM_TRAP(H_HT0_DAE_nc_page_0x16)
#endif
.align 32
#else
	NORMAL_TRAP(0x16); 
#endif

HT0_DAE_nfo_page_0x17:		
#ifdef H_HT0_DAE_nfo_page_0x17
#ifdef SUN_H_HT0_DAE_nfo_page_0x17
	 SUN_H_HT0_DAE_nfo_page_0x17 
#else
        CUSTOM_TRAP(H_HT0_DAE_nfo_page_0x17)
#endif
.align 32
#else
	NORMAL_TRAP(0x17); 
#endif

HT0_Reserved_0x18:		
#ifdef H_HT0_Reserved_0x18
#ifdef SUN_H_HT0_Reserved_0x18
	 SUN_H_HT0_Reserved_0x18 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x18)
#endif
.align 32
#else
	NORMAL_TRAP(0x18); 
#endif

HT0_Reserved_0x19:		
#ifdef H_HT0_Reserved_0x19
#ifdef SUN_H_HT0_Reserved_0x19
	 SUN_H_HT0_Reserved_0x19 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x19)
#endif
.align 32
#else
	NORMAL_TRAP(0x19); 
#endif

HT0_Reserved_0x1a:		
#ifdef H_HT0_Reserved_0x1a
#ifdef SUN_H_HT0_Reserved_0x1a
	 SUN_H_HT0_Reserved_0x1a 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x1a)
#endif
.align 32
#else
	NORMAL_TRAP(0x1a); 
#endif

HT0_Reserved_0x1b:		
#ifdef H_HT0_Reserved_0x1b
#ifdef SUN_H_HT0_Reserved_0x1b
	 SUN_H_HT0_Reserved_0x1b 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x1b)
#endif
.align 32
#else
	NORMAL_TRAP(0x1b); 
#endif

HT0_Reserved_0x1c:		
#ifdef H_HT0_Reserved_0x1c
#ifdef SUN_H_HT0_Reserved_0x1c
	 SUN_H_HT0_Reserved_0x1c 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x1c)
#endif
.align 32
#else
	NORMAL_TRAP(0x1c); 
#endif

HT0_Reserved_0x1d:		
#ifdef H_HT0_Reserved_0x1d
#ifdef SUN_H_HT0_Reserved_0x1d
	 SUN_H_HT0_Reserved_0x1d 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x1d)
#endif
.align 32
#else
	NORMAL_TRAP(0x1d); 
#endif

HT0_Reserved_0x1e:		
#ifdef H_HT0_Reserved_0x1e
#ifdef SUN_H_HT0_Reserved_0x1e
	 SUN_H_HT0_Reserved_0x1e 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x1e)
#endif
.align 32
#else
	NORMAL_TRAP(0x1e); 
#endif

HT0_Reserved_0x1f:		
#ifdef H_HT0_Reserved_0x1f
#ifdef SUN_H_HT0_Reserved_0x1f
	 SUN_H_HT0_Reserved_0x1f 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x1f)
#endif
.align 32
#else
	NORMAL_TRAP(0x1f); 
#endif

HT0_Fp_Disabled_0x20:
#ifdef H_HT0_Fp_disabled_0x20
#ifdef SUN_H_HT0_Fp_disabled_0x20
	 SUN_H_HT0_Fp_disabled_0x20 
#else
#	ifdef My_HT0_Fp_disabled_0x20
		My_HT0_Fp_disabled_0x20
#	else
        	CUSTOM_TRAP(H_HT0_Fp_disabled_0x20)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x20)
#endif

HT0_Fp_Exception_Ieee_754_0x21:		
#ifdef H_HT0_Fp_exception_ieee_754_0x21
#ifdef SUN_H_HT0_Fp_exception_ieee_754_0x21
	 SUN_H_HT0_Fp_exception_ieee_754_0x21 
#else
#	ifdef My_HT0_Fp_exception_ieee_754_0x21
		My_HT0_Fp_exception_ieee_754_0x21
#	else
        	CUSTOM_TRAP(H_HT0_Fp_exception_ieee_754_0x21)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x21); 
#endif

HT0_Fp_Exception_Other_0x22:		
#ifdef H_HT0_Fp_exception_other_0x22
#ifdef SUN_H_HT0_Fp_exception_other_0x22
	 SUN_H_HT0_Fp_exception_other_0x22 
#else
#	ifdef My_HT0_Fp_exception_other_0x22
		My_HT0_Fp_exception_other_0x22
#	else
                CUSTOM_TRAP(H_HT0_Fp_exception_other_0x22)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x22); 
#endif

HT0_Tag_Overflow_0x23:		
#ifdef H_HT0_Tag_Overflow
#ifdef SUN_H_HT0_Tag_Overflow
	 SUN_H_HT0_Tag_Overflow 
#else
#	ifdef My_HT0_Tag_Overflow
		My_HT0_Tag_Overflow
#	else
		CUSTOM_TRAP(H_HT0_Tag_Overflow)
#	endif
#endif
#else
	NORMAL_TRAP(0x23); 
#endif
.align	32

HT0_Clean_Window_0x24:
#ifdef H_HT0_Clean_Window
#ifdef SUN_H_HT0_Clean_Window
	 SUN_H_HT0_Clean_Window 
#else
#	ifdef My_HT0_Clean_Window
		My_HT0_Clean_Window
#	else
		CUSTOM_TRAP(H_HT0_Clean_Window)
#	endif
#endif
#else                
#ifdef CLEAN_WIN_RETRY
        rdpr %cleanwin, %g1; add %g1,1,%g1; wrpr %g1, %g0, %cleanwin; retry;
#else
	restore; mov 0x24, %g7; b TrapCheck;  nop;nop;nop;nop;nop;
#endif
#endif
.align	128

HT0_Division_By_Zero_0x28:		
#ifdef H_HT0_Division_By_Zero
#ifdef SUN_H_HT0_Division_By_Zero
	 SUN_H_HT0_Division_By_Zero 
#else
#	ifdef My_HT0_Division_By_Zero
		My_HT0_Division_By_Zero
#	else
		CUSTOM_TRAP(H_HT0_Division_By_Zero)
#	endif
#endif
#else
	NORMAL_TRAP(0x28); 	
#endif
.align 32	                

HT0_Internal_Processor_Error_0x29:		
#ifdef H_HT0_Internal_Processor_Error_0x29
#ifdef SUN_H_HT0_Internal_Processor_Error_0x29
	 SUN_H_HT0_Internal_Processor_Error_0x29 
#else
        CUSTOM_TRAP(H_HT0_Internal_Processor_Error_0x29)
#endif
.align 32
#else
	NORMAL_TRAP(0x29); 
#endif

HT0_Instruction_Invalid_TSB_Entry_0x2a:		
#ifdef H_HT0_Instruction_Invalid_TSB_Entry_0x2a
#ifdef SUN_H_HT0_Instruction_Invalid_TSB_Entry_0x2a
	 SUN_H_HT0_Instruction_Invalid_TSB_Entry_0x2a 
#else
        CUSTOM_TRAP(H_HT0_Instruction_Invalid_TSB_Entry_0x2a)
#endif
.align 32
#else
	NORMAL_TRAP(0x2a); 
#endif

HT0_Data_Invalid_TSB_Entry_0x2b:		
#ifdef H_HT0_Data_Invalid_TSB_Entry_0x2b
#ifdef SUN_H_HT0_Data_Invalid_TSB_Entry_0x2b
	 SUN_H_HT0_Data_Invalid_TSB_Entry_0x2b 
#else
        CUSTOM_TRAP(H_HT0_Data_Invalid_TSB_Entry_0x2b)
#endif
.align 32
#else
	NORMAL_TRAP(0x2b); 
#endif

HT0_Reserved_0x2c:		
#ifdef H_HT0_Reserved_0x2c
#ifdef SUN_H_HT0_Reserved_0x2c
	 SUN_H_HT0_Reserved_0x2c 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x2c)
#endif
.align 32
#else
	NORMAL_TRAP(0x2c); 
#endif

HT0_mem_real_range_0x2d:		
#ifdef H_HT0_mem_real_range_0x2d
#ifdef SUN_H_HT0_mem_real_range_0x2d
	 SUN_H_HT0_mem_real_range_0x2d 
#else
        CUSTOM_TRAP(H_HT0_mem_real_range_0x2d)
#endif
.align 32
#else
	NORMAL_TRAP(0x2d); 
#endif

HT0_mem_address_range_0x2e:		
#ifdef H_HT0_mem_address_range_0x2e
#ifdef SUN_H_HT0_mem_address_range_0x2e
	 SUN_H_HT0_mem_address_range_0x2e 
#else
        CUSTOM_TRAP(H_HT0_mem_address_range_0x2e)
#endif
.align 32
#else
	NORMAL_TRAP(0x2e); 
#endif

HT0_Reserved_0x2f:		
#ifdef H_HT0_Reserved_0x2f
#ifdef SUN_H_HT0_Reserved_0x2f
	 SUN_H_HT0_Reserved_0x2f 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x2f)
#endif
.align 32
#else
	NORMAL_TRAP(0x2f); 
#endif

HT0_DAE_so_page_0x30:		
#ifdef H_HT0_DAE_so_page_0x30
#ifdef SUN_H_HT0_DAE_so_page_0x30
	 SUN_H_HT0_DAE_so_page_0x30 
#else

#	ifdef My_HT0_DAE_so_page_0x30
		My_HT0_DAE_so_page_0x30
#	else
	        CUSTOM_TRAP(H_HT0_DAE_so_page_0x30)
#	endif
#endif
.align 32
#else
#	ifdef CLEAR_DTTE_P_ON_DATA_ACC_EXCE
		b daccess_except_handler; nop;nop;nop;nop;nop;nop;nop;
#	else
		NORMAL_TRAP(0x30); 
#	endif
#endif

HT0_Data_Access_MMU_Miss_0x31:		
#ifdef H_HT0_Data_Access_MMU_Miss
#ifdef SUN_H_HT0_Data_Access_MMU_Miss
	 SUN_H_HT0_Data_Access_MMU_Miss 
#else
#	ifdef My_HT0_Data_Access_MMU_Miss_0x31
		My_HT0_Data_Access_MMU_Miss_0x31
#	else
	        CUSTOM_TRAP(H_HT0_Reserved_0x31)
#	endif
#endif
.align 32
#else
	!!NORMAL_TRAP(0x31); 
    ba  dmmu_miss_handler
    nop;nop;nop;nop;nop;nop;nop
#endif


HT0_Data_Access_Error_0x32:		
#ifdef H_HT0_Data_access_error_0x32
#ifdef SUN_H_HT0_Data_access_error_0x32
	 SUN_H_HT0_Data_access_error_0x32 
#else
        CUSTOM_TRAP(H_HT0_Data_access_error_0x32)
#endif
.align 32
#else
	NORMAL_TRAP(0x32); 
#endif

HT0_Reserved_0x33:		
#ifdef H_HT0_Reserved_0x33
#ifdef SUN_H_HT0_Reserved_0x33
	 SUN_H_HT0_Reserved_0x33 
#else
#	ifdef My_HT0_Data_Access_Protection_0x33
		My_HT0_Data_Access_Protection_0x33
#	else
	        CUSTOM_TRAP(H_HT0_Reserved_0x33)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x33);
#endif

HT0_Mem_Address_Not_Aligned_0x34:		
#ifdef H_HT0_Mem_Address_Not_Aligned_0x34
#ifdef SUN_H_HT0_Mem_Address_Not_Aligned_0x34
	 SUN_H_HT0_Mem_Address_Not_Aligned_0x34 
#else
#	ifdef My_HT0_Mem_Address_Not_Aligned_0x34
		My_HT0_Mem_Address_Not_Aligned_0x34
#	else
		CUSTOM_TRAP(H_HT0_Mem_Address_Not_Aligned_0x34)
#	endif
#endif
.align 32
#else
#	if defined CHECK_SFSR_SFAR || defined FIX_MEM_ASSRESS_NOT_ALIGNED
		b proc_mem_align; nop;nop;nop;nop;nop;nop;nop;
#	else
		NORMAL_TRAP(0x34); 
#	endif
#endif

HT0_Lddf_Mem_Address_Not_Aligned_0x35:
#ifdef H_HT0_Lddf_Mem_Address_Not_Aligned_0x35
#ifdef SUN_H_HT0_Lddf_Mem_Address_Not_Aligned_0x35
	 SUN_H_HT0_Lddf_Mem_Address_Not_Aligned_0x35 
#else
#	ifdef My_HT0_Lddf_Mem_Address_Not_Aligned_0x35
		My_HT0_Lddf_Mem_Address_Not_Aligned_0x35
#	else
		CUSTOM_TRAP(H_HT0_Lddf_Mem_Address_Not_Aligned_0x35)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x35); 
#endif

HT0_Stdf_Mem_Address_Not_Aligned_0x36:
#ifdef H_HT0_Stdf_Mem_Address_Not_Aligned_0x36
#ifdef SUN_H_HT0_Stdf_Mem_Address_Not_Aligned_0x36
	 SUN_H_HT0_Stdf_Mem_Address_Not_Aligned_0x36 
#else
#	ifdef My_HT0_Stdf_Mem_Address_Not_Aligned_0x36
		My_HT0_Stdf_Mem_Address_Not_Aligned_0x36
#	else
		CUSTOM_TRAP(H_HT0_Stdf_Mem_Address_Not_Aligned_0x36)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x36); 
#endif

HT0_Privileged_Action_0x37:		
#ifdef H_HT0_Privileged_Action_0x37
#ifdef SUN_H_HT0_Privileged_Action_0x37
	 SUN_H_HT0_Privileged_Action_0x37 
#else
#	ifdef My_HT0_Privileged_Action_0x37
		My_HT0_Privileged_Action_0x37
#	else
		CUSTOM_TRAP(H_HT0_Privileged_Action_0x37)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x37); 
#endif

HT0_Reserved_0x38:		
#ifdef H_HT0_Reserved_0x38
#ifdef SUN_H_HT0_Reserved_0x38
	 SUN_H_HT0_Reserved_0x38 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x38)
#endif
.align 32
#else
	NORMAL_TRAP(0x38); 
#endif

HT0_Reserved_0x39:		
#ifdef H_HT0_Reserved_0x39
#ifdef SUN_H_HT0_Reserved_0x39
	 SUN_H_HT0_Reserved_0x39 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x39)
#endif
.align 32
#else
	NORMAL_TRAP(0x39); 
#endif

HT0_Reserved_0x3a:		
#ifdef H_HT0_Reserved_0x3a
#ifdef SUN_H_HT0_Reserved_0x3a
	 SUN_H_HT0_Reserved_0x3a 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x3a)
#endif
.align 32
#else
	NORMAL_TRAP(0x3a); 
#endif

HT0_Reserved_0x3b:		
#ifdef H_HT0_Reserved_0x3b
#ifdef SUN_H_HT0_Reserved_0x3b
	 SUN_H_HT0_Reserved_0x3b 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x3b)
#endif
.align 32
#else
	NORMAL_TRAP(0x3b); 
#endif

HT0_Control_Word_Queue_Interrupt_0x3c:
#ifdef H_HT0_Control_Word_Queue_Interrupt_0x3c
#ifdef SUN_H_HT0_Control_Word_Queue_Interrupt_0x3c
         SUN_H_HT0_Control_Word_Queue_Interrupt_0x3c
#else
#       ifdef My_HT0_Control_Word_Queue_Interrupt_0x3c
                My_HT0_Control_Word_Queue_Interrupt_0x3c
#       else
                CUSTOM_TRAP(H_HT0_Control_Word_Queue_Interrupt_0x3c)
#       endif

#endif
.align 32
#else
        NORMAL_TRAP(0x3c);
#endif

HT0_Modular_Arithmetic_Interrupt_0x3d:		
#ifdef H_HT0_Modular_Arithmetic_Interrupt_0x3d
#ifdef SUN_H_HT0_Modular_Arithmetic_Interrupt_0x3d
	 SUN_H_HT0_Modular_Arithmetic_Interrupt_0x3d 
#else
#	ifdef My_H_HT0_Modular_Arithmetic_Interrupt_0x3d
		My_H_HT0_Modular_Arithmetic_Interrupt_0x3d
#	else
	        CUSTOM_TRAP(HT0_Modular_Arithmetic_Interrupt_0x3d)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x3d); 
#endif

HT0_Instr_Real_Tran_Miss_0x3e:		
#ifdef H_HT0_Instr_Real_Tran_Miss_0x3e
#ifdef SUN_H_HT0_Instr_Real_Tran_Miss_0x3e
	 SUN_H_HT0_Instr_Real_Tran_Miss_0x3e 
#else
#	ifdef My_HT0_Instr_Real_Tran_Miss_0x3e
		My_HT0_Instr_Real_Tran_Miss_0x3e
#	else
		CUSTOM_TRAP(H_HT0_Instr_Real_Tran_Miss_0x3e)
#	endif
#endif
.align 32
#else
    ! jump into an include file. immu_miss_handler_ext.s
	ba	immu_real_miss_handler
	nop
	nop
	nop
	nop
	nop
	nop
	nop
#endif

HT0_Data_Real_Tran_Miss_0x3f:		
#ifdef H_HT0_Data_Real_Tran_Miss_0x3f
#ifdef SUN_H_HT0_Data_Real_Tran_Miss_0x3f
	 SUN_H_HT0_Data_Real_Tran_Miss_0x3f 
#else
#	ifdef My_HT0_Data_Real_Tran_Miss_0x3f
		My_HT0_Data_Real_Tran_Miss_0x3f
#	else
	        CUSTOM_TRAP(H_HT0_Data_Real_Tran_Miss_0x3f)
#	endif
#endif
.align 32
#else
    ! jump into an include file. dmmu_miss_handler_ext.s
	ba	dmmu_real_miss_handler
	nop
    nop
	nop
	nop
	nop
	nop
	nop
#endif

HT0_Sw_Recoverable_Error_0x40:		
#ifdef H_HT0_Sw_Recoverable_Error_0x40
#ifdef SUN_H_HT0_Sw_Recoverable_Error_0x40
	 SUN_H_HT0_Sw_Recoverable_Error_0x40 
#else
        CUSTOM_TRAP(H_HT0_Sw_Recoverable_Error_0x40)
#endif
.align 32
#else
	NORMAL_TRAP(0x40); 
#endif

HT0_Interrupt_Level_1_0x41:		
#ifdef H_HT0_Interrupt_Level_1_0x41
#ifdef SUN_H_HT0_Interrupt_Level_1_0x41
	 SUN_H_HT0_Interrupt_Level_1_0x41 
#else
#	ifdef My_HT0_Interrupt_Level_1_0x41
		My_HT0_Interrupt_Level_1_0x41
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_1_0x41)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x41); 
#endif

HT0_Interrupt_Level_2_0x42:		
#ifdef H_HT0_Interrupt_Level_2_0x42
#ifdef SUN_H_HT0_Interrupt_Level_2_0x42
	 SUN_H_HT0_Interrupt_Level_2_0x42 
#else
#	ifdef My_HT0_Interrupt_Level_2_0x42
		My_HT0_Interrupt_Level_2_0x42
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_2_0x42)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x42); 
#endif

HT0_Interrupt_Level_3_0x43:		
#ifdef H_HT0_Interrupt_Level_3_0x43
#ifdef SUN_H_HT0_Interrupt_Level_3_0x43
	 SUN_H_HT0_Interrupt_Level_3_0x43 
#else
#	ifdef My_HT0_Interrupt_Level_3_0x43
		My_HT0_Interrupt_Level_3_0x43
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_3_0x43)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x43); 
#endif

HT0_Interrupt_Level_4_0x44:		
#ifdef H_HT0_Interrupt_Level_4_0x44
#ifdef SUN_H_HT0_Interrupt_Level_4_0x44
	 SUN_H_HT0_Interrupt_Level_4_0x44 
#else
#	ifdef My_HT0_Interrupt_Level_4_0x44
		My_HT0_Interrupt_Level_4_0x44
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_4_0x44)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x44); 
#endif

HT0_Interrupt_Level_5_0x45:		
#ifdef H_HT0_Interrupt_Level_5_0x45
#ifdef SUN_H_HT0_Interrupt_Level_5_0x45
	 SUN_H_HT0_Interrupt_Level_5_0x45 
#else
#	ifdef My_HT0_Interrupt_Level_5_0x45
		My_HT0_Interrupt_Level_5_0x45
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_5_0x45)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x45); 
#endif

HT0_Interrupt_Level_6_0x46:		
#ifdef H_HT0_Interrupt_Level_6_0x46
#ifdef SUN_H_HT0_Interrupt_Level_6_0x46
	 SUN_H_HT0_Interrupt_Level_6_0x46 
#else
#	ifdef My_HT0_Interrupt_Level_6_0x46
		My_HT0_Interrupt_Level_6_0x46
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_6_0x46)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x46); 
#endif

HT0_Interrupt_Level_7_0x47:		
#ifdef H_HT0_Interrupt_Level_7_0x47
#ifdef SUN_H_HT0_Interrupt_Level_7_0x47
	 SUN_H_HT0_Interrupt_Level_7_0x47 
#else
#	ifdef My_HT0_Interrupt_Level_7_0x47
		My_HT0_Interrupt_Level_7_0x47
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_7_0x47)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x47); 
#endif

HT0_Interrupt_Level_8_0x48:		
#ifdef H_HT0_Interrupt_Level_8_0x48
#ifdef SUN_H_HT0_Interrupt_Level_8_0x48
	 SUN_H_HT0_Interrupt_Level_8_0x48 
#else
#	ifdef My_HT0_Interrupt_Level_8_0x48
		My_HT0_Interrupt_Level_8_0x48
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_8_0x48)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x48); 
#endif

HT0_Interrupt_Level_9_0x49:		
#ifdef H_HT0_Interrupt_Level_9_0x49
#ifdef SUN_H_HT0_Interrupt_Level_9_0x49
	 SUN_H_HT0_Interrupt_Level_9_0x49 
#else
#	ifdef My_HT0_Interrupt_Level_9_0x49
		My_HT0_Interrupt_Level_9_0x49
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_9_0x49)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x49); 
#endif

HT0_Interrupt_Level_10_0x4a:		
#ifdef H_HT0_Interrupt_Level_10_0x4a
#ifdef SUN_H_HT0_Interrupt_Level_10_0x4a
	 SUN_H_HT0_Interrupt_Level_10_0x4a 
#else
#	ifdef My_HT0_Interrupt_Level_10_0x4a
		My_HT0_Interrupt_Level_10_0x4a
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_10_0x4a)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4a); 
#endif

HT0_Interrupt_Level_11_0x4b:		
#ifdef H_HT0_Interrupt_Level_11_0x4b
#ifdef SUN_H_HT0_Interrupt_Level_11_0x4b
	 SUN_H_HT0_Interrupt_Level_11_0x4b 
#else
#	ifdef My_HT0_Interrupt_Level_11_0x4b
		My_HT0_Interrupt_Level_11_0x4b
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_11_0x4b)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4b); 
#endif

HT0_Interrupt_Level_12_0x4c:		
#ifdef H_HT0_Interrupt_Level_12_0x4c
#ifdef SUN_H_HT0_Interrupt_Level_12_0x4c
	 SUN_H_HT0_Interrupt_Level_12_0x4c 
#else
#	ifdef My_HT0_Interrupt_Level_12_0x4c
		My_HT0_Interrupt_Level_12_0x4c
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_12_0x4c)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4c); 
#endif

HT0_Interrupt_Level_13_0x4d:		
#ifdef H_HT0_Interrupt_Level_13_0x4d
#ifdef SUN_H_HT0_Interrupt_Level_13_0x4d
	 SUN_H_HT0_Interrupt_Level_13_0x4d 
#else
#	ifdef My_HT0_Interrupt_Level_13_0x4d
		My_HT0_Interrupt_Level_13_0x4d
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_13_0x4d)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4d); 
#endif

HT0_Interrupt_Level_14_0x4e:		
#ifdef H_HT0_Interrupt_Level_14_0x4e
#ifdef SUN_H_HT0_Interrupt_Level_14_0x4e
	 SUN_H_HT0_Interrupt_Level_14_0x4e 
#else
#	ifdef My_HT0_Interrupt_Level_14_0x4e
		My_HT0_Interrupt_Level_14_0x4e
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_14_0x4e)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4e); 
#endif

HT0_Interrupt_Level_15_0x4f:		
#ifdef H_HT0_Interrupt_Level_15_0x4f
#ifdef SUN_H_HT0_Interrupt_Level_15_0x4f
	 SUN_H_HT0_Interrupt_Level_15_0x4f 
#else
#	ifdef My_HT0_Interrupt_Level_15_0x4f
		My_HT0_Interrupt_Level_15_0x4f
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_Level_15_0x4f)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4f); 
#endif

HT0_Reserved_0x50:		
#ifdef H_HT0_Reserved_0x50
#ifdef SUN_H_HT0_Reserved_0x50
	 SUN_H_HT0_Reserved_0x50 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x50)
#endif
.align 32
#else
	NORMAL_TRAP(0x50); 
#endif

HT0_Reserved_0x51:		
#ifdef H_HT0_Reserved_0x51
#ifdef SUN_H_HT0_Reserved_0x51
	 SUN_H_HT0_Reserved_0x51 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x51)
#endif
.align 32
#else
	NORMAL_TRAP(0x51); 
#endif

HT0_Reserved_0x52:		
#ifdef H_HT0_Reserved_0x52
#ifdef SUN_H_HT0_Reserved_0x52
	 SUN_H_HT0_Reserved_0x52 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x52)
#endif
.align 32
#else
	NORMAL_TRAP(0x52); 
#endif

HT0_Reserved_0x53:		
#ifdef H_HT0_Reserved_0x53
#ifdef SUN_H_HT0_Reserved_0x53
	 SUN_H_HT0_Reserved_0x53 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x53)
#endif
.align 32
#else
	NORMAL_TRAP(0x53); 
#endif

HT0_Reserved_0x54:		
#ifdef H_HT0_Reserved_0x54
#ifdef SUN_H_HT0_Reserved_0x54
	 SUN_H_HT0_Reserved_0x54 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x54)
#endif
.align 32
#else
	NORMAL_TRAP(0x54); 
#endif

HT0_Reserved_0x55:		
#ifdef H_HT0_Reserved_0x55
#ifdef SUN_H_HT0_Reserved_0x55
	 SUN_H_HT0_Reserved_0x55 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x55)
#endif
.align 32
#else
	NORMAL_TRAP(0x55); 
#endif

HT0_Reserved_0x56:		
#ifdef H_HT0_Reserved_0x56
#ifdef SUN_H_HT0_Reserved_0x56
	 SUN_H_HT0_Reserved_0x56 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x56)
#endif
.align 32
#else
	NORMAL_TRAP(0x56); 
#endif

HT0_Reserved_0x57:		
#ifdef H_HT0_Reserved_0x57
#ifdef SUN_H_HT0_Reserved_0x57
	 SUN_H_HT0_Reserved_0x57 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x57)
#endif
.align 32
#else
	NORMAL_TRAP(0x57); 
#endif

HT0_Reserved_0x58:		
#ifdef H_HT0_Reserved_0x58
#ifdef SUN_H_HT0_Reserved_0x58
	 SUN_H_HT0_Reserved_0x58 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x58)
#endif
.align 32
#else
	NORMAL_TRAP(0x58); 
#endif

HT0_Reserved_0x59:		
#ifdef H_HT0_Reserved_0x59
#ifdef SUN_H_HT0_Reserved_0x59
	 SUN_H_HT0_Reserved_0x59 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x59)
#endif
.align 32
#else
	NORMAL_TRAP(0x59); 
#endif

HT0_Reserved_0x5a:		
#ifdef H_HT0_Reserved_0x5a
#ifdef SUN_H_HT0_Reserved_0x5a
	 SUN_H_HT0_Reserved_0x5a 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x5a)
#endif
.align 32
#else
	NORMAL_TRAP(0x5a); 
#endif

HT0_Reserved_0x5b:		
#ifdef H_HT0_Reserved_0x5b
#ifdef SUN_H_HT0_Reserved_0x5b
	 SUN_H_HT0_Reserved_0x5b 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x5b)
#endif
.align 32
#else
	NORMAL_TRAP(0x5b); 
#endif

HT0_Reserved_0x5c:		
#ifdef H_HT0_Reserved_0x5c
#ifdef SUN_H_HT0_Reserved_0x5c
	 SUN_H_HT0_Reserved_0x5c 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x5c)
#endif
.align 32
#else
	NORMAL_TRAP(0x5c); 
#endif

HT0_Reserved_0x5d:		
#ifdef H_HT0_Reserved_0x5d
#ifdef SUN_H_HT0_Reserved_0x5d
	 SUN_H_HT0_Reserved_0x5d 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x5d)
#endif
.align 32
#else
	NORMAL_TRAP(0x5d); 
#endif

HT0_Hstick_Match_0x5e:		
#ifdef H_HT0_Hstick_Match_0x5e
#ifdef SUN_H_HT0_Hstick_Match_0x5e
	 SUN_H_HT0_Hstick_Match_0x5e 
#else
#	ifdef My_HT0_Hstick_Match_0x5e
		My_HT0_Hstick_Match_0x5e
#	else
        	CUSTOM_TRAP(H_HT0_Hstick_Match_0x5e)
#	endif
#endif
.align 32
#else
	!  disable  HSTICK_COMPARE
	wrhpr	%g0, -1, %hsys_tick_cmpr
	wrhpr	%g0, 0, %hintp
	mov     0x5e, %g7
	b       TrapCheckWithRetry
	nop
	nop
	nop
	nop
#endif

HT0_Trap_Level_Zero_0x5f:		
#ifdef H_HT0_Trap_Level_Zero_0x5f
#ifdef SUN_H_HT0_Trap_Level_Zero_0x5f
	 SUN_H_HT0_Trap_Level_Zero_0x5f 
#else
#	ifdef My_HT0_Trap_Level_Zero_0x5f
		My_HT0_Trap_Level_Zero_0x5f
#	else
        	CUSTOM_TRAP(H_HT0_Trap_Level_Zero_0x5f)
#	endif
#endif
.align 32
#else
	rdhpr	%htstate, %g1
	mov	0x1, %g2	
	wrhpr	%g1, %g2, %htstate
	mov     0x5f, %g7
	b       TrapCheckWithRetry
	nop
	nop
	nop
#endif 

HT0_Interrupt_0x60:		
#ifdef H_HT0_Interrupt_0x60
#ifdef SUN_H_HT0_Interrupt_0x60
	 SUN_H_HT0_Interrupt_0x60 
#else
#	ifdef My_HT0_Interrupt_0x60
		My_HT0_Interrupt_0x60
#	else
		CUSTOM_TRAP(H_HT0_Interrupt_0x60)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x60); 
#endif

HT0_PA_Watchpoint_0x61:		
#ifdef H_HT0_PA_Watchpoint_0x61
#ifdef SUN_H_HT0_PA_Watchpoint_0x61
	 SUN_H_HT0_PA_Watchpoint_0x61 
#else
#	ifdef My_H_HT0_PA_Watchpoint_0x61
		My_H_HT0_PA_Watchpoint_0x61
#	else
		CUSTOM_TRAP(H_HT0_PA_Watchpoint_0x61)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x61); 
#endif

HT0_VA_Watchpoint_0x62:		
#ifdef H_HT0_VA_Watchpoint_0x62
#ifdef SUN_H_HT0_VA_Watchpoint_0x62
	 SUN_H_HT0_VA_Watchpoint_0x62 
#else
#	ifdef My_H_HT0_VA_Watchpoint_0x62
		My_H_HT0_VA_Watchpoint_0x62
#	else
		CUSTOM_TRAP(H_HT0_VA_Watchpoint_0x62)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x62); 
#endif

HT0_Hw_Corrected_Error_0x63:		
#ifdef H_HT0_Hw_Corrected_Error_0x63
#ifdef SUN_H_HT0_Hw_Corrected_Error_0x63
	 SUN_H_HT0_Hw_Corrected_Error_0x63 
#else
        CUSTOM_TRAP(H_HT0_Hw_Corrected_Error_0x63)
#endif
.align 32
#else
	NORMAL_TRAP(0x63); 
#endif

HT0_Fast_Instr_Access_MMU_Miss_0x64:
#ifdef H_HT0_fast_instr_access_MMU_miss
#ifdef SUN_H_HT0_fast_instr_access_MMU_miss
	 SUN_H_HT0_fast_instr_access_MMU_miss 
#else
        CUSTOM_TRAP(H_HT0_fast_instr_access_MMU_miss)
#endif
#else
#ifdef S2MEM_IMMU_MISS_HANDLER
#include S2MEM_IMMU_MISS_HANDLER
#else
!!#include <immu_miss_handler.s>
    ! jump into an include file. immu_miss_handler_ext.s
    ba  immu_miss_handler
    nop
#endif	
#endif

.align 128
HT0_Fast_Data_Access_MMU_Miss_0x68:
#ifdef H_HT0_fast_data_access_MMU_miss
#ifdef SUN_H_HT0_fast_data_access_MMU_miss
	 SUN_H_HT0_fast_data_access_MMU_miss 
#else
        CUSTOM_TRAP(H_HT0_fast_data_access_MMU_miss)
#endif
#else
#ifdef S2MEM_DMMU_MISS_HANDLER
#include S2MEM_DMMU_MISS_HANDLER
#else
!!#include <dmmu_miss_handler.s>
    ! jump into an include file. dmmu_miss_handler_ext.s
    ba  dmmu_miss_handler
    nop
#endif	
#endif

.align 128	
HT0_Fast_Data_Access_Protection_0x6c:		
#ifdef H_HT0_data_access_protection_0x6c
#ifdef SUN_H_HT0_data_access_protection_0x6c
	 SUN_H_HT0_data_access_protection_0x6c 
#else
#	ifdef My_HT0_data_access_protection_0x6c
		My_HT0_data_access_protection_0x6c
#	else
	        CUSTOM_TRAP(H_HT0_data_access_protection_0x6c)
#	endif
#endif
#else
#ifdef SET_DTTE_W_ON_DATA_ACC_PROT
	ba	daccess_prot_handler
	nop
#else
		NORMAL_TRAP(0x6c);
#endif
#endif

.align 128	
HT0_Reserved_0x70:		
#ifdef H_HT0_Reserved_0x70
#ifdef SUN_H_HT0_Reserved_0x70
	 SUN_H_HT0_Reserved_0x70 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x70)
#endif
.align 32
#else
	NORMAL_TRAP(0x70); 
#endif

HT0_Instruction_Access_MMU_Error_0x71:		
#ifdef H_HT0_Instruction_Access_MMU_Error_0x71
#ifdef SUN_H_HT0_Instruction_Access_MMU_Error_0x71
	 SUN_H_HT0_Instruction_Access_MMU_Error_0x71 
#else
        CUSTOM_TRAP(H_HT0_Instruction_Access_MMU_Error_0x71)
#endif
.align 32
#else
	NORMAL_TRAP(0x71); 
#endif

HT0_Data_Access_MMU_Error_0x72:		
#ifdef H_HT0_Data_Access_MMU_Error_0x72
#ifdef SUN_H_HT0_Data_Access_MMU_Error_0x72
	 SUN_H_HT0_Data_Access_MMU_Error_0x72 
#else
        CUSTOM_TRAP(H_HT0_Data_Access_MMU_Error_0x72)
#endif
.align 32
#else
	NORMAL_TRAP(0x72); 
#endif

HT0_Reserved_0x73:		
#ifdef H_HT0_Reserved_0x73
#ifdef SUN_H_HT0_Reserved_0x73
	 SUN_H_HT0_Reserved_0x73 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x73)
#endif
.align 32
#else
	NORMAL_TRAP(0x73); 
#endif

HT0_Control_Transfer_Instr_0x74:		
#ifdef H_HT0_Control_Transfer_Instr_0x74
#ifdef SUN_H_HT0_Control_Transfer_Instr_0x74
	 SUN_H_HT0_Control_Transfer_Instr_0x74 
#else
#	ifdef My_H_HT0_Control_Transfer_Instr_0x74
		My_H_HT0_Control_Transfer_Instr_0x74
#	else
	        CUSTOM_TRAP(HT0_Control_Transfer_Instr_0x74)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x74); 
#endif

HT0_Instruction_VA_Watchpoint_0x75:		
#ifdef H_HT0_Instruction_VA_Watchpoint_0x75
#ifdef SUN_H_HT0_Instruction_VA_Watchpoint_0x75
	 SUN_H_HT0_Instruction_VA_Watchpoint_0x75 
#else
        CUSTOM_TRAP(H_HT0_Instruction_VA_Watchpoint_0x75)
#endif
.align 32
#else
	NORMAL_TRAP(0x75); 
#endif

HT0_Instruction_Breakpoint_0x76:		
#ifdef H_HT0_Instruction_Breakpoint_0x76
#ifdef SUN_H_HT0_Instruction_Breakpoint_0x76
	 SUN_H_HT0_Instruction_Breakpoint_0x76 
#else
        CUSTOM_TRAP(H_HT0_Instruction_Breakpoint_0x76)
#endif
.align 32
#else
	NORMAL_TRAP(0x76); 
#endif

HT0_Reserved_0x77:		
#ifdef H_HT0_Reserved_0x77
#ifdef SUN_H_HT0_Reserved_0x77
	 SUN_H_HT0_Reserved_0x77 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x77)
#endif
.align 32
#else
	NORMAL_TRAP(0x77); 
#endif

HT0_Reserved_0x78:		
#ifdef H_HT0_Reserved_0x78
#ifdef SUN_H_HT0_Reserved_0x78
	 SUN_H_HT0_Reserved_0x78 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x78)
#endif
.align 32
#else
	NORMAL_TRAP(0x78); 
#endif

HT0_Reserved_0x79:		
#ifdef H_HT0_Reserved_0x79
#ifdef SUN_H_HT0_Reserved_0x79
	 SUN_H_HT0_Reserved_0x79 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x79)
#endif
.align 32
#else
	NORMAL_TRAP(0x79); 
#endif

HT0_Reserved_0x7a:		
#ifdef H_HT0_Reserved_0x7a
#ifdef SUN_H_HT0_Reserved_0x7a
	 SUN_H_HT0_Reserved_0x7a 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x7a)
#endif
.align 32
#else
	NORMAL_TRAP(0x7a); 
#endif

HT0_Reserved_0x7b:		
#ifdef H_HT0_Reserved_0x7b
#ifdef SUN_H_HT0_Reserved_0x7b
	 SUN_H_HT0_Reserved_0x7b 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x7b)
#endif
.align 32
#else
	NORMAL_TRAP(0x7b); 
#endif

HT0_Reserved_0x7c:		
#ifdef H_HT0_Reserved_0x7c
#ifdef SUN_H_HT0_Reserved_0x7c
	 SUN_H_HT0_Reserved_0x7c 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x7c)
#endif
.align 32
#else
	NORMAL_TRAP(0x7c); 
#endif

HT0_Reserved_0x7d:		
#ifdef H_HT0_Reserved_0x7d
#ifdef SUN_H_HT0_Reserved_0x7d
	 SUN_H_HT0_Reserved_0x7d 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x7d)
#endif
.align 32
#else
	NORMAL_TRAP(0x7d); 
#endif

HT0_Reserved_0x7e:		
#ifdef H_HT0_Reserved_0x7e
#ifdef SUN_H_HT0_Reserved_0x7e
	 SUN_H_HT0_Reserved_0x7e 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x7e)
#endif
.align 32
#else
	NORMAL_TRAP(0x7e); 
#endif

HT0_Reserved_0x7f:		
#ifdef H_HT0_Reserved_0x7f
#ifdef SUN_H_HT0_Reserved_0x7f
	 SUN_H_HT0_Reserved_0x7f 
#else
        CUSTOM_TRAP(H_HT0_Reserved_0x7f)
#endif
.align 32
#else
	NORMAL_TRAP(0x7f)
#endif

HT0_Window_Spill_0_Normal_0x80:		
#ifdef H_HT0_Window_Spill_0_Normal_Trap
#ifdef SUN_H_HT0_Window_Spill_0_Normal_Trap
	 SUN_H_HT0_Window_Spill_0_Normal_Trap 
#else
#	ifdef My_HT0_Window_Spill_0_Normal_Trap
		My_HT0_Window_Spill_0_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_0_Normal_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0x80)
#endif

.align 128	
HT0_Window_Spill_1_Normal_0x84:		
#ifdef H_HT0_Window_Spill_1_Normal_Trap
#ifdef SUN_H_HT0_Window_Spill_1_Normal_Trap
	 SUN_H_HT0_Window_Spill_1_Normal_Trap 
#else
#	ifdef My_HT0_Window_Spill_1_Normal_Trap
		My_HT0_Window_Spill_1_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_1_Normal_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0x84)
#endif

.align 128	
HT0_Window_Spill_2_Normal_0x88:		
#ifdef H_HT0_Window_Spill_2_Normal_Trap
#ifdef SUN_H_HT0_Window_Spill_2_Normal_Trap
	 SUN_H_HT0_Window_Spill_2_Normal_Trap 
#else
#	ifdef My_HT0_Window_Spill_2_Normal_Trap
		My_HT0_Window_Spill_2_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_2_Normal_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0x88)
#endif

.align 128	
HT0_Window_Spill_3_Normal_0x8c:		
#ifdef H_HT0_Window_Spill_3_Normal_Trap
#ifdef SUN_H_HT0_Window_Spill_3_Normal_Trap
	 SUN_H_HT0_Window_Spill_3_Normal_Trap 
#else
#	ifdef My_HT0_Window_Spill_3_Normal_Trap
		My_HT0_Window_Spill_3_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_3_Normal_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0x8c)
#endif

.align 128	
HT0_Window_Spill_4_Normal_0x90:
#ifdef H_HT0_Window_Spill_4_Normal_Trap
#ifdef SUN_H_HT0_Window_Spill_4_Normal_Trap
	 SUN_H_HT0_Window_Spill_4_Normal_Trap 
#else
#	ifdef My_HT0_Window_Spill_4_Normal_Trap
		My_HT0_Window_Spill_4_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_4_Normal_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0x90)
#endif

.align 128	
HT0_Window_Spill_5_Normal_0x94:
#ifdef H_HT0_Window_Spill_5_Normal_Trap
#ifdef SUN_H_HT0_Window_Spill_5_Normal_Trap
	 SUN_H_HT0_Window_Spill_5_Normal_Trap 
#else
#	ifdef My_HT0_Window_Spill_5_Normal_Trap
		My_HT0_Window_Spill_5_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_5_Normal_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0x94)
#endif

.align 128	
HT0_Window_Spill_6_Normal_0x98:
#ifdef H_HT0_Window_Spill_6_Normal_Trap
#ifdef SUN_H_HT0_Window_Spill_6_Normal_Trap
	 SUN_H_HT0_Window_Spill_6_Normal_Trap 
#else
#	ifdef My_HT0_Window_Spill_6_Normal_Trap
		My_HT0_Window_Spill_6_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_6_Normal_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0x98)
#endif

.align 128	
HT0_Window_Spill_7_Normal_0x9c:
#ifdef H_HT0_Window_Spill_7_Normal_Trap
#ifdef SUN_H_HT0_Window_Spill_7_Normal_Trap
	 SUN_H_HT0_Window_Spill_7_Normal_Trap 
#else
#	ifdef My_HT0_Window_Spill_7_Normal_Trap
		My_HT0_Window_Spill_7_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_7_Normal_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0x9c)
#endif

.align 128
HT0_Window_Spill_0_Other_0xa0:		
#ifdef H_HT0_Window_Spill_0_Other_Trap
#ifdef SUN_H_HT0_Window_Spill_0_Other_Trap
	 SUN_H_HT0_Window_Spill_0_Other_Trap 
#else
#	ifdef My_HT0_Window_Spill_0_Other_Trap
		My_HT0_Window_Spill_0_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_0_Other_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0xa0)
#endif

.align 128
HT0_Window_Spill_1_Other_0xa4:		
#ifdef H_HT0_Window_Spill_1_Other_Trap
#ifdef SUN_H_HT0_Window_Spill_1_Other_Trap
	 SUN_H_HT0_Window_Spill_1_Other_Trap 
#else
#	ifdef My_HT0_Window_Spill_1_Other_Trap
		My_HT0_Window_Spill_1_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_1_Other_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0xa4)
#endif

.align 128
HT0_Window_Spill_2_Other_0xa8:		
#ifdef H_HT0_Window_Spill_2_Other_Trap
#ifdef SUN_H_HT0_Window_Spill_2_Other_Trap
	 SUN_H_HT0_Window_Spill_2_Other_Trap 
#else
#	ifdef My_HT0_Window_Spill_2_Other_Trap
		My_HT0_Window_Spill_2_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_2_Other_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0xa8)
#endif

.align 128
HT0_Window_Spill_3_Other_0xac:
#ifdef H_HT0_Window_Spill_3_Other_Trap
#ifdef SUN_H_HT0_Window_Spill_3_Other_Trap
	 SUN_H_HT0_Window_Spill_3_Other_Trap 
#else
#	ifdef My_HT0_Window_Spill_3_Other_Trap
		My_HT0_Window_Spill_3_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_3_Other_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0xac)
#endif

.align 128
HT0_Window_Spill_4_Other_0xb0:
#ifdef H_HT0_Window_Spill_4_Other_Trap
#ifdef SUN_H_HT0_Window_Spill_4_Other_Trap
	 SUN_H_HT0_Window_Spill_4_Other_Trap 
#else
#	ifdef My_HT0_Window_Spill_4_Other_Trap
		My_HT0_Window_Spill_4_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_4_Other_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0xb0)
#endif

.align 128
HT0_Window_Spill_5_Other_0xb4:
#ifdef H_HT0_Window_Spill_5_Other_Trap
#ifdef SUN_H_HT0_Window_Spill_5_Other_Trap
	 SUN_H_HT0_Window_Spill_5_Other_Trap 
#else
#	ifdef My_HT0_Window_Spill_5_Other_Trap
		My_HT0_Window_Spill_5_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_5_Other_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0xb4)
#endif

.align 128
HT0_Window_Spill_6_Other_0xb8:
#ifdef H_HT0_Window_Spill_6_Other_Trap
#ifdef SUN_H_HT0_Window_Spill_6_Other_Trap
	 SUN_H_HT0_Window_Spill_6_Other_Trap 
#else
#	ifdef My_HT0_Window_Spill_6_Other_Trap
		My_HT0_Window_Spill_6_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_6_Other_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0xb8)
#endif

.align 128
HT0_Window_Spill_7_Other_0xbc:
#ifdef H_HT0_Window_Spill_7_Other_Trap
#ifdef SUN_H_HT0_Window_Spill_7_Other_Trap
	 SUN_H_HT0_Window_Spill_7_Other_Trap 
#else
#	ifdef My_HT0_Window_Spill_7_Other_Trap
		My_HT0_Window_Spill_7_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Spill_7_Other_Trap)
#	endif
#endif
#else
	SPILL_TRAP(0xbc)
#endif

.align 128
HT0_Window_Fill_0_Normal_0xc0:
#ifdef H_HT0_Window_Fill_0_Normal_Trap
#ifdef SUN_H_HT0_Window_Fill_0_Normal_Trap
	 SUN_H_HT0_Window_Fill_0_Normal_Trap 
#else
#	ifdef My_HT0_Window_Fill_0_Normal_Trap
		My_HT0_Window_Fill_0_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_0_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xc0)
#endif
#endif

.align 128
HT0_Window_Fill_1_Normal_0xc4:
#ifdef H_HT0_Window_Fill_1_Normal_Trap
#ifdef SUN_H_HT0_Window_Fill_1_Normal_Trap
	 SUN_H_HT0_Window_Fill_1_Normal_Trap 
#else
#	ifdef My_HT0_Window_Fill_1_Normal_Trap
		My_HT0_Window_Fill_1_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_1_Normal_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xc4)
#endif

.align 128
HT0_Window_Fill_2_Normal_0xc8:
#ifdef H_HT0_Window_Fill_2_Normal_Trap
#ifdef SUN_H_HT0_Window_Fill_2_Normal_Trap
	 SUN_H_HT0_Window_Fill_2_Normal_Trap 
#else
#	ifdef My_HT0_Window_Fill_2_Normal_Trap
		My_HT0_Window_Fill_2_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_2_Normal_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xc8)
#endif

.align 128
HT0_Window_Fill_3_Normal_0xcc:
#ifdef H_HT0_Window_Fill_3_Normal_Trap
#ifdef SUN_H_HT0_Window_Fill_3_Normal_Trap
	 SUN_H_HT0_Window_Fill_3_Normal_Trap 
#else
#	ifdef My_HT0_Window_Fill_3_Normal_Trap
		My_HT0_Window_Fill_3_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_3_Normal_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xcc)
#endif

.align 128
HT0_Window_Fill_4_Normal_0xd0:
#ifdef H_HT0_Window_Fill_4_Normal_Trap
#ifdef SUN_H_HT0_Window_Fill_4_Normal_Trap
	 SUN_H_HT0_Window_Fill_4_Normal_Trap 
#else
#	ifdef My_HT0_Window_Fill_4_Normal_Trap
		My_HT0_Window_Fill_4_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_4_Normal_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xd0)
#endif

.align 128
HT0_Window_Fill_5_Normal_0xd4:
#ifdef H_HT0_Window_Fill_5_Normal_Trap
#ifdef SUN_H_HT0_Window_Fill_5_Normal_Trap
	 SUN_H_HT0_Window_Fill_5_Normal_Trap 
#else
#	ifdef My_HT0_Window_Fill_5_Normal_Trap
		My_HT0_Window_Fill_5_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_5_Normal_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xd4)
#endif

.align 128
HT0_Window_Fill_6_Normal_0xd8:
#ifdef H_HT0_Window_Fill_6_Normal_Trap
#ifdef SUN_H_HT0_Window_Fill_6_Normal_Trap
	 SUN_H_HT0_Window_Fill_6_Normal_Trap 
#else
#	ifdef My_HT0_Window_Fill_6_Normal_Trap
		My_HT0_Window_Fill_6_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_6_Normal_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xd8)
#endif

.align 128
HT0_Window_Fill_7_Normal_0xdc:
#ifdef H_HT0_Window_Fill_7_Normal_Trap
#ifdef SUN_H_HT0_Window_Fill_7_Normal_Trap
	 SUN_H_HT0_Window_Fill_7_Normal_Trap 
#else
#	ifdef My_HT0_Window_Fill_7_Normal_Trap
		My_HT0_Window_Fill_7_Normal_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_7_Normal_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xdc)
#endif

.align 128
HT0_Window_Fill_0_Other_0xe0:
#ifdef H_HT0_Window_Fill_0_Other_Trap
#ifdef SUN_H_HT0_Window_Fill_0_Other_Trap
	 SUN_H_HT0_Window_Fill_0_Other_Trap 
#else
#	ifdef My_HT0_Window_Fill_0_Other_Trap
		My_HT0_Window_Fill_0_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_0_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xe0)
#endif

.align 128
HT0_Window_Fill_1_Other_0xe4:
#ifdef H_HT0_Window_Fill_1_Other_Trap
#ifdef SUN_H_HT0_Window_Fill_1_Other_Trap
	 SUN_H_HT0_Window_Fill_1_Other_Trap 
#else
#	ifdef My_HT0_Window_Fill_1_Other_Trap
		My_HT0_Window_Fill_1_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_1_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xe4)
#endif

.align 128
HT0_Window_Fill_2_Other_0xe8:
#ifdef H_HT0_Window_Fill_2_Other_Trap
#ifdef SUN_H_HT0_Window_Fill_2_Other_Trap
	 SUN_H_HT0_Window_Fill_2_Other_Trap 
#else
#	ifdef My_HT0_Window_Fill_2_Other_Trap
		My_HT0_Window_Fill_2_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_2_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xe8)
#endif

.align 128
HT0_Window_Fill_3_Other_0xec:
#ifdef H_HT0_Window_Fill_3_Other_Trap
#ifdef SUN_H_HT0_Window_Fill_3_Other_Trap
	 SUN_H_HT0_Window_Fill_3_Other_Trap 
#else
#	ifdef My_HT0_Window_Fill_3_Other_Trap
		My_HT0_Window_Fill_3_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_3_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xec)
#endif

.align 128
HT0_Window_Fill_4_Other_0xf0:
#ifdef H_HT0_Window_Fill_4_Other_Trap
#ifdef SUN_H_HT0_Window_Fill_4_Other_Trap
	 SUN_H_HT0_Window_Fill_4_Other_Trap 
#else
#	ifdef My_HT0_Window_Fill_4_Other_Trap
		My_HT0_Window_Fill_4_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_4_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xf0)
#endif

.align 128
HT0_Window_Fill_5_Other_0xf4:
#ifdef H_HT0_Window_Fill_5_Other_Trap
#ifdef SUN_H_HT0_Window_Fill_5_Other_Trap
	 SUN_H_HT0_Window_Fill_5_Other_Trap 
#else
#	ifdef My_HT0_Window_Fill_5_Other_Trap
		My_HT0_Window_Fill_5_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_5_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xf4)
#endif

.align 128
HT0_Window_Fill_6_Other_0xf8:
#ifdef H_HT0_Window_Fill_6_Other_Trap
#ifdef SUN_H_HT0_Window_Fill_6_Other_Trap
	 SUN_H_HT0_Window_Fill_6_Other_Trap 
#else
#	ifdef My_HT0_Window_Fill_6_Other_Trap
		My_HT0_Window_Fill_6_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_6_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xf8)
#endif

.align 128
HT0_Window_Fill_7_Other_0xfc:
#ifdef H_HT0_Window_Fill_7_Other_Trap
#ifdef SUN_H_HT0_Window_Fill_7_Other_Trap
	 SUN_H_HT0_Window_Fill_7_Other_Trap 
#else
#	ifdef My_HT0_Window_Fill_7_Other_Trap
		My_HT0_Window_Fill_7_Other_Trap
#	else
		CUSTOM_TRAP(H_HT0_Window_Fill_7_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xfc)
#endif

.align 128
HT0_GoodTrap_0x100:
    wrpr 0, %tl
    ta T_HGOOD_TRAP;nop;nop;nop;nop;nop;nop         ! N2 N2 N2 N2


HT0_BadTrap_0x101:
    wrpr 0, %tl
#ifdef EXPECT_BAD_TRAP
	ta T_GOOD_TRAP; nop;nop;nop;nop;nop;nop
#else		
	ta T_HBAD_TRAP; nop;nop;nop;nop;nop;nop
#endif
	
HT0_ChangePriv_0x102:
#ifdef H_HT0_ChangePriv_0x102
#ifdef SUN_H_HT0_ChangePriv_0x102
         SUN_H_HT0_ChangePriv_0x102
#else
                CUSTOM_TRAP(H_HT0_ChangePriv_0x102)
#endif
#else
        rdpr    %tstate, %g1
        or      %g1, 0x400, %g2
        wrpr    %g0, %g2, %tstate
        done
        nop
        nop
        nop
        nop

#endif
	
HT0_ChangeNonPriv_0x103:
#ifdef H_HT0_ChangeNonPriv_0x103
#ifdef SUN_H_HT0_ChangeNonPriv_0x103
         SUN_H_HT0_ChangeNonPriv_0x103
#else
                CUSTOM_TRAP(H_HT0_ChangeNonPriv_0x103)
#endif
#else
        rdpr    %tstate, %g1
        andn    %g1, 0x400, %g2
        wrpr    %g0, %g2, %tstate
        done
        nop
        nop
        nop
        nop
#endif

HT0_ChangeToTL1_0x104:
	wrpr %g0, 1, %gl
        rdpr    %tnpc, %g1
	wrpr %g0, 1, %tl
	jmp	%g1
	nop
	nop
	nop
	nop
	
HT0_ChangeToTL0_0x105:
#ifdef H_HT0_ChangeToTL0_0x105
#ifdef SUN_H_HT0_ChangeToTL0_0x105
	 SUN_H_HT0_ChangeToTL0_0x105 
#else
	CUSTOM_TRAP(H_HT0_ChangeToTL0_0x105)
#endif
#else
	rdpr %tstate, %g1
	rdpr %tpc, %g2
	rdpr %tnpc, %g3
	wrpr %g0, 1, %tl
	wrpr %g1, 0, %tstate
	wrpr %g2, 0, %tpc
	wrpr %g3, 0, %tnpc
	done
#endif
	
HT0_ChangeToTL0_0x106:
#ifdef H_HT0_ChangeToTL0_0x106
#ifdef SUN_H_HT0_ChangeToTL0_0x106
	 SUN_H_HT0_ChangeToTL0_0x106 
#else
	CUSTOM_TRAP(H_HT0_ChangeToTL0_0x106)
#endif
#else
	rdpr %tstate, %g1
	rdpr %tpc, %g2
	rdpr %tnpc, %g3
	rdpr %tt, %g4
	done
#endif
	
HT0_ChangeToTL0_0x107:
#ifdef H_HT0_ChangeToTL0_0x107
#ifdef SUN_H_HT0_ChangeToTL0_0x107
	 SUN_H_HT0_ChangeToTL0_0x107 
#else
	CUSTOM_TRAP(H_HT0_ChangeToTL0_0x107)
#endif
#else
	rdpr %tstate, %g1
	rdpr %tpc, %g2
	rdpr %tnpc, %g3
	rdpr %tt, %g4
	done
#endif
	
.align 128
HT0_TrapEn_0x108:
!  emulate priv trap	
	setx	htrap_enable_data, %g2, %g1
	mov     0x800, %g2
	add	%o0, %o0, %o0
	sth	%g2, [%g1+%o0]
	done

.align 64
HT0_TrapDis_0x10a:	
!  emulate priv trap	
	setx	htrap_enable_data, %g2, %g1
	mov     0, %g2
	add	%o0, %o0, %o0
	sth	%g2, [%g1+%o0]
	done

.align 64
HT0_TrapEn_Ntimes_0x10c:	
	setx	htrap_enable_data, %g2, %g1
	add	%o0, %o0, %o0
	sth	%o1, [%g1+%o0]
	done

.align 128
HT0_PThreadMutexLock_0x110:
#ifdef H_HT0_PThreadMutexLock_0x110
#ifdef SUN_H_HT0_PThreadMutexLock_0x110
         SUN_H_HT0_PThreadMutexLock_0x110
#else
        CUSTOM_TRAP(H_HT0_PThreadMutexLock_0x110)
#endif
#else
	rdpr	%tl, %g2
	cmp	%g2, 2
	bne,a	.+8
	or	%i0, %g0, %g1
	setx	hpthread_mutex_data, %g2, %g3
pt_retry:	
	ldstub	[%g3+%g1], %g2
	brz	%g2, pt_done
	nop
pt_loop:
	ldub	[%g3+%g1], %g2
	brnz	%g2, pt_loop
	nop
	ba,a	pt_retry
pt_done:
	membar	#LoadLoad | #LoadStore
	done
#endif

HT0_ChangeToTL0_0x111:
#ifdef H_HT0_ChangeToTL0_0x111
#ifdef SUN_HT0_ChangeToTL0_0x111
         SUN_HT0_ChangeToTL0_0x111
#else
        CUSTOM_TRAP(H_HT0_ChangeToTL0_0x111)
#endif
#else
	done
	nop
#endif

.align 128
HT0_PThreadMutexUnLock_0x114:	
	setx	hpthread_mutex_data, %g2, %g5
	stub	%g0, [%g5+%g1]
	done
	
.align 64
HT0_Trap_Sync_0x116:
	
	setx	hpthread_counter_data, %g1, %g4
	rdpr	%tpc, %g2
	rdpr	%tnpc,%g3
	mov     %g3, %g1
	add	%g2, 60, %g2
	add	%g3, 60, %g3
	wrpr	%g2, 0, %tpc  ! set %tcp/%tnpc
	wrpr	%g3, 0, %tnpc
	jmp	%g1           ! %g1 is original %tnpc
	nop

	
.align 64
HT0_Trap_Function_0x118:
! call kernel dervice routine	
	mov	0x0,	%o0
	done
	.word 0x118
	nop
	nop
	nop
	nop
	nop

.align 512
HT0_Trap_Function_0x120:
! call kernel dervice routine	
! switch to hpriv, from hpriv
	done
	.word 0x120
	nop
	nop
	nop
	nop
	nop
	nop
	
.align 64
HT0_Trap_Function_0x122:
    ! Switch to non-hpriv
	rdhpr	%htstate, %g1
	andn    %g1, 0x4, %g2
	wrhpr	%g0, %g2, %htstate
	done
	.word 0x122
	nop
	nop
	nop
	
.align 64
HT0_Trap_Function_0x124:
	setx	htrap_enable_data, %g2, %g1
	mov     0x800, %g2
	add	%o0, %o0, %o0
	sth	%g2, [%g1+%o0]
	done

.align 64	
HT0_Trap_Function_0x126:
	setx	htrap_enable_data, %g2, %g1
	mov     0, %g2
	add	%o0, %o0, %o0
	sth	%g2, [%g1+%o0]
	done

.align 64
HT0_Trap_Function_0x128:	
	setx	htrap_enable_data, %g2, %g1
	add	%o0, %o0, %o0
	sth	%o1, [%g1+%o0]
	done

.align 64
! Function to set PCONTEXT, SCONTEXT,
! pstate.priv, hpstate.hpriv and
! jump to target address.
! Caller should pass argument as:
! %o1    = PCONTEXT
! %o2    = SCONTEXT
! %o3[0] = desired pstate.priv value
! %o4[0] = desired hpstate.hpriv value
! %o5    = target VA
HT0_Trap_Function_0x12a:	
	mov	0x08, %g1
	stxa	%o1, [%g1] 0x21	! set PCONTEXT
	mov	0x10, %g1
	stxa	%o2, [%g1] 0x21	! set SCONTEXT
	xor	%o3, 0x1, %o3	! invert bit so that later can
	xor	%o4, 0x1, %o4	!    be xor'ed using wrpr 
	sllx	%o3, 10, %o3	! align priv bit
	sllx	%o4, 2, %o4	! align hpriv bit
	rdpr 	%tstate, %g1
	or	%g1, 0x400, %g1
	wrpr	%g1, %o3, %tstate
	rdhpr 	%htstate, %g1
	or	%g1, 0x4, %g1
	wrhpr	%g1, %o4, %htstate
	wrpr	%o5, %g0, %tnpc
	done
	nop
	nop

.align 64
! Function to read thread ID from the
! ASI_CMP_INTR_ID (same as ASI_CMP_CORE_ID in N2)
! Value is returned in %o1.
HT0_RdThId_0x12e:
    ldxa    [%g0]ASI_INTR_ID, %o1
#ifdef SIXGUNS
    !! 6-core relative TID - values 0-47 only ..
    ldxa [%g0]ASI_CMP_CORE, %o2 ! Core-Avail              
    not %g0, %g1                ! Starting mask         
    sllx %g1, %o1, %g1          ! Mask all higher threads than me
    not %g1
    andn %g1,%o2,%o2            ! %o1 is 1s for missing tids
    popc %o2, %g1               ! Number of missing tids which
                                ! are less than mytid
    sub %o1, %g1, %o1           ! Reduce TID by missing count 
#else
#ifdef PORTABLE_CORE
    and     %o1, 0x07, %o1
#endif
#endif
	done
	nop

.align 512
HT0_Trap_Instruction_0x130:
#ifdef H_HT0_Trap_Instruction_0
#ifdef SUN_H_HT0_Trap_Instruction_0
	 SUN_H_HT0_Trap_Instruction_0 
#else
#	ifdef My_HT0_Trap_Instruction_0
		My_HT0_Trap_Instruction_0
#	else
		CUSTOM_TRAP(H_HT0_Trap_Instruction_0)
#	endif
#endif
#else
	NORMAL_TRAP(0x130);
#endif

.align 32
HT0_Trap_Instruction_0x131:
#ifdef H_HT0_Trap_Instruction_1
#ifdef SUN_H_HT0_Trap_Instruction_1
	 SUN_H_HT0_Trap_Instruction_1 
#else
#	ifdef My_HT0_Trap_Instruction_1
		My_HT0_Trap_Instruction_1
#	else
		CUSTOM_TRAP(H_HT0_Trap_Instruction_1)
#	endif
#endif
#else
	NORMAL_TRAP(0x131);
#endif

.align 32
HT0_Trap_Instruction_0x132:
#ifdef H_HT0_Trap_Instruction_2
#ifdef SUN_H_HT0_Trap_Instruction_2
	 SUN_H_HT0_Trap_Instruction_2 
#else
#	ifdef My_HT0_Trap_Instruction_2
		My_HT0_Trap_Instruction_2
#	else
		CUSTOM_TRAP(H_HT0_Trap_Instruction_2)
#	endif
#endif
#else
	NORMAL_TRAP(0x132);
#endif

.align 32
HT0_Trap_Instruction_0x133:
#ifdef H_HT0_Trap_Instruction_3
#ifdef SUN_H_HT0_Trap_Instruction_3
	 SUN_H_HT0_Trap_Instruction_3 
#else
#	ifdef My_HT0_Trap_Instruction_3
		My_HT0_Trap_Instruction_3
#	else
		CUSTOM_TRAP(H_HT0_Trap_Instruction_3)
#	endif
#endif
#else
	NORMAL_TRAP(0x133);
#endif

.align 32
HT0_Trap_Instruction_0x134:
#ifdef H_HT0_Trap_Instruction_4
#ifdef SUN_H_HT0_Trap_Instruction_4
	 SUN_H_HT0_Trap_Instruction_4 
#else
#	ifdef My_HT0_Trap_Instruction_4
		My_HT0_Trap_Instruction_4
#	else
		CUSTOM_TRAP(H_HT0_Trap_Instruction_4)
#	endif
#endif
#else
	NORMAL_TRAP(0x134);
#endif

.align 32
HT0_Trap_Instruction_0x135:
#ifdef H_HT0_Trap_Instruction_5
#ifdef SUN_H_HT0_Trap_Instruction_5
	 SUN_H_HT0_Trap_Instruction_5
#else
#	ifdef My_HT0_Trap_Instruction_5
		My_HT0_Trap_Instruction_5
#	else
		CUSTOM_TRAP(H_HT0_Trap_Instruction_5)
#	endif
#endif
#else
	NORMAL_TRAP(0x135);
#endif


	
.align 128	
	
HT0_Trap_0x138:
	NORMAL_TRAP(0x138);
.align 128	

HT0_Trap_0x13c:
	NORMAL_TRAP(0x13c);
.align 128	
	
HT0_Trap_0x140:
	NORMAL_TRAP(0x140);
.align 128	
	
HT0_Trap_0x144:
	NORMAL_TRAP(0x144);
.align 128	
	
HT0_Trap_0x148:
	NORMAL_TRAP(0x148);
.align 128	
	
HT0_Trap_0x14c:
	NORMAL_TRAP(0x14c);
.align 128	
	
HT0_Trap_0x150:
	NORMAL_TRAP(0x150);
.align 128	
	
HT0_Trap_0x154:
	NORMAL_TRAP(0x154);
.align 128	
	
HT0_Trap_0x158:
	NORMAL_TRAP(0x158);
.align 128	
	
HT0_Trap_0x15c:
	NORMAL_TRAP(0x15c);
.align 128	
	
HT0_Trap_0x160:
	NORMAL_TRAP(0x160);
.align 128	
	
HT0_Trap_0x164:
	NORMAL_TRAP(0x164);
.align 128	
	
HT0_Trap_0x168:
	NORMAL_TRAP(0x168);
.align 128	
	
HT0_Trap_0x16c:
	NORMAL_TRAP(0x16c);
.align 128	
	
HT0_Trap_0x170:
	NORMAL_TRAP(0x170);
.align 128	
	
HT0_Trap_0x174:
	NORMAL_TRAP(0x174);
.align 128	
	
HT0_Trap_0x178:
	NORMAL_TRAP(0x178);
.align 128	
	
HT0_Trap_0x17c:
	NORMAL_TRAP(0x17c);
.align 128	
HT0_ChangePriv_0x180:
	rdpr	%tl, %g1
	sub	%g1, 1, %g1
	wrpr	%g1, %tl
	rdhpr	%htstate, %g1
	or	%g1, 0x4, %g2
	wrhpr	%g0, %g2, %htstate
	done
	.word 0x180
	nop
	
.align 64
HT0_ChangeNonPriv_0x182:
	rdpr	%tl, %g1
	sub	%g1, 1, %g1
	wrpr	%g1, %tl
	rdhpr	%htstate, %g1
	andn    %g1, 0x4, %g2
	wrhpr	%g0, %g2, %htstate
	done
	.word 0x182
	nop
	nop
	
.align 64
HT0_TrapEn_0x184:
	setx	htrap_enable_data, %g2, %g1
	mov     0x800, %g2
	add	%o0, %o0, %o0
	sth	%g2, [%g1+%o0]
	done
	.word 0x184

.align 64
HT0_TrapDis_0x186:      
#ifdef H_HT0_Trap_Instruction_56
#ifdef SUN_H_HT0_Trap_Instruction_56
         SUN_H_HT0_Trap_Instruction_56
#else
#       ifdef My_HT0_Trap_Instruction_56
                My_HT0_Trap_Instruction_56
#       else
                CUSTOM_TRAP(H_HT0_Trap_Instruction_56)
#       endif
#endif
#else
        setx    htrap_enable_data, %g2, %g1
        mov     0, %g2
        add     %o0, %o0, %o0
        sth     %g2, [%g1+%o0]
        done
        .word 0x186
#endif

.align 64
HT0_TrapEn_Ntimes_0x188:
	setx	htrap_enable_data, %g2, %g1
	add	%o0, %o0, %o0
	sth	%o1, [%g1+%o0]
	done
	.word 0x188

.align 64
! Function to set PCONTEXT, SCONTEXT,
! pstate.priv, hpstate.hpriv and
! jump to target address.
! Caller should pass argument as:
! %o1    = PCONTEXT
! %o2    = SCONTEXT
! %o3[0] = desired pstate.priv value
! %o4[0] = desired hpstate.hpriv value
! %o5    = target VA
HT0_ChangeCtx_0x18a:	
	rdpr	%tl, %g1
	sub	%g1, 1, %g1
	wrpr	%g1, %tl
	mov	0x08, %g1
	stxa	%o1, [%g1] 0x21	! set PCONTEXT
	mov	0x10, %g1
	stxa	%o2, [%g1] 0x21	! set SCONTEXT
	mov	0x108, %g1
	stxa	%o6, [%g1] 0x21	! set PCONTEXT1
	mov	0x110, %g1
	stxa	%o7, [%g1] 0x21	! set SCONTEXT1
	xor	%o3, 0x1, %o3	! invert bit so that later can
	xor	%o4, 0x1, %o4	!    be xor'ed using wrpr 
	sllx	%o3, 10, %o3	! align priv bit
	sllx	%o4, 2, %o4	! align hpriv bit
	rdpr 	%tstate, %g1
	or	%g1, 0x400, %g1
	wrpr	%g1, %o3, %tstate
	rdhpr 	%htstate, %g1
	or	%g1, 0x4, %g1
	wrhpr	%g1, %o4, %htstate
	wrpr	%o5, %g0, %tnpc
#ifndef NO_EOB_MARKER
! $EV trig_pc_d(1,@VA(.HTRAPS.end_of_ctxswitch)) -> marker(bootEnd, *, 1)
#ifdef SEND_BOOT_TRACE_TO_SSI
setx  0xfffff00000, %i0, %i1
sub  %g0, 1, %i3
sth  %i3, [%i1]
#endif
#endif
end_of_ctxswitch:
	done
	nop

.align 64
! Function to read thread ID from the
! ASI_CMP_INTR_ID (same as ASI_CMP_CORE_ID in N2)
! Value is returned in %o1.
HT0_RdThId_0x18e:
    ldxa    [%g0]ASI_INTR_ID, %o1
#ifdef SIXGUNS
    !! 6-core relative TID - values 0-47 only ..
    ldxa [%g0]ASI_CMP_CORE, %o2 ! Core-Avail              
    not %g0, %g1                ! Starting mask         
    sllx %g1, %o1, %g1          ! Mask all higher threads than me
    not %g1
    andn %g1,%o2,%o2            ! %o1 is 1s for missing tids
    popc %o2, %g1               ! Number of missing tids which
                                ! are less than mytid
    sub %o1, %g1, %o1           ! Reduce TID by missing count 
#else
#ifdef PORTABLE_CORE
    and     %o1, 0x07, %o1
#endif
#endif
	done
	nop

.align 64
HT0_Trap_Instruction_0x190:
#ifdef H_HT0_HTrap_Instruction_0
#ifdef SUN_H_HT0_HTrap_Instruction_0
	 SUN_H_HT0_HTrap_Instruction_0 
#else
#	ifdef My_HT0_HTrap_Instruction_0
		My_HT0_HTrap_Instruction_0
#	else
		CUSTOM_TRAP(H_HT0_HTrap_Instruction_0)
#	endif
#endif
#else
	NORMAL_TRAP(0x190);
#endif

.align 32
HT0_Trap_Instruction_0x191:
#ifdef H_HT0_HTrap_Instruction_1
#ifdef SUN_H_HT0_HTrap_Instruction_1
	 SUN_H_HT0_HTrap_Instruction_1 
#else
#	ifdef My_HT0_HTrap_Instruction_1
		My_HT0_HTrap_Instruction_1
#	else
		CUSTOM_TRAP(H_HT0_HTrap_Instruction_1)
#	endif
#endif
#else
	NORMAL_TRAP(0x191);
#endif

.align 32
HT0_Trap_Instruction_0x192:
#ifdef H_HT0_HTrap_Instruction_2
#ifdef SUN_H_HT0_HTrap_Instruction_2
	 SUN_H_HT0_HTrap_Instruction_2 
#else
#	ifdef My_HT0_HTrap_Instruction_2
		My_HT0_HTrap_Instruction_2
#	else
		CUSTOM_TRAP(H_HT0_HTrap_Instruction_2)
#	endif
#endif
#else
	NORMAL_TRAP(0x192);
#endif

.align 32
HT0_Trap_Instruction_0x193:
#ifdef H_HT0_HTrap_Instruction_3
#ifdef SUN_H_HT0_HTrap_Instruction_3
	 SUN_H_HT0_HTrap_Instruction_3
#else
#	ifdef My_HT0_HTrap_Instruction_3
		My_HT0_HTrap_Instruction_3
#	else
		CUSTOM_TRAP(H_HT0_HTrap_Instruction_3)
#	endif
#endif
#else
	NORMAL_TRAP(0x193);
#endif

.align 32
HT0_Trap_Instruction_0x194:
#ifdef H_HT0_HTrap_Instruction_4
#ifdef SUN_H_HT0_HTrap_Instruction_4
	 SUN_H_HT0_HTrap_Instruction_4 
#else
#	ifdef My_HT0_HTrap_Instruction_4
		My_HT0_HTrap_Instruction_4
#	else
		CUSTOM_TRAP(H_HT0_HTrap_Instruction_4)
#	endif
#endif
#else
	NORMAL_TRAP(0x194);
#endif

.align 32
HT0_Trap_Instruction_0x195:
#ifdef H_HT0_HTrap_Instruction_5
#ifdef SUN_H_HT0_HTrap_Instruction_5
	 SUN_H_HT0_HTrap_Instruction_5
#else
#	ifdef My_HT0_HTrap_Instruction_5
		My_HT0_HTrap_Instruction_5
#	else
		CUSTOM_TRAP(H_HT0_HTrap_Instruction_5)
#	endif
#endif
#else
	NORMAL_TRAP(0x195);
#endif

.align 32
! (0x196)
    nop

.align 32
! (0x197)
    nop

.align 32
! (0x198)
    nop

.align 32
! (0x199)
    nop

.align 32
! (0x19a)
    nop

.align 32
! (0x19b)
    nop

.align 32
! (0x19c)
    nop

.align 32
! (0x19d)
    nop

.align 32
! (0x19e)
    nop

.align 32
! (0x19f)
    nop

.align 32
! (0x1a0)

HT0_GoodTrap_0x1a0:
#ifdef ASI_CHECK_GOODTRAP
    call asi_check_start
    nop
#endif
#ifdef EXIT_SYNC
    call exit_sync_thread_start
    nop
#endif
old_good_trap:
#ifdef SSI_STATUS
    ! this externally signals good/bad per thread for tester
    ![15:8]  lower tic reg bits
    ![7]     good/bad 1/0
    ![6:0]   tid

    ! get TID 0-63
    ldxa    [%g0]ASI_INTR_ID, %o1
#ifdef PORTABLE_CORE
    ! TID is now 0-7
    and     %o1, 0x07, %o1
#else
    nop
#endif

    rd %tick, %g3
    sllx %g3, 8, %g3
    or %o1, %g3, %o1   
    !or %o1, 0x80, %o1 ! only if BAD
    
    ! show TID and good/bad on SSI
    sth %o1, [%g0-0x100]
good_trap: 
    ba good_trap
    nop
#else
   
#ifdef PARK_ON_GOODTRAP
    ldxa    [%g0]ASI_INTR_ID, %g1    ! Get TID
    mov 1, %g2
    sllx %g2, %g1, %g2
    mov 0x68, %g1
    stxa %g2, [%g1] ASI_CMP_CORE     ! Park thread
    nop
good_trap:
    ba good_trap
    nop
#else
good_trap:      
    ba good_trap ; nop;nop;nop;nop;nop;nop;nop 
#endif

#endif
    
HT0_BadTrap_0x1a1:
#ifdef EXPECT_BAD_TRAP
	ba good_trap ; nop;nop;nop;nop;nop;nop;nop
#else

#ifdef SSI_STATUS
    ! this externally signals good/bad per thread for tester
    ![7]     good/bad 1/0
    ![6:0]   tid

    ! get TID 0-63
    ldxa    [%g0]ASI_INTR_ID, %o1
#ifdef PORTABLE_CORE
    ! TID is now 0-7
    and     %o1, 0x07, %o1
#else
    nop
#endif
    or %o1, 0x80, %o1 ! only if BAD
    ! show TID and good/bad
    stb %o1, [%g0-0x100]
bad_trap: 
    ba bad_trap
    nop;nop;nop
#else	
bad_trap:
	ba bad_trap; nop;nop;nop;nop;nop;nop;nop
#endif
    
#endif
    
.align 512
HT0_Trap_Instruction_0x1b0:
#ifdef H_HT0_Trap_Instruction_0
#ifdef SUN_H_HT0_Trap_Instruction_0
	 SUN_H_HT0_Trap_Instruction_0 
#else
#	ifdef My_HT0_Trap_Instruction_0
		My_HT0_Trap_Instruction_0
#	else
		CUSTOM_TRAP(H_HT0_Trap_Instruction_0)
#	endif
#endif
#else
	NORMAL_TRAP(0x1b0);
#endif

.align 32
HT0_Trap_Instruction_0x1b1:
#ifdef H_HT0_Trap_Instruction_1
#ifdef SUN_H_HT0_Trap_Instruction_1
	 SUN_H_HT0_Trap_Instruction_1 
#else
#	ifdef My_HT0_Trap_Instruction_1
		My_HT0_Trap_Instruction_1
#	else
		CUSTOM_TRAP(H_HT0_Trap_Instruction_1)
#	endif
#endif
#else
	NORMAL_TRAP(0x1b1);
#endif

.align 32
HT0_Trap_Instruction_0x1b2:
#ifdef H_HT0_Trap_Instruction_2
#ifdef SUN_H_HT0_Trap_Instruction_2
	 SUN_H_HT0_Trap_Instruction_2 
#else
#	ifdef My_HT0_Trap_Instruction_2
		My_HT0_Trap_Instruction_2
#	else
		CUSTOM_TRAP(H_HT0_Trap_Instruction_2)
#	endif
#endif
#else
	NORMAL_TRAP(0x1b2);
#endif

.align 32
HT0_Trap_Instruction_0x1b3:
#ifdef H_HT0_Trap_Instruction_3
#ifdef SUN_H_HT0_Trap_Instruction_3
	 SUN_H_HT0_Trap_Instruction_3 
#else
#	ifdef My_HT0_Trap_Instruction_3
		My_HT0_Trap_Instruction_3
#	else
		CUSTOM_TRAP(H_HT0_Trap_Instruction_3)
#	endif
#endif
#else
	NORMAL_TRAP(0x1b3);
#endif

.align 32
HT0_Trap_Instruction_0x1b4:
#ifdef H_HT0_Trap_Instruction_4
#ifdef SUN_H_HT0_Trap_Instruction_4
	 SUN_H_HT0_Trap_Instruction_4 
#else
#	ifdef My_HT0_Trap_Instruction_4
		My_HT0_Trap_Instruction_4
#	else
		CUSTOM_TRAP(H_HT0_Trap_Instruction_4)
#	endif
#endif
#else
	NORMAL_TRAP(0x1b4);
#endif

.align 32
HT0_Trap_Instruction_0x1b5:
#ifdef H_HT0_Trap_Instruction_5
#ifdef SUN_H_HT0_Trap_Instruction_5
	 SUN_H_HT0_Trap_Instruction_5
#else
#	ifdef My_HT0_Trap_Instruction_5
		My_HT0_Trap_Instruction_5
#	else
		CUSTOM_TRAP(H_HT0_Trap_Instruction_5)
#	endif
#endif
#else
	NORMAL_TRAP(0x1b5);
#endif

.align 0x4000

! If counter > 0,  trap is enabled for n times, decrement counter
! If counter = 0,  trap is disabled, go to BadTrap
! If counter = -1, trap has taken n times, go to GoodTrap directly
! If counter <-1,  trap is enabled for n times, increment counter
TrapCheck:	
#ifdef SKIP_TRAPCHECK
    done
    nop
#else
	set	htrap_enable_data, %g1
	add	%g7, %g7, %g4
	ldsh	[%g1+%g4], %g2
	cmp	%g2, 0
	bl	%xcc, CheckGoodTrap
#ifdef NO_TRAPCHECK
	nop
#else
	mov	0,	%o0
#endif
	be	%xcc, HT0_BadTrap_0x101
	sub	%g2, 1, %g2
	ba	TrapCheck_end
CheckGoodTrap:
	cmp	%g2, -1
	be	%xcc, HT0_GoodTrap_0x100
	add	%g2, 1, %g2
TrapCheck_end:		
	sth	%g2, [%g1+%g4]
	done
#endif
	
TrapCheckWithRetry:
#ifdef SKIP_TRAPCHECK
    retry
    nop
#else    
	set	htrap_enable_data, %g1
	add	%g7, %g7, %g4
	ldsh	[%g1+%g4], %g2
	cmp	%g2, 0
	bl	%xcc, CheckGoodTrap_1
#ifdef NO_TRAPCHECK
	nop
#else
	mov	0,	%o0
#endif
	be	%xcc, HT0_BadTrap_0x101
	sub	%g2, 1, %g2
	ba	TrapCheck_end_1
CheckGoodTrap_1:
	cmp	%g2, -1
	be	%xcc, HT0_GoodTrap_0x100
	add	%g2, 1, %g2
TrapCheck_end_1:
	sth	%g2, [%g1+%g4]
	retry
#endif
    
	
#include <immu_miss_handler_ext.s>
#include <dmmu_miss_handler_ext.s>
#include "iaccess_except_handler.s"
#include "daccess_except_handler.s"
#include "daccess_prot_handler.s"
#include "mem_not_align_handler.s"
.data

htrap_enable_data:	
hdt0_0:
	.half 	HE0_0x00,HE0_0x01,HE0_0x02,HE0_0x03,HE0_0x04,HE0_0x05,HE0_0x06,HE0_0x07
	.half 	HE0_0x08,HE0_0x09,HE0_0x0a,HE0_0x0b,HE0_0x0c,HE0_0x0d,HE0_0x0e,HE0_0x0f

	.half 	HE0_0x10,HE0_0x11,HE0_0x12,HE0_0x13,HE0_0x14,HE0_0x15,HE0_0x16,HE0_0x17
	.half 	HE0_0x18,HE0_0x19,HE0_0x1a,HE0_0x1b,HE0_0x1c,HE0_0x1d,HE0_0x1e,HE0_0x1f
	
	.half 	HE0_0x20,HE0_0x21,HE0_0x22,HE0_0x23,HE0_0x24,HE0_0x25,HE0_0x26,HE0_0x27
	.half 	HE0_0x28,HE0_0x29,HE0_0x2a,HE0_0x2b,HE0_0x2c,HE0_0x2d,HE0_0x2e,HE0_0x2f
	
	.half 	HE0_0x30,HE0_0x31,HE0_0x32,HE0_0x33,HE0_0x34,HE0_0x35,HE0_0x36,HE0_0x37
	.half 	HE0_0x38,HE0_0x39,HE0_0x3a,HE0_0x3b,HE0_0x3c,HE0_0x3d,HE0_0x3e,HE0_0x3f
	
hdt0_64:
	.half 	HE0_0x40,HE0_0x41,HE0_0x42,HE0_0x43,HE0_0x44,HE0_0x45,HE0_0x46,HE0_0x47
	.half 	HE0_0x48,HE0_0x49,HE0_0x4a,HE0_0x4b,HE0_0x4c,HE0_0x4d,HE0_0x4e,HE0_0x4f
	
	.half 	HE0_0x50,HE0_0x51,HE0_0x52,HE0_0x53,HE0_0x54,HE0_0x55,HE0_0x56,HE0_0x57
	.half 	HE0_0x58,HE0_0x59,HE0_0x5a,HE0_0x5b,HE0_0x5c,HE0_0x5d,HE0_0x5e,HE0_0x5f
	
	.half 	HE0_0x60,HE0_0x61,HE0_0x62,HE0_0x63,HE0_0x64,HE0_0x65,HE0_0x66,HE0_0x67
	.half 	HE0_0x68,HE0_0x69,HE0_0x6a,HE0_0x6b,HE0_0x6c,HE0_0x6d,HE0_0x6e,HE0_0x6f
	
	.half 	HE0_0x70,HE0_0x71,HE0_0x72,HE0_0x73,HE0_0x74,HE0_0x75,HE0_0x76,HE0_0x77
	.half 	HE0_0x78,HE0_0x79,HE0_0x7a,HE0_0x7b,HE0_0x7c,HE0_0x7d,HE0_0x7e,HE0_0x7f
	
hdt0_128:
	.half 	HE0_0x80,HE0_0x81,HE0_0x82,HE0_0x83,HE0_0x84,HE0_0x85,HE0_0x86,HE0_0x87
	.half 	HE0_0x88,HE0_0x89,HE0_0x8a,HE0_0x8b,HE0_0x8c,HE0_0x8d,HE0_0x8e,HE0_0x8f

	.half 	HE0_0x90,HE0_0x91,HE0_0x92,HE0_0x93,HE0_0x94,HE0_0x95,HE0_0x96,HE0_0x97
	.half 	HE0_0x98,HE0_0x99,HE0_0x9a,HE0_0x9b,HE0_0x9c,HE0_0x9d,HE0_0x9e,HE0_0x9f

	.half 	HE0_0xa0,HE0_0xa1,HE0_0xa2,HE0_0xa3,HE0_0xa4,HE0_0xa5,HE0_0xa6,HE0_0xa7
	.half 	HE0_0xa8,HE0_0xa9,HE0_0xaa,HE0_0xab,HE0_0xac,HE0_0xad,HE0_0xae,HE0_0xaf

	.half 	HE0_0xb0,HE0_0xb1,HE0_0xb2,HE0_0xb3,HE0_0xb4,HE0_0xb5,HE0_0xb6,HE0_0xb7
	.half 	HE0_0xb8,HE0_0xb9,HE0_0xba,HE0_0xbb,HE0_0xbc,HE0_0xbd,HE0_0xbe,HE0_0xbf

hdt0_192:	
	.half 	HE0_0xc0,HE0_0xc1,HE0_0xc2,HE0_0xc3,HE0_0xc4,HE0_0xc5,HE0_0xc6,HE0_0xc7
	.half 	HE0_0xc8,HE0_0xc9,HE0_0xca,HE0_0xcb,HE0_0xcc,HE0_0xcd,HE0_0xce,HE0_0xcf

	.half 	HE0_0xd0,HE0_0xd1,HE0_0xd2,HE0_0xd3,HE0_0xd4,HE0_0xd5,HE0_0xd6,HE0_0xd7
	.half 	HE0_0xd8,HE0_0xd9,HE0_0xda,HE0_0xdb,HE0_0xdc,HE0_0xdd,HE0_0xde,HE0_0xdf

	.half 	HE0_0xe0,HE0_0xe1,HE0_0xe2,HE0_0xe3,HE0_0xe4,HE0_0xe5,HE0_0xe6,HE0_0xe7
	.half 	HE0_0xe8,HE0_0xe9,HE0_0xea,HE0_0xeb,HE0_0xec,HE0_0xed,HE0_0xee,HE0_0xef

	.half 	HE0_0xf0,HE0_0xf1,HE0_0xf2,HE0_0xf3,HE0_0xf4,HE0_0xf5,HE0_0xf6,HE0_0xf7
	.half 	HE0_0xf8,HE0_0xf9,HE0_0xfa,HE0_0xfb,HE0_0xfc,HE0_0xfd,HE0_0xfe,HE0_0xff

hdt1_0:	
	.half 	HE1_0x00,HE1_0x01,HE1_0x02,HE1_0x03,HE1_0x04,HE1_0x05,HE1_0x06,HE1_0x07
	.half 	HE1_0x08,HE1_0x09,HE1_0x0a,HE1_0x0b,HE1_0x0c,HE1_0x0d,HE1_0x0e,HE1_0x0f

	.half 	HE1_0x10,HE1_0x11,HE1_0x12,HE1_0x13,HE1_0x14,HE1_0x15,HE1_0x16,HE1_0x17
	.half 	HE1_0x18,HE1_0x19,HE1_0x1a,HE1_0x1b,HE1_0x1c,HE1_0x1d,HE1_0x1e,HE1_0x1f
	
	.half 	HE1_0x20,HE1_0x21,HE1_0x22,HE1_0x23,HE1_0x24,HE1_0x25,HE1_0x26,HE1_0x27
	.half 	HE1_0x28,HE1_0x29,HE1_0x2a,HE1_0x2b,HE1_0x2c,HE1_0x2d,HE1_0x2e,HE1_0x2f
	
	.half 	HE1_0x30,HE1_0x31,HE1_0x32,HE1_0x33,HE1_0x34,HE1_0x35,HE1_0x36,HE1_0x37
	.half 	HE1_0x38,HE1_0x39,HE1_0x3a,HE1_0x3b,HE1_0x3c,HE1_0x3d,HE1_0x3e,HE1_0x3f
	
hdt1_64:
	.half 	HE1_0x40,HE1_0x41,HE1_0x42,HE1_0x43,HE1_0x44,HE1_0x45,HE1_0x46,HE1_0x47
	.half 	HE1_0x48,HE1_0x49,HE1_0x4a,HE1_0x4b,HE1_0x4c,HE1_0x4d,HE1_0x4e,HE1_0x4f
	
	.half 	HE1_0x50,HE1_0x51,HE1_0x52,HE1_0x53,HE1_0x54,HE1_0x55,HE1_0x56,HE1_0x57
	.half 	HE1_0x58,HE1_0x59,HE1_0x5a,HE1_0x5b,HE1_0x5c,HE1_0x5d,HE1_0x5e,HE1_0x5f
	
	.half 	HE1_0x60,HE1_0x61,HE1_0x62,HE1_0x63,HE1_0x64,HE1_0x65,HE1_0x66,HE1_0x67
	.half 	HE1_0x68,HE1_0x69,HE1_0x6a,HE1_0x6b,HE1_0x6c,HE1_0x6d,HE1_0x6e,HE1_0x6f
	
	.half 	HE1_0x70,HE1_0x71,HE1_0x72,HE1_0x73,HE1_0x74,HE1_0x75,HE1_0x76,HE1_0x77
	.half 	HE1_0x78,HE1_0x79,HE1_0x7a,HE1_0x7b,HE1_0x7c,HE1_0x7d,HE1_0x7e,HE1_0x7f
	
hdt1_128:
	.half 	HE1_0x80,HE1_0x81,HE1_0x82,HE1_0x83,HE1_0x84,HE1_0x85,HE1_0x86,HE1_0x87
	.half 	HE1_0x88,HE1_0x89,HE1_0x8a,HE1_0x8b,HE1_0x8c,HE1_0x8d,HE1_0x8e,HE1_0x8f

	.half 	HE1_0x90,HE1_0x91,HE1_0x92,HE1_0x93,HE1_0x94,HE1_0x95,HE1_0x96,HE1_0x97
	.half 	HE1_0x98,HE1_0x99,HE1_0x9a,HE1_0x9b,HE1_0x9c,HE1_0x9d,HE1_0x9e,HE1_0x9f

	.half 	HE1_0xa0,HE1_0xa1,HE1_0xa2,HE1_0xa3,HE1_0xa4,HE1_0xa5,HE1_0xa6,HE1_0xa7
	.half 	HE1_0xa8,HE1_0xa9,HE1_0xaa,HE1_0xab,HE1_0xac,HE1_0xad,HE1_0xae,HE1_0xaf

	.half 	HE1_0xb0,HE1_0xb1,HE1_0xb2,HE1_0xb3,HE1_0xb4,HE1_0xb5,HE1_0xb6,HE1_0xb7
	.half 	HE1_0xb8,HE1_0xb9,HE1_0xba,HE1_0xbb,HE1_0xbc,HE1_0xbd,HE1_0xbe,HE1_0xbf

hdt1_192:	
	.half 	HE1_0xc0,HE1_0xc1,HE1_0xc2,HE1_0xc3,HE1_0xc4,HE1_0xc5,HE1_0xc6,HE1_0xc7
	.half 	HE1_0xc8,HE1_0xc9,HE1_0xca,HE1_0xcb,HE1_0xcc,HE1_0xcd,HE1_0xce,HE1_0xcf

	.half 	HE1_0xd0,HE1_0xd1,HE1_0xd2,HE1_0xd3,HE1_0xd4,HE1_0xd5,HE1_0xd6,HE1_0xd7
	.half 	HE1_0xd8,HE1_0xd9,HE1_0xda,HE1_0xdb,HE1_0xdc,HE1_0xdd,HE1_0xde,HE1_0xdf

	.half 	HE1_0xe0,HE1_0xe1,HE1_0xe2,HE1_0xe3,HE1_0xe4,HE1_0xe5,HE1_0xe6,HE1_0xe7
	.half 	HE1_0xe8,HE1_0xe9,HE1_0xea,HE1_0xeb,HE1_0xec,HE1_0xed,HE1_0xee,HE1_0xef

	.half 	HE1_0xf0,HE1_0xf1,HE1_0xf2,HE1_0xf3,HE1_0xf4,HE1_0xf5,HE1_0xf6,HE1_0xf7
	.half 	HE1_0xf8,HE1_0xf9,HE1_0xfa,HE1_0xfb,HE1_0xfc,HE1_0xfd,HE1_0xfe,HE1_0xff

hpthread_mutex_data:

	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.byte	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	
hpthread_counter_data:

	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
	.half	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0

!!!!!!!! ERROR HANDLING CODE that used to be in err_handlers.s !!!!!
! For ITTM, ITTP, ITDP errors, err_type is < 4. Issue demap all to the VA in TPC[TL].
! (Demap pg requires context knowledge - too much work)
! For ITMU (err_type = 4), rd sfar to chk MRA index.
! For ITL2U and ITL2ND errors issue retry.
.text
inst_access_mmu_error_handler:
ht_read_isfsr:
	add     %g0, SFSR_VA, %g1          
	ldxa  [%g1]ASI_ISFSR, %g2
	cmp %g2, ISFSR_ITMU
	be ht_chk_sfar	!! sfar stores the MRA index
	bg ht_clear_isfsr
ht_demap_all:
	rdpr    %tpc, %g3
	mov 0x80, %g3
	ba ht_clear_isfsr
	stxa    %g0, [%g3]ASI_IMMU_DEMAP
ht_chk_sfar:
	add     %g0, SFAR_VA, %g3
	ldxa  [%g3]ASI_SFAR, %g4
ht_clear_isfsr:
	stxa %g0, [%g1]ASI_ISFSR
	retry

inst_access_error_handler:
	add     %g0, SFSR_VA, %g1          
	ldxa  [%g1]ASI_ISFSR, %g2
	rdpr    %tpc, %g3
	stxa %g0, [%g1]ASI_ISFSR
	retry

int_proc_err_handler:
ht_read_ipe_dsfsr:
!# simplified the handler. Read the dsfsr and dsfsr and clear it for all ipe errors. 
!# This will also speedup the  diags. 
!# I don't get much from injecting errors in the trap handlers.
!# First six lines is the new code added to simplify the handler.
!#8/18/05: EVEN with above simplification some of the diags die with max cycles reached.
!#This is because the global registers get messed up if we are at max gl.
!#Since the dsfsr and dsfar are being checked by the checkers, just do a retry.
	retry
	add     %g0, SFSR_VA, %g7          
	ldxa  [%g7]ASI_DSFSR, %g6
	stxa %g0, [%g7]ASI_DSFSR
	add     %g0, SFAR_VA, %g7
	ldxa  [%g7]ASI_SFAR, %g6
	retry
	nop
	rdpr  %gl, %g7	!! read the current gl
	cmp %g7, 0x3	
	be ht_ipe_clear_dsfsr
	add     %g0, SFSR_VA, %g1          
	ldxa  [%g1]ASI_DSFSR, %g2
ht_read_ipe_dsfar:
	add     %g0, SFAR_VA, %g1
	ldxa  [%g1]ASI_SFAR, %g3

	cmp %g2, DSFSR_FRFU
	bl ht_irf_error
	cmp %g2, DSFSR_SBDLC
	bl ht_frf_error
	cmp %g2, DSFSR_MRAU
	bl ht_stb_error
	be ht_mra_error
	cmp %g2, DSFSR_SCAC
	!!bl ht_tsa_error	on tsa_errors just clear the dsfsr and exit
	bl ht_ipe_clear_dsfsr
	cmp %g2, DSFSR_TCCP
	bl ht_sca_error
	nop
ht_ipe_tcc_error:
	and %g3, 0x3, %g3	!! get the tca index
	sllx %g3, 3, %g3
	mov %g3, %g4
	ldxa [%g3]ASI_TICK_ACCESS, %g5  !! read ecc
	or %g3, 0x20, %g3	!!set NP bit to read data
	ldxa [%g3]ASI_TICK_ACCESS, %g5  !! read data
	setx ht_ipe_clr_tcc_err, %g1, %g3
	jmp %g3+%g4
	nop
ht_ipe_clr_tcc_err:
	wr %g0, %g5, %tick_cmpr
	ba  ht_ipe_clear_dsfsr
        nop
ht_ipe_clr_stick_err:
	wr  %g0, %g5, %sys_tick_cmpr
	ba  ht_ipe_clear_dsfsr
        nop 
ht_ipe_clr_hstick_err:
	wrhpr  %g0, %g5, %hsys_tick_cmpr
	ba  ht_ipe_clear_dsfsr
        nop
ht_stb_error:
	and %g3, 0x7, %g3	!! get stb_index	
	sllx %g3, 3, %g3
ht_ipe_rd_stb_entry_data:
    	ldxa [%g3]ASI_STB_ACCESS, %g2
ht_ipe_rd_stb_entry_ecc:
	or %g3, 0x40, %g3
    	ldxa [%g3]ASI_STB_ACCESS, %g2
ht_ipe_rd_stb_entry_addr:
	or %g3, 0x80, %g3
    	ldxa [%g3]ASI_STB_ACCESS, %g2
ht_ipe_rd_stb_entry_par:
	and %g3, 0xbf, %g3
    	ldxa [%g3]ASI_STB_ACCESS, %g2
ht_ipe_rd_stb_ptr:
  	add %g0, 0x100, %g1   !! read the stb ptr
    	ldxa [%g1]ASI_STB_ACCESS, %g2
	ba,a  ht_ipe_clear_dsfsr

ht_mra_error:
	and %g3, 0x7, %g3       !! get mra_index
	sllx %g3, 4, %g3
	setx ht_ipe_rd_mra, %g1, %g4
	jmp %g3+%g4
	nop
ht_ipe_rd_mra:
ht_ipe_rd_mra_0:
	add %g0, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0, %g1
	ldxa [%g1]ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2
	ba  ht_ipe_clear_dsfsr
	nop
ht_ipe_rd_mra_1:
	add %g0, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2, %g1
	ldxa [%g1]ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2
	ba  ht_ipe_clear_dsfsr
	nop
ht_ipe_rd_mra_2:
	add %g0, ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0, %g1
	ldxa [%g1]ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG, %g2
	ba  ht_ipe_clear_dsfsr
	nop
ht_ipe_rd_mra_3:
	add %g0, ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2, %g1
	ldxa [%g1]ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG, %g2
	ba  ht_ipe_clear_dsfsr
	nop
ht_ipe_rd_mra_4:
	add %g0, ASI_MMU_PHYSICAL_OFFSET_0, %g1
	ldxa [%g1]ASI_MMU_PHYSICAL_OFFSET, %g2
	ba  ht_ipe_clear_dsfsr
	nop
ht_ipe_rd_mra_5:
	add %g0, ASI_MMU_PHYSICAL_OFFSET_1, %g1
	ldxa [%g1]ASI_MMU_PHYSICAL_OFFSET, %g2
	ba  ht_ipe_clear_dsfsr
	nop
ht_ipe_rd_mra_6:
	add %g0, ASI_MMU_PHYSICAL_OFFSET_2, %g1
	ldxa [%g1]ASI_MMU_PHYSICAL_OFFSET, %g2
	ba  ht_ipe_clear_dsfsr
	nop
ht_ipe_rd_mra_7:
	add %g0, ASI_MMU_PHYSICAL_OFFSET_3, %g1
	ldxa [%g1]ASI_MMU_PHYSICAL_OFFSET, %g2
	ba  ht_ipe_clear_dsfsr
	nop

ht_sca_error:
	and %g3, 0x7, %g3	!! get sca_index	
	sllx %g3, 3, %g3
	mov %g3, %g4
	ldxa [%g3]ASI_SCRATCHPAD_ACCESS, %g5  !! read ecc
	or %g3, 0x40, %g3	!!set NP bit to read data
	ldxa [%g3]ASI_SCRATCHPAD_ACCESS, %g5  !! read data
ht_ipe_clr_sca_err:
	stxa %g5, [%g4]ASI_HYP_SCRATCHPAD
	ba  ht_ipe_clear_dsfsr
	nop
	
ht_tsa_error:
	and %g3, 0x7, %g3	!! get tsa_index	
	rdpr %tl, %g1		!! store the current tl
	cmp %g3, 6
	bl ht_ipe_priv_reg_err
    nop
	be ht_ipe_mondo_reg_err
    nop
	tg T_BAD_TRAP

ht_ipe_priv_reg_err:
	inc %g3
	wrpr %g0, %g3, %tl
	rdpr %tstate, %g2
	wrpr %g0, %g2, %tstate	!! shd clear the error
	wrpr %g0, %g1, %tl
	ba  ht_ipe_clear_dsfsr
	nop

ht_ipe_mondo_reg_err:
	add %g0, ASI_CPU_MONDO_QUEUE_HEAD, %g1
	ldxa [%g1]ASI_QUEUE, %g2
	stxa %g2, [%g1]ASI_QUEUE
	ba  ht_ipe_clear_dsfsr
	nop

ht_irf_error:
ht_ipe_get_reg_no:
	and %g3, 0x1f, %g1	
ht_ipe_rd_irf_ecc:
	sllx %g1, 3, %g2
	ldxa [%g2]ASI_IRF_ECC_REG, %g4
ht_ipe_get_syndrome:
	srlx %g3, 7, %g2
	and %g2, 0xff, %g2
ht_ipe_get_gl:
	srlx %g3, 5, %g2
	and %g2, 0x3, %g2
	rdpr  %gl, %g7	!! read the current gl 
	cmp %g1, 0x7
	bg ht_ipe_rd_array	!! err not in global
	cmp %g2, 0x3		!! err in global and at gl 3
	be,a ht_ipe_rd_array    !! global registers are not corrected
	wrpr %g0, %g2, %gl  !! restore the gl to error gl

ht_ipe_rd_array:
	rdpr %tl, %g3
	sllx %g3, 3, %g3
	setx ht_ipe_rd_err_reg, %g4, %g5
	sllx %g1, 3, %g6
	jmp %g5+%g6
	nop
ht_ipe_rd_err_reg:
ht_ipe_rd_g0:
	stxa %r0, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_g1:
	stxa %r1, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_g2:
	stxa %r2, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_g3:
	stxa %r3, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_g4:
	stxa %r4, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_g5:
	stxa %r5, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_g6:
	stxa %r6, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_g7:
	stxa %r7, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r8:
	stxa %r8, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r9:
	stxa %r9, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r10:
	stxa %r10, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r11:
	stxa %r11, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r12:
	stxa %r12, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r13:
	stxa %r13, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r14:
	stxa %r14, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r15:
	stxa %r15, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r16:
	stxa %r16, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r17:
	stxa %r17, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r18:
	stxa %r18, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r19:
	stxa %r19, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r20:
	stxa %r20, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r21:
	stxa %r21, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r22:
	stxa %r22, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r23:
	stxa %r23, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r24:
	stxa %r24, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r25:
	stxa %r25, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r26:
	stxa %r26, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r27:
	stxa %r27, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r28:
	stxa %r28, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r29:
	stxa %r29, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r30:
	stxa %r30, [%g0 + %g3]ASI_SCRATCHPAD
	ba,a ht_ipe_wr_err_rg
ht_ipe_rd_r31:
	stxa %r31, [%g0 + %g3]ASI_SCRATCHPAD
ht_ipe_wr_err_rg:
	setx ht_ipe_wr_g0, %g4, %g5
	jmp %g5+%g6
	nop

ht_ipe_wr_g0:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r0
	ba,a ht_ipe_restore_gl
ht_ipe_wr_g1:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r1
	ba,a ht_ipe_restore_gl
ht_ipe_wr_g2:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r2
	ba,a ht_ipe_restore_gl
ht_ipe_wr_g3:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r3
	ba,a ht_ipe_restore_gl
ht_ipe_wr_g4:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r4
	ba,a ht_ipe_restore_gl
ht_ipe_wr_g5:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r5
	ba,a ht_ipe_restore_gl
ht_ipe_wr_g6:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r6
	ba,a ht_ipe_restore_gl
ht_ipe_wr_g7:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r7
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r8:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r8
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r9:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r9
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r10:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r10
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r11:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r11
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r12:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r12
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r13:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r13
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r14:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r14
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r15:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r15
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r16:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r16
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r17:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r17
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r18:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r18
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r19:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r19
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r20:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r20
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r21:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r21
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r22:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r22
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r23:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r23
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r24:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r24
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r25:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r25
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r26:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r26
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r27:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r27
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r28:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r28
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r29:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r29
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r30:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r30
	ba,a ht_ipe_restore_gl
ht_ipe_wr_r31:
	ldxa [%g0 + %g3]ASI_SCRATCHPAD, %r31
ht_ipe_restore_gl:
	wrpr %g0, %g7, %gl	
	ba ht_ipe_clear_dsfsr
	nop

ht_frf_error:
ht_ipe_get_frf_reg_no:
	and %g3, 0x3f, %g1	
ht_ipe_get_frf_even_syndrome:
	srlx %g3, 6, %g2
	and %g2, 0x7f, %g2
ht_ipe_get_frf_odd_syndrome:
	srlx %g3, 13, %g2
	and %g2, 0x7f, %g2
ht_ipe_rd_frf_ecc:
	sllx %g1, 3, %g1
	ldxa [%g1]ASI_FRF_ECC_REG, %g3

ht_ipe_clear_dsfsr:
	add     %g0, SFSR_VA, %g7          
	stxa %g0, [%g7]ASI_DSFSR
	retry

data_access_mmu_error_handler:
ht_dme_read_dsfsr:
	add     %g0, SFSR_VA, %g1          
	ldxa  [%g1]ASI_DSFSR, %g2
ht_dme_read_dsfar:
	add     %g0, SFAR_VA, %g4
	ldxa  [%g4]ASI_SFAR, %g3
	cmp %g2, DSFSR_DTMU
	bge ht_dme_clear_dsfsr
ht_dme_demap_all:
    mov 0x80, %g3
	stxa    %g0, [%g3]ASI_DMMU_DEMAP
ht_dme_clear_dsfsr:
	stxa %g0, [%g1]ASI_DSFSR
	retry

data_access_error_handler:
!!SOC CODE
	setx 0xc03ffff800000000, %g1, %g2
	setx 0xab00000000, %g1, %g3
	stx %g2, [%g3]
!!END SOC CODE
	add     %g0, SFAR_VA, %g1          
	ldxa  [%g1]ASI_SFAR, %g2
	add     %g0, SFSR_VA, %g1          
	ldxa  [%g1]ASI_DSFSR, %g2
	stxa %g0, [%g1]ASI_DSFSR
#ifdef DAE_SKIP_IF_SOCU_ERROR
    cmp %g2, 0x4
    bne dae_retry
    nop
    done
dae_retry:
#endif
	retry

hw_corrected_error_handler:
ht_hce_read_desr:
  	ldxa [%g0]ASI_DESR, %g1  !! PRM 25.8.5  Also clears desr
	
ht_hce_chk_errt:
  	srlx %g1, 56, %g2  
#ifdef VERBOSE_MCU_CE_HANDLER
	/* only allows MCU and L2 correctable errors */
    	and  %g2, 0x1F, %g2
	
	cmp  %g2, DESR_HCE_L2C
	be   hw_corrected_error_clear_l2esr
	nop
	
	cmp  %g2, DESR_SOCC
	be   hw_corrected_error_clear_dram_esr
	nop
	
	ta   T_BAD_TRAP		! only expected L2 or MCU Correctable
	nop
#else
	/* allows pretty much any error */
    	and %g2, 0x1F, %g2
        cmp %g2, DESR_ICDP
	ble ht_hce_ic_error
        cmp %g2, DESR_DCDP
	ble ht_hce_dc_error
	cmp %g2, DESR_SBDPC
	be ht_hce_sbdpc_error
#endif
!!SOC CODE
hw_corrected_error_clear_dram_esr:
	/* Check & clear the DRAM ESR - PRM 25.12.1
	 * DRAM Error Status reg bits are:
	 * 63 MEU   Multiple uncorrectable errors
	 * 62 MEC   Multiple correctable errors
	 * 61 DAC   DRAM access correctable error
	 * 60 DAU   DRAM access uncorrectable error
	 * 59 DSC   DRAM scrub correctable error
	 * 58 DSU   DRAM scrub uncorrectable error
	 * 57 DBU   DRAM out-of-bound error
	 * 56 MEB   Multiple out-of-bound errors
	 * 55 FBU   FBDIMM channel unrecoverable error
	 * 54 FBR   FBDIMM channel recoverable error
	 */
	best_set_reg(DRAM_ES_PA, %g7, %g3)
	best_set_reg(DRAM_CSR_STEP, %g6, %g7)
#ifdef VERBOSE_MCU_CE_HANDLER
	/* only allows MCU DAC and DSC errors */
	best_set_reg(0x2000000000000000, %g7, %g2)	! DAC bit
	best_set_reg(0x0800000000000000, %g7, %g4)	! DSC bit
	mov	0, %g1
	
	ldx	[%g3], %g5  /* DRAM0 ESR*/
	andcc	%g5, %g2, %g6
	be      %xcc, ht_hce_no_dram0_dac
	nop
	
ht_hce_dram0_dac:
	nop ! $EV trig_pc_d(1, @VA(.HTRAPS.ht_hce_dram0_dac)) -> printf("INFO: DRAM0 ESR DAC bit was set",*,1)

ht_hce_no_dram0_dac:
	andcc	%g5, %g4, %g6
	be      %xcc, ht_hce_no_dram0_dsc
	nop
	
ht_hce_dram0_dsc:
	nop ! $EV trig_pc_d(1, @VA(.HTRAPS.ht_hce_dram0_dsc)) -> printf("INFO: DRAM0 ESR DSC bit was set",*,1)

ht_hce_no_dram0_dsc:
	stx	%g5, [%g3]  /* clear DRAM0 ESR */
	or	%g5, %g1, %g1
	
	add	%g3, %g7, %g3
	ldx	[%g3], %g5  /* load DRAM1 ESR*/
	andcc	%g5, %g2, %g6
	be      %xcc, ht_hce_no_dram1_dac
	nop
	
ht_hce_dram1_dac:
	nop ! $EV trig_pc_d(1, @VA(.HTRAPS.ht_hce_dram1_dac)) -> printf("INFO: DRAM1 ESR DAC bit was set",*,1)

ht_hce_no_dram1_dac:
	andcc	%g5, %g4, %g6
	be      %xcc, ht_hce_no_dram1_dsc
	nop
	
ht_hce_dram1_dsc:
	nop ! $EV trig_pc_d(1, @VA(.HTRAPS.ht_hce_dram1_dsc)) -> printf("INFO: DRAM1 ESR DSC bit was set",*,1)

ht_hce_no_dram1_dsc:
	stx	%g5, [%g3]  /* clear DRAM1 ESR */
	or	%g5, %g1, %g1
	
	add	%g3, %g7, %g3
	ldx	[%g3], %g5  /* load DRAM2 ESR */
	andcc	%g5, %g2, %g6
	be      %xcc, ht_hce_no_dram2_dac
	nop
	
ht_hce_dram2_dac:
	nop ! $EV trig_pc_d(1, @VA(.HTRAPS.ht_hce_dram2_dac)) -> printf("INFO: DRAM2 ESR DAC bit was set",*,1)

ht_hce_no_dram2_dac:
	andcc	%g5, %g4, %g6
	be      %xcc, ht_hce_no_dram2_dsc
	nop
	
ht_hce_dram2_dsc:
	nop ! $EV trig_pc_d(1, @VA(.HTRAPS.ht_hce_dram2_dsc)) -> printf("INFO: DRAM2 ESR DSC bit was set",*,1)

ht_hce_no_dram2_dsc:
	stx	%g5, [%g3]  /* clear DRAM2 ESR */
	or	%g5, %g1, %g1
	
	add	%g3, %g7, %g3
	ldx	[%g3], %g5  /* load DRAM3 ESR */
	andcc	%g5, %g2, %g6
	be      %xcc, ht_hce_no_dram3_dac
	nop
	
ht_hce_dram3_dac:
	nop ! $EV trig_pc_d(1, @VA(.HTRAPS.ht_hce_dram3_dac)) -> printf("INFO: DRAM3 ESR DAC bit was set",*,1)

ht_hce_no_dram3_dac:
	andcc	%g5, %g4, %g6
	be      %xcc, ht_hce_no_dram3_dsc
	nop
	
ht_hce_dram3_dsc:
	nop ! $EV trig_pc_d(1, @VA(.HTRAPS.ht_hce_dram3_dsc)) -> printf("INFO: DRAM3 ESR DSC bit was set",*,1)

ht_hce_no_dram3_dsc:
	stx	%g5, [%g3]  /* DRAM3 */
	or	%g5, %g1, %g1

	or	%g2, %g4, %g4 
	andcc	%g1, %g4, %g6 /* if no DAC/DSC on any DRAM, then error */
	bne     %xcc, ht_hce_done
	nop
	
	ta	T_BAD_TRAP		! no DAC or DSC set in any MCU ESR
	nop
	
ht_hce_done:
	retry
#else
	best_set_reg(0x6840000000000000, %g7, %g2)
	stx	%g2, [%g3]  /* DRAM0 */
	add	%g3, %g7, %g3
	stx	%g2, [%g3]  /* DRAM1 */
	add	%g3, %g7, %g3
	stx	%g2, [%g3]  /* DRAM2 */
	add	%g3, %g7, %g3
	stx	%g2, [%g3]  /* DRAM3 */
#endif
hw_corrected_error_clear_l2esr:
	/* Clear the L2$ ESR */
	/* L2ESR correctable error bits:
	 * 62 MEC   Multiple correctable errors
	 * 51 LDWC  L2 cache data array writeback correctable error
	 * 47 LDSC  L2 cache data array scrub correctable error
	 * 45 LTC   L2 cache tag array correctable error
	 * 42 DAC   DRAM access correctable error
	 * 40 DRC   DRAM dma access correctable error
	 * 38 DSC   DRAM scrub correctable error
	 * 34 LVC   VUAD correctable error
	 */
	best_set_reg(0x4008a54400000000, %g1, %g2)
	best_set_reg(L2ES_PA0, %g1, %g3)
	stx %g2, [%g3]
	stx %g2, [%g3 + 0x040]
	stx %g2, [%g3 + 0x080]
	stx %g2, [%g3 + 0x0c0]
	stx %g2, [%g3 + 0x100]
	stx %g2, [%g3 + 0x140]
	stx %g2, [%g3 + 0x180]
	stx %g2, [%g3 + 0x1c0]
!!END SOC CODE
	retry	!! Can't do much for l2c errors

ht_hce_dc_error:
	and %g1, 0x1ff, %g2
	sllx %g2, 4, %g2	!! index is in bits 10:4 of addr
  	add %g0, 0x800, %g1	
	sllx %g1, 2, %g1	!! for reading data, bit 13 of index shd be 1
ht_hce_dc_rd_tag:
  	ldxa [%g2]ASI_DC_TAG, %g3
    /*
ht_hce_dc_rd_data:
  	ldxa [%g2+%g1]ASI_DC_DATA, %g4
	or %g2, 0x8, %g2	  !! read MSB 8 bytes from cache line
  	ldxa [%g2+%g1]ASI_DC_DATA, %g4
    */
	retry

ht_hce_ic_error:
	and %g1, 0x1ff, %g2
	sllx %g2, 5, %g2	!! index is in bits 10:5 of addr for tag read
	sllx %g2, 1, %g1	!! index is in bits 11:6 of addr for data read
ht_hce_ic_rd_tag:
  	ldxa [%g0+%g2]ASI_IC_TAG, %g3
	mov %g0, %g2
ht_hce_ic_rd_instr:
  	ldxa [%g1]ASI_IC_INSTR, %g4
	add %g1, 8, %g1
	cmp %g2, 7
	bl ht_hce_ic_rd_instr
	inc %g2
	retry
	
ht_hce_sbdpc_error:
	and %g1, 0x7, %g3	!! get stb_index	
	sllx %g3, 3, %g3
ht_hce_rd_stb_entry_data:
    	ldxa [%g3]ASI_STB_ACCESS, %g2
ht_hce_rd_stb_entry_ecc:
	or %g3, 0x40, %g3
    	ldxa [%g3]ASI_STB_ACCESS, %g2
ht_hce_rd_stb_entry_addr:
	or %g3, 0x80, %g3
    	ldxa [%g3]ASI_STB_ACCESS, %g2
ht_hce_rd_stb_entry_par:
	and %g3, 0xbf, %g3
    	ldxa [%g3]ASI_STB_ACCESS, %g2
	retry

!! The sw_recoverable_err trap is taken mostly for uncorrectable errors.
!! Most of these are due to errors on L2c returns. Can't chk much in the
!! trap handler for these.

sw_recoverable_error_handler:
ht_swe_read_desr:
!! SOC code
	setx 0xc03ffff800000000, %g1, %g2
	setx 0xab00000000, %g1, %g3
	stx %g2, [%g3]
!! END SOC code
  	ldxa [%g0]ASI_DESR, %g1  !! Also clears desr
	retry 

store_error_handler:
ht_ste_read_dfesr:
  	add %g0, DFESR_VA, %g1
        ldxa [%g1]ASI_DFESR, %g2   !! read the DFESR and clear it
	!!stxa %g0, [%g1]0x4c        !! clear the dfesr
	retry

!! SOC Error Handlers !!
Soc_Recoverable_Sw_error_trap:
#define L2_ES_W1C_VALUE     0xc03ffff800000000
read_trap_type_Sw:
        setx  EXECUTED, %l0, %o0
        ! save trap type value
        rdpr  %tt, %i6
        nop
#ifdef ERR_RANDOM_L2
  mov   0x40, %i7
  cmp   %i7, %i6
#else
  mov   0x40, %o1
  cmp   %o1, %i6
#endif
  tne  %xcc, T_BAD_TRAP

check_clear_desr_Sw:
        ldxa [%g0]ASI_DESR, %i5  !! Also clears desr
        setx 0x3f00000000000000, %i6, %i7
        and  %i5, %i7, %i5
#ifdef L2_LDAC_err
        setx 0x2400000000000000, %i6, %i7
#endif
#ifdef L2_LDRC_err
        setx 0x3400000000000000, %i6, %i7
#endif
#ifdef L2_NDDM_err
        setx 0x3100000000000000, %i6, %i7
#endif
#ifdef L2_DWS_err
        setx 0x3000000000000000, %i6, %i7
#endif
        cmp  %i5, %i7
        tne  %xcc, T_BAD_TRAP
        nop
#ifdef ERR_RANDOM_L2
clear_l2esr_Sw:
        setx  L2_ES_W1C_VALUE, %i5, %i6
        setx  L2ES_PA0, %i5, %i7
        stx   %i6, [%i7]
        membar #Sync
#endif
#ifdef INC_MCU_ERR_REG
#ifdef ERR_RANDOM_L2
verify_l2_ESR:
        setx  L2ES_PA0, %5, %i6
        ldx  [%i6],%i7
        setx 0x3ffffc00000000,%i5,%i4
        setx 0x20001000000000,%i5,%i6
        and  %i7,%i4,%i7
        cmp  %i7,%i6
        tne  %xcc, T_BAD_TRAP
        nop
 
clear_mcu_esr_Sw:
  setx  0xfe00000000000000, %i5, %i6
  setx  0x8400000280, %i5, %i7
  stx   %i6, [%i7]
  membar #Sync
#endif
clear_mcu_errinj_reg_Sw:
  setx  0x8400000290, %i5, %i6
  stx   %g0, [%i6]
#endif
	retry
	nop


Soc_Corrected_Hw_error_trap:
#define L2_ES_W1C_VALUE     0xc03ffff800000000
read_trap_type_Hw:
        setx  EXECUTED, %l0, %o0
        ! save trap type value
        rdpr  %tt, %i5
        nop
#ifdef ERR_RANDOM_L2
  mov   0x63, %i6
  cmp   %i5, %i6
#else
  mov   0x63, %o1
  cmp   %i5, %o1
#endif

  tne  %xcc, T_BAD_TRAP

check_clear_desr_Hw:
        ldxa [%g0]ASI_DESR, %i6  !! Also clears desr
	setx 0x3f00000000000000, %i7, %i5
	and  %i6, %i5, %i6
!#ifdef L2_LDAC_err
!	setx 0x0400000000000000, %i7, %i4
!#else
	setx 0x0900000000000000, %i7, %i4
!#endif
	cmp  %i4, %i6
        tne  %xcc, T_BAD_TRAP
	nop
#ifdef ERR_RANDOM_L2
verify_L2_esr:
        setx  L2ES_PA0, %i5, %g1
	ldx  [%g1],%i6
	setx 0x3ffffc00000000,%i5,%i4
	and  %i6,%i4,%i6
#ifdef L2_LDAC_err
	setx 0x20001000000000,%i5,%i7
	cmp  %i6,%i7
	tne  %xcc, T_BAD_TRAP
        nop
#endif
#ifdef L2_LVC_er
        setx 0x1400000000,%i5,%i4
        cmp  %i6,%i4
        tne  %xcc, T_BAD_TRAP
        nop
#endif
#ifdef L2_LTC_er
	setx 0x201000000000,%i5,%i4
        cmp  %i6,%i4
        tne  %xcc, T_BAD_TRAP
        nop
#endif
clear_l2esr_Hw:
        setx  L2_ES_W1C_VALUE, %i5, %i6
        stx   %i6, [%g1]
        membar #Sync
#endif

#ifdef INC_MCU_ERR_REG
#ifdef ERR_RANDOM_L2

clear_mcu_esr_Hw:
setx  0xfe00000000000000, %i5, %i6
  setx  0x8400000280, %i5, %i7
  stx   %i6, [%i7]
  membar #Sync
#endif

clear_mcu_errinj_reg_Hw:
  setx  0x8400000290, %i5, %i6
  stx   %g0, [%i6]
#endif
	retry
	nop

Soc_Precise_data_access_error_trap:
#define L2_ES_W1C_VALUE     0xc03ffff800000000
read_trap_type_Da:
	setx  EXECUTED, %l0, %o0
  	! save trap type value
  	rdpr  %tt, %i6
 	nop

  mov   0x32, %o1
  cmp   %i6, %o1
  tne  %xcc, T_BAD_TRAP

set  0xf, %i5
mov 0x1,%l7
check_clear_dsfsr_Da:
	add     %g0, SFSR_VA, %i7
        ldxa  [%i7]ASI_DSFSR, %i6
#ifdef L2_NDSP_err
	set  0x2, %i5
#else
        set  0x1, %i5

#endif
	cmp    %i6,%i5
  	tne  %xcc, T_BAD_TRAP
        stxa %g0, [%i7]ASI_DSFSR
	nop
!clear_l2esr_Da:
!	setx  L2_ES_W1C_VALUE, %l0, %l1
!        setx  L2ES_PA0, %l6, %g1
!        stx   %l1, [%g1]
!	membar #Sync
#ifdef INC_MCU_ERR_REG
!clear_mcu_esr_Da:
!setx  0xfe00000000000000, %l0, %g4
!  setx  0x8400000280, %l3, %g5
!  stx   %g4, [%g5]
!  membar #Sync
clear_mcu_errinj_reg_Da:
  setx  0x8400000290, %i5, %i6
  stx   %g0, [%i6]
#endif
!	retry
	done
	nop

!! END Of SOC Error Handlers !!




.align 128
exit_sync_thread_start:
    rdpr   %pstate, %g1
    or     %g1, PSTATE_IE_MASK, %g1
    wrpr   %g1, %pstate              ! Enable interrupts
    membar #Sync
exit_sync_thread:
    exit_sync_threads

    jmpl %o7+8, %g0
    nop


.align 128
asi_check_start:
#include "spc_por_rdchk.s"

    jmpl %o7+8, %g0
    nop

.align 128

