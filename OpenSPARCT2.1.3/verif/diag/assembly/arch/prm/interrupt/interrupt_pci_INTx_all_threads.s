/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_pci_INTx_all_threads.s
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
        mov     %o1, %g6                ! %o1, %g6 = thread ID
        set     8, %l7
        umul    %g6, %l7, %l7
        setx    user_data_start, %g1, %g3
        add     %l7, %g3, %g7           ! %g7 = pointer to thread's data area

        cmp     %g6, 0x0
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
	stx	%g0, [%g7]		! Clear this thread's interrupt count
	membar	#Sync

/*      Initialize the NCU for the interrupt.   */

        ! Disable interrupts

no_intr:
        rdpr    %pstate, %g7
        xor     %g7, 0x2, %g7           ! Reset interrupt enable
        wrpr    %g7, %pstate

        ! Initially set all the Interrupt Management Registers
        ! Not used in this diag, so set vector number to 0, thread to 0.
ncu_init:
        setx    INT_MAN, %g1, %g2       ! %g2 = INT_MAN reg. addr.
        setx    INT_MAN_COUNT, %g1, %g4 ! %g4 = INT_MAN reg. count value

ncu_init_loop_top:
        stx     %g0, [%g2]
        add     %g2, INT_MAN_STEP, %g2
        cmp     %g4, 1
        bne     ncu_init_loop_top
        add     %g4, -1, %g4

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

	! Initialize for INTA interrupt in DMU/PEU
	! First clear INTA in case one pending.

peu_inta_clear:
	setx	PCI_E_INT_A_CLEAR_ADDR, %g1, %g2
	set	1, %g3
	stx	%g3, [%g2]

	! Also clear in Interrupt Clear reg.

peu_intr_clear:
	setx	PCI_E_INT_CLEAR_ADDR, %g1, %g2
	stx	%g0, [%g2]

	! Now enable INTA in DMU/PEU and set destination thread

peu_inta_enable:
	setx	PCI_E_INT_MAP_ADDR, %g1, %g7
	setx	0x80000040, %g1, %g6		! valid = 1, thread id = 0
#ifdef PORTABLE_CORE
	ldxa    [%g0]ASI_INTR_ID, %o2		! get full thread ID
	and	%o2, 0x38, %o3			! get thread 0 of this core
	sllx	%o3, 25, %o3
	or	%g6, %o3, %g6
#endif
	stx	%g6, [%g7]                      ! interrupt controller = 1

        ! Enable interrupts

yes_intr:
        rdpr    %pstate, %g7
        or      %g7, 0x2, %g7           ! Set interrupt enable
        wrpr    %g7, %pstate


        /* Sync up all the treads. */

#ifndef PORTABLE_CORE
sync_t0:
        SYNC_THREAD_MAIN( local_test_failed, %g1, %g2, %g3 )
#else
	cmp_sync_threads
#endif


        ! Kick off first interrupt, trap handler kicks off rest

