/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_INT_MAN_thread.s
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

#ifndef SYNC_THREADS
#define SYNC_THREADS	0xff
#endif

#ifndef DIAG_NUM_THREADS
#define DIAG_NUM_THREADS	8
#endif

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
        call    my_trap_code; \
        nop; \
        retry; \
        nop; 

#include "hboot.s"
#include "niu_defines.h"
#include "ncu_defines.h"
#include "niu_macros.h"
#include "cmp_macros.h"



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

	ba	main_t1_to_t63		! Branch if not thread 0
	nop


/************************************************************************
   Thread 0 code
 ************************************************************************/
	
main_t0:
	ta T_CHANGE_HPRIV
	nop

/*      Initialize the NCU for the interrupt.   */

        ! Disable interrupts

no_intr:
        rdpr    %pstate, %g7
        xor     %g7, 0x2, %g7           ! Reset interrupt enable
        wrpr    %g7, %pstate

ncu_init:
        ! Initially set all the Interrupt Management Registers
        ! Later will set all those not used to have a different vector number

        setx    INT_MAN, %g1, %g2       ! %g2 = INT_MAN reg. addr.
        setx    INT_MAN_COUNT, %g1, %g4 ! %g4 = INT_MAN reg. count value

niu_init_loop_top:
        stx     %g0, [%g2]
        add     %g2, INT_MAN_STEP, %g2
        cmp     %g4, 1
        bne     niu_init_loop_top
        add     %g4, -1, %g4

	! Initialize the NIU for TX DMA interrupt.

        NIU_TX_LD_IM0_INTR_ON_MARK( 0, %g1, %g2, %g3, %g4, 0, 0 )

        ! Enable interrupts

yes_intr:
        rdpr    %pstate, %g7
        or      %g7, 0x2, %g7           ! Set interrupt enable
        wrpr    %g7, %pstate

	! Wait for other threads to be ready

	SYNC_THREAD_MAIN( local_test_failed, %g1, %g2, %g3 )

	! All threads are ready

        ! Generate the interrupt via PIO write

gen_intr:
        setx    TDMC_INTR_DBG, %g1, %g2
	mov	%g0, %g7		! DMA channel 0
        setx    TDMC_STEP, %g1, %g3
        mulx    %g7, %g3, %g7
        add     %g2, %g7, %g2

        setx    0x8000, %g1, %g4
        stxa    %g4, [%g2]ASI_PRIMARY_LITTLE

	! Wait for an interrupt to occur

wait1:			
	setx	0x800, %g1, %g4
	setx	old_intr_count, %g1, %g3
	ld	[%g3], %g6
	inc	%g6
	setx	user_data_start, %g1, %g5

delay_loop1:

	ld	[%g5], %g7
	cmp	%g7, %g6
	be	intr_occured
	nop
	dec	%g4
	brnz	%g4, delay_loop1
	nop
	ba	local_test_failed
	nop

intr_occured:
	st	%g7, [%g3]		! update old_intr_count

	! Branch back to do next interrupt.
next_intr:
	setx	user_data_start, %g1, %g3
	ld	[%g3], %g2
	cmp	%g2, DIAG_NUM_THREADS
	blt	gen_intr
	nop
	ba	test_passed
	nop


/************************************************************************
   Thread 1 to 63 code
 ************************************************************************/

	! Get thread id

main_t1_to_t63:
        ta      T_RD_THID

	! Sync up with other threads

	SYNC_THREAD_OTHER( %o1, %g1, %g2 )

	! Wait for interrupt to this thread
	
wait_t1_to_t63:		
	setx	user_data_start, %g1, %g7
	add	%o1, 1, %o1		! Thread id is incremented on interrupt

t1_to_t63_delay_loop:
	ld	[%g7], %g6
	cmp	%g6, %o1
	bge	test_passed
	nop
	ba	t1_to_t63_delay_loop
	nop

	ba	local_test_failed
	nop
	

test_passed:
	EXIT_GOOD

local_test_failed:

	! Read related interrupt registers to aid debugging

read_1:
	ldxa	[%g0]ASI_INTR_RECEIVE, %i0
        ldxa    [%g0]ASI_SWVR_INTR_R, %i1
read_2:
        setx    INT_MAN, %g1, %g2
	ldx	[%g2], %i2
