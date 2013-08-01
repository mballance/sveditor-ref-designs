/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ffu_fsr_tem_n2.s
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

#define TRAP_NOT_TAKEN 0
#define TRAP_TAKEN     0x1fff

#define TEM_INVALID		%o1
#define TEM_INVALID_SHIFT	27

#define TEM_OVERFLOW		%o2
#define TEM_OVERFLOW_SHIFT	26

#define TEM_UNDERFLOW		%o3
#define TEM_UNDERFLOW_SHIFT	25
    
#define TEM_DIV_0		%o4
#define TEM_DIV_0_SHIFT		24

#define TEM_INEXACT		%o5
#define TEM_INEXACT_SHIFT	23
      
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
th_fork(th_main,%l0)		! start up to four threads.

th_main_0:   
    	wr      %g0,0x4,%fprs 
	set	fsr_data0,%g1
	set	fsr_save0,FSR_DUMP_P
	ba      all_thds
	nop
     
th_main_1: 
    	wr      %g0,0x4,%fprs 
	set	fsr_data1,%g1
	set	fsr_save1,FSR_DUMP_P
	ba      all_thds
	nop
        
th_main_2: 
        wr      %g0,0x4,%fprs 
	set	fsr_data2,%g1
	set	fsr_save2,FSR_DUMP_P
	ba      all_thds
	nop   
th_main_3:
        wr      %g0,0x4,%fprs 
	set	fsr_data3,%g1
	set	fsr_save3,FSR_DUMP_P
	ba      all_thds
	nop   
    

all_thds:   
	set	operands,OPERAND_P
	ldd	[OPERAND_P],    %f0
	ldd	[OPERAND_P+8],  %f2
	ldd	[OPERAND_P+0x10], %f4
	ldd	[OPERAND_P+0x18], %f6
	ldd	[OPERAND_P+0x20], %f8
	ldd	[OPERAND_P+0x28], %f10
	ldd	[OPERAND_P+0x30], %f12
	ldd	[OPERAND_P+0x38], %f14
	ldd	[OPERAND_P+0x40], %f16
	ldd	[OPERAND_P+0x48], %f18

	! clear destination regs because they are unchanged on a trap
	set	zero_words,%l2
	ldd	[%l2],%f20
	ldd	[%l2],%f22
	ldd	[%l2],%f24
	ldd	[%l2],%f26
	ldd	[%l2],%f28

	! set register values for checking TEM settings
	add	%g0,1,%l1
	sll	%l1,TEM_INVALID_SHIFT,TEM_INVALID
	sll	%l1,TEM_OVERFLOW_SHIFT,TEM_OVERFLOW
	sll	%l1,TEM_UNDERFLOW_SHIFT,TEM_UNDERFLOW
	sll	%l1,TEM_DIV_0_SHIFT,TEM_DIV_0
	sll	%l1,TEM_INEXACT_SHIFT,TEM_INEXACT
    
	mov	NUM_MODES,%i7
loop: 
	ld	[%g1],%fsr
    	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%l1
	st	%fsr,[FSR_DUMP_P]	! double check that st %fsr does not
	ld	[FSR_DUMP_P],%l2	! clear wrong fields

invalid: 
	add	%g0,TRAP_NOT_TAKEN,%g6
	fdivd	%f0,%f2,%f20		! 0/0 is invalid
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%g5
	and	%g5,TEM_INVALID,%g5
	brz	%g5,overflow		! ok if trap was not enabled
	and	%g5,%g6,%g6
	brnz	%g6,overflow		! ok if trap was taken
	nop
	ta	T_BAD_TRAP
	nop    

overflow:   
	add	%g0,TRAP_NOT_TAKEN,%g6
    	fdivd	%f4,%f6,%f22		! big/tiny overflows
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%g5
	and	%g5,TEM_OVERFLOW,%g5
	brz	%g5,underflow		! ok if trap was not enabled
	and	%g5,%g6,%g6
	brnz	%g6,underflow		! ok if trap was taken
	nop
	ta	T_BAD_TRAP
	nop

