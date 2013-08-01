/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_MAC.s
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

thread_0:

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


/*	Initialize the NIU        */

#include "niu_init_rx.h"	! Temporary added this initialization.  Need to merg with niu_init.h
!#include "niu_init.h"
!
! Thread 0 Start
!
!

Init_flow: 
	nop			! $EV trig_pc_d(1, @VA(.MAIN.Init_flow)) -> RxGenConfig()
	nop

rx_begin:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.rx_begin)) -> printf("Configuration for Rx port",*,1)
	
Gen_Packet:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.Gen_Packet)) -> Rxpktgen(0,10)

	setx    TX_CS, %g1, %g2
        nop     
        setx    Rx_loop_count, %g1, %g4
delay_loop:
	ldx	[%g2], %g5
	nop
	nop
	nop
	nop
	dec	%g4
	brnz	%g4, delay_loop
	nop

	! Have the 2 interrupts occured?

intr_check:
	setx	user_data_start, %g1, %g2
	ldx	[%g3], %g7
	cmp	%g7, 2
	bne	test_failed
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

	! Re-enable the interrupt in the NIU
Trap3:	
	setx	0x8100800018, %g1, %g2		! LDGIMGN
	setx	0x80000001, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

        jmpl    %o7+0x8, %g0
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
        .word   0x0
	.word	0x0

SECTION       descriptor data_va=0x100000200
attr_data {
	Name = descriptor,
	hypervisor,
	compressimage
	}
.data
descriptor:
        .xword 0x00008967452301
        .xword 0x08008967452301
        .xword 0x10008967452301
        .xword 0x18008967452301
        .xword 0x20008967452301
        .xword 0x28008967452301
        .xword 0x30008967452301
        .xword 0x38008967452301
        .xword 0x40008967452301
        .xword 0x48008967452301
        .xword 0x50008967452301
        .xword 0x58008967452301
        .xword 0x60008967452301
        .xword 0x68008967452301
        .xword 0x70008967452301
        .xword 0x78008967452301
        .xword 0x80008967452301
        .xword 0x88008967452301
        .xword 0x90008967452301
        .xword 0x98008967452301

/************************************************************************/
