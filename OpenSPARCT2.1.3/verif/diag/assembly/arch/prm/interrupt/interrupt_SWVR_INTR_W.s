/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_SWVR_INTR_W.s
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

	! Generate a cross thread interrupt to this thread, 0.

	mov	5, %g3			! send to thread 0 vector number 5
	stxa	%g3, [%g0]ASI_SWVR_UDB_INTR_W
	membar	#Sync

	! Wait a bit

	mov	20, %g4

wait:	cmp	%g4, 0
	bne	wait
	sub	%g4, 1, %g4

	! Did the expected interrupt occur?  Expect 1 interrupt trap.

	setx	my_trap_count, %g1, %g2
	ld	[%g2], %g3
	cmp	%g3, 1
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

	! Check the core interrupt receive and incoming vector registers.

	ldxa	[%g0]ASI_SWVR_INTR_RECEIVE, %g4
	cmp	%g4, 0x20		! should be vector number 5
	bne	test_failed
	nop

	! Clear the interrupt

	ldxa	[%g0]ASI_SWVR_INTR_R, %g3
	cmp	%g3, 0x5		! should be vector number 5
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



