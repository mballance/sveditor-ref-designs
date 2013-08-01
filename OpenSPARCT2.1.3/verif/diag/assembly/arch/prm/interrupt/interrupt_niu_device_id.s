/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_niu_device_id.s
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



/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

/*      Initialize the NCU for the interrupt.   */

        ! Disable interrupts

no_intr:
        rdpr    %pstate, %g7
        xor     %g7, 0x2, %g7           ! Reset interrupt enable
        wrpr    %g7, %pstate

ncu_init1:
        ! Initially set all the Interrupt Management Registers

        setx    INT_MAN, %g1, %g2       ! %g2 = INT_MAN reg. addr.
        setx    INT_MAN_COUNT, %g1, %g3 ! %g3 = INT_MAN reg. count value
	srax	%g3, 1, %g4
	mov	%g0, %g7

ncu_init_loop_top1:
        stx     %g7, [%g2]
	add	%g7, 1, %g7		! increment the vector number
        addx    %g2, INT_MAN_STEP, %g2
        cmp     %g4, 1
        bne     ncu_init_loop_top1
        add     %g4, -1, %g4

	! The second half of the Interrupt Management Registers
	! get a decrementing value for vector number.

ncu_init2:
	srax	%g3, 1, %g4
	setx	63, %g1, %g7
	
ncu_init_loop_top2:	
        stx     %g7, [%g2]
	sub	%g7, 1, %g7		! decrement the vector number
        addx    %g2, INT_MAN_STEP, %g2
        cmp     %g4, 1
        bne     ncu_init_loop_top2
        add     %g4, -1, %g4
		

        ! Initialize the NIU for TX DMA interrupt.

        NIU_TX_LD_IM0_INTR_ON_MARK( 0, %g1, %g2, %g3, %g4, 0, 64 )

	setx	user_data_start, %g1, %2
	set	0x3f, %g1
	st	%g1, [%g2]		! Record first device number used

        ! Enable interrupts

yes_intr:
        rdpr    %pstate, %g7
        or      %g7, 0x2, %g7           ! Set interrupt enable
        wrpr    %g7, %pstate

        ! Generate the interrupt via PIO write

gen_intr:
        setx    TDMC_INTR_DBG, %g1, %g2
        setx    0x8000, %g1, %g4		! Force the MK flag
        stxa    %g4, [%g2]ASI_PRIMARY_LITTLE

        ! Have 16 interrupts occured?

intr_check:
	setx	0x1000, %g1, %g4		! timeout loop count
        setx    user_data_start, %g1, %g2

intr_check_loop:
        ld      [%g2], %g7
        cmp     %g7, 49
        be      test_passed
        dec	%g4

	cmp	%g4, 0
	bne	intr_check_loop
	nop

	ba	local_test_failed
	nop


!	! Now do 64 more interrupts to use reset of Interrupt Management regs.
!
!        ! Generate the interrupt via PIO write
!
!part_two:
!	setx	half_time_flag, %g1, %g2
!	set	1, %g3
!	st	%g3, [%g2]
!
!        ! Have 65 more interrupts occured?

!intr_check_2:
!	setx	0x1000, %g1, %g4		! timeout loop count
!        setx    user_data_start, %g1, %g2
!
!intr_check_loop_2:
!        ld      [%g2], %g7
!        cmp     %g7, 0
!        be      test_passed
!        dec	%g4
!
!	cmp	%g4, 0
!	bne	intr_check_loop_2
!	nop
!
!	ba	local_test_failed
!	nop


	
test_passed:
	EXIT_GOOD

local_test_failed:
	EXIT_BAD


/**********************************************************************
   Interrupt trap handler.
**********************************************************************/

.global my_trap_code

my_trap_code:

	!!! Careful when changing this interrupt trap handler code
	!!! Several registers need to keep their values throughout
	!!! the whole trap handler.  So check before making changes!!!

	! Get the expected vector number.

	ldxa	[%g0]ASI_INTR_RECEIVE, %g1
        setx    user_data_start, %l2, %l6
        ld      [%l6], %l5

        ! Clear the interrupt in the core & get vector number
