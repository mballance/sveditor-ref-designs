/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_1215ivtrap2.s
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
#define PORTABLE_CORE
		
#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_NUCLEUS_ALSO

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!Override trap handler definitions
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#include "asi_s.h" 

! Interrupt trap handler
! Compare ASI_SWVR_INTR_R with %l1 (TID)

#define H_HT0_Interrupt_0x60 
#define My_HT0_Interrupt_0x60 \
    ba trap_0x60_ext;\
    nop;nop;nop;nop;nop;nop;nop


#define THREAD_COUNT 8
#define THREAD_STRIDE 1
#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

    th_fork(main_t);

    EXIT_BAD

main_t_0:

    ! signal that thread has gotten here (started).
    mov     0xff,   %g2
    setx	user_data_start, %g1, %l7
    stb     %g2,    [%l7 + %o1]
    
    ! master waits for other threads to be ready
    setx	user_data_start, %g1, %l7
master_waiting: 
    ldx     [%l7], %g2
    cmp     %g2,    0xffffffffffffffff
    bne     master_waiting
    nop

    	
    ta T_CHANGE_HPRIV 

    rdpr %pstate, %g1
    wrpr %g1, 2, %pstate

park_threads:    
    ! Park all threads ..
    mov 1, %g1
    mov 0x50, %g2
    stxa %g1,[%g2]0x41

    ! Save %l2 = TID+1
    ! Save %l4 as expected receive vector
    !
    add %o1,1, %l2  
    mov 1, %g1
    sllx %g1, %l2, %l4

clear_intr_recv:
    stxa %g0, [%g0] ASI_SWVR_INTR_RECEIVE
    mov 7, %l1      ! TID

gen_next_intr:
    sllx %l1, 8, %l3        ! Send TID+1 as vector
    or %l3, %l1, %l3
    inc %l3

send_int:
    stxa %l3, [%g0] ASI_SWVR_INTR_W
    brnz %l1, gen_next_intr
    dec %l1

unpark_threads:
    ! Unpark all threads ..
    not %g0, %g1
    mov 0x50, %g2
    stxa %g1,[%g2]0x41

    rdpr %pstate, %g1
    wrpr %g1, 2, %pstate

    mov 1000, %g1
loop_wait_for_awhile:
    bnz loop_wait_for_awhile
    dec %g1

    EXIT_BAD

main_t_1:
main_t_2:
main_t_3:
main_t_4:
main_t_5:
main_t_6:
main_t_7:

    ! Save %l2 = TID+1
    ! Save %l4 as expected receive vector
    add %o1,1, %l2  
    mov 1, %g1
    sllx %g1, %l2, %l4

    ! signal that thread has gotten here (started).
    mov     0xff,   %g2
    setx	user_data_start, %g1, %l7
    stb     %g2,    [%l7 + %o1]
    
loop_wait_for_int:
    mov 0, %g1
    b loop_wait_for_int
    add %g1, 1, %g1
    

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.word 0xB52E8698
.end


SECTION .HTRAPS
.text

trap_0x60_ext:
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g1 ;\
    cmp %g1, %l4 ;\
    tne T_BAD_TRAP ;\
    ldxa    [%g0] ASI_SWVR_INTR_R, %g2 ;\
    cmp %g2, %l2 ;\
    tne T_BAD_TRAP ;\
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g1 ;\
    cmp %g1, %l4 ;\
    te T_BAD_TRAP ;\
    ta T_GOOD_TRAP; \
    nop;

