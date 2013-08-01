/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ffu_fsr_gsr_n2.s
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
#define FSR_DUMP_P  %g2
#define FSR_DATA_P  %g3
#define NUM_CASES   64

#define  MAIN_PAGE_HV_ALSO  
#define  MAIN_PAGE_NUCLEUS_ALSO

#define ENABLE_T0_Clean_Window_0x24
#define ENABLE_T0_Corrected_ECC_error_0x63 
#define ENABLE_T0_Data_Access_Exception_0x30 
#define ENABLE_T0_Data_access_error_0x32 
#define ENABLE_T0_Division_By_Zero_0x28 
#define ENABLE_T0_Fp_disabled_0x20
#define ENABLE_T0_Fp_exception_ieee_754_0x21 
#define ENABLE_T0_Fp_exception_other_0x22 
#define ENABLE_T0_Illegal_instruction_0x10
#define ENABLE_T0_Instruction_Access_MMU_Miss_0x09
#define ENABLE_T0_Instruction_access_error_0x0a 
#define ENABLE_T0_Instruction_access_exception_0x08
#define ENABLE_T0_Lddf_Mem_Address_Not_Aligned_0x35
#define ENABLE_T0_Mem_Address_Not_Aligned_0x34 
#define ENABLE_T0_Privileged_Action_0x37 
#define ENABLE_T0_Privileged_opcode_0x11
#define ENABLE_T0_Stdf_Mem_Address_Not_Aligned_0x36
#define ENABLE_T0_Tag_Overflow_0x23 
#define ENABLE_T0_Unimplemented_LDD_0x12
#define ENABLE_T0_Unimplemented_STD_0x13
#define ENABLE_T0_data_access_protection_0x6c 
#define ENABLE_T0_fast_data_access_MMU_miss_0x68
#define ENABLE_T0_fast_instr_access_MMU_miss_0x64
	
#include "hboot.s"

.global main        
main:
th_fork(th_main,%l0)		! start up to four threads.
	! All threads run the same code with different data.
th_main_0:
	setx	fsr_save0,%g7,FSR_DUMP_P
	ba	all_thds
	nop
th_main_1:
	setx	fsr_save1,%g7,FSR_DUMP_P
	ba	all_thds
	nop
th_main_2:
	setx	fsr_save2,%g7,FSR_DUMP_P
	ba	all_thds
	nop    
th_main_3:
	setx	fsr_save3,%g7,FSR_DUMP_P
	ba	all_thds
	nop    

all_thds:       
    	wr      %g0,0x4,%fprs

	!------------------------------
	! test FSR reads and writes
	!------------------------------
	setx	ones_data,%g7,FSR_DATA_P
	setx	fp_data,%g7,%l0
	ldd	[%l0],%f0
	ldd	[%l0+8],%f2
	add	%g0,NUM_CASES,%l1
    
fsr_loop:
	! 32-bit loads and stores
	ld	[FSR_DATA_P],%fsr   ! load followed by store
	st	%fsr,[FSR_DUMP_P]

	fcmpd	%fcc0,%f0,%f2	    ! load must wait for fcmp to finish
	ld	[FSR_DUMP_P],%fsr
	fcmpd	%fcc0,%f2,%f0	    ! store must wait for fcmp to finish
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DATA_P],%fsr   ! store followed by load

    	! 64-bit loads and stores
	ldx	[FSR_DATA_P],%fsr   ! load followed by store
	stx	%fsr,[FSR_DUMP_P]

	fcmpd	%fcc3,%f0,%f2	    ! load must wait for fcmp to finish
	ldx	[FSR_DUMP_P],%fsr
	fcmpd	%fcc1,%f2,%f0	    ! store must wait for fcmp to finish
	stx	%fsr,[FSR_DUMP_P]
	ldx	[FSR_DATA_P],%fsr   ! store followed by load

        ! mixed 32 and 64-bit
	ldx	[FSR_DATA_P],%fsr   ! load followed by store
	stx	%fsr,[FSR_DUMP_P]

	fcmpd	%fcc3,%f0,%f2	    ! load must wait for fcmp to finish
	ld	[FSR_DUMP_P],%fsr
	fcmpd	%fcc0,%f2,%f0	    ! store must wait for fcmp to finish
	stx	%fsr,[FSR_DUMP_P]
	ldx	[FSR_DATA_P],%fsr   ! store followed by load
	fcmpd	%fcc3,%f0,%f0
	fcmpd	%fcc0,%f2,%f2
	st	%fsr,[FSR_DUMP_P]

	sub	%l1,1,%l1
	brnz	%l1,fsr_loop
	add	FSR_DATA_P,8,FSR_DATA_P


	!------------------------------
	! test GSR reads and writes
	!------------------------------
	setx	ones_data,%g7,FSR_DATA_P
	add	%g0,NUM_CASES,%l1
	add	%g0,7,%i0
    
