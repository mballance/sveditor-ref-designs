/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: traps_34_35_36.s
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
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO
!#include "nmacros.h"

#define MY_GENERIC_TRAP \
    rdpr    %tl, %l6; \
    rdpr    %tt, %l5; \
    rd      %pc, %l4; \
    inc     %l3; \
	done; \
    nop; \  
    nop; \
    nop;


! these should go to Hpriv table ???
#define  H_HT0_Mem_Address_Not_Aligned_0x34
#define My_HT0_Mem_Address_Not_Aligned_0x34 MY_GENERIC_TRAP	

#define  H_HT0_Lddf_Mem_Address_Not_Aligned_0x35
#define My_HT0_Lddf_Mem_Address_Not_Aligned_0x35 MY_GENERIC_TRAP
    
#define  H_HT0_Stdf_Mem_Address_Not_Aligned_0x36
#define My_HT0_Stdf_Mem_Address_Not_Aligned_0x36 MY_GENERIC_TRAP
    
#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:

!  	ta	T_CHANGE_PRIV  ! run in priv mode
!  	nop

! 	rdth_id ! get thread ID in %o1
! 	umul	%o1, 256, %l7
! 	setx	user_data_start, %g1, %g3
! 	add 	%l7, %g3, %l7

single_thread:
    ba thread_0
    
! thread_dispatch:
! 	cmp %o1, 0x0
! 	be thread_0
! 	nop
! 	cmp %o1, 0x1
! 	be thread_1
! 	nop
! 	cmp %o1, 0x2
! 	be thread_2
! 	nop
! 	cmp %o1, 0x3
! 	be thread_3
! 	nop
! 	cmp %o1, 0x4
! 	be thread_4
! 	nop
! 	cmp %o1, 0x5
! 	be thread_5
! 	nop
! 	cmp %o1, 0x6
! 	be thread_6
! 	nop
! 	cmp %o1, 0x7
! 	be thread_7
	
! ! !  	nop
! ! ! 	EXIT_GOOD

	
    
!
! Thread 0 Start
!
thread_0:
	

theRealStuff:        
	!# Execute Main Diag ..

    
    ! table address
    setx    HV_TRAP_BASE_PA,    %i1,    %i7
    srlx    %i7,    13,     %i4 ! HV_TRAP_BASE
    setx    TRAP_BASE_VA,   %i1,    %i7
    srlx    %i7,    13,     %i5 ! TRAP_BASE

    ! trap counter
    mov     0,      %o6

    ! data addr	
    setx    user_data_start,    %g1,    %i2
    srlx    %i2,    0x3,    %i2   ! insure DW alignment
    sllx    %i2,    0x3,    %i2   ! insure DW alignment
    
Mem_Address:    
    ! %l5 = Mem_Address_Not_Aligned_0x34
    ldx     [%i2 + 3], %o0
    cmp     %l6,    0x1 !level
    bne     test_failed
    mov     0,      %l6
    cmp     %l5,    0x34 !type
    bne     test_failed
    mov     0,      %l5	
    srlx    %l4,    13, %g3 ! table address
	cmp     %g3,    %i4     ! correct table?
    bne     test_failed
	mov     0,      %l4
    inc     %o6


Lddf_Mem_Address:       
    ! %l5 = Lddf_Mem_Address_Not_Aligned_0x35
    ldd     [%i2 + 4], %f0
    cmp     %l6,    0x1 !level
    bne     test_failed
    mov     0,      %l6	
    cmp     %l5,    0x35 !type
    bne     test_failed
	mov     0,      %l5	
    srlx    %l4,    13, %g3 ! table address
	cmp     %g3,    %i4     ! correct table?
    bne     test_failed
    mov     0,      %l4
    inc     %o6


Stdf_Mem_Address:       
    ! %l5 = Stdf_Mem_Address_Not_Aligned_0x36
    std     %f0,    [%i2 + 4]
    cmp     %l6,    0x1 !level
    bne     test_failed
    mov     0,      %l6
    cmp     %l5,    0x36 !type
    bne     test_failed
	mov     0,      %l5	
    srlx    %l4,    13, %g3 ! table address
	cmp     %g3,    %i4     ! correct table?
    bne     test_failed
    mov     0,      %l4
    inc     %o6

            
    
    ! check final trap count, overkill...
    cmp %o6,    %l3
    bne test_failed
    nop
    
test_passed:
	EXIT_GOOD

test_failed:
    EXIT_BAD



/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.xword 0xDEADBEEFDEADBEEF
.xword 0x1111111122222222
.xword 0x3333333344444444
.xword 0x55555555
.end



