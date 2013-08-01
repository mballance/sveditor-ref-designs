/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_INT_VEC_DIS_all2.s
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

	wr	%g0, INT_VEC_DIS, %asi

	! Generate a cross thread interrupt to this thread, 0.
label0:
#ifndef PORTABLE_CORE
	stxa	%g0, [%g0]%asi		! start with vector number 0
#else
	ldxa    [%g0]ASI_INTR_ID, %o2	! get full thread ID
	sllx	%o2, 8, %o2
	stxa	%o2, [%g0]%asi		! start with vector number 0
#endif
	membar	#Sync

	! Wait until interrupt occurs.
label1:
#ifdef DTM_ENABLED
	set	400, %g4		! g4 = timeout counter
#else
	setx	1600, %g1, %g4		! g4 = DTM timeout counter
#endif
	mov	%g0, %g3		! g3 = interrupt count
	setx	my_trap_count, %g1, %g2

wait_loop_top:
	ld	[%g2], %g1
	cmp	%g1, %g3
	be	wait_loop_bottom	! no interrupt yet
	nop

	! When an interrupt occurs, check if done enough
wait_loop_2:
	inc	%g3
	cmp	%g3, 32
	be	test_passed
	nop

	! Then kick off another interrupt, with new vector number
wait_loop_3:
#ifndef PORTABLE_CORE
	stxa	%g3, [%g0]%asi		! INT_VEC_DIS
#else
	or	%o2, %g3, %o3		! get the vector & thread to use
	stxa	%o3, [%g0]%asi		! INT_VEC_DIS
#endif
	ba	wait_loop_top
	nop

	! When no interrupt check for timeout
wait_loop_bottom:	
	cmp	%g4, 0
	be	test_failed
	nop
	ba	wait_loop_top
	dec	%g4


/**********************************************************************
   Interrupt trap handler.
**********************************************************************/

.global	my_trap_code

my_trap_code:
	! Increment the count
	
	setx	my_trap_count, %g6, %g7
	ld	[%g7], %g5
	add	%g5, 1, %g6
	st	%g6, [%g7]
	membar	#Sync

	! Check the core interrupt receive and incoming vector registers.

	ldxa	[%g0]ASI_SWVR_INTR_RECEIVE, %g4
	set	1, %g7
	sllx	%g7, %g5, %g7
	cmp	%g4, %g7		! vector bit # should = old trap count
	bne	test_failed
	nop

	! Clear the interrupt

	ldxa	[%g0]ASI_SWVR_INTR_R, %g3
	cmp	%g3, %g5		! vector # should = old trap count
	bne	test_failed
	nop

	ldxa	[%g0]ASI_SWVR_INTR_RECEIVE, %g4
	cmp	%g4, 0			! now should be 0
	bne	test_failed
	nop

	ldxa	[%g0]ASI_SWVR_INTR_R, %g3
	cmp	%g3, 0x0		! should also now be 0
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