gsr_loop:
	ldx	[FSR_DATA_P],%l2
	alignaddr %i0,%g0,%i1
	wr	%l2,0,%gsr
	alignaddr %i0,%g0,%i1
	rd	%gsr,%l3

    	sub	%l1,1,%l1
	brnz	%l1,gsr_loop
	add	FSR_DATA_P,8,FSR_DATA_P
    
good_end:   
	ta	T_GOOD_TRAP
	nop
	nop    

!==========================    
.data
.align 0x1fff+1

.align 8
fp_data:
	.word   0x3e780000, 0x12345678
	.word   0x3e790000, 0x12345678

.align 8
ones_data:
	.word	0x00000000, 0x00000000
	.word	0x00000000, 0x00000001
	.word	0x00000000, 0x00000002
	.word	0x00000000, 0x00000004
	.word	0x00000000, 0x00000008
	.word	0x00000000, 0x00000010
	.word	0x00000000, 0x00000020
	.word	0x00000000, 0x00000040
	.word	0x00000000, 0x00000080
	.word	0x00000000, 0x00000100
	.word	0x00000000, 0x00000200
	.word	0x00000000, 0x00000400
	.word	0x00000000, 0x00000800
	.word	0x00000000, 0x00001000
	.word	0x00000000, 0x00002000
	.word	0x00000000, 0x00004000
	.word	0x00000000, 0x00008000
	.word	0x00000000, 0x00010000
	.word	0x00000000, 0x00020000
	.word	0x00000000, 0x00040000
	.word	0x00000000, 0x00080000
	.word	0x00000000, 0x00100000
	.word	0x00000000, 0x00200000
	.word	0x00000000, 0x00400000
	.word	0x00000000, 0x00800000
	.word	0x00000000, 0x01000000
	.word	0x00000000, 0x02000000
	.word	0x00000000, 0x04000000
	.word	0x00000000, 0x08000000
	.word	0x00000000, 0x10000000
	.word	0x00000000, 0x20000000
	.word	0x00000000, 0x40000000
	.word	0x00000000, 0x80000000
	.word	0x00000001, 0x00000000
	.word	0x00000002, 0x00000000
	.word	0x00000004, 0x00000000
	.word	0x00000008, 0x00000000
	.word	0x00000010, 0x00000000
	.word	0x00000020, 0x00000000
	.word	0x00000040, 0x00000000
	.word	0x00000080, 0x00000000
	.word	0x00000100, 0x00000000
	.word	0x00000200, 0x00000000
	.word	0x00000400, 0x00000000
	.word	0x00000800, 0x00000000
	.word	0x00001000, 0x00000000
	.word	0x00002000, 0x00000000
	.word	0x00004000, 0x00000000
	.word	0x00008000, 0x00000000
	.word	0x00010000, 0x00000000
	.word	0x00020000, 0x00000000
	.word	0x00040000, 0x00000000
	.word	0x00080000, 0x00000000
	.word	0x00100000, 0x00000000
	.word	0x00200000, 0x00000000
	.word   0x00400000, 0x00000000
	.word	0x00800000, 0x00000000
	.word	0x01000000, 0x00000000
	.word	0x02000000, 0x00000000
	.word	0x04000000, 0x00000000
	.word	0x08000000, 0x00000000
	.word	0x10000000, 0x00000000
	.word	0x20000000, 0x00000000
	.word	0x40000000, 0x00000000
	.word	0x80000000, 0x00000000

fsr_save0:  
	.word	0,0
fsr_save1:  
	.word	0,0    
fsr_save2:  
	.word	0,0    
fsr_save3:  
	.word	0,0


.end    
