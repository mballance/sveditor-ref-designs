/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: memop_mt2_invalidate_l1.s
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
#define TIMEOUT	0x200

#include "hboot.s"
#include "asi_s.h"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:	nop
	ta	T_CHANGE_HPRIV
	nop

	ta	T_RD_THID
	cmp	%o1, 0x0
	be	main_t0
	nop
	cmp	%o1, 0x1
	be	main_t1
	nop


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! Thread 0 Start
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	! - For a line in D$ for thread 0, have thread 1 store
	!   to that line to invalidate it

main_t0:
	setx	data, %g1, %g2
	set	1, %g7
	st	%g7, [%g2]		! put a line into D$
					! Tread 1 is waiting for this.

	! Now wait for Thread 1 to put a 2 into this location,
	! which invalidates this D$ line.

	setx	TIMEOUT, %g1, %g3
wait1_t0:
	ld	[%g2], %g7
	cmp	%g3, 0
	be	test_failed
	nop
	cmp	%g7, 2
	bne	wait1_t0
	sub	%g3, 1, %g3

	! - For a line in I$ for thread 0, have thread 1 store
	!   to that line to invalidate it.

icache1_t0:
	mov	%g0, %g7
	set	3, %g6
	setx	TIMEOUT, %g1, %g5

loop1_t0:
	st	%g6, [%g2]		! This is the instr. to be invalidated
					! Thread 1 is waiting for this
	cmp	%g5, 0
	be	test_failed
	cmp	%g7, 0			! Thread 1 will change st to
	be	loop1_t0		! add  %g7, 1, %g7
	sub	%g5, 1, %g5


	! - For a line in I$ for thread 0, have the corresponding
	!   L2$ line replaced, causing the I$ line to be invalidated.

	set	4, %g6
	setx	TIMEOUT, %g1, %g5

	st	%g6, [%g2]		! Signal Thread 1 we're ready
loop2_t0:
	cmp	%g5, 0
	be	test_failed
	ld	[%g2], %g3		! Wait for Thread 1's signal
	cmp	%g3, 5
	bne	loop2_t0
	sub	%g5, 1, %g5

	! DONE

	ba	test_passed
	nop


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! Thread 1 Start
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	! - For a line in D$ for thread 0, have thread 1 store
	!   to that line to invalidate it
main_t1:
	! Wait for Thread 0 to be ready
	setx	data, %g1, %g2
	setx	TIMEOUT, %g1, %g7
wait1_t1:
	cmp	%g7, 0
	be	test_failed
	ld	[%g2], %g3
	cmp	%g3, 0
	be	wait1_t1
	sub	%g7, 1, %g7

	set	2, %g3
	st	%g3, [%g2]		! Invalidate line in Thread 0 D$

	! - For a line in I$ for thread 0, have thread 1 store
	!   to that line to invalidate it.

	setx	TIMEOUT, %g1, %g7

	! Wait for Thread 0 to be ready

wait2_t1:
	cmp	%g7, 0
	be	test_failed
	ld	[%g2], %g3
	cmp	%g3, 3
	bne	wait2_t1
	sub	%g7, 1, %g7

	! Now do store to invalidate Tread 0 I$ line

	setx	loop1_t0, %g1, %g4
	setx	0x8e01e001, %g1, %g3	! add %g7, 1, %g7
	st	%g3, [%g4]

	! - For a line in I$ for thread 0, have the corresponding
	!   L2$ line replaced, causing the I$ line to be invalidated.

	! Wait for Thread 0 to be ready

	setx	TIMEOUT, %g1, %g7
wait3_t1:
	cmp	%g7, 0
	be	test_failed
	ld	[%g2], %g3
	cmp	%g3, 4
	bne	wait3_t1
	sub	%g7, 1, %g7

	! Cause L2$ line corresponding to Thread 0 I$ line to be replaced

	setx	loop2_t0, %g1, %o0
	call	flush_l2_line
	nop

	! Wait a bit for Thread 0 to see effect if I$ invalidate

	set	0x80, %g7
wait4_t1:
	cmp	%g7, 0
	bne	wait4_t1
	sub	%g7, 1, %g7

	! Now signal Thread 0, we're all done

	set	5, %g3
	st	%g3, [%g2]

	! DONE

	ba	test_passed
	nop


/**********************************************************************
 *  Common code.
 *********************************************************************/
	
	! Assumes that %o0 contains VA that maps to L2$ line to be flushed.
	! This is done by doing 16 loads from different addresses that alias
	! to that line.  Note that this will cause a writeback if the L2$
	! line is dirty.
	
flush_l2_line:
	setx	0x3ffff, %o1, %o2
	and	%o0, %g2, %o3
	setx	0x40000, %o1, %o2
	setx	alias1, %o1, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	jmpl	%o7+0x8, %g0
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

data:	.xword	0x0000000000000000

	.align	0x40000		! each 246kb, 0x40000, aliases to same L2$ line
alias1:
	.skip	1024

.end



