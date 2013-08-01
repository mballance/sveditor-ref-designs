/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_intlevel_121503.s
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
! Enable main section to run in PRIV mode
#define MAIN_PAGE_NUCLEUS_ALSO

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!Override trap handler definitions
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! Trap should set %l6=TT which is verified in main program
!  and set %pil=15 or clear %softint
!  to keep trap from firing again on return from trap

#define MY_GENERIC_TRAP \
	mov    0xf,	%l3;  \
	wrpr	%l3,	%l7,	%pil;  \
	rdpr    %tt, %l6; \
	inc	%i7; \
	retry; \
	nop;
	
#define H_T0_Interrupt_Level_1_0x41
#define My_T0_Interrupt_Level_1_0x41 MY_GENERIC_TRAP
	
#define H_T0_Interrupt_Level_2_0x42
#define My_T0_Interrupt_Level_2_0x42 MY_GENERIC_TRAP

#define H_T0_Interrupt_Level_3_0x43
#define My_T0_Interrupt_Level_3_0x43 MY_GENERIC_TRAP

#define H_T0_Interrupt_Level_4_0x44
#define My_T0_Interrupt_Level_4_0x44 MY_GENERIC_TRAP

#define H_T0_Interrupt_Level_5_0x45
#define My_T0_Interrupt_Level_5_0x45 MY_GENERIC_TRAP

#define H_T0_Interrupt_Level_6_0x46
#define My_T0_Interrupt_Level_6_0x46 MY_GENERIC_TRAP

#define H_T0_Interrupt_Level_7_0x47
#define My_T0_Interrupt_Level_7_0x47 MY_GENERIC_TRAP

#define H_T0_Interrupt_Level_8_0x48
#define My_T0_Interrupt_Level_8_0x48 MY_GENERIC_TRAP

#define H_T0_Interrupt_Level_9_0x49
#define My_T0_Interrupt_Level_9_0x49 MY_GENERIC_TRAP

#define H_T0_Interrupt_Level_10_0x4a
#define My_T0_Interrupt_Level_10_0x4a MY_GENERIC_TRAP

#define H_T0_Interrupt_Level_11_0x4b
#define My_T0_Interrupt_Level_11_0x4b MY_GENERIC_TRAP

#define H_T0_Interrupt_Level_12_0x4c
#define My_T0_Interrupt_Level_12_0x4c MY_GENERIC_TRAP

#define H_T0_Interrupt_Level_13_0x4d
#define My_T0_Interrupt_Level_13_0x4d MY_GENERIC_TRAP

#define H_T0_Interrupt_Level_14_0x4e
#define My_T0_Interrupt_Level_14_0x4e MY_GENERIC_TRAP

#define H_T0_Interrupt_Level_15_0x4f
#define My_T0_Interrupt_Level_15_0x4f MY_GENERIC_TRAP
	
#define CREGS_PSTATE_IE 1     ! Set PSTATE.IE=1

#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

	ta T_CHANGE_PRIV     ! Change to PRIV mode

	! local reg usage for this diag
	! %l0 = 0x0 always
	! %l1 = n = interrupt level
	! %l2 = tmp register
	! %l3 = tmp register
	! %l4 = SOFTINT value
	! %l5 = PIL value
	! %l6 = TT value
	! %l7 = tmp register
	! %i7 = number of traps taken

init:	
	! Clear local regs for scratch registers
	nop
	mov    0x0,	%l0
	mov    0x0,	%l1
	mov    0x0,	%l2
	mov    0x0,	%l3
	mov    0x0,	%l4
	mov    0x0,	%l5
	mov    0x0,	%l6
	mov    0x0,	%i7
	nop

	! Verify interrupt_level_n  (where n=1..15) one at a time

	! Turn off interrupts by setting PIL=15
	mov    0xf,	%l3	
	wrpr	%l3,	%l7,	%pil

	! Set loop cnt = n = interrupt_level
	mov	0xf,	%l1

intr_loop:
	! Set %l6=0x0
	mov    0x0,	%l6
	! Write n to SOFTINT
	mov	0x1,	%l2
	sll	%l2,	%l1,	%l4
	wr	%l4,	%l7,	%set_softint
	! Write n-1 to PIL
	sub	%l1,	0x1,	%l5
	wrpr	%l5,	%l7,	%pil
	nop

chk_trap:
	! Turn off SOFTINT bit	
	wr	%l4,	%l7,	%clear_softint
	! Verify that trap was taken, %l6=TT=0x40+n
	sub	%l6,	0x40,	%l2
	cmp	%l2,	%l1
	bne	failed
	nop

go_loop:	
	!Decrement loop cnt, repeat 15 times
	dec	%l1
	cmp	%l1,	0x0
	bne	intr_loop
	nop

	! Verify we took 15 traps
	cmp	%i7,	0xf
	bne	failed
	nop

misc:
	! Set PIL=15
	mov	0xf,    %l3	
	wrpr	%l3,	%l7,	%pil

	! Rd/Wr SOFTINT Directly
	! Set SOFTINT
	setx	0x1ffff,	%l7,	%l2
	wr	%l2,	%l7,	%softint
	clr	%l3
	rd	%softint,	%l3
	cmp	%l3,	%l2
	bne	failed

	! Clear SOFTINT
	clr	%l2
	wr	%l2,	%l7,	%softint
	clr	%l3
	rd	%softint,	%l3
	cmp	%l3,	%l2
	bne	failed
	nop
	
passed:
	EXIT_GOOD	/* test finish  */

failed:
	EXIT_BAD


/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.word 0xB52E8698
.end

