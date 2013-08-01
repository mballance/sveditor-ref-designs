/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ffu_blkst_stall_n2.s
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
#define DMMU_SKIP_IF_NO_TTE
#define STORE_LOOP  20
    
#include "asi_s.h"     

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
    	wr      %g0,0x4,%fprs

	setx	float_data,%l0,%g1
	ldd	[%g1],%f0
	ldd	[%g1],%f2
	ldd	[%g1],%f4
	ldd	[%g1],%f6
	ldd	[%g1],%f8
	ldd	[%g1],%f10
	ldd	[%g1],%f12
	ldd	[%g1],%f14
	ldd	[%g1],%f16
	ldd	[%g1],%f18
	ldd	[%g1],%f20
	ldd	[%g1],%f22
	ldd	[%g1],%f24
	ldd	[%g1],%f26
	ldd	[%g1],%f28
	ldd	[%g1],%f30
    
	rd	%asi,%g1	    ! current value of asi reg

    	ta	T_CHANGE_PRIV

	! these reads are just for debugging information
//	add	ASI_PRIMARY_CONTEXT_REG_VAL,%g0,%i0
//	ldxa    [%i0]ASI_PRIMARY_CONTEXT_REG,%i1    ! value of primary context
    
//	add	ASI_SECONDARY_CONTEXT_REG_VAL,%g0,%i2
//	ldxa    [%i2]ASI_SECONDARY_CONTEXT_REG,%i3    ! secondary context

//	rd	%asi,%g2

	! and now back to our regularly scheduled testing
	add	%g0,STORE_LOOP,%g3
	setx	target0_primary,%l0,%g2
    	add	%g2,0x000,%l1
	add	%g2,0x040,%l2
	add	%g2,0x080,%l3
	add	%g2,0x0c0,%l4
	add	%g2,0x100,%l5
	add	%g2,0x140,%l6
	add	%g2,0x180,%l7
	add	%g2,0x1c0,%i0
	add	%g2,0x200,%i1
	add	%g2,0x240,%i2
	add	%g2,0x280,%i3
	add	%g2,0x2c0,%i4
    
primary_loop:
	stda	%f0, [%l1]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f16,[%l2]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f0, [%l3]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f16,[%l4]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f0, [%l5]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f16,[%l6]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f0, [%l7]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f16,[%i0]ASI_BLOCK_AS_IF_USER_PRIMARY
    	stda	%f0, [%i1]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f16,[%i2]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f0, [%i3]ASI_BLOCK_AS_IF_USER_PRIMARY
	stda	%f16,[%i4]ASI_BLOCK_AS_IF_USER_PRIMARY

	sub	%g3,1,%g3
	brgz	%g3,primary_loop
	nop

	! do it again with secondary space. FFU does not care, but what the heck...
	add	%g0,STORE_LOOP,%g3
	setx	target0_secondary,%l0,%g2
        add	%g2,0x000,%l1
	add	%g2,0x040,%l2
	add	%g2,0x080,%l3
	add	%g2,0x0c0,%l4
	add	%g2,0x100,%l5
	add	%g2,0x140,%l6
	add	%g2,0x180,%l7
	add	%g2,0x1c0,%i0
	add	%g2,0x200,%i1
	add	%g2,0x240,%i2
	add	%g2,0x280,%i3
	add	%g2,0x2c0,%i4
    
secondary_loop:
	stda	%f0, [%l1]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f16,[%l2]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f0, [%l3]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f16,[%l4]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f0, [%l5]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f16,[%l6]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f0, [%l7]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f16,[%i0]ASI_BLOCK_AS_IF_USER_SECONDARY
    	stda	%f0, [%i1]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f16,[%i2]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f0, [%i3]ASI_BLOCK_AS_IF_USER_SECONDARY
	stda	%f16,[%i4]ASI_BLOCK_AS_IF_USER_SECONDARY

	sub	%g3,1,%g3
	brgz	%g3,secondary_loop
	nop

	! let the other threads finish gracefully
	setx	stop_flag,%l0,%g1
	stx	%g0,[%g1]
	ba	good_end
	nop
    
     
