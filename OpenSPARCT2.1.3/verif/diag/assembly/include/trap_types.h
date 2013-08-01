/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: trap_types.h
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
!! WARNING:
!! For bit set/reset masks, use "X * 2**Y" instead of "X * 2^Y".
!! "^" means "exponentiation" under SunOS:/bin/m4, but
!!     means "bitwise xor" under Solaris:/usr/ccs/bin/m4.
!! "**" is acceptable notation for exponentiation with either.

!	Trap Types (TT)		6/23/93 lyoungs

#define	POWERON_RESET_TT		0x001
#define	WATCHDOG_RESET_TT		0x002
#define	EXTERNAL_RESET_TT		0x003
#define	SOFTWARE_RESET_TT		0x004
#define	REDMODE_TT			0x005
#define	INSTRUCTION_ACCESS_EXCEPTION_TT	0x008
#define	IA_MMU_MISS_TT			0x009
#define	INSTRUCTION_ACCESS_ERROR_TT	0x00A
#define	ILLEGAL_TT			0x010
#define	PRIVILEGED_OPCODE_TT		0x011
#define	UNIMPLEMENTED_LDD_TT		0x012
#define	UNIMPLEMENTED_STD_TT		0x013
#define	FP_DISABLED_TT			0x020
#define	FP_IEEE_754_TT			0x021
#define	FP_EXCP_OTHER_TT		0x022
#define	TAG_OVERFLOW_TT			0x023
#define	CLEAN_WIN_TT			0x024
#define	DIV_ZERO_TT			0x028
#define	INT_PROC_ERROR_TT		0x029
#define	DATA_ACCESS_EXCEPTION_TT	0x030
#define	DA_MMU_MISS_TT			0x031
#define	DATA_ACCESS_ERROR_TT		0x032
#define	DATA_PROT_TT			0x033
#define	MEM_NONALIGNED_TT		0x034
#define	LDDF_MEM_NONALIGNED_TT		0x035
#define	STDF_MEM_NONALIGNED_TT		0x036
#define	PRIVILEGED_ACTION_TT		0x037
#define	LDQF_MEM_NONALIGNED_TT		0x038
#define	STQF_MEM_NONALIGNED_TT		0x039
#define	ASYNC_DATA_ERROR_TT		0x040
#define	INTERRUPT_LEVEL_1_TT		0x041
#define	INTERRUPT_LEVEL_2_TT		0x042
#define	INTERRUPT_LEVEL_3_TT		0x043
#define	INTERRUPT_LEVEL_4_TT		0x044
#define	INTERRUPT_LEVEL_5_TT		0x045
#define	INTERRUPT_LEVEL_6_TT		0x046
#define	INTERRUPT_LEVEL_7_TT		0x047
#define	INTERRUPT_LEVEL_8_TT		0x048
#define	INTERRUPT_LEVEL_9_TT		0x049
#define	INTERRUPT_LEVEL_10_TT		0x04A
#define	INTERRUPT_LEVEL_11_TT		0x04B
#define	INTERRUPT_LEVEL_12_TT		0x04C
#define	INTERRUPT_LEVEL_13_TT		0x04D
#define	INTERRUPT_LEVEL_14_TT		0x04E
#define	INTERRUPT_LEVEL_15_TT		0x04F
#define	IMPL_DEP_XCPN_0_TT		0x060
#define	PA_WATCHPOINT_TT		0x061
#define	VA_WATCHPOINT_TT		0x062
#define	IA_FAST_MMU_MISS_TT		0x064
#define	DA_FAST_MMU_MISS_TT		0x068
#define	FAST_DATA_PROT_TT		0x06C
#define FAST_CORRECTABLE_ECC_ERROR_TT	0x070
! Please add spill/fill if you need them -- lyoungs
#define TICC_TT(N)			N

