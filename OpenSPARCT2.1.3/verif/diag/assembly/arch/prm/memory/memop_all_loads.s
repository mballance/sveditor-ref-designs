/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: memop_all_loads.s
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

	! Set up seperate temporary memory location for each thread, in %g3

	setx	temp, %g1, %g3
        ta      T_RD_THID
	sllx	%o1, 6, %l1
	add	%g3, %l1, %g3

!
! Thread 0 Start
!
thread_0:

	!  Integer loads

	setx	user_data_start, %g1, %g2
ldsb:	
	ldsb	[%g2 + 0x8], %l0
	cmp	%l0, 0x11
	bne	test_failed
	nop
ldsh:
	setx	0x2222, %g1, %g7
	ldsh	[%g2 + 0x10], %l1
	cmp	%l1, %g7
	bne	test_failed
	nop
ldsw:
	setx	0x33333333, %g1, %g7
	ldsw	[%g2 + 0x18], %l2
	cmp	%l2, %g7
	bne	test_failed
	nop
ldub:
	setx	0x44, %g1, %g7
	ldub	[%g2 + 0x20], %l3
	cmp	%l3, %g7
	bne	test_failed
	nop
lduh:
	setx	0x5555, %g1, %g7
	lduh	[%g2 + 0x28], %l4
	cmp	%l4, %g7
	bne	test_failed
	nop
lduw:
	setx	0x66666666, %g1, %g7
	lduw	[%g2 + 0x30], %l5
	cmp	%l5, %g7
	bne	test_failed
	nop
ldx:
	setx	0x7777777777777777, %g1, %g7
	ldx	[%g2 + 0x38], %l6
	cmp	%l6, %g7
	bne	test_failed
	nop
ldd:
	setx	0x88888888, %g1, %g7
	ldd	[%g2 + 0x40], %l0
	cmp	%l0, %g7
	bne	test_failed
	cmp	%l1, %g7
	bne	test_failed
	nop

	! Floating point loads

	setx	floating_point_data, %g1, %g2
ldf:
	ld	[%g2], %f0
	st	%f0, [%g3]
	ld	[%g3], %l1
	setx	0x3f800000, %g1, %g4
	cmp	%l1, %g4
	bne	test_failed
	nop
lddf:
	ldd	[%g2+0x8], %f2
	std	%f2, [%g3]
	setx	0x4000000000000000, %g1, %g5
	ldx	[%g3], %l2
	cmp	%l2, %g5
	bne	test_failed
	nop
ldfsr:
	ld	[%g2+0x10], %fsr
	st	%fsr, [%g3]
	ld	[%g3], %l3
	cmp	%l3, 0
	bne	test_failed
	nop
ldxfsr:
	ldx	[%g2+0x10], %fsr
	stx	%fsr, [%g3]
	ldx	[%g3], %l3
	cmp	%l3, 0
	bne	test_failed
	nop

	! VIS loads
	setx	vis_data, %g1, %g2
ldfa:
	ldda	[%g2]ASI_FL8_PRIMARY, %f6
	st	%f7, [%g3]
	ld	[%g3], %l4
	ldub	[%g2], %l5
	cmp	%l4, %l5
	bne	test_failed
	nop
lddfa:
	wr	%g0, ASI_FL16_PRIMARY, %asi
	ldda	[%g2+0x4]%asi, %f2
	st	%f3, [%g3]
	ld	[%g3], %l5
	lduh	[%g2+0x4], %l6
	cmp	%l5, %l6
	bne	test_failed
	nop

	! Prefetch
prefetch:
	setx	prefetch_data, %g1, %g2
	prefetch [%g2], 0x0
	membar	#Sync
	setx	0x01234567, %g1, %g3
	ld	[%g2], %l6
	cmp	%l6, %g3
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
floating_point_data:	
	.xword 0x3f8000003f800000	! 1.0, 1.0 single precision
	.xword 0x4000000000000000	! 2.0 double precision
	.xword 000000000000000000
vis_data:
	.xword 0xa000000055000000
prefetch_data:
	.xword 0x0123456789abcdef
	.xword 0xfedcba9876543210

	.skip	128
temp:
	.skip	8192
.end



