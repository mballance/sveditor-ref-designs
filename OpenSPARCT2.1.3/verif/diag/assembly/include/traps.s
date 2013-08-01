/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: traps.s
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
	
#define SPILL_TRAP(n) saved; mov n, %g7; b TrapCheck;  nop;
#define FILL_TRAP(n) restored; mov n, %g7; b TrapCheck;  nop;

#define CUSTOM_TRAP(n) setx n, %g1, %g2; jmp %g2; nop

				
.text

T0_Reserved_0x00:		
#ifdef H_T0_Reserved_0x00
#ifdef SUN_H_T0_Reserved_0x00
	 SUN_H_T0_Reserved_0x00 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x00)
#endif
.align 32
#else
	NORMAL_TRAP(0x00); 
#endif

T0_Reserved_0x01:		
#ifdef H_T0_Reserved_0x01
#ifdef SUN_H_T0_Reserved_0x01
	 SUN_H_T0_Reserved_0x01 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x01)
#endif
.align 32
#else
	NORMAL_TRAP(0x01); 
#endif

T0_Reserved_0x02:		
#ifdef H_T0_Reserved_0x02
#ifdef SUN_H_T0_Reserved_0x02
	 SUN_H_T0_Reserved_0x02 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x02)
#endif
.align 32
#else
	NORMAL_TRAP(0x02); 
#endif

T0_Reserved_0x03:		
#ifdef H_T0_Reserved_0x03
#ifdef SUN_H_T0_Reserved_0x03
	 SUN_H_T0_Reserved_0x03 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x03)
#endif
.align 32
#else
	NORMAL_TRAP(0x03); 
#endif

T0_Reserved_0x04:		
#ifdef H_T0_Reserved_0x04
#ifdef SUN_H_T0_Reserved_0x04
	 SUN_H_T0_Reserved_0x04 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x04)
#endif
.align 32
#else
	NORMAL_TRAP(0x04); 
#endif

T0_Reserved_0x05:		
#ifdef H_T0_Reserved_0x05
#ifdef SUN_H_T0_Reserved_0x05
	 SUN_H_T0_Reserved_0x05 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x05)
#endif
.align 32
#else
	NORMAL_TRAP(0x05); 
#endif

T0_Reserved_0x06:		
#ifdef H_T0_Reserved_0x06
#ifdef SUN_H_T0_Reserved_0x06
	 SUN_H_T0_Reserved_0x06 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x06)
#endif
.align 32
#else
	NORMAL_TRAP(0x06); 
#endif

T0_Reserved_0x07:		
#ifdef H_T0_Reserved_0x07
#ifdef SUN_H_T0_Reserved_0x07
	 SUN_H_T0_Reserved_0x07 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x07)
#endif
.align 32
#else
	NORMAL_TRAP(0x07); 
#endif

T0_Instruction_Access_Exception_0x08:
#ifdef H_T0_Instruction_access_exception_0x08
#ifdef SUN_H_T0_Instruction_access_exception_0x08
	 SUN_H_T0_Instruction_access_exception_0x08 
#else
#	ifdef My_T0_Instruction_access_exception_0x08
		My_T0_Instruction_access_exception_0x08
#	else
		CUSTOM_TRAP(H_T0_Instruction_access_exception_0x08)
#	endif
#endif
.align 32	
#else	
	NORMAL_TRAP(0x08); 
#endif

T0_Instruction_Access_MMU_Miss_0x09:		
#ifdef H_T0_Instruction_Access_MMU_Miss_0x09
	#ifdef SUN_H_T0_Instruction_Access_MMU_Miss_0x09
		SUN_H_T0_Instruction_Access_MMU_Miss_0x09
	#else
		#ifdef My_T0_Instruction_Access_MMU_Miss_0x09
			My_T0_Instruction_Access_MMU_Miss_0x09
		#else
			CUSTOM_TRAP(H_T0_Instruction_Access_MMU_Miss_0x09)
		#endif
	#endif

.align 32	
#else	
	NORMAL_TRAP(0x09); 
#endif

T0_Instruction_Access_Error_0x0a:		
#ifdef H_T0_Instruction_access_error_0x0a
#ifdef SUN_H_T0_Instruction_access_error_0x0a
	 SUN_H_T0_Instruction_access_error_0x0a 
#else
        CUSTOM_TRAP(H_T0_Instruction_access_error_0x0a)
#endif
.align 32
#else
	NORMAL_TRAP(0x0a); 
#endif

T0_Reserved_0x0b:		
#ifdef H_T0_Reserved_0x0b
#ifdef SUN_H_T0_Reserved_0x0b
	 SUN_H_T0_Reserved_0x0b 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x0b)
#endif
.align 32
#else
	NORMAL_TRAP(0x0b); 
#endif

T0_Reserved_0x0c:		
#ifdef H_T0_Reserved_0x0c
#ifdef SUN_H_T0_Reserved_0x0c
	 SUN_H_T0_Reserved_0x0c 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x0c)
#endif
.align 32
#else
	NORMAL_TRAP(0x0c); 
#endif

T0_Reserved_0x0d:		
#ifdef H_T0_Reserved_0x0d
#ifdef SUN_H_T0_Reserved_0x0d
	 SUN_H_T0_Reserved_0x0d 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x0d)
#endif
.align 32
#else
	NORMAL_TRAP(0x0d); 
#endif

T0_Reserved_0x0e:		
#ifdef H_T0_Reserved_0x0e
#ifdef SUN_H_T0_Reserved_0x0e
	 SUN_H_T0_Reserved_0x0e 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x0e)
#endif
.align 32
#else
	NORMAL_TRAP(0x0e); 
#endif

T0_Reserved_0x0f:		
#ifdef H_T0_Reserved_0x0f
#ifdef SUN_H_T0_Reserved_0x0f
	 SUN_H_T0_Reserved_0x0f 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x0f)
#endif
.align 32
#else
	NORMAL_TRAP(0x0f); 
#endif

T0_Illegal_Instruction_0x10:
#ifdef H_T0_Illegal_instruction_0x10
#ifdef SUN_H_T0_Illegal_instruction_0x10
	 SUN_H_T0_Illegal_instruction_0x10 
#else
#	ifdef My_T0_Illegal_instruction_0x10
		My_T0_Illegal_instruction_0x10
#	else
        	CUSTOM_TRAP(H_T0_Illegal_instruction_0x10)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x10)
#endif

T0_Privileged_Opcode_0x11:
#ifdef H_T0_Privileged_opcode_0x11
#ifdef SUN_H_T0_Privileged_opcode_0x11
	 SUN_H_T0_Privileged_opcode_0x11 
#else
#	ifdef My_T0_Privileged_opcode_0x11
		My_T0_Privileged_opcode_0x11
#	else
        	CUSTOM_TRAP(H_T0_Privileged_opcode_0x11)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x11)
#endif

T0_Unimplemented_LDD_0x12:
#ifdef H_T0_Unimplemented_LDD_0x12
#ifdef SUN_H_T0_Unimplemented_LDD_0x12
	 SUN_H_T0_Unimplemented_LDD_0x12 
#else
        CUSTOM_TRAP(H_T0_Unimplemented_LDD_0x12)
#endif
.align 32
#else
	NORMAL_TRAP(0x12)
#endif

T0_Unimplemented_STD_0x13:
#ifdef H_T0_Unimplemented_STD_0x13
#ifdef SUN_H_T0_Unimplemented_STD_0x13
	 SUN_H_T0_Unimplemented_STD_0x13 
#else
        CUSTOM_TRAP(H_T0_Unimplemented_STD_0x13)
#endif
.align 32
#else
	NORMAL_TRAP(0x13)
#endif

T0_Reserved_0x14:		
#ifdef H_T0_Reserved_0x14
#ifdef SUN_H_T0_Reserved_0x14
	 SUN_H_T0_Reserved_0x14 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x14)
#endif
.align 32
#else
	NORMAL_TRAP(0x14); 
#endif

T0_Reserved_0x15:		
#ifdef H_T0_Reserved_0x15
#ifdef SUN_H_T0_Reserved_0x15
	 SUN_H_T0_Reserved_0x15 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x15)
#endif
.align 32
#else
	NORMAL_TRAP(0x15); 
#endif

T0_Reserved_0x16:		
#ifdef H_T0_Reserved_0x16
#ifdef SUN_H_T0_Reserved_0x16
	 SUN_H_T0_Reserved_0x16 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x16)
#endif
.align 32
#else
	NORMAL_TRAP(0x16); 
#endif

T0_Reserved_0x17:		
#ifdef H_T0_Reserved_0x17
#ifdef SUN_H_T0_Reserved_0x17
	 SUN_H_T0_Reserved_0x17 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x17)
#endif
.align 32
#else
	NORMAL_TRAP(0x17); 
#endif

T0_Reserved_0x18:		
#ifdef H_T0_Reserved_0x18
#ifdef SUN_H_T0_Reserved_0x18
	 SUN_H_T0_Reserved_0x18 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x18)
#endif
.align 32
#else
	NORMAL_TRAP(0x18); 
#endif

T0_Reserved_0x19:		
#ifdef H_T0_Reserved_0x19
#ifdef SUN_H_T0_Reserved_0x19
	 SUN_H_T0_Reserved_0x19 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x19)
#endif
.align 32
#else
	NORMAL_TRAP(0x19); 
#endif

T0_Reserved_0x1a:		
#ifdef H_T0_Reserved_0x1a
#ifdef SUN_H_T0_Reserved_0x1a
	 SUN_H_T0_Reserved_0x1a 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x1a)
#endif
.align 32
#else
	NORMAL_TRAP(0x1a); 
#endif

T0_Reserved_0x1b:		
#ifdef H_T0_Reserved_0x1b
#ifdef SUN_H_T0_Reserved_0x1b
	 SUN_H_T0_Reserved_0x1b 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x1b)
#endif
.align 32
#else
	NORMAL_TRAP(0x1b); 
#endif

T0_Reserved_0x1c:		
#ifdef H_T0_Reserved_0x1c
#ifdef SUN_H_T0_Reserved_0x1c
	 SUN_H_T0_Reserved_0x1c 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x1c)
#endif
.align 32
#else
	NORMAL_TRAP(0x1c); 
#endif

T0_Reserved_0x1d:		
#ifdef H_T0_Reserved_0x1d
#ifdef SUN_H_T0_Reserved_0x1d
	 SUN_H_T0_Reserved_0x1d 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x1d)
#endif
.align 32
#else
	NORMAL_TRAP(0x1d); 
#endif

T0_Reserved_0x1e:		
#ifdef H_T0_Reserved_0x1e
#ifdef SUN_H_T0_Reserved_0x1e
	 SUN_H_T0_Reserved_0x1e 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x1e)
#endif
.align 32
#else
	NORMAL_TRAP(0x1e); 
#endif

T0_Reserved_0x1f:		
#ifdef H_T0_Reserved_0x1f
#ifdef SUN_H_T0_Reserved_0x1f
	 SUN_H_T0_Reserved_0x1f 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x1f)
#endif
.align 32
#else
	NORMAL_TRAP(0x1f); 
#endif

T0_Fp_Disabled_0x20:
#ifdef H_T0_Fp_disabled_0x20
#ifdef SUN_H_T0_Fp_disabled_0x20
	 SUN_H_T0_Fp_disabled_0x20 
#else
#	ifdef My_T0_Fp_disabled_0x20
		My_T0_Fp_disabled_0x20
#	else
        	CUSTOM_TRAP(H_T0_Fp_disabled_0x20)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x20)
#endif

T0_Fp_Exception_Ieee_754_0x21:		
#ifdef H_T0_Fp_exception_ieee_754_0x21
#ifdef SUN_H_T0_Fp_exception_ieee_754_0x21
	 SUN_H_T0_Fp_exception_ieee_754_0x21 
#else
#	ifdef My_T0_Fp_exception_ieee_754_0x21
		My_T0_Fp_exception_ieee_754_0x21
#	else
        	CUSTOM_TRAP(H_T0_Fp_exception_ieee_754_0x21)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x21); 
#endif

T0_Fp_Exception_Other_0x22:		
#ifdef H_T0_Fp_exception_other_0x22
#ifdef SUN_H_T0_Fp_exception_other_0x22
	 SUN_H_T0_Fp_exception_other_0x22 
#else
#	ifdef My_T0_Fp_exception_other_0x22
		My_T0_Fp_exception_other_0x22
#	else
        CUSTOM_TRAP(H_T0_Fp_exception_other_0x22)
#endif
#endif
.align 32
#else
	NORMAL_TRAP(0x22); 
#endif

T0_Tag_Overflow_0x23:		
#ifdef H_T0_Tag_Overflow
#ifdef SUN_H_T0_Tag_Overflow
	 SUN_H_T0_Tag_Overflow 
#else
#	ifdef My_T0_Tag_Overflow
		My_T0_Tag_Overflow
#	else
		CUSTOM_TRAP(H_T0_Tag_Overflow)
#	endif
#endif
#else
	NORMAL_TRAP(0x23); 
#endif
.align	32

T0_Clean_Window_0x24:
#ifdef H_T0_Clean_Window
#ifdef SUN_H_T0_Clean_Window
	 SUN_H_T0_Clean_Window 
#else
#	ifdef My_T0_Clean_Window
		My_T0_Clean_Window
#	else
		CUSTOM_TRAP(H_T0_Clean_Window)
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

T0_Division_By_Zero_0x28:		
#ifdef H_T0_Division_By_Zero
#ifdef SUN_H_T0_Division_By_Zero
	 SUN_H_T0_Division_By_Zero 
#else
#	ifdef My_T0_Division_By_Zero
		My_T0_Division_By_Zero
#	else
		CUSTOM_TRAP(H_T0_Division_By_Zero)
#	endif
#endif
#else
	NORMAL_TRAP(0x28); 	
#endif
.align 32	                

T0_Reserved_0x29:		
#ifdef H_T0_Reserved_0x29
#ifdef SUN_H_T0_Reserved_0x29
	 SUN_H_T0_Reserved_0x29 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x29)
#endif
.align 32
#else
	NORMAL_TRAP(0x29); 
#endif

T0_Reserved_0x2a:		
#ifdef H_T0_Reserved_0x2a
#ifdef SUN_H_T0_Reserved_0x2a
	 SUN_H_T0_Reserved_0x2a 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x2a)
#endif
.align 32
#else
	NORMAL_TRAP(0x2a); 
#endif

T0_Reserved_0x2b:		
#ifdef H_T0_Reserved_0x2b
#ifdef SUN_H_T0_Reserved_0x2b
	 SUN_H_T0_Reserved_0x2b 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x2b)
#endif
.align 32
#else
	NORMAL_TRAP(0x2b); 
#endif

T0_Reserved_0x2c:		
#ifdef H_T0_Reserved_0x2c
#ifdef SUN_H_T0_Reserved_0x2c
	 SUN_H_T0_Reserved_0x2c 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x2c)
#endif
.align 32
#else
	NORMAL_TRAP(0x2c); 
#endif

T0_Reserved_0x2d:		
#ifdef H_T0_Reserved_0x2d
#ifdef SUN_H_T0_Reserved_0x2d
	 SUN_H_T0_Reserved_0x2d 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x2d)
#endif
.align 32
#else
	NORMAL_TRAP(0x2d); 
#endif

T0_Reserved_0x2e:		
#ifdef H_T0_Reserved_0x2e
#ifdef SUN_H_T0_Reserved_0x2e
	 SUN_H_T0_Reserved_0x2e 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x2e)
#endif
.align 32
#else
	NORMAL_TRAP(0x2e); 
#endif

T0_Reserved_0x2f:		
#ifdef H_T0_Reserved_0x2f
#ifdef SUN_H_T0_Reserved_0x2f
	 SUN_H_T0_Reserved_0x2f 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x2f)
#endif
.align 32
#else
	NORMAL_TRAP(0x2f); 
#endif

T0_Data_Access_Exception_0x30:		
#ifdef H_T0_Data_Access_Exception_0x30
#ifdef SUN_H_T0_Data_Access_Exception_0x30
	 SUN_H_T0_Data_Access_Exception_0x30 
#else

#	ifdef My_T0_Data_Access_Exception_0x30
		My_T0_Data_Access_Exception_0x30
#	else
	        CUSTOM_TRAP(H_T0_Data_Access_Exception_0x30)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x30); 
#endif

T0_Reserved_0x31:		
#ifdef H_T0_Reserved_0x31
#ifdef SUN_H_T0_Reserved_0x31
	 SUN_H_T0_Reserved_0x31 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x31)
#endif
.align 32
#else
	NORMAL_TRAP(0x31); 
#endif


T0_Data_Access_Error_0x32:		
#ifdef H_T0_Data_access_error_0x32
#ifdef SUN_H_T0_Data_access_error_0x32
	 SUN_H_T0_Data_access_error_0x32 
#else
        CUSTOM_TRAP(H_T0_Data_access_error_0x32)
#endif
.align 32
#else
	NORMAL_TRAP(0x32); 
#endif

T0_Reserved_0x33:		
#ifdef H_T0_Reserved_0x33
#ifdef SUN_H_T0_Reserved_0x33
	 SUN_H_T0_Reserved_0x33 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x33)
#endif
.align 32
#else
	NORMAL_TRAP(0x33);
#endif

T0_Mem_Address_Not_Aligned_0x34:		
#ifdef H_T0_Mem_Address_Not_Aligned_0x34
#ifdef SUN_H_T0_Mem_Address_Not_Aligned_0x34
	 SUN_H_T0_Mem_Address_Not_Aligned_0x34 
#else
#	ifdef My_T0_Mem_Address_Not_Aligned_0x34
		My_T0_Mem_Address_Not_Aligned_0x34
#	else
		CUSTOM_TRAP(H_T0_Mem_Address_Not_Aligned_0x34)
#	endif
#endif
.align 32
#else
		NORMAL_TRAP(0x34); 
#endif

T0_Lddf_Mem_Address_Not_Aligned_0x35:
#ifdef H_T0_Lddf_Mem_Address_Not_Aligned_0x35
#ifdef SUN_H_T0_Lddf_Mem_Address_Not_Aligned_0x35
	 SUN_H_T0_Lddf_Mem_Address_Not_Aligned_0x35 
#else
#	ifdef My_T0_Lddf_Mem_Address_Not_Aligned_0x35
		My_T0_Lddf_Mem_Address_Not_Aligned_0x35
#	else
		CUSTOM_TRAP(H_T0_Lddf_Mem_Address_Not_Aligned_0x35)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x35); 
#endif

T0_Stdf_Mem_Address_Not_Aligned_0x36:
#ifdef H_T0_Stdf_Mem_Address_Not_Aligned_0x36
#ifdef SUN_H_T0_Stdf_Mem_Address_Not_Aligned_0x36
	 SUN_H_T0_Stdf_Mem_Address_Not_Aligned_0x36 
#else
#	ifdef My_T0_Stdf_Mem_Address_Not_Aligned_0x36
		My_T0_Stdf_Mem_Address_Not_Aligned_0x36
#	else
		CUSTOM_TRAP(H_T0_Stdf_Mem_Address_Not_Aligned_0x36)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x36); 
#endif

T0_Privileged_Action_0x37:		
#ifdef H_T0_Privileged_Action_0x37
#ifdef SUN_H_T0_Privileged_Action_0x37
	 SUN_H_T0_Privileged_Action_0x37 
#else
#	ifdef My_T0_Privileged_Action_0x37
		My_T0_Privileged_Action_0x37
#	else
		CUSTOM_TRAP(H_T0_Privileged_Action_0x37)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x37); 
#endif

T0_Reserved_0x38:		
#ifdef H_T0_Reserved_0x38
#ifdef SUN_H_T0_Reserved_0x38
	 SUN_H_T0_Reserved_0x38 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x38)
#endif
.align 32
#else
	NORMAL_TRAP(0x38); 
#endif

T0_Reserved_0x39:		
#ifdef H_T0_Reserved_0x39
#ifdef SUN_H_T0_Reserved_0x39
	 SUN_H_T0_Reserved_0x39 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x39)
#endif
.align 32
#else
	NORMAL_TRAP(0x39); 
#endif

T0_Reserved_0x3a:		
#ifdef H_T0_Reserved_0x3a
#ifdef SUN_H_T0_Reserved_0x3a
	 SUN_H_T0_Reserved_0x3a 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x3a)