underflow:
	add	%g0,TRAP_NOT_TAKEN,%g6
	fdivd	%f8,%f10,%f24		! tiny/big underflows
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%g5
	and	%g5,TEM_UNDERFLOW,%g5
	brz	%g5,div0		! ok if trap was not enabled
	and	%g5,%g6,%g6
	brnz	%g6,div0		! ok if trap was taken
	nop
	ta	T_BAD_TRAP
	nop
    
div0:	
	add	%g0,TRAP_NOT_TAKEN,%g6
	fdivd	%f12,%f14,%f26		! x/0 is div by zero if x <> 0
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%g5
	and	%g5,TEM_DIV_0,%g5
	brz	%g5,inexact		! ok if trap was not enabled
	and	%g5,%g6,%g6
	brnz	%g6,inexact		! ok if trap was taken
	nop
	ta	T_BAD_TRAP
	nop
    
inexact:    
	add	%g0,TRAP_NOT_TAKEN,%g6
	faddd	%f16,%f18,%f28		! must round, therefore inexact
	st	%fsr,[FSR_DUMP_P]
	ld	[FSR_DUMP_P],%g5
	and	%g5,TEM_INEXACT,%g5
	brz	%g5,next_case		! ok if trap was not enabled
	and	%g5,%g6,%g6
	brnz	%g6,next_case		! ok if trap was taken
	nop
	ta	T_BAD_TRAP
	nop
        
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
operands:
	    .word   0x00000000, 0x00000000  ! fsr_invalid (nvc/nva)
	    .word   0x00000000, 0x00000000

	    .word   0x7fe88888, 0x00000000  ! fsr_overflow (ofc/ofa)
	    .word   0x05290000, 0x00001230

	    .word   0x003f3000, 0x00000000  ! fsr_underflow (ufc/ufa)
	    .word   0x66699999, 0x00000000

	    .word   0x02080000, 0x00000000  ! fsr_division by zero (dzc/dza)
	    .word   0x00000000, 0x00000000

	    .word   0x3fefffff, 0xfffffffd  ! fsr_inexact (nxc/nxa)
	    .word   0x3fefffff, 0xfffffffe
    
zero_words:
	    .word    0,0,0,0


.align 8
fsr_data0:
		 .word	0x00000000
		 .word	0x00800000
		 .word	0x01000000
	 	 .word	0x01800000
	 	 .word	0x02000000
	 	 .word	0x02800000
	 	 .word	0x03000000
	 	 .word	0x03800000
      
fsr_data1:
	 	 .word	0x04000000
	 	 .word	0x04800000
	 	 .word	0x05000000
	 	 .word	0x05800000
	 	 .word	0x06000000
	 	 .word	0x06800000
	 	 .word	0x07000000
	 	 .word	0x07800000
fsr_data2:
	 	 .word	0x08000000
	 	 .word	0x08800000
	 	 .word	0x09000000
	 	 .word	0x09800000
	 	 .word	0x0a000000
	 	 .word	0x0a800000
	 	 .word	0x0b000000
	 	 .word	0x0b800000
fsr_data3:
	 	 .word	0x0c000000
	 	 .word	0x0c800000
	 	 .word	0x0d000000
	 	 .word	0x0d800000
	 	 .word	0x0e000000
	 	 .word	0x0e800000
	 	 .word	0x0f000000
	 	 .word	0x0f800000

fsr_save0:	 .word  0
fsr_save1:	 .word  0
fsr_save2:	 .word  0
fsr_save3:	 .word  0



.text


// User %g6 lets test loop know that the trap was hit. 
.global trap_ieee754   
trap_ieee754:
    	wrpr	%g0,0,%gl	    ! go back to GL=0
	add	%g0,TRAP_TAKEN,%g6
	done
	nop
    
.end    
