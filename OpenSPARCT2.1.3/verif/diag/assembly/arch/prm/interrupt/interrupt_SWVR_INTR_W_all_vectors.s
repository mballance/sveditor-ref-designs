/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_SWVR_INTR_W_all_vectors.s
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

        ! Generate 64 interrupts using all possible vector values.
gen_intr:
	set	63, %g3			! %g3 = vector value

	! Generate a cross thread interrupt to each thread.
send_loop_top:
	stxa	%g3, [%g0]ASI_SWVR_UDB_INTR_W	! send an interrupt
	membar	#Sync

        cmp     %g3, 0
        bgt     send_loop_top
        sub     %g3, 1, %g3             ! decrement vector value

	! Wait a bit

#ifdef DTM_ENABLED
	setx	0x140, %g1, %g4
#else
	setx	0x50, %g1, %g4
#endif

wait:
	cmp	%g4, 0
	bne	wait
	sub	%g4, 1, %g4

	! Check to see if 64 interrupts have occured.
intr_check:
	setx	user_data_start, %g1, %g2
	ld	[%g2], %g3
	cmp	%g3, 64
	bne	test_failed
	nop

        ! Done
finished:
        ba      test_passed
        nop


/**********************************************************************
   Interrupt trap handler.
**********************************************************************/

.global	my_trap_code

my_trap_code:

        ! Get interrupt count

        setx    user_data_start, %l2, %l6

	! Increment the count
Trap1:	
	ld	[%l6], %g5
	add	%g5, 1, %g5
	st	%g5, [%l6]
	membar	#Sync

	! Check the interupt value
Trap2:
	setx	interrupt_value, %l2, %l3
	ld	[%l3], %l4
	set	1, %l0
	sllx	%l0, %l4, %l0

	ldxa	[%g0]ASI_INTR_RECEIVE, %l7
	and	%l7, %l0, %l7
	cmp	%l7, %l0
	bne	test_failed
	nop

	! Clear the interrupt and check the interrupt value
Trap3:
	ldxa	[%g0]ASI_SWVR_INTR_R, %l5
	cmp	%l5, %l4
	bne	test_failed
	nop

	! Save the next expected vector value
Trap4:
	sub	%l4, 1, %l4
	st	%l4, [%l3]

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
        .word   0x0
        .word   0x0
interrupt_value:
	.word	63
	.word	0x0
.end



