/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_dmu_cntrl_stall2.s
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

#define INTR0x60_MONDO_IV 7

#ifdef SELECT_EQ_GROUP_1
	
#define INTR0x60_MSI_0_NUM       1
#define INTR0x60_MSI_0_EQN      1
#define INTR0x60_MONDO_25_V      1
#define INTR0x60_MONDO_25_MODE   1
#define INTR0x60_MONDO_25_THREAD 0
#define INTR0x60_MONDO_25_CNTRL  0

#define INTR0x60_MSI_1_NUM       2
#define INTR0x60_MSI_1_EQN       2
#define INTR0x60_MONDO_26_V      1
#define INTR0x60_MONDO_26_MODE   1
#define INTR0x60_MONDO_26_THREAD 0
#define INTR0x60_MONDO_26_CNTRL  0

#define INTR0x60_MSI_2_NUM       4
#define INTR0x60_MSI_2_EQN       3
#define INTR0x60_MONDO_27_V      1
#define INTR0x60_MONDO_27_MODE   1
#define INTR0x60_MONDO_27_THREAD 1
#define INTR0x60_MONDO_27_CNTRL  1

#define INTR0x60_MSI_3_NUM       8
#define INTR0x60_MSI_3_EQN       4
#define INTR0x60_MONDO_28_V      1
#define INTR0x60_MONDO_28_MODE   1
#define INTR0x60_MONDO_28_THREAD 2
#define INTR0x60_MONDO_28_CNTRL  2

#define INTR0x60_MSI_4_NUM      16
#define INTR0x60_MSI_4_EQN       5
#define INTR0x60_MONDO_29_V      1
#define INTR0x60_MONDO_29_MODE   1
#define INTR0x60_MONDO_29_THREAD 3
#define INTR0x60_MONDO_29_CNTRL  3

#else
#ifdef SELECT_EQ_GROUP_2

#define INTR0x60_MSI_0_NUM       1
#define INTR0x60_MSI_0_EQN       6
#define INTR0x60_MONDO_30_V      1
#define INTR0x60_MONDO_30_MODE   1
#define INTR0x60_MONDO_30_THREAD 0
#define INTR0x60_MONDO_30_CNTRL  0

#define INTR0x60_MSI_1_NUM       2
#define INTR0x60_MSI_1_EQN       7
#define INTR0x60_MONDO_31_V      1
#define INTR0x60_MONDO_31_MODE   1
#define INTR0x60_MONDO_31_THREAD 0
#define INTR0x60_MONDO_31_CNTRL  0

#define INTR0x60_MSI_2_NUM       4
#define INTR0x60_MSI_2_EQN       8
#define INTR0x60_MONDO_32_V      1
#define INTR0x60_MONDO_32_MODE   1
#define INTR0x60_MONDO_32_THREAD 1
#define INTR0x60_MONDO_32_CNTRL  1

#define INTR0x60_MSI_3_NUM       8
#define INTR0x60_MSI_3_EQN       9
#define INTR0x60_MONDO_33_V      1
#define INTR0x60_MONDO_33_MODE   1
#define INTR0x60_MONDO_33_THREAD 2
#define INTR0x60_MONDO_33_CNTRL  2

#define INTR0x60_MSI_4_NUM      16
#define INTR0x60_MSI_4_EQN       10
#define INTR0x60_MONDO_34_V      1
#define INTR0x60_MONDO_34_MODE   1
#define INTR0x60_MONDO_34_THREAD 3
#define INTR0x60_MONDO_34_CNTRL  3

#else
#ifdef SELECT_EQ_GROUP_3
	
#define INTR0x60_MSI_0_NUM       1
#define INTR0x60_MSI_0_EQN       11
#define INTR0x60_MONDO_35_V      1
#define INTR0x60_MONDO_35_MODE   1
#define INTR0x60_MONDO_35_THREAD 0
#define INTR0x60_MONDO_35_CNTRL  0

#define INTR0x60_MSI_1_NUM       2
#define INTR0x60_MSI_1_EQN       12
#define INTR0x60_MONDO_36_V      1
#define INTR0x60_MONDO_36_MODE   1
#define INTR0x60_MONDO_36_THREAD 0
#define INTR0x60_MONDO_36_CNTRL  0

#define INTR0x60_MSI_2_NUM       4
#define INTR0x60_MSI_2_EQN       13
#define INTR0x60_MONDO_37_V      1
#define INTR0x60_MONDO_37_MODE   1
#define INTR0x60_MONDO_37_THREAD 1
#define INTR0x60_MONDO_37_CNTRL  1