#endif
.align 32
#else
	NORMAL_TRAP(0x3a); 
#endif

T0_Reserved_0x3b:		
#ifdef H_T0_Reserved_0x3b
#ifdef SUN_H_T0_Reserved_0x3b
	 SUN_H_T0_Reserved_0x3b 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x3b)
#endif
.align 32
#else
	NORMAL_TRAP(0x3b); 
#endif

T0_Reserved_0x3c:		
#ifdef H_T0_Reserved_0x3b
#ifdef SUN_H_T0_Reserved_0x3b
	 SUN_H_T0_Reserved_0x3b 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x3b)
#endif
.align 32
#else
	NORMAL_TRAP(0x3c); 
#endif

T0_Reserved_0x3d:		
#ifdef H_T0_Reserved_0x3d
#ifdef SUN_H_T0_Reserved_0x3d
	 SUN_H_T0_Reserved_0x3d 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x3d)
#endif
.align 32
#else
	NORMAL_TRAP(0x3d); 
#endif

T0_Reserved_0x3e:		
#ifdef H_T0_Reserved_0x3e
#ifdef SUN_H_T0_Reserved_0x3e
	 SUN_H_T0_Reserved_0x3e 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x3e)
#endif
.align 32
#else
	NORMAL_TRAP(0x3e); 
#endif

T0_Reserved_0x3f:		
#ifdef H_T0_Reserved_0x3f
#ifdef SUN_H_T0_Reserved_0x3f
	 SUN_H_T0_Reserved_0x3f 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x3f)
#endif
.align 32
#else
	NORMAL_TRAP(0x3f); 
#endif

T0_Reserved_0x40:		
#ifdef H_T0_Reserved_0x40
#ifdef SUN_H_T0_Reserved_0x40
	 SUN_H_T0_Reserved_0x40 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x40)
#endif
.align 32
#else
	NORMAL_TRAP(0x40); 
#endif

T0_Interrupt_Level_1_0x41:		
#ifdef H_T0_Interrupt_Level_1_0x41
#ifdef SUN_H_T0_Interrupt_Level_1_0x41
	 SUN_H_T0_Interrupt_Level_1_0x41 
#else
#	ifdef My_T0_Interrupt_Level_1_0x41
		My_T0_Interrupt_Level_1_0x41
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_1_0x41)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x41); 
#endif

T0_Interrupt_Level_2_0x42:		
#ifdef H_T0_Interrupt_Level_2_0x42
#ifdef SUN_H_T0_Interrupt_Level_2_0x42
	 SUN_H_T0_Interrupt_Level_2_0x42 
#else
#	ifdef My_T0_Interrupt_Level_2_0x42
		My_T0_Interrupt_Level_2_0x42
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_2_0x42)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x42); 
#endif

T0_Interrupt_Level_3_0x43:		
#ifdef H_T0_Interrupt_Level_3_0x43
#ifdef SUN_H_T0_Interrupt_Level_3_0x43
	 SUN_H_T0_Interrupt_Level_3_0x43 
#else
#	ifdef My_T0_Interrupt_Level_3_0x43
		My_T0_Interrupt_Level_3_0x43
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_3_0x43)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x43); 
#endif

T0_Interrupt_Level_4_0x44:		
#ifdef H_T0_Interrupt_Level_4_0x44
#ifdef SUN_H_T0_Interrupt_Level_4_0x44
	 SUN_H_T0_Interrupt_Level_4_0x44 
#else
#	ifdef My_T0_Interrupt_Level_4_0x44
		My_T0_Interrupt_Level_4_0x44
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_4_0x44)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x44); 
#endif

T0_Interrupt_Level_5_0x45:		
#ifdef H_T0_Interrupt_Level_5_0x45
#ifdef SUN_H_T0_Interrupt_Level_5_0x45
	 SUN_H_T0_Interrupt_Level_5_0x45 
#else
#	ifdef My_T0_Interrupt_Level_5_0x45
		My_T0_Interrupt_Level_5_0x45
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_5_0x45)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x45); 
#endif

T0_Interrupt_Level_6_0x46:		
#ifdef H_T0_Interrupt_Level_6_0x46
#ifdef SUN_H_T0_Interrupt_Level_6_0x46
	 SUN_H_T0_Interrupt_Level_6_0x46 
#else
#	ifdef My_T0_Interrupt_Level_6_0x46
		My_T0_Interrupt_Level_6_0x46
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_6_0x46)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x46); 
#endif

T0_Interrupt_Level_7_0x47:		
#ifdef H_T0_Interrupt_Level_7_0x47
#ifdef SUN_H_T0_Interrupt_Level_7_0x47
	 SUN_H_T0_Interrupt_Level_7_0x47 
#else
#	ifdef My_T0_Interrupt_Level_7_0x47
		My_T0_Interrupt_Level_7_0x47
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_7_0x47)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x47); 
#endif

T0_Interrupt_Level_8_0x48:		
#ifdef H_T0_Interrupt_Level_8_0x48
#ifdef SUN_H_T0_Interrupt_Level_8_0x48
	 SUN_H_T0_Interrupt_Level_8_0x48 
#else
#	ifdef My_T0_Interrupt_Level_8_0x48
		My_T0_Interrupt_Level_8_0x48
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_8_0x48)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x48); 
#endif

T0_Interrupt_Level_9_0x49:		
#ifdef H_T0_Interrupt_Level_9_0x49
#ifdef SUN_H_T0_Interrupt_Level_9_0x49
	 SUN_H_T0_Interrupt_Level_9_0x49 
#else
#	ifdef My_T0_Interrupt_Level_9_0x49
		My_T0_Interrupt_Level_9_0x49
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_9_0x49)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x49); 
#endif

T0_Interrupt_Level_10_0x4a:		
#ifdef H_T0_Interrupt_Level_10_0x4a
#ifdef SUN_H_T0_Interrupt_Level_10_0x4a
	 SUN_H_T0_Interrupt_Level_10_0x4a 
#else
#	ifdef My_T0_Interrupt_Level_10_0x4a
		My_T0_Interrupt_Level_10_0x4a
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_10_0x4a)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4a); 
#endif

T0_Interrupt_Level_11_0x4b:		
#ifdef H_T0_Interrupt_Level_11_0x4b
#ifdef SUN_H_T0_Interrupt_Level_11_0x4b
	 SUN_H_T0_Interrupt_Level_11_0x4b 
#else
#	ifdef My_T0_Interrupt_Level_11_0x4b
		My_T0_Interrupt_Level_11_0x4b
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_11_0x4b)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4b); 
#endif

T0_Interrupt_Level_12_0x4c:		
#ifdef H_T0_Interrupt_Level_12_0x4c
#ifdef SUN_H_T0_Interrupt_Level_12_0x4c
	 SUN_H_T0_Interrupt_Level_12_0x4c 
#else
#	ifdef My_T0_Interrupt_Level_12_0x4c
		My_T0_Interrupt_Level_12_0x4c
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_12_0x4c)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4c); 
#endif

T0_Interrupt_Level_13_0x4d:		
#ifdef H_T0_Interrupt_Level_13_0x4d
#ifdef SUN_H_T0_Interrupt_Level_13_0x4d
	 SUN_H_T0_Interrupt_Level_13_0x4d 
#else
#	ifdef My_T0_Interrupt_Level_13_0x4d
		My_T0_Interrupt_Level_13_0x4d
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_13_0x4d)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4d); 
#endif

T0_Interrupt_Level_14_0x4e:		
#ifdef H_T0_Interrupt_Level_14_0x4e
#ifdef SUN_H_T0_Interrupt_Level_14_0x4e
	 SUN_H_T0_Interrupt_Level_14_0x4e 
#else
#	ifdef My_T0_Interrupt_Level_14_0x4e
		My_T0_Interrupt_Level_14_0x4e
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_14_0x4e)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4e); 
#endif

T0_Interrupt_Level_15_0x4f:		
#ifdef H_T0_Interrupt_Level_15_0x4f
#ifdef SUN_H_T0_Interrupt_Level_15_0x4f
	 SUN_H_T0_Interrupt_Level_15_0x4f 
#else
#	ifdef My_T0_Interrupt_Level_15_0x4f
		My_T0_Interrupt_Level_15_0x4f
#	else
		CUSTOM_TRAP(H_T0_Interrupt_Level_15_0x4f)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4f); 
#endif

T0_Reserved_0x50:		
#ifdef H_T0_Reserved_0x50
#ifdef SUN_H_T0_Reserved_0x50
	 SUN_H_T0_Reserved_0x50 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x50)
#endif
.align 32
#else
	NORMAL_TRAP(0x50); 
#endif

T0_Reserved_0x51:		
#ifdef H_T0_Reserved_0x51
#ifdef SUN_H_T0_Reserved_0x51
	 SUN_H_T0_Reserved_0x51 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x51)
#endif
.align 32
#else
	NORMAL_TRAP(0x51); 
#endif

T0_Reserved_0x52:		
#ifdef H_T0_Reserved_0x52
#ifdef SUN_H_T0_Reserved_0x52
	 SUN_H_T0_Reserved_0x52 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x52)
#endif
.align 32
#else
	NORMAL_TRAP(0x52); 
#endif

T0_Reserved_0x53:		
#ifdef H_T0_Reserved_0x53
#ifdef SUN_H_T0_Reserved_0x53
	 SUN_H_T0_Reserved_0x53 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x53)
#endif
.align 32
#else
	NORMAL_TRAP(0x53); 
#endif

T0_Reserved_0x54:		
#ifdef H_T0_Reserved_0x54
#ifdef SUN_H_T0_Reserved_0x54
	 SUN_H_T0_Reserved_0x54 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x54)
#endif
.align 32
#else
	NORMAL_TRAP(0x54); 
#endif

T0_Reserved_0x55:		
#ifdef H_T0_Reserved_0x55
#ifdef SUN_H_T0_Reserved_0x55
	 SUN_H_T0_Reserved_0x55 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x55)
#endif
.align 32
#else
	NORMAL_TRAP(0x55); 
#endif

T0_Reserved_0x56:		
#ifdef H_T0_Reserved_0x56
#ifdef SUN_H_T0_Reserved_0x56
	 SUN_H_T0_Reserved_0x56 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x56)
#endif
.align 32
#else
	NORMAL_TRAP(0x56); 
#endif

T0_Reserved_0x57:		
#ifdef H_T0_Reserved_0x57
#ifdef SUN_H_T0_Reserved_0x57
	 SUN_H_T0_Reserved_0x57 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x57)
#endif
.align 32
#else
	NORMAL_TRAP(0x57); 
#endif

T0_Reserved_0x58:		
#ifdef H_T0_Reserved_0x58
#ifdef SUN_H_T0_Reserved_0x58
	 SUN_H_T0_Reserved_0x58 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x58)
#endif
.align 32
#else
	NORMAL_TRAP(0x58); 
#endif

T0_Reserved_0x59:		
#ifdef H_T0_Reserved_0x59
#ifdef SUN_H_T0_Reserved_0x59
	 SUN_H_T0_Reserved_0x59 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x59)
#endif
.align 32
#else
	NORMAL_TRAP(0x59); 
#endif

T0_Reserved_0x5a:		
#ifdef H_T0_Reserved_0x5a
#ifdef SUN_H_T0_Reserved_0x5a
	 SUN_H_T0_Reserved_0x5a 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x5a)
#endif
.align 32
#else
	NORMAL_TRAP(0x5a); 
#endif

T0_Reserved_0x5b:		
#ifdef H_T0_Reserved_0x5b
#ifdef SUN_H_T0_Reserved_0x5b
	 SUN_H_T0_Reserved_0x5b 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x5b)
#endif
.align 32
#else
	NORMAL_TRAP(0x5b); 
#endif

T0_Reserved_0x5c:		
#ifdef H_T0_Reserved_0x5c
#ifdef SUN_H_T0_Reserved_0x5c
	 SUN_H_T0_Reserved_0x5c 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x5c)
#endif
.align 32
#else
	NORMAL_TRAP(0x5c); 
#endif

T0_Reserved_0x5d:		
#ifdef H_T0_Reserved_0x5d
#ifdef SUN_H_T0_Reserved_0x5d
	 SUN_H_T0_Reserved_0x5d 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x5d)
#endif
.align 32
#else
	NORMAL_TRAP(0x5d); 
#endif

T0_Reserved_0x5e:		
#ifdef H_T0_Reserved_0x5e
#ifdef SUN_H_T0_Reserved_0x5e
	 SUN_H_T0_Reserved_0x5e 
#else
#       ifdef My_T0_Reserved_0x5e
                My_T0_Reserved_0x5e
#       else
        	CUSTOM_TRAP(H_T0_Reserved_0x5e)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x5e); 
#endif

T0_Reserved_0x5f:		
#ifdef H_T0_Reserved_0x5f
#ifdef SUN_H_T0_Reserved_0x5f
	 SUN_H_T0_Reserved_0x5f 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x5f)
#endif
.align 32
#else
	NORMAL_TRAP(0x5f); 
#endif 

T0_Interrupt_0x60:		
#ifdef H_T0_Interrupt_0x60
#ifdef SUN_H_T0_Interrupt_0x60
	 SUN_H_T0_Interrupt_0x60 
#else
#	ifdef My_T0_Interrupt_0x60
		My_T0_Interrupt_0x60
#	else
		CUSTOM_TRAP(H_T0_Interrupt_0x60)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x60); 
#endif

T0_Reserved_0x61:		
#ifdef H_T0_Reserved_0x61
#ifdef SUN_H_T0_Reserved_0x61
	 SUN_H_T0_Reserved_0x61 
#else
#       ifdef My_T0_Reserved_0x61
                My_T0_Reserved_0x61
#       else    
		CUSTOM_TRAP(H_T0_Reserved_0x61)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x61); 
#endif

T0_VA_Watchpoint_0x62:		
#ifdef H_T0_VA_Watchpoint_0x62
#ifdef SUN_H_T0_VA_Watchpoint_0x62
	 SUN_H_T0_VA_Watchpoint_0x62 
#else
#       ifdef My_T0_VA_Watchpoint_0x62
                My_T0_VA_Watchpoint_0x62
#       else    
              CUSTOM_TRAP(H_T0_VA_Watchpoint_0x62)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x62); 
#endif

T0_Corrected_ECC_error_0x63:		
#ifdef H_T0_Corrected_ECC_error_0x63
#ifdef SUN_H_T0_Corrected_ECC_error_0x63
	 SUN_H_T0_Corrected_ECC_error_0x63 
#else
        CUSTOM_TRAP(H_T0_Corrected_ECC_error_0x63)
#endif
.align 32
#else
	NORMAL_TRAP(0x63); 
#endif

T0_Fast_Instr_Access_MMU_Miss_0x64:
    EXIT_BAD

.align 128	
T0_Fast_Data_Access_MMU_Miss_0x68:
    EXIT_BAD

.align 128	
T0_Fast_Data_Access_Protection_0x6c:		
#ifdef H_T0_data_access_protection_0x6c
#ifdef SUN_H_T0_data_access_protection_0x6c
	 SUN_H_T0_data_access_protection_0x6c 
#else
        CUSTOM_TRAP(H_T0_data_access_protection_0x6c)
#endif
#else
		NORMAL_TRAP(0x6c);
#endif

.align 128	
T0_Reserved_0x70:		
#ifdef H_T0_Reserved_0x70
#ifdef SUN_H_T0_Reserved_0x70
	 SUN_H_T0_Reserved_0x70 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x70)
#endif
.align 32
#else
	NORMAL_TRAP(0x70); 
#endif

T0_Reserved_0x71:		
#ifdef H_T0_Reserved_0x71
#ifdef SUN_H_T0_Reserved_0x71
	 SUN_H_T0_Reserved_0x71 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x71)
#endif
.align 32
#else
	NORMAL_TRAP(0x71); 
#endif

T0_Reserved_0x72:		
#ifdef H_T0_Reserved_0x72
#ifdef SUN_H_T0_Reserved_0x72
	 SUN_H_T0_Reserved_0x72 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x72)
#endif
.align 32
#else
	NORMAL_TRAP(0x72); 
#endif

T0_Reserved_0x73:		
#ifdef H_T0_Reserved_0x73
#ifdef SUN_H_T0_Reserved_0x73
	 SUN_H_T0_Reserved_0x73 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x73)
#endif
.align 32
#else
	NORMAL_TRAP(0x73); 
#endif

T0_Control_Transfer_Instr_0x74:		
#ifdef H_T0_Control_Transfer_Instr_0x74
#ifdef SUN_H_T0_Control_Transfer_Instr_0x74
	 SUN_H_T0_Control_Transfer_Instr_0x74 
#else
#	ifdef My_H_T0_Control_Transfer_Instr_0x74
		My_H_T0_Control_Transfer_Instr_0x74
#	else	
		CUSTOM_TRAP(H_T0_Control_Transfer_Instr_0x74)
#	endif	
#endif
.align 32
#else
	NORMAL_TRAP(0x74); 
#endif

T0_Instruction_VA_Watchpoint_0x75:		
#ifdef H_T0_Instruction_VA_Watchpoint_0x75
#ifdef SUN_H_T0_Instruction_VA_Watchpoint_0x75
	 SUN_H_T0_Instruction_VA_Watchpoint_0x75 
#else
        CUSTOM_TRAP(H_T0_Instruction_VA_Watchpoint_0x75)
#endif
.align 32
#else
	NORMAL_TRAP(0x75); 
#endif

T0_Reserved_0x76:		
#ifdef H_T0_Reserved_0x76
#ifdef SUN_H_T0_Reserved_0x76
	 SUN_H_T0_Reserved_0x76 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x76)
#endif
.align 32
#else
	NORMAL_TRAP(0x76); 
#endif

T0_Reserved_0x77:		
#ifdef H_T0_Reserved_0x77
#ifdef SUN_H_T0_Reserved_0x77
	 SUN_H_T0_Reserved_0x77 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x77)
#endif
.align 32
#else
	NORMAL_TRAP(0x77); 
#endif

T0_Reserved_0x78:		
#ifdef H_T0_Reserved_0x78
#ifdef SUN_H_T0_Reserved_0x78
	 SUN_H_T0_Reserved_0x78 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x78)
#endif
.align 32
#else
	NORMAL_TRAP(0x78); 
#endif

T0_Reserved_0x79:		
#ifdef H_T0_Reserved_0x79
#ifdef SUN_H_T0_Reserved_0x79
	 SUN_H_T0_Reserved_0x79 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x79)
#endif
.align 32
#else
	NORMAL_TRAP(0x79); 
#endif

T0_Reserved_0x7a:		
#ifdef H_T0_Reserved_0x7a
#ifdef SUN_H_T0_Reserved_0x7a
	 SUN_H_T0_Reserved_0x7a 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x7a)
#endif
.align 32
#else
	NORMAL_TRAP(0x7a); 
#endif

T0_Reserved_0x7b:		
#ifdef H_T0_Reserved_0x7b
#ifdef SUN_H_T0_Reserved_0x7b
	 SUN_H_T0_Reserved_0x7b 
#else
        CUSTOM_TRAP(H_T0_Reserved_0x7b)
#endif
.align 32
#else
	NORMAL_TRAP(0x7b); 
#endif

T0_Cpu_Mondo_Trap_0x7c:
#ifdef H_T0_Cpu_Mondo_Trap_0x7c
#ifdef SUN_H_T0_Cpu_Mondo_Trap_0x7c
	 SUN_H_T0_Cpu_Mondo_Trap_0x7c 
#else
#	ifdef My_T0_Cpu_Mondo_Trap_0x7c
		My_T0_Cpu_Mondo_Trap_0x7c
#	else	
		CUSTOM_TRAP(H_T0_Cpu_Mondo_Trap_0x7c)
#	endif	
#endif
.align 32
#else
	NORMAL_TRAP(0x7c); 
#endif

T0_Dev_Mondo_Trap_0x7d:
#ifdef H_T0_Dev_Mondo_Trap_0x7d
#ifdef SUN_H_T0_Dev_Mondo_Trap_0x7d
	 SUN_H_T0_Dev_Mondo_Trap_0x7d 
#else	
#	ifdef My_T0_Dev_Mondo_Trap_0x7d
		My_T0_Dev_Mondo_Trap_0x7d
