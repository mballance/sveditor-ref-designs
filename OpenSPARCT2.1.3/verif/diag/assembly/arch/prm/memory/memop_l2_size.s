/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: memop_l2_size.s
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

main:	nop
	ta	T_CHANGE_HPRIV

!
! Thread 0 Start
!
	! - First write 5 L2 cache lines whose addresses are
	!   spaced throughtout the 4Mb L2 cache size.  For each
	!   line do 17 loads to 17 different PA's that alias
	!   to that line, causing a writeback.

addr1_0:
	setx	addr1, %g1, %g2		! g2 = table of addresses
	ldx	[%g2], %g3		! g3 = address to write
	mov	%g0, %g7		! g7 = data to be written
	stx	%g7, [%g3]		! do the write
	setx	0x0001000100010001, %g1, %g6	! g6 = data inc. value
	add	%g7, %g6, %g7

	! Cause writeback
	mov	%g3, %o0
	call	flush_l2_line

addr1_1:
	add	%g2, 8, %g2
	ldx	[%g2], %g3		! g3 = address to be written
	stx	%g7, [%g3]		! do the write
	add	%g7, %g6, %g7		! increment the data value

	! Cause writeback
	mov	%g3, %o0
	call	flush_l2_line

addr1_2:
	add	%g2, 8, %g2
	ldx	[%g2], %g3		! g3 = address to be written
	stx	%g7, [%g3]		! do the write
	add	%g7, %g6, %g7		! increment the data value

	! Cause writeback
	mov	%g3, %o0
	call	flush_l2_line

addr1_3:
	add	%g2, 8, %g2
	ldx	[%g2], %g3		! g3 = address to be written
	stx	%g7, [%g3]		! do the write
	add	%g7, %g6, %g7		! increment the data value

	! Cause writeback
	mov	%g3, %o0
	call	flush_l2_line

addr1_4:
	add	%g2, 8, %g2
	ldx	[%g2], %g3		! g3 = address to be written
	stx	%g7, [%g3]		! do the write
	add	%g7, %g6, %g7		! increment the data value

	! Cause writeback
	mov	%g3, %o0
	call	flush_l2_line


	! - For the first line in each L2 cache bank, selected
	!   by PA[8:6], so 17 loads to 17 difference PA's that
	!   alias to that line, again causing a writeback.

addr2_0:
	setx	addr2, %g1, %g2		! g2 = table of addresses
	ldx	[%g2], %g3		! g3 = address to write
	stx	%g7, [%g3]		! do the write
	add	%g7, %g6, %g7		! increment the data value

	! Cause writeback
	mov	%g3, %o0
	call	flush_l2_line

addr2_1:
	add	%g2, 8, %g2
	ldx	[%g2], %g3		! g3 = address to be written
	stx	%g7, [%g3]		! do the write
	add	%g7, %g6, %g7		! increment the data value

	! Cause writeback
	mov	%g3, %o0
	call	flush_l2_line

addr2_2:
	add	%g2, 8, %g2
	ldx	[%g2], %g3		! g3 = address to be written
	stx	%g7, [%g3]		! do the write
	add	%g7, %g6, %g7		! increment the data value

	! Cause writeback
	mov	%g3, %o0
	call	flush_l2_line

addr2_3:
	add	%g2, 8, %g2
	ldx	[%g2], %g3		! g3 = address to be written
	stx	%g7, [%g3]		! do the write
	add	%g7, %g6, %g7		! increment the data value

	! Cause writeback
	mov	%g3, %o0
	call	flush_l2_line

addr2_4:
	add	%g2, 8, %g2
	ldx	[%g2], %g3		! g3 = address to be written
	stx	%g7, [%g3]		! do the write
	add	%g7, %g6, %g7		! increment the data value

	! Cause writeback
	mov	%g3, %o0
	call	flush_l2_line

addr2_5:
	add	%g2, 8, %g2
	ldx	[%g2], %g3		! g3 = address to be written
	stx	%g7, [%g3]		! do the write
	add	%g7, %g6, %g7		! increment the data value

	! Cause writeback
	mov	%g3, %o0
	call	flush_l2_line

