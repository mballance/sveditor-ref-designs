/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_INT_VEC_DIS_all.s
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
#include "ncu_defines.h"
#include "asi_s.h"
#include "cmp_macros.h"


/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
	! Switch to hypervisor mode.

	ta	T_CHANGE_HPRIV
	nop

	wr	%g0, INT_VEC_DIS, %asi

	! Initialize the global registers.
	mov	%g0, %g1	
	mov	%g0, %g2
	mov	%g0, %g3
	mov	%g0, %g4
	mov	%g0, %g5
	mov	%g0, %g6
	mov	%g0, %g7

	ta	T_RD_THID
	mov	%o1, %g6		! %o1, %g6 = thread ID
	set	8, %l7
	umul	%g6, %l7, %l7
	setx	user_data_start, %g1, %g3
	add	%l7, %g3, %g7		! %g7 = pointer to thread's data area

	cmp	%g6, 0x0
	be	main_t0			! branch if tread 0
	nop
	ba	main_t1_to_t63		! branch if not thread 0
	nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! Thread 0 Start Here
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        ! Sync up all the treads.

main_t0:
#ifndef PORTABLE_CORE
        SYNC_THREAD_MAIN( test_failed, %g1, %g2, %g3 )

	! For each of the 64 threads generate an interrupt to that thread

	mov	%g0, %l7		! destination thread number

t0_send_loop_top:
	sllx	%l7, 8, %l6		! send interrupt with vector number
	or	%l6, %l7, %l6		! set to destination thread number
	stxa	%l6, [%g0]%asi
	membar	#Sync

	cmp	%l7, 63
	blt	t0_send_loop_top
	add	%l7, 1, %l7		! increment destination thread number
	
	! Wait until interrupt occurs in this thread, 0.
t0_1:
	set	4000, %l4		! l4 = timeout counter
	mov	%g7, %l2		! l2 = interrupt count

t0_wait_loop_top:
	cmp	%l4, 0
	be	test_failed		! branch if no interrupt occured
	add	%l4, -1, %l4		! decrement wait count

	ld	[%l2], %l1
	cmp	%l1, 1
	bne	t0_wait_loop_top
	nop

	! Done
t0_2:	
	ba	test_passed
	nop
#else
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Core portable version for thread 0
!	Needs run arg  -midas_args=-DSYNC_THREADS
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	! Generate an interrupt to each thread in this core

	ldxa    [%g0]ASI_INTR_ID, %l7	! get full thread ID

t0_send_loop_top:
	sllx	%l7, 8, %l6		! send interrupt with vector number
	or	%l6, %l7, %l6		! set to destination thread number
	stxa	%l6, [%g0]%asi
	membar	#Sync

	and	%l7, 7, %l5
	cmp	%l5, 7
	blt	t0_send_loop_top
	add	%l7, 1, %l7		! increment destination thread number
	
	! Wait until interrupt occurs in this thread, 0.
t0_1:
	set	4000, %l4		! l4 = timeout counter
	mov	%g7, %l2		! l2 = interrupt count

t0_wait_loop_top:
	cmp	%l4, 0
	be	test_failed		! branch if no interrupt occured
	add	%l4, -1, %l4		! decrement wait count

	ld	[%l2], %l1
	cmp	%l1, 1
	bne	t0_wait_loop_top
	nop

	! Done
t0_2:	
	ba	test_passed
	nop
#endif

	
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! All Threads Except 0 Start Here
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

main_t1_to_t63:
#ifndef PORTABLE_CORE
	! Sync up all the treads.
	
        SYNC_THREAD_OTHER( %g6,%g1,%g2 )
#endif

	! Wait for interrupt to arrive to this thread.

	setx	8000, %i6, %i5		! i5 = timeout counter
	mov	%g7, %i2		! i2 = interrupt count address

wait_loop_top:
	cmp	%i5, 0
	be	test_failed		! branch if no interrupt occured
	add	%i5, -1, %i5

	ld	[%i2], %i1
	cmp	%i1, 1
	bne	wait_loop_top
	nop

	! Done
finished:
	ba	test_passed
	nop

/**********************************************************************
   Interrupt trap handler.  Same interrupt handler for all threads.
**********************************************************************/

.global	my_trap_code

my_trap_code:

	! Get the thread ID & find data area

#ifndef PORTABLE_CORE
	ta	T_RD_THID			! %o1 = thread id
#else
	ldxa    [%g0]ASI_INTR_ID, %o2		! get full thread ID
#endif
	set	8, %l0
	umul	%o1, %l0, %l1
	setx	user_data_start, %l2, %l3
	add	%l3, %l1, %l6
	
	! Increment the interrupt count
trap1:
	ld	[%l6], %g5
	add	%g5, 1, %g5
	st	%g5, [%l6]
	membar	#Sync

	! Check the core interrupt receive and incoming vector registers.
trap2:
	ldxa	[%g0]ASI_SWVR_INTR_RECEIVE, %g4
	set	1, %g1
#ifndef PORTABLE_CORE
	sllx	%g1, %o1, %g1
#else
	sllx	%g1, %o2, %g1
#endif	
	cmp	%g4, %g1		! vector bit # should = thread ID
	bne	test_failed
	nop

	! Clear the interrupt
trap3:
	ldxa	[%g0]ASI_SWVR_INTR_R, %g3

#ifndef PORTABLE_CORE
	cmp	%g3, %o1		! vector # should = thread ID
#else
	cmp	%g3, %o2		! vector # should = thread ID
#endif
	bne	test_failed
	nop
trap4:
	ldxa	[%g0]ASI_SWVR_INTR_RECEIVE, %g4
	cmp	%g4, 0			! now should be 0
	bne	test_failed
	nop
trap5:
	ldxa	[%g0]ASI_SWVR_INTR_R, %g3
	cmp	%g3, 0x0		! should also now be 0
	bne	test_failed
	nop
trap6:
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
	.word	0x0	! Thread 0 interrupt count
	.word	0x0
	.word	0x0	! Thread 1 interrupt count
	.word	0x0
	.word	0x0	! etc. ...
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
.end