#	else	
		CUSTOM_TRAP(H_T0_Dev_Mondo_Trap_0x7d)
#	endif	
#endif	
.align 32
#else
	NORMAL_TRAP(0x7d);
#endif

T0_Resumable_Error_0x7e:
#ifdef H_T0_Resumable_Error_0x7e
#ifdef SUN_H_T0_Resumable_Error_0x7e
	 SUN_H_T0_Resumable_Error_0x7e
#else	
#	ifdef My_T0_Resumable_Error_0x7e
		My_T0_Resumable_Error_0x7e
#	else	
		CUSTOM_TRAP(H_T0_Resumable_Error_0x7e)
#	endif	
#endif
.align 32
#else	
	NORMAL_TRAP(0x7e); 
#endif

T0_Non_Resumable_Error_0x7f:
#ifdef H_T0_Non_Resumable_Error_0x7f
#ifdef SUN_H_T0_Non_Resumable_Error_0x7f
	 SUN_H_T0_Non_Resumable_Error_0x7f 
#else
#	ifdef My_T0_Non_Resumable_Error_0x7f
		My_T0_Non_Resumable_Error_0x7f
#	else	
		CUSTOM_TRAP(H_T0_Non_Resumable_Error_0x7f)
#	endif	
#endif
.align 32
#else	
	NORMAL_TRAP(0x7f);
#endif	

T0_Window_Spill_0_Normal_0x80:		
#ifdef H_T0_Window_Spill_0_Normal_Trap
#ifdef SUN_H_T0_Window_Spill_0_Normal_Trap
	 SUN_H_T0_Window_Spill_0_Normal_Trap 
#else
#	ifdef My_T0_Window_Spill_0_Normal_Trap
		My_T0_Window_Spill_0_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_0_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x80)
#endif
#endif

.align 128	
T0_Window_Spill_1_Normal_0x84:		
#ifdef H_T0_Window_Spill_1_Normal_Trap
#ifdef SUN_H_T0_Window_Spill_1_Normal_Trap
	 SUN_H_T0_Window_Spill_1_Normal_Trap 
#else
#	ifdef My_T0_Window_Spill_1_Normal_Trap
		My_T0_Window_Spill_1_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_1_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x84)
#endif
#endif

.align 128	
T0_Window_Spill_2_Normal_0x88:		
#ifdef H_T0_Window_Spill_2_Normal_Trap
#ifdef SUN_H_T0_Window_Spill_2_Normal_Trap
	 SUN_H_T0_Window_Spill_2_Normal_Trap 
#else
#	ifdef My_T0_Window_Spill_2_Normal_Trap
		My_T0_Window_Spill_2_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_2_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x88)
#endif
#endif

.align 128	
T0_Window_Spill_3_Normal_0x8c:		
#ifdef H_T0_Window_Spill_3_Normal_Trap
#ifdef SUN_H_T0_Window_Spill_3_Normal_Trap
	 SUN_H_T0_Window_Spill_3_Normal_Trap 
#else
#	ifdef My_T0_Window_Spill_3_Normal_Trap
		My_T0_Window_Spill_3_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_3_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x8c)
#endif
#endif

.align 128	
T0_Window_Spill_4_Normal_0x90:
#ifdef H_T0_Window_Spill_4_Normal_Trap
#ifdef SUN_H_T0_Window_Spill_4_Normal_Trap
	 SUN_H_T0_Window_Spill_4_Normal_Trap 
#else
#	ifdef My_T0_Window_Spill_4_Normal_Trap
		My_T0_Window_Spill_4_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_4_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x90)
#endif
#endif

.align 128	
T0_Window_Spill_5_Normal_0x94:
#ifdef H_T0_Window_Spill_5_Normal_Trap
#ifdef SUN_H_T0_Window_Spill_5_Normal_Trap
	 SUN_H_T0_Window_Spill_5_Normal_Trap 
#else
#	ifdef My_T0_Window_Spill_5_Normal_Trap
		My_T0_Window_Spill_5_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_5_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x94)
#endif
#endif

.align 128	
T0_Window_Spill_6_Normal_0x98:
#ifdef H_T0_Window_Spill_6_Normal_Trap
#ifdef SUN_H_T0_Window_Spill_6_Normal_Trap
	 SUN_H_T0_Window_Spill_6_Normal_Trap 
#else
#	ifdef My_T0_Window_Spill_6_Normal_Trap
		My_T0_Window_Spill_6_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_6_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x98)
#endif
#endif

.align 128	
T0_Window_Spill_7_Normal_0x9c:
#ifdef H_T0_Window_Spill_7_Normal_Trap
#ifdef SUN_H_T0_Window_Spill_7_Normal_Trap
	 SUN_H_T0_Window_Spill_7_Normal_Trap 
#else
#	ifdef My_T0_Window_Spill_7_Normal_Trap
		My_T0_Window_Spill_7_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_7_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x9c)
#endif
#endif

.align 128
T0_Window_Spill_0_Other_0xa0:		
#ifdef H_T0_Window_Spill_0_Other_Trap
#ifdef SUN_H_T0_Window_Spill_0_Other_Trap
	 SUN_H_T0_Window_Spill_0_Other_Trap 
#else
#	ifdef My_T0_Window_Spill_0_Other_Trap
		My_T0_Window_Spill_0_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_0_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xa0)
#endif
#endif

.align 128
T0_Window_Spill_1_Other_0xa4:		
#ifdef H_T0_Window_Spill_1_Other_Trap
#ifdef SUN_H_T0_Window_Spill_1_Other_Trap
	 SUN_H_T0_Window_Spill_1_Other_Trap 
#else
#	ifdef My_T0_Window_Spill_1_Other_Trap
		My_T0_Window_Spill_1_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_1_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xa4)
#endif
#endif

.align 128
T0_Window_Spill_2_Other_0xa8:		
#ifdef H_T0_Window_Spill_2_Other_Trap
#ifdef SUN_H_T0_Window_Spill_2_Other_Trap
	 SUN_H_T0_Window_Spill_2_Other_Trap 
#else
#	ifdef My_T0_Window_Spill_2_Other_Trap
		My_T0_Window_Spill_2_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_2_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xa8)
#endif
#endif

.align 128
T0_Window_Spill_3_Other_0xac:
#ifdef H_T0_Window_Spill_3_Other_Trap
#ifdef SUN_H_T0_Window_Spill_3_Other_Trap
	 SUN_H_T0_Window_Spill_3_Other_Trap 
#else
#	ifdef My_T0_Window_Spill_3_Other_Trap
		My_T0_Window_Spill_3_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_3_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xac)
#endif
#endif

.align 128
T0_Window_Spill_4_Other_0xb0:
#ifdef H_T0_Window_Spill_4_Other_Trap
#ifdef SUN_H_T0_Window_Spill_4_Other_Trap
	 SUN_H_T0_Window_Spill_4_Other_Trap 
#else
#	ifdef My_T0_Window_Spill_4_Other_Trap
		My_T0_Window_Spill_4_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_4_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xb0)
#endif
#endif

.align 128
T0_Window_Spill_5_Other_0xb4:
#ifdef H_T0_Window_Spill_5_Other_Trap
#ifdef SUN_H_T0_Window_Spill_5_Other_Trap
	 SUN_H_T0_Window_Spill_5_Other_Trap 
#else
#	ifdef My_T0_Window_Spill_5_Other_Trap
		My_T0_Window_Spill_5_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_5_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xb4)
#endif
#endif

.align 128
T0_Window_Spill_6_Other_0xb8:
#ifdef H_T0_Window_Spill_6_Other_Trap
#ifdef SUN_H_T0_Window_Spill_6_Other_Trap
	 SUN_H_T0_Window_Spill_6_Other_Trap 
#else
#	ifdef My_T0_Window_Spill_6_Other_Trap
		My_T0_Window_Spill_6_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_6_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xb8)
#endif
#endif

.align 128
T0_Window_Spill_7_Other_0xbc:
#ifdef H_T0_Window_Spill_7_Other_Trap
#ifdef SUN_H_T0_Window_Spill_7_Other_Trap
	 SUN_H_T0_Window_Spill_7_Other_Trap 
#else
#	ifdef My_T0_Window_Spill_7_Other_Trap
		My_T0_Window_Spill_7_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Spill_7_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xbc)
#endif
#endif

.align 128
T0_Window_Fill_0_Normal_0xc0:
#ifdef H_T0_Window_Fill_0_Normal_Trap
#ifdef SUN_H_T0_Window_Fill_0_Normal_Trap
	 SUN_H_T0_Window_Fill_0_Normal_Trap 
#else
#	ifdef My_T0_Window_Fill_0_Normal_Trap
		My_T0_Window_Fill_0_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_0_Normal_Trap)
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
T0_Window_Fill_1_Normal_0xc4:
#ifdef H_T0_Window_Fill_1_Normal_Trap
#ifdef SUN_H_T0_Window_Fill_1_Normal_Trap
	 SUN_H_T0_Window_Fill_1_Normal_Trap 
#else
#	ifdef My_T0_Window_Fill_1_Normal_Trap
		My_T0_Window_Fill_1_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_1_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xc4)
#endif
#endif

.align 128
T0_Window_Fill_2_Normal_0xc8:
#ifdef H_T0_Window_Fill_2_Normal_Trap
#ifdef SUN_H_T0_Window_Fill_2_Normal_Trap
	 SUN_H_T0_Window_Fill_2_Normal_Trap 
#else
#	ifdef My_T0_Window_Fill_2_Normal_Trap
		My_T0_Window_Fill_2_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_2_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xc8)
#endif
#endif

.align 128
T0_Window_Fill_3_Normal_0xcc:
#ifdef H_T0_Window_Fill_3_Normal_Trap
#ifdef SUN_H_T0_Window_Fill_3_Normal_Trap
	 SUN_H_T0_Window_Fill_3_Normal_Trap 
#else
#	ifdef My_T0_Window_Fill_3_Normal_Trap
		My_T0_Window_Fill_3_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_3_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xcc)
#endif
#endif

.align 128
T0_Window_Fill_4_Normal_0xd0:
#ifdef H_T0_Window_Fill_4_Normal_Trap
#ifdef SUN_H_T0_Window_Fill_4_Normal_Trap
	 SUN_H_T0_Window_Fill_4_Normal_Trap 
#else
#	ifdef My_T0_Window_Fill_4_Normal_Trap
		My_T0_Window_Fill_4_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_4_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xd0)
#endif
#endif

.align 128
T0_Window_Fill_5_Normal_0xd4:
#ifdef H_T0_Window_Fill_5_Normal_Trap
#ifdef SUN_H_T0_Window_Fill_5_Normal_Trap
	 SUN_H_T0_Window_Fill_5_Normal_Trap 
#else
#	ifdef My_T0_Window_Fill_5_Normal_Trap
		My_T0_Window_Fill_5_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_5_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xd4)
#endif
#endif

.align 128
T0_Window_Fill_6_Normal_0xd8:
#ifdef H_T0_Window_Fill_6_Normal_Trap
#ifdef SUN_H_T0_Window_Fill_6_Normal_Trap
	 SUN_H_T0_Window_Fill_6_Normal_Trap 
#else
#	ifdef My_T0_Window_Fill_6_Normal_Trap
		My_T0_Window_Fill_6_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_6_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xd8)
#endif
#endif

.align 128
T0_Window_Fill_7_Normal_0xdc:
#ifdef H_T0_Window_Fill_7_Normal_Trap
#ifdef SUN_H_T0_Window_Fill_7_Normal_Trap
	 SUN_H_T0_Window_Fill_7_Normal_Trap 
#else
#	ifdef My_T0_Window_Fill_7_Normal_Trap
		My_T0_Window_Fill_7_Normal_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_7_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xdc)
#endif
#endif

.align 128
T0_Window_Fill_0_Other_0xe0:
#ifdef H_T0_Window_Fill_0_Other_Trap
#ifdef SUN_H_T0_Window_Fill_0_Other_Trap
	 SUN_H_T0_Window_Fill_0_Other_Trap 
#else
#	ifdef My_T0_Window_Fill_0_Other_Trap
		My_T0_Window_Fill_0_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_0_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xe0)
#endif

.align 128
T0_Window_Fill_1_Other_0xe4:
#ifdef H_T0_Window_Fill_1_Other_Trap
#ifdef SUN_H_T0_Window_Fill_1_Other_Trap
	 SUN_H_T0_Window_Fill_1_Other_Trap 
#else
#	ifdef My_T0_Window_Fill_1_Other_Trap
		My_T0_Window_Fill_1_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_1_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xe4)
#endif

.align 128
T0_Window_Fill_2_Other_0xe8:
#ifdef H_T0_Window_Fill_2_Other_Trap
#ifdef SUN_H_T0_Window_Fill_2_Other_Trap
	 SUN_H_T0_Window_Fill_2_Other_Trap 
#else
#	ifdef My_T0_Window_Fill_2_Other_Trap
		My_T0_Window_Fill_2_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_2_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xe8)
#endif

.align 128
T0_Window_Fill_3_Other_0xec:
#ifdef H_T0_Window_Fill_3_Other_Trap
#ifdef SUN_H_T0_Window_Fill_3_Other_Trap
	 SUN_H_T0_Window_Fill_3_Other_Trap 
#else
#	ifdef My_T0_Window_Fill_3_Other_Trap
		My_T0_Window_Fill_3_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_3_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xec)
#endif

.align 128
T0_Window_Fill_4_Other_0xf0:
#ifdef H_T0_Window_Fill_4_Other_Trap
#ifdef SUN_H_T0_Window_Fill_4_Other_Trap
	 SUN_H_T0_Window_Fill_4_Other_Trap 
#else
#	ifdef My_T0_Window_Fill_4_Other_Trap
		My_T0_Window_Fill_4_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_4_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xf0)
#endif

.align 128
T0_Window_Fill_5_Other_0xf4:
#ifdef H_T0_Window_Fill_5_Other_Trap
#ifdef SUN_H_T0_Window_Fill_5_Other_Trap
	 SUN_H_T0_Window_Fill_5_Other_Trap 
#else
#	ifdef My_T0_Window_Fill_5_Other_Trap
		My_T0_Window_Fill_5_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_5_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xf4)
#endif

.align 128
T0_Window_Fill_6_Other_0xf8:
#ifdef H_T0_Window_Fill_6_Other_Trap
#ifdef SUN_H_T0_Window_Fill_6_Other_Trap
	 SUN_H_T0_Window_Fill_6_Other_Trap 
#else
#	ifdef My_T0_Window_Fill_6_Other_Trap
		My_T0_Window_Fill_6_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_6_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xf8)
#endif

.align 128
T0_Window_Fill_7_Other_0xfc:
#ifdef H_T0_Window_Fill_7_Other_Trap
#ifdef SUN_H_T0_Window_Fill_7_Other_Trap
	 SUN_H_T0_Window_Fill_7_Other_Trap 
#else
#	ifdef My_T0_Window_Fill_7_Other_Trap
		My_T0_Window_Fill_7_Other_Trap
#	else
		CUSTOM_TRAP(H_T0_Window_Fill_7_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xfc)
#endif

.align 128
T0_GoodTrap_0x100:
	!rd %asr26, %g1; wr %g1, 0x1, %asr26; nop; b good_trap;nop;nop;nop;nop
    ta T_HGOOD_TRAP     ! N2
    nop                 ! N2
    nop                 ! N2
    nop                 ! N2
    nop                 ! N2
    nop                 ! N2
    nop                 ! N2
    nop                 ! N2

T0_BadTrap_0x101:
#ifdef EXPECT_BAD_TRAP
        ta T_HGOOD_TRAP; nop;nop;nop;nop;nop;nop;nop
#else
        ta T_HBAD_TRAP; nop;nop;nop;nop;nop;nop;nop
#endif
	
T0_ChangePriv_0x102:
#ifdef H_T0_ChangePriv_0x102
#ifdef SUN_H_T0_ChangePriv_0x102
         SUN_H_T0_ChangePriv_0x102
#else
                CUSTOM_TRAP(H_T0_ChangePriv_0x102)
#endif
#else
    rdpr    %tstate, %g1
	or	%g1, 0x400, %g2
	wrpr	%g0, %g2, %tstate
	done
	nop
	nop
    nop
    nop
#endif
	
T0_ChangeNonPriv_0x103:
#ifdef H_T0_ChangeNonPriv_0x103
#ifdef SUN_H_T0_ChangeNonPriv_0x103
         SUN_H_T0_ChangeNonPriv_0x103
#else
                CUSTOM_TRAP(H_T0_ChangeNonPriv_0x103)
#endif
#else
    rdpr    %tstate, %g1
	andn	%g1, 0x400, %g2
	wrpr	%g0, %g2, %tstate
	done
	nop
	nop
	nop
	nop
#endif

T0_ChangeToTL1_0x104:
#ifdef H_T0_ChangeToTL1_0x104
#ifdef SUN_H_T0_ChangeToTL1_0x104
         SUN_H_T0_ChangeToTL1_0x104
#else
                CUSTOM_TRAP(H_T0_ChangeToTL1_0x104)
#endif
#else
	wrpr %g0, 1, %gl
        rdpr    %tnpc, %g1
	wrpr %g0, 1, %tl
	jmp	%g1
	nop
	nop
	nop
	nop
#endif
	
T0_ChangeToTL0_0x105:
#ifdef H_T0_ChangeToTL0_0x105
#ifdef SUN_H_T0_ChangeToTL0_0x105
	 SUN_H_T0_ChangeToTL0_0x105 
#else
	CUSTOM_TRAP(H_T0_ChangeToTL0_0x105)
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
	
T0_ChangeToTL0_0x106:
#ifdef H_T0_ChangeToTL0_0x106
#ifdef SUN_H_T0_ChangeToTL0_0x106
	 SUN_H_T0_ChangeToTL0_0x106 
#else
	CUSTOM_TRAP(H_T0_ChangeToTL0_0x106)
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
	
T0_ChangeToTL0_0x107:
#ifdef H_T0_ChangeToTL0_0x107
#ifdef SUN_H_T0_ChangeToTL0_0x107
	 SUN_H_T0_ChangeToTL0_0x107 
#else
	CUSTOM_TRAP(H_T0_ChangeToTL0_0x107)
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

.align 128
T0_TrapEn_0x108:	
        setx    trap_enable_data, %g2, %g1
	mov     0x800, %g2
	add	%o0, %o0, %o0
	sth	%g2, [%g1+%o0]
	done

.align 64
T0_TrapDis_0x10a:	
        setx    trap_enable_data, %g2, %g1
	mov     0, %g2
	add	%o0, %o0, %o0
	sth	%g2, [%g1+%o0]
	done

.align 64
T0_TrapEn_Ntimes_0x10c:	
        setx    trap_enable_data, %g2, %g1
	add	%o0, %o0, %o0
	sth	%o1, [%g1+%o0]
	done

.align 128
T0_PThreadMutexLock_0x110:
#ifdef H_T0_PThreadMutexLock_0x110
#ifdef SUN_H_T0_PThreadMutexLock_0x110
         SUN_H_T0_PThreadMutexLock_0x110
#else
#   ifdef My_T0_PThreadMutexLock_0x110
        My_T0_PThreadMutexLock_0x110
#   else
        CUSTOM_TRAP(H_T0_PThreadMutexLock_0x110)
#   endif
#endif
#else
        wrpr    1, %gl    ! set it back to 1
!!        setx    pthread_mutex_data, %g2, %g3
        sethi   %hi(pthread_mutex_data), %g3
pt_retry:
        ldstub  [%g3+%g7], %g2
        brz     %g2, pt_done
        nop
pt_loop:
        ldub    [%g3+%g7], %g2
        brnz    %g2, pt_loop
        nop
        ba,a    pt_retry
pt_done:
        membar  #LoadLoad | #LoadStore
        ldsb    [%g4+%g6], %g3
        add     1, %g3, %g3
        stub    %g3, [%g4+%g6]
        done
        nop
#endif

.align 128
T0_PThreadMutexUnLock_0x114:	
#ifdef H_T0_PThreadMutexUnLock_0x114
#ifdef SUN_H_T0_PThreadMutexUnLock_0x114
         SUN_H_T0_PThreadMutexUnLock_0x114
#else
        CUSTOM_TRAP(H_T0_PThreadMutexUnLock_0x114)
#endif
#else
        wrpr    1, %gl    ! set it back to 1
!!        setx    pthread_mutex_data, %g2, %g3
        sethi   %hi(pthread_mutex_data), %g3
        stub    %g0, [%g3+%g7]
        ldsb    [%g4+%g6], %g3
        subcc   %g5, 1, %g5     ! %g5 timeout count
        te      T_BAD_TRAP
        cmp     %g3, THREAD_COUNT
        bl,a    .-12
        ldsb    [%g4+%g6], %g3
        done
        nop
#endif
	
.align 64
T0_Trap_Sync_0x116:
        setx    pthread_counter_data, %g1, %g4
!!      we will change the GL not other's
        wrpr    1, %gl
        rdpr    %tstate, %g3    ! get TSTATE
        mov     1,%g1
        sllx    %g1, 40, %g1    ! mov GL to low bit
        xor      %g1, %g3, %g3   ! change the prev GL value
        wrpr    %g3, %tstate
        done
        nop


	
.align 64
! call kernel device routine
T0_Trap_SysCall_0x118:
	! calculate ptr to syscall data according to thread ID
	mov	%o1, %g1	! save %o1
	rdth_id_p		! get thread ID
	sllx	%o1, 6, %o1
	setx	pthread_syscall_data, %g2, %g4
	add	%g4, %o1, %g4	! %g4 = ptr to thread's data
	ba	syscall_handler
	mov	%g1, %o1	! restore %o1
	
.align 64
T0_Trap_SysRet_0x11a:
	! calculate ptr to syscall data according to thread ID
	mov	%o1, %g1	! save %o1
	rdth_id_p		! get thread ID
	sllx	%o1, 6, %o1
	setx	pthread_syscall_data, %g2, %g4
	add	%g4, %o1, %g4	! %g4 = ptr to thread's data
	ba	sysret_handler
	mov	%g1, %o1	! restore %o1

.align 512
T0_HTrap_ChangePriv_0x120:
        ta      %icc, T_API_CHANGE_PRIV
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 64
T0_HTrap_ChangeNonPriv_0x122:
        ta      %icc, T_API_CHANGE_NONPRIV
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 64	
T0_HTrapEn_0x124:
        ta      %icc, T_API_TRAP_EN
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 64	
T0_HTrapDis_0x126:
        ta      %icc, T_API_TRAP_DIS
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 64	
T0_HTrapEn_Ntimes_0x128:
#ifdef H_T0_HTrapEn_Ntimes_0x128
#ifdef SUN_H_T0_HTrapEn_Ntimes_0x128
	 SUN_H_T0_HTrapEn_Ntimes_0x128 
#else
#	ifdef My_T0_HTrapEn_Ntimes_0x128
		My_T0_HTrapEn_Ntimes_0x128
#	else
		CUSTOM_TRAP(H_T0_HTrapEn_Ntimes_0x128)
#	endif
#endif
#else
        ta      %icc, T_API_TRAP_EN_N_TIMES
	done
	nop
	nop
	nop
	nop
	nop
	nop
#endif

.align 64	
T0_ChangeCtx_0x12a:
#ifdef H_T0_ChangeCtx_0x12a
#ifdef SUN_H_T0_ChangeCtx_0x12a
	 SUN_H_T0_ChangeCtx_0x12a 
#else
#	ifdef My_T0_ChangeCtx_0x12a
		My_T0_ChangeCtx_0x12a
#	else
		CUSTOM_TRAP(H_T0_ChangeCtx_0x12a)
#	endif
#endif
#else
    ta      %icc, T_API_CHANGE_CTX
	done
	nop
	nop
	nop
	nop
	nop
	nop
#endif

.align 64
T0_Dummy_0x12c:
#ifdef H_T0_Dummy_0x12c
#ifdef SUN_H_T0_Dummy_0x12c
	 SUN_H_T0_Dummy_0x12c 
#else
#	ifdef My_T0_Dummy_0x12c
		My_T0_Dummy_0x12c
#	else
		CUSTOM_TRAP(H_T0_Dummy_0x12c)
#	endif
#endif
#else
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
#endif

.align 64	
T0_RdThId_0x12e:
    ta      %icc, T_API_RD_THID
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 512
T0_Trap_Instruction_0x130:
#ifdef H_T0_Trap_Instruction_0
#ifdef SUN_H_T0_Trap_Instruction_0
	 SUN_H_T0_Trap_Instruction_0 
#else
#	ifdef My_T0_Trap_Instruction_0
		My_T0_Trap_Instruction_0
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0)
#	endif
#endif
#else
	NORMAL_TRAP(0x130);
#endif

.align 32
T0_Trap_Instruction_0x131:
#ifdef H_T0_Trap_Instruction_1
#ifdef SUN_H_T0_Trap_Instruction_1
	SUN_H_T0_Trap_Instruction_1
#else
#	ifdef My_T0_Trap_Instruction_1
		My_T0_Trap_Instruction_1
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_1)
#	endif
#endif
#else
	NORMAL_TRAP(0x131);
#endif

.align 32
T0_Trap_Instruction_0x132:
#ifdef H_T0_Trap_Instruction_2
#ifdef SUN_H_T0_Trap_Instruction_2
	SUN_H_T0_Trap_Instruction_2
#else
#	ifdef My_T0_Trap_Instruction_2
		My_T0_Trap_Instruction_2
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_2)
#	endif
#endif
#else
	ta	T_API_HTRAP_INST0;
        done;
        nop;
	nop;
	nop;
	nop;
	nop;
	nop;
#endif

.align 32
T0_Trap_Instruction_0x133:
#ifdef H_T0_Trap_Instruction_3
#ifdef SUN_H_T0_Trap_Instruction_3
	SUN_H_T0_Trap_Instruction_3
#else
#	ifdef My_T0_Trap_Instruction_3
		My_T0_Trap_Instruction_3
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_3)
#	endif
#endif
#else
	ta	T_API_HTRAP_INST1;
        done;
        nop;
	nop;
	nop;
	nop;
	nop;
	nop;
#endif

.align 32
T0_Trap_Instruction_0x134:
#ifdef H_T0_Trap_Instruction_4
#ifdef SUN_H_T0_Trap_Instruction_4
	 SUN_H_T0_Trap_Instruction_4
#else
#	ifdef My_T0_Trap_Instruction_4
		My_T0_Trap_Instruction_4
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_4)
#	endif
#endif
#else
	NORMAL_TRAP(0x134);
#endif

.align 32
T0_Trap_Instruction_0x135:
#ifdef H_T0_Trap_Instruction_5
#ifdef SUN_H_T0_Trap_Instruction_5
	SUN_H_T0_Trap_Instruction_5
#else
#	ifdef My_T0_Trap_Instruction_5
		My_T0_Trap_Instruction_5
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_5)
#	endif
#endif
#else
	NORMAL_TRAP(0x135);
#endif

.align 128
T0_Trap_Instruction_0x138:
#ifdef H_T0_Trap_Instruction_0x138
#ifdef SUN_H_T0_Trap_Instruction_0x138
	SUN_H_T0_Trap_Instruction_0x138
#else
#	ifdef My_T0_Trap_Instruction_0x138
		My_T0_Trap_Instruction_0x138
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0x138)
#	endif
#endif
#else
	NORMAL_TRAP(0x138);
#endif

.align 128
T0_Trap_Instruction_0x13c:
#ifdef H_T0_Trap_Instruction_0x13c
#ifdef SUN_H_T0_Trap_Instruction_0x13c
	SUN_H_T0_Trap_Instruction_0x13c
#else
#	ifdef My_T0_Trap_Instruction_0x13c
		My_T0_Trap_Instruction_0x13c
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0x13c)
#	endif
#endif
#else
	NORMAL_TRAP(0x13c);
#endif

.align 128
T0_Trap_Instruction_0x140:
#ifdef H_T0_Trap_Instruction_0x140
#ifdef SUN_H_T0_Trap_Instruction_0x140
	SUN_H_T0_Trap_Instruction_0x140
#else
#	ifdef My_T0_Trap_Instruction_0x140
		My_T0_Trap_Instruction_0x140
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0x140)
#	endif
#endif
#else
	NORMAL_TRAP(0x140);
#endif

.align 128
T0_Trap_Instruction_0x144:
#ifdef H_T0_Trap_Instruction_0x144
#ifdef SUN_H_T0_Trap_Instruction_0x144
	SUN_H_T0_Trap_Instruction_0x144
#else
#	ifdef My_T0_Trap_Instruction_0x144
		My_T0_Trap_Instruction_0x144
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0x144)
#	endif
#endif
#else
	NORMAL_TRAP(0x144);
#endif

.align 128
T0_Trap_Instruction_0x148:
#ifdef H_T0_Trap_Instruction_0x148
#ifdef SUN_H_T0_Trap_Instruction_0x148
	SUN_H_T0_Trap_Instruction_0x148
#else
#	ifdef My_T0_Trap_Instruction_0x148
		My_T0_Trap_Instruction_0x148
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0x148)
#	endif
#endif
#else
	NORMAL_TRAP(0x148);
#endif

.align 128
T0_Trap_Instruction_0x14c:
#ifdef H_T0_Trap_Instruction_0x14c
#ifdef SUN_H_T0_Trap_Instruction_0x14c
	SUN_H_T0_Trap_Instruction_0x14c
#else
#	ifdef My_T0_Trap_Instruction_0x14c
		My_T0_Trap_Instruction_0x14c
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0x14c)
#	endif
#endif
#else
	NORMAL_TRAP(0x14c);
#endif

.align 128
T0_Trap_Instruction_0x150:
#ifdef H_T0_Trap_Instruction_0x150
#ifdef SUN_H_T0_Trap_Instruction_0x150
	SUN_H_T0_Trap_Instruction_0x150
#else
#	ifdef My_T0_Trap_Instruction_0x150
		My_T0_Trap_Instruction_0x150
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0x150)
#	endif
#endif
#else
	NORMAL_TRAP(0x150);
#endif

.align 128
T0_Trap_Instruction_0x154:
#ifdef H_T0_Trap_Instruction_0x154
#ifdef SUN_H_T0_Trap_Instruction_0x154
	SUN_H_T0_Trap_Instruction_0x154
#else
#	ifdef My_T0_Trap_Instruction_0x154
		My_T0_Trap_Instruction_0x154
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0x154)
#	endif
#endif
#else
	NORMAL_TRAP(0x154);
#endif

.align 128
T0_Trap_Instruction_0x158:
#ifdef H_T0_Trap_Instruction_0x158
#ifdef SUN_H_T0_Trap_Instruction_0x158
	SUN_H_T0_Trap_Instruction_0x158
#else
#	ifdef My_T0_Trap_Instruction_0x158
		My_T0_Trap_Instruction_0x158
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0x158)
#	endif
#endif
#else
	NORMAL_TRAP(0x158);
#endif

.align 128
T0_Trap_Instruction_0x15c:
#ifdef H_T0_Trap_Instruction_0x15c
#ifdef SUN_H_T0_Trap_Instruction_0x15c
	SUN_H_T0_Trap_Instruction_0x15c
#else
#	ifdef My_T0_Trap_Instruction_0x15c
		My_T0_Trap_Instruction_0x15c
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0x15c)
#	endif
#endif
#else
	NORMAL_TRAP(0x15c);
#endif

.align 128
T0_Trap_Instruction_0x160:
#ifdef H_T0_Trap_Instruction_0x160
#ifdef SUN_H_T0_Trap_Instruction_0x160
	SUN_H_T0_Trap_Instruction_0x160
#else
#	ifdef My_T0_Trap_Instruction_0x160
		My_T0_Trap_Instruction_0x160
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0x160)
#	endif
#endif
#else
	NORMAL_TRAP(0x160);
#endif

.align 128
T0_Trap_Instruction_0x164:
#ifdef H_T0_Trap_Instruction_0x164
#ifdef SUN_H_T0_Trap_Instruction_0x164
	SUN_H_T0_Trap_Instruction_0x164
#else
#	ifdef My_T0_Trap_Instruction_0x164
		My_T0_Trap_Instruction_0x164
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0x164)
#	endif
#endif
#else
	NORMAL_TRAP(0x164);
#endif

.align 128
T0_Trap_Instruction_0x168:
#ifdef H_T0_Trap_Instruction_0x168
#ifdef SUN_H_T0_Trap_Instruction_0x168
	SUN_H_T0_Trap_Instruction_0x168
#else
#	ifdef My_T0_Trap_Instruction_0x168
		My_T0_Trap_Instruction_0x168
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0x168)
#	endif
#endif
#else
	NORMAL_TRAP(0x168);
#endif

.align 128
T0_Trap_Instruction_0x16c:
#ifdef H_T0_Trap_Instruction_0x16c
#ifdef SUN_H_T0_Trap_Instruction_0x16c
	SUN_H_T0_Trap_Instruction_0x16c
#else
#	ifdef My_T0_Trap_Instruction_0x16c
		My_T0_Trap_Instruction_0x16c
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0x16c)
#	endif
#endif
#else
	NORMAL_TRAP(0x16c);
#endif

.align 128
T0_Trap_Instruction_0x170:
#ifdef H_T0_Trap_Instruction_0x170
#ifdef SUN_H_T0_Trap_Instruction_0x170
	SUN_H_T0_Trap_Instruction_0x170
#else
#	ifdef My_T0_Trap_Instruction_0x170
		My_T0_Trap_Instruction_0x170
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0x170)
#	endif
#endif
#else
	NORMAL_TRAP(0x170);
#endif

.align 128
T0_Trap_Instruction_0x174:
#ifdef H_T0_Trap_Instruction_0x174
#ifdef SUN_H_T0_Trap_Instruction_0x174
	SUN_H_T0_Trap_Instruction_0x174
#else
#	ifdef My_T0_Trap_Instruction_0x174
		My_T0_Trap_Instruction_0x174
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0x174)
#	endif
#endif
#else
	NORMAL_TRAP(0x174);
#endif

.align 32
T0_Trap_Instruction_0x175:
#ifdef H_T0_Trap_Instruction_0x175
#ifdef SUN_H_T0_Trap_Instruction_0x175
	SUN_H_T0_Trap_Instruction_0x175
#else
#	ifdef My_T0_Trap_Instruction_0x175
		My_T0_Trap_Instruction_0x175
#	else
		CUSTOM_TRAP(H_T0_Trap_Instruction_0x175)
#	endif
#endif
#else
	NORMAL_TRAP(0x175);
#endif



.align 0x1000	/* align to 0x3000 , tt=0x180 */

T0_Trap_Instruction_0x180:
#ifdef H_T0_Trap_Instruction_0x180
#ifdef SUN_H_T0_Trap_Instruction_0x180
        SUN_H_T0_Trap_Instruction_0x180
#else
#       ifdef My_T0_Trap_Instruction_0x180
                My_T0_Trap_Instruction_0x180
#       else
                CUSTOM_TRAP(H_T0_Trap_Instruction_0x180)
#       endif
#endif
#else
        NORMAL_TRAP(0x180);
#endif

.align 512	/* align to 0x3200 , tt=0x190 */
T0_Trap_Instruction_0x190:
#ifdef H_T0_Trap_Instruction_0x190
#ifdef SUN_H_T0_Trap_Instruction_0x190
        SUN_H_T0_Trap_Instruction_0x190
#else
#       ifdef My_T0_Trap_Instruction_0x190
                My_T0_Trap_Instruction_0x190
#       else
                CUSTOM_TRAP(H_T0_Trap_Instruction_0x190)
#       endif
#endif
#else
        NORMAL_TRAP(0x190);
#endif

.align 256	/* align to 0x3300 , tt = 0x198 */
T0_Trap_Instruction_0x198:
#ifdef H_T0_Trap_Instruction_0x198
#ifdef SUN_H_T0_Trap_Instruction_0x198
        SUN_H_T0_Trap_Instruction_0x198
#else
#       ifdef My_T0_Trap_Instruction_0x198
                My_T0_Trap_Instruction_0x198
#       else
                CUSTOM_TRAP(H_T0_Trap_Instruction_0x198)
#       endif
#endif
#else
        NORMAL_TRAP(0x198);
#endif

.align 32

T0_Trap_Instruction_0x199:
#ifdef H_T0_Trap_Instruction_0x199
#ifdef SUN_H_T0_Trap_Instruction_0x199
        SUN_H_T0_Trap_Instruction_0x199
#else
#       ifdef My_T0_Trap_Instruction_0x199
                My_T0_Trap_Instruction_0x199
#       else
                CUSTOM_TRAP(H_T0_Trap_Instruction_0x199)
#       endif
#endif
#else
        NORMAL_TRAP(0x199);
#endif

	
.align 0x4000


T1_Reserved_0x00:	
#ifdef H_T1_Reserved_0x00
#ifdef SUN_H_T1_Reserved_0x00
	 SUN_H_T1_Reserved_0x00 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x00)
#endif
.align 32
#else
	NORMAL_TRAP(0x00); 
#endif

T1_Reserved_0x01:		
#ifdef H_T1_Reserved_0x01
#ifdef SUN_H_T1_Reserved_0x01
	 SUN_H_T1_Reserved_0x01 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x01)
#endif
.align 32
#else
	NORMAL_TRAP(0x01); 
#endif

T1_Reserved_0x02:		
#ifdef H_T1_Reserved_0x02
#ifdef SUN_H_T1_Reserved_0x02
	 SUN_H_T1_Reserved_0x02 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x02)
#endif
.align 32
#else
	NORMAL_TRAP(0x02); 
#endif

T1_Reserved_0x03:		
#ifdef H_T1_Reserved_0x03
#ifdef SUN_H_T1_Reserved_0x03
	 SUN_H_T1_Reserved_0x03 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x03)
#endif
.align 32
#else
	NORMAL_TRAP(0x03); 
#endif

T1_Reserved_0x04:		
#ifdef H_T1_Reserved_0x04
#ifdef SUN_H_T1_Reserved_0x04
	 SUN_H_T1_Reserved_0x04 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x04)
#endif
.align 32
#else
	NORMAL_TRAP(0x04); 
#endif

T1_Reserved_0x05:		
#ifdef H_T1_Reserved_0x05
#ifdef SUN_H_T1_Reserved_0x05
	 SUN_H_T1_Reserved_0x05 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x05)
#endif
.align 32
#else
	NORMAL_TRAP(0x05); 
#endif

T1_Reserved_0x06:		
#ifdef H_T1_Reserved_0x06
#ifdef SUN_H_T1_Reserved_0x06
	 SUN_H_T1_Reserved_0x06 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x06)
#endif
.align 32
#else
	NORMAL_TRAP(0x06); 
#endif

T1_Reserved_0x07:		
#ifdef H_T1_Reserved_0x07
#ifdef SUN_H_T1_Reserved_0x07
	 SUN_H_T1_Reserved_0x07 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x07)
#endif
.align 32
#else
	NORMAL_TRAP(0x07); 
#endif

T1_Reserved_0x08:		
#ifdef H_T1_Reserved_0x08
#ifdef SUN_H_T1_Reserved_0x08
	 SUN_H_T1_Reserved_0x08 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x08)
#endif
.align 32
#else
	NORMAL_TRAP(0x08); 
#endif

T1_Reserved_0x09:		
#ifdef H_T1_Reserved_0x09
#ifdef SUN_H_T1_Reserved_0x09
	 SUN_H_T1_Reserved_0x09 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x09)
#endif
.align 32
#else
	NORMAL_TRAP(0x09); 
#endif

T1_Reserved_0x0a:		
#ifdef H_T1_Reserved_0x0a
#ifdef SUN_H_T1_Reserved_0x0a
	 SUN_H_T1_Reserved_0x0a 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x0a)
#endif
.align 32
#else
	NORMAL_TRAP(0x0a); 
#endif

T1_Reserved_0x0b:		
#ifdef H_T1_Reserved_0x0b
#ifdef SUN_H_T1_Reserved_0x0b
	 SUN_H_T1_Reserved_0x0b 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x0b)
#endif
.align 32
#else
	NORMAL_TRAP(0x0b); 
#endif

T1_Reserved_0x0c:		
#ifdef H_T1_Reserved_0x0c
#ifdef SUN_H_T1_Reserved_0x0c
	 SUN_H_T1_Reserved_0x0c 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x0c)
