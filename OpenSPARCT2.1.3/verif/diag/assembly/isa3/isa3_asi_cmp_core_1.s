/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_asi_cmp_core_1.s
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
    
#include "hboot.s"


!!!!!!!!!!!!!!!!!! assumes only 1 thread of core 0 running  !!!
#define CMP_CORE_RUNNING_STATUS_EXP %o1
#define CMP_CORE_AVAIL_EXP    0xff
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
#define ALL1S  0xffffffffffffffff

    
/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:

    
 	ta	T_CHANGE_HPRIV  ! run in Hpriv mode
 	nop
 	rdth_id ! get thread ID in %o1
!     cmp %o1, 0
!     bne wrong_thread ! only thread zero allowed!!!
    nop
        
!
! Thread Start
!
thread_0:

    !rdth_id ! get thread ID in %o1
    mov     1,  %o2
    sllx    %o2,    %o1,   %o1

    wr      %g0,    ASI_CMP_CORE,   %asi
    
    ! ASI_CMP_CORE_AVAIL:   set at foundry  
    ! RO
    ldxa    [%g0 + ASI_CMP_CORE_AVAIL] %asi,    %i0
    cmp     %i0,    CMP_CORE_AVAIL_EXP
!%i0 will hold expected value for many reads below    
    bne     test_failed
    mov      %g0,  %l0

enabled:        
    ! ASI_CMP_CORE_ENABLE_STATUS = core enabled
    ! RO
    ldxa    [%g0 + ASI_CMP_CORE_ENABLED] %asi,    %l0
    cmp     %l0,   %i0 !CMP_CORE_ENABLED_EXP
    bne     test_failed
    mov      %g0,  %l0
    
    ! ASI_CMP_CORE_ENABLE:    write to disable thread later after a reset.
    ! the reg value is moved to ASI_CMP_CORE_ENABLE_STATUS on next reset
    ! R/W
    ! must keep threads 0 & 4 enabled.
    ! non available threads will return 0.
    setx    0x5555555555555555,  %g1,    %l1
    stxa    %l1,    [%g0 + ASI_CMP_CORE_ENABLE] %asi
	ldxa    [%g0 + ASI_CMP_CORE_ENABLE] %asi,   %l0
    cmp     %l0,   %i0 ! non available threads will return 0, else ff
    bne     test_failed
    mov     %g0,  %l0
    mov     %g0,  %l1
    stxa    %l1,    [%g0 + ASI_CMP_CORE_ENABLE] %asi ! write 0
	ldxa    [%g0 + ASI_CMP_CORE_ENABLE] %asi,   %l0
    cmp     %l0,   %i0 ! cant self disable so will get ff 
    bne     test_failed
    mov      %g0,  %l0
    
running:        
    ! Bit mask of virtual cores that are 
    ! currently active. 1 = active
    ! avail & enable & running & !parked ???
    ! RO
    ldxa    [%g0 + ASI_CMP_CORE_RUNNING_STATUS] %asi,    %l0
    cmp     %l0,    CMP_CORE_RUNNING_STATUS_EXP
    bne     test_failed
    mov      %g0,  %l0

        
    ! Bit mask to control which virtual
    ! cores are running and which are 
    ! parked (r/w). 1= active
    ! R/W
    setx    ALL1S,  %g1,    %l1
    stxa    %l1,    [%g0 + ASI_CMP_CORE_RUNNING_RW] %asi
	ldxa    [%g0 + ASI_CMP_CORE_RUNNING_RW] %asi,   %l0
    cmp     %l0,   %i0
    bne     test_failed
    mov     %g0,  %l0
    mov     CMP_CORE_RUNNING_STATUS_EXP,  %l1
    stxa    %l1,    [%g0 + ASI_CMP_CORE_RUNNING_RW] %asi
	ldxa    [%g0 + ASI_CMP_CORE_RUNNING_RW] %asi,   %l0
    cmp     %l1,    %l0
    bne     test_failed
    mov     %g0,  %l0
	
parking:    
    ! Bit mask to control which virtual
    ! cores are running and which are 
    ! parked (r/w). 1= active
    ! W
    setx    ALL1S,  %g1,    %l1
    stxa    %l1,    [%g0 + ASI_CMP_CORE_RUNNING_W1S] %asi
    ldxa    [%g0 + ASI_CMP_CORE_RUNNING_RW] %asi,   %l0
    cmp     %l0,    %i0
    bne     test_failed
    mov     %g0,  %l0

    ! cant park all from >1 threads at once, results may not be predictable
    setx    ALL1S,  %g1,    %l1
    xor     %l1,    CMP_CORE_RUNNING_STATUS_EXP, %l1
    stxa    %l1,    [%g0 + ASI_CMP_CORE_RUNNING_W1C] %asi
	ldxa    [%g0 + ASI_CMP_CORE_RUNNING_RW] %asi,   %l0
    cmp     %l0,    CMP_CORE_RUNNING_STATUS_EXP
    bne     test_failed
    mov     %g0,  %l0
    
xir:    
    ! ASI_CMP_XIR_STEERING
    ! R/W
    setx    ALL1S,  %g1,    %l1
    stxa    %l1,    [%g0 + ASI_CMP_XIR_STEERING] %asi
	ldxa    [%g0 + ASI_CMP_XIR_STEERING] %asi,   %l0
    and     %l1, %i0, %l1
    cmp     %l0,    %i0 !CMP_CORE_ENABLED_EXP
    bne     test_failed
    mov     %g0,  %l0
    mov     %g0,  %l1
    stxa    %l1,    [%g0 + ASI_CMP_XIR_STEERING] %asi
	ldxa    [%g0 + ASI_CMP_XIR_STEERING] %asi,   %l0
    cmp     %l1,    %l0
    bne     test_failed
    mov     %g0,  %l0
    
	

test_passed:
	EXIT_GOOD

wrong_thread:
    nop
! $!E!V trig_pc_d(1, @VA(.MAIN.wrong_thread)) -> printf("This diag only runs on thread ZERO!")
    
test_failed:
    EXIT_BAD


    
    
/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.xword 0x0
.end


