/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_ncu_regs_rw.s
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

#include "hboot.s"
#include "asi_s.h"
#include "ncu_defines.h"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:

	! Switch to hypervisor mode.

	ta	T_CHANGE_HPRIV
	nop
	ta	T_CHANGE_PRIV
	nop
pstate:	
	rdpr	%pstate, %l0
	and	%l0, 0x2, %l1
	wrpr	%l0, %l1, %pstate	! Disable interrupts

	setx	-1, %l0, %l7			! l7 = data of all 1's

	! Test the 128 INT_MAN regs.

int_man0:
	setx	INT_MAN, %l0, %l1
	set	INT_MAN_COUNT, %l2

	! First store data of all 1's
int_man_loop_top0:
	stx	%l7, [%l1]
	add	%l1, INT_MAN_STEP, %l1
	cmp	%l2, 1
	bne	int_man_loop_top0
	add	%l2, -1, %l2

int_man1:
	setx	INT_MAN, %l0, %l1
	set	INT_MAN_COUNT, %l2
	setx	0x3f3f, %l0, %l3	! expected data

	! Read and test the data, only bits [13:8] and [5:0] are R/W
int_man_loop_top1:
	ldx	[%l1], %l4
	add	%l1, INT_MAN_STEP, %l1
	cmp	%l4, %l3
	bne	test_failed
	nop
	cmp	%l2, 1
	bne	int_man_loop_top1
	add	%l2, -1, %l2
	
int_man2:
	setx	INT_MAN, %l0, %l1
	set	INT_MAN_COUNT, %l2

	! First store data of all 0's
int_man_loop_top2:
	stx	%g0, [%l1]
	add	%l1, INT_MAN_STEP, %l1
	cmp	%l2, 1
	bne	int_man_loop_top2
	add	%l2, -1, %l2

int_man3:
	setx	INT_MAN, %l0, %l1
	set	INT_MAN_COUNT, %l2

	! Read and test the data
int_man_loop_top3:
	ldx	[%l1], %l4
	add	%l1, INT_MAN_STEP, %l1
	cmp	%l4, 0
	bne	test_failed
	nop
	cmp	%l2, 1
	bne	int_man_loop_top3
	add	%l2, -1, %l2


	! Test the MONDO_INT_VEC register

mondo_int_vec1:
	setx	MONDO_INT_VEC, %l0, %l1
	orn	%g0, %g0, %l2
	stx	%l2, [%l1]		! write data of all 1's
	membar	#Sync

	set	0x3f, %l3
	ldx	[%l1], %l4
	cmp	%l4, %l3
	bne	test_failed		! Only bits [5:0] are R/W, rest R0
	nop

mondo_int_vec2:
	stx	%g0, [%l1]		! write data of all 0's
	membar	#Sync

	ldx	[%l1], %l4
	cmp	%l4, %g0
	bne	test_failed
	nop

	! Test the Interrupt Vector Dispatch Register
	! Note that this is a write only register

int_vec_dis1:
	wr      %g0, INT_VEC_DIS, %asi
	orn	%g0, %g0, %l3
	stxa	%l3, [%g0]%asi		! write data of all 1's
	membar	#Sync

int_vec_dis2:
	stxa	%g0, [%g0]%asi		! write data of all 0's
	membar	#Sync

	! Test the Mondo Interrupt Registers
	! Can't be tested until a mondo interrupt occurs
	! which is beyond the scope of this diag.

	ba	test_passed
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
	.word	0x0
	.word	0x0
user_data_end:	
.end