#endif
.align 32
#else
	NORMAL_TRAP(0x0c); 
#endif

T1_Reserved_0x0d:		
#ifdef H_T1_Reserved_0x0d
#ifdef SUN_H_T1_Reserved_0x0d
	 SUN_H_T1_Reserved_0x0d 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x0d)
#endif
.align 32
#else
	NORMAL_TRAP(0x0d); 
#endif

T1_Reserved_0x0e:		
#ifdef H_T1_Reserved_0x0e
#ifdef SUN_H_T1_Reserved_0x0e
	 SUN_H_T1_Reserved_0x0e 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x0e)
#endif
.align 32
#else
	NORMAL_TRAP(0x0e); 
#endif

T1_Reserved_0x0f:		
#ifdef H_T1_Reserved_0x0f
#ifdef SUN_H_T1_Reserved_0x0f
	 SUN_H_T1_Reserved_0x0f 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x0f)
#endif
.align 32
#else
	NORMAL_TRAP(0x0f); 
#endif

T1_Illegal_Instruction_0x10:
#ifdef H_T1_Illegal_instruction_0x10
#ifdef SUN_H_T1_Illegal_instruction_0x10
	 SUN_H_T1_Illegal_instruction_0x10 
#else
#	ifdef My_T1_Illegal_instruction_0x10
		My_T1_Illegal_instruction_0x10
#	else
        	CUSTOM_TRAP(H_T1_Illegal_instruction_0x10)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x10)
#endif

T1_Privileged_Opcode_0x11:		
#ifdef H_T1_Privileged_Opcode_0x11
#ifdef SUN_H_T1_Privileged_Opcode_0x11
	 SUN_H_T1_Privileged_Opcode_0x11 
#else
        CUSTOM_TRAP(H_T1_Privileged_Opcode_0x11)
#endif
.align 32
#else
	NORMAL_TRAP(0x11); 
#endif

T1_Reserved_0x12:		
#ifdef H_T1_Reserved_0x12
#ifdef SUN_H_T1_Reserved_0x12
	 SUN_H_T1_Reserved_0x12 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x12)
#endif
.align 32
#else
	NORMAL_TRAP(0x12); 
#endif

T1_Reserved_0x13:		
#ifdef H_T1_Reserved_0x13
#ifdef SUN_H_T1_Reserved_0x13
	 SUN_H_T1_Reserved_0x13 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x13)
#endif
.align 32
#else
	NORMAL_TRAP(0x13); 
#endif

T1_Reserved_0x14:		
#ifdef H_T1_Reserved_0x14
#ifdef SUN_H_T1_Reserved_0x14
	 SUN_H_T1_Reserved_0x14 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x14)
#endif
.align 32
#else
	NORMAL_TRAP(0x14); 
#endif

T1_Reserved_0x15:		
#ifdef H_T1_Reserved_0x15
#ifdef SUN_H_T1_Reserved_0x15
	 SUN_H_T1_Reserved_0x15 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x15)
#endif
.align 32
#else
	NORMAL_TRAP(0x15); 
#endif

T1_Reserved_0x16:		
#ifdef H_T1_Reserved_0x16
#ifdef SUN_H_T1_Reserved_0x16
	 SUN_H_T1_Reserved_0x16 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x16)
#endif
.align 32
#else
	NORMAL_TRAP(0x16); 
#endif

T1_Reserved_0x17:		
#ifdef H_T1_Reserved_0x17
#ifdef SUN_H_T1_Reserved_0x17
	 SUN_H_T1_Reserved_0x17 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x17)
#endif
.align 32
#else
	NORMAL_TRAP(0x17); 
#endif

T1_Reserved_0x18:		
#ifdef H_T1_Reserved_0x18
#ifdef SUN_H_T1_Reserved_0x18
	 SUN_H_T1_Reserved_0x18 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x18)
#endif
.align 32
#else
	NORMAL_TRAP(0x18); 
#endif

T1_Reserved_0x19:		
#ifdef H_T1_Reserved_0x19
#ifdef SUN_H_T1_Reserved_0x19
	 SUN_H_T1_Reserved_0x19 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x19)
#endif
.align 32
#else
	NORMAL_TRAP(0x19); 
#endif

T1_Reserved_0x1a:		
#ifdef H_T1_Reserved_0x1a
#ifdef SUN_H_T1_Reserved_0x1a
	 SUN_H_T1_Reserved_0x1a 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x1a)
#endif
.align 32
#else
	NORMAL_TRAP(0x1a); 
#endif

T1_Reserved_0x1b:		
#ifdef H_T1_Reserved_0x1b
#ifdef SUN_H_T1_Reserved_0x1b
	 SUN_H_T1_Reserved_0x1b 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x1b)
#endif
.align 32
#else
	NORMAL_TRAP(0x1b); 
#endif

T1_Reserved_0x1c:		
#ifdef H_T1_Reserved_0x1c
#ifdef SUN_H_T1_Reserved_0x1c
	 SUN_H_T1_Reserved_0x1c 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x1c)
#endif
.align 32
#else
	NORMAL_TRAP(0x1c); 
#endif

T1_Reserved_0x1d:		
#ifdef H_T1_Reserved_0x1d
#ifdef SUN_H_T1_Reserved_0x1d
	 SUN_H_T1_Reserved_0x1d 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x1d)
#endif
.align 32
#else
	NORMAL_TRAP(0x1d); 
#endif

T1_Reserved_0x1e:		
#ifdef H_T1_Reserved_0x1e
#ifdef SUN_H_T1_Reserved_0x1e
	 SUN_H_T1_Reserved_0x1e 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x1e)
#endif
.align 32
#else
	NORMAL_TRAP(0x1e); 
#endif

T1_Reserved_0x1f:		
#ifdef H_T1_Reserved_0x1f
#ifdef SUN_H_T1_Reserved_0x1f
	 SUN_H_T1_Reserved_0x1f 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x1f)
#endif
.align 32
#else
	NORMAL_TRAP(0x1f); 
#endif

T1_Fp_Disabled_0x20:		
#ifdef H_T1_Fp_Disabled_0x20
#ifdef SUN_H_T1_Fp_Disabled_0x20
	 SUN_H_T1_Fp_Disabled_0x20 
#else
#	ifdef My_H_T1_Fp_Disabled_0x20
		My_H_T1_Fp_Disabled_0x20
#	else
        	CUSTOM_TRAP(H_T1_Fp_Disabled_0x20)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x20); 
#endif

T1_Fp_Exception_Ieee_754_0x21:		
#ifdef H_T1_Fp_Exception_Ieee_754_0x21
#ifdef SUN_H_T1_Fp_Exception_Ieee_754_0x21
	 SUN_H_T1_Fp_Exception_Ieee_754_0x21 
#else
#	ifdef My_H_T1_Fp_Exception_Ieee_754_0x21
		My_H_T1_Fp_Exception_Ieee_754_0x21
#	else
        	CUSTOM_TRAP(H_T1_Fp_Exception_Ieee_754_0x21)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x21); 
#endif

T1_Fp_Exception_Other_0x22:		
#ifdef H_T1_Fp_Exception_Other_0x22
#ifdef SUN_H_T1_Fp_Exception_Other_0x22
	 SUN_H_T1_Fp_Exception_Other_0x22 
#else
#	ifdef My_H_T1_Fp_Exception_Other_0x22
		My_H_T1_Fp_Exception_Other_0x22
#	else
        	CUSTOM_TRAP(H_T1_Fp_Exception_Other_0x22)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x22); 
#endif

T1_Tag_Overflow_0x23:		
#ifdef H_T1_Tag_Overflow_0x23
#ifdef SUN_H_T1_Tag_Overflow_0x23
	 SUN_H_T1_Tag_Overflow_0x23 
#else
        CUSTOM_TRAP(H_T1_Tag_Overflow_0x23)
#endif
.align 32
#else
	NORMAL_TRAP(0x23); 
#endif

T1_Clean_Window_0x24:		
#ifdef H_T1_Clean_Window_0x24
#ifdef SUN_H_T1_Clean_Window_0x24
	 SUN_H_T1_Clean_Window_0x24 
#else
        CUSTOM_TRAP(H_T1_Clean_Window_0x24)
#endif
.align 32
#else
	NORMAL_TRAP(0x24); 
#endif

T1_Clean_Window_0x25:		
#ifdef H_T1_Clean_Window_0x25
#ifdef SUN_H_T1_Clean_Window_0x25
	 SUN_H_T1_Clean_Window_0x25 
#else
        CUSTOM_TRAP(H_T1_Clean_Window_0x25)
#endif
.align 32
#else
	NORMAL_TRAP(0x01); 
#endif

T1__0x26:		
#ifdef H_T1_Clean_Window_0x26
#ifdef SUN_H_T1_Clean_Window_0x26
	 SUN_H_T1_Clean_Window_0x26 
#else
        CUSTOM_TRAP(H_T1_Clean_Window_0x26)
#endif
.align 32
#else
	NORMAL_TRAP(0x26); 
#endif

T1_Clean_Window_0x27:		
#ifdef H_T1_Clean_Window_0x27
#ifdef SUN_H_T1_Clean_Window_0x27
	 SUN_H_T1_Clean_Window_0x27 
#else
        CUSTOM_TRAP(H_T1_Clean_Window_0x27)
#endif
.align 32
#else
	NORMAL_TRAP(0x27); 
#endif

T1_Division_By_Zero_0x28:		
#ifdef H_T1_Division_By_Zero_0x28
#ifdef SUN_H_T1_Division_By_Zero_0x28
	 SUN_H_T1_Division_By_Zero_0x28 
#else
#	ifdef My_H_T1_Division_By_Zero_0x28
		My_H_T1_Division_By_Zero_0x28
#	else
        	CUSTOM_TRAP(H_T1_Division_By_Zero_0x28)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x28); 
#endif

T1_Reserved_0x29:		
#ifdef H_T1_Reserved_0x29
#ifdef SUN_H_T1_Reserved_0x29
	 SUN_H_T1_Reserved_0x29 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x29)
#endif
.align 32
#else
	NORMAL_TRAP(0x29); 
#endif

T1_Reserved_0x2a:		
#ifdef H_T1_Reserved_0x2a
#ifdef SUN_H_T1_Reserved_0x2a
	 SUN_H_T1_Reserved_0x2a 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x2a)
#endif
.align 32
#else
	NORMAL_TRAP(0x2a); 
#endif

T1_Reserved_0x2b:		
#ifdef H_T1_Reserved_0x2b
#ifdef SUN_H_T1_Reserved_0x2b
	 SUN_H_T1_Reserved_0x2b 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x2b)
#endif
.align 32
#else
	NORMAL_TRAP(0x2b); 
#endif

T1_Reserved_0x2c:		
#ifdef H_T1_Reserved_0x2c
#ifdef SUN_H_T1_Reserved_0x2c
	 SUN_H_T1_Reserved_0x2c 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x2c)
#endif
.align 32
#else
	NORMAL_TRAP(0x2c); 
#endif

T1_Reserved_0x2d:		
#ifdef H_T1_Reserved_0x2d
#ifdef SUN_H_T1_Reserved_0x2d
	 SUN_H_T1_Reserved_0x2d 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x2d)
#endif
.align 32
#else
	NORMAL_TRAP(0x2d); 
#endif

T1_Reserved_0x2e:		
#ifdef H_T1_Reserved_0x2e
#ifdef SUN_H_T1_Reserved_0x2e
	 SUN_H_T1_Reserved_0x2e 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x2e)
#endif
.align 32
#else
	NORMAL_TRAP(0x2e); 
#endif

T1_Reserved_0x2f:		
#ifdef H_T1_Reserved_0x2f
#ifdef SUN_H_T1_Reserved_0x2f
	 SUN_H_T1_Reserved_0x2f 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x2f)
#endif
.align 32
#else
	NORMAL_TRAP(0x2f); 
#endif

T1_Reserved_0x30:		
#ifdef H_T1_Reserved_0x30
#ifdef SUN_H_T1_Reserved_0x30
	 SUN_H_T1_Reserved_0x30 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x30)
#endif
.align 32
#else
	NORMAL_TRAP(0x30); 
#endif

T1_Reserved_0x31:		
#ifdef H_T1_Reserved_0x31
#ifdef SUN_H_T1_Reserved_0x31
	 SUN_H_T1_Reserved_0x31 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x31)
#endif
.align 32
#else
	NORMAL_TRAP(0x31); 
#endif

T1_Reserved_0x32:		
#ifdef H_T1_Reserved_0x32
#ifdef SUN_H_T1_Reserved_0x32
	 SUN_H_T1_Reserved_0x32 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x32)
#endif
.align 32
#else
	NORMAL_TRAP(0x32); 
#endif

T1_Reserved_0x33:		
#ifdef H_T1_Reserved_0x33
#ifdef SUN_H_T1_Reserved_0x33
	 SUN_H_T1_Reserved_0x33 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x33)
#endif
.align 32
#else
	NORMAL_TRAP(0x33); 
#endif

T1_Mem_Address_Not_Aligned_0x34:		
#ifdef H_T1_Mem_Address_Not_Aligned_0x34
#ifdef SUN_H_T1_Mem_Address_Not_Aligned_0x34
	 SUN_H_T1_Mem_Address_Not_Aligned_0x34 
#else
#	ifdef My_T1_Mem_Address_Not_Aligned_0x34
		My_T1_Mem_Address_Not_Aligned_0x34
#	else
		CUSTOM_TRAP(H_T1_Mem_Address_Not_Aligned_0x34)
#	endif
#endif
.align 32
#else
	NORMAL_TRAP(0x34); 
#endif

T1_Reserved_0x35:		
#ifdef H_T1_Reserved_0x35
#ifdef SUN_H_T1_Reserved_0x35
	 SUN_H_T1_Reserved_0x35 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x35)
#endif
.align 32
#else
	NORMAL_TRAP(0x35); 
#endif

T1_Reserved_0x36:		
#ifdef H_T1_Reserved_0x36
#ifdef SUN_H_T1_Reserved_0x36
	 SUN_H_T1_Reserved_0x36 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x36)
#endif
.align 32
#else
	NORMAL_TRAP(0x36); 
#endif

T1_Reserved_0x37:		
#ifdef H_T1_Reserved_0x37
#ifdef SUN_H_T1_Reserved_0x37
	 SUN_H_T1_Reserved_0x37 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x37)
#endif
.align 32
#else
	NORMAL_TRAP(0x37); 
#endif

T1_Reserved_0x38:		
#ifdef H_T1_Reserved_0x38
#ifdef SUN_H_T1_Reserved_0x38
	 SUN_H_T1_Reserved_0x38 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x38)
#endif
.align 32
#else
	NORMAL_TRAP(0x38); 
#endif

T1_Reserved_0x39:		
#ifdef H_T1_Reserved_0x39
#ifdef SUN_H_T1_Reserved_0x39
	 SUN_H_T1_Reserved_0x39 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x39)
#endif
.align 32
#else
	NORMAL_TRAP(0x39); 
#endif

T1_Reserved_0x3a:		
#ifdef H_T1_Reserved_0x3a
#ifdef SUN_H_T1_Reserved_0x3a
	 SUN_H_T1_Reserved_0x3a 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x3a)
#endif
.align 32
#else
	NORMAL_TRAP(0x3a); 
#endif

T1_Reserved_0x3b:		
#ifdef H_T1_Reserved_0x3b
#ifdef SUN_H_T1_Reserved_0x3b
	 SUN_H_T1_Reserved_0x3b 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x3b)
#endif
.align 32
#else
	NORMAL_TRAP(0x3b); 
#endif

T1_Reserved_0x3c:		
#ifdef H_T1_Reserved_0x3c
#ifdef SUN_H_T1_Reserved_0x3c
	 SUN_H_T1_Reserved_0x3c 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x3c)
#endif
.align 32
#else
	NORMAL_TRAP(0x3c); 
#endif

T1_Reserved_0x3d:		
#ifdef H_T1_Reserved_0x3d
#ifdef SUN_H_T1_Reserved_0x3d
	 SUN_H_T1_Reserved_0x3d 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x3d)
#endif
.align 32
#else
	NORMAL_TRAP(0x3d); 
#endif

T1_Reserved_0x3e:		
#ifdef H_T1_Reserved_0x3e
#ifdef SUN_H_T1_Reserved_0x3e
	 SUN_H_T1_Reserved_0x3e 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x3e)
#endif
.align 32
#else
	NORMAL_TRAP(0x3e); 
#endif

T1_Reserved_0x3f:		
#ifdef H_T1_Reserved_0x3f
#ifdef SUN_H_T1_Reserved_0x3f
	 SUN_H_T1_Reserved_0x3f 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x3f)
#endif
.align 32
#else
	NORMAL_TRAP(0x3f); 
#endif

T1_Reserved_0x40:		
#ifdef H_T1_Reserved_0x40
#ifdef SUN_H_T1_Reserved_0x40
	 SUN_H_T1_Reserved_0x40 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x40)
#endif
.align 32
#else
	NORMAL_TRAP(0x40); 
#endif

T1_Interrupt_Level_1_0x41:		
#ifdef H_T1_Interrupt_Level_1_0x41
#ifdef SUN_H_T1_Interrupt_Level_1_0x41
	 SUN_H_T1_Interrupt_Level_1_0x41 
#else
#       ifdef My_T1_Interrupt_Level_1_0x41
                My_T1_Interrupt_Level_1_0x41
#       else
        	CUSTOM_TRAP(H_T1_Interrupt_Level_1_0x41)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x41); 
#endif

T1_Interrupt_Level_2_0x42:		
#ifdef H_T1_Interrupt_Level_2_0x42
#ifdef SUN_H_T1_Interrupt_Level_2_0x42
	 SUN_H_T1_Interrupt_Level_2_0x42 
#else
#       ifdef My_T1_Interrupt_Level_2_0x42
                My_T1_Interrupt_Level_2_0x42
#       else
        	CUSTOM_TRAP(H_T1_Interrupt_Level_2_0x42)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x42); 
#endif

T1_Interrupt_Level_3_0x43:		
#ifdef H_T1_Interrupt_Level_3_0x43
#ifdef SUN_H_T1_Interrupt_Level_3_0x43
	 SUN_H_T1_Interrupt_Level_3_0x43 
#else
#       ifdef My_T1_Interrupt_Level_3_0x43
                My_T1_Interrupt_Level_3_0x43
#       else
        	CUSTOM_TRAP(H_T1_Interrupt_Level_3_0x43)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x43); 
#endif

T1_Interrupt_Level_4_0x44:		
#ifdef H_T1_Interrupt_Level_4_0x44
#ifdef SUN_H_T1_Interrupt_Level_4_0x44
	 SUN_H_T1_Interrupt_Level_4_0x44 
#else
#       ifdef My_T1_Interrupt_Level_4_0x44
                My_T1_Interrupt_Level_4_0x44
#       else
        	CUSTOM_TRAP(H_T1_Interrupt_Level_4_0x44)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x44); 
#endif

T1_Interrupt_Level_5_0x45:		
#ifdef H_T1_Interrupt_Level_5_0x45
#ifdef SUN_H_T1_Interrupt_Level_5_0x45
	 SUN_H_T1_Interrupt_Level_5_0x45 
#else
#       ifdef My_T1_Interrupt_Level_5_0x45
                My_T1_Interrupt_Level_5_0x45
#       else
        	CUSTOM_TRAP(H_T1_Interrupt_Level_5_0x45)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x45); 
#endif

T1_Interrupt_Level_6_0x46:		
#ifdef H_T1_Interrupt_Level_6_0x46
#ifdef SUN_H_T1_Interrupt_Level_6_0x46
	 SUN_H_T1_Interrupt_Level_6_0x46 
#else
#       ifdef My_T1_Interrupt_Level_6_0x46
                My_T1_Interrupt_Level_6_0x46
#       else
        	CUSTOM_TRAP(H_T1_Interrupt_Level_6_0x46)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x46); 
#endif

T1_Interrupt_Level_7_0x47:		
#ifdef H_T1_Interrupt_Level_7_0x47
#ifdef SUN_H_T1_Interrupt_Level_7_0x47
	 SUN_H_T1_Interrupt_Level_7_0x47 