#define INTR0x60_MSI_3_NUM       8
#define INTR0x60_MSI_3_EQN       14
#define INTR0x60_MONDO_38_V      1
#define INTR0x60_MONDO_38_MODE   1
#define INTR0x60_MONDO_38_THREAD 2
#define INTR0x60_MONDO_38_CNTRL  2

#define INTR0x60_MSI_4_NUM      16
#define INTR0x60_MSI_4_EQN       15
#define INTR0x60_MONDO_39_V      1
#define INTR0x60_MONDO_39_MODE   1
#define INTR0x60_MONDO_39_THREAD 3
#define INTR0x60_MONDO_39_CNTRL  3

#else
#ifdef SELECT_EQ_GROUP_4
	
#define INTR0x60_MSI_0_NUM       1
#define INTR0x60_MSI_0_EQN       16
#define INTR0x60_MONDO_40_V      1
#define INTR0x60_MONDO_40_MODE   1
#define INTR0x60_MONDO_40_THREAD 0
#define INTR0x60_MONDO_40_CNTRL  0

#define INTR0x60_MSI_1_NUM       2
#define INTR0x60_MSI_1_EQN       17
#define INTR0x60_MONDO_41_V      1
#define INTR0x60_MONDO_41_MODE   1
#define INTR0x60_MONDO_41_THREAD 0
#define INTR0x60_MONDO_41_CNTRL  0

#define INTR0x60_MSI_2_NUM       4
#define INTR0x60_MSI_2_EQN       18
#define INTR0x60_MONDO_42_V      1
#define INTR0x60_MONDO_42_MODE   1
#define INTR0x60_MONDO_42_THREAD 1
#define INTR0x60_MONDO_42_CNTRL  1

#define INTR0x60_MSI_3_NUM       8
#define INTR0x60_MSI_3_EQN       19
#define INTR0x60_MONDO_43_V      1
#define INTR0x60_MONDO_43_MODE   1
#define INTR0x60_MONDO_43_THREAD 2
#define INTR0x60_MONDO_43_CNTRL  2

#define INTR0x60_MSI_4_NUM      16
#define INTR0x60_MSI_4_EQN       20
#define INTR0x60_MONDO_44_V      1
#define INTR0x60_MONDO_44_MODE   1
#define INTR0x60_MONDO_44_THREAD 3
#define INTR0x60_MONDO_44_CNTRL  3

#else
#ifdef SELECT_EQ_GROUP_5
	
#define INTR0x60_MSI_0_NUM       1
#define INTR0x60_MSI_0_EQN       21
#define INTR0x60_MONDO_45_V      1
#define INTR0x60_MONDO_45_MODE   1
#define INTR0x60_MONDO_45_THREAD 0
#define INTR0x60_MONDO_45_CNTRL  0

#define INTR0x60_MSI_1_NUM       2
#define INTR0x60_MSI_1_EQN       22
#define INTR0x60_MONDO_46_V      1
#define INTR0x60_MONDO_46_MODE   1
#define INTR0x60_MONDO_46_THREAD 0
#define INTR0x60_MONDO_46_CNTRL  0

#define INTR0x60_MSI_2_NUM       4
#define INTR0x60_MSI_2_EQN       23
#define INTR0x60_MONDO_47_V      1
#define INTR0x60_MONDO_47_MODE   1
#define INTR0x60_MONDO_47_THREAD 1
#define INTR0x60_MONDO_47_CNTRL  1

#define INTR0x60_MSI_3_NUM       8
#define INTR0x60_MSI_3_EQN       24
#define INTR0x60_MONDO_48_V      1
#define INTR0x60_MONDO_48_MODE   1
#define INTR0x60_MONDO_48_THREAD 2
#define INTR0x60_MONDO_48_CNTRL  2

#define INTR0x60_MSI_4_NUM      16
#define INTR0x60_MSI_4_EQN       25
#define INTR0x60_MONDO_49_V      1
#define INTR0x60_MONDO_49_MODE   1
#define INTR0x60_MONDO_49_THREAD 3
#define INTR0x60_MONDO_49_CNTRL  3

#else
#ifdef SELECT_EQ_GROUP_6
	
#define INTR0x60_MSI_0_NUM       1
#define INTR0x60_MSI_0_EQN       26
#define INTR0x60_MONDO_50_V      1
#define INTR0x60_MONDO_50_MODE   1
#define INTR0x60_MONDO_50_THREAD 0
#define INTR0x60_MONDO_50_CNTRL  0

