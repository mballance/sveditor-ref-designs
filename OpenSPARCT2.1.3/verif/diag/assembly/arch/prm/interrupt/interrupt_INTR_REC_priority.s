/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_INTR_REC_priority.s
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

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:

	! Switch to hypervisor mode.

	ta	T_CHANGE_HPRIV
	nop

	! Turn off interrupts.
intr_off:
	rdpr	%pstate, %g1
	set	0x2, %g2
	andn	%g1, %g2,%g1
	wrpr	%g1, %g0, %pstate

	set	INT_VEC_DIS, %g2
	wr	%g0, %g2, %asi

	! Generate a cross thread interrupt to this thread, 0.
first_intr:	
#ifndef PORTABLE_CORE
	mov	5, %g3			! send to thread 0 vector number 5
#else
	ldxa    [%g0]ASI_INTR_ID, %o2	! get full thread ID
	sllx	%o2, 8, %g3
	or	%g3, 5, %g3		! send to this thread vector number 5
#endif
	stxa	%g3, [%g0]%asi
	membar	#Sync

	! Wait a bit

#ifdef DTM_ENABLED
	mov	32, %g4
#else
	mov	8, %g4
#endif

wait1:	cmp	%g4, 0
	bne	wait1
	sub	%g4, 1, %g4

	! Generate a 2nd cross thread interrupt to this thread, 0.
second_intr:
#ifndef PORTABLE_CORE
	mov	1, %g3			! send to thread 0 vector number 1
#else
	ldxa    [%g0]ASI_INTR_ID, %o2	! get full thread ID
	sllx	%o2, 8, %g3
	or	%g3, 1, %g3		! send to this thread vector number 1
#endif
	stxa	%g3, [%g0]%asi
	membar	#Sync

	! Wait a bit

#ifdef DTM_ENABLED
	mov	32, %g4
#else
	mov	8, %g4
#endif

wait2:	cmp	%g4, 0
	bne	wait2
	sub	%g4, 1, %g4

	! Generate a 3rd cross thread interrupt to this thread, 0.
third_intr:
#ifndef PORTABLE_CORE
	mov	7, %g3			! send to thread 0 vector number 7
#else
	ldxa    [%g0]ASI_INTR_ID, %o2	! get full thread ID
	sllx	%o2, 8, %g3
	or	%g3, 7, %g3		! send to this thread vector number 7
#endif
	stxa	%g3, [%g0]%asi
	membar	#Sync

	! Wait a bit

#ifdef DTM_ENABLED
	mov	80, %g4
#else
	mov	20, %g4
#endif


wait3:	cmp	%g4, 0
	bne	wait3
	sub	%g4, 1, %g4

	! Make sure no interrupts yet.
no_intr_check:	
	setx	my_trap_count, %g1, %g2
	ld	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! Turn on interrupts
intr_on:
	rdpr	%pstate, %g1
	set	0x2, %g2
	or	%g1, %g2,%g1
	wrpr	%g1, %g0, %pstate

	! Wait a bit more

#ifdef DTM_ENABLED
	mov	160, %g4
#else
	mov	40, %g4
#endif


wait4:	cmp	%g4, 0
	bne	wait4
	sub	%g4, 1, %g4

	! Did the expected 3 interrupts occur?
check_intr_count:	
	setx	my_trap_count, %g1, %g2
	ld	[%g2], %g3
	cmp	%g3, 3
	bne	test_failed
	nop

	ba	test_passed
	nop

/**********************************************************************
   Interrupt trap handler.
**********************************************************************/

.global	my_trap_code

my_trap_code:
	! Increment the count
	
	setx	my_trap_count, %g6, %g7
	ld	[%g7], %g5
	add	%g5, 1, %g5
	st	%g5, [%g7]
	membar	#Sync

	! Check the core interrupt receive.
trap0:	
	ldxa	[%g0]ASI_SWVR_INTR_RECEIVE, %g4
	cmp	%g5, 1
	be	trap1
	nop

	cmp	%g5, 2
	be	trap2
	nop

	set	0x2, %g3
	set	0x1, %g2
	mov	%g0, %g7
	ba	trap3
	nop
trap1:
	set	0x80, %g3
	set	0x7, %g2
	set	0x5, %g7
	ba	trap3
	nop
trap2:
	set	0x20, %g3
	set	0x5, %g2
	set	0x1, %g7
trap3:
	and	%g4, %g3, %g4
	cmp	%g4, %g3
	bne	test_failed
	nop

	! Clear the interrupt by a write to Interrupt Receive Reg.
trap4:
	orn	%g0, %g3, %g5		! bit = 0 for interrupt received
	stxa	%g5, [%g0]ASI_SWVR_INTR_RECEIVE
	membar	#Sync

	! Check that the interrupt was cleared.
trap5:
	ldxa	[%g0]ASI_SWVR_INTR_RECEIVE, %g4
	and	%g4, %g3, %g3
	cmp	%g3, 0
	bne	test_failed
	nop

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
my_trap_count:
	.word	0x0
	.word	0x0
.end