#else
#       ifdef My_T1_Interrupt_Level_7_0x47
                My_T1_Interrupt_Level_7_0x47
#       else
        	CUSTOM_TRAP(H_T1_Interrupt_Level_7_0x47)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x47); 
#endif

T1_Interrupt_Level_8_0x48:		
#ifdef H_T1_Interrupt_Level_8_0x48
#ifdef SUN_H_T1_Interrupt_Level_8_0x48
	 SUN_H_T1_Interrupt_Level_8_0x48 
#else
#       ifdef My_T1_Interrupt_Level_8_0x48
                My_T1_Interrupt_Level_8_0x48
#       else
        	CUSTOM_TRAP(H_T1_Interrupt_Level_8_0x48)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x48); 
#endif

T1_Interrupt_Level_9_0x49:		
#ifdef H_T1_Interrupt_Level_9_0x49
#ifdef SUN_H_T1_Interrupt_Level_9_0x49
	 SUN_H_T1_Interrupt_Level_9_0x49 
#else
#       ifdef My_T1_Interrupt_Level_9_0x49
                My_T1_Interrupt_Level_9_0x49
#       else
        	CUSTOM_TRAP(H_T1_Interrupt_Level_9_0x49)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x49); 
#endif

T1_Interrupt_Level_10_0x4a:		
#ifdef H_T1_Interrupt_Level_10_0x4a
#ifdef SUN_H_T1_Interrupt_Level_10_0x4a
	 SUN_H_T1_Interrupt_Level_10_0x4a 
#else
#       ifdef My_T1_Interrupt_Level_10_0x4a
                My_T1_Interrupt_Level_10_0x4a
#       else
        	CUSTOM_TRAP(H_T1_Interrupt_Level_10_0x4a)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4a); 
#endif

T1_Interrupt_Level_11_0x4b:		
#ifdef H_T1_Interrupt_Level_11_0x4b
#ifdef SUN_H_T1_Interrupt_Level_11_0x4b
	 SUN_H_T1_Interrupt_Level_11_0x4b 
#else
#       ifdef My_T1_Interrupt_Level_11_0x4b
                My_T1_Interrupt_Level_11_0x4b
#       else
        	CUSTOM_TRAP(H_T1_Interrupt_Level_11_0x4b)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4b); 
#endif

T1_Interrupt_Level_12_0x4c:		
#ifdef H_T1_Interrupt_Level_12_0x4c
#ifdef SUN_H_T1_Interrupt_Level_12_0x4c
	 SUN_H_T1_Interrupt_Level_12_0x4c 
#else
#       ifdef My_T1_Interrupt_Level_12_0x4c
                My_T1_Interrupt_Level_12_0x4c
#       else
        	CUSTOM_TRAP(H_T1_Interrupt_Level_12_0x4c)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4c); 
#endif

T1_Interrupt_Level_13_0x4d:		
#ifdef H_T1_Interrupt_Level_13_0x4d
#ifdef SUN_H_T1_Interrupt_Level_13_0x4d
	 SUN_H_T1_Interrupt_Level_13_0x4d 
#else
#       ifdef My_T1_Interrupt_Level_13_0x4d
                My_T1_Interrupt_Level_13_0x4d
#       else
        	CUSTOM_TRAP(H_T1_Interrupt_Level_13_0x4d)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4d); 
#endif

T1_Interrupt_Level_14_0x4e:		
#ifdef H_T1_Interrupt_Level_14_0x4e
#ifdef SUN_H_T1_Interrupt_Level_14_0x4e
	 SUN_H_T1_Interrupt_Level_14_0x4e 
#else
#       ifdef My_T1_Interrupt_Level_14_0x4e
                My_T1_Interrupt_Level_14_0x4e
#       else
        	CUSTOM_TRAP(H_T1_Interrupt_Level_14_0x4e)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4e); 
#endif

T1_Interrupt_Level_15_0x4f:		
#ifdef H_T1_Interrupt_Level_15_0x4f
#ifdef SUN_H_T1_Interrupt_Level_15_0x4f
	 SUN_H_T1_Interrupt_Level_15_0x4f 
#else
#       ifdef My_T1_Interrupt_Level_15_0x4f
                My_T1_Interrupt_Level_15_0x4f
#       else
        	CUSTOM_TRAP(H_T1_Interrupt_Level_15_0x4f)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x4f); 
#endif

T1_Reserved_0x50:		
#ifdef H_T1_Reserved_0x50
#ifdef SUN_H_T1_Reserved_0x50
	 SUN_H_T1_Reserved_0x50 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x50)
#endif
.align 32
#else
	NORMAL_TRAP(0x50); 
#endif

T1_Reserved_0x51:		
#ifdef H_T1_Reserved_0x51
#ifdef SUN_H_T1_Reserved_0x51
	 SUN_H_T1_Reserved_0x51 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x51)
#endif
.align 32
#else
	NORMAL_TRAP(0x51); 
#endif

T1_Reserved_0x52:		
#ifdef H_T1_Reserved_0x52
#ifdef SUN_H_T1_Reserved_0x52
	 SUN_H_T1_Reserved_0x52 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x52)
#endif
.align 32
#else
	NORMAL_TRAP(0x52); 
#endif

T1_Reserved_0x53:		
#ifdef H_T1_Reserved_0x53
#ifdef SUN_H_T1_Reserved_0x53
	 SUN_H_T1_Reserved_0x53 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x53)
#endif
.align 32
#else
	NORMAL_TRAP(0x53); 
#endif

T1_Reserved_0x54:		
#ifdef H_T1_Reserved_0x54
#ifdef SUN_H_T1_Reserved_0x54
	 SUN_H_T1_Reserved_0x54 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x54)
#endif
.align 32
#else
	NORMAL_TRAP(0x54); 
#endif

T1_Reserved_0x55:		
#ifdef H_T1_Reserved_0x55
#ifdef SUN_H_T1_Reserved_0x55
	 SUN_H_T1_Reserved_0x55 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x55)
#endif
.align 32
#else
	NORMAL_TRAP(0x55); 
#endif

T1_Reserved_0x56:		
#ifdef H_T1_Reserved_0x56
#ifdef SUN_H_T1_Reserved_0x56
	 SUN_H_T1_Reserved_0x56 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x56)
#endif
.align 32
#else
	NORMAL_TRAP(0x56); 
#endif

T1_Reserved_0x57:		
#ifdef H_T1_Reserved_0x57
#ifdef SUN_H_T1_Reserved_0x57
	 SUN_H_T1_Reserved_0x57 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x57)
#endif
.align 32
#else
	NORMAL_TRAP(0x57); 
#endif

T1_Reserved_0x58:		
#ifdef H_T1_Reserved_0x58
#ifdef SUN_H_T1_Reserved_0x58
	 SUN_H_T1_Reserved_0x58 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x58)
#endif
.align 32
#else
	NORMAL_TRAP(0x58); 
#endif

T1_Reserved_0x59:		
#ifdef H_T1_Reserved_0x59
#ifdef SUN_H_T1_Reserved_0x59
	 SUN_H_T1_Reserved_0x59 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x59)
#endif
.align 32
#else
	NORMAL_TRAP(0x59); 
#endif

T1_Reserved_0x5a:		
#ifdef H_T1_Reserved_0x5a
#ifdef SUN_H_T1_Reserved_0x5a
	 SUN_H_T1_Reserved_0x5a 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x5a)
#endif
.align 32
#else
	NORMAL_TRAP(0x5a); 
#endif

T1_Reserved_0x5b:		
#ifdef H_T1_Reserved_0x5b
#ifdef SUN_H_T1_Reserved_0x5b
	 SUN_H_T1_Reserved_0x5b 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x5b)
#endif
.align 32
#else
	NORMAL_TRAP(0x5b); 
#endif

T1_Reserved_0x5c:		
#ifdef H_T1_Reserved_0x5c
#ifdef SUN_H_T1_Reserved_0x5c
	 SUN_H_T1_Reserved_0x5c 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x5c)
#endif
.align 32
#else
	NORMAL_TRAP(0x5c); 
#endif

T1_Reserved_0x5d:		
#ifdef H_T1_Reserved_0x5d
#ifdef SUN_H_T1_Reserved_0x5d
	 SUN_H_T1_Reserved_0x5d 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x5d)
#endif
.align 32
#else
	NORMAL_TRAP(0x5d); 
#endif

T1_Reserved_0x5e:		
#ifdef H_T1_Reserved_0x5e
#ifdef SUN_H_T1_Reserved_0x5e
	 SUN_H_T1_Reserved_0x5e 
#else
#       ifdef My_T1_Reserved_0x5e
                My_T1_Reserved_0x5e
#       else
        	CUSTOM_TRAP(H_T1_Reserved_0x5e)
#       endif
#endif
.align 32
#else
	NORMAL_TRAP(0x5e); 
#endif

T1_Reserved_0x5f:		
#ifdef H_T1_Reserved_0x5f
#ifdef SUN_H_T1_Reserved_0x5f
	 SUN_H_T1_Reserved_0x5f 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x5f)
#endif
.align 32
#else
	NORMAL_TRAP(0x5f); 
#endif

T1_Reserved_0x60:		
#ifdef H_T1_Reserved_0x60
#ifdef SUN_H_T1_Reserved_0x60
	 SUN_H_T1_Reserved_0x60 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x60)
#endif
.align 32
#else
	NORMAL_TRAP(0x60); 
#endif

T1_Reserved_0x61:		
#ifdef H_T1_Reserved_0x61
#ifdef SUN_H_T1_Reserved_0x61
	 SUN_H_T1_Reserved_0x61 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x61)
#endif
.align 32
#else
	NORMAL_TRAP(0x61); 
#endif

T1_VA_Watchpoint_0x62:		
#ifdef H_T1_VA_Watchpoint_0x62
#ifdef SUN_H_T1_VA_Watchpoint_0x62
	 SUN_H_T1_VA_Watchpoint_0x62 
#else
        CUSTOM_TRAP(H_T1_VA_Watchpoint_0x62)
#endif
.align 32
#else
	NORMAL_TRAP(0x62); 
#endif

T1_Reserved_0x63:		
#ifdef H_T1_Reserved_0x63
#ifdef SUN_H_T1_Reserved_0x63
	 SUN_H_T1_Reserved_0x63 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x63)
#endif
.align 32
#else
	NORMAL_TRAP(0x63); 
#endif

T1_Fast_Instr_Access_MMU_Miss_0x64:
    EXIT_BAD

.align 128	
T1_Fast_Data_Access_MMU_Miss_0x68:
    EXIT_BAD

.align 128	

T1_Fast_Data_Access_Protection_0x6c:		
#ifdef H_T1_data_access_protection_0x6c
#ifdef SUN_H_T1_data_access_protection_0x6c
	 SUN_H_T1_data_access_protection_0x6c 
#else
        CUSTOM_TRAP(H_T1_data_access_protection_0x6c)
#endif
.align 32
#else
	NORMAL_TRAP(0x6c); 
#endif

T1_Reserved_0x6d:		
#ifdef H_T1_Reserved_0x6d
#ifdef SUN_H_T1_Reserved_0x6d
	 SUN_H_T1_Reserved_0x6d 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x6d)
#endif
.align 32
#else
	NORMAL_TRAP(0x6d); 
#endif

T1_Reserved_0x6e:		
#ifdef H_T1_Reserved_0x6e
#ifdef SUN_H_T1_Reserved_0x6e
	 SUN_H_T1_Reserved_0x6e 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x6e)
#endif
.align 32
#else
	NORMAL_TRAP(0x6e); 
#endif

T1_Reserved_0x6f:		
#ifdef H_T1_Reserved_0x6f
#ifdef SUN_H_T1_Reserved_0x6f
	 SUN_H_T1_Reserved_0x6f 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x6f)
#endif
.align 32
#else
	NORMAL_TRAP(0x6f); 
#endif

T1_Reserved_0x70:		
#ifdef H_T1_Reserved_0x70
#ifdef SUN_H_T1_Reserved_0x70
	 SUN_H_T1_Reserved_0x70 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x70)
#endif
.align 32
#else
	NORMAL_TRAP(0x70); 
#endif

T1_Reserved_0x71:		
#ifdef H_T1_Reserved_0x71
#ifdef SUN_H_T1_Reserved_0x71
	 SUN_H_T1_Reserved_0x71 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x71)
#endif
.align 32
#else
	NORMAL_TRAP(0x71); 
#endif

T1_Reserved_0x72:		
#ifdef H_T1_Reserved_0x72
#ifdef SUN_H_T1_Reserved_0x72
	 SUN_H_T1_Reserved_0x72 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x72)
#endif
.align 32
#else
	NORMAL_TRAP(0x72); 
#endif

T1_Reserved_0x73:		
#ifdef H_T1_Reserved_0x73
#ifdef SUN_H_T1_Reserved_0x73
	 SUN_H_T1_Reserved_0x73 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x73)
#endif
.align 32
#else
	NORMAL_TRAP(0x73); 
#endif

T1_Control_Transfer_Instr_0x74:		
#ifdef H_T1_Control_Transfer_Instr_0x74
#ifdef SUN_H_T1_Control_Transfer_Instr_0x74
	 SUN_H_T1_Control_Transfer_Instr_0x74 
#else
#	ifdef My_H_T1_Control_Transfer_Instr_0x74
		My_H_T1_Control_Transfer_Instr_0x74
#	else	
		CUSTOM_TRAP(H_T1_Control_Transfer_Instr_0x74)
#	endif	
#endif
.align 32
#else
	NORMAL_TRAP(0x74); 
#endif

T1_Instruction_VA_Watchpoint_0x75:		
#ifdef H_T1_Instruction_VA_Watchpoint_0x75
#ifdef SUN_H_T1_Instruction_VA_Watchpoint_0x75
	 SUN_H_T1_Instruction_VA_Watchpoint_0x75 
#else
        CUSTOM_TRAP(H_T1_Instruction_VA_Watchpoint_0x75)
#endif
.align 32
#else
	NORMAL_TRAP(0x75); 
#endif

T1_Reserved_0x76:		
#ifdef H_T1_Reserved_0x76
#ifdef SUN_H_T1_Reserved_0x76
	 SUN_H_T1_Reserved_0x76 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x76)
#endif
.align 32
#else
	NORMAL_TRAP(0x76); 
#endif

T1_Reserved_0x77:		
#ifdef H_T1_Reserved_0x77
#ifdef SUN_H_T1_Reserved_0x77
	 SUN_H_T1_Reserved_0x77 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x77)
#endif
.align 32
#else
	NORMAL_TRAP(0x77); 
#endif

T1_Reserved_0x78:		
#ifdef H_T1_Reserved_0x78
#ifdef SUN_H_T1_Reserved_0x78
	 SUN_H_T1_Reserved_0x78 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x78)
#endif
.align 32
#else
	NORMAL_TRAP(0x78); 
#endif

T1_Reserved_0x79:		
#ifdef H_T1_Reserved_0x79
#ifdef SUN_H_T1_Reserved_0x79
	 SUN_H_T1_Reserved_0x79 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x79)
#endif
.align 32
#else
	NORMAL_TRAP(0x79); 
#endif

T1_Reserved_0x7a:		
#ifdef H_T1_Reserved_0x7a
#ifdef SUN_H_T1_Reserved_0x7a
	 SUN_H_T1_Reserved_0x7a 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x7a)
#endif
.align 32
#else
	NORMAL_TRAP(0x7a); 
#endif

T1_Reserved_0x7b:		
#ifdef H_T1_Reserved_0x7b
#ifdef SUN_H_T1_Reserved_0x7b
	 SUN_H_T1_Reserved_0x7b 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x7b)
#endif
.align 32
#else
	NORMAL_TRAP(0x7b); 
#endif

T1_Cpu_Mondo_Trap_0x7c:		
#ifdef H_T1_Cpu_Mondo_Trap_0x7c
#ifdef SUN_H_T1_Cpu_Mondo_Trap_0x7c
	 SUN_H_T1_Cpu_Mondo_Trap_0x7c 
#else
#	ifdef My_T1_Cpu_Mondo_Trap_0x7c
		My_T1_Cpu_Mondo_Trap_0x7c
#	else	
		CUSTOM_TRAP(H_T1_Cpu_Mondo_Trap_0x7c)
#	endif	
#endif
.align 32
#else
	NORMAL_TRAP(0x7c); 
#endif

T1_Dev_Mondo_Trap_0x7d:		
#ifdef H_T1_Dev_Mondo_Trap_0x7d
#ifdef SUN_H_T1_Dev_Mondo_Trap_0x7d
	 SUN_H_T1_Dev_Mondo_Trap_0x7d 
#else
#	ifdef My_T1_Dev_Mondo_Trap_0x7d
		My_T1_Dev_Mondo_Trap_0x7d
#	else	
        	CUSTOM_TRAP(H_T1_Dev_Mondo_Trap_0x7d)
#	endif	
#endif
.align 32
#else
	NORMAL_TRAP(0x7d); 
#endif

T1_Resumable_Error_0x7e:		
#ifdef H_T1_Resumable_Error_0x7e
#ifdef SUN_H_T1_Resumable_Error_0x7e
	 SUN_H_T1_Resumable_Error_0x7e 
#else
#	ifdef My_T1_Resumable_Error_0x7e
		My_T1_Resumable_Error_0x7e
#	else	
        	CUSTOM_TRAP(H_T1_Resumable_Error_0x7e)
#	endif	
#endif
.align 32
#else
	NORMAL_TRAP(0x7e); 
#endif

T1_Reserved_0x7f:		
#ifdef H_T1_Reserved_0x7f
#ifdef SUN_H_T1_Reserved_0x7f
	 SUN_H_T1_Reserved_0x7f 
#else
        CUSTOM_TRAP(H_T1_Reserved_0x7f)
#endif
.align 32
#else
	NORMAL_TRAP(0x7f); 
#endif

T1_Window_Spill_0_Normal_0x80:		
#ifdef H_T1_Window_Spill_0_Normal_Trap
#ifdef SUN_H_T1_Window_Spill_0_Normal_Trap
	 SUN_H_T1_Window_Spill_0_Normal_Trap 
#else
#	ifdef My_T1_Window_Spill_0_Normal_Trap
		My_T1_Window_Spill_0_Normal_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Spill_0_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x80)
#endif
#endif

.align 128	
T1_Window_Spill_1_Normal_0x84:		
#ifdef H_T1_Window_Spill_1_Normal_Trap
#ifdef SUN_H_T1_Window_Spill_1_Normal_Trap
	 SUN_H_T1_Window_Spill_1_Normal_Trap 
#else
#	ifdef My_T1_Window_Spill_1_Normal_Trap
		My_T1_Window_Spill_1_Normal_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Spill_1_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x84)
#endif
#endif

.align 128	
T1_Window_Spill_2_Normal_0x88:		
#ifdef H_T1_Window_Spill_2_Normal_Trap
#ifdef SUN_H_T1_Window_Spill_2_Normal_Trap
	 SUN_H_T1_Window_Spill_2_Normal_Trap 
#else
#	ifdef My_T1_Window_Spill_2_Normal_Trap
		My_T1_Window_Spill_2_Normal_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Spill_2_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x88)
#endif
#endif

.align 128	
T1_Window_Spill_3_Normal_0x8c:		
#ifdef H_T1_Window_Spill_3_Normal_Trap
#ifdef SUN_H_T1_Window_Spill_3_Normal_Trap
	 SUN_H_T1_Window_Spill_3_Normal_Trap 
#else
#	ifdef My_T1_Window_Spill_3_Normal_Trap
		My_T1_Window_Spill_3_Normal_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Spill_3_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x8c)
#endif
#endif

.align 128	
T1_Window_Spill_4_Normal_0x90:
#ifdef H_T1_Window_Spill_4_Normal_Trap
#ifdef SUN_H_T1_Window_Spill_4_Normal_Trap
	 SUN_H_T1_Window_Spill_4_Normal_Trap 
#else
#	ifdef My_T1_Window_Spill_4_Normal_Trap
		My_T1_Window_Spill_4_Normal_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Spill_4_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x90)
#endif
#endif

.align 128	
T1_Window_Spill_5_Normal_0x94:
#ifdef H_T1_Window_Spill_5_Normal_Trap
#ifdef SUN_H_T1_Window_Spill_5_Normal_Trap
	 SUN_H_T1_Window_Spill_5_Normal_Trap 