#define INTR0x60_MSI_1_NUM       2
#define INTR0x60_MSI_1_EQN       27
#define INTR0x60_MONDO_51_V      1
#define INTR0x60_MONDO_51_MODE   1
#define INTR0x60_MONDO_51_THREAD 0
#define INTR0x60_MONDO_51_CNTRL  0

#define INTR0x60_MSI_2_NUM       4
#define INTR0x60_MSI_2_EQN       28
#define INTR0x60_MONDO_52_V      1
#define INTR0x60_MONDO_52_MODE   1
#define INTR0x60_MONDO_52_THREAD 1
#define INTR0x60_MONDO_52_CNTRL  1

#define INTR0x60_MSI_3_NUM       8
#define INTR0x60_MSI_3_EQN       29
#define INTR0x60_MONDO_53_V      1
#define INTR0x60_MONDO_53_MODE   1
#define INTR0x60_MONDO_53_THREAD 2
#define INTR0x60_MONDO_53_CNTRL  2

#define INTR0x60_MSI_4_NUM      16
#define INTR0x60_MSI_4_EQN       30
#define INTR0x60_MONDO_54_V      1
#define INTR0x60_MONDO_54_MODE   1
#define INTR0x60_MONDO_54_THREAD 3
#define INTR0x60_MONDO_54_CNTRL  3

#else
#ifdef SELECT_EQ_GROUP_7
	
#define INTR0x60_MSI_0_NUM       1
#define INTR0x60_MSI_0_EQN       31
#define INTR0x60_MONDO_55_V      1
#define INTR0x60_MONDO_55_MODE   1
#define INTR0x60_MONDO_55_THREAD 0
#define INTR0x60_MONDO_55_CNTRL  0

#define INTR0x60_MSI_1_NUM       2
#define INTR0x60_MSI_1_EQN       32
#define INTR0x60_MONDO_56_V      1
#define INTR0x60_MONDO_56_MODE   1
#define INTR0x60_MONDO_56_THREAD 0
#define INTR0x60_MONDO_56_CNTRL  0

#define INTR0x60_MSI_2_NUM       4
#define INTR0x60_MSI_2_EQN       33
#define INTR0x60_MONDO_57_V      1
#define INTR0x60_MONDO_57_MODE   1
#define INTR0x60_MONDO_57_THREAD 1
#define INTR0x60_MONDO_57_CNTRL  1

#define INTR0x60_MSI_3_NUM       8
#define INTR0x60_MSI_3_EQN       34
#define INTR0x60_MONDO_58_V      1
#define INTR0x60_MONDO_58_MODE   1
#define INTR0x60_MONDO_58_THREAD 2
#define INTR0x60_MONDO_58_CNTRL  2

#define INTR0x60_MSI_4_NUM      16
#define INTR0x60_MSI_4_EQN       35
#define INTR0x60_MONDO_59_V      1
#define INTR0x60_MONDO_59_MODE   1
#define INTR0x60_MONDO_59_THREAD 3
#define INTR0x60_MONDO_59_CNTRL  3

#else

#error You need to set one of SELECT_EQ_GROUP_1 - SELECT_EQ_GROUP_7
	
#endif
#endif
#endif
#endif
#endif
#endif
#endif

/* Kick off the other MSIs and then stall */
#define INTR0x60_MSI_0_EXTRA_HANDLER_WHILE_BUSY \
	call	t0_mondo40_handler; \
1:	nop

/* Calculate the address for this INO (%g3) in mondo_seen.
 * Has interrupt to this INO already occured?
 * Record the interrupt as done. */
#define INTR0x60_MSI_EXTRA_HANDLER \
        setx    mondo_seen, %g7, %g4; \
        add     %g3, %g4, %g4; \
	ldub	[%g4], %g5; \
	brz	%g5, 1f; \
	set	1, %g6; \
	EXIT_BAD; \
1:	stub	%g6, [%g4]


#include "interrupt0x60_defines.h"

#define SYNC_THREADS 1

#include "hboot.s"

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

	setx	iteration_counter, %o1, %o0

        ta      T_RD_THID               ! %o1 = thread ID
        brnz	%o1, t1_to_t3_main      ! branch if not thread 0
        nop


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! Thread 0 Start Here
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

t0_main:
        setx    mondo_seen+INTR0x60_MSI_0_EQN+24, %l7, %i7
	mov	4, %i6          ! Set the number of iterations

