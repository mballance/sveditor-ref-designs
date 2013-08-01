/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_QUEUE_CPU_MONDO_mode.s
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
	call	my_interrupt_code; \
	nop; \
	retry; \
	nop; 

#define H_HT0_Privileged_Action_0x37
#define My_HT0_Privileged_Action_0x37 \
	call	my_priv_action_trap_code; \
	nop; \
	done; \
	nop;

#define H_HT0_DAE_invalid_asi_0x14 my_H_T0_DAE_invalid_asi_0x14

#include "hboot.s"

#include "ncu_defines.h"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

	! Switch to user mode
user_mode:
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONPRIV

	! Read and write ASI_QUEUE_CPU_MONDO_HEAD/TAIL registers
	! Privileged Action traps expected.
user_read:
	setx	ASI_CPU_MONDO_QUEUE_HEAD, %g1, %g7
	setx	ASI_CPU_MONDO_QUEUE_TAIL, %g1, %g6
	ldxa	[%g7]ASI_QUEUE, %g0
	ldxa	[%g6]ASI_QUEUE, %g0
	stxa	%g0, [%g7]ASI_QUEUE
	stxa	%g0, [%g6]ASI_QUEUE
	membar	#Sync

	! Check for 4 Privileged Action traps.
user_trap_check:
	setx	priv_action_trap_flag, %g1, %g2
	ld	[%g2], %g5
	cmp	%g5, 4
	bne	test_failed
	nop

	! Go to supervisor mode for next interrupt
super_mode:
	ta	T_CHANGE_PRIV
	ta	T_CHANGE_NONHPRIV

	! Read and write ASI_QUEUE_CPU_MONDO_HEAD reg., expect no traps
super_head:
	setx	ASI_CPU_MONDO_QUEUE_HEAD, %g1, %g7
	ldxa	[%g7]ASI_QUEUE, %g5
	stxa	%g5, [%g7]ASI_QUEUE
	membar	#Sync

	! Check that no more traps occured.
super_head_trap_check:
	setx	priv_action_trap_flag, %g1, %g2
	ld	[%g2], %g5
	cmp	%g5, 4
	bne	test_failed
	nop
	
	! Read ASI_QUEUE_CPU_MONDO_TAIL reg.
	! Expect no trap.
super_tail_read:
	setx	ASI_CPU_MONDO_QUEUE_TAIL, %g1, %g6
	ldxa	[%g6]ASI_QUEUE, %g4
	membar	#Sync

	! Check that no trap occured.
super_tail_read_trap_check:
	setx	priv_action_trap_flag, %g1, %g2
	ld	[%g2], %g5
	cmp	%g5, 4
	bne	test_failed
	nop
	
	! Write ASI_QUEUE_CPU_MONDO_TAIL reg.
	! Expect a DAE_invalid_ASI trap
super_tail_write:
	setx	0x12345678, %g1, %g2
	setx	ASI_CPU_MONDO_QUEUE_TAIL, %g1, %g6
	stxa	%g2, [%g6]ASI_QUEUE
	membar	#Sync

	! Check that a DAE_invalid_trap trap occured.
super_tail_write_trap_check:
	setx	priv_action_trap_flag, %g1, %g2
	ld	[%g2], %g5
	cmp	%g5, 4
	bne	test_failed
	nop

	setx	dae_invalid_trap_count, %g1, %g2
	ld	[%g2], %g5
	cmp	%g5, 1
	bne	test_failed
	nop

	! Did the contents of ASI_CPU_MONDO_QUEUE_TAIL reg change?
super_change_check:
	setx	ASI_CPU_MONDO_QUEUE_TAIL, %g1, %g6
	ldxa	[%g6]ASI_QUEUE, %g5
	cmp	%g4, %g5
	bne	test_failed
	nop
	
	ba	test_passed
	nop


/**********************************************************************
   Trap handlers:
**********************************************************************/

.global	my_interrupt_code
.global	my_priv_action_trap_code
.global my_H_T0_DAE_invalid_asi_0x14


my_interrupt_code:
	! Clear the interrupt
	
	ldxa	[%g0]ASI_SWVR_INTR_R, %g0
	membar	#Sync

	! Indicate interrupt occured
	setx	user_data_start+16, %l1, %l2
	lda	[%l2]ASI_AS_IF_USER_PRIMARY, %l3
	inc	%l3
	sta	%l3, [%l2]ASI_AS_IF_USER_PRIMARY

	jmpl	%o7+0x8, %g0
	nop




my_priv_action_trap_code:

	setx	priv_action_trap_flag, %l1, %l2
	lda	[%l2]ASI_AS_IF_USER_PRIMARY, %l3
	add	%l3, 1, %l3
	sta	%l3, [%l2]ASI_AS_IF_USER_PRIMARY

	jmpl	%o7+0x8, %g0
	nop



my_H_T0_DAE_invalid_asi_0x14:
        ! Increment the count

        setx    dae_invalid_trap_count, %l1, %l2
        lda     [%l2]ASI_AS_IF_USER_PRIMARY, %l3
        add     %l3, 1, %l3
        sta     %l3, [%l2]ASI_AS_IF_USER_PRIMARY
        membar  #Sync

        done
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
	.word	0x0
	.word	0x0
dae_invalid_trap_count:
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
priv_action_trap_flag:
	.word	0x0
	.word	0x0
.end
