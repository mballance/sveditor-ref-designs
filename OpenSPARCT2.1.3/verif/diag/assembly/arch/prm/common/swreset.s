/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: swreset.s
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
#define SPU_TIMEOUT 0x100

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
	call	my_trap_code; \
	nop; \
	retry; \
	nop; 

#include "hboot.s"
#include "asi_s.h"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
	ta	T_CHANGE_HPRIV

!
! Thread 0 Start
!
thread_0:

	!  PCX Load, CPX Load Return

	setx	user_data_start, %g1, %g2
        setx    0x8900000808, %g3, %g4

load:
	ldx	[%g2], %l6
	brz	%l6, swreset
	add	%l6, 1, %l6
	ba	test_passed

swreset:
	stx	%l6, [%g2]
	set 	0x1, %g5
	stx	%g5, [%g4]
	ldx	[%g4], %g6
 	nop

	

/**********************************************************************
 *  Common code.
 *********************************************************************/

test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD

	! Assumes that %o0 contains VA that maps to L2$ line to be flushed,
	! and %o7 contains the return address.  The flush is done by
	! doing 16 loads from different addresses that alias to that line.
	! Note that this will cause a writeback if the L2$ line is dirty.
	! The registers %o1, %o2, %o3, %o4 and %o5 are used.
	
**********************************************************************/

.global	my_trap_code

my_trap_code:
	! Increment the count
	
	setx	my_trap_count, %g6, %g7
	ld	[%g7], %g5
	add	%g5, 1, %g5
	st	%g5, [%g7]
	membar	#Sync

	! Clear the interrupt

	ldxa	[%g0]ASI_SWVR_INTR_R, %g3

	jmpl	%o7+0x8, %g0
	nop

	
/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
	.xword 0x0000000000000000

my_trap_count:
	.xword 0x0

user_data_end:



	.align	0x40000		! each 246kb, 0x40000, aliases to same L2$ line
alias1:
	.skip	1024

.end


