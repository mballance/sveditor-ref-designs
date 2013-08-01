/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: memop_byte_mask.s
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

!
! Thread 0 Start
!
thread_0:
	! Bring data of all 1's into a L2 cache line

	setx	user_data_start, %g1, %g2
	ld	[%g2], %l0
	membar	#Sync

	! Do byte stores into that same L2 cache line.
	! Data = 0, 1, 2, 3, ..., 63

	mov	%g2, %g3	! %g3 = address
	mov	%g0, %g1	! %g1 = data

storeloop:
	stb	%g1, [%g3]
	add	%g1, 1, %g1
	cmp	%g1, 63
	bne	storeloop
	add	%g3, 1, %g3

	! Do byte reads from that same L2 cache line
	! Check the data read.

	mov	%g2, %g3	! %g3 = address
	mov	%g0, %g1	! %g1 = data

readloop:
	ldub	[%g3], %l1
	cmp	%l1, %g1
	bne	test_failed
	add	%g1, 1, %g1
	cmp	%g1, 63
	bne	readloop
	add	%g3, 1, %g3
    
test_passed:
	EXIT_GOOD

test_failed:
    EXIT_BAD


/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.xword 0xffffffff
.xword 0xffffffff
.xword 0xffffffff
.xword 0xffffffff
.xword 0xffffffff
.xword 0xffffffff
.xword 0xffffffff
.xword 0xffffffff
.xword 0xffffffff
.xword 0xffffffff
.xword 0xffffffff
.xword 0xffffffff
.xword 0xffffffff
.xword 0xffffffff
.xword 0xffffffff
.xword 0xffffffff
.end