#else
#	ifdef My_T1_Window_Spill_5_Normal_Trap
		My_T1_Window_Spill_5_Normal_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Spill_5_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x94)
#endif
#endif

.align 128	
T1_Window_Spill_6_Normal_0x98:
#ifdef H_T1_Window_Spill_6_Normal_Trap
#ifdef SUN_H_T1_Window_Spill_6_Normal_Trap
	 SUN_H_T1_Window_Spill_6_Normal_Trap 
#else
#	ifdef My_T1_Window_Spill_6_Normal_Trap
		My_T1_Window_Spill_6_Normal_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Spill_6_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x98)
#endif
#endif

.align 128	
T1_Window_Spill_7_Normal_0x9c:
#ifdef H_T1_Window_Spill_7_Normal_Trap
#ifdef SUN_H_T1_Window_Spill_7_Normal_Trap
	 SUN_H_T1_Window_Spill_7_Normal_Trap 
#else
#	ifdef My_T1_Window_Spill_7_Normal_Trap
		My_T1_Window_Spill_7_Normal_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Spill_7_Normal_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0x9c)
#endif
#endif

.align 128
T1_Window_Spill_0_Other_0xa0:		
#ifdef H_T1_Window_Spill_0_Other_Trap
#ifdef SUN_H_T1_Window_Spill_0_Other_Trap
	 SUN_H_T1_Window_Spill_0_Other_Trap 
#else
#	ifdef My_T1_Window_Spill_0_Other_Trap
		My_T1_Window_Spill_0_Other_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Spill_0_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xa0)
#endif
#endif

.align 128
T1_Window_Spill_1_Other_0xa4:		
#ifdef H_T1_Window_Spill_1_Other_Trap
#ifdef SUN_H_T1_Window_Spill_1_Other_Trap
	 SUN_H_T1_Window_Spill_1_Other_Trap 
#else
#	ifdef My_T1_Window_Spill_1_Other_Trap
		My_T1_Window_Spill_1_Other_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Spill_1_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xa4)
#endif
#endif

.align 128
T1_Window_Spill_2_Other_0xa8:		
#ifdef H_T1_Window_Spill_2_Other_Trap
#ifdef SUN_H_T1_Window_Spill_2_Other_Trap
	 SUN_H_T1_Window_Spill_2_Other_Trap 
#else
#	ifdef My_T1_Window_Spill_2_Other_Trap
		My_T1_Window_Spill_2_Other_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Spill_2_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xa8)
#endif
#endif

.align 128
T1_Window_Spill_3_Other_0xac:
#ifdef H_T1_Window_Spill_3_Other_Trap
#ifdef SUN_H_T1_Window_Spill_3_Other_Trap
	 SUN_H_T1_Window_Spill_3_Other_Trap 
#else
#	ifdef My_T1_Window_Spill_3_Other_Trap
		My_T1_Window_Spill_3_Other_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Spill_3_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xac)
#endif
#endif

.align 128
T1_Window_Spill_4_Other_0xb0:
#ifdef H_T1_Window_Spill_4_Other_Trap
#ifdef SUN_H_T1_Window_Spill_4_Other_Trap
	 SUN_H_T1_Window_Spill_4_Other_Trap 
#else
#	ifdef My_T1_Window_Spill_4_Other_Trap
		My_T1_Window_Spill_4_Other_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Spill_4_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xb0)
#endif
#endif

.align 128
T1_Window_Spill_5_Other_0xb4:
#ifdef H_T1_Window_Spill_5_Other_Trap
#ifdef SUN_H_T1_Window_Spill_5_Other_Trap
	 SUN_H_T1_Window_Spill_5_Other_Trap 
#else
#	ifdef My_T1_Window_Spill_5_Other_Trap
		My_T1_Window_Spill_5_Other_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Spill_5_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xb4)
#endif
#endif

.align 128
T1_Window_Spill_6_Other_0xb8:
#ifdef H_T1_Window_Spill_6_Other_Trap
#ifdef SUN_H_T1_Window_Spill_6_Other_Trap
	 SUN_H_T1_Window_Spill_6_Other_Trap 
#else
#	ifdef My_T1_Window_Spill_6_Other_Trap
		My_T1_Window_Spill_6_Other_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Spill_6_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xb8)
#endif
#endif

.align 128
T1_Window_Spill_7_Other_0xbc:
#ifdef H_T1_Window_Spill_7_Other_Trap
#ifdef SUN_H_T1_Window_Spill_7_Other_Trap
	 SUN_H_T1_Window_Spill_7_Other_Trap 
#else
#	ifdef My_T1_Window_Spill_7_Other_Trap
		My_T1_Window_Spill_7_Other_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Spill_7_Other_Trap)
#	endif
#endif
#else
#ifdef SPILL_TRAP_RETRY
	saved; retry; nop;nop;nop;nop;nop;nop;
#else
	SPILL_TRAP(0xbc)
#endif
#endif

.align 128
T1_Window_Fill_0_Normal_0xc0:
#ifdef H_T1_Window_Fill_0_Normal_Trap
#ifdef SUN_H_T1_Window_Fill_0_Normal_Trap
	 SUN_H_T1_Window_Fill_0_Normal_Trap 
#else
#	ifdef My_T1_Window_Fill_0_Normal_Trap
		My_T1_Window_Fill_0_Normal_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Fill_0_Normal_Trap)
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
T1_Window_Fill_1_Normal_0xc4:
#ifdef H_T1_Window_Fill_1_Normal_Trap
#ifdef SUN_H_T1_Window_Fill_1_Normal_Trap
	 SUN_H_T1_Window_Fill_1_Normal_Trap 
#else
#	ifdef My_T1_Window_Fill_1_Normal_Trap
		My_T1_Window_Fill_1_Normal_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Fill_1_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xc4)
#endif
#endif

.align 128
T1_Window_Fill_2_Normal_0xc8:
#ifdef H_T1_Window_Fill_2_Normal_Trap
#ifdef SUN_H_T1_Window_Fill_2_Normal_Trap
	 SUN_H_T1_Window_Fill_2_Normal_Trap 
#else
#	ifdef My_T1_Window_Fill_2_Normal_Trap
		My_T1_Window_Fill_2_Normal_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Fill_2_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xc8)
#endif
#endif

.align 128
T1_Window_Fill_3_Normal_0xcc:
#ifdef H_T1_Window_Fill_3_Normal_Trap
#ifdef SUN_H_T1_Window_Fill_3_Normal_Trap
	 SUN_H_T1_Window_Fill_3_Normal_Trap 
#else
#	ifdef My_T1_Window_Fill_3_Normal_Trap
		My_T1_Window_Fill_3_Normal_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Fill_3_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xcc)
#endif
#endif

.align 128
T1_Window_Fill_4_Normal_0xd0:
#ifdef H_T1_Window_Fill_4_Normal_Trap
#ifdef SUN_H_T1_Window_Fill_4_Normal_Trap
	 SUN_H_T1_Window_Fill_4_Normal_Trap 
#else
#	ifdef My_T1_Window_Fill_4_Normal_Trap
		My_T1_Window_Fill_4_Normal_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Fill_4_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xd0)
#endif
#endif

.align 128
T1_Window_Fill_5_Normal_0xd4:
#ifdef H_T1_Window_Fill_5_Normal_Trap
#ifdef SUN_H_T1_Window_Fill_5_Normal_Trap
	 SUN_H_T1_Window_Fill_5_Normal_Trap 
#else
#	ifdef My_T1_Window_Fill_5_Normal_Trap
		My_T1_Window_Fill_5_Normal_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Fill_5_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xd4)
#endif
#endif

.align 128
T1_Window_Fill_6_Normal_0xd8:
#ifdef H_T1_Window_Fill_6_Normal_Trap
#ifdef SUN_H_T1_Window_Fill_6_Normal_Trap
	 SUN_H_T1_Window_Fill_6_Normal_Trap 
#else
#	ifdef My_T1_Window_Fill_6_Normal_Trap
		My_T1_Window_Fill_6_Normal_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Fill_6_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xd8)
#endif
#endif

.align 128
T1_Window_Fill_7_Normal_0xdc:
#ifdef H_T1_Window_Fill_7_Normal_Trap
#ifdef SUN_H_T1_Window_Fill_7_Normal_Trap
	 SUN_H_T1_Window_Fill_7_Normal_Trap 
#else
#	ifdef My_T1_Window_Fill_7_Normal_Trap
		My_T1_Window_Fill_7_Normal_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Fill_7_Normal_Trap)
#	endif
#endif
#else
#ifdef FILL_TRAP_RETRY
	restored; retry; nop;nop;nop;nop;nop;nop;
#else
	FILL_TRAP(0xdc)
#endif
#endif

.align 128
T1_Window_Fill_0_Other_0xe0:
#ifdef H_T1_Window_Fill_0_Other_Trap
#ifdef SUN_H_T1_Window_Fill_0_Other_Trap
	 SUN_H_T1_Window_Fill_0_Other_Trap 
#else
#	ifdef My_T1_Window_Fill_0_Other_Trap
		My_T1_Window_Fill_0_Other_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Fill_0_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xe0)
#endif

.align 128
T1_Window_Fill_1_Other_0xe4:
#ifdef H_T1_Window_Fill_1_Other_Trap
#ifdef SUN_H_T1_Window_Fill_1_Other_Trap
	 SUN_H_T1_Window_Fill_1_Other_Trap 
#else
#	ifdef My_T1_Window_Fill_1_Other_Trap
		My_T1_Window_Fill_1_Other_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Fill_1_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xe4)
#endif

.align 128
T1_Window_Fill_2_Other_0xe8:
#ifdef H_T1_Window_Fill_2_Other_Trap
#ifdef SUN_H_T1_Window_Fill_2_Other_Trap
	 SUN_H_T1_Window_Fill_2_Other_Trap 
#else
#	ifdef My_T1_Window_Fill_2_Other_Trap
		My_T1_Window_Fill_2_Other_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Fill_2_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xe8)
#endif

.align 128
T1_Window_Fill_3_Other_0xec:
#ifdef H_T1_Window_Fill_3_Other_Trap
#ifdef SUN_H_T1_Window_Fill_3_Other_Trap
	 SUN_H_T1_Window_Fill_3_Other_Trap 
#else
#	ifdef My_T1_Window_Fill_3_Other_Trap
		My_T1_Window_Fill_3_Other_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Fill_3_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xec)
#endif

.align 128
T1_Window_Fill_4_Other_0xf0:
#ifdef H_T1_Window_Fill_4_Other_Trap
#ifdef SUN_H_T1_Window_Fill_4_Other_Trap
	 SUN_H_T1_Window_Fill_4_Other_Trap 
#else
#	ifdef My_T1_Window_Fill_4_Other_Trap
		My_T1_Window_Fill_4_Other_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Fill_4_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xf0)
#endif

.align 128
T1_Window_Fill_5_Other_0xf4:
#ifdef H_T1_Window_Fill_5_Other_Trap
#ifdef SUN_H_T1_Window_Fill_5_Other_Trap
	 SUN_H_T1_Window_Fill_5_Other_Trap 
#else
#	ifdef My_T1_Window_Fill_5_Other_Trap
		My_T1_Window_Fill_5_Other_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Fill_5_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xf4)
#endif

.align 128
T1_Window_Fill_6_Other_0xf8:
#ifdef H_T1_Window_Fill_6_Other_Trap
#ifdef SUN_H_T1_Window_Fill_6_Other_Trap
	 SUN_H_T1_Window_Fill_6_Other_Trap 
#else
#	ifdef My_T1_Window_Fill_6_Other_Trap
		My_T1_Window_Fill_6_Other_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Fill_6_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xf8)
#endif

.align 128
T1_Window_Fill_7_Other_0xfc:
#ifdef H_T1_Window_Fill_7_Other_Trap
#ifdef SUN_H_T1_Window_Fill_7_Other_Trap
	 SUN_H_T1_Window_Fill_7_Other_Trap 
#else
#	ifdef My_T1_Window_Fill_7_Other_Trap
		My_T1_Window_Fill_7_Other_Trap
#	else
		CUSTOM_TRAP(H_T1_Window_Fill_7_Other_Trap)
#	endif
#endif
#else
	FILL_TRAP(0xfc)
#endif


.align 128
T1_GoodTrap_0x100:
        ta T_HGOOD_TRAP;nop;nop;nop;nop;nop;nop;nop

T1_BadTrap_0x101:
        ta T_HBAD_TRAP; nop;nop;nop;nop;nop;nop;nop

.align 32
T1_ChangePriv_0x102:
#ifdef H_T1_ChangePriv_0x102
#ifdef SUN_H_T1_ChangePriv_0x102
         SUN_H_T1_ChangePriv_0x102
#else
                CUSTOM_TRAP(H_T1_ChangePriv_0x102)
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

.align 32
T1_ChangeNonPriv_0x103:
#ifdef H_T1_ChangeNonPriv_0x103
#ifdef SUN_H_T1_ChangeNonPriv_0x103
         SUN_H_T1_ChangeNonPriv_0x103
#else
                CUSTOM_TRAP(H_T1_ChangeNonPriv_0x103)
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

T1_ChangeToTL1_0x104:
	wrpr %g0, 1, %gl
        rdpr    %tnpc, %g1
	wrpr %g0, 1, %tl
	jmp	%g1
	nop
	nop
	nop
	nop
		
T1_ChangeToTL0_0x105:
	rdpr %tstate, %g1
	rdpr %tpc, %g2
	rdpr %tnpc, %g3
	wrpr %g0, 1, %tl
	wrpr %g1, 0, %tstate
	wrpr %g2, 0, %tpc
	wrpr %g3, 0, %tnpc
	done

.align 128
T1_TrapEn_0x108:
        setx    trap_enable_data, %g2, %g1
        mov     0x800, %g2
        add     %o0, %o0, %o0
        sth     %g2, [%g1+%o0]
        done

.align 64
T1_TrapDis_0x10a:
        setx    trap_enable_data, %g2, %g1
        mov     0, %g2
        add     %o0, %o0, %o0
        sth     %g2, [%g1+%o0]
        done

.align 64
T1_TrapEn_Ntimes_0x10c:
        setx    trap_enable_data, %g2, %g1
        add     %o0, %o0, %o0
        sth     %o1, [%g1+%o0]
        done

.align 128
T1_PThreadMutexLock_0x110:
#ifdef H_T1_PThreadMutexLock_0x110
#ifdef SUN_H_T1_PThreadMutexLock_0x110
         SUN_H_T1_PThreadMutexLock_0x110
#else
#   ifdef My_T1_PThreadMutexLock_0x110
        My_T1_PThreadMutexLock_0x110
#   else
        CUSTOM_TRAP(H_T1_PThreadMutexLock_0x110)
#   endif
#endif
#else
        rdpr    %tl, %g2
        cmp     %g2, 2
        bne,a   .+8
        or      %i0, %g0, %o1
        setx    pthread_mutex_data, %g2, %g3
pt_retry_1:	
	ldstub	[%g3+%o1], %g2
	brz	%g2, pt_done_1
	nop
pt_loop_1:
	ldub	[%g3+%o1], %g2
	brnz	%g2, pt_loop_1
	nop
	ba,a	pt_retry_1
pt_done_1:
	membar	#LoadLoad | #LoadStore
	done
#endif

.align 128
T1_PThreadMutexUnLock_0x114:	
#ifdef H_T1_PThreadMutexUnLock_0x114
#ifdef SUN_H_T1_PThreadMutexUnLock_0x114
         SUN_H_T1_PThreadMutexUnLock_0x114
#else
        CUSTOM_TRAP(H_T1_PThreadMutexUnLock_0x114)
#endif
#else
        setx    pthread_mutex_data, %g2, %g5
	stub	%g0, [%g5+%o1]
	done
#endif

.align 64
T1_Trap_Sync_0x116:

	setx	pthread_counter_data, %g1, %g4
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
T1_Trap_Function_0x118:
! call kernel dervice routine
	mov	0x0,	%o0
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 512
T1_HTrap_Enable_0x120:
! call kernel dervice routine
	ta	%icc, T_API_CHANGE_PRIV
	done
	mov	123, %g1
	mov	123, %g1
	mov	123, %g1
	nop
	nop
	nop
	
.align 64
T1_HTrap_Disable_0x122:
    ta      %icc, T_API_CHANGE_NONPRIV
	done
	nop
	nop
	nop
	nop
	nop
	nop
	
.align 64
T1_Trap_Function_0x124:
        ta      %icc, T_API_TRAP_EN
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 64
T1_Trap_Function_0x126:
        ta      %icc, T_API_TRAP_DIS
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 64	
T1_HTrapEn_Ntimes_0x128:
#ifdef H_T1_HTrapEn_Ntimes_0x128
#ifdef SUN_H_T1_HTrapEn_Ntimes_0x128
	 SUN_H_T1_HTrapEn_Ntimes_0x128 
#else
#	ifdef My_T1_HTrapEn_Ntimes_0x128
		My_T1_HTrapEn_Ntimes_0x128
#	else
		CUSTOM_TRAP(H_T1_HTrapEn_Ntimes_0x128)
#	endif
#endif
#else
        ta      %icc, T_API_TRAP_EN_N_TIMES
	done
	nop
	nop
	nop
	nop
	nop
	nop
#endif

.align 64	
T1_ChangeCtx_0x12a:
#ifdef H_T1_ChangeCtx_0x12a
#ifdef SUN_H_T1_ChangeCtx_0x12a
	 SUN_H_T1_ChangeCtx_0x12a 
#else
#	ifdef My_T1_ChangeCtx_0x12a
		My_T1_ChangeCtx_0x12a
#	else
		CUSTOM_TRAP(H_T1_ChangeCtx_0x12a)
#	endif
#endif
#else
    ta      %icc, T_API_CHANGE_CTX
	done
	nop
	nop
	nop
	nop
	nop
	nop
#endif

.align 64
T1_Dummy_0x12c:
#ifdef H_T1_Dummy_0x12c
#ifdef SUN_H_T1_Dummy_0x12c
	 SUN_H_T1_Dummy_0x12c 
#else
#	ifdef My_T1_Dummy_0x12c
		My_T1_Dummy_0x12c
#	else
		CUSTOM_TRAP(H_T1_Dummy_0x12c)
#	endif
#endif
#else
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
#endif

.align 64	
T1_RdThId_0x12e:
        ta      %icc, T_API_RD_THID
	done
	nop
	nop
	nop
	nop
	nop
	nop

.align 512
T1_Trap_Instruction_0x130:
#ifdef H_T1_Trap_Instruction_0
#ifdef SUN_H_T1_Trap_Instruction_0
	 SUN_H_T1_Trap_Instruction_0 
#else
#	ifdef My_T1_Trap_Instruction_0
		My_T1_Trap_Instruction_0
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0)
#	endif
#endif
#else
	NORMAL_TRAP(0x130);
#endif

.align 32
T1_Trap_Instruction_0x131:
#ifdef H_T1_Trap_Instruction_1
#ifdef SUN_H_T1_Trap_Instruction_1
	SUN_H_T1_Trap_Instruction_1
#else
#	ifdef My_T1_Trap_Instruction_1
		My_T1_Trap_Instruction_1
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_1)
#	endif
#endif
#else
	NORMAL_TRAP(0x131);
#endif

.align 32
T1_Trap_Instruction_0x132:
#ifdef H_T1_Trap_Instruction_2
#ifdef SUN_H_T1_Trap_Instruction_2
	SUN_H_T1_Trap_Instruction_2
#else
#	ifdef My_T1_Trap_Instruction_2
		My_T1_Trap_Instruction_2
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_2)
#	endif
#endif
#else
	ta	T_API_HTRAP_INST0;
        done;
        nop;
	nop;
	nop;
	nop;
	nop;
	nop;
#endif

.align 32
T1_Trap_Instruction_0x133:
#ifdef H_T1_Trap_Instruction_3
#ifdef SUN_H_T1_Trap_Instruction_3
	SUN_H_T1_Trap_Instruction_3
#else
#	ifdef My_T1_Trap_Instruction_3
		My_T1_Trap_Instruction_3
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_3)
#	endif
#endif
#else
	ta	T_API_HTRAP_INST1;
        done;
        nop;
	nop;
	nop;
	nop;
	nop;
	nop;
#endif

.align 32
T1_Trap_Instruction_0x134:
#ifdef H_T1_Trap_Instruction_4
#ifdef SUN_H_T1_Trap_Instruction_4
	 SUN_H_T1_Trap_Instruction_4
#else
#	ifdef My_T1_Trap_Instruction_4
		My_T1_Trap_Instruction_4
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_4)
#	endif
#endif
#else
	NORMAL_TRAP(0x134);
#endif

.align 32
T1_Trap_Instruction_0x135:
#ifdef H_T1_Trap_Instruction_5
#ifdef SUN_H_T1_Trap_Instruction_5
	SUN_H_T1_Trap_Instruction_5
#else
#	ifdef My_T1_Trap_Instruction_5
		My_T1_Trap_Instruction_5
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_5)
#	endif
#endif
#else
	NORMAL_TRAP(0x135);
#endif

.align 128
T1_Trap_Instruction_0x138:
#ifdef H_T1_Trap_Instruction_0x138
#ifdef SUN_H_T1_Trap_Instruction_0x138
	SUN_H_T1_Trap_Instruction_0x138
#else
#	ifdef My_T1_Trap_Instruction_0x138
		My_T1_Trap_Instruction_0x138
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0x138)
#	endif
#endif
#else
	NORMAL_TRAP(0x138);
#endif

.align 128
T1_Trap_Instruction_0x13c:
#ifdef H_T1_Trap_Instruction_0x13c
#ifdef SUN_H_T1_Trap_Instruction_0x13c
	SUN_H_T1_Trap_Instruction_0x13c
#else
#	ifdef My_T1_Trap_Instruction_0x13c
		My_T1_Trap_Instruction_0x13c
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0x13c)
#	endif
#endif
#else
	NORMAL_TRAP(0x13c);
#endif

.align 128
T1_Trap_Instruction_0x140:
#ifdef H_T1_Trap_Instruction_0x140
#ifdef SUN_H_T1_Trap_Instruction_0x140
	SUN_H_T1_Trap_Instruction_0x140
#else
#	ifdef My_T1_Trap_Instruction_0x140
		My_T1_Trap_Instruction_0x140
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0x140)
#	endif
#endif
#else
	NORMAL_TRAP(0x140);
#endif

.align 128
T1_Trap_Instruction_0x144:
#ifdef H_T1_Trap_Instruction_0x144
#ifdef SUN_H_T1_Trap_Instruction_0x144
	SUN_H_T1_Trap_Instruction_0x144
#else
#	ifdef My_T1_Trap_Instruction_0x144
		My_T1_Trap_Instruction_0x144
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0x144)
#	endif
#endif
#else
	NORMAL_TRAP(0x144);
#endif

.align 128
T1_Trap_Instruction_0x148:
#ifdef H_T1_Trap_Instruction_0x148
#ifdef SUN_H_T1_Trap_Instruction_0x148
	SUN_H_T1_Trap_Instruction_0x148
#else
#	ifdef My_T1_Trap_Instruction_0x148
		My_T1_Trap_Instruction_0x148
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0x148)
#	endif
#endif
#else
	NORMAL_TRAP(0x148);
#endif

.align 128
T1_Trap_Instruction_0x14c:
#ifdef H_T1_Trap_Instruction_0x14c
#ifdef SUN_H_T1_Trap_Instruction_0x14c
	SUN_H_T1_Trap_Instruction_0x14c
#else
#	ifdef My_T1_Trap_Instruction_0x14c
		My_T1_Trap_Instruction_0x14c
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0x14c)
#	endif
#endif
#else
	NORMAL_TRAP(0x14c);
#endif

.align 128
T1_Trap_Instruction_0x150:
#ifdef H_T1_Trap_Instruction_0x150
#ifdef SUN_H_T1_Trap_Instruction_0x150
	SUN_H_T1_Trap_Instruction_0x150
#else
#	ifdef My_T1_Trap_Instruction_0x150
		My_T1_Trap_Instruction_0x150
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0x150)
#	endif
#endif
#else
	NORMAL_TRAP(0x150);
#endif

.align 128
T1_Trap_Instruction_0x154:
#ifdef H_T1_Trap_Instruction_0x154
#ifdef SUN_H_T1_Trap_Instruction_0x154
	SUN_H_T1_Trap_Instruction_0x154
#else
#	ifdef My_T1_Trap_Instruction_0x154
		My_T1_Trap_Instruction_0x154
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0x154)
#	endif
#endif
#else
	NORMAL_TRAP(0x154);
#endif

.align 128
T1_Trap_Instruction_0x158:
#ifdef H_T1_Trap_Instruction_0x158
#ifdef SUN_H_T1_Trap_Instruction_0x158
	SUN_H_T1_Trap_Instruction_0x158
#else
#	ifdef My_T1_Trap_Instruction_0x158
		My_T1_Trap_Instruction_0x158
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0x158)
#	endif
#endif
#else
	NORMAL_TRAP(0x158);
#endif

.align 128
T1_Trap_Instruction_0x15c:
#ifdef H_T1_Trap_Instruction_0x15c
#ifdef SUN_H_T1_Trap_Instruction_0x15c
	SUN_H_T1_Trap_Instruction_0x15c
#else
#	ifdef My_T1_Trap_Instruction_0x15c
		My_T1_Trap_Instruction_0x15c
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0x15c)
#	endif
#endif
#else
	NORMAL_TRAP(0x15c);
#endif

.align 128
T1_Trap_Instruction_0x160:
#ifdef H_T1_Trap_Instruction_0x160
#ifdef SUN_H_T1_Trap_Instruction_0x160
	SUN_H_T1_Trap_Instruction_0x160
#else
#	ifdef My_T1_Trap_Instruction_0x160
		My_T1_Trap_Instruction_0x160
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0x160)
#	endif
#endif
#else
	NORMAL_TRAP(0x160);
#endif

.align 128
T1_Trap_Instruction_0x164:
#ifdef H_T1_Trap_Instruction_0x164
#ifdef SUN_H_T1_Trap_Instruction_0x164
	SUN_H_T1_Trap_Instruction_0x164
#else
#	ifdef My_T1_Trap_Instruction_0x164
		My_T1_Trap_Instruction_0x164
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0x164)
#	endif
#endif
#else
	NORMAL_TRAP(0x164);
#endif

.align 128
T1_Trap_Instruction_0x168:
#ifdef H_T1_Trap_Instruction_0x168
#ifdef SUN_H_T1_Trap_Instruction_0x168
	SUN_H_T1_Trap_Instruction_0x168
#else
#	ifdef My_T1_Trap_Instruction_0x168
		My_T1_Trap_Instruction_0x168
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0x168)
#	endif
#endif
#else
	NORMAL_TRAP(0x168);
#endif

.align 128
T1_Trap_Instruction_0x16c:
#ifdef H_T1_Trap_Instruction_0x16c
#ifdef SUN_H_T1_Trap_Instruction_0x16c
	SUN_H_T1_Trap_Instruction_0x16c
#else
#	ifdef My_T1_Trap_Instruction_0x16c
		My_T1_Trap_Instruction_0x16c
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0x16c)
#	endif
#endif
#else
	NORMAL_TRAP(0x16c);
#endif

.align 128
T1_Trap_Instruction_0x170:
#ifdef H_T1_Trap_Instruction_0x170
#ifdef SUN_H_T1_Trap_Instruction_0x170
	SUN_H_T1_Trap_Instruction_0x170
#else
#	ifdef My_T1_Trap_Instruction_0x170
		My_T1_Trap_Instruction_0x170
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0x170)
#	endif
#endif
#else
	NORMAL_TRAP(0x170);
#endif

.align 128
T1_Trap_Instruction_0x174:
#ifdef H_T1_Trap_Instruction_0x174
#ifdef SUN_H_T1_Trap_Instruction_0x174
	SUN_H_T1_Trap_Instruction_0x174
#else
#	ifdef My_T1_Trap_Instruction_0x174
		My_T1_Trap_Instruction_0x174
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0x174)
#	endif
#endif
#else
	NORMAL_TRAP(0x174);
#endif

.align 32
T1_Trap_Instruction_0x175:
#ifdef H_T1_Trap_Instruction_0x175
#ifdef SUN_H_T1_Trap_Instruction_0x175
	SUN_H_T1_Trap_Instruction_0x175
#else
#	ifdef My_T1_Trap_Instruction_0x175
		My_T1_Trap_Instruction_0x175
#	else
		CUSTOM_TRAP(H_T1_Trap_Instruction_0x175)
#	endif
#endif
#else
	NORMAL_TRAP(0x175);
#endif



! If counter > 0,  trap is enabled for n times, decrement counter
! If counter = 0,  trap is disabled, go to BadTrap
! If counter = -1, trap has taken n times, go to GoodTrap directly
! If counter <-1,  trap is enabled for n times, increment counter 
! TT in %g7, counter in %g2
.align 0x4000
TrapCheck:
#ifdef SKIP_TRAPCHECK
    done
    nop
#else
	set	trap_enable_data, %g1
	add	%g7, %g7, %g4
	ldsh	[%g1+%g4], %g2
	cmp	%g2, 0
	bl	%xcc, CheckGoodTrap
#ifdef NO_TRAPCHECK
	nop
#else
	mov     0,      %o0
#endif
	be	%xcc, T0_BadTrap_0x101
	sub	%g2, 1, %g2
	ba	TrapCheck_end
CheckGoodTrap:
	cmp	%g2, -1
	be	%xcc, T0_GoodTrap_0x100
	add	%g2, 1, %g2
TrapCheck_end:		
	sth	%g2, [%g1+%g4]
	done
#endif
    

#include "syscall_handler.s"
.data

trap_enable_data:	
dt0_0:
	.half 	E0_0x00,E0_0x01,E0_0x02,E0_0x03,E0_0x04,E0_0x05,E0_0x06,E0_0x07
	.half 	E0_0x08,E0_0x09,E0_0x0a,E0_0x0b,E0_0x0c,E0_0x0d,E0_0x0e,E0_0x0f

	.half 	E0_0x10,E0_0x11,E0_0x12,E0_0x13,E0_0x14,E0_0x15,E0_0x16,E0_0x17
	.half 	E0_0x18,E0_0x19,E0_0x1a,E0_0x1b,E0_0x1c,E0_0x1d,E0_0x1e,E0_0x1f
	
	.half 	E0_0x20,E0_0x21,E0_0x22,E0_0x23,E0_0x24,E0_0x25,E0_0x26,E0_0x27
	.half 	E0_0x28,E0_0x29,E0_0x2a,E0_0x2b,E0_0x2c,E0_0x2d,E0_0x2e,E0_0x2f
	
	.half 	E0_0x30,E0_0x31,E0_0x32,E0_0x33,E0_0x34,E0_0x35,E0_0x36,E0_0x37
	.half 	E0_0x38,E0_0x39,E0_0x3a,E0_0x3b,E0_0x3c,E0_0x3d,E0_0x3e,E0_0x3f
	
dt0_64:
	.half 	E0_0x40,E0_0x41,E0_0x42,E0_0x43,E0_0x44,E0_0x45,E0_0x46,E0_0x47
	.half 	E0_0x48,E0_0x49,E0_0x4a,E0_0x4b,E0_0x4c,E0_0x4d,E0_0x4e,E0_0x4f
	
	.half 	E0_0x50,E0_0x51,E0_0x52,E0_0x53,E0_0x54,E0_0x55,E0_0x56,E0_0x57
	.half 	E0_0x58,E0_0x59,E0_0x5a,E0_0x5b,E0_0x5c,E0_0x5d,E0_0x5e,E0_0x5f
	
	.half 	E0_0x60,E0_0x61,E0_0x62,E0_0x63,E0_0x64,E0_0x65,E0_0x66,E0_0x67
	.half 	E0_0x68,E0_0x69,E0_0x6a,E0_0x6b,E0_0x6c,E0_0x6d,E0_0x6e,E0_0x6f
	
	.half 	E0_0x70,E0_0x71,E0_0x72,E0_0x73,E0_0x74,E0_0x75,E0_0x76,E0_0x77
	.half 	E0_0x78,E0_0x79,E0_0x7a,E0_0x7b,E0_0x7c,E0_0x7d,E0_0x7e,E0_0x7f
	
dt0_128:
	.half 	E0_0x80,E0_0x81,E0_0x82,E0_0x83,E0_0x84,E0_0x85,E0_0x86,E0_0x87
	.half 	E0_0x88,E0_0x89,E0_0x8a,E0_0x8b,E0_0x8c,E0_0x8d,E0_0x8e,E0_0x8f

	.half 	E0_0x90,E0_0x91,E0_0x92,E0_0x93,E0_0x94,E0_0x95,E0_0x96,E0_0x97
	.half 	E0_0x98,E0_0x99,E0_0x9a,E0_0x9b,E0_0x9c,E0_0x9d,E0_0x9e,E0_0x9f

	.half 	E0_0xa0,E0_0xa1,E0_0xa2,E0_0xa3,E0_0xa4,E0_0xa5,E0_0xa6,E0_0xa7
	.half 	E0_0xa8,E0_0xa9,E0_0xaa,E0_0xab,E0_0xac,E0_0xad,E0_0xae,E0_0xaf

	.half 	E0_0xb0,E0_0xb1,E0_0xb2,E0_0xb3,E0_0xb4,E0_0xb5,E0_0xb6,E0_0xb7
	.half 	E0_0xb8,E0_0xb9,E0_0xba,E0_0xbb,E0_0xbc,E0_0xbd,E0_0xbe,E0_0xbf

dt0_192:	
	.half 	E0_0xc0,E0_0xc1,E0_0xc2,E0_0xc3,E0_0xc4,E0_0xc5,E0_0xc6,E0_0xc7
	.half 	E0_0xc8,E0_0xc9,E0_0xca,E0_0xcb,E0_0xcc,E0_0xcd,E0_0xce,E0_0xcf

	.half 	E0_0xd0,E0_0xd1,E0_0xd2,E0_0xd3,E0_0xd4,E0_0xd5,E0_0xd6,E0_0xd7
	.half 	E0_0xd8,E0_0xd9,E0_0xda,E0_0xdb,E0_0xdc,E0_0xdd,E0_0xde,E0_0xdf

	.half 	E0_0xe0,E0_0xe1,E0_0xe2,E0_0xe3,E0_0xe4,E0_0xe5,E0_0xe6,E0_0xe7
	.half 	E0_0xe8,E0_0xe9,E0_0xea,E0_0xeb,E0_0xec,E0_0xed,E0_0xee,E0_0xef

	.half 	E0_0xf0,E0_0xf1,E0_0xf2,E0_0xf3,E0_0xf4,E0_0xf5,E0_0xf6,E0_0xf7
	.half 	E0_0xf8,E0_0xf9,E0_0xfa,E0_0xfb,E0_0xfc,E0_0xfd,E0_0xfe,E0_0xff

dt1_0:	
	.half 	E1_0x00,E1_0x01,E1_0x02,E1_0x03,E1_0x04,E1_0x05,E1_0x06,E1_0x07
	.half 	E1_0x08,E1_0x09,E1_0x0a,E1_0x0b,E1_0x0c,E1_0x0d,E1_0x0e,E1_0x0f

	.half 	E1_0x10,E1_0x11,E1_0x12,E1_0x13,E1_0x14,E1_0x15,E1_0x16,E1_0x17
	.half 	E1_0x18,E1_0x19,E1_0x1a,E1_0x1b,E1_0x1c,E1_0x1d,E1_0x1e,E1_0x1f
	
	.half 	E1_0x20,E1_0x21,E1_0x22,E1_0x23,E1_0x24,E1_0x25,E1_0x26,E1_0x27
	.half 	E1_0x28,E1_0x29,E1_0x2a,E1_0x2b,E1_0x2c,E1_0x2d,E1_0x2e,E1_0x2f
	
	.half 	E1_0x30,E1_0x31,E1_0x32,E1_0x33,E1_0x34,E1_0x35,E1_0x36,E1_0x37
	.half 	E1_0x38,E1_0x39,E1_0x3a,E1_0x3b,E1_0x3c,E1_0x3d,E1_0x3e,E1_0x3f
	
dt1_64:
	.half 	E1_0x40,E1_0x41,E1_0x42,E1_0x43,E1_0x44,E1_0x45,E1_0x46,E1_0x47
	.half 	E1_0x48,E1_0x49,E1_0x4a,E1_0x4b,E1_0x4c,E1_0x4d,E1_0x4e,E1_0x4f
	
	.half 	E1_0x50,E1_0x51,E1_0x52,E1_0x53,E1_0x54,E1_0x55,E1_0x56,E1_0x57
	.half 	E1_0x58,E1_0x59,E1_0x5a,E1_0x5b,E1_0x5c,E1_0x5d,E1_0x5e,E1_0x5f
	
	.half 	E1_0x60,E1_0x61,E1_0x62,E1_0x63,E1_0x64,E1_0x65,E1_0x66,E1_0x67
	.half 	E1_0x68,E1_0x69,E1_0x6a,E1_0x6b,E1_0x6c,E1_0x6d,E1_0x6e,E1_0x6f
	
	.half 	E1_0x70,E1_0x71,E1_0x72,E1_0x73,E1_0x74,E1_0x75,E1_0x76,E1_0x77
	.half 	E1_0x78,E1_0x79,E1_0x7a,E1_0x7b,E1_0x7c,E1_0x7d,E1_0x7e,E1_0x7f
	
dt1_128:
	.half 	E1_0x80,E1_0x81,E1_0x82,E1_0x83,E1_0x84,E1_0x85,E1_0x86,E1_0x87
	.half 	E1_0x88,E1_0x89,E1_0x8a,E1_0x8b,E1_0x8c,E1_0x8d,E1_0x8e,E1_0x8f

	.half 	E1_0x90,E1_0x91,E1_0x92,E1_0x93,E1_0x94,E1_0x95,E1_0x96,E1_0x97
	.half 	E1_0x98,E1_0x99,E1_0x9a,E1_0x9b,E1_0x9c,E1_0x9d,E1_0x9e,E1_0x9f

	.half 	E1_0xa0,E1_0xa1,E1_0xa2,E1_0xa3,E1_0xa4,E1_0xa5,E1_0xa6,E1_0xa7
	.half 	E1_0xa8,E1_0xa9,E1_0xaa,E1_0xab,E1_0xac,E1_0xad,E1_0xae,E1_0xaf

	.half 	E1_0xb0,E1_0xb1,E1_0xb2,E1_0xb3,E1_0xb4,E1_0xb5,E1_0xb6,E1_0xb7
	.half 	E1_0xb8,E1_0xb9,E1_0xba,E1_0xbb,E1_0xbc,E1_0xbd,E1_0xbe,E1_0xbf

dt1_192:	
	.half 	E1_0xc0,E1_0xc1,E1_0xc2,E1_0xc3,E1_0xc4,E1_0xc5,E1_0xc6,E1_0xc7
	.half 	E1_0xc8,E1_0xc9,E1_0xca,E1_0xcb,E1_0xcc,E1_0xcd,E1_0xce,E1_0xcf

	.half 	E1_0xd0,E1_0xd1,E1_0xd2,E1_0xd3,E1_0xd4,E1_0xd5,E1_0xd6,E1_0xd7
	.half 	E1_0xd8,E1_0xd9,E1_0xda,E1_0xdb,E1_0xdc,E1_0xdd,E1_0xde,E1_0xdf

	.half 	E1_0xe0,E1_0xe1,E1_0xe2,E1_0xe3,E1_0xe4,E1_0xe5,E1_0xe6,E1_0xe7
	.half 	E1_0xe8,E1_0xe9,E1_0xea,E1_0xeb,E1_0xec,E1_0xed,E1_0xee,E1_0xef

	.half 	E1_0xf0,E1_0xf1,E1_0xf2,E1_0xf3,E1_0xf4,E1_0xf5,E1_0xf6,E1_0xf7
	.half 	E1_0xf8,E1_0xf9,E1_0xfa,E1_0xfb,E1_0xfc,E1_0xfd,E1_0xfe,E1_0xff

pthread_mutex_data:

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
	
pthread_counter_data:

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

.align 512
pthread_syscall_data:

	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	.xword	0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000
	
