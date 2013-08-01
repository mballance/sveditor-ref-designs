/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_mondo_intr_all_threads.s
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
#define HBOOT_HV_ONLY
#define ENABLE_PCIE_LINK_TRAINING

#define ENABLE_INTR0x60 1

#define INTR0x60_EVENT_QUEUE_BASE event_queue_base
#define INTR0x60_MSI_START_ADDRESS 0x0

!#define INTR0x60_MONDO_IV 63
!#define INTR0x60_MSI_0_NUM 0
!#define INTR0x60_MSI_0_EQN 0
!/* Event Queue 0 == Mondo 24 */
!#define INTR0x60_MONDO_24_V 1
!#define INTR0x60_MONDO_24_THREAD 0
!#define INTR0x60_MONDO_24_CNTRL 0

#define INTR0x60_MONDO_IV 49
#define INTR0x60_MONDO_50_V 1
#define INTR0x60_MONDO_50_MODE 1
#define INTR0x60_MONDO_50_THREAD 0
#define INTR0x60_MONDO_50_CNTRL 2
#define INTR0x60_MSI_0_NUM 243
#define INTR0x60_MSI_0_EQN 26

/* Increment the thread to send the next interrupt to. */
#define INTR0x60_MSI_EXTRA_HANDLER_WHILE_EQ_DISABLED \
	best_set_reg(mpeval(PCI_E_INT_MAP_ADDR \
                            +PCI_E_INT_MAP_STEP*(INTR0x60_MSI_0_EQN+4)), \
                 %g7, %g5); \
	setx	0x2000000, %g7, %g4; \
	ldx	[%g5], %g6; \
	addx	%g6, %g4, %g6; \
	stx	%g6, [%g5]; \
	membar	#Sync

/* Get the thread id and calculate the address for this thread in user_data.
 * Has interrupt to this thread already occured?
 * Record the interrupt as done. */
#ifdef PORTABLE_CORE
#define MASK_THREAD_ID and %g1, 0x7, %g1;
#else
#define MASK_THREAD_ID /*nothing*/
#endif /* PORTABLE_CORE */
#define INTR0x60_MSI_EXTRA_HANDLER \
        MASK_THREAD_ID \
        sllx    %g1, 3, %g4; \
        setx    user_data_start, %g7, %g5; \
        add     %g4, %g5, %g4; \
	ldx	[%g4], %g5; \
	brz	%g5, msi_extra_handler_continue; \
	set	1, %g6; \
	EXIT_BAD; \
    msi_extra_handler_continue:\
	stx	%g6, [%g4]


#include "interrupt0x60_defines.h"

#include "hboot.s"
#include "cmp_macros.h"

#include "interrupt0x60_handler.s"

/************************************************************************
   Test case code start
 ************************************************************************/
SECTION .MAIN
.text
.global main

main:
        rdpr    %pstate, %g7
        or      %g7, 0x2, %g7           ! Set interrupt enable
        wrpr    %g7, %pstate

        ta      T_RD_THID
        mov     %o1, %g6                ! %o1, %g6 = thread ID
        set     8, %l7
        umul    %g6, %l7, %l7
        setx    user_data_start, %g1, %g3
        add     %l7, %g3, %g7           ! %g7 = pointer to thread's data area

	stx	%g0, [%g7]		! Clear this thread's interrupt count
	membar	#Sync

        cmp     %g6, 0x0
        be      main_t0                 ! branch if thread 0
        nop
        ba      main_t1_to_t63          ! branch if not thread 0
        nop


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! Thread 0 Start Here
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

main_t0:
/*      Initialize the NCU for the interrupt.   */

        /* Sync up all the threads. */

sync_t0:
#ifndef PORTABLE_CORE

        SYNC_THREAD_MAIN( local_test_failed, %g1, %g2, %g3 )
#else
        cmp_sync_threads
#endif


        /* Kick off first interrupt, trap handler kicks off rest */

first_mondo_intr:
	! user event to generate MSI msg.
	nop         ! $EV trig_pc_d(1, @VA(.MAIN.first_mondo_intr)) -> EnablePCIeIgCmd ("MSI32", eval(INTR0x60_MSI_0_NUM, 16), 0, 4, 1, *, 1 )

	/* Wait for interrupt to occur. */

intr_wait:
#ifdef DTM_ENABLED
	setx	0x400, %g1, %g2		! DTM timeout count
#else
	setx	0x100, %g1, %g2		! timeout count
#endif

intr_wait_loop_top:
	ldx	[%g7], %g5
	cmp	%g5, 1
	be	t0_next_mondo
	dec	%g2

	cmp	%g2, 0
	bne	intr_wait_loop_top
	nop
	ba	local_test_failed
	nop

	! Kick off next interrupt to next thread.

t0_next_mondo:
	ldx	[%g7], %g0		! Wait for last store
t0_mondo_gen:
	nop         ! $EV trig_pc_d(1, @VA(.MAIN.t0_mondo_gen)) -> EnablePCIeIgCmd ("MSI32", eval(INTR0x60_MSI_0_NUM, 16), 0, 4, 1, *, 1 )

	!Done
t0_done:	
	ba	test_passed
	nop


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! All Threads Except 0 Start Here
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


main_t1_to_t63:
#ifndef PORTABLE_CORE

        SYNC_THREAD_OTHER( %g6,%g1,%g2 )
#else
        cmp_sync_threads
#endif

	/* Wait for interrupt to occur. */

t1_t63_intr_wait:
#ifdef DTM_ENABLED
	setx	0x400, %g1, %g2		! DTM timeout count
#else
	setx	0x100, %g1, %g2		! timeout count
#endif
	mulx	%g2, %g6, %g2		! Multiply by thread number

t1_t63_intr_wait_loop_top:
	ldx	[%g7], %g5
	cmp	%g5, 1
	be	t1_t63_next_mondo
	dec	%g2

	cmp	%g2, 0
	bne	t1_t63_intr_wait_loop_top
	nop
	ba	local_test_failed
	nop
	
	! Kick off next interrupt to next thread.

t1_t63_next_mondo:
	ldx	[%g7], %g0		! Wait for last store
t1_t63_mondo_gen:
	nop         ! $EV trig_pc_d(1, @VA(.MAIN.t1_t63_mondo_gen)) -> EnablePCIeIgCmd ("MSI32", eval(INTR0x60_MSI_0_NUM, 16), 0, 4, 1, *, 1 )

	!Done
t1_t63_done:	
	ba	test_passed
	nop

	
test_passed:
	EXIT_GOOD

local_test_failed:
	EXIT_BAD




/************************************************************************
   Test case data start
************************************************************************/

.align  1024
.data
.global user_data_start
user_data_start:
        .word   0xffffffff
        .word   0xffffffff
        .word   0xffffffff
        .word   0xffffffff

.align	eval(512*1024)
.global event_queue_base
event_queue_base:
	.skip	1024
user_data_end:
.end

/************************************************************************/
