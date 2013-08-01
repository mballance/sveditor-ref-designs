/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: memop_all_atomics.s
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

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
	ta      T_CHANGE_HPRIV

	! Set up each thread's data area

thread_data:	
        ta      T_RD_THID
        setx    256, %g1, %l7
        umul    %o1, %l7, %l7
        setx    user_data_start, %g1, %g3
        add     %l7, %g3, %l7

	! All threads executed same code, with different data areas

casa:
	mov	%l7, %g2
	setx	0xffffffffffffffff, %g1, %l0
	casa	[%g2]ASI_PRIMARY, %g0, %l0
	cmp	%l0, 0
	bne	test_failed
	nop
	setx	0xffffffff, %g1, %g4
	ld	[%g2], %l1
	cmp	%g4, %l1
	bne	test_failed
	nop
caxsa:
	setx	0xffffffffffffffff, %g1, %l0
	add	%g2, 8, %g2
	casxa	[%g2]ASI_PRIMARY, %g0, %l0
	setx	0x1111111111111111, %g1, %g7
	cmp	%l0, %g7
	bne	test_failed
	nop
	ldx	[%g2], %l1
	cmp	%l1, %g7
	bne	test_failed
	nop
ldstub:
	ldstub	[%g2+0x8], %l2
	set	0x22, %g6
	cmp	%g6, %l2
	bne	test_failed
	nop
	ldx	[%g2+0x8], %l3
	setx	0xff22222222222222, %g1, %g7
	cmp	%l3, %g7
	bne	test_failed
	nop
swap:
	setx	0xa5a5a5a5a5a5a5a5, %g1, %g5
	swap	[%g2+0x10], %g5
	setx	0x33333333, %g1, %6
	cmp	%g5, %g6
	bne	test_failed
	nop
	ld	[%g2+0x10], %l6
	setx	0xa5a5a5a5, %g1, %g7
	cmp	%l6, %g7
	bne	test_failed
	nop
mmuload:
	add	%g2, 0x18, %g2
	ldda	[%g2]ASI_NUCLEUS_QUAD_LDD, %l0
	setx	0x4444444444444444, %g1, %g4
	setx	0x5555555555555555, %g1, %g3
	cmp	%l0, %g4
	bne	test_failed
	nop
	cmp	%l1, %g3
	bne	test_failed
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
	! Thread 0 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 1 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 2 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 3 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 4 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 5 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 6 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 7 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 8 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 9 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 10 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 11 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 12 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 13 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 14 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 15 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 16 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 17 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 18 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 19 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 20 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 21 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 22 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 23 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 24 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 25 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 26 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 27 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 28 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 29 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 30 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 31 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 32 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 33 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 34 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 35 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 36 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 37 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 38 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 39 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 40 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 41 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 42 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 43 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 44 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 45 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 46 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 47 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 48 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 49 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 50 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 51 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 52 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 53 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 54 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 55 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 56 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 57 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 58 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 59 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 60 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 61 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 62 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff

	.align	256
	! Thread 63 data area
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff
.end



