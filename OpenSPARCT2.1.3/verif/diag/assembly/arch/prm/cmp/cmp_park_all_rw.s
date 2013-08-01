/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: cmp_park_all_rw.s
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

#include "hboot.s"
#include "ncu_defines.h"



/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

	/* Get thread ID */

        ta      T_RD_THID

	/* Wait until this thread's turn to run. */
start_loop:
	setx	0x1000, %g1, %g7
	setx	user_data_start, %g1, %g2

start_loop_top:
	cmp	%g7, 0
	beq	local_test_failed		! timeout failure
	dec	%g7
	
	ldx	[%g2], %g6
	cmp	%o1, %g6
	bne	start_loop_top
	nop

	/* Attempt to park all threads. */
diag_0:
        setx    ASI_CMP_CORE_RUNNING_RW, %g1, %g2
        setx    ASI_CMP_CORE_RUNNING_STATUS, %g1, %g3
	stxa	%g0, [%g2]ASI_CMP_CORE

	/* Wait to give time for threads to park. */
park_wait_loop:
	set	0x40, %g7

park_wait_loop_top:
	cmp	%g7, 0
	bne	park_wait_loop_top
	dec	%g7

	/* Check CORE_RUNNING_RW and CORE_RUNNING_STATUS registers
	   indicate that only this thread is running. */
diag_1:
        ta      T_RD_THID
	set	1, %g4
	sllx	%g4, %o1, %g4
	
	ldxa	[%g2]ASI_CMP_CORE, %g5	! CORE_RUNNING_RW
	ldxa	[%g3]ASI_CMP_CORE, %g6	! CORE_RUNNING_STATUS
	cmp	%g5, %g6
	bne	local_test_failed	! should be same by now
	cmp	%g6, %g4
	bne	local_test_failed	! should only be this thread unparked
	nop

	/* Unpark all threads. */

	orn	%g0, %g0, %g4
	stxa	%g4, [%g2]ASI_CMP_CORE		! CORE_RUNNING_RW

	/* Wait to give time for threads to unpark. */
unpark_wait_loop:
	set	0x40, %g7

unpark_wait_loop_top:
	cmp	%g7, 0
	bne	unpark_wait_loop_top
	dec	%g7

	/* Check CORE_RUNNING_RW and CORE_RUNNING_STATUS registers
	   indicated that only this thread is running. */
diag_2:
	ldxa	[%g2]ASI_CMP_CORE, %g5	! CORE_RUNNING_RW
	ldxa	[%g3]ASI_CMP_CORE, %g6	! CORE_RUNNING_STATUS
	cmp	%g5, %g6
	bne	local_test_failed	! should be same by now
	orn	%g0, %g0, %g4
	cmp	%g6, %g4
	bne	local_test_failed	! all threads should be running now
	nop

	/* Signal the next thread to do its testing. */
diag_3:
	setx	user_data_start, %g1, %g5
	ldx	[%g5], %g6
	inc	%g6
	stx	%g6, [%g5]

	/* Wait until all threads are done. */
end_wait_loop:
	setx	0x1000, %g1, %g7
	
end_wait_loop_top:
	cmp	%g7, 0
	beq	local_test_failed		! fail on a timeout
	dec	%g7
	
	ldx	[%g5], %g4
	cmp	%g4, 64				! 64 indicates all threads done
	bne	end_wait_loop_top
	nop

	/* Done */

	ba	test_passed
	nop



test_passed:
	EXIT_GOOD

local_test_failed:
	EXIT_BAD



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
