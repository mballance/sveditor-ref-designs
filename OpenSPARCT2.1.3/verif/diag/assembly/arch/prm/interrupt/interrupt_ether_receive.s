/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_ether_receive.s
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
        ta T_CHANGE_PRIV
        nop

/*	Initialize the NCU for the interrupt.	*/

	! Disable interrupts

no_intr:
	rdpr	%pstate, %g7
	xor	%g7, 0x2, %g7		! Reset interrupt enable
	wrpr	%g7, %pstate

ncu_init:
	! Initially set all the Interrupt Management Registers
	! Later will set all those not used to have a different vector number

	setx	INT_MAN, %g1, %g2	! %g2 = INT_MAN reg. addr.
	setx	INT_MAN_COUNT, %g1, %g4	! %g4 = INT_MAN reg. count value
	set	1, %g5			! %g5 = value to write to INT_MAN reg.

niu_init_loop_top:
        stx     %g5, [%g2]
        add     %g2, INT_MAN_STEP, %g2
        cmp     %g4, 1
        bne     niu_init_loop_top
        add     %g4, -1, %g4

	! Enable interrupts

yes_intr:
	rdpr	%pstate, %g7
	or	%g7, 0x2, %g7		! Set interrupt enable
	wrpr	%g7, %pstate

	! Kick off an interrupt, by simply starting up the RX channel
	! There is a config. error that will cause the interrupt.

reset_rx:
	setx	RXDMA_CFIG1, %g1, %g2	! using Rx DMA channel 0

	! First 0 -> EN of RXDMA_CFIG1
	
	stxa	%g0, [%g2]ASI_PRIMARY_LITTLE
	membar	#Sync

	! Next do the reset, 1 -> RST of RXDMA_CFIG1

	setx	0x40000000, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	! Reset the channel
	membar	#Sync

	! Wait for reset to be over

reset_rx_wait:
	setx	0x80, %g1, %g4			! timeout value
	setx	0x20000000, %g1, %g3		! QST bit in RXDMA_CFIG1

reset_rx_wait_loop:
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %g1
	cmp	%g1, %g3			! Look for QST 1, RST 0
	beq	config_rx
	dec	%g4
	cmp	%g4, 0
	beq	local_test_failed
	nop

	! Now the DMA channel can be configured

config_rx:
	NIU_RX_DMA_INTR_ON_CFIGLOGPAGE(0, 0, 64, %i1, %i2, %i3, %i4)

	! Finally the RX DMA channel can be enabled.

enable_rx:
	setx	0x80000000, %g1, %g3		! EN bit in RXDMA_CFIG1
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	! Enable the channel
	membar	#Sync


	! Has an interrupt occured
intr_check:
	setx	0x100, %g1, %6
	setx	user_data_start, %g1, %g2

intr_check_loop:
	ld	[%g2], %g7
	cmp	%g7, 1
	be	test_passed
	nop
	cmp	%g6, 0
	bgt	intr_check_loop
	dec	%g6

	! Done registers to see current state if failed.
bad_bad:
	setx	RX_DMA_CTL_STAT_DBG, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o1
	setx	RX_DMA_CTL_STAT, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o2
	setx	RXDMA_CFIG2_Addr, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o3
	setx	RXDMA_CFIG1_Addr, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o4
	setx	RX_DMA_ENT_MSK, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o5
	setx	SID, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o6
	setx	LDGITMRES, %g1, %g2	
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %o7
	setx	LDGIMGN, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %i1
	setx	LDG_NUM, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %i2
	setx	LD_IM0, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %i3
	setx	LDSV0, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %i4
	setx	LDSV1, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %i5
	membar	#Sync

	ba	local_test_failed
	nop


/**********************************************************************
   Interrupt trap handler.
**********************************************************************/

.global my_trap_code

my_trap_code:

        setx    user_data_start, %l2, %l6

        ! Increment the count
Trap1:
        ld      [%l6], %l5
        add     %l5, 1, %l5
        st      %l5, [%l6]
        membar  #Sync

        ! Clear the interrupt
Trap2:
        ldxa    [%g0]ASI_SWVR_INTR_R, %l3

        jmpl    %o7+0x8, %g0
        nop


	
test_passed:
	nop			
	EXIT_GOOD


local_test_failed:
	EXIT_BAD


/************************************************************************
   Test case data start
 ************************************************************************/

.align	1024
.data
.global	mailbox
user_data_start:
        .word   0x0, 0x0

.align 64
mailbox:	.skip 1024

user_data_end:

