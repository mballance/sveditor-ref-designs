/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: cmp_park_self.s
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

	! Determine thread running on

        ta      T_RD_THID
	cmp	%o1, 0
	be	main_t0			! Branch if thread 0
	nop

	ba	main_t1			! Branch if thread 1
	nop


/************************************************************************
   Thread 0 code
 ************************************************************************/
	
main_t0:
	ta T_CHANGE_HPRIV
	nop

	/* Signal thread 1 it can start. */

t0_0:
	setx	user_data_start, %g1, %g2
	set	1, %g4
	stx	%g4, [%g2]

	/* Wait for thread 1 to do all its work. */

t0_wait_loop_top:
	ldx	[%g2], %g3
	cmp	%g3, 2
	bne	t0_wait_loop_top
	nop

	/* Note that at this time thread 1 will be
	   waiting for thread 0 to do all of its work. */

	/* Check that CORE_RUNNING_RW = CORE_RUNNING_STATUS */
t0_1:
	setx	ASI_CMP_CORE_RUNNING_RW, %g1, %g2
	setx	ASI_CMP_CORE_RUNNING_STATUS, %g1, %g3
	ldxa	[%g2]ASI_CMP_CORE, %g4
	ldxa	[%g3]ASI_CMP_CORE, %g5
	cmp	%g4, %g5
	bne	local_test_failed
	nop

#ifndef PORTABLE_CORE
	/* Park thread 1, i.e. set CORE_RUNNING_RW[63:0] = 0x1 */
t0_2:
	set	1, %g7
#else
	/* Park the other thread */
t0_core_portable_2:
	ldxa    [%g0]ASI_INTR_ID, %o2		! get full thread ID
	set	1, %g7
	sllx	%g7, %o2, %g7
#endif
	stxa	%g7, [%g2]ASI_CMP_CORE

	/* Wait long enough for thread 1 to park. */
t0_3:
	set	100, %g6

t0_th1_park_loop_top:
	cmp	%g6, 0
	beq	local_test_failed		! Fails if thead 1 never parks
	nop

	ldxa	[%g3]ASI_CMP_CORE, %g5
#ifndef PORTABLE_CORE
	cmp	%g5, 1
#else
	cmp	%g5, %g7
#endif
	bne	t0_th1_park_loop_top
	dec	%g6				! decrement loop count

	/* Also check CORE_RUNING_RW = 1 */
t0_4:
	ldxa	[%g2]ASI_CMP_CORE, %g4
#ifndef PORTABLE_CORE
	cmp	%g4, 1
#else
	cmp	%g4, %g7
#endif
	bne	local_test_failed
	nop

	/* Thread 0 attempts to park all threads, i.e. CORE_RUNNING_RW = 0 */
t0_5:
	stxa	%g0, [%g2]ASI_CMP_CORE

	/* Wait long enough for a thread to park itself. */
t0_6:
	set	0x100, %g6

t0_th0_park_loop_top:
	cmp	%g6, 0
	bne	t0_th0_park_loop_top		! Waited long enough
	dec	%g6				! decrement loop count

	/* Check that CORE_RUNNING_RW = CORE_RUNNING_STATUS = 0x1 */
t0_7:
	ldxa	[%g2]ASI_CMP_CORE, %g4
#ifndef PORTABLE_CORE
	cmp	%g4, 1
#else
	cmp	%g4, %g7
#endif
	bne	local_test_failed
	nop

	ldxa	[%g3]ASI_CMP_CORE, %g5
#ifndef PORTABLE_CORE
	cmp	%g5, 1
#else
	cmp	%g5, %g7
#endif
	bne	local_test_failed
	nop

	/* Unpark thread 1 */
t0_8:
#ifndef PORTABLE_CORE
	set	3, %g6
#else
	sllx	%g7, 1, %g6
	or	%g7, %g6, %g6
#endif
	stxa	%g6, [%g2]ASI_CMP_CORE

	/* Exit */
t0_9:
	setx	user_data_start, %g1, %g7
	set	3, %g6
	stx	%g6, [%g7]			! Signal thread 1 to exit
