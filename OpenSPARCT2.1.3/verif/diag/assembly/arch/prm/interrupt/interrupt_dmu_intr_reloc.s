/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_dmu_intr_reloc.s
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
#define MAIN_PAGE_HV_ALSO
#define ENABLE_PCIE_LINK_TRAINING
#define SYNC_THREADS	0xff

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
        call    my_trap_code; \
        nop; \
        retry; \
        nop; 

#include "hboot.s"
#include "peu_defines.h"
#include "ncu_defines.h"
#include "cmp_macros.h"


/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
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
        cmp     %o1, 0x0
        be      main_t0                 ! branch if tread 0
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

        ! Disable interrupts

no_intr:
        rdpr    %pstate, %g5
        xor     %g5, 0x2, %g5           ! Reset interrupt enable
        wrpr    %g5, %pstate

	! Initialize Mondo Interrupt Vector Register
	! VECTOR = 63

ncu_mondo_int_vec:
	set	63, %g1
	setx	MONDO_INT_VEC, %g2, %g3
	stx	%g1, [%g3]

	! Clear Mondo Interrupt Busy registers.

ncu_mondo_int_busy:
	setx	MONDO_INT_BUSY, %g1, %g2
	setx	MONDO_INT_BUSY_STEP, %g1, %g3
	setx	MONDO_INT_BUSY_COUNT, %g1, %g4

ncu_mondo_int_busy_loop_top:
	stx	%g0, [%g2]
	add	%g2, %g3, %g2
	cmp	%g4, 1
	bne	ncu_mondo_int_busy_loop_top
	dec	%g4

	! Initialize for MSI interrupt in PIU
	! First clear MSI in case one pending.

peu_msi_clear:
	setx	PCI_E_MSI_CLEAR_ADDR, %g1, %g2
	setx	0x4000000000000000, %g1, %g3
	stx	%g3, [%g2]

	! Also clear in Interrupt Clear reg.

peu_intr_clear:
	setx	PCI_E_INT_CLEAR_ADDR, %g1, %g2
	set	PCI_E_INT_CLEAR_STEP, %g1
	sllx	%g1, 2, %g1
	add	%g2, %g1, %g2
	stx	%g0, [%g2]

	! Setup all the event queues.

	! First the Event Queue Base Address reg.
	! Formatted for a bypass address.

peu_eq_base_addr:
	setx	PCI_E_EV_QUE_BASE_ADDRESS_ADDR, %g1, %g2
	setx	user_data_start+0x80000, %g1, %g3
	setx	0x7ffff80000, %g1, %g5
	and	%g3, %g5, %g3
	setx	0xfffc000000000000, %g1, %g6
	or	%g3, %g6, %g3
	stx	%g3, [%g2]

	! Event Queue Control Set reg.s

peu_eq_ctl_set:
	setx	PCI_E_EV_QUE_CTL_SET_ADDR, %g1, %g2
	setx	0x100000000000, %g1, %g3		! EN = 1
	setx	PCI_E_EV_QUE_CTL_SET_COUNT, %g1, %g4
	setx	PCI_E_EV_QUE_CTL_SET_STEP, %g1, %g5

peu_eq_clt_set_loop:
	stx	%g3, [%g2]
	cmp	%g4, 1
	beq	peu_msi_addr

	add	%g2, %g5, %g2
	ba	peu_eq_clt_set_loop
	dec	%g4

	! Now enable MSI interrupt

	! First MSI addressing register

peu_msi_addr:
	setx	PCI_E_MSI_32_ADDRESS_ADDR, %g1, %g2
	stx	%g0, [%g2]
	setx	PCI_E_MSI_64_ADDRESS_ADDR, %g1, %g2
	stx	%g0, [%g2]

	! MSI Mapping register, only init. the first, the trap handler does the rest

peu_msi_mapping:
	setx	PCI_E_MSI_MAP_ADDR, %g1, %g2
	setx	0x8000000000000000, %g1, %g3	! V = 1, EQNUM = 0
	stx	%g3, [%g2]
	membar	#Sync

	! Now enable Mondo in PIU and set destination thread
	! Interrupt Mapping register

