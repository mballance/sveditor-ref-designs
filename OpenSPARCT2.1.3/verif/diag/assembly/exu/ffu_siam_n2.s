/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ffu_siam_n2.s
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
#define	FSR_DUMP_P      	%g7
#define OPERAND_P	        %g2

#define NUM_MODES     8
      
#define H_T0_Fp_exception_ieee_754_0x21 trap_ieee754
    
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
	th_fork(th_main,%l0)		! seperate the threads

th_main_0:   
    	wr      %g0,0x4,%fprs 
	set	fsr_data0,%g1
	set	operands_0,OPERAND_P
	set	fsr_save0,FSR_DUMP_P
	ba      all_thds
	nop
     
th_main_1: 
    	wr      %g0,0x4,%fprs 
	set	fsr_data1,%g1
	set	operands_1,OPERAND_P
	set	fsr_save1,FSR_DUMP_P
	ba      all_thds
	nop
        
th_main_2: 
        wr      %g0,0x4,%fprs 
	set	fsr_data2,%g1
	set	operands_2,OPERAND_P
	set	fsr_save2,FSR_DUMP_P
	ba      all_thds
	nop   
th_main_3:
        wr      %g0,0x4,%fprs 
	set	fsr_data3,%g1
	set	operands_3,OPERAND_P
	set	fsr_save3,FSR_DUMP_P
	ba      all_thds
	nop   
    

all_thds:   
	mov	NUM_MODES,%i7
	ldd	[OPERAND_P], %f0
	ldd	[OPERAND_P+8], %f2
	! clear destination regs because they are unchagned on a trap
	set	zero_words,%l2
	ldd	[%l2],%f22
	ldd	[%l2],%f24
    
loop: 
	ld	[%g1],%fsr
    	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	st	%fsr,[FSR_DUMP_P]	! double check that st %fsr does not
	ld	[FSR_DUMP_P],%l2	! clear wrong fields

	th_fork(th_test,%l0)		! seperate the threads
    
th_test_3:   
	siam	0		! use fsr    
	faddd 	%f0, %f2, %f22
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f22,%f4
    
	siam	3		! use fsr
	faddd 	%f0, %f2, %f24
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f24,%f4
    
	siam	4	   
	faddd 	%f0, %f2, %f22
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f22,%f4
    
	siam	5
	faddd 	%f0, %f2, %f24
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f24,%f4
    
    	siam	6	   
	faddd 	%f0, %f2, %f22
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f22,%f4
    
	siam	7
	faddd 	%f0, %f2, %f24
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f24,%f4
    
	ba	next_case
	nop
    
th_test_2:   
	siam	0		! use fsr    
	faddd 	%f0, %f2, %f22
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1 
	fmovd	%f22,%f4
   
	siam	4
	faddd 	%f0, %f2, %f24
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f24,%f4
    
	siam	7	   
	faddd 	%f0, %f2, %f22
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f22,%f4
    
	siam	5
	faddd 	%f0, %f2, %f24
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f24,%f4
    
    	siam	2		! use fsr	   
	faddd 	%f0, %f2, %f22
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1 
	fmovd	%f22,%f4
   
	siam	6
	faddd 	%f0, %f2, %f24
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f24,%f4
    
	ba	next_case
	nop
    
th_test_1:   
	siam	7
	faddd 	%f0, %f2, %f22
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f22,%f4
    
	siam	6
	faddd 	%f0, %f2, %f24
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f24,%f4
    
	siam	5	   
	faddd 	%f0, %f2, %f22
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f22,%f4
    
	siam	3		! use fsr
	faddd 	%f0, %f2, %f24
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f24,%f4
    
    	siam	4	   
	faddd 	%f0, %f2, %f22
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f22,%f4
    
	siam	1		! use fsr
	faddd 	%f0, %f2, %f24
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f24,%f4
    
	ba	next_case
	nop    
    
th_test_0:   
	siam	6
	faddd 	%f0, %f2, %f22
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f22,%f4
    
	siam	5
	faddd 	%f0, %f2, %f24
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f24,%f4
    
	siam	4	   
	faddd 	%f0, %f2, %f22
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f22,%f4
    
	siam	2
	faddd 	%f0, %f2, %f24
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f24,%f4
    
    	siam	0		! use fsr	   
	faddd 	%f0, %f2, %f22
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f24,%f4
    
	siam	7
	faddd 	%f0, %f2, %f24
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	fmovd	%f22,%f4
    
next_case:
	add	 %g1, 4, %g1
	sub	 %i7, 1, %i7			! next mode
	brnz,a	 %i7, loop
	nop



good_end:   
	ta	T_GOOD_TRAP
	nop
	nop    

!==========================    
.data
.align 0x1fff+1

.align 8
fsr_data0:
	 	 .word	0x00800000
	 	 .word	0x40800000
	 	 .word	0x80800000
	 	 .word	0xc0800000
    	 	 .word	0x00000000
	 	 .word	0x40000000
	 	 .word	0x80000000
	 	 .word	0xc0000000
fsr_data1:  
	 	 .word	0x40800000
	 	 .word	0x40000000
	 	 .word	0x80800000
	 	 .word	0x80000000
	 	 .word	0xc0800000
	 	 .word	0xc0000000
	 	 .word	0x00800000
	 	 .word	0x00000000
fsr_data2:
	 	 .word	0x80000000
	 	 .word	0xc0000000
	 	 .word	0x00000000
	 	 .word	0x40000000
       	 	 .word	0x80800000
	 	 .word	0xc0800000
	 	 .word	0x00800000
	 	 .word	0x40800000
fsr_data3:
	 	 .word	0xc0800000    
	 	 .word	0x00800000
	 	 .word	0x00000000
	 	 .word	0x40800000
	 	 .word	0x80800000
    	 	 .word	0x40000000
	 	 .word	0x80000000
		 .word  0xc0000000

fsr_save0:	 .word  0
fsr_save1:	 .word  0
fsr_save2:	 .word  0
fsr_save3:	 .word  0

    
.align 8
.global operand_start
operands_0:
	! format = one bit of sign, 11 bits of exponent, 52 bits of fraction
	 .word	 0xf0080000, 0x00000000, 0x80080000, 0x00000000
operands_1:
	 .word	 0x3fefffff, 0xfffffffe, 0x3fefffff, 0xfffffffd
operands_2:
	 .word	 0x3fefffff, 0xfffffffc, 0x3ff80000, 0x00000001
operands_3:
	 .word	 0x00efffff, 0xffffffff, 0x00f80000, 0x00000004

zero_words:
	.word    0,0,0,0




.text
 
.global trap_ieee754   
trap_ieee754:
	done
	nop
    
.end    