t0_clear_mondo_seen:
	stb	%i6, [%o0]      ! iteration counter
	stb	%g0, [%i7]      ! Mondo 40
	stb	%g0, [%i7+1]    ! Mondo 41
	stb	%g0, [%i7+2]    ! Mondo 42
	stb	%g0, [%i7+3]    ! Mondo 43
	stb	%g0, [%i7+4]    ! Mondo 44

        /* Kick off first interrupt, trap handler kicks off rest */
t0_kick_msi_0:
	! user event to generate MSI msg.
	nop         ! $EV trig_pc_d(1, @VA(.MAIN.t0_kick_msi_0)) -> EnablePCIeIgCmd ("MSI64", eval(INTR0x60_MSI_0_NUM, 16), 0, 4, 1, *, 1 )

	/* Wait for interrupt to occur. */
t0_intr_wait:
#ifdef DTM_ENABLED
	setx	0x400, %l1, %l2		! DTM timeout count
#else
	setx	0x100, %l1, %l2		! timeout count
#endif

t0_intr_wait_loop_top:
	ldub	[%i7], %l0
	cmp	%l0, 1
	be	t0_saw_mondo
	dec	%l2
	brnz	%l2, t0_intr_wait_loop_top
	nop
t0_timeout:
	! $EV trig_pc_d(1, @VA(.MAIN.t0_timeout)) -> printf("ERROR: T0 timeout waiting for mondo 40",*,1)
	ba	local_test_failed
	nop

t0_saw_mondo:
	ldub	[%i7+2], %l0      ! Check for mondo 42
	cmp	%l0, 1
	bne	t0_missed_mondo_42
	ldub	[%i7+3], %l0      ! Check for mondo 43
	cmp	%l0, 1
	bne	t0_missed_mondo_43
	ldub	[%i7+4], %l0      ! Check for mondo 44
	cmp	%l0, 1
	bne	t0_missed_mondo_44

	mov	100, %l2
t0_wait_for_mondo_41:
	brz	%l2, t0_missed_mondo_41
	dec	%l2
	ldub	[%i7+1], %l0      ! Check for mondo 41
	cmp	%l0, 1
	bne	t0_wait_for_mondo_41
	nop

t0_iteration_passed:
	dec	%i6
	brz	%i6, t0_done

t0_setup_next_iteration:
	/* Rotate controllers and run it again */
	best_set_reg(mpeval(PCI_E_INT_MAP_ADDR+PCI_E_INT_MAP_STEP*(40-20)),
	             %l1, %l2)
	mov	5, %l7 /* Number of mondos that need fixing */
	mov	0xf, %l6
	sllx	%l6, PCI_E_INT_MAP_INT_CNTRL_NUM_SHIFT, %l6
t0_setup_next_iteration_top:
	ldx	[%l2], %l3
	and	%l3, %l6, %l4  /* Isolate the controller value */
	sllx	%l4, 1, %l4    /* Generate new controller value */
	andcc	%l4, %l6, %g0  /* Check for 0000 value */
	bne	%xcc, 1f
	andn	%l3, %l6, %l3  /* Clear previous controller value */
	srlx	%l4, 4, %l4    /* Correct for 0000 value */
1:	or	%l4, %l3, %l3  /* Merge new value with old CSR value */
	stx	%l3, [%l2]

	dec	%l7
	brnz	%l7, t0_setup_next_iteration_top
	add	%l2, PCI_E_INT_MAP_STEP, %l2

	ba	t0_clear_mondo_seen
	nop

	!Done
t0_done:
	stx	%g0, [%o0]      ! Signal other threads that we are done
	ba	test_passed
	nop

.global t0_mondo40_handler
t0_mondo40_handler: /* This is called from the trap handler */
	! $EV trig_pc_d(1, @VA(.MAIN.t0_mondo40_handler)) -> EnablePCIeIgCmd ("MSI64", eval(INTR0x60_MSI_1_NUM, 16), 0, 4, 1, *, 1 )
	nop
t0_mondo40_handler_kick_msi_2:
	! $EV trig_pc_d(1, @VA(.MAIN.t0_mondo40_handler_kick_msi_2)) -> EnablePCIeIgCmd ("MSI64", eval(INTR0x60_MSI_2_NUM, 16), 0, 4, 1, *, 1 )
	nop
t0_mondo40_handler_kick_msi_3:
	! $EV trig_pc_d(1, @VA(.MAIN.t0_mondo40_handler_kick_msi_3)) -> EnablePCIeIgCmd ("MSI64", eval(INTR0x60_MSI_3_NUM, 16), 0, 4, 1, *, 1 )
	nop