peu_int_map_enable:
	setx	PCI_E_INT_MAP_ADDR, %g1, %g5
	set	PCI_E_INT_MAP_STEP, %g1
	sllx	%g1, 2, %g1
	add	%g5, %g1, %g5
	setx	0x80000040, %g1, %g6		! valid = 1, thread id = 0
	stx	%g6, [%g5]			! interrupt controller = 1

        ! Enable interrupts

yes_intr:
        rdpr    %pstate, %g5
        or      %g5, 0x2, %g5           ! Set interrupt enable
        wrpr    %g5, %pstate


        /* Sync up all the treads. */

sync_t0:
        SYNC_THREAD_MAIN( local_test_failed, %g1, %g2, %g3 )


        /* Loop to kick off the MSI's */
	/* Note that the interrupt trap handler will take care of doing the relocation */

gen_msis:
	setx	PCI_E_EV_QUE_CTL_SET_COUNT, %g1, %g7
	sllx	%g7, 1, %g7			! two interrupts per event queue
#ifdef DMU_INTR_RELOC_VEC
	srlx	%g7, 2, %g7	! only do 1/4 of them for test vectors.
#endif
	setx	interrupt_flag, %g1, %g2
	
gen_msis_loop:
	st	%g0, [%g2]			! clear interrupt occured flag

gen_msi_user_event:	
	! user event to generate MSI msg.
	nop         ! $EV trig_pc_d(1, @VA(.MAIN.gen_msi_user_event)) -> EnablePCIeIgCmd ("MSI32", 0, 0, 4, 1, *, 1 )


	/* Wait for interrupt to occur. */

intr_wait:
#ifdef DTM_ENABLED
	setx	0x2000, %g1, %g3	! DTM timeout count
#else
	setx	0x800, %g1, %g3		! timeout count
#endif

intr_wait_loop:
	ld	[%g2], %g5
	cmp	%g5, 1
	be	gen_msis_next
	dec	%g3

	cmp	%g3, 0
	bne	intr_wait_loop
	nop
	ba	local_test_failed
	nop

	/* Have all the needed MSI's been generated? */

gen_msis_next:
	dec	%g7
	cmp	%g7, 0
	bne	gen_msis_loop
	nop

#ifndef SKIP_EQ_CHECK
	/* Did each thread get the correct number of interrupts */

intr_check:
	setx	interrupt_counts, %g1, %g2
	set	8, %g7

intr_check_loop:
	ld	[%g2], %g5
	cmp	%g5, 9
	bne	local_test_failed
	dec	%g7

	cmp	%g7, 0
	bne	intr_check_loop
	add	%g2, 4, %g2
#endif

	/* Tell the other threads we're done. */

t0_flag_done:
	setx	done_flag, %g1, %g2
	set	1, %g3
	st	%g3, [%g2]

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
	mov	%o1, %g6
        SYNC_THREAD_OTHER( %g6,%g1,%g2 )

	/* Wait thread 0 to indicate we're done. */

t1_t63_intr_wait:
#ifdef DTM_ENABLED
	setx	0x10000, %g1, %g2	! DTM timeout count
#else
	setx	0x4000, %g1, %g2	! timeout count
#endif
	setx	done_flag, %g1, %g7

t1_t63_intr_wait_loop_top:
	ld	[%g7], %g5
	cmp	%g5, 1
	be	t1_t63_done
	dec	%g2

	cmp	%g2, 0
	bne	t1_t63_intr_wait_loop_top
	nop
	ba	local_test_failed
	nop

	!Done
t1_t63_done:	
	ba	test_passed
	nop

	
test_passed:
	EXIT_GOOD

local_test_failed:
	EXIT_BAD


/**********************************************************************
   Interrupt trap handler.
**********************************************************************/

.global my_trap_code

my_trap_code:
        ta      T_RD_THID               ! %o1 = thread id

	! Check Mondo Interrupt Busy reg. for this thread
	
trap_mondo_busy:
	setx	MONDO_INT_BUSY, %l1, %l2
	setx	MONDO_INT_BUSY_STEP, %l1, %l3
	mulx	%l3, %o1, %l3
	add	%l3, %l2, %l2
	ldx	[%l2], %l4
	and	%l4, 0x40, %l5			! Is busy bit set?
	cmp	%l5, 0
	be	local_test_failed
	nop

	! Check Mondo Interrupt Alias Busy reg.