addr2_6:
	add	%g2, 8, %g2
	ldx	[%g2], %g3		! g3 = address to be written
	stx	%g7, [%g3]		! do the write
	add	%g7, %g6, %g7		! increment the data value

	! Cause writeback
	mov	%g3, %o0
	call	flush_l2_line

addr2_7:
	add	%g2, 8, %g2
	ldx	[%g2], %g3		! g3 = address to be written
	stx	%g7, [%g3]		! do the write
	add	%g7, %g6, %g7		! increment the data value

	! Cause writeback
	mov	%g3, %o0
	call	flush_l2_line


	! - Read all the locations written and check the data.

read1_0:	
	setx	addr1, %g1, %g2		! g2 = table of addresses
	ldx	[%g2], %g3		! g3 = address to write
	mov	%g0, %g7		! g7 = data to be written
	ldx	[%g3], %g1		! read and check the data
	cmp	%g1, %g7
	bne	test_failed
	add	%g2, 8, %g2		! increment to next address
	setx	0x0001000100010001, %g1, %g6	! g6 = data inc. value
	add	%g7, %g6, %g7

read1_1:	
	ldx	[%g2], %g3		! g3 = address to write
	ldx	[%g3], %g1		! read and check the data
	cmp	%g1, %g7
	bne	test_failed
	add	%g2, 8, %g2		! increment to next address
	add	%g7, %g6, %g7		! increment expected data value

read1_2:	
	ldx	[%g2], %g3		! g3 = address to write
	ldx	[%g3], %g1		! read and check the data
	cmp	%g1, %g7
	bne	test_failed
	add	%g2, 8, %g2		! increment to next address
	add	%g7, %g6, %g7		! increment expected data value

read1_3:	
	ldx	[%g2], %g3		! g3 = address to write
	ldx	[%g3], %g1		! read and check the data
	cmp	%g1, %g7
	bne	test_failed
	add	%g2, 8, %g2		! increment to next address
	add	%g7, %g6, %g7		! increment expected data value

read1_4:	
	ldx	[%g2], %g3		! g3 = address to write
	ldx	[%g3], %g1		! read and check the data
	cmp	%g1, %g7
	bne	test_failed
	add	%g2, 8, %g2		! increment to next address
	add	%g7, %g6, %g7		! increment expected data value

read2_0:	
	setx	addr2, %g1, %g2		! g2 = table of addresses
	ldx	[%g2], %g3		! g3 = address to write
	ldx	[%g3], %g1		! read and check the data
	cmp	%g1, %g7
	bne	test_failed
	add	%g2, 8, %g2		! increment to next address
	add	%g7, %g6, %g7		! increment expected data value

read2_1:	
	ldx	[%g2], %g3		! g3 = address to write
	ldx	[%g3], %g1		! read and check the data
	cmp	%g1, %g7
	bne	test_failed
	add	%g2, 8, %g2		! increment to next address
	add	%g7, %g6, %g7		! increment expected data value

read2_2:	
	ldx	[%g2], %g3		! g3 = address to write
	ldx	[%g3], %g1		! read and check the data
	cmp	%g1, %g7
	bne	test_failed
	add	%g2, 8, %g2		! increment to next address
	add	%g7, %g6, %g7		! increment expected data value

read2_3:	
	ldx	[%g2], %g3		! g3 = address to write
	ldx	[%g3], %g1		! read and check the data
	cmp	%g1, %g7
	bne	test_failed
	add	%g2, 8, %g2		! increment to next address
	add	%g7, %g6, %g7		! increment expected data value

read2_4:	
	ldx	[%g2], %g3		! g3 = address to write
	ldx	[%g3], %g1		! read and check the data
	cmp	%g1, %g7
	bne	test_failed
	add	%g2, 8, %g2		! increment to next address
	add	%g7, %g6, %g7		! increment expected data value

read2_5:	
	ldx	[%g2], %g3		! g3 = address to write
	ldx	[%g3], %g1		! read and check the data
	cmp	%g1, %g7
	bne	test_failed
	add	%g2, 8, %g2		! increment to next address
	add	%g7, %g6, %g7		! increment expected data value

