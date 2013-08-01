/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: memop_mt_fpu_ld_st.s
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
#include "nmacros.h"


	
/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
	ta	T_CHANGE_HPRIV

	! Initialize the global registers.
	mov	%g0, %g1	
	mov	%g0, %g2
	mov	%g0, %g3
	mov	%g0, %g4
	mov	%g0, %g5
	mov	%g0, %g6
	mov	%g0, %g7

	! Set up seperate result data area for each core.
	ta	T_RD_THID
	mov	%o1, %l6
	umul	%l6, 64, %l7
	setx	result_area, %g1, %g3
	add	%l7, %g3, %l7

	! All threads use the same code.

	! Load Store single
single:
	setx	single_data, %g1, %g2
	ld	[%g2], %f0
	fadds	%f0, %f0, %f1
	st	%f1, [%l7]
	mov	%l7, %o0
	call	flush_l2_line
	nop
	ld	[%l7], %g7
	setx	0x40000000, %g1, %g6
	cmp	%g6, %g7
	bne	test_failed
	nop

	! Load Store double
double:
	setx	double_data, %g1, %g2
	ldd	[%g2], %f2
	faddd	%f2, %f2, %f4
	std	%f4, [%l7+0x8]
	mov	%l7, %o0
	add	%o0, 8, %o0
	call	flush_l2_line
	nop
	ldx	[%l7+0x8], %g7
	setx	0x4010000000000000, %g1, %g6
	cmp	%g7, %g6
	bne	test_failed
	nop

	! Load Store FSR

fsr:
	setx	zero_data, %g1, %g2
	ld	[%g2], %fsr
	st	%fsr, [%l7+0x10]
	add	%l7, 0x10, %o0
	call	flush_l2_line
	nop
	ld	[%l7+0x10], %g7
	cmp	%g7, 0
	bne	test_failed
	nop

	! Load Store xFSR
xfsr:
	ldx	[%g2], %fsr
	stx	%fsr, [%l7+0x18]
	add	%l7, 0x18, %o0
	call	flush_l2_line
	nop
	ldx	[%l7+0x18], %g7
	cmp	%g7, 0
	bne	test_failed
	nop	

	! Block Load Store
block:
	setx	block_data, %g1, %g2
	ldda	[%g2]ASI_BLOCK_PRIMARY, %f0
	membar	#Sync
	add	%l7, 0x40, %l7
	stda	%f0, [%l7]ASI_BLOCK_PRIMARY
	membar	#Sync

	ldx	[%l7], %i0
	ldx	[%g2], %o0
	cmp	%i0, %o0
	bne	test_failed
	nop
	ldx	[%l7+0x8], %i1
	ldx	[%g2+0x8], %o1
	cmp	%i1, %o1
	bne	test_failed
	nop
	ldx	[%l7+0x10], %i2
	ldx	[%g2+0x10], %o2
	cmp	%i2, %o2
	bne	test_failed
	nop
	ldx	[%l7+0x18], %i3
	ldx	[%g2+0x18], %o3
	cmp	%i3, %o3
	bne	test_failed
	nop
	ldx	[%l7+0x20], %i4
	ldx	[%g2+0x20], %o4
	cmp	%i4, %o4
	bne	test_failed
	nop
	ldx	[%l7+0x28], %i5
	ldx	[%g2+0x28], %o5
	cmp	%i5, %o5
	bne	test_failed
	nop
	ldx	[%l7+0x30], %i6
	ldx	[%g2+0x30], %o6
	cmp	%i6, %o6
	bne	test_failed
	nop
	ldx	[%l7+0x38], %i7
	ldx	[%g2+0x38], %o7
	cmp	%i7, %o7
	bne	test_failed
	nop

	! Block Store commit
commit:
	add	%g2, 0x40, %g2
	add	%l7, 0x40, %l7
	ldda	[%g2]ASI_BLOCK_PRIMARY, %f0
	membar	#Sync
	stda	%f0, [%l7]ASI_BLK_COMMIT_PRIMARY
	membar	#Sync

	ldx	[%l7], %i0
	ldx	[%g2], %o0
	cmp	%i0, %o0
	bne	test_failed
	nop
	ldx	[%l7+0x8], %i1
	ldx	[%g2+0x8], %o1
	cmp	%i1, %o1
	bne	test_failed
	nop
	ldx	[%l7+0x10], %i2
	ldx	[%g2+0x10], %o2
	cmp	%i2, %o2
	bne	test_failed
	nop
	ldx	[%l7+0x18], %i3
	ldx	[%g2+0x18], %o3
	cmp	%i3, %o3
	bne	test_failed
	nop
	ldx	[%l7+0x20], %i4
	ldx	[%g2+0x20], %o4
	cmp	%i4, %o4
	bne	test_failed
	nop
	ldx	[%l7+0x28], %i5
	ldx	[%g2+0x28], %o5
	cmp	%i5, %o5
	bne	test_failed
	nop
	ldx	[%l7+0x30], %i6
	ldx	[%g2+0x30], %o6
	cmp	%i6, %o6
	bne	test_failed
	nop
	ldx	[%l7+0x38], %i7
	ldx	[%g2+0x38], %o7
	cmp	%i7, %o7
	bne	test_failed
	nop

	! Done

	membar	#Sync
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
	nop

test_failed:
	EXIT_BAD
	nop
user_text_end:	

/************************************************************************
 *  Test case data start
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
single_data:
	.xword 0x3f8000003f800000	! 1.0, 1.0 single precision
double_data:
	.xword 0x4000000000000000	! 2.0 double precision
zero_data:
	.xword 0x0000000000000000
	.align	64			
block_data:
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
	.xword 0x0000000000000000
	.xword 0x0000000000000000
	.align	256
result_area:
	.skip	512		! 64 bytes per core

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