trap_mondo_abusy:	
	setx	MONDO_INT_ABUSY, %l1, %l2
	ldx	[%l2], %l3
	cmp	%l3, %l4			! ABUSY = BUSY ?
	bne	local_test_failed
	nop

	! Check Mondo Interrupt Data 0/1 against Mondo Interrupt Alias Data 0/1

trap_mondo_data0:
	setx	MONDO_INT_DATA0, %l1, %l2
	setx	MONDO_INT_DATA0_STEP, %l1, %l3
	mulx	%l3, %o1, %l3
	add	%l3, %l2, %l2
	ldx	[%l2], %l0			! %l0 = mondo_int_busy0

trap_mondo_adata0:
	setx	MONDO_INT_ADATA0, %l1, %l4	! %l6 = mondo_int_abusy0, inc. INO
	ldx	[%l4], %l6			
	cmp	%l6, %l0
	bne	local_test_failed
	nop

trap_mondo_data1:
	setx	MONDO_INT_DATA1, %l1, %l2
	setx	MONDO_INT_DATA1_STEP, %l1, %l3
	mulx	%l3, %o1, %l3
	add	%l3, %l2, %l2
	ldx	[%l2], %l0			! %l0 = mondo_int_busy1

trap_mondo_adata1:
	setx	MONDO_INT_ADATA1, %l1, %l4	! %l5 = mondo_int_abusy1
	ldx	[%l4], %l5			
	cmp	%l5, %l0
	bne	local_test_failed
	nop

	! Is this the INO expected?

trap_ino_check:
	and	%l6, 0x3f, %l6			! %l6 = INO
	sub	%l6, 24, %l6			! %l6 = event queue number
	setx	eq_num, %l1, %l2		! Do NOT change %l6 until trap_inc_queue!
	ld	[%l2], %l2
#ifndef SKIP_EQ_CHECK
	cmp	%l2, %l6
	bne	local_test_failed
	nop
#endif

	! Was the correct event queue used?

trap_eq_check1:
	setx	PCI_E_MSI_MAP_ADDR, %l1, %l2
	ldx	[%l2], %l1
	and	%l1, 0x3f, %l1
	cmp	%l1, %l6
	bne	local_test_failed
	nop

	! Check Mondo status in PIU

	! Interrupt Clear reg.

trap_peu_intr_clear:
	setx	PCI_E_INT_CLEAR_ADDR, %l1, %l2
	set	PCI_E_INT_CLEAR_STEP, %l3
	add	%l6, 4, %l4
	mulx	%l3, %l4, %l3
	add	%l2, %l3, %l2
	ldx	[%l2], %l0
	cmp	%l0, 3			! Should be in pending state
	bne	local_test_failed
	nop

	! MSI Mapping reg.

trap_peu_msi_map:
	setx	PCI_E_MSI_MAP_ADDR, %l1, %l2
	setx	0xc000000000000000, %l1, %l4	! V = 1, EQWR_N = %l6
	or	%l4, %l6, %l4
	ldx	[%l2], %l0
	cmp	%l0, %l4
	bne	local_test_failed
	nop

	! Clear the Mondo interrupt in the PIU

	! MSI Clear reg.

trap_msi_clear:
	setx	PCI_E_MSI_CLEAR_ADDR, %l1, %l2
	setx	0x4000000000000000, %l1, %l3
	stx	%l3, [%l2]			! clear EQWR in MSI map reg.
	membar	#Sync

	! Disable Event Queue via Control Clear reg.

trap_eq_control_clear:
	setx	PCI_E_EV_QUE_CTL_CLEAR_ADDR, %l1, %l2
	set	PCI_E_EV_QUE_CTL_CLEAR_STEP, %l4
	mulx	%l4, %l6, %l4
	add	%l2, %l4, %l2
	setx	0x100000000000, %l1, %l3	! DIS = 1
	stx	%l3, [%l2]
	membar	#Sync

	! Set Event Queue Head = Event Queue Tail
	! Also check that they are not equal.

trap_mondo_clear:
	setx	PCI_E_EV_QUE_TAIL_ADDR, %l1, %l2
	set	PCI_E_EV_QUE_TAIL_STEP, %l4
	mulx	%l4, %l6, %l4
	add	%l2, %l4, %l2
	ldx	[%l2], %l0
	setx	PCI_E_EV_QUE_HEAD_ADDR, %l1, %l2
	set	PCI_E_EV_QUE_HEAD_STEP, %l4
	mulx	%l4, %l6, %l4
	add	%l2, %l4, %l2
	ldx	[%l2], %l1
	cmp	%l0, %l1
	be	local_test_failed
	nop
	stx	%l0, [%l2]
	membar	#Sync

	! Interrupt Clear reg.