read_3:
	set	32, %g3			! index for logical device number
	setx	LDG_NUM_STEP, %g1, %g4
	mulx	%g4, %g3, %g3
	setx	LDG_NUM, %g1, %g2
	add	%g3, %g2, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %i3
	setx	LDSV0, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %i4
	setx	LDSV1, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %i5
	setx	LDSV2, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %i6
	set	32, %g3			! index for logical device number
	setx	LD_IM0_STEP, %g1, %g4
	mulx	%g4, %g3, %g3
	setx	LD_IM0, %g1, %g2
	add	%g3, %g2, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %i7
	setx	LDGIMGN, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o1
	setx	LDGITMRES, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o2
	setx	SID, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o3
read_4:
	setx	TX_ENT_MSK, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o4
	setx	TX_CS, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o5
	setx	TDMC_INTR_DBG, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o6

	EXIT_BAD


/**********************************************************************
   Interrupt trap handler.
**********************************************************************/

.global my_trap_code

my_trap_code:

	! Get the thread id.
	ta      T_RD_THID		! %o1 = thread id

	! Check that interrupt went to correct thread.
Trap0:
        setx    user_data_start, %l2, %l6
        ld      [%l6], %l5
	cmp	%l5, %o1
	bne	local_test_failed
	nop	

	! Change the thread id to use in the NCU for next interrupt
Trap1:
	add	%l5, 1, %l5
	sllx	%l5, 8, %l5		! put thread id in proper position
        setx    INT_MAN, %l1, %l2       ! %g2 = INT_MAN reg. addr.
	stx	%l5, [%l2]
	membar	#Sync

	! The following order is important, if reversed a second
	! interrupt occurs on same condition.

        ! Re-enable the interrupt in the NIU
Trap2:
        setx    TX_CS, %g1, %g2			! TX_CS, Tx DMA channel 0
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g1	! Reset MK
        nop

        ! Re-enable the interrupt in the NIU
Trap3:
        setx    LDGIMGN, %g1, %g2		! logical device group 0
        setx    0x80000001, %g1, %g3
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
        nop

        ! Clear the interrupt in the core.
Trap4:
        ldxa    [%g0]ASI_SWVR_INTR_R, %l3

        ! Increment the interrupt count.
Trap5:
        setx    user_data_start, %l2, %l6
        ld      [%l6], %l5
        add     %l5, 1, %l5
        st      %l5, [%l6]
        membar  #Sync

        jmpl    %o7+0x8, %g0
        nop




/************************************************************************
   Test case data start
 ************************************************************************/

.align	1024
.data
user_data_start:
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
old_intr_count:	
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0


/* These initialization is temporary, as there looks some bug in mempli */

SECTION       SetRngConfig_init data_va=0x100000000
attr_data {
        Name = SetRngConfig_init,
        hypervisor,
        compressimage
        }
.data
SetRngConfig_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetTxRingKick_init data_va=0x100000100
attr_data {
        Name = SetTxRingKick_init,
        hypervisor,
        compressimage
        }
.data
SetTxRingKick_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetTxLPMask1_init data_va=0x100000200
attr_data {
        Name = SetTxLPMask1_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPMask1_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetTxLPValue1_init data_va=0x100000300
attr_data {
        Name = SetTxLPValue1_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPValue1_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetTxLPRELOC1_init data_va=0x100000400
attr_data {
        Name = SetTxLPRELOC1_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPRELOC1_init:
        .xword 0x0060452301000484
/************************************************************************/
SECTION       SetTxLPMask2_init data_va=0x100000500
attr_data {
        Name = SetTxLPMask2_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPMask2_init:
        .xword 0x0060452301000484
/************************************************************************/
SECTION       SetTxLPValue2_init data_va=0x100000600
attr_data {
        Name = SetTxLPValue2_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPValue2_init:
        .xword 0x0060452301000484

/************************************************************************/
SECTION       SetTxLPRELOC2_init data_va=0x100000700
attr_data {
        Name = SetTxLPRELOC2_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPRELOC2_init:
        .xword 0x0060452301000484

/************************************************************************/
SECTION       SetTxLPValid_init data_va=0x100000800
attr_data {
        Name = SetTxLPValid_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPValid_init:
        .xword 0x0060452301000484

/************************************************************************/