t0_10:	
	ba	test_passed
	nop


/************************************************************************
   Thread 1 code
 ************************************************************************/

	/* Check that CORE_RUNNING_RW = CORE_RUNNING_STATUS */
main_t1:
	setx	ASI_CMP_CORE_RUNNING_RW, %g1, %g2
	setx	ASI_CMP_CORE_RUNNING_STATUS, %g1, %g3
	ldxa	[%g2]ASI_CMP_CORE, %g4
	ldxa	[%g3]ASI_CMP_CORE, %g5
	cmp	%g4, %g5
	bne	local_test_failed
	nop

	/* Wait for thread 0 to signal it is ready. */

	setx	user_data_start, %g1, %g2

t1_th0_startup_loop_top:
	ldx	[%g2], %g6
	cmp	%g6, 1
	bne	t1_th0_startup_loop_top
	nop

#ifndef PORTABLE_CORE
	/* Park thread 0, i.e. set CORE_RUNNING_RW[63:0] = 0x2 */
t1_0:
	setx	ASI_CMP_CORE_RUNNING_RW, %g1, %g2
	set	2, %g7
#else
	/* Park first thread in this core */
t1_core_portable_0:
	setx	ASI_CMP_CORE_RUNNING_RW, %g1, %g2
	ldxa    [%g0]ASI_INTR_ID, %o2		! get full thread ID
	set	1, %g7
	sllx	%g7, %o2, %g7
#endif
	stxa	%g7, [%g2]ASI_CMP_CORE

	/* Wait long enough for thread 0 to park. */
t1_1:
	set	0x100, %g6			! loop count

t1_th0_park_wait_loop_top:
	cmp	%g6, 0
	beq	local_test_failed
	nop

	ldxa	[%g3]ASI_CMP_CORE, %g5
#ifndef PORTABLE_CORE
	cmp	%g5, 2
#else
	cmp	%g5, %g7
#endif
	bne	t1_th0_park_wait_loop_top
	dec	%g6

	/* Check that CORE_RUNNING_RW = 0x2 */
t1_2:
	ldxa	[%g2]ASI_CMP_CORE, %g4
#ifndef PORTABLE_CORE
	cmp	%g4, 2
#else
	cmp	%g4, %g7
#endif
	bne	local_test_failed
	nop

	/* Attempt to park all threads, i.e. set CORE_RUNNING_RW = 0 */
t1_3:	
	stxa	%g0, [%g2]ASI_CMP_CORE
	
	/* Wait long enough for a thread to park. */
t1_4:	
	set	0x100, %g6

t1_th1_park_loop_top:
	cmp	%g6, 0
	bne	t1_th1_park_loop_top		! Waited long enough
	dec	%g6				! decrement loop count

	/* Check that CORE_RUNNING_RW = CORE_RUNNING_STATUS = 0x2 */
t1_5:
	ldxa	[%g2]ASI_CMP_CORE, %g4
#ifndef PORTABLE_CORE
	cmp	%g4, 2
#else
	cmp	%g4, %g7
#endif
	bne	local_test_failed
	nop

	ldxa	[%g3]ASI_CMP_CORE, %g5
#ifndef PORTABLE_CORE
	cmp	%g5, 2
#else
	cmp	%g5, %g7
#endif
	bne	local_test_failed
	nop

	/* Unpark thread 0 */
t1_6:
#ifndef PORTABLE_CORE
	set	3, %g6
#else
	srlx	%g7, 1, %g6
	or	%g7, %g6, %g6
#endif
	stxa	%g6, [%g2]ASI_CMP_CORE

	/* Signal thread 0 to stop waiting. */
t1_7:
	setx	user_data_start, %g1, %g6
	set	2, %g1
	stx	%g1, [%g6]

	/* Wait for thread 0 to do all its work. */
t1_wait_loop_top:
	ldx	[%g6], %g5
	cmp	%g5, 3
	bne	t1_wait_loop_top
	nop

	/* Done */
t1_8:
	ba	test_passed
	nop

/**********************************************************************/
	
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
