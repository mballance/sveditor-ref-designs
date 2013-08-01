/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_SWVR_INTR_R_mode.s
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

	! Determine thread running on

        ta      T_RD_THID
	cmp	%o1, 0
	be	main_t0			! Branch if thread 0
	nop

	ba	main_t1			! Branch if not thread 0
	nop

/************************************************************************
   Thread 0 code
 ************************************************************************/

	
	! Wait for thread one to be ready.
main_t0:
	setx	user_data_start, %g1, %g2
#ifdef DTM_ENABLED
	setx	800, %g1, %g3			! DTM wait count
#else
	setx	200, %g1, %g3			! wait count
#endif

t0_wait1_loop_top:
	lda	[%g2]ASI_AS_IF_USER_PRIMARY, %g7
	cmp	%g7, 1
	be	t0_wait1_loop_exit
	nop

	cmp	%g3, 0
	be	test_failed			! T1 never started
	dec	%g3
	ba	t0_wait1_loop_top
	nop

	! Reset the flag
t0_wait1_loop_exit:
	sta	%g0, [%g2]ASI_AS_IF_USER_PRIMARY
	
	! Send the first interrupt to T1
t0_send_first_intr:
	wr	%g0, INT_VEC_DIS, %asi
	set	0x100, %g3
	stxa	%g3, [%g0]%asi
	membar	#Sync

	! Wait for T1 to be ready

	setx	user_data_start, %g1, %g2
#ifdef DTM_ENABLED
	setx	800, %g1, %g3			! DTM wait count
#else
	setx	200, %g1, %g3			! wait count
#endif

t0_wait2_loop_top:
	lda	[%g2]ASI_AS_IF_USER_PRIMARY, %g7
	cmp	%g7, 1
	be	t0_wait2_loop_exit
	nop

	cmp	%g3, 0
	be	test_failed			! T1 never started
	dec	%g3
	ba	t0_wait2_loop_top
	nop

	! Reset the flag
t0_wait2_loop_exit:
	sta	%g0, [%g2]ASI_AS_IF_USER_PRIMARY
	
	! Send the second interrupt to T1
t0_send_sec_intr:
	wr	%g0, INT_VEC_DIS, %asi
	set	0x100, %g3
	stxa	%g3, [%g0]%asi
	membar	#Sync
t0_done:
	ba	test_passed
	nop


/************************************************************************
   Thread 1 code
 ************************************************************************/

	! Switch to user mode	
main_t1:
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONPRIV

	! Tell T0 we're ready
t1_ready1:
	setx	user_data_start, %g1, %g2
	set	1, %g3
	st	%g3, [%g2]

	! Wait for first interrupt
t1_intr1:
	add	%g2, 16, %g2
#ifdef DTM_ENABLED
	setx	800, %g1, %g4			! DTM wait count
#else
	setx	200, %g1, %g4			! wait count
#endif

t1_intr1_loop_top:
	ld	[%g2], %g7
	cmp	%g7, 1
	be	t1_intr1_loop_exit
	nop

	cmp	%g4, 0
	bge	t1_intr1_loop_top
	dec	%g4
	ba	test_failed		! interrupt did not occur
	nop

	! Reset flag
t1_intr1_loop_exit:
	setx	user_data_start, %g1, %g2
	st	%g0, [%g2]

	! Try to read ASI_INTR_R reg. should cause priviliged action trap
t1_read1:
	ldxa	[%g0]ASI_SWVR_INTR_R, %g6
	nop
	
	! Go to supervisor mode for next interrupt
t1_supr:	
	ta	T_CHANGE_PRIV
	ta	T_CHANGE_NONHPRIV
	
	! Signal T0 we're ready for next interrupt
	
	setx	user_data_start, %g1, %g2
	set	1, %g1
	st	%g1, [%g2]

	! Wait for second interrupt
t1_intr2:
	add	%g2, 16, %g2
#ifdef DTM_ENABLED
	setx	800, %g1, %g4			! DTM wait count
#else
	setx	200, %g1, %g4			! wait count
#endif

t1_intr2_loop_top:
	ld	[%g2], %g7
	cmp	%g7, 2
	be	t1_intr2_loop_exit
	nop

	cmp	%g4, 0
	bge	t1_intr2_loop_top
	dec	%g4
	ba	test_failed		! interrupt did not occur
	nop

	! Reset flag
t1_intr2_loop_exit:
	setx	user_data_start, %g1, %g2
	st	%g0, [%g2]

	! Try to read ASI_INTR_R reg. should cause DAE_invalid_ASI trap
t1_read2:
	ldxa	[%g0]ASI_SWVR_INTR_R, %g6
	nop
	
	! Have the two traps occured?
t1_trap_check:
	setx	t1_trap_flag, %g1, %g2
	ld	[%g2], %g5
	cmp	%g5, 2
	bne	test_failed
	nop

	! Signal T0 we're done.
t1_done:
	setx	user_data_start, %g1, %g2
	set	1, %g3
	st	%g3, [%g2]

	ba	test_passed
	nop


/**********************************************************************
   Trap handlers:
**********************************************************************/

.global	my_interrupt_code
.global	my_priv_action_trap_code
.global my_H_T0_Reserved_0x14


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

	setx	t1_trap_flag, %l1, %l2
	lda	[%l2]ASI_AS_IF_USER_PRIMARY, %l3
	add	%l3, 1, %l3
	sta	%l3, [%l2]ASI_AS_IF_USER_PRIMARY

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
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
t1_trap_flag:
	.word	0x0
	.word	0x0
.end
