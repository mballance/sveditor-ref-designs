/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: cmp_master_park_unpark_all_rw.s
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
	nop
	cmp	%o1, 0
	be	main_t0			! branch if thread 0
	nop

	ba	main_t1_t63		! branch if not thread 0
	nop

/************************************************************************
   Thread 0 Code
 ************************************************************************/

	/* Park all the other threads one by one. */
main_t0:
#ifndef PORTABLE_CORE
	setx	ASI_CMP_CORE_RUNNING_RW, %g1, %g2
	orn	%g0, %g0, %g1
	set	0x2, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 1
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 2
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 3
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 4
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 5
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 6
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 7
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 8
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 9
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 10
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 11
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 12
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 13
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 14
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 15
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 16
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 17
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 18
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 19
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 20
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 21
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 22
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 23
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 24
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 25
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 26
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 27
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 28
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 29
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 30
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 31
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 32
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 33
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 34
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 35
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 36
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 37
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 38
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 39
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 40
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 41
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 42
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 43
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 44
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 45
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 46
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 47
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 48
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 49
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 50
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 51
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 52
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 53
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 54
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 55
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 56
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 57
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 58
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 59
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 60
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 61
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 62
	sllx	%g3, 1, %g3
	xor	%g1, %g3, %g1
	stxa    %g1, [%g2]ASI_CMP_CORE		! thread 63
#else
	/* First get complete thr ID, then bit in CMP_CORE_RUNNING_RW */

	ldxa    [%g0]ASI_INTR_ID, %o2
	set	0xff, %g7
	set	1, %g3
	sllx	%g7, %o2, %g7			! %g7 threads in this core
	sllx	%g3, %o2, %g3
	sllx	%g3, 1, %g3			! %g3 thread to park

	/* Park all the other threads in this core. */
t0_core_portable_1:
	setx	ASI_CMP_CORE_RUNNING_RW, %g1, %g2
	xor	%g7, %g3, %g7
	stxa    %g7, [%g2]ASI_CMP_CORE		! thread 1 of this core
	sllx	%g3, 1, %g3
	xor	%g7, %g3, %g7
	stxa    %g7, [%g2]ASI_CMP_CORE		! thread 2 of this core
	sllx	%g3, 1, %g3
	xor	%g7, %g3, %g7
	stxa    %g7, [%g2]ASI_CMP_CORE		! thread 3 of this core
	sllx	%g3, 1, %g3
	xor	%g7, %g3, %g7
	stxa    %g7, [%g2]ASI_CMP_CORE		! thread 4 of this core
	sllx	%g3, 1, %g3
	xor	%g7, %g3, %g7
	stxa    %g7, [%g2]ASI_CMP_CORE		! thread 5 of this core
	sllx	%g3, 1, %g3
	xor	%g7, %g3, %g7
	stxa    %g7, [%g2]ASI_CMP_CORE		! thread 6 of this core
	sllx	%g3, 1, %g3
	xor	%g7, %g3, %g7
	stxa    %g7, [%g2]ASI_CMP_CORE		! thread 7 of this core
#endif

	/* Check the CORE_RUNNING_RW and CORE_RUNNING_STATUS registers. */
t0_0:
        setx    ASI_CMP_CORE_RUNNING_RW, %g1, %g2
        setx    ASI_CMP_CORE_RUNNING_STATUS, %g1, %g3
	set	0x100, %g7
#ifdef	PORTABLE_CORE
	set	1, %o3
	sllx	%o3, %o2, %o3		! %o3 = this thread in CORE_RUNNING_RW
#endif

t0_loop_1_top:
	cmp	%g7, 0
	beq	local_test_failed		! fail on a timeout
	dec	%g7

	ldxa	[%g3]ASI_CMP_CORE, %g4		! CORE_RUNNING_STATUS
#ifndef	PORTABLE_CORE
	cmp	%g4, 1
#else
	cmp	%g4, %o3
#endif
	bne	t0_loop_1_top
	nop

t0_1:
	ldxa	[%g2]ASI_CMP_CORE, %g5		! CORE_RUNNING_RW
	cmp	%g4, %g5
	bne	local_test_failed		! fail on RW != STATUS
	nop

	/* Now unpark all the other threads one by one. */