read2_6:	
	ldx	[%g2], %g3		! g3 = address to write
	ldx	[%g3], %g1		! read and check the data
	cmp	%g1, %g7
	bne	test_failed
	add	%g2, 8, %g2		! increment to next address
	add	%g7, %g6, %g7		! increment expected data value

read2_7:	
	ldx	[%g2], %g3		! g3 = address to write
	ldx	[%g3], %g1		! read and check the data
	cmp	%g1, %g7
	bne	test_failed
	nop

	ba	test_passed
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
	
flush_l2_line:
	setx	0x3ffff, %o1, %o2
	and	%o0, %o2, %o3

	setx	aliases, %o4, %o5
	ldx	[%o5], %o1
	add	%o5, 8, %o5
	ldx	[%o1+%o3], %g0
	ldx	[%o5], %o1
	add	%o5, 8, %o5
	ldx	[%o1+%o3], %g0
	ldx	[%o5], %o1
	add	%o5, 8, %o5
	ldx	[%o1+%o3], %g0
	ldx	[%o5], %o1
	add	%o5, 8, %o5
	ldx	[%o1+%o3], %g0
	ldx	[%o5], %o1
	add	%o5, 8, %o5
	ldx	[%o1+%o3], %g0
	ldx	[%o5], %o1
	add	%o5, 8, %o5
	ldx	[%o1+%o3], %g0
	ldx	[%o5], %o1
	add	%o5, 8, %o5
	ldx	[%o1+%o3], %g0
	ldx	[%o5], %o1
	add	%o5, 8, %o5
	ldx	[%o1+%o3], %g0
	ldx	[%o5], %o1
	add	%o5, 8, %o5
	ldx	[%o1+%o3], %g0
	ldx	[%o5], %o1
	add	%o5, 8, %o5
	ldx	[%o1+%o3], %g0
	ldx	[%o5], %o1
	add	%o5, 8, %o5
	ldx	[%o1+%o3], %g0
	ldx	[%o5], %o1
	add	%o5, 8, %o5
	ldx	[%o1+%o3], %g0
	ldx	[%o5], %o1
	add	%o5, 8, %o5
	ldx	[%o1+%o3], %g0
	ldx	[%o5], %o1
	add	%o5, 8, %o5
	ldx	[%o1+%o3], %g0
	ldx	[%o5], %o1
	add	%o5, 8, %o5
	ldx	[%o1+%o3], %g0
	ldx	[%o5], %o1
	add	%o5, 8, %o5
	ldx	[%o1+%o3], %g0
	ldx	[%o5], %o1
	add	%o5, 8, %o5
	ldx	[%o1+%o3], %g0

	jmpl	%o7+0x8, %g0
	nop



/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
	! Addresses to use

addr1:	.xword	0x0000000061000200	! chosen to not be same as addr2
	.xword	0x000000006100ffc0
	.xword	0x000000006101ffc0
	.xword	0x000000006102ffc0
	.xword	0x000000006103ffc0

addr2:	.xword	0x0000000061000000
	.xword	0x0000000061000040
	.xword	0x0000000061000080
	.xword	0x00000000610000c0
	.xword	0x0000000061000100
	.xword	0x0000000061000140
	.xword	0x0000000061000180
	.xword	0x00000000610001c0

aliases:
        .xword	0x0000000062000000
        .xword	0x0000000062040000
        .xword	0x0000000062080000
        .xword	0x00000000620c0000
        .xword	0x0000000062100000
        .xword	0x0000000062140000
        .xword	0x0000000062180000
        .xword	0x00000000621c0000
        .xword	0x0000000062200000
        .xword	0x0000000062240000
        .xword	0x0000000062280000
        .xword	0x00000000622c0000
        .xword	0x0000000062300000
        .xword	0x0000000062340000
        .xword	0x0000000062380000
        .xword	0x00000000623c0000
        .xword	0x0000000062400000
        .xword	0x0000000062440000
user_data_end:


.end


