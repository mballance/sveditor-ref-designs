/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: memop_all_l2_banks.s
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
	ta	T_CHANGE_HPRIV

	! Get the data to be used.

	setx	user_data_start, %g1, %g2
	ldx	[%g2], %l0
	ldx	[%g2+0x8], %l1
	ldx	[%g2+0x10], %l2
	ldx	[%g2+0x18], %l3
	ldx	[%g2+0x20], %l4
	ldx	[%g2+0x28], %l5
	ldx	[%g2+0x30], %l6
	ldx	[%g2+0x38], %l7

	! Write data to a location in each L2 cache bank

	setx	data, %g1, %g2
	stx	%l0, [%g2]		! L2 bank 0
	stx	%l1, [%g2+0x40]		! L2 bank 1
	stx	%l2, [%g2+0x80]		! L2 bank 2
	stx	%l3, [%g2+0xc0]		! L2 bank 3
	stx	%l4, [%g2+0x100]	! L2 bank 4
	stx	%l5, [%g2+0x140]	! L2 bank 5
	stx	%l6, [%g2+0x180]	! L2 bank 6
	stx	%l7, [%g2+0x1c0]	! L2 bank 7

	! Now flush each of these L2 cache lines

	mov	%g2, %o0
	call	flush_l2_line
	nop
	mov	%g2, %o0
	add	%o0, 0x40, %o0
	call	flush_l2_line
	nop
	mov	%g2, %o0
	add	%o0, 0x80, %o0
	call	flush_l2_line
	nop
	mov	%g2, %o0
	add	%o0, 0xc0, %o0
	call	flush_l2_line
	nop
	mov	%g2, %o0
	add	%o0, 0x100, %o0
	call	flush_l2_line
	nop
	mov	%g2, %o0
	add	%o0, 0x140, %o0
	call	flush_l2_line
	nop
	mov	%g2, %o0
	add	%o0, 0x180, %o0
	call	flush_l2_line
	nop
	mov	%g2, %o0
	add	%o0, 0x1c0, %o0
	call	flush_l2_line
	nop

	! Finally read the data from memory and check it.

	ldx	[%g2], %i1
	cmp	%i1, %l0
	bne	test_failed
	nop

	ldx	[%g2+0x40], %i1
	cmp	%i1, %l1
	bne	test_failed
	nop

	ldx	[%g2+0x80], %i1
	cmp	%i1, %l2
	bne	test_failed
	nop

	ldx	[%g2+0xc0], %i1
	cmp	%i1, %l3
	bne	test_failed
	nop

	ldx	[%g2+0x100], %i1
	cmp	%i1, %l4
	bne	test_failed
	nop

	ldx	[%g2+0x140], %i1
	cmp	%i1, %l5
	bne	test_failed
	nop

	ldx	[%g2+0x180], %i1
	cmp	%i1, %l6
	bne	test_failed
	nop

	ldx	[%g2+0x1c0], %i1
	cmp	%i1, %l7
	bne	test_failed
	nop

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
	and	%o0, %o2, %o3
	setx	alias1, %o1, %o4
	ld	[%o3+%o4], %o5
	setx	alias2, %o1, %o4
	ld	[%o3+%o4], %o5
	setx	alias3, %o1, %o4
	ld	[%o3+%o4], %o5
	setx	alias4, %o1, %o4
	ld	[%o3+%o4], %o5
	setx	alias5, %o1, %o4
	ld	[%o3+%o4], %o5
	setx	alias6, %o1, %o4
	ld	[%o3+%o4], %o5
	setx	alias7, %o1, %o4
	ld	[%o3+%o4], %o5
	setx	alias8, %o1, %o4
	ld	[%o3+%o4], %o5
	setx	alias9, %o1, %o4
	ld	[%o3+%o4], %o5
	setx	alias10, %o1, %o4
	ld	[%o3+%o4], %o5
	setx	alias11, %o1, %o4
	ld	[%o3+%o4], %o5
	setx	alias12, %o1, %o4
	ld	[%o3+%o4], %o5
	setx	alias13, %o1, %o4
	ld	[%o3+%o4], %o5
	setx	alias14, %o1, %o4
	ld	[%o3+%o4], %o5
	setx	alias15, %o1, %o4
	ld	[%o3+%o4], %o5
	setx	alias16, %o1, %o4
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

SECTION       .DATA DATA_VA=0x70000000
attr_data {
      Name = .DATA,
      hypervisor,
      compressimage
}

.data
.global user_data_start
.global data
.global	alias1
.global	alias2
.global	alias3
.global	alias4
.global	alias5
.global	alias6
.global	alias7
.global	alias8
.global	alias9
.global	alias10
.global	alias11
.global	alias12
.global	alias13
.global	alias14
.global	alias15
.global	alias16

user_data_start:
	.xword	0x1111111111111111
	.xword	0x2222222222222222
	.xword	0x3333333333333333
	.xword	0x4444444444444444
	.xword	0x5555555555555555
	.xword	0x6666666666666666
	.xword	0x7777777777777777
	.xword	0x8888888888888888
	.xword	0x9999999999999999
	.align	512
data:	.skip	512

	.align	0x40000		! each 246kb, 0x40000, aliases to same L2$ line
alias1:
	.skip	1024
	.align	0x40000
alias2:
	.skip	1024
	.align	0x40000
alias3:
	.skip	1024
	.align	0x40000
alias4:
	.skip	1024
	.align	0x40000
alias5:
	.skip	1024
	.align	0x40000
alias6:
	.skip	1024
	.align	0x40000
alias7:
	.skip	1024
	.align	0x40000
alias8:
	.skip	1024
	.align	0x40000
alias9:
	.skip	1024
	.align	0x40000
alias10:
	.skip	1024
	.align	0x40000
alias11:
	.skip	1024
	.align	0x40000
alias12:	
	.skip	1024
	.align	0x40000
alias13:
	.skip	1024
	.align	0x40000
alias14:
	.skip	1024
	.align	0x40000
alias15:
	.skip	1024
	.align	0x40000
alias16:
	.skip	1024

user_data_end:
.end


