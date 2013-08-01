/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_send_cc_all_thr.s
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
#define SYNC_THREADS	0xffffffffffffffff

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
	call	my_trap_code; \
	nop; \
	retry; \
	nop; 

#include "hboot.s"

#include "ncu_defines.h"
#include "cmp_macros.h"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:

	! Switch to hypervisor mode.

	ta	T_CHANGE_HPRIV
	nop

        ta      T_RD_THID
        cmp     %o1, 0
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
	mov	%g0, %g7		! %g7 = loop count
	mov	%o1, %g6		! %g6 = data for INT_VEC_DIS reg.
	wr	%g0, INT_VEC_DIS, %asi

	/* Turn off interrupts. */

t0_intr_off:
	rdpr	%pstate, %g1
	set	0x2, %g2
	andn	%g1, %g2,%g1
	wrpr	%g1, %g0, %pstate

        /* Sync up all the treads. */

sync_t0:
        SYNC_THREAD_MAIN( test_failed, %g1, %g2, %g3 )

	/* Send 1 interrupt, done twice, first is to fill Icache */

t0_send_1_intr:
	
	stxa	%g6, [%g0]%asi
	inc	%g7
	cmp	%g7, 1
	beq	sync_t0
	nop

	/* Turn on interrupts and handle the traps */

t0_get_intr_1:
	rdpr	%pstate, %g1
	set	0x2, %g2
	or	%g1, %g2,%g1
	wrpr	%g1, %g0, %pstate

	/* Wait for 64 interrupts to be taken. */

t0_intr_wait_1:
	setx	0x1000, %g1, %g2	! %g2 = timeout value
	setx	my_trap_count, %g1, %g3

t0_intr_wait_loop_1:
	ld	[%g3], %g4
	cmp	%g4, 64
	beq	t0_more
	dec	%g2

	cmp	%g2, 0
	beq	test_failed
	nop

	ba	t0_intr_wait_loop_1
	nop
	

	/* Set up to do 4 interrupts in at a time. */

t0_more:
	st	%g0, [%g3]		! Zero the interrupt count
	mov	%g0, %g7		! %g7 = loop count
	mov	%o1, %g6		! %g6 = data for INT_VEC_DIS reg.

	/* Turn off interrupts. */
t0_intr_off_again:	
	rdpr	%pstate, %g1
	set	0x2, %g2
	andn	%g1, %g2,%g1
	wrpr	%g1, %g0, %pstate

        /* Sync up all the treads. */

sync_t0_again:
        SYNC_THREAD_MAIN( test_failed, %g1, %g2, %g3 )

	/* Send 4 interrupts, done twice, first is to fill Icache */

t0_send_4_intr:
	stxa	%g6, [%g0]%asi
	stxa	%g6, [%g0]%asi
	stxa	%g6, [%g0]%asi
	stxa	%g6, [%g0]%asi
	inc	%g7
	cmp	%g7, 1
	beq	sync_t0_again
	nop

	/* Turn on interrupts and handle the traps */

t0_get_intr_2:
	rdpr	%pstate, %g1
	set	0x2, %g2
	or	%g1, %g2,%g1
	wrpr	%g1, %g0, %pstate

	/* Wait for 64 interrupts to be taken. */

t0_intr_wait_2:
	setx	0x1000, %g1, %g2	! %g2 = timeout value
	setx	my_trap_count, %g1, %g3

t0_intr_wait_loop_2:
	ld	[%g3], %g4
	cmp	%g4, 64
	beq	t0_done
	dec	%g2

	cmp	%g2, 0
	beq	test_failed
	nop

	ba	t0_intr_wait_loop_2
	nop

	/* T0 Done */

t0_done:
	ba	test_passed
	nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! All Threads Except 0 Start Here
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


main_t1_to_t63:	
	mov	%g0, %g7		! %g7 = loop count
	mov	%o1, %g6		! %g6 = data for INT_VEC_DIS reg.
	wr	%g0, INT_VEC_DIS, %asi

        /* Sync up all the treads. */

sync_t1_t63:
        SYNC_THREAD_OTHER( %g6,%g1,%g2 )

	/* Send 1 interrupt, done twice, first is to fill Icache */

t1_t63_send_1_intr:
	
	stxa	%g6, [%g0]%asi
	inc	%g7
	cmp	%g7, 1
	beq	sync_t1_t63
	nop

	/* Set up to do 4 interrupts in at a time. */

t1_t63_more:
	st	%g0, [%g3]		! Zero the interrupt count
	mov	%g0, %g7		! %g7 = loop count
	mov	%o1, %g6		! %g6 = data for INT_VEC_DIS reg.

        /* Sync up all the treads. */

sync_t1_t63_again:
        SYNC_THREAD_OTHER( %g6,%g1,%g2 )

	/* Send 4 interrupts, done twice, first is to fill Icache */

t1_t63_send_4_intr:
	stxa	%g6, [%g0]%asi
	stxa	%g6, [%g0]%asi
	stxa	%g6, [%g0]%asi
	stxa	%g6, [%g0]%asi
	inc	%g7
	cmp	%g7, 1
	beq	sync_t1_t63_again
	nop

	/* T1_T63 Done */

t1_t63_done:
	ba	test_passed
	nop


/**********************************************************************
   Interrupt trap handler.
**********************************************************************/

.global	my_trap_code

my_trap_code:

	! Only T1_T63 should get interrupts

        ta      T_RD_THID
	cmp	%o1, 0
	bne	test_failed
	nop

	! Increment the count
trap0:	
	setx	my_trap_count, %g6, %g7
	ld	[%g7], %g5
	add	%g5, 1, %g5
	st	%g5, [%g7]
	membar	#Sync

	! Read the core interrupt receive reg.
trap1:	
	ldxa	[%g0]ASI_SWVR_INTR_RECEIVE, %g4

	! Check the incomming vector register to make sure highest priority
	! interrupt was done first.
trap2:
	ldxa	[%g0]ASI_SWVR_INTR_R, %g5
	orn	%g0, %g0, %g1
	inc	%g5
	cmp	%g5, 64
	be	trap3		! skip check since this is highest possible priority
	nop

	sllx	%g1, %g5, %g1
	and	%g1, %g4, %g4
	brnz	%g4, test_failed
	nop

	! Done
trap3:	

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



