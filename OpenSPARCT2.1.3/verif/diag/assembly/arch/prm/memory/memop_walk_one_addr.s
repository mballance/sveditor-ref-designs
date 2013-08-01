/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: memop_walk_one_addr.s
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

	! First do for addr[6:0], all in same L2 cache line
byte:
	set	1, %g7			! %g7 = address to use
	stb	%g7, [%g7]		! addr = 0x1
	mov	%g7, %o0		! Now flush that L2 cache line
	call	flush_l2_line
	nop
	ldub	[%g7], %l0
	cmp	%g7, %l0
	bne	test_failed
	nop
halfword:
	sllx	%g7, 1, %g7		! addr = 0x2
	sth	%g7, [%g7]
	mov	%g7, %o0		! Now flush that L2 cache line
	call	flush_l2_line
	nop
	lduh	[%g7], %l0
	cmp	%g7, %l0
	bne	test_failed
	nop
word:
	sllx	%g7, 1, %g7		! addr = 0x4
	stw	%g7, [%g7]
	mov	%g7, %o0		! Now flush that L2 cache line
	call	flush_l2_line
	nop
	lduw	[%g7], %l0
	cmp	%g7, %l0
	bne	test_failed
	nop
doubleword:	
	sllx	%g7, 1, %g7		! addr = 0x8
	stx	%g7, [%g7]
	mov	%g7, %o0		! Now flush that L2 cache line
	call	flush_l2_line
	nop
	ldx	[%g7], %l0
	cmp	%g7, %l0
	bne	test_failed
	nop
	
	sllx	%g7, 1, %g7		! addr = 0x10
	stx	%g7, [%g7]
	mov	%g7, %o0		! Now flush that L2 cache line
	call	flush_l2_line
	nop
	ldx	[%g7], %l0
	cmp	%g7, %l0
	bne	test_failed
	nop
	
	sllx	%g7, 1, %g7		! addr = 0x20
	stx	%g7, [%g7]
	mov	%g7, %o0		! Now flush that L2 cache line
	call	flush_l2_line
	nop
	ldx	[%g7], %l0
	cmp	%g7, %l0
	bne	test_failed
	nop

	
	! Now loop through addr = 0x40 to 0x8-0000-0000 (32 Gbyte)
	! (max. mem. addr. in sim.)
loop:
	setx	0x800000000, %g1, %g6	! %g6 = ending address
loop_top:
	stx	%g7, [%g7]
	mov	%g7, %o0
	call	flush_l2_line
	nop
	ldx	[%g7], %l0
	cmp	%g7, %l0
	bne	test_failed
	nop
	cmp	%g7, %g6
	bne	loop_top
	sllx	%g7, 1, %g7

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
	and	%o0, %g0, %o3
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
.global	single_data
.global	double_data
.global	zero_data
.global	block_data
.global	result_area
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
zero_data:
	.xword 0x0000000000000000
	.align	256

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