t0_mondo40_handler_kick_msi_4:
	! $EV trig_pc_d(1, @VA(.MAIN.t0_mondo40_handler_kick_msi_4)) -> EnablePCIeIgCmd ("MSI64", eval(INTR0x60_MSI_4_NUM, 16), 0, 4, 1, *, 1 )

/* Wait for the new interrupts to arrive and be processed by other threads */
#ifdef DTM_ENABLED
	mov	800, %g7		! Set the maximum time to wait, DTM
#else
	mov	200, %g7		! Set the maximum time to wait
#endif
t0_mondo40_handler_loop_top:
	brz	%g7, t0_mondo40_handler_loop_timeout
	dec	%g7
	setx	mondo_seen+INTR0x60_MSI_0_EQN+24+2, %g5, %g6
	ldub	[%g6], %g5
	brz	%g5, t0_mondo40_handler_loop_top
	ldub	[%g6+1], %g5
	brz	%g5, t0_mondo40_handler_loop_top
	ldub	[%g6+2], %g5
	brz	%g5, t0_mondo40_handler_loop_top
	nop
/* If we fall to here, all 3 other interrupts have been processed */
t0_mondo40_handler_retl:
	retl
	nop

t0_mondo40_handler_loop_timeout:
	! $EV trig_pc_d(1, @VA(.MAIN.t0_mondo40_handler_loop_timeout)) -> printf("ERROR: T0 timeout waiting for mondos 42 thru 44 to be processed",*,1)
	ba	local_test_failed
	nop

t0_missed_mondo_41:
	! $EV trig_pc_d(1, @VA(.MAIN.t0_missed_mondo_41)) -> printf("ERROR: T0 missed mondo 41",*,1)
	ba	local_test_failed
	nop

t0_missed_mondo_42:
	! $EV trig_pc_d(1, @VA(.MAIN.t0_missed_mondo_42)) -> printf("ERROR: T0 missed mondo 42",*,1)
	ba	local_test_failed
	nop

t0_missed_mondo_43:
	! $EV trig_pc_d(1, @VA(.MAIN.t0_missed_mondo_43)) -> printf("ERROR: T0 missed mondo 43",*,1)
	ba	local_test_failed
	nop

t0_missed_mondo_44:
	! $EV trig_pc_d(1, @VA(.MAIN.t0_missed_mondo_44)) -> printf("ERROR: T0 missed mondo 44",*,1)
	ba	local_test_failed
	nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! All Threads Except 0 Start Here
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


t1_to_t3_main:
	setx	mondo_seen+INTR0x60_MSI_0_EQN+24+1, %l7, %i7
	add	%i7, %o1, %i7   ! add thread number to get mondo number

	/* Wait for interrupt to occur. */
t1_t3_intr_wait:
#ifdef DTM_ENABLED
	setx	0x400, %l1, %l2		! DTM timeout count
#else
	setx	0x100, %l1, %l2		! timeout count
#endif

t1_t3_intr_wait_loop_top:
	ldub	[%i7], %l0
	cmp	%l0, 1
	be	t1_t3_saw_mondo
	dec	%l2
	brnz	%l2, t1_t3_intr_wait_loop_top
	nop

t1_t3_timeout:
	! $EV trig_pc_d(1, @VA(.MAIN.t1_t3_timeout)) -> printf("ERROR: T1-T3 timeout waiting for mondo",*,1)
	ba	local_test_failed
	nop
	
t1_t3_saw_mondo:
	/* Check if thread 0 has cleared the iteration count */
	ldub	[%o0], %o2
	brz	%o2, t1_t3_done
	/* If thread 0 has cleared the "mondo seen" flag,
         * loop again for next controller settings */
	ldub	[%i7], %l0
	brz	%l0, t1_t3_intr_wait
	nop
	/* Otherwise, keep looping */
	ba	t1_t3_saw_mondo
	nop

	!Done
t1_t3_done:	
	ba	test_passed
	nop

	
test_passed:
	EXIT_GOOD

local_test_failed:
	EXIT_BAD




/************************************************************************
   Test case data start
************************************************************************/

.align  64
.data
user_data_start:
iteration_counter: .byte  4     ! Number of controller configs left to do

.align  256
.global mondo_seen
mondo_seen:                     ! One byte per mondo
        .skip  60, 0            ! Start with virtual mondo 0 for easy math

.align	eval(512*1024)
.global event_queue_base
event_queue_base:
	.skip	1024
user_data_end:
.end

/************************************************************************/