th_main_1: 
    	wr      %g0,0x4,%fprs
	setx	stop_flag,%l0,%g1
	setx    target1,%l0,%g2
	ba	background_noise
	nop
        
th_main_2: 
        wr      %g0,0x4,%fprs 
	setx	stop_flag,%l0,%g1
	setx    target1,%l0,%g2
	ba	background_noise
	nop
    
th_main_3:
        wr      %g0,0x4,%fprs 
	setx	stop_flag,%l0,%g1
	setx    target1,%l0,%g2

background_noise:   
	! create a large load of integer stores using three threads
	add	%g2,0,%l1
	add	%g2,8,%l2
	add	%g2,0x10,%l3
	add	%g2,0x18,%l4
	add	%g2,0x20,%l5
	add	%g2,0x28,%l6
    	add	%g2,0x30,%l7
	add	%g2,0x38,%i0
	add	%g2,0x40,%i1
	add	%g2,0x48,%i2
	add	%g2,0x50,%i3
	add	%g2,0x58,%i4
	add	%g2,0x60,%i5
	add	%g2,0x68,%i6
    	add	%g2,0x70,%i7
	add	%g2,0x78,%o0
	add	%g2,0x80,%o1
	add	%g2,0x88,%o2
	add	%g2,0x90,%o3
	add	%g2,0x98,%o4
	add	%g2,0xa0,%o5
	add	%g2,0xa8,%o6
    	add	%g2,0xb0,%o7    

