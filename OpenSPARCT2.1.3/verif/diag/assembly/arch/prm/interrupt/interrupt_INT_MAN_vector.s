/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_INT_MAN_vector.s
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
#define INTR_WAIT_COUNT 0x10

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

        ! Generate the interrupt via PIO write

gen_intr:
        setx    TDMC_INTR_DBG, %g1, %g2
	mov	%g0, %g7		! DMA channel 0
        setx    TDMC_STEP, %g1, %g3
        mulx    %g7, %g3, %g7
        add     %g2, %g7, %g2

        setx    0x8000, %g1, %g4
        stxa    %g4, [%g2]ASI_PRIMARY_LITTLE

        ! Do all the interrupts, 64, occur?

intr_check:
	setx	0x1000, %g1, %g4		! timeout loop count
        setx    user_data_start, %g1, %g2

intr_check_loop:
        ld      [%g2], %g7
        cmp     %g7, 64
        be      test_passed
        dec	%g4

	cmp	%g4, 0
	bne	intr_check_loop
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

	! Get the expected vector number.

        setx    user_data_start, %l2, %l6
        ld      [%l6], %l5

        ! Clear the interrupt in the core & get vector number
Trap1:
        ldxa    [%g0]ASI_SWVR_INTR_R, %l3
	cmp	%l3, %l5
	bne	local_test_failed
	nop

        ! Increment the expected vector number.
Trap2:
        add     %l5, 1, %l5
        st      %l5, [%l6]
        membar  #Sync

	! Change the vector number to use in the NCU
Trap3:
        setx    INT_MAN, %l1, %l2       ! %g2 = INT_MAN reg. addr.
	stx	%l5, [%l2]
	membar	#Sync

        ! Re-enable the interrupt in the NIU
Trap4:
        setx    LDGIMGN, %g1, %g2          ! LDGIMGN
        setx    0x80000001, %g1, %g3
        stxa    %g3, [%g2]ASI_PRIMARY_LITTLE
        nop

        ! Re-enable the interrupt in the transmit DMA channel
Trap5:
        setx    TX_CS, %g1, %g2			! TX_CS
        ldxa    [%g2]ASI_PRIMARY_LITTLE, %g0	! Reset MK
        nop

	! Generate another interrupt, but no more that 64
Trap6:
	cmp	%l5, 63
	be	Trap8				! Branch if already done 64
	nop

Trap7:	
        setx    TDMC_INTR_DBG, %g1, %g2
	mov	%g0, %g7			! DMA channel 0
        setx    TDMC_STEP, %g1, %g3
        mulx    %g7, %g3, %g7
        add     %g2, %g7, %g2

        setx    0x8000, %g1, %g4
        stxa    %g4, [%g2]ASI_PRIMARY_LITTLE

	! Done

Trap8:
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
