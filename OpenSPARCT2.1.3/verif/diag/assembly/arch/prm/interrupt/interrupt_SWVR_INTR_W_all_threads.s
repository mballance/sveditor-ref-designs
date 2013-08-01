/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_SWVR_INTR_W_all_threads.s
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

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
	call	my_trap_code; \
	nop; \
	retry; \
	nop; 

#include "hboot.s"
#include "asi_s.h"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:

	! Switch to hypervisor mode.

	ta	T_CHANGE_HPRIV
	nop

        ! Initialize the global registers.
        mov     %g0, %g1
        mov     %g0, %g2
        mov     %g0, %g3
        mov     %g0, %g4
        mov     %g0, %g5
        mov     %g0, %g6
        mov     %g0, %g7

        ta      T_RD_THID
        mov     %o1, %g6                ! %o1, %g6 = thread ID
        set     8, %l7
        umul    %g6, %l7, %l7
        setx    user_data_start, %g1, %g3
        add     %l7, %g3, %g7           ! %g7 = pointer to thread's data area

        cmp     %g6, 0x0
        be      main_t0                 ! branch if tread 0
        nop
        ba      main_t1_to_t63          ! branch if not thread 0
        nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! Thread 0 Start Here
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#ifndef PORTABLE_CORE

        ! For each of the 64 threads generate an interrupt to that thread
main_t0:
	set	63, %g3			! %g3 = destination thread number
	sllx	%g3, 8, %g3
	set	0x100, %g4

	! Generate a cross thread interrupt to each thread.
t0_send_loop_top:
	stxa	%g3, [%g0]ASI_SWVR_UDB_INTR_W	! send an interrupt
	membar	#Sync

        cmp     %g3, 0
        bgt     t0_send_loop_top
        sub     %g3, %g4, %g3             ! decrement destination thread number

#else		/* ifndef PORTABLE_CORE */

	! For each thread in this core generate an interrupt to it
main_t0:
	
	ldxa    [%g0]ASI_INTR_ID, %o2		! get full thread ID
	or	%o2, 7, %g3			! g3 = destination thread ID
	sllx	%g3, 8, %g3
	set	0x100, %g4

	! Loop to generate the interrupts
t0_send_loop_top:
	stxa	%g3, [%g0]ASI_SWVR_UDB_INTR_W	! send an interrupt
	membar	#Sync

	and	%g3, 0x700, %g5
        cmp     %g5, 0
        bgt     t0_send_loop_top
        sub     %g3, %g4, %g3             ! decrement destination thread number

#endif		/* ifndef PORTABLE_CORE */

	! Wait a bit

	mov	20, %g4

t0_wait:
	cmp	%g4, 0
	bne	t0_wait
	sub	%g4, 1, %g4

        ! Wait until interrupt occurs in this thread, 0.
t0_1:
        set     4000, %l4               ! l4 = timeout counter
        mov     %g7, %l2                ! l2 = interrupt count

t0_wait_loop_top:
        cmp     %l4, 0
        be      test_failed             ! branch if no interrupt occured
        add     %l4, -1, %l4            ! decrement wait count

        ld      [%l2], %l1
        cmp     %l1, 1
        bne     t0_wait_loop_top
        nop

        ! Done
t0_2:
        ba      test_passed
        nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! All Threads Except 0 Start Here
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        ! Wait for interrup to arrive to this thread.

main_t1_to_t63:

        setx    8000, %i6, %i5          ! i5 = timeout counter
        mov     %g7, %i2                ! i2 = interrupt count address

wait_loop_top:
        cmp     %i5, 0
        be      test_failed             ! branch if no interrupt occured
        add     %i5, -1, %i5

        ld      [%i2], %i1
        cmp     %i1, 1
        bne     wait_loop_top
        nop

        ! Done
finished:
        ba      test_passed
        nop

/**********************************************************************
   Interrupt trap handler.  Same interrupt handler for all threads.
**********************************************************************/

.global	my_trap_code

my_trap_code:

        ! Get the thread ID & find data area

        ta      T_RD_THID                       ! %o1 = thread id
        set     8, %l0
        umul    %o1, %l0, %l1
        setx    user_data_start, %l2, %l3
        add     %l3, %l1, %l6


	! Increment the count
Trap1:	
	ld	[%l6], %g5
	add	%g5, 1, %g5
	st	%g5, [%l6]
	membar	#Sync

	! Clear the interrupt
Trap2:
	ldxa	[%g0]ASI_SWVR_INTR_R, %g3

	jmpl	%o7+0x8, %g0
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
        .word   0x0     ! Thread 0 interrupt count
        .word   0x0
        .word   0x0     ! Thread 1 interrupt count
        .word   0x0
        .word   0x0     ! etc. ...
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
        .word   0x0
.end