t0_2:
#ifndef PORTABLE_CORE
	setx	ASI_CMP_CORE_RUNNING_RW, %g1, %g2
	set	1, %g1
	set	2, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 1
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 2
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 3
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 4
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 5
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 6
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 7
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 8
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 9
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 10
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 11
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 12
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 13
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 14
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 15
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 16
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 17
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 18
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 19
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 20
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 21
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 22
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 23
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 24
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 25
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 26
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 27
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 28
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 29
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 30
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 31
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 32
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 33
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 34
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 35
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 36
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 37
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 38
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 39
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 40
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 41
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 42
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 43
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 44
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 45
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 46
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 47
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 48
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 49
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 50
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 51
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 52
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 53
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 54
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 55
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 56
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 57
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 58
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 59
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 60
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 61
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 62
	sllx	%g3, 1, %g3
	or	%g1, %g3, %g1
	stxa	%g1, [%g2]ASI_CMP_CORE		! thread 63
#else
	/* Now unpark other threads in this core. */

	setx	ASI_CMP_CORE_RUNNING_RW, %g1, %g2
	set	1, %g7
	sllx	%g7, %o2, %g7			! %g7 this thread
	sllx	%g7, 1, %g6			! %g6 next thread to unpark
	or	%g7, %g6, %g7
	stxa	%g7, [%g2]ASI_CMP_CORE		! thread 1
	sllx	%g6, 1, %g6
	or	%g7, %g6, %g7
	stxa	%g7, [%g2]ASI_CMP_CORE		! thread 2
	sllx	%g6, 1, %g6
	or	%g7, %g6, %g7
	stxa	%g7, [%g2]ASI_CMP_CORE		! thread 3
	sllx	%g6, 1, %g6
	or	%g7, %g6, %g7
	stxa	%g7, [%g2]ASI_CMP_CORE		! thread 4
	sllx	%g6, 1, %g6
	or	%g7, %g6, %g7
	stxa	%g7, [%g2]ASI_CMP_CORE		! thread 5
	sllx	%g6, 1, %g6
	or	%g7, %g6, %g7
	stxa	%g7, [%g2]ASI_CMP_CORE		! thread 6
	sllx	%g6, 1, %g6
	or	%g7, %g6, %g7
	stxa	%g7, [%g2]ASI_CMP_CORE		! thread 7
#endif

	/* Check the CORE_RUNNING_RW and CORE_RUNNING_STATUS registers. */
t0_3:
        setx    ASI_CMP_CORE_RUNNING_RW, %g1, %g2
        setx    ASI_CMP_CORE_RUNNING_STATUS, %g1, %g3
	set	0x100, %g7			! timeout value
#ifndef PORTABLE_CORE
	orn	%g0, %g0, %g6
#else
	set	0xff, %g6
	sllx	%g6, %o2, %g6
#endif

t0_loop_2_top:
	cmp	%g7, 0
	beq	local_test_failed		! fail on a timeout
	dec	%g7

	ldxa	[%g3]ASI_CMP_CORE, %g4		! CORE_RUNNING_STATUS
	cmp	%g4, %g6
	bne	t0_loop_2_top
	nop

t0_4:
	ldxa	[%g2]ASI_CMP_CORE, %g5		! CORE_RUNNING_RW
	cmp	%g4, %g5
	bne	local_test_failed		! fail on RW != STATUS
	nop

	/* Signal all the other threads that were done */
t0_5:
	setx	user_data_start, %g1, %g2
	set	1, %g3
	stx	%g3, [%g2]

	/* Done */

	ba	test_passed
	nop

/************************************************************************
   Thread 1 to 63 Code
 ************************************************************************/

	/* Wait till thread 0 says were done */
main_t1_t63:
	setx	0x1000, %g1, %g7
	setx	user_data_start, %g1, %g2

t1_t63_wait_loop_top:
	cmp	%g7, 0
	beq	local_test_failed		! fail on a timeout
	dec	%g7

	ldx	[%g2], %g4
	cmp	%g4, 1
	bne	t1_t63_wait_loop_top
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