Trap1:
        ldxa    [%g0]ASI_SWVR_INTR_R, %l3
	cmp	%l3, %l5
	bne	local_test_failed
	nop

!        ! Increment/decrement the expected vector number.
!Trap2:
!	setx	half_time_flag, %l1, %l2
!	ld	[%l2], %l3
!	cmp	%l3, 1
!	be	Trap_dec
!	nop
!
!	! Increment
!
!	cmp	%l5, 63			! If 63 & !half_time yet, don't change
!	be	Trap3
!	nop
!
!        add     %l5, 1, %l5
!	ba	Trap_store
!	nop

	! Decrement

Trap_dec:
        sub     %l5, 1, %l5

Trap_store:
        st      %l5, [%l6]
        membar  #Sync

	! Change the TX dma channel & logical device group to use.

	! Increment the Tx dma channel number

Trap3:	setx	tx_dma_num, %g1, %g2
	ld	[%g2], %g3

	! But first clear the interrupt in the NIU's Tx DMA channel

	setx	TDMC_STEP, %g1, %g5
	mulx	%g5, %g3, %g5
	setx	TX_CS, %g1, %g6
	addx	%g6, %g5, %g6
	ldxa	[%g6]ASI_PRIMARY_LITTLE, %g5	! Read clears interrupt, MK bit

Trap3_30:
	add	%g3, 1, %g3
	set	0xf, %g1
	and	%g3, %g1, %g3			! Only values 0->15 are value
	st	%g3, [%g2]			! for Tx dma channel numbers

	! Increment the logical device group number

Trap4:	
	setx	my_ldg_num, %g1, %g2
	ld	[%g2], %g4
	add	%g4, 1, %g4
	st	%g4, [%g2]

	! Assign the Tx dma channel to the logical device group

Trap5:
	add	%g3, 32, %g7		! Convert Tx dma channel number
					! to logical device number
	setx	LDG_NUM_STEP, %g1, %g6
	mulx	%g6, %g7, %g6
	setx	LDG_NUM, %g1, %g5
	addx	%g5, %g6, %g5
	stxa	%g4, [%g5]ASI_PRIMARY_LITTLE

	! Enable interrupts for the logical device

Trap6:
	setx	LD_IM0_STEP, %g1, %g5
	mulx	%g5, %g7, %g5
	setx	LD_IM0, %g1, %g2
	addx	%g2, %g5, %g2
	stxa	%g0, [%g2]ASI_PRIMARY_LITTLE

	! Arm interrupts in the logical device group

Trap7:
	setx	LDGIMGN_STEP, %g1, %g6
	mulx	%g6, %g4, %g6
        setx    LDGIMGN, %g1, %g2          ! LDGIMGN
	addx	%g2, %g6, %g2
        setx    0x80000001, %g1, %g5
        stxa    %g5, [%g2]ASI_PRIMARY_LITTLE
        nop

	! Increment and set the device ID to send to the NCU

Trap8:
	setx	user_data_start, %g1, %g2
	ld	[%g2], %g6
	setx	SID_STEP, %g1, %g5
	mulx	%g5, %g4, %g5
	setx	SID, %g1, %g2
	addx	%g2, %g5, %g2
	stxa	%g6, [%g2]ASI_PRIMARY_LITTLE

	! Enable interrupts in th TX dma channel

Trap9:
	setx	TDMC_STEP, %g1, %g5
	mulx	%g5, %g3, %g5
	setx	TX_ENT_MSK, %g1, %g2
	addx	%g2, %g5, %g2
	stxa	%g0, [%g2]ASI_PRIMARY_LITTLE

	! Generate another interrupt, but no more that 16
Trap10:
	cmp	%l5, 48
	be	Trap12				! Branch if already done 16
	nop

Trap11:	
        setx    TDMC_STEP, %g1, %g7
        mulx    %g7, %g3, %g7
        setx    TDMC_INTR_DBG, %g1, %g2
        add     %g2, %g7, %g2

        setx    0x8000, %g1, %g5		! Force the MK flag
        stxa    %g5, [%g2]ASI_PRIMARY_LITTLE

	! Done

Trap12:
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
tx_dma_num:	
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
my_ldg_num:
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
half_time_flag:
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0

	