noise_loop: 
	stx	%l1,[%l1]	    ! 1
	stx	%l2,[%l2]   
	stx	%l3,[%l3]   
	stx	%l4,[%l4]   
	stx	%l5,[%l5]   
	stx	%l6,[%l6]   
	stx	%l7,[%l7]   
	stx	%i0,[%i0]   
	stx	%i1,[%i1]   
	stx	%i2,[%i2]   
	stx	%i3,[%i3]   
	stx	%i4,[%i4]   
	stx	%i5,[%i5]   
	stx	%i6,[%i6]   
	stx	%i7,[%i7] 
	stx	%o0,[%o0]   
	stx	%o1,[%o1]   
	stx	%o2,[%o2]   
	stx	%o3,[%o3]   
	stx	%o4,[%o4]   
	stx	%o5,[%o5]   
	stx	%o6,[%o6]   
	stx	%o7,[%o7]

	stx	%l1,[%l1]	    ! 2 
	stx	%l2,[%l2]   
	stx	%l3,[%l3]   
	stx	%l4,[%l4]   
	stx	%l5,[%l5]   
	stx	%l6,[%l6]   
	stx	%l7,[%l7]   
	stx	%i0,[%i0]   
	stx	%i1,[%i1]   
	stx	%i2,[%i2]   
	stx	%i3,[%i3]   
	stx	%i4,[%i4]   
	stx	%i5,[%i5]   
	stx	%i6,[%i6]   
	stx	%i7,[%i7] 
	stx	%o0,[%o0]   
	stx	%o1,[%o1]   
	stx	%o2,[%o2]   
	stx	%o3,[%o3]   
	stx	%o4,[%o4]   
	stx	%o5,[%o5]   
	stx	%o6,[%o6]   
	stx	%o7,[%o7]

	nop; nop; nop; nop
	nop; nop; nop; nop

    	nop; nop; nop; nop
	nop; nop; nop; nop

    	nop; nop; nop; nop
	nop; nop; nop; nop

    	nop; nop; nop; nop
	nop; nop; nop; nop
    

	stx	%l1,[%l1]	    ! 3    
	stx	%l2,[%l2]   
	stx	%l3,[%l3]   
	stx	%l4,[%l4]   
	stx	%l5,[%l5]   
	stx	%l6,[%l6]   
	stx	%l7,[%l7]   
	stx	%i0,[%i0]   
	stx	%i1,[%i1]   
	stx	%i2,[%i2]   
	stx	%i3,[%i3]   
	stx	%i4,[%i4]   
	stx	%i5,[%i5]   
	stx	%i6,[%i6]   
	stx	%i7,[%i7] 
	stx	%o0,[%o0]   
	stx	%o1,[%o1]   
	stx	%o2,[%o2]   
	stx	%o3,[%o3]   
	stx	%o4,[%o4]   
	stx	%o5,[%o5]   
	stx	%o6,[%o6]   
	stx	%o7,[%o7]

	stx	%l1,[%l1]	    ! 4 
	stx	%l2,[%l2]   
	stx	%l3,[%l3]   
	stx	%l4,[%l4]   
	stx	%l5,[%l5]   
	stx	%l6,[%l6]   
	stx	%l7,[%l7]   
	stx	%i0,[%i0]   
	stx	%i1,[%i1]   
	stx	%i2,[%i2]   
	stx	%i3,[%i3]   
	stx	%i4,[%i4]   
	stx	%i5,[%i5]   
	stx	%i6,[%i6]   
	stx	%i7,[%i7] 
	stx	%o0,[%o0]   
	stx	%o1,[%o1]   
	stx	%o2,[%o2]   
	stx	%o3,[%o3]   
	stx	%o4,[%o4]   
	stx	%o5,[%o5]   
	stx	%o6,[%o6]   
	stx	%o7,[%o7]

	stx	%l1,[%l1]	    ! 5   
	stx	%l2,[%l2]   
	stx	%l3,[%l3]   
	stx	%l4,[%l4]   
	stx	%l5,[%l5]   
	stx	%l6,[%l6]   
	stx	%l7,[%l7]   
	stx	%i0,[%i0]   
	stx	%i1,[%i1]   
	stx	%i2,[%i2]   
	stx	%i3,[%i3]   
	stx	%i4,[%i4]   
	stx	%i5,[%i5]   
	stx	%i6,[%i6]   
	stx	%i7,[%i7] 
	stx	%o0,[%o0]   
	stx	%o1,[%o1]   
	stx	%o2,[%o2]   
	stx	%o3,[%o3]   
	stx	%o4,[%o4]   
	stx	%o5,[%o5]   
	stx	%o6,[%o6]   
	stx	%o7,[%o7]

    	nop; nop; nop; nop
	nop; nop; nop; nop

    	nop; nop; nop; nop
	nop; nop; nop; nop

    	nop; nop; nop; nop
	nop; nop; nop; nop

    	nop; nop; nop; nop
	nop; nop; nop; nop
    
	stx	%l1,[%l1]	    ! 6  
	stx	%l2,[%l2]   
	stx	%l3,[%l3]   
	stx	%l4,[%l4]   
	stx	%l5,[%l5]   
	stx	%l6,[%l6]   
	stx	%l7,[%l7]   
	stx	%i0,[%i0]   
	stx	%i1,[%i1]   
	stx	%i2,[%i2]   
	stx	%i3,[%i3]   
	stx	%i4,[%i4]   
	stx	%i5,[%i5]   
	stx	%i6,[%i6]   
	stx	%i7,[%i7] 
	stx	%o0,[%o0]   
	stx	%o1,[%o1]   
	stx	%o2,[%o2]   
	stx	%o3,[%o3]   
	stx	%o4,[%o4]   
	stx	%o5,[%o5]   
	stx	%o6,[%o6]   
	stx	%o7,[%o7]

	nop; nop; nop; nop
	nop; nop; nop; nop

    	nop; nop; nop; nop
	nop; nop; nop; nop

    	nop; nop; nop; nop
	nop; nop; nop; nop

    	nop; nop; nop; nop
	nop; nop; nop; nop    
	
	ldx	[%g1],%l0	    ! thread 0 writes to this addr to end test
	brnz	%l0,noise_loop
	nop
    
good_end:   
	ta	T_GOOD_TRAP
	nop
	nop    

!==========================    
.data
.align 0x1fff+1

target1:
	.word	0,0,0,0
.align 1024
target2:    
	.word	0,0,0,0
.align 1024
target3:    
	.word	0,0,0,0
.align 1024


stop_flag:  .word 0xffffffff, 0xffffffff 
float_data: .word 0x3fe80000, 0x12345678   	  	

!*************************************************

.data
.align 1024
.global target0_primary
target0_primary:  
	.word	0,0,0,0
.align 1024        


!*************************************************    

.data
.align 1024
.global target0_secondary
target0_secondary:  
	.word	0,0,0,0
.align 1024  
    
          
.end            