trap_intr_clear:
	setx	PCI_E_INT_CLEAR_ADDR, %l1, %l2
	set	PCI_E_INT_CLEAR_STEP, %l3
	add	%l6, 4, %l1
	mulx	%l3, %l1, %l3
	add	%l2, %l3, %l2
	stx	%g0, [%l2]
	membar	#Sync

	! Clear the mondo interrupt in the NCU

trap_mondo_intr_clear:
	setx	MONDO_INT_ABUSY, %l0, %l1
	stx	%g0, [%l1]
	membar	#Sync

	ldx	[%l1], %l2
	and	%l2, 0x40, %l2
	cmp	%l2, 0			! Busy should be cleared
	bne	local_test_failed
	nop

	! Clear the interrupt in the core

trap_clear_asi_intr_r:	
	ldxa	[%g0]ASI_SWVR_INTR_R, %l5
	cmp	%l5, 63			! check for correct vector number
	bne	local_test_failed
	nop

	! Set up to do relocation

	! First are we done with the current event queue?

trap_eq_check:
	setx	odd_even, %l1, %l2
	ld	[%l2], %l0
	cmp	%l0, 0
	bne	trap_next_eq
	nop

	! Keep same event queue, but do the relocation,
	! i.e. change thread interrupt is sent to.

	set	1, %l1
	st	%l1, [%l2]
	ba	trap_inc_thread
	nop

	! Go to the next event queue

trap_next_eq:
	st	%g0, [%l2]
	setx	eq_num, %l1, %l2
	inc	%l6
	st	%l6, [%l2]

	! Initialize for the new event queue

trap_inc_queue:
	setx	PCI_E_MSI_MAP_ADDR, %l1, %l2
	setx	0x8000000000000000, %l1, %l3	! V = 1
	or	%l3, %l6, %l3			! or in new event queue number
	stx	%l3, [%l2]

	! Increment the thread to send the next interrupt to

trap_inc_thread:
	setx	PCI_E_INT_MAP_ADDR, %l1, %l5
	set	PCI_E_INT_MAP_STEP, %l1
	add	%l6, 4, %l7			! index = event queue # + 4
	mulx	%l1, %l7, %l1
	add	%l5, %l1, %l5
	setx	0x80000040, %l1, %l2		! valid = 1, intr. controller #1
	add	%o1, 1, %l7
	and	%l7, 0x7, %l7
	sllx	%l7, 25, %l4
	or	%l2, %l4, %l2			! or in destination thread id
	stx	%l2, [%l5]

	! Enable the Event Queue

trap_enable_eq:
	setx	PCI_E_EV_QUE_CTL_SET_ADDR, %l1, %l2
	setx	PCI_E_EV_QUE_CTL_SET_STEP, %l1, %l4
	mulx	%l4, %l6, %l4
	add	%l2, %l4, %l2
	setx	0x100000000000, %l1, %l3	! EN = 1
	stx	%l3, [%l2]	
	membar	#Sync
	
        ! Increment thread's interrupt count.

trap_inc_intr_count:
	sllx	%o1, 2, %l7
        setx    interrupt_counts, %l1, %l3
        add     %l7, %l3, %l7           ! %l7 = pointer to thread's interrupt count
	ld	[%l7], %l6
	inc	%l6
	st	%l6, [%l7]

	! Flag that an interrupt occured

trap_flag_intr:	
	setx	interrupt_flag, %l0, %l1
	ld	[%l1], %l2
	inc	%l2
	st	%l2, [%l1]

	! Done.

trap_done:
	jmpl    %o7+0x8, %g0
	nop



/************************************************************************
   Test case data start
************************************************************************/

.align  1024
.data
user_data_start:
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff
	.word	0xffffffff

	/* 1 word per thread to count number of interrupts taken */
interrupt_counts:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0

interrupt_flag:
        .word   0
        .word   0

done_flag:
	.word	0x0
	.word	0x0

odd_even:
	.word	0x0
	.word	0x0

eq_num:
	.word	0x0
	.word	0x0

user_data_end:
.end

/************************************************************************/