first_inta_intr:
	! user event to generate ASSERT_INTA msg.
	nop         ! $EV trig_pc_d(1, @VA(.MAIN.first_inta_intr)) -> EnablePCIeIgCmd ("INTA", 0, 0, "ASSERT", 64'd1, *, * )

	/* Wait for interrupt to occur. */

intr_wait:
#ifdef DTM_ENABLED
	setx	0x2000, %g1, %g2	! DTM timeout count
#else
	setx	0x800, %g1, %g2		! timeout count
#endif
        ta      T_RD_THID               ! %o1 = thread id
        set     8, %g7
        umul    %o1, %g7, %g7
        setx    user_data_start, %g1, %g3
        add     %g7, %g3, %g7           ! %g7 = pointer to thread's data area

intr_wait_loop_top:
	ldx	[%g7], %g5
	cmp	%g5, 1
	be	t0_new_intr
	dec	%g2

	cmp	%g2, 0
	bne	intr_wait_loop_top
	nop
	ba	local_test_failed
	nop

	! Kick off next INTA interrupt

t0_new_intr:
	! user event for ASSERT_INTA msg.
	nop         ! $EV trig_pc_d(1, @VA(.MAIN.t0_new_intr)) -> EnablePCIeIgCmd ("INTA", 0, 0, "ASSERT", 64'd1, *, * )

	ba	test_passed
	nop



	
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! All Threads Except 0 Start Here
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


main_t1_to_t63:
	stx	%g0, [%g7]		! Clear this thread's interrupt count
	membar	#Sync

#ifndef PORTABLE_CORE
        SYNC_THREAD_OTHER( %g6,%g1,%g2 )
#else
	cmp_sync_threads
#endif

	/* Wait for interrupt to occur. */

t1_t63_intr_wait:
#ifdef DTM_ENABLED
	setx	0x10000, %g1, %g2	! DTM timeout count
#else
	setx	0x4000, %g1, %g2	! timeout count
#endif
        ta      T_RD_THID               ! %o1 = thread id
        set     8, %g7
        umul    %o1, %g7, %g7
        setx    user_data_start, %g1, %g3
        add     %g7, %g3, %g7           ! %g7 = pointer to thread's data area

t1_t63_intr_wait_loop_top:
	ldx	[%g7], %g5
	cmp	%g5, 1
	be	t1_t63_last
	dec	%g2

	cmp	%g2, 0
	bne	t1_t63_intr_wait_loop_top
	nop
	ba	local_test_failed
	nop
	
	! Kick off next INTA interrupt, if not in last thread

t1_t63_last:
	ta	T_RD_THID
#ifndef PORTABLE_CORE
	cmp	%o1, 63
#else
	ldxa    [%g0]ASI_INTR_ID, %o2		! get full thread ID
	and	%o2, 0x7, %o3
	cmp	%o3, 7
#endif
	be	test_passed
	nop

t1_t63_new_intr:
	! user event for ASSERT_INTA msg.
	nop         ! $EV trig_pc_d(1, @VA(.MAIN.t1_t63_new_intr)) -> EnablePCIeIgCmd ("INTA", 0, 0, "ASSERT", 64'd1, *, * )

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

        ! Get the thread id.
        ta      T_RD_THID               ! %o1 = thread id
	ldxa    [%g0]ASI_INTR_ID, %o2	! get full thread ID
        set     8, %l7
        umul    %o1, %l7, %l7
        setx    user_data_start, %l1, %l3
        add     %l7, %l3, %l7           ! %l7 = pointer to thread's data area

	! Has interrupt to this thread already occured?

trap_mult_intr:
	ldx	[%l7], %l1
	cmp	%l1, 0
	bne	local_test_failed
	nop

	! Record interrupt occured for this thread.

trap_intr_flag:
	set	1, %l1
	stx	%l1, [%l7]

	! Check Mondo Interrupt Busy reg. for this thread

trap_mondo_busy:
	setx	MONDO_INT_BUSY, %l1, %l2
	setx	MONDO_INT_BUSY_STEP, %l1, %l3
	mulx	%l3, %o2, %l3
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
	mulx	%l3, %o2, %l3
	add	%l3, %l2, %l2
	ldx	[%l2], %l0			! %l0 = mondo_int_busy0

trap_mondo_adata0:
	setx	MONDO_INT_ADATA0, %l1, %l4	! %l5 = mondo_int_abusy0
	ldx	[%l4], %l5			
	cmp	%l5, %l0
	bne	local_test_failed
	nop

trap_mondo_data1:
	setx	MONDO_INT_DATA1, %l1, %l2
	setx	MONDO_INT_DATA1_STEP, %l1, %l3
	mulx	%l3, %o2, %l3
	add	%l3, %l2, %l2
	ldx	[%l2], %l0			! %l0 = mondo_int_busy1

trap_mondo_adata1:
	setx	MONDO_INT_ADATA1, %l1, %l4	! %l5 = mondo_int_abusy1
	ldx	[%l4], %l5			
	cmp	%l5, %l0
	bne	local_test_failed
	nop

	! Check INTA status in DMU/PEU

	! Interrupt Clear reg.

trap_peu_intr_clear:
	setx	PCI_E_INT_CLEAR_ADDR, %l1, %l2
	ldx	[%l2], %l0
	cmp	%l0, 3			! Should be in pending state
	bne	local_test_failed
	nop

trap_peu_inta_status:
	setx	PCI_E_INTX_STATUS_ADDR, %l1, %l2
	ldx	[%l2], %l0
	cmp	%l0, 8			! INTA should be only one active
	bne	local_test_failed
	nop

trap_peu_inta_clear:
	setx	PCI_E_INT_A_CLEAR_ADDR, %l1, %l2
	ldx	[%l2], %l0
	cmp	%l0, 1			! INTA should be active
	bne	local_test_failed
	nop

	! Clear the INTA interrupt in the DMU/PEU

trap_inta_clear:
	! user event for INTA deassert msg.
	nop         ! $EV trig_pc_d(1, @VA(.MAIN.trap_inta_clear)) -> EnablePCIeIgCmd ("INTA", 0, 0, "DEASSERT", 64'd1, *, * )

	! Check the INTA status in INTA Clear reg.

#ifdef DTM_ENABLED
	setx	0x400, %l0, %l1		! DTM Timeout count
#else
	setx	0x100, %l0, %l1		! Timeout count
#endif
	setx	PCI_E_INT_A_CLEAR_ADDR, %l0, %l2

trap_inta_clear_loop_top:
	ldx	[%l2], %l0
	cmp	%l0, 0			! Waiting for idle state
	be	trap_inta_clear_done
	nop
	cmp	%l1, 1
	be	local_test_failed		! Timeout check
	dec	%l1
	ba	trap_inta_clear_loop_top
	nop

	! Check other DMU/PEU INTA registers

trap_inta_clear_done:	
	setx	PCI_E_INTX_STATUS_ADDR, %l1, %l2
	ldx	[%l2], %l0
	cmp	%l0, 0			! All should be inactive
	bne	local_test_failed
	nop

	! Interrupt Clear reg.

trap_intr_clear:
	setx	PCI_E_INT_CLEAR_ADDR, %g1, %g2
	stx	%g0, [%g2]

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

trap_asi_intr_r_clear:
        ldxa    [%g0]ASI_SWVR_INTR_R, %l5
        cmp     %l5, 63                 ! check for correct vector number
        bne     local_test_failed
        nop

	! Increment the thread to send next interrupt to.

trap_inc_thread:
	setx	PCI_E_INT_MAP_ADDR, %l0, %l7
	setx	0x2000000, %l0, %l5
	ldx	[%l7], %l6
	addx	%l6, %l5, %l6
	stx	%l6, [%l7]
	membar	#Sync

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
        .word   0xffffffff
        .word   0xffffffff
        .word   0xffffffff
        .word   0xffffffff
user_data_end:
.end

/************************************************************************/
